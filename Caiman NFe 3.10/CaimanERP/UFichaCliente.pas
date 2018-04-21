unit UFichaCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmFichaCliente = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    EdtCodCli: UNovosComponentes.TEdit;
    BtnConsCli: TsSpeedButton;
    EdtNomeCli: TEdit;
    Label2: TLabel;
    BtnOk: TButton;
    BtnSair: TButton;
    CheckEmp: TCheckBox;
    Panel4: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBGVendas: TDBGrid;
    LSit: TLabel;
    LCD: TLabel;
    LSPC: TLabel;
    LCompras: TLabel;
    LAM: TLabel;
    LNC: TLabel;
    LRenda: TLabel;
    LPend: TLabel;
    LLimite: TLabel;
    LADep: TLabel;
    LChequeDev: TLabel;
    QPendencia: TFDQuery;
    QPendenciaVALOR_BRUTO: TBCDField;
    QPendenciaTAXA_JUROS: TBCDField;
    QPendenciaTOTAL: TCurrencyField;
    QCheque: TFDQuery;
    QChequeTOTAL_CHEQUES: TBCDField;
    QConsVendas: TFDQuery;
    QConsVendasCOD_VEN: TIntegerField;
    QConsVendasDATA_VEN: TDateField;
    QConsVendasCOD_TPV: TIntegerField;
    QConsVendasTOTAL_VEN: TBCDField;
    QConsVendasNOME_TPV: TStringField;
    IBTRVendas: TFDTransaction;
    DSQConsVendas: TDataSource;
    BtnPrest: TBitBtn;
    DBGPrest: TDBGrid;
    QConsPrest: TFDQuery;
    DSQConsPrest: TDataSource;
    QConsPrestCOD_CTR: TIntegerField;
    QConsPrestPARCELA_CTR: TIntegerField;
    QConsPrestSEQUENCIA_CTR: TIntegerField;
    QConsPrestVENCTO_CTR: TDateField;
    QConsPrestVALOR_CTR: TBCDField;
    QConsPrestVLRPAGO_CTR: TBCDField;
    QConsPrestDTPAGTO_CTR: TDateField;
    QConsPrestDESCONTO_CONCEDIDO_CTR: TBCDField;
    QConsPrestACRESCIMO_RECEBIDO_CTR: TBCDField;
    QConsPrestSTATUS: TStringField;
    BtnAvulsa: TBitBtn;
    BtnItens: TBitBtn;
    DBGItens: TDBGrid;
    QConsItens: TFDQuery;
    DSQConsItens: TDataSource;
    QConsItensORDEM: TIntegerField;
    QConsItensCOD_PRO: TIntegerField;
    QConsItensQUANT: TBCDField;
    QConsItensVALOR: TBCDField;
    QConsItensNOME_PRO: TStringField;
    QConsItensTOTAL: TCurrencyField;
    BtnCheques: TBitBtn;
    QConsCheque: TFDQuery;
    DSQConsCheque: TDataSource;
    DBGCheque: TDBGrid;
    QConsChequeAGENCIA_CHE: TStringField;
    QConsChequeCOD_CHE: TIntegerField;
    QConsChequeCONTA_CHE: TStringField;
    QConsChequeEMISSAO_CHE: TDateField;
    QConsChequeEMITENTE_CHE: TStringField;
    QConsChequeNUMERO_CHE: TStringField;
    QConsChequePAGTODEV_CHE: TDateField;
    QConsChequePRIDEP_CHE: TDateField;
    QConsChequePRIDEV_CHE: TDateField;
    QConsChequeSEGDEP_CHE: TDateField;
    QConsChequeSEGDEV_CHE: TDateField;
    QConsChequeVALOR_CHE: TBCDField;
    QConsChequeNOME_BAN: TStringField;
    QConsChequeVENCTO_CHE: TDateField;
    BtnCadastro: TBitBtn;
    QConsPrestDEVOLUCAO_CTR: TBCDField;
    QPendenciaDIAS_ATRASO: TBCDField;
    QPendenciaDIAS_CARENCIA: TIntegerField;
    QConsItensCANCELADO: TIntegerField;
    procedure EdtCodCliEnter(Sender: TObject);
    procedure EdtCodCliExit(Sender: TObject);
    procedure EdtCodCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodCliKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsCliClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure QPendenciaCalcFields(DataSet: TDataSet);
    procedure QConsPrestCalcFields(DataSet: TDataSet);
    procedure BtnPrestClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnItensClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QConsItensCalcFields(DataSet: TDataSet);
    procedure BtnChequesClick(Sender: TObject);
    procedure FechaGrid;
    procedure BtnAvulsaClick(Sender: TObject);
    procedure BtnCadastroClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFichaCliente: TFrmFichaCliente;

