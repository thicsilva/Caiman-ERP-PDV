unit UConsNotaFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, Grids, DBGrids, DB, Mask, 
  rxToolEdit, rxCurrEdit, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmConsNotaFiscal = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    ComboCons: TComboBox;
    GB2: TGroupBox;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    Label1: TLabel;
    GB3: TGroupBox;
    EdtCodCli: UNovosComponentes.TEdit;
    BtnConsCli: TsSpeedButton;
    EdtNomeCli: TEdit;
    BtnOk: TButton;
    BtnSair: TButton;
    EdtNum: UNovosComponentes.TEdit;
    DBGrid1: TDBGrid;
    BtnLocalizar: TButton;
    QConsNF: TFDQuery;
    DSQConsNF: TDataSource;
    QConsNFCOD_NF: TIntegerField;
    QConsNFCOD_EMP: TIntegerField;
    QConsNFNUMERO_NOTA_NF: TIntegerField;
    QConsNFCOD_CLI: TIntegerField;
    QConsNFDATA_SAIDA_NF: TDateField;
    QConsNFHORA_SAIDA_NF: TTimeField;
    QConsNFCOD_TRA: TIntegerField;
    QConsNFBASE_CALCULO_ICMS_NF: TBCDField;
    QConsNFVALOR_ICMS_NF: TBCDField;
    QConsNFBASE_SUBST_NF: TBCDField;
    QConsNFVALOR_SUBST_NF: TBCDField;
    QConsNFVALOR_TOTAL_PROD_NF: TBCDField;
    QConsNFVALOR_FRETE_NF: TBCDField;
    QConsNFVALOR_SEGURO_NF: TBCDField;
    QConsNFOUTRAS_DESPESAS_NF: TBCDField;
    QConsNFVALOR_IPI_NF: TBCDField;
    QConsNFVALOR_TOTAL_NF: TBCDField;
    QConsNFESPECIE_NF: TStringField;
    QConsNFMARCA_NF: TStringField;
    QConsNFNUMERO_NF: TStringField;
    QConsNFINF_COMPL_NF: TMemoField;
    QConsNFCANCELADA_NF: TStringField;
    QConsNFFRETE_CONTA_NF: TStringField;
    QConsNFNOME_CLI: TStringField;
    QConsNFNOME_TRA: TStringField;
    QConsNFCOD_FOR: TIntegerField;
    QConsNFRAZAO_FOR: TStringField;
    QConsNFDESCONTO_NF: TBCDField;
    QConsNFTIPO_CLIENTE: TStringField;
    QConsNFNOTA_IMPRESSA: TStringField;
    QConsNFCOD_VENDA: TIntegerField;
    QConsNFCOD_TPV: TIntegerField;
    IBTRNF: TFDTransaction;
    QConsNFSERIE_NOTA: TStringField;
    Shape1: TShape;
    Label2: TLabel;
    DBGridItens: TDBGrid;
    QItens: TFDQuery;
    DSItens: TDataSource;
    QItensCOD_PRO: TIntegerField;
    QItensQUANT: TBCDField;
    QItensUNIT: TBCDField;
    QItensUNIDADE: TStringField;
    QItensORDEM: TIntegerField;
    BtnItens: TButton;
    Label3: TLabel;
    EdtTotal: TCurrencyEdit;
    QConsNFDATA_EMISSAO_NF: TDateField;
    QConsNFTIPO_NOTA_FISCAL: TIntegerField;
    QConsNFCODIFICACAO_FISCAL: TStringField;
    QConsNFCODIGO_OUTRA_ENTRADA: TIntegerField;
    QConsNFCODIGO_OUTRA_SAIDA: TIntegerField;
    QConsNFCALC_TIPO: TStringField;
    QItensNOME_PRO: TStringField;
    QConsNFCHAVE_ACESSO_NFE: TStringField;
    QConsNFPROTOCOLO_NFE: TStringField;
    QConsNFSTATUS_TRANSMITIDA: TStringField;
    QConsNFSTATUS_RETORNO: TStringField;
    QConsNFSTATUS_CANCELADO: TStringField;
    QConsNFSTATUS_INUTILIZADO: TStringField;
    QConsNFSTATUS_EMAIL: TStringField;
    QConsNFJUSTIFICATIVA_CANCEL_INUTIL: TStringField;
    QConsNFPLACA_TRANSP: TStringField;
    QConsNFUF_PLACA_TRANSP: TStringField;
    QConsNFPESO_BRUTO_NF: TBCDField;
    QConsNFPESO_LIQUIDO_NF: TBCDField;
    QConsNFQUANTIDADE_NF: TIntegerField;
    QConsNFCHAVE2: TStringField;
    QConsNFDEPEC: TIntegerField;
    QConsNFVALOR_PIS: TBCDField;
    QConsNFVALOR_COFINS: TBCDField;
    procedure EdtNumKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodCliEnter(Sender: TObject);
    procedure EdtCodCliExit(Sender: TObject);
    procedure EdtCodCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsCliClick(Sender: TObject);
    procedure ComboConsChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnItensClick(Sender: TObject);
    procedure QConsNFCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsNotaFiscal: TFrmConsNotaFiscal;

