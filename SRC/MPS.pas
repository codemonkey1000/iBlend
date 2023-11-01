unit MPS;

interface
uses
    LionDataModule,System.Variants,
    System.IOUtils, LionSolve, SysUtils, Classes, FMX.Memo, FMX.Dialogs;
type

  TMPS = class(TFUS)
    Procedure ReadMPS(Path: String;Var SolutionMemo: TMemo); //Path not used
    Procedure SaveMPS(gName: String;VAR OutPutMemo: TMemo);
  end;

implementation

Procedure TMPS.SaveMPS;
  var
//    MPS     : TextFile;
    RowType : String;
    Value   : String;
    Line    : String;
    S       : String;
//    Name    : String;
    pBounds : Boolean;
    pRanges : Boolean;
    pRHS    : Boolean;
    I       : Integer;
    J       : Integer;
    K       : Integer;

    Field1 : String; { 2- 3 = 2 -  4}
    Field2 : String; { 5-12 = 8 - 10}
    Field3 : String; {15-22 = 8 - 10}
    Field4 : String; {25-36 =12 - 15}
    Field5 : String; {40-47 = 8 - 10}
    Field6 : String; {50-61 =12 - 15}
    Value4 : Double;
    Value6 : Double;

    procedure SaveToGROUP;
      var
        Loc    : String;
        xName,
        sGroup,
        temp,
        xFields: String;
        xEdit  : Boolean;
        begin
          with DataModule1.MatGroups do begin
            Open;
            xFields:= 'LOC;GROUP';
            Loc:= Location;
            sGroup:=Problem;
            xEdit:= Locate(xFields,VarArrayOf([LOC,sGroup]),[]);
            if xEdit then begin
              Edit;
//              Temp:= OutPutMemo.Lines.;
//              FieldByName('XML').Text:= OutPutMemo.Lines.Text;
              FieldByName('XML').Value:= OutPutMemo.Lines.Text;
              FieldByName('LOC').AsString:= Loc;
              post;
            end else begin
              insert;
              FieldByName('Loc')  .AsString:= Loc;
              FieldByName('Group').AsString:= sGroup;
              FieldByName('XML')  .AsString:= OutPutMemo.Text;
              post;
            end;
//            Post;
          end;
        end;

    procedure ReadFromGroup;
      var
        Loc    : String;
        XML,
        xName,
        sGroup,
        xFields: String;
        xEdit  : Boolean;
        begin
          with DataModule1.GroupsClientDataSet do begin
            Open;
            xFields:= 'LOC;GROUP';
            Loc:= Location;
            xEdit:= Locate(xFields,VarArrayOf([LOC,sGroup]),[]);
            if xEdit then begin
              OutPutMemo.Lines.Add(FieldByName('XML').AsString);

            end else begin
              FieldByName('Loc')  .AsString:= Loc;
              FieldByName('Group').AsString:= sGroup;
              FieldByName('XML')  .AsString:= OutPutMemo.Text;
            end;
            Post;
          end;
        end;

    procedure WriteLN(Line: String);
      begin
        OutPutMemo.Lines.Append(Line);
      end;

    function Left235(Str: String): String;
      begin
        Str:= UpperCase(Trim(Str));
        if Length(Str) > 8 then Str:= Copy(Str,1,8);
        while(Length(Str) < 10) do Str:= Str+ ' ';
        Result:= Str;
      end;

    function Right46(Value: Double): String;
      begin
        Result:= FloatToStrF(Value,ffFixed,6,6);
        if Length(Result) > 12 then Result:= Copy(Result,1,12);
        while(Length(Result) < 12) do Result:= ' '+Result;
        Result:= Result+'   ';
      end;

    function EndOfCard(Row: Integer;var Col: Integer): Boolean;
    // Print one line with a code and one or two restrictions
      var
        I   : Integer;
        J   : Integer;
        First: Boolean;

      begin
       I:= Row;
       J:= 0;
       Field1:= '    ';
       Field2:= Left235(ActCode);
       Value4:= 0.0;
       Value6:= 0.0;
       Col:= 0;
       First:= True;
       RewindRes;
       while not EofRes do begin
         if (B[Row,Col] <> 0.0) then begin
           if First then begin
             Field3:= Left235(ResCode);
             GetBB(Row,Col);
             Value4:= B[Row,Col];
             Field4:= Right46(Value4);
             First:= False;
           end else begin
             Field5:= Left235(ResCode);
             Value6:= B[Row,Col];
             Field6:= Right46(Value6);
             First:= True;
           end;
         end;
         NextRes;
         Inc(Col);

         if ((Value6 = 0.0) and not EofRes) then begin
         end else begin

         if ((Value4 <> 0.0) and (Value6 <> 0.0)) then begin
           WriteLN(Field1+Field2+Field3+Field4+Field5+Field6);
           if EofRes then begin
             Field3:= Left235('COST');
