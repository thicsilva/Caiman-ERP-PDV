unit UDicFluxo;

interface

uses
   Windows, Variants, System.Classes, frxClass, Vcl.Printers, Winapi.WinSpool,
   FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
    FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
    FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands,
    FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, System.SysUtils,
    FireDAC.Comp.DataSet, System.IOUtils, Vcl.Forms,
    cxGridTableView, cxGridDBTableView, cxGrid, Grids, DBGrids, System.StrUtils,
    Vcl.ExtCtrls, UNovosComponentes, UMultiThreadNew, System.Rtti, UDicLib,
    Vcl.Controls;

type
   TDicFluxo = class;
   TDicFluxoVerificaCaixa = ( tfvNaoAberto, tfvAberto, tfvPrecidaFechar, tfvNenhum );
   TDicFluxoAbertura = class( TObject )
       private
          FDicFluxo: TDicFluxo;
          FSaldoAnterior: Currency;
          procedure GravaConferencia( FechaCaixa: TForm );
       public
          function SaldoAnterior: Currency;
          function VeficaCaixa: TDicFluxoVerificaCaixa;
          function VerificarVendas: Boolean;
          procedure AbrirCaixa;
          procedure FecharCaixa;
          function LocalizaCaixaUsuario: Integer;
          constructor Create(AOwner: TDicFluxo);
   end;
   TDicPlanoConta = record
       Gravar: Boolean;
       Plano: String;
   end;
   TDicFluxoMovimentos = class( TObject )
       private
          FDicFluxo: TDicFluxo;
       public
          function BuscaForma( DescForma: String ): Integer;
          function BuscaPlanoContas( Modulo, SubModulo: String ): TDicPlanoConta;
          function BuscaPlanoContasForma( CodForma: Integer; Modulo, SubModulo: String ): TDicPlanoConta;
          function GravarMovimentoForma( Modulo, SubModulo, Descricao: String;
             CodForma: Integer;
             Valor: Currency;
             Documento: string ): Boolean;
          function GravarMovimento( Modulo, SubModulo, Descricao: String;
             CodForma: Integer;
             Valor: Currency;
             Documento: string ): Boolean; overload;
          function GravarMovimento( Modulo, SubModulo, Descricao: String;
             DescForma: String;
             Valor: Currency;
             Documento: string ): Boolean; overload;
          constructor Create(AOwner: TDicFluxo);
   end;
   TDicFluxo = class( TObject )
       private
          FConection: TFDConnection;
       public
           CaixaAberto: Boolean;
           CodCaixa: Integer;
           DescCaixa, DescUsu: String;
           CodUsuario: Integer;
           CodMovimentos: Integer;
           CodEmp: Integer;
           TipoCaixa: Integer;
           TrazerSaldo: Boolean;
           AberturaFechamento: TDicFluxoAbertura;
           Movimentos: TDicFluxoMovimentos;
           SaldoFormas: Currency;
           SaldoInicial: Currency;
           SaldoFinal: Currency;
           SaldoSangria: Currency;
           DATA_ABRE: TDateTime;
           DATA_FECHA: TDateTime;
           PERIODO_INI: TDateTime;
           PERIODO_FIM: TDateTime;
           procedure LogOff;
           constructor Create( Conection: TFDConnection );
           destructor Destroy; override;
   end;

var
  DicFluxo: TDicFluxo;

implementation

{ TDicFluxo }

uses UDM, UDialog, UAbreCaixa, UFechaCaixa;

constructor TDicFluxo.Create( Conection: TFDConnection );
begin
   inherited Create;
   FConection := Conection;
   CodCaixa := 0;
   CodUsuario := 0;
   CodMovimentos := 0;
   TipoCaixa := 0;
   DescCaixa := '';
   DescUsu := '';
   TrazerSaldo := False;
   CodEmp := iEmp;
   AberturaFechamento := TDicFluxoAbertura.Create( Self );
   Movimentos := TDicFluxoMovimentos.Create( Self );
end;

destructor TDicFluxo.Destroy;
begin
  FreeAndNil( AberturaFechamento );
  FreeAndNil( Movimentos );
  inherited;
end;

procedure TDicFluxo.LogOff;
begin
   CodCaixa := 0;
   CodUsuario := 0;
   CodMovimentos := 0;
   SaldoFormas := 0;
   SaldoInicial := 0;
   SaldoFinal := 0;
   SaldoSangria := 0;
   TipoCaixa := 0;
   DescCaixa := '';
   DescUsu := '';
   TrazerSaldo := False;
end;

{ TDicFluxoAbertura }

procedure TDicFluxoAbertura.AbrirCaixa;
var
   Caixa: TfrmAbreCaixa;
   ParConec: TDicParConexao;
   DataHora: TDateTime;
