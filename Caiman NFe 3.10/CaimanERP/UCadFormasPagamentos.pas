unit UCadFormasPagamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, ImgList, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask, 
  Buttons, acAlphaImageList, UNovosComponentes, UNovoFormulario, cxGraphics, 
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, 
  dxSkinMetropolis, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, 
  dxSkinOffice2013White, dxSkinsdxStatusBarPainter, dxStatusBar, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton,
  dxSkinMetropolisDark, Data.DB;

type
  TFrmCadFormaPagamento = class(TFrmCadastroNovo)
    IBSQLForma: TFDQuery;
    IBTRForma: TFDTransaction;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    codigo: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    Label3: TLabel;
    ComboTipo: TComboBox;
    Label4: TLabel;
    ComboTabelaPreco: TComboBox;
    CheckTEF: TCheckBox;
    CheckGaveta: TCheckBox;
    CheckPAF: TCheckBox;
    CheckContasReceber: TCheckBox;
    CheckContasPagar: TCheckBox;
    CheckDesconto: TCheckBox;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    BtnConsContaVendas: TsSpeedButton;
    Label9: TLabel;
    Label11: TLabel;
    BtnConsCentroCustoVendas: TsSpeedButton;
    Label12: TLabel;
    EdtCodCentroCustoVendas: TEdit;
    EdtCodContaVendas: UNovosComponentes.TEdit;
    EdtNomeContaVendas: TEdit;
    EdtCentroCustoVendas: TMaskEdit;
    EdtNomeCentroVendas: TEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    BtnConsContaCTR: TsSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    BtnConsCentroCustoCTR: TsSpeedButton;
    Label10: TLabel;
    EdtCodCentroCustoCTR: TEdit;
    EdtCodContaCTR: UNovosComponentes.TEdit;
    EdtNomeContaCTR: TEdit;
    EdtCentroCustoCTR: TMaskEdit;
    EdtNomeCentroCustoCTR: TEdit;
    GroupBox3: TGroupBox;
    Label13: TLabel;
    BtnConsContaCTP: TsSpeedButton;
    Label14: TLabel;
    EdtCodContaCTP: UNovosComponentes.TEdit;
    EdtNomeContaCTP: TEdit;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Label17: TLabel;
    BtnConsContaCTREstorno: TsSpeedButton;
    Label18: TLabel;
    Label19: TLabel;
    BtnConsCentroCustoCTREstorno: TsSpeedButton;
    Label20: TLabel;
    EdtCodCentroCustoCTREstorno: TEdit;
    EdtCodContaCTREstorno: UNovosComponentes.TEdit;
    EdtNomeContaCTREstorno: TEdit;
    EdtCentroCustoCTREstorno: TMaskEdit;
    EdtNomeCentroCustoCTREstorno: TEdit;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    Label21: TLabel;
    BtnConsContaCTPEstorno: TsSpeedButton;
    Label22: TLabel;
    Label23: TLabel;
    BtnConsCentroCustoCTPEstorno: TsSpeedButton;
    Label24: TLabel;
    EdtCodCentroCustoCTPEstorno: TEdit;
    EdtCodContaCTPEstorno: UNovosComponentes.TEdit;
    EdtNomeContaCTPEstorno: TEdit;
    EdtCentroCustoCTPEstorno: TMaskEdit;
    EdtNomeCentroCustoCTPEstorno: TEdit;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    Label25: TLabel;
    BtnConsContaVendasEstorno: TsSpeedButton;
    Label26: TLabel;
    Label27: TLabel;
    BtnConsCentroCustoVendasEstorno: TsSpeedButton;
    Label28: TLabel;
    EdtCodCentroCustoVendasEstorno: TEdit;
    EdtCodContaVendasEstorno: UNovosComponentes.TEdit;
    EdtNomeContaVendasEstorno: TEdit;
    EdtCentroCustoVendasEstorno: TMaskEdit;
    EdtNomeCentroCustoVendasEstorno: TEdit;
    procedure Botoes(acao : string);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    function BuscaFormaCadastrada(const sTipo : string) : integer;
    procedure EdtCodContaVendasKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodContaVendasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodContaVendasExit(Sender: TObject);
    procedure EdtCodContaVendasEnter(Sender: TObject);
    procedure BtnConsContaVendasClick(Sender: TObject);
    procedure EdtCentroCustoVendasExit(Sender: TObject);
    procedure BtnConsCentroCustoVendasClick(Sender: TObject);
    procedure BtnConsContaCTRClick(Sender: TObject);
    procedure BtnConsContaCTPClick(Sender: TObject);
    procedure BtnConsCentroCustoCTRClick(Sender: TObject);
    procedure BtnConsCentroCustoCTPClick(Sender: TObject);
    procedure EdtCentroCustoCTRExit(Sender: TObject);
    procedure EdtCodContaCTREnter(Sender: TObject);
    procedure EdtCodContaCTPEnter(Sender: TObject);
    procedure EdtCodContaCTRExit(Sender: TObject);
    procedure EdtCodContaCTPExit(Sender: TObject);
    procedure EdtCodContaCTRKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodContaCTPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BuscaCentroCusto(const iCodigo, iTag : integer);
    procedure BtnConsContaCTREstornoClick(Sender: TObject);
    procedure BtnConsContaCTPEstornoClick(Sender: TObject);
    procedure BtnConsCentroCustoCTREstornoClick(Sender: TObject);
    procedure BtnConsCentroCustoCTPEstornoClick(Sender: TObject);
    procedure EdtCodContaCTREstornoEnter(Sender: TObject);
    procedure EdtCodContaCTPEstornoEnter(Sender: TObject);
    procedure EdtCodContaCTREstornoExit(Sender: TObject);
    procedure EdtCodContaCTPEstornoExit(Sender: TObject);
    procedure EdtCodContaCTREstornoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodContaCTPEstornoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCentroCustoCTREstornoExit(Sender: TObject);
    procedure EdtCentroCustoCTPEstornoExit(Sender: TObject);
    procedure BtnConsContaVendasEstornoClick(Sender: TObject);
    procedure BtnConsCentroCustoVendasEstornoClick(Sender: TObject);
    procedure EdtCodContaVendasEstornoEnter(Sender: TObject);
    procedure EdtCodContaVendasEstornoExit(Sender: TObject);
    procedure EdtCodContaVendasEstornoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCentroCustoVendasEstornoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmCadFormaPagamento: TFrmCadFormaPagamento;

