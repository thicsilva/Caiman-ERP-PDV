unit UConsOrcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Mask, StdCtrls, Grids, DBGrids, ExtCtrls, ComCtrls, DB, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmConsOrcamento = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    GB1: TGroupBox;
    ComboCons: TComboBox;
    GB2: TGroupBox;
    EdtCons: TEdit;
    BtnOk: TButton;
    BtnSair: TButton;
    QConsOrcamento: TFDQuery;
    DSQOrcamento: TDataSource;
    QConsOrcamentoCODIGO: TIntegerField;
    QConsOrcamentoSEQUENCIA_DAV: TLargeintField;
    QConsOrcamentoCOD_EMP: TIntegerField;
    QConsOrcamentoDATA: TDateField;
    QConsOrcamentoCOD_CLI: TIntegerField;
    QConsOrcamentoCOD_TPV: TIntegerField;
    QConsOrcamentoCOD_VEND: TIntegerField;
    QConsOrcamentoTOTAL: TBCDField;
    QConsOrcamentoSTATUS: TIntegerField;
    QConsOrcamentoNOME_CLI: TStringField;
    QConsOrcamentoNOME_TPV: TStringField;
    QConsOrcamentoNOME_VEND: TStringField;
    QConsOrcamentoCALC_STATUS: TStringField;
    QConsOrcamentoCOO: TIntegerField;
    QConsOrcamentoCOO_VENDA: TIntegerField;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label3: TLabel;
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
    procedure QConsOrcamentoCalcFields(DataSet: TDataSet);
    procedure BtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsOrcamento: TFrmConsOrcamento;

implementation
uses
  Udm, UQRelOrcamentosEmitidos, UNovoPrincipal;
var  sSql : string;

{$R *.dfm}

procedure TFrmConsOrcamento.ComboConsChange(Sender: TObject);
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
          GB2.Caption        := 'Data';
          EdtDataIni.Visible := true;
          EdtDataFin.Visible := true;
          Label1.Visible     := true;
          EdtCons.Visible    := false;
          EdtDataIni.SetFocus;
       end;
     2:begin 
          gb2.Caption:= '';
          EdtDataIni.Visible := false;
          EdtDataFin.Visible := false;
          Label1.Visible     := false;
          EdtCons.Visible    := true;
          gb2.Enabled        := false;
       end;
   end;
end;

procedure TFrmConsOrcamento.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsOrcamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;

   QConsOrcamento.SQL.Clear;
   QConsOrcamento.SQL.Text:= sSql;
   QConsOrcamento.Close;

   { grava posicao combo }
   dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsOrcamento.ComboCons', inttostr(ComboCons.itemIndex));

   Action:= caFree;
end;

procedure TFrmConsOrcamento.BtnOkClick(Sender: TObject);
var cTotalAbertos, cTotalFechados : currency;
begin 
   cTotalAbertos  := 0;
   cTotalFechados := 0;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsOrcamento do
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
                sql.Add(' WHERE O.SEQUENCIA_DAV = :SEQ AND O.COD_EMP = :CODEMP');
                Parambyname('seq').AsInteger    := strtoint(edtcons.Text);
                Parambyname('codemp').AsInteger := iEmp;
             end;
           1:begin 
                sql.Add(' WHERE O.DATA BETWEEN :DATAINI AND :DATAFIN ' +
                        ' AND O.COD_EMP = :CODEMP ORDER BY O.CODIGO');
                Parambyname('dataini').Asdate   := EdtDataIni.Date;
                Parambyname('datafin').Asdate   := EdtDataFin.Date;
                Parambyname('codemp').AsInteger := iEmp;
             end;
           2:begin 
                sql.Add(' WHERE O.STATUS = 0 AND O.COD_EMP = :CODEMP ORDER BY O.CODIGO');
                Parambyname('codemp').AsInteger := iEmp;
             end;
         end;
         open;
         DisableControls;

         while not eof do
            begin 
               if QConsOrcamentoSTATUS.AsInteger = 0 then
                  cTotalAbertos:= cTotalAbertos + QConsOrcamentoTOTAL.AsCurrency
               else
                  cTotalFechados:= cTotalFechados + QConsOrcamentoTOTAL.AsCurrency;
               next;
            end;
         First;
         EnableControls;
         
      end;
   Label3.Caption:= currtostrf(cTotalAbertos, ffnumber, 2);
   Label5.Caption:= currtostrf(cTotalFechados, ffnumber, 2);
   Label7.Caption:= currtostrf(cTotalAbertos + cTotalFechados, ffnumber, 2);
end;

procedure TFrmConsOrcamento.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsOrcamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmConsOrcamento.FormShow(Sender: TObject);
begin 
   sSql:= QConsOrcamento.SQL.Text;
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;

   {busca a posicao do combo}
   try
     ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsOrcamento.ComboCons'));
   except
     ComboCons.ItemIndex:= 0;
   end;

   ComboConsChange(ComboCons);
end;

procedure TFrmConsOrcamento.EdtConsKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0; 
end;

procedure TFrmConsOrcamento.QConsOrcamentoCalcFields(DataSet: TDataSet);
begin 
   case QConsOrcamentoSTATUS.AsInteger of
    0: QConsOrcamentoCALC_STATUS.AsString:= 'ABERTO';
    1: QConsOrcamentoCALC_STATUS.AsString:= 'FECHADO';
   end;
end;

procedure TFrmConsOrcamento.BtnImprimirClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmQRelOrcamentosEmitidos, FrmQRelOrcamentosEmitidos);
   FrmQRelOrcamentosEmitidos.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;

   if ComboCons.ItemIndex = 1 then
      FrmQRelOrcamentosEmitidos.QRLTitulo.Caption:= 'Orcamentos Emitidos no Período: ' + datetostr(EdtDataIni.Date) + ' a ' + datetostr(EdtDataFin.Date)
   else
   if ComboCons.ItemIndex = 2 then
      FrmQRelOrcamentosEmitidos.QRLTitulo.Caption:= 'Orcamentos Emitidos  - Em Abertos'
   else
      FrmQRelOrcamentosEmitidos.QRLTitulo.Caption:= 'Orcamentos Emitidos';

   FrmQRelOrcamentosEmitidos.QRLabel8.Caption:= Label3.Caption;
   FrmQRelOrcamentosEmitidos.QRLabel13.Caption:= Label5.Caption;
   FrmQRelOrcamentosEmitidos.QRLabel15.Caption:= Label7.Caption;

   FrmQRelOrcamentosEmitidos.QROrcamento.PreviewInitialState:= wsMaximized;
   FrmQRelOrcamentosEmitidos.QROrcamento.Preview;
   FrmQRelOrcamentosEmitidos.QROrcamento.QRPrinter:= nil;

end;

end.
