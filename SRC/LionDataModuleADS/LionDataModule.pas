unit LionDataModule;
{ $DEFINE Customer}
{ $DEFINE DoPaths}
{ $DEFINE Graco}
{ $DEFINE FCI}
{ $DEFINE Bonus}
{$DEFINE FUS}
{$DEFINE iBlend}
{$DEFINE CreateTables}

{$IFDEF MSWindows}
{$DEFINE Demo}
{$ENDIF}

interface

uses
//  System.IOUtils,
  System.IOUtils,FMX.Dialogs,
  System.SysUtils, System.Classes,

  Datasnap.DBClient, Datasnap.Provider,Data.DB,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys,// FireDAC.Phys.ADS, FireDAC.Phys.ADSDef,
  FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.ADS, FireDAC.Phys.ADSDef;

type
  TDataModule1 = class(TDataModule)
    UnitsClientDataSet: TClientDataSet;
    UnitsClientDataSetIndex: TSmallintField;
    UnitsClientDataSetUnit: TStringField;
    UnitsClientDataSetMetric: TBooleanField;
    UnitsClientDataSetVolumetric: TBooleanField;
    UnitsClientDataSetLBS: TFloatField;
    UnitsClientDataSetUnits: TSmallintField;
    UnitsClientDataSetName: TStringField;
    UnitsClientDataSetContainer: TBooleanField;
    UnitsClientDataSetContainerUnits: TStringField;
    UnitsClientDataSetUnitType: TSmallintField;
    UnitsClientDataSetUS: TStringField;
    UnitsClientDataSetMT: TStringField;
    UnitsClientDataSetX12: TStringField;
    UnitsDataSource: TDataSource;

    FertClientDataSet: TClientDataSet;
    GroupsClientDataSet: TClientDataSet;
    MatGroups          : TClientDataSet;
    MySourceClientDataSet: TClientDataSet;
    FertDataSource: TDataSource;
    GroupsDataSource: TDataSource;
    MyFertDataSource: TDataSource;
    MySourceDataSource: TDataSource;
    ItemDataSource: TDataSource;

    FertClientDataSetITEM: TStringField;
    FertClientDataSetITEMTYPE: TStringField;
    FertClientDataSetNAME: TStringField;
    FertClientDataSetMIXNAME: TStringField;
    FertClientDataSetCOMPANY: TStringField;
    FertClientDataSetUFTRS: TSmallintField;
    FertClientDataSetBagBlkLq: TSmallintField;
    FertClientDataSetSTATE: TSmallintField;
    FertClientDataSetREPORT: TBooleanField;
    FertClientDataSetREGULATED: TBooleanField;
    FertClientDataSetDOT: TStringField;
    FertClientDataSetERG: TSmallintField;
    FertClientDataSetSIZE: TFloatField;
    FertClientDataSetSUNIT: TStringField;
    FertClientDataSetPUNIT: TStringField;
    FertClientDataSetDENSITY: TFloatField;
    FertClientDataSetSPG: TFloatField;
    FertClientDataSetSGN: TFloatField;
    FertClientDataSetWATER: TFloatField;
    FertClientDataSetCLAY: TFloatField;
    FertClientDataSetAMMONIA: TFloatField;
    FertClientDataSetHEATSOL: TFloatField;
    FertClientDataSetHEATCAP: TFloatField;
    FertClientDataSetHEATNH3: TFloatField;
    FertClientDataSetLIQP: TFloatField;
    FertClientDataSetSOL32: TFloatField;
    FertClientDataSetSOL77: TFloatField;
    FertClientDataSetSALTINDEX: TFloatField;
    FertClientDataSetCACO3: TFloatField;
    FertClientDataSetPOLYCOAT: TBooleanField;
    FertClientDataSetSULFURCOAT: TBooleanField;
    FertClientDataSetCHELATE: TBooleanField;
    FertClientDataSetN: TFloatField;
    FertClientDataSetAMMN: TFloatField;
    FertClientDataSetNITN: TFloatField;
    FertClientDataSetUREAN: TFloatField;
    FertClientDataSetOTHERN: TFloatField;
    FertClientDataSetWINN: TFloatField;
    FertClientDataSetCOATN: TFloatField;
    FertClientDataSetOCCLUDEDN: TFloatField;
    FertClientDataSetSLOWN: TFloatField;
    FertClientDataSetP: TFloatField;
    FertClientDataSetK: TFloatField;
    FertClientDataSetCA: TFloatField;
    FertClientDataSetMG: TFloatField;
    FertClientDataSetS: TFloatField;
    FertClientDataSetB: TFloatField;
    FertClientDataSetCO: TFloatField;
    FertClientDataSetCU: TFloatField;
    FertClientDataSetFE: TFloatField;
    FertClientDataSetMN: TFloatField;
    FertClientDataSetMO: TFloatField;
    FertClientDataSetZN: TFloatField;
    FertClientDataSetCL: TFloatField;
    FertClientDataSetWSCA: TFloatField;
    FertClientDataSetWSMG: TFloatField;
    FertClientDataSetWSS: TFloatField;
    FertClientDataSetWSB: TFloatField;
    FertClientDataSetWSCO: TFloatField;
    FertClientDataSetWSCU: TFloatField;
    FertClientDataSetWSFE: TFloatField;
    FertClientDataSetWSMN: TFloatField;
    FertClientDataSetWSMO: TFloatField;
    FertClientDataSetWSZN: TFloatField;
    FertClientDataSetCHCA: TFloatField;
    FertClientDataSetCHMG: TFloatField;
    FertClientDataSetCHS: TFloatField;
    FertClientDataSetCHB: TFloatField;
    FertClientDataSetCHCO: TFloatField;
    FertClientDataSetCHCU: TFloatField;
    FertClientDataSetCHFE: TFloatField;
    FertClientDataSetCHMN: TFloatField;
    FertClientDataSetCHMO: TFloatField;
    FertClientDataSetCHZN: TFloatField;
    FertClientDataSetAS: TFloatField;
    FertClientDataSetCD: TFloatField;
    FertClientDataSetHG: TFloatField;
    FertClientDataSetNI: TFloatField;
    FertClientDataSetPB: TFloatField;
    FertClientDataSetSE: TFloatField;
    FertClientDataSetCHEM1: TStringField;
    FertClientDataSetCHEM2: TStringField;
    FertClientDataSetCHEM3: TStringField;
    FertClientDataSetCHEM4: TStringField;
    FertClientDataSetCHEM5: TStringField;
    FertClientDataSetCHEM6: TStringField;
    FertClientDataSetCHEM7: TStringField;
    FertClientDataSetCHEM8: TStringField;
    FertClientDataSetCHEM9: TStringField;
    FertClientDataSetCHEM10: TStringField;
    FertClientDataSetCHEM11: TStringField;
    FertClientDataSetCHEM12: TStringField;
    FertClientDataSetCHEM13: TStringField;
    FertClientDataSetCHEM14: TStringField;
    FertClientDataSetCHEM15: TStringField;
    FertClientDataSetUSRGRADE: TStringField;
    FertClientDataSetSORT: TStringField;
    FertClientDataSetLICENSE: TStringField;
    FertClientDataSetDATETIME: TDateTimeField;
    FertClientDataSetBAGSIZE: TSmallintField;
    FertClientDataSetRELEASE: TSmallintField;
    FertClientDataSetSOL232: TFloatField;
    FertClientDataSetSOL277: TFloatField;
    FertClientDataSetPH: TFloatField;
    FertClientDataSetCOKEY: TStringField;
    FertClientDataSetUCC: TStringField;
    FertClientDataSetProductID: TStringField;
    FertClientDataSetBarCode: TStringField;

    ActiveClientDataSet: TClientDataSet;
    ActiveClientDataSetITEM: TStringField;
    ActiveClientDataSetITEMTYPE: TStringField;
    ActiveClientDataSetNAME: TStringField;
    ActiveClientDataSetCAS: TStringField;
    ActiveClientDataSetMOLWT: TFloatField;
    ActiveClientDataSetSG: TFloatField;
    ActiveClientDataSetFORMULA: TMemoField;
    ActiveClientDataSetLICENSE: TStringField;
    ActiveClientDataSetDATETIME: TDateTimeField;
    ActiveDataSource: TDataSource;

    MyFertClientDataSet: TClientDataSet;
    TagClientDataSet: TClientDataSet;

    SmallintField15: TSmallintField;
    SmallintField16: TSmallintField;
    BooleanField14: TBooleanField;
    BooleanField15: TBooleanField;
    BooleanField16: TBooleanField;
    BooleanField17: TBooleanField;
    SmallintField17: TSmallintField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    BooleanField18: TBooleanField;
    BooleanField19: TBooleanField;
    BooleanField20: TBooleanField;
    BooleanField21: TBooleanField;
    BooleanField22: TBooleanField;
    FloatField131: TFloatField;
    BooleanField23: TBooleanField;
    StringField29: TStringField;
    SmallintField18: TSmallintField;
    StringField30: TStringField;
    BooleanField24: TBooleanField;
    FloatField132: TFloatField;

    TagClientDataSetLanguage: TStringField;
    TagDataSource: TDataSource;
    FromDataSource: TDataSource;
    FromClientDataSet: TClientDataSet;
    ItemClientDataSet: TClientDataSet;
