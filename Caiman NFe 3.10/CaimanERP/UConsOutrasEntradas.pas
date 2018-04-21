unit UConsOutrasEntradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmConsOutrasEntradas = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    ComboCons: TComboBox;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    GB3: TGroupBox;
    BtnConsFor: TsSpeedButton;
    EdtCodFor: UNovosComponentes.TEdit;
    EdtNomeFor: TEdit;
    EdtCod: TEdit;
    CheckEmp: TCheckBox;
    BtnOk: TButton;
    BtnSair: TButton;
    GB4: TGroupBox;
    BtnConsTipo: TsSpeedButton;
    EdtCodTipo: UNovosComponentes.TEdit;
    EdtNomeTipo: TEdit;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    BtnLocalizar: TButton;
    StatusBar1: TStatusBar;
    QConsOE: TFDQuery;
    DSQConsOE: TDataSource;
    QConsOECOD_OUTRA: TIntegerField;
    QConsOEDATA_OUTRA: TDateField;
    QConsOECOD_ES: TIntegerField;
    QConsOECOD_FOR: TIntegerField;
    QConsOECOD_EMP: TIntegerField;
    QConsOETOTAL_OUTRA: TBCDField;
    QConsOERAZAO_FOR: TStringField;
    QConsOENOME_ES: TStringField;
    CheckOutrasEntradas: TCheckBox;
    QConsOENUMERO_NOTA_FISCAL: TIntegerField;
    QConsOESERIE_NOTA_FISCAL: TStringField;
    QConsOECODIFICACAO_FISCAL: TStringField;
    QConsOECOD_NF: TIntegerField;
    QConsOECANCELADA: TIntegerField;
    procedure BtnSairClick(Sender: TObject);
    procedure ComboConsChange(Sender: TObject);
    procedure BtnConsTipoClick(Sender: TObject);
    procedure EdtCodTipoExit(Sender: TObject);
    procedure EdtCodTipoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodTipoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsForClick(Sender: TObject);
    procedure EdtCodForKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodForExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure EdtCodForEnter(Sender: TObject);
    procedure EdtCodTipoEnter(Sender: TObject);
    procedure CheckOutrasEntradasClick(Sender: TObject);
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
  FrmConsOutrasEntradas: TFrmConsOutrasEntradas;

implementation
uses
  Udm, UConsTipoES, UConsFor, Ubibli1, UOutrasEntradas, UNovoPrincipal;
var  sSql : string;

{$R *.dfm}

procedure TFrmConsOutrasEntradas.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsOutrasEntradas.ComboConsChange(Sender: TObject);
begin 
   CheckOutrasEntradas.Checked := true;
   CheckOutrasEntradasClick(CheckOutrasEntradas);
   case ComboCons.ItemIndex of
     0: begin 
           gb3.Enabled        := true;
           gb2.Enabled        := false;
           gb3.Caption        := 'Código';
           edtcod.Visible     := true;
           edtcodfor.Visible  := false;
           edtnomefor.Visible := false;
           btnconsfor.Visible := false;
           edtcod.Clear;
           edtcod.SetFocus;
        end;
     1: begin 
           gb3.Enabled        := true;
           gb2.Enabled        := true;
           gb3.Caption        := 'Fornecedor';
           edtcod.Visible     := false;
           edtcodfor.Visible  := true;
           edtnomefor.Visible := true;
           btnconsfor.Visible := true;
           edtdataini.Date    := date;
           edtdatafin.Date    := date;
           edtcodfor.Clear;
           edtnomefor.Clear;
           edtcodfor.SetFocus;
        end;
     2: begin 
           gb3.Enabled        := false;
           gb2.Enabled        := true;
           edtdataini.Date    := date;
           edtdatafin.Date    := date;
           gb3.Caption        := 'Fornecedor';
           edtcod.Visible     := false;
           edtcodfor.Visible  := true;
           edtnomefor.Visible := true;
           btnconsfor.Visible := true;
           edtcodfor.Clear;
           edtnomefor.Clear;
           edtdataini.SetFocus;
        end;
   end;
end;

procedure TFrmConsOutrasEntradas.BtnConsTipoClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsTipoES, FrmConsTipoES);
   FrmConsTipoES.tag:= 5;
   FrmConsTipoES.showmodal;
end;

procedure TFrmConsOutrasEntradas.EdtCodTipoExit(Sender: TObject);
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
                     'WHERE COD_ES = ' + EdtCodTipo.text + ' AND TIPO_ES = ' + #39 + 'E' + #39);
             ExecOrOpen;
             if recordcount > 0 then
                EdtNomeTipo.Text:= fieldbyname('nome_es').Value
             else
                begin 
                   AlertaCad('Tipo de Outras Entradas não Cadastrado');
                   EdtNomeTipo.Clear;
//                   EdtCodTipo.SetFocus;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       AlertaCad('Erro ao Buscar o Tipo de Outras Entradas');
       EdtNomeTipo.Clear;
//       EdtCodTipo.SetFocus;
     end;
   finally
       DM.Consulta.Close;
   end;
end;

procedure TFrmConsOutrasEntradas.EdtCodTipoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsTipo.Click
end;

procedure TFrmConsOutrasEntradas.EdtCodTipoKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmConsOutrasEntradas.EdtCodKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmConsOutrasEntradas.BtnConsForClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsFor, FrmConsFor);
   FrmConsFor.tag:= 14;
   FrmConsFor.showmodal;
end;

procedure TFrmConsOutrasEntradas.EdtCodForKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsFor.Click;
end;

