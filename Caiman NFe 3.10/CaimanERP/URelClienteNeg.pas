unit URelClienteNeg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmRelClienteNeg = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    QRelDetalhado: TFDQuery;
    Panel2: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    RDG: TRadioGroup;
    QRelResumido: TFDQuery;
    QRelResumidoNOME_CLI: TStringField;
    QRelResumidoCOD_CLI: TIntegerField;
    QRelResumidoNASCIMENTO_CLI: TDateField;
    QRelResumidoCNPJ_CLI: TStringField;
    QRelResumidoTELRES_CLI: TStringField;
    QRelDetalhadoNOME_CLI: TStringField;
    QRelDetalhadoNOME_VEND: TStringField;
    QRelDetalhadoCOD_CTR: TIntegerField;
    QRelDetalhadoSEQUENCIA_CTR: TIntegerField;
    QRelDetalhadoCOD_EMP: TIntegerField;
    QRelDetalhadoDATA_CTR: TDateField;
    QRelDetalhadoCOD_VENDA: TIntegerField;
    QRelDetalhadoVENCTO_CTR: TDateField;
    QRelDetalhadoVALOR_CTR: TBCDField;
    QRelDetalhadoTELRES_CLI: TStringField;
    QRelDetalhadoNASCIMENTO_CLI: TDateField;
    QRelDetalhadoCNPJ_CLI: TStringField;
    QRelDetalhadoCOD_CLI: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelClienteNeg: TFrmRelClienteNeg;

implementation
uses
  Udm, UQRelNegRes, UNovoPrincipal, UQRelNegDet;

{$R *.dfm}

procedure TFrmRelClienteNeg.FormShow(Sender: TObject);
begin 
   rdg.ItemIndex:= 0;
end;

procedure TFrmRelClienteNeg.BtnVisClick(Sender: TObject);
begin 
   if rdg.ItemIndex = 0 then //resumido
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with QRelResumido do
            begin 
               close;
               open;
            end;
         Application.CreateForm(TFrmQRelNegRes, FrmQRelNegRes);
         FrmQRelNegRes.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
         if sender = btnvis then
            begin 
               FrmQRelNegRes.QRNegRes.PreviewInitialState:= wsMaximized;
               FrmQRelNegRes.QRNegRes.Preview;
            end
         else
            begin 
               FrmQRelNegRes.QRNegRes.PrinterSetup;
               FrmQRelNegRes.QRNegRes.Print;
            end;
         FrmQRelNegRes.QRNegRes.QRPrinter:= nil;
         dm.IBTransaction.Commit;
         QRelResumido.Close;
      end
   else
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with QRelDetalhado do
            begin 
               close;
               open;
            end;
         Application.CreateForm(TFrmQRelNegDet, FrmQRelNegDet);
         FrmQRelNegDet.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
         if sender = btnvis then
            begin 
               FrmQRelNegDet.QRNegDet.PreviewInitialState:= wsMaximized; 
               FrmQRelNegDet.QRNegDet.Preview;
            end
         else
            begin 
               FrmQRelNegDet.QRNegDet.PrinterSetup;
               FrmQRelNegDet.QRNegDet.Print;
            end;
         FrmQRelNegDet.QRNegDet.QRPrinter:= nil;
         dm.IBTransaction.Commit;
         QRelDetalhado.Close;
      end;
end;

procedure TFrmRelClienteNeg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelClienteNeg.FormCreate(Sender: TObject);
begin 
   
end;

procedure TFrmRelClienteNeg.BtnSairClick(Sender: TObject);
begin 
   close;
end;

end.
