unit UCadEmp;

interface

uses
  Windows, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, 
  UCadNovo, Buttons, ExtCtrls, ComCtrls, Mask, StdCtrls, ExtDlgs, sSpeedButton, 
  SOAPHTTPClient, InvokeRegistry, Rio, ImgList, acAlphaImageList, ToolWin, 
  UNovosComponentes, UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, dxSkinMetropolisDark, 
  dxSkinOffice2013White, dxSkinsdxStatusBarPainter, dxStatusBar, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet, Data.DB,
  dxGDIPlusClasses, System.ImageList;

type
  TFrmCadEmp = class(TFrmCadastroNovo)
    IBSQLEmp: TFDQuery;
    IBTREmp: TFDTransaction;
    PC: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    cod_emp: TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    Label6: TLabel;
    EdtEnd: TEdit;
    Label7: TLabel;
    EdtBai: TEdit;
    Label11: TLabel;
    EdtCNPJ: TMaskEdit;
    EdtInsc: TEdit;
    Label12: TLabel;
    EdtCid: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    ComboEst: TComboBox;
    EdtCep: TMaskEdit;
    Label10: TLabel;
    Label13: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdtEtq: TEdit;
    Label5: TLabel;
    EdtResp: TEdit;
    Label14: TLabel;
    EdtNumero: TEdit;
    TabSheet3: TTabSheet;
    GroupBox6: TGroupBox;
    BtnLimpa: TBitBtn;
    Panel3: TPanel;
    Image: TImage;
    BtnFoto: TBitBtn;
    OpenPicture: TOpenPictureDialog;
    Label17: TLabel;
    EdtFant: TEdit;
    CheckSitCli: TCheckBox;
    CheckCPF: TCheckBox;
    EdtTel: TEdit;
    EdtFax: TEdit;
    Label15: TLabel;
    ComboTipoEmp: TComboBox;
    Label16: TLabel;
    ComboTipoCarga: TComboBox;
    Label18: TLabel;
    EdtCaminhoValidador: TEdit;
    OpenDialog: TOpenDialog;
    BtnCaminhoValidador: TButton;
    Label19: TLabel;
    EdtInscMunicipal: TEdit;
    GroupBox1: TGroupBox;
    Label21: TLabel;
    EdtPerfilEFD: TEdit;
    Label22: TLabel;
    EdtCodigoMunicipio: TEdit;
    Label23: TLabel;
    EdtTipoAtividadeEFD: TEdit;
    Label24: TLabel;
    Label25: TLabel;
    Contador: TTabSheet;
    Label26: TLabel;
    EdtNomeContador: TEdit;
    Label27: TLabel;
    EdtEndContador: TEdit;
    Label28: TLabel;
    EdtBairroContador: TEdit;
    Label29: TLabel;
    EdtCodMunContador: TEdit;
    Label31: TLabel;
    EdtCEPContador: TMaskEdit;
    Label32: TLabel;
    EdtNumeroContador: TEdit;
    Label33: TLabel;
    EdtCPFContador: TMaskEdit;
    Label34: TLabel;
    EdtTelContador: TEdit;
    Label35: TLabel;
    EdtFaxContador: TEdit;
    Label30: TLabel;
    EdtCRCContador: TEdit;
    Label36: TLabel;
    EdtCNPJContador: TMaskEdit;
    BtnConsCidade: TsSpeedButton;
    Image1: TImage;
    BConfigEFD: TButton;
    Label20: TLabel;
    edtVersaoEFD: TComboBox;
    sSpeedButton1: TsSpeedButton;
    HTTPRIO1: THTTPRIO;
    Label37: TLabel;
    edtEmailContador: TEdit;
    procedure EdtCNPJExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure Botoes(acao : string);
    procedure BtnFotoClick(Sender: TObject);
    procedure BtnLimpaClick(Sender: TObject);
    procedure EdtCodEmpCustoKeyPress(Sender: TObject; var Key: Char);
    procedure BtnCaminhoValidadorClick(Sender: TObject);
    procedure BtnConsCidadeClick(Sender: TObject);
    procedure BConfigEFDClick(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure EdtCNPJKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation
uses
  Udm, Ubibli1, UConsEmp, UConsMunicipios, UConfigurarPisCofins, cep, 
  frmConsultaCPFCNPJ;
var  bGrava : boolean;

{$R *.dfm}



procedure TFrmCadEmp.BConfigEFDClick(Sender: TObject);
begin 
  inherited;
  if cod_emp.Text = '' then
     Exit;
   Application.CreateForm( TfrmConfigurarPisCofins, frmConfigurarPisCofins);
   frmConfigurarPisCofins.CODEMP := StrToInt( cod_emp.Text );
   frmConfigurarPisCofins.ShowModal;
end;

procedure TFrmCademp.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(Self, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
         BConfigEFD.Enabled := True;
          if acao = 'N' then
             begin 
                Limpaedit(Self);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(Self);
         EDedit(Self, false);
         btnNovo.Enabled      := true;
         BtnGravar.Enabled    := false;
         btnCancelar.Enabled  := false;
         BConfigEFD.Enabled := False;
         if (acao = 'C') or (acao = 'E') then
            btnalterar.Enabled:= false
         else
            btnalterar.Enabled:= true;
         if acao = 'G' then
            btnExcluir.Enabled:= true
         else
            BtnExcluir.Enabled:= false;
         BtnConsultar.Enabled := true;
      end;
end;

procedure TFrmCadEmp.EdtCNPJExit(Sender: TObject);
begin 
  inherited;
  if not cnpj(edtcnpj.Text) then
     begin 
        AlertaCad('CNPJ Inválido');
//        edtcnpj.SetFocus;
     end;
end;

procedure TFrmCadEmp.EdtCNPJKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
     vk_f3: sSpeedButton1.Click;
  end;
end;

procedure TFrmCadEmp.FormShow(Sender: TObject);
begin 
  inherited;
  PC.ActivePageIndex:= 0;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('C001','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             comboest.ItemIndex     := 7;
             Image.Visible          := false;
             OpenPicture.FileName   := '';
             edtnome.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmCadEmp.sSpeedButton1Click(Sender: TObject);
  var
    I: Integer;
   Cons: CEPServicePort;
   Ret: String;
   Rua, Cidade, Bairro, Estado, Ibge: String;
begin
  Application.CreateForm( TfmConsultaReceita, fmConsultaReceita );
  fmConsultaReceita.TipoConsulta := consCNPJ;
  fmConsultaReceita.CPFCNPJ := FormataCNPJ( EdtCNPJ.Text );
  if fmConsultaReceita.ShowModal =  mrOk then
     begin
          EdtNome.Text := fmConsultaReceita.Razao;
          EdtFant.Text := fmConsultaReceita.Fantasia;
          EdtEnd.Text := fmConsultaReceita.Endereco;
          EdtNumero.Text := fmConsultaReceita.Numero;
          EdtBai.Text := fmConsultaReceita.Bairro;
          EdtCid.Text := fmConsultaReceita.Cidade;
          EdtCep.Text := FormataCEP( fmConsultaReceita.CEP );
                      for i:= 0 to 26 do
                         begin
                            if comboest.Items[i] = fmConsultaReceita.UF then
                               comboest.ItemIndex:= i;
                         end;
        Cons:= GetCEPServicePorT(false,'',HTTPRIO1);
        Ret := Cons.obterLogradouroAuth( EdtCep.Text, 'maiconferreira', 'kelly1' );
        ProcessaRetConsCep( Ret, Rua, Bairro, Cidade, Estado, Ibge );
        EdtCodigoMunicipio.Text := Ibge;
     end;
   FreeAndNil( fmConsultaReceita );
end;

procedure TFrmCadEmp.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  if not DM.Acesso('C001','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  comboest.ItemIndex:= 7;
  Image.Visible          := false;
  OpenPicture.FileName   := '';
  edtnome.SetFocus;
end;

procedure TFrmCadEmp.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Image.Visible       := false;
  OpenPicture.FileName:= '';
  Botoes('C');
end;

procedure TFrmCadEmp.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C001','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  pc.ActivePageIndex:= 0;
  edtnome.SetFocus;
end;

procedure TFrmCadEmp.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
  inherited;
  if IBTREmp.Active then
     IBTREmp.Commit;
  IBSQLEmp.Close;
  Action:= caFree;
end;

procedure TFrmCadEmp.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bDemonstracao) then
     begin
        AlertaCad('Empresa Demonstração');
        exit;
        abort;
     end;

  if not dm.VerificaCNPJCadastrado(EdtCNPJ.Text) then
      begin 
         AlertaCad('Empresa não autorizada');
         Application.Terminate;
      end;

  if (bGrava) and (not DM.Acesso('C001','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;

  if trim(edtnome.Text) = '' then
     begin 
        AlertaCad('Digite o Nome a Razão Social da Empresa');
//        edtnome.SetFocus;
        exit;
     end;

  if edtVersaoEFD.ItemIndex = -1 then
     begin 
        AlertaCad('Selecione a versão do EFD - Fiscal');
        exit;
     end;


  if IBTREmp.Active then
     IBTREmp.Commit;
  IBTREmp.StartTransaction;
  try
    try
      with IBSQLEmp do
        begin 
           close;
           sql.Clear;
           if bGrava then
              begin 
                 cod_emp.Text:= inttostr(prxcod('empresa', 'cod_emp', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO EMPRESA(COD_EMP, RAZAO_EMP, END_EMP, BAI_EMP, CID_EMP, EST_EMP,              ' +
                         'CEP_EMP, TEL_EMP, FAX_EMP, CNPJ_EMP, INSC_EMP, NOME_EMP_ETIQUETA, NUMERO_EMP, RESP_EMP,  ' +
                         'CAMINHO_FOTO_EMP, FANTASIA_EMP, MOSTRAR_SITCLI_PREVENDA, CADASTRAR_CLIENTE_SEM_CPF,      ' +
                         'TIPO_EMP, TIPO_CARGA_BALANCA, CAMINHO_VALIDADOR_SINTEGRA, INSCRICAO_MUNICIPAL,           ' +
                         'PERFIL_EFD, CODIGO_MUNICIPIO, TIPO_ATIVIDADE_EFD, NOME_CONTADOR, CPF_CONTADOR,           ' +
                         'CRC_CONTADOR, CNPJ_CONTADOR, CEP_CONTADOR, END_CONTADOR, NUMERO_CONTADOR,                ' +
                         'BAIRRO_CONTADOR, TEL_CONTADOR, FAX_CONTADOR, CODIGO_MUNICIPIO_CONTADOR, VERSAO_EFD, EMAIL_CONTADOR)      ' +
                         'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11, :14, :15, :16, :17, :20, :28, :33,  ' +
                         ':35, :36, :37, :38, :39, :40, :41, :42, :43, :44, :45, :46, :47, :48, :49, :50, :51, :52,' +
                         ':VERSAO_EFD, :EMAIL_CONTADOR)');
              end
           else
              begin 
                 sql.Add('UPDATE EMPRESA SET RAZAO_EMP = :2, END_EMP = :3, BAI_EMP = :4, CID_EMP = :5,          ' +
                         'EST_EMP = :6, CEP_EMP = :7, TEL_EMP = :8, FAX_EMP = :9, CNPJ_EMP = :10,               ' +
                         'INSC_EMP = :11, NOME_EMP_ETIQUETA = :14, NUMERO_EMP = :15, RESP_EMP = :16,            ' +
                         'CAMINHO_FOTO_EMP = :17, FANTASIA_EMP = :20, MOSTRAR_SITCLI_PREVENDA = :28,            ' +
                         'CADASTRAR_CLIENTE_SEM_CPF = :33, TIPO_EMP = :35, TIPO_CARGA_BALANCA = :36,            ' +
                         'CAMINHO_VALIDADOR_SINTEGRA = :37, INSCRICAO_MUNICIPAL = :38, PERFIL_EFD = :39,        ' +
                         'CODIGO_MUNICIPIO = :40, TIPO_ATIVIDADE_EFD = :41, NOME_CONTADOR = :42,                ' +
                         'CPF_CONTADOR = :43, CRC_CONTADOR = :44, CNPJ_CONTADOR = :45, CEP_CONTADOR = :46,      ' +
                         'END_CONTADOR = :47, NUMERO_CONTADOR = :48, BAIRRO_CONTADOR = :49, TEL_CONTADOR = :50, ' +
                         'FAX_CONTADOR = :51, CODIGO_MUNICIPIO_CONTADOR = :52, VERSAO_EFD = :VERSAO_EFD, EMAIL_CONTADOR=:EMAIL_CONTADOR WHERE COD_EMP = :1');
              end;
           Parambyname('1').AsInteger     := strtoint(cod_emp.Text);
           Parambyname('2').AsString      := edtnome.Text;
           if edtend.Text = '' then
              Parambyname('3').Value      := null
           else
              Parambyname('3').AsString   := edtend.Text;
           if EdtNumero.Text = '' then
              Parambyname('15').Value     := null
           else
              Parambyname('15').AsString  := EdtNumero.Text;
           if edtbai.Text = '' then
              Parambyname('4').Value      := null
           else
              Parambyname('4').AsString   := edtbai.Text;
           if edtcid.Text = '' then
              Parambyname('5').Value      := null
           else
              Parambyname('5').AsString   := edtcid.Text;
           Parambyname('6').AsString      := comboest.Text;
           Parambyname('7').AsString      := edtcep.Text;
           Parambyname('8').AsString      := edttel.Text;
           Parambyname('9').AsString      := edtfax.Text;
           Parambyname('10').AsString     := edtcnpj.Text;
           Parambyname('11').AsString     := edtinsc.Text;
           if EdtEtq.Text = '' then
              Parambyname('14').Value     := null
           else
              Parambyname('14').AsString  := edtetq.Text;
           if EdtResp.Text = '' then
              Parambyname('16').Value     := null
           else
              Parambyname('16').AsString  := EdtResp.Text;
           if Image.Visible then
              Parambyname('17').AsString  := OpenPicture.FileName
           else
              Parambyname('17').Value     := null;
           if EdtFant.Text = '' then
              Parambyname('20').Value     := null
           else
              Parambyname('20').AsString  := EdtFant.Text;
           if CheckSitCli.Checked then
              Parambyname('28').AsString   := 'S'
           else
              Parambyname('28').AsString   := 'N';
           if CheckCPF.Checked then
              Parambyname('33').AsString   := 'S'
           else
              Parambyname('33').AsString   := 'N';
           ParamByName('35').AsInteger     := ComboTipoEmp.ItemIndex;
           Parambyname('36').AsInteger     := ComboTipoCarga.ItemIndex;
           Parambyname('37').AsString      := trim(EdtCaminhoValidador.Text);
           Parambyname('38').AsString      := trim(EdtInscMunicipal.Text);
           Parambyname('39').AsString      := trim(EdtPerfilEFD.text);
           Parambyname('40').AsString      := trim(EdtCodigoMunicipio.Text);
           Parambyname('41').AsInteger     := strtoint(EdtTipoAtividadeEFD.Text);
           Parambyname('42').AsString      := trim(EdtNomeContador.Text);
           Parambyname('43').AsString      := trim(EdtCPFContador.Text);
           Parambyname('44').AsString      := trim(EdtCRCContador.Text);
           Parambyname('45').AsString      := trim(EdtCNPJContador.Text);
           Parambyname('46').AsString      := trim(EdtCEPContador.Text);
           Parambyname('47').AsString      := trim(EdtEndContador.Text);
           Parambyname('48').AsString      := trim(EdtNumeroContador.Text);
           Parambyname('49').AsString      := trim(EdtBairroContador.Text);
           Parambyname('50').AsString      := trim(EdtTelContador.Text);
           Parambyname('51').AsString      := trim(EdtFaxContador.Text);
           Parambyname('52').AsString      := trim(EdtCodMunContador.Text);
           ParamByName( 'VERSAO_EFD' ).AsInteger := edtVersaoEFD.ItemIndex;
           ParamByName( 'EMAIL_CONTADOR' ).AsString := edtEmailContador.Text;
           ExecOrOpen;
        end;
      IBTREmp.Commit;
      Botoes('G');
    except
      IBTREmp.Rollback;
      AlertaCad('Erro ao Gravar a Empresa');
    end;
  finally
    IBSQLEmp.Close;
  end;
end;

procedure TFrmCadEmp.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C001','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(Self, 'empresa', cod_emp, IBSQLEmp, IBTREmp);
  Image.Visible        := false;
  OpenPicture.FileName := '';
  Botoes('E');
end;

procedure TFrmCadEmp.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsEmp, FrmConsEmp);
  FrmConsEmp.tag:= 0;
  FrmConsEmp.showmodal;
end;

procedure TFrmCadEmp.
BtnFotoClick(Sender: TObject);
begin 
  inherited;
  Image.Visible:= true;
  OpenPicture.Execute;
  image.Picture.LoadFromFile(OpenPicture.FileName);
end;

procedure TFrmCadEmp.BtnLimpaClick(Sender: TObject);
begin 
  inherited;
  Image.Visible:= false;
  OpenPicture.FileName:= '';
end;

procedure TFrmCadEmp.EdtCodEmpCustoKeyPress(Sender: TObject;
  var Key: Char);
begin 
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key := #0;
end;

procedure TFrmCadEmp.BtnCaminhoValidadorClick(Sender: TObject);
begin 
  inherited;
  if OpenDialog.Execute then
     begin 
        EdtCaminhoValidador.Text:= OpenDialog.FileName;
     end;
end;

procedure TFrmCadEmp.BtnConsCidadeClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsMunicipios, FrmConsMunicipios);
  FrmConsMunicipios.tag:= 2;
  FrmConsMunicipios.showmodal;
end;


end.
