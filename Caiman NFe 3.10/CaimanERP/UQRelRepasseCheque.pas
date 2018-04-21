unit UQRelRepasseCheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, QRExport, UNovosComponentes, 
  UNovoFormulario;

type
  TFrmQRelRepasseCheque = class(UNovoFormulario.TForm)
    QRRepasse: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
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
    QRLTitulo: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel14: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRExpr1: TQRExpr;
    QRLRepasse: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelRepasseCheque: TFrmQRelRepasseCheque;

implementation
uses
  UDM;

{$R *.dfm}

procedure TFrmQRelRepasseCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

end.
