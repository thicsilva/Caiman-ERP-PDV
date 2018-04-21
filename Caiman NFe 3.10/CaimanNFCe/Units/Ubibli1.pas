unit Ubibli1;

interface

uses
  SysUtils, Forms, StdCtrls, Dialogs, Controls, DB, Mask, Windows, ComCtrls,
  ExtCtrls, ExtDlgs, rxCurrEdit, DateUtils, DBGrids, RzDBCmbo, DBCtrls,
  Graphics, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script,
  FireDAC.Comp.DataSet;

type
  TConsisteInscricaoEstadual = function (const Insc, UF: String): Integer; stdcall;
  const Caractere : array[1..106] of Char = (
  'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S',
  'T','U','V','W','X','Y','Z','0','1','2','3','4','5','6','7','8','9','!','#',
  '$','%','&','/','(',')','=','?','>','^','@','£','§','{','[',']','}','´','<',
  '~','+','*','`','''','ª','º','¢','-','_',',','.',';',':','|','\','¹','²','³'
  ,'¬','°','¨',' ','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o',
  'p','q','r','s','t','u','v','w','x','y','z' );

  const Subst : array[1..106] of string = (
  '!9@8','@7!7','#4$5','$5%4','%8$8','^1%1','&3^5','*7&6','(6*6',')3(3','-2)8','=1-7','+0-9','/0@1','\9$7',
  '!3@2','@3&6','#1*4','$2#4','%6(8','^9!5','&4=4','*3@4','(8*4',')4!7','-0^5','=1@9','+2!0','/8%2','\7@5',
  '!3@7','@4!8','#7&4','$6$3','%2&7','^1*3','&1@0','*3$9','#3^1','!4-2','&6(5','!5@8',')7!8','4&1-','a2$1',
  '*9z6','@7c3','1%^5','0&*6','$5^6','!18)','(38)','@30&','#69]','[70]','{26}','-93#','l52h','h71i','w80&',
  '%50%','#401','@87-','b46x','r55^','!2*2','o08y','&89)','%03%','\59q','t85*','^29-','@02%','#99)','#255',
  '@23~','~91t','6%4n','~5a1','0=+0','Za*a','%yB-','Xc#C','wl#d','V*@e','&UF)','!tG$','-sh@','%rij','%QJ)',
  '%pk&','@oL*','!nm=','!MN*','@lO-','$kpy','Ojq;',':Ir-','h:;s','Gx%T','f}{U','E#tv','d1W+','&cxk','pby$',
  'aZ');

  function GetAveCharSize(Canvas: TCanvas): TPoint;
  function InputQuery(const ACaption, APrompt, Mascara: string; Senha: Boolean;
  var Value: string): Boolean;
  function VersaoExe(ArquivoExe : string): String;
  function CSTtoCSOSN( Cst: string ) : String;
  function InverteValor(Text: string) : string;
function RetiraCaracter(Text : string) : string;
function FormataStringFloat(Text : string) : string;
function cnpj(s:string): boolean;
function cpf(num: string): boolean;
function Prxcod(tabela : String; campo : string; transaction : TFDTransaction; ibsqlCod: TFDQuery) : integer;
function Consulta(sTabela : String; NomeEdit : TEdit; sCampoPK : string; SCampoPesquisa: string;
         Transaction : TFDTransaction; Qry : TFDQuery) : String;
function BuscaEmpresaRelatorio(transaction : TFDTransaction; ibsql : TFDQuery) : string;
function AnoBiSexto(Ayear: Integer): Boolean;
function UltimoDiaMes (const mes : word; const ano : word) : TDateTime;
function FormataStringD(Valor,Tamanho,Complemento : String):String;
function FormataStringE(Valor,Tamanho,Complemento : String):String;
function FormataStringC(Valor,Tamanho,Complemento : String):String;
function CalculaDigitoEAN13(Cod:String):String;
function PrimeiraLetraMaiuscula(sTexto : string):string;
function RetiraCR(Text : string) :string;

function Criptografa (Palavra : string) : string;
function DesCriptografa (Palavra : String) : string;

function EliminaCaracter(stext : string) : string;
function FormataCNPJ(cnpj : string) : string;
function VerificaInscricao(insc, uf : AnsiString) : boolean;
function RetornaMes(const mes : integer) : string;
function ValorExtenso(r : real; i : integer) : string;
function VerificaCST (sCST : string) : boolean;
function Substitui(substituida : string; substituirpor : string; texto : string) : string;
function StrToChar(Texto : String) : Char;
function EhNumero(s: string): Boolean;
function FormataDataECF(const sString : string) : string;
function FormataHoraECF(const sString : string) : string;
function ExatoCurrency(Value: Currency; Decimal: Integer): Currency;
function NaoInsereDBGrid(DBGrid: TDBGrid; DataSet: TDataSet; Key: Word): Word;
function RetIdxUltimaColVisivel(DBGrid: TDBGrid): integer;

procedure Limpaedit(form: Tform);
procedure EDedit(form: Tform; estado: boolean);
procedure Excluir(form : Tform; Tabela : string; campo : TEdit; ibsql: TFDQuery; transaction : TFDTransaction);
procedure BuscaNoCombo (Combo : TComboBox; Valor : Integer);
procedure BuscaCSTNoCombo ( Combo: TComboBox; Valor: String );
function ConsultaEdit(sTabela : String; NomeEdit : TEdit; sCampoPK : string; SCampoPesquisa: string;
         Transaction : TFDTransaction; Qry : TFDQuery) : String;
function ConsultaDBEdit(sTabela : String; NomeEdit : TDBEdit; sCampoPK : string; SCampoPesquisa: string;
         Transaction : TFDTransaction; Qry : TFDQuery) : String;
function FormataCEP( CEP: string ): string;

procedure ProcessaRetConsCep( Ret: string; var Rua, Bairro, Cidade, Estado, IBGE: String );

implementation

procedure ProcessaRetConsCep( Ret: string; var Rua, Bairro, Cidade, Estado, IBGE: String );
var
   NumV: Integer;
  I: Integer;
begin
   NumV := 0;
   for I := 1 to Length( Ret ) do
       begin
          if Ret[I] = ',' then
             NumV := NumV + 1
          else
          begin
          case NumV of
             0: begin
                   Rua := Rua + Ret[I];
                end;
             1: begin
                   Bairro := Bairro + Ret[I];
                end;
             2: begin
                   Cidade := Cidade + Ret[I];
                end;
             3: begin
                   Estado := Estado + Ret[I];
                end;
             4: begin
                   IBge := IBGE + Ret[I];
                end;

          end;
          end;
       end;
   Rua := Trim( Rua );
   Bairro := Trim( Bairro );
   Cidade := Trim( Cidade );
   Estado := Trim( Estado );
   IBGE := Trim( IBGE );
end;

function FormataCEP( CEP: string ): string;
var
   Temp, T2: string;
  I: Integer;
begin
   T2 := '';
   Temp := Retiracaracter( CEP );
   for I := 1 to Length( Temp ) do
       begin
          if I = 6 then
             T2 := t2 + '-';
          T2 := T2 + Temp[I];
       end;
   Result := T2;
end;

function VersaoExe(ArquivoExe : string): String;
	type
PFFI = ^vs_FixedFileInfo;
var
F: PFFI;
Handle: Dword;
Len: Longint;
Data: Pchar;
Buffer: Pointer;
Tamanho: Dword;
Parquivo: Pchar;
Arquivo: String;
begin
Arquivo := ArquivoExe;
Parquivo := StrAlloc(Length(Arquivo) + 1);
StrPcopy(Parquivo, Arquivo);
Len := GetFileVersionInfoSize(Parquivo, Handle);
Result := '';
if Len > 0 then
begin
Data := StrAlloc(Len + 1);
if GetFileVersionInfo(Parquivo, Handle, Len, Data) then
begin
VerQueryValue(Data, '', Buffer, Tamanho);
F := PFFI(Buffer);
Result := Format('%d.%d.%d.%d', [HiWord(F^.dwFileVersionMs), LoWord
(F^.dwFileVersionMs), HiWord(F^.dwFileVersionLs), LoWord
(F^.dwFileVersionLs)]);
end;
StrDispose(Data);
end;
StrDispose(Parquivo);
end;



function CSTtoCSOSN( Cst: string ) : String;
begin
   if ( Cst = '00' ) or ( Cst = '20' ) then
      result := '101';
   if ( Cst = '40' ) or ( Cst = '41' ) or ( Cst = '50' ) or ( Cst = '51' ) then
      result := '102';
   if ( Cst = '10' ) or ( Cst = '70' ) then
      result := '201';
   if ( Cst = '30' ) or ( Cst = '70' ) then
      result := '202';
   if ( Cst = '60' ) then
      result := '500';
   if ( Cst = '90' ) then
      result := '900';
end;

function FormataStringD(Valor,Tamanho,Complemento : String):String;
var X, Y : Integer;
begin
   Y := Length(Valor);
   For X := Y to StrToInt(Tamanho) do
     begin
        If (x<>StrToInt(Tamanho)) then
           Valor := Complemento + Valor
        else
           Valor := '' + Valor ;
     end;
   Result := Valor;
end;

function FormataStringE(Valor,Tamanho,Complemento : String):String;
var X, Y : Integer;
begin
   Y := Length(Valor);
   For X := Y to StrToInt(Tamanho) do
     begin
        If (x <> StrToInt(Tamanho)) then
           Valor := Valor + Complemento
        else
           Valor := Valor + '';
     end;
   Result := Valor;
end;

function FormataStringC(Valor,Tamanho,Complemento : String):String;
var
   Calc, L, Tam: Integer;

begin
   L := Length( Valor );
   Tam := StrToInt( Tamanho );
   Calc := ( ( Tam - L ) div 2 );
   Result :=  FormataStringD( '', IntToStr( Calc ), Complemento )  + Valor + FormataStringD( '', IntToStr( Calc ), Complemento );
end;

function InverteValor(Text: string) : string;
var n : integer;
begin
   for n := 1 to length(Text) do
      begin
         if Copy(Text, n, 1) = '.' then
            begin
               Delete(Text, n, 1);
               Insert(',', Text, n);
            end
         else
            if Copy(Text, n, 1) = ',' then
               begin
                  Delete(Text, n, 1);
                  Insert('.', Text, n);
               end;
      end;
   Result := Text;
end;

function RetiraCaracter(Text: string) : string;
var n : integer;
begin
   for n:= 1 to length(Text) do
     begin
        if (Copy(Text,n,1) = '.') or (Copy(Text,n,1) = '-') or (copy(text,n,1) = ',') or (copy(text,n,1) = '/') or (copy(text,n,1) = ':') then
           Delete(Text,n,1);
     end;
   Result:= Text;
end;

function FormataStringFloat(Text : string) : string;
var n : integer;
begin
   for n := 1 to length(Text) do
      begin
         if Copy(Text, n, 1) = '.' then
            Delete(Text, n, 1)
      end;
   Result := Text;
end;

function cpf(num: string): boolean;
var
   n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
   d1,d2: integer;
   digitado, calculado: string;
begin
   if trim(num) = '' then
      begin
         result:= false;
         exit;
      end;

   n1:=StrToInt(num[1]);
   n2:=StrToInt(num[2]);
   n3:=StrToInt(num[3]);
   n4:=StrToInt(num[4]);
   n5:=StrToInt(num[5]);
   n6:=StrToInt(num[6]);
   n7:=StrToInt(num[7]);
   n8:=StrToInt(num[8]);
   n9:=StrToInt(num[9]);
   d1:=n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
   d1:=11-(d1 mod 11);
   if d1>=10 then
      d1:=0;
   d2:=d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
   d2:=11-(d2 mod 11);
   if d2>=10 then
      d2:=0;
   calculado:=inttostr(d1)+inttostr(d2);
   digitado:=num[10]+num[11];
   if calculado=digitado then
      result:= true
   else
      result:= false;
end;

function cnpj(s:string): boolean;
var soma, dg1, dg2: integer;
    x: shortint;
    aux: string[1];
    aux_cnpj:string[14];
begin
   if (s = '') or (s = '  .   .   /    -  ') then
      begin
         result:= true;
         exit;
      end;
   x:= 1;
   aux_cnpj:= '';
   while x < 19 do
      begin
         aux:= copy(s, x, 1);
         if ((aux <> '.') and (aux <> '/') and (aux <> '-')) then
            aux_cnpj:= aux_cnpj + aux;
         x:= x + 1;
      end;
   s:= aux_cnpj;
   soma:= 0;
   inc(soma, (strtointdef(s[1], 0) * 5));
   inc(soma, (strtointdef(s[2], 0) * 4));
   inc(soma, (strtointdef(s[3], 0) * 3));
   inc(soma, (strtointdef(s[4], 0) * 2));
   inc(soma, (strtointdef(s[5], 0) * 9));
   inc(soma, (strtointdef(s[6], 0) * 8));
   inc(soma, (strtointdef(s[7], 0) * 7));
   inc(soma, (strtointdef(s[8], 0) * 6));
   inc(soma, (strtointdef(s[9], 0) * 5));
   inc(soma, (strtointdef(s[10], 0) * 4));
   inc(soma, (strtointdef(s[11], 0) * 3));
   inc(soma, (strtointdef(s[12], 0) * 2));

   dg1:= soma - ((soma div 11) * 11);

   if dg1 <= 1 then
      dg1:= 0
   else
      dg1:= 11 - dg1;

   soma:= 0;
   soma:= soma + strtointdef(s[1], 0) * 6;
   soma:= soma + strtointdef(s[2], 0) * 5;
   soma:= soma + strtointdef(s[3], 0) * 4;
   soma:= soma + strtointdef(s[4], 0) * 3;
   soma:= soma + strtointdef(s[5], 0) * 2;
   soma:= soma + strtointdef(s[6], 0) * 9;
   soma:= soma + strtointdef(s[7], 0) * 8;
   soma:= soma + strtointdef(s[8], 0) * 7;
   soma:= soma + strtointdef(s[9], 0) * 6;
   soma:= soma + strtointdef(s[10], 0) * 5;
   soma:= soma + strtointdef(s[11], 0) * 4;
   soma:= soma + strtointdef(s[12], 0) * 3;
   soma:= soma + 2 * dg1;

   dg2:= soma - ((soma div 11) * 11);

   if dg2 <= 1 then
      dg2:= 0
   else
      dg2:= 11 - dg2;

   if (inttostr(dg1) = s[13]) and (inttostr(dg2) = s[14]) then
      result:= true
   else
      result:= false;
end;

function Prxcod(tabela : string; campo : string; transaction : TFDTransaction; ibsqlCod: TFDQuery) : integer;
begin
   with ibsqlCod do
      begin
         if transaction.Active then
            transaction.Commit;
         Transaction.StartTransaction;
         close;
         sql.Clear;
         sql.Text:= 'SELECT MAX(' + campo + ')' + ' as prxcod ' + ' from ' + tabela;
         ExecOrOpen;
         result:= Fieldbyname('prxcod').AsInteger + 1;
         Transaction.Commit;
         ibsqlCod.Close;
      end;
end;

function Consulta(sTabela : String; NomeEdit : TEdit; sCampoPK : string; SCampoPesquisa: string;
         Transaction : TFDTransaction; Qry : TFDQuery) : String;
begin
   try
     try
       if Transaction.Active then
          Transaction.Commit;
       Transaction.StartTransaction;
       with Qry do
          begin
             close;
             sql.clear;
             sql.Add(' SELECT ' + sCampoPK + ', '  + SCampoPesquisa +
                     ' FROM   ' + sTabela          +
                     ' WHERE  ' + sCampoPK + ' = ' +  #39 + NomeEdit.Text + #39);
             Open;
             if not fieldbyname(sCampoPK).IsNull then
                result:= Fieldbyname(SCampoPesquisa).AsString
             else
                result:= '';
          end;
       Transaction.Commit;
     except
       Transaction.Rollback;
       showmessage('Erro ao Selecionar o(a) ' + sTabela);
     end;
   finally
     Qry.Close;
   end;
end;

function ConsultaEdit(sTabela : String; NomeEdit : TEdit; sCampoPK : string; SCampoPesquisa: string;
         Transaction : TFDTransaction; Qry : TFDQuery) : String;
begin


   try
     try
       if Transaction.Active then
          Transaction.Commit;
       Transaction.StartTransaction;
       with Qry do
          begin
             close;
             sql.clear;
                sql.Add(' SELECT ' + sCampoPK + ', '  + SCampoPesquisa +
                     ' FROM   ' + sTabela          +
                     ' WHERE  ' + sCampoPK + ' = ' +  #39 + NomeEdit.Text + #39);

             Open;
             if not fieldbyname(sCampoPK).IsNull then
                result:= Fieldbyname(SCampoPesquisa).AsString
             else
                result:= '';
          end;
       Transaction.Commit;
     except
       Transaction.Rollback;
       showmessage('Erro ao Selecionar o(a) ' + sTabela);
     end;
   finally
     Qry.Close;
   end;
end;

function ConsultaDBEdit(sTabela : String; NomeEdit : TDBEdit; sCampoPK : string; SCampoPesquisa: string;
         Transaction : TFDTransaction; Qry : TFDQuery) : String;
begin


   try
     try
       if Transaction.Active then
          Transaction.Commit;
       Transaction.StartTransaction;
       with Qry do
          begin
             close;
             sql.clear;
                sql.Add(' SELECT ' + sCampoPK + ', '  + SCampoPesquisa +
                     ' FROM   ' + sTabela          +
                     ' WHERE  ' + sCampoPK + ' = :valor' );
                ParamByName( 'valor' ).AsString :=  NomeEdit.Text;

             Open;
             if not fieldbyname(sCampoPK).IsNull then
                result:= Fieldbyname(SCampoPesquisa).AsString
             else
                result:= '';
          end;
       Transaction.Commit;
     except
       Transaction.Rollback;
       showmessage('Erro ao Selecionar o(a) ' + sTabela);
     end;
   finally
     Qry.Close;
   end;
end;


function BuscaEmpresaRelatorio(transaction : TFDTransaction; ibsql : TFDQuery) : string;
begin
   if transaction.Active then
      transaction.Commit;
   transaction.StartTransaction;
   try
     try
       with ibsql do
          begin
             close;
             sql.Clear;
             sql.Add('SELECT RAZAO_EMP FROM EMPRESA');
             ExecOrOpen;
             Result:= fieldbyname('razao_emp').AsString;
          end;
       transaction.Commit;
     except
       transaction.Rollback;
       showmessage('Erro ao Buscar a Empresa');
     end;
   finally
     ibsql.Close;
   end;
end;

function AnoBiSexto(Ayear: Integer): Boolean;
begin
   Result := (AYear mod 4 = 0) and ((AYear mod 100 <> 0) or (AYear mod 400 = 0));
end;

function UltimoDiaMes (const mes : word; const ano : word) : TDateTime;
var  sDia : word;
var  SData : TdateTime;
begin
   Sdata:= encodedate(ano, mes, 01);
   sdia:= DaysInMonth(sdata);
   result:= encodedate(ano, mes, sdia);
end;

Procedure LimpaEdit(form: Tform);
var i : Integer;

begin

   for i := 0 to Form.ComponentCount -1 do
       begin
          if form.Components[i] is TEdit then
             TEdit(form.Components[i]).Clear
          else
             if Form.Components[i] is TEdit then
                TEdit(Form.Components[i]).Clear
             else
                if Form.Components[i] is Tmaskedit then
                   Tmaskedit(form.Components[i]).Clear
                else
                   if form.Components[i] is Tcombobox then
                      begin
                         if Tcombobox(form.Components[i]).Style = csDropDown then
                            Tcombobox(form.Components[i]).Text:= ''
                         else
                            Tcombobox(form.Components[i]).ItemIndex:= -1;
                      end
                   else
                      if form.Components[i] is Tcheckbox then
                         begin

                            Tcheckbox(form.Components[i]).Checked:= false
                         end
                      else
                         if form.Components[i] is Tmemo then
                            Tmemo(form.Components[i]).Clear
                         else
                            if form.Components[i] is TOpenPictureDialog then
                               TOpenPictureDialog(form.Components[i]).FileName:= ''
                            else
                               if form.Components[i] is TCurrencyEdit then
                                  TCurrencyEdit(form.Components[i]).Text:= '0,00'
                               else
                                  if form.Components[i] is TListBox then
                                     Tlistbox(form.Components[i]).Clear
                                  else
                                     if form.Components[i] is TRichEdit then
                                        TRichEdit(form.Components[i]).Clear
                                     else
                                         if form.Components[i] is TRadioGroup  then
                                            TRadioGroup( form.Components[i] ).ItemIndex := -1;

       end;

end;

Procedure EDEdit(form: Tform; estado :boolean);
var
i : Integer;
begin
   for i := 0 to Form.ComponentCount -1 do
      if Form.Components[i] is TEdit then
            TEdit(Form.Components[i]).Enabled:= estado
      else
         if form.Components[I] is Tmaskedit then
            Tmaskedit(form.Components[i]).Enabled:= estado
         else
            if form.Components[i] is Tcombobox then
               Tcombobox(form.Components[i]).Enabled:= estado
            else
               if form.Components[i] is Tcheckbox then
                  Tcheckbox(form.Components[i]).Enabled:= estado
               else
                  if form.Components[i] is Tmemo then
                     Tmemo(form.Components[i]).Enabled:= estado
                  else
                     if form.Components[i] is TDateTimePicker then
                        Tdatetimepicker(form.Components[i]).Enabled:= estado
                     else
                        if form.Components[i] is TCurrencyEdit then
                           TCurrencyEdit(form.Components[i]).Enabled:= estado
                        else
                           if form.Components[i] is TRadioGroup then
                              TRadioGroup(form.Components[i]).Enabled := estado
                            else
                               if form.Components[i] is TDBEdit then
                                  TDBEdit(form.Components[i]).Enabled := estado
                               else
                                 if form.Components[i] is TDBCheckBox then
                                    TDBCheckBox(form.Components[i]).Enabled := estado
                                 else
                                    if form.Components[i] is TRzDBComboBox then
                                        TRzDBComboBox(form.Components[i]).Enabled := estado;


end;

procedure Excluir(form : Tform; Tabela : string; campo : TEdit; ibsql: TFDQuery; transaction : TFDTransaction);
begin
   if application.MessageBox('Confirma a Exclusão?', 'Exclusão', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton2) = 6 then
      begin
         try
           try
             if transaction.Active then
                transaction.Commit;
             transaction.StartTransaction;
             with ibsql do
                begin
                   sql.Clear;
                   sql.Add('DELETE FROM ' + tabela + ' WHERE ' + campo.Name + ' = ' + #39 + campo.Text + #39);
                   ExecOrOpen;
                   limpaedit(form);
                   ededit(form, false);
                end;
             transaction.Commit;
           except
             transaction.Rollback;
             showmessage('Erro ao Excluir');
           end;
         finally
           ibsql.Close;
         end;
      end;
end;

function StrToChar(Texto : String):Char;
{-------------------------------------------------------------------------
  Função para transformar uma String em Char
--------------------------------------------------------------------------}
begin
     if Texto = 'A' then
     begin
          Result:= 'A';
     end
     else
     if Texto = 'B' then
     begin
          Result:= 'B';
     end
     else
     if Texto = 'C' then
     begin
          Result:= 'C';
     end
     else
     if Texto = 'D' then
     begin
          Result:= 'D';
     end
     else
     if Texto = 'E' then
     begin
          Result:= 'E';
     end
     else
     if Texto = 'F' then
     begin
          Result:= 'F';
     end
     else
     if Texto = 'G' then
     begin
          Result:= 'G';
     end
     else
     if Texto = 'H' then
     begin
          Result:= 'H';
     end
     else
     if Texto = 'I' then
     begin
          Result:= 'I';
     end
     else
     if Texto = 'J' then
     begin
          Result:= 'J';
     end
     else
     if Texto = 'L' then
     begin
          Result:= 'L';
     end
     else
     if Texto = 'M' then
     begin
          Result:= 'M';
     end
     else
     if Texto = 'N' then
     begin
          Result:= 'N';
     end
     else
     if Texto = 'O' then
     begin
          Result:= 'O';
     end
     else
     if Texto = 'P' then
     begin
          Result:= 'P';
     end
     else
     if Texto = 'Q' then
     begin
          Result:= 'Q';
     end
     else
     if Texto = 'R' then
     begin
          Result:= 'R';
     end
     else
     if Texto = 'S' then
     begin
          Result:= 'S';
     end
     else
     if Texto = 'T' then
     begin
          Result:= 'T';
     end
     else
     if Texto = 'U' then
     begin
          Result:= 'U';
     end
     else
     if Texto = 'V' then
     begin
          Result:= 'V';
     end
     else
     if Texto = 'X' then
     begin
          Result:= 'X';
     end
     else
     if Texto = 'Z' then
     begin
          Result:= 'Z';
     end
     else
     begin
          Result:= 'A';
     end;
end;

procedure BuscaNoCombo(Combo : TComboBox; Valor : Integer);
var i : integer;
begin
   Combo.ItemIndex :=  -1;
   for i:= 0 to Combo.Items.Count - 1 do
     begin
        if strtoint(copy(Combo.Items[i],1,3)) = valor then
           Combo.ItemIndex:= i;
     end;
end;

procedure BuscaCSTNoCombo( Combo : TComboBox; Valor : String );
var
   i : integer;
   aux: String;
begin
   Combo.ItemIndex :=  -1;
   for i:= 0 to Combo.Items.Count - 1 do
     begin
        aux := Trim( copy(Combo.Items[i],1,3) );
        if aux = valor then
           Combo.ItemIndex:= i;
     end;
end;

function CalculaDigitoEAN13(Cod:String):String;
function Par(Cod:Integer):Boolean;
  begin
     Result:= Cod Mod 2 = 0 ;
  end;
var i, SomaPar, SomaImpar:Integer;
begin
   SomaPar:=0;
   SomaImpar:=0;
for i:=1 to 12 do
if Par(i) then
   SomaPar:=SomaPar+StrToInt(Cod[i])
else
   SomaImpar:=SomaImpar+StrToInt(Cod[i]);
SomaPar:=SomaPar*3;
i:=0;
while i < (SomaPar+SomaImpar) do
   Inc(i,10);
Result:=IntToStr(i-(SomaPar+SomaImpar));
end;

function PrimeiraLetraMaiuscula (sTexto : string):string;
var i :integer;
begin
   for i:= 1 to length(sTexto) do
      begin
         if i = 1 then
            Result:= UpperCase(sTexto[1])
         else
            if sTexto[i - 1] = ' ' then
               Result:= result + UpperCase(sTexto[i])
            else
               Result:= Result + sTexto[i];
      end;
end;

function RetiraCR(text:string):string;
begin
   result:= stringReplace(Text, #13#10, ' ', [rfReplaceAll]);
end;

function Criptografa (Palavra : string) : string;
Var
  vet : integer; //vetor
  ct : integer;  //vetor da constante
  aux : string;  //variável auxiliar
begin
  result := '';
  ct := 0;
  vet := 0;
  aux := '';
  //palavra := uppercase(palavra);
  for vet := 1 to length(Palavra) do
      begin
         for ct:= 1 to 106 do
         begin
            if (palavra[vet] = Caractere[ct]) then
               begin
                  aux := aux + subst[ct];
               end;
         end;
      end;
  result := aux;
end;

function DesCriptografa (Palavra : String) : string;
Var iVetor    : integer;
    iContador : integer;
    iContAux  : integer;
    sAuxiliar : string;
begin
  result    := '';
  iContador := 0;
  iContAux  := 0;
  iVetor    := 0;
  sAuxiliar := '';
  for iVetor:= 1 to length(Palavra) do
      begin
         for iContador:= 1 to 106 do
            begin
               if (copy(palavra, iContAux + 1, 4) = subst[iContador]) then
                  begin
                     sAuxiliar:= sAuxiliar + caractere[iContador];
                  end;
            end;
         inc(iContAux, 4);
      end;
  result:= sAuxiliar;
end;

function EliminaCaracter(stext : string) : string;
var npos: integer;
begin
   result:= '';
   npos:= 1;
   while npos <= Length(sText) do
      begin
         if (stext[npos] = '.') or (stext[npos] = '-') or (stext[npos] = '/') or
            (stext[npos] = ')') or (stext[npos] = '(') or (stext[npos] = ',') then
            begin
               inc(npos);
            end
         else
            begin
               result:= result + stext[npos];
               inc(npos);
            end;
      end;
end;

function FormataCNPJ(cnpj : string) : string;
var sAux, sCNPJ  : string;
begin
   sAux:= EliminaCaracter(cnpj);
   case Length(sAux) of
    11: begin
           sCNPJ:= copy(sAux, 1, 3) + '.' +
                   copy(sAux, 4, 3) + '.' +
                   copy(sAux, 7, 3) + '-' +
                   copy(sAux, 10, 2);
           Result:= sCNPJ;
        end;
    14: begin
           sCNPJ:= copy(sAux, 1, 2) + '.' +
                   copy(sAux, 3, 3) + '.' +
                   copy(sAux, 6, 3) + '/' +
                   copy(sAux, 9, 4) + '-' +
                   copy(sAux, 13, 2);
           Result:= sCNPJ;
        end;
   else
      result:= '';
   end;
end;

function VerificaInscricao(insc, uf : AnsiString) : boolean;
var LibHandle : THandle;
    ConsisteInscricaoEstadual : TConsisteInscricaoEstadual;
    iRetInsc : Integer;
begin
   try
     LibHandle:= LoadLibrary(PChar(Trim('DllInscE32.Dll')));
     if LibHandle <= HINSTANCE_ERROR then
        raise Exception.Create ('Dll não carregada');

     @ConsisteInscricaoEstadual:= GetProcAddress (LibHandle, 'ConsisteInscricaoEstadual');
     if @ConsisteInscricaoEstadual = nil then
        raise Exception.Create('Entrypoint Download não encontrado na Dll');

    iRetInsc:= ConsisteInscricaoEstadual(EliminaCaracter(insc), uf);
    if iRetInsc = 0 then
       result:= true
    else
       result:= false;

   finally
     FreeLibrary(LibHandle);
   end;
end;

function RetornaMes(const mes : integer) : string;
begin
   case mes of
      1: result:= 'Janeiro';
      2: result:= 'Fevereiro';
      3: result:= 'Março';
      4: result:= 'Abril';
      5: result:= 'Maio';
      6: result:= 'Junho';
      7: result:= 'Julho';
      8: result:= 'Agosto';
      9: result:= 'Setembro';
     10: result:= 'Outubro';
     11: result:= 'Novembro';
     12: result:= 'Dezembro';
   end;
end;

function ValorExtenso(r : real; i : integer) : string;
type
   TUnidadeS = string[6];
   TDezenaS  = string[9];
   TCentenaS = string[12];
   TUnidade  = array[1..9] of TUnidadeS;
   TDezena1  = array[1..9] of TDezenaS;
   TDezena2  = array[1..9] of TDezenaS;
   TCentena  = array[1..9] of TCentenaS;
var
  aux, aux1, strN : string;
  auxTam, ind, dig, digSuc : integer;
const
   Unidade : TUnidade = ('Um', 'Dois', 'Tres', 'Quatro', 'Cinco', 'Seis', 'Sete', 'Oito', 'Nove');
   Dezena1 : TDezena1 = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze', 'Dezesseis', 'Dezessete',
                         'Dezoito', 'Dezenove');
   Dezena2 : TDezena2 = ('Dez', 'Vinte', 'Trinta', 'Quarenta', 'Cinquenta', 'Sessenta', 'Setenta',
                         'Oitenta', 'Noventa');
   Centena : TCentena = ('Cento', 'Duzentos', 'Trezentos', 'Quatrocentos', 'Quinhentos',
                         'Seiscentos', 'Setecentos', 'Oitocentos', 'Novecentos');
begin
   result:= '';
   if r = 0 then
      exit;
   r:= r * 100;
   strN:= floattostr(r);
   ind:= pos(FormatSettings.DecimalSeparator, strN);

   if ind > 0 then
      begin
         strN:= copy(strN, 1, ind-1);
         r:= StrToFloat(strN);
      end;

   r:= r/100;
   strN:= FloatToStr(r);
   ind:= pos(FormatSettings.DecimalSeparator, strN);

   if ind > 0 then
      begin
         if Length(copy(strN, ind+1, 2)) < 2 then
            strN:= strN + '0';
         delete(strN, ind, 1);
      end
   else
      strN:= strN + '00';

   while Length(strN) < 12 do
     strN:= '' + strN;

   ind:= 1;

   while strN[ind] = '' do
     ind:= ind + 1;

   repeat
     dig:= StrToInt(strN[ind]);

     case ind of
       1: if dig < 0 then
             begin
                result:= result + unidade[dig];
                if dig = 1 then
                   result:= result + 'Bilhoes';
             end;
       2,5,8: if dig > 0 then
                 begin
                    if result > '' then
                       result:= result + 'e ';
                    if dig > 1 then
                       result:= result + centena[dig] + ' '
                    else
                       if (strN[ind+1] = '0') and (strN[ind+2] = '0') then
                          result:= result + 'Cem'
                       else
                          result:= result + centena[dig] + ' ';
                 end;
       3,6,9,11: if dig > 0 then
                    begin
                       if result > '' then
                          result:= result + 'e ';
                       if dig = 1 then
                          if strN[ind+1] = '0' then
                             result:= result + dezena2[dig] + ' '
                          else
                             begin
                                digSuc:= StrToInt(strN[ind+1]);
                                result:= result + dezena1[digSuc] + ' ';
                             end
                       else
                          result:= result + dezena2[dig] + ' ';
                    end;
       4: if dig > 0 then
             begin
                if (strN[ind-1] > '1') or (strN[ind-1] = '0') then
                   result:= result + 'e ' + unidade[dig] + ' '
                else
                   if strN[ind-1] = ' ' then
                      result:= result + unidade[dig] + ' ';
                if ((strN[ind-2] = '0') or (strN[ind-2] = ' ')) and ((strN[ind-1] = '0') or (strN[ind-1] = ' ')) and (strN[ind] = '1') then
                   result:= result + 'Milhao '
                else
                   result:= result + 'Milhoes ';
             end
          else
             if (strN[ind-2] > '0') or (strN[ind-1] > '0') then
                result:= result + 'Milhoes ';
       7: if dig > 0 then
             begin
                if (strN[ind-1] > '1') or (strN[ind-1] = '0') then
                   result:= result + 'e ' + Unidade[dig] +  ' '
                else
                   if strN[ind-1] = ' ' then
                      result:= result + unidade[dig] + ' ';
                   result:= result + 'Mil ';
             end
          else
             if (strN[ind-2] > '0') or (strN[ind-1] > '0') then
                result:= result + 'Mil';
       10: if dig > 0 then
               begin
                  if (strN[ind-1] > '1') or (strN[ind-1] = '0') or (strN[ind-1] = ' ') then
                     if result > '' then
                        result:= result + 'e ' + unidade[dig] + ' '
                     else
                        result:= result + unidade[dig] + ' ';
                  if (strN[ind-1] = ' ') and (strN[ind] = '1') then
                      result:= result + 'Real'
                  else
                     result:= result + 'Reais';
               end
           else
              if result > '' then
                 if (copy(strN, 5, 6) = '000000') then
                    result:= result + 'de Reais'
                 else
                    result:= result + 'Reais';
       12: if dig > 0 then
              begin
                 if (strN[ind-1] > '1') or (strN[ind-1] = '0') then
                     if result > '' then
                        result:= result + 'e ' + unidade[dig] + ' '
                     else
                        result:= result + unidade[dig];
                 if (strN[ind-1] = '0') and (strN[ind] = '1') then
                    result:= result + 'Centavo'
                 else
                    result:= result + 'Centavos'
              end
           else
              if (strN[ind-1] > '0') then
                  result:= result + 'Centavos';
     end;

     ind:= ind + 1;
   until ind > Length(strN);

   if i = 1 then
      begin
         aux:= result;
         auxTam:= 255 - length(aux);
         aux1:= '********************'
               +'********************'
               +'********************'
               +'********************'
               +'********************';
         result:= aux + copy(aux1, 1, auxtam);
      end;
end;

function VerificaCST (sCST : string) : boolean;
begin
   if (copy(sCST, 1, 1) <> '0') and
      (copy(sCST, 1, 1) <> '1') and
      (copy(sCST, 1, 1) <> '2') then
      result:= false
   else
      begin
         if (copy(sCST, 2,2) <> '00') and
            (copy(sCST, 2,2) <> '10') and
            (copy(sCST, 2,2) <> '20') and
            (copy(sCST, 2,2) <> '30') and
            (copy(sCST, 2,2) <> '40') and
            (copy(sCST, 2,2) <> '41') and
            (copy(sCST, 2,2) <> '50') and
            (copy(sCST, 2,2) <> '51') and
            (copy(sCST, 2,2) <> '60') and
            (copy(sCST, 2,2) <> '70') and
            (copy(sCST, 2,2) <> '90') then
               result:= false
         else
            Result:= true;
      end;
end;

function Substitui(substituida : string; substituirpor : string; texto : string) : string;
var sAux : string;
    i : integer;
begin
   sAux:= '';
   for i:= 1  to length(texto) do
      begin
         if copy(texto, i, 1) = substituida then
            sAux:= sAux + substituirpor
         else
            sAux:= sAux + copy(texto, i, 1);
      end;
   result:= sAux;
end;

function EhNumero(s: string): Boolean;
var i: Integer;
begin
  Result:= True;
  for i:= 1 to Length(s) do
     begin
        if not (s[i] in ['0'..'9']) then
           begin
              Result:= False;
              Break;
           end;
     end;
end;

function FormataDataECF(const sString : string) : string;
var sDia, sMes, sAno : string;
    sAuxData : string;
begin
   if Length(trim(sString)) = 12 then
      begin
         sDia:= copy(sString, 1, 2);
         sMes:= copy(sString, 3, 2);
         sAno:= copy(sString, 5, 2);
         sAuxData:= sDia + '/' + sMes + '/' + sAno;
         result:= sAuxData;
      end
   else
      result:= datetostr(date);
end;

function FormataHoraECF(const sString : string) : String ;
var sHor, sMin, sSeg : string;
    sAuxHora : string;
begin
   if Length(trim(sString)) = 12 then
      begin
         sHor:= copy(sString, 7, 2);
         sMin:= copy(sString, 9, 2);
         sSeg:= copy(sString, 11, 2);
         sAuxHora:= sHor + ':' + sMin + ':' + sSeg;
         result:= sAuxHora;
      end
   else
      result:= TimeToStr(time);
end;

function ExatoCurrency(Value: Currency; Decimal: Integer): Currency;
const arrDecimal: array[0..3] of Integer = (1, 10, 100, 1000);
begin
   if (Abs(Decimal) > 3) then
      raise ERangeError.Create('TruncExato: O decimal deve está no intervalo de: 0..3');
   Result := Trunc(Value * arrDecimal[Decimal]) / arrDecimal[Decimal];
end;

function NaoInsereDBGrid(DBGrid: TDBGrid; DataSet: TDataSet; Key: Word): Word;
begin
   {Não deixa inserir registros no DBGrid caso:
    1- estiver em modo de edição: E
    1.1- se clicar na tecla "Insert"; OU
    1.2- se clicar na tecla "Seta para baixo" E estiver no último registro; OU
    1.2- se clicar na tecla "Tab" E estiver no último registro E estiver na
         última coluna visível. }
   Result:= Key;

   if dgEditing in DBGrid.Options then
      begin
         if (Key = VK_INSERT) or ((Key = VK_DOWN) and (DataSet.RecNo = DataSet.RecordCount)) then
            Result := 0
         else
            if (Key = VK_TAB) and (DataSet.RecNo = DataSet.RecordCount) then
               begin
                  if (DBGrid.SelectedIndex = RetIdxUltimaColVisivel(DBGrid)) then
                     Result := 0
               end;
      end;
end;

function RetIdxUltimaColVisivel(DBGrid: TDBGrid): integer;
var x: integer;
begin
  Result:= -1;

  for x:= DBGrid.Columns.Count-1 downto 0 do
     begin
        if DBGrid.Columns.Items[x].Visible then
           begin
              Result:= x;
              Break;
           end;
     end;
end;

function InputQuery(const ACaption, APrompt, Mascara: string; Senha: Boolean;
  var Value: string): Boolean;
var
  Form: TForm;
  Prompt: TLabel;
  Edit: TMaskEdit;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
begin
  Result := False;
  Form := TForm.Create(Application);
  with Form do
    try
      Canvas.Font := Font;
      DialogUnits := GetAveCharSize(Canvas);
      BorderStyle := bsDialog;
      Caption := ACaption;
      ClientWidth := MulDiv(180, DialogUnits.X, 4);
      ClientHeight := MulDiv(63, DialogUnits.Y, 8);
      Position := poScreenCenter;
      Prompt := TLabel.Create(Form);
      with Prompt do
      begin
        Parent := Form;
        AutoSize := True;
        Left := MulDiv(8, DialogUnits.X, 4);
        Top := MulDiv(8, DialogUnits.Y, 8);
        Caption := APrompt;
      end;

      Edit := TMaskEdit.Create(Form);
      with Edit do
      begin
        Parent := Form;
        if Senha then
            PasswordChar := '*'; // AZ
        EditMask := Mascara;
        Left := Prompt.Left;
        Top := MulDiv(19, DialogUnits.Y, 8);
        Width := MulDiv(164, DialogUnits.X, 4);
        MaxLength := 255;
        Text := Value;
        SelectAll;
      end;
      ButtonTop := MulDiv(41, DialogUnits.Y, 8);
      ButtonWidth := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := 'Ok'; // AZ
        ModalResult := mrOk;
        Default := True;
        SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := 'Cancelar'; // AZ
        ModalResult := mrCancel;
        Cancel := True;
        SetBounds(MulDiv(92, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      if ShowModal = mrOk then
      begin
        Value := Edit.Text;
        Result := True;
      end;
    finally
      Form.Free;
    end;
end;
function GetAveCharSize(Canvas: TCanvas): TPoint;
var
  I: Integer;
  Buffer: array[0..51] of Char;
begin
  for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
  for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
  GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
  Result.X := Result.X div 52;
end;

end.