begin
   FSaldoAnterior := SaldoAnterior;
   Caixa := TfrmAbreCaixa.Create( nil, FDicFluxo);
   try
      case FDicFluxo.TipoCaixa of
          0,1: Caixa.pnlPeriodo.Enabled := False;
          2: Caixa.pnlPeriodo.Enabled := True;
      end;
      Caixa.lblCaixa.Caption := Format(
        '%d - %s', [ FDicFluxo.CodCaixa, FDicFluxo.DescCaixa ] );
      Caixa.lblUsuario.Caption := Format(
        '%d - %s', [ FDicFluxo.CodUsuario, FDicFluxo.DescUsu ] );
      Caixa.lblSaldo.Caption := FormatFloat( 'R$ 0.00', FSaldoAnterior );
      Caixa.pnlSaldoAnterior.Visible := FDicFluxo.TrazerSaldo;
      Caixa.ShowModal;
      if Caixa.ModalResult <> mrOk then
         begin
            AlertaCad(
               'Caixa não foi aberto! ' + sLineBreak +
               'Operação Cancelada!', alertErro,  'Caixa' );
            Abort;
            Exit;
         end;
      ParConec := TDicParConexao.Create( FDicFluxo.FConection );
      try
          with ParConec do
             begin
                Query.Close;
                Query.SQL.Text :=
                   'INSERT INTO abre_fecha_caixa(' + sLineBreak +
                    'COD_EMP, COD_CAI,' + sLineBreak +
                    'COD_USU, DATA_ABRE,' + sLineBreak +
                    'HORA_ABRE, PERIODO_INI,' + sLineBreak +
                    'PERIODO_FIM, SALDO_ANTERIOR, SALDO_INICIAL,' + sLineBreak +
                    'DATA_HORA_ABRE )' + sLineBreak +
                    'VALUES(' + sLineBreak +
                    ':COD_EMP, :COD_CAI,' + sLineBreak +
                    ':COD_USU, :DATA_ABRE,' + sLineBreak +
                    ':HORA_ABRE, :PERIODO_INI,' + sLineBreak +
                    ':PERIODO_FIM, :SALDO_ANTERIOR, :SALDO_INICIAL,' + sLineBreak +
                    ':DATA_HORA_ABRE )' + sLineBreak +
                    'returning CODIGO';
                DataHora := Now;
                Query.ParamByName( 'COD_EMP' ).AsInteger := FDicFluxo.CodEmp;
                Query.ParamByName( 'COD_CAI' ).AsInteger := FDicFluxo.CodCaixa;
                Query.ParamByName( 'COD_USU' ).AsInteger := FDicFluxo.CodUsuario;
                Query.ParamByName( 'DATA_ABRE' ).AsDateTime := DataHora;
                Query.ParamByName( 'HORA_ABRE' ).AsDateTime := DataHora;
                Query.ParamByName( 'DATA_HORA_ABRE' ).AsDateTime := DataHora;
                Query.ParamByName( 'PERIODO_INI' ).AsDateTime := Caixa.edtDateIni.Date;
                Query.ParamByName( 'PERIODO_FIM' ).AsDateTime := Caixa.edtDateFim.Date;
                Query.ParamByName( 'SALDO_ANTERIOR' ).AsCurrency := FSaldoAnterior;
                Query.ParamByName( 'SALDO_INICIAL' ).AsCurrency := FSaldoAnterior;
                Query.Open;
                FDicFluxo.CodMovimentos := Query.FieldByName( 'CODIGO' ).AsInteger;
                FDicFluxo.CaixaAberto := True;
                if Caixa.edtSuprimento.Value > 0 then
                   FDicFluxo.Movimentos.GravarMovimento(
                     'FLUXO_SANGRIA_SUPRIMETOS',
                     'FLUXO_SUPRIMENTOS',
                     'SUPRIMENTO ABERTURA DE CAIXA',
                     'DN',
                     Caixa.edtSuprimento.Value,
                     'SUPRIMENTO' );
             end;
      finally
          FreeAndNil( ParConec );
      end;
   finally
      FreeAndNil(Caixa );
   end;
end;

constructor TDicFluxoAbertura.Create(AOwner: TDicFluxo);
begin
   FDicFluxo := AOwner;
end;

procedure TDicFluxoAbertura.FecharCaixa;
var
   Caixa: TfrmFechaCaixa;
   ParConec: TDicParConexao;
