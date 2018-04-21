unit USendEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdSMTP, IdBaseComponent, IdMessage, StdCtrls,
  IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL, IdExplicitTLSClientServerBase,
  IdSMTPBase, IdAttachmentFile, IdIOHandlerStack, IdSSL, WinINet, Math,UNovosComponentes, UNovoFormulario;

type
  TFrmSendEmail = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    EdtPara: TEdit;
    Label2: TLabel;
    EdtCC: TEdit;
    Label3: TLabel;
    EdtCCO: TEdit;
    EdtAssunto: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    ComboPrioridade: TComboBox;
    CheckLeitura: TCheckBox;
    MemoMensagem: TMemo;
    Label7: TLabel;
    BtnEnviar: TButton;
    BtnCancelar: TButton;
    LbAnexos: TListBox;
    Label4: TLabel;
    OpenDialog1: TOpenDialog;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnEnviarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAnexarClick(Sender: TObject);
    procedure BtnRemoverClick(Sender: TObject);
    procedure EnvioACBR;
    procedure EnvioIndy;
    function EnviaMail(Email, Conta, Senha, Autentica, Smtp, Auth_SSL,
      Nom_exibe, Porta_smtp, Corpo, Destinatario, Assunto: String;
      Anexos: TStrings): String;

  private
    { Private declarations }
    sServidorSmpt, sPortaSmtp, sUsuarioSmpt, sSenhaSmtp, sAssunto, sMensagem,
      sFromSMTP: string;
  public
    { Public declarations }
    CCe: Boolean;
    PDFCCe: String;
  end;

var
  FrmSendEmail: TFrmSendEmail;

implementation

uses UDM, UDialog, UFrmStatusNfe, Ubibli1;

{$R *.dfm}

procedure TFrmSendEmail.BtnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TFrmSendEmail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TFrmSendEmail.BtnEnviarClick(Sender: TObject);
var
  TipoEnvio: Integer;
begin
    EnvioIndy;
end;

procedure TFrmSendEmail.FormShow(Sender: TObject);
var
  bConexaoSegura: Boolean;

begin
  { busca os parametros }
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.QConsulta do
      begin
        close;
        sql.Clear;
        sql.Add('SELECT SERVIDOR_SMTP, PORTA_SMTP, USUARIO_SMTP, SENHA_SMTP, FROM_SMTP, '
          + 'ASSUNTO_EMAIL_DANFE, SMTP_CONEXAO_SEGURA, MENSAGEM_EMAIL_DANFE ' +
          'FROM PARAMETROS ' + 'WHERE COD_EMP = :CODEMP');
        Parambyname('codemp').AsInteger := iEmp;
        Open;
        sServidorSmpt := trim(fieldbyname('servidor_smtp').AsString);
        sPortaSmtp := trim(fieldbyname('porta_smtp').AsString);
        sUsuarioSmpt := trim(fieldbyname('usuario_smtp').AsString);
        sSenhaSmtp := trim(fieldbyname('senha_smtp').AsString);
        sAssunto := trim(fieldbyname('assunto_email_danfe').AsString);
        sMensagem := trim(fieldbyname('mensagem_email_danfe').AsString);
        sFromSMTP := trim(fieldbyname('from_smtp').AsString);

        if trim(fieldbyname('smtp_conexao_segura').AsString) = 'S' then
          bConexaoSegura := true
        else
          bConexaoSegura := false;
      end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      KDialog('erro ao buscar os parâmetros do email');
    end;
  finally
    dm.QConsulta.close;
  end;

  EdtAssunto.Text := sAssunto;
  MemoMensagem.Text := sMensagem;
  if CCe then
  begin
    LbAnexos.Items.Add(PDFCCe);
    EdtAssunto.Text := sAssunto + ' + CC-e';
    MemoMensagem.Text := sMensagem + #13 +
      'E-mail enviado com Carta de Correção em Anexo.';
  end;

end;

procedure TFrmSendEmail.BtnAnexarClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    LbAnexos.Items.Add(OpenDialog1.FileName);
end;

procedure TFrmSendEmail.BtnRemoverClick(Sender: TObject);
begin
  LbAnexos.Items.Delete(LbAnexos.ItemIndex);
end;

