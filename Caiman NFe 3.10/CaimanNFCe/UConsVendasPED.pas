unit UConsVendasPED;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, ComCtrls, DB, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmConsVendasPED = class(TForm)
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
    Label1: TLabel;
    EdtDataInicio: TDateTimePicker;
    EdtDataFinal: TDateTimePicker;
    QConsVenda: TFDQuery;
    IBTRVenda: TFDTransaction;
    QConsVendaCOD_VEN: TIntegerField;
    QConsVendaDATA_VEN: TDateField;
    QConsVendaNUMERO_NOTA_FISCAL: TIntegerField;
    QConsVendaSERIE_NOTA_FISCAL: TStringField;
    QConsVendaTOTAL_VEN: TBCDField;
    QConsVendaNOME_CLI: TStringField;
    DSVenda: TDataSource;
    QConsVendaCANCELADA_VEN: TIntegerField;
    QConsVendaCODIFICACAO_FISCAL: TStringField;
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
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsVendasPED: TFrmConsVendasPED;

implementation
uses
  Udm;
var sSql : string;

{$R *.dfm}

procedure TFrmConsVendasPED.ComboConsChange(Sender: TObject);
begin
   GB2.Caption        := ComboCons.Text;
   EdtDataInicio.Date := date;
   EdtDataFinal.Date  := date;
   EdtCons.Clear;
   case ComboCons.ItemIndex of
     0,2:begin
          gb2.Enabled           := true;
          EdtDataInicio.Visible := false;
          EdtDataFinal.Visible  := false;
          EdtCons.Visible       := true;
          edtcons.SetFocus;
       end;
     1:begin
          gb2.Enabled           := true;
          EdtDataInicio.Visible := true;
          EdtDataFinal.Visible  := true;
          EdtCons.Visible       := false;
          EdtDataInicio.SetFocus;
       end;
   end;
end;

procedure TFrmConsVendasPED.BtnSairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmConsVendasPED.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if IBTRVenda.Active then
      IBTRVenda.Commit;

   QConsVenda.SQL.Clear;
   QConsVenda.SQL.Text:= sSql;
   QConsVenda.Close;
   Action:= cafree;
   Self := nil;
end;

procedure TFrmConsVendasPED.FormCreate(Sender: TObject);
begin
   dm.ScaleForm( Self, False );
end;

procedure TFrmConsVendasPED.BtnOkClick(Sender: TObject);
begin
   if IBTRVenda.Active then
      IBTRVenda.Commit;
   IBTRVenda.StartTransaction;
   with QConsVenda do
      begin
         close;
         sql.Clear;
         sql.Text:= sSql;
         case ComboCons.ItemIndex of
           0:begin
                if trim(EdtCons.Text) = '' then
                   begin
                      showmessage('Digite o código da venda');
                      EdtCons.SetFocus;
                      exit;
                   end;
                sql.Add(' WHERE V.COD_VEN = :CODVEN AND V.COD_EMP = :CODEMP' +
                        ' AND V.NUMERO_NOTA_FISCAL IS NOT NULL');
                Parambyname('codven').AsInteger := strtoint(edtcons.Text);
                Parambyname('codemp').AsInteger := iEmp;
                open;
             end;
           1:begin
                sql.Add(' WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                        ' AND V.COD_EMP = :CODEMP AND V.NUMERO_NOTA_FISCAL IS NOT NULL' +
                        ' ORDER BY V.COD_VEN');
                Parambyname('dataini').Asdate   := EdtDataInicio.Date;
                Parambyname('datafin').Asdate   := EdtDataFinal.Date;
                Parambyname('codemp').AsInteger := iEmp;
                open;
             end;
           2:begin
                if trim(EdtCons.Text) = '' then
                   begin
                      showmessage('Digite o número da Nota Fiscal');
                      EdtCons.SetFocus;
                      exit;
                   end;
                sql.Add(' WHERE V.NUMERO_NOTA_FISCAL = :NF AND V.COD_EMP = :CODEMP' +
                        ' AND V.NUMERO_NOTA_FISCAL IS NOT NULL');
                Parambyname('nf').AsInteger     := strtoint(EdtCons.Text);
                Parambyname('codemp').AsInteger := iEmp;
                open;
             end;
         end;
      end;
   dbgrid1.SetFocus;
end;

procedure TFrmConsVendasPED.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsVendasPED.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close;
end;

procedure TFrmConsVendasPED.FormShow(Sender: TObject);
begin
   sSql:= QConsVenda.SQL.Text;

   {busca a posicao do combo}
   try
     ComboCons.ItemIndex:= strtoint(dm.LeINI(GetCurrentDir + '\cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsVendasPED.ComboCons'));
   except
     ComboCons.ItemIndex:= 0;
   end;

   ComboConsChange(ComboCons);
end;

procedure TFrmConsVendasPED.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if QConsVendaCANCELADA_VEN.AsInteger = 1 then
      begin
         DBGrid1.Canvas.Font.Color:= clRed;
         Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
      end;
end;

procedure TFrmConsVendasPED.EdtConsKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0; 
end;

procedure TFrmConsVendasPED.DBGrid1DblClick(Sender: TObject);
begin
   if QConsVendaCANCELADA_VEN.AsInteger = 1 then
      begin
         showmessage('Nota Fiscal cancelada');
         exit;
      end;

   if Application.MessageBox('Confirma o Cancelamento da Nota Fiscal?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         try
           try
             with dm.QConsulta do
                begin
                   close;
                   sql.Clear;
                   sql.Text:= 'UPDATE VENDAS ' +
                              'SET CANCELADA_VEN = 1 ' +
                              'WHERE COD_VEN = :CODVEN';
                   Parambyname('codven').AsInteger:= QConsVendaCOD_VEN.AsInteger;
                   ExecOrOpen;

                   close;
                   sql.Clear;
                   sql.text:= 'UPDATE ITENS_VENDA ' +
                              'SET VENDA_CANCELADA = 1 ' +
                              'WHERE COD_VEN = :CODVEN';
                   Parambyname('codven').AsInteger:= QConsVendaCOD_VEN.AsInteger;
                   ExecOrOpen;
                end;
             dm.IBTransaction.Commit;
           except
             dm.IBTransaction.Rollback;
             showmessage('erro ao cancelar a nota fiscal');
           end;
         finally
           BtnOk.Click;
         end;
      end;
end;

procedure TFrmConsVendasPED.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
      DBGrid1DblClick(self);
end;

procedure TFrmConsVendasPED.DBGrid1Enter(Sender: TObject);
begin
   FrmConsVendasPED.KeyPreview:= false;
end;

procedure TFrmConsVendasPED.DBGrid1Exit(Sender: TObject);
begin
   FrmConsVendasPED.KeyPreview:= true;
end;

end.
