unit UVendasPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, DB, ACBrSpedFiscal, ACBrEFDBlocos, 
  UDialog, ACBrSintegra, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmVendasPeriodo = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    BtnOK: TButton;
    BtnSair: TButton;
    GroupBox1: TGroupBox;
    EdtDataFin: TDateTimePicker;
    EdtDataIni: TDateTimePicker;
    Q60M: TFDQuery;
    Q60A: TFDQuery;
    Q60D: TFDQuery;
    Q60I: TFDQuery;
    Q60R: TFDQuery;
    Q61R: TFDQuery;
    Q61: TFDQuery;
    Q75: TFDQuery;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
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
    Q60MCODIGO_PAF: TIntegerField;
    Q60MR01_NUMERO_SERIE: TStringField;
    Q60ACODIGO: TIntegerField;
    Q60ACOD_GRP: TIntegerField;
    Q60AVALOR: TBCDField;
    Q60ACOD_EMP: TIntegerField;
    Q60AINDICE_R03: TStringField;
    Q60ACODIGO_LIVRO_FISCAL: TIntegerField;
    Q60AORDEM_LIVRO_FISCAL: TIntegerField;
    Q60ASTATUS_EXPORTA: TIntegerField;
    Q60AALIQUOTA_GRP: TBCDField;
    Q60ATIPO_GRP: TStringField;
    Q60AICMS_SERVICO_GRP: TStringField;
    Q60DDATA_VEN: TDateField;
    Q60DCOD_PRO: TIntegerField;
    Q60DQUANT: TBCDField;
    Q60DVALOR: TFloatField;
    Q60DCODIGO_BARRA_PRO: TStringField;
    Q60IORDEM: TIntegerField;
    Q60IQUANT: TBCDField;
    Q60IVALOR: TFMTBCDField;
    Q60IDATA_VEN: TDateField;
    Q60ICODIGO_BARRA_PRO: TStringField;
    Q60ICUPOM_FISCAL_VEN: TIntegerField;
    Q60ICOD_VEN: TIntegerField;
    Q60ITIPO_GRP: TStringField;
    Q60IALIQUOTA_GRP: TBCDField;
    Q60IICMS_SERVICO_GRP: TStringField;
    Q60RCOD_PRO: TIntegerField;
    Q60RQUANT: TBCDField;
    Q60RVALOR: TFMTBCDField;
    Q60RTIPO_GRP: TStringField;
    Q60RALIQUOTA_GRP: TBCDField;
    Q60RICMS_SERVICO_GRP: TStringField;
    Q60RCODIGO_BARRA_PRO: TStringField;
    Q61RQUANT: TBCDField;
    Q61RVALOR: TFMTBCDField;
    Q61RCOD_PRO: TIntegerField;
    Q61RTIPO_GRP: TStringField;
    Q61RALIQUOTA_GRP: TBCDField;
    Q61RDATA_VEN: TDateField;
    Q61RCODIGO_BARRA_PRO: TStringField;
    Q75COD_PRO: TIntegerField;
    Q75CODIGO_BARRA_PRO: TStringField;
    Q75NOME_PRO: TStringField;
    Q75COD_NCM: TStringField;
    Q75ALIQUOTA_GRP: TBCDField;
    Q75DESCRICAO: TStringField;
    Sped1: TACBrSPEDFiscal;
    Sintegra1: TACBrSintegra;
    Q60MVENDA_BRUTA: TBCDField;
    Q60MCODIFICACAO_FISCAL: TStringField;
    Q61DATA_VEN: TDateField;
    Q61SUM: TBCDField;
    Q61MIN: TIntegerField;
    Q61MAX: TIntegerField;
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
    Q50SCODIFICACAO_FISCAL: TStringField;
    Q50SCST: TStringField;
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
    Q54SCLASSIFICACAO_FISCAL: TStringField;
    Q54SNUMERO_NOTA_FINAL: TIntegerField;
    Q54SISENTAS: TBCDField;
    Q54SOUTRAS: TBCDField;
    Q54SCODIGO_MAPA_RESUMO: TIntegerField;
    Q54SCODIFICACAO_FISCAL: TStringField;
    Q54SDESC_CUPOM: TStringField;
    Q60ATOT_OUTRO: TFMTBCDField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnOKClick(Sender: TObject);


    procedure GeraEFD2;
    procedure GeraSintegra2;
    procedure FormShow(Sender: TObject);

    // FUNCOES DE CONVERSAO EFD
    function ProcessaChave( Chave: String ): string;
    function BuscaPag(COD_NF: Integer): TACBrTipoPagamento;
    function BuscaValorC490( Data: TDateTime; grupo: Integer ): Currency;
    function TotalBT60M( COD: Integer): Currency;
    procedure FormCreate(Sender: TObject);
    procedure AtualizaValorN( Valor: Currency );
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVendasPeriodo: TFrmVendasPeriodo;

implementation

uses
  Udm, Ubibli1;

{$R *.dfm}

procedure TFrmVendasPeriodo.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmVendasPeriodo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmVendasPeriodo.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmVendasPeriodo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
    close;
end;

procedure TFrmVendasPeriodo.AtualizaValorN(Valor: Currency);
var
  I: Integer;
begin

end;

