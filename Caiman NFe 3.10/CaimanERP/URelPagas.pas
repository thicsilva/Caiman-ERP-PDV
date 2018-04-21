unit URelPagas;

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
  TFrmRelPagas = class(UNovoFormulario.TForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    GB2: TGroupBox;
    BtnConsIni: TsSpeedButton;
    BtnConsFin: TsSpeedButton;
    EdtCodIni: UNovosComponentes.TEdit;
    EdtNomeIni: TEdit;
    EdtCodFin: UNovosComponentes.TEdit;
    EdtNomeFin: TEdit;
    CheckFor: TCheckBox;
    CheckEmp: TCheckBox;
    Rdg: TRadioGroup;
    Panel1: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    StatusBar1: TStatusBar;
    QPagas: TFDQuery;
    QPagasCOD_CPT: TIntegerField;
    QPagasDATA_CTP: TDateField;
    QPagasDTVENCTO_CTP: TDateField;
    QPagasDTPAGTO_CTP: TDateField;
    QPagasNUM_DOC_CTP: TStringField;
    QPagasVALOR_CTP: TBCDField;
    QPagasVALOR_PAGO_CTP: TBCDField;
    QPagasRAZAO_FOR: TStringField;
    QPagasOBS_CTP: TStringField;
    QPagasCOD_FOR: TIntegerField;
    GBCla: TGroupBox;
    BtnConsCla: TsSpeedButton;
    EdtCodCla: UNovosComponentes.TEdit;
    EdtNomeCla: TEdit;
    CheckCla: TCheckBox;
    QPagasCOD_CLASSIFICACAO: TIntegerField;
    QPagasDESCRICAO: TStringField;
    QPagasDESCONTO_CTP: TBCDField;
    QPagasACRESCIMO_CTP: TBCDField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtCodIniKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodIniExit(Sender: TObject);
    procedure EdtCodIniKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodFinKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodFinExit(Sender: TObject);
    procedure BtnConsIniClick(Sender: TObject);
    procedure BtnConsFinClick(Sender: TObject);
    procedure CheckForClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure EdtCodIniEnter(Sender: TObject);
    procedure EdtCodFinEnter(Sender: TObject);
    procedure CheckClaClick(Sender: TObject);
    procedure BtnConsClaClick(Sender: TObject);
    procedure EdtCodClaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodClaEnter(Sender: TObject);
    procedure EdtCodClaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelPagas: TFrmRelPagas;

implementation
uses
  Udm, Ubibli1, UNovoPrincipal, UQRelPagasDtPagto, UQRelPagasFor, 
  UConsClassifContasPagar, UConsFor;
var  sSql : string;

{$R *.dfm}

procedure TFrmRelPagas.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmRelPagas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRelPagas.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelPagas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelPagas.EdtCodIniKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmRelPagas.EdtCodIniExit(Sender: TObject);
begin 
   if (btnsair.Focused) or (CheckFor.Focused) then
      exit;
   EdtNomeIni.Text:= consulta('fornecedor', EdtCodIni, 'cod_for', 'razao_for', dm.IBTransaction, dm.qConsulta);
   if EdtNomeIni.Text = '' then
      begin 
         AlertaCad('Fornecedor não Cadastrado');
//         EdtCodIni.SetFocus;
      end;
end;

procedure TFrmRelPagas.EdtCodIniKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsIni.Click;
end;

procedure TFrmRelPagas.EdtCodFinKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsFin.Click;
end;

procedure TFrmRelPagas.EdtCodFinExit(Sender: TObject);
begin 
   if (btnsair.Focused) or (CheckFor.Focused) then
      exit;
   EdtNomeFin.Text:= consulta('fornecedor', EdtCodFin, 'cod_for', 'razao_for', dm.IBTransaction, dm.qConsulta);
   if EdtNomeFin.Text = '' then
      begin 
         AlertaCad('Fornecedor não Cadastrado');
//         EdtCodFin.SetFocus;
      end;
end;

procedure TFrmRelPagas.BtnConsIniClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsFor, FrmConsFor);
   FrmConsFor.tag:= 11;
   FrmConsFor.showmodal;
end;

procedure TFrmRelPagas.BtnConsFinClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsFor, FrmConsFor);
   FrmConsFor.tag:= 12;
   FrmConsFor.showmodal;
end;

