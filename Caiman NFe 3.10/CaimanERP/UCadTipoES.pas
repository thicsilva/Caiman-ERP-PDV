unit UCadTipoES;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, ImgList, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Buttons, 
  UNovosComponentes, UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, 
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White, 
  dxSkinsdxStatusBarPainter, acAlphaImageList, dxStatusBar, 
  dxSkinMetropolisDark, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton, Data.DB;

type
  TFrmCadTipoES = class(TFrmCadastroNovo)
    Label1: TLabel;
    cod_es: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    RdgTipo: TRadioGroup;
    IBSQLES: TFDQuery;
    IBTRES: TFDTransaction;
    GroupBox1: TGroupBox;
    EdtCFOPEstadoTrib: UNovosComponentes.TEdit;
    BtnConsCFOPEstadoTrib: TsSpeedButton;
    BtnAddCFOPEstadoTrib: TsSpeedButton;
    EdtNomeCFOPEstadoTrib: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EdtCFOPEstadoSub: UNovosComponentes.TEdit;
    BtnConsCFOPEstadoSub: TsSpeedButton;
    BtnAddCFOPEstadoSub: TsSpeedButton;
    EdtNomeCFOPEstadoSub: TEdit;
    GroupBox2: TGroupBox;
    BtnConsCFOPForaTrib: TsSpeedButton;
    BtnAddCFOPForaTrib: TsSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    BtnConsCFOPForaSub: TsSpeedButton;
    BtnAddCFOPForaSub: TsSpeedButton;
    EdtCFOPForaTrib: UNovosComponentes.TEdit;
    EdtNomeCFOPForaTrib: TEdit;
    EdtCFOPForaSub: UNovosComponentes.TEdit;
    EdtNomeCFOPForaSub: TEdit;
    RdgPreco: TRadioGroup;
    GroupBox3: TGroupBox;
    EdtCodGRP: UNovosComponentes.TEdit;
    BtnConsGrupoICMS: TsSpeedButton;
    EdtNomeGRP: TEdit;
    GroupBox4: TGroupBox;
    BtnConsLocal: TsSpeedButton;
    EdtCodLocal: UNovosComponentes.TEdit;
    EdtNomeLocal: TEdit;
    CheckEstoque: TCheckBox;
    CheckCusto: TCheckBox;
    procedure Botoes(acao : string);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure EdtCFOPEstadoTribEnter(Sender: TObject);
    procedure EdtCFOPEstadoSubEnter(Sender: TObject);
    procedure EdtCFOPForaTribEnter(Sender: TObject);
    procedure EdtCFOPForaSubEnter(Sender: TObject);
    procedure BtnConsCFOPEstadoTribClick(Sender: TObject);
    procedure BtnConsCFOPEstadoSubClick(Sender: TObject);
    procedure BtnConsCFOPForaTribClick(Sender: TObject);
    procedure BtnConsCFOPForaSubClick(Sender: TObject);
    procedure BtnAddCFOPEstadoTribClick(Sender: TObject);
    procedure EdtCFOPEstadoTribExit(Sender: TObject);
    procedure EdtCFOPEstadoSubExit(Sender: TObject);
    procedure EdtCFOPForaTribExit(Sender: TObject);
    procedure EdtCFOPForaSubExit(Sender: TObject);
    procedure EdtCFOPEstadoTribKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCFOPEstadoSubKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCFOPForaTribKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCFOPForaSubKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCFOPEstadoTribKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodGRPEnter(Sender: TObject);
    procedure EdtCodGRPExit(Sender: TObject);
    procedure EdtCodGRPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsGrupoICMSClick(Sender: TObject);
    procedure EdtCodLocalEnter(Sender: TObject);
    procedure EdtCodLocalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodLocalExit(Sender: TObject);
    procedure BtnConsLocalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmCadTipoES: TFrmCadTipoES;

implementation
uses
  Udm, Ubibli1, UConsTipoES, UConsCFOP, UCadCFOP, UConsGRP, UConsLocaisEstoque, 
  UNovoPrincipal, UPrincipal;
var  bGrava : boolean;

{$R *.dfm}

function FrmCadTipoES: TFrmCadTipoES;
begin
   Result := TFrmCadTipoES( BuscaFormulario( TFrmCadTipoES, False ) );
end;

procedure TFrmCadTipoES.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadTipoES, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadTipoES);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadTipoES);
         EDedit(FrmCadTipoES, false);
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

