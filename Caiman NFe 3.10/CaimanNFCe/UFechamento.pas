unit UFechamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, Mask, ExtCtrls, DB, ACBrDevice, StrUtils, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmFechamento = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdtData: TMaskEdit;
    EdtHora: TMaskEdit;
    EdtNomeCaixa: TEdit;
    EdtCodCaixa: TEdit;
    Panel2: TPanel;
    BtnOk: TButton;
    BtnCancelar: TButton;
    StatusBar: TStatusBar;
    IBSQLFecha: TFDQuery;
    QInsMapaRes: TFDQuery;
    BtnMenuFiscal: TButton;
    QconsPreVenda: TFDQuery;
    QItensPreVenda: TFDQuery;
    IBTRPreVenda: TFDTransaction;
    QBuscaIndice: TFDQuery;
    QBuscaIndiceINDICE_ECF: TStringField;
    QconsPreVendaCOD_PRE: TIntegerField;
    QconsPreVendaDATA_PRE: TDateField;
    QconsPreVendaCOD_CLI: TIntegerField;
    QconsPreVendaCOD_TPV: TIntegerField;
    QconsPreVendaCOD_EMP: TIntegerField;
    QconsPreVendaSTATUS_PRE: TIntegerField;
    QconsPreVendaTOTAL_PRE: TBCDField;
    QconsPreVendaHORA_PRE: TTimeField;
    QconsPreVendaCOD_VENDA: TIntegerField;
    QconsPreVendaDOCUMENTO: TStringField;
    QconsPreVendaOBS_PRE: TStringField;
    QconsPreVendaDESCONTO_PRE: TBCDField;
    QconsPreVendaCOD_VEND: TIntegerField;
    QconsPreVendaSEQUENCIA_PAF: TLargeintField;
    QconsPreVendaSENHA_FECHAR_VENDA: TStringField;
    QconsPreVendaNOME_CLI: TStringField;
    QconsPreVendaCNPJ_CLI: TStringField;
    QconsPreVendaCIDRES_CLI: TStringField;
    QconsPreVendaESTRES_CLI: TStringField;
    QItensPreVendaCOD_PRE: TIntegerField;
    QItensPreVendaORDEM: TIntegerField;
    QItensPreVendaCOD_PRO: TIntegerField;
    QItensPreVendaDESCONTO: TBCDField;
    QItensPreVendaCOD_EMP: TIntegerField;
    QItensPreVendaQUANT: TBCDField;
    QItensPreVendaVALOR: TBCDField;
    QItensPreVendaPRODUTO_PROMOCAO: TStringField;
    QItensPreVendaCANCELADO: TIntegerField;
    QItensPreVendaDESC_CUPOM: TStringField;
    QItensPreVendaICMS_CF_EST: TIntegerField;
    QItensPreVendaCODIGO_BARRA_PRO: TStringField;
    QItensPreVendaDESCRICAO: TStringField;
    QConsConta: TFDQuery;
    QConsContaCODIGO: TIntegerField;
    QConsContaDATA_ABERTURA: TDateField;
    QConsContaHORA_ABERTURA: TTimeField;
    QConsContaCONTA: TIntegerField;
    QConsContaDATA_FECHAMENTO: TDateField;
    QConsContaHORA_FECHAMENTO: TTimeField;
    QConsContaCOD_CAI: TIntegerField;
    QConsContaCOD_EMP: TIntegerField;
    QConsContaSTATUS: TIntegerField;
    QConsContaTOTAL: TBCDField;
    QConsContaCONTA_ORIGEM: TIntegerField;
    QConsContaCER: TIntegerField;
    QConsContaCOO: TIntegerField;
    QConsContaCOO_VENDA: TIntegerField;
    QItensConta: TFDQuery;
    QItensContaCODIGO: TIntegerField;
    QItensContaORDEM: TIntegerField;
    QItensContaCOD_PRO: TIntegerField;
    QItensContaCOD_VEND: TIntegerField;
    QItensContaVALOR: TBCDField;
    QItensContaCONTA_ORIGEM: TIntegerField;
    QItensContaCANCELADO: TIntegerField;
    QItensContaCOD_EMP: TIntegerField;
    QItensContaQUANT: TBCDField;
    QItensContaDESC_CUPOM: TStringField;
    QItensContaICMS_CF_EST: TIntegerField;
    QItensContaCODIGO_BARRA_PRO: TStringField;
    QItensContaDESCRICAO: TStringField;
    procedure BuscaCaixa;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnMenuFiscalClick(Sender: TObject);
    procedure CancelarPreVenda(const dData : TDateTime);
    function  AbreVenda : integer;
    function  AbreVendaContaCliente: Integer;
    function  RegistraProduto(const IcodPreVenda : integer) : integer;
    function  RegistraProdutoConta( iCodConta: Integer ): Integer;
    function  BuscaIndice(iCodigoGRP : integer) : string;
    function  TotalizaCupom : integer;
    function  EfetuaPagamentos(const cValor : currency) : integer;
    function  FechaCupom : integer;
    function  FechaCupomConta: Integer;
    procedure CancelaPreVenda;
    procedure GerencialDavOS(const vdata : TDateTime);
    procedure GerencialMesasAbertas;
    procedure FormCreate(Sender: TObject);
    procedure BuscaPadraoConta;
    procedure CancelaContas( dData: TDateTime );
    procedure AtualizaContaCliente(const iAux, iCodigoConta : integer);
  private
    { Private declarations }
  public
    { Public declarations }
    VendedorPadra: Integer;
    TipoVendaPadrao: Integer;
    CLientePadrao: Integer;
  end;

