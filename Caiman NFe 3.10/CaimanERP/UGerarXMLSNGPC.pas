unit UGerarXMLSNGPC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxSkinsCore, dxSkinMetropolis, cxLabel, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, AdvGlowButton, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uSNGPC, Vcl.StdCtrls, IniFiles;

type
  TFrmGerarXMLSNGPC = class(TForm)
    Panel1: TPanel;
    AdvGlowButton1: TAdvGlowButton;
    cxDEIni: TcxDateEdit;
    cxDEFim: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    qItens: TFDQuery;
    qItensCOD_PRO: TIntegerField;
    qItensQUANTIDADE: TFloatField;
    qItensNOME_PRO: TStringField;
    qItensNUMERO_LOTE: TStringField;
    qItensCLASSE_TERAPEUTICA: TStringField;
    qItensREGISTRO_MEDICAMENTO: TStringField;
    qItensUNIDADE_MEDICAMENTO: TStringField;
    qSaida: TFDQuery;
    qEntrada: TFDQuery;
    AdvGlowButton2: TAdvGlowButton;
    SNGPC1: ThsnSNGPC;
    edCNPJEmissor: TEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    edCPFEmissor: TEdit;
    edEmail: TEdit;
    cxLabel5: TcxLabel;
    edSenha: TEdit;
    cxLabel6: TcxLabel;
    qMedicamento: TFDQuery;
    qMedicamentoCOD_PRO: TIntegerField;
    qMedicamentoCLASSE_TERAPEUTICA: TStringField;
    qMedicamentoREGISTRO_MEDICAMENTO: TStringField;
    qMedicamentoNUMERO_LOTE: TStringField;
    qMedicamentoUNIDADE_MEDICAMENTO: TStringField;
    qMedicamentoESTOQUE: TBCDField;
    edCaminho: TEdit;
    cxLabel7: TcxLabel;
    qEntradaNUMERO_NOTAFISCAL: TIntegerField;
    qEntradaTIPO_OPERACAO_NF: TStringField;
    qEntradaDATA_NOTA_FISCAL: TDateField;
    qEntradaCNPJ_ORIGEM: TStringField;
    qEntradaCNPJ_DESTINO: TStringField;
    qEntradaCODIGO: TIntegerField;
    qEntradaDATA_CHEGADA_MEDICAMENTO: TDateField;
    qSaidaCODIGO: TIntegerField;
    qSaidaDATA_RECEITA: TDateField;
    qSaidaESTADO_RECEITA: TStringField;
    qSaidaNUMERO_RECEITA: TStringField;
    qSaidaTIPO_USO: TStringField;
    qSaidaCONSELHO: TStringField;
    qSaidaESTADO_MEDIDO: TStringField;
    qSaidaNUMERO_MEDICO: TLargeintField;
    qSaidaNOME_COMPRADOR: TStringField;
    qSaidaESTADO_COMPRADOR: TStringField;
    qSaidaTIPO_DOCUMENTO: TStringField;
    qSaidaORGAO_EXPEDIDOS: TStringField;
    qSaidaNOME_PACIENTE: TStringField;
    qSaidaSEXO: TStringField;
    qSaidaDATA_NASCIMENTO: TDateField;
    qSaidaTIPO_RECEITUARIO: TStringField;
    qSaidaNUMERO_DOCUMENTO: TStringField;
    qSaidaNOME_MEDIDO: TStringField;
    qSaidaCID: TStringField;
    qSaidaIDADE_PACIENTE: TIntegerField;
    qSaidaDATA_VENDA_MEDICAMENTO: TDateField;
    qItensUSO_PROLONGADO: TStringField;
    AdvGlowButton3: TAdvGlowButton;
    edWinrar: TEdit;
    cxLabel8: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AdvGlowButton3Click(Sender: TObject);
  private
    Arquivo : String;
    procedure CompactaArquivo(path, arqXML, ArqZIP:string);
    procedure ADD_Insumos();
    procedure ConfiguraComponente;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGerarXMLSNGPC: TFrmGerarXMLSNGPC;

