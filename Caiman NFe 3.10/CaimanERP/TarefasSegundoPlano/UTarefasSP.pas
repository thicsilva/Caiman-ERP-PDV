unit UTarefasSP;

interface

uses
  Winapi.WinInet, Winapi.Windows, Vcl.Forms,
  SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, StdCtrls, ComCtrls, System.DateUtils,
  System.IOUtils, System.Contnrs, System.Generics.Collections;

type
    TAligatorStringList = class( TStringList )
         private
            FLock: TObject;
         public
            procedure Adicionar( Str: String );
            procedure Lock;
            procedure Unlock;
            constructor Create;
            destructor Destroy; override;
    end;
    TAligatorTSP = class;
    TAligatorProc =  TProc< TAligatorTSP >;
    TAligatorTSPCount = procedure( Sender: TObject;  Count: Integer ) of object;
    TAligatorTSPInicioFim = procedure( Sender: TObject; Index: Integer; Descricao: String ) of object;
    TAligatorTSPProgresso = procedure( Sender: TObject; Index: Integer;
       Descricao: String; Status: String; Progresso: Integer ) of object;
    TAligatorTSPList = class;

    TAligatorTSP = class( TThread )
        private
            FProc: TAligatorProc;
            FDescricao: String;
            FList: TAligatorTSPList;
            FProgressoAtual: Integer;
            FModulo: String;
            procedure DoInicio;
            procedure DoFim;
            procedure SetProgressoAtual(const Value: Integer);
            procedure SetModulo(const Value: String);
        protected
            procedure Execute; override;
        public
            Status: string;
            Terminado: Boolean;
            property Descricao: string read FDescricao write FDescricao;
            property Modulo: String read FModulo write SetModulo;
            property ProgressoAtual: Integer read FProgressoAtual write SetProgressoAtual;
            procedure Progresso( iProgresso: Integer; sStatus: String );
            constructor Create( List: TAligatorTSPList; Proc: TAligatorProc; Descricao, Modulo: String );
    end;

    TAligatorTSPTemp = class( TObject )
         public
            Obj: TAligatorTSP;
            Terminou: Boolean;
            procedure Porcent( Sender: TObject; Arquivo: String; Porcentagem: Int64; kbps: Int64; Men: String );
            procedure FimDownload( Sender: TObject );
    end;
    TAligatorTSPList = class( TObjectList )
        private
            FOnInicioTSP: TAligatorTSPInicioFim;
            FOnFimTSP: TAligatorTSPInicioFim;
            FOnProgresso: TAligatorTSPProgresso;
            FOnChangeCount: TAligatorTSPCount;
            FLock: TObject;
            procedure ThreadTerminate(Sender: TObject);
            procedure DoCount;
        public
            procedure Lock;
            procedure UnLock;
            procedure PararTodas;
            procedure Delete(Index: Integer); virtual;
            function Add(Item: Pointer): Integer; virtual;
            procedure NovaTarefa( Proc: TAligatorProc; Descricao, Modulo: String );
            property OnInicioTSP: TAligatorTSPInicioFim read FOnInicioTSP write FOnInicioTSP;
            property OnFimTSP: TAligatorTSPInicioFim read FOnFimTSP write FOnFimTSP;
            property OnProgresso: TAligatorTSPProgresso read FOnProgresso write FOnProgresso;
            property OnChangeCount: TAligatorTSPCount read FOnChangeCount write FOnChangeCount;
            constructor Create;
            destructor Destroy; override;
    end;

var
  AligatorTSPList: TAligatorTSPList;
  AligatorTSPSemAviso: TAligatorTSPList;

implementation

{ TAligatorTSP }

constructor TAligatorTSP.Create( List: TAligatorTSPList; Proc: TAligatorProc; Descricao, Modulo: String);
begin
    inherited Create( True );
    FreeOnTerminate := False;
    FProc := Proc;
    FDescricao := Descricao;
//    Priority := TThreadPriority.tpHighest;

    FModulo := Modulo;
    FList := List;
end;

procedure TAligatorTSP.DoFim;
begin
   FList.Lock;
   try
         Status := 'Finalizado...';
        Synchronize(
        procedure
         begin
            if Assigned( Flist.FOnFimTSP ) then
               Flist.FOnFimTSP( Self, FList.IndexOf( Self ), FDescricao );
         end );
   finally
       FList.UnLock;
   end;
end;

