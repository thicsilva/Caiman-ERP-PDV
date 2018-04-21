unit UConsEntrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, Mask, 
  rxPlacemnt, rxToolEdit, rxCurrEdit, UNovosComponentes, UNovoFormulario, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmConsEntrada = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    CheckEmp: TCheckBox;
    GB3: TGroupBox;
    BtnConsFor: TsSpeedButton;
    EdtCodFor: UNovosComponentes.TEdit;
    EdtNomeFor: TEdit;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    BtnOk: TButton;
    BtnSair: TButton;
    GroupBox1: TGroupBox;
    ComboCons: TComboBox;
    DBGrid1: TDBGrid;
    BtnLocalizar: TButton;
    QConsEnt: TFDQuery;
    DSQConsEnt: TDataSource;
    QConsEntCOD_ENT: TIntegerField;
    QConsEntCOD_EMP: TIntegerField;
    QConsEntDATAEMI_ENT: TDateField;
    QConsEntDATAENT_ENT: TDateField;
    QConsEntCOD_FOR: TIntegerField;
    QConsEntTOTAL_ENT: TBCDField;
    QConsEntACRES_ENT: TBCDField;
    QConsEntDESC_ENT: TBCDField;
    QConsEntFRETE_ENT: TBCDField;
    QConsEntICMSFRETE_ENT: TBCDField;
    QConsEntRAZAO_FOR: TStringField;
    EdtCod: TEdit;
    QConsEntTIPO_ENT: TStringField;
    QConsEntNUMNF_ENT: TStringField;
    Label2: TLabel;
    EdtTotal: TCurrencyEdit;
    QConsEntSERIE_ENT: TStringField;
    QConsEntBASE_SUB_TRIB: TBCDField;
    QConsEntVALOR_ICMS_SUB: TBCDField;
    QConsEntFRETE_INCLUSO: TStringField;
    QConsEntICMS_SUB_INCLUSO: TStringField;
    QConsEntCALC_TIPO: TStringField;
    QConsEntTOTAL_PRODUTOS: TBCDField;
    QConsEntCUSTO_SEM_DESCONTO: TStringField;
    QConsEntCODIFICACAO_FISCAL: TStringField;
    QConsEntCODIGO_ES: TIntegerField;
    QConsEntNOME_ES: TStringField;
    BtnItens: TButton;
    procedure EdtCodForExit(Sender: TObject);
    procedure BtnConsForClick(Sender: TObject);
    procedure EdtCodForKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboConsChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure EdtCodForKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodForEnter(Sender: TObject);
    procedure QConsEntCalcFields(DataSet: TDataSet);
    procedure BtnItensClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsEntrada: TFrmConsEntrada;

implementation
uses
  Udm, Ubibli1, UConsFor, UEntradas, UItensEntradas, UNovoPrincipal;
var  sSql : string;

{$R *.dfm}

procedure TFrmConsEntrada.EdtCodForExit(Sender: TObject);
begin 
   if (combocons.Focused) or (btnsair.Focused) then
      exit;
   EdtNomeFor.Text:= consulta('fornecedor', edtcodfor, 'cod_for', 'razao_for', dm.IBTransaction, dm.qConsulta);
   if edtnomefor.Text = '' then
      begin 
         AlertaCad('Fornecedor não Cadastrado');
//         edtcodfor.SetFocus;
      end;
end;

procedure TFrmConsEntrada.BtnConsForClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsFor, FrmConsFor);
   FrmConsFor.tag:= 7;
   FrmConsFor.showmodal;
end;

procedure TFrmConsEntrada.EdtCodForKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsFor.Click;
end;

procedure TFrmConsEntrada.ComboConsChange(Sender: TObject);
begin 
   case combocons.ItemIndex of
    0:begin 
         gb3.Enabled          := true;
         gb3.Caption          := 'Código';
         gb2.Enabled          := false;
         edtcodfor.Visible    := false;
         BtnConsFor.Visible   := false;
         EdtNomeFor.Visible   := false;
         EdtCod.Visible       := true;
         edtcod.Clear;
      end;
    1,2: begin 
            gb2.Enabled:= true;
            gb3.Enabled:= false;
         end;
    3:begin 
         gb3.Enabled          := true;
         gb3.Caption          := 'Fornecedor';
         gb2.Enabled          := true;
         edtcodfor.Visible    := true;
         BtnConsFor.Visible   := true;
         EdtNomeFor.Visible   := true;
         EdtCod.Visible       := false;
         edtcodfor.Clear;
         edtnomefor.Clear;
      end;
    4:begin 
         gb3.Enabled          := true;
         gb3.Caption          := 'Num.da Nota Fiscal';
         gb2.Enabled          := false;
         edtcodfor.Visible    := false;
         BtnConsFor.Visible   := false;
         EdtNomeFor.Visible   := false;
         EdtCod.Visible       := true;
         edtcod.Clear;
      end;
   end;
