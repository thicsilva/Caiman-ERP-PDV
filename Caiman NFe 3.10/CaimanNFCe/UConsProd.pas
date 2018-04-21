unit UConsProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, DB, Grids, DBGrids, StdCtrls, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmConsProd = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    EdtConsulta: TEdit;
    BtnSair: TButton;
    DBGrid: TDBGrid;
    DSQConsProd: TDataSource;
    QConsProd: TFDQuery;
    QConsProdCOD_PRO: TIntegerField;
    QConsProdNOME_PRO: TStringField;
    QConsProdVALOR_PRO: TBCDField;
    QConsProdPROMOCAO_PRO: TBCDField;
    QConsProdESTOQUE: TBCDField;
    QParametros: TFDQuery;
    RDG: TRadioGroup;
    QConsProdPRECO_PRAZO_PRO: TBCDField;
    QParametrosMOSTRAR_ESTOQUE_VENDA: TStringField;
    QParametrosMOSTRAR_SOMENTE_PROD_COM_EST: TStringField;
    QConsProdCODIGO_BARRA_PRO: TStringField;
    QConsProdDESCRICAO: TStringField;
    QConsProdTIPO_PRODUCAO: TStringField;
    QConsProdREFERENCIA_PRO: TStringField;
    QConsProdCST_CF_EST: TStringField;
    QConsProdLOCALIZACAO_PRO: TStringField;
    QConsProdIAT: TStringField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridDblClick(Sender: TObject);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure EdtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure RDGClick(Sender: TObject);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsProd: TFrmConsProd;

implementation
uses
  Udm, UVendasCaixa, UPreVenda, UConsProdCodBarra, USelfService, UDavOrcamento, 
  UDAVOrdemServico, UMesas, UMenuFiscal, URegistrosPafEcf;
var  bMostrarProdEstoque : boolean;
     sSql : string;

{$R *.dfm}

procedure TFrmConsProd.BtnSairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmConsProd.FormShow(Sender: TObject);
begin
   sSql:= QConsProd.SQL.Text;
   rdg.ItemIndex:= 1;
   EdtConsulta.Clear;
   EdtConsulta.SetFocus;
end;

procedure TFrmConsProd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;

   QConsProd.sql.Clear;
   QConsProd.SQL.Text:= sSql;
   QConsProd.Close;

   Action:= caFree;
   Self := nil;
end;

procedure TFrmConsProd.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vK_f2 then
      begin
         Application.CreateForm(TFrmConsProdCodBarra, FrmConsProdCodBarra);
         FrmConsProdCodBarra.ShowModal;
      end
   else
      if key = vk_escape then
         close;
   if (ssAlt in Shift) and (chr(Key) in ['M', 'm']) then
      begin
         if (iCodPreVenda = 0) and (iCodOrcamento = 0) and (iCodOrdemServico = 0) and (iCodigoVenda = 0) and (iCodContaCliente = 0) then
            begin
               Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
               FrmMenuFiscal.showmodal;
            end;
      end;
end;

procedure TFrmConsProd.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   Keyy: Word;
   shiftt:TShiftState;
