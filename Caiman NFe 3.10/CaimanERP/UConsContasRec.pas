unit UConsContasRec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Grids, DBGrids, Mask, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, 
  rxToolEdit, rxCurrEdit, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmConsContasRec = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    RDG: TRadioGroup;
    CheckEmp: TCheckBox;
    GB3: TGroupBox;
    BtnConsCli: TsSpeedButton;
    EdtCodCli: UNovosComponentes.TEdit;
    EdtNomeCli: TEdit;
    BtnOk: TButton;
    BtnSair: TButton;
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    Panel2: TPanel;
    Label4: TLabel;
    EdtTotalBruto: TCurrencyEdit;
    EdtAcres: TCurrencyEdit;
    Label5: TLabel;
    EdtDesc: TCurrencyEdit;
    Label6: TLabel;
    EdtTotalLiq: TCurrencyEdit;
    Label7: TLabel;
    Label2: TLabel;
    QConsRecebidas: TFDQuery;
    DSQConsRecebidas: TDataSource;
    DBGridRec: TDBGrid;
    DBGridARec: TDBGrid;
    QConsRecebidasCOD_CTR: TIntegerField;
    QConsRecebidasSEQUENCIA_CTR: TIntegerField;
    QConsRecebidasCOD_EMP: TIntegerField;
    QConsRecebidasDATA_CTR: TDateField;
    QConsRecebidasCOD_VENDA: TIntegerField;
    QConsRecebidasVENCTO_CTR: TDateField;
    QConsRecebidasVALOR_CTR: TBCDField;
    QConsRecebidasDTPAGTO_CTR: TDateField;
    QConsRecebidasVLRPAGO_CTR: TBCDField;
    QConsRecebidasACRESCIMO_CTR: TBCDField;
    QConsRecebidasDESCONTO_CTR: TBCDField;
    QConsRecebidasACRESCIMO_RECEBIDO_CTR: TBCDField;
    QConsRecebidasDESCONTO_CONCEDIDO_CTR: TBCDField;
    QConsRecebidasCOD_CAI: TIntegerField;
    QConsRecebidasNOME_CLI: TStringField;
    QConsAReceber: TFDQuery;
    DSQConsAReceber: TDataSource;
    QConsAReceberCOD_CTR: TIntegerField;
    QConsAReceberSEQUENCIA_CTR: TIntegerField;
    QConsAReceberCOD_EMP: TIntegerField;
    QConsAReceberDATA_CTR: TDateField;
    QConsAReceberCOD_VENDA: TIntegerField;
    QConsAReceberVENCTO_CTR: TDateField;
    QConsAReceberVALOR_CTR: TBCDField;
    QConsAReceberCOD_CAI: TIntegerField;
    QConsAReceberNOME_CLI: TStringField;
    QConsAReceberDIAS_CARENCIA: TIntegerField;
    QConsAReceberJUROS_ATRASO: TBCDField;
    QConsAReceberACRESCIMO: TFloatField;
    QConsAReceberTOTAL: TFloatField;
    QConsAReceberDIAS: TFloatField;
    QConsRecebidasTIPOREC: TStringField;
    QConsRecebidasCOD_COB: TIntegerField;
    QConsAReceberCOD_COB: TIntegerField;
    BtnCob: TButton;
    IBTRConsRec: TFDTransaction;
    BtnItens: TButton;
    QConsRecebidasDEVOLUCAO_CTR: TBCDField;
    QConsAReceberDEVOLUCAO_CTR: TBCDField;
    Label3: TLabel;
    EdtDevol: TCurrencyEdit;
    procedure EdtCodCliKeyPress(Sender: TObject; var Key: Char);
    procedure BtnOkClick(Sender: TObject);
    procedure EdtCodCliExit(Sender: TObject);
    procedure BtnConsCliClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure EdtCodCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RDGClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QConsAReceberCalcFields(DataSet: TDataSet);
    procedure EdtCodCliEnter(Sender: TObject);
    procedure BtnCobClick(Sender: TObject);
    procedure BtnItensClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsContasRec: TFrmConsContasRec;

implementation
uses
  Udm, Ubibli1, UConsCli, UTrocaCobranca, UContasRecItens, UNovoPrincipal;
var  sSqlAReceber  : string;
     sSqlRecebidas : string;

{$R *.dfm}

