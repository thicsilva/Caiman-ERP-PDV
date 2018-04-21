unit ULancContabil;

interface
                                                                                
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Mask, Buttons, ComCtrls, ExtCtrls, Grids, DBGrids, DB, 
  rxToolEdit, rxCurrEdit, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmLancContabil = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    EdtContaDeb: UNovosComponentes.TEdit;
    EdtNomeDeb: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    EdtContaCred: UNovosComponentes.TEdit;
    EdtNomeCred: TEdit;
    Label4: TLabel;
    EdtValor: TCurrencyEdit;
    Label5: TLabel;
    MemoHist: TMemo;
    BtnOK: TBitBtn;
    BtnSair: TBitBtn;
    DBGrid1: TDBGrid;
    BtnExcluir: TBitBtn;
    IBTRLan: TFDTransaction;
    Label6: TLabel;
    EdtCod: UNovosComponentes.TEdit;
    BtnCons: TsSpeedButton;
    EdtNomeLanc: TEdit;
    Label1: TLabel;
    EdtData: TMaskEdit;
    Label7: TLabel;
    EdtTotal: TCurrencyEdit;
    Label8: TLabel;
    EdtCodigo: UNovosComponentes.TEdit;
    QBuscaLan: TFDQuery;
    DSQBuscaLan: TDataSource;
    QInsLan: TFDQuery;
    QInsLanCODLAN: TIntegerField;
    IBSQLLan: TFDQuery;
    LTitulo: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    EdtTotalDeb: TCurrencyEdit;
    Label11: TLabel;
    EdtTotalCred: TCurrencyEdit;
    Label12: TLabel;
    EdtSeq: UNovosComponentes.TEdit;
    QBuscaLanCOD_LAN: TIntegerField;
    QBuscaLanCOD_EMP: TIntegerField;
    QBuscaLanDC_LAN: TIntegerField;
    QBuscaLanDATA_LAN: TDateField;
    QBuscaLanCOD_CTA: TIntegerField;
    QBuscaLanVALOR_LAN: TBCDField;
    QBuscaLanHISTORICO_LAN: TStringField;
    QBuscaLanCOD_CONTAS_PAGAR: TIntegerField;
    QBuscaLanCOD_CONTAS_RECEBER: TIntegerField;
    QBuscaLanCOD_SEQ_CONTAS_PAGAR: TIntegerField;
    QBuscaLanCOD_SEQ_CONTAS_RECEBER: TIntegerField;
    QBuscaLanCOD_FLUXO_CAIXA: TIntegerField;
    QBuscaLanNUMERO_CTA: TStringField;
    QBuscaLanNOME_CTA: TStringField;
    QBuscaLanDEBCRED: TStringField;
    procedure EdtcodExit(Sender: TObject);
    procedure BuscaConta;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure Limpa;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BuscaLan;
    procedure QBuscaLanCalcFields(DataSet: TDataSet);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MemoHistEnter(Sender: TObject);
    procedure MemoHistExit(Sender: TObject);
    procedure MemoHistKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsClick(Sender: TObject);
    procedure EdtCodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLancContabil: TFrmLancContabil;

implementation
uses
  Udm, Ubibli1, UConsLancPadrao, UNovoPrincipal;

{$R *.dfm}

procedure TFrmLancContabil.BuscaLan;
var vl_total_deb, vl_total_cred : real;
begin 
   vl_total_deb  := 0;
   vl_total_cred := 0;
   if IBTRLan.Active then
      IBTRLan.Commit;
   IBTRLan.StartTransaction;
   with QBuscaLan do
     begin 
        close;
        sql.Clear;
        sql.Add('SELECT L.*, P.NUMERO_CTA, P.NOME_CTA ' +
                'FROM LANCAMENTOS_CONTABEIS L ' +
                'INNER JOIN PLANO_CONTAS P ' +
                'ON (L.COD_CTA = P.COD_CTA)');
        case FrmLancContabil.Tag of
          0: begin 
                sql.Add(' WHERE L.COD_CONTAS_RECEBER = :1 AND COD_SEQ_CONTAS_RECEBER = :2');
                Parambyname('1').AsInteger := strtoint(edtcodigo.Text);
                Parambyname('2').AsInteger := strtoint(EdtSeq.Text);
                open;
             end;
          1: begin 
                sql.Add(' WHERE L.COD_CONTAS_PAGAR = :1 AND COD_SEQ_CONTAS_PAGAR = :2');
                Parambyname('1').AsInteger := strtoint(edtcodigo.Text);
                Parambyname('2').AsInteger := strtoint(EdtSeq.Text);
                open;
             end;
          4: begin 
                sql.Add(' WHERE L.COD_PAGAMENTO = :1 AND SEQ_PAGAMENTO = :2');
                Parambyname('1').AsInteger := strtoint(edtcodigo.Text);
                Parambyname('2').AsInteger := strtoint(EdtSeq.Text);
                open;
             end;
          6: begin 
                sql.Add(' WHERE L.COD_ENTRADA = :1');
                Parambyname('1').AsInteger := strtoint(edtcodigo.Text);
                open;
             end;
        end;
        DisableControls;
        First;
        while not eof do
           begin 
              if QBuscaLanDC_LAN.Value = 1 then
                 vl_total_deb:= vl_total_deb + QBuscaLanVALOR_LAN.Value
              else
                 vl_total_cred:= vl_total_cred + QBuscaLanVALOR_LAN.Value;
              next;
           end;
        First;
        EnableControls;
        EdtTotalDeb.Text  := floattostr(vl_total_deb);
        EdtTotalCred.Text := floattostr(vl_total_cred);
        edtcod.SetFocus;
     end;
