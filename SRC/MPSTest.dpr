program MPSTest;

uses
  System.StartUpCopy,
  FMX.Forms,
  MPSTestUnit in 'MPSTestUnit.pas' {Form26};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm26, Form26);
  Application.Run;
end.