procedure TFrmConsContasRec.EdtCodCliKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmConsContasRec.BtnOkClick(Sender: TObject);
var cTotalBruto, cAcrescimo, cDesconto, cTotalLiq, cDevolucao : currency;
begin 
   cTotalbruto:= 0;
   cAcrescimo := 0;
   cDesconto  := 0;
   cTotalLiq  := 0;
   cDevolucao := 0;
   if edtdatafin.Date < edtdataini.Date then
      begin 
         AlertaCad('A data final não pode ser menor que a data inicial');
//         edtdatafin.SetFocus;
         exit;
      end;
   if IBTRConsRec.Active then
      IBTRConsRec.Commit;
   IBTRConsRec.StartTransaction;
   if rdg.ItemIndex = 0 then //recebidas
      begin 
         with QConsRecebidas do
            begin 
               close;
               sql.Clear;
               sql.Text:= sSqlRecebidas;
               sql.Add(' WHERE R.DTPAGTO_CTR BETWEEN :DATAINI AND :DATAFIN');
               if EdtCodCli.Text <> '' then
                  sql.Add(' AND R.COD_CLI = ' + edtcodcli.Text);
               if (not CheckEmp.Checked) then
                  begin 
                     sql.Add(' AND R.COD_EMP = :CODEMP');
                     Parambyname('codemp').AsInteger:= iEmp;
                  end;
               sql.Add(' ORDER BY R.DTPAGTO_CTR');
               Parambyname('dataini').AsDate  := edtdataini.Date;
               Parambyname('datafin').AsDate  := edtdatafin.Date;
               open;
               DisableControls;
               First;
               while not eof do
                  begin 
                     cTotalBruto:= cTotalBruto + QConsRecebidasVALOR_CTR.Value;
                     cAcrescimo := cAcrescimo  + QConsRecebidasACRESCIMO_RECEBIDO_CTR.Value;
                     cDesconto  := cDesconto   + QConsRecebidasDESCONTO_CONCEDIDO_CTR.Value;
                     cDevolucao := cDevolucao  + QConsRecebidasDEVOLUCAO_CTR.Value;
                     cTotalLiq  := cTotalLiq   + QConsRecebidasVLRPAGO_CTR.Value;
                     next;
                  end;
               edttotalbruto.Text := currtostr(cTotalBruto);
               edtacres.Text      := currtostr(cAcrescimo);
               EdtDesc.Text       := currtostr(cDesconto);
               EdtDevol.Text      := currtostr(cDevolucao);
               EdtTotalLiq.Text   := currtostr(cTotalLiq);
               First;
               EnableControls;
            end;
      end
   else
      begin 
         with QConsAReceber do
            begin 
               close;
               sql.Clear;
               sql.Text:= sSqlAReceber;
               sql.Add(' WHERE R.VENCTO_CTR BETWEEN :DATAINI AND :DATAFIN AND R.DTPAGTO_CTR IS NULL');
               if EdtCodCli.Text <> '' then
                  sql.Add(' AND R.COD_CLI = ' + edtcodcli.Text);
               if (not CheckEmp.Checked) then
                  begin 
                     sql.Add(' AND R.COD_EMP = :CODEMP');
                     Parambyname('codemp').AsInteger:= iEmp;
                  end;
               sql.Add(' ORDER BY R.VENCTO_CTR');
               Parambyname('dataini').AsDate  := edtdataini.Date;
               Parambyname('datafin').AsDate  := edtdatafin.Date;
               open;
               DisableControls;
               First;
               while not eof do
                  begin 
                     cTotalBruto:= cTotalBruto + QConsAReceberVALOR_CTR.Value;
                     cAcrescimo := cAcrescimo  + QConsAReceberACRESCIMO.Value;
                     cDevolucao := cDevolucao  + QConsAReceberDEVOLUCAO_CTR.Value;
                     next;
                  end;
               edttotalbruto.Text := currtostr(cTotalBruto);
               edtacres.Text      := currtostr(cAcrescimo);
               EdtDesc.Text       := currtostr(cDesconto);
               EdtDevol.Text      := currtostr(cDevolucao);
               EdtTotalLiq.Text   := currtostr(cTotalBruto - cDevolucao + cAcrescimo);
               First;
               EnableControls;
               DBGridARec.SetFocus;
            end;
      end;
end;

