unit UDavEmitidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, DB, ACBrPAFClass, ACBrPAF_D, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmDavEmitidos = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    EdtDataIni: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    EdtDataFin: TDateTimePicker;
    BtnOK: TButton;
    BtnSair: TButton;
    GroupBox1: TGroupBox;
    RDG: TRadioGroup;
    QOrcamento: TFDQuery;
    QOrcamentoCOO: TIntegerField;
    QOrcamentoCOO_VENDA: TIntegerField;
    QOrcamentoSEQUENCIA_DAV: TLargeintField;
    QOrcamentoDATA: TDateField;
    QOrcamentoTOTAL: TBCDField;
    QOrcamentoR01_NUMERO_SERIE: TStringField;
    QOrcamentoR01_MF_ADICIONAL: TStringField;
    QOrcamentoR01_TIPO_ECF: TStringField;
    QOrcamentoR01_MARCA_ECF: TStringField;
    QOrcamentoR01_MODELO_ECF: TStringField;
    QOS: TFDQuery;
    QOSCOO: TIntegerField;
    QOSCOO_VENDA: TIntegerField;
    QOSSEQUENCIA_DAV: TLargeintField;
    QOSDATA_ABERTURA: TDateField;
    QOSTOTAL: TBCDField;
    QOSR01_NUMERO_SERIE: TStringField;
    QOSR01_MF_ADICIONAL: TStringField;
    QOSR01_TIPO_ECF: TStringField;
    QOSR01_MARCA_ECF: TStringField;
    QOSR01_MODELO_ECF: TStringField;
    QOrcamentoCCF_VENDA: TIntegerField;
    QOSCCF_VENDA: TIntegerField;
    TRDavEmitidos: TFDTransaction;
    ConsultaDAV: TFDQuery;
    IBAux: TFDQuery;
    QOrcamentoNOME_CLI: TStringField;
    QOrcamentoCNPJ_CLI: TStringField;
    QOrcamentoCODIGO: TIntegerField;
    QBuscaItensDAV: TFDQuery;
    QBuscaItensDAVCODIGO: TIntegerField;
    QBuscaItensDAVORDEM: TIntegerField;
    QBuscaItensDAVCOD_PRO: TIntegerField;
    QBuscaItensDAVDESCONTO: TBCDField;
    QBuscaItensDAVCOD_EMP: TIntegerField;
    QBuscaItensDAVQUANT: TBCDField;
    QBuscaItensDAVVALOR: TBCDField;
    QBuscaItensDAVPRODUTO_PROMOCAO: TStringField;
    QBuscaItensDAVCANCELADO: TIntegerField;
    QBuscaItensDAVCHAVE: TStringField;
    QBuscaItensDAVNOME_PRO: TStringField;
    QBuscaItensDAVDESCRICAO: TStringField;
    QBuscaItensDAVTIPO_GRP: TStringField;
    QBuscaItensDAVALIQUOTA_GRP: TBCDField;
    QBuscaItensDAVDATA_INCLUSAO: TDateField;
    QBuscaItensDAVCODIGO_BARRA_PRO: TStringField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure RelatorioGerencial;
    procedure GravaArquivoTXT;

    // FUNCOES DE ALTERAÇÔES
    function VerificaIncExc_D1( D1, D2: Tdate ): Boolean;
    function Verifica_Alteracao_D2( COD_ORC: Integer ): Boolean;
    function Verifica_alteracao_D3( CODIGO, ORDEM: Integer ): Boolean;
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDavEmitidos: TFrmDavEmitidos;

implementation
uses
  Udm, Ubibli1;

{$R *.dfm}

procedure TFrmDavEmitidos.BtnSairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmDavEmitidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:= caFree;
   Self := nil;
end;

procedure TFrmDavEmitidos.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmDavEmitidos.FormShow(Sender: TObject);
begin

   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;
   RDG.ItemIndex:= 0;
   EdtDataIni.SetFocus;
end;