procedure TFrmCadTipoES.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('C021','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             RdgTipo.ItemIndex := 0;
             RdgPreco.ItemIndex:= 0;
//             edtnome.SetFocus;
           end;
     end
  else
     if tag = 1 then
        begin 
           Botoes('G');
           EdtCFOPEstadoTribExit(self);
           EdtCFOPEstadoSubExit(self);
           EdtCFOPForaTribExit(self);
           EdtCFOPForaSubExit(self);
           EdtCodGRPExit(self);
           EdtCodLocalExit(self);
        end;
end;

procedure TFrmCadTipoES.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  if not DM.Acesso('C021','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  RdgTipo.ItemIndex  := 0;
  RdgPreco.ItemIndex := 0;
  edtnome.SetFocus;
end;

procedure TFrmCadTipoES.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadTipoES.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C021','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmCadTipoES.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRES.Active then
     IBTRES.Commit;
  IBSQLES.Close;
  Action:= caFree;
end;

procedure TFrmCadTipoES.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('C021','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if edtnome.Text = '' then
     begin 
        AlertaCad('Digite o Nome do Tipo de Entrada/Saída');
////        edtnome.SetFocus;
        exit;
     end;
  if IBTRES.Active then
     IBTRES.Commit;
  IBTRES.StartTransaction;
  try
    try
      with IBSQLES do
        begin 
           close;
           sql.Clear;
           if bGrava then
              begin 
                 cod_es.Text:= inttostr(prxcod('tipo_es', 'cod_es', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO TIPO_ES(COD_ES, NOME_ES, TIPO_ES, CFOP_ESTADO_TRIBUTADO,    ' +
                         'CFOP_ESTADO_SUBSTITUICAO, CFOP_FORA_TRIBUTADO, CFOP_FORA_SUBSTITUICAO,  ' +
                         'TIPO_PRECO, COD_GRP_ESPECIFICO, CODIGO_LOCAL_ESTOQUE, CONTROLA_ESTOQUE, ' +
                         'ATUALIZA_CUSTO_ENTRADAS) ' +
                         'VALUES(:CODES, :NOMEES, :TIPOES, :CFOPESTTRIB, :CFOPESTSUB, :CFOPFORATRIB, ' +
                         ':CFOPFORASUB, :TPPRECO, :CODGRP, :LOCAL, :CONTESTOQUE, :CUSTO)');
              end
           else
              begin 
                 sql.Add('UPDATE TIPO_ES SET NOME_ES = :NOMEES, TIPO_ES = :TIPOES, CFOP_ESTADO_TRIBUTADO = ' +
                         ':CFOPESTTRIB, CFOP_ESTADO_SUBSTITUICAO = :CFOPESTSUB, CFOP_FORA_TRIBUTADO =  ' +
                         ':CFOPFORATRIB, CFOP_FORA_SUBSTITUICAO = :CFOPFORASUB, TIPO_PRECO = :TPPRECO, ' +
                         'COD_GRP_ESPECIFICO = :CODGRP, CODIGO_LOCAL_ESTOQUE = :LOCAL,                 ' +
                         'CONTROLA_ESTOQUE = :CONTESTOQUE, ATUALIZA_CUSTO_ENTRADAS = :CUSTO WHERE COD_ES = :CODES');
              end;
           Parambyname('codes').AsInteger       := strtoint(cod_es.Text);
           Parambyname('nomees').AsString       := edtnome.Text;
           Parambyname('tipoes').AsString       := copy(RdgTipo.Items[RdgTipo.itemIndex], 0, 1);
           Parambyname('tppreco').AsString      := copy(RdgPreco.Items[RdgPreco.itemIndex], 0, 1);

           if trim(EdtCFOPEstadoTrib.Text) = '' then
              Parambyname('cfopesttrib').Value     := null
           else
              Parambyname('cfopesttrib').AsInteger := strtoint(EdtCFOPEstadoTrib.Text);

           if trim(EdtCFOPEstadoSub.Text) = '' then
              Parambyname('cfopestsub').Value      := null
           else
              Parambyname('cfopestsub').AsInteger  := strtoint(EdtCFOPEstadoSub.Text);

           if trim(EdtCFOPForaTrib.Text) = '' then
              Parambyname('cfopforatrib').Value    := null
           else
              Parambyname('cfopforatrib').AsInteger:= strtoint(EdtCFOPForaTrib.Text);

           if trim(EdtCFOPForaSub.Text) = '' then
              Parambyname('cfopforasub').Value      := null
           else
              Parambyname('cfopforasub').AsInteger := strtoint(EdtCFOPForaSub.Text);

           if trim(EdtCodGRP.Text) = '' then
              Parambyname('codgrp').Value := null
           else
              Parambyname('codgrp').AsInteger:= strtoint(EdtCodGRP.Text);

           Parambyname('local').AsInteger    := strtoint(EdtCodLocal.Text);

           if CheckEstoque.Checked then
              parambyname('contestoque').AsString:= 'S'
           else
              parambyname('contestoque').AsString:= 'N';

           if CheckCusto.Checked then
              parambyname('custo').AsString:= 'S'
           else
              parambyname('custo').AsString:= 'N';

           ExecOrOpen;
        end;
      IBTRES.Commit;
      Botoes('G');
    except
      IBTRES.Rollback;
      AlertaCad('Erro ao Gravar a Conta');
    end;
  finally
    IBSQLES.Close;
  end;
end;

procedure TFrmCadTipoES.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C021','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadTipoES, 'tipo_es', cod_es, IBSQLES, IBTRES);
  Botoes('E');
end;

procedure TFrmCadTipoES.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsTipoES, FrmConsTipoES);
  FrmConsTipoES.tag:= 0;
  FrmConsTipoES.showmodal;
end;

procedure TFrmCadTipoES.EdtCFOPEstadoTribEnter(Sender: TObject);
begin 
  inherited;
  EdtCFOPEstadoTrib.SelectAll;
end;

procedure TFrmCadTipoES.EdtCFOPEstadoSubEnter(Sender: TObject);
begin 
  inherited;
  EdtCFOPEstadoSub.SelectAll;
end;

procedure TFrmCadTipoES.EdtCFOPForaTribEnter(Sender: TObject);
begin 
  inherited;
  EdtCFOPForaTrib.SelectAll;
end;

procedure TFrmCadTipoES.EdtCFOPForaSubEnter(Sender: TObject);
begin 
  inherited;
  EdtCFOPForaSub.SelectAll;
end;

procedure TFrmCadTipoES.BtnConsCFOPEstadoTribClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCFOP, FrmConsCFOP);
  FrmConsCFOP.Tag:= 21;
  FrmConsCFOP.ShowModal;
end;

procedure TFrmCadTipoES.BtnConsCFOPEstadoSubClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCFOP, FrmConsCFOP);
  FrmConsCFOP.Tag:= 22;
  FrmConsCFOP.ShowModal;
end;

procedure TFrmCadTipoES.BtnConsCFOPForaTribClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCFOP, FrmConsCFOP);
  FrmConsCFOP.Tag:= 23;
  FrmConsCFOP.ShowModal;