procedure TFrmRelPagas.CheckForClick(Sender: TObject);
begin 
   if CheckFor.Checked then
      begin 
         EdtCodIni.Clear;
         EdtCodFin.Clear;
         EdtNomeIni.Clear;
         EdtNomeFin.Clear;
         GB2.Enabled:= false;
      end
   else
      begin 
         gb2.Enabled:= true;
         EdtCodIni.Clear;
         EdtCodFin.Clear;
         EdtNomeIni.Clear;
         EdtNomeFin.Clear;
         EdtCodIni.SetFocus;
      end;
end;

procedure TFrmRelPagas.FormShow(Sender: TObject);
begin 
   sSql:= QPagas.SQL.Text;
   Rdg.ItemIndex  := 0;
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;
   edtdataini.SetFocus;
   CheckFor.Checked:= true;
   CheckCla.Checked:= true;
end;

procedure TFrmRelPagas.BtnVisClick(Sender: TObject);
begin 
   if EdtDataFin.Date < edtdataini.Date then
      begin 
         AlertaCad('A data final não pode ser menor que a data inicial');
//         edtdataini.SetFocus;
         exit;
      end;
   if (EdtCodIni.Text <> '') and (edtcodfin.Text <> '') then
      begin 
         if strtoint(EdtCodFin.Text) < strtoint(edtcodini.Text) then
            begin 
               AlertaCad('O fornecedor final não pode ser menor que o fornecedor inicial');
//               EdtCodIni.SetFocus;
               exit;
            end;
      end;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QPagas do
      begin 
         close;
         sql.Clear;

         sql.Text:= sSql;
         sql.Add(' WHERE P.DTPAGTO_CTP BETWEEN :DATAINI AND :DATAFIN');
         Parambyname('DATAINI').AsDate  := edtdataini.Date;
         Parambyname('DATAFIN').AsDate  := edtdatafin.Date;
         if not CheckFor.Checked then
            begin 
               sql.Add(' AND P.COD_FOR BETWEEN :CODINI AND :CODFIN');
               Parambyname('codini').AsInteger:= strtoint(EdtCodIni.Text);
               Parambyname('codfin').AsInteger:= strtoint(EdtCodFin.Text);
            end;

         if (not CheckEmp.Checked) then
            begin 
               sql.Add(' AND P.COD_EMP = :CODEMP');
               Parambyname('CODEMP').AsInteger:= iEmp;
            end;

         if not CheckCla.Checked then
            begin 
               sql.add(' AND P.COD_CLASSIFICACAO = :CODCLA');
               Parambyname('codcla').AsInteger:= strtoint(EdtCodCla.Text);
            end;

         if rdg.ItemIndex = 0 then //agrupado por data pagamento
            sql.Add(' ORDER BY P.DTPAGTO_CTP, P.COD_FOR')
         else
            sql.Add(' ORDER BY P.COD_FOR, P.DTPAGTO_CTP');


         open;
      end;
   if rdg.ItemIndex = 0 then
      begin 
         Application.CreateForm(TFrmQRelPagasDtPagto, FrmQRelPagasDtPagto);
         FrmQRelPagasDtPagto.QRLNomeEmpresa.Caption := frmmenu.SB.Panels[3].Text;
         FrmQRelPagasDtPagto.QRLTitulo.Caption      := 'Relatório de Contas Pagas no Período: ' + datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
         if CheckCla.Checked then
            FrmQRelPagasDtPagto.QRLCla.Caption:= 'Classificação: Todas'
         else
            FrmQRelPagasDtPagto.QRLCla.Caption:= 'Classificação: ' + trim(EdtNomeCla.Text);
         FrmQRelPagasDtPagto.QRDBText3.DataSet := QPagas;
         FrmQRelPagasDtPagto.QRDBText5.DataSet := QPagas;
         FrmQRelPagasDtPagto.QRDBText1.DataSet := QPagas;
         FrmQRelPagasDtPagto.QRDBText7.DataSet := QPagas;
         FrmQRelPagasDtPagto.QRDBText2.DataSet := QPagas;
         FrmQRelPagasDtPagto.QRDBText4.DataSet := QPagas;
         FrmQRelPagasDtPagto.QRDBText6.DataSet := QPagas;
         FrmQRelPagasDtPagto.QRDBText9.DataSet := QPagas;
         FrmQRelPagasDtPagto.QRDBText10.DataSet := QPagas;
         FrmQRelPagasDtPagto.QRDBText8.DataSet := QPagas;
         FrmQRelPagasDtPagto.QRPagas.DataSet := QPagas;
         if sender = btnvis then
            begin
               FrmQRelPagasDtPagto.QRPagas.PreviewInitialState:= wsMaximized;
               FrmQRelPagasDtPagto.QRPagas.Preview;
            end
         else
            begin
               FrmQRelPagasDtPagto.QRPagas.PrinterSetup;
               FrmQRelPagasDtPagto.QRPagas.Print;
            end;
         FrmQRelPagasDtPagto.QRPagas.QRPrinter:= nil;
      end
   else
      begin 
         Application.CreateForm(TFrmQRelPagasFor, FrmQRelPagasFor);
         FrmQRelPagasFor.QRLNomeEmpresa.Caption := frmmenu.SB.Panels[3].Text;
         FrmQRelPagasFor.QRLTitulo.Caption      := 'Relatório de Contas a Pagar no Período: ' + datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
         if CheckCla.Checked then
            FrmQRelPagasFor.QRLCla.Caption:= 'Classificação: Todas'
         else
            FrmQRelPagasFor.QRLCla.Caption:= 'Classificação: ' + trim(EdtNomeCla.Text);
         FrmQRelPagasFor.QRDBText3.DataSet := QPagas;
         FrmQRelPagasFor.QRDBText5.DataSet := QPagas;
         FrmQRelPagasFor.QRDBText1.DataSet := QPagas;
         FrmQRelPagasFor.QRDBText7.DataSet := QPagas;
         FrmQRelPagasFor.QRDBText2.DataSet := QPagas;
         FrmQRelPagasFor.QRDBText4.DataSet := QPagas;
         FrmQRelPagasFor.QRDBText6.DataSet := QPagas;
         FrmQRelPagasFor.QRDBText9.DataSet := QPagas;
         FrmQRelPagasFor.QRDBText10.DataSet := QPagas;
         FrmQRelPagasFor.QRDBText8.DataSet := QPagas;
         FrmQRelPagasFor.QRPagas.DataSet := QPagas;
         if sender = btnvis then
            begin 
               FrmQRelPagasFor.QRPagas.PreviewInitialState:= wsMaximized;
               FrmQRelPagasFor.QRPagas.Preview;
            end
         else
            begin 
               FrmQRelPagasFor.QRPagas.PrinterSetup;
               FrmQRelPagasFor.QRPagas.Print;
            end;
         FrmQRelPagasFor.QRPagas.QRPrinter:= nil;
      end;
   dm.IBTransaction.Commit;
   QPagas.SQL.Clear;
   QPagas.SQL.Text:= sSql;
   QPagas.Close;
