unit UConsOutrasSaidas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls, DB, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmConsOutrasSaidas = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    DBGrid1: TDBGrid;
    BtnLocalizar: TButton;
    GroupBox1: TGroupBox;
    ComboCons: TComboBox;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    GB3: TGroupBox;
    BtnConsCli: TsSpeedButton;
    EdtCodCli: UNovosComponentes.TEdit;
    EdtNomeCli: TEdit;
    EdtCod: TEdit;
    CheckEmp: TCheckBox;
    BtnOk: TButton;
    BtnSair: TButton;
    GB4: TGroupBox;
    BtnConsTipo: TsSpeedButton;
    EdtCodTipo: UNovosComponentes.TEdit;
    EdtNomeTipo: TEdit;
    QConsOS: TFDQuery;
    DSQConsOS: TDataSource;
    QConsOSCOD_OUTRA: TIntegerField;
    QConsOSDATA_OUTRA: TDateField;
    QConsOSCOD_ES: TIntegerField;
    QConsOSCOD_CLI: TIntegerField;
    QConsOSTOTAL_OUTRA: TBCDField;
    QConsOSCOD_EMP: TIntegerField;
    QConsOSNOME_CLI: TStringField;
    QConsOSNOME_ES: TStringField;
    CheckOutrasSaidas: TCheckBox;
    QConsOSCOD_NF: TIntegerField;
    QConsOSNUMERO_NOTA_FISCAL: TIntegerField;
    QConsOSSERIE_NOTA_FISCAL: TStringField;
    QConsOSCODIFICACAO_FISCAL: TStringField;
    QConsOSCANCELADA: TIntegerField;
    procedure BtnSairClick(Sender: TObject);
    procedure ComboConsChange(Sender: TObject);
    procedure BtnConsTipoClick(Sender: TObject);
    procedure EdtCodTipoExit(Sender: TObject);
    procedure EdtCodTipoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodTipoKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsCliClick(Sender: TObject);
    procedure EdtCodCliExit(Sender: TObject);
    procedure EdtCodCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure EdtCodTipoEnter(Sender: TObject);
    procedure EdtCodCliEnter(Sender: TObject);
    procedure CheckOutrasSaidasClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsOutrasSaidas: TFrmConsOutrasSaidas;

implementation
uses
  Udm, UConsTipoES, UConsCli, Ubibli1, UOutrasSaidas, UNovoPrincipal;
var vl_sql : string;

{$R *.dfm}

procedure TFrmConsOutrasSaidas.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsOutrasSaidas.ComboConsChange(Sender: TObject);
begin 
   CheckOutrasSaidas.Checked := true;
   CheckOutrasSaidasClick(CheckOutrasSaidas);
   case ComboCons.ItemIndex of
     0: begin 
           gb3.Enabled        := true;
           gb2.Enabled        := false;
           gb3.Caption        := 'Código';
           edtcod.Visible     := true;
           edtcodcli.Visible  := false;
           edtnomecli.Visible := false;
           btnconscli.Visible := false;
           edtcod.Clear;
           edtcod.SetFocus;
        end;
     1: begin 
           gb3.Enabled        := true;
           gb2.Enabled        := true;
           gb3.Caption        := 'Cliente';
           edtcod.Visible     := false;
           edtcodcli.Visible  := true;
           edtnomecli.Visible := true;
           btnconscli.Visible := true;
           edtdataini.Date    := date;
           edtdatafin.Date    := date;
           edtcodcli.Clear;
           edtnomecli.Clear;
           edtcodcli.SetFocus;
        end;
     2: begin 
           gb3.Enabled        := false;
           gb2.Enabled        := true;
           edtdataini.Date    := date;
           edtdatafin.Date    := date;
           gb3.Caption        := 'Cliente';
           edtcod.Visible     := false;
           edtcodcli.Visible  := true;
           edtnomecli.Visible := true;
           btnconscli.Visible := true;
           edtcodcli.Clear;
           edtnomecli.Clear;
           edtdataini.SetFocus;
        end;
   end;
