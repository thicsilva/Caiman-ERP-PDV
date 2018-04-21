unit UQRelVendas;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelVendas = class(UNovoFormulario.TForm)
    QRVendas: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
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
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr: TQRExpr;
    QRDBText2: TQRDBText;
    QRLTipoVenda: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBValor: TQRDBText;
    QRLabel10: TQRLabel;
    QRLCaixa: TQRLabel;
    QRDBText3: TQRDBText;
    Totais: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelVendas: TFrmQRelVendas;

implementation
Uses URelVendas;

{$R *.dfm}

procedure TFrmQRelVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= cafree;
end;

end.
