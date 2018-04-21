unit UCadCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, Buttons, ExtCtrls, ComCtrls, StdCtrls, DB, ImgList, 
  ToolWin, Mask, Grids, DBGrids, rxToolEdit, rxCurrEdit, acPNG, 
  UNovosComponentes, UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, 
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White, 
  dxSkinsdxStatusBarPainter, acAlphaImageList, dxStatusBar, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton, dxSkinMetropolisDark;

type
  TFrmCadCaixa = class(TFrmCadastroNovo)
    IBSQLCaixa: TFDQuery;
    IBTRCaixa: TFDTransaction;
    QBuscaCod: TFDQuery;
    QBuscaCodCODCAIXA: TIntegerField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    EdtCodCaixa: UNovosComponentes.TEdit;
    Label6: TLabel;
    EdtNome: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    EdtTamDesc: UNovosComponentes.TEdit;
    ComboGaveta: TComboBox;
    ComboPortaECF: TComboBox;
    RDGDecimaisQuant: TRadioGroup;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ComboBalanca: TComboBox;
    ComboPortaBal: TComboBox;
    ComboBaudBal: TComboBox;
    Label20: TLabel;
    EdtLinha1: TEdit;
    Label21: TLabel;
    EdtLinha2: TEdit;
    Label22: TLabel;
    EdtLinha3: TEdit;
    RDGDecimaisUnitario: TRadioGroup;
    CheckTrunca: TCheckBox;
    CheckComprovante: TCheckBox;
    CheckMFD: TCheckBox;
    GroupBox4: TGroupBox;
    EdtIPTef: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    EdtIDLoja: TEdit;
    Label13: TLabel;
    EdtIDTerminal: TEdit;
    GBTEF: TGroupBox;
    CheckTEF: TCheckBox;
    EdtCaminhoBanco: TEdit;
    CheckExportar: TCheckBox;
    Label5: TLabel;
    EdtMarcaECF: TEdit;
    Label23: TLabel;
    EdtModeloECF: TEdit;
    Label24: TLabel;
    EdtNumeroSerieECF: TEdit;
    Label25: TLabel;
    EdtMemoriaAdicional: TEdit;
    Label2: TLabel;
    EdtTipoECF: TEdit;
    Label26: TLabel;
    EdtVersaoSB: TEdit;
    Label27: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    EdtCNPJUsuario: TEdit;
    Label31: TLabel;
    EdtIEUsuario: TEdit;
    EdtDataSB: TEdit;
    EdtHoraSB: TEdit;
    TabSheet3: TTabSheet;
    Label32: TLabel;
    EdtCodGrp: UNovosComponentes.TEdit;
    BtnConsGRP: TsSpeedButton;
    EdtNomeGrp: TEdit;
    Label33: TLabel;
    Label34: TLabel;
    BtnGravaAliquota: TBitBtn;
    BtnExcluiAliquota: TBitBtn;
    DBGrid2: TDBGrid;
    GroupBox5: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    EdtIndiceECF: TEdit;
    Label50: TLabel;
    EdtIndiceR03: TEdit;
    DSItensAliquotas: TDataSource;
    QItensAliquotas: TFDQuery;
    QItensAliquotasCOD_CAI: TIntegerField;
    QItensAliquotasCOD_EMP: TIntegerField;
    QItensAliquotasCOD_GRP: TIntegerField;
    QItensAliquotasINDICE_ECF: TStringField;
    QItensAliquotasINDICE_R03: TStringField;
    QItensAliquotasNOME_GRP: TStringField;
    TabSheet4: TTabSheet;
    Label15: TLabel;
    EdtIndiceOS: TEdit;
    Label16: TLabel;
    EdtIndiceOrcamento: TEdit;
    Label17: TLabel;
    EdtIndiceMesa: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label29: TLabel;
    EdtNumeroUsuario: TEdit;
    Label51: TLabel;
    EdtCodNacional: TEdit;
    GroupBox3: TGroupBox;
    TabSheet5: TTabSheet;
    Label14: TLabel;
    EdtCodForma: UNovosComponentes.TEdit;
    BtnConsForma: TsSpeedButton;
    EdtNomeForma: TEdit;
    Label52: TLabel;
    Label53: TLabel;
    EdtIndiceForma: TEdit;
    BtnGravaForma: TBitBtn;
    BtnExcluiForma: TBitBtn;
    DBGridForma: TDBGrid;
    QItensFormas: TFDQuery;
    DSFormas: TDataSource;
    QItensFormasCOD_CAIXA: TIntegerField;
    QItensFormasCOD_EMP: TIntegerField;
    QItensFormasCOD_FORMA: TIntegerField;
    QItensFormasINDICE: TStringField;
    QItensFormasDESCRICAO: TStringField;
    Label54: TLabel;
    EdtDescECF: TEdit;
    QItensFormasDESCRICAO_ECF: TStringField;
    Label55: TLabel;
    Label56: TLabel;
    EdtIntervaloRecebe: TEdit;
    Label57: TLabel;
    EdtIntervaloTransmite: TEdit;
    Label58: TLabel;
    EdtDiasPAF: TEdit;
    Image1: TImage;
    CheckCortaPapel: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure Botoes(acao : string);
    procedure ComboBalancaChange(Sender: TObject);
    procedure CheckTEFClick(Sender: TObject);
    procedure EdtCodGrpEnter(Sender: TObject);
    procedure EdtCodGrpExit(Sender: TObject);
    procedure EdtCodGrpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodGrpKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsGRPClick(Sender: TObject);
    procedure BtnGravaAliquotaClick(Sender: TObject);
    procedure BuscaItensAliquotas;
    procedure BuscaItensFormas;
    procedure LimpaItensAliquotas;
    procedure LimpaItensFormas;
    procedure BtnExcluiAliquotaClick(Sender: TObject);
    procedure BtnConsFormaClick(Sender: TObject);
    procedure EdtCodFormaEnter(Sender: TObject);
    procedure EdtCodFormaExit(Sender: TObject);
    procedure EdtCodFormaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnGravaFormaClick(Sender: TObject);
    procedure BtnExcluiFormaClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmCadCaixa: TFrmCadCaixa;

