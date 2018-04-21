unit UVendasPED;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, Mask, rxToolEdit, rxCurrEdit, 
  ExtCtrls, ComCtrls, ToolWin, ImgList, DB, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmVendasPED = class(TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    BtnGravar: TToolButton;
    BtnAlterar: TToolButton;
    ToolButton1: TToolButton;
    BtnFechar: TToolButton;
    BtnSair: TToolButton;
    Panel1: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Label21: TLabel;
    BtnConsCli: TsSpeedButton;
    Label3: TLabel;
    BtnConsVend: TsSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    BtnConsTPV: TsSpeedButton;
    Label6: TLabel;
    Label22: TLabel;
    Label9: TLabel;
    EdtCodcli: TEdit;
    EdtNomecli: TEdit;
    EdtCodVend: TEdit;
    EdtNomeVend: TEdit;
    EdtCodTPV: TEdit;
    EdtNomeTPV: TEdit;
    GBTotal: TGroupBox;
    Label11: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Shape1: TShape;
    EdtTotalBruto: TCurrencyEdit;
    EdtTotalDesc: TCurrencyEdit;
    EdtTotalLiq: TCurrencyEdit;
    EdtCodigo: TEdit;
    EdtData: TMaskEdit;
    Panel4: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    BtnConsPro: TsSpeedButton;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    DBGrid1: TDBGrid;
    EdtTotalBR: TCurrencyEdit;
    EdtDescPerc: TCurrencyEdit;
    EdtCodPro: TEdit;
    EdtNomePro: TEdit;
    EdtQuant: TCurrencyEdit;
    EdtValorUnit: TCurrencyEdit;
    EdtDescVr: TCurrencyEdit;
    EdtTotalProd: TCurrencyEdit;
    BtnGrava: TBitBtn;
    BtnCancelar: TBitBtn;
    PanelJuntarPreVenda: TPanel;
    Label1: TLabel;
    EdtSenhaPreVenda: TEdit;
    BtnOK: TButton;
    StatusBar2: TStatusBar;
    Label12: TLabel;
    EdtNumero: TEdit;
    Label13: TLabel;
    EdtModelo: TEdit;
    Label15: TLabel;
    EdtSerie: TEdit;
    ImageList: TImageList;
    IBSQLVenda: TFDQuery;
    IBTRVenda: TFDTransaction;
    QBuscaItens: TFDQuery;
    DSBuscaItens: TDataSource;
    QAbreVenda: TFDQuery;
    QAbreVendaCODVEN: TIntegerField;
    QBuscaItensCOD_VEN: TIntegerField;
    QBuscaItensCOD_PRO: TIntegerField;
    QBuscaItensORDEM: TIntegerField;
    QBuscaItensDESCONTO: TBCDField;
    QBuscaItensCOD_EMP: TIntegerField;
    QBuscaItensQUANT: TBCDField;
    QBuscaItensVALOR: TBCDField;
    QBuscaItensPRODUTO_PROMOCAO: TStringField;
    QBuscaItensCANCELADO: TIntegerField;
    QBuscaItensSTATUS_EXPORTA: TIntegerField;
    QBuscaItensCOD_VEND: TIntegerField;
    QBuscaItensNOME_PRO: TStringField;
    QBuscaItensCALC_TOTAL: TCurrencyField;
    QBuscaItensVENDA_CANCELADA: TIntegerField;
    QBuscaItensDESCRICAO: TStringField;
    procedure EdtCodcliExit(Sender: TObject);
    procedure EdtCodcliEnter(Sender: TObject);
    procedure EdtCodcliKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodcliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsCliClick(Sender: TObject);
    procedure EdtCodVendEnter(Sender: TObject);
    procedure EdtCodVendExit(Sender: TObject);
    procedure EdtCodVendKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsVendClick(Sender: TObject);
    procedure EdtCodTPVEnter(Sender: TObject);
    procedure EdtCodTPVExit(Sender: TObject);
    procedure EdtCodTPVKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsTPVClick(Sender: TObject);
    procedure EdtCodProEnter(Sender: TObject);
    procedure EdtCodProExit(Sender: TObject);
    procedure EdtCodProKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function DescontoTPV(codtpv : integer) : currency;
    procedure BtnGravarClick(Sender: TObject);
    procedure Botoes(acao : string);
    procedure LimpaItens;
    procedure BuscaItens;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LimpaNovaVenda;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnGravaClick(Sender: TObject);
    procedure QBuscaItensCalcFields(DataSet: TDataSet);
    procedure BtnCancelarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVendasPED: TFrmVendasPED;

implementation
uses
  UDM, Ubibli1, USitCli, UsenhaLiberarVenda, UConsCli, UConsVend, 
  UConsTipoVenda, UFechaVendaPED, UMenuFiscal;

var  iClienteVista   : integer;
     bVendasLiberada : boolean;
     bPromocao       : boolean;
     iOrdem          : integer;
     bGrava          : boolean;
     bGravaItem      : boolean;
     bVendaAberta    : boolean;
     cTotalVenda     : currency;
     cDescPromocao   : currency;

{$R *.dfm}

procedure TFrmVendasPED.LimpaNovaVenda;
begin
   iTabelaPreco   := 0;
   bGrava         := true;
   bGravaItem     := true;
   cTotalVenda    := 0;
   bVendaAberta   := false;

   if IBTRVenda.Active then
      IBTRVenda.Commit;
   QBuscaItens.Close;
   Botoes('N');
   panel3.Enabled := true;
   panel4.Enabled := false;
   EdtData.Text   := datetostr(date);
   EdtModelo.Text := '02';
   EdtSerie.Text  := 'D'; 
   EdtData.SetFocus;
end;

procedure TFrmVendasPED.LimpaItens;
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

procedure TFrmVendasPED.Botoes(acao : string);
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
             Limpaedit(FrmVendasPED);
       end
    else
       begin
          if not (acao = 'G') then
             Limpaedit(FrmVendasPED);
          BtnGravar.Enabled  := false;
          if (acao = 'C') or (acao = 'E') then
             btnalterar.Enabled:= false
          else
             btnalterar.Enabled:= true;
       end;
end;

function TFrmVendasPED.DescontoTPV (codtpv : integer) : currency;
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

procedure TFrmVendasPED.EdtCodcliExit(Sender: TObject);
var bAchou     : boolean;
    bBloqueado : boolean;
begin
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
        FrmSitCli.Tag:= 2;
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
                          if not bVendasLiberada then
                             edtcodcli.SetFocus;
                          bVendasLiberada:= false;
                       end;
                 end;
           end;
     end;
end;

procedure TFrmVendasPED.EdtCodcliEnter(Sender: TObject);
begin
   EdtCodcli.SelectAll;
end;

procedure TFrmVendasPED.EdtCodcliKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmVendasPED.EdtCodcliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f2 then
      BtnConsCli.Click;
end;

procedure TFrmVendasPED.BtnConsCliClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsCli, FrmConsCli);
   FrmConsCli.tag:= 7;
   FrmConsCli.showmodal;
