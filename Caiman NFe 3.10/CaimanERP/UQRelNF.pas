unit UQRelNF;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelNF = class(UNovoFormulario.TForm)
    QRNF: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
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
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelNF: TFrmQRelNF;

implementation
Uses URelNF;

{$R *.dfm}

end.
