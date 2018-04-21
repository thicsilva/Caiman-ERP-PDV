unit UDuplicataADM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Mask, Buttons, StdCtrls, Grids, DBGrids, ExtCtrls, ComCtrls, DB, 
  RDprint, rxToolEdit, rxCurrEdit, UNovosComponentes, UNovoFormulario, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton, cxPC;

type
  TFrmDuplicataADM = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
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
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BtnConsVenda: TsSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    EdtCodVenda: UNovosComponentes.TEdit;
    EdtData: TMaskEdit;
    EdtTotalVenda: TCurrencyEdit;
    EdtCodCli: UNovosComponentes.TEdit;
    EdtNomeCli: TEdit;
    EdtNF: TEdit;
    BtnConfirma: TButton;
    BtnSair: TButton;
    EdtCOO: TEdit;
    RDprint: TRDprint;
    QDuplicata: TFDQuery;
    QDuplicataCOD_DUPLICATA: TIntegerField;
    QParcelas: TFDQuery;
    DSQParcelas: TDataSource;
    IBTRParcelas: TFDTransaction;
    QParcelasCODIGO: TIntegerField;
    QParcelasVALOR: TBCDField;
    QParcelasEMISSAO: TDateField;
    QParcelasVENCIMENTO: TDateField;
    QParcelasCOD_CLI: TIntegerField;
    QParcelasDOCUMENTO: TStringField;
    QParcelasCOD_VEN: TIntegerField;
    QParcelasCODIGO_DUPLICATA: TIntegerField;
    QParcelasNOME_CLI: TStringField;
    QParcelasENDRES_CLI: TStringField;
    QParcelasBAIRES_CLI: TStringField;
    QParcelasCIDRES_CLI: TStringField;
    QParcelasCEPRES_CLI: TStringField;
    QParcelasESTRES_CLI: TStringField;
    QParcelasCNPJ_CLI: TStringField;
    QParcelasDOC_CLI: TStringField;
    QParcelasINSC_ESTADUAL: TStringField;
    QParcelasFJ_CLI: TStringField;
    QParcelasDESCRICAO: TStringField;
    QParcelasPARCELA: TIntegerField;
    BtnAltera: TButton;
    function BuscaParcelas : integer;
    function Quebra(const sAuxString : string) : integer;
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
    procedure BtnConfirmaClick(Sender: TObject);
    procedure BtnDocClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnImpressaoClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnSelecionarClick(Sender: TObject);
    procedure BtnAlteraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function FrmDuplicataADM: TFrmDuplicataADM;

implementation
uses
  Udm, Ubibli1, UConsVendas, Extensos, UAlteraParcelaCTR, UNovoPrincipal;
var  iQtdParcelas : integer;

{$R *.dfm}

  function FrmDuplicataADM: TFrmDuplicataADM;
  begin
     Result := TFrmDuplicataADM( BuscaFormulario( TFrmDuplicataADM, False ) );
  end;

function TFrmDuplicataADM.BuscaParcelas : integer;
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
         result:= RecordCount;
         First;
      end;
end;

function TFrmDuplicataADM.Quebra(const sAuxString : string) : integer;
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

procedure TFrmDuplicataADM.BtnSairClick(Sender: TObject);
begin 
   if Parent is TcxTabSheet then
      frmMenu.FTDI.CloseTabOfForm( TFormClass( Self.ClassType ) )
   else
      close;
end;

procedure TFrmDuplicataADM.FormShow(Sender: TObject);
begin 
   PanelDoc.Visible:= false;
   Limpaedit(FrmDuplicataADM);
   EdtCodVenda.SetFocus;
end;

procedure TFrmDuplicataADM.EdtCodVendaEnter(Sender: TObject);
begin 
   EdtCodVenda.SelectAll;
end;

procedure TFrmDuplicataADM.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmDuplicataADM.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmDuplicataADM.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if IBTRParcelas.Active then
      IBTRParcelas.Commit;
   QParcelas.Close;
   Action:= caFree;
end;

procedure TFrmDuplicataADM.EdtCodVendaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsVenda.Click;
end;

procedure TFrmDuplicataADM.BtnConsVendaClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsVendas, FrmConsVendas);
   FrmConsVendas.Tag:= 4;
   FrmConsVendas.showmodal;
end;

procedure TFrmDuplicataADM.BtnConfirmaClick(Sender: TObject);
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
                     'V.CUPOM_FISCAL_VEN, C.NOME_CLI, N.NUMERO_NOTA_NF ' +
                     'FROM VENDAS V    ' +
                     'INNER JOIN CLIENTE C ' +
                     'ON (V.COD_CLI = C.COD_CLI) ' +
                     'LEFT OUTER JOIN NOTA_FISCAL N ' +
                     'ON (V.COD_NF = N.COD_NF) ' +
                     'WHERE V.COD_VEN = :CODVEN');
             Parambyname('codven').AsInteger:= strtoint(EdtCodVenda.Text);
             open;
             if fieldbyname('cod_ven').IsNull then
                begin 
                   bAux:= false;
                   Limpaedit(FrmDuplicataADM);
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

