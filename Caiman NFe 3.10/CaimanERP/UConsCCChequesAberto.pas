unit UConsCCChequesAberto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Mask, DB, 
  rxToolEdit, rxCurrEdit, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmConsCCChequesAberto = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    GB4: TGroupBox;
    BtnConsConta: TsSpeedButton;
    cod_conta: UNovosComponentes.TEdit;
    EdtNomeConta: TEdit;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    BtnOk: TButton;
    BtnSair: TButton;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    EdtTotal: TCurrencyEdit;
    QConsCheque: TFDQuery;
    DSQConsCheque: TDataSource;
    CheckTodos: TCheckBox;
    QConsChequeCOD_LAN: TIntegerField;
    QConsChequeDATAEMI_LAN: TDateField;
    QConsChequeDATAVENC_LAN: TDateField;
    QConsChequeNUM_CHEQUE_LAN: TStringField;
    QConsChequeVALOR_LAN: TBCDField;
    QConsChequeHISTORICO_LAN: TStringField;
    QConsChequeDOCUMENTO_LAN: TStringField;
    QConsChequeNOME_DOC: TStringField;
    BitBtn1: TBitBtn;
    QBaixa: TFDQuery;
    IBTRBaixa: TFDTransaction;
    procedure CheckTodosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnConsContaClick(Sender: TObject);
    procedure cod_contaExit(Sender: TObject);
    procedure cod_contaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cod_contaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cod_contaEnter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsCCChequesAberto: TFrmConsCCChequesAberto;

implementation
uses
  Udm, UConsConta, UBibli1, UNovoPrincipal;
var vl_sql : string;

{$R *.dfm}

procedure TFrmConsCCChequesAberto.CheckTodosClick(Sender: TObject);
begin 
   if CheckTodos.Checked then
      gb2.Enabled:= false
   else
      gb2.Enabled:= true;
end;

procedure TFrmConsCCChequesAberto.FormShow(Sender: TObject);
begin 
   vl_sql:= QConsCheque.SQL.Text;
   Cod_Conta.Clear;
   EdtNomeConta.Clear;
   EdtTotal.Clear;
   edtdataini.Date:= date;
   edtdatafin.Date:= date;
   CheckTodos.Checked:= false;
   gb2.Enabled:= true;
   Cod_Conta.SetFocus;
end;

procedure TFrmConsCCChequesAberto.BtnOkClick(Sender: TObject);
var cTotal : currency;
begin 
   cTotal:= 0;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsCheque do
      begin 
         close;
         sql.Clear;
         sql.Text:= vl_sql;
         if not CheckTodos.Checked then
            begin 
               sql.Add(' WHERE C.DATAVENC_LAN BETWEEN :DATAINI AND :DATAFIN' +
                       ' AND C.COD_CONTA = :CODCONTA AND C.CONCILIADO_LAN = 1 ' +
                       ' AND C.DC_LAN = 0 ' +
                       ' ORDER BY C.DATAVENC_LAN');
               Parambyname('dataini').AsDate     := edtdataini.Date;
               Parambyname('datafin').AsDate     := edtdatafin.Date;
            end
         else
            begin 
               sql.Add(' WHERE C.CONCILIADO_LAN = 1 ' +
                       ' AND C.COD_CONTA = :CODCONTA AND C.DC_LAN = 0 ' +
                       ' ORDER BY C.DATAVENC_LAN');
            end;
         Parambyname('codconta').AsInteger  := strtoint(Cod_Conta.Text);
         open;
         DisableControls;
         First;
         while not eof do
           begin 
              cTotal:= cTotal + QConsChequeVALOR_LAN.AsCurrency;
              next;
           end;
         EdtTotal.Text:= currtostr(cTotal);
         First;
         EnableControls;
      end;
end;

procedure TFrmConsCCChequesAberto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QConsCheque.Sql.Clear;
   QConsCheque.SQL.Text:= vl_sql;
   QConsCheque.Close;
   Action:= caFree;
end;

procedure TFrmConsCCChequesAberto.BtnConsContaClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsConta, FrmConsConta);
   FrmConsConta.tag:= 5;
   FrmConsConta.showmodal;
end;

procedure TFrmConsCCChequesAberto.cod_contaExit(Sender: TObject);
begin 
   if BtnSair.Focused then
     exit;
  EdtNomeConta.Text:= Consulta('contas_corrente', cod_conta, 'cod_conta', 'nome_conta', dm.IBTransaction, dm.qConsulta);
  if EdtNomeConta.Text = '' then
     begin 
        AlertaCad('Erro ao buscar a Conta');
//        cod_conta.SetFocus;
        cod_conta.SelectAll;
     end;
end;

procedure TFrmConsCCChequesAberto.cod_contaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsConta.Click;
end;

procedure TFrmConsCCChequesAberto.cod_contaKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmConsCCChequesAberto.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsCCChequesAberto.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmConsCCChequesAberto.cod_contaEnter(Sender: TObject);
begin 
   cod_conta.SelectAll;
end;

procedure TFrmConsCCChequesAberto.BitBtn1Click(Sender: TObject);
begin 
   if Application.MessageBox('Confirma a Baixa do Cheque?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin 
        if IBTRBaixa.Active then
           IBTRBaixa.Commit;
        IBTRBaixa.StartTransaction;
        try
          try
            with QBaixa do
               begin 
                  close;
                  Parambyname('cod').AsInteger := QConsChequeCOD_LAN.AsInteger;
                  ExecOrOpen;
               end;
            IBTRBaixa.Commit;
          except
            IBTRBaixa.Rollback;
            AlertaCad('Erro ao baixar o cheque');
          end;
        finally
          QBaixa.close;
          BtnOk.Click;
        end;
     end;
end;

end.