procedure TFrmSendEmail.EnvioACBR;
var
  iAnexo: Integer;
  CC: TStrings;
  SSLS: String;
  SSL: Boolean;
  Anexo: TStrings;
begin
  CC := TStringList.Create;
  CC.Clear;
  Anexo := TStringList.Create;
  Anexo.Clear;
  if CCe then
  begin
    Anexo.Add(PDFCCe);
  end;
  if EdtCCO.Text <> '' then
    CC.Add(EdtCCO.Text);
  if EdtCC.Text <> '' then
    CC.Add(EdtCC.Text);
  if (EdtCCO.Text <> '') and (EdtCC.Text <> '') then
    CC := Nil;
  SSLS := dm.RetornaStringTabela('SMTP_CONEXAO_SEGURA', 'PARAMETROS',
    'COD_EMP', iEmp);
  if SSLS = 'S' then
    SSL := true
  else
    SSL := false;
  // sServidorSmpt, sPortaSmtp, sUsuarioSmpt, sSenhaSmtp, sAssunto, sMensagem, sFromSMTP : string;
  try


    if iCodigoNfe > 0 then
      dm.AtualizaStatusNfe(iCodigoNfe, 'STATUS_EMAIL', 'NULL');

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro ao enviar e-mail.' + #13 + E.Message),
        'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
      FreeAndNil(CC);
      FreeAndNil(Anexo);
      Abort;
      exit;
    end;
  end;

  KDialog('Email enviado com sucesso!', 'Envio de NFe', tdtInfo);
  FreeAndNil(CC);
  FreeAndNil(Anexo);
  close;
end;

procedure TFrmSendEmail.EnvioIndy;
var
  iAnexo: Integer;
  CC: TStrings;
  SSLS: String;
  SSL: Boolean;
  Anexo: TStrings;
  Resultado: string;
  Tipo: Integer;
  Nome: string;
begin
  CC := TStringList.Create;
  CC.Clear;
  CC.Delimiter := ';';
  CC.Add( EdtPara.Text );
  Anexo := TStringList.Create;
  Anexo.Clear;
  Anexo.Assign(LbAnexos.Items);
  if EdtCCO.Text <> '' then
    CC.Add(EdtCCO.Text);
  if EdtCC.Text <> '' then
    CC.Add(EdtCC.Text);
  if (EdtCCO.Text <> '') and (EdtCC.Text <> '') then
    CC := Nil;
  SSLS := dm.RetornaStringTabela('SMTP_CONEXAO_SEGURA', 'PARAMETROS',
    'COD_EMP', iEmp);
  Nome :=  dm.RetornaStringTabela('NFE_NOMEEMAIL', 'PARAMETROS',
    'COD_EMP', iEmp);
  Tipo := StrToIntDef( dm.RetornaStringTabela('TIPO_ENVIO_EMAIL', 'PARAMETROS',
    'COD_EMP', iEmp), 0 );
  if SSLS = 'S' then
    SSL := true
  else
    SSL := false;
  // sServidorSmpt, sPortaSmtp, sUsuarioSmpt, sSenhaSmtp, sAssunto, sMensagem, sFromSMTP : string;
  try
    if (frmStatusNfe = nil) then
      frmStatusNfe := TfrmStatusNfe.Create(Application);
    frmStatusNfe.lblStatus.Caption := 'Enviando Email...';
    frmStatusNfe.Show;
    frmStatusNfe.BringToFront;
    Application.ProcessMessages;
    DM.EnviaEmail( sFromSMTP, sUsuarioSmpt, sSenhaSmtp, sServidorSmpt,
    StrToInt( sPortaSmtp ), False, SSL, Nome, CC.DelimitedText,
    EdtAssunto.Text, MemoMensagem.Text, LbAnexos.Items, False, Tipo  );
{    Resultado := EnviaMail(sFromSMTP, sUsuarioSmpt, sSenhaSmtp, 'S',
      sServidorSmpt, SSLS, sFromSMTP, sPortaSmtp,
      MemoMensagem.Text, EdtPara.Text, EdtAssunto.Text, Anexo);}
    frmStatusNfe.close;
    Application.ProcessMessages;
    KDialog(Resultado, 'Envio de e-mail', tdtInfo);
    if iCodigoNfe > 0 then
      dm.AtualizaStatusNfe(iCodigoNfe, 'STATUS_EMAIL', 'NULL');
    if pos ( 'E-Mail enviado para', Resultado ) > 0 then
        Close;
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro ao enviar e-mail.' + #13 + E.Message),
        'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
      FreeAndNil(CC);
      FreeAndNil(Anexo);
      Abort;
      exit;
    end;
  end;

  FreeAndNil(CC);
  FreeAndNil(Anexo);

