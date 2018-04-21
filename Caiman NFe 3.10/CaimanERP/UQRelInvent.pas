unit UQRelInvent;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelInvent = class(UNovoFormulario.TForm)
    QRInvent: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLNomeEmpresa: TQRLabel;
    QRShape1: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBCusto: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRDBText3: TQRDBText;
    QRExpr1: TQRExpr;
    QRLCNPJ: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    PageFooterBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel14: TQRLabel;
    QRLInscEstadual: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel3: TQRLabel;
    QRLData: TQRLabel;
    QRLGrupo1: TQRLabel;
    QRLGrupo2: TQRLabel;
    QRLGrupo3: TQRLabel;
    QRLGrupo4: TQRLabel;
    QRLGrupo5: TQRLabel;
    QRLGrupo6: TQRLabel;
    QRLGrupo7: TQRLabel;
    QRLGrupo8: TQRLabel;
    QRLGrupo9: TQRLabel;
    QRLGrupo10: TQRLabel;
    QRLTotalGrupo1: TQRLabel;
    QRLTotalGrupo2: TQRLabel;
    QRLTotalGrupo3: TQRLabel;
    QRLTotalGrupo4: TQRLabel;
    QRLTotalGrupo5: TQRLabel;
    QRLTotalGrupo6: TQRLabel;
    QRLTotalGrupo7: TQRLabel;
    QRLTotalGrupo8: TQRLabel;
    QRLTotalGrupo9: TQRLabel;
    QRLTotalGrupo10: TQRLabel;
    QRLabel15: TQRLabel;
    QRLTotalGrupo: TQRLabel;
    QRLTotalGrupos: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelInvent: TFrmQRelInvent;

implementation
Uses URelInventario;

{$R *.dfm}

procedure TFrmQRelInvent.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

end.
