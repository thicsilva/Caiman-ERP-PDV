unit UCTRDuplicata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Mask, Buttons, Grids, DBGrids, DB, 
  RDprint, rxToolEdit, rxCurrEdit, frxClass, frxDBSet, frxExportPDF, DBClient, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton, cxPC;

type
  TFrmCTRDuplicata = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    QParcelas: TFDQuery;
    IBTRParcelas: TFDTransaction;
    QParcelasCOD_CTR: TIntegerField;
    QParcelasVALOR_CTR: TBCDField;
    QParcelasDATA_CTR: TDateField;
    QParcelasVENCTO_CTR: TDateField;
    QParcelasPARCELA_CTR: TIntegerField;
    DSQParcelas: TDataSource;
    QParcelasNUMDOCUMENTO_CTR: TStringField;
    QParcelasSEQUENCIA_CTR: TIntegerField;
    RDprint: TRDprint;
    QParcelasCOD_VENDA: TIntegerField;
    QParcelasNOME_CLI: TStringField;
    QParcelasENDRES_CLI: TStringField;
    QParcelasBAIRES_CLI: TStringField;
    QParcelasCIDRES_CLI: TStringField;
    QParcelasCEPRES_CLI: TStringField;
    QParcelasESTRES_CLI: TStringField;
    QParcelasCNPJ_CLI: TStringField;
    QParcelasDOC_CLI: TStringField;
    QParcelasCODIGO_DUPLICATA: TIntegerField;
    QDuplicata: TFDQuery;
    QDuplicataCOD_DUPLICATA: TIntegerField;
    QParcelasCOD_CLI: TIntegerField;
    QParcelasINSC_ESTADUAL: TStringField;
    QParcelasFJ_CLI: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    PanelDoc: TPanel;
    GroupBox1: TGroupBox;
    EdtDoc: TEdit;
    BtnOK: TButton;
    BtnCancelar: TButton;
    BtnDoc: TButton;
    BtnImpressao: TButton;
    BtnSelecionar: TButton;
    BtnAltera: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    BtnConsVenda: TsSpeedButton;
    Label2: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EdtCodVenda: UNovosComponentes.TEdit;
    BtnConfirma: TButton;
    BtnSair: TButton;
    EdtData: TMaskEdit;
    EdtTotalVenda: TCurrencyEdit;
    EdtNF: TEdit;
    EdtCOO: TEdit;
    EdtNomeCli: TEdit;
    EdtNomeTPV: TEdit;
    EdtCodTPV: UNovosComponentes.TEdit;
    EdtCodCli: UNovosComponentes.TEdit;
    Label8: TLabel;
    EdtCodCTR: UNovosComponentes.TEdit;
    BtnOKCTR: TButton;
    BtnSair1: TButton;
    Label9: TLabel;
    EdtCodCliente: UNovosComponentes.TEdit;
    EdtNomeCliente: TEdit;
    Label10: TLabel;
    EdtEmissao: TMaskEdit;
    Label11: TLabel;
    EdtValor: TCurrencyEdit;
    Label12: TLabel;
    EdtVencto: TMaskEdit;
    BtnImprimir: TButton;
    BtnLancar: TButton;
    Documento: TLabel;
    EdtDocumento: TEdit;
    Label13: TLabel;
    EdtDuplicata: TEdit;
    Label14: TLabel;
    EdtSeq: UNovosComponentes.TEdit;
    Label15: TLabel;
    EdtParcela: TEdit;
    QParcelasDESCRICAO: TStringField;
    Button1: TButton;
    carnes: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    QParcelasNUMRES_CLI: TStringField;
    QParcelasVLRPAGO_CTR: TBCDField;
    QParcelasDTPAGTO_CTR: TDateField;
    frxPDFExport1: TfrxPDFExport;
    QItensVenda: TFDQuery;
    QItensVendaCOD_PRO: TIntegerField;
    QItensVendaNOME_PRO: TStringField;
    QItensVendaQUANT: TBCDField;
    QItensVendaVALOR: TBCDField;
    QParcelasFANTASIA_EMP: TStringField;
    QItensVendaTOTAL_VEN: TBCDField;
    QParcelasTOTAL_VEN: TBCDField;
    ItensVenda: TfrxDBDataset;
    CDSParcelas: TClientDataSet;
    CDSParcelasCOD_CTR: TIntegerField;
    CDSParcelasPARCELA_CTR: TIntegerField;
    CDSParcelasDATA_CTR: TDateField;
    CDSParcelasVENCTO_CTR: TDateField;
    CDSParcelasVALOR_CTR: TCurrencyField;
    CDSParcelasNUMDOCUMENTO_CTR: TStringField;
    CDSParcelasSEQUENCIA_CTR: TIntegerField;
    CDSParcelasCOD_VENDA: TIntegerField;
    CDSParcelasNOME_CLI: TStringField;
    CDSParcelasENDRES_CLI: TStringField;
    CDSParcelasBAIRES_CLI: TStringField;
    CDSParcelasCIDRES_CLI: TStringField;
    CDSParcelasCEPRES_CLI: TStringField;
    CDSParcelasESTRES_CLI: TStringField;
    CDSParcelasCNPJ_CLI: TStringField;
    CDSParcelasDOC_CLI: TStringField;
    CDSParcelasCODIGO_DUPLICATA: TStringField;
    CDSParcelasCOD_CLI: TIntegerField;
    CDSParcelasINSC_ESTADUAL: TStringField;
    CDSParcelasFJ_CLI: TStringField;
    CDSParcelasDESCRICAO: TStringField;
    CDSParcelasNUMRES_CLI: TStringField;
    CDSParcelasVLRPAGO_CTR: TCurrencyField;
    CDSParcelasDTPAGTO_CTR: TDateField;
    CDSParcelasFANTASIA_EMP: TStringField;
    CDSParcelasTOTAL_VEN: TCurrencyField;
    CDSParcelasVIA: TStringField;
    CDSParcelasCOD_AUT: TAutoIncField;
    CDSParcelasNUMERO_PARCELAS: TIntegerField;
    frxDuplicata: TfrxReport;
    Duplicata: TfrxDBDataset;
    QParcelasINSC_EMP: TStringField;
    QParcelasEND_EMP: TStringField;
    QParcelasNUMERO_EMP: TStringField;
    QParcelasBAI_EMP: TStringField;
    QParcelasCEP_EMP: TStringField;
    QParcelasTEL_EMP: TStringField;
    QParcelasEST_EMP: TStringField;
    QParcelasCNPJ_EMP: TStringField;
    QParcelasCID_EMP: TStringField;
    qDupli: TFDQuery;
    qDupliCOD_CTR: TIntegerField;
    qDupliSEQUENCIA_CTR: TIntegerField;
    qDupliVALOR_CTR: TBCDField;
    qDupliDATA_CTR: TDateField;
    qDupliVENCTO_CTR: TDateField;
    qDupliPARCELA_CTR: TIntegerField;
    qDupliCOD_CLI: TIntegerField;
    qDupliNUMDOCUMENTO_CTR: TStringField;
    qDupliCOD_VENDA: TIntegerField;
    qDupliCODIGO_DUPLICATA: TIntegerField;
    qDupliVLRPAGO_CTR: TBCDField;
    qDupliDTPAGTO_CTR: TDateField;
    qDupliNOME_CLI: TStringField;
    qDupliENDRES_CLI: TStringField;
    qDupliBAIRES_CLI: TStringField;
    qDupliCIDRES_CLI: TStringField;
    qDupliCEPRES_CLI: TStringField;
    qDupliESTRES_CLI: TStringField;
    qDupliCNPJ_CLI: TStringField;
    qDupliDOC_CLI: TStringField;
    qDupliINSC_ESTADUAL: TStringField;
    qDupliFJ_CLI: TStringField;
    qDupliNUMRES_CLI: TStringField;
    qDupliFANTASIA_EMP: TStringField;
    qDupliINSC_EMP: TStringField;
    qDupliEND_EMP: TStringField;
    qDupliNUMERO_EMP: TStringField;
    qDupliBAI_EMP: TStringField;
    qDupliCEP_EMP: TStringField;
    qDupliTEL_EMP: TStringField;
    qDupliEST_EMP: TStringField;
    qDupliCNPJ_EMP: TStringField;
    qDupliCID_EMP: TStringField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtCodVendaEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtCodVendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsVendaClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnDocClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnImpressaoClick(Sender: TObject);
    function  Quebra(const sAuxString : string) : integer;
    procedure BtnConfirmaClick(Sender: TObject);
    procedure BtnSelecionarClick(Sender: TObject);
    function BuscaParcelas : integer;
    procedure BtnAlteraClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure BtnOKCTRClick(Sender: TObject);
    procedure Limpa;
    procedure BtnLancarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmCTRDuplicata: TFrmCTRDuplicata;

