unit URelExtratoFor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmRelExtratoFor = class(UNovoFormulario.TForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    GB2: TGroupBox;
    BtnCons: TsSpeedButton;
    EdtCod: UNovosComponentes.TEdit;
    EdtNome: TEdit;
    CheckEmp: TCheckBox;
    Panel1: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    StatusBar1: TStatusBar;
    QRelExt: TFDQuery;
    QRelExtCOD_CPT: TIntegerField;
    QRelExtCOD_EMP: TIntegerField;
    QRelExtDATA_CTP: TDateField;
    QRelExtDESCONTO_CTP: TBCDField;
    QRelExtACRESCIMO_CTP: TBCDField;
    QRelExtDTPAGTO_CTP: TDateField;
    QRelExtDTVENCTO_CTP: TDateField;
    QRelExtNUM_DOC_CTP: TStringField;
    QRelExtSEQUENCIA_CTP: TIntegerField;
    QRelExtVALOR_CTP: TBCDField;
    QRelExtVALOR_PAGO_CTP: TBCDField;
    procedure BtnConsClick(Sender: TObject);
    procedure EdtCodEnter(Sender: TObject);
    procedure EdtCodExit(Sender: TObject);
    procedure EdtCodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelExtratoFor: TFrmRelExtratoFor;

implementation
uses
  Udm, Ubibli1, UConsFor, UQRelExtratoFor, UNovoPrincipal;

{$R *.dfm}

procedure TFrmRelExtratoFor.BtnConsClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsFor, FrmConsFor);
   FrmConsFor.tag:= 16;
   FrmConsFor.showmodal;
end;

procedure TFrmRelExtratoFor.EdtCodEnter(Sender: TObject);
begin 
   edtcod.SelectAll;
end;

procedure TFrmRelExtratoFor.EdtCodExit(Sender: TObject);
begin 
   if btnsair.Focused then
      exit;
   EdtNome.Text:= consulta('fornecedor', EdtCod, 'cod_for', 'razao_for', dm.IBTransaction, dm.qConsulta);
   if EdtNome.Text = '' then
      begin 
         AlertaCad('Fornecedor não Cadastrado');
//         EdtCod.SetFocus;
      end;
end;

procedure TFrmRelExtratoFor.EdtCodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnCons.Click;
end;

procedure TFrmRelExtratoFor.EdtCodKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmRelExtratoFor.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelExtratoFor.FormShow(Sender: TObject);
begin 
   edtdataini.Date:= date;
   edtdatafin.Date:= date;
   edtcod.Clear;
   edtnome.Clear;
   edtdataini.SetFocus; 
end;

procedure TFrmRelExtratoFor.BtnVisClick(Sender: TObject);
begin 
   if edtcod.Text = '' then
      begin 
         AlertaCad('Digite o código do fornecedor');
//         edtcod.SetFocus;
         exit;
      end;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRelExt do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT COD_CPT, COD_EMP, DATA_CTP, DESCONTO_CTP, ACRESCIMO_CTP, ' +
                 'DTPAGTO_CTP, DTVENCTO_CTP, NUM_DOC_CTP, SEQUENCIA_CTP, VALOR_CTP, VALOR_PAGO_CTP ' +
                 'FROM CONTAS_PAGAR ' +
                 'WHERE (DATA_CTP BETWEEN :DATA1INI AND :DATA1FIN OR ' +
                 'DTPAGTO_CTP BETWEEN :DATA2INI AND :DATA2FIN) ' +
                 'AND (COD_FOR = :COD)');
         if (not CheckEmp.Checked) then
            begin 
               sql.Add(' AND COD_EMP = :CODEMP');
               Parambyname('codemp').AsInteger:= iEmp;
            end;
         sql.Add(' ORDER BY COD_CPT');
         Parambyname('data1ini').AsDate   := edtdataini.Date;
         Parambyname('data1fin').AsDate   := edtdatafin.Date;
         Parambyname('data2ini').AsDate   := edtdataini.Date;
         Parambyname('data2fin').AsDate   := edtdatafin.Date;
         Parambyname('cod').AsInteger     := strtoint(edtcod.Text);
         open;
      end;
   Application.CreateForm(TFrmQRelExtratoFor, FrmQRelExtratoFor);
   FrmQRelExtratoFor.QRLNomeEmpresa.Caption := frmmenu.SB.Panels[3].Text;
   FrmQRelExtratoFor.QRLTitulo.Caption      := 'Relatório de Extrato de Fornecedor no Período: ' +
   datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
   FrmQRelExtratoFor.QRLFor.Caption := 'Fornecedor: ' + edtnome.Text;
   if sender = btnvis then
      begin 
         FrmQRelExtratoFor.QRFor.PreviewInitialState:= wsMaximized;
         FrmQRelExtratoFor.QRFor.Preview;
      end
   else
      begin 
         FrmQRelExtratoFor.QRFor.PrinterSetup;
         FrmQRelExtratoFor.QRFor.Print;
      end;
   FrmQRelExtratoFor.QRFor.QRPrinter:= nil;
   dm.IBTransaction.Commit;
   QRelExt.Close;
end;

procedure TFrmRelExtratoFor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelExtratoFor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRelExtratoFor.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

end.
