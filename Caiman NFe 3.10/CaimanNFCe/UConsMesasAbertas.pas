unit UConsMesasAbertas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Grids, DBGrids, DB, ComCtrls, ExtCtrls, StdCtrls, Buttons, Mask, 
  rxToolEdit, rxCurrEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmConsMesasAbertas = class(TForm)
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    QConsConta: TFDQuery;
    DSConta: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    EdtTotal: TCurrencyEdit;
    Panel3: TPanel;
    BtnAbertas: TBitBtn;
    BtnFechadas: TBitBtn;
    BtnTodas: TBitBtn;
    GroupBox1: TGroupBox;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    Label2: TLabel;
    QConsContaCONTA: TIntegerField;
    QConsContaDATA_ABERTURA: TDateField;
    QConsContaDATA_FECHAMENTO: TDateField;
    QConsContaHORA_ABERTURA: TTimeField;
    QConsContaHORA_FECHAMENTO: TTimeField;
    QConsContaSTATUS: TIntegerField;
    QConsContaTOTAL: TBCDField;
    QConsContaCALC_STATUS: TStringField;
    QConsContaCALC_TEMPO: TTimeField;
    IBTRCons: TFDTransaction;
    BtnCanceladas: TBitBtn;
    QConsContaDESCRICAO: TStringField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QConsContaCalcFields(DataSet: TDataSet);
    procedure BtnAbertasClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsMesasAbertas: TFrmConsMesasAbertas;

implementation
uses
  Udm, UMenuFiscal;
var sSql : string;

{$R *.dfm}

procedure TFrmConsMesasAbertas.BtnSairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmConsMesasAbertas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close
   else
      if key = vk_f10 then
         begin
            Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
            FrmMenuFiscal.showmodal;
         end;
end;

procedure TFrmConsMesasAbertas.FormShow(Sender: TObject);
begin
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;

   sSql:= QConsConta.SQL.Text;
   if IBTRCons.Active then
      IBTRCons.Commit;
   QConsConta.Close;
   EdtTotal.Clear;
   BtnAbertas.SetFocus;
end;

procedure TFrmConsMesasAbertas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if IBTRCons.Active then
      IBTRCons.Commit;
   QConsConta.Close;
   Action:= caFree;
   Self := nil;
end;

procedure TFrmConsMesasAbertas.FormCreate(Sender: TObject);
begin
   dm.ScaleForm( Self, False );
end;

procedure TFrmConsMesasAbertas.QConsContaCalcFields(DataSet: TDataSet);
var Abertura, Fechamento : TDateTime;
begin
   Abertura:= StrToDateTime(QConsContaDATA_ABERTURA.AsString + QConsContaHORA_ABERTURA.AsString);
   case QConsContaSTATUS.AsInteger of
    0: begin
          QConsContaCALC_STATUS.AsString:= 'ABERTA';
          QConsContaCALC_TEMPO.Value:= Now - Abertura;
       end;
    1: begin
          Fechamento:= StrToDateTime(QConsContaDATA_FECHAMENTO.AsString + QConsContaHORA_FECHAMENTO.AsString);
          QConsContaCALC_STATUS.AsString:= 'FECHADA';
          QConsContaCALC_TEMPO.Value:= Fechamento - Abertura;
       end;
    2: begin
          Fechamento:= StrToDateTime(QConsContaDATA_FECHAMENTO.AsString + QConsContaHORA_FECHAMENTO.AsString);
          QConsContaCALC_STATUS.AsString:= 'CANCELADA';
          QConsContaCALC_TEMPO.Value:= Fechamento - Abertura;
       end;
   end;
end;

procedure TFrmConsMesasAbertas.BtnAbertasClick(Sender: TObject);
var cTotal : currency;
begin
   cTotal:= 0;
   if IBTRCons.Active then
      IBTRCons.Commit;
   IBTRCons.StartTransaction;
   with QConsConta do
     begin
        close;
        sql.Clear;
        sql.Text:= sSql;

        if sender = BtnAbertas then
           sql.add(' WHERE STATUS = 0' +
                   ' ORDER BY CONTA')
        else
        if sender = BtnFechadas then
           begin
              sql.add(' WHERE DATA_FECHAMENTO BETWEEN :DATAINI AND :DATAFIN AND STATUS = 1 ' +
                      ' ORDER BY CONTA');
              Parambyname('dataini').AsDate:= EdtDataIni.Date;
              Parambyname('datafin').AsDate:= EdtDataFin.Date;
            end
        else
        if sender = BtnCanceladas then
           begin
              sql.add(' WHERE DATA_FECHAMENTO BETWEEN :DATAINI AND :DATAFIN AND STATUS = 2 ' +
                      ' ORDER BY CONTA');
              Parambyname('dataini').AsDate:= EdtDataIni.Date;
              Parambyname('datafin').AsDate:= EdtDataFin.Date;
            end
        else
        if sender = BtnTodas then
           begin
              sql.add(' WHERE DATA_ABERTURA BETWEEN :DATAINI AND :DATAFIN ' +
                      ' ORDER BY CONTA');
              Parambyname('dataini').AsDate:= EdtDataIni.Date;
              Parambyname('datafin').AsDate:= EdtDataFin.Date;
           end;

        open;
        DisableControls;
        First;
        while not eof do
           begin
              cTotal:= cTotal + QConsContaTOTAL.AsCurrency;
              next;
           end;
        First;
        EnableControls;
     end;
   EdtTotal.Text:= currtostr(cTotal);
end;

procedure TFrmConsMesasAbertas.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if QConsContaSTATUS.AsInteger = 2 then
      begin
         DBGrid1.Canvas.Font.Color:= clRed;
         Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
      end;
end;

end.