end;

procedure TFrmConsOutrasSaidas.BtnConsTipoClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsTipoES, FrmConsTipoES);
   FrmConsTipoES.tag:= 4;
   FrmConsTipoES.showmodal;
end;

procedure TFrmConsOutrasSaidas.EdtCodTipoExit(Sender: TObject);
begin 
   if EdtCodTipo.Text = '' then
      begin 
         edtcodtipo.Clear;
         edtnometipo.Clear;
         exit;
      end;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.Consulta do
          begin 
             close;
             sql.Clear;
             sql.Add('SELECT NOME_ES ' +
                     'FROM TIPO_ES ' +
                     'WHERE COD_ES = ' + EdtCodTipo.text + ' AND TIPO_ES = ' + #39 + 'S' + #39);
             ExecOrOpen;
             if recordcount > 0 then
                EdtNomeTipo.Text:= fieldbyname('nome_es').Value
             else
                begin 
                   AlertaCad('Tipo de Outras Saídas não Cadastrado');
                   EdtNomeTipo.Clear;
//                   EdtCodTipo.SetFocus;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       AlertaCad('Erro ao Buscar o Tipo de Outras Saídas');
       EdtNomeTipo.Clear;
//       EdtCodTipo.SetFocus;
     end;
   finally
       DM.Consulta.Close;
   end;
end;

procedure TFrmConsOutrasSaidas.EdtCodTipoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsTipo.Click
end;

procedure TFrmConsOutrasSaidas.EdtCodTipoKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmConsOutrasSaidas.BtnConsCliClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsCli, FrmConsCli);
   FrmConsCli.tag:= 16;
   FrmConsCli.showmodal;
end;

procedure TFrmConsOutrasSaidas.EdtCodCliExit(Sender: TObject);
begin 
   EdtNomecli.Text:= consulta('cliente', edtcodcli, 'cod_cli', 'nome_cli', dm.IBTransaction, dm.qConsulta);
   if edtnomecli.Text = '' then
      begin 
         AlertaCad('Cliente não Cadastrado');
//         edtcodcli.SetFocus;
      end;
end;

procedure TFrmConsOutrasSaidas.EdtCodCliKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsCli.Click;
end;

procedure TFrmConsOutrasSaidas.FormShow(Sender: TObject);
begin 
   vl_sql:= QConsOS.SQL.Text;
   ComboCons.ItemIndex:= 2;
   ComboConsChange(sender);
end;

procedure TFrmConsOutrasSaidas.BtnOkClick(Sender: TObject);
begin 
   if edtdatafin.Date < edtdataini.Date then
      begin 
         AlertaCad('A data final não pode ser menor que a data inicial');
//         edtdataini.SetFocus;
         exit;
      end;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsOS do
      begin 
         close;
         sql.Clear;
         sql.Text:= vl_sql;
         case ComboCons.ItemIndex of
           0: begin 
                 if EdtCod.Text = '' then
                    begin 
                       AlertaCad('Digite o Código');