end;

procedure TFrmVendasPED.EdtCodVendEnter(Sender: TObject);
begin
   EdtCodVend.SelectAll;
end;

procedure TFrmVendasPED.EdtCodVendExit(Sender: TObject);
begin
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

procedure TFrmVendasPED.EdtCodVendKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f2 then
      BtnConsVend.Click;
end;

procedure TFrmVendasPED.BtnConsVendClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsVend, FrmConsVend);
   FrmConsVend.tag:= 1;
   FrmConsVend.showmodal;
end;

procedure TFrmVendasPED.EdtCodTPVEnter(Sender: TObject);
begin
   EdtCodTPV.SelectAll;
end;

procedure TFrmVendasPED.EdtCodTPVExit(Sender: TObject);
begin
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

procedure TFrmVendasPED.EdtCodTPVKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f2 then
      BtnConsTPV.Click;
end;

procedure TFrmVendasPED.BtnConsTPVClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsTipoVenda, FrmConsTipoVenda);
   FrmConsTipoVenda.tag:= 3;
   FrmConsTipoVenda.showmodal;
end;

procedure TFrmVendasPED.EdtCodProEnter(Sender: TObject);
begin
   EdtCodPro.SelectAll;
end;

procedure TFrmVendasPED.EdtCodProExit(Sender: TObject);
var iCodPro : integer;
begin
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
                          0: begin // tabela normal - a vista
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
                             end;
                          1: begin
                                bPromocao         := false;
                                cDescPromocao     := 0;
                                EdtValorUnit.Text := fieldbyname('PRECO_PRAZO_PRO').AsString;
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

