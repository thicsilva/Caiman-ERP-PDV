unit USintegra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, Mask, rxToolEdit, DB, 
  ACBrSintegra, UNovosComponentes, UNovoFormulario, StrUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmSintegra = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Edtdataini: TDateTimePicker;
    Edtdatafin: TDateTimePicker;
    BtnOK2: TBitBtn;
    BtnSair: TBitBtn;
    SaveDialog: TSaveDialog;
    GroupBox1: TGroupBox;
    ComboNatureza: TComboBox;
    GroupBox3: TGroupBox;
    ComboFinalidade: TComboBox;
    Q60M: TFDQuery;
    Q60D: TFDQuery;
    Q75: TFDQuery;
    Q75COD_PRO: TIntegerField;
    Q75NOME_PRO: TStringField;
    Q75ALIQUOTA_GRP: TBCDField;
    Q60I: TFDQuery;
    Q60R: TFDQuery;
    GroupBox4: TGroupBox;
    EdtRegistro: TEdit;
    OpenDialog: TOpenDialog;
    Memo: TMemo;
    GroupBox5: TGroupBox;
    Check50: TCheckBox;
    Check54: TCheckBox;
    Check60M: TCheckBox;
    Check60A: TCheckBox;
    Check60D: TCheckBox;
    Check60I: TCheckBox;
    Check60R: TCheckBox;
    Check70: TCheckBox;
    Check74: TCheckBox;
    Check75: TCheckBox;
    Q75COD_NCM: TStringField;
    Q74: TFDQuery;
    Q74COD_INVENTARIO: TIntegerField;
    Q74COD_EMP: TIntegerField;
    Q74COD_PRO: TIntegerField;
    Q74QUANT: TBCDField;
    Q74CUSTO: TBCDField;
    Q50E: TFDQuery;
    Q50ECODIGO: TIntegerField;
    Q50EORDEM: TIntegerField;
    Q50ECFOP: TIntegerField;
    Q50EBASE_CALCULO: TBCDField;
    Q50EVALOR_ICMS: TBCDField;
    Q50EISENTA_NAO_TRIBUTADA: TBCDField;
    Q50EOUTRAS: TBCDField;
    Q50EALIQUOTA: TBCDField;
    Q50ECODIGO_EMPRESA: TIntegerField;
    Q50EVALOR_TOTAL: TBCDField;
    Q50ECNPJ: TStringField;
    Q50EINSCRICAO: TStringField;
    Q50EDATA: TDateField;
    Q50EUF: TStringField;
    Q50ESERIE_NOTA: TStringField;
    Q50EEMITENTE: TStringField;
    Q50ENUMERO_NOTA: TIntegerField;
    Q50ESITUACAO: TStringField;
    Q70: TFDQuery;
    Q54E: TFDQuery;
    Q54ECOD_ENT: TIntegerField;
    Q54ECOD_PRO: TIntegerField;
    Q54EPERC_ICMS: TBCDField;
    Q54EPERC_IPI: TBCDField;
    Q54EQTDUND_ENT: TBCDField;
    Q54EPERC_DESC: TBCDField;
    Q54EPERC_ACRES: TBCDField;
    Q54ECOD_EMP: TIntegerField;
    Q54EVALOR_UNIT_PRO: TBCDField;
    Q54ECUSTO: TBCDField;
    Q54EQTD_PRO: TBCDField;
    Q54ECOD_GRP: TIntegerField;
    Q54ECOD_CFOP: TIntegerField;
    Q54EVALOR_DESCONTO: TBCDField;
    Q54EVALOR_ACRESCIMO: TBCDField;
    Q54EPERC_BCR: TBCDField;
    Q54ECST: TStringField;
    Q54EVALOR_TOTAL: TBCDField;
    Q54EBASE_CALCULO: TBCDField;
    Q54EVALOR_ICMS: TBCDField;
    Q54EORDEM: TIntegerField;
    Q54EPERC_ST: TBCDField;
    Q54ECODIGO: TIntegerField;
    Q54EDATA: TDateField;
    Q54ECNPJ: TStringField;
    Q54ESERIE_NOTA: TStringField;
    Q54ENUMERO_NOTA: TIntegerField;
    Q54EEMITENTE: TStringField;
    Q54EVALOR_TOTAL1: TBCDField;
    Q54ESITUACAO: TStringField;
    Q54ECODIGO_EMPRESA: TIntegerField;
    Q54ECODIGO_ENTRADA: TIntegerField;
    Q54EINSCRICAO: TStringField;
    Q54EUF: TStringField;
    Q54ECOD_FOR: TIntegerField;
    Q54ESUB_SERIE: TStringField;
    Q54ECIF_FOB: TIntegerField;
    Q50S: TFDQuery;
    Q50SCODIGO: TIntegerField;
    Q50SORDEM: TIntegerField;
    Q50SCFOP: TIntegerField;
    Q50SBASE_CALCULO: TBCDField;
    Q50SVALOR_ICMS: TBCDField;
    Q50SISENTA_NAO_TRIBUTADA: TBCDField;
    Q50SOUTRAS: TBCDField;
    Q50SALIQUOTA: TBCDField;
    Q50SCODIGO_EMPRESA: TIntegerField;
    Q50SVALOR_TOTAL: TBCDField;
    Q50SICMS_RETIDO: TBCDField;
    Q50SBASE_CALCULO_RETIDO: TBCDField;
    Q50SCNPJ: TStringField;
    Q50SINSCRICAO: TStringField;
    Q50SDATA: TDateField;
    Q50SUF: TStringField;
    Q50SSERIE_NOTA: TStringField;
    Q50SEMITENTE: TStringField;
    Q50SNUMERO_NOTA: TIntegerField;
    Q50SSITUACAO: TStringField;
    Q50SREGISTRADO_ECF: TStringField;
    Q54S: TFDQuery;
    Q54SORDEM: TIntegerField;
    Q54SCOD_NF: TIntegerField;
    Q54SCST: TStringField;
    Q54SUNIT: TBCDField;
    Q54SALIQ: TBCDField;
    Q54SCOD_EMP: TIntegerField;
    Q54SCOD_GRP: TIntegerField;
    Q54SQUANT: TBCDField;
    Q54SALIQ_IPI: TBCDField;
    Q54SREDUCAO_ICMS: TBCDField;
    Q54SCOD_CFO: TIntegerField;
    Q54SSUB_TRIBUTARIA: TStringField;
    Q54SVR_AGREGADO: TBCDField;
    Q54SALIQUOTA_FORA_ESTADO: TBCDField;
    Q54SUNIDADE: TStringField;
    Q54SCOD_PRO: TIntegerField;
    Q54SVALOR_TOTAL: TBCDField;
    Q54SBASE_CALCULO: TBCDField;
    Q54SVALOR_ICMS: TBCDField;
    Q54SBASE_SUBTRIB: TBCDField;
    Q54SVALOR_IPI: TBCDField;
    Q54SVALOR_SUBTRIB: TBCDField;
    Q54SCODIGO: TIntegerField;
    Q54SDATA: TDateField;
    Q54SCNPJ: TStringField;
    Q54SSERIE_NOTA: TStringField;
    Q54SNUMERO_NOTA: TIntegerField;
    Q54SEMITENTE: TStringField;
    Q54SVALOR_TOTAL1: TBCDField;
    Q54SSITUACAO: TStringField;
    Q54SCODIGO_EMPRESA: TIntegerField;
    Q54SCODIGO_SAIDA: TIntegerField;
    Q54SINSCRICAO: TStringField;
    Q54SUF: TStringField;
    Check61: TCheckBox;
    Check61R: TCheckBox;
    Q54SCLASSIFICACAO_FISCAL: TStringField;
    Q54SNUMERO_NOTA_FINAL: TIntegerField;
    Q61: TFDQuery;
    Q61CODIGO: TIntegerField;
    Q61ORDEM: TIntegerField;
    Q61CFOP: TIntegerField;
    Q61BASE_CALCULO: TBCDField;
    Q61VALOR_ICMS: TBCDField;
    Q61ISENTA_NAO_TRIBUTADA: TBCDField;
    Q61OUTRAS: TBCDField;
    Q61ALIQUOTA: TBCDField;
    Q61CODIGO_EMPRESA: TIntegerField;
    Q61VALOR_TOTAL: TBCDField;
    Q61ICMS_RETIDO: TBCDField;
    Q61BASE_CALCULO_RETIDO: TBCDField;
    Q61CNPJ: TStringField;
    Q61INSCRICAO: TStringField;
    Q61DATA: TDateField;
    Q61UF: TStringField;
    Q61SERIE_NOTA: TStringField;
    Q61EMITENTE: TStringField;
    Q61NUMERO_NOTA: TIntegerField;
    Q61SITUACAO: TStringField;
    Q61REGISTRADO_ECF: TStringField;
    Q61NUMERO_NOTA_FINAL: TIntegerField;
    Q61R: TFDQuery;
    Q50EICMS_RETIDO: TBCDField;
    Q50EBASE_CALCULO_RETIDO: TBCDField;
    Q74PRECO_VENDA: TBCDField;
    Button1: TButton;
    Q60MCHECKOUT: TIntegerField;
    Q60MDATA: TDateField;
    Q60MCOO_INICIAL: TIntegerField;
    Q60MCOO_FINAL: TIntegerField;
    Q60MGT_INICIAL: TBCDField;
    Q60MGT_FINAL: TBCDField;
    Q60MCONT_REDUCAO: TIntegerField;
    Q60MCONT_CANCEL: TIntegerField;
    Q60MCONTADOR_REINICIO_OPERACAO: TIntegerField;
    Q60MCOD_EMP: TIntegerField;
    Q60MCODIGO: TIntegerField;
    Q60MDATA_EMISSAO: TDateField;
    Q60MHORA_EMISSAO: TTimeField;
    Q60MR01_NUMERO_SERIE: TStringField;
    Q60A: TFDQuery;
    Q60ACODIGO: TIntegerField;
    Q60ACOD_GRP: TIntegerField;
    Q60ACOD_EMP: TIntegerField;
    Q60AINDICE_R03: TStringField;
    Q60AALIQUOTA_GRP: TBCDField;
    Q60ATIPO_GRP: TStringField;
    Q60AICMS_SERVICO_GRP: TStringField;
    Q60DDATA_VEN: TDateField;
    Q60DCOD_PRO: TIntegerField;
    Q60DQUANT: TBCDField;
    Q60DVALOR: TFloatField;
    Q60IORDEM: TIntegerField;
    Q60IQUANT: TBCDField;
    Q60IVALOR: TFloatField;
    Q60IDATA_VEN: TDateField;
    Q60ICUPOM_FISCAL_VEN: TIntegerField;
    Q60ICOD_VEN: TIntegerField;
    Q60ITIPO_GRP: TStringField;
    Q60IALIQUOTA_GRP: TBCDField;
    Q54EVALOR_SUB_TRIBUTARIA: TBCDField;
    Q54EVALOR_IPI: TBCDField;
    Q54SISENTAS: TBCDField;
    Q54SOUTRAS: TBCDField;
    Q54SCODIGO_MAPA_RESUMO: TIntegerField;
    Q74CODIGO_BARRA_PRO: TStringField;
    Q61RQUANT: TBCDField;
    Q61RVALOR: TFloatField;
    Q61RCOD_PRO: TIntegerField;
    Q61RTIPO_GRP: TStringField;
    Q61RALIQUOTA_GRP: TBCDField;
    Q61RDATA_VEN: TDateField;
    Q61RCODIGO_BARRA_PRO: TStringField;
    Q60IICMS_SERVICO_GRP: TStringField;
    Q50ECODIFICACAO_FISCAL: TStringField;
    Q54ECODIFICACAO_FISCAL: TStringField;
    Q50SCODIFICACAO_FISCAL: TStringField;
    Q54SCODIFICACAO_FISCAL: TStringField;
    Q61CODIFICACAO_FISCAL: TStringField;
    Q70CODIGO: TIntegerField;
    Q70ORDEM: TIntegerField;
    Q70CFOP: TIntegerField;
    Q70BASE_CALCULO: TBCDField;
    Q70VALOR_ICMS: TBCDField;
    Q70ISENTA_NAO_TRIBUTADA: TBCDField;
    Q70OUTRAS: TBCDField;
    Q70ALIQUOTA: TBCDField;
    Q70CODIGO_EMPRESA: TIntegerField;
    Q70VALOR_TOTAL: TBCDField;
    Q70ICMS_RETIDO: TBCDField;
    Q70BASE_CALCULO_RETIDO: TBCDField;
    Q70CNPJ: TStringField;
    Q70INSCRICAO: TStringField;
    Q70DATA: TDateField;
    Q70UF: TStringField;
    Q70CODIFICACAO_FISCAL: TStringField;
    Q70SERIE_NOTA: TStringField;
    Q70EMITENTE: TStringField;
    Q70NUMERO_NOTA: TIntegerField;
    Q70SITUACAO: TStringField;
    Q70SUB_SERIE: TStringField;
    Q70CIF_FOB: TIntegerField;
    Q75DESCRICAO: TStringField;
    Q50SCST: TStringField;
    Q54ENF: TFDQuery;
    Q54ENFORDEM: TIntegerField;
    Q54ENFCOD_NF: TIntegerField;
    Q54ENFCST: TStringField;
    Q54ENFALIQ: TBCDField;
    Q54ENFCOD_EMP: TIntegerField;
    Q54ENFCOD_GRP: TIntegerField;
    Q54ENFQUANT: TBCDField;
    Q54ENFALIQ_IPI: TBCDField;
    Q54ENFREDUCAO_ICMS: TBCDField;
    Q54ENFCOD_CFO: TIntegerField;
    Q54ENFSUB_TRIBUTARIA: TStringField;
    Q54ENFVR_AGREGADO: TBCDField;
    Q54ENFALIQUOTA_FORA_ESTADO: TBCDField;
    Q54ENFUNIDADE: TStringField;
    Q54ENFCOD_PRO: TIntegerField;
    Q54ENFVALOR_TOTAL: TBCDField;
    Q54ENFBASE_CALCULO: TBCDField;
    Q54ENFVALOR_ICMS: TBCDField;
    Q54ENFBASE_SUBTRIB: TBCDField;
    Q54ENFVALOR_IPI: TBCDField;
    Q54ENFVALOR_SUBTRIB: TBCDField;
    Q54ENFCLASSIFICACAO_FISCAL: TStringField;
    Q54ENFUNIT: TBCDField;
    Q54ENFISENTAS: TBCDField;
    Q54ENFOUTRAS: TBCDField;
    Q54ENFCODIGO: TIntegerField;
    Q54ENFDATA: TDateField;
    Q54ENFCNPJ: TStringField;
    Q54ENFSERIE_NOTA: TStringField;
    Q54ENFNUMERO_NOTA: TIntegerField;
    Q54ENFEMITENTE: TStringField;
    Q54ENFVALOR_TOTAL1: TBCDField;
    Q54ENFSITUACAO: TStringField;
    Q54ENFCODIGO_EMPRESA: TIntegerField;
    Q54ENFCODIGO_ENTRADA: TIntegerField;
    Q54ENFINSCRICAO: TStringField;
    Q54ENFUF: TStringField;
    Q54ENFCOD_FOR: TIntegerField;
    Q54ENFSUB_SERIE: TStringField;
    Q54ENFCIF_FOB: TIntegerField;
    Q54ENFCODIFICACAO_FISCAL: TStringField;
    Q54ENFCODIGO_NOTA_FISCAL: TIntegerField;
    Q60ICOD_PRO: TIntegerField;
    Q54ECODIGO_NOTA_FISCAL: TIntegerField;
    ACBRSintegra: TACBrSintegra;
    Aux: TFDTransaction;
    Qaux: TFDQuery;
    QauxNOME_PRO: TStringField;
    Q60RCOD_PRO: TIntegerField;
    Q60RQUANT: TBCDField;
    Q60RVALOR: TFMTBCDField;
    Q60RTIPO_GRP: TStringField;
    Q60RALIQUOTA_GRP: TBCDField;
    Q60RICMS_SERVICO_GRP: TStringField;
    Q60ACODIGO_LIVRO_FISCAL: TIntegerField;
    Q60ACODIGO_LIVRO_FISCAL1: TIntegerField;
    Q60AORDEM_LIVRO_FISCAL: TIntegerField;
    Q60ASTATUS_EXPORTA: TIntegerField;
    Q60AVALOR: TBCDField;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure VerificaNotaFiscal(CNPJ, Nota, Linha : string);
    procedure Button1Click(Sender: TObject);
    procedure BtnOK2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  //funcoes de inicializacao;
  function ACBr_SintegraAtivar: Integer; stdcall; external 'ACBr.dll';
  function ACBr_SintegraDesativar: Integer; stdcall; external 'ACBr.dll';

  //funcoes sintegra
  function ACBr_SintegraRegistro10(CNPJ,Inscricao,RazaoSocial,Cidade,Estado,
    Telefone,DataInicial,DataFinal,CodigoConvenio,NaturezaInformacoes,
    FinalidadeArquivo: PChar): Integer; stdcall; external 'ACBr.dll';
  function ACBr_SintegraRegistro11(Endereco,Numero,Bairro,Cep,Responsavel,
    Telefone: PChar): Integer; stdcall; external 'ACBr.dll';
  function ACBr_SintegraRegistro50(CPFCNPJ,Inscricao,DataDocumento,UF,Modelo,
    Serie,Numero,Cfop,EmissorDocumento,ValorContabil,BasedeCalculo,Icms,
    Isentas,Outras,Aliquota,Situacao: PChar): Integer; stdcall; external 'ACBr.dll';
  function ACBr_SintegraRegistro51(CPFCNPJ,Inscricao,DataDocumento,Estado,
    Serie,Numero,CFOP,ValorContabil,ValorIpi,ValorOutras,ValorIsentas,
    Situacao: PChar): Integer; stdcall; external 'ACBr.dll';
  function ACBr_SintegraRegistro53(CPFCNPJ,Inscricao,DataDocumento,Estado,
    Modelo,Serie,Numero,CFOP,Emitente,BaseST,IcmsRetido,Despesas,
    Situacao,CodigoAntecipacao: PChar): Integer; stdcall; external 'ACBr.dll';
  function ACBr_SintegraRegistro54(CPFCNPJ,Modelo,Serie,Numero,CFOP,CST,
    NumeroItem,Codigo,Descricao,Quantidade,Valor,ValorDescontoDespesa,
    BasedeCalculo,BaseST,ValorIpi,Aliquota: PChar): Integer; stdcall; external 'ACBr.dll';
  function ACBr_SintegraRegistro60M(Emissao,NumSerie,NumOrdem,ModeloDoc,
    CooInicial,CooFinal,CRZ,CRO,VendaBruta,ValorGT: PChar): Integer; stdcall; external 'ACBr.dll';
  function ACBr_SintegraRegistro60A(Emissao,NumSerie,Aliquota,
    Valor: PChar): Integer; stdcall; external 'ACBr.dll';
  function ACBr_SintegraRegistro70(CPFCNPJ,Inscricao,DataDocumento,UF,
    Modelo,Serie,SubSerie,Numero,Cfop,ValorContabil,
    BasedeCalculo,Icms,Isentas,Outras,CifFobOutros,
    Situacao: PChar): Integer; stdcall; external 'ACBr.dll';
  function ACBr_SintegraRegistro75(DataInicial,DataFinal,Codigo,NCM,
    Descricao,Unidade,AliquotaIpi,AliquotaICMS,Reducao,
    BaseST: PChar): Integer; stdcall; external 'ACBr.dll';
  function ACBr_SintegraGeraArquivo(Arquivo: PChar;
    VersaoValidador: Integer): Integer; stdcall; external 'ACBr.dll';

  //funcoes de informacao
  function ACBr_VersaoDll(var Versao: ShortString): Integer; stdcall;
    external 'ACBr.dll';
