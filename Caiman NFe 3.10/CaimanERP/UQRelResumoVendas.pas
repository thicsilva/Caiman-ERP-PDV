unit UQRelResumoVendas;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelResumoVendas = class(UNovoFormulario.TForm)
    QRVendas: TQuickRep;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLNomeEmpresa: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLTitulo: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape1: TQRShape;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelResumoVendas: TFrmQRelResumoVendas;

implementation
Uses URelResumoVendas;

{$R *.dfm}

end.
