unit URegistrosdoPaf;

interface

uses
  SysUtils, Classes, Udm, DB, Dialogs, StrUtils, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TdmRegistrosdoPaf = class(TDataModule)
    TRBlocoVII: TFDTransaction;
    QMeiosPagamento: TFDQuery;
    QBlocoVII: TFDQuery;
    QMeiosPagamentoCODIGO: TIntegerField;
    QMeiosPagamentoCOD_CAI: TIntegerField;
    QMeiosPagamentoCOD_EMP: TIntegerField;
    QMeiosPagamentoCOO: TIntegerField;
    QMeiosPagamentoCCF: TIntegerField;
    QMeiosPagamentoGNF: TIntegerField;
    QMeiosPagamentoMEIO_PAGAMENTO: TStringField;
    QMeiosPagamentoVALOR_PAGO: TBCDField;
    QMeiosPagamentoDATA: TDateField;
    QMeiosPagamentoTIPO_DOCUMENTO: TStringField;
    QMeiosPagamentoSTATUS_EXPORTA: TIntegerField;
    TRRegistros: TFDTransaction;
    QConsulta: TFDQuery;
    QEstoque: TFDQuery;
    QEstoqueCOD_PRO: TIntegerField;
    QEstoqueDESC_CUPOM: TStringField;
    QEstoqueUNIDADE: TStringField;
    QEstoqueMENSURACAO: TStringField;
    QEstoqueESTOQUE_INICIAL: TBCDField;
    QEstoqueCODIGO_BARRA_PRO: TStringField;
    QOrcamento: TFDQuery;
    QOrcamentoCOO: TIntegerField;
    QOrcamentoCOO_VENDA: TIntegerField;
    QOrcamentoSEQUENCIA_DAV: TLargeintField;
    QOrcamentoDATA: TDateField;
    QOrcamentoTOTAL: TBCDField;
    QOrcamentoR01_NUMERO_SERIE: TStringField;
    QOrcamentoR01_MF_ADICIONAL: TStringField;
    QOrcamentoR01_TIPO_ECF: TStringField;
    QOrcamentoR01_MARCA_ECF: TStringField;
    QOrcamentoR01_MODELO_ECF: TStringField;
    QOrcamentoCCF_VENDA: TIntegerField;
    QOrcamentoNOME_CLI: TStringField;
    QOrcamentoCNPJ_CLI: TStringField;
    QOrcamentoCODIGO: TIntegerField;
    QBuscaItensDAV: TFDQuery;
    QBuscaItensDAVCODIGO: TIntegerField;
    QBuscaItensDAVORDEM: TIntegerField;
    QBuscaItensDAVCOD_PRO: TIntegerField;
    QBuscaItensDAVDESCONTO: TBCDField;
    QBuscaItensDAVCOD_EMP: TIntegerField;
    QBuscaItensDAVQUANT: TBCDField;
    QBuscaItensDAVVALOR: TBCDField;
    QBuscaItensDAVPRODUTO_PROMOCAO: TStringField;
    QBuscaItensDAVCANCELADO: TIntegerField;
    QBuscaItensDAVCHAVE: TStringField;
    QBuscaItensDAVNOME_PRO: TStringField;
    QBuscaItensDAVDESCRICAO: TStringField;
    QBuscaItensDAVTIPO_GRP: TStringField;
    QBuscaItensDAVALIQUOTA_GRP: TBCDField;
    QBuscaItensDAVDATA_INCLUSAO: TDateField;
    QBuscaItensDAVCODIGO_BARRA_PRO: TStringField;
    QBuscaItensDavLog: TFDQuery;
    QBuscaItensDavLogCODIGO: TIntegerField;
    QBuscaItensDavLogORDEM: TIntegerField;
    QBuscaItensDavLogCOD_PRO: TIntegerField;
    QBuscaItensDavLogDESCONTO: TBCDField;
    QBuscaItensDavLogCOD_EMP: TIntegerField;
    QBuscaItensDavLogQUANT: TBCDField;
    QBuscaItensDavLogVALOR: TBCDField;
    QBuscaItensDavLogPRODUTO_PROMOCAO: TStringField;
    QBuscaItensDavLogCANCELADO: TIntegerField;
    QBuscaItensDavLogTIPO: TStringField;
    QBuscaItensDavLogDATA_ALT: TDateField;
    QBuscaItensDavLogHORA_ALT: TTimeField;
    QBuscaItensDavLogNOME_PRO: TStringField;
    QBuscaItensDavLogDESCRICAO: TStringField;
    QBuscaItensDavLogTIPO_GRP: TStringField;
    QBuscaItensDavLogALIQUOTA_GRP: TBCDField;
    QBuscaItensDavLogCODIGO_BARRA_PRO: TStringField;
    QMesas: TFDQuery;
    IBTRMesas: TFDTransaction;
    QMesasCODIGO: TIntegerField;
    QMesasDATA_ABERTURA: TDateField;
    QMesasHORA_ABERTURA: TTimeField;
    QMesasCONTA: TIntegerField;
    QMesasDATA_FECHAMENTO: TDateField;
    QMesasHORA_FECHAMENTO: TTimeField;
    QMesasCOD_CAI: TIntegerField;
    QMesasCOD_EMP: TIntegerField;
    QMesasSTATUS: TIntegerField;
    QMesasTOTAL: TBCDField;
    QMesasCONTA_ORIGEM: TIntegerField;
    QMesasCER: TIntegerField;
    QMesasCOO: TIntegerField;
    QMesasCOO_VENDA: TIntegerField;
    QMesasR01_NUMERO_SERIE: TStringField;
    QMesasItens: TFDQuery;
    QMesasItensCODIGO_BARRA_PRO: TStringField;
    QMesasItensUNID: TStringField;
    QMesasItensQUANT: TBCDField;
    QMesasItensVALOR: TBCDField;
    QMesasItensDESC_CUPOM: TStringField;
    QMesasR01_CNPJ_USUARIO: TStringField;
    QTrocoH2: TFDQuery;
    QTrocoH2COD_EMP: TIntegerField;
    QTrocoH2COD_CAIXA: TIntegerField;
    QTrocoH2COO: TIntegerField;
    QTrocoH2CCF: TIntegerField;
    QTrocoH2DATA: TDateField;
    QTrocoH2VALOR: TBCDField;
    QTrocoH2CNPJ_CRED: TStringField;
    QTrocoH2CPF: TStringField;
    QTrocoH2TITULO: TStringField;
    QTrocoH2R01_NUMERO_SERIE: TStringField;
    QTrocoH2R01_MF_ADICIONAL: TStringField;
    QTrocoH2R01_TIPO_ECF: TStringField;
    QTrocoH2R01_MARCA_ECF: TStringField;
    QTrocoH2R01_MODELO_ECF: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }


    procedure MontaA2_MeiosPagamento( dataini, datafim: TDateTime );
    procedure MontaP2_Produtos;
    procedure MontaE_Estoque( Parcial: string );
    procedure MontaRegistrosD( dataini, datafim: TDateTime );
    procedure MontaRegistrosS( dataini, dataFim: TDateTime );
    procedure MontaRegistrosH2( dataini, dataFim: TDateTime );
    // ALTERACOES
    function Verifica_Alteracao_A2(cod, cod_emp, CODCAI: integer): boolean;
    function Verifica_prod_alterado( COD_PRO: Integer ): Boolean;
    function Registro_E2_valido( COD_EMP, COD_PRO: Integer ): Boolean;
    function Registro_E3_Valido( COD_EMP, COD_CAI: Integer ): Boolean;
    function Empresa_Valido( COD_EMP: Integer ): Boolean;
    function Verifica_alteracao_D3( CODIGO, ORDEM: Integer ): Boolean;
    function Verifica_Alteracao_D2( COD_ORC: Integer ): Boolean;
    function Verifica_Alteracao_H2(coo, cod_emp, CODCAI: integer): boolean;
    // INCLUSAO EXCLUSAO
    function Verifica_IncExc_U1( dataini, datafim: TDateTime ): Boolean;
    function VerificaIncExc_D1( D1, D2: Tdate ): Boolean;
    function Registro_E1_InclusaoExclusao( COD_EMP, COD_CAI: Integer ): Boolean;
    function Verifica_IncExc_P1: Boolean;
    function VerificaIncExc_H2( D1, D2: Tdate ): Boolean;

  end;