implementation
uses
  Udm, Ubibli1, UConsCli, UCadCli, UNovoPrincipal;
var  sSql     : string;
     iDiasNeg : integer;

{$R *.dfm}

procedure TFrmFichaCliente.FechaGrid;
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   if DBGPrest.Visible then
      begin 
         DBGPrest.Visible:= false;
         QConsPrest.Close;
      end;
   if DBGItens.Visible then
      begin 
         DBGItens.Visible:= false;
         QConsItens.Close;
      end;
   if DBGCheque.Visible then
      begin 
         DBGCheque.Visible:= false;
         QConsCheque.Close;
      end;
end;

procedure TFrmFichaCliente.EdtCodCliEnter(Sender: TObject);
begin 
   EdtCodCli.SelectAll;
end;

procedure TFrmFichaCliente.EdtCodCliExit(Sender: TObject);
begin 
   if btnsair.Focused then
      exit;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.Consulta do
          begin 
             close;
             sql.Clear;
             sql.add('SELECT NOME_CLI, LIMITE_CLI, BLOQUEADO_CLI, DATACADASTRO_CLI, RENDA_CLI, ' +
                     'DATA_CONSULTA_SPC ' +
                     'FROM CLIENTE WHERE COD_CLI = :CODCLI');
             Parambyname('codcli').AsInteger := strtoint(EdtCodCli.Text);
             ExecOrOpen;
             if recordcount > 0 then
                begin 
                   EdtNomeCli.Text  := fieldbyname('nome_cli').AsString;
                   LRenda.Caption   := FloatToStrF(fieldbyname('renda_cli').AsFloat, ffnumber, 15,2);
                   LLimite.Caption  := FloatToStrF(fieldbyname('limite_cli').AsFloat, ffnumber, 15,2);
                   LCD.caption      := fieldbyname('datacadastro_cli').AsString;
                   if fieldbyname('data_consulta_spc').IsNull then
                      lspc.Caption:= ''
                   else
                      LSPC.Caption:= fieldbyname('data_consulta_spc').AsString;
                   if fieldbyname('bloqueado_cli').AsString = 'S' then
                      begin 
                         LSit.Font.Color:= clRed;
                         lsit.caption   := 'BLOQUEADO';
                      end
                   else
                      begin 
                         LSit.Font.Color:= clNavy;
                         lsit.caption   := 'OK';
                      end;
                end
             else
                begin 
                   EdtNomeCli.Clear;
                   LLimite.Caption := '0,00';
                   LRenda.Caption  := '0,00';
                   LCD.Caption     := '';
                   AlertaCad('Cliente não Cadastrado');
//                   edtcodcli.SetFocus;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       EdtNomeCli.Clear;
       LLimite.Caption := '0,00';
       LRenda.Caption  := '0,00';
       LCD.Caption     := '';
     end;
   finally
     dm.Consulta.close;
   end;
end;

procedure TFrmFichaCliente.EdtCodCliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      btnconscli.Click;
end;

procedure TFrmFichaCliente.EdtCodCliKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmFichaCliente.BtnConsCliClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsCli, FrmConsCli);
   FrmConsCli.tag:= 21;
   FrmConsCli.showmodal;
end;

