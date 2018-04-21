unit UQRelProdGRP;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelProdGRP = class(UNovoFormulario.TForm)
    QRProd: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
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
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLGRP: TQRLabel;
    QRLTipo: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelProdGRP: TFrmQRelProdGRP;

implementation
Uses URelProdGRP;

{$R *.dfm}

procedure TFrmQRelProdGRP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

end.
