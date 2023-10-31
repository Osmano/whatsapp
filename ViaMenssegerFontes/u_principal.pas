unit u_principal;

interface

uses

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms,  Vcl.ExtCtrls, StrUtils,
 System.Zip, Math,  System.IoUtils , System.Types,



    IdMultipartFormData,  System.JSON,

  System.JSON.Writers,System.JSON.readers,System.JSON.Types,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Client,


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
  FireDAC.Comp.Client, FireDAC.Phys.PGDef, FireDAC.Phys.PG;

type
  TfrmPrincipal = class(TForm)
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
    btnProcessarLista: TButton;
    CBAutomatico: TCheckBox;
    IdHTTP1: TIdHTTP;
    HTTPReqResp1: THTTPReqResp;
    NetHTTPRequest1: TNetHTTPRequest;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    TabSheet5: TTabSheet;
    MMMalaDireta: TMemo;
    Label1: TLabel;
    Label8: TLabel;
    BtnCriarMalaDireta: TButton;
    MMCelulares: TMemo;
    OpenDialog2: TOpenDialog;
    SpeedButton2: TSpeedButton;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    FDQuery2: TFDQuery;
    Label9: TLabel;
    BBAtualizar: TBitBtn;
    PopupMenu2: TPopupMenu;
    PopupMenu21: TMenuItem;
    MMFiles: TMemo;
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
    FDConnection1: TFDConnection;
    PGLink: TFDPhysPgDriverLink;
    Timer1: TTimer;
    SGListaNaoEnvios: TStringGrid;
    Label2: TLabel;
    PopupMenu3: TPopupMenu;
    PopupMenu31: TMenuItem;
    LabelRegistro: TLabel;
    TInject1: TInject;
    Button1: TButton;
    PopupMenu4: TPopupMenu;
    Excluir1: TMenuItem;
    Excluir2: TMenuItem;
    Reenviar1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Excluir3: TMenuItem;
    N7: TMenuItem;
    Panel1: TPanel;
    Edit1: TEdit;
    Label4: TLabel;
    Button2: TButton;
    Panel3: TPanel;
    LbBanco: TLabel;
    PopupMenu5: TPopupMenu;
    PopupMenu51: TMenuItem;
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
    procedure btnProcessarListaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PopupMenu21Click(Sender: TObject);
    procedure BtnCriarMalaDiretaClick(Sender: TObject);
    procedure PararEnvio1Click(Sender: TObject);
    procedure ExcluirdoBackList1Click(Sender: TObject);
    procedure ExcluirTodos1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BBAtualizarClick(Sender: TObject);
    procedure CBAutomaticoClick(Sender: TObject);
    procedure PopupMenu31Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Reenviar1Click(Sender: TObject);
    procedure Excluir2Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure Excluir3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure PopupMenu51Click(Sender: TObject);


  private
    { Private declarations }
    FIniciando: Boolean;
    FStatus: Boolean;
    FNameContact:  string;
    FChatID: string;

    function trata_numero(numero: string): string;


    function AtualizaRegistroBDLocal(idMsg, status: integer; enviado:boolean): boolean;


    function AtualizaTabelaEnvios(Limite:integer):boolean;
    function ExcluiRegistroBDLocal(idMsg: integer): boolean;
    function GetRegistro(): boolean;

    procedure ExcluirArquivos(Diretorio: string; Sub:Boolean);
    procedure ProcessarLista();


  public
    { Public declarations }
    mensagem  : string;
    AFile     : string;

    procedure AddChatList(ANumber: String);
    procedure AddContactList(ANumber: String);
    procedure AddGroupList(ANumber: string);
    procedure AddGroupAdmins(ANumber: string);
    procedure AddGroupContacts(ANumber: string);
    function conectar():boolean;

  end;

var
  frmPrincipal: TfrmPrincipal;

RegistrosEnviar : integer = 0;

ddi            : string = '55';
ddd            : string = '63';
extensao       : string = '@c.us';

implementation

uses

  Datasnap.DBClient, Winapi.ShellAPI, System.AnsiStrings, IniFiles, UConfiguracao;

{$R *.dfm}
var
  ArquivoINI   : TIniFile;
  vPararEnvio  : boolean=false;
  vGPathViaERP : string = '';
  vGIdMensagem : integer = 0;
  vGBlacList   : integer = 0;
  tempo        : integer = 1000;

  Database,  Server,  Port,  User_Name,  Password    : string;

//nome do computador
function NomeComputador : String;
var
  lpBuffer : PChar;
  nSize : DWord;
const Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
  nSize := Buff_Size;
  lpBuffer := StrAlloc(Buff_Size);
  GetComputerName(lpBuffer,nSize);
  Result := String(lpBuffer);
  StrDispose(lpBuffer);
end;

//procedimento responsavel por compactar qualquer arquivo em formato zip
procedure compactarZip(const arquivo_pasta, arquivo_nome, arquivo_extensao: string);
var
  ZipFile: TZipFile;