implementation
uses
  Udm, Ubibli1, UConsFormasPagamento, UConsConta, UConsCentroCusto, 
  UNovoPrincipal;
var  bGrava : boolean;

{$R *.dfm}

function FrmCadFormaPagamento: TFrmCadFormaPagamento;
begin
   Result := TFrmCadFormaPagamento( BuscaFormulario(  TFrmCadFormaPagamento, False ) );
end;

procedure TFrmCadFormaPagamento.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadFormaPagamento, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadFormaPagamento);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadFormaPagamento);
         EDedit(FrmCadFormaPagamento, false);
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

procedure TFrmCadFormaPagamento.BuscaCentroCusto(const iCodigo, iTag : integer);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.clear;
             sql.Text:= 'SELECT DESCRICAO, CONTA ' +
                        'FROM CENTRO_CUSTO ' +
                        'WHERE CODIGO = :COD';
             Parambyname('cod').AsInteger:= iCodigo;
             open;
             case iTag of
                1: begin 
                      EdtCentroCustoVendas.Text:= fieldbyname('conta').AsString;
                      EdtNomeCentroVendas.Text  := fieldbyname('descricao').AsString;
                   end;
                2: begin 
                      EdtCentroCustoCTR.Text:= fieldbyname('conta').AsString;
                      EdtNomeCentroCustoCTR.Text  := fieldbyname('descricao').AsString;
                   end;
                4: begin 
                      EdtCentroCustoCTREstorno.Text    := fieldbyname('conta').AsString;
                      EdtNomeCentroCustoCTREstorno.Text:= fieldbyname('descricao').AsString;
                   end;
                5: begin 
                      EdtCentroCustoCTPEstorno.Text     := fieldbyname('conta').AsString;
                      EdtNomeCentroCustoCTPEstorno.Text := fieldbyname('descricao').AsString;
                   end;
                6: begin 
                      EdtCentroCustoVendasEstorno.Text     := fieldbyname('conta').AsString;
                      EdtNomeCentroCustoVendasEstorno.Text := fieldbyname('descricao').AsString;
                   end;
             end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar o centro de custo');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmCadFormaPagamento.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('C236','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             edtnome.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');

  if trim(EdtCodContaVendas.Text) <> '' then
     EdtCodContaVendasExit(self);
  if trim(EdtCodContaCTR.Text) <> '' then
     EdtCodContaCTRExit(self);
  if trim(EdtCodContaCTP.Text) <> '' then
     EdtCodContaCTPExit(self);
  if trim(EdtCodContaCTREstorno.Text) <> '' then
     EdtCodContaCTREstornoExit(self);
  if trim(EdtCodContaCTPEstorno.Text) <> '' then
     EdtCodContaCTPEstornoExit(self);
  if trim(EdtCodContaVendasEstorno.Text) <> '' then
     EdtCodContaVendasEstornoExit(self);

  if trim(EdtCodCentroCustoVendas.Text) <> '' then
     BuscaCentroCusto(strtoint(EdtCodCentroCustoVendas.Text), 1);
  if trim(EdtCodCentroCustoCTR.Text) <> '' then
     BuscaCentroCusto(strtoint(EdtCodCentroCustoCTR.Text), 2);
  if trim(EdtCodCentroCustoCTREstorno.Text) <> '' then
     BuscaCentroCusto(strtoint(EdtCodCentroCustoCTREstorno.Text), 4);
  if trim(EdtCodCentroCustoCTPEstorno.Text) <> '' then
     BuscaCentroCusto(strtoint(EdtCodCentroCustoCTPEstorno.Text), 5);
  if trim(EdtCodCentroCustoVendasEstorno.Text) <> '' then
     BuscaCentroCusto(strtoint(EdtCodCentroCustoVendasEstorno.Text), 6);
