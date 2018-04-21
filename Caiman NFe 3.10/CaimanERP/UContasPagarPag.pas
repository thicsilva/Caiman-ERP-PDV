unit UContasPagarPag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, 
  rxPlacemnt, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton, cxPC;

type
  TFrmContasPagarPag = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    ComboCons: TComboBox;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    BtnOk: TButton;
    BtnSair: TButton;
    CheckEmp: TCheckBox;
    GB3: TGroupBox;
    BtnConsFor: TsSpeedButton;
    EdtCodFor: UNovosComponentes.TEdit;
    EdtNomeFor: TEdit;
    DBGrid1: TDBGrid;
    BtnPagar: TButton;
    Label2: TLabel;
    LTotal: TLabel;
    QConsContasPagar: TFDQuery;
    DSQConsContasPagar: TDataSource;
    QConsContasPagarCOD_CPT: TIntegerField;
    QConsContasPagarCOD_EMP: TIntegerField;
    QConsContasPagarDATA_CTP: TDateField;
    QConsContasPagarCOD_FOR: TIntegerField;
    QConsContasPagarTIPO_DOC_CTP: TStringField;
    QConsContasPagarNUM_DOC_CTP: TStringField;
    QConsContasPagarOBS_CTP: TStringField;
    QConsContasPagarRAZAO_FOR: TStringField;
    QConsContasPagarVALOR_CTP: TBCDField;
    QConsContasPagarDTVENCTO_CTP: TDateField;
    BtnItens: TButton;
    QConsContasPagarCOD_ENTRADA: TIntegerField;
    QConsContasPagarSEQUENCIA_CTP: TIntegerField;
    IBTRConsPagar: TFDTransaction;
    QConsContasPagarCODIGO_CENTRO_CUSTO: TIntegerField;
    QConsContasPagarCENTRO_CUSTO: TStringField;
    QConsContasPagarCONTA: TStringField;
    QConsContasPagarDUPLICATA_PENDENTE: TStringField;
    BtnPendente: TButton;
    QPendente: TFDQuery;
    CheckPendente: TCheckBox;
    procedure ComboConsChange(Sender: TObject);
    procedure EdtCodForExit(Sender: TObject);
    procedure EdtCodForKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodForKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsForClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnPagarClick(Sender: TObject);
    procedure BtnItensClick(Sender: TObject);
    procedure QConsContasPagarAfterScroll(DataSet: TDataSet);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnPendenteClick(Sender: TObject);
    procedure EdtCodForEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmContasPagarPag: TFrmContasPagarPag;

implementation
uses
  Udm, Ubibli1, UConsFor, Upagamento, UItensEntradas, UNovoPrincipal,
  UPrincipal;
var  sSql : string;
     iAuxCodCPT : integer;

{$R *.dfm}

function FrmContasPagarPag: TFrmContasPagarPag;
begin
   Result := TFrmContasPagarPag( BuscaFormulario( TFrmContasPagarPag, False ) );
end;

procedure TFrmContasPagarPag.ComboConsChange(Sender: TObject);
begin 
   if ComboCons.ItemIndex = 0 then //data
      begin 
         edtcodfor.Clear;
         edtnomefor.Clear;
         gb3.Enabled:= false;
         edtdataini.SetFocus;
      end
   else
      if combocons.ItemIndex = 1 then
         begin 
            gb3.Enabled:= true;
            edtcodfor.Clear;
            edtnomefor.Clear;
            edtcodfor.SetFocus;
         end;
end;

procedure TFrmContasPagarPag.EdtCodForExit(Sender: TObject);
begin 
   if (btnsair.Focused) or (trim(EdtCodFor.Text) = '') then
      begin 
         EdtNomeFor.Clear;
         exit;
         abort;
      end;

   EdtNomeFor.Text := consulta('fornecedor', edtcodfor, 'cod_for', 'razao_for', dm.IBTransaction, dm.qConsulta);
   if edtnomefor.Text = '' then
      begin 
         AlertaCad('Fornecedor não Cadastrado');
//         edtcodfor.SetFocus;
      end;
end;

procedure TFrmContasPagarPag.EdtCodForKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      begin 
         Application.CreateForm(TFrmConsFor, FrmConsFor);
         FrmConsFor.Tag:= 3;
         FrmConsFor.ShowModal;
      end;
end;

procedure TFrmContasPagarPag.EdtCodForKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmContasPagarPag.BtnConsForClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsFor, FrmConsFor);
   FrmConsFor.Tag:= 3;
   FrmConsFor.ShowModal;
end;

procedure TFrmContasPagarPag.BtnSairClick(Sender: TObject);
begin 
   if Parent is TcxTabSheet then
      frmMenu.FTDI.CloseTabOfForm( TFormClass( Self.ClassType ) )
   else
      close;
end;

procedure TFrmContasPagarPag.BtnOkClick(Sender: TObject);
var cTotal : currency;
begin 
   if combocons.ItemIndex = 0 then
      begin 
         if edtdatafin.Date < edtdataini.Date then
            begin 
               AlertaCad('A data final não pode ser menor que a data incial');
               exit;
            end;
      end
   else
      if combocons.ItemIndex = 1 then
         begin 
            if edtcodfor.Text = '' then
               begin 
                  AlertaCad('Digite o código do fornecedor');
                  exit;
               end;
         end;

   cTotal:= 0;

   if IBTRConsPagar.Active then
      IBTRConsPagar.Commit;
   IBTRConsPagar.StartTransaction;
   with QConsContasPagar do
      begin 
         close;
         sql.Clear;
         sql.Text:= sSql;

         if combocons.ItemIndex = 1 then //fornecedor
            begin 
               if trim(EdtCodFor.Text) = '' then
                  begin 
                     AlertaCad('Digite o código do fornecedor');
