unit UConsVendaCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Mask, Grids, DBGrids, DB, Buttons, 
  RDprint, rxToolEdit, rxCurrEdit, UNovosComponentes, UNovoFormulario, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmConsVendaCaixa = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    PageControl: TPageControl;
    Vista: TTabSheet;
    TabSheet6: TTabSheet;
    DBGridVendas: TDBGrid;
    DBGrid6: TDBGrid;
    DSQVendas: TDataSource;
    QTotalFormas: TFDQuery;
    QTotalRec: TFDQuery;
    QVendas: TFDQuery;
    QRec: TFDQuery;
    DSQRec: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    EdtDataIni: TMaskEdit;
    EdtDataFin: TMaskEdit;
    EdtHoraIni: TMaskEdit;
    EdtHoraFin: TMaskEdit;
    CheckHora: TCheckBox;
    ComboCaixa: TComboBox;
    BtnOK: TBitBtn;
    BitBtn1: TBitBtn;
    Panel4: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    EdtRecebimento: TCurrencyEdit;
    EdtTotalVendas: TCurrencyEdit;
    EdtTotal: TCurrencyEdit;
    BtnItens: TButton;
    QVendasDesc: TFDQuery;
    DSVendasDesc: TDataSource;
    TabSheet7: TTabSheet;
    DBGrid8: TDBGrid;
    BtnSegundaVia: TButton;
    QRecCOD_CTR: TIntegerField;
    QRecSEQUENCIA_CTR: TIntegerField;
    QRecCOD_EMP: TIntegerField;
    QRecDATA_CTR: TDateField;
    QRecCOD_VENDA: TIntegerField;
    QRecCOD_CLI: TIntegerField;
    QRecVENCTO_CTR: TDateField;
    QRecVALOR_CTR: TBCDField;
    QRecDTPAGTO_CTR: TDateField;
    QRecVLRPAGO_CTR: TBCDField;
    QRecACRESCIMO_CTR: TBCDField;
    QRecDESCONTO_CTR: TBCDField;
    QRecNUMDOCUMENTO_CTR: TStringField;
    QRecOBS_CTR: TStringField;
    QRecACRESCIMO_RECEBIDO_CTR: TBCDField;
    QRecDESCONTO_CONCEDIDO_CTR: TBCDField;
    QRecCOD_CAI: TIntegerField;
    QRecCOD_COB: TIntegerField;
    QRecCAIXA_EMISSAO_CTR: TIntegerField;
    QRecPARCELA_CTR: TIntegerField;
    QRecDEVOLUCAO_CTR: TBCDField;
    QRecNOME_CLI: TStringField;
    QVendasDescBRUTO: TBCDField;
    QVendasDescDESCONTO_VEN: TBCDField;
    QVendasDescTAXA: TBCDField;
    QVendasDescCOD_VEN: TIntegerField;
    QVendasDescDATA_VEN: TDateField;
    QVendasDescCOD_CAI: TIntegerField;
    QVendasDescCOD_EMP: TIntegerField;
    QVendasDescTOTAL_VEN: TBCDField;
    QVendasDescHORA: TTimeField;
    QVendasDescNOME_CLI: TStringField;
    QBuscaItens: TFDQuery;
    BtnImp: TBitBtn;
    QVendasExc: TFDQuery;
    DSVendasExc: TDataSource;
    QVendasExcCOD_VEN: TIntegerField;
    QVendasExcDATA_VEN: TDateField;
    QVendasExcCOD_CAI: TIntegerField;
    QVendasExcCOD_EMP: TIntegerField;
    QVendasExcTOTAL_VEN: TBCDField;
    QVendasExcDESCONTO_VEN: TBCDField;
    QVendasExcHORA: TTimeField;
    QVendasExcNOME_CLI: TStringField;
    TabSheet8: TTabSheet;
    DBGrid9: TDBGrid;
    TabSheet9: TTabSheet;
    DBGrid10: TDBGrid;
    QItensExcluidos: TFDQuery;
    DSItensExcluidos: TDataSource;
    QItensExcluidosCOD_VEN: TIntegerField;
    QItensExcluidosCOD_PRO: TIntegerField;
    QItensExcluidosORDEM: TIntegerField;
    QItensExcluidosDESCONTO: TBCDField;
    QItensExcluidosCOD_EMP: TIntegerField;
    QItensExcluidosQUANT: TBCDField;
    QItensExcluidosVALOR: TBCDField;
    QItensExcluidosNOME_PRO: TStringField;
    QItensExcluidosTOTAL: TCurrencyField;
    QItensExcluidosCOD_CAI: TIntegerField;
    QItensExcluidosDATA_HORA_VEN: TSQLTimeStampField;
    QItensExcluidosDATA_VEN: TDateField;
    Label18: TLabel;
    ComboOperador: TComboBox;
    QVendasDescNOME_USU: TStringField;
    QVendasExcNOME_USU: TStringField;
    QItensExcluidosNOME_USU: TStringField;
    RDprint: TRDprint;
    QBuscaItensCOD_VEN: TIntegerField;
    QBuscaItensCOD_PRO: TIntegerField;
    QBuscaItensORDEM: TIntegerField;
    QBuscaItensDESCONTO: TBCDField;
    QBuscaItensCOD_EMP: TIntegerField;
    QBuscaItensQUANT: TBCDField;
    QBuscaItensVALOR: TBCDField;
    QBuscaItensVALOR_CUSTO: TBCDField;
    QBuscaItensPRODUTO_PROMOCAO: TStringField;
    QBuscaItensTOTAL: TFloatField;
    QBuscaItensNOME_PRO: TStringField;
    QBuscaItensCALC_TOTAL: TCurrencyField;
    QCheques: TFDQuery;
    DSCheques: TDataSource;
    QChequesCOD_CHE: TIntegerField;
    QChequesAGENCIA_CHE: TStringField;
    QChequesCONTA_CHE: TStringField;
    QChequesNUMERO_CHE: TStringField;
    QChequesEMISSAO_CHE: TDateField;
    QChequesVENCTO_CHE: TDateField;
    QChequesVALOR_CHE: TBCDField;
    QChequesOBS_CHE: TStringField;
    QChequesCOD_VENDA: TIntegerField;
    QChequesCOD_CAIXA: TIntegerField;
    QChequesNOME_CLI: TStringField;
    QChequesNOME_BAN: TStringField;
    QChequesEMITENTE: TStringField;
    TabSheet11: TTabSheet;
    DBGridCheques: TDBGrid;
    QChequesNOME_USU: TStringField;
    QBuscaItensCANCELADO: TIntegerField;
    QItensExcluidosVALOR_CUSTO: TBCDField;
    QItensExcluidosPRODUTO_PROMOCAO: TStringField;
    QItensExcluidosCANCELADO: TIntegerField;
    DBGrid2: TDBGrid;
    DSFormas: TDataSource;
    IBTRVendas: TFDTransaction;
    Panel5: TPanel;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    EdtChequeVista: TCurrencyEdit;
    EdtChequePrazo: TCurrencyEdit;
    EdtTotalCheque: TCurrencyEdit;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    EdtVendasCanceladas: TCurrencyEdit;
    EdtItensCancelados: TCurrencyEdit;
    QTotalFormasTOTAL: TBCDField;
    QTotalFormasCOD_FORMA: TIntegerField;
    QTotalFormasDESCRICAO: TStringField;
    QTotalFormasTIPO: TStringField;
    GroupBox3: TGroupBox;
    EdtDescontosVendas: TCurrencyEdit;
    Label1: TLabel;
    QTotalDesconto: TFDQuery;
    QTotalDescontoTOTAL_DESCONTO: TBCDField;
    QVendasCOD_VEN: TIntegerField;
    QVendasDATA_VEN: TDateField;
    QVendasCOD_CAI: TIntegerField;
    QVendasCOD_EMP: TIntegerField;
    QVendasTOTAL_VEN: TBCDField;
    QVendasDESCONTO_VEN: TBCDField;
    QVendasHORA: TTimeField;
    QVendasNOME_CLI: TStringField;
    QVendasNOME_USU: TStringField;
    QVendasVALOR: TBCDField;
    QVendasDESCRICAO: TStringField;
    QVendasR04_CCF: TIntegerField;
    QVendasCUPOM_FISCAL_VEN: TIntegerField;
    QBuscaItensVENDA_CANCELADA: TIntegerField;
    QBuscaItensCOD_VEND: TIntegerField;
    QBuscaItensCODIGO_BARRA_PRO: TStringField;
    QRecCODIGO_DUPLICATA: TIntegerField;
    QRecCODIGO_FORMA_PAGAMENTO: TIntegerField;
    QVendasExcCUPOM_FISCAL_VEN: TIntegerField;
    Label2: TLabel;
    EdtDescontosItens: TCurrencyEdit;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnImpClick(Sender: TObject);
    procedure CheckHoraClick(Sender: TObject);
    procedure EdtHoraIniExit(Sender: TObject);
    procedure BtnItensClick(Sender: TObject);
    procedure BtnSegundaViaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QItensExcluidosCalcFields(DataSet: TDataSet);
    procedure QBuscaItensCalcFields(DataSet: TDataSet);
    procedure QTotalFormasAfterScroll(DataSet: TDataSet);
    procedure PageControlMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsVendaCaixa: TFrmConsVendaCaixa;

