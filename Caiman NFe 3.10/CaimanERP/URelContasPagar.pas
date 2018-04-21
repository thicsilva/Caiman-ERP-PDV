unit URelContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, Buttons, Mask, ExtCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmRelContasAPagar = class(UNovoFormulario.TForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Panel1: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    StatusBar1: TStatusBar;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    GB2: TGroupBox;
    EdtCodIni: UNovosComponentes.TEdit;
    BtnConsIni: TsSpeedButton;
    EdtNomeIni: TEdit;
    EdtCodFin: UNovosComponentes.TEdit;
    BtnConsFin: TsSpeedButton;
    EdtNomeFin: TEdit;
    CheckFor: TCheckBox;
    CheckEmp: TCheckBox;
    Rdg: TRadioGroup;
    QPagar: TFDQuery;
    QPagarCOD_CPT: TIntegerField;
    QPagarCOD_FOR: TIntegerField;
    QPagarDATA_CTP: TDateField;
    QPagarDTVENCTO_CTP: TDateField;
    QPagarNUM_DOC_CTP: TStringField;
    QPagarOBS_CTP: TStringField;
    QPagarTIPO_DOC_CTP: TStringField;
    QPagarVALOR_CTP: TBCDField;
    QPagarRAZAO_FOR: TStringField;
    QPagarSEQUENCIA_CTP: TIntegerField;
    GBCla: TGroupBox;
    BtnConsCla: TsSpeedButton;
    EdtCodCla: UNovosComponentes.TEdit;
    EdtNomeCla: TEdit;
    CheckCla: TCheckBox;
    QPagarDESCRICAO: TStringField;
    RdgData: TRadioGroup;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    procedure BtnConsClaClick(Sender: TObject);
    procedure EdtCodClaExit(Sender: TObject);
    procedure EdtCodClaEnter(Sender: TObject);
    procedure EdtCodClaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckClaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelContasAPagar: TFrmRelContasAPagar;

implementation
uses
  UBibli1, Udm, UConsFor, UQRelAPagarVenc, UNovoPrincipal, UQRelAPagarFor, 
  UConsClassifContasPagar;
var sSql : string;

{$R *.dfm}

procedure TFrmRelContasAPagar.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelContasAPagar.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmRelContasAPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRelContasAPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 

   Action:= caFree;
end;

procedure TFrmRelContasAPagar.EdtCodIniKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmRelContasAPagar.EdtCodIniExit(Sender: TObject);
begin 
   if (btnsair.Focused) or (CheckFor.Focused) then
      exit;
   EdtNomeIni.Text:= consulta('fornecedor', EdtCodIni, 'cod_for', 'razao_for', dm.IBTransaction, dm.qConsulta);
   if EdtNomeIni.Text = '' then
      begin 
         AlertaCad('Fornecedor não Cadastrado');
//         EdtCodIni.SetFocus;
         EdtCodIni.SelectAll;
      end;
end;

procedure TFrmRelContasAPagar.EdtCodIniKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsIni.Click;
end;

procedure TFrmRelContasAPagar.EdtCodFinKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsFin.Click;
end;

procedure TFrmRelContasAPagar.EdtCodFinExit(Sender: TObject);
begin 
   if (btnsair.Focused) or (CheckFor.Focused) then
      exit;
   EdtNomeFin.Text:= consulta('fornecedor', EdtCodFin, 'cod_for', 'razao_for', dm.IBTransaction, dm.qConsulta);
   if EdtNomeFin.Text = '' then
      begin 
         AlertaCad('Fornecedor não Cadastrado');
//         EdtCodFin.SetFocus;
         EdtCodFin.SelectAll;
      end;
end;

procedure TFrmRelContasAPagar.BtnConsIniClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsFor, FrmConsFor);
   FrmConsFor.tag:= 9;
   FrmConsFor.showmodal;
end;

procedure TFrmRelContasAPagar.BtnConsFinClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsFor, FrmConsFor);
   FrmConsFor.tag:= 10;
   FrmConsFor.showmodal;
end;

procedure TFrmRelContasAPagar.CheckForClick(Sender: TObject);
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

procedure TFrmRelContasAPagar.FormShow(Sender: TObject);
begin 
   sSql:= QPagar.SQL.Text;
   Rdg.ItemIndex  := 0;
   RdgData.ItemIndex:= 0;
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;
   edtdataini.SetFocus;
   CheckFor.Checked:= true;
   CheckCla.Checked:= true;
end;

