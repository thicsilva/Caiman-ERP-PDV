unit UConsCTRAdm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmConsCTRAdm = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    ComboCons: TComboBox;
    GB3: TGroupBox;
    BtnCons: TsSpeedButton;
    EdtCod: UNovosComponentes.TEdit;
    EdtNome: TEdit;
    EdtCons: UNovosComponentes.TEdit;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    BtnOk: TButton;
    BtnSair: TButton;
    CheckEmp: TCheckBox;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    BtnLocalizar: TButton;
    StatusBar2: TStatusBar;
    QConsRecAdm: TFDQuery;
    DSQConsRecAdm: TDataSource;
    QConsRecAdmCODIGO: TIntegerField;
    QConsRecAdmCODIGO_BANDEIRA: TIntegerField;
    QConsRecAdmDOCUMENTO: TStringField;
    QConsRecAdmEMISSAO: TDateField;
    QConsRecAdmVENCIMENTO: TDateField;
    QConsRecAdmDATA_PAGAMENTO: TDateField;
    QConsRecAdmCOD_CAI: TIntegerField;
    QConsRecAdmCOD_EMP: TIntegerField;
    QConsRecAdmCOD_VEN: TIntegerField;
    QConsRecAdmVALOR: TBCDField;
    QConsRecAdmVALOR_PAGO: TBCDField;
    QConsRecAdmACRESCIMO: TBCDField;
    QConsRecAdmDESCONTO: TBCDField;
    QConsRecAdmTAXA: TBCDField;
    QConsRecAdmLIQUIDO: TBCDField;
    QConsRecAdmADMINISTRADORA: TStringField;
    QConsRecAdmBANDEIRA: TStringField;
    ComboBandeira: TComboBox;
    QConsRecAdmTIPO_CARTAO: TStringField;
    QConsRecAdmCALC_TIPO: TStringField;
    QConsRecAdmCODIGO_ADMINISTRADORA: TIntegerField;
    QConsRecAdmCODIGO_DUPLICATA: TIntegerField;
    QConsRecAdmCOD_CLI: TIntegerField;
    QConsRecAdmNOME_CLI: TStringField;
    QConsRecAdmPARCELA: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure ComboConsChange(Sender: TObject);
    procedure EdtConsKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodExit(Sender: TObject);
    procedure EdtCodEnter(Sender: TObject);
    procedure EdtCodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure QConsRecAdmCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsCTRAdm: TFrmConsCTRAdm;

implementation
uses
  Udm, Ubibli1, UConsAdmCartaoCredito, ULancCTRAdm, UConsCli, UNovoPrincipal;
var  sSql : string;

{$R *.dfm}

procedure TFrmConsCTRAdm.FormShow(Sender: TObject);
begin 
   sSql:= QConsRecAdm.SQL.Text;
   CheckEmp.Checked    := true;
   combocons.ItemIndex := 0;
   comboconschange(sender);
end;

procedure TFrmConsCTRAdm.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsCTRAdm.ComboConsChange(Sender: TObject);
begin 
   case ComboCons.ItemIndex of
    0:begin 
         gb2.Enabled          := true;
         gb2.Caption          := 'Data de Emissão';
         edtcons.Visible      := true;
         ComboBandeira.Visible:= false;
         EdtCod.Visible       := false;
         BtnCons.Visible      := false;
         EdtNome.Visible      := false;
         gb3.Caption          := '';
         gb3.Enabled          := false;
         edtdataini.Date      := date;
         edtdatafin.Date      := date;
         edtdataini.SetFocus;
      end;
    1:begin 
         gb2.Enabled          := true;
         gb2.Caption          := 'Data de Vencimento';
         edtcons.Visible      := true;
         ComboBandeira.Visible:= false;
         EdtCod.Visible       := false;
         BtnCons.Visible      := false;
         EdtNome.Visible      := false;
         gb3.Caption          := '';
         gb3.Enabled          := false;
         edtdataini.Date      := date;
         edtdatafin.Date      := date;
         edtdataini.SetFocus;
      end;
    2:begin 
         gb2.Enabled          := false;
         gb3.Enabled          := true;
         gb3.Caption          := 'Código';
         edtcons.Visible      := true;
         ComboBandeira.Visible:= false;
         EdtCod.Visible       := false;
         BtnCons.Visible      := false;
         EdtNome.Visible      := false;
         edtcons.Clear;
         edtcons.SetFocus;
      end;
    3:begin 
         gb2.Enabled          := true;
         gb3.Enabled          := true;
         gb3.Caption          := 'Administradora/Bandeira';
         edtCons.Visible      := false;
         ComboBandeira.Visible:= true;
         EdtCod.Visible       := true;
         BtnCons.Visible      := true;
         EdtNome.Visible      := true;
         EdtCod.Clear;
         EdtNome.Clear;
         edtdataini.Date    := date;
         edtdatafin.Date    := date;
         EdtCod.SetFocus;
      end;
    4:begin 
         gb2.Enabled          := true;
         gb3.Enabled          := true;
         gb3.Caption          := 'Cliente';
         edtCons.Visible      := false;
         ComboBandeira.Visible:= false;
         EdtCod.Visible       := true;
         BtnCons.Visible      := true;
         EdtNome.Visible      := true;
         EdtCod.Clear;
         EdtNome.Clear;
         edtdataini.Date    := date;
         edtdatafin.Date    := date;
         EdtCod.SetFocus;
      end;
   end;
