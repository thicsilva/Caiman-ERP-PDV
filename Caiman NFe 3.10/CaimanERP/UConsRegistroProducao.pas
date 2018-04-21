unit UConsRegistroProducao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ComCtrls, Grids, DBGrids, ExtCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmConsRegistroProducao = class(UNovoFormulario.TForm)
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    BtnLocalizar: TButton;
    Panel1: TPanel;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    CheckEmp: TCheckBox;
    BtnOk: TButton;
    BtnSair: TButton;
    QCons: TFDQuery;
    DSCons: TDataSource;
    QConsCODIGO: TIntegerField;
    QConsDATA: TDateField;
    QConsCOD_EMP: TIntegerField;
    QConsCODIGO_LOCAL_ESTOQUE: TIntegerField;
    QConsDESCRICAO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsRegistroProducao: TFrmConsRegistroProducao;

implementation
uses
  Udm, Ubibli1, URegistroProducao, UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsRegistroProducao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QCons.Close;
   Action:= caFree;
end;

procedure TFrmConsRegistroProducao.FormShow(Sender: TObject);
begin 
   EdtDataIni.Date  := date;
   EdtDataFin.Date  := date;
   CheckEmp.Checked := false;
   EdtDataIni.SetFocus;
end;

procedure TFrmConsRegistroProducao.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsRegistroProducao.BtnOkClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QCons do
      begin 
         close;
         sql.Clear;
         sql.Text:= 'SELECT R.*, L.DESCRICAO     ' +
                    'FROM REGISTRO_PRODUCAO R    ' +
                    'INNER JOIN LOCAIS_ESTOQUE L ' +
                    'ON (R.CODIGO_LOCAL_ESTOQUE = L.CODIGO) ' +
                    'WHERE R.DATA BETWEEN :DATAINI AND :DATAFIN ';

         if (not CheckEmp.Checked) then
            begin 
               sql.Add(' AND R.COD_EMP = :CODEMP');
               Parambyname('codemp').AsInteger:= iEmp;
            end;
         sql.Add(' ORDER BY R.DATA, R.CODIGO');
         Parambyname('dataini').AsDate:= EdtDataIni.Date;
         Parambyname('datafin').AsDate:= EdtDataFin.Date;
         open;
      end;
end;

procedure TFrmConsRegistroProducao.BtnLocalizarClick(Sender: TObject);
begin 
   if QConsCOD_EMP.AsInteger <> iEmp then
      begin 
         AlertaCad('Você está logado na empresa ' + inttostr(iEmp) + #13 +
                     'Este Registro pertence à empresa ' + QConsCOD_EMP.AsString);
         exit;
      end;

   if (tag = 0) or (tag = 1) then
      begin 
         BuscaFormulario( TFrmRegistroProducao, True );
         with FrmRegistroProducao do
            begin
               FrmRegistroProducao.tag := 1;
               EdtCodigo.Text       := QConsCODIGO.AsString;
               EdtData.Date         := QConsDATA.Value;
               EdtCodLocal.Text     := QConsCODIGO_LOCAL_ESTOQUE.AsString;
               EdtNomeLocal.Text    := QConsDESCRICAO.AsString;
               BuscaItens;
               show;
               FormShow(sender);
            end;
         FrmConsRegistroProducao.close;
      end;
end;

procedure TFrmConsRegistroProducao.FormKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsRegistroProducao.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_escape then
      btnsair.Click;
end;

end.
