unit UQRelOutrasSaidas;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelOutrasSaidas = class(UNovoFormulario.TForm)
    QROS: TQuickRep;
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
    QRGroup1: TQRGroup;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLCliente: TQRLabel;
    QRBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText5: TQRDBText;
    QRExpr3: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText6: TQRDBText;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelOutrasSaidas: TFrmQRelOutrasSaidas;

implementation
Uses URelOutrasSaidas;

{$R *.dfm}

procedure TFrmQRelOutrasSaidas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

end.