implementation
uses
  Udm, Ubibli1, UConsVendas, Extensos, UAlteraParcela, UContasReceber, 
  UConsSacado, UNovoPrincipal, UPrincipal;
var  iQtdParcelas : integer;

{$R *.dfm}

function FrmCTRDuplicata: TFrmCTRDuplicata;
begin
   Result := TFrmCTRDuplicata( BuscaFormulario( TFrmCTRDuplicata, False ) );
end;

procedure TFrmCTRDuplicata.limpa;
begin 
   EdtCodCTR.Clear;
   EdtSeq.Clear;
   EdtParcela.Clear;
   EdtCodCliente.Clear;
   EdtNomeCliente.Clear;
   EdtEmissao.Clear;
   edtvencto.Clear;
   EdtDocumento.Clear;
   EdtValor.Clear;
   EdtDuplicata.Clear;
   EdtCodCTR.SetFocus;
end;

function TFrmCTRDuplicata.BuscaParcelas : integer;
begin 
   if IBTRParcelas.Active then
      IBTRParcelas.Commit;
   IBTRParcelas.StartTransaction;
   with QParcelas do
      begin 
         close;
         Parambyname('codven').AsInteger:= strtoint(EdtCodVenda.Text);
         open;
         Last;
         result:= QParcelasPARCELA_CTR.AsInteger;
         First;
      end;
   QItensVenda.Close;
   QItensVenda.ParamByName( 'codven' ).AsInteger := strtoint(EdtCodVenda.Text);
   QItensVenda.Open;
