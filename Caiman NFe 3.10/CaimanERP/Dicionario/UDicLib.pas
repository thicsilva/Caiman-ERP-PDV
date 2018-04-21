unit UDicLib;

interface

uses
   Windows, Variants, System.Classes, frxClass, Vcl.Printers, Winapi.WinSpool,
   FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
    FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
    FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands,
    FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, System.SysUtils,
    FireDAC.Comp.DataSet, System.IOUtils, Vcl.Forms,
    cxGridTableView, cxGridDBTableView, cxGrid, Grids, DBGrids, System.StrUtils,
    Vcl.ExtCtrls, UNovosComponentes, UMultiThreadNew, System.Rtti;

type
    TDicParConexao = class( TObject )
       private
          FConection: TFDConnection;
       public
          Transaction: TFDTransaction;
          Query: TFDQuery;
          constructor Create( Conection: TFDConnection );
          destructor Destroy; override;
    end;
    TDicParametro = record
         Possibilidades: string;
         Valor: String;
         Tipo: string;
         Existe: Boolean;
    end;
    TDicCalc = class
         class function Dividir( vNum, vDiv: Double ): Double;
    end;
    TDicAnimacao = class
        class procedure AnimarPropriedade(Componente: TComponent;
            Propriedade: String; NovoValor, Pular, Tempo: Integer;
               const LockObj: TObject = nil);
    end;
    TDicLib = class
         class function GetParam( Emp: Integer; Modulo, Nome: String;
           Conec: TFDConnection;
           const vPadrao: string = '';
           const pPadrao: string = '';
           const dmPadrao: string = '';
           const dtPadrao: string = '';
           const dvPadrao: string = '' ): TDicParametro;
         class procedure DeleteParam( Emp: Integer; Modulo, Nome: string;
            Conec: TFDConnection );


         class function GetRel( Emp: Integer; Relatorio, Tipo: string;
           frx: TfrxReport; Conec: TFDConnection ): Boolean;
         class function SetRel( Emp: Integer; Relatorio, Tipo: string;
           frx: TfrxReport; Conec: TFDConnection ): Boolean;
         class function GetAppPath( Pasta: String ): string;
         class function StrEntre( Src, Str1, Str2: String ): string;

         class procedure GravarGridDB( iUsu: Integer;
            cxGrid: TObject; Form: TForm; Conec: TFDConnection );
         class procedure MontaTelaUsu( iUsu: Integer;
            Form: TForm; Conec: TFDConnection );
         class function ProximoCodigo( Tabela, Campo, Filtro: String;
            Conec: TFDConnection ): Integer;
         class function ProximoCodigoParans( Tabela, Campo, Filtro: String;
            Conec: TFDConnection ): Integer;
    end;

implementation

{ TDicLib }

uses UDicImp;

class procedure TDicLib.DeleteParam(Emp: Integer; Modulo, Nome: string;
  Conec: TFDConnection);
var
  Query: TFDQuery;
  TRQuery: TFDTransaction;
begin
  Query := TFDQuery.Create( nil );
  TRQuery := TFDTransaction.Create( nil );
  try
      TRQuery.Connection := Conec;
      Query.Connection := Conec;
      Query.Transaction := TRQuery;
      if not TRQuery.Active then
         TRQuery.StartTransaction;
      try
         Query.SQL.Text := 'DELETE FROM VAR_PARAMETROS' + sLineBreak +
                            'WHERE COD_EMP=:COD_EMP' + sLineBreak +
                            'AND MODULO=:MODULO' + sLineBreak +
                            'AND VARIAVEL=:VARIAVEL';
         Query.ParamByName( 'COD_EMP' ).AsInteger := Emp;
         Query.ParamByName( 'MODULO' ).AsString := Modulo;
         Query.ParamByName( 'VARIAVEL' ).AsString := Nome;
         Query.ExecSQL;
         Query.Close;
         TRQuery.Commit;
      except
         TRQuery.Rollback;
      end;
  finally
      Query.Close;
      if TRQuery.Active then
         TRQuery.Commit;
      Query.Free;
      TRQuery.Free;
  end;
