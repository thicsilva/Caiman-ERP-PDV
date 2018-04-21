unit UConsLancPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, DB, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmConsLancPagar = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
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
    EdtCod: UNovosComponentes.TEdit;
    DBGrid1: TDBGrid;
    CheckEmp: TCheckBox;
    BtnOk: TButton;
    BtnSair: TButton;
    QConsLancPagar: TFDQuery;
    DSQConsLancPagar: TDataSource;
    QConsLancPagarCOD_CPT: TIntegerField;
    QConsLancPagarCOD_EMP: TIntegerField;
    QConsLancPagarDATA_CTP: TDateField;
    QConsLancPagarCOD_FOR: TIntegerField;
    QConsLancPagarTIPO_DOC_CTP: TStringField;
    QConsLancPagarNUM_DOC_CTP: TStringField;
    QConsLancPagarVALOR_CTP: TBCDField;
    QConsLancPagarRAZAO_FOR: TStringField;
    QConsLancPagarDTVENCTO_CTP: TDateField;
    BtnLocalizar: TButton;
    QConsLancPagarOBS_CTP: TStringField;
    QConsLancPagarCOD_ENTRADA: TIntegerField;
    BtnItens: TButton;
    QConsLancPagarSEQUENCIA_CTP: TIntegerField;
    QConsLancPagarDTPAGTO_CTP: TDateField;
    QConsLancPagarDESCRICAO: TStringField;
    QConsLancPagarCOD_CLASSIFICACAO: TIntegerField;
    QConsLancPagarVALOR_PAGO_CTP: TBCDField;
    QConsLancPagarDESCONTO_CTP: TBCDField;
    QConsLancPagarACRESCIMO_CTP: TBCDField;
    QConsLancPagarCODIGO_FORMA_PAGAMENTO: TIntegerField;
    QConsLancPagarCODIGO_CENTRO_CUSTO: TIntegerField;
    QConsLancPagarCENTRO_CUSTO: TStringField;
    QConsLancPagarCONTA: TStringField;
    QConsLancPagarCHEQUE: TStringField;
    QConsLancPagarDUPLICATA_PENDENTE: TStringField;
    Shape1: TShape;
    Label2: TLabel;
    BtnPendente: TButton;
    QPendente: TFDQuery;
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboConsChange(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure EdtCodKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodForExit(Sender: TObject);
    procedure EdtCodForKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsForClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure BtnItensClick(Sender: TObject);
    procedure QConsLancPagarAfterScroll(DataSet: TDataSet);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnPendenteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsLancPagar: TFrmConsLancPagar;

implementation
uses
  Udm, Ubibli1, UConsFor, UContasPagar, UItensEntradas, UNovoPrincipal,
  UPrincipal;
var sSql : string;
    iAuxCodCPT : integer;

{$R *.dfm}

procedure TFrmConsLancPagar.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsLancPagar.FormShow(Sender: TObject);
begin 
   {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsLancPagar.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;

   sSql:= QConsLancPagar.SQL.Text;
   CheckEmp.Checked    := true;
   BtnItens.Enabled    := false;
   combocons.ItemIndex := 0;
   comboconschange(sender);
end;

procedure TFrmConsLancPagar.ComboConsChange(Sender: TObject);
begin 
   case ComboCons.ItemIndex of
    0:begin 
         gb2.Enabled        := true;
         gb2.Caption        := 'Data de Emissão';
         edtcod.Visible     := true;
         edtcodfor.Visible  := false;
         BtnConsFor.Visible := false;
         edtnomefor.Visible := false;
         gb3.Caption        := '';
         gb3.Enabled        := false;
         edtdataini.Date    := date;
         edtdatafin.Date    := date;
      end;
    1:begin 
         gb2.Enabled        := true;
         gb2.Caption        := 'Data de Vencimento';
         edtcod.Visible     := true;
         edtcodfor.Visible  := false;
         BtnConsFor.Visible := false;
         edtnomefor.Visible := false;
         gb3.Caption        := '';
         gb3.Enabled        := false;
         edtdataini.Date    := date;
         edtdatafin.Date    := date;
      end;
    2:begin 
         gb2.Enabled        := false;
         gb3.Enabled        := true;
         gb3.Caption        := 'Código';
         edtcod.Visible     := true;
         edtcodfor.Visible  := false;
         BtnConsFor.Visible := false;
         edtnomefor.Visible := false;
         edtcod.Clear;
      end;
    3:begin 
         gb2.Enabled        := true;
         gb3.Enabled        := true;
         gb3.Caption        := 'Fornecedor';
          edtcod.Visible     := false;
         edtcodfor.Visible  := true;
         BtnConsFor.Visible := true;
         edtnomefor.Visible := true;
         edtcodfor.Clear;
         edtnomefor.Clear;
         edtdataini.Date    := date;
         edtdatafin.Date    := date;
      end;
   end;
end;

procedure TFrmConsLancPagar.BtnOkClick(Sender: TObject);
begin 
   if edtdatafin.Date < edtdataini.Date then
      begin 
         AlertaCad('A data final não pode ser menor que a data inicial');
         exit;
      end;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsLancPagar do
      begin 
         close;
         sql.Clear;
         sql.Text:= sSql;
         case combocons.ItemIndex of
          0:begin 
               if (not CheckEmp.Checked) then
                  begin 
                     sql.Add(' WHERE C.DATA_CTP BETWEEN :DATAINI AND :DATAFIN AND ' +
                             'C.COD_EMP = :CODEMP ' +
                             'ORDER BY C.DATA_CTP, C.COD_CPT');
                     Parambyname('codemp').AsInteger:= iEmp;
                  end
               else
                  sql.add(' WHERE C.DATA_CTP BETWEEN :DATAINI AND :DATAFIN ' +
                          'ORDER BY C.DATA_CTP, C.COD_CPT');

               Parambyname('dataini').AsDate  := edtdataini.Date;
               Parambyname('datafin').AsDate  := edtdatafin.Date;
            end;
          1:begin 
               if (not CheckEmp.Checked) then
                  begin 
                     sql.Add(' WHERE C.DTVENCTO_CTP BETWEEN :DATAINI AND :DATAFIN ' +
                             'AND C.COD_EMP = :CODEMP ' +
                             'ORDER BY C.DATA_CTP, C.COD_CPT');
                     Parambyname('codemp').AsInteger:= iEmp;
                  end
               else
                  sql.add(' WHERE C.DTVENCTO_CTP BETWEEN :DATAINI AND :DATAFIN ' +
                          'ORDER BY C.DATA_CTP, C.COD_CPT');
                Parambyname('dataini').AsDate  := edtdataini.Date;
                Parambyname('datafin').AsDate  := edtdatafin.Date;
            end;
          2:begin 
               if trim(edtcod.Text) = '' then
                  begin 
                     AlertaCad('Digite o Código do Lançamento');
//                     edtcod.SetFocus;
                     exit;
                  end;
               if (not CheckEmp.Checked) then
                  begin 
                     sql.Add(' WHERE C.COD_CPT = :COD AND C.COD_EMP = :CODEMP');
                     Parambyname('codemp').AsInteger:= iEmp;
                  end
               else
                  sql.add(' WHERE C.COD_CPT = :COD');
               Parambyname('cod').AsInteger:= strtoint(EdtCod.Text);
            end;
          3:begin 
               if (not CheckEmp.Checked) then
                  begin 
                     sql.Add(' WHERE C.COD_FOR = :CODFOR AND ' +
                             'C.DATA_CTP BETWEEN :DATAINI AND :DATAFIN AND C.COD_EMP = :CODEMP ' +
                             'ORDER BY C.DATA_CTP, C.COD_CPT');
                     Parambyname('codemp').AsInteger:= iEmp;
                  end
               else
                  sql.Add(' WHERE C.COD_FOR = :CODFOR AND ' +
                          'C.DATA_CTP BETWEEN :DATAINI AND :DATAFIN ' +
                          'ORDER BY C.DATA_CTP, C.COD_CPT');

               Parambyname('codfor').AsInteger:= strtoint(EdtCodFor.text);
               Parambyname('dataini').AsDate  := edtdataini.Date;
               Parambyname('datafin').AsDate  := edtdatafin.Date;
            end;
          4:begin 
               sql.Add(' WHERE C.DATA_CTP BETWEEN :DATAINI AND :DATAFIN ' +
                       ' AND C.DUPLICATA_PENDENTE = ' + #39 + 'S' + #39 +
                       ' ORDER BY C.DATA_CTP, C.COD_CPT');

               Parambyname('dataini').AsDate  := edtdataini.Date;
               Parambyname('datafin').AsDate  := edtdatafin.Date;
            end;
         end;
         open;
         QConsLancPagar.Locate('COD_CPT', iAuxCodCPT, []);
         iAuxCodCPT:= 0;
      end;
   dbgrid1.SetFocus;
end;

procedure TFrmConsLancPagar.EdtCodKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmConsLancPagar.EdtCodForExit(Sender: TObject);
begin 
   if (btnsair.Focused) or (combocons.Focused) then
      exit;
   EdtNomeFor.Text := consulta('fornecedor', edtcodfor, 'cod_for', 'razao_for', dm.IBTransaction, dm.qConsulta);
   if edtnomefor.Text = '' then
      begin 
         AlertaCad('Fornecedor não Cadastrado');
//         edtcodfor.SetFocus;
         edtcodfor.SelectAll;
      end;
end;

procedure TFrmConsLancPagar.EdtCodForKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      begin 
         Application.CreateForm(TFrmConsFor, FrmConsFor);
         FrmConsFor.Tag:= 2;
         FrmConsFor.ShowModal;
      end;
end;

procedure TFrmConsLancPagar.BtnConsForClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsFor, FrmConsFor);
   FrmConsFor.Tag:= 2;
   FrmConsFor.ShowModal;
end;

procedure TFrmConsLancPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QConsLancPagar.SQL.Clear;
   QConsLancPagar.sql.Text:= sSql;
   QConsLancPagar.Close;

   {grava a posicao do combo}
   dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsLancPagar.ComboCons', inttostr(ComboCons.itemIndex));
   Action:= caFree;
end;

procedure TFrmConsLancPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      begin 
         btnsair.Focused;
         btnsair.Click;
      end;
end;

procedure TFrmConsLancPagar.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsLancPagar.BtnLocalizarClick(Sender: TObject);
begin 
   if tag = 0 then
     begin
        BuscaFormulario( TFrmContasPagar, True );
        with FrmContasPagar do
           begin 
              tag:= 1;
              limpaedit(FrmContasPagar);
              ededit(FrmContasPagar, false);
              cod_cpt.Text             := QConsLancPagarCOD_CPT.AsString;
              EdtSeq.Text              := QConsLancPagarSEQUENCIA_CTP.AsString;
              edtdata.Text             := QConsLancPagarDATA_CTP.AsString;
              edtcodfor.Text           := QConsLancPagarCOD_FOR.AsString;
              edtnomefor.Text          := QConsLancPagarRAZAO_FOR.Value;
              EdtTipoDoc.Text          := QConsLancPagarTIPO_DOC_CTP.Value;
              EdtNumDoc.Text           := QConsLancPagarNUM_DOC_CTP.Value;
              edtvalor.Text            := QConsLancPagarVALOR_CTP.AsString;
              EdtVenc.Text             := QConsLancPagarDTVENCTO_CTP.AsString;
              EdtObs.Text              := QConsLancPagarOBS_CTP.Value;
              EdtCodClassif.Text       := QConsLancPagarCOD_CLASSIFICACAO.AsString;
              EdtNomeClassif.Text      := QConsLancPagarDESCRICAO.AsString;
              EdtCodCentroCusto.Text   := QConsLancPagarCODIGO_CENTRO_CUSTO.AsString;
              EdtCentroCusto.Text      := QConsLancPagarCONTA.AsString;
              EdtNomeCentroCusto.Text  := QConsLancPagarCENTRO_CUSTO.AsString;

              if trim(QConsLancPagarDUPLICATA_PENDENTE.AsString) = 'S' then
                 CheckPendente.Checked:= true
              else
                 CheckPendente.Checked:= false;
              
              FormShow(sender);
              show;
           end;
        close;
     end;
end;

procedure TFrmConsLancPagar.BtnItensClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmItensEntradas, FrmItensEntradas);
   FrmItensEntradas.tag:= 1;
   FrmItensEntradas.showmodal;