var
  FrmSintegra: TFrmSintegra;

implementation
uses
  Udm, Ubibli1, Sintegra, UNovoPrincipal, UTarefasSP;
var  sCaminhoValidador : string;

{$R *.dfm}

procedure TFrmSintegra.FormShow(Sender: TObject);
begin 
   sCaminhoValidador:= trim(dm.RetornaStringTabela('caminho_validador_sintegra', 'empresa', 'cod_emp', iEmp));
   Memo.Clear;
   edtdataini.Date:= date;
   edtdatafin.date:= date;
   ComboNatureza.ItemIndex:= 2;
   ComboFinalidade.ItemIndex:= 0;
   Edtdataini.SetFocus;
end;

procedure TFrmSintegra.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close;
end;

procedure TFrmSintegra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   Q60M.Close;
   Action:= caFree;
   Self := nil;
end;

procedure TFrmSintegra.BtnOK2Click(Sender: TObject);
begin
//
  AligatorTSPSemAviso.NovaTarefa(
    procedure( Value: TAligatorTSP )
    begin BtnOKClick( nil ) end, '', '');
end;

procedure TFrmSintegra.BtnOKClick(Sender: TObject);
var f: textfile;
    sAux : string;
    iReg50, iReg54, iReg60, iReg61, iReg70, iReg74, iReg75, iReg90 : integer;
    i : integer;
    iCodInventario : integer;
    sAuxTotalReg : string;
    cAuxQuant    : currency;
    cAuxValor    : currency;
    cAuxICMS     : currency;
    cAuxBase     : currency;
    TotBruto: Currency;
