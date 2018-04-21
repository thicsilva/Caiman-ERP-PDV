unit UQRelInventPrecoVenda;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelInventPrecoVenda = class(UNovoFormulario.TForm)
    QRInvent: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBCusto: TQRDBText;
    QRDBText5: TQRDBText;
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
    QRLabel8: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLCNPJ: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRExpr2: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelInventPrecoVenda: TFrmQRelInventPrecoVenda;

implementation
Uses URelInventario;

{$R *.dfm}

end.
