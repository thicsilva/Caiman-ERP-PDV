unit UConsPreVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmConsPreVenda = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    GB1: TGroupBox;
    ComboCons: TComboBox;
    GB2: TGroupBox;
    EdtCons: TEdit;
    DSQConsPre: TDataSource;
    DBGrid1: TDBGrid;
    QConsPre: TFDQuery;
    BtnOk: TButton;
    BtnSair: TButton;
    QConsPreCOD_PRE: TIntegerField;
    QConsPreDATA_PRE: TDateField;
    QConsPreCOD_CLI: TIntegerField;
    QConsPreCOD_TPV: TIntegerField;
    QConsPreCOD_EMP: TIntegerField;
    QConsPreSTATUS_PRE: TIntegerField;
    QConsPreTOTAL_PRE: TBCDField;
    QConsPreHORA_PRE: TTimeField;
    QConsPreCOD_VENDA: TIntegerField;
    QConsPreDOCUMENTO: TStringField;
    QConsPreOBS_PRE: TStringField;
    QConsPreDESCONTO_PRE: TBCDField;
    QConsPreCOD_VEND: TIntegerField;
    QConsPreSEQUENCIA_PAF: TLargeintField;
    QConsPreSENHA_FECHAR_VENDA: TStringField;
    QConsPreNOME_CLI: TStringField;
    QConsPreNOME_TPV: TStringField;
    QConsPreNOME_VEND: TStringField;
    IBTRConsPre: TFDTransaction;
    QConsPreCALC_STATUS: TStringField;
    BtnCancelar: TButton;
    QItensPreVenda: TFDQuery;
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
    QBuscaIndice: TFDQuery;
    QBuscaIndiceINDICE_ECF: TStringField;
    QItensPreVendaCODIGO_BARRA_PRO: TStringField;
    QConsPreCIDRES_CLI: TStringField;
    QConsPreCNPJ_CLI: TStringField;
    QConsPreESTRES_CLI: TStringField;
    EdtDataIni: TDateTimePicker;
    Label1: TLabel;
    EdtDataFin: TDateTimePicker;
    QItensPreVendaDESCRICAO: TStringField;
    procedure ComboConsChange(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtConsKeyPress(Sender: TObject; var Key: Char);
    procedure QConsPreCalcFields(DataSet: TDataSet);
    procedure BtnCancelarClick(Sender: TObject);
    function  AbreVenda : integer;
    function  RegistraProduto : integer;
    function  BuscaIndice(iCodigoGRP : integer) : string;
    function  TotalizaCupom : integer;
    function  EfetuaPagamentos : integer;
    function  FechaCupom : integer;
    procedure CancelaPreVenda;
    procedure QConsPreAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsPreVenda: TFrmConsPreVenda;

implementation
uses
  Udm, UECF, UMenuFiscal;
var  sSql       : string;
     iAuxCOO    : integer;
     iAuxCCF    : integer;
     iCodVenda  : integer;

{$R *.dfm}

procedure TFrmConsPreVenda.ComboConsChange(Sender: TObject);
begin
   EdtCons.Clear;
   case ComboCons.ItemIndex of
     0:begin
          gb2.Enabled        := true;
          GB2.Caption        := 'Código da Pré-Venda';
          EdtDataIni.Visible := false;
          EdtDataFin.Visible := false;
          Label1.Visible     := false;
          EdtCons.Visible    := true;
          edtcons.SetFocus;
       end;
     1:begin
          gb2.Enabled        := true;
          GB2.Caption        := 'Data';
          EdtDataIni.Visible := true;
          EdtDataFin.Visible := true;
          Label1.Visible     := true;
          EdtCons.Visible    := false;
          EdtDataIni.SetFocus;
       end;
     2:begin
          gb2.Caption:= '';
          EdtDataIni.Visible := false;
          EdtDataFin.Visible := false;
          Label1.Visible     := false;
          EdtCons.Visible    := true;
          gb2.Enabled        := false;
       end;
   end;
end;

procedure TFrmConsPreVenda.BtnSairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmConsPreVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if IBTRConsPre.Active then
      IBTRConsPre.Commit;

   QConsPre.SQL.Clear;
   QConsPre.SQL.Text:= sSql;
   QConsPre.Close;

   { grava posicao combo }
   dm.GravaIni(GetCurrentDir + '\cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsPreVenda.ComboCons', inttostr(ComboCons.itemIndex));

   Action:= caFree;
   Self := nil;
end;

procedure TFrmConsPreVenda.FormCreate(Sender: TObject);
begin
   dm.ScaleForm( Self, False );
end;

procedure TFrmConsPreVenda.BtnOkClick(Sender: TObject);
begin
   if IBTRConsPre.Active then
      IBTRConsPre.Commit;
   IBTRConsPre.StartTransaction;
   with QConsPre do
      begin
         close;
         sql.Clear;
         sql.Text:= sSql;
         case ComboCons.ItemIndex of
           0:begin
                if edtcons.Text = '' then
                   begin
                      edtcons.SetFocus;
                      exit;
                   end;
                sql.Add(' WHERE P.SEQUENCIA_PAF = :SEQ AND P.COD_EMP = :CODEMP');
                Parambyname('seq').AsInteger    := strtoint(edtcons.Text);
                Parambyname('codemp').AsInteger := iEmp;
                open;
             end;
           1:begin
                sql.Add(' WHERE P.DATA_PRE BETWEEN :DATAINI AND :DATAFIN AND ' +
                        ' P.COD_EMP = :CODEMP ORDER BY P.COD_PRE');
                Parambyname('dataini').Asdate   := EdtDataIni.Date;
                Parambyname('datafin').Asdate   := EdtDataFin.Date;
                Parambyname('codemp').AsInteger := iEmp;
                open;
             end;
           2:begin
                sql.Add(' WHERE P.STATUS_PRE = 0 AND P.COD_EMP = :CODEMP ORDER BY P.COD_PRE');
                Parambyname('codemp').AsInteger := iEmp;
                open;
             end;
         end;
      end;

   if iECF < 99 then
      BtnCancelar.Enabled:= true;
   dbgrid1.SetFocus;
end;

procedure TFrmConsPreVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsPreVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close
   else
      if key = vk_F10 then
         begin
            Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
            FrmMenuFiscal.showmodal;
         end;
end;

procedure TFrmConsPreVenda.FormShow(Sender: TObject);
begin
   BtnCancelar.Enabled:= false;

   sSql:= QConsPre.SQL.Text;
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;

   {busca a posicao do combo}
   try
     ComboCons.ItemIndex:= strtoint(dm.LeINI(GetCurrentDir + '\cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsPreVenda.ComboCons'));
   except
     ComboCons.ItemIndex:= 0;
   end;

   ComboConsChange(ComboCons);
end;

procedure TFrmConsPreVenda.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if QConsPreSTATUS_PRE.AsInteger = 2 then
      begin
         DBGrid1.Canvas.Font.Color:= clRed;
         Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
      end;
end;

procedure TFrmConsPreVenda.EdtConsKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0; 
end;

procedure TFrmConsPreVenda.QConsPreCalcFields(DataSet: TDataSet);
begin
   case QConsPreSTATUS_PRE.AsInteger of
    0: QConsPreCALC_STATUS.AsString:= 'ABERTA';
    1: QConsPreCALC_STATUS.AsString:= 'FECHADA';
    2: QConsPreCALC_STATUS.AsString:= 'CANCELADA';
   end;
end;

procedure TFrmConsPreVenda.BtnCancelarClick(Sender: TObject);
begin
   if QConsPreSTATUS_PRE.AsInteger = 0 then
      begin
         if Application.MessageBox(pchar('Confirma o Cancelamento da Pre_Venda ' + QConsPreSEQUENCIA_PAF.AsString + ' ?'), 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
            begin
               { efetuando o cancelamento da Pre-Venda }
               { abrindo o cupom Fiscal }
               if AbreVenda = 0 then
                  begin
                     RegistraProduto;
                     if not (TotalizaCupom = 0) then
                        exit;

                     if not (EfetuaPagamentos = 0) then
                        exit;

                     if not (FechaCupom = 0) then
                        exit;

                     {atualiza os totais da venda}
                     //GravaFechamentoVenda(iCodVenda, QConsPreTOTAL_PRE.asCurrency, 0, 0 ,0 ,0 ,0 ,0 ,0, QConsPreTOTAL_PRE.asCurrency, QConsPreNOME_CLI.AsString, QConsPreCNPJ_CLI.AsString);

                     { cancela o cupom fiscal }
                     CancelaCupomFiscal(iECF);

                     { grava o GT }
                     GravaGT(iECF);

                     {cancela a pre-venda}
                     CancelaPreVenda;

                     BtnOk.Click;
                  end;
            end;
      end
   else
      begin
         case QConsPreSTATUS_PRE.AsInteger of
           1: showmessage('Pre-Venda Fechada,   não pode ser Cancelada');
           2: showmessage('Pre-Venda cancelada');
         end;
      end;
end;

function TFrmConsPreVenda.AbreVenda : integer;
var sAuxCOO      : string;
    sAuxCCF      : string;
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
   if AbreCupom(iECF) = 0 then
      begin
         sAuxCOO:= NumeroCupom(iECF);
         try
           iAuxCOO:= strtoint(sAuxCOO);
         except
           iAuxCOO:= 0;
         end;

         sAuxCCF:= ContadorCupomFiscal(iECF);
         try
           iAuxCCF:= strtoint(sAuxCCF);
         except
           iAuxCCF:= 0;
         end;

         { GRAVANDO A VENDA }
         iCodVenda:= GravaVenda(iAuxCOO, iAuxCCF, 0, QConsPreCOD_CLI.AsInteger, QConsPreCOD_VEND.AsInteger, QConsPreCOD_TPV.AsInteger, 1);
         if iCodVenda > 0 then
            result:= 0
         else
            result:= 1;
      end
   else
      result:= 1;
end;

function TFrmConsPreVenda.RegistraProduto : integer;
var sIndice : string;
begin
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   with QItensPreVenda do
      begin
         close;
         Parambyname('codpre').AsInteger:= QConsPreCOD_PRE.AsInteger;
         open;
         while not eof do
           begin
              { busca o indice da aliquota na ecf }
              sIndice:= BuscaIndice(QItensPreVendaICMS_CF_EST.AsInteger);

              {registra item ecf}
              RegistraItemECF(iECF, 13, iTamDescCupom, trim(QItensPreVendaCODIGO_BARRA_PRO.AsString),
                              trim(QItensPreVendaDESC_CUPOM.AsString), sIndice, trim(QItensPreVendaDESCRICAO.AsString),
                              QItensPreVendaQUANT.AsCurrency, QItensPreVendaVALOR.AsCurrency, QItensPreVendaDESCONTO.AsCurrency);

              {verifica se o item está cancelado na prevenda e cancela no cupom}
              if QItensPreVendaCANCELADO.AsInteger = 1 then
                 CancelaItemCupomFiscal(iECF, QItensPreVendaORDEM.AsInteger);

              {grava o produto na tabela itens_venda ja cancelado}
              GravaProdutoVenda(iCodVenda, QItensPreVendaCOD_PRO.AsInteger, QItensPreVendaORDEM.AsInteger, QConsPreCOD_VEND.AsInteger, QItensPreVendaCANCELADO.AsInteger, 1,
                                QItensPreVendaQUANT.AsCurrency, QItensPreVendaVALOR.AsCurrency, QItensPreVendaDESCONTO.AsCurrency,
                                '$', false);

              next;
           end;
      end;
end;

function TFrmConsPreVenda.BuscaIndice(iCodigoGRP : integer) : string;
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

function TFrmConsPreVenda.TotalizaCupom : integer;
begin
   result:= IniciaFechamentoCupomFiscal(iECF, 0);
end;

function TFrmConsPreVenda.EfetuaPagamentos : integer;
var cDinheiro, cPromissoria, cCheque, cChequePre, cCartao, cBoleto : currency;
begin
   {cDinheiro     := QConsPreTOTAL_PRE.asCurrency;
   cPromissoria  := 0;
   cCheque       := 0;
   cChequePre    := 0;
   cCartao       := 0;
   cBoleto       := 0;

   result:= PagamentoCupomFiscal(iECF, iAuxCOO, iAuxCCF, cDinheiro, cPromissoria, cCheque, cChequePre, cCartao, cBoleto);}
end;

function TFrmConsPreVenda.FechaCupom : integer;
var sAuxCliente, sAuxDoc, sAuxEnd : string;
begin
   sAuxCliente:= QConsPreNOME_CLI.AsString;
   sAuxDoc    := QConsPreCNPJ_CLI.AsString;
   sAuxEnd    := QConsPreCIDRES_CLI.AsString + '-' + QConsPreESTRES_CLI.AsString; 

   result:= FechaCupomFiscal(iECF, sAuxCliente, sAuxDoc, sAuxEnd, QConsPreSEQUENCIA_PAF.AsInteger, 0, 0, 0, 0, 0, 0);
end;

procedure TFrmConsPreVenda.CancelaPreVenda;
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
             Parambyname('codpre').AsInteger:= QConsPreCOD_PRE.AsInteger;
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

procedure TFrmConsPreVenda.QConsPreAfterScroll(DataSet: TDataSet);
begin
   if QConsPreSTATUS_PRE.AsInteger = 0 then
      BtnCancelar.Enabled:= true
   else
      BtnCancelar.Enabled:= false;
end;

end.

