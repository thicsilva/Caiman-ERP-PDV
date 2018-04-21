unit UConsVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Grids, DBGrids, DB, 
  MatrixPrinter, RDprint, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmConsVendas = class(UNovoFormulario.TForm)
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
    BtnConsCli: TsSpeedButton;
    EdtCodCli: UNovosComponentes.TEdit;
    EdtNomeCli: TEdit;
    EdtCodigo: TEdit;
    CheckEmp: TCheckBox;
    BtnOK: TBitBtn;
    BtnSair: TBitBtn;
    DBGrid1: TDBGrid;
    BtnLocalizar: TButton;
    QConsVendas: TFDQuery;
    DSQConsVendas: TDataSource;
    IBTRConsVendas: TFDTransaction;
    BtnSegundaVia: TButton;
    QBuscaItens: TFDQuery;
    QBuscaItensNotaFiscal: TFDQuery;
    QinsItensNotaFiscal: TFDQuery;
    BtnItens: TButton;
    QBuscaDadosCliente: TFDQuery;
    QBuscaItensCOD_VEN: TIntegerField;
    QBuscaItensCOD_PRO: TIntegerField;
    QBuscaItensORDEM: TIntegerField;
    QBuscaItensDESCONTO: TBCDField;
    QBuscaItensCOD_EMP: TIntegerField;
    QBuscaItensQUANT: TBCDField;
    QBuscaItensVALOR: TBCDField;
    QBuscaItensVALOR_CUSTO: TBCDField;
    QBuscaItensNOME_PRO: TStringField;
    QBuscaItensCALC_TOTAL: TCurrencyField;
    RDprint: TRDprint;
    QBuscaItensPRODUTO_PROMOCAO: TStringField;
    QBuscaItensCANCELADO: TIntegerField;
    QConsVendasCOD_VEN: TIntegerField;
    QConsVendasDATA_VEN: TDateField;
    QConsVendasCOD_EMP: TIntegerField;
    QConsVendasCOD_CAI: TIntegerField;
    QConsVendasCOD_CLI: TIntegerField;
    QConsVendasDESCONTO_VEN: TBCDField;
    QConsVendasCOD_TPV: TIntegerField;
    QConsVendasTOTAL_VEN: TBCDField;
    QConsVendasCUPOM_FISCAL_VEN: TIntegerField;
    QConsVendasTOTAL_CUSTO_VEN: TBCDField;
    QConsVendasDATA_HORA_VEN: TSQLTimeStampField;
    QConsVendasDESC_PESSOA_AUTORIZADA: TStringField;
    QConsVendasCOD_NF: TIntegerField;
    QConsVendasCOD_USU: TIntegerField;
    QConsVendasCANCELADA_VEN: TIntegerField;
    QConsVendasCODIGO_PAF: TIntegerField;
    QConsVendasR04_CCF: TIntegerField;
    QConsVendasR04_NOME_CLIENTE: TStringField;
    QConsVendasR04_CNPJ_CLIENTE: TStringField;
    QConsVendasCOD_VEND: TIntegerField;
    QConsVendasSERIE_NOTA_FISCAL: TStringField;
    QConsVendasCODIFICACAO_FISCAL: TStringField;
    QConsVendasCER: TIntegerField;
    QConsVendasNOME_CLI: TStringField;
    QConsVendasNOME_TPV: TStringField;
    QConsVendasHORA: TTimeField;
    QConsVendasNOME_CON: TStringField;
    QBuscaItensVENDA_CANCELADA: TIntegerField;
    QBuscaItensCOD_VEND: TIntegerField;
    QBuscaItensCODIGO_BARRA_PRO: TStringField;
    QConsVendasNUMERO_NOTA_FISCAL: TIntegerField;
    QConsVendasNOME_USU: TStringField;
    QConsVendasNOME_VEND: TStringField;
    QBuscaItensSTATUS_EXPORTA: TIntegerField;
    QBuscaItensTOTAL: TFMTBCDField;
    QConsVendasCONSIGNADA: TStringField;
    Shape1: TShape;
    Label2: TLabel;
    QConsVendasIMPORTADO_NFE: TStringField;
    QConsVendasOBS: TStringField;
    Shape2: TShape;
    Label3: TLabel;
    procedure EdtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodCliExit(Sender: TObject);
    procedure BtnConsCliClick(Sender: TObject);
    procedure EdtCodCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboConsChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure EdtCodCliEnter(Sender: TObject);
    procedure BtnItensClick(Sender: TObject);
    procedure QBuscaItensCalcFields(DataSet: TDataSet);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnSegundaViaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsVendas: TFrmConsVendas;