end;

procedure TFrmCadFormaPagamento.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  if not DM.Acesso('C236','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  PageControl1.ActivePageIndex:= 0;
  edtnome.SetFocus;
end;

procedure TFrmCadFormaPagamento.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
  PageControl1.ActivePageIndex:= 0;
end;

procedure TFrmCadFormaPagamento.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C236','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  PageControl1.ActivePageIndex:= 0;
  edtnome.SetFocus;
end;

procedure TFrmCadFormaPagamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRForma.Active then
     IBTRForma.Commit;
  IBSQLForma.Close;
  Action:= caFree;
end;

procedure TFrmCadFormaPagamento.BtnGravarClick(Sender: TObject);
var iAuxCodForma : integer;
begin 
  inherited;
  iAuxCodForma:= 0;

  if (bGrava) and (not DM.Acesso('C236','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;

  if edtnome.Text = '' then
     begin 
        AlertaCad('Digite o Nome da Conta');
//        edtnome.SetFocus;
        exit;
     end;

  { verifica se é dinheiro e se ja existe }
  if ComboTipo.ItemIndex = 0 then
     begin 
        iAuxCodForma:= BuscaFormaCadastrada('DN');

        if (bGrava) and (iAuxCodForma > 0) then
           begin 
              AlertaCad('Forma de pagamento com tipo Dinheiro já cadastrada no código: ' + inttostr(iAuxCodForma));
              exit;
           end;
        if (not bGrava) and ((iAuxCodForma > 0) and (iAuxCodForma <> strtoint(codigo.Text))) then
           begin 
              AlertaCad('Forma de pagamento com tipo Dinheiro já cadastrada no código: ' + inttostr(iAuxCodForma));
              exit;
           end;
     end;

  { verifica se é troco e se ja existe }
  if ComboTipo.ItemIndex = 7 then
     begin 
        iAuxCodForma:= BuscaFormaCadastrada('TR');

        if (bGrava) and (iAuxCodForma > 0) then
           begin 
              AlertaCad('Forma de pagamento com tipo Troco já cadastrada no código: ' + inttostr(iAuxCodForma));
              exit;
           end;
        if (not bGrava) and ((iAuxCodForma > 0) and (iAuxCodForma <> strtoint(codigo.Text))) then
           begin 
              AlertaCad('Forma de pagamento com tipo Troco já cadastrada no código: ' + inttostr(iAuxCodForma));
              exit;
           end;
     end;


  if IBTRForma.Active then
     IBTRForma.Commit;
  IBTRForma.StartTransaction;
  try
    try
      with IBSQLForma do
        begin 
           close;
           sql.Clear;
           if bGrava then
              begin 
                 codigo.Text:= inttostr(prxcod('formas_pagamento', 'codigo', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO FORMAS_PAGAMENTO(CODIGO,              ' +
                                                     ' DESCRICAO,           ' +
                                                     ' TIPO,                ' +
                                                     ' USA_TEF,             ' +
                                                     ' ABRE_GAVETA,         ' +
                                                     ' USAR_CONTAS_RECEBER, ' +
                                                     ' USAR_CONTAS_PAGAR,   ' +
                                                     ' TABELA_PRECO,        ' +
                                                     ' CONCEDER_DESCONTO,   ' +
                                                     ' CODIGO_CONTA_VENDAS, ' +
                                                     ' CODIGO_CENTRO_CUSTO_VENDAS, ' +
                                                     ' CODIGO_CONTA_CTR,           ' +
                                                     ' CODIGO_CONTA_CTP,           ' +
                                                     ' CODIGO_CENTRO_CUSTO_CTR,    ' +
                                                     ' CODIGO_CONTA_CTR_ESTORNO,   ' +
                                                     ' CODIGO_CONTA_CTP_ESTORNO,   ' +
                                                     ' CODIGO_CENTRO_CUSTO_CTR_ESTORNO, ' +
                                                     ' CODIGO_CENTRO_CUSTO_CTP_ESTORNO, ' +
                                                     ' CODIGO_CONTA_VEN_ESTORNO,        ' +
                                                     ' CODIGO_CENTRO_CUSTO_VEN_ESTORNO, ' +
                                                     ' USAR_PAF_ECF)               ' +
                         'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11, :12, :13, ' +
                                 ':14, :16, :17, :18, :19, :20, :21, :22)');
              end
           else
              begin 
                 sql.Add('UPDATE FORMAS_PAGAMENTO SET DESCRICAO           = :2,  ' +
                                                    ' TIPO                = :3,  ' +
                                                    ' USA_TEF             = :4,  ' +
                                                    ' ABRE_GAVETA         = :5,  ' +
                                                    ' USAR_CONTAS_RECEBER = :6,  ' +
                                                    ' USAR_CONTAS_PAGAR   = :7,  ' +
                                                    ' TABELA_PRECO        = :8,  ' +
                                                    ' CONCEDER_DESCONTO   = :9,  ' +
                                                    ' CODIGO_CONTA_VENDAS = :10, ' +
                                                    ' CODIGO_CENTRO_CUSTO_VENDAS = :11,      ' +
                                                    ' CODIGO_CONTA_CTR = :12,                ' +
                                                    ' CODIGO_CONTA_CTP = :13,                ' +
                                                    ' CODIGO_CENTRO_CUSTO_CTR = :14,         ' +
                                                    ' CODIGO_CONTA_CTR_ESTORNO = :16,        ' +
                                                    ' CODIGO_CONTA_CTP_ESTORNO = :17,        ' +
                                                    ' CODIGO_CENTRO_CUSTO_CTR_ESTORNO = :18, ' +
                                                    ' CODIGO_CENTRO_CUSTO_CTP_ESTORNO = :19, ' +
                                                    ' CODIGO_CONTA_VEN_ESTORNO = :20,        ' +
                                                    ' CODIGO_CENTRO_CUSTO_VEN_ESTORNO = :21, ' +
                                                    ' USAR_PAF_ECF = :22             ' +
                         'WHERE CODIGO = :1');

              end;
           Parambyname('1').AsInteger     := strtoint(codigo.Text);
           Parambyname('2').AsString      := trim(edtnome.Text);
           case ComboTipo.ItemIndex of
             0: Parambyname('3').AsString := 'DN';
             1: Parambyname('3').AsString := 'PR';
             2: Parambyname('3').AsString := 'CH';
             3: Parambyname('3').AsString := 'CA';
             4: Parambyname('3').AsString := 'BO';
             5: Parambyname('3').AsString := 'TI';
             6: Parambyname('3').AsString := 'CV';
             7: Parambyname('3').AsString := 'TR';
             8: Parambyname('3').AsString := 'CC';
             9: Parambyname('3').AsString := 'TV';
           end;

           if CheckTEF.Checked then
              Parambyname('4').AsString  := 'S'
           else
              Parambyname('4').AsString  := 'N';

           if CheckGaveta.Checked then
              Parambyname('5').AsString  := 'S'
           else
              Parambyname('5').AsString  := 'N';

           if CheckContasReceber.Checked then
              Parambyname('6').AsString  := 'S'
           else
              Parambyname('6').AsString  := 'N';

           if CheckContasPagar.Checked then
              Parambyname('7').AsString  := 'S'
           else
              Parambyname('7').AsString  := 'N';

           Parambyname('8').AsInteger    := ComboTabelaPreco.ItemIndex;

           if CheckDesconto.Checked then
              Parambyname('9').AsString  := 'S'
           else
              Parambyname('9').AsString  := 'N';

           if trim(EdtCodContaVendas.Text) = '' then
              Parambyname('10').Value      := null
           else
              Parambyname('10').AsInteger  := strtoint(EdtCodContaVendas.Text);

           if trim(EdtCodCentroCustoVendas.Text) = '' then
              Parambyname('11').Value      := null
           else
              Parambyname('11').AsInteger  := strtoint(EdtCodCentroCustoVendas.Text);

           if trim(EdtCodContaCTR.Text) = '' then
              Parambyname('12').Value      := null
           else
              Parambyname('12').AsInteger  := strtoint(EdtCodContaCTR.Text);

           if trim(EdtCodContaCTP.Text) = '' then
              Parambyname('13').Value      := null
           else
              Parambyname('13').AsInteger  := strtoint(EdtCodContaCTP.Text);

           if trim(EdtCodCentroCustoCTR.Text) = '' then
              Parambyname('14').Value      := null
           else
              Parambyname('14').AsInteger  := strtoint(EdtCodCentroCustoCTR.Text);

           if trim(EdtCodContaCTREstorno.Text) = '' then
              Parambyname('16').Value      := null
           else
              Parambyname('16').AsInteger  := strtoint(EdtCodContaCTREstorno.Text);

           if trim(EdtCodContaCTPEstorno.Text) = '' then
              Parambyname('17').Value      := null
           else
              Parambyname('17').AsInteger  := strtoint(EdtCodContaCTPEstorno.Text);

           if trim(EdtCodCentroCustoCTREstorno.Text) = '' then
              Parambyname('18').Value      := null
           else
              Parambyname('18').AsInteger  := strtoint(EdtCodCentroCustoCTREstorno.Text);

           if trim(EdtCodCentroCustoCTPEstorno.Text) = '' then
              Parambyname('19').Value      := null
           else
              Parambyname('19').AsInteger  := strtoint(EdtCodCentroCustoCTPEstorno.Text);

           if trim(EdtCodContaVendasEstorno.Text) = '' then
              Parambyname('20').Value      := null
           else
              Parambyname('20').AsInteger  := strtoint(EdtCodContaVendasEstorno.Text);

           if trim(EdtCodCentroCustoVendasEstorno.Text) = '' then
              Parambyname('21').Value      := null
           else
              Parambyname('21').AsInteger  := strtoint(EdtCodCentroCustoVendasEstorno.Text);

           if CheckPAF.Checked then
              Parambyname('22').AsString  := 'S'
           else
              Parambyname('22').AsString  := 'N';

           ExecOrOpen;
        end;
      IBTRForma.Commit;
      Botoes('G');
      PageControl1.ActivePageIndex:= 0;
    except
      IBTRForma.Rollback;
      AlertaCad('Erro ao Gravar a Forma de Pagamento');
    end;
  finally
    IBSQLForma.Close;
  end;
end;

procedure TFrmCadFormaPagamento.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C236','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadFormaPagamento, 'Formas_pagamento', codigo, IBSQLForma, IBTRForma);
  Botoes('E');
  PageControl1.ActivePageIndex:= 0;
end;

procedure TFrmCadFormaPagamento.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsFormasPagamento, FrmConsFormasPagamento);
  FrmConsFormasPagamento.tag:= 0;
  FrmConsFormasPagamento.showmodal;
end;

function TFrmCadFormaPagamento.BuscaFormaCadastrada(const sTipo : string) : integer;
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
             sql.Text:= 'SELECT CODIGO ' +
                        'FROM FORMAS_PAGAMENTO ' +
                        'WHERE TIPO = ' + #39 + trim(sTipo) + #39;
             open;
             result:= fieldbyname('codigo').AsInteger;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       result:= 0;
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmCadFormaPagamento.EdtCodContaVendasKeyPress(Sender: TObject;
  var Key: Char);
begin 
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmCadFormaPagamento.EdtCodContaVendasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsContaVendas.Click;
end;

procedure TFrmCadFormaPagamento.EdtCodContaVendasExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;

  if trim(EdtCodContaVendas.Text) = '' then
     begin 
        EdtNomeContaVendas.Clear;
        exit;
     end;

  EdtNomeContaVendas.Text:= Consulta('contas_corrente', EdtCodContaVendas, 'cod_conta', 'nome_conta', dm.IBTransaction, dm.qConsulta);
  if EdtNomeContaVendas.Text = '' then
     begin 
        AlertaCad('Conta não Cadastrada');
//        EdtCodContaVendas.SetFocus;
     end;
end;

procedure TFrmCadFormaPagamento.EdtCodContaVendasEnter(Sender: TObject);
begin 
  inherited;
  EdtCodContaVendas.SelectAll;
end;

procedure TFrmCadFormaPagamento.BtnConsContaVendasClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsConta, FrmConsConta);
  FrmConsConta.tag:= 10;
  FrmConsConta.showmodal;
end;

procedure TFrmCadFormaPagamento.EdtCentroCustoVendasExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;

  if trim(EdtCentroCustoVendas.Text) = '' then
     begin 
        EdtNomeCentroVendas.Clear;
        EdtCodCentroCustoVendas.Clear;
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
            sql.Text:= 'SELECT CODIGO, DESCRICAO, TIPO ' +
                       'FROM CENTRO_CUSTO ' +
                       'WHERE CONTA = ' + #39 + EdtCentroCustoVendas.Text + #39;
            open;
            if not (fieldbyname('codigo').IsNull) then
               begin 
                  if trim(fieldbyname('tipo').AsString) = 'A' then
                     begin 
                        EdtCodCentroCustoVendas.Text := fieldbyname('codigo').AsString;
                        EdtNomeCentroVendas.Text     := fieldbyname('descricao').AsString;
                     end
                  else
                     begin 
                        AlertaCad('Conta Sintética');
                        EdtNomeCentroVendas.Clear;
                        EdtCentroCustoVendas.SetFocus;
                     end;
               end
            else
               begin 
                  EdtCodCentroCustoVendas.Clear;
                  EdtCentroCustoVendas.Clear;
                  EdtNomeCentroVendas.Clear;
                  AlertaCad('Centro de custo não cadastrado');
//                  EdtCentroCustoVendas.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('erro ao buscar o centro de custo');
    end;
  finally
    dm.QConsulta.Close;
  end;
end;

procedure TFrmCadFormaPagamento.BtnConsCentroCustoVendasClick(
  Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCentroCusto, FrmConsCentroCusto);
  FrmConsCentroCusto.Tag:= 2;
  FrmConsCentroCusto.ShowModal;
end;

procedure TFrmCadFormaPagamento.BtnConsContaCTRClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsConta, FrmConsConta);
  FrmConsConta.tag:= 11;
  FrmConsConta.showmodal;
end;

procedure TFrmCadFormaPagamento.BtnConsContaCTPClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsConta, FrmConsConta);
  FrmConsConta.tag:= 12;
  FrmConsConta.showmodal;
