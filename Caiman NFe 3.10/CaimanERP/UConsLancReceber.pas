unit UConsLancReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DB, 
  rxPlacemnt, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmConsLancReceber = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    ComboCons: TComboBox;
    GB3: TGroupBox;
    BtnConsCli: TsSpeedButton;
    EdtCodCli: UNovosComponentes.TEdit;
    EdtNomeCli: TEdit;
    EdtCod: UNovosComponentes.TEdit;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    BtnOk: TButton;
    BtnSair: TButton;
    CheckEmp: TCheckBox;
    DBGrid1: TDBGrid;
    BtnLocalizar: TButton;
    QConsReceber: TFDQuery;
    DSQConsReceber: TDataSource;
    QConsReceberCOD_CTR: TIntegerField;
    QConsReceberSEQUENCIA_CTR: TIntegerField;
    QConsReceberCOD_EMP: TIntegerField;
    QConsReceberDATA_CTR: TDateField;
    QConsReceberCOD_VENDA: TIntegerField;
    QConsReceberCOD_CLI: TIntegerField;
    QConsReceberVENCTO_CTR: TDateField;
    QConsReceberVALOR_CTR: TBCDField;
    QConsReceberDTPAGTO_CTR: TDateField;
    QConsReceberVLRPAGO_CTR: TBCDField;
    QConsReceberACRESCIMO_CTR: TBCDField;
    QConsReceberDESCONTO_CTR: TBCDField;
    QConsReceberNUMDOCUMENTO_CTR: TStringField;
    QConsReceberOBS_CTR: TStringField;
    QConsReceberACRESCIMO_RECEBIDO_CTR: TBCDField;
    QConsReceberDESCONTO_CONCEDIDO_CTR: TBCDField;
    QConsReceberNOME_CLI: TStringField;
    QConsReceberCOD_CAI: TIntegerField;
    QConsReceberCOD_COB: TIntegerField;
    QConsReceberNOME_COB: TStringField;
    QConsReceberCAIXA_EMISSAO_CTR: TIntegerField;
    QConsReceberPARCELA_CTR: TIntegerField;
    QConsReceberDEVOLUCAO_CTR: TBCDField;
    QConsReceberCODIGO_DUPLICATA: TIntegerField;
    QConsReceberCODIGO_FORMA_PAGAMENTO: TIntegerField;
    QConsReceberCODIGO_CLASSIFICACAO: TIntegerField;
    QConsReceberDESCRICAO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure ComboConsChange(Sender: TObject);
    procedure BtnConsCliClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure EdtCodCliExit(Sender: TObject);
    procedure EdtCodCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodCliEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsLancReceber: TFrmConsLancReceber;

implementation
uses
  udm, ubibli1, UContasReceber, UConsCli, UCancelaRecebimento, UNovoPrincipal,
  UPrincipal;
var  sSql : string;

{$R *.dfm}

procedure TFrmConsLancReceber.FormShow(Sender: TObject);
begin 
   sSql:= QConsReceber.SQL.Text;
   btnlocalizar.Enabled := false;
   comboconschange(sender);
end;

