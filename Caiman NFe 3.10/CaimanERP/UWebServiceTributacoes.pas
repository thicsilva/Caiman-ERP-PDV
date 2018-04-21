unit UWebServiceTributacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Soap.InvokeRegistry, Soap.Rio, Soap.SOAPHTTPClient, xmldom, XMLIntf, msxmldom,
  XMLDoc, Soap.SOAPHTTPTrans, Winapi.WinInet, System.Generics.Collections;

type

  TWSTribEstadual = class( TObject )
     public
          estado: string;
          ex: string;
          tipo: string;
          saida: string;
          cst: string;
          aliquota: string;
          reducao: string;
          tipo_mva: string;
          mva: string;
  end;

  TWSTribEstadualLista = TObjectList<TWSTribEstadual>;

  TWSTribFederal = class( TObject )
     public
        ex: string;
        cumulativo: string;
        descricao: string;
        ent_pis: string;
        ent_cofins: string;
        ent_cst: string;
        ent_cst_desc: string;
        sai_pis: string;
        sai_cofins: string;
        sai_cst: string;
        sai_cst_desc: string;
  end;

  TWSTribFederalLista = TObjectList<TWSTribFederal>;

  TWebserviceTributacaoProd = class( TObject )
      public
         Status: string;
         Barras: string;
         Descricao: string;
         ncm: string;
         ex: string;
         fabricante: string;
         pais: string;
         categoria: string;
         valor_medio: string;
         foto: string;
         federal: TWSTribFederalLista;
         EstadualEntrada: TWSTribEstadualLista;
         EstadualSaida: TWSTribEstadualLista;
         constructor Create;
         destructor Destroy; override;
  end;

  TWebserviceTributacao = class( TObject )
     procedure BeforePost(const HTTPReqResp: THTTPReqResp; Data: Pointer);
     private
        function GetHttp: THTTPRIO;
        procedure GetFederal( XML: IXMLDocument; Lista: TWSTribFederalLista );
        procedure GetEstadual(XML: IXMLDocument; Prod: TWebserviceTributacaoProd);
        function GetString( Node: IXMLNode; Nome: String ): String;
        const
           XMLProd: String =
                  '<?xml version="1.0" encoding="utf-8"?>' + sLineBreak +
                  '<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/">' + sLineBreak +
                  '	<SOAP-ENV:Body xmlns:NS1="urn:server.tributacoes" SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">' + sLineBreak +
                  '		<NS1:BuscaProduto>' + sLineBreak +
                  '			<CodigoBarras xsi:type="xsd:string">%BARRAS%</CodigoBarras>' + sLineBreak +
                  '			<Cumulativo xsi:type="xsd:string">%CUMULATIVO%</Cumulativo>' + sLineBreak +
                  '			<Estado xsi:type="xsd:string">%ESTADO%</Estado>' + sLineBreak +
                  '			<Token xsi:type="xsd:string">%TOKEN%</Token>' + sLineBreak +
                  '		</NS1:BuscaProduto>' + sLineBreak +
                  '	</SOAP-ENV:Body>' + sLineBreak +
                  '</SOAP-ENV:Envelope>';
           XMLNCM: String =
            '<?xml version="1.0" encoding="utf-8"?>' + sLineBreak +
            '<SOAP-ENV:Envelope' + sLineBreak +
                'xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"' + sLineBreak +
                'xmlns:xsd="http://www.w3.org/2001/XMLSchema"' + sLineBreak +
                'xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"' + sLineBreak +
                'xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/">' + sLineBreak +
                '<SOAP-ENV:Body' + sLineBreak +
                    'xmlns:NS1="urn:server.tributacoes" SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">' + sLineBreak +
                    '<NS1:BuscaNCM>' + sLineBreak +
                        '<NCM xsi:type="xsd:string">%NCM%</NCM>' + sLineBreak +
                        '<Cumulativo xsi:type="xsd:string">%CUMULATIVO%</Cumulativo>' + sLineBreak +
                        '<Estado xsi:type="xsd:string">%ESTADO%</Estado>' + sLineBreak +
                        '<Pagina xsi:type="xsd:long">%PAGINA%</Pagina>' + sLineBreak +
                        '<TamPagina xsi:type="xsd:long">%TAMPAGINA%</TamPagina>' + sLineBreak +
                        '<Descricao xsi:type="xsd:long">%DESCRICAO%</Descricao>' + sLineBreak +
                        '<Token xsi:type="xsd:string">%TOKEN%</Token>' + sLineBreak +
                    '</NS1:BuscaNCM>' + sLineBreak +
                '</SOAP-ENV:Body>' + sLineBreak +
                '</SOAP-ENV:Envelope>';
     public
        function Produto( CodigoBarras, Cumulativo ,Estado,  Token: string ): TWebserviceTributacaoProd;
  end;

var
  WebserviceTributacao: TWebserviceTributacao;


implementation

{ TWebserviceTributacao }

uses ws_trib;

