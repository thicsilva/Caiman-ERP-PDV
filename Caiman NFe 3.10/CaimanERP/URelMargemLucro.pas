unit URelMargemLucro;

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
  TFrmRelMargemLucro = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    RdgOrdem: TRadioGroup;
    GB: TGroupBox;
    BtnConsIni: TsSpeedButton;
    BtnConsFin: TsSpeedButton;
    EdtCodIni: UNovosComponentes.TEdit;
    EdtNomeIni: TEdit;
    EdtCodFin: UNovosComponentes.TEdit;
    EdtNomeFin: TEdit;
    Check: TCheckBox;
    QRelMargem: TFDQuery;
    QRelMargemCOD_PRO: TIntegerField;
    QRelMargemNOME_PRO: TStringField;
    QRelMargemVALOR_PRO: TBCDField;
    QRelMargemPRECO_REVENDA: TBCDField;
    QRelMargemUNIDADE_SAIDA_PRO: TStringField;
    QRelMargemCOD_SEC: TIntegerField;
    QRelMargemNOME_SEC: TStringField;
    QRelMargemPRECO_CUSTO: TBCDField;
    CheckAgrupar: TCheckBox;
    procedure EdtCodIniEnter(Sender: TObject);
    procedure EdtCodFinEnter(Sender: TObject);
    procedure EdtCodIniExit(Sender: TObject);
    procedure EdtCodFinExit(Sender: TObject);
    procedure EdtCodIniKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodFinKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodIniKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsIniClick(Sender: TObject);
    procedure BtnConsFinClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LimpaGB;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelMargemLucro: TFrmRelMargemLucro;

implementation
uses
  Udm, UConsSecao, Ubibli1, UQRelMargemLucro, UNovoPrincipal;
var sSql : string;

{$R *.dfm}

procedure TFrmRelMargemLucro.LimpaGB;
begin 
   edtcodini.Clear;
   edtcodfin.Clear;
   edtnomeini.Clear;
   edtnomefin.Clear;
end;

procedure TFrmRelMargemLucro.EdtCodIniEnter(Sender: TObject);
begin 
   edtcodini.SelectAll;
end;

procedure TFrmRelMargemLucro.EdtCodFinEnter(Sender: TObject);
begin 
   EdtCodFin.SelectAll;
end;

procedure TFrmRelMargemLucro.EdtCodIniExit(Sender: TObject);
begin 
   if EdtCodIni.Text = '' then
      exit;
   EdtNomeIni.Text:= consulta('secao', EdtCodIni, 'cod_sec', 'nome_sec', dm.IBTransaction, dm.qConsulta);
   if EdtNomeIni.Text = '' then
      begin 
         AlertaCad('Seção não Cadastrada');
//         EdtCodIni.SetFocus;
      end;
end;

procedure TFrmRelMargemLucro.EdtCodFinExit(Sender: TObject);
begin 
   if EdtCodFin.Text = '' then
      exit;
   EdtNomeFin.Text:= consulta('secao', EdtCodFin, 'cod_sec', 'nome_sec', dm.IBTransaction, dm.qConsulta);
   if EdtNomefin.Text = '' then
      begin 
         AlertaCad('Seção não Cadastrada');
//         EdtCodFin.SetFocus;
      end;
end;

procedure TFrmRelMargemLucro.EdtCodIniKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsIni.Click;
end;

procedure TFrmRelMargemLucro.EdtCodFinKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsFin.Click;
end;

procedure TFrmRelMargemLucro.EdtCodIniKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmRelMargemLucro.BtnConsIniClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsSecao, FrmConsSecao);
   FrmConsSecao.Tag:= 12;
   FrmConsSecao.ShowModal;
end;

procedure TFrmRelMargemLucro.BtnConsFinClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsSecao, FrmConsSecao);
   FrmConsSecao.Tag:= 13;
   FrmConsSecao.ShowModal;
end;

procedure TFrmRelMargemLucro.FormShow(Sender: TObject);
begin 
   sSql:= QRelMargem.sql.Text;
   RdgOrdem.ItemIndex:= 1;
   Check.Checked:= true;
   CheckClick(check);
end;

procedure TFrmRelMargemLucro.CheckClick(Sender: TObject);
begin 
   Check.Focused;
   LimpaGB;
   if Check.Checked then
      begin 
         gb.Enabled:= false;
         CheckAgrupar.Enabled:= true;
         CheckAgrupar.Checked:= false;
      end
   else
      begin 
         CheckAgrupar.Checked:= true;
         CheckAgrupar.Enabled:= false;
         GB.Enabled:= true;
         edtcodini.SetFocus;
      end;
end;

procedure TFrmRelMargemLucro.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelMargemLucro.BtnVisClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRelMargem do
      begin 
         close;
         sql.Clear;
         sql.text:= sSql;
         sql.add(' WHERE E.COD_EMP = :CODEMP');
         if not Check.Checked then
            begin 
               sql.Add(' AND P.COD_SEC BETWEEN :CODINI AND :CODFIN');
               Parambyname('codini').asinteger:= strtoint(EdtCodIni.Text);
               Parambyname('codfin').asinteger:= strtoint(EdtCodFin.Text);
            end;
         if CheckAgrupar.Checked then
            begin 
               case RdgOrdem.ItemIndex of
                  0:sql.Add(' ORDER BY P.COD_SEC, P.COD_PRO');
                  1:sql.Add(' ORDER BY P.COD_SEC, P.NOME_PRO');
               end;
            end
         else
            begin 
               case RdgOrdem.ItemIndex of
                  0:sql.Add(' ORDER BY P.COD_PRO');
                  1:sql.Add(' ORDER BY P.NOME_PRO');
               end;
            end;
         Parambyname('codemp').asinteger:= iEmp;
         Open;
      end;
   Application.CreateForm(TFrmQRelMargemLucro, FrmQRelMargemLucro);
   if CheckAgrupar.Checked then
      FrmQRelMargemLucro.QRGroup1.Enabled:= true
   else
      FrmQRelMargemLucro.QRGroup1.Enabled:= false;

   if sender = btnvis then
      begin 
         FrmQRelMargemLucro.QRMargem.PreviewInitialState:= wsMaximized;
         FrmQRelMargemLucro.QRMargem.Preview;
      end
   else
     begin 
        FrmQRelMargemLucro.QRMargem.PrinterSetup;
        FrmQRelMargemLucro.QRMargem.Print;
     end;
   FrmQRelMargemLucro.QRMargem.QRPrinter:= nil;
end;

procedure TFrmRelMargemLucro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QRelMargem.Close;
   Action:= cafree;
end;

procedure TFrmRelMargemLucro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.
