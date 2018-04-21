unit URelVendasLucro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmRelVendasLucro = class(UNovoFormulario.TForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    CheckEmp: TCheckBox;
    Panel1: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    StatusBar1: TStatusBar;
    QRelVendas: TFDQuery;
    QRelVendasTOTAL: TBCDField;
    QRelVendasTOTALCUSTO: TBCDField;
    QRelVendasDATA_VEN: TDateField;
    QRelVendasDIASEMANA: TSmallintField;
    QRelVendasDIASTRING: TStringField;
    RDG: TRadioGroup;
    QRelDespRec: TFDQuery;
    QRelDespRecDATA: TDateField;
    QRelDespRecRECEITA: TBCDField;
    QRelDespRecDESPESA: TBCDField;
    QRelDespRecDIASEMANA: TIntegerField;
    QRelDespRecSTRINGDIA: TStringField;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRelVendasCalcFields(DataSet: TDataSet);
    procedure QRelDespRecCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelVendasLucro: TFrmRelVendasLucro;

implementation
uses
  Udm, UQRelVendasLucro, UQRelDespesaReceita, UNovoPrincipal;

{$R *.dfm}

procedure TFrmRelVendasLucro.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelVendasLucro.BtnVisClick(Sender: TObject);
begin 
   if rdg.ItemIndex = 0 then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with QRelVendas do
            begin 
               close;
               sql.Clear;
               sql.Add('SELECT SUM(TOTAL_VEN) TOTAL, SUM(TOTAL_CUSTO_VEN) TOTALCUSTO, DATA_VEN, ' +
                       'EXTRACT (WEEKDAY FROM DATA_VEN) DIASEMANA ' +
                       'FROM VENDAS ' +
                       'WHERE DATA_VEN BETWEEN :DATAINI AND :DATAFIN ');
               if (not CheckEmp.Checked) then
                  begin 
                     sql.Add(' AND COD_EMP = :CODEMP ');
                     Parambyname('codemp').AsInteger:= iEmp;
                  end;
               sql.add(' GROUP BY DATA_VEN ORDER BY DATA_VEN');
               Parambyname('dataini').AsDate  := edtdataini.Date;
               Parambyname('datafin').AsDate  := edtdatafin.Date;
               open;
            end;
         Application.CreateForm(TFrmQRelVendasLucro, FrmQRelVendasLucro);
         FrmQRelVendasLucro.QRLNomeEmpresa.Caption := frmmenu.SB.Panels[3].Text;
         FrmQRelVendasLucro.QRLTitulo.Caption      := 'Relatório de Vendas/Lucro no Período: ' + datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
         if sender = btnvis then
            begin 
               FrmQRelVendasLucro.QRVenda.PreviewInitialState:= wsMaximized;
               FrmQRelVendasLucro.QRVenda.Preview;
            end
         else
            begin 
               FrmQRelVendasLucro.QRVenda.PrinterSetup;
               FrmQRelVendasLucro.QRVenda.Print;
            end;
         FrmQRelVendasLucro.QRVenda.QRPrinter:= nil;
         dm.IBTransaction.Commit;
         QRelVendas.Close;
      end
   else
      begin 
         if EdtDataFin.Date < edtdataini.Date then
            begin 
               AlertaCad('A data final não pode ser menor que a data inicial');
//               edtdataini.SetFocus;
               exit;
               abort;
            end;
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with QRelDespRec do
            begin 
               close;
               Parambyname('dataini').AsDate:= edtdataini.Date;
               Parambyname('datafin').AsDate:= EdtDataFin.Date;
               if (not CheckEmp.Checked) then
                  Parambyname('codemp').AsInteger:= iEmp
               else
                  Parambyname('codemp').AsInteger:= 0;
               open;
            end;
         Application.CreateForm(TFrmQRelDespesaReceita, FrmQRelDespesaReceita);
         FrmQRelDespesaReceita.QRLNomeEmpresa.Caption := frmmenu.SB.Panels[3].Text;
         FrmQRelDespesaReceita.QRLTitulo.Caption      := 'Relatório de Receita/Despesa no Período: ' + datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
         if sender = btnvis then
            begin 
               FrmQRelDespesaReceita.QRVenda.PreviewInitialState:= wsMaximized;
               FrmQRelDespesaReceita.QRVenda.Preview;
            end
         else
            begin 
               FrmQRelDespesaReceita.QRVenda.PrinterSetup;
               FrmQRelDespesaReceita.QRVenda.Print;
            end;
         FrmQRelDespesaReceita.QRVenda.QRPrinter:= nil;
         dm.IBTransaction.Commit;
         QRelDespRec.Close;
      end;
end;

procedure TFrmRelVendasLucro.FormShow(Sender: TObject);
begin 
   edtdataini.Date:= date;
   edtdatafin.Date:= date;
   rdg.ItemIndex:= 0;
   edtdataini.SetFocus;
end;

procedure TFrmRelVendasLucro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelVendasLucro.QRelVendasCalcFields(DataSet: TDataSet);
begin 
   case QRelVendasDIASEMANA.Value of
     0: QRelVendasDIASTRING.Value:= 'DOMINGO';
     1: QRelVendasDIASTRING.Value:= 'SEGUNDA-FEIRA';
     2: QRelVendasDIASTRING.Value:= 'TERÇA-FEIRA';
     3: QRelVendasDIASTRING.Value:= 'QUARTA-FEIRA';
     4: QRelVendasDIASTRING.Value:= 'QUINTA-FEIRA';
     5: QRelVendasDIASTRING.Value:= 'SEXTA-FEIRA';
     6: QRelVendasDIASTRING.Value:= 'SÁBADO';
   End;
end;

procedure TFrmRelVendasLucro.QRelDespRecCalcFields(DataSet: TDataSet);
begin 
   case QRelDespRecDIASEMANA.AsInteger of
     0: QRelDespRecSTRINGDIA.AsString:= 'DOMINGO';
     1: QRelDespRecSTRINGDIA.AsString:= 'SEGUNDA-FEIRA';
     2: QRelDespRecSTRINGDIA.AsString:= 'TERÇA-FEIRA';
     3: QRelDespRecSTRINGDIA.AsString:= 'QUARTA-FEIRA';
     4: QRelDespRecSTRINGDIA.AsString:= 'QUINTA-FEIRA';
     5: QRelDespRecSTRINGDIA.AsString:= 'SEXTA-FEIRA';
     6: QRelDespRecSTRINGDIA.AsString:= 'SÁBADO';
   End;
end;

end.
