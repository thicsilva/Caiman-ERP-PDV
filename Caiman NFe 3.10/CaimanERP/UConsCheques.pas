unit UConsCheques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmConsCheques = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    CheckEmp: TCheckBox;
    RDG: TRadioGroup;
    BtnOk: TButton;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    LTotal: TLabel;
    QConsCheque: TFDQuery;
    DSQConsCheque: TDataSource;
    QConsChequeCOD_CHE: TIntegerField;
    QConsChequeCOD_CLI: TIntegerField;
    QConsChequeCOD_BANCO: TIntegerField;
    QConsChequeAGENCIA_CHE: TStringField;
    QConsChequeCONTA_CHE: TStringField;
    QConsChequeNUMERO_CHE: TStringField;
    QConsChequeEMISSAO_CHE: TDateField;
    QConsChequeVENCTO_CHE: TDateField;
    QConsChequeVALOR_CHE: TBCDField;
    QConsChequeCOD_CONTA: TIntegerField;
    QConsChequePRIDEP_CHE: TDateField;
    QConsChequeSEGDEP_CHE: TDateField;
    QConsChequePRIDEV_CHE: TDateField;
    QConsChequeSEGDEV_CHE: TDateField;
    QConsChequePAGTODEV_CHE: TDateField;
    QConsChequeOBS_CHE: TStringField;
    QConsChequeCOD_EMP: TIntegerField;
    QConsChequeNOME_CLI: TStringField;
    QConsChequeNOME_BAN: TStringField;
    QConsChequeNOME_CONTA: TStringField;
    BtnSair: TButton;
    QConsChequeEMITENTE: TStringField;
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsCheques: TFrmConsCheques;

implementation
uses
  Udm, Ubibli1, UNovoPrincipal;
var  sSql : string;

{$R *.dfm}

procedure TFrmConsCheques.BtnOkClick(Sender: TObject);
var cTotal : currency;
begin 
   if edtdatafin.Date < edtdataini.Date then
      begin 
         AlertaCad('A data final não pode ser menor que a data inicial');
//         edtdatafin.SetFocus;
         exit;
      end;
   cTotal:= 0;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsCheque do
      begin 
         close;
         sql.Clear;
         sql.Text:= sSql;
         case rdg.ItemIndex of
          0: begin  //em aberto
                if (not CheckEmp.Checked) then
                   begin 
                      sql.Add(' WHERE CHE.PRIDEP_CHE IS NULL AND CHE.VENCTO_CHE BETWEEN :DATAINI AND :DATAFIN AND CHE.COD_EMP = :CODEMP');
                      Parambyname('codemp').AsInteger:= iEmp;
                   end
                else
                   sql.Add(' WHERE CHE.PRIDEP_CHE IS NULL AND CHE.VENCTO_CHE BETWEEN :DATAINI AND :DATAFIN ORDER BY CHE.VENCTO_CHE, CHE.COD_CHE');
                Parambyname('dataini').AsDate := edtdataini.Date;
                Parambyname('datafin').AsDate := edtdatafin.Date;
             end;
          1: //devolvidos
             begin 
                if (not CheckEmp.Checked) then
                   begin 
                      sql.Add(' WHERE (CHE.PRIDEV_CHE BETWEEN :DATAINI AND :DATAFIN OR CHE.SEGDEV_CHE BETWEEN :DATAINI AND :DATAFIN) AND (CHE.COD_EMP = :CODEMP' + ')');
                      Parambyname('codemp').AsInteger:= iEmp;
                   end
                else
                   sql.Add(' WHERE CHE.PRIDEV_CHE BETWEEN :DATAINI AND :DATAFIN OR CHE.SEGDEV_CHE BETWEEN :DATAINI AND :DATAFIN');
                Parambyname('dataini').AsDate := edtdataini.Date;
                Parambyname('datafin').AsDate := edtdatafin.Date;
             end;
          2: //pagos
             begin 
                if (not CheckEmp.Checked) then
                   begin 
                      sql.Add(' WHERE CHE.PAGTODEV_CHE BETWEEN :DATAINI AND :DATAFIN AND CHE.COD_EMP = :CODEMP ORDER BY CHE.PAGTODEV_CHE');
                      Parambyname('codemp').AsInteger:= iEmp;
                   end
                else
                   sql.Add(' WHERE CHE.PAGTODEV_CHE BETWEEN :DATAINI AND :DATAFIN ORDER BY CHE.PAGTODEV_CHE');
                Parambyname('dataini').AsDate := edtdataini.Date;
                Parambyname('datafin').AsDate := edtdatafin.Date;
             end;
          3: //depositados
             begin 
                if (not CheckEmp.Checked) then
                   begin 
                      sql.Add(' WHERE (CHE.PRIDEP_CHE BETWEEN :DATAINI AND :DATAFIN OR CHE.SEGDEP_CHE BETWEEN :DATAINI AND :DATAFIN) AND (CHE.COD_EMP = :CODEMP' + ')');
                      Parambyname('codemp').AsInteger:= iEmp;
                   end
                else
                   sql.Add(' WHERE CHE.PRIDEP_CHE BETWEEN :DATAINI AND :DATAFIN OR CHE.SEGDEP_CHE BETWEEN :DATAINI AND :DATAFIN');
                Parambyname('dataini').AsDate := edtdataini.Date;
                Parambyname('datafin').AsDate := edtdatafin.Date;
             end;
         end;
         Open;
         First;

         if not QConsChequeCOD_CHE.IsNull then
            begin 
               while not eof do
                  begin 
                     cTotal:= cTotal + QConsChequeVALOR_CHE.AsCurrency;
                     next;
                  end;
               LTotal.Caption:= currtostrf(cTotal, ffnumber, 2);
            end
         else
            LTotal.Caption:= '0,00';
      end;
   dm.IBTransaction.CommitRetaining;
end;

procedure TFrmConsCheques.FormShow(Sender: TObject);
begin 
   sSql := QConsCheque.SQL.Text;
   edtdataini.Date:= date;
   edtdatafin.Date:= date;
   CheckEmp.Checked:= false;
   rdg.ItemIndex  := 0;
   ltotal.Caption := '0,00';
end;

procedure TFrmConsCheques.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsCheques.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QConsCheque.SQL.Clear;
   QConsCheque.sql.Text:= sSql;
   QConsCheque.Close;
   Action:= caFree;
end;

procedure TFrmConsCheques.FormCreate(Sender: TObject);
begin 
   
end;

procedure TFrmConsCheques.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmConsCheques.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

end.