procedure TWebserviceTributacao.BeforePost(const HTTPReqResp: THTTPReqResp;
  Data: Pointer);
var
   TimeOut: Integer;
const
  INTERNET_OPTION_HTTP_DECODING = 65;
  contentEncodingHeader = 'Accept-Encoding: gzip, deflate';
var
  Flag: LongBool;
begin
  Flag := True;
  HttpAddRequestHeaders(Data, PChar(contentEncodingHeader),
    Length(contentEncodingHeader), HTTP_ADDREQ_FLAG_ADD);
  InternetSetOption(Data, INTERNET_OPTION_HTTP_DECODING,
    PChar(@Flag), SizeOf(Flag));

   TimeOut := 500000; // in milleseconds.
   InternetSetOption(Data,
        INTERNET_OPTION_RECEIVE_TIMEOUT,
        Pointer(@TimeOut),
        SizeOf(TimeOut));
end;

procedure TWebserviceTributacao.GetEstadual(XML: IXMLDocument;
  Prod: TWebserviceTributacaoProd);
var
  Node, Node2: IXMLNode;
  I: Integer;
  Trib: TWSTribEstadual;
begin
   Node := XML.ChildNodes.FindNode( 'data' );
   Node :=  Node.ChildNodes.Nodes['produto'];
   Node := Node.ChildNodes.Nodes['estadual'];
   Node := Node.ChildNodes.Nodes['entrada'];
   if Node <> nil then
   for I := 0 to Node.ChildNodes.Count -1 do
      begin
         Node2 := Node.ChildNodes.Nodes[I];
         Trib := TWSTribEstadual.Create;
         Trib.ex := Node2.ChildValues['ex'];
         Trib.estado := Node2.ChildValues['estado'];
         Trib.tipo := Node2.ChildValues['tipo'];
         Trib.saida := Node2.ChildValues['saida'];
         Trib.cst := Node2.ChildValues['cst'];
         Trib.aliquota := StringReplace( Node2.ChildValues['aliquota'], '.', ',', [rfReplaceAll] );
         Trib.reducao := StringReplace( Node2.ChildValues['reducao'], '.', ',', [rfReplaceAll] );
         Trib.tipo_mva := Node2.ChildValues['tipo_mva'];
         Trib.mva := StringReplace( Node2.ChildValues['mva'], '.', ',', [rfReplaceAll] );
         Prod.EstadualEntrada.Add( Trib );
      end;
   Node := XML.ChildNodes.FindNode( 'data' );
   Node :=  Node.ChildNodes.Nodes['produto'];
   Node := Node.ChildNodes.Nodes['estadual'];
   Node := Node.ChildNodes.Nodes['saida'];
   if Node <> nil then
   for I := 0 to Node.ChildNodes.Count -1 do
      begin
         Node2 := Node.ChildNodes.Nodes[I];
         Trib := TWSTribEstadual.Create;
         Trib.ex := GetString( Node2, 'ex');
         Trib.estado := GetString( Node2, 'estado');
         Trib.tipo := GetString( Node2, 'tipo');
         Trib.saida := GetString( Node2, 'saida');
         Trib.cst := GetString( Node2, 'cst');
         Trib.aliquota := StringReplace( GetString( Node2, 'aliquota'), '.', ',', [rfReplaceAll] );
         Trib.reducao := StringReplace( GetString( Node2, 'reducao'), '.', ',', [rfReplaceAll] );
         Trib.tipo_mva := GetString( Node2, 'tipo_mva');
         Trib.mva := StringReplace( GetString( Node2, 'mva'), '.', ',', [rfReplaceAll] );
         Prod.EstadualSaida.Add( Trib );
      end;
end;

procedure TWebserviceTributacao.GetFederal(XML: IXMLDocument; Lista: TWSTribFederalLista);
var
  Node, Node2: IXMLNode;
  I: Integer;
  Trib: TWSTribFederal;
begin
   Node := XML.ChildNodes.FindNode( 'data' );
   Node :=  Node.ChildNodes.Nodes['produto'];
   Node := Node.ChildNodes.Nodes['federal'];
   for I := 0 to Node.ChildNodes.Count -1 do
      begin
         Node2 := Node.ChildNodes.Nodes[I];
         Trib := TWSTribFederal.Create;
         Trib.ex := GetString( Node2, 'ex');
         Trib.cumulativo := GetString( Node2, 'cumulativo');
         Trib.descricao := GetString( Node2, 'descricao');
         Trib.ent_pis :=  StringReplace( GetString( Node2, 'ent_pis'), '.', ',', [rfReplaceAll] );
         Trib.ent_cofins := StringReplace( GetString( Node2, 'ent_cofins'), '.', ',', [rfReplaceAll] );
         Trib.ent_cst := GetString( Node2, 'ent_cst');
         Trib.ent_cst_desc := GetString( Node2, 'ent_cst_desc');
         Trib.sai_pis := StringReplace( GetString( Node2, 'sai_pis'), '.', ',', [rfReplaceAll] );
         Trib.sai_cofins := StringReplace( GetString( Node2, 'sai_cofins'), '.', ',', [rfReplaceAll] );
         Trib.sai_cst := GetString( Node2, 'sai_cst');
         Trib.sai_cst_desc := GetString( Node2, 'sai_cst_desc');
         Lista.Add( Trib );
      end;
