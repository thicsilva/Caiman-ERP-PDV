// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://127.0.0.1:8888/tributacoes/ws/ws_trib.php?wsdl
//  >Import : http://127.0.0.1:8888/tributacoes/ws/ws_trib.php?wsdl>0
// Encoding : ISO-8859-1
// Version  : 1.0
// (15/04/2016 09:34:41 - - $Rev: 70145 $)
// ************************************************************************ //

unit ws_trib;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:integer         - "http://www.w3.org/2001/XMLSchema"[]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[]


  // ************************************************************************ //
  // Name      : server.tributacoesPortType
  // Namespace : urn:server.tributacoes
  // soapAction: urn:server.tributacoes#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : encoded
  // binding   : server.tributacoesBinding
  // service   : server.tributacoes
  // port      : server.tributacoesPort
  // URL       : http://127.0.0.1:8888/tributacoes/ws/ws_trib.php
  // ************************************************************************ //
  server_tributacoesPortType = interface(IInvokable)
  ['{02F9CBEF-1DA8-208F-74A9-053FCA46DAD3}']
    function  BuscaProduto(const CodigoBarras: string; const Cumulativo: string; const Estado: string; const Token: string): string; stdcall;
    function  BuscaNCM(const NCM: string; const Cumulativo: string; const Estado: string; const Pagina: Int64; const TamPagina: Int64; const Descricao: Int64; 
                       const Token: string): string; stdcall;
    function  PaginasNCM(const TamPagina: Int64; const Token: string): string; stdcall;
    function  gravarEstatisticas(const barras: string; const cest: string; const valor: string; const ncm: string; const descricao: string; const Token: string
                                 ): string; stdcall;
  end;

function Getserver_tributacoesPortType(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): server_tributacoesPortType;


implementation
  uses System.SysUtils;

function Getserver_tributacoesPortType(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): server_tributacoesPortType;
const
  defWSDL = 'http://127.0.0.1:8888/tributacoes/ws/ws_trib.php?wsdl';
  defURL  = 'http://127.0.0.1:8888/tributacoes/ws/ws_trib.php';
  defSvc  = 'server.tributacoes';
  defPrt  = 'server.tributacoesPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as server_tributacoesPortType);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  { server.tributacoesPortType }
  InvRegistry.RegisterInterface(TypeInfo(server_tributacoesPortType), 'urn:server.tributacoes', 'ISO-8859-1', '', 'server.tributacoesPortType');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(server_tributacoesPortType), 'urn:server.tributacoes#%operationName%');

end.