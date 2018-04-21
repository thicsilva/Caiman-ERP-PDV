unit URelDavOrcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TFrmRelDavOrcamento = class(TForm)
    QRRel: TQuickRep;
    PageFooterBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    QRLabel5: TQRLabel;
    QRShape4: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape5: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel12: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    SummaryBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape11: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape12: TQRShape;
    QRShape19: TQRShape;
    QRLabel20: TQRLabel;
    QRExpr1: TQRExpr;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRLEmpesa: TQRLabel;
    QRLCliente: TQRLabel;
    QRLCNPJEmpresa: TQRLabel;
    QRLCNPJCliente: TQRLabel;
    QRLNumero: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelDavOrcamento: TFrmRelDavOrcamento;

implementation
Uses UConsOrcamento;

{$R *.dfm}

end.