end;

procedure TFrmCadFormaPagamento.BtnConsCentroCustoCTRClick(
  Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCentroCusto, FrmConsCentroCusto);
  FrmConsCentroCusto.Tag:= 3;
  FrmConsCentroCusto.ShowModal;
end;

procedure TFrmCadFormaPagamento.BtnConsCentroCustoCTPClick(
  Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCentroCusto, FrmConsCentroCusto);
  FrmConsCentroCusto.Tag:= 4;
  FrmConsCentroCusto.ShowModal;
end;

procedure TFrmCadFormaPagamento.EdtCentroCustoCTRExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;

  if trim(EdtCentroCustoCTR.Text) = '' then
     begin 
        EdtCodCentroCustoCTR.Clear;
        EdtNomeCentroCustoCTR.Clear;
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
            sql.Text:= 'SELECT CODIGO, DESCRICAO, TIPO ' +
                       'FROM CENTRO_CUSTO ' +
                       'WHERE CONTA = ' + #39 + EdtCentroCustoCTR.Text + #39;
            open;
            if not (fieldbyname('codigo').IsNull) then
               begin 
                  if trim(fieldbyname('tipo').AsString) = 'A' then
                     begin 
                        EdtCodCentroCustoCTR.Text   := fieldbyname('codigo').AsString;
                        EdtNomeCentroCustoCTR.Text  := fieldbyname('descricao').AsString;
                     end
                  else
                     begin 
                        AlertaCad('Conta Sintética');
                        EdtNomeCentroCustoCTR.Clear;