(* *)
    MySourceClientDataSetLOC: TStringField;
    MySourceClientDataSetITEM: TStringField;
    MySourceClientDataSetAITEM: TStringField;
    MySourceClientDataSetITEMTYPE: TStringField;
    MySourceClientDataSetName: TStringField;
    MySourceClientDataSetPERCENT: TFloatField;
    MySourceClientDataSetCAS: TStringField;
    MySourceClientDataSetMixName: TBooleanField;
    MyFertClientDataSetLOC: TStringField;
    MyFertClientDataSetITEM: TStringField;
    MyFertClientDataSetUFTRS: TSmallintField;
    MyFertClientDataSetBagBlkLq: TSmallintField;
    MyFertClientDataSetFARM: TBooleanField;
    MyFertClientDataSetSGN: TFloatField;
    MyFertClientDataSetRelease30: TSmallintField;
    MyFertClientDataSetRelease60: TSmallintField;
    MyFertClientDataSetRelease90: TSmallintField;
    MyFertClientDataSetRelease120: TSmallintField;
    MyFertClientDataSetWATER: TFloatField;
    MyFertClientDataSetCLAY: TFloatField;
    MyFertClientDataSetAMMONIA: TFloatField;
    MyFertClientDataSetHEATSOL: TFloatField;
    MyFertClientDataSetHEATCAP: TFloatField;
    MyFertClientDataSetHEATNH3: TFloatField;
    MyFertClientDataSetLIQP: TFloatField;
    MyFertClientDataSetSOL32: TFloatField;
    MyFertClientDataSetSOL77: TFloatField;
    MyFertClientDataSetSALTINDEX: TFloatField;
    MyFertClientDataSetCACO3: TFloatField;
    MyFertClientDataSetPOLYCOAT: TBooleanField;
    MyFertClientDataSetSULFURCOAT: TBooleanField;
    MyFertClientDataSetCHELATE: TBooleanField;
    MyFertClientDataSetN: TFloatField;
    MyFertClientDataSetAMMN: TFloatField;
    MyFertClientDataSetNITN: TFloatField;
    MyFertClientDataSetUREAN: TFloatField;
    MyFertClientDataSetOTHERN: TFloatField;
    MyFertClientDataSetWINN: TFloatField;
    MyFertClientDataSetCOATN: TFloatField;
    MyFertClientDataSetOCCLUDEDN: TFloatField;
    MyFertClientDataSetSLOWN: TFloatField;
    MyFertClientDataSetP: TFloatField;
    MyFertClientDataSetK: TFloatField;
    MyFertClientDataSetCA: TFloatField;
    MyFertClientDataSetMG: TFloatField;
    MyFertClientDataSetS: TFloatField;
    MyFertClientDataSetB: TFloatField;
    MyFertClientDataSetCO: TFloatField;
    MyFertClientDataSetCU: TFloatField;
    MyFertClientDataSetFE: TFloatField;
    MyFertClientDataSetMN: TFloatField;
    MyFertClientDataSetMO: TFloatField;
    MyFertClientDataSetZN: TFloatField;
    MyFertClientDataSetCL: TFloatField;
    MyFertClientDataSetWSCA: TFloatField;
    MyFertClientDataSetWSMG: TFloatField;
    MyFertClientDataSetWSS: TFloatField;
    MyFertClientDataSetWSB: TFloatField;
    MyFertClientDataSetWSCO: TFloatField;
    MyFertClientDataSetWSCU: TFloatField;
    MyFertClientDataSetWSFE: TFloatField;
    MyFertClientDataSetWSMN: TFloatField;
    MyFertClientDataSetWSMO: TFloatField;
    MyFertClientDataSetWSZN: TFloatField;
    MyFertClientDataSetCHCA: TFloatField;
    MyFertClientDataSetCHMG: TFloatField;
    MyFertClientDataSetCHS: TFloatField;
    MyFertClientDataSetCHB: TFloatField;
    MyFertClientDataSetCHCO: TFloatField;
    MyFertClientDataSetCHCU: TFloatField;
    MyFertClientDataSetCHFE: TFloatField;
    MyFertClientDataSetCHMN: TFloatField;
    MyFertClientDataSetCHMO: TFloatField;
    MyFertClientDataSetCHZN: TFloatField;
    MyFertClientDataSetAS: TFloatField;
    MyFertClientDataSetCD: TFloatField;
    MyFertClientDataSetHG: TFloatField;
    MyFertClientDataSetNI: TFloatField;
    MyFertClientDataSetPB: TFloatField;
    MyFertClientDataSetSE: TFloatField;
    MyFertClientDataSetSOL232: TFloatField;
    MyFertClientDataSetSOL277: TFloatField;
    MyFertClientDataSetGRADE: TStringField;
    MyFertClientDataSetUSRGRADE: TStringField;
    MyFertClientDataSetRelease150: TSmallintField;
    MyFertClientDataSetRelease180: TSmallintField;
    LogonClientDataSet: TClientDataSet;
    LogonDataSource: TDataSource;
    GroupsDataSetProvider: TDataSetProvider;

    GroupsFDTable: TFDTable;
    CompanyConnection: TFDConnection;
    LogonDataSetProvider: TDataSetProvider;
    LogonFDTable: TFDTable;
    GroupsClientDataSetLOC: TStringField;
    GroupsClientDataSetGROUP: TStringField;
    GroupsClientDataSetDATE: TDateTimeField;
    GroupsClientDataSetTITLE: TStringField;
    GroupsClientDataSetUNAME: TStringField;
    GroupsClientDataSetXML: TMemoField;
    GroupsClientDataSetNitrogenDetail: TBooleanField;
    GroupsClientDataSetChlorine: TBooleanField;
    GroupsClientDataSetWaterSolubles: TBooleanField;
    GroupsClientDataSetAmmoniaBalance: TBooleanField;
    GroupsClientDataSetHeavyMetals: TBooleanField;
    GroupsClientDataSetSaltIndex: TBooleanField;
    GroupsClientDataSetDensity: TBooleanField;
    GroupsClientDataSetProductTemp: TBooleanField;
    GroupsClientDataSetWaterTemp: TFloatField;
    GroupsClientDataSetHotTemp: TFloatField;
    GroupsClientDataSetOtherTemp: TFloatField;
    GroupsClientDataSetMinTemp: TFloatField;
    GroupsClientDataSetMaxTemp: TFloatField;
    GroupsClientDataSetSaltOutTemp: TFloatField;
    GroupsClientDataSetControlTotalWater: TBooleanField;
    GroupsClientDataSetFreeSulfur: TBooleanField;
    GroupsClientDataSetSellAI: TBooleanField;
    GroupsClientDataSetStabilized: TBooleanField;
    GroupsClientDataSetQtPerTon: TFloatField;
    GroupsClientDataSetInvoiceNutrients: TBooleanField;
    GroupsClientDataSetNutriSphere: TBooleanField;
    GroupsClientDataSetQtPerTonN: TFloatField;
    GroupsClientDataSetAvail: TBooleanField;
    GroupsClientDataSetQtPerTonP: TFloatField;
    GroupsClientDataSetApplicationRate: TBooleanField;
    GroupsClientDataSetTrackBags: TBooleanField;
    GroupsClientDataSetBagSize: TFloatField;
    GroupsClientDataSetMinRate: TFloatField;
    GroupsClientDataSetReleaseRates: TBooleanField;
    GroupsClientDataSetPriceLevel: TIntegerField;
    GroupsClientDataSetEvaporation: TBooleanField;
    GroupsClientDataSetLbsPerTonPlus: TFloatField;
    GroupsClientDataSetMoisture: TFloatField;
    GroupsClientDataSetStabilizedPlus: TBooleanField;
    GroupsClientDataSetGranulation: TBooleanField;
    GroupsClientDataSetSurfactant: TBooleanField;
    GroupsClientDataSetPtPer100Gal: TFloatField;
    GroupsClientDataSetClay: TBooleanField;
    GroupsClientDataSetPercentClay: TFloatField;
    GroupsClientDataSetMaxEvap: TFloatField;
    GroupsClientDataSetAutomatics: TBooleanField;
    GroupsClientDataSetSyncData: TBooleanField;
    GroupsClientDataSetAutoPrice: TBooleanField;
    GroupsClientDataSetAutoMCost: TBooleanField;
    GroupsClientDataSetAutoData: TBooleanField;
    GroupsClientDataSetBaseMarginOn: TIntegerField;
    GroupsClientDataSetNutriSphereLiq: TBooleanField;
    GroupsClientDataSetPtPer99GalN: TFloatField;
    GroupsClientDataSetAvailSD: TBooleanField;
    GroupsClientDataSetPtPer99GalSD: TFloatField;
    GroupsClientDataSetMaxMoisture: TFloatField;
    GroupsClientDataSetAssyComment: TBooleanField;
    GroupsClientDataSetAutoSort: TBooleanField;
    GroupsClientDataSetUseMixName: TBooleanField;
    GroupsClientDataSetMinPoly: TBooleanField;
    GroupsClientDataSetMinPolyPer: TFloatField;
    GroupsClientDataSetOther1: TBooleanField;
    GroupsClientDataSetOtherPer1: TFloatField;
    GroupsClientDataSetOther2: TBooleanField;
    GroupsClientDataSetOtherPer2: TFloatField;

    ItemFDTable: TFDTable;
    MyFertFDTable: TFDTable;
    MySourceFDTable: TFDTable;
    MatGroupsDataSource: TDataSource;
    CommunityConnection: TFDConnection;
    ExampleConnection: TFDConnection;
    UnitsDataSetProvider: TDataSetProvider;
    UnitsFDTable: TFDTable;
    FertDataSetProvider: TDataSetProvider;
    FertFDTable: TFDTable;
    ActiveDataSetProvider: TDataSetProvider;
    ActiveFDTable: TFDTable;
    ActiveFDTableITEM: TStringField;
    ActiveFDTableITEMTYPE: TStringField;
    ActiveFDTableNAME: TStringField;
    ActiveFDTableCAS: TStringField;
    ActiveFDTableMOLWT: TFloatField;
    ActiveFDTableSG: TFloatField;
    ActiveFDTableFORMULA: TMemoField;
    ActiveFDTableLICENSE: TStringField;
    ActiveFDTableDATETIME: TSQLTimeStampField;
    TagDataSetProvider: TDataSetProvider;
    TagFDTable: TFDTable;
    MyFertDataSetProvider: TDataSetProvider;
    MySourceDataSetProvider: TDataSetProvider;
    ItemDataSetProvider: TDataSetProvider;
    NutNum: TClientDataSet;
    NutNumDataSetProvider: TDataSetProvider;
    NutNumDataSource: TDataSource;
    NutNumFDTable: TFDTable;
    ItemClientDataSetLoc: TStringField;
    ItemClientDataSetItem: TStringField;
    ItemClientDataSetBin: TStringField;
    ItemClientDataSetAccountNumber: TStringField;
    ItemClientDataSetCCDB: TStringField;
    ItemClientDataSetTYPE: TStringField;
    ItemClientDataSetInventoryName: TStringField;
    ItemClientDataSetInventoryUOM: TSmallintField;
    ItemClientDataSetInventoryLBS: TFloatField;
    ItemClientDataSetInventoryNUM: TSmallintField;
    ItemClientDataSetInventoryQOH: TFloatField;
    ItemClientDataSetInventoryCOST: TFloatField;
    ItemClientDataSetInventoryCommitted: TFloatField;
    ItemClientDataSetInventoryReorder: TFloatField;
    ItemClientDataSetInventoryLotNum: TStringField;
    ItemClientDataSetBeginningQty: TFloatField;
    ItemClientDataSetBeginningDate: TDateTimeField;
    ItemClientDataSetInvoiceName: TStringField;
    ItemClientDataSetInvoiceUOM: TSmallintField;
    ItemClientDataSetInvoiceLBS: TFloatField;
    ItemClientDataSetInvoiceNUM: TSmallintField;
    ItemClientDataSetPrice1: TFloatField;
    ItemClientDataSetPrice2: TFloatField;
    ItemClientDataSetPrice3: TFloatField;
    ItemClientDataSetPrice4: TFloatField;
    ItemClientDataSetPrice5: TFloatField;
    ItemClientDataSetBillable: TBooleanField;
    ItemClientDataSetFUSName: TStringField;
    ItemClientDataSetFUSCost: TFloatField;
    ItemClientDataSetFUSUOM: TSmallintField;
    ItemClientDataSetFUSLBS: TFloatField;
    ItemClientDataSetFUSReport: TBooleanField;
    ItemClientDataSetFUSMixed: TBooleanField;
    ItemClientDataSetFUSPromptLower: TBooleanField;
    ItemClientDataSetFUSPromptUpper: TBooleanField;
    ItemClientDataSetFUSLowerBound: TFloatField;
    ItemClientDataSetFUSUpperBound: TFloatField;
    ItemClientDataSetFUSMixUOM: TSmallintField;
    ItemClientDataSetIsFluid: TBooleanField;
    ItemClientDataSetDensity: TFloatField;
    ItemClientDataSetSPG: TFloatField;
    ItemClientDataSetTicks: TFloatField;
    ItemClientDataSetIsFormula: TBooleanField;
    ItemClientDataSetFormula: TStringField;
    ItemClientDataSetRegulated: TBooleanField;
    ItemClientDataSetHazardous: TBooleanField;
    ItemClientDataSetERG: TStringField;
    ItemClientDataSetDOT: TStringField;
    ItemClientDataSetShipName: TMemoField;
    ItemClientDataSetPlacard: TMemoField;
    ItemClientDataSetClass: TMemoField;
    ItemClientDataSetPackage: TStringField;
    ItemClientDataSetListID: TStringField;
    ItemClientDataSetCOKEY: TStringField;
    ItemClientDataSetUCC: TStringField;
    ItemClientDataSetPRODUCTID: TStringField;
    ItemClientDataSetBARCODE: TStringField;
    FromClientDataSetITEM: TStringField;
    FromClientDataSetAI: TStringField;

    procedure DataModuleCreate(Sender: TObject);
    procedure UsrDataReopen;

  private
    { Private declarations }
    xExample  : Boolean;
    xGroupPath: String;
    function  GetAppName: String;
    function  GetUsrPath: String;
    function  GetAccPath: String;
    function  GetAppPath: String;
    function  GetSharedDocumentsPath: String;
    function  GetDocumentsPath: String;
    function  GetPublicPath: String;
    function  GetExample: Boolean;
    procedure PutExample(Value: Boolean);
    function  GetGroupPath: String;
    procedure PutGroupPath(Value: String);

  public
    { Public declarations }
   procedure  DoExample(xxExample: Boolean);
{$IFDEF CreateTables}
   procedure CreateAllTables;
   procedure CreateTableGROUPS;
   procedure CreateTableMatGROUPS;
   procedure CreateTableLOGON;
   procedure CreateTableFrom;
   procedure CreateTableITEM;
   procedure CreateTableMyFert;
   procedure CreateTableMySource;
{$ENDIF}
  published
    property AppName             : string read GetAppName;
    property AccPath             : string read GetAccPath;
    property UsrPath             : string read GetUsrPath;
    property AppPath             : string read GetAppPath;
    property SharedDocumentsPath : string read GetSharedDocumentsPath;
    property DocumentsPath       : string read GetDocumentsPath;
    property PublicPath          : string read GetPublicPath;
    property Example             : Boolean read GetExample write PutExample;
    property GroupPath           : String read GetGroupPath write PutGroupPath;
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}
    function  TDataModule1.GetGroupPath;
      begin
        Result:= xGroupPath;
      end;
    procedure TDataModule1.PutGroupPath;
      begin
        xGroupPath:= Value;
      end;

    function  TDataModule1.GetExample;
      begin
        Result:= xExample;
      end;

    procedure TDataModule1.PutExample;
      const
        Ext = '.cds';
      var
        Path : String;
      begin
        xExample:= Value;

        Path:= SharedDocumentsPath;

        if xExample then Path:= Path+'Example'+PathDelim
                    else Path:= Path+'Company'+PathDelim;
        xGroupPath:= Path;

        ItemClientDataSet    .FileName:= Path+'Item'    +Ext;
        MyFertClientDataSet  .FileName:= Path+'MyFert'  +Ext;
        MySourceClientDataSet.FileName:= Path+'MySource'+Ext;