procedure TFrmVendasPED.EdtCodProKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f2 then
      BtnConsPro.Click;
end;

procedure TFrmVendasPED.BtnGravarClick(Sender: TObject);
begin
   if trim(EdtNumero.Text) = '' then
      begin
         showmessage('Digite o Número da Nota Fiscal');
         EdtNumero.SetFocus;
         exit;
      end;

   if trim(EdtModelo.Text) = '' then
      begin
         showmessage('Digite o Modelo da Nota Fiscal');
         EdtModelo.SetFocus;
         exit;
      end;

   if IBTRVenda.Active then
      IBTRVenda.Commit;
   IBTRVenda.StartTransaction;
   if bGrava then
      begin
         try
           try
             with QAbreVenda do
                begin
                   close;
                   Parambyname('dataven').AsDate      := strtodate(EdtData.Text);
                   Parambyname('codemp').AsInteger    := iEmp;
                   Parambyname('codcai').AsInteger    := iCaixa;
                   Parambyname('datahora').AsDateTime := now;
                   Parambyname('codusu').AsInteger    := ICodUsu;
                   Parambyname('cupom').Value         := null;
                   Parambyname('codcli').AsInteger    := strtoint(EdtCodcli.Text);
                   Parambyname('codvend').AsInteger   := strtoint(EdtCodVend.Text);
                   Parambyname('codtpv').AsInteger    := strtoint(EdtCodTPV.Text);
                   Parambyname('modelo').AsString     := trim(EdtModelo.Text);
                   if trim(EdtSerie.Text) = '' then
                      Parambyname('serie').Value      := null
                   else
                      Parambyname('serie').AsString   := trim(EdtSerie.Text);
                   Parambyname('numero').AsInteger    := strtoint(EdtNumero.Text);
                   Parambyname('cancelada').AsInteger := 0;
                   Parambyname('ccf').AsInteger       := 0;
                   Parambyname('cer').AsInteger       := 0;
                   Parambyname('CONSIGNADA' ).AsString := 'N';
                   open;
                   EdtCodigo.Text:= QAbreVendaCODVEN.AsString;
                end;
             IBTRVenda.Commit;
             bVendaAberta   := true;
             panel3.Enabled := false;
             panel4.Enabled := true;
             bGravaItem     := true;
             Botoes('G');
             LimpaItens;
             edtcodpro.SetFocus;
           except
             IBTRVenda.Rollback;
             bVendaAberta:= false;
             showmessage('Erro ao Gravar a Venda');
             panel3.Enabled:= true;
             panel4.Enabled:= false;
           end;
         finally
           QAbreVenda.Close;
           BuscaItens;
         end;
      end
        else
           begin
              try
                try
                  with IBSQLVenda do
                     begin
                        close;
                        sql.Clear;
                        sql.Add('UPDATE VENDAS SET DATA_VEN = :DATAVEN, DATA_HORA_VEN = :DATAHORA, ' +
                                'COD_CLI = :CODCLI, COD_TPV = :CODTPV, :COD_VEND = :CODVEND,       ' +
                                'CODIGO_MODELO_NOTA_FISCAL = :MODELO, SERIE_NOTA_FISCAL = :SERIE,  ' +
                                'NUMERO_NOTA_FISCAL = :NUMERO WHERE COD_VEN = :CODVEN');

                        Parambyname('dataven').AsDate      := strtodate(EdtData.Text);
                        Parambyname('datahora').AsDateTime := now;
                        Parambyname('codcli').AsInteger    := strtoint(EdtCodcli.Text);
                        Parambyname('codvend').AsInteger   := strtoint(EdtCodVend.Text);
                        Parambyname('codtpv').AsInteger    := strtoint(EdtCodTPV.Text);
                        Parambyname('codmodelo').AsInteger := strtoint(EdtModelo.Text);
                        if trim(EdtSerie.Text) = '' then
                           Parambyname('serie').Value      := null
                        else
                           Parambyname('serie').AsString   := trim(EdtSerie.Text);
                        Parambyname('numero').AsInteger    := strtoint(EdtNumero.Text);
                        ExecOrOpen;
                     end;
                  IBTRVenda.Commit;
                  bVendaAberta     := true;
                  panel3.Enabled := false;
                  panel4.Enabled := true;
                  bGravaItem     := true;
                  Botoes('G');
                  LimpaItens;
                  edtcodpro.SetFocus;
                except
                  IBTRVenda.Rollback;
                  bVendaAberta:= false;
                  showmessage('Erro ao Gravar a Venda');
                  panel3.Enabled:= true;
                  panel4.Enabled:= false;
                end;
              finally
                IBSQLVenda.Close;
                BuscaItens;
              end;
           end;
