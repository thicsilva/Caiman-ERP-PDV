unit UConsAcertoEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmConsAcertoEstoque = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    ComboCons: TComboBox;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    CheckEmp: TCheckBox;
    BtnOk: TButton;
    BtnSair: TButton;
    EdtCod: TEdit;
    DBGrid1: TDBGrid;
    BtnLocalizar: TButton;
    QConsAcerto: TFDQuery;
    DSQConsAcerto: TDataSource;
    QConsAcertoCOD_ACE: TIntegerField;
    QConsAcertoDATA_ACE: TDateField;
    QConsAcertoCOD_MOT: TIntegerField;
    QConsAcertoCOD_EMP: TIntegerField;
    QConsAcertoNOME_MOT: TStringField;
    QConsAcertoOBSERVACAO: TStringField;
    QConsAcertoCODIGO_LOCAL_ESTOQUE: TIntegerField;
    QConsAcertoDESCRICAO: TStringField;
    procedure ComboConsChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure EdtCodKeyPress(Sender: TObject; var Key: Char);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsAcertoEstoque: TFrmConsAcertoEstoque;

implementation
uses
  Udm, Ubibli1, UAcertoEstoque, UNovoPrincipal;
var  sSql : string;

{$R *.dfm}

procedure TFrmConsAcertoEstoque.ComboConsChange(Sender: TObject);
begin 
   if combocons.ItemIndex = 0 then //codigo
      begin 
         gb2.Caption        := 'Código';
         edtdataini.Visible := false;
         edtdatafin.Visible := false;
         edtcod.Visible     := true;
         edtcod.Clear;
         edtcod.SetFocus;
      end
   else
      if combocons.ItemIndex = 1 then //data
         begin 
            gb2.Caption        := 'Período';
            edtdataini.Visible := true;
            edtdatafin.Visible := true;
            edtcod.Visible     := false;
            edtdataini.Date    := date;
            edtdatafin.Date    := date;
            edtdataini.SetFocus;
         end;
end;

procedure TFrmConsAcertoEstoque.FormShow(Sender: TObject);
begin 
   {busca a posicao do combo}
   try
     ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsAcertoEstoque.ComboCons'));
   except
     ComboCons.ItemIndex:= 0;
   end;

    sSql := QConsAcerto.SQL.Text;
    ComboCons.ItemIndex := 1;
    ComboConsChange(sender);
    CheckEmp.Checked:= false;
end;

procedure TFrmConsAcertoEstoque.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsAcertoEstoque.EdtCodKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmConsAcertoEstoque.BtnOkClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsAcerto do
      begin 
         close;
         sql.Clear;
         sql.Text:= sSql;
         if combocons.ItemIndex = 0 then //codigo
            begin 
               if trim(edtcod.Text) = '' then
                  begin 
                     if (not CheckEmp.Checked) then
                        begin 
                           sql.Add(' WHERE A.COD_EMP = :CODEMP ' +
                                   ' ORDER BY A.COD_ACE');
                           Parambyname('codemp').AsInteger:= iEmp;
                        end
                     else
                        sql.Add(' ORDER BY A.COD_ACE');
                  end
               else
                  begin 
                     if (not CheckEmp.Checked) then
                        begin 
                           sql.Add(' WHERE A.COD_ACE = :CODACE AND A.COD_EMP = :CODEMP');
                           Parambyname('codemp').AsInteger:= iEmp;
                        end
                     else
                        sql.Add(' WHERE A.COD_ACE = :CODACE');
                     Parambyname('codace').AsInteger:= StrToInt(EdtCod.Text);
                  end;
               open;
            end
         else
            if combocons.ItemIndex = 1 then
               begin 
                  sql.Add(' WHERE A.DATA_ACE BETWEEN :DATAINI AND :DATAFIN');
                  if (not CheckEmp.Checked) then
                     begin 
                        sql.Add(' AND A.COD_EMP = :CODEMP');
                        Parambyname('codemp').AsInteger:= iEmp;
                     end;
                  sql.Add(' ORDER BY A.DATA_ACE, A.COD_ACE');
                  Parambyname('dataini').AsDate:=  edtdataini.Date;
                  Parambyname('datafin').AsDate:=  edtdatafin.Date;
                  open;
               end;
      end;
end;

procedure TFrmConsAcertoEstoque.BtnLocalizarClick(Sender: TObject);
begin 
   if QConsAcertoCOD_EMP.AsInteger <> iEmp then
      begin 
         AlertaCad('Você está logado na empresa ' + inttostr(iEmp) + #13 +
                     'Este Acerto de Estoque pertence à empresa ' + QConsAcertoCOD_EMP.AsString);
         exit;
      end;

   if (tag = 0) or (tag = 1) then
      begin 
         BuscaFormulario( TFrmAcertoEstoque, True );
         with FrmAcertoEstoque do
            begin 
               FrmAcertoEstoque.tag := 1;
               cod_ace.Text         := QConsAcertoCOD_ACE.AsString;
               EdtData.Date         := QConsAcertoDATA_ACE.Value;
               EdtCodMot.Text       := QConsAcertoCOD_MOT.AsString;
               edtnomemot.Text      := QConsAcertoNOME_MOT.AsString;
               MemoOBS.Text         := QConsAcertoOBSERVACAO.AsString;
               EdtCodLocal.Text     := QConsAcertoCODIGO_LOCAL_ESTOQUE.AsString;
               EdtNomeLocal.Text    := QConsAcertoDESCRICAO.AsString;
               BuscaItens;
               show;
               FormShow(sender);
            end;
         FrmConsAcertoEstoque.close;
      end;
end;

procedure TFrmConsAcertoEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QConsAcerto.SQL.Clear;
   QConsAcerto.SQL.Text := sSql;
   QConsAcerto.Close;

   {grava a posicao do combo}
   dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsAcertoEstoque.ComboCons', inttostr(ComboCons.itemIndex));
   Action:= caFree;
end;

procedure TFrmConsAcertoEstoque.FormKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsAcertoEstoque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      btnsair.Click;
end;

end.
