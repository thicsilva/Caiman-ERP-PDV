unit UConsAcrescimos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Mask, Grids, DBGrids, DB, 
  rxToolEdit, rxCurrEdit, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmConsAcrescimos = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    CheckEmp: TCheckBox;
    BtnOK: TBitBtn;
    BtnSair: TBitBtn;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    EdtTotal: TCurrencyEdit;
    QConsAcres: TFDQuery;
    DSQConsAcres: TDataSource;
    QConsAcresACRESCIMO_VEN: TBCDField;
    QConsAcresDATA_VEN: TDateField;
    QConsAcresCOD_CLI: TIntegerField;
    QConsAcresNOME_CLI: TStringField;
    QConsAcresCOD_VEN: TIntegerField;
    QConsAcresTOTAL_VEN: TBCDField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsAcrescimos: TFrmConsAcrescimos;

implementation
uses
  Udm, UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsAcrescimos.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsAcrescimos.FormShow(Sender: TObject);
begin 
   edtdataini.Date:= date;
   edtdatafin.Date:= date;
   EdtTotal.clear;
   edtdataini.SetFocus;
end;

procedure TFrmConsAcrescimos.BtnOKClick(Sender: TObject);
var cTotal : Currency;
begin 
   cTotal:= 0;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsAcres do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT V.COD_VEN, V.ACRESCIMO_VEN, V.DATA_VEN, V.COD_CLI, V.TOTAL_VEN, C.NOME_CLI ' +
                 'FROM VENDAS V ' +
                 'INNER JOIN CLIENTE C ' +
                 'ON (V.COD_CLI = C.COD_CLI) ' +
                 'WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                 'AND V.ACRESCIMO_VEN > 0');
         if (not CheckEmp.Checked) then
            begin 
               sql.Add(' AND V.COD_EMP = :CODEMP');
               Parambyname('codemp').AsInteger:= iEmp;
            end;
         sql.Add(' ORDER BY V.DATA_VEN');
         Parambyname('dataini').AsDate:= edtdataini.Date;
         Parambyname('datafin').AsDate:= edtdatafin.Date;
         open;
         DisableControls;
         First;
         while not eof do
            begin 
               cTotal:= cTotal + QConsAcresACRESCIMO_VEN.AsCurrency;
               next;
            end;
         First;
         EnableControls;
      end;
   EdtTotal.Text:= CurrToStr(cTotal);
end;

procedure TFrmConsAcrescimos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QConsAcres.Close;
   Action:= caFree;
end;

end.