end;

procedure TFrmVendasPED.BuscaItens;
var cDesconto : currency;
begin
   cTotalVenda:= 0;
   cDesconto:= 0;
   if IBTRVenda.Active then
      IBTRVenda.Commit;
   IBTRVenda.StartTransaction;
   with QBuscaItens do
      begin
         close;
         Parambyname('codven').AsInteger:= strtoint(EdtCodigo.Text);
         open;
         first;
         DisableControls;
         while not eof do
            begin
               if QBuscaItensCANCELADO.AsInteger = 0 then
                  begin
                     cTotalVenda:= cTotalVenda + (QBuscaItensQUANT.AsCurrency * QBuscaItensVALOR.AsCurrency);
                     cDesconto:= cDesconto + QBuscaItensDESCONTO.AsCurrency;
                  end;
               next;
            end;
         iOrdem:= QBuscaItensORDEM.AsInteger + 1;
         EnableControls;
      end;
   EdtTotalBruto.Text:= CurrToStr(cTotalVenda);
   EdtTotalDesc.Text := CurrToStr(cDesconto);
   EdtTotalLiq.Text  := CurrToStr(cTotalVenda - cDesconto);
end;

procedure TFrmVendasPED.FormCreate(Sender: TObject);
begin

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

procedure TFrmVendasPED.FormShow(Sender: TObject);
begin

   LimpaNovaVenda;
end;

procedure TFrmVendasPED.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      begin
         key:= #0;
         SelectNext(ActiveControl, true, true);
      end;
end;

procedure TFrmVendasPED.BtnGravaClick(Sender: TObject);
begin
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

  if IBTRVenda.Active then
     IBTRVenda.Commit;
  IBTRVenda.StartTransaction;
  try
    try
      with IBSQLVenda do
         begin
            close;
            sql.Clear;
            if bGravaItem then
               begin
                  sql.Add('INSERT INTO ITENS_VENDA (COD_VEN, COD_PRO, ORDEM,  ' +
                          'DESCONTO, COD_EMP, QUANT, VALOR, PRODUTO_PROMOCAO, ' +
                          'CANCELADO, COD_VEND, STATUS_EXPORTA, VENDA_CANCELADA) ' +
                          'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, 0, 0)');
                  Parambyname('9').AsInteger:= 0;
               end
            else
               begin
                  sql.Add('UPDATE ITENS_VENDA SET COD_PRO = :2, DESCONTO = :4, ' +
                          'COD_EMP = :5, QUANT = :6, VALOR = :7, PRODUTO_PROMOCAO = :8, ' +
                          'COD_VEND = :10 WHERE COD_VEN = :1 AND ORDEM = :3');
               end;

            Parambyname('1').AsInteger  := strtoint(EdtCodigo.Text);
            Parambyname('2').AsInteger  := strtoint(EdtCodPro.text);
            Parambyname('3').AsInteger  := iOrdem;
            Parambyname('4').AsCurrency := StrToCurr(EdtDescVr.text);
            Parambyname('5').AsInteger  := iEmp;
            Parambyname('6').AsCurrency := StrToCurr(EdtQuant.text);
            Parambyname('7').AsCurrency := StrToCurr(EdtValorUnit.Text);
            if bPromocao then
               Parambyname('8').AsString:= 'S'
            else
               Parambyname('8').AsString:= 'N';
            Parambyname('10').AsInteger := strtoint(EdtCodVend.Text); 
            ExecOrOpen;
         end;
      IBTRVenda.Commit;
    except
      IBTRVenda.Rollback;
      showmessage('Erro ao Gravar o Item');
      EdtCodPro.SetFocus;
    end
  finally
     bGravaItem:= true;
     IBSQLVenda.Close;
     LimpaItens;
     BuscaItens;
     edtcodpro.SetFocus;
  end;