implementation
uses
  Udm, Ubibli1, UItensVenda, UNovoPrincipal;
var  sSqlToralRec    : string;
     sSqlVendas      : string;
     sSqlRecebe      : string;
     sSqlVendasDesc  : string;
     sSqlVendasExc   : string;
     sSqlCheque      : string;

{$R *.dfm}

procedure TFrmConsVendaCaixa.FormShow(Sender: TObject);
begin 
   sSqlToralRec    := QTotalRec.SQL.Text;
   sSqlVendas      := QVendas.SQL.Text;
   sSqlRecebe      := QRec.SQL.Text;
   sSqlVendasDesc  := QVendasDesc.SQL.Text;
   sSqlVendasExc   := QVendasExc.SQL.Text;
   sSqlCheque      := QCheques.SQL.Text;

   BtnImp.Enabled  := false;
   edtdataini.Text:= datetostr(date);
   edtdatafin.Text:= datetostr(date);
   EdtHoraIni.Text:= '00:00:00';
   EdtHoraFin.Text:= '23:59:59';
   CheckHora.Checked:= true;
   CheckHoraClick(CheckHora);
   ComboCaixa.ItemIndex:= 0;
   ComboOperador.ItemIndex:= 0;
   PageControl.ActivePageIndex:= 0;
   edtdataini.SetFocus;
end;

