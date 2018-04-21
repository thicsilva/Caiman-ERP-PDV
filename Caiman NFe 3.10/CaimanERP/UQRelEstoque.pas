unit UQRelEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, QRExport, UNovosComponentes, 
  UNovoFormulario;

type
  TFrmQRelEstoque = class(UNovoFormulario.TForm)
    QREstoque: TQuickRep;
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
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRLTitulo: TQRLabel;
    QRLLocalEstoque: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText4: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelEstoque: TFrmQRelEstoque;

implementation
uses
  URelEstoque, Udm;

{$R *.dfm}

procedure TFrmQRelEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

end.
