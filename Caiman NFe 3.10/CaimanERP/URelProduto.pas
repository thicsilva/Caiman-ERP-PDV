unit URelProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmRelProduto = class(UNovoFormulario.TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    GroupBox1: TGroupBox;
    ComboTipo: TComboBox;
    GroupBox2: TGroupBox;
    ComboAtivo: TComboBox;
    StatusBar1: TStatusBar;
    QProdGeral: TFDQuery;
    QProdGeralCOD_PRO: TIntegerField;
    QProdGeralNOME_PRO: TStringField;
    QProdGeralVALOR_PRO: TBCDField;
    QProdGeralPROMOCAO_PRO: TBCDField;
    QProdGeralATIVO_PRO: TStringField;
    QProdGeralLOCALIZACAO_PRO: TStringField;
    GB: TGroupBox;
    BtnConsIni: TsSpeedButton;
    EdtCodIni: UNovosComponentes.TEdit;
    EdtNomeIni: TEdit;
    EdtCodFin: UNovosComponentes.TEdit;
    BtnConsFin: TsSpeedButton;
    EdtNomeFin: TEdit;
    QProdGeralREFERENCIA_PRO: TStringField;
    QRelSecaoLab: TFDQuery;
    QRelSecaoLabCOD_PRO: TIntegerField;
    QRelSecaoLabNOME_PRO: TStringField;
    QRelSecaoLabVALOR_PRO: TBCDField;
    QRelSecaoLabPROMOCAO_PRO: TBCDField;
    QRelSecaoLabATIVO_PRO: TStringField;
    QRelSecaoLabLOCALIZACAO_PRO: TStringField;
    QRelSecaoLabREFERENCIA_PRO: TStringField;
    QRelSecaoLabCOD_SEC: TIntegerField;
    QRelSecaoLabCOD_LAB: TIntegerField;
    QRelSecaoLabNOME_LAB: TStringField;
    QRelSecaoLabNOME_SEC: TStringField;
    Check: TCheckBox;
    GroupBox3: TGroupBox;
    ComboPesados: TComboBox;
    GroupBox4: TGroupBox;
    ComboMarcados: TComboBox;
    GroupBox6: TGroupBox;
    ComboOrdem: TComboBox;
    QRelSecaoLabCODIGO_BARRA_PRO: TStringField;
    QProdGeralCODIGO_BARRA_PRO: TStringField;
    QProdGeralPRECO_PRAZO_PRO: TBCDField;
    QRelSecaoLabPRECO_PRAZO_PRO: TBCDField;
    QRelSecaoLabDESCRICAO: TStringField;
    QProdGeralDESCRICAO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboTipoChange(Sender: TObject);
    procedure BtnConsIniClick(Sender: TObject);
    procedure BtnConsFinClick(Sender: TObject);
    procedure EdtCodIniExit(Sender: TObject);
    procedure EdtCodFinExit(Sender: TObject);
    procedure LimpaGB;
    procedure EdtCodIniKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodIniKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodFinKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckClick(Sender: TObject);
    procedure EdtCodIniEnter(Sender: TObject);
    procedure EdtCodFinEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelProduto: TFrmRelProduto;

implementation
uses
  Udm, UQRelProdutoGeral, UNovoPrincipal, UConsLab, UConsSecao, UBibli1, 
  URelProdLab, UQRelProdSecao;
var  sAuxSql : string;

{$R *.dfm}

procedure TFrmRelProduto.LimpaGB;
begin 
   edtcodini.Clear;
   edtcodfin.Clear;
   edtnomeini.Clear;
   edtnomefin.Clear;
end;

procedure TFrmRelProduto.FormShow(Sender: TObject);
begin 
   sAuxSql:= QRelSecaoLab.SQL.Text;
   ComboTipo.ItemIndex:= 0;
   ComboAtivo.ItemIndex:= 0;
   ComboOrdem.ItemIndex:= 1;
   ComboMarcados.ItemIndex:= 2;
   ComboPesados.ItemIndex:= 2;
   ComboTipoChange(sender);
   ComboTipo.SetFocus;
end;

procedure TFrmRelProduto.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelProduto.BtnVisClick(Sender: TObject);
var sLiga : string;
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;

   case ComboTipo.ItemIndex of
    0:begin 
         with QProdGeral do
            begin 
               close;
               sql.Clear;
               sql.Add('SELECT COD_PRO, NOME_PRO, VALOR_PRO, PROMOCAO_PRO, ATIVO_PRO, LOCALIZACAO_PRO, REFERENCIA_PRO, ' +
                       'CODIGO_BARRA_PRO, PRECO_PRAZO_PRO, U.DESCRICAO ' +
                       'FROM PRODUTO P ' +
                       'INNER JOIN UNIDADE_MEDIDA U ' +
                       'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)');

               case ComboAtivo.ItemIndex of
                 0: sLiga:= ' WHERE ';
                 1: begin 
                       sql.Add(' WHERE ATIVO_PRO = ' + #39 + 'S' + #39);
                       sLiga:= ' AND ';
                    end;
                 2: begin 
                       sql.Add(' WHERE ATIVO_PRO = ' + #39 + 'N' + #39);
                       sLiga:= ' AND ';
                     end;
               end;

               case ComboPesados.ItemIndex of
                 0: begin 
                       sql.Add(sLiga + ' PRODUTO_PESADO_PRO IN (' + #39 + 'P' + #39 + ',' + #39 + 'P' + #39 + ')');
                       sLiga:= ' AND ';
                    end;
                 1: begin 
                       sql.Add(sLiga + ' PRODUTO_PESADO_PRO = ' + #39 + 'N' + #39);
                       sLiga:= ' AND ';
                     end;
               end;

               case ComboMarcados.ItemIndex of
                 0: sql.Add( sLiga + ' SAIR_TABELA_PRECO = ' + #39 + 'S' + #39);
                 1: sql.Add( sLiga + ' (SAIR_TABELA_PRECO = ' + #39 + 'N' + #39  + ' OR SAIR_TABELA_PRECO IS NULL)');
               end;

               case ComboOrdem.ItemIndex of
                 0: sql.Add(' ORDER BY COD_PRO');
                 1: sql.Add(' ORDER BY NOME_PRO');
                 2: sql.Add(' ORDER BY REFERENCIA_PRO');
               end;
               open;
               Application.CreateForm(TFrmQRelProdutoGeral, FrmQRelProdutoGeral);
               FrmQRelProdutoGeral.QRProd.DataSet   := FrmRelProduto.QProdGeral;
               FrmQRelProdutoGeral.QRDBText1.DataSet:= FrmRelProduto.QProdGeral;
               FrmQRelProdutoGeral.QRDBText2.DataSet:= FrmRelProduto.QProdGeral;
               FrmQRelProdutoGeral.QRDBText3.DataSet:= FrmRelProduto.QProdGeral;
               FrmQRelProdutoGeral.QRDBText5.DataSet:= FrmRelProduto.QProdGeral;
               FrmQRelProdutoGeral.QRDBText6.DataSet:= FrmRelProduto.QProdGeral;
               FrmQRelProdutoGeral.QRDBText7.DataSet:= FrmRelProduto.QProdGeral;

               if sender = btnvis then
                  begin 
                     FrmQRelProdutoGeral.QRProd.PreviewInitialState:= wsMaximized;
                     FrmQRelProdutoGeral.QRProd.Preview;
                  end
               else
                  begin 
                     FrmQRelProdutoGeral.QRProd.PrinterSetup;
                     FrmQRelProdutoGeral.QRProd.Print;
                  end;
               FrmQRelProdutoGeral.QRProd.QRPrinter:= nil;
               close;
            end;
      end;
    1:begin 
         with QRelSecaoLab do
            begin 
               close;
               sql.Clear;
               sql.Text:= sAuxSql;
               if ComboTipo.ItemIndex = 1 then //laboratorio
                  begin 
                     if not Check.Checked then
                        begin 
                           sql.Add(' WHERE P.COD_LAB BETWEEN ' + edtcodini.Text + ' AND ' + edtcodfin.Text);
                           sLiga:= ' AND ';
                        end
                     else
                        sLiga:= ' WHERE ';

                     case ComboAtivo.ItemIndex of
                       1: sql.Add(sLiga + ' P.ATIVO_PRO = ' + #39 + 'S' + #39);
                       2: sql.Add(sLiga + ' P.ATIVO_PRO = ' + #39 + 'N' + #39);
                     end;

                     case ComboPesados.ItemIndex of
                         0: begin 
                               sql.Add(sLiga + ' PRODUTO_PESADO_PRO IN (' + #39 + 'P' + #39 + ',' + #39 + 'P' + #39 + ')');
                               sLiga:= ' AND ';
                            end;
                         1: begin 
                               sql.Add(sLiga + ' PRODUTO_PESADO_PRO = ' + #39 + 'N' + #39);
                               sLiga:= ' AND ';
                             end;
                     end;

                     case ComboMarcados.ItemIndex of
                       0: sql.Add(sliga + ' P.SAIR_TABELA_PRECO = ' + #39 + 'S' + #39);
                       1: sql.Add(sliga + ' (P.SAIR_TABELA_PRECO = ' + #39 + 'N' + #39 + ' OR P.SAIR_TABELA_PRECO IS NULL)');
                     end;

                     case ComboOrdem.ItemIndex of
                        0:sql.Add(' ORDER BY P.COD_LAB, P.COD_PRO');
                        1:sql.Add(' ORDER BY P.COD_LAB, P.NOME_PRO');
                        2:sql.add(' ORDER BY P.COD_LAB, P.REFERENCIA_PRO');
                     end;
                     open;
                     Application.CreateForm(TFrmQRelProdLab, FrmQRelProdLab);
                     FrmQRelProdLab.QRProd.DataSet   := FrmRelProduto.QRelSecaoLab;
                     FrmQRelProdLab.QRDBText1.DataSet:= FrmRelProduto.QRelSecaoLab;
                     FrmQRelProdLab.QRDBText2.DataSet:= FrmRelProduto.QRelSecaoLab;
                     FrmQRelProdLab.QRDBText3.DataSet:= FrmRelProduto.QRelSecaoLab;
                     FrmQRelProdLab.QRDBText5.DataSet:= FrmRelProduto.QRelSecaoLab;
                     FrmQRelProdLab.QRDBText6.DataSet:= FrmRelProduto.QRelSecaoLab;
                     FrmQRelProdLab.QRDBText7.DataSet:= FrmRelProduto.QRelSecaoLab;

                     FrmQRelProdLab.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
                     FrmQRelProdLab.QRLTitulo.Caption:= 'Relatório de Produto agrupado por Fabricante';

                     if sender = btnvis then
                        begin 
                           FrmQRelProdLab.QRProd.PreviewInitialState:= wsMaximized;
                           FrmQRelProdLab.QRProd.Preview;
                        end
                     else
                        begin 
                           FrmQRelProdLab.QRProd.PrinterSetup;
                           FrmQRelProdLab.QRProd.Print;
                        end;
                     FrmQRelProdLab.QRProd.QRPrinter:= nil;
                     close;
                  end;
            end;
        end;
    2:begin 
         with QRelSecaoLab do
            begin 
               close;
               sql.Clear;
               sql.Text:= sAuxSql;
               
               if not Check.Checked then
                  begin 
                     sql.Add(' WHERE P.COD_SEC BETWEEN ' + edtcodini.Text + ' AND ' + edtcodfin.Text);
                     sLiga:= ' AND ';
                  end
               else
                 sLiga:= ' WHERE ';

               case ComboAtivo.ItemIndex of
                  1: sql.Add(sliga + ' P.ATIVO_PRO = ' + #39 + 'S' + #39);
                  2: sql.Add(sliga + ' P.ATIVO_PRO = ' + #39 + 'N' + #39);
               end;

               case ComboPesados.ItemIndex of
                  0: begin 
                        sql.Add(sLiga + ' P.PRODUTO_PESADO_PRO IN (' + #39 + 'P' + #39 + ',' + #39 + 'P' + #39 + ')');
                        sLiga:= ' AND ';
                     end;
                  1: begin 
                        sql.Add(sLiga + ' P.PRODUTO_PESADO_PRO = ' + #39 + 'N' + #39);
                        sLiga:= ' AND ';
                      end;
               end;

               case ComboMarcados.ItemIndex of
                 0: sql.Add(' AND P.SAIR_TABELA_PRECO = ' + #39 + 'S' + #39);
                 1: sql.Add(' AND (P.SAIR_TABELA_PRECO = ' + #39 + 'N' + #39 + ' OR P.SAIR_TABELA_PRECO IS NULL)');
               end;

               case ComboOrdem.ItemIndex of
                  0:sql.Add(' ORDER BY P.COD_SEC, P.COD_PRO');
                  1:sql.Add(' ORDER BY P.COD_SEC, P.NOME_PRO');
                  2:sql.add(' ORDER BY P.COD_SEC, P.REFERENCIA_PRO');
               end;

               open;
               Application.CreateForm(TFrmQRelProdSecao, FrmQRelProdSecao);
               FrmQRelProdSecao.QRProd.DataSet   := FrmRelProduto.QRelSecaoLab;
               FrmQRelProdSecao.QRDBText1.DataSet:= FrmRelProduto.QRelSecaoLab;
               FrmQRelProdSecao.QRDBText2.DataSet:= FrmRelProduto.QRelSecaoLab;
               FrmQRelProdSecao.QRDBText3.DataSet:= FrmRelProduto.QRelSecaoLab;
               FrmQRelProdSecao.QRDBText5.DataSet:= FrmRelProduto.QRelSecaoLab;
               FrmQRelProdSecao.QRDBText6.DataSet:= FrmRelProduto.QRelSecaoLab;
               FrmQRelProdSecao.QRDBText7.DataSet:= FrmRelProduto.QRelSecaoLab;

               FrmQRelProdSecao.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
               FrmQRelProdSecao.QRLTitulo.Caption:= 'Relatório de Produto agrupado por Seção';
               if sender = btnvis then
                  begin 
                     FrmQRelProdSecao.QRProd.PreviewInitialState:= wsMaximized;
                     FrmQRelProdSecao.QRProd.Preview;
                  end
               else
                  begin 
                     FrmQRelProdSecao.QRProd.PrinterSetup;
                     FrmQRelProdSecao.QRProd.Print;
                  end;
               FrmQRelProdSecao.QRProd.QRPrinter:= nil;
               close;
            end;
      end;
   end;
   dm.IBTransaction.Commit;
end;

procedure TFrmRelProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QProdGeral.Close;
   QRelSecaoLab.SQL.Clear;
   QRelSecaoLab.SQL.Text:= sAuxSql;
   QRelSecaoLab.Close;
   Action:= caFree;
end;

procedure TFrmRelProduto.ComboTipoChange(Sender: TObject);
begin 
   if ComboTipo.ItemIndex = 0 then
      begin 
         gb.Enabled:= true;
         LimpaGB;
         gb.Enabled:= false;
         check.Visible:= false;
      end
   else
      if combotipo.ItemIndex = 1 then
         begin 
           gb.Enabled:= true;
           check.Visible:= true;
           check.Checked:= false;
           CheckClick(check);
           check.Caption:= 'Todos os Fabricantes';
           gb.Caption:= 'Fabricante Inicial/Final';
           edtcodini.SetFocus;
         end
      else
         if ComboTipo.ItemIndex = 2 then
            begin 
               gb.Enabled:= true;
               check.Visible:= true;
               check.Checked:= false;
               CheckClick(check);
               check.Caption:= 'Todos as Seções';
               gb.Caption:= 'Seção Inicial/Final';
               edtcodini.SetFocus;
            end;
end;

procedure TFrmRelProduto.BtnConsIniClick(Sender: TObject);
begin 
   if combotipo.ItemIndex = 1 then //fabricante
      begin 
         Application.CreateForm(TFrmConsLab, FrmConsLab);
         FrmConsLab.Tag:= 4;
         FrmConsLab.ShowModal;
      end
   else
      if ComboTipo.ItemIndex = 2 then //secao
         begin 
            Application.CreateForm(TFrmConsSecao, FrmConsSecao);
            FrmConsSecao.Tag:= 4;
            FrmConsSecao.ShowModal;
         end;
end;

procedure TFrmRelProduto.BtnConsFinClick(Sender: TObject);
begin 
   if combotipo.ItemIndex = 1 then //fabricante
      begin 
         Application.CreateForm(TFrmConsLab, FrmConsLab);
         FrmConsLab.Tag:= 5;
         FrmConsLab.ShowModal;
      end
   else
      if ComboTipo.ItemIndex = 2 then //secao
         begin 
            Application.CreateForm(TFrmConsSecao, FrmConsSecao);
            FrmConsSecao.Tag:= 5;
            FrmConsSecao.ShowModal;
         end;
end;

procedure TFrmRelProduto.EdtCodIniExit(Sender: TObject);
begin 
   if EdtCodIni.Text = '' then
      exit;
   if ComboTipo.ItemIndex = 1 then //laboratorio
      begin 
         EdtNomeIni.Text:= consulta('laboratorio', EdtCodIni, 'cod_lab', 'nome_lab', dm.IBTransaction, dm.qConsulta);
         if EdtNomeIni.Text = '' then
            begin 
               AlertaCad('Fabricante não Cadastrado');
//               EdtCodIni.SetFocus;
            end;
      end
   else
      if ComboTipo.ItemIndex = 2 then //secao
         begin 
            EdtNomeIni.Text:= consulta('secao', EdtCodIni, 'cod_sec', 'nome_sec', dm.IBTransaction, dm.qConsulta);
            if EdtNomeIni.Text = '' then
               begin 
                  AlertaCad('Seção não Cadastrada');
//                  EdtCodIni.SetFocus;
               end
         end;
end;

procedure TFrmRelProduto.EdtCodFinExit(Sender: TObject);
begin 
   if EdtCodFin.Text = '' then 
      exit;
   if ComboTipo.ItemIndex = 1 then //laboratorio
      begin 
         EdtNomeFin.Text:= consulta('laboratorio', EdtCodFin, 'cod_lab', 'nome_lab', dm.IBTransaction, dm.qConsulta);
         if EdtNomeFin.Text = '' then
            begin 
               AlertaCad('Fabricante não Cadastrado');
//               EdtCodFin.SetFocus;
               EdtCodFin.SelectAll;
            end;
      end
   else
      if ComboTipo.ItemIndex = 2 then //secao
         begin 
            EdtNomeFin.Text:= consulta('secao', EdtCodFin, 'cod_sec', 'nome_sec', dm.IBTransaction, dm.qConsulta);
            if EdtNomeFin.Text = '' then
               begin 
                  AlertaCad('Seção não Cadastrada');
//                  EdtCodFin.SetFocus;
                  EdtCodFin.SelectAll;
               end
         end;
end;

procedure TFrmRelProduto.EdtCodIniKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmRelProduto.EdtCodIniKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsIni.Click;
end;

procedure TFrmRelProduto.EdtCodFinKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsFin.Click;
end;

procedure TFrmRelProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmRelProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRelProduto.CheckClick(Sender: TObject);
begin 
   Check.Focused;
   LimpaGB;
   if Check.Checked then
      gb.Enabled:= false
   else
      begin 
         GB.Enabled:= true;
         edtcodini.SetFocus;
      end;
end;

procedure TFrmRelProduto.EdtCodIniEnter(Sender: TObject);
begin 
   edtcodini.SelectAll;
end;

procedure TFrmRelProduto.EdtCodFinEnter(Sender: TObject);
begin 
   edtcodfin.SelectAll;
end;

end.