end;

function TFrmSendEmail.EnviaMail(Email, Conta, Senha, Autentica, Smtp, Auth_SSL,
  Nom_exibe, Porta_smtp, Corpo, Destinatario, Assunto: String;
  Anexos: TStrings): String;
var
  Mensagem: TIdMessage;
  cnxSMTP: TIdSMTP;
  AuthSSL: TIdSSLIOHandlerSocketOpenSSL;
  Attachment:TIdAttachmentFile;
  I: Integer;
begin
  Result := '';
  try

    Mensagem := TIdMessage.Create(nil);
    cnxSMTP := TIdSMTP.Create(nil);

    Mensagem.From.Name := Nom_exibe; // Nome do Remetente
    Mensagem.From.Address := Email; // E-mail do Remetente = email valido...
    Mensagem.Recipients.EMailAddresses := Destinatario; // destinatario
    Mensagem.Priority := mpHighest;
    Mensagem.Subject := Assunto; // Assunto do E-mail
    Mensagem.ContentType := 'multipart/mixed';

    cnxSMTP.Host := Smtp; // smtp terra}
    cnxSMTP.Username := Conta;
    cnxSMTP.Password := Senha;
    if Autentica = 'S' then
      cnxSMTP.AuthType := satDefault;
    if Autentica = 'N' then
      cnxSMTP.AuthType := satNone;

    if Auth_SSL = 'S' then
    begin
      AuthSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
      cnxSMTP.IOHandler := AuthSSL;
      cnxSMTP.UseTLS := utUseImplicitTLS;
      AuthSSL.DefaultPort := StrToInt(Porta_smtp);
      AuthSSL.SSLOptions.Method := sslvSSLv3;
      AuthSSL.SSLOptions.Mode := sslmClient;
    end;

    cnxSMTP.Port := StrToInt(Porta_smtp);

    if Anexos.Count > 0 then
      for I := 0 to Anexos.Count - 1 do
      begin
        if FileExists(Anexos[I]) then
           begin
//           TIdAttachmentFile.Create(Mensagem.MessageParts, TFileName(Anexos[I]));
  //            TIdAttachmentFile.Create(Mensagem.MessageParts, Anexos[I]);
              Attachment := TidAttachmentFile.Create(Mensagem.MessageParts,Anexos[I]);
              Attachment.DisplayName := Anexos[I];
              Attachment.FileName := Anexos[I];
              Attachment.ContentType := 'application/' + RetiraCaracter( ExtractFileExt( Anexos[I] ) );
           end;
      end;

    Mensagem.Body.Clear;
    Mensagem.Body.Add(Corpo);
    cnxSMTP.UseEhlo := true;
    cnxSMTP.UseVerp := false;

    cnxSMTP.ReadTimeout := 10000;
    cnxSMTP.Connect;
    sleep(1000);
    cnxSMTP.Authenticate;
    sleep(1000);
    Try
      if cnxSMTP.Connected then
        cnxSMTP.Send(Mensagem)
      else
      begin
        Result := 'Mensagem não pode ser enviada.';
        exit;
      end;
    except
      cnxSMTP.Disconnect;
      cnxSMTP.Host := Smtp; // smtp
      cnxSMTP.AuthType := satNone;
      cnxSMTP.Connect;
      try
        cnxSMTP.Send(Mensagem);
      except
        begin
          Result := 'Não pode enviar o email para ' + Destinatario +
            '. Verifique as configurações da conta!';
        end;
      end;
      cnxSMTP.Disconnect;
    end;
    cnxSMTP.Disconnect;

  finally
    FreeAndNil(Mensagem);
    FreeAndNil(cnxSMTP);
    if Auth_SSL = 'S' then
      FreeAndNil(AuthSSL);
  end;

  if Result = '' then
  begin
    Result := 'E-Mail enviado para ' + Destinatario;
  end;

end;
/// fim função

end.