implementation
uses
  Udm, Ubibli1, UConsCLi, UNotaFiscal, UNovoPrincipal;
var  sSql : string;

{$R *.dfm}

procedure TFrmConsNotaFiscal.EdtNumKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmConsNotaFiscal.EdtCodCliEnter(Sender: TObject);
begin 
   EdtCodCli.SelectAll;
end;

procedure TFrmConsNotaFiscal.EdtCodCliExit(Sender: TObject);
begin 
   EdtNomeCli.Text:= Consulta('cliente', edtcodcli, 'cod_cli', 'nome_cli', dm.IBTransaction, dm.qConsulta);
   if EdtNomeCli.Text = '' then
      begin 
         AlertaCad('Cliente não Cadastrado');
//         EdtCodCli.SetFocus;
      end;
end;

procedure TFrmConsNotaFiscal.EdtCodCliKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsCli.Click;
end;

procedure TFrmConsNotaFiscal.BtnConsCliClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsCli, FrmConsCli);
   FrmConsCli.Tag:= 19;
   FrmConsCli.ShowModal;
end;

procedure TFrmConsNotaFiscal.ComboConsChange(Sender: TObject);
begin 
   case ComboCons.ItemIndex of
     0: begin 
           gb2.Enabled        := false;
           gb3.Enabled        := true;
           gb3.Caption        := 'Código';
           EdtNum.Visible     := true;
           EdtCodCli.Visible  := false;
           BtnConsCli.Visible := false;
           EdtNomeCli.Visible := false;
           EdtNum.SetFocus;
        end;
     1: begin 
           gb2.Enabled:= true;
           gb3.Enabled:= false;
           EdtDataIni.Date:= date;
           EdtDataFin.Date:= date;
           EdtDataIni.SetFocus;
        end;
     2: begin 
           gb2.Enabled        := true;
           gb3.Enabled        := true;
           gb3.Caption        := 'Cliente';
           EdtNum.Visible     := false;
           EdtCodCli.Visible  := true;
           BtnConsCli.Visible := true;
           EdtNomeCli.Visible := true;
           edtcodcli.Clear;
           EdtNomeCli.Clear;
           EdtCodCli.SetFocus;
        end;
     3: begin 
           gb2.Enabled        := false;
           gb3.Enabled        := true;
           gb3.Caption        := 'Número da Nota Fiscal';
           EdtNum.Visible     := true;
           EdtCodCli.Visible  := false;
           BtnConsCli.Visible := false;
           EdtNomeCli.Visible := false;
           EdtNum.SetFocus;
        end;
     4: begin 
           gb2.Enabled        := true;
           gb3.Enabled        := true;
           gb3.Caption        := 'CFOP';
           EdtNum.Visible     := true;
           EdtCodCli.Visible  := false;
           BtnConsCli.Visible := false;
           EdtNomeCli.Visible := false;
           EdtNum.SetFocus;
        end;
     5: begin 
           gb2.Enabled        := true;
           gb3.Enabled        := false;
           gb3.Caption        := '';
           EdtNum.Visible     := true;
           EdtCodCli.Visible  := false;
           BtnConsCli.Visible := false;
           EdtNomeCli.Visible := false;
           EdtDataIni.SetFocus;
        end;
   end;
end;