implementation
uses
  Udm, Ubibli1, UConsCli, UVenda, UNotaFiscal, UItensVenda, UCTRDuplicata, 
  UDuplicataADM, ULancCTRAdm, UNovoPrincipal;

var sSql : string;
{$R *.dfm}

procedure TFrmConsVendas.EdtCodigoKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmConsVendas.EdtCodCliExit(Sender: TObject);
begin 
   if (combocons.Focused) or (btnsair.Focused) then
      exit;
   EdtNomeCli.Text:= consulta('cliente', EdtCodCli, 'cod_cli', 'nome_cli', dm.IBTransaction, dm.qConsulta);
   if EdtNomeCli.Text = '' then
      begin 
         AlertaCad('Cliente não Cadastrado');
//         EdtCodCli.SetFocus;
      end;
end;

procedure TFrmConsVendas.BtnConsCliClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsCli, FrmConsCli);
   FrmConsCli.tag:= 11;
   FrmConsCli.showmodal;
end;

procedure TFrmConsVendas.EdtCodCliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsCli.Click;
end;

procedure TFrmConsVendas.ComboConsChange(Sender: TObject);
begin 
   case ComboCons.ItemIndex of
     0: begin 
           gb3.Caption          := 'Código';
           gb2.Enabled          := false;
           gb3.Enabled          := true;
           EdtCodCli.Visible    := false;
           BtnConsCli.Visible   := false;
           EdtNomeCli.Visible   := false;
           EdtCodigo.Visible    := true;
           edtcodigo.Clear;
           edtcodigo.SetFocus;
        end;
     1: begin 
           gb2.Enabled:= true;
           gb3.Enabled:= false;
           edtdataini.SetFocus;
        end;
     2: begin 
           gb3.Enabled          := true;
           gb3.Caption          := 'Cliente';
           gb2.Enabled          := true;
           EdtCodCli.Visible    := true;
           BtnConsCli.Visible   := true;
           EdtNomeCli.Visible   := true;
           EdtCodigo.Visible    := false;
           EdtCodCli.Clear;
           EdtNomeCli.Clear;
           EdtCodCli.SetFocus;
        end;
     3: begin 
           gb3.Caption          := 'Cupom Fiscal';
           gb2.Enabled          := false;
           gb3.Enabled          := true;
           EdtCodCli.Visible    := false;
           BtnConsCli.Visible   := false;
           EdtNomeCli.Visible   := false;
           EdtCodigo.Visible    := true;
           edtcodigo.Clear;
           edtcodigo.SetFocus;
        end;
     4: begin 
           gb3.Caption          := 'CCF';
           gb2.Enabled          := false;
           gb3.Enabled          := true;
           EdtCodCli.Visible    := false;
           BtnConsCli.Visible   := false;
           EdtNomeCli.Visible   := false;
           EdtCodigo.Visible    := true;
           edtcodigo.Clear;
           edtcodigo.SetFocus;
        end;
     5: begin 
           gb3.Caption          := 'Nota Fiscal';
           gb2.Enabled          := false;
           gb3.Enabled          := true;
           EdtCodCli.Visible    := false;
           BtnConsCli.Visible   := false;
           EdtNomeCli.Visible   := false;
           EdtCodigo.Visible    := true;
           edtcodigo.Clear;
           edtcodigo.SetFocus;
        end;
   end;
end;

procedure TFrmConsVendas.FormShow(Sender: TObject);
begin 
   {busca a posicao do combo}
   try
     ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsVendas.ComboCons'));
   except
     ComboCons.ItemIndex:= 0;
   end;

   sSql               := QConsVendas.SQL.Text;
   edtdataini.Date    := date;
   edtdatafin.Date    := date;
   CheckEmp.Checked   := false;
   combocons.ItemIndex:= 1;
   ComboConsChange(sender);
end;

