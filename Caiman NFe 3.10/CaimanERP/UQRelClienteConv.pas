unit UQRelClienteConv;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelClienteConvenio = class(UNovoFormulario.TForm)
    QRCli: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
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
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelClienteConvenio: TFrmQRelClienteConvenio;

implementation
Uses URecCliConv;

{$R *.dfm}

procedure TFrmQRelClienteConvenio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

end.
