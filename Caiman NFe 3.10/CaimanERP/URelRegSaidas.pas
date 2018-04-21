unit URelRegSaidas;

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
  TFrmRelRegSaidas = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    QRel: TFDQuery;
    QRelCODIGO: TIntegerField;
    QRelORDEM: TIntegerField;
    QRelCFOP: TIntegerField;
    QRelBASE_CALCULO: TBCDField;
    QRelVALOR_ICMS: TBCDField;
    QRelISENTA_NAO_TRIBUTADA: TBCDField;
    QRelOUTRAS: TBCDField;
    QRelALIQUOTA: TBCDField;
    QRelCODIGO_EMPRESA: TIntegerField;
    QRelVALOR_TOTAL: TBCDField;
    QRelICMS_RETIDO: TBCDField;
    QRelBASE_CALCULO_RETIDO: TBCDField;
    QRelCNPJ: TStringField;
    QRelDATA: TDateField;
    QRelINSCRICAO: TStringField;
    QRelNUMERO_NOTA: TIntegerField;
    QRelSERIE_NOTA: TStringField;
    QRelSITUACAO: TStringField;
    QRelUF: TStringField;
    QRelNUMERO_NOTA_FINAL: TIntegerField;
    Rdg: TRadioGroup;
    QResumido: TFDQuery;
    QResumidoVALORCONTABIL: TBCDField;
    QResumidoBASECALCULO: TBCDField;
    QResumidoVALORICMS: TBCDField;
    QResumidoISENTAS: TBCDField;
    QResumidoOUTRAS: TBCDField;
    QResumidoCFOP: TIntegerField;
    QRelCODIFICACAO_FISCAL: TStringField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelRegSaidas: TFrmRelRegSaidas;

implementation
uses
  Udm, UQRelRegSaidas, UNovoPrincipal, UQRelRegSaidasResumido;

{$R *.dfm}

procedure TFrmRelRegSaidas.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelRegSaidas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelRegSaidas.FormShow(Sender: TObject);
begin 
   rdg.ItemIndex  := 0;
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;
   EdtDataIni.SetFocus;
end;

procedure TFrmRelRegSaidas.BtnVisClick(Sender: TObject);
begin 
   if rdg.ItemIndex = 0 then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with QRel do
            begin 
               close;
               ParamByName('dataini').AsDate  := EdtDataIni.Date;
               ParamByName('datafin').AsDate  := EdtDataFin.Date;
               ParamByName('codemp').AsInteger:= iEmp;
               open;
            end;

         Application.CreateForm(TFrmQRelRegSaidas, FrmQRelRegSaidas);
         FrmQRelRegSaidas.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
         FrmQRelRegSaidas.QRLTitulo.Caption := 'Relatório do Registro de Saidas no Período: ' +
         datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
         if sender = btnvis then
            begin 
               FrmQRelRegSaidas.QRRegSaidas.PreviewInitialState:= wsMaximized;
               FrmQRelRegSaidas.QRRegSaidas.Preview;
            end
         else
            begin 
               FrmQRelRegSaidas.QRRegSaidas.PrinterSetup;
               FrmQRelRegSaidas.QRRegSaidas.Print;
            end;
         FrmQRelRegSaidas.QRRegSaidas.QRPrinter:= nil;

         dm.IBTransaction.Commit;
         QRel.Close;
      end
   else
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with QResumido do
            begin 
               close;
               ParamByName('dataini').AsDate  := EdtDataIni.Date;
               ParamByName('datafin').AsDate  := EdtDataFin.Date;
               ParamByName('codemp').AsInteger:= iEmp;
               open;
            end;

         Application.CreateForm(TFrmQRelRegSaidasResumido, FrmQRelRegSaidasResumido);
         FrmQRelRegSaidasResumido.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
         FrmQRelRegSaidasResumido.QRLTitulo.Caption := 'Relatório do Registro de Saidas no Período: ' +
         datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
         if sender = btnvis then
            begin 
               FrmQRelRegSaidasResumido.QRRegSaidas.PreviewInitialState:= wsMaximized;
               FrmQRelRegSaidasResumido.QRRegSaidas.Preview;
            end
         else
            begin 
               FrmQRelRegSaidasResumido.QRRegSaidas.PrinterSetup;
               FrmQRelRegSaidasResumido.QRRegSaidas.Print;
            end;
         FrmQRelRegSaidasResumido.QRRegSaidas.QRPrinter:= nil;

         dm.IBTransaction.Commit;
         QResumido.Close;
      end;
end;

end.