//             Field4:= Right46(ActCost/ActScale);
             Field4:= Right46(ActCost*ActScale);
             Field5:= Left235('PRICE');
//             Field6:= Right46(ActPrice/ActScale);
             Field6:= Right46(ActPrice*ActScale);
             WriteLN(Field1+Field2+Field3+Field4+Field5+Field6);
             Field3:= Left235('SCALE');
             Field4:= Right46(ActScale);
             Field5:= '';
             Field6:= '';
             WriteLN(Field1+Field2+Field3+Field4+Field5+Field6);
           end;
         end else
         if ((Value4 <> 0.0) and (Value6 = 0.0)) then begin
           Field5:= Left235('COST');
//           Field6:= Right46(ActCost/ActScale);
           Field6:= Right46(ActCost*ActScale);
           WriteLN(Field1+Field2+Field3+Field4+Field5+Field6);
           Result:= True;
           Field3:= Left235('PRICE');
//           Field4:= Right46(ActPrice/ActScale);
           Field4:= Right46(ActPrice*ActScale);
           Field5:= Left235('SCALE');
           Field6:= Right46(ActScale);
           WriteLN(Field1+Field2+Field3+Field4+Field5+Field6);
         end;
         Value4:= 0.0;
         Value6:= 0.0;
         Field3:= '';
         Field5:= '';
         Field6:= '';
         First:= True;
        end;
       end;
      end;

    begin
     pBounds:= True;
     pRHS   := True;

//     Path:= ChangeFileExt(Path,'.MPS');
//     Name:= ExtractFileName(Path);
//     I:= POS('.MPS',Name);
//     Field2:= Copy(Name,1,I-1);
     Field2:= gName;
     Field1:= 'NAME';
     while (Length(Field1) < 14) do Field1:= Field1+' ';

     WriteLN(Field1+Field2);

     WriteLN('ROWS');

     RewindRes;
     while not EofRes do begin
//       if LowerBound = UpperBound then RowType:= 'E' else begin
//         RowType:= 'G';
//         if UpperBound < BigNumber then RowType:= 'L';



       RowType:= ResBound;
       if RowType = '' then begin
         RowType:= 'G';
         ResBound:= RowType;
       end;
       WriteLN(' '+RowType+'  '+ResCode);
       NextRes;
     end;
     Line:= ' N  COST';
     WriteLN(Line);
     Line:= ' N  PRICE';
     WriteLN(Line);
     Line:= ' N  SCALE';
     WriteLN(Line);

     writeln('COLUMNS');
     writeln('*234567890123456789012345678901234567890123456789012345678901');
     RewindAct;
     J:= 0;
     I:= 0;
     while not EofAct do begin
       EndOfCard(I,J);
       Inc(I);
       NextAct;
     end;

     RewindRes;
     pRHS:= False;
     while not EofRes do begin
       pRHS:= pRHS or ((ResLower > 0.0) or (ResUpper < BigNumber));
       NextRes;
     end;

     if pRHS then begin
       writeln('*234567890123456789012345678901234567890123456789012345678901');
       writeln('RHS');
       RewindRes;
       Field2:= Left235('RHS1');
       Field4:= '';
       Field5:= '';
       Field6:= '';
       Field1:= '    ';
       RewindRes;
       while not EofRes do begin
