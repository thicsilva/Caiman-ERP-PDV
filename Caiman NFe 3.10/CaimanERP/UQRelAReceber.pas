unit UQRelAReceber;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelAReceber = class(UNovoFormulario.TForm)
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
    QRLTitulo: TQRLabel;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLConv: TQRLabel;
    QRGroup1: TQRGroup;
    SummaryBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRBand1: TQRBand;
    QRLabel19: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRDBText3: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText14: TQRDBText;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLClassif: TQRLabel;
    QRVend: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel21: TQRLabel;
    QRShape3: TQRShape;
    QRLabel22: TQRLabel;
    QRDBText11: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelAReceber: TFrmQRelAReceber;

implementation
Uses URelCtr;

{$R *.dfm}

procedure TFrmQRelAReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

end.