begin
   Caixa := TfrmFechaCaixa.Create( nil, FDicFluxo);
   try
      ParConec := TDicParConexao.Create( FDicFluxo.FConection );
      try
          case FDicFluxo.TipoCaixa of
              0,1: Caixa.pnlPeriodo.Enabled := False;
              2: Caixa.pnlPeriodo.Enabled := True;
          end;
          Caixa.edtDateIni.Date := FDicFluxo.PERIODO_INI;
          Caixa.edtDateFim.Date := FDicFluxo.PERIODO_FIM;
          Caixa.lblAbre.Caption := FormatDateTime( 'dd/mm/yy - hh:nn:ss', FDicFluxo.DATA_ABRE );
          Caixa.QFormas.Close;
          Caixa.QFormas.ParamByName( 'COD_MOV' ).AsInteger := FDicFluxo.CodMovimentos;
          Caixa.QFormas.Open;
          FDicFluxo.SaldoFormas := 0;
          FDicFluxo.SaldoFinal := 0;
          FDicFluxo.SaldoInicial := FSaldoAnterior;
          Caixa.QFormas.First;
          while not Caixa.QFormas.Eof do
             begin
               FDicFluxo.SaldoFormas := FDicFluxo.SaldoFormas + Caixa.QFormasSALDO.AsCurrency;
               Caixa.tempFormas.Insert;
               Caixa.tempFormascodigo.AsInteger := Caixa.QFormasCODIGO.AsInteger;
               Caixa.tempFormasdescricao.AsString := Caixa.QFormasDESCRICAO.AsString;
               if Caixa.QFormasTIPO.AsString = 'DN' then
                  Caixa.tempFormasvalor.AsCurrency := Caixa.QFormasSALDO.AsCurrency
               else
                  Caixa.tempFormasvalor.AsCurrency := Caixa.QFormasTOTAL.AsCurrency;
               Caixa.tempFormasvalor_confere.AsCurrency := 0;
               Caixa.tempFormasvalor_dif.AsCurrency := 0;
               Caixa.tempFormasvalor_saldo.AsCurrency := Caixa.QFormasSALDO.AsCurrency;
               Caixa.tempFormas.Post;
               Caixa.QFormas.Next;
             end;
          FDicFluxo.SaldoFinal := FDicFluxo.SaldoFormas + FDicFluxo.SaldoInicial;
          Caixa.edtTotInicial.Caption := FormatFloat( 'R$ 0.00 (+)', FDicFluxo.SaldoInicial );
          Caixa.edtTotFormas.Caption := FormatFloat( 'R$ 0.00 (+)', FDicFluxo.SaldoFormas );
          Caixa.edtTotFinal.Caption := FormatFloat( 'R$ 0.00 (=)', FDicFluxo.SaldoFinal );
          Caixa.lblCaixa.Caption := Format(
            '%d - %s', [ FDicFluxo.CodCaixa, FDicFluxo.DescCaixa ] );
          Caixa.lblUsuario.Caption := Format(
            '%d - %s', [ FDicFluxo.CodUsuario, FDicFluxo.DescUsu ] );
          Caixa.ShowModal;
          if Caixa.ModalResult <> mrOk then
             begin
                AlertaCad(
                   'Caixa não foi Fechado! ' + sLineBreak +
                   'Operação Cancelada!', alertErro,  'Caixa' );
                Abort;
                Exit;
             end;
          if Caixa.edtSangria.Value > 0 then
             FDicFluxo.Movimentos.GravarMovimento(
                     'FLUXO_SANGRIA_SUPRIMETOS',
                     'FLUXO_SANGRIA',
                     'SANGRIA FECHAMENTO DE CAIXA',
                     'DN',
                     Caixa.edtSangria.Value,
                     'SANGRIA' );
          GravaConferencia( Caixa );
          with ParConec do
             begin
                Query.Close;
                Query.SQL.Text :=
                  'UPDATE ABRE_FECHA_CAIXA SET' + sLineBreak +
                  'DATA_HORA_FECHA=:DATA,' + sLineBreak +
                  'HORA_FECHA=:DATA,' + sLineBreak +
                  'DATA_FECHA=:DATA,' + sLineBreak +
                  'SALDO_FINAL=:SALDO_FINAL' + sLineBreak +
                  'WHERE CODIGO=:COD_MOV AND COD_EMP=:COD_EMP AND COD_CAI=:COD_CAI;';
                Query.ParamByName( 'DATA' ).AsDateTime := Now;
                Query.ParamByName( 'SALDO_FINAL' ).AsCurrency := FDicFluxo.SaldoFinal;
                Query.ParamByName( 'COD_MOV' ).AsInteger := FDicFluxo.CodMovimentos;
                Query.ParamByName( 'COD_EMP' ).AsInteger := FDicFluxo.CodEmp;
                Query.ParamByName( 'COD_CAI' ).AsInteger := FDicFluxo.CodCaixa;
                Query.ExecSQL;
             end;
           FDicFluxo.LogOff;
           FDicFluxo.CodUsuario := iCodUsu;
           FDicFluxo.CodEmp := iEmp;
           DicFluxo.LogOff;
           DicFluxo.CodUsuario := iCodUsu;
           DicFluxo.CodEmp :=   iEmp;
      finally
          FreeAndNil( ParConec );
      end;
   finally
      FreeAndNil(Caixa );
   end;
end;

procedure TDicFluxoAbertura.GravaConferencia(FechaCaixa: TForm );
var
   ParConec: TDicParConexao;