//         ResSeek(ResCode);
//         if Seek(ResCode) then begin
         if Seek(ResC[ResNum]) then begin
           Field3:= '';
           Field4:= '';
           Field5:= '';
           Field6:= '';
           Value4:= 0;
           Value6:= 0;
           if (ResBound = 'E') then begin
             Field3:= Left235(ResCode);
             Value4:= LowerBound;
             Field4:= Right46(Value4);
           end else
           if (ResBound = 'G') then begin
             Field3:= Left235(ResCode);
             Value4:= LowerBound;
             Field4:= Right46(Value4);
           end else
           if (ResBound = 'L') then begin
             Field3:= Left235(ResCode);
             Value4:= UpperBound;
             Field4:= Right46(Value4);
           end;
           if ((Field3 <> '') and (Value4 > 0.0)) then

           WriteLN(Field1+Field2+Field3+Field4+Field5+Field6);
         end;
         NextRes;
       end;
     end;
//  RANGES


     RewindRes;
     pRanges:= False;
     while not EofRes do begin
       pRanges:= pRanges or ((ResLower > 0.0) and (ResUpper < BigNumber));
       NextRes;
     end;

//     if pRanges then begin
//       writeln('RANGES');
//     end;
//     RewindRes;
//     pRHS:= False;
//     while not EofRes do begin
//       pRHS:= pRHS or ((ResLower > 0.0) or (ResUpper < BigNumber));
//       NextRes;
//     end;

     if pRanges then begin
       writeln('*234567890123456789012345678901234567890123456789012345678901');
       writeln('RANGES');
       RewindRes;
       Field2:= Left235('RANGE1');
       Field4:= '';
       Field5:= '';
       Field6:= '';
       Field1:= '    ';
       RewindRes;
       while not EofRes do begin
         if ((ResLower > 0.0) and (ResUpper < BigNumber)) then begin
           Field3:= '';
           Field4:= '';
           Field5:= '';
           Field6:= '';
           Value4:= 0;
           Value6:= 0;
           if (ResBound = 'G') then begin
             Field3:= Left235(ResCode);
             Value4:= ResUpper-ResLower;
             Field4:= Right46(Value4);
           end else
           if (ResBound = 'L') then begin
             Field3:= Left235(ResCode);
             Value4:= ResLower-ResUpper;
             Field4:= Right46(Value4);
           end;
           if ((Field3 <> '') and (ABS(Value4) > 0.0)) then

           WriteLN(Field1+Field2+Field3+Field4+Field5+Field6);
         end;
         NextRes;
       end;
     end;

// Bounds
     pBounds:= False;
     RewindAct;
     pBounds:= False;
     while not EofAct do begin
       pBounds:= pBounds or ((ActLower > 0.0) or (ActUpper < BigNumber));
       NextAct;
     end;
     if pBounds then writeln('BOUNDS');

     RewindAct;
     Field2:= '';
     Field5:= '';
     Field6:= '';
     while not EofAct do begin
       Value4:= 0;
       Value6:= 0;
       Field1:= '';
       Field3:= '';
       Field2:= Left235('BND1');
       Field3:= Left235(ActCode);
       Value4:= ActUpper;
       Field4:= Right46(Value4);

       if (ActLower > 0.0) then begin
         Field2:= Left235('BND1');
         Field1:= ' LO ';
         Field3:= Left235(ActCode);
         Value4:= ActLower/ActScale;
         Field4:= Right46(Value4);
       end else
       if (ActUpper < BigNumber) then begin
         Field2:= Left235('BND1');
         Field1:= ' UP ';
         Field3:= Left235(ActCode);
         Value4:= ActUpper/ActScale;
         Field4:= Right46(Value4);
       end;
       if Field3 <> '' then begin
          if ABS(Value4) < BigNumber then
            WriteLN(Field1+Field2+Field3+Field4+Field5+Field6);
       end;
       NextAct;
     end;

     writeln('ENDATA');

     writeln('ROWSCALE');
     writeln('*234567890123456789012345678901234567890123456789012345678901');
     RewindRes;
