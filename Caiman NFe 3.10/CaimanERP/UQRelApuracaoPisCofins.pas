unit UQRelApuracaoPisCofins;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, StdCtrls, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelApuracaoPisCofins = class(UNovoFormulario.TForm)
    QRApuracao: TQuickRep;
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
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLIsentasEntrada: TQRLabel;
    QRLNormalEntradas: TQRLabel;
    QRLPisEntradas: TQRLabel;
    QRLCofinsEntradas: TQRLabel;
    QRLIsentasSaidas: TQRLabel;
    QRLNormalSaidas: TQRLabel;
    QRLPisSaidas: TQRLabel;
    QRLCofinsSaidas: TQRLabel;
    QRLPis: TQRLabel;
    QRLCofins: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    DetailBand1: TQRBand;
    QRShape7: TQRShape;
    QRLabel17: TQRLabel;
    QRShape8: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLCofinsFrete: TQRLabel;
    QRLPisFrete: TQRLabel;
    QRLFrete: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelApuracaoPisCofins: TFrmQRelApuracaoPisCofins;

implementation

{$R *.dfm}

end.
