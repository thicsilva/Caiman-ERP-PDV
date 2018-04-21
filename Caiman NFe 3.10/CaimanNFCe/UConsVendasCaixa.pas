unit UConsVendasCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, rxToolEdit, rxCurrEdit, StdCtrls, Buttons, Mask, ExtCtrls, ComCtrls, 
  DB, Grids, DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmConsVendasCaixa = class(TForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    EdtDataIni: TMaskEdit;
    EdtDataFin: TMaskEdit;
    EdtHoraIni: TMaskEdit;
    EdtHoraFin: TMaskEdit;
    CheckHora: TCheckBox;
    BtnOK: TBitBtn;
    BitBtn1: TBitBtn;
    Panel4: TPanel;
    Label9: TLabel;
    EdtTotalVendas: TCurrencyEdit;
    StatusBar1: TStatusBar;
    DBGrid2: TDBGrid;
    QTotalFormas: TFDQuery;
    QTotalFormasTOTAL: TBCDField;
    QTotalFormasCOD_FORMA: TIntegerField;
    QTotalFormasDESCRICAO: TStringField;
    QTotalFormasTIPO: TStringField;
    DSFormas: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckHoraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsVendasCaixa: TFrmConsVendasCaixa;

implementation
uses
  Udm;

{$R *.dfm}

procedure TFrmConsVendasCaixa.BitBtn1Click(Sender: TObject);
begin
   close;
end;

procedure TFrmConsVendasCaixa.BtnOKClick(Sender: TObject);
var cTotalVendas : currency;
begin
   cTotalVendas:= 0;

   { BUSCA TOTAIS DAS VENDAS }
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   with QTotalFormas do
      begin
         close;
         sql.Clear;
         sql.Text:= 'SELECT SUM(I.VALOR) TOTAL, I.COD_FORMA, F.DESCRICAO, F.TIPO  ' +
                    'FROM VENDAS_FORMAS_PAGAMENTO I ' +
                    'INNER JOIN VENDAS V            ' +
                    'ON (I.COD_VENDA = V.COD_VEN)   ' +
                    'INNER JOIN FORMAS_PAGAMENTO F  ' +
                    'ON (I.COD_FORMA = F.CODIGO)';

         if not CheckHora.Checked then
            begin
               sql.Add(' WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                       ' AND V.CANCELADA_VEN = 0');
               Parambyname('dataini').AsDate := strtodate(edtdataini.Text);
               Parambyname('datafin').AsDate := strtodate(edtdatafin.Text);
            end
         else
            begin
               sql.Add(' WHERE V.DATA_HORA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                       ' AND V.CANCELADA_VEN = 0');
               Parambyname('dataini').AsDateTime := strtodate(edtdataini.Text) + strtotime(edthoraini.Text);
               Parambyname('datafin').AsDateTime := strtodate(edtdatafin.Text) + strtotime(edthorafin.Text);
            end;

         sql.Add(' AND V.COD_CAI = :CODCAI AND V.COD_EMP = :CODEMP AND V.COD_USU = :CODUSU ' +
                 ' GROUP BY I.COD_FORMA, F.DESCRICAO, F.TIPO ' +
                 ' ORDER BY F.DESCRICAO');

         parambyname('codcai').AsInteger:= iCaixa;
         parambyname('codemp').AsInteger:= iEmp;
         parambyname('codusu').AsInteger:= ICodUsu;

         open;
         first;

         DisableControls;
         while not eof do
           begin
              if ( trim(QTotalFormasTIPO.AsString) <> 'TR' ) and ( trim(QTotalFormasTIPO.AsString) <> 'TV' ) then
                 cTotalVendas:= cTotalVendas + QTotalFormasTOTAL.AsCurrency
              else
                 cTotalVendas:= cTotalVendas - QTotalFormasTOTAL.AsCurrency;
              next;
           end;
         first;
         EnableControls;

         EdtTotalVendas.Text:= currtostr(cTotalVendas);
      end;
end;

procedure TFrmConsVendasCaixa.FormShow(Sender: TObject);
begin

   CheckHora.Checked:= false;
   CheckHoraClick(self);
   EdtDataIni.Text:= datetostr(Date);
   EdtDataFin.Text:= datetostr(Date);
   BtnOK.Click;
end;

procedure TFrmConsVendasCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close;
end;

procedure TFrmConsVendasCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   QTotalFormas.Close;
   Action:= caFree;
   Self := nil;
end;

procedure TFrmConsVendasCaixa.FormCreate(Sender: TObject);
begin
   dm.ScaleForm( Self, False );
end;

procedure TFrmConsVendasCaixa.CheckHoraClick(Sender: TObject);
begin
   EdtHoraIni.Clear;
   EdtHoraFin.Clear;
   if CheckHora.Checked then
      begin
         EdtHoraIni.Enabled:= true;
         EdtHoraFin.Enabled:= true;
         EdtHoraIni.SetFocus;
      end
   else
      begin
         BtnOK.SetFocus;
         EdtHoraIni.Enabled:= false;
         EdtHoraFin.Enabled:= false;
      end;
end;

end.
