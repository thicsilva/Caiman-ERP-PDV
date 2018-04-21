unit UDavOrdemServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ImgList, StdCtrls, Buttons, Grids, DBGrids, Mask, rxToolEdit, 
  rxCurrEdit, ExtCtrls, ComCtrls, ToolWin, DB, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmDAVOrdemServico = class(TForm)
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
    Label5: TLabel;
    BtnConsTPV: TsSpeedButton;
    Label6: TLabel;
    Label22: TLabel;
    Label9: TLabel;
    EdtCodigoOS: TEdit;
    EdtCodcli: TEdit;
    EdtNomecli: TEdit;
    EdtCodTPV: TEdit;
    EdtNomeTPV: TEdit;
    EdtSequencia: TEdit;
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
    PanelJuntarOS: TPanel;
    Label1: TLabel;
    EdtNumeroOS: TEdit;
    BtnOK: TButton;
    StatusBar2: TStatusBar;
    ImageList: TImageList;
    Label3: TLabel;
    EdtCodVend: TEdit;
    BtnConsVend: TsSpeedButton;
    EdtNomeVend: TEdit;
    Label4: TLabel;
    Label12: TLabel;
    EdtPlaca: TMaskEdit;
    Label13: TLabel;
    EdtCodMarca: TEdit;
    BtnConsMarca: TsSpeedButton;
    EdtNomeMarca: TEdit;
    Label15: TLabel;
    Label25: TLabel;
    EdtCodModelo: TEdit;
    BtnConsModelo: TsSpeedButton;
    EdtNomeModelo: TEdit;
    Label26: TLabel;
    Label27: TLabel;
    EdtRenavam: TEdit;
    Label28: TLabel;
    EdtAnoFabricacao: TEdit;
    Label29: TLabel;
    EdtNumeroFab: TEdit;
    GBTotal: TGroupBox;
    Label11: TLabel;
    Label8: TLabel;
    Shape1: TShape;
    Label7: TLabel;
    Label30: TLabel;
    EdtTotalProdutos: TCurrencyEdit;
    EdtTotal: TCurrencyEdit;
    EdtTotalServicos: TCurrencyEdit;
    EdtDesconto: TCurrencyEdit;
    QBuscaItens: TFDQuery;
    IBTROS: TFDTransaction;
    QBuscaItensCODIGO: TIntegerField;
    QBuscaItensORDEM: TIntegerField;
    QBuscaItensCOD_PRO: TIntegerField;
    QBuscaItensDESCONTO: TBCDField;
    QBuscaItensCOD_EMP: TIntegerField;
    QBuscaItensCOD_VEND: TIntegerField;
    QBuscaItensQUANT: TBCDField;
    QBuscaItensVALOR: TBCDField;
    QBuscaItensPRODUTO_PROMOCAO: TStringField;
    QBuscaItensCANCELADO: TIntegerField;
    QBuscaItensNOME_PRO: TStringField;
    QBuscaItensNOME_VEND: TStringField;
    QBuscaItensCALC_TOTAL: TCurrencyField;
    QBuscaItensSERVICO: TStringField;
    QInsertOS: TFDQuery;
    QInsertOSCODIGO: TIntegerField;
    QInsertOSSEQUENCIA: TLargeintField;
    IBSQLOS: TFDQuery;
    DSItens: TDataSource;
    QBuscaItensDESC_CUPOM: TStringField;
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
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnConsTPVClick(Sender: TObject);
    procedure BtnConsCliClick(Sender: TObject);
    procedure BtnConsVendClick(Sender: TObject);
    procedure EdtCodTPVKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodMarcaEnter(Sender: TObject);
    procedure EdtCodModeloEnter(Sender: TObject);
    procedure EdtCodMarcaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodModeloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodMarcaExit(Sender: TObject);
    procedure EdtCodModeloExit(Sender: TObject);
    procedure BtnConsMarcaClick(Sender: TObject);
    procedure BtnConsModeloClick(Sender: TObject);
    procedure EdtCodProEnter(Sender: TObject);
    procedure EdtCodProExit(Sender: TObject);
    procedure EdtCodProKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsProClick(Sender: TObject);
    procedure Botoes(acao : string);
    procedure LimpaNovaOS;
    procedure BuscaItens;
    procedure LimpaItens;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnGravaClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure QBuscaItensCalcFields(DataSet: TDataSet);
    procedure ImprimeECF;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnOKClick(Sender: TObject);
    function BuscaOrdemServico(const sNumero : string) : integer;
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDAVOrdemServico: TFrmDAVOrdemServico;

