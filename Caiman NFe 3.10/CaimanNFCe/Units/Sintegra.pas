unit Sintegra;

interface
uses
  Ubibli1, SysUtils, Dialogs;

function Registro_10(CNPJ, Insc, Razao, Municipio, UF, Fax, DataIni, DataFin,
         CodConvenio, CodNatureza, CodFinalidade : string) : string;

function Registro_11(Endereco, Numero, Complemento, Bairro, CEP,
         Responsavel, Telefone : string) : string;

function Registro_50(CNPJ, Insc, Data, UF, Modelo, Serie, Numero, CFOP,
                     Emitente, Total, Base, ICMS, Isenta, Outras, Aliquota, Situacao : string) : string;

function Registro_53(CNPJ, Insc, Data, UF, Modelo, Serie, Numero, CFOP,
                     Emitente, Base, ICMSRetido, Despesas, Situacao, CodAntecipacao : string) : string;

function Registro_54(CNPJ, Modelo, Serie, Numero, CFOP, CST, Item, CodPro, Quant, Valor,
                     Desconto, Base, BaseRST, IPI, Aliquota : string) : string;

function Registro_60M(Data, NumSerie, NumEquip, COOIni, COOFin, ContRed,
         ContReiOpe, VendaBruta, GrandeTotal : string) : string;

function Registro_60A(Data, NumSerie, TipoGRP, ICMS_ISS, Aliquota, Valor : string) : string;

function Registro_60D(Data, NumSerie, CodPro, Quant, Valor,
         BaseCalculo, SitTrib, IcmsIss, Aliquota, ValorImposto : string) : string;

function Registro_60I(Data, NumSerie, COO, OrdemItem, CodPro,
         Quant, Valor, BaseCalculo, Imposto, SitTrib, IcmsIss, Aliquota : string) : string;

function Registro_60R(Data, CodPro, Quant, Valor, Base, SitTrib, IcmsIss, Aliquota : string) : string;

function Registro_61(Data, Modelo, Serie, SubSerie, NumInicial, NumFinal, ValorTotal,
                     BaseCalculo, ValorICMS, Isentas, Outras, Aliquota : string) : string;

function Registro_61R(Data, CodPro, Quant, ValorBruto, BaseCalculo, Aliquota : string) : string;

function Registro_70(CNPJ, Insc, Data, UF, Modelo, Serie, SubSerie, Numero, CFOP, Total,
                     Base, ICMS, Isenta, Outras, CIFFOB, Situacao : string) : string;

function Registro_75(DataIni, DataFin, CodPro, CodNCM, NomePro, Unidade,
         Aliquota : string) : string;

function Registro_74(Data, CodPro, Quant, Total : string) : string;

function Registro_90(CNPJ, Insc, TipoTotal, NumReg90 : string) : string;

implementation


function Registro_10(CNPJ, Insc, Razao, Municipio, UF, Fax, DataIni, DataFin,
         CodConvenio, CodNatureza, CodFinalidade : string) : string;
var sCNPJ,
    sInsc,
    sRazao,
    sMunicipio,
    sUF,
    sFax,
    sDataIni,
    sDataFin,
    sCodConvenio,
    sCodNatureza,
    sCodFinalidade : string;
    dia, mes, ano  : word;
begin
   sCNPJ      := FormataStringD(Eliminacaracter(CNPJ), '14', '0');
   sInsc      := FormataStringE(EliminaCaracter(Insc), '14', ' ');
   sRazao     := FormataStringE(copy(Razao, 1, 35), '35', ' ');
   sMunicipio := FormataStringE(copy(Municipio, 1, 30), '30', ' ');
   sUF        := UF;
   sFax       := FormataStringD(eliminacaracter(copy(Fax, 1, 10)), '10', '0');

   DecodeDate(strtodate(DataIni), ano, mes, dia);
   sDataIni:= floattostr(ano) + FormataStringD(floattostr(mes), '2', '0') +
              FormataStringD(floattostr(dia), '2', '0');

   DecodeDate(strtodate(DataFin), ano, mes, dia);
   sDataFin:= floattostr(ano) + FormataStringD(floattostr(mes), '2', '0') +
              FormataStringD(floattostr(dia), '2', '0');
   sCodConvenio  := '3';
   sCodNatureza  := CodNatureza;
   sCodFinalidade:= CodFinalidade;
  { frmSintegra.ACBRSintegra.LimparRegistros;
   frmSintegra.ACBRSintegra.Registro10.CNPJ := trim( sCNPJ);
   frmSintegra.ACBRSintegra.Registro10.Inscricao := trim(sInsc );
   frmSintegra.ACBRSintegra.Registro10.RazaoSocial := trim( sRazao );
   frmSintegra.ACBRSintegra.Registro10.Cidade := trim( sMunicipio );
   frmSintegra.ACBRSintegra.Registro10.Estado := trim( sUF );
   frmSintegra.ACBRSintegra.Registro10.Telefone := trim( sFax );
   frmSintegra.ACBRSintegra.Registro10.DataInicial := strtodate( dataini );
   frmSintegra.ACBRSintegra.Registro10.DataFinal := strtodate( datafin );
   frmSintegra.ACBRSintegra.Registro10.CodigoConvenio := CodConvenio;
   frmSintegra.ACBRSintegra.Registro10.NaturezaInformacoes := CodNatureza;
   frmSintegra.ACBRSintegra.Registro10.FinalidadeArquivo := CodFinalidade;}
   Result:= '10'            +  //CAMPO 01 : TIPO (10)
            sCNPJ           +  //CAMPO 02 : CNPJ
            sInsc           +  //CAMPO 03 : INSC.ESTADUAL
            sRazao          +  //CAMPO 04 : RAZAO SOCIAL
            sMunicipio      +  //CAMPO 05 : MUNICIPIO
            sUF             +  //CAMPO 06 : UF
            sFax            +  //CAMPO 07 : FAX
            sDataIni        +  //CAMPO 08 : DATA INCIAL
            sDataFin        +  //CAMPO 09 : DATA FINAL
            sCodConvenio    +  //CAMPO 10 : CONVENIO
            sCodNatureza    +  //CAMPO 11 : NATUREZA DAS OPERACOES
            sCodFinalidade;    //CAMPO 12 : FINALIDADE DO ARQUIVO