begin
//   dm.Sintegra.LimparRegistros;
   iReg50:= 0;
   iReg54:= 0;
   iReg60:= 0;
   iReg61:= 0;
   iReg70:= 0;
   iReg74:= 0;
   iReg75:= 0;
   iReg90:= 1;
   iCodInventario:= 0;
   Memo.Clear;

   if edtdatafin.Date < edtdataini.Date then
      begin
        TThread.Synchronize( nil,
                   procedure
                      begin
                         AlertaCad('A data final não pode ser menor que a data inicial');
//                         edtdatafin.SetFocus;
                      end
                   );

         exit;
      end;

   {verifica se tem inventario gerado na data}
   if Check74.Checked then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         try
           try
             with dm.QConsulta do
                begin 
                   close;
                   sql.Clear;
                   sql.add('SELECT MAX(COD_INVENTARIO) CODIGO ' +
                           'FROM INVENTARIO_ESTOQUE ' +
                           'WHERE DATA_INVENTARIO = :DATA AND COD_EMP = :CODEMP');
                   Parambyname('data').AsDate      := Edtdatafin.Date;
                   Parambyname('codemp').AsInteger := iEmp;
                   open;
                   iCodInventario:= fieldbyname('codigo').AsInteger;
                end;
             dm.IBTransaction.Commit;
           except
             dm.IBTransaction.Rollback;
             TThread.Synchronize( nil,
                        procedure
                           begin
                              AlertaCad('erro ao buscar o código do inventário');
                           end
                        );

           end;
         finally
           dm.QConsulta.Close;
         end;

         if not (iCodInventario > 0) then
            begin
             TThread.Synchronize( nil,
                        procedure
                           begin
                              AlertaCad('Não existe Inventário Gerando no dia ' + datetostr(Edtdatafin.Date));
                           end
                        );
               exit;
            end;
      end;
        TThread.Synchronize( nil,
                   procedure
                      begin
   SaveDialog.Execute;
   FrmSintegra.Refresh;
   end );
