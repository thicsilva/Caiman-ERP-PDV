unit UQRelPrecosProgramados;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelPrecosProgramados = class(UNovoFormulario.TForm)
    QRRel: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
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
    QRGroup1: TQRGroup;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelPrecosProgramados: TFrmQRelPrecosProgramados;

implementation
Uses UPrecosProgramados;

{$R *.dfm}

end.
