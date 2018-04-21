unit UConsLancCC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmConsLanCC = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    ComboCons: TComboBox;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    GB3: TGroupBox;
    BtnConsCC: TsSpeedButton;
    EdtCodCC: UNovosComponentes.TEdit;
    EdtNomeCC: TEdit;
    EdtCod: TEdit;
    BtnOk: TButton;
    BtnSair: TButton;
    DBGrid1: TDBGrid;
    BtnLocalizar: TButton;
    QConsLancamento: TFDQuery;
    DSLancamento: TDataSource;
    QConsLancamentoCOD_LAN: TIntegerField;
    QConsLancamentoCOD_CONTA: TIntegerField;
    QConsLancamentoDATAEMI_LAN: TDateField;
    QConsLancamentoDATAVENC_LAN: TDateField;
    QConsLancamentoNUM_CHEQUE_LAN: TStringField;
    QConsLancamentoVALOR_LAN: TBCDField;
    QConsLancamentoHISTORICO_LAN: TStringField;
    QConsLancamentoCOD_DOC: TIntegerField;
    QConsLancamentoDOCUMENTO_LAN: TStringField;
    QConsLancamentoNOME_CONTA: TStringField;
    QConsLancamentoNOME_DOC: TStringField;
    CheckEmp: TCheckBox;
    QConsLancamentoCOD_EMP: TIntegerField;
    QConsLancamentoDC_LAN: TIntegerField;
    QConsLancamentoCONCILIADO_LAN: TIntegerField;
    QConsLancamentoCALC_DEBCRED: TStringField;
    QConsLancamentoCALC_CONCILIADO: TStringField;
    procedure ComboConsChange(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure EdtCodCCKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodCCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodCCExit(Sender: TObject);
    procedure BtnConsCCClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure QConsLancamentoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsLanCC: TFrmConsLanCC;

implementation
uses
  Udm, Ubibli1, UConsConta, ULancCC, UNovoPrincipal, UPrincipal;
var  sSql : string;

{$R *.dfm}

procedure TFrmConsLanCC.ComboConsChange(Sender: TObject);
begin
   case combocons.ItemIndex of
     0:  begin
            gb3.Enabled        := true;
            gb3.Caption        := 'Código';
            gb2.Enabled        := false;
            EdtCodCC.Visible   := false;
            BtnConsCC.Visible  := false;
            EdtNomeCC.Visible  := false;
            EdtCod.Visible     := true;
            edtcod.Clear;
            edtcod.SetFocus;
         end;
     1:  begin
            gb3.Enabled        := true;
            gb3.Caption        := 'Conta Corrente';
            gb2.Enabled        := true;
            EdtCodCC.Visible   := true;
            BtnConsCC.Visible  := true;
            EdtNomeCC.Visible  := true;
            EdtCod.Visible     := false;
            EdtCodCC.Clear;
            EdtNomeCC.Clear;
            EdtCodCC.SetFocus;
         end;
     2,3: begin
             gb2.Enabled:= true;
             gb3.Enabled:= false;
             edtdataini.SetFocus;
          end;
     4,5: begin
             gb3.Enabled          := true;
             if ComboCons.ItemIndex = 4 then
                gb3.Caption       := 'Num.da Documento'
             else
                gb3.Caption       := 'Num. do Cheque';
             gb2.Enabled          := false;
             EdtCodCC.Visible    := false;
             BtnConsCC.Visible   := false;
             EdtNomeCC.Visible   := false;
             EdtCod.Visible       := true;
             edtcod.Clear;
             edtcod.SetFocus;
          end;
   end;
end;

procedure TFrmConsLanCC.BtnSairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmConsLanCC.EdtCodCCKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9', #13, #8]) then
      key := #0;
end;

procedure TFrmConsLanCC.EdtCodCCKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f3 then
      BtnConsCC.Click;
end;

procedure TFrmConsLanCC.EdtCodCCExit(Sender: TObject);
begin
   if (combocons.Focused) or (btnsair.Focused) then
      exit;
   EdtNomeCC.Text:= consulta('contas_corrente', EdtCodCC, 'cod_conta', 'nome_conta', dm.IBTransaction, dm.qConsulta);
   if EdtNomeCC.Text = '' then
      begin
         AlertaCad('Conta Corrente não Cadastrada');
//         EdtCodCC.SetFocus;
         EdtCodCC.SelectAll;
      end;
end;

procedure TFrmConsLanCC.BtnConsCCClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsConta, FrmConsConta);
   FrmConsConta.tag:= 7;
   FrmConsConta.showmodal;
end;

procedure TFrmConsLanCC.FormShow(Sender: TObject);
begin
   sSql:= QConsLancamento.SQL.Text;

   {busca a posicao do combo}
   try
     ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsLanCC.ComboCons'));
   except
     ComboCons.ItemIndex:= 0;
   end;

   edtdataini.Date    := date;
   edtdatafin.Date    := date;
   ComboConsChange(sender);
end;

procedure TFrmConsLanCC.BtnOkClick(Sender: TObject);
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsLancamento do
      begin
         close;
         sql.Clear;
         sql.Text:= sSql;
         case ComboCons.ItemIndex of
           0: begin
                 if not (edtcod.Text = '') then
                    begin
                       sql.Add(' WHERE L.COD_LAN = ' + edtcod.Text);
                       if (not CheckEmp.Checked) then
                          begin
                             sql.add(' AND L.COD_EMP = :CODEMP');
                             Parambyname('codemp').AsInteger:= iEmp;
                          end;
                       open;
                    end
                 else
                    begin
                       AlertaCad('Digite o Código do Lançamento');
