unit UMenuFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, dxCore, ComCtrls, DB, StdCtrls, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmMenuFiscal = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    QComposicao: TFDQuery;
    QComposicaoCOD_PRO: TIntegerField;
    QComposicaoCOD_PRO_COMPOSICAO: TIntegerField;
    QComposicaoQUANT: TBCDField;
    QComposicaoNOME_PRO: TStringField;
    QItensMesa: TFDQuery;
    QItensMesaORDEM: TIntegerField;
    QItensMesaQUANT: TBCDField;
    QItensMesaVALOR: TBCDField;
    QItensMesaCODIGO_BARRA_PRO: TStringField;
    QItensMesaDESC_CUPOM: TStringField;
    QItensMesaCANCELADO: TIntegerField;
    BtnLX: TButton;
    BtnLMFC: TButton;
    BtnLMFS: TButton;
    BtnEspelhoMFD: TButton;
    BtnArquivoMFD: TButton;
    btnRegistrosPafEcf: TButton;
    BtnIdentificacao: TButton;
    BtnVendasPeriodo: TButton;
    BtnProducao: TButton;
    btnParametros: TButton;
    BtnTransfMesa: TButton;
    procedure BtnLXClick(Sender: TObject);
    procedure BtnLMFCClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnLMFSClick(Sender: TObject);
    procedure BtnTabelaProdutosClick(Sender: TObject);
    procedure btnRegistrosPafEcfClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnEspelhoMFDClick(Sender: TObject);
    procedure BtnArquivoMFDClick(Sender: TObject);
    procedure BtnProducaoClick(Sender: TObject);
    procedure BuscaComposicao(const iCodPro : integer);
    procedure BtnIdentificacaoClick(Sender: TObject);
    procedure BtnDavEmitidosClick(Sender: TObject);
    procedure BtnMesasAbertasClick(Sender: TObject);
    procedure BtnTransfMesaClick(Sender: TObject);
    procedure BtnVendasPeriodoClick(Sender: TObject);
    procedure BtnMovECFClick(Sender: TObject);
    procedure BtnMeiosPagtoClick(Sender: TObject);
    procedure btnParametrosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenuFiscal: TFrmMenuFiscal;

implementation
uses
  UECF, Udm, Ubibli1, ULMF, UPafEcfTabelaProduto, URegistrosPafEcf, UEspelhoMFD, 
  UDavEmitidos, UMovimentoPorECF, UVendasPeriodo, UMeiosPagamento, 
  UStatusGerando;
var  Arquivo : TextFile;

{$R *.dfm}

procedure TFrmMenuFiscal.BtnLXClick(Sender: TObject);
begin
   LeituraX( iEcf );
end;

procedure TFrmMenuFiscal.BtnLMFCClick(Sender: TObject);
begin
   Application.CreateForm(TFrmLMF, FrmLMF);
   FrmLMF.Tag:= 0;
   FrmLMF.Caption:= 'Leitura de Memória Fiscal Completa (LMFC)';
   FrmLMF.showmodal;
end;

procedure TFrmMenuFiscal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close;
end;

procedure TFrmMenuFiscal.BtnLMFSClick(Sender: TObject);
begin
   Application.CreateForm(TFrmLMF, FrmLMF);
   FrmLMF.Tag:= 1;
   FrmLMF.Caption:= 'Leitura de Memória Fiscal Simplificaca (LMFS)';
   FrmLMF.showmodal;
end;

procedure TFrmMenuFiscal.BtnTabelaProdutosClick(Sender: TObject);
begin
   Application.CreateForm(TFrmPafEcfTabelaProduto, FrmPafEcfTabelaProduto);
   FrmPafEcfTabelaProduto.showmodal;
end;

procedure TFrmMenuFiscal.btnRegistrosPafEcfClick(Sender: TObject);
begin
   Application.CreateForm( TfrmRegistrosDoPafEcf, frmRegistrosDoPafEcf);
   frmRegistrosDoPafEcf.showmodal;
end;

procedure TFrmMenuFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:= caFree;
   Self := nil;
end;

procedure TFrmMenuFiscal.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmMenuFiscal.BtnEspelhoMFDClick(Sender: TObject);
begin
{   Application.CreateForm(TFrmEspelhoMFD, FrmEspelhoMFD);
   FrmEspelhoMFD.tag:= 0;
   FrmEspelhoMFD.Caption:= 'Espelho MFD';
   FrmEspelhoMFD.showmodal;}
   if iECF = 99 then
      exit;
    frmStatusGerando.pnl1.Caption := 'Gerando Arq MF';
   frmStatusGerando.Show;
   frmStatusGerando.BringToFront;
   dm.ECF.ArquivoMF_Binario_DLL( 'C:\PAF_ECF\ArqMF.bin' );
   CopyFile( 'C:\PAF_ECF\ArqMF.bin', 'C:\PAF_ECF\ArqMF.txt', false );
   dm.EAD1.AssinarArquivoComEAD( 'C:\PAF_ECF\ArqMF.txt', True );
   ShowMessage( 'Arquivo Gerado em : ' + #13 +
   'C:\PAF_ECF\ArqMF.txt' + #13 +
    'C:\PAF_ECF\ArqMF.bin');
   frmStatusGerando.Close;
