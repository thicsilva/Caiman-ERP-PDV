unit UDavOrcamento;

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
  TFrmDavOrcamento = class(TForm)
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
    QOrdem: TFDQuery;
    QOrdemORDEM: TIntegerField;
    IBTROrcamento: TFDTransaction;
    IBSQLOrcamento: TFDQuery;
    QInsOrcamento: TFDQuery;
    Label10: TLabel;
    EdtDescPerc: TCurrencyEdit;
    Label14: TLabel;
    EdtTotalBR: TCurrencyEdit;
    Shape1: TShape;
    Label22: TLabel;
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
    EdtData: TMaskEdit;
    ToolBar1: TToolBar;
    BtnGravar: TToolButton;
    BtnAlterar: TToolButton;
    BtnSair: TToolButton;
    ImageList: TImageList;
    ToolButton1: TToolButton;
    BtnFechar: TToolButton;
    PanelJuntarOrcamento: TPanel;
    EdtSeqOrcamento: TEdit;
    Label1: TLabel;
    BtnOK: TButton;
    StatusBar2: TStatusBar;
    QInsOrcamentoSEQUENCIA: TLargeintField;
    QBuscaItensCODIGO: TIntegerField;
    QBuscaItensDESC_CUPOM: TStringField;
    QInsOrcamentoCODIGO: TIntegerField;
    QBuscaItensCANCELADO: TIntegerField;
    StatusBar1: TStatusBar;
    QBuscaItensDESCRICAO: TStringField;
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
    function  DescontoTPV (codtpv : integer) : real;
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
    procedure LimpaNovoOrcamento;
    procedure BtnOKClick(Sender: TObject);
    function  BuscaCodigoOrcamento(const sSequencia : string) : integer;
    procedure ImprimeECF;
    procedure ImprimeNaoFiscal;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDavOrcamento: TFrmDavOrcamento;

implementation
uses
  Udm, UECF, Ubibli1, UConsCli, UConsVend, UConsTipoVenda, UConsProd, 
  UMenuFiscal, URelDavOrcamento;

var  bGrava           : boolean;
     bGravaItem       : boolean;
     bPromocao        : boolean;
     cDescPromocao    : currency;
     iOrdem           : integer;
     cTotalOrcamento  : currency;
     bOrcamentoAberto : boolean;
     sCOO             : string;
     iCOO             : integer;
{$R *.dfm}

procedure TFrmDavOrcamento.Botoes(acao : string);
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
             Limpaedit(FrmDavOrcamento);
       end
    else
       begin
          if not (acao = 'G') then
             Limpaedit(FrmDavOrcamento);
          BtnGravar.Enabled  := false;
          if (acao = 'C') or (acao = 'E') then
             btnalterar.Enabled:= false
          else
             btnalterar.Enabled:= true;
       end;
end;

procedure TFrmDavOrcamento.LimpaNovoOrcamento;
begin
   iTabelaPreco      := 0;
   bGrava            := true;
   bGravaItem        := true;
   cTotalOrcamento   := 0;
   bOrcamentoAberto  := false;
   iCOO              := 0; 

   if IBTROrcamento.Active then
      IBTROrcamento.Commit;
   QBuscaItens.Close;
   Botoes('N');
   panel3.Enabled := true;
   panel4.Enabled := false;
   EdtData.Text   := datetostr(date);
   EdtCodcli.SetFocus;
end;

function TFrmDavOrcamento.DescontoTPV (codtpv : integer) : real;
begin
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.ibtrserver.StartTransaction;
   with dm.QConsulta do
      begin
         close;
         sql.Clear;
         sql.add('SELECT DESCONTO_TPV, ACRESCIMO_TPV ' +
                 'FROM TIPO_VENDA ' +
                 'WHERE COD_TPV = :COD');
         Parambyname('cod').AsInteger:= codtpv;
         Open;
         if fieldbyname('desconto_tpv').AsCurrency > 0 then
            result:= fieldbyname('desconto_tpv').AsCurrency * -1
         else
            if fieldbyname('acrescimo_tpv').AsCurrency > 0 then
               result:= fieldbyname('acrescimo_tpv').AsCurrency
            else
               result:= 0;
      end;
   dm.ibtrserver.Commit;
   dm.QConsulta.Close;
