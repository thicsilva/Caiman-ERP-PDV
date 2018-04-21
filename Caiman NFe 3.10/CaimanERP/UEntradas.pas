unit UEntradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, Buttons, ExtCtrls, ComCtrls, Mask, StdCtrls, DB, Grids, 
  DBGrids, ImgList, ToolWin, NxCollection, ShellApi, rxToolEdit, rxCurrEdit, 
  acAlphaImageList, UNovosComponentes, UNovoFormulario, cxGraphics, cxControls, 
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, 
  dxSkinMetropolisDark, dxSkinOffice2013White, dxSkinsdxStatusBarPainter, 
  dxStatusBar, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton,
  System.ImageList;

type
  TFrmEntradas = class(TFrmCadastroNovo)
    Panel5: TPanel;
    Label1: TLabel;
    EdtCod: UNovosComponentes.TEdit;
    Label2: TLabel;
    Label3: TLabel;
    EdtCodFor: UNovosComponentes.TEdit;
    Label21: TLabel;
    BtnConsFor: TsSpeedButton;
    BtnAddFor: TsSpeedButton;
    EdtNomeFor: TEdit;
    Label22: TLabel;
    Label4: TLabel;
    EdtAcres: TCurrencyEdit;
    Label5: TLabel;
    EdtDesc: TCurrencyEdit;
    Label6: TLabel;
    EdtFrete: TCurrencyEdit;
    Label7: TLabel;
    EdtICMSFrete: TCurrencyEdit;
    Label8: TLabel;
    EdtTotalNF: TCurrencyEdit;
    IBTREnt: TFDTransaction;
    DBGrid1: TDBGrid;
    Panel6: TPanel;
    Label10: TLabel;
    EdtCodPro: UNovosComponentes.TEdit;
    BtnConsPro: TsSpeedButton;
    BtnAddPro: TsSpeedButton;
    EdtNomePro: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    EdtUnid: TCurrencyEdit;
    Label13: TLabel;
    Label14: TLabel;
    EdtQuantUnid: TCurrencyEdit;
    Label15: TLabel;
    Label16: TLabel;
    EdtQuant: TCurrencyEdit;
    Label17: TLabel;
    EdtValorUnid: TCurrencyEdit;
    Label18: TLabel;
    EdtQuantUnid2: TCurrencyEdit;
    Label20: TLabel;
    EdtValorUnit: TCurrencyEdit;
    Label23: TLabel;
    Label26: TLabel;
    EdtPerIPI: TCurrencyEdit;
    Label27: TLabel;
    Label28: TLabel;
    EdtCusto: TCurrencyEdit;
    QInsEntrada: TFDQuery;
    QInsEntradaCODENT: TIntegerField;
    QBuscaItens: TFDQuery;
    DSQBuscaItens: TDataSource;
    QBuscaItensCOD_ENT: TIntegerField;
    QBuscaItensCOD_PRO: TIntegerField;
    QBuscaItensQTD_PRO: TBCDField;
    QBuscaItensPERC_ICMS: TBCDField;
    QBuscaItensPERC_IPI: TBCDField;
    QBuscaItensQTDUND_ENT: TBCDField;
    QBuscaItensPERC_DESC: TBCDField;
    QBuscaItensPERC_ACRES: TBCDField;
    QBuscaItensNOME_PRO: TStringField;
    QDelEntrada: TFDQuery;
    Panel7: TPanel;
    BtnGrava: TBitBtn;
    BtnNew: TBitBtn;
    BtnExclui: TBitBtn;
    BtnItens: TBitBtn;
    Label30: TLabel;
    QUpdEnt: TFDQuery;
    QBuscaItensCOD_EMP: TIntegerField;
    QBuscaItensVALOR_UNIT_PRO: TBCDField;
    ComboTipo: TComboBox;
    Label33: TLabel;
    QBuscaItensCUSTO: TBCDField;
    QBuscaItensVALOR_PRO: TBCDField;
    IBTRItem: TFDTransaction;
    EdtEmissao: TMaskEdit;
    EdtEnt: TMaskEdit;
    EdtTotal: TCurrencyEdit;
    Label29: TLabel;
    EdtNumNF: TEdit;
    Label35: TLabel;
    Label34: TLabel;
    EdtSerie: TEdit;
    Label40: TLabel;
    EdtCodGRP: UNovosComponentes.TEdit;
    BtnConsGRP: TsSpeedButton;
    EdtNomeGRP: TEdit;
    Label41: TLabel;
    BtnAddGRP: TsSpeedButton;
    QBuscaItensCOD_GRP: TIntegerField;
    Label42: TLabel;
    EdtBaseSub: TCurrencyEdit;
    EdtICMSSub: TCurrencyEdit;
    Label43: TLabel;
    Label38: TLabel;
    EdtCFOP: UNovosComponentes.TEdit;
    BtnConsCFOP: TsSpeedButton;
    BtnAddCFOP: TsSpeedButton;
    EdtNomeCFOP: TEdit;
    Label39: TLabel;
    QBuscaItensCOD_CFOP: TIntegerField;
    IBSQLItem: TFDQuery;
    ToolButton1: TToolButton;
    BtnFinalizar: TToolButton;
    QBuscaItensMARGEM_LUCRO_PRO: TBCDField;
    GroupBox2: TGroupBox;
    CheckFrete: TCheckBox;
    CheckSub: TCheckBox;
    Label24: TLabel;
    EdtPerAcrescimoItem: TCurrencyEdit;
    Label46: TLabel;
    EdtVlAcrescimoItem: TCurrencyEdit;
    Label19: TLabel;
    EdtPerDescontoItem: TCurrencyEdit;
    Label47: TLabel;
    EdtVlDescontoItem: TCurrencyEdit;
    Label25: TLabel;
    EdtPerICMS: TCurrencyEdit;
    Panel3: TPanel;
    Label31: TLabel;
    Label37: TLabel;
    Label44: TLabel;
    Label32: TLabel;
    EdtTotalCalc: TCurrencyEdit;
    EdtTotalICMS: TCurrencyEdit;
    EdtTotalIPI: TCurrencyEdit;
    EdtDiferenca: TCurrencyEdit;
    QBuscaItensVALOR_DESCONTO: TBCDField;
    QBuscaItensVALOR_ACRESCIMO: TBCDField;
    QBuscaItensNOME_GRP: TStringField;
    Label54: TLabel;
    EdtCodModelo: UNovosComponentes.TEdit;
    BtnConsModelo: TsSpeedButton;
    EdtNomeModelo: TEdit;
    QInsRegistro: TFDQuery;
    QInsRegistroCODREG: TIntegerField;
    Label45: TLabel;
    EdtPercBCR: TCurrencyEdit;
    QBuscaItensPERC_BCR: TBCDField;
    Label49: TLabel;
    EdtTotalBase: TCurrencyEdit;
    QBuscaItensTIPO_GRP: TStringField;
    Label50: TLabel;
    EdtTotalST: TCurrencyEdit;
    EdtPercST: TCurrencyEdit;
    Label51: TLabel;
    QBuscaItensPERC_ST: TBCDField;
    Label52: TLabel;
    EdtCST: UNovosComponentes.TEdit;
    QBuscaItensCST: TStringField;
    QBuscaItensVALOR_TOTAL: TBCDField;
    QBuscaItensBASE_CALCULO: TBCDField;
    QBuscaItensVALOR_ICMS: TBCDField;
    Label53: TLabel;
    EdtTotalProdutos: TCurrencyEdit;
    QItensRegistro: TFDQuery;
    QInsItensRegistro: TFDQuery;
    QBuscaRegistro: TFDQuery;
    QBuscaRegistroCODIGO: TIntegerField;
    QBuscaRegistroDATA: TDateField;
    QBuscaRegistroCNPJ: TStringField;
    QBuscaRegistroSERIE_NOTA: TStringField;
    QBuscaRegistroNUMERO_NOTA: TIntegerField;
    QBuscaRegistroEMITENTE: TStringField;
    QBuscaRegistroVALOR_TOTAL: TBCDField;
    QBuscaRegistroSITUACAO: TStringField;
    QBuscaRegistroCODIGO_EMPRESA: TIntegerField;
    QBuscaRegistroCODIGO_ENTRADA: TIntegerField;
    QBuscaRegistroINSCRICAO: TStringField;
    QBuscaRegistroUF: TStringField;
    QBuscaRegistroCOD_FOR: TIntegerField;
    QBuscaRegistroRAZAO_FOR: TStringField;
    QBuscaRegistroDESCRICAO: TStringField;
    Label55: TLabel;
    EdtItem: UNovosComponentes.TEdit;
    QBuscaItensORDEM: TIntegerField;
    BtnRecalcular: TButton;
    Label56: TLabel;
    EdtSubValor: TCurrencyEdit;
    Label57: TLabel;
    EdtIPIValor: TCurrencyEdit;
    GroupBox1: TGroupBox;
    LTribSaida: TLabel;
    Label9: TLabel;
    Label48: TLabel;
    EdtPrecoVenda: TCurrencyEdit;
    EdtMargem: TCurrencyEdit;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    QBuscaItensVALOR_SUB_TRIBUTARIA: TBCDField;
    QBuscaItensVALOR_IPI: TBCDField;
    CheckCustoSemDesconto: TCheckBox;
    QBuscaRegistroSUB_SERIE: TStringField;
    QBuscaRegistroCIF_FOB: TIntegerField;
    QBuscaRegistroCODIFICACAO_FISCAL: TStringField;
    Label36: TLabel;
    EdtCodTipo: UNovosComponentes.TEdit;
    BtnConsTipo: TsSpeedButton;
    BtnAddTipo: TsSpeedButton;
    EdtNomeTipo: TEdit;
    Label58: TLabel;
    QItensRegistroVALORTOTAL: TBCDField;
    QItensRegistroBASECALCULO: TBCDField;
    QItensRegistroVALORICMS: TBCDField;
    QItensRegistroTOTAL_PRODUTO: TFMTBCDField;
    QItensRegistroCOD_GRP: TIntegerField;
    QItensRegistroCOD_CFOP: TIntegerField;
    QItensRegistroALIQUOTA_GRP: TBCDField;
    QItensRegistroVALOR_PERC_IPI: TFloatField;
    QItensRegistroVALOR_IPI: TBCDField;
    QItensRegistroTIPO_GRP: TStringField;
    QItensRegistroCALC_VALOR_IPI: TCurrencyField;
    Importar: TToolButton;
    procedure LimpaItens;
    procedure EdtCodForKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsForClick(Sender: TObject);
    procedure BtnAddForClick(Sender: TObject);
    procedure EdtCodForKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodForExit(Sender: TObject);
    procedure BtnConsProClick(Sender: TObject);
    procedure BtnAddProClick(Sender: TObject);
    procedure EdtCodProKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodProExit(Sender: TObject);
    procedure EdtUnidExit(Sender: TObject);
    procedure EdtValorUnidExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure BuscaItens;
    procedure BtnItensClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BtnNewClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure EdtCodProEnter(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAlterarClick(Sender: TObject);
    procedure EdtEmissaoExit(Sender: TObject);
    procedure Botoes(acao : string);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnFinalizarClick(Sender: TObject);
    procedure EdtQuantUnidExit(Sender: TObject);
    procedure EdtPerIPIExit(Sender: TObject);
    procedure EdtCodForEnter(Sender: TObject);
    procedure BtnConsCFOPClick(Sender: TObject);
    procedure BtnAddCFOPClick(Sender: TObject);
    procedure EdtCFOPEnter(Sender: TObject);
    procedure EdtCFOPExit(Sender: TObject);
    procedure EdtCFOPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnAddGRPClick(Sender: TObject);
    procedure BtnConsGRPClick(Sender: TObject);
    procedure EdtCodGRPEnter(Sender: TObject);
    procedure EdtCodGRPExit(Sender: TObject);
    procedure EdtCodGRPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    function  CalculaCusto(const cValorUnit, cQuant, cValorDesconto, cValorAcrescimo,
              cPercIPI, cPercST, cValorST, cValorIPI : currency) : currency;
    procedure BuscaTaxas;
    procedure EdtPerAcrescimoItemExit(Sender: TObject);
    procedure EdtPerDescontoItemExit(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtNumNFExit(Sender: TObject);
    procedure EdtCodModeloEnter(Sender: TObject);
    procedure EdtCodModeloExit(Sender: TObject);
    procedure EdtCodModeloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsModeloClick(Sender: TObject);
    procedure GerarSintegra;
    procedure BuscaSintegra(const codigo : integer);
    procedure EdtCSTExit(Sender: TObject);
    procedure EdtCSTEnter(Sender: TObject);
    function  Ordem : integer;
    procedure BtnRecalcularClick(Sender: TObject);
    procedure NxLinkLabel1Click(Sender: TObject);
    procedure QItensRegistroCalcFields(DataSet: TDataSet);
    procedure EdtCodTipoEnter(Sender: TObject);
    procedure EdtCodTipoExit(Sender: TObject);
    procedure EdtCodTipoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsTipoClick(Sender: TObject);
    procedure BtnAddTipoClick(Sender: TObject);
    procedure VerificaNoEstado;
    function  BuscaCFOP(const iCodProduto : integer; const sTipo : string) : integer;
    function  BuscaLocalEstoque : integer;
    procedure ImportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmEntradas: TFrmEntradas;

implementation
uses
  Udm, Ubibli1, UConsProd, UCadProduto, UConsFor, UCadFor, UConsEntrada, 
  ULancContasPagar, UConsCFOP, UCadCFOP, UCadGICMS, UConsGRP, ULancContabil, 
  UConsModelo, URegEntradas, UFormacaoPreco, UConsTipoES, UCadTipoES, 
  UPrincipal, UNovoPrincipal;

var bGrava, bGravaItem : boolean;
    cTaxaAcres, cTaxaDesc, cTaxaFrete, cTaxaSubTrib : currency;
    bEntradaAberta  : boolean;
    iLocalEstoque   : integer;

{$R *.dfm}

function FrmEntradas: TFrmEntradas;
begin
   Result := TFrmEntradas( BuscaFormulario( TFrmEntradas, False  ) );
end;

procedure TFrmEntradas.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          Importar.Enabled := False;
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmEntradas);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmEntradas);
          Importar.Enabled := True;
         btnNovo.Enabled      := true;
         BtnGravar.Enabled    := false;
         btnCancelar.Enabled  := false;
         if (acao = 'C') or (acao = 'E') then
            begin 
               btnalterar.Enabled:= false;
               BtnConsultar.Enabled := true;
            end
         else
            btnalterar.Enabled:= true;
         if acao = 'G' then
            btnExcluir.Enabled:= true
         else
            BtnExcluir.Enabled:= false;
      end;