end;

procedure TFrmCTRDuplicata.Button1Click(Sender: TObject);
var
  Quant: Integer;
begin 

   QParcelas.Last;
   Qparcelas.First;
   Quant := QParcelas.RecordCount;

   if not QParcelas.IsEmpty then
      begin 
         CDSParcelas.CreateDataSet;
         CDSparcelas.Open;
         CDSParcelas.EmptyDataSet;
{         QParcelas.First;
         while not QParcelas.Eof do
            begin 
               CDSParcelas.Insert;
               CDSParcelasCOD_CTR.AsInteger := QParcelasCOD_CTR.AsInteger;
               CDSParcelasPARCELA_CTR.AsInteger := QParcelasPARCELA_CTR.AsInteger;
               CDSParcelasDATA_CTR.AsDateTime := QParcelasDATA_CTR.AsDateTime;
               CDSParcelasVENCTO_CTR.AsDateTime := QParcelasVENCTO_CTR.AsDateTime;
               CDSParcelasVALOR_CTR.AsCurrency := QParcelasVALOR_CTR.AsCurrency;
               CDSParcelasNUMDOCUMENTO_CTR.AsString := QParcelasNUMDOCUMENTO_CTR.AsString;
               CDSParcelasSEQUENCIA_CTR.AsInteger := QParcelasSEQUENCIA_CTR.AsInteger;
               CDSParcelasCOD_VENDA.AsInteger := QParcelasCOD_VENDA.AsInteger;
               CDSParcelasNOME_CLI.AsString := QParcelasNOME_CLI.AsString;
               CDSParcelasENDRES_CLI.AsString := QParcelasENDRES_CLI.AsString;
               CDSParcelasBAIRES_CLI.AsString := QParcelasBAIRES_CLI.AsString;
               CDSParcelasCIDRES_CLI.AsString := QParcelasCIDRES_CLI.AsString;
               CDSParcelasCEPRES_CLI.AsString := QParcelasCEPRES_CLI.AsString;
               CDSParcelasESTRES_CLI.AsString := QParcelasESTRES_CLI.AsString;
               CDSParcelasCNPJ_CLI.AsString := QParcelasCNPJ_CLI.AsString;
               CDSParcelasDOC_CLI.AsString := QParcelasDOC_CLI.AsString;
               CDSParcelasCODIGO_DUPLICATA.AsString := QParcelasCODIGO_DUPLICATA.AsString;
               CDSParcelasCOD_CLI.AsInteger := QParcelasCOD_CLI.AsInteger;
               CDSParcelasINSC_ESTADUAL.AsString := QParcelasINSC_ESTADUAL.AsString;
               CDSParcelasFJ_CLI.AsString := QParcelasFJ_CLI.AsString;
               CDSParcelasDESCRICAO.AsString := QParcelasDESCRICAO.AsString;
               CDSParcelasNUMRES_CLI.AsString := QParcelasNUMRES_CLI.AsString;
               CDSParcelasVLRPAGO_CTR.AsCurrency := QParcelasVLRPAGO_CTR.AsCurrency;
               CDSParcelasFANTASIA_EMP.AsString := QParcelasFANTASIA_EMP.AsString;
               CDSParcelasTOTAL_VEN.AsCurrency := QParcelasTOTAL_VEN.AsCurrency;
               CDSParcelasVIA.AsString := '2ª VIA';
               CDSParcelasNUMERO_PARCELAS.AsInteger := Quant;
               CDSParcelas.Post;
               QParcelas.Next;
            end;   }
         QParcelas.First;
         while not QParcelas.Eof do
            begin 
               CDSParcelas.Insert;
               CDSParcelasCOD_CTR.AsInteger := QParcelasCOD_CTR.AsInteger;
               CDSParcelasPARCELA_CTR.AsInteger := QParcelasPARCELA_CTR.AsInteger;
               CDSParcelasDATA_CTR.AsDateTime := QParcelasDATA_CTR.AsDateTime;
               CDSParcelasVENCTO_CTR.AsDateTime := QParcelasVENCTO_CTR.AsDateTime;
               CDSParcelasVALOR_CTR.AsCurrency := QParcelasVALOR_CTR.AsCurrency;
               CDSParcelasNUMDOCUMENTO_CTR.AsString := QParcelasNUMDOCUMENTO_CTR.AsString;
               CDSParcelasSEQUENCIA_CTR.AsInteger := QParcelasSEQUENCIA_CTR.AsInteger;
               CDSParcelasCOD_VENDA.AsInteger := QParcelasCOD_VENDA.AsInteger;
               CDSParcelasNOME_CLI.AsString := QParcelasNOME_CLI.AsString;
               CDSParcelasENDRES_CLI.AsString := QParcelasENDRES_CLI.AsString;
               CDSParcelasBAIRES_CLI.AsString := QParcelasBAIRES_CLI.AsString;
               CDSParcelasCIDRES_CLI.AsString := QParcelasCIDRES_CLI.AsString;
               CDSParcelasCEPRES_CLI.AsString := QParcelasCEPRES_CLI.AsString;
               CDSParcelasESTRES_CLI.AsString := QParcelasESTRES_CLI.AsString;
               CDSParcelasCNPJ_CLI.AsString := QParcelasCNPJ_CLI.AsString;
               CDSParcelasDOC_CLI.AsString := QParcelasDOC_CLI.AsString;
               CDSParcelasCODIGO_DUPLICATA.AsString := QParcelasCODIGO_DUPLICATA.AsString;
               CDSParcelasCOD_CLI.AsInteger := QParcelasCOD_CLI.AsInteger;
               CDSParcelasINSC_ESTADUAL.AsString := QParcelasINSC_ESTADUAL.AsString;
               CDSParcelasFJ_CLI.AsString := QParcelasFJ_CLI.AsString;
               CDSParcelasDESCRICAO.AsString := QParcelasDESCRICAO.AsString;
               CDSParcelasNUMRES_CLI.AsString := QParcelasNUMRES_CLI.AsString;
               CDSParcelasVLRPAGO_CTR.AsCurrency := QParcelasVLRPAGO_CTR.AsCurrency;
               CDSParcelasFANTASIA_EMP.AsString := QParcelasFANTASIA_EMP.AsString;
               CDSParcelasTOTAL_VEN.AsCurrency := QParcelasTOTAL_VEN.AsCurrency;
               CDSParcelasVIA.AsString := '1ª VIA';
               CDSParcelasNUMERO_PARCELAS.AsInteger := Quant;
               CDSParcelas.Post;
               QParcelas.Next;
            end;

         carnes.LoadFromFile( ExtractFilePath( Application.ExeName ) + '\Report\carne.fr3');
         carnes.PrepareReport( True );
         Carnes.ShowReport( True );
         CDSParcelas.Close;
      end;
