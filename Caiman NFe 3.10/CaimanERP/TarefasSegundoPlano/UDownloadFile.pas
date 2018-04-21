unit UDownloadFile;


interface

uses
  Winapi.WinInet, Winapi.Windows, Vcl.Forms,
  SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, StdCtrls, ComCtrls, System.DateUtils,
  System.IOUtils, System.Contnrs;

type
  TListaProcessos = class;
  TOnChangePorcent = procedure( Sender: TObject; Arquivo: String;
     Porcentagem: Int64; kbps: Int64; Men: String ) of object;
  TFileDownload = class;
  THTTPFuncoes = class
       class function GetResourceSize(const AURL: string): Integer;
       class procedure ParseURL(const AURL: string; var AHost, AResource: string);
       class function DownloadAtPos(const AURL, AFileName: string; APos: Integer;
         ASize: Integer): Integer;
       class function TempDir: string;
       class function TempKHelp: string;
  end;

  TProcessoItemThread = class( TThread )
      private
          FLista: TListaProcessos;
          FProc: TProc;
      protected
          procedure Execute; override;
      public
          procedure Inicia( Proc: TProc );
          constructor Create( Lista: TListaProcessos;
            const FreeFinal: Boolean = true );
          destructor Destroy; override;
   end;

   TListaProcessos = class( TObjectList )
        private
           FLock: TObject;
        public
           procedure Lock;
           procedure UnLock;
           procedure Clear;
           procedure NovaThread( vProc: TProc );
           procedure DeleteOf( Item: TProcessoItemThread );
           constructor Create;
           destructor Destroy; override;
   end;



  TFileDownloadParte = class( TThread )
      private
         FURL,
         FSalvar: String;
         FPosicao,
         FposIni,
         FNumParte,
         FTamanho: Int64;
         FStream: TFileStream;
         FFileDownload: TFileDownload;
         Lido: DWORD;
         Terminou: Boolean;
          Tempo: TDateTime;
          UltimoLido: Int64;
          //procedure GravarNoArquivo;
      public
         Kbps: Int64;
         TotalBaixado: Int64;
         Erro: Boolean;
         Comecou: Boolean;
         property TamanhoTotal: Int64 read FTamanho write FTamanho;
         constructor Create( FileDownload: TFileDownload; URL, Salvar: string; Posicao, Tamanho, NumParte: Integer );
         destructor Destroy; override;
      protected
         procedure Execute; override;
  end;

  TFileDownloadThreadList = class( TObjectList )
      private
          FLock: TObject;
      public
         function TodosTerminou: Boolean;
         function Erro: Boolean;
         procedure Lock;
         procedure UnLock;
         procedure Clear;
         constructor Create;
         destructor Destroy; override;
  end;

  TFileDownload = class( TObject )
      private
         Tam1, Tam2: Integer;
         FCalcProcentagem: TProcessoItemThread;
         FLock: TObject;
         FURL: String;
         FHost: String;
         FResource: String;
         FPartes: Integer;
         FSalvar: String;
         FTamanhoTotal: Int64;
         FListtaPartes: TFileDownloadThreadList;
         FOnChangeFile: TOnChangePorcent;
         FOnFim: TNotifyEvent;
          FTotalBaixado: Int64;
         procedure ColocaPartes( FileDownload: TFileDownload; URL, Salvar: string;
           NumPartes: Integer;
           TamanhoPartes, TamanhoPartesUltima: Int64 );
         procedure CalcPorcentagem;
         procedure GravaArquivoFinal;
         procedure ThReadCalcs;
      public
         Size: Int64;
         procedure Lock;
         procedure UnLock;
         procedure Iniciar;
         procedure Parar;
         property OnChangeFile: TOnChangePorcent read FOnChangeFile write FOnChangeFile;
         property OnFim: TNotifyEvent read FOnFim write FOnFim;
         constructor Create( URL, Salvar: string; Partes: Integer );
         destructor Destroy; override;
  end;

implementation

{ THTTPFuncoes }

class function THTTPFuncoes.DownloadAtPos(const AURL, AFileName: string;
  APos: Integer;
         ASize: Integer): Integer;
const
  FileOpenModes: array[Boolean] of DWORD = (fmCreate, fmOpenWrite);
var
  FileStream: TFileStream;
  hOpen, hConnect, hResource: HINTERNET;
  host, resource: string;
  DataProceed: array[0..8191] of Byte;
  numread: DWORD;
