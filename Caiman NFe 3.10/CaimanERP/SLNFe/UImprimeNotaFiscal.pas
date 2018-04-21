unit UImprimeNotaFiscal;

interface

uses
  Classes, SysUtils, Dialogs, RDprint, Graphics, pcnConversao, ACBrUtil, 
  pcnAuxiliar, pcnNFeW, pcnNFeRTXT, XMLIntf, XMLDoc, UGerenciamentoNFe, 
  UFrmStatusNfe, Forms, StrUtils, Math, pcnConversaoNfe;

procedure ImprimeNotaFiscal(const iCodigoNotaFiscal: integer);
procedure NotaFiscalEletronica(const iCodigoNotaFiscal: integer);
procedure EnviarrCarta(COD, COD_NF: integer);

implementation

uses
  Udm, Ubibli1, UDialog;

procedure ImprimeNotaFiscal(const iCodigoNotaFiscal: integer);
var
  iLinha, iIndice: integer;
  i, j, k, l: integer;
  cQtdNota: currency;
  iAux, iAuxColuna1, iAuxColuna2: integer;
  iAuxString: integer;
  iColunaCFOP: integer;
  sAuxObs: TStringList;
begin
  { Atualiza a Nota Fiscal como Impressa }
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.Consulta do
      begin
        close;
        sql.Clear;
        sql.Add('UPDATE NOTA_FISCAL SET NOTA_IMPRESSA = ' + #39 + 'S' + #39 +
          ' WHERE COD_NF = :CODNF');
        Parambyname('codnf').AsInteger := iCodigoNotaFiscal;
        ExecOrOpen;
      end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      KDialog('Erro ao atualizar a nota fiscal');
    end;
  finally
    dm.Consulta.close;
  end;

  cQtdNota := 1;
  iIndice := strtoint(dm.RetornaStringTabela('indice_nota_fiscal', 'parametros',
    'cod_emp', iEmp));

  iLinha := 0;

  if dm.IBTRAux.Active then
    dm.IBTRAux.Commit;
  dm.IBTRAux.StartTransaction;


  dm.QNF.Parambyname('codnf').AsInteger := iCodigoNotaFiscal;
  dm.QNF.open;

  case iIndice of
    { ************************************************************** }
    { *********************** SUP. BETTIN ************************** }
    { ************************************************************** }
    1:
      begin
        dm.RdPrintNF.Impressora := Epson;
        dm.RdPrintNF.TamanhoQteLinhas := 88;
        dm.RdPrintNF.Abrir;

        { ========================================================================== }
        { ======================== VERIFICA A QTD DE NOTA ========================== }
        { ========================================================================== }
        with dm.QbuscaItensNF do
        begin
          Last;
          if recordCount <= 27 then
            cQtdNota := 1
          else
          begin
            if (recordCount mod 27) = 0 then
              cQtdNota := recordCount / 27
            else
              cQtdNota := int(recordCount / 27) + 1;
          end;
        end;
        for j := 1 to round(cQtdNota) do
        begin
          iLinha := 4;
          { ========================================================================== }
          { ============================= ENTRADA / SAIDA ============================ }
          { ========================================================================== }
          if dm.QNFTIPO_NOTA_FISCAL.AsInteger < 5 then
            dm.RdPrintNF.Imp(iLinha, 90, 'XX')
          else
            dm.RdPrintNF.Imp(iLinha, 110, 'XX');

          { ========================================================================== }
          { ============================= NÚMERO DA NOTA ============================= }
          { ========================================================================== }
          if round(cQtdNota) > 1 then
            dm.RdPrintNF.ImpF(iLinha, 122,
              FormataStringD(dm.QNFNUMERO_NOTA_NF.AsString, '6', '0') + '/' +
              inttostr(j), [expandido, negrito], CLred)
          else
            dm.RdPrintNF.ImpF(iLinha, 122,
              FormataStringD(dm.QNFNUMERO_NOTA_NF.AsString, '6', '0'),
              [expandido, negrito], CLred);

          { ========================================================================== }
          { ======================= NATUREZA DA OPERAÇÃO - CFOP ====================== }
          { ========================================================================== }
          iLinha := 10;

          { busca os cfop }
          if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
          dm.IBTransaction.StartTransaction;
          try
            try
              with dm.QConsulta do
              begin
                close;
                sql.Clear;
                sql.Text := 'SELECT DISTINCT(I.COD_CFO) CFOP, C.NOME_CFO ' +
                  'FROM ITENS_NOTA_FISCAL I   ' + 'INNER JOIN CFOP C          '
                  + 'ON (I.COD_CFO = C.COD_CFO) ' +
                  'WHERE I.COD_NF = :CODNF    ' + 'ORDER BY I.COD_CFO';
                Parambyname('codnf').AsInteger := iCodigoNotaFiscal;
                open;
                dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('nome_cfo').AsString);
                iColunaCFOP := 48;
                while not eof do
                begin
                  if iColunaCFOP = 48 then
                  begin
                    dm.RdPrintNF.Imp(iLinha, iColunaCFOP,
                      fieldbyname('cfop').AsString);
                    iColunaCFOP := iColunaCFOP + 4;
                  end
                  else
                  begin
                    dm.RdPrintNF.Imp(iLinha, iColunaCFOP,
                      '/' + fieldbyname('cfop').AsString);
                    iColunaCFOP := iColunaCFOP + 5;
                  end;
                  next;
                end;
              end;
              dm.IBTransaction.Commit;
            except
              dm.IBTransaction.Rollback;
              KDialog('erro ao buscar os cfops');
            end;
          finally
            dm.QConsulta.close;
          end;

          { ========================================================================== }
          { ========================= DADOS DO CLIENTE/FORNECEDOR ==================== }
          { ========================================================================== }
          if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
          dm.IBTransaction.StartTransaction;
          with dm.QConsulta do
          begin
            close;
            sql.Clear;
            if dm.QNFCOD_CLI.AsInteger > 0 then
            begin
              sql.Add('SELECT * FROM CLIENTE WHERE COD_CLI = :CODCLI');
              Parambyname('codcli').AsInteger := dm.QNFCOD_CLI.AsInteger;
              open;
              iLinha := 14;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('nome_cli').AsString);
              dm.RdPrintNF.Imp(iLinha, 88, fieldbyname('CNPJ_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 125, dm.QNFDATA_EMISSAO_NF.AsString);
              iLinha := 17;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('ENDRES_CLI').AsString +
                ', ' + fieldbyname('NUMRES_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 66, fieldbyname('BAIRES_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 102, fieldbyname('CEPRES_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 125, dm.QNFDATA_SAIDA_NF.AsString);
              iLinha := 20;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('CIDRES_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 52, fieldbyname('TELRES_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 83, fieldbyname('ESTRES_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 88, fieldbyname('INSC_ESTADUAL')
                .AsString);
              dm.RdPrintNF.Imp(iLinha, 125, dm.QNFHORA_SAIDA_NF.AsString);
            end
            else
            begin
              sql.Add('SELECT * FROM FORNECEDOR WHERE COD_FOR = :CODFOR');
              Parambyname('codfor').AsInteger := dm.QNFCOD_FOR.AsInteger;
              open;
              iLinha := 14;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('razao_for').AsString);
              dm.RdPrintNF.Imp(iLinha, 88, fieldbyname('CNPJ_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 125, dm.QNFDATA_EMISSAO_NF.AsString);
              iLinha := 17;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('END_FOR').AsString + ', '
                + fieldbyname('NUM_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 66, fieldbyname('BAI_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 102, fieldbyname('CEP_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 125, dm.QNFDATA_SAIDA_NF.AsString);
              iLinha := 20;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('CID_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 52, fieldbyname('TEL_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 83, fieldbyname('EST_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 88, fieldbyname('INSC_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 125, dm.QNFHORA_SAIDA_NF.AsString);
            end;
          end;
          dm.IBTransaction.Commit;
          dm.QConsulta.close;

          { ========================================================================== }
          { ============================ DADOS DOS PRODUTOS ========================== }
          { ========================================================================== }
          with dm.QbuscaItensNF do
          begin
            if j = 1 then
              first;
            iLinha := 24;
            i := 1;
            while i <= 27 do
            begin
              dm.RdPrintNF.Imp(iLinha, 1, dm.QbuscaItensNFCOD_PRO.AsString);
              dm.RdPrintNF.Imp(iLinha, 9,
                copy(dm.QbuscaItensNFNOME_PRO.AsString, 1, 56));
              dm.RdPrintNF.Imp(iLinha, 67, dm.QbuscaItensNFCOD_CFO.AsString);
              dm.RdPrintNF.Imp(iLinha, 72, dm.QbuscaItensNFCST.AsString);
              dm.RdPrintNF.Imp(iLinha, 77, dm.QbuscaItensNFUNIDADE.AsString);
              dm.RdPrintNF.ImpVal(iLinha, 84, '#,##0.00',
                dm.QbuscaItensNFQUANT.AsCurrency, []);
              dm.RdPrintNF.ImpVal(iLinha, 101, '#,##0.00',
                dm.QbuscaItensNFUNIT.AsCurrency, []);
              dm.RdPrintNF.ImpVal(iLinha, 121, '#,##0.00',
                dm.QBuscaItensNFCALC_TOTAL.AsCurrency, []);
              if dm.QbuscaItensNFALIQ.AsCurrency > 0 then
                dm.RdPrintNF.Imp(iLinha, 132,
                  inttostr(trunc(dm.QbuscaItensNFALIQ.AsCurrency)));
              next;
              Inc(iLinha);
              if eof then
                Break
              else
                Inc(i);
            end;
          end;

          { ========================================================================== }
          { ============================ IMPRIME O DESCONTO ========================== }
          { ========================================================================== }
          if not(j < cQtdNota) then
          begin
            if dm.QNFDESCONTO_NF.AsCurrency > 0 then
            begin
              dm.RdPrintNF.Imp(iLinha, 9, 'Desconto');
              dm.RdPrintNF.ImpVal(iLinha, 121, '#,##0.00',
                dm.QNFDESCONTO_NF.AsCurrency * -1, []);
            end;
          end;

          { ========================================================================== }
          { ============================ CÁLCULO DO IMPOSTO ========================== }
          { ========================================================================== }
          if j < cQtdNota then
          begin
            iLinha := 54;
            dm.RdPrintNF.Imp(iLinha, 11, '*************');
            dm.RdPrintNF.Imp(iLinha, 38, '*************');
            dm.RdPrintNF.Imp(iLinha, 68, '*************');
            dm.RdPrintNF.Imp(iLinha, 95, '*************');
            dm.RdPrintNF.Imp(iLinha, 113, '*************');
            iLinha := 57;
            dm.RdPrintNF.Imp(iLinha, 11, '*************');
            dm.RdPrintNF.Imp(iLinha, 38, '*************');
            dm.RdPrintNF.Imp(iLinha, 68, '*************');
            dm.RdPrintNF.Imp(iLinha, 95, '*************');
            dm.RdPrintNF.Imp(iLinha, 113, '*************');
          end
          else
          begin
            iLinha := 54;
            dm.RdPrintNF.ImpVal(iLinha, 11, '#,###,##0.00',
              dm.QNFBASE_CALCULO_ICMS_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 38, '#,###,##0.00',
              dm.QNFVALOR_ICMS_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 68, '#,###,##0.00',
              dm.QNFBASE_SUBST_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 95, '#,###,##0.00',
              dm.QNFVALOR_SUBST_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 114, '#,###,##0.00',
              dm.QNFVALOR_TOTAL_PROD_NF.AsCurrency, [normal, negrito]);

            iLinha := 57;
            dm.RdPrintNF.ImpVal(iLinha, 11, '#,###,##0.00',
              dm.QNFVALOR_FRETE_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 38, '#,###,##0.00',
              dm.QNFVALOR_SEGURO_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 68, '#,###,##0.00',
              dm.QNFOUTRAS_DESPESAS_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 95, '#,###,##0.00',
              dm.QNFVALOR_IPI_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 114, '#,###,##0.00',
              dm.QNFVALOR_TOTAL_NF.AsCurrency, [normal, negrito]);
          end;

          { ========================================================================== }
          { ============================== TRANSPORTADORA ============================ }
          { ========================================================================== }
          iLinha := 61;
          if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
          dm.IBTransaction.StartTransaction;
          with dm.QConsulta do
          begin
            close;
            sql.Clear;
            sql.Add('SELECT * FROM TRANSPORTADORA WHERE COD_TRA = :CODTRA');
            Parambyname('codtra').AsInteger := dm.QNFCOD_TRA.AsInteger;
            open;
            if recordCount > 0 then
            begin
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('nome_tra').AsString);
              dm.RdPrintNF.Imp(iLinha, 79, dm.QNFFRETE_CONTA_NF.AsString);
              dm.RdPrintNF.Imp(iLinha, 84, fieldbyname('placa_tra').AsString);
              dm.RdPrintNF.Imp(iLinha, 105, fieldbyname('uf_placa_tra')
                .AsString);
              dm.RdPrintNF.Imp(iLinha, 111, fieldbyname('cnpj_tra').AsString);

              iLinha := 64;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('end_tra').AsString);
              dm.RdPrintNF.Imp(iLinha, 69, fieldbyname('cid_tra').AsString);
              dm.RdPrintNF.Imp(iLinha, 105, fieldbyname('est_tra').AsString);
              dm.RdPrintNF.Imp(iLinha, 111, fieldbyname('insc_tra').AsString);
            end;
          end;
          dm.IBTransaction.Commit;
          dm.QConsulta.close;

          { ========================================================================== }
          { ================================ VOLUME ================================== }
          { ========================================================================== }
          iLinha := 67;
          if dm.QNFQUANTIDADE_NF.AsInteger > 0 then
            dm.RdPrintNF.Imp(iLinha, 1, dm.QNFQUANTIDADE_NF.AsString);

          dm.RdPrintNF.Imp(iLinha, 18, dm.QNFESPECIE_NF.AsString);
          dm.RdPrintNF.Imp(iLinha, 45, dm.QNFMARCA_NF.AsString);
          dm.RdPrintNF.Imp(iLinha, 68, dm.QNFNUMERO_NF.AsString);
          if dm.QNFPESO_BRUTO_NF.AsCurrency > 0 then
            dm.RdPrintNF.Imp(iLinha, 95,
              currtostrf(dm.QNFPESO_BRUTO_NF.AsCurrency, ffnumber, 2));
          if dm.QNFPESO_LIQUIDO_NF.AsCurrency > 0 then
            dm.RdPrintNF.Imp(iLinha, 117,
              currtostrf(dm.QNFPESO_LIQUIDO_NF.AsCurrency, ffnumber, 2));

          { ========================================================================== }
          { ================================ OBSERVAÇÃO ============================== }
          { ========================================================================== }
          if not(j < cQtdNota) then
          begin
            iLinha := 71;
            sAuxObs := TStringList.Create;
            sAuxObs.Text := dm.QNFINF_COMPL_NF.AsString;

            for i := 0 to sAuxObs.Count - 1 do
            begin
              dm.RdPrintNF.Imp(iLinha, 1, sAuxObs[i]);
              Inc(iLinha);
            end;
            FreeAndNil(sAuxObs);
          end;

          { ========================================================================== }
          { ============================= NÚMERO DA NOTA ============================= }
          { ========================================================================== }
          iLinha := 83;
          if cQtdNota > 1 then
            dm.RdPrintNF.ImpF(iLinha, 119,
              FormataStringD(dm.QNFNUMERO_NOTA_NF.AsString, '6', '0') + '/' +
              inttostr(j), [expandido, negrito], CLred)
          else
            dm.RdPrintNF.ImpF(iLinha, 119,
              FormataStringD(dm.QNFNUMERO_NOTA_NF.AsString, '6', '0'),
              [expandido, negrito], CLred);
          dm.RdPrintNF.Novapagina;
        end;

        { ========================================================================== }
        { =========================== FINALIZA IMPRESSORA  ========================= }
        { ========================================================================== }
        dm.RdPrintNF.Fechar;
      end;

    { ************************************************************** }
    { ******************** PANIFICADORA GASPARINI ****************** }
    { ************************************************************** }
    2:
      begin
        dm.RdPrintNF.Impressora := Epson;
        dm.RdPrintNF.TamanhoQteLinhas := 88;
        dm.RdPrintNF.Abrir;

        { ========================================================================== }
        { ======================== VERIFICA A QTD DE NOTA ========================== }
        { ========================================================================== }
        with dm.QbuscaItensNF do
        begin
          Last;
          if recordCount <= 23 then
            cQtdNota := 1
          else
          begin
            if (recordCount mod 23) = 0 then
              cQtdNota := recordCount / 23
            else
              cQtdNota := int(recordCount / 23) + 1;
          end;
        end;
        for j := 1 to round(cQtdNota) do
        begin
          iLinha := 3;
          { ========================================================================== }
          { ============================= ENTRADA / SAIDA ============================ }
          { ========================================================================== }
          if dm.QNFTIPO_NOTA_FISCAL.AsInteger < 5 then
            dm.RdPrintNF.Imp(iLinha, 85, 'XX')
          else
            dm.RdPrintNF.Imp(iLinha, 104, 'XX');

          { ========================================================================== }
          { ============================= NÚMERO DA NOTA ============================= }
          { ========================================================================== }
          if round(cQtdNota) > 1 then
            dm.RdPrintNF.ImpF(iLinha, 122,
              FormataStringD(dm.QNFNUMERO_NOTA_NF.AsString, '6', '0') + '/' +
              inttostr(j), [expandido, negrito], CLred)
          else
            dm.RdPrintNF.ImpF(iLinha, 122,
              FormataStringD(dm.QNFNUMERO_NOTA_NF.AsString, '6', '0'),
              [expandido, negrito], CLred);

          { ========================================================================== }
          { ======================= NATUREZA DA OPERAÇÃO - CFOP ====================== }
          { ========================================================================== }
          iLinha := 10;

          { busca os cfop }
          if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
          dm.IBTransaction.StartTransaction;
          try
            try
              with dm.QConsulta do
              begin
                close;
                sql.Clear;
                sql.Text := 'SELECT DISTINCT(I.COD_CFO) CFOP, C.NOME_CFO ' +
                  'FROM ITENS_NOTA_FISCAL I   ' + 'INNER JOIN CFOP C          '
                  + 'ON (I.COD_CFO = C.COD_CFO) ' +
                  'WHERE I.COD_NF = :CODNF    ' + 'ORDER BY I.COD_CFO';
                Parambyname('codnf').AsInteger := iCodigoNotaFiscal;
                open;
                dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('nome_cfo').AsString);
                iColunaCFOP := 42;
                while not eof do
                begin
                  if iColunaCFOP = 42 then
                  begin
                    dm.RdPrintNF.Imp(iLinha, iColunaCFOP,
                      fieldbyname('cfop').AsString);
                    iColunaCFOP := iColunaCFOP + 4;
                  end
                  else
                  begin
                    dm.RdPrintNF.Imp(iLinha, iColunaCFOP,
                      '/' + fieldbyname('cfop').AsString);
                    iColunaCFOP := iColunaCFOP + 5;
                  end;
                  next;
                end;
              end;
              dm.IBTransaction.Commit;
            except
              dm.IBTransaction.Rollback;
              KDialog('erro ao buscar os cfops');
            end;
          finally
            dm.QConsulta.close;
          end;

          { ========================================================================== }
          { ========================= DADOS DO CLIENTE/FORNECEDOR ==================== }
          { ========================================================================== }
          if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
          dm.IBTransaction.StartTransaction;
          with dm.QConsulta do
          begin
            close;
            sql.Clear;
            if dm.QNFCOD_CLI.AsInteger > 0 then
            begin
              sql.Add('SELECT * FROM CLIENTE WHERE COD_CLI = :CODCLI');
              Parambyname('codcli').AsInteger := dm.QNFCOD_CLI.AsInteger;
              open;
              iLinha := 14;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('NOME_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 86, fieldbyname('CNPJ_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 123, dm.QNFDATA_EMISSAO_NF.AsString);
              iLinha := 16;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('ENDRES_CLI').AsString +
                ', ' + fieldbyname('NUMRES_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 64, fieldbyname('BAIRES_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 99, fieldbyname('CEPRES_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 123, dm.QNFDATA_SAIDA_NF.AsString);
              iLinha := 19;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('CIDRES_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 55, fieldbyname('TELRES_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 79, fieldbyname('ESTRES_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 87, fieldbyname('INSC_ESTADUAL')
                .AsString);
              dm.RdPrintNF.Imp(iLinha, 123, dm.QNFHORA_SAIDA_NF.AsString);
            end
            else
            begin
              sql.Add('SELECT * FROM FORNECEDOR WHERE COD_FOR = :CODFOR');
              Parambyname('codfor').AsInteger := dm.QNFCOD_FOR.AsInteger;
              open;
              iLinha := 14;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('RAZAO_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 86, fieldbyname('CNPJ_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 123, dm.QNFDATA_EMISSAO_NF.AsString);
              iLinha := 16;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('END_FOR').AsString + ', '
                + fieldbyname('NUM_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 64, fieldbyname('BAI_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 99, fieldbyname('CEP_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 123, dm.QNFDATA_SAIDA_NF.AsString);
              iLinha := 19;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('CID_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 55, fieldbyname('TEL_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 79, fieldbyname('EST_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 87, fieldbyname('INSC_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 123, dm.QNFHORA_SAIDA_NF.AsString);
            end;
          end;
          dm.IBTransaction.Commit;
          dm.QConsulta.close;

          { ========================================================================== }
          { ============================ DADOS DOS PRODUTOS ========================== }
          { ========================================================================== }
          with dm.QbuscaItensNF do
          begin
            if j = 1 then
              first;
            iLinha := 28;
            i := 1;
            while i <= 23 do
            begin
              dm.RdPrintNF.Imp(iLinha, 2, dm.QbuscaItensNFCOD_PRO.AsString);
              dm.RdPrintNF.Imp(iLinha, 16,
                copy(dm.QbuscaItensNFNOME_PRO.AsString, 1, 45));
              dm.RdPrintNF.Imp(iLinha, 63, dm.QbuscaItensNFCOD_CFO.AsString);
              dm.RdPrintNF.Imp(iLinha, 71,
                dm.QbuscaItensNFCLASSIFICACAO_FISCAL.AsString);
              dm.RdPrintNF.Imp(iLinha, 76, dm.QbuscaItensNFCST.AsString);
              dm.RdPrintNF.Imp(iLinha, 81, dm.QbuscaItensNFUNIDADE.AsString);
              dm.RdPrintNF.ImpVal(iLinha, 88, '##0.00',
                dm.QbuscaItensNFQUANT.AsCurrency, []);
              dm.RdPrintNF.ImpVal(iLinha, 96, '#,##0.00',
                dm.QbuscaItensNFUNIT.AsCurrency, []);
              dm.RdPrintNF.ImpVal(iLinha, 121, '#,##0.00',
                dm.QBuscaItensNFCALC_TOTAL.AsCurrency, []);
              if dm.QbuscaItensNFALIQ.AsCurrency > 0 then
                dm.RdPrintNF.Imp(iLinha, 133,
                  inttostr(trunc(dm.QbuscaItensNFALIQ.AsCurrency)));
              if dm.QbuscaItensNFALIQ_IPI.AsCurrency > 0 then
                dm.RdPrintNF.Imp(iLinha, 136,
                  inttostr(trunc(dm.QbuscaItensNFALIQ_IPI.AsCurrency)));
              next;
              Inc(iLinha);
              if eof then
                Break
              else
                Inc(i);
            end;
          end;

          { ========================================================================== }
          { ============================ IMPRIME O DESCONTO ========================== }
          { ========================================================================== }
          if not(j < cQtdNota) then
          begin
            if dm.QNFDESCONTO_NF.AsCurrency > 0 then
            begin
              dm.RdPrintNF.Imp(iLinha, 15, 'Desconto');
              dm.RdPrintNF.ImpVal(iLinha, 118, '#,##0.00',
                dm.QNFDESCONTO_NF.AsCurrency * -1, []);
            end;
          end;

          { ========================================================================== }
          { ============================ CÁLCULO DO IMPOSTO ========================== }
          { ========================================================================== }
          if j < cQtdNota then
          begin
            iLinha := 54;
            dm.RdPrintNF.Imp(iLinha, 11, '*************');
            dm.RdPrintNF.Imp(iLinha, 38, '*************');
            dm.RdPrintNF.Imp(iLinha, 68, '*************');
            dm.RdPrintNF.Imp(iLinha, 95, '*************');
            dm.RdPrintNF.Imp(iLinha, 113, '*************');
            iLinha := 57;
            dm.RdPrintNF.Imp(iLinha, 11, '*************');
            dm.RdPrintNF.Imp(iLinha, 38, '*************');
            dm.RdPrintNF.Imp(iLinha, 68, '*************');
            dm.RdPrintNF.Imp(iLinha, 95, '*************');
            dm.RdPrintNF.Imp(iLinha, 113, '*************');
          end
          else
          begin
            iLinha := 54;
            if iTipoEmp = 0 then
            begin
              dm.RdPrintNF.Imp(iLinha, 11, 'XXXXXXXX');
              dm.RdPrintNF.Imp(iLinha, 38, 'XXXXXXXX');
            end
            else
            begin
              dm.RdPrintNF.ImpVal(iLinha, 11, '#,###,##0.00',
                dm.QNFBASE_CALCULO_ICMS_NF.AsCurrency, [comp17, negrito]);
              dm.RdPrintNF.ImpVal(iLinha, 38, '#,###,##0.00',
                dm.QNFVALOR_ICMS_NF.AsCurrency, [comp17, negrito]);
            end;
            dm.RdPrintNF.ImpVal(iLinha, 68, '#,###,##0.00',
              dm.QNFBASE_SUBST_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 95, '#,###,##0.00',
              dm.QNFVALOR_SUBST_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 114, '#,###,##0.00',
              dm.QNFVALOR_TOTAL_PROD_NF.AsCurrency, [normal, negrito]);

            iLinha := 57;
            dm.RdPrintNF.ImpVal(iLinha, 11, '#,###,##0.00',
              dm.QNFVALOR_FRETE_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 38, '#,###,##0.00',
              dm.QNFVALOR_SEGURO_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 68, '#,###,##0.00',
              dm.QNFOUTRAS_DESPESAS_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 95, '#,###,##0.00',
              dm.QNFVALOR_IPI_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 114, '#,###,##0.00',
              dm.QNFVALOR_TOTAL_NF.AsCurrency, [normal, negrito]);
          end;

          { ========================================================================== }
          { ============================== TRANSPORTADORA ============================ }
          { ========================================================================== }
          iLinha := 61;
          if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
          dm.IBTransaction.StartTransaction;
          with dm.QConsulta do
          begin
            close;
            sql.Clear;
            sql.Add('SELECT * FROM TRANSPORTADORA WHERE COD_TRA = :CODTRA');
            Parambyname('codtra').AsInteger := dm.QNFCOD_TRA.AsInteger;
            open;
            if recordCount > 0 then
            begin
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('nome_tra').AsString);
              dm.RdPrintNF.Imp(iLinha, 76, dm.QNFFRETE_CONTA_NF.AsString);
              dm.RdPrintNF.Imp(iLinha, 82, fieldbyname('placa_tra').AsString);
              dm.RdPrintNF.Imp(iLinha, 100, fieldbyname('uf_placa_tra')
                .AsString);
              dm.RdPrintNF.Imp(iLinha, 107, fieldbyname('cnpj_tra').AsString);

              iLinha := 64;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('end_tra').AsString);
              dm.RdPrintNF.Imp(iLinha, 63, fieldbyname('cid_tra').AsString);
              dm.RdPrintNF.Imp(iLinha, 100, fieldbyname('est_tra').AsString);
              dm.RdPrintNF.Imp(iLinha, 107, fieldbyname('insc_tra').AsString);
            end;
          end;
          dm.IBTransaction.Commit;
          dm.QConsulta.close;

          { ========================================================================== }
          { ================================ VOLUME ================================== }
          { ========================================================================== }
          iLinha := 66;
          if dm.QNFQUANTIDADE_NF.AsInteger > 0 then
            dm.RdPrintNF.Imp(iLinha, 1, dm.QNFQUANTIDADE_NF.AsString);
          dm.RdPrintNF.Imp(iLinha, 24, dm.QNFESPECIE_NF.AsString);
          dm.RdPrintNF.Imp(iLinha, 46, dm.QNFMARCA_NF.AsString);
          dm.RdPrintNF.Imp(iLinha, 68, dm.QNFNUMERO_NF.AsString);
          if dm.QNFPESO_BRUTO_NF.AsCurrency > 0 then
            dm.RdPrintNF.Imp(iLinha, 91,
              currtostrf(dm.QNFPESO_BRUTO_NF.AsCurrency, ffnumber, 2));
          if dm.QNFPESO_LIQUIDO_NF.AsCurrency > 0 then
            dm.RdPrintNF.Imp(iLinha, 113,
              currtostrf(dm.QNFPESO_LIQUIDO_NF.AsCurrency, ffnumber, 2));

          { ========================================================================== }
          { ================================ OBSERVAÇÃO ============================== }
          { ========================================================================== }
          if not(j < cQtdNota) then
          begin
            iLinha := 72;
            sAuxObs := TStringList.Create;
            sAuxObs.Text := dm.QNFINF_COMPL_NF.AsString;

            for i := 0 to sAuxObs.Count - 1 do
            begin
              dm.RdPrintNF.Imp(iLinha, 1, sAuxObs[i]);
              Inc(iLinha);
            end;
            FreeAndNil(sAuxObs);
          end;

          { ========================================================================== }
          { ============================= NÚMERO DA NOTA ============================= }
          { ========================================================================== }
          iLinha := 84;
          if cQtdNota > 1 then
            dm.RdPrintNF.ImpF(iLinha, 120,
              FormataStringD(dm.QNFNUMERO_NOTA_NF.AsString, '6', '0') + '/' +
              inttostr(j), [expandido, negrito], CLred)
          else
            dm.RdPrintNF.ImpF(iLinha, 120,
              FormataStringD(dm.QNFNUMERO_NOTA_NF.AsString, '6', '0'),
              [expandido, negrito], CLred);
          dm.RdPrintNF.Novapagina;
        end;

        { ========================================================================== }
        { =========================== FINALIZA IMPRESSORA  ========================= }
        { ========================================================================== }
        dm.RdPrintNF.Fechar;
      end;

    { ************************************************************** }
    { *********************** COMERCIAL NEGRIS ********************* }
    { ************************************************************** }
    3:
      begin
        dm.RdPrintNF.Impressora := Epson;
        dm.RdPrintNF.TamanhoQteLinhas := 88;
        dm.RdPrintNF.Abrir;

        { ========================================================================== }
        { ======================== VERIFICA A QTD DE NOTA ========================== }
        { ========================================================================== }
        with dm.QbuscaItensNF do
        begin
          Last;
          if recordCount <= 21 then
            cQtdNota := 1
          else
          begin
            if (recordCount mod 21) = 0 then
              cQtdNota := recordCount / 21
            else
              cQtdNota := int(recordCount / 21) + 1;
          end;
        end;
        for j := 1 to round(cQtdNota) do
        begin
          iLinha := 3;
          { ========================================================================== }
          { ============================= ENTRADA / SAIDA ============================ }
          { ========================================================================== }
          if dm.QNFTIPO_NOTA_FISCAL.AsInteger < 5 then
            dm.RdPrintNF.Imp(iLinha, 88, 'XX')
          else
            dm.RdPrintNF.Imp(iLinha, 108, 'XX');

          { ========================================================================== }
          { ============================= NÚMERO DA NOTA ============================= }
          { ========================================================================== }
          if round(cQtdNota) > 1 then
            dm.RdPrintNF.ImpF(iLinha, 122,
              FormataStringD(dm.QNFNUMERO_NOTA_NF.AsString, '6', '0') + '/' +
              inttostr(j), [expandido, negrito], CLred)
          else
            dm.RdPrintNF.ImpF(iLinha, 122,
              FormataStringD(dm.QNFNUMERO_NOTA_NF.AsString, '6', '0'),
              [expandido, negrito], CLred);

          { ========================================================================== }
          { ======================= NATUREZA DA OPERAÇÃO - CFOP ====================== }
          { ========================================================================== }
          iLinha := 10;

          { busca os cfop }
          if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
          dm.IBTransaction.StartTransaction;
          try
            try
              with dm.QConsulta do
              begin
                close;
                sql.Clear;
                sql.Text := 'SELECT DISTINCT(I.COD_CFO) CFOP, C.NOME_CFO ' +
                  'FROM ITENS_NOTA_FISCAL I   ' + 'INNER JOIN CFOP C          '
                  + 'ON (I.COD_CFO = C.COD_CFO) ' +
                  'WHERE I.COD_NF = :CODNF    ' + 'ORDER BY I.COD_CFO';
                Parambyname('codnf').AsInteger := iCodigoNotaFiscal;
                open;
                dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('nome_cfo').AsString);
                iColunaCFOP := 48;
                while not eof do
                begin
                  if iColunaCFOP = 48 then
                  begin
                    dm.RdPrintNF.Imp(iLinha, iColunaCFOP,
                      fieldbyname('cfop').AsString);
                    iColunaCFOP := iColunaCFOP + 4;
                  end
                  else
                  begin
                    dm.RdPrintNF.Imp(iLinha, iColunaCFOP,
                      '/' + fieldbyname('cfop').AsString);
                    iColunaCFOP := iColunaCFOP + 5;
                  end;
                  next;
                end;
              end;
              dm.IBTransaction.Commit;
            except
              dm.IBTransaction.Rollback;
              KDialog('erro ao buscar os cfops');
            end;
          finally
            dm.QConsulta.close;
          end;

          { ========================================================================== }
          { ========================= DADOS DO CLIENTE/FORNECEDOR ==================== }
          { ========================================================================== }
          if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
          dm.IBTransaction.StartTransaction;
          with dm.QConsulta do
          begin
            close;
            sql.Clear;
            if dm.QNFCOD_CLI.AsInteger > 0 then
            begin
              sql.Add('SELECT * FROM CLIENTE WHERE COD_CLI = :CODCLI');
              Parambyname('codcli').AsInteger := dm.QNFCOD_CLI.AsInteger;
              open;
              iLinha := 14;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('NOME_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 88, fieldbyname('CNPJ_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 125, dm.QNFDATA_EMISSAO_NF.AsString);
              iLinha := 17;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('ENDRES_CLI').AsString +
                ', ' + fieldbyname('NUMRES_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 64, fieldbyname('BAIRES_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 98, fieldbyname('CEPRES_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 125, dm.QNFDATA_SAIDA_NF.AsString);
              iLinha := 20;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('CIDRES_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 52, fieldbyname('TELRES_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 81, fieldbyname('ESTRES_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 88, fieldbyname('INSC_ESTADUAL')
                .AsString);
              dm.RdPrintNF.Imp(iLinha, 125, dm.QNFHORA_SAIDA_NF.AsString);
            end
            else
            begin
              sql.Add('SELECT * FROM FORNECEDOR WHERE COD_FOR = :CODFOR');
              Parambyname('codfor').AsInteger := dm.QNFCOD_FOR.AsInteger;
              open;
              iLinha := 14;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('RAZAO_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 88, fieldbyname('CNPJ_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 125, dm.QNFDATA_EMISSAO_NF.AsString);
              iLinha := 17;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('END_FOR').AsString + ', '
                + fieldbyname('NUM_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 64, fieldbyname('BAI_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 98, fieldbyname('CEP_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 125, dm.QNFDATA_SAIDA_NF.AsString);
              iLinha := 20;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('CID_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 52, fieldbyname('TEL_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 81, fieldbyname('EST_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 88, fieldbyname('INSC_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 125, dm.QNFHORA_SAIDA_NF.AsString);
            end;
          end;
          dm.IBTransaction.Commit;
          dm.QConsulta.close;

          { ========================================================================== }
          { ============================ DADOS DOS PRODUTOS ========================== }
          { ========================================================================== }
          with dm.QbuscaItensNF do
          begin
            if j = 1 then
              first;
            iLinha := 29;
            i := 1;
            while i <= 21 do
            begin
              dm.RdPrintNF.Imp(iLinha, 1, dm.QbuscaItensNFCOD_PRO.AsString);
              dm.RdPrintNF.Imp(iLinha, 9,
                copy(dm.QbuscaItensNFNOME_PRO.AsString, 1, 54));
              // dm.RdPrintNF.Imp(iLinha, 67, dm.QbuscaItensNFCOD_CFO.AsString);
              dm.RdPrintNF.Imp(iLinha, 74, dm.QbuscaItensNFCST.AsString);
              dm.RdPrintNF.Imp(iLinha, 80, dm.QbuscaItensNFUNIDADE.AsString);
              dm.RdPrintNF.ImpVal(iLinha, 85, '#,##0.00',
                dm.QbuscaItensNFQUANT.AsCurrency, []);
              dm.RdPrintNF.ImpVal(iLinha, 99, '#,##0.00',
                dm.QbuscaItensNFUNIT.AsCurrency, []);
              dm.RdPrintNF.ImpVal(iLinha, 114, '#,##0.00',
                dm.QBuscaItensNFCALC_TOTAL.AsCurrency, []);
              if dm.QbuscaItensNFALIQ.AsCurrency > 0 then
                dm.RdPrintNF.Imp(iLinha, 124,
                  inttostr(trunc(dm.QbuscaItensNFALIQ.AsCurrency)));
              next;
              Inc(iLinha);
              if eof then
                Break
              else
                Inc(i);
            end;
          end;

          { ========================================================================== }
          { ============================ IMPRIME O DESCONTO ========================== }
          { ========================================================================== }
          if not(j < cQtdNota) then
          begin
            if dm.QNFDESCONTO_NF.AsCurrency > 0 then
            begin
              dm.RdPrintNF.Imp(iLinha, 9, 'Desconto');
              dm.RdPrintNF.ImpVal(iLinha, 114, '#,##0.00',
                dm.QNFDESCONTO_NF.AsCurrency * -1, []);
            end;
          end;

          { ========================================================================== }
          { ============================ CÁLCULO DO IMPOSTO ========================== }
          { ========================================================================== }
          if j < cQtdNota then
          begin
            iLinha := 53;
            dm.RdPrintNF.Imp(iLinha, 11, '*************');
            dm.RdPrintNF.Imp(iLinha, 41, '*************');
            dm.RdPrintNF.Imp(iLinha, 68, '*************');
            dm.RdPrintNF.Imp(iLinha, 95, '*************');
            dm.RdPrintNF.Imp(iLinha, 113, '*************');
            iLinha := 56;
            dm.RdPrintNF.Imp(iLinha, 11, '*************');
            dm.RdPrintNF.Imp(iLinha, 41, '*************');
            dm.RdPrintNF.Imp(iLinha, 68, '*************');
            dm.RdPrintNF.Imp(iLinha, 95, '*************');
            dm.RdPrintNF.Imp(iLinha, 113, '*************');
          end
          else
          begin
            iLinha := 53;
            dm.RdPrintNF.ImpVal(iLinha, 11, '#,###,##0.00',
              dm.QNFBASE_CALCULO_ICMS_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 41, '#,###,##0.00',
              dm.QNFVALOR_ICMS_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 68, '#,###,##0.00',
              dm.QNFBASE_SUBST_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 95, '#,###,##0.00',
              dm.QNFVALOR_SUBST_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 114, '#,###,##0.00',
              dm.QNFVALOR_TOTAL_PROD_NF.AsCurrency, [normal, negrito]);

            iLinha := 56;
            dm.RdPrintNF.ImpVal(iLinha, 11, '#,###,##0.00',
              dm.QNFVALOR_FRETE_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 41, '#,###,##0.00',
              dm.QNFVALOR_SEGURO_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 68, '#,###,##0.00',
              dm.QNFOUTRAS_DESPESAS_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 95, '#,###,##0.00',
              dm.QNFVALOR_IPI_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 114, '#,###,##0.00',
              dm.QNFVALOR_TOTAL_NF.AsCurrency, [normal, negrito]);
          end;

          { ========================================================================== }
          { ============================== TRANSPORTADORA ============================ }
          { ========================================================================== }
          iLinha := 60;
          if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
          dm.IBTransaction.StartTransaction;
          with dm.QConsulta do
          begin
            close;
            sql.Clear;
            sql.Add('SELECT * FROM TRANSPORTADORA WHERE COD_TRA = :CODTRA');
            Parambyname('codtra').AsInteger := dm.QNFCOD_TRA.AsInteger;
            open;
            if recordCount > 0 then
            begin
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('nome_tra').AsString);
              dm.RdPrintNF.Imp(iLinha, 72, dm.QNFFRETE_CONTA_NF.AsString);
              dm.RdPrintNF.Imp(iLinha, 80, fieldbyname('placa_tra').AsString);
              dm.RdPrintNF.Imp(iLinha, 101, fieldbyname('uf_placa_tra')
                .AsString);
              dm.RdPrintNF.Imp(iLinha, 111, fieldbyname('cnpj_tra').AsString);

              iLinha := 63;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('end_tra').AsString);
              dm.RdPrintNF.Imp(iLinha, 64, fieldbyname('cid_tra').AsString);
              dm.RdPrintNF.Imp(iLinha, 100, fieldbyname('est_tra').AsString);
              dm.RdPrintNF.Imp(iLinha, 110, fieldbyname('insc_tra').AsString);
            end;
          end;
          dm.IBTransaction.Commit;
          dm.QConsulta.close;

          { ========================================================================== }
          { ================================ VOLUME ================================== }
          { ========================================================================== }
          iLinha := 66;
          if dm.QNFQUANTIDADE_NF.AsInteger > 0 then
            dm.RdPrintNF.Imp(iLinha, 1, dm.QNFQUANTIDADE_NF.AsString);
          dm.RdPrintNF.Imp(iLinha, 18, dm.QNFESPECIE_NF.AsString);
          dm.RdPrintNF.Imp(iLinha, 72, dm.QNFMARCA_NF.AsString);
          dm.RdPrintNF.Imp(iLinha, 89, dm.QNFNUMERO_NF.AsString);
          if dm.QNFPESO_BRUTO_NF.AsCurrency > 0 then
            dm.RdPrintNF.Imp(iLinha, 100,
              currtostrf(dm.QNFPESO_BRUTO_NF.AsCurrency, ffnumber, 2));
          if dm.QNFPESO_LIQUIDO_NF.AsCurrency > 0 then
            dm.RdPrintNF.Imp(iLinha, 120,
              currtostrf(dm.QNFPESO_LIQUIDO_NF.AsCurrency, ffnumber, 2));

          { ========================================================================== }
          { ================================ OBSERVAÇÃO ============================== }
          { ========================================================================== }
          if not(j < cQtdNota) then
          begin
            iLinha := 71;
            sAuxObs := TStringList.Create;
            sAuxObs.Text := dm.QNFINF_COMPL_NF.AsString;

            for i := 0 to sAuxObs.Count - 1 do
            begin
              dm.RdPrintNF.Imp(iLinha, 1, sAuxObs[i]);
              Inc(iLinha);
            end;
            FreeAndNil(sAuxObs);
          end;

          { ========================================================================== }
          { ============================= NÚMERO DA NOTA ============================= }
          { ========================================================================== }
          iLinha := 83;
          if cQtdNota > 1 then
            dm.RdPrintNF.ImpF(iLinha, 119,
              FormataStringD(dm.QNFNUMERO_NOTA_NF.AsString, '6', '0') + '/' +
              inttostr(j), [expandido, negrito], CLred)
          else
            dm.RdPrintNF.ImpF(iLinha, 119,
              FormataStringD(dm.QNFNUMERO_NOTA_NF.AsString, '6', '0'),
              [expandido, negrito], CLred);
          dm.RdPrintNF.Novapagina;
        end;

        { ========================================================================== }
        { =========================== FINALIZA IMPRESSORA  ========================= }
        { ========================================================================== }
        dm.RdPrintNF.Fechar;
      end;

    { ************************************************************** }
    { **************************** ALEMPEQ ************************* }
    { ************************************************************** }
    4:
      begin
        dm.RdPrintNF.Impressora := Epson;
        dm.RdPrintNF.TamanhoQteLinhas := 88;
        dm.RdPrintNF.Abrir;

        { ========================================================================== }
        { ======================== VERIFICA A QTD DE NOTA ========================== }
        { ========================================================================== }
        with dm.QbuscaItensNF do
        begin
          Last;
          if recordCount <= 24 then
            cQtdNota := 1
          else
          begin
            if (recordCount mod 24) = 0 then
              cQtdNota := recordCount / 24
            else
              cQtdNota := int(recordCount / 24) + 1;
          end;
        end;
        for j := 1 to round(cQtdNota) do
        begin
          iLinha := 3;
          { ========================================================================== }
          { ============================= ENTRADA / SAIDA ============================ }
          { ========================================================================== }
          if dm.QNFTIPO_NOTA_FISCAL.AsInteger < 5 then
            dm.RdPrintNF.Imp(iLinha, 83, 'XX')
          else
            dm.RdPrintNF.Imp(iLinha, 100, 'XX');

          { ========================================================================== }
          { ============================= NÚMERO DA NOTA ============================= }
          { ========================================================================== }
          if round(cQtdNota) > 1 then
            dm.RdPrintNF.ImpF(iLinha, 121,
              FormataStringD(dm.QNFNUMERO_NOTA_NF.AsString, '6', '0') + '/' +
              inttostr(j), [expandido, negrito], CLred)
          else
            dm.RdPrintNF.ImpF(iLinha, 122,
              FormataStringD(dm.QNFNUMERO_NOTA_NF.AsString, '6', '0'),
              [expandido, negrito], CLred);

          { ========================================================================== }
          { ======================= NATUREZA DA OPERAÇÃO - CFOP ====================== }
          { ========================================================================== }
          iLinha := 10;

          { busca os cfop }
          if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
          dm.IBTransaction.StartTransaction;
          try
            try
              with dm.QConsulta do
              begin
                close;
                sql.Clear;
                sql.Text := 'SELECT DISTINCT(I.COD_CFO) CFOP, C.NOME_CFO ' +
                  'FROM ITENS_NOTA_FISCAL I   ' + 'INNER JOIN CFOP C          '
                  + 'ON (I.COD_CFO = C.COD_CFO) ' +
                  'WHERE I.COD_NF = :CODNF    ' + 'ORDER BY I.COD_CFO';
                Parambyname('codnf').AsInteger := iCodigoNotaFiscal;
                open;
                dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('nome_cfo').AsString);
                iColunaCFOP := 42;
                while not eof do
                begin
                  if iColunaCFOP = 42 then
                  begin
                    dm.RdPrintNF.Imp(iLinha, iColunaCFOP,
                      fieldbyname('cfop').AsString);
                    iColunaCFOP := iColunaCFOP + 4;
                  end
                  else
                  begin
                    dm.RdPrintNF.Imp(iLinha, iColunaCFOP,
                      '/' + fieldbyname('cfop').AsString);
                    iColunaCFOP := iColunaCFOP + 5;
                  end;
                  next;
                end;
              end;
              dm.IBTransaction.Commit;
            except
              dm.IBTransaction.Rollback;
              KDialog('erro ao buscar os cfops');
            end;
          finally
            dm.QConsulta.close;
          end;

          { ========================================================================== }
          { ========================= DADOS DO CLIENTE/FORNECEDOR ==================== }
          { ========================================================================== }
          if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
          dm.IBTransaction.StartTransaction;
          with dm.QConsulta do
          begin
            close;
            sql.Clear;
            if dm.QNFCOD_CLI.AsInteger > 0 then
            begin
              sql.Add('SELECT * FROM CLIENTE WHERE COD_CLI = :CODCLI');
              Parambyname('codcli').AsInteger := dm.QNFCOD_CLI.AsInteger;
              open;
              iLinha := 14;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('COD_CLI').AsString + '-'
                + trim(fieldbyname('NOME_CLI').AsString));
              dm.RdPrintNF.Imp(iLinha, 86, fieldbyname('CNPJ_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 122, dm.QNFDATA_EMISSAO_NF.AsString);
              iLinha := 17;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('ENDRES_CLI').AsString +
                ', ' + fieldbyname('NUMRES_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 63, fieldbyname('BAIRES_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 98, fieldbyname('CEPRES_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 122, dm.QNFDATA_SAIDA_NF.AsString);
              iLinha := 20;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('CIDRES_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 52, fieldbyname('TELRES_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 79, fieldbyname('ESTRES_CLI').AsString);
              dm.RdPrintNF.Imp(iLinha, 88, fieldbyname('INSC_ESTADUAL')
                .AsString);
              dm.RdPrintNF.Imp(iLinha, 122, dm.QNFHORA_SAIDA_NF.AsString);
            end
            else
            begin
              sql.Add('SELECT * FROM FORNECEDOR WHERE COD_FOR = :CODFOR');
              Parambyname('codfor').AsInteger := dm.QNFCOD_FOR.AsInteger;
              open;
              iLinha := 14;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('COD_FOR').AsString + '-'
                + trim(fieldbyname('RAZAO_FOR').AsString));
              dm.RdPrintNF.Imp(iLinha, 86, fieldbyname('CNPJ_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 122, dm.QNFDATA_EMISSAO_NF.AsString);
              iLinha := 17;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('END_FOR').AsString + ', '
                + fieldbyname('NUM_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 63, fieldbyname('BAI_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 98, fieldbyname('CEP_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 122, dm.QNFDATA_SAIDA_NF.AsString);
              iLinha := 20;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('CID_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 52, fieldbyname('TEL_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 79, fieldbyname('EST_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 88, fieldbyname('INSC_FOR').AsString);
              dm.RdPrintNF.Imp(iLinha, 122, dm.QNFHORA_SAIDA_NF.AsString);
            end;
          end;
          dm.IBTransaction.Commit;
          dm.QConsulta.close;

          { ========================================================================== }
          { ============================ DADOS DOS PRODUTOS ========================== }
          { ========================================================================== }
          with dm.QbuscaItensNF do
          begin
            if j = 1 then
              first;
            iLinha := 24;
            i := 1;
            while i <= 24 do
            begin
              dm.RdPrintNF.Imp(iLinha, 1, dm.QbuscaItensNFCOD_PRO.AsString);
              dm.RdPrintNF.Imp(iLinha, 12,
                copy(dm.QbuscaItensNFNOME_PRO.AsString, 1, 54));
              dm.RdPrintNF.Imp(iLinha, 84, dm.QbuscaItensNFCST.AsString);
              dm.RdPrintNF.Imp(iLinha, 89, dm.QbuscaItensNFUNIDADE.AsString);
              dm.RdPrintNF.ImpVal(iLinha, 93, '#,##0.00',
                dm.QbuscaItensNFQUANT.AsCurrency, []);
              dm.RdPrintNF.ImpVal(iLinha, 108, '#,##0.00',
                dm.QbuscaItensNFUNIT.AsCurrency, []);
              dm.RdPrintNF.ImpVal(iLinha, 123, '#,##0.00',
                dm.QBuscaItensNFCALC_TOTAL.AsCurrency, []);
              if dm.QbuscaItensNFALIQ.AsCurrency > 0 then
                dm.RdPrintNF.Imp(iLinha, 134,
                  inttostr(trunc(dm.QbuscaItensNFALIQ.AsCurrency)));
              next;
              Inc(iLinha);
              if eof then
                Break
              else
                Inc(i);
            end;
          end;

          { ========================================================================== }
          { ============================ IMPRIME O DESCONTO ========================== }
          { ========================================================================== }
          if not(j < cQtdNota) then
          begin
            if dm.QNFDESCONTO_NF.AsCurrency > 0 then
            begin
              dm.RdPrintNF.Imp(iLinha, 12, 'Desconto');
              dm.RdPrintNF.ImpVal(iLinha, 121, '#,##0.00',
                dm.QNFDESCONTO_NF.AsCurrency * -1, []);
            end;
          end;

          { ========================================================================== }
          { ============================ CÁLCULO DO IMPOSTO ========================== }
          { ========================================================================== }
          if j < cQtdNota then
          begin
            iLinha := 52;
            dm.RdPrintNF.Imp(iLinha, 11, '*************');
            dm.RdPrintNF.Imp(iLinha, 41, '*************');
            dm.RdPrintNF.Imp(iLinha, 68, '*************');
            dm.RdPrintNF.Imp(iLinha, 95, '*************');
            dm.RdPrintNF.Imp(iLinha, 113, '*************');
            iLinha := 55;
            dm.RdPrintNF.Imp(iLinha, 11, '*************');
            dm.RdPrintNF.Imp(iLinha, 41, '*************');
            dm.RdPrintNF.Imp(iLinha, 68, '*************');
            dm.RdPrintNF.Imp(iLinha, 95, '*************');
            dm.RdPrintNF.Imp(iLinha, 113, '*************');
          end
          else
          begin
            iLinha := 52;
            dm.RdPrintNF.ImpVal(iLinha, 11, '#,###,##0.00',
              dm.QNFBASE_CALCULO_ICMS_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 41, '#,###,##0.00',
              dm.QNFVALOR_ICMS_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 68, '#,###,##0.00',
              dm.QNFBASE_SUBST_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 95, '#,###,##0.00',
              dm.QNFVALOR_SUBST_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 114, '#,###,##0.00',
              dm.QNFVALOR_TOTAL_PROD_NF.AsCurrency, [normal, negrito]);

            iLinha := 55;
            dm.RdPrintNF.ImpVal(iLinha, 11, '#,###,##0.00',
              dm.QNFVALOR_FRETE_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 41, '#,###,##0.00',
              dm.QNFVALOR_SEGURO_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 68, '#,###,##0.00',
              dm.QNFOUTRAS_DESPESAS_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 95, '#,###,##0.00',
              dm.QNFVALOR_IPI_NF.AsCurrency, [comp17, negrito]);
            dm.RdPrintNF.ImpVal(iLinha, 114, '#,###,##0.00',
              dm.QNFVALOR_TOTAL_NF.AsCurrency, [normal, negrito]);
          end;

          { ========================================================================== }
          { ============================== TRANSPORTADORA ============================ }
          { ========================================================================== }
          iLinha := 59;
          if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
          dm.IBTransaction.StartTransaction;
          with dm.QConsulta do
          begin
            close;
            sql.Clear;
            sql.Add('SELECT * FROM TRANSPORTADORA WHERE COD_TRA = :CODTRA');
            Parambyname('codtra').AsInteger := dm.QNFCOD_TRA.AsInteger;
            open;
            if recordCount > 0 then
            begin
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('nome_tra').AsString);
              dm.RdPrintNF.Imp(iLinha, 76, dm.QNFFRETE_CONTA_NF.AsString);
              dm.RdPrintNF.Imp(iLinha, 82, fieldbyname('placa_tra').AsString);
              dm.RdPrintNF.Imp(iLinha, 99, fieldbyname('uf_placa_tra')
                .AsString);
              dm.RdPrintNF.Imp(iLinha, 110, fieldbyname('cnpj_tra').AsString);

              iLinha := 62;
              dm.RdPrintNF.Imp(iLinha, 1, fieldbyname('end_tra').AsString);
              dm.RdPrintNF.Imp(iLinha, 64, fieldbyname('cid_tra').AsString);
              dm.RdPrintNF.Imp(iLinha, 99, fieldbyname('est_tra').AsString);
              dm.RdPrintNF.Imp(iLinha, 110, fieldbyname('insc_tra').AsString);
            end;
          end;
          dm.IBTransaction.Commit;
          dm.QConsulta.close;

          { ========================================================================== }
          { ================================ VOLUME ================================== }
          { ========================================================================== }
          iLinha := 65;
          if dm.QNFQUANTIDADE_NF.AsInteger > 0 then
            dm.RdPrintNF.Imp(iLinha, 1, dm.QNFQUANTIDADE_NF.AsString);
          dm.RdPrintNF.Imp(iLinha, 18, dm.QNFESPECIE_NF.AsString);
          dm.RdPrintNF.Imp(iLinha, 72, dm.QNFMARCA_NF.AsString);
          dm.RdPrintNF.Imp(iLinha, 89, dm.QNFNUMERO_NF.AsString);
          if dm.QNFPESO_BRUTO_NF.AsCurrency > 0 then
            dm.RdPrintNF.Imp(iLinha, 100,
              currtostrf(dm.QNFPESO_BRUTO_NF.AsCurrency, ffnumber, 2));
          if dm.QNFPESO_LIQUIDO_NF.AsCurrency > 0 then
            dm.RdPrintNF.Imp(iLinha, 120,
              currtostrf(dm.QNFPESO_LIQUIDO_NF.AsCurrency, ffnumber, 2));

          { ========================================================================== }
          { ================================ OBSERVAÇÃO ============================== }
          { ========================================================================== }
          if not(j < cQtdNota) then
          begin
            iLinha := 68;
            sAuxObs := TStringList.Create;
            sAuxObs.Text := dm.QNFINF_COMPL_NF.AsString;

            for i := 0 to sAuxObs.Count - 1 do
            begin
              dm.RdPrintNF.Imp(iLinha, 1, sAuxObs[i]);
              Inc(iLinha);
            end;
            FreeAndNil(sAuxObs);

            { busca as parcelas }
            Inc(iLinha);
            if dm.IBTransaction.Active then
              dm.IBTransaction.Commit;
            dm.IBTransaction.StartTransaction;
            with dm.QConsulta do
            begin
              close;
              sql.Clear;
              sql.Text := 'SELECT C.COD_CTR, C.VENCTO_CTR, C.VALOR_CTR ' +
                'FROM CONTAS_RECEBER C ' + 'INNER JOIN VENDAS V   ' +
                'ON (C.COD_VENDA = V.COD_VEN) ' + 'WHERE V.COD_NF = :CODNF ' +
                'ORDER BY C.VENCTO_CTR';
              Parambyname('codnf').AsInteger := iCodigoNotaFiscal;
              open;
              if not(fieldbyname('cod_ctr').IsNull) then
              begin
                dm.RdPrintNF.Imp(iLinha, 2, 'Vencimento');
                Inc(iLinha);
              end;

              while not eof do
              begin
                dm.RdPrintNF.Imp(iLinha, 2, fieldbyname('vencto_ctr').AsString +
                  '   ' + currtostrf(fieldbyname('valor_ctr').AsCurrency,
                  ffnumber, 2));
                Inc(iLinha);
                next;
              end;
            end;

            dm.IBTransaction.Commit;
            dm.QConsulta.close;
          end;

          { ========================================================================== }
          { ============================= NÚMERO DA NOTA ============================= }
          { ========================================================================== }
          iLinha := 83;
          if cQtdNota > 1 then
            dm.RdPrintNF.ImpF(iLinha, 119,
              FormataStringD(dm.QNFNUMERO_NOTA_NF.AsString, '6', '0') + '/' +
              inttostr(j), [expandido, negrito], CLred)
          else
            dm.RdPrintNF.ImpF(iLinha, 119,
              FormataStringD(dm.QNFNUMERO_NOTA_NF.AsString, '6', '0'),
              [expandido, negrito], CLred);
          dm.RdPrintNF.Novapagina;
        end;

        { ========================================================================== }
        { =========================== FINALIZA IMPRESSORA  ========================= }
        { ========================================================================== }
        dm.RdPrintNF.Fechar;
      end;
  end;

  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;

  if dm.IBTRAux.Active then
    dm.IBTRAux.Commit;

  dm.QNF.close;
  dm.QbuscaItensNF.close;
end;

procedure NotaFiscalEletronica(const iCodigoNotaFiscal: integer);
var
  sRazaoEmi, sFantasiaEmi, sEndEmi, sBaiEmi, sCidEmi, sCEPEmi, sUFEmi: string;
  sCNPJEmi, sIEEmi, sTelEmi, sIBGEEmi, sNumeroEmi: string;
  sRazaoDest, sEndDest, sBaiDest, sCidDest, sUFDest, sCepDest, sTelDest: string;
  sCNPJDest, sIEDest, sIBGEDest, sPessoaDest, sNumDest: string;
  sNomeTra, sEndTra, sCidTra, sUFTra, sCNPJTra, sIETra, sPlacaTra, sUFPlacaTra,
    CSOSNm: string;

  sChave, sProtrocolo: string;

  iOrdemItens: integer;
  bAux: boolean;

  sAmbienteNfe: string;
  sNatureza: string;
  iAux, Tipo_emp: integer;
  JC: String;
  DPEC: boolean;
  IDEPEC: integer;
  chave2: string;
  TotalIBPT: Currency;
  PorcIBPT: Currency;

  CalcAux: Currency;
  TotICMS: Currency;
  TotBCIcms: Currency;
  TotBCST: Currency;
  TotSt: Currency;
  IFor: Integer;
  InfoADD: TStringList;
begin
  TotalIBPT := 0;
  PorcIBPT := 0;
  CalcAux := 0;
  TotICMS := 0;
  TotBCIcms := 0;
  TotBCST := 0;
  TotSt := 0;
  {Configura ACBR}
  if not Dm.ConfiguraNFe( dm.AcbrNfe1 ) then
     Exit;
  if not dm.VerificaWebServices( DM.ACBrNFe1 ) then
     Exit;
  dm.ACBrNFe1.NotasFiscais.Clear;
  InfoADD := TStringList.Create;
  try
    InfoADD.Delimiter := ';';
    InfoADD.StrictDelimiter := True;
    sAmbienteNfe := DM.RetornaStringTabela( 'ambiente_danfe', 'PARAMETROS', 'COD_EMP', iEmp );
    { abre a nota fiscal e os Itens }
    if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
    dm.IBTRAux.StartTransaction;

    dm.QNF.Close;
    dm.QNF.Parambyname('codnf').AsInteger := iCodigoNotaFiscal;
    dm.QNF.open;

    { busca a natureza da operacao }
    iAux := 0;
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;
    try
      try
        with dm.QConsulta do
        begin
          close;
          sql.Clear;
          sql.Text := 'SELECT DISTINCT(I.COD_CFO) CFOP, C.NOME_CFO ' +
            'FROM ITENS_NOTA_FISCAL I   ' + 'INNER JOIN CFOP C          ' +
            'ON (I.COD_CFO = C.COD_CFO) ' + 'WHERE I.COD_NF = :CODNF    ' +
            'ORDER BY I.COD_CFO';
          Parambyname('codnf').AsInteger := iCodigoNotaFiscal;
          open;
          while not eof do
          begin
            if iAux = 0 then
              sNatureza := fieldbyname('nome_cfo').AsString
            else
              sNatureza := '\' + fieldbyname('nome_cfo').AsString;

            Inc(iAux);
            next;
          end;
        end;
        dm.IBTransaction.Commit;
      except
        dm.IBTransaction.Rollback;
        KDialog('erro ao buscar os cfops');
      end;
    finally
      dm.QConsulta.close;
    end;

    { gerando o XML }
    sChave := '';
    sProtrocolo := '';

    dm.ACBrNFe1.NotasFiscais.Clear;

    { busca dados empresa para NFe }
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;
    try
      try
        with dm.QConsulta do
        begin
          close;
          sql.Clear;
          sql.Text :=
            'SELECT RAZAO_EMP, FANTASIA_EMP, END_EMP, BAI_EMP, CID_EMP, CEP_EMP, EST_EMP, '
            + 'CNPJ_EMP, INSC_EMP, TEL_EMP, CODIGO_MUNICIPIO, NUMERO_EMP, TIPO_EMP '
            + 'FROM EMPRESA ' + 'WHERE COD_EMP = :CODEMP';
          Parambyname('codemp').AsInteger := iEmp;
          open;
          sRazaoEmi := fieldbyname('razao_emp').AsString;
          sFantasiaEmi := fieldbyname('fantasia_emp').AsString;
          sEndEmi := fieldbyname('end_emp').AsString;
          sBaiEmi := fieldbyname('bai_emp').AsString;
          sCidEmi := fieldbyname('cid_emp').AsString;
          sCEPEmi := RetiraCaracter(fieldbyname('cep_emp').AsString);
          sUFEmi := fieldbyname('est_emp').AsString;
          sCNPJEmi := RetiraCaracter(fieldbyname('cnpj_emp').AsString);
          sIEEmi := RetiraCaracter(fieldbyname('insc_emp').AsString);
          sTelEmi := fieldbyname('tel_emp').AsString;
          sIBGEEmi := fieldbyname('CODIGO_MUNICIPIO').AsString;
          sNumeroEmi := fieldbyname('numero_emp').AsString;
          Tipo_emp := fieldbyname('TIPO_EMP').AsInteger;

        end;
        dm.IBTransaction.Commit;
      except
        dm.IBTransaction.Rollback;
        KDialog('erro buscandos dados da empresa');
      end;
    finally
      dm.QConsulta.close;
    end;

    { busca dados do Cliente/Fornecedor para NFe }
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;
    try
      try
        with dm.QConsulta do
        begin
          close;
          sql.Clear;
          if dm.QNFCOD_CLI.AsInteger > 0 then
          begin
            sql.Text :=
              'SELECT NOME_CLI, ENDRES_CLI, BAIRES_CLI, CIDRES_CLI, ESTRES_CLI, CEPRES_CLI,  '
              + 'TELRES_CLI, CNPJ_CLI, CODIGO_IBGE, FJ_CLI, NUMRES_CLI, INSC_ESTADUAL, FJ_CLI  '
              + 'FROM CLIENTE ' + 'WHERE COD_CLI = :CODCLI';
            Parambyname('codcli').AsInteger := dm.QNFCOD_CLI.AsInteger;
            open;
            sRazaoDest := fieldbyname('nome_cli').AsString;
            sEndDest := fieldbyname('endres_cli').AsString;
            sBaiDest := fieldbyname('baires_cli').AsString;
            sCidDest := fieldbyname('cidres_cli').AsString;
            sCepDest := RetiraCaracter(fieldbyname('cepres_cli').AsString);
            sUFDest := fieldbyname('estres_cli').AsString;
            sCNPJDest := RetiraCaracter(fieldbyname('cnpj_cli').AsString);
            sIEDest := RetiraCaracter(fieldbyname('insc_estadual').AsString);
            sTelDest := RetiraCaracter(fieldbyname('telres_cli').AsString);
            sIBGEDest := fieldbyname('codigo_ibge').AsString;
            sPessoaDest := fieldbyname('fj_cli').AsString;
            sNumDest := fieldbyname('numres_cli').AsString;
          end
          else
          begin
            sql.Text :=
              'SELECT RAZAO_FOR, END_FOR, BAI_FOR, CID_FOR, EST_FOR, CEP_FOR, ' +
              'TEL_FOR, CNPJ_FOR, INSC_FOR, CODIGO_IBGE, NUM_FOR, FJ_FOR      ' +
              'FROM FORNECEDOR ' + 'WHERE COD_FOR = :CODFOR';
            Parambyname('codfor').AsInteger := dm.QNFCOD_FOR.AsInteger;
            open;
            sRazaoDest := fieldbyname('razao_for').AsString;
            sEndDest := fieldbyname('end_for').AsString;
            sBaiDest := fieldbyname('bai_for').AsString;
            sCidDest := fieldbyname('cid_for').AsString;
            sCepDest := RetiraCaracter(fieldbyname('cep_for').AsString);
            sUFDest := fieldbyname('est_for').AsString;
            sCNPJDest := RetiraCaracter(fieldbyname('cnpj_for').AsString);
            sIEDest := RetiraCaracter(fieldbyname('insc_for').AsString);
            sTelDest := RetiraCaracter(fieldbyname('tel_for').AsString);
            sIBGEDest := fieldbyname('codigo_ibge').AsString;
            sPessoaDest := fieldbyname('fj_for').AsString;
            sNumDest := fieldbyname('num_for').AsString;
          end;
        end;
        dm.IBTransaction.Commit;
      except
        dm.IBTransaction.Rollback;
        KDialog('erro buscandos dados do cliente/fornecedor');
      end;
    finally
      dm.QConsulta.close;
    end;
    dm.QbuscaItensNF.Close;
    dm.QbuscaItensNF.Parambyname('codnf').AsInteger := iCodigoNotaFiscal;
    DM.QBuscaItensNF.ParamByName('uf').AsString := sUFDest;
    dm.QbuscaItensNF.open;

    { busca dados da Transportadora para NFe }
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;
    try
      try
        with dm.QConsulta do
        begin
          close;
          sql.Clear;
          sql.Text :=
            'SELECT NOME_TRA, END_TRA, CID_TRA, EST_TRA, CNPJ_TRA, INSC_TRA, PLACA_TRA, UF_PLACA_TRA '
            + 'FROM TRANSPORTADORA ' + 'WHERE COD_TRA = :CODTRA';
          Parambyname('codtra').AsInteger := dm.QNFCOD_TRA.AsInteger;
          open;
          sNomeTra := fieldbyname('nome_tra').AsString;
          sEndTra := fieldbyname('end_tra').AsString;
          sCidTra := fieldbyname('cid_tra').AsString;
          sUFTra := fieldbyname('est_tra').AsString;
          sCNPJTra := RetiraCaracter(fieldbyname('cnpj_tra').AsString);
          sIETra := RetiraCaracter(fieldbyname('insc_tra').AsString);
          sPlacaTra := RetiraCaracter(fieldbyname('placa_tra').AsString);
          sUFPlacaTra := fieldbyname('uf_placa_tra').AsString;
        end;
        dm.IBTransaction.Commit;
      except
        dm.IBTransaction.Rollback;
        KDialog('erro buscandos dados da transportadora');
      end;
    finally
      dm.QConsulta.close;
    end;

    with dm.ACBrNFe1.NotasFiscais.Add.NFe do
    begin
        if Trim( DM.QNFINFO_ESTORNO.AsString ) <> '' then
         begin
              Ide.finNFe := fnAjuste;
              Ide.natOp := '999 -  Estorno de Nfe nao cancelada no prazo legal';

               with Ide.NFref.Add do
                 begin
                     refNFe := dm.QNFCHAVE_NFE_ESTORNO.AsString;
                 end;
              InfAdic.infAdFisco := dm.QNFINFO_ESTORNO.AsString;
         end
         else
            begin
               Ide.natOp := sNatureza;
               case dm.QNFTIPO_NOTA_FISCAL.AsInteger of
                    3,6,7: Ide.finNFe := fnDevolucao;
                    else
                       Ide.finNFe := fnNormal;
               end;
            end;

      if JC <> '' then
      begin
        Ide.xJust := JC;
        Ide.dhCont := Date;
      end;
      Ide.nNF := dm.QNFNUMERO_NOTA_NF.AsInteger;
      Ide.cNF := dm.QNFNUMERO_NOTA_NF.AsInteger;
      Ide.modelo := 55;
      Ide.serie := dm.QNFSERIE_NOTA.AsInteger;
      Ide.dEmi := dm.QNFDATA_EMISSAO_NF.AsDateTime;
      Ide.dSaiEnt := dm.QNFDATA_SAIDA_NF.AsDateTime;
      Ide.hSaiEnt := Now;
      Ide.indPres   := pcPresencial;
      Ide.idDest := doInterna;

      if trim(sAmbienteNfe) = 'P' then
        Ide.tpAmb := taProducao
      else
        Ide.tpAmb := taHomologacao;

      if dm.QNFTIPO_NOTA_FISCAL.AsInteger < 5 then
        Ide.tpNF := tnSaida
      else
        Ide.tpNF := tnEntrada;

      Ide.indPag := ipVista;
      Ide.verProc := 'KSystem 3.1';
      Ide.cUF := StrToIntDef(copy(sIBGEEmi, 1, 2), 0);
      Ide.cMunFG := StrToIntDef(sIBGEEmi, 0);
      Ide.tpImp := tiRetrato;
      Ide.tpImp := dm.ACBrNFe1.DANFE.TipoDANFE;

      { Notas Referenciadas
        with Ide.NFref.Add do
        begin
        refNFe := ChaveNFeOriginal;

        ou

        RefNF.cUF := 35;
        RefNF.AAMM := '0310';
        end }

      { Emitente }
      dm.QbuscaItensNF.first;
      if dm.QBuscaItensNFUSA_CSOSN.AsString = 'S' then
        Emit.CRT := crtSimplesNacional
      else
        Emit.CRT := crtRegimeNormal;
      Emit.CNPJCPF := sCNPJEmi;
      Emit.IE := sIEEmi;
      Emit.xNome := sRazaoEmi;
      Emit.xFant := sFantasiaEmi;
      Emit.EnderEmit.fone := sTelEmi;
      Emit.EnderEmit.CEP := strtoint(sCEPEmi);
      Emit.EnderEmit.xLgr := sEndEmi;
      Emit.EnderEmit.nro := sNumeroEmi;
      Emit.EnderEmit.xCpl := '';
      Emit.EnderEmit.xBairro := sBaiEmi;
      Emit.EnderEmit.cMun := strtoint(sIBGEEmi);
      Emit.EnderEmit.xMun := sCidEmi;
      Emit.EnderEmit.UF := trim(sUFEmi);
      Emit.EnderEmit.cPais := 1058;
      Emit.EnderEmit.xPais := 'BRASIL';

      { Destinatário }
      Dest.CNPJCPF := sCNPJDest;
      Dest.EnderDest.CEP := strtoint(sCepDest);;
      Dest.EnderDest.xLgr := sEndDest;
      Dest.EnderDest.nro := sNumDest;
      Dest.EnderDest.xCpl := '';
      Dest.EnderDest.xBairro := sBaiDest;
      Dest.EnderDest.cMun := strtoint(sIBGEDest);
      Dest.EnderDest.xMun := sCidDest;
      Dest.EnderDest.UF := trim(sUFDest);
      Dest.EnderDest.fone := sTelDest;

      if Copy(Trim( sIEDest ),1,3) = 'ISE'  then
        begin
          Dest.indIEDest := inIsento ;
          Dest.IE := 'ISENTO';
        end
      else
        if Trim(sIEDest) <> '' then
           begin
             if trim(sPessoaDest) = 'J' then
               begin
                 Dest.IE := sIEDest;
                 Dest.indIEDest := inContribuinte;
               end
             else
               begin
                 Dest.IE := sIEDest;
                 Dest.indIEDest := inNaoContribuinte;
               end;
           end
        else
          begin
            Dest.IE := '';
            Dest.indIEDest := inNaoContribuinte;
          end;

      {if trim(sPessoaDest) = 'J' then
         begin
            if Trim( sIEDest ) = ''  then
               Dest.indIEDest :=   inIsento
            else
               begin
                  Dest.IE := sIEDest;
                  Dest.indIEDest := inContribuinte;
               end;
         end
      else
         begin
             Dest.indIEDest := inNaoContribuinte;
             if sIEDest <> '' then
                Dest.IE := sIEDest
             else
               Dest.IE := '';
         end; }
      if Dest.indIEDest = inNaoContribuinte then
        Ide.indFinal := cfConsumidorFinal;
      Dest.xNome := sRazaoDest;
      Dest.EnderDest.cPais := 1058;
      Dest.EnderDest.xPais := 'BRASIL';
      if Dest.EnderDest.UF <> Emit.EnderEmit.UF then
          Ide.idDest := doInterestadual
      else
          Ide.idDest := doInterna;
      iOrdemItens := 0;
      dm.QbuscaItensNF.first;
      while not dm.QbuscaItensNF.eof do
      begin
        with Det.Add do
        begin
          Inc(iOrdemItens);
          infAdProd := '';
          Prod.nItem := iOrdemItens;
          Prod.CFOP := dm.QbuscaItensNFCOD_CFO.AsString;
          Prod.cProd := dm.QbuscaItensNFCOD_PRO.AsString;
  //                Prod.CEST := PadLeft( DM.QBuscaItensNFCEST.AsString, 7, '0' );
          if length(trim(dm.QBuscaItensNFCODIGO_BARRA_PRO.AsString)) = 13 then
            Prod.cEAN := dm.QBuscaItensNFCODIGO_BARRA_PRO.AsString;
          Prod.xProd := dm.QBuscaItensNFDESC_CUPOM.AsString;
          Prod.qCom := dm.QbuscaItensNFQUANT.AsCurrency;
          Prod.uCom := dm.QbuscaItensNFUNIDADE.AsString;
          Prod.vProd := dm.QBuscaItensNFCALC_TOTAL.AsCurrency;
          Prod.vUnCom := dm.QbuscaItensNFUNIT.AsCurrency;
          Prod.vDesc := dm.QBuscaItensNFDESCONTO.AsCurrency;
          Prod.qTrib := dm.QbuscaItensNFQUANT.AsCurrency;;
          Prod.uTrib := dm.QbuscaItensNFUNIDADE.AsString;
          Prod.vUnTrib := dm.QbuscaItensNFUNIT.AsCurrency;
  {        if not ( dm.QNFNR_PEDIDO.AsString = '' ) then
              Prod.xPed := dm.QNFNR_PEDIDO.AsString;
          if dm.QNFNR_ITENS_PEDIDO.AsString <> EmptyStr then
              Prod.nItemPed := dm.QNFNR_ITENS_PEDIDO.asInteger; {Apenas numeros}
  {        if trim( dm.QBuscaItensNFCOD_COMBUSTIVEL.AsString ) <> EmptyStr then
             begin
                prod.comb.cProdANP := dm.QBuscaItensNFCOD_COMBUSTIVEL.AsInteger;
                Prod.comb.UFcons := Dest.EnderDest.UF;
             end;}
          Prod.NCM := PadLeft( dm.QBuscaItensNFCOD_NCM.AsString, 8, '0' );
          Prod.vFrete := dm.QBuscaItensNFFRETE.AsCurrency;

          with Imposto do
          begin
            vTotTrib :=  RoundTo( (( Prod.vProd * dm.QBuscaItensNFALIQ_IBPT_NAC.AsFloat) / 100), -2 );
            TotalIBPT := RoundTo( TotalIBPT + vTotTrib , -2 );
            with ICMS do
            begin
              /// Novas linhas
              ///
              if trim(dm.QBuscaItensNFUSA_CSOSN.AsString) = 'S' then
              begin
                // CSOSNm := '900';
                CSOSNm := trim(dm.QBuscaItensNFCSOSN.AsString);
                CSOSN := StrToCSOSNICMS(bAux, CSOSNm);
                Orig := StrToOrig(bAux, trim(dm.QBuscaItensNFORIG.AsString));
                if CSOSNm = '900' then
                begin
                  ICMS.modBC := dbiPrecoTabelado;
                  ICMS.pICMS := dm.QbuscaItensNFALIQ.AsCurrency;
                  ICMS.vICMS := dm.QBuscaItensNFVALOR_ICMS.AsCurrency;
                  ICMS.vBC := dm.QBuscaItensNFBASE_CALCULO.AsCurrency;
                end;
                if trim(dm.QBuscaItensNFSUB_TRIBUTARIA.AsString) = 'S' then
                begin
                  ICMS.modBCST := dbisPrecoTabelado;
                  ICMS.pICMSST := dm.QBuscaItensNFVR_AGREGADO.AsCurrency;
                  ICMS.vICMSST := dm.QBuscaItensNFVALOR_SUBTRIB.AsCurrency;
                  ICMS.vBCST := dm.QBuscaItensNFBASE_SUBTRIB.AsCurrency;
                end;

              end
              else
              begin

                /// Fim de novas linhas
                ///
                CST := StrToCSTICMS(bAux,
                  copy(trim(dm.QbuscaItensNFCST.AsString), 2, 2));
                ICMS.modBC := dbiPrecoTabelado;
                ICMS.pICMS := dm.QbuscaItensNFALIQ.AsCurrency;
                ICMS.vICMS := dm.QBuscaItensNFVALOR_ICMS.AsCurrency;
                ICMS.vBC := dm.QBuscaItensNFBASE_CALCULO.AsCurrency;
                if trim(dm.QBuscaItensNFSUB_TRIBUTARIA.AsString) = 'S' then
                begin
                  ICMS.modBCST := dbisPrecoTabelado;
                  ICMS.pICMSST := dm.QBuscaItensNFVR_AGREGADO.AsCurrency;
                  ICMS.vICMSST := dm.QBuscaItensNFVALOR_SUBTRIB.AsCurrency;
                  ICMS.vBCST := dm.QBuscaItensNFBASE_SUBTRIB.AsCurrency;
                end;
              end;
              TotICMS := TotICMS + ICMS.vICMS;
              TotBCIcms := TotBCIcms + ICMS.vBC;
              TotBCST := TotBCST + ICMS.vBCST;
              TotSt := TotSt + ICMS.vICMSST;
            end;

            PIS.CST := StrtoCSTPIS(bAux,
              IfThen( trim(dm.QBuscaItensNFCST_PIS.AsString) = '', '07', trim(dm.QBuscaItensNFCST_PIS.AsString) ));
            PIS.vBC := dm.QBuscaItensNFBC_PIS.AsCurrency;
            PIS.pPIS := dm.QBuscaItensNFALIQ_PIS.AsCurrency;
            PIS.vPIS := dm.QBuscaItensNFVALOR_PIS.AsCurrency;

            COFINS.CST := StrtoCSTCOFINS(bAux,
              IfThen( trim(dm.QBuscaItensNFCST_COFINS.AsString) = '', '07', trim(dm.QBuscaItensNFCST_COFINS.AsString) ) );
            COFINS.vBC := dm.QBuscaItensNFBC_COFINS.AsCurrency;
            COFINS.pCOFINS := dm.QBuscaItensNFALIQ_COFINS.AsCurrency;
            COFINS.vCOFINS := dm.QBuscaItensNFVALOR_COFINS.AsCurrency;

            with IPI do
            begin
              if dm.QbuscaItensNFALIQ_IPI.AsCurrency > 0 then
              begin
                CST := strtoCSTIPI(bAux, dm.QBuscaItensNFCST_IPI.AsString);
                IPI.pIPI := dm.QbuscaItensNFALIQ_IPI.AsCurrency;
                IPI.vIPI := dm.QBuscaItensNFVALOR_IPI.AsCurrency;
                IPI.vBC := dm.QBuscaItensNFCALC_TOTAL.AsCurrency;
              end
              else
              begin
                CST := strtoCSTIPI(bAux, dm.QBuscaItensNFCST_IPI.AsString);
                IPI.pIPI := 0.00;
                IPI.vIPI := 0.00;
                IPI.vBC := 0.00;
              end;
            end;
          end;
        end;
        dm.QbuscaItensNF.next;
      end;

      Total.ICMSTot.vPIS := dm.QNFVALOR_PIS.AsCurrency;
      Total.ICMSTot.vCOFINS := dm.QNFVALOR_COFINS.AsCurrency;
      Total.ICMSTot.vDesc := dm.QNFDESCONTO_NF.AsCurrency;
      Total.ICMSTot.vBC :=  TotBCIcms;// dm.QNFBASE_CALCULO_ICMS_NF.AsCurrency;
      Total.ICMSTot.vICMS := TotICMS;//dm.QNFVALOR_ICMS_NF.AsCurrency;
      Total.ICMSTot.vBCST := TotBCST;//dm.QNFBASE_SUBST_NF.AsCurrency;
      Total.ICMSTot.vST := TotSt;//dm.QNFVALOR_SUBST_NF.AsCurrency;
      Total.ICMSTot.vProd := dm.QNFVALOR_TOTAL_PROD_NF.AsCurrency;
      Total.ICMSTot.vFrete := dm.QNFVALOR_FRETE_NF.AsCurrency;
      Total.ICMSTot.vSeg := dm.QNFVALOR_SEGURO_NF.AsCurrency;
      Total.ICMSTot.vOutro := RoundTo( dm.QNFOUTRAS_DESPESAS_NF.AsCurrency, -2 );
      Total.ICMSTot.vIPI := dm.QNFVALOR_IPI_NF.AsCurrency;
      Total.ICMSTot.vNF := dm.QNFVALOR_TOTAL_NF.AsCurrency;
      Total.ICMSTot.vTotTrib := RoundTo( TotalIBPT, -2 );
      InfoADD.Add(
         'Val Aprox Tributos ' + FormatFloat( 'R$ 0.00', Total.ICMSTot.vTotTrib )
          + ' ( '+ FormatFloat( '0.00%', ( ( Total.ICMSTot.vTotTrib * 100 ) / Total.ICMSTot.vProd )  )  +' ) Fonte: IBPT');
      if Total.ICMSTot.vOutro > 0 then
         begin
            CalcAux := Total.ICMSTot.vOutro;
            CalcAux := RoundTo( CalcAux / Det.Count , -2 );
            for IFor := 0 to Det.Count - 1 do
                begin
                  Det.Items[IFor].Prod.vOutro := CalcAux;
                end;
         end;
      if trim(dm.QNFFRETE_CONTA_NF.AsString) = '1' then
        Transp.modFrete := mfContaEmitente
      else if trim(dm.QNFFRETE_CONTA_NF.AsString) = '2' then
        Transp.modFrete := mfContaDestinatario
      else if trim(dm.QNFFRETE_CONTA_NF.AsString) = '3' then
        Transp.modFrete := mfContaTerceiros
      else if trim(dm.QNFFRETE_CONTA_NF.AsString) = '4' then
        Transp.modFrete := mfSemFrete;
      if Transp.modFrete <> mfSemFrete then
         begin
               { TRANSPORTADORA }
               Transp.Transporta.xNome := sNomeTra;
                Transp.Transporta.IE := sIETra;
                Transp.Transporta.xEnder := sEndTra;
                Transp.Transporta.UF := sUFTra;
                Transp.Transporta.xMun := sCidTra;
                Transp.Transporta.CNPJCPF := sCNPJTra;
                Transp.veicTransp.placa := sPlacaTra;
                Transp.veicTransp.UF := sUFPlacaTra;
              { VOLUME }
              with Transp.Vol.Add do
              begin
                qVol := dm.QNFQUANTIDADE_NF.AsInteger;
                esp := trim(dm.QNFESPECIE_NF.AsString);
                marca := trim(dm.QNFMARCA_NF.AsString);
                nVol := trim(dm.QNFNUMERO_NF.AsString);
                pesoL := dm.QNFPESO_LIQUIDO_NF.AsCurrency;
                pesoB := dm.QNFPESO_BRUTO_NF.AsCurrency;
              end;
         end;

      { NOTAS REFERENCIADAS }
//      if Ide.finNFe = fnDevolucao then
  //       begin
            if dm.IBTransaction.Active then
              dm.IBTransaction.Commit;
            dm.IBTransaction.StartTransaction;
            dm.QConsulta.close;
            dm.QConsulta.sql.Clear;
            dm.QConsulta.sql.Text :=
              'SELECT * FROM NOTA_FISCAL_REF ' +
              'WHERE COD_EMP=:COD_EMP AND COD_NF=:COD_NF';
            dm.QConsulta.Parambyname('COD_NF').AsInteger := iCodigoNotaFiscal;
            dm.QConsulta.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
            dm.QConsulta.open;
            dm.QConsulta.First;
            while not DM.QConsulta.Eof do
                begin
                  Ide.NFref.Add.refNFe := dm.QConsulta.FieldByName('CHAVE').AsString;
                  InfoADD.Add(
                     'NF referenciada: ' +
                     dm.QConsulta.FieldByName('CHAVE').AsString );
                  DM.QConsulta.Next;
                end;
            dm.QConsulta.Close;
            DM.IBTransaction.Commit;
      //   end;


      { DUPLICATAS }
      if dm.IBTransaction.Active then
        dm.IBTransaction.Commit;
      dm.IBTransaction.StartTransaction;
      dm.QConsulta.close;
      dm.QConsulta.sql.Clear;
      dm.QConsulta.sql.Text :=
        'SELECT * from FATURAS_NOTAS_FISCAIS WHERE COD_NF = :CODNF ' +
        'ORDER BY VENCIMENTO';

      dm.QConsulta.Parambyname('codnf').AsInteger := iCodigoNotaFiscal;
      dm.QConsulta.open;
      dm.QConsulta.Last;
      dm.QConsulta.first;

      if (not dm.QConsulta.IsEmpty) AND (dm.QConsulta.recordCount > 1) then
      begin
        Ide.indPag := ipPrazo;
        while not dm.QConsulta.eof do
        begin
          with Cobr.Dup.Add do
          begin
            nDup := dm.QConsulta.fieldbyname('PARCELA').AsString;
            dVenc := dm.QConsulta.fieldbyname('VENCIMENTO').AsDateTime;
            vDup := dm.QConsulta.fieldbyname('VALOR').AsCurrency;
          end;
          dm.QConsulta.next;
        end;
      end
      else
      begin
        if dm.QConsulta.fieldbyname('VENCIMENTO').AsDateTime <= Date then
        begin
          Ide.indPag := ipVista;
          Cobr.Fat.nFat := dm.QNFNUMERO_NOTA_NF.AsString;
          Cobr.Fat.vOrig := dm.QNFVALOR_TOTAL_NF.AsCurrency;
          Cobr.Fat.vDesc := 0.00;
          Cobr.Fat.vLiq := dm.QNFVALOR_TOTAL_NF.AsCurrency;

        end
        else
        begin
          Ide.indPag := ipPrazo;
          while not dm.QConsulta.eof do
          begin
            with Cobr.Dup.Add do
            begin
              nDup := dm.QConsulta.fieldbyname('PARCELA').AsString;
              dVenc := dm.QConsulta.fieldbyname('VENCIMENTO').AsDateTime;
              vDup := dm.QConsulta.fieldbyname('VALOR').AsCurrency;
            end;
            dm.QConsulta.next;
          end;

        end;

      end;

      dm.IBTransaction.Commit;
      dm.QConsulta.close;

      { Informações complementares }
      if sMD5 <> '' then
          InfoADD.Add(
             'MD-5:' + sMD5 + #13 + dm.QNFINF_COMPL_NF.AsString )
      else
          InfoADD.Add( dm.QNFINF_COMPL_NF.AsString );
       InfAdic.infCpl := InfoADD.DelimitedText;

  {    InfAdic.infCpl := InfAdic.infCpl + SlineBreak +
        dm.QNFOBS_SIMPL_REGIME.AsString;}
    end;
    dm.ACBrNFe1.NotasFiscais.GerarNFe;
    dm.ACBrNFe1.NotasFiscais.Items[0].GravarXML();
    dm.ACBrNFe1.NotasFiscais.GravarXML();
    dm.ACBrNFe1.NotasFiscais.Assinar;
    dm.ACBrNFe1.NotasFiscais.Validar;
    chave2 := dm.ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID;
    dm.ACBrNFe1.NotasFiscais.Items[0].GravarXML();

    { atualiza chave e protoco }
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;
    try
      try
        with dm.QConsulta do
        begin
          close;
          sql.Clear;
          sql.Text := 'UPDATE NOTA_FISCAL ' + 'SET CHAVE2 = :CHAVE ' +
            'WHERE COD_NF = :CODNF';
          Parambyname('chave').AsString := trim(chave2);
          Parambyname('codnf').AsInteger := iCodigoNotaFiscal;
          ExecOrOpen;
        end;
        dm.IBTransaction.Commit;
      except
        dm.IBTransaction.Rollback;
        KDialog('Erro gravando a Chave2');
      end;
    finally
      dm.QConsulta.close;
    end;

    // SALVA O XML
        dm.ACBrNFe1.NotasFiscais.GravarXML();

    { envia }
    try
        IDEPEC := 0;
    //    dm.ACBrNFe1.WebServices.Enviar.Lote := '1';
  //      dm.ACBrNFe1.WebServices.Enviar.Sincrono := ( SincronoNFe = 'S' );
        if SincronoNFe = 'S' then
        begin
            try
                 if dm.ACBrNFe1.Enviar( 1, False, SincronoNFe = 'S' ) then
                    begin
                       if ( dm.ACBrNFe1.WebServices.Enviar.cStat  = 0 ) and
                       ( dm.ACBrNFe1.WebServices.Retorno.cStat  > 0 ) then
                          begin
                              if dm.ACBrNFe1.WebServices.Retorno.cStat = 100 then
                                begin
                                     dm.AtualizaStatusNfe(iCodigoNotaFiscal, 'STATUS_TRANSMITIDA', 'NULL');
                                      dm.AtualizaStatusNfe(iCodigoNotaFiscal, 'STATUS_RETORNO', 'NULL');
                                    // dm.ACBrNFe1.WebServices.Envia(dm.QNFNUMERO_NOTA_NF.AsInteger);
                                    if dm.ACBrNFe1.NotasFiscais.Items[0].Confirmada then
                                    begin
                                        dm.ACBrNFe1.NotasFiscais.GravarXML();
                                      dm.ACBrNFe1.NotasFiscais.Items[0].Imprimir;
                                      dm.ACBrNFe1.NotasFiscais.ImprimirPDF;
                                    end;

                                end
                             else
                                begin
                                     KDialog( 'Nota Rejeitada' + sLineBreak +
                                     IntToStr( dm.ACBrNFe1.WebServices.Retorno.cStat) + '-' +
                                     dm.ACBrNFe1.WebServices.Retorno.xMotivo);
                                      Exit;
                                      Abort;
                                end;
                          end
                       else
                          begin
                             if dm.ACBrNFe1.WebServices.Enviar.cStat = 100 then
                                begin
                                     dm.AtualizaStatusNfe(iCodigoNotaFiscal, 'STATUS_TRANSMITIDA', 'NULL');
                                      dm.AtualizaStatusNfe(iCodigoNotaFiscal, 'STATUS_RETORNO', 'NULL');
                                    // dm.ACBrNFe1.WebServices.Envia(dm.QNFNUMERO_NOTA_NF.AsInteger);
                                    if dm.ACBrNFe1.NotasFiscais.Items[0].Confirmada then
                                    begin
                                          dm.ACBrNFe1.NotasFiscais.GravarXML();
                                      dm.ACBrNFe1.NotasFiscais.Items[0].Imprimir;
                                      dm.ACBrNFe1.NotasFiscais.ImprimirPDF;
                                    end;

                                end
                             else
                                begin
                                     KDialog( 'Nota Rejeitada' + sLineBreak +
                                     IntToStr( dm.ACBrNFe1.WebServices.Enviar.cStat) + '-' +
                                     dm.ACBrNFe1.WebServices.Enviar.xMotivo);
                                      Exit;
                                      Abort;
                                end;
                          end;
                    end
                  else
                    begin
                       if ( dm.ACBrNFe1.WebServices.Enviar.cStat  = 0 ) and
                       ( dm.ACBrNFe1.WebServices.Retorno.cStat  > 0 ) then
                         KDialog( 'Nota Rejeitada' + sLineBreak +
                         IntToStr( dm.ACBrNFe1.WebServices.Retorno.cStat) + '-' +
                         dm.ACBrNFe1.WebServices.Retorno.xMotivo)
                       else
                         KDialog( 'Nota Rejeitada' + sLineBreak +
                         IntToStr( dm.ACBrNFe1.WebServices.Enviar.cStat) + '-' +
                         dm.ACBrNFe1.WebServices.Enviar.xMotivo);

                          Exit;
                          Abort;
                    end;

            except
                       if ( dm.ACBrNFe1.WebServices.Enviar.cStat  = 0 ) and
                       ( dm.ACBrNFe1.WebServices.Retorno.cStat  > 0 ) then
                         KDialog( 'Nota Rejeitada' + sLineBreak +
                         IntToStr( dm.ACBrNFe1.WebServices.Retorno.cStat) + '-' +
                         dm.ACBrNFe1.WebServices.Retorno.xMotivo)
                       else
                         KDialog( 'Nota Rejeitada' + sLineBreak +
                         IntToStr( dm.ACBrNFe1.WebServices.Enviar.cStat) + '-' +
                         dm.ACBrNFe1.WebServices.Enviar.xMotivo);

                          Exit;
                          Abort;
            end;
        end
        else
        begin
            dm.ACBrNFe1.WebServices.Enviar.Lote := '1';
            dm.ACBrNFe1.WebServices.Enviar.Sincrono := False;
            if not dm.ACBrNFe1.WebServices.Enviar.Executar then
            begin
              KDialog('Erro no Envio' + #13 +
              IntToStr( dm.ACBrNFe1.WebServices.Enviar.cStat ) + sLineBreak +
              dm.ACBrNFe1.WebServices.Enviar.xMotivo);
              Abort;
            end
            else
              dm.AtualizaStatusNfe(iCodigoNotaFiscal, 'STATUS_TRANSMITIDA', 'NULL');

            dm.ACBrNFe1.WebServices.Retorno.Recibo :=
              dm.ACBrNFe1.WebServices.Enviar.Recibo;
            if not dm.ACBrNFe1.WebServices.Retorno.Executar then
            begin
              KDialog('Problemas no Retorno' + #13 +
                IntToStr( dm.ACBrNFe1.WebServices.Retorno.cStat ) + sLineBreak +
                dm.ACBrNFe1.WebServices.Retorno.xMotivo);
            end
            else
              dm.AtualizaStatusNfe(iCodigoNotaFiscal, 'STATUS_RETORNO', 'NULL');
            // dm.ACBrNFe1.WebServices.Envia(dm.QNFNUMERO_NOTA_NF.AsInteger);
            if dm.ACBrNFe1.NotasFiscais.Items[0].Confirmada then
            begin
                  dm.ACBrNFe1.NotasFiscais.GravarXML();
              dm.ACBrNFe1.NotasFiscais.Items[0].Imprimir;
              dm.ACBrNFe1.NotasFiscais.ImprimirPDF;
            end;
        end;
      // seu codigo
    except
      on e: exception do
      begin
        KDialog('Erro ao enviar NF-e' + #13 + e.message);
        if (pos('rejeicao', lowercase(e.message)) > 0) or
          (pos('rejeição', lowercase(e.message)) > 0) then
        begin
          if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
          dm.IBTransaction.StartTransaction;
          dm.Limpa.close;
          dm.Limpa.Parambyname('CODNF').AsInteger := iCodigoNotaFiscal;
          dm.Limpa.ExecOrOpen;
          dm.Limpa.close;
          dm.IBTransaction.Commit;
        end;

      end;
    end;

    if dm.ACBrNFe1.NotasFiscais.Items[0].Confirmada then
    begin

      sChave := dm.acbrnfe1.NotasFiscais.Items[0].NFe.procNFe.chNFe;
      sProtrocolo :=  dm.acbrnfe1.NotasFiscais.Items[0].NFe.procNFe.nProt;
      { atualiza chave e protoco }
      if dm.IBTransaction.Active then
        dm.IBTransaction.Commit;
      dm.IBTransaction.StartTransaction;
      try
        try
          with dm.QConsulta do
          begin
            close;
            sql.Clear;
            sql.Text := 'UPDATE NOTA_FISCAL ' +
              'SET CHAVE_ACESSO_NFE = :CHAVE, PROTOCOLO_NFE = :PROTO, DEPEC = :IDEPEC, HORA_SAIDA_NF=current_time '
              + 'WHERE COD_NF = :CODNF';
            Parambyname('chave').AsString := trim(sChave);
            Parambyname('proto').AsString := trim(sProtrocolo);
            Parambyname('codnf').AsInteger := iCodigoNotaFiscal;
            Parambyname('IDEPEC').AsInteger := IDEPEC;
            ExecOrOpen;
          end;
          dm.IBTransaction.Commit;
        except
          dm.IBTransaction.Rollback;
          KDialog('Erro gravando a Chave e o Protrocolo da NFe');
        end;
      finally
        dm.QConsulta.close;
      end;
    end;
  finally
     FreeAndNil( InfoADD );
  end;

  // dm.ACBrNFe1.NotasFiscais.ImprimirPDF;

  dm.ACBrNFe1.NotasFiscais.Clear;
  dm.QbuscaItensNF.Close;

end;

procedure EnviarrCarta(COD, COD_NF: integer);
Var
  sAmbienteNfe: string;
  sNatureza: string;
  iAux, Tipo_emp: integer;
  JC: String;
  DPEC: boolean;
  Chave, idLote, codOrgao, CNPJ, nSeqEvento, Correcao: string;
  Retorno: String;
  Protocolo: String;
  DataHora: Tdatetime;
  TempSalva: Boolean;
begin
  { busca parametros }
  if not Dm.ConfiguraNFe( dm.AcbrNfe1 ) then
     Exit;
  if not dm.VerificaWebServices( DM.ACBrNFe1 ) then
     Exit;
  { BUSCA CARTA }
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    dm.QConsulta.close;
    dm.QConsulta.sql.Clear;
    dm.QConsulta.sql.Text := 'SELECT * FROM NOTA_FISCAL_CCE WHERE COD=:COD';
    dm.QConsulta.Parambyname('COD').AsInteger := COD;
    dm.QConsulta.open;
    if dm.QConsulta.IsEmpty then
    begin
      dm.IBTransaction.Rollback;
      KDialog('Carta de correção não encontrada!');
      exit;
    end;
    Chave := trim(OnlyNumber(dm.QConsulta.fieldbyname('CHAVE').AsString));
    { if not ValidarChave(Chave) then
      begin
      MessageDlg('Chave Inválida.', mtError, [mbok], 0);
      exit;
      end; }
    idLote := '1';
    codOrgao := copy(Chave, 1, 2);
    CNPJ := copy(Chave, 7, 14);
    nSeqEvento := dm.QConsulta.fieldbyname('SEQ').AsString;
    Correcao := dm.QConsulta.fieldbyname('CORRECAO').AsString;
    dm.ACBrNFe1.EventoNFe.Evento.Clear;
    with dm.ACBrNFe1.EventoNFe.Evento.Add do
    begin
      infEvento.chNFe := Chave;
      infEvento.cOrgao := strtoint(codOrgao);
      infEvento.CNPJ := CNPJ;
      infEvento.dhEvento := now;
      infEvento.tpEvento := teCCe;
      infEvento.nSeqEvento := strtoint(nSeqEvento);
      infEvento.versaoEvento := '1.00';

      infEvento.detEvento.xCorrecao := Correcao;

    end;
    dm.ACBrNFe1.EventoNFe.GerarXML;
    dm.QConsulta.close;
    dm.IBTransaction.Commit;
  except
    on e: exception do
    begin
      dm.IBTransaction.Rollback;
      KDialog('Erro ao Buscar Carta' + #13 + e.message);
      exit;
    end;
  end;

  if (frmStatusNfe = nil) then
    frmStatusNfe := TfrmStatusNfe.Create(nil);
  frmStatusNfe.lblStatus.Caption := 'Enviando CC-e';
  frmStatusNfe.Show;
  frmStatusNfe.BringToFront;
  Sleep(100);
  Application.ProcessMessages;
  TempSalva := DM.ACBrNFe1.Configuracoes.Arquivos.Salvar;
  DM.ACBrNFe1.Configuracoes.Arquivos.Salvar := true;
  dm.ACBrNFe1.EnviarEvento(strtoint(idLote));
  DM.ACBrNFe1.Configuracoes.Arquivos.Salvar := TempSalva;
  frmStatusNfe.close;
  // dm.ACBrNFe1.WebServices.CartaCorrecao.Executar;

  if dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.cStat = 128 then
  begin
    if dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0]
      .RetInfEvento.cStat = 573 then
    begin
      showmessage
        ('Esta Carta de correção ja existe enviei um nova para substir');

      dm.QConsulta.close;
      dm.QConsulta.sql.Clear;
      dm.QConsulta.sql.Text :=
        'UPDATE NOTA_FISCAL_CCE SET PROTOCOLO=:PROT, DATA_AUT=:DATA,' +
        'HORA_AUT=:HORA, RETORNO=:RET, STATUS_TRANSMITIDA=:S where COD=:COD';
      dm.QConsulta.Parambyname('PROT').AsString := Protocolo;
      dm.QConsulta.Parambyname('DATA').AsDate := DataHora;
      dm.QConsulta.Parambyname('HORA').AsTime := DataHora;
      dm.QConsulta.Parambyname('RET').AsString := Retorno;
      dm.QConsulta.Parambyname('S').AsString := 'S';
      dm.QConsulta.Parambyname('COD').AsInteger := COD;
      dm.QConsulta.ExecOrOpen;
      dm.QConsulta.close;
      dm.IBTransaction.Commit;
      exit;
    end;
    if dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0]
      .RetInfEvento.cStat = 135 then
    begin
      Protocolo := dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.
        Items[0].RetInfEvento.nProt;
      DataHora := dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.
        Items[0].RetInfEvento.dhRegEvento;
      Retorno := dm.ACBrNFe1.WebServices.EnvEvento.RetornoWS;
      if dm.IBTransaction.Active then
        dm.IBTransaction.Commit;
      dm.IBTransaction.StartTransaction;
      try
        dm.QConsulta.close;
        dm.QConsulta.sql.Clear;
        dm.QConsulta.sql.Text :=
          'update nota_fiscal_cce set STATUS_TRANSMITIDA=:S where not COD=:COD and COD_NF=:COD_NF';
        dm.QConsulta.Parambyname('COD').AsInteger := COD;
        dm.QConsulta.Parambyname('COD_NF').AsInteger := COD_NF;
        dm.QConsulta.Parambyname('S').AsString := 'C';
        dm.QConsulta.ExecOrOpen;
        dm.QConsulta.close;
        dm.QConsulta.sql.Clear;
        dm.QConsulta.sql.Text :=
          'UPDATE NOTA_FISCAL_CCE SET PROTOCOLO=:PROT, DATA_AUT=:DATA,' +
          'HORA_AUT=:HORA, RETORNO=:RET, STATUS_TRANSMITIDA=:S where COD=:COD';
        dm.QConsulta.Parambyname('PROT').AsString := Protocolo;
        dm.QConsulta.Parambyname('DATA').AsDate := DataHora;
        dm.QConsulta.Parambyname('HORA').AsTime := DataHora;
        dm.QConsulta.Parambyname('RET').AsString := Retorno;
        dm.QConsulta.Parambyname('S').AsString := 'A';
        dm.QConsulta.Parambyname('COD').AsInteger := COD;
        dm.QConsulta.ExecOrOpen;
        dm.QConsulta.close;
        dm.IBTransaction.Commit;
        KDialog('Carta enviada' + #13 +
          inttostr(dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.
          Items[0].RetInfEvento.cStat) + ':' +
          dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0]
          .RetInfEvento.xMotivo);
        FrmGerenciamentoNFe.btnImpCarta.Click;
      except
        on e: exception do
        begin
          dm.IBTransaction.Rollback;
          KDialog('Erro ao atualizar carta' + #13 + e.message);
          exit;
        end;
      end;
    end
    else
    begin
      KDialog('Carta não autorizada' + #13 +
        inttostr(dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items
        [0].RetInfEvento.cStat) + ':' + dm.ACBrNFe1.WebServices.EnvEvento.
        EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo);

    end;

  end
  else
  begin
    KDialog('Erro ao processar Lote' + #13 +
      inttostr(dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.cStat) + ':' +
      dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.xMotivo);

  end;
end;

end.
