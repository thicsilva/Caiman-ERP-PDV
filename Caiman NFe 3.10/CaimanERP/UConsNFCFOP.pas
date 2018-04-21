unit UConsNFCFOP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, ExtCtrls, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmConsNFCFOP = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    BtnOK: TBitBtn;
    BtnSair: TBitBtn;
    DBGrid1: TDBGrid;
    QConsNF: TFDQuery;
    DSQConsNF: TDataSource;
    QConsNFCOD_CFO: TIntegerField;
    QConsNFNOME_CFO: TStringField;
    QConsNFTOTAL: TBCDField;
    BtnImp: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnImpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsNFCFOP: TFrmConsNFCFOP;

implementation
uses
  Udm, UQRelNFCFOP, UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsNFCFOP.FormShow(Sender: TObject);
begin 
   edtdataini.Date:= date;
   edtdatafin.Date:= date;
   edtdataini.SetFocus;
end;

procedure TFrmConsNFCFOP.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsNFCFOP.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmConsNFCFOP.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsNFCFOP.BtnOKClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsNF do
      begin 
         close;
         Parambyname('dataini').Value := edtdataini.Date;
         Parambyname('datafin').Value := edtdatafin.Date;
         Parambyname('codemp').Value  := iEmp;
         Open;
      end;
end;

procedure TFrmConsNFCFOP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QConsNF.Close;
   Action:= caFree;
end;

procedure TFrmConsNFCFOP.BtnImpClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmQRelNFCFOP, FrmQRelNFCFOP);
   FrmQRelNFCFOP.QRLTitulo.Caption:= 'Relatório das Notas Fiscais Agrupadas por CFOP no período: ' +
   datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
   FrmQRelNFCFOP.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
   FrmQRelNFCFOP.QRNFCFOP.PreviewInitialState:= wsMaximized;
   FrmQRelNFCFOP.QRNFCFOP.Preview;
   FrmQRelNFCFOP.QRNFCFOP.QRPrinter:= nil;
end;

end.
