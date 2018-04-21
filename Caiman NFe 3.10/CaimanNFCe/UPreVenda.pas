unit UPreVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ImgList, ComCtrls, ToolWin, ExtCtrls, Buttons, StdCtrls, Grids, 
  DBGrids, Mask, rxToolEdit, rxCurrEdit, DB, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmPreVenda = class(TForm)
    Panel3: TPanel;
    Panel4: TPanel;
    EdtCod: TEdit;
    Label2: TLabel;
    Label21: TLabel;
    EdtCodcli: TEdit;
    BtnConsCli: TsSpeedButton;
    EdtNomecli: TEdit;
    Label3: TLabel;
    EdtCodVend: TEdit;
    BtnConsVend: TsSpeedButton;
    EdtNomeVend: TEdit;
    Label4: TLabel;
    EdtCodTPV: TEdit;
    Label5: TLabel;
    BtnConsTPV: TsSpeedButton;
    EdtNomeTPV: TEdit;
    Label6: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    EdtCodPro: TEdit;
    BtnConsPro: TsSpeedButton;
    EdtNomePro: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    EdtQuant: TCurrencyEdit;
    EdtValorUnit: TCurrencyEdit;
    Label20: TLabel;
    EdtDescVr: TCurrencyEdit;
    Label23: TLabel;
    EdtTotalProd: TCurrencyEdit;
    Label24: TLabel;
    BtnGrava: TBitBtn;
    BtnCancelar: TBitBtn;
    DBGrid1: TDBGrid;
    GBTotal: TGroupBox;
    Label11: TLabel;
    EdtTotalBruto: TCurrencyEdit;
    Label7: TLabel;
    EdtTotalDesc: TCurrencyEdit;
    Label8: TLabel;
    EdtTotalLiq: TCurrencyEdit;
    QBuscaItens: TFDQuery;
    DSBuscaItens: TDataSource;
    IBTRPreVenda: TFDTransaction;
    IBSQLPre: TFDQuery;
    QInsPreVenda: TFDQuery;
    QInsPreVendaCODPRE: TIntegerField;
    Label10: TLabel;
    EdtDescPerc: TCurrencyEdit;
    Label14: TLabel;
    EdtTotalBR: TCurrencyEdit;
    Shape1: TShape;
    Label22: TLabel;
    QBuscaItensCOD_PRE: TIntegerField;
    QBuscaItensORDEM: TIntegerField;
    QBuscaItensCOD_PRO: TIntegerField;
    QBuscaItensDESCONTO: TBCDField;
    QBuscaItensCOD_EMP: TIntegerField;
    QBuscaItensQUANT: TBCDField;
    QBuscaItensVALOR: TBCDField;
    QBuscaItensPRODUTO_PROMOCAO: TStringField;
    QBuscaItensNOME_PRO: TStringField;
    QBuscaItensCALC_TOTAL: TCurrencyField;
    Label9: TLabel;
    EdtSequencia: TEdit;
    QInsPreVendaSEQUENCIA: TLargeintField;
    EdtData: TMaskEdit;
    ToolBar1: TToolBar;
    BtnGravar: TToolButton;
    BtnAlterar: TToolButton;
    BtnSair: TToolButton;
    ImageList: TImageList;
    ToolButton1: TToolButton;
    BtnFechar: TToolButton;
    StatusBar1: TStatusBar;
    PanelJuntarPreVenda: TPanel;
    EdtSenhaPreVenda: TEdit;
    Label1: TLabel;
    BtnOK: TButton;
    StatusBar2: TStatusBar;
    QBuscaItensCANCELADO: TIntegerField;
    QBuscaIndice: TFDQuery;
    QBuscaIndiceINDICE_ECF: TStringField;
    QItensPreVenda: TFDQuery;
    QItensPreVendaCOD_PRE: TIntegerField;
    QItensPreVendaORDEM: TIntegerField;
    QItensPreVendaCOD_PRO: TIntegerField;
    QItensPreVendaDESCONTO: TBCDField;
    QItensPreVendaCOD_EMP: TIntegerField;
    QItensPreVendaQUANT: TBCDField;
    QItensPreVendaVALOR: TBCDField;
    QItensPreVendaPRODUTO_PROMOCAO: TStringField;
    QItensPreVendaCANCELADO: TIntegerField;
    QItensPreVendaDESC_CUPOM: TStringField;
    QItensPreVendaICMS_CF_EST: TIntegerField;
    QItensPreVendaCODIGO_BARRA_PRO: TStringField;
    QBuscaItensDESCRICAO: TStringField;
    QItensPreVendaDESCRICAO: TStringField;
    procedure EdtCodcliEnter(Sender: TObject);
    procedure EdtCodcliExit(Sender: TObject);
    procedure EdtCodcliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodcliKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodVendEnter(Sender: TObject);
    procedure EdtCodVendExit(Sender: TObject);
    procedure EdtCodVendKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodTPVEnter(Sender: TObject);
    procedure EdtCodTPVExit(Sender: TObject);
    procedure EdtCodTPVKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsCliClick(Sender: TObject);
    procedure BtnConsVendClick(Sender: TObject);
    procedure BtnConsTPVClick(Sender: TObject);
    procedure EdtCodProEnter(Sender: TObject);
    procedure EdtCodProExit(Sender: TObject);
    procedure EdtCodProKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsProClick(Sender: TObject);
    procedure Botoes(acao : string);
    procedure BuscaItens;
    procedure LimpaItens;
    procedure BtnGravaClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure QBuscaItensCalcFields(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure EdtValorUnitExit(Sender: TObject);
    procedure EdtDescVrExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtDescPercExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure LimpaNovaPreVenda;
    procedure BtnOKClick(Sender: TObject);
    procedure BuscaPreVenda(const sSenha : string);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    function  AbreVenda : integer;
    function  RegistraProduto(const IcodPreVenda : integer) : integer;
    function  BuscaIndice(iCodigoGRP : integer) : string;
    function  TotalizaCupom : integer;
    function  EfetuaPagamentos(const cValor : currency) : integer;
    function  FechaCupom : integer;
    procedure CancelaPreVenda;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPreVenda: TFrmPreVenda;
  iClienteVista  : integer;
  bPreVendaLib   : boolean;
  bPreAberta     : boolean;
  cTotalPreVenda : currency;
  cTotalOLDPre   : currency;

implementation
uses
  Udm, UECF, Ubibli1, USitCli, UConsCli, UConsVend, UConsTipoVenda, UConsProd, 
  UsenhaLiberarVenda, UFechaPreVenda, UMenuFiscal;

var  bGrava        : boolean;
     bGravaItem    : boolean;
     bPromocao     : boolean;
     iOrdem        : integer;
     cDescPromocao : currency;
     iCodVenda     : integer;
     iAuxCOO       : integer;
     iAuxCCF       : integer;

     iOLDCodPreVenda : integer;
     iOLDCodCliente  : integer;
     iOLDCodTPV      : integer;
     iOLDCodVend     : integer;
     iOLDSequencia   : integer;
     sOLDNomeCli     : string;
     sOLDCidCli      : string;
     sOLDEstCli      : string;
     sOLDCNPJCli     : string;

{$R *.dfm}

procedure TFrmPreVenda.Botoes(acao : string);
begin
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

    if (acao = 'N') or (acao = 'A') then
       begin
          BtnGravar.Enabled  := true;
          BtnAlterar.Enabled := false;
          if acao = 'N' then
             Limpaedit(FrmPreVenda);
       end
    else
       begin
          if not (acao = 'G') then
             Limpaedit(FrmPreVenda);
          BtnGravar.Enabled:= false;
          if (acao = 'C') or (acao = 'E') then
             btnalterar.Enabled:= false
          else
             btnalterar.Enabled:= true;
       end;
end;

procedure TFrmPreVenda.LimpaNovaPreVenda;
begin
   iTabelaPreco   := 0;
   cTotalPreVenda := 0;
   bGrava         := true;
   bGravaItem     := true;
   cTotalPreVenda := 0;
   bPreAberta     := false;

   if IBTRPreVenda.Active then
      IBTRPreVenda.Commit;
   QBuscaItens.Close;
   Botoes('N');
   panel3.Enabled := true;
   panel4.Enabled := false;
   EdtData.Text   := datetostr(date);
   EdtCodcli.SetFocus;
end;

procedure TFrmPreVenda.BuscaItens;
var cTotalBruto, cDesconto : currency;
begin
   cTotalBruto := 0;
   cDesconto   := 0;
   if IBTRPreVenda.Active then
      IBTRPreVenda.Commit;
   IBTRPreVenda.StartTransaction;
   with QBuscaItens do
      begin
         close;
         Parambyname('codpre').AsInteger:= strtoint(edtcod.Text);
         open;
         first;
         DisableControls;
         while not eof do
            begin
               if QBuscaItensCANCELADO.AsInteger = 0 then
                  begin
                     cTotalBruto:= cTotalBruto + (QBuscaItensQUANT.AsCurrency * QBuscaItensVALOR.AsCurrency);
                     cDesconto  := cDesconto + QBuscaItensDESCONTO.AsCurrency;
                  end;
               next;
            end;
         iOrdem:= QBuscaItensORDEM.AsInteger + 1;
         EnableControls;
      end;
   cTotalPreVenda    := cTotalBruto - cDesconto;
   EdtTotalBruto.Text:= CurrToStr(cTotalBruto);
   EdtTotalDesc.Text := CurrToStr(cDesconto);
   EdtTotalLiq.Text  := CurrToStr(cTotalPreVenda);
end;

procedure TFrmPreVenda.LimpaItens;
begin
   EdtCodPro.Clear;
   edtnomepro.Clear;
   edtquant.Text:= '1';
   edtvalorunit.Clear;
   EdtDescVr.Clear;
   //EdtDescPerc.Clear;
   EdtTotalProd.Clear;
   EdtTotalBR.Clear;
end;

procedure TFrmPreVenda.EdtCodcliEnter(Sender: TObject);
begin
  inherited;
  EdtCodcli.SelectAll;
end;

procedure TFrmPreVenda.EdtCodcliExit(Sender: TObject);
var bAchou     : boolean;
    bBloqueado : boolean;
begin
  inherited;
  if ToolBar1.Focused then
     exit;

  { BUSCA OS DADOS DO CLIENTE NO PAF }
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.QConsulta do
         begin
            close;
            sql.Clear;
            sql.Add('SELECT COD_CLI, NOME_CLI, BLOQUEADO_CLI, ATIVO_CLI ' +
                    'FROM CLIENTE ' +
                    'WHERE COD_CLI = :CODCLI');
            Parambyname('codcli').AsInteger:= strtoint(edtcodcli.text);
            Open;
            if not fieldbyname('COD_CLI').IsNull then
               begin
                  bAchou:= true;
                  edtnomecli.Text:= fieldbyname('nome_cli').AsString;

                  if trim(fieldbyname('ativo_cli').AsString) = 'N' then
                     begin
                        showmessage('Cliente Desativado!');
                        EdtNomecli.clear;
                        EdtCodcli.SetFocus;
                        bAchou:= false;
                     end;

                  if trim(fieldbyname('bloqueado_cli').AsString) = 'S' then
                     begin
                        bBloqueado:= true;
                        showmessage('Cliente Bloqueado');
                        edtnomecli.Clear;
                        EdtCodcli.SetFocus;
                     end
                  else
                     bBloqueado:= false;
               end
            else
               begin
                  bAchou:= false;
                  showmessage('Cliente não Cadastrado');
                  edtnomecli.Clear;
                  edtcodcli.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      bAchou:= false;
      showmessage('Erro ao Buscar o Cliente');
      edtnomecli.Clear;
      edtcodcli.SetFocus;
    end;
  finally
    dm.QConsulta.Close;
  end;

  if (bAchou) and (strtoint(edtcodcli.Text) <> iClienteVista) then
     begin
        Application.CreateForm(TFrmSitCli, FrmSitCli);
        FrmSitCli.Tag:= 1;
        FrmSitCli.ShowModal;

        if not bBloqueado then
           begin
              if iAtrasoMaximo > 0 then
                 begin
                    if iDiasAtrazo > iAtrasoMaximo then
                       begin
                          showmessage('O Cliente ultrapassou o atrazo máximo');
                          //EdtCodcli.SetFocus;
                          Application.CreateForm(TFrmSenhaLiberaVenda, FrmSenhaLiberaVenda);
                          FrmSenhaLiberaVenda.tag:= 3;
                          FrmSenhaLiberaVenda.showmodal;
                          if not bPreVendaLib then
                             edtcodcli.SetFocus;
                          bPreVendaLib:= false;
                       end;
                 end;
           end;
     end;
end;

procedure TFrmPreVenda.EdtCodcliKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_f2 then
     BtnConsCli.Click;
end;

procedure TFrmPreVenda.EdtCodcliKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmPreVenda.EdtCodVendEnter(Sender: TObject);
begin
  inherited;
  EdtCodVend.SelectAll;
end;

procedure TFrmPreVenda.EdtCodVendExit(Sender: TObject);
begin
  inherited;
  if (ToolBar1.Focused) or (EdtCodVend.Text = '') then
     exit;

  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.QConsulta do
         begin
            close;
            sql.Clear;
            sql.Add('SELECT COD_VEND, NOME_VEND, ATIVO_VEND ' +
                    'FROM VENDEDOR WHERE COD_VEND = :CODVEND');
            Parambyname('codvend').AsInteger:= strtoint(EdtCodVend.text);
            Open;
            if not fieldbyname('COD_VEND').IsNull then
               begin
                  if trim(fieldbyname('ativo_vend').AsString) = 'N' then
                     begin
                        showmessage('Vendedor não Ativo');
                        EdtNomeVend.Clear;
                        EdtCodVend.SetFocus;
                     end
                  else
                     begin
                        edtnomevend.Text:= fieldbyname('nome_vend').AsString;
                     end
               end
            else
               begin
                  showmessage('Vendedor não Cadastrado');
                  EdtNomeVend.Clear;
                  EdtCodVend.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      showmessage('Erro ao Buscar o Vendedor');
      EdtNomeVend.Clear;
      EdtCodVend.SetFocus;
    end;
  finally
    dm.QConsulta.Close;
  end;
end;

procedure TFrmPreVenda.EdtCodVendKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_f2 then
     BtnConsVend.Click;
end;

procedure TFrmPreVenda.EdtCodTPVEnter(Sender: TObject);
begin
  inherited;
  EdtCodTPV.SelectAll;
end;

procedure TFrmPreVenda.EdtCodTPVExit(Sender: TObject);
begin
  inherited;
  if (ToolBar1.Focused) then
     exit;

  edtnometpv.Text:= consulta('tipo_venda', edtcodtpv, 'cod_tpv', 'nome_tpv', dm.IBTransaction, dm.QConsulta);
  if trim(edtnometpv.Text) = '' then
     begin
        showmessage('Tipo de Venda não Cadastrado');
        edtcodtpv.SetFocus;
        exit;
        abort;
     end;

  if trim(EdtCodcli.Text) = '' then
     begin
        EdtCodcli.SetFocus;
        exit;
     end;

  if trim(EdtCodVend.Text) = '' then
     begin
        EdtCodVend.SetFocus;
        exit;
     end;

  if trim(EdtCodTPV.Text) = '' then
     begin
        EdtCodTPV.SetFocus;
        exit;
     end;

  BtnGravar.Click;
end;

procedure TFrmPreVenda.EdtCodTPVKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_f2 then
     BtnConsTPV.Click;
end;

procedure TFrmPreVenda.BtnConsCliClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsCli, FrmConsCli);
  FrmConsCli.tag:= 1;
  FrmConsCli.showmodal;
