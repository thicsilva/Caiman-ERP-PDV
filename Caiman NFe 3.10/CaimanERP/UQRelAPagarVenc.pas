unit UQRelAPagarVenc;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelAPagarVenc = class(UNovoFormulario.TForm)
    QRPagar: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText5: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLNomeEmpresa: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel5: TQRLabel;
    QRGroup1: TQRGroup;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    SummaryBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr2: TQRExpr;
    QRLTitulo: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel13: TQRLabel;
    QRLCla: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelAPagarVenc: TFrmQRelAPagarVenc;

implementation
Uses URelContasPagar;

{$R *.dfm}

procedure TFrmQRelAPagarVenc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

end.
