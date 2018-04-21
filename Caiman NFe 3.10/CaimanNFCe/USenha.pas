unit USenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, StdCtrls, ACBrECF, acPNG, Buttons, sLabel, Func, jpeg, 
  sSpeedButton, Vcl.Imaging.pngimage;

type
  TFrmSenha = class(TForm)
    Image1: TImage;
    Edtusu: TEdit;
    Edtsenha: TEdit;
    SpeedButton3: TsSpeedButton;
    SpeedButton2: TsSpeedButton;
    SpeedButton1: TsSpeedButton;
    sLabelFX1: TsLabelFX;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure EdtusuEnter(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAlterarSenhaClick(Sender: TObject);
    procedure EdtsenhaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtusuKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure GravarINI;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSenha: TFrmSenha;
  podefechar: Boolean;

implementation

uses
  Udm, UAlterarSenha, UPadraoPafEcf, UCarrega, UMenuFiscal, UDialog, UECF;
{$R *.dfm}

procedure TFrmSenha.FormShow(Sender: TObject);
begin
  Brush.Style := bsClear;
  podefechar := false;
  Edtusu.Clear;
  Edtsenha.Clear;
  Edtusu.SetFocus;
  Edtsenha.Color := dm.BuscaCor( DM.FundoLogin, Edtsenha.Left, Edtsenha.Top );
  Edtusu.Color := dm.BuscaCor( DM.FundoLogin, Edtusu.Left, Edtusu.Top );
  DM.CriaImg;
  dm.CarregaImagem2( dm.FundoLogin, dm.ImgTempCia );
  Image1.Picture.Bitmap.Assign( DM.ImgTempCia );
  DM.DestroyImg;
end;

procedure TFrmSenha.EdtsenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    BtnOKClick(nil);
  end;
end;

procedure TFrmSenha.EdtusuEnter(Sender: TObject);
begin
  Edtsenha.Clear;
end;

procedure TFrmSenha.EdtusuKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Edtsenha.SetFocus;
  end;
end;

procedure TFrmSenha.BtnCancelarClick(Sender: TObject);
begin
  podefechar := true;
  Application.Terminate;
end;

procedure TFrmSenha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
    Application.Terminate;
   if (ssAlt in Shift) and (chr(Key) in ['M', 'm']) then
      begin
               Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
               FrmMenuFiscal.showmodal;
      end;

end;

procedure TFrmSenha.BtnOKClick(Sender: TObject);


begin
  podefechar := true;
  try
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;
    with dm.QConsulta do
    begin
      close;
      sql.Clear;
      sql.Add('SELECT * FROM USUARIO ' + 'WHERE NOME_USU = :USUARIO');
      Parambyname('USUARIO').AsString := trim(Edtusu.text);
      Open;
      if not(fieldbyname('cod_usu').IsNull) then
      begin
        if Edtsenha.text = trim(fieldbyname('SENHA_USU').AsString) then
        begin
          ICodUsu := fieldbyname('cod_usu').AsInteger;
          FrmPadraoPafECf.SB.Panels[1].text := fieldbyname('NOME_USU').AsString;
          dm.IBTransaction.Commit;
          dm.QConsulta.close;
          FrmSenha.close;

        end
        else
        begin
          dm.IBTransaction.Rollback;
          dm.QConsulta.close;
          showmessage('Senha Inválida');
          Edtsenha.SetFocus;
          exit;
        end;
      end
      else
      begin
        showmessage('Usuário não Cadastrado');
        Edtusu.SetFocus;
      end;
      //dm.IBTransaction.Commit;
    end;
  except
    dm.IBTransaction.Rollback;
    showmessage('Erro ao Selecionar o Usuário');
  end;

end;

procedure TFrmSenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if podefechar then
  begin
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    dm.QConsulta.close;
    Action := caFree;
  end
  else
    Action := caNone;
end;

procedure TFrmSenha.FormCreate(Sender: TObject);
const
  AchaModelo: array [0 .. 15] of TACBrECFModelo = (ecfNenhum, ecfNaoFiscal,
    ecfBematech, ecfSweda, ecfDaruma, ecfSchalter, ecfMecaf, ecfYanco,
    ecfDataRegis, ecfUrano, ecfICash, ecfQuattro, ecfFiscNET, ecfEpson, ecfNCR,
    ecfSwedaSTX);
var
  MODELO: integer;
  Porta: String;
  TimeOut: integer;
  Intervalo: integer;
  Linhas: integer;
  Velocidade: String;
  dData: TDate;
begin
  dm.ScaleForm( Self, False );

    iEmp := StrToInt( trim(dm.LeIni(GetCurrentDir + '\PafEcf.ini', 'ConfiguracaoLocal',
          'Empresa')));
    if iEmp <= 0 then
       begin
          ShowMessage( 'Empresa não configurada!');
          Application.Terminate;
          Exit;
       end;

    if dm.IBTransaction.Active then
       dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;
    dm.QConsulta.Close;
    DM.QConsulta.SQL.Text := 'select RAZAO_EMP from empresa where COD_EMP=:codemp';
    dm.QConsulta.ParamByName( 'codemp' ).AsInteger := iEmp;
    dm.QConsulta.Open;
    if dm.QConsulta.IsEmpty then
       begin
          Kdialog( 'Empresa não cadastrada' , 'SLPDV - Empresa', 'ERRO' );
          Application.Terminate;
          Exit;
       end;
   FrmPadraoPafECf.sb.Panels[3].Text:= dm.QConsulta.FieldByName( 'RAZAO_EMP' ).AsString;
   dm.QConsulta.Close;
   DM.IBTransaction.Commit;
  try

    MODELO := strtoint(trim(dm.LeIni(GetCurrentDir + '\PafEcf.ini', 'ECF',
          'MODELO')));
    Porta := trim(dm.LeIni(GetCurrentDir + '\PafEcf.ini', 'ECF', 'PORTA'));
    TimeOut := strtoint(trim(dm.LeIni(GetCurrentDir + '\PafEcf.ini', 'ECF',
          'TIMEOUT')));
    Intervalo := strtoint(trim(dm.LeIni(GetCurrentDir + '\PafEcf.ini', 'ECF',
          'INTERVALO')));
    Linhas := strtoint(trim(dm.LeIni(GetCurrentDir + '\PafEcf.ini', 'ECF',
          'LINHAS')));
    Velocidade := trim(dm.LeIni(GetCurrentDir + '\PafEcf.ini', 'ECF',
          'VELOCIDADE'));
     GravarINI;
    dm.ECF.MODELO := AchaModelo[MODELO];
    dm.ECF.Porta := Porta;
    dm.ECF.TimeOut := TimeOut;
    dm.ECF.IntervaloAposComando := Intervalo;
    dm.ECF.MaxLinhasBuffer := Linhas;
    dm.ECF.Device.ParamsString := Velocidade;
    // dm.ECF.Device.ParamsString := trim(dm.LeIni(GetCurrentDir +  '\PafEcf.ini', 'ECF', 'SerialParams'));
    hide;
    Sleep(200);
    Application.CreateForm(TfrmCarrega, frmCarrega);
    frmCarrega.Show;
    if bOFF then
       begin
           if not AchaProcessos( 'Comunicadornf.exe' ) then
              begin
                 WinExec( 'C:\SLFastSale\Comunicadornf.exe' , SW_NORMAL )
              end;
       end;
    FrmCarrega.Men.Caption := 'Gerando MD5';
    Application.ProcessMessages;
//    dm.Gera_RegistroN;
    Sleep( 200 );
    FrmCarrega.Men.Caption := 'MD5 gerado com sucesso';
    Application.ProcessMessages;
    Sleep( 200 );
    if not DM.ErroArquivoAuxiliar then
       begin
         if MODELO > 0 then
            begin
                FrmCarrega.Men.Caption := 'Localizando Impressora';
                Application.ProcessMessages;
                ErroImpressora := false;
                dm.ECF.Ativar;
                Application.ProcessMessages;
                FrmCarrega.Men.Caption := 'Fim da Localização';
                Sleep(300);
                Application.ProcessMessages;
            end;
       end
    else
       begin
           ErroImpressora := true;
           iECF := 99;
       end;
    if not VerificaNumeroSerie( iECF ) then
       begin
           ErroImpressora := true;
           iECF := 99;
           dm.ECF.Desativar;
       end;
    frmCarrega.close;
    if DM.ECF.Ativo then
       dm.ECF.IdentificaPAF( '', '' );


  except
    on E: Exception do
    begin
      Application.MessageBox(pwidechar(E.Message),
        'Erro ao inicializar a impressora', mb_applmodal + mb_iconerror);
      ErroImpressora := true;
      iECF := 99;
    end;
  end;

end;

procedure TFrmSenha.BtnAlterarSenhaClick(Sender: TObject);
begin
  Application.CreateForm(TFrmAlterarSenha, FrmAlterarSenha);
  FrmAlterarSenha.showmodal;
end;


procedure TfrmSenha.GravarINI;
var
  SEmpresa: string;
  SEnd: string;
  SNumero: string;
  SBairro: string;
  SCidade: string;
  SUF: string;
  SCEP: string;
  SCNPJ: string;
  SIE: string;

begin
    //
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;
    dm.QConsulta.Close;
    dm.QConsulta.SQL.Clear;
    dm.QConsulta.SQL.Text := 'Select * from empresa where COD_EMP=:COD_EMP';
    dm.QConsulta.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
    dm.QConsulta.Open;
    if not bOFF then
       SEmpresa := dm.QConsulta.FieldByName('FANTASIA_EMP').AsString
    else
       SEmpresa := DM.QConsulta.FieldByName('RAZAO_EMP').AsString;
    SEnd := dm.QConsulta.FieldByName( 'END_EMP').AsString;
    SNumero := dm.QConsulta.FieldByName('NUMERO_EMP').AsString;
    SBairro := dm.QConsulta.FieldByName( 'BAI_EMP' ).AsString;
    SCidade := dm.QConsulta.FieldByName( 'CID_EMP' ).AsString;
    SUF := dm.QConsulta.FieldByName( 'EST_EMP' ).AsString;
    SCEP := DM.QConsulta.FieldByName( 'CEP_EMP' ).AsString;
    SCNPJ := DM.QConsulta.FieldByName( 'CNPJ_EMP' ).AsString;
    SIE := dm.QConsulta.FieldByName( 'INSC_EMP' ).AsString;
    dm.QConsulta.Close;
    dm.IBTransaction.Commit;
    dm.GravaIni(GetCurrentDir + '\ACBrECF001.ini', 'Cabecalho', 'LIN000', SEmpresa );
    dm.GravaIni(GetCurrentDir + '\ACBrECF001.ini', 'Cabecalho', 'LIN001', SEnd + ', ' +
     SNumero + ' - ' + SBairro );
    dm.GravaIni(GetCurrentDir + '\ACBrECF001.ini', 'Cabecalho', 'LIN002', SCidade +
    ' - ' + SUF + ' - ' + SCEP );
    dm.GravaIni(GetCurrentDir + '\ACBrECF001.ini', 'Cabecalho', 'LIN003', 'CNPJ: ' + SCNPJ + '   IE: ' + SIE );
end;

end.