procedure TFrmConsVendas.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsVendas.BtnOKClick(Sender: TObject);
begin 
   if IBTRConsVendas.Active then
      IBTRConsVendas.Commit;
   IBTRConsVendas.StartTransaction;
   with QConsVendas do
      begin 
         close;
         sql.Clear;
         sql.Text:= sSql;
         case combocons.ItemIndex of
           0: begin  //codigo
                 if trim(EdtCodigo.Text) = '' then
                    begin 
                       AlertaCad('Digite o código da Venda');
                       exit;
                    end;
                 sql.Add(' WHERE V.COD_VEN = :CODVEN');
                 Parambyname('codven').AsInteger:= strtoint(EdtCodigo.Text);
                 open;
              end;
           1: begin  //DATA
                 sql.Add(' WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN');
                 if (not CheckEmp.Checked) then
                    begin 
                       sql.Add(' AND V.COD_EMP = :CODEMP');
                       Parambyname('codemp').AsInteger:= iEmp;
                    end;
                 SQL.Add(' ORDER BY V.DATA_VEN, V.COD_VEN');
                 Parambyname('dataini').AsDate:= edtdataini.Date;
                 Parambyname('datafin').AsDate:= edtdatafin.Date;
                 open;
                 Last;
              end;
           2: begin  //cliente
                 if trim(edtcodCli.Text) = '' then
                    begin 
                       AlertaCad('Digite o Código do Cliente');
                       exit;
                    end;
                 sql.Add(' WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN AND V.COD_CLI = :CODCLI');
                 if (not CheckEmp.Checked) then
                    begin 
                       sql.Add(' AND V.COD_EMP = :CODEMP');
                       Parambyname('codemp').AsInteger:= iEmp;
                    end;
                 SQL.Add(' ORDER BY V.DATA_VEN, V.COD_VEN');
                 Parambyname('dataini').AsDate   := edtdataini.Date;
                 Parambyname('datafin').AsDate   := edtdatafin.Date;
                 Parambyname('codcli').AsInteger := strtoint(EdtCodCli.Text);
                 Open;
              end;
           3: begin  //coo
                 if trim(edtcodigo.Text) = '' then
                    begin 
                       AlertaCad('Digite o COO do Cupom');
                       exit;
                    end;
                 sql.Add(' WHERE V.CUPOM_FISCAL_VEN = :CUPOM');
                 if (not CheckEmp.Checked) then
                    begin 
                       sql.Add(' AND V.COD_EMP = :CODEMP');
                       Parambyname('codemp').AsInteger:= iEmp;
                    end;
                 Parambyname('cupom').AsInteger:= strtoint(EdtCodigo.text);
                 open;
              end;
           4: begin  //ccf
                 if trim(edtcodigo.Text) = '' then
                    begin 
                       AlertaCad('Digite o CCF do Cupom');
                       exit;
                    end;
                 sql.Add(' WHERE V.R04_CCF = :CCF');
                 if (not CheckEmp.Checked) then
                    begin 
                       sql.Add(' AND V.COD_EMP = :CODEMP');
                       Parambyname('codemp').AsInteger:= iEmp;
                    end;
                 Parambyname('cupom').AsInteger:= strtoint(EdtCodigo.text);
                 open;
              end;
           5: begin   // nota fiscal
                 if trim(edtcodigo.Text) = '' then
                    begin 
                       AlertaCad('Digite o Número da Nota Fiscal');
                       exit;
                    end;
                 sql.Add(' WHERE V.NUMERO_NOTA_FISCAL = :NF');
                 if (not CheckEmp.Checked) then
                    begin 
                       sql.Add(' AND V.COD_EMP = :CODEMP');
                       Parambyname('codemp').AsInteger:= iEmp;
                    end;
                 Parambyname('nf').AsInteger:= strtoint(EdtCodigo.text);
                 open;
              end;
         end;
      end;
end;

procedure TFrmConsVendas.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      btnsair.Click;
end;

procedure TFrmConsVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if IBTRConsVendas.Active then
      IBTRConsVendas.Commit;
   QConsVendas.SQL.Clear;
   QConsVendas.SQL.Text:= sSql;
   QConsVendas.Close;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QBuscaItens.Close;

   {grava a posicao do combo}
   dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsVendas.ComboCons', inttostr(ComboCons.itemIndex));
   Action:= caFree;
end;

procedure TFrmConsVendas.BtnLocalizarClick(Sender: TObject);
var sEstEmp, sEstCli : string;
    iOrdem     : integer;
    iCFOPCupom : integer;