var
  dmRegistrosdoPaf: TdmRegistrosdoPaf;

implementation

uses
  Ubibli1;

{$R *.dfm}



procedure TdmRegistrosdoPaf.MontaA2_MeiosPagamento(dataini, datafim: TDateTime);
begin
  dm.PAF.PAF_A.RegistroA2.Clear;
  if TRRegistros.Active then
     TRRegistros.Commit;
  TRRegistros.StartTransaction;
  QMeiosPagamento.Close;
  QMeiosPagamento.ParamByName( 'cod_cai' ).AsInteger := iCaixa;
  QMeiosPagamento.ParamByName( 'cod_emp' ).AsInteger := iEmp;
  QMeiosPagamento.ParamByName( 'dataini' ).AsDateTime := dataini;
  QMeiosPagamento.ParamByName( 'datafim' ).AsDateTime := datafim;
  QMeiosPagamento.Open;
  while not QMeiosPagamento.Eof do
     begin
        with dm.PAF.PAF_A.RegistroA2.New do
           begin
              DT := QMeiosPagamentoDATA.AsDateTime;
              MEIO_PGTO := QMeiosPagamentoMEIO_PAGAMENTO.AsString;
              VL := QMeiosPagamentoVALOR_PAGO.AsCurrency;
              if trim(  QMeiosPagamentoTIPO_DOCUMENTO.AsString ) = 'COMP.NAO FISCAL' then
                 TIPO_DOC := '2'
                 else if trim( QMeiosPagamentoTIPO_DOCUMENTO.AsString ) = 'CUPOM FISCAL' then
                    TIPO_DOC := '1'
                 else if trim( QMeiosPagamentoTIPO_DOCUMENTO.AsString ) = 'NOTA FISCAL' then
                       TIPO_DOC := '3';
              RegistroValido :=  Verifica_Alteracao_A2( QMeiosPagamentoCODIGO.AsInteger, iEmp, iCaixa );
           end;
        QMeiosPagamento.Next;
     end;
  QMeiosPagamento.Close;
  TRRegistros.Commit;
end;

