unit UECF;

interface
uses
  Dialogs, Windows, SysUtils, Classes, Messages, Forms, Variants, ACBrDevice, 
  ACBrECFClass, Inifiles, UVendasCaixa, StrUtils, ACBrNFe, ACBrNFeDANFEFRDM, 
  ACBrNFeDANFEClass, ACBrNFeDANFEFR, pcnConversao, pcnNFe, pcnConversaoNFe, UDialog,
  ACBrUtil, System.Math;

// ALTERAÇÂO KADOSHI
procedure Cortar_papel();

// FIM
function GeraNFCe( CodVenda: INteger; const EnvioOFF: Boolean = false  ): Boolean;

function SubTotalizaCupom(const iAuxECF : integer; cDesconto : currency) : integer;

procedure LeituraX(const iAuxECF : integer);
procedure LeituraZ(const iAuxECF : integer; sHora : AnsiString);

function  AbreRelatoroGerencial(const iAuxECF : integer; const sIndice : AnsiString) : integer;
function  ImprimeRelatorioGerencial(const iAuxECF : integer; const sTexto : AnsiString) : integer;
function  FechaRelatorioGerencial(const iAuxECF : integer) : integer;

function  AbreECF(const iAuxECF : integer; const cSuprimento : currency) : integer;
function  NumeroSerieECF(const iAuxECF : integer) : AnsiString;
function  ModeloECF(const iAuxECF : integer) : AnsiString;
function  ECFLigada(const iAuxECF : integer) : boolean;
function  VersaoDLL(const iAuxECF : integer) : AnsiString;
function  CupomFiscalAberto(const iAuxECF : integer) : boolean;
function  NumeroCupom(const iAuxECF : integer) : AnsiString;
function  ContadorCupomFiscal(const iAuxECF : integer) : AnsiString;
function  ContadorNaoFiscal(const iAuxECF : integer) : AnsiString;
function  ContadorRelatorioGerencial(const iAuxECF : integer) : AnsiString;
function  ContadorComprovanteCreditoDebito(const iAuxECF : integer) : AnsiString;
function  NumeroECF(const iAuxECF : integer) : AnsiString;

function  AbreCupom(const iAuxECF : integer;   sEnd : String = ''; sCLI : String = ''; sDoc: String = '') : integer;
function  IniciaFechamentoCupomFiscal(const iAuxECF : integer; cDesconto : currency) : integer;
function  TotaldePagamentosEfetuados: Currency;
function  PagamentoCupomFiscal(const iAuxECF, iCOO, iCCF : integer; const cValor: currency; const sIndice, sDescricaoECF, SaiuECF : AnsiString; CODForma: integer) : integer;
function  PagamentoCupomFiscal2(const iAuxECF, iCOO, iCCF : integer; const cValor: currency; const sIndice, sDescricaoECF : AnsiString) : integer;
function  FechaCupomFiscal( iAuxECF : integer; sNomeCli, sDocCli, sEndCli : AnsiString; iSeqPreVenda, iSeqDAV, iSeqDAVOS, iECFContaCliente, iCOOContaCliente, iCERMesa, iNumeMesa : integer ) : integer;

function  SubTotalCupomFiscal(const iAuxECF : integer) : currency;
function  TotalItemVendido(const iAuxECF : integer) : currency;
function  CancelaCupomFiscal(const iAuxECF : integer) : integer;
function  CancelaItemCupomFiscal(const IAuxECF : integer; iOrdem : integer) : integer;

function  AbreCupomNaoFiscalVinculado(const iAuxECF : integer; const cValor : currency; const sNumCupom : AnsiString; const sFormaPagamento : AnsiString) : integer;
function  ImprimeCupomNaoFiscalVinculado(const iAuxECF : integer; const sTexto : AnsiString) : integer;
function  FechaCupomNaoFiscalVinculado(const iAuxECF : integer) : integer;

function  Sangria(const iAuxECF : integer; const cValor : currency) : integer;
function  Suprimento(const iAuxECF : integer; const cValor : currency) : integer;

function  RegistraItemECF(const iAuxECF, iTamanhoCod, iTamDesc : integer;
                          const sCodigoBarra, sDescricao, sIndiceICMS, sUnidade : AnsiString; const cQuant, cUnitario, cDesconto : currency) : integer;

procedure LeituraMFPeriodo(const iAuxECF : integer; DataIni, DataFin : TDateTime; const bCompleta : boolean);
procedure LeituraMFReducao(const iAuxECF : integer; const RedIni, RedFin : integer; const bCompleta : boolean);

procedure EspelhoMFPeriodo(const iAuxECF : integer; DataIni, DataFin : TDateTime; const bCompleta : boolean);
procedure EspelhoMFReducao(const iAuxECF : integer; const RedIni, RedFin : integer; const bCompleta : boolean);

procedure EspelhoMDFPerido(const iAuxECF : integer; DataIni, DataFin : TDateTime);
procedure EspelhoMDFCOO(const iAuxECF : integer; COOIni, COOFin : integer);

procedure AbreGaveta (const iAuxECF, iGaveta : integer);
procedure ProgramarHorarioVerao(const iAuxECF : integer);
procedure ImprimiConfigImpressora(const iAuxECF : integer);
procedure ProgramaAliquota(const iAuxECF, iICMSISS : integer; const cAliq : currency);
procedure ProgramaRelatorioGerencial(const iAuxECF : integer; const sIndice, sDescricao : AnsiString);

function  GT(const iAuxECF : integer) : AnsiString;
function  LeAliquotas(const iAuxECF : integer) : AnsiString;
function  StatusECF(const iAuxECF, iAuxTipo : integer) : AnsiString;
procedure MapaResumo (const iAuxECF : integer; const dDataMovimento : TDateTime);
procedure GravaGT(const iAuxECF : integer);
function  RetiraPontoString(sText: AnsiString) : AnsiString;
function  VerificaNumeroSerie( I: Integer = 1 ) : boolean;
function  VerificaGT( I: Integer = 1) : boolean;
function  DataHoraECF(const IAuxECF : integer) : AnsiString;
function  DataECF(const IAuxECF : integer) : TDateTime;
function  NumeroCER(const iAuxECF : integer) : AnsiString;
function  DataMovimentoECF(const iAuxECF : integer) : AnsiString;

function  GravaVenda(const iCOO, iCCF, iCER, iCliente, iVendedor, iTipoVenda, iCancelada : integer) : integer;
procedure GravaProdutoVenda(const iVenda, iProduto, iOrdem, iVendedor, iCancel, iCancelVenda : integer;
                            const cQuant, cValorUnit, cValorDesc : currency;
                            const sTipoDesconto : AnsiString;
                            const bProm :  boolean);
procedure GravaFechamentoVenda(const iCodVenda : integer; const cDesc, cTotal : currency; const sCliente, sCNPJ : AnsiString);
procedure GravaDadosCliente(  iCodVenda : integer;  sCliente, sCNPJ : AnsiString);
procedure GravaOutrosDocumentos(const sDescricao : AnsiString);
procedure GravaMeiosPagamento(const sMeioPagamento, sTipoDocumento : AnsiString; const cValor : currency; const iCOO, iCCF, iGNF : integer; const dData : TDateTime);
procedure GravaSuprimento(const cValor : currency);
procedure GravaTotalizadoresAntesZ;
function IsNumeric(S : String) : Boolean;

// MAPA RESUMO AUTOMATICO
procedure MapaResumoAutomatico (const iAuxECF : integer; IniTemp: TMemIniFile );

implementation
uses
  Udm, ubibli1, UFechaVenda, uMenTEF, Func;

procedure AguardaImpressaDANFCE;
begin
    Application.CreateForm( TfrmMenTef, frmMenTef );
    frmMenTef.lMensagemOperador.Visible := False;
    frmMenTef.lMensagemCliente.Visible := True;
    frmMenTef.bCancelarResp.Visible := False;
    frmMenTef.lMensagemCliente.Caption := 'Imprimindo DANFCe...';
    frmMenTef.Show;
    frmMenTef.BringToFront;
    while ( not DM.ECF.Ativo ) or ( not DM.ECF.Device.Ativo )do
       begin
           try
              dm.ECF.Ativar;
           except
              Application.ProcessMessages;
              Sleep( 500 );
              Application.ProcessMessages;
           end;
       end;
    frmMenTef.Close;
end;


function GeraNFCe( CodVenda: INteger;  const EnvioOFF: Boolean = false ): Boolean;
var
  NumNF, SerieNF: Integer;
  TotICMS, TotBCICMS, TotDesconto, TotProd, TotalIBPT: Double;
  DescontoVenda, DescRout: Double;
  AuxB: Boolean;
  TrocoDado: Boolean;
  TemDinheiro: Boolean;
  QuantFormas: Integer;
  Routtroco : Double;
  TrocoSair: Double;
  DescontodaVenda: Double;
  NomeCli, CPFCli: String;
  I: TNFe;
  ITot: Integer;
  GerouNumero: Boolean;
begin
   try