procedure TAligatorTSP.DoInicio;
begin
   FList.Lock;
   try
        Status := 'Iniciando...';
        Synchronize(
        procedure
         begin
            if Assigned( Flist.FOnInicioTSP ) then
               Flist.FOnInicioTSP( Self, FList.IndexOf( Self ), FDescricao );
         end );
   finally
       FList.UnLock;
   end;
end;

procedure TAligatorTSP.Execute;
begin
  inherited;
  try
    DoInicio;
    try
       FProc( Self );
    finally
        DoFim;
    end;
  except

  end;
  if not Terminated then
     FreeOnTerminate := True;
  Terminado := Terminated;
end;

procedure TAligatorTSP.Progresso(iProgresso: Integer; sStatus: String );
begin
   FList.Lock;
   try
        Synchronize(
        procedure
         begin
            if Assigned( Flist.FOnProgresso ) then
               Flist.FOnProgresso( Self, FList.IndexOf( Self ),
                  FDescricao, sStatus, iProgresso );
         end );
   finally
       FList.UnLock;
   end;
end;

procedure TAligatorTSP.SetModulo(const Value: String);
begin
  FModulo := Value;
end;

procedure TAligatorTSP.SetProgressoAtual(const Value: Integer);
begin
  FProgressoAtual := Value;
end;

{ TAligatorTSPList }

function TAligatorTSPList.Add(Item: Pointer): Integer;
begin
   inherited Add( Item );
   DoCount;
end;

constructor TAligatorTSPList.Create;
begin
   FLock := TObject.Create;
end;

procedure TAligatorTSPList.Delete(Index: Integer);
begin
   inherited Delete( Index );
   DoCount;
end;

destructor TAligatorTSPList.Destroy;
begin
  PararTodas;
  FLock.Free;
  inherited;
end;

procedure TAligatorTSPList.DoCount;
begin
   if Assigned( FOnChangeCount ) then
      FOnChangeCount( Self, Self.Count );
end;

procedure TAligatorTSPList.Lock;
begin
   System.TMonitor.Enter( FLock );
end;

procedure TAligatorTSPList.NovaTarefa(Proc: TAligatorProc; Descricao, Modulo: String);
var
   Tarefa: TAligatorTSP;
begin
   Lock;
   try
       Tarefa := TAligatorTSP.Create( Self, Proc, Descricao, Modulo );
       Tarefa.OnTerminate := ThreadTerminate;
       Self.Add( Tarefa );
   finally
       UnLock;
   end;
   if Assigned( Tarefa ) then
      Tarefa.Start;
end;

procedure TAligatorTSPList.PararTodas;
var
  I: Integer;
begin
    while Count > 0 do
      begin
         TAligatorTSP( Items[0] ).Terminate;
         TAligatorTSP( Items[0] ).WaitFor;
         Items[0].Free;
         Lock;
         try
            Delete( 0 );
         finally
            UnLock;
         end;
      end;
end;

procedure TAligatorTSPList.ThreadTerminate(Sender: TObject);
begin
   Lock;
   try
      if not TAligatorTSP( Sender ).Terminado then
         begin
            Self.Extract( Sender );
            DoCount;
         end;
   finally
       UnLock;
   end;
end;

procedure TAligatorTSPList.UnLock;
begin
   System.TMonitor.Exit( FLock );
end;


{ TAligatorTSPTemp }

procedure TAligatorTSPTemp.FimDownload(Sender: TObject);
begin
  Terminou := true;
end;

procedure TAligatorTSPTemp.Porcent(Sender: TObject; Arquivo: String;
  Porcentagem, kbps: Int64; Men: String);
begin
    Obj.Progresso( Porcentagem, 'Baixando ' + IntToStr(kbps) + 'kbps'  );
end;

{ TAligatorStringList }

procedure TAligatorStringList.Adicionar(Str: String);
begin
   Lock;
   try
      Self.Add( Str );
   finally
      Unlock;
   end;
end;

constructor TAligatorStringList.Create;
begin
   FLock := TObject.Create;
end;

destructor TAligatorStringList.Destroy;
begin
   FLock.Free;
  inherited;
end;

procedure TAligatorStringList.Lock;
begin
   System.TMonitor.Enter( FLock );
end;

procedure TAligatorStringList.Unlock;
begin
   System.TMonitor.Exit( FLock );
end;

initialization
   AligatorTSPSemAviso := TAligatorTSPList.Create;

finalization
   FreeAndNil( AligatorTSPSemAviso );

end.
