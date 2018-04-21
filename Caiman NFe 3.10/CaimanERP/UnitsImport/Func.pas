unit Func;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, StdCtrls, ExtCtrls, Buttons, ShellAPI, Registry, PsAPI, TLHelp32,ExtActns,URLMon,ddeman ;


  function cpuid:String;
  function cpuidA:String;
  procedure ChangeByteOrder( var Data; Size : Integer );
  function GetIdeDiskSerialNumber : String;
  Procedure EnDecryptFile(pathin: String; Chave : Word);

  function HexToInt(const HexStr: string): longint;
  function GetTmpDir: string;
procedure ApagaPasta(pasta: string);
  Function FormataCNPJ(Numero: String): String;
Function FormataCPF(Numero: String): String;
Function FormataCNPJ_CPF(Numero: String): String;
  Function ValidaCPFCNPJ(CPFCNPJ: string): boolean;
  //DesligaWindows(EWX_SHUTDOWN); // desligar normal
//DesligaWindows(EWX_FORCE); //sair forçado
//DesligaWindows(EWX_POWEROFF); //para fontes ATX
//DesligaWindwos(EWX_LOGOFF); //efetua logoff
//DesligaWindows(EWX_REBOOT); //reinicializa o computador
procedure DesligaWindows(acao: Cardinal);
function RetiraCaracter(Text: string) : string;



  function Executa(Arquivo : String):boolean;
function GetURL(Service: string): string;

    function DoDownload(vURL, vArquivo : String): Boolean;
    //download de arquivo
    function DownloadFile(Source, Dest: string): Boolean;
    //fecha processo
    function KillTask(ExeFileName: string): integer;
    //Desabilita CTRLALTDEL no xp
    procedure HabilitaCTRLALTDEL(YesNo : boolean) ;
    //acha processo
    Procedure ApagaProcessosn(sPrograma: string; n: integer);
    Function AchaProcessosn(sPrograma: string) : integer;
    Function AchaProcessos(sPrograma: string) : Boolean;
    //fecha processo
    Procedure ApagaProcessos(sPrograma: string);
    //Lista todos os processos
    Procedure ListaProcessos;
    // criptografia com chave
    Function Cr(mStr, mChave: string): string;
    // criptografia sem chave
    function enc( dummy: PChar ): PChar;
    //ve se tem disco
    function Disk(const drive : integer): boolean;
    // ve serial do hd
    function SSerial( FDrive:string ): String;
    // cryptografia
    function Crypt(Action, Src: String): String;




    var
    StringList: TStrings;


implementation

function cpuid:string;
var
a,b,c,d: LongWord;
CPUID: string;
begin
asm
push EAX
push EBX
push ECX
push EDX

mov eax, 1
db $0F, $A2
mov a, EAX
mov b, EBX
mov c, ECX
mov d, EDX

pop EDX
pop ECX
pop EBX
pop EAX

{
mov eax, 1
db $0F, $A2
mov a, EAX
mov b, EBX
mov c, ECX
mov d, EDX
}
end;
CPUID:=inttohex(a,8) + '-' + inttohex(b,8) + '-' + inttohex(c,8) + '-' + inttohex(d,8);
result := CPUID;
end;
function cpuidA:string;
var
a,b,c,d: LongWord;
CPUID: string;
begin
asm
push EAX
push EBX
push ECX
push EDX

mov eax, 1
db $0F, $A2
mov a, EAX
mov b, EBX
mov c, ECX
mov d, EDX

pop EDX
pop ECX
pop EBX
pop EAX

{
mov eax, 1
db $0F, $A2
mov a, EAX
mov b, EBX
mov c, ECX
mov d, EDX
}
end;
CPUID:=inttostr(a);
result := CPUID;
end;

procedure ChangeByteOrder( var Data; Size : Integer );
var
  ptr : PChar;
  i : Integer;
  c : Char;
begin
  ptr := @Data;
  for i := 0 to (Size shr 1)-1 do
  begin
    c := ptr^;
    ptr^ := (ptr+1)^;
    (ptr+1)^ := c;
    Inc(ptr,2);
  end;
end;

{ função que pega o serial number FÍSICO do HD e retorna string }