end;

procedure TFrmConsEntrada.FormShow(Sender: TObject);
begin 
   {busca a posicao do combo}
   try
     ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsEntrada.ComboCons'));
   except
     ComboCons.ItemIndex:= 0;
   end;

   sSql:= QConsEnt.SQL.Text;
   EdtTotal.Clear;
   edtdataini.Date:= date;
   edtdatafin.Date:= date;
   ComboConsChange(sender);
end;

procedure TFrmConsEntrada.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsEntrada.BtnOkClick(Sender: TObject);
var vl_total : real;
begin 
   vl_total:= 0;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsEnt do
      begin 
         close;
         sql.Clear;
         sql.Text:= sSql;
         case combocons.ItemIndex of
           0:begin 
                if not (EdtCod.Text = '') then
                   begin 
                      sql.Add(' WHERE E.COD_ENT = ' + edtcod.Text);
                      if (not CheckEmp.Checked) then
                         begin 
                            sql.Add(' AND E.COD_EMP = :CODEMP');
                            Parambyname('codemp').AsInteger:= iEmp;
                         end;
                      open;
                   end
                else
                   begin 
                      if (not CheckEmp.Checked) then
                         begin 
                            sql.Add(' WHERE E.COD_EMP = :CODEMP');
                            Parambyname('codemp').AsInteger:= iEmp;
                         end;
                      sql.Add(' ORDER BY E.COD_ENT');
                      open;
                   end;
             end;
           1:begin 
                sql.Add(' WHERE E.DATAEMI_ENT BETWEEN :DATAINI AND :DATAFIN');
                if (not CheckEmp.Checked) then
                   begin 
                      sql.Add(' AND E.COD_EMP = :CODEMP');
                      Parambyname('codemp').AsInteger:= iEmp;
                   end;
                SQL.Add(' ORDER BY E.DATAEMI_ENT, E.COD_ENT');
                Parambyname('dataini').AsDate  := edtdataini.Date;
                Parambyname('datafin').AsDate  := edtdatafin.Date;
                open;
             end;
           2:begin 
                sql.Add(' WHERE E.DATAENT_ENT BETWEEN :DATAINI AND :DATAFIN');
                if (not CheckEmp.Checked) then
                   begin 
                      sql.Add(' AND E.COD_EMP = :CODEMP');
                      Parambyname('codemp').AsInteger:= iEmp;
                   end;
                SQL.Add(' ORDER BY E.DATAENT_ENT, E.COD_ENT');
                Parambyname('dataini').AsDate  := edtdataini.Date;
                Parambyname('datafin').AsDate  := edtdatafin.Date;
                open;
             end;
           3:begin 
                sql.Add(' WHERE E.DATAENT_ENT BETWEEN :DATAINI AND :DATAFIN ' +
                        'AND E.COD_FOR = ' + edtcodfor.Text);
                if (not CheckEmp.Checked) then
                   begin 
                      sql.Add(' AND E.COD_EMP = :CODEMP');
                      Parambyname('codemp').AsInteger:= iEmp;
                   end;
                SQL.Add(' ORDER BY E.DATAENT_ENT, E.COD_ENT');
                Parambyname('dataini').AsDate  := edtdataini.Date;
                Parambyname('datafin').AsDate  := edtdatafin.Date;
                Open;
             end;
           4:begin 
                sql.Add(' WHERE E.NUMNF_ENT = ' + #39 + EdtCod.Text + #39);
                if (not CheckEmp.Checked) then
                   begin 
                      sql.Add(' AND E.COD_EMP = :CODEMP');
                      Parambyname('codemp').AsInteger:= iEmp;
                   end;
                Open;
             end;
         end;
         DisableControls;
         First;
         while not eof do
            begin 
               vl_total:= vl_total + QConsEntTOTAL_ENT.Value;
               next;
            end;
         First;
         EnableControls;
         EdtTotal.Text:= floattostr(vl_total);
         DBGrid1.SetFocus;
      end;
end;

procedure TFrmConsEntrada.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsEntrada.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      btnsair.Click;
end;

procedure TFrmConsEntrada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QConsEnt.SQL.Clear;
   QConsEnt.SQL.Text:= sSql;
   QConsEnt.Close;

   {grava a posicao do combo}
   dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsEntrada.ComboCons', inttostr(ComboCons.itemIndex));
   Action:= caFree;
end;

procedure TFrmConsEntrada.BtnLocalizarClick(Sender: TObject);
begin 
   if QConsEntCOD_EMP.AsInteger <> iEmp then
      begin 
         AlertaCad('Voce está logado na empresa ' + IntToStr(iEmp) + #13 +
                     'Esta Entrada pertence à empesa ' + QConsEntCOD_EMP.AsString);
         exit;
      end;
   if (FrmConsEntrada.tag = 0) or (FrmConsEntrada.tag = 1) then
      begin 
         BuscaFormulario( TFrmEntradas, True );
         with FrmEntradas do
            begin 
               FrmEntradas.tag  := 1;
               edtcod.Text      := QConsEntCOD_ENT.AsString;
               EdtEmissao.Text  := QConsEntDATAEMI_ENT.AsString;
               EdtEnt.Text      := QConsEntDATAENT_ENT.AsString;
               edtcodfor.Text   := QConsEntCOD_FOR.AsString;
               edtnomefor.Text  := QConsEntRAZAO_FOR.Value;
               EdtTotalNF.Text  := QConsEntTOTAL_ENT.AsString;
               EdtTotalProdutos.Text := QConsEntTOTAL_PRODUTOS.AsString;
               edtacres.Text    := QConsEntACRES_ENT.AsString;
               edtdesc.Text     := QConsEntDESC_ENT.AsString;
               edtfrete.Text    := QConsEntFRETE_ENT.AsString;
               edticmsfrete.Text:= QConsEntICMSFRETE_ENT.AsString;
               EdtNumNF.Text    := QConsEntNUMNF_ENT.Value;
               if trim(QConsEntTIPO_ENT.AsString) = 'V' then
                  ComboTipo.ItemIndex:= 1
               else
                  ComboTipo.ItemIndex:= 0;
               EdtSerie.Text    := QConsEntSERIE_ENT.AsString;
               EdtBaseSub.Text  := QConsEntBASE_SUB_TRIB.AsString;
               EdtICMSSub.Text  := QConsEntVALOR_ICMS_SUB.AsString;
               if trim(QConsEntFRETE_INCLUSO.AsString) = 'S' then
                  CheckFrete.Checked:= true
               else
                  CheckFrete.Checked:= false;
               if trim(QConsEntICMS_SUB_INCLUSO.AsString) = 'S' then
                  CheckSub.Checked:= true
               else
                  CheckSub.Checked:= false;
               EdtCodModelo.Text:= QConsEntCODIFICACAO_FISCAL.AsString;
               if trim(QConsEntCUSTO_SEM_DESCONTO.AsString) = 'S' then
                  CheckCustoSemDesconto.Checked:= true
               else
                  CheckCustoSemDesconto.Checked:= false;

               EdtCodTipo.Text  := QConsEntCODIGO_ES.AsString;
               EdtNomeTipo.Text := QConsEntNOME_ES.AsString;
               BuscaItens;
               show;
               FormShow(sender);
            end;
         FrmConsEntrada.close;
      end;
end;

procedure TFrmConsEntrada.EdtCodForKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key := #0;
end;

procedure TFrmConsEntrada.EdtCodForEnter(Sender: TObject);
begin 
   EdtCodFor.SelectAll;
end;

procedure TFrmConsEntrada.QConsEntCalcFields(DataSet: TDataSet);
begin 
   if QConsEntTIPO_ENT.AsString = 'P' then
      QConsEntCALC_TIPO.AsString:= 'A PRAZO'
   else
      QConsEntCALC_TIPO.AsString:= 'A VISTA';
end;

procedure TFrmConsEntrada.BtnItensClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmItensEntradas, FrmItensEntradas);
   FrmItensEntradas.tag:= 3;
   FrmItensEntradas.showmodal;
end;

end.
