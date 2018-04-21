unit URelRegEntradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmRelRegEntradas = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    Label1: TLabel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
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
    Rdg: TRadioGroup;
    QResCFOP: TFDQuery;
    QResCFOPVALORCONTABIL: TBCDField;
    QResCFOPBASECALCULO: TBCDField;
    QResCFOPVALORICMS: TBCDField;
    QResCFOPISENTAS: TBCDField;
    QResCFOPOUTRAS: TBCDField;
    QResCFOPCFOP: TIntegerField;
    QResNota: TFDQuery;
    QResNotaBASECALCULO: TBCDField;
    QResNotaBASERETIDO: TBCDField;
    QResNotaICMSRETIDO: TBCDField;
    QResNotaISENTAS: TBCDField;
    QResNotaOUTRAS: TBCDField;
    QResNotaVALORICMS: TBCDField;
    QResNotaVALORCONTABIL: TBCDField;
    QResNotaCODIGO: TIntegerField;
    QResNotaNUMERO_NOTA: TIntegerField;
    QResNotaSERIE_NOTA: TStringField;
    QResNotaCNPJ: TStringField;
    QResNotaDATA: TDateField;
    QResNotaINSCRICAO: TStringField;
    QResNotaSITUACAO: TStringField;
    QResNotaUF: TStringField;
    QResNotaRAZAO_FOR: TStringField;
    QResNotaCODIFICACAO_FISCAL: TStringField;
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
  FrmRelRegEntradas: TFrmRelRegEntradas;

implementation
uses
  Udm, UQRelRegEntradas, UNovoPrincipal, UQRelRegEntResumido, 
  UQRelRegEntResNota;

{$R *.dfm}

procedure TFrmRelRegEntradas.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelRegEntradas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelRegEntradas.FormShow(Sender: TObject);
begin 
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;
   rdg.ItemIndex  := 0;
   EdtDataIni.SetFocus;
end;

procedure TFrmRelRegEntradas.BtnVisClick(Sender: TObject);
begin 
   case rdg.ItemIndex of
    0:begin 
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

         Application.CreateForm(TFrmQRelRegEntradas, FrmQRelRegEntradas);
         FrmQRelRegEntradas.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
         FrmQRelRegEntradas.QRLTitulo.Caption := 'Relatório do Registro de Entradas no Período: ' +
         datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
         if sender = btnvis then
            begin 
               FrmQRelRegEntradas.QRRegEntradas.PreviewInitialState:= wsMaximized;
               FrmQRelRegEntradas.QRRegEntradas.Preview;
            end
         else
            begin 
               FrmQRelRegEntradas.QRRegEntradas.PrinterSetup;
               FrmQRelRegEntradas.QRRegEntradas.Print;
            end;
         FrmQRelRegEntradas.QRRegEntradas.QRPrinter:= nil;

         dm.IBTransaction.Commit;
         QRel.Close;
      end;
    1:begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with QResCFOP do
            begin 
               close;
               ParamByName('dataini').AsDate  := EdtDataIni.Date;
               ParamByName('datafin').AsDate  := EdtDataFin.Date;
               ParamByName('codemp').AsInteger:= iEmp;
               open;
            end;

         Application.CreateForm(TFrmQRelRegEntResumido, FrmQRelRegEntResumido);
         FrmQRelRegEntResumido.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
         FrmQRelRegEntResumido.QRLTitulo.Caption := 'Relatório do Registro de Entradas no Período: ' +
         datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
         if sender = btnvis then
            begin 
               FrmQRelRegEntResumido.QRRegEntradas.PreviewInitialState:= wsMaximized;
               FrmQRelRegEntResumido.QRRegEntradas.Preview;
            end
         else
            begin 
               FrmQRelRegEntResumido.QRRegEntradas.PrinterSetup;
               FrmQRelRegEntResumido.QRRegEntradas.Print;
            end;
         FrmQRelRegEntResumido.QRRegEntradas.QRPrinter:= nil;

         dm.IBTransaction.Commit;
         QResCFOP.Close;
      end;
    2:begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with QResNota do
            begin 
               close;
               ParamByName('dataini').AsDate  := EdtDataIni.Date;
               ParamByName('datafin').AsDate  := EdtDataFin.Date;
               ParamByName('codemp').AsInteger:= iEmp;
               open;
            end;

         Application.CreateForm(TFrmQRelRegEntResNota, FrmQRelRegEntResNota);
         FrmQRelRegEntResNota.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
         FrmQRelRegEntResNota.QRLTitulo.Caption := 'Relatório do Registro de Entradas no Período: ' +
         datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
         if sender = btnvis then
            begin 
               FrmQRelRegEntResNota.QRRegEntradas.PreviewInitialState:= wsMaximized;
               FrmQRelRegEntResNota.QRRegEntradas.Preview;
            end
         else
            begin 
               FrmQRelRegEntResNota.QRRegEntradas.PrinterSetup;
               FrmQRelRegEntResNota.QRRegEntradas.Print;
            end;
         FrmQRelRegEntResNota.QRRegEntradas.QRPrinter:= nil;

         dm.IBTransaction.Commit;
         QResNota.Close;
      end;
   end;
end;

end.
