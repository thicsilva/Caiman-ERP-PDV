unit uBuscaXml;

interface

uses UrlMon, MSHtml, ACBrUtil, pcnAuxiliar,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, SHDocVw, ExtCtrls, ComCtrls, WinInet, Menus,
  JclMime, pngimage;


type
  TfrmBuscarXML = class(TForm)
    WebBrowser1: TWebBrowser;
    ProgressBar1: TProgressBar;
    lblStatus: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Image1: TImage;
    btnPegarHTML: TButton;
    btnNovaConsulta: TButton;
    btnGerarXML: TButton;
    Label1: TLabel;
    edtChaveNFe: TEdit;
    Label2: TLabel;
    edtCaptcha: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Memo2: TMemo;
    Panel1: TPanel;
    WBXML: TWebBrowser;
    Button1: TButton;
    Label3: TLabel;
    TabSheet3: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Button2: TButton;
    procedure btnPegarHTMLClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure WebBrowser1ProgressChange(Sender: TObject; Progress,
      ProgressMax: Integer);
    procedure btnNovaConsultaClick(Sender: TObject);
    procedure btnGerarXMLClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure WebBrowser1DocumentComplete(ASender: TObject;
      const pDisp: IDispatch; const URL: OleVariant);
  private
    { Private declarations }
    function DownloadFile(SourceFile, DestFile: string): Boolean;
    function StripHTML(S: string): string;
    procedure DeleteIECache;
    procedure PegarHTML;
    procedure GeraXml;
    procedure NovaConsulta;
  public
    { Public declarations }
    FPath: string;
  end;

  procedure MimeDecode(const inputString: string; const outputStream: Tstream);

var
  frmBuscarXML: TfrmBuscarXML;

implementation

uses pcnConversaoNFe, ACBrHTMLtoXML, UImportXML, UDialog, UDM;

{$R *.dfm}


procedure MimeDecode(const inputString: string; const outputStream: Tstream);
var
  ss: TStringStream;
begin
  ss := TStringStream.Create(inputString);
  try
    JclMime.MimeDecodeStream(ss, outputStream);
  finally
    ss.free;
  end;
end;

procedure TfrmBuscarXML.DeleteIECache;
var
  lpEntryInfo: PInternetCacheEntryInfo;
  hCacheDir: LongWord;
  dwEntrySize: LongWord;
begin { DeleteIECache }
  dwEntrySize := 0;

  FindFirstUrlCacheEntry(nil, TInternetCacheEntryInfo(nil^), dwEntrySize);

  GetMem(lpEntryInfo, dwEntrySize);

  if dwEntrySize>0 then
    lpEntryInfo^.dwStructSize := dwEntrySize;

  hCacheDir := FindFirstUrlCacheEntry(nil, lpEntryInfo^, dwEntrySize);

  if hCacheDir<>0 then
  begin
    repeat
      DeleteUrlCacheEntry(lpEntryInfo^.lpszSourceUrlName);
      FreeMem(lpEntryInfo, dwEntrySize);
      dwEntrySize := 0;
      FindNextUrlCacheEntry(hCacheDir, TInternetCacheEntryInfo(nil^), dwEntrySize);
      GetMem(lpEntryInfo, dwEntrySize);
      if dwEntrySize>0 then
        lpEntryInfo^.dwStructSize := dwEntrySize;
    until not FindNextUrlCacheEntry(hCacheDir, lpEntryInfo^, dwEntrySize)
  end; { hCacheDir<>0 }
  FreeMem(lpEntryInfo, dwEntrySize);

  FindCloseUrlCache(hCacheDir)
end; { DeleteIECache }


function TfrmBuscarXML.DownloadFile(SourceFile, DestFile: string): Boolean;
const BufferSize = 1024;
var
  hSession, hURL: HInternet;
  Buffer: array[1..BufferSize] of Byte;
  BufferLen: DWORD;
  f: File;
  sAppName: string;
begin
 sAppName := ExtractFileName(Application.ExeName);
 hSession := InternetOpen(PChar(sAppName),  INTERNET_OPEN_TYPE_PRECONFIG,nil, nil, 0);
 try
   hURL := InternetOpenURL(hSession,PChar(SourceFile),nil,0,0,0);
   try
     AssignFile(f, DestFile);
     Rewrite(f,1);
     repeat
       InternetReadFile(hURL, @Buffer,SizeOf(Buffer), BufferLen);
       BlockWrite(f, Buffer, BufferLen)
     until BufferLen = 0;
     CloseFile(f);
     Result := True;
   finally
     InternetCloseHandle(hURL)
   end
 finally
   InternetCloseHandle(hSession)
 end;
end;
{begin
  try
    Result := UrlDownloadToFile(nil, PChar(SourceFile), PChar(DestFile), 0,
      nil) = 0;
  except
    Result := False;
  end;
end;   }

