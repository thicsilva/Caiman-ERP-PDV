unit UQRelEntradasGrupoICMS;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelEntradasGrupoICMS = class(UNovoFormulario.TForm)
    QREntradas: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    QRLPerc: TQRLabel;
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
    QRLabel6: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr1: TQRExpr;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QREntradasBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelEntradasGrupoICMS: TFrmQRelEntradasGrupoICMS;

implementation
uses URelEntradas;
var cTotal : currency;

{$R *.dfm}

procedure TFrmQRelEntradasGrupoICMS.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin 
   if FrmRelEntradas.QRelAgrupadaICMSTOTAL.AsCurrency > 0 then
      QRLPerc.Caption:= currtostrf(((FrmRelEntradas.QRelAgrupadaICMSTOTAL.AsCurrency * 100) / cTotal), ffnumber, 2) + '%'
   else
      QRLPerc.Caption:= '0,00%';
end;

procedure TFrmQRelEntradasGrupoICMS.QREntradasBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin 
   cTotal:= 0;
   with FrmRelEntradas.QRelAgrupadaICMS do
      begin 
         First;
         while not eof do
            begin 
               cTotal:= cTotal + FrmRelEntradas.QRelAgrupadaICMSTOTAL.AsCurrency;
               next;
            end;
         first;
      end;
end;

end.
