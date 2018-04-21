unit UConsCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, 
  rxPlacemnt, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmConsCli = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GBCons: TGroupBox;
    ComboCons: TComboBox;
    GB2: TGroupBox;
    EdtCons: TEdit;
    edtcod: UNovosComponentes.TEdit;
    BtnCons: TsSpeedButton;
    EdtNome: TEdit;
    BtnOk: TButton;
    BtnSair: TButton;
    DBGrid: TDBGrid;
    BtnLocalizar: TButton;
    QDias: TFDQuery;
    QDiasVENC: TDateField;
    QConsCliente: TFDQuery;
    DSQConsCliente: TDataSource;
    QDiasDIAS: TFloatField;
    RdgAtivo: TRadioGroup;
    QConsClienteCOD_CLI: TIntegerField;
    QConsClienteFJ_CLI: TStringField;
    QConsClienteNOME_CLI: TStringField;
    QConsClienteCOD_CLA: TIntegerField;
    QConsClienteENDRES_CLI: TStringField;
    QConsClienteBAIRES_CLI: TStringField;
    QConsClienteCIDRES_CLI: TStringField;
    QConsClienteESTRES_CLI: TStringField;
    QConsClienteCEPRES_CLI: TStringField;
    QConsClienteTELRES_CLI: TStringField;
    QConsClienteENDCOM_CLI: TStringField;
    QConsClienteBAICOM_CLI: TStringField;
    QConsClienteCIDCOM_CLI: TStringField;
    QConsClienteESTCOM_CLI: TStringField;
    QConsClienteCEPCOM_CLI: TStringField;
    QConsClienteTELCOM_CLI: TStringField;
    QConsClienteCNPJ_CLI: TStringField;
    QConsClienteDOC_CLI: TStringField;
    QConsClientePAI_CLI: TStringField;
    QConsClienteMAE_CLI: TStringField;
    QConsClienteCONJUGE_CLI: TStringField;
    QConsClienteESTCIVIL_CLI: TStringField;
    QConsClienteRENDA_CLI: TBCDField;
    QConsClienteLIMITE_CLI: TBCDField;
    QConsClientePROFISSAO_CLI: TStringField;
    QConsClienteEMPRESA_TRAB_CLI: TStringField;
    QConsClienteATIVO_CLI: TStringField;
    QConsClienteCOD_CON: TIntegerField;
    QConsClienteOBS_VENDA: TStringField;
    QConsClienteOBS_CLI: TStringField;
    QConsClienteNASCIMENTO_CLI: TDateField;
    QConsClienteDATACADASTRO_CLI: TDateField;
    QConsClienteATRAZO_MAXIMO_CLI: TIntegerField;
    QConsClienteCELULAR_CLI: TStringField;
    QConsClienteIMP_SALDO_PENDENTE_CLI: TStringField;
    QConsClienteLIMITE_CHEQUE: TBCDField;
    QConsClienteDATA_CONSULTA_SPC: TDateField;
    QConsClienteDATA_REGISTRO_SPC: TDateField;
    QConsClienteDATA_REABILITACAO_SPC: TDateField;
    QConsClienteSELECIONADO_CLI: TStringField;
    QConsClienteRENDA_CONJUGE: TBCDField;
    QConsClienteTRABALHO_CONJUGE: TStringField;
    QConsClientePROF_CONJUGE: TStringField;
    QConsClienteNOME_FANTASIA: TStringField;
    QConsClientePONTO_REFERENCIA: TStringField;
    QConsClienteCONTATO_CLI: TStringField;
    QConsClienteROTA_CLI: TIntegerField;
    QConsClienteTIPO_CREDITO_CLI: TStringField;
    QConsClienteCONTROLAR_LIMITE: TStringField;
    QConsClienteBAICOB_CLI: TStringField;
    QConsClienteCIDCOB_CLI: TStringField;
    QConsClienteESTCOB_CLI: TStringField;
    QConsClienteCEPCOB_CLI: TStringField;
    QConsClienteTELCOB_CLI: TStringField;
    QConsClienteENDCOB_CLI: TStringField;
    QConsClienteBLOQUEADO_CLI: TStringField;
    QConsClienteNOME_CON: TStringField;
    QConsClienteNOME_CLA: TStringField;
    QConsClienteCALC_SITUACAO: TStringField;
    RdgTipo: TRadioGroup;
    QConsClienteINSC_ESTADUAL: TStringField;
    QConsClienteNUMRES_CLI: TStringField;
    QConsClienteNUMCOM_CLI: TStringField;
    QConsClienteNUMCOB_CLI: TStringField;
    QConsClienteCODIGO_IBGE: TIntegerField;
    QConsClienteEMAIL_CLI: TStringField;
    QConsClienteCOD_DEPENDENTE: TIntegerField;
    QConsClienteNOME_DEPENDENTE: TStringField;
    QConsClienteGRAU_PARENTESCO: TStringField;
    Shape1: TShape;
    Label1: TLabel;
    QConsClienteCOD_VENDEDOR: TIntegerField;
    QAux: TFDQuery;
    IBTRAux: TFDTransaction;
    procedure ComboConsChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtcodKeyPress(Sender: TObject; var Key: Char);
    procedure edtcodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcodExit(Sender: TObject);
    procedure BtnConsClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcodEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QConsClienteCalcFields(DataSet: TDataSet);
    procedure QDiasCalcFields(DataSet: TDataSet);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    _Cli : Integer;
    { Public declarations }
  end;

