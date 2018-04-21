unit URelVendasGrupoICMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, StdCtrls, ComCtrls, Buttons, ExtCtrls, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmRelVendasGrupoICMS = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    CheckEmp: TCheckBox;
    QRelVendas: TFDQuery;
    QRelVendasTOTAL: TFloatField;
    QRelVendasNOME_GRP: TStringField;
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelVendasGrupoICMS: TFrmRelVendasGrupoICMS;

implementation

uses
  UDM, UNovoPrincipal, UQRelVendasGrupoICMS;

{$R *.dfm}

procedure TFrmRelVendasGrupoICMS.FormShow(Sender: TObject);
begin 
   edtdataini.Date:= date;
   edtdatafin.Date:= date;
   edtdataini.SetFocus;
end;

procedure TFrmRelVendasGrupoICMS.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelVendasGrupoICMS.BtnVisClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRelVendas do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT SUM(((I.QUANT * I.VALOR) - I.DESCONTO) - ' +
                 '((((V.DESCONTO_VEN * 100) / (V.TOTAL_VEN + V.DESCONTO_VEN)) * ((I.QUANT * I.VALOR) - I.DESCONTO)) / 100)) TOTAL, G.NOME_GRP ' +
                 'FROM ITENS_VENDA I ' +
                 'INNER JOIN PRODUTO P ' +
                 'ON (I.COD_PRO = P.COD_PRO) ' +
                 'INNER JOIN VENDAS V ' +
                 'ON (I.COD_VEN = V.COD_VEN) ' +
                 'INNER JOIN GRUPO_ICMS G ' +
                 'ON (P.ICMS_CF_EST = G.COD_GRP) ' +
                 'WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN AND I.CANCELADO = 0 AND I.VENDA_CANCELADA = 0 ');

         if (not CheckEmp.Checked) then
            begin 
               sql.Add(' AND V.COD_EMP = :CODEMP');
               Parambyname('codemp').AsInteger:= iEmp;
            end;
         sql.add(' AND V.TOTAL_VEN > 0');
         sql.Add(' GROUP BY P.ICMS_CF_EST, G.NOME_GRP');
         Parambyname('dataini').AsDate:= EdtDataIni.Date;
         Parambyname('datafin').AsDate:= EdtDataFin.Date;
         Open;
      end;
   Application.CreateForm(TFrmQRelVendasGrupoICMS, FrmQRelVendasGrupoICMS);
   FrmQRelVendasGrupoICMS.QRLNomeEmpresa.Caption := frmmenu.SB.Panels[3].Text;
   FrmQRelVendasGrupoICMS.QRLTitulo.Caption      := 'Relatório do Resumo das Vendas por Grupo de ICMS no Período: ' +
   datetostr(EdtDataIni.Date) + ' a ' + datetostr(edtdatafin.Date);
   if sender = btnvis then
      begin 
         FrmQRelVendasGrupoICMS.QRVendas.PreviewInitialState:= wsMaximized;
         FrmQRelVendasGrupoICMS.QRVendas.Preview;
      end
   else
      begin 
         FrmQRelVendasGrupoICMS.QRVendas.PrinterSetup;
         FrmQRelVendasGrupoICMS.QRVendas.Print;
      end;
   FrmQRelVendasGrupoICMS.QRVendas.QRPrinter:= nil;
   dm.IBTransaction.Commit;
   QRelVendas.close;
end;

procedure TFrmRelVendasGrupoICMS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelVendasGrupoICMS.FormCreate(Sender: TObject);
begin 
   
end;

end.