function TdmRegistrosdoPaf.Verifica_Alteracao_A2(cod, cod_emp, CODCAI: integer): boolean;
begin
  //
  if TRBlocoVII.Active then
    TRBlocoVII.Commit;
  TRBlocoVII.StartTransaction;

  QBlocoVII.close;
  QBlocoVII.sql.Text :=
    'select * from SP_VERIFICA_ALTERACAO_A2(:CODEMP, :CODCAI, :COD );';
  QBlocoVII.Parambyname('COD').AsInteger := COD;
  QBlocoVII.Parambyname('CODEMP').AsInteger := cod_emp;
  QBlocoVII.Parambyname('CODCAI').AsInteger := CODCAI;
  QBlocoVII.open;
  if QBlocoVII.fieldbyname('ALTERADO').AsString = 'N' then
    result := true
  else
    result := False;

  TRBlocoVII.Commit;

end;

function TdmRegistrosdoPaf.Verifica_Alteracao_H2(coo, cod_emp, CODCAI: integer): boolean;
begin
  //
  if TRBlocoVII.Active then
    TRBlocoVII.Commit;
  TRBlocoVII.StartTransaction;

  QBlocoVII.close;
  QBlocoVII.sql.Text :=
    'select * from SP_VERIFICA_ALTERACAO_H2(:CODEMP, :CODCAI, :COD );';
  QBlocoVII.Parambyname('COD').AsInteger := Coo;
  QBlocoVII.Parambyname('CODEMP').AsInteger := cod_emp;
  QBlocoVII.Parambyname('CODCAI').AsInteger := CODCAI;
  QBlocoVII.open;
  if QBlocoVII.fieldbyname('ALTERADO').AsString = 'N' then
    result := true
  else
    result := False;

  TRBlocoVII.Commit;

end;


function TdmRegistrosdoPaf.Verifica_IncExc_U1(dataini,
  datafim: TDateTime): Boolean;
var
   Temp : Boolean;
begin
//
   Temp := dm.Verifica_IncExc_R01( dataini , datafim ) or
   VerificaIncExc_D1( dataini, datafim ) or VerificaIncExc_H2( dataini, datafim ) or
   Registro_E1_InclusaoExclusao( iEmp, iCaixa ) or
   Verifica_IncExc_P1;
   result := Temp;
end;

function TdmRegistrosdoPaf.VerificaIncExc_D1( D1, D2: Tdate ): Boolean;
begin
  //
  if TRBlocoVII.Active then
     TRBlocoVII.Commit;
  TRBlocoVII.StartTransaction;

  QBlocoVII.Close;
  QBlocoVII.SQL.Text := 'select ALTERADO from SP_VERIFICA_INCEXC_D1( :D1, :D2 )';
  QBlocoVII.ParamByName( 'D1').AsDate := D1;
  QBlocoVII.ParamByName( 'D2' ).AsDate := D2;
  QBlocoVII.Open;
  if QBlocoVII.FieldByName( 'ALTERADO' ).AsString = 'N' then
     result := false
  else
     Result := true;

  TRBlocoVII.Commit;
end;

function TdmRegistrosdoPaf.VerificaIncExc_H2( D1, D2: Tdate ): Boolean;
begin
  //
  if TRBlocoVII.Active then
     TRBlocoVII.Commit;
  TRBlocoVII.StartTransaction;

  QBlocoVII.Close;
  QBlocoVII.SQL.Text := 'select ALTERADO from SP_VERIFICA_INCEXC_H2( :D1, :D2 )';
  QBlocoVII.ParamByName( 'D1').AsDate := D1;
  QBlocoVII.ParamByName( 'D2' ).AsDate := D2;
  QBlocoVII.Open;
  if QBlocoVII.FieldByName( 'ALTERADO' ).AsString = 'N' then
     result := false
  else
     Result := true;

  TRBlocoVII.Commit;
end;

procedure TdmRegistrosdoPaf.MontaE_Estoque(Parcial: string);
var
   Sql: string;
   DATA_ALT: TDateTime;
   HORA_ALT: TDateTime;
   NUMERO_SERIE, MF_ADICIONAL,
    TIPO_ECF, MARCA_ECF, MODELO_ECF: string;
   StrData: String;
begin
   if TRRegistros.Active then
      TRRegistros.Commit;
   TRRegistros.StartTransaction;
   with QConsulta do
      begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT DATA_ATUALIZACAO_ESTOQUE, ' +
                        'HORA_ATUALIZACAO_ESTOQUE ' +
                        'FROM PARAMETROS        ' +
                        'WHERE COD_EMP = :CODEMP';
             Parambyname('codemp').AsInteger:= iEmp;
             Open;
             DATA_ALT := fieldbyname('DATA_ATUALIZACAO_ESTOQUE').AsDateTime;
             HORA_ALT  := fieldbyname('HORA_ATUALIZACAO_ESTOQUE').AsDateTime;
             StrData := FormatDateTime( 'dd/mm/yyyy', DATA_ALT ) + ' ' +
                FormatDateTime( 'hh:mm:ss', HORA_ALT );
             close;
      end;
   with QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT R01_NUMERO_SERIE,R01_MF_ADICIONAL,'+
               'R01_TIPO_ECF,R01_MARCA_ECF,R01_MODELO_ECF ' +
                        'FROM CAIXA        ' +
                        'WHERE COD_EMP = :CODEMP and COD_CAI=:COD_CAI';
             Parambyname('codemp').AsInteger:= iEmp;
             Parambyname('cod_CAI').AsInteger:= iCaixa;
             Open;
             NUMERO_SERIE := fieldbyname('R01_NUMERO_SERIE').AsString;
             MF_ADICIONAL  := fieldbyname('R01_MF_ADICIONAL').AsString;
             TIPO_ECF  := fieldbyname('R01_TIPO_ECF').AsString;
             MARCA_ECF  := fieldbyname('R01_MARCA_ECF').AsString;
             MODELO_ECF  := fieldbyname('R01_MODELO_ECF').AsString;
          end;
   dm.PAF.PAF_E.RegistroE2.Clear;
   dm.PAF.PAF_E.RegistroE3.RegistroValido := Registro_E3_Valido( iEmp, iCaixa );
   dm.PAF.PAF_E.RegistroE3.NUM_FAB := NUMERO_SERIE;
   dm.PAF.PAF_E.RegistroE3.MF_ADICIONAL := MF_ADICIONAL;
   dm.PAF.PAF_E.RegistroE3.TIPO_ECF := TIPO_ECF;
   dm.PAF.PAF_E.RegistroE3.MARCA_ECF := MARCA_ECF;
   dm.PAF.PAF_E.RegistroE3.MODELO_ECF := MODELO_ECF;
   dm.PAF.PAF_E.RegistroE3.DT_EST := StrToDateTime( StrData );