end;

function TFrmEntradas.BuscaLocalEstoque : integer;
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QConsulta do
      begin 
         close;
         sql.Clear;
         sql.Text:= 'SELECT CODIGO_LOCAL_ESTOQUE ' +
                    'FROM TIPO_ES ' +
                    'WHERE COD_ES = :CODES';
         Parambyname('codes').AsInteger:= strtoint(edtcodtipo.Text);
         open;
         Result:= fieldbyname('codigo_local_estoque').AsInteger;
      end;
   dm.IBTransaction.Commit;
   dm.QConsulta.Close;
end;

procedure TFrmEntradas.VerificaNoEstado;
var sUFFor, sUFEmp : string;
begin 
   sUFFor:= dm.RetornaStringTabela('EST_FOR', 'FORNECEDOR', 'COD_FOR', strtoint(EdtCodFor.Text));
   sUFEmp:= dm.RetornaStringTabela('EST_EMP', 'EMPRESA', 'COD_EMP', iEmp);

   if trim(sUFEmp) = trim(sUFFor) then
      bNoEstado:= true
   else
      bNoEstado:= false;
end;

function TFrmEntradas.BuscaCFOP(const iCodProduto : integer; const sTipo : string) : integer;
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QConsulta do
      begin 
         close;
         sql.clear;
         sql.Text:= 'SELECT CFOP_ESTADO_TRIBUTADO,    ' +
                           'CFOP_ESTADO_SUBSTITUICAO, ' +
                           'CFOP_FORA_TRIBUTADO,      ' +
                           'CFOP_FORA_SUBSTITUICAO    ' +
                    'FROM TIPO_ES                     ' +
                    'WHERE COD_ES = :CODES';
         Parambyname('codes').AsInteger:= strtoint(EdtCodTipo.Text);
         open;

         if bNoEstado then
            begin 
               if trim(sTipo) = 'ST' then
                  result:= fieldbyname('CFOP_ESTADO_SUBSTITUICAO').AsInteger
               else
                  result:= fieldbyname('CFOP_ESTADO_TRIBUTADO').AsInteger;
            end
         else
            begin 
               if trim(sTipo) = 'ST' then
                  result:= fieldbyname('CFOP_FORA_SUBSTITUICAO').AsInteger
               else
                  result:= fieldbyname('CFOP_FORA_TRIBUTADO').AsInteger;
            end;
      end;
   dm.IBTransaction.Commit;
   dm.QConsulta.Close;
end;

function TFrmEntradas.Ordem : integer;
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QConsulta do
      begin 
         close;
         sql.Clear;
         sql.Add('SELECT MAX(ORDEM) MAX_ORDEM FROM ITENS_ENTRADA WHERE COD_ENT = :CODENT');
         Parambyname('codent').AsInteger:= strtoint(EdtCod.Text);
         open;
         result:= fieldbyname('max_ordem').AsInteger + 1;
      end;
   dm.IBTransaction.Commit;
   dm.QConsulta.Close;
end;

procedure TFrmEntradas.BuscaSintegra(const codigo : integer);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QBuscaRegistro do
      begin 
         close;
         Parambyname('cod').AsInteger:= codigo;
         open;
         Application.CreateForm(TFrmRegEntradas, FrmRegEntradas);
         FrmRegEntradas.tag                := 1;
         FrmRegEntradas.EdtCod.Text        := QBuscaRegistroCODIGO.AsString;
         FrmRegEntradas.EdtData.Text       := QBuscaRegistroDATA.AsString;
         FrmRegEntradas.EdtNumNF.Text      := QBuscaRegistroNUMERO_NOTA.AsString;
         FrmRegEntradas.EdtCodModelo.Text  := QBuscaRegistroCODIFICACAO_FISCAL.AsString;
         FrmRegEntradas.EdtNomeModelo.Text := QBuscaRegistroDESCRICAO.AsString;
         FrmRegEntradas.EdtSerie.Text      := QBuscaRegistroSERIE_NOTA.AsString;
         FrmRegEntradas.EdtCodFor.Text     := QBuscaRegistroCOD_FOR.AsString;
         FrmRegEntradas.EdtNomeFor.Text    := QBuscaRegistroRAZAO_FOR.AsString;
         FrmRegEntradas.EdtCNPJ.Text       := QBuscaRegistroCNPJ.AsString;
         FrmRegEntradas.EdtInscricao.Text  := QBuscaRegistroINSCRICAO.AsString;
         FrmRegEntradas.EdtUF.Text         := QBuscaRegistroUF.AsString;
         FrmRegEntradas.EdtTotalNF.Text    := QBuscaRegistroVALOR_TOTAL.AsString;
         if QBuscaRegistroEMITENTE.AsString = 'P' then
            FrmRegEntradas.ComboEmitente.ItemIndex:= 0
         else
            FrmRegEntradas.ComboEmitente.ItemIndex:= 1;
         if QBuscaRegistroSITUACAO.AsString = 'N' then
            FrmRegEntradas.ComboSituacao.ItemIndex:= 0
         else
            FrmRegEntradas.ComboSituacao.ItemIndex:= 1;
      end;
   dm.IBTransaction.Commit;
   QBuscaRegistro.Close;

   FrmRegEntradas.BuscaItens;
   FrmRegEntradas.ShowModal;
end;

procedure TFrmEntradas.GerarSintegra;
var sAuxCNPJ, sAuxInsc, sAuxUF : string;
    cAuxValorTotal, cAuxBaseICMS, cAuxValorICMS, cAuxIsentas, cAuxOutras, cAuxAliquota : currency;
    iAuxCodGRP, iAuxCFOP : integer;
    cCalcBaseICMS : currency;
    iAux     : integer;
    iCodReg  : integer;
    sIsentasOutras : string;