//                     EdtCodFor.SetFocus;
                     exit;
                  end;

               sql.Add(' AND C.COD_FOR = :CODFOR');
               Parambyname('codfor').AsInteger:= strtoint(EdtCodFor.Text);
            end;

         if (not CheckEmp.Checked) then
            begin 
               sql.Add(' AND C.COD_EMP = :CODEMP');
               Parambyname('codemp').AsInteger:= iEmp;
            end;

         sql.add(' AND C.DTPAGTO_CTP IS NULL');

         if CheckPendente.Checked then
            sql.add(' AND C.DUPLICATA_PENDENTE = ' + #39 + 'S' + #39);

         sql.Add(' ORDER BY C.DTVENCTO_CTP, COD_CPT');

         Parambyname('dataini').AsDate:= EdtDataIni.Date;
         Parambyname('datafin').AsDate:= EdtDataFin.Date;
         open;

         while not eof do
            begin 
               cTotal:= cTotal + QConsContasPagarVALOR_CTP.AsCurrency;
               next;
            end;
         LTotal.Caption  := currtostrf(cTotal, ffnumber, 2);

         if cTotal > 0 then
            begin 
               BtnPagar.Enabled:= true;
               BtnItens.Enabled:= true;
               QConsContasPagar.Locate('COD_CPT', iAuxCodCPT, []);
               iAuxCodCPT:= 0;
               dbgrid1.SetFocus;
            end
         else
            begin 
               LTotal.Caption  := '0,00';
               btnpagar.Enabled:= false;
               BtnItens.Enabled:= false;
            end;
      end;
end;

procedure TFrmContasPagarPag.FormShow(Sender: TObject);
begin 
   iAuxCodCPT:= 0;
   sSql:= QConsContasPagar.SQL.Text;
   CheckEmp.Checked      := true;
   CheckPendente.Checked := false;
   btnpagar.Enabled      := false;
   LTotal.Caption        := '0,00';
   combocons.ItemIndex   := 0;
   comboconschange(Sender);
   edtdataini.Date       := date;
   edtdatafin.Date       := date;
end;

procedure TFrmContasPagarPag.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if IBTRConsPagar.Active then
      IBTRConsPagar.Commit;
   QConsContasPagar.SQL.Clear;
   QConsContasPagar.SQL.Text:= sSql;
   QConsContasPagar.Close;

   Action:= caFree;
end;

procedure TFrmContasPagarPag.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      begin 
         btnsair.Focused;
         btnsair.Click;
      end;
end;

procedure TFrmContasPagarPag.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmContasPagarPag.BtnPagarClick(Sender: TObject);
var cTotal : currency;
    iSelecaoContasPagar : integer;
begin 
   { VERIFICA SE TEM CONTA SELECIONADA }
   iSelecaoContasPagar:= 0;
   cTotal:= 0;
   with QConsContasPagar do
      begin 
         DisableControls;
         first;
         while not eof do
            begin 
               if dbgrid1.SelectedRows.CurrentRowSelected = true then
                  begin 
                     inc(iSelecaoContasPagar);
                     cTotal:= cTotal + QConsContasPagarVALOR_CTP.AsCurrency;
                  end;
               next;
            end;
         first;
         EnableControls;
      end;

   if iSelecaoContasPagar = 0 then
      begin 
         AlertaCad('Selecione a(s) Contas');
         exit;
         abort;
      end;

   Application.CreateForm(TFrmPagamento, FrmPagamento);
   with FrmPagamento do
      begin 
         edtpagto.Text     := datetostr(date);
         edttotal.Text     := currtostr(cTotal);
         EdtValorPago.text := currtostr(cTotal);

         if iSelecaoContasPagar > 1 then
            begin 
               EdtDesc.Enabled  := false;
               EdtAcres.Enabled := false;
            end
         else
            begin 
               EdtDesc.Enabled  := true;
               EdtAcres.Enabled := true;
            end;

         FrmPagamento.ShowModal;
      end;
end;

procedure TFrmContasPagarPag.BtnItensClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmItensEntradas, FrmItensEntradas);
   FrmItensEntradas.tag:= 0;
   FrmItensEntradas.showmodal;
end;

procedure TFrmContasPagarPag.QConsContasPagarAfterScroll(
  DataSet: TDataSet);
begin 
   if QConsContasPagarCOD_ENTRADA.IsNull then
      BtnItens.Enabled:= false
   else
      BtnItens.Enabled:= true;

   if trim(QConsContasPagarDUPLICATA_PENDENTE.AsString) = 'S' then
      BtnPendente.Caption:= '&Desmarcar Pendencia'
   else
      BtnPendente.Caption:= '&Marcar como Pendente';
end;

procedure TFrmContasPagarPag.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin 
   if trim(QConsContasPagarDUPLICATA_PENDENTE.AsString) = 'S' then
      begin 
         DBGrid1.Canvas.Font.Color:= clRed;
         Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
      end;
end;

procedure TFrmContasPagarPag.BtnPendenteClick(Sender: TObject);
begin 
   iAuxCodCPT:= QConsContasPagarCOD_CPT.AsInteger;

   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   dm.IBTRAux.StartTransaction;
   try
     try
       with QPendente do
          begin 
             close;
             ParamByName('cod').AsInteger:= QConsContasPagarCOD_CPT.AsInteger;
             ParamByName('seq').AsInteger:= QConsContasPagarSEQUENCIA_CTP.AsInteger;
             if trim(QConsContasPagarDUPLICATA_PENDENTE.AsString) = 'S' then
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

procedure TFrmContasPagarPag.EdtCodForEnter(Sender: TObject);
begin 
   EdtCodFor.SelectAll;
end;

end.
