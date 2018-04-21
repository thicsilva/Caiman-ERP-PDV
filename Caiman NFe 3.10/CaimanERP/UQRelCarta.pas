unit UQRelCarta;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelCarta = class(UNovoFormulario.TForm)
    QRCarta: TQuickRep;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLNomeEmpresa: TQRLabel;
    QRLEndEmp: TQRLabel;
    QRLEnd1: TQRLabel;
    QRLData: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
    QRLConteudo: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    QRBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel16: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel12: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelCarta: TFrmQRelCarta;

implementation
Uses UMalaSel;

{$R *.dfm}

end.