end;

procedure TFrmRelPagas.EdtCodIniEnter(Sender: TObject);
begin 
   EdtCodIni.SelectAll;
end;

procedure TFrmRelPagas.EdtCodFinEnter(Sender: TObject);
begin 
   EdtCodFin.SelectAll;
end;

procedure TFrmRelPagas.CheckClaClick(Sender: TObject);
begin 
   CheckCla.SetFocus;
   EdtCodCla.Clear;
   EdtNomeCla.Clear;
   if CheckCla.Checked then
      GBCla.Enabled:= false
   else
      begin 
         GBCla.Enabled:= true;
         EdtCodCla.SetFocus;
      end;
end;

procedure TFrmRelPagas.BtnConsClaClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsClassifContasPagar, FrmConsClassifContasPagar);
   FrmConsClassifContasPagar.Tag:= 2;
   FrmConsClassifContasPagar.ShowModal;
end;

procedure TFrmRelPagas.EdtCodClaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsCla.Click;
end;

procedure TFrmRelPagas.EdtCodClaEnter(Sender: TObject);
begin 
   EdtCodCla.SelectAll;
end;

procedure TFrmRelPagas.EdtCodClaExit(Sender: TObject);
begin 
   if (BtnSair.Focused) or (CheckCla.Focused) then
      exit;
   EdtNomeCla.Text:= consulta('classificacao_contas_pagar', EdtCodCla, 'codigo', 'descricao', dm.IBTransaction, dm.qConsulta);
   if EdtNomeCla.Text = '' then
      begin 
         AlertaCad('Classificação não Cadastrada');
//         EdtCodCla.SetFocus;
      end;
end;

end.
