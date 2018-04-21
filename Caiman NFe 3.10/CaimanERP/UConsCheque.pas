unit UConsCheque;

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
  TFrmConsCheque = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    ComboCons: TComboBox;
    GB2: TGroupBox;
    BtnCons: TsSpeedButton;
    EdtCons: TEdit;
    edtcod: UNovosComponentes.TEdit;
    EdtNome: TEdit;
    BtnOk: TButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Ladepositar: TLabel;
    LDepositados: TLabel;
    Ldevolvidos: TLabel;
    LPagos: TLabel;
    Label6: TLabel;
    LTotal: TLabel;
    DBGrid1: TDBGrid;
    BtnLocalizar: TButton;
    BtnSair: TButton;
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
    QConsChequeNOME_BAN: TStringField;
    QConsChequeNOME_CONTA: TStringField;
    CheckEmp: TCheckBox;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    Label7: TLabel;
    QConsChequeCOD_EMP: TIntegerField;
    QConsChequeCOD_CTR: TIntegerField;
    QConsChequeCOD_VENDA: TIntegerField;
    QConsChequeDESTINO_CHE: TStringField;
    QConsChequeCOD_REPASSE: TIntegerField;
    QConsChequeSELECIONADO_CHE: TStringField;
    QConsChequeCOD_EMITENTE: TIntegerField;
    QConsChequeCLIENTE: TStringField;
    QConsChequeEMITENTE: TStringField;
    procedure BtnSairClick(Sender: TObject);
    procedure edtcodKeyPress(Sender: TObject; var Key: Char);
    procedure edtcodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcodExit(Sender: TObject);
    procedure BtnConsClick(Sender: TObject);
    procedure ComboConsChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcodEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsCheque: TFrmConsCheque;

implementation
uses
  Udm, Ubibli1, UCadCheque, UConsCli, UConsBanco, UNovoPrincipal;
var sSql : string;

{$R *.dfm}

procedure TFrmConsCheque.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsCheque.edtcodKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmConsCheque.edtcodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      begin 
         if combocons.ItemIndex = 1 then
            begin 
               Application.CreateForm(TFrmConsCli, FrmConscli);
               FrmConsCli.Tag:= 2;
               FrmConsCli.ShowModal;
            end
         else
            if combocons.ItemIndex = 3 then
               begin 
                  Application.CreateForm(TFrmConsBanco, FrmConsBanco);
                  FrmConsBanco.Tag:= 2;
                  FrmConsBanco.ShowModal;
               end;
      end;
end;

procedure TFrmConsCheque.edtcodExit(Sender: TObject);
begin 
   if (btnsair.Focused) or (combocons.Focused) then
      exit;
   case combocons.ItemIndex of
    1: begin 
            edtnome.Text:= consulta('cliente', edtcod, 'cod_cli', 'nome_cli', dm.IBTransaction, dm.qConsulta);
            if edtnome.Text = '' then
               begin 
                  AlertaCad('Cliente não Cadastrado');
//                  edtcod.SetFocus;
               end;
         end;
    2:   begin 
            edtnome.Text:= consulta('banco', edtcod, 'cod_ban', 'nome_ban', dm.IBTransaction, dm.qConsulta);
            if edtnome.Text = '' then
               begin 
                  AlertaCad('Banco não Cadastrado');
//                  edtcod.SetFocus;
               end;
         end;
   end;
end;

procedure TFrmConsCheque.BtnConsClick(Sender: TObject);
begin 
   case combocons.ItemIndex of
    1: begin 
            Application.CreateForm(TFrmConsCli, FrmConsCli);
            FrmConsCli.tag:= 2;
            FrmConsCli.ShowModal;
         end;
    2:   begin 
            Application.CreateForm(TFrmConsBanco, FrmConsBanco);
            FrmConsBanco.tag:= 2;
            FrmConsBanco.ShowModal;
         end;
   end;
end;