begin
   ParConec := TDicParConexao.Create( FDicFluxo.FConection );
   try
      with ParConec do
         begin
            Query.Close;
            Query.SQL.Text :=
                  'UPDATE OR INSERT INTO ABRE_FECHA_CAIXA_CONFERE( COD_MOV ,' + sLineBreak +
                  'COD_FORMA     ,' + sLineBreak +
                  'COD_EMP       ,' + sLineBreak +
                  'COD_CAI       ,' + sLineBreak +
                  'VALOR         ,' + sLineBreak +
                  'VALOR_CONFERE )' + sLineBreak +
                  'VALUES' + sLineBreak +
                  '( :COD_MOV       ,' + sLineBreak +
                  ':COD_FORMA     ,' + sLineBreak +
                  ':COD_EMP       ,' + sLineBreak +
                  ':COD_CAI       ,' + sLineBreak +
                  ':VALOR         ,' + sLineBreak +
                  ':VALOR_CONFERE   ) MATCHING ( COD_MOV, COD_FORMA )';
            TfrmFechaCaixa( FechaCaixa ).tempFormas.First;
            while not TfrmFechaCaixa( FechaCaixa ).tempFormas.Eof do
                begin
                   Query.Close;
                   Query.ParamByName( 'COD_MOV' ).AsInteger := FDicFluxo.CodMovimentos;
                   Query.ParamByName( 'COD_FORMA' ).AsInteger :=
                      TfrmFechaCaixa( FechaCaixa ).tempFormascodigo.AsInteger;
                   Query.ParamByName( 'COD_EMP' ).AsInteger :=
                      FDicFluxo.CodEmp;
                   Query.ParamByName( 'COD_CAI' ).AsInteger :=
                      FDicFluxo.CodCaixa;
                   Query.ParamByName( 'VALOR' ).AsCurrency :=
                      TfrmFechaCaixa( FechaCaixa ).tempFormasvalor.AsCurrency;
                   Query.ParamByName( 'VALOR_CONFERE' ).AsCurrency :=
                      TfrmFechaCaixa( FechaCaixa ).tempFormasvalor_confere.AsCurrency;
                   Query.ExecSQL;
                   TfrmFechaCaixa( FechaCaixa ).tempFormas.Next;
                end;
            Query.Close;
         end;
   finally
      FreeAndNil( ParConec );
   end;
end;

function TDicFluxoAbertura.LocalizaCaixaUsuario: Integer;
var
   ParConec: TDicParConexao;
begin
   Result := 0;
   ParConec := TDicParConexao.Create( FDicFluxo.FConection );
   try
      with ParConec do
         begin
             Query.Close;
             Query.SQL.Text :=
                'SELECT CXU.*, CX.fluxo_tipo, CX.desc_cai,' + sLineBreak +
                'CX.fluxo_salto_anterior, U.nome_usu' + sLineBreak +
                'FROM CAIXA_USUARIOS CXU' + sLineBreak +
                'INNER JOIN CAIXA CX' + sLineBreak +
                'ON( CX.cod_cai = CXU.cod_cai' + sLineBreak +
                'and CX.cod_emp=CXU.cod_emp )' + sLineBreak +
                'INNER JOIN USUARIO U' + sLineBreak +
                'ON( U.cod_usu=CXU.cod_usu )' + sLineBreak +
                'WHERE CXU.COD_EMP=:COD_EMP' + sLineBreak +
                'AND CXU.COD_USU=:COD_USU';
             Query.ParamByName( 'COD_EMP' ).AsInteger := FDicFluxo.CodEmp;
             Query.ParamByName( 'COD_USU' ).AsInteger := FDicFluxo.CodUsuario;
             Query.Open;
             if Query.IsEmpty then
                 begin
                    AlertaCad(
                       'Caixa de usuário não definido! ' + sLineBreak +
                       'Operação Cancelada!', alertErro,  'Falha Caixa' );
                    Result := 0;
                    Abort;
                    Exit;
                 end;
             FDicFluxo.TipoCaixa := Query.FieldByName( 'fluxo_tipo' ).AsInteger;
             FDicFluxo.DescCaixa := Query.FieldByName( 'desc_cai' ).AsString;
             FDicFluxo.DescUsu := Query.FieldByName( 'nome_usu' ).AsString;
             FDicFluxo.TrazerSaldo := Query.FieldByName( 'fluxo_salto_anterior' ).AsString = 'S';
             FDicFluxo.CodCaixa := Query.FieldByName( 'COD_CAI' ).AsInteger;
             Result := Query.FieldByName( 'COD_CAI' ).AsInteger;
         end;
   finally
      FreeAndNil( ParConec );
   end;
end;
function TDicFluxoAbertura.SaldoAnterior: Currency;
var
   ParConec: TDicParConexao;