end;

class function TDicLib.GetAppPath(Pasta: String): string;
begin
   Result := Tpath.Combine( ExtractFilePath( Application.Exename ), Pasta  );
end;

class function TDicLib.GetParam(Emp: Integer; Modulo, Nome: String;
           Conec: TFDConnection;
           const vPadrao: string = '';
           const pPadrao: string = '';
           const dmPadrao: string = '';
           const dtPadrao: string = '';
           const dvPadrao: string = '' ): TDicParametro;
var
  Query: TFDQuery;
  TRQuery: TFDTransaction;
begin
  Result.Existe := vPadrao <> '';
  Result.Possibilidades := pPadrao;
  Result.Valor := vPadrao;
  Result.Tipo := dtPadrao;
  Query := TFDQuery.Create( nil );
  TRQuery := TFDTransaction.Create( nil );
  try
      TRQuery.Connection := Conec;
      Query.Connection := Conec;
      Query.Transaction := TRQuery;
      if not TRQuery.Active then
         TRQuery.StartTransaction;
      try
         Query.SQL.Text := 'SELECT * FROM VAR_PARAMETROS' + sLineBreak +
                            'WHERE COD_EMP=:COD_EMP' + sLineBreak +
                            'AND MODULO=:MODULO' + sLineBreak +
                            'AND VARIAVEL=:VARIAVEL';
         Query.ParamByName( 'COD_EMP' ).AsInteger := Emp;
         Query.ParamByName( 'MODULO' ).AsString := Modulo;
         Query.ParamByName( 'VARIAVEL' ).AsString := Nome;
         Query.Open;
         if Query.IsEmpty and ( vPadrao = '' )then
            Exit
         else if Query.IsEmpty then
           begin
              Query.Close;
              Query.SQL.Text := 'INSERT INTO VAR_PARAMETROS (COD_EMP, MODULO, VARIAVEL,' + sLineBreak +
                  'DESCRICAO_MODULO, DESCRICAO_VARIAVEL, TIPO,' + sLineBreak +
                  'VALORES_POSSIVEIS, VALOR)' + sLineBreak +
                  'VALUES (' + sLineBreak +
                  ':COD_EMP, :MODULO, :VARIAVEL,' + sLineBreak +
                  ':DESCRICAO_MODULO, :DESCRICAO_VARIAVEL, :TIPO,' + sLineBreak +
                  ':VALORES_POSSIVEIS, :VALOR)';
               Query.ParamByName( 'COD_EMP' ).AsInteger := Emp;
               Query.ParamByName( 'MODULO' ).AsString := Modulo;
               Query.ParamByName( 'VARIAVEL' ).AsString := Nome;
               Query.ParamByName( 'DESCRICAO_MODULO' ).AsString := dmPadrao;
               Query.ParamByName( 'DESCRICAO_VARIAVEL' ).AsString := dvPadrao;
               Query.ParamByName( 'TIPO' ).AsString := dtPadrao;
               Query.ParamByName( 'VALORES_POSSIVEIS' ).AsString := pPadrao;
               Query.ParamByName( 'VALOR' ).AsString := vPadrao;
               Query.ExecSQL;
               TRQuery.Commit;
               if Result.Tipo = 'IMP' then
                  begin
                     KadoshiPrinters.Atualiza;
                     KadoshiPrinters.Impressoras.Delimiter := ';';
                     KadoshiPrinters.Impressoras.StrictDelimiter := True;
                     Result.Possibilidades := KadoshiPrinters.Impressoras.DelimitedText;
                  end;
               Exit;
           end;
         Result.Possibilidades := Query.FieldByName( 'VALORES_POSSIVEIS' ).AsString;
         Result.Tipo := Query.FieldByName( 'TIPO' ).AsString;
         Result.Valor := Query.FieldByName( 'VALOR' ).AsString;
         if Result.Tipo = 'IMP' then
            begin
               KadoshiPrinters.Atualiza;
               KadoshiPrinters.Impressoras.Delimiter := ';';
               KadoshiPrinters.Impressoras.StrictDelimiter := True;
               Result.Possibilidades := KadoshiPrinters.Impressoras.DelimitedText;
            end;
         TRQuery.Commit;
      except
         TRQuery.Rollback;
      end;
  finally
      Query.Close;
      if TRQuery.Active then
         TRQuery.Commit;
      Query.Free;
      TRQuery.Free;
  end;