begin
  ParseURL(AURL, host, resource);

  hOpen := InternetOpen('WinInet resuming sample', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  hConnect := InternetConnect(hOpen, PChar(host), INTERNET_DEFAULT_HTTP_PORT, nil, nil, INTERNET_SERVICE_HTTP, 0, 0);
  hResource := HttpOpenRequest(hConnect, 'GET', PChar(resource), nil, nil, nil, 0, 0);
  HttpSendRequest(hResource, nil, 0, nil, 0);

  Result := APos;
  if (Result > 0) then
  begin
    if not (Integer(InternetSetFilePointer(hResource, Result, nil, FILE_BEGIN, 0)) > 0) then
    begin
      Result := 0;
    end;
  end;
  FileStream := TFileStream.Create(AFileName, FileOpenModes[FileExists(AFileName)]);
  try
    FileStream.Position := Result;
  //  repeat
      ZeroMemory(@DataProceed, SizeOf(DataProceed));
      InternetReadFile(hResource, @DataProceed, SizeOf(DataProceed), numread);
//      if (numread <= 0) then Break;
      FileStream.Write(DataProceed, numread);
      Result := Result + Integer(numread);
//     DoProgress(Result);
//    until (not FIsDownloading);
  finally
    FileStream.Free();
    InternetCloseHandle(hConnect);
    InternetCloseHandle(hOpen);
  end;
end;

class function THTTPFuncoes.GetResourceSize(const AURL: string): Integer;
var
  hOpen, hConnect, hResource: HINTERNET;
  host, resource: string;
  buflen, tmp: DWORD;
begin
  ParseURL(AURL, host, resource);

  hOpen := InternetOpen('WinInet resuming sample', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  hConnect := InternetConnect(hOpen, PChar(host), INTERNET_DEFAULT_HTTP_PORT, nil, nil, INTERNET_SERVICE_HTTP, 0, 0);
  hResource := HttpOpenRequest(hConnect, 'HEAD', PChar(resource), nil, nil, nil, 0, 0);
  HttpSendRequest(hResource, nil, 0, nil, 0);

  buflen := SizeOf(Result);
  tmp := 0;
  Result := 0;
  HttpQueryInfo(hResource, HTTP_QUERY_CONTENT_LENGTH or HTTP_QUERY_FLAG_NUMBER,
    @Result, buflen, tmp);

  InternetCloseHandle(hConnect);
  InternetCloseHandle(hOpen);
end;
class procedure THTTPFuncoes.ParseURL(const AURL: string; var AHost,
  AResource: string);
  procedure CleanArray(var Arr: array of Char);
  begin
    ZeroMemory(Arr + 0, High(Arr) - Low(Arr) + 1);
  end;

var
  UrlComponents: TURLComponents;
  scheme: array[0..INTERNET_MAX_SCHEME_LENGTH - 1] of Char;
  host: array[0..INTERNET_MAX_HOST_NAME_LENGTH - 1] of Char;
  user: array[0..INTERNET_MAX_USER_NAME_LENGTH - 1] of Char;
  password: array[0..INTERNET_MAX_PASSWORD_LENGTH - 1] of Char;
  urlpath: array[0..INTERNET_MAX_PATH_LENGTH - 1] of Char;
  fullurl: array[0..INTERNET_MAX_URL_LENGTH - 1] of Char;
  extra: array[0..1024 - 1] of Char;
begin
  CleanArray(scheme);
  CleanArray(host);
  CleanArray(user);
  CleanArray(password);
  CleanArray(urlpath);
  CleanArray(fullurl);
  CleanArray(extra);
  ZeroMemory(@UrlComponents, SizeOf(TURLComponents));

  UrlComponents.dwStructSize := SizeOf(TURLComponents);
  UrlComponents.lpszScheme := scheme;
  UrlComponents.dwSchemeLength := High(scheme) + 1;
  UrlComponents.lpszHostName := host;
  UrlComponents.dwHostNameLength := High(host) + 1;
  UrlComponents.lpszUserName := user;
  UrlComponents.dwUserNameLength := High(user) + 1;
  UrlComponents.lpszPassword := password;
  UrlComponents.dwPasswordLength := High(password) + 1;
  UrlComponents.lpszUrlPath := urlpath;
  UrlComponents.dwUrlPathLength := High(urlpath) + 1;
  UrlComponents.lpszExtraInfo := extra;
  UrlComponents.dwExtraInfoLength := High(extra) + 1;

  InternetCrackUrl(PChar(AURL), Length(AURL), ICU_DECODE or ICU_ESCAPE, UrlComponents);

  AHost := host;
  AResource := urlpath;
end;
class function THTTPFuncoes.TempDir: string;
var
  pNetpath: ARRAY [0 .. MAX_path - 1] of Char;
  nlength: Cardinal;
begin
  nlength := MAX_path;
  FillChar(pNetpath, sizeof(pNetpath), #0);
  GetTemppath(nlength, pNetpath);
  Result := StrPas(pNetpath);
end;

class function THTTPFuncoes.TempKHelp: string;
begin
   Result := TPath.combine( TempDir, 'AligatorERP' );
   if not DirectoryExists( Result ) then
      ForceDirectories( Result );
end;

procedure TFileDownload.CalcPorcentagem;
var
  Tamanho: Int64;
  Baixado: Int64;
  Kbps: Int64;
  Porcentagem: Int64;
  I: Integer;
begin
    Tamanho := 0;
    Baixado := 0;
    FListtaPartes.Lock;
    try
       for I := 0 to FListtaPartes.Count -1 do
         begin
            Inc( Tamanho, TFileDownloadParte( FListtaPartes.Items[I] ).FTamanho );
            Inc( Baixado, TFileDownloadParte( FListtaPartes.Items[I] ).TotalBaixado );
            Inc( Kbps, TFileDownloadParte( FListtaPartes.Items[I] ).Kbps );
         end;
    finally
       FListtaPartes.UnLock;
    end;
    try
       Porcentagem := ( Baixado * 100 ) div Tamanho;
    except
        Porcentagem := 0;
    end;
    TThread.Synchronize( nil,
    procedure
      begin
          if Assigned( FOnChangeFile ) then
             FOnChangeFile( Self, FSalvar, Porcentagem, Kbps, 'Baixando Atualizações...' );
       end );
end;

procedure TFileDownload.ColocaPartes(FileDownload: TFileDownload; URL,
  Salvar: string; NumPartes: Integer; TamanhoPartes,
  TamanhoPartesUltima: Int64);
var
  I: Integer;
  Parte: TFileDownloadParte;
  Posicao: Int64;
  Tamanho: Int64;
begin
   FListtaPartes.Clear;
   FTamanhoTotal := 0;
   FListtaPartes.Lock;
   try
       for I := 0 to NumPartes -1 do
           begin
              if I = ( NumPartes - 1)  then
                Tamanho := TamanhoPartesUltima
              else
                Tamanho := TamanhoPartes;
              Posicao := I * TamanhoPartes;
              FTamanhoTotal := FTamanhoTotal + Tamanho;
              Parte := TFileDownloadParte.Create( Self, URL, Salvar, Posicao, Tamanho, I );
              FListtaPartes.Add(  Parte );
           end;
   finally
      FListtaPartes.UnLock;
   end;
end;

constructor TFileDownload.Create(URL, Salvar: string; Partes: Integer);
begin
   FURL := URL;
   FLock :=  TObject.Create;
   FPartes := Partes;
   FSalvar := Salvar ;
   FTotalBaixado := 0;
   THTTPFuncoes.ParseURL( FURL, FHost, FResource );
   Size := THTTPFuncoes.GetResourceSize( FURL );
   Tam1 := Size div FPartes;
   Tam2 := Tam1 + ( Size - ( FPartes * Tam1 ) );
   FListtaPartes := TFileDownloadThreadList.Create ;
   FCalcProcentagem := TProcessoItemThread.Create( nil, False );
   FCalcProcentagem.Inicia( ThReadCalcs );
end;

destructor TFileDownload.Destroy;
begin
//  if not FCalcProcentagem.CheckTerminated then
     begin
        FCalcProcentagem.Terminate;
        FCalcProcentagem.WaitFor;
     end;
  FreeAndNil( FCalcProcentagem );
  Parar;
  FreeAndNil( FListtaPartes );
  FreeAndNil( FLock );
  inherited;
end;

procedure TFileDownload.GravaArquivoFinal;
var
  sFile: TFileStream;
  I: Integer;
begin
   if FileExists( FSalvar ) then
       DeleteFile( FSalvar );
   sFile := TFileStream.Create( FSalvar, fmCreate );
   sFile.Size := FTamanhoTotal;
   try
      FListtaPartes.Lock;
      try
         for I := 0 to FListtaPartes.Count-1 do
            begin
               sFile.Position := TFileDownloadParte( FListtaPartes.Items[I] ).FposIni;
               TFileDownloadParte( FListtaPartes.Items[I] ).FStream.Position := 0;
               sFile.CopyFrom(
               TFileDownloadParte( FListtaPartes.Items[I] ).FStream,
               TFileDownloadParte( FListtaPartes.Items[I] ).FStream.Size );
            end;
      finally
         FListtaPartes.UnLock;
      end;
   finally
      FreeAndNil( sFile );
      FListtaPartes.Clear;
   end;
end;

procedure TFileDownload.Iniciar;
var
  I: Integer;
begin
   ColocaPartes(  Self ,FURL, FSalvar, FPartes, Tam1, Tam2  );
   FListtaPartes.Lock;
   try
      for I := 0 to FListtaPartes.Count -1 do
         begin
            TThread( FListtaPartes.Items[I] ).Start;
         end;
   finally
       FListtaPartes.Unlock;
   end;
end;

procedure TFileDownload.Lock;
begin
   System.TMonitor.Enter( FLock );
end;

procedure TFileDownload.Parar;
var
  I: Integer;
begin
   FListtaPartes.Lock;
   try
      while FListtaPartes.Count > 0 do
         begin
           for I := 0 to FListtaPartes.Count - 1 do
              begin
                 if TFileDownloadParte( FListtaPartes.Items[I] ).Comecou then
                    begin
                       if Assigned( TFileDownloadParte( FListtaPartes.Items[I] ) ) then
                          begin
                             if not TFileDownloadParte( FListtaPartes.Items[I] ).Terminated then
                                begin
                                   TFileDownloadParte( FListtaPartes.Items[I] ).Terminate;
                                   TFileDownloadParte( FListtaPartes.Items[I] ).WaitFor;
                                end;
                              FListtaPartes.Items[I].Free;
                              FListtaPartes.Items[I] := nil;
                          end;
                      FListtaPartes.Delete( I );
                      Break;
                    end;
              end;
         end;
   finally
       FListtaPartes.Unlock;
   end;
end;

procedure TFileDownload.ThReadCalcs;
begin
   while not TThread.CheckTerminated do
      begin
         CalcPorcentagem;
         if FListtaPartes.Erro then
            begin
                TThread.Synchronize( nil,
                procedure
                  begin
                      if Assigned( FOnChangeFile ) then
                         FOnChangeFile( Self, FSalvar, 0, 0, 'Tentando Reconectar....' );
                   end );
                Parar;
                Sleep(1000);
                Iniciar;
            end;
         if FListtaPartes.TodosTerminou then
            Break;
         Sleep(10);
      end;
   if  not TThread.CheckTerminated then
   if FListtaPartes.TodosTerminou then
      begin
         GravaArquivoFinal;
         if Assigned( FOnChangeFile ) then
         FOnChangeFile( Self, FSalvar, 100, 0, 'Download Concluído....' );
         if Assigned( FOnFim ) then
            FOnFim( Self );
      end;
end;

procedure TFileDownload.UnLock;
begin
   System.TMonitor.Exit( FLock );
end;

{ TFileDownloadParte }

constructor TFileDownloadParte.Create( FileDownload: TFileDownload; URL, Salvar: string; Posicao,
  Tamanho, NumParte: Integer);
begin
   inherited Create( True );
   FreeOnTerminate := False;
   Comecou := False;
   Erro := False;
   FFileDownload := FileDownload;
   Kbps := 0;
   TotalBaixado := 0;
   FURL := URL;
   FSalvar := Salvar;
   FNumParte := NumParte;
   FSalvar := FSalvar + '.part' + IntToStr( FNumParte );
   FPosicao := Posicao;
   FTamanho := Tamanho;
   if FileExists( FSalvar ) then
      begin
         FStream  := TFileStream.Create( FSalvar, fmOpenReadWrite );
         FStream.Position := FStream.Size;
      end
   else
      begin
         FStream  := TFileStream.Create( FSalvar, fmCreate );
         FStream.Position := 0;
      end;
end;

destructor TFileDownloadParte.Destroy;
begin
  FreeAndNil( FStream );
  if TotalBaixado = FTamanho then
     DeleteFile( FSalvar );
  inherited;
end;

procedure TFileDownloadParte.Execute;
const
  FileOpenModes: array[Boolean] of DWORD = (fmCreate, fmOpenWrite);
var
  hOpen, hConnect, hResource: HINTERNET;
  host, resource: string;
  DataProceed: array[0..8191] of Byte;
  numread, myTimeOut: DWORD;
  BufferRead: DWORD;
  S: String;
  TLido: Integer;
begin
  inherited;
  Erro := False;
  try
      FposIni := FPosicao;
      Inc( TotalBaixado, FStream.Position );
      FPosicao := FPosicao + FStream.Position;
      try
          Terminou := False;
          THTTPFuncoes.ParseURL(FURL, host, resource);
          numread := 0;
          Lido := 0;
            if FNumParte = 0 then
              begin
                 FNumParte := FNumParte;
              end;
          Lido := FStream.Size;
          Tempo := Now;
          Kbps := 0;
           myTimeOut:= 7000;
           InternetSetOption(nil, INTERNET_OPTION_CONNECT_TIMEOUT,
            Pointer(@myTimeOut), SizeOf(myTimeOut));
            InternetSetOption(nil, INTERNET_OPTION_SEND_TIMEOUT, Pointer(@myTimeOut), SizeOf(myTimeOut));
            InternetSetOption(nil, INTERNET_OPTION_RECEIVE_TIMEOUT,
             Pointer(@myTimeOut), SizeOf(myTimeOut));
          hOpen := InternetOpen( 'Mozilla/3.0 (compatible; Indy Library)',
           INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
          hConnect := InternetConnect(hOpen, PChar(host), INTERNET_DEFAULT_HTTP_PORT,
          nil, nil, INTERNET_SERVICE_HTTP, 0, 0);
          hResource := HttpOpenRequest(hConnect, 'GET', PChar(resource), nil, nil, nil,
           INTERNET_FLAG_RELOAD or INTERNET_FLAG_NO_CACHE_WRITE, 0);
          if (FPosicao > 0) then
          begin
            s := Format('Range: bytes=%d-', [fPosicao]);
            HttpAddRequestHeaders(hResource, PChar(s), Length(s), HTTP_ADDREQ_FLAG_ADD_IF_NEW);
          end;
          HttpSendRequest(hResource, nil, 0, nil, 0);
          try
            UltimoLido := 0;
            TLido := 0;
            Tempo := now;
            while ( Lido < FTamanho ) and ( not Terminated )do
              begin
                  if ( Lido + SizeOf(DataProceed)) > FTamanho then
                     BufferRead := FTamanho - Lido
                  else
                     BufferRead := SizeOf(DataProceed);
                  ZeroMemory(@DataProceed, SizeOf(DataProceed));
                  InternetReadFile(hResource, @DataProceed, BufferRead, numread);
                             Comecou := true;
                  if (numread <= 0) then Break;
                  FStream.Write(DataProceed, numread);
                  FPosicao := FPosicao + Integer(numread);
                  Inc( Lido, numread );
                  if UltimoLido = 0 then
                      Inc( UltimoLido , numread );
                  Inc( TLido, numread );
                  if SecondsBetween( Now, Tempo ) >= 2 then
                    begin
                       Kbps := ( ( TLido - UltimoLido ) div SecondsBetween( Now, Tempo ) ) div 1024;
                       UltimoLido := TLido;
                       Tempo := Now;
                    end;
                  Inc( TotalBaixado, numread );
              end;
          finally
            try
              InternetCloseHandle(hConnect);
              InternetCloseHandle(hOpen);
            except

            end;
            if TotalBaixado < FTamanho then
               Erro := true;
            Terminou := True;
            Kbps := 0;
          end;
      finally
      end;
  except
     on E: Exception do
        begin
           TThread.Synchronize( nil, procedure begin ShowMessage(E.Message); end );
           Erro := True;
        end;
  end;
end;

{ TFileDownloadThreadList }

procedure TFileDownloadThreadList.Clear;
var
   I: Integer;
begin
   Self.Lock;
   try
       for I := 0 to Self.Count -1 do
          begin
             if Assigned( TFileDownloadParte( Self.Items[I] ) ) then
                begin
                   if not TFileDownloadParte( Self.Items[I] ).Terminated then
                      begin
                       TFileDownloadParte( Self.Items[I] ).Terminate;
                       TFileDownloadParte( Self.Items[I] ).WaitFor;
                      end;
                end;
             if Assigned( TFileDownloadParte( Self.Items[I] ) ) then
                TFileDownloadParte( Self.Items[I] ).Free;
          end;
   finally
       Self.UnLock;
   end;
   TObjectList( Self ).Clear;
end;



constructor TFileDownloadThreadList.Create;
begin
   FLock := TObject.Create;
end;

destructor TFileDownloadThreadList.Destroy;
begin
  FreeAndNil( FLock );
  inherited;
end;

function TFileDownloadThreadList.Erro: Boolean;
var
  I: Integer;
begin
   Result := False;
   Lock;
   try
      for I := 0 to Self.Count-1 do
          begin
             if TFileDownloadParte( Self.Items[I] ).Erro then
                begin
                   Result := True;
                   Break;
                end;
          end;
   finally
     UnLock;
   end;
end;

procedure TFileDownloadThreadList.Lock;
begin
   System.TMonitor.Enter( FLock );
end;

function TFileDownloadThreadList.TodosTerminou: Boolean;
var
  I: Integer;
begin
   Result := True;
   Lock;
   try
      for I := 0 to Self.Count-1 do
          begin
             if not TFileDownloadParte( Self.Items[I] ).Terminou then
                begin
                   Result := False;
                   Break;
                end;
          end;
   finally
     UnLock;
   end;
end;

procedure TFileDownloadThreadList.UnLock;
begin
   System.TMonitor.Exit( FLock );
end;



constructor TProcessoItemThread.Create( Lista: TListaProcessos;
  const FreeFinal: Boolean = true  );
begin
   inherited Create( True );
   FreeOnTerminate := FreeFinal;
   FLista := Lista;
end;

destructor TProcessoItemThread.Destroy;
begin
  if Assigned( FLista ) then
    FLista.DeleteOf( Self );
  inherited;
end;

procedure TProcessoItemThread.Execute;
begin
  inherited;
  try
     FProc;
  except

  end;
end;

procedure TProcessoItemThread.Inicia(Proc: TProc);
begin
   FProc := Proc;
   Start;
end;

{ TListaProcessos }

procedure TListaProcessos.Clear;
var
  I: Integer;
begin
   Lock;
   try
     for I := 0 to Count -1 do
            begin
               if Assigned( TProcessoItemThread( Items[I] ) ) then
                 begin
                    if not TProcessoItemThread( Items[I] ).Terminated then
                       TProcessoItemThread( Items[I] ).Terminate;
                     WaitForSingleObject( TProcessoItemThread( Items[I] ).Handle, 0 );
                 end;
            end;
      TObjectList( Self ).Clear;
   finally
     UnLock;
   end;
end;
constructor TListaProcessos.Create;
begin
   FLock := TObject.Create;
end;

procedure TListaProcessos.DeleteOf(Item: TProcessoItemThread);
var
  I: Integer;
begin
   Lock;
   try
     for I := 0 to Count -1 do
         if TProcessoItemThread( Items[I] ) = Item then
            begin
               if Assigned( TProcessoItemThread( Items[I] ) ) then
                 begin
                    if not TProcessoItemThread( Items[I] ).Terminated then
                       TProcessoItemThread( Items[I] ).Terminate;
                     WaitForSingleObject( TProcessoItemThread( Items[I] ).Handle, 0 );
                 end;
               Delete( I );
               Break;
            end;
   finally
     UnLock;
   end;
end;

destructor TListaProcessos.Destroy;
begin
  Clear;
  FreeAndNil( FLock );
  inherited;
end;

procedure TListaProcessos.Lock;
begin
  try
    System.TMonitor.Enter( FLock );
  except
  end;
end;

procedure TListaProcessos.NovaThread(vProc: TProc);
var
  Temp: TProcessoItemThread;
begin
   Lock;
   try
      Temp := TProcessoItemThread.Create( Self );
      Self.Add( Temp );
      Temp.Inicia( vProc );
   finally
       UnLock;
   end;
end;

procedure TListaProcessos.UnLock;
begin
   try
       System.TMonitor.PulseAll( FLock );
       System.TMonitor.Exit( FLock );
   except

   end;
end;

end.