procedure TFrmRelContasAPagar.BtnVisClick(Sender: TObject);
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
   with QPagar do
      begin 
         close;
         sql.Clear;
         sql.Text:= sSql;

         case RdgData.ItemIndex of
          0: begin 
                sql.Add(' WHERE C.DTVENCTO_CTP BETWEEN :DATAINI AND :DATAFIN AND C.DTPAGTO_CTP IS NULL');
                Parambyname('dataini').AsDate  := edtdataini.Date;
                Parambyname('datafin').AsDate  := edtdatafin.Date;
             end;
          1: begin 
                sql.Add(' WHERE C.DATA_CTP BETWEEN :DATAINI AND :DATAFIN AND C.DTPAGTO_CTP IS NULL');
                Parambyname('dataini').AsDate  := edtdataini.Date;
                Parambyname('datafin').AsDate  := edtdatafin.Date;
             end;
          2: begin 
                sql.add(' WHERE (C.DATA_CTP <= :DATAFIN) ' +
                         ' AND (C.DTPAGTO_CTP IS NULL OR C.DTPAGTO_CTP > :DATAFIN)');
                Parambyname('datafin').AsDate:= edtdatafin.Date;
             end;
         end;

         if not CheckFor.Checked then
            sql.Add(' AND C.COD_FOR BETWEEN ' + edtcodini.Text + ' AND ' + edtcodfin.Text);

         if (not CheckEmp.Checked) then
            begin 
               sql.Add(' AND C.COD_EMP = :CODEMP');
               Parambyname('codemp').AsInteger:= iEmp;
            end;

         if not CheckCla.Checked then
            begin 
               sql.add(' AND C.COD_CLASSIFICACAO = :CODCLA');
               Parambyname('codcla').AsInteger:= strtoint(EdtCodCla.Text);
            end;

         if rdg.ItemIndex = 0  then //agrupado por data vencimento
            begin 
               if (RdgData.ItemIndex = 0) or (RdgData.ItemIndex = 2) then
                  sql.Add(' ORDER BY C.DTVENCTO_CTP, C.COD_FOR')
               else
                  sql.Add(' ORDER BY C.DATA_CTP, C.COD_FOR');
            end
         else
            sql.Add(' ORDER BY F.RAZAO_FOR, C.COD_FOR, C.DTVENCTO_CTP');

         open;
      end;

   if rdg.ItemIndex = 0 then
      begin 
         Application.CreateForm(TFrmQRelAPagarVenc, FrmQRelAPagarVenc);
         FrmQRelAPagarVenc.QRLNomeEmpresa.Caption := frmmenu.SB.Panels[3].Text;
         FrmQRelAPagarVenc.QRLTitulo.Caption      := 'Relatório de Contas a Pagar no Período: ' + datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);

         if CheckCla.Checked then
            FrmQRelAPagarVenc.QRLCla.Caption:= 'Classificação: Todas'
         else
            FrmQRelAPagarVenc.QRLCla.Caption:= 'Classificação: ' + trim(EdtNomeCla.Text);

         if (RdgData.ItemIndex = 0) or (RdgData.ItemIndex = 2) then
            begin 
               FrmQRelAPagarVenc.QRLabel12.Caption    := 'Venc.';
               FrmQRelAPagarVenc.QRDBText3.DataField  := 'DTVENCTO_CTP';
               FrmQRelAPagarVenc.QRGroup1.Expression  := 'DTVENCTO_CTP';
               FrmQRelAPagarVenc.QRLabel4.Caption     := 'Emissão';
               FrmQRelAPagarVenc.QRDBText1.DataField  := 'DATA_CTP';
            end
         else
            begin 
               FrmQRelAPagarVenc.QRLabel12.Caption    := 'Emissão.';
               FrmQRelAPagarVenc.QRDBText3.DataField  := 'DATA_CTP';
               FrmQRelAPagarVenc.QRGroup1.Expression  := 'DATA_CTP';
               FrmQRelAPagarVenc.QRLabel4.Caption     := 'Vencto';
               FrmQRelAPagarVenc.QRDBText1.DataField  := 'DTVENCTO_CTP';
            end;

         if sender = btnvis then
            begin 
               FrmQRelAPagarVenc.QRPagar.PreviewInitialState:= wsMaximized;
               FrmQRelAPagarVenc.QRPagar.Preview;
            end
         else
            begin 
               FrmQRelAPagarVenc.QRPagar.PrinterSetup;
               FrmQRelAPagarVenc.QRPagar.Print;
            end;
         FrmQRelAPagarVenc.QRPagar.QRPrinter:= nil;
      end
   else
      begin 
         Application.CreateForm(TFrmQRelAPagarFor, FrmQRelAPagarFor);
         FrmQRelAPagarFor.QRLNomeEmpresa.Caption := frmmenu.SB.Panels[3].Text;
         FrmQRelAPagarFor.QRLTitulo.Caption      := 'Relatório de Contas a Pagar no Período: ' + datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);

         if CheckCla.Checked then
            FrmQRelAPagarFor.QRLCla.Caption:= 'Classificação: Todas'
         else
            FrmQRelAPagarFor.QRLCla.Caption:= 'Classificação: ' + trim(EdtNomeCla.Text);

         if sender = btnvis then
            begin 
               FrmQRelAPagarFor.QRPagar.PreviewInitialState:= wsMaximized;
               FrmQRelAPagarFor.QRPagar.Preview;
            end
         else
            begin 
               FrmQRelAPagarFor.QRPagar.PrinterSetup;
               FrmQRelAPagarFor.QRPagar.Print;
            end;
         FrmQRelAPagarFor.QRPagar.QRPrinter:= nil;
      end;
   dm.IBTransaction.Commit;
   QPagar.sql.clear;
   QPagar.sql.text:= sSql;
   QPagar.Close;
end;

procedure TFrmRelContasAPagar.BtnConsClaClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsClassifContasPagar, FrmConsClassifContasPagar);
   FrmConsClassifContasPagar.Tag:= 4;
   FrmConsClassifContasPagar.ShowModal;
end;

procedure TFrmRelContasAPagar.EdtCodClaExit(Sender: TObject);
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

procedure TFrmRelContasAPagar.EdtCodClaEnter(Sender: TObject);
begin 
   EdtCodCla.SelectAll;
end;

procedure TFrmRelContasAPagar.EdtCodClaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsCla.Click;
end;

procedure TFrmRelContasAPagar.CheckClaClick(Sender: TObject);
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

end.

