unit UAlteraParcela;

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
  TFrmAlteraParcela = class(UNovoFormulario.TForm)
    QUpdValor: TFDQuery;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    EdtCod: UNovosComponentes.TEdit;
    EdtSeq: UNovosComponentes.TEdit;
    EdtDataEmi: TMaskEdit;
    EdtDataVen: TMaskEdit;
    EdtValor: TCurrencyEdit;
    EdtDataPagto: TMaskEdit;
    EdtParc: UNovosComponentes.TEdit;
    Panel2: TPanel;
    BtnOK: TBitBtn;
    BtnSair: TBitBtn;
    StatusBar1: TStatusBar;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOKClick(Sender: TObject);
    procedure EdtDataEmiExit(Sender: TObject);
    procedure EdtDataVenExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDataPagtoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AtualizarParcelas;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAlteraParcela: TFrmAlteraParcela;

implementation
uses
  Udm, UFechaVenda, UCTRDuplicata, UNovoPrincipal;
var  cOldValorParc, cDiferenca : currency;

{$R *.dfm}

procedure TFrmAlteraParcela.AtualizarParcelas;
var iQtdParc : integer;
begin 
   if FrmAlteraParcela.Tag = 0 then
      begin 
         with FrmFechaVenda.QBuscaParc do
            begin 
               Last;
               iQtdParc:= FrmFechaVenda.QBuscaParcPARCELA_CTR.AsInteger - strtoint(EdtParc.text);
               if dm.IBTransaction.Active then
                  dm.IBTransaction.Commit;
               dm.IBTransaction.StartTransaction;
               try
                 try
                   while not bof do
                      begin 
                         if FrmFechaVenda.QBuscaParcPARCELA_CTR.AsInteger > strtoint(EdtParc.text) then
                            begin 
                               QUpdValor.Close;
                               QUpdValor.ParamByName('valorctr').AsCurrency := FrmFechaVenda.QBuscaParcVALOR_CTR.AsCurrency + (strtocurr(currtostrf(cDiferenca / iQtdParc, ffFixed, 2)));
                               QUpdValor.ParamByName('codctr').AsInteger    := FrmFechaVenda.QBuscaParcCOD_CTR.AsInteger;
                               QUpdValor.ParamByName('seq').AsInteger       := FrmFechaVenda.QBuscaParcSEQUENCIA_CTR.AsInteger;
                               QUpdValor.ExecOrOpen;
                            end;
                         Prior;
                      end;
                   dm.IBTransaction.Commit;
                 except
                   dm.IBTransaction.Rollback;
                   AlertaCad('Erro ao atualizar as parcelas');
                 end;
               finally
                 QUpdValor.Close;
               end;
            end;
         end
      else
         begin 
            with FrmCTRDuplicata.QParcelas do
               begin 
                  Last;
                  iQtdParc:= FrmCTRDuplicata.QParcelasPARCELA_CTR.AsInteger - strtoint(EdtParc.text);
                  if dm.IBTransaction.Active then
                     dm.IBTransaction.Commit;
                  dm.IBTransaction.StartTransaction;
                  try
                    try
                      while not bof do
                        begin 
                            if FrmCTRDuplicata.QParcelasPARCELA_CTR.AsInteger > strtoint(EdtParc.text) then
                               begin 
                                  QUpdValor.Close;
                                  QUpdValor.ParamByName('valorctr').AsCurrency := FrmCTRDuplicata.QParcelasVALOR_CTR.AsCurrency + (strtocurr(currtostrf(cDiferenca / iQtdParc, ffFixed, 2)));
                                  QUpdValor.ParamByName('codctr').AsInteger    := FrmCTRDuplicata.QParcelasCOD_CTR.AsInteger;
                                  QUpdValor.ParamByName('seq').AsInteger       := FrmCTRDuplicata.QParcelasSEQUENCIA_CTR.AsInteger;
                                  QUpdValor.ExecOrOpen;
                               end;
                            Prior;
                         end;
                      dm.IBTransaction.Commit;
                    except
                      dm.IBTransaction.Rollback;
                      AlertaCad('Erro ao atualizar as parcelas');
                    end;
                  finally
                    QUpdValor.Close;
                  end;
               end;
         end;
end;

