program ViaMensseger;

uses
  Vcl.Forms,
  Windows,
  uTInject.ConfigCEF,
  iniFiles,
  SysUtils,
  u_principal in 'u_principal.pas' {frmPrincipal};

{$R *.res}

begin
  If not GlobalCEFApp.StartMainProcess then
     Exit;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ViaMensseger';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;

end.