//                       edtcod.SetFocus;
                       exit;
                    end;
                 sql.Add(' WHERE OS.COD_OUTRA = ' + edtcod.Text);
                 if (not CheckEmp.Checked) then
                    begin 
                       sql.Add(' AND OS.COD_EMP = :CODEMP');
                       Parambyname('codemp').AsInteger:= iEmp;
                    end;
                 open;
              end;
           1: begin 
                 sql.Add(' WHERE OS.COD_CLI = ' + edtcodcli.Text);
                 sql.add(' AND OS.DATA_OUTRA BETWEEN :DATAINI AND :DATAFIN');
                 if EdtCodTipo.Text <> '' then
                    sql.Add(' AND OS.COD_ES = ' + edtcodtipo.Text);
                 if (not CheckEmp.Checked) then
                    begin 
                       sql.Add(' AND OS.COD_EMP = :CODEMP');
                       Parambyname('codemp').AsInteger:= iEmp;
                    end;
                 sql.Add(' ORDER BY OS.DATA_OUTRA');
                 Parambyname('dataini').AsDate:= edtdataini.Date;
                 Parambyname('datafin').AsDate:= edtdatafin.Date;
                 open;
              end;
           2: begin 
                 sql.add(' WHERE OS.DATA_OUTRA BETWEEN :DATAINI AND :DATAFIN');
                 if EdtCodTipo.Text <> '' then
                    sql.Add(' AND OS.COD_ES = ' + edtcodtipo.Text);
                 if (not CheckEmp.Checked) then
                    begin 
                       sql.Add(' AND OS.COD_EMP = :CODEMP');
                       Parambyname('codemp').AsInteger:= iEmp;
                    end;
                 sql.Add(' ORDER BY OS.DATA_OUTRA');
                 Parambyname('dataini').AsDate:= edtdataini.Date;
                 Parambyname('datafin').AsDate:= edtdatafin.Date;
                 open;
              end;
         end;
      end;
end;

procedure TFrmConsOutrasSaidas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QConsOS.SQL.Clear;
   QConsOS.SQL.Text:= vl_sql;
   QConsOS.Close;
   Action:= caFree;
end;

procedure TFrmConsOutrasSaidas.BtnLocalizarClick(Sender: TObject);
begin 
   if QConsOSCOD_EMP.AsInteger <> iEmp then
      begin 
         AlertaCad('Você está logado na empresa ' + inttostr(iEmp) + #13 +
                     'Este Lançamento pertence à empresa ' + QConsOSCOD_EMP.AsString);
         exit;
      end;

   if QConsOSNUMERO_NOTA_FISCAL.AsInteger > 0 then
      begin 
         AlertaCad('Outra Saída com Nota Fiscal não pode ser alterada ou excluída');
         exit;
         abort;
      end;


   if (tag = 0) or (tag = 1) then
      begin 
         if tag = 1 then
            Application.CreateForm(TFrmOutrasSaidas, FrmOutrasSaidas);
         with FrmOutrasSaidas do
            begin 
               tag                := 1;
               EdtCodigo.Text     := QConsOSCOD_OUTRA.AsString;
               EdtData.Text       := QConsOSDATA_OUTRA.AsString;
               edtcodtipo.Text    := QConsOSCOD_ES.AsString;
               edtnometipo.Text   := QConsOSNOME_ES.Value;
               edtcodcli.Text     := QConsOSCOD_CLI.AsString;
               edtnomecli.Text    := QConsOSNOME_CLI.Value;
               edttotal.Text      := QConsOSTOTAL_OUTRA.AsString;
               BuscaItens;
               show;
               FormShow(sender);
            end;
         close;
      end;
end;

procedure TFrmConsOutrasSaidas.EdtCodTipoEnter(Sender: TObject);
begin 
   EdtCodTipo.SelectAll;
end;

procedure TFrmConsOutrasSaidas.EdtCodCliEnter(Sender: TObject);
begin 
   EdtCodCli.SelectAll;
end;

procedure TFrmConsOutrasSaidas.CheckOutrasSaidasClick(Sender: TObject);
begin 
   EdtCodTipo.Clear;
   edtnometipo.Clear;
   if CheckOutrasSaidas.Checked then
      begin 
         gb4.Enabled:= false;
         btnok.SetFocus;
      end
   else
      begin 
         gb4.Enabled:= true;
         EdtCodTipo.SetFocus;
      end;
end;

procedure TFrmConsOutrasSaidas.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin 
   if QConsOSCANCELADA.AsInteger = 1 then
      begin 
         DBGrid1.Canvas.Font.Color:= clRed;
         Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
      end;
end;

procedure TFrmConsOutrasSaidas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.
