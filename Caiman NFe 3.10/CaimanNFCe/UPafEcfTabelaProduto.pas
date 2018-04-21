unit UPafEcfTabelaProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, DB, ACBrPAF_P, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmPafEcfTabelaProduto = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    BtnGeraArquivo: TButton;
    Label1: TLabel;
    Label2: TLabel;
    PB: TProgressBar;
    Label3: TLabel;
    Label4: TLabel;
    IBAux: TFDQuery;
    TRAux: TFDTransaction;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnGeraArquivoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    // FUNCOES VALIDACAO
    function Verifica_IncExc_P1: Boolean;
    function Verifica_prod_alterado( COD_PRO: Integer ): Boolean;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPafEcfTabelaProduto: TFrmPafEcfTabelaProduto;

implementation
uses
  Udm;

{$R *.dfm}

procedure TFrmPafEcfTabelaProduto.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_escape then
      close;
end;

procedure TFrmPafEcfTabelaProduto.BtnGeraArquivoClick(Sender: TObject);
var sRazao, sCNPJ, sIE, sIM : string;
    ArqNormal  : TextFile;
    ArqPrazo   : TextFile;
    sAux       : string;
    sSitTrib   : string;
    iContP2    : integer;
    iTotalProd : integer;
    sEADNormal : string;
    sEADPrazo  : string;
    P2: TRegistroP2;
begin
   iContP2    := 0;
   iTotalProd := 0;
   pb.Max     := 0;

   { verifica se o diretorio 'c:\paf'_ecf existe }
   if not DirectoryExists('c:\Paf_Ecf') then
      CreateDir('c:\Paf_Ecf');

   { Inicializa o arquivo }
   dm.PAF.PAF_P.LimpaRegistros;
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

   dm.PAF.PAF_P.RegistroP1.CNPJ := sCNPJ;
   dm.PAF.PAF_P.RegistroP1.IE := sIE;
   dm.PAF.PAF_P.RegistroP1.IM := sIM;
   dm.PAF.PAF_P.RegistroP1.RAZAOSOCIAL := sRazao;
   dm.PAF.PAF_P.RegistroP1.InclusaoExclusao := Verifica_IncExc_P1;


   { Relação das Mercadorias }
   {busca a quantidade de produtos}
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT COUNT(COD_PRO) TOTAL FROM PRODUTO';
             open;
             iTotalProd:= fieldbyname('total').AsInteger;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao buscar o total dos produtos');
     end;
   finally
     dm.QConsulta.Close;
   end;

   pb.Max:= iTotalProd;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT P.COD_PRO, P.NOME_PRO, ' +
                        'P.TIPO_PRODUCAO, P.VALOR_PRO, P.PRECO_PRAZO_PRO,   ' +
                        'P.CODIGO_BARRA_PRO, G.TIPO_GRP, G.ALIQUOTA_GRP,    ' +
                        'U.DESCRICAO, G.ICMS_SERVICO_GRP                                        ' +
                        'FROM PRODUTO P '                                     +
                        'INNER JOIN UNIDADE_MEDIDA U ' +
                        'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)             ' +
                        'INNER JOIN GRUPO_ICMS G '                            +
                        'ON (P.ICMS_CF_EST = G.COD_GRP) '                     +
                        'ORDER BY P.COD_PRO';
             Open;
             First;
             dm.PAF.PAF_P.RegistroP2.Clear;
             while not eof do
                begin
                   if trim(fieldbyname('ICMS_SERVICO_GRP').AsString) = 'S' then
                       sSitTrib:= 'S'
                   else
                   if trim(fieldbyname('tipo_grp').AsString) = 'TRI' then
                      sSitTrib:= 'T'
                   else
                      if trim(fieldbyname('tipo_grp').AsString) = 'ISE' then
                         sSitTrib:= 'I'
                      else
                         if trim(fieldbyname('tipo_grp').AsString) = 'ST' then
                            sSitTrib:= 'F'
                         else
                            if trim(fieldbyname('tipo_grp').AsString) = 'NT' then
                                sSitTrib:= 'N';




                          P2:=dm.PAF.PAF_P.RegistroP2.New;
                          P2.COD_MERC_SERV := fieldbyname('codigo_barra_pro').AsString;
                          P2.DESC_MERC_SERV:= fieldbyname('nome_pro').AsString;
                          P2.UN_MED        := fieldbyname('descricao').AsString;
                          P2.IAT           :='T';
                          P2.IPPT          := fieldbyname('tipo_producao').AsString;
                          P2.ST            := sSitTrib;
                          P2.ALIQ          := fieldbyname('aliquota_grp').AsCurrency;
                          P2.VL_UNIT       := fieldbyname('valor_pro').AsCurrency;
                          P2.RegistroValido := Verifica_prod_alterado( fieldbyname('COD_PRO').AsInteger );


                   Inc(iContP2);
                   pb.Position:= iContP2;
                   next;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao buscar dados dos produtos');
     end;
   finally
     dm.QConsulta.Close;
   end;

   dm.PAF.PAF_P.NomeArquivo := 'TABELA_PRODUTOS_NORMAL.TXT';
   dm.PAF.PAF_P.SaveToFile;

   dm.PAF.PAF_P.LimpaRegistros;

   dm.PAF.PAF_P.RegistroP1.CNPJ := sCNPJ;
   dm.PAF.PAF_P.RegistroP1.IE := sIE;
   dm.PAF.PAF_P.RegistroP1.IM := sIM;
   dm.PAF.PAF_P.RegistroP1.RAZAOSOCIAL := sRazao;
   dm.PAF.PAF_P.RegistroP1.InclusaoExclusao := Verifica_IncExc_P1;


   { Relação das Mercadorias }
   {busca a quantidade de produtos}
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT COUNT(COD_PRO) TOTAL FROM PRODUTO';
             open;
             iTotalProd:= fieldbyname('total').AsInteger;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao buscar o total dos produtos');
     end;
   finally
     dm.QConsulta.Close;
   end;

   pb.Max:= iTotalProd;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT P.COD_PRO, P.NOME_PRO, ' +
                        'P.TIPO_PRODUCAO, P.VALOR_PRO, P.PRECO_PRAZO_PRO,   ' +
                        'P.CODIGO_BARRA_PRO, G.TIPO_GRP, G.ALIQUOTA_GRP,    ' +
                        'U.DESCRICAO, G.ICMS_SERVICO_GRP                    ' +
                        'FROM PRODUTO P '                                     +
                        'INNER JOIN UNIDADE_MEDIDA U ' +
                        'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)             ' +
                        'INNER JOIN GRUPO_ICMS G '                            +
                        'ON (P.ICMS_CF_EST = G.COD_GRP) '                     +
                        'ORDER BY P.COD_PRO';
             Open;
             First;
             dm.PAF.PAF_P.RegistroP2.Clear;
             while not eof do
                begin
                   if trim(fieldbyname('ICMS_SERVICO_GRP').AsString) = 'S' then
                       sSitTrib:= 'S'
                   else
                   if trim(fieldbyname('tipo_grp').AsString) = 'TRI' then
                      sSitTrib:= 'T'
                   else
                      if trim(fieldbyname('tipo_grp').AsString) = 'ISE' then
                         sSitTrib:= 'I'
                      else
                         if trim(fieldbyname('tipo_grp').AsString) = 'ST' then
                            sSitTrib:= 'F'
                         else
                            if trim(fieldbyname('tipo_grp').AsString) = 'NT' then
                                sSitTrib:= 'N';



                   //gravando na tabela a prazo
                   if fieldbyname('preco_prazo_pro').AsCurrency > 0 then
                      begin

                          P2:=dm.PAF.PAF_P.RegistroP2.New;
                          P2.COD_MERC_SERV := fieldbyname('codigo_barra_pro').AsString;
                          P2.DESC_MERC_SERV:= fieldbyname('nome_pro').AsString;
                          P2.UN_MED        := fieldbyname('descricao').AsString;
                          P2.IAT           :='T';
                          P2.IPPT          := fieldbyname('tipo_producao').AsString;
                          P2.ST            := sSitTrib;
                          P2.ALIQ          := fieldbyname('aliquota_grp').AsCurrency;
                          P2.VL_UNIT       := fieldbyname('preco_prazo_pro').AsCurrency;
                          P2.RegistroValido := Verifica_prod_alterado( fieldbyname('COD_PRO').AsInteger );
                       end;



                   Inc(iContP2);
                   pb.Position:= iContP2;
                   next;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao buscar dados dos produtos');
     end;
   finally
     dm.QConsulta.Close;
   end;

   dm.PAF.PAF_P.NomeArquivo := 'TABELA_PRODUTOS_PRAZO.TXT';
   dm.PAF.PAF_P.SaveToFile;


   { EAD - Assinatura Digital }