implementation
uses
  UDM, UECF, Ubibli1, USitCli, UsenhaLiberarVenda, UConsTipoVenda, UConsCli, 
  UConsVend, UConsMarcas, UConsModelos, UConsProd, UMenuFiscal;
var  cDescPromocao : currency;
     cTotalOS      : currency;

     bPromocao     : boolean;
     bGrava        : boolean;
     bGravaItem    : boolean;
     bOSLib        : boolean;
     bOSAberta     : boolean;

     iClienteVista : integer;
     iOrdem        : integer;
     iCOO          : integer;
     iOLDCodOS     : integer;
     sCOO          : string;

{$R *.dfm}

procedure TFrmDAVOrdemServico.Botoes(acao : string);
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
             Limpaedit(FrmDAVOrdemServico);
       end
    else
       begin
          if not (acao = 'G') then
             Limpaedit(FrmDAVOrdemServico);
          BtnGravar.Enabled:= false;
          if (acao = 'C') or (acao = 'E') then
             btnalterar.Enabled:= false
          else
             btnalterar.Enabled:= true;
       end;
end;

procedure TFrmDAVOrdemServico.LimpaNovaOS;
begin
   iTabelaPreco   := 0;
   bGrava         := true;
   bGravaItem     := true;
   cTotalOS       := 0;
   bOSAberta      := false;

   if IBTROS.Active then
      IBTROS.Commit;
   QBuscaItens.Close;
   Botoes('N');
   panel3.Enabled := true;
   panel4.Enabled := false;
   EdtData.Text   := datetostr(date);
   EdtPlaca.SetFocus;
end;

procedure TFrmDAVOrdemServico.BuscaItens;
var cTotalBrutoProduto, cTotalBrutoServico, cDesconto : currency;
begin
   cTotalBrutoProduto := 0;
   cTotalBrutoServico := 0;
   cDesconto          := 0;
   if IBTROS.Active then
      IBTROS.Commit;
   IBTROS.StartTransaction;
   with QBuscaItens do
      begin
         close;
         Parambyname('codigo').AsInteger:= strtoint(EdtCodigoOS.Text);
         open;
         first;
         DisableControls;
         while not eof do
            begin
               if QBuscaItensCANCELADO.AsInteger = 0 then
                  begin
                     if trim(QBuscaItensSERVICO.AsString) = 'N' then
                        cTotalBrutoProduto:= cTotalBrutoProduto + (QBuscaItensQUANT.AsCurrency * QBuscaItensVALOR.AsCurrency)
                     else
                        cTotalBrutoServico:= cTotalBrutoServico + (QBuscaItensQUANT.AsCurrency * QBuscaItensVALOR.AsCurrency);
                     cDesconto:= cDesconto + QBuscaItensDESCONTO.AsCurrency;
                  end;
               next;
            end;
         iOrdem:= QBuscaItensORDEM.AsInteger + 1;
         EnableControls;
      end;
   cTotalOS:= cTotalBrutoProduto + cTotalBrutoServico - cDesconto;
   EdtTotalProdutos.Text := currtostr(cTotalBrutoProduto);
   EdtTotalServicos.Text := currtostr(cTotalBrutoServico);
   EdtDesconto.Text      := currtostr(cDesconto);
   EdtTotal.Text         := currtostr(cTotalOS);
end;

procedure TFrmDAVOrdemServico.LimpaItens;
begin
   EdtCodPro.Clear;
   edtnomepro.Clear;
   EdtCodVend.Clear;
   EdtNomeVend.Clear;
   edtquant.Text:= '1';
   edtvalorunit.Clear;
   EdtDescVr.Clear;
   EdtDescPerc.Clear;
   EdtTotalProd.Clear;
   EdtTotalBR.Clear;
end;

procedure TFrmDAVOrdemServico.EdtCodcliEnter(Sender: TObject);
begin
   EdtCodcli.SelectAll;
end;

procedure TFrmDAVOrdemServico.EdtCodcliExit(Sender: TObject);
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
        FrmSitCli.Tag:= 3;
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
                          if not bOSLib then
                             edtcodcli.SetFocus;
                          bOSLib:= false;
                       end;
                 end;
           end;
     end;
end;

procedure TFrmDAVOrdemServico.EdtCodcliKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_f2 then
      BtnConsCli.Click;
end;

procedure TFrmDAVOrdemServico.EdtCodcliKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmDAVOrdemServico.EdtCodVendEnter(Sender: TObject);
begin
   EdtCodVend.SelectAll;