//           GravaFechamentoVenda( CodVenda, 0, 0
           GerouNumero := False;
           DescontodaVenda := 0;
           TrocoSair := 0;
           Routtroco := 0;
           TemDinheiro := False;
           QuantFormas := 0;
           TotICMS := 0;
           TotBCICMS := 0;
           DescontoVenda := 0;
           DescRout := 0;
           TotDesconto := 0;
           TotProd := 0;
           dm.ConfiguraNFCe;
           dm.NFCe.NotasFiscais.Clear;
           dm.NFCe.Configuracoes.Geral.ModeloDF := moNFCe;
            dm.NFCe.Configuracoes.Geral.VersaoDF := ve310;

            if dm.IBTransaction.Active then
               DM.IBTransaction.Commit;
            DM.IBTransaction.StartTransaction;

            with dm.QConsulta do
               begin
                  Close;
                  SQL.Text := 'Select * from VENDAS where cod_ven=:venda and cod_emp=:emp';
                       ParamByName( 'venda' ).AsInteger := CodVenda;
                       ParamByName( 'emp' ).AsInteger := iEmp;
                  Open;
                  NomeCli := FieldByName( 'R04_NOME_CLIENTE' ).AsString;
                  CPFCli := FieldByName( 'R04_CNPJ_CLIENTE' ).AsString;
                  DescontodaVenda := FieldByName( 'DESCONTO_VEN' ).AsExtended;
                  if Trim( FieldByName( 'NFCE_NUM' ).AsString ) = '' then
                     begin
                        dm.NovoNumeroNFCe(  NumNF , SerieNF);
                        GerouNumero := True;
                        Close;
                        SQL.Text := 'update VENDAS set  NFCE_NUM=:NFCE_NUM,' +
                                    ' OFFLINE=0, NFCE_SERIE=:NFCE_SERIE where cod_ven=:venda and cod_emp=:emp';
                        ParamByName( 'venda' ).AsInteger := CodVenda;
                        ParamByName( 'emp' ).AsInteger := iEmp;
                        ParamByName( 'NFCE_NUM' ).AsInteger := NumNF;
                        ParamByName( 'NFCE_SERIE' ).AsInteger := SerieNF;
                        ExecOrOpen;

                     end
                  else
                     begin
                        NumNF := FieldByName( 'NFCE_NUM' ).AsInteger;
                        SerieNF := FieldByName( 'NFCE_SERIE' ).AsInteger;
                     end;
                  Close;

               end;
            if dm.IBTransaction.Active then
               dm.IBTransaction.CommitRetaining;

           with dm.NFCe.NotasFiscais.Add.NFe do
           begin
             Ide.cNF := NumNF;
             Ide.serie :=  SerieNF;
             Ide.natOp     := 'VENDA';
             Ide.indPag    := ipVista;
             Ide.modelo    := 65;
             Ide.nNF       := NumNF;
             Ide.dEmi      := now;
             Ide.dSaiEnt   := now;
             Ide.hSaiEnt   := now;
             Ide.tpNF      := tnSaida;
             Ide.tpEmis    := teNormal;
             Ide.tpAmb     := dm.NFCe.Configuracoes.WebServices.Ambiente;

             Ide.finNFe    := fnNormal;
             Ide.tpImp     := tiNFCe;
             Ide.indFinal  := cfConsumidorFinal;
             Ide.indPres   := pcPresencial;


                 if dm.IBTransaction.Active then
                   dm.IBTransaction.Commit;
                 dm.IBTransaction.StartTransaction;

                 with dm.QConsulta do
                    begin
                       Close;
                       SQL.Text := 'select * from empresa where cod_emp=:cod_emp';
                       ParamByName( 'cod_emp' ).AsInteger := iEmp;
                       Open;
                         Ide.cMunFG := FieldByName( 'CODIGO_MUNICIPIO' ).AsInteger;
                         Ide.cUF       := UFtoCUF(FieldByName( 'EST_EMP' ).AsString);
                        Emit.CNPJCPF           := RetiraCaracter( FieldByName( 'CNPJ_EMP' ).AsString );
                        Emit.IE                := RetiraCaracter( FieldByName( 'INSC_EMP' ).AsString );
                        Emit.xNome             := FieldByName( 'RAZAO_EMP' ).AsString;
                        Emit.xFant             := FieldByName( 'FANTASIA_EMP' ).AsString;
                        Emit.EnderEmit.fone    := RetiraCaracter( FieldByName( 'TEL_EMP' ).AsString );
                        Emit.EnderEmit.CEP     := StrToInt(RetiraCaracter( FieldByName( 'CEP_EMP' ).AsString ));
                        Emit.EnderEmit.xLgr    := FieldByName( 'END_EMP' ).AsString;
                        Emit.EnderEmit.nro     := FieldByName( 'NUMERO_EMP' ).AsString;
                        Emit.EnderEmit.xCpl    := '';
                        Emit.EnderEmit.xBairro := FieldByName( 'BAI_EMP' ).AsString;
                        Emit.EnderEmit.cMun    := FieldByName( 'CODIGO_MUNICIPIO' ).AsInteger;

                        Emit.EnderEmit.xMun    := FieldByName( 'CID_EMP' ).AsString;
                        Emit.EnderEmit.UF      := FieldByName( 'EST_EMP' ).AsString;
                        Emit.EnderEmit.cPais   := 1058;
                        Emit.EnderEmit.xPais   := 'BRASIL';

                        Emit.IEST              := '';
                  //      Emitente.IM                := '2648800'; // Preencher no caso de existir serviços na nota
                  //      Emitente.CNAE              := '6201500'; // Verifique na cidade do emissor da NFe se é permitido
                                                      // a inclusão de serviços na NFe
                        if FieldByName( 'TIPO_EMP' ).AsInteger = 0 then
                           Emit.CRT := crtSimplesNacional
                        else
                           Emit.CRT               := crtRegimeNormal;// (1-crtSimplesNacional, 2-crtSimplesExcessoReceita, 3-crtRegimeNormal)
                        close;

                    end;
            if dm.IBTransaction.Active then
               dm.IBTransaction.CommitRetaining;
                 if not EnvioOFF then
                    DescontoVenda := FrmFechaVenda.EdtValorDesconto.Value
                 else
                     DescontoVenda := DescontodaVenda;


                 with dm.QConsulta do
                    begin
                       Close;
                       SQL.Text := 'select C.*, E.EST_EMP from CLIENTE C' +
                                   ' inner join EMPRESA E' +
                                   ' on( E.COD_EMP=:EMP )' +
                                   ' where C.COD_CLI=:CLI';
                       ParamByName( 'CLI' ).AsInteger := iCodCliente;
                       ParamByName( 'EMP' ).AsInteger := iEmp;
                       Open;
                       if ( iCodClientePadrao <>
                       iCodCliente ) and
                       ( Trim( FieldByName( 'FJ_CLI' ).AsString) <> 'J')
                       and  ( Trim( FieldByName( 'ESTRES_CLI' ).AsString ) = ( Trim( FieldByName( 'EST_EMP' ).AsString )) )  then
                          begin
                                Dest.indIEDest         := inNaoContribuinte;
                                Dest.CNPJCPF           := RetiraCaracter( FieldByName( 'CNPJ_CLI' ).AsString );
                                Dest.ISUF              := '';
                                Dest.xNome             := FieldByName( 'NOME_CLI' ).AsString ;
                                Dest.EnderDest.Fone    := FieldByName( 'TELRES_CLI' ).AsString ;
                                Dest.EnderDest.CEP     := StrToInt( retiracaracter(FieldByName( 'CEPRES_CLI' ).AsString ) );
                                Dest.EnderDest.xLgr    := FieldByName( 'ENDRES_CLI' ).AsString ;
                                Dest.EnderDest.nro     := FieldByName( 'NUMRES_CLI' ).AsString ;
                                Dest.EnderDest.xCpl    := '';
                                Dest.EnderDest.xBairro := FieldByName( 'BAIRES_CLI' ).AsString ;
                                Dest.EnderDest.cMun    := FieldByName( 'CODIGO_IBGE' ).AsInteger ;
                                Dest.EnderDest.xMun    := FieldByName( 'CIDRES_CLI' ).AsString ;
                                Dest.EnderDest.UF      := FieldByName( 'ESTRES_CLI' ).AsString ;
                                Dest.EnderDest.cPais   := 1058;
                                Dest.EnderDest.xPais   := 'BRASIL';
                          end
                        else
                           if ( Trim( NomeCli ) <> '' )
                            and  (  Trim( CPFCli ) <> ''  ) and
                            ( Trim( CPFCli ) <> '000.000.000-00' ) and
                            ( Trim( CPFCli ) <> '' ) then
                              begin
                                 if ValidaCPFCNPJ( Trim( CPFCli ) ) then
                                    begin
                                       Dest.indIEDest         := inNaoContribuinte;
                                       Dest.xNome := NomeCli;
                                       Dest.CNPJCPF := CPFCli;
                                    end;
                              end;
                       Close;
                    end;

            if dm.IBTransaction.Active then
               dm.IBTransaction.CommitRetaining;

                 if dm.IBTransaction.Active then
                   dm.IBTransaction.Commit;
                 dm.IBTransaction.StartTransaction;

                 with dm.QConsulta do
                    begin
                       Close;
                       SQL.Text := 'select I.*, P.*, U.descricao UNIDADE, G.aliquota_grp, NCM.nacional from itens_venda I' +
                                   ' inner join produto P' +
                                   ' on ( p.cod_pro = I.cod_pro )' +
                                   ' inner join unidade_medida U' +
                                   ' on( U.codigo = P.codigo_unidade_saida )' +
                                   ' inner join grupo_icms G' +
                                   ' on( G.cod_grp = P.icms_cf_est )' +
                                   '  LEFT OUTER join TRIBUTACOES_NCMS_SAIDA TS  ' +
                                   '  ON ( TS.ncm = P.cod_ncm and TS.ex = p.ncm_ex and ts.uf=:UF ) ' +
                                   '  left outer join NCM ' +
                                   '  on( NCM.cod_emp = I.cod_emp and NCM.ncm = P.cod_ncm and NCM.ex = P.ncm_ex ) ' +
                                   ' where I.cod_ven =:venda and I.CANCELADO=0 and I.cod_emp=:emp order by i.ordem';
                       ParamByName( 'venda' ).AsString := Emit.EnderEmit.UF;
                       ParamByName( 'venda' ).AsInteger := CodVenda;
                       ParamByName( 'emp' ).AsInteger := iEmp;
                       Open;
                       Last;
                       First;
                       if DescontoVenda > 0 then
                           DescRout := RoundTo( DescontoVenda / RecordCount, -2 )
                        else
                           DescRout := 0;
                       while not Eof do
                            begin
                               with Det.Add do
                                   begin
                                      Prod.nItem := FieldByName( 'ORDEM' ).AsInteger;
                                      prod.cProd := FieldByName( 'COD_PRO' ).AsString;
                                      if Length(FieldByName( 'CODIGO_BARRA_PRO' ).AsString) > 6  then
                                          Prod.cEAN     :=  FieldByName( 'CODIGO_BARRA_PRO' ).AsString;
                                       Prod.xProd    := FieldByName( 'DESC_CUPOM' ).AsString;
                                       Prod.NCM      := PadLeft( IfThen(Trim( FieldByName( 'COD_NCM' ).AsString) = '',
                                       '99999999', FieldByName( 'COD_NCM' ).AsString ), 8, '0' );
                                       Prod.EXTIPI   := '';
                                       Prod.CFOP     := ifthen( ( Emit.EnderEmit.UF <> Dest.EnderDest.UF ) and ( Dest.EnderDest.UF <> '' ), '6102', '5102' ); //FieldByName( 'CFOP_VENDAS_CF_EST' ).AsString;
                                       Prod.uCom     := FieldByName( 'UNIDADE' ).AsString;
                                       Prod.qCom     := FieldByName( 'QUANT' ).AsExtended;
                                       Prod.vUnCom   := FieldByName( 'VALOR' ).AsExtended;
                                       Prod.vDesc   :=  RoundTo( FieldByName( 'DESCONTO' ).AsExtended + DescRout, -2 );
                                       Prod.vProd    :=  RoundTo( ( Prod.qCom *  Prod.vUnCom  ), -2 );
                                       TotDesconto := TotDesconto +   Prod.vDesc ;
                                      if Length(FieldByName( 'CODIGO_BARRA_PRO' ).AsString) > 6  then
                                          Prod.cEANTrib  := FieldByName( 'CODIGO_BARRA_PRO' ).AsString;
                                       Prod.uTrib     := FieldByName( 'UNIDADE' ).AsString;
                                       Prod.qTrib     := FieldByName( 'QUANT' ).AsExtended;
                                       Prod.vUnTrib   := FieldByName( 'VALOR' ).AsExtended;
                                       TotProd := TotProd+ Prod.vProd ;

                                       Prod.vOutro    := 0;
                                       Prod.vFrete    := 0;
                                       Prod.vSeg      := 0;
                                       with Imposto do
                                        begin
                                          // lei da transparencia nos impostos
                                          vTotTrib := ( Prod.vProd *
                                          FieldByName( 'nacional' ).AsExtended) /100;//ALIQ_IBPT_NAC
                                          TotalIBPT := RoundTo( TotalIBPT + vTotTrib , -2 );
                                          if not ( Emit.CRT = crtSimplesNacional ) then
                                          begin
                                                with ICMS do
                                                 begin
                                                   CST          :=   StrToCSTICMS(AuxB, Copy( FieldByName( 'ICMS_CF_EST' ).AsString, 2, 2 ) );//cst00;
                                                   ICMS.orig    := StrToOrig( AuxB, Copy( FieldByName( 'ICMS_CF_EST' ).AsString, 1, 1 ));
                                                   ICMS.modBC   := dbiValorOperacao;
                                                   ICMS.vBC     := Prod.vProd;
                                                   ICMS.pICMS   := FieldByName( 'aliquota_grp' ).AsExtended;
                                                   ICMS.vICMS   := ( ICMS.vBC * ICMS.pICMS ) / 100;
                                                   ICMS.modBCST := dbisMargemValorAgregado;
                                                   ICMS.pMVAST  := 0;
                                                   ICMS.pRedBCST:= 0;
                                                   ICMS.vBCST   := 0;
                                                   ICMS.pICMSST := 0;
                                                   ICMS.vICMSST := 0;
                                                   ICMS.pRedBC  := 0;
                                                   TotICMS :=   TotICMS + ICMS.vICMS;
                                                   TotBCICMS := TotBCICMS +  ICMS.vBC;
                                                 end;
                                          end
                                          else
                                          begin
                                                with ICMS do
                                                 begin
                                                    CSOSN := csosn102;// StrToCSOSNICMS( AuxB, FieldByName('CSOSN').AsString);
                                                    orig :=  oeNacional;// StrToOrig(AuxB, FieldByName('ORIG').AsString );
                                                 end;
                                          end;
                                        end;

                                   end;

                               Next;
                            end;
                       close;
                    end;
            if dm.IBTransaction.Active then
               dm.IBTransaction.CommitRetaining;
              if not ( Emit.CRT = crtSimplesNacional ) then
                 begin
                  Total.ICMSTot.vBC     := TotBCICMS;
                  Total.ICMSTot.vICMS   := TotICMS;
                 end
                 else
                begin
                  Total.ICMSTot.vBC     := 0;
                  Total.ICMSTot.vICMS   := 0;

                end;
              {Total.ICMSTot.vTotTrib := 0;
              for ITot := 0 to Det.Count -1 do
                  begin
                     Total.ICMSTot.vTotTrib := Total.ICMSTot.vTotTrib +
                        Det.Items[ITot].Imposto.vTotTrib;
                  end;  }
              Total.ICMSTot.vTotTrib := RoundTo( TotalIBPT, -2 );
              Total.ICMSTot.vBCST   := 0;
              Total.ICMSTot.vST     := 0;
              Total.ICMSTot.vProd   := TotProd;
              Total.ICMSTot.vFrete  := 0;
              Total.ICMSTot.vSeg    := 0;
              Total.ICMSTot.vDesc   :=  TotDesconto;
              Total.ICMSTot.vII     := 0;
              Total.ICMSTot.vIPI    := 0;
              Total.ICMSTot.vPIS    := 0;
              Total.ICMSTot.vCOFINS := 0;
              Total.ICMSTot.vOutro  := 0;
              Total.ICMSTot.vNF     := TotProd - TotDesconto;

              Total.ISSQNtot.vServ   := 0;
              Total.ISSQNTot.vBC     := 0;
              Total.ISSQNTot.vISS    := 0;
              Total.ISSQNTot.vPIS    := 0;
              Total.ISSQNTot.vCOFINS := 0;

              Transp.modFrete := mfSemFrete; // NFC-e não pode ter FRETE
              if Not EnvioOFF then
              begin
                      FrmVendasCaixa.PagamentosEfetuados.First;
                      TrocoDado := False;
                   FrmVendasCaixa.PagamentosEfetuados.First;
                   while not FrmVendasCaixa.PagamentosEfetuados.Eof do
                      begin
                         if FrmVendasCaixa.PagamentosEfetuadosVALOR.AsCurrency > 0 then
                            begin
                               if ( Pos( 'DINHEIRO', FrmVendasCaixa.PagamentosEfetuadosDESCRICAO.AsString ) > 0 )
                               and ( FrmVendasCaixa.PagamentosEfetuadosVALOR.AsCurrency > FrmFechaVenda.EdtTroco.Value ) then
                                  TemDinheiro := True;
                               Inc( QuantFormas );
                            end;
                         FrmVendasCaixa.PagamentosEfetuados.Next;
                      end;
                   if ( not TemDinheiro ) and (FrmFechaVenda.EdtTroco.Value > 0) then
                      begin
                         Routtroco :=  FrmFechaVenda.EdtTroco.Value/ QuantFormas;
                      end;
                   FrmVendasCaixa.PagamentosEfetuados.First;
                   while not FrmVendasCaixa.PagamentosEfetuados.Eof do
                      begin
                         if FrmVendasCaixa.PagamentosEfetuadosVALOR.AsCurrency > 0 then
                            begin
                               with pag.Add do //PAGAMENTOS apenas para NFC-e
                                   begin
                                       if Pos( 'PRAZO', FrmVendasCaixa.PagamentosEfetuadosDESCRICAO.AsString ) > 0 then
                                          tPag := fpCreditoLoja
                                       else
                                       if Pos( 'CARTAO', FrmVendasCaixa.PagamentosEfetuadosDESCRICAO.AsString ) > 0 then
                                          tPag := fpCartaoCredito
                                       else
                                       if Pos( 'CARTÃO', FrmVendasCaixa.PagamentosEfetuadosDESCRICAO.AsString ) > 0 then
                                          tPag := fpCartaoCredito
                                       else
                                       if Pos( 'DINHEIRO', FrmVendasCaixa.PagamentosEfetuadosDESCRICAO.AsString ) > 0 then
                                          tPag := fpDinheiro
                                       else
                                       if Pos( 'CHEQUE', FrmVendasCaixa.PagamentosEfetuadosDESCRICAO.AsString ) > 0 then
                                          tPag := fpCheque
                                        else
                                           tPag := fpOutro;
                                       if TemDinheiro and ( tPag = fpDinheiro ) and ( not TrocoDado )then
                                          begin
                                            vPag := FrmVendasCaixa.PagamentosEfetuadosVALOR.AsExtended -
                                            FrmFechaVenda.EdtTroco.Value;
                                            TrocoDado := True;
                                          end
                                        else
                                       if not TemDinheiro then
                                          begin
                                            vPag := FrmVendasCaixa.PagamentosEfetuadosVALOR.AsExtended -
                                            Routtroco;
                                          end
                                       else
                                           vPag := FrmVendasCaixa.PagamentosEfetuadosVALOR.AsExtended;
                                   end;
                            end;
                         FrmVendasCaixa.PagamentosEfetuados.Next;
                      end;
              end
                else
                   begin
                      if DM.TRFormasNFCe.Active then
                         DM.TRFormasNFCe.Commit;
                      DM.TRFormasNFCe.StartTransaction;
                      dm.QFormasNFCe.Close;
                      dm.QFormasNFCe.ParamByName( 'cod_venda' ).AsInteger := CodVenda;
                      dm.QFormasNFCe.Open;
                      dm.QFormasNFCe.First;
                      TrocoDado := False;
                   dm.QFormasNFCe.First;
                   while not dm.QFormasNFCe.Eof do
                      begin
                         if dm.QFormasNFCeVALOR.AsCurrency > 0 then
                            begin
                               if ( Pos( 'DINHEIRO', dm.QFormasNFCeDESCRICAO.AsString ) > 0 )
                               and ( dm.QFormasNFCeVALOR.AsCurrency > dm.QFormasNFCeTroco.Value ) then
                                  TemDinheiro := True;
                               Inc( QuantFormas );
                            end;
                         dm.QFormasNFCe.Next;
                      end;
                   if ( not TemDinheiro ) and (dm.QFormasNFCeTroco.Value > 0) then
                      begin
                         Routtroco :=  dm.QFormasNFCeTroco.Value/ QuantFormas;
                      end;
                   dm.QFormasNFCe.First;
                   TrocoSair := dm.QFormasNFCeTROCO.AsExtended;
                   while not dm.QFormasNFCe.Eof do
                      begin
                         if dm.QFormasNFCeVALOR.AsCurrency > 0 then
                            begin
                               with pag.Add do //PAGAMENTOS apenas para NFC-e
                                           begin
                                               if Pos( 'PRAZO', dm.QFormasNFCeDESCRICAO.AsString ) > 0 then
                                                  tPag := fpCreditoLoja
                                               else
                                               if Pos( 'CARTAO', dm.QFormasNFCeDESCRICAO.AsString ) > 0 then
                                                  tPag := fpCartaoCredito
                                               else
                                               if Pos( 'CARTÃO', dm.QFormasNFCeDESCRICAO.AsString ) > 0 then
                                                  tPag := fpCartaoCredito
                                               else
                                               if Pos( 'DINHEIRO', dm.QFormasNFCeDESCRICAO.AsString ) > 0 then
                                                  tPag := fpDinheiro
                                               else
                                               if Pos( 'DINHEIRO', FrmVendasCaixa.PagamentosEfetuadosDESCRICAO.AsString ) > 0 then
                                                  tPag := fpCheque
                                                else
                                                   tPag := fpOutro;
                                               if TemDinheiro and ( tPag = fpDinheiro ) and ( not TrocoDado )then
                                                  begin
                                                    vPag := dm.QFormasNFCeVALOR.AsExtended -
                                                    dm.QFormasNFCeTroco.Value;
                                                    TrocoDado := True;
                                                  end
                                                else
                                               if not TemDinheiro then
                                                  begin
                                                    vPag := dm.QFormasNFCeVALOR.AsExtended -
                                                    Routtroco;
                                                  end
                                               else
                                                   vPag := dm.QFormasNFCeVALOR.AsExtended;
                                           end;

                            end;
                         dm.QFormasNFCe.Next;
                      end;
                      dm.QFormasNFCe.Close;
                      DM.TRFormasNFCe.Commit;
                   end;
              InfAdic.infCpl     :=  '';
              InfAdic.infAdFisco :=  '';

           end;
           //dm.NFCe.NotasFiscais.GerarNFe;
           dm.NFCe.NotasFiscais.Assinar;
           dm.NFCe.NotasFiscais.Validar;
           if not( dm.NFCe.WebServices.Envia( '1', True ) ) then
              begin
               if not EnvioOFF then
                begin
                if  KDialog( 'Nota Rejeitada, Deseja Imprimir em modo Offline?' + #13 +
                 IntToStr(dm.NFCe.WebServices.Retorno.cMsg) + ': ' +
                 dm.NFCe.WebServices.Retorno.xMsg , 'NFCe', 'PERGUNTA' ) then
                     begin
                         dm.NFCe.NotasFiscais.Items[0].NFe.Ide.tpEmis := teOffLine;
                         dm.NFCe.NotasFiscais.GerarNFe;
                         dm.NFCe.NotasFiscais.Assinar;
                         dm.NFCe.NotasFiscais.Validar;
                          if dm.IBTransaction.Active then
                             DM.IBTransaction.Commit;
                          DM.IBTransaction.StartTransaction;

                          with dm.QConsulta do
                             begin
                                Close;
                                     SQL.Text := 'update VENDAS set  CHAVE_NFCE=:CHAVE,' +
                                                  'NFCE_PROTOCOLO=:PROT, OFFLINE=:OFFLINE where cod_ven=:venda and cod_emp=:emp';
                                      ParamByName( 'venda' ).AsInteger := CodVenda;
                                      ParamByName( 'emp' ).AsInteger := iEmp;
                                      ParamByName( 'CHAVE' ).AsString := dm.NFCe.NotasFiscais.Items[0].NFe.procNFe.chNFe;
                                      ParamByName( 'PROT' ).AsString := dm.NFCe.NotasFiscais.Items[0].NFe.procNFe.nProt;
                                      ParamByName( 'OFFLINE' ).AsInteger := 1;
        //                              ParamByName( 'NFCE_SERIE' ).AsInteger := SerieNF;
                                      ExecOrOpen;
                             end;
                          dm.IBTransaction.Commit;
                         if not EnvioOFF then
                             dm.Danfcenaofiscal.vTroco := FrmFechaVenda.EdtTroco.Value
                         else
                            dm.Danfcenaofiscal.vTroco := TrocoSair;
                          dm.ECF.Desativar;
                          dm.ECF.Device.Desativar;
                          while dm.ECF.Device.Ativo do
                              begin
                                Application.ProcessMessages;
                                Sleep(1);
                              end;
                          if GerouNumero then
                             DM.NovoNumeroNFCe( NumNF, SerieNF, True );
                          GerouNumero := False;
                          DM.Danfcenaofiscal.ImprimirDANFE( dm.NFCe.NotasFiscais.Items[0].NFe );
                          AguardaImpressaDANFCE;
                          Result := True;
                     end
                     else
                         Result := False;
                end
                   else
                   begin
                              KDialog( 'Nota Rejeitada:' + #13 +
                         IntToStr(dm.NFCe.WebServices.Retorno.cMsg) + ': ' +
                         dm.NFCe.WebServices.Retorno.xMsg , 'NFCe', 'INFO' );
                       Result := False;
                   end;
                 exit;
              end
           else
             begin
                  if dm.IBTransaction.Active then
                     DM.IBTransaction.Commit;
                  DM.IBTransaction.StartTransaction;

                  with dm.QConsulta do
                     begin
                        Close;
                             SQL.Text := 'update VENDAS set  CHAVE_NFCE=:CHAVE,' +
                                          'OFFLINE=0, NFCE_PROTOCOLO=:PROT where cod_ven=:venda and cod_emp=:emp';
                              ParamByName( 'venda' ).AsInteger := CodVenda;
                              ParamByName( 'emp' ).AsInteger := iEmp;
                              ParamByName( 'CHAVE' ).AsString := dm.NFCe.NotasFiscais.Items[0].NFe.procNFe.chNFe;
                              ParamByName( 'PROT' ).AsString := dm.NFCe.NotasFiscais.Items[0].NFe.procNFe.nProt;
