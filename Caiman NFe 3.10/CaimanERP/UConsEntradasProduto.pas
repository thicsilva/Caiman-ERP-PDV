unit UConsEntradasProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmConsEntradasProduto = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    CheckEmp: TCheckBox;
    GB3: TGroupBox;
    BtnConsPro: TsSpeedButton;
    EdtCodPro: UNovosComponentes.TEdit;
    EdtNomePro: TEdit;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    QConsEnt: TFDQuery;
    DSQConsEnt: TDataSource;
    QConsEntCOD_ENT: TIntegerField;
    QConsEntCOD_PRO: TIntegerField;
    QConsEntQTD_PRO: TBCDField;
    QConsEntPERC_ICMS: TBCDField;
    QConsEntPERC_IPI: TBCDField;
    QConsEntQTDUND_ENT: TBCDField;
    QConsEntPERC_DESC: TBCDField;
    QConsEntPERC_ACRES: TBCDField;
    QConsEntCOD_EMP: TIntegerField;
    QConsEntVALOR_UNIT_PRO: TBCDField;
    QConsEntCUSTO: TBCDField;
    QConsEntRAZAO_FOR: TStringField;
    BtnOk: TBitBtn;
    BtnSair: TBitBtn;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    QConsEntDATAENT_ENT: TDateField;
    LQtdEntradas: TLabel;
    LQtdItens: TLabel;
    QConsEntCOD_GRP: TIntegerField;
    QConsEntCOD_CFOP: TIntegerField;
    QConsEntVALOR_DESCONTO: TBCDField;
    QConsEntVALOR_ACRESCIMO: TBCDField;
    QConsEntPERC_BCR: TBCDField;
    QConsEntCST: TStringField;
    QConsEntVALOR_TOTAL: TBCDField;
    QConsEntBASE_CALCULO: TBCDField;
    QConsEntVALOR_ICMS: TBCDField;
    QConsEntORDEM: TIntegerField;
    QConsEntPERC_ST: TBCDField;
    QConsEntVALOR_SUB_TRIBUTARIA: TBCDField;
    QConsEntVALOR_IPI: TBCDField;
    QConsEntDESCRICAO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure EdtCodProKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodProKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodProExit(Sender: TObject);
    procedure BtnConsProClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodProEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsEntradasProduto: TFrmConsEntradasProduto;

implementation
uses
  Udm, Ubibli1, UConsProd, UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsEntradasProduto.FormShow(Sender: TObject);
begin 
   LQtdEntradas.Caption:= '';
   LQtdItens.Caption   := '';
   EdtCodPro.Clear;
   EdtNomePro.Clear;
   edtdataini.Date:= date - 30;
   edtdatafin.Date:= date;
   if CheckEmp.Visible then
      CheckEmp.Checked:= false;
   EdtCodPro.SetFocus;
end;

procedure TFrmConsEntradasProduto.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsEntradasProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QConsEnt.Close;
   Action:= caFree;
end;

procedure TFrmConsEntradasProduto.BtnOkClick(Sender: TObject);
var vl_quant : real;
begin 
   vl_quant:= 0;
   if EdtCodPro.Text = '' then
      begin 
         AlertaCad('Digite o Código do Produto');
//         EdtCodPro.SetFocus;
         exit;
      end;
   if EdtDataFin.Date < edtdataini.Date then
      begin 
         AlertaCad('A data final não pode ser menor que a data inicial');
//         edtdataini.SetFocus;
         exit;
      end;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsEnt do
      begin 
         close;
         sql.Clear;
         sql.Add('SELECT I.*, F.RAZAO_FOR, E.DATAENT_ENT, U.DESCRICAO ' +
                 'FROM ITENS_ENTRADA I ' +
                 'INNER JOIN PRODUTO P ' +
                 'ON (I.COD_PRO = P.COD_PRO) ' +
                 'INNER JOIN ENTRADAS E ' +
                 'ON (I.COD_ENT = E.COD_ENT) ' +
                 'INNER JOIN FORNECEDOR F ' +
                 'ON (E.COD_FOR = F.COD_FOR) ' +
                 'INNER JOIN UNIDADE_MEDIDA U ' +
                 'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO) ' +
                 'WHERE I.COD_PRO = :CODPRO AND E.DATAENT_ENT BETWEEN :DATAINI AND :DATAFIN ');
         if (not CheckEmp.Checked) then
            begin 
               sql.Add(' AND I.COD_EMP = :CODEMP');
               Parambyname('codemp').AsInteger:= iEmp;
            end;
         sql.Add(' ORDER BY E.DATAENT_ENT');
         Parambyname('codpro').AsInteger := strtoint(edtcodpro.Text);
         Parambyname('dataini').AsDate   := edtdataini.Date;
         Parambyname('datafin').AsDate   := edtdatafin.Date;
         open;
         DisableControls;
         first;
         while not eof do
            begin 
               vl_quant := vl_quant + QConsEntQTD_PRO.Value;
               next;
            end;
         LQtdEntradas.Caption:= inttostr(recordcount) + ' Entrada(s)';
         LQtdItens.Caption   := currtostrf(vl_quant, ffnumber, 2) + ' ' + QConsEntDESCRICAO.AsString + ' Comprados(as)';
         First;
         EnableControls;
      end;
end;

procedure TFrmConsEntradasProduto.EdtCodProKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key := #0;
end;

procedure TFrmConsEntradasProduto.EdtCodProKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsPro.Click;
end;

procedure TFrmConsEntradasProduto.EdtCodProExit(Sender: TObject);
begin 
   if BtnSair.Focused then
      exit;
   EdtNomePro.Text:= Consulta('produto', edtcodpro, 'cod_pro', 'nome_pro', dm.IBTransaction, dm.qConsulta);
   if edtnomepro.Text = '' then
      begin 
         AlertaCad('Produto não Cadastrado');
//         edtcodpro.SetFocus;
      end;
end;

procedure TFrmConsEntradasProduto.BtnConsProClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsProd, FrmConsProd);
   FrmConsProd.tag:= 6;
   FrmConsProd.showmodal;
end;

procedure TFrmConsEntradasProduto.FormKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsEntradasProduto.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmConsEntradasProduto.EdtCodProEnter(Sender: TObject);
begin 
   EdtCodPro.SelectAll;
end;

end.
