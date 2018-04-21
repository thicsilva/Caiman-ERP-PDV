unit UConsOrdemServico;

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
  TFrmConsOrdemServico = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    GB1: TGroupBox;
    ComboCons: TComboBox;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtCons: TEdit;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    BtnOk: TButton;
    BtnSair: TButton;
    QOS: TFDQuery;
    DSOS: TDataSource;
    QOSCODIGO: TIntegerField;
    QOSSEQUENCIA_DAV: TLargeintField;
    QOSDATA_ABERTURA: TDateField;
    QOSDATA_FECHAMENTO: TDateField;
    QOSCODIGO_MARCA: TIntegerField;
    QOSCODIGO_MODELO: TIntegerField;
    QOSANO_FABRICACAO: TIntegerField;
    QOSPLACA: TStringField;
    QOSRENAVAM: TStringField;
    QOSCOD_CLI: TIntegerField;
    QOSCOD_TPV: TIntegerField;
    QOSNUMERO_SERIE: TStringField;
    QOSCOD_CAI: TIntegerField;
    QOSCOD_EMP: TIntegerField;
    QOSCOO: TIntegerField;
    QOSCOO_VENDA: TIntegerField;
    QOSTOTAL: TBCDField;
    QOSFLAG_TRANSFERIDA: TIntegerField;
    QOSNOME_CLI: TStringField;
    QOSNOME_TPV: TStringField;
    QOSCALC_STATUS: TStringField;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BtnImprimir: TButton;
    procedure ComboConsChange(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure EdtConsKeyPress(Sender: TObject; var Key: Char);
    procedure QOSCalcFields(DataSet: TDataSet);
    procedure BtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsOrdemServico: TFrmConsOrdemServico;

implementation
uses
  Udm, UQRelOSEmitidas, UNovoPrincipal;
var  sSql : string;

{$R *.dfm}

procedure TFrmConsOrdemServico.ComboConsChange(Sender: TObject);
begin 
   EdtCons.Clear;
   case ComboCons.ItemIndex of
     0:begin 
          gb2.Enabled        := true;
          GB2.Caption        := 'Código do Orçamento';
          EdtDataIni.Visible := false;
          EdtDataFin.Visible := false;
          Label1.Visible     := false;
          EdtCons.Visible    := true;
          edtcons.SetFocus;
       end;
     1:begin 
          gb2.Enabled        := true;
          GB2.Caption        := 'Data Abertura';
          EdtDataIni.Visible := true;
          EdtDataFin.Visible := true;
          Label1.Visible     := true;
          EdtCons.Visible    := false;
          EdtDataIni.SetFocus;
       end;
     2:begin 
          gb2.Enabled        := true;
          GB2.Caption        := 'Data Fechamento';
          EdtDataIni.Visible := true;
          EdtDataFin.Visible := true;
          Label1.Visible     := true;
          EdtCons.Visible    := false;
          EdtDataIni.SetFocus;
       end;
   end;
end;

procedure TFrmConsOrdemServico.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsOrdemServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;

   QOS.SQL.Clear;
   QOS.SQL.Text:= sSql;
   QOS.Close;

   { grava posicao combo }
   dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsOrdemServico.ComboCons', inttostr(ComboCons.itemIndex));

   Action:= caFree;
end;

procedure TFrmConsOrdemServico.BtnOkClick(Sender: TObject);
var cAbertas, cFechadas : currency;
begin 
   cAbertas:= 0;
   cFechadas:= 0;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QOS do
      begin 
         close;
         sql.Clear;
         sql.Text:= sSql;
         case ComboCons.ItemIndex of
           0:begin 
                if edtcons.Text = '' then
                   begin 
                      edtcons.SetFocus;
                      exit;
                   end;
                sql.Add(' WHERE O.SEQUENCIA_DAV = :SEQ AND O.COD_EMP = :CODEMP AND FLAG_TRANSFERIDA = 0');
                Parambyname('seq').AsInteger    := strtoint(edtcons.Text);
                Parambyname('codemp').AsInteger := iEmp;
             end;
           1:begin 
                sql.Add(' WHERE O.DATA_ABERTURA BETWEEN :DATAINI AND :DATAFIN AND FLAG_TRANSFERIDA = 0 ' +
                        ' AND O.COD_EMP = :CODEMP ORDER BY O.CODIGO');
                Parambyname('dataini').Asdate   := EdtDataIni.Date;
                Parambyname('datafin').Asdate   := EdtDataFin.Date;
                Parambyname('codemp').AsInteger := iEmp;
             end;
           2:begin 
                sql.Add(' WHERE O.DATA_FECHAMENTO BETWEEN :DATAINI AND :DATAFIN AND FLAG_TRANSFERIDA = 0 ' +
                        ' AND O.COD_EMP = :CODEMP ORDER BY O.CODIGO');
                Parambyname('dataini').Asdate   := EdtDataIni.Date;
                Parambyname('datafin').Asdate   := EdtDataFin.Date;
                Parambyname('codemp').AsInteger := iEmp;
             end;
         end;
         open;
         DisableControls;

         while not eof do
            begin 
               if QOSFLAG_TRANSFERIDA.AsInteger = 0 then
                  begin 
                     if QOSDATA_FECHAMENTO.IsNull then
                        cAbertas:= cAbertas + QOSTOTAL.AsCurrency
                     else
                        cFechadas:= cFechadas + QOSTOTAL.AsCurrency;
                  end;
               next;
            end;
         First;
         EnableControls;
         
      end;
   Label3.Caption:= currtostrf(cAbertas, ffnumber, 2);
   Label5.Caption:= currtostrf(cFechadas, ffnumber, 2);
   Label7.Caption:= currtostrf(cAbertas + cFechadas, ffnumber, 2);
end;

procedure TFrmConsOrdemServico.FormKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsOrdemServico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmConsOrdemServico.FormShow(Sender: TObject);
begin 
   sSql:= QOS.SQL.Text;
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;

   {busca a posicao do combo}
   try
     ComboCons.ItemIndex:= strtoint(dm.LeIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsOrdemServico.ComboCons'));
   except
     ComboCons.ItemIndex:= 0;
   end;

   ComboConsChange(ComboCons);
end;

procedure TFrmConsOrdemServico.EdtConsKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmConsOrdemServico.QOSCalcFields(DataSet: TDataSet);
begin 
   case QOSFLAG_TRANSFERIDA.AsInteger of
     0: QOSCALC_STATUS.AsString:= '';
     1: QOSCALC_STATUS.AsString:= 'TRANSFERIDO';
   end;
end;

procedure TFrmConsOrdemServico.BtnImprimirClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmQRelOsEmitidas, FrmQRelOsEmitidas);
   FrmQRelOsEmitidas.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;

   if ComboCons.ItemIndex = 1 then
      FrmQRelOsEmitidas.QRLTitulo.Caption:= 'OS Abertas no Período : ' + datetostr(EdtDataIni.Date) + ' a ' + datetostr(EdtDataFin.Date)
   else
   if ComboCons.ItemIndex = 2 then
      FrmQRelOsEmitidas.QRLTitulo.Caption:= 'OS Fechadas no Período: ' + datetostr(EdtDataIni.Date) + ' a ' + datetostr(EdtDataFin.Date)
   else
      FrmQRelOsEmitidas.QRLTitulo.Caption:= 'OS Emitidas';

   FrmQRelOsEmitidas.QRLabel8.Caption:= Label3.Caption;
   FrmQRelOsEmitidas.QRLabel13.Caption:= Label5.Caption;
   FrmQRelOsEmitidas.QRLabel15.Caption:= Label7.Caption;

   FrmQRelOsEmitidas.QROS.PreviewInitialState:= wsMaximized;
   FrmQRelOsEmitidas.QROS.Preview;
   FrmQRelOsEmitidas.QROS.QRPrinter:= nil;
end;

end.