end;

procedure TFrmDAVOrdemServico.EdtCodVendExit(Sender: TObject);
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

procedure TFrmDAVOrdemServico.EdtCodVendKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_f2 then
      BtnConsVend.Click;
end;

procedure TFrmDAVOrdemServico.EdtCodTPVEnter(Sender: TObject);
begin
   EdtCodTPV.SelectAll;
end;

procedure TFrmDAVOrdemServico.EdtCodTPVExit(Sender: TObject);
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
end;

procedure TFrmDAVOrdemServico.BtnGravarClick(Sender: TObject);
begin
   if trim(EdtCodcli.Text) = '' then
     begin
        EdtCodcli.SetFocus;
        exit;
     end;

  if trim(EdtCodMarca.Text) = '' then
     begin
        EdtCodMarca.SetFocus;
        exit;
     end;

  if trim(EdtCodModelo.Text) = '' then
     begin
        EdtCodMarca.SetFocus;
        exit;
     end;

  if trim(EdtCodTPV.Text) = '' then
     begin
        EdtCodTPV.SetFocus;
        exit;
     end;

  if IBTROS.Active then
     IBTROS.Commit;
  IBTROS.StartTransaction;
  if bGrava then
     begin
        try
          try
            with QInsertOS do
               begin
                  close;
                  Parambyname('data_abertura').AsDate        := strtodate(EdtData.Text);
                  Parambyname('codigo_marca').AsInteger      := strtoint(EdtCodMarca.Text);
                  Parambyname('codigo_modelo').AsInteger     := strtoint(EdtCodModelo.Text);
                  if trim(EdtAnoFabricacao.Text) = '' then
                     Parambyname('ano_fabricacao').Value     := null
                  else
                     Parambyname('ano_fabricacao').AsInteger := strtoint(EdtAnoFabricacao.Text);
                  Parambyname('placa').AsString              := EdtPlaca.Text;
                  if trim(EdtRenavam.Text) = '' then
                     Parambyname('renavam').Value            := null
                  else
                     Parambyname('renavam').AsString         := trim(EdtRenavam.Text);
                  Parambyname('cod_cli').AsInteger           := strtoint(EdtCodcli.Text);
                  Parambyname('cod_tpv').AsInteger           := strtoint(EdtCodTPV.Text);
                  if trim(EdtNumeroFab.Text) = '' then
                     Parambyname('numero_serie').Value       := null
                  else
                     Parambyname('numero_serie').AsString    := trim(EdtNumeroFab.Text);
                  Parambyname('cod_cai').AsInteger           := iCaixa;
                  Parambyname('cod_emp').AsInteger           := iEmp;
                  open;
                  EdtCodigoOS.Text  := QInsertOSCODIGO.AsString;
                  EdtSequencia.Text := FormataStringD(QInsertOSSEQUENCIA.AsString, '10', '0');
               end;
            IBTROS.Commit;
            bOSAberta      := true;
            panel3.Enabled := false;
            panel4.Enabled := true;
            bGravaItem     := true;
            Botoes('G');
            LimpaItens;
            edtcodpro.SetFocus;
          except
            IBTROS.Rollback;
            bOSAberta:= false;
            showmessage('Erro ao Gravar a OS');
            panel3.Enabled:= true;
            panel4.Enabled:= false;
          end;
        finally
          QInsertOS.Close;
          BuscaItens;
        end;
     end
       else
          begin
             try
               try
                 with IBSQLOS do
                    begin
                       close;
                       sql.Clear;
                       sql.Add('UPDATE ORDEM_SERVICO SET DATA_ABERTURA = :DATA_ABERTURA,              ' +
                               'CODIGO_MARCA = :CODIGO_MARCA, CODIGO_MODELO = :CODIGO_MODELO,         ' +
                               'ANO_FABRICACAO = :ANO_FABRICACAO, PLACA = :PLACA, RENAVAM = :RENAVAM, ' +
                               'COD_CLI = :COD_CLI, COD_TPV = :COD_TPV, NUMERO_SERIE = :NUMERO_SERIE  ' +
                               'WHERE CODIGO = :CODIGO');

                       Parambyname('data_abertura').AsDate        := strtodate(EdtData.Text);
                       Parambyname('codigo_marca').AsInteger      := strtoint(EdtCodMarca.Text);
                       Parambyname('codigo_modelo').AsInteger     := strtoint(EdtCodModelo.Text);
                       if trim(EdtAnoFabricacao.Text) = '' then
                          Parambyname('ano_fabricacao').Value     := null
                       else
                          Parambyname('ano_fabricacao').AsInteger := strtoint(EdtAnoFabricacao.Text);
                       Parambyname('placa').AsString              := EdtPlaca.Text;
                       if trim(EdtRenavam.Text) = '' then
                          Parambyname('renavam').Value            := null
                       else
                          Parambyname('renavam').AsString         := trim(EdtRenavam.Text);
                       Parambyname('cod_cli').AsInteger           := strtoint(EdtCodcli.Text);
                       Parambyname('cod_tpv').AsInteger           := strtoint(EdtCodTPV.Text);
                       if trim(EdtNumeroFab.Text) = '' then
                          Parambyname('numero_serie').Value       := null
                       else
                          Parambyname('numero_serie').AsString    := trim(EdtNumeroFab.Text);
                       ExecOrOpen;
                       EdtCodigoOS.Text  := QInsertOSCODIGO.AsString;
                       EdtSequencia.Text := FormataStringD(QInsertOSSEQUENCIA.AsString, '10', '0');
                       ExecOrOpen;
                    end;
                 IBTROS.Commit;
                 bOSAberta      := true;
                 panel3.Enabled := false;
                 panel4.Enabled := true;
                 bGravaItem     := true;
                 Botoes('G');
                 LimpaItens;
                 edtcodpro.SetFocus;
               except
                 IBTROS.Rollback;
                 bOSAberta:= false;
                 showmessage('Erro ao Gravar a OS');
                 panel3.Enabled:= true;
                 panel4.Enabled:= false;
               end;
             finally
               IBSQLOS.Close;
               BuscaItens;
             end;
          end;