procedure TFrmConsCheque.ComboConsChange(Sender: TObject);
begin 
   case combocons.ItemIndex of
    0:begin 
         gb2.Caption          := 'Código';
         edtcod.Visible       := false;
         btncons.Visible      := false;
         edtnome.Visible      := false;
         edtdataini.Visible   := false;
         edtdatafin.Visible   := false;
         label7.Visible       := false;
         edtcons.Visible      := true;
         edtcons.Clear;
      end;
    1:begin 
         gb2.Caption       := 'Cliente';
         edtcod.Visible       := true;
         btncons.Visible      := true;
         edtnome.Visible      := true;
         edtdataini.Visible   := false;
         edtdatafin.Visible   := false;
         label7.Visible       := false;
         edtcons.Visible      := false;
         edtcod.Clear;
         edtnome.Clear;
      end;
    2:begin 
        gb2.Caption          := 'Banco';
        edtcod.Visible       := true;
        btncons.Visible      := true;
        edtnome.Visible      := true;
        edtdataini.Visible   := false;
        edtdatafin.Visible   := false;
        label7.Visible       := false;
        edtcons.Visible      := false;
        edtcod.Clear;
        edtnome.Clear;
      end;
    3:begin 
         gb2.Caption          := 'Emissão';
         edtcod.Visible       := false;
         btncons.Visible      := false;
         edtnome.Visible      := false;
         edtdataini.Visible   := true;
         edtdatafin.Visible   := true;
         label7.Visible       := true;
         edtcons.Visible      := false;
         edtdataini.Date      := date;
         edtdatafin.Date      := date;
      end;
    4:begin 
         gb2.Caption          := 'Vencimento';
         edtcod.Visible       := false;
         btncons.Visible      := false;
         edtnome.Visible      := false;
         edtdataini.Visible   := true;
         edtdatafin.Visible   := true;
         label7.Visible       := true;
         edtcons.Visible      := false;
         edtdataini.Date      := date;
         edtdatafin.Date      := date;
      end;
    5:begin 
         gb2.Caption          := 'Número do Cheque';
         edtcod.Visible       := false;
         btncons.Visible      := false;
         edtnome.Visible      := false;
         edtdataini.Visible   := false;
         edtdatafin.Visible   := false;
         label7.Visible       := false;
         edtcons.Visible      := true;
         edtcons.Clear;
      end;
    end;
end;

