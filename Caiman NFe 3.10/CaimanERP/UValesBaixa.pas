unit UValesBaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, Mask, 
  rxToolEdit, rxCurrEdit, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton, cxPC;

type
  TFrmValesBaixa = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Label4: TLabel;
    EdtCodFun: UNovosComponentes.TEdit;
    BtnConsFun: TsSpeedButton;
    EdtNomeFun: TEdit;
    Label5: TLabel;
    BtnOk: TButton;
    BtnSair: TButton;
    DBGrid1: TDBGrid;
    QConsVale: TFDQuery;
    DSQConsVale: TDataSource;
    QConsValeCOD_VALE: TIntegerField;
    QConsValeCOD_FUN: TIntegerField;
    QConsValeDATA_VALE: TDateField;
    QConsValeDATA_PAGTO: TDateField;
    QConsValeVALOR_VALE: TBCDField;
    QConsValeAUTORIZADO_VALE: TStringField;
    Label10: TLabel;
    EdtTotal: TCurrencyEdit;
    BtnBaixar: TButton;
    QBaixa: TFDQuery;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnConsFunClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtCodFunKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodFunKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodFunExit(Sender: TObject);
    procedure EdtCodFunEnter(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnBaixarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmValesBaixa: TFrmValesBaixa;

implementation
uses
  Udm, Ubibli1, UConsFUnc, UNovoPrincipal, UPrincipal;

{$R *.dfm}

function FrmValesBaixa: TFrmValesBaixa;
begin
   Result := TFrmValesBaixa( BuscaFormulario( TFrmValesBaixa, False ) );
end;

procedure TFrmValesBaixa.BtnSairClick(Sender: TObject);
begin 
   if Parent is TcxTabSheet then
      frmMenu.FTDI.CloseTabOfForm( TFormClass( Self.ClassType ) )
   else
      close;
end;

procedure TFrmValesBaixa.BtnConsFunClick(Sender: TObject);
begin 
   application.CreateForm(TFrmConsFunc, FrmConsFunc);
   FrmConsFunc.Tag:= 3;
   FrmConsFunc.ShowModal;
end;

procedure TFrmValesBaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QConsVale.Close;
   Action:= caFree;
end;

procedure TFrmValesBaixa.EdtCodFunKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmValesBaixa.EdtCodFunKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsFun.Click;
end;

procedure TFrmValesBaixa.EdtCodFunExit(Sender: TObject);
begin 
   if BtnSair.Focused then
     exit;
  EdtNomeFun.Text:= Consulta('funcionario', EdtCodFun, 'cod_fun', 'nome_fun', dm.IBTransaction, dm.qConsulta);
  if EdtNomeFun.Text = '' then
     begin 
        AlertaCad('Funcionário não cadastrado');
//        EdtCodFun.SetFocus;
     end;
end;

procedure TFrmValesBaixa.EdtCodFunEnter(Sender: TObject);
begin 
   EdtCodFun.SelectAll;
end;

procedure TFrmValesBaixa.BtnOkClick(Sender: TObject);
var cTotal : currency;
begin 
   cTotal:= 0;
   if EdtCodFun.Text = '' then
      begin 
         AlertaCad('Digite o código do funcionário');
//         EdtCodFun.SetFocus;
         exit;
      end;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsVale do
      begin 
         close;
         Parambyname('codfun').AsInteger:= strtoint(EdtCodFun.Text);
         open;
         while not eof do
            begin 
               cTotal:= cTotal + QConsValeVALOR_VALE.AsCurrency;
               next;
            end;
         first;
      end;
   EdtTotal.Text:= currtostr(cTotal);
end;

procedure TFrmValesBaixa.FormShow(Sender: TObject);
begin 
   EdtTotal.Clear;
   EdtCodFun.Clear;
   EdtNomeFun.Clear;
   EdtCodFun.SetFocus;
end;

procedure TFrmValesBaixa.BtnBaixarClick(Sender: TObject);
var i: integer;
begin 
   {========= VERIFICA SE TEM CONTA SELECIONADA ===========}
   i:= 0;
   with QConsVale do
      begin 
         DisableControls;
         first;
         while not eof do
            begin 
               if dbgrid1.SelectedRows.CurrentRowSelected = true then
                  inc(i);
               next;
            end;
         first;
         EnableControls;
      end;
   if i = 0 then
      begin 
         AlertaCad('Selecione o(s) Vale(s)');
         exit;
         abort;
      end;

   if application.MessageBox('Confirma a Baixa do(s) Vale(s)?', 'Baixa de Vale(s)', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton1) = 6 then
      begin 
         if dm.IBTRAux.Active then
            dm.IBTRAux.Commit;
         dm.IBTRAux.StartTransaction;
         try
           try
             with QConsVale do
                begin 
                   DisableControls;
                   first;
                   while not eof do
                      begin 
                         if dbgrid1.SelectedRows.CurrentRowSelected = true then
                            begin 
                               QBaixa.Close;
                               qbaixa.ParamByName('data').AsDate       := date;
                               Qbaixa.ParamByName('codvale').AsInteger := QConsValeCOD_VALE.AsInteger;
                               QBaixa.ExecOrOpen;
                            end;
                         next;
                      end;
                   EnableControls;
                end;
             dm.IBTRAux.Commit;
           except
             dm.IBTRAux.Rollback;
             AlertaCad('Erro ao baixar os vales');
           end;
         finally
           QBaixa.Close;
           BtnOk.Click;
         end;
      end;
end;

procedure TFrmValesBaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmValesBaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if key = #13 then
      begin 
         key:= #0;
         SelectNext(ActiveControl, true, true);
      end;
end;

end.