{$IFDEF CreateTables}
  if not FileExists(ItemClientDataSet    .FileName) then CreateAllTables;
//  if not FileExists(DADDClientDataSet    .FileName) then CreateTableDADD;
//  if not FileExists(DADD                 .FileName) then CreateTableDACC;
//  if not FileExists(DHIS                 .FileName) then CreateTableDHIS;
{$ENDIF}
        ItemClientDataSet    .Active:= True;
        MyFertClientDataSet  .Active:= True;
        MySourceClientDataSet.Active:= True;
      end;

function  TDataModule1.GetUsrPath: String;
  begin   // UsrPath
{$IFDEF Demo}
    Result:= TPath.GetSharedDocumentsPath+PathDelim+'LionSoftware'+
      PathDelim+AppName+PathDelim;
{$ELSE}
//    Result:= TPath.GetDocumentsPath+PathDelim+'LionSoftware'+
    Result:= TPath.GetPublicPath+PathDelim+'LionSoftware'+
      PathDelim+AppName+PathDelim;
{$ENDIF}
    if xExample then Result:= Result+'Example'+PathDelim
                else Result:= Result+'Company'+PathDelim;

  end;

procedure TDataModule1.DoExample(xxExample: Boolean);
  const
    Ext = 'cds';
  begin
    ItemClientDataSet    .Active:= False;
    MyFertClientDataSet  .Active:= False;
    MySourceClientDataSet.Active:= False;