procedure TFrmConsContasRec.EdtCodCliExit(Sender: TObject);
begin 
   if (btnsair.Focused) or (edtcodcli.Text = '') then
      begin 
         edtnomecli.Clear;
         exit;
      end;
   edtnomecli.Text:= consulta('cliente', edtcodcli, 'cod_cli', 'nome_cli', dm.IBTransaction, dm.qConsulta);
   if edtnomecli.Text = '' then
      begin 
         AlertaCad('Cliente não Cadastrado');
//         edtcodcli.SetFocus;
      end;
end;

procedure TFrmConsContasRec.BtnConsCliClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsCli, FrmConsCli);
   FrmConsCli.tag:= 8;
   FrmConsCli.showmodal;
end;

procedure TFrmConsContasRec.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsContasRec.EdtCodCliKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsCli.Click;
end;

procedure TFrmConsContasRec.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsContasRec.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmConsContasRec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if IBTRConsRec.Active then
      IBTRConsRec.Commit;
   QConsAReceber.SQL.Clear;
   QConsAReceber.SQL.Text:= sSqlAReceber;
   QConsAReceber.close;
   QConsRecebidas.SQL.Clear;
   QConsRecebidas.SQL.Text:= sSqlRecebidas;
   QConsRecebidas.close;
   Action:= caFree;
end;

procedure TFrmConsContasRec.RDGClick(Sender: TObject);
begin 
   if IBTRConsRec.Active then
      IBTRConsRec.Commit;
   QConsRecebidas.Close;
   QConsAReceber.Close;
   EdtTotalBruto.Clear;
   EdtAcres.Clear;
   edtdesc.Clear;
   EdtTotalLiq.Clear;
   if RDG.ItemIndex = 1 then
      begin 
         DBGridRec.SendToBack;
         BtnCob.Enabled := true;
      end
   else
      begin 
         DBGridARec.SendToBack;
         BtnCob.Enabled := false;
      end;
end;

procedure TFrmConsContasRec.FormShow(Sender: TObject);
begin 
   sSqlAReceber  := QConsAReceber.SQL.Text;
   sSqlRecebidas := QConsRecebidas.SQL.Text;
   rdg.ItemIndex    := 1;
   edtdataini.Date  := date;
   edtdatafin.Date  := date;
   edtcodcli.Clear;
   edtnomecli.Clear;
   CheckEmp.Checked := true;
   RDGClick(RDG);
end;

procedure TFrmConsContasRec.QConsAReceberCalcFields(DataSet: TDataSet);
begin 
   QConsAReceberDIAS.Value:= date - QConsAReceberVENCTO_CTR.value;
   if QConsAReceberDIAS.Value > QConsAReceberDIAS_CARENCIA.Value then
      QConsAReceberACRESCIMO.Value:= ((QConsAReceberVALOR_CTR.Value - QConsAReceberDEVOLUCAO_CTR.Value) * ((QConsAReceberJUROS_ATRASO.Value / 30) * QConsAReceberDIAS.Value) / 100);
   QConsAReceberTOTAL.Value:= QConsAReceberVALOR_CTR.Value - QConsAReceberDEVOLUCAO_CTR.Value + QConsAReceberACRESCIMO.Value;
end;

procedure TFrmConsContasRec.EdtCodCliEnter(Sender: TObject);
begin 
   EdtCodCli.SelectAll;
end;

procedure TFrmConsContasRec.BtnCobClick(Sender: TObject);
var iSel : integer;
begin 
   { verifica se tem alugma selecionada }
   iSel:= 0;
   QConsAReceber.First;
   while not QConsAReceber.Eof do
      begin 
         if DBGridARec.SelectedRows.CurrentRowSelected = true then
            begin 
               Inc(iSel);
            end;
         QConsAReceber.Next;
      end;
   if iSel = 0 then
      begin 
         AlertaCad('Nenhuma parcela selecionada');
         exit;
      end;

   Application.CreateForm(TFrmTrocaCobranca, FrmTrocaCobranca);
   FrmTrocaCobranca.showmodal;
end;

procedure TFrmConsContasRec.BtnItensClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmContasRecItens, FrmContasRecItens);
   if rdg.ItemIndex = 0 then
      FrmContasRecItens.tag := 1
   else
      FrmContasRecItens.tag := 2;
   FrmContasRecItens.ShowModal;
end;

end.

