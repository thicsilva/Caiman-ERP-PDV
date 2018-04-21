unit UQRelMargemLucro;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelMargemLucro = class(UNovoFormulario.TForm)
    QRMargem: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
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
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRDBText4: TQRDBText;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel11: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelMargemLucro: TFrmQRelMargemLucro;

implementation
Uses URelMargemLucro;

{$R *.dfm}

end.