//     Seek(ResPtr[ResNum]);
     while not EofRes do begin
       Seek(ResPtr[ResNum]);
       Field1:= '    ';
       Field2:= Left235(ResCode);
       if ResLowerPmt then Field3:= 'T   '
                      else Field3:= 'F   ';
       if ResUpperPmt then Field4:= 'T   '
                      else Field4:= 'F   ';
       Field5:= Right46(ResScale);

       S:= IntToStr(ORD(UnitNum));
       while (Length(S)<2) do S:= '0'+S;

       WriteLN(Field1+Field2+Field3+Field4+Field5+' '+S+' '+Name);
       NextRes;
     end;

     writeln('COLSCALE');
     writeln('*234567890123456789012345678901234567890123456789012345678901');
     RewindAct;
     while not EofAct do begin
       Seek(ActPtr[ActNum]);
       Field1:= '    ';
       Field2:= Left235(ActCode);
       if ActLowerPmt then Field3:= 'T   '
                      else Field3:= 'F   ';
       if ActUpperPmt then Field4:= 'T   '
                      else Field4:= 'F   ';
       Field5:= Right46(ActScale);

       S:= IntToStr(ORD(UnitNum));
       while (Length(S)<2) do S:= '0'+S;
       WriteLN(Field1+Field2+Field3+Field4+Field5+' '+S+' '+Name);
       NextAct;
     end;

     writeln('ENDSCALE');
     SaveToGROUP;

//     CloseFile(MPS);
  end;


Procedure TMPS.ReadMPS;
var
  ProblemName,
  ObjName,
  ObjName2,
  ObjName3,
  S,
  S2,
  RowStr,
  ColStr,
  ValStr,
  Line2,
  Line     : String;
  NameNum,
  RowsNum,
  ColsNum,
  RHSNum,
  RangesNum,
  BoundsNum,
  EndNum,
  TempNum,
  RowScaleNum,
  ColScaleNum,
  EndScaleNum,
  LastNum,
  Num,
  I     : Integer;
//  Price,
//  Cost,
  R,
  RNum  : Double;

    procedure ReadFromGroup;
      var
        Loc    : String;
        XML,
        xName,
        sGroup,
        xFields: String;
        xEdit  : Boolean;
        begin

          sGroup:= Problem;
          with DataModule1.MatGroups do begin
            DataModule1.usrpath;
            Open;
            xFields:= 'LOC;GROUP';
            Loc:= Location;
            xEdit:= Locate(xFields,VarArrayOf([LOC,sGroup]),[]);
            if xEdit then begin
              Edit;
              SolutionMemo.Lines.Add(FieldByName('XML').AsString);
            end else begin
              Append;
              FieldByName('Loc')  .AsString:= Loc;
              FieldByName('Group').AsString:= sGroup;
              FieldByName('XML')  .AsString:= SolutionMemo.Text;
            end;
            Post;
          end;
        end;

begin
  ReadFromGroup;
  N:= 0;
  M:= 0;
  Num:= 0;
  NameNum:= SolutionMemo.Lines.Indexof('NAME');
  RowsNum:= SolutionMemo.Lines.Indexof('ROWS');
  ColsNum:= SolutionMemo.Lines.Indexof('COLUMNS');
  RHSNum:= SolutionMemo.Lines.Indexof('RHS');
  RangesNum:= SolutionMemo.Lines.Indexof('RANGES');
  BoundsNum:= SolutionMemo.Lines.Indexof('BOUNDS');
  EndNum:= SolutionMemo.Lines.Indexof('ENDATA');
  RowScaleNum:= SolutionMemo.Lines.Indexof('ROWSCALE');
  ColScaleNum:= SolutionMemo.Lines.Indexof('COLSCALE');
  EndScaleNum:= SolutionMemo.Lines.Indexof('ENDSCALE');
  ObjName:= '';
  ObjName2:= '';
  ObjName3:= '';

  for i := RowsNum+1 to ColsNum-1 do begin
    if SolutionMemo.Lines[i].Substring(0,1) <> '*' then begin
      if (Trim((SolutionMemo.Lines[i].Substring(1,2)))='N') then begin
        if ObjName = '' then ObjName:= SolutionMemo.Lines[i].Substring(4,8);
        if ((ObjName <> '') and (ObjName2 = ''))  then ObjName2:= SolutionMemo.Lines[i+1].Substring(4,8);
        if ((ObjName <> '') and (ObjName2 <> '')) then ObjName3:= SolutionMemo.Lines[i+1].Substring(4,8);
      end else begin
        Line:=  Trim((SolutionMemo.Lines[i  ].Substring(4,8)));
        Line2:= Trim((SolutionMemo.Lines[i+1].Substring(4,8)));
        if (Line<> Line2)then Inc(M);
      end;
    end;
  end;
  ObjName := 'COST';
  ObjName2:= 'PRICE';
  ObjName3:= 'SCALE';
  Line:= '';
  if RHSNum <= 0 then TempNum:= EndNum
                 else TempNum:= RHSNum;
  for i := ColsNum+1 to TempNum-1 do begin
    if SolutionMemo.Lines[i].Substring(0,1) <> '*' then begin
      Line:= SolutionMemo.Lines[i].Substring(4,8);
      Line2:=SolutionMemo.Lines[i+1].Substring(4,8);
      if (Line <> Line2) then Inc(N);
    end;
  end;