end;

function Registro_11(Endereco, Numero, Complemento, Bairro, CEP,
         Responsavel, Telefone : string) : string;
var sEndereco,
    sNumero,
    sComplemento,
    sBairro,
    sCEP,
    sResponsavel,
    sTelefone : string;
begin
   sEndereco    := FormataStringE(copy(Endereco, 1, 34), '34', ' ');
   sNumero      := FormataStringD(copy(Numero, 1, 5), '5', '0');
   sComplemento := FormataStringE(copy(Complemento, 1, 22), '22', ' ');
   sBairro      := FormataStringE(copy(Bairro, 1, 15), '15', ' ');
   sCEP         := FormataStringD(EliminaCaracter(CEP), '8', '0');
   sResponsavel := FormataStringE(copy(Responsavel, 1, 28), '28', ' ');
   sTelefone    := FormataStringD(EliminaCaracter(Telefone), '12', '0');

   {frmSintegra.ACBRSintegra.Registro11.Endereco := trim( sEndereco );
   frmSintegra.ACBRSintegra.Registro11.Numero := trim( sNumero );
   frmSintegra.ACBRSintegra.Registro11.Complemento := Trim( sComplemento );
   frmSintegra.ACBRSintegra.Registro11.Bairro := trim( sBairro );
   frmSintegra.ACBRSintegra.Registro11.Cep := trim( sCEP );
   frmSintegra.ACBRSintegra.Registro11.Responsavel := trim( sResponsavel );
   frmSintegra.ACBRSintegra.Registro11.Telefone := trim( sTelefone );}

   Result:= '11'            +  //CAMPO 01 : TIPO (11)
            sEndereco       +  //CAMPO 02 : LOGRADOURO
            sNumero         +  //CAMPO 03 : NUMERO
            sComplemento    +  //CAMPO 04 : COMPLEMENTO
            sBairro         +  //CAMPO 05 : BAIRRO
            sCEP            +  //CAMPO 06 : CEP
            sResponsavel    +  //CAMPO 07 : RESPONSAVEL (CONTATO)
            sTelefone;         //CAMPO 08 : TELEFONE
end;

function Registro_50(CNPJ, Insc, Data, UF, Modelo, Serie, Numero, CFOP,
                     Emitente, Total, Base, ICMS, Isenta, Outras, Aliquota, Situacao : string) : string;
var sCNPJ,
    sInsc,
    sData,
    sUF,
    sModelo,
    sSerie,
    sNumero,
    sCFOP,
    sEmitente,
    sTotal,
    sBase,
    sICMS,
    sIsenta,
    sOutras,
    sAliquota,
    sSituacao : string;
    dia, mes, ano : word;

begin
   DecodeDate(strtodate(Data), ano, mes, dia);
   sData:= floattostr(ano) + FormataStringD(floattostr(mes), '2', '0') +
           FormataStringD(floattostr(dia), '2', '0');

   sCNPJ      := FormataStringD(Eliminacaracter(CNPJ), '14', '0');;
   sInsc      := FormataStringE(EliminaCaracter(Insc), '14', ' ');
   sUF        := UF;
   sModelo    := FormataStringD(modelo, '2', '0');
   sSerie     := FormataStringE(serie, '3', ' ');
   sNumero    := FormataStringD(Numero, '6', '0');
   sCFOP      := cfop;
   sEmitente  := Emitente;
   sTotal     := FormataStringD(EliminaCaracter(Total), '13', '0');
   sBase      := FormataStringD(EliminaCaracter(Base), '13', '0');
   sICMS      := FormataStringD(EliminaCaracter(ICMS), '13', '0');
   sIsenta    := FormataStringD(EliminaCaracter(Isenta), '13', '0');
   sOutras    := FormataStringD(EliminaCaracter(Outras), '13', '0');
   sAliquota  := FormataStringD(EliminaCaracter(Aliquota), '4', '0');
   sSituacao  := Situacao;

