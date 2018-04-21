unit UConsPreVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls, Mask, Buttons, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmConsPreVenda = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    GB1: TGroupBox;
    ComboCons: TComboBox;
    GB2: TGroupBox;
    EdtCons: TEdit;
    DSQConsPre: TDataSource;
    DBGrid1: TDBGrid;
    QConsPre: TFDQuery;
    BtnOk: TButton;
    BtnSair: TButton;
    QConsPreCOD_PRE: TIntegerField;
    QConsPreDATA_PRE: TDateField;
    QConsPreCOD_CLI: TIntegerField;
    QConsPreCOD_TPV: TIntegerField;
    QConsPreCOD_EMP: TIntegerField;
    QConsPreSTATUS_PRE: TIntegerField;
    QConsPreTOTAL_PRE: TBCDField;
    QConsPreHORA_PRE: TTimeField;
    QConsPreCOD_VENDA: TIntegerField;
    QConsPreDOCUMENTO: TStringField;
    QConsPreOBS_PRE: TStringField;
    QConsPreDESCONTO_PRE: TBCDField;
    QConsPreCOD_VEND: TIntegerField;
    QConsPreSEQUENCIA_PAF: TLargeintField;
    QConsPreSENHA_FECHAR_VENDA: TStringField;
    QConsPreNOME_CLI: TStringField;
    QConsPreNOME_TPV: TStringField;
    QConsPreNOME_VEND: TStringField;
    QConsPreCALC_STATUS: TStringField;
    QConsPreCIDRES_CLI: TStringField;
    QConsPreCNPJ_CLI: TStringField;
    QConsPreESTRES_CLI: TStringField;
    EdtDataIni: TDateTimePicker;
    Label1: TLabel;
    EdtDataFin: TDateTimePicker;
    BtnImprimir: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure ComboConsChange(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtConsKeyPress(Sender: TObject; var Key: Char);
    procedure QConsPreCalcFields(DataSet: TDataSet);
    procedure BtnImprimirClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsPreVenda: TFrmConsPreVenda;

implementation
uses
  Udm, Ubibli1, UQRelPreVendasEmitidas, UNovoPrincipal;
var  sSql       : string;
     iAuxCOO    : integer;
     iAuxCCF    : integer;
     iCodVenda  : integer;

{$R *.dfm}

procedure TFrmConsPreVenda.ComboConsChange(Sender: TObject);
begin 
   EdtCons.Clear;
   case ComboCons.ItemIndex of
     0:begin 
          gb2.Enabled        := true;
          GB2.Caption        := 'Código da Pré-Venda';
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

procedure TFrmConsPreVenda.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsPreVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;

   QConsPre.SQL.Clear;
   QConsPre.SQL.Text:= sSql;
   QConsPre.Close;

   { grava posicao combo }
   dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsPreVenda.ComboCons', inttostr(ComboCons.itemIndex));

   Action:= caFree;
end;

procedure TFrmConsPreVenda.BtnOkClick(Sender: TObject);
var cAbertas, cFechadas, cCanceladas : currency;
begin 
   cAbertas:= 0;
   cFechadas:= 0;
   cCanceladas:= 0;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsPre do
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
                sql.Add(' WHERE P.SEQUENCIA_PAF = :SEQ AND P.COD_EMP = :CODEMP');
                Parambyname('seq').AsInteger    := strtoint(edtcons.Text);
                Parambyname('codemp').AsInteger := iEmp;
                open;
             end;
           1:begin 
                sql.Add(' WHERE P.DATA_PRE BETWEEN :DATAINI AND :DATAFIN AND ' +
                        ' P.COD_EMP = :CODEMP ORDER BY P.COD_PRE');
                Parambyname('dataini').Asdate   := EdtDataIni.Date;
                Parambyname('datafin').Asdate   := EdtDataFin.Date;
                Parambyname('codemp').AsInteger := iEmp;
             end;
           2:begin 
                sql.Add(' WHERE P.STATUS_PRE = 0 AND P.COD_EMP = :CODEMP ORDER BY P.COD_PRE');
                Parambyname('codemp').AsInteger := iEmp;
             end;
         end;
         open;
         while not eof do
            begin 
               if QConsPreSTATUS_PRE.AsInteger = 0 then
                  cAbertas:= cAbertas + QConsPreTOTAL_PRE.AsCurrency
               else
               if QConsPreSTATUS_PRE.AsInteger = 1 then
                  cFechadas:= cFechadas + QConsPreTOTAL_PRE.AsCurrency
               else
               if QConsPreSTATUS_PRE.AsInteger = 2 then
                  cCanceladas:= cCanceladas + QConsPreTOTAL_PRE.AsCurrency;
               next;
            end;
         First;
         EnableControls;
         
      end;
   Label3.Caption:= currtostrf(cAbertas, ffnumber, 2);
   Label5.Caption:= currtostrf(cFechadas, ffnumber, 2);
   Label9.Caption:= currtostrf(cCanceladas, ffnumber, 2);
   Label7.Caption:= currtostrf(cAbertas + cFechadas + cCanceladas, ffnumber, 2);
end;

procedure TFrmConsPreVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsPreVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmConsPreVenda.FormShow(Sender: TObject);
begin 
   sSql:= QConsPre.SQL.Text;
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;

   {busca a posicao do combo}
   try
     ComboCons.ItemIndex:= strtoint(DM.LeIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsPreVenda.ComboCons'));
   except
     ComboCons.ItemIndex:= 0;
   end;

   ComboConsChange(ComboCons);
end;

procedure TFrmConsPreVenda.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin 
   if QConsPreSTATUS_PRE.AsInteger = 2 then
      begin 
         DBGrid1.Canvas.Font.Color:= clRed;
         Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
      end;
end;

procedure TFrmConsPreVenda.EdtConsKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0; 
end;

procedure TFrmConsPreVenda.QConsPreCalcFields(DataSet: TDataSet);
begin 
   case QConsPreSTATUS_PRE.AsInteger of
    0: QConsPreCALC_STATUS.AsString:= 'ABERTA';
    1: QConsPreCALC_STATUS.AsString:= 'FECHADA';
    2: QConsPreCALC_STATUS.AsString:= 'CANCELADA';
   end;
end;

procedure TFrmConsPreVenda.BtnImprimirClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmQRelPreVendaEmitidas, FrmQRelPreVendaEmitidas);
   FrmQRelPreVendaEmitidas.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;

   if ComboCons.ItemIndex = 1 then
      FrmQRelPreVendaEmitidas.QRLTitulo.Caption:= 'Pré-Vendas Emitidas no Período: ' + datetostr(EdtDataIni.Date) + ' a ' + datetostr(EdtDataFin.Date)
   else
   if ComboCons.ItemIndex = 2 then
      FrmQRelPreVendaEmitidas.QRLTitulo.Caption:= 'Pré-Vendas Emitidas  - Abertas'
   else
      FrmQRelPreVendaEmitidas.QRLTitulo.Caption:= 'Pré-Vendas Emitidas';

   FrmQRelPreVendaEmitidas.QRLabel8.Caption := Label3.Caption;
   FrmQRelPreVendaEmitidas.QRLabel13.Caption:= Label5.Caption;
   FrmQRelPreVendaEmitidas.QRLabel17.Caption:= Label9.Caption;
   FrmQRelPreVendaEmitidas.QRLabel15.Caption:= Label7.Caption;

   FrmQRelPreVendaEmitidas.QRPreVenda.PreviewInitialState:= wsMaximized;
   FrmQRelPreVendaEmitidas.QRPreVenda.Preview;
   FrmQRelPreVendaEmitidas.QRPreVenda.QRPrinter:= nil;
end;

end.