implementation

{$R *.dfm}

uses UDM;

procedure TFrmGerarXMLSNGPC.AdvGlowButton1Click(Sender: TObject);
begin
   Arquivo := 'ArquivoINV'+FormatDateTime('yyyymmdd', cxDEIni.Date)+FormatDateTime('yyyymmdd', cxDEFim.Date);

   ConfiguraComponente;

   qMedicamento.Open;

   //Defino que é um envio de movimentacao
   SNGPC1.Processo := ftInventario;

   //Informo a data de incio e termino do inventario
   with SNGPC1.Identificacao do
   begin
     DataInicio := cxDEIni.Date;  //Data de Inicio
     DataFim    := cxDEFim.Date; //Data Final
   end;

   //Inicia o Cabecalho do XML
   SNGPC1.IniciaXML;

   with SNGPC1 do
   begin

     //Cabecalho do XML
     with XML.Ct_msgInventario.Cabecalho do
     begin
       CnpjEmissor := Identificacao.Cnpj;        //Cnpj do Emissor
       CpfTransmissor := Identificacao.Cpf;      //CPF do Emissor
       Data           := FormatDateTime('yyyy-mm-dd',Date); //Data da emissão do inventario
     end;

     //Corpo do XML
     with XML.Ct_msgInventario.Corpo do
     begin
        //Inserindo os medicamentos
        qMedicamento.First;
        while not qMedicamento.Eof do
          begin
            With Medicamentos.add do
            begin
              // Estou inserindo o mesmo Medicamento com lotes diferentes
              With MedicamentoEntrada do
              begin
                ClasseTerapeutica := qMedicamentoCLASSE_TERAPEUTICA.AsString;//Classe Terapeutica 1=Antimicrobianos 2= Controlados
                RegistroMSMedicamento    := qMedicamentoREGISTRO_MEDICAMENTO.AsString;  //Registro no MS
                NumeroLoteMedicamento    := qMedicamentoNUMERO_LOTE.AsString;          //Numero do Lote
                QuantidadeMedicamento    := qMedicamentoESTOQUE.AsInteger;                //Quantidade
                UnidadeMedidaMedicamento := qMedicamentoUNIDADE_MEDICAMENTO.AsString;         //Unidade Medicamento  1=Caixas 2=Frascos
              end;

            end;
            qMedicamento.Next;
          end;
        //Apenas para Adiciona a tag em branco
        Insumos;

     end;

   end;

  //Gero o Xml em Disco
  SNGPC1.GerarXML;
  Sleep(1000); //só para ter certeza que nao houve atrazo na criação do arquivo

  //Aqui é feita a compactação do xml, esta compactação dever ser obrigatoriamente
  //no formato zip, ele foi feita qui e não dentro do componente para não gerar
  //dependencia de nada esterno seja componente ou aplicativo.(Winrar ou winzip)

  CompactaArquivo( SNGPC1.Identificacao.PathXML,SNGPC1.Identificacao.NomeXML,'arquivo_xml.zip' );

end;

procedure TFrmGerarXMLSNGPC.FormClose(Sender: TObject;
  var Action: TCloseAction);
var Ini : TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');
  Ini.WriteString('Config', 'CNPJ', edCNPJEmissor.Text);
  Ini.WriteString('Config', 'CPF', edCPFEmissor.Text);
  Ini.WriteString('Config', 'Senha', edSenha.Text);
  Ini.WriteString('Config', 'Email', edEmail.Text);
  Ini.WriteString('Config', 'Caminho', edCaminho.Text);
  Ini.WriteString('Config', 'Winrar', edWinrar.Text);
  FreeAndNil(Ini);
end;

procedure TFrmGerarXMLSNGPC.FormCreate(Sender: TObject);
var Ini : TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');
  edCNPJEmissor.Text := Ini.ReadString('Config', 'CNPJ', '');
  edCPFEmissor.Text := Ini.ReadString('Config', 'CPF', '');
  edSenha.Text := Ini.ReadString('Config', 'Senha', '');
  edEmail.Text := Ini.ReadString('Config', 'Email', '');
  edCaminho.Text := Ini.ReadString('Config', 'Caminho', '');
  edWinrar.Text := Ini.ReadString('Config', 'Winrar', '');
  FreeAndNil(Ini);
  cxDEIni.Date := Date;
  cxDEFim.Date := Date;
