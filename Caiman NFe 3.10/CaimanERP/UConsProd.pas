unit UConsProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Buttons, StdCtrls, Grids, DBGrids, DB,
  rxPlacemnt, UNovosComponentes, UNovoFormulario, sSpeedButton;

type
  TFrmConsProd = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    ComboCons: TComboBox;
    GB2: TGroupBox;
    EdtCod: TEdit;
    BtnCons: TsSpeedButton;
    EdtNome: TEdit;
    EdtCons: TEdit;
    BtnOk: TButton;
    BtnSair: TButton;
    DBGrid: TDBGrid;
    BtnLocalizar: TButton;
    GroupBox2: TGroupBox;
    ComboClassif: TComboBox;
    RdgAtivo: TRadioGroup;
    BtnPromocao: TButton;
    Button1: TButton;
    Men: TLabel;
    Panel3: TPanel;
    procedure ComboConsChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure BtnConsClick(Sender: TObject);
    procedure EdtCodKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure EdtCodEnter(Sender: TObject);
    procedure BuscaClassificacao;
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnPromocaoClick(Sender: TObject);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure DBGridColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    _CodPro : Integer;
    sSql : string;
  end;

var
  FrmConsProd: TFrmConsProd;

implementation
uses
  Udm, UBibli1, UCadproduto, UConsLab, UConsSecao, UEntradas, UAcertoEstoque,
  UConsEntradasProduto, UConsProdVenda, UOutrasSaidas, UOutrasEntradas,
  URelEntradasProduto, URelVendasProduto, URelEtiqueta, UVenda, UExtratoEstoque,
  URelProd, UCadPromocao, UProdutosComposicao, UCadEmbalagem,
  UNotaFiscal, UAuxPromocao, UTransfLocaisEstoque, UMMA_OS, URegistroProducao,
  UEstoqueConsignado, UImportXML, UCadTabPreco, UConfigPostos, UNovoPrincipal,
  UCadTeclasAtalho, UConfiguracoes, UDicLib;



{$R *.dfm}

procedure TFrmConsProd.BuscaClassificacao;
begin
   ComboClassif.Clear;
   ComboClassif.Items.Add('[00] TODOS');

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Add('SELECT CODIGO, DESCRICAO FROM TIPO_PRODUTO ORDER BY CODIGO');
             open;
             while not eof do
                begin
                   ComboClassif.Items.Add('[' + FormataStringD(fieldbyname('codigo').AsString, '2', '0') + '] ' +  trim(fieldbyname('DESCRICAO').AsString));
                   next;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar a classificação do produto');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmConsProd.Button1Click(Sender: TObject);
begin
   if DM.QProdESTOQUE_CONSIGNADO.AsString <> ''  then
      begin
         Application.CreateForm( TfrmEstoqueConsignado, frmEstoqueConsignado );
         frmEstoqueConsignado.COD_PRODUTO := dm.QProdCOD_PRO.AsInteger;
         frmEstoqueConsignado.COD_EMP := iEmp;
         frmEstoqueConsignado.ShowModal;
      end;
end;

procedure TFrmConsProd.ComboConsChange(Sender: TObject);
begin
   case combocons.ItemIndex of
    0:begin
         gb2.Caption       := 'Código';
         edtnome.Visible   := false;
         btncons.Visible   := false;
         edtcod.Visible    := false;
         edtcons.Visible   := true;
         edtcons.Clear;
      end;
    1:begin
         gb2.Caption       := 'Nome';
         edtnome.Visible   := false;
         btncons.Visible   := false;
         edtcod.Visible    := false;
         edtcons.Visible   := true;
      end;
    2:begin
         gb2.Caption       := 'Referência';
         edtnome.Visible   := false;
         btncons.Visible   := false;
         edtcod.Visible    := false;
         edtcons.Visible   := true;
         edtcons.Clear;
      end;
    3:begin
         gb2.Caption       := 'Código de Barra';
         edtnome.Visible   := false;
         btncons.Visible   := false;
         edtcod.Visible    := false;
         edtcons.Visible   := true;
         edtcons.Clear;
      end;
    4:begin
         edtnome.Visible   := true;
         btncons.Visible   := true;
         edtcod.Visible    := true;
         edtcons.Visible   := false;
         edtnome.clear;
         edtcod.Clear;
      end;
    5:begin
         gb2.Caption       := 'Seção';
         edtnome.Visible   := true;
         btncons.Visible   := true;
         edtcod.Visible    := true;
         edtcons.Visible   := false;
         edtnome.clear;
         edtcod.Clear;
      end;
    6:begin
         gb2.Caption       := 'Palavra Chave';
         edtnome.Visible   := false;
         btncons.Visible   := false;
         edtcod.Visible    := false;
         edtcons.Visible   := true;
      end;
   end;