//                              ParamByName( 'NFCE_SERIE' ).AsInteger := SerieNF;
                              ExecOrOpen;
                     end;
                  dm.IBTransaction.Commit;
                  if not EnvioOFF then
                       dm.Danfcenaofiscal.vTroco := FrmFechaVenda.EdtTroco.Value
                         else
                            dm.Danfcenaofiscal.vTroco := TrocoSair;
                  dm.ECF.Desativar;
                  dm.ECF.Device.Desativar;
                  while dm.ECF.Device.Ativo do
                      begin
                        Application.ProcessMessages;
                        Sleep(1);
                      end;
                if GerouNumero then
                   DM.NovoNumeroNFCe( NumNF, SerieNF, True );
                GerouNumero := False;
                DM.Danfcenaofiscal.ImprimirDANFE( dm.NFCe.NotasFiscais.Items[0].NFe );
                AguardaImpressaDANFCE;

                Result := True;
             end;
   except
       on E: Exception do
          begin
              KDialog( 'Erro ao Enviar Nota:' + #13 +
              E.Message, 'NFCe', 'INFO' );
              if not EnvioOFF then
              begin
              if  KDialog( 'Deseja Imprimir em modo Offline?', 'NFCe', 'PERGUNTA' ) then

                     begin
                         dm.NFCe.NotasFiscais.Items[0].NFe.Ide.tpEmis := teOffLine;
                         dm.NFCe.NotasFiscais.GerarNFe;
                         dm.NFCe.NotasFiscais.Assinar;
                         dm.NFCe.NotasFiscais.Validar;
                          if dm.IBTransaction.Active then
                             DM.IBTransaction.Commit;
                          DM.IBTransaction.StartTransaction;

                          with dm.QConsulta do
                             begin
                                Close;
                                     SQL.Text := 'update VENDAS set  CHAVE_NFCE=:CHAVE,' +
                                                  'NFCE_PROTOCOLO=:PROT, OFFLINE=:OFFLINE where cod_ven=:venda and cod_emp=:emp';
                                      ParamByName( 'venda' ).AsInteger := CodVenda;
                                      ParamByName( 'emp' ).AsInteger := iEmp;
                                      ParamByName( 'CHAVE' ).AsString := dm.NFCe.NotasFiscais.Items[0].NFe.procNFe.chNFe;
                                      ParamByName( 'PROT' ).AsString := dm.NFCe.NotasFiscais.Items[0].NFe.procNFe.nProt;
                                      ParamByName( 'OFFLINE' ).AsInteger := 1;
        //                              ParamByName( 'NFCE_SERIE' ).AsInteger := SerieNF;
                                      ExecOrOpen;
                             end;
                          dm.IBTransaction.Commit;
                         if not EnvioOFF then
                             dm.Danfcenaofiscal.vTroco := FrmFechaVenda.EdtTroco.Value
                         else
                            dm.Danfcenaofiscal.vTroco := TrocoSair;
                          dm.ECF.Desativar;
                          dm.ECF.Device.Desativar;
                          while dm.ECF.Device.Ativo do
                              begin
                                Application.ProcessMessages;
                                Sleep(1);
                              end;
                          if GerouNumero then
                             DM.NovoNumeroNFCe( NumNF, SerieNF, True );
                          GerouNumero := False;
                          DM.Danfcenaofiscal.ImprimirDANFE( dm.NFCe.NotasFiscais.Items[0].NFe );
                          AguardaImpressaDANFCE;

                          Result := True;
                     end
                     else
                         Result := False;
              end
              else
                     Result := False;
          end;
   end;
//   dm.NFCe.Enviar()


end;


procedure Cortar_papel();
var
  sAux: String;
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  dm.QConsulta.Close;
  dm.QConsulta.SQL.Text := 'select CORTA_PAPEL from caixa where cod_cai = :COD_CAI and COD_EMP=:COD_EMP';
  dm.QConsulta.ParamByName( 'COD_CAI' ).AsInteger := iCaixa;
  dm.QConsulta.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
  dm.QConsulta.Open;
  sAux := trim( dm.QConsulta.FieldByName('CORTA_PAPEL').AsString );
  if sAux = 'S' then
     dm.ECF.CortaPapel( True );
  dm.QConsulta.Close;
  dm.IBTransaction.Commit;
  //
end;

function RetiraPontoString(sText: AnsiString) : AnsiString;
var n : integer;
begin
for n:= 1 to length(sText) do
  begin
     if (Copy(sText, n, 1) = '.') then
        Delete(sText, n, 1);
     if (Copy(sText, n, 1) = ',') then
        Delete(sText, n, 1);

  end;
  Result:= sText;
end;

function Sangria(const iAuxECF : integer; const cValor : currency) : integer;

begin

   try
     dm.ECF.Sangria( cValor, '', 'SANGRIA', 'DINHEIRO' );
       GravaOutrosDocumentos('CN');
        result := 0;
   except
      on E: Exception do begin
         ShowMessage( E.Message );
         Result := 1;
      end;
   end;
end;

function Suprimento(const iAuxECF : integer; const cValor : currency) : integer;
var
    iAuxCodForma : integer;
    sAuxForma    : AnsiString;
begin
   {busca o codigo da forma de pagamento Dinheiro}
   iAuxCodForma:= dm.BuscaFormaPagamento('DN');

   {busca o indice da forma de pagamento Dinheiro}
   sAuxForma:= dm.BuscaIndiceForma(iAuxCodForma);

   try
       dm.ECF.Suprimento( cValor, '', 'SUPRIMENTO', 'DINHEIRO', 0 );
       GravaOutrosDocumentos('CN');
        result := 0;
   except
      on E: Exception do begin
         ShowMessage( E.Message );
         Result := 1;
      end;
   end;

end;

function AbreECF(const iAuxECF : integer; const cSuprimento : currency) : integer;
var sSuprimento, sAux : AnsiString;
    sNumCOO     : AnsiString;
    sGTInicial  : AnsiString;
begin
   if not dm.ECF.Ativo then
      begin
         result := 1;
         exit;
      end;


           { abertura }
           try
              dm.ECF.LeituraX;
                      result := 0;
           except
              on E: Exception do begin
                 ShowMessage( E.Message );
                 Result := 1;
              end;
           end;
            { suprimento }
            if cSuprimento > 0 then
               begin
                  if Suprimento(iECF, cSuprimento) = 0 then
                     gravaSuprimento(cSuprimento);
               end;


   { gravando o coo e gt inicial }
   sNumCOO    := NumeroCupom(iECF);
   sGTInicial := GT(iECF);
   dm.GravaIni(GetCurrentDir + '\MAPARESUMO.INI', 'MAPARESUMO', 'COOINICIAL', sNumCOO);
   dm.GravaIni(GetCurrentDir + '\MAPARESUMO.INI', 'MAPARESUMO', 'GTINICIAL', sGTInicial);
end;

procedure LeituraX(const iAuxECF : integer);
begin
   if iECF = 99 then
      Exit;
   try

      dm.ECF.PafMF_LX_Impressao;
   except
      on E: Exception do begin
         ShowMessage( E.Message );
      end;
   end;
end;

procedure LeituraZ(const iAuxECF : integer; sHora : AnsiString);
begin
   if iECF = 99 then
      Exit;
   try
      dm.ECF.ReducaoZ( now );
   except
      on E: Exception do begin
         ShowMessage( E.Message );
      end;
   end;