//                       edtcod.SetFocus;
                    end;
              end;
           1: begin
                 sql.Add(' WHERE L.COD_CONTA = :CODCONTA ' +
                         ' AND L.DATAEMI_LAN BETWEEN :DATAINI AND :DATAFIN');
                 if (not CheckEmp.Checked) then
                    begin
                       sql.add(' AND L.COD_EMP = :CODEMP');
                       Parambyname('codemp').AsInteger:= iEmp;
                    end;
                 sql.Add(' ORDER BY L.DATAEMI_LAN');
                 Parambyname('codconta').AsInteger  := strtoint(edtcodcc.Text);
                 Parambyname('dataini').AsDate      := edtdataini.Date;
                 Parambyname('datafin').AsDate      := edtdatafin.Date;
                 open;
              end;
           2: begin
                 sql.Add(' WHERE L.DATAEMI_LAN BETWEEN :DATAINI AND :DATAFIN');
                 if (not CheckEmp.Checked) then
                    begin
                       sql.add(' AND L.COD_EMP = :CODEMP');
                       Parambyname('codemp').AsInteger:= iEmp;
                    end;

                 sql.Add(' ORDER BY L.DATAEMI_LAN, L.COD_LAN');
                 Parambyname('dataini').AsDate      := edtdataini.Date;
                 Parambyname('datafin').AsDate      := edtdatafin.Date;
                 open;
              end;
           3: begin
                 sql.Add(' WHERE L.DATAVENC_LAN BETWEEN :DATAINI AND :DATAFIN');
                 if (not CheckEmp.Checked) then
                    begin
                       sql.add(' AND L.COD_EMP = :CODEMP');
                       Parambyname('codemp').AsInteger:= iEmp;
                    end;

                 sql.add(' ORDER BY L.DATAVENC_LAN, L.COD_LAN');
                 Parambyname('dataini').AsDate := edtdataini.Date;
                 Parambyname('datafin').AsDate := edtdatafin.Date;
                 open;
              end;
           4: begin
                 sql.Add(' WHERE L.DOCUMENTO_LAN = :DOC');
                 if (not CheckEmp.Checked) then
                    begin
                       sql.add(' AND L.COD_EMP = :CODEMP');
                       Parambyname('codemp').AsInteger:= iEmp;
                    end;

                 sql.Add(' ORDER BY L.DATAEMI_LAN');
                 Parambyname('doc').AsString:= edtcod.Text;
                 open;
              end;
           5: begin
                 sql.Add(' WHERE L.NUM_CHEQUE_LAN = :CHEQUE');
                 if (not CheckEmp.Checked) then
                    begin
                       sql.add(' AND L.COD_EMP = :CODEMP');
                       Parambyname('codemp').AsInteger:= iEmp;
                    end;
                 sql.Add(' ORDER BY L.DATAEMI_LAN');
                 Parambyname('cheque').AsString  := edtcod.Text;
                 open;
              end;
         end;
      end;
end;

procedure TFrmConsLanCC.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsLanCC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close;
end;

procedure TFrmConsLanCC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;

   QConsLancamento.SQL.Clear;
   QConsLancamento.sql.Text:= sSql;
   QConsLancamento.close;

   {grava a posicao do combo}
   dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsLanCC.ComboCons', inttostr(ComboCons.itemIndex));
   Action:= caFree;
end;

procedure TFrmConsLanCC.BtnLocalizarClick(Sender: TObject);
begin
   BuscaFormulario( TFrmLancCC, True );
   with FrmLancCC do
      begin
         EdtCodigo.Text    := QConsLancamentoCOD_LAN.AsString;
         EdtData.Date      := QConsLancamentoDATAEMI_LAN.Value;
         EdtVencto.Date    := QConsLancamentoDATAVENC_LAN.Value;
         EdtCodConta.Text  := QConsLancamentoCOD_CONTA.AsString;
         EdtNomeConta.Text := QConsLancamentoNOME_CONTA.Value;
         EdtCodDoc.Text    := QConsLancamentoCOD_DOC.AsString;
         EdtNomeDoc.Text   := QConsLancamentoNOME_DOC.Value;
         edtdoc.Text       := QConsLancamentoDOCUMENTO_LAN.Value;
         EdtNumCheque.Text := QConsLancamentoNUM_CHEQUE_LAN.Value;
         edtvalor.Text     := QConsLancamentoVALOR_LAN.AsString;
         ComboDC.ItemIndex := QConsLancamentoDC_LAN.AsInteger;
         EdtHist.Text      := QConsLancamentoHISTORICO_LAN.AsString;
         Botoes('G');
         BuscaCentros;
      end;
   close;
end;

procedure TFrmConsLanCC.QConsLancamentoCalcFields(DataSet: TDataSet);
begin
   case QConsLancamentoDC_LAN.AsInteger of
    0: QConsLancamentoCALC_DEBCRED.AsString:= 'DÉBITO';
    1: QConsLancamentoCALC_DEBCRED.AsString:= 'CRÉDITO';
   end;

   case QConsLancamentoCONCILIADO_LAN.AsInteger of
    0: QConsLancamentoCALC_CONCILIADO.AsString:= 'CONCILIADO';
    1: QConsLancamentoCALC_CONCILIADO.AsString:= '';
   end;
end;

end.















