unit UImportaVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, DB, DBClient, StrUtils, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TfrmImportaVenda = class(TForm)
    btnImporta: TButton;
    dsCliente: TClientDataSet;
    dsClienteCod: TStringField;
    dsClientenome: TStringField;
    dsClientecpf: TStringField;
    dsClienteendereco: TStringField;
    dsClientebairro: TStringField;
    dsClientecidade: TStringField;
    dsClienteestado: TStringField;
    dsClientecep: TStringField;
    dsClienterg: TStringField;
    dsClientefone: TStringField;
    dsProduto: TClientDataSet;
    dsProdutoCodigo: TStringField;
    dsProdutodescricao: TStringField;
    dsProdutounidade: TStringField;
    dsProdutovalor: TCurrencyField;
    dsProdutodesconto: TCurrencyField;
    dsProdutoquantidade: TFloatField;
    dsProdutoaliquota: TStringField;
    dsProdutobarra: TStringField;
    dsProdutocst: TStringField;
    dsProdutotipo_producao: TStringField;
    dsProdutopesado: TStringField;
    dsProdutoibpt: TCurrencyField;
    dsformas: TClientDataSet;
    dsformasforma: TStringField;
    dsformasvalor: TCurrencyField;
    upCLiente: TFDUpdateSQL;
    QClientes: TFDQuery;
    QClientesCOD_CLI: TIntegerField;
    QClientesFJ_CLI: TStringField;
    QClientesNOME_CLI: TStringField;
    QClientesENDRES_CLI: TStringField;
    QClientesBAIRES_CLI: TStringField;
    QClientesCIDRES_CLI: TStringField;
    QClientesESTRES_CLI: TStringField;
    QClientesCEPRES_CLI: TStringField;
    QClientesTELRES_CLI: TStringField;
    QClientesCNPJ_CLI: TStringField;
    QClientesDOC_CLI: TStringField;
    QClientesLIMITE_CLI: TBCDField;
    QClientesATIVO_CLI: TStringField;
    QClientesCOD_CON: TIntegerField;
    QClientesOBS_VENDA: TStringField;
    QClientesOBS_CLI: TStringField;
    QClientesATRAZO_MAXIMO_CLI: TIntegerField;
    QClientesIMP_SALDO_PENDENTE_CLI: TStringField;
    QClientesLIMITE_CHEQUE: TBCDField;
    QClientesTIPO_CREDITO_CLI: TStringField;
    QClientesCONTROLAR_LIMITE: TStringField;
    QClientesBLOQUEADO_CLI: TStringField;
    QProdutos: TFDQuery;
    QProdutosCOD_PRO: TIntegerField;
    QProdutosATIVO_PRO: TStringField;
    QProdutosVALOR_PRO: TBCDField;
    QProdutosPROMOCAO_PRO: TBCDField;
    QProdutosPRECO_PRAZO_PRO: TBCDField;
    QProdutosNOME_PRO: TStringField;
    QProdutosDESC_CUPOM: TStringField;
    QProdutosPRODUTO_PESADO_PRO: TStringField;
    QProdutosCOD_NCM: TStringField;
    QProdutosTIPO_PRODUCAO: TStringField;
    QProdutosCOD_PRODUTO_ESTOQUE: TIntegerField;
    QProdutosCODIGO_BARRA_PRO: TStringField;
    QProdutosICMS_CF_EST: TIntegerField;
    QProdutosCODIGO_UNIDADE_SAIDA: TIntegerField;
    QProdutosREFERENCIA_PRO: TStringField;
    QProdutosCST_CF_EST: TStringField;
    QProdutosLOCALIZACAO_PRO: TStringField;
    QProdutosCAMINHO_FOTO_PRO: TStringField;
    QProdutosALIQ_IBPT_NAC: TBCDField;
    QProdutosALIQ_IBPT_IMP: TBCDField;
    upProdutos: TFDUpdateSQL;
    Qaux: TFDQuery;
    QEstoque: TFDQuery;
    QEstoqueCOD_PRO: TIntegerField;
    QEstoqueESTOQUE: TBCDField;
    QEstoqueDATA_ESTOQUE: TDateField;
    QEstoqueCOD_EMP: TIntegerField;
    QEstoqueCODIGO_LOCAL_ESTOQUE: TIntegerField;
    QEstoqueESTOQUE_INICIAL: TBCDField;
    upEstoque: TFDUpdateSQL;
    dsProdutoNCM: TStringField;
    dsProdutoordem: TAutoIncField;
    IBSQL1: TFDQuery;
    QInsOrcamento: TFDQuery;
    QInsOrcamentoSEQUENCIA: TLargeintField;
    QInsOrcamentoCODIGO: TIntegerField;
    List: TListBox;
    dsformastipovenda: TIntegerField;
    dsChequesContas: TClientDataSet;
    dsChequesContasPARCELA: TIntegerField;
    dsChequesContasTIPO: TStringField;
    dsChequesContasVALOR: TCurrencyField;
    dsChequesContasVENCIMENTO: TDateField;
    dsChequesContasNUM: TStringField;
    PegaCS: TFDQuery;
    PegaCSCODIGO: TIntegerField;
    PegaCSSEQUENCIA: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure AbreArquivo;
    procedure VerificaCliente;
    procedure TrataCliente( Linha: String );
    procedure TrataProduto( Linha: String );
    procedure TrataForma( Linha: String );
    function InsereCliente: Boolean;
    procedure btnImportaClick(Sender: TObject);
        function BuscaIcms(Aliquota: String): Integer;
    function BuscaUnidade(Unidade: String): Integer;
    function InsereProduto: Boolean;
    function InsereOrcamento: Integer;
    procedure ListaArquivos( Pasta: String );
    function TemAtributo(Attr, Val: Integer): Boolean;
    procedure FormCreate(Sender: TObject);
    procedure AbrirArquviCaminho( Caminho: STring );
    procedure TrataVenda( Linha : String );
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TrataParcelas( LINHA: string );
    procedure ColocaArquivoNaLista( NomeArq: string );
  private
    { Private declarations }
  public
    { Public declarations }
    Arquivo: TStrings;
    iForma: Integer;
    VarAux: string;
    CodVendVenda: Integer;
  end;