end;

procedure TFrmConsCTRAdm.EdtConsKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmConsCTRAdm.BtnConsClick(Sender: TObject);
begin 
   case ComboCons.ItemIndex of
    3: begin 
          Application.CreateForm(TFrmConsAdmCartaoCredito, FrmConsAdmCartaoCredito);
          FrmConsAdmCartaoCredito.Tag:= 5;
          FrmConsAdmCartaoCredito.ShowModal;
       end;
    4: begin 
          Application.CreateForm(TFrmConsCli, FrmConsCli);
          FrmConsCli.Tag:= 42;
          FrmConsCLi.ShowModal;
       end;
   end;
end;

procedure TFrmConsCTRAdm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;

   QConsRecAdm.SQL.Clear;
   QConsRecAdm.sql.Text:= sSql;
   QConsRecAdm.Close;
   Action:= caFree;
end;

procedure TFrmConsCTRAdm.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsCTRAdm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmConsCTRAdm.EdtCodExit(Sender: TObject);
begin 
   if (btnsair.Focused) or (combocons.Focused) then
      exit;

   if trim(EdtCod.Text) = '' then
      exit;

   case ComboCons.ItemIndex of
     3: begin 
           EdtNome.Text:= dm.RetornaStringTabela('descricao', 'administradora_cartao', 'codigo', strtoint(EdtCod.Text));
           if trim(EdtNome.Text) = '' then
              begin 
                 AlertaCad('Banceira não cadastrada');
//                 EdtCod.SetFocus;
              end;
        end;
     4: begin 
           EdtNome.Text:= dm.RetornaStringTabela('nome_cli', 'cliente', 'cod_cli', strtoint(EdtCod.Text));
           if trim(EdtNome.Text) = '' then
              begin 
                 AlertaCad('Cliente não cadastrado');
//                 EdtCod.SetFocus;
              end;
        end;
   end;
end;

procedure TFrmConsCTRAdm.EdtCodEnter(Sender: TObject);
begin 
   EdtCod.SelectAll;
end;

procedure TFrmConsCTRAdm.EdtCodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnCons.Click;
end;

procedure TFrmConsCTRAdm.BtnOkClick(Sender: TObject);
begin 
   if edtdatafin.Date < edtdataini.Date then
      begin 
         AlertaCad('A data final não pode ser menor que a data inicial');
         exit;
      end;
   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   dm.IBTRAux.StartTransaction;
   with QConsRecAdm do
      begin 
         close;
         sql.Clear;
         sql.Text:= sSql;
         case combocons.ItemIndex of
          0:begin 
               sql.Add(' WHERE C.EMISSAO BETWEEN :DATAINI AND :DATAFIN');

               if (not CheckEmp.Checked) then
                  begin 
                     sql.add(' AND C.COD_EMP = :CODEMP');
                     Parambyname('codemp').AsInteger:= iEmp;
                  end;

               if FrmConsCTRAdm.Tag = 1 then
                  sql.add(' AND C.DATA_PAGAMENTO IS NOT NULL');

               sql.add(' ORDER BY C.EMISSAO, C.CODIGO');
               Parambyname('dataini').AsDate  := edtdataini.Date;
               Parambyname('datafin').AsDate  := edtdatafin.Date;
            end;

          1:begin 
               sql.Add(' WHERE C.VENCIMENTO BETWEEN :DATAINI AND :DATAFIN');

               if (not CheckEmp.Checked) then
                  begin 
                     sql.add(' AND C.COD_EMP = :CODEMP');
                     Parambyname('codemp').AsInteger:= iEmp;
                  end;

               if FrmConsCTRAdm.Tag = 1 then
                  sql.add(' AND C.DATA_PAGAMENTO IS NOT NULL');

               sql.add(' ORDER BY C.VENCIMENTO, C.CODIGO');

               Parambyname('dataini').AsDate  := edtdataini.Date;
               Parambyname('datafin').AsDate  := edtdatafin.Date;
            end;

          2:begin 
               if trim(edtcons.Text) = '' then
                  begin 
                     AlertaCad('Digite o Código do Lançamento');