begin
   Result := 0;
   ParConec := TDicParConexao.Create( FDicFluxo.FConection );
   try
      with ParConec do
         begin
             Query.Close;
             Query.SQL.Text :=
                'SELECT FIRST 1 CX.* FROM ABRE_FECHA_CAIXA CX' + sLineBreak +
                'where CX.COD_EMP=:COD_EMP' + sLineBreak +
                'AND CX.COD_CAI=:COD_CAI' + sLineBreak +
                'AND CX.DATA_FECHA IS NOT NULL' + sLineBreak +
                'ORDER BY CX.CODIGO DESC';
             Query.ParamByName( 'COD_EMP' ).AsInteger := FDicFluxo.CodEmp;
             Query.ParamByName( 'COD_CAI' ).AsInteger := FDicFluxo.CodCaixa;
             Query.Open;
             if Query.IsEmpty then
                 begin
                    Exit;
                 end;
             Result := Query.FieldByName( 'SALDO_FINAL' ).AsCurrency;
         end;
   finally
      FreeAndNil( ParConec );
   end;
end;

function TDicFluxoAbertura.VeficaCaixa: TDicFluxoVerificaCaixa;
var
   ParConec: TDicParConexao;
begin
   Result := tfvNenhum;
   FDicFluxo.CaixaAberto := False;
   FDicFluxo.CodCaixa := LocalizaCaixaUsuario;
   ParConec := TDicParConexao.Create( FDicFluxo.FConection );
   try
      with ParConec do
         begin
             Query.Close;
             Query.SQL.Text :=
                'SELECT FIRST 1 CX.* FROM ABRE_FECHA_CAIXA CX' + sLineBreak +
                'where CX.COD_EMP=:COD_EMP' + sLineBreak +
                'AND CX.COD_CAI=:COD_CAI' + sLineBreak +
                'AND CX.DATA_FECHA IS NULL' + sLineBreak +
                'ORDER BY CX.CODIGO DESC';
             Query.ParamByName( 'COD_EMP' ).AsInteger := FDicFluxo.CodEmp;
             Query.ParamByName( 'COD_CAI' ).AsInteger := FDicFluxo.CodCaixa;
             Query.Open;
             if Query.IsEmpty then
                 begin
                    {if not KDialog( 'Caixa não está aberto deseja abrir o caixa?',
                      'Abertura de Caixa', tdtPergunta ) then
                       begin
                          AlertaCad(
                             'Caixa não aberto! ' + sLineBreak +
                             'Operação Cancelada!', alertErro, 'Caixa' );
                          Abort;
                          Exit;
                       end;}
                    AlertaCad( 'Caixa Precisa ser Aberto!', alertFinanceiroRed, 'Caixa', True );
                    Result := tfvNaoAberto;
                    Exit;
                 end;
             FDicFluxo.CodMovimentos := Query.FieldByName( 'CODIGO' ).AsInteger;
             FDicFluxo.PERIODO_INI := Query.FieldByName( 'PERIODO_INI' ).AsDateTime;
             FDicFluxo.PERIODO_FIM := Query.FieldByName( 'PERIODO_FIM' ).AsDateTime;
             FDicFluxo.DATA_ABRE := Query.FieldByName( 'DATA_HORA_ABRE' ).AsDateTime;
             FSaldoAnterior := Query.FieldByName( 'SALDO_ANTERIOR' ).AsCurrency;
             FDicFluxo.CaixaAberto := True;
             if FDicFluxo.PERIODO_FIM  < Now then
                begin
                    AlertaCad( 'Caixa Precisa ser Fechado!', alertFinanceiroRed, 'Caixa', True );
                    {if not KDialog( 'Caixa Precisa Ser Fechado:' + sLineBreak +
                     'Inicio : ' + FormatDateTime( 'dd/mm/yy',
                         Query.FieldByName( 'PERIODO_INI' ).AsDateTime ) + sLineBreak +
                     'Fim : ' + FormatDateTime( 'dd/mm/yy',
                         Query.FieldByName( 'PERIODO_FIM' ).AsDateTime )+ sLineBreak +
                      'Deseja fechar o Caixa?',
                      'Fechamento de Caixa', tdtPergunta ) then
                       begin
                           AlertaCad(
                             'Caixa precisa ser fechado! ' + sLineBreak +
                             'Operação Cancelada!', alertErro, 'Caixa' );
                           Abort;
                           Exit;
                       end;    }
                    Result := tfvPrecidaFechar;
                    Exit;
                end;
             Result := tfvAberto;
         end;
   finally
      FreeAndNil( ParConec );
   end;
end;

function TDicFluxoAbertura.VerificarVendas: Boolean;
var
  Ret: TDicFluxoVerificaCaixa;