procedure TFrmDavEmitidos.BtnOKClick(Sender: TObject);
begin
   if RDG.ItemIndex = 0 then
      begin
         if iECF = 99 then
            Exit;
         RelatorioGerencial
      end
   else
      GravaArquivoTXT;
end;

procedure TFrmDavEmitidos.RelatorioGerencial;
var sAux : string;
    sAuxCCF : string;
    DAVs: TACBrECFDAVs;
    I: Integer;
begin

     DAVs := TACBrECFDAVs.Create;
   { busca os orçamentos }
   if TRDavEmitidos.Active then
      TRDavEmitidos.Commit;
   TRDavEmitidos.StartTransaction;
   try
     try
       with ConsultaDAV do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT SEQUENCIA_DAV, DATA, TOTAL, CCF_VENDA, COO, COO_VENDA ' +
                        'FROM ORCAMENTO ' +
                        'WHERE DATA BETWEEN :DATAINI AND :DATAFIN ' +
                        'ORDER BY CODIGO';
             Parambyname('dataini').AsDate:= EdtDataIni.Date;
             Parambyname('datafin').AsDate:= EdtDataFin.Date;
             open;

             I := 1;
             while not eof do
                begin
                      with DAVs.New do
                        begin
                           Numero    := Format('%10.10d', [I]);
                           COO_Dav   := FieldByName( 'COO' ).AsInteger;
                           COO_Cupom := FieldByName( 'COO_VENDA' ).AsInteger;
                           Titulo    := 'ORCAMENTO';
                           DtEmissao := FieldByName( 'DATA' ).AsDateTime;
                           Valor     := FieldByName( 'TOTAL' ).AsCurrency;
                        end;
                   I := I + 1;
                   next;
                end;
             dm.ECF.PafMF_RelDAVEmitidos( DAVs, 'REFERENCIA: '+ FormatDateTime( 'dd/mm/yyyy', EdtDataIni.DateTime ) +' A ' + FormatDateTime( 'dd/mm/yyyy', EdtDatafin.DateTime ));

          end;
          TRDavEmitidos.Commit;
     except
       TRDavEmitidos.Rollback;
       showmessage('Erro ao buscar os Orçamentos');
     end;
   finally
     ConsultaDAV.Close;
   end;


end;

procedure TFrmDavEmitidos.GravaArquivoTXT;
var sCNPJ   : string;
    sIE     : string;
    sIM     : string;
    sRazao  : string;
    sAux    : string;
    sData   : string;
    Arquivo : textfile;
    D2: TRegistroD2;
    sSitTrib: string;