end;

procedure TFrmDavOrcamento.BuscaItens;
var cTotalBruto, cDesconto : currency;
begin
   cTotalBruto := 0;
   cDesconto   := 0;
   if IBTROrcamento.Active then
      IBTROrcamento.Commit;
   IBTROrcamento.StartTransaction;
   with QBuscaItens do
      begin
         close;
         Parambyname('cod').AsInteger:= strtoint(edtcod.Text);
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
   cTotalOrcamento   := cTotalBruto - cDesconto;
   EdtTotalBruto.Text:= CurrToStr(cTotalBruto);
   EdtTotalDesc.Text := CurrToStr(cDesconto);
   EdtTotalLiq.Text  := CurrToStr(cTotalOrcamento);
end;

procedure TFrmDavOrcamento.LimpaItens;
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

procedure TFrmDavOrcamento.EdtCodcliEnter(Sender: TObject);
begin
  inherited;
  EdtCodcli.SelectAll;
end;

procedure TFrmDavOrcamento.EdtCodcliExit(Sender: TObject);
var bBloqueado : boolean;
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
                  edtnomecli.Text:= fieldbyname('nome_cli').AsString;

                  if trim(fieldbyname('ativo_cli').AsString) = 'N' then
                     begin
                        showmessage('Cliente Desativado!');
                        EdtNomecli.Clear;
                        EdtCodcli.SetFocus;
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
                  showmessage('Cliente não Cadastrado');
                  edtnomecli.Clear;
                  edtcodcli.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      showmessage('Erro ao Buscar o Cliente');
      edtnomecli.Clear;
      edtcodcli.SetFocus;
    end;
  finally
    dm.QConsulta.Close;
  end;
end;

procedure TFrmDavOrcamento.EdtCodcliKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_f2 then
     BtnConsCli.Click;
end;

procedure TFrmDavOrcamento.EdtCodcliKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmDavOrcamento.EdtCodVendEnter(Sender: TObject);
begin
  inherited;
  EdtCodVend.SelectAll;
end;

procedure TFrmDavOrcamento.EdtCodVendExit(Sender: TObject);
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

procedure TFrmDavOrcamento.EdtCodVendKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_f2 then
     BtnConsVend.Click;
end;

procedure TFrmDavOrcamento.EdtCodTPVEnter(Sender: TObject);
begin
  inherited;
  EdtCodTPV.SelectAll;
end;

procedure TFrmDavOrcamento.EdtCodTPVExit(Sender: TObject);
begin
  inherited;
  if ToolBar1.Focused then
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

procedure TFrmDavOrcamento.EdtCodTPVKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_f2 then
     BtnConsTPV.Click;
end;

procedure TFrmDavOrcamento.BtnConsCliClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsCli, FrmConsCli);
  FrmConsCli.tag:= 6;
  FrmConsCli.showmodal;
end;

procedure TFrmDavOrcamento.BtnConsVendClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsVend, FrmConsVend);
  FrmConsVend.tag:= 3;
  FrmConsVend.showmodal;
end;

procedure TFrmDavOrcamento.BtnConsTPVClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsTipoVenda, FrmConsTipoVenda);
  FrmConsTipoVenda.tag:= 2;
  FrmConsTipoVenda.showmodal;
end;

procedure TFrmDavOrcamento.EdtCodProEnter(Sender: TObject);
begin
  inherited;
  EdtCodPro.SelectAll;
end;