end;

procedure TFrmMenuFiscal.BtnArquivoMFDClick(Sender: TObject);
begin
   Application.CreateForm(TFrmEspelhoMFD, FrmEspelhoMFD);
   FrmEspelhoMFD.tag:= 1;
   FrmEspelhoMFD.Caption:= 'Arquivo MFD';
   FrmEspelhoMFD.showmodal;
end;

procedure TFrmMenuFiscal.BtnProducaoClick(Sender: TObject);
var sAux : string;
begin
   { verifica se o diretorio 'c:\paf'_ecf existe }
   if not DirectoryExists('c:\Paf_Ecf') then
      CreateDir('c:\Paf_Ecf');

   { Inicializa o arquivo }
   assignfile(Arquivo, 'C:\PAF_ECF\TabelaProducao.TXT');
   rewrite(Arquivo);

   { montando tabela de indice tecnico }
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   try
     try
       with dm.QConsultaServer do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT DISTINCT(C.COD_PRO), P.NOME_PRO ' +
                        'FROM PRODUTOS_COMPOSICAO C ' +
                        'INNER JOIN PRODUTO P ' +
                        'ON (C.COD_PRO = P.COD_PRO) ' +
                        'ORDER BY C.COD_PRO';
             open;
             while not eof do
               begin
                  { grava no txt produto mestre }
                  sAux:= FormataStringD(fieldbyname('cod_pro').AsString, '6', '0') +  ' ' +
                         fieldbyname('nome_pro').AsString;
                  writeln(Arquivo, sAux);

                  { grava no txt produto que compoe }
                  BuscaComposicao(fieldbyname('cod_pro').AsInteger);
                  next;
               end;
          end;
       dm.IBTRServer.Commit;
     except
       dm.IBTRServer.Rollback;
       showmessage('erro ao buscar os produto');
     end;
   finally
     dm.QConsultaServer.Close;
   end;

   { Finaliza o arquivo }
   closefile(Arquivo);

   { EAD - Assinatura Digital }
   dm.AssinaturaDigital('C:\PAF_ECF\TabelaProducao.TXT');

   Application.MessageBox('Arquivo ' + 'C:\PAF_ECF\TabelaProduto.txt' + ' gerado com sucesso!', 'Atenção', MB_ICONINFORMATION + MB_OK );
end;

procedure TFrmMenuFiscal.BuscaComposicao(const iCodPro : integer);
var sAux : string;
begin
   try
     try
       with QComposicao do
          begin
             close;
             parambyname('codpro').AsInteger:= iCodPro;
             open;
             while not eof do
                begin
                   sAux:= '   ' + FormataStringD(QComposicaoCOD_PRO_COMPOSICAO.AsString, '6', '0') +  ' ' +
                          FormataStringD(CurrToStrF(QComposicaoQUANT.AsCurrency, ffnumber, 3), '10', ' ') +  '  ' +
                          fieldbyname('nome_pro').AsString;
                   writeln(arquivo, saux);
                   next;
                end;
             writeln(arquivo, '');
          end;
     except
       showmessage('erro ao buscar os produto');
     end;
   finally
     QComposicao.Close;
   end;
end;

procedure TFrmMenuFiscal.btnParametrosClick(Sender: TObject);
begin
   if iECF = 99 then
      Exit;
//   dm.ECF.PafMF_RelParametrosConfiguracao();
   dm.ImprimeConfiguracaoPAF;

end;

procedure TFrmMenuFiscal.BtnIdentificacaoClick(Sender: TObject);
var Arquivo : TStringList;
    i : integer;
    sAux : string;
    sAuxMD5 : string;
begin
   if not (iECF < 99) then
      exit;

   dm.ECF.PafMF_RelIdentificacaoPafECF;
end;

procedure TFrmMenuFiscal.BtnDavEmitidosClick(Sender: TObject);
begin
   Application.CreateForm(TFrmDavEmitidos, FrmDavEmitidos);
   FrmDavEmitidos.showmodal;
end;

