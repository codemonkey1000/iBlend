 unit LionSolve;
{$DEFINE NewStuff}
{$DEFINE OldStuff}
{$DEFINE Report}
{$DEFINE FMonkey}

interface
uses
  Classes,   System.IOUtils, System.Math,System.Variants,Data.DB,


//  FMX.Memo,
{$IFDEF FMonkey}
  System.SysUtils,System.Generics.Collections, FMX.Memo,FMX.Dialogs;
{$ELSE}
  SysUtils,System.Generics.Collections;
{$ENDIF}

type

  TFUS = class//(TCustomControl)
//    private
    const
      BigNumber       = {1E10;//}Infinity;

    type
      DataType        = Class       { Material group data record }
        LPRow           : Boolean;  {is it a Row 'Restriction'}
        Code            : String;   {Item code-with LPRow _Item not needed}
        Bound           : String;   {E,L,G,N - LO,UP,FX}
        Name            : String;   {Mix sheet name}
        InvoiceName     : String;   {Invoice name}
        Cost            : Double;   { $/unit-Objective}
        Price           : Double;   { $/unit-Objective 2}
        LowerBound      : Double;   {Min units/acre|ton}
        LowerPmt        : Boolean;  {Prompt for Lower Bound}
        UpperBound      : Double;   {Max units/acre|ton}
        UpperPmt        : Boolean;  {Prompt for Upper Bound}
        InputScale      : Double;   {Lbs./FUS unit}
        UnitNum         : Integer;  {UOM}
        Index           : INTEGER;  {Index to array B[I,J]}
        Build           : Boolean;  {Did it NOT come from MPS}
//    Internal usage
        Level           : Double;   {Units/acre|Ton}
        Marginal        : Double;   {Reduction for use}
        Basic           : BOOLEAN;  {In the solution}
        HoldLower       : Double;
        HoldUpper       : Double;
      END;
        ColPtrType      = ARRAY OF String;
        RowPtrType      = ARRAY OF String;

      var
        Act,
        Res,
        TheValue: DataType;
        B       : Array of Array of Double;
        N       : Integer;  {Number of activities   - Rows}
        M       : Integer;  {Number of restrictions - Colunms}
        ActNum  : Integer;
        ResNum  : Integer;
        InputNum: Integer;
        ResRow  : Integer;
        ActRow  : Integer;
        InputCount: Integer;
        TheItem: String;
        ActOrder: Integer;
        ResOrder: Integer;

        Iteration: Integer;
        ActRes      :TObjectDictionary<String,DataType>;
        ResPtr      : Array of String;           { Where matrix column points }
        ActPtr      : Array of String;           { Where matrix row points }
        ResC        : Array of String;           { Where matrix column points }
        ActC        : Array of String;           { Where matrix row points }
        Input       : Array of String;           { Shows on Input Grid }
        Solved,
        gMetric,
        gGradeUsed,
        xXMLGroup,
        Minimize    : Boolean;
//        TraceX,
//        GradeUsed   : Boolean;
//        BND;
        gGradeStr,
        xLanguage,
        xLocation,
        xCompanyID,
        xStoreID,
        ProblemName : String;
{$IFDEF NewStuff}
      Procedure InsCol(Col: Integer;Nut:  String);
      Procedure InsRow(Row: Integer;Item,xName: String;Scale: Double);
      Procedure DelCol(Col: Integer);
      Procedure DelRow(Row: Integer);
      Procedure NutFrom(Insert:Boolean;Row,Col: Integer);
      Function  GetMaxBound: Double;

      Function  GetTotalCost   : Double;
      Function  GetTotalPrice  : Double;
      Function  GetTotalMargin : Double;
{$ENDIF}
      Procedure InputTransform;  // Creates InputScale
      Procedure ShowB;
      PROCEDURE TraceData(I0,J0 : integer; pType : string);
      Function  GetBigNumber   : Double;

      Function  GetMetric      : Boolean;
      Procedure SetMetric(Value: Boolean);
      Function  GetGradeUsed   : Boolean;
      Procedure SetGradeUsed(Value: Boolean);
      Function  GetTrace       : Boolean;
      Procedure SetTrace(Value : Boolean);
      Function  GetBuild       : Boolean;
      Procedure SetBuild(Value : Boolean);
      Function  GetGrade       : Boolean;
      Procedure SetGrade(Value : Boolean);

      Function  GetGradeStr    : String;
      Procedure SetGradeStr(Value : String);

      Function  GetLPRow       : Boolean;
      Procedure SetLPRow(Value : Boolean);
      Function  GetProduct     : Double;
      Function  GetInputNum    : Integer;
      Procedure SetInputNum(Value: Integer);

      Function  GetActNum      : Integer;
      Function  GetResNum      : Integer;
      Procedure SetActNum(Value: Integer);
      Function  GetResRow      : Integer;
      Procedure SetResRow(Value: Integer);
      Procedure SetResNum(Value: Integer);
      Function  GetResScale  : Double;
      Function  GetActScale  : Double;
{$IFDEF OldStuff}
      Function  GetActLowerPmt : Boolean;
      Function  GetActUpperPmt : Boolean;
      Function  GetResLowerPmt : Boolean;
      Function  GetResUpperPmt : Boolean;
      Function  GetActLevel    : Double;
      Function  GetResLevel    : Double;
      Function  GetActMarginal : Double;
      Function  GetResMarginal : Double;
      Function  GetActLower  : Double;
      Function  GetResLower  : Double;
      Function  GetActUpper  : Double;
      Function  GetResUpper  : Double;

      Procedure SetResUpperPmt(Value: Boolean);
      Procedure SetResLowerPmt(Value: Boolean);
      Procedure SetActUpperPmt(Value: Boolean);
      Procedure SetActLowerPmt(Value: Boolean);
      Procedure SetActLower(Value:Double);
      Procedure SetResLower(Value:Double);
      Procedure SetActUpper(Value:Double);
      Procedure SetResUpper(Value:Double);
{$ENDIF}
      Procedure SetActScale(Value: Double);
      Procedure SetResScale(Value: Double);
      Procedure SetActName(Value:String);
      Procedure SetActCode(Value:String);
      Procedure SetResName(Value:String);
      Procedure SetResCode(Value:String);
      Function  GetResBound  : String;
      Procedure SetResBound(Value:String);
      Function  GetActBound  : String;
      Procedure SetActBound(Value:String);

      Function  GetActName     : String;
      Function  GetResName     : String;
      Function  GetActCode     : String;
      Function  GetResCode     : String;
      Function  GetActCost     : Double;
      Function  GetActPrice    : Double;
      Function  GetActBasic    : Boolean;
      Function  GetResBasic    : Boolean;
      Procedure SetActCost(Value:Double);
      Procedure SetActPrice(Value:Double);
      Function  GetRowCode   : String;
      Function  GetColCode   : String;
      Procedure SetRowCode(Value:String);
      Procedure SetColCode(Value:String);

      Function  GetIterations  : string;
      Function  GetObjective   : Double;
      Function  GetName     : String;
      Function  GetInName     : String;
      Procedure SetName(Value: String);
      Procedure SetInName(Value: String);
      Function  GetCode     : String;
      Procedure SetCode(Value: String);
      Function  GetCost     : Double;
      Procedure SetCost(Value: Double);
      Function  GetPrice    : Double;
      Procedure SetPrice(Value: Double);
      Function  GetBasic    : Boolean;
      Procedure SetBasic(Value: Boolean);

      Function  GetLower     : Double;
      Procedure SetLower(Value: Double);
      Function  GetUpper     : Double;
      Procedure SetUpper(Value: Double);
      Function  GetScale     : Double;
      Procedure SetScale(Value: Double);
      Function  GetLowPmt    : Boolean;
      Procedure SetLowPmt(Value: Boolean);
      Function  GetUpPmt    : Boolean;
      Procedure SetUpPmt(Value: Boolean);
      Function  GetUnitNum   : Integer;
      Procedure SetUnitNum(Value: Integer);

      Function  GetLevel     : Double;
      Procedure SetLevel(Value: Double);
      Function  GetMarginal  : Double;
      Procedure SetMarginal(Value: Double);
      Function  GetIndex     : Integer;
      Procedure SetIndex(Value: Integer);
      Function  GetBound     : String;
      Procedure SetBound(Value: String);
      Function  GetHoldLo    : Double;
      Procedure SetHoldLo(Value: Double);
      Function  GetHoldUp    : Double;
      Procedure SetHoldUp(Value: Double);

      Procedure Transform(Row0,Col0: Integer;NewBound: Double);
      Function  ColPivot(Var Row0     : Integer;
                         Var Col0     : Integer;
                         Var ColBound : Double;
                         Var ColOK    : Boolean): Double;
      Function  RowPivot(Var Row0     : Integer;
                         Var Col0     : Integer;
                         Var RowBound : Double;
                         Var RowOK    : Boolean): Double;
    published
{$IFDEF NewStuff}
      Property MaxBound        : Double  read GetMaxBound;

      Property TotalCost       : Double  read GetTotalCost;
      Property TotalPrice      : Double  read GetTotalPrice;
      Property TotalMargin     : Double  read GetTotalMargin;
{$ENDIF}
      Property GradeUsed       : Boolean read GetGradeUsed write SetGradeUsed;
      Property GradeStr        : String  read GetGradeStr  write SetGradeStr;
      Property Metric          : Boolean read GetMetric write SetMetric;
      Property LPRow           : Boolean read GetLPRow write SetLPRow;
      Property Build           : Boolean read GetBuild write SetBuild;
      Property Name            : String  read GetName   write SetName;  {Mix sheet name}
      Property InvoiceName     : String  read GetInName write SetInName;  {Invoice name}
      Property Code            : String  read GetCode   write SetCode;  {Item code}
      Property Cost            : Double  read GetCost   write SetCost;   { $/unit-Objective}
      Property Price           : Double  read GetPrice  write SetPrice;   { $/unit-Objective 2}
      Property LowerBound      : Double  read GetLower  write SetLower;   {Min units/acre|ton}
      Property UpperBound      : Double  read GetUpper  write SetUpper;   {Max units/acre|ton}
      Property InputScale      : Double  read GetScale  write SetScale;   {Lbs./FUS unit}
      Property LowerPmt        : Boolean read GetLowPmt write SetLowPmt;
      Property UpperPmt        : Boolean read GetUpPmt  write SetUpPmt;
      Property UnitNum         : Integer read GetUnitNum write SetUnitNum;
      //    Internal usage
      Property Level           : Double  read GetLevel write SetLevel;   {Units/acre|Ton}
      Property Marginal        : Double  read GetMarginal write SetMarginal;   {Reduction for use}
      Property Basic           : BOOLEAN read GetBasic  write SetBasic;  {In the solution}
      Property Index           : INTEGER read GetIndex  write SetIndex;  {Index to array}
      Property Bound           : String  read GetBound  write SetBound;   {E,L,G,N}
      Property HoldLower       : Double  read GetHoldLo write SetHoldLo;
      Property HoldUpper       : Double  read GetHoldUp write SetHoldUp;
      property IsSolved    : Boolean read Solved;
      property Problem     : String read ProblemName write ProblemName;
      property Location    : String read xLocation write xLocation;
      property XMLGroup    : Boolean read xXMLGroup write xXMLGroup;
      property CompanyID   : String read xCompanyID write xCompanyID;
      property StoreID     : String read xStoreID write xStoreID;
      property Language    : String read xLanguage write xLanguage;
      property NumAct      : Integer read N;
      property NumRes      : Integer read M;
      property rInputCount : Integer read InputCount;

      property Iterations  : String read GetIterations;
      property ObjValue    : Double read GetObjective;
      property ObjMinimize : Boolean read Minimize;

      property Trace       : Boolean read GetTrace write SetTrace;
      property RowCode     : String read GetRowCode write SetRowCode;
      property ColCode     : String read GetColCode write SetColCode;
      property Product     : Double read GetProduct;
      property BigNum      : Double read GetBigNumber;
      property rInputNum   : Integer read GetInputNum write SetInputNum;
      property rResRow     : Integer read GetResRow write SetResRow;
      property rActNum     : Integer read GetActNum write SetActNum;
      property rResNum     : Integer read GetResNum write SetResNum;
      property ActBound    : String read GetActBound write SetActBound;
      property ActName     : String read GetActName write SetActName;
      property ActCode     : String read GetActCode write SetActCode;
      property ResName     : String read GetResName write SetResName;
      property ResCode     : String read GetResCode write SetResCode;
      property ActScale    : Double read GetActScale write SetActScale;
      property ResScale    : Double read GetResScale write SetResScale;
      property ActCost     : Double read GetActCost write SetActCost;
      property ActPrice    : Double read GetActPrice write SetActPrice;

{$IFDEF OldStuff}
      property ActLowerPmt : Boolean read GetActLowerPmt write SetActLowerPmt;
      property ActUpperPmt : Boolean read GetActUpperPmt write SetActUpperPmt;
      property ResLowerPmt : Boolean read GetResLowerPmt write SetResLowerPmt;
      property ResUpperPmt : Boolean read GetResUpperPmt write SetResUpperPmt;
      property ActLower    : Double read GetActLower write SetActLower;
      property ActUpper    : Double read GetActUpper write SetActUpper;
      property ActLevel    : Double read GetActLevel;
      property ActMarginal : Double read GetActMarginal;
      property ActBasic    : Boolean read GetActBasic;

      property ResLower    : Double read GetResLower write SetResLower;
      property ResUpper    : Double read GetResUpper write SetResUpper;
      property ResLevel    : Double read GetResLevel;
      property ResMarginal : Double read GetResMarginal;
      property ResBasic    : Boolean read GetResBasic;
      property ResBound    : String read GetResBound write SetResBound;
{$ENDIF}
    public
{$IFDEF NewStuff}
//      Property TotalCost       : Double  read GetTotalCost;
//      Property TotalPrice      : Double  read GetTotalPrice;
//      Property TotalMargin     : Double  read GetTotalMargin;
{$ENDIF}

      Procedure BuildInput;
      Procedure InputFirst;
      Procedure InputNext;
      Function  InputCode(Row: Integer): String;
      Function  InputEof: Boolean;


      Procedure SetRow(Row : Integer);
      Procedure SetCol(Col : Integer);
      Procedure SetRowPtr(Row : Integer);
      Procedure SetColPtr(Col : Integer);
      Procedure SetBB(Row,Col: Integer;Value: Double);
      Function  GetBB(Row, Col: Integer): Double;

      Procedure ActFirst;
      Procedure ActNext;
      Function  ActEof  : Boolean;
      Function  ActValue: Double;
      Function  ActID   : String;
      Function  ActUnit : Integer;

      Procedure ResFirst;
      Procedure ResNext;
      Function  ResEof  : Boolean;
      Function  ResValue: Double;
      Function  ResID(Value: Integer)   : String;
      Function  ResUnit : Integer;
{$IFDEF OldStuff}
      Procedure ResRowFirst;
      Procedure ResRowNext;
      Function  ResRowCode: String;
      Function  ResRowEof: Boolean;

      Function  ActMixed: Boolean;
      Function  ActSeek(Code: String): Boolean;

      Function  ResMixed: Boolean;
      Function  ResSeek(Code: String): Boolean;
{$ENDIF}
      Procedure HoldBounds;
      Procedure ReStoreBounds;
      Procedure RewindAct;
      Procedure NextAct;
      Function  EofAct : Boolean;
      Procedure RewindRes;
      Procedure NextRes;
      Function  EofRes : Boolean;
      Function  TheResCode(Row: Integer): String;
      Function  TheActCode(Row: Integer): String;
      Function  Seek(Code: String): Boolean;
      Function  SeekResNum(Code: String): Integer;
      Function  SeekActNum(Code: String): Integer;
      Function  Restriction(Code: String): Boolean;
      Function  IsBasic(Code: String): Boolean;

      Function  ItemUnique(Restriction: Boolean;Item: String): Integer;
      Procedure SetRes;
      Function  AddData(Restriction: Boolean;Loc,Item,Name: String;Cost,Price: Double;Bound: String): Boolean;
      Function  AddRes(ResCode: String;Bound: String): Boolean;
      Procedure SetB(ActCode: String;ResCode: String;Value: String);
      Procedure InitLP;
      Procedure InitLPData(MPS: Boolean);
      Procedure SetLengths(NumActX: Integer;NumResX: Integer);
      Function  InputFactor(Row,Col: String): Double;

      Function  Solve: Boolean;
      PROCEDURE ReportSol(Report: TStringList);
  end;

implementation

uses LionDataModule;

Var
  Memo  : TStringList;
  xLocation,
  gLine : String;
  xXMLGroup : Boolean;
  TraceX: Boolean;

{$IFDEF NewStuff}
Procedure TFUS.DelRow(Row: Integer);
  var
    I       : Integer;
    J       : Integer;
    NewLen  : Integer;
  Begin
    for I:= Row+1 to High(ActPtr) do begin
      ActPtr[I-1]:= ActPtr[I];
      ActC  [I-1]:= ActC  [I];
    end;

    for I:= Row+1 to High(ActPtr) do begin
      for J:= Low(ActPtr) to High(ActPtr) do begin
        B[I-1,J]:= B[I,J];
      end;
    end;

    NewLen:= Length(ActPtr);
    Dec(NewLen);
    SetLength(ActPtr,NewLen);
    N:= High(ActPtr)+1;
    M:= High(ResPtr)+1;
    SetLength(B,N,M);
  End;

Procedure TFUS.InsCol;
  var
    Key,
    Fields,
    Loc,
    NewName,
    TagName,
    RowCode,
    ColCode,
    NewCode : String;
    Value   : Double;
    Num     : Integer;
    NewLen  : Integer;
    H       : Integer;
    J       : Integer;
    I       : Integer;
    R       : Integer;
    C       : Integer;
    L       : Integer;
    Data    : DataType;
    NN      : Integer;
    MM     : Integer;
  begin
    NewCode:= DataModule1.TagClientDataSet.FieldByName('Code').AsString;
    NewName:= DataModule1.TagClientDataSet.FieldByName('MixName').AsString;
    TagName:= DataModule1.TagClientDataSet.FieldByName('TagName').AsString;

    NewLen:= Length(ResPtr);
    NewLen:= NewLen+1;

    SetLength(ResPtr,NewLen);
    SetLength(ResC,NewLen);
    N:= High(ActPtr)+1;
    M:= High(ResPtr)+1;
    SetLength(B,N,M);

    H:= High(ResPtr);
    L:= Low(ResPtr);

    for J := High(ResPtr)-1 downto Col do begin
      ResPtr[J+1]:= ResPtr[J];
      ResC  [J+1]:= ResC[J];
    end;

    ResPtr[Col]:= '_'+Nut;
    ResC  [Col]:= '_'+Nut;

      for I := Low(ActPtr) to High(ActPtr) do begin
        for J := High(ResPtr)-1 downto Col do begin
          B[I,J+1]:= B[I,J];
        end;
      end;
    if AddData(True,Location,Nut,NewName,0,0,Bound) then;

    Fields:= 'LOC;ITEM';
    Loc:= Location;
    J:= Col;
    for I := Low(ActPtr) to High(ActPtr) do begin
      RowCode:= ActPtr[I];

      if DataModule1.ItemClientDataSet.Locate(Fields,VarArrayOf([Loc,RowCode]),[]) then begin
        if DataModule1.MyFertClientDataSet.Locate(Fields,VarArrayOf([Loc,RowCode]),[]) then begin
          Value:= DataModule1.MyFertClientDataSet.FieldByName(Nut).AsFloat;
          B[I,J]:= Value/InputScale;
        end else begin
          B[I,J]:= 0.0;
        end;
      end;
    end;
//    if AddData(True,Location,Nut,NewName,0,0,Bound) then;
  end;


Procedure TFUS.InsRow(Row: Integer;Item,xName: String;Scale: Double);
  var
    I       : Integer;
    J       : Integer;
    NewLen  : Integer;
    Nut,
    S       : String;
    Good    : Boolean;
    InSc,
    Temp    : Double;
    xFields : String;
  Begin
    Good:= True;
    S:= Item;
    NewLen:= Length(ActPtr);
    Inc(NewLen);
    SetLength(ActPtr,NewLen);
    SetLength(ActC  ,NewLen);
    N:= High(ActPtr)+1;
    M:= High(ResPtr)+1;
    SetLength(B,N,M);

    for I:= High(ActPtr) Downto Row do begin
      ActPtr[I]:= ActPtr[I-1];
      ActC  [I]:= ActC  [I-1];
    end;

    ActPtr[Row]:= Item;
    ActC[Row]  := Item;

    for I:= High(ActPtr) Downto Row do begin
      for J:= Low(ResPtr) to High(ResPtr) do begin
        B[I,J]:= B[I-1,J];
      end;
    end;

    for J:= Low(ResPtr) to High(ResPtr) do begin
      Good:= True;
      Nut:= ResPtr[J];
      System.Delete(Nut,1,1);
      Good:= (Nut <> 'DEN');// and (Nut <> 'WT');
      if Good then begin
        if Nut = 'WT' then Temp:= 1.0 else
        Temp:= DataModule1.MyFertClientDataSet.FieldByName(Nut).AsFloat/100.0;
        B[Row,J]:= Temp;
        SetBB(Row,J,Temp);
      end;
    end;
      with DataModule1.ItemClientDataSet do begin
        InSc:= FieldByName('FUSLBS').AsFloat;
        Cost:= FieldByName('FUSCost').AsFloat/InSc;
        Price:= FieldByName('Price1').AsFloat/InSc;
        UnitNum:= FieldByName('FUSUOM').AsInteger;
      end;
      BOUND:= 'G';
      if AddData(False,Location,Item,xName,Cost,Price,Bound) then;
//    end;
End;


Procedure TFUS.DelCol(Col: Integer);
  var
    I       : Integer;
    H       : Integer;
    L       : Integer;
    J       : Integer;
    NewLen  : Integer;
  Begin
    H:= High(ResPtr);
    L:= Low(ResPtr);

    for J := Col+1 to H do begin
        ResPtr[J-1]:= ResPtr[J];
        ResC  [J-1]:= ResC[J];
    end;

    for I := Low(ActPtr)to High(ActPtr) do begin
      for J := Col+1 to H do begin
        B[I,J-1]:= B[I,J];
      end;
    end;

    NewLen:= Length(ResPtr);
    Dec(NewLen);
    SetLength(ResPtr,NewLen);
    SetLength(ResC,NewLen);
    SetLength(B,N+1,NewLen);
  End;

Procedure TFUS.NutFrom(Insert:Boolean;Row,Col: Integer);
  var
    Key,
    Fields,
    Loc,
    NewName,
    ColCode,
    NewCode : String;
    Value   : Double;
    Num     : Integer;
    NewLen  : Integer;
    H       : Integer;
    J       : Integer;
    I       : Integer;
    R       : Integer;
    C       : Integer;
    L       : Integer;
    Data    : DataType;
    NN      : Integer;
    MM     : Integer;
  begin
    NN:= N;
    MM:= M;
    ColCode:= ResPtr[Col];
    Delete(ColCode,1,1);
    RowCode:= ActPtr[Row];
    NewCode:= '_'+ColCode+RowCode;
    NewName:= ColCode+' from '+RowCode;

    if (Length(NewCode) > 8) then NewCode:= Copy(NewCode,1,8);
    Key:= NewCode;

    Fields:= 'LOC;ITEM';
    Loc:= Location;
    if DataModule1.ItemClientDataSet.Locate(Fields,VarArrayOf([Loc,RowCode]),[]) then
      Value:= DataModule1.MyFertClientDataSet.FieldByName(ColCode).AsFloat;
      Value:= Value/InputScale;
    NewLen:= Length(ResPtr);
    Inc(NewLen);

    SetLength(ResPtr,NewLen);
    SetLength(ResC,NewLen);
    N:= High(ActPtr)+1;
    M:= High(ResPtr)+1;
    SetLength(B,N,M);

    H:= High(ResPtr);
    L:= Low(ResPtr);

//  J is Col
    for J := M downto Col do begin
      ResPtr[J-1]:= ResPtr[J];
      ResC  [J-1]:= ResC[J];
    end;
    ResPtr[Col+1]:= NewCode;
    ResC  [Col+1]:= NewCode;

      for I := 0 to N do begin
        for J := M downto Col do begin
          B[I,J-1]:= B[I,J];
        end;
      end;

      for I:= 0 to N do begin
        B[I,Col+1]:= 0.0;
      end;
    B[Row, Col+1]:= Value;

    if not ActRes.TryGetValue(Key,Data) then begin
      Data:= DataType.Create;
      Data.LPRow:= True;
      Data.Name:= NewName;
      Data.Code:= NewCode;
      Data.UpperBound:= BigNumber;
      Data.LowerBound:= 0.0;
      Data.Cost:= Cost;
      Data.Price:= Price;
      Data.Level:= 0.0;
      Data.Marginal:= 0.0;
      Data.Basic:= False;
      Data.Index:= Num;
      Data.Bound:= '';
      Data.LowerPmt:= True;
      Data.UpperPmt:= False;
      Data.InputScale:= 100.0;
    end;
    ActRes.AddOrSetValue(Key,Data);
    TheValue:= Data;
    TheItem:= Key;
  end;

Function  TFUS.GetMaxBound;
  var
    Row : Integer;
    Col : Integer;
    J   : Integer;
    I   : Integer;
    A   : Double;
    E   : Double;
    ActName,
    ResName: String;
  begin
  exit;
    for I := Low(ActC) to High(ActC)-1 do begin
      Col:= ActRes.Items[ActPtr[I]].Index;
      if ActRes.Items[ActPtr[I]].Basic then begin
        for J := Low(ResC) to High(ResC)-1 do begin
          Row:= ActRes.Items[ResPtr[J]].Index;
          ResName:= ActRes.Items[ActPtr[I]].Name;
          ActName:= ActRes.Items[ResPtr[J]].Name;
          E:= B[Row,Col]*ActRes.Items[ActPtr[I]].Level*2000.0;
        end;
      end;
    end;
  end;

  Function  TFUS.GetTotalCost   : Double;
    var
      I     : Integer;
    begin
      if Iteration <= 0 then begin
        Result:= 220.0;
        exit;
      end else begin
        Result:= 0.0;
        For I:= Low(ActC) to High(ActC) do begin
          Seek(ActC[I]);
          if Level > 0.0 then
            Result:= Result+Level*Cost*InputScale;
        end;
      end;
   end;

  Function  TFUS.GetTotalPrice  : Double;
    var
      I     : Integer;
    begin
      if Iteration <= 0 then begin
        Result:= 250.0;
        exit;
      end else begin
        Result:= 0.0;
        For I:= Low(ActC) to High(ActC) do begin
          Seek(ActC[I]);
          if Level > 0.0 then
            Result:= Result+Level*Price*InputScale;
        end;
      end;
    end;

  Function  TFUS.GetTotalMargin : Double;
    begin
      if Iteration <= 0 then begin
        Result:= 20.5;
        exit;
      end else begin
        Result:= ((TotalPrice-TotalCost)/TotalPrice)*100.0;
      end;
    end;
{$ENDIF}

  Function  TFUS.GetMetric      : Boolean;
    begin
      Result:= gMetric;
    end;

  Procedure TFUS.SetMetric(Value: Boolean);
    begin
      gMetric:= Value;
    end;

  Function  TFUS.GetGradeUsed   : Boolean;
    begin
      Result:= gGradeUsed;
    end;

  Procedure TFUS.SetGradeUsed(Value: Boolean);
    begin
      gGradeUsed:= Value;
    end;

  Function  TFUS.GetGradeStr   : String;
  var
    N,
    p,
    K,
    Ca,
    Mg,
    S,
    Cl,
    B,
    Cu,
    Fe,
    Mn,
    Zn,
    Mo  : String;
//    Procedure AddToGrade( );
    begin
      Result:= '';
      if Seek('_N') then
        N:= FloatToStrF((Level/Product)*100.0,ffFixed,2,0) else  N:= '0';
        Result:= N+'-';
      if Seek('_P') then
        P:= FloatToStrF((Level/Product)*100.0,ffFixed,2,0) else  P:= '0';
        Result:= Result+ P+'-';
      if Seek('_K') then
        K:= FloatToStrF((Level/Product)*100.0,ffFixed,2,0) else  K:= '0';
        Result:= Result+ K+'-';

      if Seek('_CA') then begin
        Ca:= FloatToStrF((Level/Product)*100.0,ffFixed,2,2);
        if (Level>0) then Result:= Result+ Ca+' Ca-';
      end;
      if Seek('_MG') then begin
        Mg:= FloatToStrF((Level/Product)*100.0,ffFixed,2,2);
        if (Level>0) then Result:= Result+ Mg+' Mg-';
      end;
      if Seek('_S') then begin
        S:= FloatToStrF((Level/Product)*100.0,ffFixed,2,2);
        if (Level>0) then Result:= Result+ S+' S-';
      end;
//      if Seek('_CL') then begin
//        Ca:= FloatToStrF((Level/Product)*100.0,ffFixed,2,2);
//        Result:= Result+ Ca+' Ca-';
//      end;
      if Seek('_B') then begin
        B:= FloatToStrF((Level/Product)*100.0,ffFixed,2,2);
        if (Level>0) then Result:= Result+ B+' B-';
      end;
      if Seek('_CU') then begin
        Cu:= FloatToStrF((Level/Product)*100.0,ffFixed,2,2);
        if (Level>0) then Result:= Result+ Cu+' Cu-';
      end;
      if Seek('_FE') then begin
        Fe:= FloatToStrF((Level/Product)*100.0,ffFixed,2,2);
        if (Level>0) then Result:= Result+ Fe+' Fe-';
      end;
      if Seek('_MN') then begin
        Mn:= FloatToStrF((Level/Product)*100.0,ffFixed,2,2);
        if (Level>0) then Result:= Result+ Mn+' Mn-';
      end;
      if Seek('_ZN') then begin
        Zn:= FloatToStrF((Level/Product)*100.0,ffFixed,2,2);
        if (Level>0) then Result:= Result+ Zn+' Zn-';
      end;
      if Seek('_MO') then begin
        Mo:= FloatToStrF((Level/Product)*100.0,ffFixed,2,2);
        if (Level>0) then Result:= Result+ Mo+' Mo-';
      end;
      if (Result[Length(Result)] = '-') then Delete(Result,Length(Result),1);

      GradeStr:= Result;
    end;

  Procedure TFUS.SetGradeStr(Value: String);
    begin
      gGradeStr:= Value;
    end;

  Function  TFUS.GetActBound  : String;
    begin
      Result:= ActRes.Items[ActPtr[ActNum]].Bound;
    end;

  Function  TFUS.GetActName;
    begin
      Result:= ActRes.Items[ActPtr[ActNum]].Name;
    end;

  Function  TFUS.GetResName;
    begin
      Result:= ActRes.Items[TheItem].Name;
      Result:= ActRes.Items[ResPtr[ResNum]].Name;
    end;

  Function  TFUS.GetActCode;
    begin
      Result:= ActRes.Items[ActPtr[ActNum]].Code;
    end;

  Function  TFUS.GetResCode;
    begin
      Result:= ActRes.Items[ResPtr[ResNum]].Code;
      if (POS('_',Result)>0) then Delete(Result,1,1);
    end;


  Procedure TFUS.InitLPData;
    var
      I,J : Integer;
    begin
      if MPS then begin
        AddRes('WT','WEIGHT');

      end else begin
        AddData(True,'001','WT','WEIGHT',0,0,'E');
        AddData(False,'001','PRODUCT','Product',0,0,'LO');
      end;
      ResPtr[High(ResPtr)]:= '_WT';
      ResC[High(ResPtr)]  := '_WT';
      ActPtr[High(ActPtr)]:= 'PRODUCT';
      ActC[High(ActPtr)]  := 'PRODUCT';
      for I := Low(ActPtr) to High(ActPtr) do begin
        for J := Low(ResPtr) to High(ResPtr) do begin
          B[I,J]:= 0.0
        end;
        B[I,High(ResPtr)]:= 1.0
      end;
      B[High(ActPtr),High(ResPtr)]:= -1.0;
    end;

  Function  TFUS.SeekResNum(Code: String): Integer;
    var
      i : Integer;
    begin
      Result:= -1;
      for i := Low(ResPtr) to High(ResPtr) do
      if (UpperCase(Code) = UpperCase(ResPtr[i])) then Result:= i;
    end;

  Function  TFUS.SeekActNum(Code: String): Integer;
    var
      i : Integer;
    begin
      Result:= -1;
      for i := Low(ActPtr) to High(ActPtr) do
      if (UpperCase(Code) = UpperCase(ActPtr[i])) then Result:= i;
    end;

  Function  TFUS.GetBuild    : Boolean;
  begin
    Result:= ActRes.Items[TheItem].Build;
  end;

  Procedure TFUS.SetBuild(Value : Boolean);
    begin
      ActRes.Items[TheItem].Build:= Value;
    end;

  Function  TFUS.TheResCode(Row: Integer): String;
  begin
    Result:= ResPtr[Row];
  end;

Function  TFUS.TheActCode(Row: Integer): String;
  begin
    Result:= ActPtr[Row];
  end;

Function  TFUS.GetLPRow    : Boolean;
  begin
    Result:= ActRes.Items[TheItem].LPRow;
  end;

Procedure TFUS.SetLPRow(Value: Boolean);
  begin
    ActRes.Items[TheItem].LPRow:= Value;
  end;

Function  TFUS.GetGrade    : Boolean;
  var
    B : Boolean;
    R : Double;
  begin
    Seek('PRODUCT');
    R:= ActRes.Items[TheItem].LowerBound;
    Result:= (R=1.0);
  end;

Procedure TFUS.SetGrade(Value: Boolean);
  begin
    Seek('PRODUCT');
    if Value then begin
      ActRes.Items[TheItem].LowerBound:= 1.0;
      ActRes.Items[TheItem].UpperBound:= 1.0;
    end else begin
      ActRes.Items[TheItem].LowerBound:= 0.0;
      ActRes.Items[TheItem].UpperBound:= BigNumber;
    end;
  end;

Function  TFUS.GetName     : String;
  begin
//    if ActRes.TryGetValue('Name',TheValue) then
      Result:= ActRes.Items[TheItem].Name
//    else Result:= '';
  end;

Procedure TFUS.SetName(Value: String);
  begin
    ActRes.Items[TheItem].Name:= Value;
  end;

Function  TFUS.GetInName     : String;
  begin
//    if ActRes.TryGetValue('Name',TheValue) then
      Result:= ActRes.Items[TheItem].InvoiceName
//    else Result:= '';
  end;

Procedure TFUS.SetInName(Value: String);
  begin
    ActRes.Items[TheItem].InvoiceName:= Value;
  end;

Function  TFUS.GetCode     : String;
  begin
//    if ActRes.TryGetValue('Code',TheValue) then
      Result:= ActRes.Items[TheItem].Code;
      Result:= Trim(Result);
      if (POS('_',Result)>0) then Delete(Result,1,1);
//    else Result:= '';
  end;

Procedure TFUS.SetCode(Value: String);
  begin
    if (POS('_',TheItem)=1) then Value:= '_'+Value;
    ActRes.Items[TheItem].Code:= Value;
  end;

Function  TFUS.GetCost     : Double;
  begin
    Result:= ActRes.Items[TheItem].Cost;
  end;

Procedure TFUS.SetCost(Value: Double);
  begin
    ActRes.Items[TheItem].Cost:= Value;
  end;

Function  TFUS.GetPrice    : Double;
  begin
    Result:= ActRes.Items[TheItem].Price;
  end;

Procedure TFUS.SetPrice(Value: Double);
  begin
    ActRes.Items[TheItem].Price:= Value;
  end;

Function  TFUS.GetBasic    : Boolean;
  begin
    Result:= ActRes.Items[TheItem].Basic;
  end;

Procedure TFUS.SetBasic(Value: Boolean);
  begin
    ActRes.Items[TheItem].Basic:= Value;
  end;

Function  TFUS.InputFactor(Row,Col: String): Double;
  var
    RowScale : Double;
    ColScale : Double;
    TempData : DataType;
  begin
    TempData:= TheValue;
    Seek(Row);
    RowScale:= ActRes.Items[TheItem].InputScale;
    Seek(Col);
    ColScale:= ActRes.Items[TheItem].InputScale;
    Result:= RowScale/ColScale;
    TheValue:= TempData;
  end;

Function  TFUS.GetLower     : Double;
  begin
    Result:= ActRes.Items[TheItem].LowerBound;
  end;

Procedure TFUS.SetLower(Value: Double);
  begin
    ActRes.Items[TheItem].LowerBound:= Value;
  end;

Function  TFUS.GetUpper     : Double;
  begin
    Result:= ActRes.Items[TheItem].UpperBound
  end;

Procedure TFUS.SetUpper(Value: Double);
  begin
    ActRes.Items[TheItem].UpperBound:= Value;
  end;

Function  TFUS.GetScale     : Double;
  begin
    Result:= ActRes.Items[TheItem].InputScale
  end;

Procedure TFUS.SetScale(Value: Double);
  begin
    ActRes.Items[TheItem].InputScale:= Value;
  end;

Function  TFUS.GetLowPmt    : Boolean;
  begin
    Result:= ActRes.Items[TheItem].LowerPmt;
  end;

Procedure TFUS.SetLowPmt(Value: Boolean);
  begin
    ActRes.Items[TheItem].LowerPmt:= Value;
  end;

Function  TFUS.GetUpPmt    : Boolean;
  begin
    Result:= ActRes.Items[TheItem].UpperPmt;
  end;

Procedure TFUS.SetUpPmt(Value: Boolean);
  begin
    ActRes.Items[TheItem].UpperPmt:= Value;
  end;

Function  TFUS.GetUnitNum   : Integer;
  begin
    Result:= ActRes.Items[TheItem].UnitNum;
  end;

Procedure TFUS.SetUnitNum(Value: Integer);
  begin
    ActRes.Items[TheItem].UnitNum:= Value;
  end;


Function  TFUS.GetLevel     : Double;
  begin
    Result:= ActRes.Items[TheItem].Level;
  end;

Procedure TFUS.SetLevel(Value: Double);
  begin
    ActRes.Items[TheItem].Level:= Value;
  end;

Function  TFUS.GetMarginal  : Double;
  begin
    Result:= ActRes.Items[TheItem].Marginal;
  end;

Procedure TFUS.SetMarginal(Value: Double);
  begin
    ActRes.Items[TheItem].Marginal:= Value;
  end;

Function  TFUS.GetIndex     : Integer;
  begin
    Result:= ActRes.Items[TheItem].Index;
  end;

Procedure TFUS.SetIndex(Value: Integer);
  begin
    ActRes.Items[TheItem].Index:= Value;
  end;

Function  TFUS.GetBound     : String;
  begin
    Result:= ActRes.Items[TheItem].Bound;
  end;

Procedure TFUS.SetBound(Value: String);
  begin
    ActRes.Items[TheItem].Bound:= Value;
  end;

Function  TFUS.GetHoldLo    : Double;
  begin
    Result:= ActRes.Items[TheItem].HoldLower;
  end;

Procedure TFUS.SetHoldLo(Value: Double);
  begin
    ActRes.Items[TheItem].HoldLower:= Value;
  end;

Function  TFUS.GetHoldUp    : Double;
  begin
    Result:= ActRes.Items[TheItem].HoldUpper;
  end;

Procedure TFUS.SetHoldUp(Value: Double);
  begin
    ActRes.Items[TheItem].HoldUpper:= Value;
  end;


Procedure TFUS.InputFirst;
  begin
    InputNum:= 0;
  end;

Procedure TFUS.InputNext;
  begin
    Inc(InputNum);
  end;

Function  TFUS.InputCode(Row: Integer): String;
  begin
    Result:= Input[Row];
  end;

Function  TFUS.InputEof: Boolean;
  begin
    Result:= (InputNum >= High(Input))
  end;

Procedure TFUS.ActFirst;
  begin
    ActOrder:= Low(Input);
  end;

Procedure TFUS.ActNext;
  begin
    Inc(ActOrder);
  end;

Function  TFUS.ActEof;
  begin
    Result:= (ActOrder > High(ActPtr)-1);
  end;

Function  TFUS.ActValue: Double;
  begin
    if ActSeek(ActID) then begin
      Result:= ActRes.Items[ActC[ActOrder]].Level;
    end;
  end;

Function  TFUS.ActID   : String;
  begin
    Result:= ActC[ActOrder];
  end;

Function  TFUS.ActUnit : Integer;
  begin
    Result:= ActRes.Items[ActC[ActOrder]].UnitNum;
  end;

Procedure TFUS.ResFirst;
  begin
    ResOrder:= 0;
  end;

Procedure TFUS.ResNext;
  begin
    Inc(ResOrder);
  end;

Function  TFUS.ResEof;
  begin
    Result:= (ResOrder >= High(ResC));
  end;

Function  TFUS.ResValue: Double;
  begin
    if Seek(ResID(ResOrder)) then begin
//      Result:= ActRes.Items[ResC[ResOrder]].Level;
      Result:= ActRes.Items[TheItem].Level;
    end;
  end;

Function  TFUS.ResID(Value: Integer)   : String;
  begin
    Result:= ResC[Value];
  end;

Function  TFUS.ResUnit : Integer;
  begin
    Result:= ActRes.Items[TheItem].UnitNum;
  end;

{$IFDEF OldStuff}
Procedure TFUS.ResRowFirst;
  begin
    ResRow:= 0;
  end;

Procedure TFUS.ResRowNext;
  begin
    Inc(ResRow);
  end;

Function  TFUS.ResRowCode: String;
  begin
    Result:= ResPtr[ResRow];
  end;

Function  TFUS.ResRowEof: Boolean;
  begin
    Result:= (ResRow > High(ResPtr))
  end;


{$ENDIF}

{$Region 'Trace'}
PROCEDURE TFUS.ShowB;
  var
    S,
    Field : String;
//    i,j   : Integer;
    Col : Integer;
    Row : Integer;
    R     : Double;

    function WriteCenter(Num: String;W: Integer): String;
      var
        i : Integer;
      begin
        Result:= Num;
        if Length(Result) > W then Result:= Copy(Result,1,W);
        i:= (W-Length(Result)) div 2;
        while Length(Result) < i do Result:= ' '+Result;
        while Length(Result) < W do Result:= Result+' ';
      end;

    function WriteReal(Num: Double;W,D: Integer): String;
      begin
        Result:= FloatToStrF(Num,ffNumber,W,D);
        if Num >= 0 then Result:= ' '+Result;
        if Length(Result) > W then Result:= Copy(Result,1,W);
        while Length(Result) < W do Result:= ' '+Result;
      end;

    function WriteLeft(Num: String;W: Integer): String;
      begin
        Result:= Num;
        if Length(Result) > W then Result:= Copy(Result,1,W);
        while Length(Result) < W do Result:= Result+' ';
      end;

      begin
        Field:= '          ';
        for Col:= Low(ResC) to High(ResC) do begin
            Field:= Field+WriteCenter(ResPtr[Col],8);
        end;
        Memo.Append(Field);

        for Row:= Low(ActC) to High(ActC) do begin
          Field:= WriteLeft(ActPtr[Row],8);
          for Col:= Low(ResC) to High(ResC) do begin
            Field:= Field+WriteReal(B[Row,Col],8,4);
          end;
          Memo.Append(Field);
        end;
      end;

PROCEDURE TFUS.TraceData(I0,J0 : integer; pType : string);
   VAR
      J,
      I       : INTEGER;
      Sum,
      Total   : Double;
      TempStr,
      Field   : String;

  PROCEDURE gWriteStr(Line: String);
     BEGIN
       gLine:= gLine+Line;
     END;

  PROCEDURE gWriteLine(Line: String);
     BEGIN
       gLine:= gLine+Line;
       Memo.Append(gLine);
       gLine:= '';
     END;

    function WriteLeft(Num: String;W: Integer): String;
      begin
        Result:= Num;
        if Length(Result) > W then Result:= Copy(Result,1,W);
        while Length(Result) < W do Result:= Result+' ';
      end;

    function WriteRight(Num: String;W: Integer): String;
      begin
        Result:= Num;
        if Length(Result) > W then Result:= Copy(Result,1,W);
        while Length(Result) < W do Result:= ' '+Result;
      end;

    function WriteReal(Num: Double;W,D: Integer): String;
      begin
        Result:= FloatToStrF(Num,ffNumber,W,D);
        if Num >= 0 then Result:= ' '+Result;
        if Length(Result) > W then Result:= Copy(Result,1,W);
        while Length(Result) < W do Result:= ' '+Result;
      end;

   BEGIN
     Field:= IntToStr(Iteration);
     IF Solved THEN Field:= CONCAT('Print final iteration # ',Field)
               ELSE Field:= CONCAT('Print iteration # ',Field);
     Field:= CONCAT(Field,'? Y');
     IF True{(RspChr IN ['Y','y'])} THEN BEGIN
        gWriteLine('');
        gWriteLine(CONCAT('Material Group Name: ',Problem));
        gWriteLine('');
        Field:= IntToStr(Iteration);
        Field:= CONCAT('Iteration # =>',Field);
        Field:= CONCAT(Field,'   ');
        gWriteStr(Field);
        gWriteLine(CONCAT('    ',PType));

        IF (I0 >= 0) THEN BEGIN
           Field:= IntToStr(I0);
           Field:= CONCAT('Pivot point => (',Field);
           Field:= CONCAT(Field,',');
           TempStr:= IntToStr(J0);
           Field:= CONCAT(Field,TempStr);
           Field:= CONCAT(Field,')');
           Field:= Name;
           IF I0 >= 0 THEN gWriteStr(CONCAT('Row: ',ResPtr[I0]))
                      ELSE gWriteStr('No Row');
           gWriteStr('  &  ');
           IF J0 >= 0 THEN gWriteStr(CONCAT('Col: ',ActPtr[J0]))
                      ELSE gWriteStr('No Column');
        END ELSE gWriteStr(' Final Matrix');
        gWriteLine('');
        gWriteLine('');
     END;
  END;

procedure TFUS.ReportSol;
var
  Path  : String;
//  Ext   : String;

  PROCEDURE gWriteLine(Line: String);
     BEGIN
       gLine:= gLine+Line;
       Memo.Append(gLine);
       gLine:= '';
     END;

  PROCEDURE gWriteStr(Line: String);
     BEGIN
       gLine:= gLine+Line;
     END;

    function WriteLeft(Num: String;W: Integer): String;
      begin
        Result:= Num;
        if Length(Result) > W then Result:= Copy(Result,1,W);
        while Length(Result) < W do Result:= Result+' ';
      end;

    function WriteRight(Num: String;W: Integer): String;
      begin
        Result:= Num;
        if Length(Result) > W then Result:= Copy(Result,1,W);
        while Length(Result) < W do Result:= ' '+Result;
      end;

    function WriteReal(Num: Double;W,D: Integer): String;
      begin
        Result:= FloatToStrF(Num,ffNumber,W,D);
        if Length(Result) > W then Result:= Copy(Result,1,W);
        while Length(Result) < W do Result:= ' '+Result;
      end;

   VAR
      I       : INTEGER;
      Sum,
      Total   : Double;
      TempStr,
      Field   : string;

   BEGIN
      Path:= TPath.GetDocumentsPath+PathDelim+'LionSoftware'+
                                    PathDelim+'LionBlend'+PathDelim;
      IF True{(RspChr IN ['Y','y'])} THEN BEGIN
         gWriteLine('');
         gWriteStr('Restriction Name');
         gWriteStr('  Lower Bound  ');
         gWriteStr('    Level      ');
         gWriteStr('  Upper Bound  ');
         gWriteLine(' Marginal ');
         for I:= Low(ActPtr) to High(ActPtr) do begin
            if Seek(ActPtr[I]) then begin
            Field:= Name;
               if Length(Field) > 16 then Field:= Copy(Field,1,16);
            while Length(Field) < 16 do Field:= Field+ ' ';
            gWriteStr(Field);
            IF LowerBound > -BigNumber
               THEN Field:= LowerBound.ToString
               ELSE Field:= '   -Infinity  ';
               if Field = '0' then Field:= '   Zero       ';
               if Length(Field) > 14 then Field:= Copy(Field,1,14);
               while Length(Field) < 14 do Field:= ' '+Field;
               gWriteStr(CONCAT(Field,'>'));

               IF ABS(Level) > 0.0
               THEN Field:= Level.ToString
               ELSE Field:= '      Zero    ';
               if Field = '0' then Field:= '   Zero       ';
               if Length(Field) > 14 then Field:= Copy(Field,1,14);
               while Length(Field) < 14 do Field:= ' '+Field;
              gWriteStr(CONCAT(Field,'>'));

            IF UpperBound <  BigNumber
               THEN Field:= UpperBound.ToString
               ELSE Field:= '    Infinity  ';
               if Field = '0' then Field:= '   Zero       ';
               if Length(Field) > 14 then Field:= Copy(Field,1,14);
               while Length(Field) < 14 do Field:= ' '+Field;
               gWriteStr(CONCAT(Field,' '));

            Field:= Marginal.ToString;
               if Field = '0' then Field:= '   Zero       ';
               if Length(Field) > 14 then Field:= Copy(Field,1,14);
               while Length(Field) < 14 do Field:= ' '+Field;
               gWriteLine(Field);
            end;
         END {while};
         gWriteLine('');
         gWriteLine('');
         gWriteLine('');
         gWriteStr(' Activity Name  ');
         gWriteStr('  Lower Bound  ');
         gWriteStr('    Level      ');
         gWriteStr('  Upper Bound  ');
         gWriteLine(' Marginal ');
         for I:= Low(ResPtr) to High(ResPtr) do begin
            if Seek(ResPtr[I]) then begin
            Field:= Name;
               if Length(Field) > 16 then Field:= Copy(Field,1,16);
            while Length(Field) < 16 do Field:= Field+ ' ';
            gWriteStr(Field);

            IF LowerBound > -BigNumber
               THEN Field:= LowerBound.ToString
               ELSE Field:= '   -Infinity  ';
               if Field = '0' then Field:= '   Zero       ';
               if Length(Field) > 14 then Field:= Copy(Field,1,14);
               while Length(Field) < 14 do Field:= ' '+Field;
               gWriteStr(CONCAT(Field,'>'));

            IF ABS(Level) > 0.0
               THEN Field:= Level.ToString
               ELSE Field:= '      Zero    ';
            while Length(Field) < 14 do Field:= ' '+Field;
               if Length(Field) > 14 then Field:= Copy(Field,1,14);
            gWriteStr(CONCAT(Field,'>'));

            IF UpperBound <  BigNumber
               THEN Field:= UpperBound.ToString
               ELSE Field:= '    Infinity  ';
            while Length(Field) < 14 do Field:= ' '+Field;
               if Length(Field) > 14 then Field:= Copy(Field,1,14);
            gWriteStr(CONCAT(Field,' '));

            Field:= Marginal.ToString;
            while Length(Field) < 14 do Field:= ' '+Field;
               if Length(Field) > 14 then Field:= Copy(Field,1,14);
            gWriteLine(Field);
            end;
         END {while};
       END;
       Memo.SaveToFile(Path+'Report.txt');
    END;
{$EndRegion}


{$Region 'LP Control'}
      Procedure TFUS.SetLengths;
      var
        i : Integer;
        j : Integer;
      begin
          SetLength(ActPtr,0);   //Rows in B[N,M]
          SetLength(ResPtr,0);   //Cols in B[N,M]
          SetLength(ActC,0);
          SetLength(ResC,0);
          SetLength(B,0,0);

          SetLength(ActPtr,NumActX);   //Rows in B[N,M]
          SetLength(ResPtr,NumResX);   //Cols in B[N,M]
          SetLength(ActC,NumActX);
          SetLength(ResC,NumResX);
          SetLength(B,NumActX,NumResX);
          ActNum:= Low(ActC)-1;
          ResNum:= Low(ResC)-1;
          for i:= Low(ActC) to High(ActC)-1 do
          for j:= Low(ResC) to High(ResC)-1 do B[i,j]:= 0.0;
      end;

      Procedure TFUS.InitLP;
        begin
          if Iteration>0 then begin


          end;
          ResNum:= Low(ResPtr)-1;
          ActNum:= Low(ActPtr)-1;
          N:= High(ActPtr);
          M:= High(ResPtr);
          Minimize:= True;
          ProblemName:= Problem;
          Iteration:= 0;
          Solved:= True;
          if Assigned(ActRes) then ActRes.Free;
          ActRes:= TObjectDictionary<String,DataType>.Create;
        end;

      Procedure TFUS.SetRow;
        begin
          ActNum:= Row;
        end;

      Procedure TFUS.SetCol;
        begin
          ResNum:= Col;
        end;

      Procedure TFUS.SetRowPtr;
        var
          Code : String;
        begin
          Code:= ActPtr[Row];
          Seek(Code);
        end;

      Procedure TFUS.SetColPtr;
        Var
          Code : String;
        begin
          Code:= ResPtr[Col];
          Seek(Code);
        end;

{ $IFDEF OldStuff}
{ $ENDIF}

      Function  TFUS.GetResBound  : String;
        begin
          Result:= ActRes.Items[ResPtr[ResNum]].Bound;
        end;

      Function  TFUS.GetActScale;
        begin
          Result:= ActRes.Items[ActPtr[ActNum]].InputScale;
        end;

      Function  TFUS.GetResScale;
        begin
          Result:= ActRes.Items[ResPtr[ResNum]].InputScale;
        end;

      Procedure  TFUS.SetActScale;
        begin
          ActRes.Items[ActPtr[ActNum]].InputScale:= Value;
        end;

      Procedure  TFUS.SetResScale;
        begin
          ActRes.Items[ResPtr[ResNum]].InputScale:= Value;
        end;

      Procedure TFUS.SetResBound(Value:String);
        begin
          ActRes.Items[ResPtr[ResNum]].Bound:= Trim(Value);
        end;

      Procedure TFUS.SetActBound(Value:String);
        begin
          ActRes.Items[ActPtr[ActNum]].Bound:= Trim(Value);
        end;

      Procedure TFUS.SetActName(Value:String);
        begin
          ActRes.Items[ActPtr[ActNum]].Name:= Trim(Value);
        end;

      Procedure TFUS.SetActCode(Value:String);
        begin
          ActRes.Items[ActPtr[ActNum]].Code:= Trim(Value);
        end;

      Procedure TFUS.SetResName(Value:String);
        begin
          ActRes.Items[ResPtr[ResNum]].Name:= Trim(Value);
        end;

      Procedure TFUS.SetResCode(Value:String);
        begin
          Value:= Trim(Value);
          if (POS('_',Value)=0) then Value:= '_'+Value;
          ActRes.Items[ResPtr[ResNum]].Code:= Value;
        end;
{ $ENDIF}
   Function TFUS.GetActNum: Integer;
      Begin
        Result:= ActNum;
      End;

   Function TFUS.GetResNum: Integer;
      Begin
        Result:= ResNum;
      End;

   Procedure TFUS.SetActNum;
      Begin
        ActNum:= Value;
      End;

   Procedure TFUS.SetResNum;
      Begin
        ResNum:= Value;
      End;

   Function TFUS.GetResRow: Integer;
      Begin
        Result:= ResRow;
      End;

   Procedure TFUS.SetResRow;
      Begin
        ResRow:= Value;
      End;

      Procedure TFUS.SetRowCode(Value:String);
        begin
          ActRes.Items[ActPtr[ActNum]].Code:= UpperCase(Trim(Value));
        end;

      Procedure TFUS.SetColCode(Value:String);
        begin
          if (POS('_',Value)<>0) then Value:= '_'+Value;
          ActRes.Items[ResPtr[ResNum]].Code:= Value;
        end;

      Function TFUS.GetColCode:String;
        begin
          Result:= ActRes.Items[ResPtr[ResNum]].Code;
          if (POS('_',Result)<>0) then Delete(Result,1,1);

        end;

      Function  TFUS.GetRowCode  : String;
        begin
          Result:= ActRes.Items[ActPtr[ActNum]].Code;
        end;

      Function  TFUS.GetProduct;
        begin
          Result:= ActRes.Items['PRODUCT'].Level;
          if (Result<=0.0) then Result:= 2000.0;
        end;

      Function  TFUS.ItemUnique(Restriction: Boolean;Item: String): Integer;
            var
              i     : Integer;
              Res,
              Match : Boolean;
              Key   : String;
        begin
          if Restriction then Key:= '_'+Item
                         else Key:= Item;
          Match:= False;
          Result:= -1;
          if Restriction then begin
            for i := Low(ResPtr) to High(ResPtr)-1 do begin
              Match:= (Match or (Key = ResPtr[i]));
              if Match then Result:= i;
            end;
          end else begin
            for i := Low(ActPtr) to High(ActPtr)-1 do begin
              Match:= (Match or (Key = ActPtr[i]));
              if Match then Result:= i;
            end;
          end;
      end;

      Procedure  TFUS.SetRes;
        begin
          with DataModule1.TagClientDataSet do begin
            First;
            RewindRes;
            while not Eof do begin
              if FieldByName('ActiveIngredient').AsBoolean then begin
                 NextRes;
              end;
              Next;
            end;
          end;

          with DataModule1.ItemClientDataSet do begin
            First;
            RewindAct;
            while not Eof do begin
              if FieldByName('HAZARDOUS').AsBoolean then begin
                NextAct;
              end;
              Next;
            end;
            Next;    //for Product
          end;

          SetLengths(ActNum+1,ResNum);


          with DataModule1.TagClientDataSet do begin
            First;
            RewindRes;
            while not Eof do begin
              if FieldByName('ActiveIngredient').AsBoolean then begin
                ResPtr[ResNum]:= DataModule1.TagClientDataSet.FieldByName('Code').AsString;
                NextRes;
              end;
              Next;
            end;
          end;

          with DataModule1.ItemClientDataSet do begin
            First;
            RewindAct;
            while not Eof do begin
              if FieldByName('HAZARDOUS').AsBoolean then begin
                ActPtr[ActNum]:= DataModule1.ItemClientDataSet['Item'].AsString;
                NextAct;
              end;
              Next;
            end;
            ActPtr[ActNum]:= 'PRODUCT';    //for Product
          end;
        end;

      Function  TFUS.AddData(Restriction: Boolean;Loc,Item,Name: String;Cost,Price: Double;Bound: String): Boolean;
        var
          Data : DataType;
          i,
          Num  : Integer;
          Key  : String;

        begin
//      Assumes InitLP was called First "ActRes not nill
(* *)
//          Item:= UpperCase(Item);
          if Restriction then begin
            if (POS('_',Item)=0) then Key:= '_'+Item
                                 else Key:= Item;
            Num:=SeekResNum(Key);
            if Num<0 then begin
              NextRes;
              Num:=ResNum;
              ResPtr[Num]:= Key;
              ResC[Num]  := Key;
            end;
          end else begin
            Key:= Item;
            Num:=SeekActNum(Key);
            if Num<0 then begin
              NextAct;
              Num:= ActNum;
              ActPtr[Num]:= Key;
              ActC[Num]  := Key;
            end;
          end;
          if not ActRes.TryGetValue(Key,Data) then begin
            Result:= True;
            Data:= DataType.Create;
            Data.LPRow:= Restriction;
            Data.Name:= Name;
            Data.Code:= Item;
            Data.UpperBound:= BigNumber;
            Data.LowerBound:= 0.0;
            Data.Cost:= Cost;
            Data.Price:= Price;
            Data.Level:= 0.0;
            Data.Marginal:= 0.0;
            Data.Basic:= False;
            Data.Index:= Num;
            Data.Bound:= '';
            Data.LowerPmt:= Restriction;
            Data.UpperPmt:= False;
            Data.InputScale:= 1.0;
  //            Fertilizer Only
            if Restriction then begin
              Data.InputScale:= 100.0;
              if Key = '_WT' then begin
                Data.LowerPmt:= False;
                Data.InputScale:= 1.0;
                Data.UpperBound:= 0.0;
                Data.LowerBound:= 0.0;
              end;
            end else begin
              Data.InputScale:= 2000.0;
              if Key = 'PRODUCT' then begin
                Data.InputScale:= 1.0;
                Data.UpperBound:= 0.0;
                Data.LowerBound:= 0.0;
              end;
            end;
            Result:= False;
          end;
          ActRes.AddOrSetValue(Key,Data);
          TheValue:= Data;
          TheItem:= Key;
        end;

      Function  TFUS.AddRes(ResCode: String;Bound: String): Boolean;
        var
          Res : DataType;
        begin
          Inc(ResNum);
          ResPtr[ResNum]:= '_'+ResCode;
          ResC[ResNum]:= '_'+ResCode;
          if ActRes.TryGetValue(ResPtr[ResNum],Res) then begin
            ActRes.Items[ResC[ResNum]].LPRow:= True;
            ActRes.Items[ResC[ResNum]].Name:= ResCode;
            ActRes.Items[ResC[ResNum]].Code:= ResCode;
            ActRes.Items[ResC[ResNum]].UpperBound:= BigNumber;
            ActRes.Items[ResC[ResNum]].LowerBound:= 0.0;//-BigNumber;
            ActRes.Items[ResC[ResNum]].Cost:= 0.0;
            ActRes.Items[ResC[ResNum]].Price:= 0.0;
            ActRes.Items[ResC[ResNum]].Level:= 0.0;
            ActRes.Items[ResC[ResNum]].Marginal:= 0.0;
            ActRes.Items[ResC[ResNum]].Basic:= False;
            ActRes.Items[ResC[ResNum]].Build:= True;
            ActRes.Items[ResC[ResNum]].Index:= ResNum;
            ActRes.Items[ResC[ResNum]].Bound:= Bound;
            if ResCode = '_WT' then begin
              ActRes.Items[ResC[ResNum]].InputScale:= 1.0;
              ActRes.Items[ResC[ResNum]].UpperBound:= 0.0;
              ActRes.Items[ResC[ResNum]].LowerBound:= 0.0;
            end else
            ActRes.Items[ResC[ResNum]].InputScale:= 100.0;
          end else begin
            Res:= DataType.Create;
            try
              Res.LPRow:= True;
              Res.Name:= ResCode;
              Res.Code:= ResCode;
              Res.UpperBound:= BigNumber;
              Res.LowerBound:= 0.0;//-BigNumber;
              Res.Cost:= 0.0;
              Res.Price:= 0.0;
              Res.Level:= 0.0;
              Res.Marginal:= 0.0;
              Res.Basic:= False;
              Res.Build:= True;
              Res.Index:= ResNum;
              Res.Bound:= Bound;
              if ResCode = 'WT' then begin
                Res.InputScale:= 1.0;
                Res.UpperBound:= 0.0;
                Res.LowerBound:= 0.0;
              end else
              Res.InputScale:= 100.0;
              ActRes.AddOrSetValue(ResC[ResNum],Res);
            finally
//              Res.Free;
            end;
          end;
        end;

      Procedure TFUS.SetB(ActCode: String;ResCode: String;Value: String);
        var
          Act : DataType;
          Res : DataType;
          R   : Double;
        begin
            if (ActRes.TryGetValue('_'+ResCode,Res) and
               (ActRes.TryGetValue(ActCode,Act))) then begin
              Value:= Trim(Value);
              if TryStrToFloat(Value,R) then begin
                B[Act.Index,Res.Index]:= R;
              end;
            end;
//          end;
        end;

   Function TFUS.GetBigNumber: Double;
      Begin
        Result:= BigNumber;
      End;

   Function TFUS.GetInputNum: Integer;
      Begin
        Result:= InputNum;
      End;

   Procedure TFUS.SetInputNum;
      Begin
        InputNum:= Value;
      End;

{$IFDEF OldStuff}
   FUNCTION  TFUS.ActSeek;
      BEGIN
        Code:= UpperCase(Trim(Code));
        Result:= ActRes.TryGetValue(Code,Act);
        if Result then ActNum:= Act.Index;
      END;

   FUNCTION  TFUS.ResSeek;
      BEGIN
        Code:= UpperCase(Trim(Code));
        Result:= ActRes.TryGetValue(Code,Res);
        if not Result then
        Result:= ActRes.TryGetValue('_'+Code,Res);
        if Result then ResNum:= ABS(Res.Index);
      END;
{$ENDIF}
   FUNCTION  TFUS.ResMixed;
      BEGIN
        Result:= True;
      END;

      Procedure TFUS.SetActLower;
        begin
          ActRes.Items[ActPtr[ActNum]].LowerBound:= Value;
        end;

      Procedure TFUS.SetActCost;
        begin
          ActRes.Items[ActPtr[ActNum]].Cost:= Value;
        end;

      Procedure TFUS.SetActPrice;
        begin
          ActRes.Items[ActPtr[ActNum]].Price:= Value;
        end;

      Procedure TFUS.SetActLowerPmt;
        begin
          ActRes.Items[ActPtr[ActNum]].LowerPmt:= Value;
        end;

      Procedure TFUS.SetActUpperPmt;
        begin
          ActRes.Items[ActPtr[ActNum]].UpperPmt:= Value;
        end;

      Procedure TFUS.SetResLowerPmt;
        begin
          ActRes.Items[ResPtr[ResNum]].LowerPmt:= Value;
        end;

      Procedure TFUS.SetResUpperPmt;
        begin
          ActRes.Items[ResPtr[ResNum]].UpperPmt:= Value;
        end;

      Procedure TFUS.SetResLower;
        begin
          ActRes.Items[ResPtr[ResNum]].LowerBound:= Value;
        end;

      Procedure TFUS.SetResUpper;
        begin
          ActRes.Items[ResPtr[ResNum]].UpperBound:= Value;
        end;

      Procedure TFUS.SetActUpper;
        begin
          ActRes.Items[ActPtr[ActNum]].UpperBound:= Value;
        end;

      Function  TFUS.GetActBasic    : Boolean;
        begin
          Result:= ActRes.Items[ActPtr[ActNum]].Basic;
        end;

      Function  TFUS.GetResBasic    : Boolean;
        begin
          Result:= ActRes.Items[ResPtr[ResNum]].Basic;
        end;

   Function TFUS.GetActCost: Double;
      Begin
        Result:= ActRes.Items[ActPtr[ActNum]].Cost;
      End;

   Function TFUS.GetActPrice: Double;
      Begin
        Result:= ActRes.Items[ActPtr[ActNum]].Price;
      End;

   Function TFUS.GetActLower: Double;
      Begin
        Result:= ActRes.Items[ActPtr[ActNum]].LowerBound;
      End;

   FUNCTION  TFUS.GetActUpper;
      BEGIN
        Result:= ActRes.Items[ActPtr[ActNum]].UpperBound;
      END;

   FUNCTION  TFUS.GetResLower;
      BEGIN
        Result:= ActRes.Items[ResPtr[ResNum]].LowerBound;
      END;

   Function TFUS.GetActLowerPmt;
      Begin
        Result:= ActRes.Items[ActPtr[ActNum]].LowerPmt;
      End;

   FUNCTION  TFUS.GetActUpperPmt;
      BEGIN
        Result:= ActRes.Items[ActPtr[ActNum]].UpperPmt;
      END;

   FUNCTION  TFUS.GetResLowerPmt;
      BEGIN
        Result:= ActRes.Items[ResPtr[ResNum]].LowerPmt;
      END;

   FUNCTION  TFUS.GetResUpperPmt;
      BEGIN
        Result:= ActRes.Items[ResPtr[ResNum]].UpperPmt;
      END;

   FUNCTION  TFUS.GetResUpper;
      BEGIN
        Result:= ActRes.Items[ResPtr[ResNum]].UpperBound;
      END;

   Function  TFUS.GetActLevel    : DOUBLE;
      Begin
          Result:= ActRes.Items[ActPtr[ActNum]].Level;
{Not good! Level for Acre-mode is total for order Grade-mode Lbs/Ton}
      End;

      Function  TFUS.GetActMarginal : Double;
      Begin
        Result:= ActRes.Items[ActPtr[ActNum]].Marginal;
      End;

      Function  TFUS.GetResMarginal : Double;
      Begin
        Result:= ActRes.Items[ResPtr[ResNum]].Marginal;
      End;

   Function  TFUS.GetResLevel    : DOUBLE;
      Begin
        Result:= ActRes.Items[ResPtr[ResNum]].Level;
//        Result:= ActRes.Items[ResC[ResNum]].Level;
      End;

   FUNCTION  TFUS.ActMixed;
      BEGIN
        Result:= True;
      END;

{ $ENDIF}
    Function  TFUS.GetTrace       : Boolean;
      begin
        Result:= TraceX;
      end;

    Procedure TFUS.SetTrace(Value : Boolean);
      begin
        TraceX:= Value;
      end;

   Function TFUS.GetBB;
   var
     R : Double;
     Error : Boolean;
   begin
     Error:= False;
     if (Row > High(ActPtr)) then begin
       Error:= True;
       ShowMessage('Row '+IntToStr(Row)+' Exceeds '+
                          IntToStr(High(ActPtr)));
     end;
     if (Col > High(ResPtr)) then begin
       Error:= True;
       ShowMessage('Column '+IntToStr(Col)+' Exceeds '+
                             IntToStr(High(ResPtr)));
       Result:= 123.0;
     end;
     if Not Error then begin
       ResNum:= Col;
       ActNum:= Row;
       Result:= B[Row,Col];
     end;
   end;

   Procedure TFUS.SetBB(Row, Col: Integer; Value: Double);
   begin
     if N > 0 then begin
       B[Row,Col]:= Value;
     end;
   end;

   Procedure TFUS.HoldBounds;
      VAR
        I : Integer;
      BEGIN
        for I := Low(ResPtr) to High(ResPtr) do begin
          ActRes.Items[ResPtr[I]].HoldLower:=
          ActRes.Items[ResPtr[I]].LowerBound;
          ActRes.Items[ResPtr[I]].HoldUpper:=
          ActRes.Items[ResPtr[I]].UpperBound;
        end;
        for I := Low(ActPtr) to High(ActPtr) do begin
          ActRes.Items[ActPtr[I]].HoldLower:=
          ActRes.Items[ActPtr[I]].LowerBound;
          ActRes.Items[ActPtr[I]].HoldUpper:=
          ActRes.Items[ActPtr[I]].UpperBound;
        end;
      END;

   Procedure TFUS.RestoreBounds;
      VAR
        I : Integer;
      BEGIN
        for I := Low(ResPtr) to High(ResPtr) do begin
          ActRes.Items[ResPtr[I]].LowerBound:=
          ActRes.Items[ResPtr[I]].HoldLower;
          ActRes.Items[ResPtr[I]].UpperBound:=
          ActRes.Items[ResPtr[I]].HoldUpper;
        end;
        for I := Low(ActPtr) to High(ActPtr) do begin
          ActRes.Items[ActPtr[I]].LowerBound:=
          ActRes.Items[ActPtr[I]].HoldLower;
          ActRes.Items[ActPtr[I]].UpperBound:=
          ActRes.Items[ActPtr[I]].HoldUpper;
        end;
      END;

   PROCEDURE TFUS.RewindAct;
      BEGIN
         ActNum:= Low(ActPtr);
      END;

   PROCEDURE TFUS.RewindRes;
      BEGIN
         ResNum:= Low(ResPtr);
      END;

   PROCEDURE TFUS.NextAct;
      BEGIN
        Inc(ActNum);
      END;

   PROCEDURE TFUS.NextRes;
      BEGIN
        Inc(ResNum);
      END;

   FUNCTION TFUS.EofAct;
      BEGIN
         Result:= (ActNum > High(ActPtr));
      END;

   FUNCTION TFUS.EofRes;
      BEGIN
         Result:= (ResNum > High(ResPtr));
      END;

   Function  TFUS.GetIterations;
      Begin
        Result:= IntToStr(Iteration);
      End;

   Function  TFUS.GetObjective    : DOUBLE;
     var
       i : Integer;
      Begin
        Result:= 0.0;
        for i:= Low(ActPtr) to High(ActPtr) do begin
          Result:= Result+((ActRes.Items[ActC[i]].Level)*ActRes.Items[ActC[i]].Cost);
        end;
      End;

   FUNCTION  TFUS.Seek(Code: String): Boolean;
     var
       i  : Integer;
     Procedure Good;
       begin
          if not ActRes.Items[TheItem].LPRow then begin
                                 ActNum:= ABS(ActRes.Items[TheItem].Index);
                                 Act:= TheValue;
                               end else begin
                                 ResNum:= ABS(ActRes.Items[TheItem].Index);
                                 Res:= TheValue;
                               end;
       end;

      BEGIN
        TheItem:= 'Error';
        if Code='' then begin
          Result:= False;
        end else begin
          TheItem:= Code;
          Result:= ActRes.TryGetValue(Code,TheValue);
          if Result then Good
          else begin
            Result:= ActRes.TryGetValue('_'+Code,TheValue);
            TheItem:= '_'+Code;
          end;
          if Result then Good;
        end;
      END;

   FUNCTION  TFUS.Restriction(Code: String): Boolean;
      BEGIN
        Result:= (ActRes.Items[TheItem].Index < 0);
      END;

   Procedure TFUS.BuildInput;
     var
       Row,
       Col,
       Count : Integer;
//   The Input array is a collection of Codes (Res and Act) prompted for up & low
     begin
       Count:= 0;
       SetLength(Input,Count);
       for Row := Low(ResC) to High(ResC) do begin
         if SEEK(ResC[Row])then begin
           if ActRes.Items[TheItem].LowerPmt then begin
             Inc(Count);
             SetLength(Input,Count);
             Input[Count-1]:= ActRes.Items[TheItem].Code;
           end;
         end;
         if SEEK(ResC[Row])then begin
           if ActRes.Items[TheItem].UpperPmt then begin
             Inc(Count);
             SetLength(Input,Count);
             Input[Count-1]:= ActRes.Items[TheItem].Code;
           end;
         end;
       end;

       for Col := Low(ActC) to High(ActC) do begin
         if SEEK(ActC[Col])then begin
           if ActRes.Items[TheItem].LowerPmt then begin
             Inc(Count);
             SetLength(Input,Count);
             Input[Count-1]:= ActRes.Items[TheItem].Code;
           end;
         end;
         if SEEK(ActC[Col])then begin
           if ActRes.Items[TheItem].UpperPmt then begin
             Inc(Count);
             SetLength(Input,Count);
             Input[Count-1]:= ActRes.Items[TheItem].Code;
           end;
         end;
       end;
       InputCount:= Count;
     end;

   FUNCTION  TFUS.IsBasic(Code: String): Boolean;
      Var
        Value: DataType;
        Index: Integer;
      BEGIN
//        Code:= UpperCase(Trim(Code));
        Seek(Code);
        Result:= ActRes.Items[TheItem].Basic;
      END;

{$ENDREGION}


{$Region 'Optimizer'}

    Procedure TFUS.Transform(Row0,Col0: Integer;NewBound: Double);
      var
        Row          : Integer;
        Col          : Integer;
        Temp         : Double;
        Pivot        : Double;
        ColIndicator : Double;
        RowIndicator : Double;
        Inf          : Double;
        TempPtr      : String;

      begin
      if TraceX then
        if (Iteration = 0) then ShowB;

//      INF := 1E+05;
      INF:= Infinity;
      IF Col0 >= Low(ResC){0} THEN BEGIN    { Do pivot column first - Will save divisions! }
        pivot:= B[Row0,Col0];
        FOR Row:= Low(ActPtr) TO High(ActPtr) DO IF Row = Row0
          THEN B[Row,Col0]:=      1.0/pivot
          ELSE B[Row,Col0]:= -B[Row,Col0]/pivot;
        FOR Col:= Low(ResC) TO High(ResC) DO IF Col <> Col0 THEN BEGIN
            temp:= B[Row0,Col];
            IF temp <> 0.0 THEN BEGIN     { Can save zero multiplies! }
               B[Row0,Col]:= temp/pivot;
               FOR Row:= Low(ActPtr) TO High(ActPtr) DO IF Row <> Row0 THEN
                  B[Row,Col]:= B[Row,Col]+ B[Row,Col0] * temp;
            END;
        END;

//          Result:= ActRes.Items[ResPtr[ResNum]].Name;
        ColIndicator:=  (NewBound - ActRes.Items[ResPtr[Col0]].Level);
        IF (ActRes.Items[ActPtr[Row0]].Level = ActRes.Items[ActPtr[Row0]].LowerBound)
           THEN RowIndicator:= ABS(ActRes.Items[ActPtr[Row0]].Marginal)
           ELSE RowIndicator:=-ABS(ActRes.Items[ActPtr[Row0]].Marginal);

        TempPtr   := ResPtr[Col0];     {        Exchange            }
        ResPtr[Col0]:= ActPtr[Row0];   {      Row and Column        }
        ActPtr[Row0]:= TempPtr;        {         Pointers           }
        ActRes.Items[ResPtr[Col0]].Index := Col0;
        ActRes.Items[ActPtr[Row0]].Index := Row0;

        FOR Row:= Low(ActPtr) TO High(ActPtr) DO BEGIN
          IF Row = Row0 THEN BEGIN
             ActRes.Items[ActPtr[Row]].Marginal:= (RowIndicator/pivot);
             ActRes.Items[ActPtr[Row]].Basic   := NOT ActRes.Items[ActPtr[Row]].Basic;
             ActRes.Items[ActPtr[Row]].Level   := NewBound;
          END ELSE BEGIN
             IF ABS(ActRes.Items[ActPtr[Row]].Marginal) > INF THEN BEGIN
                IF NOT ActRes.Items[ActPtr[Row]].Basic
                  THEN ActRes.Items[ActPtr[Row]].Marginal := ActRes.Items[ActPtr[Row]].Cost
                  ELSE ActRes.Items[ActPtr[Row]].Marginal := 0.0;
                FOR Col:= Low(ResPtr) TO High(ResPtr) DO begin
                 IF ActRes.Items[ResPtr[Col]].Basic
                   THEN ActRes.Items[ActPtr[Row]].Marginal:= ActRes.Items[ActPtr[Row]].Marginal + (B[Row,Col]*ActRes.Items[ResPtr[Col]].Cost);
                end;
             END   ELSE ActRes.Items[ActPtr[Row]].Marginal:= ActRes.Items[ActPtr[Row]].Marginal +  B[Row,Col0] * RowIndicator;
          END;
        END { for i and with };
      END ELSE BEGIN  { J0<=0 }
         ColIndicator:=  (NewBound - ActRes.Items[ActPtr[Row0]].Level);
         ActRes.Items[ActPtr[Row0]].Level:= NewBound;
      END;
               { Calculate levels for columns }
      FOR Col:= Low(ResPtr) TO High(ResPtr) DO BEGIN
        IF ((ABS(ActRes.Items[ResPtr[Col]].Level) > INF) OR (ABS(ColIndicator) > INF)) THEN BEGIN
          ActRes.Items[ResPtr[Col]].Level := 0.0;
          FOR Row:= Low(ActPtr) TO High(ActPtr) DO ActRes.Items[ResPtr[Col]].Level:= ActRes.Items[ResPtr[Col]].Level + (B[Row,Col]*ActRes.Items[ActPtr[Row]].Level);
        END ELSE begin
         ActRes.Items[ResPtr[Col]].Level:= ActRes.Items[ResPtr[Col]].Level + (B[Row0,Col] * ColIndicator);
        end;
        IF Col = Col0 THEN BEGIN
          ActRes.Items[ResPtr[Col]].Basic   := NOT ActRes.Items[ResPtr[Col]].Basic;
          ActRes.Items[ResPtr[Col]].Marginal:= 0.0;
        END;
      END;
      Inc(Iteration);
      if TraceX then TraceData(Col0,Row0,'');
      end;

    Function TFUS.ColPivot(Var Row0     : Integer;
                           Var Col0     : Integer;
                           Var ColBound : Double;
                           Var ColOK    : Boolean): Double;
      var
        Row          : Integer;
        Col          : Integer;
        TheRow       : Integer;
        Max          : Double;
        Min          : Double;
        ColScale     : Double;
        ColScale0    : Double;
        ColBound0    : Double;
        RowScale     : Double;
        RowIndicator : Double;
        ColIndicator : Double;
        Pivot        : Double;
        Cost         : Double;
      begin
        Row0:= 0;
        Col0:= 0;
        ColBound:= 0.0;
        Result:= 0.0;

{$Region 'Check Columns'}
        Max := 0.0;
        for Col:= Low(ResPtr) to High(ResPtr) do begin
          if ActRes.Items[ResPtr[Col]].Level >= ActRes.Items[ResPtr[Col]].UpperBound then begin
            ColScale:= -1.0;
            ColBound:=  ActRes.Items[ResPtr[Col]].UpperBound;
          end else begin
            ColScale:=  1.0;
            ColBound:=  ActRes.Items[ResPtr[Col]].LowerBound;
          end;;
          ColIndicator:= ColScale*(ColBound - ActRes.Items[ResPtr[Col]].Level);

          if ColIndicator > Max then begin
            Max:= ColIndicator;
            ColScale0:= ColScale;
            ColBound0:= ColBound;
            Col0:= Col;
          end;
        end;
{$EndRegion}

{$Region 'Choose Pivot'}
        ColOK:= (Max = 0.0);
        if Not ColOK then begin
          ColBound:= ColBound0;
          Min:= BigNumber;
          for Row:= Low(ActPtr) to High(ActPtr) do begin
            IF ActRes.Items[ActPtr[Row]].LowerBound = ActRes.Items[ActPtr[Row]].UpperBound then RowScale:=  0.0 else
            IF ActRes.Items[ActPtr[Row]].Level      = ActRes.Items[ActPtr[Row]].LowerBound then RowScale:= +1.0 else
            IF ActRes.Items[ActPtr[Row]].Level      = ActRes.Items[ActPtr[Row]].UpperBound then RowScale:= -1.0 else
                   { illegal bound so }     RowScale:=  0.0;
            RowIndicator:= ActRes.Items[ActPtr[Row]].Marginal * RowScale;
            pivot:= (B[Row,Col0] * ColScale0 * RowScale);
            if ((pivot        >  0.0 ) and (RowScale <> 0.0) and
                (RowIndicator >= 0.0)) then begin
              Cost:= ABS( RowIndicator/pivot );
              IF Cost < Min then begin
                Min := Cost;
                Row0:= Row;
              END;
            end;
            Result:= Max * Min;
          end;
        end;
{$EndRegion}
      end;

    Function  TFUS.RowPivot(Var Row0     : Integer;
                            Var Col0     : Integer;
                            Var RowBound : Double;
                            Var RowOK    : Boolean): Double;
    var
      Row          : Integer;
      Col          : Integer;
      Max          : Double;
      Min          : Double;
      RowScale     : Double;
      Pivot        : Double;
      ColScale     : Double;
      ColIndicator : Double;
      RowIndicator : Double;
      TempReal     : Double;
// Is the solution realy least cost? - - -
    begin
      Result:= 0.0;
      Row0:= 0;
      Col0:= 0;
      Max:= 0.0;
      for Row:= Low(ActPtr) to High(ActPtr) do begin
        IF (ActRes.Items[ActPtr[Row]].LowerBound >= ActRes.Items[ActPtr[Row]].UpperBound) then begin
             IF ActRes.Items[ActPtr[Row]].Marginal < 0.0 then RowScale:= -1.0
                                                         else RowScale:= +1.0
        end else IF ActRes.Items[ActPtr[Row]].Level = ActRes.Items[ActPtr[Row]].LowerBound then begin
                                    RowScale:= +1.0;
                                    RowBound:= ActRes.Items[ActPtr[Row]].UpperBound;
        end else IF ActRes.Items[ActPtr[Row]].Level = ActRes.Items[ActPtr[Row]].UpperBound  then begin
                                    RowScale:= -1.0;
                                    RowBound:= ActRes.Items[ActPtr[Row]].LowerBound;
        end else {illegal bound}    RowScale:=  0.0;
        RowIndicator:= (ActRes.Items[ActPtr[Row]].Marginal * RowScale);
        RowOK:= (Max = 0.0);

        if RowIndicator < Max then begin    {-}
          Max:= RowIndicator;
          Row0:= Row;
        end;
      end;
      RowOK:= (Max = 0.0);

      if Not RowOK then begin
        Min:= BigNumber;
        for Col:= Low(ResPtr) to High(ResPtr) do begin
          pivot:= B[Row0,Col] * RowScale;

          IF pivot < 0.0 then begin
            ColScale     := +1.0;
            RowBound:= ActRes.Items[ResPtr[Col]].LowerBound;
          end else
          IF pivot > 0.0 then begin
            ColScale     := -1.0;
            RowBound:= ActRes.Items[ResPtr[Col]].LowerBound;
          END;
          pivot:= B[Row0,Col] * RowScale * ColScale; { pivot is forced to be -}

          ColIndicator:= ColScale * (RowBound - ActRes.Items[ResPtr[Col]].Level);

         IF ColIndicator <= 0.0 then begin          {- or 0}
            TempReal:=     (ColIndicator/pivot);
            IF TempReal < Min THEN begin
               Min:= TempReal;
               Row0:= Row;
            END;
         END { col_indicator - or 0 };
        end;
        Result:= Max * Min;
      end;
    end;


   PROCEDURE TFUS.InputTransform;
      VAR
         I      : INTEGER;
         Row    : Integer;
         Col    : Integer;
         R,
         Factor : Double;

      BEGIN  {Input Transformation}
         for Row := Low(ActPtr) to High(ActPtr)-1 do with ActRes.Items[ActPtr[Row]] do begin
           if LowerBound < 0 then LowerBound:= 0.0;
           R:= Cost;
           Cost:= Cost/InputScale;
           Index:= Row;
         end;

         for Col := Low(ResPtr) to High(ResPtr)-1 do with ActRes.Items[ResPtr[Col]] do begin
           Cost:= Cost/InputScale;
           Index:= Col;
         end;
         Solved   := True;
      END;


    Function TFUS.Solve: Boolean;
      var
        R,
        PivotCol  : Double;
        PivotRow  : Double;
        BoundCol  : Double;
        BoundRow  : Double;
        Row1      : Integer;
        Col1      : Integer;
        Row2      : Integer;
        Col2      : Integer;
        ColOK     : Boolean;
        RowOK     : Boolean;

{$Region 'InputTransform'}

   PROCEDURE OutputTransform;
      VAR
         I      : INTEGER;
         Row    : Integer;
         Col    : Integer;
         Factor : Double;

      BEGIN  {OutInput Transformation}
        for Row := Low(ActPtr) to High(ActPtr)-1 do begin
           Factor:= ActRes.Items[ActPtr[Row]].InputScale;///ActRes.Items[ResPtr[Row]].InputScale;
           ActRes.Items[ActPtr[Row]].Cost:= ActRes.Items[ActPtr[Row]].Cost*Factor;
           if Iteration>0 then begin
             ActRes.Items[ActPtr[Row]].Cost:= ActRes.Items[ActPtr[Row]].Level*Factor;
             ActRes.Items[ActPtr[Row]].Cost:= ActRes.Items[ActPtr[Row]].Marginal*Factor;
           end;
        end;
      END { OutputTransform };

      PROCEDURE InitFeas;
        VAR  I,J  : INTEGER;

         BEGIN
           { Calculate marginal costs of rows }
            for I := Low(ActPtr) to High(ActPtr) do begin
              if not ActRes.Items[ActPtr[I]].Basic then ActRes.Items[ActPtr[I]].Marginal:= ActRes.Items[ActPtr[I]].Cost
                                                   else ActRes.Items[ActPtr[I]].Marginal:= 0.0;
            end;
            for I := Low(ResPtr) to High(ResPtr) do begin
              if not ActRes.Items[ResPtr[I]].Basic then ActRes.Items[ResPtr[I]].Marginal:= ActRes.Items[ResPtr[I]].Cost
                                                   else ActRes.Items[ResPtr[I]].Marginal:= 0.0;
            end;

            for I := Low(ActPtr) to High(ActPtr) do begin
              IF ActRes.Items[ActPtr[I]].Marginal >= 0.0
                THEN ActRes.Items[ActPtr[I]].Level:= ActRes.Items[ActPtr[I]].LowerBound
                ELSE ActRes.Items[ActPtr[I]].Level:= ActRes.Items[ActPtr[I]].UpperBound;
            end;

           { Now find resulting column levels }
            for I := Low(ResPtr) to High(ResPtr) do
              ActRes.Items[ResPtr[I]].Level:= 0.0;

            for I := Low(ActPtr) to High(ActPtr) do if ActRes.Items[ActPtr[I]].Level <> 0.0 then
              for J := Low(ResPtr) to High(ResPtr) do WITH ActRes.Items[ResPtr[J]] DO
                ActRes.Items[ResPtr[J]].Level:= ActRes.Items[ResPtr[J]].Level + (B[I,J] * ActRes.Items[ActPtr[I]].Level);
        END { INIT_FEAS };
{$EndRegion}
      begin
//        InputTransform;
(* *)
//        Memo.Clear;
//         R:= B[0,0];
        if (N <= 0) then exit;   // No Group loaded

        InitFeas;
        PivotCol:= ColPivot(Row1,Col1,BoundCol,ColOK);
        PivotRow:= RowPivot(Row2,Col2,BoundRow,RowOK);
        if ColOK and (PivotRow > PivotCol) then ColOK:= True;
//        Solved:= True;
        while ((not ColOK or not RowOK) and Solved) do begin
          if not ColOK then Transform(Row1,Col1,BoundCol) else
                            Transform(Row2,Col2,BoundRow);
          PivotCol:= ColPivot(Row1,Col1,BoundCol,ColOK);
          PivotRow:= RowPivot(Row2,Col2,BoundRow,RowOK);
          Solved:= (PivotCol < BigNumber);
        end;
        if Solved then begin
          Result:= ColOK and RowOK;
        end else begin
          Result:= True;
        end;
        Solved:= Result;
//        Result:= ColOK and RowOK;
//        OutputTransform;
        IF TraceX THEN BEGIN
           TraceData(-1,-1,'');
           ReportSol(Memo);
        END;
(* *)
      end;
{$EndRegion}

begin
  Memo:= TStringList.Create;
  Memo.Append(' ');
  gLine:= '';
  xLocation:=  '999';
  xXMLGroup:= True;
  TraceX:= False;
end.