begin
   dm.PAF.PAF_D.LimpaRegistros;
   { verifica se o diretorio 'c:\paf'_ecf existe }
   if not DirectoryExists('c:\Paf_Ecf') then
      CreateDir('c:\Paf_Ecf');

   { Inicializa o arquivo }
   if FileExists( 'C:\PAF_ECF\DAV_EMITIDOS.TXT' ) then
      DeleteFile( 'C:\PAF_ECF\DAV_EMITIDOS.TXT' );


   { REGISTRO D1 }
   { busca os dados da empresa }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT RAZAO_EMP, CNPJ_EMP, INSC_EMP, ' +
                        'INSCRICAO_MUNICIPAL ' +
                        'FROM EMPRESA        ' +
                        'WHERE COD_EMP = :CODEMP';
             Parambyname('codemp').AsInteger:= iEmp;
             Open;
             sRazao := fieldbyname('razao_emp').AsString;
             sCNPJ  := fieldbyname('cnpj_emp').AsString;
             sIE    := fieldbyname('insc_emp').AsString;
             sIM    := fieldbyname('inscricao_municipal').AsString;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao buscar os dados da Empresa');
     end;
   finally
     dm.QConsulta.Close;
   end;

   { registro D1 - Identificacao do Estabelecimento }
   dm.PAF.PAF_D.RegistroD1.CNPJ := sCNPJ;
   dm.PAF.PAF_D.RegistroD1.IE := sIE;
   dm.PAF.PAF_D.RegistroD1.IM := sIM;
   dm.PAF.PAF_D.RegistroD1.RAZAOSOCIAL := sRazao;
   dm.PAF.PAF_D.RegistroD1.InclusaoExclusao := VerificaIncExc_D1( EdtDataIni.Date, EdtDataFin.Date );

   dm.PAF.PAF_D.RegistroD2.Clear;

   { registro D2 - RELACAO DOS DAV EMITIDOS - ORÇAMENTO }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QOrcamento do
      begin
         close;
         parambyname('dataini').AsDate:= EdtDataIni.Date;
         parambyname('datafin').AsDate:= EdtDataFin.Date;
         open;
         while not eof do
            begin
               D2:= DM.PAF.PAF_D.RegistroD2.New;

               D2.COO          := QOrcamentoCOO.AsString;
               D2.NUM_DAV      := FormataStringD(QOrcamentoSEQUENCIA_DAV.AsString, '13', '0');
               D2.DT_DAV       := QOrcamentoDATA.AsDateTime;
               D2.TIT_DAV      := 'Orcamento';
               D2.VLT_DAV      := QOrcamentoTOTAL.AsCurrency;
               D2.COO_DFV      := QOrcamentoCOO_VENDA.AsString;

               if not ( ( D2.COO = '' ) and ( D2.COO_DFV = '' )) then
                  begin
                     D2.NUM_FAB      := QOrcamentoR01_NUMERO_SERIE.AsString;
                     D2.MF_ADICIONAL := trim(QOrcamentoR01_MF_ADICIONAL.AsString);
                     D2.TIPO_ECF     := QOrcamentoR01_TIPO_ECF.AsString;
                     D2.MARCA_ECF    := QOrcamentoR01_MARCA_ECF.AsString;
                     D2.MODELO_ECF   := QOrcamentoR01_MODELO_ECF.AsString;
                     D2.NUMERO_ECF   := IntToStr( iCaixa );
                  end;


               D2.NOME_CLIENTE := QOrcamentoNOME_CLI.AsString;//;
               D2.CPF_CNPJ     := RetiraCaracter( QOrcamentoCNPJ_CLI.AsString );
               D2.RegistroValido := Verifica_Alteracao_D2( QOrcamentoCODIGO.AsInteger );

               QBuscaItensDAV.Close;
               QBuscaItensDAV.ParamByName( 'CODIGO' ).AsInteger := QOrcamentoCODIGO.AsInteger;
               QBuscaItensDAV.Open;
               QBuscaItensDAV.First;
               while not QBuscaItensDAV.Eof do
                  begin
                     with D2.RegistroD3.New do
                         begin
                            if trim(QBuscaItensDAVTIPO_GRP.AsString) = 'TRI' then
                              sSitTrib:= 'T'
                             else
                                if trim(QBuscaItensDAVTIPO_GRP.AsString) = 'ISE' then
                                   sSitTrib:= 'I'
                                 else
                                    if trim(QBuscaItensDAVTIPO_GRP.AsString) = 'ST' then
                                        sSitTrib:= 'F'
                                     else
                                        if trim(QBuscaItensDAVTIPO_GRP.AsString) = 'NT' then
                                            sSitTrib:= 'N'
                                        else
                                           if trim(QBuscaItensDAVTIPO_GRP.AsString) = 'SER' then
                                              sSitTrib:= 'S';
                             DT_INCLUSAO   := QBuscaItensDAVDATA_INCLUSAO.AsDateTime;
                             NUM_ITEM      := QBuscaItensDAVORDEM.AsInteger;
                             COD_ITEM      := QBuscaItensDAVCODIGO_BARRA_PRO.AsString;
                             DESC_ITEM     := QBuscaItensDAVNOME_PRO.AsString;
                             QTDE_ITEM     := QBuscaItensDAVQUANT.AsFloat;
                             UNI_ITEM      := QBuscaItensDAVDESCRICAO.AsString;
                             VL_UNIT       := QBuscaItensDAVVALOR.AsCurrency / QBuscaItensDAVQUANT.AsCurrency;
                             VL_DESCTO     := QBuscaItensDAVDESCONTO.AsCurrency;
                             VL_ACRES      := 0.00;
                             VL_TOTAL      := QBuscaItensDAVVALOR.AsCurrency;
                             SIT_TRIB      := sSitTrib; // T, S, I, N, F
                             ALIQ          := QBuscaItensDAVALIQUOTA_GRP.AsCurrency; // SOMENTE QUANDO T E S
                             if QBuscaItensDAVCANCELADO.AsInteger = 1 then
                                IND_CANC      := 'S'
                             else
                                IND_CANC      := 'N';
                             DEC_QTDE_ITEM := 3;
                             DEC_VL_UNIT   := 2;


                             RegistroValido := Verifica_alteracao_D3( QBuscaItensDAVCODIGO.AsInteger, QBuscaItensDAVORDEM.AsInteger );

                         end;
                     QBuscaItensDAV.Next;
                   end;
                   QBuscaItensDAV.Close;
               next;
            end;
      end;
   dm.IBTransaction.Commit;
   QOrcamento.Close;


   { Registro D9 - Totalização do Arquivo }
   dm.PAF.PAF_D.NomeArquivo := 'DAV_EMITIDOS.TXT';
   DM.PAF.PAF_D.SaveToFile;

   { EAD - Assinatura Digital }
