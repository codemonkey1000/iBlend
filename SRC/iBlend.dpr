program iBlend;

uses
  {$IFDEF MSWindows}
  MidasLib,
  {$ENDIF }
  System.StartUpCopy,
  FMX.Forms,
  LionSolve in 'LionSolve.pas',
  MPS in 'MPS.pas',
  LionDataModule in 'LionDataModule.pas' {DataModule1: TDataModule},
  LionBlendu in 'LionBlendu.pas' {FormulateForm},
  TVASaltOutTempUnit in 'TVASaltOutTempUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFormulateForm, FormulateForm);
  Application.Run;
end.
