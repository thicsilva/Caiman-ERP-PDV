unit UConsValesFuncionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, Grids, DBGrids, DB, StdCtrls, Buttons, Mask, 
  rxToolEdit, rxCurrEdit, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton, cxPC;

type
  TFrmConsValesFuncionario = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    DSQCons: TDataSource;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    EdtCodFun: UNovosComponentes.TEdit;
    BtnConsFun: TsSpeedButton;
    EdtNomeFun: TEdit;
    CheckFunc: TCheckBox;
    RDG: TRadioGroup;
    BtnOk: TButton;
    BtnSair: TButton;
    QCons: TFDQuery;
    QConsCOD_VALE: TIntegerField;
    QConsCOD_FUN: TIntegerField;
    QConsDATA_VALE: TDateField;
    QConsDATA_PAGTO: TDateField;
    QConsVALOR_VALE: TBCDField;
    QConsAUTORIZADO_VALE: TStringField;
    QConsNOME_FUN: TStringField;
    Label1: TLabel;
    EdtTotal: TCurrencyEdit;
    BtnLocalizar: TBitBtn;
    procedure BtnConsFunClick(Sender: TObject);
    procedure EdtCodFunEnter(Sender: TObject);
    procedure EdtCodFunExit(Sender: TObject);
    procedure EdtCodFunKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodFunKeyPress(Sender: TObject; var Key: Char);
    procedure CheckFuncClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsValesFuncionario: TFrmConsValesFuncionario;

implementation

uses
  UConsFunc, Udm, Ubibli1, UCadVales, UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsValesFuncionario.BtnConsFunClick(Sender: TObject);
begin 
   application.CreateForm(TFrmConsFunc, FrmConsFunc);
   FrmConsFunc.Tag:= 4;
   FrmConsFunc.ShowModal;
end;

procedure TFrmConsValesFuncionario.EdtCodFunEnter(Sender: TObject);
begin 
   EdtCodFun.SelectAll;
end;

procedure TFrmConsValesFuncionario.EdtCodFunExit(Sender: TObject);
begin 
   if (CheckFunc.Focused) or (BtnSair.Focused) then
      exit;
   EdtNomeFun.Text:= Consulta('funcionario', EdtCodFun, 'cod_fun', 'nome_fun', dm.IBTransaction, dm.qConsulta);
   if EdtNomeFun.Text = '' then
      begin 
         AlertaCad('Funcionário não cadastrado');
//         EdtCodFun.SetFocus;
      end;
end;

procedure TFrmConsValesFuncionario.EdtCodFunKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsFun.Click;
end;

procedure TFrmConsValesFuncionario.EdtCodFunKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmConsValesFuncionario.CheckFuncClick(Sender: TObject);
begin 
   CheckFunc.SetFocus;
   EdtCodFun.Clear;
   EdtNomeFun.Clear;
   if CheckFunc.Checked then
      GroupBox1.Enabled:= false
   else
      begin 
         GroupBox1.Enabled:= true;
         EdtCodFun.SetFocus;
      end;
end;

procedure TFrmConsValesFuncionario.FormShow(Sender: TObject);
begin 
   CheckFunc.Checked:= true;
   CheckFuncClick(CheckFunc);
   rdg.ItemIndex:= 2;
   
end;

procedure TFrmConsValesFuncionario.BtnSairClick(Sender: TObject);
begin 
   if Parent is TcxTabSheet then
      frmMenu.FTDI.CloseTabOfForm( TFormClass( Self.ClassType ) )
   else
      close;
end;

procedure TFrmConsValesFuncionario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QCons.Close;
   Action:= caFree;
end;

procedure TFrmConsValesFuncionario.BtnOkClick(Sender: TObject);
var sLiga : string;
var cTotal : currency;
begin 
   cTotal:= 0;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QCons do
      begin 
         close;
         sLiga:= ' WHERE ';
         sql.Clear;
         sql.add('SELECT V.*, F.NOME_FUN ' +
                 'FROM VALES_FUNCIONARIO V ' +
                 'INNER JOIN FUNCIONARIO F ' +
                 'ON (V.COD_FUN = F.COD_FUN)');
         if Not CheckFunc.Checked then
            begin 
               sql.add(' WHERE V.COD_FUN = :CODFUN');
               Parambyname('codfun').AsInteger:= strtoint(EdtCodFun.Text);
               sLiga:= ' AND ';
            end;
         case rdg.ItemIndex of
          0: sql.add(sliga + 'V.DATA_PAGTO IS NULL');
          1: sql.add(sliga + 'V.DATA_PAGTO IS NOT NULL');
         end;
         sql.add(' ORDER BY V.DATA_VALE');
         open;
         DisableControls;
         while not eof do
            begin 
               cTotal:= cTotal + QConsVALOR_VALE.AsCurrency;
               next;
            end;
         First;
         EnableControls;
      end;
   EdtTotal.Text:= CurrToStr(cTotal);
end;

procedure TFrmConsValesFuncionario.BtnLocalizarClick(Sender: TObject);
begin 
   if QConsDATA_PAGTO.IsNull then
      begin 
         with FrmCadVales do
             begin 
                tag:= 1;
                limpaedit(FrmCadVales);
                ededit(FrmCadVales, false);
                cod_vale.Text      := QConsCOD_VALE.AsString;
                EdtData.Date       := QConsDATA_VALE.Value;
                EdtCodFun.Text     := QConsCOD_FUN.AsString;
                EdtNomeFun.Text    := QConsNOME_FUN.AsString;
                EdtValor.Text      := QConsVALOR_VALE.AsString;
                EdtAutorizado.Text := QConsAUTORIZADO_VALE.AsString;
                FormShow(sender);
                show;
             end;
         close;
      end
   else
      begin 
         AlertaCad('Vale pago, não pode ser alterado');
      end;
end;

end.
