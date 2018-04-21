unit UQRelResInventarioPis;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelResInventarioPis = class(UNovoFormulario.TForm)
    QRInvent: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLNomeEmpresa: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLTitulo: TQRLabel;
    DetailBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLIsento: TQRLabel;
    QRLNormal: TQRLabel;
    QRLTitulo2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLTotal: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelResInventarioPis: TFrmQRelResInventarioPis;

implementation

{$R *.dfm}

end.