//                        EdtCentroCustoCTR.SetFocus;
                     end;
               end
            else
               begin 
                  EdtCodCentroCustoCTR.Clear;
                  EdtCentroCustoCTR.Clear;
                  EdtNomeCentroCustoCTR.Clear;
                  AlertaCad('Centro de custo não cadastrado');
//                  EdtCentroCustoCTR.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('erro ao buscar o centro de custo');
    end;
  finally
    dm.QConsulta.Close;
  end;
end;

procedure TFrmCadFormaPagamento.EdtCodContaCTREnter(Sender: TObject);
begin 
  inherited;
  EdtCodContaCTR.SelectAll; 
end;

procedure TFrmCadFormaPagamento.EdtCodContaCTPEnter(Sender: TObject);
begin 
  inherited;
  EdtCodContaCTP.SelectAll;
end;

procedure TFrmCadFormaPagamento.EdtCodContaCTRExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;

  if trim(EdtCodContaCTR.Text) = '' then
     begin 
        EdtNomeContaCTR.Clear;
        exit;
     end;

  EdtNomeContaCTR.Text:= Consulta('contas_corrente', EdtCodContaCTR, 'cod_conta', 'nome_conta', dm.IBTransaction, dm.qConsulta);
  if EdtNomeContaCTR.Text = '' then
     begin 
        AlertaCad('Conta não Cadastrada');