procedure TFrmFichaCliente.FormShow(Sender: TObject);
begin 
   sSql:= QConsVendas.SQL.text;
   { BUSCA OS DIAS PARA NEGATIVACAO }
   iDiasNeg:= DM.RetornaIntegerTabela('dias_negativacao', 'parametros', 'cod_emp', iEmp);

   FechaGrid;
   LSit.Caption       := '';
   LCD.Caption        := '';
   LSPC.Caption       := '';
   LCompras.Caption   := '';
   LAM.Caption        := '';
   Lnc.Caption        := '';
   LSit.Caption       := '';
   LRenda.Caption     := '0,00';
   LPend.Caption      := '0,00';
   LLimite.Caption    := '0,00';
   LADep.Caption      := '0,00';
   LChequeDev.Caption := '0,00';
end;

procedure TFrmFichaCliente.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmFichaCliente.BtnOkClick(Sender: TObject);
var cPendencia   : currency;
    cMediaAtraso : currency;
    cMaiorAtraso : currency;
    iAux         : integer;
begin 
   FechaGrid;
   if EdtCodCli.Text = '' then
      begin 
         AlertaCad('Digite o código do cliente');
//         EdtCodCli.setfocus;
         exit;
      end;

   { BUSCA AS PENDÊNCIAS DO CLIENTE }
   cPendencia   := 0;
   cMediaAtraso := 0;
   cMaiorAtraso := 0;
   iAux         := 0;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QPendencia do
          begin 
             close;
             Parambyname('codcli').AsInteger:= strtoint(EdtCodcli.Text);
             open;
             while not eof do
                begin 
                   inc(iAux);
                   cPendencia:= cPendencia + QPendenciaTOTAL.AsCurrency;
                   if QPendenciaDIAS_ATRASO.AsCurrency > 0 then
                      cMediaAtraso:= cMediaAtraso + QPendenciaDIAS_ATRASO.AsCurrency;
                   if QPendenciaDIAS_ATRASO.AsCurrency > cMaiorAtraso then
                      cMaiorAtraso:= QPendenciaDIAS_ATRASO.AsCurrency;
                   next;
                end;
             LPend.Caption:= currtostrf(cPendencia, ffnumber, 2);
             if iAux > 0 then
                lam.Caption:= inttostr(trunc((cMediaAtraso / iAux)))
             else
                lam.Caption:= '0';
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar os dados do cliente');
     end;
   finally
     QPendencia.Close;
   end;

   if not (trim(LSit.Caption) = 'BLOQUEADO') then
      begin 
         if cPendencia > 0 then
            begin 
               lsit.Font.Color:= clNavy;
               lsit.Caption:= 'PENDENTE';
            end;
      end;

   { Verifica se está NEGATIVADO }
   if not (trim(LSit.Caption) = 'BLOQUEADO') then
      begin 
         if cMaiorAtraso > 0 then
            begin 
               lsit.Font.Color:= clNavy;
               lsit.Caption:= 'ATRASADO';
            end;
         if cMaiorAtraso > iDiasNeg then
            begin 
               lsit.Font.Color:= clRed;
               lsit.Caption:= 'NEGATIVADO';
            end;
      end;

   { BUSCA A QTD DE CHEQUES }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.Consulta do
          begin 
             close;
             sql.Clear;
             sql.Add('SELECT COUNT(COD_CHE) QTDCHEQUES ' +
                     'FROM CHEQUE ' +
                     'WHERE COD_CLI = :CODCLI');
             if (not CheckEmp.Checked) then
                begin 
                   sql.Add(' AND COD_EMP = :CODEMP');
                   Parambyname('codemp').AsInteger:= iEmp;
                end;
             Parambyname('codcli').AsInteger := StrToInt(EdtCodCli.text);
             ExecOrOpen;
             LNC.Caption:= fieldbyname('QTDCHEQUES').AsString;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar a quantidade de cheques do cliente');
     end;
   finally
     dm.Consulta.Close;
   end;

   { CHEQUES(SALDO DEVEDOR) }
   //tipo 1
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QCheque do
          begin 
             close;
             Parambyname('codcli').Value:= EdtCodcli.Text;
             Parambyname('tipo').Value:= 1;
             open;
             LADep.Caption:= floattostrf(QChequeTOTAL_CHEQUES.AsFloat, ffnumber, 15,2);
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar o dados dos cheques');
     end;
   finally
     QCheque.Close;
   end;

   { CHEQUES(SALDO DEVEDOR) }
   //tipo 2
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QCheque do
          begin 
             close;
             Parambyname('codcli').Value:= EdtCodcli.Text;
             Parambyname('tipo').Value:= 2;
             open;
             LChequeDev.Caption:= floattostrf(QChequeTOTAL_CHEQUES.AsCurrency, ffnumber, 15,2);
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar o dados dos cheques');
     end;
   finally
     QCheque.Close;
   end;

   { BUSCA AS VENDAS }
   if IBTRVendas.Active then
      IBTRVendas.Commit;
   IBTRVendas.StartTransaction;
   with QConsVendas do
      begin 
         close;
         sql.Clear;
         sql.Text:= sSql;
         if (not CheckEmp.Checked) then
             begin 
                sql.Add(' AND COD_EMP = :CODEMP');
                Parambyname('codemp').AsInteger:= iEmp;
             end;
         sql.Add(' ORDER BY V.DATA_VEN');
         Parambyname('codcli').AsInteger:= strtoint(EdtCodCli.text);
         open;
         Last;
         LCompras.Caption:= inttostr(recordcount);
         First;
      end;