var
  frmImportaVenda: TfrmImportaVenda;

implementation

uses
  UDM, UVendasCaixa, UDialog;

{$R *.dfm}


function TfrmImportaVenda.BuscaIcms(Aliquota: string): Integer;
begin
  if ( Aliquota = '' ) then
     begin
        raise Exception.Create('Arquivo com Aliquota inválida!');
     end
  else
  if ( Aliquota = 'FF' ) then
    begin
        Qaux.Close;
        Qaux.SQL.Text := 'Select * from GRUPO_ICMS where TIPO_GRP=:ALIQ';
        Qaux.ParamByName('ALIQ').AsString := 'ST';
        Qaux.Open;
        if Qaux.IsEmpty then
          Result := 0
        else
          Result := Qaux.FieldByName('COD_GRP').AsInteger;
        Qaux.Close;
    end
  else
  if ( Aliquota = 'NN' ) then
    begin
        Qaux.Close;
        Qaux.SQL.Text := 'Select first 1 * from GRUPO_ICMS where TIPO_GRP=:ALIQ';
        Qaux.ParamByName('ALIQ').AsString := 'OUT';
        Qaux.Open;
        if Qaux.IsEmpty then
          Result := 0
        else
          Result := Qaux.FieldByName('COD_GRP').AsInteger;
        Qaux.Close;
    end
  else
  if ( Aliquota = 'II' ) then
    begin
        Qaux.Close;
        Qaux.SQL.Text := 'Select first 1 * from GRUPO_ICMS where TIPO_GRP=:ALIQ';
        Qaux.ParamByName('ALIQ').AsString := 'ISE';
        Qaux.Open;
        if Qaux.IsEmpty then
          Result := 0
        else
          Result := Qaux.FieldByName('COD_GRP').AsInteger;
        Qaux.Close;
    end
  else
    begin
        Qaux.Close;
        Qaux.SQL.Text := 'Select * from GRUPO_ICMS where ALIQUOTA_GRP=:ALIQ';
        Qaux.ParamByName('ALIQ').AsFloat := StrToFloat( Aliquota );
        Qaux.Open;
        if Qaux.IsEmpty then
          Result := 0
        else
          Result := Qaux.FieldByName('COD_GRP').AsInteger;
        Qaux.Close;
    end;
end;

function TfrmImportaVenda.BuscaUnidade(Unidade: String): Integer;
var
  Cod: Integer;
begin
  Qaux.Close;
  Qaux.SQL.Text := 'Select * from UNIDADE_MEDIDA where DESCRICAO=:DESCRICAO';
  Qaux.ParamByName('DESCRICAO').AsString := Unidade;
  Qaux.Open;
  if Qaux.IsEmpty then
     begin
        Qaux.Close;
        Qaux.SQL.Text := 'Select max( CODIGO ) from UNIDADE_MEDIDA';
        Qaux.Open;
        Cod := Qaux.FieldByName( 'max' ).AsInteger + 1;
        Qaux.Close;
        Qaux.SQL.Text := 'insert into UNIDADE_MEDIDA( CODIGO, DESCRICAO ) values( :COD, :DES )';
        Qaux.ParamByName( 'COD').AsInteger := Cod;
        Qaux.ParamByName( 'DES' ).AsString := Unidade;
        Qaux.ExecOrOpen;
        Result := Cod;

     end
  else
    Result := Qaux.FieldByName('CODIGO').AsInteger;
  Qaux.Close;