begin
   Result := False;
   Ret := VeficaCaixa;
   case Ret of
     tfvNaoAberto: begin
                      if not KDialog( 'Caixa não está aberto!' + sLineBreak +
                       'Deseja abrir o caixa?', 'Caixa', tdtPergunta ) then
                         Exit;
                      AbrirCaixa;
                       Result := VeficaCaixa = tfvAberto;
                   end;
     tfvPrecidaFechar: begin
                          if KDialog( 'Caixa Precisa Ser Fechado:' + sLineBreak +
                               'Inicio : ' + FormatDateTime( 'dd/mm/yy',
                                   DicFluxo.PERIODO_INI ) + sLineBreak +
                               'Fim : ' + FormatDateTime( 'dd/mm/yy',
                                   DicFluxo.PERIODO_FIM )+ sLineBreak +
                                'Deseja fechar o Caixa?',
                                'Fechamento de Caixa', tdtPergunta ) then
                               begin
                                    FecharCaixa;
                                    VeficaCaixa;
                                    if not KDialog( 'Caixa não está aberto!' + sLineBreak +
                                     'Deseja abrir o caixa?', 'Caixa', tdtPergunta ) then
                                       Exit;
                                    AbrirCaixa;
                                    Result := VeficaCaixa = tfvAberto;
                               end;
                       end;
     tfvNenhum: Exit;
   end;
   Result := VeficaCaixa = tfvAberto;
end;

{ TDicFluxoMovimentos }

function TDicFluxoMovimentos.BuscaForma( DescForma: String ): Integer;
var
  ParConec: TDicParConexao;
begin
   Result := 0;
   ParConec := TDicParConexao.Create( FDicFluxo.FConection );
   try
      with ParConec do
        begin
           Query.Close;
           Query.SQL.Text :=
             'SELECT * FROM FORMAS_PAGAMENTO WHERE TIPO=:TIPO';
           Query.ParamByName( 'TIPO' ).AsString := DescForma;
           Query.Open;
           if Query.IsEmpty then
              Exit;
           Result := Query.FieldByName( 'CODIGO' ).AsInteger;
        end;
   finally
      FreeAndNil( ParConec );
   end;
end;

function TDicFluxoMovimentos.BuscaPlanoContas(Modulo,
  SubModulo: String): TDicPlanoConta;
var
  ParConec: TDicParConexao;
begin
   Result.Gravar := False;
   Result.Plano := '';
   ParConec := TDicParConexao.Create( FDicFluxo.FConection );
   try
      with ParConec do
         begin
            Query.Close;
            Query.SQL.Text :=
               'SELECT *' +
               ' FROM CAIXA WHERE COD_EMP=:COD_EMP AND COD_CAI=:COD_CAI';
            Query.ParamByName( 'COD_EMP' ).AsInteger := FDicFluxo.CodEmp;
            Query.ParamByName( 'COD_CAI' ).AsInteger := FDicFluxo.CodCaixa;
            Query.Open;
            if Query.IsEmpty then
               Exit;
            try
                Result.Gravar := Query.FieldByName( Modulo ).AsString = 'S';
                Result.Plano := Query.FieldByName( SubModulo ).AsString;
                if ( Result.Plano = '' ) and ( Result.Gravar ) then
                   begin
                      AlertaCad( 'Plano de contas nao cadastrado! ' +
                        sLineBreak + SubModulo, alertErro, 'Caixa'  );
                      Result.Gravar := False;
                      Exit;
                   end;
            except
                AlertaCad( 'Erro ao buscar plano de contas! ' + sLineBreak +
                          Modulo + ':' + SubModulo, alertErro, 'Caixa'  );
                Exit;
            end;
         end;
   finally
       FreeAndNil( ParConec );
   end;
end;

function TDicFluxoMovimentos.BuscaPlanoContasForma( CodForma: Integer;
  Modulo,
  SubModulo: String): TDicPlanoConta;
var
  ParConec: TDicParConexao;
begin
   Result.Gravar := False;
   Result.Plano := '';
   ParConec := TDicParConexao.Create( FDicFluxo.FConection );
   try
      with ParConec do
         begin
            Query.Close;
            Query.SQL.Text :=
               'SELECT *' +
               ' FROM FORMAS_PAGAMENTO_FLUXO WHERE COD_EMP=:COD_EMP AND COD_FORMA=:COD_FORMA';
            Query.ParamByName( 'COD_EMP' ).AsInteger := FDicFluxo.CodEmp;
            Query.ParamByName( 'COD_FORMA' ).AsInteger := CodForma;
            Query.Open;
            if Query.IsEmpty then
               Exit;
            try
                Result.Gravar := Query.FieldByName( Modulo ).AsString = 'S';
                Result.Plano := Query.FieldByName( SubModulo ).AsString;
                if ( Result.Plano = '' ) and ( Result.Gravar ) then
                   begin
                      AlertaCad( 'Plano de contas nao cadastrado! ' +
                        sLineBreak + SubModulo, alertErro, 'Caixa'  );
                      Result.Gravar := False;
                      Exit;
                   end;
            except
                AlertaCad( 'Erro ao buscar plano de contas! ' + sLineBreak +
                          Modulo + ':' + SubModulo, alertErro, 'Caixa'  );
                Exit;
            end;
         end;
   finally
       FreeAndNil( ParConec );
   end;
end;

constructor TDicFluxoMovimentos.Create(AOwner: TDicFluxo);
begin
   FDicFluxo := AOwner;
end;

function TDicFluxoMovimentos.GravarMovimento(Modulo, SubModulo, Descricao,
  DescForma: String; Valor: Currency; Documento: string): Boolean;