function TfrmBuscarXML.StripHTML(S: string): string;
var
  TagBegin, TagEnd, TagLength: integer;
begin
  TagBegin := Pos( '<', S);      // search position of first <

  while (TagBegin > 0) do begin  // while there is a < in S
    TagEnd    := Pos('>', S);              // find the matching >
    TagLength := TagEnd - TagBegin + 1;
    Delete(S, TagBegin, TagLength);     // delete the tag
    TagBegin := Pos( '<', S);            // search for next <
  end;

  Result := S;                   // give the result
end;

procedure TfrmBuscarXML.btnPegarHTMLClick(Sender: TObject);
begin
  PegarHTML;
end;

procedure TfrmBuscarXML.PegarHTML;
begin
  edtChaveNFe.Text := OnlyNumber(edtChaveNFe.Text);

  if not ValidarChave('NFe'+edtChaveNFe.Text) then
   begin
     MessageDlg('Chave Inválida.',mtError,[mbok],0);
     edtChaveNFe.SetFocus;
     exit;
   end;

  if trim(edtCaptcha.Text) = '' then
   begin
     MessageDlg('Digite o valor da imagem.',mtError,[mbok],0);
     edtCaptcha.SetFocus;
     exit;
   end;

  Memo2.Lines.Clear;

  Button1.Enabled         := False;
  btnPegarHTML.Enabled    := False;
  btnNovaConsulta.Enabled := False;
  btnGerarXML.Enabled     := False;
  try
     WebBrowser1.OleObject.Document.all.Item('ctl00$ContentPlaceHolder1$txtChaveAcessoCompleta', 0).value := edtChaveNFe.Text;
     WebBrowser1.OleObject.Document.all.Item('ctl00$ContentPlaceHolder1$txtCaptcha', 0).value := edtCaptcha.Text;
     WebBrowser1.OleObject.Document.all.Item('ctl00$ContentPlaceHolder1$btnConsultar', 0).click;
  except
     btnNovaConsulta.Enabled := True;
     raise;
  end;
  PageControl1.ActivePageIndex := 0;
end;

procedure TfrmBuscarXML.FormCreate(Sender: TObject);
begin
  NovaConsulta;
end;

