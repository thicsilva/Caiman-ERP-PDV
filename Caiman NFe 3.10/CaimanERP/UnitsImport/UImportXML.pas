unit UImportXML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, xmldom, XMLIntf, msxmldom, XMLDoc, OleCtrls, SHDocVw, StdCtrls, 
  sEdit, sLabel, Buttons, sSpeedButton, ExtCtrls, sPanel, ACBrNFeDANFEClass, 
  ACBrNFe, ACBrNFeDANFEFR, DB, DBClient, ComCtrls,
  sPageControl, Mask, DBCtrls, pcnNfe, pcnConversao, Grids, DBGrids, 
  AdvGlowButton, UBibli1, NxPageControl, RzCmboBx, RzDBCmbo, UNovosComponentes, 
  UNovoFormulario, ACBrNFeDANFEFRDM, ACBrBase, ACBrDFe;

type
  TImportXML = class(UNovoFormulario.TForm)
    sCoolBar1: TsPanel;
    sStickyLabel3: TsStickyLabel;
    Arquivo1: TsEdit;
    Nota: TClientDataSet;
    NotaDATAEMI_ENT: TDateField;
    NotaDATAENT_ENT: TDateField;
    NotaTOTAL_ENT: TCurrencyField;
    NotaACRES_ENT: TCurrencyField;
    NotaDESC_ENT: TCurrencyField;
    NotaFRETE_ENT: TCurrencyField;
    NotaICMSFRETE_ENT: TCurrencyField;
    NotaTIPOENT: TStringField;
    NotaNUMNF_ENT: TStringField;
    NotaSERIE_ENT: TStringField;
    NotaBASE_SUB_TRIB: TCurrencyField;
    NotaVALOR_ICMS_SUB: TCurrencyField;
    NotaFRETE_INCLUSO: TStringField;
    NotaICMS_SUB_INCLUSO: TStringField;
    NotaTOTAL_PRODUTOS: TCurrencyField;
    NotaCUSTO_SEM_DESC: TStringField;
    NotaCODIFICACAO_FISCAL: TStringField;
    NotaCODIGO_ES: TIntegerField;
    NotaCHAVE_NFE: TStringField;
    sNota: TDataSource;
    NotaBCICMS: TCurrencyField;
    NotaVALOR_ICMS: TCurrencyField;
    Fornecedor: TClientDataSet;
    sFornecedor: TDataSource;
    FornecedorFJ: TStringField;
    FornecedorRAZAO: TStringField;
    FornecedorEND: TStringField;
    FornecedorBAIRRO: TStringField;
    FornecedorCIDADE: TStringField;
    FornecedorCEP: TStringField;
    FornecedorUF: TStringField;
    FornecedorCNPJ: TStringField;
    FornecedorINSC: TStringField;
    FornecedorTEL: TStringField;
    FornecedorNUMERO: TStringField;
    FornecedorIBGE: TIntegerField;
    Transp: TClientDataSet;
    sTransportadora: TDataSource;
    TranspFJ: TStringField;
    TranspNOME: TStringField;
    TranspEND: TStringField;
    TranspCIDADE: TStringField;
    TranspUF: TStringField;
    TranspCNPJ: TStringField;
    TranspINSC: TStringField;
    TranspPLACA: TStringField;
    TranspUF_PLACA: TStringField;
    Dup: TClientDataSet;
    sDup: TDataSource;
    DupCOD: TAutoIncField;
    DupDOC: TStringField;
    DupVenc: TDateField;
    DupValor: TCurrencyField;
    Items: TClientDataSet;
    sItems: TDataSource;
    ItemsEAN: TStringField;
    ItemsPRODUTO: TStringField;
    ItemsNCM: TStringField;
    ItemsMEDIDA: TStringField;
    ItemsQUANT: TFloatField;
    ItemsVALOR_UNID: TCurrencyField;
    ItemsVALOR_TOTAL: TCurrencyField;
    ItemsORIG: TIntegerField;
    ItemsCST: TStringField;
    ItemsBC: TCurrencyField;
    ItemsALIQ_ICMS: TFloatField;
    ItemsVALOR_ICMS: TCurrencyField;
    ItemsBCST: TCurrencyField;
    ItemsALIQ_ST: TFloatField;
    ItemsVALOR_ST: TCurrencyField;
    ItemsALIQ_IPI: TFloatField;
    ItemsVALOR_IPI: TCurrencyField;
    ItemsSEQ: TAutoIncField;
    ItemsBC_IPI: TCurrencyField;
    ItemsPRedBC: TFloatField;
    ItemsPRedBCST: TFloatField;
    ItemsPIS_CST: TStringField;
    ItemsPIS_BC: TCurrencyField;
    ItemsPIS_ALIQ: TFloatField;
    ItemsPIS_VALOR: TCurrencyField;
    ItemsCOFINS_CST: TStringField;
    ItemsCOFINS_BC: TCurrencyField;
    ItemsCOFINS_ALIQ: TFloatField;
    ItemsCOFINS_VALOR: TCurrencyField;
    ItemsCFOP: TStringField;
    Process: TClientDataSet;
    ProcessCOD: TAutoIncField;
    ProcessACAO: TStringField;
    ProcessTABELA: TStringField;
    ProcessPROBLEMA: TStringField;
    ProcessCOD_SEQ: TIntegerField;
    ProcessCOD_CAD: TIntegerField;
    ItemsCOD_LOCAL: TIntegerField;
    NotaV_PIS: TCurrencyField;
    NotaV_COFINS: TCurrencyField;
    AdvGlowButton2: TAdvGlowButton;
    AdvGlowButton1: TAdvGlowButton;
    ItemsCST_IPI: TStringField;
    ItemsQUANT_ENT: TCurrencyField;
    ItemsDESC: TCurrencyField;
    sprocess: TDataSource;
    Paginas: TNxPageControl;
    Dadosnfe: TNxTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label17: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    CTipo: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Label44: TLabel;
    Label46: TLabel;
    Label3: TLabel;
    Label19: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit43: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit19: TDBEdit;
    NxTabSheet2: TNxTabSheet;
    Label13: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label30: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label23: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit30: TDBEdit;
    NxTabSheet3: TNxTabSheet;
    Label32: TLabel;
    Label33: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    NxTabSheet4: TNxTabSheet;
    Label41: TLabel;
    DBGrid1: TDBGrid;
    NxTabSheet5: TNxTabSheet;
    DBGrid2: TDBGrid;
    AdvGlowButton4: TAdvGlowButton;
    Processa: TNxTabSheet;
    Label42: TLabel;
    DBGrid3: TDBGrid;
    AdvGlowButton3: TAdvGlowButton;
    SalvaNota: TAdvGlowButton;
    Label22: TLabel;
    DBEdit40: TDBEdit;
    NotaV_IPI: TCurrencyField;
    Label43: TLabel;
    DBEdit42: TDBEdit;
    NotaV_SEG: TCurrencyField;
    ItemsCOD_PRO: TStringField;
    ItemsCFOP_ENTRADA: TIntegerField;
    nfe: TACBrNFe;
    danfe: TACBrNFeDANFEFR;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure Arquivo1Change(Sender: TObject);

    procedure DBEdit8Change(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure AdvGlowButton4Click(Sender: TObject);
    procedure SalvaNotaClick(Sender: TObject);
  private
    { Private declarations }
    sSql: String;
    function Numeros(S: String): Integer;
  public
    { Public declarations }
    COD_FOR: Integer;
    COD_ICMS: Integer;
    COD_CFOP: Integer;
    COD_CFO: Integer;
    PODE_IMPORTAR: Boolean;

    COD_LOCALIZA: Integer;
    Quant_ent: Currency;

    MesmoEstado: Boolean;

    procedure CarregaDadosNota();
    procedure CarregaForn();
    procedure CarregaTransp();
    procedure CarregaDuplicatas();
    procedure CarregaProdutos();

    procedure VerificaFor;
    procedure VerificaProd;
    procedure VerificaICMSCFOP;

    procedure CadastraFornecedor;
    procedure CadastraICMS;
    procedure CadastraCFOP;
    procedure CadastraProduto(SEQ: Integer);
    procedure Associa(SEQ: Integer);
    function BuscaMedida(DESC: String): Integer;
    function ImportaCabecalho: Integer;
    function ImportaItens(COD_ENT: Integer): Boolean;
    procedure ImportarTudo;
    function contas(COD_ENT: Integer): Boolean;
    function VerificaTributacoes: Boolean;
    procedure CalculaNota( COD_ENT: Integer );
    procedure CalculaItens( COD_ENT: Integer );
    procedure CalculaCabecalho( COD_ENT: Integer );
  end;

var
  ImportXML: TImportXML;

implementation

uses
  Udm, Udmi, Func, UConsProd, UCadProduto, USelecionaCFOPS, UDialog, 
  UNovoPrincipal;
{$R *.dfm}

procedure TImportXML.AdvGlowButton4Click(Sender: TObject);
begin
  try
    if ItemsCOD_LOCAL.AsString = '' then
      exit;
  //  Application.CreateForm(TFrmCadProduto, FrmCadProduto);
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;

    dm.QProd.close;
    dm.QProd.sql.Clear;
    dm.QProd.sql.Text := sSql;
    dm.QProd.sql.Add(' where COD_PRO=:COD');
    dm.QProd.ParamByName('COD').AsInteger := ItemsCOD_LOCAL.AsInteger;
    dm.QProd.Open;

  {  with FrmCadProduto do
    begin
      FrmCadProduto.Tag := 1;
      pc.ActivePageIndex := 0;
      limpaedit(FrmCadProduto);
      ededit(FrmCadProduto, false);
      cod_pro.Text := dm.QProdCOD_PRO.AsString;
      if trim(dm.QProdCONTROLA_ESTOQUE_PRO.AsString) = 'S' then
        CheckControlaEstoque.Checked := true
      else
        CheckControlaEstoque.Checked := false;
      EdtCodBarra.Text := dm.QProdCODIGO_BARRA_PRO.AsString;
      edtnome.Text := dm.QProdNOME_PRO.AsString;
      EdtDescCupom.Text := dm.QProdDESC_CUPOM.AsString;
      cod_lab.Text := dm.QProdCOD_LAB.AsString;
      edtnomelab.Text := dm.QProdNOME_LAB.AsString;
      cod_sec.Text := dm.QProdCOD_SEC.AsString;
      edtnomesec.Text := dm.QProdNOME_SEC.AsString;
      EdtCodGrupo.Text := dm.QProdCOD_GRUPO.AsString;
      EdtNomeGrupo.Text := dm.QProdDESCRICAO.AsString;
      EdtCodSubGrupo.Text := dm.QProdSUB_GRUPO.AsString;
      EdtNomeSubGrupo.Text := dm.QProdDESCRICAO1.Text;
      edtvalor.Text := dm.QProdVALOR_PRO.AsString;
      edtpromocao.Text := dm.QProdPROMOCAO_PRO.AsString;
      EdtComissao.Text := dm.QProdCOMISSAO_PRO.AsString;
      EdtQuantEnt.Text := dm.QProdQUANT_UNIDADE_ENTRADA.AsString;
      EdtEstMin.Text := dm.QProdESTOQUE_MINIMO_PRO.AsString;
      EdtLoc.Text := dm.QProdLOCALIZACAO_PRO.AsString;
      if trim(dm.QProdATIVO_PRO.AsString) = 'S' then
        CheckAtivo.Checked := true
      else
        CheckAtivo.Checked := false;
      EdtMargem.Text := dm.QProdMARGEM_LUCRO_PRO.AsString;
      if dm.QProdPRODUTO_PESADO_PRO.AsString = 'N' then
        ComboPeso.ItemIndex := 0
      else if dm.QProdPRODUTO_PESADO_PRO.AsString = 'P' then
        ComboPeso.ItemIndex := 1
      else
        ComboPeso.ItemIndex := 2;
      cod_set.Text := dm.QProdCOD_SETOR.AsString;
      EdtNomeSetor.Text := dm.QProdNOME_SET.AsString;
      edttecla.Text := dm.QProdTECLA_ATALHO_PRO.AsString;
      EdtCodReceita.Text := dm.QProdINDICE_RECEITA_PRO.AsString;
      EdtDiasValidade.Text := dm.QProdDIAS_VALIDADE_PRO.AsString;
      EdtRef.Text := dm.QProdREFERENCIA_PRO.AsString;
      if trim(dm.QProdCOMPLEMENTO_PRO.AsString) = 'S' then
        CheckComplemento.Checked := true
      else
        CheckComplemento.Checked := false;
      EdtICMSContEst.Text := dm.QProdICMS_CONT_EST.AsString;
      edticmsCFest.Text := dm.QProdICMS_CF_EST.AsString;
      EdtICMSCONTFora.Text := dm.QProdICMS_CONT_FORA.AsString;
      EdtICMSCFFora.Text := dm.QProdICMS_CF_FORA.AsString;
      EdtCSTCONTEst.Text := dm.QProdCST_CONT_EST.AsString;
      EdtCSTCONTFora.Text := dm.QProdCST_CONT_FORA.AsString;
      EdtCSTCFEst.Text := dm.QProdCST_CF_EST.AsString;
      EdtCSTCFFora.Text := dm.QProdCST_CF_FORA.AsString;
      EdtCFOPVEstCONT.Text := dm.QProdCFOP_VENDAS_CONT_EST.AsString;
      EdtCFOPVEstCF.Text := dm.QProdCFOP_VENDAS_CF_EST.AsString;
      EdtCFOPVForaCONT.Text := dm.QProdCFOP_VENDAS_CONT_FORA.AsString;
      EdtCFOPVForaCF.Text := dm.QProdCFOP_VENDAS_CF_FORA.AsString;
      if dm.QProdSAIR_TABELA_PRECO.AsString = 'S' then
        CheckTabela.Checked := true
      else
        CheckTabela.Checked := false;
      if dm.QProdST_CONT_EST.AsString = 'S' then
        CheckSTCONTEst.Checked := true
      else
        CheckSTCONTEst.Checked := false;
      EdtVrAgregCONTEst.Text := dm.QProdVR_AGREG_CONT_EST.AsString;
      EdtIPICONTEst.Text := dm.QProdIPI_CONT_EST.AsString;
      EdtIPICFEst.Text := dm.QProdIPI_CF_EST.AsString;
      EdtIPICONTFora.Text := dm.QProdIPI_CONT_FORA.AsString;
      EdtIPICFFora.Text := dm.QProdIPI_CF_FORA.AsString;

      EdtBCRCONTEst.Text := dm.QProdRED_CONT_EST.AsString;
      EdtBCRCFEst.Text := dm.QProdRED_CF_EST.AsString;
      EdtBCRCONTFora.Text := dm.QProdRED_CONT_FORA.AsString;
      EdtBCRCFFora.Text := dm.QProdRED_CF_FORA.AsString;
      EdtNCM.Text := dm.QProdCOD_NCM.AsString;
      EdtProdEstoque.Text := dm.QProdCOD_PRODUTO_ESTOQUE.AsString;
      ComboTipo.ItemIndex := dm.QProdCODIGO_TIPO.AsInteger - 1;
      EdtAliqPis.Text := dm.QProdALIQUOTA_PIS.AsString;
      EdtAliqCofins.Text := dm.QProdALIQUOTA_COFINS.AsString;
      EdtAliqIR.Text := dm.QProdALIQUOTA_IR.AsString;
      EdtAliqCSLL.Text := dm.QProdALIQUOTA_CSLL.AsString;
      EdtAliqOutras.Text := dm.QProdALIQUOTA_OUTRAS.AsString;
      EdtVarejoPrazo.Text := dm.QProdPRECO_PRAZO_PRO.AsString;
      if trim(dm.QProdTIPO_PRODUCAO.AsString) = 'P' then
        ComboTipoProducao.ItemIndex := 0
      else
        ComboTipoProducao.ItemIndex := 1;

      if trim(dm.QProdISENTO_PIS_COFINS_PRO.AsString) = 'S' then
        CheckPisCofins.Checked := true
      else
        CheckPisCofins.Checked := false;

      EdtCodUndEntrada.Text := dm.QProdCODIGO_UNIDADE_ENTRADA.AsString;
      EdtCodundSaida.Text := dm.QProdCODIGO_UNIDADE_SAIDA.AsString;
      EdtNomeUndEntrada.Text := dm.QProdUND_ENTRADA.AsString;
      EdtNomeUndSaida.Text := dm.QProdUND_SAIDA.AsString;

      if dm.QProdDATA_VALIDADE.IsNull then
        EdtDataValidade.Clear
      else
        EdtDataValidade.Text := dm.QProdDATA_VALIDADE.AsString;

      EdtCodSetorEstoque.Text := dm.QProdCODIGO_SETOR_ESTOQUE.AsString;
      EdtNomeSetorEstoque.Text := dm.QProdSETOR_ESTOQUE.AsString;
      EdtORIG.Text := dm.QProdORIG.AsString;
      EdtCSOSN.Text := dm.QProdCSOSN.AsString;

      edtTamanho.Text := trim(dm.QProdTAMANHO.AsString);
      edtCor.Text := trim(dm.QProdCOR.AsString);
      edtOBS.Lines.Text := (dm.QProdOBS.AsString);

      CST_PIS.Text := trim(dm.Qprodcst_pis.AsString);
      CST_COFINS.Text := trim(dm.Qprodcst_cofins.AsString);

      edtCST_ipi.Text := trim(dm.qprodcst_ipi.AsString);

      if not dm.QProdCAMINHO_FOTO_PRO.IsNull then
      begin
        OpenPicture.FileName := dm.QProdCAMINHO_FOTO_PRO.Value;
        image.Visible := true;
        try
          image.Picture.LoadFromFile(dm.QProdCAMINHO_FOTO_PRO.Value);
        except
          image.Picture := nil
        end;
      end
      else
      begin
        OpenPicture.FileName := '';
        image.Visible := false;
      end;
      dm.QProd.close;
      dm.QProd.sql.Text := sSql;
      dm.IBTransaction.Commit;
      FormShow(FrmCadProduto);
      showmodal;
      if dm.IBTransaction.Active then
        dm.IBTransaction.Commit;
      dm.IBTransaction.StartTransaction;

      dm.QProd.close;
      dm.QProd.sql.Clear;
      dm.QProd.sql.Text := sSql;
      dm.QProd.sql.Add(' where COD_PRO=:COD');
      dm.QProd.ParamByName('COD').AsInteger := ItemsCOD_LOCAL.AsInteger;
      dm.QProd.Open;
      Items.Edit;
      ItemsQUANT_ENT.AsCurrency := dm.QProdQUANT_UNIDADE_ENTRADA.AsCurrency;
      Items.Post;
      dm.IBTransaction.Commit;

    end;   }

  except
    on E: Exception do
    begin
      dm.QProd.close;
      dm.QProd.sql.Text := sSql;
      dm.IBTransaction.Rollback;
      AlertaCad('Erro ao abrir produto' + #13 + E.Message);
    end;
  end;
end;

procedure TImportXML.Arquivo1Change(Sender: TObject);
begin
  try
     Nfe.NotasFiscais.Clear;
    if not Nfe.NotasFiscais.LoadFromFile(Arquivo1.Text) then
       begin
          KDialog( 'Não foi possível carregar dados da nota' );
          Exit;
       end;
    if nfe.NotasFiscais.Count = 0 then
       begin
          KDialog( 'Não foi possível carregar dados da nota' );
          Exit;
       end;
    CarregaDadosNota();
    CarregaForn();
    CarregaTransp;
    CarregaDuplicatas;
    CarregaProdutos;
  except
    on E: Exception do
    begin
      Application.MessageBox
        (PWideChar('Erro ao abrir o XML!' + #13 + E.Message), 'Erro',
        mb_applmodal + mb_iconerror + mb_ok);
      close;
    end;
  end;
end;

procedure TImportXML.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FreeAndNil(ImportXML);
end;

procedure TImportXML.FormShow(Sender: TObject);
begin
  PODE_IMPORTAR := false;
  DadosNfe.show;
  Danfe.FastFile := ExtractFilePath(Application.ExeName) + '\Report\DANFE.fr3';
  sSql := dm.QProd.sql.Text;
end;

procedure TImportXML.sSpeedButton1Click(Sender: TObject);

begin
  COD_ICMS := 0;
  COD_CFOP := 0;
  COD_FOR := 0;
  Processa.Visible := true;
  Paginas.ActivePageIndex := 5;
  if Process.Active then
    Process.close;
  Process.CreateDataSet;
  Process.EmptyDataSet;
  Process.Open;
  VerificaFor();
//  VerificaICMSCFOP;
  VerificaProd();
  if Process.IsEmpty then
  begin
    PODE_IMPORTAR := true;
    SalvaNota.Enabled := true;
  end
  else
  begin
    PODE_IMPORTAR := false;
    SalvaNota.Enabled := false;
  end;
end;

procedure TImportXML.sSpeedButton2Click(Sender: TObject);
begin
  if Process.IsEmpty then
  begin
    exit;
  end;
  Process.First;
  while not Process.Eof do
  begin
    if trim(ProcessTABELA.AsString) = 'FORNECEDOR' then
    begin
      if COD_FOR = 0 then
        CadastraFornecedor;
    end;
    if trim(ProcessTABELA.AsString) = 'ICMS' then
    begin
      if COD_ICMS = 0 then
        CadastraICMS;
    end;
    if trim(ProcessTABELA.AsString) = 'CFOP' then
    begin
      if COD_CFOP = 0 then
        CadastraCFOP;
    end;
    if trim(ProcessTABELA.AsString) = 'PRODUTO' then
    begin
      if trim(ProcessACAO.AsString) = 'CADASTRAR' then
        CadastraProduto(ProcessCOD_SEQ.AsInteger);
      if trim(ProcessACAO.AsString) = 'ASSOCIAR' then
        Associa(ProcessCOD_SEQ.AsInteger);
    end;
    Process.Next;
  end;
  sSpeedButton1Click(nil);

end;

procedure TImportXML.sSpeedButton3Click(Sender: TObject);
begin
  Nfe.NotasFiscais.Imprimir;
end;

procedure TImportXML.CarregaDadosNota;
begin
  //
  Nota.CreateDataSet;
  Nota.EmptyDataSet;
  Nota.Open;
  Nota.Insert;
  NotaNUMNF_ENT.AsInteger := Nfe.NotasFiscais[0].NFe.Ide.nNF;
  NotaSERIE_ENT.AsInteger := Nfe.NotasFiscais[0].Nfe.Ide.cNF;
  NotaDATAEMI_ENT.AsDateTime := Nfe.NotasFiscais[0].Nfe.Ide.dEmi;
  NotaDATAENT_ENT.AsDateTime := date;
  NotaTOTAL_ENT.AsCurrency := Nfe.NotasFiscais[0].Nfe.Total.ICMSTot.vNF;
  NotaACRES_ENT.AsCurrency := Nfe.NotasFiscais[0]
    .Nfe.Total.ICMSTot.vOutro;
  NotaDESC_ENT.AsCurrency := Nfe.NotasFiscais[0].Nfe.Total.ICMSTot.vDesc;
  NotaFRETE_ENT.AsCurrency := Nfe.NotasFiscais[0]
    .Nfe.Total.ICMSTot.vFrete;
  NotaICMSFRETE_ENT.AsCurrency := 0;
  if Nfe.NotasFiscais[0].Nfe.Ide.indPag = ipVista then
    NotaTIPOENT.AsString := 'V'
  else
    NotaTIPOENT.AsString := 'P';
  NotaBASE_SUB_TRIB.AsCurrency := Nfe.NotasFiscais[0]
    .Nfe.Total.ICMSTot.vBCST;
  NotaVALOR_ICMS_SUB.AsCurrency := Nfe.NotasFiscais[0]
    .Nfe.Total.ICMSTot.vST;
  NotaTOTAL_PRODUTOS.AsCurrency := Nfe.NotasFiscais[0]
    .Nfe.Total.ICMSTot.vProd;
  NotaCODIFICACAO_FISCAL.AsInteger := Nfe.NotasFiscais[0].Nfe.Ide.modelo;
  NotaCODIGO_ES.AsInteger := Nfe.NotasFiscais[0].Nfe.Ide.cUF;
  NotaCHAVE_NFE.AsString := Nfe.NotasFiscais[0].Nfe.infNFe.ID;
  NotaBCICMS.AsCurrency := Nfe.NotasFiscais[0].Nfe.Total.ICMSTot.vBC;
  NotaVALOR_ICMS.AsCurrency := Nfe.NotasFiscais[0]
    .Nfe.Total.ICMSTot.vICMS;
  NotaV_PIS.AsCurrency := Nfe.NotasFiscais[0].Nfe.Total.ICMSTot.vPIS;
  NotaV_COFINS.AsCurrency := Nfe.NotasFiscais[0]
    .Nfe.Total.ICMSTot.vCofins;
  NotaV_IPI.AsCurrency := Nfe.NotasFiscais[0].NFe.Total.ICMSTot.vIPI;
  NotaV_SEG.AsCurrency := Nfe.NotasFiscais[0].NFe.Total.ICMSTot.vSeg;

  if NotaFRETE_ENT.AsCurrency > 0 then
    NotaFRETE_INCLUSO.AsString := 'S'
  else
    NotaFRETE_INCLUSO.AsString := 'N';

  if NotaVALOR_ICMS_SUB.AsCurrency > 0 then
    NotaICMS_SUB_INCLUSO.AsString := 'S'
  else
    NotaICMS_SUB_INCLUSO.AsString := 'N';

  if NotaDESC_ENT.AsCurrency > 0 then
    NotaCUSTO_SEM_DESC.AsString := 'S'
  else
    NotaCUSTO_SEM_DESC.AsString := 'N';

  Nota.Post;
end;

procedure TImportXML.CarregaForn;
begin
  //
  Fornecedor.CreateDataSet;
  Fornecedor.EmptyDataSet;
  Fornecedor.Open;
  Fornecedor.Insert;

  FornecedorRAZAO.AsString := Nfe.NotasFiscais[0].Nfe.Emit.xNome;
  FornecedorEND.AsString := Nfe.NotasFiscais[0].Nfe.Emit.EnderEmit.xLgr;
  FornecedorBAIRRO.AsString := Nfe.NotasFiscais[0]
    .Nfe.Emit.EnderEmit.xBairro;
  FornecedorCIDADE.AsString := Nfe.NotasFiscais[0]
    .Nfe.Emit.EnderEmit.xMun;
  FornecedorCEP.AsInteger := Nfe.NotasFiscais[0].Nfe.Emit.EnderEmit.CEP;
  FornecedorUF.AsString := Nfe.NotasFiscais[0].Nfe.Emit.EnderEmit.UF;
  FornecedorCNPJ.AsString := Nfe.NotasFiscais[0].Nfe.Emit.CNPJCPF;
  FornecedorINSC.AsString := Nfe.NotasFiscais[0].Nfe.Emit.IE;
  FornecedorTEL.AsString := Nfe.NotasFiscais[0].Nfe.Emit.EnderEmit.fone;
  FornecedorNUMERO.AsString := Nfe.NotasFiscais[0].Nfe.Emit.EnderEmit.nro;
  FornecedorIBGE.AsInteger := Nfe.NotasFiscais[0].Nfe.Emit.EnderEmit.cMun;
  if Length(FornecedorCNPJ.AsString) > 11 then
    FornecedorFJ.AsString := 'J'
  else
    FornecedorFJ.AsString := 'F';
  Fornecedor.Post;
  MesmoEstado := dm.MovimentoMesmoUF( Nfe.NotasFiscais[0].Nfe.Emit.EnderEmit.UF );

end;

procedure TImportXML.CarregaTransp;
begin
  //
  Transp.CreateDataSet;
  Transp.EmptyDataSet;
  Transp.Open;
  Transp.Insert;
  TranspNOME.AsString := Nfe.NotasFiscais[0].Nfe.Transp.Transporta.xNome;
  TranspEND.AsString := Nfe.NotasFiscais[0].Nfe.Transp.Transporta.xEnder;
  TranspCIDADE.AsString := Nfe.NotasFiscais[0].Nfe.Transp.Transporta.xMun;
  TranspUF.AsString := Nfe.NotasFiscais[0].Nfe.Transp.Transporta.UF;
  TranspCNPJ.AsString := Nfe.NotasFiscais[0]
    .Nfe.Transp.Transporta.CNPJCPF;
  TranspINSC.AsString := Nfe.NotasFiscais[0].Nfe.Transp.Transporta.IE;
  TranspPLACA.AsString := Nfe.NotasFiscais[0].Nfe.Transp.veicTransp.placa;
  TranspUF_PLACA.AsString := Nfe.NotasFiscais[0].Nfe.Transp.veicTransp.UF;
  if Length(trim(TranspCNPJ.AsString)) > 11 then
    TranspFJ.AsString := 'J'
  else
    TranspFJ.AsString := 'F';
  Transp.Post;
end;

PROCEDURE TImportXML.CarregaDuplicatas;
var
  I: Integer;
begin
  //
  Dup.CreateDataSet;
  Dup.EmptyDataSet;
  Dup.Open;
  if true then
    if Nfe.NotasFiscais[0].Nfe.Ide.indPag = ipVista then
    begin
      Dup.Insert;
      DupDOC.AsString := Nfe.NotasFiscais[0].Nfe.Cobr.Fat.nFat;
      DupVenc.AsDateTime := Nfe.NotasFiscais[0].Nfe.Ide.dEmi;
      DupValor.AsCurrency := Nfe.NotasFiscais[0].Nfe.Cobr.Fat.vLiq;
      Dup.Post;
    end
    else
    begin
      for I := 0 to Nfe.NotasFiscais[0].Nfe.Cobr.Dup.Count - 1 do
      begin
        Dup.Insert;
        DupDOC.AsString := Nfe.NotasFiscais[0].Nfe.Cobr.Dup.Items[I].nDup;
        DupVenc.AsDateTime := Nfe.NotasFiscais[0].Nfe.Cobr.Dup.Items[I]
          .dVenc;
        DupValor.AsCurrency := Nfe.NotasFiscais[0].Nfe.Cobr.Dup.Items[I]
          .vDup;
        Dup.Post;
      end;
    end;

end;

procedure TImportXML.CarregaProdutos;
var
  I: Integer;
  Prod: Integer;
  sIPI: String;
begin
  //
  Items.CreateDataSet;
  Items.EmptyDataSet;
  Items.Open;
  Prod := Nfe.NotasFiscais[0].Nfe.Det.Count;
  for I := 0 to Prod - 1 do
  begin
    Items.Insert;
    ItemsCOD_PRO.AsString := Nfe.NotasFiscais[0].Nfe.Det.Items[I].Prod.cProd;
    ItemsEAN.AsString := Nfe.NotasFiscais[0].Nfe.Det.Items[I].Prod.cEAN;
    ItemsPRODUTO.AsString := Nfe.NotasFiscais[0].Nfe.Det.Items[I]
      .Prod.xProd;
    ItemsNCM.AsString := Nfe.NotasFiscais[0].Nfe.Det.Items[I].Prod.NCM;
    ItemsMEDIDA.AsString := Nfe.NotasFiscais[0].Nfe.Det.Items[I]
      .Prod.uTrib;
    ItemsQUANT.AsFloat := Nfe.NotasFiscais[0].Nfe.Det.Items[I].Prod.qTrib;
    ItemsVALOR_UNID.AsCurrency := Nfe.NotasFiscais[0].Nfe.Det.Items[I]
      .Prod.vUnTrib;
    ItemsVALOR_TOTAL.AsCurrency := Nfe.NotasFiscais[0].Nfe.Det.Items[I]
      .Prod.vProd;
    ItemsORIG.AsString := OrigToStr
      (Nfe.NotasFiscais[0].Nfe.Det.Items[I].Imposto.ICMS.orig);
    if Nfe.NotasFiscais[0].Nfe.Emit.CRT = crtSimplesNacional then
      ItemsCST.AsString := CSOSNICMSToStr
        (Nfe.NotasFiscais[0].Nfe.Det.Items[I].Imposto.ICMS.CSOSN)
    else
      ItemsCST.AsString := CSTICMSToStr
        (Nfe.NotasFiscais[0].Nfe.Det.Items[I].Imposto.ICMS.CST);
    ItemsBC.AsCurrency := Nfe.NotasFiscais[0].Nfe.Det.Items[I]
      .Imposto.ICMS.vBC;
    ItemsALIQ_ICMS.AsCurrency := Nfe.NotasFiscais[0].Nfe.Det.Items[I]
      .Imposto.ICMS.pICMS;
    ItemsVALOR_ICMS.AsCurrency := Nfe.NotasFiscais[0].Nfe.Det.Items[I]
      .Imposto.ICMS.vICMS;
    ItemsBCST.AsCurrency := Nfe.NotasFiscais[0].Nfe.Det.Items[I]
      .Imposto.ICMS.vBCST;
    ItemsALIQ_ST.AsCurrency := Nfe.NotasFiscais[0].Nfe.Det.Items[I]
      .Imposto.ICMS.pICMSST;
    ItemsVALOR_ST.AsCurrency := Nfe.NotasFiscais[0].Nfe.Det.Items[I]
      .Imposto.ICMS.vICMSST;
    ItemsALIQ_IPI.AsCurrency := Nfe.NotasFiscais[0].Nfe.Det.Items[I]
      .Imposto.IPI.pIPI;
    ItemsVALOR_IPI.AsCurrency := Nfe.NotasFiscais[0].Nfe.Det.Items[I]
      .Imposto.IPI.vIPI;
    ItemsBC_IPI.AsCurrency := Nfe.NotasFiscais[0].Nfe.Det.Items[I]
      .Imposto.IPI.vBC;
    ItemsDESC.AsCurrency := Nfe.NotasFiscais[0].Nfe.Det.Items[I]
      .Prod.vDesc;

    sIPI := trim(CSTIPIToSTR(Nfe.NotasFiscais[0].Nfe.Det.Items[I]
          .Imposto.IPI.CST));
    if sIPI = '99' then
      ItemsCST_IPI.AsString := '49'
    else
    begin
      sIPI := '0' + Copy(sIPI, 2, 1);
    end;

    ItemsCST_IPI.AsString := sIPI;

    ItemsPRedBC.AsCurrency := Nfe.NotasFiscais[0].Nfe.Det.Items[I]
      .Imposto.ICMS.pRedBC;
    ItemsPRedBCST.AsCurrency := Nfe.NotasFiscais[0].Nfe.Det.Items[I]
      .Imposto.ICMS.pRedBCST;

    ItemsPIS_CST.AsString := CSTPISToStr
      (Nfe.NotasFiscais[0].Nfe.Det.Items[I].Imposto.PIS.CST);
    ItemsPIS_BC.AsCurrency := Nfe.NotasFiscais[0].Nfe.Det.Items[I]
      .Imposto.PIS.vBC;
    ItemsPIS_ALIQ.AsCurrency := Nfe.NotasFiscais[0].Nfe.Det.Items[I]
      .Imposto.PIS.pPIS;
    ItemsPIS_VALOR.AsCurrency := Nfe.NotasFiscais[0].Nfe.Det.Items[I]
      .Imposto.PIS.vPIS;

    ItemsCOFINS_CST.AsString := CSTCOFINSToStr
      (Nfe.NotasFiscais[0].Nfe.Det.Items[I].Imposto.COFINS.CST);
    ItemsCOFINS_BC.AsCurrency := Nfe.NotasFiscais[0].Nfe.Det.Items[I]
      .Imposto.COFINS.vBC;
    ItemsCOFINS_ALIQ.AsCurrency := Nfe.NotasFiscais[0].Nfe.Det.Items[I]
      .Imposto.COFINS.pCOFINS;
    ItemsCOFINS_VALOR.AsCurrency := Nfe.NotasFiscais[0].Nfe.Det.Items[I]
      .Imposto.COFINS.vCofins;
    ItemsCFOP.AsString := Nfe.NotasFiscais[0].Nfe.Det.Items[I].Prod.CFOP;
    ItemsQUANT_ENT.AsCurrency := 1;

    Items.Post;
  end;
end;

procedure TImportXML.DBEdit8Change(Sender: TObject);
begin
  if DBEdit8.Text = 'V' then
    CTipo.Caption := 'Á Vista'
  else
    CTipo.Caption := 'Á Prazo';
end;

procedure TImportXML.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If odd(Items.RecNo) then
  begin
    DBGrid2.Canvas.Font.Color := clBlack;
    DBGrid2.Canvas.Brush.Color := $00D5FFFF;
  end
  else
  begin
    DBGrid2.Canvas.Font.Color := clBlack;
    DBGrid2.Canvas.Brush.Color := clWhite;
  end;
  DBGrid2.Canvas.FillRect(Rect);
  DBGrid2.Canvas.TextOut(Rect.Left + 2, Rect.Top, Column.Field.AsString);

end;

procedure TImportXML.DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If odd(Process.RecNo) then
  begin
    DBGrid3.Canvas.Font.Color := clBlack;
    DBGrid3.Canvas.Brush.Color := $00D5FFFF;
  end
  else
  begin
    DBGrid3.Canvas.Font.Color := clBlack;
    DBGrid3.Canvas.Brush.Color := clWhite;
  end;
  DBGrid3.Canvas.FillRect(Rect);
  DBGrid3.Canvas.TextOut(Rect.Left + 2, Rect.Top, Column.Field.AsString);

end;

procedure TImportXML.VerificaFor;
var
  sAux: String;
begin
  COD_FOR := 0;
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  dm.QConsulta.sql.Text := 'select * from fornecedor where CNPJ_FOR=:CNPJ';
  sAux := Func.FormataCNPJ_CPF(FornecedorCNPJ.AsString);
  dm.QConsulta.ParamByName('CNPJ').AsString := sAux;
  dm.QConsulta.Open;
  if dm.QConsulta.IsEmpty then
  begin
    Process.Insert;
    ProcessTABELA.AsString := 'FORNECEDOR';
    ProcessPROBLEMA.AsString := 'NÃO ENCONTRADO';
    ProcessACAO.AsString := 'CADASTRAR';
    Process.Post;
  end
  else
    COD_FOR := dm.QConsulta.FieldByName('COD_FOR').AsInteger;

  dm.QConsulta.close;
  dm.IBTransaction.Commit;
end;

procedure TImportXML.VerificaProd;
var
  sAux: String;
begin
  //
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;

  Items.First;
  while not Items.Eof do
  begin
    dm.QConsulta.close;
    dm.QConsulta.sql.Text :=
      'select * from PRODUTO where CODIGO_BARRA_PRO=:BARRAS';
    sAux := ItemsEAN.AsString;
    dm.QConsulta.ParamByName('BARRAS').AsString := sAux;
    dm.QConsulta.Open;
    if not dm.QConsulta.IsEmpty then
    begin
      Items.Edit;
      ItemsCOD_LOCAL.AsInteger := dm.QConsulta.FieldByName('COD_PRO').AsInteger;
      ItemsQUANT_ENT.AsCurrency := dm.QConsulta.FieldByName
        ('QUANT_UNIDADE_ENTRADA').AsCurrency;
      Items.Post;
    end
    else
    begin
      dm.QConsulta.close;
      dm.QConsulta.sql.Text :=
        'select F.*, P.quant_unidade_entrada from CODIGOS_FORNECEDORES F'+
        ' left outer join PRODUTO P'+
        ' on ( P.cod_pro = F.cod )'+
        'where F.COD_FORNECEDOR=:COD_FOR and F.CODIGO_FORN=:COD';
      dm.QConsulta.ParamByName('COD_FOR').AsInteger := COD_FOR;
      dm.QConsulta.ParamByName('COD').AsString := ItemsCOD_PRO.AsString;
      dm.QConsulta.Open;
      if not dm.QConsulta.IsEmpty then
      begin
        Items.Edit;
        ItemsCOD_LOCAL.AsInteger := dm.QConsulta.FieldByName('CODIGO_LOCAL')
          .AsInteger;
        ItemsQUANT_ENT.AsCurrency := dm.QConsulta.FieldByName
          ('QUANT_UNIDADE_ENTRADA').AsCurrency;
        Items.Post;
      end
      else
      begin
        if ItemsCOD_LOCAL.IsNull then
        begin
          Process.Insert;
          ProcessTABELA.AsString := 'PRODUTO';
          ProcessPROBLEMA.AsString :=
            'NÃO ENCONTRADO COD: ' + ItemsCOD_PRO.AsString;
          ProcessACAO.AsString := 'CADASTRAR';
          ProcessCOD_SEQ.AsInteger := ItemsSEQ.AsInteger;
          Process.Post;
        end;
      end;

    end;
    Items.Next;
  end;

  dm.IBTransaction.Commit;
end;

function TImportXML.VerificaTributacoes: Boolean;
var
   Resultado: Boolean;
begin
//
   Resultado := True;
   Result := False;
   Items.First;
   while not Items.Eof do
      begin
         if ItemsCOD_LOCAL.AsInteger > 0 then
            begin
               Application.CreateForm( TfrmSelecionaCFOPS,frmSelecionaCFOPS);
               frmSelecionaCFOPS.Cod_produto := ItemsCOD_LOCAL.AsInteger;
               frmSelecionaCFOPS.Descricao_produto := ItemsPRODUTO.AsString;
               if frmSelecionaCFOPS.ShowModal = mrCancel then
                  begin
                     Resultado := False;
                     Break;
                  end;
               FreeAndNil( frmSelecionaCFOPS );
            end;
         Items.Next;
      end;
   Result := Resultado;
end;

procedure TImportXML.CadastraFornecedor;
var
  COD_ULTIMO: Integer;
begin
  //
  COD_ULTIMO := 0;
  try
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;

    dm.QConsulta.close;
    dm.QConsulta.sql.Text := 'Select MAX(COD_FOR) ULTIMO from fornecedor';
    dm.QConsulta.Open;
    if dm.QConsulta.FieldByName('ULTIMO').IsNull then
      COD_ULTIMO := 1
    else
      COD_ULTIMO := dm.QConsulta.FieldByName('ULTIMO').AsInteger + 1;
    dm.QConsulta.close;
    dm.QConsulta.sql.Text :=
      'insert into fornecedor( COD_FOR, FJ_FOR, RAZAO_FOR, END_FOR, BAI_FOR, CID_FOR, CEP_FOR, EST_FOR, CNPJ_FOR,'
      + 'INSC_FOR, TEL_FOR, NUM_FOR, CODIGO_IBGE )' +
      ' values( :COD_FOR, :FJ, :RAZAO, :END, :BAIRRO, :CIDADE, :CEP, :UF, :CNPJ, :INSC, :TEL, :NUMERO, :IBGE )';
    dm.QConsulta.ParamByName('COD_FOR').AsInteger := COD_ULTIMO;
    dm.QConsulta.ParamByName('FJ').AsString := FornecedorFJ.AsString;
    dm.QConsulta.ParamByName('RAZAO').AsString := FornecedorRAZAO.AsString;
    dm.QConsulta.ParamByName('END').AsString := FornecedorEND.AsString;
    dm.QConsulta.ParamByName('BAIRRO').AsString := FornecedorBAIRRO.AsString;
    dm.QConsulta.ParamByName('CIDADE').AsString := FornecedorCIDADE.AsString;
    dm.QConsulta.ParamByName('CEP').AsString := FornecedorCEP.AsString;
    dm.QConsulta.ParamByName('UF').AsString := FornecedorUF.AsString;
    dm.QConsulta.ParamByName('CNPJ').AsString := Func.FormataCNPJ_CPF
      (FornecedorCNPJ.AsString);
    dm.QConsulta.ParamByName('INSC').AsString := FornecedorINSC.AsString;
    dm.QConsulta.ParamByName('TEL').AsString := FornecedorTEL.AsString;
    dm.QConsulta.ParamByName('NUMERO').AsString := FornecedorNUMERO.AsString;
    dm.QConsulta.ParamByName('IBGE').AsString := FornecedorIBGE.AsString;
    dm.QConsulta.ExecOrOpen;
    dm.IBTransaction.Commit;
    COD_FOR := COD_ULTIMO;
  except
    on E: Exception do
    begin
      Application.MessageBox
        (PWideChar('Erro ao Cadastrar fornecedor!' + #13 + E.Message), 'Erro',
        mb_applmodal + mb_iconerror + mb_ok);
      COD_FOR := 0;
      dm.IBTransaction.Rollback;

    end;
  end;
end;

procedure TImportXML.VerificaICMSCFOP;
var
  CFOP_P, CFOP: String;
begin
  //
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;

  dm.QConsulta.close;
  dm.QConsulta.sql.Text := 'Select * from GRUPO_ICMS where ALIQUOTA_GRP=:ALIQ';
  dm.QConsulta.ParamByName('ALIQ').AsFloat := ItemsALIQ_ICMS.AsFloat;
  dm.QConsulta.Open;
  if dm.QConsulta.IsEmpty then
  begin
    Process.Insert;
    ProcessTABELA.AsString := 'ICMS';
    ProcessPROBLEMA.AsString := 'NÃO ENCONTRADO %: ' + ItemsALIQ_ICMS.AsString;
    ProcessACAO.AsString := 'CADASTRAR';
    Process.Post;
  end
  else
    COD_ICMS := dm.QConsulta.FieldByName('COD_GRP').AsInteger;
  dm.QConsulta.close;
  dm.QConsulta.sql.Text := 'Select * from CFOP where COD_CFO=:CFOP';
  CFOP := ItemsCFOP.AsString;
  if CFOP[1] = '6' then
    CFOP_P := '2' + Copy(CFOP, 2, 3)
  else if CFOP[1] = '5' then
    CFOP_P := '1' + Copy(CFOP, 2, 3);

  // CFOP_P :=
  dm.QConsulta.ParamByName('CFOP').AsInteger := StrToInt(CFOP_P);
  dm.QConsulta.Open;
  if dm.QConsulta.IsEmpty then
  begin
    Process.Insert;
    ProcessTABELA.AsString := 'CFOP';
    ProcessPROBLEMA.AsString := 'NÃO ENCONTRADO CFOP: ' + CFOP_P;
    COD_CFO := StrToInt(CFOP_P);
    ProcessACAO.AsString := 'CADASTRAR';
    Process.Post;
  end
  else
    COD_CFOP := dm.QConsulta.FieldByName('COD_CFO').AsInteger;
  dm.QConsulta.close;
  dm.IBTransaction.Commit
end;

procedure TImportXML.CadastraICMS;
var
  COD: Integer;
begin
  //
  try
    if COD_ICMS > 0 then
      exit;
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;

    dm.QConsulta.close;
    dm.QConsulta.sql.Text := 'select MAX( COD_GRP ) ULTIMO from GRUPO_ICMS';
    dm.QConsulta.Open;
    if dm.QConsulta.IsEmpty then
      COD := 1
    else
      COD := dm.QConsulta.FieldByName('ULTIMO').AsInteger + 1;
    dm.QConsulta.close;
    dm.QConsulta.sql.Text := 'insert into grupo_icms( COD_GRP, NOME_GRP,' +
      ' ALIQUOTA_GRP, TIPO_GRP, CST, ICMS_SERVICO_GRP, ECF ) Values ( :COD, :NOME,'
      + ' :ALIQUOTA, :TIPO, :CST, :ICMS_SERVICO, :ECF)';
    dm.QConsulta.ParamByName('COD').AsInteger := COD;
    dm.QConsulta.ParamByName('NOME').AsString :=
      'ICMS TRIBUTADO ' + ItemsALIQ_ICMS.AsString + '%';
    dm.QConsulta.ParamByName('ALIQUOTA').AsFloat := ItemsALIQ_ICMS.AsFloat;
    dm.QConsulta.ParamByName('TIPO').AsString := 'TRI';
    dm.QConsulta.ParamByName('CST').AsString :=
      ItemsORIG.AsString + ItemsCST.AsString;
    dm.QConsulta.ParamByName('ICMS_SERVICO').AsString := 'I';
    dm.QConsulta.ParamByName('ECF').AsString := 'S';
    dm.QConsulta.ExecOrOpen;
    dm.IBTransaction.Commit;
    COD_ICMS := COD;
  except
    on E: Exception do
    begin
      Application.MessageBox
        (PWideChar('Erro ao Cadastrar ICMS!' + #13 + E.Message), 'Erro',
        mb_applmodal + mb_iconerror + mb_ok);
      COD_ICMS := 0;
      dm.IBTransaction.Rollback;

    end;
  end;
end;

procedure TImportXML.CadastraCFOP;
var
  DESC: String;
  COD: Integer;
begin
  //

  DESC := InputBox('Cadastro de CFOP',
    'Digite a descrição do CFOP ' + IntToStr(COD_CFO),
    'EX: COMPRAS PARA REVENDA');
  if DESC = '' then
  begin
    Application.MessageBox('CFOP não cadstrado é obrigatório seu cadastro!',
      'Erro', mb_applmodal + mb_iconerror + mb_ok);
    sSpeedButton1Click(nil);
    exit;
  end;

  try
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;

    dm.QConsulta.close;
    dm.QConsulta.sql.Text :=
      'INSERT INTO CFOP (COD_CFO, NOME_CFO, DESTACA_ICMS,' +
      ' SAIR_REL_RESUMO_ALIQ, TIPO, REGISTRADO_ECF, CALCULA_PIS_COFINS, USA_CSOSN)' + ' VALUES (:CFOP, :DESC, :DESTACA_ICMS, :SAIR_REL, :TIPO, :ECF, :PIS, :CSOSN);';
    dm.QConsulta.ParamByName('CFOP').AsInteger := COD_CFO;
    dm.QConsulta.ParamByName('DESC').AsString := DESC;
    if NotaBCICMS.AsFloat > 0 then
      dm.QConsulta.ParamByName('DESTACA_ICMS').AsString := 'S'
    else
      dm.QConsulta.ParamByName('DESTACA_ICMS').AsString := 'N';
    dm.QConsulta.ParamByName('SAIR_REL').AsString := 'S';
    dm.QConsulta.ParamByName('TIPO').AsString := 'E';
    dm.QConsulta.ParamByName('ECF').AsString := 'S';
    dm.QConsulta.ParamByName('PIS').AsString := 'S';
    if Length(ItemsCST.AsString) > 2 then
      dm.QConsulta.ParamByName('CSOSN').AsString := 'S'
    else
      dm.QConsulta.ParamByName('CSOSN').AsString := 'N';
    dm.QConsulta.ExecOrOpen;
    dm.IBTransaction.Commit;
    COD_CFOP := COD_CFO;

  except
    on E: Exception do
    begin
      Application.MessageBox
        (PWideChar('Erro ao Cadastrar CFOP!' + #13 + E.Message), 'Erro',
        mb_applmodal + mb_iconerror + mb_ok);
      COD_CFOP := 0;
      dm.IBTransaction.Rollback;
    end;
  end;
end;

procedure TImportXML.CadastraProduto(SEQ: Integer);
var
  COD: Integer;
  COD_MEDIDA: Integer;
begin
  Items.Locate('SEQ', SEQ, []);
  COD_MEDIDA := BuscaMedida(ItemsMEDIDA.AsString);
  if not(ItemsSEQ.AsInteger = SEQ) then
  begin
    Application.MessageBox('Sequencia de produto não localizada', 'Erro',
      mb_applmodal + mb_iconerror + mb_ok);
    exit;
  end;

  try
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;

    dm.QConsulta.close;
    dm.QConsulta.sql.Text := 'Select MAX(COD_PRO) ULTIMO from PRODUTO';
    dm.QConsulta.Open;
    if dm.QConsulta.FieldByName('ULTIMO').IsNull then
      COD := 1
    else
      COD := dm.QConsulta.FieldByName('ULTIMO').AsInteger + 1;

    Items.Edit;
    ItemsCOD_LOCAL.AsInteger := COD;
    Items.Post;

    dm.QConsulta.close;
    dm.QConsulta.sql.Text :=
      'INSERT INTO PRODUTO(COD_PRO, NOME_PRO, DESC_CUPOM, COD_LAB, COD_SEC, VALOR_PRO, PROMOCAO_PRO, CONTROLA_ESTOQUE_PRO, COMISSAO_PRO, CODIGO_UNIDADE_ENTRADA, '
      +
      'CODIGO_UNIDADE_SAIDA, QUANT_UNIDADE_ENTRADA, CODIGO_BARRA_PRO, ESTOQUE_MINIMO_PRO, ATIVO_PRO, MARGEM_LUCRO_PRO, LOCALIZACAO_PRO, '
      +
      'PRODUTO_PESADO_PRO, COD_SETOR, TECLA_ATALHO_PRO, INDICE_RECEITA_PRO, DIAS_VALIDADE_PRO, REFERENCIA_PRO, COMPLEMENTO_PRO, '
      + 'ICMS_CONT_EST, ICMS_CONT_FORA, ICMS_CF_EST, ICMS_CF_FORA, CST_CONT_EST, CST_CONT_FORA, CST_CF_EST, CST_CF_FORA, ' +
      'CAMINHO_FOTO_PRO, SAIR_TABELA_PRECO, CFOP_VENDAS_CONT_EST, CFOP_VENDAS_CF_EST, CFOP_VENDAS_CONT_FORA, '
      + 'CFOP_VENDAS_CF_FORA, ST_CONT_EST, VR_AGREG_CONT_EST, IPI_CONT_EST, IPI_CF_EST, IPI_CONT_FORA, IPI_CF_FORA, RED_CONT_EST, ' +
      'RED_CF_EST, RED_CONT_FORA, RED_CF_FORA, CODIGO_TIPO, COD_NCM, COD_PRODUTO_ESTOQUE, ' + 'COD_GRUPO, SUB_GRUPO, ALIQUOTA_PIS, ALIQUOTA_COFINS, ALIQUOTA_IR, ALIQUOTA_CSLL, ALIQUOTA_OUTRAS, ISENTO_PIS_COFINS_PRO, ' + 'PRECO_CUSTO, CREDITO_ICMS, PRECO_PRAZO_PRO, TIPO_PRODUCAO, DATA_VALIDADE, CODIGO_SETOR_ESTOQUE, ORIG, CSOSN, TAMANHO, COR, OBS, CST_PIS, CST_COFINS, CST_IPI) ' + 'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11, :12, :13, :14, :15, :16, :17, :18, :19, :20, :21, :22, :24, :25, :26, :27, :28, ' + ':29, :30, :31, :32, :33, :34, :37, :41, :42, :43, :44, :45, :49, :53, :54, :55, :56, :61, :62, :63, ' + ':64, :65, :67, :69, :71, :72, :73, :74, :75, :76, :77, :78, 0, 0, :79, :80, :81, :82, :ORIG, :CSOSN, :TAMANHO, :COR, :OBS, :CST_PIS, :CST_COFINS, :CST_IPI)';

    with dm.QConsulta do
    begin
      /// Alteração MAICON
      ///

      ParamByName('ORIG').AsInteger := ItemsORIG.AsInteger;

      if Length(ItemsCST.AsString) > 2 then
        ParamByName('CSOSN').AsString := ItemsCST.AsString
      else
        ParamByName('CSOSN').AsString := '400';

      ParamByName('TAMANHO').AsString := '';
      ParamByName('COR').AsString := '';
      ParamByName('OBS').AsString := '';
      ParamByName('CST_PIS').AsString := ItemsPIS_CST.AsString;
      ParamByName('CST_COFINS').AsString := ItemsCOFINS_CST.AsString;

      ParamByName('1').AsInteger := COD;
      ParamByName('2').AsString := trim(ItemsPRODUTO.AsString);
      ParamByName('3').AsString := trim(ItemsPRODUTO.AsString);
      ParamByName('4').AsInteger := 1;
      ParamByName('5').AsInteger := 1;
      ParamByName('6').AsCurrency := ItemsVALOR_UNID.AsCurrency;
      ParamByName('7').AsCurrency := ItemsVALOR_UNID.AsCurrency;
      ParamByName('8').AsString := 'S';

      ParamByName('9').AsCurrency := 0; // Comissao
      ParamByName('10').AsInteger := COD_MEDIDA; // UNID ENTRADA
      ParamByName('11').AsInteger := COD_MEDIDA; // UNID SAIDA
      ParamByName('12').AsFloat := 1; // QUANT ENTRADA
      if ItemsEAN.AsString = '' then
        ParamByName('13').AsString := IntToStr(COD)
      else
        ParamByName('13').AsString := ItemsEAN.AsString;
      ParamByName('14').AsCurrency := 0; // EST MINIMO

      ParamByName('15').AsString := 'S'; // ATIVO
      ParamByName('16').AsCurrency := 0; // MARGEN LUCRO
      ParamByName('17').Value := null; // LOCALIZAÇAo
      ParamByName('18').AsString := 'N'; // PESADO
      ParamByName('19').Value := null; // SETOR BALANCA
      ParamByName('20').Value := null; // TECLA
      ParamByName('21').Value := null; // RECEITA
      ParamByName('22').Value := null; // VALIDADE
      ParamByName('24').Value := null; // REFERENCIA
      ParamByName('25').AsString := 'S'; // COMPLEMENTO

      ParamByName('26').Value := 1; //ICMS
      ParamByName('27').Value := 1; // ICMS
      ParamByName('28').Value := 1; //ICMS
      ParamByName('29').Value := 1; //ICMS

      if Length(ItemsCST.AsString) = 2 then
      begin
        ParamByName('30').AsString := ItemsORIG.AsString + ItemsCST.AsString;
        ParamByName('31').AsString := ItemsORIG.AsString + ItemsCST.AsString;
        ParamByName('32').AsString := ItemsORIG.AsString + ItemsCST.AsString;
        ParamByName('33').AsString := ItemsORIG.AsString + ItemsCST.AsString;
      end
      else
      begin
        ParamByName('30').AsString := '040';
        ParamByName('31').AsString := '040';
        ParamByName('32').AsString := '040';
        ParamByName('33').AsString := '040';
      end;
      ParamByName('34').Value := null; // Imagens
      ParamByName('37').AsString := 'S'; // CHEQUE TABELA

      ParamByName('41').Value := null; // CFOPS
      ParamByName('42').Value := null; // CFOPS
      ParamByName('43').Value := null; // CFOPS
      ParamByName('44').Value := null; // CFOPS

      if ItemsVALOR_ST.AsFloat > 0 then
        ParamByName('45').AsString := 'S'
      else
        ParamByName('45').AsString := 'N';

      ParamByName('49').AsCurrency := ItemsALIQ_ST.AsFloat;
      ParamByName('53').AsCurrency := ItemsALIQ_IPI.AsCurrency;
      // StrToCurr(EdtIPICONTEst.Text);
      ParamByName('54').AsCurrency := ItemsALIQ_IPI.AsCurrency;
      ParamByName('55').AsCurrency := ItemsALIQ_IPI.AsCurrency;
      ParamByName('56').AsCurrency := ItemsALIQ_IPI.AsCurrency;
      ParamByName('61').AsCurrency := ItemsPRedBC.AsCurrency;
      ParamByName('62').AsCurrency := ItemsPRedBC.AsCurrency;
      ParamByName('63').AsCurrency := ItemsPRedBC.AsCurrency;
      ParamByName('64').AsCurrency := ItemsPRedBC.AsCurrency;
      ParamByName('65').AsInteger := 1; // TIPO
      ParamByName('67').AsString := ItemsNCM.AsString;
      ParamByName('69').AsInteger := COD;
      ParamByName('71').Value := null; // GRUPO
      ParamByName('72').Value := null; // SUBGRUPO

      ParamByName('73').AsCurrency := ItemsPIS_ALIQ.AsCurrency;
      ParamByName('74').AsCurrency := ItemsCOFINS_ALIQ.AsCurrency;
      ParamByName('75').AsCurrency := 0;
      ParamByName('76').AsCurrency := 0;
      ParamByName('77').AsCurrency := 0;
      if ItemsPIS_VALOR.AsCurrency > 0 then
        ParamByName('78').AsString := 'S'
      else
        ParamByName('78').AsString := 'N';

      ParamByName('79').AsCurrency := ItemsVALOR_UNID.AsCurrency;
      ParamByName('80').AsString := 'T';

      ParamByName('81').Value := null; // VALIDADE
      ParamByName('82').AsInteger := 1; // SETOR ESTOQUE
      ParamByName('CST_IPI').AsString := '53';

    end;
    dm.QConsulta.ExecOrOpen;
         dm.QConsulta.close;
      dm.QConsulta.sql.Text :=
        'Insert into CODIGOS_FORNECEDORES( CODIGO_LOCAL, COD_FORNECEDOR, CODIGO_FORN )'+
        ' values( :CODIGO_LOCAL, :COD_FORNECEDOR, :CODIGO_FORN )';
      dm.QConsulta.ParamByName('CODIGO_LOCAL').AsInteger := COD;
      dm.QConsulta.ParamByName('COD_FORNECEDOR').AsInteger := COD_FOR;
      dm.QConsulta.ParamByName('CODIGO_FORN').AsString :=
        ItemsCOD_PRO.AsString;
      dm.QConsulta.ExecOrOpen;
    dm.IBTransaction.Commit;
  except
    on E: Exception do
    begin
      Application.MessageBox
        (PWideChar('Erro ao Cadastrar Produto!' + #13 + E.Message), 'Erro',
        mb_applmodal + mb_iconerror + mb_ok);
      dm.IBTransaction.Rollback;

    end;
  end;

end;

procedure TImportXML.CalculaCabecalho(COD_ENT: Integer);
var
  cTotal, cTotalBaseICMS, cTotalIcms, cTotalBaseSub, cTotalICMSSub, cTotalIPI,
    cTotalQuant, cTotalPIS, cTotalCOFINS, cTotalDesconto: currency;
  bSomarItens: Boolean;
begin
  cTotal := 0;
  cTotalBaseICMS := 0;
  cTotalIcms := 0;
  cTotalBaseSub := 0;
  cTotalICMSSub := 0;
  cTotalIPI := 0;
  cTotalQuant := 0;
  cTotalPIS := 0;
  cTotalCOFINS := 0;
  cTotalDesconto := 0;

  { VERIFICA SE VAI SOMAR A QTD DO ITENS }
  dmi.ITENS_NOTA.Close;
  dmi.ITENS_NOTA.ParamByName( 'COD_ENT' ).AsInteger := COD_ENT;
  dmi.ITENS_NOTA.Open;
  DMI.ITENS_NOTA.First;
  while not DMI.ITENS_NOTA.Eof do
     begin
        cTotal := cTotal + dmi.ITENS_NOTAVALOR_TOTAL.AsCurrency;

          // SOMA AS BASES, ICMS e IPI
          cTotalBaseICMS := cTotalBaseICMS + dmi.ITENS_NOTABASE_CALCULO.AsCurrency;
          cTotalIcms := cTotalIcms + dmi.ITENS_NOTAVALOR_ICMS.AsCurrency;
          cTotalBaseSub := cTotalBaseSub + dmi.ITENS_NOTABC_ST.AsCurrency;
          cTotalICMSSub := cTotalICMSSub + dmi.ITENS_NOTAVALOR_SUB_TRIBUTARIA.AsCurrency;
          cTotalIPI := cTotalIPI + dmi.ITENS_NOTAVALOR_IPI.AsCurrency;
          cTotalPIS := cTotalPIS + dmi.ITENS_NOTAVALOR_PIS.AsCurrency;
          cTotalCOFINS := cTotalCOFINS + dmi.ITENS_NOTAVALOR_COFINS.AsCurrency;
          cTotalDesconto := cTotalDesconto + DMI.ITENS_NOTAVALOR_DESCONTO.AsCurrency;

        dmi.ITENS_NOTA.Next;
     end;
     dmi.ITENS_NOTA.Close;
     dmi.QNota.Close;
     dmi.QNota.ParamByName( 'COD_ENT' ).AsInteger := COD_ENT;
     DMI.QNota.Open;
     if not dmi.QNota.IsEmpty then
        begin
           dmi.QNota.Edit;
           dmi.QNotaTOTAL_ENT.AsCurrency := ( cTotal + cTotalIPI + cTotalICMSSub ) - cTotalDesconto;
           dmi.QNotaTOTAL_PRODUTOS.AsCurrency :=  cTotal;
           DMI.QNotaACRES_ENT.AsCurrency := 0;
           dmi.QNotaDESC_ENT.AsCurrency := cTotalDesconto;
           dmi.QNotaFRETE_ENT.AsCurrency := 0;
           DMI.QNotaBASE_SUB_TRIB.AsCurrency := cTotalBaseSub;
           DMI.QNotaVALOR_ICMS_SUB.AsCurrency :=  cTotalICMSSub;
           DMI.QNotaVALOR_PIS.AsCurrency := cTotalPIS;
           DMI.QNotaVALOR_COFINS.AsCurrency := cTotalCOFINS;
           DMI.QNotaBC_ICMS.AsCurrency := cTotalBaseICMS;
           DMI.QNotaVL_ICMS.AsCurrency := cTotalIcms;
           DMI.QNotaVL_IPI.AsCurrency := cTotalIPI;
           DMI.QNotaVL_SEG.AsCurrency := 0;

           dmi.QNota.Post;
        end;
     DMI.QNota.Close;

end;

procedure TImportXML.CalculaItens(COD_ENT: Integer);
var
  cAuxiTotal: currency;
  cAuxiTotalProd: currency;
  cAuxiBaseICMS: currency;
  cAuxiValorICMS: currency;
  cAuxiValorPIS: currency;
  cAuxiBasePIS: currency;
  cAuxiValorCOFINS: currency;
  cAuxiBaseCOFINS: currency;
  cAuxiBaseSubTrib: currency;
  cAuxiValorSubTrib: currency;
  cAuxiValorIPI: currency;
  cAuxiDesconto: currency;
  cAuxiTxDesconto: currency;
  cAuxiAliquotaICMS: currency;
  frete, calc_frete, desconto, calc_desconto: Double;
begin
//
  cAuxiTxDesconto := 0;
  cAuxiTotal := 0;
  frete := 0;
  desconto := 0;
  DMI.ITENS_NOTA.Close;
  DMI.ITENS_NOTA.ParamByName( 'COD_ENT' ).AsInteger := COD_ENT;
  DMI.ITENS_NOTA.Open;
  DMI.ITENS_NOTA.First;
  while not DMI.ITENS_NOTA.Eof do
     begin
        cAuxiTotal := 0;
        cAuxiTotalProd := 0;
        cAuxiBaseICMS := 0;
        cAuxiValorICMS := 0;
        cAuxiBaseSubTrib := 0;
        cAuxiValorSubTrib := 0;
        cAuxiValorIPI := 0;
        cAuxiDesconto := 0;
        cAuxiValorPIS := 0;
        cAuxiValorCOFINS := 0;
        cAuxiBasePIS := 0;
        cAuxiBaseCOFINS := 0;
        cAuxiAliquotaICMS := DMI.ITENS_NOTAPERC_ICMS.AsCurrency;

       { calcula o Total dos produtos }
        cAuxiTotalProd := DMI.ITENS_NOTAQTDUND_ENT.AsCurrency *
        DMI.ITENS_NOTAVALOR_UNIT_PRO.AsCurrency;

        cAuxiDesconto := DMI.ITENS_NOTAVALOR_DESCONTO.AsCurrency;
        if cAuxiDesconto > 0 then
           begin
              cAuxiTxDesconto := ( cAuxiDesconto * 100 ) / cAuxiTotalProd;
              cAuxiTotalProd := cAuxiTotalProd - cAuxiDesconto;
           end;

      { calcula a base e o valor do icms }
        if trim(dm.RetornaStringTabela('destaca_icms', 'cfop', 'cod_cfo',
         DMI.ITENS_NOTACOD_CFOP.AsInteger)) = 'S' then
            begin
              if cAuxiAliquotaICMS > 0 then
                begin
                  if DMI.ITENS_NOTAPERC_BCR.AsCurrency > 0 then
                      begin
                        cAuxiBaseICMS := cAuxiTotalProd -
                        ((cAuxiTotalProd * DMI.ITENS_NOTAPERC_BCR.AsCurrency) / 100);
                        cAuxiValorICMS := ((cAuxiBaseICMS *cAuxiAliquotaICMS)
                        / 100);
                      end
                  else
                      begin
                        cAuxiBaseICMS := cAuxiTotalProd;
                        cAuxiValorICMS := ((cAuxiTotalProd * cAuxiAliquotaICMS)
                        / 100);
                      end;
                end;

            end
         else
            begin
                cAuxiBaseICMS := 0;
                cAuxiValorICMS := 0;
                cAuxiAliquotaICMS := 0;
            end;

      { calcula a base e o valor da sub.tributaria }
      if MesmoEstado and ( DMI.ITENS_NOTAPERC_ST.AsCurrency > 0 ) then
        begin
          cAuxiBaseSubTrib := cAuxiBaseICMS +
            ((cAuxiBaseICMS * DMI.ITENS_NOTAPERC_ST.AsCurrency) / 100);
          cAuxiValorSubTrib := ((cAuxiBaseSubTrib * cAuxiAliquotaICMS)
              / 100) - cAuxiValorICMS;
        end;

      { calcula o valor do ipi }
      if dmi.ITENS_NOTAPERC_IPI.AsCurrency > 0 then
        cAuxiValorIPI := ((cAuxiTotalProd * dmi.ITENS_NOTAPERC_IPI.AsCurrency)
            / 100);


      { PIS E COFINS }
      if DMI.ITENS_NOTAALIQ_PIS.AsCurrency > 0 then
      begin
        cAuxiBasePIS := cAuxiTotalProd;
        cAuxiBaseCOFINS := cAuxiTotalProd;
        cAuxiValorPIS := (cAuxiTotalProd * DMI.ITENS_NOTAALIQ_PIS.AsCurrency) / 100;
        cAuxiValorCOFINS := (cAuxiTotalProd * DMI.ITENS_NOTAALIQ_COFINS.AsCurrency)
          / 100;
      end;

        { calcula o total geral do produto }
        cAuxiTotal := (cAuxiTotalProd + cAuxiValorIPI + cAuxiValorSubTrib);

        DMI.ITENS_NOTA.Edit;
        DMI.ITENS_NOTAVALOR_TOTAL.AsCurrency := cAuxiTotal;
        Dmi.ITENS_NOTABASE_CALCULO.AsCurrency := cAuxiBaseICMS;
        DMI.ITENS_NOTAVALOR_ICMS.AsCurrency := cAuxiValorICMS;
        dmi.ITENS_NOTABC_ST.AsCurrency := cAuxiBaseSubTrib;
        dmi.ITENS_NOTAVALOR_SUB_TRIBUTARIA.AsCurrency := cAuxiValorSubTrib;
        dmi.ITENS_NOTAVALOR_IPI.AsCurrency := cAuxiValorIPI;
        dmi.ITENS_NOTAVALOR_PIS.AsCurrency := cAuxiValorPIS;
        dmi.ITENS_NOTAVALOR_COFINS.AsCurrency := cAuxiValorCOFINS;

        DMI.ITENS_NOTA.Post;
        DMI.ITENS_NOTA.Next;
     end;

end;

procedure TImportXML.CalculaNota(COD_ENT: Integer);

begin
//
   CalculaItens( COD_ENT );
   CalculaCabecalho( COD_ENT );
end;

function TImportXML.BuscaMedida(DESC: string): Integer;
var
  COD: Integer;
begin

  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;

  dm.QConsulta.close;
  dm.QConsulta.sql.Text := 'Select * from UNIDADE_MEDIDA where DESCRICAO=:DESC';
  dm.QConsulta.ParamByName('DESC').AsString := trim(DESC);
  dm.QConsulta.Open;
  if dm.QConsulta.IsEmpty then
  begin
    dm.QConsulta.close;
    dm.QConsulta.sql.Text := 'Select MAX( CODIGO ) from UNIDADE_MEDIDA';
    dm.QConsulta.Open;
    COD := dm.QConsulta.FieldByName('MAX').AsInteger + 1;
    dm.QConsulta.close;
    dm.QConsulta.sql.Text := 'INSERT INTO UNIDADE_MEDIDA (CODIGO, DESCRICAO)' +
      ' VALUES (:COD, :DESC )';
    dm.QConsulta.ParamByName('COD').AsInteger := COD;
    dm.QConsulta.ParamByName('DESC').AsString := DESC;
    dm.QConsulta.ExecOrOpen;
  end
  else
  begin
    COD := dm.QConsulta.FieldByName('CODIGO').AsInteger;
  end;
  dm.QConsulta.close;
  dm.IBTransaction.Commit;
  result := COD;
end;

function TImportXML.Numeros(S: string): Integer;
var
  I: Integer;
  T: String;
begin
  for I := 1 to Length(S) do
  begin
    if not(S[I] in ['0' .. '9']) then
    begin
      result := 0;
      exit;
    end
    else
      T := T + S[I];
  end;
  if T = '' then
    result := 0
  else
    result := StrToInt(T);

end;

procedure TImportXML.SalvaNotaClick(Sender: TObject);
begin
  if PODE_IMPORTAR then
  begin
     if not VerificaTributacoes then
        begin
           KDialog( 'Precisa Verificar todas tributações de entrada', 'Importação de XML', tdtInfo);
           Exit;
        end;
     ImportarTudo;
  end;
end;

procedure TImportXML.Associa(SEQ: Integer);
begin
  //
  Items.Locate('SEQ', SEQ, []);
  if not(ItemsSEQ.AsInteger = SEQ) then
  begin
    Application.MessageBox('Sequencia de produto não localizada', 'Erro',
      mb_applmodal + mb_iconerror + mb_ok);
    exit;
  end;

  COD_LOCALIZA := 0;
  Application.CreateForm(TFrmConsProd, FrmConsProd);
  FrmConsProd.Tag := 98;
  FrmConsProd.Men.Caption := 'ASSOCIAÇÃO : ' + ItemsPRODUTO.AsString;
  FrmConsProd.showmodal;
  if COD_LOCALIZA > 0 then
  begin
    if Trim( ItemsCOD_PRO.AsString ) <> '' then
    begin
      if dm.IBTransaction.Active then
        dm.IBTransaction.Commit;
      dm.IBTransaction.StartTransaction;

      dm.QConsulta.close;
      dm.QConsulta.sql.Text :=
        'Insert into CODIGOS_FORNECEDORES( CODIGO_LOCAL, COD_FORNECEDOR, CODIGO_FORN )'+
        ' values( :CODIGO_LOCAL, :COD_FORNECEDOR, :CODIGO_FORN )';
      dm.QConsulta.ParamByName('CODIGO_LOCAL').AsInteger := COD_LOCALIZA;
      dm.QConsulta.ParamByName('COD_FORNECEDOR').AsInteger := COD_FOR;
      dm.QConsulta.ParamByName('CODIGO_FORN').AsString :=
        ItemsCOD_PRO.AsString;
      dm.QConsulta.ExecOrOpen;
      dm.IBTransaction.Commit;
    end;
    Items.Edit;
    ItemsCOD_LOCAL.AsInteger := COD_LOCALIZA;
    ItemsQUANT_ENT.AsCurrency := Quant_ent;
    Items.Post;
  end;
end;

function TImportXML.ImportaCabecalho: Integer;
var
  CODENT: Integer;
begin
  try

    dm.QConsulta.close;
    dm.QConsulta.sql.Clear;
    dm.QConsulta.sql.Text :=
      'select max( COD_ENT ) from ENTRADAS where COD_EMP=:CODEMP';
    dm.QConsulta.ParamByName('CODEMP').AsInteger := iEmp;
    dm.QConsulta.Open;
    if dm.QConsulta.IsEmpty then
      CODENT := 1
    else
      CODENT := dm.QConsulta.FieldByName('MAX').AsInteger + 1;
    dm.QConsulta.close;

    dm.QConsulta.sql.Clear;
    dm.QConsulta.sql.Text := 'select * from ENTRADAS where CHAVE_NFE=:CHAVE';
    dm.QConsulta.ParamByName('CHAVE').AsString := NotaCHAVE_NFE.AsString;
    dm.QConsulta.Open;
    if not dm.QConsulta.IsEmpty then
    begin
      dm.QConsulta.close;
      AlertaCad('Nota ja foi importada antes');
      result := 0;
      exit;
    end;
    dm.QConsulta.close;

    dmi.Nota.Open;
    dmi.Nota.Insert;
    dmi.NotaCOD_ENT.AsInteger := CODENT;
    dmi.NotaCOD_EMP.AsInteger := iEmp;
    dmi.NotaDATAEMI_ENT.AsDateTime := ImportXML.NotaDATAEMI_ENT.AsDateTime;
    dmi.NotaDATAENT_ENT.AsDateTime := ImportXML.NotaDATAENT_ENT.AsDateTime;
    dmi.NotaCOD_FOR.AsInteger := COD_FOR;
    dmi.NotaTOTAL_ENT.AsCurrency := ImportXML.NotaTOTAL_ENT.AsCurrency;
    dmi.NotaACRES_ENT.AsCurrency := ImportXML.NotaACRES_ENT.AsCurrency;
    dmi.NotaDESC_ENT.AsCurrency := ImportXML.NotaDESC_ENT.AsCurrency;
    dmi.NotaFRETE_ENT.AsCurrency := ImportXML.NotaFRETE_ENT.AsCurrency;

    dmi.NotaICMSFRETE_ENT.AsCurrency := 0;
    dmi.NotaTIPO_ENT.AsString := ImportXML.NotaTIPOENT.AsString;
    dmi.NotaNUMNF_ENT.AsString := ImportXML.NotaNUMNF_ENT.AsString;
    dmi.NotaSERIE_ENT.AsString := ImportXML.NotaSERIE_ENT.AsString;
    dmi.NotaBASE_SUB_TRIB.AsCurrency := ImportXML.NotaBASE_SUB_TRIB.AsCurrency;

    dmi.NotaVALOR_ICMS_SUB.AsCurrency :=
      ImportXML.NotaVALOR_ICMS_SUB.AsCurrency;


    dmi.NotaFRETE_INCLUSO.AsString := ImportXML.NotaFRETE_INCLUSO.AsString;
    dmi.NotaICMS_SUB_INCLUSO.AsString :=
      ImportXML.NotaICMS_SUB_INCLUSO.AsString;
    dmi.NotaTOTAL_PRODUTOS.AsCurrency :=
      ImportXML.NotaTOTAL_PRODUTOS.AsCurrency;
    dmi.NotaCUSTO_SEM_DESCONTO.AsString :=
      ImportXML.NotaCUSTO_SEM_DESC.AsString;
    dmi.NotaCODIFICACAO_FISCAL.AsString :=
      ImportXML.NotaCODIFICACAO_FISCAL.AsString;
    dmi.NotaCODIGO_ES.AsInteger := 1;
    dmi.NotaCHAVE_NFE.AsString := ImportXML.NotaCHAVE_NFE.AsString;
    dmi.NotaVALOR_PIS.AsCurrency := ImportXML.NotaV_PIS.AsCurrency;
    dmi.NotaVALOR_COFINS.AsCurrency := ImportXML.NotaV_COFINS.AsCurrency;
    dmi.NotaCODIGO_ESTADO.AsString := ImportXML.NotaCODIGO_ES.AsString;
    DMI.NotaBC_ICMS.AsCurrency := NotaBCICMS.AsCurrency;
    DMI.NotaVL_ICMS.AsCurrency := NotaVALOR_ICMS.AsCurrency;
    DMI.NotaVL_IPI.AsCurrency := NotaV_IPI.AsCurrency;
    dmi.NotaVL_SEG.AsCurrency := NotaV_SEG.AsCurrency;
    dmi.Nota.Post;
    dmi.Nota.close;
    result := CODENT;

  except
    on E: Exception do
    begin
      Application.MessageBox
        (PWideChar('Erro ao Cadastrar Nota!' + #13 + E.Message), 'Erro',
        mb_applmodal + mb_iconerror + mb_ok);
      dm.IBTransaction.Rollback;
      dmi.IBTRImport.Rollback;
      result := 0;
    end;
  end;
end;

function TImportXML.ImportaItens(COD_ENT: Integer): Boolean;
begin
  try
    Items.First;
    if Items.IsEmpty then
      result := false;
    while not Items.Eof do
    begin
      if ItemsCOD_LOCAL.AsInteger > 0 then
      begin
        DMI.PRODUTO_T_E.Close;
        dmi.PRODUTO_T_E.ParamByName( 'COD_PRO' ).AsInteger := ItemsCOD_LOCAL.AsInteger;
        DMI.PRODUTO_T_E.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
        dmi.PRODUTO_T_E.Open;
        if DMI.PRODUTO_T_E.IsEmpty then
           begin
              KDialog( 'Erro ao Buscar Tributos Item - '+ IntToStr( ItemsCOD_LOCAL.AsInteger ),
              'Importação de Nota Fiscal', tdtErro );
              DMI.IBTRImport.Rollback;
              close;
              Exit;

           end;
        try
        dmi.ItensNota.Open;
        dmi.ItensNota.Insert;
        dmi.ItensNotaCOD_ENT.AsInteger := COD_ENT;
        dmi.ItensNotaCOD_PRO.AsInteger := ImportXML.ItemsCOD_LOCAL.AsInteger;


        dmi.ItensNotaQTDUND_ENT.AsCurrency := ImportXML.ItemsQUANT.AsCurrency;
        dmi.ItensNotaPERC_DESC.AsCurrency :=
          (100 * ImportXML.ItemsDESC.AsCurrency)
          / ImportXML.ItemsVALOR_TOTAL.AsCurrency;
        dmi.ItensNotaCOD_EMP.AsInteger := iEmp;
        dmi.ItensNotaVALOR_UNIT_PRO.AsCurrency :=
          ImportXML.ItemsVALOR_UNID.AsCurrency;
        dmi.ItensNotaCUSTO.AsCurrency := ImportXML.ItemsVALOR_UNID.AsCurrency;
        dmi.ItensNotaQTD_PRO.AsCurrency := ImportXML.ItemsQUANT.AsCurrency *
          ImportXML.ItemsQUANT_ENT.AsCurrency;


        dmi.ItensNotaVALOR_DESCONTO.AsCurrency :=
          ImportXML.ItemsDESC.AsCurrency;
        dmi.ItensNotaVALOR_ACRESCIMO.AsCurrency := 0;
        dmi.ItensNotaPERC_ACRES.AsCurrency := 0;
        dmi.ItensNotaVALOR_TOTAL.AsCurrency :=
          ImportXML.ItemsVALOR_TOTAL.AsCurrency;
        dmi.ItensNotaORDEM.AsInteger := ImportXML.ItemsSEQ.AsInteger;
        dmi.ItensNotaCODIGO_LOCAL_ESTOQUE.AsInteger := 1;



        //ICMS
        if MesmoEstado then
           begin
              dmi.ItensNotaCOD_CFOP.AsInteger := DMI.PRODUTO_T_ECOD_CFOP_DENTRO.AsInteger;

              if DMI.PRODUTO_T_ED_ICMS_DENTRO.AsString = 'S' then
                 begin
                    dmi.ItensNotaPERC_ICMS.AsCurrency := DMI.PRODUTO_T_EALIQ_ICMS_DENTRO.AsCurrency;
                    dmi.ItensNotaCOD_GRP.AsInteger := DMI.PRODUTO_T_EICMS_DENTRO.AsInteger;
                    dmi.ItensNotaCST.AsString := DMI.PRODUTO_T_EORIGEM.AsString +
                        dmi.PRODUTO_T_ECST_DENTRO.AsString;
                    dmi.ItensNotaBASE_CALCULO.AsCurrency := 0;
                    dmi.ItensNotaVALOR_ICMS.AsCurrency := 0;
                    dmi.ItensNotaPERC_BCR.AsCurrency := DMI.PRODUTO_T_EREDU_ICMS_DENTRO.AsCurrency;

                    if DMI.PRODUTO_T_ETEM_SUBSTITUICAO.AsString = 'S' then
                       dmi.ItensNotaPERC_ST.AsCurrency := DMI.PRODUTO_T_EAGREG_DENTRO.AsCurrency
                    else
                       dmi.ItensNotaPERC_ST.AsCurrency := 0;
                    dmi.ItensNotaVALOR_SUB_TRIBUTARIA.AsCurrency :=0;
                    dmi.ItensNotaBC_ST.AsCurrency := 0;
                 end
              else
                 begin
                    dmi.ItensNotaPERC_ICMS.AsCurrency := 0;
                    dmi.ItensNotaCOD_GRP.AsInteger := DMI.PRODUTO_T_EICMS_DENTRO.AsInteger;
                    dmi.ItensNotaCST.AsString := '040';
                    dmi.ItensNotaBASE_CALCULO.AsCurrency := 0;
                    dmi.ItensNotaVALOR_ICMS.AsCurrency := 0;
                    dmi.ItensNotaPERC_BCR.AsCurrency := 0;
                    dmi.ItensNotaPERC_ST.AsCurrency := 0;
                    dmi.ItensNotaVALOR_SUB_TRIBUTARIA.AsCurrency :=0;
                    dmi.ItensNotaBC_ST.AsCurrency := 0;
                 end;


           end
        else
           begin
              if DMI.PRODUTO_T_ED_ICMS_FORA.AsString = 'S' then
                 begin
                    dmi.ItensNotaCOD_CFOP.AsInteger := DMI.PRODUTO_T_ECOD_CFOP_FORA.AsInteger;
                    dmi.ItensNotaPERC_ICMS.AsCurrency := DMI.PRODUTO_T_EALIQ_ICMS_FORA.AsCurrency;
                    dmi.ItensNotaCOD_GRP.AsInteger := DMI.PRODUTO_T_EICMS_FORA.AsInteger;
                    dmi.ItensNotaCST.AsString := DMI.PRODUTO_T_EORIGEM.AsString +
                        dmi.PRODUTO_T_ECST_FORA.AsString;
                    dmi.ItensNotaBASE_CALCULO.AsCurrency := 0;
                    dmi.ItensNotaVALOR_ICMS.AsCurrency := 0;
                    dmi.ItensNotaPERC_BCR.AsCurrency := DMI.PRODUTO_T_EREDU_ICMS_FORA.AsCurrency;
                    dmi.ItensNotaPERC_ST.AsCurrency := 0;
                    dmi.ItensNotaVALOR_SUB_TRIBUTARIA.AsCurrency :=0;
                    dmi.ItensNotaBC_ST.AsCurrency := 0;
                 end
              else
                 begin
                    dmi.ItensNotaPERC_ICMS.AsCurrency := 0;
                    dmi.ItensNotaCOD_GRP.AsInteger := DMI.PRODUTO_T_EICMS_DENTRO.AsInteger;
                    dmi.ItensNotaCST.AsString := '040';
                    dmi.ItensNotaBASE_CALCULO.AsCurrency := 0;
                    dmi.ItensNotaVALOR_ICMS.AsCurrency := 0;
                    dmi.ItensNotaPERC_BCR.AsCurrency := 0;
                    dmi.ItensNotaPERC_ST.AsCurrency := 0;
                    dmi.ItensNotaVALOR_SUB_TRIBUTARIA.AsCurrency :=0;
                    dmi.ItensNotaBC_ST.AsCurrency := 0;
                 end;
           end;


        // IPI
        dmi.ItensNotaCST_IPI.AsString := dmi.PRODUTO_T_ECST_IPI.AsString;
        if MesmoEstado then
           dmi.ItensNotaPERC_IPI.AsCurrency := DMI.PRODUTO_T_EIPI_DENTRO.AsCurrency
        else
           dmi.ItensNotaPERC_IPI.AsCurrency := DMI.PRODUTO_T_EIPI_FORA.AsCurrency;
        dmi.ItensNotaVALOR_IPI.AsCurrency := 0;

        // PIS COFINS
        DMI.ItensNotaCST_COFINS.AsString := DMI.PRODUTO_T_ECST_COFINS.AsString;
        dmi.ItensNotaCST_PIS.AsString := dmi.PRODUTO_T_ECST_PIS.AsString;
        if DMI.PRODUTO_T_EISENTO_PIS_COFINS.AsString <> 'S' then
           begin
              if MesmoEstado then
                 begin
                    if DMI.PRODUTO_T_ED_PIS_DENTRO.AsString = 'S' then
                       begin
                          dmi.ItensNotaALIQ_PIS.AsCurrency := dmi.PRODUTO_T_EPIS.AsCurrency;
                          dmi.ItensNotaVALOR_PIS.AsCurrency := 0;
                          dmi.ItensNotaALIQ_COFINS.AsCurrency := DMI.PRODUTO_T_ECOFINS.AsCurrency;
                          dmi.ItensNotaVALOR_COFINS.AsCurrency := 0;

                       end
                    else
                       begin
                          dmi.ItensNotaALIQ_PIS.AsCurrency := 0;
                          dmi.ItensNotaVALOR_PIS.AsCurrency := 0;
                          dmi.ItensNotaALIQ_COFINS.AsCurrency := 0;
                          dmi.ItensNotaVALOR_COFINS.AsCurrency := 0;
                       end;
                 end
              else
                 begin
                    if DMI.PRODUTO_T_ED_PIS_FORA.AsString = 'S' then
                       begin
                          dmi.ItensNotaALIQ_PIS.AsCurrency := dmi.PRODUTO_T_EPIS.AsCurrency;
                          dmi.ItensNotaVALOR_PIS.AsCurrency := 0;
                          dmi.ItensNotaALIQ_COFINS.AsCurrency := DMI.PRODUTO_T_ECOFINS.AsCurrency;
                          dmi.ItensNotaVALOR_COFINS.AsCurrency := 0;

                       end
                    else
                       begin
                          dmi.ItensNotaALIQ_PIS.AsCurrency := 0;
                          dmi.ItensNotaVALOR_PIS.AsCurrency := 0;
                          dmi.ItensNotaALIQ_COFINS.AsCurrency := 0;
                          dmi.ItensNotaVALOR_COFINS.AsCurrency := 0;
                       end;
                 end;
           end
        else
           begin
              dmi.ItensNotaALIQ_PIS.AsCurrency := 0;
              dmi.ItensNotaVALOR_PIS.AsCurrency := 0;
              dmi.ItensNotaALIQ_COFINS.AsCurrency := 0;
              dmi.ItensNotaVALOR_COFINS.AsCurrency := 0;
           end;
{        dmi.ItensNotaBC_ST.AsCurrency := ImportXML.ItemsBCST.AsCurrency;
        dmi.ItensNotaCST_IPI.AsString := ItemsCST_IPI.AsString;
        dmi.ItensNotaCST_PIS.AsString := ItemsPIS_CST.AsString;
        dmi.ItensNotaALIQ_PIS.AsCurrency := ItemsPIS_ALIQ.AsCurrency;
        dmi.ItensNotaVALOR_PIS.AsCurrency := ItemsPIS_VALOR.AsCurrency;
        DMI.ItensNotaCST_COFINS.AsString := ItemsCOFINS_CST.AsString;
        dmi.ItensNotaALIQ_COFINS.AsCurrency := ItemsCOFINS_ALIQ.AsCurrency;
        dmi.ItensNotaVALOR_COFINS.AsCurrency := ItemsCOFINS_VALOR.AsCurrency;}

        dmi.ItensNota.Post;
        dmi.ItensNota.close;
        except
            on E: Exception do
               begin
                  KDialog( 'Erro no Item ' + ItemsSEQ.AsString + #13 + E.Message, 'Erro ao importar Nota', tdtErro );
                        dm.IBTransaction.Rollback;
                  dmi.IBTRImport.Rollback;
                  result := false;
               end;
        end;
      end;
      Items.Next;
    end;
    result := true;
  except
    on E: Exception do
    begin
      Application.MessageBox
        (PWideChar('Erro ao Cadastrar Nota!' + #13 + E.Message), 'Erro',
        mb_applmodal + mb_iconerror + mb_ok);
      dm.IBTransaction.Rollback;
      dmi.IBTRImport.Rollback;
      result := false;
    end;
  end;
end;

procedure TImportXML.ImportarTudo;
var
  COD_ENT: Integer;
  procedure FechaConec;
  begin
    AlertaCad('Nota fiscal não foi salva ouve problemas na sequencia!');
    if dm.IBTransaction.Active then
      dm.IBTransaction.Rollback;
    if dmi.IBTRImport.Active then
      dmi.IBTRImport.Rollback;
  end;

begin
  COD_ENT := 0;
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  if dmi.IBTRImport.Active then
    dmi.IBTRImport.Commit;
  dmi.IBTRImport.StartTransaction;
  COD_ENT := ImportaCabecalho;
  if COD_ENT > 0 then
  begin
    if ImportaItens(COD_ENT) then
    begin
      if contas(COD_ENT) then
      begin
        CalculaNota( COD_ENT );
        AlertaCad('Nota importada com sucesso!', alertok);
        if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
        if dmi.IBTRImport.Active then
           dmi.IBTRImport.Commit;
        close;
      end
      else
        FechaConec;
    end
    else
      FechaConec;
  end
  else
    FechaConec;
end;

function TImportXML.contas(COD_ENT: Integer): Boolean;
var
  SEQ: Integer;
  COD_CPT: Integer;
begin
  SEQ := 1;
  try
    dm.QConsulta.close;
    dm.QConsulta.sql.Clear;
    dm.QConsulta.sql.Text :=
      'select max( COD_CPT ) from CONTAS_PAGAR';
    dm.QConsulta.Open;
    if dm.QConsulta.IsEmpty then
      COD_CPT := 1
    else
      COD_CPT := dm.QConsulta.FieldByName('MAX').AsInteger + 1;
    dm.QConsulta.close;
    ImportXML.Dup.First;
    while not ImportXML.Dup.Eof do
    begin
      dmi.contas.Open;
      dmi.contas.Insert;
      dmi.ContasCOD_EMP.AsInteger := iEmp;
      dmi.ContasDATA_CTP.AsDateTime := NotaDATAENT_ENT.AsDateTime;
      dmi.ContasCOD_FOR.AsInteger := COD_FOR;
      dmi.ContasTIPO_DOC_CTP.AsString := 'NOTA DE ENTRADA';
      dmi.ContasNUM_DOC_CTP.AsString := ImportXML.NotaNUMNF_ENT.AsString;
      dmi.ContasVALOR_CTP.AsCurrency := ImportXML.DupValor.AsCurrency;
      dmi.ContasDTVENCTO_CTP.AsDateTime := ImportXML.DupVenc.AsDateTime;
      dmi.ContasCOD_ENTRADA.AsInteger := COD_ENT;
      dmi.ContasCOD_CPT.AsInteger := COD_CPT;
      dmi.ContasSEQUENCIA_CTP.AsInteger := SEQ;
      dmi.ContasCOD_CLASSIFICACAO.AsInteger := 1;
      dmi.ContasDUPLICATA_PENDENTE.AsString := 'S';
      dmi.contas.Post;
      dmi.contas.close;
      COD_CPT := COD_CPT + 1;
      SEQ := SEQ + 1;
      ImportXML.Dup.Next;
    end;
    result := true;
  except
    on E: Exception do
    begin
      Application.MessageBox
        (PWideChar('Erro ao Cadastrar Contas!' + #13 + E.Message), 'Erro',
        mb_applmodal + mb_iconerror + mb_ok);
      dm.IBTransaction.Rollback;
      dmi.IBTRImport.Rollback;
      result := false;
    end;
  end;
end;

end.


