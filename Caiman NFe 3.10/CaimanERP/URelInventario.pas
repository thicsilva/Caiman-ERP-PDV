Unit URelInventario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, DB, ComCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmRelInventario = class(UNovoFormulario.TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    StatusBar1: TStatusBar;
    QBuscaEmp: TFDQuery;
    QBuscaEmpCNPJ_EMP: TStringField;
    QBuscaEmpINSC_EMP: TStringField;
    Panel3: TPanel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    ComboCons: TComboBox;
    Panel4: TPanel;
    LTipo: TLabel;
    BtnOK: TBitBtn;
    DBGrid1: TDBGrid;
    QConsInvent: TFDQuery;
    DSInvent: TDataSource;
    QConsInventCOD_INVENTARIO: TIntegerField;
    QConsInventDATA_INVENTARIO: TDateField;
    QConsInventCOD_EMP: TIntegerField;
    BtnExcluir: TBitBtn;
    EdtCons: TMaskEdit;
    QItensInventario: TFDQuery;
    CheckPrecoVenda: TCheckBox;
    Label2: TLabel;
    EdtPagInicial: UNovosComponentes.TEdit;
    CheckImpSubTotal: TCheckBox;
    QTotaisGrupo: TFDQuery;
    QTotaisGrupoTOTAL: TFloatField;
    QTotaisGrupoNOME_GRP: TStringField;
    CheckResumoPisCofins: TCheckBox;
    QResumoPis: TFDQuery;
    QItensInventarioCOD_PRO: TIntegerField;
    QItensInventarioCUSTO: TBCDField;
    QItensInventarioPRECO_VENDA: TBCDField;
    QItensInventarioQUANT: TBCDField;
    QItensInventarioTOTAL: TFloatField;
    QItensInventarioTOTAL_PRECO_VENDA: TFMTBCDField;
    QItensInventarioNOME_PRO: TStringField;
    QItensInventarioICMS_CF_EST: TIntegerField;
    QItensInventarioNOME_GRP: TStringField;
    QItensInventarioDESCRICAO: TStringField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboConsChange(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnImpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtPagInicialKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelInventario: TFrmRelInventario;

implementation
uses
  Udm, Ubibli1, UQRelInvent, UNovoPrincipal, UQRelInventPrecoVenda, 
  UQRelResInventarioPis;
var  sAuxSql : string;
{$R *.dfm}

procedure TFrmRelInventario.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelInventario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   QItensInventario.SQL.Text:= sAuxSql;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QConsInvent.Close;
   QBuscaEmp.Close;

   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   QItensInventario.Close;
   Action:= caFree;
end;

procedure TFrmRelInventario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRelInventario.ComboConsChange(Sender: TObject);
begin 
   LTipo.Caption:= ComboCons.Text;
   EdtCons.Clear;
   if ComboCons.ItemIndex = 0 then
      edtcons.EditMask:= ''
   else
      EdtCons.EditMask:= '!99/99/9999;1;_';
end;

procedure TFrmRelInventario.BtnOKClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsInvent do
      begin 
         close;
         sql.Clear;
         sql.Add('SELECT * FROM INVENTARIO_ESTOQUE');
         case ComboCons.ItemIndex of
          0: begin 
                if EdtCons.Text <> '' then
                   begin 
                      sql.add(' WHERE COD_INVENTARIO = :COD');
                      parambyname('cod').AsInteger:= strtoint(EdtCons.Text);
                   end;
             end;
          1: begin 
                if EdtCons.Text <> '  /  /    ' then
                   begin 
                      sql.add(' WHERE DATA_INVENTARIO = :DATA');
                      parambyname('data').AsDate:= StrToDate(EdtCons.Text);
                   end;
             end;
         end;
         sql.add(' ORDER BY DATA_INVENTARIO, COD_INVENTARIO');
         open;
      end;
end;

procedure TFrmRelInventario.BtnExcluirClick(Sender: TObject);
var iAux : integer;
begin 
   iAux:= QConsInventCOD_INVENTARIO.AsInteger;
   if Application.MessageBox('Confirma a exclusão do Inventário?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         QConsInvent.Close;
         try
           try
             with dm.QConsulta do
                begin 
                   close;
                   sql.Clear;
                   sql.add('DELETE FROM INVENTARIO_ESTOQUE ' +
                           'WHERE COD_INVENTARIO = :COD');
                   Parambyname('cod').AsInteger:= iAux;
                   ExecOrOpen;
                end;
             dm.IBTransaction.Commit;
           except
             dm.IBTransaction.Rollback;
             AlertaCad('Erro ao excluir o inventário');
           end;
         finally
           dm.QConsulta.Close;
           BtnOK.Click;
         end;
      end;
end;

procedure TFrmRelInventario.BtnImpClick(Sender: TObject);
var sAuxCNPJ, sAuxInsc : string;
    iContador : integer;
    cTotalGrupos : currency;
    cTotaIsentoPis, cTotalNormalPis : currency;

procedure imprimeTotais(const iAux : integer);
begin 
   FrmQRelInvent.QRLabel5.Enabled       := true;
   FrmQRelInvent.QRLTotalGrupo.Enabled  := true;
   FrmQRelInvent.QRLTotalGrupos.Enabled := true;
   
   case iAux of
     1: begin 
           FrmQRelInvent.QRLGrupo1.Enabled        := true;
           FrmQRelInvent.QRLTotalGrupo1.Enabled   := true;
           FrmQRelInvent.QRLGrupo1.Caption        := QTotaisGrupoNOME_GRP.AsString;
           FrmQRelInvent.QRLTotalGrupo1.Caption   := currtostrf(QTotaisGrupoTOTAL.AsCurrency, ffnumber, 2);
           FrmQRelInvent.QRLTotalGrupo.Top        := FrmQRelInvent.QRLTotalGrupo1.Top + 16;
           FrmQRelInvent.QRLTotalGrupos.Top       := FrmQRelInvent.QRLTotalGrupo1.Top + 16;
           FrmQRelInvent.SummaryBand1.Height      := FrmQRelInvent.QRLTotalGrupo1.Top + 16;
        end;
     2: begin 
           FrmQRelInvent.QRLGrupo2.Enabled        := true;
           FrmQRelInvent.QRLTotalGrupo2.Enabled   := true;
           FrmQRelInvent.QRLGrupo2.Caption        := QTotaisGrupoNOME_GRP.AsString;
           FrmQRelInvent.QRLTotalGrupo2.Caption   := currtostrf(QTotaisGrupoTOTAL.AsCurrency, ffnumber, 2);
           FrmQRelInvent.QRLTotalGrupo.Top        := FrmQRelInvent.QRLTotalGrupo2.Top + 16;
           FrmQRelInvent.QRLTotalGrupos.Top       := FrmQRelInvent.QRLTotalGrupo2.Top + 16;
           FrmQRelInvent.SummaryBand1.Height      := FrmQRelInvent.QRLTotalGrupo2.Top + 16;
        end;
     3: begin 
           FrmQRelInvent.QRLGrupo3.Enabled        := true;
           FrmQRelInvent.QRLTotalGrupo3.Enabled   := true;
           FrmQRelInvent.QRLGrupo3.Caption        := QTotaisGrupoNOME_GRP.AsString;
           FrmQRelInvent.QRLTotalGrupo3.Caption   := currtostrf(QTotaisGrupoTOTAL.AsCurrency, ffnumber, 2);
           FrmQRelInvent.QRLTotalGrupo.Top        := FrmQRelInvent.QRLTotalGrupo3.Top + 16;
           FrmQRelInvent.QRLTotalGrupos.Top       := FrmQRelInvent.QRLTotalGrupo3.Top + 16;
           FrmQRelInvent.SummaryBand1.Height      := FrmQRelInvent.QRLTotalGrupo3.Top + 16;
        end;
     4: begin 
           FrmQRelInvent.QRLGrupo4.Enabled        := true;
           FrmQRelInvent.QRLTotalGrupo4.Enabled   := true;
           FrmQRelInvent.QRLGrupo4.Caption        := QTotaisGrupoNOME_GRP.AsString;
           FrmQRelInvent.QRLTotalGrupo4.Caption   := currtostrf(QTotaisGrupoTOTAL.AsCurrency, ffnumber, 2);
           FrmQRelInvent.QRLTotalGrupo.Top        := FrmQRelInvent.QRLTotalGrupo4.Top + 16;
           FrmQRelInvent.QRLTotalGrupos.Top       := FrmQRelInvent.QRLTotalGrupo4.Top + 16;
           FrmQRelInvent.SummaryBand1.Height      := FrmQRelInvent.QRLTotalGrupo4.Top + 16;
        end;
     5: begin 
           FrmQRelInvent.QRLGrupo5.Enabled        := true;
           FrmQRelInvent.QRLTotalGrupo5.Enabled   := true;
           FrmQRelInvent.QRLGrupo5.Caption        := QTotaisGrupoNOME_GRP.AsString;
           FrmQRelInvent.QRLTotalGrupo5.Caption   := currtostrf(QTotaisGrupoTOTAL.AsCurrency, ffnumber, 2);
           FrmQRelInvent.QRLTotalGrupo.Top        := FrmQRelInvent.QRLTotalGrupo5.Top + 16;
           FrmQRelInvent.QRLTotalGrupos.Top       := FrmQRelInvent.QRLTotalGrupo5.Top + 16;
           FrmQRelInvent.SummaryBand1.Height      := FrmQRelInvent.QRLTotalGrupo5.Top + 16;
        end;
     6: begin 
           FrmQRelInvent.QRLGrupo6.Enabled        := true;
           FrmQRelInvent.QRLTotalGrupo6.Enabled   := true;
           FrmQRelInvent.QRLGrupo6.Caption        := QTotaisGrupoNOME_GRP.AsString;
           FrmQRelInvent.QRLTotalGrupo6.Caption   := currtostrf(QTotaisGrupoTOTAL.AsCurrency, ffnumber, 2);
           FrmQRelInvent.QRLTotalGrupo.Top        := FrmQRelInvent.QRLTotalGrupo6.Top + 16;
           FrmQRelInvent.QRLTotalGrupos.Top       := FrmQRelInvent.QRLTotalGrupo6.Top + 16;
           FrmQRelInvent.SummaryBand1.Height      := FrmQRelInvent.QRLTotalGrupo6.Top + 16;
        end;
     7: begin 
           FrmQRelInvent.QRLGrupo7.Enabled        := true;
           FrmQRelInvent.QRLTotalGrupo7.Enabled   := true;
           FrmQRelInvent.QRLGrupo7.Caption        := QTotaisGrupoNOME_GRP.AsString;
           FrmQRelInvent.QRLTotalGrupo7.Caption   := currtostrf(QTotaisGrupoTOTAL.AsCurrency, ffnumber, 2);
           FrmQRelInvent.QRLTotalGrupo.Top        := FrmQRelInvent.QRLTotalGrupo7.Top + 16;
           FrmQRelInvent.QRLTotalGrupos.Top       := FrmQRelInvent.QRLTotalGrupo7.Top + 16;
           FrmQRelInvent.SummaryBand1.Height      := FrmQRelInvent.QRLTotalGrupo7.Top + 16;
        end;
     8: begin 
           FrmQRelInvent.QRLGrupo8.Enabled        := true;
           FrmQRelInvent.QRLTotalGrupo8.Enabled   := true;
           FrmQRelInvent.QRLGrupo8.Caption        := QTotaisGrupoNOME_GRP.AsString;
           FrmQRelInvent.QRLTotalGrupo8.Caption   := currtostrf(QTotaisGrupoTOTAL.AsCurrency, ffnumber, 2);
           FrmQRelInvent.QRLTotalGrupo.Top        := FrmQRelInvent.QRLTotalGrupo8.Top + 16;
           FrmQRelInvent.QRLTotalGrupos.Top       := FrmQRelInvent.QRLTotalGrupo8.Top + 16;
           FrmQRelInvent.SummaryBand1.Height      := FrmQRelInvent.QRLTotalGrupo8.Top + 16;
        end;
     9: begin 
           FrmQRelInvent.QRLGrupo9.Enabled        := true;
           FrmQRelInvent.QRLTotalGrupo9.Enabled   := true;
           FrmQRelInvent.QRLGrupo9.Caption        := QTotaisGrupoNOME_GRP.AsString;
           FrmQRelInvent.QRLTotalGrupo9.Caption   := currtostrf(QTotaisGrupoTOTAL.AsCurrency, ffnumber, 2);
           FrmQRelInvent.QRLTotalGrupo.Top        := FrmQRelInvent.QRLTotalGrupo9.Top + 16;
           FrmQRelInvent.QRLTotalGrupos.Top       := FrmQRelInvent.QRLTotalGrupo9.Top + 16;
           FrmQRelInvent.SummaryBand1.Height      := FrmQRelInvent.QRLTotalGrupo9.Top + 16;
        end;
     10: begin 
            FrmQRelInvent.QRLGrupo10.Enabled      := true;
            FrmQRelInvent.QRLTotalGrupo10.Enabled := true;
            FrmQRelInvent.QRLGrupo10.Caption      := QTotaisGrupoNOME_GRP.AsString;
            FrmQRelInvent.QRLTotalGrupo10.Caption := currtostrf(QTotaisGrupoTOTAL.AsCurrency, ffnumber, 2);
            FrmQRelInvent.QRLTotalGrupo.Top       := FrmQRelInvent.QRLTotalGrupo10.Top  + 16;
            FrmQRelInvent.QRLTotalGrupos.Top      := FrmQRelInvent.QRLTotalGrupo10.Top  + 16;
            FrmQRelInvent.SummaryBand1.Height      := FrmQRelInvent.QRLTotalGrupo10.Top + 16;
         end;
   end;
end;

begin 
   cTotaIsentoPis := 0;
   cTotalNormalPis:= 0;

   if CheckResumoPisCofins.Checked then
      begin 
         {busca os dados da empresa}
         if dm.IBTRAux.Active then
            dm.IBTRAux.Commit;
         dm.IBTRAux.StartTransaction;
         try
           try
             with QResumoPis do
                begin 
                   close;
                   sql.Clear;
                   sql.add('SELECT SUM(I.CUSTO * I.QUANT) TOTAL ' +
                           'FROM ITENS_INVENTARIO_ESTOQUE I ' +
                           'INNER JOIN PRODUTO P ' +
                           'ON (I.COD_PRO = P.COD_PRO) ' +
                           'WHERE I.COD_INVENTARIO = :COD ' +
                           'AND P.ISENTO_PIS_COFINS_PRO = ' + #39 + 'S' + #39);
                   Parambyname('cod').AsInteger:= QConsInventCOD_INVENTARIO.AsInteger;
                   Open;
                   cTotaIsentoPis:= fieldbyname('total').AsCurrency;

                   sql.Clear;
                   sql.add('SELECT SUM(I.CUSTO * I.QUANT) TOTAL ' +
                           'FROM ITENS_INVENTARIO_ESTOQUE I ' +
                           'INNER JOIN PRODUTO P ' +
                           'ON (I.COD_PRO = P.COD_PRO) ' +
                           'WHERE I.COD_INVENTARIO = :COD ' +
                           'AND P.ISENTO_PIS_COFINS_PRO = ' + #39 + 'N' + #39);
                   Parambyname('cod').AsInteger:= QConsInventCOD_INVENTARIO.AsInteger;
                   Open;
                   cTotalNormalPis:= fieldbyname('total').AsCurrency;
                end;
             dm.IBTRAux.Commit;
           except
             dm.IBTRAux.Rollback;
             AlertaCad('Erro ao gerar relatório sobre pis/cofins');
           end;
         finally
           QResumoPis.Close;
         end;

         Application.CreateForm(TFrmQRelResInventarioPis, FrmQRelResInventarioPis);
         FrmQRelResInventarioPis.QRLNomeEmpresa.Caption:= FrmMenu.SB.Panels[3].Text;
         FrmQRelResInventarioPis.QRLTitulo.Caption  := 'Inventário de Estoque no dia: ' + QConsInventDATA_INVENTARIO.AsString;
         FrmQRelResInventarioPis.QRLTitulo2.Caption := 'Resumo Pis/Cofins';
         FrmQRelResInventarioPis.QRLIsento.Caption  := 'R$ ' +  currtostrf(cTotaIsentoPis, ffnumber, 2);
         FrmQRelResInventarioPis.QRLNormal.Caption  := 'R$ ' + currtostrf(cTotalNormalPis, ffnumber, 2);
         FrmQRelResInventarioPis.QRLTotal.Caption   := 'R$ ' + currtostrf(cTotaIsentoPis + cTotalNormalPis, ffnumber, 2);
         FrmQRelResInventarioPis.QRInvent.PreviewInitialState:= wsMaximized;
         FrmQRelResInventarioPis.QRInvent.Preview;
         FrmQRelResInventarioPis.QRInvent.QRPrinter:= nil;
      end
   else
      begin 
         if dm.IBTRAux.Active then
            dm.IBTRAux.Commit;
         dm.IBTRAux.StartTransaction;
         try
           try
             with QBuscaEmp do
                begin 
                   close;
                   Parambyname('codemp').AsInteger:= iEmp;
                   open;
                   sAuxCNPJ:= fieldbyname('cnpj_emp').AsString;
                   sAuxInsc:= fieldbyname('insc_emp').AsString;
                end;
             dm.IBTRAux.Commit;
           except
             dm.IBTRAux.Rollback;
             AlertaCad('Erro ao buscar os dados da empresa');
           end;
         finally
           QBuscaEmp.Close;
         end;

         if Application.MessageBox('Agrupar por Grupo de ICMS?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
            begin 
               if dm.IBTRAux.Active then
                  dm.IBTRAux.Commit;
               dm.IBTRAux.StartTransaction;
               with QItensInventario do
                  begin 
                     close;
                     sql.Clear;
                     sql.Text:= sAuxSql;
                     sql.Add(' ORDER BY P.ICMS_CF_EST, P.NOME_PRO');
                     parambyname('cod').AsInteger:= QConsInventCOD_INVENTARIO.AsInteger;
                     open;
                  end;
               if not CheckPrecoVenda.Checked then
                  begin 
                     Application.CreateForm(TFrmQRelInvent, FrmQRelInvent);
                     FrmQRelInvent.SummaryBand1.Height:= 65;

                     { busca os totais por grupo de icms }
                     QTotaisGrupo.Close;
                     QTotaisGrupo.parambyname('cod').AsInteger:= QConsInventCOD_INVENTARIO.AsInteger;
                     QTotaisGrupo.open;
                     iContador   := 1;
                     cTotalGrupos:= 0;
                     while not QTotaisGrupo.eof do
                         begin 
                            imprimeTotais(iContador);
                            inc(iContador);
                            cTotalGrupos:= cTotalGrupos + QTotaisGrupoTOTAL.AsCurrency;
                            QTotaisGrupo.Next;
                         end;
                     QTotaisGrupo.Close;
                     FrmQRelInvent.QRLTotalGrupos.Caption:= currtostrf(cTotalGrupos, ffnumber, 2);


                     if CheckImpSubTotal.Checked then
                        FrmQRelInvent.PageFooterBand1.Enabled:= true
                     else
                        FrmQRelInvent.PageFooterBand1.Enabled:= false;
                     FrmQRelInvent.QRLNomeEmpresa.Caption:= FrmMenu.SB.Panels[3].Text;
                     FrmQRelInvent.QRLCNPJ.Caption        :=  sAuxCNPJ;
                     FrmQRelInvent.QRLInscEstadual.Caption:= sAuxInsc;
                     FrmQRelInvent.QRLData.Caption        := QConsInventDATA_INVENTARIO.AsString;
                     FrmQRelInvent.QRExpr3.Expression     := 'pagenumber + ' + trim(inttostr(strtoint(EdtPagInicial.Text) - 1));
                     FrmQRelInvent.QRInvent.PreviewInitialState:= wsMaximized;
                     FrmQRelInvent.QRInvent.Preview;
                     FrmQRelInvent.QRInvent.QRPrinter:= nil;
                  end
               else
                  begin 
                     Application.CreateForm(TFrmQRelInventPrecoVenda, FrmQRelInventPrecoVenda);
                     FrmQRelInventPrecoVenda.QRLNomeEmpresa.Caption:= FrmMenu.SB.Panels[3].Text;
                     FrmQRelInventPrecoVenda.QRLCNPJ.Caption:= 'CNPJ: ' + sAuxCNPJ + '    Insc.Estadual: ' + sAuxInsc;
                     FrmQRelInventPrecoVenda.QRLTitulo.Caption     := 'Inventário de Estoque no dia: ' + QConsInventDATA_INVENTARIO.AsString;
                     FrmQRelInventPrecoVenda.QRInvent.PreviewInitialState:= wsMaximized;
                     FrmQRelInventPrecoVenda.QRInvent.Preview;
                     FrmQRelInventPrecoVenda.QRInvent.QRPrinter:= nil;
                  end;
               dm.IBTRAux.Commit;
               QItensInventario.Close;
            end
         else
            begin 
               if dm.IBTRAux.Active then
                  dm.IBTRAux.Commit;
               dm.IBTRAux.StartTransaction;
               with QItensInventario do
                  begin 
                     close;
                     sql.Clear;
                     sql.Text:= sAuxSql;
                     sql.Add(' ORDER BY P.NOME_PRO');
                     parambyname('cod').AsInteger:= QConsInventCOD_INVENTARIO.AsInteger;
                     open;
                  end;
               if not CheckPrecoVenda.Checked then
                  begin 
                     Application.CreateForm(TFrmQRelInvent, FrmQRelInvent);
                     if CheckImpSubTotal.Checked then
                        FrmQRelInvent.PageFooterBand1.Enabled:= true
                     else
                        FrmQRelInvent.PageFooterBand1.Enabled:= false;
                     FrmQRelInvent.QRGroup1.Enabled:= false;
                     FrmQRelInvent.QRBand1.Enabled := false;
                     FrmQRelInvent.QRLNomeEmpresa.Caption:= FrmMenu.SB.Panels[3].Text;
                     FrmQRelInvent.QRLCNPJ.Caption         := sAuxCNPJ;
                     FrmQRelInvent.QRLInscEstadual.Caption := sAuxInsc;
                     FrmQRelInvent.QRLData.Caption         := QConsInventDATA_INVENTARIO.AsString;
                     FrmQRelInvent.QRInvent.PreviewInitialState:= wsMaximized;
                     FrmQRelInvent.QRInvent.Preview;
                     FrmQRelInvent.QRInvent.QRPrinter:= nil;
                  end
               else
                  begin 
                     Application.CreateForm(TFrmQRelInventPrecoVenda, FrmQRelInventPrecoVenda);
                     FrmQRelInventPrecoVenda.QRGroup1.Enabled:= false;
                     FrmQRelInventPrecoVenda.QRBand1.Enabled := false;
                     FrmQRelInventPrecoVenda.QRLNomeEmpresa.Caption:= FrmMenu.SB.Panels[3].Text;
                     FrmQRelInventPrecoVenda.QRLCNPJ.Caption:= 'CNPJ: ' + sAuxCNPJ + '    Insc.Estadual: ' + sAuxInsc;
                     FrmQRelInventPrecoVenda.QRLTitulo.Caption:= 'Inventário de Estoque no dia: ' + QConsInventDATA_INVENTARIO.AsString;
                     FrmQRelInventPrecoVenda.QRInvent.PreviewInitialState:= wsMaximized;
                     FrmQRelInventPrecoVenda.QRInvent.Preview;
                     FrmQRelInventPrecoVenda.QRInvent.QRPrinter:= nil;
                  end;
               dm.IBTRAux.Commit;
               QItensInventario.Close;
            end;
      end;
end;

procedure TFrmRelInventario.FormCreate(Sender: TObject);
begin 
   
   sAuxSql:= QItensInventario.SQL.Text;
end;

procedure TFrmRelInventario.FormShow(Sender: TObject);
begin 
   EdtPagInicial.Text:= '1';
   ComboCons.ItemIndex:= 0;
   CheckImpSubTotal.Checked:= false;
end;

procedure TFrmRelInventario.EdtPagInicialKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

end.