end;

procedure TFrmLancContabil.Limpa;
begin 
   edtcod.Clear;
   EdtNomeLanc.Clear;
   EdtContaDeb.Clear;
   EdtNomeDeb.Clear;
   EdtContaCred.Clear;
   edtnomecred.Clear;
   edtvalor.Text := edttotal.Text;
   MemoHist.Clear;
end;

procedure TFrmLancContabil.BuscaConta;
begin 
   {======= Busca o Nome da Conta de Débito ========}
   if EdtContaDeb.Text <> '' then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with dm.Consulta do
            begin 
               close;
               sql.Clear;
               sql.Add('SELECT NOME_CTA FROM PLANO_CONTAS WHERE COD_CTA = :CODCTA');
               Parambyname('codcta').AsInteger := strtoint(EdtContaDeb.Text);
               ExecOrOpen;
               EdtNomeDeb.Text:= fieldbyname('nome_cta').Value;
            end;
         dm.IBTransaction.Commit;
         dm.Consulta.Close;
      end;

   {======= Busca o Nome da Conta de Crédito ========}
   if EdtContaCred.Text <> '' then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with dm.Consulta do
            begin 
               close;
               sql.Clear;
               sql.Add('SELECT NOME_CTA FROM PLANO_CONTAS WHERE COD_CTA = :CODCTA');
               Parambyname('codcta').AsInteger := strtoint(EdtContaCred.Text);
               ExecOrOpen;
               EdtNomeCred.Text:= fieldbyname('nome_cta').Value;
            end;
         dm.IBTransaction.Commit;
         dm.Consulta.Close;
      end;
end;

procedure TFrmLancContabil.EdtcodExit(Sender: TObject);
begin 
   if (BtnSair.Focused) or (DBGrid1.Focused) then
      exit;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.Consulta do
          begin 
             close;
             sql.Clear;
             sql.Add('SELECT L.*, H.NOME_HIS FROM LANCAMENTO_PADRAO L ' +
                     'INNER JOIN HISTORICO_PADRAO H ' +
                     'ON (L.COD_HIS = H.COD_HIS) ' +
                     'WHERE L.COD_LAN = :CODLAN');
             Parambyname('codlan').AsInteger := strtoint(edtcod.Text);
             ExecOrOpen;
             if recordcount > 0 then
                begin 
                   edtnomelanc.Text := fieldbyname('nome_lan').Value;
                   edtcontadeb.Text := fieldbyname('conta_debito').AsString;
                   edtcontacred.Text:= fieldbyname('conta_credito').AsString;
                   MemoHist.Text    := fieldbyname('nome_his').Value;
                end
             else
                begin 
                   EdtNomeLanc.Clear;
                   edtcontadeb.Clear;
                   EdtNomeDeb.Clear;
                   EdtContaCred.Clear;
                   EdtNomeCred.Clear;
                   MemoHist.Clear;
                   AlertaCad('Lançamento Padrão não Cadastrado');
//                   Edtcod.SetFocus;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar o Lançamento Padrão');
//       Edtcod.SetFocus;
     end;
   finally
     dm.Consulta.Close;
     BuscaConta;
   end;
end;