//   dm.AssinaturaDigital('C:\PAF_ECF\TABELA_PRODUTOS_NORMAL.TXT');
  // dm.AssinaturaDigital('C:\PAF_ECF\TABELA_PRODUTOS_PRAZO.TXT');

   showmessage('Arquivo Gerado');
end;

procedure TFrmPafEcfTabelaProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.QConsulta.Close;
   Action:= caFree;
   Self := nil;
end;


procedure TFrmPafEcfTabelaProduto.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

function TFrmPafEcfTabelaProduto.Verifica_IncExc_P1: Boolean;
begin
  //
  //
  if TRAux.Active then
     TRAux.Commit;
  TRAux.StartTransaction;

  IBAUX.Close;
  IBAUX.SQL.Text := 'SELECT ALTERADO FROM SP_VERIFICA_INCEXC_P1';
  IBAUX.Open;
  if ( IBAUX.FieldByName( 'ALTERADO' ).AsString = 'N' ) then
     result := false
  else
     result := true;
  IBAUX.Close;
  TRAux.Commit;
end;

function TFrmPafEcfTabelaProduto.Verifica_prod_alterado( COD_PRO: Integer ): Boolean;
begin
//
  //
  if TRAux.Active then
     TRAux.Commit;
  TRAux.StartTransaction;

  IBAUX.Close;
  IBAUX.SQL.Text := 'SELECT ALTERADO FROM SP_VERIFICA_PRO( :CODPRO )';
  IBAUX.ParamByName( 'CODPRO' ).AsInteger := COD_PRO;
  IBAUX.Open;
  if ( IBAUX.FieldByName( 'ALTERADO' ).AsString = 'N' ) then
     result := True
  else
     result := false;
  IBAUX.Close;
  TRAux.Commit;
end;

end.
