unit UQRelConvDet;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelConvDetalhado = class(UNovoFormulario.TForm)
    QRCli: TQuickRep;
    DetailBand1: TQRBand;
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
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLConv: TQRLabel;
    QRBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    SummaryBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel8: TQRLabel;
    QRLData: TQRLabel;
    QRDBText7: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelConvDetalhado: TFrmQRelConvDetalhado;

implementation
Uses URelConv;

{$R *.dfm}

procedure TFrmQRelConvDetalhado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

end.