//        EdtCodContaCTR.SetFocus;
     end;
end;

procedure TFrmCadFormaPagamento.EdtCodContaCTPExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;

  if trim(EdtCodContaCTP.Text) = '' then
     begin 
        EdtNomeContaCTP.Clear;
        exit;
     end;

  EdtNomeContaCTP.Text:= Consulta('contas_corrente', EdtCodContaCTP, 'cod_conta', 'nome_conta', dm.IBTransaction, dm.qConsulta);
  if EdtNomeContaCTP.Text = '' then
     begin 
        AlertaCad('Conta não Cadastrada');
//        EdtCodContaCTP.SetFocus;
     end;
end;

procedure TFrmCadFormaPagamento.EdtCodContaCTRKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsContaCTR.Click;
end;

procedure TFrmCadFormaPagamento.EdtCodContaCTPKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsContaCTP.Click;
end;

procedure TFrmCadFormaPagamento.FormCreate(Sender: TObject);
begin 
  inherited;
  PageControl1.ActivePageIndex:= 0;
end;

procedure TFrmCadFormaPagamento.BtnConsContaCTREstornoClick(
  Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsConta, FrmConsConta);
  FrmConsConta.tag:= 13;
  FrmConsConta.showmodal;
end;

procedure TFrmCadFormaPagamento.BtnConsContaCTPEstornoClick(
  Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsConta, FrmConsConta);
  FrmConsConta.tag:= 14;
  FrmConsConta.showmodal;
