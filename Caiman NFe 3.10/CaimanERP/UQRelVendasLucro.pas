unit UQRelVendasLucro;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelVendasLucro = class(UNovoFormulario.TForm)
    QRVenda: TQuickRep;
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
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel8: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel9: TQRLabel;
    QRDBText4: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelVendasLucro: TFrmQRelVendasLucro;

implementation
Uses URelVendasLucro;

{$R *.dfm}

procedure TFrmQRelVendasLucro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

end.