var
  FrmFechamento: TFrmFechamento;

implementation
uses
  Udm, UECF, Ubibli1, UMenuFiscal;
var  cTotalOldPre : currency;
     iCodVenda    : integer;
     iAuxCOO      : integer;
     iAuxCCF      : integer;
     cTotalOldConta: Currency;

procedure TFrmFechamento.BuscaCaixa;
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QConsulta do
      begin
         close;
         sql.Clear;
         sql.Add('SELECT DESC_CAI ' +
                 'FROM CAIXA      ' +
                 'WHERE COD_CAI = :CODCAI AND COD_EMP = :CODEMP');
         Parambyname('codcai').AsInteger := iCaixa;
         Parambyname('codemp').AsInteger := iEmp;
         Open;
         if recordcount > 0 then
            EdtNomeCaixa.Text:= fieldbyname('desc_cai').AsString
         else
            begin
               showmessage('Caixa não Cadastrado');
               EdtNomeCaixa.Clear;
            end;
      end;
   dm.IBTransaction.Commit;
   dm.QConsulta.Close;
end;

{$R *.dfm}

procedure TFrmFechamento.FormShow(Sender: TObject);
var sAuxData : string;
    dDataMovimento : TDateTime;
begin
   { busca a data do movimento }

   sAuxData:= DataMovimentoECF(iECF);
   if (trim(sAuxData) = '000000') or (trim(sAuxData) = '010100') then
      begin
         showmessage('ECF sem movimento');
         exit;
      end;

   try
     dDataMovimento:= strtodate(copy(sAuxData, 1, 2) + '/' + copy(sAuxData, 3, 2) + '/' + copy(sAuxData, 5, 2));
   except
     showmessage('Erro ao buscar a data do movimento');
     close;
   end;

   StatusBar.SimpleText:= '';
   EdtCodCaixa.Text := inttostr(iCaixa);
   buscacaixa;
   edtdata.Text := DateToStr(dDataMovimento);
   edthora.Text := timetostr(time);
   edtdata.setfocus;
end;

procedure TFrmFechamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:= caFree;
   Self := nil;
end;

procedure TFrmFechamento.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

function TFrmFechamento.AbreVendaContaCliente: Integer;
var iAuxCupom : integer;
    sCOO      : string;
    sCCF      : string;
    sAuxCliente, sAuxDoc, sAuxEnd: string;