//  Dec(M);
  SetLengths(N,M);
  InitLP;

  for i := RowsNum+1 to ColsNum-1 do begin
    if SolutionMemo.Lines[i].Substring(0,1) <> '*' then begin
      if (Trim((SolutionMemo.Lines[i].Substring(1,2)))<>'N') then begin
        RowStr:= Trim(SolutionMemo.Lines[i].Substring(4,8));
        if AddData(True,'001',RowStr,RowStr,0,0,'') then ;
        Bound:= Trim(SolutionMemo.Lines[i].Substring(1,2));
      end;
    end;
  end;

//  M:= M-MM;
//  SetLengths(N,M);
//  InitLP;

//          Field1 : String; { 2- 3 = 2}
//          Field2 : String; { 5-12 = 8}
//          Field3 : String; {15-22 = 8}
//          Field4 : String; {25-36 =12}
//          Field5 : String; {40-47 = 8}
//          Field6 : String; {50-61 =12}

  for i := ColsNum+1 to TempNum-1 do begin
    if SolutionMemo.Lines[i].Substring(0,1) <> '*' then begin
      ColStr:= Trim(SolutionMemo.Lines[i].Substring( 4, 8));
      RowStr:= Trim(SolutionMemo.Lines[i].Substring(14, 8));
      ValStr:= Trim(SolutionMemo.Lines[i].Substring(24, 12));
      AddData(False,'001',ColStr,ColStr,Cost,Price,'');

//      if ((RowStr<>ObjName) and (RowStr<>ObjName2))then begin
      if RowStr=ObjName3 then begin
        InputScale:= StrToFloat(ValStr);
      end else
      if RowStr=ObjName then begin
        Cost:= StrToFloat(ValStr);
      end else
      if RowStr=ObjName2 then begin
        Price:= StrToFloat(ValStr);
      end else
        SetB(ColStr,RowStr,ValStr);
//      end;


      RowStr:= Trim(SolutionMemo.Lines[i].Substring(39, 8));
      if RowStr<>'' then begin
//      if ((RowStr<>ObjName) and (RowStr<>ObjName2))then begin
        ValStr:= Trim(SolutionMemo.Lines[i].Substring(49, 12));
        AddData(False,'001',ColStr,ColStr,0,0,'');
        if RowStr=ObjName3 then begin
          InputScale:= StrToFloat(ValStr);
        end else
        if RowStr=ObjName then begin
          Cost:= StrToFloat(ValStr);
            R:= Cost;
//        end;
        end else
        if RowStr=ObjName2 then begin
          Price:= StrToFloat(ValStr);
        end else
          SetB(ColStr,RowStr,ValStr);
      end;
    end{Comment};
  end {For};
