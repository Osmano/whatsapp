unit UMae;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TfrmMae = class(TForm)
    PnlMenuRetratil: TPanel;
    SBBtnMenu: TSpeedButton;
    DBGrid1: TDBGrid;
    PnlMenuVertical: TPanel;
    SBConfiguracoes: TSpeedButton;
    SBPedidos: TSpeedButton;
    procedure SBConfiguracoesClick(Sender: TObject);
    procedure SBBtnMenuClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMae: TfrmMae;

implementation
uses u_principal;

{$R *.dfm}

procedure TfrmMae.SBConfiguracoesClick(Sender: TObject);
begin
  try
    FrmConfiguracoes:= TFrmConfiguracoes.Create(Application);
    FrmConfiguracoes.showmodal;
  finally
    FrmConfiguracoes.free;
  end;

end;




procedure TfrmMae.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   application.Terminate;
end;

procedure TfrmMae.FormCreate(Sender: TObject);
begin
//  DoubleBuffered := True;
end;

procedure TfrmMae.FormShow(Sender: TObject);
begin
 SBBtnMenuClick(self);

end;

procedure TfrmMae.SBBtnMenuClick(Sender: TObject);
begin
  if PnlMenuRetratil.Width < 300 then
     begin
        //menuvertical
      if PnlMenuVertical.Height < PnlMenuRetratil.Height - 65 then
         while PnlMenuVertical.Height < PnlMenuRetratil.Height - 65 do
           begin
             PnlMenuVertical.Height := PnlMenuVertical.Height +2;
           end;
       while PnlMenuRetratil.Width < 300 do
         begin
            PnlMenuRetratil.Width := PnlMenuRetratil.Width + 5;
            SBBtnMenu.Caption:='Menu';
            PnlMenuRetratil.Refresh;
         end;
     end
     else
       begin
         if PnlMenuVertical.Height > 50 then
            while PnlMenuVertical.Height > 0 do
              begin
                PnlMenuVertical.Height := PnlMenuVertical.Height -1;
              end;

         while PnlMenuRetratil.Width > 50 do
           begin
              PnlMenuRetratil.Width := PnlMenuRetratil.Width - 5 ;
              SBBtnMenu.Caption:='';
              PnlMenuRetratil.Refresh;
           end;

       end;

end;



end.


