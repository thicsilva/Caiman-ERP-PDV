unit URelAbaixoMinimo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmRelAbaixoMinimo = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    RDG: TRadioGroup;
    CheckEmp: TCheckBox;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    QRelAbaixo: TFDQuery;
    QRelAbaixoCOD_PRO: TIntegerField;
    QRelAbaixoNOME_PRO: TStringField;
    QRelAbaixoESTOQUE_MINIMO_PRO: TBCDField;
    QRelAbaixoATUAL: TBCDField;
    GBSecao: TGroupBox;
    BtnConsSec: TsSpeedButton;
    EdtCodSec: UNovosComponentes.TEdit;
    EdtNomeSec: TEdit;
    CheckSecao: TCheckBox;
    GroupBox2: TGroupBox;
    ComboClassif: TComboBox;
    procedure BtnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckSecaoClick(Sender: TObject);
    procedure EdtCodSecEnter(Sender: TObject);
    procedure EdtCodSecExit(Sender: TObject);
    procedure EdtCodSecKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodSecKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsSecClick(Sender: TObject);
    procedure BuscaClassificacao;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelAbaixoMinimo: TFrmRelAbaixoMinimo;

implementation
uses
  Udm, Ubibli1, UQrelEstoqueMinimo, UNovoPrincipal, UConsSecao;

{$R *.dfm}

procedure TFrmRelAbaixoMinimo.BuscaClassificacao;
begin 
   ComboClassif.Clear;
   ComboClassif.Items.Add('[00] TODOS');

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.Add('SELECT CODIGO, DESCRICAO FROM TIPO_PRODUTO ORDER BY CODIGO');
             open;
             while not eof do
                begin 
                   ComboClassif.Items.Add('[' + FormataStringD(fieldbyname('codigo').AsString, '2', '0') + '] ' +  trim(fieldbyname('DESCRICAO').AsString));
                   next;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar a classificação do produto');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmRelAbaixoMinimo.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelAbaixoMinimo.FormCreate(Sender: TObject);
begin 
   
   BuscaClassificacao;
end;

procedure TFrmRelAbaixoMinimo.BtnVisClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRelAbaixo do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT SUM(E.ESTOQUE) ATUAL, E.COD_PRO, P.NOME_PRO, P.ESTOQUE_MINIMO_PRO ' +
                 'FROM ESTOQUE E ' +
                 'INNER JOIN PRODUTO P ' +
                 'ON (E.COD_PRO = P.COD_PRO) ' +
                 'WHERE P.ESTOQUE_MINIMO_PRO > 0');
         if not (CheckSecao.Checked) then
            begin 
               sql.Add(' AND P.COD_SEC = :CODSEC');
               Parambyname('codsec').AsInteger:= strtoint(EdtCodSec.Text);
            end;
         if ComboClassif.ItemIndex > 0 then
            begin 
               sql.add(' AND P.CODIGO_TIPO = :CODTP');
               Parambyname('codtp').AsInteger:= strtoint(copy(ComboClassif.Text, 2, 2));
            end;
         sql.Add(' GROUP BY E.COD_PRO, P.NOME_PRO, P.ESTOQUE_MINIMO_PRO' +
                 ' HAVING SUM(E.ESTOQUE) < P.ESTOQUE_MINIMO_PRO');
         if rdg.ItemIndex = 0 then
            sql.add(' ORDER BY E.COD_PRO')
         else
            sql.add(' ORDER BY P.NOME_PRO');
         open;
      end;
   Application.CreateForm(TFrmQRelEstoqueMinimo, FrmQRelEstoqueMinimo);
   FrmQRelEstoqueMinimo.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;

   if not (CheckSecao.Checked) then
      FrmQRelEstoqueMinimo.QRLTitulo.Caption:= 'Seção: ' + trim(EdtNomeSec.Text)
   else
      FrmQRelEstoqueMinimo.QRLTitulo.Caption:= 'Seção: Todas';

   FrmQRelEstoqueMinimo.QRLTitulo1.Caption:= 'Classificação: ' + ComboClassif.Text;

   if sender = btnvis then     
      begin 
         FrmQRelEstoqueMinimo.QREstoque.PreviewInitialState:= wsMaximized;
         FrmQRelEstoqueMinimo.QREstoque.Preview;
      end
   else
      begin 
         FrmQRelEstoqueMinimo.QREstoque.PrinterSetup;
         FrmQRelEstoqueMinimo.QREstoque.Print;
      end;
   FrmQRelEstoqueMinimo.QREstoque.QRPrinter:= nil;
   dm.IBTransaction.Commit;
   QRelAbaixo.Close;
end;

procedure TFrmRelAbaixoMinimo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelAbaixoMinimo.FormShow(Sender: TObject);
begin 
   CheckSecao.Checked:= true;
   CheckSecaoClick(sender);
   ComboClassif.ItemIndex:= 0;
   RDG.ItemIndex:= 0;
end;

procedure TFrmRelAbaixoMinimo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRelAbaixoMinimo.CheckSecaoClick(Sender: TObject);
begin 
   CheckSecao.SetFocus;
   EdtCodSec.Clear;
   EdtNomeSec.Clear;
   if CheckSecao.Checked then
      GBSecao.Enabled:= false
   else
      begin 
         GBSecao.Enabled:= true;
         EdtCodSec.SetFocus;
      end;
end;

procedure TFrmRelAbaixoMinimo.EdtCodSecEnter(Sender: TObject);
begin 
   EdtCodSec.SelectAll;
end;

procedure TFrmRelAbaixoMinimo.EdtCodSecExit(Sender: TObject);
begin 
   if EdtCodSec.Text = '' then
      exit;
   EdtNomeSec.Text:= consulta('secao', EdtCodSec, 'cod_sec', 'nome_sec', dm.IBTransaction, dm.qConsulta);
   if EdtNomeSec.Text = '' then
      begin 
         AlertaCad('Seção não Cadastrada');
//         EdtCodSec.SetFocus;
      end;
end;

procedure TFrmRelAbaixoMinimo.EdtCodSecKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsSec.Click;
end;

procedure TFrmRelAbaixoMinimo.EdtCodSecKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmRelAbaixoMinimo.BtnConsSecClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsSecao, FrmConsSecao);
   FrmConsSecao.Tag:= 20;
   FrmConsSecao.ShowModal;
end;

end.

