unit UQRelMapaDetalhado;

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
  TFrmRelMapaDetalhado = class(UNovoFormulario.TForm)
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
    Label7: TLabel;
    ComboCaixa: TComboBox;
    QRelMapa: TFDQuery;
    QRelMapaCOD_GRP: TIntegerField;
    QRelMapaTOTAL: TBCDField;
    QRelMapaNOME_GRP: TStringField;
    QRelMapaTIPO_GRP: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelMapaDetalhado: TFrmRelMapaDetalhado;

implementation

uses
  UDM, Ubibli1, URelMapaDetalhado, UNovoPrincipal;

{$R *.dfm}

procedure TFrmRelMapaDetalhado.FormCreate(Sender: TObject);
begin 
   { BUSCA CAIXA }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QCaixa do
      begin 
         close;
         sql.Clear;
         sql.Text:= 'SELECT * FROM CAIXA ' +
                    'WHERE COD_EMP = :CODEMP ' +
                    'ORDER BY COD_CAI';
         Parambyname('codemp').AsInteger:= iEmp;
         open;
         First;
         ComboCaixa.Items.Clear;
         while not eof do
            begin 
               combocaixa.Items.Add(FormataStringD(DM.QCaixaCOD_CAI.AsString, '2', '0') + '-' + dm.QCaixaDESC_CAI.AsString);
               next;
            end;
      end;
   dm.IBTransaction.Commit;
   dm.QCaixa.Close;
end;

procedure TFrmRelMapaDetalhado.FormShow(Sender: TObject);
begin 
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= Date;
   ComboCaixa.ItemIndex:= 0;
   EdtDataIni.SetFocus;
end;

procedure TFrmRelMapaDetalhado.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelMapaDetalhado.BtnVisClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRelMapa do
      begin 
         close;
         Parambyname('dataini').AsDate  := edtdataini.Date;
         Parambyname('datafin').AsDate  := EdtDataFin.Date;
         Parambyname('check').AsInteger := strtoint(copy(ComboCaixa.Text, 1, 2));
         Parambyname('codemp').AsInteger:= iEmp;
         open;
      end;
   Application.CreateForm(TFrmQRelMapaDetalhado, FrmQRelMapaDetalhado);
   FrmQRelMapaDetalhado.QRLTitulo.Caption := 'Relatório do Mapa Resumo no período: ' +
   datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
   FrmQRelMapaDetalhado.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
   FrmQRelMapaDetalhado.QRLCheckout.Caption   := ComboCaixa.Text;
   if sender = btnvis then
      begin 
         FrmQRelMapaDetalhado.QRMapa.PreviewInitialState:= wsMaximized;
         FrmQRelMapaDetalhado.QRMapa.Preview;
      end
   else
      begin 
         FrmQRelMapaDetalhado.QRMapa.PrinterSetup;
         FrmQRelMapaDetalhado.QRMapa.Print;
      end;
   FrmQRelMapaDetalhado.QRMapa.QRPrinter:= nil;
   dm.IBTransaction.Commit;
   QRelMapa.Close;
end;

procedure TFrmRelMapaDetalhado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelMapaDetalhado.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.