end;

procedure TFrmDAVOrdemServico.BtnConsTPVClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsTipoVenda, FrmConsTipoVenda);
   FrmConsTipoVenda.tag:= 4;
   FrmConsTipoVenda.showmodal;
end;

procedure TFrmDAVOrdemServico.BtnConsCliClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsCli, FrmConsCli);
   FrmConsCli.tag:= 8;
   FrmConsCli.showmodal;
end;

procedure TFrmDAVOrdemServico.BtnConsVendClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsVend, FrmConsVend);
   FrmConsVend.tag:= 5;
   FrmConsVend.showmodal;
end;

procedure TFrmDAVOrdemServico.EdtCodTPVKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_f2 then
      BtnConsTPV.Click;
end;

procedure TFrmDAVOrdemServico.EdtCodMarcaEnter(Sender: TObject);
begin
   EdtCodMarca.SelectAll;
end;

procedure TFrmDAVOrdemServico.EdtCodModeloEnter(Sender: TObject);
begin
   EdtCodModelo.SelectAll;
end;

procedure TFrmDAVOrdemServico.EdtCodMarcaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_f2 then
      BtnConsMarca.Click;
end;

procedure TFrmDAVOrdemServico.EdtCodModeloKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_f2 then
      BtnConsModelo.Click;
end;

procedure TFrmDAVOrdemServico.EdtCodMarcaExit(Sender: TObject);
begin
   if ToolBar1.Focused then
      exit;
   EdtNomeMarca.Text:= consulta('marcas', EdtCodMarca, 'codigo', 'descricao', dm.IBTRServer, dm.QConsultaServer);
   if trim(EdtNomeMarca.Text) = '' then
      begin
         showmessage('Marca não Cadastrada');
         EdtCodMarca.SetFocus;
         exit;
         abort;
      end;
end;

procedure TFrmDAVOrdemServico.EdtCodModeloExit(Sender: TObject);
begin
   if ToolBar1.Focused then
      exit;
   EdtNomeModelo.Text:= consulta('modelos', EdtCodModelo, 'codigo', 'descricao', dm.IBTRServer, dm.QConsultaServer);
   if trim(EdtNomeMarca.Text) = '' then
      begin
         showmessage('Modelo não Cadastrado');
         EdtCodModelo.SetFocus;
         exit;
         abort;
      end;
end;

procedure TFrmDAVOrdemServico.BtnConsMarcaClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsMarcas, FrmConsMarcas);
   FrmConsMarcas.Tag:= 0;
   FrmConsMarcas.ShowModal;
end;

procedure TFrmDAVOrdemServico.BtnConsModeloClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsModelos, FrmConsModelos);
   FrmConsModelos.Tag:= 0;
   FrmConsModelos.ShowModal;
end;