procedure TFrmDavOrcamento.EdtCodProExit(Sender: TObject);
var iCodPro : integer;
begin
  inherited;
  if (DBGrid1.Focused) or (ToolBar1.Focused) or (EdtSeqOrcamento.Focused) then
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
                        if iTabelaPreco = 0 then
                           begin
                              if fieldbyname('promocao_pro').AsCurrency > 0 then
                                 begin
                                    bPromocao         := true;
                                    edtvalorunit.Text := currtostr(fieldbyname('valor_pro').AsCurrency);
                                    cDescPromocao     := fieldbyname('valor_pro').AsCurrency - fieldbyname('promocao_pro').AsCurrency;
                                 end
                              else
                                 begin
                                    bPromocao     := false;
                                    cDescPromocao := 0;
                                    edtvalorunit.Text:= floattostr(fieldbyname('valor_pro').AsCurrency);
                                 end;
                           end
                        else
                           begin
                              bPromocao     := false;
                              cDescPromocao := 0;
                              if fieldbyname('PRECO_PRAZO_PRO').AsCurrency > 0 then
                                 EdtValorUnit.Text:= fieldbyname('PRECO_PRAZO_PRO').AsString
                              else
                                 EdtValorUnit.Text:= fieldbyname('VALOR_PRO').AsString;
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

procedure TFrmDavOrcamento.EdtCodProKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = vk_f2 then
     BtnConsPro.Click;
end;

procedure TFrmDavOrcamento.BtnConsProClick(Sender: TObject);
begin
  inherited;
   Application.CreateForm(TFrmConsProd, FrmConsProd);
   FrmConsProd.Tag := 3;
   FrmConsProd.showmodal;
end;

procedure TFrmDavOrcamento.BtnGravaClick(Sender: TObject);
begin
  inherited;
  if edtquant.Text = '0' then
     begin
        showmessage('Digite a Quantidade');
        edtquant.SetFocus;
        exit;
     end;

  if edtvalorunit.Text = '0' then
     begin
        showmessage('Digite o Valor Unitário');
        EdtValorUnit.SetFocus;
        exit;
     end;

  if IBTROrcamento.Active then
     IBTROrcamento.Commit;
  IBTROrcamento.StartTransaction;
  try
    try
      with IBSQLOrcamento do
         begin
            close;
            sql.Clear;
            if bGravaItem then
               begin
                  sql.Add('INSERT INTO ITENS_ORCAMENTO (CODIGO, ORDEM, COD_PRO, DESCONTO, ' +
                          'COD_EMP, QUANT, VALOR, PRODUTO_PROMOCAO, CANCELADO) ' +
                          'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, 0)');
               end
            else
               begin
                  sql.Add('UPDATE ITENS_ORCAMENTO SET COD_PRO = :3, DESCONTO = :4, COD_EMP = :5, ' +
                          'QUANT = :6, VALOR = :7, PRODUTO_PROMOCAO = :8  ' +
                          'WHERE CODIGO = :1 AND ORDEM = :2');
               end;

            Parambyname('1').AsInteger  := strtoint(edtcod.Text);
            Parambyname('2').AsInteger  := iOrdem;
            Parambyname('3').AsInteger  := strtoint(EdtCodPro.text);
            Parambyname('4').AsCurrency := StrToCurr(EdtDescVr.text);
            Parambyname('5').AsInteger  := iEmp;
            Parambyname('6').AsCurrency := StrToCurr(EdtQuant.text);
            Parambyname('7').AsCurrency := StrToCurr(EdtValorUnit.Text);
            if bPromocao then
               Parambyname('8').AsString:= 'S'
            else
               Parambyname('8').AsString:= 'N';
            ExecOrOpen;
         end;
      IBTROrcamento.Commit;
    except
      IBTROrcamento.Rollback;
      showmessage('Erro ao Gravar o Item');
      EdtCodPro.SetFocus;
    end
  finally
     bGravaItem:= true;
     IBSQLOrcamento.Close;
     LimpaItens;
     BuscaItens;
     edtcodpro.SetFocus;
  end;
end;

procedure TFrmDavOrcamento.BtnCancelarClick(Sender: TObject);
var iOrdemCancelar : integer;
    iQuantProd     : integer;
