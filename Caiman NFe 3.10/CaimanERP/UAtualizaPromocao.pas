unit UAtualizaPromocao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmAtualizaPromocao = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    SB: TStatusBar;
    GroupBox1: TGroupBox;
    EdtData: TDateTimePicker;
    BtnOK: TBitBtn;
    BtnSair: TBitBtn;
    QEntraPromocao: TFDQuery;
    CheckProg: TCheckBox;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAtualizaPromocao: TFrmAtualizaPromocao;

implementation
uses
  Udm, Ubibli1;

{$R *.dfm}

procedure TFrmAtualizaPromocao.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmAtualizaPromocao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   Action:= caFree;
end;

procedure TFrmAtualizaPromocao.BtnOKClick(Sender: TObject);
begin 
   {ZERANDO AS PROMOCOES}
   sb.SimpleText:= 'Zerando as promoções... Aguarde!';
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.Consulta do
      begin 
         close;
         sql.Clear;
         sql.add('UPDATE PRODUTO SET PROMOCAO_PRO = 0 ' +
                 'WHERE PROMOCAO_PRO > 0');
         ExecOrOpen;
      end;
   dm.IBTransaction.Commit;
   dm.Consulta.Close;

   {ATUALIZANDO AS PROMOCOES}
   sb.SimpleText:= 'Incluindo as Promoções... Aguarde!';
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QEntraPromocao do
      begin 
         close;
         Parambyname('termino').AsDate   := edtdata.Date;
         Parambyname('inicio').AsDate    := Date;
         Parambyname('codemp').AsInteger := iEmp;
         open;
         while not eof do
            begin 
               dm.Consulta.Close;
               dm.Consulta.sql.Clear;
               dm.Consulta.SQL.Add('UPDATE PRODUTO SET PROMOCAO_PRO = :PROMOCAO ' +
                                   'WHERE COD_PRO = :CODPRO');
               dm.Consulta.ParamByName('promocao').AsCurrency:= fieldbyname('valor_promocao').AsCurrency;
               dm.Consulta.ParamByName('codpro').AsInteger   := fieldbyname('cod_pro').AsInteger;
               dm.Consulta.ExecOrOpen;
               next;
            end;
      end;
   dm.IBTransaction.Commit;
   dm.Consulta.Close;
   QEntraPromocao.Close;

   if CheckProg.Checked then
      begin 
         { ATUALIZANDO OS PRODUTOS PROGRAMADOS }
         sb.SimpleText:= 'Atualizando os preços programados... Aguarde!';
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;

         dm.QConsulta.Close;
         dm.qConsulta.sql.Clear;
         dm.QConsulta.SQL.Add('UPDATE PRODUTO SET VALOR_PRO = PRECO_PROGRAMADO ' +
                              'WHERE PRECO_PROGRAMADO > 0');
         dm.QConsulta.ExecOrOpen;
         dm.IBTransaction.Commit;

         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         dm.QConsulta.Close;
         dm.QConsulta.sql.Clear;
         dm.QConsulta.SQL.Add('UPDATE PRODUTO SET PRECO_PROGRAMADO = 0 WHERE PRECO_PROGRAMADO > 0');
         dm.QConsulta.ExecOrOpen;

         dm.IBTransaction.Commit;
         dm.QConsulta.Close;
      end;

   sb.SimpleText:= '';
   AlertaCad('Processo Concluído');
end;

procedure TFrmAtualizaPromocao.FormShow(Sender: TObject);
begin 
   EdtData.Date:= date;
   EdtData.SetFocus;
end;

procedure TFrmAtualizaPromocao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.