//    UnitsClientDataSet   .Active:= False;
//    FertClientDataSet    .Active:= False;
//    GroupsClientDataSet  .Active:= False;
//    ActiveClientDataSet  .Active:= False;
//    TagClientDataSet     .Active:= False;
//    FromClientDataSet    .Active:= False;

//    UnitsClientDataSet   .FileName:= AppPath+'Units'+Ext;
//    FertClientDataSet    .FileName:= AppPath+'Fert'+Ext;
//    ActiveClientDataSet  .FileName:= AppPath+'Active'+Ext;
//    TagClientDataSet     .FileName:= AppPath+'Tag'+Ext;
//    FromClientDataSet    .FileName:= AppPath+'From'+Ext;
//    GroupsClientDataSet  .FileName:= xGroupPath+'Groups'+Ext;

    ItemClientDataSet    .FileName:= UsrPath+'Item'+Ext;
    MyFertClientDataSet  .FileName:= UsrPath+'MyFert'+Ext;
    MySourceClientDataSet.FileName:= UsrPath+'MySource'+Ext;

    ItemClientDataSet    .Active:= True;
    MyFertClientDataSet  .Active:= True;
    MySourceClientDataSet.Active:= True;
//    UnitsClientDataSet   .Active:= True;
//    FertClientDataSet    .Active:= True;
//    GroupsClientDataSet  .Active:= True;
//    ActiveClientDataSet  .Active:= True;
//    TagClientDataSet     .Active:= True;
//    FromClientDataSet    .Active:= True;
  end;