begin
  inherited;
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
            sql.Text:= 'SELECT COUNT(CODIGO) QTDPRO ' +
                       'FROM ITENS_ORCAMENTO  ' +
                       'WHERE CODIGO = :COD AND CANCELADO = 0';
            Parambyname('cod').AsInteger:= strtoint(EdtCod.Text);
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
              if IBTROrcamento.Active then
                 IBTROrcamento.Commit;
              IBTROrcamento.StartTransaction;
              try
                try
                  with IBSQLOrcamento do
                     begin
                        close;
                        sql.Clear;
                        sql.Add('UPDATE ITENS_ORCAMENTO ' +
                                'SET CANCELADO = 1 ' +
                                'WHERE CODIGO = :1 AND ORDEM = :2');
                        Parambyname('1').AsInteger := strtoint(edtcod.text);
                        Parambyname('2').AsInteger := iOrdemCancelar;
                        ExecOrOpen;
                     end;
                  IBTROrcamento.Commit;
                except
                  IBTROrcamento.Rollback;
                  showmessage('Erro ao Cancelar o Item');
                end;
              finally
                bGravaItem:= true;
                IBSQLOrcamento.Close;
                LimpaItens;
                BuscaItens;
                EdtCodPro.SetFocus;
              end;
           end;
     end
  else
     begin
        showmessage('Não pode cancelar todos os itens, ' + #13 +
                    'o orçamento sera cancelado no fechamento do dia.');
        BuscaItens;
     end;
end;

procedure TFrmDavOrcamento.QBuscaItensCalcFields(DataSet: TDataSet);
begin
  inherited;
  QBuscaItensCALC_TOTAL.AsCurrency:= ((QBuscaItensQUANT.AsCurrency * QBuscaItensVALOR.AsCurrency) - QBuscaItensDESCONTO.AsCurrency);
end;

procedure TFrmDavOrcamento.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if QBuscaItensCANCELADO.AsInteger = 0 then
     begin
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
end;

procedure TFrmDavOrcamento.FormShow(Sender: TObject);
begin
  inherited;

  LimpaNovoOrcamento;
end;

procedure TFrmDavOrcamento.BtnGravarClick(Sender: TObject);
begin
  inherited;
  if IBTROrcamento.Active then
     IBTROrcamento.Commit;
  IBTROrcamento.StartTransaction;
  if bGrava then
     begin
        try
          try
            with QInsOrcamento do
               begin
                  close;
                  Parambyname('data').AsDate       := strtodate(EdtData.Text);
                  Parambyname('codcli').AsInteger  := strtoint(EdtCodcli.Text);
                  Parambyname('codtpv').AsInteger  := strtoint(EdtCodTPV.Text);
                  Parambyname('codemp').AsInteger  := iEmp;
                  Parambyname('codvend').AsInteger := strtoint(EdtCodVend.Text);
                  Parambyname('caixa').AsInteger   := iCaixa;
                  Open;
                  edtcod.Text       := QInsOrcamentoCODIGO.AsString;
                  EdtSequencia.Text := FormataStringD(QInsOrcamentoSEQUENCIA.AsString, '10', '0');
               end;
            IBTROrcamento.Commit;
            bOrcamentoAberto := true;
            panel3.Enabled   := false;
            panel4.Enabled   := true;
            bGravaItem       := true;
            Botoes('G');
            LimpaItens;
            edtcodpro.SetFocus;
          except
            IBTROrcamento.Rollback;
            bOrcamentoAberto:= false;
            showmessage('Erro ao Gravar o Orçamento');
            panel3.Enabled:= true;
            panel4.Enabled:= false;
          end;
        finally
          QInsOrcamento.Close;
          BuscaItens;
        end;
     end
       else
          begin
             try
               try
                 with IBSQLOrcamento do
                    begin
                       close;
                       sql.Clear;
                       sql.Add('UPDATE ORCAMENTO SET COD_CLI = :CODCLI, COD_VEND = :CODVEND, COD_TPV = :CODTPV ' +
                               'WHERE CODIGO = :COD');
                       Parambyname('codcli').AsInteger  := strtoint(EdtCodcli.Text);
                       Parambyname('codvend').AsInteger := strtoint(EdtCodVend.Text);
                       Parambyname('codtpv').AsInteger  := strtoint(EdtCodTPV.Text);
                       Parambyname('cod').AsInteger     := strtoint(edtcod.Text);
                       ExecOrOpen;
                    end;
                 IBTROrcamento.Commit;
                 bOrcamentoAberto := true;
                 panel3.Enabled   := false;
                 panel4.Enabled   := true;
                 bGravaItem       := true;
                 Botoes('G');
                 LimpaItens;
                 edtcodpro.SetFocus;
               except
                 IBTROrcamento.Rollback;
                 bOrcamentoAberto:= false;
                 showmessage('Erro ao Gravar o Orçamento');
                 panel3.Enabled:= true;
                 panel4.Enabled:= false;
               end;
             finally
               IBSQLOrcamento.Close;
               BuscaItens;
             end;
          end;
