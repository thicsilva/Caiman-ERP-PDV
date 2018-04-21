unit UQRelOrcamentosEmitidos;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelOrcamentosEmitidos = class(UNovoFormulario.TForm)
    QROrcamento: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
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
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel4: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelOrcamentosEmitidos: TFrmQRelOrcamentosEmitidos;

implementation
Uses UConsOrcamento;

{$R *.dfm}

end.