procedure TFrmVendasPeriodo.BtnOKClick(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
    GeraSintegra2
  else
     GeraEFD2;
    //GeraEFD;
end;



procedure TFrmVendasPeriodo.GeraSintegra2;
var
  Arquivo: textfile;
  sAux: string;
  iReg60, iReg61, iReg75, iReg90: integer;
  i: integer;
  sAuxTotalReg: string;
  cAuxQuant: currency;
  cAuxValor: currency;
  cAuxICMS: currency;
  cAuxBase: currency;
  sAuxNomeArq: string;
  wregistro50: TRegistro50;
  wregistro54: TRegistro54;
  wregistro75: TRegistro75;
  wregistro60M: TRegistro60M;
  wregistro60A: TRegistro60A;
  wregistro60D: TRegistro60D;
  wregistro61: TRegistro61;
  wregistro61R: TRegistro61R;
  wRegistro60I: TRegistro60I;
  wRegistro60R: TRegistro60R;
  ValorOutros: Currency;
  Tot60a: Currency;
  JaFoiOutros: Boolean;
begin
   if EdtDataFin.Date < EdtDataIni.Date then
      begin
          showmessage('A data final não pode ser menor que a data inicial');
          EdtDataFin.SetFocus;
        exit;
  end;

  { Inicializa o arquivo }
  sAuxNomeArq := dm.ACBrAAC1.IdentPAF.NumeroLaudo + FormatDateTime('ddmmyyyyhhmmss', now) + '.txt';
  //
  Sintegra1.FileName := sAuxNomeArq;
  Sintegra1.LimparRegistros;

  { BUSCA OS DADOS DA EMPRESA }
  if dm.IBTRServer.Active then
    dm.IBTRServer.Commit;
  dm.IBTRServer.StartTransaction;
  with dm.QConsultaServer do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT * FROM EMPRESA WHERE COD_EMP = :CODEMP');
    Parambyname('CODEMP').AsInteger := iEmp;
    Open;
  end;

  { ================================================================= }
  { ====================== REGISTRO TIPO 10 ========================= }
  { ================================================================= }
  Sintegra1.Registro10.CNPJ :=  RetiraCaracter( dm.QConsultaServer.fieldbyname('CNPJ_EMP').AsString );
  Sintegra1.Registro10.Inscricao := RetiraCaracter( dm.QConsultaServer.fieldbyname('INSC_EMP').AsString);
  Sintegra1.Registro10.RazaoSocial :=  dm.QConsultaServer.fieldbyname('RAZAO_EMP').AsString;
  Sintegra1.Registro10.Cidade := dm.QConsultaServer.fieldbyname('CID_EMP').AsString;
  Sintegra1.Registro10.Estado := dm.QConsultaServer.fieldbyname('EST_EMP').AsString;
  Sintegra1.Registro10.Telefone := RetiraCaracter( dm.QConsultaServer.fieldbyname('FAX_EMP').AsString );
  Sintegra1.Registro10.DataInicial := EdtDataIni.DateTime;
  Sintegra1.Registro10.DataFinal := EdtDataFin.DateTime;
  Sintegra1.Registro10.CodigoConvenio := '3';
  Sintegra1.Registro10.NaturezaInformacoes := '3';
  Sintegra1.Registro10.FinalidadeArquivo := '1';

  { ================================================================= }
  { ====================== REGISTRO TIPO 11 ========================= }
  { ================================================================= }
  Sintegra1.Registro11.Endereco := dm.QConsultaServer.fieldbyname('END_EMP').AsString;
  Sintegra1.Registro11.Numero := dm.QConsultaServer.fieldbyname('NUMERO_EMP').AsString;
  Sintegra1.Registro11.Bairro := dm.QConsultaServer.fieldbyname('BAI_EMP').AsString;
  Sintegra1.Registro11.Cep := RetiraCaracter( dm.QConsultaServer.fieldbyname('CEP_EMP').AsString );
  Sintegra1.Registro11.Responsavel := dm.QConsultaServer.fieldbyname('RESP_EMP').AsString;
  Sintegra1.Registro11.Telefone := RetiraCaracter(dm.QConsultaServer.fieldbyname('TEL_EMP').AsString);

  dm.IBTRServer.Commit;
  dm.QConsultaServer.close;

   {=================================================================}
   {=================== REGISTRO TIPO 50 NOTAS EMITIDAS =============}
   {=================================================================}


          if dm.IBTRServer.Active then
            dm.IBTRServer.Commit;
          dm.IBTRServer.StartTransaction;
         Q50S.Close;
         Q50S.ParamByName('dataini').AsDate   := Edtdataini.Date;
         Q50S.ParamByName('datafin').AsDate   := Edtdatafin.Date;
         Q50S.ParamByName('codemp').AsInteger := iEmp;
         Q50S.Open;

         while not Q50S.Eof do
            begin
               if trim(Q50SREGISTRADO_ECF.AsString) = 'N' then
                  begin
  {=================================================================}
   {===================== ACBR TIPO 50 NOTAS EMITIDAS =================}
   {=================================================================}

                     wregistro50 := TRegistro50.Create;
                     wregistro50.CPFCNPJ := Q50SCNPJ.AsString;
                     wregistro50.Inscricao := Q50SINSCRICAO.AsString;
                     wregistro50.DataDocumento :=  Q50SDATA.AsDateTime;
                     wregistro50.UF := Q50SUF.AsString;
                     wregistro50.Modelo := Q50SCODIFICACAO_FISCAL.AsString;
                     wregistro50.Serie := Q50SSERIE_NOTA.AsString;
                     wregistro50.Numero := Q50SNUMERO_NOTA.AsString;
                     wregistro50.Cfop :=  Q50SCFOP.AsString;
                     wregistro50.EmissorDocumento := Q50SEMITENTE.AsString;
                     wregistro50.ValorContabil :=  Q50SVALOR_TOTAL.AsCurrency;
                     wregistro50.BasedeCalculo := Q50SBASE_CALCULO.AsCurrency;
                     wregistro50.Icms :=  Q50SVALOR_ICMS.AsCurrency;
                     wregistro50.Isentas :=  Q50SISENTA_NAO_TRIBUTADA.AsCurrency;
                     wregistro50.Outras :=  Q50SOUTRAS.AsCurrency;
                     wregistro50.Aliquota := Q50SALIQUOTA.AsCurrency;
                     wregistro50.Situacao :=  Q50SSITUACAO.AsString;
                     Sintegra1.Registros50.Add( wregistro50 );

                  end
               else
                  begin

                     wregistro50 := TRegistro50.Create;
                     wregistro50.CPFCNPJ := Q50SCNPJ.AsString;
                     wregistro50.Inscricao := Q50SINSCRICAO.AsString;
                     wregistro50.DataDocumento :=  Q50SDATA.AsDateTime;
                     wregistro50.UF := Q50SUF.AsString;
                     wregistro50.Modelo := Q50SCODIFICACAO_FISCAL.AsString;
                     wregistro50.Serie := Q50SSERIE_NOTA.AsString;
                     wregistro50.Numero := Q50SNUMERO_NOTA.AsString;
                     wregistro50.Cfop :=  Q50SCFOP.AsString;
                     wregistro50.EmissorDocumento := Q50SEMITENTE.AsString;
                     wregistro50.ValorContabil :=  0;
                     wregistro50.BasedeCalculo := 0;
                     wregistro50.Icms :=  0;
                     wregistro50.Isentas :=  0;
                     wregistro50.Outras :=  0;
                     wregistro50.Aliquota := 0;
                     wregistro50.Situacao :=  Q50SSITUACAO.AsString;
                     Sintegra1.Registros50.Add( wregistro50 );

                  end;

               Q50S.Next; Application.ProcessMessages;
            end;
         dm.IBTRServer.Commit;
         Q50S.Close;



          if dm.IBTRServer.Active then
            dm.IBTRServer.Commit;
          dm.IBTRServer.StartTransaction;
         Q54S.Close;
         Q54S.ParamByName('dataini').AsDate  := Edtdataini.Date;
         Q54S.ParamByName('datafin').AsDate  := Edtdatafin.Date;
         Q54S.ParamByName('codemp').AsInteger:= iEmp;
         Q54S.Open;
         while not Q54S.Eof do
            begin
               wregistro54 := TRegistro54.Create;
               wregistro54.CPFCNPJ := Q54SCNPJ.AsString;
               wregistro54.Modelo := Q54SCODIFICACAO_FISCAL.AsString;
               wregistro54.Serie := Q54SSERIE_NOTA.AsString;
               wregistro54.Numero :=  Q54SNUMERO_NOTA.AsString;
               wregistro54.CFOP := Q54SCOD_CFO.AsString;
               wregistro54.CST := Q54SCST.AsString;
               wregistro54.NumeroItem :=  Q54SORDEM.AsInteger;
               wregistro54.Codigo := Q54SCOD_PRO.AsString;
               wregistro54.Descricao := Q54SDESC_CUPOM.AsString;
               wregistro54.Quantidade := Q54SQUANT.AsCurrency;
               wregistro54.Valor := Q54SQUANT.AsCurrency * Q54SUNIT.AsCurrency;
               wregistro54.ValorDescontoDespesa := 0;
               wregistro54.BasedeCalculo := Q54SBASE_CALCULO.AsCurrency;
               wregistro54.BaseST := 0;
               wregistro54.ValorIpi := (((Q54SQUANT.AsCurrency * Q54SUNIT.AsCurrency) * Q54SALIQ_IPI.AsCurrency) / 100);
               wregistro54.Aliquota :=  Q54SALIQ.AsCurrency;
               Sintegra1.Registros54.Add( wregistro54 );


               Q54S.Next; Application.ProcessMessages;
            end;
          dm.IBTRServer.Commit;
         Q54S.Close;

  { ================================================================= }
  { =================== REGISTRO TIPO 60  =========================== }
  { ================================================================= }
  if dm.IBTRServer.Active then
    dm.IBTRServer.Commit;
  dm.IBTRServer.StartTransaction;
  Q60M.close;
  Q60M.Parambyname('dataini').AsDate := EdtDataIni.Date;
  Q60M.Parambyname('datafin').AsDate := EdtDataFin.Date;
  Q60M.Parambyname('codemp').AsInteger := iEmp;
  Q60M.Open;
  while not Q60M.Eof do
  begin
    wregistro60M := TRegistro60M.Create;
    wregistro60M.Emissao := Q60MDATA.AsDateTime;
    wregistro60M.NumSerie := Q60MR01_NUMERO_SERIE.AsString;
    wregistro60M.NumOrdem := Q60MCHECKOUT.AsInteger;
    wregistro60M.ModeloDoc := '2D';
    wregistro60M.CooInicial :=   Q60MCOO_INICIAL.AsInteger;
    wregistro60M.CooFinal := Q60MCOO_FINAL.AsInteger;
    wregistro60M.CRZ := Q60MCONT_REDUCAO.AsInteger;
    wregistro60M.CRO := Q60MCONTADOR_REINICIO_OPERACAO.AsInteger;
    wregistro60M.VendaBruta := TotalBT60M( Q60MCODIGO.AsInteger );
    wregistro60M.ValorGT :=  Q60MGT_FINAL.AsCurrency;
    Sintegra1.Registros60M.Add( wregistro60M );


    { REGISTRO TIPO 60 (A) }
//    Q60A.close;
  //  Q60A.Parambyname('codigo').AsInteger := Q60MCODIGO.AsInteger;
   // Q60A.Open;
{    Q60A.First;
    Tot60a := 0;
    while not Q60A.Eof do
       begin
          Tot60a := Tot60a + Q60AVALOR.AsCurrency;
          Q60A.Next;
       end;
    ValorOutros := Q60MVENDA_BRUTA.AsCurrency - Tot60a;
    Q60A.First;
      if ValorOutros > 0 then
          begin
             wregistro60A := TRegistro60A.Create;
             wregistro60A.Emissao := Q60MDATA.AsDateTime;
             wregistro60a.NumSerie := Q60MR01_NUMERO_SERIE.AsString;
             wregistro60A.StAliquota:= 'N   ';
             wregistro60A.Valor := ValorOutros;
             Sintegra1.Registros60A.Add( wregistro60A );
             JaFoiOutros := True;
          end;          }
    Q60A.First;
    JaFoiOutros := False;
    while not Q60A.Eof do
    begin
      if ( not JaFoiOutros ) and ( Q60ATOT_OUTRO.AsCurrency > 0 ) then
          begin
             JaFoiOutros := True;
             wregistro60A := TRegistro60A.Create;
             wregistro60A.Emissao := Q60MDATA.AsDateTime;
             wregistro60a.NumSerie := Q60MR01_NUMERO_SERIE.AsString;
             wregistro60A.StAliquota:= 'N   ';
             wregistro60A.Valor := Q60ATOT_OUTRO.AsCurrency;
             Sintegra1.Registros60A.Add( wregistro60A );
          end;
      if Q60AVALOR.AsCurrency > 0 then
      begin
        if trim(Q60AINDICE_R03.AsString) <> 'OPNF' then
        begin
           wregistro60A := TRegistro60A.Create;
             wregistro60A.Emissao := Q60MDATA.AsDateTime;
             wregistro60a.NumSerie := Q60MR01_NUMERO_SERIE.AsString;
             if Q60AICMS_SERVICO_GRP.AsString = 'S' then
                wregistro60A.StAliquota := 'ISS'
             else
                begin
                    if trim(Q60ATIPO_GRP.AsString) = 'TRI' then
                        wregistro60A.StAliquota:= FormataStringD(EliminaCaracter(Q60AALIQUOTA_GRP.AsString), '4', '0');
                     if trim(Q60ATIPO_GRP.AsString) = 'ISE' then
                        wregistro60A.StAliquota:= 'I   '
                     else
                         if trim(Q60ATIPO_GRP.AsString) = 'ST' then
                            wregistro60A.StAliquota:= 'F   '
                         else
                           if ( trim(Q60ATIPO_GRP.AsString) = 'NT' ) or
                           (trim(Q60ATIPO_GRP.AsString) = 'OUT') then
                              wregistro60A.StAliquota:= 'N   '
                           else
                               if trim(Q60ATIPO_GRP.AsString) = 'CAN' then
                                   wregistro60A.StAliquota:= 'CANC'
                                else
                                   if trim(Q60ATIPO_GRP.AsString) = 'DES' then
                                        wregistro60A.StAliquota:= 'DESC'
                                   else
                                       if trim(Q60ATIPO_GRP.AsString) = 'ONF' then
                                            wregistro60A.StAliquota:= 'OPNF';


                end;

             wregistro60A.Valor := Q60AVALOR.AsCurrency;
           Sintegra1.Registros60A.Add( wregistro60A );
//           wregistro60A.Free;

          { REGISTRO TIPO 60 (D) }
          Q60D.close;
          Q60D.Parambyname('data').AsDate := Q60MDATA.AsDateTime;
          Q60D.Parambyname('codcai').AsInteger := Q60MCHECKOUT.AsInteger;
          Q60D.Parambyname('codemp').AsInteger := iEmp;
          Q60D.Parambyname('codgrp').AsInteger := Q60ACOD_GRP.AsInteger;
          Q60D.Open;
          while not Q60D.Eof do
          begin

            if Q60DQUANT.AsCurrency > 0 then
              cAuxQuant := Q60DQUANT.AsCurrency
            else
              cAuxQuant := 1;

            if Q60DVALOR.AsCurrency > 0 then
              cAuxValor := Q60DVALOR.AsCurrency
            else
              cAuxValor := 0.01;

            if Q60AALIQUOTA_GRP.AsCurrency > 0 then
            begin
              cAuxBase := cAuxValor;
              cAuxICMS := ((cAuxValor * Q60AALIQUOTA_GRP.AsCurrency) / 100);
              if cAuxICMS < 0.01 then
                cAuxICMS := 0.01;
            end
            else
            begin
              cAuxBase := 0;
              cAuxICMS := 0;
            end;

            wregistro60D := TRegistro60D.Create;
            wregistro60D.Emissao := Q60DDATA_VEN.AsDateTime;
            wregistro60D.NumSerie := Q60MR01_NUMERO_SERIE.AsString;
            wregistro60D.Codigo := Q60DCODIGO_BARRA_PRO.AsString;
            wregistro60D.Quantidade := cAuxQuant;
            wregistro60D.Valor := cAuxValor;
            wregistro60D.BaseDeCalculo :=  cAuxBase;
            if trim(Q60AICMS_SERVICO_GRP.AsString) = 'S' then
              wregistro60D.StAliquota:= 'ISS '
             else
                  begin
                     if trim(Q60ATIPO_GRP.AsString) = 'TRI' then
                         wregistro60D.StAliquota:= FormataStringD(EliminaCaracter(Q60AALIQUOTA_GRP.AsString), '4', '0')
                       else
                           if trim(Q60ATIPO_GRP.AsString) = 'ISE' then
                               wregistro60D.StAliquota:= 'I   '
                             else
                                 if trim(Q60ATIPO_GRP.AsString) = 'ST' then
                                     wregistro60D.StAliquota:= 'F   '
                                 else
                                     if ( trim(Q60ATIPO_GRP.AsString) = 'NT' )
                                     or ( trim(Q60ATIPO_GRP.AsString) = 'OUT' ) then
                                         wregistro60D.StAliquota:= 'N   ';
                  end;
            wregistro60D.ValorIcms := cAuxICMS;
            Sintegra1.Registros60D.Add(wregistro60D);
//            wregistro60D.Free;

            Q60D.Next; Application.ProcessMessages;
          end;
        end;
      end;
      Q60A.Next; Application.ProcessMessages;
    end;

    { REGISTRO TIPO 60 (I) }
    Q60I.close;
    Q60I.Parambyname('data').AsDate := Q60MDATA.AsDateTime;
    Q60I.Parambyname('codcai').AsInteger := Q60MCHECKOUT.AsInteger;
    Q60I.Parambyname('codemp').AsInteger := iEmp;
    Q60I.Open;
    while not Q60I.Eof do
    begin


      if Q60IQUANT.AsCurrency > 0 then
        cAuxQuant := Q60IQUANT.AsCurrency
      else
        cAuxQuant := 1;

      if Q60IVALOR.AsCurrency > 0 then
        cAuxValor := Q60IVALOR.AsCurrency
      else
        cAuxValor := 0.01;

      if Q60IALIQUOTA_GRP.AsCurrency > 0 then
        cAuxBase := cAuxValor
      else
        cAuxBase := 0;

      wRegistro60I := TRegistro60I.Create;
      wRegistro60I.Emissao := Q60IDATA_VEN.AsDateTime;
      wRegistro60I.NumSerie := Q60MR01_NUMERO_SERIE.AsString;
      wRegistro60I.ModeloDoc := '2D';
      wRegistro60I.Cupom := Q60ICUPOM_FISCAL_VEN.AsString;
      wRegistro60I.Item := Q60IORDEM.AsInteger;
      wRegistro60I.Codigo := Q60ICODIGO_BARRA_PRO.AsString;
      wRegistro60I.Quantidade := cAuxQuant;
      wRegistro60I.Valor :=  cAuxValor;
      wRegistro60I.BaseDeCalculo := cAuxBase;
      wRegistro60I.ValorIcms := (cAuxValor * Q60IALIQUOTA_GRP.AsCurrency) / 100;
       if trim(Q60IICMS_SERVICO_GRP.AsString) = 'S' then
            wRegistro60I.StAliquota:= 'ISS '
       else
            begin
               if trim(Q60ITIPO_GRP.AsString) = 'TRI' then
                    wRegistro60I.StAliquota:= FormataStringD(EliminaCaracter(Q60IALIQUOTA_GRP.AsString), '4', '0')
               else
                 if trim(Q60ITIPO_GRP.AsString) = 'ISE' then
                    wRegistro60I.StAliquota:= 'I   '
                 else
                     if trim(Q60ITIPO_GRP.AsString) = 'ST' then
                        wRegistro60I.StAliquota:= 'F   '
                     else
                         if trim(Q60ITIPO_GRP.AsString) = 'NT' then
                            wRegistro60I.StAliquota:= 'N   '
                     else
                         if trim(Q60ITIPO_GRP.AsString) = 'OUT' then
                            wRegistro60I.StAliquota:= 'N   ';

            end;

      Sintegra1.Registros60I.Add(wRegistro60I);
//      wRegistro60I.Free;
      Q60I.Next; Application.ProcessMessages;
    end;
    Q60M.Next; Application.ProcessMessages;
  end;
  dm.IBTRServer.Commit;
  Q60M.close;
  Q60A.close;
  Q60D.close;
  Q60I.close;
  if not ( Sintegra1.Registros60M.Count = 0 ) then
  begin
  { REGISTRO TIPO 60 (R) }
  if dm.IBTRServer.Active then
    dm.IBTRServer.Commit;
  dm.IBTRServer.StartTransaction;
  Q60R.close;
  Q60R.Parambyname('dataini').AsDate := EdtDataIni.Date;
  Q60R.Parambyname('datafin').AsDate := EdtDataFin.Date;
  Q60R.Parambyname('codemp').AsInteger := iEmp;
  Q60R.Open;
  while not Q60R.Eof do
  begin


    if trim(Q60RTIPO_GRP.AsString) = 'TRI' then
      cAuxBase := Q60RVALOR.AsCurrency
    else
      cAuxBase := 0;

    wRegistro60R := TRegistro60R.Create;
    wregistro60R.MesAno := FormatDateTime( 'mmyyyy', EdtDataIni.DateTime);
    wRegistro60R.Codigo := Q60RCODIGO_BARRA_PRO.AsString;
    wRegistro60R.Qtd := Q60RQUANT.AsCurrency;
    wRegistro60R.Valor := Q60RVALOR.AsCurrency;
    wRegistro60R.BaseDeCalculo :=  cAuxBase;
    if Trim( Q60RICMS_SERVICO_GRP.AsString ) = 'S' then
       wRegistro60R.Aliquota := 'ISS'
    else
    if Trim( Q60RTIPO_GRP.AsString ) = 'TRI' then
        wRegistro60R.Aliquota := FormataStringD( Q60RALIQUOTA_GRP.AsString, '4', '0' )
    else
       if Trim(Q60RTIPO_GRP.AsString) = 'ST' then
          wRegistro60R.Aliquota := 'F'
       else
           if Trim(Q60RTIPO_GRP.AsString ) = 'ISE' then
                wRegistro60R.Aliquota := 'I'
           else
               if Trim( Q60RTIPO_GRP.AsString ) = 'OUT' then
                    wRegistro60R.Aliquota := 'N';


    Sintegra1.Registros60R.Add(wRegistro60R);

    Q60R.Next; Application.ProcessMessages;
  end;
  Q60R.close;
  dm.IBTRServer.Commit;
  end;

  { ================================================================= }
  { ========================= REGISTRO TIPO 61 ====================== }
  { ================================================================= }
  if dm.IBTRServer.Active then
    dm.IBTRServer.Commit;
  dm.IBTRServer.StartTransaction;
  Q61.close;
  Q61.Parambyname('dataini').AsDate := EdtDataIni.Date;
  Q61.Parambyname('datafin').AsDate := EdtDataFin.Date;
  Q61.Parambyname('codemp').AsInteger := iEmp;
  Q61.Open;
  Q61.First;
  while not Q61.Eof do
  begin
    wregistro61 := TRegistro61.Create;
    wregistro61.Emissao :=  Q61DATA_VEN.AsDateTime;
    wregistro61.Modelo :=  '02';
    wregistro61.Serie := 'D';
    wregistro61.SubSerie := '';
    wregistro61.NumOrdemInicial := Q61MIN.AsInteger;
    wregistro61.NumOrdemFinal :=  Q61MAX.AsInteger;
    wregistro61.Valor := q61sum.AsCurrency;
    wregistro61.BaseDeCalculo := 0;
    wregistro61.ValorIcms := 0;
    wregistro61.Isentas := 0;
    wregistro61.Outras := 0;
    wregistro61.Aliquota :=  0;
    sintegra1.Registros61.Add(wregistro61);
    Q61.Next; Application.ProcessMessages;
  end;
  dm.IBTRServer.Commit;
  Q61.close;

  { ================================================================= }
  { ======================== REGISTRO TIPO 61R ====================== }
  { ================================================================= }

  if dm.IBTRServer.Active then
    dm.IBTRServer.Commit;
  dm.IBTRServer.StartTransaction;
  Q61R.close;
  Q61R.Parambyname('dataini').AsDate := EdtDataIni.Date;
  Q61R.Parambyname('datafin').AsDate := EdtDataFin.Date;
  Q61R.Parambyname('codemp').AsInteger := iEmp;
  Q61R.Open;
  Q61r.First;
  while not Q61R.Eof do
  begin

    if trim(Q61RTIPO_GRP.AsString) = 'TRI' then
      cAuxBase := Q61RVALOR.AsCurrency
    else
      cAuxBase := 0;

    wRegistro61R := TRegistro61R.Create;
    wregistro61R.MesAno := FormatDateTime( 'mmyyyy', Q61RDATA_VEN.AsDateTime );
    wregistro61R.Codigo := Q61RCODIGO_BARRA_PRO.AsString;
    wregistro61R.Qtd := Q61RQUANT.AsCurrency;
    wregistro61R.Valor :=  Q61RVALOR.AsCurrency;
    wregistro61r.BaseDeCalculo :=  cAuxBase;
    wregistro61R.Aliquota := Q61RALIQUOTA_GRP.AsCurrency;
    Sintegra1.Registros61R.Add(wRegistro61R);
    Q61R.Next; Application.ProcessMessages;
  end;
  dm.IBTRServer.Commit;
  Q61R.close;

  { ================================================================= }
  { ====================== REGISTRO TIPO 75 ========================= }
  { ================================================================= }
  if dm.IBTRServer.Active then
    dm.IBTRServer.Commit;
  dm.IBTRServer.StartTransaction;
  Q75.close;
  Q75.Parambyname('dataini').AsDate := EdtDataIni.Date;
  Q75.Parambyname('datafin').AsDate := EdtDataFin.Date;
  Q75.Parambyname('codemp').AsInteger := iEmp;
  Q75.Open;
  Q75.First;
  while not Q75.Eof do
  begin
     wregistro75 := TRegistro75.Create;
     wregistro75.DataInicial := EdtDataIni.DateTime;
     wregistro75.DataFinal := EdtDataFin.DateTime;
     wregistro75.Codigo := Q75CODIGO_BARRA_PRO.AsString;
     wregistro75.NCM := Q75COD_NCM.AsString;
     wregistro75.Descricao := Q75NOME_PRO.AsString;
     wregistro75.Unidade := Q75DESCRICAO.AsString;
     wregistro75.AliquotaICMS := Q75ALIQUOTA_GRP.AsCurrency;
     Sintegra1.Registros75.Add(wregistro75);
    Q75.Next; Application.ProcessMessages;
  end;
  Q75.close;
  dm.IBTRServer.Commit;


  try
      Sintegra1.GeraArquivo;
  except

   end;
  dm.AssinaturaDigital( ExtractFilePath( Application.ExeName ) + '\' + Sintegra1.FileName );
  KDialog( 'Arquivo gerado com sucesso!' + #13 +
  sAuxNomeArq, 'SLPDV - Vendas do Período', 'INFO' );
end;

procedure TFrmVendasPeriodo.FormShow(Sender: TObject);
begin

  EdtDataIni.Date := Date;
  EdtDataFin.Date := Date;
  EdtDataIni.SetFocus;
end;


procedure TFrmVendasPeriodo.GeraEFD2;
var
  sAux: string;
  sAuxCodBarra: string;
  sSitDocumento: string;
  sAuxCPFCNPJ: string;
  sPerfil: string;
  sAuxNomeArq: string;
  sAuxTipoProduto: string;
  cAuxValor : Currency;
   cAuxValor2 : Currency;
  cTotalIcms  : Currency;
  BlocoC : Integer;
  cTotalTot: Currency;
  CValorC490: Currency;
  DescontoC470: Currency;
begin
  cTotalIcms := 0;
  BlocoC := 0;
  cTotalTot := 0;
  CValorC490 := 0;
  sAuxNomeArq := dm.ACBrAAC1.IdentPAF.NumeroLaudo + FormatDateTime('ddmmyyyyhhmmss', now) + '.txt';

  Sped1.Path := GetCurrentDir + '\';
  Sped1.Arquivo := sAuxNomeArq;
  { BUSCA OS DADOS DA EMPRESA }
  if dm.IBTRServer.Active then
    dm.IBTRServer.Commit;
  dm.IBTRServer.StartTransaction;
  with dm.QConsultaServer do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT * FROM EMPRESA WHERE COD_EMP = :CODEMP');
    Parambyname('CODEMP').AsInteger := iEmp;
    Open;
    sPerfil := trim(fieldbyname('perfil_efd').AsString);
  end;

  { ================================================================= }
  { ============================ BLOCO 0  -  ======================== }
  { ================================================================= }

  Sped1.LinhasBuffer := 100;
  Sped1.TrimString := True;
  Sped1.Bloco_0.LimpaRegistros;
  Sped1.Bloco_C.LimpaRegistros;
  Sped1.Bloco_E.LimpaRegistros;
  Sped1.Bloco_H.LimpaRegistros;
  Sped1.DT_INI := EdtDataIni.DateTime;
  Sped1.DT_FIN := EdtDataFin.DateTime;
  Sped1.IniciaGeracao;

  with Sped1.Bloco_0 do
  begin
      //-----------------------------------------------------//
      //                     REGISTRO 0000                   //
      //-----------------------------------------------------//
    with Registro0000New do
    begin
      COD_VER := vlVersao107;
      COD_FIN := raOriginal;
      NOME := dm.QConsultaServer.fieldbyname('RAZAO_EMP').AsString;
      cnpj := dm.QConsultaServer.fieldbyname('CNPJ_EMP').AsString;
      cpf := '';
      UF := dm.QConsultaServer.fieldbyname('EST_EMP').AsString;
      IE := dm.QConsultaServer.fieldbyname('INSC_EMP').AsString;
      COD_MUN := dm.QConsultaServer.fieldbyname('CODIGO_MUNICIPIO').AsInteger;
      IM := dm.QConsultaServer.fieldbyname('INSCRICAO_MUNICIPAL').AsString;
      // INSCRICAO_MUNICIPAL;
      SUFRAMA := '';
      if trim(dm.QConsultaServer.fieldbyname('PERFIL_EFD').AsString) = 'A' then
        IND_PERFIL := pfPerfilA
      else
      if trim(dm.QConsultaServer.fieldbyname('PERFIL_EFD').AsString) = 'B' then
        IND_PERFIL := pfPerfilB
      else
        IND_PERFIL := pfPerfilC;
      if trim(dm.QConsultaServer.fieldbyname('TIPO_ATIVIDADE_EFD').AsString)
        = '0' then
        IND_ATIV := atIndustrial
      else
        IND_ATIV := atOutros;
    end;
    with Registro0001New do
    begin
      IND_MOV := imComDados;
      // FILHO - Dados complementares da Empresa
      //-----------------------------------------------------//
      //                     REGISTRO 0005                  //
      //-----------------------------------------------------//
      with Registro0005New do
      begin
        FANTASIA := dm.QConsultaServer.fieldbyname('FANTASIA_EMP').AsString;
        CEP := RetiraCaracter(dm.QConsultaServer.fieldbyname('CEP_EMP')
          .AsString);
        ENDERECO := dm.QConsultaServer.fieldbyname('END_EMP').AsString;
        NUM := dm.QConsultaServer.fieldbyname('NUMERO_EMP').AsString;
        COMPL := '';
        BAIRRO := dm.QConsultaServer.fieldbyname('BAI_EMP').AsString;
        FONE := '';
        FAX := '';
        EMAIL := '';
      end;
      //-----------------------------------------------------//
      //                     REGISTRO 0100                   //
      //-----------------------------------------------------//
      try
      with Registro0100New do
      begin
        NOME := dm.QConsultaServer.fieldbyname('NOME_CONTADOR').AsString;
        cpf := RetiraCaracter(dm.QConsultaServer.fieldbyname('CPF_CONTADOR')
          .AsString); // Deve ser uma informação valida
        CRC := dm.QConsultaServer.fieldbyname('CRC_CONTADOR').AsString;
        cnpj := RetiraCaracter(dm.QConsultaServer.fieldbyname('CNPJ_CONTADOR')
          .AsString);
        CEP := RetiraCaracter(dm.QConsultaServer.fieldbyname('CEP_CONTADOR')
          .AsString);
        ENDERECO := dm.QConsultaServer.fieldbyname('END_CONTADOR').AsString;
        NUM := dm.QConsultaServer.fieldbyname('NUMERO_CONTADOR').AsString;
        COMPL := '';
        BAIRRO := dm.QConsultaServer.fieldbyname('BAIRRO_CONTADOR').AsString;
        FONE := '';
        FAX := '';
        EMAIL := 'NOME@NOME.COM.BR';
        COD_MUN := dm.QConsultaServer.fieldbyname('CODIGO_MUNICIPIO_CONTADOR')
          .AsInteger;
      end;
      except
          KDialog( 'Sem dados do contador!' + #13 +
          'Arquivo não foi gerado', 'SLPDV - Vendas Período', 'ERRO' );
          dm.IBTRServer.Commit;
          dm.QConsultaServer.close;

          Exit;
          Abort;
      end;
      dm.IBTRServer.Commit;
      dm.QConsultaServer.close;

      //-----------------------------------------------------//
      //                     REGISTRO 0190                   //
      //-----------------------------------------------------//

      if dm.IBTRServer.Active then
        dm.IBTRServer.Commit;
      dm.IBTRServer.StartTransaction;
      with dm.QConsultaServer do
      begin
        close;
        sql.Clear;
        if Sped1.Bloco_0.Registro0000.IND_PERFIL = pfPerfilC then
              sql.Add('SELECT DISTINCT(U.DESCRICAO), U.CODIGO ' +
                'FROM UNIDADE_MEDIDA U ' +
{                'WHERE U.CODIGO IN (SELECT P.CODIGO_UNIDADE_SAIDA ' +
                ' FROM ITENS_VENDA I ' + ' INNER JOIN PRODUTO P ' +
                ' ON (I.COD_PRO = P.COD_PRO) ' + ' INNER JOIN VENDAS V ' +
                ' ON (I.COD_VEN = V.COD_VEN) ' +
                ' WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN) ' +}

                'WHERE ' + 'U.CODIGO IN (SELECT P.CODIGO_UNIDADE_SAIDA ' +
                'FROM ESTOQUE E ' + 'INNER JOIN PRODUTO P ' +
                'ON (E.COD_PRO = P.COD_PRO) ' + 'WHERE E.COD_EMP = :CODEMP) ' +
                'ORDER BY U.CODIGO')
         else
                sql.Add('SELECT DISTINCT(U.DESCRICAO), U.CODIGO ' +
                  'FROM UNIDADE_MEDIDA U ' +
                  'WHERE U.CODIGO IN (SELECT P.CODIGO_UNIDADE_SAIDA ' +
                  ' FROM ITENS_VENDA I ' + ' INNER JOIN PRODUTO P ' +
                  ' ON (I.COD_PRO = P.COD_PRO) ' + ' INNER JOIN VENDAS V ' +
                  ' ON (I.COD_VEN = V.COD_VEN) ' +
                  ' WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN) ' +

                  'OR ' + 'U.CODIGO IN (SELECT P.CODIGO_UNIDADE_SAIDA ' +
                  'FROM ESTOQUE E ' + 'INNER JOIN PRODUTO P ' +
                  'ON (E.COD_PRO = P.COD_PRO) ' + 'WHERE E.COD_EMP = :CODEMP) ' +
                  'ORDER BY U.CODIGO');
        if Sped1.Bloco_0.Registro0000.IND_PERFIL <> pfPerfilC then
           begin
                Parambyname('dataini').AsDate := EdtDataIni.Date;
                 Parambyname('datafin').AsDate := EdtDataFin.Date;
           end;
        Parambyname('codemp').AsInteger := iEmp;
        Open;
        First;
        while not Eof do
        begin
          with Registro0190New do
          begin
            UNID := dm.QConsultaServer.fieldbyname('descricao').AsString;
            DESCR := 'MEDIDA ' + dm.QConsultaServer.fieldbyname('descricao').AsString;
          end;
          Next;
        end;
      end;
      dm.IBTRServer.Commit;
      dm.QConsultaServer.close;

      //-------------------------------------------------------//
      //    CLIENTES NFE   0150                                //
      //-------------------------------------------------------//

      if dm.IBTRServer.Active then
        dm.IBTRServer.Commit;
      dm.IBTRServer.StartTransaction;

        dm.Q0150.Close;
        dm.Q0150.ParamByName( 'CODEMP' ).AsInteger := iEmp;
        dm.Q0150.ParamByName( 'DATAINI').AsDate := EdtDataIni.DateTime;
        dm.Q0150.ParamByName( 'DATAFIM').AsDate := EdtDataFin.DateTime;
        dm.Q0150.Open;
        dm.Q0150.First;
        while not dm.Q0150.Eof do
           begin
              with Registro0150New do
                 begin
                    COD_PART := dm.Q0150COD_CLI.AsString;
                    NOME     := dm.Q0150NOME_CLI.AsString;
                    COD_PAIS  :=  '01058';
                    if Trim( dm.Q0150FJ_CLI.AsString ) = 'F' then
                       begin
                          CNPJ := '';
                          CPF := RetiraCaracter( dm.Q0150CNPJ_CLI.AsString );
                       end
                    else
                       begin
                          CNPJ := RetiraCaracter( dm.Q0150CNPJ_CLI.AsString );
                          CPF := '';
                       end;
                    IE := RetiraCaracter( dm.Q0150INSC_ESTADUAL.AsString );
                    COD_MUN := dm.Q0150CODIGO_IBGE.AsInteger;
                    SUFRAMA := '';
                    ENDERECO := dm.Q0150ENDRES_CLI.AsString;
                    NUM := DM.Q0150NUMRES_CLI.AsString;
                    BAIRRO := dm.Q0150BAIRES_CLI.AsString;
                    COMPL := '';
                 end;
              dm.Q0150.Next; Application.ProcessMessages;
           end;
      DM.Q0150.Close;
      dm.IBTRServer.Commit;

      //-----------------------------------------------------//
      //                     REGISTRO 0200                   //
      //-----------------------------------------------------//

      if dm.IBTRServer.Active then
        dm.IBTRServer.Commit;
      dm.IBTRServer.StartTransaction;
      with dm.QConsultaServer do
      begin
        close;
        sql.Clear;

        if Sped1.Bloco_0.Registro0000.IND_PERFIL = pfPerfilC then
              sql.Add( 'SELECT P.COD_PRO, P.NOME_PRO, P.CODIGO_BARRA_PRO, '+
                        'P.COD_NCM, P.CODIGO_TIPO, U.DESCRICAO, G.ALIQUOTA_GRP, G.icms_servico_grp '+
                        'FROM PRODUTO P                INNER JOIN GRUPO_ICMS G ' +
                        'ON (P.ICMS_CF_EST = G.COD_GRP) INNER JOIN UNIDADE_MEDIDA U ' +
                        'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO) '+
{                        'WHERE P.COD_PRO IN (SELECT I.COD_PRO FROM ITENS_VENDA I '+
                        'INNER JOIN VENDAS V ON (I.COD_VEN = V.COD_VEN) '+
                        'WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN AND I.COD_EMP = :CODEMP) '+}
                        'WHERE P.COD_PRO IN (SELECT E.COD_PRO FROM ESTOQUE E '+
                        'WHERE  E.COD_EMP = :CODEMP) '+
              {          'OR P.cod_pro IN (SELECT INF.cod_pro FROM itens_nota_fiscal INF '+
                        'INNER JOIN nota_fiscal NF ON (INF.COD_nf = NF.cod_nf) '+
                        'WHERE Nf.data_emissao_nf BETWEEN :DATAINI AND :DATAFIN AND nf.COD_EMP = :CODEMP) '+}
                        'ORDER BY P.COD_PRO' )
         else
                sql.Add( 'SELECT P.COD_PRO, P.NOME_PRO, P.CODIGO_BARRA_PRO, '+
                  'P.COD_NCM, P.CODIGO_TIPO, U.DESCRICAO, G.ALIQUOTA_GRP, G.icms_servico_grp '+
                  'FROM PRODUTO P                INNER JOIN GRUPO_ICMS G ' +
                  'ON (P.ICMS_CF_EST = G.COD_GRP) INNER JOIN UNIDADE_MEDIDA U ' +
                  'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO) '+
                  'WHERE P.COD_PRO IN (SELECT I.COD_PRO FROM ITENS_VENDA I '+
                  'INNER JOIN VENDAS V ON (I.COD_VEN = V.COD_VEN) '+
                  'WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN AND I.COD_EMP = :CODEMP) '+
                  'OR P.COD_PRO IN (SELECT E.COD_PRO FROM ESTOQUE E '+
                  'WHERE  E.COD_EMP = :CODEMP) '+
        {          'OR P.cod_pro IN (SELECT INF.cod_pro FROM itens_nota_fiscal INF '+
                  'INNER JOIN nota_fiscal NF ON (INF.COD_nf = NF.cod_nf) '+
                  'WHERE Nf.data_emissao_nf BETWEEN :DATAINI AND :DATAFIN AND nf.COD_EMP = :CODEMP) '+}
                  'ORDER BY P.COD_PRO' );
        if Sped1.Bloco_0.Registro0000.IND_PERFIL <> pfPerfilC then
           begin
              Parambyname('dataini').AsDate := EdtDataIni.Date;
              Parambyname('datafin').AsDate := EdtDataFin.Date;
           end;
        Parambyname('codemp').AsInteger := iEmp;
        Open;
        First;
        while not Eof do
        begin
          with Registro0200New do
          begin
            if length(dm.QConsultaServer.fieldbyname('codigo_barra_pro').AsString) > 7 then
               sAuxCodBarra:= dm.QConsultaServer.fieldbyname('codigo_barra_pro').AsString
            else
               sAuxCodBarra := '';

            COD_ITEM := dm.QConsultaServer.fieldbyname('cod_pro').AsString;
            DESCR_ITEM := trim(dm.QConsultaServer.fieldbyname('nome_pro').AsString);
            COD_BARRA := sAuxCodBarra;
            UNID_INV := dm.QConsultaServer.fieldbyname('descricao').AsString;
            if trim(FieldByName( 'icms_servico_grp' ).AsString ) = 'S' then
               TIPO_ITEM := tiServicos
               else
               case dm.QConsultaServer.fieldbyname('codigo_tipo').AsInteger of
                 1: TIPO_ITEM := tiMercadoriaRevenda;
                 2: TIPO_ITEM := tiMateriaPrima;
               end;

            COD_NCM := trim(dm.QConsultaServer.fieldbyname('cod_ncm').AsString);
            COD_GEN := '';
            if trim(FieldByName( 'icms_servico_grp' ).AsString ) = 'S' then
               ALIQ_ICMS := 0
            else
              ALIQ_ICMS := dm.QConsultaServer.fieldbyname('aliquota_grp').AsCurrency;
          end;
          Next;
        end;


        with Registro0500New do
        begin
          DT_ALT := StrToDate('30/11/2011');
          COD_NAT_CC := '01';
          IND_CTA := 'A';
          NIVEL := '1';
          COD_CTA := '1';
          NOME_CTA := 'CONTA CONTÁBIL 1';
        end;



      end;

       dm.IBTRServer.Commit;
        dm.QConsultaServer.Close;
      // FIM 0200
    end;

  end;

  Sped1.WriteBloco_0;
  // ----------------------------------------------------//
  //                   BLOCO C                           //
  //-----------------------------------------------------//
    with Sped1 do
      begin
        with Bloco_C.RegistroC001 do
          begin
            IND_MOV := TACBrIndicadorMovimento(0);
          end;

          // ----------------------------------------------------//
          //                   REGISTRO C100  NF-e               //
          //-----------------------------------------------------//

        if dm.IBTRServer.Active then
           dm.IBTRServer.Commit;
        dm.IBTRServer.StartTransaction;

        dm.QC100.Close;
        dm.QC100.ParamByName( 'CODEMP' ).AsInteger := iEmp;
        dm.QC100.ParamByName( 'DATAINI').AsDate := EdtDataIni.DateTime;
        dm.QC100.ParamByName( 'DATAFIM').AsDate := EdtDataFin.DateTime;
        dm.QC100.Open;
        dm.QC100.First;
        while not DM.QC100.Eof do
           begin
              with Bloco_C.RegistroC100New do
                 begin
                    if DM.QC100TIPO_NOTA_FISCAL.AsInteger < 5 then
                        IND_OPER := tpSaidaPrestacao
                    else
                        IND_OPER := tpEntradaAquisicao;
                    IND_EMIT := edEmissaoPropria;
                    COD_PART := dm.QC100COD_CLI.AsString;
                    COD_MOD := '55';
                    if (DM.QC100CANCELADA_NF.AsString = 'S') or
                        (DM.QC100STATUS_CANCELADO.AsString = 'S') then
                        COD_SIT := sdCancelado;

                    if (DM.QC100STATUS_INUTILIZADO.AsString = 'S') then
                        COD_SIT := sdDoctoNumInutilizada;

                    if ((not DM.QC100CHAVE_ACESSO_NFE.IsNull) and
                          (not DM.QC100CHAVE2.IsNull) and (not DM.QC100PROTOCOLO_NFE.IsNull)
                              and (DM.QC100STATUS_CANCELADO.AsString = '')) then
                        COD_SIT := sdRegular;


                    SER := dm.QC100SERIE_NOTA.AsString;
                    NUM_DOC := FormatFloat('000000000',
                             dm.QC100NUMERO_NOTA_NF.AsInteger);
                    CHV_NFE := ProcessaChave(dm.QC100CHAVE_ACESSO_NFE.AsString);
                    DT_DOC := dm.QC100DATA_EMISSAO_NF.AsDateTime;
                    DT_E_S := dm.QC100DATA_EMISSAO_NF.AsDateTime;
                    VL_DOC := dm.QC100VALOR_TOTAL_NF.AsCurrency;
                    IND_PGTO := BuscaPag( dm.QC100COD_NF.AsInteger );
                    VL_DESC := dm.QC100DESCONTO_NF.AsCurrency;
                    VL_ABAT_NT := 0;
                    VL_MERC := dm.QC100VALOR_TOTAL_PROD_NF.AsCurrency;
                    if Trim( DM.QC100FRETE_CONTA_NF.AsString )= '1' then
                       IND_FRT := tfPorContaEmitente;
                    if Trim( DM.QC100FRETE_CONTA_NF.AsString )= '2' then
                       IND_FRT := tfPorContaDestinatario;
                    if Trim( DM.QC100FRETE_CONTA_NF.AsString )= '3' then
                       IND_FRT := tfPorContaTerceiros;
                    if Trim( DM.QC100FRETE_CONTA_NF.AsString )= '4' then
                       IND_FRT := tfSemCobrancaFrete;
                    VL_FRT := dm.QC100VALOR_FRETE_NF.AsCurrency;
                    VL_SEG := dm.QC100VALOR_SEGURO_NF.AsCurrency;
                    VL_OUT_DA := dm.QC100OUTRAS_DESPESAS_NF.AsCurrency;
                    VL_BC_ICMS := dm.QC100BASE_CALCULO_ICMS_NF.AsCurrency;
                    VL_ICMS := dm.QC100VALOR_ICMS_NF.AsCurrency;
                    VL_BC_ICMS_ST := dm.QC100BASE_SUBST_NF.AsCurrency;
                    VL_ICMS_ST := dm.QC100VALOR_SUBST_NF.AsCurrency;
                    VL_IPI := dm.QC100VALOR_IPI_NF.AsCurrency;
                    VL_PIS := dm.QC100VALOR_PIS.AsCurrency;
                    VL_COFINS := dm.QC100VALOR_COFINS.AsCurrency;
                    VL_PIS_ST := 0;
                    VL_COFINS_ST := 0;

{                    dm.QC170.Close;
                    dm.QC170.ParamByName('codnf').AsInteger := dm.QC100COD_NF.AsInteger;
                    dm.QC170.Open;
                    dm.QC170.First;
                    while not dm.QC170.Eof do
                       begin
                                with RegistroC170.New do
                                  begin
                                    NUM_ITEM := dm.QC170ORDEM.AsString;
                                    COD_ITEM := dm.QC170COD_PRO.AsString;
                                    DESCR_COMPL := DM.QC170NOME_PRO.AsString;
                                    QTD := dm.QC170QUANT.AsCurrency;
                                    UNID := dm.QC170UNID.AsString;
                                    VL_ITEM := dm.QC170VALOR_TOTAL.AsCurrency;
                                    VL_DESC := dm.QC170DESCONTO.AsCurrency;
                                    IND_MOV := TacbrMovimentacaofisica( 0);
                                    CST_ICMS := dm.QC170CST.AsString;
                                    CFOP := dm.QC170COD_CFO.AsString;
                                    COD_NAT := '';
                                    VL_BC_ICMS := DM.QC170BASE_CALCULO.AsCurrency;
                                    ALIQ_ICMS := dm.QC170ALIQ.AsCurrency;
                                    VL_ICMS := dm.QC170VALOR_ICMS.AsCurrency;
                                    VL_BC_ICMS_ST := dm.QC170BASE_SUBTRIB.AsCurrency;
                                    ALIQ_ST := dm.QC170VR_AGREGADO.AsCurrency;
                                    VL_ICMS_ST := dm.QC170VALOR_SUBTRIB.AsCurrency;
                                    IND_APUR := TacbrapuracaoIpi(0);
                                    CST_IPI := dm.QC170CST_IPI.AsString;
                                    COD_ENQ := '';
                                    VL_BC_IPI := dm.QC170BASE_CALCULO.AsCurrency;
                                    ALIQ_IPI := dm.QC170ALIQ_IPI.AsCurrency;
                                    VL_IPI := dm.QC170VALOR_IPI.AsCurrency;
                                    CST_PIS := dm.QC170CST_PIS.AsString;
                                    VL_BC_PIS := DM.QC170BASE_CALCULO.AsCurrency;
                                    ALIQ_PIS_PERC := dm.QC170ALIQ_PIS.AsCurrency;
                                    QUANT_BC_PIS := 0;
                                    ALIQ_PIS_R := 0;
                                    VL_PIS := dm.QC170VALOR_PIS.AsCurrency;
                                    CST_COFINS := dm.QC170CST_COFINS.AsString;
                                    VL_BC_COFINS := dm.QC170BASE_CALCULO.AsCurrency;
                                    ALIQ_COFINS_PERC := dm.QC170ALIQ_COFINS.AsCurrency;
                                    QUANT_BC_COFINS := 0;
                                    ALIQ_COFINS_R := 0;
                                    VL_COFINS := dm.QC170VALOR_COFINS.AsCurrency;
                                    COD_CTA := '1';
                                  end;

                         dm.QC170.Next; Application.ProcessMessages;
                       end;}
                     dm.QC170.Close;
                    dm.QC190.Close;
                    dm.QC190.ParamByName('codnf').AsInteger := dm.QC100COD_NF.AsInteger;
                    dm.QC190.Open;
                    dm.QC190.First;
                    while not dm.QC190.Eof do
                       begin
                                with RegistroC190.New do
                                  begin
                                    CST_ICMS := DM.QC190CST.AsString;
                                    Cfop := DM.QC190COD_CFO.AsString;
                                    ALIQ_ICMS := dm.QC190ALIQ.AsCurrency;
                                    VL_OPR := dm.QC190TOTAL.AsCurrency;
                                    VL_BC_ICMS := dm.QC190BC_ICMS.AsCurrency;
                                    VL_ICMS := dm.QC190V_ICMS.AsCurrency;
                                    VL_BC_ICMS_ST := dm.QC190BC_ICMS_ST.AsCurrency;
                                    VL_ICMS_ST := dm.QC190V_ICMS_ST.AsCurrency;
                                    VL_RED_BC := dm.QC190V_REDUCAO.AsCurrency;
                                    VL_IPI := dm.QC190V_IPI.AsCurrency;
                                    COD_OBS := '';
                                    if (Copy( CFOP, 1, 1 ) = '5')
                                    or (Copy( CFOP, 1, 1 ) = '6') or
                                    ( CFOP = '1605')
                                     then
                                       cTotalIcms := cTotalIcms + VL_ICMS;
                                  end;

                         dm.QC190.Next; Application.ProcessMessages;
                       end;
                     dm.QC190.Close;
                 end;
               Inc(BlocoC);
              dm.QC100.Next; Application.ProcessMessages;
           end;

        dm.IBTRServer.Commit;
        dm.QC100.Close;
      end;


   with sped1.Bloco_C do
   begin
   { REGISTRO C350 - NIVEL 2 - PERFIL A }
   if Sped1.Bloco_0.Registro0000.IND_PERFIL = pfPerfilA then
      begin
         if dm.IBTRServer.Active then
            dm.IBTRServer.Commit;
         dm.IBTRServer.StartTransaction;
         dm.QC350.close;
         dm.QC350.Parambyname('dataini').AsDate   := EdtDataIni.Date;
         dm.QC350.Parambyname('datafin').AsDate   := EdtDataFin.Date;
         dm.QC350.Parambyname('codemp').AsInteger := iEmp;
         dm.QC350.open;
         while not dm.QC350.eof do
             begin
             with RegistroC350New do
             begin
                SER := dm.QC350SERIE_NOTA_FISCAL.AsString;
                SUB_SER := '';
                NUM_DOC := dm.QC350NUMERO_NOTA_FISCAL.AsString;
                DT_DOC :=  dm.QC350DATA_VEN.AsDateTime;
                if RetiraCaracter( dm.QC350R04_CNPJ_CLIENTE.AsString ) = '00000000000' then
                   CNPJ_CPF := ''
                else
                   CNPJ_CPF := RetiraCaracter( dm.QC350R04_CNPJ_CLIENTE.AsString );
                VL_MERC := dm.QC350TOTAL_VEN.AsCurrency;
                VL_DOC  := dm.QC350TOTAL_VEN.AsCurrency - ( Abs( dm.QC350DESCONTO_VEN.AsCurrency ) );
                VL_DESC := Abs( dm.QC350DESCONTO_VEN.AsCurrency );
                VL_PIS := 0;
                VL_COFINS := 0;
                COD_CTA := '1';

                { REGISTRO C370 - NIVEL 3 - PERFIL A }
                dm.QC370.Close;
                dm.QC370.ParamByName('codven').AsInteger := dm.QC350COD_VEN.AsInteger;
                dm.QC370.Open;
                while not dm.QC370.Eof do
                   begin
                      with RegistroC370New do
                      begin
                         NUM_ITEM := dm.QC370ORDEM.AsString;
                         COD_ITEM := dm.QC370COD_PRO.AsString;
                         QTD := dm.QC370QUANT.AsCurrency;
                         UNID := dm.QC370DESCRICAO.AsString;
                         VL_ITEM := dm.QC370TOTAL.AsCurrency;
                         VL_DESC :=  dm.QC370DESCONTO.AsCurrency;
                      end;
                      dm.QC370.Next; Application.ProcessMessages;
                   end;

                { REGISTRO C390 - NIVEL 3 - PERFIL A }
                dm.QC390.Close;
                dm.QC390.ParamByName('codven').AsInteger := dm.QC350COD_VEN.AsInteger;
                dm.QC390.Open;
                while not dm.QC390.Eof do
                   begin
                      if dm.QC390ALIQUOTA_GRP.AsCurrency > 0 then
                         cAuxValor:= dm.QC390VALOR.AsCurrency
                      else
                         cAuxValor:= 0;

                      with RegistroC390New do
                         begin
                            CST_ICMS := dm.QC390CST_CF_EST.AsString;
                            CFOP := dm.QC390CFOP_VENDAS_CF_EST.AsString;
                            ALIQ_ICMS := dm.QC390ALIQUOTA_GRP.AsCurrency;
                            VL_OPR := dm.QC390VALOR.AsCurrency;
                            VL_BC_ICMS :=  cAuxValor;
                            VL_ICMS := (cAuxValor * dm.QC390ALIQUOTA_GRP.AsCurrency) / 100;
                            VL_RED_BC := 0;
                                    if (Copy( CFOP, 1, 1 ) = '5')
                                    or (Copy( CFOP, 1, 1 ) = '6') or
                                    ( CFOP = '1605')
                                     then
                                       cTotalIcms := cTotalIcms + VL_ICMS;

                         end;

                      dm.QC390.Next; Application.ProcessMessages;
                   end;
                Inc(BlocoC);
                dm.QC350.Next; Application.ProcessMessages;
              end;
            end;
         dm.IBTRServer.Commit;
         dm.QC350.Close;
         dm.QC370.Close;
         dm.QC390.Close;

      end;

   { REGISTRO C400 - RELACAO DAS ECFS  - HIERARQUIA 2 }
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   dm.QC400.close;
   dm.QC400.Parambyname('codemp').AsInteger:= iEmp;
   dm.QC400.open;
   while not dm.QC400.eof do
      begin
         dm.QC405.Close;
         dm.QC405.Parambyname('dataini').AsDate      := EdtDataIni.Date;
         dm.QC405.Parambyname('datafin').AsDate      := EdtDataFin.Date;
         dm.QC405.ParamByName('checkout').AsInteger  := dm.QC400COD_CAI.AsInteger;
         dm.QC405.ParamByName('codemp').AsInteger    := iEmp;
         dm.QC405.Open;
         if dm.QC405.IsEmpty then
            begin

               dm.QC405.Close;
               dm.QC400.Next; Application.ProcessMessages;
               Continue;
            end;
         dm.QC405.Close;
         with RegistroC400New do
         begin
            COD_MOD := '2D';
            ECF_MOD := dm.QC400R01_MODELO_ECF.AsString;
            ECF_FAB := dm.QC400R01_NUMERO_SERIE.AsString;
            ECF_CX := FormataStringD(dm.QC400COD_CAI.AsString, '3', '0');

         { REGISTRO C405  - REDUCAO Z - HIERARQUIA 3 }
         dm.QC405.Close;
         dm.QC405.Parambyname('dataini').AsDate      := EdtDataIni.Date;
         dm.QC405.Parambyname('datafin').AsDate      := EdtDataFin.Date;
         dm.QC405.ParamByName('checkout').AsInteger  := dm.QC400COD_CAI.AsInteger;
         dm.QC405.ParamByName('codemp').AsInteger    := iEmp;
         dm.QC405.Open;
         while not dm.QC405.Eof do
            begin
               cTotalTot := 0;
               with RegistroC405New do
               begin
                  DT_DOC :=  DM.QC405DATA.AsDateTime;
                  CRO := dm.QC405CONTADOR_REINICIO_OPERACAO.AsInteger;
                  CRZ := dm.QC405CONT_REDUCAO.AsInteger;
                  NUM_COO_FIN := dm.QC405COO_FINAL.AsInteger;
                  GT_FIN := dm.QC405GT_FINAL.AsCurrency;
                  VL_BRT := dm.QC405VENDA_BRUTA.AsCurrency;

               { REGISTRO C420  - TOTALIZADORES - HIERARQUIA 4 }
               dm.QC420.Close;
               dm.QC420.ParamByName('codigo').AsInteger := dm.QC405CODIGO.AsInteger;
               dm.QC420.Open;
               while not dm.QC420.Eof do
                  begin
                     with RegistroC420New do
                     begin
                        COD_TOT_PAR := dm.QC420INDICE_R03.AsString;
                        VLR_ACUM_TOT := dm.QC420VALOR.AsCurrency;
                        if ( ( dm.QC420INDICE_R03.AsString <> 'OPNF' ) and
                        ( dm.QC420INDICE_R03.AsString <> 'DO' ) and
                        ( dm.QC420INDICE_R03.AsString <> 'AO' ) and
                        ( dm.QC420INDICE_R03.AsString <> 'Can-O' ) and
                        ( dm.QC420INDICE_R03.AsString <> 'IOF' )) then
                        cTotalTot := cTotalTot + dm.QC420VALOR.AsCurrency;

                        if ( Length( dm.QC420INDICE_R03.AsString ) >= 7 ) then
                           begin
                            if  Pos( 'S', dm.QC420INDICE_R03.AsString ) > 0  then
                               NR_TOT := StrToInt( Copy( dm.QC420INDICE_R03.AsString, 1, 2 ) )
                            else
                              if ( Pos( 'T', dm.QC420INDICE_R03.AsString) > 0 ) then
                                  NR_TOT := StrToInt( Copy( dm.QC420INDICE_R03.AsString, 1, 2 ) )
                              else
                                  NR_TOT := 0;
                           end;

                     { REGISTRO C425 - RESUMO DOS INTENS POR GRUPO DE ICMS - PERFIL B - HIERARQUIA 5 }
                     if Sped1.Bloco_0.Registro0000.IND_PERFIL = pfPerfilB then
                        begin
                           dm.QC425.Close;
                           dm.QC425.Parambyname('dataini').AsDate      := DM.QC405DATA.AsDateTime;
                           dm.QC425.Parambyname('datafin').AsDate      := DM.QC405DATA.AsDateTime;
                           dm.QC425.ParamByName('codcai').AsInteger    := dm.QC400COD_CAI.AsInteger;
                           dm.QC425.ParamByName('codemp').AsInteger    := iEmp;
                           dm.QC425.ParamByName('codgrp').AsInteger    := dm.QC420COD_GRP.AsInteger;
                           dm.QC425.Open;
                           while not dm.QC425.Eof do
                              begin
                                 with RegistroC425New do
                                 begin
                                   COD_ITEM := dm.QC425COD_PRO.AsString;
                                   QTD := dm.QC425QUANT.AsCurrency;
                                   UNID := dm.QC425DESCRICAO.AsString;
                                   VL_ITEM := dm.QC425VALOR.AsCurrency;
                                   VL_PIS := 0;
                                   VL_COFINS := 0;
                                 end;
                                 dm.QC425.Next; Application.ProcessMessages;
                              end;
                        end;
                     end;
                     dm.QC420.Next; Application.ProcessMessages;
                  end;
                  VL_BRT := cTotalTot;
               { REGISTRO C460 - VENDAS - HIERARQUIA 4 }
               if ( Sped1.Bloco_0.Registro0000.IND_PERFIL <> pfPerfilC ) and
               ( Sped1.Bloco_0.Registro0000.IND_PERFIL <> pfPerfilB ) then
                  begin
                     dm.QC460.Close;
                     dm.QC460.ParamByName('data').AsDate      := dm.QC405DATA.AsDateTime;
                     dm.QC460.ParamByName('codcai').AsInteger := dm.QC400COD_CAI.AsInteger;
                     dm.QC460.ParamByName('codemp').AsInteger := iEmp;
                     dm.QC460.Open;
                     while not dm.QC460.Eof do
                        begin
                           DescontoC470 := 0;

                           with RegistroC460New do
                           begin

                           if dm.QC460CANCELADA_VEN.AsInteger = 0 then
                               COD_SIT := sdRegular
                           else
                              COD_SIT := sdCancelado;
                           COD_MOD := '2D';
                           NUM_DOC := Dm.QC460CUPOM_FISCAL_VEN.AsString;
                           if COD_SIT = sdRegular then
                           begin
                               DT_DOC := DM.QC460DATA_VEN.AsDateTime;
                               VL_DOC := dm.QC460TOTAL_VEN.AsCurrency;
                               VL_PIS := 0;
                               VL_COFINS := 0;
                               if RetiraCaracter( dm.QC460R04_CNPJ_CLIENTE.AsString ) = '00000000000' then
                                  CPF_CNPJ := ''
                               else
                                  CPF_CNPJ := Trim( RetiraCaracter( dm.QC460R04_CNPJ_CLIENTE.AsString ) );
                               NOM_ADQ :=dm.QC460R04_NOME_CLIENTE.AsString;
                           end;

                           { REGISTRO C470  - ITENS VENDA - HIERARQUIA 5 }
                           dm.QC470.Close;
                           dm.QC470.ParamByName('codven').AsInteger := dm.QC460COD_VEN.AsInteger;
                           dm.QC470.Open;
                           if Abs( dm.QC460DESCONTO_VEN.AsCurrency ) > 0 then
                              DescontoC470 := Abs( DM.QC460DESCONTO_VEN.AsCurrency ) / dm.QC470.RecordCount
                           else
                              DescontoC470 := 0;
                           while not dm.QC470.Eof do
                              begin
                                 if dm.QC470CANCELADO.AsInteger = 1 then
                                    begin

                                      dm.QC470.Next; Application.ProcessMessages;
                                      Continue;
                                    end;
                                 if dm.QC470CANCELADO.AsInteger = 0 then
                                    cAuxValor:= 0
                                 else
                                    cAuxValor:= dm.QC470QUANT.AsCurrency;
                                 if dm.QC470CANCELADO.AsInteger <> 1 then
                                    begin
                                       with registroC470New do
                                       begin
                                          COD_ITEM :=  dm.QC470COD_PRO.AsString;
                                          QTD := dm.QC470QUANT.AsCurrency;
                                          QTD_CANC := cAuxValor;
                                          UNID := dm.QC470DESCRICAO.AsString;
                                          if QTD_CANC >0  then
                                             VL_ITEM := 0
                                          else
                                             VL_ITEM := dm.QC470TOTAL.AsCurrency - DescontoC470;
                                          CST_ICMS := dm.QC470CST_CF_EST.AsString;
                                          CFOP := dm.QC470CFOP_VENDAS_CF_EST.AsString;
                                          if Trim( dm.QC470ICMS_SERVICO_GRP.AsString ) = 'S' then
                                             ALIQ_ICMS := 0
                                          else
                                             ALIQ_ICMS := dm.QC470ALIQUOTA_GRP.AsCurrency;
                                          VL_PIS := 0;
                                          VL_COFINS := 0;
                                       end;
                                    end;
                                 dm.QC470.Next; Application.ProcessMessages;
                              end;
                           end;
                           dm.QC460.Next; Application.ProcessMessages;
                        end;
                  end;

               { REGISTRO C490 - NIVEL 4 - PERFIL A }
                dm.QC490.Close;
                dm.QC490.ParamByName('DATA').AsDate:= dm.QC405DATA.AsDateTime;
                dm.QC490.Open;
                while not dm.QC490.Eof do
                   begin
                      cAuxValor2:= BuscaValorC490( dm.QC405DATA.AsDateTime, dm.qc490cod_grp.AsInteger );

                      if dm.QC490ALIQUOTA_GRP.AsCurrency > 0 then
                         cAuxValor:= cAuxValor2
                      else
                         cAuxValor:= 0;
                      with RegistroC490New do
                      begin
                         CST_ICMS := dm.QC490CST_CF_EST.AsString;
                         CFOP := dm.QC490CFOP_VENDAS_CF_EST.AsString;
                         if Trim( dm.QC490ICMS_SERVICO_GRP.AsString ) <> 'S' then
                           begin
                            ALIQ_ICMS := dm.QC490ALIQUOTA_GRP.AsCurrency;
                             VL_BC_ICMS :=  cAuxValor;
                             VL_ICMS :=(cAuxValor * dm.QC490ALIQUOTA_GRP.AsCurrency) / 100;
                                    if (Copy( CFOP, 1, 1 ) = '5')
                                    or (Copy( CFOP, 1, 1 ) = '6') or
                                    ( CFOP = '1605')
                                     then
                                       cTotalIcms := cTotalIcms + VL_ICMS;
                           end
                         else
                           begin
                              ALIQ_ICMS := 0;
                              VL_BC_ICMS := 0;
                              VL_ICMS := 0;
                           end;

                         VL_OPR := cAuxValor2;

                      end;
                      dm.QC490.Next; Application.ProcessMessages;
                   end;
               end;
               Inc(BlocoC);
               dm.QC405.Next; Application.ProcessMessages;
            end;
         end;
         dm.QC400.Next; Application.ProcessMessages;
      end;
   dm.IBTRServer.Commit;
   dm.QC400.Close;
   dm.QC405.Close;
   dm.QC420.Close;
   dm.QC425.Close;
   dm.QC460.Close;
   dm.QC470.Close;
   end;
   //----------------------------------------------------//
   //               FIM DA COPIA                         //
   //----------------------------------------------------//
  if BlocoC = 0 then
     Sped1.Bloco_C.RegistroC001.IND_MOV := TACBrIndicadorMovimento(1);

  sped1.WriteBloco_C(true);


  //--------------------------------------------------------//
  //          BLOCO E                                      //
  //-------------------------------------------------------//
          // BLOCO E
  with sped1.Bloco_E do
          begin
            with RegistroE001New do
              begin
                IND_MOV := imComDados;
                with RegistroE100New do
                  begin
                    DT_INI := EdtDataIni.DateTime;
                    DT_FIN := EdtDataFin.DateTime;

                    with RegistroE110 do
                      begin
                        VL_TOT_DEBITOS := cTotalIcms;//dICMS;
                        VL_AJ_DEBITOS := 0;
                        VL_TOT_AJ_DEBITOS := 0;
                        VL_ESTORNOS_CRED := 0;
                        VL_TOT_CREDITOS := 0;
                        VL_AJ_CREDITOS := 0;
                        VL_TOT_AJ_CREDITOS := 0;
                        VL_ESTORNOS_DEB := 0;
                        VL_SLD_CREDOR_ANT := 0;
                        VL_SLD_APURADO := cTotalIcms;//dICMS;
                        VL_TOT_DED := 0;
                        VL_ICMS_RECOLHER := cTotalIcms;//dICMS;
                        VL_SLD_CREDOR_TRANSPORTAR := 0;
                        DEB_ESP := 0;
                        with RegistroE116New do
                          begin
                            COD_OR := '000';
                            VL_OR := cTotalIcms;//dICMS;

                            DT_VCTO := EdtDataFin.DateTime;
                            COD_REC := '10';
                            NUM_PROC := '';
                            IND_PROC := opNenhum;
                            PROC := '';
                            TXT_COMPL := '';
                            MES_REF := FormatDateTime( 'mmyyyy', date ); // VERSÃO 103
                          end;

                      end;
                  end;
              end;
          end;
  sped1.WriteBloco_E;


  //-----------------------------------------------------------------//
  //                  BLOCO H  - INVENTARIO                          //
  //-----------------------------------------------------------------//
  if DM.IBTRServer.Active then
       dm.IBTRServer.Commit;
  dm.IBTRServer.StartTransaction;
  dm.QH005.Close;
  dm.QH005.ParamByName( 'codemp' ).AsInteger := iEmp;
  dm.QH005.Open;
  dm.QH010.Close;
  dm.QH010.ParamByName( 'codemp' ).AsInteger := iEmp;
  dm.QH010.Open;

  with Sped1.Bloco_H do
  begin
    with RegistroH001New do
    begin
      if dm.QH010.IsEmpty then
         IND_MOV := imSemDados
      else
      begin
          IND_MOV := imComDados;
          //
          with RegistroH005New do
            begin
              DT_INV := EdtDataFin.DateTime; //o valor informado no campo deve ser menor ou igual ao valor no campo DT_FIN do registro 0000
              VL_INV := DM.QH005TOTAL.AsCurrency;
              // FILHO
            dm.QH010.First;
            while not DM.QH010.Eof do
              begin
                with RegistroH010New do
                    begin
                      COD_ITEM := DM.QH010COD_PRO.AsString;
                      UNID := dm.QH010UNIDADE.AsString;
                      QTD := dm.QH010ESTOQUE.AsCurrency;
                      VL_UNIT := dm.QH010VALOR_PRO.AsCurrency;
                      VL_ITEM := dm.QH010VL_ITEM.AsCurrency;
                      IND_PROP := piInformante;
                      COD_PART := '';
                      TXT_COMPL := '';
                      COD_CTA := '1';
                    end;
                  dm.QH010.Next; Application.ProcessMessages;
              end;
            end;
      end;
    end;
  end;
  dm.QH005.Close;
  dm.QH010.Close;

  DM.IBTRServer.Commit;
  Sped1.WriteBloco_H;

  //------------------------------------------------------------//
  //                 BLOCO 1 OBRIGATORIO                        //
  //-------------------------------------------------------------//
  with sped1.Bloco_1 do
     begin
        with Registro1001New do
            begin
              IND_MOV := imComDados;
            end;
        with Registro1010New do
            begin
              IND_EXP := 'N';
              IND_CCRF := 'N';
              IND_COMB := 'N';
              IND_USINA := 'N';
              IND_VA := 'N';
              IND_EE := 'N';
              IND_CART := 'N';
              IND_FORM := 'N';
              IND_AER := 'N';
            end;
     end;
  Sped1.WriteBloco_1;

  Sped1.SaveFileTXT;
  dm.AssinaturaDigital( Sped1.Path + Sped1.Arquivo );
  KDialog( 'Arquivo gerado com sucesso!' + #13 +
  Sped1.Path + Sped1.Arquivo, 'SLPDV - EFD', 'INFO' );

end;


function TFrmVendasPeriodo.ProcessaChave( Chave: String ): string;
var
  ChaveTemp, T: String;
  I: Integer;
begin
   ChaveTemp := Chave;
   T := '';
   for I := 1 to Length( ChaveTemp ) do
      begin

         if ( ChaveTemp[I] in ['0'..'9'] ) then
            T := T + ChaveTemp[I];
      end;
   Result := Trim( T );
end;

function TFrmVendasPeriodo.BuscaPag(COD_NF: Integer): TACBrTipoPagamento;
begin
  dm.QConsultaServer.Close;
  dm.QConsultaServer.sql.Clear;
  dm.QConsultaServer.sql.Text :=
    'SELECT C.COD_CTR, C.PARCELA_CTR, C.VENCTO_CTR, C.VALOR_CTR, C.numdocumento_ctr '
    + 'FROM CONTAS_RECEBER C WHERE C.numdocumento_ctr = :CODNF ' +
    'ORDER BY C.VENCTO_CTR';

  dm.QConsultaServer.ParamByName('codnf').AsString := 'NF ' + inttostr(COD_NF);
  dm.QConsultaServer.Open;
  dm.QConsultaServer.Last;
  dm.QConsultaServer.First;
  if dm.QConsultaServer.IsEmpty then
    result := tpSemPagamento;
  if (not dm.QConsultaServer.IsEmpty) AND (dm.QConsultaServer.recordCount > 1) then
    result := tpPrazo
  else
    result := tpVista;
  dm.QConsultaServer.Close;

end;

function TFrmVendasPeriodo.BuscaValorC490( Data: TDateTime; grupo: Integer ): Currency;
begin
  //
  dm.QC490BuscaValor.Close;
  dm.QC490BuscaValor.ParamByName( 'DATA' ).AsDate := Data;
  dm.QC490BuscaValor.ParamByName( 'CODGRP' ).AsInteger := grupo;
  dm.QC490BuscaValor.Open;
  if dm.QC490BuscaValorVALOR.IsNull then
     result := 0
  else
     result :=  dm.QC490BuscaValorVALOR.AsCurrency;
  dm.QC490BuscaValor.Close;
end;


function TFrmVendasPeriodo.TotalBT60M( COD: Integer): Currency;
var
   TotalBT60A: Currency;
begin
  //
    TotalBT60A := 0;
    Q60A.close;
    Q60A.Parambyname('codigo').AsInteger := COD;
    Q60A.Open;
    while not Q60A.Eof do
    begin
      if Q60AVALOR.AsCurrency > 0 then
      begin
        if trim(Q60AINDICE_R03.AsString) <> 'OPNF' then
           TotalBT60A := TotalBT60A + Q60AVALOR.AsCurrency;
      end;
      if Q60ATOT_OUTRO.AsCurrency > 0 then
        begin
           TotalBT60A := TotalBT60A + Q60ATOT_OUTRO.AsCurrency;
        end;
      Q60A.Next; Application.ProcessMessages;
    end;
  //  Q60A.Close;
    result := TotalBT60A;

end;

end.