end;

procedure TFrmPreVenda.BtnConsVendClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsVend, FrmConsVend);
  FrmConsVend.tag:= 1;
  FrmConsVend.showmodal;
end;

procedure TFrmPreVenda.BtnConsTPVClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsTipoVenda, FrmConsTipoVenda);
  FrmConsTipoVenda.tag:= 1;
  FrmConsTipoVenda.showmodal;
end;

procedure TFrmPreVenda.EdtCodProEnter(Sender: TObject);
begin
  inherited;
  EdtCodPro.SelectAll;
end;

procedure TFrmPreVenda.EdtCodProExit(Sender: TObject);
var iCodPro : integer;
begin
  inherited;
  if (DBGrid1.Focused) or (ToolBar1.Focused) or (EdtSenhaPreVenda.Focused) then
     exit;

  dm.TabelaPreco(strtoint(EdtCodTPV.Text));
  iCodPro       := 0;
  cDescPromocao := 0;

  { busca o codigo do produto }
  iCodPro:= dm.BuscaCodigoProduto(trim(EdtCodPro.Text));
  if iCodPro > 0 then
     EdtCodPro.Text:= inttostr(iCodPro);

  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.QConsulta do
         begin
            close;
            sql.Clear;
            sql.Add('SELECT COD_PRO, NOME_PRO, ATIVO_PRO, VALOR_PRO, PROMOCAO_PRO, PRECO_PRAZO_PRO ' +
                    'FROM PRODUTO ' +
                    'WHERE COD_PRO = :CODPRO');
            Parambyname('codpro').AsInteger:= strtoint(EdtCodPro.text);
            Open;
            if (not fieldbyname('cod_pro').IsNull) and (trim(fieldbyname('ativo_pro').AsString) = 'S') then
               begin
                  if fieldbyname('valor_pro').AsCurrency = 0 then
                     begin
                        showmessage('Produto sem valor');
                        EdtCodPro.SetFocus;
                     end
                  else
                     begin
                        EdtNomePro.Text:= fieldbyname('nome_pro').AsString;
                        case iTabelaPreco of
                          0: begin
                                if fieldbyname('promocao_pro').AsCurrency > 0 then
                                   begin
                                      bPromocao         := true;
                                      edtvalorunit.Text := currtostr(fieldbyname('valor_pro').AsCurrency);
                                      cDescPromocao     := fieldbyname('valor_pro').AsCurrency - fieldbyname('promocao_pro').AsCurrency;
                                   end
                                else
                                   begin
                                      bPromocao         := false;
                                      cDescPromocao     := 0;
                                      edtvalorunit.Text := floattostr(fieldbyname('valor_pro').AsCurrency);
                                   end;
                             end;
                          1: begin
                                bPromocao     := false;
                                cDescPromocao := 0;
                                EdtValorUnit.Text:= fieldbyname('PRECO_PRAZO_PRO').AsString;
                             end;
                        end;
                     end;
               end
            else
               begin
                  showmessage('Produto nao Cadastrado ou Desativado');
                  edtnomepro.Clear;
                  edtcodpro.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      showmessage('Produto não Cadastrado');
      edtnomepro.Clear;
      edtcodpro.SetFocus;
    end;
  finally
    dm.QConsulta.Close;
  end;
