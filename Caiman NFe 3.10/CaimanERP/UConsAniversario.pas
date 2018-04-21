unit UConsAniversario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Forms, Dialogs, DB, StdCtrls, 
  ComCtrls, ExtCtrls, Controls, Grids, DBGrids, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmConsAniversario = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    QCliente: TFDQuery;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    GroupBox2: TGroupBox;
    ComboCons: TComboBox;
    BtnOk: TButton;
    BtnSair: TButton;
    DSCliente: TDataSource;
    QClienteCOD_CLI: TIntegerField;
    QClienteNOME_CLI: TStringField;
    QClienteTELRES_CLI: TStringField;
    QClienteTELCOM_CLI: TStringField;
    QClienteNASCIMENTO_CLI: TDateField;
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    QFilho: TFDQuery;
    QFilhoNOME: TStringField;
    QFilhoDATA_NASCIMENTO: TDateField;
    QFilhoNOME_CLI: TStringField;
    QFilhoCOD_CLI: TIntegerField;
    QFilhoTELRES_CLI: TStringField;
    QFilhoTELCOM_CLI: TStringField;
    DSFilho: TDataSource;
    DBGridFilho: TDBGrid;
    DBGridCliente: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsAniversario: TFrmConsAniversario;

implementation
uses
  Udm, UQRelAniverCliente, UQRelAniverFilho, UNovoPrincipal;
var sSqlCliente, sSqlFilho : string;

{$R *.dfm}

procedure TFrmConsAniversario.FormShow(Sender: TObject);
begin 
   RadioGroup1.ItemIndex:= 0;
   RadioGroup1Click(self);
   sSqlCliente:= QCliente.SQL.Text;
   sSqlFilho  := QFilho.SQL.Text;
   combocons.ItemIndex:= 0;
   edtdataini.Date:= date;
   edtdatafin.Date:= date;
end;

procedure TFrmConsAniversario.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsAniversario.BtnOkClick(Sender: TObject);
begin 
   if edtdatafin.Date < edtdataini.Date then
      begin 
         AlertaCad('A data final não pode ser menor que a data inicial');
//         edtdataini.SetFocus;
         exit;
      end;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   if RadioGroup1.ItemIndex = 0 then
      begin 
         with QCliente do
           begin 
              close;
              sql.clear;
              sql.Text:= sSqlCliente;
              parambyname('dia1').AsInteger := strtoint(copy(datetostr(EdtDataIni.Date), 1,2));
              parambyname('dia2').AsInteger := strtoint(copy(datetostr(EdtDataFin.Date), 1,2));
              parambyname('mes1').AsInteger := strtoint(copy(datetostr(EdtDataIni.Date), 4,2));
              parambyname('mes2').AsInteger := strtoint(copy(datetostr(EdtDataFin.Date), 4,2));
              case combocons.ItemIndex of
               0: sql.Add(' ORDER BY NOME_CLI');
               1: sql.Add(' ORDER BY COD_CLI');
               2: sql.add(' ORDER BY NASCIMENTO_CLI');
              end;
              open;
              if recordcount = 0 then
                 AlertaCad('Nenhum aniversariante neste período !');
           end;
         dm.IBTransaction.CommitRetaining;
      end
   else
      begin 
         with QFilho do
           begin 
              close;
              sql.clear;
              sql.Text:= sSqlFilho;
              parambyname('dia1').AsInteger:= strtoint(copy(datetostr(EdtDataIni.Date), 1,2));
              parambyname('dia2').AsInteger:= strtoint(copy(datetostr(EdtDataFin.Date), 1,2));
              parambyname('mes1').AsInteger:= strtoint(copy(datetostr(EdtDataIni.Date), 4,2));
              parambyname('mes2').AsInteger:= strtoint(copy(datetostr(EdtDataFin.Date), 4,2));
              case combocons.ItemIndex of
               0: sql.Add(' ORDER BY F.NOME');
               1: sql.Add(' ORDER BY C.COD_CLI');
               2: sql.add(' ORDER BY F.DATA_NASCIMENTO');
              end;
              open;
              if recordcount = 0 then
                 AlertaCad('Nenhum aniversariante neste período !');
           end;
         dm.IBTransaction.CommitRetaining;
      end;
end;

procedure TFrmConsAniversario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QCliente.SQL.Clear;
   QCliente.sql.Text:= sSqlCliente;
   QFilho.SQL.Text  := sSqlFilho;
   QCliente.Close;
   QFilho.Close;
   Action:= caFree;
end;

procedure TFrmConsAniversario.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsAniversario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      btnsair.Click;
end;

procedure TFrmConsAniversario.RadioGroup1Click(Sender: TObject);
begin 
   if RadioGroup1.ItemIndex = 0 then
      begin 
         DBGridFilho.Visible   := false;
         DBGridCliente.Visible := true;
      end
   else
      begin 
         DBGridFilho.Visible   := true;
         DBGridCliente.Visible := false;
      end;
end;

procedure TFrmConsAniversario.Button1Click(Sender: TObject);
begin 
   if RadioGroup1.ItemIndex = 0 then
      begin 
         Application.CreateForm(TFrmQRelAniverCliente, FrmQRelAniverCliente);
         FrmQRelAniverCliente.QRLTitulo.Caption:= 'Relatorio de Cliente [Aniversariantes] no Período ' +
         datetostr(EdtDataIni.Date) + ' a ' + DateToStr(EdtDataFin.Date);
         FrmQRelAniverCliente.QRAniver.PreviewInitialState:= wsMaximized;
         FrmQRelAniverCliente.QRAniver.Preview;
         FrmQRelAniverCliente.QRAniver.QRPrinter:= nil;
      end
   else
      begin 
         Application.CreateForm(TFrmQRelAniverFilho, FrmQRelAniverFilho);
         FrmQRelAniverFilho.QRLTitulo.Caption:= 'Relatorio de Filhos [Aniversariantes] no Período ' +
         datetostr(EdtDataIni.Date) + ' a ' + DateToStr(EdtDataFin.Date);
         FrmQRelAniverFilho.QRAniver.PreviewInitialState:= wsMaximized;
         FrmQRelAniverFilho.QRAniver.Preview;
         FrmQRelAniverFilho.QRAniver.QRPrinter:= nil;
      end;
end;

end.