function  TDataModule1.GetAppPath: String;
  begin
{$IFDEF MacOS}
    Result:= TPath.GetDocumentsPath+PathDelim+'LionSoftware'+
      PathDelim+AppName+PathDelim+'Community'+PathDelim;
{$ELSE}
    Result:= TPath.GetSharedDocumentsPath+PathDelim+'LionSoftware'+
      PathDelim+AppName+PathDelim+'Community'+PathDelim;
{$ENDIF}
  end;
(*
function  TDataModule1.GetAppPath: String;
  var
    SharedPath: String;
  begin
    SharedPath  := TPath.GetSharedDocumentsPath;
//    AppPath     := SharedPath+PathDelim+'LionSoftware'+PathDelim+AppName+PathDelim;
{$IFDEF IOS}
    Result:= DocumentsPath + PathDelim;
{$ELSE}
//    Result:= SharedPath    + PathDelim + 'LionSoftware' + PathDelim + 'iBlend' + PathDelim;
    Result:= SharedPath    + PathDelim + 'FORM-U-Share' + PathDelim + 'Company' + PathDelim;
{$ENDIF}
  end;
*)
  function  TDataModule1.GetAccPath: String;
  begin
      Result:= TPath.GetDocumentsPath+PathDelim+'LionSoftware'+ AppName+PathDelim+
        PathDelim+'Company'+PathDelim;
  {$IFDEF Graco}
      Result:= TPath.GetDocumentsPath+PathDelim+'LionSoftware'+
        PathDelim+'LionBlend'+PathDelim+'Graco'+PathDelim;
  {$ENDIF}
  {$IFDEF FCI}
      Result:= TPath.GetDocumentsPath+PathDelim+'LionSoftware'+
        PathDelim+'LionBlend'+PathDelim+'Graco'+PathDelim;
  {$ENDIF}
  {$IFDEF Bonus}
      Result:= TPath.GetDocumentsPath+PathDelim+'LionSoftware'+
        PathDelim+'LionBlend'+PathDelim+'Graco'+PathDelim;
  {$ENDIF}

  end;


function  TDataModule1.GetDocumentsPath: String;
  begin   // UsrPath
    Result:= TPath.GetDocumentsPath+PathDelim+'LionSoftware'+
      PathDelim+AppName+PathDelim;
  end;

function  TDataModule1.GetSharedDocumentsPath: String;
  begin
    Result:= TPath.GetSharedDocumentsPath+PathDelim+'LionSoftware'+
      PathDelim+AppName+PathDelim;
  end;

function  TDataModule1.GetPublicPath: String;
  begin
    Result:= TPath.GetPublicPath+PathDelim+'LionSoftware'+
      PathDelim+AppName+PathDelim;
  end;

function  TDataModule1.GetAppName: String;
  var
    sLength : Integer;
  begin
//  PublicPath   := TPath.GetPublicPath;
//  SharedPath   := TPath.GetSharedDocumentsPath;
//  DocumentsPath:= TPath.GetDocumentsPath;
{$IFDEF iBlend}
    Result:= 'iBlend';
{$ELSE}
    Result:= ExtractFileName(ParamStr(0));
    sLength := Length(ExtractFileName(Result)) - Length(ExtractFileExt(Result));
    Result := Copy(ExtractFileName(Result), 1, sLength);
{$ENDIF}
  end;

//var
//  DataModule2: TDataModule2;
//
//implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

//{$R *.dfm}
{$IFDEF CreateTables}

procedure TDataModule1.CreateAllTables;
 begin
   CreateTableITEM;
   CreateTableMyFert;
   CreateTableMySource;
   CreateTableGroups;
   CreateTableMatGroups;
   CreateTableLogOn;
   CreateTableFrom;
 end;

procedure TDataModule1.CreateTableMatGroups;
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
            DataType := ftMemo;
            Size := 1;
         end;

      end;
      oTable.Active := TRUE;
      oTable.AddIndex( 'GROUP', 'LOC;GROUP', [ixExpression, ixUnique]);
      oTable.CreateDataSet;
      oTable.Active := TRUE;
      oTable.SaveToFile(UsrPath+'MatGroups.cds');
end;


procedure TDataModule1.CreateTableGroups;
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
            DataType := ftMemo;
            Size := 1;
         end;

         with AddFieldDef do
         begin
            Name := 'NitrogenDetail';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'Chlorine';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'WaterSolubles';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'AmmoniaBalance';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'HeavyMetals';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'SaltIndex';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'Density';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'ProductTemp';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'WaterTemp';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'HotTemp';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'OtherTemp';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'MinTemp';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'MaxTemp';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'SaltOutTemp';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'ControlTotalWater';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'FreeSulfur';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'SellAI';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'Stabilized';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'QtPerTon';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'InvoiceNutrients';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'NutriSphere';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'QtPerTonN';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'Avail';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'QtPerTonP';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'ApplicationRate';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'TrackBags';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'BagSize';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'MinRate';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'ReleaseRates';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'PriceLevel';
            DataType := ftInteger;
         end;

         with AddFieldDef do
         begin
            Name := 'Evaporation';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'LbsPerTonPlus';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'MOISTURE';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'PtPer100Gal';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'StabilizedPlus';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'Granulation';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'Surfactant';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'Clay';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'PercentClay';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'MaxEvap';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'Automatics';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'SyncData';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'AutoPrice';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'AutoMCost';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'AutoData';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'BaseMarginOn';
            DataType := ftInteger;
         end;

         with AddFieldDef do
         begin
            Name := 'NutriSphereLiq';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'PtPer99GalN';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'AvailSD';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'PtPer99GalSD';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'MaxMoisture';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'AutoSort';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'UseMixName';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'MinPoly';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'MinPolyPer';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'Other1';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'OtherPer1';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'Other2';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'OtherPer2';
            DataType := ftFloat;
         end;

      end;

      oTable.AddIndex( 'GROUP', 'LOC;GROUP', [ixExpression, ixUnique]);
      oTable.CreateDataSet;
      oTable.Active := TRUE;
      oTable.SaveToFile(UsrPath+'Groups.cds');
end;

procedure TDataModule1.CreateTableFrom;
var
   oTable : TClientDataSet;
begin
   oTable := TClientDataSet.Create( nil );
      with oTable.FieldDefs do
      begin
         Clear;

         with AddFieldDef do
         begin
            Name := 'ITEM';
            DataType := ftString;
            Size := 8;
         end;

         with AddFieldDef do
         begin
            Name := 'AI';
            DataType := ftString;
            Size := 8;
         end;

         with AddFieldDef do
         begin
            Name := 'AIName';
            DataType := ftString;
            Size := 30;
         end;
      end;
      oTable.CreateDataSet;
