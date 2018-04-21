unit UFechaVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, Buttons, StdCtrls, Mask, rxToolEdit, rxCurrEdit, Grids, DB, 
  DBClient, DBGrids, ACBrECF, ACBrDevice, ACBrTEFD, ACBrTEFDClass, ACBrUtil, 
  ACBrTEFDCliSiTef, ACBrBase, DateUtils, acPNG, sLabel, UDialog, NxCollection, 
  RzCmboBx, jpeg, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;


type
  TFrmFechaVenda = class(TForm)
    QBuscaItens: TFDQuery;
    QBuscaItensCOD_VEN: TIntegerField;
    QBuscaItensCOD_PRO: TIntegerField;
    QBuscaItensORDEM: TIntegerField;
    QBuscaItensQUANT: TBCDField;
    QBuscaItensVALOR: TBCDField;
    QBuscaItensDESCONTO: TBCDField;
    QBuscaItensNOME_PRO: TStringField;
    QBuscaItensTOTAL: TFloatField;
    QBuscaItensCOD_EMP: TIntegerField;
    QBuscaItensVALOR_CUSTO: TBCDField;
    CDSFormas: TClientDataSet;
    CDSFormasCODIGO: TIntegerField;
    CDSFormasDESCRICAO: TStringField;
    DSFormas: TDataSource;
    CDSFormasUSA_TEF: TStringField;
    CDSFormasABRE_GAVETA: TStringField;
    CDSFormasINDICE: TStringField;
    CDSFormasTIPO: TStringField;
    CDSFormasDESCRICAO_ECF: TStringField;
    CDSFormasCONCEDER_DESCONTO: TStringField;
    ACBrTEFD1: TACBrTEFD;
    imgFecha: TImage;
    DBGridFormas: TDBGrid;
    EdtTroco: TCurrencyEdit;
    BtnOk: TBitBtn;
    EdtPercentualDesconto: TCurrencyEdit;
    EdtValorDesconto: TCurrencyEdit;
    sLabelFX1: TsLabelFX;
    sLabelFX2: TsLabelFX;
    sLabelFX3: TsLabelFX;
    sLabelFX4: TsLabelFX;
    edtPago: TCurrencyEdit;
    sLabelFX5: TsLabelFX;
    edtTotVenda: TCurrencyEdit;
    bCancelarResp: TBitBtn;
    CDSFormasVALORANTIGO: TCurrencyField;
    CDSFormasATUALIZA: TStringField;
    CDSFormasTAVA: TStringField;
    CDSFormasVALOR: TCurrencyField;
    opValeok: TImage;
    opValeno: TImage;
    sLabelFX6: TsLabelFX;
    dsF: TClientDataSet;
    dsFcod: TIntegerField;
    dsFvalor: TCurrencyField;
    IBTRParc: TFDTransaction;
    QGeraParc: TFDQuery;
    QDelParcelas: TFDQuery;
    IBSQLCheque: TFDQuery;
    IBTRLancCheque: TFDTransaction;
    pnlMoedas: TNxHeaderPanel;
    cbbMoedas: TRzComboBox;
    edtValor: TCurrencyEdit;
    QAux: TFDQuery;
    ScrollMoedas: TScrollBox;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnPagamentoMoedas: TBitBtn;
    qMovimento: TFDQuery;
    qMovimentoCODIGO: TIntegerField;
    Query: TFDQuery;

    procedure PanelDescontos( Valor: Boolean );
    procedure FormShow(Sender: TObject);
    procedure EdtValorDescontoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtPercentualDescontoExit(Sender: TObject);
    procedure EdtValorDescontoExit(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AtualizaVenda;
    procedure QBuscaItensCalcFields(DataSet: TDataSet);
    function  TotalizaCupom : integer;
    function  EfetuaPagamentos : integer;
    function  FechaCupom : integer;
    function  ImprimePromissoria( Valor: Double ) : integer;
    function  TotalizaFormasPagamento(const sTipo : string) : currency;
    procedure FormasComDesconto;
    procedure AbreGavetaFormas;
    procedure DBGridFormasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormasPagamento;
    procedure FormCreate(Sender: TObject);
    procedure CDSFormasAfterOpen(DataSet: TDataSet);
    procedure CalculaTroco;
    procedure DBGridFormasExit(Sender: TObject);
    procedure DBGridFormasEnter(Sender: TObject);
    procedure DBGridFormasColEnter(Sender: TObject);
    procedure LimpaGridPagamentos;
    procedure ACBrTEFD1AguardaResp(Arquivo: string; SegundosTimeOut: Integer;
      var Interromper: Boolean);
    procedure ACBrTEFD1AntesCancelarTransacao(RespostaPendente: TACBrTEFDResp);
    procedure ACBrTEFD1BloqueiaMouseTeclado(Bloqueia: Boolean;
      var Tratado: Boolean);
    procedure ACBrTEFD1ComandaECF(Operacao: TACBrTEFDOperacaoECF;
      Resp: TACBrTEFDResp; var RetornoECF: Integer);
    procedure ACBrTEFD1ComandaECFAbreVinculado(COO, IndiceECF: string;
      Valor: Double; var RetornoECF: Integer);
    procedure ACBrTEFD1ComandaECFImprimeVia(
      TipoRelatorio: TACBrTEFDTipoRelatorio; Via: Integer;
      ImagemComprovante: TStringList; var RetornoECF: Integer);
    procedure ACBrTEFD1ComandaECFPagamento(IndiceECF: string; Valor: Double;
      var RetornoECF: Integer);
    procedure ACBrTEFD1DepoisConfirmarTransacoes(
      RespostasPendentes: TACBrTEFDRespostasPendentes);
    procedure ACBrTEFD1ExibeMsg(Operacao: TACBrTEFDOperacaoMensagem;
      Mensagem: string; var AModalResult: TModalResult);
    procedure ACBrTEFD1InfoECF(Operacao: TACBrTEFDInfoECF;
      var RetornoECF: string);
    procedure ACBrTEFD1MudaEstadoReq(EstadoReq: TACBrTEFDReqEstado);
    procedure ACBrTEFD1MudaEstadoResp(EstadoResp: TACBrTEFDRespEstado);
    procedure ACBrTEFD1RestauraFocoAplicacao(var Tratado: Boolean);
    procedure bCancelarRespClick(Sender: TObject);
    procedure ACBrTEFD1DepoisCancelarTransacoes(
      RespostasPendentes: TACBrTEFDRespostasPendentes);
    procedure ACBrTEFD1AntesFinalizarRequisicao(Req: TACBrTEFDReq);
    procedure ACBrTEFD1VeSPagueExibeMenu(Titulo: string; Opcoes,
      Memo: TStringList; var ItemSelecionado: Integer);
    procedure ACBrTEFD1VeSPagueObtemCampo(Titulo, Mascara: string;
      Tipo: AnsiChar; var Resposta: string; var Digitado: Boolean);
    procedure FazPagamentosVirtuais;
    procedure ACBrTEFD1ComandaECFSubtotaliza(DescAcre: Double;
      var RetornoECF: Integer);
    procedure CDSFormasVALORSetText(Sender: TField; const Text: string);
    procedure ACBrTEFD1CliSiTefObtemCampo(Titulo: string; TamanhoMinimo,
      TamanhoMaximo, TipoCampo: Integer;
      Operacao: TACBrTEFDCliSiTefOperacaoCampo; var Resposta: AnsiString;
      var Digitado, VoltarMenu: Boolean);
    procedure ACBrTEFD1CliSiTefExibeMenu(Titulo: string; Opcoes: TStringList;
      var ItemSelecionado: Integer; var VoltarMenu: Boolean);
    procedure ContabilizaAlterados;
    procedure GravaTrocoCartaoH2( Valor: Double );
    procedure ImprimeContraVale( Valor: Double );
    procedure CDSFormasBeforePost(DataSet: TDataSet);
    procedure CDSFormasAfterPost(DataSet: TDataSet);
    procedure CalcTrocoTemp;
    procedure DeleteParcelas;
    procedure ProcessaVendaTxt;
    procedure FazPagamentosAdiantamentos;
    procedure btnPagamentoMoedasClick(Sender: TObject);
    procedure AbreMoedas;
    procedure AtualizaLabelMoeda( Descricao: string; Valor: Currency );
    procedure cbbMoedasChange(Sender: TObject);
    procedure ZeraFormas;
    procedure cbbMoedasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

    TrocoJanela: Double;
    MostrarTroco: Boolean;
    fopvale: Boolean;
    procedure setOpvale( value: Boolean );

  public
    { Public declarations }
    fCancelado: Boolean;
    ValorTemp: Double;
    Ativa: Boolean;
    property opVale: Boolean read FopVale write SetopVale;
  end;

var
   CTotalInformado: Currency;
  FrmFechaVenda: TFrmFechaVenda;
  cDescontoVenda    : currency;
  cTefAutorizado    : Currency;
  cTefTroco         : Currency;
  bDescontoLiberado : boolean;
  RetornoTEF : TStringList;
  sNomeCliente, sEndCliente, sDocCliente : string;
  iQuantidadeTransacoesTEFCupom : integer;
  TEF1Autorizado: Boolean;

implementation
uses
  Udm, UVendasCaixa, UDadosCliente, ULancCheques, UsenhaLiberarVenda, UDadosAdm, 
  Ubibli1, UECF, UMesas, UTotalProdutos, UTEFDiscado, Unit5, Unit4, UTroco, 
  uMenTEF, UDivide;

var  cTotalPromocao, cTotalSemPromocao : currency;
     cValorTEF1, cValorTEF2, cValorCheque : currency;
     sFormaTEF1, sFormaTEF2, sIndiceCartao, sFormaCheque, sDescricaoTEF1 : string;
     iCodTEF1: Integer;
{$R *.dfm}

procedure TFrmFechaVenda.AbreMoedas;
begin
   zeraFormas;
   cbbMoedas.ClearItemsValues;
   if DM.IBTransaction.Active then
      DM.IBTransaction.Commit;
   DM.IBTransaction.StartTransaction;

   with QAux do
      begin
         Close;
         SQL.Text := 'SELECT * FROM MOEDAS';
         Open;
         First;
         while not Eof do
            begin
               if FieldByName( 'FATOR' ).AsString = 'D' then
                  begin
                       cbbMoedas.AddItemValue( FieldByName( 'DESCRICAO' ).AsString,
                       'D' + FieldByName( 'COTACAO' ).AsString );
                       AtualizaLabelMoeda(FieldByName( 'DESCRICAO' ).AsString,
                       edtTotVenda.Value / FieldByName( 'COTACAO' ).AsCurrency );
                  end;
               if FieldByName( 'FATOR' ).AsString = 'M' then
                  begin
                       cbbMoedas.AddItemValue( FieldByName( 'DESCRICAO' ).AsString,
                       'M' + FieldByName( 'COTACAO' ).AsString );
                       AtualizaLabelMoeda(FieldByName( 'DESCRICAO' ).AsString,
                       edtTotVenda.Value * FieldByName( 'COTACAO' ).AsCurrency );
                  end;
               Next;
            end;
         Close;
      end;
   dm.IBTransaction.Commit;
   DBGridFormas.Enabled := False;
   pnlMoedas.Visible := True;
   edtValor.Value := 0;
   cbbMoedas.SetFocus;
   cbbMoedas.ItemIndex := 0;
   cbbMoedas.SelectAll;
   cbbMoedasChange( nil );
end;

procedure TFrmFechaVenda.ACBrTEFD1AguardaResp(Arquivo: string;
  SegundosTimeOut: Integer; var Interromper: Boolean);
var
  Msg, M2 : String ;
begin
  Msg := '' ;
  if (ACBrTEFD1.GPAtual in [gpCliSiTef, gpVeSPague]) then   // É TEF dedicado ?
   begin
     if (Arquivo = '23') and (not bCancelarResp.Visible) then  // Está aguardando Pin-Pad ?
     begin
        if ACBrTEFD1.TecladoBloqueado then
        begin
           ACBrTEFD1.BloquearMouseTeclado(False);  // Desbloqueia o Teclado
           // TODO: nesse ponto é necessário desbloquear o Teclado, mas permitir
           //       um clique apenas no botão cancelar.... FALTA CORRIGIR NO DEMO
        end ;

        Msg := 'Tecle "ESC" para cancelar.';
        M2 := 'Tecle "ESC" para cancelar.';
        bCancelarResp.Visible := True ;
     end;
   end
  else
     begin
        Msg := 'Aguardando: '+Arquivo+' '+IntToStr(SegundosTimeOut) ;
        M2 := 'Aguardando TEF ' + IntToStr(SegundosTimeOut) ;

        if ( SegundosTimeOut >= 0 ) then
           begin
              if frmTefDiscado = nil then
                 Application.CreateForm( TfrmTefDiscado, frmTefDiscado );
              frmTefDiscado.Men.Caption := M2;
              frmTefDiscado.show;
           end;
        Application.ProcessMessages;
     end;

  if Msg <> '' then
     begin
//        StatusBar2.Panels[2].Text := Msg;
        if frmMenTef <> nil then
        if frmMenTef.Showing then
           frmMenTef.subMen.Caption := MSg
        else
           frmMenTef.subMen.Caption := '';
     end;
  Application.ProcessMessages;

//  if not (ACBrTEFD1.GPAtual in [gpCliSiTef, gpVeSPague]) then   // É TEF dedicado ?
  if ( SegundosTimeOut < 0 ) then
     if not ( frmTEFDiscado = nil) then
        begin
           if frmTEFDiscado.Showing then
              frmTefDiscado.Close;
        end;

  if fCancelado then
     begin
        Interromper := True ;
        fCancelado := False;
     end;
end;


procedure TFrmFechaVenda.ACBrTEFD1AntesCancelarTransacao(
  RespostaPendente: TACBrTEFDResp);
var
   Est: TACBrECFEstado;
begin
   Est := dm.ECF.Estado;
   case Est of
      estVenda, estPagamento :
        begin
           FrmVendasCaixa.CancelaTudo;
//           CancelaCupomFiscal( iECF );
//           TEFCancelado := true;
        end;

      estRelatorio :
          FechaRelatorioGerencial( iECF );
   else
      if not ( Est in [estLivre, estDesconhecido, estNaoInicializada] ) then
         dm.ECF.CorrigeEstadoErro( False ) ;
   end;
end;
procedure TFrmFechaVenda.ACBrTEFD1AntesFinalizarRequisicao(Req: TACBrTEFDReq);
var
  REDECARDTESTE: string;
begin
      if Req.Header = 'CRT' then
         begin
            REDECARDTESTE := trim( DM.LeIni(GetCurrentDir +  '\PafEcf.ini', 'ConfiguracaoLocal',
               'REDECARDTESTE') );
             if REDECARDTESTE = 'S' then
                  Req.GravaInformacao(777,777,'TESTE REDECARD');
         end;
end;

procedure TFrmFechaVenda.ACBrTEFD1BloqueiaMouseTeclado(Bloqueia: Boolean;
  var Tratado: Boolean);
begin
  dm.TecladoBloqueado := Bloqueia;
  self.Enabled := not Bloqueia ;
  Tratado := False ;  { Deixa executar o código de Bloqueio do ACBrTEFD }
end;

procedure TFrmFechaVenda.ACBrTEFD1CliSiTefExibeMenu(Titulo: string;
  Opcoes: TStringList; var ItemSelecionado: Integer; var VoltarMenu: Boolean);
Var
  AForm : TForm4 ;
  MR    : TModalResult ;
begin
  AForm := TForm4.Create(self);
  try
    if Trim(Titulo) = '' then
       Titulo := ACBrStr('Escolha uma opção') ;

    AForm.Titulo.Caption := Titulo;
    AForm.ListBox1.Items.AddStrings(Opcoes);
    AForm.BitBtn3.Visible := False ;
    AForm.Memo1.Lines.Assign(Opcoes) ;

    MR := AForm.ShowModal ;

    if (MR = mrOK) then
      ItemSelecionado := AForm.ListBox1.ItemIndex;
  finally
    AForm.Release;
    AForm := nil;
  end;
end;

procedure TFrmFechaVenda.ACBrTEFD1CliSiTefObtemCampo(Titulo: string;
  TamanhoMinimo, TamanhoMaximo, TipoCampo: Integer;
  Operacao: TACBrTEFDCliSiTefOperacaoCampo; var Resposta: AnsiString;
  var Digitado, VoltarMenu: Boolean);
Var
  AForm : TForm5 ;
  MR    : TModalResult ;
begin
  AForm := TForm5.Create(self);
  try
    AForm.Titulo.Caption  := Titulo;
    AForm.BitBtn3.Visible := False ;
    AForm.Edit1.Text      := Resposta; { Para usar Valores Previamente informados }
    if TipoCampo = 0 then
       begin
          AForm.Edit2.Visible := False;
          AForm.Edit1.Visible := True;
       end
    else
       begin
          AForm.Edit1.Visible := False;
          AForm.Edit2.Visible := True;
       end;
    MR := AForm.ShowModal ;

    Digitado := (MR = mrOK) ;

    if Digitado then
       begin
          if  AForm.Edit2.Visible then
              Resposta := AForm.Edit2.Text
           else
              Resposta := AForm.Edit1.Text;
       end;
  finally
    AForm.Release;
    AForm := nil;
  end;
end;

procedure TFrmFechaVenda.ACBrTEFD1ComandaECF(Operacao: TACBrTEFDOperacaoECF;
  Resp: TACBrTEFDResp; var RetornoECF: Integer);
Var
   Est : TACBrECFEstado ;
begin
  try
    Est := dm.ECF.Estado;

    case Operacao of
      opeAbreGerencial :
         begin
            dm.ECF.AbreRelatorioGerencial;
         end;

      opeCancelaCupom :
         if Est = estNaoFiscal then
            dm.ECF.CancelaNaoFiscal
         else
            begin
               TEF1Autorizado := false;
               FrmVendasCaixa.CancelaTudo;
            end;
            //CancelaCupomFiscal( iECF );

      opeFechaCupom :
         if Est = estNaoFiscal then
            dm.ECF.FechaNaoFiscal('')
         else
            begin
               FechaCupom;
               TEF1Autorizado := false;
               cTefAutorizado := 0;
               cTotalPago := 0;
            end;

      opeSubTotalizaCupom :
         if Est = estNaoFiscal then
            dm.ECF.SubtotalizaNaoFiscal( 0, '' )
         else
            TotalizaCupom;

      opeFechaGerencial, opeFechaVinculado :
        FechaCupomNaoFiscalVinculado( iECF );

      opePulaLinhas :
        begin
          dm.ECF.PulaLinhas( dm.ECF.LinhasEntreCupons );
          Cortar_papel;
          Sleep(200);
        end;
    end;

    RetornoECF := 1 ;
  except
    RetornoECF := 0 ;
  end;
end;

procedure TFrmFechaVenda.ACBrTEFD1ComandaECFAbreVinculado(COO,
  IndiceECF: string; Valor: Double; var RetornoECF: Integer);
begin
  try
     dm.ECF.AbreCupomVinculado( COO, IndiceECF, Valor );
     RetornoECF := 1 ;
  except
     RetornoECF := 0 ;
  end;
end;

procedure TFrmFechaVenda.ACBrTEFD1ComandaECFImprimeVia(
  TipoRelatorio: TACBrTEFDTipoRelatorio; Via: Integer;
  ImagemComprovante: TStringList; var RetornoECF: Integer);
begin
  try
     case TipoRelatorio of
       trGerencial :
        dm.ECF.LinhaRelatorioGerencial( ImagemComprovante.Text ) ;

       trVinculado :
         dm.ECF.LinhaCupomVinculado(  ImagemComprovante.Text )
     end;

     RetornoECF := 1 ;
  except
     RetornoECF := 0 ;
  end;
end;
procedure TFrmFechaVenda.ACBrTEFD1ComandaECFPagamento(IndiceECF: string;
  Valor: Double; var RetornoECF: Integer);
var
   Est : TACBrECFEstado ;
   tt: Currency;
begin
   Tt := 0;
  ACBrTEFD1.BloquearMouseTeclado(true);
  try
     Est := dm.ECF.Estado;

     if Est = estNaoFiscal then
        dm.ECF.EfetuaPagamentoNaoFiscal(IndiceECF, Valor)
     else
        begin
           if  TEF1Autorizado  then
           begin
               FrmVendasCaixa.PagamentosEfetuados.IndexName := 'PagamentosEfetuadosIndex3';
               FrmVendasCaixa.PagamentosEfetuados.FindNearest( [trim( sFormaTEF1 )] );
               if FrmVendasCaixa.PagamentosEfetuadosINDICE.AsString = trim( sFormaTEF1 )then
                  begin
                     tt := FrmVendasCaixa.PagamentosEfetuadosVALOR.AsCurrency;
                     FrmVendasCaixa.PagamentosEfetuados.Delete;

                  end;
           FrmVendasCaixa.PagamentosEfetuados.IndexName := 'PagamentosEfetuadosIndex44';
           end;
           PagamentoCupomFiscal2(iECF, iCOOVenda, iCCFVenda, Valor + tt, IndiceECF, '');
           PagamentoCupomFiscal(iECF, iCOOVenda, iCCFVenda, Valor + tt, IndiceECF, '', 'S', iCodTEF1);
//           cTotalPago := cTotalPago + Valor;
           cTotalPago := TotaldePagamentosEfetuados;
        end;

     RetornoECF := 1 ;
  except
     RetornoECF := 0 ;
  end;
end;

procedure TFrmFechaVenda.ACBrTEFD1ComandaECFSubtotaliza(DescAcre: Double;
  var RetornoECF: Integer);
Var
   Est : TACBrECFEstado ;
begin
  ACBrTEFD1.BloquearMouseTeclado(true);
  try
    Est := dm.ECF.Estado;

    if Est = estNaoFiscal then
       dm.ECF.SubtotalizaNaoFiscal( DescAcre, '' )
    else
       begin
            cTotalDescontos := 0;
            cTotalDescontos := ( cDescontoVenda * -1 ) + DescAcre;
             dm.ECF.SubtotalizaCupom( cTotalDescontos, '' );
             if TEF1Autorizado then
             begin
               FrmVendasCaixa.PagamentosEfetuados.IndexName := 'PagamentosEfetuadosIndex3';
               FrmVendasCaixa.PagamentosEfetuados.FindNearest( [trim( sFormaTEF1 )] );
               if FrmVendasCaixa.PagamentosEfetuadosINDICE.AsString = trim( sFormaTEF1 )then
                  begin
                     FrmVendasCaixa.PagamentosEfetuados.Edit;
                     FrmVendasCaixa.PagamentosEfetuadosSAIUECF.AsString := 'S';
                     FrmVendasCaixa.PagamentosEfetuados.Post;

                  end;
               FrmVendasCaixa.PagamentosEfetuados.IndexName := 'PagamentosEfetuadosIndex44';
             end;

            FazPagamentosVirtuais;
       end;

    RetornoECF := 1 ;
  except
    RetornoECF := 0 ;
  end;
end;

procedure TFrmFechaVenda.ACBrTEFD1DepoisCancelarTransacoes(
  RespostasPendentes: TACBrTEFDRespostasPendentes);
var
  I : Integer;
begin
  ACbrTEFD1.BloquearMouseTeclado( False );
  Application.BringToFront;
  for I := 0 to RespostasPendentes.Count-1  do
  begin
     with RespostasPendentes[I] do
     begin
        ShowMessage( 'Cancelado: '+Header+' ID: '+IntToStr( ID ) + #13 +
       'Rede: '  + Rede +
       ' NSU: '  + NSU  +
       ' Valor: '+ FormatFloat('###,###,##0.00',ValorTotal)  + #13 +
       'Campo 11: ' + LeInformacao(11,0).AsString );
     end;
  end;
        if frmMenTef <> nil then
           if frmMenTef.Showing then
              frmMenTef.Close;
   bCancelarResp.Visible := false;


end;

procedure TFrmFechaVenda.ACBrTEFD1DepoisConfirmarTransacoes(
  RespostasPendentes: TACBrTEFDRespostasPendentes);
var
  I : Integer;
begin
  ACbrTEFD1.BloquearMouseTeclado( False );
  Application.BringToFront;
  for I := 0 to RespostasPendentes.Count-1  do
  begin
     with RespostasPendentes[I] do
     begin
        ShowMessage( 'Confirmado: '+Header+' ID: '+IntToStr( ID ) + #13 +
       'Rede: '  + Rede +
       ' NSU: '  + NSU  +
       ' Valor: '+ FormatFloat('###,###,##0.00',ValorTotal)  + #13 +
       'Campo 11: ' + LeInformacao(11,0).AsString );
     end;
  end;

end;

procedure TFrmFechaVenda.ACBrTEFD1ExibeMsg(Operacao: TACBrTEFDOperacaoMensagem;
  Mensagem: string; var AModalResult: TModalResult);
var
   Fim : TDateTime;
   OldMensagem : String;
   MenOP: string;
   MenCli: String;
begin

  case Operacao of

    opmOK :
       begin
           AModalResult := MessageDlg( Mensagem, mtInformation, [mbOK], 0);
           if POS( 'cancelada', Mensagem ) > 0 then
              begin
                 MenOp := '';
                 MenCli := '';

              end;
       end;

    opmYesNo :
        begin
           AModalResult := MessageDlg( Mensagem, mtConfirmation, [mbYes,mbNo], 0);
           if AModalResult = mrYes then
              begin
                 if not dm.ECF.Ativo then
                    begin
                       try
                          dm.ECF.Ativar;
                       except
                           dm.Tag := 0;
                       end;
                    end;
              end;

        end;

    opmExibirMsgOperador, opmRemoverMsgOperador :
       begin
         MenOp:= Mensagem ;
       end;

    opmExibirMsgCliente, opmRemoverMsgCliente :
       begin
         MenCli := Mensagem ;
       end;

    opmDestaqueVia :
       begin
          if frmMenTef = nil then
             begin
                Application.CreateForm( TfrmMenTef, frmMenTef );
                frmMenTef.Show;
             end;
         OldMensagem := frmMenTef.lMensagemOperador.Caption ;
         try
            frmMenTef.lMensagemOperador.Caption := Mensagem ;
            frmMenTef.lMensagemOperador.Visible := True ;

            { Aguardando 3 segundos }
            Fim := IncSecond( now, 3)  ;
            repeat
               sleep(200) ;
               frmMenTef.lMensagemOperador.Caption := Mensagem + ' ' + IntToStr(SecondsBetween(Fim,now));
               Application.ProcessMessages;
            until (now > Fim) ;

         finally
            frmMenTef.lMensagemOperador.Caption := OldMensagem ;
         end;
       end;
  end;

    if  (MenOP <> '') or
  ( MenCli <> '' ) then
     begin
        if frmMenTef = nil then
           Application.CreateForm( TfrmMenTef, frmMenTef );
        frmMenTef.Show;
        frmMenTef.BringToFront;
        frmMenTef.lMensagemOperador.Caption := MenOP;
        frmMenTef.lMensagemCliente.Caption := MenCli;
        frmMenTef.lMensagemOperador.Visible := (frmMenTef.lMensagemOperador.Caption <> '') ;
        frmMenTef.lMensagemCliente.Visible  := (frmMenTef.lMensagemCliente.Caption <> '') ;
        if (ACBrTEFD1.GPAtual in [gpCliSiTef, gpVeSPague]) then
           begin
               if ( Pos( 'INSIRA', MenOP ) > 0 ) or
               ( Pos( 'INSIRA', MenCli ) > 0 )  then
                  begin
                     frmMenTef.subMen.Caption := 'Tecle Esc Para Cancelar';
                     ACBrTEFD1.BloquearMouseTeclado(False);
                  end;

           end;

        Application.ProcessMessages;
        Sleep(1000);
     end
  else
     begin
        if frmMenTef <> nil then
           if frmMenTef.Showing then
              frmMenTef.Close;
     end;


  Application.ProcessMessages;
end;

procedure TFrmFechaVenda.ACBrTEFD1InfoECF(Operacao: TACBrTEFDInfoECF;
  var RetornoECF: string);
begin
   if not dm.ECF.Ativo then
      dm.ECF.Ativar;

   case Operacao of
     ineSubTotal :
        begin
           if cTefTroco > 0 then
              begin
                   if DM.ECF.Estado = estPagamento then
                      begin
                         RetornoECF := FloatToStr( ( dm.eCF.Subtotal + cTefTroco ) - DM.ECF.TotalPago ) ;
                      end
                   else
                      RetornoECF := FloatToStr( ( (cTotalVenda - cDescontoVenda )  + cTefTroco )- cTotalPago ) ;
              end
           else
              begin
                   if DM.ECF.Estado = estPagamento then
                      begin
                         RetornoECF := FloatToStr( dm.ECF.Subtotal - DM.ECF.TotalPago );
                      end
                   else
                      RetornoECF := FloatToStr( (cTotalVenda - cDescontoVenda )- cTotalPago ) ;
              end;

        end;

     ineEstadoECF :
       begin
         Case dm.ECF.Estado of
           estLivre     : RetornoECF := 'L' ;
           estVenda     : RetornoECF := 'V' ;
           estPagamento : RetornoECF := 'P' ;
           estRelatorio : RetornoECF := 'R' ;
           estNaoFiscal : RetornoECF := 'N' ;
         else
           RetornoECF := 'O' ;
         end;
       end;
     ineTotalAPagar :
         begin
               RetornoECF := '0';
//             RetornoECF := FloatToStr( ( cTotalPago + cTefAutorizado ) );
         end;
   end;
end;

procedure TFrmFechaVenda.ACBrTEFD1MudaEstadoReq(EstadoReq: TACBrTEFDReqEstado);
begin
//   StatusBar2.Panels[1].Text := GetEnumName(TypeInfo(TACBrTEFDReqEstado), Integer(EstadoReq) ) ;
   fCancelado := False ;
end;

procedure TFrmFechaVenda.ACBrTEFD1MudaEstadoResp(
  EstadoResp: TACBrTEFDRespEstado);
begin
 // StatusBar2.Panels[1].Text := GetEnumName(TypeInfo(TACBrTEFDRespEstado), Integer(EstadoResp) ) ;
  bCancelarResp.Visible     := (EstadoResp = respAguardandoResposta) ;
end;

procedure TFrmFechaVenda.ACBrTEFD1RestauraFocoAplicacao(var Tratado: Boolean);
begin
  Application.BringToFront;
  if TAG = 0 then
    Application.BringToFront;
  if TAg = 1 then
     Application.BringToFront;
  Tratado := False ;  { Deixa executar o código de Foco do ACBrTEFD }

end;

procedure TFrmFechaVenda.ACBrTEFD1VeSPagueExibeMenu(Titulo: string; Opcoes,
  Memo: TStringList; var ItemSelecionado: Integer);
Var
  AForm : TForm4 ;
  MR    : TModalResult ;
begin
  AForm := TForm4.Create(self);
  try
    if Trim(Titulo) = '' then
       Titulo := ACBrStr('Escolha uma opção') ;

    AForm.Titulo.Caption := Titulo;
    AForm.ListBox1.Items.AddStrings(Opcoes);
    AForm.BitBtn3.Visible := False ;
    AForm.Memo1.Lines.Assign(Memo) ;

    MR := AForm.ShowModal ;

    if (MR = mrOK) then
      ItemSelecionado := AForm.ListBox1.ItemIndex;
  finally
    AForm.Release;
    AForm := nil;
  end;
end;
procedure TFrmFechaVenda.ACBrTEFD1VeSPagueObtemCampo(Titulo, Mascara: string;
  Tipo: AnsiChar; var Resposta: string; var Digitado: Boolean);
Var
  AForm : TForm5 ;
  MR    : TModalResult ;
begin
  AForm := TForm5.Create(self);
  try
    AForm.Titulo.Caption  := Titulo;
    AForm.BitBtn3.Visible := False ;
    AForm.Edit1.Text      := Resposta; { Para usar Valores Previamente informados }
    if Trim( Mascara ) = '.##' then
       begin
          AForm.Edit2.Visible := False;
          AForm.EdtData.Visible := False;
          AForm.Edit1.Visible := True;
       end
    else
       begin
          AForm.Edit1.Visible := False;
          AForm.EdtData.Visible := False;
          AForm.Edit2.Visible := True;
       end;
    if Trim( Mascara ) = 'MM/yy'  then
        begin
          AForm.Edit1.Visible := False;
          AForm.EdtData.Visible := True;
          AForm.Edit2.Visible := False;
        end;

    MR := AForm.ShowModal ;

    Digitado := (MR = mrOK) ;

    if Digitado then
       begin
          if  AForm.Edit2.Visible then
              Resposta := AForm.Edit2.Text
           else
              if AForm.EdtData.Visible then
                    Resposta := AForm.EdtData.Text
               else
                   Resposta := AForm.Edit1.Text;
       end;
  finally
    AForm.Release;
    AForm := nil;
  end;
end;

procedure TFrmFechaVenda.AtualizaLabelMoeda(Descricao: string; Valor: Currency);
var
   Pnl: TPanel;
   LblDescricao: TLabel;
   lblValor: TLabel;
   Comp: TComponent;
   I: Integer;
begin

   Comp := Self.FindComponent( Trim( 'lblValorMoeda' + Trim( Descricao ) ) );
   if Comp = nil then
      begin
         Pnl := TPanel.Create( FrmFechaVenda );
         Pnl.Name := Trim( 'pnlMoeda' + Trim( Descricao ) ) ;
         Pnl.Height := Panel1.Height;
         Pnl.Align := alTop;
         Pnl.Caption := '';
         Pnl.BevelOuter := bvNone;
         Pnl.Parent := ScrollMoedas;
         LblDescricao := TLabel.Create( FrmFechaVenda );
         LblDescricao.Name := Trim( 'lblDescMoeda' + Trim( Descricao ) );
         LblDescricao.Align := alLeft;
         LblDescricao.AlignWithMargins := True;
         LblDescricao.Margins.Top := 0;
         LblDescricao.Margins.Bottom := 0;
         LblDescricao.Margins.Left := 3;
         LblDescricao.Font.Assign( Label1.Font );
         LblDescricao.Caption := Descricao;
         LblDescricao.Margins.Right := 0;
         LblDescricao.Parent := Pnl;
         lblValor := TLabel.Create( FrmFechaVenda );
         lblValor.Name := Trim( 'lblValorMoeda' + Trim( Descricao ) );
         lblValor.Align := alRight;
         lblValor.AlignWithMargins := True;
         lblValor.Margins.Top := 0;
         lblValor.Margins.Bottom := 0;
         lblValor.Font.Assign( Label2.Font );
         lblValor.Margins.Left := 0;
         lblValor.Margins.Right := 10;
         lblValor.Parent := Pnl;
         lblValor.Caption := FormatFloat( '0.00', Valor );
      end;
   if Comp <> nil then
      lblValor := TLabel( Comp );
   if lblValor <> nil then
      lblValor.Caption := FormatFloat( '0.00', Valor );
    pnl := nil;
    LblDescricao := nil;
    lblValor := nil;
end;

procedure TFrmFechaVenda.AtualizaVenda;
var iCodTroco : integer;
   TTotalFormas: Currency;
   TTroco: Currency;
begin
  // GravaFechamentoVenda(iCodigoVenda, cDescontoVenda, (cTotalVenda - cDescontoVenda), sNomeCliente, sDocCliente);
   GravaFechamentoVenda(iCodigoVenda, cTotalDescontos, (cTotalVenda + cTotalDescontos), sNomeCliente, sDocCliente);
   { deletando as formas de pagamento da venda - caso existe }
   TTotalFormas := 0;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'DELETE FROM VENDAS_FORMAS_PAGAMENTO ' +
                        'WHERE COD_VENDA = :CODVEN';
             Parambyname('codven').AsInteger:= iCodigoVenda;
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('erro ao excluir as formas de pagamento');
     end;
   finally
     dm.QConsulta.Close;
   end;

      FrmVendasCaixa.PagamentosEfetuados.First;
   while not FrmVendasCaixa.PagamentosEfetuados.Eof do
      begin
         if FrmVendasCaixa.PagamentosEfetuadosVALOR.AsCurrency > 0  then
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
                         sql.Text:= 'INSERT INTO VENDAS_FORMAS_PAGAMENTO(COD_VENDA, COD_FORMA, VALOR) ' +
                                    'VALUES(:CODVENDA, :CODFORMA, :VALOR)';
                         Parambyname('CODFORMA').AsInteger  := FrmVendasCaixa.PagamentosEfetuadosCODFORMA.AsInteger;
                         Parambyname('CODVENDA').AsInteger  := iCodigoVenda;
                         Parambyname('VALOR').AsCurrency    := FrmVendasCaixa.PagamentosEfetuadosVALOR.AsCurrency;
                         TTotalFormas := TTotalFormas + FrmVendasCaixa.PagamentosEfetuadosVALOR.AsCurrency;
                         ExecOrOpen;
                      end;
                   dm.IBTransaction.Commit;
                 except
                   dm.IBTransaction.Rollback;
                   showmessage('erro ao gravar as formas de pagamento');
                 end;
               finally
                 dm.QConsulta.Close;
               end;
            end;

         FrmVendasCaixa.PagamentosEfetuados.Next;
      end;
   TTroco := 0;
   if cTotalDescontos < 0 then
      TTroco := TTotalFormas - ( cTotalVenda - ( cTotalDescontos * -1 ) )
   else
      TTroco := TTotalFormas - ( cTotalVenda - ( cTotalDescontos ) );
   EdtTroco.Value := TTroco;
   MostrarTroco := True;
   { gravando o troco }
   if opVale then
      iCodTroco:= dm.BuscaFormaPagamento('TV')
   else
      iCodTroco:= dm.BuscaFormaPagamento('TR');

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'INSERT INTO VENDAS_FORMAS_PAGAMENTO(COD_VENDA, COD_FORMA, VALOR) ' +
                        'VALUES(:CODVENDA, :CODFORMA, :VALOR)';
             Parambyname('codvenda').AsInteger  := iCodigoVenda;
             Parambyname('codforma').AsInteger  := iCodTroco;
             Parambyname('valor').AsCurrency    := strtocurr(EdtTroco.Text);
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('erro ao gravar as formas de pagamento');
     end;
   finally
     dm.QConsulta.Close;
   end;

   try
      try
         qMovimento.Close;
         qMovimento.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
         qMovimento.ParamByName( 'COD_CAI' ).AsInteger := iCaixa;
         qMovimento.Open;
         Query.SQL.Text :=
            'INSERT INTO NEWCAIXA_MOVIMENTOS(' + sLineBreak +
            'COD_MOV, COD_EMP,' + sLineBreak +
            'COD_CAI, COD_USU,' + sLineBreak +
            'DESCRICAO,' + sLineBreak +
            'MODULO, DOCUMENTO,' + sLineBreak +
            'PLANO_CONTAS, COD_FORMA,' + sLineBreak +
            'VALOR, CANCELADO, SUB_MODULO )' + sLineBreak +
            'VALUES(' + sLineBreak +
            ':COD_MOV, :COD_EMP,' + sLineBreak +
            ':COD_CAI, :COD_USU,' + sLineBreak +
            ':DESCRICAO,' + sLineBreak +
            ':MODULO, :DOCUMENTO,' + sLineBreak +
            ':PLANO_CONTAS, :COD_FORMA,' + sLineBreak +
            ':VALOR, :CANCELADO, :SUB_MODULO )';
         Query.ParamByName( 'COD_MOV' ).AsInteger := qMovimentoCODIGO.AsInteger;
         Query.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
         Query.ParamByName( 'COD_CAI' ).AsInteger := iCaixa;
         Query.ParamByName( 'COD_USU' ).AsInteger := ICodUsu;
         Query.ParamByName( 'DESCRICAO' ).AsString := 'CAIXA['+ Poem_Zeros( IntToStr( iCaixa ), 3 ) +']/' +
                                                       'VENDA[' + Poem_Zeros( (iCOOVenda), 9 ) + ']';
         Query.ParamByName( 'MODULO' ).AsString := 'VENDA_PDV';
         Query.ParamByName( 'DOCUMENTO' ).AsString := 'VENDA[' + Poem_Zeros( (iCOOVenda), 9 )+ ']';
         Query.ParamByName( 'PLANO_CONTAS' ).AsString := '1.1.1';
         Query.ParamByName( 'COD_FORMA' ).AsInteger := 1;
         Query.ParamByName( 'VALOR' ).AsCurrency := (cTotalVenda - cDescontoVenda) - cTotalPago;
         Query.ParamByName( 'CANCELADO' ).AsInteger := 0;
         Query.ParamByName( 'SUB_MODULO' ).AsString := 'FLUXO_VENDA_PDV';
         Query.ExecSQL;
      except
         on E: Exception do
           begin
               MessageDlg(
                  'Erro ao inserior movimento! '  + sLineBreak
                  , mtInformation, [mbOK],0 );
               Exit;
           end;
      end;
   finally

   end;
end;

procedure TFrmFechaVenda.bCancelarRespClick(Sender: TObject);
begin
  fCancelado := true;
end;

procedure TFrmFechaVenda.ImprimeContraVale(Valor: Double);
var
   relVale: TStrings;
begin
   relVale := TStringList.Create;
   relVale.Clear;
   relVale.Add( '<n><ce>P R I M E I R A   V I A</ce></n>');
   relVale.Add( '<n><ce>C O N T R A   V A L E</ce></n>');
   relVale.Add( 'REFERENTE AO CUPOM NUMERO:' + IntToStr( iCOOVenda ));
   relVale.Add( FormataStringE( '-', '40', '-' ));
   relVale.Add( 'VALOR : ' + FormatFloat( 'R$ 0.00', Valor ) );
   relVale.Add( 'OPERADOR :' + IntToStr( ICodUsu ) + ' - '  + sNomeUsuario );
   relVale.Add( FormataStringE( '=', '40', '=' ) );
   relVale.Add( ' ' );
   relVale.Add( ' ' );
   relVale.Add( FormataStringE( '_', '40', '_' ) );
   relVale.Add( FormataStringC( ' ASSINATURA DO RESPONSÁVEL', '40', ' ' ));
   relVale.Add( ' ' );
   relVale.Add( ' ' );
   relVale.Add( '<n><ce>S E G U N D A   V I A</ce></n>');
   relVale.Add( '<n><ce>C O N T R A   V A L E</ce></n>');
   relVale.Add( 'REFERENTE AO CUPOM NUMERO:' + IntToStr( iCOOVenda ));
   relVale.Add( FormataStringE( '-', '40', '-' ));
   relVale.Add( 'VALOR : ' + FormatFloat( 'R$ 0.00', Valor ) );
   relVale.Add( 'OPERADOR :' + IntToStr( ICodUsu ) + ' - '  + sNomeUsuario );
   relVale.Add( FormataStringE( '=', '40', '=' ) );
   dm.ECF.RelatorioGerencial( relVale );
   relVale.Free;
end;

function TFrmFechaVenda.ImprimePromissoria( Valor: Double ) : integer;
var sCNPJ : string;
   Ve, Vp: Double;
   Rel: TStrings;
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
              Close;
              Sql.Clear;
              SQL.Text := 'select SUM( VALOR_CTR ) PARCELADO, '+
              '( select SUM( VALOR_CTR ) from CONTAS_RECEBER WHERE '+
              'COD_VENDA = :CODVENDA AND DTPAGTO_CTR IS NOT NULL ) '+
              'ENTRADA from CONTAS_RECEBER WHERE COD_VENDA = :CODVENDA '+
              'AND DTPAGTO_CTR IS NULL';
              Parambyname('codvenda').AsInteger:= iCodigoVenda;
              Open;
              if FieldByName( 'ENTRADA' ).IsNull then
                Ve := 0
              else
                 Ve := FieldByName( 'ENTRADA' ).asFloat;
              if FieldByName( 'PARCELADO' ).IsNull then
                Vp := 0
              else
                 Vp := FieldByName( 'PARCELADO' ).asFloat;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao buscar as parcelas');
     end;
   finally
     dm.QConsulta.Close;
   end;
   Rel := TStringList.Create;
   Rel.Clear;
   { busca o CNPJ da empresa }
   sCNPJ:= dm.RetornaStringTabela('CNPJ_EMP', 'EMPRESA', 'COD_EMP', iEmp);
   { imprime relatorio gerencial }
//   AbreRelatoroGerencial(iECF, '00');
   Rel.Add( 'Valor da Compra.:  R$ ' + FormatFloat( '###,##0.00', Valor ));
   Rel.Add( 'Valor da Entrada:  R$ ' + FormatFloat( '###,##0.00', Ve ));
   Rel.Add( 'Valor Parcelado.:  R$ ' + FormatFloat( '###,##0.00', Vp ));
   Rel.Add( FormataStringE( '', '40', '=' ));
   Rel.Add( 'Operador: ' +
   FormataStringD(  IntToStr( ICodUsu ), '3', '0' ) + ' - Data : ' +
   FormatDateTime( 'dd/mm/yy - hh:mm', Now ) );
   Rel.Add( FormataStringE( '', '40', '=' ));
   Rel.Add( 'Cod. Cliente...: ' + IntToStr( iCodCliente ) );
   Rel.Add( 'Cliente........: ' + copy(sNomeCliente, 1,23 ) );
   Rel.Add( 'CPF/CNPJ.......: ' + sDocCliente );
   Rel.Add( 'Cupom..........: ' + IntToStr( iCOOVenda ) );
   Rel.Add( 'Debito Anterior: ' + '0,00' );
   Rel.Add( 'Valor Parcelado: ' + FormatFloat( '###,##0.00', Vp ) );
   Rel.Add( FormataStringE( '', '40', '=' ));
   Rel.Add( FormataStringC( 'PARCELAS', '40', ' ' ) );
   Rel.Add( FormataStringE( '', '40', '=' ));


   { busca as parcelas e vencimentos }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try

       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.add('SELECT VENCTO_CTR, VALOR_CTR, COD_CTR ' +
                     'FROM CONTAS_RECEBER ' +
                     'WHERE COD_VENDA = :CODVENDA AND DTPAGTO_CTR IS NULL ORDER BY COD_CTR');
             Parambyname('codvenda').AsInteger:= iCodigoVenda;
             open;
             while not Eof do
                 begin
//                    ImprimeRelatorioGerencial(iECF, '<inter>' + fieldbyname( 'COD_CTR' ).AsString + '</inter>' );
                    Rel.Add( 'Cod.: ' + fieldbyname( 'COD_CTR' ).AsString );
                    Rel.Add( 'Venc.: ' + fieldbyname('VENCTO_CTR').asString + '    ' + 'Valor: ' + currtostrf(fieldbyname('VALOR_CTR').AsCurrency, ffnumber, 2));
                    Rel.Add( FormataStringE( '', '40', '-' ));
                    Next;
                 end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao buscar as parcelas');
     end;
   finally
     dm.QConsulta.Close;
   end;

   Rel.Add( FormataStringE( '', '40', '-' ));
   Rel.Add( FormataStringC( 'Reconheco e pagarei a divida aqui', '40', ' '  ) );
   Rel.Add( FormataStringC( 'representada.', '40', ' '  ) );
   Rel.Add( FormataStringE( '', '40', '-' ));
   Rel.Add( ' ');
   Rel.Add( FormataStringC( '________________________________________', '40', ' '));
   Rel.Add( FormataStringC( 'ASSINATURA', '40', ' '));

   { fechar o comprovante }
   dm.ECF.RelatorioGerencial( Rel );
   Rel.Free;
   Rel := nil;
//   FechaRelatorioGerencial(iECF);
   result:= 0;
end;


procedure TFrmFechaVenda.FormShow(Sender: TObject);
begin
   opVale := False;
   EdtPercentualDesconto.Color := dm.BuscaCor( DM.FundoFechaVenda,
     EdtPercentualDesconto.Left, EdtPercentualDesconto.Top );
   EdtValorDesconto.Color := dm.BuscaCor( DM.FundoFechaVenda,
     EdtValorDesconto.Left, EdtValorDesconto.Top );
   DBGridFormas.Color := dm.BuscaCor( DM.FundoFechaVenda,
     DBGridFormas.Left, DBGridFormas.Top );
   edtTotVenda.Color := dm.BuscaCor( DM.FundoFechaVenda,
     edtTotVenda.Left, edtTotVenda.Top );
   EdtTroco.Color := dm.BuscaCor( DM.FundoFechaVenda,
     EdtTroco.Left, EdtTroco.Top );
   edtPago.Color := dm.BuscaCor( DM.FundoFechaVenda,
     edtPago.Left, edtPago.Top );
  // Brush.Style := bsClear;
   bPodeEncerrarVenda    := false;
   btnok.Enabled         := true;
   bDescontoLiberado     := false;
   panelDescontos( false );


   btnok.Enabled         := true;
   cTefAutorizado        := 0;
   cDescontoVenda        := 0;
   cTotalDescontos       := 0;
   cTotalPromocao        := 0;
   cTotalSemPromocao     := 0;
   cTotalPromocao        := dm.TotalizaProdutos('S', iCodigoVenda);
   cTotalSemPromocao     := dm.TotalizaProdutos('N', iCodigoVenda);

   if (iCodPreVenda > 0) and (cDescPreVenda > 0) then
      begin
         EdtValorDesconto.Text:= CurrToStr(cDescPreVenda);
         EdtValorDescontoExit(self);
      end
   else
      if cDescConvenio > 0 then
         begin
            EdtPercentualDesconto.Text:= currtostr(cDescConvenio);
            EdtPercentualDescontoExit(self);
         end;

   LimpaGridPagamentos;
   if frmMenTef <> nil then
      if frmMenTef.Showing then
          frmMenTef.Close;
   DM.CriaImg;
   dm.CarregaImagem2( dm.FundoFechaVenda, dm.ImgTempCia );
   imgFecha.Picture.Bitmap.Assign( DM.ImgTempCia );
   DM.DestroyImg;
   if cDescontoCtrlI > 0 then
      begin
         EdtValorDesconto.Value := cDescontoCtrlI;
         EdtValorDescontoExit( nil );
      end;
end;

procedure TFrmFechaVenda.GravaTrocoCartaoH2(Valor: Double);
var
   CPFCli: string;
   CNPJ_Cred: string;
   TituCred: string;
begin
   CPFCli := DM.RetornaStringTabela( 'CNPJ_CLI', 'CLIENTE', 'COD_CLI', iCodCliente  );
   CNPJ_Cred := dm.LeIni( GetCurrentDir +  '\PafEcf.ini', 'TEFTROCO', 'CNPJ' );
   TituCred := dm.LeIni( GetCurrentDir +  '\PafEcf.ini', 'TEFTROCO', 'TITULO' );
   if dm.IBTransaction.Active then
       dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
       dm.QConsulta.Close;
       dm.QConsulta.SQL.Text := 'insert into TROCO_CARTAO_H2 values ( :COD_EMP, :COD_CAI,' +
       ':COO, :CCF, :DIA, :VALOR, :CNPJ, :CPF, :TIT )';
       dm.QConsulta.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
       dm.QConsulta.ParamByName( 'COD_CAI' ).AsInteger := iCaixa;
       dm.QConsulta.ParamByName( 'COO' ).AsInteger := iCOOVenda;
       dm.QConsulta.ParamByName( 'CCF' ).AsInteger := iCCFVenda;
       dm.QConsulta.ParamByName( 'DIA' ).AsDate := DataECF( iECF );
       dm.QConsulta.ParamByName( 'VALOR' ).AsCurrency  := Valor;
       dm.QConsulta.ParamByName( 'CNPJ' ).AsString := CNPJ_Cred;
       dm.QConsulta.ParamByName( 'CPF' ).AsString := CPFCli;
       dm.QConsulta.ParamByName( 'TIT' ).AsString := TituCred;
       dm.QConsulta.ExecOrOpen;
       dm.IBTransaction.Commit;
   except
       on E:exception do
          begin
         //    ShowMessage( E.Message );
             dm.IBTransaction.Rollback;
          end;

   end;
end;

procedure TFrmFechaVenda.EdtValorDescontoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_down then
      SelectNext(ActiveControl, true, true)
   else
      if key = vk_up then
         SelectNext(ActiveControl, false, true);
end;

procedure TFrmFechaVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         if ( not DBGridFormas.Focused ) and ( not btnPagamentoMoedas.Focused ) then
            begin
                Key := #0;
                SelectNext(ActiveControl, True, True);
            end;
      end;
end;

procedure TFrmFechaVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (ssCtrl in Shift) and (chr(Key) in ['G', 'g']) then
      begin
         AbreGaveta(iECF, IGaveta);
      end;

   case key of
    vk_f2: begin
              Application.CreateForm(TFrmTotalProdutos, FrmTotalProdutos);
              FrmTotalProdutos.EdtPromocao.Text     := CurrToStr(cTotalPromocao);
              FrmTotalProdutos.EdtForaPromocao.Text := CurrToStr(cTotalSemPromocao);
              FrmTotalProdutos.ShowModal;
           end;
    vk_f3: begin
              if (cTotalSemPromocao > 0) and (cDescontoMaximo > 0) then
                 begin
                    EdtPercentualDesconto.Text:= currtostr(cDescontoMaximo);
                    EdtPercentualDescontoExit(self);
                 end;
           end;
    vk_f4: begin
              Application.CreateForm(TFrmSenhaLiberaVenda, FrmSenhaLiberaVenda);
              FrmSenhaLiberaVenda.Tag:= 1;
              FrmSenhaLiberaVenda.ShowModal;
              if bDescontoLiberado then
                 begin
                    Paneldescontos( true );
                    EdtPercentualDesconto.SetFocus;
                 end;
           end;
    VK_F5: begin
              if BtnOk.Enabled  then
                 BtnOk.Click;
           end;
    VK_F8: begin
              if edtTotVenda.Value <= 0 then
                 Exit;
              Application.CreateForm( TfrmDivide, frmDivide );
              frmDivide.cTotal := edtTotVenda.Value;
              frmDivide.ShowModal;
              CalculaTroco;
           end;
    VK_F10: begin
               AbreMoedas;
            end;
    vk_next   :BtnOkClick(BtnOK);
    vk_escape : begin
                   if pnlMoedas.Visible then
                      begin
                         if cDescontoVenda > 0 then
                            FormasComDesconto
                         else
                            begin
                               EdtPercentualDesconto.Clear;
                               FormasPagamento;
                            end;
                         pnlMoedas.Visible := False;
                         DBGridFormas.Enabled := True;
                         DBGridFormas.SetFocus;
                         CalcTrocoTemp;
                      end
                   else
                      close;
                end;
    VK_F9: opVale := not opVale;
   end;
end;

procedure TFrmFechaVenda.EdtPercentualDescontoExit(Sender: TObject);
begin
   if strtocurr(EdtPercentualDesconto.Text) < 0 then
      begin
         showmessage('Valor do Desconto não pode ser negativo');
         EdtPercentualDesconto.SetFocus;
         exit;
         abort;
      end;

   if strtocurr(EdtPercentualDesconto.Text) > 0 then
      begin
         cDescontoVenda        := strtocurr(currtostrf((cTotalSemPromocao * strtocurr(EdtPercentualDesconto.text)) / 100, ffFixed, 2));
         EdtValorDesconto.Text := currtostr(cDescontoVenda);
         if cDescontoVenda > 0 then
            FormasComDesconto;
         EdtTroco.Text := '0';
      end
   else
      begin
         EdtValorDesconto.Clear;
         cDescontoVenda:= 0;
         FormasPagamento;
      end;

   if not EdtValorDesconto.Focused then
      begin
         bDescontoLiberado     := false;
         Paneldescontos( false );
      end;
end;

procedure TFrmFechaVenda.EdtValorDescontoExit(Sender: TObject);
begin
   if strtocurr(EdtValorDesconto.Text) < 0 then
      begin
         showmessage('Valor do Desconto não pode ser negativo');
         EdtValorDesconto.SetFocus;
         exit;
         abort;
      end;

   cDescontoVenda:= strtocurr(EdtValorDesconto.Text);
   if cDescontoVenda > 0 then
      FormasComDesconto
   else
      begin
         EdtPercentualDesconto.Clear;
         FormasPagamento;
      end;

   EdtTroco.Text:= '0';

   if not EdtPercentualDesconto.Focused then
      begin
         bDescontoLiberado     := false;
         PanelDescontos( False );
      end;
end;

procedure TFrmFechaVenda.BtnOkClick(Sender: TObject);
var bPagou, bErroFormas, bTemTEF : boolean;
    cSomaFormas : currency;
    iRetornoExecutaTEF : integer;
    ValorPR: Double;
    CalculaPagamento, C1, C2: Currency;
    UsandoTEF: Boolean;
begin
   cTefTroco := 0;
   btnok.Enabled:= false;
   bPagou       := false;
   bErroFormas  := false;
   bTemTEF      := false;
   UsandoTEF    := False;
   cValorCheque := 0;
   cValorTEF1   := 0;
   cValorTEF2   := 0;
   ValorPR := 0;

   bPodeEncerrarVenda:= true;
//   sNomeCliente := '';
  // sEndCliente  := '';
  // sDocCliente  := '';
   cSomaFormas  := 0;


   { Verifica Formas de Pagamento }
   with CDSFormas do
      begin
         first;
         while not eof do
            begin
               if CDSFormasVALOR.AsCurrency > 0 then
                  begin
                     if CDSFormasUSA_TEF.AsString = 'S' then
                        UsandoTEF := true;
                     if bPagou then
                        bErroFormas:= true
                     else
                        begin
                           bErroFormas:= false;
                           cSomaFormas:= cSomaFormas + CDSFormasVALOR.AsCurrency;
                           if cSomaFormas >= ( (cTotalVenda - cDescontoVenda) - ( cTotalPago + cTefAutorizado ) ) then
                              bPagou:= true;
                        end;
                  end;
               next;
            end;
      end;

      if ( edtTotVenda.Value <= 0 ) and (  not bPagou ) then
          bPagou := True;

   if bErroFormas and ( not UsandoTEF ) then
      bErroFormas := False;

   if (bErroFormas) or (not bPagou) then
      begin
         showmessage('Verifique as formas de pagamento');
         DBGridFormas.SetFocus;
         btnok.Enabled:= true;
         exit;
      end;

   { Verifica se o troco é menor que zero }
   if StrToCurr(EdtTroco.Text) < 0 then
      begin
         showmessage('O Troco está com valor negativo! ' + #13 +
                     'Verifique as formas de pagamento');

         CDSFormas.First;
         DBGridFormas.SetFocus;
         BtnOk.Enabled:= true;
         exit;
         abort;
      end;

   { verifica se o total dos Cartões é maior que o total da venda }
   CalculaPagamento :=  (cTotalVenda - cDescontoVenda) - cTotalPago;

   if ( TotalizaFormasPagamento('CC') > 0 ) or ( TotalizaFormasPagamento('CA') > 0) then
      begin
         if ( cSomaFormas > CalculaPagamento ) and (
         ( not  Dm.ECF.AAC.IdentPAF.Paf.TrocoEmCartao ) and ( not(  iCodCliente <> iCodClientePadrao ) ) or
         ( Dm.ECF.AAC.IdentPAF.Paf.TrocoEmCartao ) and ( not(  iCodCliente <> iCodClientePadrao ) ))
         then
            begin
               showmessage('Pagamento com cartão não pode exceder valor a ser pago!');
               CDSFormas.First;
               DBGridFormas.SetFocus;
               BtnOk.Enabled:= true;
               exit;
               abort;
            end;
      end;
   if ( TotalizaFormasPagamento('CA') > 0 ) and ( TotalizaFormasPagamento('CC') > 0 ) then
      begin
         ShowMessage( 'Você só não pode ter Cheque e Cartão na mesma venda!' );
         CDSFormas.First;
         DBGridFormas.SetFocus;
         BtnOk.Enabled:= true;
         Exit;;
         Abort;
      end;

   if Dm.ECF.AAC.IdentPAF.Paf.TrocoEmCartao
     and  ( TotalizaFormasPagamento('CA') > ( CalculaPagamento  + 10 ) )  then
      begin
         showmessage('Troco no cartão não pode exeder o valor de R$10,00');
         CDSFormas.First;
         DBGridFormas.SetFocus;
         BtnOk.Enabled:= true;
         exit;
         abort;
      end
      else if  ( TotalizaFormasPagamento('CA') > ( CalculaPagamento ) ) and
        ( TotalizaFormasPagamento('CA') <= ( CalculaPagamento + 10 ) ) and (  iCodCliente <> iCodClientePadrao )  then
         begin
            cTefTroco :=  TotalizaFormasPagamento('CA') - CalculaPagamento;
         end;
   if ( ( TotalizaFormasPagamento('CA') > CalculaPagamento ) and not ( edtTotVenda.Value <= 0 ) ) and
   ( not   Dm.ECF.AAC.IdentPAF.Paf.TrocoEmCartao) and
     (  iCodCliente =  iCodClientePadrao ) then
      begin

         showmessage('Verifique o total dos cartões');
         CDSFormas.First;
         DBGridFormas.SetFocus;
         BtnOk.Enabled:= true;
         exit;
         abort;
      end;
   if ( TotalizaFormasPagamento('CC') > CalculaPagamento ) and (  not ( edtTotVenda.Value <= 0 ) ) then
      begin
         showmessage('Verifique o total do consulta cheque');
         CDSFormas.First;
         DBGridFormas.SetFocus;
         BtnOk.Enabled:= true;
         exit;
         abort;
      end;

   { Desabilita o botão OK para evitar que pressionem ENTER mais vezes }
   BtnOk.Enabled:= false;

   { Cheque }
   if TotalizaFormasPagamento('CH') > 0 then
      begin
         if ( trim(dm.RetornaStringTabela('LANCAR_CHEQUE_CAIXA', 'parametros', 'cod_emp', iEmp)) = 'S' )
         and ( not Assigned( ListaFormas ) ) then
            begin
               Application.CreateForm(TFrmLancCheques, FrmLancCheques);
               FrmLancCheques.Tag:= 0;
               FrmLancCheques.EdtCodCliente.Text  := IntToStr(iCodCliente);
               FrmLancCheques.EdtCodEmitente.Text := inttostr(iCodCliente);
               FrmLancCheques.showmodal;
            end;
      end;

   if TotalizaFormasPagamento('PR') > 0 then
      begin
         if  ( not Assigned( ListaFormas ) ) then
            begin
                 bPodeEncerrarVenda             := false;
                 FrmDadosCliente.panel3.Visible := true;
                      if ( ( DM.PW + DM.PH )/ 2) < 90 then
                         FrmDadosCliente.Height:= Round( ( 509 * ( ( ( DM.PW + DM.PH )/ 2 ) + 10 ) ) /100)
                     else
                         FrmDadosCliente.Height:= Round( ( 509 * ( ( DM.PW + DM.PH )/ 2) ) /100);
                FrmDadosCliente.Position       := poDesktopCenter;
                 FrmDadosCliente.Tag            := 1;
                if  FrmDadosCliente.showmodal = mrCancel then
                    begin
                           CDSFormas.First;
                           DBGridFormas.SetFocus;
                           BtnOk.Enabled:= true;
                           exit;
                           abort;
                    end;
            end
         else
           if ListaParcelas.Count = 0 then
              begin
                   bPodeEncerrarVenda             := false;
                   FrmDadosCliente.panel3.Visible := true;
                        if ( ( DM.PW + DM.PH )/ 2) < 90 then
                           FrmDadosCliente.Height:= Round( ( 509 * ( ( ( DM.PW + DM.PH )/ 2 ) + 10 ) ) /100)
                       else
                           FrmDadosCliente.Height:= Round( ( 509 * ( ( DM.PW + DM.PH )/ 2) ) /100);
                  FrmDadosCliente.Position       := poDesktopCenter;
                   FrmDadosCliente.Tag            := 1;
                  if  FrmDadosCliente.showmodal = mrCancel then
                      begin
                             CDSFormas.First;
                             DBGridFormas.SetFocus;
                             BtnOk.Enabled:= true;
                             exit;
                             abort;
                      end;
              end;
         ValorPR := TotalizaFormasPagamento('PR');
      end;
    bTemTEF:= false;
    { CONSULTA CHEQUE }
      if (TotalizaFormasPagamento('CC') > 0) then
      begin

         if not bTEF then
            begin
               Application.MessageBox( 'Este caixa não possui TEF', 'Aviso SLPDV', mb_applmodal+mb_iconinformation+mb_ok);
            end
         else
            begin


               bTemTEF:= true;
               LimpaGridPagamentos;
//               ConfiguraTEF(sIPTEF, sIDLojaTEF, sIDTermTEF);
               if not (TotalizaCupom = 0) then
                  begin
                     btnOK.Enabled:= true;
                     exit;
                  end;
               if not PagamentoEfetuado then
               if not (EfetuaPagamentos = 0) then
                  begin
                     btnok.Enabled:= true;
                     exit;
                  end;

//                PagamentoEfetuado := True;

               if cValorCheque > 0 then
                  begin
                     if ACBrTEFD1.CHQ( cValorCheque ,sFormaCheque, IntToStr( iCOOVenda)) then
                        begin
                           bPodeEncerrarVenda:= true;   // estorno
                        end
                     else
                        begin

                           bPodeEncerrarVenda:= false;   // estorno
                           if KDialog( 'Você deseja finalizar com outra forma de pagamento?',
                           'SLPDV - Pagamentos', 'PERGUNTA' ) then
                              begin
                                 PagamentoEfetuado := false;
                                 CalcTrocoTemp;
                                 FormasPagamento;
                                 CalcTrocoTemp;
                              end
                           else
                              begin
                                 FrmVendasCaixa.CancelaTudo;
                                 Close;
                              end;

                        end;
                  end;

            end;
      end;

   { SE FOR CARTAO SEM TEF, ABRE O FORM PARA LANÇAR OS MESMOS }
   if (TotalizaFormasPagamento('CA') > 0) then
      begin

         if not bTEF then
            begin
               bTemTEF:= false;
               if (  not  Assigned( ListaFormas ) ) then
                  begin
                       Application.CreateForm(TFrmDadosAdm, FrmDadosAdm);
                       FrmDadosAdm.EdtValor.Text:= CurrToStr(TotalizaFormasPagamento('CA'));
                       FrmDadosAdm.EdtParcelamento.Text:= '1';
                       FrmDadosAdm.showmodal;
                  end;
            end
         else
            begin


               bTemTEF:= true;
               LimpaGridPagamentos;
//               ConfiguraTEF(sIPTEF, sIDLojaTEF, sIDTermTEF);
               if not (TotalizaCupom = 0) then
                  begin
                     btnOK.Enabled:= true;
                     exit;
                  end;
               if not PagamentoEfetuado then
               if not (EfetuaPagamentos = 0) then
                  begin
                     btnok.Enabled:= true;
                     exit;
                  end;

//                PagamentoEfetuado := True;
               if cValorTEF1 > 0 then
                  begin
                     if ACBrTEFD1.CRT( cValorTEF1 ,sFormaTEF1, IntToStr( iCOOVenda)) then
                        begin
                           if cValorTEF2 > 0 then
                              begin
                                 TEF1Autorizado := True;
                                 //cTefAutorizado := cTefAutorizado +  cValorTEF1;
                                 bPodeEncerrarVenda:= false;
                                 if cValorTEF2 > 0 then
                                    begin
                                       if ACBrTEFD1.CRT( cValorTEF2 ,sFormaTEF2, IntToStr( iCOOVenda)) then
                                          begin

                                             bPodeEncerrarVenda:= true;   // estorno
                                          end
                                       else
                                          begin
                                                   PagamentoCupomFiscal(iECF, iCOOVenda, iCCFVenda, ACBrTEFD1.RespostasPendentes.TotalPago, ACBrTEFD1.RespostasPendentes[0].IndiceFPG_ECF, '', 'N', iCodTEF1);
                                                   ACBrTEFD1.RespostasPendentes[0].OrdemPagamento := 1;
                                                   PagamentoEfetuado := false;
                                                   CalcTrocoTemp;
                                                   FormasPagamento;
                                                   CalcTrocoTemp;

                                          end;
                                    end;
                              end
                           else
                              bPodeEncerrarVenda:= true;   // estorno
                        end
                     else
                        begin
                                 bPodeEncerrarVenda:= false;   // estorno
                                 if cValorTEF2 > 0 then
                                    begin
                                       TEF1Autorizado := False;
                                       ACBrTEFD1.MultiplosCartoes := false;
                                       ACBrTEFD1.NumeroMaximoCartoes := 0;
                                    end;
                                 PagamentoEfetuado := false;
                                 CalculaTroco;
                                 FormasPagamento;
                                 CalculaTroco;
                        end;
                  end;


            end;
      end
      else
        bPodeEncerrarVenda := true;

        if iCodigoVenda = 0 then
           begin
              MostrarTroco := False;
              FrmFechaVenda.Close;
             exit;
           end;
   { ALTERAÇÃO IMPORTAÇÃO TXT }
   if bPodeEncerrarVenda then
      begin
          ProcessaVendaTxt;
      end;
   { FIM ALTERAÇÃO IMPORTAÇÃO TXT }
   if bPodeEncerrarVenda then
      begin
         if ACBrTEFD1.RespostasPendentes.Count > 0 then
         if bTemTEF and ( ACBrTEFD1.RespostasPendentes[ACBrTEFD1.RespostasPendentes.Count - 1].Saque > 0 ) then
            begin
               CDSformas.Locate( 'DESCRICAO', sDescricaoTEF1, [] );
               if trim( CDSFormasDESCRICAO.AsString ) = sDescricaoTEF1 then
                  begin
                     CDSFormas.Edit;
                     CDSFormasVALOR.AsCurrency := cValorTEF1 + ACBrTEFD1.RespostasPendentes[ACBrTEFD1.RespostasPendentes.Count - 1].Saque;
                     CDSFormas.Post;
                  end;
               PagamentoCupomFiscal(iECF, iCOOVenda, iCCFVenda, CDSFormasVALOR.AsCurrency, CDSFormasINDICE.AsString, CDSFormasDESCRICAO_ECF.AsString, 'N', CDSFormasCODIGO.AsInteger);

                                 CalculaTroco;
                                 FormasPagamento;
                                 CalculaTroco;
               MostrarTroco := True;
               try
                   dm.ECF.SubtotalizaCupom( cTotalDescontos, '' );
                   Sleep(200);
                   FazPagamentosVirtuais;
               except
                     btnOK.Enabled:= true;
                     exit;
               end;

               if not (FechaCupom = 0) then
                  begin
                     btnOK.Enabled:= true;
                     exit;
                  end;

               AcbrTefd1.ImprimirTransacoesPendentes;
            end;
         if not bTemTEF then
            begin
               if not  (   dm.ECF.Estado = estPagamento ) then
               if not (TotalizaCupom = 0)  then
                  begin
                     btnOK.Enabled:= true;
                     exit;
                  end;

//               if not PagamentoEfetuado then
               if not (EfetuaPagamentos = 0) then
                  begin
                     btnok.Enabled:= true;
                     exit;
                  end;


               try
                   if not  (   dm.ECF.Estado = estPagamento ) then
                       dm.ECF.SubtotalizaCupom( cTotalDescontos, '' );
                   FazPagamentosVirtuais;
               except
                     btnOK.Enabled:= true;
                     exit;
               end;

              if not (FechaCupom = 0) then
                  begin
                     btnOK.Enabled:= true;
                     exit;
                  end;

            end;
             if TEF1Autorizado then
                begin
                  ACBrTEFD1.ImprimirTransacoesPendentes;
                  TEF1Autorizado := False;
                end;
            TEF1Autorizado := false;
            cTefAutorizado := 0;
            cTotalPago := 0;

         if cTefTroco > 0 then
              begin
                  GravaTrocoCartaoH2( cTefTroco );
                  cTefTroco := 0;
              end;

         { ABRE A GAVETA }
         AbreGavetaFormas;

         { ATUALIZA A VENDA }
         AtualizaVenda;

         { ATUALIZA PRE-VENDA }
         if iCodPreVenda > 0 then
            FrmVendasCaixa.AtualizaPreVenda(1);

         { ATUALIZA O ORÇAMENTO }
         if iCodOrcamento > 0 then
            FrmVendasCaixa.AtualizaOrcamento(1);

         { ATUALIZA A OS }
         if iCodOrdemServico > 0 then
            FrmVendasCaixa.AtualizaOrdemServico(1);

         { ATUALIZA A CONTA CLIENTE }
         if iCodContaCliente > 0 then
            FrmVendasCaixa.AtualizaContaCliente(1, iCodContaCliente);

         { ATUALIZA A CONTA CLIENTE - MESA }
         if FrmVendasCaixa.Tag = 1 then
            FrmVendasCaixa.AtualizaContaCliente(1, iCodMesa);

         { ATUALIZA A CONTA CLIENTE ITENS SELECIONADOS }
         if FrmVendasCaixa.Tag = 3 then
            FrmVendasCaixa.AtualizaItensSelecionados;

         { GRAVA O GT DA ECF }
         GravaGT(iECF);

         if ( ValorPR > 0 ) and (bImprimeCupomNaoFiscal) then
            ImprimePromissoria( ValorPR);

         if ( TrocoJanela > 0 ) and ( opVale ) then
            begin
               ImprimeContraVale( TrocoJanela );
               TrocoJanela := 0;
            end;

         { zerando as variáveis }
         iCodMesa:= 0;
         iCOOMesa:= 0;
         iECFMesa:= 0;
         FrmVendasCaixa.LimpaNovaVenda;

         MostrarTroco := True;
         FrmFechaVenda.Close;
         if ( FrmVendasCaixa.Tag = 1 ) or ( FrmVendasCaixa.Tag = 3 ) then
            begin
               FrmMesas.LimpaTudo;
               FrmVendasCaixa.Close;
            end;
      end
   else
      begin
         DBGridFormas.SetFocus;
         BtnOk.Enabled:= true;
      end;
end;

procedure TFrmFechaVenda.btnPagamentoMoedasClick(Sender: TObject);
var
   Cot: string;
begin
   {pnlMoedas.Visible := False;
   DBGridFormas.Enabled := True;
   DBGridFormas.SetFocus;
   CalcTrocoTemp;}
   if edtValor.Value > 0 then
      begin
         Cot := cbbMoedas.Value;
         if Cot[1] = 'D' then
            begin
               Delete( Cot, 1, 1 );
               PagamentoCupomFiscal(iECF, iCOOVenda, iCCFVenda,
                  edtValor.Value * StrToCurr( Cot ), DM.BuscaIndiceForma( DM.BuscaFormaPagamento( 'DN' ) ),
                  'DINHEIRO', 'N', DM.BuscaFormaPagamento( 'DN' ));
            end;
         if Cot[1] = 'M' then
            begin
               Delete( Cot, 1, 1 );
               PagamentoCupomFiscal(iECF, iCOOVenda, iCCFVenda,
                  edtValor.Value / StrToCurr( Cot ), DM.BuscaIndiceForma( DM.BuscaFormaPagamento( 'DN' ) ),
                  'DINHEIRO', 'N', DM.BuscaFormaPagamento( 'DN' ));
            end;
      end;
   CalcTrocoTemp;
   AbreMoedas;
end;

procedure TFrmFechaVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if TEF1Autorizado then
      begin
         if KDialog( 'Você tem TEFs Pendentes deseja cancelar a venda?', 'SLPDV - TEF', 'PERGUNTA' ) then
            begin
               FrmVendasCaixa.CancelaTudo;
               ACBrTEFD1.CancelarTransacoesPendentes;
               cTefAutorizado := 0;
            end
         else
            begin
               Action := caNone;
               Abort;
            end;
      end;
   TEF1Autorizado := false;
   CDSFormas.Close;
   if not ( frmTEFDiscado = nil ) then
      begin
         if frmTefDiscado.Showing then
            frmTefDiscado.Close
         else
            FreeAndNil( frmTefDiscado );

      end;
   if ( TrocoJanela > 0 ) and MostrarTroco then
      begin
         hide;
         Application.ProcessMessages;
         Sleep(200);
         Application.CreateForm( TfrmTroco, frmTroco );
         frmTroco.Troco := TrocoJanela;
         frmTroco.ShowModal;
         frmTroco.Release;
         frmTroco := nil;
      end;

end;

procedure TFrmFechaVenda.QBuscaItensCalcFields(DataSet: TDataSet);
begin
   QBuscaItensTOTAL.AsCurrency:= QBuscaItensQUANT.AsCurrency * QBuscaItensVALOR.AsCurrency;
end;

procedure TFrmFechaVenda.setOpvale(value: Boolean);
begin
   fopvale := Value;
   opValeok.Visible := fopvale;
   opValeno.Visible := not fopvale;
end;

function TFrmFechaVenda.FechaCupom : integer;
var
   I: Integer;
begin
   I := FechaCupomFiscal(iECF, sNomeCliente, sDocCliente, sEndCliente, iSequenciaPreVenda, iSequenciaDAV, iSequenciaDAVOS, iECFMesa, iCOOMesa, iCERMesa, iNumMesa);
   result:= I;
end;

function TFrmFechaVenda.TotalizaCupom : integer;
begin
   result:= IniciaFechamentoCupomFiscal(iECF, cDescontoVenda);
end;

function TFrmFechaVenda.EfetuaPagamentos : integer;
begin
      begin
         with CDSFormas do
            begin
              first;
              while not eof do
                begin
                    if btef and not (trim( CDSFormasUSA_TEF.Value ) = 'S') then
                      begin
                        if CDSFormasVALOR.AsCurrency > 0 then
                           begin
                              result:= PagamentoCupomFiscal(iECF, iCOOVenda, iCCFVenda, CDSFormasVALOR.AsCurrency, CDSFormasINDICE.AsString, CDSFormasDESCRICAO_ECF.AsString, 'N', CDSFormasCODIGO.AsInteger);
                              PagamentoEfetuado := True;
                           end;
                      end;
                   if bTef and (trim( CDSFormasUSA_TEF.Value ) = 'S') then
                      Result := 0;
                   if not btef then
                      begin
                         if CDSFormasVALOR.AsCurrency > 0 then
                            begin
                              result:= PagamentoCupomFiscal(iECF, iCOOVenda, iCCFVenda, CDSFormasVALOR.AsCurrency, CDSFormasINDICE.AsString, CDSFormasDESCRICAO_ECF.AsString, 'N', CDSFormasCODIGO.AsInteger);
                              PagamentoEfetuado := True;
                            end;
                      end;
                   next;
                end;
            end;
      end;
end;

procedure TFrmFechaVenda.DBGridFormasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   { Para não deixar apagar o registro }
  if  Key = VK_DELETE then
      Key:= VK_NONAME
  {endif};

  Key:= NaoInsereDBGrid(TDBGrid(Sender), TDBGrid(Sender).DataSource.DataSet, Key);
  if ( key = VK_F6 ) and ( edtTotVenda.Value > 0 ) then
     begin
        CDSFormas.Edit;
        CDSFormasVALOR.AsCurrency := edtTotVenda.Value;
        CDSFormas.Post;
        CDSFormas.Next;
     end;

   if key=13 then
   if dsformas.DataSet.Eof then
       SelectNext(ActiveControl, True, True)
   else
      begin

         dsformas.DataSet.Next;
      end;





end;

procedure TFrmFechaVenda.FormasPagamento;
var sFormaCliente : string;

begin
   Ativa := False;
   { busca a forma de pagamento do cliente }
   sFormaCliente:= DM.RetornaStringTabela('tipo_credito_cli', 'cliente', 'cod_cli', iCodCliente);

   { criando o dataset }
   dsF.Close;
   dsF.CreateDataSet;
   dsF.Open;
   dsF.EmptyDataSet;
   cdsformas.Close;
   CDSFormas.CreateDataSet;
   CDSFormas.IndexFieldNames:= 'codigo';
   CDSFormas.Open;

   { montando o ClientDataSet com as formas de pagamento }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT I.INDICE, I.DESCRICAO_ECF, F.* ' +
                        'FROM INDICE_FORMA_PAGAMENTO I ' +
                        'INNER JOIN FORMAS_PAGAMENTO F ' +
                        'ON (I.COD_FORMA = F.CODIGO)   ' +
                        'WHERE I.COD_CAIXA = :CODCAI AND I.COD_EMP = :CODEMP AND ' +
                        'F.USAR_PAF_ECF = ' + #39 + 'S' + #39 + ' AND F.TIPO <> ' + #39 + 'TR' + #39 +
                        ' AND F.TIPO <> ' + #39 + 'TV' + #39 +
                        ' ORDER BY F.CODIGO';
             Parambyname('codcai').AsInteger:= iCaixa;
             Parambyname('codemp').AsInteger:= iEmp;
             open;
             while not eof do
                begin
                   if (trim(fieldbyname('tipo').AsString) = 'DN') or
                      (trim(fieldbyname('tipo').AsString) = 'CA') or
                      (trim(fieldbyname('tipo').AsString) = 'CV') or
                      (trim(fieldbyname('tipo').AsString) = 'TI') or

                      ((trim(sFormaCliente) = 'PR') and (trim(fieldbyname('tipo').AsString) = 'PR')) or
                      ((trim(sFormaCliente) = 'CH') and (trim(fieldbyname('tipo').AsString) = 'CH')) or
                      ((trim(sFormaCliente) = 'CH') and (trim(fieldbyname('tipo').AsString) = 'CC')) or
                      ((trim(sFormaCliente) = 'BO') and (trim(fieldbyname('tipo').AsString) = 'BO')) or
                      ((trim(sFormaCliente) = 'PC') and ((trim(fieldbyname('tipo').AsString) = 'PR') or (trim(fieldbyname('tipo').AsString) = 'CH')
                      or (trim(fieldbyname('tipo').AsString) = 'CC')or (trim(fieldbyname('tipo').AsString) = 'BO'))) then

                         begin
                            CDSFormas.Insert;
                            CDSFormasCODIGO.AsInteger           := fieldbyname('codigo').AsInteger;
                            CDSFormasDESCRICAO.AsString         := fieldbyname('descricao').AsString;
                            if FieldByName('codigo').AsInteger = iFormaPagamento then
                               begin
                                  // AQUI
                                   edtTotVenda.Value := cTotalVenda;
                                   if ( (cTotalVenda - cDescontoVenda) - ( cTotalPago + cTefAutorizado ) ) < 0 then
                                      CDSFormasVALOR.AsCurrency := 0
                                   else
                                      CDSFormasVALOR.AsCurrency        := (cTotalVenda - cDescontoVenda) - ( cTotalPago + cTefAutorizado );
                               end
                            else
                               CDSFormasVALOR.AsCurrency        := 0;
                            CDSFormasTIPO.AsString              := trim(fieldbyname('tipo').AsString);
                            CDSFormasUSA_TEF.AsString           := trim(fieldbyname('usa_tef').AsString);
                            CDSFormasABRE_GAVETA.AsString       := trim(fieldbyname('abre_gaveta').AsString);
                            CDSFormasINDICE.AsString            := trim(fieldbyname('indice').AsString);
                            CDSFormasDESCRICAO_ECF.AsString     := trim(fieldbyname('descricao_ecf').AsString);
                            CDSFormasCONCEDER_DESCONTO.AsString := trim(fieldbyname('conceder_desconto').AsString);
                           {  ALTERAÇÃO IMPORTACAO TXT }
                           if Assigned( ListaFormas ) then
                                begin
                                   CDSFormasVALOR.AsCurrency  :=
                                      ListaFormas.BuscaValor( trim(fieldbyname('tipo').AsString ) );
                                end;
                           { FIM ALTERAÇÃO IMPORTACAO TXT }
                            CDSFormas.Post;
                         end;
                   next;
                end;
          end;
       dm.IBTransaction.Commit;
          Ativa := True;
     except
       dm.IBTransaction.Rollback;
       showmessage('erro ao buscar as formas de pagamento');
     end;
   finally
     dm.QConsulta.close;
     CDSFormas.First;
     Ativa := True;
   end;
end;

procedure TFrmFechaVenda.FormCreate(Sender: TObject);
begin
   dm.ScaleForm( Self, False );
   ACBrTEFD1.MultiplosCartoes := False;
   ACBrTEFD1.NumeroMaximoCartoes := 0;

   MostrarTroco := False;
   if iCodMesa > 0 then
      begin
         FazPagamentosAdiantamentos;
      end;
   FormasPagamento;
   CalculaTroco;
   FormasPagamento;
   ACBRTEFD1.TEFVeSPague.EnderecoIP := IPServidor;
  if bTef then
     begin
        if TipoTEF = 4 then
            begin
               FrmFechaVenda.ACBrTEFD1.TEFCliSiTef.CodigoLoja := sIDLojaTEF;
               FrmFechaVenda.ACBrTEFD1.TEFCliSiTef.EnderecoIP := sIPTEF;
               FrmFechaVenda.ACBrTEFD1.TEFCliSiTef.NumeroTerminal := sIDTermTEF;
            end;

        ACBrTEFD1.Inicializar(  TACBrTEFDTipo( TipoTef ) );
     end;

end;

procedure TFrmFechaVenda.CDSFormasAfterOpen(DataSet: TDataSet);
begin
   CDSFormasVALOR.MaxValue:= cValorMaximo;
end;

procedure TFrmFechaVenda.CDSFormasAfterPost(DataSet: TDataSet);
begin
    CalcTrocoTemp;
end;

procedure TFrmFechaVenda.CDSFormasBeforePost(DataSet: TDataSet);
begin
   dsF.Locate( 'cod', CDSFormasCODIGO.AsInteger, [] );
   if dsFcod.AsInteger <> CDSFormasCODIGO.AsInteger then
      dsF.Insert
   else
      dsF.Edit;
   dsFcod.AsInteger := CDSFormasCODIGO.AsInteger;
   dsFvalor.AsCurrency := CDSFormasVALOR.AsCurrency;
   dsF.Post;

end;

procedure TFrmFechaVenda.CDSFormasVALORSetText(Sender: TField;
  const Text: string);
begin
   if StrToFloat( Text ) < 0 then
      begin
         KDialog( 'Não é permitido pagamento negativo!', 'SLPDV - Aviso', 'INFO');
         Exit;
         Abort;
      end
   else
      CDSFormasvalor.AsCurrency := StrToFloat( Text );
end;

procedure TFrmFechaVenda.ContabilizaAlterados;
var  A, N: Integer;
    Valor: Double;
    ValorT: Double;
begin
   A := 0;
   N := 0;
   Valor := 0;
   ValorT := 0;
   CDSFormas.First;
   while not CDSFormas.Eof do
      begin
          if CDSFormasVALOR.AsCurrency  <> CDSFormasVALORANTIGO.AsCurrency then
             begin
                Inc( a );
                ValorT := ValorT + CDSFormasVALOR.AsCurrency;
             end
          else
             if CDSFormasVALOR.AsCurrency > 0 then
                begin
                    Inc( N );
                    CDSFormasATUALIZA.AsString := 'S';
                end
             else
                begin
                    CDSFormasATUALIZA.AsString := 'N';
                end;
          CDSFormas.Next;
      end;
   Valor := ValorT / N;
   CDSFormas.First;
   while not CDSFormas.Eof do
      begin
        if CDSFormasATUALIZA.AsString = 'S' then
           begin
             CDSFormasVALOR.AsCurrency := Valor;
             CDSFormasVALORANTIGO.AsCurrency := Valor;
             CDSFormasATUALIZA.AsString := 'N';
           end;
        CDSFormas.Next;
      end;
end;

procedure TFrmFechaVenda.CalcTrocoTemp;
var
  cValorTroco: Currency;
begin
   CTotalInformado := 0;
   dsF.First;
   while not dsF.Eof do
      begin
         CTotalInformado := CTotalInformado + dsFvalor.AsCurrency;
         dsF.Next;
      end;
   edtPago.Value := cTotalPago + cTefAutorizado;
   edtTotVenda.Value := ( (cTotalVenda - cDescontoVenda) - ( cTotalPago + cTefAutorizado ) )- CTotalInformado;
   cValorTroco:= CTotalInformado - ((cTotalVenda - cDescontoVenda) - ( cTotalPago + cTefAutorizado ));
   EdtTroco.Text:= currtostr(cValorTroco);
   TrocoJanela := cValorTroco;

end;
procedure TFrmFechaVenda.CalculaTroco;
var cTotalFormas, cValorTroco : currency;
Total2: Currency;
subTotal2: Currency;
pago2: Currency;
begin
   CalcTrocoTemp;
   {cTotalFormas:= 0;
   cValorTroco := 0;
   TrocoJanela := 0;

   with CDSFormas do
      begin
         First;
         while not eof do
            begin
               cTotalFormas:= cTotalFormas + CDSFormasVALOR.AsCurrency;
               next;
            end;
      end;

   edtPago.Value := cTotalPago + cTefAutorizado;
   edtTotVenda.Value := (cTotalVenda - cDescontoVenda) - ( cTotalPago + cTefAutorizado );
   cValorTroco:= cTotalFormas - ((cTotalVenda - cDescontoVenda) - ( cTotalPago + cTefAutorizado ));
   EdtTroco.Text:= currtostr(cValorTroco);
   TrocoJanela := cValorTroco;}
end;

procedure TFrmFechaVenda.cbbMoedasChange(Sender: TObject);
var
   Abre: String;
begin
   Abre := Copy( cbbMoedas.Text, 1, 3 );
   edtValor.DisplayFormat := Abre + ' ,0.00;-' + Abre + ' ,0.00';
end;

procedure TFrmFechaVenda.cbbMoedasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   Cot: String;
begin
   if Key = VK_RETURN then
      BEGIN
          Cot := cbbMoedas.Value;
          if Cot[1] = 'D' then
             begin
                Delete( Cot, 1, 1);
                edtValor.Value := edtTotVenda.Value / StrToCurr( Cot );
             end;
          if Cot[1] = 'M' then
             begin
                Delete( Cot, 1, 1);
                edtValor.Value := edtTotVenda.Value * StrToCurr( Cot );
             end;
      END;

end;


procedure TFrmFechaVenda.DBGridFormasExit(Sender: TObject);
begin
   CalculaTroco;
end;

procedure TFrmFechaVenda.DBGridFormasEnter(Sender: TObject);
begin
   if CDSFormas.Active then
      begin
         CDSFormas.First;
         DBGridFormas.SelectedIndex:= 1;
      end;
   // CalcTrocoTemp;
end;

procedure TFrmFechaVenda.DBGridFormasColEnter(Sender: TObject);
begin
   if DBGridFormas.SelectedIndex = 0 then
      DBGridFormas.SelectedIndex:= 1;
end;

function TFrmFechaVenda.TotalizaFormasPagamento(const sTipo : string) : currency;
var cTotalForma : currency;
begin
   iQuantidadeTransacoesTEFCupom:= 0;
   cTotalForma := 0;
   cValorTEF1  := 0;
   cValorTEF2  := 0;
   cValorCheque := 0;

   with CDSFormas do
      begin
         First;
         while not eof do
            begin
               if trim(CDSFormasTIPO.AsString) = trim(sTipo) then
                  cTotalForma:= cTotalForma + CDSFormasVALOR.AsCurrency;


               if (trim(sTipo) = 'CC') and (trim(CDSFormasUSA_TEF.AsString) = 'S') and (CDSFormasVALOR.AsCurrency > 0) then
                  begin
                     cValorCheque := CDSFormasVALOR.AsCurrency;
                     sFormaCheque := trim(CDSFormasINDICE.AsString);
                  end;

               // somente até 2 transações com TEF
               if (trim(sTipo) = 'CA') and (trim(CDSFormasUSA_TEF.AsString) = 'S') and (CDSFormasVALOR.AsCurrency > 0) then
                  begin
                     iQuantidadeTransacoesTEFCupom:= iQuantidadeTransacoesTEFCupom + 1;
                     case iQuantidadeTransacoesTEFCupom of
                       1: begin
                             cValorTEF1:= CDSFormasVALOR.AsCurrency;
                             sFormaTEF1:= trim(CDSFormasINDICE.AsString);
                             iCodTEF1 := CDSFormasCODIGO.AsInteger;
                             sDescricaoTEF1 := CDSFormasDESCRICAO.AsString;
                             if not ACBrTEFD1.MultiplosCartoes then
                                begin
                                   ACBrTEFD1.MultiplosCartoes := False;
                                   ACBrTEFD1.NumeroMaximoCartoes := 0;
                                end;

                          end;
                       2: begin
                             if TEF1Autorizado then
                                begin
                                   ShowMessage( 'Você já tem TEFs autorizados!' + #13 + 'Limite de TEFs 2.' );
                                   btnOK.Enabled:= true;
                                   FormasPagamento;
                                   CalculaTroco;
                                   Abort;
                                end;
                             cValorTEF2:= CDSFormasVALOR.AsCurrency;
                             sFormaTEF2:= trim(CDSFormasINDICE.AsString);
                             ACBrTEFD1.MultiplosCartoes := True;
                             ACBrTEFD1.NumeroMaximoCartoes := 2;
                          end;
                     end;
                  end;

               next;
            end;
      end;
   result:= cTotalForma;
end;

procedure TFrmFechaVenda.ZeraFormas;
begin
   CDSFormas.First;
   while not CDSFormas.Eof do
       begin
          CDSFormas.Edit;
          CDSFormasVALOR.AsCurrency := 0;
          CDSFormas.Post;
          CDSFormas.Next;
       end;
end;

procedure TFrmFechaVenda.FormasComDesconto;
var bAux : boolean;
begin
   bAux:= false;

   with CDSFormas do
      begin
         DisableControls;
         First;

         { verfifica se tem alguma forma que concede desconto }
         while not eof do
            begin
               if trim(CDSFormasCONCEDER_DESCONTO.AsString) = 'S' then
                  bAux:= true;
               next;
            end;

         if bAux then
            begin
               First;
               while not eof do
                  begin
                     if trim(CDSFormasCONCEDER_DESCONTO.AsString) = 'N' then
                        Delete
                     else
                        begin
                           edit;
                           if FieldByName('codigo').AsInteger = iFormaPagamento then
                              CDSFormasVALOR.AsCurrency:= (cTotalVenda - cDescontoVenda) - (cTotalPago + cTefAutorizado )
                           else
                              CDSFormasVALOR.AsCurrency:= 0;
                           if Assigned( ListaFormas ) then
                                begin
                                   CDSFormasVALOR.AsCurrency  :=
                                      ListaFormas.BuscaValor( trim(fieldbyname('tipo').AsString ) );
                                end;

                           post;
                        end;
                     next;
                  end;
            end
         else
            begin
               cDescontoVenda:= 0;
               EdtPercentualDesconto.Clear;
               EdtValorDesconto.Clear;
               PanelDescontos( false );
               showmessage('Formas de Pagamento não concedem desconto');
            end;

         First;
         EnableControls;
      end;
end;

procedure TFrmFechaVenda.AbreGavetaFormas;
begin
   with CDSFormas do
      begin
         DisableControls;
         First;
         while not eof do
            begin
               if CDSFormasVALOR.AsCurrency > 0 then
                  begin
                     if trim(CDSFormasABRE_GAVETA.AsString) = 'S' then
                        AbreGaveta(iECF, IGaveta);
                  end;
               next;
            end;
         First;
         EnableControls;
      end;
end;

procedure TFrmFechaVenda.LimpaGridPagamentos;
var i, j : integer;
begin
//   for i:= 0 to GridPagamentos.RowCount - 1 do
  //    begin
    //     for j:= 0 to GridPagamentos.ColCount - 1 do
      //      begin
        //       GridPagamentos.Cells[j, i]:= '';
          //  end;
   //   end;
end;

procedure TFrmfechaVenda.PanelDescontos(Valor: Boolean);
begin
   EdtPercentualDesconto.Enabled := valor;
   EdtValorDesconto.Enabled := Valor;
end;

procedure TFrmFechaVenda.ProcessaVendaTxt;
var
   I: Integer;
   CodCheque: Integer;
begin
//
   if not Assigned( ListaParcelas ) then
      exit;
   if ListaParcelas.Count = 0 then
      Exit;
   DeleteParcelas;
   if ( ListaFormas.Count > 0 ) and
   ( ( TotalizaFormasPagamento( 'PR' ) > 0 ) or
   ( TotalizaFormasPagamento( 'CH' ) > 0 )   ) then
   for I := 0 to ListaParcelas.Count - 1 do
      begin
         if ListaParcelas[I].Tipo = 'CH' then
            Continue;
         if IBTRParc.Active then
            IBTRParc.Commit;
         IBTRParc.StartTransaction;
         with QGeraParc do
            begin
               close;
               Parambyname('seq').AsInteger          := ListaParcelas[I].Parcela;
               Parambyname('codemp').AsInteger       := iEmp;
               Parambyname('datactr').Value          := Date;
               Parambyname('codvenda').AsInteger  := iCodigoVenda;
               Parambyname('codcli').AsInteger       := iCodCliente;
               Parambyname('venctoctr').Value        := ListaParcelas[I].Vencimento;
               Parambyname('valorctr').AsCurrency    := ListaParcelas[I].Valor;
               Parambyname('codcai').AsInteger       := iCaixa;
               Parambyname('parc').AsInteger         := ListaParcelas[I].Parcela;
               Parambyname('dtpagtoctr').Value       := null;
               Parambyname('vlrpagoctr').Value       := null;
               Parambyname('codcob').AsInteger       := 1;
               Parambyname('documento').AsString     := 'COO ' + inttostr(iCOOVenda);
               Parambyname('codcla').AsInteger       := 1;
               ExecOrOpen;
            end;
         IBTRParc.Commit;
         QGeraParc.Close;

      end;
   if ( ListaFormas.Count > 0 ) and
   ( ( TotalizaFormasPagamento( 'PR' ) > 0 ) or
   ( TotalizaFormasPagamento( 'CH' ) > 0 )   )then
   for I := 0 to ListaParcelas.Count - 1 do
       begin
          if ListaParcelas[I].Tipo <> 'CH' then
             Continue;
          if IBTRLancCheque.Active then
                IBTRLancCheque.Commit;
             IBTRLancCheque.StartTransaction;
          with IBSQLCheque do
          begin
             close;
             sql.Clear;
             CodCheque:= prxcod('cheque', 'cod_che', dm.IBTransaction, dm.ibsqlcod);
             sql.Add('INSERT INTO CHEQUE(COD_CHE, COD_CLI, COD_BANCO, AGENCIA_CHE, ' +
                     'CONTA_CHE, NUMERO_CHE, EMISSAO_CHE, VENCTO_CHE, VALOR_CHE, OBS_CHE, COD_EMP, ' +
                     'COD_EMITENTE, COD_VENDA, COD_CAIXA, COD_USUARIO, DESC_CLI, DESC_EMI, DESC_BANCO) ' +
                     'VALUES(:CODCHE, :CODCLI, :CODBANCO, :AGENCIACHE, :CONTACHE, :NUMEROCHE, ' +
                     ':EMISSAOCHE, :VENCTOCHE, :VALORCHE, :OBSCHE, :CODEMP, :CODEMITENTE, ' +
                     ':CODVENDA, :CODCAIXA, :CODUSU, :DESC_CLI, :DESC_EMI, :DESC_BANCO)');
             Parambyname('codche').AsInteger        := CodCheque;
             Parambyname('codcli').AsInteger        := iCodCliente;
             Parambyname('codbanco').AsInteger      := 1;
             Parambyname('agenciache').AsString     := '';
             Parambyname('contache').AsString       := '';
             Parambyname('numeroche').AsString      := ListaParcelas[I].Num;
             Parambyname('emissaoche').AsDate       := date;
             Parambyname('venctoche').AsDate        := ListaParcelas[I].Vencimento;
             Parambyname('valorche').AsCurrency     := ListaParcelas[I].Valor;
             Parambyname('obsche').AsString         := '';
             Parambyname('codemp').AsInteger        := iEmp;
             Parambyname('codemitente').AsInteger   := iCodCliente;
             ParamByName('DESC_CLI').AsString       := '';
             ParamByName('DESC_EMI' ).AsString      := '';
             ParamByName('DESC_BANCO').AsString     := '';
             Parambyname('codvenda').AsInteger   := iCodigoVenda;
             Parambyname('codcaixa').AsInteger      := iCaixa;
             Parambyname('codusu').AsInteger        := ICodUsu;
             ExecOrOpen;
          end;
          IBTRLancCheque.Commit;
       end;
end;

procedure TFrmFechaVenda.FazPagamentosAdiantamentos;
var
   cTotalAd: Currency;
begin
   if JaFezAdiantamento then
      Exit;
   cTotalAd := 0;
   try
       if not dm.IBDatabaseServer.Connected then
          Exit;
       if dm.IBTRServer.Active then
           DM.IBTRServer.Commit;
       dm.IBTRServer.StartTransaction;

       with DM.QConsultaServer do
           begin
              Close;
              SQL.Text :=  'select SUM( VALOR ) from ADIANTAMENTO_CONTA_CLIENTE' +
                           ' where CODIGO=:COD';
              ParamByName( 'COD' ).AsInteger := iCodMesa;
              Open;
              cTotalAd := FieldByName( 'SUM' ).AsCurrency;
               Close;
           end;

       PagamentoCupomFiscal(iECF, iCOOVenda, iCCFVenda,
       cTotalAd, DM.BuscaIndiceForma( DM.BuscaFormaPagamento( 'DN' ) ),
       'DINHEIRO', 'N', DM.BuscaFormaPagamento( 'DN' ));
       JaFezAdiantamento := True;
       dm.IBTRServer.Commit;
   except
       DM.IBTRServer.Rollback;
   end;
end;

procedure TFrmFechaVenda.FazPagamentosVirtuais;
var
  iCOO, iCCF: Integer;
  cValor: Currency;
  sIndice: String;
  sDescricao: String;
begin
  //

  FrmVendasCaixa.PagamentosEfetuados.First;
  while not FrmVendasCaixa.PagamentosEfetuados.Eof do
     begin
       if Trim(FrmVendasCaixa.PagamentosEfetuadosSAIUECF.AsString ) = 'N' then
          begin
             iCOO := FrmVendasCaixa.PagamentosEfetuadosCOO.AsInteger;
             iCCF := FrmVendasCaixa.PagamentosEfetuadosCCF.AsInteger;
             cValor := FrmVendasCaixa.PagamentosEfetuadosVALOR.AsCurrency;
             sIndice := FrmVendasCaixa.PagamentosEfetuadosINDICE.AsString;
             sDescricao := FrmVendasCaixa.PagamentosEfetuadosDESCRICAO.AsString;
             if PagamentoCupomFiscal2( 0, iCOO, iCCF, cValor, sIndice, sDescricao ) = 0 then
                begin
                   FrmVendasCaixa.PagamentosEfetuados.Edit;
                   FrmVendasCaixa.PagamentosEfetuadosSAIUECF.AsString := 'S';
                   FrmVendasCaixa.PagamentosEfetuados.Post;
                             Sleep(200);
                end;

          end;
       FrmVendasCaixa.PagamentosEfetuados.Next;
     end;
end;

procedure TFrmFechaVenda.DeleteParcelas;
begin
   if IBTRParc.Active then
      IBTRParc.Commit;
//   QBuscaParc.Close;
   IBTRParc.StartTransaction;
   with QDelParcelas do
      begin
         close;
         sql.Clear;
         sql.Text:= 'DELETE FROM CONTAS_RECEBER ' +
                    'WHERE COD_VENDA = :CODVENDA';
         Parambyname('codvenda').AsInteger:= iCodigoVenda;
         ExecOrOpen;
      end;
   with QDelParcelas do
      begin
         close;
         sql.Clear;
         sql.Text:= 'DELETE FROM CHEQUE ' +
                    'WHERE COD_VENDA = :CODVENDA';
         Parambyname('codvenda').AsInteger:= iCodigoVenda;
         ExecOrOpen;
      end;

   IBTRParc.Commit;

   QDelParcelas.Close;
end;




end.