end;

procedure TFrmFichaCliente.QPendenciaCalcFields(DataSet: TDataSet);
begin 
   if QPendenciaDIAS_ATRASO.AsCurrency > QPendenciaDIAS_CARENCIA.AsInteger then
      QPendenciaTOTAL.AsCurrency:= QPendenciaVALOR_BRUTO.value + ((QPendenciaVALOR_BRUTO.Value * (QPendenciaDIAS_ATRASO.Value *
                                  (QPendenciaTAXA_JUROS.Value / 30))) / 100)
   else
      QPendenciaTOTAL.AsCurrency:= QPendenciaVALOR_BRUTO.AsCurrency;
end;

procedure TFrmFichaCliente.QConsPrestCalcFields(DataSet: TDataSet);
var vl_dif : real;
begin 
   if not QConsPrestDTPAGTO_CTR.IsNull then
      begin 
         vl_dif:= QConsPrestDTPAGTO_CTR.value - QConsPrestVENCTO_CTR.value;
         if vl_dif > 0 then
            QConsPrestSTATUS.Value:= 'Pg. c/atraso de ' + floattostr(vl_dif) + ' dias'
         else
            if vl_dif < 0 then
               QConsPrestSTATUS.Value:= 'Pg. adiantado ' + floattostr(vl_dif) + ' dias'
            else
               QConsPrestSTATUS.Value:= 'Pago no vencimento';
      end;
end;

procedure TFrmFichaCliente.BtnPrestClick(Sender: TObject);
begin 
   FechaGrid;
   DBGPrest.Visible:= true;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsPrest do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT COD_CTR, PARCELA_CTR, SEQUENCIA_CTR, VENCTO_CTR, VALOR_CTR, ' +
                 'VLRPAGO_CTR, DTPAGTO_CTR, DEVOLUCAO_CTR, DESCONTO_CONCEDIDO_CTR, ACRESCIMO_RECEBIDO_CTR ' +
                 'FROM CONTAS_RECEBER ' +
                 'WHERE COD_VENDA = :CODVEN ' +
                 'ORDER BY COD_CTR, SEQUENCIA_CTR');
         Parambyname('codven').AsInteger:= QConsVendasCOD_VEN.Value;
         open;
      end;
end;

procedure TFrmFichaCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         if DBGPrest.Visible then
            begin 
               DBGPrest.Visible:= false;
               QConsPrest.Close;
            end
         else
            if DBGItens.Visible then
               begin 
                  DBGItens.Visible:= false;
                  QConsItens.Close;
               end
            else
               if DBGCheque.Visible then
                  begin 
                     DBGCheque.Visible:= false;
                     QConsCheque.Close;
                  end
               else
                  close;
      end;
end;

procedure TFrmFichaCliente.BtnItensClick(Sender: TObject);
begin 
   FechaGrid;
   DBGItens.Visible:= true;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsItens do
      begin 
         close;
         Parambyname('codven').AsInteger:= QConsVendasCOD_VEN.AsInteger;
         open;
      end;
end;