procedure TFrmAlteraParcela.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmAlteraParcela.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmAlteraParcela.BtnOKClick(Sender: TObject);
begin 
   if edtvalor.Text = '0' then
      begin 
         AlertaCad('Digite o valor');
//         edtvalor.SetFocus;
         exit;
      end;

   if EdtDataEmi.Text = '  /  /    ' then
      begin 
         AlertaCad('Digite a data de emissão');
//         EdtDataEmi.SetFocus;
         exit;
      end;

   if EdtDataVen.Text = '  /  /    ' then
      begin 
         AlertaCad('Digite a data de vencimento');
//         EdtDataVen.SetFocus;
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
            if FrmAlteraParcela.Tag = 0 then
               sql.Text:= 'UPDATE CONTAS_RECEBER ' +
                          'SET DATA_CTR = :DATACTR, VENCTO_CTR = :VENCTOCTR, ' +
                          'VALOR_CTR = :VALORCTR, DTPAGTO_CTR = :DTPAGTOCTR, ' +
                          'VLRPAGO_CTR = :VLRPAGOCTR ' +
                          'WHERE COD_CTR = :CODCTR AND SEQUENCIA_CTR = :SEQ'
            else
               sql.Text:= 'UPDATE CONTAS_RECEBER ' +
                          'SET DATA_CTR = :DATACTR, VENCTO_CTR = :VENCTOCTR, ' +
                          'VALOR_CTR = :VALORCTR ' +
                          'WHERE COD_CTR = :CODCTR AND SEQUENCIA_CTR = :SEQ';

            Parambyname('datactr').AsDate      := strtodate(edtdataemi.Text);
            Parambyname('venctoctr').AsDate    := strtodate(EdtDataVen.Text);
            Parambyname('valorctr').AsCurrency := strtocurr(edtvalor.Text);
            Parambyname('codctr').AsInteger    := strtoint(edtcod.Text);
            Parambyname('seq').AsInteger       := strtoint(EdtSeq.Text);

            if FrmAlteraParcela.Tag = 0 then
               begin 
                  if EdtDataPagto.Text = '  /  /    ' then
                     begin 
                        Parambyname('dtpagtoctr').Value  := null;
                        Parambyname('vlrpagoctr').Value  := null;
                     end
                  else
                     begin 
                        Parambyname('dtpagtoctr').AsDate     := strtodate(EdtDataPagto.Text);
                        Parambyname('vlrpagoctr').AsCurrency := strtocurr(edtvalor.Text);
                     end;
               end;

            ExecOrOpen;
         end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('erro ao alterar a parcela');
     end;
   finally
     dm.QConsulta.Close;
   end;

   if (StrToCurr(EdtValor.text) <> cOldValorParc) then
      begin 
         cDiferenca:= cOldValorParc - StrToCurr(EdtValor.text);
         AtualizarParcelas;
      end;

   if FrmAlteraParcela.Tag = 0 then
      FrmFechaVenda.BuscaParcelas
   else
      FrmCTRDuplicata.BtnConfirma.Click;
   close;
end;

procedure TFrmAlteraParcela.EdtDataEmiExit(Sender: TObject);
begin 
   try
     strtodate(edtdataemi.Text);
   except
     AlertaCad('Data Inválida');
//     edtdataemi.SetFocus;
   end;
end;

procedure TFrmAlteraParcela.EdtDataVenExit(Sender: TObject);
begin 
   try
     strtodate(EdtDataVen.Text);
   except
     AlertaCad('Data Inválida');
//     EdtDataVen.SetFocus;
   end;
end;

procedure TFrmAlteraParcela.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      btnsair.Click;
end;

procedure TFrmAlteraParcela.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmAlteraParcela.EdtDataPagtoExit(Sender: TObject);
begin 
   if EdtDataPagto.Text = '  /  /    ' then
      exit;
   try
     strtodate(EdtDataPagto.Text);
   except
     AlertaCad('Data Inválida');
//     EdtDataPagto.SetFocus;
   end;
end;

procedure TFrmAlteraParcela.FormShow(Sender: TObject);
begin 
   cOldValorParc:= strtocurr(EdtValor.Text);
   case FrmAlteraParcela.Tag of
     0: EdtDataPagto.Enabled:= true;
     1: EdtDataPagto.Enabled:= false;
   end;
end;

end.
