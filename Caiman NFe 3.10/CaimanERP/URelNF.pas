unit URelNF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmRelNF = class(UNovoFormulario.TForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    Panel1: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    StatusBar1: TStatusBar;
    QRelNF: TFDQuery;
    QRelNFDATA_EMISSAO_NF: TDateField;
    QRelNFNUMERO_NOTA_NF: TIntegerField;
    QRelNFFRETE_CONTA_NF: TStringField;
    QRelNFNOME_TRA: TStringField;
    QRelNFNOME_CLI: TStringField;
    QRelNFRAZAO_FOR: TStringField;
    QRelNFCALC_NOME: TStringField;
    CheckTransp: TCheckBox;
    QRelNFCOD_TRA: TIntegerField;
    QRelNFQUANTIDADE_NF: TIntegerField;
    BitBtn1: TBitBtn;
    Rel: TFDQuery;
    RelCOD_NF: TIntegerField;
    RelCOD_EMP: TIntegerField;
    RelNUMERO_NOTA_NF: TIntegerField;
    RelDATA_EMISSAO_NF: TDateField;
    RelDATA_SAIDA_NF: TDateField;
    RelHORA_SAIDA_NF: TTimeField;
    RelCOD_TRA: TIntegerField;
    RelBASE_CALCULO_ICMS_NF: TBCDField;
    RelVALOR_ICMS_NF: TBCDField;
    RelBASE_SUBST_NF: TBCDField;
    RelVALOR_SUBST_NF: TBCDField;
    RelVALOR_TOTAL_PROD_NF: TBCDField;
    RelVALOR_FRETE_NF: TBCDField;
    RelVALOR_SEGURO_NF: TBCDField;
    RelOUTRAS_DESPESAS_NF: TBCDField;
    RelVALOR_IPI_NF: TBCDField;
    RelVALOR_TOTAL_NF: TBCDField;
    RelESPECIE_NF: TStringField;
    RelMARCA_NF: TStringField;
    RelNUMERO_NF: TStringField;
    RelINF_COMPL_NF: TMemoField;
    RelCANCELADA_NF: TStringField;
    RelFRETE_CONTA_NF: TStringField;
    RelCOD_CLI: TIntegerField;
    RelCOD_FOR: TIntegerField;
    RelDESCONTO_NF: TBCDField;
    RelTIPO_CLIENTE: TStringField;
    RelNOTA_IMPRESSA: TStringField;
    RelCOD_VENDA: TIntegerField;
    RelCOD_TPV: TIntegerField;
    RelSERIE_NOTA: TStringField;
    RelTIPO_NOTA_FISCAL: TIntegerField;
    RelCODIFICACAO_FISCAL: TStringField;
    RelCODIGO_OUTRA_ENTRADA: TIntegerField;
    RelCODIGO_OUTRA_SAIDA: TIntegerField;
    RelCHAVE_ACESSO_NFE: TStringField;
    RelPROTOCOLO_NFE: TStringField;
    RelSTATUS_TRANSMITIDA: TStringField;
    RelSTATUS_RETORNO: TStringField;
    RelSTATUS_CANCELADO: TStringField;
    RelSTATUS_INUTILIZADO: TStringField;
    RelSTATUS_EMAIL: TStringField;
    RelJUSTIFICATIVA_CANCEL_INUTIL: TStringField;
    RelPLACA_TRANSP: TStringField;
    RelUF_PLACA_TRANSP: TStringField;
    RelPESO_BRUTO_NF: TBCDField;
    RelPESO_LIQUIDO_NF: TBCDField;
    RelQUANTIDADE_NF: TIntegerField;
    RelCHAVE2: TStringField;
    RelDEPEC: TIntegerField;
    Itens: TFDQuery;
    ItensORDEM: TIntegerField;
    ItensCOD_NF: TIntegerField;
    ItensCST: TStringField;
    ItensALIQ: TBCDField;
    ItensCOD_EMP: TIntegerField;
    ItensCOD_GRP: TIntegerField;
    ItensQUANT: TBCDField;
    ItensALIQ_IPI: TBCDField;
    ItensREDUCAO_ICMS: TBCDField;
    ItensCOD_CFO: TIntegerField;
    ItensSUB_TRIBUTARIA: TStringField;
    ItensVR_AGREGADO: TBCDField;
    ItensALIQUOTA_FORA_ESTADO: TBCDField;
    ItensUNIDADE: TStringField;
    ItensCOD_PRO: TIntegerField;
    ItensVALOR_TOTAL: TBCDField;
    ItensBASE_CALCULO: TBCDField;
    ItensVALOR_ICMS: TBCDField;
    ItensBASE_SUBTRIB: TBCDField;
    ItensVALOR_IPI: TBCDField;
    ItensVALOR_SUBTRIB: TBCDField;
    ItensCLASSIFICACAO_FISCAL: TStringField;
    ItensUNIT: TBCDField;
    ItensISENTAS: TBCDField;
    ItensOUTRAS: TBCDField;
    ItensFRETE: TFloatField;
    ItensDESCONTO: TFloatField;
    ItensBC_PIS: TBCDField;
    ItensALIQ_PIS: TBCDField;
    ItensVALOR_PIS: TBCDField;
    ItensBC_COFINS: TBCDField;
    ItensALIQ_COFINS: TBCDField;
    ItensVALOR_COFINS: TBCDField;
    ItensCANCELADO: TIntegerField;
    ItensNF_CANCELADA: TIntegerField;
    ItensCST_PIS: TStringField;
    ItensCST_COFINS: TStringField;
    ItensCSOSN: TStringField;
    ItensCST_IPI: TStringField;
    RelVALOR_PIS: TBCDField;
    RelVALOR_COFINS: TBCDField;
    RelCORRECAO: TStringField;
    RelPAF_ECF: TStringField;
    QRelNFVALOR_TOTAL_NF: TBCDField;
    QTotal: TFDQuery;
    QTotalSUM: TBCDField;
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnVisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRelNFCalcFields(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure RelAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelNF: TFrmRelNF;

implementation
uses
  Udm, UQRelNF, UNovoPrincipal;
var  sAuxSql, sAuxSql2 : string;

{$R *.dfm}

procedure TFrmRelNF.FormShow(Sender: TObject);
begin 
   sAuxSql:= QRelNF.SQL.Text;
   sAuxSql2:= Rel.SQL.Text;   
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;
   EdtDataIni.SetFocus;
end;

procedure TFrmRelNF.BitBtn1Click(Sender: TObject);
var
  TXT, TXT2: TStrings;
  Temp, Temp2: String;
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with Rel do
      begin 
         close;
         sql.Clear;
         sql.Text:= sAuxSql2;
         Parambyname('dataini').AsDate   := edtdataini.Date;
         Parambyname('datafin').AsDate   := EdtDataFin.Date;
         Parambyname('codemp').AsInteger := iEmp;

         if CheckTransp.Checked then
            sql.Add(' ORDER BY COD_TRA, NUMERO_NOTA_NF')
         else
            sql.add(' ORDER BY NUMERO_NOTA_NF');
         Open;
      end;
   if not rel.IsEmpty then
   begin 
   TXT := TStringList.Create;
   TXT2 := TStringList.Create;
   TXT.Clear;
   TXT2.Clear;
   Rel.First;
   while not Rel.Eof do
      begin 
         Temp := '';
         Temp := FrmRelNF.RelCOD_NF.AsString;
         Temp := Temp + '|' + FrmRelNF.RelNUMERO_NOTA_NF.AsString;
         Temp := Temp + '|' + FrmRelNF.RelDATA_EMISSAO_NF.AsString;
         Temp := Temp + '|' + FrmRelNF.RelDATA_SAIDA_NF.AsString;
         Temp := Temp + '|' + FrmRelNF.RelHORA_SAIDA_NF.AsString;
         Temp := Temp + '|' + FrmRelNF.RelCOD_TRA.AsString;
         Temp := Temp + '|' + FrmRelNF.RelBASE_CALCULO_ICMS_NF.AsString;
         Temp := Temp + '|' + FrmRelNF.RelVALOR_ICMS_NF.AsString;
         Temp := Temp + '|' + FrmRelNF.RelBASE_SUBST_NF.AsString;
         Temp := Temp + '|' + FrmRelNF.RelVALOR_SUBST_NF.AsString;
         Temp := Temp + '|' + FrmRelNF.RelVALOR_TOTAL_PROD_NF.AsString;
         Temp := Temp + '|' + FrmRelNF.RelVALOR_FRETE_NF.AsString;
         Temp := Temp + '|' + FrmRelNF.RelVALOR_SEGURO_NF.AsString;
         Temp := Temp + '|' + FrmRelNF.RelOUTRAS_DESPESAS_NF.AsString;
         Temp := Temp + '|' + FrmRelNF.RelVALOR_IPI_NF.AsString;
         Temp := Temp + '|' + FrmRelNF.RelVALOR_TOTAL_NF.AsString;
         Temp := Temp + '|' + FrmRelNF.RelNUMERO_NF.AsString;
         Temp := Temp + '|' + FrmRelNF.RelCANCELADA_NF.AsString;
         Temp := Temp + '|' + FrmRelNF.RelFRETE_CONTA_NF.AsString;
         Temp := Temp + '|' + FrmRelNF.RelCOD_CLI.AsString;
         Temp := Temp + '|' + FrmRelNF.RelCOD_FOR.AsString;
         Temp := Temp + '|' + FrmRelNF.RelDESCONTO_NF.AsString;
         Temp := Temp + '|' + FrmRelNF.RelTIPO_CLIENTE.AsString;
         Temp := Temp + '|' + FrmRelNF.RelNOTA_IMPRESSA.AsString;
         Temp := Temp + '|' + FrmRelNF.RelSERIE_NOTA.AsString;
         Temp := Temp + '|' + FrmRelNF.RelTIPO_NOTA_FISCAL.AsString;
         Temp := Temp + '|' + FrmRelNF.RelCODIFICACAO_FISCAL.AsString;
         Temp := Temp + '|' + FrmRelNF.RelCHAVE_ACESSO_NFE.AsString;
         Temp := Temp + '|' + FrmRelNF.RelPROTOCOLO_NFE.AsString;
         Temp := Temp + '|' + FrmRelNF.RelSTATUS_TRANSMITIDA.AsString;
         Temp := Temp + '|' + FrmRelNF.RelSTATUS_RETORNO.AsString;
         Temp := Temp + '|' + FrmRelNF.RelSTATUS_CANCELADO.AsString;
         Temp := Temp + '|' + FrmRelNF.RelSTATUS_INUTILIZADO.AsString;
         Temp := Temp + '|' + FrmRelNF.RelSTATUS_EMAIL.AsString;
         Temp := Temp + '|' + FrmRelNF.RelJUSTIFICATIVA_CANCEL_INUTIL.AsString;
         Temp := Temp + '|' + FrmRelNF.RelVALOR_PIS.AsString;
         Temp := Temp + '|' + FrmRelNF.RelVALOR_COFINS.AsString;
         Temp := Temp + '|' + StringReplace( StringReplace( FrmRelNF.RelINF_COMPL_NF.AsString, #13, ' ', [rfReplaceAll] ), #10, ' ', [rfReplaceAll] );
         txt.Add( Temp );
         Itens.First;
         while not Itens.Eof do
            begin 
               Temp2 := FrmRelNF.ItensORDEM.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensCOD_NF.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensCST.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensALIQ.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensCOD_GRP.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensQUANT.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensALIQ_IPI.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensREDUCAO_ICMS.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensCOD_CFO.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensSUB_TRIBUTARIA.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensALIQUOTA_FORA_ESTADO.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensUNIDADE.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensCOD_PRO.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensVALOR_TOTAL.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensBASE_CALCULO.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensVALOR_ICMS.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensBASE_SUBTRIB.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensVALOR_IPI.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensVALOR_SUBTRIB.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensCLASSIFICACAO_FISCAL.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensUNIT.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensISENTAS.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensOUTRAS.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensFRETE.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensCST_PIS.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensALIQ_PIS.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensCST_COFINS.AsString;
               Temp2 := Temp2 + '|' + FrmRelNF.ItensALIQ_COFINS.AsString;
               Itens.Next;
               txt2.Add( Temp2 );
            end;
          Rel.Next;
      end;
   txt.SaveToFile( 'C:\Notas_' + FormatDateTime( 'dd_mm_yyyy', date ) + '.txt' );
   txt2.SaveToFile( 'C:\Itens_' + FormatDateTime('dd_mm_yyyy', date) + '.txt' );
   txt.Free;
   Txt2.Free;
   AlertaCad( 'Arquivos gerados :'  + #13 +
   'C:\Notas_' + FormatDateTime( 'dd_mm_yyyy', date ) + '.txt'  + #13 +
   'C:\Itens_' + FormatDateTime('dd_mm_yyyy', date) + '.txt' );
   end
      else
         AlertaCad( 'Nehuma nota neste periodo!' );
end;

procedure TFrmRelNF.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelNF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRelNF.BtnVisClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRelNF do
      begin 
         close;
         sql.Clear;
         sql.Text:= sAuxSql;
         Parambyname('dataini').AsDate   := edtdataini.Date;
         Parambyname('datafin').AsDate   := EdtDataFin.Date;
         Parambyname('codemp').AsInteger := iEmp;

         if CheckTransp.Checked then
            sql.Add(' ORDER BY N.COD_TRA, N.NUMERO_NOTA_NF')
         else
            sql.add(' ORDER BY N.NUMERO_NOTA_NF');
         Open;
      end;

   with QTotal do
      begin 
         close;
         Parambyname('dataini').AsDate   := edtdataini.Date;
         Parambyname('datafin').AsDate   := EdtDataFin.Date;
         Parambyname('codemp').AsInteger := iEmp;
         Open;
      end;


   Application.CreateForm(TFrmQRelNF, FrmQRelNF);
   if CheckTransp.Checked then
      FrmQRelNF.QRGroup1.Enabled:= true
   else
      FrmQRelNF.QRGroup1.Enabled:= false;
   FrmQRelNF.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
   FrmQRelNF.QRLTitulo.Caption     := 'Relatório das Notas Fiscais no Período: ' + datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
   if sender = btnvis then
      begin 
         FrmQRelNF.QRNF.PreviewInitialState:= wsMaximized;
         FrmQRelNF.QRNF.Preview;
      end
   else
      begin 
         FrmQRelNF.QRNF.PrinterSetup;
         FrmQRelNF.QRNF.Print;
      end;
   FrmQRelNF.QRNF.QRPrinter:= nil;
   dm.IBTransaction.Commit;
   QRelNF.Close;
end;

procedure TFrmRelNF.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QRelNF.SQL.Clear;
   QRelNF.SQL.Text:= sAuxSql;
   Action:= caFree;
end;

procedure TFrmRelNF.QRelNFCalcFields(DataSet: TDataSet);
begin 
   if not QRelNFNOME_CLI.IsNull then
      QRelNFCALC_NOME.AsString:= QRelNFNOME_CLI.AsString
   else
      QRelNFCALC_NOME.AsString:= QRelNFRAZAO_FOR.AsString;
end;

procedure TFrmRelNF.RelAfterScroll(DataSet: TDataSet);
begin 
   if not RelCOD_NF.IsNull then
      begin 
         Itens.Close;
         Itens.ParamByName( 'COD_NF' ).AsInteger := RelCOD_NF.AsInteger;
         Itens.Open;
      end;
end;

end.
