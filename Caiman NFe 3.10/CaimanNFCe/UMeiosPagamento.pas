unit UMeiosPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, ACBrECFClass, ACBRECF, DB, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmMeiosPagamento = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    BtnOK: TButton;
    BtnSair: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdtDataFin: TDateTimePicker;
    EdtDataIni: TDateTimePicker;
    QMeiosPagamentos: TFDQuery;
    QMeiosPagamentosVALOR_ACUMULADO: TBCDField;
    QMeiosPagamentosTIPO_DOCUMENTO: TStringField;
    QMeiosPagamentosMEIO_PAGAMENTO: TStringField;
    QMeiosPagamentosDATA: TDateField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMeiosPagamento: TFrmMeiosPagamento;

implementation
uses
  Udm;

{$R *.dfm}

procedure TFrmMeiosPagamento.BtnOKClick(Sender: TObject);
var
     FormasPagamentoss: TACBrECFFormasPagamento;
   sIndice: string;
   Desc, TipoDo: string;
   DataA: Tdate;
   ValorT: Currency;
begin
   if iECF = 99 then
      Exit;
  // sIndice :=  DM.IndiceRelGerencial( 'OS' );
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
    QMeiosPagamentos.close;
    QMeiosPagamentos.Parambyname('dataini').AsDate := EdtDataIni.Date;
    QMeiosPagamentos.Parambyname('datafin').AsDate := EdtDataFin.Date;
    QMeiosPagamentos.open;
    { iniciando a impressao }
    FormasPagamentoss := TACBrECFFormasPagamento.Create;
         while not QMeiosPagamentos.eof do
            begin
                Desc := QMeiosPagamentosMEIO_PAGAMENTO.AsString;
                TipoDo := QMeiosPagamentosTIPO_DOCUMENTO.AsString;
                DataA := QMeiosPagamentosDATA.AsDateTime;
                ValorT := QMeiosPagamentosVALOR_ACUMULADO.AsCurrency;
                with FormasPagamentoss.New do
                    begin
                        Descricao := Desc;
                        Data      := DataA;
                        Total     := ValorT;
                        TipoDoc   := TipoDo;
                    end;
               QMeiosPagamentos.Next;
            end;

   dm.IBTransaction.Commit;
  QMeiosPagamentos.Close;

     sIndice := 'PERIODO DE '+ FormatDateTime('dd/mm/yyyy', EdtDataIni.DateTime) +' A ' + FormatDateTime('dd/mm/yyyy', EdtDatafin.DateTime);
     dm.ECF.PafMF_RelMeiosPagamento( FormasPagamentoss, sIndice);
     FormasPagamentoss.Free;
end;

procedure TFrmMeiosPagamento.BtnSairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmMeiosPagamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:= caFree;
   Self := nil;
end;

procedure TFrmMeiosPagamento.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmMeiosPagamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close;
end;

procedure TFrmMeiosPagamento.FormShow(Sender: TObject);
begin

   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;
   EdtDataIni.SetFocus;
end;

end.