procedure TFrmFichaCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   FechaGrid;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   if IBTRVendas.Active then
      IBTRVendas.Commit;
   QConsVendas.SQL.Clear;
   QConsVendas.SQL.Text:= sSql;
   QConsVendas.Close;
   Action:= caFree;
end;

procedure TFrmFichaCliente.QConsItensCalcFields(DataSet: TDataSet);
begin 
   QConsItensTOTAL.Value:= QConsItensQUANT.Value * QConsItensVALOR.Value;
end;

procedure TFrmFichaCliente.BtnChequesClick(Sender: TObject);
begin 
   FechaGrid;
   DBGCheque.Visible:= true;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsCheque do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT C.AGENCIA_CHE, C.COD_CHE, C.CONTA_CHE, C.EMISSAO_CHE, ' +
                 'C.EMITENTE_CHE, C.NUMERO_CHE, C.PAGTODEV_CHE, C.PRIDEP_CHE, ' +
                 'C.PRIDEV_CHE, C.SEGDEP_CHE, C.SEGDEV_CHE, C.VALOR_CHE, C.VENCTO_CHE, ' +
                 'B.NOME_BAN ' +
                 'FROM CHEQUE C ' +
                 'INNER JOIN BANCO B ' +
                 'ON (C.COD_BANCO = B.COD_BAN) ' +
                 'WHERE C.COD_CLI = :CODCLI');
         if (not CheckEmp.Checked) then
             begin 
                sql.Add(' WHERE C.COD_EMP = :CODEMP');
                Parambyname('codemp').AsInteger:= iEmp;
             end;
         sql.Add(' ORDER BY C.VENCTO_CHE');
         Parambyname('codcli').AsInteger := strtoint(EdtCodCli.Text);
         open;
      end;
end;

procedure TFrmFichaCliente.BtnAvulsaClick(Sender: TObject);
begin 
   FechaGrid;
   DBGPrest.Visible:= true;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsPrest do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT COD_CTR, PARCELA_CTR, SEQUENCIA_CTR, VENCTO_CTR, VALOR_CTR, ' +
                 'VLRPAGO_CTR, DTPAGTO_CTR, DEVOLUCAO_CTR, DESCONTO_CONCEDIDO_CTR, ' +
                 'ACRESCIMO_RECEBIDO_CTR ' +
                 'FROM CONTAS_RECEBER ' +
                 'WHERE COD_CLI = :CODCLI AND COD_VENDA IS NULL ' +
                 'ORDER BY DATA_CTR, COD_CTR, SEQUENCIA_CTR');
         Parambyname('codcli').AsInteger:= strtoint(edtcodcli.Text);
         open;
      end;
end;

procedure TFrmFichaCliente.BtnCadastroClick(Sender: TObject);
var i : integer;
    sAuxSql : string;