//Empresa_Valido( iemp )
   Sql := 'select p.codigo_barra_pro ,e.cod_pro,  p.desc_cupom, u.descricao unidade,' +
   ' case when e.estoque_inicial < 0 then ' + #39 + '-' + #39 + ' else ' + #39 + '+' + #39 + ' end'+
   ' mensuracao,e.estoque_inicial from estoque e' +
   ' inner join produto p' +
   ' on ( p.cod_pro = e.cod_pro ) ' +
   ' inner join  unidade_medida u ' +
   ' on ( u.codigo = p.codigo_unidade_saida )' +
   ' where e.cod_emp = :cod_emp ';
   if Parcial <> '' then
      Sql := Sql + ' and e.cod_pro in ( ' + Parcial + ')';
   QEstoque.Close;
   QEstoque.SQL.Text := Sql;
   QEstoque.ParamByName( 'cod_emp' ).AsInteger := iEmp;
   QEstoque.Open;
   while not QEstoque.Eof do
      begin
         with dm.PAF.PAF_E.RegistroE2.New do
            begin
               COD_MERC := QEstoqueCODIGO_BARRA_PRO.AsString;
               DESC_MERC := QEstoqueDESC_CUPOM.AsString;
               UN_MED := QEstoqueUNIDADE.AsString;
               QTDE_EST := QEstoqueESTOQUE_INICIAL.AsFloat;
               RegistroValido := Registro_E2_valido( iEmp, QEstoqueCOD_PRO.AsInteger );
            end;
         QEstoque.Next;
      end;
   QEstoque.Close;
   TRRegistros.Commit;
end;

procedure TdmRegistrosdoPaf.MontaP2_Produtos;
var sRazao, sCNPJ, sIE, sIM : string;
    ArqNormal  : TextFile;
    ArqPrazo   : TextFile;
    sAux       : string;
    sSitTrib   : string;
    iContP2    : integer;
    iTotalProd : integer;
    sEADNormal : string;
    sEADPrazo  : string;

begin

   if TRRegistros.Active then
      TRRegistros.Commit;
   TRRegistros.StartTransaction;
   try
     try
       with QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT P.COD_PRO, P.NOME_PRO, ' +
                        'P.TIPO_PRODUCAO, P.VALOR_PRO, P.PRECO_PRAZO_PRO,   ' +
                        'P.CODIGO_BARRA_PRO, G.TIPO_GRP, G.ALIQUOTA_GRP,    ' +
                        'U.DESCRICAO, G.ICMS_SERVICO_GRP                                        ' +
                        'FROM PRODUTO P '                                     +
                        'INNER JOIN UNIDADE_MEDIDA U ' +
                        'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)             ' +
                        'INNER JOIN GRUPO_ICMS G '                            +
                        'ON (P.ICMS_CF_EST = G.COD_GRP) '                     +
                        'ORDER BY P.COD_PRO';
             Open;
             First;
             dm.PAF.PAF_P.RegistroP2.Clear;
             while not eof do
                begin
                   if trim(fieldbyname('ICMS_SERVICO_GRP').AsString) = 'S' then
                       sSitTrib:= 'S'
                   else
                   if trim(fieldbyname('tipo_grp').AsString) = 'TRI' then
                      sSitTrib:= 'T'
                   else
                      if trim(fieldbyname('tipo_grp').AsString) = 'ISE' then
                         sSitTrib:= 'I'
                      else
                         if trim(fieldbyname('tipo_grp').AsString) = 'ST' then
                            sSitTrib:= 'F'
                         else
                            if trim(fieldbyname('tipo_grp').AsString) = 'NT' then
                                sSitTrib:= 'N';



                        with Dm.PAF.PAF_P.RegistroP2.New do
                           begin
                                COD_MERC_SERV := fieldbyname('codigo_barra_pro').AsString;
                                DESC_MERC_SERV:= fieldbyname('nome_pro').AsString;
                                UN_MED        := fieldbyname('descricao').AsString;
                                IAT           :='T';
                                IPPT          := fieldbyname('tipo_producao').AsString;
                                ST            := sSitTrib;
                                ALIQ          := fieldbyname('aliquota_grp').AsCurrency;
                                VL_UNIT       := fieldbyname('valor_pro').AsCurrency;
                                RegistroValido := ( Verifica_prod_alterado( fieldbyname('COD_PRO').AsInteger ) and Empresa_Valido( iemp ));
                           end;
                        with Dm.PAF.PAF_P.RegistroP2.New do
                           begin
                                COD_MERC_SERV := fieldbyname('codigo_barra_pro').AsString;
                                DESC_MERC_SERV:= fieldbyname('nome_pro').AsString;
                                UN_MED        := fieldbyname('descricao').AsString;
                                IAT           :='T';
                                IPPT          := fieldbyname('tipo_producao').AsString;
                                ST            := sSitTrib;
                                ALIQ          := fieldbyname('aliquota_grp').AsCurrency;
                                VL_UNIT       := fieldbyname('PRECO_PRAZO_PRO').AsCurrency;
                                RegistroValido :=  ( Verifica_prod_alterado( fieldbyname('COD_PRO').AsInteger ) and Empresa_Valido( iemp ));
                           end;



                   Inc(iContP2);
           //        pb.Position:= iContP2;
                   next;
                end;
          end;
       TRRegistros.Commit;
     except
       TRRegistros.Rollback;
    //   showmessage('Erro ao buscar dados dos produtos');
     end;
   finally
     QConsulta.Close;
   end;