begin 
   if QConsVendasCOD_EMP.AsInteger <> iEmp then
      begin 
         AlertaCad('Você está logado na empresa ' + inttostr(iEmp) + #13 +
                     'Esta Venda pertence à empresa ' + QConsVendasCOD_EMP.AsString);
         exit;
      end;

   case FrmConsVendas.Tag of
    0,1: begin 
            if ( QConsVendasCUPOM_FISCAL_VEN.AsInteger > 0 ) AND ( not ExcluirVendas ) then
               begin 
                  AlertaCad('Venda com cupom fiscal nao pode ser alterada ou excluida');
                  exit;
                  abort;
               end;

            if (QConsVendasCOD_NF.AsInteger > 0) or (QConsVendasNUMERO_NOTA_FISCAL.AsInteger > 0) then
               begin 
                  AlertaCad('Venda com nota fiscal nao pode ser alterada ou excluida');
                  exit;
                  abort;
               end;

            BuscaFormulario( TFrmVenda, True );
            with FrmVenda do
               begin 
                  Tag                  := 1;
                  edtobs.Text          := QConsVendasOBS.AsString;
                  EdtCod.Text          := QConsVendasCOD_VEN.AsString;
                  EdtData.Text         := QConsVendasDATA_VEN.AsString;
                  edtcodcli.Text       := QConsVendasCOD_CLI.AsString;
                  EdtNomecli.Text      := QConsVendasNOME_CLI.AsString;
                  LConv.Caption        := QConsVendasNOME_CON.AsString;
                  EdtCodTPV.Text       := QConsVendasCOD_TPV.AsString;
                  EdtNomeTPV.Text      := QConsVendasNOME_TPV.AsString;
                  EdtCodVend.Text      := QConsVendasCOD_VEND.AsString;
                  EdtNomeVend.Text     := QConsVendasNOME_VEND.AsString;
                  EdtTotalLiquido.Caption := QConsVendasTOTAL_VEN.AsString;
                  if trim( QConsVendasCONSIGNADA.AsString ) = 'S' then
                     OPConsignada.ItemIndex := 1
                  else
                  if trim( QConsVendasCONSIGNADA.AsString ) = 'F' then
                     OPConsignada.ItemIndex := 2
                  else
                     OPConsignada.ItemIndex := 0;


                  BuscaItens;
                  FormShow(sender);
               end;
            close;
         end;
    2: begin 
          {  BUSCA A ORDEM DOS ITENS NA NOTA FISCAL }
          iOrdem:= 0;
          if dm.IBTransaction.Active then
             dm.IBTransaction.Commit;
          dm.IBTransaction.StartTransaction;
          try
            try
              with dm.Consulta do
                 begin 
                    Close;
                    SQL.Clear;
                    SQL.Text:= 'SELECT MAX(ORDEM) ORDEM FROM ITENS_NOTA_FISCAL WHERE COD_NF = :CODNF';
                    ParamByName('codnf').AsInteger:= strtoint(FrmNotaFiscal.EdtCod.text);
                    ExecOrOpen;
                    if fieldbyname('ordem').IsNull then
                      iOrdem:= 1
                    else
                      iOrdem:= fieldbyname('ordem').AsInteger + 1;
                 end;
              dm.IBTransaction.Commit;
            except
              dm.IBTransaction.Rollback;
              AlertaCad('Erro ao buscar a ordem dos itens da nota fiscal');
            end;
          finally
             dm.Consulta.Close;
          end;

          {BUSCA O DESCONTO DA NOTA FISCAL}
          FrmNotaFiscal.EdtDesconto.Text:= currtostr(strtocurr(FrmNotaFiscal.EdtDesconto.Text) + QConsVendasDESCONTO_VEN.AsCurrency);

          { VERIFICA SE É DENTRO OU FORA DO ESTADO }
          sEstEmp:= dm.RetornaStringTabela('est_emp', 'empresa', 'cod_emp', iEmp);

          if FrmNotaFiscal.ComboCliFor.ItemIndex = 0 then
             sEstCli:= trim(dm.RetornaStringTabela('estres_cli', 'cliente', 'cod_cli', strtoint(FrmNotaFiscal.edtclifor.Text)))
          else
             sEstCli:= trim(dm.RetornaStringTabela('est_for', 'fornecedor', 'cod_for', strtoint(FrmNotaFiscal.edtclifor.Text)));

          { BUSCA O CFOP DE VENDAS COM CUPOM }
          if dm.IBTransaction.Active then
             dm.IBTransaction.Commit;
          dm.IBTransaction.StartTransaction;
          with dm.QConsulta do
             begin 
                close;
                sql.Clear;
                sql.Text:= 'SELECT CFOP_CUPOM_ESTADO, CFOP_CUPOM_FORA ' +
                           'FROM PARAMETROS ' +
                           'WHERE COD_EMP = :CODEMP';
                Parambyname('codemp').AsInteger:= iEmp;
                open;
                if trim(sEstEmp) = trim(sEstCli) then
                   iCFOPCupom:= fieldbyname('cfop_cupom_estado').AsInteger
                else
                   iCFOPCupom:= fieldbyname('cfop_cupom_fora').AsInteger;
             end;
          dm.IBTransaction.Commit;
          dm.QConsulta.Close;

          if dm.IBTransaction.Active then
             dm.IBTransaction.Commit;
          dm.IBTransaction.StartTransaction;
          try
            try
              with QBuscaItensNotaFiscal do
                 begin 
                    close;
                    sql.Clear;
                    sql.add('SELECT I.COD_PRO, I.QUANT, I.VALOR, P.NOME_PRO,             ' +
                            'P.CST_CF_EST, P.CST_CF_FORA, P.ICMS_CF_EST, P.ICMS_CF_FORA, ' +
                            'P.RED_CF_EST, P.RED_CF_FORA, P.IPI_CF_EST, P.IPI_CF_FORA,   ' +
                            'G.ALIQUOTA_GRP, U.DESCRICAO    ' +
                            'FROM ITENS_VENDA I   ' +
                            'INNER JOIN PRODUTO P ' +
                            'ON (I.COD_PRO = P.COD_PRO) ' +
                            'INNER JOIN UNIDADE_MEDIDA U ' +
                            'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO) ' +
                            'INNER JOIN GRUPO_ICMS G ');

                    if trim(sEstEmp) = trim(sEstCli) then
                       sql.Add('ON (P.ICMS_CF_EST = G.COD_GRP)  ' +
                               'WHERE I.COD_VEN = :CODVEN')
                    else
                       sql.Add('ON (P.ICMS_CF_FORA = G.COD_GRP) ' +
                               'WHERE I.COD_VEN = :CODVEN');

                    Parambyname('codven').AsInteger:= QConsVendasCOD_VEN.AsInteger;
                    open;
                    if recordcount > 0 then
                       begin 
                          First;
                          while not eof do
                              begin 
                                 QinsItensNotaFiscal.ParamByName('1').AsInteger     := iOrdem;
                                 QinsItensNotaFiscal.ParamByName('2').AsInteger     := strtoint(FrmNotaFiscal.EdtCod.Text);
                                 QinsItensNotaFiscal.ParamByName('3').AsInteger     := fieldbyname('cod_pro').AsInteger;
                                 QinsItensNotaFiscal.ParamByName('5').AsCurrency    := Fieldbyname('quant').AsCurrency;
                                 QinsItensNotaFiscal.ParamByName('6').AsCurrency    := fieldbyname('valor').AsCurrency;
                                 QinsItensNotaFiscal.ParamByName('7').AsCurrency    := fieldbyname('aliquota_grp').AsCurrency;
                                 QinsItensNotaFiscal.ParamByName('8').AsInteger     := iEmp;

                                 QinsItensNotaFiscal.ParamByName('13').AsInteger    := iCFOPCupom;
                                 QinsItensNotaFiscal.Parambyname('14').AsString     := 'N';
                                 QinsItensNotaFiscal.ParamByName('15').AsCurrency   := 0;
                                 QinsItensNotaFiscal.ParamByName('16').AsCurrency   := 0;
                                 QinsItensNotaFiscal.Parambyname('18').AsString     := Fieldbyname('DESCRICAO').AsString;
                                 QinsItensNotaFiscal.Parambyname('19').AsCurrency   := 0;
                                 QinsItensNotaFiscal.Parambyname('20').AsCurrency   := 0;
                                 QinsItensNotaFiscal.Parambyname('21').AsCurrency   := 0;
                                 QinsItensNotaFiscal.Parambyname('22').AsCurrency   := 0;
                                 QinsItensNotaFiscal.Parambyname('23').AsCurrency   := 0;
                                 QinsItensNotaFiscal.Parambyname('24').AsCurrency   := 0;
                                 QinsItensNotaFiscal.Parambyname('25').Value        := null;

                                 if trim(sEstEmp) = trim(sEstCli) then  //NO ESTADO
                                    begin 
                                       QinsItensNotaFiscal.ParamByName('4').AsString      := fieldbyname('CST_CF_est').AsString;
                                       QinsItensNotaFiscal.ParamByName('9').AsInteger     := fieldbyname('ICMS_CF_EST').AsInteger;
                                       QinsItensNotaFiscal.ParamByName('10').AsCurrency   := fieldbyname('IPI_CF_EST').AsCurrency;
                                       QinsItensNotaFiscal.ParamByName('12').AsCurrency   := FieldByName('RED_CF_EST').AsCurrency;
                                    end
                                 else
                                    begin 
                                       QinsItensNotaFiscal.ParamByName('4').AsString      := fieldbyname('CST_CF_FORA').AsString;
                                       QinsItensNotaFiscal.ParamByName('9').AsInteger     := fieldbyname('ICMS_CF_FORA').AsInteger;
                                       QinsItensNotaFiscal.ParamByName('10').AsCurrency   := fieldbyname('IPI_CF_FORA').AsCurrency;
                                       QinsItensNotaFiscal.ParamByName('12').AsCurrency   := FieldByName('RED_CF_FORA').AsCurrency;
                                    end;
                                 QinsItensNotaFiscal.ExecOrOpen;
                                 iOrdem:= iOrdem + 1;
                                 next;
                              end;
                       end;
                 end;
              dm.IBTransaction.Commit;
            except
              dm.IBTransaction.Rollback;
              AlertaCad('Erro ao buscar os itens. ' + #13 + 'Verifique CFOP e CST no cadastro dos produtos');
            end;
          finally
            QBuscaItensNotaFiscal.Close;
            QinsItensNotaFiscal.Close;
            FrmNotaFiscal.BuscaItens;
            FrmNotaFiscal.EdtItens.Text:= inttostr(FrmNotaFiscal.BuscaOrdem);
          end;
          close;
       end;
    3:begin 
         with FrmCTRDuplicata do
            begin 
               EdtCodVenda.Text:= QConsVendasCOD_VEN.AsString;
               EdtCodVenda.SetFocus;
            end;
         close;
      end;
    4:begin 
         with FrmDuplicataADM do
            begin 
               EdtCodVenda.Text:= QConsVendasCOD_VEN.AsString;
               EdtCodVenda.SetFocus;
            end;
         close;
      end;
    5:begin 
         with FrmLancCTRADM do
            begin 
               EdtCodVenda.Text:= QConsVendasCOD_VEN.AsString;
               EdtNumDoc.Text  := 'CF ' + QConsVendasCUPOM_FISCAL_VEN.AsString;
               EdtCodVenda.SetFocus;
            end;
         close;
      end;
   end;
end;

procedure TFrmConsVendas.EdtCodCliEnter(Sender: TObject);
begin 
   EdtCodCli.SelectAll;
end;

procedure TFrmConsVendas.BtnItensClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmItensVenda, FrmItensVenda);
   FrmItensVenda.Tag:= 0;
   FrmItensVenda.showmodal;