{   wRegistro50 := TRegistro50.Create;
   wRegistro50.CPFCNPJ := trim( sCNPJ );
   wRegistro50.Inscricao := trim( sinsc );
   wRegistro50.DataDocumento := strtodate( data );
   wRegistro50.UF := trim( sUF );
   wRegistro50.Modelo := trim( sModelo );
   wRegistro50.Serie := trim( sSerie );
   wRegistro50.Numero := trim( sNumero );
   wRegistro50.Cfop := trim( sCFOP );
   wRegistro50.EmissorDocumento := trim( sEmitente );
   wRegistro50.ValorContabil := StrtoFloat( total );
   wRegistro50.BasedeCalculo := Strtofloat( base );
   wRegistro50.Icms := strtofloat( icms );
   wRegistro50.Isentas := strtofloat( isenta );
   wRegistro50.Outras := strtofloat( outras );
//   wRegistro50.Aliquota := (wRegistro50.Icms * 100 )/ wRegistro50.BasedeCalculo;
   wRegistro50.Aliquota := strtofloat( aliquota );
   wRegistro50.Situacao := trim( sSituacao );
   frmSintegra.ACBRSintegra.Registros50.Add( wRegistro50 );  }


   Result:= '50'            +  //CAMPO 01 : TIPO (50)
            sCNPJ           +  //CAMPO 02 : CNPJ
            sInsc           +  //CAMPO 03 : INSCRICAO
            sData           +  //CAMPO 04 : DATA
            sUF             +  //CAMPO 05 : UF
            sModelo         +  //CAMPO 06 : MODELO
            sSerie          +  //CAMPO 07 : SERIE
            sNumero         +  //CAMPO 08 : NUMERO
            sCFOP           +  //CAMPO 09 : CFOP
            sEmitente       +  //CAMPO 10 : EMITENTE
            sTotal          +  //CAMPO 11 : TOTAL
            sBase           +  //CAMPO 12 : BASE
            sICMS           +  //CAMPO 13 : ICMS
            sIsenta         +  //CAMPO 14 : ISENTA
            sOutras         +  //CAMPO 15 : OUTRAS
            sAliquota       +  //CAMPO 16 : ALIQUOTA
            sSituacao;         //CAMPO 17 : SITUACAO
end;

function Registro_53(CNPJ, Insc, Data, UF, Modelo, Serie, Numero, CFOP,
                     Emitente, Base, ICMSRetido, Despesas, Situacao, CodAntecipacao : string) : string;
var sCNPJ,
    sInsc,
    sData,
    sUF,
    sModelo,
    sSerie,
    sNumero,
    sCFOP,
    sEmitente,
    sBase,
    sICMSRetido,
    sDespesas,
    sSituacao,
    sCodAntecipacao,
    sBrancos : string;
    dia, mes, ano : word;
begin
   DecodeDate(strtodate(Data), ano, mes, dia);
   sData:= floattostr(ano) + FormataStringD(floattostr(mes), '2', '0') +
           FormataStringD(floattostr(dia), '2', '0');

   sCNPJ            := FormataStringD(Eliminacaracter(CNPJ), '14', '0');;
   sInsc            := FormataStringE(EliminaCaracter(Insc), '14', ' ');
   sUF              := UF;
   sModelo          := FormataStringD(modelo, '2', '0');
   sSerie           := FormataStringE(serie, '3', ' ');
   sNumero          := FormataStringD(Numero, '6', '0');
   sCFOP            := cfop;
   sEmitente        := Emitente;
   sBase            := FormataStringD(EliminaCaracter(Base), '13', '0');
   sICMSRetido      := FormataStringD(EliminaCaracter(ICMSRetido), '13', '0');
   sDespesas        := FormataStringD(EliminaCaracter(Despesas), '13', '0');
   sSituacao        := Situacao;
   sCodAntecipacao  := CodAntecipacao;
   sBrancos         := FormataStringE(' ', '29', ' ');

   Result:= '53'            +  //CAMPO 01 : TIPO (50)
            sCNPJ           +  //CAMPO 02 : CNPJ
            sInsc           +  //CAMPO 03 : INSCRICAO
            sData           +  //CAMPO 04 : DATA
            sUF             +  //CAMPO 05 : UF
            sModelo         +  //CAMPO 06 : MODELO
            sSerie          +  //CAMPO 07 : SERIE
            sNumero         +  //CAMPO 08 : NUMERO
            sCFOP           +  //CAMPO 09 : CFOP
            sEmitente       +  //CAMPO 10 : EMITENTE
            sBase           +  //CAMPO 11 : BASE DE CALCULO
            sICMSRetido     +  //CAMPO 12 : ICMS RETIDO
            sDespesas       +  //CAMPO 13 : DESPESAS ACESSORIAS
            sSituacao       +  //CAMPO 14 : SITUACAO
            sCodAntecipacao +  //CAMPO 15 : CODIGO DA ANTECIPACAO
            sBrancos;          //CAMPO 16 : BRANCOS
end;

function Registro_54(CNPJ, Modelo, Serie, Numero, CFOP, CST, Item, CodPro, Quant, Valor,
                     Desconto, Base, BaseRST, IPI, Aliquota : string) : string;
var sCNPJ,
    sModelo,
    sSerie,
    sNumero,
    sCFOP,
    sCSt,
    sItem,
    sCodPro,
    sQuant,
    sValor,
    sDesconto,
    sBase,
    sBaseRST,
    sIPI,
    sAliquota : string;