var
  FrmConsCli: TFrmConsCli;

implementation
uses
  Udm, Ubibli1, UCadCli, UConsConvenio, UConsClassifCliente, UCadCheque, 
  UConsCheque, UDeposito, UContasReceber, UConsLancReceber, UConfiguracoes, 
  UContasRecRec, UConsContasRec, UVenda, UConsVendas, UProdutoCliente, 
  URelExtratoCliente, URelVendas, UOutrasSaidas, UConsOutrasSaidas, 
  URelOutrasSaidas, UNotaFiscal, UConsNotaFiscal, UFichaCliente, UMalaSel, 
  URelCTR, URelEnvelope, URelChequeAberto, ULancCTRAdm, UConsCTRADM, UMMA_OS, 
  UTRelProdutoCliente, UselIntervaloProduto, UCadTabPreco, UNovoPrincipal,
  UfechaVendaParcelas, UOS;
var  sSql  : string;
     iDias : integer;

{$R *.dfm}

procedure TFrmConsCli.ComboConsChange(Sender: TObject);
begin 
   case combocons.ItemIndex of
      0: begin 
            gb2.Caption      := 'Código';
            edtnome.Visible  := false;
            edtcod.Visible   := false;
            btncons.Visible  := false;
            edtcons.Visible  := true;
            edtcons.Clear;
         end;
      1: begin 
            gb2.Caption      := 'Nome';
            edtnome.Visible  := false;
            edtcod.Visible   := false;
            btncons.Visible  := false;
            edtcons.Visible  := true;
            edtcons.Clear;
         end;
      2: begin 
            gb2.Caption      := 'Convênio';
            edtnome.Visible  := true;
            edtcod.Visible   := true;
            btncons.Visible  := true;
            edtcons.Visible  := false;
            edtnome.Clear;
            edtcod.Clear;
         end;
      3: begin 
            gb2.Caption      := 'Classificação';
            edtnome.Visible  := true;
            edtcod.Visible   := true;
            btncons.Visible  := true;
            edtcons.Visible  := false;
            edtnome.Clear;
            edtcod.Clear;
         end;
      4: begin 
            gb2.Caption      := '';
            edtnome.Visible  := false;
            edtcod.Visible   := false;
            btncons.Visible  := false;
            edtcons.Visible  := false;
         end;
      5: begin 
            gb2.Caption      := 'Palavra Chave';
            edtnome.Visible  := false;
            edtcod.Visible   := false;
            btncons.Visible  := false;
            edtcons.Visible  := true;
            edtcons.Clear;
         end;
      6: begin 
            gb2.Caption      := 'Cidade';
            edtnome.Visible  := false;
            edtcod.Visible   := false;
            btncons.Visible  := false;
            edtcons.Visible  := true;
            edtcons.Clear;
         end;
      7: begin 
            gb2.Caption      := 'CNPJ/CPF';
            edtnome.Visible  := false;
            edtcod.Visible   := false;
            btncons.Visible  := false;
            edtcons.Visible  := true;
            edtcons.Clear;
         end;
   end;
end;

procedure TFrmConsCli.FormShow(Sender: TObject);
begin 
   sSql:= QConsCliente.SQL.Text;

   {busca a posicao do combo}
   try
     ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsCli.ComboCons'));
   except
     ComboCons.ItemIndex:= 0;
   end;
   ComboConsChange(self);
end;

procedure TFrmConsCli.edtcodKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmConsCli.edtcodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      btncons.Click;
end;

procedure TFrmConsCli.edtcodExit(Sender: TObject);
begin 
   if btnsair.Focused then
      exit;
   case combocons.ItemIndex of
    2:begin 
         edtnome.Text:= consulta('convenio', edtcod, 'cod_con', 'nome_con', dm.IBTransaction, dm.qConsulta);
         if edtnome.Text = '' then
            begin 
               AlertaCad('Convênio não Cadastrado');
//               edtcod.setfocus;
            end;
      end;
    3:begin 
         edtnome.Text:= consulta('classif_cliente', edtcod, 'cod_cla', 'nome_cla', dm.IBTransaction, dm.qConsulta);
         if edtnome.Text = '' then
            begin 
               AlertaCad('Classificação não Cadastrada');
//               edtcod.setfocus;
            end;
      end;
   end;
end;

procedure TFrmConsCli.BtnConsClick(Sender: TObject);
begin 
   case combocons.ItemIndex of
    2:begin 
         Application.CreateForm(TFrmConsConvenio, FrmConsConvenio);
         FrmConsConvenio.tag:= 3;
         FrmConsConvenio.ShowModal;
      end;
    3:begin 
         Application.CreateForm(TFrmConsClassifCliente, FrmConsClassifCliente);
         FrmConsClassifCliente.tag:= 2;
         FrmConsClassifCliente.ShowModal;
      end;
   end;