//                     edtcons.SetFocus;
                     exit;
                  end;

               sql.Add(' WHERE C.CODIGO = :COD');

               if (not CheckEmp.Checked) then
                  begin 
                     sql.add(' AND C.COD_EMP = :CODEMP');
                     Parambyname('codemp').AsInteger:= iEmp;
                  end;

               if FrmConsCTRAdm.Tag = 1 then
                  sql.Add(' AND C.DATA_PAGAMENTO IS NOT NULL ');

               sql.add(' ORDER BY C.CODIGO');
               Parambyname('cod').AsInteger:= strtoint(edtcons.Text);;
            end;

          3:begin 
               sql.Add(' WHERE C.CODIGO_BANDEIRA = :BANDEIRA AND ' +
                       ' B.CODIGO_ADMINISTRADORA = :ADM AND      ' +
                       ' C.EMISSAO BETWEEN :DATAINI AND :DATAFIN');

               if CheckEmp.Checked then
                  begin 
                     sql.add(' AND C.COD_EMP = :CODEMP');
                     Parambyname('codemp').AsInteger:= iEmp;
                  end;

               if FrmConsCTRAdm.Tag = 1 then
                  sql.Add(' AND C.DATA_PAGAMENTO IS NOT NULL ');

               sql.add(' ORDER BY C.EMISSAO, C.CODIGO');

               Parambyname('adm').AsInteger      := strtoint(EdtCod.Text);
               Parambyname('bandeira').AsInteger := strtoint(copy(ComboBandeira.Text, 1, 2));
               Parambyname('dataini').AsDate     := edtdataini.Date;
               Parambyname('datafin').AsDate     := edtdatafin.Date;
            end;

          4:begin 
               sql.Add(' WHERE C.COD_CLI = :CODCLI AND ' +
                       ' C.EMISSAO BETWEEN :DATAINI AND :DATAFIN');

               if CheckEmp.Checked then
                  begin 
                     sql.add(' AND C.COD_EMP = :CODEMP');
                     Parambyname('codemp').AsInteger:= iEmp;
                  end;

               if FrmConsCTRAdm.Tag = 1 then
                  sql.Add(' AND C.DATA_PAGAMENTO IS NOT NULL ');

               sql.add(' ORDER BY C.EMISSAO, C.CODIGO');

               Parambyname('codcli').AsInteger   := strtoint(EdtCod.Text);
               Parambyname('dataini').AsDate     := edtdataini.Date;
               Parambyname('datafin').AsDate     := edtdatafin.Date;
            end;
         end;
         open;
      end;

   dbgrid1.SetFocus;
end;

procedure TFrmConsCTRAdm.BtnLocalizarClick(Sender: TObject);
begin 
   if (QConsRecAdm.State = dsBrowse) and (QConsRecAdmCODIGO.AsInteger > 0) then
      begin 
         if tag = 0 then
           begin 
              if not QConsRecAdmDATA_PAGAMENTO.IsNull then
                 begin 
                    AlertaCad('Esta parcela está paga, ' + #13 +
                                'não pode ser alterada ou excluida');
                    exit;
                 end;
              BuscaFormulario( TFrmLancCTRADM, True );
              with FrmLancCTRADM do
                 begin 
                    tag:= 1;
                    limpaedit(FrmLancCTRADM);
                    ededit(FrmLancCTRADM, false);
                    EdtCodigo.Text        := QConsRecAdmCODIGO.AsString;
                    EdtEmissao.Text       := QConsRecAdmEMISSAO.AsString;
                    EdtNumDoc.Text        := QConsRecAdmDOCUMENTO.AsString;
                    EdtVenc.Text          := QConsRecAdmVENCIMENTO.AsString;
                    EdtValor.Text         := QConsRecAdmVALOR.AsString;
                    EdtTaxa.Text          := QConsRecAdmTAXA.AsString;
                    EdtCodBandeira.Text   := QConsRecAdmCODIGO_BANDEIRA.AsString;
                    EdtNomeBandeira.Text  := QConsRecAdmBANDEIRA.AsString;
                    EdtCodCli.Text        := QConsRecAdmCOD_CLI.AsString;
                    edtnomecli.Text       := QConsRecAdmNOME_CLI.AsString;
                    EdtParcela.Text       := QConsRecAdmPARCELA.AsString;

                    FormShow(sender);
                    show;
                 end;
              close;
           end
         else
            if tag = 1 then //cancelamento
               begin 
                 { Application.CreateForm(TFrmCancelaRecebimento, FrmCancelaRecebimento);
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
                     end; }
               end;
      end;
end;

procedure TFrmConsCTRAdm.QConsRecAdmCalcFields(DataSet: TDataSet);
begin 
   if trim(QConsRecAdmTIPO_CARTAO.AsString) = 'C' then
      QConsRecAdmCALC_TIPO.AsString:= 'CRÉDITO'
   else
   if trim(QConsRecAdmTIPO_CARTAO.AsString) = 'D' then
      QConsRecAdmCALC_TIPO.AsString:= 'DÉBITO'
   else
   if trim(QConsRecAdmTIPO_CARTAO.AsString) = 'A' then
      QConsRecAdmCALC_TIPO.AsString:= 'AMBOS'
   else
      QConsRecAdmCALC_TIPO.AsString:= '';
end;

end.


