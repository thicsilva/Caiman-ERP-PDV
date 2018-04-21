unit UCancNotaFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Mask, DB, rxToolEdit, 
  rxCurrEdit, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmCancNotaFiscal = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    EdtNum: UNovosComponentes.TEdit;
    BtnOK: TBitBtn;
    BtnSair: TBitBtn;
    Label1: TLabel;
    EdtEmissao: TMaskEdit;
    Label2: TLabel;
    EdtSaida: TMaskEdit;
    Label3: TLabel;
    EdtCli: TEdit;
    Label4: TLabel;
    EdtTotal: TCurrencyEdit;
    QNF: TFDQuery;
    BtnCancela: TBitBtn;
    QCancela: TFDQuery;
    Label5: TLabel;
    EdtCod: UNovosComponentes.TEdit;
    QNFCOD_NF: TIntegerField;
    QNFDATA_EMISSAO_NF: TDateField;
    QNFDATA_SAIDA_NF: TDateField;
    QNFVALOR_TOTAL_NF: TBCDField;
    QNFCANCELADA_NF: TStringField;
    QNFNOME_CLI: TStringField;
    QNFCOD_VENDA: TIntegerField;
    QNFCODIGO_OUTRA_ENTRADA: TIntegerField;
    QNFCODIGO_OUTRA_SAIDA: TIntegerField;
    QNFRAZAO_FOR: TStringField;
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnOKClick(Sender: TObject);
    procedure EdtNumKeyPress(Sender: TObject; var Key: Char);
    procedure EdtNumEnter(Sender: TObject);
    procedure BtnCancelaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure AtualizaRegistroSaidaEntrada;
    procedure CancelaVenda(const iCodigoVenda : integer);
    procedure CancelaOutraEntrada(const iCodigoOutraEntrada : integer);
    procedure CancelaOutraSaida(const iCodigoOutraSaida : integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCancNotaFiscal: TFrmCancNotaFiscal;

implementation
uses
  Udm, UNovoPrincipal;
var iAuxCodVenda, iAuxCodOE, iAuxCodOS : integer;

{$R *.dfm}

procedure TFrmCancNotaFiscal.CancelaVenda(const iCodigoVenda : integer);
begin 
   { cancela a venda e os itens - exclui contas a receber}
   with dm.QConsulta do
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         close;
         sql.Clear;
         sql.Text:= 'UPDATE VENDAS ' +
                    'SET CANCELADA_VEN = 1 ' +
                    ' WHERE COD_VEN = :COD';
         Parambyname('cod').AsInteger := iCodigoVenda;
         ExecOrOpen;
         dm.IBTransaction.Commit;

         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         close;
         sql.Clear;
         sql.Text:= 'UPDATE ITENS_VENDA ' +
                    'SET VENDA_CANCELADA = 1 ' +
                    ' WHERE COD_VEN = :COD';
         Parambyname('cod').AsInteger := iCodigoVenda;
         ExecOrOpen;
         dm.IBTransaction.Commit;

         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         close;
         sql.Clear;
         sql.Text:= 'DELETE FROM CONTAS_RECEBER ' +
                    'WHERE COD_VENDA = :COD';
         Parambyname('cod').AsInteger := iCodigoVenda;
         ExecOrOpen;
         dm.IBTransaction.Commit;

         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         close;
         sql.Clear;
         sql.Text:= 'DELETE FROM CONTAS_RECEBER_ADM_CARTAO ' +
                    'WHERE COD_VEN = :COD';
         Parambyname('cod').AsInteger := iCodigoVenda;
         ExecOrOpen;
         dm.IBTransaction.Commit;
         close;
      end;
end;

procedure TFrmCancNotaFiscal.CancelaOutraEntrada(const iCodigoOutraEntrada : integer);
begin 
   { cancela a outras entradas e os itens }
   with dm.QConsulta do
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         close;
         sql.Clear;
         sql.Text:= 'UPDATE OUTRAS_ENTRADAS ' +
                    'SET CANCELADA = 1 ' +
                    ' WHERE COD_OUTRA = :COD';
         Parambyname('cod').AsInteger := iCodigoOutraEntrada;
         ExecOrOpen;
         dm.IBTransaction.Commit;

         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         close;
         sql.Clear;
         sql.Text:= 'UPDATE ITENS_OUTRAS_ENTRADAS ' +
                    'SET CANCELADO = 1 ' +
                    ' WHERE COD_OUTRA = :COD';
         Parambyname('cod').AsInteger := iCodigoOutraEntrada;
         ExecOrOpen;
         dm.IBTransaction.Commit;
         close;
      end;
end;

procedure TFrmCancNotaFiscal.CancelaOutraSaida(const iCodigoOutraSaida : integer);
begin 
   { cancela a outras saidas e os itens }
   with dm.QConsulta do
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         close;
         sql.Clear;
         sql.Text:= 'UPDATE OUTRAS_SAIDAS ' +
                    'SET CANCELADA = 1 ' +
                    ' WHERE COD_OUTRA = :COD';
         Parambyname('cod').AsInteger := iCodigoOutraSaida;
         ExecOrOpen;
         dm.IBTransaction.Commit;

         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         close;
         sql.Clear;
         sql.Text:= 'UPDATE ITENS_OUTRAS_SAIDAS ' +
                    'SET CANCELADO = 1 ' +
                    ' WHERE COD_OUTRA = :COD';
         Parambyname('cod').AsInteger := iCodigoOutraSaida;
         ExecOrOpen;
         dm.IBTransaction.Commit;
         close;
      end;
end;

procedure TFrmCancNotaFiscal.AtualizaRegistroSaidaEntrada;
begin 
   { atualiza o registro de saida como documento cancelado }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.add('UPDATE REGISTRO_LIVRO_SAIDAS SET SITUACAO = ' + #39 + 'S' + #39 +
                     ' WHERE CODIGO_SAIDA = :COD');
             Parambyname('cod').AsInteger:= strtoint(EdtCod.Text);
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao atualizar o Livro Registro Saídas');
     end;
   finally
     dm.QConsulta.close;
   end;

   { atualiza o registro de entrada como documento cancelado }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.add('UPDATE REGISTRO_LIVRO_ENTRADAS SET SITUACAO = ' + #39 + 'S' + #39 +
                     ' WHERE CODIGO_NOTA_FISCAL = :COD');
             Parambyname('cod').AsInteger:= strtoint(EdtCod.Text);
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao atualizar o Livro Registro Saídas');
     end;
   finally
     dm.QConsulta.close;
   end;
end;

procedure TFrmCancNotaFiscal.FormShow(Sender: TObject);
begin 
   EdtNum.Clear;
   EdtEmissao.Clear;
   EdtSaida.Clear;
   EdtTotal.Clear;
   EdtCli.Clear;
   EdtCod.Clear;
   edtnum.SetFocus;
end;

procedure TFrmCancNotaFiscal.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmCancNotaFiscal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmCancNotaFiscal.BtnOKClick(Sender: TObject);
begin 
   iAuxCodVenda:= 0;
   iAuxCodOE   := 0;
   iAuxCodOS   := 0;

   if trim(edtnum.Text) = '' then
      begin 
         AlertaCad('Digite o número da Nota Fiscal');
//         EdtNum.SetFocus;
         exit;
      end;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QNF do
      begin 
         close;
         Parambyname('num').AsInteger     := strtoint(EdtNum.Text);
         Parambyname('codemp').AsInteger  := iEmp;
         open;

         if (not (QNFCOD_NF.IsNull)) and (trim(QNFCANCELADA_NF.AsString) = 'N') then
            begin 
               iAuxCodVenda    := QNFCOD_VENDA.AsInteger;
               iAuxCodOE       := QNFCODIGO_OUTRA_ENTRADA.AsInteger;
               iAuxCodOS       := QNFCODIGO_OUTRA_SAIDA.AsInteger;

               EdtEmissao.Text := QNFDATA_EMISSAO_NF.AsString;
               EdtSaida.Text   := QNFDATA_SAIDA_NF.AsString;
               EdtTotal.Text   := QNFVALOR_TOTAL_NF.AsString;
               if QNFRAZAO_FOR.IsNull then
                  EdtCli.Text  := QNFNOME_CLI.AsString
               else
                  EdtCli.Text  := QNFRAZAO_FOR.AsString;
               Edtcod.Text     := QNFCOD_NF.AsString;
               BtnCancela.Enabled:= true;
            end
         else
            begin 
               iAuxCodVenda := 0;
               iAuxCodOE    := 0;
               iAuxCodOS    := 0;

               EdtEmissao.Clear;
               EdtSaida.Clear;
               EdtTotal.Clear;
               EdtCli.Clear;
               EdtCod.clear;
               BtnCancela.Enabled:= false;
               AlertaCad('Nota Fiscal não encontrada ou cancelada');
//               EdtNum.setfocus;
            end;
      end;
   dm.IBTransaction.Commit;
   qnf.Close;
end;

procedure TFrmCancNotaFiscal.EdtNumKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key := #0;
end;

procedure TFrmCancNotaFiscal.EdtNumEnter(Sender: TObject);
begin 
   edtnum.SelectAll;
end;

procedure TFrmCancNotaFiscal.BtnCancelaClick(Sender: TObject);
begin 
   if trim(EdtCod.Text) = '' then
      exit;

   if Application.MessageBox('Confirma?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin 
        try
          try
            with QCancela do
               begin 
                  { cancela a NF }
                  if dm.IBTransaction.Active then
                     dm.IBTransaction.Commit;
                  dm.IBTransaction.StartTransaction;

                  close;
                  sql.Clear;
                  sql.Text:= 'UPDATE NOTA_FISCAL ' +
                             'SET CANCELADA_NF = ' + #39 + 'S' + #39 +
                             ' WHERE COD_NF = :COD';
                  Parambyname('cod').AsInteger := strtoint(EdtCod.text);
                  ExecOrOpen;
                  dm.IBTransaction.Commit;
                  close;

                  if iAuxCodVenda > 0 then
                     CancelaVenda(iAuxCodVenda);

                  if iAuxCodOE > 0 then
                     CancelaOutraEntrada(iAuxCodOE);

                  if iAuxCodOS > 0 then
                     CancelaOutraSaida(iAuxCodOS);
               end;
            AtualizaRegistroSaidaEntrada;
          except
            AlertaCad('Erro ao efetuar o processo');
          end;
        finally
          QCancela.close;
          EdtNum.Clear;
          EdtEmissao.Clear;
          EdtSaida.Clear;
          EdtTotal.Clear;
          EdtCli.Clear;
          EdtCod.Clear;
          StatusBar1.SimpleText:= '';
          BtnCancela.Caption:= '&Cancelar';
          edtnum.SetFocus;
        end;
     end;
end;

procedure TFrmCancNotaFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmCancNotaFiscal.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

end.
