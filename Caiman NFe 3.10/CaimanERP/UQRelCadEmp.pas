unit UQRelCadEmp;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QuickRpt, ExtCtrls, QRCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelEmp = class(UNovoFormulario.TForm)
    QREmp: TQuickRep;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelEmp: TFrmQRelEmp;

implementation
Uses URelEmp;

{$R *.dfm}

procedure TFrmQRelEmp.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
   Action:= caFree;
end;

end.
