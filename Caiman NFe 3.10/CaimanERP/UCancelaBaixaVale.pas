unit UCancelaBaixaVale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, Mask, StdCtrls, rxToolEdit, rxCurrEdit, 
  UNovosComponentes, UNovoFormulario, cxPC;

type
  TFrmCancelaBaixaVale = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    EdtCodVale: UNovosComponentes.TEdit;
    Label2: TLabel;
    Label4: TLabel;
    EdtCodFun: UNovosComponentes.TEdit;
    Label5: TLabel;
    EdtNomeFun: TEdit;
    Label10: TLabel;
    EdtValor: TCurrencyEdit;
    Label3: TLabel;
    EdtAutorizado: TEdit;
    EdtData: TEdit;
    BtnOk: TButton;
    BtnSair: TButton;
    Label6: TLabel;
    EdtDataPagto: TEdit;
    procedure EdtCodValeExit(Sender: TObject);
    procedure EdtCodValeKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmCancelaBaixaVale: TFrmCancelaBaixaVale;

implementation
uses
  Udm, Ubibli1, UNovoPrincipal, UPrincipal;
var bAux : boolean;

{$R *.dfm}

function FrmCancelaBaixaVale: TFrmCancelaBaixaVale;
begin
   Result := TFrmCancelaBaixaVale( BuscaFormulario( TFrmCancelaBaixaVale, False ) );
end;

procedure TFrmCancelaBaixaVale.EdtCodValeExit(Sender: TObject);
begin 
   if BtnSair.Focused then
      exit;
   if EdtCodVale.Text = '' then
      begin 
         EdtCodVale.SetFocus;
         exit;
      end;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.add('SELECT V.*, F.NOME_FUN ' +
                     'FROM VALES_FUNCIONARIO V ' +
                     'INNER JOIN FUNCIONARIO F ' +
                     'ON (V.COD_FUN = F.COD_FUN) ' +
                     'WHERE V.COD_VALE = :CODVALE AND V.DATA_PAGTO IS NOT NULL');
             Parambyname('codvale').AsInteger:= strtoint(EdtCodVale.Text);
             Open;
             if not fieldbyname('cod_vale').IsNull then
                begin 
                   bAux               := true;
                   EdtData.Text       := fieldbyname('data_vale').AsString;
                   EdtDataPagto.Text  := fieldbyname('data_pagto').AsString;
                   EdtCodFun.Text     := fieldbyname('cod_vale').AsString;
                   EdtNomeFun.Text    := fieldbyname('nome_fun').AsString;
                   EdtValor.Text      := fieldbyname('valor_vale').AsString;
                   EdtAutorizado.Text := fieldbyname('autorizado_vale').AsString;
                end
             else
                begin 
                   bAux:= false;
                   AlertaCad('Lançamento não encontrado');
                   Limpaedit(FrmCancelaBaixaVale);
//                   EdtCodVale.SetFocus;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       bAux:= false;
       AlertaCad('Erro ao buscar o lançamento');
       Limpaedit(FrmCancelaBaixaVale);
//       EdtCodVale.SetFocus;
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmCancelaBaixaVale.EdtCodValeKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmCancelaBaixaVale.BtnSairClick(Sender: TObject);
begin 
   if Parent is TcxTabSheet then
      frmMenu.FTDI.CloseTabOfForm( TFormClass( Self.ClassType ) )
   else
      close;
end;

procedure TFrmCancelaBaixaVale.FormKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if key = #13 then
      begin 
         key:= #0;
         SelectNext(ActiveControl, true, true);
      end;
end;

procedure TFrmCancelaBaixaVale.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmCancelaBaixaVale.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmCancelaBaixaVale.FormShow(Sender: TObject);
begin 
   bAux:= false;
   Limpaedit(FrmCancelaBaixaVale);
   EdtCodVale.SetFocus;
end;

procedure TFrmCancelaBaixaVale.BtnOkClick(Sender: TObject);
begin 
   if bAux then
      begin 
         if application.MessageBox('Confirma a Baixa do(s) Vale(s)?', 'Baixa de Vale(s)', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton1) = 6 then
            begin 
               if dm.IBTransaction.Active then
                  dm.IBTransaction.Commit;
               dm.IBTransaction.StartTransaction;
               try
                 try
                   with dm.QConsulta do
                      begin 
                         close;
                         sql.Clear;
                         sql.add('UPDATE VALES_FUNCIONARIO SET DATA_PAGTO = NULL ' +
                                 'WHERE COD_VALE = :CODVALE');
                         Parambyname('codvale').AsInteger:= strtoint(EdtCodVale.Text);
                         ExecOrOpen;
                      end;
                   dm.IBTransaction.Commit;
                   Limpaedit(FrmCancelaBaixaVale);
                   EdtCodVale.SetFocus;
                 except
                   dm.IBTransaction.Rollback;
                 end;
               finally
                 dm.QConsulta.Close;
               end;
            end;
      end;
end;

end.
