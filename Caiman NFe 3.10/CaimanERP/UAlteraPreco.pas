unit UAlteraPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, DB, Mask, Buttons, 
  rxPlacemnt, rxToolEdit, rxCurrEdit, UNovosComponentes, UNovoFormulario, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmAlteraPreco = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    QConsProd: TFDQuery;
    DSQConsPro: TDataSource;
    IBTRLocal: TFDTransaction;
    QAux: TFDQuery;
    PanelEstoque: TPanel;
    Label1: TLabel;
    EdtEstMin: TCurrencyEdit;
    BtnConfirma: TButton;
    BtnCancela: TButton;
    DBGrid: TDBGrid;
    QConsProdCODPRO: TIntegerField;
    QConsProdNOMEPRO: TStringField;
    QConsProdATIVO: TStringField;
    QConsProdVALOR: TBCDField;
    QConsProdPROMOCAO: TBCDField;
    QConsProdMARGEMLUCRO: TBCDField;
    QConsProdCODSEC: TIntegerField;
    QConsProdCODGRUPO: TIntegerField;
    QConsProdSUBGRUPO: TIntegerField;
    QConsProdDIASVALIDADE: TIntegerField;
    QConsProdISENTOPIS: TStringField;
    QConsProdPIS: TBCDField;
    QConsProdCOFINS: TBCDField;
    QConsProdIR: TBCDField;
    QConsProdCSLL: TBCDField;
    QConsProdDESPESAS: TBCDField;
    QConsProdPRECOPROGRAMADO: TBCDField;
    QConsProdCREDITOICMS: TBCDField;
    QConsProdNOMEALIQUOTA: TStringField;
    QConsProdALIQUOTAGRP: TBCDField;
    QConsProdPERCLUCROLIQ: TBCDField;
    QConsProdNOMESECAO: TStringField;
    QConsProdNOMEGRUPO: TStringField;
    QConsProdNOMESUBGRUPO: TStringField;
    QConsProdESTOQUE: TBCDField;
    QConsProdESTOQUEMIN: TBCDField;
    QConsProdPRECOCUSTO: TBCDField;
    QConsProdCALC_PIS_COFINS: TStringField;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    ComboCons: TComboBox;
    RdgAtivo: TRadioGroup;
    GB2: TGroupBox;
    BtnConsSub: TsSpeedButton;
    BtnConsGrupo: TsSpeedButton;
    BtnCons: TsSpeedButton;
    EdtCons: TEdit;
    EdtCodGrupo: UNovosComponentes.TEdit;
    EdtCodSub: UNovosComponentes.TEdit;
    EdtNomeGrupo: TEdit;
    EdtNomeSub: TEdit;
    EdtCod: UNovosComponentes.TEdit;
    EdtNome: TEdit;
    BtnOk: TButton;
    BtnSair: TButton;
    QConsProdPRECOPRAZO: TBCDField;
    QConsProdUNIDADE: TStringField;
    QConsProdPRECOPROGRAMADOPRAZO: TBCDField;
    QConsProdNOMESETORESTOQUE: TStringField;
    QConsProdDATAVALIDADE: TDateField;
    QConsProdCODIGOSETORESTOQUE: TIntegerField;
    procedure ComboConsChange(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEnter(Sender: TObject);
    procedure DBGridExit(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnCancelaClick(Sender: TObject);
    procedure BtnConfirmaClick(Sender: TObject);
    procedure ComboConsKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodGrupoEnter(Sender: TObject);
    procedure EdtCodGrupoExit(Sender: TObject);
    procedure EdtCodGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodGrupoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodSubEnter(Sender: TObject);
    procedure EdtCodSubExit(Sender: TObject);
    procedure EdtCodSubKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsGrupoClick(Sender: TObject);
    procedure BtnConsSubClick(Sender: TObject);
    procedure EdtCodEnter(Sender: TObject);
    procedure EdtCodExit(Sender: TObject);
    procedure EdtCodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure QConsProdCalcFields(DataSet: TDataSet);
    procedure AtivaDesativa;
  private
    { Private declarations }
  public
    { Public declarations }
  end;                                 

  var
  FrmAlteraPreco: TFrmAlteraPreco;
  iAuxCodPro    : integer;

implementation
uses
  Udm, Ubibli1, UAltPreco, UUltimaCompra, UAlterarSecaoGrupo, 
  UProdutosComposicao, UAlterarGRP, UConsGrupo, UConsSubGrupo, UConsSecao, 
  UConsLab, UConsGRP, UFormacaoPreco, UConsSetorEstoque, UNovoPrincipal;

{$R *.dfm}

procedure TFrmAlteraPreco.AtivaDesativa;
var iAux : integer;
begin 
   { VERIFICA SE TEM ALGUM SELECIONADO }
   iAux:= 0;
   if not (QConsProd.State = dsBrowse) then
      exit;
   iAuxCodPro:= QConsProdCODPRO.AsInteger;
   with QConsProd do
      begin 
         DisableControls;
         First;
         while not eof do
           begin 
              if DBGrid.SelectedRows.CurrentRowSelected then
                 begin 
                    iAux:= 1;
                    Break;
                 end;
              next;
           end;
         First;
         EnableControls;
      end;

   if not (iAux > 0) then
      begin 
         AlertaCad('Nenhum produto selecionado');
         exit;
      end;

   if Application.MessageBox('Deseja Ativar/Desativar o(s) Produto(s)?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         QConsProd.DisableControls;
         QConsProd.First;
         while not QConsProd.Eof do
            begin 
               if FrmAlteraPreco.DBGrid.SelectedRows.CurrentRowSelected then
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
                               if trim(QConsProdATIVO.AsString) = 'S' then
                                  sql.Add('UPDATE PRODUTO SET ATIVO_PRO = ' + #39 + 'N' + #39 + ', ' +
                                          'VALOR_PRO = 0, PROMOCAO_PRO = 0 ' +
                                          'WHERE COD_PRO = :CODPRO')
                               else
                                  sql.add('UPDATE PRODUTO SET ATIVO_PRO = ' + #39 + 'S' + #39 +
                                          ' WHERE COD_PRO = :CODPRO');
                               Parambyname('codpro').AsInteger:= QConsProdCODPRO.AsInteger;
                               ExecOrOpen;
                            end;
                         dm.IBTransaction.Commit;
                       except
                         dm.IBTransaction.Rollback;
                         AlertaCad('Erro ao atualizar o produto');
                       end;
                     finally
                       dm.QConsulta.Close;
                     end;
                  end;
               QConsProd.Next;
            end;
         QConsProd.EnableControls;
         BtnOk.Click;
      end;
end;

procedure TFrmAlteraPreco.ComboConsChange(Sender: TObject);
begin 
   gb2.Caption:= 'Digite o Item Desejado';
   edtcons.Clear;
   EdtCod.Clear;
   EdtNome.Clear;
   EdtCodGrupo.Clear;
   EdtNomeGrupo.Clear;
   EdtCodSub.Clear;
   EdtNomeSub.Clear;

   case combocons.ItemIndex of
    0,1,2,3:   begin 
                  gb2.Caption     := 'Digite o Item Desejado';
                  GB2.Height      := 49;

                  RdgAtivo.Width  := 689;
                  RdgAtivo.Height := 33;

                  EdtCod.Visible  := false;
                  BtnCons.Visible := false;
                  EdtNome.Visible := false;

                  EdtCodGrupo.Visible  := false;
                  BtnConsGrupo.Visible := false;
                  EdtNomeGrupo.Visible := false;

                  EdtCodSub.Visible  := false;
                  BtnConsSub.Visible := false;
                  EdtNomeSub.Visible := false;

                  EdtCons.Visible:= true;
               end;
    4: begin 
          gb2.Caption     := 'Seção/Grupo/Sub-Grupo';
          GB2.Height      := 93;

          RdgAtivo.Width  := 249;
          RdgAtivo.Height := 41;

          EdtCod.Visible  := true;
          BtnCons.Visible := true;
          EdtNome.Visible := true;

          EdtCodGrupo.Visible  := true;
          BtnConsGrupo.Visible := true;
          EdtNomeGrupo.Visible := true;

          EdtCodSub.Visible  := true;
          BtnConsSub.Visible := true;
          EdtNomeSub.Visible := true;

          EdtCons.Visible:= false;
       end;
    5,6,7:begin 
           gb2.Caption          := 'Digite o Item Desejado';
           GB2.Height           := 49;

           RdgAtivo.Width       := 689;
           RdgAtivo.Height      := 33;

           EdtCons.Visible      := false;
           EdtCod.Visible       := true;
           BtnCons.Visible      := true;
           EdtNome.Visible      := true;

           EdtCodGrupo.Visible  := false;
           BtnConsGrupo.Visible := false;
           EdtNomeGrupo.Visible := false;

           EdtCodSub.Visible    := false;
           BtnConsSub.Visible   := false;
           EdtNomeSub.Visible   := false;
        end;
   end;
end;

procedure TFrmAlteraPreco.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmAlteraPreco.BtnOkClick(Sender: TObject);
var sScript : string;
begin 
   sScript:=  'SELECT P.COD_PRO, P.ATIVO_PRO, P.NOME_PRO, P.COD_SEC, P.COD_GRUPO, P.SUB_GRUPO, P.CODIGO_SETOR_ESTOQUE, P.VALOR_PRO, ' +
              'P.PROMOCAO_PRO, P.ESTOQUE_MINIMO_PRO, P.PRECO_PROGRAMADO, P.PRECO_PROGRAMADO_PRAZO, P.DIAS_VALIDADE_PRO, P.CREDITO_ICMS,  ' +
              'P.ALIQUOTA_PIS, P.ALIQUOTA_COFINS, P.ALIQUOTA_IR, P.ALIQUOTA_CSLL, P.ALIQUOTA_OUTRAS, P.ISENTO_PIS_COFINS_PRO, ' +
              'P.PRECO_CUSTO, P.MARGEM_LUCRO_PRO, P.PRECO_PRAZO_PRO, P.DATA_VALIDADE, S.NOME_SEC, G.NOME_GRP, G.ALIQUOTA_GRP, SG.DESCRICAO, SGS.DESCRICAO, ' +
              'U.DESCRICAO, SE.DESCRICAO ' +
              'FROM PRODUTO P ' +
              'INNER JOIN SECAO S ' +
              'ON (P.COD_SEC = S.COD_SEC) ' +
              'INNER JOIN GRUPO_ICMS G ' +
              'ON (P.ICMS_CF_EST = G.COD_GRP) ' +
              'INNER JOIN UNIDADE_MEDIDA U ' +
              'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO) ' +
              'INNER JOIN SETORES_ESTOQUE SE ' +
              'ON (P.CODIGO_SETOR_ESTOQUE = SE.CODIGO) ' +
              'LEFT OUTER JOIN SECAO_GRUPO SG ' +
              'ON (P.COD_SEC = SG.COD_SEC AND P.COD_GRUPO = SG.COD_GRUPO) ' +
              'LEFT OUTER JOIN SECAO_GRUPO_SUBGRUPO SGS ' +
              'ON (P.COD_SEC = SGS.COD_SEC AND P.COD_GRUPO = SGS.COD_GRUPO AND P.SUB_GRUPO = SGS.COD_SUBGRUPO) ';


   case combocons.ItemIndex of
    0: sScript:= sScript + ' WHERE P.NOME_PRO LIKE ' + #39 + '%' + edtcons.Text + '%' + #39;

    1: sScript:= sScript + ' WHERE P.NOME_PRO LIKE ' + #39 + edtcons.Text + '%' + #39;

    2: sScript:= sScript + ' WHERE P.CODIGO_BARRA_PRO = ' + #39 + trim(edtcons.Text) + #39;

    3:begin 
         if trim(EdtCons.Text) = '' then
            begin 
               AlertaCad('digite o código do produto');
//               edtcons.SetFocus;
               exit;
               abort;
            end;
         sScript:= sScript + ' WHERE P.COD_PRO = ' + trim(EdtCons.Text);
      end;
    4:begin 
         if trim(EdtCodSub.Text) <> '' then
            begin 
               sScript:= sScript + ' WHERE P.COD_SEC = ' + trim(EdtCod.Text) +
                                   ' AND P.COD_GRUPO = ' + trim(EdtCodGrupo.Text) +
                                   ' AND P.SUB_GRUPO = ' + trim(EdtCodSub.Text);
            end
         else
            if trim(EdtCodGrupo.Text) <> '' then
               begin 
                  sScript:= sScript + ' WHERE P.COD_SEC = ' + trim(EdtCod.Text) +
                                      ' AND P.COD_GRUPO = ' + trim(EdtCodGrupo.Text);
               end
            else
               if trim(edtcod.Text) <> '' then
                  sScript:= sScript + ' WHERE P.COD_SEC = ' + trim(EdtCod.Text)
               else
                  begin 
                     AlertaCad('Digite a Seção');
//                     EdtCod.SetFocus;
                     exit;
                  end;
      end;

    5:sScript:= sScript + ' WHERE P.COD_LAB = ' + trim(EdtCod.Text);
    6:sScript:= sScript + ' WHERE P.ICMS_CF_EST = ' + trim(EdtCod.Text);
    7:sScript:= sScript + ' WHERE P.CODIGO_SETOR_ESTOQUE = ' + trim(EdtCod.Text);
   end;

   case RdgAtivo.ItemIndex of
    0: sScript:= sScript + ' AND P.ATIVO_PRO = ' + #39 + 'S' + #39;
    1: sScript:= sScript + ' AND P.ATIVO_PRO = ' + #39 + 'N' + #39;
   end;
   sScript:= sScript + ' ORDER BY P.NOME_PRO';

   if IBTRLocal.Active then
      IBTRLocal.Commit;
   IBTRLocal.StartTransaction;
   with QConsProd do
      begin 
         close;
         sql.Clear;
         sql.Text:= 'SELECT * ' +
                    'FROM SP_CONSUTA_PRODUTO (:SCRIPT, :DATAINI, :DATAFIN, :CODEMP)';

         Parambyname('script').AsString  := sScript;
         Parambyname('dataini').AsDate   := date - 30;
         Parambyname('datafin').AsDate   := date;
         Parambyname('codemp').AsInteger := iEmp;
         open;
         if not (fieldbyname('codpro').IsNull) then
            begin 
               dbgrid.SetFocus;
               QConsProd.Locate('CODPRO', iAuxCodPro, []);
               iAuxCodPro:= 0;
            end
         else
            begin 
               if EdtCons.Visible then
                  edtcons.SetFocus
               else
                  edtcod.SetFocus;
            end;
      end;
end;

procedure TFrmAlteraPreco.FormShow(Sender: TObject);
begin 
   {busca a posicao do combo}
   try
     ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmAlteraPreco.ComboCons'));
   except
     ComboCons.ItemIndex:= 0;
   end;

   ComboConsChange(self);
   ComboCons.SetFocus;
end;

procedure TFrmAlteraPreco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      begin 
         if PanelEstoque.Visible then
            begin 
               DBGrid.SetFocus;
               PanelEstoque.Visible:= false;
            end
         else
            close;
      end;
end;

procedure TFrmAlteraPreco.DBGridDblClick(Sender: TObject);
begin 
   iAuxCodPro:= QConsProdCODPRO.AsInteger;
   if iTipoEmp = 0 then
      begin 
         Application.CreateForm(TFrmAltPreco, FrmAltPreco);
         with FrmAltPreco do
            begin 
               LProduto.Caption    := QConsProdCODPRO.AsString + ' - ' + QConsProdNOMEPRO.AsString;
               edtvalor.Text       := QConsProdVALOR.AsString;
               edtpromocao.Text    := QConsProdPROMOCAO.AsString;
               EdtProgramado.Text  := QConsProdPRECOPROGRAMADO.AsString;
               EdtCusto.Text       := QConsProdPRECOCUSTO.AsString;
               showmodal;
            end;
      end
   else
      begin 
         Application.CreateForm(TFrmFormacaoPreco, FrmFormacaoPreco);
         FrmFormacaoPreco.EdtCodProd.Text  := QConsProdCODPRO.AsString;
         FrmFormacaoPreco.EdtNomeProd.Text := QConsProdNOMEPRO.AsString;
         FrmFormacaoPreco.Tag:= 1;
         FrmFormacaoPreco.ShowModal;
      end;
end;

procedure TFrmAlteraPreco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if IBTRLocal.Active then
      IBTRLocal.Commit;
   QConsProd.Close;

   {grava a posicao do combo}
   dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmAlteraPreco.ComboCons', inttostr(ComboCons.itemIndex));

   Action:= caFree;
end;

procedure TFrmAlteraPreco.DBGridKeyPress(Sender: TObject; var Key: Char);
begin 
   if key = #13 then
      DBGridDblClick(sender);
end;

procedure TFrmAlteraPreco.DBGridEnter(Sender: TObject);
begin 
   FrmAlteraPreco.KeyPreview:= false;
end;

procedure TFrmAlteraPreco.DBGridExit(Sender: TObject);
begin 
   FrmAlteraPreco.KeyPreview:= true;
end;

procedure TFrmAlteraPreco.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   case key of
    vk_escape : close;
    vk_f3: begin 
              if EdtCons.Visible then
                 edtcons.SetFocus
              else
                 EdtCod.SetFocus;
           end;
    vk_f2: begin 
              Application.CreateForm(TFrmUltimaCompra, FrmUltimaCompra);
              FrmUltimaCompra.EdtCodPro.Text := QConsProdCODPRO.AsString;
              FrmUltimaCompra.EdtNomePro.Text:= QConsProdNOMEPRO.AsString;
              FrmUltimaCompra.ShowModal;
           end;
    vk_f7: begin 
              if not (QConsProd.State = dsBrowse) then
                 exit;
              Application.CreateForm(TFrmAlterarSecao, FrmAlterarSecao);
              FrmAlterarSecao.EdtCodSec.Text   := QConsProdCODSEC.AsString;
              FrmAlterarSecao.EdtNomeSec.Text  := QConsProdNOMESECAO.AsString;
              FrmAlterarSecao.EdtCodGrupo.Text := QConsProdCODGRUPO.AsString;
              FrmAlterarSecao.EdtNomeGrupo.Text:= QConsProdNOMEGRUPO.AsString;
              FrmAlterarSecao.EdtCodSub.Text   := QConsProdSUBGRUPO.AsString;
              FrmAlterarSecao.EdtNomeSub.Text  := QConsProdNOMESUBGRUPO.AsString;
              FrmAlterarSecao.EdtCodSetor.text := QConsProdCODIGOSETORESTOQUE.AsString;
              FrmAlterarSecao.EdtNomeSetor.Text:= QConsProdNOMESETORESTOQUE.AsString;
              FrmAlterarSecao.showmodal;
           end;
    vk_f8: begin 
              if not (QConsProd.State = dsBrowse) then
                 exit;
              Application.CreateForm(TFrmAlterarGRP, FrmAlterarGRP);
              FrmAlterarGRP.showmodal;
           end;
    vk_f9: begin 
              if not (QConsProd.State = dsBrowse) then
                 exit;
              Application.CreateForm(TFrmProdutosComposicao, FrmProdutosComposicao);
              FrmProdutosComposicao.showmodal;
           end;
    vk_f11:begin 
              PanelEstoque.Visible:= true;
              EdtEstMin.Text:= QConsProdESTOQUEMIN.AsString;
              EdtEstMin.SetFocus;
              EdtEstMin.SetFocus;
           end;
    vk_f12:AtivaDesativa;
   end;
end;

procedure TFrmAlteraPreco.BtnCancelaClick(Sender: TObject);
begin 
   DBGrid.SetFocus;
   PanelEstoque.Visible:= false;
end;

procedure TFrmAlteraPreco.BtnConfirmaClick(Sender: TObject);
begin 
   iAuxCodPro:= QConsProdCODPRO.AsInteger;

   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   dm.IBTRAux.StartTransaction;
   try
     try
       with QAux do
          begin 
             close;
             sql.Clear;
             sql.add('UPDATE PRODUTO SET ESTOQUE_MINIMO_PRO = :EST ' +
                     'WHERE COD_PRO = :CODPRO');
             Parambyname('est').AsCurrency   := strtocurr(EdtEstMin.Text);
             Parambyname('codpro').AsInteger := QConsProdCODPRO.AsInteger;
             ExecOrOpen;
          end;
       dm.IBTRAux.Commit;
     except
       dm.IBTRAux.Rollback;
       AlertaCad('Erro ao atualizar o estoque mínimo do produto');
     end;
   finally
     QAux.Close;
     DBGrid.SetFocus;
     PanelEstoque.Visible:= false;
     BtnOk.Click;
   end;
end;

procedure TFrmAlteraPreco.ComboConsKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmAlteraPreco.EdtCodGrupoEnter(Sender: TObject);
begin 
   EdtCodGrupo.SelectAll;
end;

procedure TFrmAlteraPreco.EdtCodGrupoExit(Sender: TObject);
begin 
   if (BtnSair.Focused) or (ComboCons.Focused) then
       exit;
       
   if trim(EdtCodGrupo.Text) = '' then
     begin 
         EdtNomeGrupo.Clear;
         exit;
     end;

  if trim(EdtCod.Text) = '' then
     begin 
        EdtNomeGrupo.Clear;
        EdtCodGrupo.Clear;
        edtcod.SetFocus;
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
            sql.add('SELECT COD_GRUPO, DESCRICAO ' +
                    'FROM SECAO_GRUPO ' +
                    'WHERE COD_SEC = :CODSEC AND COD_GRUPO = :CODGRUPO');
            Parambyname('codsec').AsInteger   := strtoint(EdtCod.Text);
            Parambyname('codgrupo').AsInteger := strtoint(EdtCodGrupo.Text);
            Open;
            if not (fieldbyname('cod_grupo').IsNull) then
               edtNomeGrupo.Text:= fieldbyname('descricao').AsString
            else
               begin 
                  AlertaCad('Grupo não Cadastrado');
                  EdtNomeGrupo.Clear;
                  EdtCodGrupo.Clear;
//                  EdtCodGrupo.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('Erro o buscar o Grupo');
    end;
  finally
    dm.QConsulta.Close;
  end;
end;

procedure TFrmAlteraPreco.EdtCodGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsGrupo.Click;
end;

procedure TFrmAlteraPreco.EdtCodGrupoKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmAlteraPreco.EdtCodSubEnter(Sender: TObject);
begin 
   EdtCodSub.SelectAll;
end;

procedure TFrmAlteraPreco.EdtCodSubExit(Sender: TObject);
begin 
   if (BtnSair.Focused) or (ComboCons.Focused) then
       exit;
       
   if EdtCodSub.Text = '' then
     begin 
        EdtNomeSub.Clear;
        exit;
     end;

  if trim(EdtCod.Text) = '' then
     begin 
        EdtCod.SetFocus;
        exit;
     end;

  if trim(EdtCodGrupo.Text) = '' then
     begin 
        EdtCodSub.Clear;
        EdtNomeSub.Clear;
        EdtCodGrupo.SetFocus;
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
            sql.add('SELECT COD_SUBGRUPO, DESCRICAO ' +
                    'FROM SECAO_GRUPO_SUBGRUPO ' +
                    'WHERE COD_SEC = :CODSEC AND COD_GRUPO = :CODGRUPO AND COD_SUBGRUPO = :CODSUB');
            Parambyname('codsec').AsInteger   := strtoint(EdtCod.Text);
            Parambyname('codgrupo').AsInteger := strtoint(EdtCodGrupo.Text);
            Parambyname('codsub').AsInteger   := strtoint(EdtCodSub.Text);
            Open;
            if not (fieldbyname('cod_subgrupo').IsNull) then
               EdtNomeSub.Text:= fieldbyname('descricao').AsString
            else
               begin 
                  AlertaCad('Sub-Grupo não Cadastrado');
                  EdtNomeSub.Clear;
                  EdtCodSub.Clear;
//                  EdtCodSub.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('Erro o buscar o Sub-Grupo');
    end;
  finally
    dm.QConsulta.Close;
  end;
end;

procedure TFrmAlteraPreco.EdtCodSubKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsSub.Click;
end;

procedure TFrmAlteraPreco.BtnConsGrupoClick(Sender: TObject);
begin 
   if trim(EdtCod.Text) = '' then
      exit;
   Application.CreateForm(TFrmConsGrupo, FrmConsGrupo);
   FrmConsGrupo.tag:= 3;
   FrmConsGrupo.showmodal;
end;

procedure TFrmAlteraPreco.BtnConsSubClick(Sender: TObject);
begin 
   if (trim(edtcod.Text) = '') or (trim(EdtCodGrupo.Text) = '') then
      exit;
   Application.CreateForm(TFrmConsSubGrupo, FrmConsSubGrupo);
   FrmConsSubGrupo.tag:= 3;
   FrmConsSubGrupo.showmodal;
end;

procedure TFrmAlteraPreco.EdtCodEnter(Sender: TObject);
begin 
   EdtCod.SelectAll;
end;

procedure TFrmAlteraPreco.EdtCodExit(Sender: TObject);
begin 
   if (BtnSair.Focused) or (ComboCons.Focused) then
       exit;
   case ComboCons.ItemIndex of
    4:begin 
         EdtNome.Text:= Consulta('secao', edtcod, 'cod_sec', 'nome_sec', dm.IBTransaction, dm.QConsulta);
         if EdtNome.Text = '' then
            begin 
               AlertaCad('Seção não cadastrada');
//               EdtCod.SetFocus;
            end;
      end;
    5:begin 
         EdtNome.Text:= Consulta('laboratorio', edtcod, 'cod_lab', 'nome_lab', dm.IBTransaction, dm.QConsulta);
         if EdtNome.Text = '' then
            begin 
               AlertaCad('Fabricante não cadastrado');
//               EdtCod.SetFocus;
            end;
      end;
    6:begin 
         EdtNome.Text:= Consulta('grupo_icms', edtcod, 'cod_grp', 'nome_grp', dm.IBTransaction, dm.QConsulta);
         if EdtNome.Text = '' then
            begin 
               AlertaCad('Grupo de ICMS não cadastrado');
//               EdtCod.SetFocus;
            end;
      end;
    7:begin 
         EdtNome.Text:= Consulta('setores_estoque', edtcod, 'codigo', 'descricao', dm.IBTransaction, dm.QConsulta);
         if EdtNome.Text = '' then
            begin 
               AlertaCad('Setor de Estoque não cadastrado');
//               EdtCod.SetFocus;
            end;
      end;
   end;
end;

procedure TFrmAlteraPreco.EdtCodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnCons.Click;
end;

procedure TFrmAlteraPreco.BtnConsClick(Sender: TObject);
begin 
   case ComboCons.ItemIndex of
    4:begin 
         Application.CreateForm(TFrmConsSecao, FrmConsSecao);
         FrmConsSecao.tag:= 21;
         FrmConsSecao.showmodal;
      end;
    5:begin 
         Application.CreateForm(TFrmConsLab, FrmConsLab);
         FrmConsLab.tag:= 9;
         FrmConsLab.showmodal;
      end;
    6:begin 
         Application.CreateForm(TFrmConsGRP, FrmConsGRP);
         FrmConsGRP.tag:= 13;
         FrmConsGRP.showmodal;
      end;
    7:begin 
         Application.CreateForm(TFrmConsSetorEstoque, FrmConsSetorEstoque);
         FrmConsSetorEstoque.tag:= 3;
         FrmConsSetorEstoque.showmodal;
      end;
   end;
end;

procedure TFrmAlteraPreco.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmAlteraPreco.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin 
   if trim(QConsProdATIVO.AsString) = 'N' then
      begin 
         DBGrid.Canvas.Font.Color:= clRed;
         Dbgrid.DefaultDrawDataCell(Rect, dbgrid.columns[datacol].field, State);
      end;
end;

procedure TFrmAlteraPreco.QConsProdCalcFields(DataSet: TDataSet);
begin 
   if trim(QConsProdISENTOPIS.AsString) = 'S' then
      QConsProdCALC_PIS_COFINS.AsString:= 'ISENTO'
   else
      QConsProdCALC_PIS_COFINS.AsString:= 'NORMAL';
end;

end.