begin
   sCNPJ      := FormataStringD(Eliminacaracter(CNPJ), '14', '0');
   sModelo    := FormataStringD(modelo, '2', '0');
   sSerie     := FormataStringE(serie, '3', ' ');
   sNumero    := FormataStringD(Numero, '6', '0');
   sCFOP      := CFOP;
   sCSt       := cst;
   sItem      := FormataStringD(item, '3', '0');
   sCodPro    := FormataStringE(CodPro, '14', ' ');
   sQuant     := FormataStringD(EliminaCaracter(Quant), '11', '0');
   sValor     := FormataStringD(EliminaCaracter(Valor), '12', '0');
   sDesconto  := FormataStringD(EliminaCaracter(Desconto), '12', '0');
   sBase      := FormataStringD(EliminaCaracter(Base), '12', '0');
   sBaseRST   := FormataStringD(EliminaCaracter(BaseRST), '12', '0');
   sIPI       := FormataStringD(EliminaCaracter(IPI), '12', '0');
   sAliquota  := FormataStringD(EliminaCaracter(Aliquota), '4', '0');

   {wRegistro54 := TRegistro54.Create;
   wRegistro54.CPFCNPJ := trim( sCNPJ );
   wRegistro54.Modelo := trim( sModelo );


   if frmSintegra.Aux.Active then
      frmSintegra.Aux.Commit;
    frmSintegra.Aux.StartTransaction;
    frmSintegra.Qaux.Close;
    frmSintegra.Qaux.SQL.Text := 'Select * from produto where COD_PRO=' + trim( sCodPro );
    frmSintegra.Qaux.Open;
   wRegistro54.Descricao := frmSintegra.QauxNOME_PRO.AsString;
   frmSintegra.Qaux.Close;
   frmSintegra.Aux.Commit;

   wRegistro54.Serie := trim( sSerie );
   wRegistro54.Numero := trim( sNumero );
   wRegistro54.CFOP := trim( sCFOP );
   wRegistro54.CST := trim( sCST );
   wRegistro54.NumeroItem := strtoint( trim(item) );
   wRegistro54.Codigo := trim( sCodPro );
   wRegistro54.Quantidade := strtofloat( quant );
   wRegistro54.Valor := strtofloat( valor );
   wRegistro54.ValorDescontoDespesa := strtofloat( Desconto );
   wRegistro54.BasedeCalculo := strtofloat( Base );
   wRegistro54.BaseST := strtofloat( BaseRST );
   wRegistro54.ValorIpi := strtofloat( IPI );
   wRegistro54.Aliquota := strtofloat( Aliquota );
   frmSintegra.ACBRSintegra.Registros54.Add( wregistro54 );   }
   { Quant, Valor,
                     Desconto, Base, BaseRST, IPI, Aliquota }

   Result:= '54'         +  //CAMPO 01 : TIPO (54)
            sCNPJ        +  //CAMPO 02 : CNPJ
            sModelo      +  //CAMPO 03 : MODELO
            sSerie       +  //CAMPO 04 : SERIE
            sNumero      +  //CAMPO 05 : NUMERO
            sCFOP        +  //CAMPO 06 : CFOP
            sCSt         +  //CAMPO 07 : CST
            sItem        +  //CAMPO 08 : ITEM
            sCodPro      +  //CAMPO 09 : CODIGO DO PRODUTO
            sQuant       +  //CAMPO 10 : QUANTIDADE
            sValor       +  //CAMPO 11 : VALOR DO PRODUTO
            sDesconto    +  //CAMPO 12 : VALOR DO DESCONTO/DESPESA
            sBase        +  //CAMPO 13 : BASE DE CALCULO
            sBaseRST     +  //CAMPO 14 : BASE DE CALCULO DE RETENCAO NA SUB.TRIBUTARIA
            sIPI         +  //CAMPO 15 : VALOR DO IPI
            sAliquota;      //CAMPO 16 : ALIQUOTA DO ICMS
end;

function Registro_60M(Data, NumSerie, NumEquip, COOIni, COOFin, ContRed,
         ContReiOpe, VendaBruta, GrandeTotal : string) : string;
var sData,
    sNumSerie,
    sNumEquip,
    sCOOIni,
    sCOOFin,
    sContRed,
    sContReiOpe,
    sVendaBruta,
    sGrandeTotal,
    sModelo,
    sBrancos : string;
    dia, mes, ano : word;
begin
   DecodeDate(strtodate(Data), ano, mes, dia);
   sData:= floattostr(ano) + FormataStringD(floattostr(mes), '2', '0') +
           FormataStringD(floattostr(dia), '2', '0');

   sNumSerie    := FormataStringE(NumSerie, '20', ' ');
   sNumEquip    := FormataStringD(NumEquip, '3', '0');
   sModelo      := '2D';
   sCOOIni      := FormataStringD(COOIni, '6', '0');
   sCOOFin      := FormataStringD(COOFin, '6', '0');
   sContRed     := FormataStringD(ContRed, '6', '0');
   sContReiOpe  := FormataStringD(ContReiOpe, '3', '0');
   sVendaBruta  := FormataStringD(EliminaCaracter(VendaBruta), '16', '0');
   sGrandeTotal := FormataStringD(EliminaCaracter(GrandeTotal), '16', '0');
   sBrancos     := FormataStringE(' ', '37', ' ');

   Result:= '60'         +  //CAMPO 01 : TIPO (60)
            'M'          +  //CAMPO 02 : SUBTIPO
            sData        +  //CAMPO 03 : DATA EMISSAO
            sNumSerie    +  //CAMPO 04 : NUMERO DE SERIE DO EQUIPAMENTO
            sNumEquip    +  //CAMPO 05 : NUMERO DO EQUIPAMENTO
            sModelo      +  //CAMPO 06 : MODELO DO DOCUMENTO FISCAL
            sCOOIni      +  //CAMPO 07 : COO INICIAL
            sCOOFin      +  //CAMPO 08 : COO FINAL
            sContRed     +  //CAMPO 09 : CONTADOR DE REDUCAO
            sContReiOpe  +  //CAMPO 10 : CONTADOR DE REINICIO DE OPERACAO
            sVendaBruta  +  //CAMPO 11 : VENDA BRUTA
            sGrandeTotal +  //CAMPO 12 : GRANDE TOTAL
            sBrancos;       //CAMPO 13 : BRANCOS
end;

function Registro_60A(Data, NumSerie, TipoGRP, ICMS_ISS, Aliquota, Valor : string) : string;
var sData,
    sNumSerie,
    sSitTrib,
    sValor,
    sBrancos : string;
    dia, mes, ano : word;