end;

procedure TFrmVendasPED.QBuscaItensCalcFields(DataSet: TDataSet);
begin
   QBuscaItensCALC_TOTAL.AsCurrency:= ((QBuscaItensQUANT.AsCurrency * QBuscaItensVALOR.AsCurrency) - QBuscaItensDESCONTO.AsCurrency);
end;

procedure TFrmVendasPED.BtnCancelarClick(Sender: TObject);
var iOrdemCancelar : integer;
    iQuantProd     : integer;
begin
   { verifica se tem mais de 1 item nao cancelado }
   iQuantProd:= 0;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT COUNT(COD_VEN) QTDPRO ' +
                        'FROM ITENS_VENDA  ' +
                        'WHERE COD_VEN = :CODVEN AND CANCELADO = 0';
             Parambyname('codven').AsInteger:= strtoint(EdtCodigo.Text);
             open;
             iQuantProd:= fieldbyname('qtdpro').AsInteger;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       iQuantProd:= 0;
       showmessage('Erro ao verificar se pode cancelar o item');
     end;
   finally
     dm.QConsulta.Close;
   end;

   if iQuantProd > 1 then
      begin
         if Application.MessageBox('Confirma o Cancelamento do Item?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
            begin
               iOrdemCancelar:= QBuscaItensORDEM.AsInteger;
               if IBTRVenda.Active then
                  IBTRVenda.Commit;
               IBTRVenda.StartTransaction;
               try
                 try
                   with IBSQLVenda do
                      begin
                         close;
                         sql.Clear;
                         sql.Add('UPDATE ITENS_VENDA SET CANCELADO = 1 ' +
                                 'WHERE COD_VEN = :1 AND ORDEM = :2');
                         Parambyname('1').AsInteger := strtoint(EdtCodigo.text);
                         Parambyname('2').AsInteger := iOrdemCancelar;
                         ExecOrOpen;
                      end;
                   IBTRVenda.Commit;
                 except
                   IBTRVenda.Rollback;
                   showmessage('Erro ao Cancelar o Item');
                 end;
               finally
                 bGravaItem:= true;
                 IBSQLVenda.Close;
                 LimpaItens;
                 BuscaItens;
                 EdtCodPro.SetFocus;
               end;
            end;
      end
   else
      begin
        showmessage('Não pode cancelar todos os itens, cancele a venda.');
        BuscaItens;
     end;
end;

procedure TFrmVendasPED.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if QBuscaItensCANCELADO.AsInteger = 1 then
      begin
         DBGrid1.Canvas.Font.Color:= clRed;
         Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
      end;
end;

procedure TFrmVendasPED.BtnFecharClick(Sender: TObject);
var bVendaPrazo : boolean;
begin
   ToolBar1.SetFocus;

   if iOrdem = 0 then
      exit;

   { VERIFICA O TIPO DE VENDA - A VISTA OU A PRAZO }
   if dm.RetornaIntegerTabela('QTDPARCELAS_TPV', 'TIPO_VENDA', 'COD_TPV', strtoint(EdtCodTPV.Text)) > 0 then
      bVendaPrazo:= true
   else
      bVendaPrazo:= false;

   { ABRE GRAVETA }
//   AbreGaveta(iECF, IGaveta);

   Application.CreateForm(TFrmFechaVendaPED, FrmFechaVendaPED);

   FrmFechaVendaPED.Edttroco.text:= '0';

   FrmFechaVendaPED.showmodal;
end;

procedure TFrmVendasPED.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f5 then
      BtnFechar.Click
   else
      if key = vk_f10 then
         begin
            Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
            FrmMenuFiscal.showmodal;
         end;
end;

procedure TFrmVendasPED.BtnSairClick(Sender: TObject);
begin
   close; 
end;

end.