begin
  ZipFile := TZipFile.Create;
  try
    ZipFile.Open(arquivo_pasta+arquivo_nome+'.zip', zmWrite);
    ZipFile.Add(arquivo_pasta+arquivo_nome+'.'+arquivo_extensao);
  finally
    ZipFile.Free;
  end;
end;

//procedimento responsavel por descompactar qualquer arquivo em formato zip
procedure descompactarZip(const arquivo_pasta, arquivo_nome, arquivo_extensao: string);
var
   UnZipper: TZipFile;
   vlcaminho, vlarquivo, vlextensao:string;
begin

  UnZipper := TZipFile.Create();
  try
    try
    vlCaminho := arquivo_pasta;
    vlarquivo :=  arquivo_nome;
    vlextensao:= arquivo_extensao;

    UnZipper.Open(arquivo_pasta+arquivo_nome+vlextensao, zmRead);
    UnZipper.ExtractAll(arquivo_pasta);
    UnZipper.Close;
    except
      showmessage('não foi encontrado nada zipado');
    end;
  finally
    FreeAndNil(UnZipper);
  end;
end;

//procedimento para converter aquivo em base64
procedure ConvertFileToBase64(const AInFileName, AOutFileName: string);
var
  inStream: TStream;
  outStream: TStream;
begin
  inStream := TFileStream.Create(AInFileName, fmOpenRead);
  try
    outStream := TFileStream.Create(AOutFileName, fmCreate);
    try
      TNetEncoding.Base64.Encode(inStream, outStream);
    finally
      outStream.Free;
    end;
  finally
    inStream.Free;
  end;
end;

//procedimento para converter base64 em arquivo
procedure ConvertBase64ToFile(const base64: String; const FileName: string);
var
  stream: TBytesStream;
begin
  stream := TBytesStream.Create(TNetEncoding.Base64.DecodeStringToBytes(base64));
  try
    stream.SaveToFile(Filename);
  finally
    stream.Free;
  end;
end;


//end procedimentos para usar banco de dados -----------------------------------

function ComputerName():String;
var
  ComputerName: Array [0 .. 256] of char;
  Size: DWORD;
begin
  Size := 256;
  GetComputerName(ComputerName, Size);
  Result := ComputerName;
end;

function GetStrNumber(const S: string): string;
var
  vText : PChar;