begin
   DecodeDate(strtodate(Data), ano, mes, dia);
   sData:= floattostr(ano) + FormataStringD(floattostr(mes), '2', '0') +
           FormataStringD(floattostr(dia), '2', '0');

   sNumSerie:= FormataStringE(NumSerie, '20', ' ');

   if trim(ICMS_ISS) = 'S' then
      sSitTrib:= 'ISS '
   else
      begin
         if trim(TipoGRP) = 'TRI' then
            sSitTrib:= FormataStringD(EliminaCaracter(Aliquota), '4', '0')
         else
         if trim(TipoGRP) = 'ISE' then
            sSitTrib:= 'I   '
         else
         if trim(TipoGRP) = 'ST' then
            sSitTrib:= 'F   '
         else
         if trim(TipoGRP) = 'NT' then
            sSitTrib:= 'N   '
         else
         if trim(TipoGRP) = 'CAN' then
            sSitTrib:= 'CANC'
         else
         if trim(TipoGRP) = 'DES' then
            sSitTrib:= 'DESC'
         else
            showmessage('Verifique Grupo de ICMS: ' + TipoGRP);
      end;

   sValor   := FormataStringD(EliminaCaracter(Valor), '12', '0');
   sBrancos := FormataStringE(' ', '79', ' ');

   result:= '60'      +  //CAMPO 01 : TIPO (60)
            'A'       +  //CAMPO 02 : SUBTIPO (60)
            sData     +  //CAMPO 03 : DATA
            sNumSerie +  //CAMPO 04 : NUMERO DE SERIE
            sSitTrib  +  //CAMPO 05 : SIT.TRIBUTARIA
            sValor    +  //CAMPO 06 : VALOR
            sBrancos;    //CAMPO 07 : BRANCOS
end;

function Registro_60D(Data, NumSerie, CodPro, Quant, Valor,
         BaseCalculo, SitTrib, IcmsIss, Aliquota, ValorImposto : string) : string;
var sData,
    sNumSerie,
    sCodPro,
    sQuant,
    sValor,
    sBaseCalculo,
    sSitTrib,
    sValorImposto,
    sBrancos : string;
    dia, mes, ano : word;
begin
   DecodeDate(strtodate(Data), ano, mes, dia);
   sData:= floattostr(ano) + FormataStringD(floattostr(mes), '2', '0') +
           FormataStringD(floattostr(dia), '2', '0');
   sNumSerie    := FormataStringE(NumSerie, '20', ' ');
   sCodPro      := FormataStringE(CodPro, '14', ' ');
   sQuant       := FormataStringD(EliminaCaracter(Quant), '13', '0');
   sValor       := FormataStringD(EliminaCaracter(Valor), '16', '0');
   sBaseCalculo := FormataStringD(EliminaCaracter(BaseCalculo), '16', '0');
   sValorImposto:= FormataStringD(EliminaCaracter(ValorImposto), '13', '0');
   sBrancos     := FormataStringE(' ', '19', ' ');

   if trim(ICMSISS) = 'S' then
      sSitTrib:= 'ISS '
   else
      begin
         if trim(SitTrib) = 'TRI' then
            sSitTrib:= FormataStringD(EliminaCaracter(Aliquota), '4', '0')
         else
         if trim(SitTrib) = 'ISE' then
            sSitTrib:= 'I   '
         else
         if trim(SitTrib) = 'ST' then
            sSitTrib:= 'F   '
         else
         if trim(SitTrib) = 'NT' then
            sSitTrib:= 'N   '
         else
            showmessage('Verifique Grupo de ICMS do produto: ' + sCodPro);
      end;

   result:= '60'          +  //CAMPO 01 : TIPO (60)
            'D'           +  //CAMPO 02 : SUBTIPO (60)
            sData         +  //CAMPO 03 : DATA
            sNumSerie     +  //CAMPO 04 : NUMERO DE SERIE
            sCodPro       +  //CAMPO 05 : CODIGO DO PRODUTO
            sQuant        +  //CAMPO 06 : QUANTIDADE
            sValor        +  //CAMPO 07 : VALOR DO PRODUTO
            sBaseCalculo  +  //CAMPO 08 : BASE DE CALCULO
            sSitTrib      +  //CAMPO 09 : SITUACAO TRIBUTARIA
            sValorImposto +  //CAMPO 10 : VALOR DO IMPOSTO
            sBrancos;        //CAMPO 11 : BRANCOS
end;

function Registro_60I(Data, NumSerie, COO, OrdemItem, CodPro,
         Quant, Valor, BaseCalculo, Imposto, SitTrib, IcmsIss, Aliquota : string) : string;
var sData,
    sNumSerie,
    sModelo,
    sCOO,
    sOrdemItem,
    sCodPro,
    sQuant,
    sValor,
    sBase,
    sImposto,
    sBrancos,
    sSitTrib : string;
    dia, mes, ano : word;
