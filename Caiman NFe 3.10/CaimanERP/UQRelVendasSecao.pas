unit UQRelVendasSecao;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelVendasSecao = class(UNovoFormulario.TForm)
    QRVendas: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
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
    QRLabel4: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel7: TQRLabel;
    QRLPerc: TQRLabel;
    procedure QRVendasBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelVendasSecao: TFrmQRelVendasSecao;

implementation
Uses URelVendasSecao;
var  cTotal : currency;

{$R *.dfm}

procedure TFrmQRelVendasSecao.QRVendasBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin 
   cTotal:= 0;
   with FrmRelVendasSecao.QRelVendas do
      begin 
         First;
         while not eof do
            begin 
               cTotal:= cTotal + FrmRelVendasSecao.QRelVendasTOTAL.AsCurrency;
               next;
            end;
         first;
      end;
end;

procedure TFrmQRelVendasSecao.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin 
   if FrmRelVendasSecao.QRelVendasTOTAL.AsCurrency > 0 then
      QRLPerc.Caption:= currtostrf(((FrmRelVendasSecao.QRelVendasTOTAL.AsCurrency * 100) / cTotal), ffnumber, 2)
   else
      QRLPerc.Caption:= '0,00';
end;

end.
