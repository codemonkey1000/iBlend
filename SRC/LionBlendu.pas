unit LionBlendu;
{ $DEFINE Advanced}
{$DEFINE AutoCalc}
{$DEFINE XMLGroup}
interface

uses
{$IFDEF Advanced}
  Advanced,
{$ENDIF}
  LionSolve,
  MPS,

  Math,
  IniFiles,

  System.IOUtils,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.Rtti, System.Bindings.Outputs, System.Actions,

  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.StdCtrls, FMX.Edit, FMX.Layouts, FMX.TabControl,FMX.ActnList,
  FMX.Controls.Presentation,

  Data.Bind.Controls, Data.Bind.EngExt, Data.DB,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,

  Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  Fmx.Bind.Editors,
  Fmx.Bind.Navigator,
  FMX.Grid, FMX.ListBox, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.Grid.Style, FMX.EditBox,
  FMX.SpinBox, FMX.ComboEdit,FMX.Colors, FMX.CalendarEdit, FMX.Memo.Types,

  FMX.wwCheckBox, FMX.wwColumnTypes, FMX.wwDataGrid, FMX.wwLayouts,
  FMX.wwBaseGrid,

  FMX.wwEdit, FMX.wwSearchBox, FMX.wwLayoutGrid, FMX.wwTypes, FMX.Menus,
  Data.FMTBcd, DataSnap.DBClient, Data.Bind.DBXScope;