begin
   if key = vk_return then
      begin

         if Tag = 888 then
            begin
              frmRegistrosDoPafEcf.COD_PROParcial := QConsProdCODIGO_BARRA_PRO.AsString;
              frmRegistrosDoPafEcf.DescricaoParcial := QConsProdNOME_PRO.AsString;
              frmRegistrosDoPafEcf.COD_P := QConsProdCOD_PRO.AsInteger;
              Close;
              Exit;
            end;
         case FrmConsProd.Tag of
           0: begin
                 if not bEstoqueNegativo then
                    begin
                       if QConsProdESTOQUE.AsCurrency <= 0 then
                          begin
                             showmessage('Produto sem Estoque');
                             exit;
                             abort;
                          end;
                    end;

                 if not (trim(QConsProdCODIGO_BARRA_PRO.Text) = '') then
                    begin
                       FrmVendasCaixa.EdtCodBarra.Text:= FrmVendasCaixa.EdtCodBarra.Text + QConsProdCODIGO_BARRA_PRO.AsString;
                       FrmVendasCaixa.EdtCodBarra.SetFocus;
                       Keyy := VK_RETURN;
                       FrmVendasCaixa.EdtCodBarraKeyDown( nil, Keyy, shiftt );
                       FrmConsProd.Close;
                       exit;
                    end
                 else
                    showmessage('Produto sem Código de Barras');
              end;
           1: begin
                 if not bEstoqueNegativo then
                    begin
                       if QConsProdESTOQUE.AsCurrency <= 0 then
                          begin
                             showmessage('Produto sem Estoque');
                             exit;
                             abort;
                          end;
                    end;

                 FrmPreVenda.EdtCodPro.Text   := QConsProdCOD_PRO.AsString;
                 FrmPreVenda.EdtNomePro.Text  := QConsProdNOME_PRO.AsString;
                 FrmPreVenda.EdtCodPro.SetFocus;
                 FrmConsProd.Close;
                 exit;
              end;
           2: begin
                 FrmSelfService.EdtCodPro.Text   := QConsProdCOD_PRO.AsString;
                 FrmSelfService.EdtNomePro.Text  := QConsProdNOME_PRO.AsString;
                 FrmSelfService.EdtCodPro.SetFocus;
                 FrmConsProd.Close;
                 exit;
              end;
           3: begin
                 FrmDavOrcamento.EdtCodPro.Text   := QConsProdCOD_PRO.AsString;
                 FrmDavOrcamento.EdtNomePro.Text  := QConsProdNOME_PRO.AsString;
                 FrmDavOrcamento.EdtCodPro.SetFocus;
                 FrmConsProd.Close;
                 exit;
              end;
           4: begin
                 FrmDAVOrdemServico.EdtCodPro.Text   := QConsProdCOD_PRO.AsString;
                 FrmDAVOrdemServico.EdtNomePro.Text  := QConsProdNOME_PRO.AsString;
                 FrmDAVOrdemServico.EdtCodPro.SetFocus;
                 FrmConsProd.Close;
                 exit;
              end;
           5: begin
                 FrmMesas.EdtCodPro.Text   := QConsProdCOD_PRO.AsString;
                 FrmMesas.EdtNomePro.Text  := QConsProdNOME_PRO.AsString;
                 FrmMesas.EdtCodPro.SetFocus;
                 FrmConsProd.Close;
                 exit;
              end;
         end;
      end
   else
      if key = vk_f3 then
         EdtConsulta.SetFocus;
end;

procedure TFrmConsProd.DBGridDblClick(Sender: TObject);
var
   Keyy: Word;
   shiftt:TShiftState;
begin
         if Tag = 888 then
            begin
              frmRegistrosDoPafEcf.COD_PROParcial := QConsProdCODIGO_BARRA_PRO.AsString;
              frmRegistrosDoPafEcf.DescricaoParcial := QConsProdNOME_PRO.AsString;
              frmRegistrosDoPafEcf.COD_P := QConsProdCOD_PRO.AsInteger;
              Close;
              Exit;
            end;
   case FrmConsProd.Tag of
     0: begin
           if FrmConsProd.Tag = 0 then
              begin
                 if not (trim(QConsProdCODIGO_BARRA_PRO.Text) = '') then
                    begin
                       FrmVendasCaixa.EdtCodBarra.Text:= FrmVendasCaixa.EdtCodBarra.Text + QConsProdCODIGO_BARRA_PRO.AsString;
                       FrmVendasCaixa.EdtCodBarra.SetFocus;
                       Keyy := VK_RETURN;
                       FrmVendasCaixa.EdtCodBarraKeyDown( nil, Keyy, shiftt );
                       FrmConsProd.Close;
                       exit;
                    end
                 else
                    showmessage('Produto sem Código de Barras');
              end;
        end;
     1: begin
           FrmPreVenda.EdtCodPro.Text   := QConsProdCOD_PRO.AsString;
           FrmPreVenda.EdtNomePro.Text  := QConsProdNOME_PRO.AsString;
           FrmPreVenda.EdtCodPro.SetFocus;
           FrmConsProd.Close;
           exit;
        end;
     2: begin
           FrmSelfService.EdtCodPro.Text   := QConsProdCOD_PRO.AsString;
           FrmSelfService.EdtNomePro.Text  := QConsProdNOME_PRO.AsString;
           FrmSelfService.EdtCodPro.SetFocus;
           FrmConsProd.Close;
           exit;
        end;
     3: begin
           FrmDavOrcamento.EdtCodPro.Text   := QConsProdCOD_PRO.AsString;
           FrmDavOrcamento.EdtNomePro.Text  := QConsProdNOME_PRO.AsString;
           FrmDavOrcamento.EdtCodPro.SetFocus;
           FrmConsProd.Close;
           exit;
        end;
     4: begin
           FrmDAVOrdemServico.EdtCodPro.Text   := QConsProdCOD_PRO.AsString;
           FrmDAVOrdemServico.EdtNomePro.Text  := QConsProdNOME_PRO.AsString;
           FrmDAVOrdemServico.EdtCodPro.SetFocus;
           FrmConsProd.Close;
           exit;
        end;
     5: begin
           FrmMesas.EdtCodPro.Text   := QConsProdCOD_PRO.AsString;
           FrmMesas.EdtNomePro.Text  := QConsProdNOME_PRO.AsString;
           FrmMesas.EdtCodPro.SetFocus;
           FrmConsProd.Close;
           exit;
        end;
   end;