procedure TFrmDuplicataADM.BtnDocClick(Sender: TObject);
begin 
   PanelDoc.Visible:= true;
   EdtDoc.Text:= QParcelasDOCUMENTO.AsString;
   EdtDoc.SetFocus;
end;

procedure TFrmDuplicataADM.BtnCancelarClick(Sender: TObject);
begin 
   DBGrid1.SetFocus;
   PanelDoc.Visible:= false;
end;

procedure TFrmDuplicataADM.BtnImpressaoClick(Sender: TObject);
var iAuxQuebra : integer;
    sAuxExtenso : string;
    i : integer;
    iDuplicata : integer;
begin 
   { verifica se tem parcela selecionada }
   i:= 0;
   with QParcelas do
      begin 
         First;
         while not Eof do
            begin 
               if DBGrid1.SelectedRows.CurrentRowSelected then
                  inc(i);
               next;
            end;
      end;

   if i = 0 then
      begin 
         AlertaCad('Nenhuma parcela selecionada');
         exit;
      end;

   RDprint.Abrir;
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
                         QDuplicata.ParamByName('codigo').AsInteger:= QParcelasCODIGO.AsInteger;
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

               RDprint.Imp(8, 71, QParcelasEMISSAO.AsString);

               rdprint.ImpVal(13, 25,'#,###,##0.00', strtocurr(EdtTotalVenda.text), []);

               RDprint.Imp(13, 45, QParcelasDOCUMENTO.AsString + '-' + QParcelasPARCELA.AsString + '/' + inttostr(iQtdParcelas) + '-C');

               rdprint.ImpVal(13, 68,'#,###,##0.00', QParcelasVALOR.AsCurrency, []);
               RDprint.Imp(13, 87, FormataStringD(IntToStr(iDuplicata), '6', '0'));
               RDprint.Imp(13, 100, QParcelasVENCIMENTO.AsString);

               RDprint.Imp(18, 36, QParcelasCOD_CLI.AsString + '-' + QParcelasNOME_CLI.AsString);
               RDprint.Imp(20, 36, QParcelasENDRES_CLI.AsString + ' - ' + QParcelasBAIRES_CLI.AsString);
               RDprint.Imp(21, 36, QParcelasCIDRES_CLI.AsString);
               RDprint.Imp(21, 83, QParcelasCEPRES_CLI.AsString);
               RDprint.Imp(21, 108, QParcelasESTRES_CLI.AsString);
               RDprint.Imp(22, 36, QParcelasCIDRES_CLI.AsString);
               RDprint.Imp(24, 36, QParcelasCNPJ_CLI.AsString);

               if trim(QParcelasFJ_CLI.AsString) = 'J' then
                  RDprint.Imp(24, 83, QParcelasINSC_ESTADUAL.AsString);

               sAuxExtenso:= Extenso(QParcelasVALOR.AsCurrency);
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
   RDprint.Fechar;
   BuscaParcelas;
end;

procedure TFrmDuplicataADM.BtnOKClick(Sender: TObject);
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
             sql.add('UPDATE CONTAS_RECEBER_ADM_CARTAO SET DOCUMENTO = :DOC ' +
                     'WHERE CODIGO = :CODIGO');
             if trim(EdtDoc.Text) = '' then
                Parambyname('doc').value:= null
             else
                Parambyname('doc').AsString  := trim(EdtDoc.Text);
             Parambyname('codigo').AsInteger := QParcelasCODIGO.AsInteger;
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

procedure TFrmDuplicataADM.BtnSelecionarClick(Sender: TObject);
begin 
    QParcelas.First;
   while not QParcelas.EOF do
       begin 
          DBGrid1.SelectedRows.CurrentRowSelected := true;
          QParcelas.Next;
       end;
   QParcelas.First;
end;

procedure TFrmDuplicataADM.BtnAlteraClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmAlteraParcelaADM, FrmAlteraParcelaADM);
   FrmAlteraParcelaADM.tag:= 1;
   FrmAlteraParcelaADM.EdtDataEmi.Text  := QParcelasEMISSAO.AsString;
   FrmAlteraParcelaADM.EdtDataVen.Text  := QParcelasVENCIMENTO.AsString;
   FrmAlteraParcelaADM.EdtCod.Text      := QParcelasCODIGO.AsString;
   FrmAlteraParcelaADM.EdtValor.Text    := QParcelasVALOR.AsString;

   FrmAlteraParcelaADM.showmodal;
end;

end.

