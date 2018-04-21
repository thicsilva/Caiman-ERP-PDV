unit Extensos;

interface

Function Extenso(Valor: double):string;
implementation
uses
    SysUtils;
const
     Centenas: array[1..9] of string[12]=('CEM','DUZENTOS','TREZENTOS','QUATROCENTOS',
                                          'QUINHENTOS','SEISCENTOS','SETECENTOS',
                                          'OITOCENTOS','NOVECENTOS');
     Dezenas : array[2..9] of string[10]=('VINTE','TRINTA','QUARENTA','CINQUENTA',
                                          'SESSENTA','SETENTA','OITENTA','NOVENTA');
     Dez : array[0..9] of string[10]=('DEZ','ONZE','DOZE','TREZE','QUATORZE',
                                      'QUINZE','DEZESSEIS','DEZESSETE',
                                      'DEZOITO','DEZENOVE');
     Unidades: array[1..9] of string[10]=('UM','DOIS','TRES','QUATRO','CINCO',
                                          'SEIS','SETE','OITO','NOVE');
     MoedaSingular = 'REAL';
     MoedaPlural   = 'REAIS';
     CentSingular  = 'CENTAVO';
     CentPlural    = 'CENTAVOS';
     Zero          = 'ZERO';

Function Ext3(Parte:string):string;
var
  Base: string;
  digito: integer;
begin 
  Base:='';
  digito:=StrToInt(Parte[1]);
  if digito=0 then
      Base:=''
  else
     Base:=Centenas[digito];
  if (digito = 1) and (Parte > '100') then
      Base:='CENTO';
  Digito:=StrToInt(Parte[2]);
  if digito = 1 then
     begin 
         Digito:=StrToInt(Parte[3]);
         if Base <> '' then
            Base:=Base + ' E ';
        Base:=Base + Dez[Digito];
     end
  else
     begin 
         if (Base <> '') and (Digito > 0) then
            Base:=Base+' E ';
         if Digito > 1 then
            Base:=Base + Dezenas[digito];
           Digito:=StrToInt(Parte[3]);
         if Digito > 0 then
           begin 
               if Base <> '' then
                  Base:=Base+' E ';
               Base:=Base+Unidades[Digito];
           end;
     end;
  Result:=Base;
end;

Function Extenso;
var
  ComoTexto: string;
  Parte: string;
begin 
  Result:='';
  ComoTexto:=FloatToStrF(Abs(Valor),ffFixed,18,2);
  // Acrescenta zeros a esquerda ate 12 digitos
  while length(ComoTexto) < 15 do
           Insert('0',ComoTexto,1);
  // Retira caracteres a esquerda para o máximo de 12 digitos
  while length(ComoTexto) > 15 do
           delete(ComoTexto,1,1);
  // Calcula os bilhões
  Parte:=Ext3(copy(ComoTexto,1,3));
  if StrToInt(copy(ComoTexto,1,3)) = 1 then
     Parte:=Parte + ' BILHAO'
  else
     if Parte <> '' then
        Parte:=Parte + ' BILHOES';
     Result:=Parte;
  // Calcula os milhões
  Parte:=Ext3(copy(ComoTexto,4,3));
  if Parte <> '' then
      begin 
          if Result <> '' then
             Result:=Result+', ';
          if StrToInt(copy(ComoTexto,4,3)) = 1 then
             Parte:=Parte + ' MILHAO'
          else
            Parte:=Parte + ' MILHOES';
          Result:=Result + Parte;
      end;
  // Calcula os milhares
  Parte:=Ext3(copy(ComoTexto,7,3));
  if Parte <> '' then
      begin 
           if Result <> '' then
              Result:=Result + ', ';
           Parte:=Parte + ' MIL';
           Result:=Result + Parte;
      end;
  // Calcula as unidades
  Parte:=Ext3(copy(ComoTexto,10,3));
  if Parte <> '' then
     begin 
          if Result <> '' then
             if Frac(Valor) = 0 then
                Result:=Result + ' E '
            else
                Result:=Result + ', ';
            Result:=Result + Parte;
     end;
  // Acrescenta o texto da moeda
  if Int(Valor) = 1 then
     Parte:=' ' + MoedaSingular
  else
    Parte:=' ' + MoedaPlural;
  if copy(ComoTexto,7,6) = '000000' then
     Parte:='DE ' + MoedaPlural;
  Result:=Result + Parte;
  // Se o valor for zero, limpa o resultado
  if int(Valor) = 0 then
     Result:='';
  //Calcula os centavos
  Parte:=Ext3('0'+copy(ComoTexto,14,2));
  if Parte <> '' then
     begin 
         if Result <> '' then
            Result:=Result + ' E ';
         if Parte = Unidades[1] then
            Parte:=Parte + ' '+CentSingular
         else
            Parte:=Parte + ' '+CentPlural;
         Result:=Result + Parte;
     end;
  // Se o valor for zero, assume a constante ZERO
  if Valor = 0 then
      Result:=Zero;
end;

end.