end;

procedure TFrmCadTipoES.BtnConsCFOPForaSubClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCFOP, FrmConsCFOP);
  FrmConsCFOP.Tag:= 24;
  FrmConsCFOP.ShowModal;
end;

procedure TFrmCadTipoES.BtnAddCFOPEstadoTribClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadCFOP, True );
end;

procedure TFrmCadTipoES.EdtCFOPEstadoTribExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;

  if trim(EdtCFOPEstadoTrib.Text) = '' then
     begin 
        EdtNomeCFOPEstadoTrib.Clear;
        exit;
     end;

  EdtNomeCFOPEstadoTrib.Text:= consulta('cfop', EdtCFOPEstadoTrib, 'cod_cfo', 'nome_cfo', dm.IBTransaction, dm.qConsulta);
  if EdtNomeCFOPEstadoTrib.Text = '' then
     begin 
        AlertaCad('CFOP não Cadastrado');
////        EdtCFOPEstadoTrib.SetFocus;
     end;
end;

procedure TFrmCadTipoES.EdtCFOPEstadoSubExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;

  if trim(EdtCFOPEstadoSub.Text) = '' then
     begin 
        EdtNomeCFOPEstadoSub.Clear;
        exit;
     end;

  EdtNomeCFOPEstadoSub.Text:= consulta('cfop', EdtCFOPEstadoSub, 'cod_cfo', 'nome_cfo', dm.IBTransaction, dm.qConsulta);
  if EdtNomeCFOPEstadoSub.Text = '' then
     begin 
        AlertaCad('CFOP não Cadastrado');
