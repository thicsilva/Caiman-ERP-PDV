unit UQRelExtratoCC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, Data.DB;

type
  TFrmQRelExtratoCC = class(UNovoFormulario.TForm)
    QRExtrato: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLNomeEmpresa: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLTitulo: TQRLabel;
    QRShape1: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRExprValor: TQRExpr;
    QRLabel9: TQRLabel;
    QRLSaldo: TQRLabel;
    QRLabel11: TQRLabel;
    QRBand1: TQRBand;
    QRLabel10: TQRLabel;
    IBSQLSaldo: TFDQuery;
    IBTRSaldo: TFDTransaction;
    QRLSaldoAnt: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRLPeriodo: TQRLabel;
    procedure QRExtratoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelExtratoCC: TFrmQRelExtratoCC;

implementation
uses
  URelExtratoCC, Udm;
var cDebito, cCredito, cSaldo : currency;

{$R *.dfm}

procedure TFrmQRelExtratoCC.QRExtratoBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin 
   cDebito  := 0;
   cCredito := 0;
   cSaldo   := 0;

   { BUSCA SALDO ANTERIOR - DEBITO }
   if IBTRSaldo.Active then
      IBTRSaldo.Commit;
   IBTRSaldo.StartTransaction;
   try
     try
       with IBSQLSaldo do
          begin 
             close;
             sql.Clear;
             sql.add('SELECT SUM(VALOR_LAN) VALOR ' +
                     'FROM LANCAMENTOS_CONTAS_CORRENTE ' +
                     'WHERE DATAVENC_LAN < :DATA AND COD_CONTA = :CONTA ' +
                     'AND DC_LAN = 0');
             Parambyname('data').AsDate     := FrmRelExtratoCC.EdtDataIni.Date;
             Parambyname('conta').AsInteger := strtoint(FrmRelExtratoCC.cod_conta.text);
             ExecOrOpen;
             cDebito:= fieldbyname('valor').AsCurrency;
          end;
       IBTRSaldo.Commit;
     except
       IBTRSaldo.Rollback;
       AlertaCad('Erro ao Buscar o Saldo Anterior');
     end;
   finally
     IBSQLSaldo.Close;
   end;

   { BUSCA SALDO ANTERIOR - CREDITO }
   if IBTRSaldo.Active then
      IBTRSaldo.Commit;
   IBTRSaldo.StartTransaction;
   try
     try
       with IBSQLSaldo do
          begin 
             close;
             sql.Clear;
             sql.add('SELECT SUM(VALOR_LAN) VALOR ' +
                     'FROM LANCAMENTOS_CONTAS_CORRENTE ' +
                     'WHERE DATAVENC_LAN < :DATA AND COD_CONTA = :CONTA ' +
                     'AND DC_LAN = 1');
             Parambyname('data').AsDate     := FrmRelExtratoCC.EdtDataIni.Date;
             Parambyname('conta').AsInteger := strtoint(FrmRelExtratoCC.cod_conta.text);
             ExecOrOpen;
             cCredito:= fieldbyname('valor').AsCurrency;
          end;
       IBTRSaldo.Commit;
     except
       IBTRSaldo.Rollback;
       AlertaCad('Erro ao Buscar o Saldo Anterior');
     end;
   finally
     IBSQLSaldo.Close;
   end;

   cSaldo:= cCredito - cDebito;
   QRLSaldoAnt.Caption:= CurrToStrF(cSaldo, ffnumber, 2);
end;

procedure TFrmQRelExtratoCC.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin 
   if FrmRelExtratoCC.QRelExtratoDC_LAN.AsInteger = 0 then
      cSaldo:= cSaldo - FrmRelExtratoCC.QRelExtratoVALOR_LAN.AsCurrency
   else
      cSaldo:= cSaldo + FrmRelExtratoCC.QRelExtratoVALOR_LAN.AsCurrency;
   QRLSaldo.Caption:= currtostrf(cSaldo, ffnumber, 2);
end;

end.