procedure TFrmLancContabil.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmLancContabil.BtnOKClick(Sender: TObject);
begin 
   if (EdtContaDeb.Text = '') and (EdtContaCred.Text = '') then
     begin 
        AlertaCad('Digite ao menos uma conta');
        exit;
     end;
  if MemoHist.Text = '' then
     begin 
        AlertaCad('Digite o Histórico');
        exit;
     end;

  if IBTRLan.Active then
     IBTRLan.Commit;
  IBTRLan.StartTransaction;
  try
    try
      with QInsLan do
         begin 
            Parambyname('1').Value      := EdtData.Text;
            if EdtContaDeb.Text = '' then
               Parambyname('2').Value   := null
            else
               Parambyname('2').Value   := EdtContaDeb.Text;
            if EdtContaCred.Text = '' then
               Parambyname('3').Value   := null
            else
               Parambyname('3').Value   := EdtContaCred.Text;
            Parambyname('4').Value      := EdtValor.Text;
            Parambyname('5').Value      := MemoHist.Text;
            Parambyname('6').Value      := iEmp;

            {********** CONTAS A RECEBER ************}
            if FrmLancContabil.Tag = 0 then
               begin 
                  Parambyname('8').Value   := edtcodigo.Text;
                  Parambyname('11').Value  := EdtSeq.Text;
               end
            else
               begin 
                  Parambyname('8').Value   := null;
                  Parambyname('11').Value  := null;
               end;

            {********** CONTAS A PAGAR ************}
            if FrmLancContabil.Tag = 1 then
               begin 
                  Parambyname('7').Value   := edtcodigo.Text;
                  Parambyname('10').Value  := EdtSeq.Text;
               end
            else
               begin 
                  Parambyname('7').Value   := null;
                  Parambyname('10').Value  := null;
               end;

            {********** FLUXO DE CAIXA ************}
            if FrmLancContabil.Tag = 2 then
               Parambyname('9').Value := edtcodigo.Text
            else
               Parambyname('9').Value := null;

            {********** RECEBIMENTO ************}
            if FrmLancContabil.Tag = 3 then
               begin 
                  Parambyname('12').Value   := edtcodigo.Text;
                  Parambyname('13').Value   := EdtSeq.Text;
               end
            else
               begin 
                  Parambyname('12').Value   := null;
                  Parambyname('13').Value  := null;
               end;

            {********** PAGAMENTO ************}
            if FrmLancContabil.Tag = 4 then
               begin 
                  Parambyname('14').Value   := edtcodigo.Text;
                  Parambyname('15').Value   := EdtSeq.Text;
               end
            else
               begin 
                  Parambyname('14').Value   := null;
                  Parambyname('15').Value  := null;
               end;

            {********** VENDAS ************}
            if FrmLancContabil.Tag = 5 then
               Parambyname('16').Value  := edtcodigo.Text
            else
               Parambyname('16').Value  := null;

            {********** ENTRADAS ************}
            if FrmLancContabil.Tag = 6 then
               Parambyname('18').Value  := edtcodigo.Text
            else
               Parambyname('18').Value  := null;

            {********** Contas a Receber Adm ************}
            Parambyname('17').Value  := null;

           open;
         end;
      IBTRLan.Commit;
      limpa;
    except
      IBTRLan.Rollback;
      AlertaCad('Erro ao gravar o Lançamento');
    end;
  finally
    QInsLan.Close;
    BuscaLan;
  end;
end;

procedure TFrmLancContabil.FormShow(Sender: TObject);
begin 
   Limpa;
   BuscaLan;
   edtcod.SetFocus;
end;

procedure TFrmLancContabil.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmLancContabil.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmLancContabil.QBuscaLanCalcFields(DataSet: TDataSet);
begin 
   if QBuscaLanDC_LAN.Value = 1 then
      QBuscaLanDEBCRED.Value := 'DÉBITO'
   else
      QBuscaLanDEBCRED.Value := 'CRÉDITO';
end;

procedure TFrmLancContabil.BtnExcluirClick(Sender: TObject);
var vl_cod : integer;
begin 
   if Application.MessageBox('Confirma a Exclusão do Lançamento?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         vl_cod:= QBuscaLanCOD_LAN.Value;
         if IBTRLan.Active then
            IBTRLan.Commit;
         IBTRLan.StartTransaction;
         try
           try
             with IBSQLLan do
                begin 
                   close;
                   sql.Clear;
                   sql.Add('DELETE FROM LANCAMENTOS_CONTABEIS ' +
                           'WHERE COD_LAN = :CODLAN');
                   Parambyname('codlan').AsInteger := vl_cod;
                   ExecOrOpen;
                end;
             IBTRLan.Commit;
           except
             IBTRLan.Rollback;
             AlertaCad('Erro ao Excluir o Lançamento');
           end;
         finally
           IBSQLLan.Close;
           BuscaLan;
         end;
      end;
end;

procedure TFrmLancContabil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if IBTRLan.Active then
      IBTRLan.Commit;
   QBuscaLan.Close;
   Action:= caFree;
end;

procedure TFrmLancContabil.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin 
   if (StrToFloat(edttotal.Text) <> StrToFloat(edttotaldeb.Text)) or
      (StrToFloat(edttotal.Text) <> StrToFloat(EdtTotalCred.Text)) then
      begin 
         AlertaCad('O Valor dos Lançamentos difere do Total');
         CanClose:= false;
      end;
end;

procedure TFrmLancContabil.MemoHistEnter(Sender: TObject);
begin 
   FrmLancContabil.KeyPreview:= false;
end;

procedure TFrmLancContabil.MemoHistExit(Sender: TObject);
begin 
   FrmLancContabil.KeyPreview:= true
end;

procedure TFrmLancContabil.MemoHistKeyPress(Sender: TObject;
  var Key: Char);
begin 
   Key:= Upcase(Key);
end;

procedure TFrmLancContabil.EdtCodKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmLancContabil.BtnConsClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsLancPadrao, FrmConsLancPadrao);
   FrmConsLancPadrao.Tag := 0;
   FrmConsLancPadrao.ShowModal;
end;

procedure TFrmLancContabil.EdtCodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      btncons.Click;
end;

procedure TFrmLancContabil.EdtCodEnter(Sender: TObject);
begin 
   EdtCod.SelectAll;
end;

end.