begin
   DecodeDate(strtodate(Data), ano, mes, dia);
   sData:= floattostr(ano) + FormataStringD(floattostr(mes), '2', '0') +
           FormataStringD(floattostr(dia), '2', '0');

   sNumSerie   := FormataStringE(NumSerie, '20', ' ');
   sModelo     := '2D';
   sCOO        := FormataStringD(COO, '6', '0');
   sOrdemItem  := FormataStringD(OrdemItem, '3', '0');
   sCodPro     := FormataStringE(CodPro, '14', ' ');
   sQuant      := FormataStringD(EliminaCaracter(Quant), '13', '0');
   sValor      := FormataStringD(EliminaCaracter(Valor), '13', '0');
   sBase       := FormataStringD(EliminaCaracter(BaseCalculo), '12', '0');

   if trim(IcmsIss) = 'S' then
      sSitTrib:= 'ISS '
   else
      begin
         if trim(SitTrib) = 'TRI' then
            sSitTrib:= FormataStringD(EliminaCaracter(Aliquota), '4', '0')
         else
         if trim(SitTrib) = 'ISE' then
            sSitTrib:= 'I   '
         else
         if trim(SitTrib) = 'ST' then
            sSitTrib:= 'F   '
         else
         if trim(SitTrib) = 'NT' then
            sSitTrib:= 'N   '
         else
            showmessage('Verifique Grupo de ICMS do produto: ' + sCodPro);
      end;

   sImposto := FormataStringD(EliminaCaracter(Imposto), '12', '0');
   sBrancos := FormataStringE(' ', '16', ' ');

   result:= '60'       +  // CAMPO 01 : TIPO (60)
            'I'        +  // CAMPO 02 : SUB TIPO
            sData      +  // CAMPO 03 : DATA EMISSAO
            sNumSerie  +  // CAMPO 04 : NUMERO DE SERIE DO EQUIPAMENTO
            sModelo    +  // CAMPO 05 : MODELO DO DOCUMENTO (2D)
            sCOO       +  // CAMPO 06 : COO
            sOrdemItem +  // CAMPO 07 : ORDEM DO ITEM
            sCodPro    +  // CAMPO 08 : CODIGO DO PRODUTO
            sQuant     +  // CAMPO 09 : QUANTIDADE
            sValor     +  // CAMPO 10 : VALOR
            sBase      +  // CAMPO 11 : BASE DE CALCULO
            sSitTrib   +  // CAMPO 12 : SITUACAO TRIBUTARIA
            sImposto   +  // CAMPO 13 : IMPOSTO
            sBrancos;     // CAMPO 14 : BRANCOS
end;

function Registro_60R(Data, CodPro, Quant, Valor, Base, SitTrib, IcmsIss, Aliquota : string) : string;
var sMesAno,
    sCodPro,
    sQuant,
    sValor,
    sBase,
    sSitTrib,
    sBrancos : string;
    dia, mes, ano : word;
begin
   DecodeDate(strtodate(Data), ano, mes, dia);
   sMesAno:= FormataStringD(floattostr(mes), '2', '0') + floattostr(ano);
   sCodPro:= FormataStringE(CodPro, '14', ' ');
   sQuant := FormataStringD(EliminaCaracter(Quant), '13', '0');
   sValor := FormataStringD(EliminaCaracter(Valor), '16', '0');
   sBase  := FormataStringD(EliminaCaracter(Base), '16', '0');

   if trim(IcmsIss) = 'S' then
      sSitTrib:= 'ISS '
   else
      begin
         if trim(SitTrib) = 'TRI' then
            sSitTrib:= FormataStringD(EliminaCaracter(Aliquota), '4', '0')
         else
         if trim(SitTrib) = 'ISE' then
            sSitTrib:= 'I   '
         else
         if trim(SitTrib) = 'ST' then
            sSitTrib:= 'F   '
         else
         if trim(SitTrib) = 'NT' then
            sSitTrib:= 'N   '
         else
            showmessage('Verifique Grupo de ICMS do produto: ' + sCodPro);
      end;
   sBrancos:= FormataStringE(' ', '54', ' ');

   result:= '60'     +  // CAMPO 01 : TIPO (60)
            'R'      +  // CAMPO 02 : SUBTIPO (R)
            sMesAno  +  // CAMPO 03 : MES/ANO
            sCodPro  +  // CAMPO 04 : CODIGO DO PRODUTO
            sQuant   +  // CAMPO 05 : QUANTIDADE
            sValor   +  // CAMPO 06 : VALOR
            sBase    +  // CAMPO 07 : BASE DE CALCULO
            sSitTrib +  // CAMPO 08 : SIT.TRIBUTARIA
            sBrancos;
end;

function Registro_61(Data, Modelo, Serie, SubSerie, NumInicial, NumFinal, ValorTotal,
                     BaseCalculo, ValorICMS, Isentas, Outras, Aliquota : string) : string;
var sBrancos_1,
    sBrancos_2,
    sData,
    sModelo,
    sSerie,
    sSubSerie,
    sNumInicial,
    sNumFinal,
    sValorTotal,
    sBaseCalculo,
    sValorICMS,
    sIsentas,
    sOutras,
    sAliquota,
    sBrancos_3 : string;
    dia, mes, ano : word;
begin
   sBrancos_1:= FormataStringE(' ', '14', ' ');
   sBrancos_2:= FormataStringE(' ', '14', ' ');
   DecodeDate(strtodate(Data), ano, mes, dia);
   sData:= floattostr(ano) + FormataStringD(floattostr(mes), '2', '0') +
           FormataStringD(floattostr(dia), '2', '0');
   sModelo     := FormataStringD(modelo, '2', '0');
   sSerie      := FormataStringE(Serie, '3', ' ');
   sSubSerie   := FormataStringE(SubSerie, '2', ' ');
   sNumInicial := FormataStringD(NumInicial, '6', '0');
   sNumFinal   := FormataStringD(NumFinal, '6', '0');
   sValorTotal := FormataStringD(EliminaCaracter(ValorTotal), '13', '0');
   sBaseCalculo:= FormataStringD(EliminaCaracter(BaseCalculo), '13', '0');
   sValorICMS  := FormataStringD(EliminaCaracter(ValorICMS), '12', '0');
   sIsentas    := FormataStringD(EliminaCaracter(Isentas), '13', '0');
   sOutras     := FormataStringD(EliminaCaracter(Outras), '13', '0');
   sAliquota   := FormataStringD(EliminaCaracter(Aliquota), '4', '0');
   sBrancos_3  := ' ';

   Result:= '61'            +  //CAMPO 01 : TIPO (61)
            sBrancos_1      +  //CAMPO 02 : BRANCOS
            sBrancos_2      +  //CAMPO 03 : BRANCOS
            sData           +  //CAMPO 04 : DATA
            sModelo         +  //CAMPO 05 : MODELO
            sSerie          +  //CAMPO 06 : SERIE
            sSubSerie       +  //CAMPO 07 : SUBSERIE
            sNumInicial     +  //CAMPO 08 : NUMERO INICIAL
            sNumFinal       +  //CAMPO 09 : NUMERO FINAL
            sValorTotal     +  //CAMPO 10 : VALOR TOTAL
            sBaseCalculo    +  //CAMPO 11 : BASE DE CALCULO
            sValorICMS      +  //CAMPO 12 : VALOR DO ICMS
            sIsentas        +  //CAMPO 13 : ISENTA
            sOutras         +  //CAMPO 14 : OUTRAS
            sAliquota       +  //CAMPO 15 : ALIQUOTA
            sBrancos_3;        //CAMPO 16 : BRANCOS
