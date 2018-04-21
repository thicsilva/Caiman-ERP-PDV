unit UQRelEstoqueCustoVenda;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelEstoqueCustoVenda = class(UNovoFormulario.TForm)
    QREstoque: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText6: TQRDBText;
    QRExpr2: TQRExpr;
    PageHeaderBand1: TQRBand;
    QRLNomeEmpresa: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape1: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText7: TQRDBText;
    QRExpr5: TQRExpr;
    QRLabel15: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLLocalEstoque: TQRLabel;
    QRLTitulo: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelEstoqueCustoVenda: TFrmQRelEstoqueCustoVenda;

implementation
Uses URelEstoque;

{$R *.dfm}

end.