procedure TFrmConsCheque.FormShow(Sender: TObject);
begin 
   {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsCheque.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;

   Ladepositar.Caption := '0,00';
   LDepositados.Caption:= '0,00';
   Ldevolvidos.Caption := '0,00';
   LPagos.Caption      := '0,00';
   LTotal.Caption      := '0,00';
   comboconschange(sender);
   sSql:= QConsCheque.SQL.Text;
end;

procedure TFrmConsCheque.BtnOkClick(Sender: TObject);
var caDepositar, cDepositado, cDevedor, cPago : currency;
begin 
   caDepositar := 0;
   cDepositado := 0;
   cDevedor    := 0;
   cPago       := 0;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsCheque do
      begin 
         close;
         sql.clear;
         sql.Text:= sSql;
         case combocons.ItemIndex of
          0:begin  //código
               if edtcons.Text = '' then
                  begin 
                     if (not CheckEmp.Checked) then
                        begin 
                           sql.Add(' WHERE C.COD_EMP = :CODEMP ORDER BY C.COD_CHE');
                           Parambyname('codemp').AsInteger:= iEmp;
                        end
                     else
                        sql.add(' ORDER BY C.COD_CHE');
                  end
               else
                  begin 
                     if (not CheckEmp.Checked) then
                        begin 
                           sql.Add(' WHERE C.COD_CHE = :CODCHE AND C.COD_EMP = :CODEMP');
                           Parambyname('codemp').AsInteger:= iEmp;
                        end
                     else
                        sql.Add(' WHERE C.COD_CHE = :CODCHE');
                     parambyname('codche').AsInteger:= strtoint(edtcons.Text);
                   end;
            end;
          1:begin  //Cliente
               if (not CheckEmp.Checked) then
                   begin 
                      sql.Add(' WHERE C.COD_CLI = :CODCLI OR C.COD_EMITENTE = :CODEMI ' +
                              ' AND C.COD_EMP = :CODEMP ORDER BY C.COD_CHE');
                      Parambyname('codemp').AsInteger:= iEmp;
                   end
               else
                  sql.Add(' WHERE C.COD_CLI = :CODCLI OR C.COD_EMITENTE = :CODEMI ' +
                          ' ORDER BY C.COD_CHE');
               Parambyname('codcli').AsInteger:= strtoint(edtcod.Text);
               Parambyname('codemi').AsInteger:= strtoint(edtcod.Text);
            end;
          2:begin  //Banco
               if (not CheckEmp.Checked) then
                  begin 
                   sql.Add(' WHERE C.COD_BANCO = :CODBAN AND C.COD_EMP = :CODEMP ORDER BY C.COD_CHE');
                   Parambyname('codemp').AsInteger:= iEmp;
                  end
               else
                   sql.add(' WHERE C.COD_BANCO = :CODBAN ORDER BY C.COD_CHE');
               Parambyname('codban').AsInteger:= strtoint(edtcod.Text);
            end;
          3:begin  //Data emissão
               if (not CheckEmp.Checked) then
                  begin 
                     sql.add(' WHERE C.EMISSAO_CHE BETWEEN :DATAINI AND :DATAFIN AND ' +
                             ' C.COD_EMP = :CODEMP ORDER BY C.EMISSAO_CHE, C.COD_CHE');
                     Parambyname('codemp').AsInteger:= iEmp;
                  end
               else
                  sql.add(' WHERE C.EMISSAO_CHE BETWEEN :DATAINI AND :DATAFIN ORDER BY C.EMISSAO_CHE, C.COD_CHE');
               Parambyname('dataini').AsDate := edtdataini.Date;
               Parambyname('datafin').AsDate := EdtDataFin.Date;
            end;
          4:begin  //data vencimento
               if (not CheckEmp.Checked) then
                  begin 
                     sql.add(' WHERE C.VENCTO_CHE BETWEEN :DATAINI AND :DATAFIN AND ' +
                             'C.COD_EMP = :CODEMP ORDER BY C.VENCTO_CHE, C.COD_CHE');
                     Parambyname('codemp').AsInteger:= iEmp;
                  end
               else
                   sql.add(' WHERE C.VENCTO_CHE BETWEEN :DATAINI AND :DATAFIN ORDER BY C.VENCTO_CHE, C.COD_CHE');
               Parambyname('dataini').AsDate := edtdataini.Date;
               Parambyname('datafin').AsDate := EdtDataFin.Date;
            end;
          5:begin  //numero do cheque
               if (not CheckEmp.Checked) then
                  begin 
                     sql.Add(' WHERE C.NUMERO_CHE = ' + #39 + edtcons.Text + #39 + ' AND C.COD_EMP = :CODEMP');
                     Parambyname('codemp').AsInteger:= iEmp;
                  end
               else
                   sql.Add(' WHERE C.NUMERO_CHE = ' + #39 + edtcons.Text + #39);
            end;
         end;
         Open;

         if not QConsChequeCOD_CHE.IsNull then
            begin 
               btnlocalizar.Enabled:= true;
               first;
               while not eof do
                 begin 
                    if QConsChequePRIDEP_CHE.IsNull then
                       caDepositar:= caDepositar + QConsChequeVALOR_CHE.AsCurrency
                    else
                       if (not QConsChequePRIDEP_CHE.IsNull and QConsChequePRIDEV_CHE.IsNull) or (not QConsChequeSEGDEP_CHE.IsNull and QConsChequeSEGDEV_CHE.IsNull) then
                           cDepositado:= cDepositado + QConsChequeVALOR_CHE.AsCurrency
                       else
                          if not QConsChequePAGTODEV_CHE.IsNull then
                             cPago:= cPago + QConsChequeVALOR_CHE.AsCurrency
                          else
                             cDevedor:= cDevedor + QConsChequeVALOR_CHE.AsCurrency;
                    next;
                 end;
               first;
               Ladepositar.Caption   := currtostrf(caDepositar, ffnumber, 2);
               LDepositados.Caption  := currtostrf(cDepositado, ffnumber, 2);
               Ldevolvidos.Caption   := currtostrf(cDevedor, ffnumber, 2);
               LPagos.Caption        := currtostrf(cPago, ffnumber, 2);
               LTotal.Caption        := currtostrf(caDepositar + cDepositado + cDevedor + cPago, ffnumber, 2);
               btnlocalizar.Enabled:= true;
               dbgrid1.SetFocus;
            end
         else
            begin 
               btnlocalizar.Enabled:= false;
               Ladepositar.Caption   := '0,00';
               LDepositados.Caption  := '0,00';
               Ldevolvidos.Caption   := '0,00';
               LPagos.Caption        := '0,00';
               LTotal.Caption        := '0,00';
            end;
      end;
end;

procedure TFrmConsCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QConsCheque.SQL.Clear;
   QConsCheque.SQL.Text:= sSql;
   QConsCheque.Close;

   {grava a posicao do combo}
   dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsCheque.ComboCons', inttostr(ComboCons.itemIndex));
   Action:= caFree;
end;

procedure TFrmConsCheque.BtnLocalizarClick(Sender: TObject);
begin 
   if tag = 0 then //form de cadastro de Cheque
     begin
        BuscaFormulario( TFrmCadCheque, True );
        with FrmCadCheque do
           begin 
              ededit(FrmCadCheque, false);
              limpaedit(FrmCadCheque);
              cod_che.Text         := QConsChequeCOD_CHE.AsString;
              EdtCodCliente.Text   := QConsChequeCOD_CLI.AsString;
              edtnomecli.Text      := QConsChequeCLIENTE.AsString;
              EdtCodBanco.Text     := QConsChequeCOD_BANCO.AsString;
              EdtNomeBanco.Text    := QConsChequeNOME_BAN.AsString;
              EdtAgencia.Text      := QConsChequeAGENCIA_CHE.Value;
              EdtConta.Text        := QConsChequeCONTA_CHE.AsString;
              EdtNumero.Text       := QConsChequeNUMERO_CHE.AsString;
              EdtDataEmi.Text      := QConsChequeEMISSAO_CHE.AsString;
              EdtDataVenc.Text     := QConsChequeVENCTO_CHE.AsString;
              EdtValor.Text        := QConsChequeVALOR_CHE.AsString;
              EdtObs.Text          := QConsChequeOBS_CHE.AsString;
              EdtCodConta.Text     := QConsChequeCOD_CONTA.AsString;
              EdtNomeConta.Text    := QConsChequeNOME_CONTA.AsString;
              EdtPriDep.Text       := QConsChequePRIDEP_CHE.AsString;
              EdtPriDev.Text       := QConsChequePRIDEV_CHE.AsString;
              EdtSegDep.Text       := QConsChequeSEGDEP_CHE.AsString;
              EdtSegDev.Text       := QConsChequeSEGDEV_CHE.AsString;
              EdtPagtoDev.Text     := QConsChequePAGTODEV_CHE.AsString;
              EdtDestino.Text      := QConsChequeDESTINO_CHE.AsString;
              EdtCodEmitente.Text  := QConsChequeCOD_EMITENTE.AsString;
              EdtNomeEmitente.Text := QConsChequeEMITENTE.AsString;
              FrmConsCheque.close;
              Tag:= 1;
              FormShow(sender);
              Show;
           end;
     end;
end;

procedure TFrmConsCheque.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsCheque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      btnsair.Click;
end;

procedure TFrmConsCheque.edtcodEnter(Sender: TObject);
begin 
   edtcod.SelectAll;
end;

end.