end;

procedure TFrmPreVenda.EdtCodProKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = vk_f2 then
     BtnConsPro.Click;
end;

procedure TFrmPreVenda.BtnConsProClick(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TFrmConsProd, FrmConsProd);
   FrmConsProd.Tag := 1;
   FrmConsProd.showmodal;
end;

procedure TFrmPreVenda.BtnGravaClick(Sender: TObject);
var cAuxDesconto : currency;
    cEstoque : currency;
begin
  inherited;
  cAuxDesconto:= 0;

  if strtocurr(edtquant.Text) = 0 then
     begin
        showmessage('Digite a Quantidade');
        edtquant.SetFocus;
        exit;
     end;

  if strtocurr(edtvalorunit.Text) = 0 then
     begin
        showmessage('Digite o Valor Unitário');
        EdtValorUnit.SetFocus;
        exit;
     end;

  { verifica se o estoque vai ficar negativo }
  if not bEstoqueNegativo then
     begin
        cEstoque:= dm.BuscaEstoqueProduto(strtoint(EdtCodPro.Text), iEmp);
        if (cEstoque - strtocurr(EdtQuant.Text)) < 0 then
           begin
              showmessage('Verifique o Estoque do Produto');
              EdtQuant.SetFocus;
              exit;
              abort;
           end;
     end;

  cAuxDesconto:= strtocurr(EdtDescVr.Text) + (cDescPromocao * strtocurr(EdtQuant.Text));

  if IBTRPreVenda.Active then
     IBTRPreVenda.Commit;
  IBTRPreVenda.StartTransaction;
  try
    try
      with IBSQLPre do
         begin
            close;
            sql.Clear;
            if bGravaItem then
               begin
                  sql.Add('INSERT INTO ITENS_PRE_VENDA (COD_PRE, ORDEM, COD_PRO, DESCONTO, ' +
                          'COD_EMP, QUANT, VALOR, PRODUTO_PROMOCAO, CANCELADO) ' +
                          'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, :9)');
                  Parambyname('9').AsInteger:= 0;
               end
            else
               begin
                  sql.Add('UPDATE ITENS_PRE_VENDA SET COD_PRO = :3, DESCONTO = :4, COD_EMP = :5, ' +
                          'QUANT = :6, VALOR = :7, PRODUTO_PROMOCAO = :8  ' +
                          'WHERE COD_PRE = :1 AND ORDEM = :2');
               end;

            Parambyname('1').AsInteger  := strtoint(edtcod.Text);
            Parambyname('2').AsInteger  := iOrdem;
            Parambyname('3').AsInteger  := strtoint(EdtCodPro.text);
            Parambyname('4').AsCurrency := cAuxDesconto;
            Parambyname('5').AsInteger  := iEmp;
            Parambyname('6').AsCurrency := StrToCurr(EdtQuant.text);
            Parambyname('7').AsCurrency := StrToCurr(EdtValorUnit.Text);
            if bPromocao then
               Parambyname('8').AsString:= 'S'
            else
               Parambyname('8').AsString:= 'N';
            ExecOrOpen;
         end;
      IBTRPreVenda.Commit;
    except
      IBTRPreVenda.Rollback;
      showmessage('Erro ao Gravar o Item');
      EdtCodPro.SetFocus;
    end
  finally
     bGravaItem:= true;
     IBSQLPre.Close;
     LimpaItens;
     BuscaItens;
     edtcodpro.SetFocus;
  end;