end;

procedure TfrmImportaVenda.ColocaArquivoNaLista( NomeArq: string );
var
   Arq: TStrings;
   I: Integer;
   Carrega: TStrings;
   Linha : string;
   ListaA: string;
   Total: Double;
begin
//

   Total := 0;
   Arq := TStringList.Create;
   Arq.LoadFromFile( NomeArq );
   for I := 0 to Arq.Count -1 do
       begin
          if Copy( Arq[I], 1, 3 ) = '"C"' then
             begin
                 Linha := StringReplace(
                  StringReplace(Copy( Arq[I], 5, length(  Arq[I] ) - 5 ), '"', '',
                                        [rfReplaceAll, rfIgnoreCase]), '.', '',
                                        [ rfReplaceAll, rfIgnoreCase ] );
                 Carrega := TStringList.Create;
                 Carrega.Delimiter := ';';
                 Carrega.StrictDelimiter := True;
                 Carrega.DelimitedText := Linha;
                 ListaA := ExtractFileName( NomeArq ) + ' ( ' + Carrega[1]  ;
                 Carrega.Free;

             end;
       end;
    for I := 0 to Arq.Count -1 do
                   begin
                      if Copy( Arq[I], 1, 3 ) = '"R"' then
                         begin
                              Linha := StringReplace(
                               StringReplace(Copy( Arq[I], 5,
                                   length(  Arq[I] ) - 5 ), '"', '',
                                  [rfReplaceAll, rfIgnoreCase]), '.', '',
                                        [ rfReplaceAll, rfIgnoreCase ] );
                               Carrega := TStringList.Create;
                               Carrega.Delimiter := ';';
                               Carrega.StrictDelimiter := True;
                               Carrega.DelimitedText := Linha;
                               Total := Total + StrToFloat( StringReplace( Carrega[2], '.', '', [ rfReplaceAll, rfIgnoreCase ])  );
                               Carrega.Free;
                         end;
                   end;
   ListaA := ListaA + '  ' + FormatFloat( 'R$ ,0.00', Total ) + ' )';
   List.Items.Add( ListaA );

   Arq.Free;;
end;

function TfrmImportaVenda.TemAtributo(Attr, Val: Integer): Boolean;
begin
   Result := Attr and Val = Val;
end;

function TfrmImportaVenda.InsereCliente: Boolean;
begin
  //
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  QClientes.SQL.Text := 'select first 1 * from cliente where COD_CLI=:COD';
  QClientes.ParamByName( 'COD' ).AsInteger := dsClienteCod.AsInteger;
  QClientes.Open;
  if QClientes.IsEmpty then
  begin
               ShowMessage( ' Cliente não encontrado:' +
                  dsClienteCod.AsString );
                dm.IBTransaction.Commit;
                Result := False;
                Exit;

      try
        QClientes.Insert;
        if length(dsClientecpf.AsString) > 14 then
          QClientesFJ_CLI.AsString := 'J'
        else
          QClientesFJ_CLI.AsString := 'F';
        QClientesCOD_CLI.AsInteger := dsClienteCod.AsInteger;
        QClientesATIVO_CLI.AsString := 'S';
        QClientesCOD_CON.AsInteger := 1;
        QClientesNOME_CLI.AsString := dsClientenome.AsString;
        QClientesENDRES_CLI.AsString := dsClienteendereco.AsString;
        QClientesBAIRES_CLI.AsString := dsClientebairro.AsString;
        QClientesCIDRES_CLI.AsString := dsClientecidade.AsString;
        QClientesESTRES_CLI.AsString := dsClienteestado.AsString;
        QClientesCEPRES_CLI.AsString := dsClientecep.AsString;
        QClientesTELRES_CLI.AsString := dsClientefone.AsString;
        QClientesCNPJ_CLI.AsString := dsClientecpf.AsString;
        QClientesDOC_CLI.AsString := dsClienterg.AsString;
        QClientesIMP_SALDO_PENDENTE_CLI.AsString := 'N';
        QClientesTIPO_CREDITO_CLI.AsString := 'PC';
        QClientesCONTROLAR_LIMITE.AsString := 'N';
          QClientesBLOQUEADO_CLI.AsString := 'N';
        QClientes.Post;
        QClientes.Close;
        dm.IBTransaction.Commit;
        Result := True;
      except
        on E: Exception do
        begin
          QClientes.Close;
          dm.IBTransaction.Rollback;
          ShowMessage(
            '   Erro inserindo cliente COD: ' + dsClienteCod.AsString + ' M:' +
            E.Message);
            Result := False;
        end;

      end;
  end
  else
   begin
      QClientes.Close;
       dm.IBTransaction.Commit;
        Result := True;

   end;