function GetIdeDiskSerialNumber : String;
   type
    TSrbIoControl = packed record
      HeaderLength: ULONG;
      Signature: Array[0..7] of Char;
      Timeout: ULONG;
      ControlCode: ULONG;
      ReturnCode: ULONG;
      Length: ULONG;
   end;
   SRB_IO_CONTROL = TSrbIoControl;
   PSrbIoControl = ^TSrbIoControl;

    TIDERegs = packed record
      bFeaturesReg : Byte; // especificar "comandos" SMART
      bSectorCountReg : Byte; // registro de contador de setor
      bSectorNumberReg : Byte; // registro de número de setores
      bCylLowReg : Byte; // valor de cilindro (byte mais baixo)
      bCylHighReg : Byte; // valor de cilindro (byte mais alto)
      bDriveHeadReg : Byte; // registro de drive/cabeça
      bCommandReg : Byte; // comando IDE
      bReserved : Byte; // reservado- tem que ser zero
   end;
    IDEREGS = TIDERegs;
    PIDERegs = ^TIDERegs;

   TSendCmdInParams = packed record
      cBufferSize : DWORD;
      irDriveRegs : TIDERegs;
      bDriveNumber : Byte;
      bReserved : Array[0..2] of Byte;
      dwReserved : Array[0..3] of DWORD;
      bBuffer : Array[0..0] of Byte;
    end;
    SENDCMDINPARAMS = TSendCmdInParams;
    PSendCmdInParams = ^TSendCmdInParams;

    TIdSector = packed record
      wGenConfig : Word;
      wNumCyls : Word;
      wReserved : Word;
      wNumHeads : Word;
      wBytesPerTrack : Word;
      wBytesPerSector : Word;
      wSectorsPerTrack : Word;
      wVendorUnique : Array[0..2] of Word;
      sSerialNumber : Array[0..19] of Char;
      wBufferType : Word;
      wBufferSize : Word;
      wECCSize : Word;
      sFirmwareRev : Array[0..7] of Char;
      sModelNumber : Array[0..39] of Char;
      wMoreVendorUnique : Word;
      wDoubleWordIO : Word;
      wCapabilities : Word;
      wReserved1 : Word;
      wPIOTiming : Word;
      wDMATiming : Word;
      wBS : Word;
      wNumCurrentCyls : Word;
      wNumCurrentHeads : Word;
      wNumCurrentSectorsPerTrack : Word;
      ulCurrentSectorCapacity : ULONG;
      wMultSectorStuff : Word;
      ulTotalAddressableSectors : ULONG;
      wSingleWordDMA : Word;
      wMultiWordDMA : Word;
      bReserved : Array[0..127] of Byte;
    end;
    PIdSector = ^TIdSector;

  const
    IDE_ID_FUNCTION = $EC;
    IDENTIFY_BUFFER_SIZE = 512;
    DFP_RECEIVE_DRIVE_DATA = $0007c088;
    IOCTL_SCSI_MINIPORT = $0004d008;
    IOCTL_SCSI_MINIPORT_IDENTIFY = $001b0501;
    DataSize = sizeof(TSendCmdInParams)-1+IDENTIFY_BUFFER_SIZE;
    BufferSize = SizeOf(SRB_IO_CONTROL)+DataSize;
    W9xBufferSize = IDENTIFY_BUFFER_SIZE+16;
  var
    hDevice : THandle;
    cbBytesReturned : DWORD;
    pInData : PSendCmdInParams;
    pOutData : Pointer; // PSendCmdOutParams
    Buffer : Array[0..BufferSize-1] of Byte;
    srbControl : TSrbIoControl absolute Buffer;

  begin
    Result := '';
    FillChar(Buffer,BufferSize,#0);

    if Win32Platform=VER_PLATFORM_WIN32_NT then
    // Windows NT, Windows 2000, Windows XP
    begin
      // recuperar handle da porta SCSI
      hDevice := CreateFile('\\.\Scsi0:',
      // Nota: '\\.\C:' precisa de privilégios administrativos
      GENERIC_READ or GENERIC_WRITE, FILE_SHARE_READ or FILE_SHARE_WRITE,  nil, OPEN_EXISTING, 0, 0);
      if hDevice=INVALID_HANDLE_VALUE then Exit;
      try
        srbControl.HeaderLength := SizeOf(SRB_IO_CONTROL);
        System.Move('SCSIDISK',srbControl.Signature,8);
        srbControl.Timeout := 2;
        srbControl.Length := DataSize;
        srbControl.ControlCode := IOCTL_SCSI_MINIPORT_IDENTIFY;
        pInData := PSendCmdInParams(PChar(@Buffer)
        +SizeOf(SRB_IO_CONTROL));
        pOutData := pInData;
       with pInData^ do
       begin
         cBufferSize := IDENTIFY_BUFFER_SIZE;
         bDriveNumber := 0;
         with irDriveRegs do
         begin
           bFeaturesReg := 0;
           bSectorCountReg := 1;
           bSectorNumberReg := 1;
           bCylLowReg := 0;
           bCylHighReg := 0;
           bDriveHeadReg := $A0;
           bCommandReg := IDE_ID_FUNCTION;
         end;
      end;
      if not DeviceIoControl( hDevice, IOCTL_SCSI_MINIPORT, @Buffer, BufferSize, @Buffer, BufferSize, cbBytesReturned, nil ) then Exit;
     finally
       CloseHandle(hDevice);
     end;
   end
   else
   begin
      // Windows 95 OSR2, Windows 98, Windows ME
      hDevice := CreateFile( '\\.\SMARTVSD', 0, 0, nil, CREATE_NEW, 0, 0 );
      if hDevice=INVALID_HANDLE_VALUE then Exit;
      try
        pInData := PSendCmdInParams(@Buffer);
        pOutData := @pInData^.bBuffer;
        with pInData^ do
        begin
           cBufferSize := IDENTIFY_BUFFER_SIZE;
           bDriveNumber := 0;
           with irDriveRegs do
           begin
             bFeaturesReg := 0;
             bSectorCountReg := 1;
             bSectorNumberReg := 1;
             bCylLowReg := 0;
             bCylHighReg := 0;
             bDriveHeadReg := $A0;
             bCommandReg := IDE_ID_FUNCTION;
           end;
         end;
         if not DeviceIoControl( hDevice, DFP_RECEIVE_DRIVE_DATA, pInData, SizeOf(TSendCmdInParams)-1, pOutData, W9xBufferSize, cbBytesReturned, nil ) then Exit;
        finally
          CloseHandle(hDevice);
        end;
     end;
     with PIdSector(PChar(pOutData)+16)^ do
     begin
        ChangeByteOrder(sSerialNumber,SizeOf(sSerialNumber));
        SetString(Result,sSerialNumber,SizeOf(sSerialNumber));
     end;
  end;



Procedure EnDecryptFile(pathin: String; Chave : Word);
var
   InMS, OutMS : TMemoryStream;
   I : Integer;
   C : byte;
begin
  InMS := TMemoryStream.Create;
  OutMS := TMemoryStream.Create;

    try
        InMS.LoadFromFile(pathin);
        InMS.Position := 0;

        for I := 0 to InMS.Size - 1 do
          begin
              InMS.Read(C, 1);
              C := (C xor not(ord(chave shr I)));
              OutMS.Write(C,1);
          end;
          deletefile( pathin );
          OutMS.SaveToFile(pathin);

   finally

       InMS.Free;
       OutMS.Free;
   end;
end;


function HexToInt(const HexStr: string): longint;
var
iNdx: integer;
cTmp: Char;
begin
Result := 0;
for iNdx := 1 to Length(HexStr) do
begin
cTmp := HexStr[iNdx];
case cTmp of
'0'..'9': Result := 16 * Result + (Ord(cTmp) - $30);
'A'..'F': Result := 16 * Result + (Ord(cTmp) - $37);
'a'..'f': Result := 16 * Result + (Ord(cTmp) - $57);
else
raise EConvertError.Create('Illegal character in hex string');
end;
end;
end;


function GetTmpDir: string;
var
  pc: PChar;
begin
  pc := StrAlloc(MAX_PATH + 1);
  GetTempPath(MAX_PATH, pc);
  Result := String(pc);
  StrDispose(pc);
end;


procedure ApagaPasta(pasta: string);
var
Arquivo: TSearchRec;
begin
if FindFirst(pasta+'\*.*', 0, Arquivo) = 0 then
begin
repeat
DeleteFile(pasta+'\'+Arquivo.Name);
until FindNext(Arquivo) <> 0;
FindClose(Arquivo);
end;
{if (RemoveDir(pasta) = TRUE) then
AlertaCad('Pasta apagada com sucesso!')
else
AlertaCad('Falha ao apagar a pasta');}
RemoveDir(pasta);
end;


Function FormataCNPJ(Numero: String): String;
var
tmp,resultado: String;
indx, indx1: integer;
begin
if Length(Numero) < 12 Then
begin
result := '';
exit;
end;

for indx := 1 to Length(Numero) do
begin
if Numero[indx] in ['0'..'9'] Then
resultado := resultado + Numero[indx];
end;
if Length(Resultado) < 14 Then
resultado := StringOfChar('0', 14 - Length(Resultado)) + resultado;
tmp := Copy(resultado,1,2) + '.';
tmp := tmp + Copy(resultado,3,3) + '.';
tmp := tmp + Copy(resultado,6,3) + '/';
tmp := tmp + Copy(resultado,9,4) + '-' + Copy(resultado,13,2);
Result := tmp;
end;


Function FormataCPF(Numero: String): String;
var
tmp,resultado: String;
indx, indx1: integer;
begin
if Length(Numero) < 10 Then
begin
result := '';
exit;
end;

for indx := 1 to Length(Numero) do
begin
if Numero[indx] in ['0'..'9'] Then
resultado := resultado + Numero[indx];
end;
if Length(Resultado) < 11 Then
resultado := StringOfChar('0', 11 - Length(Resultado)) + resultado;
tmp := Copy(resultado,1,3) + '.';
tmp := tmp + Copy(resultado,4,3) + '.';
tmp := tmp + Copy(resultado,7,3) + '-';
tmp := tmp + Copy(resultado,10,2);
Result := tmp;
end;

Function FormataCNPJ_CPF(Numero: String): String;
var
indx, tamanho: integer;
resultado: String;
begin
for indx := 1 to Length(Numero) do
begin
if Numero[indx] in ['0'..'9'] Then
resultado := resultado + Numero[indx];
end;

if (Length(resultado) > 11) Then
resultado := FormataCNPJ(resultado)
else
resultado := FormataCPF(resultado);
result := resultado;
end;


Function ValidaCPFCNPJ(CPFCNPJ: string): boolean;
var
count, tam, i, soma: integer;
num: array of integer;
begin
Result:=False;
tam:=0;
SetLength(num,tam);
for i:=1 to Length(CPFCNPJ) do
if CPFCNPJ[i] in ['0'..'9'] then
begin
inc(tam);
SetLength(num,tam);
Val(CPFCNPJ[i],num[tam-1],soma);
end;

if not(tam in [11,14]) then Exit;

count:=2;
soma:=0;
for i:=Length(num)-3 downto 0 do
begin
soma:=soma+(num[i]*count);
inc(count);
if (tam = 14) and (count > 9) then count:=2;
end;
soma:=11-(soma mod 11);
if soma > 9 then soma:=0;

if not(num[tam-2]=soma) then Exit;

soma:=soma*2;
count:=3;
for i:=Length(num)-3 downto 0 do
begin
soma:=soma+(num[i]*count);
inc(count);
if (tam = 14) and (count > 9) then count:=2;
end;
soma:=11-(soma mod 11);
if soma > 9 then soma:=0;

if not(num[tam-1]=soma) then Exit;

Result:=True;
end;

procedure DesligaWindows(acao: Cardinal);
var
TokenPriv: TTokenPrivileges;
H: DWORD;
HToken: THandle;
begin

{* para WIN 2000, XP e NT *}
if Win32Platform = VER_PLATFORM_WIN32_NT then
begin
OpenProcessToken(GetCurrentProcess, TOKEN_ADJUST_PRIVILEGES, HToken);
LookUpPrivilegeValue(nil, 'SeShutdownPrivilege',
TokenPriv.Privileges[0].Luid);
TokenPriv.PrivilegeCount := 1;
TokenPriv.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
H := 0;
AdjustTokenPrivileges(HToken, False, TokenPriv, 0,PTokenPrivileges(nil)^, H);
CloseHandle(HToken);
end;
ExitWindowsEx(acao, 0);
end;

function Executa(Arquivo : String):boolean;
var
StartupInfo : TStartupInfo;
ProcessInfo : TProcessInformation;
begin
FillChar (StartupInfo, Sizeof(StartupInfo), #0);
with StartupInfo do
begin
cb := sizeof(StartupInfo);
dwFlags := STARTF_USESHOWWINDOW;
wShowWindow := SW_SHOW;
end;
Result:=CreateProcess(nil,PChar(Arquivo), nil, nil, false, CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo);
If Result then
begin
Application.Minimize;
WaitForSingleObject(ProcessInfo.hProcess, Infinite);
Application.Restore;
end;
end;




function GetURL(Service: string): string;
var
  ClDDE: TDDEClientConv;
  temp: PChar;
begin
  Result := '';
  //create a new DDE Client object
  ClDDE := TDDEClientConv.Create(nil);
  with ClDDE do
  begin
    SetLink(Service, 'WWW_GetWindowInfo');
    temp := pchar(RequestData('0xFFFFFFFF'));
    Result := StrPas(temp);
    StrDispose(temp);
    CloseLink;
  end;
  ClDDE.Free;
end;






function DoDownload(vURL, vArquivo : String): Boolean;
begin
  with TDownloadURL.Create(nil) do
  try
    URL:= vURL;
    FileName := vArquivo;

    ExecuteTarget(nil) ;
  finally
    Free;
    Result := True;
  end;

end;


function DownloadFile(Source, Dest: string): Boolean;
begin
  try
    Result:= UrlDownloadToFile(nil, PChar(source),PChar(Dest), 0, nil) = 0;
  except
    Result:= False;
  end;
end;


function KillTask(ExeFileName: string): integer;
const
PROCESS_TERMINATE=$0001;
var
ContinueLoop: BOOL;
FSnapshotHandle: THandle;
FProcessEntry32: TProcessEntry32;
begin
result := 0;

FSnapshotHandle := CreateToolhelp32Snapshot
(TH32CS_SNAPPROCESS, 0);
FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
ContinueLoop := Process32First(FSnapshotHandle,
FProcessEntry32);

while integer(ContinueLoop) <> 0 do
begin
if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
UpperCase(ExeFileName))
or (UpperCase(FProcessEntry32.szExeFile) =
UpperCase(ExeFileName))) then
Result := Integer(TerminateProcess(OpenProcess(
PROCESS_TERMINATE, BOOL(0),
FProcessEntry32.th32ProcessID), 0));
ContinueLoop := Process32Next(FSnapshotHandle,
FProcessEntry32);
end;
end;

procedure HabilitaCTRLALTDEL(YesNo : boolean) ;
const
  sRegPolicies = '\Software\Microsoft\Windows\CurrentVersion\Policies';
begin
  with TRegistry.Create do
  try
    RootKey:=HKEY_CURRENT_USER;
    if OpenKey(sRegPolicies+'\System\',True) then
    begin
      case YesNo of
      False:
      begin
        WriteInteger('DisableTaskMgr',1) ;
      end;
      True:
      begin
        WriteInteger('DisableTaskMgr',0) ;
      end;
    end;
  end;
  CloseKey;
  if OpenKey(sRegPolicies + '\Explorer\',True) then
  begin
  case YesNo of
  False:
  begin
    WriteInteger('NoChangeStartMenu',1) ;
    WriteInteger('NoClose',1) ;
    WriteInteger('NoLogOff',1) ;
  end;
  True:
  begin
    WriteInteger('NoChangeStartMenu',0) ;
    WriteInteger('NoClose',0) ;
    WriteInteger('NoLogOff',0) ;
  end;
  end;
  end;
  CloseKey;
  finally
  Free;
  end;
end;

Procedure ApagaProcessosn(sPrograma: string; n: integer);
var
  SnapShot : THandle;
  pe       : TProcessEntry32;
  codigo   : string;
  processo : dword;
  C,nn        : integer;
begin
   nn := 0;
  SnapShot := CreateToolhelp32Snapshot((TH32CS_SNAPPROCESS or TH32CS_SNAPTHREAD),0);
  pe.dwSize := sizeof(TProcessEntry32);
  Process32First(SnapShot,pe);
  codigo := '';
  processo := 0;

  // procura todos sPrograma abertos
  repeat
  if (UpperCase(String(pe.szExeFile)) = UpperCase(sPrograma)) or (  pos( Uppercase( sPrograma), Uppercase(String(pe.szExeFile)) ) > 0  )then
  begin
    nn := nn + 1;

    codigo := format('%x',[pe.th32ProcessID]);
    // Converte a string em dword
    for C:=1 to length(codigo) do
    begin
      processo := processo shl 4;
      if ord(codigo[C]) >= ord('A') then
        processo:=processo + (ord(codigo[C])-ord('A')+10)
      else
        processo:=processo + (ord(codigo[C])-ord('0'));
     end;
  // fecha o processo
  if  not (nn > n) then
    try
      TerminateProcess(OpenProcess($0001,false,processo),0); // $0001 = Process_Terminate.
      codigo := '';
      processo := 0;
    except
      MessageDLG('Falha ao encerrar o processo!',mtInformation,[mbOK],0);
    end;
  end;
  until Process32Next(SnapShot,pe) = false;
end;


Function AchaProcessosn(sPrograma: string) : integer;
var
  SnapShot :THandle;
  pe       :TProcessEntry32;
  codigo   : string;
  processo : dword;
  C,n        : integer;
  Achei    : Boolean;

begin
  n := 0;
  SnapShot := CreateToolhelp32Snapshot((TH32CS_SNAPPROCESS or TH32CS_SNAPTHREAD),0);
  pe.dwSize := sizeof(TProcessEntry32);
  Process32First(SnapShot,pe);
  codigo := '';
  processo := 0;
  Result := 0;
  // procura todos sPrograma abertos
  repeat
  if (UpperCase(String(pe.szExeFile)) = UpperCase(sPrograma)) or (  pos( Uppercase( sPrograma), Uppercase(String(pe.szExeFile)) ) > 0  ) then
  begin
    n := n + 1;
    codigo := format('%x',[pe.th32ProcessID]);
    // Converte a string em dword
    for C:=1 to length(codigo) do
    begin
      processo := processo shl 4;
      if ord(codigo[C]) >= ord('A') then
        processo:=processo + (ord(codigo[C])-ord('A')+10)
      else
        processo:=processo + (ord(codigo[C])-ord('0'));
    end;
    try
      Result := n;
    except
      //
    end;
  end;
  until Process32Next(SnapShot,pe) = false;
end;


Function AchaProcessos(sPrograma: string) : Boolean;
var
  SnapShot :THandle;
  pe       :TProcessEntry32;
  codigo   : string;
  processo : dword;
  C        : integer;
  Achei    : Boolean;
begin
  SnapShot := CreateToolhelp32Snapshot((TH32CS_SNAPPROCESS or TH32CS_SNAPTHREAD),0);
  pe.dwSize := sizeof(TProcessEntry32);
  Process32First(SnapShot,pe);
  codigo := '';
  processo := 0;
  Result := False;
  // procura todos sPrograma abertos
  repeat
  if (UpperCase(String(pe.szExeFile)) = UpperCase(sPrograma)) or (  pos( Uppercase( sPrograma), Uppercase(String(pe.szExeFile)) ) > 0  ) then
  begin
    codigo := format('%x',[pe.th32ProcessID]);
    // Converte a string em dword
    for C:=1 to length(codigo) do
    begin
      processo := processo shl 4;
      if ord(codigo[C]) >= ord('A') then
        processo:=processo + (ord(codigo[C])-ord('A')+10)
      else
        processo:=processo + (ord(codigo[C])-ord('0'));
    end;
    try
      Result := True;
    except
      //
    end;
  end;
  until Process32Next(SnapShot,pe) = false;
end;

Procedure ApagaProcessos(sPrograma: string);
var
  SnapShot : THandle;
  pe       : TProcessEntry32;
  codigo   : string;
  processo : dword;
  C        : integer;
begin
  SnapShot := CreateToolhelp32Snapshot((TH32CS_SNAPPROCESS or TH32CS_SNAPTHREAD),0);
  pe.dwSize := sizeof(TProcessEntry32);
  Process32First(SnapShot,pe);
  codigo := '';
  processo := 0;

  // procura todos sPrograma abertos
  repeat
  if (UpperCase(String(pe.szExeFile)) = UpperCase(sPrograma)) or (  pos( Uppercase( sPrograma), Uppercase(String(pe.szExeFile)) ) > 0  )then
  begin
    codigo := format('%x',[pe.th32ProcessID]);
    // Converte a string em dword
    for C:=1 to length(codigo) do
    begin
      processo := processo shl 4;
      if ord(codigo[C]) >= ord('A') then
        processo:=processo + (ord(codigo[C])-ord('A')+10)
      else
        processo:=processo + (ord(codigo[C])-ord('0'));
     end;
  // fecha o processo
    try
      TerminateProcess(OpenProcess($0001,false,processo),0); // $0001 = Process_Terminate.
      codigo := '';
      processo := 0;
    except
      MessageDLG('Falha ao encerrar o processo!',mtInformation,[mbOK],0);
    end;
  end;
  until Process32Next(SnapShot,pe) = false;
end;

Procedure ListaProcessos;
var
  SnapShot :THandle;
  pe       :TProcessEntry32;
  iProc    :Integer;

begin
  StringList := TStringList.Create;
  iProc := 0;
  SnapShot := CreateToolhelp32Snapshot((TH32CS_SNAPPROCESS or TH32CS_SNAPTHREAD),0);
  pe.dwSize := sizeof(TProcessEntry32);
  Process32First(SnapShot,pe);

    StringList.Clear;

  // procura todos sPrograma abertos
  repeat
    inc(iProc);
    StringList.Add(String(pe.szExeFile));
  until Process32Next(SnapShot,pe) = false;
end;



Function Cr(mStr, mChave: string): string;
var
i, TamanhoString, pos, PosLetra, TamanhoChave: Integer;
begin
Result := mStr;
TamanhoString := length(mStr);
TamanhoChave := length(mChave);
for i := 1 to TamanhoString do
begin
pos := (i mod TamanhoChave);
if pos = 0 then
pos := TamanhoChave;
posLetra := ord(Result[i]) xor ord(mChave[pos]);
if posLetra = 0 then
posLetra := ord(Result[i]);
Result[i] := chr(posLetra);
end; end;


function SSerial( FDrive:string ): String;
var
  Serial: DWord;
  DirLen, Flags: DWord;
  DLabel: array[0..11] of char;
  conta: int64;
begin
   try
      GetVolumeInformation( PChar( FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
      conta :=  serial + strtoint( cpuidA );
      result := IntToStr( Conta );
   except
      result := '';
   end;
end;


function enc( dummy: PChar ): PChar;
var
   X: integer;
   W: Word;
   S: String;
   C: Char;
begin
   S := StrPas( dummy );
   W := StrLen( dummy );
   for X := 1 to W do
      begin
         C := S[X];
         C := Char( ord( C ) xor 159 );
         S[X] := C;
      end;
   StrPCopy( dummy, S );
   enc := dummy;
end;

function Disk(const drive : integer): boolean;
begin
   if DiskSize( Drive ) = -1 then
      begin
         Result := True;
      end
   else
      begin
         Result := False;
      end;
end;

Function Crypt(Action, Src: String): String;
Label Fim;
var
  KeyLen : Integer;
  KeyPos : Integer;
  OffSet : Integer;
  Dest, Key : String;
  SrcPos : Integer;
  SrcAsc : Integer;
  TmpSrcAsc : Integer;
  Range : Integer;
  vRange: Pointer;
  vMemory: TMemoryStream;
begin
  if (Src = '') Then
  begin
    Result:= '';
  Goto Fim;
  end;
  vMemory := TMemoryStream.Create;
  vRange  := vMemory.Memory;
  Key := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKD'+
  'F3424SKL K3LAKDJSL9RTIKJ';
  Dest := '';
  KeyLen := Length(Key + vMemory.MethodName(vRange));
  // KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;
  if (Action = UpperCase('C')) then
  begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x',[OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      //Application.ProcessMessages;
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
      if KeyPos < KeyLen then
        KeyPos := KeyPos + 1
      else
        KeyPos := 1;
      SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      Dest   := Dest + Format('%1.2x',[SrcAsc]);
      OffSet := SrcAsc;
    end;
  end
  else if (Action = UpperCase('D')) then
  begin
    OffSet := StrToInt('$'+ copy(Src,1,2));
    SrcPos := 3;
    repeat
      SrcAsc := StrToInt('$'+ copy(Src,SrcPos,2));
    if (KeyPos < KeyLen) then
      KeyPos := KeyPos + 1
    else
      KeyPos := 1;
    TmpSrcAsc := SrcAsc xor Ord(Key[KeyPos]);
    if TmpSrcAsc <= OffSet then
      TmpSrcAsc := 255 + TmpSrcAsc - OffSet
    else TmpSrcAsc := TmpSrcAsc - OffSet;
      Dest := Dest + Chr(TmpSrcAsc);
    OffSet := SrcAsc;
    SrcPos := SrcPos + 2;
    until (SrcPos >= Length(Src));
  end;
  Result:= Dest;
  Fim:
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


end.