end;

class function TDicLib.GetRel(Emp: Integer; Relatorio, Tipo: string;
  frx: TfrxReport; Conec: TFDConnection): Boolean;
var
  Query: TFDQuery;
  TRQuery: TFDTransaction;
  Stream: TStringStream;
begin
  Result := False;
  Query := TFDQuery.Create( nil );
  TRQuery := TFDTransaction.Create( nil );
  try
      TRQuery.Connection := Conec;
      Query.Connection := Conec;
      Query.Transaction := TRQuery;
      if not TRQuery.Active then
         TRQuery.StartTransaction;
      try
         Query.SQL.Text := 'SELECT ( CASE when EXISTS(' + sLineBreak +
                        'SELECT REL FROM RELATORIOS' + sLineBreak +
                        'WHERE COD_EMP=:COD_EMP' + sLineBreak +
                        'AND NOME_REL=:NOME_REL' + sLineBreak +
                        'AND ( TIPO=:TIPO ) ) then' + sLineBreak +
                        '(' + sLineBreak +
                        'SELECT REL FROM RELATORIOS' + sLineBreak +
                        'WHERE COD_EMP=:COD_EMP' + sLineBreak +
                        'AND NOME_REL=:NOME_REL' + sLineBreak +
                        'AND ( TIPO=:TIPO ) )' + sLineBreak +
                        'else' + sLineBreak +
                        '(SELECT REL FROM RELATORIOS' + sLineBreak +
                        'WHERE COD_EMP=:COD_EMP' + sLineBreak +
                        'AND NOME_REL=:NOME_REL' + sLineBreak +
                        'AND ( PADRAO=1 ) ) END ) REL from EMPRESA';
         Query.ParamByName( 'COD_EMP' ).AsInteger := Emp;
         Query.ParamByName( 'NOME_REL' ).AsString := Relatorio;
         Query.ParamByName( 'TIPO' ).AsString := Tipo;
         Query.Open;
         if Query.IsEmpty then
            Exit;
         if Query.FieldByName( 'REL' ).IsNull then
            Exit;
         Stream := TStringStream.Create( UTF8Encode( Query.FieldByName( 'REL' ).AsString ), TEncoding.UTF8 );
         try
            frx.LoadFromStream( Stream );
         finally
            Stream.Free;
         end;
         TRQuery.Commit;
         Result := True;
      except
         TRQuery.Rollback;
      end;
  finally
      Query.Close;
      if TRQuery.Active then
         TRQuery.Commit;
      Query.Free;
      TRQuery.Free;
  end;
end;

class procedure TDicLib.GravarGridDB(iUsu: Integer;
     cxGrid: TObject;
     Form: TForm;
     Conec: TFDConnection);
var
  Query: TFDQuery;
  TRQuery: TFDTransaction;
  Stream: TStringStream;
  Nome, Classe: String;