end;

procedure TFrmPreVenda.BtnCancelarClick(Sender: TObject);
var iOrdemCancelar : integer;
    iQuantProd     : integer;
begin
  inherited;
  iQuantProd:= 0;

  { verifica se tem mais de 1 item nao cancelado }
  if dm.IBTRServer.Active then
     dm.IBTRServer.Commit;
  dm.IBTRServer.StartTransaction;
  try
    try
      with dm.QConsultaServer do
         begin
            close;
            sql.Clear;
            sql.Text:= 'SELECT COUNT(COD_PRE) QTDPRO ' +
                       'FROM ITENS_PRE_VENDA  ' +
                       'WHERE COD_PRE = :CODPRE AND CANCELADO = 0';
            Parambyname('codpre').AsInteger:= strtoint(EdtCod.Text);
            open;
            iQuantProd:= fieldbyname('qtdpro').AsInteger;
         end;
      dm.IBTRServer.Commit;
    except
      dm.IBTRServer.Rollback;
      showmessage('Erro ao verificar se pode cancelar o item');
    end;
  finally
    dm.QConsultaServer.Close;
  end;

  if iQuantProd > 1 then
     begin
        if Application.MessageBox('Confirma o Cancelamento do Item?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
          begin
             iOrdemCancelar:= QBuscaItensORDEM.AsInteger;
             if IBTRPreVenda.Active then
                IBTRPreVenda.Commit;
             IBTRPreVenda.StartTransaction;
             try
               try
                 with IBSQLPre do
                    begin
                       close;
                       sql.Clear;
                       sql.Add('UPDATE ITENS_PRE_VENDA SET CANCELADO = 1 ' +
                               'WHERE COD_PRE = :1 AND ORDEM = :2');
                       Parambyname('1').AsInteger := strtoint(edtcod.text);
                       Parambyname('2').AsInteger := iOrdemCancelar;
                       ExecOrOpen;
                    end;
                 IBTRPreVenda.Commit;
               except
                 IBTRPreVenda.Rollback;
                 showmessage('Erro ao Cancelar o Item');
               end;
             finally
               bGravaItem:= true;
               IBSQLPre.Close;
               LimpaItens;
               BuscaItens;
               EdtCodPro.SetFocus;
             end;
          end;
     end
  else
     begin
        showmessage('Não pode cancelar todos os itens, cancele a pré-venda.');
        BuscaItens;
     end;
end;

procedure TFrmPreVenda.QBuscaItensCalcFields(DataSet: TDataSet);
begin
  inherited;
  QBuscaItensCALC_TOTAL.AsCurrency:= ((QBuscaItensQUANT.AsCurrency * QBuscaItensVALOR.AsCurrency) - QBuscaItensDESCONTO.AsCurrency);
end;

procedure TFrmPreVenda.DBGrid1DblClick(Sender: TObject);
var i : integer;
begin
  inherited;
  bGravaItem         := false;
  edtcodpro.Text     := QBuscaItensCOD_PRO.AsString;
  edtnomepro.Text    := QBuscaItensNOME_PRO.AsString;
  edtquant.Text      := QBuscaItensQUANT.AsString;
  edtvalorunit.Text  := QBuscaItensVALOR.AsString;
  EdtDescVr.Text     := QBuscaItensDESCONTO.AsString;
  EdtDescPerc.Clear;
  iOrdem             := QBuscaItensORDEM.AsInteger;

  EdtTotalBR.Text    := currtostr(QBuscaItensQUANT.AsCurrency * QBuscaItensVALOR.AsCurrency);
  EdtTotalProd.Text  := CurrToStr((QBuscaItensQUANT.AsCurrency * QBuscaItensVALOR.AsCurrency) - QBuscaItensDESCONTO.AsCurrency);

  EdtQuant.SetFocus;
end;

procedure TFrmPreVenda.FormShow(Sender: TObject);
begin
  inherited;

  { BUSCA O CÓDIGO DO CLIENTE PADRÃO (A VISTA) PARA NÃO MOSTRAR A SITUAÇÃO }
  { BUSCAS AS INFORMACOES NO BANCO DO PAF }
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.QConsulta do
         begin
            close;
            sql.Clear;
            sql.Add('SELECT CLIENTE_PADRAO_VENDA, ATRASO_MAXIMO, SAIDAS_ESTOQUE_NEGATIVO ' +
                    'FROM PARAMETROS ' +
                    'WHERE COD_EMP = :CODEMP');
            parambyname('codemp').AsInteger:= iEmp;
            Open;
            iClienteVista:= fieldbyname('CLIENTE_PADRAO_VENDA').AsInteger;
            iAtrasoMaximo:= fieldbyname('ATRASO_MAXIMO').AsInteger;

            if trim(fieldbyname('SAIDAS_ESTOQUE_NEGATIVO').AsString) = 'S' then
               bEstoqueNegativo:= true
            else
               bEstoqueNegativo:= false;
               
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      showmessage('Erro ao buscar o código do cliente a vista');
    end;
  finally
    dm.QConsulta.close;
  end;

  LimpaNovaPreVenda;
end;

procedure TFrmPreVenda.BtnGravarClick(Sender: TObject);
begin
  inherited;
  if IBTRPreVenda.Active then
     IBTRPreVenda.Commit;
  IBTRPreVenda.StartTransaction;
  if bGrava then
     begin
        try
          try
            with QInsPreVenda do
               begin
                  close;
                  Parambyname('data').AsDate       := strtodate(EdtData.Text);
                  Parambyname('codcli').AsInteger  := strtoint(EdtCodcli.Text);
                  Parambyname('codtpv').AsInteger  := strtoint(EdtCodTPV.Text);
                  Parambyname('codemp').AsInteger  := iEmp;
                  Parambyname('horapre').value     := time;
                  Parambyname('doc').value         := null;
                  Parambyname('codvend').AsInteger := strtoint(EdtCodVend.Text);
                  open;
                  edtcod.Text       := QInsPreVendaCODPRE.AsString;
                  EdtSequencia.Text := FormataStringD(QInsPreVendaSEQUENCIA.AsString, '10', '0');
               end;
            IBTRPreVenda.Commit;
            bPreAberta     := true;
            panel3.Enabled := false;
            panel4.Enabled := true;
            bGravaItem     := true;
            Botoes('G');
            LimpaItens;
            edtcodpro.SetFocus;
          except
            IBTRPreVenda.Rollback;
            bPreAberta:= false;
            showmessage('Erro ao Gravar a Pré-venda');
            panel3.Enabled:= true;
            panel4.Enabled:= false;
          end;
        finally
          QInsPreVenda.Close;
          BuscaItens;
        end;
     end
       else
          begin
             try
               try
                 with IBSQLPre do
                    begin
                       close;
                       sql.Clear;
                       sql.Add('UPDATE PRE_VENDA SET COD_CLI = :CODCLI, COD_VEND = :CODVEND, COD_TPV = :CODTPV ' +
                               'WHERE COD_PRE = :CODPRE');
                       Parambyname('codcli').AsInteger  := strtoint(EdtCodcli.Text);
                       Parambyname('codvend').AsInteger := strtoint(EdtCodVend.Text);
                       Parambyname('codtpv').AsInteger  := strtoint(EdtCodTPV.Text);
                       Parambyname('codpre').AsInteger  := strtoint(edtcod.Text);
                       ExecOrOpen;
                    end;
                 IBTRPreVenda.Commit;
                 bPreAberta     := true;
                 panel3.Enabled := false;
                 panel4.Enabled := true;
                 bGravaItem     := true;
                 Botoes('G');
                 LimpaItens;
                 edtcodpro.SetFocus;
               except
                 IBTRPreVenda.Rollback;
                 bPreAberta:= false;
                 showmessage('Erro ao Gravar a Pré_venda');
                 panel3.Enabled:= true;
                 panel4.Enabled:= false;
               end;
             finally
               IBSQLPre.Close;
               BuscaItens;
             end;
          end;
end;

procedure TFrmPreVenda.BtnAlterarClick(Sender: TObject);
begin
  inherited;
  bGrava:= false;
  ToolBar1.SetFocus;
  Botoes('A');
  panel3.Enabled:= true;

  EdtCodcli.SetFocus;
end;

procedure TFrmPreVenda.EdtValorUnitExit(Sender: TObject);
begin
  inherited;
  EdtTotalBR.Text:= currtostr(strtocurr(edtquant.Text) * strtocurr(EdtValorUnit.Text));
end;

procedure TFrmPreVenda.EdtDescVrExit(Sender: TObject);
begin
  inherited;
  EdtTotalProd.Text:= CurrToStr((strtocurr(edtquant.Text) * strtocurr(EdtValorUnit.Text)) - strtocurr(EdtDescVr.Text));
end;

procedure TFrmPreVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (ssCtrl in Shift) and (chr(Key) in ['P', 'p']) then
      begin
         Application.CreateForm(TFrmConsProd, FrmConsProd);
         FrmConsProd.Tag := 999;
         FrmConsProd.showmodal;
      end
  else

  if key = vk_f5 then
     BtnFechar.Click
  else

  if key = vk_f9 then
     begin
        if not bPreAberta then
           begin
              showmessage('Primeiro gravar o cabeçalho da nova pre-venda');
              exit;
           end
        else
           begin
              PanelJuntarPreVenda.Visible:= true;
              EdtSenhaPreVenda.Clear;
              EdtSenhaPreVenda.SetFocus;
           end;
     end
   else

  if key = vk_escape then
     begin
        if PanelJuntarPreVenda.Visible then
           begin
              EdtCodPro.SetFocus;
              PanelJuntarPreVenda.Visible:= false;
           end;
     end
  else

  if key = vk_f10 then
     begin
        Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
        FrmMenuFiscal.showmodal;
     end;
end;

procedure TFrmPreVenda.EdtDescPercExit(Sender: TObject);
begin
  inherited;
  if strtofloat(EdtDescPerc.Text) > 0 then
     begin
        EdtDescVr.Text:= CurrToStr(((StrToCurr(EdtQuant.Text) * StrToCurr(EdtValorUnit.text)) *
                                     StrToCurr(EdtDescPerc.text)) / 100);
     end;
end;

procedure TFrmPreVenda.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if bPreAberta then
     begin
        showmessage('Pré-Venda Aberta');
        CanClose:= false;
     end;
end;

procedure TFrmPreVenda.FormCreate(Sender: TObject);
begin
  inherited;
  dm.ScaleForm( Self, False );
  case iCasasDecimaisQuant of
    2: begin
          EdtQuant.DisplayFormat:= ',#0.00';
          EdtQuant.DecimalPlaces:= 2;
       end;
    3: begin
          EdtQuant.DisplayFormat:= ',#0.000';
          EdtQuant.DecimalPlaces:= 3;
       end;
  end;
end;

procedure TFrmPreVenda.BtnFecharClick(Sender: TObject);
begin
  inherited;
  ToolBar1.SetFocus;

  if iOrdem > 1 then
     begin
        Application.CreateForm(TFrmFechaPreVenda, FrmFechaPreVenda);
        FrmFechaPreVenda.EdtSubTotal.Text     := currtostr(cTotalPreVenda);
        FrmFechaPreVenda.EdtTotalLiquido.Text := currtostr(cTotalPreVenda);
        FrmFechaPreVenda.EdtDescPerc.Clear;
        FrmFechaPreVenda.EdtDescValor.Clear;
        FrmFechaPreVenda.showmodal;
     end
  else
     begin
        showmessage('Pré-venda sem itens');
     end;
end;

procedure TFrmPreVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if dm.ibtrserver.Active then
     dm.ibtrserver.Commit;

  if IBTRPreVenda.Active then
     IBTRPreVenda.Commit;

  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;

  Action:= caFree;
  Self := nil;
end;

procedure TFrmPreVenda.BtnSairClick(Sender: TObject);
begin
   if (cTotalPreVenda = 0) and (trim(edtcod.Text) <> '') then
      begin
         if dm.IBTRServer.Active then
            dm.IBTRServer.Commit;
         dm.IBTRServer.StartTransaction;
         try
          try
             with dm.QConsultaServer do
                begin
                   close;
                   sql.clear;
                   sql.Text:= 'DELETE FROM PRE_VENDA ' +
                              'WHERE COD_PRE = :COD';
                   Parambyname('cod').AsInteger:= strtoint(EdtCod.Text);
                   ExecOrOpen;
                   bPreAberta:= false;
                end;
             dm.IBTRServer.Commit;
           except
             dm.IBTRServer.Rollback;
             bPreAberta:= true;
           end;
         finally
           dm.QConsultaServer.Close;
         end;
      end;

   close;
end;

procedure TFrmPreVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      begin
         key:= #0;
         SelectNext(ActiveControl, true, true);
      end;
end;

procedure TFrmPreVenda.BtnOKClick(Sender: TObject);
begin
   if trim(EdtSenhaPreVenda.Text) = '' then
      begin
         showmessage('Digite a senha');
         EdtSenhaPreVenda.SetFocus;
         exit;
         abort;
      end;

   if strtoint(trim(EdtSequencia.Text)) = strtoint(trim(EdtSenhaPreVenda.Text)) then
      begin
         showmessage('Verifique o Número da Pré Venda');
         EdtSenhaPreVenda.SetFocus;
         exit;
         abort;
      end;

   { busca os dados da pre venda antiga }
   BuscaPreVenda(trim(EdtSenhaPreVenda.Text));

   if iOLDCodPreVenda > 0 then
      begin
         { busca os itens da pre-venda }
         if dm.IBTRServer.Active then
            dm.IBTRServer.Commit;
         dm.IBTRServer.StartTransaction;
         try
           try
             with dm.QConsultaServer do
                begin
                   close;
                   sql.Clear;
                   sql.Text:= 'SELECT * ' +
                              'FROM ITENS_PRE_VENDA ' +
                              'WHERE COD_PRE = :CODPRE';
                   Parambyname('codpre').AsInteger:= iOLDCodPreVenda;
                   open;
                   if IBTRPreVenda.Active then
                      IBTRPreVenda.Commit;
                   IBTRPreVenda.StartTransaction;

                   while not eof do
                      begin
                         IBSQLPre.Close;
                         IBSQLPre.sql.Clear;
                         IBSQLPre.sql.Add('INSERT INTO ITENS_PRE_VENDA (COD_PRE, ORDEM, COD_PRO, DESCONTO, ' +
                                              'COD_EMP, QUANT, VALOR, PRODUTO_PROMOCAO, CANCELADO) ' +
                                              'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, :9)');

                         IBSQLPre.Parambyname('1').AsInteger  := strtoint(edtcod.Text);
                         IBSQLPre.Parambyname('2').AsInteger  := iOrdem;
                         IBSQLPre.Parambyname('3').AsInteger  := fieldbyname('cod_pro').AsInteger;
                         IBSQLPre.Parambyname('4').AsCurrency := fieldbyname('desconto').AsCurrency;
                         IBSQLPre.Parambyname('5').AsInteger  := iEmp;
                         IBSQLPre.Parambyname('6').AsCurrency := fieldbyname('quant').AsCurrency;
                         IBSQLPre.Parambyname('7').AsCurrency := fieldbyname('valor').AsCurrency;
                         IBSQLPre.Parambyname('8').AsString   := fieldbyname('produto_promocao').AsString;
                         IBSQLPre.ParamByName('9').AsInteger  := fieldbyname('cancelado').AsInteger;
                         IBSQLPre.ExecOrOpen;
                         inc(iOrdem);
                         next;
                      end;
                   IBTRPreVenda.Commit;
                   IBSQLPre.Close;
                end;
             dm.IBTRServer.Commit;
           except
             dm.IBTRServer.Rollback;
             showmessage('Erro ao buscar os itens da pré-venda');
           end;
         finally
           dm.QConsultaServer.Close;
         end;

         if iECF < 99 then
            begin
               { efetuando o cancelamento da Pre-Venda }
               { abrindo o cupom Fiscal }
               if AbreVenda = 0 then
                  begin
                     RegistraProduto(iOLDCodPreVenda);

                     if not (TotalizaCupom = 0) then
                        exit;

                     if not (EfetuaPagamentos(cTotalOLDPre) = 0) then
                        exit;

                     if not (FechaCupom = 0) then
                        exit;

                     {atualiza os totais da venda}
                     //GravaFechamentoVenda(iCodVenda, cTotalOLDPre, 0, 0 ,0 ,0 ,0 ,0 ,0, cTotalOLDPre, sOLDNomeCli, sOLDCNPJCli);

                     { cancela o cupom fiscal }
                     CancelaCupomFiscal(iECF);

                     { grava o GT }
                     GravaGT(iECF);

                     {cancela a pre-venda}
                     CancelaPreVenda;

                     BtnOk.Click;
                  end;
               end;

         BuscaItens;
         edtcodpro.SetFocus;
         PanelJuntarPreVenda.Visible:= false;
      end;
end;

procedure TFrmPreVenda.BuscaPreVenda(const sSenha : string);
begin
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   try
     try
       with dm.QConsultaServer do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT P.COD_PRE, P.SEQUENCIA_PAF, P.COD_CLI, P.COD_TPV, P.COD_VEND, ' +
                        'C.NOME_CLI, C.CIDRES_CLI, C.CNPJ_CLI, C.ESTRES_CLI ' +
                        'FROM PRE_VENDA P ' +
                        'INNER JOIN CLIENTE C ' +
                        'ON (P.COD_CLI = C.COD_CLI) ' + 
                        'WHERE P.SENHA_FECHAR_VENDA = :SENHA AND COD_EMP = :CODEMP AND STATUS_PRE = 0';
             Parambyname('senha').AsString   := sSenha;
             Parambyname('codemp').AsInteger := iEmp;
             Open;
             iOLDCodPreVenda := fieldbyname('cod_pre').AsInteger;
             iOLDCodCliente  := fieldbyname('cod_cli').AsInteger;
             iOLDCodTPV      := fieldbyname('cod_tpv').AsInteger;
             iOLDCodVend     := fieldbyname('cod_vend').AsInteger;
             iOLDSequencia   := fieldbyname('sequencia_paf').AsInteger;
             sOLDNomeCli     := fieldbyname('nome_cli').AsString;
             sOLDCidCli      := fieldbyname('cidres_cli').AsString;
             sOLDEstCli      := fieldbyname('estres_cli').AsString;
             sOLDCNPJCli     := fieldbyname('cnpj_cli').AsString;
          end;
       dm.IBTRServer.Commit;
     except
       dm.IBTRServer.Rollback;
       showmessage('Erro ao buscar o código da pré-venda');
     end;
   finally
     dm.QConsultaServer.Close;
   end;
end;

procedure TFrmPreVenda.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if QBuscaItensCANCELADO.AsInteger = 1 then
      begin
         DBGrid1.Canvas.Font.Color:= clRed;
         Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
      end;
end;

function TFrmPreVenda.AbreVenda : integer;
var sCOO      : string;
    sCCF      : string;
begin
   { verifica o numero de serie da ecf }
   if not VerificaNumeroSerie then
      begin
         result:= 1;
         //showmessage('Número de Série da ECF não Confere');
         exit;
      end;

   { verifica o GT da ECF }
   if not VerificaGT then
      begin
         result:= 1;
         //showmessage('Totalizador Geral do ECF não confere');
         exit;
      end;

   { ABRE CUPOM FISCAL }
   if AbreCupom(iECF) = 0 then
      begin
         sCOO:= NumeroCupom(iECF);
         try
           iAuxCOO:= strtoint(sCOO);
         except
           iAuxCOO:= 0;
         end;

         sCCF:= ContadorCupomFiscal(iECF);
         try
           iAuxCCF:= strtoint(sCCF);
         except
           iAuxCCF:= 0;
         end;

         { GRAVANDO A VENDA }
         iCodVenda:= GravaVenda(iAuxCOO, iAuxCCF, 0, iOLDCodCliente, iOLDCodVend, iOLDCodTPV, 1);
         if iCodVenda > 0 then
            result:= 0
         else
            result:= 1;
      end
   else
      result:= 1;
end;

function TFrmPreVenda.RegistraProduto(const IcodPreVenda : integer) : integer;
var sIndice   : string;
begin
   cTotalOLDPre:= 0;

   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   with QItensPreVenda do
      begin
         close;
         Parambyname('codpre').AsInteger:= IcodPreVenda;
         open;
         while not eof do
           begin
              cTotalOLDPre:= cTotalOLDPre + ((QItensPreVendaQUANT.AsCurrency * QItensPreVendaVALOR.AsCurrency) - QItensPreVendaDESCONTO.AsCurrency);

              { busca o indice da aliquota na ecf }
              sIndice:= BuscaIndice(QItensPreVendaICMS_CF_EST.AsInteger);

              {registra item ecf}
              RegistraItemECF(iECF, 13, iTamDescCupom, trim(QItensPreVendaCODIGO_BARRA_PRO.AsString),
                              trim(QItensPreVendaDESC_CUPOM.AsString), sIndice, trim(QItensPreVendaDESCRICAO.AsString),
                              QItensPreVendaQUANT.AsCurrency, QItensPreVendaVALOR.AsCurrency, QItensPreVendaDESCONTO.AsCurrency);

              {verifica se o item está cancelado na prevenda e cancela no cupom}
              if QItensPreVendaCANCELADO.AsInteger = 1 then
                 CancelaItemCupomFiscal(iECF, QItensPreVendaORDEM.AsInteger);

              {grava o produto na tabela itens_venda ja cancelado}
              GravaProdutoVenda(iCodVenda, QItensPreVendaCOD_PRO.AsInteger, QItensPreVendaORDEM.AsInteger, iOLDCodVend, QItensPreVendaCANCELADO.AsInteger, 1,
                                QItensPreVendaQUANT.AsCurrency, QItensPreVendaVALOR.AsCurrency, QItensPreVendaDESCONTO.AsCurrency,
                                '$', false);

              next;
           end;
      end;
end;

function TFrmPreVenda.BuscaIndice(iCodigoGRP : integer) : string;
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QBuscaIndice do
          begin
             close;
             Parambyname('codcai').AsInteger:= iCaixa;
             parambyname('codemp').AsInteger:= iEmp;
             Parambyname('codgrp').AsInteger:= iCodigoGRP;
             Open;
             result:= trim(QBuscaIndiceINDICE_ECF.AsString);
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       result:= '';
       showmessage('erro ao buscar o indice');
     end;
   finally
     QBuscaIndice.Close;
   end;
end;

function TFrmPreVenda.TotalizaCupom : integer;
begin
   result:= IniciaFechamentoCupomFiscal(iECF, 0);
end;

function TFrmPreVenda.EfetuaPagamentos(const cValor : currency) : integer;
var cDinheiro, cPromissoria, cCheque, cChequePre, cCartao, cBoleto : currency;
begin
   {cDinheiro     := cValor;
   cPromissoria  := 0;
   cCheque       := 0;
   cChequePre    := 0;
   cCartao       := 0;
   cBoleto       := 0;

   result:= PagamentoCupomFiscal(iECF, iAuxCOO, iAuxCCF, cDinheiro, cPromissoria, cCheque, cChequePre, cCartao, cBoleto);}
end;

function TFrmPreVenda.FechaCupom : integer;
var sAuxCliente, sAuxDoc, sAuxEnd : string;
begin
   sAuxCliente:= trim(sOLDNomeCli);
   sAuxDoc    := trim(sOLDCNPJCli);
   sAuxEnd    := trim(sOLDCidCli + '-' + sOLDEstCli);

   result:= FechaCupomFiscal(iECF, sAuxCliente, sAuxDoc, sAuxEnd, iOLDSequencia, 0, 0, 0, 0, 0, 0);
end;

procedure TFrmPreVenda.CancelaPreVenda;
begin
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   try
     try
       with dm.QConsultaServer do
          begin
             close;
             sql.Clear;
             sql.Text:= 'UPDATE PRE_VENDA ' +
                        'SET STATUS_PRE = 2 ' +
                        'WHERE COD_PRE = :CODPRE';
             Parambyname('codpre').AsInteger:= iOLDCodPreVenda;
             ExecOrOpen;
          end;
       dm.IBTRServer.Commit;
     except
       dm.IBTRServer.Rollback;
       showmessage('Erro ao cancelar a pre-venda');
     end;
   finally
     dm.QConsultaServer.Close;
   end;
end;

end.
