unit UConfiguracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmConfig = class(TForm)
    CBDepartamento: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    CBBanco: TComboBox;
    CBServidor: TComboBox;
    CBPorta: TComboBox;
    BBLerConfiguracoes: TBitBtn;
    BBAplicarConfiguracoes: TBitBtn;
    procedure BBLerConfiguracoesClick(Sender: TObject);
    procedure BBAplicarConfiguracoesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure preencherCombos;
    procedure salvarCombos;
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmConfig: TfrmConfig;
 var vgconectar:boolean;
implementation

{$R *.dfm}
uses inifiles;


procedure TfrmConfig.BBAplicarConfiguracoesClick(Sender: TObject);
begin
  salvarCombos;
  vgconectar:=true;
  close;
end;

procedure TfrmConfig.FormShow(Sender: TObject);
begin
  preencherCombos;
end;

procedure TfrmConfig.preencherCombos();
var
  Ini: TIniFile;
  vldepartamentos, vlbancos, vlservidores, vlportas :TStringList;
  i:integer;
begin
   try
    Ini := TIniFile.Create(extractfilepath(application.exename)+'whatsappconfig.ini');

    CBDepartamento.Clear;
    vldepartamentos := TStringList.Create;
    vldepartamentos.Delimiter := ',';
    vldepartamentos.DelimitedText := Ini.ReadString('DEPARTAMENTO', 'TODOS', 'FINANCEIRO');
    for i := 0 to vldepartamentos.Count - 1 do
      CBDepartamento.items.Add(vldepartamentos[i]);
    vldepartamentos.free;

    CBBanco.clear;
    vlbancos := TStringList.Create;
    vlbancos.Delimiter := ',';
    vlbancos.DelimitedText := Ini.ReadString('BANCO', 'TODOS', 'postgres');
    for i := 0 to vlbancos.Count - 1 do
      CBBanco.items.Add(vlbancos[i]);
    vlbancos.free;

    CBServidor.clear;
    vlservidores := TStringList.Create;
    vlservidores.Delimiter := ',';
    vlservidores.DelimitedText := Ini.ReadString('SERVIDOR', 'TODOS', '127.0.0.1');
    for i := 0 to vlservidores.Count - 1 do
      CBServidor.items.Add(vlservidores[i]);
    vlservidores.free;

    CBPorta.clear;
    vlportas := TStringList.Create;
    vlportas.Delimiter := ',';
    vlportas.DelimitedText := Ini.ReadString('PORTA', 'TODOS', '5432');
    for i := 0 to vlportas.Count - 1 do
      CBPorta.items.Add(vlportas[i]);
    vlportas.free;

    CBBanco.ItemIndex := CBBanco.Items.IndexOf(Ini.ReadString('BANCO','SELECIONADO', ''));
    CBServidor.ItemIndex := CBServidor.Items.IndexOf(Ini.ReadString('SERVIDOR','SELECIONADO', ''));
    CBPorta.ItemIndex := CBPorta.Items.IndexOf(Ini.ReadString('PORTA','SELECIONADO', ''));
    CBDepartamento.ItemIndex := CBDepartamento.Items.IndexOf(Ini.ReadString('DEPARTAMENTO','SELECIONADO', ''));

   finally
     ini.free;
   end;

end;

procedure TfrmConfig.salvarCombos();
var
  Ini: TIniFile;
  vldepartamentos, vlbancos, vlservidores, vlportas :string;
  i:integer;
begin
   try
    Ini := TIniFile.Create(extractfilepath(application.exename)+'whatsappconfig.ini');
    vldepartamentos := '';

    if CBdepartamento.Items.IndexOf(CBdepartamento.text)< 0 then
    CBdepartamento.items.Add(CBdepartamento.text);
    Ini.WriteString('DEPARTAMENTO', 'TODOS', CBdepartamento.items.CommaText);
    Ini.WriteString('DEPARTAMENTO', 'SELECIONADO', CBDepartamento.Text);

    if CBbanco.Items.IndexOf(CBbanco.text)< 0 then
    CBbanco.items.Add(CBbanco.text);
    Ini.WriteString('BANCO', 'TODOS', '');
    Ini.WriteString('BANCO', 'TODOS', CBBanco.items.CommaText);
    Ini.WriteString('BANCO', 'SELECIONADO', CBBanco.Text);

    if CBservidor.Items.IndexOf(CBservidor.text)< 0 then
    CBservidor.items.Add(CBservidor.text);
    Ini.WriteString('SERVIDOR', 'TODOS', '');
    Ini.WriteString('SERVIDOR', 'TODOS', CBServidor.items.CommaText);
    Ini.WriteString('SERVIDOR', 'SELECIONADO', CBservidor.Text);

    if CBporta.Items.IndexOf(CBporta.text)< 0 then
    CBporta.items.Add(CBporta.text);
    Ini.WriteString('PORTA', 'TODOS','');
    Ini.WriteString('PORTA', 'TODOS', CBPorta.items.CommaText);
    Ini.WriteString('PORTA', 'SELECIONADO', CBporta.Text);

   finally
     ini.free;
   end;

end;

procedure TfrmConfig.BBLerConfiguracoesClick(Sender: TObject);
begin
  preencherCombos();
end;

end.