end;

procedure TdmRegistrosdoPaf.MontaRegistrosD(dataini, datafim: TDateTime);
var
   sSitTrib: string;
   TD2: Boolean;
begin
   dm.PAF.PAF_D.RegistroD2.Clear;

   { registro D2 - RELACAO DOS DAV EMITIDOS - ORÇAMENTO }
   if TRRegistros.Active then
      TRRegistros.Commit;
   TRRegistros.StartTransaction;
   with QOrcamento do
      begin
         close;
         parambyname('dataini').AsDate:= dataini;
         parambyname('datafin').AsDate:= DataFim;
         open;
         while not eof do
            begin
               with dm.PAF.PAF_D.RegistroD2.New do
                 begin

                     COO          := QOrcamentoCOO.AsString;
                     NUM_DAV      := FormataStringD(QOrcamentoSEQUENCIA_DAV.AsString, '13', '0');
                     DT_DAV       := QOrcamentoDATA.AsDateTime;
                     TIT_DAV      := 'Orcamento';
                     VLT_DAV      := QOrcamentoTOTAL.AsCurrency;
                     COO_DFV      := QOrcamentoCOO_VENDA.AsString;

                     if not ( ( COO = '0' ) and ( COO_DFV = '0' )) then
                        begin
                           NUM_FAB      := QOrcamentoR01_NUMERO_SERIE.AsString;
                           MF_ADICIONAL := trim(QOrcamentoR01_MF_ADICIONAL.AsString);
                           TIPO_ECF     := QOrcamentoR01_TIPO_ECF.AsString;
                           MARCA_ECF    := QOrcamentoR01_MARCA_ECF.AsString;
                           MODELO_ECF   := QOrcamentoR01_MODELO_ECF.AsString;
                           NUMERO_ECF   := IntToStr( iCaixa );
                        end;


                     NOME_CLIENTE := QOrcamentoNOME_CLI.AsString;//;
                     CPF_CNPJ     := RetiraCaracter( QOrcamentoCNPJ_CLI.AsString );

                     QBuscaItensDAV.Close;
                     QBuscaItensDAV.ParamByName( 'CODIGO' ).AsInteger := QOrcamentoCODIGO.AsInteger;
                     QBuscaItensDAV.Open;
                     QBuscaItensDAV.First;
                     while not QBuscaItensDAV.Eof do
                        begin
                           with RegistroD3.New do
                               begin
                                  if trim(QBuscaItensDAVTIPO_GRP.AsString) = 'TRI' then
                                    sSitTrib:= 'T'
                                   else
                                      if trim(QBuscaItensDAVTIPO_GRP.AsString) = 'ISE' then
                                         sSitTrib:= 'I'
                                       else
                                          if trim(QBuscaItensDAVTIPO_GRP.AsString) = 'ST' then
                                              sSitTrib:= 'F'
                                           else
                                              if trim(QBuscaItensDAVTIPO_GRP.AsString) = 'NT' then
                                                  sSitTrib:= 'N'
                                              else
                                                 if trim(QBuscaItensDAVTIPO_GRP.AsString) = 'SER' then
                                                    sSitTrib:= 'S';
                                   DT_INCLUSAO   := QBuscaItensDAVDATA_INCLUSAO.AsDateTime;
                                   NUM_ITEM      := QBuscaItensDAVORDEM.AsInteger;
                                   COD_ITEM      := QBuscaItensDAVCODIGO_BARRA_PRO.AsString;
                                   DESC_ITEM     := QBuscaItensDAVNOME_PRO.AsString;
                                   QTDE_ITEM     := QBuscaItensDAVQUANT.AsFloat;
                                   UNI_ITEM      := QBuscaItensDAVDESCRICAO.AsString;
                                   VL_UNIT       := QBuscaItensDAVVALOR.AsCurrency / QBuscaItensDAVQUANT.AsCurrency;
                                   VL_DESCTO     := QBuscaItensDAVDESCONTO.AsCurrency;
                                   VL_ACRES      := 0.00;
                                   VL_TOTAL      := QBuscaItensDAVVALOR.AsCurrency;
                                   SIT_TRIB      := sSitTrib; // T, S, I, N, F
                                   ALIQ          := QBuscaItensDAVALIQUOTA_GRP.AsCurrency; // SOMENTE QUANDO T E S
                                   if QBuscaItensDAVCANCELADO.AsInteger = 1 then
                                      IND_CANC      := 'S'
                                   else
                                      IND_CANC      := 'N';
                                   DEC_QTDE_ITEM := 3;
                                   DEC_VL_UNIT   := 2;


                                   RegistroValido := Verifica_alteracao_D3( QBuscaItensDAVCODIGO.AsInteger, QBuscaItensDAVORDEM.AsInteger );

                               end;
                           QBuscaItensDAV.Next;
                         end;
                     QBuscaItensDAVLOg.Close;
                     QBuscaItensDAVLog.Close;
                     QBuscaItensDAVLog.ParamByName( 'CODIGO' ).AsInteger := QOrcamentoCODIGO.AsInteger;
                     QBuscaItensDAVLog.Open;
                     QBuscaItensDAVLog.First;
                     while not QBuscaItensDAVLog.Eof do
                        begin
                           with RegistroD4.New do
                               begin
                                  if trim(QBuscaItensDAVLogTIPO_GRP.AsString) = 'TRI' then
                                    sSitTrib:= 'T'
                                   else
                                      if trim(QBuscaItensDAVLogTIPO_GRP.AsString) = 'ISE' then
                                         sSitTrib:= 'I'
                                       else
                                          if trim(QBuscaItensDAVLogTIPO_GRP.AsString) = 'ST' then
                                              sSitTrib:= 'F'
                                           else
                                              if trim(QBuscaItensDAVLogTIPO_GRP.AsString) = 'NT' then
                                                  sSitTrib:= 'N'
                                              else
                                                 if trim(QBuscaItensDAVLogTIPO_GRP.AsString) = 'SER' then
                                                    sSitTrib:= 'S';
                  //                 DT_INCLUSAO   := QBuscaItensDAVLogDATA_INCLUSAO.AsDateTime;
                    //               NUM_ITEM      := QBuscaItensDAVLogORDEM.AsInteger;
                                   NUM_DAV       := FormataStringD( QOrcamentoSEQUENCIA_DAV.AsString, '13', '0' );
                                   COD_ITEM      := QBuscaItensDAVLogCODIGO_BARRA_PRO.AsString;
                                   DESC_ITEM     := QBuscaItensDAVLogNOME_PRO.AsString;
                                   QTDE_ITEM     := QBuscaItensDAVLogQUANT.AsFloat;
                                   UNI_ITEM      := QBuscaItensDAVLogDESCRICAO.AsString;
                                   VL_UNIT       := QBuscaItensDAVLogVALOR.AsCurrency / QBuscaItensDAVLogQUANT.AsCurrency;
                                   VL_DESCTO     := QBuscaItensDAVLogDESCONTO.AsCurrency;
                                   VL_ACRES      := 0.00;
                                   VL_TOTAL      := QBuscaItensDAVLogVALOR.AsCurrency;
                                   SIT_TRIB      := sSitTrib; // T, S, I, N, F
                                   ALIQ          := QBuscaItensDAVLogALIQUOTA_GRP.AsCurrency; // SOMENTE QUANDO T E S
                                   if QBuscaItensDAVLogCANCELADO.AsInteger = 1 then
                                      IND_CANC      := 'S'
                                   else
                                      IND_CANC      := 'N';
                                   DEC_QTDE_ITEM := 3;
                                   DEC_VL_UNIT   := 2;
                                   DT_ALT := StrToDateTime( QBuscaItensDavLogDATA_ALT.AsString +
                                   ' ' + QBuscaItensDavLogHORA_ALT.AsString );
                                   TIP_ALT := QBuscaItensDavLogTIPO.AsString;

                                   RegistroValido := True;

                               end;
                           QBuscaItensDAVLog.Next;
                         end;

                     QBuscaItensDAVLog.Close;
                     TD2 := Verifica_Alteracao_D2( QOrcamentoCODIGO.AsInteger );
                     RegistroValido := TD2;

                 end;


               next;
            end;
      end;
   TRRegistros.Commit;
   QOrcamento.Close;