procedure TFrmDAVOrdemServico.EdtCodProEnter(Sender: TObject);
begin
   EdtCodPro.SelectAll;
end;

procedure TFrmDAVOrdemServico.EdtCodProExit(Sender: TObject);
var iCodPro : integer;
begin
   if (DBGrid1.Focused) or (ToolBar1.Focused) or (EdtNumeroOS.Focused) then
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
                                      bPromocao     := false;
                                      cDescPromocao := 0;
                                      edtvalorunit.Text:= floattostr(fieldbyname('valor_pro').AsCurrency);
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

procedure TFrmDAVOrdemServico.EdtCodProKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_f2 then
      BtnConsPro.Click;
end;

procedure TFrmDAVOrdemServico.BtnConsProClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsProd, FrmConsProd);
   FrmConsProd.Tag := 4;
   FrmConsProd.showmodal;
end;

procedure TFrmDAVOrdemServico.FormShow(Sender: TObject);
begin

   LimpaNovaOS;
end;

procedure TFrmDAVOrdemServico.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if bOSAberta then
     begin
        showmessage('OS Aberta');
        CanClose:= false;
     end;
end;

procedure TFrmDAVOrdemServico.FormCreate(Sender: TObject);
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

procedure TFrmDAVOrdemServico.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      begin
         key:= #0;
         SelectNext(ActiveControl, true, true);
      end;
end;

procedure TFrmDAVOrdemServico.BtnGravaClick(Sender: TObject);
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

  if trim(EdtCodVend.Text) = '' then
     begin
        showmessage('Digite o Código do Vendedor');
        EdtCodVend.SetFocus;
        exit;
     end;

  if IBTROS.Active then
     IBTROS.Commit;
  IBTROS.StartTransaction;
  try
    try
      with IBSQLOS do
         begin
            close;
            sql.Clear;
            if bGravaItem then
               begin
                  sql.Add('INSERT INTO ITENS_ORDEM_SERVICO (CODIGO, ORDEM, COD_PRO,     ' +
                          'DESCONTO, COD_EMP, COD_VEND, QUANT, VALOR, PRODUTO_PROMOCAO, ' +
                          'CANCELADO) ' +
                          'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, :9, 0)');
               end
            else
               begin
                  sql.Add('UPDATE ITENS_ORDEM_SERVICO SET COD_PRO = :3, DESCONTO = :4, ' +
                          'COD_EMP = :5, COD_VEND = :6, QUANT = :7, VALOR = :8,        ' +
                          'PRODUTO_PROMOCAO = :9 WHERE CODIGO = :1 AND ORDEM = :2');
               end;

            Parambyname('1').AsInteger  := strtoint(EdtCodigoOS.Text);
            Parambyname('2').AsInteger  := iOrdem;
            Parambyname('3').AsInteger  := strtoint(EdtCodPro.text);
            Parambyname('4').AsCurrency := StrToCurr(EdtDescVr.text);
            Parambyname('5').AsInteger  := iEmp;
            Parambyname('6').AsInteger  := strtoint(EdtCodVend.Text);
            Parambyname('7').AsCurrency := StrToCurr(EdtQuant.text);
            Parambyname('8').AsCurrency := StrToCurr(EdtValorUnit.Text);
            if bPromocao then
               Parambyname('9').AsString:= 'S'
            else
               Parambyname('9').AsString:= 'N';
            ExecOrOpen;
         end;
      IBTROS.Commit;
    except
      IBTROS.Rollback;
      showmessage('Erro ao Gravar o Item');
      EdtCodPro.SetFocus;
    end
  finally
     bGravaItem:= true;
     IBSQLOS.Close;
     LimpaItens;
     BuscaItens;
     edtcodpro.SetFocus;
  end;
end;

