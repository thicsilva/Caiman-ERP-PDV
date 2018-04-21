unit UQRelProdutosVendidos;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelProdutosVendidos = class(UNovoFormulario.TForm)
    QRProd: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
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
    QRLabel8: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRExpr1: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelProdutosVendidos: TFrmQRelProdutosVendidos;

implementation
Uses URelProdutosVendidos;

{$R *.dfm}

procedure TFrmQRelProdutosVendidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

end.
