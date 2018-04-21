unit UTRelProdutoCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, QuickRpt, ExtCtrls, QRCtrls, UNovosComponentes, UNovoFormulario, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TfrmRelProdutoCliente = class(UNovoFormulario.TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QCliente: TFDQuery;
    QClienteCOD_CLI: TIntegerField;
    QClienteCOD_VEN: TIntegerField;
    QClienteCOD_PRO: TIntegerField;
    QClienteORDEM: TIntegerField;
    QClienteDESCONTO: TBCDField;
    QClienteCOD_EMP: TIntegerField;
    QClienteQUANT: TBCDField;
    QClienteVALOR: TBCDField;
    QClienteVALOR_CUSTO: TBCDField;
    QClientePRODUTO_PROMOCAO: TStringField;
    QClienteCANCELADO: TIntegerField;
    QClienteVENDA_CANCELADA: TIntegerField;
    QClienteCOD_VEND: TIntegerField;
    QClienteSTATUS_EXPORTA: TIntegerField;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    Cliente: TQRLabel;
    Intervalo: TQRLabel;
    IntervaloVendas: TQRLabel;
    QRBand2: TQRBand;
    Shape1: TShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QClienteNOME_PRO: TStringField;
    QRDBText4: TQRDBText;
    QClienteDATA_VEN: TDateField;
    QRDBText5: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QTotal: TFDQuery;
    QRBand3: TQRBand;
    Shape2: TShape;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QClienteTOTAL: TFMTBCDField;
    QTotalTOTAL: TFMTBCDField;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProdutoCliente: TfrmRelProdutoCliente;

implementation

uses
  UDM;

{$R *.dfm}

end.