end;

procedure TFrmGerarXMLSNGPC.AdvGlowButton2Click(Sender: TObject);
var
  x,y,z :Integer;
  sAux:string;
begin
   Arquivo := 'ArquivoMOV'+FormatDateTime('yyyymmdd', cxDEIni.Date)+FormatDateTime('yyyymmdd', cxDEFim.Date);

   ConfiguraComponente;

   //Defino que é um envio de movimentacao
   SNGPC1.Processo := ftMovimentacao;

   //Informo a data de incio e termino
   with SNGPC1.Identificacao do
   begin
     DataInicio := cxDEIni.Date; //Data de Inicio
     DataFim    := cxDEFim.Date; //Data Final
   end;


   //Inicia o Cabecalho do XML
   SNGPC1.IniciaXML;


//
//-------- A Partir daqui começo a gerar os itens do Envio
//

  //Entrada de Medicamentos
    qEntrada.Close;
    qEntrada.Params[0].AsDate := cxDEIni.Date;
    qEntrada.Params[1].AsDate := cxDEFim.Date;
    qEntrada.Open;
    qEntrada.First;
    while not qEntrada.eof do
      begin
        with SNGPC1.XML.Ct_msgMovimentacao.Corpo.Medicamentos.EntradaMedicamentos.Add do
        begin
          //aqui adiciono as informações do cabeçalho da nota de entrada
          NotaFiscalEntradaMedicamento.NumeroNotaFiscal := qEntradaNUMERO_NOTAFISCAL.AsInteger;
          NotaFiscalEntradaMedicamento.TipoOperacaoNotaFiscal := qEntradaTIPO_OPERACAO_NF.AsString;     //Tipo de Operaçao 1=Compra 2=Transferencia 3=Venda
          NotaFiscalEntradaMedicamento.DataNotaFiscal := FormatDateTime('yyyy-mm-dd',qEntradaDATA_NOTA_FISCAL.AsDateTime); //Data da Nota Fiscal.
          NotaFiscalEntradaMedicamento.CnpjOrigem := qEntradaCNPJ_ORIGEM.AsString;    //Cnpj da origem da nota
          NotaFiscalEntradaMedicamento.CnpjDestino := qEntradaCNPJ_DESTINO.AsString;   //Cnpj de destino da nota

          qItens.Close;
          qItens.Params[0].AsInteger := qEntradaCODIGO.AsInteger;
          qItens.Open;
          //aqui adiciono os itens dos medicamentos de entrada
          qItens.First;
          while not qItens.Eof do
            begin
              with MedicamentoEntrada.Add do
              begin
                ClasseTerapeutica := qItensCLASSE_TERAPEUTICA.AsString; //Classe Terapeutica
                RegistroMSMedicamento    := qItensREGISTRO_MEDICAMENTO.AsString;  //Numero do Registro no MS
                NumeroLoteMedicamento    := qItensNUMERO_LOTE.AsString;         //Lote do Medicamento
                QuantidadeMedicamento    := qItensQUANTIDADE.AsInteger;                //Quantidade do medicamento
                UnidadeMedidaMedicamento := qItensUNIDADE_MEDICAMENTO.AsString;              //Unidade de medida sendo 1=Caixas 2=Frascos
              end;
              qItens.Next;
            end;
          DataRecebimentoMedicamento := FormatDateTime('yyyy-mm-dd',qEntradaDATA_CHEGADA_MEDICAMENTO.AsDateTime); //Data do recebimento do medicamento.
        end;
        qEntrada.Next;
      end;

    {Tipos de Receituario
     1  Receita de Controle Especial em 2 vias (Receita Branca)
     2  Notificação de Receita B (Notificação Azul)
     3  Notificação de Receita Especial (Notificação Branca)
     4  Notificação de Receita A (Notificação Amarela)
     5  Receita Antimicrobiano em 2 vias
    }


    //Venda de Medicamento ao consumidor
    //Deverá ser registro o bloco abaixo para cada venda
    //Cada Venda deverá ser uma receita destinta
    qSaida.Close;
    qSaida.Params[0].AsDate := cxDEIni.Date;
    qSaida.Params[1].AsDate := cxDEFim.Date;
    qSaida.Open;
    qSaida.First;
    while not qSaida.Eof do
      begin
        with SNGPC1.XML.Ct_msgMovimentacao.Corpo.Medicamentos.SaidaMedicamentoVendaAoConsumidor.add do
        begin
          TipoReceituarioMedicamento := qSaidaTIPO_RECEITUARIO.AsString;    //Tipo do Receituario
          NumeroNotificacaoMedicamento := qSaidaNUMERO_RECEITA.AsString;  //Numero da Receita
          DataPrescricaoMedicamento    := FormatDateTime('yyyy-mm-dd',qSaidaDATA_RECEITA.AsDateTime); //Data da Prescriçao da Receita
          PrescritorMedicamento.NomePrescritor := qSaidaNOME_MEDIDO.AsString;      //Nome do Medico
          PrescritorMedicamento.NumeroRegistroProfissional := qSaidaNUMERO_MEDICO.AsString; //CRM do Medico
          {Prescritores CRM=Conselho Regional de Medicina
                        CRMV=Conselho Regional de Medicina Veterinária
                        CRO=Conselho Regional de Odontologia
                        COREN=Conselho Regional de Enfermagem
          }
          PrescritorMedicamento.ConselhoProfissional := qSaidaCONSELHO.AsString;  //Prescritor COnselho reginal Lista Acima
          PrescritorMedicamento.UFConselho := qSaidaESTADO_MEDIDO.AsString;       //UF do Conselho Regional do Prescritor
          UsoMedicamento := qSaidaTIPO_USO.AsString;                              //Tipo de Uso do medicamento( 1=Humano 2=Veterinário)

          //Dados do Comprador da Receita
          //Regra.: Se houver medicamento Sujeito a Controle Especial (classeTerapeutica=2)
          //entao os dados do Comprador são Obrigatoris
          CompradorMedicamento.NomeComprador := qSaidaNOME_COMPRADOR.AsString;   //Nome do Comprador
          CompradorMedicamento.TipoDocumento := qSaidaTIPO_DOCUMENTO.AsString;   //Tipo de Documento apresentado 1=CPF 2=RG
          CompradorMedicamento.NumeroDocumento := qSaidaNUMERO_DOCUMENTO.AsString;     //Numero do DOcumento
          CompradorMedicamento.OrgaoExpedidor  := qSaidaORGAO_EXPEDIDOS.AsString;      //Orgão expedidor
          CompradorMedicamento.UFEmissaoDocumento := qSaidaESTADO_COMPRADOR.AsString;  //Uf emissor do DOcuemnto do paciente

          //Dados do Paciente
          //Regra.: Se houver medicamento antimicrobiano classeTerapeutica=1)na receita
          //entao os dados Paciente são obrigatorios

          PacienteMedicamento.Nome         := qSaidaNOME_PACIENTE.AsString; //Nome do Paciente
          PacienteMedicamento.Idade        := qSaidaIDADE_PACIENTE.AsInteger;   //idade do Paciente
          PacienteMedicamento.UnidadeIdade := 1;                    //Unidade da Idade 1=Anos 2=Meses
          PacienteMedicamento.Sexo         := qSaidaSEXO.AsInteger;  //Sexo 1=Masculino 2=Feminino
          PacienteMedicamento.Cid          := qSaidaCID.AsString;                   //CID (Cod. Internacional Doencas)

          //aqui adiciono os medicamento comprados por este paciente com esta receita
          //lembre-se que um receita pode gerar varios registro de Medicamentos
          qItens.Close;
          qItens.Params[0].AsInteger := qSaidaCODIGO.AsInteger;
          qItens.Open;
          qItens.First;
          while not qItens.Eof do
            begin
              with MedicamentoVenda.Add do
              begin
                if qItensCLASSE_TERAPEUTICA.AsString = '1' then
                  UsoProlongado     := qItensUSO_PROLONGADO.AsString
                else
                  UsoProlongado     := '';     //Uso Prolongado S(im) N(ão) Obs:Só preencha esta TAG se o Produto for Antimcrobiano
                                          //classeTerapeutica=1) Caso seja Controlado passar em banco ''
                RegistroMSMedicamento    := qItensREGISTRO_MEDICAMENTO.AsString;  //Registro do medicamento no MS
                NumeroLoteMedicamento    := qItensNUMERO_LOTE.AsString;    //Lote do medicamento
                QuantidadeMedicamento    := qItensQUANTIDADE.AsInteger;     //Quantidade vendida
                UnidadeMedidaMedicamento := qItensUNIDADE_MEDICAMENTO.AsString;   //Unidade de medida sendo 1=Caixas 2=Frascos
              end;
              qItens.Next;
            end;
          DataVendaMedicamento := FormatDateTime('yyyy-mm-dd',qSaidaDATA_VENDA_MEDICAMENTO.AsDateTime);   //Data da Venda da Receita
        end;
        qSaida.Next;
      end;


    //Gera o Child Insumos em branco
    ADD_Insumos;


  //Gero o Xml em Disco
  SNGPC1.GerarXML;
  Sleep(1000); //só para ter certeza que nao houve atrazo na criação do arquivo

  //Aqui é feita a compactação do xml, esta compactação dever ser obrigatoriamente
  //no formato zip, ele foi feita qui e não dentro do componente para não gerar
  //dependencia de nada esterno seja componente ou aplicativo.(Winrar ou winzip)
  CompactaArquivo( SNGPC1.Identificacao.PathXML,SNGPC1.Identificacao.NomeXML,'arquivoMov_xml.zip' );