end;

function Registro_61R(Data, CodPro, Quant, ValorBruto, BaseCalculo, Aliquota : string) : string;
var sMesAno,
    sCodPro,
    sQuant,
    sValorBruto,
    sBaseCalculo,
    sAliquota,
    sBrancos : string;
    dia, mes, ano : word;
begin
   DecodeDate(strtodate(Data), ano, mes, dia);
   sMesAno     := FormataStringD(floattostr(mes), '2', '0') + floattostr(ano);
   sCodPro     := FormataStringE(CodPro, '14', ' ');
   sQuant      := FormataStringD(EliminaCaracter(Quant), '13', '0');
   sValorBruto := FormataStringD(EliminaCaracter(ValorBruto), '16', '0');
   sBaseCalculo:= FormataStringD(EliminaCaracter(BaseCalculo), '16', '0');
   sAliquota   := FormataStringD(EliminaCaracter(Aliquota), '4', '0');
   sBrancos    := FormataStringE(' ', '54', ' ');

   Result:= '61'            +  //CAMPO 01 : TIPO (61)
            'R'             +  //CAMPO 02 : RESUMO
            sMesAno         +  //CAMPO 03 : MES E ANO
            sCodPro         +  //CAMPO 04 : CODIGO DO PRODUTO
            sQuant          +  //CAMPO 05 : QUANTIDADE
            sValorBruto     +  //CAMPO 06 : VALOR BRUTO DO PRODUTO
            sBaseCalculo    +  //CAMPO 07 : BASE DE CALCULO DO ICMS
            sAliquota       +  //CAMPO 08 : ALIQUOTA
            sBrancos;          //BRANCOS
end;

function Registro_70(CNPJ, Insc, Data, UF, Modelo, Serie, SubSerie, Numero, CFOP, Total,
                     Base, ICMS, Isenta, Outras, CIFFOB, Situacao : string) : string;
var sCNPJ,
    sInsc,
    sData,
    sUF,
    sModelo,
    sSerie,
    sSubSerie,
    sNumero,
    sCFOP,
    sTotal,
    sBase,
    sICMS,
    sIsenta,
    sOutras,
    sCIFFOB,
    sSituacao : string;
    dia, mes, ano : word;
begin
   DecodeDate(strtodate(Data), ano, mes, dia);
   sData:= floattostr(ano) + FormataStringD(floattostr(mes), '2', '0') +
           FormataStringD(floattostr(dia), '2', '0');

   sCNPJ      := FormataStringD(Eliminacaracter(CNPJ), '14', '0');
   sInsc      := FormataStringE(EliminaCaracter(Insc), '14', ' ');
   sUF        := UF;
   sModelo    := FormataStringD(modelo, '2', '0');
   sSerie     := FormataStringE(Serie, '1', ' ');;
   sSubSerie  := FormataStringE(SubSerie, '2', ' ');
   sNumero    := FormataStringD(Numero, '6', '0');
   sCFOP      := cfop;
   sTotal     := FormataStringD(EliminaCaracter(Total), '13', '0');
   sBase      := FormataStringD(EliminaCaracter(Base), '14', '0');
   sICMS      := FormataStringD(EliminaCaracter(ICMS), '14', '0');
   sIsenta    := FormataStringD(EliminaCaracter(Isenta), '14', '0');
   sOutras    := FormataStringD(EliminaCaracter(Outras), '14', '0');
   sCIFFOB    := CIFFOB;
   sSituacao  := Situacao;

   Result:= '70'            +  //CAMPO 01 : TIPO (70)
            sCNPJ           +  //CAMPO 02 : CNPJ
            sInsc           +  //CAMPO 03 : INSCRICAO
            sData           +  //CAMPO 04 : DATA
            sUF             +  //CAMPO 05 : UF
            sModelo         +  //CAMPO 06 : MODELO
            sSerie          +  //CAMPO 07 : SERIE
            sSubSerie       +  //CAMPO 08 : SUBSERIE
            sNumero         +  //CAMPO 09 : NUMERO
            sCFOP           +  //CAMPO 10 : CFOP
            sTotal          +  //CAMPO 11 : TOTAL
            sBase           +  //CAMPO 12 : BASE
            sICMS           +  //CAMPO 13 : ICMS
            sIsenta         +  //CAMPO 14 : ISENTA
            sOutras         +  //CAMPO 15 : OUTRAS
            sCIFFOB         +  //CAMPO 16 : CIF/FOB
            sSituacao;         //CAMPO 17 : SITUACAO
end;