end;

procedure TFrmConsLancPagar.QConsLancPagarAfterScroll(DataSet: TDataSet);
begin 
   if QConsLancPagarCOD_ENTRADA.IsNull then
      BtnItens.Enabled:= false
   else
      BtnItens.Enabled:= true;

   if trim(QConsLancPagarDUPLICATA_PENDENTE.AsString) = 'S' then
      BtnPendente.Caption:= '&Desmarcar Pendencia'
   else
      BtnPendente.Caption:= '&Marcar como Pendente';
end;

procedure TFrmConsLancPagar.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin 
   if trim(QConsLancPagarDUPLICATA_PENDENTE.AsString) = 'S' then
      begin 
         DBGrid1.Canvas.Font.Color:= clRed;
         Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
      end;
end;

procedure TFrmConsLancPagar.BtnPendenteClick(Sender: TObject);
begin 
   iAuxCodCPT:= QConsLancPagarCOD_CPT.AsInteger;

   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   dm.IBTRAux.StartTransaction;
   try
     try
       with QPendente do
          begin 
             close;
             ParamByName('cod').AsInteger:= QConsLancPagarCOD_CPT.AsInteger;
             ParamByName('seq').AsInteger:= QConsLancPagarSEQUENCIA_CTP.AsInteger;
             if trim(QConsLancPagarDUPLICATA_PENDENTE.AsString) = 'S' then
                Parambyname('pend').AsString:= 'N'
             else
                Parambyname('pend').AsString:= 'S';
             ExecOrOpen;
          end;
       dm.IBTRAux.Commit;
     except
       dm.IBTRAux.Rollback;
       AlertaCad('Erro ao atualizar o contas a pagar');
     end;
   finally
     QPendente.Close;
     BtnOk.Click;
   end;
end;

end.