implementation
uses
  Udm, Ubibli1, UConsCaixa, UConsGRP, UConsFormasPagamento, UNovoPrincipal;
var  bGrava : boolean;

{$R *.dfm}

function FrmCadCaixa: TFrmCadCaixa;
begin
   Result := TFrmCadCaixa( BuscaFormulario(  TFrmCadCaixa, False ) );
end;

procedure TFrmCadCaixa.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadCaixa, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadCaixa);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadCaixa);
         EDedit(FrmCadCaixa, false);
         btnNovo.Enabled      := true;
         BtnGravar.Enabled    := false;
         btnCancelar.Enabled  := false;
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

procedure TFrmCadCaixa.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('C016','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             RDGDecimaisQuant.ItemIndex:= 0;
             RDGDecimaisUnitario.ItemIndex:= 0;
             PageControl1.ActivePageIndex:= 0;
             CheckTEF.Checked:= false;

             EdtIndiceOS.Text        := '1';
             EdtIndiceOrcamento.Text := '1';
             EdtIndiceMesa.Text      := '1';

             EdtCodCaixa.Enabled:= true;
             EdtCodCaixa.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmCadCaixa.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  if not DM.Acesso('C016','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  PageControl1.ActivePageIndex:= 0;
  CheckTEF.Checked:= false;
  EdtIndiceOS.Text        := '1';
  EdtIndiceOrcamento.Text := '1';
  EdtIndiceMesa.Text      := '1';
  EdtCodCaixa.Enabled:= true;
  EdtCodCaixa.SetFocus;

end;

procedure TFrmCadCaixa.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadCaixa.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C016','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  PageControl1.ActivePageIndex:= 0;
  EdtCodCaixa.Enabled:= false;
  EdtNome.SetFocus;
end;

procedure TFrmCadCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRCaixa.Active then
     IBTRCaixa.Commit;
  IBSQLCaixa.Close;
  QItensAliquotas.Close;
  QItensFormas.Close;
  Action:= caFree;
end;

procedure TFrmCadCaixa.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('C016','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if IBTRCaixa.Active then
     IBTRCaixa.Commit;
  IBTRCaixa.StartTransaction;
  try
    try
      with IBSQLCaixa do
        begin 
           close;
           sql.Clear;
           if bGrava then
              begin 
                 sql.Add('INSERT INTO CAIXA(COD_CAI, COD_EMP, TAMANHO_DESC_CUPOM, PORTA_IMP, DESC_CAI, INDICE_GAVETA,       ' +
                         'INDICE_BALANCA, PORTA_BALANCA, BAUD_BALANCA, CASAS_DECIMAIS, IMPRIMIR_COMPROVANTE_ECF, LINHA1,    ' +
                         'LINHA2, LINHA3, CASAS_DECIMAIS_UNITARIO, TRUNCAR_CAI, ECF_MFD, TEF_CAI, IP_SERVIDOR_TEF,          ' +
                         'ID_LOJA_TEF, ID_TERMINAL_TEF, CAMINHO_BANCO, EXPORTAR_DADOS, R01_NUMERO_SERIE, R01_MF_ADICIONAL,  ' +
                         'R01_TIPO_ECF, R01_MARCA_ECF, R01_MODELO_ECF, R01_VERSAO_SB, R01_DATAHORA_SB,                      ' +
                         'R01_CNPJ_USUARIO, R01_IE_USUARIO, INDICE_GER_OS, INDICE_GER_ORCAMENTO, INDICE_GER_MESA,           ' +
                         'R01_NUMERO_USUARIO, CODIGO_NACIONAL_IDENTIFICACAO, INTERVALO_RECEBE, INTERVALO_TRANSMITE,         ' +
                         'DIAS_ATUALIZACAO_PAF, CORTA_PAPEL)                                                                             ' +
                         'VALUES(:1, :2, :4, :5, :7, :8, :9, :10, :11, :12, :23, :28, :29, :30, :37, :41, :42, :43, :44,    ' +
                         ':45, :46, :47, :48, :49, :50, :51, :52, :53, :54, :55, :57, :58, :59, :60, :61, :62, :63, :64,    ' +
                         ':65, :66, :67)');
              end
           else
              begin 
                 sql.Add('UPDATE CAIXA SET TAMANHO_DESC_CUPOM = :4, PORTA_IMP = :5, DESC_CAI = :7, INDICE_GAVETA = :8,             ' +
                         'INDICE_BALANCA = :9,  PORTA_BALANCA = :10, BAUD_BALANCA = :11, CASAS_DECIMAIS = :12,                     ' +
                         'IMPRIMIR_COMPROVANTE_ECF = :23, LINHA1 = :28, LINHA2 = :29, LINHA3 = :30, CASAS_DECIMAIS_UNITARIO = :37, ' +
                         'TRUNCAR_CAI = :41, ECF_MFD = :42, TEF_CAI = :43, IP_SERVIDOR_TEF = :44, ID_LOJA_TEF = :45,               ' +
                         'ID_TERMINAL_TEF = :46, CAMINHO_BANCO = :47, EXPORTAR_DADOS = :48, R01_NUMERO_SERIE = :49,                ' +
                         'R01_MF_ADICIONAL = :50, R01_TIPO_ECF = :51, R01_MARCA_ECF = :52, R01_MODELO_ECF = :53,                   ' +
                         'R01_VERSAO_SB = :54, R01_DATAHORA_SB = :55, R01_CNPJ_USUARIO = :57, R01_IE_USUARIO = :58,                ' +
                         'INDICE_GER_OS = :59, INDICE_GER_ORCAMENTO = :60, INDICE_GER_MESA = :61, R01_NUMERO_USUARIO = :62,        ' +
                         'CODIGO_NACIONAL_IDENTIFICACAO = :63, INTERVALO_RECEBE = :64, INTERVALO_TRANSMITE = :65,                  ' +
                         'DIAS_ATUALIZACAO_PAF = :66, CORTA_PAPEL=:67 WHERE COD_CAI = :1 AND COD_EMP = :2');
              end;

              // ATUALIZAçÃO KADOSHI

              if CheckCortaPapel.Checked then
                 ParamByName('67').AsString := 'S'
              else
                 Parambyname('67').AsString := 'N';
              // FIM
           Parambyname('1').AsInteger    := strtoint(EdtCodCaixa.Text);
           Parambyname('2').AsInteger    := iEmp;
           Parambyname('4').AsInteger    := strtoint(EdtTamDesc.Text);
           Parambyname('5').AsString     := ComboPortaECF.Text;
           Parambyname('7').AsString     := edtnome.Text;
           Parambyname('8').AsInteger    := ComboGaveta.ItemIndex + 1;
           Parambyname('9').AsInteger    := ComboBalanca.ItemIndex;
           if ComboPortaBal.ItemIndex > -1 then
              Parambyname('10').AsInteger:= ComboPortaBal.ItemIndex + 1
           else
              Parambyname('10').Value    := null;
           if ComboBaudBal.ItemIndex > -1 then
              Parambyname('11').AsInteger:= strtoint(ComboBaudBal.text)
           else
              Parambyname('11').Value    := null;
           if RDGDecimaisQuant.ItemIndex = -1 then
              Parambyname('12').AsInteger:= 2
           else
              Parambyname('12').AsInteger:= RDGDecimaisQuant.ItemIndex + 2;

           if CheckComprovante.Checked then
              Parambyname('23').AsString:= 'S'
           else
              Parambyname('23').AsString:= 'N';
           Parambyname('28').AsString    := trim(edtlinha1.text);
           Parambyname('29').AsString    := trim(edtlinha2.text);
           Parambyname('30').AsString    := trim(edtlinha3.text);
           if RDGDecimaisUnitario.ItemIndex = -1 then
              Parambyname('37').AsInteger:= 2
           else
              Parambyname('37').AsInteger:= RDGDecimaisUnitario.ItemIndex + 2;

           if CheckTrunca.Checked then
              Parambyname('41').AsString := 'S'
           else
              Parambyname('41').AsString := 'N';

           if CheckMFD.Checked then
              Parambyname('42').AsString := 'S'
           else
              Parambyname('42').AsString := 'N';

           if CheckTEF.Checked then
              Parambyname('43').AsString := 'S'
           else
              Parambyname('43').AsString := 'N';

           if trim(EdtIPTef.Text) = '' then
              Parambyname('44').Value    := null
           else
              Parambyname('44').AsString := Trim(EdtIPTef.Text);

           if trim(EdtIDLoja.Text) = '' then
              Parambyname('45').Value    := null
           else
              Parambyname('45').AsString := Trim(EdtIDLoja.Text);

           if trim(EdtIDTerminal.Text) = '' then
              Parambyname('46').Value    := null
           else
              Parambyname('46').AsString := Trim(EdtIDTerminal.Text);

           if trim(EdtCaminhoBanco.Text) = '' then
              Parambyname('47').Value    := null
           else
              Parambyname('47').AsString := Trim(EdtCaminhoBanco.Text);

           if CheckExportar.Checked then
              Parambyname('48').AsString := 'S'
           else
              Parambyname('48').AsString := 'N';

           if CheckExportar.Checked then
              Parambyname('48').AsString := 'S'
           else
              Parambyname('48').AsString := 'N';

           if trim(EdtNumeroSerieECF.Text) = '' then
              Parambyname('49').Value    := null
           else
              Parambyname('49').AsString := Trim(EdtNumeroSerieECF.Text);

           if trim(EdtMemoriaAdicional.Text) = '' then
              Parambyname('50').Value    := null
           else
              Parambyname('50').AsString := Trim(EdtMemoriaAdicional.Text);

           if trim(EdtTipoECF.Text) = '' then
              Parambyname('51').Value    := null
           else
              Parambyname('51').AsString := Trim(EdtTipoECF.Text);

           if trim(EdtMarcaECF.Text) = '' then
              Parambyname('52').Value    := null
           else
              Parambyname('52').AsString := Trim(EdtMarcaECF.Text);

           if trim(EdtModeloECF.Text) = '' then
              Parambyname('53').Value    := null
           else
              Parambyname('53').AsString := Trim(EdtModeloECF.Text);

           if trim(EdtVersaoSB.Text) = '' then
              Parambyname('54').Value    := null
           else
              Parambyname('54').AsString := Trim(EdtVersaoSB.Text);

           if (trim(EdtDataSB.Text) = '') and (trim(EdtHoraSB.text) = '') then
              Parambyname('55').Value    := null
           else
              Parambyname('55').AsDateTime := StrToDateTime(EdtDataSB.Text + EdtHoraSB.Text);

           if trim(EdtCNPJUsuario.Text) = '' then
              Parambyname('57').Value    := null
           else
              Parambyname('57').AsString := Trim(EdtCNPJUsuario.Text);

           if trim(EdtIEUsuario.Text) = '' then
              Parambyname('58').Value    := null
           else
              Parambyname('58').AsString := Trim(EdtIEUsuario.Text);

           Parambyname('59').AsString    := trim(EdtIndiceOS.Text);
           Parambyname('60').AsString    := trim(EdtIndiceOrcamento.Text);
           Parambyname('61').AsString    := trim(EdtIndiceMesa.Text);

           if trim(EdtNumeroUsuario.Text) = '' then
              Parambyname('62').Value   := null
           else
              Parambyname('62').AsInteger:= strtoint(EdtNumeroUsuario.Text);
           Parambyname('63').AsString    := trim(EdtCodNacional.Text);

           if trim(EdtIntervaloRecebe.Text) = '' then
              Parambyname('64').AsInteger:= 0
           else
              Parambyname('64').AsInteger:= strtoint(EdtIntervaloRecebe.Text);

           if trim(EdtIntervaloTransmite.Text) = '' then
              Parambyname('65').AsInteger:= 0
           else
              Parambyname('65').AsInteger:= strtoint(EdtIntervaloTransmite.Text);

           if trim(EdtDiasPAF.Text) = '' then
              Parambyname('66').AsInteger:= 0
           else
              Parambyname('66').AsInteger:= strtoint(EdtDiasPAF.Text);

           ExecOrOpen;
        end;
      IBTRCaixa.Commit;
      Botoes('G');
    except
      IBTRCaixa.Rollback;
      AlertaCad('Erro ao Gravar o Caixa');
    end;
  finally
    IBSQLCaixa.Close;
    PageControl1.ActivePageIndex:= 1;
    PageControl1.Pages[1].Enabled:= true;
  end;
end;

procedure TFrmCadCaixa.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C016','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if application.MessageBox('Confirma a Exclusão do Caixa?', 'Exclusão de Caixa', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton2) = 6 then
     begin 
        if dm.IBTransaction.Active then
           dm.IBTransaction.Commit;
        dm.IBTransaction.StartTransaction;
        try
          try
            with dm.Consulta do
               begin 
                  close;
                  sql.Clear;
                  sql.Add('DELETE FROM CAIXA WHERE COD_CAI = :CODCAI AND COD_EMP = :CODEMP');
                  Parambyname('codcai').AsInteger:= strtoint(EdtCodCaixa.Text);
                  Parambyname('codemp').AsInteger:= iEmp;
                  ExecOrOpen;
               end;
            dm.IBTransaction.Commit;
            Botoes('E');
          except
            dm.IBTransaction.Rollback;
            AlertaCad('Erro ao Excluir o Caixa');
          end;
        finally
          dm.Consulta.Close;
        end;
     end;
end;

procedure TFrmCadCaixa.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCaixa, FrmConsCaixa);
  FrmConsCaixa.tag:= 0;
  FrmConsCaixa.showmodal;
end;

procedure TFrmCadCaixa.ComboBalancaChange(Sender: TObject);
begin 
  inherited;
  if ComboBalanca.ItemIndex = 7 then
     begin 
        ComboPortaBal.ItemIndex := -1;
        ComboBaudBal.ItemIndex  := -1;
        ComboPortaBal.Enabled   := false;
        ComboBaudBal.Enabled    := false;
     end
  else
     begin 
        ComboPortaBal.Enabled := true;
        ComboBaudBal.Enabled  := true;
     end;
end;

procedure TFrmCadCaixa.CheckTEFClick(Sender: TObject);
begin 
  inherited;
  if not CheckTEF.Checked then
     begin 
        EdtIPTef.Clear;
        EdtIDLoja.clear;
        EdtIDTerminal.Clear;
        GBTEF.Enabled:= false;
     end
  else
     GBTEF.Enabled:= true;
end;

procedure TFrmCadCaixa.EdtCodGrpEnter(Sender: TObject);
begin 
  inherited;
  EdtCodGrp.SelectAll; 
end;

procedure TFrmCadCaixa.EdtCodGrpExit(Sender: TObject);
begin 
  inherited;
  if trim(EdtCodGrp.Text) = '' then
     exit;

  if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.Text:= 'SELECT COD_GRP, NOME_GRP, ECF ' +
                        'FROM GRUPO_ICMS ' +
                        'WHERE COD_GRP = :CODGRP';
             Parambyname('codgrp').AsInteger:= strtoint(EdtCodGrp.Text);
             open;
             if not fieldbyname('cod_grp').IsNull then
                begin 
                   if trim(fieldbyname('ecf').AsString) = 'S' then
                      begin 
                         EdtNomeGrp.Text:= fieldbyname('nome_grp').AsString;
                         EdtIndiceECF.SetFocus;
                      end
                   else
                      begin 
                         AlertaCad('Grupo não usado em ECF');
//                         EdtCodGrp.SetFocus;
                      end;
                end
             else
                begin 
                   AlertaCad('Grupo não Cadastrado');
//                   EdtCodGrp.SetFocus;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar o grupo');
     end;
   finally
     dm.QConsulta.close;
   end; 
end;

procedure TFrmCadCaixa.EdtCodGrpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
      BtnConsGRP.Click;
end;

procedure TFrmCadCaixa.EdtCodGrpKeyPress(Sender: TObject; var Key: Char);
begin 
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmCadCaixa.BtnConsGRPClick(Sender: TObject);
begin 
  inherited;
  application.CreateForm(TFrmConsGRP, FrmConsGRP);
  FrmConsGRP.Tag:= 17;
  FrmConsGRP.showmodal;
end;

procedure TFrmCadCaixa.BtnGravaAliquotaClick(Sender: TObject);
begin 
  inherited;
  if trim(EdtCodCaixa.Text) = '' then
     exit;

  if trim(EdtIndiceECF.Text) = '' then
      begin 
         AlertaCad('Digite o Índice ECF');
//         EdtIndiceECF.SetFocus;
         exit;
      end;

   if trim(EdtIndiceR03.Text) = '' then
      begin 
         AlertaCad('Digite o Índice R03');
//         EdtIndiceR03.SetFocus;
         exit;
      end;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.clear;
             sql.Text:= 'INSERT INTO INDICE_ECF (COD_CAI, COD_EMP, COD_GRP, INDICE_ECF, INDICE_R03) ' +
                        'VALUES(:CODCAI, :CODEMP, :CODGRP, :IECF, :R03)';
             Parambyname('codcai').AsInteger  := strtoint(EdtCodCaixa.Text);
             Parambyname('codemp').AsInteger  := iEmp;
             Parambyname('codgrp').AsInteger  := strtoint(EdtCodGrp.Text);
             parambyname('iecf').AsString     := trim(EdtIndiceECF.Text);
             parambyname('r03').AsString      := trim(EdtIndiceR03.Text);
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao gravar');
     end;
   finally
     dm.QConsulta.Close;
     BuscaItensAliquotas;
     LimpaItensAliquotas;
     EdtCodGrp.SetFocus;
   end;
end;

procedure TFrmCadCaixa.BuscaItensAliquotas;
begin 
   if IBTRCaixa.Active then
      IBTRCaixa.Commit;
   IBTRCaixa.StartTransaction;
   with QItensAliquotas do
      begin 
         close;
         Parambyname('codcai').AsInteger:= strtoint(EdtCodCaixa.Text);
         Parambyname('codemp').AsInteger:= iEmp;
         open;
      end;
end;

procedure TFrmCadCaixa.BuscaItensFormas;
begin 
   if IBTRCaixa.Active then
      IBTRCaixa.Commit;
   IBTRCaixa.StartTransaction;
   with QItensFormas do
      begin 
         close;
         Parambyname('codcai').AsInteger:= strtoint(EdtCodCaixa.Text);
         Parambyname('codemp').AsInteger:= iEmp;
         open;
      end;
end;

procedure TFrmCadCaixa.LimpaItensAliquotas;
begin 
   EdtCodGrp.Clear;
   EdtNomeGrp.Clear;
   EdtIndiceECF.Clear;
   EdtIndiceR03.Clear;
end;

procedure TFrmCadCaixa.LimpaItensFormas;
begin 
   EdtCodForma.Clear;
   EdtNomeForma.Clear;
   EdtIndiceForma.Clear;
   EdtDescECF.Clear;
end;

procedure TFrmCadCaixa.BtnExcluiAliquotaClick(Sender: TObject);
begin 
  inherited;
  if trim(EdtCodCaixa.Text) = '' then
     exit;

  if Application.MessageBox('Confirma a Exclusão do Item?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin 
        if dm.IBTransaction.Active then
           dm.IBTransaction.Commit;
        dm.IBTransaction.StartTransaction;
        try
          try
            with dm.QConsulta do
               begin 
                  close;
                  sql.clear;
                  sql.Text:= 'DELETE FROM INDICE_ECF ' +
                             'WHERE COD_CAI = :CODCAI AND COD_EMP = :CODEMP AND COD_GRP = :CODGRP';
                  Parambyname('codcai').AsInteger  := strtoint(EdtCodCaixa.Text);
                  Parambyname('codemp').AsInteger  := iEmp;
                  Parambyname('codgrp').AsInteger  := QItensAliquotasCOD_GRP.AsInteger;
                  ExecOrOpen;
               end;
            dm.IBTransaction.Commit;
          except
            dm.IBTransaction.Rollback;
            AlertaCad('Erro ao excluir');
          end;
        finally
          dm.QConsulta.Close;
          BuscaItensAliquotas;
        end;
     end;
end;

procedure TFrmCadCaixa.BtnConsFormaClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsFormasPagamento, FrmConsFormasPagamento);
  FrmConsFormasPagamento.Tag:= 1;
  FrmConsFormasPagamento.showmodal;
end;

procedure TFrmCadCaixa.EdtCodFormaEnter(Sender: TObject);
begin 
  inherited;
  EdtCodForma.SelectAll;
end;

procedure TFrmCadCaixa.EdtCodFormaExit(Sender: TObject);
begin 
  inherited;
  if trim(EdtCodForma.Text) = '' then
     exit;

  if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.Text:= 'SELECT CODIGO, DESCRICAO ' +
                        'FROM FORMAS_PAGAMENTO    ' +
                        'WHERE CODIGO = :COD';
             Parambyname('cod').AsInteger:= strtoint(EdtCodForma.Text);
             open;
             if not fieldbyname('codigo').IsNull then
                EdtNomeForma.Text:= fieldbyname('descricao').AsString
             else
                begin 
                   AlertaCad('Forma de Pagamento não Cadastrada');
//                   EdtCodForma.SetFocus;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar a Forma de Pagamento');
     end;
   finally
     dm.QConsulta.close;
   end;
end;

procedure TFrmCadCaixa.EdtCodFormaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsForma.Click; 
end;

procedure TFrmCadCaixa.BtnGravaFormaClick(Sender: TObject);
begin 
  inherited;
  if trim(EdtCodCaixa.Text) = '' then
     exit;

  if trim(EdtIndiceForma.Text) = '' then
      begin 
         AlertaCad('Digite o Índice da Forma no ECF');
//         EdtIndiceForma.SetFocus;
         exit;
      end;

  if trim(EdtDescECF.Text) = '' then
      begin 
         AlertaCad('Digite a Descrição no ECF');
//         EdtDescECF.SetFocus;
         exit;
      end;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.clear;
             sql.Text:= 'INSERT INTO INDICE_FORMA_PAGAMENTO (COD_CAIXA, COD_EMP, ' +
                        'COD_FORMA, INDICE, DESCRICAO_ECF) ' +
                        'VALUES(:CODCAI, :CODEMP, :CODFORMA, :INDICE, :DESC)';
             Parambyname('codcai').AsInteger    := strtoint(EdtCodCaixa.Text);
             Parambyname('codemp').AsInteger    := iEmp;
             Parambyname('codforma').AsInteger  := strtoint(EdtCodForma.Text);
             Parambyname('indice').AsString     := trim(EdtIndiceForma.Text);
             Parambyname('desc').AsString       := trim(EdtDescECF.Text);
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao gravar');
     end;
   finally
     dm.QConsulta.Close;
     BuscaItensFormas;
     LimpaItensFormas;
     EdtCodForma.SetFocus;
   end;
end;

procedure TFrmCadCaixa.BtnExcluiFormaClick(Sender: TObject);
begin 
  inherited;
  if trim(EdtCodCaixa.Text) = '' then
     exit;

  if Application.MessageBox('Confirma a Exclusão do Item?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin 
        if dm.IBTransaction.Active then
           dm.IBTransaction.Commit;
        dm.IBTransaction.StartTransaction;
        try
          try
            with dm.QConsulta do
               begin 
                  close;
                  sql.clear;
                  sql.Text:= 'DELETE FROM INDICE_FORMA_PAGAMENTO ' +
                             'WHERE COD_CAIXA = :CODCAI AND COD_EMP = :CODEMP AND COD_FORMA = :CODFORMA';
                  Parambyname('codcai').AsInteger    := strtoint(EdtCodCaixa.Text);
                  Parambyname('codemp').AsInteger    := iEmp;
                  Parambyname('codforma').AsInteger  := QItensFormasCOD_FORMA.AsInteger;
                  ExecOrOpen;
               end;
            dm.IBTransaction.Commit;
          except
            dm.IBTransaction.Rollback;
            AlertaCad('Erro ao excluir');
          end;
        finally
          dm.QConsulta.Close;
          BuscaItensFormas;
        end;
     end;
end;

procedure TFrmCadCaixa.PageControl1Change(Sender: TObject);
begin 
  inherited;
  if trim(EdtCodCaixa.Text) <> '' then
     begin 
        if PageControl1.ActivePageIndex = 3 then
           BuscaItensAliquotas
        else
           if PageControl1.ActivePageIndex = 4 then
              BuscaItensFormas;
     end;
end;

end.
