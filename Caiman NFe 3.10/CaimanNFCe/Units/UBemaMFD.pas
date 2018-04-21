unit UBemaMFD;

interface

uses windows, SysUtils, Dialogs, Forms;

type
  TDLLBemaMFD = class
    private
      DLLLoaded : boolean;
      MP2100Loaded : boolean;
      hDLL: THandle;

      GeraRegistrosTipoE : function (MemFileName, ReportFileName, DataInicial, DataFinal, RazaoSocial, Endereco, Modelo, Cmd,  CRZ, CRO, COO, GNF, CCF, CVC, CBP, GRG, CMV, CFD, GT, NECF, BP : String ): Integer; StdCall;
      GeraTxtPorCOO      : function (MfdFileName, TxtFileName : String; Usuario, COOInicial, COOFinal : integer): Integer; StdCall;

      procedure DLLLoad(DLLName : string);
      procedure DLLUnLoad();
      function Loaded() : boolean;
    public
      MP2100 : boolean;
      constructor create(); overload;
      destructor destroy(); overload;

      function BemaGeraRegistrosTipoE (MemFileName, ReportFileName, DataInicial, DataFinal, RazaoSocial, Endereco, Modelo, Cmd,  CRZ, CRO,
                                       COO, GNF, CCF, CVC, CBP, GRG, CMV, CFD, GT, NECF, BP : String ): Integer;
      function BemaGeraTxtPorCOO (MfdFileName, TxtFileName : String; Usuario, COOInicial, COOFinal : Integer): Integer;
  end;

var
  BemaDLL : TDLLBemaMFD;

implementation

{ TDLLBemaMFD }

function TDLLBemaMFD.Loaded() : boolean;
var Path : string;
Begin
  if MP2100 then // Tem que dar um load na dll da Mp2100
  Begin
    if not MP2100Loaded then // Troca de DLL
    Begin
      DLLUnLoad();
      DLLLoad('BemaMFD2.dll');
      MP2100Loaded := true;
    end;
  end
  else
  Begin
    if MP2100Loaded then // troca de DLL
    Begin
      DLLUnLoad();
      DLLLoad('BemaMFD.dll');
      MP2100Loaded := false;
    end
  end;
  result := DLLLoaded;
end;

function TDLLBemaMFD.BemaGeraRegistrosTipoE(MemFileName, ReportFileName,
  DataInicial, DataFinal, RazaoSocial, Endereco, Modelo, Cmd, CRZ, CRO,
  COO, GNF, CCF, CVC, CBP, GRG, CMV, CFD, GT, NECF, BP: String): Integer;
begin
  if Loaded then
  Begin
    if @GeraRegistrosTipoE = nil then
      @GeraRegistrosTipoE := GetProcAddress(hDll, Pchar('BemaGeraRegistrosTipoE'));
    if @GeraRegistrosTipoE <> nil then
      Result := GeraRegistrosTipoE(MemFileName,ReportFileName,DataInicial,DataFinal,RazaoSocial,Endereco,Modelo,Cmd,CRZ,CRO,COO,GNF,CCF,CVC,CBP,GRG,CMV,CFD,GT,NECF,BP)
    else
      result := -1;
  end
  Else
    result := -1;
end;

function TDLLBemaMFD.BemaGeraTxtPorCOO(MfdFileName, TxtFileName: String;
  Usuario, COOInicial, COOFinal: Integer): Integer;
begin
  if Loaded then
  Begin
    if @GeraTxtPorCOO = nil then
      @GeraTxtPorCOO := GetProcAddress(hDll, Pchar('BemaGeraTxtPorCOO'));
    if @GeraTxtPorCOO <> nil then
      Result := GeraTxtPorCOO(MfdFileName,TxtFileName,Usuario,COOInicial,COOFinal)
    else
      result := -1;
  end
  Else
    result := -1;
end;

constructor TDLLBemaMFD.create;
begin
  DLLLoad('BemaMFD.dll');
  MP2100Loaded := false;
  MP2100 := false;
end;

destructor TDLLBemaMFD.destroy;
begin
  DLLUnLoad();
end;

procedure TDLLBemaMFD.DLLLoad(DLLName: string);
begin
  Try
    hDLL:= LoadLibrary(Pchar(DLLName));
    if hDLL <> 0 then
      DLLLoaded := true
    else
      DLLLoaded := false;
  except
    DLLLoaded := false;
  end;
end;

procedure TDLLBemaMFD.DLLUnLoad;
var
  i: integer;
begin
  if DLLLoaded then
  Begin
     @GeraRegistrosTipoE := nil;
     @GeraTxtPorCOO      := nil;

     if not FreeLibrary(hDLL) then
     begin
        i := GetLastError();
        showmessage(intTostr(i));
     end;
  end;
end;

initialization
  BemaDLL:= TDLLBemaMFD.Create;

finalization
  BemaDLL.Destroy();

end.
