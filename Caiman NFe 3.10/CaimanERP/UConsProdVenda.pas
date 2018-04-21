unit UConsProdVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls, DB, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmConsProdVenda = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    LQtdVendas: TLabel;
    LQtdItens: TLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
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
    BtnOk: TBitBtn;
    BtnSair: TBitBtn;
    QConsProdVenda: TFDQuery;
    DSQConsProdVenda: TDataSource;
    ComboCaixa: TComboBox;
    GroupBox1: TGroupBox;
    QConsProdVendaQUANT: TBCDField;
    QConsProdVendaVALOR: TBCDField;
    QConsProdVendaDESCONTO: TBCDField;
    QConsProdVendaDATA_VEN: TDateField;
    QConsProdVendaCUPOM_FISCAL_VEN: TIntegerField;
    QConsProdVendaR04_CCF: TIntegerField;
    QConsProdVendaHORA: TTimeField;
    QConsProdVendaCOD_CAI: TIntegerField;
    QConsProdVendaNOME_CLI: TStringField;
    QConsProdVendaDESCRICAO: TStringField;
    QConsProdVendaNUMERO_NOTA_FISCAL: TIntegerField;
    QConsProdVendaNOME_USU: TStringField;
    QConsProdVendaCOD_EMP: TIntegerField;
    QConsProdVendaCOD_VEN: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  FrmConsProdVenda: TFrmConsProdVenda;

implementation
uses
  Udm, Ubibli1, UConsProd, UNovoPrincipal;
var sSql : string;

{$R *.dfm}

procedure TFrmConsProdVenda.FormShow(Sender: TObject);
begin 
   sSql:= QConsProdVenda.SQL.Text;
   ComboCaixa.ItemIndex:= 0;
   LQtdVendas.Caption  := '';
   LQtdItens.Caption   := '';
   EdtCodPro.Clear;
   EdtNomePro.Clear;
   edtdataini.Date:= date - 30;
   edtdatafin.Date:= date;
   if CheckEmp.Visible then
      CheckEmp.Checked:= false;
   EdtCodPro.SetFocus;
end;

procedure TFrmConsProdVenda.FormCreate(Sender: TObject);
begin 
   
   { BUSCA CAIXA }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QConsulta do
      begin 
         close;
         sql.Clear;
         sql.Add('SELECT COD_CAI, DESC_CAI ' +
                 'FROM CAIXA ORDER BY COD_CAI');
         open;
         First;
         ComboCaixa.Items.Clear;
         combocaixa.Items.Add('TODOS');
         while not eof do
            begin 
               combocaixa.Items.Add(FormataStringD(fieldbyname('COD_CAI').AsString, '2', '0') + '-' + fieldbyname('DESC_CAI').AsString);
               next;
            end;
      end;
   dm.IBTransaction.Commit;
   dm.QCaixa.Close;
end;

procedure TFrmConsProdVenda.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsProdVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;

   QConsProdVenda.SQL.Clear;
   QConsProdVenda.SQL.Text:= sSql;
   QConsProdVenda.Close;
   
   Action:= caFree;
end;

procedure TFrmConsProdVenda.BtnOkClick(Sender: TObject);
var cQuant : currency;
begin 
   cQuant:= 0;
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
   with QConsProdVenda do
      begin 
         close;
         sql.Clear;
         sql.Text:= sSql;

         if ComboCaixa.ItemIndex > 0 then
            begin 
               sql.Add(' AND V.COD_CAI = :CODCAI');
               parambyname('codcai').AsInteger:= strtoint(copy(ComboCaixa.Text, 1,2));
            end;

         if (not CheckEmp.Checked) then
            begin 
               sql.Add(' AND I.COD_EMP = :CODEMP');
               Parambyname('codemp').AsInteger:= iEmp;
            end;
         sql.Add(' ORDER BY V.DATA_VEN');
         Parambyname('codpro').AsInteger := strtoint(edtcodpro.Text);
         Parambyname('dataini').AsDate   := edtdataini.Date;
         Parambyname('datafin').AsDate   := edtdatafin.Date;
         open;
         DisableControls;
         first;
         while not eof do
            begin 
               cQuant:= cQuant + QConsProdVendaQUANT.AsCurrency;
               next;
            end;
         LQtdVendas.Caption := inttostr(recordcount) + ' Venda(s)';
         LQtdItens.Caption  := currtostrf(cQuant, ffnumber, 2) + ' ' + QConsProdVendaDESCRICAO.AsString + ' Vendidas(os)';
         First;
         EnableControls;
      end;
end;

procedure TFrmConsProdVenda.EdtCodProKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key := #0;
end;

procedure TFrmConsProdVenda.EdtCodProKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsPro.Click;
end;

procedure TFrmConsProdVenda.EdtCodProExit(Sender: TObject);
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

procedure TFrmConsProdVenda.BtnConsProClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsProd, FrmConsProd);
   FrmConsProd.tag:= 7;
   FrmConsProd.showmodal;
end;

procedure TFrmConsProdVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsProdVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmConsProdVenda.EdtCodProEnter(Sender: TObject);
begin 
   EdtCodPro.SelectAll;
end;

end.