procedure TFrmDAVOrdemServico.BtnCancelarClick(Sender: TObject);
var iOrdemCancelar : integer;
begin
   if Application.MessageBox('Confirma o Cancelamento do Item?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin
        iOrdemCancelar:= QBuscaItensORDEM.AsInteger;
        if IBTROS.Active then
           IBTROS.Commit;
        IBTROS.StartTransaction;
        try
          try
            with IBSQLOS do
               begin
                  close;
                  sql.Clear;
                  sql.Add('UPDATE ITENS_ORDEM_SERVICO ' +
                          'SET CANCELADO = 1 ' +
                          'WHERE CODIGO = :1 AND ORDEM = :2');
                  Parambyname('1').AsInteger := strtoint(EdtCodigoOS.text);
                  Parambyname('2').AsInteger := iOrdemCancelar;
                  ExecOrOpen;
               end;
            IBTROS.Commit;
          except
            IBTROS.Rollback;
            showmessage('Erro ao Cancelar o Item');
          end;
        finally
          bGravaItem:= true;
          IBSQLOS.Close;
          LimpaItens;
          BuscaItens;
          EdtCodPro.SetFocus;
        end;
     end;
end;

procedure TFrmDAVOrdemServico.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if QBuscaItensCANCELADO.AsInteger = 1 then
      begin
         DBGrid1.Canvas.Font.Color:= clRed;
         Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
      end;
end;

procedure TFrmDAVOrdemServico.DBGrid1DblClick(Sender: TObject);
begin
   if QBuscaItensCANCELADO.AsInteger = 0 then
     begin
        bGravaItem         := false;
        edtcodpro.Text     := QBuscaItensCOD_PRO.AsString;
        edtnomepro.Text    := QBuscaItensNOME_PRO.AsString;
        EdtCodVend.Text    := QBuscaItensCOD_VEND.AsString;
        EdtNomeVend.Text   := QBuscaItensNOME_VEND.AsString;
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

procedure TFrmDAVOrdemServico.BtnFecharClick(Sender: TObject);
begin
   ToolBar1.SetFocus;

   if not (cTotalOS > 0) then
      begin
         showmessage('Ordem de Serviço sem itens');
         exit;
      end;

   if iECF < 99 then
      ImprimeECF
   else
      iCOO:= 0;

  { atualiza A OS }
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   try
     try
       with dm.QConsultaServer do
          begin
             close;
             sql.Clear;
             sql.add('UPDATE ORDEM_SERVICO ' +
                     'SET TOTAL = :TOTAL, COO = :COO, COD_CAI = :CAIXA ' +
                     'WHERE CODIGO = :COD ');
             Parambyname('cod').AsInteger    := strtoint(EdtCodigoOS.Text);
             Parambyname('total').AsCurrency := cTotalOS;
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
       showmessage('Erro ao atualizar a OS');
     end;
   finally
     dm.QConsultaServer.Close;
   end;

  LimpaNovaOS;
end;

procedure TFrmDAVOrdemServico.QBuscaItensCalcFields(DataSet: TDataSet);
begin
   QBuscaItensCALC_TOTAL.AsCurrency:= ((QBuscaItensQUANT.AsCurrency * QBuscaItensVALOR.AsCurrency) - QBuscaItensDESCONTO.AsCurrency);
end;

procedure TFrmDAVOrdemServico.ImprimeECF;
var cAuxTotal : currency;
    sAuxCNPJ  : string;
    sIndice   : string;
begin
   cAuxTotal:= 0;

   { busca o CNPJ/CPF do cliente }
   sAuxCNPJ:= dm.RetornaStringTabela('cnpj_cli', 'cliente', 'cod_cli', strtoint(EdtCodcli.Text));
   sIndice := trim(dm.IndiceRelGerencial('OS'));

   {Imprime o Cabeçalho}
   AbreRelatoroGerencial(iECF, sIndice);
   ImprimeRelatorioGerencial(iECF, 'DOCUMENTO AUXILIAR DE VENDA - ORDEM DE SERVIÇO');
   ImprimeRelatorioGerencial(iECF, ' ');
   ImprimeRelatorioGerencial(iECF, 'Número..: ' + EdtSequencia.Text);
   ImprimeRelatorioGerencial(iECF, 'Cliente.: ' + trim(EdtNomecli.Text));
   ImprimeRelatorioGerencial(iECF, 'CNPJ/CFP: ' + trim(sAuxCNPJ));
   ImprimeRelatorioGerencial(iECF, 'Forma...: ' + trim(EdtNomeTPV.Text));
   ImprimeRelatorioGerencial(iECF, '------------------------------------------------');
   ImprimeRelatorioGerencial(iECF, 'Marca  : ' + trim(EdtNomeMarca.Text));
   ImprimeRelatorioGerencial(iECF, 'Modelo : ' + trim(EdtNomeModelo.Text));
   ImprimeRelatorioGerencial(iECF, 'Ano Fab: ' + trim(EdtAnoFabricacao.Text) + '    Placa: ' + EdtPlaca.Text);
   ImprimeRelatorioGerencial(iECF, 'Renavam: ' + trim(EdtRenavam.Text));

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

   { verifica se tem dav anteriores }
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   with dm.QConsultaServer do
      begin
         close;
         sql.Clear;
         sql.Text:= 'SELECT * ' +
                    'FROM ORDEM_SERVICO_ANTERIOR ' +
                    'WHERE CODIGO = :CODIGO';
         Parambyname('codigo').AsInteger:= strtoint(EdtCodigoOS.text);
         open;
         if not (fieldbyname('codigo').IsNull) then
            ImprimeRelatorioGerencial(iECF, 'DAV-OS ANTERIORES');
         while not eof do
            begin
               ImprimeRelatorioGerencial(iECF, 'Número..: ' + FormataStringD(fieldbyname('sequencia_dav').AsString, '10', '0'));
               next;
            end;
      end;
   dm.IBTRServer.Commit;
   dm.QConsultaServer.Close;

   ImprimeRelatorioGerencial(iECF, ' ');
   ImprimeRelatorioGerencial(iECF, 'NÃO É VÁLIDO COMO RECIBO');
   ImprimeRelatorioGerencial(iECF, 'E COMO GARANTIA DE MERCADORIA ');
   ImprimeRelatorioGerencial(iECF, 'NÃO COMPROVA PAGAMENTO');

   ImprimeRelatorioGerencial(iECF, ' ');
   ImprimeRelatorioGerencial(iECF, '----É VEDADA A AUTENTICAÇÃO DESTE DOCUMENTO----');

   { Fecha o Relatório Gerencial }
   FechaRelatorioGerencial(iECF);
end;

procedure TFrmDAVOrdemServico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
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
        if not bOSAberta then
           begin
              showmessage('Primeiro gravar o cabeçalho da OS');
              exit;
           end
        else
           begin
              PanelJuntarOS.Visible:= true;
              EdtNumeroOS.Clear;
              EdtNumeroOS.SetFocus;
           end;
     end
   else

  if key = vk_escape then
     begin
        if PanelJuntarOS.Visible then
           begin
              EdtCodPro.SetFocus;
              PanelJuntarOS.Visible:= false;
           end;
     end
  else

  if key = vk_f10 then
     begin
        Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
        FrmMenuFiscal.showmodal;
     end;
end;

procedure TFrmDAVOrdemServico.BtnOKClick(Sender: TObject);
begin
   if trim(EdtNumeroOS.Text) = '' then
      begin
         showmessage('Digite o Número da OS');
         EdtNumeroOS.SetFocus;
         exit;
         abort;
      end;

   if strtoint(trim(EdtSequencia.Text)) = strtoint(trim(EdtNumeroOS.Text)) then
      begin
         showmessage('Verifique o Número da OS');
         EdtNumeroOS.SetFocus;
         exit;
         abort;
      end;

   { busca os dados da OS antiga }
   iOLDCodOS:= BuscaOrdemServico(trim(EdtNumeroOS.Text));

   if iOLDCodOS > 0 then
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
                              'FROM ITENS_ORDEM_SERVICO ' +
                              'WHERE CODIGO = :CODIGO';
                   Parambyname('codigo').AsInteger:= iOLDCodOS;
                   open;
                   if IBTROS.Active then
                      IBTROS.Commit;
                   IBTROS.StartTransaction;

                   while not eof do
                      begin
                         IBSQLOS.Close;
                         IBSQLOS.sql.Clear;
                         IBSQLOS.sql.Add('INSERT INTO ITENS_ORDEM_SERVICO (CODIGO, ORDEM, COD_PRO,     ' +
                                         'DESCONTO, COD_EMP, COD_VEND, QUANT, VALOR, PRODUTO_PROMOCAO, ' +
                                         'CANCELADO) ' +
                                         'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, :9, :10)');

                         IBSQLOS.Parambyname('1').AsInteger  := strtoint(EdtCodigoOS.Text);
                         IBSQLOS.Parambyname('2').AsInteger  := iOrdem;
                         IBSQLOS.Parambyname('3').AsInteger  := fieldbyname('cod_pro').AsInteger;
                         IBSQLOS.Parambyname('4').AsCurrency := fieldbyname('desconto').AsCurrency;
                         IBSQLOS.Parambyname('5').AsInteger  := iEmp;
                         IBSQLOS.ParamByName('6').AsInteger  := fieldbyname('cod_vend').AsInteger;
                         IBSQLOS.Parambyname('7').AsCurrency := fieldbyname('quant').AsCurrency;
                         IBSQLOS.Parambyname('8').AsCurrency := fieldbyname('valor').AsCurrency;
                         IBSQLOS.Parambyname('9').AsString   := fieldbyname('produto_promocao').AsString;
                         IBSQLOS.Parambyname('10').AsInteger := fieldbyname('cancelado').AsInteger;
                         IBSQLOS.ExecOrOpen;
                         inc(iOrdem);
                         next;
                      end;
                   IBTROS.Commit;
                   IBSQLOS.Close;
                end;
             dm.IBTRServer.Commit;
           except
             dm.IBTRServer.Rollback;
             showmessage('Erro ao buscar os itens da OS');
           end;
         finally
           dm.QConsultaServer.Close;
         end;

         { grava na tabela ordem_servico_anterior }
         if dm.IBTRServer.Active then
            dm.IBTRServer.Commit;
         dm.IBTRServer.StartTransaction;
         try
           try
             with dm.QConsultaServer do
                begin
                   close;
                   sql.Clear;
                   sql.Text:= 'SELECT * FROM ORDEM_SERVICO_ANTERIOR ' +
                              'WHERE CODIGO = :CODIGO';
                   parambyname('codigo').AsInteger:= iOLDCodOS;
                   open;
                   while not eof do
                      begin
                         if IBTROS.Active then
                            IBTROS.Commit;
                         IBTROS.StartTransaction;

                         IBSQLOS.Close;
                         IBSQLOS.SQL.Clear;
                         IBSQLOS.SQL.Text:= 'INSERT INTO ORDEM_SERVICO_ANTERIOR (CODIGO, SEQUENCIA_DAV) ' +
                                            'VALUES(:COD, :SEQ)';
                         IBSQLOS.parambyname('cod').AsInteger:= strtoint(EdtCodigoOS.Text);
                         IBSQLOS.parambyname('seq').AsInteger:= fieldbyname('sequencia_dav').AsInteger;
                         IBSQLOS.ExecOrOpen;
                         IBTROS.Commit;
                         IBSQLOS.Close;
                         next;
                      end;
                end;
             dm.IBTRServer.Commit;
           except
             dm.IBTRServer.Rollback;
             showmessage('Erro ao gravar na tabela ordem_servico_anterior');
           end;
         finally
           dm.QConsultaServer.Close;
         end;

         { grava na tabela ordem_servico_anterior }
         if dm.IBTRServer.Active then
            dm.IBTRServer.Commit;
         dm.IBTRServer.StartTransaction;
         try
           try
             with dm.QConsultaServer do
                begin
                   close;
                   sql.Clear;
                   sql.Text:= 'INSERT INTO ORDEM_SERVICO_ANTERIOR (CODIGO, SEQUENCIA_DAV) ' +
                              'VALUES(:COD, :SEQ)';
                   parambyname('cod').AsInteger:= strtoint(EdtCodigoOS.Text);
                   parambyname('seq').AsInteger:= strtoint(EdtNumeroOS.Text);
                   ExecOrOpen;
                end;
             dm.IBTRServer.Commit;
           except
             dm.IBTRServer.Rollback;
             showmessage('Erro ao gravar na tabela ordem_servico_anterior');
           end;
         finally
           dm.QConsultaServer.Close;
         end;

         { marcando os com transferida }
         if dm.IBTRServer.Active then
            dm.IBTRServer.Commit;
         dm.IBTRServer.StartTransaction;
         try
           try
             with dm.QConsultaServer do
                begin
                   close;
                   sql.Clear;
                   sql.Text:= 'UPDATE ORDEM_SERVICO SET FLAG_TRANSFERIDA = 1 ' +
                              'WHERE CODIGO = :COD';
                   parambyname('cod').AsInteger:= iOLDCodOS;
                   ExecOrOpen;
                end;
             dm.IBTRServer.Commit;
           except
             dm.IBTRServer.Rollback;
             showmessage('Erro ao atualizar a OS');
           end;
         finally
           dm.QConsultaServer.Close;
         end;

         BuscaItens;
         edtcodpro.SetFocus;
         PanelJuntarOS.Visible:= false;
      end
   else
      begin
         showmessage('OS não encontrada');
         EdtNumeroOS.SetFocus;
      end;
end;

function TFrmDAVOrdemServico.BuscaOrdemServico(const sNumero : string) : integer;
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
                        'FROM ORDEM_SERVICO ' +
                        'WHERE SEQUENCIA_DAV = :SEQ AND DATA_FECHAMENTO IS NULL  ' +
                        'AND FLAG_TRANSFERIDA = 0';
             Parambyname('seq').AsString:= sNumero;
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

procedure TFrmDAVOrdemServico.BtnSairClick(Sender: TObject);
begin
   close;
end;

end.