end;

function CancelaCupomFiscal(const iAuxECF : integer) : integer;
begin
  try
     dm.ECF.CancelaCupom;
     Cortar_papel;
               result := 0;
   except
      on E: Exception do begin
         ShowMessage( E.Message );
         Result := 1;
      end;
   end;
end;

function RegistraItemECF(const iAuxECF, iTamanhoCod, iTamDesc : integer;
                         const sCodigoBarra, sDescricao, sIndiceICMS, sUnidade : AnsiString; const cQuant, cUnitario, cDesconto : currency) : integer;
var sAuxQuant        : AnsiString;
    sAuxValor        : AnsiString;
    sAuxTipoDesc     : AnsiString;
    sAuxVlDesconto   : AnsiString;
    sAuxVlAcrescimo  : AnsiString;
    sAuxTipoQuant    : AnsiString;
    sAuxCodigo       : AnsiString;
    sAuxDescricao    : AnsiString;
    sAuxUnidade      : AnsiString;
    sAuxDepartamento : AnsiString;
    AuxcDesconto: Double;
    iAuxCasasDecimais: integer;
    iAux             : integer;
    Aliquota  : TACBrECFAliquota;
begin
   sAuxDescricao    := copy(sDescricao, 1, iTamDesc);
   sAuxUnidade      := copy(sUnidade, 1, 2);
   sAuxQuant        := FormatFloat('#0.000', cQuant);
   sAuxValor        := FormatFloat('#0.000', cUnitario);
   sAuxVlDesconto   := FormatFloat('#0.00', cDesconto);
   sAuxVlAcrescimo  := FormatFloat('#0.00', 0);
   sAuxTipoDesc     := '$';
   sAuxTipoQuant    := 'F';
   iAuxCasasDecimais:= 2;
   sAuxDepartamento := '01';
   sAuxCodigo := FormataStringD(sCodigoBarra, '13', '0');
   if cDesconto < 0 then
      AuxcDesconto := cDesconto * -1
   else
       AuxcDesconto := cDesconto;

   // result 0 - OK
   // result 1 - Erro na execucao do comando
   try
      dm.ECF.VendeItem( sAuxCodigo, sDescricao, {'T' +}
      sIndiceICMS, cQuant, cUnitario, AuxcDesconto,
      sUnidade, sAuxTipoDesc, ifthen( cDesconto >= 0, 'D', 'A' ) );
   except
      on E: Exception do begin
         ShowMessage( E.Message );
         result := 1;
      end;
   end;

   GravaGT(iECF);
end;

function CancelaItemCupomFiscal(const IAuxECF : integer; iOrdem : integer) : integer;
begin

   try
       dm.ECF.CancelaItemVendido( iOrdem );
                 result := 0;
   except
      on E: Exception do begin
         ShowMessage( E.Message );
         result := 1;
      end;
   end;
end;

function AbreCupom(const IAuxECF : integer;  sEnd : String = ''; sCLI : String = ''; sDoc: String = '') : integer;
begin
   dm.ECF.Consumidor.Zera;
   try
       if sDocCliente = '000.000.000-00' then
          begin
              dm.ECF.AbreCupom( '', '', '', false );
              ImpressoraCanCupom := False;
          end
       else
          if sCLI <> '' then
             begin
                dm.ECF.AbreCupom(sDoc, sCLI, sEnd, false );
                ImpressoraCanCupom := True;
             end
          else
             begin
                ImpressoraCanCupom := True;
                dm.ECF.AbreCupom(sDocCliente, sNomeCliente, sEndCliente, false );
             end;

                 result := 0;
   except
      on E: Exception do begin
         ShowMessage( E.Message );
         result := 1;
      end;
   end;
end;

function AbreRelatoroGerencial(const iAuxECF : integer; const sIndice : AnsiString) : integer;
begin
   if iECF = 99 then
      Exit;
    try

       dm.ECF.AbreRelatorioGerencial( StrToInt( sIndice ) );
                result := 0;
   except
      on E: Exception do begin
         ShowMessage( E.Message );
         result := 1;
      end;
   end;
end;

function ImprimeRelatorioGerencial(const iAuxECF : integer; const sTexto : AnsiString) : integer;
begin
   try
       dm.ECF.LinhaRelatorioGerencial( sTexto, 0 );
                 result := 0;
   except
      on E: Exception do begin
         ShowMessage( E.Message );
         result := 1;
      end;
   end;
end;

function FechaRelatorioGerencial(const IAuxECF : integer) : integer;
begin
  try
       DM.ECF.FechaRelatorio;
       Cortar_Papel;
                result := 0;
   except
      on E: Exception do begin
         ShowMessage( E.Message );
         result := 1;
      end;
   end;

end;

function AbreCupomNaoFiscalVinculado(const iAuxECF : integer; const cValor : currency; const sNumCupom : AnsiString; const sFormaPagamento : AnsiString) : integer;
var
    sAuxCupom   : AnsiString;
begin

   sAuxCupom:= trim(sNumCupom);
   try
     dm.ECF.AbreCupomVinculado( sAuxCupom, sFormaPagamento,cValor );
               result := 0;
   except
      on E: Exception do begin
         ShowMessage( E.Message );
         result := 1;
      end;
   end;
end;

function ImprimeCupomNaoFiscalVinculado(const iAuxECF : integer; const sTexto : AnsiString) : integer;
var sAuxTexto : AnsiString;
begin
   sAuxTexto:= sTexto;
   try
      dm.ECF.LinhaCupomVinculado( sAuxTexto );
               result := 0;
   except
      on E: Exception do begin
         ShowMessage( E.Message );
         result := 1;
      end;
   end;
end;

function FechaCupomNaoFiscalVinculado(const iAuxECF : integer) : integer;
begin
  try
       DM.ECF.FechaRelatorio;
              Cortar_Papel;
               result := 0;
   except
      on E: Exception do begin
         ShowMessage( E.Message );
         result := 1;
      end;
   end;
end;

function IniciaFechamentoCupomFiscal(const iAuxECF : integer; cDesconto : currency) : integer;
var sTipo, sTipoDesconto, sAuxDesconto : AnsiString;
begin
   //result  0 - tudo ok
   //result  1 - problema na execucao do comando

   try
//        if not ( dm.ECF.Estado = estPagamento ) then
  //         dm.ECF.SubtotalizaCupom( cDesconto * -1 );
            cTotalDescontos := 0;
            cTotalDescontos := ( cDescontoVenda * -1 );

               result := 0;
      except
      on E: Exception do begin
         ShowMessage( E.Message );
         result := 1;
      end;
   end;

end;

function SubTotalizaCupom(const iAuxECF : integer; cDesconto : currency) : integer;
var sTipo, sTipoDesconto, sAuxDesconto : AnsiString;
begin
   //result  0 - tudo ok
   //result  1 - problema na execucao do comando

   try
        if not ( dm.ECF.Estado = estPagamento ) then
           dm.ECF.SubtotalizaCupom( cDesconto );
               result := 0;
      except
      on E: Exception do begin
         ShowMessage( E.Message );
         result := 1;
      end;
   end;

end;

function TotaldePagamentosEfetuados: Currency;
var
   Calc: Currency;
begin
  Calc := 0;
  FrmVendasCaixa.PagamentosEfetuados.First;
  while not FrmVendasCaixa.PagamentosEfetuados.Eof do
     begin
       if Trim(FrmVendasCaixa.PagamentosEfetuadosSAIUECF.AsString ) = 'N' then
          begin
             Calc := Calc +
               FrmVendasCaixa.PagamentosEfetuadosVALOR.AsCurrency;
          end;
       FrmVendasCaixa.PagamentosEfetuados.Next;
     end;
  Calc := Calc + DM.ECF.TotalPago;
  Result :=  Calc;
end;


function PagamentoCupomFiscal(const iAuxECF, iCOO, iCCF : integer;
         const cValor: currency; const sIndice, sDescricaoECF, SaiuEcf : AnsiString; CODForma: integer) : integer;
var
   temppp: Currency;
begin
   //
   temppp := 0;
   try
       if FrmVendasCaixa.PagamentosEfetuados.Locate( 'INDICE', sIndice, [] ) then
          begin
             temppp := FrmVendasCaixa.PagamentosEfetuadosVALOR.AsCurrency;
             FrmVendasCaixa.PagamentosEfetuados.Edit;
             temppp := temppp +  cValor;
             FrmVendasCaixa.PagamentosEfetuadosVALOR.AsCurrency := temppp;
             FrmVendasCaixa.PagamentosEfetuados.Post;
    //         cTotalPago := cTotalPago + cValor;
          end
       else
          begin
             FrmVendasCaixa.PagamentosEfetuados.Insert;
             FrmVendasCaixa.PagamentosEfetuadosCOO.AsInteger := iCOO;
             FrmVendasCaixa.PagamentosEfetuadosCCF.AsInteger := iCCF;
             FrmVendasCaixa.PagamentosEfetuadosVALOR.AsCurrency := cValor;
             FrmVendasCaixa.PagamentosEfetuadosINDICE.AsString := sIndice;
             FrmVendasCaixa.PagamentosEfetuadosDESCRICAO.AsString := sDescricaoECF;
             FrmVendasCaixa.PagamentosEfetuadosSAIUECF.asstring := SaiuECF;
             FrmVendasCaixa.PagamentosEfetuadosCODFORMA.AsInteger := CODforma;
             FrmVendasCaixa.PagamentosEfetuados.Post;
    //         cTotalPago := cTotalPago + cValor;
          end;
   finally
       cTotalPago := TotaldePagamentosEfetuados;
   end;
   result:= 0;
end;

// NOVO TABELA
function PagamentoCupomFiscal2(const iAuxECF, iCOO, iCCF : integer;
         const cValor: currency; const sIndice, sDescricaoECF : AnsiString) : integer;
var sAuxValor       : AnsiString;
    sDataHoraECF    : AnsiString;
    sDataCupom      : AnsiString;
    sTPdocumento    : AnsiString;
    AuxDesc         : AnsiString;
    DataECF         : TDateTime;
    iAcbr           : integer;
    FormaPagto      : TACBrECFFormaPagamento;
begin
   //result  0 - tudo ok
   //result  1 - problema na execucao do comando

   sTPDocumento:= 'CUPOM FISCAL';

   { BUSCA DATA E HORA DA ECF }
   sDataHoraECF:= DataHoraECF(iECF);
   sDataCupom  := FormataDataECF(sDataHoraECF);
   AuxDesc := sDescricaoECF;
   if sDescricaoECF = '' then
      begin
         FormaPagto  :=  dm.ECF.AchaFPGIndice(sIndice);
         AuxDesc     :=  FormaPagto.Descricao;
      end;


   try
     DataECF:= strtodate(sDataCupom);
   except
     DataECF:= date;
   end;

           sAuxValor    := FormatFloat('#0.00', cValor);
           try
              dm.ECF.EfetuaPagamento( sIndice, cValor );
              Sleep(200);
              iAcbr := 0;
           except
              iAcbr := 1;
           end;
           if iAcbr = 0 then
              begin
                 result:= 0;
                 uecf.GravaMeiosPagamento(AuxDesc, sTPdocumento, cValor, iCOO, iCCF, 0, DataECF);
              end
           else
              begin
                 result:= 1;

              end;

end;


function FechaCupomFiscal( iAuxECF : integer; sNomeCli, sDocCli, sEndCli : AnsiString; iSeqPreVenda, iSeqDAV, iSeqDAVOS, iECFContaCliente, iCOOContaCliente, iCERMesa, iNumeMesa : integer ) : integer;
var sLinha1, sLinha2, sLinha3 : AnsiString;
    sMensagem, sNomeUsuario   : AnsiString;
    sPreVendaDav              : AnsiString;
    i : integer;
begin
   //result  0 - tudo ok
   //result  1 - problema na execucao do comando
   GravaDadosCliente( iCodigoVenda, sNomeCli, sDocCli );
   if not  GeraNFCe( iCodigoVenda ) then
      begin
         Result :=1;
         FrmFechaVenda.FormasPagamento;
         Exit;
      end;
   { Pre Venda }
      DM.ECF.InfoRodapeCupom.MD5 := sMD5 + #10;
   if iSeqPreVenda > 0 then
      dm.ECF.InfoRodapeCupom.PreVenda := FormataStringE(FormataStringD(inttostr(iSeqPreVenda), '10', '0'), '48', ' ') + #10
   else
      dm.ECF.InfoRodapeCupom.PreVenda := '';
   if iSeqDAV > 0 then
      dm.ECF.InfoRodapeCupom.Dav := FormataStringE(FormataStringD(inttostr(iSeqDAV), '10', '0'), '48', ' ') + #10
   else
      dm.ECF.InfoRodapeCupom.Dav := '';
   if iSeqDAVOS > 0 then
      dm.ECF.InfoRodapeCupom.DavOs := FormataStringE(FormataStringD(inttostr(iSeqDAVOS), '10', '0'), '48', ' ' )
   else
      dm.ECF.InfoRodapeCupom.DavOs  := '';
   if FrmVendasCaixa <> nil then
   if FrmVendasCaixa.NumeroNF > 0 then
      begin
          dm.ECF.InfoRodapeCupom.NF := IntToStr( FrmVendasCaixa.NumeroNF );
      end
   else
      begin
         dm.ECF.InfoRodapeCupom.NF := '';
      end;