procedure TFrmMenuFiscal.BtnMesasAbertasClick(Sender: TObject);
begin
   if not (iECF < 99) then
      exit;

   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   with dm.QConsultaServer do
      begin
         close;
         sql.Clear;
         sql.Text:= 'SELECT CONTA, DATA_ABERTURA, HORA_ABERTURA ' +
                    'FROM CONTA_CLIENTE ' +
                    'WHERE STATUS = 0   ' +
                    'ORDER BY CONTA ';
         open;

         { Imprime o Cabeçalho }
         AbreRelatoroGerencial(iECF, '01');
         ImprimeRelatorioGerencial(iECF, '              Mesas Abertas');
         ImprimeRelatorioGerencial(iECF, ' ');

         while not eof do
            begin
               ImprimeRelatorioGerencial(iECF, FormataStringD(fieldbyname('conta').AsString, '3', '0') + '   ' +
                                         fieldbyname('data_abertura').AsString + '   ' +
                                         fieldbyname('hora_abertura').AsString);
               next;
            end;

         { Fecha o Relatório Gerencial }
         FechaRelatorioGerencial(iECF);
      end;
   dm.IBTRServer.Commit;
   dm.QConsultaServer.Close;
end;

procedure TFrmMenuFiscal.BtnTransfMesaClick(Sender: TObject);
var sAux : string;
   RelTransMesas: TStrings;
begin
   if not (iECF < 99) then
      exit;
   RelTransMesas := TStringList.Create;
   RelTransMesas.Clear;
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   with dm.QConsultaServer do
      begin
         close;
         sql.Clear;
         sql.Text:= 'SELECT I.CODIGO, I.CONTA_ORIGEM, C.CONTA ' +
                    'FROM ITENS_CONTA_CLIENTE I ' +
                    'INNER JOIN CONTA_CLIENTE C ' +
                    'ON (I.CODIGO = C.CODIGO) ' +
                    'WHERE C.STATUS = 0 AND I.CONTA_ORIGEM IS NOT NULL ' +
                    'GROUP BY I.CODIGO, I.CONTA_ORIGEM, C.CONTA ' +
                    'ORDER BY I.CODIGO, I.CONTA_ORIGEM';
         open;

         { Imprime o Cabeçalho }
      //   AbreRelatoroGerencial(iECF, '01');
         RelTransMesas.Add( '<n><ce>Transferências entre Mesas</ce></n>');
         RelTransMesas.Add( ' ');

         while not eof do
            begin
               RelTransMesas.Add( 'Mesa Origem: ' + FormataStringD(fieldbyname('conta_origem').AsString, '3', '0') + '   ' +
                                               'Mesa Destino: ' + FormataStringD(fieldbyname('conta').AsString, '3', '0'));
               RelTransMesas.Add( FormataStringD( '-', '40', '-' ));
               RelTransMesas.Add( 'Item          Descrição          Qtd       Valor');
               RelTransMesas.Add( FormataStringD( '-', '40', '-' ));

               { BUSCA OS ITENS TRANSFERIDOS }
               QItensMesa.Close;
               QItensMesa.ParamByName('codigo').AsInteger := fieldbyname('codigo').AsInteger;
               QItensMesa.ParamByName('origem').AsInteger := fieldbyname('conta_origem').AsInteger;
               QItensMesa.Open;
               while not QItensMesa.Eof do
                  begin
                     sAux:= FormataStringD(QItensMesaCODIGO_BARRA_PRO.AsString, '13', '0') + ' ' +
                            FormataStringE(copy(QItensMesaDESC_CUPOM.AsString, 1, 15), '15', ' ') + ' ' +
                            FormataStringD(CurrToStrF(QItensMesaQUANT.AsCurrency, ffnumber, 3), '8', ' ') +
                            FormataStringD(CurrToStrF(QItensMesaVALOR.AsCurrency, ffnumber, 2), '10', ' ');
                     RelTransMesas.Add(  sAux);

                     if QItensMesaCANCELADO.AsInteger = 1 then
                        RelTransMesas.Add(  '              CANCELADO');

                     QItensMesa.Next;
                  end;
               QItensMesa.Close;
               RelTransMesas.Add(  ' ');

               next;
            end;

         { Fecha o Relatório Gerencial }
         dm.ECF.RelatorioGerencial( RelTransMesas, 1, 0 );
      end;
   RelTransMesas.Free;
   dm.IBTRServer.Commit;
   dm.QConsultaServer.Close;
end;

procedure TFrmMenuFiscal.BtnVendasPeriodoClick(Sender: TObject);
begin
   Application.CreateForm(TFrmVendasPeriodo, FrmVendasPeriodo);
   FrmVendasPeriodo.showmodal;
end;

procedure TFrmMenuFiscal.BtnMovECFClick(Sender: TObject);
begin
   Application.CreateForm(TFrmMovimentoPorECF, FrmMovimentoPorECF);
   FrmMovimentoPorECF.Tag:= 0;
   FrmMovimentoPorECF.showmodal;
end;

procedure TFrmMenuFiscal.BtnMeiosPagtoClick(Sender: TObject);
begin
   Application.CreateForm(TFrmMeiosPagamento, FrmMeiosPagamento);
   FrmMeiosPagamento.showmodal;
end;





end.