end;

procedure TFrmConsProd.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_return then
      begin
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with QConsProd do
           begin
              close;
              sql.Clear;
              sql.Text:= sSql;

              case rdg.ItemIndex of
                0: begin
                      if trim(EdtConsulta.Text) = '' then
                          begin
                             ShowMessage('Digite o código do produto');
                             EdtConsulta.SetFocus;
                             exit;
                          end;
                      SQL.Add(' WHERE P.COD_PRO = :CODPRO');
                      Parambyname('codpro').AsInteger:= strtoint(EdtConsulta.Text);
                   end;
                1: begin
                      sql.add(' WHERE P.NOME_PRO LIKE ' + #39 + trim(EdtConsulta.Text) + '%' + #39);
                   end;
                2: begin
                      sql.add(' WHERE P.REFERENCIA_PRO LIKE ' + #39 + trim(EdtConsulta.Text) + '%' + #39);
                   end;
              end;

              sql.add(' AND P.ATIVO_PRO = ' + #39 + 'S' + #39);

              if bMostrarProdEstoque then
                 sql.add(' AND (SELECT SUM(E.ESTOQUE) ESTOQUE FROM ESTOQUE E WHERE E.COD_PRO = P.COD_PRO AND E.COD_EMP = :CODEMP) > 0 ');

              sql.add(' ORDER BY P.NOME_PRO');

              Parambyname('codemp').AsInteger:= iEmp;
              Open;

              if recordcount > 0 then
                 begin
                    dbgrid.SetFocus;
                    DBGrid.SelectedIndex:= 2;
                 end
              else
                 begin
                    EdtConsulta.SetFocus;
                    EdtConsulta.SelectAll;
                 end;
           end;
      end
   else
      if key = vk_escape then
         close;
end;

procedure TFrmConsProd.FormCreate(Sender: TObject);
begin
   dm.ScaleForm( Self, False );
   if iTabelaPreco = 1 then
      begin
         FrmConsProd.Caption:= 'Tabela de Produtos [Tabela 02 - Preço A Prazo]';
         DBGrid.Columns[5].Visible:= false;
      end
   else
      begin
         FrmConsProd.Caption:='Tabela de Produtos [Tabela 01 - Preço Normal - A Vista]';
         DBGrid.Columns[6].Visible:= false;
      end;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QParametros do
          begin
             close;
             Parambyname('codemp').AsInteger:= iEmp;
             open;
             if (trim(QParametrosMOSTRAR_ESTOQUE_VENDA.AsString) = 'N') or (QParametrosMOSTRAR_ESTOQUE_VENDA.IsNull) then
                DBGrid.Columns.Items[3].Visible:= false
             else
                DBGrid.Columns.Items[3].Visible:= true;

             if trim(QParametrosMOSTRAR_SOMENTE_PROD_COM_EST.AsString) = 'S' then
                bMostrarProdEstoque:= true
             else
                bMostrarProdEstoque:= false;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao Verificar se mostra estoque');
     end;
   finally
     QParametros.Close;
   end;
end;

procedure TFrmConsProd.EdtConsultaKeyPress(Sender: TObject; var Key: Char);
begin
   if rdg.ItemIndex = 0 then
      begin
         if not (key in ['0'..'9', #13, #8]) then
            key:= #0;
      end;
end;

procedure TFrmConsProd.RDGClick(Sender: TObject);
begin
   EdtConsulta.Clear;
   EdtConsulta.SetFocus;
end;

procedure TFrmConsProd.DBGridKeyPress(Sender: TObject; var Key: Char);
begin
   if key in ['a'..'z', 'A'..'Z'] then
      QConsProd.Locate('nome_pro', key, [lopartialkey,locaseinsensitive]);
end;

end.