//   if iCOOContaCliente > 0 then
   if iNumeMesa > 0 then
      begin
               if dm.IBTRServer.Active then
                  DM.IBTRServer.Commit;
               dm.IBTRServer.StartTransaction;

               with dm.QConsultaServer do
                  begin
                     Close;
                     SQL.Text := 'select * from MESAS_ADICIONAIS where COD=:COD';
                     ParamByName( 'COD' ).AsInteger := iNumeMesa;
                     Open;
                     dm.ECF.InfoRodapeCupom.Restaurante.Imprimir := True;
                     dm.ECF.InfoRodapeCupom.Restaurante.ECF := 0;
                     dm.ECF.InfoRodapeCupom.Restaurante.CER := 0;
                     dm.ECF.InfoRodapeCupom.Restaurante.COO := 0;
                     dm.ECF.InfoRodapeCupom.Restaurante.Mesa := FieldByName( 'DESCRICAO' ).AsString;
                     Close;
                  end;

               DM.IBTRServer.Commit;
      end
     else
     if iCOOContaCliente > 0 then
        begin
                 dm.ECF.InfoRodapeCupom.Restaurante.Imprimir := True;
                 dm.ECF.InfoRodapeCupom.Restaurante.ECF := iECFContaCliente;
                 dm.ECF.InfoRodapeCupom.Restaurante.CER := iCERMesa;
                 dm.ECF.InfoRodapeCupom.Restaurante.COO := iCOOContaCliente;
        end
      else
         begin
            dm.ECF.InfoRodapeCupom.Restaurante.Imprimir := False;
         end;



   { Verifica se Vai Imprimir o Nome do Usuário }
   if trim(dm.RetornaStringTabela('imprimir_nome_operador', 'parametros', 'cod_emp', iEmp)) = 'S' then
      begin
         sNomeUsuario:= 'Op.: ' + trim(dm.RetornaStringTabela('nome_usu', 'usuario', 'cod_usu', ICodUsu));
         sNomeUsuario := FormataStringE( sNomeUsuario + '  Vend.: ' + trim(dm.RetornaStringTabela('nome_vend', 'vendedor', 'cod_vend', ICodVend)), '48', ' ');
      end
   else
      sNomeUsuario:= '';

   { Busca as Linhas para Mensagem Promocional }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.clear;
             sql.add('SELECT LINHA1, LINHA2, LINHA3 ' +
                     'FROM CAIXA ' +
                     'WHERE COD_CAI = :CODCAI AND COD_EMP = :CODEMP');
             Parambyname('codcai').AsInteger := iCaixa;
             Parambyname('codemp').AsInteger := iEmp;
             open;
             sLinha1:= trim(fieldbyname('linha1').AsString);
             sLinha2:= trim(fieldbyname('linha2').AsString);
             sLinha3:= trim(fieldbyname('linha3').AsString);
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao Buscar a Mensagem Promocional');
     end;
   finally
     dm.QConsulta.Close;
   end;

  { Busca Impostos aproximados }
{   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       dm.Qimpostos.Close;
       dm.Qimpostos.ParamByName( 'COD_VEN' ).AsInteger := iCodigoVenda;
       dm.Qimpostos.Open;
       dm.ECF.InfoRodapeCupom.Imposto.ValorAproximado := dm.QimpostosTOTAL_IMPOSTO.AsFloat;
       dm.ECF.InfoRodapeCupom.Imposto.Fonte := 'IBPT';
       dm.Qimpostos.Close;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao Buscar Impostos');
     end;
   finally
     dm.Qimpostos.Close;
   end;}

//           dm.ECF.InfoRodapeCupom.MinasLegal := TemMinasLegal;
  //         dm.ECF.InfoRodapeCupom.CupomMania := TemCupomMania;

           if ( sDocCli <> '' ) and ( sNomeCli <> '' ) and ( not ImpressoraCanCupom ) then
              dm.ECF.Consumidor.AtribuiConsumidor(sDocCli, sNomeCli, sEndCli);

           dm.ECF.InfoRodapeCupom.MinasLegal := dm.ECF.AAC.IdentPAF.Paf.MinasLegal;
           dm.ECF.InfoRodapeCupom.CupomMania := dm.ECF.AAC.IdentPAF.Paf.CupomMania;
           dm.ECF.InfoRodapeCupom.ParaibaLegal := dm.ECF.AAC.IdentPAF.Paf.ParaibaLegal;


           ImpressoraCanCupom := False;
           sMensagem := sMensagem +  sNomeUsuario;

           sMensagem := sMensagem + FormataStringE( sLinha1, '48', ' ' );
           sMensagem := sMensagem + FormataStringE( sLinha2, '48', ' ' );
           sMensagem := sMensagem + FormataStringE( sLinha3, '48', ' ' );

            try
              dm.ECF.FechaCupom( sMensagem );
              Dm.ECF.NaoFiscalImprime := True;
                     Cortar_Papel;
                    result := 0;
                dm.ECF.NaoFiscalImprime := True;
      except
      on E: Exception do begin
         ShowMessage( E.Message );
         result := 1;
      end;
   end;

end;

procedure LeituraMFPeriodo(const iAuxECF : integer; DataIni, DataFin : TDateTime; const bCompleta : boolean);
var sDataIni, sDataFin, sTipo : AnsiString;
    sAux: Boolean;
begin
   if iECF = 99 then
      Exit;
   sDataIni:= datetostr(DataIni);
   sDataFin:= datetostr(DataFin);
   if bCompleta then
      begin
      sTipo:= 'c';
      sAux := false;
      end
   else
      begin
      sTipo:= 's';
      sAux := true;
      end;

   if sAux then
      dm.ECF.PafMF_LMFS_Impressao( DataIni, DataFin )
   else
      dm.ECF.PafMF_LMFC_Impressao( DataIni, DataFin );
//   dm.ECF.LeituraMemoriaFiscal( Dataini, Datafin, sAux );
end;

procedure LeituraMFReducao(const iAuxECF : integer; const RedIni, RedFin : integer; const bCompleta : boolean);
var sRedIni, sRedFin, sTipo : AnsiString;
    sAux: Boolean;
begin
   if iECF = 99 then
      Exit;
   sRedIni:= inttostr(RedIni);
   sRedFin:= inttostr(RedFin);
   if bCompleta then
      begin
      sTipo:= 'c';
      sAux := False;
      end
   else
      begin
      sTipo:= 's';
      sAux := true;
      end;
   if sAux then
      dm.ECF.PafMF_LMFS_Impressao( RedIni, RedFin )
   else
      dm.ECF.PafMF_LMFC_Impressao( RedIni, RedFin );

//   dm.ECF.LeituraMemoriaFiscal( RedIni, RedFin, sAux );
end;

Function  NumeroSerieECF(const iAuxECF : integer) : AnsiString;
var sNumSerie : AnsiString;
begin
   if iECF = 99 then
      Exit;
   sNumSerie := dm.ECF.NumSerie;
   result:= sNumSerie;
end;

function ECFLigada(const iAuxECF : integer) : boolean;
var i : integer;
begin
   if dm.ECF.Ativo then
      result := true;
end;

procedure AbreGaveta (const iAuxECF, iGaveta : integer);
begin
   if iECF = 99 then
      Exit;
   dm.ECF.AbreGaveta;
end;

procedure ProgramarHorarioVerao(const iAuxECF : integer);
begin
   dm.ECF.MudaHorarioVerao;
end;

procedure ImprimiConfigImpressora(const iAuxECF : integer);
begin

{   case iAuxECF of
    1: begin
          verifica_Bematech_Ligada;
          Bematech_FI_ImprimeConfiguracoesImpressora;
          Analisa_Retorno_bematech(bMFD);
       end;
    2: begin
          iRetDaruma:= Daruma_FI_ImprimeConfiguracoesImpressora();
          case iRetDaruma of
             1: Analisa_Retorno_Daruma;
             0: showmessage('Erro de comunicação');
          end;
       end;
   end;}
end;

procedure ProgramaAliquota(const iAuxECF, iICMSISS : integer; const cAliq : currency);
var sAuxAliq : AnsiString;
begin
   sAuxAliq:= dm.RetiraPonto(FormatFloat('#0.00', cAliq));
   sAuxAliq:= FormataStringD(sAuxAliq, '4', '0');
   if application.MessageBox( 'Confirma a programação da alíquota ' , 'Programação de Alíquota', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton1) = 6 then
      begin
         if iICMSISS = 0 then
           dm.ECF.ProgramaAliquota( cAliq, 'T' )
        else
           dm.ECF.ProgramaAliquota( cAliq, 'S' )
      end;
end;

function LeAliquotas(const iAuxECF : integer) : AnsiString;
var sAux : AnsiString;
    i    : integer;
    ssAux: String;
begin
   dm.ECF.CarregaAliquotas;
   sAux := '';
   for I := 0 to dm.ECF.Aliquotas.Count -1 do
      begin
         ssAux :=  dm.ECF.Aliquotas[I].Indice;
         sAux := sAux + ssAux +
         dm.ECF.Aliquotas[I].Tipo +
         RetiraPontoString( FormatFloat( '00.00', dm.ECF.Aliquotas[I].Aliquota )) + #13#10 ;

      end;
   result := sAux;
end;

procedure ProgramaRelatorioGerencial(const iAuxECF : integer; const sIndice, sDescricao : AnsiString);
Var
  I, S: String;
begin
   I := sIndice;
   S := sDescricao;
   try
     dm.ECF.ProgramaRelatoriosGerenciais( S, I);
     ShowMessage( 'Relatório Gerencial programado' );
   except
      on E: Exception do begin
         ShowMessage( E.Message );

      end;
   end;

end;

function  StatusECF(const iAuxECF, iAuxTipo : integer) : AnsiString;
var sAux : AnsiString;
begin
   // Tipo (0) - Horario de Verao
  if iECF = 99 then
      Exit;
   try
   if dm.ECF.HorarioVerao then
      result:= 'Impressora programada para horário de verão'
   else
      result:= 'Impressora não programada para horário de verão';
      except
      on E: Exception do begin
         ShowMessage( E.Message );
         result := '';
      end;
   end;
end;

procedure MapaResumo (const iAuxECF : integer; const dDataMovimento : TDateTime);
var bAux         : boolean;
    sStringList  : TStrings;
    sDados       : AnsiString;
    sTributados  : AnsiString;
    sNaoFiscal   : AnsiString;
    sData        : AnsiString;
    sHora        : AnsiString;
    iCodMapa     : integer;
    i            : integer;
    sAux, sAux2, sIndice, MontaIndice: String;

    iCOOInicial : integer;
    iCOOFinal   : integer;
    cGTInicial  : currency;
    cGTFinal    : currency;
    Venda_bruta : Currency;
    iCRZ, iCRO  : integer;
    iContCancel : integer;
    DataReducao : TDateTime;
    HoraReducao : TDateTime;
    DataEmissao : TDateTime;
    HoraEmissao : TDateTime;
    cAuxValor   : currency;
    ArquivoTemp: TStringList;


    procedure SeparaString;
    var sAux        : AnsiString;
        iPosicao    : integer;
    begin
       sStringList:= TStringList.Create;
       while Length(sDados) > 0 do
          begin
             iPosicao:= pos(',', sDados);
             if iPosicao > 0 then
                begin
                   sAux:= copy(sDados, 1, iPosicao -1);
                   sDados:= copy(sDados, iPosicao + 1, length(sDados));
                end
             else
                begin
                   sAux:= sDados;
                   sDados:= '';
                end;
             sStringList.Add(sAux)
          end;
    end;

    procedure GravaMapaResumo;
    begin
       if dm.IBTransaction.Active then
          dm.IBTransaction.Commit;
       dm.IBTransaction.StartTransaction;
       try
         try
           with dm.QGravaMapa do
              begin
                 close;
                 Parambyname('CHECKOUT').AsInteger     := iCaixa;
                 Parambyname('DATA').AsDate            := dDataMovimento;
                 Parambyname('COO_INICIAL').AsInteger  := iCOOInicial;
                 Parambyname('COO_FINAL').AsInteger    := iCOOFinal;
                 Parambyname('GT_INICIAL').AsCurrency  := cGTInicial;
                 Parambyname('GT_FINAL').AsCurrency    := cGTFinal;
                 Parambyname('CRZ').AsInteger          := iCRZ;
                 Parambyname('CONT_CANCEL').AsInteger  := iContCancel;
                 Parambyname('CRO').AsInteger          := iCRO;
                 Parambyname('COD_EMP').AsInteger      := iEmp;
                 Parambyname('DATA_EMISSAO').AsDate    := DataEmissao;
                 Parambyname('HORA_EMISSAO').AsTime    := HoraEmissao;
                 ParamByName('VENDA_BRUTA').AsCurrency := Venda_bruta;
                 open;
                 iCodMapa:= dm.QGravaMapaCODMAPA.AsInteger;
              end;
           dm.IBTransaction.Commit;
         except
           dm.IBTransaction.Rollback;
           showmessage('Erro ao gravar o mapa resumo');
         end;
       finally
         dm.QGravaMapa.Close;
       end;
    end;

    procedure GravaItensMapa(const sIndice : AnsiString; const Valor : currency);
    var iAuxCodGRP : integer;
        sIndiceR03 : AnsiString;
    begin
       iAuxCodGRP:= 0;
       sIndiceR03:= '';

       { buscando o grupo de icms }
       if dm.IBTransaction.Active then
          dm.IBTransaction.Commit;
       dm.IBTransaction.StartTransaction;
       try
         try
           with dm.QConsulta do
              begin
                 close;
                 sql.Clear;
                 sql.Text:= 'SELECT COD_GRP, INDICE_R03  ' +
                            'FROM INDICE_ECF ' +
                            'WHERE COD_CAI = :CODCAI AND COD_EMP = :CODEMP AND INDICE_ECF = :INDICE';
                 Parambyname('codcai').AsInteger  := iCaixa;
                 Parambyname('codemp').AsInteger  := iEmp;
                 Parambyname('indice').AsString   := trim(sIndice);
                 open;
                 iAuxCodGRP := fieldbyname('cod_grp').AsInteger;
                 sIndiceR03 := fieldbyname('indice_r03').AsString;
              end;
           dm.IBTransaction.Commit;
         except
           dm.IBTransaction.Rollback;
           iAuxCodGRP:= 0;
           showmessage('Erro ao buscar o código do grupo de ICMS/ISS');
         end;
       finally
         dm.QConsulta.Close;
       end;

       if iAuxCodGRP > 0 then
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
                       sql.Text:= 'INSERT INTO ITENS_MAPA_RESUMO (CODIGO, COD_GRP, VALOR, COD_EMP, INDICE_R03, STATUS_EXPORTA) ' +
                                  'VALUES (:COD, :CODGRP, :VALOR, :CODEMP, :R03, 0)';

                       Parambyname('COD').AsInteger       := iCodMapa;
                       Parambyname('CODGRP').AsInteger    := iAuxCodGRP;
                       Parambyname('valor').AsCurrency    := Valor;
                       Parambyname('codemp').AsInteger    := iEmp;
                       Parambyname('R03').AsString        := trim(sIndiceR03);
                       ExecOrOpen;
                    end;
                 dm.IBTransaction.Commit;
               except
                 dm.IBTransaction.Rollback;
                 showmessage('Erro ao gravar o item do mapa resumo');
               end;
             finally
               dm.QConsulta.Close;
             end;
          end;
    end;