end;

procedure TFrmCadFormaPagamento.BtnConsCentroCustoCTREstornoClick(
  Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCentroCusto, FrmConsCentroCusto);
  FrmConsCentroCusto.Tag:= 5;
  FrmConsCentroCusto.ShowModal;
end;

procedure TFrmCadFormaPagamento.BtnConsCentroCustoCTPEstornoClick(
  Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCentroCusto, FrmConsCentroCusto);
  FrmConsCentroCusto.Tag:= 6;
  FrmConsCentroCusto.ShowModal;
end;

procedure TFrmCadFormaPagamento.EdtCodContaCTREstornoEnter(
  Sender: TObject);
begin 
  inherited;
  EdtCodContaCTREstorno.SelectAll;
end;

procedure TFrmCadFormaPagamento.EdtCodContaCTPEstornoEnter(
  Sender: TObject);
begin 
  inherited;
  EdtCodContaCTPEstorno.SelectAll;
end;

procedure TFrmCadFormaPagamento.EdtCodContaCTREstornoExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;

  if trim(EdtCodContaCTREstorno.Text) = '' then
     begin 
        EdtNomeContaCTREstorno.Clear;
        exit;
     end;

  EdtNomeContaCTREstorno.Text:= Consulta('contas_corrente', EdtCodContaCTREstorno, 'cod_conta', 'nome_conta', dm.IBTransaction, dm.qConsulta);
  if EdtNomeContaCTREstorno.Text = '' then
     begin 
        AlertaCad('Conta não Cadastrada');
//        EdtCodContaCTREstorno.SetFocus;
     end;
end;

procedure TFrmCadFormaPagamento.EdtCodContaCTPEstornoExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;

  if trim(EdtCodContaCTPEstorno.Text) = '' then
     begin 
        EdtNomeContaCTPEstorno.Clear;
        exit;
     end;

  EdtNomeContaCTPEstorno.Text:= Consulta('contas_corrente', EdtCodContaCTPEstorno, 'cod_conta', 'nome_conta', dm.IBTransaction, dm.qConsulta);
  if EdtNomeContaCTPEstorno.Text = '' then
     begin 
        AlertaCad('Conta não Cadastrada');
//        EdtCodContaCTPEstorno.SetFocus;
     end;
end;

procedure TFrmCadFormaPagamento.EdtCodContaCTREstornoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsContaCTREstorno.Click;
end;

procedure TFrmCadFormaPagamento.EdtCodContaCTPEstornoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsContaCTPEstorno.Click;
end;

