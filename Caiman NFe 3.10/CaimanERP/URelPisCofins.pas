unit URelPisCofins;

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
  TFrmRelPisCofins = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    ComboOrigem: TComboBox;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    QRelVendasSecao: TFDQuery;
    QRelVendasSecaoTOTAL: TFloatField;
    QRelVendasSecaoNOME_SEC: TStringField;
    Rdg: TRadioGroup;
    QRelProd: TFDQuery;
    QRelProdTOTAL: TFloatField;
    QRelProdNOME_PRO: TStringField;
    QRelProdNOME_SEC: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelPisCofins: TFrmRelPisCofins;

implementation
uses
  Udm, UQRelSemPisCofins, UNovoPrincipal, UQRelSemPisProduto;

{$R *.dfm}

procedure TFrmRelPisCofins.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRelPisCofins.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelPisCofins.FormShow(Sender: TObject);
begin 
   edtdataini.date:= date;
   edtdatafin.date:= date;
   rdg.ItemIndex:= 1;
   ComboOrigem.ItemIndex:= 0;
   edtdataini.SetFocus;
end;

procedure TFrmRelPisCofins.BtnVisClick(Sender: TObject);
begin 
   case rdg.ItemIndex of
     0: begin 
           with QRelProd do
              begin 
                 close;
                 sql.Clear;
                 if ComboOrigem.ItemIndex = 0 then
                    begin 
                       sql.add('SELECT SUM(((I.QUANT * I.VALOR) - I.DESCONTO) - ' +
                               '((((V.DESCONTO_VEN * 100) / (V.TOTAL_VEN + V.DESCONTO_VEN)) * ((I.QUANT * I.VALOR) - I.DESCONTO)) / 100)) TOTAL, ' +
                               'P.NOME_PRO, S.NOME_SEC ' +
                               'FROM ITENS_VENDA I ' +
                               'INNER JOIN PRODUTO P ' +
                               'ON (I.COD_PRO = P.COD_PRO) ' +
                               'INNER JOIN VENDAS V ' +
                               'ON (I.COD_VEN = V.COD_VEN) ' +
                               'INNER JOIN SECAO S ' +
                               'ON (P.COD_SEC = S.COD_SEC) ' +
                               'WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                               'AND I.CANCELADO = 0 ' +
                               'AND P.ISENTO_PIS_COFINS_PRO = ' + #39 + 'S' + #39 + ' ' +
                               'AND V.COD_EMP = :CODEMP ' +
                               'AND V.TOTAL_VEN > 0 ' +
                               'GROUP BY I.COD_PRO, P.NOME_PRO, S.NOME_SEC ' +
                               'ORDER BY S.NOME_SEC, P.NOME_PRO');
                    end
                 else
                    begin 
                       sql.add('SELECT SUM((I.QUANT * I.UNIT) - ' +
                               '((((N.DESCONTO_NF * 100) / (N.VALOR_TOTAL_NF + N.DESCONTO_NF)) * (I.QUANT * I.UNIT)) / 100)) TOTAL, ' +
                               'P.NOME_PRO, S.NOME_SEC ' +
                               'FROM ITENS_NOTA_FISCAL I ' +
                               'INNER JOIN PRODUTO P ' +
                               'ON (I.COD_PRO = P.COD_PRO) ' +
                               'INNER JOIN NOTA_FISCAL N ' +
                               'ON (I.COD_NF = N.COD_NF) ' +
                               'INNER JOIN CFOP CF ' +
                               'ON (I.COD_CFO = CF.COD_CFO) ' +
                               'INNER JOIN SECAO S ' +
                               'ON (P.COD_SEC = S.COD_SEC) ' +
                               'WHERE N.DATA_EMISSAO_NF BETWEEN :DATAINI AND :DATAFIN ' +
                               'AND N.CANCELADA_NF = ' + #39 + 'N' + #39 + ' ' +
                               'AND P.ISENTO_PIS_COFINS_PRO = ' + #39 + 'S' + #39 + ' ' +
                               'AND CF.SAIR_REL_RESUMO_ALIQ = ' + #39 + 'S' + #39 + ' ' +
                               'AND N.COD_EMP = :CODEMP ' +
                               'AND N.VALOR_TOTAL_NF > 0 ' +
                               'GROUP BY I.COD_PRO, P.NOME_PRO, S.NOME_SEC ' +
                               'ORDER BY S.NOME_SEC, P.NOME_PRO');
                    end;
                 Parambyname('dataini').AsDate   := EdtDataIni.Date;
                 Parambyname('datafin').AsDate   := EdtDataFin.Date;
                 Parambyname('codemp').AsInteger := iEmp;
                 Open;
              end;
           Application.CreateForm(TFrmQRelSemPisProduto, FrmQRelSemPisProduto);
           FrmQRelSemPisProduto.QRLNomeEmpresa.Caption := frmmenu.SB.Panels[3].Text;
           FrmQRelSemPisProduto.QRLTitulo.Caption      := 'Relatório de Produtos Isentos Pis Cofins no Período: ' +
           datetostr(EdtDataIni.Date) + ' a ' + datetostr(edtdatafin.Date);
           if ComboOrigem.ItemIndex = 0 then
              FrmQRelSemPisProduto.QRLOrigem.Caption:= 'Origem dos dados: Itens da Vendas'
           else
              FrmQRelSemPisProduto.QRLOrigem.Caption:= 'Origem dos dados: Itens das Notas Fiscais de Saida';
           if sender = btnvis then
              begin 
                 FrmQRelSemPisProduto.QRVendas.PreviewInitialState:= wsMaximized;
                 FrmQRelSemPisProduto.QRVendas.Preview;
              end
           else
              begin 
                 FrmQRelSemPisProduto.QRVendas.PrinterSetup;
                 FrmQRelSemPisProduto.QRVendas.Print;
              end;
           FrmQRelSemPisProduto.QRVendas.QRPrinter:= nil;
           dm.IBTransaction.Commit;
           QRelProd.close;
        end;
     1: begin 
           with QRelVendasSecao do
              begin 
                 close;
                 sql.Clear;
                 if ComboOrigem.ItemIndex = 0 then
                    begin 
                       sql.add('SELECT SUM(((I.QUANT * I.VALOR) - I.DESCONTO) - ' +
                               '((((V.DESCONTO_VEN * 100) / (V.TOTAL_VEN + V.DESCONTO_VEN)) * ((I.QUANT * I.VALOR) - I.DESCONTO)) / 100)) TOTAL, S.NOME_SEC ' +
                               'FROM ITENS_VENDA I ' +
                               'INNER JOIN PRODUTO P ' +
                               'ON (I.COD_PRO = P.COD_PRO) ' +
                               'INNER JOIN VENDAS V ' +
                               'ON (I.COD_VEN = V.COD_VEN) ' +
                               'INNER JOIN SECAO S ' +
                               'ON (P.COD_SEC = S.COD_SEC) ' +
                               'WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                               'AND I.CANCELADO = 0 ' +
                               'AND P.ISENTO_PIS_COFINS_PRO = ' + #39 + 'S' + #39 + ' AND V.COD_EMP = :CODEMP ' +
                               'AND V.TOTAL_VEN > 0 ' +
                               'GROUP BY P.COD_SEC, S.NOME_SEC ' +
                               'ORDER BY S.NOME_SEC');
                    end
                 else
                    begin 
                       sql.add('SELECT SUM((I.QUANT * I.UNIT) - ' +
                               '((((N.DESCONTO_NF * 100) / (N.VALOR_TOTAL_NF + N.DESCONTO_NF)) * (I.QUANT * I.UNIT)) / 100)) TOTAL, S.NOME_SEC ' +
                               'FROM ITENS_NOTA_FISCAL I ' +
                               'INNER JOIN PRODUTO P ' +
                               'ON (I.COD_PRO = P.COD_PRO) ' +
                               'INNER JOIN NOTA_FISCAL N ' +
                               'ON (I.COD_NF = N.COD_NF) ' +
                               'INNER JOIN CFOP CF ' +
                               'ON (I.COD_CFO = CF.COD_CFO) ' +
                               'INNER JOIN SECAO S ' +
                               'ON (P.COD_SEC = S.COD_SEC) ' +
                               'WHERE N.DATA_EMISSAO_NF BETWEEN :DATAINI AND :DATAFIN ' +
                               'AND N.CANCELADA_NF = ' + #39 + 'N' + #39 + ' ' +
                               'AND P.ISENTO_PIS_COFINS_PRO = ' + #39 + 'S' + #39 + ' ' +
                               'AND CF.SAIR_REL_RESUMO_ALIQ = ' + #39 + 'S' + #39 + ' ' +
                               'AND N.COD_EMP = :CODEMP ' +
                               'AND N.VALOR_TOTAL_NF > 0 ' +
                               'GROUP BY P.COD_SEC, S.NOME_SEC ' +
                               'ORDER BY S.NOME_SEC');
                    end;
                 Parambyname('dataini').AsDate   := EdtDataIni.Date;
                 Parambyname('datafin').AsDate   := EdtDataFin.Date;
                 Parambyname('codemp').AsInteger := iEmp;
                 Open;
              end;
           Application.CreateForm(TFrmQRelSemPisCofins, FrmQRelSemPisCofins);
           FrmQRelSemPisCofins.QRLNomeEmpresa.Caption := frmmenu.SB.Panels[3].Text;
           FrmQRelSemPisCofins.QRLTitulo.Caption      := 'Relatório de Produtos Isentos Pis/Cofins no Período: ' +
           datetostr(EdtDataIni.Date) + ' a ' + datetostr(edtdatafin.Date);
           if ComboOrigem.ItemIndex = 0 then
              FrmQRelSemPisCofins.QRLOrigem.Caption:= 'Origem dos dados: Itens da Vendas'
           else
              FrmQRelSemPisCofins.QRLOrigem.Caption:= 'Origem dos dados: Itens das Notas Fiscais de Saida';
           if sender = btnvis then
              begin 
                 FrmQRelSemPisCofins.QRVendas.PreviewInitialState:= wsMaximized;
                 FrmQRelSemPisCofins.QRVendas.Preview;
              end
           else
              begin 
                 FrmQRelSemPisCofins.QRVendas.PrinterSetup;
                 FrmQRelSemPisCofins.QRVendas.Print;
              end;
           FrmQRelSemPisCofins.QRVendas.QRPrinter:= nil;
           dm.IBTransaction.Commit;
           QRelVendasSecao.close;
        end;
   end;
end;

procedure TFrmRelPisCofins.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QRelVendasSecao.Close;
   QRelProd.Close;
   Action:= caFree;
end;

procedure TFrmRelPisCofins.FormCreate(Sender: TObject);
begin 
   
end;

procedure TFrmRelPisCofins.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

end.