begin
  Query := TFDQuery.Create( nil );
  TRQuery := TFDTransaction.Create( nil );
  try
      TRQuery.Connection := Conec;
      Query.Connection := Conec;
      Query.Transaction := TRQuery;
      if not TRQuery.Active then
         TRQuery.StartTransaction;
      try
         Query.SQL.Text := 'UPDATE OR INSERT INTO DIC_GRIDS_USER(' +
                           'COD_USU,' +
                           'CLASS_FORM,' +
                           'GRID_NAME,' +
                           'GRID_CLASS,' +
                           'GRID_CUSTOM ) VALUES(' +
                           ':COD_USU,' +
                           ':CLASS_FORM,' +
                           ':GRID_NAME,' +
                           ':GRID_CLASS,' +
                           ':GRID_CUSTOM ) MATCHING( COD_USU, CLASS_FORM, GRID_NAME )';
         Stream := TStringStream.Create;
         try
            if cxGrid is TcxGridDBTableView then
              begin
                 TcxGridDBTableView ( cxGrid ).StoreToStream( Stream );
                 Nome :=  TcxGridDBTableView ( cxGrid ).Name;
                 Classe := TcxGridDBTableView ( cxGrid ).ClassName;
              end;
            if cxGrid is TDBGrid then
              begin
                 TDBGrid ( cxGrid ).Columns.SaveToStream( Stream );
                 Nome :=  TDBGrid ( cxGrid ).Name;
                 Classe := TDBGrid ( cxGrid ).ClassName;
              end;
            if cxGrid is TRadioGroup then
              begin
                 Stream.WriteString( IntToStr( TRadioGroup( cxGrid ).ItemIndex ) );
                 Nome :=  TRadioGroup( cxGrid ).Name;
                 Classe := TRadioGroup( cxGrid ).ClassName;
              end;
            if cxGrid is TComboBox then
              begin
                 Stream.WriteString( IntToStr( TComboBox( cxGrid ).ItemIndex ) );
                 Nome :=  TComboBox( cxGrid ).Name;
                 Classe := TComboBox( cxGrid ).ClassName;
              end;
             Query.ParamByName( 'COD_USU' ).AsInteger := iUsu;
             Query.ParamByName( 'CLASS_FORM' ).AsString := Form.ClassName;
             Query.ParamByName( 'GRID_NAME' ).AsString := Nome;
             Query.ParamByName( 'GRID_CUSTOM' ).AsString := Stream.DataString;
             Query.ParamByName( 'GRID_CLASS' ).AsString := Classe;
         finally
            Stream.Free;
         end;
         Query.ExecSQL;
         TRQuery.Commit;
      except
         TRQuery.Rollback;
      end;
  finally
      Query.Close;
      if TRQuery.Active then
         TRQuery.Commit;
      Query.Free;
      TRQuery.Free;
  end;
end;

class procedure TDicLib.MontaTelaUsu(iUsu: Integer; Form: TForm;
  Conec: TFDConnection);
var
  Query: TFDQuery;
  TRQuery: TFDTransaction;
  Stream: TStringStream;
begin
  Query := TFDQuery.Create( nil );
  TRQuery := TFDTransaction.Create( nil );
  try
      TRQuery.Connection := Conec;
      Query.Connection := Conec;
      Query.Transaction := TRQuery;
      if not TRQuery.Active then
         TRQuery.StartTransaction;
      try
         Query.SQL.Text := 'SELECT * FROM DIC_GRIDS_USER ' +
                           'WHERE COD_USU=:COD_USU' +
                           ' AND CLASS_FORM=:FORM';
         Query.ParamByName( 'COD_USU' ).AsInteger := iUsu;
         Query.ParamByName( 'FORM' ).AsString := Form.ClassName;
         Query.Open;
         if Query.IsEmpty then
            Exit;
         Query.First;
         while not Query.Eof do
             begin
                 Stream := TStringStream.Create( Query.FieldByName( 'GRID_CUSTOM' ).AsString );
                 try
                     case IndexStr(  Query.FieldByName( 'GRID_CLASS' ).AsString,
                       ['TcxGridDBTableView', 'TDBGrid', 'TRadioGroup', 'TComboBox' ] ) of
                         0: TcxGridDBTableView(
                            Form.FindComponent( Query.FieldByName( 'GRID_NAME' ).AsString )
                            ).RestoreFromStream( Stream );
                         1: TDBGrid(
                            Form.FindComponent( Query.FieldByName( 'GRID_NAME' ).AsString )
                            ).Columns.LoadFromStream( Stream );
                         2: TRadioGroup(
                            Form.FindComponent( Query.FieldByName( 'GRID_NAME' ).AsString )
                            ).ItemIndex := StrToInt( Stream.DataString );
                         3: TComboBox(
                            Form.FindComponent( Query.FieldByName( 'GRID_NAME' ).AsString )
                            ).ItemIndex := StrToInt( Stream.DataString );
                     end;

                 finally
                    Stream.Free;
                 end;
                 Query.Next;
             end;
         TRQuery.Commit;
      except
         TRQuery.Rollback;
      end;
  finally
      Query.Close;
      if TRQuery.Active then
         TRQuery.Commit;
      Query.Free;
      TRQuery.Free;
  end;
