unit UFechaPreVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ComCtrls, Mask, rxToolEdit, 
  rxCurrEdit;

type
  TFrmFechaPreVenda = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtnOK: TBitBtn;
    BtnSair: TBitBtn;
    MemoOBS: TMemo;
    Label38: TLabel;
    Label1: TLabel;
    EdtSenha: TEdit;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    EdtSubTotal: TCurrencyEdit;
    Label3: TLabel;
    EdtDescPerc: TCurrencyEdit;
    Label4: TLabel;
    EdtDescValor: TCurrencyEdit;
    Label5: TLabel;
    EdtTotalLiquido: TCurrencyEdit;
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtDescPercExit(Sender: TObject);
    procedure EdtDescValorExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFechaPreVenda: TFrmFechaPreVenda;

implementation
uses
  UPreVenda, Udm, UMenuFiscal;
var cDescontoPreVenda : currency;

{$R *.dfm}

procedure TFrmFechaPreVenda.FormShow(Sender: TObject);
begin

   cDescontoPreVenda:= 0;

   { busca o obs da pre_venda }
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   try
     try
       with dm.QConsultaServer do
          begin
             close;
             sql.Clear;
             sql.add('SELECT OBS_PRE FROM PRE_VENDA WHERE COD_PRE = :CODPRE');
             Parambyname('codpre').AsInteger:= strtoint(FrmPreVenda.EdtCod.Text);
             open;
             MemoOBS.Text:= fieldbyname('obs_pre').AsString;
          end;
       dm.IBTRServer.Commit;
     except
       dm.IBTRServer.Rollback;
       showmessage('Erro ao buscar a observação da pre-venda');
     end;
   finally
     dm.QConsultaServer.Close;
   end;

   EdtDescPerc.SetFocus;
end;

procedure TFrmFechaPreVenda.BtnSairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmFechaPreVenda.BtnOKClick(Sender: TObject);
var bAux : boolean;
begin
   bAux:= false;

   if trim(EdtSenha.Text) = '' then
      begin
         showmessage('Digite a Senha');
         EdtSenha.SetFocus;
         exit;
         abort;
      end;

   { Verifica se tem senha com prevenda aberta }
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   try
     try
       with dm.QConsultaServer do
          begin
             close;
             sql.Clear;
             sql.add('SELECT COD_PRE ' +
                     'FROM PRE_VENDA ' +
                     'WHERE SENHA_FECHAR_VENDA = :SENHA AND STATUS_PRE = 0');
             Parambyname('senha').AsString:= trim(EdtSenha.Text);
             Open;
             if fieldbyname('cod_pre').IsNull then
                bAux:= false
             else
                bAux:= true;
          end;
       dm.IBTRServer.Commit;
     except
       dm.IBTRServer.Rollback;
       showmessage('Erro ao verificar se existe pre-venda com a mesma senha');
     end;
   finally
     dm.QConsultaServer.Close;
   end;

   if bAux then
      begin
         showmessage('Tem pré-venda aberta com a mesma senha');
         EdtSenha.SetFocus;
         exit;
         abort;
      end;

   { ATUALIZA A PRE VENDA }
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   try
     try
       with dm.QConsultaServer do
          begin
             close;
             sql.Clear;
             sql.add('UPDATE PRE_VENDA ' +
                     'SET TOTAL_PRE = :TOTAL, DESCONTO_PRE = :DESCONTO, ' +
                     'SENHA_FECHAR_VENDA = :SENHA, OBS_PRE = :OBS       ' +
                     'WHERE COD_PRE = :CODPRE');
             Parambyname('senha').AsString:= trim(EdtSenha.Text);
             if trim(MemoOBS.Text) = '' then
                Parambyname('obs').Value:= null
             else
                Parambyname('obs').AsString     := MemoOBS.Text;
             Parambyname('codpre').AsInteger    := strtoint(FrmPreVenda.EdtCod.Text);
             Parambyname('total').AsCurrency    := (cTotalPreVenda - cDescontoPreVenda);
             Parambyname('desconto').AsCurrency := strtocurr(EdtDescValor.Text);
             ExecOrOpen;
          end;
       dm.IBTRServer.Commit;
     except
       dm.IBTRServer.Rollback;
       showmessage('Erro ao atualizar a pre-venda');
     end;
   finally
     dm.QConsultaServer.Close;
   end;

   FrmPreVenda.LimpaNovaPreVenda;
   close;
end;

procedure TFrmFechaPreVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:= caFree;
   Self := nil;
end;

procedure TFrmFechaPreVenda.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmFechaPreVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_F10 then
      begin
         Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
         FrmMenuFiscal.showmodal;
      end
   else
      if key = vk_escape then
         BtnSair.Click;
end;

procedure TFrmFechaPreVenda.EdtDescPercExit(Sender: TObject);
begin
   cDescontoPreVenda:= 0;

   if strtocurr(EdtDescPerc.Text) < 0 then
      begin
         showmessage('Valor do Desconto não pode ser negativo');
         EdtDescPerc.SetFocus;
         exit;
         abort;
      end;

   if strtocurr(EdtDescPerc.Text) > 0 then
      begin
         cDescontoPreVenda    := strtocurr(currtostrf((cTotalPreVenda * strtocurr(EdtDescPerc.text)) / 100, ffnumber, 2));
         EdtDescValor.Text    := currtostr(cDescontoPreVenda);
         EdtTotalLiquido.Text := CurrToStr(cTotalPreVenda - cDescontoPreVenda);
      end;
end;

procedure TFrmFechaPreVenda.EdtDescValorExit(Sender: TObject);
begin
   if strtocurr(EdtDescValor.Text) < 0 then
      begin
         cDescontoPreVenda:= 0;
         showmessage('Valor do Desconto não pode ser negativo');
         EdtDescValor.SetFocus;
         exit;
         abort;
      end;

   if strtocurr(EdtDescValor.Text) >= cTotalPreVenda then
      begin
         cDescontoPreVenda:= 0;
         showmessage('Desconto não pode ser maior ou igual ao total da pre venda');
         EdtDescValor.SetFocus;
         exit;
         abort;
      end;

   cDescontoPreVenda    := strtocurr(EdtDescValor.Text);
   EdtTotalLiquido.Text := currtostr(cTotalPreVenda - cDescontoPreVenda);
end;

end.