//      oTable.AddIndex( 'ITEM', [ixExpression, ixUnique]);
      oTable.SaveToFile(UsrPath+'From.cds');
end;

procedure TDataModule1.CreateTableLogon;
var
   oTable : TClientDataSet;
begin
   oTable := TClientDataSet.Create( nil );

   with oTable.FieldDefs do
      begin
         Clear;

         with AddFieldDef do
         begin
            Name := 'UNAME';
            DataType := ftString;
            Size := 20;
         end;

         with AddFieldDef do
         begin
            Name := 'PWORD';
            DataType := ftString;
            Size := 20;
         end;

         with AddFieldDef do
         begin
            Name := 'PDATE';
            DataType := ftDateTime;
         end;

         with AddFieldDef do
         begin
            Name := 'LOC';
            DataType := ftString;
            Size := 3;
         end;

         with AddFieldDef do
         begin
            Name := 'USE';
            DataType := ftString;
            Size := 1;
         end;

         with AddFieldDef do
         begin
            Name := 'SERIALNUM';
            DataType := ftString;
            Size := 19;
         end;

         with AddFieldDef do
         begin
            Name := 'LICENSE';
            DataType := ftString;
            Size := 5;
         end;

         with AddFieldDef do
         begin
            Name := 'UNUMBER';
            DataType := ftString;
            Size := 5;
         end;

         with AddFieldDef do
         begin
            Name := 'INUSE';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'ACTIVE';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'ACCESS';
            DataType := ftString;
            Size := 1;
         end;

         with AddFieldDef do
         begin
            Name := 'REGCODE';
            DataType := ftString;
            Size := 16;
         end;

         with AddFieldDef do
         begin
            Name := 'DAYSCODE';
            DataType := ftString;
            Size := 16;
         end;

         with AddFieldDef do
         begin
            Name := 'ACTKEY';
            DataType := ftString;
            Size := 9;
         end;

         with AddFieldDef do
         begin
            Name := 'COMPANY';
            DataType := ftString;
            Size := 40;
         end;

         with AddFieldDef do
         begin
            Name := 'CONTACT';
            DataType := ftString;
            Size := 40;
         end;

         with AddFieldDef do
         begin
            Name := 'PHONE';
            DataType := ftString;
            Size := 16;
         end;

         with AddFieldDef do
         begin
            Name := 'ADD1';
            DataType := ftString;
            Size := 40;
         end;

         with AddFieldDef do
         begin
            Name := 'ADD2';
            DataType := ftString;
            Size := 40;
         end;

         with AddFieldDef do
         begin
            Name := 'CITY';
            DataType := ftString;
            Size := 16;
         end;

         with AddFieldDef do
         begin
            Name := 'STATE';
            DataType := ftString;
            Size := 3;
         end;

         with AddFieldDef do
         begin
            Name := 'ZIP';
            DataType := ftString;
            Size := 11;
         end;

         with AddFieldDef do
         begin
            Name := 'PRODUCT';
         {* Due to the lack of a VarChar field type in Delphi please check
            that the field type has not been changed.  If the field type has
            been changed the Table to Code generator can generate SQL scripts
            that will retain the VarChar field type. *}
            DataType := ftMemo;
            Size := 1;
         end;

         with AddFieldDef do
         begin
            Name := 'USERS';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'EXPIRATION';
            DataType := ftDateTime;
         end;

         with AddFieldDef do
         begin
            Name := 'WINDOWS';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'DEMO';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'LASTCUST';
            DataType := ftString;
            Size := 8;
         end;

         with AddFieldDef do
         begin
            Name := 'LARGEFONT';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'PSN';
            DataType := ftString;
            Size := 3;
         end;

         with AddFieldDef do
         begin
            Name := 'LOCATION';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'MATGROUP';
            DataType := ftString;
            Size := 8;
         end;

         with AddFieldDef do
         begin
            Name := 'EDITYPE';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'EDICODE';
         {* Due to the lack of a VarChar field type in Delphi please check
            that the field type has not been changed.  If the field type has
            been changed the Table to Code generator can generate SQL scripts
            that will retain the VarChar field type. *}
            DataType := ftMemo;
            Size := 1;
         end;

         with AddFieldDef do
         begin
            Name := 'TEMPDEMO';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'OTHER';
         {* Due to the lack of a VarChar field type in Delphi please check
            that the field type has not been changed.  If the field type has
            been changed the Table to Code generator can generate SQL scripts
            that will retain the VarChar field type. *}
            DataType := ftMemo;
            Size := 1;
         end;

         with AddFieldDef do
         begin
            Name := 'PRINTER';
         {* Due to the lack of a VarChar field type in Delphi please check
            that the field type has not been changed.  If the field type has
            been changed the Table to Code generator can generate SQL scripts
            that will retain the VarChar field type. *}
            DataType := ftMemo;
            Size := 1;
         end;

         with AddFieldDef do
         begin
            Name := 'FILLCITY';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'FILLSTATE';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'FILLZIP';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'FILLCOUNTY';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'FILLACODE';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'UPPERCASE';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'SEARCHNAME';
            DataType := ftString;
            Size := 8;
         end;

         with AddFieldDef do
         begin
            Name := 'BAGSIZE';
            DataType := ftString;
            Size := 8;
         end;

         with AddFieldDef do
         begin
            Name := 'BAGACCOUNT';
            DataType := ftString;
            Size := 15;
         end;

         with AddFieldDef do
         begin
            Name := 'VERSION';
            DataType := ftString;
            Size := 8;
         end;

         with AddFieldDef do
         begin
            Name := 'LASTGROUP';
            DataType := ftString;
            Size := 8;
         end;

         with AddFieldDef do
         begin
            Name := 'ORDERFIRST';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'USEWINDEFA';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'HCUSTOMER';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'HDELIVERY';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'HFILE';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'HHAZARDOUS';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'HINVOICE';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'HPLANT';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'HTAG';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'SCUSTOMER';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'SDELIVERY';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'SFILE';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'SHAZARDOUS';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'SINVOICE';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'SPLANT';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'STAG';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'FCUSTOMER';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'FDELIVERY';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'FFILE';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'FHAZARDOUS';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'FINVOICE';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'FPLANT';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'FTAG';
            DataType := ftSmallInt;
         end;

      end;

      oTable.CreateDataSet;
      oTable.Active := TRUE;
      oTable.SaveToFile(UsrPath+'Logon.cds');
end;

procedure TDataModule1.CreateTableITEM;
var
   oTable : TClientDataSet;