end;

procedure TdmRegistrosdoPaf.MontaRegistrosH2(dataini, dataFim: TDateTime);
begin
//
   DM.PAF.PAF_H.LimpaRegistros;
   if TRRegistros.Active then
      TRRegistros.Commit;
   TRRegistros.StartTransaction;
   QTrocoH2.Close;
   QTrocoH2.ParamByName( 'COD_CAIXA' ).AsInteger := iCaixa;
   QTrocoH2.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
   QTrocoH2.ParamByName( 'DATAINI' ).AsDateTime := dataini;
   QTrocoH2.ParamByName( 'DATAFIM' ).AsDateTime := dataFim;
   QTrocoH2.Open;
   QTrocoH2.First;
   while not QTrocoH2.Eof do
       begin
          with DM.PAF.PAF_H.RegistroH2.New do
             begin
                CNPJ_CRED_CARTAO := QTrocoH2CNPJ_CRED.AsString;
                NUM_FAB          := QTrocoH2R01_NUMERO_SERIE.AsString;
                MF_ADICIONAL     := QTrocoH2R01_MF_ADICIONAL.AsString;
                TIPO_ECF         := QTrocoH2R01_TIPO_ECF.AsString;
                MARCA_ECF        := QTrocoH2R01_MARCA_ECF.AsString;
                MODELO_ECF       := QTrocoH2R01_MODELO_ECF.AsString;
                COO              := QTrocoH2COO.AsInteger;
                CCF              := QTrocoH2CCF.AsInteger;
                VLR_TROCO        := QTrocoH2VALOR.AsCurrency;
                DT_TROCO         := QTrocoH2DATA.AsDateTime;
                CPF              := QTrocoH2CPF.AsString;
                Titulo           := QTrocoH2TITULO.AsInteger;

                RegistroValido := Verifica_Alteracao_H2( QTrocoH2COO.AsInteger,
                iEmp, iCaixa )
             end;
          QTrocoH2.Next;
       end;
   QTrocoH2.Close;
   TRRegistros.Commit;