procedure TFrmConsNotaFiscal.FormShow(Sender: TObject);
begin 
   EdtTotal.Clear;
   DBGridItens.Visible:= false;
   {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsNotaFiscal.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;

   sSql:= QConsNF.SQL.Text;
   edtdataini.Date:= date;
   edtdatafin.Date:= date;
   ComboConsChange(ComboCons);
end;

procedure TFrmConsNotaFiscal.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsNotaFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if IBTRNF.Active then
      IBTRNF.Commit;
   QConsNF.SQL.Clear;
   QConsNF.SQL.Text:= sSql;
   QConsNF.Close;

   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   QItens.Close;

   {grava a posicao do combo}
   dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsNotaFiscal.ComboCons', inttostr(ComboCons.itemIndex));
   Action:= caFree;
end;

procedure TFrmConsNotaFiscal.BtnOkClick(Sender: TObject);
var cTotal : currency;
begin 
   {busca a serie da nota fiscal}
   cTotal:= 0;
   if IBTRNF.Active then
      IBTRNF.Commit;
   IBTRNF.StartTransaction;
   with QConsNF do
      begin 
         close;
         sql.Clear;
         sql.Text:= sSql;
         case ComboCons.ItemIndex of
           0: begin 
                 if edtnum.Text = '' then
                    begin 
                       AlertaCad('Digite o código da nota fiscal');
//                       EdtNum.SetFocus;
                       exit;
                    end;
                 sql.add(' WHERE N.COD_NF = :COD AND COD_EMP=:CODEMP');
                 Parambyname('cod').AsInteger  := strtoint(EdtNum.Text);
              end;
           1: begin 
                 sql.add(' WHERE N.DATA_EMISSAO_NF BETWEEN :DATAINI AND :DATAFIN AND COD_EMP=:CODEMP' +
                         ' ORDER BY N.NUMERO_NOTA_NF');
                 Parambyname('dataini').AsDate := edtdataini.Date;
                 Parambyname('datafin').AsDate := EdtDataFin.Date;
              end;
           2: begin 
                 sql.add(' WHERE N.DATA_EMISSAO_NF BETWEEN :DATAINI AND :DATAFIN AND COD_EMP=:CODEMP' +
                         ' AND N.COD_CLI = :CODCLI ' +
                         ' ORDER BY N.NUMERO_NOTA_NF');
                 Parambyname('dataini').AsDate  := edtdataini.Date;
                 Parambyname('datafin').AsDate  := EdtDataFin.Date;
                 Parambyname('codcli').Asinteger:= strtoint(EdtCodCli.Text);
              end;
           3: begin 
                 if edtnum.Text = '' then
                    begin 
                       AlertaCad('Digite o número da nota fiscal');
//                       EdtNum.SetFocus;
                       exit;
                    end;
                 sql.add(' WHERE N.NUMERO_NOTA_NF = :NUMNF AND COD_EMP=:CODEMP');
                 Parambyname('numnf').AsInteger:= strtoint(edtnum.Text);
              end;
           4: begin 
                 sql.add(' WHERE N.CANCELADA_NF = ' + #39 + 'S' + #39 +
                         ' AND N.DATA_EMISSAO_NF BETWEEN :DATAINI AND :DATAFIN AND COD_EMP=:CODEMP' +
                         ' ORDER BY N.NUMERO_NOTA_NF');
                 Parambyname('dataini').AsDate := edtdataini.Date;
                 Parambyname('datafin').AsDate := EdtDataFin.Date;
              end;
         end;
         ParamByName( 'CODEMP' ).AsInteger := iEmp;
         open;
         First;
         while not eof do
            begin 
               if trim(QConsNFCANCELADA_NF.AsString) = 'N' then
                  cTotal:= cTotal + QConsNFVALOR_TOTAL_NF.AsCurrency;
               next;
            end;
         EdtTotal.Text:= currtostr(cTotal);
      end;
   DBGrid1.SetFocus;
end;

procedure TFrmConsNotaFiscal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      begin 
         if DBGridItens.Visible then
            begin 
               DBGrid1.SetFocus;
               DBGridItens.Visible:= false;
               if dm.IBTRAux.Active then
                  dm.IBTRAux.Commit;
            end
         else
            close;
      end;
end;

procedure TFrmConsNotaFiscal.BtnLocalizarClick(Sender: TObject);
begin 
   if trim(QConsNFCANCELADA_NF.AsString) = 'S' then
      begin 
         AlertaCad('Nota Fiscal Cancelada, não pode ser alterada.');
         exit;
      end;


   BuscaFormulario( TFrmNotaFiscal, True );
   with FrmNotaFiscal do
      begin 
         tag:= 1;
         edtcod.Text        := QConsNFCOD_NF.AsString;
         EdtEmissao.Date    := QConsNFDATA_EMISSAO_NF.Value;
         ComboTipo.ItemIndex:= QConsNFTIPO_NOTA_FISCAL.AsInteger;
         EdtNumero.Text     := QConsNFNUMERO_NOTA_NF.AsString;

         if not QConsNFCOD_CLI.IsNull then
            begin 
               edtclifor.Text     := QConsNFCOD_CLI.AsString;
               EdtNomeCliFor.Text := QConsNFNOME_CLI.AsString;
               ComboCliFor.ItemIndex:= 0;
               ComboCliForChange(ComboCliFor);
            end
         else
            begin 
               edtclifor.Text     := QConsNFCOD_FOR.AsString;
               EdtNomeCliFor.Text := QConsNFRAZAO_FOR.AsString;
               ComboCliFor.ItemIndex:= 1;
               ComboCliForChange(ComboCliFor);
            end;
         cod_tra.Text       := QConsNFCOD_TRA.AsString;
         EdtNomeTra.Text    := QConsNFNOME_TRA.AsString;
         EdtDataSaida.Date  := QConsNFDATA_SAIDA_NF.Value;
         edthora.Text       := QConsNFHORA_SAIDA_NF.AsString;
         EdtBaseICMS.Text   := QConsNFBASE_CALCULO_ICMS_NF.AsString;
         EdtValorICMS.Text  := QConsNFVALOR_ICMS_NF.AsString;
         EdtBaseSub.Text    := QConsNFBASE_SUBST_NF.AsString;
         EdtValorSub.Text   := QConsNFVALOR_SUBST_NF.AsString;
         EdtTotalProd.Text  := QConsNFVALOR_TOTAL_PROD_NF.AsString;
         EdtDesconto.Text   := QConsNFDESCONTO_NF.AsString;
         EdtFrete.Text      := QConsNFVALOR_FRETE_NF.AsString;
         EdtSeguro.Text     := QConsNFVALOR_SEGURO_NF.AsString;
         EdtDesp.Text       := QConsNFOUTRAS_DESPESAS_NF.AsString;
         EdtIPI.Text        := QConsNFVALOR_IPI_NF.AsString;
         EdtTotalNF.Text    := QConsNFVALOR_TOTAL_NF.AsString;
         EdtQuantidade.Text := QConsNFQUANTIDADE_NF.AsString;
         EdtEspecie.Text    := QConsNFESPECIE_NF.AsString;
         EdtMarca.Text      := QConsNFMARCA_NF.AsString;
         EdtNum.Text        := QConsNFNUMERO_NF.AsString;
         EdtPesoBruto.Text  := QConsNFPESO_BRUTO_NF.AsString;
         EdtPesoLiquido.Text:= QConsNFPESO_LIQUIDO_NF.AsString;
         memoobs.Text       := QConsNFINF_COMPL_NF.AsString;
         RdgFrete.ItemIndex := QConsNFFRETE_CONTA_NF.AsInteger - 1;
         EdtCodTPV.text     := QConsNFCOD_TPV.AsString;
         EdtSerie.Text      := QConsNFSERIE_NOTA.AsString;
         EdtModelo.Text     := QConsNFCODIFICACAO_FISCAL.AsString;
         EdtTotalPIS.Value := QConsNFVALOR_PIS.AsCurrency;
         EdtTotalCOFINS.Value := QConsNFVALOR_COFINS.AsCurrency;
         EdtCodTPVExit(EdtCodTPV);
         BuscaItens;
         FormShow(sender);
         show;
      end;
   close;
end;

procedure TFrmConsNotaFiscal.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsNotaFiscal.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin 
   if trim(QConsNFCANCELADA_NF.AsString) = 'S' then
      begin 
         DBGrid1.Canvas.Font.Color:= clRed;
         Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
      end;
end;

procedure TFrmConsNotaFiscal.BtnItensClick(Sender: TObject);
begin 
   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   dm.IBTRAux.StartTransaction;
   with QItens do
      begin 
         close;
         Parambyname('codnf').AsInteger:= QConsNFCOD_NF.AsInteger;
         Open;
         DBGridItens.Visible:= true;
         DBGridItens.SetFocus;
      end;
end;

procedure TFrmConsNotaFiscal.QConsNFCalcFields(DataSet: TDataSet);
begin 
   case QConsNFTIPO_NOTA_FISCAL.AsInteger of
    0: QConsNFCALC_TIPO.AsString:= 'VENDAS';
    1: QConsNFCALC_TIPO.AsString:= 'VENDAS C/CUPOM';
    2: QConsNFCALC_TIPO.AsString:= 'TRANSFERÊNCIA';
    3: QConsNFCALC_TIPO.AsString:= 'DEVOLUÇÃO';
    4: QConsNFCALC_TIPO.AsString:= 'OUTRAS SAÍDAS';
    5: QConsNFCALC_TIPO.AsString:= 'ENTRADAS';
   end;
end;

end.