end;


function TfrmImportaVenda.InsereOrcamento: Integer;
var
 PCodigo: Integer;
 PSequencia: Integer;
 Tpv: Integer;
begin

  if not dm.IBDatabaseServer.Connected then
     begin
        KDialog( 'Servidor não está acessível!' + #13 + 'DAV não disponível', 'Servidor Inativo', 'ERRO' );
        exit;
     end
  else
     begin

        begin
              if dm.IBTRServer.Active then
                 dm.IBTRServer.Commit;
              dm.IBTRServer.StartTransaction;

              PegaCS.Close;
              PegaCS.open;
              PSequencia := PegaCSSEQUENCIA.AsInteger;
              PCodigo := PegaCSCODIGO.AsInteger;
              PegaCS.Close;

              dm.IBTRServer.Commit;
        end;
     end;
                 if dm.IBTransaction.Active then
                    dm.IBTransaction.Commit;
                  dm.IBTransaction.StartTransaction;
                     with QInsOrcamento do
                     begin
                        dsformas.First;
                        tpv := dsformastipovenda.AsInteger;
                        close;
                        Parambyname('data').AsDate       := Date;
                        Parambyname('codcli').AsInteger  := dsClienteCod.AsInteger;
                        Parambyname('codtpv').AsInteger  := Tpv;
                        Parambyname('codemp').AsInteger  := iEmp;
                        Parambyname('codvend').AsInteger := CodVendVenda;
                        Parambyname('caixa').AsInteger   := iCaixa;
                        ParamByName('C').AsInteger       := PCodigo;
                        ParamByName('S').AsInteger       := PSequencia;
                        Open;
                        if VarAux <> '' then
                            begin
                                IBSQL1.Close;
                                IBSQL1.SQL.Text := 'UPDATE ORCAMENTO SET AUXILIAR=:AUX where CODIGO=:COD';
                                IBSQL1.ParamByName( 'COD' ).AsInteger := QInsOrcamentoCODIGO.AsInteger;
                                IBSQL1.ParamByName( 'AUX' ).AsString := VarAux;
                                IBSQL1.ExecOrOpen;
                            end;

                     end;
                   dsProduto.First;
                   while not dsProduto.Eof do
                   begin
                         with IBSQL1 do
                         begin
                             Close;
                             sql.Clear;
                             sql.Add('INSERT INTO ITENS_ORCAMENTO (CODIGO, ORDEM, COD_PRO, DESCONTO, ' +
                                    'COD_EMP, QUANT, VALOR, PRODUTO_PROMOCAO, CANCELADO) ' +
                                    'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, 0)');
                              Parambyname('1').AsInteger  := QInsOrcamentoCODIGO.AsInteger;
                              Parambyname('2').AsInteger  := dsProdutoordem.AsInteger;
                              Parambyname('3').AsInteger  := dsProdutoCodigo.AsInteger;
                              Parambyname('4').AsCurrency := dsProdutodesconto.AsCurrency;
                              Parambyname('5').AsInteger  := iEmp;
                              Parambyname('6').AsCurrency := dsProdutoquantidade.AsFloat;
                              Parambyname('7').AsCurrency := dsProdutovalor.AsCurrency;
                              Parambyname('8').AsString:= 'N';
                              ExecOrOpen;
                         end;
                      dsProduto.Next;
                   end;
                   Result      := QInsOrcamentoCODIGO.AsInteger;
                  dm.IBTransaction.Commit;

end;

function TfrmImportaVenda.InsereProduto: Boolean;
var
  ProxCod: Integer;
  CodIcms, CodUnidade: Integer;
begin
  //

  dsproduto.First;
  while not dsProduto.Eof do
  begin
        if dm.IBTransaction.Active then
          dm.IBTransaction.Commit;
        dm.IBTransaction.StartTransaction;

        CodIcms := BuscaIcms( dsProdutoaliquota.AsString );
        CodUnidade := BuscaUnidade(Trim(dsProdutounidade.AsString));
        if CodIcms = 0 then
        begin
         ShowMessage( '   ICMS Não Encontrado :' +
            dsProdutoaliquota.AsString );
          dm.IBTransaction.Commit;
          Result := False;
          Exit;
        end;

        QProdutos.SQL.Text := 'select first 1 * from produto where COD_PRO=:COD';
        QProdutos.ParamByName( 'COD' ).AsInteger := dsProdutoCodigo.AsInteger;
        QProdutos.Open;

        try
          if QProdutos.IsEmpty then
          begin
               ShowMessage( ' Produto não encontrado:' +
                  dsProdutoCodigo.AsString );
                dm.IBTransaction.Commit;
                Result := False;
                Exit;

                QProdutos.Insert;
                QProdutosCOD_PRO.AsInteger := dsProdutoCodigo.AsInteger;
                QProdutosATIVO_PRO.AsString := 'S';
                QProdutosVALOR_PRO.AsCurrency := dsProdutovalor.ascurrency;
                QProdutosPROMOCAO_PRO.AsCurrency :=0;
                QProdutosPRECO_PRAZO_PRO.AsCurrency := dsProdutovalor.ascurrency;
                QProdutosNOME_PRO.AsString := dsProdutodescricao.AsString;
                QProdutosDESC_CUPOM.AsString := dsProdutodescricao.AsString;
                  QProdutosPRODUTO_PESADO_PRO.AsString := dsProdutopesado.AsString;
                QProdutosCOD_NCM.AsString := dsProdutoNCM.AsString;
                QProdutosTIPO_PRODUCAO.AsString := dsProdutotipo_producao.AsString;
                QProdutosCOD_PRODUTO_ESTOQUE.AsInteger := dsProdutoCodigo.AsInteger;
                if Trim(dsProdutobarra.AsString) = '' then
                  QProdutosCODIGO_BARRA_PRO.AsString := dsProdutoCodigo.AsString
                else
                  QProdutosCODIGO_BARRA_PRO.AsString := dsProdutobarra.AsString;
                QProdutosICMS_CF_EST.AsInteger := CodIcms; //
                QProdutosALIQ_IBPT_NAC.AsFloat := dsProdutoIBPT.AsFloat;
                QProdutosCODIGO_UNIDADE_SAIDA.AsInteger := CodUnidade; //
                QProdutosREFERENCIA_PRO.AsString := '';
                QProdutosCST_CF_EST.AsString := dsProdutocst.AsString;

                QProdutos.Post;
          end;

          QEstoque.Close;
          QEstoque.ParamByName('cod_pro').AsInteger := dsProdutoCodigo.AsInteger;
          QEstoque.Open;
          if QEstoque.IsEmpty then
          begin
            QEstoque.Insert;
            QEstoqueCOD_PRO.AsInteger := dsProdutoCodigo.AsInteger;
            QEstoqueDATA_ESTOQUE.AsDateTime := Date;
            QEstoqueESTOQUE.AsFloat := dsProdutoquantidade.asfloat;
            QEstoqueCOD_EMP.AsInteger := iEmp;
            QEstoqueCODIGO_LOCAL_ESTOQUE.AsInteger := 1;
            QEstoqueESTOQUE_INICIAL.AsFloat :=
              dsProdutoquantidade.asfloat;
            QEstoque.Post;
          end
          else
          begin
            QEstoque.Edit;
            QEstoqueESTOQUE.AsFloat := dsProdutoquantidade.asfloat;
            QEstoqueCOD_EMP.AsInteger := iEmp;
            QEstoqueCODIGO_LOCAL_ESTOQUE.AsInteger := 1;
            QEstoqueESTOQUE_INICIAL.AsFloat :=
              dsProdutoquantidade.asfloat;
            QEstoque.Post;
          end;
          QEstoque.Close;
          dm.IBTransaction.Commit;
        except
          on E: Exception do
          begin
            QProdutos.Close;
            dm.IBTransaction.Rollback;
            ShowMessage( '  Erro inserindo Produto COD: ' + dsProdutoCodigo.AsString +
              ' M:' + E.Message);
              Result := False;
              Exit;
          end;

        end;
        dsproduto.Next;
  end;
  Result := true;
end;

procedure TfrmImportaVenda.ListaArquivos(Pasta: String);
var

  F: TSearchRec;

  Ret: Integer;

  TempNome: string;

begin
  List.Clear;
  Ret := FindFirst(Pasta+'\*.txt', faAnyFile, F);

  try

    while Ret = 0 do

    begin

      if TemAtributo(F.Attr, faDirectory) then

      begin



      end

      else

      begin

          //List.Items.Add( F.Name );
          ColocaArquivoNaLista( Pasta + '\' + F.Name );
      end;

        Ret := FindNext(F);

    end;

  finally

  begin

    FindClose(F);

  end;

  end;
end;





procedure TfrmImportaVenda.AbreArquivo;
begin
//
    Arquivo := TStringList.Create;
    Arquivo.LoadFromFile( dm.PastaArqVends +  Copy(  List.Items[ List.ItemIndex ], 1,
      Pos( '.txt', List.Items[ List.ItemIndex ]) + 3 ));

end;

procedure TfrmImportaVenda.AbrirArquviCaminho(Caminho: STring);
var
   FormaC: TFormasC;
   Desc: STring;
   Tipo: STring;
begin
//
    Arquivo := TStringList.Create;
    Arquivo.LoadFromFile( Caminho );
    VerificaCliente;
   if InsereCliente then
      begin
         if InsereProduto then
           begin
              if dsformasforma.AsString = 'Dinheiro' then
                 iForma := dm.BuscaFormaPagamento('DN')
              else
                 iForma := dm.BuscaFormaPagamento('PR');
              FrmVendasCaixa.ImprimeOrcamento( InsereOrcamento );
              iFormaPagamento := iForma;
              ListaFormas :=  TListaFormas.Create;
              dsformas.First;
              while not dsformas.Eof do
                  begin
                      if Pos( 'CARTAO', UpperCase( dsformasforma.AsString ) ) > 0  then
                         begin
                            Desc := 'CARTAO';
                            TIPO := 'CA';
                         end
                      else
                      if Pos( 'CHEQUE', UpperCase(dsformasforma.AsString) ) > 0  then
                         begin
                            Desc := 'CHEQUE';
                            TIPO := 'CH';
                         end
                      else
                      if Pos( 'PRAZO', UpperCase(dsformasforma.AsString ) ) > 0  then
                         begin
                            Desc := 'PRAZO';
                            TIPO := 'PR';
                         end
                      else
                      if Pos( 'DINHEIRO', UpperCase(dsformasforma.AsString )) > 0  then
                         begin
                            Desc := 'DINHEIRO';
                            TIPO := 'DN';
                         end
                      else
                      if Pos( 'TICKET', UpperCase(dsformasforma.AsString )) > 0  then
                         begin
                            Desc := 'TICKET';
                            TIPO := 'TI';
                         end;
                      FormaC := TFormasC.Create;
                      FormaC.Forma := Desc;
                      FormaC.Valor := dsformasvalor.AsFloat;
                      FormaC.Tipo := Tipo;
                      ListaFormas.Add( FormaC );
                      dsformas.Next;
                  end;
              Arquivo.Free;
              DeleteFile( Caminho ) ;
//              Close;
           end;
      end;
end;

procedure TfrmImportaVenda.btnImportaClick(Sender: TObject);
var
   CodOrc: Integer;
   FormaC: TFormasC;
   ParcelaC: TParcelas;

   Desc: STring;
   Tipo: STring;
begin
  cDescontoCtrlI := 0;
  cAcrescimoCtrlI := 0;
  if  not  btnImporta.Enabled then
     Exit;
  if List.ItemIndex = -1  then
     exit;
  if Not FileExists( dm.PastaArqVends + Copy(  List.Items[ List.ItemIndex ], 1,
      Pos( '.txt', List.Items[ List.ItemIndex ]) + 3 )) then
      Exit;
   btnImporta.Enabled := False;
   AbreArquivo;
   VerificaCliente;
   if InsereCliente then
      begin
         if InsereProduto then
           begin
              if dsformasforma.AsString = 'Dinheiro' then
                 iForma := dm.BuscaFormaPagamento('DN')
              else
                 iForma := dm.BuscaFormaPagamento('PR');
              FrmVendasCaixa.ImprimeOrcamento( InsereOrcamento );
              iFormaPagamento := iForma;
              ListaFormas :=  TListaFormas.Create;
              ListaParcelas := TListaParcelas.Create;
              dsformas.First;
              while not dsformas.Eof do
                  begin
                      if Pos( 'CARTAO', UpperCase( dsformasforma.AsString ) ) > 0  then
                         begin
                            Desc := 'CARTAO';
                            TIPO := 'CA';
                         end
                      else
                      if Pos( 'CHEQUE', UpperCase(dsformasforma.AsString) ) > 0  then
                         begin
                            Desc := 'CHEQUE';
                            TIPO := 'CH';
                            ParcelaC := TParcelas.Create;
                            ParcelaC.Parcela := 1;
                            ParcelaC.Tipo := 'CH';
                            ParcelaC.Valor := dsformasvalor.AsCurrency;
                            ParcelaC.Vencimento := Date;
                            ParcelaC.DataPagamento := Date;
                            ParcelaC.ValorPago := dsformasvalor.AsCurrency;
                            ParcelaC.Num := 'N/A';
                            ListaParcelas.Add( ParcelaC );
                         end
                      else
                      if Pos( 'PRAZO', UpperCase(dsformasforma.AsString ) ) > 0  then
                         begin
                            Desc := 'PRAZO';
                            TIPO := 'PR';
                         end
                      else
                      if Pos( 'DINHEIRO', UpperCase(dsformasforma.AsString )) > 0  then
                         begin
                            Desc := 'DINHEIRO';
                            TIPO := 'DN';
                         end
                      else
                      if Pos( 'TICKET', UpperCase(dsformasforma.AsString )) > 0  then
                         begin
                            Desc := 'TICKET';
                            TIPO := 'TI';
                         end;
                      FormaC := TFormasC.Create;
                      FormaC.Forma := Desc;
                      FormaC.Valor := dsformasvalor.AsCurrency;
                      FormaC.Tipo := Tipo;
                      ListaFormas.Add( FormaC );
                      dsformas.Next;
                  end;
              dsChequesContas.First;

              while not dsChequesContas.Eof do
                  begin
                      ParcelaC := TParcelas.Create;
                      ParcelaC.Parcela := dsChequesContasPARCELA.AsInteger;
                      ParcelaC.Tipo := dsChequesContasTIPO.AsString;
                      ParcelaC.Valor := dsChequesContasVALOR.AsCurrency;
                      ParcelaC.Vencimento := dsChequesContasVENCIMENTO.AsDateTime;
                      ParcelaC.Num := dsChequesContasNUM.AsString;
                      ParcelaC.ValorPago := 0;
                      ListaParcelas.Add( ParcelaC );
                      dsChequesContas.Next;
                  end;

              Arquivo.Free;
              DeleteFile( dm.PastaArqVends +  Copy(  List.Items[ List.ItemIndex ], 1,
              Pos( '.txt', List.Items[ List.ItemIndex ]) + 3 ) ) ;
              Close;
           end;
      end;
      btnImporta.Enabled := True;
end;

procedure TfrmImportaVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree ;
end;

procedure TfrmImportaVenda.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
  CodVendVenda := 0;
end;

procedure TfrmImportaVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = VK_ESCAPE then
      begin
         Close;
      end;
end;

procedure TfrmImportaVenda.FormShow(Sender: TObject);
begin

  ListaArquivos( dm.PastaArqVends );
end;

procedure TfrmImportaVenda.TrataCliente(Linha: String);
var
   Carrega: TStrings;
begin
//
   Linha := StringReplace( StringReplace(Linha, '"', '',
                          [rfReplaceAll, rfIgnoreCase]), '.', '',
                                        [ rfReplaceAll, rfIgnoreCase ] );
   Carrega := TStringList.Create;
   Carrega.Delimiter := ';';
   Carrega.StrictDelimiter := True;
   Carrega.DelimitedText := Linha;
   dsCliente.Close;
   dsCliente.CreateDataSet;
   dsCliente.Open;
   dsCliente.EmptyDataSet;
   dsCliente.Insert;
   dsClienteCod.AsString := Carrega[0];
   dsClientenome.AsString := Carrega[1];
   dsClientecpf.AsString := Carrega[2];
   dsClienteendereco.AsString := Carrega[3];
   dsClientebairro.AsString := Carrega[4];
   dsClientecidade.AsString := Carrega[5];
   dsClienteestado.AsString := Carrega[6];
   dsClientecep.AsString := Carrega[10];
   dsClienterg.AsString := Carrega[11];
   dsClientefone.AsString := Carrega[12];
   dsCliente.Post;
   Carrega.Free;
end;

procedure TfrmImportaVenda.TrataForma(Linha: String);
 var
   Carrega: TStrings;
begin
//
   Linha := StringReplace( StringReplace(Linha, '"', '',
                          [rfReplaceAll, rfIgnoreCase]), '.', '',
                                        [ rfReplaceAll, rfIgnoreCase ] );
   Carrega := TStringList.Create;
   Carrega.Delimiter := ';';
   Carrega.StrictDelimiter := True;
   Carrega.DelimitedText := Linha;
   dsformas.Insert;

   dsformasforma.AsString := Carrega[1];
   dsformasvalor.AsString := Carrega[2];
   dsformastipovenda.AsString := Carrega[4];

   dsformas.Post;
   Carrega.Free;
end;

procedure TfrmImportaVenda.TrataParcelas(LINHA: string);
 var
   Carrega: TStrings;
begin
   Linha := StringReplace( StringReplace(Linha, '"', '',
                          [rfReplaceAll, rfIgnoreCase]) , '.', '',
                                        [ rfReplaceAll, rfIgnoreCase ] );
   Carrega := TStringList.Create;
   Carrega.Delimiter := ';';
   Carrega.StrictDelimiter := True;
   Carrega.DelimitedText := Linha;
   dsChequesContas.Insert;
   dsChequesContasPARCELA.AsString := Carrega[0];
   dsChequesContasTIPO.AsString := Carrega[1];
   dsChequesContasVALOR.AsString := Carrega[2];
   dsChequesContasVENCIMENTO.AsString := Carrega[3];
   dsChequesContasNUM.AsString := Carrega[4];
   dsChequesContas.Post;
   Carrega.Free;
end;

procedure TfrmImportaVenda.TrataProduto(Linha: String);
 var
   Carrega: TStrings;
begin
//
   Linha := StringReplace( StringReplace(Linha, '"', '',
                          [rfReplaceAll, rfIgnoreCase]), '.', '',
                                        [ rfReplaceAll, rfIgnoreCase ] );
   Carrega := TStringList.Create;
   Carrega.Delimiter := ';';
   Carrega.StrictDelimiter := True;
   Carrega.DelimitedText := Linha;
   dsProduto.Insert;
   dsProdutoCodigo.AsString := Carrega[0];
   dsProdutodescricao.AsString := Carrega[1];
   dsProdutounidade.AsString := Carrega[3];
   dsProdutovalor.AsString := Carrega[4];
   dsProdutodesconto.AsString := Carrega[5];
   if dsProdutodesconto.AsCurrency > 0 then
      begin
         cDescontoCtrlI := 0;
         cAcrescimoCtrlI := 0;
      end;
//   dsProdutodesconto.AsCurrency := 0;
   dsProdutoquantidade.AsString := Carrega[6];
   dsProdutoaliquota.AsString := Carrega[7];
   dsProdutobarra.AsString := Carrega[9];
   dsProdutocst.AsString := Carrega[10] + Carrega[11];
   dsProdutotipo_producao.AsString := Carrega[15];
   dsProdutopesado.AsString := Carrega[18];
   dsProdutoibpt.AsString := Carrega[19];
   dsProduto.Post;
   Carrega.Free;
end;

procedure TfrmImportaVenda.TrataVenda(Linha: String);
var

   Carrega: TStrings;
begin
//
   Linha := StringReplace( StringReplace(Linha, '"', '',
                          [rfReplaceAll, rfIgnoreCase]), '.', '',
                                        [ rfReplaceAll, rfIgnoreCase ] );
   Carrega := TStringList.Create;
   Carrega.Delimiter := ';';
   Carrega.StrictDelimiter := True;
   Carrega.DelimitedText := Linha;
   VarAux := Carrega[4];
   CodVendVenda := StrToInt( IfThen( Carrega[5] = '', '1', Carrega[5] ) );
         cDescontoCtrlI := StrToFloat( IfThen( Trim( Carrega[6] ) = '', '0', Carrega[6] ));
         cAcrescimoCtrlI := StrToFloat( IfThen( Trim( Carrega[7] ) = '', '0', Carrega[7] ));
   Carrega.Free;
end;

procedure TfrmImportaVenda.VerificaCliente;
var
   I: Integer;
begin
   dsProduto.Close;
   dsProduto.CreateDataSet;
   dsProduto.Open;
   dsProduto.EmptyDataSet;


   for I := 0 to Arquivo.Count -1 do
       begin
          if Copy( Arquivo[I], 1, 3 ) = '"V"' then
             begin
                TrataVenda( Copy( Arquivo[I], 5, length(  Arquivo[I] ) - 5 ) );
                Break;
             end;
       end;
   for I := 0 to Arquivo.Count -1 do
       begin
          if Copy( Arquivo[I], 1, 3 ) = '"C"' then
             begin
                TrataCliente( Copy( Arquivo[I], 5, length(  Arquivo[I] ) - 5 ) );
                Break;
             end;
       end;
   for I := 0 to Arquivo.Count -1 do
       begin
          if Copy( Arquivo[I], 1, 3 ) = '"P"' then
             begin
                TrataProduto( Copy( Arquivo[I], 5, length(  Arquivo[I] ) - 5 ) );
             end;
       end;


   dsformas.Close;
   dsformas.CreateDataSet;
   dsformas.Open;
   dsformas.EmptyDataSet;

   for I := 0 to Arquivo.Count -1 do
       begin
          if Copy( Arquivo[I], 1, 3 ) = '"R"' then
             begin
                TrataForma( Copy( Arquivo[I], 5, length(  Arquivo[I] ) - 5 ) );
             end;
       end;

   dsChequesContas.Close;
   dsChequesContas.CreateDataSet;
   dsChequesContas.Open;
   dsChequesContas.EmptyDataSet;

   for I := 0 to Arquivo.Count -1 do
       begin
          if Copy( Arquivo[I], 1, 3 ) = '"H"' then
             begin
                TrataParcelas( Copy( Arquivo[I], 5, length(  Arquivo[I] ) - 5 ) );
             end;
       end;
end;

end.