procedure TFrmConsVendaCaixa.BitBtn1Click(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsVendaCaixa.BtnOKClick(Sender: TObject);
var cTotalVendas : currency;
begin 
   BtnImp.Enabled := true;
   cTotalVendas   := 0;

   { BUSCA TOTAIS DAS VENDAS }
   if IBTRVendas.Active then
      IBTRVendas.Commit;
   IBTRVendas.StartTransaction;
   with QTotalFormas do
      begin 
         close;
         sql.Clear;
         sql.Text:= 'SELECT SUM(I.VALOR) TOTAL, I.COD_FORMA, F.DESCRICAO, F.TIPO  ' +
                    'FROM VENDAS_FORMAS_PAGAMENTO I ' +
                    'INNER JOIN VENDAS V            ' +
                    'ON (I.COD_VENDA = V.COD_VEN)   ' +
                    'INNER JOIN FORMAS_PAGAMENTO F  ' +
                    'ON (I.COD_FORMA = F.CODIGO)';

         if not CheckHora.Checked then
            begin 
               sql.Add(' WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                       ' AND V.CANCELADA_VEN = 0');
               Parambyname('dataini').AsDate := strtodate(edtdataini.Text);
               Parambyname('datafin').AsDate := strtodate(edtdatafin.Text);
            end
         else
            begin 
               sql.Add(' WHERE V.DATA_HORA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                       ' AND V.CANCELADA_VEN = 0');
               Parambyname('dataini').AsDateTime := strtodate(edtdataini.Text) + strtotime(edthoraini.Text);
               Parambyname('datafin').AsDateTime := strtodate(edtdatafin.Text) + strtotime(edthorafin.Text);
            end;

         if ComboCaixa.ItemIndex > 0 then
            begin 
               sql.Add(' AND V.COD_CAI = :CODCAI');
               parambyname('codcai').AsInteger:= strtoint(copy(ComboCaixa.Text, 1,2));
            end;

         sql.Add(' AND V.COD_EMP = :CODEMP');
         parambyname('codemp').AsInteger:= iEmp;

         if ComboOperador.ItemIndex > 0 then
            begin 
               sql.Add(' AND V.COD_USU = :CODUSU');
               parambyname('codusu').AsInteger:= strtoint(copy(ComboOperador.Text, 1, 2));
            end;

         sql.Add(' GROUP BY I.COD_FORMA, F.DESCRICAO, F.TIPO');
         sql.Add(' ORDER BY F.DESCRICAO');
         open;
         first;

         DisableControls;
         while not eof do
           begin 
              if trim(QTotalFormasTIPO.AsString) <> 'TR' then
                 cTotalVendas:= cTotalVendas + QTotalFormasTOTAL.AsCurrency
              else
                 cTotalVendas:= cTotalVendas - QTotalFormasTOTAL.AsCurrency;
              next;
           end;
         first;
         EnableControls;

         EdtTotalVendas.Text:= currtostr(cTotalVendas);
      end;

   { BUSCA O TOTAL DO DESCONTO NO SUBTOTAL DAS VENDAS }
   if dm.ibtraux.Active then
      dm.IBTRAux.Commit;
   dm.IBTRAux.StartTransaction;
   try
     try
       with QTotalDesconto do
          begin 
             close;
             sql.Clear;
             sql.Text:= 'SELECT SUM(DESCONTO_VEN) TOTAL_DESCONTO ' +
                        'FROM VENDAS';

             if not CheckHora.Checked then
                begin 
                   sql.Add(' WHERE DATA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                           ' AND CANCELADA_VEN = 0');
                   Parambyname('dataini').AsDate := strtodate(edtdataini.Text);
                   Parambyname('datafin').AsDate := strtodate(edtdatafin.Text);
                end
             else
                begin 
                   sql.Add(' WHERE DATA_HORA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                           ' AND CANCELADA_VEN = 0');
                   Parambyname('dataini').AsDateTime := strtodate(edtdataini.Text) + strtotime(edthoraini.Text);
                   Parambyname('datafin').AsDateTime := strtodate(edtdatafin.Text) + strtotime(edthorafin.Text);
                end;

             if ComboCaixa.ItemIndex > 0 then
                begin 
                   sql.Add(' AND COD_CAI = :CODCAI');
                   parambyname('codcai').AsInteger:= strtoint(copy(ComboCaixa.Text, 1,2));
                end;

             sql.Add(' AND COD_EMP = :CODEMP');
             parambyname('codemp').AsInteger:= iEmp;

             if ComboOperador.ItemIndex > 0 then
                begin 
                   sql.Add(' AND COD_USU = :CODUSU');
                   parambyname('codusu').AsInteger:= strtoint(copy(ComboOperador.Text, 1, 2));
                end;

             open;
             EdtDescontosVendas.Text:= QTotalDescontoTOTAL_DESCONTO.AsString;
          end;
       DM.IBTRAux.Commit;
     except
       dm.IBTRAux.Rollback;
       AlertaCad('Erro ao buscar o total do desconto');
     end;
   finally
     QTotalDesconto.Close;
   end;

   { BUSCA O TOTAL DO DESCONTO NOS ITENS DA VENDA }
   if dm.ibtraux.Active then
      dm.IBTRAux.Commit;
   dm.IBTRAux.StartTransaction;
   try
     try
       with QTotalDesconto do
          begin 
             close;
             sql.Clear;
             sql.Text:= 'SELECT SUM(DESCONTO) TOTAL_DESCONTO ' +
                        'FROM ITENS_VENDA I  ' +
                        'INNER JOIN VENDAS V ' +
                        'ON (I.COD_VEN = V.COD_VEN)';

             if not CheckHora.Checked then
                begin 
                   sql.Add(' WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                           ' AND V.CANCELADA_VEN = 0');
                   Parambyname('dataini').AsDate := strtodate(edtdataini.Text);
                   Parambyname('datafin').AsDate := strtodate(edtdatafin.Text);
                end
             else
                begin 
                   sql.Add(' WHERE V.DATA_HORA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                           ' AND V.CANCELADA_VEN = 0');
                   Parambyname('dataini').AsDateTime := strtodate(edtdataini.Text) + strtotime(edthoraini.Text);
                   Parambyname('datafin').AsDateTime := strtodate(edtdatafin.Text) + strtotime(edthorafin.Text);
                end;

             if ComboCaixa.ItemIndex > 0 then
                begin 
                   sql.Add(' AND V.COD_CAI = :CODCAI');
                   parambyname('codcai').AsInteger:= strtoint(copy(ComboCaixa.Text, 1,2));
                end;

             sql.Add(' AND V.COD_EMP = :CODEMP');
             parambyname('codemp').AsInteger:= iEmp;

             if ComboOperador.ItemIndex > 0 then
                begin 
                   sql.Add(' AND V.COD_USU = :CODUSU');
                   parambyname('codusu').AsInteger:= strtoint(copy(ComboOperador.Text, 1, 2));
                end;

             open;
             EdtDescontosItens.Text:= QTotalDescontoTOTAL_DESCONTO.AsString;
          end;
       DM.IBTRAux.Commit;
     except
       dm.IBTRAux.Rollback;
       AlertaCad('Erro ao buscar o total do desconto dos itens');
     end;
   finally
     QTotalDesconto.Close;
   end;

   { BUSCA TOTAIS DO RECEBIMENTO }
   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   dm.IBTRAux.StartTransaction;
   with QTotalRec do
      begin 
         close;
         sql.Clear;
         sql.Text:= sSqlToralRec;
         sql.Add(' WHERE DTPAGTO_CTR BETWEEN :DATAINI AND :DATAFIN');

         if ComboCaixa.ItemIndex > 0 then
            begin 
               sql.Add(' AND COD_CAI = :CODCAI');
               parambyname('codcai').AsInteger:= strtoint(copy(ComboCaixa.Text, 1,2));
            end;

         sql.Add(' AND COD_EMP = :CODEMP');
         Parambyname('codemp').AsInteger:= iEmp;

         Parambyname('dataini').AsDate := strtodate(edtdataini.Text);
         Parambyname('datafin').AsDate := strtodate(edtdatafin.Text);
         open;
         EdtRecebimento.Text:= FieldByName('VALORPAGO').AsString;
      end;
   dm.IBTRAux.Commit;
   QTotalRec.Close;
   edttotal.Text:= currtostr(strtocurr(EdtTotalVendas.Text) + strtocurr(EdtRecebimento.Text));

   { BUSCA TOTAIS VENDA EXCLUIDAS }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QConsulta do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT SUM(TOTAL_VEN) TOTAL ' +
                 'FROM VENDAS ');
         if not CheckHora.Checked then
            begin 
               sql.Add(' WHERE DATA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                       ' AND CANCELADA_VEN = 1');
               Parambyname('dataini').AsDate := strtodate(edtdataini.Text);
               Parambyname('datafin').AsDate := strtodate(edtdatafin.Text);
            end
         else
            begin 
               sql.Add(' WHERE DATA_HORA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                       ' AND CANCELADA_VEN = 1');
               Parambyname('dataini').AsDateTime := strtodate(edtdataini.Text) + strtotime(edthoraini.Text);
               Parambyname('datafin').AsDateTime := strtodate(edtdatafin.Text) + strtotime(edthorafin.Text);
            end;

         if ComboCaixa.ItemIndex > 0 then
            begin 
               sql.Add(' AND COD_CAI = :CODCAI');
               parambyname('codcai').AsInteger:= strtoint(copy(ComboCaixa.Text, 1,2));
            end;

         sql.Add(' AND COD_EMP = :CODEMP');
         Parambyname('codemp').AsInteger:= iEmp;

         if ComboOperador.ItemIndex > 0 then
            begin 
               sql.Add(' AND COD_USU = :CODUSU');
               parambyname('codusu').AsInteger:= strtoint(copy(ComboOperador.Text, 1, 2));
            end;

         open;
         EdtVendasCanceladas.Text:= FieldByName('TOTAL').AsString;
      end;
   dm.IBTransaction.Commit;
   DM.QConsulta.Close;


   { BUSCA TOTAIS ITENS EXCLUIDOS}
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QConsulta do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT SUM((I.QUANT * I.VALOR) - I.DESCONTO) TOTAL ' +
                 'FROM ITENS_VENDA  I ' +
                 'INNER JOIN VENDAS V ' +
                 'ON (I.COD_VEN = V.COD_VEN)');
         if not CheckHora.Checked then
            begin 
               sql.Add(' WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                       ' AND V.CANCELADA_VEN = 0 AND I.CANCELADO = 1');
               Parambyname('dataini').AsDate := strtodate(edtdataini.Text);
               Parambyname('datafin').AsDate := strtodate(edtdatafin.Text);
            end
         else
            begin 
               sql.Add(' WHERE V.DATA_HORA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                       ' AND V.CANCELADA_VEN = 0 AND I.CANCELADO = 1');
               Parambyname('dataini').AsDateTime := strtodate(edtdataini.Text) + strtotime(edthoraini.Text);
               Parambyname('datafin').AsDateTime := strtodate(edtdatafin.Text) + strtotime(edthorafin.Text);
            end;

         if ComboCaixa.ItemIndex > 0 then
            begin 
               sql.Add(' AND V.COD_CAI = :CODCAI');
               parambyname('codcai').AsInteger:= strtoint(copy(ComboCaixa.Text, 1,2));
            end;

         if ComboOperador.ItemIndex > 0 then
            begin 
               sql.Add(' AND V.COD_USU = :CODUSU');
               Parambyname('codusu').AsInteger:= strtoint(copy(ComboOperador.Text, 1, 2));
            end;

         sql.Add(' AND I.COD_EMP = :CODEMP');
         Parambyname('codemp').AsInteger:= iEmp;

         open;
         EdtItensCancelados.Text:= FieldByName('TOTAL').AsString;
      end;
   dm.IBTransaction.Commit;
   DM.QConsulta.Close;
end;

procedure TFrmConsVendaCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;

   if IBTRVendas.Active then
      IBTRVendas.Commit;

   QTotalFormas.Close;

   QTotalRec.SQL.Clear;
   QTotalRec.SQL.Text:= sSqlToralRec;
   QTotalRec.Close;

   QVendas.SQL.Clear;
   QVendas.SQL.Text:= sSqlVendas;
   QVendas.Close;

   QRec.SQL.Clear;
   QRec.SQL.Text:= sSqlRecebe;
   qrec.Close;

   QVendasDesc.SQL.Clear;
   QVendasDesc.SQL.Text:= sSqlVendasDesc;
   QVendasDesc.Close;

   QVendasExc.SQL.Clear;
   QVendasExc.SQL.Text:= sSqlVendasExc;
   QVendasExc.Close;

   QCheques.SQL.Clear;
   QCheques.SQL.Text:= sSqlCheque;
   QCheques.Close;

   QItensExcluidos.Close;
   Action:= caFree;
end;

procedure TFrmConsVendaCaixa.FormCreate(Sender: TObject);
begin 
   { BUSCA CAIXA }
   
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QCaixa do
      begin 
         close;
         sql.Clear;
         sql.Text:= 'SELECT * FROM CAIXA ORDER BY COD_CAI';
         open;
         First;
         ComboCaixa.Items.Clear;
         combocaixa.Items.Add('TODOS');
         while not eof do
            begin 
               combocaixa.Items.Add(FormataStringD(DM.QCaixaCOD_CAI.AsString, '2', '0') + '-' + dm.QCaixaDESC_CAI.AsString);
               next;
            end;
      end;
   dm.IBTransaction.Commit;
   dm.QCaixa.Close;

   { BUSCA OPERADOR DE CAIXA }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QConsulta do
      begin 
         close;
         sql.Clear;
         sql.Text:= 'SELECT COD_USU, NOME_USU ' +
                    'FROM USUARIO ' +
                    'WHERE OPERADOR_CAIXA = ' + #39 + 'S' + #39 +
                    ' ORDER BY NOME_USU';
         Open;
         ComboOperador.Clear;
         ComboOperador.Items.Add('TODOS');
         while not eof do
            begin 
               ComboOperador.Items.Add(FormataStringD(fieldbyname('cod_usu').AsString, '2', '0') + '-' + fieldbyname('nome_usu').AsString);
               next;
            end;
      end;
   dm.IBTransaction.Commit;
   dm.QConsulta.Close;
end;

procedure TFrmConsVendaCaixa.BtnImpClick(Sender: TObject);
var cTotalCaixa : currency;
begin 
  // cTotalCaixa:= strtocurr(EdtTotal.Text) - strtocurr(EdtPromissoria.text) - strtocurr(EdtCartao.Text);

   {==========================================================================}
   {============================= IMPRESSAO DO RECIBO ========================}
   {==========================================================================}
   RDprint.TamanhoQteLinhas:= 1;
   RDprint.Abrir;

   {==========================================================================}
   {============================= IMPRESSAO DO CABEÇALHO =====================}
   {==========================================================================}
   RDprint.Imp(1, 1,  '========================================================');
   RDprint.Imp(2, 1,  'Período: ' + EdtDataIni.Text + ' a ' + EdtDataFin.Text);
   RDprint.Imp(3, 1,  ComboCaixa.Text);
   RDprint.Imp(4, 1,  '========================================================');
{   RDprint.Imp(5, 1,  'Dinheiro:');
   RDprint.ImpVal(5, 40, '#,##0.00', strtocurr(EdtRecebimento.Text), []);
   RDprint.Imp(6, 1,  'Promissoria:');
   RDprint.ImpVal(6, 40, '#,##0.00', strtocurr(EdtPromissoria.Text), []);
   RDprint.Imp(7, 1,  'Cheque:');
   RDprint.ImpVal(7, 40, '#,##0.00', strtocurr(EdtCheque.Text), []);
   RDprint.Imp(8, 1,  'Cheque_Pre:');
   RDprint.ImpVal(8, 40, '#,##0.00', strtocurr(EdtChequePre.Text), []);
   RDprint.Imp(9, 1,  'Cartao:');
   RDprint.ImpVal(9, 40, '#,##0.00', strtocurr(EdtCartao.Text), []);
   RDprint.Imp(10, 1,  'Boleto:');
   RDprint.ImpVal(10, 40, '#,##0.00', strtocurr(EdtBoleto.Text), []);}

   RDprint.Imp(12, 1, 'Total Vendas:');
   RDprint.ImpVal(12, 40, '#,##0.00', strtocurr(EdtTotalVendas.Text), []);
   RDprint.Imp(13, 1, 'Recebimento:');
   RDprint.ImpVal(13, 40, '#,##0.00', strtocurr(EdtRecebimento.Text), []);
   RDprint.Imp(15, 1, 'Total Geral:');
   RDprint.ImpVal(15, 40, '#,##0.00', strtocurr(EdtTotal.Text), []);
   RDprint.Imp(17, 1, 'Total do caixa:');
   RDprint.ImpVal(17, 40, '#,##0.00', cTotalCaixa, []);
   RDprint.Imp(18, 1, '--------------------------------------------------------'); 

   {==========================================================================}
   {========================== FINALIZA A IMPRESSAO ==========================}
   {==========================================================================}
   RDprint.Imp(26, 1, ' ');
   if strtoint(dm.LeIni('cnfcomercio.ini', 'configuracaolocal', 'visualizarrelatorios')) = 1 then
      begin 
         RDprint.TamanhoQteLinhas:= 26;
         RDprint.OpcoesPreview.Preview:= true;
      end
   else
      begin 
         RDprint.TamanhoQteLinhas:= 1;
         RDprint.OpcoesPreview.Preview:= false;
      end;
   RDprint.Fechar;
end;

procedure TFrmConsVendaCaixa.CheckHoraClick(Sender: TObject);
begin 
   if CheckHora.Checked then
      begin 
         edthoraini.Enabled:= true;
         EdtHoraFin.Enabled:= true;
         EdtHoraIni.SetFocus;
      end
   else
      begin 
         EdtDataIni.SetFocus;
         EdtHoraIni.Enabled:= false;
         EdtHoraFin.Enabled:= false;
      end;
end;

procedure TFrmConsVendaCaixa.EdtHoraIniExit(Sender: TObject);
begin 
   with sender as TMaskEdit do
      begin 
         try
           StrToTime(text)
         except
           AlertaCad('Hora Inválida');
           setfocus;
         end;
      end;
end;

procedure TFrmConsVendaCaixa.BtnItensClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmItensVenda, FrmItensVenda);
   FrmItensVenda.Tag:= PageControl.ActivePageIndex + 1;
   FrmItensVenda.showmodal;
end;

procedure TFrmConsVendaCaixa.BtnSegundaViaClick(Sender: TObject);
var iLinha       : integer;
    sAuxData     : string;
    cAuxTotal    : currency;
    iLinhasFinal : integer;
begin 
   if (not (QVendas.State = dsBrowse)) and (not (QVendasCOD_VEN.AsInteger > 0)) then
       begin 
          exit;
       end;

   if application.MessageBox('Confirma a Impressão da Segunda Via?', 'Impressão de Comprovante de Venda', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         iLinhasFinal:= dm.RetornaIntegerTabela('linhas_final', 'parametros', 'cod_emp', iEmp);

         {==========================================================================}
         {======================= IMPRESSAO DO COMPROVANTE DE VENDA ================}
         {==========================================================================}
         RDprint.TamanhoQteLinhas:= 1;
         RDprint.Abrir;

         {==========================================================================}
         {============================= IMPRESSAO DO CABEÇALHO =====================}
         {==========================================================================}
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with dm.QConsulta do
            begin 
               close;
               sql.Clear;
               sql.Add('SELECT RAZAO_EMP, CNPJ_EMP, INSC_EMP, END_EMP, BAI_EMP, CID_EMP, EST_EMP, CEP_EMP ' +
                       'FROM EMPRESA WHERE COD_EMP = :CODEMP');
               Parambyname('codemp').AsInteger:= iEmp;
               Open;
               RDprint.ImpC(1, 28, trim(FieldByName('RAZAO_EMP').AsString), []);
               RDprint.ImpC(2, 28, trim(FieldByName('end_emp').AsString) + ', ' + trim(FieldByName('bai_emp').AsString), []);
               RDprint.ImpC(3, 28, trim(FieldByName('cid_emp').AsString) + '-' + trim(FieldByName('est_emp').AsString) + ' CEP:' + trim(FieldByName('cep_emp').AsString), []);
               RDprint.Imp(4, 1, 'CNPJ: ' + fieldbyname('cnpj_emp').AsString);
               RDprint.Imp(5, 1, 'IE: ' + fieldbyname('insc_emp').AsString);
            end;
         dm.IBTransaction.Commit;
         dm.QConsulta.Close;

         RDprint.Imp(6, 1, '-----------------------------------------------------');
         RDprint.Imp(7, 1, QVendasDATA_VEN.AsString + '  ' +
                           QVendasHORA.AsString +
                           '  CCF:' + FormataStringD(QVendasR04_CCF.AsString, '6', '0') +
                           '  COO:' + FormataStringD(QVendasCUPOM_FISCAL_VEN.AsString, '6', '0') +
                           '  ECF:' + FormataStringD(QVendasCOD_CAI.AsString, '3', '0'));
         RDprint.Imp(8, 1, ' ');
         RDprint.ImpC(9, 28, '2ª VIA - CUPOM FISCAL', []);
         RDprint.Imp(10, 1, '-----------------------------------------------------');

         {==========================================================================}
         {================================= ITENS DA VENDA =========================}
         {==========================================================================}
         iLinha:= 11;
         RDprint.imp(iLinha, 1, 'Item Codigo         Desc.   Quant.    Unit.     Total');
         RDprint.imp(iLinha, 1, '-----------------------------------------------------');
         inc(iLinha);
         cAuxTotal:= 0;

         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with QBuscaItens do
            begin 
               close;
               Parambyname('codven').AsInteger:= QVendasCOD_VEN.AsInteger;
               Open;
               DisableControls;
               First;
               while not eof do
                  begin 
                     RDprint.Imp(iLinha, 1, FormataStringD(QBuscaItensORDEM.AsString, '3', '0'));
                     RDprint.Imp(iLinha, 6, FormataStringD(QBuscaItensCODIGO_BARRA_PRO.AsString, '14', '0'));
                     RDprint.Imp(iLinha, 21, copy(trim(QBuscaItensNOME_PRO.AsString), 1, 30));
                     inc(iLinha);
                     RDprint.ImpVal(iLinha, 27, '#,##0.00', QBuscaItensQUANT.AsCurrency, []);
                     RDprint.ImpVal(iLinha, 36, '#,##0.00', QBuscaItensVALOR.AsCurrency, []);
                     RDprint.ImpVal(iLinha, 46, '#,##0.00', QBuscaItensQUANT.AsCurrency * QBuscaItensVALOR.AsCurrency, []);

                     if QBuscaItensDESCONTO.AsCurrency > 0 then
                        begin 
                           inc(iLinha);
                           RDprint.Imp(iLinha, 21, 'Desconto');
                           RDprint.ImpVal(iLinha, 46, '#,##0.00', QBuscaItensDESCONTO.AsCurrency * -1, []);
                        end;

                     if QBuscaItensCANCELADO.AsInteger = 1 then
                        begin 
                           inc(iLinha);
                           RDprint.Imp(iLinha, 16, 'Cancelado Item ' + QBuscaItensORDEM.AsString);
                           RDprint.ImpVal(iLinha, 46, '#,##0.00', QBuscaItensCALC_TOTAL.AsCurrency, []);
                        end;

                     if QBuscaItensCANCELADO.AsInteger = 0 then
                        cAuxTotal:= cAuxTotal + QBuscaItensCALC_TOTAL.AsCurrency;

                     inc(iLinha);
                     next;
                  end;
               First;
               EnableControls;
            end;
         dm.IBTransaction.Commit;
         QBuscaItens.Close;

         {==========================================================================}
         {========================== IMPRESSAO DOS TOTAIS ==========================}
         {==========================================================================}
         RDprint.Imp(iLinha , 1, '-----------------------------------------------------');
         inc(iLinha);
         if QvendasDESCONTO_VEN.AsCurrency > 0 then
            begin 
               RDprint.Imp(iLinha, 1, '                              SUBTOTAL   ');
               RDprint.ImpVal(iLinha, 46, '#,##0.00', cAuxTotal, []);
               inc(iLinha);
               RDprint.Imp(iLinha, 1, '                              DESCONTO   ');
               RDprint.ImpVal(iLinha, 46, '#,##0.00', QVendasDESCONTO_VEN.AsCurrency, []);
               inc(ilinha);
               RDprint.Imp(iLinha , 1, '                              TOTAL      ');
               RDprint.ImpVal(iLinha, 46, '#,##0.00', cAuxTotal - QVendasDESCONTO_VEN.AsCurrency, []);
               inc(iLinha);
            end
         else
            begin 
               RDprint.Imp(iLinha, 1, '                              TOTAL      ');
               RDprint.ImpVal(iLinha, 46, '#,##0.00', cAuxTotal, []);
               inc(iLinha);
            end;

         { busca as formas de pagamento da venda }
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with dm.QConsulta do
            begin 
               close;
               sql.Clear;
               sql.Add('SELECT I.VALOR, F.DESCRICAO     ' +
                       'FROM VENDAS_FORMAS_PAGAMENTO I  ' +
                       'INNER JOIN FORMAS_PAGAMENTO  F  ' +
                       'ON (I.COD_FORMA = F.CODIGO)     ' +
                       'WHERE I.COD_VENDA = :CODVEN     ' +
                       'ORDER BY F.DESCRICAO');
               Parambyname('codven').AsInteger:= QVendasCOD_VEN.AsInteger;
               open;
               while not eof do
                  begin 
                     if fieldbyname('valor').AsCurrency > 0 then
                        begin 
                           RDprint.Imp(iLinha, 31, fieldbyname('descricao').asString);
                           RDprint.ImpVal(iLinha, 46, '#,##0.00', fieldbyname('valor').AsCurrency, []);
                           inc(iLinha);
                        end;

                     next;
                  end;
            end;
         dm.IBTransaction.Commit;
         dm.QConsulta.Close;

         {==========================================================================}
         {========================== FINALIZA A IMPRESSAO ==========================}
         {==========================================================================}
         iLinha:= iLinha + iLinhasFinal;
         RDprint.Imp(iLinha, 1, ' ');
         if strtoint(dm.LeIni('cnfcomercio.ini', 'configuracaolocal', 'visualizarrelatorios')) = 1 then
            begin 
               RDprint.TamanhoQteLinhas:= iLinha;
               RDprint.OpcoesPreview.Preview:= true;
            end
         else
            begin 
               RDprint.TamanhoQteLinhas:= 1;
               RDprint.OpcoesPreview.Preview:= false;
            end;
         RDprint.Fechar;
      end;
end;

procedure TFrmConsVendaCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmConsVendaCaixa.QItensExcluidosCalcFields(DataSet: TDataSet);
begin 
   QItensExcluidosTOTAL.AsCurrency:= (QItensExcluidosQUANT.AsCurrency *
                                      QItensExcluidosVALOR.AsCurrency) -
                                      QItensExcluidosDESCONTO.AsCurrency;
end;

procedure TFrmConsVendaCaixa.QBuscaItensCalcFields(DataSet: TDataSet);
begin 
   QBuscaItensCALC_TOTAL.AsCurrency:= ((QBuscaItensQUANT.AsCurrency * QBuscaItensVALOR.AsCurrency) - QBuscaItensDESCONTO.AsCurrency);
end;

procedure TFrmConsVendaCaixa.QTotalFormasAfterScroll(DataSet: TDataSet);
begin 
   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   DBGridVendas.Columns[4].Title.Caption:= QTotalFormasDESCRICAO.AsString;
end;

procedure TFrmConsVendaCaixa.PageControlMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin 
   case PageControl.ActivePageIndex of
     0:begin 
          BtnSegundaVia.Enabled:= true;

          if dm.IBTRAux.Active then
             dm.IBTRAux.Commit;
          dm.IBTRAux.StartTransaction;
          with QVendas do
             begin 
                close;
                sql.Clear;
                sql.Text:= sSqlVendas;

                if ComboCaixa.ItemIndex > 0 then
                   sql.add(' INNER JOIN CAIXA CX' +
                           ' ON (V.COD_CAI = CX.COD_CAI) AND (V.COD_EMP = CX.COD_EMP)');

                if not CheckHora.Checked then
                   begin 
                      sql.Add(' WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                              ' AND V.CANCELADA_VEN = 0');
                      Parambyname('dataini').AsDate := strtodate(edtdataini.Text);
                      Parambyname('datafin').AsDate := strtodate(edtdatafin.Text);
                   end
                else
                   begin 
                      sql.Add(' WHERE V.DATA_HORA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                              ' AND V.CANCELADA_VEN = 0');
                      Parambyname('dataini').AsDateTime := strtodate(edtdataini.Text) + strtotime(edthoraini.Text);
                      Parambyname('datafin').AsDateTime := strtodate(edtdatafin.Text) + strtotime(edthorafin.Text);
                   end;

                sql.add(' AND I.COD_FORMA = :CODFORMA');
                parambyname('codforma').AsInteger:= QTotalFormasCOD_FORMA.AsInteger;

                if ComboCaixa.ItemIndex > 0 then
                   begin 
                      sql.Add(' AND V.COD_CAI = :CODCAI');
                      Parambyname('codcai').AsInteger:= strtoint(copy(ComboCaixa.Text, 1,2));
                   end;

                if ComboOperador.ItemIndex > 0 then
                   begin 
                      sql.add(' AND V.COD_USU = :CODUSU');
                      Parambyname('codusu').AsInteger:= strtoint(copy(ComboOperador.Text, 1, 2));
                   end;

                sql.Add(' AND V.COD_EMP = :CODEMP');
                Parambyname('codemp').AsInteger:= iEmp;

                sql.add(' ORDER BY V.DATA_VEN, V.COD_VEN');
                Open;
             end;
       end;
     1:begin 
          BtnSegundaVia.Enabled:= false;

          if dm.IBTRAux.Active then
             dm.IBTRAux.Commit;
          dm.IBTRAux.StartTransaction;
          with QRec do
             begin 
                Close;
                sql.Clear;
                sql.Text:= sSqlRecebe;
                sql.Add(' WHERE DTPAGTO_CTR BETWEEN :DATAINI AND :DATAFIN');
                if ComboCaixa.ItemIndex > 0 then
                   sql.Add(' AND COD_CAI = ' + copy(ComboCaixa.Text, 1,2));

                sql.Add(' AND COD_EMP = :CODEMP');
                Parambyname('codemp').AsInteger:= iEmp;

                Parambyname('dataini').AsDate:= strtodate(edtdataini.Text);
                Parambyname('datafin').AsDate:= strtodate(edtdatafin.Text);
                open;
             end;
       end;

     2:begin 
          BtnSegundaVia.Enabled:= false;

          if dm.IBTRAux.Active then
             dm.IBTRAux.Commit;
          dm.IBTRAux.StartTransaction;
          with QVendasDesc do
             begin 
                close;
                sql.Clear;
                sql.Text:= sSqlVendasDesc;
                if not CheckHora.Checked then
                   begin 
                      sql.Add(' WHERE DATA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                                          ' AND CANCELADA_VEN = 0');
                      Parambyname('dataini').AsDate := strtodate(edtdataini.Text);
                      Parambyname('datafin').AsDate := strtodate(edtdatafin.Text);
                   end
                else
                   begin 
                      sql.Add(' WHERE DATA_HORA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                                          ' AND CANCELADA_VEN = 0');
                      Parambyname('dataini').AsDateTime := strtodate(edtdataini.Text) + strtotime(edthoraini.Text);
                      Parambyname('datafin').AsDateTime := strtodate(edtdatafin.Text) + strtotime(edthorafin.Text);
                   end;
                sql.add(' AND V.DESCONTO_VEN > 0');
                if ComboCaixa.ItemIndex > 0 then
                   sql.Add(' AND V.COD_CAI = ' + copy(ComboCaixa.Text, 1,2));

                if ComboOperador.ItemIndex > 0 then
                   begin 
                      sql.add(' AND V.COD_USU = :CODUSU');
                      Parambyname('codusu').AsInteger:= strtoint(copy(ComboOperador.Text, 1, 2));
                   end;

                sql.Add(' AND V.COD_EMP = ' + inttostr(iEmp));
                sql.add(' ORDER BY V.DATA_VEN, V.COD_VEN');
                Open;
             end;
       end;

     3:begin 
          BtnSegundaVia.Enabled:= false;

          if dm.IBTRAux.Active then
             dm.IBTRAux.Commit;
          dm.IBTRAux.StartTransaction;
          with QVendasExc do
             begin 
                Close;
                SQL.Clear;
                SQL.Text:= sSqlVendasExc;
                 if not CheckHora.Checked then
                    begin 
                       SQL.Add(' WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                                          ' AND CANCELADA_VEN = 1');
                       Parambyname('dataini').AsDate := strtodate(edtdataini.Text);
                       Parambyname('datafin').AsDate := strtodate(edtdatafin.Text);
                    end
                 else
                    begin 
                       SQL.Add(' WHERE V.DATA_HORA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                                          ' AND CANCELADA_VEN = 1');
                       Parambyname('dataini').AsDateTime := strtodate(edtdataini.Text) + strtotime(edthoraini.Text);
                       Parambyname('datafin').AsDateTime := strtodate(edtdatafin.Text) + strtotime(edthorafin.Text);
                    end;
                 if ComboCaixa.ItemIndex > 0 then
                    begin 
                       SQL.Add(' AND V.COD_CAI = :CODCAI');
                       Parambyname('codcai').AsInteger:= strtoint(copy(ComboCaixa.Text, 1,2));
                    end;

                 if ComboOperador.ItemIndex > 0 then
                   begin 
                      sql.add(' AND V.COD_USU = :CODUSU');
                      Parambyname('codusu').AsInteger:= strtoint(copy(ComboOperador.Text, 1, 2));
                   end;

                 SQL.Add(' AND V.COD_EMP = :CODEMP');
                 Parambyname('codemp').AsInteger:= iEmp;
                 sql.add(' ORDER BY V.DATA_VEN, V.COD_VEN');
                 Open;
             end;
       end;

     4:begin 
          BtnSegundaVia.Enabled:= false;

          if dm.IBTRAux.Active then
             dm.IBTRAux.Commit;
          dm.IBTRAux.StartTransaction;
          with QItensExcluidos do
             begin 
                Close;
                SQL.Clear;
                SQL.Text:= 'SELECT I.*, P.NOME_PRO, V.COD_CAI, V.DATA_HORA_VEN, V.DATA_VEN, U.NOME_USU ' +
                           'FROM ITENS_VENDA I ' +
                           'INNER JOIN VENDAS V ' +
                           'ON (I.COD_VEN = V.COD_VEN) ' +
                           'INNER JOIN PRODUTO P ' +
                           'ON (I.COD_PRO = P.COD_PRO) ' +
                           'INNER JOIN USUARIO U ' +
                           'ON (V.COD_USU = U.COD_USU)';
                 if not CheckHora.Checked then
                    begin 
                       SQL.Add(' WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                               ' AND V.CANCELADA_VEN = 0 AND I.CANCELADO = 1');
                       Parambyname('dataini').AsDate := strtodate(edtdataini.Text);
                       Parambyname('datafin').AsDate := strtodate(edtdatafin.Text);
                    end
                 else
                    begin 
                       SQL.Add(' WHERE V.DATA_HORA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                               ' AND V.CANCELADA_VEN = 0 AND I.CANCELADO = 1');
                       Parambyname('dataini').AsDateTime := strtodate(edtdataini.Text) + strtotime(edthoraini.Text);
                       Parambyname('datafin').AsDateTime := strtodate(edtdatafin.Text) + strtotime(edthorafin.Text);
                    end;
                 if ComboCaixa.ItemIndex > 0 then
                    begin 
                       SQL.Add(' AND V.COD_CAI = :CODCAI');
                       Parambyname('codcai').AsInteger:= strtoint(copy(ComboCaixa.Text, 1,2));
                    end;

                 if ComboOperador.ItemIndex > 0 then
                   begin 
                      sql.add(' AND V.COD_USU = :CODUSU');
                      Parambyname('codusu').AsInteger:= strtoint(copy(ComboOperador.Text, 1, 2));
                   end;

                 SQL.Add(' AND I.COD_EMP = :CODEMP');
                 Parambyname('codemp').AsInteger:= iEmp;
                 sql.add(' ORDER BY V.DATA_VEN, I.COD_VEN');
                 Open;
             end;
       end;
     5:begin 
          BtnSegundaVia.Enabled:= false;

           if dm.IBTRAux.Active then
             dm.IBTRAux.Commit;
          dm.IBTRAux.StartTransaction;
          with QCheques do
             begin 
                Close;
                SQL.Clear;
                SQL.Text:= sSqlCheque;
                SQL.Add(' WHERE CHE.EMISSAO_CHE BETWEEN :DATAINI AND :DATAFIN ');

                if ComboCaixa.ItemIndex > 0 then
                   begin 
                      sql.Add(' AND CHE.COD_CAIXA = :CODCAI');
                      ParamByName('codcai').AsInteger:=  strtoint(copy(ComboCaixa.Text, 1,2));
                   end;
                if ComboOperador.ItemIndex > 0 then
                   begin 
                      sql.Add(' AND CHE.COD_USUARIO = :CODUSU');
                      Parambyname('codusu').AsInteger:= strtoint(copy(ComboOperador.Text, 1, 2));
                   end;
                SQL.Add(' ORDER BY CHE.COD_CHE');
                Parambyname('dataini').AsDate:= strtodate(edtdataini.Text);
                Parambyname('datafin').AsDate:= strtodate(edtdatafin.Text);
                Open;
             end;
        end;
   end;
end;

end.                                                                                                                       