end;

class function TDicLib.ProximoCodigo(Tabela, Campo, Filtro: String;
  Conec: TFDConnection): Integer;
var
  Query: TFDQuery;
  TRQuery: TFDTransaction;
begin
  Result := 1;
  Query := TFDQuery.Create( nil );
  TRQuery := TFDTransaction.Create( nil );
  try
      TRQuery.Connection := Conec;
      Query.Connection := Conec;
      Query.Transaction := TRQuery;
      if not TRQuery.Active then
         TRQuery.StartTransaction;
      try
         Query.SQL.Text := 'SELECT ( COALESCE( MAX( '
                           + Campo + ' ), 0 ) + 1 ) PRX FROM  ' +
                           Tabela;
         if Filtro <> '' then
            begin
               Query.SQL.Add( 'WHERE ' + Filtro );
            end;
         Query.Open;
         Result := Query.FieldByName( 'PRX' ).AsInteger;
         Query.Close;
         TRQuery.Commit;
      except
         TRQuery.Rollback;
      end;
  finally
      Query.Close;
      if TRQuery.Active then
         TRQuery.Commit;
      Query.Free;
      TRQuery.Free;
  end;
end;


class function TDicLib.ProximoCodigoParans(Tabela, Campo, Filtro: String;
  Conec: TFDConnection): Integer;
var
  Query: TFDQuery;
  TRQuery: TFDTransaction;
begin
  Result := 1;
  Query := TFDQuery.Create( nil );
  TRQuery := TFDTransaction.Create( nil );
  try
      TRQuery.Connection := Conec;
      Query.Connection := Conec;
      Query.Transaction := TRQuery;
      if not TRQuery.Active then
         TRQuery.StartTransaction;
      try
         Query.SQL.Text := 'SELECT ( COALESCE( MAX( '
                           + Campo + ' ), 0 ) + 1 ) PRX FROM  ' +
                           Tabela;
         if Filtro <> '' then
            begin
               Query.SQL.Add( 'WHERE ' + Filtro );
            end;
         Query.Open;
         Result := Query.FieldByName( 'PRX' ).AsInteger;
         Query.Close;
         TRQuery.Commit;
      except
         TRQuery.Rollback;
      end;
  finally
      Query.Close;
      if TRQuery.Active then
         TRQuery.Commit;
      Query.Free;
      TRQuery.Free;
  end;
end;

class function TDicLib.SetRel(Emp: Integer; Relatorio, Tipo: string;
  frx: TfrxReport; Conec: TFDConnection): Boolean;
var
  Query: TFDQuery;
  TRQuery: TFDTransaction;
  Stream: TStringStream;
begin
  Result := False;
  Query := TFDQuery.Create( nil );
  TRQuery := TFDTransaction.Create( nil );
  try
      TRQuery.Connection := Conec;
      Query.Connection := Conec;
      Query.Transaction := TRQuery;
      if not TRQuery.Active then
         TRQuery.StartTransaction;
      try
         Query.SQL.Text := 'update or insert into RELATORIOS(' + sLineBreak +
                            'COD_EMP, NOME_REL,' + sLineBreak +
                            'TIPO, REL, PADRAO )' + sLineBreak +
                            'values ( :COD_EMP, :NOME_REL,' + sLineBreak +
                            ':TIPO, :REL, 0 )' + sLineBreak +
                            'matching (COD_EMP,' + sLineBreak +
                            'NOME_REL, TIPO)';
         Query.ParamByName( 'COD_EMP' ).AsInteger := Emp;
         Query.ParamByName( 'NOME_REL' ).AsString := Relatorio;
         Query.ParamByName( 'TIPO' ).AsString := Tipo;
         Stream := TStringStream.Create;
         try
            frx.SaveToStream( Stream );
            Query.ParamByName( 'REL' ).AsString := UTF8Decode( Stream.DataString );
         finally
            Stream.Free;
         end;
         Query.ExecSQL;
         TRQuery.Commit;
         Result := True;
      except
         TRQuery.Rollback;
      end;
  finally
      Query.Close;
      if TRQuery.Active then
         TRQuery.Commit;
      Query.Free;
      TRQuery.Free;
  end;
