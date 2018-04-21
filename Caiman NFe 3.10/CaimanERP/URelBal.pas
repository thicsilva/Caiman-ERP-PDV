unit URelBal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmRelBal = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    CheckEmp: TCheckBox;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    QRelBal: TFDQuery;
    GB: TGroupBox;
    EdtCod: UNovosComponentes.TEdit;
    BtnCons: TsSpeedButton;
    EdtNome: TEdit;
    Check: TCheckBox;
    QRelBalCODPRO: TIntegerField;
    QRelBalNOMEPRO: TStringField;
    QRelBalESTOQUEANT: TBCDField;
    QRelBalOUTRASE: TBCDField;
    QRelBalOUTRASS: TBCDField;
    QRelBalACERTOE: TBCDField;
    QRelBalACERTOS: TBCDField;
    QRelBalCOMPRAS: TBCDField;
    QRelBalREFERENCIA: TStringField;
    RdgOrdem: TRadioGroup;
    QRelBalVENDAS: TBCDField;
    StatusBar1: TStatusBar;
    RDG: TRadioGroup;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckClick(Sender: TObject);
    procedure EdtCodEnter(Sender: TObject);
    procedure EdtCodExit(Sender: TObject);
    procedure EdtCodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsClick(Sender: TObject);
    procedure RdgOrdemClick(Sender: TObject);
    procedure EdtCodKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelBal: TFrmRelBal;

implementation
uses
  Udm, UQRelBal, UNovoPrincipal, Ubibli1, UConsSecao, UConsFor;

{$R *.dfm}

procedure TFrmRelBal.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelBal.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmRelBal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRelBal.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelBal.BtnVisClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRelBal do
     begin 
        close;
        sql.Clear;
        if RDG.ItemIndex = 0 then
           sql.Add('SELECT * FROM SP_REL_GIRO(:CODEMP, :COD, :DATAINI, :DATAFIN)')
        else
           sql.add('SELECT * FROM SP_REL_GIRO_FORNECEDOR(:CODEMP, :COD, :DATAINI, :DATAFIN)');
        if RdgOrdem.ItemIndex = 0 then
           sql.add(' ORDER BY CODPRO')
        else
           sql.add(' ORDER BY NOMEPRO');

        if (not CheckEmp.Checked) then
           Parambyname('codemp').AsInteger:= iEmp
        else
           Parambyname('codemp').AsInteger:= 0; //todas as empresas
        if not Check.Checked then
           Parambyname('cod').AsInteger:= strtoint(edtcod.Text)
        else
           Parambyname('cod').AsInteger:= 0; //todas as seções
        Parambyname('dataini').AsDate  := edtdataini.Date;
        Parambyname('datafin').AsDate  := edtdatafin.Date;
        open;
     end;
  Application.CreateForm(TFrmQRelBal, FrmQRelBal);
  FrmQRelBal.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
  FrmQRelBal.QRLTitulo.Caption:= 'Relatório de Balanço de Compra e Venda por Produto no Período: ' + datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
  if RDG.ItemIndex = 0 then
     begin 
        if not Check.Checked then
           FrmQRelBal.QRLAux.Caption:= 'Seção: ' + trim(EdtNome.text)
        else
           FrmQRelBal.QRLAux.Caption:= 'Seção: Todas';
     end
  else
     begin 
        if not Check.Checked then
           FrmQRelBal.QRLAux.Caption:= 'Fornecedor: ' + trim(EdtNome.text)
        else
           FrmQRelBal.QRLAux.Caption:= 'Fornecedor: Todos';
     end;
  if sender = btnvis then
     begin 
        FrmQRelBal.QRBal.PreviewInitialState:= wsMaximized;
        FrmQRelBal.QRBal.Preview;
     end
  else
     begin 
        FrmQRelBal.QRBal.PrinterSetup;
        FrmQRelBal.QRBal.Print;
     end;
  FrmQRelBal.QRBal.QRPrinter:= nil;
  dm.IBTransaction.Commit;
  QRelBal.Close;
end;

procedure TFrmRelBal.FormShow(Sender: TObject);
begin 
   edtdataini.Date:= date;
   edtdatafin.Date:= date;
   rdg.ItemIndex:= 0;
   RdgOrdem.ItemIndex:= 0;
   Check.Checked:= true;
   CheckClick(Check);
   EdtDataIni.SetFocus;
end;

procedure TFrmRelBal.CheckClick(Sender: TObject);
begin 
   Check.SetFocus;
   EdtCod.clear;
   EdtNome.Clear;
   if Check.Checked then
      GB.Enabled:= false
   else
      begin 
         GB.Enabled:= true;
         edtcod.SetFocus;
      end;
end;

procedure TFrmRelBal.EdtCodEnter(Sender: TObject);
begin 
   edtcod.SelectAll;
end;

procedure TFrmRelBal.EdtCodExit(Sender: TObject);
begin 
   if (BtnSair.Focused) or (Check.Focused) then
      exit;
   if rdg.ItemIndex = 0 then
      begin 
         EdtNome.Text:= Consulta('secao', edtcod, 'cod_sec', 'nome_sec', dm.IBTransaction, dm.qConsulta);
         if EdtNome.Text = '' then
            begin 
               AlertaCad('Seção não Cadastrada');
//               edtcod.SetFocus;
            end;
      end
   else
      begin 
         EdtNome.Text:= Consulta('fornecedor', edtcod, 'cod_for', 'razao_for', dm.IBTransaction, dm.qConsulta);
         if EdtNome.Text = '' then
            begin 
               AlertaCad('Fornecedor não cadastrado');
//               edtcod.SetFocus;
            end;
      end;
end;

procedure TFrmRelBal.EdtCodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnCons.Click;
end;

procedure TFrmRelBal.BtnConsClick(Sender: TObject);
begin 
   if rdg.ItemIndex = 0 then
      begin 
         Application.CreateForm(TFrmConsSecao, FrmConsSecao);
         FrmConsSecao.tag:= 8;
         FrmConsSecao.showmodal;
      end
   else
      begin 
         Application.CreateForm(TFrmConsFor, FrmConsFor);
         FrmConsFor.tag:= 19;
         FrmConsFor.showmodal;
      end;
end;

procedure TFrmRelBal.RdgOrdemClick(Sender: TObject);
begin 
   edtcod.Clear;
   edtnome.Clear;
   if rdg.ItemIndex = 0 then
      begin 
         gb.Caption:= 'Seção';
         check.Caption:= 'Todas as Seções';
      end
   else
      begin 
         gb.Caption:= 'Fornecedor';
         check.Caption:= 'Todos os Fornecedores';
      end;
end;

procedure TFrmRelBal.EdtCodKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

end.