end;

function TFrmCTRDuplicata.Quebra(const sAuxString : string) : integer;
var i : integer;
begin 
   for i:= length(sAuxString) downto 1 do
      begin 
         if sAuxString[i] = ' ' then
            begin 
               Result:= i;
               Break;
            end;
      end;
end;

procedure TFrmCTRDuplicata.BtnSairClick(Sender: TObject);
begin 
   if Parent is TcxTabSheet then
      frmMenu.FTDI.CloseTabOfForm( TFormClass( Self.ClassType ) )
   else
      close;
end;

procedure TFrmCTRDuplicata.FormShow(Sender: TObject);
begin 
   PageControl1.ActivePageIndex:= 0;
   PanelDoc.Visible:= false;
   Limpaedit(FrmCTRDuplicata);
   EdtCodVenda.SetFocus;
end;

procedure TFrmCTRDuplicata.EdtCodVendaEnter(Sender: TObject);
begin 
   EdtCodVenda.SelectAll;
end;

procedure TFrmCTRDuplicata.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmCTRDuplicata.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      begin 
         if PanelDoc.Visible then
            PanelDoc.Visible:= false
         else
            close;
      end;
end;

procedure TFrmCTRDuplicata.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if IBTRParcelas.Active then
      IBTRParcelas.Commit;
   QParcelas.Close;
   Action:= caFree;
end;

procedure TFrmCTRDuplicata.EdtCodVendaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsVenda.Click;
end;

procedure TFrmCTRDuplicata.BtnConsVendaClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsVendas, FrmConsVendas);
   FrmConsVendas.Tag:= 3;
   FrmConsVendas.showmodal;
end;

procedure TFrmCTRDuplicata.BtnOKClick(Sender: TObject);
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
             sql.add('UPDATE CONTAS_RECEBER SET NUMDOCUMENTO_CTR = :DOC ' +
                     'WHERE COD_CTR = :CODCTR AND SEQUENCIA_CTR = :SEQ');
             if EdtDoc.Text = '' then
                Parambyname('doc').value:= null
             else
                Parambyname('doc').AsString:= trim(EdtDoc.Text);
             Parambyname('codctr').AsInteger:= QParcelasCOD_CTR.AsInteger;
             Parambyname('seq').AsInteger   := QParcelasSEQUENCIA_CTR.AsInteger;
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao gravar o número do documento na parcela');
     end;
   finally
     dm.Consulta.Close;
     BtnConfirma.Click;
     DBGrid1.SetFocus;
     PanelDoc.Visible:= false;
   end;
end;