end;

procedure TFrmConsProd.FormShow(Sender: TObject);
begin
   sSql:= dm.QProd.SQL.Text;

   if trim(dm.RetornaStringTabela('mostrar_estoque_venda', 'parametros', 'cod_emp', iEmp)) = 'S' then
      DBGrid.Columns[2].Visible:= true
   else
      DBGrid.Columns[2].Visible:= false;

  {busca a posicao do combo}
  try
    ComboCons.ItemIndex   := strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsProd.ComboCons'));
    ComboClassif.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsProd.ComboClassif'));
  except
    ComboCons.ItemIndex   := 0;
    ComboClassif.ItemIndex:= 0;
  end;
//  if ( tag = 1 ) then
   //  Application.CreateForm(TFrmCadProduto, FrmCadProduto);
  ComboConsChange(ComboCons);
  if EdtCons.Visible then
     EdtCons.text:= sAuxString;
  if Tag = 98 then
     Men.Visible := true
  else
     men.Visible := false;
  ComboCons.SetFocus;

end;

procedure TFrmConsProd.BtnSairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmConsProd.BtnOkClick(Sender: TObject);
var sLiga : string;
begin
   sLiga:= ' WHERE ';

   if EdtCons.Visible then
      sAuxString:= trim(EdtCons.Text);

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QProd do
      begin
         close;
         sql.Clear;
         sql.Text:= sSql;
         if ComboClassif.ItemIndex > 0 then
            begin
               sql.add(' WHERE P.CODIGO_TIPO = :CODTIPO');
               parambyname('codtipo').AsInteger:= strtoint(copy(ComboClassif.Text, 2, 2));
               sLiga:= ' AND ';
            end;
         if RdgAtivo.ItemIndex = 0 then
            begin
               sql.add(sLiga + ' P.ATIVO_PRO = ' + #39 + 'S' + #39);
               sLiga:= ' AND ';
            end
         else
            if RdgAtivo.ItemIndex = 1 then
               begin
                  sql.add(sLiga + ' P.ATIVO_PRO = ' + #39 + 'N' + #39);
                  sLiga:= ' AND ';
               end;

         case combocons.ItemIndex of
           0:begin
                if EdtCons.Text = '' then
                   sql.add(' ORDER BY P.COD_PRO')
                else
                   sql.add(sLiga + ' COD_PRO = ' + edtcons.Text);
             end;
           1:sql.add(sLiga +  ' P.NOME_PRO LIKE ' + #39 + edtcons.Text + '%' + #39 + ' ORDER BY NOME_PRO');
           2:sql.add(sLiga +  ' P.REFERENCIA_PRO LIKE ' + #39 + edtcons.Text + #39);
           3:sql.add(sLiga +  ' P.CODIGO_BARRA_PRO LIKE ' + #39 + trim(edtcons.Text) + #39);
           4:begin
                if trim(EdtCod.Text) = '' then
                   begin
                      AlertaCad('Digite o código do fabricante');
//                      EdtCod.SetFocus;
                      exit;
                   end;
                sql.add(sLiga +  ' P.COD_LAB = ' + edtcod.Text + ' ORDER BY P.NOME_PRO');
                open;
             end;
           5:begin
                if trim(EdtCod.Text) = '' then
                   begin
                      AlertaCad('Digite o código da seção');
//                      EdtCod.SetFocus;
                      exit;
                   end;
                sql.Add(sLiga + ' P.COD_SEC = ' + edtcod.Text + ' ORDER BY P.NOME_PRO');
             end;
           6:sql.add(sLiga +  ' P.NOME_PRO LIKE ' + #39 + '%' + EdtCons.Text + '%' + #39 + ' ORDER BY NOME_PRO');
         end;
         Parambyname('codemp').AsInteger:= iEmp;
         open;
      end;
   dbgrid.SetFocus;
end;

procedure TFrmConsProd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   {grava a posicao do combo}
   dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsProd.ComboCons', inttostr(ComboCons.itemIndex));
   dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsProd.ComboClassif', inttostr(ComboClassif.itemIndex));
   if Tag < 201 then
      begin
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.QProd.SQL.Clear;
         dm.QProd.SQL.Text:= sSql;
         dm.QProd.Close;
         Action := caFree;
      end;
end;

procedure TFrmConsProd.BtnLocalizarClick(Sender: TObject);
begin
   case tag of
     { 0,1: begin
              BuscaFormulario( TFrmCadProduto, True );
              with FrmCadProduto do
                 begin
                    FrmCadProduto.Tag   := 1;
                    pc.ActivePageIndex  := 0;
                    limpaedit(FrmCadProduto);
                    ededit(FrmCadProduto, false);
                    cod_pro.Text:= dm.QProdCOD_PRO.AsString;
                    if trim(dm.QProdCONTROLA_ESTOQUE_PRO.AsString) = 'S' then
                       CheckControlaEstoque.Checked:= true
                    else
                       CheckControlaEstoque.Checked:= false;
                    edtTempoPreparo.Time     := DM.QProdTEMPO_PREPARO.AsDateTime;
                    chkAndroid.Checked       := DM.QProdANDROID_VISUALIZA.AsString = 'S';
                    ChkCopa.Checked          := DM.QProdALERTA_COPA.AsString = 'S';
                    ChkCozinha.Checked       := DM.QProdALERTA_COZINHA.AsString = 'S';
                    EdtCodBarra.Text         := dm.QProdCODIGO_BARRA_PRO.AsString;
                    edtnome.Text             := dm.QProdNOME_PRO.AsString;
                    EdtDescCupom.Text        := dm.QProdDESC_CUPOM.AsString;
                    cod_lab.Text             := dm.QProdCOD_LAB.AsString;
                    edtnomelab.Text          := dm.QProdNOME_LAB.AsString;
                    cod_sec.Text             := dm.QProdCOD_SEC.AsString;
                    edtnomesec.Text          := dm.QProdNOME_SEC.AsString;
                    EdtCodGrupo.Text         := dm.QProdCOD_GRUPO.AsString;
                    EdtNomeGrupo.Text        := dm.QProdDESCRICAO.AsString;
                    EdtCodSubGrupo.Text      := dm.QProdSUB_GRUPO.AsString;
                    EdtNomeSubGrupo.Text     := dm.QProdDESCRICAO1.Text;
                    edtvalor.Text            := dm.QProdVALOR_PRO.AsString;
                    edtpromocao.Text         := dm.QProdPROMOCAO_PRO.AsString;
                    EdtComissao.Text         := dm.QProdCOMISSAO_PRO.AsString;
                    EdtQuantEnt.Text         := dm.QProdQUANT_UNIDADE_ENTRADA.AsString;
                    EdtEstMin.Text           := dm.QProdESTOQUE_MINIMO_PRO.AsString;
                    EdtLoc.Text              := dm.QProdLOCALIZACAO_PRO.AsString;
                    edtAliqIBPTNac.Text      := dm.qprodaliq_ibpt_nac.Asstring;
                    if trim(dm.QProdATIVO_PRO.AsString) = 'S' then
                       CheckAtivo.Checked    := true
                    else
                       CheckAtivo.Checked    := false;
                    EdtMargem.Text           := dm.QProdMARGEM_LUCRO_PRO.AsString;
                    if dm.QProdPRODUTO_PESADO_PRO.AsString = 'N' then
                       ComboPeso.ItemIndex:= 0
                    else
                       if dm.QProdPRODUTO_PESADO_PRO.AsString = 'P' then
                          ComboPeso.ItemIndex:= 1
                       else
                          ComboPeso.ItemIndex:= 2;
                    cod_set.Text             := dm.QProdCOD_SETOR.AsString;
                    EdtNomeSetor.Text        := dm.QProdNOME_SET.AsString;
                    edttecla.Text            := dm.QProdTECLA_ATALHO_PRO.AsString;
                    EdtCodReceita.Text       := dm.QProdINDICE_RECEITA_PRO.AsString;
                    EdtDiasValidade.Text     := dm.QProdDIAS_VALIDADE_PRO.AsString;
                    EdtRef.Text              := dm.QProdREFERENCIA_PRO.AsString;
                    if trim(dm.QProdCOMPLEMENTO_PRO.AsString) = 'S' then
                       CheckComplemento.Checked:= true
                    else
                       CheckComplemento.Checked:= false;
                    EdtICMSContEst.Text      := dm.QProdICMS_CONT_EST.AsString;
                    edticmsCFest.Text        := dm.QProdICMS_CF_EST.AsString;
                    EdtICMSCONTFora.Text     := dm.QProdICMS_CONT_FORA.AsString;
                    EdtICMSCFFora.Text       := dm.QProdICMS_CF_FORA.AsString;
                    EdtCSTCONTEst.Text       := dm.QProdCST_CONT_EST.AsString;
                    EdtCSTCONTFora.text      := dm.QProdCST_CONT_FORA.AsString;
                    EdtCSTCFEst.Text         := dm.QProdCST_CF_EST.AsString;
                    EdtCSTCFFora.Text        := dm.QProdCST_CF_FORA.AsString;
                    EdtCFOPVEstCONT.Text     := dm.QProdCFOP_VENDAS_CONT_EST.AsString;
                    EdtCFOPVEstCF.Text       := dm.QProdCFOP_VENDAS_CF_EST.AsString;
                    EdtCFOPVForaCONT.Text    := dm.QProdCFOP_VENDAS_CONT_FORA.AsString;
                    EdtCFOPVForaCF.Text      := dm.QProdCFOP_VENDAS_CF_FORA.AsString;
                    if dm.QProdSAIR_TABELA_PRECO.AsString = 'S' then
                       CheckTabela.Checked:= true
                    else
                       CheckTabela.Checked:= false;
                    if dm.QProdST_CONT_EST.AsString = 'S' then
                       CheckSTCONTEst.Checked:= true
                    else
                       CheckSTCONTEst.Checked:= false;
                    EdtVrAgregCONTEst.Text  := dm.QProdVR_AGREG_CONT_EST.AsString;
                    EdtIPICONTEst.Text      := dm.QProdIPI_CONT_EST.AsString;
                    EdtIPICFEst.Text        := dm.QProdIPI_CF_EST.AsString;
                    EdtIPICONTFora.Text     := dm.QProdIPI_CONT_FORA.AsString;
                    EdtIPICFFora.Text       := dm.QProdIPI_CF_FORA.AsString;

                    EdtBCRCONTEst.Text  := dm.QProdRED_CONT_EST.AsString;
                    EdtBCRCFEst.Text    := dm.QProdRED_CF_EST.AsString;
                    EdtBCRCONTFora.Text := dm.QProdRED_CONT_FORA.AsString;
                    EdtBCRCFFora.Text   := dm.QProdRED_CF_FORA.AsString;
                    EdtNCM.Text         := dm.QProdCOD_NCM.AsString;
                    EdtProdEstoque.Text := dm.QProdCOD_PRODUTO_ESTOQUE.AsString;
                    ComboTipo.ItemIndex := dm.QProdCODIGO_TIPO.AsInteger -1;
                    EdtAliqPis.Text     := dm.QProdALIQUOTA_PIS.AsString;
                    EdtAliqCofins.Text  := dm.QProdALIQUOTA_COFINS.AsString;
                    EdtAliqIR.Text      := dm.QProdALIQUOTA_IR.AsString;
                    EdtAliqCSLL.Text    := dm.QProdALIQUOTA_CSLL.AsString;
                    EdtAliqOutras.Text  := dm.QProdALIQUOTA_OUTRAS.AsString;
                    EdtVarejoPrazo.Text := dm.QProdPRECO_PRAZO_PRO.AsString;
                    if trim(dm.QProdTIPO_PRODUCAO.AsString) = 'P' then
                       ComboTipoProducao.ItemIndex:= 0
                    else
                       ComboTipoProducao.ItemIndex:= 1;

                    if trim(dm.QProdISENTO_PIS_COFINS_PRO.AsString) = 'S' then
                       CheckPisCofins.Checked:= true
                    else
                       CheckPisCofins.Checked:= false;

                    EdtCodUndEntrada.Text   := dm.QProdCODIGO_UNIDADE_ENTRADA.AsString;
                    EdtCodundSaida.Text     := dm.QProdCODIGO_UNIDADE_SAIDA.AsString;
                    EdtNomeUndEntrada.Text  := dm.QProdUND_ENTRADA.AsString;
                    EdtNomeUndSaida.Text    := dm.QProdUND_SAIDA.AsString;

                    if dm.QProdDATA_VALIDADE.IsNull then
                       EdtDataValidade.Clear
                    else
                       EdtDataValidade.Text:= dm.QProdDATA_VALIDADE.AsString;

                    EdtCodSetorEstoque.Text := dm.QProdCODIGO_SETOR_ESTOQUE.AsString;
                    EdtNomeSetorEstoque.Text:= dm.QProdSETOR_ESTOQUE.AsString;
                    EdtORIG.Text            := dm.QProdORIG.AsString;
                    EdtCSOSN.Text           := dm.QProdCSOSN.AsString;

                    edtTamanho.Text         := trim( dm.QProdTAMANHO.AsString );
                    edtCor.Text             := trim( dm.QProdCOR.AsString );
                    edtOBS.Lines.Text       := ( dm.QProdOBS.Value );

                    CST_PIS.Text            := trim( dm.Qprodcst_pis.asstring );
                    CST_COFINS.Text            := trim( dm.Qprodcst_cofins.asstring );

                    edtCST_ipi.Text         := trim( dm.qprodcst_ipi.Asstring );

                    edtPrecoAtacado.Value   := dm.QProdVALOR_ATACADO.AsCurrency;
                    edtFator.Value := dm.qprodfator_conversao.AsCurrency;

                    if not dm.QProdCAMINHO_FOTO_PRO.IsNull then
                       begin
                          OpenPicture.FileName := dm.QProdCAMINHO_FOTO_PRO.Value;
                          image.Visible:= true;
                          try
                            image.Picture.LoadFromFile(dm.QProdCAMINHO_FOTO_PRO.value);
                          except
                            image.Picture:= nil
                          end;
                       end
                    else
                       begin
                          OpenPicture.FileName:= '';
                          image.Visible:= false;
                       end;
                    FormShow( FrmCadProduto );
                 end;
               close;
           end;     }
      2: begin
            with FrmEntradas do
               begin
                  if trim(dm.QProdATIVO_PRO.AsString) = 'N' then
                     begin
                        AlertaCad('Produto não Ativo');
                        exit;
                        abort;
                     end;
                  Edtcodpro.Text      := dm.QProdCOD_PRO.AsString;
                  EdtNomePro.Text     := dm.QProdNOME_PRO.AsString;
                  label12.Caption     := 'Quant.' + dm.QProdUND_ENTRADA.AsString;
                  label14.Caption     := dm.QProdUND_ENTRADA.AsString + ' C/' + dm.QProdQUANT_UNIDADE_ENTRADA.AsString;
                  label17.Caption     := 'Vl.' + dm.QProdUND_ENTRADA.AsString;
                  label27.Caption     := label14.Caption;
                  EdtQuantUnid.Text   := dm.QProdQUANT_UNIDADE_ENTRADA.AsString;
                  EdtQuantUnid2.Text  := dm.QProdQUANT_UNIDADE_ENTRADA.AsString;
                  LTribSaida.Caption  := dm.QProdNOME_GRP.AsString;
                  EdtMargem.Text      := dm.QProdMARGEM_LUCRO_PRO.AsString;
                  EdtPrecoVenda.Text  := dm.QProdVALOR_PRO.AsString;
                  EdtCFOP.SetFocus;
               end;
            close;
         end;
      4: begin
            with FrmAcertoEstoque do
               begin
                  edtcodpro.Text  := dm.QProdCOD_PRO.AsString;
                  edtnomepro.Text := dm.QProdNOME_PRO.AsString;
                  QuantEnt.Text   := dm.QProdQUANT_UNIDADE_ENTRADA.AsString;
                  EdtQuant.SetFocus;
               end;
            close;
         end;
      6: begin
            with FrmConsEntradasProduto do
               begin
                  edtcodpro.Text   := dm.QProdCOD_PRO.AsString;
                  edtnomepro.Text  := dm.QProdNOME_PRO.AsString;
                  edtdataini.SetFocus;
               end;
            close;
         end;
      7: begin
            with FrmConsProdVenda do
               begin
                  edtcodpro.Text   := dm.QProdCOD_PRO.AsString;
                  edtnomepro.Text  := dm.QProdNOME_PRO.AsString;
                  edtdataini.SetFocus;
               end;
            close;
         end;
      9: begin
            if not bEstoqueNegativo then
               begin
                  if DM.QProdESTOQUE.AsCurrency <= 0 then
                     begin
                        AlertaCad('Produto sem estoque');
                        exit;
                        abort;
                     end;
               end;

            with FrmOutrasSaidas do
               begin
                  EdtCodPro.Text    := dm.QProdCOD_PRO.AsString;
                  EdtNomePro.Text   := dm.QProdNOME_PRO.AsString;
                  if bPrecoVenda then
                     EdtValorUnit.Text := dm.QProdVALOR_PRO.AsString
                  else
                     EdtValorUnit.Text := dm.QProdPRECO_CUSTO.AsString;
                  EdtEstoque.Text:= dm.QProdESTOQUE.AsString;
                  EdtCodPro.SetFocus;
               end;
            close;
         end;
      10: begin
             with FrmOutrasEntradas do
                begin
                   EdtCodPro.Text    := dm.QProdCOD_PRO.AsString;
                   EdtNomePro.Text   := dm.QProdNOME_PRO.AsString;
                   if bPrecoVenda then
                     EdtValorUnit.Text := dm.QProdVALOR_PRO.AsString
                  else
                     EdtValorUnit.Text := dm.QProdPRECO_CUSTO.AsString;
                   EdtQuant.SetFocus;
                end;
             close;
          end;
      13: begin
             with FrmRelEntradasProduto do
                begin
                   edtcod.Text  := dm.QProdCOD_PRO.AsString;
                   edtnome.Text := dm.QProdNOME_PRO.AsString;
                   EdtDataIni.SetFocus;
                end;
             close;
          end;
      14: begin
             with FrmRelVendasProduto do
                begin
                   edtcod.Text  := dm.QProdCOD_PRO.AsString;
                   edtnome.Text := dm.QProdNOME_PRO.AsString;
                   edtdataini.SetFocus;
                end;
             close;
          end;
      15: begin
             with FrmRelEtiqueta do
                begin
                   EdtCodPro.Text  := dm.QProdCOD_PRO.AsString;
                   if RdgImp.ItemIndex = 0 then
                     begin
                        EdtNomePro.Text      := dm.QProdNOME_PRO.AsString;
                        EdtDescEtiqueta.Text := dm.QProdNOME_PRO.AsString;
                     end
                  else
                     begin
                        EdtNomePro.Text      := dm.QProdDESC_CUPOM.AsString;
                        EdtDescEtiqueta.Text := dm.QProdDESC_CUPOM.AsString;
                     end;

                   EdtQuant.SetFocus;
                end;
             close;
          end;
      16: begin
             if not bEstoqueNegativo then
               begin
                  if DM.QProdESTOQUE.AsCurrency <= 0 then
                     begin
                        AlertaCad('Produto sem estoque');
                        exit;
                        abort;
                     end;
               end;

             with FrmVenda do
                begin
                   EdtCodPro.Text  := dm.QProdCOD_PRO.AsString;
                   EdtNomePro.Text := dm.QProdNOME_PRO.AsString;
                   EdtEstoque.Text := dm.QProdESTOQUE.AsString;
                   EdtCodPro.SetFocus;
                end;
             close;
          end;
      17: begin
             with FrmExtratoEstoque do
                begin
                   EdtCodPro.Text  := dm.QProdCOD_PRO.AsString;
                   EdtNomePro.Text := dm.QProdNOME_PRO.AsString;
                end;
             close;
          end;
      20: begin
             with FrmRelProd do
                begin
                   EdtCodIni.Text  := dm.QProdCOD_PRO.AsString;
                   EdtNomeIni.Text := dm.QProdNOME_PRO.AsString;
                   edtcodfin.SetFocus;
                end;
             close;
          end;
      21: begin
             with FrmRelProd do
                begin
                   EdtCodFin.Text  := dm.QProdCOD_PRO.AsString;
                   EdtNomeFin.Text := dm.QProdNOME_PRO.AsString;
                end;
             close;
          end;
      22: begin
             with FrmCadPromocao do
                begin
                   EdtCodProd.Text  := dm.QProdCOD_PRO.AsString;
                   EdtNomeProd.Text  := dm.QProdNOME_PRO.AsString;
                   EdtCodEmp.SetFocus;
                end;
             close;
          end;
      23: begin
             with FrmCadPromocao do
                begin
                   EdtCodProd1.Text   := dm.QProdCOD_PRO.AsString;
                   EdtNomeProd1.Text  := dm.QProdNOME_PRO.AsString;
                end;
             close;
          end;
      27: begin
             with FrmProdutosComposicao do
                begin
                   EdtCodPro.Text  := dm.QProdCOD_PRO.AsString;
                   EdtNomePro.Text := dm.QProdNOME_PRO.AsString;
                   LabelUnd.Caption:= dm.QProdUND_SAIDA.AsString;
                   BtnOK.SetFocus;
                end;
             close;
          end;
{      28: begin
             with FrmDefProduto do
                begin
                   EdtCodPro.Text := dm.QProdCOD_PRO.AsString;
                   EdtNomePro.Text:= dm.QProdNOME_PRO.AsString;
                   BtnOK.SetFocus;
                end;
             close;
          end;        }
   {   29: begin
             with FrmCadProduto do
                begin
                   EdtProdEstoque.Text     := dm.QProdCOD_PRO.AsString;
                   EdtNomeProdEstoque.Text := dm.QProdNOME_PRO.AsString;
                   EdtCodSetorEstoque.SetFocus;
                end;
             close;
          end;          }
      30: begin
             with FrmCadEmbalagem do
                begin
                   EdtCodPro.Text  := dm.QProdCOD_PRO.AsString;
                   EdtNomePro.Text := dm.QProdNOME_PRO.AsString;
                   EdtQuant.SetFocus;
                end;
             close;
          end;
      31: begin
             with FrmNotaFiscal do
                begin
                   EdtCodPro.Text      := dm.QProdCOD_PRO.AsString;
                   EdtNomeProduto.Text := dm.QProdNOME_PRO.AsString;
                   EdtCodPro.SetFocus;
                end;
             close;
          end;
      32: begin
             with FrmTransfLocaisEstoque do
                begin
                   EdtCodPro.Text   := dm.QProdCOD_PRO.AsString;
                   EdtNomePro.Text  := dm.QProdNOME_PRO.AsString;
                   EdtQuant.SetFocus;
                end;
             close;
          end;

      33: begin
             FrmMMA_OS.buscaCodP := dm.QProdCOD_PRO.AsInteger;
             FrmMMA_OS.buscaDescP := dm.QProdNOME_PRO.AsString;
             FrmMMA_OS.buscaUnidP := dm.QProdUND_SAIDA.AsString;
             FrmMMA_OS.buscaValorP := dm.QProdVALOR_PRO.AsFloat;
             close;
          end;
      34: begin
            _CodPro := dm.QProdCOD_PRO.AsInteger;
            Close;
          end;
      99: begin
             frmregistroProducao.edtcodpro.text := dm.QProdCOD_PRO.AsString;
             frmregistroProducao.edtnomepro.text := dm.QProdNOME_PRO.AsString;
             close;
          end;
      98: begin
             ImportXML.COD_LOCALIZA := dm.QProdCOD_PRO.AsInteger;
             importXML.Quant_ent := dm.QProdQUANT_UNIDADE_ENTRADA.AsCurrency;
             close;
          end;
      100: begin
              FrmCadTabPreco.EdtCodPro.Text := DM.QProdCOD_PRO.AsString;
              FrmCadTabPreco.EdtNomeProduto.Text := DM.QProdNOME_PRO.AsString;
              FrmCadTabPreco.EdtValor.Value := DM.QProdVALOR_PRO.AsCurrency;
              FrmCadTabPreco.EdtvalorVenda.Value := DM.QProdVALOR_PRO.AsCurrency;
              FrmCadTabPreco.COD_PRO := dm.QProdCOD_PRO.AsInteger;
              FrmCadTabPreco.COD_BARRA_PRO := DM.QProdCODIGO_BARRA_PRO.AsString;
              close;
           end;
      101: begin
              frmConfigPostos.QTanquesCOD_PRO.AsInteger := dm.QProdCOD_PRO.AsInteger;
              frmConfigPostos.QTanquesDESC_CUPOM.AsString := DM.QProdDESC_CUPOM.AsString;
              Close;
           end;
      102: begin
              frmCadTeclasAtalho.edtCodPro.Text := DM.QProdCOD_PRO.AsString;
              frmCadTeclasAtalho.edtproduto.Text := DM.QProdDESC_CUPOM.AsString;
              Close;
           end;
      103: begin
               FrmConfiguracoes.edtRest_codpro.Text := DM.QProdCOD_PRO.AsString;
               FrmConfiguracoes.edtRest_descpro.Text := DM.QProdNOME_PRO.AsString;
               Close;
           end;
      104: begin

           end;
      201: ModalResult := mrOk;
   end;
end;

procedure TFrmConsProd.BtnConsClick(Sender: TObject);
begin
   if combocons.ItemIndex = 4 then
      begin
         Application.CreateForm(TFrmConsLab, FrmConsLab);
         FrmConsLab.tag:= 2;
         FrmConsLab.showmodal;
      end
   else
      if combocons.ItemIndex = 5 then
         begin
            Application.CreateForm(TFrmConsSecao, FrmConsSecao);
            FrmConsSecao.tag:= 2;
            FrmConsSecao.showmodal;
         end;
end;

procedure TFrmConsProd.EdtCodKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmConsProd.EdtCodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f3 then
      BtnCons.Click;
end;

procedure TFrmConsProd.EdtCodExit(Sender: TObject);
begin
   if (btnsair.Focused) or (combocons.Focused) then
      exit;
   if combocons.ItemIndex = 4 then
      begin
         edtnome.Text:= consulta('laboratorio', edtcod, 'cod_lab', 'nome_lab', dm.IBTransaction, dm.qConsulta);
         if edtnome.Text = '' then
            begin
               AlertaCad('Fabricante não Cadastrado');
//               edtcod.SetFocus;
            end;
      end
   else
      if combocons.ItemIndex = 5 then
         begin
            edtnome.Text:= consulta('secao', edtcod, 'cod_sec', 'nome_sec', dm.IBTransaction, dm.qConsulta);
            if edtnome.Text = '' then
               begin
                  AlertaCad('Seção não Cadastrada');
//                  edtcod.SetFocus;
               end;
         end;
end;

procedure TFrmConsProd.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsProd.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      begin
         btnsair.Focused;
         btnsair.Click;
      end
   else
      if key = vk_f3 then
         begin
            case ComboCons.ItemIndex of
              0,1,2,3,6: EdtCons.SetFocus;
              4,5: EdtCod.SetFocus;
            end;
         end;
end;

procedure TFrmConsProd.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if combocons.ItemIndex in [1,2] then
      begin
         if key = vk_f3 then
            EdtCons.SetFocus;
      end;
end;

procedure TFrmConsProd.FormCreate(Sender: TObject);
begin
   TDicLib.MontaTelaUsu( iCodUsu, Self, DM.IBDatabase );
   BuscaClassificacao;
end;

procedure TFrmConsProd.EdtCodEnter(Sender: TObject);
begin
   EdtCod.SelectAll;
end;

procedure TFrmConsProd.DBGridColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
   TDicLib.GravarGridDB( iCodUsu, Sender, Self,  dm.IBDatabase);
end;

procedure TFrmConsProd.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if trim(dm.QProdATIVO_PRO.AsString) = 'N' then
      begin
         DBGrid.Canvas.Font.Color:= clRed;
         Dbgrid.DefaultDrawDataCell(Rect, dbgrid.columns[datacol].field, State);
      end;

end;

procedure TFrmConsProd.BtnPromocaoClick(Sender: TObject);
var iAux : integer;
begin
   {verifica se tem registro selecionado}
   iAux:= 0;
   with dm.QProd do
      begin
         DisableControls;
         First;
         while not eof do
            begin
               if DBGrid.SelectedRows.CurrentRowSelected then
                  begin
                     inc(iAux);
                     Break;
                  end;
               next;
            end;
         First;
         EnableControls;
      end;
   if iAux = 0 then
      begin
         AlertaCad('Nenhum produto selecionado');
         exit;
      end;

   Application.CreateForm(TFrmAuxPromocao, FrmAuxPromocao);
   FrmAuxPromocao.ShowModal;
end;

procedure TFrmConsProd.DBGridKeyPress(Sender: TObject; var Key: Char);
begin
   if key in ['a'..'z', 'A'..'Z'] then
      DM.QProd.Locate('nome_pro', key, [lopartialkey,locaseinsensitive]);
end;

end.

