unit MPSTestUnit;

interface

uses
  System.IOUtils,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, Data.DB,
  Datasnap.DBClient, FMX.Layouts, FMX.ListBox, FMX.Edit;

type
  TForm26 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    CreateDB: TButton;
    MatGroups: TClientDataSet;
    MatGroupsLOC: TStringField;
    MatGroupsGROUP: TStringField;
    MatGroupsTITLE: TStringField;
    MatGroupsUNAME: TStringField;
    MatGroupsXML: TMemoField;
    ListBox1: TListBox;
    Button8: TButton;
    Edit1: TEdit;
    Button9: TButton;
    RadioButton3: TRadioButton;
    Example: TSwitch;
    Label1: TLabel;
    Button10: TButton;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
//    procedure FormCreate(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure RadioButton1Change(Sender: TObject);
    procedure RadioButton2Change(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure ExampleClick(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure CreateDBClick(Sender: TObject);
//    procedure FillListBox(Sender: TObject);
  private
//    procedure FillListBox(Sender: TObject);
    { Private declarations }
  public
//    procedure FillListBox(Sender: TObject);
//    procedure FillListBox;
    { Public declarations }
  end;

var
  Form26: TForm26;

implementation

{$R *.fmx}

Var
  UsrPath : String;
  Location: String;
  Problem : String;
  xExample: Boolean;

procedure TForm26.Button10Click(Sender: TObject);
var
  AppName,
  Result : String;
begin
  Memo1.Lines.Clear;
  xExample:= Example.IsChecked;
  AppName:= 'iBlend';
  Result:= PathDelim+'LionSoftware'+PathDelim+AppName+PathDelim;
  if xExample then Result:= Result+'Example'+PathDelim
              else Result:= Result+'Company'+PathDelim;

  Memo1.Lines.Append('Documents        '+TPath.GetDocumentsPath+Result);
  Memo1.Lines.Append('Downloads        '+TPath.GetDownloadsPath+Result);
  Memo1.Lines.Append('');
  Memo1.Lines.Append('SharedDocuments  '+TPath.GetSharedDocumentsPath+Result);
  Memo1.Lines.Append('');
  Memo1.Lines.Append('Public           '+TPath.GetPublicPath+Result);
  Memo1.Lines.Append('Home             '+TPath.GetHomePath+Result);
  Memo1.Lines.Append('Shared Downloads '+TPath.GetSharedDownloadsPath+Result);
end;

procedure TForm26.Button1Click(Sender: TObject);
begin
  Memo1.Lines.Clear
end;

procedure TForm26.Button2Click(Sender: TObject);
begin
  Memo1.Lines.LoadFromFile(UsrPath+Problem+'.MPS');
end;

procedure TForm26.Button3Click(Sender: TObject);
procedure FillListBox;
  begin
  with MatGroups do begin
    Open;
    Filtered:= False;
    Filter:= 'LOC='+ Location;
    Filtered:= True;
    First;
    ListBox1.Clear;
    while not eof do begin
      ListBox1.Items.Append(FieldByName('Group').AsString);
      next;
    end;
  end;
  end;
begin
  Location:= '999';
  FillListBox;
end;

procedure TForm26.Button4Click(Sender: TObject);
      var
        Loc    : String;
        xName,
        sGroup,
        temp,
        xFields: String;
        xEdit  : Boolean;
        begin
          with MatGroups do begin
            Open;
            xFields:= 'LOC;GROUP';
            Loc:= Location;
            sGroup:= Problem;
            xEdit:= Locate(xFields,VarArrayOf([LOC,sGroup]),[]);
            if xEdit then begin
              Edit;
              FieldByName('XML').AsString:= Memo1.Lines.Text;
              FieldByName('LOC').AsString:= Loc;
              post;
            end else begin
              insert;
              FieldByName('Loc')  .AsString:= Loc;
              FieldByName('Group').AsString:= sGroup;
              FieldByName('XML')  .AsString:= Memo1.Text;
              post;
            end;
          end;
        end;

procedure TForm26.Button5Click(Sender: TObject);
      var
        Loc    : String;
        xName,
        sGroup,
        temp,
        xFields: String;
        xEdit  : Boolean;
        begin
          with MatGroups do begin
            Open;
            xFields:= 'LOC;GROUP';
            Loc:= Location;
            sGroup:= Problem;
            xEdit:= Locate(xFields,VarArrayOf([LOC,sGroup]),[]);
            if xEdit then begin
              Memo1.Lines.Clear;
              Memo1.Lines.Text:= FieldByName('XML').AsString;
              Loc:= FieldByName('LOC').AsString;
            end else begin
//              insert;
//              FieldByName('Loc')  .AsString:= Loc;
//              FieldByName('Group').AsString:= sGroup;
//              FieldByName('XML')  .AsString:= Memo1.Text;
//              post;
            end;
          end;
        end;

//end;

//end;

procedure TForm26.Button6Click(Sender: TObject);
begin
var
   oTable : TClientDataSet;
begin
   oTable := TClientDataSet.Create( nil );
      with oTable.FieldDefs do
      begin
         Clear;

         with AddFieldDef do
         begin
            Name := 'LOC';
            DataType := ftString;
            Size := 3;
         end;

         with AddFieldDef do
         begin
            Name := 'GROUP';
            DataType := ftString;
            Size := 8;
         end;

//         with AddFieldDef do
//         begin
//            Name := 'DATE';
//            DataType := ftDateTime;
//         end;

         with AddFieldDef do
         begin
            Name := 'TITLE';
            DataType := ftString;
            Size := 15;
         end;

         with AddFieldDef do
         begin
            Name := 'UNAME';
            DataType := ftString;
            Size := 20;
         end;

         with AddFieldDef do
         begin
            Name := 'XML';
         {* Due to the lack of a VarChar field type in Delphi please check
            that the field type has not been changed.  If the field type has
            been changed the Table to Code generator can generate SQL scripts
            that will retain the VarChar field type. *}
//            DataType := ftString;
            DataType := ftMemo;
            Size := 1;
         end;

      end;
      oTable.CreateDataSet;
      oTable.AddIndex( 'GROUP', 'LOC;GROUP', [ixExpression, ixUnique]);
      oTable.Active := True;
      oTable.SaveToFile(UsrPath+'MatGroups.cds');
    end;
end;


procedure TForm26.Button8Click(Sender: TObject);
  VAR
    I,
    DosError : INTEGER;
    DirInfo  :TSearchRec;
    Att      : WORD;
    Path,
    Name     : String;

  begin
     Path:= UsrPath+'*.MPS';
     Att:= faAnyFile;
     DosError:= FindFirst(Path,faAnyFile,DirInfo);
     ListBox1.Items.Clear;
     WHILE (DosError = 0) DO BEGIN
       Name:= UpperCase(DirInfo.Name);
       I:= POS('.MPS',Name);
       Delete(Name,I,4);
       ListBox1.Items.Append(Name);
       DosError:= FindNext(DirInfo);
     END {WHILE};
     FindClose(DirInfo);
  END;

procedure TForm26.Button9Click(Sender: TObject);
begin
  if not FileExists(UsrPath+'MatGroups.cds') then begin
    ListBox1.Items.Clear;
  end else begin
  with MatGroups do begin
    Open;
    Filtered:= False;
    Filter:= 'LOC='+ Location;
    Filtered:= True;
    First;
    ListBox1.Clear;
    while not eof do begin
      ListBox1.Items.Append(FieldByName('Group').AsString);
      next;
    end;
  end;
end;
end;

procedure TForm26.CreateDBClick(Sender: TObject);
begin
var
   oTable : TClientDataSet;
begin
   oTable := TClientDataSet.Create( nil );
      with oTable.FieldDefs do
      begin
         Clear;

         with AddFieldDef do
         begin
            Name := 'LOC';
            DataType := ftString;
            Size := 3;
         end;

         with AddFieldDef do
         begin
            Name := 'GROUP';
            DataType := ftString;
            Size := 8;
         end;

//         with AddFieldDef do
//         begin
//            Name := 'DATE';
//            DataType := ftDateTime;
//         end;

         with AddFieldDef do
         begin
            Name := 'TITLE';
            DataType := ftString;
            Size := 15;
         end;

         with AddFieldDef do
         begin
            Name := 'UNAME';
            DataType := ftString;
            Size := 20;
         end;

         with AddFieldDef do
         begin
            Name := 'XML';
         {* Due to the lack of a VarChar field type in Delphi please check
            that the field type has not been changed.  If the field type has
            been changed the Table to Code generator can generate SQL scripts
            that will retain the VarChar field type. *}
//            DataType := ftString;
            DataType := ftMemo;
            Size := 1;
         end;

      end;
      oTable.CreateDataSet;
      oTable.AddIndex( 'GROUP', 'LOC;GROUP', [ixExpression, ixUnique]);
      oTable.Active := True;
      oTable.SaveToFile(UsrPath+'MatGroups.cds');
    end;
end;

procedure TForm26.ExampleClick(Sender: TObject);
  var
    Temp : String;
begin
  if Example.IsChecked then begin
    UsrPath:= TPath.GetSharedDocumentsPath+PathDelim+'LionSoftware'+
      PathDelim+'iBlend'+PathDelim+'Example'+PathDelim;
  end else begin
    UsrPath:= TPath.GetSharedDocumentsPath+PathDelim+'LionSoftware'+
      PathDelim+'iBlend'+PathDelim+'Company'+PathDelim;
  end;
  Form26.Caption:=  UsrPath;
end;


procedure TForm26.FormCreate(Sender: TObject);
begin
    UsrPath:= TPath.GetSharedDocumentsPath+PathDelim+'LionSoftware'+
      PathDelim+'iBlend'+PathDelim+'Company'+PathDelim;
    Location:= '001';
    Problem:= 'BLEND';
    xExample:= Example.IsChecked;
    Form26.Caption:=  UsrPath;
end;

procedure TForm26.ListBox1Click(Sender: TObject);

procedure AddGroup;
      var
        Loc    : String;
        xName,
        sGroup,
        temp,
        xFields: String;
        xEdit  : Boolean;
        begin
          with MatGroups do begin
            Open;
            xFields:= 'LOC;GROUP';
            if Example.IsChecked then Loc:= '999' else
            Loc:= Location;
            sGroup:= Problem;
            xEdit:= Locate(xFields,VarArrayOf([LOC,sGroup]),[]);
            if xEdit then begin
              Edit;
              FieldByName('XML').AsString:= Memo1.Lines.Text;
              FieldByName('LOC').AsString:= Loc;
              post;
            end else begin
              insert;
              FieldByName('Loc')  .AsString:= Loc;
              FieldByName('Group').AsString:= sGroup;
              FieldByName('XML')  .AsString:= Memo1.Text;
              post;
            end;
          end;
        end;

begin
  Problem:= ListBox1.Items[ListBox1.ItemIndex];
  Memo1.Lines.LoadFromFile(UsrPath+Problem+'.MPS');
  AddGroup;
  Edit1.Text:= Problem;
end;

procedure TForm26.RadioButton1Change(Sender: TObject);
procedure FillListBox;
  begin
  with MatGroups do begin
    Open;
    Filtered:= False;
    Filter:= 'LOC='+ Location;
    Filtered:= True;
    First;
    ListBox1.Clear;
    while not eof do begin
      ListBox1.Items.Append(FieldByName('Group').AsString);
      next;
    end;
  end;
  end;
begin
    Location:= '001';
    FillListBox;
end;

procedure TForm26.RadioButton2Change(Sender: TObject);
  procedure FillListBox;
    begin
      with MatGroups do begin
        Open;
        Filtered:= False;
        Filter:= 'LOC='+ Location;
        Filtered:= True;
        First;
        ListBox1.Clear;
        while not eof do begin
          ListBox1.Items.Append(FieldByName('Group').AsString);
          next;
        end;
      end;
    end;
  begin
    Location:= '002';
    FillListBox;
  end;

end.