begin 
   FechaGrid;
   sAuxSql:= dm.QCli.SQL.text;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QCli do
      begin 
         close;
         sql.Clear;
         sql.Text:= sAuxSql;
         sql.Add(' WHERE C.COD_CLI = :CODCLI');
         Parambyname('codcli').AsInteger := strtoint(EdtCodCli.Text);
         open;
      end;
   BuscaFormulario( TFrmCadCli, True );
   with FrmCadCli do
      begin 
         tag:= 1;
         limpaedit(FrmCadCli);
         ededit(FrmCadCli, false);
         cod_cli.Text:= dm.QCliCOD_CLI.AsString;
         if trim(dm.QCliFJ_CLI.AsString) = 'F' then
            begin 
               ComboFJ.ItemIndex    := 0;
               label11.Caption      := 'CPF';
               label12.Caption      := 'Documento';
               edtcnpj.EditMask     := '999.999.999-99;1;_';
               label2.Caption       := 'Nome(*)';
               label43.Caption      := 'Apelido';
               edtprof.Enabled      := true;
               edtemp.Enabled       := true;
               edtpai.Enabled       := true;
               edtmae.Enabled       := true;
               edtrenda.Enabled     := true;
               EdtContato.Visible   := false;
               label45.Visible      := false;
               EdtFant.Width        := 473;
            end
         else
            begin 
               ComboFJ.ItemIndex    := 1;
               label11.Caption      := 'CNPJ';
               label12.Caption      := 'Insc.Estadual';
               edtcnpj.EditMask     := '99.999.999/9999-99;1;_';
               label2.Caption       := 'Razão Social(*)';
               label43.Caption      := 'Nome Fantasia';
               EdtNasc.Enabled      := false;
               edtprof.Enabled      := false;
               edtemp.Enabled       := false;
               edtpai.Enabled       := false;
               edtmae.Enabled       := false;
               edtrenda.Enabled     := false;
               EdtContato.Visible   := true;
               label45.Visible      := true;
               EdtFant.Width        := 233;
            end;
         edtnome.Text          := dm.QCliNOME_CLI.AsString;
         cod_cla.Text          := dm.QCliCOD_CLA.AsString;
         edtnomecla.Text       := dm.QCliNOME_CLA.AsString;
         edtendres.Text        := dm.QCliENDRES_CLI.AsString;
         edtbaires.Text        := dm.QCliBAIRES_CLI.AsString;
         edtcidres.Text        := dm.QCliCIDRES_CLI.AsString;
         for i:= 0 to 26 do
            begin 
               if comboestres.Items[i] = dm.QCliESTRES_CLI.AsString then
                  comboestres.ItemIndex:= i;
            end;
         edtcepres.Text        := dm.QCliCEPRES_CLI.AsString;
         edttelres.Text        := dm.QCliTELRES_CLI.AsString;
         edtendcom.Text        := dm.QCliENDCOM_CLI.AsString;
         edtbaicom.Text        := dm.QCliBAICOM_CLI.AsString;
         edtcidcom.Text        := dm.QCliCIDCOM_CLI.AsString;
         for i:= 0 to 26 do
            begin 
               if comboestcom.Items[i] = dm.QCliESTCOM_CLI.AsString then
                  comboestcom.ItemIndex:= i;
            end;
         edtcepcom.Text        := dm.QCliCEPCOM_CLI.AsString;
         edttelcom.Text        := dm.QCliTELCOM_CLI.AsString;
         edtcnpj.Text          := dm.QCliCNPJ_CLI.AsString;

         if trim(dm.QCliFJ_CLI.AsString) = 'F' then
            edtdoc.Text:= dm.QCliDOC_CLI.AsString
         else
            EdtDoc.Text:= dm.QCliINSC_ESTADUAL.AsString;

         edtpai.Text           := dm.QCliPAI_CLI.AsString;
         edtmae.Text           := dm.QCliMAE_CLI.AsString;
         edtconjuge.Text       := dm.QCliCONJUGE_CLI.AsString;
         if trim(dm.QCliESTCIVIL_CLI.AsString) = 'C' then
            ComboCivil.ItemIndex := 0
         else
            if trim(dm.QCliESTCIVIL_CLI.AsString) = 'S' then
               ComboCivil.ItemIndex:= 1
            else
               if trim(dm.QCliESTCIVIL_CLI.AsString) = 'O' then
                  ComboCivil.ItemIndex := 2
               else
                  combocivil.ItemIndex:= -1;
         edtrenda.Text         := dm.QCliRENDA_CLI.AsString;
         EdtLimiteCredito.Text := dm.QCliLIMITE_CLI.AsString;
         EdtLimiteCheque.Text  := dm.QCliLIMITE_CHEQUE.AsString;
         edtprof.Text          := dm.QCliPROFISSAO_CLI.AsString;
         edtemp.Text           := dm.QCliEMPRESA_TRAB_CLI.AsString;
         if trim(dm.QCliATIVO_CLI.AsString) = 'S' then
            RDGAtivo.ItemIndex := 0
         else
            RDGAtivo.ItemIndex := 1;

         EdtCodConvenio.Text   := dm.QCliCOD_CON.AsString;
         EdtNomeConvenio.Text  := dm.QCliNOME_CON.AsString;

         MemoObsVenda.Text     := dm.QCliOBS_VENDA.AsString;
         MemoObsDiversos.Text  := dm.QCliOBS_CLI.AsString;
         edtnasc.Text          := dm.QCliNASCIMENTO_CLI.AsString;
         edtdatacadastro.Date  := dm.QCliDATACADASTRO_CLI.Value;
         EdtAtrazoMaximo.Text  := dm.QCliATRAZO_MAXIMO_CLI.AsString;
         edtcel.Text           := dm.QCliCELULAR_CLI.AsString;
         if trim(dm.QCliIMP_SALDO_PENDENTE_CLI.AsString) = 'S' then
            CheckImpSaldo.Checked:= true
         else
            CheckImpSaldo.Checked:= false;

         if trim(dm.QCliTIPO_CREDITO_CLI.AsString) = 'DN' then
            ComboCredito.ItemIndex:= 0
         else
         if trim(dm.QCliTIPO_CREDITO_CLI.AsString) = 'PR' then
            ComboCredito.ItemIndex:= 1
         else
         if trim(dm.QCliTIPO_CREDITO_CLI.AsString) = 'CH' then
            ComboCredito.ItemIndex:= 2
         else
         if trim(dm.QCliTIPO_CREDITO_CLI.AsString) = 'PC' then
           ComboCredito.ItemIndex:= 3
         else
         if trim(dm.QCliTIPO_CREDITO_CLI.AsString) = 'BO' then
            ComboCredito.ItemIndex:= 4
         else
            ComboCredito.ItemIndex:= -1;

         EdtConsSPC.Text     := dm.QCliDATA_CONSULTA_SPC.AsString;
         EdtRegSPC.Text      := dm.QCliDATA_REGISTRO_SPC.AsString;
         EdtReabSPC.text     := dm.QCliDATA_REABILITACAO_SPC.AsString;
         EdtRendaConj.Text   := dm.QCliRENDA_CONJUGE.AsString;
         EdtTrabalhoConj.Text:= dm.QCliTRABALHO_CONJUGE.AsString;
         EdtProfConj.Text    := dm.QCliPROF_CONJUGE.AsString;
         EdtFant.Text        := dm.QCliNOME_FANTASIA.AsString;
         EdtPR.Text          := dm.QCliPONTO_REFERENCIA.AsString;
         EdtContato.Text     := dm.QCliCONTATO_CLI.AsString;
         if trim(dm.QCliCONTROLAR_LIMITE.AsString) = 'S' then
            CheckControlarLimite.Checked:= true
         else
            CheckControlarLimite.Checked:= false;
         EdtEndCob.Text      := dm.QCliENDCOB_CLI.AsString;
         EdtBaiCob.Text      := dm.QCliBAICOB_CLI.AsString;
         EdtCidCob.Text      := dm.QCliCIDCOB_CLI.AsString;

         for i:= 0 to 26 do
            begin 
               if ComboEstCob.Items[i] = dm.QCliESTCOB_CLI.AsString then
                  ComboEstCob.ItemIndex:= i;
            end;
         EdtCepCob.Text      := dm.QCliCEPCOB_CLI.AsString;
         EdtTelCob.Text      := dm.QCliTELCOB_CLI.AsString;
         if trim(dm.QCliBLOQUEADO_CLI.AsString) = 'S' then
            RdgBloqueado.ItemIndex := 0
         else
            RdgBloqueado.ItemIndex := 1;

         EdtIBGE.Text    := dm.qcliCODIGO_IBGE.AsString;
         EdtNumRes.Text  := dm.qcliNUMRES_CLI.AsString;
         EdtNumCom.Text  := dm.qcliNUMCOM_CLI.AsString;
         EdtNumCob.Text  := dm.qcliNUMCOB_CLI.AsString;
         EdtEmail.Text   := dm.QCliEMAIL_CLI.AsString;

         dm.IBTransaction.Commit;
         dm.QCli.SQL.Clear;
         dm.QCli.SQL.Text:= sAuxSql;
         dm.QCli.Close;

         FormShow(sender);
         showmodal;
      end;
end;

procedure TFrmFichaCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if key = #13 then
      begin 
         key:= #0;
         SelectNext(ActiveControl, true, true);
      end;
end;

procedure TFrmFichaCliente.DBGItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin 
   if QConsItensCANCELADO.AsInteger = 1 then
      begin 
         DBGItens.Canvas.Font.Color:= clRed;
         DBGItens.DefaultDrawDataCell(Rect, DBGItens.columns[datacol].field, State);
      end
end;

end.