end;

procedure TdmRegistrosdoPaf.MontaRegistrosS(dataini, dataFim: TDateTime);
var
   Estava:Boolean;
begin
//
   Estava := False;
   if  DM.IBDatabaseServer.Connected then
      Estava := True
   else
      begin
         try
            DM.IBDatabaseServer.Connected := True;
         except
            exit;
         end;
      end;
   if IBTRMesas.Active then
      IBTRMesas.Commit;
   IBTRMesas.StartTransaction;

   QMesas.Close;
   QMesas.ParamByName( 'dataini' ).AsDate := dataini;
   QMesas.ParamByName( 'datafim' ).AsDate := datafim;
   QMesas.ParamByName( 'cod_emp' ).AsInteger := iEmp;
   QMesas.Open;
   QMesas.First;
   while not QMesas.Eof do
      begin
         with dm.PAF.PAF_S.RegistroS2.New do
            begin
               CNPJ := QMesasR01_CNPJ_USUARIO.AsString;
               DT_ABER := StrToDateTime( QMesasDATA_ABERTURA.AsString + ' '+
               QMesasHORA_ABERTURA.AsString );
               SITU := ifthen( ( QMesasSTATUS.AsInteger = 1 ) or ( QMesasSTATUS.AsInteger = 2 ) or ( QMesasSTATUS.AsInteger = 3 ) , 'F', 'A' );
               VL_TOT := QMesasTOTAL.AsCurrency;
               COO_CM := IfThen( QMesasCOO.IsNull, '', QMesasCOO.AsString );
               NUM_FAB_CM := IfThen( QMesasCOO.IsNull, '', QMesasR01_NUMERO_SERIE.AsString );
               COO := IfThen( QMesasCOO_VENDA.IsNull, '', QMesasCOO_VENDA.AsString );
               NUM_FAB := IfThen( QMesasCOO_VENDA.IsNull, '', QMesasR01_NUMERO_SERIE.AsString );
               if QMesasSTATUS.AsInteger = 0 then
                   begin
                      QMesasItens.Close;
                      QMesasItens.ParamByName( 'cod_emp' ).AsInteger := iEmp;
                      QMesasItens.ParamByName( 'cod' ).AsInteger := QMesasCODIGO.AsInteger;
                      QMesasItens.Open;
                      QMesasItens.First;
                      while not QMesasItens.Eof do
                          begin
                              with RegistroS3.New do
                                 begin
                                    COD_ITEM := QMesasItensCODIGO_BARRA_PRO.AsString;
                                    DESC_ITEM := QMesasItensDESC_CUPOM.AsString;
                                    UNI_ITEM := QMesasItensUNID.AsString;
                                    VL_UNIT := QMesasItensVALOR.AsCurrency;
                                    QTDE_ITEM := QMesasItensQUANT.AsExtended;

                                 end;
                              QMesasItens.Next;
                          end;
                      QMesasItens.Close;
                   end;
            end;
         QMesas.Next;
      end;
   QMesas.Close;
   IBTRMesas.Commit;
   if not Estava then
      DM.IBDatabaseServer.Connected := False;
end;

function TdmRegistrosdoPaf.Registro_E1_InclusaoExclusao( COD_EMP, COD_CAI: Integer ): Boolean;
begin
  //
  if TRBlocoVII.Active then
     TRBlocoVII.Commit;
  TRBlocoVII.StartTransaction;

  QBlocoVII.Close;
  QBlocoVII.SQL.Text := 'SELECT ALTERADO FROM SP_VERIFICA_PRO_ESTOQUE( :DI, :CODEMP, :CODCAI )';
  QBlocoVII.ParamByName( 'DI' ).AsString := 'DI';
  QBlocoVII.ParamByName( 'CODEMP' ).AsInteger := COD_EMP;
  QBlocoVII.ParamByName( 'CODCAI' ).AsInteger := COD_CAI;
  QBlocoVII.Open;
  if ( QBlocoVII.FieldByName( 'ALTERADO' ).AsString = 'N' ) then
     result := false
  else
     result := True;
  QBlocoVII.Close;
  TRBlocoVII.Commit;
end;

function TdmRegistrosdoPaf.Verifica_IncExc_P1: Boolean;
begin
  //
  //
  if TRBlocoVII.Active then
     TRBlocoVII.Commit;
  TRBlocoVII.StartTransaction;

  QBlocoVII.Close;
  QBlocoVII.SQL.Text := 'SELECT ALTERADO FROM SP_VERIFICA_INCEXC_P1';
  QBlocoVII.Open;
  if ( QBlocoVII.FieldByName( 'ALTERADO' ).AsString = 'N' ) then
     result := false
  else
     result := true;
  QBlocoVII.Close;
  TRBlocoVII.Commit;
