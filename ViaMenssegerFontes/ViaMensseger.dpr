program ViaMensseger;

uses
  Vcl.Forms,
  Windows,
  Dialogs,
  uTInject.ConfigCEF,
  iniFiles,
  SysUtils,
  u_principal in 'u_principal.pas' {frmPrincipal},
  UConfiguracao in 'UConfiguracao.pas' {frmConfig};

{$R *.res}


begin
     If not GlobalCEFApp.StartMainProcess then
          Exit;

     Application.Initialize;
     Application.MainFormOnTaskbar := True;
     Application.Title := 'ViaMensseger - Gerenciador de Mensagens';
     Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmConfig, frmConfig);
  Application.Run;

end.