begin
   { verifica o numero de serie da ecf }
   if not VerificaNumeroSerie then
      begin
         result:= 1;
         //showmessage('Número de Série da ECF não Confere');
         exit;
      end;

   { verifica o GT da ECF }
   if not VerificaGT then
      begin
         result:= 1;
         //showmessage('Totalizador Geral do ECF não confere');
         exit;
      end;

   { ABRE CUPOM FISCAL }
         BuscaPadraoConta;
   if AbreCupom(iECF, '', '', '' ) = 0 then
      begin
         sCOO:= NumeroCupom(iECF);
         try
           iAuxCOO:= strtoint(sCOO);
         except
           iAuxCOO:= 0;
         end;

         sCCF:= ContadorCupomFiscal(iECF);
         try
           iAuxCCF:= strtoint(sCCF);
         except
           iAuxCCF:= 0;
         end;

         { GRAVANDO A VENDA }
         iCodVenda:= GravaVenda(iAuxCOO, iAuxCCF, 0,CLientePadrao, VendedorPadra, TipoVendaPadrao, 1);
         if iCodVenda > 0 then
            result:= 0
         else
            result:= 1;
      end
   else
      result:= 1;
end;


procedure TFrmFechamento.BtnCancelarClick(Sender: TObject);
begin
   close;
end;

procedure TFrmFechamento.BtnOkClick(Sender: TObject);
var sAuxData : string;
    dDataMovimento, DataAtual : TDateTime;
    Datateste: string;
    bAuxPreVenda : boolean;
    bAuxDavOS    : boolean;
    Servidor  : Boolean;
    bAuxMesasAbertas: Boolean;
    bAuxContas: Boolean;
begin
   try
        DM.ECF.DoVerificaValorGT;
   except
      on E: Exception do
         begin
            ShowMessage( E.Message );
            Exit;
         end;
   end;
   bAuxPreVenda  := false;
   bAuxDavOS     := false;
   bAuxMesasAbertas := False;
   bAuxContas := False;
   StatusBar.SimpleText:= 'Gravando totalizadores...';
   Application.ProcessMessages;

   { busca a data do movimento }
   try