end;

class function TDicLib.StrEntre(Src, Str1, Str2: String): string;
var
  Index: Integer;
  Count: Integer;
  StrIni: String;
  StrFim: String;
begin
    StrIni := Str1;
    StrFim := Str2;
    Index := Pos( StrIni, Src ) + Length( StrIni );
    Count := Pos( StrFim, Src ) -( Pos( StrIni, Src ) + Length( StrIni ) );
    Result := Copy( Src, Index, Count ) ;
end;


{ TDicCalc }

class function TDicCalc.Dividir(vNum, vDiv: Double): Double;
begin
   if ( vNum = 0 ) or ( vDiv = 0 ) then
      begin
         Result := 0;
         Exit;
      end;
   Result := vNum / vDiv;
end;

{ TDicAnimacao }

class procedure TDicAnimacao.AnimarPropriedade(Componente: TComponent;
  Propriedade: String; NovoValor, Pular, Tempo: Integer;
    const LockObj: TObject = nil);
//var
//  ThAni: TProcessoParalelo;
begin
 //  ThAni := TProcessoParalelo.Create;
  ListaThreads.Start([
//   ThAni.Inicia(
    procedure
    var
        ctx:TRttiContext;
        Tipo:TRttiType;
        Prop:TRttiProperty;
        Atual: Integer;
        Acre: Integer;
        VV: Integer;
        Bloquear: Boolean;
    begin
       try
         Bloquear := Assigned( LockObj );
         if Bloquear then
            System.TMonitor.Enter( LockObj );
         try
           Ctx:=TRttiContext.Create;
           Tipo:=Ctx.GetType(Componente.ClassInfo);
           Prop := Tipo.GetProperty( Propriedade );
           try
               Atual := Prop.GetValue( Componente ).AsInteger ;
               if Atual < NovoValor then
                 begin
                    Acre := Pular;
                    while Prop.GetValue( Componente ).AsInteger < NovoValor do
                         begin
                            VV :=  Prop.GetValue( Componente ).AsInteger;
                            if ( VV + Acre ) > NovoValor then
                                Acre := NovoValor - VV;
                            Inc( VV, Acre );
                            TThread.Synchronize( nil,
                             procedure
                                 begin
                                     Prop.SetValue( Componente,  VV);
                                 end );
                            Sleep( Tempo );
                         end;
                 end
               else
                 begin
                    Acre := Pular * -1;
                    while Prop.GetValue( Componente ).AsInteger > NovoValor do
                         begin
                            VV :=  Prop.GetValue( Componente ).AsInteger;
                            if ( VV + Acre ) < NovoValor then
                                Acre := ( VV - NovoValor ) *-1;
                            Inc( VV, Acre );
                            TThread.Synchronize( nil,
                             procedure
                                 begin
                                     Prop.SetValue( Componente,  VV);
                                 end );
                            Sleep( Tempo );
                         end;
                 end;
           finally
               Ctx.Free;
           end;
         finally
             if Bloquear then
                System.TMonitor.Exit( LockObj );
         end;
       except
         on E: Exception do
            begin
               Exit;
            end;
       end;
    end ] );
end;

{ TDicParConexao }

constructor TDicParConexao.Create(Conection: TFDConnection);
begin
   inherited Create;
   FConection := Conection;
   Transaction := TFDTransaction.Create( nil );
   Query := TFDQuery.Create( nil );
   Transaction.Connection := FConection;
   Query.Connection := FConection;
   Query.Transaction := Transaction;
   Query.Close;
   if Transaction.Active then
      Transaction.Commit;
   Transaction.StartTransaction;
end;

destructor TDicParConexao.Destroy;
begin
  Query.Close;
  if Transaction.Active then
     Transaction.Commit;
  inherited;
end;

end.