procedure TFrmCTRDuplicata.BtnDocClick(Sender: TObject);
begin 
   PanelDoc.Visible:= true;
   EdtDoc.Text:= QParcelasNUMDOCUMENTO_CTR.AsString;
   EdtDoc.SetFocus;
end;

procedure TFrmCTRDuplicata.BtnCancelarClick(Sender: TObject);
begin 
   DBGrid1.SetFocus;
   PanelDoc.Visible:= false;
end;

procedure TFrmCTRDuplicata.BtnImpressaoClick(Sender: TObject);
var iAuxQuebra : integer;
    sAuxExtenso, Parcelas : string;
    i : integer;
    iDuplicata : integer;
    RelFile: String;
begin
   { verifica se tem parcela selecionada }
   i:= 0;
   with QParcelas do
      begin 
         First;
         while not Eof do
            begin 
               if DBGrid1.SelectedRows.CurrentRowSelected then
                 begin
                   if Parcelas = '' then
                     Parcelas := QParcelasCOD_CTR.AsString
                   else
                     Parcelas := Parcelas + ', '+ QParcelasCOD_CTR.AsString;
                   inc(i);
                 end;
               next;
            end;
      end;

   if i = 0 then
      begin 
         AlertaCad('Nenhuma parcela selecionada');
         exit;
      end;


   with qDupli do
      begin
         close;
         sql.Clear;
         sql.Text:= 'SELECT R.COD_CTR, R.SEQUENCIA_CTR, R.VALOR_CTR, R.DATA_CTR, R.VENCTO_CTR, R.PARCELA_CTR, R.COD_CLI,  '+
                    '       R.NUMDOCUMENTO_CTR, R.COD_VENDA, R.CODIGO_DUPLICATA, R.vlrpago_ctr, R.dtpagto_ctr,  '+
                    '       C.NOME_CLI, C.ENDRES_CLI, C.BAIRES_CLI, C.CIDRES_CLI, C.CEPRES_CLI, C.ESTRES_CLI, C.CNPJ_CLI,  '+
                    '       C.DOC_CLI, C.INSC_ESTADUAL, C.FJ_CLI, C.numres_cli,  '+
                    '       E.fantasia_emp, e.insc_emp, e.end_emp, e.numero_emp, e.bai_emp, e.cep_emp, e.tel_emp, E.est_emp,  '+
                    '       e.cnpj_emp, e.cid_emp  '+
                    '  FROM CONTAS_RECEBER R   '+
                    '       INNER JOIN CLIENTE C  '+
                    '       ON (R.COD_CLI = C.COD_CLI)   '+
                    '       INNER JOIN EMPRESA E   '+
                    '       on ( E.cod_emp = R.cod_emp )  '+
                    ' WHERE R.COD_CTR in('+Parcelas+')'+
                    ' ORDER BY R.COD_CTR ';
         open;
      end;

   RelFile := ExtractFilePath( Application.ExeName ) + 'Report\Duplicata.fr3';
   if not FileExists( RelFile ) then
      begin
         AlertaCad( 'Arquivo Duplicata.fr3 não encontrado!' );
         Exit;
      end;
   frxDuplicata.LoadFromFile( RelFile );

   frxDuplicata.Variables['valorextenso'] :=QuotedStr( Extenso(qDupli.FieldByName('VALOR_CTR').AsCurrency));

   frxDuplicata.ShowReport( true );;



   {RDprint.Abrir;
   QParcelas.First;
   while not QParcelas.Eof do
      begin
         if DBGrid1.SelectedRows.CurrentRowSelected then
            begin
               iDuplicata:= 0;

               if QParcelasCODIGO_DUPLICATA.IsNull then
                  begin
                     if dm.IBTransaction.Active then
                        dm.IBTransaction.Commit;
                     dm.IBTransaction.StartTransaction;
                     try
                       try
                         QDuplicata.Close;
                         QDuplicata.ParamByName('cod').AsInteger:= QParcelasCOD_CTR.AsInteger;
                         QDuplicata.ParamByName('seq').AsInteger:= QParcelasSEQUENCIA_CTR.AsInteger;
                         QDuplicata.Open;
                         iDuplicata:= QDuplicataCOD_DUPLICATA.AsInteger;
                         dm.IBTransaction.Commit;
                       except
                          dm.IBTransaction.Rollback;
                          iDuplicata:= 0;
                          AlertaCad('erro incluindo número da duplicata');
                       end;
                     finally
                       QDuplicata.Close;
                     end;
                  end
               else
                  iDuplicata:= QParcelasCODIGO_DUPLICATA.AsInteger;

               RDprint.Imp(8, 71, QParcelasDATA_CTR.AsString);

               rdprint.ImpVal(13, 25,'#,###,##0.00', strtocurr(EdtTotalVenda.text), []);

               if trim(EdtNF.Text) <> '' then
                  RDprint.Imp(13, 45, 'NF-' + FormataStringD(trim(EdtNF.Text), '6', '0') + '-' + QParcelasPARCELA_CTR.AsString + '/' + inttostr(iQtdParcelas))
               else
               if trim(EdtCOO.Text) <> '' then
                  RDprint.Imp(13, 45, 'C-' + FormataStringD(trim(EdtCOO.Text), '6', '0') + '-' + QParcelasPARCELA_CTR.AsString + '/' + inttostr(iQtdParcelas));

               rdprint.ImpVal(13, 68,'#,###,##0.00', QParcelasVALOR_CTR.AsCurrency, []);
               RDprint.Imp(13, 87, FormataStringD(IntToStr(iDuplicata), '6', '0'));
               RDprint.Imp(13, 100, QParcelasVENCTO_CTR.AsString);

               RDprint.Imp(18, 36,  QParcelasCOD_CLI.AsString    + '-'   + QParcelasNOME_CLI.AsString);
               RDprint.Imp(20, 36,  QParcelasENDRES_CLI.AsString + ' - ' + QParcelasBAIRES_CLI.AsString);
               RDprint.Imp(21, 36,  QParcelasCIDRES_CLI.AsString);
               RDprint.Imp(21, 83,  QParcelasCEPRES_CLI.AsString);
               RDprint.Imp(21, 108, QParcelasESTRES_CLI.AsString);
               RDprint.Imp(22, 36,  QParcelasCIDRES_CLI.AsString);
               RDprint.Imp(24, 36,  QParcelasCNPJ_CLI.AsString);

               if trim(QParcelasFJ_CLI.AsString) = 'J' then
                  RDprint.Imp(24, 83, QParcelasINSC_ESTADUAL.AsString);

               sAuxExtenso:= Extenso(QParcelasVALOR_CTR.AsCurrency);
               if length(sAuxExtenso) > 73 then
                  begin
                     iAuxQuebra := Quebra(copy(sAuxExtenso, 1, 73));
                     RDprint.Imp(26, 32, copy(sAuxExtenso, 1, iAuxQuebra));
                     RDprint.Imp(27, 32, copy(sAuxExtenso, iAuxQuebra + 1, length(sAuxExtenso)));
                  end
               else
                  RDprint.Imp(26, 32, sAuxExtenso);
               RDprint.Novapagina;
            end;
         QParcelas.Next;
      end;
   RDprint.Fechar; }
   BuscaParcelas;