procedure TFrmConsLancReceber.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsLancReceber.ComboConsChange(Sender: TObject);
begin 
   case ComboCons.ItemIndex of
    0:begin 
         gb2.Enabled        := true;
         gb2.Caption        := 'Data de Emissão';
         edtcod.Visible     := true;
         edtcodcli.Visible  := false;
         BtnConscli.Visible := false;
         edtnomecli.Visible := false;
         gb3.Caption        := '';
         gb3.Enabled        := false;
         edtdataini.Date    := date;
         edtdatafin.Date    := date;
      end;
    1:begin 
         gb2.Enabled        := true;
         gb2.Caption        := 'Data de Vencimento';
         edtcod.Visible     := true;
         edtcodcli.Visible  := false;
         BtnConscli.Visible := false;
         edtnomecli.Visible := false;
         gb3.Caption        := '';
         gb3.Enabled        := false;
         edtdataini.Date    := date;
         edtdatafin.Date    := date;
      end;
    2,4: begin 
            gb2.Enabled        := false;
            gb3.Enabled        := true;
            gb3.Caption        := 'Código';
            edtcod.Visible     := true;
            edtcodcli.Visible  := false;
            BtnConscli.Visible := false;
            edtnomecli.Visible := false;
            edtcod.Clear;
         end;
    3:begin 
         gb2.Enabled        := true;
         gb3.Enabled        := true;
         gb3.Caption        := 'Cliente';
         edtcod.Visible     := false;
         edtcodcli.Visible  := true;
         BtnConscli.Visible := true;
         edtnomecli.Visible := true;
         edtcodcli.Clear;
         edtnomecli.Clear;
         edtdataini.Date    := date;
         edtdatafin.Date    := date;
      end;
   end;
end;

procedure TFrmConsLancReceber.BtnConsCliClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsCli, FrmConsCli);
   FrmConsCli.Tag:= 5;
   FrmConsCli.ShowModal;
end;

procedure TFrmConsLancReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QConsReceber.SQL.Clear;
   QConsReceber.sql.Text:= sSql;
   QConsReceber.Close;

   Action:= caFree;
end;

procedure TFrmConsLancReceber.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsLancReceber.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      begin 
         btnsair.Focused;
         btnsair.Click;
      end;
end;

procedure TFrmConsLancReceber.BtnOkClick(Sender: TObject);
begin 
   if edtdatafin.Date < edtdataini.Date then
      begin 
         AlertaCad('A data final não pode ser menor que a data inicial');
         exit;
      end;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsReceber do
      begin 
         close;
         sql.Clear;
         sql.Text:= sSql;
         case combocons.ItemIndex of
           0:begin 
                if FrmConsLancReceber.Tag = 0 then
                   begin 
                      if (not CheckEmp.Checked) then
                         begin 
                            sql.Add(' WHERE C.DATA_CTR BETWEEN :DATAINI AND :DATAFIN AND ' +
                                    'C.COD_EMP = :CODEMP ' +
                                    'ORDER BY C.DATA_CTR, COD_CTR, SEQUENCIA_CTR');
                            Parambyname('codemp').AsInteger:= iEmp;
                         end
                      else
                         sql.add(' WHERE C.DATA_CTR BETWEEN :DATAINI AND :DATAFIN ' +
                                 'ORDER BY C.DATA_CTR, COD_CTR, SEQUENCIA_CTR');
                      Parambyname('dataini').AsDate  := edtdataini.Date;
                      Parambyname('datafin').AsDate  := edtdatafin.Date;
                   end
                else
                   if FrmConsLancReceber.Tag = 1 then
                      begin 
                         if (not CheckEmp.Checked) then
                            begin 
                               sql.Add(' WHERE C.DATA_CTR BETWEEN :DATAINI AND :DATAFIN AND ' +
                                       'DTPAGTO_CTR IS NOT NULL AND C.COD_EMP = :CODEMP ' +
                                       'ORDER BY C.DATA_CTR, COD_CTR, SEQUENCIA_CTR');
                               Parambyname('codemp').AsInteger:= iEmp;
                            end
                         else
                             sql.add(' WHERE C.DATA_CTR BETWEEN :DATAINI AND :DATAFIN AND ' +
                                     'DTPAGTO_CTR IS NOT NULL ' +
                                     'ORDER BY C.DATA_CTR, COD_CTR, SEQUENCIA_CTR');

                          Parambyname('dataini').AsDate  := edtdataini.Date;
                          Parambyname('datafin').AsDate  := edtdatafin.Date;
                      end;
             end;

           1:begin 
                if FrmConsLancReceber.Tag = 0 then
                   begin 
                      if (not CheckEmp.Checked) then
                         begin 
                            sql.Add(' WHERE C.VENCTO_CTR BETWEEN :DATAINI AND :DATAFIN AND ' +
                                    'C.COD_EMP = :CODEMP ' +
                                    'ORDER BY C.VENCTO_CTR, COD_CTR, SEQUENCIA_CTR');
                            Parambyname('codemp').AsInteger:= iEmp;
                         end
                      else
                         sql.add(' WHERE C.VENCTO_CTR BETWEEN :DATAINI AND :DATAFIN ' +
                                 'ORDER BY C.VENCTO_CTR, COD_CTR, SEQUENCIA_CTR');
                      Parambyname('dataini').AsDate  := edtdataini.Date;
                      Parambyname('datafin').AsDate  := edtdatafin.Date;
                   end
                else
                   if FrmConsLancReceber.Tag = 1 then
                      begin 
                         if (not CheckEmp.Checked) then
                            begin 
                               sql.Add(' WHERE C.VENCTO_CTR BETWEEN :DATAINI AND :DATAFIN AND ' +
                                       'DTPAGTO_CTR IS NOT NULL AND C.COD_EMP = :CODEMP ' +
                                       'ORDER BY C.VENCTO_CTR, COD_CTR, SEQUENCIA_CTR');
                               Parambyname('codemp').AsInteger:= iEmp;
                            end
                         else
                            sql.add(' WHERE C.VENCTO_CTR BETWEEN :DATAINI AND :DATAFIN AND ' +
                                    'DTPAGTO_CTR IS NOT NULL AND ' +
                                    'ORDER BY C.VENCTO_CTR, COD_CTR, SEQUENCIA_CTR');

                         Parambyname('dataini').AsDate  := edtdataini.Date;
                         Parambyname('datafin').AsDate  := edtdatafin.Date;
                      end;
             end;

           2:begin 
                if trim(edtcod.Text) = '' then
                   begin 
                      AlertaCad('Digite o Código do Lançamento');