end;

procedure TFrmConsCli.BtnOkClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsCliente do
      begin 
         close;
         sql.Clear;
         sql.Text:= sSql;
         case ComboCons.ItemIndex of
            0: begin 
                  if trim(edtcons.Text) = '' then
                     begin 
                        if RdgAtivo.ItemIndex = 0 then
                           sql.add(' WHERE C.ATIVO_CLI = ' + #39 + 'S' + #39)
                        else
                           if RdgAtivo.ItemIndex = 1 then
                              sql.add(' WHERE C.ATIVO_CLI = ' + #39 + 'N' + #39);
                        case RdgTipo.ItemIndex of
                          0: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'PR' + #39);
                          1: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'CH' + #39);
                        end;
                        sql.Add(' ORDER BY C.COD_CLI');
                     end
                  else
                     begin 
                        sql.Add(' WHERE C.COD_CLI = ' + edtcons.Text);
                        if RdgAtivo.ItemIndex = 0 then
                           sql.add(' AND C.ATIVO_CLI = ' + #39 + 'S' + #39)
                        else
                           if RdgAtivo.ItemIndex = 1 then
                              sql.add(' AND C.ATIVO_CLI = ' + #39 + 'N' + #39);
                        case RdgTipo.ItemIndex of
                          0: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'PR' + #39);
                          1: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'CH' + #39);
                        end;
                     end;
               end;
            1: begin 
                  sql.Add(' WHERE C.NOME_CLI LIKE ' + #39 + edtcons.Text + '%' + #39);
                  if RdgAtivo.ItemIndex = 0 then
                     sql.add(' AND C.ATIVO_CLI = ' + #39 + 'S' + #39)
                  else
                     if RdgAtivo.ItemIndex = 1 then
                        sql.add(' AND C.ATIVO_CLI = ' + #39 + 'N' + #39);
                  case RdgTipo.ItemIndex of
                    0: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'PR' + #39);
                    1: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'CH' + #39);
                  end;
                  sql.add(' ORDER BY C.NOME_CLI');
               end;
            2: begin 
                  sql.Add(' WHERE C.COD_CON = ' + edtcod.Text);
                  if RdgAtivo.ItemIndex = 0 then
                     sql.add(' AND C.ATIVO_CLI = ' + #39 + 'S' + #39)
                  else
                     if RdgAtivo.ItemIndex = 1 then
                        sql.add(' AND C.ATIVO_CLI = ' + #39 + 'N' + #39);
                  case RdgTipo.ItemIndex of
                    0: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'PR' + #39);
                    1: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'CH' + #39);
                  end;
                  sql.add(' ORDER BY C.NOME_CLI');
               end;
            3: begin 
                  sql.Add(' WHERE C.COD_CLA = ' + edtcod.Text);
                  if RdgAtivo.ItemIndex = 0 then
                     sql.add(' AND C.ATIVO_CLI = ' + #39 + 'S' + #39)
                  else
                     if RdgAtivo.ItemIndex = 1 then
                        sql.add(' AND C.ATIVO_CLI = ' + #39 + 'N' + #39);
                  case RdgTipo.ItemIndex of
                    0: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'PR' + #39);
                    1: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'CH' + #39);
                  end;
                  sql.add(' ORDER BY C.NOME_CLI');
               end;
            4: begin 
                  sql.Add(' WHERE C.BLOQUEADO_CLI = ' + #39 + 'S' + #39);
                  if RdgAtivo.ItemIndex = 0 then
                     sql.add(' AND C.ATIVO_CLI = ' + #39 + 'S' + #39)
                  else
                     if RdgAtivo.ItemIndex = 1 then
                        sql.add(' AND C.ATIVO_CLI = ' + #39 + 'N' + #39);
                  case RdgTipo.ItemIndex of
                    0: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'PR' + #39);
                    1: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'CH' + #39);
                  end;
                  sql.Add(' ORDER BY C.NOME_CLI');
               end;
            5: begin 
                  sql.Add(' WHERE C.NOME_CLI LIKE ' + #39 + '%' + edtcons.Text + '%' + #39);
                  if RdgAtivo.ItemIndex = 0 then
                     sql.add(' AND C.ATIVO_CLI = ' + #39 + 'S' + #39)
                  else
                     if RdgAtivo.ItemIndex = 1 then
                        sql.add(' AND C.ATIVO_CLI = ' + #39 + 'N' + #39);
                  case RdgTipo.ItemIndex of
                    0: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'PR' + #39);
                    1: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'CH' + #39);
                  end;
                  sql.add(' ORDER BY C.NOME_CLI');
               end;
            6: begin 
                  sql.Add(' WHERE C.CIDRES_CLI LIKE ' + #39 + edtcons.Text + '%' + #39);
                  if RdgAtivo.ItemIndex = 0 then
                     sql.add(' AND C.ATIVO_CLI = ' + #39 + 'S' + #39)
                  else
                     if RdgAtivo.ItemIndex = 1 then
                        sql.add(' AND C.ATIVO_CLI = ' + #39 + 'N' + #39);
                  case RdgTipo.ItemIndex of
                    0: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'PR' + #39);
                    1: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'CH' + #39);
                  end;
                  sql.add(' ORDER BY C.NOME_CLI');
               end;
            7: begin 
                  sql.add(' WHERE C.CNPJ_CLI = ' + #39 + FormataCNPJ(trim(EdtCons.Text)) + #39);
                  if RdgAtivo.ItemIndex = 0 then
                     sql.add(' AND C.ATIVO_CLI = ' + #39 + 'S' + #39)
                  else
                     if RdgAtivo.ItemIndex = 1 then
                        sql.add(' AND C.ATIVO_CLI = ' + #39 + 'N' + #39);
                  case RdgTipo.ItemIndex of
                    0: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'PR' + #39);
                    1: sql.add(' AND C.TIPO_CREDITO_CLI = ' + #39 + 'CH' + #39);
                  end;
                  sql.add(' ORDER BY C.NOME_CLI');
               end;
         end;
         open;
         dbgrid.SetFocus;
      end;
   dm.IBTransaction.CommitRetaining;
end;

procedure TFrmConsCli.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsCli.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      begin 
         btnsair.SetFocus;
         close;
      end;
end;

procedure TFrmConsCli.BtnLocalizarClick(Sender: TObject);
var i : integer;
begin 
   case tag of
    0,9: begin 
            BuscaFormulario( TFrmCadCli, True );
            with FrmCadCli do
               begin 
                  tag:= 1;
                  limpaedit(FrmCadCli);
                  ededit(FrmCadCli, false);
                  cod_cli.Text:= QConsClienteCOD_CLI.AsString;
                  edtCodVend.Text := QConsClienteCOD_VENDEDOR.AsString;
                  if edtCodVend.Text <> '' then
                      edtVend.Text := consulta('vendedor', edtCodVend, 'cod_vend',
                          'nome_vend', IBTRAux, QAux);
                  if trim(QConsClienteFJ_CLI.AsString) = 'F' then
                     begin 
                        ComboFJ.ItemIndex    := 0;
                        label11.Caption      := 'CPF';
                        label12.Caption      := 'Documento';
                        edtcnpj.EditMask     := '999.999.999-99;1;_';
                        label2.Caption       := 'Nome(*)';
                        label43.Caption      := 'Apelido';
                        edtprof.Enabled      := true;
                        edtemp.Enabled       := true;
                        edtpai.Enabled       := true;
                        edtmae.Enabled       := true;
                        edtrenda.Enabled     := true;
                        EdtContato.Visible   := false;
                        label45.Visible      := false;
                        EdtFant.Width        := 473;
                     end
                  else
                     begin 
                        ComboFJ.ItemIndex    := 1;
                        label11.Caption      := 'CNPJ';
                        label12.Caption      := 'Insc.Estadual';
                        edtcnpj.EditMask     := '99.999.999/9999-99;1;_';
                        label2.Caption       := 'Razão Social(*)';
                        label43.Caption      := 'Nome Fantasia';
                        EdtNasc.Enabled      := false;
                        edtprof.Enabled      := false;
                        edtemp.Enabled       := false;
                        edtpai.Enabled       := false;
                        edtmae.Enabled       := false;
                        edtrenda.Enabled     := false;
                        EdtContato.Visible   := true;
                        label45.Visible      := true;
                        EdtFant.Width        := 233;
                     end;
                  edtnome.Text          := QConsClienteNOME_CLI.AsString;
                  cod_cla.Text          := QConsClienteCOD_CLA.AsString;
                  edtnomecla.Text       := QConsClienteNOME_CLA.AsString;
                  edtendres.Text        := QConsClienteENDRES_CLI.AsString;
                  edtbaires.Text        := QConsClienteBAIRES_CLI.AsString;
                  edtcidres.Text        := QConsClienteCIDRES_CLI.AsString;
                  for i:= 0 to 26 do
                     begin 
                        if comboestres.Items[i] = QConsClienteESTRES_CLI.AsString then
                           comboestres.ItemIndex:= i;
                     end;
                  edtcepres.Text        := QConsClienteCEPRES_CLI.AsString;
                  edttelres.Text        := QConsClienteTELRES_CLI.AsString;
                  edtendcom.Text        := QConsClienteENDCOM_CLI.AsString;
                  edtbaicom.Text        := QConsClienteBAICOM_CLI.AsString;
                  edtcidcom.Text        := QConsClienteCIDCOM_CLI.AsString;
                  for i:= 0 to 26 do
                     begin 
                        if comboestcom.Items[i] = QConsClienteESTCOM_CLI.AsString then
                           comboestcom.ItemIndex:= i;
                     end;
                  edtcepcom.Text        := QConsClienteCEPCOM_CLI.AsString;
                  edttelcom.Text        := QConsClienteTELCOM_CLI.AsString;
                  edtcnpj.Text          := QConsClienteCNPJ_CLI.AsString;

                  if trim(QConsClienteFJ_CLI.AsString) = 'F' then
                     edtdoc.Text:= QConsClienteDOC_CLI.AsString
                  else
                     EdtDoc.Text:= QConsClienteINSC_ESTADUAL.AsString;

                  edtpai.Text           := QConsClientePAI_CLI.AsString;
                  edtmae.Text           := QConsClienteMAE_CLI.AsString;
                  edtconjuge.Text       := QConsClienteCONJUGE_CLI.AsString;
                  if trim(QConsClienteESTCIVIL_CLI.AsString) = 'C' then
                     ComboCivil.ItemIndex := 0
                  else
                     if trim(QConsClienteESTCIVIL_CLI.AsString) = 'S' then
                        ComboCivil.ItemIndex:= 1
                     else
                        if trim(QConsClienteESTCIVIL_CLI.AsString) = 'O' then
                           ComboCivil.ItemIndex := 2
                        else
                           combocivil.ItemIndex:= -1;
                  edtrenda.Text         := QConsClienteRENDA_CLI.AsString;
                  EdtLimiteCredito.Text := QConsClienteLIMITE_CLI.AsString;
                  EdtLimiteCheque.Text  := QConsClienteLIMITE_CHEQUE.AsString;
                  edtprof.Text          := QConsClientePROFISSAO_CLI.AsString;
                  edtemp.Text           := QConsClienteEMPRESA_TRAB_CLI.AsString;
                  if trim(QConsClienteATIVO_CLI.AsString) = 'S' then
                     RDGAtivo.ItemIndex := 0
                  else
                     RDGAtivo.ItemIndex := 1;

                  EdtCodConvenio.Text   := QConsClienteCOD_CON.AsString;
                  EdtNomeConvenio.Text  := QConsClienteNOME_CON.AsString;

                  MemoObsVenda.Text     := QConsClienteOBS_VENDA.AsString;
                  MemoObsDiversos.Text  := QConsClienteOBS_CLI.AsString;
                  edtnasc.Text          := QConsClienteNASCIMENTO_CLI.AsString;
                  edtdatacadastro.Date  := QConsClienteDATACADASTRO_CLI.Value;
                  EdtAtrazoMaximo.Text  := QConsClienteATRAZO_MAXIMO_CLI.AsString;
                  edtcel.Text           := QConsClienteCELULAR_CLI.AsString;
                  if trim(QConsClienteIMP_SALDO_PENDENTE_CLI.AsString) = 'S' then
                     CheckImpSaldo.Checked:= true
                  else
                     CheckImpSaldo.Checked:= false;

                  if trim(QConsClienteTIPO_CREDITO_CLI.AsString) = 'DN' then
                     ComboCredito.ItemIndex:= 0
                  else
                  if trim(QConsClienteTIPO_CREDITO_CLI.AsString) = 'PR' then
                     ComboCredito.ItemIndex:= 1
                  else
                  if trim(QConsClienteTIPO_CREDITO_CLI.AsString) = 'CH' then
                     ComboCredito.ItemIndex:= 2
                  else
                  if trim(QConsClienteTIPO_CREDITO_CLI.AsString) = 'PC' then
                     ComboCredito.ItemIndex:= 3
                  else
                  if trim(QConsClienteTIPO_CREDITO_CLI.AsString) = 'BO' then
                     ComboCredito.ItemIndex:= 4
                  else
                     ComboCredito.ItemIndex:= -1;

                  EdtConsSPC.Text     := QConsClienteDATA_CONSULTA_SPC.AsString;
                  EdtRegSPC.Text      := QConsClienteDATA_REGISTRO_SPC.AsString;
                  EdtReabSPC.text     := QConsClienteDATA_REABILITACAO_SPC.AsString;
                  EdtRendaConj.Text   := QConsClienteRENDA_CONJUGE.AsString;
                  EdtTrabalhoConj.Text:= QConsClienteTRABALHO_CONJUGE.AsString;
                  EdtProfConj.Text    := QConsClientePROF_CONJUGE.AsString;
                  EdtFant.Text        := QConsClienteNOME_FANTASIA.AsString;
                  EdtPR.Text          := QConsClientePONTO_REFERENCIA.AsString;
                  EdtContato.Text     := QConsClienteCONTATO_CLI.AsString;
                  if trim(QConsClienteCONTROLAR_LIMITE.AsString) = 'S' then
                     CheckControlarLimite.Checked:= true
                  else
                     CheckControlarLimite.Checked:= false;
                  EdtEndCob.Text      := QConsClienteENDCOB_CLI.AsString;
                  EdtBaiCob.Text      := QConsClienteBAICOB_CLI.AsString;
                  EdtCidCob.Text      := QConsClienteCIDCOB_CLI.AsString;

                  for i:= 0 to 26 do
                     begin 
                        if ComboEstCob.Items[i] = QConsClienteESTCOB_CLI.AsString then
                           ComboEstCob.ItemIndex:= i;
                     end;
                  EdtCepCob.Text      := QConsClienteCEPCOB_CLI.AsString;
                  EdtTelCob.Text      := QConsClienteTELCOB_CLI.AsString;
                  if trim(QConsClienteBLOQUEADO_CLI.AsString) = 'S' then
                     RdgBloqueado.ItemIndex := 0
                  else
                     RdgBloqueado.ItemIndex := 1;

                  EdtIBGE.Text    := QConsClienteCODIGO_IBGE.AsString;
                  EdtNumRes.Text  := QConsClienteNUMRES_CLI.AsString;
                  EdtNumCom.Text  := QConsClienteNUMCOM_CLI.AsString;
                  EdtNumCob.Text  := QConsClienteNUMCOB_CLI.AsString;
                  EdtEmail.Text   := QConsClienteEMAIL_CLI.AsString;
                  cod_dependente.Text  := QConsClienteCOD_DEPENDENTE.AsString;
                  nome_dependente.Text := QConsClienteNOME_DEPENDENTE.AsString;
                  grau_parentesco.Text  := QConsClienteGRAU_PARENTESCO.AsString;

                  FormShow(sender);
                  show;
               end;
            close;
         end;
    1: begin 
          with FrmCadCheque do
             begin 
                if (trim(QConsClienteTIPO_CREDITO_CLI.AsString) = 'CH') or (trim(QConsClienteTIPO_CREDITO_CLI.AsString) = 'PC') then
                   begin 
                      EdtCodCliente.Text := QConsClienteCOD_CLI.AsString;
                      edtnomecli.Text    := QConsClienteNOME_CLI.AsString;
                      EdtCodEmitente.SetFocus;
                   end
                else
                   begin 
                      AlertaCad('Cliente não tem como tipo de crédito CHEQUE/TODOS');
                      exit;
                   end;
             end;
          close;
       end;
    2: begin 
          with FrmConsCheque do
             begin 
                edtcod.Text   := QConsClienteCOD_CLI.AsString;
                edtnome.Text  := QConsClienteNOME_CLI.AsString;
                btnok.SetFocus;
             end;
         close;
       end;
    3: begin 
          with FrmDeposito do
             begin 
                edtcodcli.Text    := QConsClienteCOD_CLI.AsString;
                edtnomecli.Text   := QConsClienteNOME_CLI.AsString;
                btnok.SetFocus;
             end;
          close;
       end;
    4: begin 
          with FrmLancContasReceber do
             begin 
                edtcodcli.Text   := QConsClienteCOD_CLI.AsString;
                edtnomecli.Text  := QConsClienteNOME_CLI.AsString;
                lcon.caption     := QConsClienteNOME_CON.AsString;
             end;
          close;
       end;
    5: begin 
          with FrmConsLancReceber do
             begin 
                edtcodcli.Text := QConsClienteCOD_CLI.AsString;
                edtnomecli.Text:= QConsClienteNOME_CLI.AsString;
                edtdataini.SetFocus;
             end;
          close;
       end;
    6: begin 
          with FrmConfiguracoes do
             begin 
                cod_cli.Text   := QConsClienteCOD_CLI.AsString;
                edtnomecli.Text:= QConsClienteNOME_CLI.AsString;
                EdtCodtpv.SetFocus;
             end;
          close;
       end;
    7: begin 
          with FrmContasRecRec do
             begin 
                edtcodcli.text  := QConsClienteCOD_CLI.AsString;
                edtnomecli.text := QConsClienteNOME_CLI.AsString + ' - ' + QConsClienteTIPO_CREDITO_CLI.AsString;
                EdtCodCli.SetFocus;
             end;
          close;
       end;
    8: begin 
          with FrmConsContasRec do
             begin 
                edtcodcli.Text  := QConsClienteCOD_CLI.AsString;
                edtnomecli.Text := QConsClienteNOME_CLI.AsString;
                btnok.SetFocus;
             end;
          close;
       end;
    10: begin 
           if trim(QConsClienteBLOQUEADO_CLI.AsString) = 'S' then
              begin 
                 AlertaCad('Cliente Bloqueado');
                 exit;
              end;
            with FrmVenda do
              begin 
                 EdtCodcli.Text  := QConsClienteCOD_CLI.AsString;
                 EdtNomecli.Text := QConsClienteNOME_CLI.AsString;
                 LConv.Caption   := QConsClienteNOME_CON.AsString;
                 EdtCodCli.SetFocus;
              end;
           close;
        end;
    11: begin 
           with FrmConsVendas do
              begin 
                 EdtCodCli.Text   := QConsClienteCOD_CLI.AsString;
                 EdtNomeCli.Text  := QConsClienteNOME_CLI.AsString;
                 edtdataini.SetFocus;
              end;
           close;
        end;
    12: begin 
           with FrmProdutoCliente do
              begin 
                 edtcodcli.Text  := QConsClienteCOD_CLI.AsString;
                 EdtNomeCli.Text := QConsClienteNOME_CLI.AsString;
                 edtdataini.setfocus;
              end;
           close;
        end;
    13: begin 
           with FrmRelExtratoCliente do
              begin 
                 edtcod.Text  := QConsClienteCOD_CLI.AsString;
                 edtnome.Text := QConsClienteNOME_CLI.AsString;
                 edtdataini.SetFocus;
              end;
           close;
        end;
    14: begin 
           with FrmRelVendas do
             begin 
                EdtCodCli.Text  := QConsClienteCOD_CLI.AsString;
                edtnomecli.Text := QConsClienteNOME_CLI.AsString;
                BtnVis.SetFocus;
             end;
           close;
        end;
    15: begin 
           with FrmOutrasSaidas do
              begin 
                 EdtCodCli.Text  := QConsClienteCOD_CLI.AsString;
                 edtnomecli.Text := QConsClienteNOME_CLI.AsString;
              end;
           close;
        end;
    16: begin 
           if tag = 16 then
              begin 
                 with FrmConsOutrasSaidas do
                    begin 
                       EdtCodCli.Text  := QConsClienteCOD_CLI.AsString;
                       edtnomecli.Text := QConsClienteNOME_CLI.AsString;
                    end;
                 close;
              end;
        end;
    17: begin 
           with FrmRelOutrasSaidas do
              begin 
                 EdtCodCli.Text  := QConsClienteCOD_CLI.AsString;
                 edtnomecli.Text := QConsClienteNOME_CLI.AsString;
              end;
           close;
         end;
    18: begin 
           with FrmNotaFiscal do
              begin 
                 edtclifor.Text    := QConsClienteCOD_CLI.AsString;
                 EdtNomeCliFor.Text:= QConsClienteNOME_CLI.AsString;
                 EdtCodTPV.SetFocus;
              end;
           close;
         end;
    19: begin 
           with FrmConsNotaFiscal do
              begin 
                 EdtCodCli.Text  := QConsClienteCOD_CLI.AsString;
                 edtnomecli.Text := QConsClienteNOME_CLI.AsString;
              end;
           close;
         end;
    21: begin 
           with FrmFichaCliente do
              begin 
                 EdtCodCli.Text  := QConsClienteCOD_CLI.AsString;
                 edtnomecli.Text := QConsClienteNOME_CLI.AsString;
              end;
           close;
         end;
    25: begin 
           with FrmMalaSel do
              begin 
                 EdtCodCli.Text  := QConsClienteCOD_CLI.AsString;
                 edtnomecli.Text := QConsClienteNOME_CLI.AsString;
                 Btnok.SetFocus;
              end;
           close;
         end;
    28: begin 
           with FrmRelCTR do
              begin 
                 EdtCodCli.Text  := QConsClienteCOD_CLI.AsString;
                 edtnomecli.Text := QConsClienteNOME_CLI.AsString;
              end;
           close;
         end;
    30: begin 
           with FrmRelEnvelope do
              begin 
                 EdtCod.Text  := QConsClienteCOD_CLI.AsString;
                 edtnome.Text := QConsClienteNOME_CLI.AsString;
                 BtnOK.SetFocus;
              end;
           close;
         end;
    39: begin 
           with FrmRelCheque do
              begin 
                 EdtCodCli.Text  := QConsClienteCOD_CLI.AsString;
                 EdtNomeCli.Text := QConsClienteNOME_CLI.AsString;
                 BtnVis.SetFocus;
              end;
           close;
         end;
    40: begin 
           with FrmCadCheque do
              begin 
                 if (trim(QConsClienteTIPO_CREDITO_CLI.AsString) = 'CH') or (trim(QConsClienteTIPO_CREDITO_CLI.AsString) = 'PC') then
                    begin 
                       EdtCodEmitente.Text  := QConsClienteCOD_CLI.AsString;
                       EdtNomeEmitente.Text := QConsClienteNOME_CLI.AsString;
                       EdtCodBanco.SetFocus;
                    end
                 else
                    begin 
                       AlertaCad('Cliente não tem como tipo de crédito CHEQUE/TODOS');
                       exit;
                    end;
              end;
           close;
         end;
    41: begin 
           with FrmLancCTRADM do
              begin 
                 EdtCodCli.Text  := QConsClienteCOD_CLI.AsString;
                 EdtNomeCli.Text := QConsClienteNOME_CLI.AsString;
                 EdtVenc.SetFocus;
              end;
           close;
         end;
    42: begin 
           with FrmConsCTRAdm do
              begin 
                 EdtCod.Text  := QConsClienteCOD_CLI.AsString;
                 EdtNome.Text := QConsClienteNOME_CLI.AsString;
              end;
           close;
         end;
    43: begin 
           with FrmMMA_OS do
              begin 
                 COD_CLIENTE.Text := QConsClienteCOD_CLI.AsString;
                 Cliente.Text := QConsClienteNOME_CLI.AsString;
                 telefone_cliente := QConsClienteTELRES_CLI.AsString;
              end;
           close;
         end;
    44: begin 
           frmCadCli.cod_dependente.Text := QConsClienteCOD_CLI.AsString;
           frmCadCli.nome_dependente.Text := QConsClienteNOME_CLI.AsString;
           close;
        end;
    45: begin 

           Application.CreateForm( TSelIntervaloProduto, SelIntervaloProduto);
           SelIntervaloProduto.COD := QConsClienteCOD_CLI.AsInteger;
           SelIntervaloProduto.Nome := QConsClienteNome_CLI.AsString;
           SelIntervaloProduto.Show;
           Close;
        end;
    46: begin 
           Application.CreateForm( TFrmCadTabPreco, FrmCadTabPreco);
           FrmCadTabPreco.COD_CLIENTE := QConsClienteCOD_CLI.AsInteger;
           FrmCadTabPreco.Cliente := QConsClienteNOME_CLI.AsString;
           FrmCadTabPreco.Show;
           Close;
        end;
     47: begin
            frmFechaVendaParcelas.edtCodCliente.Text := QConsClienteCOD_CLI.AsString;
            frmFechaVendaParcelas.edtDescCliente.Text := QConsClienteNOME_CLI.AsString;
            close;
         end;
     48: begin
            _Cli := QConsClienteCOD_CLI.AsInteger;
            close;
         end;
   end;
end;

procedure TFrmConsCli.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QConsCliente.SQL.Clear;
   QConsCliente.SQL.Text:= sSql;
   QConsCliente.Close;

   {grava a posicao do combo}
   dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsCli.ComboCons', inttostr(ComboCons.itemIndex));

   Action:= caFree;
end;

procedure TFrmConsCli.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      begin 
         if (ComboCons.ItemIndex = 0) or (ComboCons.ItemIndex = 1) then
            EdtCons.SetFocus
         else
            if (combocons.ItemIndex = 2) or (combocons.ItemIndex = 3) then
               edtcod.SetFocus;
      end;
end;

procedure TFrmConsCli.edtcodEnter(Sender: TObject);
begin 
   edtcod.SelectAll; 
end;

procedure TFrmConsCli.FormCreate(Sender: TObject);
begin 
   { BUSCA A QTD DE DIAS P/NEGATIVACAO }
   
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.Consulta do
          begin 
             close;
             sql.Clear;
             sql.Add('SELECT DIAS_NEGATIVACAO ' +
                     'FROM PARAMETROS ' +
                     'WHERE COD_EMP = :CODEMP');
             Parambyname('codemp').AsInteger:= iEmp;
             ExecOrOpen;
             iDias:= fieldbyname('dias_negativacao').AsInteger;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar a qtd de dias p/negativação');
     end;
   finally
     dm.Consulta.Close;
   end;
end;

procedure TFrmConsCli.QConsClienteCalcFields(DataSet: TDataSet);
begin 
   {Localizar a situação e o numero de dias em atraso do cliente}
   With QDias do
     begin 
        Close;
        ParamByName('CODCLI').value:= QConsClienteCOD_CLI.Value;
        Open;

        if QDiasVENC.AsDatetime = 0 then
           begin 
              QConsClienteCALC_SITUACAO.AsString:= 'OK';
               Exit;
           end;
        if (QDiasVENC.value < date) and (QDiasDIAS.Value > iDias) then
           QConsClienteCALC_SITUACAO.AsString:= 'NEGATIVADO'
        else
           if (QDiasVENC.Value >= date) then
              QConsClienteCALC_SITUACAO.AsString:= 'PENDENTE'
           else
              QConsClienteCALC_SITUACAO.AsString:= 'ATRASADO';
     end;
end;

procedure TFrmConsCli.QDiasCalcFields(DataSet: TDataSet);
begin 
   QDiasDIAS.Value := date - QDiasVENC.Value;
end;

procedure TFrmConsCli.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin 
   if trim( QConsClienteCOD_DEPENDENTE.AsString ) <> '' then
      begin 
         DBGrid.Canvas.Brush.Color := $008C8CFF;
         DBGrid.Canvas.Font.Color:= clWhite;
         Dbgrid.DefaultDrawDataCell(Rect, dbgrid.columns[datacol].field, State);
      end;
   if trim(QConsClienteBLOQUEADO_CLI.AsString) = 'S' then
      begin 
         DBGrid.Canvas.Font.Color:= clRed;
         Dbgrid.DefaultDrawDataCell(Rect, dbgrid.columns[datacol].field, State);
      end
   else
      if trim(QConsClienteATIVO_CLI.AsString) = 'N' then
         begin 
            DBGrid.Canvas.Font.Color:= clGreen;
            Dbgrid.DefaultDrawDataCell(Rect, dbgrid.columns[datacol].field, State);
         end
      else
         if trim(QConsClienteTIPO_CREDITO_CLI.AsString) = 'CH' then
            begin 
               DBGrid.Canvas.Font.Color:= clBackground;
               Dbgrid.DefaultDrawDataCell(Rect, dbgrid.columns[datacol].field, State);
            end;
end;

procedure TFrmConsCli.DBGridKeyPress(Sender: TObject; var Key: Char);
begin 
   if key in ['a'..'z', 'A'..'Z'] then
      QConsCliente.Locate('nome_cli', key, [lopartialkey,locaseinsensitive]);
end;

end.