end;

procedure TFrmCTRDuplicata.BtnConfirmaClick(Sender: TObject);
var bAux : boolean;
begin 
   if EdtCodVenda.Text = '' then
      begin 
         AlertaCad('Digite o código da venda');
//         EdtCodVenda.SetFocus;
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
             sql.add('SELECT V.COD_VEN, V.DATA_VEN, V.TOTAL_VEN, V.COD_CLI,  ' +
                     'V.COD_TPV, V.CUPOM_FISCAL_VEN, C.NOME_CLI, T.NOME_TPV, ' +
                     'N.NUMERO_NOTA_NF ' +
                     'FROM VENDAS V    ' +
                     'INNER JOIN CLIENTE C ' +
                     'ON (V.COD_CLI = C.COD_CLI) ' +
                     'INNER JOIN TIPO_VENDA T ' +
                     'ON (V.COD_TPV = T.COD_TPV) ' +
                     'LEFT OUTER JOIN NOTA_FISCAL N ' +
                     'ON (V.COD_NF = N.COD_NF) ' + 
                     'WHERE V.COD_VEN = :CODVEN');
             Parambyname('codven').AsInteger:= strtoint(EdtCodVenda.Text);
             open;
             if fieldbyname('cod_ven').IsNull then
                begin 
                   bAux:= false;
                   Limpaedit(FrmCTRDuplicata);
                   AlertaCad('Venda não encontrada');
                   BtnSelecionar.Enabled := false;
                   BtnDoc.Enabled        := false;
                   BtnImpressao.Enabled  := false;
//                   EdtCodVenda.SetFocus;
                end
             else
                begin 
                   bAux:= true;
                   EdtData.Text      := fieldbyname('data_ven').AsString;
                   EdtTotalVenda.Text:= fieldbyname('total_ven').AsString;
                   EdtCodCli.Text    := fieldbyname('cod_cli').AsString;
                   EdtNomeCli.Text   := fieldbyname('nome_cli').AsString;
                   EdtCodTPV.Text    := fieldbyname('cod_tpv').AsString;
                   EdtNomeTPV.Text   := fieldbyname('nome_tpv').AsString;
                   EdtNF.Text        := fieldbyname('numero_nota_nf').AsString;

                   if FieldByName('cupom_fiscal_ven').AsInteger > 0 then
                      EdtCOO.Text:= fieldbyname('cupom_fiscal_ven').AsString
                   else
                      EdtCOO.Clear;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar os dados da venda');
     end;
   finally
     dm.QConsulta.Close;
   end;

   if bAux then
      begin 
         iQtdParcelas:= BuscaParcelas;
         DBGrid1.SetFocus;
      end;

   if iQtdParcelas > 0 then
      begin 
         BtnSelecionar.Enabled := true;
         BtnDoc.Enabled        := true;
         BtnImpressao.Enabled  := true;
         BtnAltera.Enabled     := true;
      end
   else
      begin 
         BtnSelecionar.Enabled := false;
         BtnDoc.Enabled        := false;
         BtnImpressao.Enabled  := false;
         BtnAltera.Enabled     := false;
      end;
