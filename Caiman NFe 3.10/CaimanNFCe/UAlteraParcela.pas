unit UAlteraParcela;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Mask, rxToolEdit, rxCurrEdit, 
  DB, UVendasCaixa, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmAlteraParcela = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    BtnOK: TBitBtn;
    BtnSair: TBitBtn;
    Label1: TLabel;
    EdtCod: TEdit;
    Label2: TLabel;
    EdtSeq: TEdit;
    Label3: TLabel;
    EdtDataEmi: TMaskEdit;
    Label4: TLabel;
    EdtDataVen: TMaskEdit;
    Label6: TLabel;
    EdtValor: TCurrencyEdit;
    QUpdParc: TFDQuery;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOKClick(Sender: TObject);
    procedure EdtDataEmiExit(Sender: TObject);
    procedure EdtDataVenExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAlteraParcela: TFrmAlteraParcela;

implementation
uses
  Udm, UDadosCliente, UMenuFiscal;

{$R *.dfm}

procedure TFrmAlteraParcela.BtnSairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmAlteraParcela.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:= caFree;
   Self := nil;
end;

procedure TFrmAlteraParcela.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmAlteraParcela.BtnOKClick(Sender: TObject);
begin
   if edtvalor.Text = '0' then
      begin
         showmessage('Digite o valor');
         edtvalor.SetFocus;
      end;
   if EdtDataEmi.Text = '  /  /    ' then
      begin
         showmessage('Digite a data de emissão');
         EdtDataEmi.SetFocus;
      end;
   if EdtDataVen.Text = '  /  /    ' then
      begin
         showmessage('Digite a data de vencimento');
         EdtDataVen.SetFocus;
      end;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QUpdParc do
         begin
            Parambyname('datactr').Value     := edtdataemi.Text;
            Parambyname('venctoctr').Value   := EdtDataVen.Text;
            Parambyname('valorctr').Value    := edtvalor.Text;
            Parambyname('codctr').Value      := edtcod.Text;
            Parambyname('seq').Value         := EdtSeq.Text;
            ExecOrOpen;
         end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('erro ao alterar a parcela');
     end;
   finally
     QUpdParc.Close;
     FrmDadosCliente.BuscaParcelas;
   end;
   close;
end;

procedure TFrmAlteraParcela.EdtDataEmiExit(Sender: TObject);
begin
   try
     strtodate(edtdataemi.Text);
   except
     showmessage('Data Inválida');
     edtdataemi.SetFocus;
   end;
end;

procedure TFrmAlteraParcela.EdtDataVenExit(Sender: TObject);
begin
   try
     strtodate(EdtDataVen.Text);
   except
     showmessage('Data Inválida');
     EdtDataVen.SetFocus;
   end;
end;

procedure TFrmAlteraParcela.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      btnsair.Click;
   if (ssAlt in Shift) and (chr(Key) in ['M', 'm']) then
      begin
         if (iCodPreVenda = 0) and (iCodOrcamento = 0) and (iCodOrdemServico = 0) and (iCodigoVenda = 0) and (iCodContaCliente = 0) then
            begin
               Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
               FrmMenuFiscal.showmodal;
            end;
      end;

end;

procedure TFrmAlteraParcela.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

end.