procedure TFrmConsOutrasEntradas.EdtCodForExit(Sender: TObject);
begin 
   EdtNomeFor.Text:= consulta('fornecedor', EdtCodFor, 'cod_for', 'razao_for', dm.IBTransaction, dm.qConsulta);
   if EdtNomeFor.Text = '' then
      begin 
         AlertaCad('Fornecedor não Cadastrado');
//         EdtCodFor.SetFocus;
      end;
end;

procedure TFrmConsOutrasEntradas.FormShow(Sender: TObject);
begin 
   sSql:= QConsOE.SQL.Text;
   ComboCons.ItemIndex:= 2;
   ComboConsChange(sender);
end;

procedure TFrmConsOutrasEntradas.BtnOkClick(Sender: TObject);
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
   with QConsOE do
      begin 
         close;
         sql.Clear;
         sql.Text:= sSql;
         case ComboCons.ItemIndex of
           0: begin 
                 if trim(EdtCod.Text) = '' then
                    begin 
                       AlertaCad('Digite o Código');
//                       edtcod.SetFocus;
                       exit;
                    end;

                 sql.Add(' WHERE OE.COD_OUTRA = ' + edtcod.Text);
                 if (not CheckEmp.Checked) then
                    begin 
                       sql.Add(' AND OE.COD_EMP = :CODEMP');
                       Parambyname('codemp').AsInteger:= iEmp;
                    end;
              end;

           1: begin 
                 sql.Add(' WHERE OE.DATA_OUTRA BETWEEN :DATAINI AND :DATAFIN AND OE.COD_FOR = :CODFOR');

                 if trim(EdtCodTipo.Text) <> '' then
                    begin 
                       sql.Add(' AND OE.COD_ES = :CODTIPO');
                       parambyname('codtipo').AsInteger:= strtoint(EdtCodTipo.Text);
                    end;

                 if (not CheckEmp.Checked) then
                    begin 
                       sql.Add(' AND OE.COD_EMP = :CODEMP');
                       Parambyname('codemp').AsInteger:= iEmp;
                    end;

                 sql.Add(' ORDER BY OE.DATA_OUTRA, OE.COD_OUTRA');
                 Parambyname('codfor').AsInteger := strtoint(EdtCodFor.Text);
                 Parambyname('dataini').AsDate   := edtdataini.Date;
                 Parambyname('datafin').AsDate   := edtdatafin.Date;
              end;

           2: begin 
                 sql.add(' WHERE OE.DATA_OUTRA BETWEEN :DATAINI AND :DATAFIN');

                 if trim(EdtCodTipo.Text) <> '' then
                    begin 
                       sql.Add(' AND OE.COD_ES = :CODTIPO');
                       parambyname('codtipo').AsInteger:= strtoint(EdtCodTipo.Text);
                    end;

                 if (not CheckEmp.Checked) then
                    begin 
                       sql.Add(' AND OE.COD_EMP = :CODEMP');
                       Parambyname('codemp').AsInteger:= iEmp;
                    end;

                 sql.Add(' ORDER BY OE.DATA_OUTRA, OE.COD_OUTRA');
                 Parambyname('dataini').AsDate:= edtdataini.Date;
                 Parambyname('datafin').AsDate:= edtdatafin.Date;
              end;
         end;
         open;
      end;
end;

procedure TFrmConsOutrasEntradas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QConsOE.SQL.Clear;
   QConsOE.SQL.Text:= sSql;
   QConsOE.Close;
   Action:= caFree;
end;

procedure TFrmConsOutrasEntradas.BtnLocalizarClick(Sender: TObject);
begin 
   if QConsOENUMERO_NOTA_FISCAL.AsInteger > 0 then
      begin 
         AlertaCad('Outras entradas com Nota Fiscal não pode ser alterada ou excluída');
         exit;
         abort;
      end;

   if QConsOECOD_EMP.AsInteger <> iEmp then
      begin 
         AlertaCad('Você está logado na empresa ' + inttostr(iEmp) + #13 +
                     'Este Lançamento pertence à empresa ' + QConsOECOD_EMP.AsString);
         exit;
      end;

   if (tag = 0) or (tag = 1) then
      begin 
         if tag = 1 then
            Application.CreateForm(TFrmOutrasEntradas, FrmOutrasEntradas);
         with FrmOutrasEntradas do
            begin 
               tag                := 1;
               EdtCodigo.Text     := QConsOECOD_OUTRA.AsString;
               EdtData.Text       := QConsOEDATA_OUTRA.AsString;
               edtcodtipo.Text    := QConsOECOD_ES.AsString;
               edtnometipo.Text   := QConsOENOME_ES.Value;
               EdtCodFor.Text     := QConsOECOD_FOR.AsString;
               EdtNomeFor.Text    := QConsOERAZAO_FOR.Value;
               edttotal.Text      := QConsOETOTAL_OUTRA.AsString;
               BuscaItens;
               show;
               FormShow(sender);
            end;
         close;
      end;
end;

procedure TFrmConsOutrasEntradas.EdtCodForEnter(Sender: TObject);
begin 
   EdtCodFor.selectall;
end;

procedure TFrmConsOutrasEntradas.EdtCodTipoEnter(Sender: TObject);
begin 
   EdtCodTipo.SelectAll;
end;

procedure TFrmConsOutrasEntradas.CheckOutrasEntradasClick(Sender: TObject);
begin 
   EdtCodTipo.Clear;
   edtnometipo.Clear;
   if CheckOutrasEntradas.Checked then
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

procedure TFrmConsOutrasEntradas.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin 
   if QConsOECANCELADA.AsInteger = 1 then
      begin 
         DBGrid1.Canvas.Font.Color:= clRed;
         Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
      end;
end;

procedure TFrmConsOutrasEntradas.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.