//                      edtcod.SetFocus;
                      exit;
                   end;

                if FrmConsLancReceber.Tag = 0 then
                   begin 
                      if (not CheckEmp.Checked) then
                         begin 
                            sql.Add(' WHERE C.COD_CTR = :CODCTR AND C.COD_EMP = :CODEMP ' +
                                    'ORDER BY COD_CTR, SEQUENCIA_CTR');
                            Parambyname('codemp').AsInteger:= iEmp;
                         end
                      else
                         sql.add(' WHERE C.COD_CTR = :CODCTR ' +
                                 'ORDER BY COD_CTR, SEQUENCIA_CTR');
                      Parambyname('codctr').AsInteger:= strtoint(edtcod.Text);
                   end
                else
                   if FrmConsLancReceber.Tag = 1 then
                      begin 
                         if (not CheckEmp.Checked) then
                            begin 
                               sql.Add(' WHERE C.COD_CTR = :CODCTR AND DTPAGTO_CTR IS NOT NULL ' +
                                       'AND C.COD_EMP = :CODEMP ' +
                                       'ORDER BY COD_CTR, SEQUENCIA_CTR');
                               Parambyname('codemp').AsInteger:= iEmp;
                            end
                         else
                            sql.add(' WHERE C.COD_CTR = :CODCTR AND DTPAGTO_CTR IS NOT NULL ' +
                                    'ORDER BY COD_CTR, SEQUENCIA_CTR');
                         Parambyname('codctr').AsInteger:= strtoint(EdtCod.Text);
                      end;
             end;

           3:begin 
                if FrmConsLancReceber.Tag = 0 then
                   begin 
                      if (not CheckEmp.Checked) then
                         begin 
                            sql.Add(' WHERE C.COD_CLI = :CODCLI AND ' +
                                    'C.DATA_CTR BETWEEN :DATAINI AND :DATAFIN AND ' +
                                    'C.COD_EMP = :CODEMP ' +
                                    'ORDER BY C.DATA_CTR, C.COD_CTR, SEQUENCIA_CTR');
                            Parambyname('codemp').AsInteger:= iEmp;
                         end
                      else
                         sql.Add(' WHERE C.COD_CLI = :CODCLI AND ' +
                                 'C.DATA_CTR BETWEEN :DATAINI AND :DATAFIN ' +
                                 'ORDER BY C.DATA_CTR, C.COD_CTR, SEQUENCIA_CTR');

                      Parambyname('codcli').AsInteger:= strtoint(EdtCodCli.Text);
                      Parambyname('dataini').AsDate  := edtdataini.Date;
                      Parambyname('datafin').AsDate  := edtdatafin.Date;
                   end
                else
                   if FrmConsLancReceber.Tag = 1 then
                      begin 
                         if (not CheckEmp.Checked) then
                            begin 
                               sql.Add(' WHERE C.COD_CLI = :CODCLI AND ' +
                                       'C.DATA_CTR BETWEEN :DATAINI AND :DATAFIN AND ' +
                                       'DTPAGTO_CTR IS NOT NULL AND C.COD_EMP = :CODEMP ' +
                                       'ORDER BY C.DATA_CTR, C.COD_CTR, SEQUENCIA_CTR');
                               Parambyname('codemp').AsInteger:= iEmp;
                            end
                         else
                            sql.Add(' WHERE C.COD_CLI = :CODCLI AND ' +
                                    'C.DATA_CTR BETWEEN :DATAINI AND :DATAFIN AND ' +
                                    'DTPAGTO_CTR IS NOT NULL ' +
                                    'ORDER BY C.DATA_CTR, C.COD_CTR, SEQUENCIA_CTR');

                         Parambyname('codcli').AsInteger:= strtoint(EdtCodCli.Text);   
                         Parambyname('dataini').AsDate  := edtdataini.Date;
                         Parambyname('datafin').AsDate  := edtdatafin.Date;
                      end;
             end;

           4:begin 
                if FrmConsLancReceber.Tag = 0 then
                   begin 
                      if (not CheckEmp.Checked) then
                         begin 
                            sql.Add(' WHERE C.NUMDOCUMENTO_CTR = ' + #39 + trim(EdtCod.Text) + #39 +
                                    ' AND C.COD_EMP = :CODEMP ' +
                                    ' ORDER BY C.DATA_CTR, C.COD_CTR, SEQUENCIA_CTR');
                            Parambyname('codemp').AsInteger:= iEmp;
                         end
                      else
                         sql.Add(' WHERE C.NUMDOCUMENTO_CTR = ' + #39 + trim(EdtCod.Text) + #39 +
                                 ' ORDER BY C.DATA_CTR, C.COD_CTR, SEQUENCIA_CTR');
                   end
                else
                   if FrmConsLancReceber.Tag = 1 then
                      begin 
                         if (not CheckEmp.Checked) then
                            begin 
                               sql.Add(' WHERE C.NUMDOCUMENTO_CTR = ' + #39 + trim(EdtCod.Text) + #39 + ' AND C.DTPAGTO_CTR IS NOT NULL ' +
                                       ' AND C.COD_EMP = :CODEMP ' +
                                       ' ORDER BY C.DATA_CTR, C.COD_CTR, SEQUENCIA_CTR');
                               Parambyname('codemp').AsInteger:= iEmp;
                            end
                         else
                            sql.Add(' WHERE C.NUMDOCUMENTO_CTR = ' + #39 + trim(EdtCod.Text) + #39 +
                                    ' AND C.DTPAGTO_CTR IS NOT NULL ' +
                                    ' ORDER BY C.DATA_CTR, C.COD_CTR, SEQUENCIA_CTR');
                      end;
             end;
         end;
         open;
         if recordcount > 0 then
            BtnLocalizar.Enabled:= true
         else
            BtnLocalizar.Enabled:= false;
      end;
   dbgrid1.SetFocus;