begin
  vText := PChar(S);
  Result := '';

  while (vText^ <> #0) do
  begin
    {$IFDEF UNICODE}
    if CharInSet(vText^, ['0'..'9']) then
    {$ELSE}
    if vText^ in ['0'..'9'] then
    {$ENDIF}
      Result := Result + vText^;

    Inc(vText);
  end;
end;

//function TfrmPrincipal.conectar(Server, Port, User_Name, Password,  Database:string):boolean;
function TfrmPrincipal.conectar():boolean;
var
  Ini: TIniFile;
  arquivoini:string;
begin
   try
    vGPathViaERP := Copy(ExtractFileDir(Application.ExeName), 1, LastDelimiter('\', ExtractFileDir(Application.ExeName)));
    arquivoini := extractfilepath(application.exename)+'whatsappconfig.ini';
    Ini := TIniFile.Create(arquivoini);

    Database := Ini.ReadString('BANCO', 'SELECIONADO', 'postgres');
    Server   := Ini.ReadString('SERVIDOR', 'SELECIONADO', '127.0.0.1');
    Port     := Ini.ReadString('PORTA', 'SELECIONADO', '5432');

    Ini.Free;

    //criando pasta temporaria
    if not DirectoryExists(ExtractFileDir(Application.ExeName)+'\temp') then
       ForceDirectories(ExtractFileDir(Application.ExeName)+'\temp');

    FDConnection1.Connected := false;
    FDConnection1.close;
    if Database <> '' then
       begin
          User_Name := 'ViaERP';
          Password  := 'Via7216';

          FDConnection1.Params.DriverID             := 'PG';
          FDConnection1.Params.Values['Database']   := Database;
          FDConnection1.Params.Values['Server']     := Server;
          FDConnection1.Params.Values['Port']       := Port;
          FDConnection1.Params.Values['User_Name']  := User_Name;
          FDConnection1.Params.Values['Password']   := Password;

          pgLink.VendorLib := vGPathViaERP + '\libpq.dll';
          FDConnection1.Connected := true;
          LbBanco.Color := clblue;
          LbBanco.Font.Color := clwhite;

          LbBanco.Caption := 'Host:'+Server+#13+'Banco: '+Database+#13+'Status: CONECTADO';

          result := true;
       end
     else
       result := false;
   Except
     LbBanco.Color := clred;
     LbBanco.Font.Color := clwhite;
     LbBanco.Caption := 'Host: '+Server+#13+'Banco: '+Database+#13+'Status: NÃO CONECTADO';
     memo_log.lines.Add('O Sistema não conseguiu localizar as livrarias de conexão do PG. Confira se as mesmas estão na pasta do ViaERP');

     result := false;
   end;
end;

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

     numero_limpo := numero ;
     result := trim(numero_limpo);

    if length(numero) = 14 then
       begin //o numero parece com isso  02163992893682
         if (copy(numero, 0,1) = '0') then
            begin
                Delete(numero, 1, 3);
                ddd := copy(numero,0,2);
            end;
       end
    else
        if length(numero) = 13 then
           begin //o numero parece com isso  2163992893682
             if (copy(numero, 0,1) <> '0') then
                begin
                    Delete(numero, 1, 1);
                    ddd := copy(numero,0,2);
                end;
           end
     else
        if length(numero) = 12 then
           begin //o numero parece com isso  063992893682
             if (copy(numero, 0,1) = '0') then
                begin
                  Delete(numero, 1, 1);
                  ddd := copy(numero,0,2);
                end;
           end
      else
    if length(numero) = 11 then //os demais prefixos naõ requerem o nono digito
       begin //o numero parece com isso  63992893682
         ddd := copy(numero,0,2);
         numero_limpo := copy(numero, (length(numero) -7),(length(numero) -0));
       end
    else
      if length(numero) = 10 then
         begin //o numero parece com isso 6392893682
           ddd := copy(numero,0,2);
           numero_limpo := copy(numero, (length(numero) -7),(length(numero) -0));
         end;

//    if not ContainsText('81, 82, 83, 84, 85, 86, 87, 88, 89, 31, 32, 33, 34, 35, 37, 38, 71, 73, 74, 75, 77, 79',ddd) then
//      begin
//         ddd := ddd + '9';
//      end;


  result := trim(ddd+numero_limpo); // 6392893682
  result := result;
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
  FreeAndNil(GlobalCEFApp); //descomentado para fechar a aplicação
end;


procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var vlLog : TstringList;
  vlfechado:string;
begin
   vlFechado := 'Fechado em: '+formatdatetime('dd MMMM YYYY H:m:s',now);

  vlLog := TstringList.create;
  vlLog.clear;

  if not fileexists(extractfilepath(application.exename)+'\temp\log.log') then
    begin
      vlLog.CommaText := memo_log.Lines.CommaText;
      vlLog.Add(vlFechado);
      vlLog.SaveToFile(extractfilepath(application.exename)+'\temp\log.log');
    end
  else
    begin
      vlLog.loadfromfile(extractfilepath(application.exename)+'\temp\log.log');
      vlLog.CommaText := vlLog.CommaText+memo_log.Lines.CommaText;
      vlLog.Add(vlFechado);
      vlLog.SaveToFile(extractfilepath(application.exename)+'\temp\log.log');
    end;
end;

function TfrmPrincipal.AtualizaTabelaEnvios(Limite:integer):boolean;
var vlcelular_servidor : string;
begin
  if FDConnection1.Connected = True then
    begin
      try
        vlcelular_servidor := trata_numero(Edt_Numero_Conectado.text);
        vlcelular_servidor := ReverseString(vlcelular_servidor);
        vlcelular_servidor := Copy(vlcelular_servidor, 1, 8);
        vlcelular_servidor := ReverseString(vlcelular_servidor);

        //vou ver se tem registros novos
        FDQuery2.Close;
        FDQuery2.FieldDefs.Clear;
        FDQuery2.DisableControls;
        FDQuery2.SQL.Clear;
        FDQuery2.SQL.Add(' SELECT  count(*) FROM whatsapp_envios where celular_servidor like '+quotedstr('%'+vlcelular_servidor)+' and status = 0 limit '+inttostr(Limite)+';  ');

        FDQuery2.OPEN;
        FDQuery2.EnableControls;
        if ((FDQuery2.recordcount > 0)and (FDQuery2.FieldByName('count').asinteger <> RegistrosEnviar )) then
           begin
              FDQuery1.Close;
              FDQuery1.DisableControls;
              FDQuery1.SQL.Clear;
              FDQuery1.SQL.Add(' SELECT* FROM whatsapp_envios where celular_servidor like '+quotedstr('%'+vlcelular_servidor+'%')+' and status = 0 limit '+inttostr(Limite)+';  ');
              FDQuery1.OPEN;
              RegistrosEnviar := FDQuery1.recordcount;
              FDQuery1.EnableControls;
           end;

        result := true;
      except
        result := false;
        memo_log.lines.Add('Erro ao selecionar envios..');
      end;
    end
  else
    begin
      result := false;
      memo_log.lines.Add('Erro de conexao...');
    end;
end;

function TfrmPrincipal.AtualizaRegistroBDLocal(idMsg, status:integer; enviado:boolean):boolean;
  var
    vlDataHoraEnvio : string;
begin
  if FDConnection1.Connected = True then
    begin
      try
        if enviado then
           vlDataHoraEnvio := 'data_hora_envio = now(),'
        else
          begin
           vlDataHoraEnvio := '';
           status := 2;
          end;
        FDQuery2.Close;
        FDQuery2.SQL.Clear;
        FDQuery2.SQL.Add(' UPDATE whatsapp_envios  SET '+vlDataHoraEnvio+'  status = '+inttostr(status)+'  WHERE id = '+inttostr(idMsg)+'; ');
        FDQuery2.execsql;
        result := true;
      except
        memo_log.lines.Add('Não foi possível atualizar a mensagem "'+inttostr(idMsg)+'" no banco. ');
        result := false;
      end;
    end
  else
    begin
      memo_log.lines.Add('Não há conexão com o banco de dados local.') ;
      result := false;
    end;
end;

function TemAtributo(Attr, Val: Integer): Boolean;
begin
   Result := Attr and Val = Val;
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
                    FDQuery2.SQL.Add(' DELETE from whatsapp_envios WHERE id = '+SGListaEnvios.Cells[0,SGListaEnvios.Row]+' and status = 1; ');
                    FDQuery2.execsql;
                    memo_log.lines.Add('Excluido: '+SGListaEnvios.Cells[1,SGListaEnvios.Row]);
                  end;
             end;
     end;
     PageControl1Change(self);
end;

procedure TfrmPrincipal.Excluir3Click(Sender: TObject);
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
                FDQuery2.SQL.Add(' DELETE from whatsapp_blacklist WHERE id = '+SGBList.Cells[0,SGBList.Row]+'; ');
                FDQuery2.execsql;

                FDQuery2.Close;
                FDQuery2.SQL.Clear;
                FDQuery2.SQL.Add('Select* from whatsapp_blacklist');
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

procedure TfrmPrincipal.ExcluirArquivos(Diretorio: string; Sub: Boolean);
var
  F: TSearchRec;
  Ret: Integer;
  TempNome: string;
  i:integer;
  vlextensao:string;

  arquivos: TStringDynArray;
  arquivo: string;
const                                      // 1       2        3      4       5
  Arrayextensoes: array[1..5] of string = ('.pdf', '.enc', '.mp3', '.pdf', '.jpg');

begin
  Ret := FindFirst(Diretorio+'\*.*', faAnyFile, F);
  try
    while Ret = 0 do
    begin
      if TemAtributo(F.Attr, faDirectory) then
        begin
          if (F.Name <> '.') And (F.Name <> '..') then
            if Sub = True then
            begin
              TempNome := Diretorio+'\' + F.Name;
              ExcluirArquivos(TempNome, True);
            end;
        end
      else
        begin
          vlextensao := '';
          for i := 1 to 5 do
            begin
              vlextensao := Arrayextensoes[i];

              if ExtractFileExt(Diretorio+'\'+F.Name)= vlextensao then
              begin
                 deletefile(Diretorio+'\'+F.Name);
              end;
            end;

        end;
        Ret := FindNext(F);
    end;
  finally
    begin
      FindClose(F);
    end;
  end;

  try
    if TDirectory.Exists(Diretorio) then
    begin
      // obtem todos os arquivos dentro do diretório.
      arquivos := TDirectory.GetFiles(Diretorio);

      // deleta todos os arquivos.
      for arquivo in arquivos do
      begin
        TFile.Delete(arquivo);
      end;

      // se não existir mais arquivos, remove o diretorio.
      if TDirectory.IsEmpty(Diretorio) then
      begin
        TDirectory.Delete(Diretorio);
      end;
    end;
  except

  end;
end;

procedure TfrmPrincipal.ExcluirdoBackList1Click(Sender: TObject);
var vpergunta : string;
i:integer;
begin
  if SGBList.Row > 0 then
     begin
          vpergunta := 'Deseja excluir todos da BLACLIST? Esses clientes não querem contato...';
          IF APPLICATION.MessageBox(pWideChar(vpergunta),'ATENÇÃO ',MB_YESNO + MB_ICONWARNING)=MRYES THEN
             begin
                for i := 1 to SGBList.RowCount -1 do
                begin
                   if SGBList.Row > 0 then
                      begin
                        FDQuery2.Close;
                        FDQuery2.SQL.Clear;
                        FDQuery2.SQL.Add(' DELETE from whatsapp_blacklist WHERE id = '+SGBList.Cells[0,SGBList.Row]+'; ');
                        FDQuery2.execsql;
                      end;
                end;

                FDQuery2.Close;
                FDQuery2.SQL.Clear;
                FDQuery2.SQL.Add('Select* from whatsapp_blacklist');
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
           begin
            FDQuery2.SQL.Add(' DELETE from whatsapp_envios WHERE id > 0 and status = 0;');
           end
        else
          FDQuery2.SQL.Add(' DELETE from whatsapp_envios WHERE id = '+inttostr(idMsg)+'; ');
        FDQuery2.execsql;
        result := true;
      except
        memo_log.lines.Add('Não foi possível EXCLUIR do banco. ');
        result := false;
      end;
    end
  else
    begin
      memo_log.lines.Add('Não há conexão com o banco de dados local.') ;
      result := false;
    end;
end;

procedure TfrmPrincipal.ExcluirTodos1Click(Sender: TObject);
begin   //zero para excluir todos
   if ExcluiRegistroBDLocal(0) then
      memo_log.lines.Add('Impossivel excluir');
   BBAtualizar.Click;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var i:integer;
begin  //criar banco de dados local
  PageControl1.ActivePageIndex := 0;

  if (conectar()) then
  else
    memo_log.lines.Add('impossivel conectar');

  if fileexists(extractfilepath(application.ExeName)+'\img\logo.png') then
     ImgEmpresa.Picture.LoadFromFile(extractfilepath(application.ExeName)+'\img\logo.png');
   ImgEmpresa.Repaint;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  frmPrincipal.TOP:= SCREEN.WorkAreaHeight- frmPrincipal.HEIGHT;
  frmPrincipal.LEFT:=SCREEN.WorkareaWidth- frmPrincipal.WIDTH;
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


procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  sleep(5000);
  ExcluirArquivos(extractfilepath(application.exename)+'cache\Cache\Cache_Data\', true);
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  frmConfig.showmodal;
  if UConfiguracao.vgconectar then
     begin
       if (conectar()) then
          else
            memo_log.lines.Add('impossivel conectar');
     end;
end;

procedure TfrmPrincipal.BBAtualizarClick(Sender: TObject);
begin
  Timer1.Interval := tempo;
end;

procedure TfrmPrincipal.BtnCriarMalaDiretaClick(Sender: TObject);
var i, ii:integer;
base64:Tstringlist;
 vDestino, vMSG : WideString;
 Tamanho, ArquivoCompleto, Arquivonome, Extensao, caminho:String;
 vlPath:string;
begin
  vlPath:= extractfilepath(application.exename);
  memo_log.Lines.Add('Enviando Mala Direta') ;

  for i := 0 to MMCelulares.Lines.Count -1  do
    begin
      vDestino := MMCelulares.Lines[i];

      if ((MMMalaDireta.Lines.Text <>'')and( MMCelulares.Lines[i]<>'')) then
        begin

         vMSG  := MMMalaDireta.Lines.Text;
         // gravar mensagem no banco
          if (MMFiles.Lines.Count > 0) then
          for ii := 0 to MMFiles.Lines.Count - 1  do
            begin
               ArquivoCompleto := MMFiles.Lines[ii];
               Extensao:=ExtractFileExt(ArquivoCompleto);
               Delete( Extensao, 1, 1 );
               Arquivonome := ChangeFileExt(extractfilename(ArquivoCompleto), EmptyStr);
               ConvertFileToBase64(MMFiles.Lines[ii],vlPath+'temp/base64.txt');
               Base64:=Tstringlist.create;
               Base64.clear;
               Base64.LoadFromFile(vlPath+'temp/base64.txt');
               // gravar arquivo no banco  no formato base 64
               FDQuery2.Close;
               FDQuery2.SQL.Clear;

               FDQuery2.SQL.Add('INSERT INTO whatsapp_envios ( terminal, celular_servidor, celular_cliente, mensagem, arquivo_nome, arquivo_tipo, arquivo, data_hora_registro, status )');
               FDQuery2.SQL.Add('VALUES ');
               FDQuery2.SQL.Add('	( '+quotedstr(NomeComputador)+
               ', '+quotedstr(trata_numero(trim(Edt_Numero_Conectado.text)))+
               ', '+quotedstr(trata_numero(vDestino))+
               ', '+quotedstr(vMSG)+
               ', '+quotedstr(Arquivonome)+
               ', '+quotedstr(Extensao)+
               ', '+quotedstr(Base64.text)+
               ', '+quotedstr(formatdatetime('dd/MM/yyyy hh:nn:ss',now))+', 0 );');
               FDQuery2.execsql;
               Base64.free;
               deletefile(vlPath+'temp/base64.txt');
            end
          else
            begin
               FDQuery2.Close;
               FDQuery2.SQL.Clear;

               FDQuery2.SQL.Add('INSERT INTO whatsapp_envios ( terminal, celular_servidor, celular_cliente, mensagem, data_hora_registro, status )');
               FDQuery2.SQL.Add('VALUES ');
               FDQuery2.SQL.Add('	( '+quotedstr(NomeComputador)+
               ', '+quotedstr(trata_numero(trim(Edt_Numero_Conectado.text)))+
               ', '+quotedstr(trata_numero(vDestino))+
               ', '+quotedstr(vMSG)+
               ', '+quotedstr(formatdatetime('dd/MM/yyyy hh:nn:ss',now))+', 0 );');
               FDQuery2.execsql;
            end;

        end;

        vDestino:= '';

    end;


  vMSG:='';
  MMCelulares.Clear;
  MMFiles.clear;
  MMMalaDireta.clear;


  PageControl1.ActivePageIndex := 2;
  Timer1.Interval := tempo;
end;

procedure TfrmPrincipal.btnProcessarListaClick(Sender: TObject);
begin
  ProcessarLista;
end;

function TfrmPrincipal.GetRegistro():boolean;
 //http://viatechsistemas.com.br:1005/ViaKey/v1/getRegisterByCnpj?code=25408157000181&id_produto=4
var cnpj: string;
  JSonValue : TJSonValue;

var lURL : String;//variaveis do registro
    lResponse : TStringStream;
    lLista : TstringList;

  Branch : string;
begin
  try
    FDQuery2.Close; //o cliente quer receber mensagens????
    FDQuery2.SQL.Clear;
    FDQuery2.SQL.Add('select* from empresas;');
    FDQuery2.open;

    // cnpj:= '25408157000181';//viatech

    cnpj := FDQuery2.fieldbyname('cnpj').asstring;
    cnpj := GetStrNumber(cnpj);

    if cnpj <> '07353150000128' then
       begin

          lResponse := TStringStream.Create('');
          lLista := TstringList.create;
          lLista.Clear;
                          //07.353.150/0001-28  liberar
          lURL := 'http://viatechsistemas.com.br:1005/ViaKey/v1/getRegisterByCnpj?' +
          'code='+cnpj+
          '&id_produto=4';
          idHttp1.Get(lURL, lResponse);
          lResponse.Position := 0;

          lLista.LoadFromStream(lResponse);
          JsonValue := TJSonObject.ParseJSONValue(lLista.text);
          Branch := JsonValue.GetValue<string>('produto_liberado');

          JsonValue.Free;
          lLista.DisposeOf;
          if Branch = '1' then
             LabelRegistro.Caption := 'Registrado para o CNPJ: '+FDQuery2.fieldbyname('cnpj').asstring;
             BEGIN
                result:=true;
             END;
       end
    else //usando o cnpj da viatech
       begin
          LabelRegistro.Caption := 'Registrado para VIATECH';
          result:=true;
       end;
    if(fileexists('D:\Viatech\Projetos\vbs\ProjectGroup\ViaERPBuilder.groupproj')) then
       begin
          LabelRegistro.Caption := 'Laboratorio';
          result:=true;
       end
  except
    LabelRegistro.Caption := 'SISTEMA NÃO REGISTRADO';
    result:=false;
    if(fileexists('D:\Viatech\Projetos\vbs\ProjectGroup\ViaERPBuilder.groupproj')) then
       begin
          LabelRegistro.Caption := 'Laboratorio';
          result:=true;
       end
  end;

end;


procedure TfrmPrincipal.ProcessarLista();
var i:integer;
vlBase64 : TstringList;
vlArquivoEnviar : string;
begin
     vGBlacList := 0;
   //   try
           FDQuery1.refresh;
           if FDQuery1.RecordCount > 0 then
              begin
                 Timer1.Interval := 0;
                 FDQuery1.first;
                 FDQuery1.DisableControls;
                 if not FDQuery1.Eof  then  repeat
                    begin
                      //tem texto na mensagens????      //o cliente possui um celular válido????
                      if (((length(trim(FDQuery1.fieldbyname('arquivo_tipo').AsString))>0)or(length(trim(FDQuery1.fieldbyname('mensagem').AsString))>0))and (length(trim(FDQuery1.fieldbyname('celular_cliente').AsString))>0))  then
                        begin
                          try
                            FDQuery2.Close;             //o cliente quer receber mensagens????
                            FDQuery2.SQL.Clear;
                            FDQuery2.SQL.Add('SELECT * FROM whatsapp_blacklist WHERE celular = '''+trata_numero(trim(FDQuery1.fieldbyname('celular_cliente').AsString))+''' ');
                            FDQuery2.open;
                            if FDQuery2.RecordCount = 0 then
                             vGBlacList := 1  //o cliente não ta na blacklist
                            else
                             vGBlacList := 2;//o cliente ta na blacklist
                            if (length(trim(FDQuery1.fieldbyname('arquivo_tipo').AsString))>0)  then
                                begin   //existe arquivo alem da mensagem?
                                   vlBase64 := TstringList.create;
                                   vlBase64.clear;

                                   //vamos criar o arquivo
                                   vlBase64.Text := FDQuery1.fieldbyname('arquivo').AsString;
                                   vlArquivoEnviar := vGPathViaERP+'\whatsapp\temp\'+ FDQuery1.fieldbyname('arquivo_nome').AsString;
                                   vlBase64.SaveToFile(vlArquivoEnviar +'.txt');

                                   ConvertBase64ToFile(vlBase64.Text,vlArquivoEnviar+'.'+FDQuery1.fieldbyname('arquivo_tipo').AsString);

                                   vlArquivoEnviar := vlArquivoEnviar;
                                   if (length(trim(FDQuery1.fieldbyname('arquivo').AsString))>0)  then
                                       begin //é mensagem e texto e arquivo???
                                        TInject1.SendFile(trata_numero(trim(FDQuery1.fieldbyname('celular_cliente').AsString)), vlArquivoEnviar+'.'+FDQuery1.fieldbyname('arquivo_tipo').AsString, trim(FDQuery1.fieldbyname('mensagem').AsWideString));
                                       end
                                   else
                                       begin //é somente arquivo
                                         TInject1.SendFile(trata_numero(trim(FDQuery1.fieldbyname('celular_cliente').AsString)), vlArquivoEnviar+'.'+FDQuery1.fieldbyname('arquivo_tipo').AsString, FDQuery1.fieldbyname('arquivo_nome').AsString+'.'+FDQuery1.fieldbyname('arquivo_tipo').AsString );
                                       end;
                                   vlBase64.free;
                                   vGIdMensagem := FDQuery1.fieldbyname('id').asinteger;

                                   if fileexists(vlArquivoEnviar+'.txt') then
                                      DeleteFile(vlArquivoEnviar+'.txt');

                                   if fileexists(vlArquivoEnviar+'.'+FDQuery1.fieldbyname('arquivo_tipo').AsString) then
                                      DeleteFile(vlArquivoEnviar+'.'+FDQuery1.fieldbyname('arquivo_tipo').AsString);

                                end
                            else //não veio arquivo. Veio somente a mensagem
                                begin
                                  vGIdMensagem := FDQuery1.fieldbyname('id').asinteger;
                                  TInject1.send(trata_numero(trim(FDQuery1.fieldbyname('celular_cliente').AsString)), trim(FDQuery1.fieldbyname('mensagem').AsWideString));

                                end;
                           if AtualizaRegistroBDLocal(vGIdMensagem, vGBlacList, true) then
                               begin
                                  memo_log.Lines.Add('Enviado: '+vlArquivoEnviar);
                               end;
                           tempo := RandomRange( 1000, 4000 );

                          Except
                            if  AtualizaRegistroBDLocal(vGIdMensagem, vGBlacList, false) then memo_log.Lines.Add('Nao enviado.') ;
                            memo_log.Lines.Add('Erro: '+vlArquivoEnviar) ;
                          end;

                        end;
                          if vPararEnvio then
                             break;


                        tempo := RandomRange( 1000, 4000 );

                        FDQuery1.next;
                     end;
                 until FDQuery1.eof;
                 FDQuery1.EnableControls;

              end;
   //   except
       vPararEnvio:=false;
       FDQuery1.EnableControls;
       Timer1.Interval := tempo;
    //  end;



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
  Timer1.Interval := 1;
end;

procedure TfrmPrincipal.Edit1Change(Sender: TObject);
  var j:integer;
begin
  For j:= 1 to SGListaEnvios.RowCount do
    begin
      if length(Edit1.text)> 4 then
         begin
            if Pos(Edit1.text, SGListaEnvios.Cells[3, j]) > 0 then
            BEGIN
              SGListaEnvios.Row := j;
              break;
            END;
         end;
    end;
end;

procedure TfrmPrincipal.Edt_cabecalho_mensagemExit(Sender: TObject);
begin
  Edt_cabecalho_mensagem.ReadOnly := true;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
   try
     Timer1.Interval := 0;
     if not AtualizaTabelaEnvios(1) then
        memo_log.lines.Add('Não foi possivel localizar os envios..');

     if CBAutomatico.Checked then
        begin
          ProcessarLista;
        end;
   except
     Timer1.Interval := tempo;
   end;

   Timer1.Interval := tempo;
end;

procedure TfrmPrincipal.TInject1Disconnected(Sender: TObject);
begin
  memo_log.lines.Add('Conexão foi finalizada');
end;

procedure TfrmPrincipal.TInject1DisconnectedBrute(Sender: TObject);
begin
  memo_log.lines.Add('Conexão foi finalizada pelo celular');
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
         // if not AMessage.sender.isMe then
          if AMessage.self = 'in' then  //Não exibe mensages enviadas por mim
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

              //TInject1.ReadMessages(AChat.id);
              caption := AMessage.body;
              if ((AMessage.body = 'sair') or( UpperCase(trim(AMessage.body)) = 'SAIR')or( UpperCase(trim(AMessage.body)) = 'SAI')or( UpperCase(trim(AMessage.body)) = 'Siar'))  then
                 begin   //o indivíduo não quer mais receber mensagens
                    FDQuery2.Close;
                    FDQuery2.SQL.Clear;
                    FDQuery2.SQL.Add(' INSERT INTO whatsapp_blacklist(celular) ');
                    FDQuery2.SQL.Add(' SELECT '+quotedstr(trata_numero(telefone))+' WHERE NOT EXISTS ( ');
                    FDQuery2.SQL.Add(' SELECT 1 FROM whatsapp_blacklist WHERE celular='+quotedstr(trata_numero(telefone)));
                    FDQuery2.SQL.Add(' ); ');
                    FDQuery2.execsql;
                    FDQuery2.close;
                 end;

            end
          else
            begin
              //mensagens enviads por mim.
             // if not AtualizaRegistroBDLocal(vGIdMensagem, vGBlacList, false) then memo_log.Lines.Add('Não enviado....') ;
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

  if not AtualizaTabelaEnvios(1) then
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
  if PageControl1.ActivePageIndex = 2 then
  timer1.Interval := tempo;
end;

procedure TfrmPrincipal.PararEnvio1Click(Sender: TObject);
begin
   vPararEnvio:=true;
   FDQuery1.EnableControls;
end;

procedure TfrmPrincipal.PopupMenu21Click(Sender: TObject);
begin
   if ExcluiRegistroBDLocal(FDQuery1.FieldByName('id').AsInteger) then
      memo_log.lines.Add('Impossivel excluir');
   BBAtualizar.Click;
end;

procedure TfrmPrincipal.PopupMenu31Click(Sender: TObject);
var vpergunta  : string;
begin
  if SGListaNaoEnvios.Row > 0 then
       begin
          vpergunta := 'Deseja Reenviar a mensagem '+SGListaNaoEnvios.Cells[0,SGListaNaoEnvios.Row]+' para '+SGListaNaoEnvios.Cells[3,SGListaNaoEnvios.Row]+'? Se esse cliente estiver bloqueado desbloqueie antes de reenviar...';
          IF APPLICATION.MessageBox(pWideChar(vpergunta),'ATENÇÃO ',MB_YESNO + MB_ICONWARNING)=MRYES THEN
             begin
                FDQuery2.Close;
                FDQuery2.SQL.Clear;
                FDQuery2.SQL.Add(' update whatsapp_envios set status = 0 WHERE id = '+SGListaNaoEnvios.Cells[0,SGListaNaoEnvios.Row]+'; ');
                FDQuery2.execsql;
                //RegistrosEnviar := RegistrosEnviar+1;
                PageControl1Change(self);
                memo_log.lines.Add('REENVIO: '+vpergunta);
                timer1.Interval := tempo;
             end;
       end;
end;

procedure TfrmPrincipal.PopupMenu51Click(Sender: TObject);
begin
  FDQuery2.Close;
  FDQuery2.SQL.Clear;
  FDQuery2.SQL.Add('SELECT ');
  FDQuery2.SQL.Add('	regexp_replace( celular1, ''[^0-9]'', '''', ''g'' ) AS celular1 ');
  FDQuery2.SQL.Add('FROM');
  FDQuery2.SQL.Add('	clientes ');
  FDQuery2.SQL.Add('WHERE ');
  FDQuery2.SQL.Add('	celular1 IS NOT NULL ');
  FDQuery2.SQL.Add('	AND ativo = ''SIM''  ');
  FDQuery2.SQL.Add('	AND sistema = 1;  ');
  FDQuery2.SQL.Add('	AND ( LENGTH ( regexp_replace( celular1, ''[^0-9]'', '''', ''g'' ) ) = 10 or LENGTH ( regexp_replace( celular1, ''[^0-9]'', '''', ''g'' ) ) = 11 )');

  FDQuery2.open;
  if FDQuery2.RecordCount > 0 then
     begin
       if (trim(FDQuery2.FieldByName('celular1').asstring)<>'') then
          begin
            MMCelulares.Lines.Add(trim(FDQuery2.FieldByName('celular1').asstring));
          end;
     end
  else
     begin
       showmessage('Não é um produto Viatech');
     end;
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
                timer1.Interval := tempo;
             end;
       end;
  PageControl1Change(self);
end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
    if not GetRegistro() then
      begin
        LabelRegistro.Caption := 'LICENÇA: NÃO ENCONTRADO';
        exit;
      end
   else
      begin
        if not TInject1.Auth(false) then
        Begin
          TInject1.FormQrCodeType := TFormQrCodeType(1);
          TInject1.FormQrCodeStart;
        End;

        if not TInject1.FormQrCodeShowing then
           TInject1.FormQrCodeShowing := True;
      end;


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
   memo_log.lines.Add('Conexão foi finalizada pelo celular!');
end;

procedure TfrmPrincipal.Statusdabateria2Click(Sender: TObject);
begin
  if not TInject1.Auth then
     Exit;

  TInject1.GetBatteryStatus;
end;

procedure TfrmPrincipal.TrayIcon1Click(Sender: TObject);
begin
  TrayIcon1.Visible := False;
  Show();
  WindowState := wsNormal;
  Application.BringToFront();
end;



end.