begin
   oTable := TClientDataSet.Create( nil );

      with oTable.FieldDefs do
      begin
         Clear;

         with AddFieldDef do
         begin
            Name := 'Loc';
            DataType := ftString;
            Size := 3;
         end;

         with AddFieldDef do
         begin
            Name := 'Item';
            DataType := ftString;
            Size := 8;
         end;

         with AddFieldDef do
         begin
            Name := 'Bin';
            DataType := ftString;
            Size := 3;
         end;

         with AddFieldDef do
         begin
            Name := 'AccountNumber';
            DataType := ftString;
            Size := 33;
         end;

         with AddFieldDef do
         begin
            Name := 'CCDB';
            DataType := ftString;
            Size := 8;
         end;

         with AddFieldDef do
         begin
            Name := 'TYPE';
            DataType := ftString;
            Size := 1;
         end;

         with AddFieldDef do
         begin
            Name := 'InventoryName';
            DataType := ftString;
            Size := 45;
         end;

         with AddFieldDef do
         begin
            Name := 'InventoryUOM';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'InventoryLBS';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'InventoryNUM';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'InventoryQOH';
            DataType := ftFloat;
         end;

//         with AddFieldDef do
//         begin
//            Name := 'InventoryAMT';
//            DataType := ftCurrency;
//            Precision := 20;
//            Size := 8;
//         end;
//
         with AddFieldDef do
         begin
            Name := 'InventoryCOST';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'InventoryCommitted';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'InventoryReorder';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'InventoryLotNum';
            DataType := ftString;
            Size := 15;
         end;

         with AddFieldDef do
         begin
            Name := 'BeginningQty';
            DataType := ftFloat;
         end;
(*
         with AddFieldDef do
         begin
            Name := 'BeginningAMT';
            DataType := ftCurrency;
            Precision := 20;
            Size := 8;
         end;
 *)
         with AddFieldDef do
         begin
            Name := 'BeginningDate';
            DataType := ftDateTime;
         end;

         with AddFieldDef do
         begin
            Name := 'InvoiceName';
            DataType := ftString;
            Size := 32;
         end;

         with AddFieldDef do
         begin
            Name := 'InvoiceUOM';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'InvoiceLBS';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'InvoiceNUM';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'Price1';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'Price2';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'Price3';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'Price4';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'Price5';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'Billable';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'FUSName';
            DataType := ftString;
            Size := 16;
         end;

         with AddFieldDef do
         begin
            Name := 'FUSCost';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'FUSUOM';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'FUSLBS';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'FUSReport';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'FUSMixed';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'FUSPromptLower';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'FUSPromptUpper';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'FUSLowerBound';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'FUSUpperBound';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'FUSMixUOM';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'IsFluid';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'Density';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'SPG';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'Ticks';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'IsFormula';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'Formula';
            DataType := ftString;
            Size := 8;
         end;

         with AddFieldDef do
         begin
            Name := 'Regulated';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'Hazardous';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'ERG';
            DataType := ftString;
            Size := 3;
         end;

         with AddFieldDef do
         begin
            Name := 'DOT';
            DataType := ftString;
            Size := 6;
         end;

         with AddFieldDef do
         begin
            Name := 'ShipName';
            DataType := ftMemo;
            Size := 1;
         end;

         with AddFieldDef do
         begin
            Name := 'Placard';
            DataType := ftMemo;
            Size := 1;
         end;

         with AddFieldDef do
         begin
            Name := 'Class';
            DataType := ftMemo;
            Size := 1;
         end;

         with AddFieldDef do
         begin
            Name := 'Package';
            DataType := ftString;
            Size := 3;
         end;

         with AddFieldDef do
         begin
            Name := 'ListID';
            DataType := ftString;
            Size := 40;
         end;

         with AddFieldDef do
         begin
            Name := 'COKEY';
            DataType := ftString;
            Size := 43;
         end;

         with AddFieldDef do
         begin
            Name := 'UCC';
            DataType := ftString;
            Size := 7;
         end;

         with AddFieldDef do
         begin
            Name := 'PRODUCTID';
            DataType := ftString;
            Size := 5;
         end;

         with AddFieldDef do
         begin
            Name := 'BARCODE';
            DataType := ftString;
            Size := 16;
         end;
         oTable.CreateDataSet;
      end;

      oTable.Active := TRUE;
      oTable.AddIndex( 'INVOICENAME', 'Loc;InvoiceName', [ixExpression]);

      oTable.AddIndex( 'ITEM', 'Loc;Item', [ixExpression, ixUnique]);

      oTable.SaveToFile(UsrPath+'Item.cds');
//      oTable.Active := FALSE;
end;

procedure TDataModule1.CreateTableMyFert;
var
   oTable : TClientDataSet;
begin
   oTable := TClientDataSet.Create( nil );

      oTable.Name := 'MyFert';
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
            Name := 'ITEM';
            DataType := ftString;
            Size := 8;
         end;

         with AddFieldDef do
         begin
            Name := 'UFTRS';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'BagBlkLq';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'FARM';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'SGN';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'Release30';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'Release60';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'Release90';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'Release120';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'WATER';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'CLAY';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'AMMONIA';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'HEATSOL';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'HEATCAP';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'HEATNH3';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'LIQP';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'SOL32';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'SOL77';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'SALTINDEX';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'CACO3';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'POLYCOAT';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'SULFURCOAT';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'CHELATE';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'N';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'AMMN';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'NITN';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'UREAN';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'OTHERN';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'WINN';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'COATN';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'OCCLUDEDN';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'SLOWN';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'P';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'K';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'CA';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'MG';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'S';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'B';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'CO';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'CU';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'FE';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'MN';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'MO';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'ZN';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'CL';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'WSCA';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'WSMG';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'WSS';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'WSB';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'WSCO';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'WSCU';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'WSFE';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'WSMN';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'WSMO';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'WSZN';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'CHCA';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'CHMG';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'CHS';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'CHB';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'CHCO';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'CHCU';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'CHFE';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'CHMN';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'CHMO';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'CHZN';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'AS';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'CD';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'HG';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'NI';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'PB';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'SE';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'SOL232';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'SOL277';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'GRADE';
            DataType := ftString;
            Size := 8;
         end;

         with AddFieldDef do
         begin
            Name := 'USRGRADE';
            DataType := ftString;
            Size := 65;
         end;

         with AddFieldDef do
         begin
            Name := 'Release150';
            DataType := ftSmallInt;
         end;

         with AddFieldDef do
         begin
            Name := 'Release180';
            DataType := ftSmallInt;
         end;

         oTable.CreateDataSet;
      end;


      oTable.Active := True;
      oTable.AddIndex( 'ITEM', 'LOC;ITEM', [ixExpression]);
//      oTable.CreateDataSet;
      oTable.SaveToFile(UsrPath+'MyFert.cds');
//      oTable.Active := FALSE;
end;