end;

procedure TFrmConsLancReceber.BtnLocalizarClick(Sender: TObject);
begin 
   if tag = 0 then
     begin 
        if not QConsReceberDTPAGTO_CTR.IsNull then
           begin 
              AlertaCad('Esta parcela está paga, ' + #13 +
                          'não pode ser alterada ou excluida');
              exit;
           end;
        BuscaFormulario( TFrmLancContasReceber, True );
        with FrmLancContasReceber do
           begin 
              tag:= 1;
              limpaedit(FrmLancContasReceber);
              ededit(FrmLancContasReceber, false);
              cod_ctr.Text       := QConsReceberCOD_CTR.AsString;
              edtseq.Text        := QConsReceberSEQUENCIA_CTR.AsString;
              edtdata.Text       := QConsReceberDATA_CTR.AsString;
              edtcodcli.Text     := QConsReceberCOD_CLI.AsString;
              edtnomecli.Text    := QConsReceberNOME_CLI.AsString;
              LCon.Caption       := '';
              EdtNumDoc.Text     := QConsReceberNUMDOCUMENTO_CTR.AsString;
              edtvalor.Text      := QConsReceberVALOR_CTR.AsString;
              EdtVenc.Text       := QConsReceberVENCTO_CTR.AsString;
              EdtObs.Text        := QConsReceberOBS_CTR.AsString;
              EdtCodCob.Text     := QConsReceberCOD_COB.AsString;
              EdtNomeCob.Text    := QConsReceberNOME_COB.AsString;
              EdtParcela.Text    := QConsReceberPARCELA_CTR.AsString;
              EdtDevol.Text      := QConsReceberDEVOLUCAO_CTR.AsString;
              EdtCodClassif.Text := QConsReceberCODIGO_CLASSIFICACAO.AsString;
              EdtNomeClassif.Text:= QConsReceberDESCRICAO.AsString;
              EdtTotal.Text      := currtostr(QConsReceberVALOR_CTR.value - QConsReceberDEVOLUCAO_CTR.value);
              FormShow(sender);
              show;
           end;
        close;
     end
   else
      if tag = 1 then //cancelamento
         begin 
            Application.CreateForm(TFrmCancelaRecebimento, FrmCancelaRecebimento);
            with FrmCancelaRecebimento do
               begin 
                  EdtCod.Text        := QConsReceberCOD_CTR.AsString;
                  edtseq.text        := QConsReceberSEQUENCIA_CTR.AsString;
                  EdtEmissao.Text    := QConsReceberDATA_CTR.AsString;
                  EdtVenc.Text       := QConsReceberVENCTO_CTR.AsString;
                  edtreceb.text      := QConsReceberDTPAGTO_CTR.AsString;
                  EdtDoc.Text        := QConsReceberNUMDOCUMENTO_CTR.Value;
                  EdtValorBruto.Text := QConsReceberVALOR_CTR.AsString;
                  EdtValorRec.Text   := QConsReceberVLRPAGO_CTR.AsString;
                  EdtCodCli.Text     := QConsReceberCOD_CLI.AsString;
                  edtnomecli.Text    := QConsReceberNOME_CLI.Value;
                  showmodal;
               end;
         end;
end;

procedure TFrmConsLancReceber.EdtCodCliExit(Sender: TObject);
begin 
   if (btnsair.Focused) or (combocons.Focused) then
      exit;
   EdtNomeCli.Text := consulta('cliente', EdtCodCli, 'cod_cli', 'nome_cli', dm.IBTransaction, dm.qConsulta);
   if EdtNomeCli.Text = '' then
      begin 
         AlertaCad('Cliente não Cadastrado');
//         EdtCod.SetFocus;
      end;
end;

procedure TFrmConsLancReceber.EdtCodCliKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsCli.Click;
end;

procedure TFrmConsLancReceber.EdtCodCliEnter(Sender: TObject);
begin 
   EdtCod.SelectAll;
end;

end.
