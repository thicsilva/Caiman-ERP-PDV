unit URelVendasSecao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmRelVendasSecao = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    CheckEmp: TCheckBox;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    QRelVendas: TFDQuery;
    QRelVendasTOTAL: TFloatField;
    QRelVendasNOME_SEC: TStringField;
    QRelVendasCOD_SEC: TIntegerField;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelVendasSecao: TFrmRelVendasSecao;

implementation
uses
  Udm, UQRelVendasSecao, UNovoPrincipal;

{$R *.dfm}

procedure TFrmRelVendasSecao.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelVendasSecao.BtnVisClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRelVendas do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT SUM(((I.QUANT * I.VALOR) - I.DESCONTO) - ' +
                 '((((V.DESCONTO_VEN * 100) / (V.TOTAL_VEN + V.DESCONTO_VEN)) * (I.QUANT * I.VALOR)) / 100)) TOTAL, ' +
                 'P.COD_SEC, S.NOME_SEC ' +
                 'FROM ITENS_VENDA I ' +
                 'INNER JOIN VENDAS V ' +
                 'ON (I.COD_VEN = V.COD_VEN) ' +
                 'INNER JOIN PRODUTO P ' +
                 'ON (I.COD_PRO = P.COD_PRO) ' +
                 'INNER JOIN SECAO S ' +
                 'ON (P.COD_SEC = S.COD_SEC) ' +
                 'WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                 'AND I.CANCELADO = 0 AND I.VENDA_CANCELADA = 0');
         if (not CheckEmp.Checked) then
            begin 
               sql.Add(' AND V.COD_EMP = :CODEMP');
               Parambyname('codemp').AsInteger:= iEmp;
            end;
         sql.Add(' GROUP BY P.COD_SEC, S.NOME_SEC');
         Parambyname('dataini').AsDate:= edtdataini.Date;
         Parambyname('datafin').AsDate:= edtdatafin.Date;
         open;
      end;
   Application.CreateForm(TFrmQRelVendasSecao, FrmQRelVendasSecao);
   FrmQRelVendasSecao.QRLNomeEmpresa.Caption := frmmenu.SB.Panels[3].Text;
   FrmQRelVendasSecao.QRLTitulo.Caption      := 'Relatório do Resumo das Vendas por Seção no Período: ' +
   datetostr(EdtDataIni.Date) + ' a ' + datetostr(edtdatafin.Date);
   if sender = btnvis then
      begin 
         FrmQRelVendasSecao.QRVendas.PreviewInitialState:= wsMaximized;
         FrmQRelVendasSecao.QRVendas.Preview;
      end
   else
      begin 
         FrmQRelVendasSecao.QRVendas.PrinterSetup;
         FrmQRelVendasSecao.QRVendas.Print;
      end;
   FrmQRelVendasSecao.QRVendas.QRPrinter:= nil;
   dm.IBTransaction.Commit;
   QRelVendas.close;
end;

procedure TFrmRelVendasSecao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelVendasSecao.FormCreate(Sender: TObject);
begin 
   
end;

procedure TFrmRelVendasSecao.FormShow(Sender: TObject);
begin 
   edtdataini.Date:= date;
   EdtDataFin.Date:= date;
   edtdataini.SetFocus;
end;

end.