end;

procedure TFrmCTRDuplicata.BtnSelecionarClick(Sender: TObject);
begin 
   QParcelas.First;
   while not QParcelas.EOF do
       begin 
          DBGrid1.SelectedRows.CurrentRowSelected := true;
          QParcelas.Next;
       end;
   QParcelas.First;
end;

procedure TFrmCTRDuplicata.BtnAlteraClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmAlteraParcela, FrmAlteraParcela);
   FrmAlteraParcela.Tag:= 1;
   FrmAlteraParcela.EdtCod.Text       := QParcelasCOD_CTR.AsString;
   FrmAlteraParcela.EdtSeq.Text       := QParcelasSEQUENCIA_CTR.AsString;
   FrmAlteraParcela.EdtDataEmi.Text   := QParcelasDATA_CTR.AsString;
   FrmAlteraParcela.EdtDataVen.Text   := QParcelasVENCTO_CTR.AsString;
   FrmAlteraParcela.EdtValor.Text     := QParcelasVALOR_CTR.AsString;
   FrmAlteraParcela.EdtParc.Text      := QParcelasPARCELA_CTR.AsString;
   FrmAlteraParcela.showmodal;
end;

procedure TFrmCTRDuplicata.BtnImprimirClick(Sender: TObject);
var sAuxExtenso, RelFile : string;
    iAuxQuebra  : integer;
begin
   if trim(EdtCodCTR.Text) = '' then
      exit;

   if trim(EdtSeq.Text) = '' then
      exit;

   with qDupli do
      begin
         close;
         sql.Clear;
         sql.Text:= 'SELECT R.COD_CTR, R.SEQUENCIA_CTR, R.VALOR_CTR, R.DATA_CTR, R.VENCTO_CTR, R.PARCELA_CTR, R.COD_CLI,  '+
                    '       R.NUMDOCUMENTO_CTR, R.COD_VENDA, R.CODIGO_DUPLICATA, R.vlrpago_ctr, R.dtpagto_ctr,  '+
                    '       C.NOME_CLI, C.ENDRES_CLI, C.BAIRES_CLI, C.CIDRES_CLI, C.CEPRES_CLI, C.ESTRES_CLI, C.CNPJ_CLI,  '+
                    '       C.DOC_CLI, C.INSC_ESTADUAL, C.FJ_CLI, C.numres_cli,  '+
                    '       E.fantasia_emp, e.insc_emp, e.end_emp, e.numero_emp, e.bai_emp, e.cep_emp, e.tel_emp, E.est_emp,  '+
                    '       e.cnpj_emp, e.cid_emp  '+
                    '  FROM CONTAS_RECEBER R   '+
                    '       INNER JOIN CLIENTE C  '+
                    '       ON (R.COD_CLI = C.COD_CLI)   '+
                    '       INNER JOIN EMPRESA E   '+
                    '       on ( E.cod_emp = R.cod_emp )  '+
                    ' WHERE R.COD_CTR =  '+EdtCodCTR.Text +
                    '   and R.SEQUENCIA_CTR = '+EdtSeq.Text +
                    ' ORDER BY R.COD_CTR ';
         open;
      end;

   RelFile := ExtractFilePath( Application.ExeName ) + 'Report\Duplicata.fr3';
   if not FileExists( RelFile ) then
      begin
         AlertaCad( 'Arquivo Duplicata.fr3 não encontrado!' );
         Exit;
      end;
   frxDuplicata.LoadFromFile( RelFile );

   frxDuplicata.Variables['valorextenso'] :=QuotedStr( Extenso(qDupli.FieldByName('VALOR_CTR').AsCurrency));

   frxDuplicata.ShowReport( true );



   {RDprint.Abrir;

   if trim(EdtDuplicata.Text) = '' then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         try
           try
             QDuplicata.Close;
             QDuplicata.ParamByName('cod').AsInteger:= strtoint(EdtCodCTR.Text);
             QDuplicata.ParamByName('seq').AsInteger:= strtoint(EdtSeq.Text);
             QDuplicata.Open;
             EdtDuplicata.Text:= QDuplicataCOD_DUPLICATA.AsString;
             dm.IBTransaction.Commit;
           except
              dm.IBTransaction.Rollback;
              EdtDuplicata.Clear;
              AlertaCad('erro incluindo número da duplicata');
           end;
         finally
           QDuplicata.Close;
         end;
      end;


     RDprint.Imp(8, 71, EdtEmissao.Text);

     rdprint.ImpVal(13, 25,'#,###,##0.00', strtocurr(EdtValor.text), []);

     RDprint.Imp(13, 45, EdtDocumento.Text);

     rdprint.ImpVal(13, 68,'#,###,##0.00', strtocurr(EdtValor.Text), []);
     RDprint.Imp(13, 87, FormataStringD(EdtDuplicata.Text, '6', '0'));
     RDprint.Imp(13, 100, EdtVencto.Text);

     RDprint.Imp(18, 36, EdtCodCliente.Text + '-' + EdtNomeCliente.Text);


     if dm.IBTransaction.Active then
        dm.IBTransaction.Commit;
     dm.IBTransaction.StartTransaction;
     with dm.QConsulta do
        begin
           close;
           sql.Clear;
           sql.Text:= 'SELECT ENDRES_CLI, CIDRES_CLI, CEPRES_CLI, ' +
                      'ESTRES_CLI, BAIRES_CLI, CNPJ_CLI, FJ_CLI,  ' +
                      'INSC_ESTADUAL ' +
                      'FROM CLIENTE ' +
                      'WHERE COD_CLI = :CODCLI';
           Parambyname('codcli').AsInteger:= strtoint(EdtCodCliente.Text);
           open;

           RDprint.Imp(20, 36,  dm.QConsulta.fieldbyname('ENDRES_CLI').AsString + ' - ' + dm.QConsulta.fieldbyname('BAIRES_CLI').AsString);
           RDprint.Imp(21, 36,  dm.QConsulta.fieldbyname('CIDRES_CLI').AsString);
           RDprint.Imp(21, 83,  dm.QConsulta.fieldbyname('CEPRES_CLI').AsString);
           RDprint.Imp(21, 108, dm.QConsulta.fieldbyname('ESTRES_CLI').AsString);
           RDprint.Imp(22, 36,  dm.QConsulta.fieldbyname('CIDRES_CLI').AsString);
           RDprint.Imp(24, 36,  dm.QConsulta.fieldbyname('CNPJ_CLI').AsString);

          if trim(dm.QConsulta.fieldbyname('FJ_CLI').AsString) = 'J' then
             RDprint.Imp(24, 83, dm.QConsulta.fieldbyname('INSC_ESTADUAL').AsString);
        end;
     dm.IBTransaction.Commit;
     dm.QConsulta.close;

     sAuxExtenso:= Extenso(strtocurr(EdtValor.Text));

     if length(sAuxExtenso) > 73 then
        begin 
           iAuxQuebra := Quebra(copy(sAuxExtenso, 1, 73));
           RDprint.Imp(26, 32, copy(sAuxExtenso, 1, iAuxQuebra));
           RDprint.Imp(27, 32, copy(sAuxExtenso, iAuxQuebra + 1, length(sAuxExtenso)));
        end
     else
        RDprint.Imp(26, 32, sAuxExtenso);

   RDprint.Fechar;  }