//   dm.AssinaturaDigital('C:\PAF_ECF\DAV_EMITIDOS.TXT');

   Application.MessageBox('Arquivo ' + 'C:\PAF_ECF\DAV_EMITIDOS.TXT' + ' gerado com sucesso!', 'Atenção', MB_ICONINFORMATION + MB_OK );
end;

function TFrmDavEmitidos.VerificaIncExc_D1( D1, D2: Tdate ): Boolean;
begin
  //
  if TRDavEmitidos.Active then
     TRDavEmitidos.Commit;
  TRDavEmitidos.StartTransaction;

  IBAux.Close;
  IBAux.SQL.Text := 'select ALTERADO from SP_VERIFICA_INCEXC_D1( :D1, :D2 )';
  IBAux.ParamByName( 'D1').AsDate := D1;
  IBAux.ParamByName( 'D2' ).AsDate := D2;
  IBAux.Open;
  if IBAux.FieldByName( 'ALTERADO' ).AsString = 'N' then
     result := false
  else
     Result := true;

  TRDavEmitidos.Commit;
end;

function TFrmDavEmitidos.Verifica_Alteracao_D2( COD_ORC: Integer ): Boolean;
begin
  //
  if TRDavEmitidos.Active then
     TRDavEmitidos.Commit;
  TRDavEmitidos.StartTransaction;

  IBAux.Close;
  IBAux.SQL.Text := 'select ALTERADO from SP_VERIFICA_ALTERACAO_D2( :COD_CAI, :COD_EMP, :COD_ORC )';
  IBAux.ParamByName( 'COD_CAI' ).AsInteger := iCaixa;
  IBAux.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
  IBAux.ParamByName( 'COD_ORC' ).AsInteger := COD_ORC;
  IBAux.Open;
  if IBAux.FieldByName( 'ALTERADO' ).AsString = 'N' then
     result := True
  else
     Result := false;

  TRDavEmitidos.Commit;
end;

function TFrmDavEmitidos.Verifica_alteracao_D3( CODIGO, ORDEM: Integer ): Boolean;
begin
  //SP_VERIFICA_ALTERACAO_D3
  IBAux.Close;
  IBAux.SQL.Text := 'select ALTERADO from SP_VERIFICA_ALTERACAO_D3( :CODIGO, :ORDEM )';
  IBAux.ParamByName( 'CODIGO' ).AsInteger := CODIGO;
  IBAux.ParamByName( 'ORDEM' ).AsInteger := ORDEM;
  IBAux.Open;
  if IBAux.FieldByName( 'ALTERADO' ).AsString = 'N' then
     result := True
  else
     Result := false;


end;

end.