begin 
   iCodReg  := 0;
   sAuxCNPJ := '';
   sAuxInsc := '';
   sAuxUF   := '';
   sIsentasOutras:= trim(dm.RetornaStringTabela('ISENTAS_OUTRAS_LIVROS_FISCAIS', 'PARAMETROS', 'COD_EMP', iEmp));

   cAuxValorTotal := 0;
   cAuxBaseICMS   := 0;
   cAuxValorICMS  := 0;
   cAuxIsentas    := 0;
   cAuxOutras     := 0;
   cAuxAliquota   := 0;
   cCalcBaseICMS  := 0;

   iAuxCodGRP:= 0;
   iAuxCFOP  := 0;

   {busca os dados do fornecedor}
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.Add('SELECT CNPJ_FOR, INSC_FOR, EST_FOR ' +
                     'FROM FORNECEDOR F ' +
                     'WHERE COD_FOR = :CODFOR');
             Parambyname('codfor').AsInteger:= strtoint(EdtCodFor.Text);
             open;
             sAuxCNPJ:= RetiraCaracter(fieldbyname('cnpj_for').AsString);
             sAuxInsc:= RetiraCaracter(fieldbyname('insc_for').AsString);
             sAuxUF  := fieldbyname('est_for').AsString;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar os dados do fornecedor para gerar o sintegra');
     end;
   finally
     dm.QConsulta.Close;
   end;

   {gravando na tabela registro_livro_entradas}
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QInsRegistro do
          begin 
             close;
             Params[0].AsDate       := strtodate(EdtEnt.Text);
             Params[1].AsInteger    := strtoint(EdtCodFor.Text);
             Params[2].AsString     := trim(sAuxCNPJ);
             Params[3].AsString     := trim(EdtCodModelo.Text);
             if EdtSerie.Text = '' then
                Params[4].Value     := null
             else
                Params[4].AsString  := trim(EdtSerie.Text);
             Params[5].AsInteger    := strtoint(EdtNumNF.Text);
             Params[6].AsString     := 'T';
             Params[7].AsCurrency   := strtocurr(EdtTotalNF.Text);
             Params[8].AsString     := 'N';
             Params[9].AsInteger    := iEmp;
             Params[10].AsInteger   := strtoint(EdtCod.Text);
             Params[11].AsString    := trim(sAuxUF);
             Params[12].AsString    := trim(sAuxInsc);
             Params[13].value       := null;
             Params[14].AsInteger   := 0;
             Params[15].Value       := null;
             Open;
             iCodReg:= QInsRegistroCODREG.AsInteger;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao gravar na tabela registro_livro_entradas');
     end;
   finally
     QInsRegistro.Close;
   end;

   {gravando na tabela itens_registro_livro_entradas}
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QItensRegistro do
      begin 
         iAux:= 0;
         close;
         Parambyname('codent').AsInteger:= StrToInt(EdtCod.text);
         open;
         First;
         while not eof do
            begin 
               inc(iAux);
               if dm.IBTRAux.Active then
                  dm.IBTRAux.Commit;
               DM.IBTRAux.StartTransaction;
               QInsItensRegistro.Close;
               QInsItensRegistro.ParamByName('1').AsInteger  := iCodReg;
               QInsItensRegistro.ParamByName('2').AsInteger  := iAux;
               QInsItensRegistro.ParamByName('3').AsInteger  := QItensRegistroCOD_CFOP.AsInteger;
               QInsItensRegistro.ParamByName('4').AsCurrency := QItensRegistroBASECALCULO.AsCurrency;
               QInsItensRegistro.ParamByName('5').AsCurrency := QItensRegistroVALORICMS.AsCurrency;

               if (trim(QItensRegistroTIPO_GRP.AsString) = 'ISE') or (trim(QItensRegistroTIPO_GRP.AsString) = 'NT') then
                  begin 
                     QInsItensRegistro.ParamByName('6').AsCurrency:= QItensRegistroVALORTOTAL.AsCurrency;
                     QInsItensRegistro.ParamByName('7').AsCurrency:= 0;
                  end
               else

               if (trim(QItensRegistroTIPO_GRP.AsString) = 'OUT') or (trim(QItensRegistroTIPO_GRP.AsString) = 'ST') then
                  begin 
                     QInsItensRegistro.ParamByName('7').AsCurrency:= QItensRegistroVALORTOTAL.AsCurrency + QItensRegistroCALC_VALOR_IPI.AsCurrency;
                     QInsItensRegistro.ParamByName('6').AsCurrency:= 0;
                  end
               else

               if trim(QItensRegistroTIPO_GRP.AsString) = 'TRI' then
                  begin 
                     if trim(sIsentasOutras) = 'O' then
                        begin 
                           QInsItensRegistro.Parambyname('6').AsCurrency:= 0;
                           QInsItensRegistro.ParamByName('7').AsCurrency:= QItensRegistroVALORTOTAL.AsCurrency - QItensRegistroBASECALCULO.AsCurrency + QItensRegistroCALC_VALOR_IPI.AsCurrency;
                        end
                     else
                        begin 
                           QInsItensRegistro.ParamByName('6').AsCurrency:= QItensRegistroVALORTOTAL.AsCurrency - QItensRegistroBASECALCULO.AsCurrency;
                           QInsItensRegistro.ParamByName('7').AsCurrency:= QItensRegistroCALC_VALOR_IPI.AsCurrency;
                        end;
                  end;

               QInsItensRegistro.ParamByName('8').AsCurrency  := QItensRegistroALIQUOTA_GRP.AsCurrency;
               QInsItensRegistro.ParamByName('9').AsInteger   := iEmp;
               QInsItensRegistro.ParamByName('10').AsCurrency := QItensRegistroVALORTOTAL.AsCurrency + QItensRegistroCALC_VALOR_IPI.AsCurrency;

               if trim(QItensRegistroTIPO_GRP.AsString) = 'ST' then
                  begin 
                     QInsItensRegistro.ParamByName('11').AsCurrency:= strtocurr(EdtICMSSub.Text);
                     QInsItensRegistro.ParamByName('12').AsCurrency:= strtocurr(EdtBaseSub.Text);
                  end
               else
                  begin 
                     QInsItensRegistro.ParamByName('11').AsCurrency:= 0;
                     QInsItensRegistro.ParamByName('12').AsCurrency:= 0;
                  end;

               QInsItensRegistro.ExecOrOpen;
               dm.IBTRAux.Commit;
               QInsItensRegistro.Close;
               next;
            end;
      end;
   dm.IBTransaction.Commit;
   QItensRegistro.Close;
   BuscaSintegra(iCodReg);
end;

procedure TFrmEntradas.BuscaTaxas;
begin 
   if (CheckFrete.Checked) and (strtocurr(EdtFrete.Text) > 0) then
      cTaxaFrete:= (strtocurr(EdtFrete.Text) * 100) / strtocurr(EdtTotalProdutos.Text)
   else
      cTaxaFrete:= 0;

   if (CheckSub.Checked) and (strtocurr(EdtICMSSub.Text) > 0) then
      cTaxaSubTrib:= (strtocurr(EdtICMSSub.Text) * 100) / (strtocurr(EdtTotalProdutos.Text))
   else
      cTaxaSubTrib:= 0;

   if strtocurr(EdtAcres.Text) > 0 then
      cTaxaAcres:= (strtocurr(edtacres.Text) * 100) / (strtocurr(EdtTotalProdutos.Text))
   else
      cTaxaAcres:= 0;

   if strtocurr(EdtDesc.Text) > 0 then
      cTaxaDesc:= (strtocurr(edtdesc.Text) * 100) / (strtocurr(EdtTotalProdutos.Text))
   else
      cTaxaDesc:= 0;
end;

function TFrmEntradas.CalculaCusto(const cValorUnit, cQuant, cValorDesconto, cValorAcrescimo,
         cPercIPI, cPercST, cValorST, cValorIPI : currency) : currency;
var cIPI,
    cDescontoItem,
    cAcrescimoItem,
    cAcrescimoNota,
    cFreteItem,
    cSubTribItem,
    cCustoItem : currency;
begin 
   {Calcula o Desconto do item}
   if CheckCustoSemDesconto.Checked then
      cDescontoItem:= 0
   else
      cDescontoItem:= cValorDesconto / cQuant;

   {Calcula o Acréscimo do item}
   cAcrescimoItem:= cValorAcrescimo / cQuant;

   {calcula o Acrescimo da Nota}
   cAcrescimoNota:= ((cValorUnit * cTaxaAcres) / 100);

   {calcula o IPI}
   if cValorIPI > 0 then
      cIPI:= cValorIPI / strtocurr(EdtQuant.Text)
   else
      cIPI:= ((cValorUnit - cDescontoItem) * cPercIPI) / 100;

   {Calcula o Frete do item}
   cFreteItem:= ((cValorUnit * cTaxaFrete) / 100);

   {Calcula a Sub.Tributaria do Item}
   if cValorST > 0 then
      cSubTribItem:= cValorST / cQuant
   else
      if cPercST > 0 then
         cSubTribItem:= ((cValorUnit - cDescontoItem) * cPercST) / 100
      else
         cSubTribItem:= 0;

   {Calcula o Custo}
   cCustoItem:= cValorUnit + cIPI - cDescontoItem + cAcrescimoItem + cAcrescimoNota + cFreteItem + cSubTribItem;

   result:= cCustoItem;
end;

procedure TFrmEntradas.BuscaItens;
var cTotalCalculado, cTotalBase, cTotalICMS, cTotalIPI, cTotalST : currency;
    cIPI, cST : currency;
begin 
   cTotalCalculado:= 0;
   cTotalBase     := 0;
   cTotalICMS     := 0;
   cTotalIPI      := 0;
   cTotalST       := 0;

   cIPI           := 0;
   cST            := 0;

   {if CheckSub.Checked then
      cTotalCalculado:= cTotalCalculado + strtocurr(EdtICMSSub.Text);}

   {if CheckDescAcres.Checked then
      cTotalCalculado:= cTotalCalculado + strtocurr(EdtAcres.Text) - strtocurr(EdtDesc.Text);}

   {if CheckDescAcres.Checked then
      cTotalCalculado:= cTotalCalculado + strtocurr(EdtAcres.Text);}

   if CheckFrete.Checked then
      cTotalCalculado:= cTotalCalculado + strtocurr(EdtFrete.Text);

   if IBTREnt.Active then
      IBTREnt.Commit;
   IBTREnt.StartTransaction;
   with QBuscaItens do
      begin 
         close;
         Parambyname('codent').AsInteger:= strtoint(edtcod.Text);
         open;
         first;
         while not eof do
            begin 
               {calcula a base de calculo do icms}
               cTotalBase:= cTotalBase + QBuscaItensBASE_CALCULO.AsCurrency;

               {calcula o ICMS}
               cTotalICMS:= cTotalICMS + QBuscaItensVALOR_ICMS.AsCurrency;

               {calcula a Sub.Tributaria}
               if QBuscaItensVALOR_SUB_TRIBUTARIA.AsCurrency > 0 then
                  cST:= QBuscaItensVALOR_SUB_TRIBUTARIA.AsCurrency
               else
                  cST:= (((QBuscaItensQTD_PRO.AsCurrency * QBuscaItensVALOR_UNIT_PRO.AsCurrency) * QBuscaItensPERC_ST.AsCurrency) / 100);
               cTotalST:= cTotalST + cST;

               {calcula o IPI}
               if QBuscaItensVALOR_IPI.AsCurrency > 0 then
                  cIPI:= QBuscaItensVALOR_IPI.AsCurrency
               else
                  cIPI:= (((QBuscaItensQTD_PRO.AsCurrency * QBuscaItensVALOR_UNIT_PRO.AsCurrency) * QBuscaItensPERC_IPI.AsCurrency) / 100);
               cTotalIPI:= cTotalIPI + cIPI;

               cTotalCalculado:= cTotalCalculado + QBuscaItensVALOR_TOTAL.AsCurrency + cIPI;

               next;
            end;
         First;
      end;
   EdtTotalCalc.Text:= currtostr(cTotalCalculado);
   EdtDiferenca.Text:= currtostr(cTotalCalculado - strtocurr(EdtTotalNF.Text));
   EdtTotalBase.Text:= currtostr(cTotalBase);
   EdtTotalICMS.Text:= currtostr(cTotalICMS);
   EdtTotalIPI.Text := currtostr(cTotalIPI);
   EdtTotalST.Text  := currtostr(cTotalST);
   IBTREnt.CommitRetaining;
end;

procedure TFrmEntradas.LimpaItens;
begin 
   edtcodpro.Clear;
   edtnomepro.Clear;
   edtunid.Clear;
   EdtQuantUnid.Clear;
   EdtQuant.Clear;
   EdtValorUnid.Clear;
   EdtQuantUnid2.Clear;
   EdtValorUnit.Clear;
   EdtPerICMS.Clear;
   EdtPercST.Text:= currtostr(cTaxaSubTrib);
   EdtPerAcrescimoItem.Clear;
   EdtVlAcrescimoItem.Clear;
   EdtPerDescontoItem.Text:= currtostr(cTaxaDesc);
   EdtVlDescontoItem.Clear;
   EdtCusto.Clear;
   EdtTotal.Clear;
   LTribSaida.Caption:= '';
   EdtMargem.Clear;
   EdtPrecoVenda.Clear;
   EdtItem.Text:= inttostr(ordem);