end;

procedure TFrmCTRDuplicata.BtnOKCTRClick(Sender: TObject);
begin 
   if trim(EdtCodCTR.Text) = '' then
      exit;

   if trim(EdtSeq.Text) = '' then
      exit;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Text:= 'SELECT R.COD_CTR, R.COD_CLI, R.SEQUENCIA_CTR, R.DATA_CTR, R.VENCTO_CTR, ' +
                        'R.PARCELA_CTR, R.NUMDOCUMENTO_CTR, R.CODIGO_DUPLICATA, R.VALOR_CTR,     ' +
                        'C.NOME_CLI, C.CNPJ_CLI, C.INSC_ESTADUAL ' +
                        'FROM CONTAS_RECEBER R ' +
                        'INNER JOIN CLIENTE C ' +
                        'ON (R.COD_CLI = C.COD_CLI) ' +
                        'WHERE R.COD_CTR = :CODCTR AND R.SEQUENCIA_CTR = :SEQ';
             Parambyname('codctr').AsInteger := strtoint(EdtCodCTR.Text);
             Parambyname('seq').AsInteger    := strtoint(EdtSeq.Text);
             open;

             if not fieldbyname('cod_ctr').IsNull then
                begin 
                   EdtParcela.Text      := fieldbyname('parcela_ctr').AsString;
                   EdtCodCliente.Text   := fieldbyname('cod_cli').AsString;
                   EdtNomeCliente.Text  := fieldbyname('nome_cli').AsString;
                   EdtEmissao.Text      := fieldbyname('data_ctr').AsString;
                   EdtVencto.Text       := fieldbyname('vencto_ctr').AsString;
                   EdtDocumento.Text    := fieldbyname('numdocumento_ctr').AsString;
                   EdtValor.Text        := fieldbyname('valor_ctr').AsString;
                   EdtDuplicata.Text    := fieldbyname('codigo_duplicata').AsString;
                end
             else
                limpa;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar o lançamento');
     end;
   finally
     dm.QConsulta.close;
   end;
end;

procedure TFrmCTRDuplicata.BtnLancarClick(Sender: TObject);
begin 
   BuscaFormulario( TFrmLancContasReceber, True );
end;

end.