//  end {For};

  if RangesNum <= 0 then TempNum:= BoundsNum
                    else TempNum:= RangesNum;

  if TempNum <= 0 then TempNum:= EndNum;


  if RHSNum > 0  then begin
    for i := RHSNum+1 to TempNum-1 do begin
      if SolutionMemo.Lines[i].Substring(0,1) <> '*' then begin
        RowStr:= Trim(SolutionMemo.Lines[i].Substring( 4, 8));
        ColStr:= Trim(SolutionMemo.Lines[i].Substring(14, 8));
        ValStr:= Trim(SolutionMemo.Lines[i].Substring(24,12));
        TryStrToFloat(ValStr,R);
        if ColStr<>'' then begin
          if Seek('_'+ColStr) then begin
            if Bound = 'G' then
              LowerBound:= R
            else if Bound = 'L' then
              UpperBound:= R
            else if Bound = 'E' then begin
              LowerBound:= R;
              UpperBound:= R;
            end;
          end;
        end;
        ColStr:= Trim(SolutionMemo.Lines[i].Substring(39, 8));
        ValStr:= Trim(SolutionMemo.Lines[i].Substring(49,12));
        TryStrToFloat(ValStr,R);
        if ColStr<>'' then begin
          if Seek('_'+ColStr) then begin
            if Bound = 'G' then
              LowerBound:= R
            else if Bound = 'L' then
              UpperBound:= R
            else if Bound = 'E' then begin
              LowerBound:= R;
              UpperBound:= R;
            end;
          end;
        end;
      end{comment};
    end{for};
  end;
//      end;
  if RangesNum <= 0 then TempNum:= BoundsNum
                    else TempNum:= RangesNum;

  if RangesNum > 0  then begin
    for i := RangesNum+1 to BoundsNum-1 do begin
      if SolutionMemo.Lines[i].Substring(0,1) <> '*' then begin
        RowStr:= Trim(SolutionMemo.Lines[i].Substring( 4, 8));
        ColStr:= Trim(SolutionMemo.Lines[i].Substring(14, 8));
        ValStr:= Trim(SolutionMemo.Lines[i].Substring(24, 12));
        TryStrToFloat(ValStr,R);
        if ColStr<>'' then begin
          if Seek('_'+ColStr) then begin
            if Bound='G' then UpperBound:= LowerBound + R else
            if Bound='L' then LowerBound:= UpperBound + R else
            if Bound='E' then begin
//              LowerBound:= R;
//              UpperBound:= R;
            end;
          end;
        end;
        RowStr:= Trim(SolutionMemo.Lines[i].Substring( 4, 8));
        ColStr:= Trim(SolutionMemo.Lines[i].Substring(39, 8));
        ValStr:= Trim(SolutionMemo.Lines[i].Substring(49, 12));
        TryStrToFloat(ValStr,R);
        if ColStr<>'' then begin
          if Seek('_'+ColStr) then begin
            if Bound='G' then UpperBound:= LowerBound + R else
            if Bound='L' then LowerBound:= UpperBound + R else
            if Bound='E' then begin
//              LowerBound:= R;
//              UpperBound:= R;
            end;
          end;
      end;
      end{comment};
    end{for};
  end;

  if BoundsNum > 0  then begin
    for i := BoundsNum+1 to EndNum-1 do begin
      if SolutionMemo.Lines[i].Substring(0,1) <> '*' then begin
        RowStr:= Trim(SolutionMemo.Lines[i].Substring( 4, 8));
        ColStr:= Trim(SolutionMemo.Lines[i].Substring(14, 8));
        ValStr:= Trim(SolutionMemo.Lines[i].Substring(24, 12));
        TryStrToFloat(ValStr,R);
        if ColStr<>'' then begin
          if Seek(ColStr) then begin
            Bound:= Trim(SolutionMemo.Lines[i].Substring( 1, 2));
            if Bound = 'LO' then LowerBound:= R else
            if Bound = 'UP' then UpperBound:= R else
            if Bound = 'FX' then begin
              LowerBound:= R;
              UpperBound:= R;
            end;
          end;
        end;
        ColStr:= Trim(SolutionMemo.Lines[i].Substring(39, 8));
        ValStr:= Trim(SolutionMemo.Lines[i].Substring(49, 12));
        TryStrToFloat(ValStr,R);
        if ColStr<>'' then begin
          if Seek(ColStr) then begin
            Bound:= Trim(SolutionMemo.Lines[i].Substring( 1, 2));
            if Bound = 'LO' then LowerBound:= R else
            if Bound = 'UP' then UpperBound:= R else
            if Bound = 'FX' then begin
              LowerBound:= R;
              UpperBound:= R;
            end;
          end;
        end;
      end{Comment};
    end{for};
  end{No Bounds};