function Registro_74(Data, CodPro, Quant, Total : string) : string;
var sData,
    sCodPro,
    sQuant,
    sTotal,
    sCodPosse,
    sCNPJ,
    sInsc,
    sUF,
    sBrancos : string;
    dia, mes, ano : word;
begin
   DecodeDate(strtodate(Data), ano, mes, dia);
   sData:= floattostr(ano) + FormataStringD(floattostr(mes), '2', '0') +
           FormataStringD(floattostr(dia), '2', '0');
   sCodPro   := FormataStringE(CodPro, '14', ' ');
   sQuant    := FormataStringD(EliminaCaracter(Quant), '13', '0');
   sTotal    := FormataStringD(EliminaCaracter(Total), '13', '0');
   sCodPosse := '1';
   sCNPJ     := FormataStringE('0', '14', '0');
   sInsc     := FormataStringE(' ', '14', ' ');
   sUF       := '  ';
   sBrancos  := FormataStringE(' ', '45', ' ');

   Result:= '74'      +  //CAMPO 01 : TIPO (74)
            sData     +  //CAMPO 02 : DATA DO INVENTARIO
            sCodPro   +  //CAMPO 03 : CODIGO DO PRODUTO
            sQuant    +  //CAMPO 04 : QUANTIDADE
            sTotal    +  //CAMPO 05 : (QUANT X CUSTO)
            sCodPosse +  //CAMPO 06 : CODIGO DA POSSE DE MERCADORIA
            sCNPJ     +  //CAMPO 07 : CNPJ
            sInsc     +  //CAMPO 08 : INSCRICAO
            sUF       +  //CAMPO 09 : UF
            sBrancos;    //CAMPO 10 : BRANCO
end;

function Registro_75(DataIni, DataFin, CodPro, CodNCM, NomePro, Unidade,
         Aliquota : string) : string;
var sDataIni,
    sDataFin,
    sCodPro,
    sCodNCM,
    sNomePro,
    sUnidade,
    sIPI,
    sAliquota,
    sReducao,
    sBaseST   : string;
    dia, mes, ano : word;

begin
   DecodeDate(strtodate(DataIni), ano, mes, dia);
   sDataIni:= floattostr(ano) + FormataStringD(floattostr(mes), '2', '0') +
              FormataStringD(floattostr(dia), '2', '0');

   DecodeDate(strtodate(DataFin), ano, mes, dia);
   sDataFin:= floattostr(ano) + FormataStringD(floattostr(mes), '2', '0') +
              FormataStringD(floattostr(dia), '2', '0');

   sCodPro   := FormataStringE(CodPro, '14', ' ');
   sCodNCM   := FormataStringE(CodNCM, '8', ' ');
   sNomePro  := FormataStringE(copy(NomePro, 1, 53), '53', ' ');
   sUnidade  := FormataStringE(Unidade, '6', ' ');
   sIPI      := FormataStringD('0', '5', '0');
   sAliquota := FormataStringD(EliminaCaracter(Aliquota), '4', '0');
   sReducao  := FormataStringD('0', '5', '0');
   sBaseST   := FormataStringD('0', '13', '0');
 {   wRegistro75 := TRegistro75.Create;
    wRegistro75.DataInicial := strtodate( dataini );
    wRegistro75.DataFinal := strtodate( datafin );
    wRegistro75.Codigo := trim( sCodpro );
    wRegistro75.NCM := trim( SCodNCM );
    wRegistro75.Descricao := trim( sNomePro );
    wRegistro75.Unidade := trim( sUnidade );
    wRegistro75.AliquotaIpi := 0;
    wRegistro75.AliquotaICMS := strtofloat( Aliquota );
    wRegistro75.Reducao := 0;
    wRegistro75.BaseST := 0;
    frmSintegra.ACBRSintegra.Registros75.Add( wRegistro75 );}

   Result:= '75'      +  //CAMPO 01 : TIPO (75)
            sDataIni  +  //CAMPO 02 : DATA INICIAL
            sDataFin  +  //CAMPO 03 : DATA FINAL
            sCodPro   +  //CAMPO 04 : CODIGO DO PRODUTO
            sCodNCM   +  //CAMPO 05 : NOMENCLATURA COMUM DO MERCOSUL
            sNomePro  +  //CAMPO 06 : DESCRICAO DO PRODUTO
            sUnidade  +  //CAMPO 07 : UNIDADE
            sIPI      +  //CAMPO 08 : ALIQUOTA DO IPI
            sAliquota +  //CAMPO 09 : ALIQUOTA DO ICMS
            sReducao  +  //CAMPO 10 : REDUCAO DA BASE DE CALCULO
            sBaseST;     //CAMPO 11 : BASE SUB.TRIBUTARIA
end;

function Registro_90(CNPJ, Insc, TipoTotal, NumReg90 : string) : string;
var sCNPJ,
    SInsc,
    sTipoTotal,
    sNumReg90,
    sBrancos : string;
    iAux : integer;
begin
   sCNPJ       := FormataStringD(Eliminacaracter(CNPJ), '14', '0');
   SInsc       := FormataStringE(EliminaCaracter(Insc), '14', ' ');
   sTipoTotal  := TipoTotal;
   sNumReg90   := NumReg90;

   iAux:= 125 - 30 - length(sTipoTotal);
   sBrancos:= FormataStringE(' ', inttostr(iAux), ' ');

   result:= '90'        +  // CAMPO 01 : TIPO (90)
            sCNPJ       +  // CAMPO 02 : CNPJ
            SInsc       +  // CAMPO 03 : INSCRICAO ESTADUAL
            sTipoTotal  +  // CAMPO 04/05 : TIPO DE REGISTRA A SER TOTALIZADO
            sBrancos    +
            sNumReg90;
end;

end.