procedure TfrmBuscarXML.WebBrowser1DocumentComplete(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
var
  k, i: Integer;
  Source, dest: string;
  textoNFe : IHTMLDocument2;
  Fil: TFileStream;
   sTR: tsTRINGS;
   Str2: String;
   P, P2: Integer;
   Png: TPngImage;
begin
  Application.ProcessMessages;
  if WebBrowser1.LocationURL = 'http://www.nfe.fazenda.gov.br/portal/consulta.aspx?tipoConsulta=completa&tipoConteudo=XbSeqxE8pl8=' then
  begin
    for k := 0 to WebBrowser1.OleObject.Document.Images.Length - 1 do
     begin
        try
         begin
            if Pos( '_imgCaptch',  WebBrowser1.OleObject.Document.Images.Item(k).id ) > 0 then
               begin
                  Str := TStringList.Create;
                Str.Text :=  WebBrowser1.OleObject.Document.documentElement.innerHTML;
                sTR.SaveToFile( 'C:\Teste.txt' );
                P := Pos( 'src="data:image/png;base64,', Str.Text );
                P2 := Pos( '"> <INPUT id=ctl00_ContentPlaceHolder1_token', Str.Text );
                Str.Text := Copy( Str.Text, P,
                 p2 - P) ;
                Str.Text := Str.Text;

                Str.Text := StringReplace( Str.Text,
                 'src="data:image/png;base64,', '',
                 [ rfReplaceAll, rfIgnoreCase ] );
                 Source := Str.Text;
                  Str.Free;
                    dest := ExtractFilePath(ParamStr(0)) + 'captcha.png';
                    Fil :=TFileStream.Create( Dest , fmCreate );
                    MimeDecode( Source, Fil );
                    Fil.Position := 0;
                    Fil.Free;
                    Fil := nil;

               end;
         end;
        except
            on E: Exception do
               begin
                  AlertaCad( E.Message );
                  Exit;
               end;
        end;
     end;
     Png := TPngImage.Create;
     png.LoadFromFile( Dest) ;
     Image1.Picture.Assign( Png );
     Png.Free;

     btnPegarHTML.Enabled := True;
  end
  else if WebBrowser1.LocationURL = 'https://www.nfe.fazenda.gov.br/portal/visualizacaoNFe/completa/Default.aspx' then
  begin
    WebBrowser1.Navigate('https://www.nfe.fazenda.gov.br/PORTAL/visualizacaoNFe/completa/impressao.aspx');
  end
  else if WebBrowser1.LocationURL = 'http://www.nfe.fazenda.gov.br/portal/consultaCompleta.aspx?tipoConteudo=XbSeqxE8pl8=' then
  begin
    textoNFe := WebBrowser1.Document as IHTMLDocument2;
    repeat
       Application.ProcessMessages;
    until Assigned(textoNFe.body);
    Memo2.Lines.Text := StripHTML(textoNFe.body.innerHTML);
    Memo2.Lines.Text := StringReplace(Memo2.Lines.Text,'&nbsp;','',[rfReplaceAll, rfIgnoreCase]);

    i := 0;
    while i < memo2.Lines.Count-1 do
    begin
      if trim(Memo2.Lines[i]) = '' then
      begin
        Memo2.Lines.Delete(i);
        i := i - 1;
      end;
      if pos('function',Memo2.lines[i])>0 then
      begin
        Memo2.Lines.Delete(i);
        i := i - 1;
      end;
      if pos('document',Memo2.lines[i])>0 then
      begin
        Memo2.Lines.Delete(i);
        i := i - 1;
      end;
      if pos('{',Memo2.lines[i])>0 then
      begin
        Memo2.Lines.Delete(i);
        i := i - 1;
      end;
      if pos('}',Memo2.lines[i])>0 then
      begin
        Memo2.Lines.Delete(i);
        i := i - 1;
      end;

      i := i + 1;
    end;
    Image1.Picture      := nil;
    btnGerarXML.Enabled := True;
    GeraXml;
  end
  else if WebBrowser1.LocationURL = 'https://www.nfe.fazenda.gov.br/portal/inexistente_completa.aspx' then
  begin
    MessageDlg('NF-e INEXISTENTE na base nacional, favor consultar esta NF-e no site da SEFAZ de origem.',mtError,[mbok],0);
    Image1.Picture          := nil;
    btnGerarXML.Enabled     := True;
    btnNovaConsulta.Enabled := True;
  end
  else
  begin
    MessageDlg('Erro carregando URL: '+WebBrowser1.LocationURL,mtError,[mbok],0);
    Image1.Picture          := nil;
    btnGerarXML.Enabled     := True;
    btnNovaConsulta.Enabled := True;
  end;

end;

procedure TfrmBuscarXML.WebBrowser1ProgressChange(Sender: TObject; Progress,
  ProgressMax: Integer);
begin
 if ProgressMax = 0 then
  begin
    ProgressBar1.Visible := False;
    lblStatus.Visible    := False;
    exit;
  end
 else
  begin
    ProgressBar1.Visible := True;
    lblStatus.Visible    := True;
    try
       ProgressBar1.Max := ProgressMax;
       if (Progress <> -1) and (Progress <= ProgressMax) then
          ProgressBar1.Position := Progress
       else
        begin
          ProgressBar1.Visible := False;
          lblStatus.Visible    := False;
        end;
    except
       on EDivByZero do
         exit;
    end;
  end;
end;

procedure TfrmBuscarXML.btnNovaConsultaClick(Sender: TObject);
begin
  NovaConsulta;
end;

procedure TfrmBuscarXML.NovaConsulta;
begin
  btnNovaConsulta.Enabled := False;
  btnGerarXML.Enabled     := False;
  edtcaptcha.Text:='';
  Button1.Enabled         := True;
//  DeleteIECache;
  Memo2.Lines.Clear;
  WebBrowser1.Navigate('http://www.nfe.fazenda.gov.br/portal/consulta.aspx?tipoConsulta=completa&tipoConteudo=XbSeqxE8pl8=');
end;

procedure TfrmBuscarXML.btnGerarXMLClick(Sender: TObject);
begin
  GeraXML;
end;

procedure TfrmBuscarXML.GeraXml;
begin
  FPath:=GerarXML(Memo2.Lines.Text);
  WBXML.Navigate(FPath);
  MessageBox(0,PChar('XML '+FPath+' gerado com sucesso!'),'Informação',
    MB_ICONINFORMATION+MB_TASKMODAL);
  btnNovaConsulta.Enabled := True;
  btnPegarHTML.Enabled    := True;
  Button2.Enabled         := True;
end;

procedure TfrmBuscarXML.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=vk_escape then
  Close;
end;

procedure TfrmBuscarXML.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmBuscarXML.Button1Click(Sender: TObject);
begin
  PegarHTML;
end;

procedure TfrmBuscarXML.Label3Click(Sender: TObject);
begin
  NovaConsulta;
end;

procedure TfrmBuscarXML.Button2Click(Sender: TObject);
var
  Caminho: String ;
begin
  Caminho := PathWithDelim(ExtractFilePath(Application.ExeName)) + 'nfe\xml_entradas\' + edtChaveNFe.Text + '-nfe.xml';
  if FileExists( Caminho ) then
  begin
    if ImportXML = nil then
    begin
      ImportXML := TImportXML.Create(nil);
      ImportXML.Arquivo1.Text := Caminho;
      ImportXML.Show;
      Close;
    end;
  end;

end;

end.


