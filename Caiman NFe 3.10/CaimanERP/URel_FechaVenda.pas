unit URel_FechaVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, QRCtrls, QuickRpt, DB, ExtCtrls, UNovosComponentes, UNovoFormulario, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TfrmRel_Fechavenda = class(UNovoFormulario.TForm)
    QuickRep1: TQuickRep;
    QReceber: TFDQuery;
    QReceberCOD_CTR: TIntegerField;
    QReceberDATA_CTR: TDateField;
    QReceberVENCTO_CTR: TDateField;
    QReceberVALOR_CTR: TBCDField;
    QReceberDTPAGTO_CTR: TDateField;
    QReceberVLRPAGO_CTR: TBCDField;
    QReceberPARCELA_CTR: TIntegerField;
    QReceberPAGO: TStringField;
    DReceber: TDataSource;
    QRSubDetail2: TQRSubDetail;
    QRShape4: TQRShape;
    QRLabel27: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRSubDetail3: TQRSubDetail;
    QRShape3: TQRShape;
    QRShape7: TQRShape;
    QRLabel40: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel41: TQRLabel;
    QRDBText39: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText40: TQRDBText;
    QRLabel43: TQRLabel;
    QRDBText41: TQRDBText;
    QRLabel44: TQRLabel;
    QRDBText42: TQRDBText;
    QRLabel45: TQRLabel;
    QRDBText43: TQRDBText;
    QRShape8: TQRShape;
    QRDBText45: TQRDBText;
    QReceberCOD_VENDA: TIntegerField;
    QReceberCOD_CLI: TIntegerField;
    QReceberNOME_CLI: TStringField;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText5: TQRDBText;
    QRShape1: TQRShape;
    QRDBText44: TQRDBText;
    procedure QReceberCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRel_Fechavenda: TfrmRel_Fechavenda;

implementation

uses
  UDM;

{$R *.dfm}

procedure TfrmRel_Fechavenda.QReceberCalcFields(DataSet: TDataSet);
begin 
  if not QReceberDTPAGTO_CTR.IsNull then
    QReceberPAGO.AsString := 'PAGO'
  else
    QReceberPAGO.AsString := ''
end;

end.