////        EdtCFOPEstadoSub.SetFocus;
     end;
end;

procedure TFrmCadTipoES.EdtCFOPForaTribExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;

  if trim(EdtCFOPForaTrib.Text) = '' then
     begin 
        EdtNomeCFOPForaTrib.Clear;
        exit;
     end;

  EdtNomeCFOPForaTrib.Text:= consulta('cfop', EdtCFOPForaTrib, 'cod_cfo', 'nome_cfo', dm.IBTransaction, dm.qConsulta);
  if EdtNomeCFOPForaTrib.Text = '' then
     begin 
        AlertaCad('CFOP não Cadastrado');
////        EdtCFOPForaTrib.SetFocus;
     end;
end;

procedure TFrmCadTipoES.EdtCFOPForaSubExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;

  if trim(EdtCFOPForaSub.Text) = '' then
     begin 
        EdtNomeCFOPForaSub.Clear;
        exit;
     end;

  EdtNomeCFOPForaSub.Text:= consulta('cfop', EdtCFOPForaSub, 'cod_cfo', 'nome_cfo', dm.IBTransaction, dm.qConsulta);
  if EdtNomeCFOPForaSub.Text = '' then
     begin 
        AlertaCad('CFOP não Cadastrado');
////        EdtCFOPForaSub.SetFocus;
     end;
end;

procedure TFrmCadTipoES.EdtCFOPEstadoTribKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsCFOPEstadoTrib.Click
  else
     if key = vk_f2 then
        BtnAddCFOPEstadoTrib.Click;
end;

procedure TFrmCadTipoES.EdtCFOPEstadoSubKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsCFOPEstadoSub.Click
  else
     if key = vk_f2 then
        BtnAddCFOPEstadoSub.Click;
end;

procedure TFrmCadTipoES.EdtCFOPForaTribKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsCFOPForaTrib.Click
  else
     if key = vk_f2 then
        BtnAddCFOPForaTrib.Click;
end;

procedure TFrmCadTipoES.EdtCFOPForaSubKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsCFOPForaSub.Click
  else
     if key = vk_f2 then
        BtnAddCFOPForaSub.Click;
end;

procedure TFrmCadTipoES.EdtCFOPEstadoTribKeyPress(Sender: TObject;
  var Key: Char);
begin 
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmCadTipoES.EdtCodGRPEnter(Sender: TObject);
begin 
  inherited;
  EdtCodGRP.SelectAll;
end;

procedure TFrmCadTipoES.EdtCodGRPExit(Sender: TObject);
begin 
  inherited;
  if trim(EdtCodGRP.Text) = '' then
     begin 
        EdtNomeGRP.Clear;
        exit;
     end;

  EdtNomeGRP.Text:= consulta('grupo_icms', EdtCodGRP, 'cod_grp', 'nome_grp', dm.IBTransaction, dm.qConsulta);
  if trim(EdtNomeGRP.Text) = '' then
     begin 
        AlertaCad('Grupo de ICMS não Cadastrado');
////        EdtCodGRP.SetFocus;
     end;
end;

procedure TFrmCadTipoES.EdtCodGRPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsGrupoICMS.Click;
end;

procedure TFrmCadTipoES.BtnConsGrupoICMSClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsGRP, FrmConsGRP);
  FrmConsGRP.Tag:= 18;
  FrmConsGRP.ShowModal;
end;

procedure TFrmCadTipoES.EdtCodLocalEnter(Sender: TObject);
begin 
  inherited;
  EdtCodLocal.SelectAll;
end;

procedure TFrmCadTipoES.EdtCodLocalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if Key = vk_f3 then
     BtnConsLocal.Click;
end;

procedure TFrmCadTipoES.EdtCodLocalExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;

  EdtNomeLocal.Text:= consulta('locais_estoque', EdtCodLocal, 'codigo', 'descricao', dm.IBTransaction, dm.qConsulta);
  if trim(EdtNomeLocal.Text) = '' then
     begin 
        AlertaCad('Local de Estoque não Cadastrado');
////        EdtCodLocal.SetFocus;
     end;
end;

procedure TFrmCadTipoES.BtnConsLocalClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsLocaisEstoque, FrmConsLocaisEstoque);
  FrmConsLocaisEstoque.Tag:= 1;
  FrmConsLocaisEstoque.ShowModal;
end;

end.