end;

procedure TFrmDavOrcamento.BtnAlterarClick(Sender: TObject);
begin
  inherited;
  bGrava:= false;
  ToolBar1.SetFocus;
  Botoes('A');
  panel3.Enabled:= true;

  EdtCodcli.SetFocus;
end;

procedure TFrmDavOrcamento.EdtValorUnitExit(Sender: TObject);
begin
  inherited;
  EdtTotalBR.Text:= currtostr(strtocurr(edtquant.Text) * strtocurr(EdtValorUnit.Text));
end;

procedure TFrmDavOrcamento.EdtDescVrExit(Sender: TObject);
begin
  inherited;
  EdtTotalProd.Text:= CurrToStr((strtocurr(edtquant.Text) * strtocurr(EdtValorUnit.Text)) - strtocurr(EdtDescVr.Text));
end;

procedure TFrmDavOrcamento.FormKeyDown(Sender: TObject; var Key: Word;
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
        PanelJuntarOrcamento.Visible:= true;
        EdtSeqOrcamento.Clear;
        EdtSeqOrcamento.SetFocus;
     end
  else

  if key = vk_escape then
     begin
        if PanelJuntarOrcamento.Visible then
           begin
              EdtCodPro.SetFocus;
              PanelJuntarOrcamento.Visible:= false;
           end;
     end
   else

   if key = vk_f10 then
      begin
         Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
         FrmMenuFiscal.showmodal;
      end;
end;

procedure TFrmDavOrcamento.EdtDescPercExit(Sender: TObject);
begin
  inherited;
  if strtofloat(EdtDescPerc.Text) > 0 then
     begin
        EdtDescVr.Text:= CurrToStr(((StrToCurr(EdtQuant.Text) * StrToCurr(EdtValorUnit.text)) *
                                     StrToCurr(EdtDescPerc.text)) / 100);
     end;
end;

procedure TFrmDavOrcamento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if bOrcamentoAberto then
     begin
        showmessage('Orçamento Aberto');
        CanClose:= false;
     end;
end;

procedure TFrmDavOrcamento.FormCreate(Sender: TObject);
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

procedure TFrmDavOrcamento.BtnFecharClick(Sender: TObject);
begin
  inherited;
  ToolBar1.SetFocus;

  if not (cTotalOrcamento > 0) then
     begin
        showmessage('Orçamento sem itens');
        exit;
     end;

  if iECF < 99 then
     ImprimeECF
  else
     iCOO:= 0;

  { atualiza o orçamento }
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   try
     try
       with dm.QConsultaServer do
          begin
             close;
             sql.Clear;
             sql.add('UPDATE ORCAMENTO ' +
                     'SET TOTAL = :TOTAL, COO = :COO, COD_CAI = :CAIXA ' +
                     'WHERE CODIGO = :COD ');
             Parambyname('cod').AsInteger    := strtoint(EdtCod.Text);
             Parambyname('total').AsCurrency := cTotalOrcamento;
             Parambyname('caixa').AsInteger  := iCaixa;
             if iCOO = 0 then
                Parambyname('coo').Value     := null
             else
                Parambyname('coo').AsInteger := iCOO;

             ExecOrOpen;
          end;
       dm.IBTRServer.Commit;
     except
       dm.IBTRServer.Rollback;
       showmessage('Erro ao atualizar o Orçamento');
     end;
   finally
     dm.QConsultaServer.Close;
   end;

  LimpaNovoOrcamento;
end;

procedure TFrmDavOrcamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if dm.ibtrserver.Active then
     dm.ibtrserver.Commit;

  if IBTROrcamento.Active then
     IBTROrcamento.Commit;

  Action:= caFree;
  Self := nil;
end;

procedure TFrmDavOrcamento.BtnSairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmDavOrcamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      begin
         key:= #0;
         SelectNext(ActiveControl, true, true);
      end;
end;

procedure TFrmDavOrcamento.BtnOKClick(Sender: TObject);
var iAuxCodOrcamento : integer;
begin
   if trim(EdtSeqOrcamento.Text) = '' then
      begin
         showmessage('Digite o Número do Orçamento');
         EdtSeqOrcamento.SetFocus;
         exit;
         abort;
      end;

   if strtoint(trim(EdtSequencia.Text)) = strtoint(trim(EdtSeqOrcamento.Text)) then
      begin
         showmessage('Verifique o Número do Orçamento');
         EdtSeqOrcamento.SetFocus;
         exit;
         abort;
      end;

   { busca o codigo da pre venda }
   iAuxCodOrcamento:= BuscaCodigoOrcamento(trim(EdtSeqOrcamento.Text));
   if iAuxCodOrcamento > 0 then
      begin
         { busca os itens do Orçamento }
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
                              'FROM ITENS_ORCAMENTO ' +
                              'WHERE CODIGO = :COD';
                   Parambyname('cod').AsInteger:= iAuxCodOrcamento;
                   open;

                   if IBTROrcamento.Active then
                      IBTROrcamento.Commit;
                   IBTROrcamento.StartTransaction;

                   while not eof do
                      begin
                         if fieldbyname('cancelado').AsInteger = 0 then
                            begin
                               IBSQLOrcamento.Close;
                               IBSQLOrcamento.sql.Clear;
                               IBSQLOrcamento.sql.Add('INSERT INTO ITENS_ORCAMENTO (CODIGO, ORDEM, COD_PRO, DESCONTO, ' +
                                                      'COD_EMP, QUANT, VALOR, PRODUTO_PROMOCAO, CANCELADO) ' +
                                                      'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, 0)');

                               IBSQLOrcamento.Parambyname('1').AsInteger  := strtoint(edtcod.Text);
                               IBSQLOrcamento.Parambyname('2').AsInteger  := iOrdem;
                               IBSQLOrcamento.Parambyname('3').AsInteger  := fieldbyname('cod_pro').AsInteger;
                               IBSQLOrcamento.Parambyname('4').AsCurrency := fieldbyname('desconto').AsCurrency;
                               IBSQLOrcamento.Parambyname('5').AsInteger  := iEmp;
                               IBSQLOrcamento.Parambyname('6').AsCurrency := fieldbyname('quant').AsCurrency;
                               IBSQLOrcamento.Parambyname('7').AsCurrency := fieldbyname('valor').AsCurrency;
                               IBSQLOrcamento.Parambyname('8').AsString   := fieldbyname('produto_promocao').AsString;
                               IBSQLOrcamento.ExecOrOpen;
                               inc(iOrdem);
                            end;
                         next;
                      end;
                   IBTROrcamento.Commit;
                   IBSQLOrcamento.Close;
                end;
             dm.IBTRServer.Commit;
           except
             dm.IBTRServer.Rollback;
             showmessage('Erro ao buscar os itens do Orçamento');
           end;
         finally
           dm.QConsultaServer.Close;
         end;

         { excluindo orçamento }
         if dm.IBTRServer.Active then
            dm.IBTRServer.Commit;
         dm.IBTRServer.StartTransaction;
         try
           try
             with dm.QConsultaServer do
                begin
                   close;
                   sql.Clear;
                   sql.Text:= 'DELETE FROM ORCAMENTO ' +
                              'WHERE CODIGO = :COD';
                   Parambyname('cod').AsInteger:= iAuxCodOrcamento;
                   ExecOrOpen;
                end;
             dm.IBTRServer.Commit;
           except
             dm.IBTRServer.Rollback;
             showmessage('Erro ao excluir o Orçamento');
           end;
         finally
           dm.QConsultaServer.Close;
         end;

         BuscaItens;
         edtcodpro.SetFocus;
         PanelJuntarOrcamento.Visible:= false;
      end;
end;

function TFrmDavOrcamento.BuscaCodigoOrcamento(const sSequencia : string) : integer;
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
             sql.Text:= 'SELECT CODIGO ' +
                        'FROM ORCAMENTO ' +
                        'WHERE SEQUENCIA_DAV = :SEQ AND STATUS = 0';
             Parambyname('seq').AsString:= sSequencia;
             Open;
             result:= fieldbyname('codigo').AsInteger;
          end;
       dm.IBTRServer.Commit;
     except
       dm.IBTRServer.Rollback;
       result:= 0;
       showmessage('Erro ao buscar o código do Orçamento');
     end;
   finally
     dm.QConsultaServer.Close;
   end;
end;

procedure TFrmDavOrcamento.ImprimeECF;
var cAuxTotal : currency;
    sAuxCNPJ  : string;
    sIndice   : string;
begin
   cAuxTotal:= 0;

   { busca o CNPJ/CPF do cliente }
   sAuxCNPJ:= dm.RetornaStringTabela('cnpj_cli', 'cliente', 'cod_cli', strtoint(EdtCodcli.Text));
   sIndice := trim(dm.IndiceRelGerencial('ORCAMENTO'));

   {Imprime o Cabeçalho}
   AbreRelatoroGerencial(iECF, sIndice);
   ImprimeRelatorioGerencial(iECF, '   DOCUMENTO AUXILIAR DE VENDA - ORÇAMENTO');
   ImprimeRelatorioGerencial(iECF, ' ');
   ImprimeRelatorioGerencial(iECF, 'Número..: ' + EdtSequencia.Text);
   ImprimeRelatorioGerencial(iECF, 'Vendedor: ' + trim(EdtNomeVend.Text));
   ImprimeRelatorioGerencial(iECF, 'Cliente.: ' + trim(EdtNomecli.Text));
   ImprimeRelatorioGerencial(iECF, 'CNPJ/CFP: ' + trim(sAuxCNPJ));
   ImprimeRelatorioGerencial(iECF, 'Forma...: ' + trim(EdtNomeTPV.Text));

   ImprimeRelatorioGerencial(iECF, '------------------------------------------------');
   ImprimeRelatorioGerencial(iECF, 'Item       Descrição       Qtd    Valor    Total');
   ImprimeRelatorioGerencial(iECF, '------------------------------------------------');

   { busca o COO atual }
   sCOO:= NumeroCupom(iECF);
   try
     iCOO:= strtoint(sCOO);
   except
     iCOO:= 0;
   end;

   { Impriem os Itens }
   with QBuscaItens do
      begin
         DisableControls;
         First;
         while not eof do
            begin
               ImprimeRelatorioGerencial(iECF, FormataStringD(QBuscaItensORDEM.AsString, '3', '0') + ' '   +
                                               FormataStringE(copy(QBuscaItensDESC_CUPOM.Text, 1, 18), '18', ' ') +
                                               FormataStringD(currtostrf(QBuscaItensQUANT.AsCurrency, ffnumber, 3), '7', ' ') +
                                               FormataStringD(currtostrf(QBuscaItensVALOR.AsCurrency, ffnumber, 2), '9', ' ') +
                                               FormataStringD(currtostrf(QBuscaItensQUANT.AsCurrency * QBuscaItensVALOR.AsCurrency, ffnumber, 2), '10', ' '));

               if QBuscaItensDESCONTO.AsCurrency > 0 then
                  ImprimeRelatorioGerencial(iECF, FormataStringD('DESCONTO', '30', ' ')  + FormataStringD(currtostrf(QBuscaItensDESCONTO.AsCurrency, ffnumber, 2), '18', ' '));

               if QBuscaItensCANCELADO.AsInteger = 1 then
                  ImprimeRelatorioGerencial(iECF, FormataStringD('CANCELADO ITEM ' + FormataStringD(QBuscaItensORDEM.AsString, '3', '0'), '30', ' ')  + FormataStringD('-' + currtostrf(QBuscaItensCALC_TOTAL.AsCurrency, ffnumber, 2), '18', ' '));

               if QBuscaItensCANCELADO.AsInteger = 0 then
                  cAuxTotal:= cAuxTotal + QBuscaItensCALC_TOTAL.AsCurrency;
               next;
            end;
         EnableControls;
      end;
   ImprimeRelatorioGerencial(iECF, '------------------------------------------------');
   ImprimeRelatorioGerencial(iECF, FormataStringD('TOTAL: ', '39', ' ') + FormataStringD(currtostrf(cAuxTotal, ffnumber, 2), '9', ' '));
   ImprimeRelatorioGerencial(iECF, ' ');

   ImprimeRelatorioGerencial(iECF, 'NÃO É VÁLIDO COMO RECIBO');
   ImprimeRelatorioGerencial(iECF, 'E COMO GARANTIA DE MERCADORIA ');
   ImprimeRelatorioGerencial(iECF, 'NÃO COMPROVA PAGAMENTO');
   ImprimeRelatorioGerencial(iECF, ' ');
   ImprimeRelatorioGerencial(iECF, '----É VEDADA A AUTENTICAÇÃO DESTE DOCUMENTO----');


   { Fecha o Relatório Gerencial }
   FechaRelatorioGerencial(iECF);
end;

procedure TFrmDavOrcamento.ImprimeNaoFiscal;
var sCNPJEmpresa, sEmpresa, sCNPJCLiente : string;
begin
   { busca dados da empresa}
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT RAZAO_EMP, CNPJ_EMP ' +
                        'FROM EMPRESA ' +
                        'WHERE COD_EMP = :CODEMP';
             Parambyname('codemp').AsInteger:= iEmp;
             open;
             sEmpresa       := fieldbyname('razao_emp').AsString;
             sCNPJEmpresa   := fieldbyname('cnpj_emp').AsString;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao buscar os dados da empresa');
     end;
   finally
     dm.QConsulta.close;
   end;

   sCNPJCLiente:= DM.RetornaStringTabela('cnpj_cli', 'cliente', 'cod_cli', strtoint(EdtCodcli.Text));

   Application.CreateForm(TFrmRelDavOrcamento, FrmRelDavOrcamento);
   FrmRelDavOrcamento.QRLEmpesa.Caption      := sEmpresa;
   FrmRelDavOrcamento.QRLCNPJEmpresa.Caption := sCNPJEmpresa;
   FrmRelDavOrcamento.QRLCliente.Caption     := EdtNomecli.Text;
   FrmRelDavOrcamento.QRLCNPJCliente.Caption := sCNPJCLiente;
   FrmRelDavOrcamento.QRLNumero.Caption      := EdtSequencia.Text;

   FrmRelDavOrcamento.QRRel.PreviewInitialState:= wsMaximized;
   FrmRelDavOrcamento.QRRel.Preview;

   //FrmRelDavOrcamento.QRRel.PrinterSetup;
   //FrmRelDavOrcamento.QRRel.Print;

   FrmRelDavOrcamento.QRRel.QRPrinter:= nil;
end;

procedure TFrmDavOrcamento.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if QBuscaItensCANCELADO.AsInteger = 1 then
      begin
         DBGrid1.Canvas.Font.Color:= clRed;
         Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
      end;
end;

end.