end;

procedure TFrmGerarXMLSNGPC.AdvGlowButton3Click(Sender: TObject);
begin
  SNGPC1.EnviarXML(edCaminho.Text+'arquivo_xml.zip');
  SNGPC1.EnviarXML(edCaminho.Text+'arquivoMov_xml.zip');
end;

procedure TFrmGerarXMLSNGPC.CompactaArquivo(path, arqXML, ArqZIP:string);
var cmd, pathWinrar : String;
begin
  pathWinrar := edWinrar.Text;

  Cmd := pathWinrar+' a -afzip '+path+arqZIP+' '+path+arqXML;
  WinExec( PAnsiChar(AnsiString(Cmd)), SW_HIDE);


 if FileExists(edCaminho.Text+ArqZIP) then
    ShowMessage('Arquivo criado e compactado com sucesso');

end;

procedure TFrmGerarXMLSNGPC.ADD_Insumos();
begin

  with SNGPC1.XML.Ct_msgMovimentacao.Corpo.Insumos do
  begin

//    EntradaInsumos.Add;
//    SaidaInsumoVendaAoConsumidor.Add;
//    SaidaInsumoTransferencia.Add;
//    SaidaInsumoPerda.Add;
  end;

end;

procedure TFrmGerarXMLSNGPC.ConfiguraComponente;
begin
  //Configurando o Componente
  with SNGPC1 do
  begin
    Ambiente := ftHomologacao;
     with SNGPC1.Identificacao do
     begin

       PathXML := edCaminho.Text;             //Path onde será gerado o xml (não esquecer a \ no final )
       NomeXML := Arquivo+'.xml'; //nome do arquivos xml que será gerado

       Cnpj := edCNPJEmissor.Text;             //Cnpj do emissor
       Cpf  := edCPFEmissor.Text;                           //Cpf do Emissor
       DataInicio := cxDEIni.Date;
       DataFim    := cxDEFim.Date;
       Senha := edSenha.Text;                  //Senha da ANVISA
       Email := edEmail.Text; //Email do Emissor
     end;
  end;
end;

end.