begin
   { busca o COO inicial e o GT inicial }
   try
     iCOOInicial := StrToInt( dm.LeIni( GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'COOInicial' ) ) ;;
   except
     iCOOInicial := 0;
   end;

     cGTInicial  := 0;

   try
     Venda_bruta := StrToFloat( dm.LeIni( GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'VendaBruta' ) ) ;;
   except
     Venda_bruta := 0;
   end;


{   ArquivoTemp := TStringList.Create;
   ArquivoTemp.Clear;
   ArquivoTemp.Text := dm.ECF.DadosUltimaReducaoZ;
   ArquivoTemp.SaveToFile( GetCurrentDir + '\TEMP_RESUMO.INI');
   ArquivoTemp.Free;}
           DataEmissao := StrToDate( FormataDataECF( DataHoraECF( iECF ) ) );
           HoraEmissao :=  StrToTime( FormataHoraECF( DataHoraECF( iECF ) ) );


                 iCRO         := StrToInt( dm.ECF.NumCRO );
                 iCRZ         := StrToInt( dm.ECF.NumCRZ );
                 iCOOFinal    := StrToInt( dm.ECF.NumCOO );
                 iContCancel  := 0;
                 cGTFinal     := dm.ECF.GrandeTotal;
                 GravaMapaResumo;

                 {gravando os itens do mapa resumo}

                 {Sub.tributaria ICMS}
                 cAuxValor:= 0;
                 cAuxValor:= StrToFloat( dm.LeIni( GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'TotalSubstituicaoTributaria' ) ) ;
                 gravaItensMapa('FF', cAuxValor);

                 {Sub.tributaria ISS}
                 cAuxValor:= 0;
                 cAuxValor:= StrToFloat( dm.LeIni( GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'TotalSubstituicaoTributariaISSQN' ) );
                 gravaItensMapa('SF', cAuxValor);

                 {Isento ICMS}
                 cAuxValor:= 0;
                 cAuxValor:= StrToFloat( dm.LeIni( GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'TotalIsencao' ) );
                 gravaItensMapa('II', cAuxValor);

                 {Isento ISS}
                 cAuxValor:= 0;
                 cAuxValor:= StrToFloat( dm.LeIni( GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'TotalIsencaoISSQN' ) );
                 gravaItensMapa('SI', cAuxValor);

                 {Nao Incidencia ICMS}
                 cauxValor:= 0;
                 cAuxValor:= 0;
                 gravaItensMapa('NN', cAuxValor);

                 {Nao Incidencia ISS}
                 cAuxValor:= 0;
                 cAuxValor:= 0;
                 gravaItensMapa('SN', cAuxValor);

                 {Desconto ICMS}
                 cauxValor:= 0;
                 cAuxValor:= StrToFloat( dm.LeIni( GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'TotalDescontos' ) );
                 gravaItensMapa('DT', cAuxValor);

                 {Desconto ISS}
                 cAuxValor:= 0;
                 cAuxValor:= StrToFloat( dm.LeIni( GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'TotalDescontosISSQN' ) );
                 gravaItensMapa('DS', cAuxValor);

                 {Acrescimo ICMS}
                 cauxValor:= 0;
                 cAuxValor:= StrToFloat( dm.LeIni( GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'TotalAcrescimos' ) );
                 gravaItensMapa('AT', cAuxValor);

                 {Acrescimo ISS}
                 cAuxValor:= 0;
                 cAuxValor:= StrToFloat( dm.LeIni( GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'TotalAcrescimosISSQN' ) );
                 gravaItensMapa('AS', cAuxValor);

                 {Cancelamento ICMS}
                 cauxValor:= 0;
                 cAuxValor:= StrToFloat( dm.LeIni( GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'TotalCancelamentos' ) );
                 gravaItensMapa('Can-T', cAuxValor);

                 {Cancelamento ISS}
                 cAuxValor:= 0;
                 cAuxValor:= StrToFloat( dm.LeIni( GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'TotalCancelamentosISSQN' ) );
                 gravaItensMapa('Can-S', cAuxValor);

                 {Não Fiscal}
                 cAuxValor:= 0;
                 cAuxValor:= StrToFloat( dm.LeIni( GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'TotalNaoFiscal' ) );
                 GravaItensMapa('OPNF', cAuxValor);


                 {aliquotas Tributaveis}
                for I := 0 to dm.ECF.Aliquotas.Count -1 do
                   begin
                      sAux2 := '';
                      cAuxValor := dm.ECF.Aliquotas[I].Aliquota;
                      sAux2 := FormatFloat( '00', I );
                      sAux2 := sAux2 + dm.ECF.Aliquotas[I].Tipo;
                      sAux2 := sAux2 + RetiraPontoString( FormatFloat( '00.00', cAuxValor ) );
                      sAux := dm.LeIni( GetCurrentDir + '\TOTS.INI', 'Aliquotas', sAux2 );
                      cAuxValor := StrToFloat( sAux );
{                      if IsNumeric( dm.ECF.Aliquotas[I].Indice ) then
                         if Trim( dm.ECF.Aliquotas[I].Tipo ) = 'S' then
                            begin
                              MontaIndice := FloatToStr( dm.ECF.Aliquotas[I].Aliquota ) + Trim( dm.ECF.Aliquotas[I].Tipo );
                            end
                          else
                             MontaIndice := dm.ECF.Aliquotas[I].Tipo + FormataStringD( dm.ECF.Aliquotas[I].Indice, '2', '0' )
                      else
                         if Trim( dm.ECF.Aliquotas[I].Tipo ) = 'S' then
                            begin
                              MontaIndice := FloatToStr( dm.ECF.Aliquotas[I].Aliquota ) + Trim( dm.ECF.Aliquotas[I].Tipo );
                            end
                          else
                            MontaIndice := dm.ECF.Aliquotas[I].Tipo + dm.ECF.Aliquotas[I].Indice;}
                       MontaIndice :=  FloatToStr( dm.ECF.Aliquotas[I].Aliquota ) + dm.ECF.Aliquotas[I].Tipo;
                      GravaItensMapa( MontaIndice, cAuxValor );
                   end;
                 { totalizador nao fiscal }




           FreeAndNil(sStringList);


end;


procedure MapaResumoAutomatico (const iAuxECF : integer;  IniTemp: TMemIniFile );
var bAux         : boolean;
    sStringList  : TStrings;
    sDados       : AnsiString;
    sTributados  : AnsiString;
    sNaoFiscal   : AnsiString;
    sData        : AnsiString;
    sHora        : AnsiString;
    iCodMapa     : integer;
    i            : integer;
    sAux, sAux2, sIndice, MontaIndice: String;
    dDataMovimento : TDateTime;

    iCOOInicial : integer;
    iCOOFinal   : integer;
    cGTInicial  : currency;
    cGTFinal    : currency;
    Venda_bruta : Currency;
    iCRZ, iCRO  : integer;
    iContCancel : integer;
    DataReducao : TDateTime;
    HoraReducao : TDateTime;
    DataEmissao : TDateTime;
    HoraEmissao : TDateTime;
    cAuxValor   : currency;
    ArquivoTemp: TStringList;


    procedure SeparaStringAut;
    var sAux        : AnsiString;
        iPosicao    : integer;
    begin
       sStringList:= TStringList.Create;
       while Length(sDados) > 0 do
          begin
             iPosicao:= pos(',', sDados);
             if iPosicao > 0 then
                begin
                   sAux:= copy(sDados, 1, iPosicao -1);
                   sDados:= copy(sDados, iPosicao + 1, length(sDados));
                end
             else
                begin
                   sAux:= sDados;
                   sDados:= '';
                end;
             sStringList.Add(sAux)
          end;
    end;

    procedure GravaMapaResumoAut;
    begin
       if dm.IBTransaction.Active then
          dm.IBTransaction.Commit;
       dm.IBTransaction.StartTransaction;
       try
         try
           with dm.QGravaMapa do
              begin
                 close;
                 Parambyname('CHECKOUT').AsInteger     := iCaixa;
                 Parambyname('DATA').AsDate            := dDataMovimento;
                 Parambyname('COO_INICIAL').AsInteger  := iCOOInicial;
                 Parambyname('COO_FINAL').AsInteger    := iCOOFinal;
                 Parambyname('GT_INICIAL').AsCurrency  := cGTInicial;
                 Parambyname('GT_FINAL').AsCurrency    := cGTFinal;
                 Parambyname('CRZ').AsInteger          := iCRZ;
                 Parambyname('CONT_CANCEL').AsInteger  := iContCancel;
                 Parambyname('CRO').AsInteger          := iCRO;
                 Parambyname('COD_EMP').AsInteger      := iEmp;
                 Parambyname('DATA_EMISSAO').AsDate    := DataEmissao;
                 Parambyname('HORA_EMISSAO').AsTime    := HoraEmissao;
                 ParamByName('VENDA_BRUTA').AsCurrency := Venda_bruta;
                 open;
                 iCodMapa:= dm.QGravaMapaCODMAPA.AsInteger;
              end;
           dm.IBTransaction.Commit;
         except
           dm.IBTransaction.Rollback;
           showmessage('Erro ao gravar o mapa resumo');
         end;
       finally
         dm.QGravaMapa.Close;
       end;
    end;

    procedure GravaItensMapaAut(const sIndice : AnsiString; const Valor : currency);
    var iAuxCodGRP : integer;
        sIndiceR03 : AnsiString;
    begin
       iAuxCodGRP:= 0;
       sIndiceR03:= '';

       { buscando o grupo de icms }
       if dm.IBTransaction.Active then
          dm.IBTransaction.Commit;
       dm.IBTransaction.StartTransaction;
       try
         try
           with dm.QConsulta do
              begin
                 close;
                 sql.Clear;
                 sql.Text:= 'SELECT COD_GRP, INDICE_R03  ' +
                            'FROM INDICE_ECF ' +
                            'WHERE COD_CAI = :CODCAI AND COD_EMP = :CODEMP AND INDICE_ECF = :INDICE';
                 Parambyname('codcai').AsInteger  := iCaixa;
                 Parambyname('codemp').AsInteger  := iEmp;
                 Parambyname('indice').AsString   := trim(sIndice);
                 open;
                 iAuxCodGRP := fieldbyname('cod_grp').AsInteger;
                 sIndiceR03 := fieldbyname('indice_r03').AsString;
              end;
           dm.IBTransaction.Commit;
         except
           dm.IBTransaction.Rollback;
           iAuxCodGRP:= 0;
           showmessage('Erro ao buscar o código do grupo de ICMS/ISS');
         end;
       finally
         dm.QConsulta.Close;
       end;

       if iAuxCodGRP > 0 then
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
                       sql.Text:= 'INSERT INTO ITENS_MAPA_RESUMO (CODIGO, COD_GRP, VALOR, COD_EMP, INDICE_R03, STATUS_EXPORTA) ' +
                                  'VALUES (:COD, :CODGRP, :VALOR, :CODEMP, :R03, 0)';

                       Parambyname('COD').AsInteger       := iCodMapa;
                       Parambyname('CODGRP').AsInteger    := iAuxCodGRP;
                       Parambyname('valor').AsCurrency    := Valor;
                       Parambyname('codemp').AsInteger    := iEmp;
                       Parambyname('R03').AsString        := trim(sIndiceR03);
                       ExecOrOpen;
                    end;
                 dm.IBTransaction.Commit;
               except
                 dm.IBTransaction.Rollback;
                 showmessage('Erro ao gravar o item do mapa resumo');
               end;
             finally
               dm.QConsulta.Close;
             end;
          end;
    end;

begin
   { busca o COO inicial e o GT inicial }
   try
     iCOOInicial := StrToInt( IniTemp.ReadString( 'ECF', 'COOINICIAL_MAPA', '0' ) ) ;
   except
     iCOOInicial := 0;
   end;

     cGTInicial  := 0;

   try
     Venda_bruta := StrToFloat( IniTemp.ReadString( 'Totalizadores', 'VendaBruta', '0' ) ) ;;
   except
     Venda_bruta := 0;
   end;
   dDataMovimento := StrToDate( IniTemp.ReadString( 'ECF', 'DataMovimento', DateToStr( Date ) ) );