var
  ParConec: TDicParConexao;
  PlanoContas: TDicPlanoConta;
  CodForma: Integer;
begin
   Result := False;
   PlanoContas := BuscaPlanoContas( Modulo, SubModulo );
   if not PlanoContas.Gravar then
       Exit;
   CodForma := BuscaForma( DescForma );
   if CodForma = 0 then
      begin
          AlertaCad(
            'Forma de pagamento Dinheiro não encontrada!' , alertErro, 'Caixa'  );
          Exit;
      end;
   ParConec := TDicParConexao.Create( FDicFluxo.FConection );
   try
      with ParConec do
        begin
           Query.Close;
           try
              try
                 Query.SQL.Text :=
                    'INSERT INTO NEWCAIXA_MOVIMENTOS(' + sLineBreak +
                    'COD_MOV, COD_EMP,' + sLineBreak +
                    'COD_CAI, COD_USU,' + sLineBreak +
                    'DESCRICAO,' + sLineBreak +
                    'MODULO, DOCUMENTO,' + sLineBreak +
                    'PLANO_CONTAS, COD_FORMA,' + sLineBreak +
                    'VALOR, CANCELADO, SUB_MODULO )' + sLineBreak +
                    'VALUES(' + sLineBreak +
                    ':COD_MOV, :COD_EMP,' + sLineBreak +
                    ':COD_CAI, :COD_USU,' + sLineBreak +
                    ':DESCRICAO,' + sLineBreak +
                    ':MODULO, :DOCUMENTO,' + sLineBreak +
                    ':PLANO_CONTAS, :COD_FORMA,' + sLineBreak +
                    ':VALOR, :CANCELADO, :SUB_MODULO )';
                 Query.ParamByName( 'COD_MOV' ).AsInteger := FDicFluxo.CodMovimentos;
                 Query.ParamByName( 'COD_EMP' ).AsInteger := FDicFluxo.CodEmp;
                 Query.ParamByName( 'COD_CAI' ).AsInteger := FDicFluxo.CodCaixa;
                 Query.ParamByName( 'COD_USU' ).AsInteger := FDicFluxo.CodUsuario;
                 Query.ParamByName( 'DESCRICAO' ).AsString := Descricao;
                 Query.ParamByName( 'MODULO' ).AsString := Modulo;
                 Query.ParamByName( 'DOCUMENTO' ).AsString := Documento;
                 Query.ParamByName( 'PLANO_CONTAS' ).AsString := PlanoContas.Plano;
                 Query.ParamByName( 'COD_FORMA' ).AsInteger := CodForma;
                 Query.ParamByName( 'VALOR' ).AsCurrency := Valor;
                 Query.ParamByName( 'CANCELADO' ).AsInteger := 0;
                 Query.ParamByName( 'SUB_MODULO' ).AsString := SubModulo;
                 Query.ExecSQL;
              except
                 on E: Exception do
                   begin
                       AlertaCad(
                          'Erro ao inserior movimento! '  + sLineBreak +
                          E.Message, alertErro, 'Caixa'  );
                       Exit;
                   end;
              end;

           except
               AlertaCad( 'Erro ao inserir movimento no caixa! ' + sLineBreak +
               Descricao, alertErro, 'Caixa' );
               Exit;
           end;
        end;
   finally
      FreeAndNil( ParConec );
   end;
end;

function TDicFluxoMovimentos.GravarMovimentoForma(Modulo, SubModulo,
  Descricao: String; CodForma: Integer; Valor: Currency;
  Documento: string): Boolean;
var
  ParConec: TDicParConexao;
  PlanoContas: TDicPlanoConta;