(*
procedure TDataModule1.CreateTableMyChem;
var
   oTable : TClientDataSet;
begin
   oTable := TClientDataSet.Create( nil );

      oTable.Name := 'MyChem';

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
            Name := 'ITEM';
            DataType := ftString;
            Size := 8;
         end;

         with AddFieldDef do
         begin
            Name := 'UCC';
            DataType := ftString;
            Size := 7;
         end;

         with AddFieldDef do
         begin
            Name := 'ProductID';
            DataType := ftString;
            Size := 5;
         end;

         with AddFieldDef do
         begin
            Name := 'BarCode';
            DataType := ftString;
            Size := 16;
         end;

         with AddFieldDef do
         begin
            Name := 'COMPANY';
            DataType := ftString;
            Size := 20;
         end;

         with AddFieldDef do
         begin
            Name := 'EPA';
            DataType := ftString;
            Size := 15;
         end;

         with AddFieldDef do
         begin
            Name := 'ACTIVE';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'RUP';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'SIGNAL';
            DataType := ftString;
            Size := 13;
         end;

         with AddFieldDef do
         begin
            Name := 'ACTION';
            DataType := ftString;
            Size := 3;
         end;

         with AddFieldDef do
         begin
            Name := 'POSTED';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'REI';
            DataType := ftString;
            Size := 3;
         end;

         with AddFieldDef do
         begin
            Name := 'PPA';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'PPB';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'PPC';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'PPD';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'PPE';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'PPF';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'PPG';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'PPH';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'PPJ';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'PPK';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'PPL';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'PPM';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'PPN';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'EEA';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'EEB';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'EEC';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'EED';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'EEE';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'EEF';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'EEG';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'EEH';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'EEJ';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'EEK';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'EEL';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'EEM';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'EEN';
            DataType := ftBoolean;
         end;

         with AddFieldDef do
         begin
            Name := 'PP';
            DataType := ftMemo;
            Size := 1;
         end;

         with AddFieldDef do
         begin
            Name := 'EE';
            DataType := ftMemo;
            Size := 1;
         end;

         with AddFieldDef do
         begin
            Name := 'COKEY';
            DataType := ftString;
            Size := 43;
         end;
         oTable.CreateDataSet;
      end;

      oTable.Active := TRUE;
      oTable.AddIndex( 'ITEM', 'LOC;ITEM', [ixExpression, ixUnique]);
      oTable.SaveToFile(UsrPath+'MyChem.cds');
//      oTable.Active := FALSE;
end;
*)
procedure TDataModule1.CreateTableMySource;

var
   oTable : TClientDataSet;

   begin
   oTable := TClientDataSet.Create( nil );
      oTable.Name := 'MySource';

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
            Name := 'ITEM';
            DataType := ftString;
            Size := 8;
         end;

         with AddFieldDef do
         begin
            Name := 'AITEM';
            DataType := ftString;
            Size := 8;
         end;

         with AddFieldDef do
         begin
            Name := 'ITEMTYPE';
            DataType := ftString;
            Size := 1;
         end;

         with AddFieldDef do
         begin
            Name := 'Name';
            DataType := ftString;
            Size := 32;
         end;

         with AddFieldDef do
         begin
            Name := 'PERCENT';
            DataType := ftFloat;
         end;

         with AddFieldDef do
         begin
            Name := 'CAS';
            DataType := ftString;
            Size := 12;
         end;

         with AddFieldDef do
         begin
            Name := 'MixName';
            DataType := ftBoolean;
         end;
         oTable.CreateDataSet;
      end;


   {* The table was created and now the structural
      indexes will be added using the AddIndex method
      of TClientDataSet. *}

      oTable.Active := TRUE;
      oTable.AddIndex( 'LOCITEM', 'LOC;ITEM', [ixExpression]);
      oTable.SaveToFile(UsrPath+'MySource.cds');
//      oTable.Active := FALSE;
end;
{$ENDIF}

procedure TDataModule1.UsrDataReopen;
var
  Path,
  Ext   : String;
begin
  Ext := '.cds';

  Path:= DataModule1.SharedDocumentsPath;//.GroupPath;
  if Example then Path:= Path+'Example'+PathDelim
             else Path:= Path+'Company'+PathDelim;

  ItemClientDataSet    .Active:= False;
  MyFertClientDataSet  .Active:= False;
  MySourceClientDataSet.Active:= False;
  ItemClientDataSet    .FileName:= Path+'Item'+Ext;
  MyFertClientDataSet  .FileName:= Path+'MyFert'+Ext;
  MySourceClientDataSet.FileName:= Path+'MySource'+Ext;
  ItemClientDataSet    .Active:= True;
  MyFertClientDataSet  .Active:= True;
  MySourceClientDataSet.Active:= True;
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
var
  UnitsPath,
  Ext   : String;
begin
  Ext := '.cds';
  Example:= False;
  xExample:= False;

  UnitsPath:= UsrPath+'Item'+Ext;

  UnitsPath:= AppPath+'Units'+Ext;
  if not FileExists(UnitsPath) then begin
    ShowMessage('Documents '+DocumentsPath);
    ShowMessage('Shared Documents '+SharedDocumentsPath);
    ShowMessage('Public '+PublicPath);
    ShowMessage('Call Support');
    Exit;
  end;
{$IFDEF DoPaths}
  DoExample(False);
{$ELSE}
  UnitsClientDataSet   .FileName:= AppPath+'Units'+Ext;
  FertClientDataSet    .FileName:= AppPath+'Fert'+Ext;
  ActiveClientDataSet  .FileName:= AppPath+'Active'+Ext;
  TagClientDataSet     .FileName:= AppPath+'Tag'+Ext;

  FromClientDataSet    .FileName:= UsrPath+'From'+Ext;
  ItemClientDataSet    .FileName:= UsrPath+'Item'+Ext;
  MyFertClientDataSet  .FileName:= UsrPath+'MyFert'+Ext;
  MySourceClientDataSet.FileName:= UsrPath+'MySource'+Ext;
  GroupsClientDataSet  .FileName:= UsrPath+'Groups'+Ext;
  MatGroups            .FileName:= UsrPath+'MatGroups'+Ext;
  LogonClientDataSet   .FileName:= UsrPath+'Logon'+Ext;

  if not FileExists(FromClientDataSet    .FileName) then CreateTableFrom;
  if not FileExists(ItemClientDataSet    .FileName) then CreateTableItem;
  if not FileExists(MyFertClientDataSet  .FileName) then CreateTableMyFert;
  if not FileExists(MySourceClientDataSet.FileName) then CreateTableMySource;
  if not FileExists(GroupsClientDataSet  .FileName) then CreateTableGroups;
  if not FileExists(MatGroups            .FileName) then CreateTableMatGroups;
  if not FileExists(LogOnClientDataSet   .FileName) then CreateTableLogOn;

  ItemClientDataSet    .Active:= True;
  MyFertClientDataSet  .Active:= True;
  MySourceClientDataSet.Active:= True;

  GroupsClientDataSet  .Active:= True;
  MatGroups            .Active:= True;
  LogonClientDataSet   .Active:= True;

  UnitsClientDataSet   .Active:= True;
  FertClientDataSet    .Active:= True;
  ActiveClientDataSet  .Active:= True;
  TagClientDataSet     .Active:= True;


//  TagClientDataSet.Filtered:= True;
//  TagClientDataSet.Filter:= 'Language=''EN''';
//  TagClientDataSet.Filtered:= True;
//  TagClientDataSet.First;

  FromClientDataSet    .Active:= True;
 {$ENDIF}
end;

end.