{   ArquivoTemp := TStringList.Create;
   ArquivoTemp.Clear;
   ArquivoTemp.Text := dm.ECF.DadosUltimaReducaoZ;
   ArquivoTemp.SaveToFile( GetCurrentDir + '\TEMP_RESUMO.INI');
   ArquivoTemp.Free;}
           DataEmissao := StrToDateTime( IniTemp.ReadString( 'ECF', 'DataHoraEmissao', DateToStr( date ) ) );
           HoraEmissao :=  StrToDateTime( IniTemp.ReadString( 'ECF', 'DataHoraEmissao', TimeToStr( Time ) ) );

         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         try
           try
             with DM.IBSQLFecha do
                begin
                   close;
                   sql.Clear;
                   sql.Add('UPDATE ABRE_FECHA_CAIXA SET DATA_FECHA = :DATAFECHA, HORA_FECHA = :HORAFECHA ' +
                           'WHERE COD_CAI = :CODCAI AND COD_EMP = :CODEMP AND DATA_FECHA IS NULL');
                   Parambyname('codemp').AsInteger := iEmp;
                   Parambyname('codcai').AsInteger := iCaixa;
                   Parambyname('datafecha').AsDate := DataEmissao;
                   Parambyname('horafecha').AsTime := HoraEmissao;
                   ExecOrOpen;
                end;
             dm.IBTransaction.Commit;
           except
             showmessage('Erro ao gravar o Fechamento do Caixa');
             dm.IBTransaction.Rollback;
           end;
         finally
           DM.IBSQLFecha.Close;
         end;

                 iCRO         := StrToInt( IniTemp.ReadString( 'ECF', 'NumCRO', '0' ) );
                 iCRZ         := StrToInt( IniTemp.ReadString( 'ECF', 'NumCRZ', '0' ) );
                 iCOOFinal    := StrToInt( IniTemp.ReadString( 'ECF', 'NumCOO', '0' ) );
                 iContCancel  := 0;
                 cGTFinal     := StrToFloat( IniTemp.ReadString( 'Totalizadores', 'GrandeTotal', '0' ) );
                 GravaMapaResumoAut;

                 {gravando os itens do mapa resumo}

                 {Sub.tributaria ICMS}
                 cAuxValor:= 0;
                 cAuxValor:= StrToFloat( IniTemp.ReadString( 'OutrasICMS', 'TotalSubstituicaoTributaria', '0' ) ) ;
                 GravaItensMapaAut('FF', cAuxValor);

                 {Sub.tributaria ISS}
                 cAuxValor:= 0;
                 cAuxValor:= StrToFloat( IniTemp.ReadString( 'OutrasICMS', 'TotalSubstituicaoTributariaISSQN', '0' ) );
                 GravaItensMapaAut('SF', cAuxValor);

                 {Isento ICMS}
                 cAuxValor:= 0;
                 cAuxValor:= StrToFloat( IniTemp.ReadString( 'OutrasICMS', 'TotalIsencao', '0' ) );
                 GravaItensMapaAut('II', cAuxValor);

                 {Isento ISS}
                 cAuxValor:= 0;
                 cAuxValor:= StrToFloat( IniTemp.ReadString( 'OutrasICMS', 'TotalIsencaoISSQN', '0' )  );
                 GravaItensMapaAut('SI', cAuxValor);

                 {Nao Incidencia ICMS}
                 cauxValor:= 0;
                 cAuxValor:= 0;
                 GravaItensMapaAut('NN', cAuxValor);

                 {Nao Incidencia ISS}
                 cAuxValor:= 0;
                 cAuxValor:= 0;
                 GravaItensMapaAut('SN', cAuxValor);

                 {Desconto ICMS}
                 cauxValor:= 0;
                 cAuxValor:= StrToFloat( IniTemp.ReadString( 'Totalizadores', 'TotalDescontos', '0' ) );
                 GravaItensMapaAut('DT', cAuxValor);

                 {Desconto ISS}
                 cAuxValor:= 0;
                 cAuxValor:= StrToFloat( IniTemp.ReadString( 'Totalizadores', 'TotalDescontosISSQN', '0' ) );
                 GravaItensMapaAut('DS', cAuxValor);

                 {Acrescimo ICMS}
                 cauxValor:= 0;
                 cAuxValor:= StrToFloat( IniTemp.ReadString( 'Totalizadores', 'TotalAcrescimos', '0' ) );
                 GravaItensMapaAut('AT', cAuxValor);

                 {Acrescimo ISS}
                 cAuxValor:= 0;
                 cAuxValor:= StrToFloat( IniTemp.ReadString( 'Totalizadores', 'TotalAcrescimosISSQN', '0' ) );
                 GravaItensMapaAut('AS', cAuxValor);

                 {Cancelamento ICMS}
                 cauxValor:= 0;
                 cAuxValor:= StrToFloat( IniTemp.ReadString( 'Totalizadores', 'TotalCancelamentos', '0' )  );
                 GravaItensMapaAut('Can-T', cAuxValor);

                 {Cancelamento ISS}
                 cAuxValor:= 0;
                 cAuxValor:= StrToFloat( IniTemp.ReadString( 'Totalizadores', 'TotalCancelamentosISSQN', '0' ) );
                 GravaItensMapaAut('Can-S', cAuxValor);

                 {Não Fiscal}
                 cAuxValor:= 0;
                 cAuxValor:= StrToFloat( IniTemp.ReadString( 'Totalizadores', 'TotalNaoFiscal', '0' ) );
                 GravaItensMapaAut('OPNF', cAuxValor);


                 {aliquotas Tributaveis}
                for I := 0 to dm.ECF.Aliquotas.Count -1 do
                   begin
                      sAux2 := '';
                      cAuxValor := dm.ECF.Aliquotas[I].Aliquota;
                      sAux2 := FormatFloat( '00', I + 1);
                      sAux2 := sAux2 + dm.ECF.Aliquotas[I].Tipo;
                      sAux2 := sAux2 + RetiraPontoString( FormatFloat( '00.00', cAuxValor ) );
                      if IniTemp.ValueExists( 'Aliquotas', sAux2 ) then
                            sAux := IniTemp.ReadString( 'Aliquotas', sAux2, '0' )
                      else
                          sAux := '0';
                      cAuxValor := StrToFloat( sAux );

                       MontaIndice :=  FloatToStr( dm.ECF.Aliquotas[I].Aliquota ) + dm.ECF.Aliquotas[I].Tipo;
                      GravaItensMapaAut( MontaIndice, cAuxValor );
                   end;
                 { totalizador nao fiscal }




           FreeAndNil(sStringList);
          dm.GeraMovimento(iCaixa, dDataMovimento, dDataMovimento, 1, '');

end;


function VersaoDLL(const iAuxECF : integer) : AnsiString;
var sVersaoDLL : AnsiString;
begin
   if iECF = 99 then
      Exit;
   result := dm.ECF.About;
end;

function CupomFiscalAberto(const iAuxECF : integer) : boolean;
var iACK, iST1, iST2 : integer;
    sStatus : AnsiString;
begin
   if iECF = 99 then
      Exit;
   if dm.ECF.Estado = estVenda then
      result := True
   else
      result := False;
end;

function NumeroCupom(const iAuxECF : integer) : AnsiString;
var sNumCOO : AnsiString;
    i : integer;
begin

   sNumCOO := dm.ECF.NumCOO;
   result:= trim(sNumCOO);
end;

function ContadorCupomFiscal(const iAuxECF : integer) : AnsiString;
var sCCF : AnsiString;
begin
   sCCF := dm.ECF.NumCCF;
   result:= trim(sCCF);
end;

function ContadorNaoFiscal(const iAuxECF : integer) : AnsiString;
var sGNF : AnsiString;
begin
   sGNF := dm.ECF.NumGNF;
   result:= trim(sGNF);
end;

function ContadorRelatorioGerencial(const iAuxECF : integer) : AnsiString;
var sGRG : AnsiString;
begin
   sGRG := dm.ECF.NumGRG;
   result:= trim(sGRG);
end;

function ContadorComprovanteCreditoDebito(const iAuxECF : integer) : AnsiString;
var sCDC : AnsiString;
begin
   sCDC := dm.ECF.NumCDC;
   result:= trim(sCDC);
end;

function NumeroECF(const iAuxECF : integer) : AnsiString;
var sNumECF : AnsiString;

begin
   sNumECF := dm.ECF.NumECF;
   result:= trim(sNumECF);
end;

function SubTotalCupomFiscal(const iAuxECF : integer) : currency;

begin
   result := dm.ECF.Subtotal;

end;

function TotalItemVendido(const iAuxECF : integer) : currency;
var sSubTotal : AnsiString;
    i : integer;
begin
   result := dm.ECF.Subtotal;

end;

function VerificaNumeroSerie( I: Integer = 1 ) : boolean;
begin
   if iECF = 99 then
      Exit;
   if I = 1 then
      begin
         result := true;
         exit;
      end
   else
   begin
   try
     dm.ECF.DoVerificaValorGT;
     result := true;
   except
      On E: Exception do
         begin
                     ShowMessage( E.Message );
            Result := false;
         end;

   end;
   end;

end;

function VerificaGT( I: Integer = 1 ): boolean;
begin
   if iECF = 99 then
      Exit;
   if I = 1 then
      begin
         result := true;
         exit;
      end
   else
   begin
   try
     dm.ECF.DoVerificaValorGT;
     result := true;
   except
      On E: Exception do
         begin
            ShowMessage( E.Message );
            Result := false;
         end;

   end;
   end;


end;

function GT(const iAuxECF : integer) : AnsiString;
var sGT : AnsiString;
    i : integer;
begin
   if iECF = 99 then
      Exit;
   sGT:= '';
   sGT := FloatToStr( dm.ECF.GrandeTotal );
   result:= sGT;
end;

procedure GravaGT(const iAuxECF : integer);
begin
end;

function DataHoraECF(const IAuxECF : integer) : AnsiString;
var sData, sHora: AnsiString;
    i : integer;
begin
   if iECF = 99 then
      Exit;
   sData:= '';
   sHora:= '';
   sData :=  FormatdateTime( 'ddmmyy', dm.ECF.DataHora );
   sHora :=  FormatdateTime( 'hhmmss', dm.ECF.DataHora );
   result:= sData + sHora;

end;

function DataECF(const IAuxECF : integer) : TDateTime;
var sData, sHora: AnsiString;
    i : integer;
begin
   if iECF = 99 then
      Exit;
   sData:= '';
   sHora:= '';
   try
       sData :=  FormatdateTime( 'ddmmyy', dm.ECF.DataHora );
       sHora :=  FormatdateTime( 'hhmmss', dm.ECF.DataHora );
       result:= strtodate(copy(sData, 1, 2) + '/' + copy(sData, 3, 2) + '/' + copy(sData, 5, 2));
   except
      result := date;
   end;

end;

function NumeroCER(const iAuxECF : integer) : AnsiString;
var
  sNumCER : integer;
begin

  dm.ECF.LerTotaisRelatoriosGerenciais;
  sNumCER := dm.ECF.RelatoriosGerenciais[0].Contador;
  Result := inttostr( sNumCER );

end;

function DataMovimentoECF(const iAuxECF : integer) : AnsiString;
var sDataMovimento : AnsiString;
    i : integer;
begin
   sDataMovimento := formatdatetime( 'ddmmyy', dm.ECF.DataMovimento );
   result:= trim(sDataMovimento);
end;

procedure EspelhoMFPeriodo(const iAuxECF : integer; DataIni, DataFin : TDateTime; const bCompleta : boolean);
var sDataIni, sDataFin, sTipo, sNomeArquivo : AnsiString;
   sAux: Boolean;
   Arquivo: TStringList;
begin
   if iECF = 99 then
      Exit;
   sDataIni:= datetostr(DataIni);
   sDataFin:= datetostr(DataFin);
   if bCompleta then
      begin
         sTipo:= 'c';
         sNomeArquivo:= 'C:\PAF_ECF\EspelhoLMFC.txt';
         sAux := False;
      end
   else
      begin
         sTipo:= 's';
         sNomeArquivo:= 'C:\PAF_ECF\EspelhoLMFS.txt';
         sAux := True;
      end;

      if sAux then
         dm.ECF.PafMF_LMFS_Espelho( DataIni, DataFin, sNomeArquivo )
      else
         dm.ECF.PafMF_LMFC_Espelho( DataIni, DataFin, sNomeArquivo );