end;

procedure TFrmConsVendas.QBuscaItensCalcFields(DataSet: TDataSet);
begin 
   QBuscaItensCALC_TOTAL.AsCurrency:= ((QBuscaItensQUANT.AsCurrency * QBuscaItensVALOR.AsCurrency) - QBuscaItensDESCONTO.AsCurrency);
end;

procedure TFrmConsVendas.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin 
   if QConsVendasCANCELADA_VEN.AsInteger = 1 then
      begin 
         DBGrid1.Canvas.Font.Color:= clRed;
         Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
      end;
   if trim( QConsVendasCONSIGNADA.AsString ) = 'S' then
      begin 
         DBGrid1.Canvas.Brush.Color := $005E5EFF;
         DBGrid1.Canvas.Font.Color:= clWhite;
         Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
      end;
   if Trim (  QConsVendasCONSIGNADA.AsString ) = 'F' then
      begin 
        //clLime
         DBGrid1.Canvas.Brush.Color := clLime;
         DBGrid1.Canvas.Font.Color:= clWhite;
         Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
      end;
end;

procedure TFrmConsVendas.BtnSegundaViaClick(Sender: TObject);
var iLinha       : integer;
    sAuxData     : string;
    cAuxTotal    : currency;
    iLinhasFinal : integer;
begin 
   if (not (QConsVendas.State = dsBrowse)) and (not (QConsVendasCOD_VEN.AsInteger > 0)) then
       begin 
          exit;
       end;

   if application.MessageBox('Confirma a Impressão da Segunda Via?', 'Impressão de Comprovante de Venda', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         iLinhasFinal:= dm.RetornaIntegerTabela('linhas_final', 'parametros', 'cod_emp', iEmp);

         {==========================================================================}
         {======================= IMPRESSAO DO COMPROVANTE DE VENDA ================}
         {==========================================================================}
         RDprint.TamanhoQteLinhas:= 1;
         RDprint.Abrir;

         {==========================================================================}
         {============================= IMPRESSAO DO CABEÇALHO =====================}
         {==========================================================================}
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with dm.QConsulta do
            begin 
               close;
               sql.Clear;
               sql.Add('SELECT RAZAO_EMP, CNPJ_EMP, INSC_EMP, END_EMP, BAI_EMP, CID_EMP, EST_EMP, CEP_EMP ' +
                       'FROM EMPRESA WHERE COD_EMP = :CODEMP');
               Parambyname('codemp').AsInteger:= iEmp;
               Open;
               RDprint.ImpC(1, 28, trim(FieldByName('RAZAO_EMP').AsString), []);
               RDprint.ImpC(2, 28, trim(FieldByName('end_emp').AsString) + ', ' + trim(FieldByName('bai_emp').AsString), []);
               RDprint.ImpC(3, 28, trim(FieldByName('cid_emp').AsString) + '-' + trim(FieldByName('est_emp').AsString) + ' CEP:' + trim(FieldByName('cep_emp').AsString), []);
               RDprint.Imp(4, 1, 'CNPJ: ' + fieldbyname('cnpj_emp').AsString);
               RDprint.Imp(5, 1, 'IE: ' + fieldbyname('insc_emp').AsString);
            end;
         dm.IBTransaction.Commit;
         dm.QConsulta.Close;

         RDprint.Imp(6, 1, '-----------------------------------------------------');
         RDprint.Imp(7, 1, QConsVendasDATA_VEN.AsString + '  ' +
                           QConsVendasHORA.AsString + '  CCF:' +
                           FormataStringD(QConsVendasR04_CCF.AsString, '6', '0') +
                           '  COO:' + FormataStringD(QConsVendasCUPOM_FISCAL_VEN.AsString, '6', '0') +
                           '  ECF:' + FormataStringD(QConsVendasCOD_CAI.AsString, '3', '0'));
         RDprint.Imp(8, 1, ' ');
         RDprint.ImpC(9, 28, '2ª VIA - CUPOM FISCAL', []);
         RDprint.Imp(10, 1, '-----------------------------------------------------');

         {==========================================================================}
         {================================= ITENS DA VENDA =========================}
         {==========================================================================}
         iLinha:= 11;
         RDprint.imp(iLinha, 1, 'Item Codigo         Desc.   Quant.    Unit.     Total');
         RDprint.imp(iLinha, 1, '-----------------------------------------------------');
         inc(iLinha);
         cAuxTotal:= 0;

         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with QBuscaItens do
            begin 
               close;
               Parambyname('codven').AsInteger:= QConsVendasCOD_VEN.AsInteger;
               Open;
               DisableControls;
               First;
               while not eof do
                  begin 
                     RDprint.Imp(iLinha, 1, FormataStringD(QBuscaItensORDEM.AsString, '3', '0'));
                     RDprint.Imp(iLinha, 6, FormataStringD(QBuscaItensCODIGO_BARRA_PRO.AsString, '14', '0'));
                     RDprint.Imp(iLinha, 21, copy(trim(QBuscaItensNOME_PRO.AsString), 1, 30));
                     inc(iLinha);
                     RDprint.ImpVal(iLinha, 27, '#,##0.00', QBuscaItensQUANT.AsCurrency, []);
                     RDprint.ImpVal(iLinha, 36, '#,##0.00', QBuscaItensVALOR.AsCurrency, []);
                     RDprint.ImpVal(iLinha, 46, '#,##0.00', QBuscaItensCALC_TOTAL.AsCurrency, []);

                     if QBuscaItensCANCELADO.AsInteger = 1 then
                        begin 
                           inc(iLinha);
                           RDprint.Imp(iLinha, 16, 'Cancelado Item ' + QBuscaItensORDEM.AsString);
                           RDprint.ImpVal(iLinha, 46, '#,##0.00', QBuscaItensCALC_TOTAL.AsCurrency, []);
                        end;

                     inc(iLinha);
                     if QBuscaItensDESCONTO.AsCurrency > 0 then
                        begin 
                           RDprint.Imp(iLinha, 19, 'Desconto');
                           RDprint.ImpVal(iLinha, 46, '#,##0.00', QBuscaItensDESCONTO.AsCurrency, []);
                           inc(iLinha);
                        end;

                     if QBuscaItensCANCELADO.AsInteger = 0 then
                        cAuxTotal:= cAuxTotal + QBuscaItensCALC_TOTAL.AsCurrency - QBuscaItensDESCONTO.AsCurrency;

                     next;
                  end;
               First;
               EnableControls;
            end;
         dm.IBTransaction.Commit;
         QBuscaItens.Close;

         {==========================================================================}
         {========================== IMPRESSAO DOS TOTAIS ==========================}
         {==========================================================================}
         RDprint.Imp(iLinha , 1, '-----------------------------------------------------');
         inc(iLinha);
         if QConsVendasDESCONTO_VEN.AsCurrency > 0 then
            begin 
               RDprint.Imp(iLinha, 1, '                              SUBTOTAL   ');
               RDprint.ImpVal(iLinha, 46, '#,##0.00', cAuxTotal, []);
               inc(iLinha);
               RDprint.Imp(iLinha, 1, '                              DESCONTO   ');
               RDprint.ImpVal(iLinha, 46, '#,##0.00', QConsVendasDESCONTO_VEN.AsCurrency, []);
               inc(ilinha);
               RDprint.Imp(iLinha , 1, '                              TOTAL      ');
               RDprint.ImpVal(iLinha, 46, '#,##0.00', cAuxTotal - QConsVendasDESCONTO_VEN.AsCurrency, []);
               inc(iLinha);
            end
         else
            begin 
               RDprint.Imp(iLinha, 1, '                              TOTAL      ');
               RDprint.ImpVal(iLinha, 46, '#,##0.00', cAuxTotal, []);
               inc(iLinha);
            end;

         { busca as formas de pagamento da venda }
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with dm.QConsulta do
            begin 
               close;
               sql.Clear;
               sql.Add('SELECT I.VALOR, F.DESCRICAO     ' +
                       'FROM VENDAS_FORMAS_PAGAMENTO I  ' +
                       'INNER JOIN FORMAS_PAGAMENTO  F  ' +
                       'ON (I.COD_FORMA = F.CODIGO)     ' +
                       'WHERE I.COD_VENDA = :CODVEN     ' +
                       'ORDER BY F.DESCRICAO');
               Parambyname('codven').AsInteger:= QConsVendasCOD_VEN.AsInteger;
               open;
               while not eof do
                  begin 
                     if fieldbyname('valor').AsCurrency > 0 then
                        begin 
                           RDprint.Imp(iLinha, 31, fieldbyname('descricao').asString);
                           RDprint.ImpVal(iLinha, 46, '#,##0.00', fieldbyname('valor').AsCurrency, []);
                           inc(iLinha);
                        end;

                     next;
                  end;
            end;
         dm.IBTransaction.Commit;
         dm.QConsulta.Close;

         {==========================================================================}
         {========================== FINALIZA A IMPRESSAO ==========================}
         {==========================================================================}
         iLinha:= iLinha + iLinhasFinal;
         RDprint.Imp(iLinha, 1, ' ');
         if strtoint(dm.LeIni('cnfcomercio.ini', 'configuracaolocal', 'visualizarrelatorios')) = 1 then
            begin 
               RDprint.TamanhoQteLinhas:= iLinha;
               RDprint.OpcoesPreview.Preview:= true;
            end
         else
            begin 
               RDprint.TamanhoQteLinhas:= 1;
               RDprint.OpcoesPreview.Preview:= false;
            end;
         RDprint.Fechar;
      end;
end;

end.
