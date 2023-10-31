unit u_principal;

interface

uses

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms,  Vcl.ExtCtrls, StrUtils,



    IdMultipartFormData,  System.JSON,

  System.JSON.Writers,System.JSON.readers,System.JSON.Types,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Client,
  DateUtils,

  //############ ATENCAO AQUI ####################
  //units adicionais obrigatorias
   uTInject.ConfigCEF, uTInject,            uTInject.Constant,      uTInject.JS,     uInjectDecryptFile,
   uTInject.Console,   uTInject.Diversos,   uTInject.AdjustNumber,  uTInject.Config, uTInject.Classes,

  //units Opcionais (dependendo do que ira fazer)
   System.NetEncoding, System.TypInfo,  WinInet,

  Vcl.StdCtrls, System.ImageList, Vcl.ImgList, Vcl.AppEvnts, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, Vcl.Mask, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Dialogs, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, Vcl.OleCtrls, SHDocVw, IdHTTP, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, Vcl.Imaging.jpeg,
  Vcl.Menus, System.Net.URLClient, System.Net.HttpClient, Soap.SOAPHTTPTrans,
  System.Net.HttpClientComponent, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmPrincipal = class(TForm)
    TInject1: TInject;
    OpenDialog1: TOpenDialog;
    TrayIcon1: TTrayIcon;
    ImageList1: TImageList;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet4: TTabSheet;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    lblStatus: TLabel;
    Lbl_Avisos: TLabel;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Image1: TImage;
    MainMenu1: TMainMenu;
    Autenticao1: TMenuItem;
    Autenticao2: TMenuItem;
    Formulrio1: TMenuItem;
    Formulrio2: TMenuItem;
    Manual1: TMenuItem;
    Manual2: TMenuItem;
    Manual3: TMenuItem;
    Manual4: TMenuItem;
    Enviartextocombotes1: TMenuItem;
    Enviartextocombotes2: TMenuItem;
    Enviartextoe1: TMenuItem;
    Enviarcontato1: TMenuItem;
    Enviarcontato2: TMenuItem;
    Enviarlocalizao1: TMenuItem;
    Enviarlocalizao2: TMenuItem;
    Statusdabateria2: TMenuItem;
    memo_log: TMemo;
    Panel6: TPanel;
    Edt_cabecalho_mensagem: TEdit;
    Label5: TLabel;
    Panel8: TPanel;
    Label7: TLabel;
    Edt_Numero_Conectado: TEdit;
    TabSheet2: TTabSheet;
    Panel4: TPanel;
    btn_processar_lista: TButton;
    CBAutomatico: TCheckBox;
    Timer1: TTimer;
    IdHTTP1: TIdHTTP;
    HTTPReqResp1: THTTPReqResp;
    NetHTTPRequest1: TNetHTTPRequest;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    TabSheet5: TTabSheet;
    MMMalaDireta: TMemo;
    Label8: TLabel;
    BtnExecutarMalaDireta: TButton;
    MMCelulares: TMemo;
    OpenDialog2: TOpenDialog;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    FDQuery2: TFDQuery;
    Label9: TLabel;
    BBAtualizar: TBitBtn;
    PopupMenu2: TPopupMenu;
    PopupMenu21: TMenuItem;
    Label10: TLabel;
    ImgEmpresa: TImage;
    N1: TMenuItem;
    PararEnvio1: TMenuItem;
    Lista: TTabSheet;
    SGListaEnvios: TStringGrid;
    SGBList: TStringGrid;
    Label11: TLabel;
    Label12: TLabel;
    PopupMenu1: TPopupMenu;
    ExcluirdoBackList1: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    btn_importar_lista: TButton;
    N2: TMenuItem;
    ExcluirTodos1: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    SpeedButton2: TSpeedButton;
    DTPAgendaData: TDateTimePicker;
    Label2: TLabel;
    DTPAgendaHora: TDateTimePicker;
    PopupMenu4: TPopupMenu;
    Excluir1: TMenuItem;
    N3: TMenuItem;
    Excluir2: TMenuItem;
    N4: TMenuItem;
    Reenviar1: TMenuItem;
    SGListaNaoEnvios: TStringGrid;
    Label4: TLabel;
    MMFiles: TMemo;
    PopupMenu3: TPopupMenu;
    PopupMenu31: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button7Click(Sender: TObject);

    procedure TInject1GetUnReadMessages(Const Chats: TChatList);
    procedure TrayIcon1Click(Sender: TObject);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure TInject1GetStatus(Sender: TObject);
    procedure TInject1GetMyNumber(Sender: TObject);
    procedure TInject1ErroAndWarning(Sender: TObject; const PError,      PInfoAdc: string);
    procedure TInject1GetAllContactList(      const AllContacts: TRetornoAllContacts);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TInject1GetQrCode(COnst Sender: TObject; const QrCode: TResultQRCodeClass);
    procedure TInject1LowBattery(Sender: TObject);
    procedure TInject1DisconnectedBrute(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure TInject1IsConnected(Sender: TObject; Connected: Boolean);

    procedure TInject1GetProfilePicThumb(Sender: TObject; Base64: string);
    procedure Button5Click(Sender: TObject);
    procedure TInject1GetAllGroupList(const AllGroups: TRetornoAllGroups);
    procedure TInject1GetAllGroupContacts(      const Contacts: TClassAllGroupContacts);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure TInject1GetAllGroupAdmins(    const AllGroups: TRetornoAllGroupAdmins);

    procedure TInject1GetStatusMessage(const Result: TResponseStatusMessage);
    procedure Button19Click(Sender: TObject);
    procedure TInject1GetInviteGroup(const Invite: string);
    procedure TInject1GetMe(const vMe: TGetMeClass);
    procedure TInject1NewGetNumber(const vCheckNumber: TReturnCheckNumber);
    procedure TInject1Disconnected(Sender: TObject);
    procedure Statusdabateria2Click(Sender: TObject);
    procedure Manual4Click(Sender: TObject);
    procedure Edt_cabecalho_mensagemExit(Sender: TObject);
    procedure btn_importar_listaClick(Sender: TObject);
    procedure btn_processar_listaClick(Sender: TObject);
    procedure CBAutomaticoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PopupMenu21Click(Sender: TObject);
    procedure BtnExecutarMalaDiretaClick(Sender: TObject);
    procedure PararEnvio1Click(Sender: TObject);
    procedure ExcluirdoBackList1Click(Sender: TObject);
    procedure ExcluirTodos1Click(Sender: TObject);
    procedure BBAtualizarClick(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure Excluir2Click(Sender: TObject);
    procedure Reenviar1Click(Sender: TObject);


  private
    { Private declarations }
    FIniciando: Boolean;
    FStatus: Boolean;
    FNameContact:  string;
    FChatID: string;

    function trata_numero(numero: string): string;
    function Enviar(destino, arquivo,  mensagem:string):boolean;
    function whatsMensegerKey(origem : string):boolean;
    function AtualizaRegistroBDLocal(idMsg: integer): boolean;
    function InsereBDLocal(origem, destino, arquivo, msg, data_hora, agenda: string;
      status: integer): boolean;
    function AtualizaTabelaEnvios: boolean;
    function ExcluiRegistroBDLocal(idMsg: integer): boolean;


  public
    { Public declarations }
    mensagem  : string;
    AFile     : string;

    procedure AddChatList(ANumber: String);
    procedure AddContactList(ANumber: String);
    procedure AddGroupList(ANumber: string);
    procedure AddGroupAdmins(ANumber: string);
    procedure AddGroupContacts(ANumber: string);

  end;

var
  frmPrincipal: TfrmPrincipal;

id_empresa     : integer = 1;
id_atendimento : integer = 1;
id_atendente   : integer = 1;
token          : string = '4297f44b13955235245b2497399d7a93';
origem         : string = '63992893682';
destino        : string = '5563992465660';
mensagem       : string = 'Teste';
enviado        : boolean = false;

ddi            : string = '55';
ddd            : string = '63';
extensao       : string = '@c.us';

implementation

uses
  Datasnap.DBClient, Winapi.ShellAPI, System.AnsiStrings, IniFiles;

{$R *.dfm}


var
  ArquivoINI: TIniFile;
  CELULAR_EMPRESA : string;
  vPararEnvio:boolean=false;

//funçao para tratar o numero do celular
function TfrmPrincipal.trata_numero(numero:string):string;
var ddd : string;
const
  //Lista de caracteres especiais
  xCarEspeciais: array[1..45] of String = ('+','[',']','(',')', ' ', 'á', 'à', 'ã', 'â', 'ä','Á', 'À', 'Ã', 'Â', 'Ä',
                                     'é', 'è','É', 'È','í', 'ì','Í', 'Ì',
                                     'ó', 'ò', 'ö','õ', 'ô','Ó', 'Ò', 'Ö', 'Õ', 'Ô',
                                     'ú', 'ù', 'ü','Ú','Ù', 'Ü','ç','Ç','ñ','Ñ','-');
  //Lista de caracteres para troca
  xCarTrocar: array[1..45] of String = ('','','','','', '', 'a', 'a', 'a', 'a', 'a','A', 'A', 'A', 'A', 'A',
                                     'e', 'e','E', 'E','i', 'i','I', 'I',
                                     'o', 'o', 'o','o', 'o','O', 'O', 'O', 'O', 'O',
                                     'u', 'u', 'u','u','u', 'u','c','C','n', 'N','');
var
  i : Integer;
  numero_limpo :string;
begin
   for i:=1 to 46 do
     numero := StringReplace(numero, xCarEspeciais[i], xCarTrocar[i], [rfreplaceall]);

   if copy(numero,1,2) = '55' then
     begin //apagar o 55 digito  5563992893682
       Delete(numero, 1, 2);
     end;

    if length(numero) = 14 then
       begin //o numero parece com isso  02163992893682
         if (copy(numero, 0,1) = '0') then
            begin
                Delete(numero, 1, 3);
                ddd := copy(numero,0,2);
            end;
       end;

    if length(numero) = 13 then
       begin //o numero parece com isso  2163992893682
         if (copy(numero, 0,1) <> '0') then
            begin
                Delete(numero, 1, 1);
                ddd := copy(numero,0,2);
            end;
       end;

    if length(numero) = 12 then
       begin //o numero parece com isso  063992893682
         if (copy(numero, 0,1) = '0') then
            begin
              Delete(numero, 1, 1);
              ddd := copy(numero,0,2);
            end;
       end;

    if not ContainsText('81, 82, 83, 84, 85, 86, 87, 88, 89, 31, 32, 33, 34, 35, 37, 38, 71, 73, 74, 75, 77, 79', copy(numero, 0, 2)) then
      begin
      if length(numero) = 11 then //os demais prefixos naõ requerem o nono digito
         begin //o numero parece com isso  63992893682
           Delete(numero, 3, 1);
           ddd := copy(numero,0,2);
           numero_limpo := copy(numero, (length(numero) -8),(length(numero) -0));
         end;
      end
    else
      begin
           ddd := copy(numero,0,2);
           numero_limpo := copy(numero, (length(numero) -8),(length(numero) -0));
      end;

    if length(numero) = 10 then
       begin //o numero parece com isso 6392893682
         ddd := copy(numero,0,2);
         numero_limpo := copy(numero, (length(numero) -7),(length(numero) -0));
       end;

//   if not ContainsText('11 12 13 14 15 16 17 18 19 21 22 24 27 28 91 92 93 94 95 63 66 96 97 98 99 81 82 83 84 85 86 87 88 89 31 32 33 34 35 37 38 71 73 74 75 77 79', ddd) then
//    begin
//      result := 'INVALIDO';
//      exit;
//    end;

  result := trim(ddd+numero_limpo); // 6392893682
end;



procedure TfrmPrincipal.AddContactList(ANumber: String);
var
  Item: TListItem;
begin

  if Length(ANumber) < 12 then
     ANumber := '55' + ANumber;
  item.Caption := ANumber;
  item.SubItems.Add(item.Caption+'SubItem 1');
  item.SubItems.Add(item.Caption+'SubItem 2');
  item.ImageIndex := 0;
end;

procedure TfrmPrincipal.AddGroupAdmins(ANumber: string);
var
  Item: TListItem;
begin
  item.Caption := ANumber;
  item.SubItems.Add(item.Caption+'SubItem 1');
  item.SubItems.Add(item.Caption+'SubItem 2');
  item.ImageIndex := 0;
end;

procedure TfrmPrincipal.AddGroupContacts(ANumber: string);
var
  Item: TListItem;
begin
  item.Caption := ANumber;
  item.SubItems.Add(item.Caption+'SubItem 1');
  item.SubItems.Add(item.Caption+'SubItem 2');
  item.ImageIndex := 0;
end;

procedure TfrmPrincipal.AddGroupList(ANumber: string);
var
  Item: TListItem;
begin
  item.Caption := ANumber;
  item.SubItems.Add(item.Caption+'SubItem 1');
  item.SubItems.Add(item.Caption+'SubItem 2');
  item.ImageIndex := 0;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TInject1.ShutDown;
//  FreeAndNil(GlobalCEFApp);

end;

//Funcoes de arqmazenamento local
function TfrmPrincipal.InsereBDLocal(origem, destino, arquivo, msg, data_hora, agenda:string; status:integer):boolean;
begin
  if FDConnection1.Connected = True then
    begin
      try
        FDQuery2.Close;
        FDQuery2.SQL.Clear;
        FDQuery2.SQL.Add(' INSERT INTO tb_envios (id, origem, destino, arquivo, msg, data_hora, agenda, status) VALUES ((SELECT CASE WHEN max(id) IS NULL THEN 1 ELSE max(id)+1 END AS id FROM tb_envios),'''+origem+''','''+destino+''','''+arquivo+''','''+msg+''','''+data_hora+''', '''+agenda+''',0); ');
        FDQuery2.execsql;
        result := true;
      except
        ShowMessage('Não foi possível inserir no banco. ');
        result := false;
      end;
    end
  else
    begin
      showmessage('Não há conexão com o banco de dados local.');
      result := false;
    end;
    BBAtualizar.Click;
end;

function TfrmPrincipal.AtualizaTabelaEnvios():boolean;
begin
  if FDConnection1.Connected = True then
    begin
      try
        FDQuery1.Close;
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add(' SELECT* FROM tb_envios where status = 0 order by id asc;  ');
        FDQuery1.OPEN;
        result := true;
      except
        ShowMessage('Não foi possível inserir no banco. ');
        result := false;
      end;
    end
  else
    begin
      showmessage('Não há conexão com o banco de dados local.')  ;
      result := true;
    end;
end;

function TfrmPrincipal.AtualizaRegistroBDLocal(idMsg:integer):boolean;
begin
  if FDConnection1.Connected = True then
    begin
      try
        FDQuery2.Close;
        FDQuery2.SQL.Clear;
        FDQuery2.SQL.Add(' UPDATE tb_envios  SET status = 1 WHERE id = '+inttostr(idMsg)+' ');
        FDQuery2.execsql;
        result := true;
      except
        ShowMessage('Não foi possível inserir no banco. ');
        result := false;
      end;
    end
  else
    begin
      showmessage('Não há conexão com o banco de dados local.') ;
      result := false;
    end;
end;

procedure TfrmPrincipal.Excluir1Click(Sender: TObject);
var vpergunta : string;
i:integer;
begin

  if SGListaEnvios.Row > 0 then
     begin
          vpergunta := 'Deseja excluir '+SGListaEnvios.Cells[3,SGListaEnvios.Row]+' da Lista?';
          IF APPLICATION.MessageBox(pWideChar(vpergunta),'ATENÇÃO ',MB_YESNO + MB_ICONWARNING)=MRYES THEN
             begin
                FDQuery2.Close;
                FDQuery2.SQL.Clear;
                FDQuery2.SQL.Add(' DELETE from whatsapp_envios WHERE id = '+SGListaEnvios.Cells[0,SGListaEnvios.Row]+'; ');
                FDQuery2.execsql;
                memo_log.lines.Add('Excluido: '+SGListaEnvios.Cells[3,SGListaEnvios.Row]);
             end;
     end;
  PageControl1Change(self);
end;

procedure TfrmPrincipal.Excluir2Click(Sender: TObject);
var vpergunta : string;
i:integer;
begin

  if SGListaEnvios.Row > 0 then
     begin
          vpergunta := 'Deseja excluir todos os registros da lista?';
          IF APPLICATION.MessageBox(pWideChar(vpergunta),'ATENÇÃO ',MB_YESNO + MB_ICONWARNING)=MRYES THEN
             begin
               for I := SGListaEnvios.Row to SGListaEnvios.Rowcount do
                  begin
                    FDQuery2.Close;
                    FDQuery2.SQL.Clear;
                    FDQuery2.SQL.Add(' DELETE from whatsapp_envios WHERE id = '+SGListaEnvios.Cells[0,SGListaEnvios.Row]+'; ');
                    FDQuery2.execsql;
                    memo_log.lines.Add('Excluido: '+SGListaEnvios.Cells[1,SGListaEnvios.Row]);
                  end;
             end;
     end;
     PageControl1Change(self);
end;

procedure TfrmPrincipal.ExcluirdoBackList1Click(Sender: TObject);
var vpergunta : string;
i:integer;
begin

  if SGBList.Row > 0 then
     begin
          vpergunta := 'Deseja excluir '+SGBList.Cells[1,SGBList.Row]+' da BLACLIST? Esses clientes não querem contato...';
          IF APPLICATION.MessageBox(pWideChar(vpergunta),'ATENÇÃO ',MB_YESNO + MB_ICONWARNING)=MRYES THEN
             begin
                FDQuery2.Close;
                FDQuery2.SQL.Clear;
                FDQuery2.SQL.Add(' DELETE from tb_blacklist WHERE id = '+SGBList.Cells[0,SGBList.Row]+'; ');
                FDQuery2.execsql;

                FDQuery2.Close;
                FDQuery2.SQL.Clear;
                FDQuery2.SQL.Add('Select* from tb_blacklist');
                FDQuery2.open;
                SGBList.RowCount := FDQuery2.RECORDcount;
                SGBList.Cells[0, 0]:='ID';
                SGBList.Cells[1, 0]:='CELULAR';
                SGBList.ColWidths[0] := 60;
                SGBList.ColWidths[1] := 100;
                i:=0;
                if not FDQuery2.eof  then repeat
                  begin
                   i:=i+1;
                   SGBList.Cells[0, i] := FDQuery2.FieldByName('id').asstring;
                   SGBList.Cells[1, i] := FDQuery2.FieldByName('celular').asstring;
                   FDQuery2.next;
                  end;
                until FDQuery2.eof;

             end;
     end;
end;

function TfrmPrincipal.ExcluiRegistroBDLocal(idMsg:integer):boolean;
begin
  if FDConnection1.Connected = True then
    begin
      try
        FDQuery2.Close;
        FDQuery2.SQL.Clear;
        if idMsg = 0 then
           FDQuery2.SQL.Add(' DELETE from tb_envios WHERE id > 0')
        else
        FDQuery2.SQL.Add(' DELETE from tb_envios WHERE id = '+inttostr(idMsg)+'; ');
        FDQuery2.execsql;
        result := true;
      except
        ShowMessage('Não foi possível EXCLUIR do banco. ');
        result := false;
      end;
    end
  else
    begin
      showmessage('Não há conexão com o banco de dados local.') ;
      result := false;
    end;
end;

procedure TfrmPrincipal.ExcluirTodos1Click(Sender: TObject);
begin   //zero para excluir todos
   if ExcluiRegistroBDLocal(0) then
      Lblstatus.Caption:='Impossivel excluir';
   BBAtualizar.Click;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  banco : string;
begin  //criar banco de dados local
  PageControl1.ActivePageIndex := 0;
  banco := 'db_sqlite.db';
  if not FileExists(banco) then
    begin
      try
        FDConnection1.params.Database:= banco;
        FDConnection1.Connected:= True;
        FDQuery1.Close;
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add('CREATE TABLE tb_envios ( id integer NOT NULL, origem text(20), destino text(20), arquivo text(500), msg text(5000),data_hora text(30), agenda text(30), status integer);');
        FDQuery1.ExecSQL;

        FDQuery1.Close;
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add('CREATE TABLE tb_clientes ( id integer NOT NULL, nome text(200), endereco text(500), nascimento text(30));');
        FDQuery1.ExecSQL;

        FDQuery1.Close;
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add('CREATE TABLE tb_celular ( id integer NOT NULL, id_cliente, celular text(20));');
        FDQuery1.ExecSQL;

        FDQuery1.Close;
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add('CREATE TABLE tb_grupos ( id integer NOT NULL, grupo text(200));');
        FDQuery1.ExecSQL;

        FDQuery1.Close;
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add('CREATE TABLE tb_grupos_celular ( id integer NOT NULL, id_grupo integer, id_celular integer );');
        FDQuery1.ExecSQL;

        FDQuery1.Close;
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add('CREATE TABLE tb_blacklist (   ID INTEGER PRIMARY KEY AUTOINCREMENT,   celular text);');
        FDQuery1.ExecSQL;

      except
        ShowMessage('Não foi possível criar: ' + banco);
      end;
    end
  else
    begin
      try
        FDConnection1.params.Database:= banco;
        FDConnection1.Connected:= True;
      except
        ShowMessage('Não foi possível conectar: ' + banco);
      end;
    end;

    if fileexists(extractfilepath(application.ExeName)+'\img\logo.png') then
       ImgEmpresa.Picture.LoadFromFile(extractfilepath(application.ExeName)+'\img\logo.png');
     ImgEmpresa.Repaint;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  frmPrincipal.TOP:= SCREEN.WorkAreaHeight- frmPrincipal.HEIGHT;
  frmPrincipal.LEFT:=SCREEN.WorkareaWidth- frmPrincipal.WIDTH;
  DTPAgendaData.Date := now;
  DTPAgendaHora.Time := now;
end;

Procedure TfrmPrincipal.AddChatList(ANumber: String);
var
  Item: TListItem;
begin

end;

procedure TfrmPrincipal.ApplicationEvents1Minimize(Sender: TObject);
begin
  self.Hide();
  self.WindowState := wsMinimized;
  trayIcon1.Visible := true;
  TrayIcon1.Animate := True;
  TrayIcon1.ShowBalloonHint;
end;

procedure TfrmPrincipal.Button10Click(Sender: TObject);
begin
  if not TInject1.Auth then
     Exit;
end;

procedure TfrmPrincipal.Button11Click(Sender: TObject);
begin
  if not TInject1.Auth then
     Exit;
end;

procedure TfrmPrincipal.Button12Click(Sender: TObject);
begin
  if not TInject1.Auth then
     Exit;

end;

procedure TfrmPrincipal.Button19Click(Sender: TObject);
begin

   if not TInject1.Auth then

     Exit;

end;


procedure TfrmPrincipal.BBAtualizarClick(Sender: TObject);
begin
   FDQuery1.Refresh;
end;

procedure TfrmPrincipal.BtnExecutarMalaDiretaClick(Sender: TObject);
var i, ii:integer;
vListaEnvioWhatsApp:Tstringlist;
 vDestino, vArquivo, vMSG, vldataHora, vAgendaData, vAgendaHora : WideString;
begin
  vListaEnvioWhatsApp:=Tstringlist.create;
  vListaEnvioWhatsApp.clear;
  for i := 0 to MMCelulares.Lines.Count -1  do
    begin
      vMSG:='';
      vArquivo := '';
      vDestino := '';
      vldataHora := datetostr(now)+' '+timetostr(now);

          vAgendaData := datetostr(DTPAgendaData.Date);
          vAgendaHora := timetostr(DTPAgendaHora.Time);
      vDestino := MMCelulares.Lines[i];

      if ((trim(MMMalaDireta.Lines.Text) <>'')and( trim(MMCelulares.Lines[i])<>'')) then
        begin
         vMSG  := MMMalaDireta.Lines.Text;

         if trim(MMFiles.Lines.Text) = '' then
            vListaEnvioWhatsApp.Add(vDestino +'||'+vMSG+'|'+vldataHora+'|'+vAgendaData+' '+vAgendaHora+'|');

          vAgendaData := datetostr(DTPAgendaData.Date);
          vAgendaHora := timetostr(DTPAgendaHora.Time);

              for ii := 0 to MMFiles.Lines.Count -1  do
                begin  //arquivo
                  vArquivo := trim(MMFiles.Lines[ii]);
                 // vMSG := MMFiles.Lines[ii];
                  if vArquivo<>'' then
                    begin
                      vMSG := vMSG+' ( _Envie_ *SAIR* _para não receber mais mensagens_ )';
                      vListaEnvioWhatsApp.Add(vDestino +'|'+vArquivo+'|'+vMSG+'|'+vldataHora+'|'+vAgendaData+' '+vAgendaHora+'|');
                    end;

                  vMSG:='';
                  vArquivo := '';
                  vDestino := '';
                end;

        end;

    end;

    vListaEnvioWhatsApp.SaveToFile(extractfilepath(application.ExeName)+'\Importar\lista.txt'); //  vListaEnvioWhatsApp.LoadFromFile(caminho+'\Importar\lista.txt');
    vListaEnvioWhatsApp.Free;
    vDestino:= '';
    vArquivo:='';
    vMSG:='';
    btn_importar_lista.Click;

//  MMCelulares.Clear;
//  MMFiles.clear;
//  MMMalaDireta.clear;
  Showmessage('Mala direta criada com sucesso.');

end;


function TfrmPrincipal.whatsMensegerKey(origem:string):boolean;
 //https://osmano.com.br/keys/app_key.php?celular=63992893682
var vurl, vcel, vretorno: string;
begin

  try
    vcel:=trata_numero(trim(origem));           //keys/multmensseger

    vretorno:=idHttp1.Get('http://osmano.com.br/keys/multmensseger/app_key.php?celular='+vcel);
    vretorno := trata_numero(trim(vretorno));

    if vretorno <> vcel then
       begin
          memo_log.lines.Add('Sistema não registrado...') ;
          result:=false;
       end
     else
     result:=true;

  except
    StatusBar1.Panels[0].Text := 'Sistema com falha...';
  end;

  end;



procedure TfrmPrincipal.btn_importar_listaClick(Sender: TObject);
var  i:integer;
  lista : Tstringlist;
  caminho : string;
  vorigem:string;
  volddestino:string;
  vdestino:string;
  vArquivo:string;
  vmsg:string;
  vdatahora:string;
  vAgenda:string;
begin
  caminho := extractfilepath(application.exename);
  if not DirectoryExists(caminho+'\Importados') then
  ForceDirectories(caminho+'\Importados');
  if not DirectoryExists(caminho+'\Importar') then
  ForceDirectories(caminho+'\Importar');

  if fileexists(caminho+'\Importar\lista.txt') then
     begin

        Lista := Tstringlist.Create;
        lista.Clear;
        lista.LoadFromFile(caminho+'\Importar\lista.txt') ;

        for i := 0 to Lista.Count-1 do
          begin
            vorigem:=trata_numero(Edt_Numero_Conectado.Text);
            vdestino:=SplitString(Lista[i], '|')[0];
            vdestino:=trata_numero(vdestino);
            vArquivo:=SplitString(Lista[i], '|')[1];
            vmsg := SplitString(Lista[i], '|')[2];
            vdatahora:= SplitString(Lista[i], '|')[3];
            vAgenda:= SplitString(Lista[i], '|')[4];       //datetostr(now) + ' '+timetostr(now);
            if ((volddestino <> vdestino)) then
               begin
                 // InsereBDLocal(vorigem, vdestino,extractfilepath(application.ExeName)+'\img\logo.png','', vdatahora, 0);
                 // InsereBDLocal(vorigem, vdestino,'','Envie *SAIR* para não receber mais mensagens dessa empresa!\n\n ', vdatahora, 0);
                  volddestino := vdestino;
               end;

            //ARQUIVOS OBRIGATORIOS
            if trim(vmsg)<>'' then
               begin
                  InsereBDLocal(vorigem, vdestino,vArquivo, vmsg, vdatahora, vAgenda, 0);
               end;

          end;

        Lista.Free;
        movefile(pchar(caminho+'\Importar\lista.txt'),pchar(caminho+'\Importados\'+formatdatetime('yyyymmdd',now)+formatdatetime('Hms',now)+'_lista.txt'));
     end;
end;

procedure TfrmPrincipal.btn_processar_listaClick(Sender: TObject);
var i, tempo:integer;
 vlagendaData, vldataHoje : tdate;
 vlagendaHora, vlhoraAgora: ttime;


begin

   if FDQuery1.RecordCount > 0 then
      begin
         FDQuery1.prior;
         btn_processar_lista.Enabled:=false;
         FDQuery1.DisableControls;
         if not FDQuery1.Eof  then  repeat
            begin  //showmessage(FormatDateTime('dd/mm/yyyy H:m', now)) ;
                  vlagendaData := FDQuery1.fieldbyname('data_hora').AsDateTime;
                  vlagendaHora := FDQuery1.fieldbyname('data_hora').AsDateTime;
                  vldataHoje  := now;
                  vlhoraAgora := now;

                if ( (vlagendaData <= vldataHoje)and(vlagendaHora <= vlhoraAgora) )  then
                  begin
                    // showmessage('hora maior que agenda')

                    Randomize;
                    tempo := Random(5000);


                    FDQuery2.Close;
                    FDQuery2.SQL.Clear;
                    FDQuery2.SQL.Add('Select* from tb_blacklist where celular LIKE('+quotedstr('%'+FDQuery1.FieldByName('destino').asstring)+'); ');
                    FDQuery2.open;
                    if (FDQuery2.recordcount > 0) then
                       memo_log.lines.add('BlackList: '+FDQuery1.fieldbyname('destino').AsString+' -> '+FDQuery1.fieldbyname('msg').AswideString)
                    else
                       //blacklist não envia
                        begin
                           // edt_destino.text:= FDQuery1.fieldbyname('destino').AsString;
                            if FDQuery1.fieldbyname('arquivo').AsString = '' then
                              begin
                                 Enviar(FDQuery1.fieldbyname('destino').AsString, FDQuery1.fieldbyname('arquivo').AsString, FDQuery1.fieldbyname('msg').AsString);
                                 if not AtualizaRegistroBDLocal(FDQuery1.fieldbyname('id').asinteger) then beep;
                                 application.ProcessMessages;
                              end
                           else
                              begin  ////Envie *SAIR* para não receber mais mensagens dessa empresa!\n\n
                                 opendialog1.filename := FDQuery1.fieldbyname('msg').AswideString;
                                 Enviar(FDQuery1.fieldbyname('destino').AsString, FDQuery1.fieldbyname('arquivo').AsString, FDQuery1.fieldbyname('msg').AsString);
                                 if not AtualizaRegistroBDLocal(FDQuery1.fieldbyname('id').asinteger) then beep;
                              end;
                        end;


                      if vPararEnvio then
                         break;
                      sleep(tempo);
                  end;
                    FDQuery1.next;

            end;
         until FDQuery1.eof;
         FDQuery1.EnableControls;
         btn_processar_lista.Enabled:=true;



      end;
  if not AtualizaTabelaEnvios then
    beep;
  vPararEnvio:=false;
end;

procedure TfrmPrincipal.Button4Click(Sender: TObject);
begin
  if not TInject1.Auth then
    Exit;
end;

procedure TfrmPrincipal.Button5Click(Sender: TObject);
begin
  if not TInject1.Auth then
     Exit;

  TInject1.getAllGroups;
end;

procedure TfrmPrincipal.Button6Click(Sender: TObject);
begin
  if not TInject1.Auth then
     Exit;
end;

function TfrmPrincipal.Enviar(destino, arquivo, mensagem:string):boolean;
begin

  if arquivo = '' then
    try
      if not TInject1.Auth then
         Exit;
      TInject1.send(trata_numero(destino), mensagem);
    except
     beep;
    end;

  if arquivo <> '' then
      try
        if not TInject1.Auth then
           exit;
        TInject1.SendFile(trata_numero(destino), arquivo, mensagem); // ,  mem_message.Text
        memo_log.Lines.Add('ENVIADO: '+openDialog1.FileName);
      except
        beep;
      end;


end;

procedure TfrmPrincipal.Button7Click(Sender: TObject);
begin
  if not TInject1.Auth then
     Exit;
end;

procedure TfrmPrincipal.Button8Click(Sender: TObject);
begin
  if not TInject1.Auth then
     Exit;
end;

procedure TfrmPrincipal.Button9Click(Sender: TObject);
begin
  if not TInject1.Auth then
     Exit;
end;

procedure TfrmPrincipal.CBAutomaticoClick(Sender: TObject);
begin
  if cbautomatico.Checked = true then
     begin
       Timer1.Enabled := true;
       timer1.interval := 2000;
       showmessage('ligado');
     end
  else
    begin
      Timer1.Enabled := false;
      timer1.interval := 0;
    end;
end;

procedure TfrmPrincipal.Edt_cabecalho_mensagemExit(Sender: TObject);
begin
  Edt_cabecalho_mensagem.ReadOnly := true;
end;

procedure TfrmPrincipal.TInject1Disconnected(Sender: TObject);
begin
  Lbl_Avisos.caption:='Conexão foi finalizada';
end;

procedure TfrmPrincipal.TInject1DisconnectedBrute(Sender: TObject);
begin
  Lbl_Avisos.caption:='Conexão foi finalizada pelo celular';
end;

procedure TfrmPrincipal.TInject1ErroAndWarning(Sender: TObject;
  const PError, PInfoAdc: string);
begin

  Lbl_Avisos.Caption    := Perror + ' -> ' + PInfoAdc;
  Lbl_Avisos.Font.Color := clBlack;


end;

procedure TfrmPrincipal.TInject1GetAllContactList(
  const AllContacts: TRetornoAllContacts);
var
  AContact: TContactClass;
begin


  for AContact in AllContacts.result do
  begin
    AddContactList(AContact.id + ' ' +AContact.name);
  end;

  AContact := nil;

end;

procedure TfrmPrincipal.TInject1GetAllGroupAdmins(
  const AllGroups: TRetornoAllGroupAdmins);
var
  i: integer;
begin
  for i := 0 to (AllGroups.Numbers.count) - 1 do
  begin
    AddGroupAdmins(allgroups.Numbers[i])
  end;
end;

procedure TfrmPrincipal.TInject1GetAllGroupContacts(
  const Contacts: TClassAllGroupContacts);
var
  JSonValue       : TJSonValue;
  ArrayRows       : TJSONArray;
  i: integer;
begin
  JsonValue := TJSonObject.ParseJSONValue(contacts.result);
  ArrayRows := JsonValue as TJSONArray;

  for i := 0 to ArrayRows.Size - 1 do
  begin
    AddGroupContacts(ArrayRows.Items[i].value)
  end;
end;

procedure TfrmPrincipal.TInject1GetAllGroupList(
  const AllGroups: TRetornoAllGroups);
var
  i: integer;
begin

  for i := 0 to (AllGroups.Numbers.count) - 1 do
  begin
    AddGroupList(allgroups.Numbers[i])
  end;

end;


procedure TfrmPrincipal.TInject1GetInviteGroup(const Invite: string);
begin

Lbl_Avisos.caption:=Invite;

end;



procedure TfrmPrincipal.TInject1GetMe(const vMe: TGetMeClass);
var aList : TStringList;

begin

 try

  aList := TStringList.Create();



  aList.Add('Battery: ' + vME.battery.ToString);

  aList.Add('LC: ' +  vMe.lc);

  aList.Add('LG: ' + vMe.lg);

  aList.Add('Locate: ' + vMe.locate);



  if vMe.plugged then

   aList.Add('Plugged: true')

  else

   aList.Add('Plugged: false');



  aList.Add('Pushname: ' + vMe.pushname);

  aList.Add('ServerToken: ' + vMe.serverToken);

  aList.Add('Status: ' + vMe.status.status);

  aList.Add('Me: ' + vMe.me);

  aList.Add('Phone Device_Manufacturer:  ' + vMe.phone.device_manufacturer);

  aList.Add('Phone Device Model: ' + vMe.phone.device_model);

  aList.Add('Phone MCC: ' + vMe.phone.mcc);

  aList.Add('Phone MNC: ' + vMe.phone.mnc);

  aList.Add('Phone OS Builder Number: ' + vMe.phone.os_build_number);

  aList.Add('Phone OS Version: ' + vMe.phone.os_version);

  aList.Add('Phone wa Version: ' + vMe.phone.wa_version);



  if vME.phone.InjectWorking then

   aList.Add('Phone InjectWorkink: true')

  else

   aList.Add('Phone InjectWorkin: false');



  Lbl_Avisos.caption:=aList.Text;

 finally

  aList.Free;

 end;

end;



procedure TfrmPrincipal.TInject1GetMyNumber(Sender: TObject);
begin
  Edt_Numero_Conectado.text :=   TInject(Sender).MyNumber;
end;

procedure TfrmPrincipal.TInject1GetProfilePicThumb(Sender: TObject;
  Base64: string);
var
  LInput: TMemoryStream;
  LOutput: TMemoryStream;
  AStr: TStringList;
  lThread: TThread;
begin
  lThread := TThread.CreateAnonymousThread(
  procedure
  begin
    try
      LInput := TMemoryStream.Create;
      LOutput := TMemoryStream.Create;
      AStr  := TStringList.Create;
      AStr.Add(Base64);
      AStr.SaveToStream(LInput);
      LInput.Position := 0;
      TNetEncoding.Base64.Decode( LInput, LOutput );
      LOutput.Position := 0;

    finally
      LInput.Free;
      LOutput.Free;
      AStr.Free;
    end;
  end);
  lThread.FreeOnTerminate := true;
  lThread.Start;
end;

procedure TfrmPrincipal.TInject1GetQrCode(Const Sender: TObject;  const QrCode: TResultQRCodeClass);
begin
  if TInject1.FormQrCodeType = TFormQrCodeType(Ft_none) then
     Image1.Picture := QrCode.AQrCodeImage else
     Image1.Picture := nil;
end;

procedure TfrmPrincipal.TInject1GetStatus(Sender: TObject);
begin
  if not Assigned(Sender) Then
     Exit;

  try
    TabSheet4.TabVisible   := (TInject(Sender).Status = Inject_Initialized);
  Except
  end;

  if (TInject(Sender).Status = Inject_Initialized) then
  begin
    lblStatus.Caption            := 'Online';
    lblStatus.Font.Color         := $0000AE11;
    SpeedButton3.Enabled              := true;
  end else
  begin
    SpeedButton3.Enabled              := false;
    lblStatus.Caption            := 'Offline';
    lblStatus.Font.Color         := $002894FF;
  end;

  StatusBar1.Panels[1].Text  := lblStatus.Caption;


  Label3.Visible := False;
  case TInject(Sender).status of
    Server_ConnectedDown       : Label3.Caption := TInject(Sender).StatusToStr;
    Server_Disconnected        : Label3.Caption := TInject(Sender).StatusToStr;
    Server_Disconnecting       : Label3.Caption := TInject(Sender).StatusToStr;
    Server_Connected           : Label3.Caption := '';
    Server_Connecting          : Label3.Caption := TInject(Sender).StatusToStr;
    Inject_Initializing        : Label3.Caption := TInject(Sender).StatusToStr;
    Inject_Initialized         : Label3.Caption := TInject(Sender).StatusToStr;
    Server_ConnectingNoPhone   : Label3.Caption := TInject(Sender).StatusToStr;
    Server_ConnectingReaderCode: Label3.Caption := TInject(Sender).StatusToStr;
    Server_TimeOut             : Label3.Caption := TInject(Sender).StatusToStr;
    Inject_Destroying          : Label3.Caption := TInject(Sender).StatusToStr;
    Inject_Destroy             : Label3.Caption := TInject(Sender).StatusToStr;
  end;
  If Label3.Caption <> '' Then
     Label3.Visible := true;


  If TInject(Sender).Status in [Server_ConnectingNoPhone, Server_TimeOut] Then
  Begin
    if TInject(Sender).FormQrCodeType = Ft_Desktop then
    Begin
       if TInject(Sender).Status = Server_ConnectingNoPhone then
          TInject1.FormQrCodeStop;
    end else
    Begin
      if TInject(Sender).Status = Server_ConnectingNoPhone then
      Begin
        if not TInject(Sender).FormQrCodeShowing then
           TInject(Sender).FormQrCodeShowing := True;
      end else
      begin
        TInject(Sender).FormQrCodeReloader;
      end;
    end;
  end;
end;

procedure TfrmPrincipal.TInject1GetStatusMessage(
  const Result: TResponseStatusMessage);

var

  i: integer;

var

  AResult: String;

var

 cara: TResponseStatusMessage;

begin

  if FStatus = true then

  begin
    Lbl_Avisos.caption:= Result.id + ' - ' + Result.status;
  end else

    begin
      Lbl_Avisos.caption:=Result.id + ' - ' + Result.status;
    end;

end;



procedure TfrmPrincipal.TInject1GetUnReadMessages(Const Chats: TChatList);
var
  AChat: TChatClass;
  AMessage: TMessagesClass;
  contato, telefone: string;
  injectDecrypt: TInjectDecryptFile;
begin
    for AChat in Chats.result do
    begin
      for AMessage in AChat.messages do
      begin
        if not AChat.isGroup then //Não exibe mensages de grupos
        begin

          if not AMessage.sender.isMe then  //Não exibe mensages enviadas por mim
          begin
            case AnsiIndexStr(UpperCase(AMessage.&type), ['PTT', 'IMAGE', 'VIDEO', 'AUDIO', 'DOCUMENT']) of
              0: begin injectDecrypt.download(AMessage.deprecatedMms3Url, AMessage.mediaKey, 'mp3', AChat.id); end;
              1: begin injectDecrypt.download(AMessage.deprecatedMms3Url, AMessage.mediaKey, 'jpg', AChat.id); end;
              2: begin injectDecrypt.download(AMessage.deprecatedMms3Url, AMessage.mediaKey, 'mp4', AChat.id); end;
              3: begin injectDecrypt.download(AMessage.deprecatedMms3Url, AMessage.mediaKey, 'mp3', AChat.id); end;
              4: begin injectDecrypt.download(AMessage.deprecatedMms3Url, AMessage.mediaKey, 'pdf', AChat.id); end;
            end;
            sleepNoFreeze(100);
            FChatID := AChat.id;

            telefone  :=  Copy(AChat.id, 3, Pos('@', AChat.id) - 3);
            contato   :=  AMessage.Sender.pushName;

           // TInject1.ReadMessages(AChat.id);
            if (( UpperCase(trim(AMessage.body)) = 'SAIR')or( UpperCase(trim(AMessage.body)) = 'SAI')or( UpperCase(trim(AMessage.body)) = 'S'))  then
               begin   //o indivíduo não quer mais receber mensagens
                  FDQuery2.Close;
                  FDQuery2.SQL.Clear;
                  FDQuery2.SQL.Add(' INSERT INTO tb_blacklist(celular) ');
                  FDQuery2.SQL.Add(' SELECT '+quotedstr(telefone)+' WHERE NOT EXISTS ( ');
                  FDQuery2.SQL.Add(' SELECT 1 FROM tb_blacklist WHERE celular='+quotedstr(telefone));
                  FDQuery2.SQL.Add(' ); ');
                  FDQuery2.execsql;
                  FDQuery2.close;
               end;
          end;
        end;
      end;
    end;
end;

procedure TfrmPrincipal.TInject1IsConnected(Sender: TObject;
  Connected: Boolean);
begin
  if Connected = true then
  Lbl_Avisos.caption:='Conectado' else
  Lbl_Avisos.caption:='Desconectado'
end;

procedure TfrmPrincipal.TInject1LowBattery(Sender: TObject);
begin

  Lbl_Avisos.Caption    := 'Alarme de BATERIA.  Você está com ' + TInject(Sender).BatteryLevel.ToString + '%';
  Lbl_Avisos.Font.Color := clRed;

end;

procedure TfrmPrincipal.TInject1NewGetNumber(
  const vCheckNumber: TReturnCheckNumber);

begin
 if vCheckNumber.valid then
  Lbl_Avisos.caption:=vCheckNumber.id + ' é um numero Válido'
 else
  Lbl_Avisos.caption:=vCheckNumber.id + ' é um numero INVÁLIDO';
end;



procedure TfrmPrincipal.Manual4Click(Sender: TObject);
begin
  if not TInject1.Auth then
     Exit;

  TInject1.CheckIsConnected();
end;

procedure TfrmPrincipal.PageControl1Change(Sender: TObject);
  var i:integer;
begin
  if ((lblStatus.Caption = 'Offline') and (PageControl1.ActivePageIndex <> 0)and(PageControl1.ActivePageIndex <> 1)) then
     PageControl1.ActivePageIndex := 0;

  if not AtualizaTabelaEnvios then
    Lbl_Avisos.Caption :='Não foi possivel localizar os envios..';

  if PageControl1.ActivePageIndex = 4 then
  begin

    //Lista de envios
    FDQuery2.Close;
    FDQuery2.SQL.Clear;
    FDQuery2.SQL.Add('Select');
    FDQuery2.SQL.Add('id,');
    FDQuery2.SQL.Add('terminal, ');
    FDQuery2.SQL.Add('celular_servidor, ');
    FDQuery2.SQL.Add('celular_cliente,  ');
    FDQuery2.SQL.Add('mensagem,         ');
    FDQuery2.SQL.Add('arquivo_nome,     ');
    FDQuery2.SQL.Add('arquivo_tipo,     ');
    //FDQuery2.SQL.Add('arquivo,        ');
    FDQuery2.SQL.Add('data_hora_registro,');
    FDQuery2.SQL.Add('data_hora_envio,  ');
    FDQuery2.SQL.Add('status            ');
    FDQuery2.SQL.Add('from whatsapp_envios where data_hora_envio is not null and status = 1 order by id desc limit 400');
    FDQuery2.open;
    FDQuery2.first;
    SGListaEnvios.RowCount := 1;
    SGListaEnvios.RowCount := SGListaEnvios.RowCount+FDQuery2.RECORDcount;
    SGListaEnvios.Cells[0, 0]:='ID';
    SGListaEnvios.Cells[1, 0]:='TERMINAL';
    SGListaEnvios.Cells[2, 0]:='ORIGEM';
    SGListaEnvios.Cells[3, 0]:='DESTINO';
    SGListaEnvios.Cells[4, 0]:='MENSAGEM';
    SGListaEnvios.Cells[5, 0]:='ARQUIVO';
    SGListaEnvios.Cells[6, 0]:='DATA ENVIO';
    SGListaEnvios.ColWidths[0] := 60;
    SGListaEnvios.ColWidths[1] := 100;
    SGListaEnvios.ColWidths[2] := 100;
    SGListaEnvios.ColWidths[3] := 100;
    SGListaEnvios.ColWidths[4] := 400;
    SGListaEnvios.ColWidths[5] := 120;
    SGListaEnvios.ColWidths[6] := 120;
    i:=0;
    if not FDQuery2.eof  then repeat
      begin
       i:=i+1;
       SGListaEnvios.Cells[0, i] := FDQuery2.FieldByName('id').asstring;
       SGListaEnvios.Cells[1, i] := FDQuery2.FieldByName('terminal').asstring;
       SGListaEnvios.Cells[2, i] := FDQuery2.FieldByName('celular_servidor').asstring;
       SGListaEnvios.Cells[3, i] := FDQuery2.FieldByName('celular_cliente').asstring;
       SGListaEnvios.Cells[4, i] := FDQuery2.FieldByName('mensagem').asstring;
       SGListaEnvios.Cells[5, i] := FDQuery2.FieldByName('arquivo_nome').asstring+'.'+FDQuery2.FieldByName('arquivo_tipo').asstring;
       SGListaEnvios.Cells[6, i] := FDQuery2.FieldByName('data_hora_envio').asstring;
       FDQuery2.next;
      end;
    until FDQuery2.eof;

   //lista de não envios
FDQuery2.Close;
    FDQuery2.SQL.Clear;
    FDQuery2.SQL.Add('Select');
    FDQuery2.SQL.Add('id,');
    FDQuery2.SQL.Add('terminal, ');
    FDQuery2.SQL.Add('celular_servidor, ');
    FDQuery2.SQL.Add('celular_cliente,  ');
    FDQuery2.SQL.Add('mensagem,         ');
    FDQuery2.SQL.Add('arquivo_nome,     ');
    FDQuery2.SQL.Add('arquivo_tipo,     ');
    //FDQuery2.SQL.Add('arquivo,        ');
    FDQuery2.SQL.Add('data_hora_registro,');
    FDQuery2.SQL.Add('data_hora_envio,  ');
    FDQuery2.SQL.Add('status            ');
    FDQuery2.SQL.Add('from whatsapp_envios where data_hora_envio is null and status = 2 order by id desc limit 400');
    FDQuery2.open;
    FDQuery2.first;
    SGListaNaoEnvios.RowCount := 1;
    SGListaNaoEnvios.RowCount := SGListaNaoEnvios.RowCount+FDQuery2.RECORDcount;
    SGListaNaoEnvios.Cells[0, 0]  := 'ID';
    SGListaNaoEnvios.Cells[1, 0]  := 'TERMINAL';
    SGListaNaoEnvios.Cells[2, 0]  := 'ORIGEM';
    SGListaNaoEnvios.Cells[3, 0]  := 'DESTINO';
    SGListaNaoEnvios.Cells[4, 0]  := 'MENSAGEM';
    SGListaNaoEnvios.Cells[5, 0]  := 'ARQUIVO';
    SGListaNaoEnvios.Cells[6, 0]  := 'DATA REG';
    SGListaNaoEnvios.ColWidths[0] := 60;
    SGListaNaoEnvios.ColWidths[1] := 100;
    SGListaNaoEnvios.ColWidths[2] := 100;
    SGListaNaoEnvios.ColWidths[3] := 100;
    SGListaNaoEnvios.ColWidths[4] := 400;
    SGListaNaoEnvios.ColWidths[5] := 120;
    SGListaNaoEnvios.ColWidths[6] := 120;
    i:=0;
    if not FDQuery2.eof  then repeat
      begin
       i:=i+1;
       SGListaNaoEnvios.Cells[0, i] := FDQuery2.FieldByName('id').asstring;
       SGListaNaoEnvios.Cells[1, i] := FDQuery2.FieldByName('terminal').asstring;
       SGListaNaoEnvios.Cells[2, i] := FDQuery2.FieldByName('celular_servidor').asstring;
       SGListaNaoEnvios.Cells[3, i] := FDQuery2.FieldByName('celular_cliente').asstring;
       SGListaNaoEnvios.Cells[4, i] := FDQuery2.FieldByName('mensagem').asstring;
       SGListaNaoEnvios.Cells[5, i] := FDQuery2.FieldByName('arquivo_nome').asstring+'.'+FDQuery2.FieldByName('arquivo_tipo').asstring;
       SGListaNaoEnvios.Cells[6, i] := FDQuery2.FieldByName('data_hora_registro').asstring;
       FDQuery2.next;
      end;
    until FDQuery2.eof;

    FDQuery2.Close;
    FDQuery2.SQL.Clear;
    FDQuery2.SQL.Add('Select* from whatsapp_blacklist order by id desc');
    FDQuery2.open;
    FDQuery2.first;
    SGBList.RowCount := 1;
    SGBList.RowCount := SGBList.RowCount+FDQuery2.RECORDcount;
    SGBList.Cells[0, 0]:='ID';
    SGBList.Cells[1, 0]:='CELULAR';
    SGBList.ColWidths[0] := 60;
    SGBList.ColWidths[1] := 100;
    i:=0;

    if not FDQuery2.eof  then repeat
      begin
       i:=i+1;
       SGBList.Cells[0, i] := FDQuery2.FieldByName('id').asstring;
       SGBList.Cells[1, i] := FDQuery2.FieldByName('celular').asstring;
       FDQuery2.next;
      end;
    until FDQuery2.eof;

  end;

end;

procedure TfrmPrincipal.PararEnvio1Click(Sender: TObject);
begin
   vPararEnvio:=true;
   FDQuery1.EnableControls;
end;

procedure TfrmPrincipal.PopupMenu21Click(Sender: TObject);
begin
   if ExcluiRegistroBDLocal(FDQuery1.FieldByName('id').AsInteger) then
      Lblstatus.Caption:='Impossivel excluir';
   BBAtualizar.Click;
end;

procedure TfrmPrincipal.Reenviar1Click(Sender: TObject);
var vpergunta  : string;
begin
  if SGListaEnvios.Row > 0 then
       begin
          vpergunta := 'Deseja Reenviar a mensagem '+SGListaNaoEnvios.Cells[0,SGListaEnvios.Row]+' para '+SGListaEnvios.Cells[3,SGListaEnvios.Row]+'?';
          IF APPLICATION.MessageBox(pWideChar(vpergunta),'ATENÇÃO ',MB_YESNO + MB_ICONWARNING)=MRYES THEN
             begin
                FDQuery2.Close;
                FDQuery2.SQL.Clear;
                FDQuery2.SQL.Add(' update whatsapp_envios set status = 0, data_hora_envio = null  WHERE id = '+SGListaEnvios.Cells[0,SGListaEnvios.Row]+'; ');
                FDQuery2.execsql;
                PageControl1Change(self);
                memo_log.lines.Add('REENVIO: '+vpergunta);
                timer1.Interval := 1000;
             end;
       end;
  PageControl1Change(self);
end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin

      if not TInject1.Auth(false) then
      Begin
        TInject1.FormQrCodeType := TFormQrCodeType(1);
        TInject1.FormQrCodeStart;
      End;

      if not TInject1.FormQrCodeShowing then
         TInject1.FormQrCodeShowing := True;


end;

procedure TfrmPrincipal.SpeedButton2Click(Sender: TObject);
var i:integer;
begin
  if (OpenDialog2.Execute) then
  begin
    { Percorrendo a lista de arquivos selecionados. }
    for I := 0 to OpenDialog2.Files.Count - 1 do
      begin
        if OpenDialog2.Files[I] <>'' then
         MMFiles.lines.add(OpenDialog2.Files[I]);
      end;
  end;


end;

procedure TfrmPrincipal.SpeedButton3Click(Sender: TObject);
begin
  if not TInject1.auth then
    exit;

   TInject1.Logtout;
   TInject1.Disconnect;
end;

procedure TfrmPrincipal.Statusdabateria2Click(Sender: TObject);
begin
  if not TInject1.Auth then
     Exit;

  TInject1.GetBatteryStatus;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin      //so executar importação e processamento quando acabar todos os registros

   if ((FDQuery1.RecordCount > 0)and(CBAutomatico.Checked)) then
      begin
        try
         timer1.interval := 0;
         btn_importar_listaClick(self);
         btn_processar_listaClick(self);
        except
          timer1.interval := 3000;
        end;

      end;
   timer1.interval := 3000;
end;

procedure TfrmPrincipal.TrayIcon1Click(Sender: TObject);
begin
  TrayIcon1.Visible := False;
  Show();
  WindowState := wsNormal;
  Application.BringToFront();
end;



end.