procedure TFrmCadFormaPagamento.EdtCentroCustoCTREstornoExit(
  Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;

  if trim(EdtCentroCustoCTREstorno.Text) = '' then
     begin 
        EdtCodCentroCustoCTREstorno.Clear;
        EdtNomeCentroCustoCTREstorno.Clear;
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
            sql.Text:= 'SELECT CODIGO, DESCRICAO, TIPO ' +
                       'FROM CENTRO_CUSTO ' +
                       'WHERE CONTA = ' + #39 + EdtCentroCustoCTREstorno.Text + #39;
            open;
            if not (fieldbyname('codigo').IsNull) then
               begin 
                  if trim(fieldbyname('tipo').AsString) = 'A' then
                     begin 
                        EdtCodCentroCustoCTREstorno.Text   := fieldbyname('codigo').AsString;
                        EdtNomeCentroCustoCTREstorno.Text  := fieldbyname('descricao').AsString;
                     end
                  else
                     begin 
                        AlertaCad('Conta Sintética');
                        EdtNomeCentroCustoCTREstorno.Clear;
//                        EdtCentroCustoCTREstorno.SetFocus;
                     end;
               end
            else
               begin 
                  EdtCodCentroCustoCTREstorno.Clear;
                  EdtCentroCustoCTREstorno.Clear;
                  EdtNomeCentroCustoCTREstorno.Clear;
                  AlertaCad('Centro de custo não cadastrado');
//                  EdtCentroCustoCTREstorno.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('erro ao buscar o centro de custo');
    end;
  finally
    dm.QConsulta.Close;
  end;
end;

procedure TFrmCadFormaPagamento.EdtCentroCustoCTPEstornoExit(
  Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;

  if trim(EdtCentroCustoCTPEstorno.Text) = '' then
     begin 
        EdtCodCentroCustoCTPEstorno.Clear;
        EdtNomeCentroCustoCTPEstorno.Clear;
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
            sql.Text:= 'SELECT CODIGO, DESCRICAO, TIPO ' +
                       'FROM CENTRO_CUSTO ' +
                       'WHERE CONTA = ' + #39 + EdtCentroCustoCTPEstorno.Text + #39;
            open;
            if not (fieldbyname('codigo').IsNull) then
               begin 
                  if trim(fieldbyname('tipo').AsString) = 'A' then
                     begin 
                        EdtCodCentroCustoCTPEstorno.Text   := fieldbyname('codigo').AsString;
                        EdtNomeCentroCustoCTPEstorno.Text  := fieldbyname('descricao').AsString;
                     end
                  else
                     begin 
                        AlertaCad('Conta Sintética');
                        EdtNomeCentroCustoCTPEstorno.Clear;
//                        EdtCentroCustoCTPEstorno.SetFocus;
                     end;
               end
            else
               begin 
                  EdtCodCentroCustoCTPEstorno.Clear;
                  EdtCentroCustoCTPEstorno.Clear;
                  EdtNomeCentroCustoCTPEstorno.Clear;
                  AlertaCad('Centro de custo não cadastrado');
//                  EdtCentroCustoCTPEstorno.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('erro ao buscar o centro de custo');
    end;
  finally
    dm.QConsulta.Close;
  end;
end;

procedure TFrmCadFormaPagamento.BtnConsContaVendasEstornoClick(
  Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsConta, FrmConsConta);
  FrmConsConta.tag:= 15;
  FrmConsConta.showmodal;
end;

procedure TFrmCadFormaPagamento.BtnConsCentroCustoVendasEstornoClick(
  Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCentroCusto, FrmConsCentroCusto);
  FrmConsCentroCusto.Tag:= 7;
  FrmConsCentroCusto.ShowModal;
end;

procedure TFrmCadFormaPagamento.EdtCodContaVendasEstornoEnter(
  Sender: TObject);
begin 
  inherited;
  EdtCodContaVendasEstorno.SelectAll;
end;

procedure TFrmCadFormaPagamento.EdtCodContaVendasEstornoExit(
  Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;

  if trim(EdtCodContaVendasEstorno.Text) = '' then
     begin 
        EdtNomeContaVendasEstorno.Clear;
        exit;
     end;

  EdtNomeContaVendasEstorno.Text:= Consulta('contas_corrente', EdtCodContaVendasEstorno, 'cod_conta', 'nome_conta', dm.IBTransaction, dm.qConsulta);
  if EdtNomeContaVendasEstorno.Text = '' then
     begin 
        AlertaCad('Conta não Cadastrada');
//        EdtCodContaVendasEstorno.SetFocus;
     end;
end;

procedure TFrmCadFormaPagamento.EdtCodContaVendasEstornoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsContaVendasEstorno.Click;
end;

procedure TFrmCadFormaPagamento.EdtCentroCustoVendasEstornoExit(
  Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;

  if trim(EdtCentroCustoVendasEstorno.Text) = '' then
     begin 
        EdtCodCentroCustoVendasEstorno.Clear;
        EdtNomeCentroCustoVendasEstorno.Clear;
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
            sql.Text:= 'SELECT CODIGO, DESCRICAO, TIPO ' +
                       'FROM CENTRO_CUSTO ' +
                       'WHERE CONTA = ' + #39 + EdtCentroCustoVendasEstorno.Text + #39;
            open;
            if not (fieldbyname('codigo').IsNull) then
               begin 
                  if trim(fieldbyname('tipo').AsString) = 'A' then
                     begin 
                        EdtCodCentroCustoVendasEstorno.Text   := fieldbyname('codigo').AsString;
                        EdtNomeCentroCustoVendasEstorno.Text  := fieldbyname('descricao').AsString;
                     end
                  else
                     begin 
                        AlertaCad('Conta Sintética');
                        EdtNomeCentroCustoVendasEstorno.Clear;
                        EdtCentroCustoVendasEstorno.SetFocus;
                     end;
               end
            else
               begin 
                  EdtCodCentroCustoVendasEstorno.Clear;
                  EdtCentroCustoVendasEstorno.Clear;
                  EdtNomeCentroCustoVendasEstorno.Clear;
                  AlertaCad('Centro de custo não cadastrado');
//                  EdtCentroCustoVendasEstorno.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('erro ao buscar o centro de custo');
    end;
  finally
    dm.QConsulta.Close;
  end;
end;

end.