end;

function TWebserviceTributacao.GetHttp: THTTPRIO;
begin
   Result := THTTPRIO.Create( nil );
   Result.URL := 'http://tributacao.computec.com.br/ws/ws_trib.php';
end;

function TWebserviceTributacao.GetString(Node: IXMLNode; Nome: String): String;
begin
   Result := '';
   try
      Result := Node.ChildValues[Nome];
   except

   end;
end;

function TWebserviceTributacao.Produto(CodigoBarras, Cumulativo, Estado,
  Token: string): TWebserviceTributacaoProd;
var
   Http: THTTPReqResp;
   Request: TStringStream;
   Response: TStringStream;
   Str, sOut: String;

   XML: IXMLDocument;
   Node, Node2: IXMLNode;
   Prod: TWebserviceTributacaoProd;
begin
   Result := nil;
   try
       Str := XMLProd;

       Str := StringReplace( Str, '%BARRAS%', CodigoBarras, [ rfReplaceAll, rfIgnoreCase ] );
       Str := StringReplace( Str, '%ESTADO%', Estado, [ rfReplaceAll, rfIgnoreCase ] );
       Str := StringReplace( Str, '%TOKEN%', Token, [ rfReplaceAll, rfIgnoreCase ] );
       Str := StringReplace( Str, '%CUMULATIVO%', Cumulativo, [ rfReplaceAll, rfIgnoreCase ] );

       Http := THTTPReqResp.Create( nil );
       Request := TStringStream.Create( Str, TEncoding.UTF8  );
       Response := TStringStream.Create( '', TEncoding.UTF8 );
       try
           Http.OnBeforePost := BeforePost;
           Http.URL := 'http://tributacao.computec.com.br/ws/ws_trib.php?wsdl';
           Http.SoapAction := 'BuscaProduto';
           Request.Position := 0;
           Response.Position := 0;
           Http.Execute( Request, Response );
           Response.Position := 0;
           Result := TWebserviceTributacaoProd.Create;
           Prod := Result;
           try
             TThread.Synchronize(
             nil,
               procedure
                   var
                     I: Integer;
                  begin
                         XML := LoadXMLData( Response.DataString );
                         try
                             Node := XML.ChildNodes.FindNode( 'SOAP-ENV:Envelope' );
                             Node := Node.ChildNodes.FindNode( 'SOAP-ENV:Body' );
                             Node := Node.ChildNodes.Nodes[0];
                             Node := Node.ChildNodes.Nodes[0];
                             sOut := Node.NodeValue;
                         finally
                             XML := nil;
                         end;
                         XML := LoadXMLData( sOut  );
                         try
                             Node := XML.ChildNodes.FindNode( 'data' );
                             Prod.Status := Node.ChildValues['status'];
                             if Prod.Status <> 'OK' then
                                Exit;
                             Node :=  Node.ChildNodes.Nodes['produto'];
                             Prod.Descricao := GetString( Node, 'descricao');
                             Prod.Barras := GetString( Node, 'barras');
                             Prod.ncm := GetString( Node, 'ncm');
                             Prod.valor_medio := StringReplace( GetString( Node, 'valor_medio'), '.', ',', [rfReplaceAll] );
                             Prod.ex := GetString( Node, 'ex');
                             Prod.fabricante := GetString( Node, 'fabricante');
                             Prod.pais := GetString( Node, 'pais');
                             Prod.categoria := GetString( Node, 'categoria');
                             Prod.foto := GetString( Node, 'link_foto');
                             GetFederal( XML, Prod.federal );
                             GetEstadual( XML, Prod );
                         finally
                             XML := nil;
                         end;
                   end );
           finally

           end;
       finally
           Request.Clear;
           Response.Clear;
           FreeAndNil( Http );
           FreeAndNil( Request );
           FreeAndNil( Response );
       end;
   except
       if Assigned( Result ) then
          FreeAndNil( Result );
   end;

end;

{ TWebserviceTributacaoProd }

constructor TWebserviceTributacaoProd.Create;
begin
   inherited Create;
   federal := TWSTribFederalLista.Create();
   EstadualEntrada := TWSTribEstadualLista.Create();
   EstadualSaida := TWSTribEstadualLista.Create();
end;

destructor TWebserviceTributacaoProd.Destroy;
begin
  federal.clear;
  EstadualEntrada.Clear;
  EstadualSaida.Clear;
  FreeAndNil( federal );
  FreeAndNil( EstadualEntrada );
  FreeAndNil( EstadualSaida );
  inherited;
end;

initialization
    WebserviceTributacao := TWebserviceTributacao.Create;

finalization
    FreeAndNil( WebserviceTributacao );

end.
