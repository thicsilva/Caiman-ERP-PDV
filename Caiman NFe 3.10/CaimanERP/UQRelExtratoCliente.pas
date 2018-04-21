unit UQRelExtratoCliente;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelExtratoCliente = class(UNovoFormulario.TForm)
    QRCli: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLNomeEmpresa: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLCli: TQRLabel;
    QRLTitulo: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel10: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLBruAReceber: TQRLabel;
    QRLBruRecebido: TQRLabel;
    QRLJurosAReceber: TQRLabel;
    QRLJurosRecebido: TQRLabel;
    QRLLiqRec: TQRLabel;
    QRLLiqARec: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel24: TQRLabel;
    QRLDevARec: TQRLabel;
    QRLabel26: TQRLabel;
    QRLDevRec: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    QRLDescRec: TQRLabel;
    QRLDescARec: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelExtratoCliente: TFrmQRelExtratoCliente;

implementation
Uses URelExtratoCliente;

{$R *.dfm}

procedure TFrmQRelExtratoCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

end.
