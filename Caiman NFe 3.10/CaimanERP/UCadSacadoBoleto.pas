unit UCadSacadoBoleto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, ImgList, ComCtrls, ToolWin, ExtCtrls, Ubibli1, StdCtrls, 
  Mask, RxToolEdit, RxCurrEdit, UConsSacado, UNovosComponentes, UNovoFormulario, 
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, 
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, 
  acAlphaImageList, dxStatusBar, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, Data.DB, System.ImageList;

type
  TfrmCadSacadoBoleto = class(TFrmCadastroNovo)
    pgc1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    EdtCNPJ: TMaskEdit;
    Label11: TLabel;
    Label2: TLabel;
    EdtNome: TEdit;
    EdtNumero: TEdit;
    Label6: TLabel;
    EdtEnd: TEdit;
    Label14: TLabel;
    Label7: TLabel;
    EdtBai: TEdit;
    Label8: TLabel;
    EdtCid: TEdit;
    Label9: TLabel;
    ComboEst: TComboBox;
    Label10: TLabel;
    EdtCep: TMaskEdit;
    COD: UNovosComponentes.TEdit;
    Label1: TLabel;
    IBSQLSacado: TFDQuery;
    IBTRSacado: TFDTransaction;
    Label3: TLabel;
    edtBanco: TComboBox;
    Label4: TLabel;
    edtDescBanco: TEdit;
    Label5: TLabel;
    edtAgencia: TEdit;
    Label12: TLabel;
    edtAgenciaDigito: TEdit;
    Label13: TLabel;
    edtCedente: TEdit;
    Label15: TLabel;
    edtConta: TEdit;
    Label16: TLabel;
    edtContaDigito: TEdit;
    Label17: TLabel;
    edtLocalPagamento: TEdit;
    Label18: TLabel;
    edtInstrucoes: TEdit;
    edtMulta: TCurrencyEdit;
    Label19: TLabel;
    edtoValorDia: TCurrencyEdit;
    Label20: TLabel;
    Label21: TLabel;
    edtEspecie: TEdit;
    Label22: TLabel;
    edtMoeda: TEdit;
    Label24: TLabel;
    edtNossoNumero: TCurrencyEdit;
    rgAceite: TRadioGroup;
    Label23: TLabel;
    edtCarteira: TEdit;
    rgTipoImpressao: TRadioGroup;
    rgLayout: TRadioGroup;
    Label25: TLabel;
    edtDiasProtesto: TCurrencyEdit;
    Label26: TLabel;
    edtRemessas: TCurrencyEdit;
    Label27: TLabel;
    edtConvenio: TEdit;
     procedure Botoes(acao : string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure edtBancoChange(Sender: TObject);
    procedure edtBancoExit(Sender: TObject);
  private
    { Private declarations }
    bGrava: Boolean;
  public
    { Public declarations }
  end;

  function frmCadSacadoBoleto: TfrmCadSacadoBoleto;



implementation

uses
  UDM, UNovoPrincipal;

{$R *.dfm}

function frmCadSacadoBoleto: TfrmCadSacadoBoleto;
begin
   Result := TfrmCadSacadoBoleto( BuscaFormulario( TfrmCadSacadoBoleto, False  ) );
end;

procedure TfrmCadSacadoBoleto.Botoes(acao : string);
begin 
   {  (N)OVO=
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(frmCadSacadoBoleto, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(frmCadSacadoBoleto);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled := true;
          BtnConsultar.Enabled   := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(frmCadSacadoBoleto);
         EDedit(frmCadSacadoBoleto, false);
         btnNovo.Enabled      := true;
         BtnGravar.Enabled    := false;
         btnCancelar.Enabled  := false;
         if (acao = 'C') or (acao = 'E') then
            btnalterar.Enabled:= false
         else
            btnalterar.Enabled:= true;
         if acao = 'G' then
            btnExcluir.Enabled:= true
         else
            BtnExcluir.Enabled:= false;
         BtnConsultar.Enabled := true;
      end;
end;

procedure TfrmCadSacadoBoleto.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C1025','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  pgc1.ActivePageIndex:= 0;
  edtnome.SetFocus;
end;

procedure TfrmCadSacadoBoleto.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TfrmCadSacadoBoleto.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
   Application.CreateForm(TfrmConsSacado, frmConsSacado);
   frmConsSacado.Tag := 1;
   frmConsSacado.ShowModal;
   if cod.Text <> '' then
      begin 
         Botoes('G');
         edtBancoExit( nil );
      end;
end;

procedure TfrmCadSacadoBoleto.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C1025','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(frmCadSacadoBoleto, 'BOLETOS_SACADO', cod, IBSQLSacado, IBTRSacado);

  Botoes('E');
end;

procedure TfrmCadSacadoBoleto.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('C1025','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if IBTRSacado.Active then
     IBTRSacado.Commit;
  IBTRSacado.StartTransaction;
  try
  if bGrava then
     begin 
        COD.Text := inttostr(prxcod('BOLETOS_SACADO', 'COD', dm.IBTransaction, dm.ibsqlcod));
        IBSQLSacado.SQL.Clear;
        IBSQLSacado.SQL.Add( 'INSERT INTO BOLETOS_SACADO (COD, COD_EMP, BANCO, AGENCIA,' +
        ' AGENCIA_DIGITO, CODIGO_CEDENTE, CONTA, CONTA_DIGITO,' +
        ' MENSAGEM_PAGAMENTO, INSTRUCOES_DE_PAGAMENTO, MULTA_ATRASO,'+
        ' VALOR_DIA_ATRASO, ESPECIE_DOC, ESPECIE_MOEDA, ACEITE, CARTEIRA,'+
        ' NOSSO_NUMERO, SACADO_NOME, SACADO_CNPJ, SACADO_ENDERECO, SACADO_NUMERO,' +
        ' SACADO_BAIRRO, SACADO_CIDADE, SACADO_UF, SACADO_CEP, TIPO_IMPRESSAO, TIPO_REMESSA, DIAS_PROTESTO, NUMERO_REMESSA, CONVENIO)' +
        ' VALUES (:COD, :COD_EMP, :BANCO, :AGENCIA, :AGENCIA_DIGITO, :CODIGO_CEDENTE,'+
        ' :CONTA, :CONTA_DIGITO, :MENSAGEM_PAGAMENTO, :INSTRUCOES_DE_PAGAMENTO,'+
        ' :MULTA_ATRASO, :VALOR_DIA_ATRASO, :ESPECIE_DOC, :ESPECIE_MOEDA,' +
        ' :ACEITE, :CARTEIRA, :NOSSO_NUMERO, :SACADO_NOME, :SACADO_CNPJ,' +
        ' :SACADO_ENDERECO, :SACADO_NUMERO, :SACADO_BAIRRO, :SACADO_CIDADE,' +
        ' :SACADO_UF, :SACADO_CEP, :TIPO_IMPRESSAO, :TIPO_REMESSA, :DIAS_PROTESTO, :NUMERO_REMESSA, :CONVENIO);');
     end
   else
      begin 
         IBSQLSacado.SQL.Clear;
         IBSQLSacado.SQL.Add( 'UPDATE BOLETOS_SACADO SET COD_EMP = :COD_EMP, BANCO =  :BANCO, ' +
         ' AGENCIA = :AGENCIA,  AGENCIA_DIGITO = :AGENCIA_DIGITO, CODIGO_CEDENTE = :CODIGO_CEDENTE,' +
         ' CONTA = :CONTA, CONTA_DIGITO = :CONTA_DIGITO, MENSAGEM_PAGAMENTO = :MENSAGEM_PAGAMENTO, ' +
         ' INSTRUCOES_DE_PAGAMENTO = :INSTRUCOES_DE_PAGAMENTO, MULTA_ATRASO = :MULTA_ATRASO, ' +
         ' VALOR_DIA_ATRASO = :VALOR_DIA_ATRASO, ESPECIE_DOC = :ESPECIE_DOC, ESPECIE_MOEDA = :ESPECIE_MOEDA,' +
         ' ACEITE = :ACEITE, CARTEIRA = :CARTEIRA, NOSSO_NUMERO = :NOSSO_NUMERO,' +
         ' SACADO_NOME = :SACADO_NOME, SACADO_CNPJ = :SACADO_CNPJ, SACADO_ENDERECO = :SACADO_ENDERECO,' +
         ' SACADO_NUMERO = :SACADO_NUMERO, SACADO_BAIRRO = :SACADO_BAIRRO, SACADO_CIDADE = :SACADO_CIDADE,' +
         ' SACADO_UF = :SACADO_UF,  SACADO_CEP = :SACADO_CEP, TIPO_IMPRESSAO = :TIPO_IMPRESSAO,' +
         ' TIPO_REMESSA = :TIPO_REMESSA , DIAS_PROTESTO = :DIAS_PROTESTO, NUMERO_REMESSA = :NUMERO_REMESSA, CONVENIO = :CONVENIO WHERE (COD = :COD);' );
      end;

      IBSQLSacado.ParamByName( 'COD' ).AsString := cod.Text;
      IBSQLSacado.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
      IBSQLSacado.ParamByName( 'BANCO' ).AsString := edtBanco.Text;
      IBSQLSacado.ParamByName( 'AGENCIA' ).AsString := edtAgencia.Text;
      IBSQLSacado.ParamByName( 'AGENCIA_DIGITO' ).AsString := edtAgenciaDigito.Text;
      IBSQLSacado.ParamByName( 'CODIGO_CEDENTE' ).AsString := edtCedente.Text;
      IBSQLSacado.ParamByName( 'CONTA' ).AsString := edtConta.Text;
      IBSQLSacado.ParamByName( 'CONTA_DIGITO' ).AsString := edtContaDigito.Text;
      IBSQLSacado.ParamByName( 'MENSAGEM_PAGAMENTO' ).AsString := edtLocalPagamento.Text;
      IBSQLSacado.ParamByName( 'INSTRUCOES_DE_PAGAMENTO' ).AsString := edtInstrucoes.Text;
      IBSQLSacado.ParamByName( 'MULTA_ATRASO' ).AsCurrency := edtMulta.Value;
      IBSQLSacado.ParamByName( 'VALOR_DIA_ATRASO' ).AsCurrency := edtoValorDia.Value;
      IBSQLSacado.ParamByName( 'ESPECIE_DOC' ).AsString := edtEspecie.Text;
      IBSQLSacado.ParamByName( 'CONVENIO' ).AsString := edtConvenio.Text;
      IBSQLSacado.ParamByName( 'ESPECIE_MOEDA' ).AsString := edtMoeda.Text;
      case rgAceite.ItemIndex of
         0: IBSQLSacado.ParamByName( 'ACEITE' ).AsString := 'S';
         1: IBSQLSacado.ParamByName( 'ACEITE' ).AsString := 'N';
      end;
      IBSQLSacado.ParamByName( 'CARTEIRA' ).AsString := edtCarteira.Text;
      if edtNossoNumero.Text = '' then
         IBSQLSacado.ParamByName( 'NOSSO_NUMERO' ).AsString := '0'
      else
         IBSQLSacado.ParamByName( 'NOSSO_NUMERO' ).AsString := edtNossoNumero.Text;
      IBSQLSacado.ParamByName( 'SACADO_NOME' ).AsString := EdtNome.Text;
      IBSQLSacado.ParamByName( 'SACADO_CNPJ' ).AsString := EdtCNPJ.Text;
      IBSQLSacado.ParamByName( 'SACADO_ENDERECO' ).AsString := EdtEnd.Text;
      IBSQLSacado.ParamByName( 'SACADO_NUMERO' ).AsString := EdtNumero.Text ;
      IBSQLSacado.ParamByName( 'SACADO_BAIRRO' ).AsString := EdtBai.Text;
      IBSQLSacado.ParamByName( 'SACADO_CIDADE' ).AsString := EdtCid.Text;
      IBSQLSacado.ParamByName( 'SACADO_UF' ).AsString := ComboEst.Text;
      IBSQLSacado.ParamByName( 'SACADO_CEP' ).AsString := EdtCep.Text;
      IBSQLSacado.ParamByName( 'TIPO_IMPRESSAO' ).AsInteger := rgTipoImpressao.ItemIndex;
      IBSQLSacado.ParamByName( 'TIPO_REMESSA' ).AsInteger := rgLayout.ItemIndex;
      if edtDiasProtesto.Text = '' then
         IBSQLSacado.ParamByName( 'DIAS_PROTESTO' ).AsInteger := 0
      else
         IBSQLSacado.ParamByName( 'DIAS_PROTESTO' ).AsInteger := StrToInt( edtDiasProtesto.Text );
      if edtRemessas.Text = '' then
         IBSQLSacado.ParamByName( 'NUMERO_REMESSA' ).AsInteger := 0
      else
         IBSQLSacado.ParamByName( 'NUMERO_REMESSA' ).AsInteger := StrToInt( edtRemessas.Text );
      IBSQLSacado.ExecOrOpen;
      IBTRSacado.Commit;
      Botoes('G');
    except
      IBTRSacado.Rollback;
      AlertaCad('Erro ao Gravar o Sacado');
    end;
end;

procedure TfrmCadSacadoBoleto.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  if not DM.Acesso('C1025','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  pgc1.TabIndex := 0;
  edtBanco.ItemIndex := 0;
  rgAceite.ItemIndex := 0;
  rgTipoImpressao.ItemIndex := 0;
  edtnome.SetFocus;

end;

procedure TfrmCadSacadoBoleto.BtnSairClick(Sender: TObject);
begin 
  inherited;
   Close;
end;

procedure TfrmCadSacadoBoleto.edtBancoChange(Sender: TObject);
var
  I: Integer;
begin 

   try
   I :=  StrToInt( edtBanco.Text );
   case I of
      1: edtDescBanco.Text := 'Banco do Brasil';
      4: edtDescBanco.Text := 'Banco do Nordeste';
      21: edtDescBanco.Text := 'Banestes';
      33: edtDescBanco.Text := 'Santander';
      41: edtDescBanco.Text := 'Banrisul';
      70: edtDescBanco.Text := 'Banco BRB';
      104: edtDescBanco.Text := 'Caixa Econômica Federal';
      1042: edtDescBanco.Text := 'Caixa Econômica Federal SICOB';
      237: edtDescBanco.Text := 'Bradesco';
      341: edtDescBanco.Text := 'Itau';
      389: edtDescBanco.Text := 'Banco Mercantil';
      748: edtDescBanco.Text := 'Sicred';
      756: edtDescBanco.Text := 'Banco ob';
      399: edtDescBanco.Text := 'HSBC';
      else
        edtDescBanco.Text := 'Banco não Encontrado';
   end;
   except
      edtDescBanco.Text := 'Banco Inválido';
   end;
end;

procedure TfrmCadSacadoBoleto.edtBancoExit(Sender: TObject);
var
  I: Integer;
begin 

   try
   I :=  StrToInt( edtBanco.Text );
   case I of
      1: edtDescBanco.Text := 'Banco do Brasil';
      4: edtDescBanco.Text := 'Banco do Nordeste';
      21: edtDescBanco.Text := 'Banestes';
      33: edtDescBanco.Text := 'Santander';
      41: edtDescBanco.Text := 'Banrisul';
      70: edtDescBanco.Text := 'Banco BRB';
      104: edtDescBanco.Text := 'Caixa Econômica Federal';
      1042: edtDescBanco.Text := 'Caixa Econômica Federal SICOB';
      237: edtDescBanco.Text := 'Bradesco';
      341: edtDescBanco.Text := 'Itau';
      389: edtDescBanco.Text := 'Banco Mercantil';
      748: edtDescBanco.Text := 'Sicred';
      756: edtDescBanco.Text := 'Banco ob';
      399: edtDescBanco.Text := 'HSBC';
      else
        edtDescBanco.Text := 'Banco não Encontrado';
   end;
   except
      edtDescBanco.Text := 'Banco Inválido';
   end;
end;
procedure TfrmCadSacadoBoleto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  Action := caFree;
end;

procedure TfrmCadSacadoBoleto.FormShow(Sender: TObject);
begin 
  inherited;
  pgc1.ActivePageIndex:= 0;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('C1025','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             comboest.ItemIndex     := 7;
             edtnome.SetFocus;
           end;
     end
  else
     if tag = 1 then
        begin 
           Botoes('G');
           edtBancoExit( nil );
        end;
end;

end.