//     dm.ECF.LeituraMemoriaFiscalSerial( dataini, Datafin, Arquivo, sAux );

     ShowMessage( 'Arquivo gravado em : ' + #13 + sNomeArquivo );
     dm.AssinaturaDigital( sNomeArquivo );


end;

procedure EspelhoMFReducao(const iAuxECF : integer; const RedIni, RedFin : integer; const bCompleta : boolean);
var sRedIni, sRedFin, sTipo, sNomeArquivo : AnsiString;
   sAux : Boolean;
   Arquivo: TStringList;
begin
   if iECF = 99 then
      Exit;
   sRedIni:= inttostr(RedIni);
   sRedFin:= inttostr(RedFin);
   if bCompleta then
      begin
         sTipo:= 'c';
         sNomeArquivo:= 'C:\PAF_ECF\EspelhoLMFC.txt';
         sAux := false;
      end
   else
      begin
         sTipo:= 's';
         sNomeArquivo:= 'C:\PAF_ECF\EspelhoLMFS.txt';
         sAux := True;
      end;
      if sAux then
         dm.ECF.PafMF_LMFS_Espelho( RedIni, redFin, sNomeArquivo )
      else
         dm.ECF.PafMF_LMFC_Espelho( RedIni, redFin, sNomeArquivo );
//      dm.ECF.LeituraMemoriaFiscalSerial( RedIni, redFin, Arquivo, sAux );
      ShowMessage( 'Arquivo gravado em : ' + #13 + sNomeArquivo );
      dm.AssinaturaDigital( sNomeArquivo );


end;

procedure EspelhoMDFPerido(const iAuxECF : integer; DataIni, DataFin : TDateTime);
var sDataIni, sDataFin, sNomeArquivo : AnsiString;
    sDownload : AnsiString;
    sFormato  : AnsiString;
    sUsuario  : AnsiString;
    sTipoIntervalo : AnsiString;
begin
   if iECF = 99 then
      Exit;
   sDataIni       := datetostr(DataIni);
   sDataFin       := datetostr(DataFin);
   sNomeArquivo   := GetCurrentDir + '\EspelhoMFD_Data.txt';
   sDownload      := 'Download.mfd';
   sFormato       := '0';
   sUsuario       := '1';
   sTipoIntervalo := '1';
   dm.ECF.PafMF_MFD_Espelho( DataIni,DataFin , sNomeArquivo );
//   dm.ECF.EspelhoMFD_DLL( Dataini, datafin, sNomeArquivo );
   ShowMessage( 'Arquivo gravado em : ' + #13 + sNomeArquivo );
   dm.AssinaturaDigital(sNomeArquivo);

end;

procedure EspelhoMDFCOO(const iAuxECF : integer; COOIni, COOFin : integer);
var sCOOIni, sCOOFin, sNomeArquivo : AnsiString;
    sDownload : AnsiString;
    sFormato  : AnsiString;
    sUsuario  : AnsiString;
    sTipoIntervalo : AnsiString;
begin
   if iECF = 99 then
      Exit;
   sCOOIni        := inttostr(COOIni);
   sCOOFin        := IntToStr(COOFin);
   sNomeArquivo   := GetCurrentDir + '\EspelhoMFD_COO.txt';
   dm.ECF.PafMF_MFD_Espelho( COOini,COOFin , sNomeArquivo );
//   dm.ECF.EspelhoMFD_DLL( COOini, COOFin, sNomeArquivo);
   ShowMessage( 'Arquivo gravado em : ' + #13 + sNomeArquivo );
   dm.AssinaturaDigital(sNomeArquivo);

end;

function ModeloECF(const iAuxECF : integer) : AnsiString;
var sModelo : AnsiString;

begin
   if iECF = 99 then
      Exit;
   sModelo := dm.ECF.ModeloStr;
   result:= sModelo;
end;

function GravaVenda(const iCOO, iCCF, iCER, iCliente, iVendedor, iTipoVenda, iCancelada : integer) : integer;
var sDataHoraECF, sDataCupom, sHoraCupom : AnsiString;
begin
   { BUSCA DATA E HORA DA ECF }
   sDataHoraECF   := DataHoraECF(iECF);
   sDataCupom     := FormataDataECF(sDataHoraECF);
   sHoraCupom     := FormataHoraECF(sDataHoraECF);
   dDataHoraVenda := StrToDateTime(sDataCupom + ' ' + sHoraCupom);

   { GRAVANDO A VENDA }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QAbreVenda do
         begin
            close;
            Parambyname('dataven').AsDate      := StrToDate(sDataCupom);
            Parambyname('codemp').AsInteger    := iEmp;
            Parambyname('codcai').AsInteger    := iCaixa;
            Parambyname('datahora').AsDateTime := dDataHoraVenda;
            Parambyname('codusu').AsInteger    := ICodUsu;
            Parambyname('cupom').AsInteger     := icoo;
            Parambyname('codcli').AsInteger    := iCliente;
            Parambyname('codvend').AsInteger   := iVendedor;
            Parambyname('codtpv').AsInteger    := iTipoVenda;
            Parambyname('codfiscal').AsString  := '2D';
            Parambyname('serie').Value         := null;
            Parambyname('numero').value        := null;
            Parambyname('cancelada').AsInteger := iCancelada;
            Parambyname('ccf').AsInteger       := iCCF;
            Parambyname('cer').AsInteger       := iCER;
            Open;
            result:= dm.QAbreVendaCODVEN.AsInteger;
         end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       result:= 0;
       showmessage('Erro ao gravar a Venda');
     end;
   finally
     dm.QAbreVenda.Close;
   end;
end;

procedure GravaProdutoVenda(const iVenda, iProduto, iOrdem, iVendedor, iCancel, iCancelVenda : integer;
                            const cQuant, cValorUnit, cValorDesc : currency;
                            const sTipoDesconto : AnsiString;
                            const bProm :  boolean);
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   { CODVEN integer,
    CODPRO integer,
    ORDEM integer,
    DESCONTO numeric(18,2),
    CODEMP integer,
    QUANT numeric(18,3),
    VALOR numeric(18,3),
    PROMOCAO char(1),
    CODVEND integer,
    CANCELADO integer,
    VENDACANCELADA integer)}
   try
     try
       with dm.Cmd do
          begin
             close;
             sql.Clear;
             sql.Add( 'execute procedure SP_GRAVA_ITEM_VENDA( :codven, :codpro, :ordem, :desconto,' +
             ':codemp, :quant, :valor, :promocao, :codvend, :cancelado, :vendacancelada )' );
             Parambyname('codven').AsInteger         := iVenda;
             Parambyname('codpro').AsInteger         := iProduto;
             Parambyname('ordem').AsInteger          := iOrdem;
             Parambyname('quant').AsCurrency         := cQuant;
             Parambyname('valor').AsCurrency         := cValorUnit;
             Parambyname('codemp').AsInteger         := iEmp;
             if trim(sTipoDesconto) = '$' then
                Parambyname('desconto').AsCurrency   := cValorDesc
             else
                Parambyname('desconto').AsCurrency   := (((cQuant * cValorUnit) * cValorDesc) / 100);
             if bProm then
                Parambyname('promocao').AsString     := 'S'
             else
                Parambyname('promocao').AsString     := 'N';
             Parambyname('codvend').AsInteger        := iVendedor;
             Parambyname('cancelado').AsInteger      := iCancel;
             Parambyname('vendacancelada').AsInteger := iCancelVenda;
             dm.cmd.Prepare;
             dm.cmd.ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao gravar o produto na venda');
     end;
   finally
     dm.cmd.Close;
   end;
end;

procedure GravaFechamentoVenda(const iCodVenda : integer; const cDesc, cTotal : currency; const sCliente, sCNPJ : AnsiString);
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QAtualizaVenda do
          begin
             close;
             Parambyname('1').AsInteger   := iCodVenda;
             Parambyname('2').AsCurrency  := cDesc;
             Parambyname('3').AsCurrency  := cTotal;
             Parambyname('4').AsString    := copy(trim(sCliente), 1, 40);
             Parambyname('5').AsString    := copy(trim(sCNPJ), 1, 18);
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao Atualizar a Venda');
     end;
   finally
      dm.QAtualizaVenda.Close;
   end;
end;

procedure GravaDadosCliente( iCodVenda : integer;  sCliente, sCNPJ : AnsiString);
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             SQL.Text := 'UPDATE VENDAS SET ' +
                         ' R04_NOME_CLIENTE=:4,' +
                         ' R04_CNPJ_CLIENTE=:5' +
                         ' WHERE COD_VEN=:1';
             Parambyname('1').AsInteger   := iCodigoVenda;
             Parambyname('4').AsString    := copy(trim(sCliente), 1, 40);
             Parambyname('5').AsString    := copy(trim(sCNPJ), 1, 18);
             Prepare;
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao Atualizar a Venda');
     end;
   finally
      dm.QAtualizaVenda.Close;
   end;
end;


procedure GravaOutrosDocumentos(const sDescricao : AnsiString);
var iCOO : integer;
    iGNF : integer;
    iGRG : integer;
    iCDC : integer;
    sDataHora : AnsiString;
begin
   { Descricao    CM  conferencia de mesa
                  RV  registro de venda
                  CC  comprovante de credito ou debito
                  CN  comprovante nao fiscal
                  NC  comprovante nao fiscal cancelamento
                  RG  relatorio gerencial   }

   sDataHora:= DataHoraECF(iECF);
   iGRG:= 0;

   try
     iCOO:= StrToInt(NumeroCupom(iECF));
     if iECF = 2 then
        iCOO:= iCOO - 1;
   except
     iCOO:= 0;
   end;

   try
     iGNF:= StrToInt(ContadorNaoFiscal(iECF));
   except
     iGNF:= 0;
   end;

   if trim(sDescricao) = 'CC' then
      begin
         try
           iCDC:= StrToInt(ContadorComprovanteCreditoDebito(iECF));
         except
           iCDC:= 0;
         end;
      end;

   if trim(sDescricao) = 'RG' then
      begin
         try
           iGRG:= StrToInt(ContadorRelatorioGerencial(iECF));
         except
           iGRG:= 0;
         end;
      end
   else
      iGRG:= 0;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'INSERT INTO OUTROS_DOCUMENTOS_ECF (CODIGO, COD_CAI, COD_EMP, COO, GNF, GRG, CDC, DESCRICAO, DATA_FINAL, HORA_FINAL) ' +
                        'VALUES(GEN_ID(GNT_COD_OUTROS_DOCUMENTOS, 1), :CODCAI, :CODEMP, :COO, :GNF, :GRG, :CDC, :DESC, :DATA, :HORA)';
             Parambyname('codcai').AsInteger  := iCaixa;
             Parambyname('codemp').AsInteger  := iEmp;
             Parambyname('coo').AsInteger     := iCOO;
             Parambyname('gnf').AsInteger     := iGNF;
             Parambyname('grg').AsInteger     := iGRG;
             Parambyname('cdc').AsInteger     := iCDC;
             Parambyname('desc').AsString     := trim(sDescricao);
             try
               Parambyname('data').AsDate     := strtodate(copy(sDataHora,1,2) + '/' + copy(sDataHora,3,2) + '/' + copy(sDataHora,5,2));
             except
               Parambyname('data').AsDate     := date;
             end;

             try
               Parambyname('hora').AsTime     := StrToTime(copy(sDataHora,7,2) + ':' + copy(sDataHora,9,2) + ':' + copy(sDataHora,11,2));
             except
               Parambyname('hora').AsTime     := time;
             end;

             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao gravar na tabela outros_documentos_ecf');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure GravaMeiosPagamento(const sMeioPagamento, sTipoDocumento : AnsiString; const cValor : currency; const iCOO, iCCF, iGNF : integer; const dData : TDateTime);
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
             sql.Text:= 'INSERT INTO MEIOS_PAGAMENTOS_ECF (CODIGO, COD_CAI, COD_EMP, COO, CCF, GNF, MEIO_PAGAMENTO, VALOR_PAGO, DATA, TIPO_DOCUMENTO) ' +
                        'VALUES(GEN_ID(GNT_COD_MEIOS_PAGAMENTO, 1), :CODCAI, :CODEMP, :COO, :CCF, :GNF, :MEIO, :VALOR, :DATA, :TPDOC)';

             Parambyname('codcai').AsInteger  := iCaixa;
             Parambyname('codemp').AsInteger  := iEmp;
             Parambyname('coo').AsInteger     := iCOO;
             Parambyname('ccf').AsInteger     := iCCF;
             Parambyname('gnf').AsInteger     := iGNF;
             Parambyname('meio').AsString     := copy(sMeioPagamento, 1, 15);
             Parambyname('valor').AsCurrency  := cValor;
             Parambyname('data').AsDate       := dData;
             Parambyname('tpdoc').AsString    := trim(sTipoDocumento);

             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao gravar na tabela meios_pagamentos_ecf');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure GravaSuprimento(const cValor : currency);
var sDataHoraECF     : AnsiString;
    iAuxCupom        : integer;
    sNumeroCOO       : AnsiString;
    sDataCupom       : AnsiString;
    sHoraCupom       : AnsiString;
    sTPDocumento     : AnsiString;
    iGNF             : integer;
    iAuxCodForma     : integer;
    sDescricaoForma  : AnsiString;
begin
   sTPDocumento:= 'COMP.NAO FISCAL';

   sNumeroCOO:= NumeroCupom(iECF);
   try
     iAuxCupom:= strtoint(sNumeroCOO);
     if iECF = 2 then
        iAuxCupom:= iAuxCupom -1;
   except
     iAuxCupom:= 0;
   end;

   try
     iGNF:= StrToInt(ContadorNaoFiscal(iECF));
   except
     iGNF:= 0;
   end;

   { BUSCA DATA E HORA DA ECF }
   sDataHoraECF:= DataHoraECF(iECF);
   sDataCupom  := FormataDataEcf(sDataHoraECF);
   sHoraCupom  := FormataHoraECF(sDataHoraECF);

   {busca o codigo da forma de pagamento Dinheiro}
   iAuxCodForma    := dm.BuscaFormaPagamento('DN');
   sDescricaoForma := dm.BuscaDescricaoFormaNaECF(iAuxCodForma);


   { GRAVANDO O SUPRIMENTO }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
         begin
            close;
            sql.Clear;
            sql.Text:= 'INSERT INTO SUPRIMENTOS_ECF (CODIGO, DATA_HORA, COO, COD_CAI, COD_EMP, VALOR, FORMA_PAGAMENTO, COD_USU) ' +
                       'VALUES(GEN_ID(GNT_COD_SUPRIMENTOS_ECF, 1), :DATAHORA, :COO, :CODCAI, :CODEMP, :VALOR, :FP, :CODUSU)';
            Parambyname('datahora').AsDateTime := StrToDateTime(sDataCupom + ' ' + sHoraCupom);
            Parambyname('coo').AsInteger       := iAuxCupom;
            Parambyname('codcai').AsInteger    := iCaixa;
            Parambyname('codemp').AsInteger    := iEmp;
            Parambyname('valor').AsCurrency    := cValor;
            Parambyname('fp').AsString         := sDescricaoForma;
            Parambyname('codusu').AsInteger    := ICodUsu;
            ExecOrOpen;
         end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao Gravar o Suprimento');
     end;
   finally
     dm.QConsulta.Close;
   end;

   { grava a forma de pagamento }
   GravaMeiosPagamento(sDescricaoForma, sTPDocumento, cValor, iAuxCupom, 0, iGNF, strtodate(sDataCupom));
end;

procedure GravaTotalizadoresAntesZ;
var
   sAux, sAux2 : string;
   cAux: Currency;
   A: Integer;
begin
   if FileExists( GetCurrentDir + '\TOTS.INI' ) then
      DeleteFile( GetCurrentDir + '\TOTS.INI' );
   cAux := dm.ECF.TotalSubstituicaoTributaria;
   sAux := FloatToStr( cAux );
   dm.GravaIni(GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'TotalSubstituicaoTributaria', sAux );

   cAux := dm.ECF.TotalSubstituicaoTributariaISSQN;
   sAux := FloatToStr( cAux );
   dm.GravaIni(GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'TotalSubstituicaoTributariaISSQN', sAux );

   cAux := dm.ECF.TotalIsencao;
   sAux := FloatToStr( cAux );
   dm.GravaIni(GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'TotalIsencao', sAux );

   cAux := dm.ECF.TotalIsencaoISSQN;
   sAux := FloatToStr( cAux );
   dm.GravaIni(GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'TotalIsencaoISSQN', sAux );

   cAux := dm.ECF.TotalDescontos;
   sAux := FloatToStr( cAux );
   dm.GravaIni(GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'TotalDescontos', sAux );

   cAux := dm.ECF.TotalDescontosISSQN;
   sAux := FloatToStr( cAux );
   dm.GravaIni(GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'TotalDescontosISSQN', sAux );

   cAux := dm.ECF.TotalAcrescimos;
   sAux := FloatToStr( cAux );
   dm.GravaIni(GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'TotalAcrescimos', sAux );

   cAux := dm.ECF.TotalAcrescimosISSQN;
   sAux := FloatToStr( cAux );
   dm.GravaIni(GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'TotalAcrescimosISSQN', sAux );

   cAux := dm.ECF.TotalCancelamentos;
   sAux := FloatToStr( cAux );
   dm.GravaIni(GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'TotalCancelamentos', sAux );

   cAux := dm.ECF.TotalCancelamentosISSQN;
   sAux := FloatToStr( cAux );
   dm.GravaIni(GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'TotalCancelamentosISSQN', sAux );

   cAux := dm.ECF.TotalNaoFiscal;
   sAux := FloatToStr( cAux );
   dm.GravaIni(GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'TotalNaoFiscal', sAux );

   cAux := dm.ECF.VendaBruta;
   sAux := FloatToStr( cAux );
   dm.GravaIni(GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'VendaBruta', sAux );

  dm.ECF.LerTotaisAliquota ;

  for A := 0 to dm.ECF.Aliquotas.Count -1 do
     begin
        sAux2 := '';
        cAux := dm.ECF.Aliquotas[A].Aliquota;
        sAux2 := FormatFloat( '00', A );
        sAux2 := sAux2 + dm.ECF.Aliquotas[A].Tipo;
        sAux2 := sAux2 + RetiraPontoString( FormatFloat( '00.00', cAux ) );
        cAux := dm.ECF.Aliquotas[A].Total;
        sAux := FloatToStr( cAux );
        dm.GravaIni(GetCurrentDir + '\TOTS.INI', 'Aliquotas', sAux2, sAux );
     end;

   cAux := dm.ECF.VendaBruta;
   sAux := FloatToStr( cAux );
   dm.GravaIni(GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'VendaBruta', sAux );


   sAux := dm.ECF.NumCOOInicial;
   dm.GravaIni(GetCurrentDir + '\TOTS.INI', 'Totalizadores', 'COOInicial', sAux );


end;

function IsNumeric(S : String) : Boolean;
begin
Result := True;
Try
   StrToInt(S);
Except
Result := False;
end;
end;

end.
