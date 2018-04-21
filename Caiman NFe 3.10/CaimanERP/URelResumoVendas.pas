unit URelResumoVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmRelResumoVendas = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    CheckEmp: TCheckBox;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    Label1: TLabel;
    QRelVendas: TFDQuery;
    QRelVendasTOTAL: TBCDField;
    QRelVendasCOD_FORMA: TIntegerField;
    QRelVendasDESCRICAO: TStringField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelResumoVendas: TFrmRelResumoVendas;

implementation
uses
  Udm, UQRelResumoVendas, UNovoPrincipal;

{$R *.dfm}

procedure TFrmRelResumoVendas.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelResumoVendas.FormShow(Sender: TObject);
begin 
   edtdataini.Date:= date;
   edtdatafin.Date:= date;
   edtdataini.SetFocus;
end;

procedure TFrmRelResumoVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QRelVendas.Close;

   Action:= caFree;
end;

procedure TFrmRelResumoVendas.FormCreate(Sender: TObject);
begin 
   
end;

procedure TFrmRelResumoVendas.BtnVisClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRelVendas do
      begin 
         close;
         sql.Clear;
         sql.Text:= 'SELECT SUM(VF.VALOR) TOTAL, VF.COD_FORMA, F.DESCRICAO ' +
                    'FROM VENDAS_FORMAS_PAGAMENTO VF ' +
                    'INNER JOIN VENDAS V             ' +
                    'ON (VF.COD_VENDA = V.COD_VEN)   ' +
                    'INNER JOIN FORMAS_PAGAMENTO F   ' +
                    'ON (VF.COD_FORMA = F.CODIGO)    ' +
                    'WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                    'AND V.CANCELADA_VEN = 0';

         if (not CheckEmp.Checked) then
            begin 
               sql.Add(' AND V.COD_EMP = :CODEMP');
               Parambyname('codemp').AsInteger:= iEmp;
            end;

         sql.Add(' GROUP BY VF.COD_FORMA, F.DESCRICAO ' +
                 ' HAVING SUM(VF.VALOR) > 0 ');

         Parambyname('dataini').AsDate:= edtdataini.Date;
         Parambyname('datafin').AsDate:= EdtDataFin.Date;
         Open;
      end;
   Application.CreateForm(TFrmQRelResumoVendas, FrmQRelResumoVendas);
   FrmQRelResumoVendas.QRLNomeEmpresa.Caption := frmmenu.SB.Panels[3].Text;
   FrmQRelResumoVendas.QRLTitulo.Caption      := 'Relatório de Vendas no período: ' +
   datetostr(EdtDataIni.Date) + ' a ' + datetostr(edtdatafin.Date);

   if sender = btnvis then
      begin 
         FrmQRelResumoVendas.QRVendas.PreviewInitialState:= wsMaximized;
         FrmQRelResumoVendas.QRVendas.Preview;
      end
   else
      begin 
         FrmQRelResumoVendas.QRVendas.PrinterSetup;
         FrmQRelResumoVendas.QRVendas.Print;
      end;
   FrmQRelResumoVendas.QRVendas.QRPrinter:= nil;
   dm.IBTransaction.Commit;
   QRelVendas.Close;
end;

end.