//   dm.Sintegra.FileName := SaveDialog.FileName + 'Novo';
   { INCIAL ARQUIVO ACBR }




   { Inicializa o arquivo }
   assignfile(f, SaveDialog.FileName);
   rewrite(f);

   { BUSCA OS DADOS DA EMPRESA }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QEmp do
      begin 
         close;
         sql.Clear;
         sql.Add('SELECT * FROM EMPRESA WHERE COD_EMP = :CODEMP');
         Parambyname('CODEMP').AsInteger := iEmp;
         Open;
      end;

   {=================================================================}
   {====================== ACBR TIPO 10 =========================}
   {=================================================================}


   {=================================================================}
   {====================== REGISTRO TIPO 10 =========================}
   {=================================================================}
   TThread.Synchronize( nil, procedure begin EdtRegistro.Text:= 'Reg.:10';
   EdtRegistro.Refresh;end );
   sAux:= Registro_10(dm.QEmpCNPJ_EMP.AsString,
                      dm.QEmpINSC_EMP.AsString,
                      dm.QEmpRAZAO_EMP.AsString,
                      dm.QEmpCID_EMP.AsString,
                      dm.QEmpEST_EMP.AsString,
                      dm.QEmpFAX_EMP.AsString,
                      datetostr(Edtdataini.Date),
                      datetostr(Edtdatafin.Date),
                      '3',
                      copy(ComboNatureza.Text, 2, 1),
                      copy(ComboFinalidade.Text, 2, 1));
   writeln(f, sAux);

   {=================================================================}
   {====================== ACBR TIPO 11 =========================}
   {=================================================================}



   {=================================================================}
   {====================== REGISTRO TIPO 11 =========================}
   {=================================================================}
   TThread.Synchronize( nil, procedure begin EdtRegistro.Text:= 'Reg.:11';
   EdtRegistro.Refresh; end );
   sAux:= Registro_11(dm.QEmpEND_EMP.AsString,
                      dm.QEmpNUMERO_EMP.AsString,
                      ' ',
                      dm.QEmpBAI_EMP.AsString,
                      dm.QEmpCEP_EMP.AsString,
                      dm.QEmpRESP_EMP.AsString,
                      dm.QEmpTEL_EMP.AsString);
   writeln(f, sAux);
   dm.IBTransaction.Commit;
   dm.QEmp.Close;



   {=================================================================}
   {===================== REGISTRO TIPO 50 ENTRADAS =================}
   {=================================================================}

   if Check50.Checked then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         Q50E.Close;
         Q50E.ParamByName('dataini').AsDate  := Edtdataini.Date;
         Q50E.ParamByName('datafin').AsDate  := Edtdatafin.Date;
         Q50E.ParamByName('codemp').AsInteger:= iEmp;
         Q50E.Open;
         while not Q50E.Eof do
            begin 
   {=================================================================)}
   {===================== ACBR TIPO 50 ENTRADAS =================}
   {=================================================================}


               Inc(iReg50);
               sAux:= Registro_50(Q50ECNPJ.AsString,
                                  Q50EINSCRICAO.AsString,
                                  Q50EDATA.AsString,
                                  Q50EUF.AsString,
                                  Q50ECODIFICACAO_FISCAL.AsString,
                                  Q50ESERIE_NOTA.AsString,
                                  Q50ENUMERO_NOTA.AsString,
                                  Q50ECFOP.AsString,
                                  Q50EEMITENTE.AsString,
                                  currtostrf(Q50EVALOR_TOTAL.AsCurrency, ffnumber, 2),
                                  currtostrf(Q50EBASE_CALCULO.AsCurrency, ffnumber, 2),
                                  currtostrf(Q50EVALOR_ICMS.AsCurrency, ffnumber, 2),
                                  currtostrf(Q50EISENTA_NAO_TRIBUTADA.AsCurrency, ffnumber, 2),
                                  currtostrf(Q50EOUTRAS.AsCurrency, ffnumber, 2),
                                  currtostrf(Q50EALIQUOTA.AsCurrency, ffnumber, 2),
                                  Q50ESITUACAO.AsString);
               writeln(f, sAux);
               Q50E.next;
            end;
         dm.IBTransaction.Commit;
         Q50E.Close;
      end;

   {=================================================================}
   {=================== REGISTRO TIPO 50 NOTAS EMITIDAS =============}
   {=================================================================}
   if Check50.Checked then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         Q50S.Close;
         Q50S.ParamByName('dataini').AsDate   := Edtdataini.Date;
         Q50S.ParamByName('datafin').AsDate   := Edtdatafin.Date;
         Q50S.ParamByName('codemp').AsInteger := iEmp;
         Q50S.Open;
         while not Q50S.Eof do
            begin 
               Inc(iReg50);
               if trim(Q50SREGISTRADO_ECF.AsString) = 'N' then
                  begin 
  {=================================================================}
   {===================== ACBR TIPO 50 NOTAS EMITIDAS =================}
   {=================================================================}


                     sAux:= Registro_50(Q50SCNPJ.AsString,
                                        Q50SINSCRICAO.AsString,
                                        Q50SDATA.AsString,
                                        Q50SUF.AsString,
                                        Q50SCODIFICACAO_FISCAL.AsString,
                                        Q50SSERIE_NOTA.AsString,
                                        Q50SNUMERO_NOTA.AsString,
                                        Q50SCFOP.AsString,
                                        Q50SEMITENTE.AsString,
                                        currtostrf(Q50SVALOR_TOTAL.AsCurrency, ffnumber, 2),
                                        currtostrf(Q50SBASE_CALCULO.AsCurrency, ffnumber, 2),
                                        currtostrf(Q50SVALOR_ICMS.AsCurrency, ffnumber, 2),
                                        currtostrf(Q50SISENTA_NAO_TRIBUTADA.AsCurrency, ffnumber, 2),
                                        currtostrf(Q50SOUTRAS.AsCurrency, ffnumber, 2),
                                        currtostrf(Q50SALIQUOTA.AsCurrency, ffnumber, 2),
                                        Q50SSITUACAO.AsString);
                  end
               else
                  begin 

                     sAux:= Registro_50(Q50SCNPJ.AsString,
                                        Q50SINSCRICAO.AsString,
                                        Q50SDATA.AsString,
                                        Q50SUF.AsString,
                                        Q50SCODIFICACAO_FISCAL.AsString,
                                        Q50SSERIE_NOTA.AsString,
                                        Q50SNUMERO_NOTA.AsString,
                                        Q50SCFOP.AsString,
                                        Q50SEMITENTE.AsString,
                                        '0',
                                        '0',
                                        '0',
                                        '0',
                                        '0',
                                        '0',
                                        Q50SSITUACAO.AsString);
                  end;
               writeln(f, sAux);
               Q50S.next;
            end;
         dm.IBTransaction.Commit;
         Q50S.Close;
      end;

   {=================================================================}
   {===================== REGISTRO TIPO 54 ENTRADAS =================}
   {=================================================================}
   if Check54.Checked then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         Q54E.Close;
         Q54E.ParamByName('dataini').AsDate  := Edtdataini.Date;
         Q54E.ParamByName('datafin').AsDate  := Edtdatafin.Date;
         Q54E.ParamByName('codemp').AsInteger:= iEmp;
         Q54E.Open;
         while not Q54E.Eof do
            begin 
               Inc(iReg54);
   {=================================================================}
   {===================== ACBR TIPO 54 ENTRADAS =================}

   {=================================================================}

               sAux:= Registro_54(Q54ECNPJ.AsString,
                                  Q54ECODIFICACAO_FISCAL.AsString,
                                  Q54ESERIE_NOTA.AsString,
                                  Q54ENUMERO_NOTA.AsString,
                                  Q54ECOD_CFOP.AsString,
                                  Q54ECST.AsString,
                                  Q54EORDEM.AsString,
                                  Q54ECOD_PRO.AsString,
                                  currtostrf(Q54EQTD_PRO.AsCurrency, ffnumber, 3),
                                  currtostrf(Q54EQTD_PRO.AsCurrency * Q54EVALOR_UNIT_PRO.AsCurrency, ffnumber, 2),
                                  currtostrf(Q54EVALOR_DESCONTO.AsCurrency, ffNumber, 2),
                                  currtostrf(Q54EBASE_CALCULO.AsCurrency, ffnumber, 2),
                                  '0',
                                  currtostrf(((Q54EVALOR_TOTAL.AsCurrency * Q54EPERC_IPI.AsCurrency) / 100), ffnumber, 2),
                                  currtostrf(Q54EPERC_ICMS.AsCurrency, ffnumber, 2));
               writeln(f, sAux);
               Q54E.next;

            end;
         dm.IBTransaction.Commit;
         Q54E.Close;
      end;

   if Check54.Checked then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         Q54ENF.Close;
         Q54ENF.ParamByName('dataini').AsDate  := Edtdataini.Date;
         Q54ENF.ParamByName('datafin').AsDate  := Edtdatafin.Date;
         Q54ENF.ParamByName('codemp').AsInteger:= iEmp;
         Q54ENF.Open;
         while not Q54ENF.Eof do
            begin
               Inc(iReg54);

               sAux:= Registro_54(Q54ENFCNPJ.AsString,
                                  Q54ENFCODIFICACAO_FISCAL.AsString,
                                  Q54ENFSERIE_NOTA.AsString,
                                  Q54ENFNUMERO_NOTA.AsString,
                                  Q54ENFCOD_CFO.AsString,
                                  Q54ENFCST.AsString,
                                  Q54ENFORDEM.AsString,
                                  Q54ENFCOD_PRO.AsString,
                                  currtostrf(Q54ENFQUANT.AsCurrency, ffnumber, 3),
                                  currtostrf(Q54ENFQUANT.AsCurrency * Q54ENFUNIT.AsCurrency, ffnumber, 2),
                                  '0',
                                  currtostrf(Q54ENFBASE_CALCULO.AsCurrency, ffnumber, 2),
                                  '0',
                                  currtostrf((((Q54ENFQUANT.AsCurrency * Q54ENFUNIT.AsCurrency) * Q54ENFALIQ_IPI.AsCurrency) / 100), ffnumber, 2),
                                  currtostrf(Q54ENFALIQ.AsCurrency, ffnumber, 2));
               writeln(f, sAux);
               Q54ENF.next;

            end;
         dm.IBTransaction.Commit;
         Q54ENF.Close;
      end;


   {=================================================================}
   {===================== REGISTRO TIPO 54 SAIDAS ===================}
   {=================================================================}
   if Check54.Checked then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         Q54S.Close;
         Q54S.ParamByName('dataini').AsDate  := Edtdataini.Date;
         Q54S.ParamByName('datafin').AsDate  := Edtdatafin.Date;
         Q54S.ParamByName('codemp').AsInteger:= iEmp;
         Q54S.Open;
         while not Q54S.Eof do
            begin 
               Inc(iReg54);

               sAux:= Registro_54(Q54SCNPJ.AsString,
                                  Q54SCODIFICACAO_FISCAL.AsString,
                                  Q54SSERIE_NOTA.AsString,
                                  Q54SNUMERO_NOTA.AsString,
                                  Q54SCOD_CFO.AsString,
                                  Q54SCST.AsString,
                                  Q54SORDEM.AsString,
                                  Q54SCOD_PRO.AsString,
                                  currtostrf(Q54SQUANT.AsCurrency, ffnumber, 3),
                                  currtostrf(Q54SQUANT.AsCurrency * Q54SUNIT.AsCurrency, ffnumber, 2),
                                  '0',
                                  currtostrf(Q54SBASE_CALCULO.AsCurrency, ffnumber, 2),
                                  '0',
                                  currtostrf((((Q54SQUANT.AsCurrency * Q54SUNIT.AsCurrency) * Q54SALIQ_IPI.AsCurrency) / 100), ffnumber, 2),
                                  currtostrf(Q54SALIQ.AsCurrency, ffnumber, 2));
               writeln(f, sAux);
               Q54S.next;

            end;
         dm.IBTransaction.Commit;
         Q54S.Close;
      end;

   {=================================================================}
   {=================== REGISTRO TIPO 60  ===========================}
   {=================================================================}
   if (Check60M.Checked) or (Check60A.Checked) or (Check60D.Checked) or (Check60I.Checked) then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         q60M.Close;
         Q60M.Parambyname('dataini').AsDate   := edtdataini.Date;
         Q60M.Parambyname('datafin').AsDate   := Edtdatafin.Date;
         Q60M.ParamByName('codemp').AsInteger := iEmp;
         Q60M.open;
         Q60M.First;
         while not Q60M.Eof do
            begin
               try
                   inc(iReg60);
                   TThread.Synchronize( nil, procedure begin EdtRegistro.Text:= 'Reg.:60M' + '  ' + Q60MDATA.AsString +  '   NS.: ' + Q60MR01_NUMERO_SERIE.AsString;
                   EdtRegistro.Refresh;end );
                   Q60A.Close;
                   Q60A.ParamByName('codigo').AsInteger:= Q60MCODIGO.AsInteger;
                   Q60A.Open;
                   Q60A.First;
                   TotBruto := 0;
                   while not Q60A.Eof do
                      begin
                         TotBruto := TotBruto + Q60AVALOR.AsCurrency;
                         Q60A.Next;
                      end;
                   Q60A.First;
                   if Q60MCOO_INICIAL.AsInteger = 0 then
                      begin
                         Q60I.Close;
                         Q60I.ParamByName('data').AsDate:= Q60MDATA.AsDateTime;
                         Q60I.ParamByName('codcai').AsInteger:= Q60MCHECKOUT.AsInteger;
                         Q60I.ParamByName('codemp').AsInteger:= iEmp;
                         Q60I.Open;
                         Q60I.First;
                      end;
                   sAux:= Registro_60M(Q60MDATA.AsString,
                                      Q60MR01_NUMERO_SERIE.AsString,
                                      Q60MCHECKOUT.AsString,
                                      IfThen( ( Q60MCOO_INICIAL.AsInteger > 0 ),
                                       Q60MCOO_INICIAL.AsString,
                                       Q60ICUPOM_FISCAL_VEN.AsString
                                       ),
                                      Q60MCOO_FINAL.AsString,
                                      Q60MCONT_REDUCAO.AsString,
                                      Q60MCONTADOR_REINICIO_OPERACAO.AsString,
                                      currtostrf(TotBruto{Q60MGT_FINAL.AsCurrency - Q60MGT_INICIAL.AsCurrency}, ffnumber, 2),
                                      currtostrf(Q60MGT_FINAL.AsCurrency, ffnumber, 2));
                   writeln(f, sAux);

                   { REGISTRO TIPO 60 (A) }

                   while not Q60A.Eof do
                      begin
                         try
                             if Q60AVALOR.AsCurrency > 0 then
                                begin
                                   if trim(Q60AINDICE_R03.AsString) <> 'OPNF' then
                                      begin
                                         inc(iReg60);
                                         TThread.Synchronize( nil, procedure begin EdtRegistro.Text:= 'Reg.:60A' + '  ' + Q60MDATA.AsString +  '   NS.: ' + Q60MR01_NUMERO_SERIE.AsString;
                                         EdtRegistro.Refresh; end );
                                         sAux:= Registro_60A(Q60MDATA.AsString,
                                                             Q60MR01_NUMERO_SERIE.AsString,
                                                             Q60ATIPO_GRP.AsString,
                                                             Q60AICMS_SERVICO_GRP.AsString,
                                                             currtostrf(Q60AALIQUOTA_GRP.AsCurrency, ffnumber, 2),
                                                             currtostrf(Q60AVALOR.AsCurrency, ffnumber, 2));
                                         Writeln(f, sAux);

                                         { REGISTRO TIPO 60 (D) }
                                      end;
                                end;
                         finally
                           Q60A.Next;
                         end;

                      end;

                     if Check60D.Checked then
                        begin
                           Q60D.Close;
                           Q60D.ParamByName('data').AsDate      := Q60MDATA.AsDateTime;
                           Q60D.ParamByName('codcai').AsInteger := Q60MCHECKOUT.AsInteger;
                           Q60D.ParamByName('codemp').AsInteger := iEmp;
    //                       Q60D.ParamByName('codgrp').AsInteger := Q60ACOD_GRP.AsInteger;
                           Q60D.Open;
                           Q60D.First;
                           while not Q60D.Eof do
                              begin
                                try
                                     inc(iReg60);
                                     TThread.Synchronize( nil, procedure begin EdtRegistro.Text:= 'Reg.:60D' + '  ' + Q60DDATA_VEN.AsString +  '   NS.: ' + Q60MR01_NUMERO_SERIE.AsString;
                                     EdtRegistro.Refresh;end );
                                     if Q60DQUANT.AsCurrency > 0 then
                                        cAuxQuant:= Q60DQUANT.AsCurrency
                                     else
                                        cAuxQuant:= 1;

                                     if Q60DVALOR.AsCurrency > 0 then
                                        cAuxValor:= Q60DVALOR.AsCurrency
                                     else
                                        cAuxValor:= 0.01;

                                     if Q60AALIQUOTA_GRP.AsCurrency > 0 then
                                        begin
                                           cAuxBase:= cAuxValor;
                                           cAuxICMS:= ((cAuxValor * Q60AALIQUOTA_GRP.AsCurrency) / 100);
                                           if cAuxICMS < 0.01 then
                                              cAuxICMS:= 0.01;
                                        end
                                     else
                                        begin
                                           cAuxBase:= 0;
                                           cAuxICMS:= 0;
                                        end;

                                     sAux:= Registro_60D(Q60DDATA_VEN.AsString,
                                                         Q60MR01_NUMERO_SERIE.AsString,
                                                         Q60DCOD_PRO.AsString,
                                                         CurrToStrF(cAuxQuant, ffnumber, 3),
                                                         CurrToStrF(cAuxValor, ffnumber, 2),
                                                         CurrToStrF(cAuxBase, ffnumber, 2),
                                                         Q60ATIPO_GRP.AsString,
                                                         Q60AICMS_SERVICO_GRP.AsString,
                                                         CurrToStrF(Q60AALIQUOTA_GRP.AsCurrency, ffnumber, 2),
                                                         CurrToStrF(cAuxICMS, ffnumber, 2));
                                     Writeln(f, sAux);
                                 finally
                                   Q60D.Next;
                                 end;
                              end;
                        end;


                   { REGISTRO TIPO 60 (I) }
                   if Check60I.Checked then
                      begin
                         if  Q60MCOO_INICIAL.AsInteger > 0 then
                           begin
                               Q60I.Close;
                               Q60I.ParamByName('data').AsDate:= Q60MDATA.AsDateTime;
                               Q60I.ParamByName('codcai').AsInteger:= Q60MCHECKOUT.AsInteger;
                               Q60I.ParamByName('codemp').AsInteger:= iEmp;
                               Q60I.Open;
                               Q60I.First;
                           end;
                         Q60I.First;
                         while not Q60I.Eof do
                            begin
                               inc(iReg60);
                               TThread.Synchronize( nil, procedure begin EdtRegistro.Text:= 'Reg.:60I' + '  ' + Q60IDATA_VEN.AsString +  '    ' + Q60ICUPOM_FISCAL_VEN.AsString + '-' + Q60IORDEM.AsString;
                               EdtRegistro.Refresh;end );

                               if (Q60ICUPOM_FISCAL_VEN.IsNull) or (Q60ICUPOM_FISCAL_VEN.AsInteger = 0) then
                                  begin
                                     memo.Lines.Add('Venda - ' + Q60ICOD_VEN.AsString + '  ' + Q60IDATA_VEN.AsString + '  sem COO');
                                  end;

                               if Q60IQUANT.AsCurrency > 0 then
                                  cAuxQuant:= Q60IQUANT.AsCurrency
                               else
                                  cAuxQuant:= 1;

                               if Q60IVALOR.AsCurrency > 0 then
                                  cAuxValor:= Q60IVALOR.AsCurrency
                               else
                                  cAuxValor:= 0.01;

                               if Q60IALIQUOTA_GRP.AsCurrency > 0 then
                                  cAuxBase:= cAuxValor
                               else
                                  cAuxBase:= 0;

                               sAux:= Registro_60I(Q60IDATA_VEN.AsString,
                                                   Q60MR01_NUMERO_SERIE.AsString,
                                                   Q60ICUPOM_FISCAL_VEN.AsString,
                                                   Q60IORDEM.AsString,
                                                   Q60ICOD_PRO.AsString,
                                                   CurrToStrF(cAuxQuant, ffnumber, 3),
                                                   CurrToStrF(cAuxValor, ffnumber, 2),
                                                   CurrToStrF(cAuxBase, ffnumber, 2),
                                                   currtostrf(((cAuxValor * Q60IALIQUOTA_GRP.AsCurrency) / 100), ffnumber, 2),
                                                   Q60ITIPO_GRP.AsString,
                                                   Q60IICMS_SERVICO_GRP.AsString,
                                                   currtostrf(Q60IALIQUOTA_GRP.AsCurrency, ffnumber, 2));
                               Writeln(f, sAux);
                               Q60I.Next;

                            end;
                      end;
               finally
                 Q60M.Next;
               end;

            end;
         dm.IBTransaction.Commit;
         Q60M.Close;
         Q60A.Close;
         Q60D.Close;
         q60i.close;
      end;

   if Check60R.Checked then
      begin 
         { REGISTRO TIPO 60 (R) }
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         Q60R.Close;
         Q60R.ParamByName('dataini').AsDate  := Edtdataini.Date;
         Q60R.ParamByName('datafin').AsDate  := Edtdatafin.Date;
         Q60R.ParamByName('codemp').AsInteger:= iEmp;
         Q60R.Open;
         while not Q60R.Eof do
            begin 
               inc(iReg60);

               if trim(Q60RTIPO_GRP.AsString) = 'TRI' then
                  cAuxBase:= Q60RVALOR.AsCurrency
               else
                  cAuxBase:= 0;

               TThread.Synchronize( nil, procedure begin EdtRegistro.Text:= 'Reg.:60R' + '  ' + 'Produto: ' + Q60RCOD_PRO.AsString;
               EdtRegistro.Refresh;end );
               sAux:= Registro_60R(datetostr(Edtdataini.Date),
                                   Q60RCOD_PRO.AsString,
                                   CurrToStrF(Q60RQUANT.AsCurrency, ffnumber, 3),
                                   CurrToStrF(Q60RVALOR.AsCurrency, ffnumber, 2),
                                   CurrToStrF(cAuxBase, ffnumber, 2),
                                   Q60RTIPO_GRP.AsString,
                                   Q60RICMS_SERVICO_GRP.AsString,
                                   CurrToStrF(Q60RALIQUOTA_GRP.AsCurrency, ffnumber, 2));
               Writeln(f, sAux);
               Q60R.Next;

            end;
         Q60R.Close;
         dm.IBTransaction.Commit;
      end;

   {=================================================================}
   {========================= REGISTRO TIPO 61 ======================}
   {=================================================================}
   if Check61.Checked then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         Q61.Close;
         Q61.ParamByName('dataini').AsDate  := Edtdataini.Date;
         Q61.ParamByName('datafin').AsDate  := Edtdatafin.Date;
         Q61.ParamByName('codemp').AsInteger:= iEmp;
         Q61.Open;
         while not Q61.Eof do
            begin 
               Inc(iReg61);
               sAux:= Registro_61(Q61DATA.AsString,
                                  Q61CODIFICACAO_FISCAL.AsString,
                                  Q61SERIE_NOTA.AsString,
                                  ' ',
                                  Q61NUMERO_NOTA.AsString,
                                  Q61NUMERO_NOTA_FINAL.AsString,
                                  currtostrf(Q61VALOR_TOTAL.AsCurrency, ffnumber, 2),
                                  currtostrf(Q61BASE_CALCULO.AsCurrency, ffnumber, 2),
                                  currtostrf(Q61VALOR_ICMS.AsCurrency, ffnumber, 2),
                                  currtostrf(Q61ISENTA_NAO_TRIBUTADA.AsCurrency, ffnumber, 2),
                                  currtostrf(Q61OUTRAS.AsCurrency, ffnumber, 2),
                                  currtostrf(Q61ALIQUOTA.AsCurrency, ffnumber, 2));
               writeln(f, sAux);
               Q61.next;

            end;
         dm.IBTransaction.Commit;
         Q61.Close;

      end;

   {=================================================================}
   {======================== REGISTRO TIPO 61R ======================}
   {=================================================================}
   if Check61R.Checked then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         Q61R.Close;
         Q61R.ParamByName('dataini').AsDate  := Edtdataini.Date;
         Q61R.ParamByName('datafin').AsDate  := Edtdatafin.Date;
         Q61R.ParamByName('codemp').AsInteger:= iEmp;
         Q61R.Open;
         while not Q61R.Eof do
            begin 
               Inc(iReg61);
               if trim(Q61RTIPO_GRP.AsString) = 'TRI' then
                  cAuxBase:= Q61RVALOR.AsCurrency
               else
                  cAuxBase:= 0;
               sAux:= Registro_61R(Q61RDATA_VEN.AsString,
                                   Q61RCODIGO_BARRA_PRO.AsString,
                                   currtostrf(Q61RQUANT.AsCurrency, ffnumber, 3),
                                   currtostrf(Q61RVALOR.AsCurrency, ffnumber, 2),
                                   CurrToStrF(cAuxBase, ffnumber, 2),
                                   currtostrf(Q61RALIQUOTA_GRP.AsCurrency, ffnumber, 2));
               writeln(f, sAux);
               Q61R.next;

            end;
         dm.IBTransaction.Commit;
         Q61R.Close;

      end;

   {=================================================================}
   {====================== REGISTRO TIPO 70 =========================}
   {=================================================================}
   if Check70.Checked then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         Q70.Close;
         Q70.ParamByName('dataini').AsDate  := Edtdataini.Date;
         Q70.ParamByName('datafin').AsDate  := Edtdatafin.Date;
         Q70.ParamByName('codemp').AsInteger:= iEmp;
         Q70.Open;
         while not Q70.Eof do
            begin 
               Inc(iReg70);
               sAux:= Registro_70(Q70CNPJ.AsString,
                                  Q70INSCRICAO.AsString,
                                  Q70DATA.AsString,
                                  Q70UF.AsString,
                                  Q70CODIFICACAO_FISCAL.AsString,
                                  Q70SERIE_NOTA.AsString,
                                  Q70SUB_SERIE.AsString,
                                  Q70NUMERO_NOTA.AsString,
                                  Q70CFOP.AsString,
                                  currtostrf(Q70VALOR_TOTAL.AsCurrency, ffnumber, 2),
                                  currtostrf(Q70BASE_CALCULO.AsCurrency, ffnumber, 2),
                                  currtostrf(Q70VALOR_ICMS.AsCurrency, ffnumber, 2),
                                  currtostrf(Q70ISENTA_NAO_TRIBUTADA.AsCurrency, ffnumber, 2),
                                  currtostrf(Q70OUTRAS.AsCurrency, ffnumber, 2),
                                  Q70CIF_FOB.AsString,
                                  Q70SITUACAO.AsString);
               writeln(f, sAux);
               Q70.next;

            end;
         dm.IBTransaction.Commit;
         Q70.Close;

      end;

   {=================================================================}
   {====================== REGISTRO TIPO 74 =========================}
   {=================================================================}
   if Check74.Checked then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         q74.Close;
         q74.ParamByName('cod').AsInteger:= iCodInventario;
         q74.open;
         while not q74.Eof do
            begin 
               inc(iReg74);
               TThread.Synchronize( nil, procedure begin EdtRegistro.Text:= 'Reg.:74' + '  ' + 'Produto: ' + Q74COD_PRO.AsString;end );
               sAux:= Registro_74(datetostr(Edtdatafin.Date),
                                  Q74COD_PRO.AsString,
                                  currtostrf(Q74QUANT.AsCurrency, ffnumber, 3),
                                  currtostrf(Q74QUANT.AsCurrency * Q74CUSTO.AsCurrency, ffnumber, 2));
               Writeln(f, sAux);
               Q74.Next;

            end;
         Q74.Close;
         dm.IBTransaction.Commit;

      end;

   {=================================================================}
   {====================== REGISTRO TIPO 75 =========================}
   {=================================================================}
   if Check75.Checked then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         Q75.Close;
         Q75.ParamByName('dataini').AsDate      := Edtdataini.Date;
         Q75.ParamByName('datafin').AsDate      := Edtdatafin.Date;
         Q75.ParamByName('codinvent').AsInteger := iCodInventario;
         Q75.ParamByName('codemp').AsInteger    := iEmp;
         Q75.Open;
         while not Q75.Eof do
            begin 

               inc(iReg75);
               TThread.Synchronize( nil, procedure begin EdtRegistro.Text:= 'Reg.:75' + '  ' + 'Produto: ' + Q75COD_PRO.AsString;
               EdtRegistro.Refresh; end );
               sAux:= Registro_75(datetostr(Edtdataini.Date),
                                  datetostr(Edtdatafin.Date),
                                  Q75COD_PRO.AsString,
                                  Q75COD_NCM.AsString,
                                  Q75NOME_PRO.AsString,
                                  Q75DESCRICAO.AsString,
                                  currtostrf(Q75ALIQUOTA_GRP.AsCurrency, ffnumber, 2));
               Writeln(f, sAux);
               Q75.Next;

            end;
         Q75.Close;
         dm.IBTransaction.Commit;
      end;

   {=================================================}
   {================ REGISTRO TIPO 90 ===============}
   {=================================================}
   iReg90:= 1;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QConsulta do
      begin 
         close;
         sql.Clear;
         sql.Add('SELECT CNPJ_EMP, INSC_EMP FROM EMPRESA WHERE COD_EMP = :CODEMP');
         Parambyname('CODEMP').AsInteger := iEmp;
         Open;
      end;

   { TOTALIZANDO OS REGISTRO }
   sAuxTotalReg:= '';
   if iReg50 > 0 then
      sAuxTotalReg:= '50' + FormataStringD(inttostr(iReg50), '8', '0');

   if iReg54 > 0 then
      sAuxTotalReg:= sAuxTotalReg + '54' + FormataStringD(inttostr(iReg54), '8', '0');

   if iReg60 > 0 then
      sAuxTotalReg:= sAuxTotalReg + '60' + FormataStringD(inttostr(iReg60), '8', '0');

   if iReg61 > 0 then
      sAuxTotalReg:= sAuxTotalReg + '61' + FormataStringD(inttostr(iReg61), '8', '0');

   if iReg70 > 0 then
      sAuxTotalReg:= sAuxTotalReg + '70' + FormataStringD(inttostr(iReg70), '8', '0');

   if iReg74 > 0 then
      sAuxTotalReg:= sAuxTotalReg + '74' + FormataStringD(inttostr(iReg74), '8', '0');

   if iReg75 > 0 then
      sAuxTotalReg:= sAuxTotalReg + '75' + FormataStringD(inttostr(iReg75), '8', '0');

   if iReg90 > 0 then
      sAuxTotalReg:= sAuxTotalReg + '99' + FormataStringD(inttostr(2 + iReg50 + iReg54 + iReg60 + iReg61 + iReg70 + iReg74 + iReg75 + iReg90), '8', '0');

   sAux:= Registro_90(dm.QConsulta.Fieldbyname('CNPJ_EMP').AsString,
                      dm.QConsulta.FieldByName('INSC_EMP').AsString,
                      sAuxTotalReg,
                      inttostr(iReg90));
   write(f, sAux);

   dm.IBTransaction.Commit;
   dm.QConsulta.Close;
  TThread.Synchronize( nil,
          procedure
             begin
                AlertaCad('Arquivo Criado com Êxito');
             end
          );

{   AcbrSintegra.FileName := SaveDialog.FileName + '.acbr' ;
   AcbrSintegra.GeraArquivo;}
   { Finaliza o arquivo }
   closefile(f);


end;

procedure TFrmSintegra.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmSintegra.VerificaNotaFiscal(CNPJ, Nota, Linha : string);
var sAuxCNPJ : string;
begin 
   sAuxCNPJ:= FormataCNPJ(cnpj);
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.add('SELECT F.RAZAO_FOR ' +
                     'FROM ENTRADAS E ' +
                     'INNER JOIN FORNECEDOR F ' +
                     'ON (E.COD_FOR = F.COD_FOR) ' +
                     'WHERE F.CNPJ_FOR = ' + #39 + sAuxCNPJ + #39 +
                     ' AND E.NUMNF_ENT = ' + #39 + Nota + #39);
             Open;
             if fieldbyname('razao_for').IsNull then
                memo.Lines.Add(sAuxCNPJ + ' ' + Nota +  ' Linha: ' + Linha);
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao verificar');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmSintegra.Button1Click(Sender: TObject);
begin 
   WinExec(pansichar(sCaminhoValidador), sw_show);
end;



end.