begin
   Result := False;
   PlanoContas := BuscaPlanoContasForma( CodForma, Modulo, SubModulo );
   if not PlanoContas.Gravar then
       Exit;
   ParConec := TDicParConexao.Create( FDicFluxo.FConection );
   try
      with ParConec do
        begin
           Query.Close;
           try
              try
                 Query.SQL.Text :=
                    'INSERT INTO NEWCAIXA_MOVIMENTOS(' + sLineBreak +
                    'COD_MOV, COD_EMP,' + sLineBreak +
                    'COD_CAI, COD_USU,' + sLineBreak +
                    'DESCRICAO,' + sLineBreak +
                    'MODULO, DOCUMENTO,' + sLineBreak +
                    'PLANO_CONTAS, COD_FORMA,' + sLineBreak +
                    'VALOR, CANCELADO, SUB_MODULO )' + sLineBreak +
                    'VALUES(' + sLineBreak +
                    ':COD_MOV, :COD_EMP,' + sLineBreak +
                    ':COD_CAI, :COD_USU,' + sLineBreak +
                    ':DESCRICAO,' + sLineBreak +
                    ':MODULO, :DOCUMENTO,' + sLineBreak +
                    ':PLANO_CONTAS, :COD_FORMA,' + sLineBreak +
                    ':VALOR, :CANCELADO, :SUB_MODULO )';
                 Query.ParamByName( 'COD_MOV' ).AsInteger := FDicFluxo.CodMovimentos;
                 Query.ParamByName( 'COD_EMP' ).AsInteger := FDicFluxo.CodEmp;
                 Query.ParamByName( 'COD_CAI' ).AsInteger := FDicFluxo.CodCaixa;
                 Query.ParamByName( 'COD_USU' ).AsInteger := FDicFluxo.CodUsuario;
                 Query.ParamByName( 'DESCRICAO' ).AsString := Descricao;
                 Query.ParamByName( 'MODULO' ).AsString := Modulo;
                 Query.ParamByName( 'DOCUMENTO' ).AsString := Documento;
                 Query.ParamByName( 'PLANO_CONTAS' ).AsString := PlanoContas.Plano;
                 Query.ParamByName( 'COD_FORMA' ).AsInteger := CodForma;
                 Query.ParamByName( 'VALOR' ).AsCurrency := Valor;
                 Query.ParamByName( 'CANCELADO' ).AsInteger := 0;
                 Query.ParamByName( 'SUB_MODULO' ).AsString := SubModulo;
                 Query.ExecSQL;
              except
                 on E: Exception do
                   begin
                       AlertaCad(
                          'Erro ao inserior movimento! '  + sLineBreak +
                          E.Message, alertErro, 'Caixa'  );
                       Exit;
                   end;
              end;

           except
               AlertaCad( 'Erro ao inserir movimento no caixa! ' + sLineBreak +
               Descricao, alertErro, 'Caixa' );
               Exit;
           end;
        end;
   finally
      FreeAndNil( ParConec );
   end;
end;

function TDicFluxoMovimentos.GravarMovimento(Modulo, SubModulo,
  Descricao: String; CodForma: Integer; Valor: Currency;
  Documento: string): Boolean;
var
  ParConec: TDicParConexao;
  PlanoContas: TDicPlanoConta;
begin
   Result := False;
   PlanoContas := BuscaPlanoContas( Modulo, SubModulo );
   if not PlanoContas.Gravar then
       Exit;
   ParConec := TDicParConexao.Create( FDicFluxo.FConection );
   try
      with ParConec do
        begin
           Query.Close;
           try
              try
                 Query.SQL.Text :=
                    'INSERT INTO NEWCAIXA_MOVIMENTOS(' + sLineBreak +
                    'COD_MOV, COD_EMP,' + sLineBreak +
                    'COD_CAI, COD_USU,' + sLineBreak +
                    'DESCRICAO,' + sLineBreak +
                    'MODULO, DOCUMENTO,' + sLineBreak +
                    'PLANO_CONTAS, COD_FORMA,' + sLineBreak +
                    'VALOR, CANCELADO, SUB_MODULO )' + sLineBreak +
                    'VALUES(' + sLineBreak +
                    ':COD_MOV, :COD_EMP,' + sLineBreak +
                    ':COD_CAI, :COD_USU,' + sLineBreak +
                    ':DESCRICAO,' + sLineBreak +
                    ':MODULO, :DOCUMENTO,' + sLineBreak +
                    ':PLANO_CONTAS, :COD_FORMA,' + sLineBreak +
                    ':VALOR, :CANCELADO, :SUB_MODULO )';
                 Query.ParamByName( 'COD_MOV' ).AsInteger := FDicFluxo.CodMovimentos;
                 Query.ParamByName( 'COD_EMP' ).AsInteger := FDicFluxo.CodEmp;
                 Query.ParamByName( 'COD_CAI' ).AsInteger := FDicFluxo.CodCaixa;
                 Query.ParamByName( 'COD_USU' ).AsInteger := FDicFluxo.CodUsuario;
                 Query.ParamByName( 'DESCRICAO' ).AsString := Descricao;
                 Query.ParamByName( 'MODULO' ).AsString := Modulo;
                 Query.ParamByName( 'DOCUMENTO' ).AsString := Documento;
                 Query.ParamByName( 'PLANO_CONTAS' ).AsString := PlanoContas.Plano;
                 Query.ParamByName( 'COD_FORMA' ).AsInteger := CodForma;
                 Query.ParamByName( 'VALOR' ).AsCurrency := Valor;
                 Query.ParamByName( 'CANCELADO' ).AsInteger := 0;
                 Query.ParamByName( 'SUB_MODULO' ).AsString := SubModulo;
                 Query.ExecSQL;
              except
                 on E: Exception do
                   begin
                       AlertaCad(
                          'Erro ao inserior movimento! '  + sLineBreak +
                          E.Message, alertErro, 'Caixa'  );
                       Exit;
                   end;
              end;

           except
               AlertaCad( 'Erro ao inserir movimento no caixa! ' + sLineBreak +
               Descricao, alertErro, 'Caixa' );
               Exit;
           end;
        end;
   finally
      FreeAndNil( ParConec );
   end;
end;

end.
