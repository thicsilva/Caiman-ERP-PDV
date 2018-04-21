unit UQRelPagasFor;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelPagasFor = class(UNovoFormulario.TForm)
    QRPagas: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
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
    QRLTitulo: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRGroup1: TQRGroup;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRBand1: TQRBand;
    QRLabel7: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel12: TQRLabel;
    QRLCla: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRExpr5: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelPagasFor: TFrmQRelPagasFor;

implementation
Uses URelPagas;

{$R *.dfm}

procedure TFrmQRelPagasFor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

end.