//      datateste :=
     dDataMovimento:= dm.ECF.DataMovimento;
   except
     showmessage('Erro ao buscar a data do movimento');
     exit;
     abort;
   end;

   if Application.MessageBox('Deseja fechar o Caixa?', 'Fechamento de Caixa', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         try
           try
             with IBSQLFecha do
                begin
                   close;
                   sql.Clear;
                   sql.Add('UPDATE ABRE_FECHA_CAIXA SET DATA_FECHA = :DATAFECHA, HORA_FECHA = :HORAFECHA ' +
                           'WHERE COD_CAI = :CODCAI AND COD_EMP = :CODEMP AND DATA_FECHA IS NULL');
                   Parambyname('codemp').AsInteger := iEmp;
                   Parambyname('codcai').AsInteger := iCaixa;
                   Parambyname('datafecha').AsDate := dDataMovimento;
                   Parambyname('horafecha').AsTime := strtotime(edthora.Text);
                   ExecOrOpen;
                end;
             dm.IBTransaction.Commit;
           except
             showmessage('Erro ao gravar o Fechamento do Caixa');
             dm.IBTransaction.Rollback;
           end;
         finally
           IBSQLFecha.Close;
         end;

         { verifica se tem pre-venda pra ser cancelada }
         if DM.IBDatabaseServer.Connected then
            Servidor := True
         else
            begin
               try
                  DM.IBDatabaseServer.Connected := True;
                  Servidor := True;
               except
                  Servidor := False;
               end;
            end;
         StatusBar.SimpleText:= 'Cancelando Pré Vendas...';
         Application.ProcessMessages;
         if Servidor then
         if iECF < 99 then
         if not ( dm.ECF.Estado = estRequerZ  ) then
            begin
               if dDataMovimento = date then  //hoje
                  begin
                     CancelarPreVenda(date -1);
                     bAuxPreVenda:= true;
                  end;
            end;

         { verifica se tem que emitir gerencial DAV-OS }
{         if iECF < 99 then
            begin
               if dDataMovimento = date then  //hoje
                  begin
                     GerencialDavOS(date);
                     bAuxDavOS:= true;
                  end;
            end;}
         StatusBar.SimpleText:= 'Rel Mesas Abertas...';
         Application.ProcessMessages;
         { verifica se tem mesas abertas para imprimir }
         if Servidor then
         if iECF < 99 then
         if not ( dm.ECF.Estado = estRequerZ  ) then
            begin
//               if dDataMovimento = date then  //hoje
                  begin
                      GerencialMesasAbertas;
                      bAuxMesasAbertas := True;
                  end;
            end;
         if not ( dm.ECF.Estado = estRequerZ  ) then
            begin
               if dDataMovimento = date then  //hoje
                  begin
                     CancelaContas(date -1);
                     bAuxContas:= true;
                  end;
            end;


         { emitindo a Reducao Z }

         LeituraZ(iECF, EdtHora.text);
//         MapaResumo(iECF, dDataMovimento);
         DataAtual := DataECF( iECF );
  //       dm.GeraMovimento(iCaixa, dDataMovimento, DataAtual, 1, '');
         { verifica se tem pre-venda pra ser cancelada }
         StatusBar.SimpleText:= 'Cancelando Pré Vendas...';
         Application.ProcessMessages;
         if Servidor then
         if iECF < 99 then
            begin
               if bAuxPreVenda = false then
                  begin
                     if dDataMovimento < date then
                        begin
                           CancelarPreVenda(date -2);
                           bAuxPreVenda:= true;
                        end;
                  end;
            end;
         StatusBar.SimpleText:= 'Rel Mesas Abertas...';
         Application.ProcessMessages;
         if Servidor then
         if iECF < 99 then
            begin
                if bAuxMesasAbertas = false then
                   GerencialMesasAbertas;
            end;
         if Servidor then
         if iECF < 99 then
            begin
               if bAuxContas = false then
                  begin
                     if dDataMovimento < date then
                        begin
                           CancelaContas(date -2);
                           bAuxContas:= true;
                        end;
                  end;
            end;

         { verifica se tem que emitir gerencial DAV-OS }
{         if iECF < 99 then
            begin
               if bAuxDavOS = false then
                  begin
                     if dDataMovimento < date then
                        begin
                           GerencialDavOS(date -1);
                           bAuxDavOS:= true;
                        end;
                  end;
            end;}

         { Gerando o arquivo de Movimento Diario }



         StatusBar.SimpleText:= 'Pronto...';
         ShowMessage( 'Fechamento Concluído!' );

         close;
      end;
end;

procedure TFrmFechamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmFechamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close;
end;

procedure TFrmFechamento.BtnMenuFiscalClick(Sender: TObject);
begin
   Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
   FrmMenuFiscal.showmodal;
end;

procedure TFrmFechamento.CancelarPreVenda(const dData : TDateTime);
var
  icooantes: Integer;
begin
   if IBTRPreVenda.Active then
      IBTRPreVenda.Commit;
   IBTRPreVenda.StartTransaction;
   with QconsPreVenda do
      begin
         close;
         Parambyname('codemp').AsInteger := iEmp;
         Parambyname('data').AsDate      := dData;
         open;
         while not eof do
            begin
               { efetuando o cancelamento da Pre-Venda }
               { abrindo o cupom Fiscal }
                icooantes := 0;
               if AbreVenda = 0 then
                  begin
                     RegistraProduto(QconsPreVendaCOD_PRE.AsInteger);

                     if not (TotalizaCupom = 0) then
                        exit;

                     if not (EfetuaPagamentos(cTotalOLDPre) = 0) then
                        exit;

                     if not (FechaCupom = 0) then
                        exit;

                     {atualiza os totais da venda}
                     GravaFechamentoVenda(iCodVenda, 0, cTotalOLDPre, QconsPreVendaNOME_CLI.AsString, QconsPreVendaCNPJ_CLI.AsString);

                     { cancela o cupom fiscal }
                     icooantes := StrToInt( DM.ECF.NumCOO );
                     CancelaCupomFiscal(iECF);
                     dm.CancelaVenda( icooantes );
                     { grava o GT }
                     GravaGT(iECF);

                     {cancela a pre-venda}
                     CancelaPreVenda;

                  end;
               next;
            end;
      end;
   IBTRPreVenda.Commit;
   QconsPreVenda.Close;
end;

function TFrmFechamento.AbreVenda : integer;
var iAuxCupom : integer;
    sCOO      : string;
    sCCF      : string;
    sAuxCliente, sAuxDoc, sAuxEnd: string;
begin
   { verifica o numero de serie da ecf }
   if not VerificaNumeroSerie then
      begin
         result:= 1;
         //showmessage('Número de Série da ECF não Confere');
         exit;
      end;

   { verifica o GT da ECF }
   if not VerificaGT then
      begin
         result:= 1;
         //showmessage('Totalizador Geral do ECF não confere');
         exit;
      end;

   { ABRE CUPOM FISCAL }
   sAuxCliente := trim(QconsPreVendaNOME_CLI.AsString);
   sAuxDoc     := trim(QconsPreVendaCNPJ_CLI.AsString);
   sAuxEnd     := trim(QconsPreVendaCIDRES_CLI.AsString + '-' + QconsPreVendaESTRES_CLI.AsString);

   if AbreCupom(iECF, sAuxend, sAuxCliente, sAuxDoc ) = 0 then
      begin
         sCOO:= NumeroCupom(iECF);
         try
           iAuxCOO:= strtoint(sCOO);
         except
           iAuxCOO:= 0;
         end;

         sCCF:= ContadorCupomFiscal(iECF);
         try
           iAuxCCF:= strtoint(sCCF);
         except
           iAuxCCF:= 0;
         end;

         { GRAVANDO A VENDA }
         iCodVenda:= GravaVenda(iAuxCOO, iAuxCCF, 0, QconsPreVendaCOD_CLI.AsInteger, QconsPreVendaCOD_VEND.AsInteger, QconsPreVendaCOD_TPV.AsInteger, 1);
         if iCodVenda > 0 then
            result:= 0
         else
            result:= 1;
      end
   else
      result:= 1;
end;

function TFrmFechamento.RegistraProduto(const IcodPreVenda : integer) : integer;
var sIndice : string;
begin
   cTotalOLDPre:= 0;

   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   with QItensPreVenda do
      begin
         close;
         Parambyname('codpre').AsInteger:= IcodPreVenda;
         open;
         while not eof do
           begin
              cTotalOLDPre:= cTotalOLDPre + ((QItensPreVendaQUANT.AsCurrency * QItensPreVendaVALOR.AsCurrency) - QItensPreVendaDESCONTO.AsCurrency);

              { busca o indice da aliquota na ecf }
              sIndice:= BuscaIndice(QItensPreVendaICMS_CF_EST.AsInteger);

              {registra item ecf}
              RegistraItemECF(iECF, 14, iTamDescCupom, trim(QItensPreVendaCODIGO_BARRA_PRO.AsString),
                              trim(QItensPreVendaDESC_CUPOM.AsString), sIndice, trim(QItensPreVendaDESCRICAO.AsString),
                              QItensPreVendaQUANT.AsCurrency, QItensPreVendaVALOR.AsCurrency, QItensPreVendaDESCONTO.AsCurrency);

              {verifica se o item está cancelado na prevenda e cancela no cupom}
              if QItensPreVendaCANCELADO.AsInteger = 1 then
                 begin
                    CancelaItemCupomFiscal(iECF, QItensPreVendaORDEM.AsInteger);
                    cTotalOLDPre:= cTotalOLDPre - ((QItensPreVendaQUANT.AsCurrency * QItensPreVendaVALOR.AsCurrency) - QItensPreVendaDESCONTO.AsCurrency);
                 end;

              {grava o produto na tabela itens_venda ja cancelado}
              GravaProdutoVenda(iCodVenda, QItensPreVendaCOD_PRO.AsInteger, QItensPreVendaORDEM.AsInteger, QconsPreVendaCOD_VEND.AsInteger, QItensPreVendaCANCELADO.AsInteger,  1,
                                QItensPreVendaQUANT.AsCurrency, QItensPreVendaVALOR.AsCurrency, QItensPreVendaDESCONTO.AsCurrency,
                                '$', false);

              next;
           end;
      end;
      QItensPreVenda.Close;
      dm.IBTRServer.Commit;
end;

function TFrmFechamento.RegistraProdutoConta(iCodConta: Integer): Integer;
var sIndice : string;
begin
   cTotalOldConta:= 0;

   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   with QItensConta do
      begin
         close;
         Parambyname('codconta').AsInteger:= iCodConta;
         open;
         while not eof do
           begin
              cTotalOldConta:= cTotalOldConta + ((QItensContaQUANT.AsCurrency * QItensContaVALOR.AsCurrency) );

              { busca o indice da aliquota na ecf }
              sIndice:= BuscaIndice(QItensContaICMS_CF_EST.AsInteger);

              {registra item ecf}
              RegistraItemECF(iECF, 14, iTamDescCupom, trim(QItensContaCODIGO_BARRA_PRO.AsString),
                              trim(QItensContaDESC_CUPOM.AsString), sIndice, trim(QItensContaDESCRICAO.AsString),
                              QItensContaQUANT.AsCurrency, QItensContaVALOR.AsCurrency, 0);

              {verifica se o item está cancelado na prevenda e cancela no cupom}
              if QItensContaCANCELADO.AsInteger = 1 then
                 begin
                    CancelaItemCupomFiscal(iECF, QItensContaORDEM.AsInteger);
                    cTotalOldConta:= cTotalOldConta - ((QItensContaQUANT.AsCurrency * QItensContaVALOR.AsCurrency) );
                 end;

              {grava o produto na tabela itens_venda ja cancelado}
              GravaProdutoVenda(iCodVenda, QItensContaCOD_PRO.AsInteger, QItensContaORDEM.AsInteger, QItensContaCOD_VEND.AsInteger, QItensContaCANCELADO.AsInteger,  1,
                                QItensContaQUANT.AsCurrency, QItensContaVALOR.AsCurrency, 0,
                                '$', false);

              next;
           end;
      end;
   QItensConta.Close;
   dm.IBTRServer.Commit;
end;
function TFrmFechamento.BuscaIndice(iCodigoGRP : integer) : string;
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QBuscaIndice do
          begin
             close;
             Parambyname('codcai').AsInteger:= iCaixa;
             parambyname('codemp').AsInteger:= iEmp;
             Parambyname('codgrp').AsInteger:= iCodigoGRP;
             Open;
             result:= trim(QBuscaIndiceINDICE_ECF.AsString);
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       result:= '';
       showmessage('erro ao buscar o indice');
     end;
   finally
     QBuscaIndice.Close;
   end;
end;

procedure TFrmFechamento.BuscaPadraoConta;
begin
   { busca codigo do cliente, vendedor e tipo de venda }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT CLIENTE_PADRAO_VENDA, VENDEDOR_PADRAO_VENDA, ' +
                        'TIPO_VENDA_PADRAO_VENDA   ' +
                        'FROM PARAMETROS           ' +
                        'WHERE COD_EMP = :CODEMP';
             Parambyname('codemp').AsInteger:= iEmp;
             Open;
             CLientePadrao    := fieldbyname('cliente_padrao_venda').AsInteger;
             TipoVendaPadrao  := fieldbyname('tipo_venda_padrao_venda').AsInteger;
             VendedorPadra   := fieldbyname('vendedor_padrao_venda').AsInteger;
             Close;
             Sql.Text := 'select * from vendedor where cod_vend=' + inttostr( iCodVend );
             Open;
             close;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao buscar os parametros');
     end;
   finally
     dm.QConsulta.Close;
   end;


end;

function TFrmFechamento.TotalizaCupom : integer;
begin
   result:= SubTotalizaCupom(iECF, 0);
end;

function TFrmFechamento.EfetuaPagamentos(const cValor : currency) : integer;
var iAuxCodForma : integer;
    sAuxIndiceFP : string;
    sAuxDescFP   : string;
begin
   iAuxCodForma  := dm.BuscaFormaPagamento('DN');
   sAuxIndiceFP  := dm.BuscaIndiceForma(iAuxCodForma);
   sAuxDescFP    := dm.BuscaDescricaoFormaNaECF(iAuxCodForma);
   result:= PagamentoCupomFiscal2(iECF, iAuxCOO, iAuxCCF, cValor, sAuxIndiceFP, sAuxDescFP);
end;

function TFrmFechamento.FechaCupom : integer;
var sAuxCliente, sAuxDoc, sAuxEnd : string;
begin
   sAuxCliente := trim(QconsPreVendaNOME_CLI.AsString);
   sAuxDoc     := trim(QconsPreVendaCNPJ_CLI.AsString);
   sAuxEnd     := trim(QconsPreVendaCIDRES_CLI.AsString + '-' + QconsPreVendaESTRES_CLI.AsString);

   result:= FechaCupomFiscal(iECF, sAuxCliente, sAuxDoc, sAuxEnd, QconsPreVendaSEQUENCIA_PAF.AsInteger, 0, 0, 0, 0, 0, 0);
end;

function TFrmFechamento.FechaCupomConta: Integer;
var
   icooF, icerf: Integer;
begin
   icooF := StrToInt( ifthen( QConsContaCOO.IsNull, '0', QConsContaCOO.AsString ) );
   icerf := StrToInt( ifthen( QConsContaCER.IsNull, '0', QConsContaCER.AsString ) );
   result:= FechaCupomFiscal(iECF, '', '', '', 0, 0, 0,
   QConsContaCOD_CAI.AsInteger,  icooF, icerf, QConsContaCONTA.AsInteger);
end;

procedure TFrmFechamento.CancelaContas(dData: TDateTime);
var
  icooantes: Integer;
begin
   if IBTRPreVenda.Active then
      IBTRPreVenda.Commit;
   IBTRPreVenda.StartTransaction;
   with QConsConta do
      begin
         close;
         Parambyname('codemp').AsInteger := iEmp;
         Parambyname('data').AsDate      := dData;
         open;
         while not eof do
            begin
               { efetuando o cancelamento da Pre-Venda }
               { abrindo o cupom Fiscal }
                icooantes := 0;
               if AbreVendaContaCliente = 0 then
                  begin
//                     RegistraProduto(QconsPreVendaCOD_PRE.AsInteger);
                     RegistraProdutoConta( QConsContaCODIGO.AsInteger );
                     if not (TotalizaCupom = 0) then
                        exit;

                     if not (EfetuaPagamentos( cTotalOldConta ) = 0) then
                        exit;

                     if not (FechaCupomConta = 0) then
                        exit;

                     {atualiza os totais da venda}

                     GravaFechamentoVenda(iCodVenda, 0, cTotalOldConta, '','');
                     AtualizaContaCliente( 1, QConsContaCODIGO.AsInteger );
                     { cancela o cupom fiscal }
  //                   icooantes := StrToInt( DM.ECF.NumCOO );
    //                 CancelaCupomFiscal(iECF);
      //               dm.CancelaVenda( icooantes );
                     { grava o GT }
                     GravaGT(iECF);

                     {cancela a pre-venda}
//                     CancelaPreVenda;

                  end;
               next;
            end;
      end;
   QConsConta.Close;
   IBTRPreVenda.Commit;

end;

procedure TFrmFechamento.CancelaPreVenda;
begin
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   try
     try
       with dm.QConsultaServer do
          begin
             close;
             sql.Clear;
             sql.Text:= 'UPDATE PRE_VENDA ' +
                        'SET STATUS_PRE = 2 ' +
                        'WHERE COD_PRE = :CODPRE';
             Parambyname('codpre').AsInteger:= QconsPreVendaCOD_PRE.AsInteger;;
             ExecOrOpen;
          end;
       dm.IBTRServer.Commit;
     except
       dm.IBTRServer.Rollback;
       showmessage('Erro ao cancelar a pre-venda');
     end;
   finally
     dm.QConsultaServer.Close;
   end;
end;

procedure TFrmFechamento.GerencialDavOS(const vdata : TDateTime);
var bAux : boolean;
begin
   bAux:= false;
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   try
     try
       with dm.QConsultaServer do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT CODIGO, SEQUENCIA_DAV, TOTAL ' +
                        'FROM ORDEM_SERVICO ' +
                        'WHERE DATA_ABERTURA = :DT ' +
                        'ORDER BY CODIGO';
             Parambyname('dt').AsDate:= vdata;
             open;
             if not fieldbyname('codigo').IsNull then
                begin
                   {Imprime o Cabeçalho}
                   bAux:= true;
                   AbreRelatoroGerencial(iECF, dm.IndiceRelGerencial( 'OS' ));
                   ImprimeRelatorioGerencial(iECF, '               DAV-OS EMITIDOS');
                   ImprimeRelatorioGerencial(iECF, 'Emissao: ' + datetostr(vdata));
                end;
             First;
             while not eof do
                begin
                   bAux:= true;
                   ImprimeRelatorioGerencial(iECF, FormataStringD(fieldbyname('sequencia_dav').AsString, '10', '0') +
                                             FormataStringD(currtostrf(fieldbyname('total').AsCurrency, ffnumber, 2), '15', ' '));
                   next;
                end;
             if bAux then
                FechaRelatorioGerencial(iECF);
          end;
       dm.IBTRServer.Commit;
     except
       dm.IBTRServer.Rollback;
       showmessage('Erro ao buscar os DAV-OS Emitidos');
     end;
   finally
     dm.QConsultaServer.Close;
   end;
end;

procedure TFrmFechamento.GerencialMesasAbertas;
var
    RelMesasAbertas: TStrings;
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
         last;
         if recordcount > 0 then
            begin
               RelMesasAbertas := TStringList.Create;
               RelMesasAbertas.Clear;
               { Imprime o Cabeçalho }
        //       RelMesasAbertas.Add()
//               AbreRelatoroGerencial(iECF, DM.IndiceRelGerencial( 'OS' ));
               RelMesasAbertas.Add( '<n><ce>Mesas Abertas</ce></n>' );
              RelMesasAbertas.Add( ' ');

               first;
               while not eof do
                  begin
                     RelMesasAbertas.Add( FormataStringD(fieldbyname('conta').AsString, '3', '0') + '   ' +
                                               fieldbyname('data_abertura').AsString + '   ' +
                                               fieldbyname('hora_abertura').AsString);
                     next;
                  end;
               dm.ECF.RelatorioGerencial( RelMesasAbertas, 1, 0 );
               { Fecha o Relatório Gerencial }
  //             FechaRelatorioGerencial(iECF);
               RelMesasAbertas.Free;
            end;
      end;
   dm.IBTRServer.Commit;
   dm.QConsultaServer.Close;
end;


procedure TFrmFechamento.AtualizaContaCliente(const iAux, iCodigoConta : integer);
begin
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   try
     try
       with dm.QConsultaServer do
          begin
             close;
             sql.Clear;
             sql.Text:= 'UPDATE CONTA_CLIENTE  ' +
                        'SET DATA_FECHAMENTO = :DATA, HORA_FECHAMENTO = :HORA, COO_VENDA = :COOVENDA, STATUS = :STATUS ' +
                        'WHERE CODIGO = :CODIGO';
             Parambyname('data').AsDate         := date;
             Parambyname('hora').AsTime         := time;
             Parambyname('codigo').AsInteger    := iCodigoConta;
             Parambyname('coovenda').AsInteger  := iAuxCOO;
             Parambyname('status').AsInteger    := iAux;
             ExecOrOpen;
          end;
       dm.IBTRServer.Commit;
     except
       dm.IBTRServer.Rollback;
       exit;
     end;
   finally
     dm.QConsultaServer.Close;
   end;
end;
end.