type
  TFormulateForm = class(TForm)
    TabControl1: TTabControl;
    FormulateTabItem: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    TabItem5: TTabItem;
    TabItem8: TTabItem;
    Layout5: TLayout;
    RadioButton3: TRadioButton;
    Label16: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    StringGrid1: TStringGrid;
    BindNavigator1: TBindNavigator;
    BindSourceDBUnit: TBindSourceDB;
    BindingsList1: TBindingsList;
    OpenDialog1: TOpenDialog;
    RadioButton9: TRadioButton;
    BindSourceDBFert: TBindSourceDB;
    LinkFillControlToField1: TLinkFillControlToField;
    Panel1: TPanel;
    BindNavigatorItem: TBindNavigator;
    edDescription: TEdit;
    Label32: TLabel;
    Loc: TEdit;
    Item: TEdit;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    ListBox1: TListBox;
    TabControl2: TTabControl;
    TabItem9: TTabItem;
    TabItem10: TTabItem;
    TabItem11: TTabItem;
    TabItem12: TTabItem;
    PanelPrimary: TPanel;
    N: TEdit;
    P: TEdit;
    K: TEdit;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    PanelDetail: TPanel;
    AmmN: TEdit;
    NitN: TEdit;
    UreaN: TEdit;
    OtherN: TEdit;
    WinN: TEdit;
    Coat: TEdit;
    Slow: TEdit;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    PanelSecondary: TPanel;
    Ca: TEdit;
    WSCa: TEdit;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    PanelCalcium: TPanel;
    PanelMagnesium: TPanel;
    Mg: TEdit;
    WSMg: TEdit;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    PanelSulfur: TPanel;
    S: TEdit;
    WSS: TEdit;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Cl: TEdit;
    PanelMinor: TPanel;
    PanelBoron: TPanel;
    B: TEdit;
    WSB: TEdit;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    CHB: TEdit;
    Label60: TLabel;
    PanelCo: TPanel;
    Co: TEdit;
    WSCo: TEdit;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    CHCo: TEdit;
    Label64: TLabel;
    PanelCu: TPanel;
    Cu: TEdit;
    WSCu: TEdit;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    CHCu: TEdit;
    Label68: TLabel;
    PanelIron: TPanel;
    Fe: TEdit;
    WSFe: TEdit;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    CHFe: TEdit;
    Label72: TLabel;
    PanelMn: TPanel;
    Mn: TEdit;
    WSMn: TEdit;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    CHMn: TEdit;
    Label76: TLabel;
    PanelMo: TPanel;
    Mo: TEdit;
    WSMo: TEdit;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    CHMo: TEdit;
    Label80: TLabel;
    PanelZn: TPanel;
    Zn: TEdit;
    WSZn: TEdit;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    CHZn: TEdit;
    Label84: TLabel;
    PanelNonNutrient: TPanel;
    Ar: TEdit;
    Label85: TLabel;
    PanelArsenic: TPanel;
    PanelCadminum: TPanel;
    CD: TEdit;
    Label86: TLabel;
    PanelMercury: TPanel;
    Hg: TEdit;
    Label87: TLabel;
    PanelLead: TPanel;
    Pb: TEdit;
    Label88: TLabel;
    PanelNickel: TPanel;
    Ni: TEdit;
    Label90: TLabel;
    PanelSelenium: TPanel;
    Se: TEdit;
    Label91: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label89: TLabel;
    AccountNumberEdit: TEdit;
    CheckBox5: TCheckBox;
    Panel6: TPanel;
    Fert: TCheckBox;
    Chem: TCheckBox;
    Serv: TCheckBox;
    Othr: TCheckBox;
    Label92: TLabel;
    Label93: TLabel;
    MixName: TEdit;
    MixedItem: TCheckBox;
    Label94: TLabel;
    FUSUnit: TListBox;
    BindSourceUnits: TBindSourceDB;
    InvUnit: TListBox;
    MixUnit: TListBox;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    BlendCost: TEdit;
    MarketCost: TEdit;
    Price1: TEdit;
    Price2: TEdit;
    Price3: TEdit;
    Price4: TEdit;
    Price5: TEdit;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Release30: TEdit;
    Label105: TLabel;
    Panel12: TPanel;
    Label106: TLabel;
    Release60: TEdit;
    Panel13: TPanel;
    Label107: TLabel;
    Release180: TEdit;
    Panel14: TPanel;
    Label108: TLabel;
    Release150: TEdit;
    Panel15: TPanel;
    Label109: TLabel;
    Release120: TEdit;
    Panel16: TPanel;
    Label110: TLabel;
    Release90: TEdit;
    ReportOnTag: TCheckBox;
    PolyCoat: TCheckBox;
    SulfurCoat: TCheckBox;
    Chelated: TCheckBox;
    Label111: TLabel;
    Label113: TLabel;
    Label112: TLabel;
    Label114: TLabel;
    Sol32: TEdit;
    Sol232: TEdit;
    Sol77: TEdit;
    Sol277: TEdit;
    Density: TEdit;
    SPG: TEdit;
    POLYP: TEdit;
    WATER: TEdit;
    CLAY: TEdit;
    Ranco: TEdit;
    Fluid: TCheckBox;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    HeatCAP: TEdit;
    HeatSOL: TEdit;
    HEATNH3: TEdit;
    LIQP: TEdit;
    SALTINDEX: TEdit;
    CACO3: TEdit;
    Label122: TLabel;
    Label123: TLabel;
    Label124: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    Ammonia: TEdit;
    Label129: TLabel;
    Label130: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    BindSourceDBMyFert: TBindSourceDB;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField8: TLinkControlToField;
    LinkControlToField9: TLinkControlToField;
    LinkControlToField10: TLinkControlToField;
    LinkControlToField11: TLinkControlToField;
    LinkControlToField12: TLinkControlToField;
    LinkControlToField13: TLinkControlToField;
    LinkControlToField14: TLinkControlToField;
    LinkControlToField15: TLinkControlToField;
    LinkControlToField16: TLinkControlToField;
    LinkControlToField17: TLinkControlToField;
    LinkControlToField18: TLinkControlToField;
    LinkControlToField19: TLinkControlToField;
    LinkControlToField20: TLinkControlToField;
    LinkControlToField21: TLinkControlToField;
    LinkControlToField22: TLinkControlToField;
    LinkControlToField23: TLinkControlToField;
    BindSourceDBX: TBindSourceDB;
    LinkControlToField27: TLinkControlToField;
    LinkControlToField28: TLinkControlToField;
    LinkControlToField29: TLinkControlToField;
    LinkControlToField30: TLinkControlToField;
    LinkControlToField31: TLinkControlToField;
    LinkControlToField32: TLinkControlToField;
    LinkControlToField33: TLinkControlToField;
    LinkControlToField34: TLinkControlToField;
    LinkControlToField35: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    LinkControlToField36: TLinkControlToField;
    LinkControlToField37: TLinkControlToField;
    LinkControlToField38: TLinkControlToField;
    LinkControlToField39: TLinkControlToField;
    LinkControlToField40: TLinkControlToField;
    LinkControlToField41: TLinkControlToField;
    LinkControlToField42: TLinkControlToField;
    LinkControlToField43: TLinkControlToField;
    LinkControlToField44: TLinkControlToField;
    LinkControlToField45: TLinkControlToField;
    LinkControlToField46: TLinkControlToField;
    LinkControlToField47: TLinkControlToField;
    LinkControlToField48: TLinkControlToField;
    LinkControlToField49: TLinkControlToField;
    LinkControlToField50: TLinkControlToField;
    LinkControlToField51: TLinkControlToField;
    LinkControlToField52: TLinkControlToField;
    LinkControlToField53: TLinkControlToField;
    CHCA: TEdit;
    labCHCA: TLabel;
    LinkControlToField54: TLinkControlToField;
    CHMG: TEdit;
    Label56: TLabel;
    LinkControlToField55: TLinkControlToField;
    LinkListControlToField1: TLinkListControlToField;
    LinkListControlToField2: TLinkListControlToField;
    LinkListControlToField3: TLinkListControlToField;
    BindSourceDBActive: TBindSourceDB;
    TabControl3: TTabControl;
    TabItem13: TTabItem;
    TabItem14: TTabItem;
    TabItem15: TTabItem;
    AGrid: TGrid;
    StringColumn12: TStringColumn;
    StringColumn13: TStringColumn;
    CurrencyColumn1: TCurrencyColumn;
    CurrencyColumn2: TCurrencyColumn;
    FloatColumn1: TFloatColumn;
    FloatColumn2: TFloatColumn;
    FloatColumn3: TFloatColumn;
    CheckColumn1: TCheckColumn;
    CheckColumn2: TCheckColumn;
    RGrid: TGrid;
    StringColumn14: TStringColumn;
    StringColumn15: TStringColumn;
    FloatColumn4: TFloatColumn;
    FloatColumn5: TFloatColumn;
    FloatColumn6: TFloatColumn;
    CheckColumn3: TCheckColumn;
    CheckColumn4: TCheckColumn;
    CurrencyColumn3: TCurrencyColumn;
    CurrencyColumn4: TCurrencyColumn;
    BGrid: TGrid;
    TabItem16: TTabItem;
    LoadMPS: TButton;
    SaveMPS: TButton;
    Button2: TButton;
    CheckColumn5: TCheckColumn;
    CheckColumn6: TCheckColumn;
    BtnSolve: TButton;
    InputLayout: TLayout;
    TagBtn: TButton;
    BtnLoad: TButton;
    SwTrace: TSwitch;
    Label133: TLabel;
    InputGrid: TGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    PerAcreFloatColumn: TFloatColumn;
    FloatColumn8: TFloatColumn;
    Start: TButton;
    Grade: TButton;
    NSpinBox: TSpinBox;
    PSpinBox: TSpinBox;
    KSpinBox: TSpinBox;
    GradeLabel: TLabel;
    BtnItemize: TButton;
    BtnPrint: TButton;
    GroupEditx: TComboEdit;
    Memo1: TMemo;
    AILayout: TLayout;
    Panel17: TPanel;
    SourceLayout: TLayout;
    Splitter3: TSplitter;
    SrcStringGrid: TStringGrid;
    BindSourceDBFrom: TBindSourceDB;
    BindNavigator2: TBindNavigator;
    SourcesLayout: TLayout;
    FertDataGrid: TwwDataGrid;
    FertDataGridITEM: TwwGridColumn;
    FertDataGridNAME: TwwGridColumn;
    FertDataGridN: TwwGridColumn;
    FertDataGridP: TwwGridColumn;
    FertDataGridK: TwwGridColumn;
    FertDataGridUSRGRADE: TwwGridColumn;
    FilterPanel: TPanel;
    ShowFormTB2: TToolBar;
    DryFilter2: TRadioButton;
    LiquidFilter2: TRadioButton;
    AllFormFilter2: TRadioButton;
    ShowFormLabel2: TLabel;
    GradeFilter2: TToolBar;
    NFilter2: TRadioButton;
    PFilter2: TRadioButton;
    KFilter2: TRadioButton;
    ALLFilter2: TRadioButton;
    ShowNPKLabel2: TLabel;
    BuildBtn: TButton;
    FertDataGridCOMPANY: TwwGridColumn;
    FertDataGridUFTRS: TwwGridColumn;
    FertDataGridWATER: TwwGridColumn;
    GenericCheckbox: TwwCheckbox;
    PolyCheck: TCheckBox;
    SulfurCheck: TCheckBox;
    ChelateCheck: TCheckBox;
    HeatBox: TCheckBox;
    FertDataGridREPORT: TwwGridColumn;
    FertDataGridREGULATED: TwwGridColumn;
    Splitter1: TSplitter;
    wwDataGridFrom: TwwDataGrid;
    wwDataGridFromAIName: TwwGridColumn;
    FavoriteCheck: TCheckBox;
    MainFilierPanel: TPanel;
    FilterCheckBox: TCheckBox;
    LinkGridToDataSourceBindSourceDBX: TLinkGridToDataSource;
    wwDataGridItem: TwwDataGrid;
    BindSourceDBItem: TBindSourceDB;
    wwDataGridItemItem: TwwGridColumn;
    wwDataGridItemPrice1: TwwGridColumn;
    wwDataGridItemFUSName: TwwGridColumn;
    wwDataGridItemFUSCost: TwwGridColumn;
    wwDataGridItemFUSUOM: TwwGridColumn;
    wwDataGridItemHazardous: TwwGridColumn;
    wwDataGridItemFUSLBS: TwwGridColumn;
    Panel2: TPanel;
    wwDataGridItemTYPE: TwwGridColumn;
    wwDataGridItemIsFluid: TwwGridColumn;
    FormPanel: TPanel;
    TypePanel: TPanel;
    AllRadioButton: TRadioButton;
    FertRadioButton: TRadioButton;
    ChemRadioButton: TRadioButton;
    OtherRadioButton: TRadioButton;
    EveryRadioButton: TRadioButton;
    DryRadioButton: TRadioButton;
    FluidRadioButton: TRadioButton;
    ConvertBtn: TButton;
    MetricLabel: TLabel;
    MetricSwitch: TSwitch;
    GroupPanel: TPanel;
    DryLabel: TLabel;
    FluidLabel: TLabel;
    DrySwitch: TSwitch;
    MainPanel: TPanel;
    GroupLabel: TLabel;
    GroupEdt: TEdit;
    LocLabel: TLabel;
    LocEdit: TEdit;
    AcresLabel: TLabel;
    AcresEdit: TEdit;
    RateLabel: TLabel;
    RateSpinBox: TSpinBox;
    GroupEdit: TListBox;
    LoadXMLBtn: TButton;
    LinkControlToField24: TLinkControlToField;
    LinkControlToField25: TLinkControlToField;
    LinkControlToField26: TLinkControlToField;
    DoMyBtn: TButton;
    LinkControlToField56: TLinkControlToField;
    LinkControlToField57: TLinkControlToField;
    LinkControlToField58: TLinkControlToField;
    LinkControlToField59: TLinkControlToField;
    LinkControlToField60: TLinkControlToField;
    LinkControlToField61: TLinkControlToField;
    LinkControlToField62: TLinkControlToField;
    wwAIDataGrid: TwwDataGrid;
    wwGridColumn1: TwwGridColumn;
    AddSourceBtn: TButton;
    ActiveIngreidentPanel: TPanel;
    AIBindNavigator: TBindNavigator;
    AIIDLabel: TLabel;
    AINameLabel: TLabel;
    CASLabel: TLabel;
    AITypeLabel: TLabel;
    AIMOWtLabel: TLabel;
    CreateIDButton: TButton;
    AIIDEdit: TEdit;
    AINameEdit: TEdit;
    AICASEdit: TEdit;
    AITypeEdit: TEdit;
    AIMOWtEdit: TEdit;
    TotalBatchLabel: TLabel;
    RatiosSwitch: TSwitch;
    AutoSwitch: TSwitch;
    Label4: TLabel;
    AutoLabel: TLabel;
    AppRate: TEdit;
    SaltOutTemp: TEdit;
    SaltOutTF: TEdit;
    Label1: TLabel;
    ExampleSwitch: TSwitch;
    SaveBtn: TButton;
    BindSourceDBFirm: TBindSourceDB;
    TabItem1: TTabItem;
    MatSys: TListBox;
    Label2: TLabel;
    gN: TEdit;
    gP: TEdit;
    gK: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    SaltOutTemperature: TSpinBox;
    SaltOutLabel: TLabel;
    Label7: TLabel;
    rN: TSpinBox;
    rP: TSpinBox;
    rK: TSpinBox;
    LabelDash1: TLabel;
    LabelDash2: TLabel;
    ClearBtn: TButton;
    ReportMemo2: TMemo;
    ReportMemo: TMemo;
    ShipBtn: TButton;
    LogOnTabItem: TTabItem;
    SpinBox1: TSpinBox;
    SpinBox2: TSpinBox;
    SpinBox3: TSpinBox;
    SpinBox4: TSpinBox;
    SpinBox5: TSpinBox;
    SpinBox6: TSpinBox;
    SpinBox7: TSpinBox;
    SpinBox8: TSpinBox;
    Label151: TLabel;
    Label152: TLabel;
    Label153: TLabel;
    Label154: TLabel;
    Label155: TLabel;
    Label156: TLabel;
    Label157: TLabel;
    Label158: TLabel;
    Label159: TLabel;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    BindSourceDB1: TBindSourceDB;
    BindSourceDBDADD: TBindSourceDB;
    OutputLayout: TLayout;
    OutPutTabControl: TTabControl;
    MixTabItem: TTabItem;
    TagTabItem: TTabItem;
    InvoiceDataTabItem: TTabItem;
    FileTabItem: TTabItem;
    MixLayout: TLayout;
    MixMemo: TMemo;
    MixPanel1: TPanel;
    BatchesLabel: TLabel;
    MaxLbsLabel: TLabel;
    MaxCFSpinBox: TSpinBox;
    NumBatchesSpinBox: TSpinBox;
    MaxCFLabel: TLabel;
    MaxBatchSpinBox: TSpinBox;
    DensityLabel: TLabel;
    DensityEdit: TEdit;
    EqualSwitch: TSwitch;
    EqualLabel: TLabel;
    TagLayout: TLayout;
    LabelMemo: TMemo;
    LabelPanel: TPanel;
    LanguageLabel: TLabel;
    ComboEdit1: TComboEdit;
    ElementLabel: TLabel;
    Switch2: TSwitch;
    InvoiceLayout: TLayout;
    InvoiceMemo: TMemo;
    InvoicePanel: TPanel;
    TonsLabel: TLabel;
    PriceLabel: TLabel;
    TotalLabel: TLabel;
    CostLabel: TLabel;
    MarginLabel: TLabel;
    iTonsLabel: TLabel;
    iPriceLabel: TLabel;
    iTotalLabel: TLabel;
    iCostLabel: TLabel;
    iMarginLabel: TLabel;
    CustomerLayout: TLayout;
    FileLayout: TLayout;
    FileMemo: TMemo;
    ItemizeLayout: TLayout;
    ItemizeGrid: TGrid;
    MaterialColumn: TColumn;
    QuantityColumn: TFloatColumn;
    UnitColumn: TStringColumn;
    FirmLayout: TLayout;
    FirmName: TEdit;
    NameLabel: TLabel;
    AddressLabel: TLabel;
    FirmAddress: TEdit;
    FirmCityLabel: TLabel;
    FirmCity: TEdit;
    FirmStateLabel: TLabel;
    FirmState: TEdit;
    FirmZipCodeLabel: TLabel;
    FirmZipCode: TEdit;
    SearchEditButton2: TSearchEditButton;
    FirmNameAddressLabel: TLabel;
    FirmUseLabel: TLabel;
    cbFirmUse: TComboBox;
    FirmID: TEdit;
    FirmIDLabel: TLabel;
    FirmPhone: TEdit;
    FirmPhoneLabel: TLabel;
    FirmeMail: TEdit;
    FirmeMailLabel: TLabel;
    CustomerBindNavigator: TBindNavigator;
    FirmShipperID: TEdit;
    lblShipperID: TLabel;
    FirmCounty: TEdit;
    lblFirmCounty: TLabel;
    StoreID: TEdit;
    lblStoreID: TLabel;
    EditFirmType: TEdit;
    FirmCountyName: TEdit;
    SetStore: TButton;
    FirmFilter: TLabel;
    LicenseLayout: TLayout;
    LicensePanel: TPanel;
    AllStatesLicense: TComboBox;
    EditLicense: TEdit;
    lblLicense: TLabel;
    ReturnToProduct: TButton;
    swSetupStateInfo: TSwitch;
    lblSetupStateInfo: TLabel;
    CreateExampleData: TButton;
    RestoreExampleData: TButton;
    C1: TRadioButton;
    C2: TRadioButton;
    C3: TRadioButton;
    C4: TRadioButton;
    C5: TRadioButton;
    edSearch: TEdit;
    ZipCode_Edit: TEdit;
    ActionList1: TActionList;
    LiveBindingsBindNavigateFirst1: TFMXBindNavigateFirst;
    County_Label: TLabel;
    City_Edit: TEdit;
    County_Edit: TEdit;
    FIPS_Edit: TEdit;
    St_Edit: TEdit;
    State_Edit: TEdit;
    Customer_Panel: TPanel;
    City_Label: TLabel;
    State_Label: TLabel;
    Splitter2: TSplitter;
    ID_Label: TLabel;
    ID_Edit: TEdit;
    Address1_Label: TLabel;
    Company_Edit: TEdit;
    Company_Label: TLabel;
    Address1_Edit: TEdit;
    Address2Label: TLabel;
    Address2_Edit: TEdit;
    Phone_Label: TLabel;
    Phone_Edit: TEdit;
    NewZip_Panel: TPanel;
    NewZipCode_Edit: TEdit;
    NewZipCode_Label: TLabel;
    NewCity_Edit: TEdit;
    NewFIPS_Edit: TEdit;
    NewID_Edit: TEdit;
    AddCust_Button: TButton;
    SearchEditButton1: TSearchEditButton;
    Sort_Edit: TEdit;
    DropDownEditButton1: TDropDownEditButton;
    DropDownEditButton2: TDropDownEditButton;
    Name_Label: TLabel;
    First_Edit: TEdit;
    MI_Edit: TEdit;
    Last_Edit: TEdit;
    Mobile_Edit: TEdit;
    eMail_Label: TLabel;
    eMail_Edit: TEdit;
    Mobile_Label: TLabel;
    Sort_Label: TLabel;
    Active_CheckBox: TCheckBox;
    Retail_CheckBox: TCheckBox;
    Vendor_CheckBox: TCheckBox;
    Wholesale_CheckBox: TCheckBox;
    Applicator_CheckBox: TCheckBox;
    Exempt_CheckBox: TCheckBox;
    Cash_CheckBox: TCheckBox;
    CheckBox16: TCheckBox;
    Price_Panel: TPanel;
    Price1_RadioButton: TRadioButton;
    Price2_RadioButton: TRadioButton;
    Price3_RadioButton: TRadioButton;
    Price4_RadioButton: TRadioButton;
    Price5_RadioButton: TRadioButton;
    CustomerType_Label: TLabel;
    Button1: TButton;
    NavigatorBindSourceDBDADD: TBindNavigator;
    LinkControlToFieldNAME: TLinkControlToField;
    LinkControlToFieldADDRESS: TLinkControlToField;
    LinkControlToFieldADDRESS2: TLinkControlToField;
    LinkControlToFieldCITY: TLinkControlToField;
    LinkControlToFieldSTATE: TLinkControlToField;
    LinkControlToFieldZIP: TLinkControlToField;
    LinkControlToFieldSTATE2: TLinkControlToField;
    LinkControlToFieldCOUNTY: TLinkControlToField;
    LinkControlToFieldCOUNTYKEY: TLinkControlToField;
    LinkControlToFieldPHONE: TLinkControlToField;
    LinkControlToFieldMOBILE: TLinkControlToField;
    LinkControlToFieldFIRSTNAME: TLinkControlToField;
    LinkControlToFieldMIDDLENAME: TLinkControlToField;
    LinkControlToFieldLASTNAME: TLinkControlToField;
    LinkControlToFieldID: TLinkControlToField;
    LinkControlToFieldSORTKEY: TLinkControlToField;
    LinkControlToFieldEMAIL: TLinkControlToField;
    LinkControlToFieldRETAIL: TLinkControlToField;
    LinkControlToFieldWHOLESALE: TLinkControlToField;
    LinkControlToFieldDELETED: TLinkControlToField;
    AllCheckBox: TCheckBox;
    BindSourceDBDACC: TBindSourceDB;
    BindSourceDBDHIS: TBindSourceDB;
    MenuInsert: TMenuItem;
    InsertRow: TMenuItem;
    InsertCol: TMenuItem;
    MenuDelete: TMenuItem;
    DeleteRow: TMenuItem;
    DeleteColumn: TMenuItem;
    PopUpMenu1: TPopupMenu;
    NutFrom: TMenuItem;
    DoneInsRow: TButton;
    DoneInsCol: TButton;
    wwDataGrid1: TwwDataGrid;
    DoneInsRow2: TButton;
    wwDataGrid2: TwwDataGrid;
    wwDataGrid1Loc: TwwGridColumn;
    wwDataGrid1Item: TwwGridColumn;
    wwDataGrid1Bin: TwwGridColumn;
    wwDataGrid1AccountNumber: TwwGridColumn;
    wwDataGrid1CCDB: TwwGridColumn;
    wwDataGrid1TYPE: TwwGridColumn;
    wwDataGrid1InventoryName: TwwGridColumn;
    wwDataGrid1InventoryUOM: TwwGridColumn;
    wwDataGrid1InventoryLBS: TwwGridColumn;
    wwDataGrid1InventoryNUM: TwwGridColumn;
    wwDataGrid1InventoryQOH: TwwGridColumn;
    wwDataGrid1InventoryCOST: TwwGridColumn;
    wwDataGrid1InventoryCommitted: TwwGridColumn;
    wwDataGrid1InventoryReorder: TwwGridColumn;
    wwDataGrid1InventoryLotNum: TwwGridColumn;
    wwDataGrid1BeginningQty: TwwGridColumn;
    wwDataGrid1BeginningDate: TwwGridColumn;
    wwDataGrid1InvoiceName: TwwGridColumn;
    wwDataGrid1InvoiceUOM: TwwGridColumn;
    wwDataGrid1InvoiceLBS: TwwGridColumn;
    wwDataGrid1InvoiceNUM: TwwGridColumn;
    wwDataGrid1Price1: TwwGridColumn;
    wwDataGrid1Price2: TwwGridColumn;
    wwDataGrid1Price3: TwwGridColumn;
    wwDataGrid1Price4: TwwGridColumn;
    wwDataGrid1Price5: TwwGridColumn;
    wwDataGrid1Billable: TwwGridColumn;
    wwDataGrid1FUSName: TwwGridColumn;
    wwDataGrid1FUSCost: TwwGridColumn;
    wwDataGrid1FUSUOM: TwwGridColumn;
    wwDataGrid1FUSLBS: TwwGridColumn;
    wwDataGrid1FUSReport: TwwGridColumn;
    wwDataGrid1FUSMixed: TwwGridColumn;
    wwDataGrid1FUSPromptLower: TwwGridColumn;
    wwDataGrid1FUSPromptUpper: TwwGridColumn;
    wwDataGrid1FUSLowerBound: TwwGridColumn;
    wwDataGrid1FUSUpperBound: TwwGridColumn;
    wwDataGrid1FUSMixUOM: TwwGridColumn;
    wwDataGrid1IsFluid: TwwGridColumn;
    wwDataGrid1Density: TwwGridColumn;
    wwDataGrid1SPG: TwwGridColumn;
    wwDataGrid1Ticks: TwwGridColumn;
    wwDataGrid1IsFormula: TwwGridColumn;
    wwDataGrid1Formula: TwwGridColumn;
    wwDataGrid1Regulated: TwwGridColumn;
    wwDataGrid1Hazardous: TwwGridColumn;
    wwDataGrid1ERG: TwwGridColumn;
    wwDataGrid1DOT: TwwGridColumn;
    wwDataGrid1ShipName: TwwGridColumn;
    wwDataGrid1Placard: TwwGridColumn;
    wwDataGrid1Class: TwwGridColumn;
    wwDataGrid1Package: TwwGridColumn;
    wwDataGrid1ListID: TwwGridColumn;
    wwDataGrid1COKEY: TwwGridColumn;
    wwDataGrid1UCC: TwwGridColumn;
    wwDataGrid1PRODUCTID: TwwGridColumn;
    wwDataGrid1BARCODE: TwwGridColumn;
    BindSourceDBX1: TBindSourceDBX;
    wwDataGrid2MixName: TwwGridColumn;
    wwDataGrid2Code: TwwGridColumn;
    RadioButton4: TRadioButton;
    Button3: TButton;
    PWChangeBtn: TButton;
    OKBtn: TButton;
    CancelBtn: TButton;
    UserComboBox: TComboBox;
    PWCurrent: TEdit;
    LogOnPanel: TPanel;
    UserNamelbl: TLabel;
    PassWordLBL: TLabel;
    xPassword: TEdit;
    LOCComboBox: TComboBox;
    NewPassword: TLabel;
    Confirm: TLabel;
    xNewPassword: TEdit;
    PWConfirm: TEdit;
    Button4: TButton;
    Panel18: TPanel;
    Label3: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Edit2: TEdit;
    Label6: TLabel;
    Switch1: TSwitch;
    Switch3: TSwitch;
    Label14: TLabel;
    Label15: TLabel;
    Edit3: TEdit;
    Loc1: TRadioButton;
    Loc2: TRadioButton;
    RadioButton12: TRadioButton;
    Loc999: TRadioButton;
    Label21: TLabel;
    CurentLOC: TEdit;
    Path: TEdit;
    ExportBTN: TButton;
    ImportBTN: TButton;
    ToExample: TButton;
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton7Click(Sender: TObject);
    procedure RadioButton8Click(Sender: TObject);
    procedure RadioButton9Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure CheckBox3Change(Sender: TObject);
    procedure CheckBox4Change(Sender: TObject);
    procedure BGridSetValue(Sender: TObject; const ACol, ARow: Integer;
      const Value: TValue);
    procedure BGridGetValue(Sender: TObject; const ACol, ARow: Integer;
      var Value: TValue);
    procedure AGridSetValue(Sender: TObject; const ACol, ARow: Integer;
      const Value: TValue);
    procedure AGridGetValue(Sender: TObject; const ACol, ARow: Integer;
      var Value: TValue);
    procedure RGridGetValue(Sender: TObject; const ACol, ARow: Integer;
      var Value: TValue);
    procedure RGridSetValue(Sender: TObject; const ACol, ARow: Integer;
      const Value: TValue);
    procedure ClearMemos;
    procedure SaveMPSClick(Sender: TObject);
    procedure LoadMPSClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure InputGridGetValue(Sender: TObject; const ACol, ARow: Integer;
      var Value: TValue);
    procedure InputGridSetValue(Sender: TObject; const ACol, ARow: Integer;
      const Value: TValue);
    procedure BtnSolveClick(Sender: TObject);
    procedure BtnLoadClick(Sender: TObject);
    procedure TagBtnClick(Sender: TObject);
    procedure SwTraceSwitch(Sender: TObject);
    procedure TabItem5Click(Sender: TObject);
    procedure TabItem14Click(Sender: TObject);
    procedure TabItem13Click(Sender: TObject);
    procedure TabItem15Click(Sender: TObject);
    procedure StartClick(Sender: TObject);
    procedure GradeClick(Sender: TObject);
    procedure BtnItemizeClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure LoadXMLGroup(Group: string;var Memo1: TMemo);

    procedure GroupEditxClosePopup(Sender: TObject);
    procedure KSpinBoxChange(Sender: TObject);
    procedure TabItem12Click(Sender: TObject);
    procedure AIGridCellClick(const Column: TColumn; const Row: Integer);
    procedure AIGridSelectCell(Sender: TObject; const ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ActGridSetValue(Sender: TObject; const ACol, ARow: Integer;
      const Value: TValue);
    procedure BuildBtnClick(Sender: TObject);
    procedure AllFormFilter2Change(Sender: TObject);
    procedure DryFilter2Change(Sender: TObject);
//    procedure LiquidFilter2Change(Sender: TObject);
    procedure GenericCheckboxChange(Sender: TObject);
    procedure SulfurCheckChange(Sender: TObject);
    procedure ChelateCheckChange(Sender: TObject);
    procedure HeatBoxChange(Sender: TObject);
    procedure FilterCheckBoxChange(Sender: TObject);
    procedure ALLFilter2Click(Sender: TObject);
    procedure DryFilter2Click(Sender: TObject);
    procedure AllFormFilter2Click(Sender: TObject);
//    procedure LiquidFilter2Click(Sender: TObject);
    procedure GenericCheckboxClick(Sender: TObject);
    procedure FavoriteCheckClick(Sender: TObject);
    procedure FilterCheckBoxClick(Sender: TObject);
    procedure ChelateCheckClick(Sender: TObject);
    procedure SulfurCheckClick(Sender: TObject);
    procedure HeatBoxClick(Sender: TObject);
    procedure AllRadioButtonClick(Sender: TObject);
    procedure FertRadioButtonClick(Sender: TObject);
    procedure ChemRadioButtonClick(Sender: TObject);
    procedure OtherRadioButtonClick(Sender: TObject);
    procedure EveryRadioButtonClick(Sender: TObject);
    procedure DryRadioButtonChange(Sender: TObject);
    procedure FluidRadioButtonClick(Sender: TObject);
    procedure wwDataGridItemCellChanged(Sender: TwwDataGrid);
    procedure GroupEditxPopup(Sender: TObject);
    procedure ConvertBtnClick(Sender: TObject);
    procedure TagTabItemClick(Sender: TObject);
    procedure MetricSwitchSwitch(Sender: TObject);
    procedure DrySwitchSwitch(Sender: TObject);
    procedure MaxBatchSpinBoxChange(Sender: TObject);
    procedure AcresEditKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure ComboEdit1ClosePopup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GroupEditItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure DoMyBtnClick(Sender: TObject);
    procedure EqualSwitchClick(Sender: TObject);
    procedure MaxBatchSpinBoxKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure EqualSwitchKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure MaxCFSpinBoxKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure RateSpinBoxKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure AddSourceBtnClick(Sender: TObject);
    procedure wwAIDataGridKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure CustomerTabItemClick(Sender: TObject);
    procedure InvoiceDataTabItemClick(Sender: TObject);
    procedure FileTabItemClick(Sender: TObject);
    procedure ItemizeGridGetValue(Sender: TObject; const ACol, ARow: Integer;
      var Value: TValue);
    procedure ItemizeGridSetValue(Sender: TObject; const ACol, ARow: Integer;
      const Value: TValue);
    procedure SaveBtnClick(Sender: TObject);
    procedure rKChange(Sender: TObject);
    procedure MatSysClick(Sender: TObject);
    procedure rPChange(Sender: TObject);
    procedure rNChange(Sender: TObject);
    procedure SaltOutTemperatureChange(Sender: TObject);
    procedure RatiosSwitchSwitch(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);
    procedure InputGridEditingDone(Sender: TObject; const ACol, ARow: Integer);
    procedure XMLListBoxItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure LocEditExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExampleSwitchSwitch(Sender: TObject);
    procedure CuustomerTabItemClick(Sender: TObject);
    procedure AllCheckBoxClick(Sender: TObject);
    procedure Last_EditExit(Sender: TObject);
    procedure DropDownEditButton3Click(Sender: TObject);
    procedure ORDClick(Sender: TObject);
    procedure OpenGAXClick(Sender: TObject);
    procedure MixTabItemClick(Sender: TObject);
    procedure PSpinBoxChange(Sender: TObject);
    procedure NSpinBoxChange(Sender: TObject);
    procedure FertDataGridCheckboxClick(Sender: TObject;
      CellAttributes: TwwCellAttributes; AFieldName: string);
    procedure MenuInsertClick(Sender: TObject);
    procedure NutFromClick(Sender: TObject);
    procedure InsertRowClick(Sender: TObject);
    procedure InsertColumnClick(Sender: TObject);
    procedure MenuDeleteClick(Sender: TObject);
    procedure DeleteColumnClick(Sender: TObject);
    procedure DeleteRowClick(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure DoneInsColClick(Sender: TObject);
    procedure InsertColClick(Sender: TObject);
    procedure DoneInsRow2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure PWChangeBtnClick(Sender: TObject);
    procedure LogOnTabItemClick(Sender: TObject);
//    procedure ComboBox1Click(Sender: TObject);
    procedure UserComboBoxClick(Sender: TObject);
    procedure UserComboBoxClosePopup(Sender: TObject);
    procedure UserComboBoxPopup(Sender: TObject);
    procedure xPasswordKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure xNewPasswordKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure PWConfirmKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure Button4Click(Sender: TObject);
    procedure GroupEdtExit(Sender: TObject);
    procedure Loc1Click(Sender: TObject);
    procedure Loc2Click(Sender: TObject);
    procedure Loc999Click(Sender: TObject);
    procedure ExportBTNClick(Sender: TObject);
    procedure ImportBTNClick(Sender: TObject);
    procedure ToExampleClick(Sender: TObject);
  private
//  from iPad
    LicExpired : Boolean;
    CusRow,
    CusCol  : Integer;
    RptFileName,
    TaxPayer: String;
    Optional,
    SendAscii,
    TrackCode,
    CanShowTax: Boolean;
//  from iPad

    { Private declarations }
    Ini : TIniFile;

    ExtraSize,
    BatchSize          : Double;

    function DoAmount: Double;

    Function  TotalBatch: Double;
    Function  CalcBatch: Double;
    Procedure UpdateGrids2;
    Procedure UpdateGrids;
    Procedure DoMix;
    Procedure DoGAX(Loc,OrderNum: String);
    Procedure DoTag;
    Procedure DoFile;
    Procedure DoInvoice;
    Procedure DoGradeUsed;
    Procedure GetGroups;
    Procedure ConvertElement(Element: Boolean);
    Procedure SpinBox(Value: String);
    Procedure SetSpinBox;
    Function  ItemRowCount: Integer;
    Procedure SetUpGroup;
    Procedure GetGroup;
    Procedure GetGroupXML;
    Procedure LoadGroup(ReLoad: Boolean);
    Procedure DoFirst;
    Procedure SetItemFilters;
    Procedure SetFilters;
    Procedure SaveGroupXML(var Memo1: TMemo);
  public
    A : array OF TValue;
    { Public declarations }
  end;

var
  FormulateForm: TFormulateForm;
const
  Version = 'iBlend 1.0  Copyright 2022 Lion Software';

implementation

{$R *.fmx}

uses
  XSBuiltins,LionDataModule,
   GetpFUSUnit,
   TVASaltOutTempUnit;

var
  TVA : TVASaltOutTemp;
  CurrentNBound: Double;
  CurrentNSpin : Double;
  CurrentNText : String;
  CurrentPBound: Double;
  CurrentPSpin : Double;
  CurrentPText : String;
  CurrentKBound: Double;
  CurrentKSpin : Double;
  CurrentKText : String;

  NumBatches,
  ProductUOM   : Integer;
  Element,
  Dry          : Boolean;
  Group,
  GroupName,
  GroupPath : String;
  ThePath   : TPath;
{$IFDEF Advanced}
  Lion : TADV;
{$ELSE}
  Lion : TMPS;
{$ENDIF}
  FUSData : TFUS;

procedure TFormulateForm.LoadXMLGroup;
//(Group: string;var Memo1: TMemo);
var
  Loc    : String;
  xName,
  sGroup,
  xFields: String;
begin
    DataModule1.MatGroups.Open;
    xFields:= 'LOC;GROUP';
    Loc:= Lion.Location;
    if DataModule1.MatGroups.Locate(xFields,VarArrayOf([LOC,Group]),[]) then begin
    sGroup:=DataModule1.MatGroups.FieldByName('XML').AsString;
    Memo1.Lines.Append(sGroup);
    end;
end;

procedure TFormulateForm.Loc1Click(Sender: TObject);
  procedure FillListBox;
    var
      s : String;
    begin
      with DataModule1.MatGroups do begin
        Open;
        Filtered:= False;
        Filter:= 'LOC='+ Lion.Location;
        Filtered:= True;
        First;
        while not eof do begin
          s:= FieldByName('Group').AsString;
          GroupEdit.Items.Append(FieldByName('Group').AsString);
          next;
        end;
      end;
    end;
  begin
    GroupEdit.Items.Clear;
    Lion.Location:= '001';
    CurentLOC.Text := Lion.Location;
    FillListBox;
    GroupEdit.Visible:= True;
  end;

procedure TFormulateForm.Loc2Click(Sender: TObject);
  procedure FillListBox;
    begin
      with DataModule1.MatGroups do begin
        Open;
        Filtered:= False;
        Filter:= 'LOC='+ Lion.Location;
        Filtered:= True;
        First;
        GroupEdit.Clear;
        while not eof do begin
          GroupEdit.Items.Append(FieldByName('Group').AsString);
          next;
        end;
      end;
    end;
  begin
    GroupEdit.Items.Clear;
    Lion.Location:= '002';
    CurentLOC.Text := Lion.Location;
    FillListBox;
    GroupEdit.Visible:= True;
  end;

procedure TFormulateForm.Loc999Click(Sender: TObject);
  procedure FillListBox;
    begin
      with DataModule1.MatGroups do begin
        Open;
        Filtered:= False;
        Filter:= 'LOC='+ Lion.Location;
        Filtered:= True;
        First;
        GroupEdit.Clear;
        while not eof do begin
          GroupEdit.Items.Append(FieldByName('Group').AsString);
          next;
        end;
      end;
    end;
  begin
    GroupEdit.Items.Clear;
    Lion.Location:= '999';
    CurentLOC.Text := Lion.Location;
    FillListBox;
    GroupEdit.Visible:= True;
  end;

Function TFormulateForm.CalcBatch;
  var
    NumTons,
    NumAcres,
    MaxBatch,
//    CalcBatch,
//    ExtraSize,
    LBSPerAcre,
    TotalLBS     : Double;
  begin
    NumBatches:= Trunc(NumBatchesSpinBox.Value);
    NumAcres  := StrToFloat(AcresEdit.Text);
    LBSPerAcre:= RateSpinBox.Value;
    MaxBatch  := MaxBatchSpinBox.Value;
    NumTons   := StrToFloat(AcresEdit.Text);
    ExtraSize := 0.0;

    if Lion.GradeUsed then TotalLBS:= NumTons  * 2000.0
                      else TotalLBS:= NumAcres * LBSPerAcre;
    if TotalLBS<=MaxBatch then begin
      NumBatches:= 1;
      BatchSize := TotalLBS;
    end else begin
      if EqualSwitch.IsChecked then begin
        NumBatches:= Trunc((TotalLBS/MaxBatch));
        ExtraSize:= TotalLBS-(NumBatches*BatchSize);
        if (ExtraSize > 0) then Inc(NumBatches);
        BatchSize := (TotalLBS/NumBatches);
      end else begin
        NumBatches:= Trunc((TotalLBS/MaxBatch));
        BatchSize:= MaxBatch;
        ExtraSize:= TotalLBS-(NumBatches*BatchSize);
        if (ExtraSize > 0) then Inc(NumBatches);
      end;
    end;
    Result:= BatchSize;
    NumBatchesSpinBox.Value:= NumBatches;
    AcresEdit.Text:= FloatToStrF(NumAcres,ffFixed,6,2);  // was 5
    RateSpinBox.Value:= LBSPerAcre;
    MaxBatchSpinBox.Value:= MaxBatch;
  end;

  Procedure TFormulateForm.SaveGroupXML(var Memo1: TMemo);
  var
    G,
    L : string;
  begin
    with DataModule1.MatGroups do begin
      Active;
      L:= Lion.Location;
      filtered:= False;
      filter:= 'LOC='+L;
      filtered:= True;
      First;
      GroupEdit.Items.Clear;
      while not Eof do begin
        G:= FieldByName('GROUP').AsString;
        GroupEdit.Items.Append(G);
        next;
      end;
      GroupEdit.Visible:= True;
    end;
  end;

Procedure TFormulateForm.GetGroups;
  var
    Name    : String;
    F       : TSearchRec;
    iO      : Integer;
  begin
    GroupEdit.Items.Clear;
{ $IFDEF XMLGroup }
  if not Lion.XMLGroup then Path.Text:= DataModule1.UsrPath
                       else Path.Text:= '';
  FormulateForm.Caption:= 'iBlend 1.0' + '     '+ Path.Text;

  if Lion.XMLGroup then begin
    if not FileExists(DataModule1.UsrPath+'MatGroups.cds') then begin
     //Swich to Example
        Lion.Location:= '999';
        CurentLOC.Text := Lion.Location;
        DataModule1.Example:= True;
        Path.Text:= DataModule1.UsrPath;
        FormulateForm.Caption:= 'iBlend 1.0' + '     '+ DataModule1.UsrPath;

    end else begin
    with DataModule1.MatGroups do begin
      Filtered:= False;
      Filter:= 'LOC='+ Lion.Location;
      Filtered:= True;
      Open;
    if (RecordCount > 0) then begin
      First;
      if not eof then begin
        GroupEdit.Items.Clear;
        GroupEdit.Visible:= True;
        while not eof do begin
          GroupEdit.Items.Append(FieldByName('Group').AsString);
          next;
        end;
       end;
    end;
    close;
    end;
    end;
//  end;
//{$ELSE}
  end else begin
    GroupPath:= DataModule1.SharedDocumentsPath;
    if ExampleSwitch.IsChecked then GroupPath:= GroupPath+'Example'+PathDelim
                               else GroupPath:= GroupPath+'Company'+PathDelim;

    iO:= FindFirst(GroupPath+'*.MPS',faAnyFile,F);
    while (iO=0)  do begin
      Name:= F.Name;
      Name:= Copy(Name,0,Length(Name)-4);
      if Length(Name)>0 then
        GroupEdit.Items.Append(Name);
      iO:= FindNext(F);
    end;
    FindClose(F);
  end;
  GroupEdit.Visible:= True;
  SaveBtn.Visible:= not GroupEdit.Visible;
  end;
// {$IFEND}

Procedure TFormulateForm.ConvertElement(Element: Boolean);
  Const
    P = 30.973761;
    O = 15.9994;
    K = 39.0983;
  var
    POxideTo  : Double;
    KOxideTo  : Double;
    Row       : Integer;
    Col       : Integer;
  begin
    POxideTo:= (p/((P*2)+(O*5)));
    KOxideTo:= (K/((K*2)+(O)));
    if Element then begin
      Col:= Lion.ActRes.Items['_P'].Index;
      for Row := Low(Lion.ActPtr) to High(Lion.ActPtr) do begin
        Lion.B[Row,Col]:= Lion.B[Row,Col]*POxideTo;
      end;
      Col:= Lion.ActRes.Items['_K'].Index;
      for Row := Low(Lion.ActPtr) to High(Lion.ActPtr) do begin
        Lion.B[Row,Col]:= Lion.B[Row,Col]*KOxideTo;
      end;
    end else begin
      Col:= Lion.ActRes.Items['_P'].Index;
      for Row := Low(Lion.ActPtr) to High(Lion.ActPtr) do begin
        Lion.B[Row,Col]:= Lion.B[Row,Col]/POxideTo;
      end;
      Col:= Lion.ActRes.Items['_K'].Index;
      for Row := Low(Lion.ActPtr) to High(Lion.ActPtr) do begin
        Lion.B[Row,Col]:= Lion.B[Row,Col]/KOxideTo;
      end;
    end;
  end;

procedure TFormulateForm.CustomerTabItemClick(Sender: TObject);
begin
//  FileLayout    .Visible:= False;
//  CustomerLayout.Visible:= True;
//  MixLayout     .Visible:= False;
//  TagLayout     .Visible:= False;
//  InvoiceLayout .Visible:= False;
//  ItemizeLayout .Visible:= False;
end;

procedure TFormulateForm.CuustomerTabItemClick(Sender: TObject);
begin
//  FileLayout    .Visible:= False;
//  CustomerLayout.Visible:= True;
//  Customer_Panel.Visible:= True;
//  MixLayout     .Visible:= False;
//  TagLayout     .Visible:= False;
//  InvoiceLayout .Visible:= False;
//  ItemizeLayout .Visible:= False;
//  DoMix;
end;

Procedure TFormulateForm.DoGradeUsed;
  begin
//    GradeLabel.Visible:= Lion.GradeUsed;
//    AcrePanel.Visible := Not Lion.GradeUsed;
    RateSpinBox.Visible:= not Lion.GradeUsed;
    RateLabel.Visible:= not Lion.GradeUsed;
    if Lion.GradeUsed then begin
      AcresLabel.Text:= 'Tons';
      if Lion.Metric then Grade.Text:= 'Hectare'
                     else Grade.Text:= 'Acre';
      PerAcreFloatColumn.Header:= 'Percent';
      if Lion.Seek('PRODUCT') then begin
        Lion.LowerBound:= 1.0;
        Lion.UpperBound:= 1.0005;
      end;
      AcresLabel.Text:= 'Ton';
    end else begin
      AcresLabel.Text:= 'Acres';
      Grade.Text:= 'Grade';
      if Lion.Metric then PerAcreFloatColumn.Header:= 'Per Hectare'
                     else PerAcreFloatColumn.Header:= 'Per Acre';
      if Lion.Seek('PRODUCT') then begin
        Lion.LowerBound:= 0.0;
        Lion.UpperBound:= Lion.BigNumber;
      end;
    end;
  end;

Function  Convert(Quantity: Double;FromUnit,ToUnit: Integer;FromContainer,ToContainer: Double): Double;
  var
    LBSFrom : Double;
    LBSTo   : Double;
  begin
    with DataModule1.UnitsClientDataSet do begin
      if Locate('Index',FromUnit,[]) then LBSFrom:= FieldByName('LBS').AsFloat;
      if Locate('Index',ToUnit  ,[]) then LBSTo  := FieldByName('LBS').AsFloat;
    end;
    Result:= Quantity*(LBSFrom/LBSTO); // 2000 Lbs --> 1 Ton
  end;

  procedure TFormulateForm.ToExampleClick(Sender: TObject);
    begin
      with DataModule1.ItemClientDataSet do begin
        Active:= True;
        First;
        while not eof do begin
          Edit;
          FieldByName('Loc').AsString:= '999';
          Post;
          Next;
        end;
        Active:= False;
      end;

      with DataModule1.MyFertClientDataSet do begin
        Active:= True;
        First;
        while not eof do begin
          Edit;
          FieldByName('Loc').AsString:= '999';
          Post;
          Next;
        end;
        Active:= False;
      end;

      with DataModule1.GroupsClientDataSet do begin
        Active:= True;
        First;
        while not eof do begin
          Edit;
          FieldByName('Loc').AsString:= '999';
          Post;
          Next;
        end;
        Active:= False;
      end;

      with DataModule1.MatGroups do begin
        Active:= True;
        First;
        while not eof do begin
          Edit;
          FieldByName('Loc').AsString:= '999';
          Post;
          Next;
        end;
        Active:= False;
      end;

      with DataModule1.FromClientDataSet do begin
        Active:= True;
        First;
        while not eof do begin
          Edit;
          FieldByName('Loc').AsString:= '999';
          Post;
          Next;
        end;
        Active:= False;
      end;
    end;

Function TFormulateForm.TotalBatch : Double;
  var
    TotalLBS,
    Qty           : Double;
    UnitFrom      : Integer;
    UnitTo        : Integer;
    ContainerFrom : Double;
    ContainerTo   : Double;
    Item          : String;
  begin
    Lion.RewindAct;
    TotalLBS:= 0;
    while not Lion.EofAct do with Lion.ActRes.Items[Lion.ActC[Lion.ActNum]] do begin
      Item:= Lion.ActC[Lion.ActNum];
      if (Item <> 'PRODUCT') then begin
        UnitFrom      := UnitNum;
        UnitTo        := ProductUOM;
        ContainerFrom := 0;;
        ContainerTo   := 0;
        Qty:= Convert(Level,UnitFrom,UnitTo,ContainerFrom,ContainerTo);
        TotalLBS:= TotalLBS+Qty;
      end;
      Lion.NextAct;
    end;
    Result:= TotalLBS;
    TotalBatchLabel.Text:= FloatToStr(Result);
//    NumBatches:= TotalLBS/TFormulateForm.MaxBatchSpinBox.Value;
  end;

Procedure  TFormulateForm.UpdateGrids2;
  var
    ACol,
    ARow,
    i     : Integer;
    R     : Double;
  begin
//     if Lion.N=0 then exit;

    AGrid.RowCount:= 0;
    RGrid.RowCount:= 0;
    BGrid.RowCount:= 0;
//    InputGrid.RowCount:= 0;
//    ItemizeGrid.RowCount:= 0;
//    MixMemo.Lines.Clear;
//    LabelMemo.Lines.Clear;
////    Memo1.Lines.Clear;
//    NSpinBox.Value:= 0;
//    PSpinBox.Value:= 0;
//    KSpinBox.Value:= 0;

    BGrid.RowCount:= Lion.NumAct+1;
//    for i := 0 to Lion.NumRes+1 do begin
//      BGrid.AddObject(TColumn.Create(BGrid));
//      if i = 0 then
//        BGrid.Columns[i].Width:= 100 else
//        BGrid.Columns[i].Width:= 50;
//    end;
    AGrid.RowCount  := Lion.NumAct+1;
//    ItemizeGrid.RowCount  := Lion.NumAct+1;
    RGrid.RowCount  := Lion.NumRes+1;
(*
    DrySwitch.IsChecked:= not Lion.Seek('WATER');

    if Lion.Seek('PRODUCT') then
      Lion.GradeUsed:= (Lion.LowerBound = 1);
    DoGradeUsed;
//    if Lion.GradeUsed then PerAcreFloatColumn.Header:= 'Percent' else
//      begin
//       if Lion.Metric then PerAcreFloatColumn.Header:= 'Per Hectare'
//                      else PerAcreFloatColumn.Header:= 'Per Acre';
//      end;
//    AcrePanel.Visible := Not Lion.GradeUsed;

//    GradeLabel.Visible:= Lion.GradeUsed and RatiosSwitch.IsChecked;
    NSpinBox.Visible:= Lion.GradeUsed;
    LabelDash1.Visible:= Lion.GradeUsed;
    PSpinBox.Visible:= Lion.GradeUsed;
    LabelDash2.Visible:= Lion.GradeUsed;
    KSpinBox.Visible:= Lion.GradeUsed;
    Lion.BuildInput;

    InputGrid.RowCount:= Lion.rInputCount;

    for ACol := 0 to InputGrid.ColumnCount-1 do
    for ARow := 0 to InputGrid.RowCount-1 do
   InputGrid.Columns[ACol].UpdateCell(ARow);
    Lion.ActFirst;
*)
  end;

procedure TFormulateForm.UserComboBoxClick(Sender: TObject);
var
  s : string;
begin
(*
//  with LionDataModule.DataModule1.LogonClientDataSet do begin
  with DataModule1.Logon do begin
    Active:= True;
    First;
    UserComboBox.Clear;
    while not Eof do begin
      s:= FieldByName('UName').AsString;
      UserComboBox.Items.Append(s);
      Next;
    end;
  end;
  *)
end;

(*
var
  PW,
  Loc,
  xName : string;
begin
//  with LionDataModule.DataModule1.LogonClientDataSet do begin
//     xName:= UserComboBox.Items[UserComboBox.ItemIndex];
//    if Locate('UName',xname,[]) then begin
//      Loc:= FieldByName('Loc').AsString;
//      pw:= FieldByName('PWORD').AsString;
//      Lion.Location:= LOC;
//      LocEdit.Text:= Lion.Location;
//    end;
//  end;)
end;
*)
procedure TFormulateForm.UserComboBoxClosePopup(Sender: TObject);
var
  xName,
  pw,
  loc   :string;
begin
(*
//  with LionDataModule.DataModule1.LogonClientDataSet do begin
  with LionDataModule.DataModule1.Logon do begin
    xName:= UserComboBox.Items[UserComboBox.ItemIndex];
    if Locate('UName',xname,[]) then begin
      Loc:= FieldByName('Loc').AsString;
      pw:= FieldByName('PWORD').AsString;
      PWCurrent.Text:= pw;
      Lion.Location:= LOC;
      LocEdit.Text:= Lion.Location;
    end;
  end;
  *)
end;

procedure TFormulateForm.UserComboBoxPopup(Sender: TObject);
var
  s : string;
begin
(*
//  with LionDataModule.DataModule1.LogonClientDataSet do begin
  with LionDataModule.DataModule1.Logon do begin
    Active:= True;
    First;
    UserComboBox.Clear;
    while not Eof do begin
      s:= FieldByName('UName').AsString;
      UserComboBox.Items.Append(s);
      Next;
    end;
  end;
  *)
end;

Procedure  TFormulateForm.UpdateGrids;
  var
    ACol,
    ARow,
    i     : Integer;
    R     : Double;
  begin
     if Lion.N=0 then exit;

    AGrid.RowCount:= 0;
    RGrid.RowCount:= 0;
    BGrid.RowCount:= 0;
    InputGrid.RowCount:= 0;
    ItemizeGrid.RowCount:= 0;
    MixMemo.Lines.Clear;
    LabelMemo.Lines.Clear;
//    Memo1.Lines.Clear;
    NSpinBox.Value:= 0;
    PSpinBox.Value:= 0;
    KSpinBox.Value:= 0;

    BGrid.RowCount:= Lion.NumAct+1;
    for i := 0 to Lion.NumRes+1 do begin
      BGrid.AddObject(TColumn.Create(BGrid));
      if i = 0 then
        BGrid.Columns[i].Width:= 100 else
        BGrid.Columns[i].Width:= 50;
    end;
    AGrid.RowCount  := Lion.NumAct+1;
    ItemizeGrid.RowCount  := Lion.NumAct+1;
    RGrid.RowCount  := Lion.NumRes+1;

    DrySwitch.IsChecked:= not Lion.Seek('WATER');

    if Lion.Seek('PRODUCT') then
      Lion.GradeUsed:= (Lion.LowerBound = 1);
    DoGradeUsed;
//    if Lion.GradeUsed then PerAcreFloatColumn.Header:= 'Percent' else
//      begin
//       if Lion.Metric then PerAcreFloatColumn.Header:= 'Per Hectare'
//                      else PerAcreFloatColumn.Header:= 'Per Acre';
//      end;
//    AcrePanel.Visible := Not Lion.GradeUsed;

//    GradeLabel.Visible:= Lion.GradeUsed and RatiosSwitch.IsChecked;
(**)
    NSpinBox.Visible:= Lion.GradeUsed;
    LabelDash1.Visible:= Lion.GradeUsed;
    PSpinBox.Visible:= Lion.GradeUsed;
    LabelDash2.Visible:= Lion.GradeUsed;
    KSpinBox.Visible:= Lion.GradeUsed;
(**)
    Lion.BuildInput;

    InputGrid.RowCount:= Lion.rInputCount;

    for ACol := 0 to InputGrid.ColumnCount-1 do
    for ARow := 0 to InputGrid.RowCount-1 do
   InputGrid.Columns[ACol].UpdateCell(ARow);
    Lion.ActFirst;
  end;


Procedure  UpdateNames;
  var
    xCode : String;
    xName : String;
    xFields: String;
    xEdit : Boolean;
    I     : Integer;
    zCost : Double;

    Function Strip(InPut: String): String;
      begin
        Delete(InPut,1,1);
        Result:= Input;
      end;

    begin
      DataModule1.ItemClientDataSet.DisableControls;
      DataModule1.TagClientDataSet.DisableControls;

      with DataModule1.TagClientDataSet do begin
        First;
        while not Eof do begin
          Edit;
          FieldByName('ActiveIngredient').AsBoolean:= False;
          Post;
          Next;
        end;
      end;

      with DataModule1.ItemClientDataSet do begin
        First;
        while not Eof do begin
          Edit;
          FieldByName('HAZARDOUS').AsBoolean:= False;
          Post;
          Next;
        end;
      end;

      with DataModule1.TagClientDataSet do begin
        I:= Lion.ActRes.Count;
        Lion.RewindRes;
        while not Lion.EofRes do begin
          xCode:= Strip(Lion.ResPtr[Lion.ResNum]);
          Lion.Language:= 'EN';
          xName:= xCode+';'+Lion.Language;
          xFields:= 'Code;Language';
          if Locate(xFields,VararrayOf([xCode,Lion.Language]),[loCaseInsensitive]) then begin
            Edit;
            FieldByName('ActiveIngredient').AsBoolean:= True;
            Post;
            if Lion.Seek('_'+xCode) then
              Lion.Name:= FieldByName('MixName').AsString;
          end;
          Lion.NextRes;
        end;
        I:= Lion.ActRes.Count;
      end;

      if (Lion.Location <> '999') then begin


//     if FormulateForm.AutoSwitch.IsChecked then begin

//      with DataModule1.ItemClientDataSet do begin
//        Lion.RewindAct;
//        while not Lion.acteof do begin
//          Lion.ActCost;
//          Lion.ActPrice;
//          Lion.ActNext
//        end;

      with DataModule1.ItemClientDataSet do begin
        Lion.RewindAct;
        while not Lion.EofAct do begin
          xCode:= Lion.ActPtr[Lion.ActNum];
          xFields:= 'LOC;ITEM';
          xEdit:= Locate(xFields,VararrayOf([Lion.Location,xCode]),[loCaseInsensitive]);
          if xEdit then begin
            if FormulateForm.AutoSwitch.IsChecked then begin
//              edit;
              Lion.Cost:= FieldByName('FUSCost').AsFloat;///Lion.InputScale;
              Lion.Price:= FieldByName('Price1').AsFloat;///Lion.InputScale;
              Lion.UnitNum:= FieldByName('InventoryUOM').AsInteger;
              Lion.UnitNum:= FieldByName('FUSUOM').AsInteger;
//              Post;
            end else begin
              Edit;
              FieldByName('FUSCost').AsFloat:= Lion.Cost*Lion.InputScale;
              FieldByName('Price1').AsFloat:= Lion.Price*Lion.InputScale;
              FieldByName('Loc').AsString:= Lion.Location;
              FieldByName('Item').AsString:= xCode;
              FieldByName('FUSName' ).AsString:= Lion.Name;
              FieldByName('FUSUOM' ).AsInteger:= Lion.UnitNum;
              FieldByName('FUSLBS' ).AsFloat:= Lion.InputScale;
              FieldByName('IsFluid' ).AsBoolean:= False;
              FieldByName('TYPE' ).AsString:= 'F';
              Post;
            end;
//            Lion.ActNext;
          end;
          Lion.NextAct;

        end;
      end;
      end;
      DataModule1.ItemClientDataSet.EnableControls;
      DataModule1.TagClientDataSet.EnableControls;
      end;







{$IFDEF Advanced}
      with DataModule1.ItemClientDataSet do begin
        Lion.RewindAct;
        while not Lion.EofAct do begin
          xCode:= Lion.ActPtr[Lion.ActNum];
          xFields:= 'LOC;ITEM';
          if Locate(xFields,VararrayOf([Lion.Location,xCode]),[loCaseInsensitive]) then begin
            Edit;
            FieldByName('HAZARDOUS').AsBoolean:= True;
            Post;
            if Lion.Seek(xCode) then begin
              Lion.InvoiceName:= FieldByName('InvoiceName').AsString;
              Lion.Name:= FieldByName('FUSName').AsString;

              if FormulateForm.AutoSwitch.IsChecked then begin
                Lion.Cost:= FieldByName('FUSCost').AsFloat;///Lion.InputScale;
                Lion.Price:= FieldByName('Price1').AsFloat;///Lion.InputScale;
                Lion.UnitNum:= FieldByName('InventoryUOM').AsInteger;
                Lion.UnitNum:= FieldByName('FUSUOM').AsInteger;
              end else begin
                Edit;
                FieldByName('FUSCost').AsFloat:= Lion.Cost;//*Lion.InputScale;
                FieldByName('Price1').AsFloat:= Lion.Price;//*Lion.InputScale;
                FieldByName('Loc').AsString:= Lion.Location;
                FieldByName('Item').AsString:= xCode;
                FieldByName('FUSName' ).AsString:= Lion.Name;
                FieldByName('FUSUOM' ).AsInteger:= Lion.UnitNum;
                FieldByName('FUSLBS' ).AsFloat:= Lion.InputScale;
                FieldByName('IsFluid' ).AsBoolean:= False;
                FieldByName('TYPE' ).AsString:= 'F';
                Post;
              end;
            end; //Seek
          end else begin
            Append;
            if Lion.Seek(xCode) then begin
                Lion.Cost := Lion.Cost/Lion.InputScale;
                Lion.Price:= Lion.Price/Lion.InputScale;
            end;
            FieldByName('Loc').AsString:= Lion.Location;
            FieldByName('Item').AsString:= xCode;
            FieldByName('FUSCost').AsFloat:= Lion.Cost; //*Lion.InputScale;
            FieldByName('Price1' ).AsFloat:= Lion.Price;//*Lion.InputScale;
            FieldByName('FUSName' ).AsString:= Lion.Name;
            FieldByName('FUSUOM' ).AsInteger:= Lion.UnitNum;
            FieldByName('FUSLBS' ).AsFloat:= Lion.InputScale;
            FieldByName('IsFluid' ).AsBoolean:= False;
            FieldByName('TYPE' ).AsString:= 'F';
            Post;
          end;
          Lion.NextAct;
        end;
{$ENDIF Advance}
//end;

//      end;
//      DataModule1.ItemClientDataSet.EnableControls;
//      DataModule1.TagClientDataSet.EnableControls;
//      Lion.InputTransform;
//    end;
//
    Procedure  SetActRes(Build: Boolean);
      var
        xCode : String;
        xName : String;
      begin
        if Build then begin

          with DataModule1.TagClientDataSet do begin
            First;
            Lion.RewindRes;
            while not Eof do begin
              if FieldByName('ActiveIngredient').AsBoolean then begin
                if not Lion.ResEof then begin
                  xCode:= Lion.ResPtr[Lion.ResNum];
                  xName:= FieldByName('MixName').AsString;
                  Lion.AddData(True,'001',xCode,xName,0,0,'G');
                end;
                Lion.NextRes;
              end;
              Next;
            end;
          end;

          with DataModule1.ItemClientDataSet do begin
            First;
            Lion.RewindAct;
            while not Eof do begin
              if FieldByName('HAZARDOUS').AsBoolean then begin
                if not Lion.EofAct then begin
                  xCode:= Lion.ActPtr[Lion.ActNum];
                  xName:= FieldByName('FUSName').AsString;
                  Lion.AddData(False,'001',xCode,xName,0,0,'G');
                 end;
                Lion.NextAct;
              end;
              Next;
            end;
          end;
          Lion.AddData(True,'001','WT','Weight',0,0,'E');
          Lion.AddData(False,'001','PRODUCT','Product',0,0,'LO');

        end else begin
          with DataModule1.TagClientDataSet do begin
            First;
            Lion.RewindRes;
            while not Eof do begin
              if FieldByName('ActiveIngredient').AsBoolean then begin
                 Lion.NextRes;
              end;
              Next;
            end;
          end;

          with DataModule1.ItemClientDataSet do begin
            First;
            Lion.RewindAct;
            while not Eof do begin
              if FieldByName('HAZARDOUS').AsBoolean then begin
                Lion.NextAct;
              end;
              Next;
            end;
          end;

  //        Lion.NumAct:= Lion.ActNum+1;
  //        Lion.NumRes:= Lion.ResNum+1;
          Lion.SetLengths(Lion.ActNum+1,Lion.ResNum+1);

          with DataModule1.TagClientDataSet do begin
            First;
            Lion.RewindRes;
            while not Eof do begin
              if not Lion.ResEof then begin
                if FieldByName('ActiveIngredient').AsBoolean then begin
                  Lion.ResPtr[Lion.ResNum]:= '_'+DataModule1.TagClientDataSet.FieldByName('Code').AsString;
                  Lion.ResC[Lion.ResNum]  := '_'+DataModule1.TagClientDataSet.FieldByName('Code').AsString;
                  Lion.NextRes;
                end;
              end;
              Next;
            end;
            Lion.ResPtr[Lion.ResNum]:= '_WT';
            Lion.ResC  [Lion.ResNum]:= '_WT';
          end;

          with DataModule1.ItemClientDataSet do begin
            First;
            Lion.RewindAct;
            while not Eof do begin
              if not Lion.EofAct then begin
                if FieldByName('HAZARDOUS').AsBoolean then begin
                  Lion.ActPtr[Lion.ActNum]:= DataModule1.ItemClientDataSet.FieldByName('Item').AsString;
                  Lion.ActC  [Lion.ActNum]:= DataModule1.ItemClientDataSet.FieldByName('Item').AsString;
                  Lion.NextAct;
                end;
              end;
              Next;
            end;
            Lion.ActPtr[Lion.ActNum]:= 'PRODUCT';
            Lion.ActC  [Lion.ActNum]:= 'PRODUCT';
          end;
        end;
      end;

    Procedure TFormulateForm.SetItemFilters;
      var
        Form     : String;
        ItemType : String;
      const
        Loc = 'Loc = ''001''';
      begin
        with DataModule1.ItemClientDataSet do begin
          if EveryRadioButton.IsChecked then Form:= '' else begin
            if FluidRadioButton.IsChecked then Form:= ' and [IsFluid] =  True'
                                          else Form:= ' and [IsFluid] =  False';
          end;
          if AllRadioButton.IsChecked then ItemType:= '' else begin
            if FertRadioButton .IsChecked then ItemType:= ' and [Type] = ''F''' else
            if ChemRadioButton .IsChecked then ItemType:= ' and [Type] = ''C''' else
            if OtherRadioButton.IsChecked then ItemType:= ' and [Type] = ''O''';
          end;
          Filter:= Loc+Form+ItemType;
//          FilterLab.Text:= Loc+Form+ItemType;
        end;
      end;

Procedure TFormulateForm.SetFilters;
      var
        Generic   : String;
        Grade     : String;
        Form      : String;
        PolyCoat  : String;
        SulfurCoat: String;
        Chelate   : String;
        Heat      : String;
        Favorite  : String;
        TheFilter : String;

      begin
        with DataModule1.FertClientDataSet do begin
          if FavoriteCheck.IsChecked then Favorite:= '[REGULATED] = True'
                                     else Favorite:= '[REGULATED] = False';

          if GenericCheckBox.IsChecked then Generic:= ' and [Company] =  ''Generic'''
                                       else Generic:= ' and [Company] <>  ''Generic''';
          if PolyCheck.IsChecked then PolyCoat:= ' and [POLYCOAT] =  True'
                                 else PolyCoat:= ' and [POLYCOAT] =  False';
          if SulfurCheck.IsChecked then SulfurCoat:= ' and [SULFURCOAT] =  True'
                                   else SulfurCoat:= ' and [SULFURCOAT] =  False';
          if ChelateCheck.IsChecked then Chelate:= ' and [CHELATE] =  True'
                                    else Chelate:= ' and [CHELATE] =  False';
//          if HeatBox.IsChecked then Heat:= ' and [HEATCAP] >0'
//                               else Heat:= ' and [HEATCAP] =0';

          if AllFilter2.IsChecked then Grade:=  '' else begin
            if NFilter2.IsChecked then Grade:=  ' and [N] > 0';
            if PFilter2.IsChecked then Grade:=  ' and [P] > 0';
            if KFilter2.IsChecked then Grade:=  ' and [K] > 0';
          end;
          if AllFormFilter2. IsChecked then Form:=  '' else begin
            if DryFilter2.   IsChecked then Form:=  ' and [WATER] = 0';
            if LiquidFilter2.IsChecked then Form:=  ' and [Water] > 0';
          end;
          TheFilter:= Favorite+Generic+Grade+Form+PolyCoat+SulfurCoat+Chelate+Heat;
          if FilterCheckBox.IsChecked then Filter:= TheFilter
                                      else Filter:= '';
          if NFilter2.IsChecked then IndexName:= 'FertClientDataSetIndexN' else
          if PFilter2.IsChecked then IndexName:= 'FertClientDataSetIndexP' else
          if KFilter2.IsChecked then IndexName:= 'FertClientDataSetIndexK' else
          if AllFilter2.IsChecked then IndexName:= 'FertClientDataSetIndexNPK' else
                                    IndexName:= 'FertClientDataSetIndexNPK';
//          FilterLab.Text:= Filter+' Sort '+IndexName;;
        end;
      end;


    procedure TFormulateForm.ItemizeGridGetValue(Sender: TObject; const ACol,
  ARow: Integer; var Value: TValue);
begin
  if ItemizeGrid.RowCount > 0 then begin
    if Lion.Seek(Lion.ActC[ARow]) then begin
      case ACol of
        0 : Value:= Lion.Name;
        1 : begin
              Value:= Lion.Level*Lion.InputScale;//.0;
//              if (Lion.Level > 0.0) then Value:= Lion.Level
//                                    else Value:= Lion.GetLower;
            end;
        2 : Value:= Lion.GetUnitNum;
      end;
    end;
  end;
end;

procedure TFormulateForm.ItemizeGridSetValue(Sender: TObject; const ACol,
  ARow: Integer; const Value: TValue);
begin
  if Lion.Seek(Lion.ActC[ARow]) then begin
    if Acol = 1 then begin
      Lion.LowerBound:= Value.AsVariant/Lion.InputScale;
      Lion.LowerPmt:= True;
      Lion.Solve;
      Lion.BuildInput;
//  for ARow := 0 to BGrid.RowCount-1 do begin
//    ItemizeGrid.Columns[0].UpdateCell(ARow);
    ItemizeGrid.Columns[1].UpdateCell(ARow);
//    ItemizeGrid.Columns[2].UpdateCell(ARow);
//  end;
    end;
  end;
end;

Function  TFormulateForm.ItemRowCount;
      begin
      with LionDataModule.DataModule1.ItemClientDataSet do begin
//      with LionDataModule.DataModule1.FertClientDataSet do begin
        Result:= 0;
        Filter:= 'LOC=''001''';
        First;
        while not Eof do begin
          if (Trim(FieldByName('Item').AsString) <> '') then begin
            Inc(Result);
          end;
          Next;
        end;
      end;
      end;

    Procedure TFormulateForm.DoFirst;
      begin
        FormulateTabItem.TabControl.Index:= 1;
      end;

procedure TFormulateForm.Label15Click(Sender: TObject);
begin
  wwDataGrid1.Visible:= False;
end;

procedure TFormulateForm.Last_EditExit(Sender: TObject);
  var
    Company,
    Sort,
    First,
    Last : String;
    i    : Integer;

  begin
    Company:= Company_Edit.Text;
    First:= First_Edit.Text;
    First:= UpperCase(First);
    if (Length(First)>=4) then First:= Copy(First,1,4)
                          else while (Length(First) < 4) do First:= First+'0';

    Last:= Last_Edit.Text;
    Last:= UpperCase(Last);
    if (Length(Last)>=4) then Last:= Copy(Last,1,4)
                          else while (Length(Last) < 4) do Last:= Last+'0';
    Sort:=Last+First;
    Sort_Edit.Text:= Sort;
    if Sort='00000000' then begin
      i:= Pos(',',Company);
      if i>0 then begin
        Last := Trim(Copy(Company,1,i-1));
        First:= Trim(Copy(Company,i+1,Length(Company)-i));
        First:= UpperCase(First);
        if (Length(First)>=4) then First:= Copy(First,1,4)
                              else while (Length(First) < 4) do First:= First+'0';

        Last:= Trim(UpperCase(Last));
        if (Length(Last)>=4) then Last:= Copy(Last,1,4)
                              else while (Length(Last) < 4) do Last:= Last+'0';
        Last:= Trim(Last);
        while (Length(Last) < 4) do Last:= Last+'0';
        Sort:= Last+First;
      end;
    end else begin
      Company:= Company_Edit.Text;
      First:= Copy(Company,1,4);
      i:= Length(Company);
      while (Company[i] <> ' ') do dec(i);

      Last := Copy(Company,i,4);
    end;
  end;

Procedure TFormulateForm.LoadGroup;
      var
        Name,
        FileName: String;
        i       : Integer;
        F       : TSearchRec;
        iO      : Integer;
      begin
        FileName:= GroupPath+Group+'.MPS';
        GroupName:= FileName;
        if (Trim(GroupEdt.Text) = '') then ReLoad:= False;

        if ReLoad then begin
          Memo1.Lines.Clear;
          Memo1.Lines.LoadFromFile(GroupName);
           Lion.ReadMPS(Trim(GroupEdt.Text),Memo1);
          ClearMemos;
          UpdateGrids;
          UpdateNames;
        end else begin
          GroupEdit.Items.Clear;
          iO:= FindFirst(GroupPath+'*.MPS',faAnyFile,F);
          while (iO=0)  do begin
            Name:= F.Name;
            Name:= Copy(Name,0,Length(Name)-4);
            GroupEdit.Items.Append(Name);
            iO:= FindNext(F);
          end;
          Group:= Name;
          FindClose(F);
          GroupEdit.Visible:= True;
        end;
      end;

    Procedure TFormulateForm.SetSpinBox;
      var
        Value : Double;
      begin
        if RatiosSwitch.IsChecked then begin
          if Lion.Seek('_N') then
            NSpinBox.Value:= ((Lion.Level/Lion.Product)*100.0);
          if Lion.Seek('_P') then
            PSpinBox.Value:= ((Lion.Level/Lion.Product)*100.0);
          if Lion.Seek('_K') then
            KSpinBox.Value:= ((Lion.Level/Lion.Product)*100.0);
          Value:= TVA.Temp(NSpinBox.Value,PSpinBox.value,KSpinBox.Value,3);
          SaltOutTemp.Text:= FloatToStrF(Value,ffFixed,3,0);
        end;
      end;

    Procedure TFormulateForm.SpinBox(Value: String);
          var
        NewN,
        CurrentN     : Double;
        Product      : Double;
//        CurrentBound : Double;
//        CurrentSpin  : Double;
//        CurrentText  : String;
        Factor       : Double;
      begin
        if Lion.GradeUsed then begin
        if RatiosSwitch.IsChecked then begin
          Lion.HoldBounds;
          Product:= Lion.Product;
          if Lion.Seek('_'+Value) then begin
            CurrentN:= ((Lion.Level/Product)*100.0);
            if (Value = 'N') then NewN:= StrToFloat(NSpinBox.Text) else
            if (Value = 'P') then NewN:= StrToFloat(PSpinBox.Text) else
            if (Value = 'K') then NewN:= StrToFloat(KSpinBox.Text) else
                                   NewN:= 0;
            Factor:= (NewN/CurrentN);
            Lion.MaxBound;
            if Lion.Seek('_N') then begin
              Lion.LowerBound:= Lion.Level*Factor;
            end;
            if Lion.Seek('_P') then begin
              Lion.LowerBound:= Lion.Level*Factor;
            end;
            if Lion.Seek('_K') then begin
              Lion.LowerBound:= Lion.Level*Factor;
            end;
            Lion.Solve;
            if Lion.Solved then begin
              SetSpinBox ;
              DoTag;
              DoMix;
            end else begin
              ShowMessage('Solve Failed');
              Lion.ReStoreBounds;
            end;
          end;
        end;
        end;

      end;

procedure TFormulateForm.GenericCheckboxChange(Sender: TObject);
  begin
    SetFilters;
  end;

procedure TFormulateForm.GenericCheckboxClick(Sender: TObject);
begin
  SetFilters;
end;

procedure TFormulateForm.GradeClick(Sender: TObject);
      begin
        Lion.GradeUsed:= not Lion.GradeUsed;
        GradeLabel.Visible:= Lion.GradeUsed and RatiosSwitch.IsChecked;
        NSpinBox.Visible:= Lion.GradeUsed;
        LabelDash1.Visible:= Lion.GradeUsed;
        PSpinBox.Visible:= Lion.GradeUsed;
        LabelDash2.Visible:= Lion.GradeUsed;
        KSpinBox.Visible:= Lion.GradeUsed;
        DoGradeUsed;
      end;

procedure TFormulateForm.GetGroup;
var
  Name    : String;
  F       : TSearchRec;
  iO      : Integer;
begin
  GroupEdit.Items.Clear;
  iO:= FindFirst(GroupPath+'*.MPS',faAnyFile,F);
  while (iO=0)  do begin
    Name:= F.Name;
    Name:= Copy(Name,0,Length(Name)-4);
    if Length(Name)>0 then
      GroupEdit.Items.Append(Name);
    iO:= FindNext(F);
  end;
  FindClose(F);
  GroupEdit.Visible:= True;
end;

procedure TFormulateForm.GetGroupXML;
var
  Name    : String;
  F       : TSearchRec;
  iO      : Integer;
begin
  GroupEdit.Items.Clear;
  iO:= FindFirst(GroupPath+'*.MPS',faAnyFile,F);
  while (iO=0)  do begin
    Name:= F.Name;
    Name:= Copy(Name,0,Length(Name)-4);
    if Length(Name)>0 then
      GroupEdit.Items.Append(Name);
    iO:= FindNext(F);
  end;
  FindClose(F);
  GroupEdit.Visible:= True;
end;

procedure TFormulateForm.SetUpGroup;
var
  i : Integer;
begin
  Memo1.Lines.Clear;
//{$IFDEF XMLGroup }
//  if Lion.XMLGroup then LoadXMLGroup(Group,Memo1)
//                   else Memo1.Lines.LoadFromFile(GroupName);
//{$ELSE}
//  Memo1.Lines.LoadFromFile(GroupName);
//{$ENDIF}
  GroupEdt.Text:= Group;
  Lion.ReadMPS('',Memo1);
  ClearMemos;
  UpdateGrids;
  UpdateNames;
end;

procedure TFormulateForm.GroupEditItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  Group:= Item.Text;
  GroupEdt.Text:= Group;
  Lion.ProblemName:= Group;
  GroupName:= GroupPath+Group+'.MPS';
  GroupEdit.Visible:= False;
//  LoadGroup(True);
  SetUpGroup;
end;

procedure TFormulateForm.GroupEditxClosePopup(Sender: TObject);
var
  Path    : String;
  ThePath : TPath;
  FileName,
  Name    : String;
  i       : Integer;
begin
  GroupEdit.Visible:= False;
  SaveBtn.Visible:= True;
  Name:= GroupEdit.Items[GroupEdit.ItemIndex].Trim;
  GroupEditx.Text:= Name;
  Group:= Name;
  GroupEdt .Text:= Group;
  FileName:= GroupPath+Group+'.MPS';
  GroupName:= FileName;
  SetUpGroup;
end;

procedure TFormulateForm.GroupEditxPopup(Sender: TObject);
var
  Name    : String;
  F       : TSearchRec;
  iO      : Integer;
begin
  GetGroups;
  GroupEdit.Visible:= True;
end;

procedure TFormulateForm.GroupEdtExit(Sender: TObject);
begin
  Lion.ProblemName:= Group.ToUpper;
end;

procedure TFormulateForm.HeatBoxChange(Sender: TObject);
begin
  SetFilters;
end;

procedure TFormulateForm.HeatBoxClick(Sender: TObject);
begin
  SetFilters;
end;

procedure TFormulateForm.LoadMPSClick(Sender: TObject);
      begin
        LoadGroup(True);
      end;

procedure TFormulateForm.LocEditExit(Sender: TObject);
  function IsLocation(xLoc:String): Boolean;
    var
      S,
      HoldLoc : String;
    begin
      with DataModule1.ItemClientDataSet do begin
        HoldLoc:= Lion.Location;
        Close;
        Filtered:= False;
        S:= 'Loc='+QuotedStr(xLoc)+'';
        Filter:= S;
//        Filter:= 'Loc=''002''';
//        Filter:= Loc=LocEdit.Text;
        Filtered:= True;
        Open;
        First;
        Result:=DataModule1.ItemClientDataSet.RecordCount > 0;
        if Result then begin
          Lion.Location:= LocEdit.Text;
        end else begin
          Close;
          Filtered:= False;
          Filter:= HoldLoc;
          Filtered:= True;
          Open;
          First;
        end;
      end;
    end;
begin
  if not IsLocation(LocEdit.Text) then begin
    LocEdit.Text:= Lion.Location;
  end;
end;

procedure TFormulateForm.LogOnTabItemClick(Sender: TObject);
var
  s : string;
begin
(*
//  with LionDataModule.DataModule1.LogonClientDataSet do begin
  with LionDataModule.DataModule1.Logon do begin
    Active:= True;
    First;
    UserComboBox.Clear;
    while not Eof do begin
      s:= FieldByName('UName').AsString;
      UserComboBox.Items.Append(s);
      Next;
    end;
  end;
  *)
end;

procedure TFormulateForm.MatSysClick(Sender: TObject);
var
  Index  : Integer;
  Visible: Boolean;
  Value  : Double;
begin
  Index:= MatSys.ItemIndex;
  Visible:= Index in [2..6];
  SaltOutTemperature.Visible:= Visible;
  SaltOutLabel.Visible:= Visible;
  if Visible then begin
    Value:= TVA.Temp(rN.Value,rP.Value,rK.Value,Index);
    Value:= StrToFloat(SaltOutTemp.Text);
    gN.Text:= FloatToStrF(TVA.N(Value),ffFixed,2,2);
    gP.Text:= FloatToStrF(TVA.P(Value),ffFixed,2,2);
    gK.Text:= FloatToStrF(TVA.K(Value),ffFixed,2,2);
  end;
end;

procedure TFormulateForm.MaxBatchSpinBoxChange(Sender: TObject);
  begin
    TotalBatch;
  end;

procedure TFormulateForm.MaxBatchSpinBoxKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key=13 then begin
    CalcBatch;
  end;
end;

procedure TFormulateForm.MaxCFSpinBoxKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key=13 then begin
    CalcBatch;
  end;
end;

procedure TFormulateForm.MenuInsertClick(Sender: TObject);
var
  i: Integer;
begin
//   i:= A[1].AsInteger;
//   ShowMessage(InttoStr(i));
   ShowMessage('row');
end;

procedure TFormulateForm.NutFromClick(Sender: TObject);
begin
  ShowMessage('NutFrom('+IntToStr(BGrid.Row)+','+
                         IntToStr(BGrid.Col-1)+')');
  Lion.NutFrom(True,BGrid.Row,BGrid.Col-1);
  BGrid.RowCount;
  BGrid.ColumnCount;

end;

procedure TFormulateForm.MetricSwitchSwitch(Sender: TObject);
begin
  Lion.Metric:= MetricSwitch.IsChecked;
  if Lion.Metric then begin
    ProductUOM:= 11;
    if Lion.GradeUsed then AcresLabel.Text:= 'mTon'
                      else AcresLabel.Text:= 'Hectares';

//    AcresLabel.Text:= 'Hectars';
//    AcreLabel.Text:= 'mTon';
    DensityLabel.Text:= 'Kg./CM.';
    MaxLbsLabel.Text:= 'Max Kgs.';
    MaxCFLabel.Text:= 'Max CM.';
    RateLabel.Text:= 'Kgs/Hectare';
    PerAcreFloatColumn.Header:= 'Per Hectare';
  end else begin
    ProductUOM:= 1;
    if Lion.GradeUsed then AcresLabel.Text:= 'Tons'
                      else AcresLabel.Text:= 'Acres';
//    AcresLabel.Text:= 'Acres';
//    AcreLabel.Text:= 'Ton';
    DensityLabel.Text:= 'Lbs/CF.';
    MaxLbsLabel.Text:= 'Max Lbs.';
    MaxCFLabel.Text:= 'Max CF.';
    RateLabel.Text:= 'Lbs/Acre';
    PerAcreFloatColumn.Header:= 'Per Acre';
  end;
end;

procedure TFormulateForm.MixTabItemClick(Sender: TObject);
var
  s:string;
begin
  FileLayout    .Visible:= False;
//  CustomerLayout.Visible:= False;
  MixLayout     .Visible:= True;
  TagLayout     .Visible:= False;
  InvoiceLayout .Visible:= False;
  ItemizeLayout .Visible:= False;
  LabelMemo.Lines.Clear;
  DoMix;
end;

procedure TFormulateForm.NSpinBoxChange(Sender: TObject);
begin
  SpinBox('N');
end;

procedure TFormulateForm.OpenGAXClick(Sender: TObject);
begin
  FormulateForm.DoGAX('001','42789');
end;

procedure TFormulateForm.ORDClick(Sender: TObject);
begin
(*:
  BindSourceDBX.DataSource.DataSet:= LionDataModule.DataModule1.ORDER;
  LionDataModule.DataModule1.ORDER.Active:= True;
*)
end;

procedure TFormulateForm.OtherRadioButtonClick(Sender: TObject);
begin
  SetItemFilters;
end;

procedure TFormulateForm.PSpinBoxChange(Sender: TObject);
begin
  SpinBox('P');
end;

procedure TFormulateForm.MenuDeleteClick(Sender: TObject);
begin
  ShowMessage('Delete Row '+IntToStr(BGrid.Row));
end;

procedure TFormulateForm.DeleteColumnClick(Sender: TObject);
var
  Num : Integer;
  R   : Double;
begin
  ShowMessage('Delete Column '+IntToStr(BGrid.Col));
  Num:= BGrid.ColumnCount;
  Lion.DelCol(BGrid.Col-1);
  Dec(Num);
  Dec(Num);
//  BGrid.Col:= Num;
//  BGrid.Columns[num].Destroy;
  R:= Lion.B[2,2];
 end;

procedure TFormulateForm.DeleteRowClick(Sender: TObject);
var
  Num : Integer;
begin
  ShowMessage('Delete Row '+IntToStr(BGrid.Row));
  Num:= BGrid.RowCount;
  BGrid.RowCount;
  BGrid.ColumnCount;
  Lion.DelRow(BGrid.Row);
  BGrid.RowCount;
  BGrid.ColumnCount;
  Dec(Num);
  BGrid.RowCount:= Num;
end;

function TFormulateForm.DoAmount;
  begin
  end;

Procedure TFormulateForm.DoFile;
    var
      S,
      Margin,
      sUnit,
      Line  : String;
      Row,
      Col,
      I     : Integer;
      Factor,
      R,
      Product : Double;

Procedure DoTheInvoice;
  var
    I       : Integer;
    Line    : String;

    TotalInvoice,
//    Margin,
    TotalCost,
    TotalQty,
    sUnit,
    Name,
    Code,
    Qty,
    Price,
    Cost,
    Amount  : String;
    AcresTons,
    rTotalInvoice,
    rTotalCost,
    rTotalQty,
    rQty,
    rPrice,
    rCost,
    rAmount : Double;

    function Justify(Line: String;Size: Integer;Left: Boolean): String;
      begin
        if Length(Line)>Size then Line:= Copy(Line,1,Size);
        if Left then while (Length(Line) < Size) do Line:= Line+' '
                else while (Length(Line) < Size) do Line:= ' '+Line;
        Result:= Line;
      end;
  begin
//    Product:= Lion.Product;
    if Lion.Iteration <= 0.0 then exit;
    if (Lion.N <= 0)     then exit;
    if (not Lion.Solved) then exit;
    Margin:= '  ';


    AcresTons:= StrToFloat(AcresEdit.Text);
    rTotalInvoice:= 0.0;
    rTotalCost:= 0.0;
    rTotalQty:= 0.0;
    FileMemo.Lines.Append(Margin+Justify('Item',27,True)+
                             Justify('Qty',6,False)+
                             Justify('Price',9,False));
    For I:= Low(Lion.ActC) to High(Lion.ActC)-1 do begin
      Code:= Lion.ActC[I];
      Lion.Seek(Code);
      if Lion.Level > 0.0 then begin
        rQty:= Lion.Level*AcresTons;
        rTotalQty:= rTotalQty+rQty;
        TotalQty:= FloatToStrF(Lion.Product,ffFixed,10,2);
        Name:= Lion.InvoiceName;
        if Trim(Name) = '' then Name:= Lion.Name;

        rPrice:= Lion.Price;//*Lion.InputScale;
        Price := FloatToStrF(rPrice,ffCurrency,10,2);
        rCost:= Lion.Cost;//*Lion.InputScale;
        Cost := FloatToStrF(rCost,ffCurrency,10,2);
        Qty  := FloatToStrF(rQty,ffFixed,10,4);
        rAmount:= rQty*rPrice;
        Amount:= FloatToStrF(rAmount,ffCurrency,10,2);
        rTotalInvoice:= rTotalInvoice+rAmount;
        rTotalCost:= rTotalCost+(rQty*rCost);
        sUnit:= Lion.UnitName;

        if DataModule1.UnitsClientDataSet.Locate('Index',Lion.unitNum,[]) then
          sUnit:= DataModule1.UnitsClientDataSet.FieldByName('Unit').AsString;

        FileMemo.Lines.Append(Margin+Justify(Name,27,True)+
                                 Justify(Qty,6,False)+
                                 Justify(Price+'/'+sUnit,12,False));

      end;
      Lion.ActNext;
    end;
    Line:= 'Margin+Total';
    if Length(Line)>15 then Line:= Copy(Line,1,15);
    while (Length(Line) < 15) do Line:= Line+' ';
    Name:= Line;
    rPrice:= rTotalInvoice/rTotalQty;
    rCost:= rTotalCost/rTotalQty;
    TotalQty:= FloatToStrF(rTotalQty,ffFixed,10,2);
    Price := FloatToStrF(rPrice,ffFixed,10,2);
rCost:= Lion.TotalCost;
    Cost := FloatToStrF(rCost,ffFixed,10,2);
    TotalInvoice:= FloatToStrF(rTotalInvoice,ffCurrency,10,2);
    FileMemo.Lines.Append('');
    FileMemo.Lines.Append(Margin+Justify('Total',27,True)+
                             Justify(TotalQty,6,False)+
                             Justify(Price+'/'+sUnit,12,False));
  end;

Procedure DoTheTag;
    var
      Sources : TStringList;
      Margine,
      Margine2,
      TagName,
      Code,
      Suffix,
      Percent,
      S,
      xItem,
      xFields,
      Line  : String;
      Places,
      Round,
      Row,
      Col,
      II,
      I     : Integer;
      F,
      IsNutrient,
      InSet,
      FootNote : Boolean;
      R,
      Product : Double;

      function DoLine(Line1,Line2 : String): String;
        begin
          Result:= Line1;
          while (Length(Result) < 45) do Result:= Result+ ' ';
          Result:= Result+Line2;
        end;

      function DoCenter(Line : String;InSet: Integer): String;
        const
          Width = 52;
        var
          Margin  : Integer;
          Out     : String;
        begin
          if InSet > 0 then
            Margin:= InSet
          else
            Margin:= (Width-Length(Line)) div 2;
          Out:= '';
          while (Length(Out) < Margin) do Out:= ' '+Out;
          FileMemo.Lines.Append(Out+Line);
          Result:= Out+Line;
        end;

      begin
      if Lion.Iteration <= 0.0 then exit;
      if (Lion.N <= 0) then exit;

        FileMemo.Lines.Clear;
        Margine:= '';
        while (Length(Margine) < 3) do Margine:= Margine+' ';

        DoCenter('',0);
        DoCenter('Brand Name',0);
    //Grade
        Product:= 2000.0;
        Product:= Lion.Product;
        Line:= '';
        if Lion.Seek('_N') then begin
          Line:= FloatToStrF(((Lion.Level/Product)*100.0),ffFixed,6,0);
        end else Line:= '0';
        if Lion.Seek('_P') then begin
          Line:= Line+'-'+FloatToStrF(((Lion.Level/Product)*100.0),ffFixed,6,0);
        end else Line:= Line+'-0';
        if Lion.Seek('_K') then begin
          Line:= Line+'-'+FloatToStrF(((Lion.Level/Product)*100.0),ffFixed,6,0);
        end else Line:= Line+'-0';
        DoCenter(Line,0);
        DoCenter('',0);

        DoCenter('Guaranteed Analysis',0);

        I:= 0;

        S:= DataModule1.TagClientDataSet.Filter;
        F:= DataModule1.TagClientDataSet.Filtered;

        DataModule1.TagClientDataSet.First;
        while not DataModule1.TagClientDataSet.Eof do begin
          Inc(I);
          Code      := DataModule1.TagClientDataSet.FieldByName('Code').AsString;
          TagName   := DataModule1.TagClientDataSet.FieldByName('TagName').AsString;
          Suffix    := DataModule1.TagClientDataSet.FieldByName('Suffix').AsString;
          Places    := DataModule1.TagClientDataSet.FieldByName('Places').AsInteger;
          Round     := DataModule1.TagClientDataSet.FieldByName('Round').AsInteger;
          IsNutrient:= DataModule1.TagClientDataSet.FieldByName('IsNutrient').AsBoolean;
          InSet     := DataModule1.TagClientDataSet.FieldByName('InSet').AsBoolean;
          FootNote  := DataModule1.TagClientDataSet.FieldByName('FootNote').AsBoolean;
          S:= '_'+UpperCase(DataModule1.TagClientDataSet.FieldByName('Code').AsString);
          if Lion.Seek(S) then begin
            if (IsNutrient and (Lion.Level > 0.0)) then begin
              Percent:= FloatToStrF(((Lion.Level/Product)*100.0),ffFixed,6,Places);
              if InSet then begin
                Line:= Percent+Suffix+' '+TagName;
                DoCenter(Line,5);
              end else begin;
                while Length(TagName)< 43 do TagName:= TagName+'.';
                Line:= TagName+Percent;
                if Places = 0 then Line:= Line+'.00%'
                              else Line:= Line+Suffix;
                DoCenter(Line,0);
              end;
            end;
          end;
          DataModule1.TagClientDataSet.Next;
        end;

        Sources:= TStringList.Create;
        Line:= '';
        FileMemo.Lines.Append(Line);
        xFields:= 'Item';
        for II := Low(Lion.ActC) to High(Lion.ActC) do begin
          xItem:= Lion.ActC[II];
          if Lion.Seek(xItem) then begin
            if Lion.Level > 0.0 then begin

              if DataModule1.FertClientDataSet.Locate(xFields,VarArrayOf([xItem]),[]) then begin
                while not DataModule1.FromClientDataSet.Eof do begin
                  Line:= DataModule1.FromClientDataSet.FieldByName('AIName').AsString;
                  Sources.Append(Line);
                  DataModule1.FromClientDataSet.Next;
                end;

              end;
            end;
          end;
        end;

        i:= 0;
        Line:= 'Plant Nutrients derived from: ';
        while (i <= Sources.Count-1) do begin
          while ((i <= Sources.Count-1) and (Length(Line+Sources[i])<50)) do begin
            if ((Line <> '') and (i > 0)) then Line:= Line+',';
            Line:= Line+Sources[i];
            Inc(i);
          end;
          DoCenter(Line,2);
          Line:= '';
        end;

        Sources.Free;
      end;

      begin
      if Lion.Iteration <= 0.0 then exit;
      if (Lion.N <= 0) then exit;
        FileMemo.Lines.Clear;
        Margin:= '   ';
        Line:= '          File Copy';
        FileMemo.Lines.Append(Margin+Line);
        DoTheTag;
//        DoTag;
        FileMemo.Lines.Append('');
        DoTheInvoice;
        FileMemo.Lines.Append('');

        Line:= 'Material      Per Batch     Unit';
        FileMemo.Lines.Append(Margin+Line);
        for  Col:= 0 to 9 do
        for  Row:= 0 to AGrid.RowCount-1 do
         AGrid.Columns[Col].UpdateCell(Row);
        for  Col:= 0 to 9 do
        for  Row:= 0 to RGrid.RowCount-1 do
         RGrid.Columns[Col].UpdateCell(Row);

        For I:= Low(Lion.ActC) to High(Lion.ActC)-1 do begin
          Lion.Seek(Lion.ActC[I]);
          if Lion.Level > 0.0 then begin
            Line:= Lion.Name;
            while (Length(Line) < 15) do Line:= Line+' ';
            S:= FloatToStrF(Lion.Level*2000.0,ffFixed,6,0);
            while (Length(S) < 5) do S:= ' '+S;
            if DataModule1.UnitsClientDataSet.Locate('Index',Lion.unitNum,[]) then
              sUnit:= DataModule1.UnitsClientDataSet.FieldByName('Unit').AsString;
            if Lion.Metric then sUnit:= 'Kgm'
                           else sUnit:= 'Lbs';
            while (Length(sUnit) < 12) do sUnit:= ' '+sUnit;
            FileMemo.Lines.Append(Margin+Line+S+sUnit);
          end;
        end;
        Line:= 'Total';
        while (Length(Line) < 8) do Line:= Line+' ';
        S:= FloatToStrF(Lion.Product*Lion.InputScale,ffFixed,6,0);
        while (Length(S) < 12) do S:= ' '+S;
        S:= S+'         Lbs';
        FileMemo.Lines.Append(Margin+Line+S);

        for Col := 0 to InputGrid.ColumnCount-1 do
        for Row := 0 to InputGrid.RowCount-1 do
          InputGrid.Columns[Col].UpdateCell(Row);
      end;

procedure TFormulateForm.DoGAX(Loc,OrderNum: String);
  var
     FUSSH,FUSSD,FUSSC,
     ID,
     TType,
     xFields,
     Line,
     FileName : String;
     OK       : Boolean;
     SEQ      : String;
     SEQNum   : Double;
     Memo1    : TMemo;
  begin
(*
    Memo1:= TMemo.Create(nil);
    FileName:= DataModule1.UsrPath+LOC+OrderNum+'.CSV';



        xFields:= 'LOC;ORDER';
        DataModule1.DHIS.Locate(xFields,VarArrayOf([LOC,OrderNum]),[]);
        Line:= 'FUSSH';
        FUSSH:= QuotedStr(Line)+',';
        Line:= 'S';
        FUSSH:= FUSSH+ QuotedStr(Line)+',';
        FUSSH:= FUSSH+ QuotedStr(Loc)+',';
        FUSSH:= FUSSH+ QuotedStr(Loc)+',';
        FUSSH:= FUSSH+ QuotedStr(OrderNum)+',';
        Line:= DataModule1.DHIS.FieldByName('CUST').AsString;
        FUSSH:= FUSSH+ QuotedStr(Line)+',';
        Line:= DataModule1.DHIS.FieldByName('SHIPTO').AsString;
        FUSSH:= FUSSH+ QuotedStr(Line)+',';
        Memo1.Lines.Append(FUSSH);

        DataModule1.DHIS.Locate(xFields,VarArrayOf([LOC,OrderNum]),[]);
        Line:= 'FUSSD';
        FUSSD:= QuotedStr(Line)+',';
        Seq:= '01';
        FUSSD:= FUSSD+ QuotedStr(Seq)+',';
        Line:= 'FF-FLUID';
        FUSSD:= FUSSD+ QuotedStr(Line)+',';
        Line:= DataModule1.DHIS.FieldByName('GRADE').AsString;
        FUSSD:= FUSSD+ QuotedStr(Line)+',';
//        Line:= DataModule1.DHIS.FieldByName('UNITS').AsString;
//        FUSSD:= FUSSD+ QuotedStr(Line)+',';
//        Line:= DataModule1.DHIS.FieldByName('UNITS').AsString;
//        FUSSD:= FUSSD+ QuotedStr(Line)+',';

        Line:= DataModule1.DHIS.FieldByName('Loc').AsString;
        FUSSD:= FUSSD+ QuotedStr(Line)+',';
        Line:= DataModule1.DHIS.FieldByName('Order').AsString;
        FUSSD:= FUSSD+ QuotedStr(Line)+',';
        Memo1.Lines.Append(FUSSD);


        with DataModule1.DACC do begin
//                S:= 'Loc='+QuotedStr(xLoc)+'';

//          DataModule1.DACC.F'ilter:= 'ORDER='+QuotedStr(ORDER)+'';
//          DataModule1.DACC.Filtered:= True;
//          BillTo_LayOut.Visible:= FieldByName('Split').AsBoolean;

          DataModule1.DACC.Filtered:= False;
          DataModule1.DACC.Locate(xFields,VarArrayOf([LOC,OrderNum]),[]);
          DataModule1.DACC.Filter:= 'ORDER='+QuotedStr(OrderNum)+
                                    'and LOC='+QuotedStr(LOC)+
                                    'and KIND='+QuotedStr('0');
          DataModule1.DACC.Filtered:= True;

          while not DataModule1.DACC.Eof do begin
            if (FieldByName('KIND').AsString = '0') then begin
              Line:= QuotedStr('FUSSC');
              Line:= Line+QuotedStr(FieldByName('ITEM').AsString);
              Line:= Line+QuotedStr(FieldByName('UNITS').AsString);
              Line:= Line+QuotedStr(FieldByName('QTY').AsString);
              Line:= Line+QuotedStr(FieldByName('PRICE').AsString);
              Line:= Line+QuotedStr(FieldByName('PRICE').AsString);
              Line:= Line+QuotedStr(FieldByName('PRICE').AsString);
              Line:= Line+QuotedStr(FieldByName('PRICE').AsString);
              Line:= Line+QuotedStr(FieldByName('LOC').AsString);
              Line:= Line+QuotedStr(FieldByName('ORDER').AsString);
            end else
            if (FieldByName('KIND').AsString = '4') then begin
              Line:= QuotedStr('FUSSD');
            end;
            Memo1.Lines.Append(Line);
            DataModule1.DACC.Next;
          end;
        end;

    Memo1.Lines.SaveToFile(FileName);
    Memo1.Free;
*)
  end;

Procedure TFormulateForm.DoMix;
    var
      S,
      Margin,
      Line  : String;
      Row,
      Col,
      I     : Integer;
      Factor,
      R,
      Product : Double;

      begin
      if (Lion.N <= 0) then exit;
        MixMemo.Lines.Clear;
        Margin:= '   ';
        Line:= 'Material      Per Batch     Unit';
        MixMemo.Lines.Append(Margin+Line);
        for  Col:= 0 to 9 do
        for  Row:= 0 to AGrid.RowCount-1 do
          AGrid.Columns[Col].UpdateCell(Row);
        for  Col:= 0 to 9 do
        for  Row:= 0 to RGrid.RowCount-1 do
          RGrid.Columns[Col].UpdateCell(Row);
        Product:= Lion.Product;
        Product:= 0;
        CalcBatch;
        For I:= Low(Lion.ActC) to High(Lion.ActC)-1 do begin
          S:= Lion.ActC[I];
          Lion.Seek(S);
          if Lion.Level > 0.0 then begin
            Product:= Product+(Lion.Level*Lion.InputScale);
          end;
        end;

        Factor:= BatchSize/TotalBatch;
        For I:= Low(Lion.ActC) to High(Lion.ActC)-1 do begin
          S:= Lion.ActC[I];
          Lion.Seek(S);
          if Lion.Level > 0.0 then begin
            Line:= Lion.Name;
            if Length(Line)>15 then Line:= Copy(Line,1,15);

            while (Length(Line) < 15) do Line:= Line+' ';
            R:= Lion.Level*Lion.InputScale*Factor;
            S:= FloatToStrF(R,ffFixed,6,0);
            while (Length(S) < 5) do S:= ' '+S;
            S:= S+'         Lbs';
            MixMemo.Lines.Append(Margin+Line+S);
          end;
        end;
        Line:= 'Total';
        while (Length(Line) < 8) do Line:= Line+' ';
        S:= FloatToStrF(TotalBatch*Factor,ffFixed,6,0);
        while (Length(S) < 12) do S:= ' '+S;
        S:= S+'         Lbs';
        MixMemo.Lines.Append(Margin+Line+S);


        for Col := 0 to InputGrid.ColumnCount-1 do
        for Row := 0 to InputGrid.RowCount-1 do
          InputGrid.Columns[Col].UpdateCell(Row);
      end;

procedure TFormulateForm.DoMyBtnClick(Sender: TObject);
var
  i : Integer;
  R : Double;
  Report,
  New,
  B : Boolean;
  xFields,
  Item,
  S : String;
begin
  DoMyBtn.Cursor:= CrHourGlass;
  xFields:= 'LOC;ITEM';

  with DataModule1.FertClientDataSet do begin
    Open;
    DisableControls;
    First;
    while not eof do begin
      Report:= FieldByName('Report').AsBoolean;
      Item  := FieldByName('Item').AsString;
      New:= not DataModule1.ItemClientDataSet.Locate(xFields,VarArrayOf([Lion.Location,Item]),[]);
      if Report then begin
        if New then DataModule1.ItemClientDataSet.Append
               else DataModule1.ItemClientDataSet.Edit;
        DataModule1.ItemClientDataSet.FieldByName('Loc').AsString:= Lion.Location;
        DataModule1.ItemClientDataSet.FieldByName('Item').AsString:=
        DataModule1.FertClientDataSet.FieldByName('Item').AsString;
        DataModule1.ItemClientDataSet.FieldByName('InventoryName').AsString:=
        DataModule1.FertClientDataSet.FieldByName('Name').AsString;
        DataModule1.ItemClientDataSet.FieldByName('InvoiceName').AsString:=
        DataModule1.FertClientDataSet.FieldByName('Name').AsString;
        DataModule1.ItemClientDataSet.FieldByName('FUSName').AsString:=
        DataModule1.FertClientDataSet.FieldByName('MIXName').AsString;
        DataModule1.ItemClientDataSet.FieldByName('TYPE').AsString:= 'F';
    //      DataModule1.FertClientDataSet.FieldByName('ITEMTYPE').AsString;
        DataModule1.ItemClientDataSet.FieldByName('IsFluid').AsBoolean:=
       (DataModule1.FertClientDataSet.FieldByName('Water').AsFloat>0);

        DataModule1.ItemClientDataSet.FieldByName('InventoryUOM').AsInteger:= 0;
        DataModule1.ItemClientDataSet.FieldByName('InvoiceUOM').AsInteger:= 0;
        DataModule1.ItemClientDataSet.FieldByName('FUSUOM').AsInteger:= 0;
        DataModule1.ItemClientDataSet.FieldByName('FUSCost').AsFloat:= 999.0;
        DataModule1.ItemClientDataSet.FieldByName('Price1').AsFloat:= 999.0;
        DataModule1.ItemClientDataSet.FieldByName('FUSLBS').AsFloat:= 2000.0;
        DataModule1.ItemClientDataSet.FieldByName('Density').AsInteger:=
        DataModule1.FertClientDataSet.FieldByName('Density').AsInteger;
        DataModule1.ItemClientDataSet.FieldByName('SPG').AsInteger:=
        DataModule1.FertClientDataSet.FieldByName('SPG').AsInteger;
        DataModule1.ItemClientDataSet.Post;
      end; //Report

      if New then DataModule1.MyFertClientDataSet.Append
             else DataModule1.MyFertClientDataSet.Edit;
      DataModule1.MyFertClientDataSet.FieldByName('LOC').AsString:= Lion.Location;
      DataModule1.MyFertClientDataSet.FieldByName('Item').AsString:= Item;

      DataModule1.MyFertClientDataSet.FieldByName('UFTRS').AsString:=
      DataModule1.FertClientDataSet.FieldByName('UFTRS').AsString;
      DataModule1.MyFertClientDataSet.FieldByName('BagBlkLq').AsInteger:=
      DataModule1.FertClientDataSet.FieldByName('BagBlkLq').AsInteger;
      DataModule1.MyFertClientDataSet.FieldByName('SOL32').AsFloat:=
      DataModule1.FertClientDataSet.FieldByName('SOL32').AsFloat;
      DataModule1.MyFertClientDataSet.FieldByName('SOL77').AsFloat:=
      DataModule1.FertClientDataSet.FieldByName('SOL77').AsFloat;
      for i:= 18 to 79 do begin
        DataModule1.MyFertClientDataSet.Edit;
        S:= DataModule1.FertClientDataSet.FieldDefs.Items[i].Name;
        if ((i>=29)and(i<=31)) then begin
          B:= DataModule1.FertClientDataSet.FieldByName(S).AsBoolean;
          DataModule1.MyFertClientDataSet.FieldByName(S).AsBoolean:= B;
        end else begin
          R:= DataModule1.FertClientDataSet.FieldByName(S).AsFloat;
          DataModule1.MyFertClientDataSet.FieldByName(S).AsFloat:= R;
        end;
      end;
      DataModule1.MyFertClientDataSet.Post;
      Next;
      EnableControls;
      Close;
    end; // not EOF FertClientDataSet
  end;
  DoMyBtn.Cursor:= CrDefault;
end;


Procedure TFormulateForm.DoInvoice;
  var
    I       : Integer;
    Line    : String;

    TotalInvoice,
    Margin,
    TotalCost,
    TotalQty,
    sUnit,
    Name,
    Code,
    Qty,
    Price,
    sCost,
    Amount  : String;
    AcresTons,
    rTotalInvoice,
    rTotalCost,
    rTotalQty,
    rQty,
    rPrice,
    rCost,
    rAmount : Double;

    function Justify(Line: String;Size: Integer;Left: Boolean): String;
      begin
        if Length(Line)>Size then Line:= Copy(Line,1,Size);
        if Left then while (Length(Line) < Size) do Line:= Line+' '
                else while (Length(Line) < Size) do Line:= ' '+Line;
        Result:= Line;
      end;

  begin
//    Product:= Lion.Product;
    if Lion.Iteration <= 0.0 then exit;
    if (Lion.N <= 0)     then exit;
    if (not Lion.Solved) then exit;


    AcresTons:= StrToFloat(AcresEdit.Text);
    rTotalInvoice:= 0.0;
    rTotalCost:= 0.0;
    rTotalQty:= 0.0;
    InvoiceMemo.Lines.Clear;
(*
    if Trim( DataModule1.DADDClientDataSetName .AsString) <> '' then begin
      Line:= DataModule1.DADDClientDataSetCity .AsString+' '+
             DataModule1.DADDClientDataSetState.AsString+' '+
             DataModule1.DADDClientDataSetZip  .AsString;
    end;

      InvoiceMemo.Lines.Append('');
      InvoiceMemo.Lines.Append('Ship to:');
      InvoiceMemo.Lines.Append('');

      InvoiceMemo.Lines.Append('   '+DataModule1.DADDClientDataSetID.AsString);
      InvoiceMemo.Lines.Append('');

      InvoiceMemo.Lines.Append('   '+DataModule1.DADDClientDataSetName.AsString);
      InvoiceMemo.Lines.Append('   '+DataModule1.DADDClientDataSetAddress.AsString);
      if (DataModule1.DADDClientDataSetAddress2.AsString<>'') then
      InvoiceMemo.Lines.Append('   '+DataModule1.DADDClientDataSetAddress2.AsString);
*)
      InvoiceMemo.Lines.Append('   '+Line);
      InvoiceMemo.Lines.Append('');
      InvoiceMemo.Lines.Append(Justify('Item',27,True)+
                             Justify('Qty',6,False)+
//                             Justify('Unit',5)+
                             Justify('Price',9,False)+
                             Justify('Total',12,False));
    For I:= Low(Lion.ActC) to High(Lion.ActC)-1 do begin
      Code:= Lion.ActC[I];
      Lion.Seek(Code);
      if Lion.Level > 0.0 then begin
        rQty:= Lion.Level*AcresTons;
        rTotalQty:= rTotalQty+rQty;
        TotalQty:= FloatToStrF(Lion.Product,ffFixed,10,2);
        Name:= Lion.InvoiceName;
        if Trim(Name) = '' then Name:= Lion.Name;

        rPrice:= Lion.Price;//*Lion.InputScale;
        Price := FloatToStrF(rPrice,ffCurrency,10,2);
        rCost:= Lion.Cost;//*Lion.InputScale;
        sCost := FloatToStrF(rCost,ffCurrency,10,2);
        Qty  := FloatToStrF(rQty,ffFixed,10,4);
        rAmount:= rQty*rPrice;
        Amount:= FloatToStrF(rAmount,ffCurrency,10,2);
        rTotalInvoice:= rTotalInvoice+rAmount;
        rTotalCost:= rTotalCost+(rQty*rCost);
        sUnit:= Lion.UnitName;

        if DataModule1.UnitsClientDataSet.Locate('Index',Lion.unitNum,[]) then
          sUnit:= DataModule1.UnitsClientDataSet.FieldByName('Unit').AsString;

//        Name:= Justify(Name,28);

//        InvoiceMemo.Lines.Append(Name+Qty+' '+sUnit+' '+Price+' '+'$'+Amount);
        InvoiceMemo.Lines.Append(Justify(' '+Name,27,True)+
                                 Justify(Qty,6,False)+
//                                 Justify(sUnit,5)+
                                 Justify(Price+'/'+sUnit,12,False)+
                                 Justify(Amount,11,False));

      end;
      Lion.ActNext;
    end;
    Line:= 'Total';
    if Length(Line)>15 then Line:= Copy(Line,1,15);
    while (Length(Line) < 15) do Line:= Line+' ';
    Name:= Line;
    rPrice:= rTotalInvoice/rTotalQty;
    rCost:= rTotalCost/rTotalQty;
    TotalQty:= FloatToStrF(rTotalQty,ffFixed,10,2);
    Price := FloatToStrF(rPrice,ffFixed,10,2);
rCost:= Lion.TotalCost;
    sCost := FloatToStrF(rCost,ffFixed,10,2);
    TotalInvoice:= FloatToStrF(rTotalInvoice,ffCurrency,10,2);
    InvoiceMemo.Lines.Append('');
    InvoiceMemo.Lines.Append(Justify('Total',27,True)+
                             Justify(TotalQty,6,False)+
//                             Justify(sUnit,8)+
//                             Justify(Price,19,False)+
                             Justify(Price+'/'+sUnit,12,False)+
                             Justify(TotalInvoice,11,False));

//    rPrice:= ((rPrice - rCost)/rPrice)*100.0;
//    Margin:= FloatToStrF(rPrice,ffFixed,10,2);
    Margin:= FloatToStrF(Lion.TotalMargin,ffFixed,10,2);
    iTotalLabel.Text:= TotalInvoice;
    iPriceLabel.Text:= '$'+Price;
    iCostLabel.Text:= '$'+sCost;
    iTonsLabel.Text:= TotalQty;
    iMarginLabel.Text:= Margin+'%';
end;

Procedure TFormulateForm.DoTag;
    var
      Sources : TStringList;
      Margine,
      Margine2,
      TagName,
      Code,
      Suffix,
      Percent,
      S,
      xItem,
      xFields,
      Line  : String;
      Places,
      Round,
      Row,
      Col,
      II,
      I     : Integer;
      F,
      IsNutrient,
      InSet,
      FootNote : Boolean;
      R,
      Product : Double;

      function DoLine(Line1,Line2 : String): String;
        begin
          Result:= Line1;
          while (Length(Result) < 45) do Result:= Result+ ' ';
          Result:= Result+Line2;
        end;

      function DoCenter(Line : String;InSet: Integer): String;
        const
          Width = 52;
        var
          Margin  : Integer;
          Out     : String;
        begin
          if InSet > 0 then
            Margin:= InSet
          else
            Margin:= (Width-Length(Line)) div 2;
          Out:= '';
          while (Length(Out) < Margin) do Out:= ' '+Out;
          LabelMemo.Lines.Append(Out+Line);
          Result:= Out+Line;
        end;

      begin
      if Lion.Iteration <= 0.0 then exit;
      if (Lion.N <= 0) then exit;

        LabelMemo.Lines.Clear;
        Margine:= '';
        while (Length(Margine) < 3) do Margine:= Margine+' ';

        DoCenter('',0);
        DoCenter('Brand Name',0);
    //Grade
        Product:= 2000.0;
        Product:= Lion.Product;
        Line:= '';
        if Lion.Seek('_N') then begin
          Line:= FloatToStrF(((Lion.Level/Product)*100.0),ffFixed,6,0);
        end else Line:= '0';
        if Lion.Seek('_P') then begin
          Line:= Line+'-'+FloatToStrF(((Lion.Level/Product)*100.0),ffFixed,6,0);
        end else Line:= Line+'-0';
        if Lion.Seek('_K') then begin
          Line:= Line+'-'+FloatToStrF(((Lion.Level/Product)*100.0),ffFixed,6,0);
        end else Line:= Line+'-0';
        DoCenter(Line,0);
//        DoCenter(Lion.GradeStr,0);
        DoCenter('',0);

        DoCenter('Guaranteed Analysis',0);

        I:= 0;

        S:= DataModule1.TagClientDataSet.Filter;
        F:= DataModule1.TagClientDataSet.Filtered;

        DataModule1.TagClientDataSet.First;
        while not DataModule1.TagClientDataSet.Eof do begin
          Inc(I);
          Code      := DataModule1.TagClientDataSet.FieldByName('Code').AsString;
          TagName   := DataModule1.TagClientDataSet.FieldByName('TagName').AsString;
          Suffix    := DataModule1.TagClientDataSet.FieldByName('Suffix').AsString;
          Places    := DataModule1.TagClientDataSet.FieldByName('Places').AsInteger;
          Round     := DataModule1.TagClientDataSet.FieldByName('Round').AsInteger;
          IsNutrient:= DataModule1.TagClientDataSet.FieldByName('IsNutrient').AsBoolean;
          InSet     := DataModule1.TagClientDataSet.FieldByName('InSet').AsBoolean;
          FootNote  := DataModule1.TagClientDataSet.FieldByName('FootNote').AsBoolean;
//S:= DataModule1.TagClientDataSet.Filter;
          S:= '_'+UpperCase(DataModule1.TagClientDataSet.FieldByName('Code').AsString);
          if Lion.Seek(S) then begin
            if (IsNutrient and (Lion.Level > 0.0)) then begin
              Percent:= FloatToStrF(((Lion.Level/Product)*100.0),ffFixed,6,Places);
              if InSet then begin
                Line:= Percent+Suffix+' '+TagName;
                DoCenter(Line,5);
              end else begin;
                while Length(TagName)< 43 do TagName:= TagName+'.';
                Line:= TagName+Percent;
                if Places = 0 then Line:= Line+'.00%'
                              else Line:= Line+Suffix;
                DoCenter(Line,0);
              end;
            end;
          end;
          DataModule1.TagClientDataSet.Next;
        end;

        Sources:= TStringList.Create;
        Line:= '';
        LabelMemo.Lines.Append(Line);
(*
        LionDataModule.DataModule1.MySourceClientDataSet.Filter:= 'LOC=''001''';
        LionDataModule.DataModule1.MySourceClientDataSet.Filtered:= True;
        LionDataModule.DataModule1.MySourceClientDataSet.Active:= True;
//        xFields:= 'Loc;Item';
//        Lion.Location:= '001';
        xFields:= 'Item';
        Lion.Location:= '001';
*)
//        Lion.ActFirst;
//        while Not Lion.ActEof do begin
        xFields:= 'Item';
        for II := Low(Lion.ActC) to High(Lion.ActC) do begin
          xItem:= Lion.ActC[II];
          if Lion.Seek(xItem) then begin
            if Lion.Level > 0.0 then begin

              DataModule1.FromClientDataSet.Open;
              if DataModule1.FertClientDataSet.Locate(xFields,VarArrayOf([xItem]),[]) then begin
                while not DataModule1.FromClientDataSet.Eof do begin
                  Line:= DataModule1.FromClientDataSet.FieldByName('AIName').AsString;
                  Sources.Append(Line);
                  DataModule1.FromClientDataSet.Next;
                end;


(*
                while not DataModule1.MySourceClientDataSet.Eof do begin
                  Line:= DataModule1.MySourceClientDataSet.FieldByName('Name').AsString;
                  Sources.Append(Line);
                  DataModule1.MySourceClientDataSet.Next;
                end;
*)
              end;
            end;
          end;
        end;

        i:= 0;
        Line:= 'Plant Nutrients derived from: ';
        while (i <= Sources.Count-1) do begin
          while ((i <= Sources.Count-1) and (Length(Line+Sources[i])<50)) do begin
            if ((Line <> '') and (i > 0)) then Line:= Line+',';
            Line:= Line+Sources[i];
            Inc(i);
          end;
          DoCenter(Line,2);
          Line:= '';
        end;

        Sources.Free;
      end;

procedure TFormulateForm.DropDownEditButton3Click(Sender: TObject);
begin
//
end;

procedure TFormulateForm.DryFilter2Change(Sender: TObject);
begin
    SetFilters;
end;

procedure TFormulateForm.DryFilter2Click(Sender: TObject);
begin
  SetFilters;
end;

procedure TFormulateForm.DryRadioButtonChange(Sender: TObject);
begin
  SetItemFilters;
end;

procedure TFormulateForm.DrySwitchSwitch(Sender: TObject);
begin
  Dry:= DrySwitch.IsChecked;
  saltouttemp.Visible:= not Dry;
  saltoutTF.Visible  := not Dry;
  if Dry then begin
    if Lion.Metric then begin
      if Lion.GradeUsed then AcresLabel.Text:= 'mTon'
                        else AcresLabel.Text:= 'Hectares';
        DensityLabel.Text:= 'Kg./CM.';
        MaxLbsLabel.Text:= 'Max Kgs.';
        MaxCFLabel.Text:= 'Max CM.';
        RateLabel.Text:= 'Kgs/Hectare';
        PerAcreFloatColumn.Header:= 'Per Hectare';
      end else begin
      if Lion.GradeUsed then AcresLabel.Text:= 'Tons'
                        else AcresLabel.Text:= 'Acres';
        DensityLabel.Text:= 'Lbs/CF.';
        MaxLbsLabel.Text:= 'Max Lbs.';
        MaxCFLabel.Text:= 'Max CF.';
        RateLabel.Text:= 'Lbs/Acre';
        PerAcreFloatColumn.Header:= 'Per Acre';
      end;
  end else begin
    if Lion.Metric then begin
      if Lion.GradeUsed then AcresLabel.Text:= 'mTon'
                        else AcresLabel.Text:= 'Hectares';
      DensityLabel.Text:= 'Kg./CM.';
      MaxLbsLabel.Text:= 'Max Kgs.';
      MaxCFLabel.Text:= 'Max CM.';
      RateLabel.Text:= 'Kgs/Hectare';
      PerAcreFloatColumn.Header:= 'Per Hectare';
    end else begin
      if Lion.GradeUsed then AcresLabel.Text:= 'Tons'
                        else AcresLabel.Text:= 'Acres';

      DensityLabel.Text:= 'Lbs/Gal.';
      MaxLbsLabel.Text:= 'Max Lbs.';
      MaxCFLabel.Text:= 'Max Gal';
      RateLabel.Text:= 'Lbs/Acre';
      PerAcreFloatColumn.Header:= 'Per Acre';
    end;
  end;
end;

procedure TFormulateForm.EqualSwitchClick(Sender: TObject);
begin
  if EqualSwitch.IsChecked then EqualLabel.Text:= '=' else
                                EqualLabel.Text:= '<>';
end;

procedure TFormulateForm.EqualSwitchKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key=13 then begin
    CalcBatch;
  end;
end;

procedure TFormulateForm.EveryRadioButtonClick(Sender: TObject);
begin
  SetItemFilters;
end;

procedure TFormulateForm.ExampleSwitchSwitch(Sender: TObject);
begin
  DataModule1.Example:= ExampleSwitch.IsChecked;
  GetGroups;
  GroupEdit.Visible:= True;
//  SaveBtn.Visible:= not ExampleSwitch.IsChecked;
//  DataModule1.UsrDataReopen;
end;

procedure TFormulateForm.ExportBTNClick(Sender: TObject);
      var
        Path  : String;

      begin
        Lion.XMLGroup:= True;
        Path:= DataModule1.UsrPath+Trim(GroupEdt.Text)+'.MPS';
        Memo1.Lines.Clear;
        Lion.SaveMPS(Trim(GroupEdt.Text),Memo1);
//        SaveGroupXML(Memo1);
        Memo1.Lines.SaveToFile(Path);
        Lion.XMLGroup:= False;
      end;

procedure TFormulateForm.FavoriteCheckClick(Sender: TObject);
begin
  SetFilters;
end;

procedure TFormulateForm.FertDataGridCheckboxClick(Sender: TObject;
  CellAttributes: TwwCellAttributes; AFieldName: string);
begin
//  DataModule1.FertClientDataSet.ApplyUpdates(-1);
//  DataModule1.FertClientDataSet.FieldByName(AFieldName).AsBoolean;
end;

procedure TFormulateForm.FertRadioButtonClick(Sender: TObject);
begin
  SetItemFilters;
end;

procedure TFormulateForm.FileTabItemClick(Sender: TObject);
begin
  FileLayout    .Visible:= True;
  CustomerLayout.Visible:= False;
  MixLayout     .Visible:= False;
  TagLayout     .Visible:= False;
  InvoiceLayout .Visible:= False;
  ItemizeLayout .Visible:= False;
  DoFile;
end;

procedure TFormulateForm.FilterCheckBoxChange(Sender: TObject);
begin
  FilterPanel.Visible:= FilterCheckBox.IsChecked;
end;

procedure TFormulateForm.FilterCheckBoxClick(Sender: TObject);
begin
  SetFilters;
end;

procedure TFormulateForm.FluidRadioButtonClick(Sender: TObject);
begin
  SetItemFilters;
end;

procedure TFormulateForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  FN : String;
begin
  with DataModule1 do begin
    ItemClientDataSet    .Active:= False;
    MyFertClientDataSet  .Active:= False;
    MySourceClientDataSet.Active:= False;
    UnitsClientDataSet   .Active:= False;
    FertClientDataSet    .Active:= False;
    ActiveClientDataSet  .Active:= False;
    TagClientDataSet     .Active:= False;
    FromClientDataSet    .Active:= False;
  end;
(* *)
  FN:= Ini.FileName;
//    DataModule1.AppPath+DataModule1.AppName+'.ini';
//  Ini:= TIniFile.Create(DataModule1.AppPath+DataModule1.AppName+'.ini');
  Ini.WriteString('Section','Location'   ,Lion.Location);
  Ini.WriteBool  ('Section','RatiosSwitch',RatiosSwitch.IsChecked);
  Ini.WriteBool  ('Section','AutoSwitch'  ,AutoSwitch.IsChecked);
  Ini.WriteBool  ('Section','MetricSwitch',MetricSwitch.IsChecked);
  Ini.WriteBool  ('Section','DrySwitch'   ,DrySwitch.IsChecked);
  Ini.WriteBool  ('Section','EqualSwitch' ,EqualSwitch.IsChecked);
  Ini.WriteString('Section','GroupEdt'    ,GroupEdt.Text);
  Ini.WriteBool  ('Section','ExampleSwitch',ExampleSwitch.IsChecked);
  Ini.WriteBool  ('Section','GradeUsed',Lion.GradeUsed);
  Ini.WriteFloat ('Section','SpinBox1',SpinBox1.Value);
  Ini.WriteFloat ('Section','SpinBox2',SpinBox2.Value);
  Ini.WriteFloat ('Section','SpinBox3',SpinBox3.Value);
  Ini.WriteFloat ('Section','SpinBox4',SpinBox4.Value);
  Ini.WriteFloat ('Section','SpinBox5',SpinBox5.Value);
  Ini.WriteFloat ('Section','SpinBox6',SpinBox6.Value);
  Ini.WriteFloat ('Section','SpinBox7',SpinBox7.Value);
  Ini.WriteFloat ('Section','SpinBox8',SpinBox8.Value);
  Ini.UpdateFile;
(*  *)
end;

procedure TFormulateForm.FormCreate(Sender: TObject);
var
  Value : Double;
  St    : String;
  I     : Integer;
begin
  Path.Text:= DataModule1.UsrPath;
  TVA:= TVASaltOutTemp.Create;
  Value:= TVA.Temp(1,1,1,3);
  Value:= 32.0;
  SaltOutTemp.Text:= FloatToStrF(Value,ffFixed,3,0);
  Dry:= DrySwitch.IsChecked;
  saltouttemp.Visible:= not Dry;
  saltoutTF.Visible  := not Dry;

  FileLayout    .Visible:= False;
//  CustomerLayout.Visible:= False;
  MixLayout     .Visible:= False;
  TagLayout     .Visible:= False;
  InvoiceLayout .Visible:= True;
  ItemizeLayout .Visible:= False;

  Ini:= TIniFile.Create(DataModule1.AppPath+DataModule1.AppName+'.ini');
  Lion.Location:= Ini.ReadString('Section','Location','001');
  LocEdit.Text:= Lion.Location;
  RatiosSwitch.IsChecked:= Ini.ReadBool('Section','RatiosSwitch',True);
  RatiosSwitchSwitch(Sender);
  AutoSwitch.IsChecked:= Ini.ReadBool('Section','AutoSwitch',False);
  MetricSwitch.IsChecked:= Ini.ReadBool('Section','MetricSwitch',False);
  MetricSwitchSwitch(Sender);
  DrySwitch.IsChecked:= Ini.ReadBool('Section','DrySwitch',True);
  EqualSwitch.IsChecked:= Ini.ReadBool('Section','EqualSwitch',True);

  SpinBox1.Value:= Ini.ReadFloat('Section','SpinBox1',57.0);
  SpinBox2.Value:= Ini.ReadFloat('Section','SpinBox2',100);
  SpinBox3.Value:= Ini.ReadFloat('Section','SpinBox3',77);
  SpinBox4.Value:= Ini.ReadFloat('Section','SpinBox4',38);
  SpinBox5.Value:= Ini.ReadFloat('Section','SpinBox5',157);
  SpinBox6.Value:= Ini.ReadFloat('Section','SpinBox6',20);
  SpinBox7.Value:= Ini.ReadFloat('Section','SpinBox7',10);
  SpinBox8.Value:= Ini.ReadFloat('Section','SpinBox8',10);

  GroupEdt.Text:= Ini.ReadString('Section','GroupEdt','BLEND');
  EqualSwitchClick(Sender);
//  MaxBatchSpinBox.Value:= Ini.ReadReal('Section','MaxBatchSpinBox',2000.0);

//  ExampleSwitch.IsChecked:= Ini.ReadBool('Section','ExampleSwitch',False);

  GroupPath:= DataModule1.SharedDocumentsPath;//.GroupPath;
  if ExampleSwitch.IsChecked then GroupPath:= GroupPath+'Example'+PathDelim
                             else GroupPath:= GroupPath+'Company'+PathDelim;
  Group:= 'BLEND';
  GroupName:= GroupPath+Group+'.MPS';
  if not FileExists(GroupName) then GroupName:= '';
  Lion.GradeUsed:= False;

  Lion.GradeUsed:= Ini.ReadBool('Section','GradeUsed',True);

        GradeLabel.Visible:= Lion.GradeUsed and RatiosSwitch.IsChecked;
        NSpinBox.Visible:= Lion.GradeUsed;
        LabelDash1.Visible:= Lion.GradeUsed;
        PSpinBox.Visible:= Lion.GradeUsed;
        LabelDash2.Visible:= Lion.GradeUsed;
        KSpinBox.Visible:= Lion.GradeUsed;
        Lion.InitLP;
        DoGradeUsed;


  NumBatches:= 1;
  ProductUOM:= 1;
  CalcBatch;
  Element   := False;
  Dry       := True;
  Lion.Metric    := False;
//  Lion.GradeUsed := False;
//  FUStoiBlend;
//  GetGroups;
end;

procedure TFormulateForm.RGridGetValue(Sender: TObject; const ACol,
  ARow: Integer; var Value: TValue);

begin
  if RGrid.RowCount > 0 then begin
      Lion.Seek(Lion.TheResCode(ARow));
      Case ACol of
        0 : Value:= Lion.Name;
        1 : Value:= Lion.Code;
        2 : Lion.Cost:= Value.AsVariant;
        3 : Lion.Price:= Value.AsVariant;
        4 : if Lion.LowerBound <= -Lion.BigNumber then Value := '-Inf' else
                                      Value:= Lion.LowerBound*Lion.InputScale;
        5 : if Lion.UpperBound >= Lion.BigNum then Value := 'Inf' else
                                      Value:= Lion.UpperBound*Lion.InputScale;
        6 : Value:= Lion.InputScale;
        7 : Value:= Lion.LowerPmt;
        8 : Value:= Lion.UpperPmt;
        9 : Value:= Lion.Basic;
      End;
  end;
end;

procedure TFormulateForm.RGridSetValue(Sender: TObject; const ACol,
  ARow: Integer; const Value: TValue);
begin
  if RGrid.RowCount > 0 then begin
    Lion.Seek(Lion.TheResCode(ARow));
    Case ACol of
      0 : Lion.Name:= Value.AsVariant;
      1 : Lion.Code:= Value.AsVariant;
      2 : Lion.Cost:= Value.AsVariant;
      3 : Lion.Price:= Value.AsVariant;
      4 : Lion.LowerBound:= Value.AsVariant/Lion.InputScale;
      5 : Lion.UpperBound:= Value.AsVariant/Lion.InputScale;
      6 : Lion.InputScale:= Value.AsVariant;
      7 : Lion.LowerPmt:= Value.AsVariant;
      8 : Lion.UpperPmt:= Value.AsVariant;
    End;
  end;
end;

procedure TFormulateForm.rKChange(Sender: TObject);
begin
  MatSysClick(Sender);
end;

procedure TFormulateForm.rNChange(Sender: TObject);
begin
  MatSysClick(Sender);
end;

procedure TFormulateForm.rPChange(Sender: TObject);
begin
  MatSysClick(Sender);
end;

procedure TFormulateForm.SaltOutTemperatureChange(Sender: TObject);
var
  Index  : Integer;
  Visible: Boolean;
  Value  : Double;
begin
  Index:= MatSys.ItemIndex;
  Visible:= Index in [2..6];
  SaltOutTemperature.Visible:= Visible;
  SaltOutLabel.Visible:= Visible;
  if Visible then begin
    Value:= TVA.Temp(rN.Value,rP.Value,rK.Value,Index);
    Value:= StrToFloat(SaltOutTemperature.Text);
    gN.Text:= FloatToStrF(TVA.N(Value),ffFixed,2,2);
    gP.Text:= FloatToStrF(TVA.P(Value),ffFixed,2,2);
    gK.Text:= FloatToStrF(TVA.K(Value),ffFixed,2,2);
  end;
end;

procedure TFormulateForm.SaveBtnClick(Sender: TObject);
      var
        Path  : String;

      begin
        Path:= GroupPath+Trim(GroupEdt.Text)+'.MPS';
        Memo1.Lines.Clear;
        Lion.SaveMPS(Trim(GroupEdt.Text),Memo1);
        SaveGroupXML(Memo1);
        Memo1.Lines.SaveToFile(Path);
      end;

procedure TFormulateForm.ClearMemos;
  begin
    InvoiceMemo.Lines.Clear;
    MixMemo.Lines.Clear;
    LabelMemo.Lines.Clear;
    FileMemo.Lines.Clear;
  end;

procedure TFormulateForm.SaveMPSClick(Sender: TObject);
      var
        Path  : String;

      begin
        Path:= GroupPath+Trim(GroupEdt.Text)+'.MPS';
        Memo1.Lines.Clear;
        Lion.SaveMPS(Trim(GroupEdt.Text),Memo1);
//        Memo1.Lines.SaveToFile(Path);

      end;

procedure TFormulateForm.StartClick(Sender: TObject);
begin
  if GroupName<>'' then SetUpGroup
                   else GroupEdit.Visible:= True;
//  LoadGroup(True);
end;

procedure TFormulateForm.SulfurCheckChange(Sender: TObject);
begin
  SetFilters;
end;

procedure TFormulateForm.SulfurCheckClick(Sender: TObject);
begin
  SetFilters;
end;

procedure TFormulateForm.SwTraceSwitch(Sender: TObject);
begin
  Lion.Trace:= SwTrace.IsChecked;
end;

procedure TFormulateForm.TabItem12Click(Sender: TObject);
begin
  LionDataModule.DataModule1.ActiveClientDataSet.Active:= False;
  LionDataModule.DataModule1.ActiveClientDataSet.Filter:= 'ITEMTYPE=1';
  LionDataModule.DataModule1.ActiveClientDataSet.Filtered:= True;
  BindSourceDBFrom.DataSource.DataSet:= LionDataModule.DataModule1.ActiveClientDataSet;
  LionDataModule.DataModule1.ActiveClientDataSet.Active:= True;
end;

procedure TFormulateForm.TabItem13Click(Sender: TObject);
var
  ACol : Integer;
  ARow : Integer;
begin
//  for ACol := 0 to AGrid.ColumnCount-1 do
//  for ARow := 0 to AGrid.RowCount-1 do
//    AGrid.Columns[ACol].UpdateCell(ARow);
end;

procedure TFormulateForm.TabItem14Click(Sender: TObject);
var
  ACol : Integer;
  ARow : Integer;
begin
//  for ACol := 0 to RGrid.ColumnCount-1 do
//  for ARow := 0 to RGrid.RowCount-1 do
//    RGrid.Columns[ACol].UpdateCell(ARow);
end;

procedure TFormulateForm.TabItem15Click(Sender: TObject);
var
  ACol : Integer;
  ARow : Integer;
begin
//  for ACol := 0 to BGrid.ColumnCount-1 do
//  for ARow := 0 to BGrid.RowCount-1 do
//    BGrid.Columns[ACol].UpdateCell(ARow);
end;

procedure TFormulateForm.TabItem5Click(Sender: TObject);
var
  ACol : Integer;
  ARow : Integer;
begin
  Lion.BuildInput;
  InputGrid.RowCount:= Lion.InputCount;
  for ACol := 0 to InputGrid.ColumnCount-1 do
  for ARow := 0 to InputGrid.RowCount-1 do
    InputGrid.Columns[ACol].UpdateCell(ARow);
  Lion.ActFirst;
end;

procedure TFormulateForm.TagBtnClick(Sender: TObject);
begin
  if not TagLayout.Visible then begin
    TagBtn.Text:= 'Mix';
//    TagLayOut.Visible:= True;
//    LabelMemo.Visible:= True;
    DoTag;
    TagLayOut.Visible:= True;
    MixMemo.Visible:= False;
  end else begin
    TagBtn.Text:= 'Tag';
//    LabelMemo.Visible:= False;
    DoMix;
    TagLayOut.Visible:= False;
    MixMemo.Visible:= True;
  end;
end;

procedure TFormulateForm.TagTabItemClick(Sender: TObject);
var
  s:string;
begin
  FileLayout    .Visible:= False;
//  CustomerLayout.Visible:= False;
  MixLayout     .Visible:= False;
  TagLayout     .Visible:= True;
  InvoiceLayout .Visible:= False;
  ItemizeLayout .Visible:= False;
  LabelMemo.Lines.Clear;
  DoTag;
end;

procedure TFormulateForm.wwAIDataGridKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
  AIName : String;
begin
  if Key=8 then begin
    AIName:= DataModule1.FromClientDataSet.FieldByName('AIName').AsString;
    if MessageDlg('Do you really want to delete '+AIName+'?',
     System.UITypes.TMsgDlgType.mtConfirmation,
      [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo],
       0, System.UITypes.TMsgDlgBtn.mbNo) = IDYes then begin
         DataModule1.FromClientDataSet.Delete;
       end;
  end;
end;

procedure TFormulateForm.wwDataGridItemCellChanged(Sender: TwwDataGrid);
var
  i : Integer;
begin
  i:= Sender.GetValue('FUSUOM').AsInteger;
end;

procedure TFormulateForm.XMLListBoxItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
var
  i,
  Row : Integer;
  Col : Integer;
begin
  FUSData.GetPFUS(DataModule1.DocumentsPath+Item.Text+'.XML');
  Lion.SetLengths(FUSData.NumAct,FUSData.NumRes);
  Lion.InitLP;
  FUSData.RewindAct;
  while not FUSData.EofAct do begin
    Lion.ActSeek(FUSData.ActCode);
    Lion.AddData(False,Lion.Location,FUSData.ActCode,FUSData.ActName,FUSdata.ActCost,FUSData.ActPrice,'');
//    Lion.ActCode    := FUSData.ActCode;
    Lion.ActName    := FUSData.ActName;
    Lion.ActCost    := FUSData.ActCost;
    Lion.ActPrice   := FUSData.ActPrice;
    Lion.ActScale   := FUSData.ActScale;
    Lion.ActLower   := FUSData.ActLower;
    Lion.ActUpper   := FUSData.ActUpper;
    Lion.ActLowerPmt:= FUSData.ActLowerPmt;
    Lion.ActUpperPmt:= FUSData.ActUpperPmt;
    FUSData.NextAct;
  end;
  if FUSData.EofAct then Lion.ActScale:= 1.0;

  FUSData.RewindRes;
  while not FUSData.EofRes do begin
    Lion.ResSeek(FUSData.ResCode);
    Lion.AddData(True,Lion.Location,FUSData.ResCode,FUSData.ResName,0,0,'');
//    Lion.ResCode    := FUSData.ResCode;
    Lion.ResName    := FUSData.ResName;
//    Lion.ResCost    := FUSData.ResCost;
//    Lion.ResPrice   := FUSData.ResPrice;
    Lion.ResScale   := FUSData.ResScale;
    Lion.ResLower   := FUSData.ResLower;
    Lion.ResUpper   := FUSData.ResUpper;
    Lion.ResLowerPmt:= FUSData.ResLowerPmt;
    Lion.ResUpperPmt:= FUSData.ResUpperPmt;
    FUSData.NextRes;
  end;
  Row:= 0;
  Col:= 0;
  FUSData.RewindAct;
  FUSData.RewindRes;
  while not FUSData.EofAct do begin
    Inc(Row);
    while not FUSData.EofRes do begin
      Inc(Col);
      Lion.B[Row-1,Col-1]:= FUSData.GetB(Row,Col);
      FUSData.NextRes;
    end;
    FUSData.RewindRes;
    Col:= 0;
    FUSData.NextAct;
  end;
  Lion.B[Lion.N,Lion.M]:= -1.0;

  Lion.BuildInput;
  InputGrid.RowCount:= Lion.rInputCount;

  AGrid.RowCount    := Lion.NumAct+1;
  RGrid.RowCount    := Lion.NumRes+1;
  BGrid.RowCount    := Lion.NumAct+1;
  for i := 0 to Lion.NumRes+1 do begin
    BGrid.AddObject(TColumn.Create(BGrid));
    if i = 0 then
      BGrid.Columns[i].Width:= 100 else
      BGrid.Columns[i].Width:= 60;
  end;
//  XMLListBox.Visible:= False;
end;

procedure TFormulateForm.xNewPasswordKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
   if (Key=13) then begin
     PWConfirm.SetFocus;
   end;

end;

procedure TFormulateForm.xPasswordKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
   if (Key=13) then begin
     if (xPassword.Text <>  PWCurrent.Text) then begin
                       xPassword.Text:= ''
     end else begin
      OKBtn.SetFocus;
      PWChangeBtn.Visible:= True;
     end;
   end;

end;

procedure TFormulateForm.BGridGetValue(Sender: TObject; const ACol,
  ARow: Integer; var Value: TValue);
//var
//  R : Double;
//  S : String;
begin
  if BGrid.ColumnCount > 0 then begin
    if ACol <= Lion.NumRes+1 then begin
      if ACol = 0 then begin
        Lion.rActNum:= ARow;
        if Lion.Seek(Lion.RowCode) then
          Value:= Lion.Name;
      end else begin
        Lion.Seek(Lion.TheResCode(ACol-1));
        if ACol <= Lion.NumRes+1 then begin
          Value:= Lion.GetBB(ARow,ACol-1)*Lion.InputScale;
          if ARow = 0 then begin
            BGrid.Columns[ACol].Header:= Lion.ColCode;
          end;
      end;
      end;
    end;
  end;
end;

procedure TFormulateForm.BGridSetValue(Sender: TObject; const ACol,
  ARow: Integer; const Value: TValue);
  var
  I : Integer;
  S : String;
  D : Double;
begin
  S:= Value.AsString;
  D:= S.ToDouble(S);
  if BGrid.ColumnCount > 0 then begin
    if ACol = 0 then begin
      if not Value.IsEmpty then
      Lion.RowCode:= Value.AsString;
    end else begin
      Lion.Seek(Lion.TheResCode(ACol-1));
      if not Value.IsEmpty then
      Lion.SetBB(ARow,ACol-1,D/100);   //Value.AsVariant/100.0); 5/2/2023
//      Lion.SetBB(ARow,ACol-1,Value.AsVariant/Lion.InputFactor(Lion.RowCode,Lion.ColCode));
    end;
  end;
end;

procedure TFormulateForm.BtnItemizeClick(Sender: TObject);
var
  ARow : Integer;
begin
//  CustomerLayout.Visible:= False;
  MixLayout     .Visible:= False;
  TagLayout     .Visible:= False;
  InvoiceLayout .Visible:= False;
  ItemizeLayout .Visible:= True;
  for ARow := 0 to BGrid.RowCount-1 do begin
    ItemizeGrid.Columns[0].UpdateCell(ARow);
    ItemizeGrid.Columns[1].UpdateCell(ARow);
    ItemizeGrid.Columns[2].UpdateCell(ARow);
  end;
end;

procedure TFormulateForm.BtnLoadClick(Sender: TObject);
var
  Name    : String;
  F       : TSearchRec;
  iO      : Integer;
begin
//  GroupEdit.Items.Clear;
//  iO:= FindFirst(GroupPath+'*.MPS',faAnyFile,F);
//  while (iO=0)  do begin
//    Name:= F.Name;
//    Name:= Copy(Name,0,Length(Name)-4);
//    if Length(Name)>0 then
//      GroupEdit.Items.Append(Name);
//    iO:= FindNext(F);
//  end;
//  FindClose(F);
  saltouttemp.Visible:= False;
  saltoutTF.Visible  := False;
  ShipBtn.Visible:= False;
  SaveBtn.Visible:= False;
  ImportBTN.Visible:= False;
  ExportBTN.Visible:= False;
  GroupEdit.Visible:= True;
end;

procedure TFormulateForm.BtnPrintClick(Sender: TObject);
begin
  DoMix;
  DoTag;
  DoFile;
  MixMemo.Lines.SaveToFile(DataModule1.DocumentsPath+'Mix.txt');
  LabelMemo.Lines.SaveToFile(DataModule1.DocumentsPath+'Label.txt');
  FileMemo.Lines.SaveToFile(DataModule1.DocumentsPath+'File.txt');
end;

procedure TFormulateForm.BtnSolveClick(Sender: TObject);
 begin
  OutPutTabControl.TabIndex:= 1;
  Lion.Solve;
  if Lion.Solved then begin
    SetSpinBox;
    RateSpinBox.Value:= Lion.Product*100.0;
//    AppRateEdit.Text:= RealToStrF((Lion.Product*100.0),ffFixed,6,2);
    DoMix;
    DoTag;
  end else begin
    MixMemo.Lines.Clear;
    LabelMemo.Lines.Clear;
    MixMemo.  Lines.Append('Solve Failed!');
    LabelMemo.Lines.Append('Solve Failed!');
  end;
 end;

procedure TFormulateForm.BuildBtnClick(Sender: TObject);
var
  NumRes: Integer;
  NumAct: Integer;
  Loc   : String;
  Item  : String;
  Name  : String;
  Bound : String;
  Cost  : Double;
  Price : Double;
  First : Boolean;


    procedure DoB;
      var
        Value   : Double;
        i,j,
        Row     : Integer;
        Col     : Integer;
        Fields  : String;
        Loc     : String;
        Nutrient: String;
        Values: String;

        Function Strip(InPut: String): String;
          begin
            Delete(InPut,1,1);
            Result:= Input;
          end;

      begin
        Row:=0;
        Fields:= 'LOC;ITEM';
//        Fields:= 'ITEM';
        Loc:= '001';
        Lion.RewindAct;
//        Row:= Lion.ActNum;
        while not Lion.EofAct do begin
          Row:= Lion.ActNum;
          if DataModule1.ItemClientDataSet.Locate(Fields,VarArrayOf([Loc,Lion.ActPtr[Row]]),[])
//          if DataModule1.FertClientDataSet.Locate(Fields,VarArrayOf([{Loc,}Lion.ActPtr[Row]]),[])
          then begin
            Lion.RewindRes;
            while not Lion.EofRes do begin
              Col:= Lion.ResNum;
              Nutrient:= UpperCase(Strip(Lion.ResPtr[Lion.ResNum]));
              if Nutrient='WT' then begin
                Lion.B[Row,Col]:= 1
              (*
                if DataModule1.ItemClientDataSet.FieldByName('FUSMixed').AsBoolean
                  then Lion.B[Row,Col]:= 1
                  else Lion.B[Row,Col]:= 0;
              *)
              end else begin
                Value:= DataModule1.MyFertClientDataSet.FieldByName(Nutrient).AsFloat;
                Lion.B[Row,Col]:= Value/100.0;///Lion.InputScale;
              end;
              Lion.NextRes;
            end;
          end;


          if Lion.ActPtr[Row]='PRODUCT' then begin
            for i := low(Lion.ResPtr) to High(Lion.ResPtr)-1 do begin
             Lion.B[Row,i]:= 0.0;
            end;
            Lion.B[High(Lion.ActPtr),High(Lion.ResPtr)]:= -1;
          end;
          Lion.NextAct;
        end;
      end;

  Procedure DoBuild(Build: Boolean);
    var
      S : String;
      i : Integer;

    procedure DoRes(Item : String);
      var
        Value    : Double;
        Found,
        NotFound : Integer;
      begin
        NotFound:= 0;
        Found:= 0;
        Value:= DataModule1.MyFertClientDataSet.FieldByName(Item).AsFloat;
//        Value:= DataModule1.FertClientDataSet.FieldByName(Item).AsFloat;
         if Value <> 0.0 then begin
          if Build then begin
            Lion.AddData(True,Loc,Item,Item,0,0,Bound);
          end else begin
            if DataModule1.TagClientDataSet.Locate('Code',VarArrayOf([Item]),[{loCaseInsensitive}])
              then begin
                Inc(Found);
                DataModule1.TagClientDataSet.Edit;
                DataModule1.TagClientDataSet.FieldByName('ActiveIngredient').AsBoolean:= True;
                DataModule1.TagClientDataSet.Post;
              end else begin
                Inc(NotFound);
              end;
          end;
        end;
      end;

    begin
      DataModule1.ItemClientDataSet.First;
      while not DataModule1.ItemClientDataSet.Eof do begin
        if DataModule1.ItemClientDataSet.FieldByName('HAZARDOUS').AsBoolean then begin
          Loc := DataModule1.ItemClientDataSet.FieldByName('LOC').AsString;
          Item:= DataModule1.ItemClientDataSet.FieldByName('Item').AsString;
          Name:= DataModule1.ItemClientDataSet.FieldByName('FUSName').AsString;
          Cost:= DataModule1.ItemClientDataSet.FieldByName('FUSCost').AsFloat;
          Price:= DataModule1.ItemClientDataSet.FieldByName('Price1').AsFloat;
          if Build then Lion.AddData(False,Loc,Item,Name,Cost,Price,Bound) else
             Inc(NumAct);

          DoRes('N');
          DoRes('AmmN');
          DoRes('NitN');
          DoRes('UreaN');
          DoRes('OtherN');
          DoRes('WinN');
          DoRes('COATN');
//          DoRes('OCCLUDEDN');
          DoRes('SlowN');
          DoRes('P');
          DoRes('K');
          DoRes('Ca');
          DoRes('Mg');
          DoRes('S');
          DoRes('B');
          DoRes('Co');
          DoRes('Cu');
          DoRes('Fe');
          DoRes('Mn');
          DoRes('Mo');
          DoRes('Zn');
          DoRes('Cl');

          DoRes('WSCa');
          DoRes('WSMg');
          DoRes('WSS');
          DoRes('WSB');
          DoRes('WSCo');
          DoRes('WSCu');
          DoRes('WSFe');
          DoRes('WSMn');
          DoRes('WSMo');
          DoRes('WSZn');

          DoRes('CHCa');
          DoRes('CHMg');
          DoRes('CHS');
          DoRes('CHB');
          DoRes('CHCo');
          DoRes('CHCu');
          DoRes('CHFe');
          DoRes('CHMn');
          DoRes('CHMo');
          DoRes('CHZn');
        end;
        DataModule1.ItemClientDataSet.Next;
      end;
    end;

  begin

//    DataModule1.ItemClientDataSet.DisableControls;
  //  Set NumRes and NumAct
    NumAct:= 0;
    NumRes:= 0;
//  Clear all restrictions used
    DataModule1.TagClientDataSet.First;
    while not DataModule1.TagClientDataSet.Eof do begin
      DataModule1.TagClientDataSet.Edit;
      DataModule1.TagClientDataSet.FieldByName('ActiveIngredient').AsBoolean:= False;
      DataModule1.TagClientDataSet.Post;
      DataModule1.TagClientDataSet.Next;
    end;
    DoBuild(False);
//            Lion.B[High(Lion.ActPtr),High(Lion.ResPtr)]:= -1;
    SetActRes(False);
            Lion.B[High(Lion.ActPtr),High(Lion.ResPtr)]:= -1;
    Lion.InitLP;
    SetActRes(True);
    DoBuild(True);
            Lion.B[High(Lion.ActPtr),High(Lion.ResPtr)]:= -1;
    DoB;
    UpdateGrids;
    UpdateNames;
//    DataModule1.ItemClientDataSet.EnableControls;
  end;

procedure TFormulateForm.ComboEdit1ClosePopup(Sender: TObject);
begin
  DataModule1.TagClientDataSet.Filtered:= False;
  case ComboEdit1.ItemIndex of
    0 : DataModule1.TagClientDataSet.Filter:= 'Language=''EN''';
    1 : DataModule1.TagClientDataSet.Filter:= 'Language=''FR''';
    2 : DataModule1.TagClientDataSet.Filter:= 'Language=''ES''';
    3 : DataModule1.TagClientDataSet.Filter:= 'Language=''DE''';
    4 : DataModule1.TagClientDataSet.Filter:= 'Language=''RU''';
  end;
  DataModule1.TagClientDataSet.Filtered:= True;
  DataModule1.TagClientDataSet.First;
  LabelMemo.Lines.Clear;
  if Lion.Iteration>0 then DoTag;;
end;

procedure TFormulateForm.ConvertBtnClick(Sender: TObject);
    VAR
       ActMin,
       ActMax,
       ResMin,
       ResMax,
       I      : INTEGER;
       Row    : Integer;
       Col    : Integer;
       Factor : Double;
       S      : String;

    BEGIN  {Input Transformation}

(*
         for Row := ActMin to ActMax do begin
           for Col := ResMin to ResMax do begin
             Factor:= {ActRes.Items[ActPtr[Row]].InputScale/}ActRes.Items[ResPtr[Col]].InputScale;
             B[Row,Col]:= B[Row,Col]*Factor;
           end;
         end;
*)
//             for Row := Low(ActPtr) to High(ActPtr) do begin
//               for Col := Low(ResPtr) to High(ResPtr) do begin
//                 Factor:= ActRes.Items[ActPtr[Row]].InputScale/ActRes.Items[ResPtr[Col]].InputScale;
//                 B[Row,Col]:= B[Row,Col]*Factor;
//               end;
//             end;
       ActMin:= Low (Lion.ActPtr);
       ActMax:= High(Lion.ActPtr);
       ResMin:= Low (Lion.ResPtr);
       ResMax:= High(Lion.ResPtr);
       with Lion do begin
         for Row := ActMin to ActMax do begin
           Factor:= ActRes.Items[ActPtr[Row]].InputScale/ActRes.Items[ResPtr[Row]].InputScale;
           ActRes.Items[ActPtr[Row]].Cost:= ActRes.Items[ActPtr[Row]].Cost*Factor;
           ActRes.Items[ActPtr[Row]].Price:= ActRes.Items[ActPtr[Row]].Price*Factor;
           ActRes.Items[ActPtr[Row]].LowerBound:= ActRes.Items[ActPtr[Row]].LowerBound*Factor;
           ActRes.Items[ActPtr[Row]].UpperBound:= ActRes.Items[ActPtr[Row]].UpperBound*Factor;

           for Col := ResMin to ResMax do begin
             Factor:= ActRes.Items[ActPtr[Row]].InputScale/ActRes.Items[ResPtr[Col]].InputScale;

//             ActRes.Items[ResPtr[Col]].LowerBound:= ActRes.Items[ResPtr[Col]].LowerBound*Factor;
//             ActRes.Items[ResPtr[Col]].UpperBound:= ActRes.Items[ResPtr[Col]].UpperBound*Factor;

             B[Row,Col]:= B[Row,Col]*Factor;
           end;
         end;
         S:= GroupName;
//         S:= ExtractFileName(S);
         Insert('9',s,Length(S)-3);
         Memo1.Lines.Clear;
         SaveMPS('',Memo1);
         Memo1.Lines.SaveToFile(S);
       end;
    END { InputTransform };

procedure TFormulateForm.Button2Click(Sender: TObject);
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
            Loc:= Lion.Location;
            sGroup:=Lion.Problem;
            xEdit:= Locate(xFields,VarArrayOf([LOC,sGroup]),[]);
            if xEdit then begin
              Edit;
              FieldByName('XML').Value:= Memo1.Lines.Text;
              FieldByName('LOC').AsString:= Lion.Location;
              post;
            end else begin
              insert;
              FieldByName('Loc')  .AsString:= Lion.Location;
              FieldByName('Group').AsString:= Lion.Problem;
              FieldByName('XML')  .AsString:= Memo1.Text;
              post;
            end;
            Close;
          end;
        end;

begin
//  SaveToGROUP;
  Memo1.Lines.Clear;
  Lion.SaveMPS(Trim(GroupEdt.Text),Memo1);
  SaveToGROUP;
  Memo1.Lines.SaveToFile(GroupPath+Group+'.MPS');
end;

procedure TFormulateForm.Button3Click(Sender: TObject);
var
  Loc,
  XMLPath,
  xName,
  sGroup,
  xFields: String;
begin
    XMLPath:= TPath.GetSharedDocumentsPath + PathDelim + 'Form-U-Share' + PathDelim + 'iBlend' + PathDelim +
            'Company' + PathDelim;

//  DatahXML:= Module1.GroupsClientDataSet.Open;
  xFields:= 'LOC;GROUP';
  Loc:= Lion.Location;
  with DataModule1.GroupsClientDataSet do begin
    Open;
    Filtered:= False;
    Filter  := 'Loc='+Loc;
    Filtered:= True;
    First;
    while not eof do begin
      FUSData.GetPFUS(XMLPath);
      sGroup:=FieldByName('XML').AsString;
      Next;
    end;
  end;
end;

procedure TFormulateForm.Button4Click(Sender: TObject);
begin
  NewPassword.Visible:= not NewPassword.Visible;
  xNewPassword.Visible:= not xNewPassword.Visible;
  Confirm.Visible:= not Confirm.Visible;
  PWConfirm.Visible:= not PWConfirm.Visible;
end;

procedure TFormulateForm.PWChangeBtnClick(Sender: TObject);
var
  s : string;
begin
  NewPassword.Visible:= True;
  xNewPassword.SetFocus;
  xNewPassword.Visible:= True;
  Confirm.Visible:= True;
//  Confirm.Visible:= True;
(*
  with CLionDataModule.DataModule1.LogonClientDataSet do begin
    Active:= True;
    First;
    UserComboBox.Clear;
    while not Eof do begin
      s:= FieldByName('UName').AsString;
      UserComboBox.Items.Append(s);
      Next;
    end;
  end;
  *)
end;

procedure TFormulateForm.PWConfirmKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
    if (Key=13) then begin
      if (xNewPassword=PWConfirm) then  begin
//      change pw
      end else begin

      end;

    end;
end;

procedure TFormulateForm.DoneInsColClick(Sender: TObject);
var
  Nut : String;

  ACol,
  ARow,
  i,
  ii  : Integer;
begin
  wwDataGrid2.Visible:= False;
  DoneInsCol.Visible := False;
  Nut:= DataModule1.TagClientDataSet.FieldByName('code').AsString;
  Lion.InsCol(BGrid.Col,Nut);
  Lion.BuildInput;
  for i := 0 to Lion.NumRes-1 do begin
    BGrid.AddObject(TColumn.Create(BGrid));
    if i = 0 then
      BGrid.Columns[i].Width:= 100 else
      BGrid.Columns[i].Width:= 60;
  end;

  for ACol := 0 to BGrid.ColumnCount-1 do
  for ARow := 0 to BGrid.RowCount-1 do
    BGrid.Columns[ACol].UpdateCell(ARow);

  for ACol := 0 to AGrid.ColumnCount-1 do
  for ARow := 0 to AGrid.RowCount-1 do
    AGrid.Columns[ACol].UpdateCell(ARow);

  for ACol := 0 to RGrid.ColumnCount-1 do
  for ARow := 0 to RGrid.RowCount-1 do
    RGrid.Columns[ACol].UpdateCell(ARow);

  for ACol := 0 to InputGrid.ColumnCount-1 do
  for ARow := 0 to InputGrid.RowCount-1 do
    InputGrid.Columns[ACol].UpdateCell(ARow);
//  UpdateGrids;
end;

procedure TFormulateForm.DoneInsRow2Click(Sender: TObject);
var
  Scale : Double;
  xName,
  Item : String;
  ii,
  ACol,ARow : Integer;
begin
  wwDataGrid1.Visible:= False;
  DoneInsRow2.Visible:= False;
  Item:= DataModule1.ItemClientDataSet.FieldByName('Item').AsString;
//  Scale:= Lion.InputScale;
//  xName:= Lion.Name;

  xName:= DataModule1.ItemClientDataSet.FieldByName('FUSName').AsString;
  Scale:= DataModule1.ItemClientDataSet.FieldByName('FUSLBS').AsFloat;
  BindSourceDBX.DataSource.DataSet:= nil;
  Lion.InsRow(BGrid.Row,Item,xName,Scale);
(* *)
  ii:= BGrid.RowCount;
  Inc(ii);
  BGrid.RowCount:= ii;

  ii:= AGrid.RowCount;
  Inc(ii);
  AGrid.RowCount:= ii;
(* *)
  for ACol := 0 to BGrid.ColumnCount-1 do
  for ARow := 0 to BGrid.RowCount-1 do
    BGrid.Columns[ACol].UpdateCell(ARow);

  for ACol := 0 to AGrid.ColumnCount-1 do
  for ARow := 0 to AGrid.RowCount-1 do
    AGrid.Columns[ACol].UpdateCell(ARow);

  for ACol := 0 to RGrid.ColumnCount-1 do
  for ARow := 0 to RGrid.RowCount-1 do
    RGrid.Columns[ACol].UpdateCell(ARow);

  for ACol := 0 to InputGrid.ColumnCount-1 do
  for ARow := 0 to InputGrid.RowCount-1 do
    InputGrid.Columns[ACol].UpdateCell(ARow);
(* *)
 end;

procedure TFormulateForm.ImportBTNClick(Sender: TObject);
begin
   Lion.XMLGroup:= True;
   GetGroups;
   Lion.XMLGroup:= False;
end;

procedure TFormulateForm.InputGridEditingDone(Sender: TObject; const ACol,
  ARow: Integer);
var
  C : Integer;
  I : Integer;
begin
  C:= ACol;
  I:= ARow;
end;

procedure TFormulateForm.InputGridGetValue(Sender: TObject; const ACol,
  ARow: Integer; var Value: TValue);
var
  R,
  Product : Double;
  S       : String;
begin
  if InputGrid.RowCount > 0 then begin
    if Lion.Seek(Lion.InputCode(ARow)) then begin
      Product:= Lion.Product;
      if Lion.LowerPmt then begin
        Case ACol of
            0 : Value:= Lion.Name;
            1 : Value:= '>';
            2 : Value:= Lion.LowerBound*Lion.InputScale;
            3 : Value:= ((Lion.Level/Product)*100.0);
        End;
      end else
      if Lion.UpperPmt then begin
        Case ACol of
            0 : Value:= Lion.Name;
            1 : Value:= '<';
            2 : Value:= Lion.UpperBound*Lion.InputScale;
            3 : Value:= ((Lion.Level/Product)*100.0);
        End;
      end;
    end;
  end;
end;

procedure TFormulateForm.InputGridSetValue(Sender: TObject; const ACol,
  ARow: Integer; const Value: TValue);
var
  S: String;
begin
  S:= Lion.InputCode(ARow);
  if Lion.Seek(S) then begin
    if Lion.LowerPmt then begin
      case ACol of
        0 : ;
        1 : ;
        2 : begin
//              Lion.Seek(S);
              Lion.LowerBound:= Value.AsVariant/Lion.InputScale;
            end;
        3 : ;
      end;
    end;
    if Lion.UpperPmt then begin
      case ACol of
        0 : ;
        1 : ;
        2 : Lion.UpperBound:= Value.AsVariant/Lion.InputScale;
        3 : ;
      end;
    end;
  end;

{$IFDEF autocalc }
  OutPutTabControl.TabIndex:= 1;
  Lion.Solve;
  if Lion.Solved then begin
    SetSpinBox;
    RateSpinBox.Value:= Lion.Product*100.0;
//    AppRateEdit.Text:= RealToStrF((Lion.Product*100.0),ffFixed,6,2);
    DoMix;
    DoTag;
  end else begin
    MixMemo.Lines.Clear;
    LabelMemo.Lines.Clear;
    MixMemo.  Lines.Append('Solve Failed!');
    LabelMemo.Lines.Append('Solve Failed!');
  end;
{$ENDIF}
end;

procedure TFormulateForm.InsertColClick(Sender: TObject);
var
  Nut : String;
begin
  wwDataGrid2.Visible:= True;
  DoneInsCol.Visible:= True;

  DataModule1.TagClientDataSet.Active:= False;
  BindSourceDBX.DataSource.DataSet:= DataModule1.TagClientDataSet;
  DataModule1.TagClientDataSet.Active:= True;

  wwDataGrid2.DataSource:= BindSourceDBX;
end;

procedure TFormulateForm.InsertColumnClick(Sender: TObject);
begin
  ShowMessage('Insert Column');
end;

procedure TFormulateForm.InsertRowClick(Sender: TObject);
var
  Item: String;
  NumRows : Integer;
begin
  wwDataGrid1.Visible:= True;
  DoneInsRow2.Visible:= True;
//  NumRows:= BGrid.RowCount;
//  Inc(NumRows);
//  BGrid.RowCount:= NumRows;
//  DataModule1.ItemClientDataSet.Active:= False;
  BindSourceDBX.DataSource.DataSet:= DataModule1.ItemClientDataSet;
//  DataModule1.ItemClientDataSet.Active:= True;
//  Item:=DataModule1.ItemClientDataSet.FieldByName('ITEM').AsString;
//  wwDataGrid1.Visible:= False;
//  Lion.InsRow(BGrid.Row,Item);
end;

procedure TFormulateForm.InvoiceDataTabItemClick(Sender: TObject);
begin
  FileLayout    .Visible:= False;
//  CustomerLayout.Visible:= False;
  MixLayout     .Visible:= False;
  TagLayout     .Visible:= False;
  InvoiceLayout .Visible:= True;
  ItemizeLayout .Visible:= False;
  DoInvoice;
end;

procedure TFormulateForm.KSpinBoxChange(Sender: TObject);
begin
  SpinBox('K');
end;

procedure TFormulateForm.AcresEditKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key=13 then begin
    CalcBatch;
  end;
end;

procedure TFormulateForm.ActGridSetValue(Sender: TObject; const ACol,
  ARow: Integer; const Value: TValue);
begin
  if AGrid.RowCount > 0 then begin
    Lion.Seek(Lion.TheActCode(ARow));
    Case ACol of
      0 : Lion.Name:= Value.AsVariant;
      1 : Lion.Code:= Value.AsVariant;
      2 : Lion.Build:= Value.AsVariant;
    End;
  end;
end;

procedure TFormulateForm.AddSourceBtnClick(Sender: TObject);
begin
  wwDataGridFrom.Visible:= not wwDataGridFrom.Visible;
  wwAIDataGrid.Visible:= not wwAIDataGrid.Visible;
  ActiveIngreidentPanel.Visible:= not ActiveIngreidentPanel.Visible;
end;

procedure TFormulateForm.AGridGetValue(Sender: TObject; const ACol,
  ARow: Integer; var Value: TValue);
var
  p : double;
  i : double;
begin
  if AGrid.RowCount > 0 then begin
    if Lion.Seek(Lion.TheActCode(ARow)) then begin
      Case ACol of
        0 : Value:= Lion.Name;
        1 : Value:= Lion.Code;
        2 : Value:= Lion.Cost;//*Lion.InputScale;
        3 : Value:= Lion.Price;//*Lion.InputScale;
        4 : if Lion.LowerBound <= -(Lion.BigNum{*Lion.InputScale}) then
              Value := '-Inf' else
              Value:= Lion.LowerBound;//*Lion.InputScale;
        5 : if Lion.UpperBound >= Lion.BigNum then
              Value := 'Inf' else
              Value:= Lion.UpperBound;//*Lion.InputScale;
        6 : Value:= Lion.InputScale;
        7 : Value:= Lion.LowerPmt;
        8 : Value:= Lion.UpperPmt;
        9 : Value:= Lion.Basic;
      End;
    end;
  end;
end;

procedure TFormulateForm.AGridSetValue(Sender: TObject; const ACol,
  ARow: Integer; const Value: TValue);
begin
  if AGrid.RowCount > 0 then begin
    Lion.Seek(Lion.TheActCode(ARow));
    Case ACol of
      0 : Lion.Name:= Value.AsVariant;
      1 : Lion.Code:= Value.AsVariant;
      2 : Lion.Cost := Value.AsVariant;//Lion.InputScale;
      3 : Lion.Price:= Value.AsVariant;//Lion.InputScale;
      4 : Lion.LowerBound:= Value.AsVariant;//Lion.InputScale;
      5 : Lion.UpperBound:= Value.AsVariant;//Lion.InputScale;
      6 : Lion.InputScale:= Value.AsVariant;
      7 : Lion.LowerPmt:= Value.AsVariant;
      8 : Lion.UpperPmt:= Value.AsVariant;
    End;
  end;
end;

procedure TFormulateForm.AIGridCellClick(const Column: TColumn;
  const Row: Integer);
begin
//  AIGrid.Columns[0].g
end;

procedure TFormulateForm.AIGridSelectCell(Sender: TObject; const ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  CanSelect:= not CanSelect;
end;

procedure TFormulateForm.AllCheckBoxClick(Sender: TObject);
begin
//  DataModule1.DADDClientDataSet.Filtered:= not DataModule1.DADDClientDataSet.Filtered;
end;

procedure TFormulateForm.ALLFilter2Click(Sender: TObject);
begin
  SetFilters;
end;

procedure TFormulateForm.AllFormFilter2Change(Sender: TObject);
begin
    SetFilters;
end;

procedure TFormulateForm.AllFormFilter2Click(Sender: TObject);
begin
  SetFilters;
end;

procedure TFormulateForm.AllRadioButtonClick(Sender: TObject);
begin
  SetItemFilters;
end;

procedure TFormulateForm.CheckBox1Change(Sender: TObject);
begin
  PanelDetail.Visible:= CheckBox1.IsChecked;
end;

procedure TFormulateForm.CheckBox2Change(Sender: TObject);
begin
  PanelSecondary.Visible:= CheckBox2.IsChecked;
end;

procedure TFormulateForm.CheckBox3Change(Sender: TObject);
begin
  PanelMinor.Visible:= CheckBox3.IsChecked;
end;

procedure TFormulateForm.CheckBox4Change(Sender: TObject);
begin
  PanelNonNutrient.Visible:= CheckBox4.IsChecked;
end;

procedure TFormulateForm.ChelateCheckChange(Sender: TObject);
begin
  SetFilters;
end;

procedure TFormulateForm.ChelateCheckClick(Sender: TObject);
begin
  SetFilters;
end;

procedure TFormulateForm.ChemRadioButtonClick(Sender: TObject);
begin
  SetItemFilters;
end;

procedure TFormulateForm.ClearBtnClick(Sender: TObject);
begin
  with DataModule1.ItemClientDataSet do begin
    Open;
    DisableControls;
    First;
    while not Eof do begin
      Edit;
      FieldByName('HAZARDOUS').AsBoolean:= False;
      FieldByName('REGULATED').AsBoolean:= False;
      Post;
      Next;
    end;
    EnableControls;
    Close;
    Open;
  end;
end;

procedure TFormulateForm.RadioButton1Click(Sender: TObject);
begin
  BindSourceDBX.DataSource.DataSet:= LionDataModule.DataModule1.UnitsClientDataSet;
  LionDataModule.DataModule1.UnitsClientDataSet.Active:= True;
end;

procedure TFormulateForm.RadioButton2Click(Sender: TObject);
begin
  BindSourceDBX.DataSource.DataSet:= LionDataModule.DataModule1.FertClientDataSet;
  LionDataModule.DataModule1.FertClientDataSet.Active:= True;
end;

procedure TFormulateForm.RadioButton3Click(Sender: TObject);
begin
  DataModule1.TagClientDataSet.Active:= False;
  BindSourceDBX.DataSource.DataSet:= DataModule1.TagClientDataSet;
  DataModule1.TagClientDataSet.Active:= True;
end;

procedure TFormulateForm.RadioButton4Click(Sender: TObject);
begin
  BindSourceDBX.DataSource.DataSet:= LionDataModule.DataModule1.MatGroups;
  LionDataModule.DataModule1.MatGroups.Active:= True;
end;

procedure TFormulateForm.RadioButton5Click(Sender: TObject);
begin
  BindSourceDBX.DataSource.DataSet:= LionDataModule.DataModule1.MyFertClientDataSet;
  LionDataModule.DataModule1.MyFertClientDataSet.Active:= True;
end;

procedure TFormulateForm.RadioButton6Click(Sender: TObject);
begin
  BindSourceDBX.DataSource.DataSet:= LionDataModule.DataModule1.MySourceClientDataSet;
  LionDataModule.DataModule1.MySourceClientDataSet.Active:= True;
end;

procedure TFormulateForm.RadioButton7Click(Sender: TObject);
begin
  BindSourceDBX.DataSource.DataSet:= LionDataModule.DataModule1.ItemClientDataSet;
  LionDataModule.DataModule1.ItemClientDataSet.Active:= True;
end;

procedure TFormulateForm.RadioButton8Click(Sender: TObject);
begin
  BindSourceDBX.DataSource.DataSet:= LionDataModule.DataModule1.FromClientDataSet;
  LionDataModule.DataModule1.FromClientDataSet.Active:= True;
end;

procedure TFormulateForm.RadioButton9Click(Sender: TObject);
begin
  BindSourceDBX.DataSource.DataSet:= LionDataModule.DataModule1.ActiveClientDataSet;
  LionDataModule.DataModule1.ActiveClientDataSet.Active:= True;
end;

procedure TFormulateForm.RateSpinBoxKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key=13 then begin
    CalcBatch;
  end;
end;

procedure TFormulateForm.RatiosSwitchSwitch(Sender: TObject);
begin
  GradeLabel.Visible:= RatiosSwitch.IsChecked;
  LabelDash1.Visible:= RatiosSwitch.IsChecked;
  LabelDash2.Visible:= RatiosSwitch.IsChecked;
end;

Initialization

{$IFDEF Advanced}
  Lion:= TADV.Create;
{$ELSE}
  Lion:= TMPS.Create;
{$ENDIF}
  FUSData:= TFUS.Create;
end.