end;

procedure TFrmEntradas.EdtCodForKeyPress(Sender: TObject; var Key: Char);
begin 
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmEntradas.BtnConsForClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsFor, FrmConsFor);
  FrmConsFor.tag:= 6;
  FrmConsFor.showmodal;
end;

procedure TFrmEntradas.BtnAddForClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadFor, True );
end;

procedure TFrmEntradas.EdtCodForKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsFor.Click
  else
     if key = vk_f2 then
        BtnAddFor.Click;
end;

procedure TFrmEntradas.EdtCodForExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
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
            sql.add('SELECT COD_FOR, RAZAO_FOR, INSC_FOR, EST_FOR ' +
                    'FROM FORNECEDOR');
            if Length(EdtCodFor.Text) = 14 then
               begin 
                  sql.add(' WHERE CNPJ_FOR = ' + #39 + FormataCNPJ(EdtCodFor.Text) + #39);
               end
            else
               begin 
                  sql.add(' WHERE COD_FOR = :CODFOR');
                  Parambyname('codfor').AsInteger:= StrToInt(EdtCodFor.Text);
               end;
            open;

            if not (fieldbyname('cod_for').IsNull) then
               begin 
                  EdtCodFor.Text := fieldbyname('cod_for').AsString;
                  EdtNomeFor.Text:= fieldbyname('insc_for').AsString + ' - ' + fieldbyname('razao_for').AsString;

                  { verifica insc.estadual }
                  if fieldbyname('insc_for').AsString <> '' then
                     begin 
{                        if not VerificaInscricao(fieldbyname('insc_for').AsString, fieldbyname('est_for').AsString) then
                           begin 
                              AlertaCad('Inscrição Estadual inválida, ' + #13 + 'favor corrigir no cadastro do fornecedor');
                           end;}
                     end;
               end
            else
               begin 
                  EdtNomeFor.Clear;
                  EdtCodFor.Clear;
                  AlertaCad('Fornecedor não Cadastrado');
//            //      EdtCodFor.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      EdtCodFor.Clear;
      EdtNomeFor.Clear;
      AlertaCad('Erro ao buscar o Fornecedor');
//   //   EdtCodFor.SetFocus;
    end;
  finally
    dm.QConsulta.Close;
  end;
end;

procedure TFrmEntradas.BtnConsProClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsProd, FrmConsProd);
  FrmConsProd.tag:= 2;
  FrmConsProd.showmodal;
end;

procedure TFrmEntradas.BtnAddProClick(Sender: TObject);
begin 
  inherited;
//  Application.CreateForm(TFrmCadProduto, FrmCadProduto);
  BuscaFormulario( TFrmCadProduto, True );
end;

procedure TFrmEntradas.EdtCodProKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsPro.Click
  else
     if key = vk_f2 then
        BtnAddPro.Click;
end;

procedure TFrmEntradas.EdtCodProExit(Sender: TObject);
var iAuxCFOP : integer;
    sTipoGRP : string;
    bAchou   : boolean;
begin 
  inherited;
  iAuxCFOP := 0;
  bAchou   := false;
  sTipoGRP := '';

  if trim(EdtCodPro.Text) = '' then
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
            sql.add('SELECT P.COD_PRO, P.NOME_PRO, P.QUANT_UNIDADE_ENTRADA,       ' +
                    'P.MARGEM_LUCRO_PRO, P.VALOR_PRO, P.ICMS_CF_EST, P.ATIVO_PRO, ' +
                    'G.NOME_GRP, G.TIPO_GRP, G.ALIQUOTA_GRP, U.DESCRICAO ' +
                    'FROM PRODUTO P ' +
                    'INNER JOIN GRUPO_ICMS G ' +
                    'ON (P.ICMS_CF_EST = G.COD_GRP) ' +
                    'INNER JOIN UNIDADE_MEDIDA U ' +
                    'ON (P.CODIGO_UNIDADE_ENTRADA = U.CODIGO)');

            if Length(trim(EdtCodPro.Text)) > 7 then
               sql.add(' WHERE P.CODIGO_BARRA_PRO = ' + #39 + trim(EdtCodPro.Text) + #39)
            else
               begin 
                  sql.add(' WHERE P.COD_PRO = :CODPRO');
                  parambyname('codpro').AsInteger:= strtoint(edtcodpro.Text);
               end;
            open;

            if not fieldbyname('cod_pro').IsNull then
               begin 
                  if trim(fieldbyname('ativo_pro').AsString) = 'S' then
                     begin 
                        bAchou              := true;
                        sTipoGRP            := trim(fieldbyname('TIPO_GRP').AsString);
                        EdtCodPro.Text      := fieldbyname('COD_PRO').AsString;
                        EdtNomePro.Text     := FieldByName('NOME_PRO').AsString;
                        label12.Caption     := 'Quant.' + FieldByName('DESCRICAO').AsString;
                        label14.Caption     := FieldByName('DESCRICAO').AsString + ' C/';
                        label17.Caption     := 'Vl.' + FieldByName('DESCRICAO').AsString;
                        label27.Caption     := label14.Caption;
                        EdtQuantUnid.Text   := FieldByName('QUANT_UNIDADE_ENTRADA').AsString;
                        EdtQuantUnid2.Text  := FieldByName('QUANT_UNIDADE_ENTRADA').AsString;
                        LTribSaida.Caption  := FieldByName('NOME_GRP').AsString;
                        EdtMargem.Text      := Fieldbyname('MARGEM_LUCRO_PRO').AsString;
                        EdtPrecoVenda.Text  := FieldByName('VALOR_PRO').AsString;
                     end
                  else
                     begin 
                        bAchou:= false;
                        AlertaCad('Produto não Ativo');
                        EdtNomePro.Clear;
//                        EdtCodPro.SetFocus;
                     end;
               end
            else
               begin 
                  bAchou:= false;
                  AlertaCad('Produto não Cadastrado');
                  edtnomepro.Clear;
//                  edtcodpro.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      bAchou:= false;
      AlertaCad('Erro ao Buscar o Produto');
      edtnomepro.Clear;
//      edtcodpro.SetFocus;
    end;
  finally
    dm.QConsulta.Close;
    if bAchou then
       begin 
          iAuxCFOP:= BuscaCFOP(strtoint(EdtCodPro.Text), sTipoGRP);
          if iAuxCFOP > 0 then
             EdtCFOP.Text:= inttostr(iAuxCFOP);
       end;
  end;
end;

procedure TFrmEntradas.EdtUnidExit(Sender: TObject);
begin 
  inherited;
  edtquant.Text:= floattostr(strtofloat(edtunid.Text) * strtofloat(edtquantunid.Text));
end;

procedure TFrmEntradas.EdtValorUnidExit(Sender: TObject);
begin 
  inherited;
  edtvalorunit.Text:= floattostr(strtofloat(edtvalorunid.Text) / strtofloat(edtquantunid2.Text));
  edttotal.Text    := floattostr(strtofloat(edtunid.Text) * strtofloat(edtvalorunid.Text));
end;

procedure TFrmEntradas.FormShow(Sender: TObject);
begin 
  inherited;
  panel6.Visible       := false;
  panel6.Enabled       := false;
  panel7.Enabled       := false;
  DBGrid1.Visible      := true;
  btngrava.Enabled     := false;
  btnnew.Enabled       := false;
  BtnExclui.Enabled    := false;
  BtnItens.Enabled     := false;
  BtnFinalizar.Enabled := false;
  iLocalEstoque        := 0;

  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('M001','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Panel5.Enabled:= false;
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             bGravaItem          := true;
             panel5.Enabled      := true;
             EdtEmissao.Text     := datetostr(date);
             EdtEnt.Text         := datetostr(date);
             ComboTipo.ItemIndex := 0;
             dbgrid1.SendToBack;
             EdtCodTipo.SetFocus;
           end;
     end
  else
     if tag = 1 then
        begin 
           Botoes('G');
           panel5.Enabled:= false;
           VerificaNoEstado;
           DBGrid1.SendToBack;
        end;
end;

procedure TFrmEntradas.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  ToolBar1.SetFocus;
  if (bGrava) and (not DM.Acesso('M001','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;

  if edttotalnf.Text = '0' then
     begin 
        AlertaCad('Digite o Total da Nota');
//        edttotalnf.SetFocus;
        exit;
     end;

  if edtcodfor.Text = '' then
     begin 
        AlertaCad('Digite o Código do Fornecedor');
//        EdtCodFor.SetFocus;
        exit;
     end;

  if IBTREnt.Active then
     ibtrent.Commit;
  ibtrent.StartTransaction;
  if bGrava = true then
     begin 
        try
          try
            with QInsEntrada do
               begin 
                  close;
                  Parambyname('codemp').AsInteger           := iEmp;
                  Parambyname('dataemi').AsDate             := strtodate(EdtEmissao.Text);
                  Parambyname('dataent').AsDate             := strtodate(EdtEnt.Text);
                  Parambyname('codfor').AsInteger           := strtoint(EdtCodFor.Text);
                  Parambyname('total').AsCurrency           := strtocurr(EdtTotalNF.Text);
                  Parambyname('totalprodutos').AsCurrency   := strtocurr(EdtTotalProdutos.Text);
                  Parambyname('acres').AsCurrency           := strtocurr(EdtAcres.text);;
                  Parambyname('desc').AsCurrency            := strtocurr(EdtDesc.Text);
                  Parambyname('frete').AsCurrency           := strtocurr(EdtFrete.Text);
                  Parambyname('icmsfrete').AsCurrency       := strtocurr(EdtICMSFrete.Text);

                  case ComboTipo.ItemIndex of
                   0: Parambyname('tipoent').AsString       := 'P';
                   1: Parambyname('tipoent').AsString       := 'V';
                  end;

                  Parambyname('numnfent').AsString          := trim(EdtNumNF.Text);
                  Parambyname('serie').AsString             := Trim(EdtSerie.Text);
                  Parambyname('basesub').AsCurrency         := strtocurr(EdtBaseSub.Text);
                  Parambyname('icmssub').AsCurrency         := strtocurr(EdtICMSSub.Text);

                  if CheckFrete.Checked then
                     Parambyname('freteincluso').AsString   := 'S'
                  else
                     Parambyname('freteincluso').AsString   := 'N';

                  if CheckSub.Checked then
                     Parambyname('icmssubincluso').AsString := 'S'
                  else
                     Parambyname('icmssubincluso').AsString := 'N';
                  Parambyname('modelo').AsString            := trim(EdtCodModelo.Text);

                  if CheckCustoSemDesconto.Checked then
                     Parambyname('custosemdesconto').AsString:= 'S'
                  else
                     Parambyname('custosemdesconto').AsString:= 'N';

                  Parambyname('codigoes').AsInteger:= strtoint(EdtCodTipo.Text); 

                  Open;
                  EdtCod.Text:= QInsEntradaCODENT.AsString;
               end;
            IBTREnt.Commit;
            bEntradaAberta:= true;
            Botoes('G');
            panel5.Enabled     := false;
            panel6.Visible     := true;
            panel6.Enabled     := true;
            DBGrid1.Visible    := false;
            panel7.Enabled     := true;
            btngrava.Enabled   := true;
            btnnew.Enabled     := false;
            btnexclui.Enabled  := false;
            BtnItens.Enabled   := true;
            BtnFinalizar.Enabled := true;
            edtcodpro.SetFocus;
          except
            IBTREnt.Rollback;
            bEntradaAberta:= false;
            BtnFinalizar.Enabled:= false;
            AlertaCad('Erro ao Gravar a Entrada');
          end;
        finally
          VerificaNoEstado;
          BuscaTaxas;
          iLocalEstoque:= BuscaLocalEstoque;
          QInsEntrada.Close;
          LimpaItens;
        end;
     end
  else
     begin 
        try
          try
            with QUpdEnt do
               begin 
                  close;
                  Parambyname('codent').AsInteger          := strtoint(edtcod.Text);
                  Parambyname('dataemient').AsDate         := strtodate(EdtEmissao.Text);
                  Parambyname('dataentent').AsDate         := strtodate(EdtEnt.Text);
                  Parambyname('codfor').AsInteger          := strtoint(EdtCodFor.Text);
                  Parambyname('totalent').AsCurrency       := strtocurr(EdtTotalNF.Text);
                  Parambyname('totalprodutos').AsCurrency  := strtocurr(EdtTotalProdutos.Text);
                  Parambyname('acresent').AsCurrency       := strtocurr(EdtAcres.Text);
                  Parambyname('descent').AsCurrency        := strtocurr(EdtDesc.Text);
                  Parambyname('freteent').AsCurrency       := strtocurr(EdtFrete.Text);
                  Parambyname('icmsfreteent').AsCurrency   := strtocurr(EdtICMSFrete.Text);

                  case ComboTipo.ItemIndex of
                   0: Parambyname('tipoent').AsString      := 'P';
                   1: Parambyname('tipoent').AsString      := 'V';
                  end;

                  Parambyname('numnfent').AsString  := trim(EdtNumNF.Text);
                  Parambyname('serie').AsString     := Trim(EdtSerie.Text);
                  Parambyname('basesub').AsCurrency := strtocurr(EdtBaseSub.Text);
                  Parambyname('icmssub').AsCurrency := strtocurr(EdtICMSSub.Text);
                  if CheckFrete.Checked then
                     Parambyname('freteincluso').AsString:= 'S'
                  else
                     Parambyname('freteincluso').AsString:= 'N';
                  if CheckSub.Checked then
                     Parambyname('icmssubincluso').AsString:= 'S'
                  else
                     Parambyname('icmssubincluso').AsString:= 'N';
                  Parambyname('modelo').AsString  := trim(EdtCodModelo.Text);
                  ExecOrOpen;
               end;
            ibtrent.Commit;
            bEntradaAberta:= true;
            BtnFinalizar.Enabled:= true;
            Botoes('G');
            panel5.Enabled    := false;
            panel6.Visible    := true;
            panel6.Enabled    := true;
            DBGrid1.Visible   := false;
            panel7.Enabled    := true;
            btngrava.Enabled  := true;
            btnnew.Enabled    := false;
            btnexclui.Enabled := false;
            BtnItens.Enabled  := true;
          except
            ibtrent.Rollback;
            bEntradaAberta:= false;
            BtnFinalizar.Enabled:= false;
            AlertaCad('Erro ao Gravar a Entrada');
          end;
        finally
          VerificaNoEstado;
          QUpdEnt.Close;
          BuscaTaxas;
          iLocalEstoque:= BuscaLocalEstoque;
          LimpaItens;
          BuscaItens;
        end;
     end;
end;

procedure TFrmEntradas.BtnGravaClick(Sender: TObject);
var cAuxValorTotal     : currency;
    cAuxBaseCalculo    : currency;
    cAuxValorICMS      : currency;
    cAuxTotalDescItem  : currency;
    cAuxTotalAcresNota : currency;
    cAuxTotalAcresItem : currency;
    cAuxTotalSubTrib   : currency;
    cAuxTotalIPI       : currency;
    sAuxTipoGRP        : string;
begin 
  inherited;
  cAuxValorTotal       := 0;
  cAuxBaseCalculo      := 0;
  cAuxValorICMS        := 0;
  cAuxTotalDescItem    := 0;
  cAuxTotalAcresNota   := 0;
  cAuxTotalAcresItem   := 0;
  cAuxTotalSubTrib     := 0;
  cAuxTotalIPI         := 0;
  sAuxTipoGRP          := '';

  btngrava.Enabled     := true;
  btnnew.Enabled       := false;
  btnexclui.Enabled    := false;
  BtnItens.Enabled     := true;

  if iLocalEstoque = 0 then
     iLocalEstoque:= BuscaLocalEstoque;

  {busca o tipo do grupo de icms}
  sAuxTipoGRP:= dm.RetornaStringTabela('tipo_grp', 'grupo_icms', 'cod_grp', strtoint(EdtCodGRP.Text));

  {calculando o desconto do item}
  cAuxTotalDescItem:= strtocurr(EdtVlDescontoItem.Text);

  {calculando o acrescimo da nota}
  cAuxTotalAcresNota:= ((strtocurr(EdtQuant.Text) * strtocurr(EdtValorUnit.Text)) *
                        cTaxaAcres) / 100;

  {calculando o acrescimo do item}
  cAuxTotalAcresItem:= strtocurr(EdtVlAcrescimoItem.Text);

  {calcula a Sub.Tributaria}
  if strtocurr(EdtSubValor.Text) > 0 then
     cAuxTotalSubTrib:= strtocurr(EdtSubValor.Text)
  else
     cAuxTotalSubTrib:= ((strtocurr(EdtQuant.Text) * strtocurr(EdtValorUnit.Text)) *
                          strtocurr(EdtPercST.Text)) / 100;

  {calcula o IPI}
  if strtocurr(EdtIPIValor.Text) > 0 then
     cAuxTotalIPI:= strtocurr(EdtIPIValor.Text)
  else
     cAuxTotalIPI:= ((strtocurr(EdtQuant.Text) * strtocurr(EdtValorUnit.Text)) *
                      strtocurr(EdtPerIPI.Text)) / 100;

  {calculando o valor total}
  cAuxValorTotal:= (strtocurr(EdtQuant.Text) * strtocurr(EdtValorUnit.Text)) -
                    cAuxTotalDescItem + cAuxTotalAcresItem + cAuxTotalAcresNota +
                    cAuxTotalSubTrib;

  {calculando a base de calculo do icms}
  if (trim(sAuxTipoGRP) <> 'SN') and (strtocurr(EdtPerICMS.Text) > 0) then
     begin 
        if strtocurr(EdtPercBCR.Text) > 0 then
           cAuxBaseCalculo:= (((cAuxValorTotal - cAuxTotalSubTrib) * strtocurr(EdtPercBCR.Text)) / strtocurr(EdtPerICMS.Text))
        else
           cAuxBaseCalculo:= (cAuxValorTotal - cAuxTotalSubTrib);
     end
  else
     cAuxBaseCalculo:= 0;

  {calculando o valor do icms}
  cAuxValorICMS:= ((cAuxBaseCalculo * strtocurr(EdtPerICMS.Text)) / 100);

  if edtcodpro.Text = '' then
     begin 
        AlertaCad('Digite o código do produto');
//        edtcodpro.SetFocus;
        exit;
     end;
  if edtvalorunid.Text = '0' then
     begin 
        AlertaCad('Digite o valor do Item');
//        edtvalorunid.SetFocus;
        exit;
     end;
  if IBTRItem.Active then
     IBTRItem.Commit;
  IBTRItem.StartTransaction;
  try
    try
      with IBSQLItem do
         begin 
            close;
            sql.clear;
            if bGravaItem = true then
               sql.Add('INSERT INTO ITENS_ENTRADA (COD_ENT, COD_PRO, PERC_ICMS, PERC_IPI,       ' +
                       'QTDUND_ENT, PERC_DESC, PERC_ACRES, COD_EMP, VALOR_UNIT_PRO, CUSTO,      ' +
                       'QTD_PRO, COD_GRP, COD_CFOP, VALOR_DESCONTO, VALOR_ACRESCIMO,            ' +
                       'PERC_BCR, PERC_ST, CST, VALOR_TOTAL, BASE_CALCULO, VALOR_ICMS, ORDEM,   ' +
                       'VALOR_SUB_TRIBUTARIA, VALOR_IPI, CODIGO_LOCAL_ESTOQUE)                  ' +
                       'VALUES (:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11, :12, :13,         ' +
                       ':14, :15, :16, :17, :18, :19, :20, :21, :22, :23, :24, :25)')
            else
               begin 
                  sql.add('UPDATE ITENS_ENTRADA SET COD_PRO = :2, PERC_ICMS = :3, PERC_IPI = :4, QTDUND_ENT = :5, ' +
                          'PERC_DESC = :6, PERC_ACRES = :7, COD_EMP = :8, VALOR_UNIT_PRO = :9,                    ' +
                          'CUSTO = :10, QTD_PRO = :11, COD_GRP = :12, COD_CFOP = :13,                             ' +
                          'VALOR_DESCONTO = :14, VALOR_ACRESCIMO = :15, PERC_BCR = :16,                           ' +
                          'PERC_ST = :17, CST = :18, VALOR_TOTAL = :19, BASE_CALCULO = :20, VALOR_ICMS = :21,     ' +
                          'VALOR_SUB_TRIBUTARIA = :23, VALOR_IPI = :24, CODIGO_LOCAL_ESTOQUE = :25                ' +
                          'WHERE COD_ENT = :1 AND ORDEM = :22');
               end;
            parambyname('1').AsInteger     := strtoint(edtcod.Text);
            parambyname('2').AsInteger     := strtoint(EdtCodPro.Text);
            parambyname('3').AsCurrency    := strtocurr(EdtPerICMS.Text);
            parambyname('4').AsCurrency    := strtocurr(EdtPerIPI.Text);
            parambyname('5').AsCurrency    := strtocurr(edtquantunid.Text);
            parambyname('6').AsCurrency    := strtocurr(EdtPerDescontoItem.Text);
            parambyname('7').AsCurrency    := strtocurr(EdtPerAcrescimoItem.Text);
            Parambyname('8').AsInteger     := iEmp;
            parambyname('9').AsCurrency    := strtocurr(edtvalorunit.Text);
            Parambyname('10').AsCurrency   := strtocurr(EdtCusto.Text);
            Parambyname('11').AsCurrency   := strtocurr(edtquant.Text);
            if EdtCodGRP.text = '' then
               Parambyname('12').Value     := null
            else
               Parambyname('12').AsInteger := strtoint(EdtCodGRP.Text);
            if EdtCFOP.text = '' then
               Parambyname('13').Value     := null
            else
               Parambyname('13').AsInteger := strtoint(EdtCFOP.Text);
            Parambyname('14').AsCurrency   := strtocurr(EdtVlDescontoItem.Text);
            Parambyname('15').AsCurrency   := strtocurr(EdtVlAcrescimoItem.Text);
            Parambyname('16').AsCurrency   := strtocurr(EdtPercBCR.Text);
            Parambyname('17').AsCurrency   := strtocurr(EdtPercST.Text);
            Parambyname('18').AsString     := EdtCST.Text;
            Parambyname('19').AsCurrency   := cAuxValorTotal;
            Parambyname('20').AsCurrency   := cAuxBaseCalculo;
            Parambyname('21').AsCurrency   := cAuxValorICMS;
            Parambyname('22').AsInteger    := strtoint(EdtItem.text);
            Parambyname('23').AsCurrency   := strtocurr(EdtSubValor.Text);
            Parambyname('24').AsCurrency   := strtocurr(EdtIPIValor.Text);
            Parambyname('25').AsInteger    := iLocalEstoque;
            ExecOrOpen;
         end;
      IBTRItem.Commit;
    except
      IBTRItem.Rollback;
      AlertaCad('Erro ao Gravar o Item');
    end;
  finallY
    bGravaItem:= true;
    IBSQLItem.Close;
    LimpaItens;
    BuscaItens;
    edtcodpro.SetFocus;
  end;
end;

procedure TFrmEntradas.BtnItensClick(Sender: TObject);
begin 
  inherited;
  sb.SimplePanelStyle.Text   := 'Pressione F3 para Calcular Preço de venda';
  panel6.Visible  := false;
  DBGrid1.Visible := true;
  BuscaItens;

  btngrava.Enabled    := false;
  btnnew.Enabled      := true;
  btnexclui.Enabled   := true;
  BtnItens.Enabled    := false;
  DBGrid1.SetFocus;
end;

procedure TFrmEntradas.DBGrid1DblClick(Sender: TObject);
begin 
  inherited;
  bGravaItem:= false;
  EdtMargem.Clear;
  EdtItem.Text             := QBuscaItensORDEM.AsString;
  edtcodpro.Text           := QBuscaItensCOD_PRO.AsString;
  edtnomepro.Text          := QBuscaItensNOME_PRO.AsString;
  EdtCST.Text              := QBuscaItensCST.AsString;
  LTribSaida.Caption       := QBuscaItensNOME_GRP.AsString;
  EdtMargem.Text           := QBuscaItensMARGEM_LUCRO_PRO.AsString;
  EdtPrecoVenda.Text       := QBuscaItensVALOR_PRO.AsString;
  if QBuscaItensQTDUND_ENT.AsCurrency > 0 then
     begin 
        edtunid.Text       := currtostr(QBuscaItensQTD_PRO.AsCurrency / QBuscaItensQTDUND_ENT.AsCurrency);
        EdtQuantUnid2.Text := QBuscaItensQTDUND_ENT.AsString;
        EdtQuantUnid.Text  := QBuscaItensQTDUND_ENT.AsString;
        edtvalorunid.Text  := currtostr(QBuscaItensVALOR_UNIT_PRO.AsCurrency * QBuscaItensQTDUND_ENT.AsCurrency);
        EdtValorUnit.Text  := QBuscaItensVALOR_UNIT_PRO.AsString;
        edtquant.Text      := currtostr(strtocurr(edtunid.Text) * strtocurr(edtquantunid.Text));
     end
  else
     begin 
        EdtUnid.Clear;
        EdtQuant.Text      := QBuscaItensQTD_PRO.AsString;
        EdtQuantUnid2.Text := QBuscaItensQTD_PRO.AsString;
        EdtValorUnid.Text  := QBuscaItensVALOR_UNIT_PRO.AsString;
        EdtValorUnit.Text  := QBuscaItensVALOR_UNIT_PRO.AsString;
     end;

  EdtTotal.Text            := currtostr(QBuscaItensQTD_PRO.AsCurrency * QBuscaItensVALOR_UNIT_PRO.AsCurrency);
  EdtPerDescontoItem.Text  := QBuscaItensPERC_DESC.AsString;
  EdtVlDescontoItem.Text   := QBuscaItensVALOR_DESCONTO.AsString;
  EdtPerAcrescimoItem.Text := QBuscaItensPERC_ACRES.AsString;
  EdtVlAcrescimoItem.Text  := QBuscaItensVALOR_ACRESCIMO.AsString;
  EdtPerICMS.Text          := QBuscaItensPERC_ICMS.AsString;
  EdtPercST.Text           := QBuscaItensPERC_ST.AsString;
  EdtPercBCR.Text          := QBuscaItensPERC_BCR.AsString;
  edtperipi.Text           := QBuscaItensPERC_IPI.AsString;
  EdtCodGRP.text           := QBuscaItensCOD_GRP.AsString;
  EdtCFOP.Text             := QBuscaItensCOD_CFOP.AsString;
  EdtSubValor.Text         := QBuscaItensVALOR_SUB_TRIBUTARIA.AsString;
  EdtIPIValor.Text         := QBuscaItensVALOR_IPI.AsString;

  EdtCodGRPExit(EdtCodGRP);
  EdtCFOPExit(EdtCFOP);

  btngrava.Enabled         := true;
  btnnew.Enabled           := false;
  btnexclui.Enabled        := false;
  BtnItens.Enabled         := true;
  panel6.Visible           := true;
  DBGrid1.Visible          := false;
  EdtCFOP.SetFocus;
end;

procedure TFrmEntradas.BtnExcluiClick(Sender: TObject);
begin 
  inherited;
  btngrava.Enabled    := false;
  btnnew.Enabled      := true;
  btnexclui.Enabled   := true;
  BtnItens.Enabled    := false;
  if Application.MessageBox('Confirma a Exclusão do Item?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin 
        if IBTRItem.Active then
           IBTRItem.Commit;
        IBTRItem.StartTransaction;
        try
          try
            with IBSQLItem do
               begin 
                  close;
                  SQL.Clear;
                  SQL.add('DELETE FROM ITENS_ENTRADA ' +
                          'WHERE COD_ENT = :1 AND ORDEM = :2');
                  Parambyname('1').AsInteger:= strtoint(edtcod.text);
                  Parambyname('2').AsInteger:= QBuscaItensORDEM.AsInteger;
                  ExecOrOpen;
               end;
            IBTRItem.Commit;
          except
            IBTRItem.Rollback;
            AlertaCad('Erro ao Excluir o Item');
          end;
        finally
          bGravaItem:= true;
          IBSQLItem.Close;
          LimpaItens;
          BuscaItens;
        end;
     end;
end;

procedure TFrmEntradas.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin 
  inherited;
  if key = #13 then
     begin 
        key:= #0;
        DBGrid1DblClick(sender);
     end;
end;

procedure TFrmEntradas.BtnNewClick(Sender: TObject);
begin 
  inherited;
  bGravaItem:= true;
  SB.SimplePanelStyle.Text:= '';
  dbgrid1.Visible   := false;
  Panel6.Visible    := true;
  btngrava.Enabled  := true;
  btnnew.Enabled    := false;
  btnexclui.Enabled := false;
  BtnItens.Enabled  := true;
  limpaitens;
  edtcodpro.setfocus;
end;

procedure TFrmEntradas.BtnSairClick(Sender: TObject);
begin 
  inherited;
  //close;
end;

procedure TFrmEntradas.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  ToolBar1.SetFocus;
  if bEntradaAberta then
     begin 
        AlertaCad('Entrada Aberta');
        exit;
     end;
  BtnFinalizar.Enabled:= false;
  panel6.Visible      := false;
  panel6.Enabled      := false;
  panel7.Enabled      := false;
  DBGrid1.Visible     := true;
  btngrava.Enabled    := false;
  btnnew.Enabled      := false;
  BtnExclui.Enabled   := false;
  BtnItens.Enabled    := false;
  iLocalEstoque       := 0;

  if IBTREnt.Active then
     IBTREnt.Commit;
  QBuscaItens.Close;
  bGrava:= true;
  if not DM.Acesso('M001','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  bGravaItem          := true;
  panel5.Enabled      := true;
  EdtEmissao.Text     := datetostr(date);
  EdtEnt.Text         := datetostr(date);
  ComboTipo.ItemIndex := 0;
  dbgrid1.SendToBack;
  EdtCodTipo.SetFocus;
end;

procedure TFrmEntradas.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  ToolBar1.SetFocus;
  if not panel5.Enabled then
     AlertaCad('Entrada já foi gravada')
  else
     begin 
        bEntradaAberta:= false;
        Botoes('C');
        panel5.Enabled      := false;
        panel6.Enabled      := false;
        panel7.Enabled      := false;
        btngrava.Enabled    := false;
        btnnew.Enabled      := false;
        BtnExclui.Enabled   := false;
        BtnItens.Enabled    := false;
     end;
end;

procedure TFrmEntradas.EdtCodProEnter(Sender: TObject);
begin 
  inherited;
  edtcodpro.SelectAll;
end;

procedure TFrmEntradas.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  ToolBar1.SetFocus;
  if not DM.Acesso('M001','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;

  if Application.MessageBox('Confirma a Exclusão da Entrada?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin 
        if IBTREnt.Active then
           IBTREnt.Commit;
        if IBTRItem.Active then
           IBTRItem.Commit;
        QBuscaItens.Close;
        IBTREnt.StartTransaction;
        try
          try
            with QDelEntrada do
               begin 
                  close;
                  Parambyname('codent').Value  := edtcod.Text;
                  ExecOrOpen;
               end;
            IBTREnt.Commit;
            bEntradaAberta:= false;
            BtnFinalizar.Enabled:= false;
            Botoes('E');
          except
            IBTREnt.Rollback;
            BtnFinalizar.Enabled:= true;
            bEntradaAberta:= true;
            AlertaCad('Erro ao Excluir a Entrada');
          end;
        finally
          QDelEntrada.Close;
          panel5.Enabled      := false;
          panel6.Enabled      := false;
          panel7.Enabled      := false;
          btngrava.Enabled    := false;
          btnnew.Enabled      := false;
          BtnExclui.Enabled   := false;
          BtnItens.Enabled    := false;
        end;
     end;
end;

procedure TFrmEntradas.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsEntrada, FrmConsEntrada);
  FrmConsEntrada.tag:= 0;
  FrmConsEntrada.showmodal;
end;

procedure TFrmEntradas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTREnt.Active then
     IBTREnt.Commit;
  QBuscaItens.Close;
  Action:= caFree;
end;

procedure TFrmEntradas.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('M001','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  panel5.Enabled:= true;
  edtemissao.SetFocus;
end;

procedure TFrmEntradas.EdtEmissaoExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;
  with sender as TMaskEdit do
     begin 
        try
          strtodate(text);
        except
          AlertaCad('Data Inválida');
          SetFocus;
        end;
     end;
end;

procedure TFrmEntradas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   case key of
     vk_escape: begin 
                   if panel6.Visible then
                      BtnItens.Click
                   else
                      BtnSair.Click;
                 end;
     vk_f3: begin 
               if (BtnConsultar.Enabled) and (BtnNovo.Enabled) then
                  BtnConsultar.Click;
            end;
     vk_f5: begin 
               if btnnovo.Enabled then
                  btnnovo.Click;
            end;
     vk_f6: begin 
               if btngravar.Enabled then
                  btngravar.Click;
            end;
     vk_f7: begin 
               if btncancelar.Enabled then
                  btncancelar.Click;
            end;
     vk_f8: begin 
               if btnalterar.Enabled then
                  btnalterar.Click;
            end;
     vk_f9: begin 
               if btnexcluir.Enabled then
                  btnexcluir.Click;
            end;
     vk_f12: begin 
                if BtnFinalizar.Enabled = true then
                   BtnFinalizar.Click;
             end;
  end;
end;

procedure TFrmEntradas.BtnFinalizarClick(Sender: TObject);
var iAuxCod : integer;
begin 
  inherited;
  bEntradaAberta:= false;

  {sintegra}
  if DM.RetornaStringTabela('gerar_sintegra', 'parametros', 'cod_emp', iEmp) = 'S' then
      begin 
         {verifica se já esta na tabela}
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         try
           try
             with dm.QConsulta do
                begin 
                   close;
                   sql.Clear;
                   sql.Add('SELECT CODIGO ' +
                           'FROM REGISTRO_LIVRO_ENTRADAS ' +
                           'WHERE CODIGO_ENTRADA = :COD');
                   Parambyname('cod').AsInteger:= strtoint(EdtCod.Text);
                   open;
                   iAuxCod:= fieldbyname('codigo').AsInteger;
                end;
             dm.IBTransaction.Commit;
           except
             dm.IBTransaction.Rollback;
             AlertaCad('Erro ao verificar o Registro de Entrada');
           end;
         finally
           dm.QConsulta.Close;
         end;

         if iAuxCod > 0 then
            begin 
               if Application.MessageBox('Refazer o Registro de Entrada?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
                  begin 
                     if dm.IBTransaction.Active then
                        dm.IBTransaction.Commit;
                     dm.IBTransaction.StartTransaction;
                     try
                       try
                         with dm.QConsulta do
                            begin 
                               close;
                               sql.Clear;
                               sql.add('DELETE FROM REGISTRO_LIVRO_ENTRADAS ' +
                                       'WHERE CODIGO = :COD');
                               Parambyname('cod').AsInteger:= iAuxCod;
                               ExecOrOpen;
                            end;
                         dm.IBTransaction.Commit;
                       except
                         dm.IBTransaction.Rollback;
                         AlertaCad('Erro ao excluir o Registro de Entrada');
                       end;
                     finally
                       dm.QConsulta.Close;
                     end;
                     GerarSintegra;
                  end
               else
                  BuscaSintegra(iAuxCod);
            end
         else
            GerarSintegra;
      end;

  if not DM.Acesso('M005','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        exit;
     end;
  Application.CreateForm(TFrmLancContasPagar, FrmLancContasPagar);
  FrmLancContasPagar.showmodal;
end;

procedure TFrmEntradas.EdtQuantUnidExit(Sender: TObject);
begin 
  inherited;
  EdtQuantUnid2.Text:= EdtQuantUnid.Text;
  edtquant.Text:= floattostr(strtofloat(edtunid.Text) * strtofloat(edtquantunid.Text));
end;

procedure TFrmEntradas.EdtPerIPIExit(Sender: TObject);
begin 
  inherited;
  edtcusto.Text:= currtostr(CalculaCusto(strtocurr(EdtValorUnit.Text),
                                         strtocurr(EdtQuant.Text),
                                         strtocurr(EdtVlDescontoItem.Text),
                                         strtocurr(EdtVlAcrescimoItem.Text),
                                         strtocurr(EdtPerIPI.Text),
                                         strtocurr(EdtPercST.Text),
                                         strtocurr(EdtSubValor.Text),
                                         strtocurr(EdtIPIValor.Text)));
end;

procedure TFrmEntradas.EdtCodForEnter(Sender: TObject);
begin 
  inherited;
  EdtCodFor.SelectAll;
end;

procedure TFrmEntradas.BtnConsCFOPClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCFOP, FrmConsCFOP);
  FrmConsCFOP.tag:= 7;
  FrmConsCFOP.showmodal;
end;

procedure TFrmEntradas.BtnAddCFOPClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadCFOP, True );
end;

procedure TFrmEntradas.EdtCFOPEnter(Sender: TObject);
begin 
  inherited;
  edtcfop.SelectAll;
end;

procedure TFrmEntradas.EdtCFOPExit(Sender: TObject);
begin 
  inherited;
  if (ToolBar1.Focused) or (EdtCFOP.Text = '') then
     begin 
        EdtNomeCFOP.Clear;
        exit;
     end;
  EdtNomeCFOP.Text:= consulta('cfop', EdtCFOP, 'cod_cfo', 'nome_cfo', dm.IBTransaction, dm.qConsulta);
  if EdtNomeCFOP.Text = '' then
     begin 
        AlertaCad('CFOP não Cadastrado');
//        edtcfop.SetFocus;
     end;

  if bNoEstado then
     begin 
        if strtoint(copy(edtcfop.Text, 1, 1)) <> 1 then
          begin 
             AlertaCad('CFOP inválido para Entrada no Estado');
//             EdtCFOP.SetFocus;
             exit;
          end;
     end
  else
     begin 
        if strtoint(copy(edtcfop.Text, 1, 1)) <> 2 then
          begin 
             AlertaCad('CFOP inválido para Entrada Fora do Estado');
//             EdtCFOP.SetFocus;
             exit;
          end;
     end;
end;

procedure TFrmEntradas.EdtCFOPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsCFOP.Click
  else
     if key = vk_f2 then
        BtnAddCFOP.Click;
end;

procedure TFrmEntradas.BtnAddGRPClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadGICMS, True );
end;

procedure TFrmEntradas.BtnConsGRPClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsGRP, FrmConsGRP);
  FrmConsGRP.Tag:= 4;
  FrmConsGRP.ShowModal;
end;

procedure TFrmEntradas.EdtCodGRPEnter(Sender: TObject);
begin 
  inherited;
  EdtCodGRP.SelectAll;
end;

procedure TFrmEntradas.EdtCodGRPExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
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
            sql.add('SELECT COD_GRP, NOME_GRP, ALIQUOTA_GRP ' +
                    'FROM GRUPO_ICMS WHERE COD_GRP = :CODGRP');
            Parambyname('codgrp').AsInteger:= strtoint(EdtCodGRP.Text);
            Open;
            if not (fieldbyname('cod_grp').IsNull) then
               begin 
                  EdtNomeGRP.Text:= fieldbyname('nome_grp').AsString;
                  EdtPerICMS.Text:= fieldbyname('aliquota_grp').AsString;
               end
            else
               begin 
                  EdtNomeGRP.Clear;
                  EdtPerICMS.Clear;
                  AlertaCad('Grupo de ICMS não cadastrado');
//                  EdtCodGRP.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('Erro ao buscar o Grupo de ICMS');
//      EdtCodGRP.SetFocus;
    end;
  finally
    dm.QConsulta.Close;
  end;
end;

procedure TFrmEntradas.EdtCodGRPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsGRP.Click
  else
     if key = vk_f2 then
        BtnAddGRP.Click;
end;

procedure TFrmEntradas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin 
  inherited;
  if bEntradaAberta then
     begin 
        AlertaCad('Nota Fiscal de Entrada Aberta');
        CanClose:= false;
     end;
end;

procedure TFrmEntradas.EdtPerAcrescimoItemExit(Sender: TObject);
begin 
  inherited;
    if strtocurr(EdtPerAcrescimoItem.Text) > 0 then
     EdtVlAcrescimoItem.Text:= currtostr((strtocurr(EdtTotal.text) *
                                         strtocurr(EdtPerAcrescimoItem.Text)) / 100);
end;

procedure TFrmEntradas.EdtPerDescontoItemExit(Sender: TObject);
begin 
  inherited;
    if strtocurr(EdtPerDescontoItem.Text) > 0 then
     EdtVlDescontoItem.Text:= currtostr((strtocurr(EdtTotal.text) *
                                         strtocurr(EdtPerDescontoItem.Text)) / 100);
end;

procedure TFrmEntradas.DBGrid1Enter(Sender: TObject);
begin 
  inherited;
  FrmEntradas.KeyPreview:= false;
end;

procedure TFrmEntradas.DBGrid1Exit(Sender: TObject);
begin 
  inherited;
  FrmEntradas.KeyPreview:= true; 
end;

procedure TFrmEntradas.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  case key of
     vk_escape : close;
     vk_f3: begin 
               if (BtnConsultar.Enabled) and (BtnNovo.Enabled) then
                  BtnConsultar.Click;
            end;
     vk_f5: begin 
               if btnnovo.Enabled then
                  btnnovo.Click;
            end;
     vk_f6: begin 
               if btngravar.Enabled then
                  btngravar.Click;
            end;
     vk_f7: begin 
               if btncancelar.Enabled then
                  btncancelar.Click;
            end;
     vk_f8: begin 
               if btnalterar.Enabled then
                  btnalterar.Click;
            end;
     vk_f9: begin 
               if btnexcluir.Enabled then
                  btnexcluir.Click;
            end;
     vk_f2: begin 
               Application.CreateForm(TFrmFormacaoPreco, FrmFormacaoPreco);
               FrmFormacaoPreco.EdtCodProd.Text := QBuscaItensCOD_PRO.AsString;
               FrmFormacaoPreco.EdtNomeProd.Text:= QBuscaItensNOME_PRO.AsString;
               FrmFormacaoPreco.Tag:= 0;
               FrmFormacaoPreco.ShowModal;
            end;
  end;
end;

procedure TFrmEntradas.EdtNumNFExit(Sender: TObject);
var sAux : string;
begin 
  inherited;
  {VERIFICA SE FOI LANÇADO}
  sAux:= '';
  if EdtNumNF.Text = '' then
     begin 
        EdtNumNF.SetFocus;
        exit;
        abort;
     end;

  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.QConsulta do
         begin 
            close;
            sql.Clear;
            sql.add('SELECT E.COD_EMP, E.COD_ENT, E.NUMNF_ENT, F.RAZAO_FOR, E.TOTAL_ENT ' +
                    'FROM ENTRADAS E ' +
                    'INNER JOIN FORNECEDOR F ' +
                    'ON (E.COD_FOR = F.COD_FOR) ' +
                    'WHERE E.NUMNF_ENT LIKE ' + #39 + '%' + trim(EdtNumNF.Text) + '%' + #39);
            open;
            while not eof do
               begin 
                  sAux:= sAux + '[' + fieldbyname('cod_emp').AsString + '] ' + 
                                FormataStringE(fieldbyname('cod_ent').AsString, '6', ' ')    + '  ' +
                                FormataStringE(fieldbyname('numnf_ent').AsString, '6', ' ')  + '  ' +
                                FormataStringE(fieldbyname('razao_for').AsString, '35', ' ') + '  ' +
                                FormataStringD('R$ ' + currtostrf(fieldbyname('total_ent').AsCurrency, ffnumber, 2), '10', ' ') + #13;
                  next;
               end;
            if sAux <> '' then
               begin 
                  if Application.MessageBox(pchar('Documento existente na(s) entrada(s):' + #13 + sAux), 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton2) = 7 then
                     begin 
                        EdtNumNF.SetFocus;
                     end;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('Erro ao verificar se o documento já foi lançado');
    end;
  finally
    dm.QConsulta.Close;
  end;
end;

procedure TFrmEntradas.EdtCodModeloEnter(Sender: TObject);
begin 
  inherited;
  EdtCodModelo.SelectAll; 
end;

procedure TFrmEntradas.EdtCodModeloExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;
  EdtNomeModelo.Text:= consulta('codificacao_documentos', EdtCodModelo, 'codigo', 'descricao', dm.IBTransaction, dm.QConsulta);
  if EdtNomeModelo.Text = '' then
     begin 
        AlertaCad('Modelo de Nota Fiscal não Cadastrado');
//        EdtCodModelo.SetFocus;
     end;
end;

procedure TFrmEntradas.EdtCodModeloKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsModelo.Click;
end;

procedure TFrmEntradas.BtnConsModeloClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsModelo, FrmConsModelo);
  FrmConsModelo.tag:= 2;
  FrmConsModelo.showmodal;
end;

procedure TFrmEntradas.EdtCSTExit(Sender: TObject);
begin 
  inherited;
  if not VerificaCST(trim(EdtCST.Text)) then
     begin 
        AlertaCad('CST Inválido');
//        EdtCST.SetFocus;
     end;
end;

procedure TFrmEntradas.EdtCSTEnter(Sender: TObject);
begin 
  inherited;
  EdtCST.SelectAll;
end;

procedure TFrmEntradas.BtnRecalcularClick(Sender: TObject);
var cTotalProdST       : currency;
    cAuxValorTotal     : currency;
    cAuxBaseCalculo    : currency;
    cAuxValorICMS      : currency;
    cAuxTotalDescItem  : currency;
    cAuxTotalAcresNota : currency;
    cAuxTotalAcresItem : currency;
    cAuxTotalSubTrib   : currency;
    cAuxTotalIPI       : currency;
    cCusto             : currency;
begin 
   inherited;
   if QBuscaItens.State = dsbrowse then
      begin 
         if Application.MessageBox('Confirma o Recalculo do Custo?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
            begin 
               {totalizando os produtos com sub.tributaria}
               cTotalProdST:= 0;
               with QBuscaItens do
                  begin 
                     First;
                     while not eof do
                        begin 
                           if trim(QBuscaItensTIPO_GRP.AsString) = 'ST' then
                              cTotalProdST:= cTotalProdST + (QBuscaItensQTD_PRO.AsCurrency * QBuscaItensVALOR_UNIT_PRO.AsCurrency);
                           next;
                        end;
                  end;

               {taxa da sub.tributaria}
               if (strtocurr(EdtICMSSub.Text) > 0) and (cTotalProdST > 0) then
                  cTaxaSubTrib:= (strtocurr(EdtICMSSub.Text) * 100) / cTotalProdST
               else
                  cTaxaSubTrib:= 0;

               with QBuscaItens do
                  begin 
                     First;
                     while not eof do
                        begin 
                           cAuxValorTotal       := 0;
                           cAuxBaseCalculo      := 0;
                           cAuxValorICMS        := 0;
                           cAuxTotalDescItem    := 0;
                           cAuxTotalAcresNota   := 0;
                           cAuxTotalAcresItem   := 0;
                           cAuxTotalSubTrib     := 0;
                           cAuxTotalIPI         := 0;
                           cCusto               := 0;

                           {calculando o desconto do item}
                           cAuxTotalDescItem:= QBuscaItensVALOR_DESCONTO.AsCurrency;

                           {calculando o acrescimo da nota}
                           cAuxTotalAcresNota:= ((QBuscaItensQTD_PRO.AsCurrency * QBuscaItensVALOR_UNIT_PRO.AsCurrency) *
                                                  cTaxaAcres) / 100;

                           {calculando o acrescimo do item}
                           cAuxTotalAcresItem:= QBuscaItensVALOR_ACRESCIMO.AsCurrency;

                           {calcula a Sub.Tributaria}
                           if trim(QBuscaItensTIPO_GRP.AsString) = 'ST' then
                              cAuxTotalSubTrib:= ((QBuscaItensQTD_PRO.AsCurrency * QBuscaItensVALOR_UNIT_PRO.AsCurrency) * cTaxaSubTrib) / 100;

                           {calcula o IPI}
                           cAuxTotalIPI:= ((QBuscaItensQTD_PRO.AsCurrency * QBuscaItensVALOR_UNIT_PRO.AsCurrency) * QBuscaItensPERC_IPI.AsCurrency) / 100;

                           {calculando o valor total}
                           cAuxValorTotal:= (QBuscaItensQTD_PRO.AsCurrency * QBuscaItensVALOR_UNIT_PRO.AsCurrency) -
                                             cAuxTotalDescItem + cAuxTotalAcresItem + cAuxTotalAcresNota +
                                             cAuxTotalSubTrib;

                           {calculando a base de calculo do icms}
                           if (trim(QBuscaItensTIPO_GRP.AsString) <> 'SN') and (QBuscaItensPERC_ICMS.AsCurrency > 0) then
                              begin 
                                 if QBuscaItensPERC_BCR.AsCurrency > 0 then
                                    cAuxBaseCalculo:= (((cAuxValorTotal - cAuxTotalSubTrib) * QBuscaItensPERC_BCR.AsCurrency) / QBuscaItensPERC_ICMS.AsCurrency)
                                 else
                                    cAuxBaseCalculo:= (cAuxValorTotal - cAuxTotalSubTrib);
                              end
                           else
                              cAuxBaseCalculo:= 0;

                           {calculando o valor do icms}
                           cAuxValorICMS:= ((cAuxBaseCalculo * QBuscaItensPERC_ICMS.AsCurrency) / 100);

                           {cCusto:= CalculaCusto(QBuscaItensVALOR_UNIT_PRO.AsCurrency,
                                                 QBuscaItensQTD_PRO.AsCurrency,
                                                 cAuxTotalDescItem,
                                                 cAuxTotalAcresItem,
                                                 QBuscaItensPERC_IPI.AsCurrency,
                                                 cTaxaSubTrib,
                                                 QBuscaItensVALOR_SUB_TRIBUTARIA.AsCurrency,
                                                 QBuscaItensVALOR_IPI.AsCurrency);}

                           cCusto:= CalculaCusto(QBuscaItensVALOR_UNIT_PRO.AsCurrency,
                                                 QBuscaItensQTD_PRO.AsCurrency,
                                                 cAuxTotalDescItem,
                                                 cAuxTotalAcresItem,
                                                 QBuscaItensPERC_IPI.AsCurrency,
                                                 0,
                                                 cAuxTotalSubTrib,
                                                 cAuxTotalIPI);

                           if IBTRItem.Active then
                              IBTRItem.Commit;
                           IBTRItem.StartTransaction;
                           try
                             try
                               IBSQLItem.close;
                               IBSQLItem.sql.clear;
                               IBSQLItem.sql.add('UPDATE ITENS_ENTRADA SET CUSTO = :3, PERC_ST = :4,    ' +
                                                 'VALOR_TOTAL = :5, BASE_CALCULO = :6, VALOR_ICMS = :7  ' +
                                                 'WHERE COD_ENT = :1 AND ORDEM = :2');

                               IBSQLItem.parambyname('1').AsInteger  := strtoint(edtcod.Text);
                               IBSQLItem.parambyname('2').AsInteger  := QBuscaItensORDEM.AsInteger;
                               IBSQLItem.parambyname('3').AsCurrency := cCusto;
                               if trim(QBuscaItensTIPO_GRP.AsString) = 'ST' then
                                  IBSQLItem.parambyname('4').AsCurrency:= cTaxaSubTrib
                               else
                                  IBSQLItem.parambyname('4').AsCurrency:= 0;
                               IBSQLItem.parambyname('5').AsCurrency := cAuxValorTotal;
                               IBSQLItem.parambyname('6').AsCurrency := cAuxBaseCalculo;
                               IBSQLItem.parambyname('7').AsCurrency := cAuxValorICMS;
                               IBSQLItem.ExecOrOpen;
                               IBTRItem.Commit;
                             except
                               IBTRItem.Rollback;
                                AlertaCad('Erro ao Gravar o Item, ' + #13 +
                                            'Verifique que já foi lançado');
                             end;
                           finallY
                             IBSQLItem.Close;
                           end;
                           next;
                        end;
                  end;
               BuscaItens;
            end;
      end;
end;

procedure TFrmEntradas.NxLinkLabel1Click(Sender: TObject);
begin 
  inherited;
  ShellExecute(Handle, 'open', PChar('http://www.sintegra.gov.br/'), '', '', SW_NORMAL);
end;

procedure TFrmEntradas.QItensRegistroCalcFields(DataSet: TDataSet);
begin 
  inherited;
  if QItensRegistroVALOR_IPI.AsCurrency > 0 then
     QItensRegistroCALC_VALOR_IPI.AsCurrency:= QItensRegistroVALOR_IPI.AsCurrency
  else
     QItensRegistroCALC_VALOR_IPI.AsCurrency:= QItensRegistroVALOR_PERC_IPI.AsCurrency;
end;

procedure TFrmEntradas.ImportarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('M001','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
     if PrincipalXML = nil then
       Application.CreateForm( TPrincipalXML, PrincipalXML );
  PrincipalXML.Show;
  PrincipalXML.BringToFront;
end;

procedure TFrmEntradas.EdtCodTipoEnter(Sender: TObject);
begin 
  inherited;
  EdtCodTipo.SelectAll;
end;

procedure TFrmEntradas.EdtCodTipoExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;

  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.Consulta do
         begin 
            close;
            sql.Clear;
            sql.Add('SELECT NOME_ES ' +
                    'FROM TIPO_ES ' +
                    'WHERE COD_ES = ' + EdtCodTipo.text + ' AND TIPO_ES = ' + #39 + 'E' + #39);
            ExecOrOpen;
            if recordcount > 0 then
               EdtNomeTipo.Text:= fieldbyname('nome_es').Value
            else
               begin 
                  AlertaCad('Tipo não Cadastrado');
                  EdtNomeTipo.Clear;
//  //                EdtCodTipo.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      AlertaCad('Erro ao Buscar o Tipo de Outras Saídas');
      EdtNomeTipo.Clear;
////      EdtCodTipo.SetFocus;
    end;
  finally
      DM.Consulta.Close;
  end;
end;

procedure TFrmEntradas.EdtCodTipoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
   if key = vk_f3 then
     BtnConsTipo.Click
  else
     if key = vk_f2 then
        BtnAddTipo.Click;
end;

procedure TFrmEntradas.BtnConsTipoClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsTipoES, FrmConsTipoES);
  FrmConsTipoES.tag:= 8;
  FrmConsTipoES.showmodal;
end;

procedure TFrmEntradas.BtnAddTipoClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadTipoES, True );
end;

end.




