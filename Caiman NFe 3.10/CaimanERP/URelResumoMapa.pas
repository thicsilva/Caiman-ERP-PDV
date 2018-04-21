unit URelResumoMapa;

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
  TFrmRelResumoMapa = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    GBPeriodo: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    QRelMapa: TFDQuery;
    Rdg: TRadioGroup;
    QRelNF: TFDQuery;
    QRelNFICMS_CF_EST: TIntegerField;
    QRelNFNOME_GRP: TStringField;
    QRelNFTOTAL: TFloatField;
    QRelNFCOD_CFO: TIntegerField;
    QRelMapaCOD_GRP: TIntegerField;
    QRelMapaNOME_GRP: TStringField;
    QRelMapaTOTAL: TBCDField;
    QRelMapaTIPO_GRP: TStringField;
    QRelMapaCALC_CONTABIL: TCurrencyField;
    QRelMapaCALC_BASE_ICMS: TCurrencyField;
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QRelMapaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelResumoMapa: TFrmRelResumoMapa;

implementation
uses
  Udm, UQRelResumoMapa, UNovoPrincipal, UQRelResNFAliq;

{$R *.dfm}

procedure TFrmRelResumoMapa.FormShow(Sender: TObject);
begin 
   rdg.ItemIndex:= 0;
   edtdataini.Date:= date;
   edtdatafin.date:= date;
   edtdataini.setfocus;
end;

procedure TFrmRelResumoMapa.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelResumoMapa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRelResumoMapa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelResumoMapa.BtnVisClick(Sender: TObject);
begin 
   if Rdg.ItemIndex = 0 then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
        dm.IBTransaction.StartTransaction;
        with QRelMapa do
           begin 
              close;
              Parambyname('dataini').AsDate   := edtdataini.Date;
              Parambyname('datafin').AsDate   := EdtDataFin.Date;
              Parambyname('codemp').AsInteger := iEmp;
              open;
           end;

        Application.CreateForm(TFrmQRelResumoMapa, FrmQRelResumoMapa);
        FrmQRelResumoMapa.QRLTitulo.Caption := 'Relatório do Resumo por Alíquota no período: ' +
        datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
        FrmQRelResumoMapa.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;

        if sender = btnvis then
           begin 
              FrmQRelResumoMapa.QRResumo.PreviewInitialState:= wsMaximized;
              FrmQRelResumoMapa.QRResumo.Preview;
           end
        else
           begin 
              FrmQRelResumoMapa.QRResumo.PrinterSetup;
              FrmQRelResumoMapa.QRResumo.Print;
           end;

        FrmQRelResumoMapa.QRResumo.QRPrinter:= nil;
        dm.IBTransaction.Commit;
        QRelMapa.Close;
      end
   else
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with QRelNF do
            begin 
               close;
               Parambyname('dataini').AsDate := edtdataini.Date;
               Parambyname('datafin').AsDate := EdtDataFin.Date;
               Parambyname('codemp').AsInteger  := iEmp;
               open;
            end;

        Application.CreateForm(TFrmQRelResNFAliq, FrmQRelResNFAliq);
        FrmQRelResNFAliq.QRLTitulo.Caption := 'Resumo por Alíquota (NFs Mod.1) no período: ' +
        datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
        FrmQRelResNFAliq.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;

        if sender = btnvis then
           begin 
              FrmQRelResNFAliq.QRResumo.PreviewInitialState:= wsMaximized;
              FrmQRelResNFAliq.QRResumo.Preview;
           end
        else
           begin 
              FrmQRelResNFAliq.QRResumo.PrinterSetup;
              FrmQRelResNFAliq.QRResumo.Print;
           end;

        FrmQRelResNFAliq.QRResumo.QRPrinter:= nil;
        dm.IBTransaction.Commit;
        QRelNF.Close;
      end;
end;

procedure TFrmRelResumoMapa.FormCreate(Sender: TObject);
begin 
   
   TComboBox.Create(GBPeriodo);
end;

procedure TFrmRelResumoMapa.QRelMapaCalcFields(DataSet: TDataSet);
begin 
   if trim(QRelMapaTIPO_GRP.AsString) = 'TRI' then
      QRelMapaCALC_BASE_ICMS.AsCurrency:= QRelMapaTOTAL.AsCurrency
   else
      QRelMapaCALC_BASE_ICMS.AsCurrency:= 0;


   if (trim(QRelMapaTIPO_GRP.AsString) <> 'DES') and (trim(QRelMapaTIPO_GRP.AsString) <> 'CAN') then
      QRelMapaCALC_CONTABIL.AsCurrency:= QRelMapaTOTAL.AsCurrency
   else
      QRelMapaCALC_CONTABIL.AsCurrency:= 0;
end;

end.
