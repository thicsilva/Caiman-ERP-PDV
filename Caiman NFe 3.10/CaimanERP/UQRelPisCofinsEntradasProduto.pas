unit UQRelPisCofinsEntradasProduto;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelPisCofinsEntradasProduto = class(UNovoFormulario.TForm)
    QRPisCofins: TQuickRep;
    DetailBand1: TQRBand;
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
    QRLabel6: TQRLabel;
    QRLabel4: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr1: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRExpr2: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelPisCofinsEntradasProduto: TFrmQRelPisCofinsEntradasProduto;

implementation
Uses UIsentasPisEntradas;

{$R *.dfm}

end.