end;

function TdmRegistrosdoPaf.Verifica_prod_alterado( COD_PRO: Integer ): Boolean;
begin
//
  //
  if TRBlocoVII.Active then
     TRBlocoVII.Commit;
  TRBlocoVII.StartTransaction;

  QBlocoVII.Close;
  QBlocoVII.SQL.Text := 'SELECT ALTERADO FROM SP_VERIFICA_PRO( :CODPRO )';
  QBlocoVII.ParamByName( 'CODPRO' ).AsInteger := COD_PRO;
  QBlocoVII.Open;
  if ( QBlocoVII.FieldByName( 'ALTERADO' ).AsString = 'N' ) then
     result := True
  else
     result := false;
  QBlocoVII.Close;
  TRBlocoVII.Commit;
end;

function TdmRegistrosdoPaf.Registro_E2_valido( COD_EMP, COD_PRO: Integer ): Boolean;
begin
  //
  if TRBlocoVII.Active then
     TRBlocoVII.Commit;
  TRBlocoVII.StartTransaction;

  QBlocoVII.Close;
  QBlocoVII.SQL.Text := 'SELECT ALTERADO FROM SP_VERIFICA_PRO_ESTOQUE( :DI, :CODEMP, :CODPRO )';
  QBlocoVII.ParamByName( 'DI' ).AsString := 'U';
  QBlocoVII.ParamByName( 'CODEMP' ).AsInteger := COD_EMP;
  QBlocoVII.ParamByName( 'CODPRO' ).AsInteger := COD_PRO;
  QBlocoVII.Open;
  if ( QBlocoVII.FieldByName( 'ALTERADO' ).AsString = 'N' ) then
     result := True
  else
     result := False;
  QBlocoVII.Close;
  TRBlocoVII.Commit;
end;

function TdmRegistrosdoPaf.Registro_E3_Valido( COD_EMP, COD_CAI: Integer ): Boolean;
begin
  //
  if TRBlocoVII.Active then
     TRBlocoVII.Commit;
  TRBlocoVII.StartTransaction;

  QBlocoVII.Close;
  QBlocoVII.SQL.Text := 'SELECT ALTERADO FROM SP_VERIFICA_ALTERACAO_E3( :CODEMP, :CODCAI )';
  QBlocoVII.ParamByName( 'CODEMP' ).AsInteger := COD_EMP;
  QBlocoVII.ParamByName( 'CODCAI' ).AsInteger := COD_CAI;
  QBlocoVII.Open;
  if ( QBlocoVII.FieldByName( 'ALTERADO' ).AsString = 'N' ) then
     result := True
  else
     result := false;
  QBlocoVII.Close;
  TRBlocoVII.Commit;
end;

function TdmRegistrosdoPaf.Empresa_Valido( COD_EMP: Integer ): Boolean;
begin
  //
  if TRBlocoVII.Active then
     TRBlocoVII.Commit;
  TRBlocoVII.StartTransaction;

  QBlocoVII.Close;
  QBlocoVII.SQL.Text := 'SELECT ALTERADO FROM SP_VERIFICA_ALTERACA_EMPRESA( :CODEMP )';
  QBlocoVII.ParamByName( 'CODEMP' ).AsInteger := COD_EMP;
  QBlocoVII.Open;
  if ( QBlocoVII.FieldByName( 'ALTERADO' ).AsString = 'N' ) then
     result := True
  else
     result := false;
  QBlocoVII.Close;
  TRBlocoVII.Commit;
end;

function TdmRegistrosdoPaf.Verifica_Alteracao_D2( COD_ORC: Integer ): Boolean;
begin
  //
  if TRBlocoVII.Active then
     TRBlocoVII.Commit;
  TRBlocoVII.StartTransaction;

  QBlocoVII.Close;
  QBlocoVII.SQL.Text := 'select ALTERADO from SP_VERIFICA_ALTERACAO_D2( :COD_CAI, :COD_EMP, :COD_ORC )';
  QBlocoVII.ParamByName( 'COD_CAI' ).AsInteger := iCaixa;
  QBlocoVII.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
  QBlocoVII.ParamByName( 'COD_ORC' ).AsInteger := COD_ORC;
  QBlocoVII.Open;
  if QBlocoVII.FieldByName( 'ALTERADO' ).AsString = 'N' then
     result := True
  else
     Result := false;

  TRBlocoVII.Commit;
end;

function TdmRegistrosdoPaf.Verifica_alteracao_D3( CODIGO, ORDEM: Integer ): Boolean;
begin
  if TRBlocoVII.Active then
     TRBlocoVII.Commit;
  TRBlocoVII.StartTransaction;

  //SP_VERIFICA_ALTERACAO_D3
  QBlocoVII.Close;
  QBlocoVII.SQL.Text := 'select ALTERADO from SP_VERIFICA_ALTERACAO_D3( :CODIGO, :ORDEM )';
  QBlocoVII.ParamByName( 'CODIGO' ).AsInteger := CODIGO;
  QBlocoVII.ParamByName( 'ORDEM' ).AsInteger := ORDEM;
  QBlocoVII.Open;
  if QBlocoVII.FieldByName( 'ALTERADO' ).AsString = 'N' then
     result := True
  else
     Result := false;
  TRBlocoVII.Commit;


end;





end.