//  end{ColScale};

  if RowScaleNum > 0  then begin
    for i := RowScaleNum+1 to ColScaleNum-1 do begin
      if Trim(SolutionMemo.Lines[i].Substring(0,1)) <> '*' then begin
        Line:=  SolutionMemo.Lines[i].Trim;
        Line:= SolutionMemo.Lines[i].Substring(4, 8);
        Line:= Trim(Line);
        if Seek('_'+Line) then begin
          Line:= Trim(SolutionMemo.Lines[i].Substring(13, 4));
          if Trim(Line) = '' then begin
            LowerPmt:= False;
            UpperPmt:= False;
          end else begin
            Line:= Trim(SolutionMemo.Lines[i].Substring(13, 4));
            if (Trim(Line) = 'T') then LowerPmt:= True
                                  else LowerPmt:= False;
              Line:= Trim(SolutionMemo.Lines[i].Substring(17, 4));
            if (Trim(Line) = 'T') then UpperPmt:= True
                                  else UpperPmt:= False;
            Line:= Trim(SolutionMemo.Lines[i].Substring(17, 4));
            S:= Trim(SolutionMemo.Lines[i].Substring(23,12));
            S:= Trim(S);
            if (S <> '') then begin
              TryStrToFloat(S,R);
              InputScale:= R;
            end else InputScale:= 100.0;
            Name:= Trim(SolutionMemo.Lines[i].Substring(41,32));
          end;
        end{Seek??};
      end;
    end;
  end;

  if ColScaleNum > 0  then begin
      for i := colScaleNum+1 to EndScaleNum-1 do begin
//S:= SolutionMemo.Lines[i];
      if Trim(SolutionMemo.Lines[i].Substring(0,1)) <> '*' then begin
        Line:= Trim(SolutionMemo.Lines[i].Substring(4, 8));
        if Seek(Line) then begin
          Line:= Trim(SolutionMemo.Lines[i].Substring(13, 4));
          if Trim(Line) = '' then begin
            LowerPmt:= False;
            UpperPmt:= False;
          end else begin
            Line:= Trim(SolutionMemo.Lines[i].Substring(13, 4));
            if (Trim(Line) = 'T') then LowerPmt:= True
                                  else LowerPmt:= False;
              Line:= Trim(SolutionMemo.Lines[i].Substring(17, 4));
            if (Trim(Line) = 'T') then UpperPmt:= True
                                  else UpperPmt:= False;
              Line:= Trim(SolutionMemo.Lines[i].Substring(17, 4));
            S:= Trim(SolutionMemo.Lines[i].Substring(23,12));
            S:= Trim(S);
            if (S <> '') then begin
              TryStrToFloat(S,R);
              InputScale:= R;
            end else begin
             InputScale:= 2000.0;
            end;

            S:= SolutionMemo.Lines[i].Substring(38,2);
            S:= Trim(S);
            if S='' then S:= '0';

            UnitNum:= StrToInt(S);
            Name:= Trim(SolutionMemo.Lines[i].Substring(41,32));
          end;
(*
// 12/21/2017    // Short term fix
          if Cost < 2.00 then begin
            InputScale:= 1.0;
            UnitNum:= 1;
          end;
*)
        end{Seek??};
      end{Comment};
     end{For};
  end{ColScale};

  R:= B[N,M];

  I:= Low(ActPtr);
  I:= High(ActPtr);
  I:= High(ActPtr);

(*
  for i := Low(ActPtr) to High(ActPtr)-1 do begin
    try
    ActRes.Items[ActPtr[i]].Cost := ActRes.Items[ActPtr[i]] .Cost /ActRes.Items[ActPtr[i]].InputScale;
    ActRes.Items[ActPtr[i]].Price:= ActRes.Items[ActPtr[i]].Price/ActRes.Items[ActPtr[i]].InputScale;
    except
     on E: Exception do ShowMessage(E.Message+' Read MPS')
   end;

  end;
*)
//  end;
//  for i := Low(ResPtr) to High(ResPtr) do begin
//    ActRes.Items[ResPtr[i]].Cost := ActRes.Items[ResPtr[i]] .Cost /ActRes.Items[ResPtr[i]].InputScale;
//    ActRes.Items[ResPtr[i]].Price:= ActRes.Items[ResPtr[i]].Price/ActRes.Items[ResPtr[i]].InputScale;
//  end;
//  InputTransform;
end{ReadMPS};

end.
