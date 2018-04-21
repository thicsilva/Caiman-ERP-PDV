unit UQRelVendasGrupoICMS;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelVendasGrupoICMS = class(UNovoFormulario.TForm)
    QRVendas: TQuickRep;
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
    procedure QRVendasBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelVendasGrupoICMS: TFrmQRelVendasGrupoICMS;

implementation
Uses URelVendasGrupoICMS;
var cTotal : currency;

{$R *.dfm}

procedure TFrmQRelVendasGrupoICMS.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin 
   if FrmRelVendasGrupoICMS.QRelVendasTOTAL.AsCurrency > 0 then
      QRLPerc.Caption:= currtostrf(((FrmRelVendasGrupoICMS.QRelVendasTOTAL.AsCurrency * 100) / cTotal), ffnumber, 2) + '%'
   else
      QRLPerc.Caption:= '0,00%';
end;

procedure TFrmQRelVendasGrupoICMS.QRVendasBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin 
   cTotal:= 0;
   with FrmRelVendasGrupoICMS.QRelVendas do
      begin 
         First;
         while not eof do
            begin 
               cTotal:= cTotal + FrmRelVendasGrupoICMS.QRelVendasTOTAL.AsCurrency;
               next;
            end;
         first;
      end;
end;

end.
