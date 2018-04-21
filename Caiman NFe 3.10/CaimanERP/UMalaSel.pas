unit UMalaSel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, Grids, DBGrids, DB, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmMalaSel = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    StatusBar1: TStatusBar;
    RDG: TRadioGroup;
    Label21: TLabel;
    EdtCodCarta: UNovosComponentes.TEdit;
    BtnConsCarta: TsSpeedButton;
    EdtNomeCarta: TEdit;
    Label22: TLabel;
    BtnVis: TBitBtn;
    BtnSair: TBitBtn;
    QConsSel: TFDQuery;
    DSQConsSel: TDataSource;
    QConsSelCOD_CLI: TIntegerField;
    QConsSelNOME_CLI: TStringField;
    QConsSelENDRES_CLI: TStringField;
    QConsSelBAIRES_CLI: TStringField;
    QConsSelCIDRES_CLI: TStringField;
    BtnADD: TBitBtn;
    BtnExc: TBitBtn;
    Panel5: TPanel;
    Panel6: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    EdtCodCli: UNovosComponentes.TEdit;
    BtnConsCli: TsSpeedButton;
    EdtNomeCli: TEdit;
    Label2: TLabel;
    BtnOK: TBitBtn;
    BtnVolta: TBitBtn;
    QRelCobranca: TFDQuery;
    QRelCobrancaCOD_CTR: TIntegerField;
    QRelCobrancaPARCELA_CTR: TIntegerField;
    QRelCobrancaSEQUENCIA_CTR: TIntegerField;
    QRelCobrancaDATA_CTR: TDateField;
    QRelCobrancaVENCTO_CTR: TDateField;
    QRelCobrancaVALOR_CTR: TBCDField;
    QRelCobrancaNOME_CLI: TStringField;
    QRelCobrancaCOD_CLI: TIntegerField;
    IBTRCarta: TFDTransaction;
    QCarta: TFDQuery;
    QDadosEmpresa: TFDQuery;
    QDadosEmpresaFANTASIA_EMP: TStringField;
    QDadosEmpresaEND_EMP: TStringField;
    QDadosEmpresaEST_EMP: TStringField;
    QDadosEmpresaCID_EMP: TStringField;
    QDadosEmpresaCEP_EMP: TStringField;
    QDadosEmpresaBAI_EMP: TStringField;
    BtnLimpar: TBitBtn;
    QCartaCONTEUDO_CARTA: TMemoField;
    CheckParcelas: TCheckBox;
    QRelCobrancaDIAS: TIntegerField;
    QRelCobrancaDIAS_CARENCIA: TIntegerField;
    QRelCobrancaJUROS_ATRASO: TBCDField;
    QRelCobrancaCALC_JUROS: TCurrencyField;
    QRelCobrancaDEVOLUCAO_CTR: TBCDField;
    QRelCobrancaCALC_VALORLIQ: TCurrencyField;
    QRelCobrancaENDRES_CLI: TStringField;
    QRelCobrancaBAIRES_CLI: TStringField;
    QRelCobrancaCIDRES_CLI: TStringField;
    QRelCobrancaESTRES_CLI: TStringField;
    QRelCobrancaCEPRES_CLI: TStringField;
    QRelCobrancaTELRES_CLI: TStringField;
    QRelCobrancaNUMRES_CLI: TStringField;
    procedure EdtCodCartaEnter(Sender: TObject);
    procedure EdtCodCartaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodCartaExit(Sender: TObject);
    procedure EdtCodCartaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsCartaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RDGClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnExcClick(Sender: TObject);
    procedure BtnConsCliClick(Sender: TObject);
    procedure EdtCodCliEnter(Sender: TObject);
    procedure EdtCodCliExit(Sender: TObject);
    procedure EdtCodCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnVoltaClick(Sender: TObject);
    procedure BtnADDClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnVisClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure QRelCobrancaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMalaSel: TFrmMalaSel;

implementation
uses
  Udm, Ubibli1, UConsCartas, UConsCli, UQRelCarta, UMalaDireta, UNovoPrincipal;

{$R *.dfm}

procedure TFrmMalaSel.EdtCodCartaEnter(Sender: TObject);
begin 
   EdtCodCarta.SelectAll;
end;

procedure TFrmMalaSel.EdtCodCartaKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
     key := #0;
end;

procedure TFrmMalaSel.EdtCodCartaExit(Sender: TObject);
begin 
   if BtnSair.Focused then
      exit;
   EdtNomeCarta.Text := Consulta('cartas', EdtCodCarta, 'cod_carta', 'nome_carta', dm.IBTransaction, dm.qConsulta);
   if EdtNomeCarta.Text = '' then
      begin 
         AlertaCad('Carta não Cadastrada');
//         EdtCodCarta.SetFocus;
      end;
end;

procedure TFrmMalaSel.EdtCodCartaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
     BtnConsCarta.Click;
end;

procedure TFrmMalaSel.BtnConsCartaClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsCartas, FrmConsCartas);
   FrmConsCartas.Tag:= 1;
   FrmConsCartas.ShowModal;
end;

procedure TFrmMalaSel.FormShow(Sender: TObject);
begin 
   Panel6.SendToBack;
   btnadd.Enabled   := true;
   BtnExc.Enabled   := true;
   BtnLimpar.Enabled:= true;
   CheckParcelas.Checked:= true;
   RDG.ItemIndex:= 0;
   RDGClick(rdg);
end;

procedure TFrmMalaSel.RDGClick(Sender: TObject);
begin 
   if IBTRCarta.Active then
      IBTRCarta.Commit;
   IBTRCarta.StartTransaction;
   with QConsSel do
      begin 
         close;
         sql.Clear;
         sql.Add('SELECT COD_CLI, NOME_CLI, ENDRES_CLI, BAIRES_CLI, CIDRES_CLI ' +
                 'FROM CLIENTE ' +
                 'WHERE SELECIONADO_CLI = ' + #39 + 'S' + #39);
         if rdg.ItemIndex = 0 then
            sql.add(' ORDER BY COD_CLI')
         else
            sql.add(' ORDER BY NOME_CLI');
         open;
      end;
end;

procedure TFrmMalaSel.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmMalaSel.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   if IBTRCarta.Active then
      IBTRCarta.Commit; 
   QConsSel.Close;
   Action:= caFree;
end;

procedure TFrmMalaSel.BtnExcClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.Consulta do
          begin 
             close;
             sql.Clear;
             sql.Add('UPDATE CLIENTE SET SELECIONADO_CLI = :1 WHERE COD_CLI = :2');
             Parambyname('1').AsString:= 'N';
             Parambyname('2').AsInteger:= QConsSelCOD_CLI.AsInteger;
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao excluir o cliente da lista');
     end;
   finally
     dm.Consulta.Close;
     RDGClick(RDG);
   end;
end;

procedure TFrmMalaSel.BtnConsCliClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsCli, FrmConsCli);
   FrmConsCli.Tag:= 25;
   FrmConsCli.ShowModal;
end;

procedure TFrmMalaSel.EdtCodCliEnter(Sender: TObject);
begin 
   EdtCodCli.SelectAll;
end;

procedure TFrmMalaSel.EdtCodCliExit(Sender: TObject);
begin 
   if (BtnSair.Focused) or (BtnVolta.Focused) then
      exit;
   EdtNomeCli.Text := Consulta('cliente', EdtCodCli, 'cod_cli', 'nome_cli', dm.IBTransaction, dm.qConsulta);
   if EdtNomeCli.Text = '' then
      begin 
         AlertaCad('Cliente não Cadastrado');
//         EdtCodCli.SetFocus;
      end;
end;

procedure TFrmMalaSel.EdtCodCliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
     BtnConsCli.Click;
end;

procedure TFrmMalaSel.BtnOKClick(Sender: TObject);
begin 
   if EdtCodCli.Text = '' then
      begin 
         AlertaCad('Digite o Código do Cliente');
//         EdtCodCli.SetFocus;
         exit;
      end;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.Consulta do
          begin 
             close;
             sql.Clear;
             sql.Add('UPDATE CLIENTE SET SELECIONADO_CLI = :1 WHERE COD_CLI = :2');
             Parambyname('1').AsString:= 'S';
             Parambyname('2').AsInteger:= strtoint(EdtCodCli.text);
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao incluir o cliente');
     end;
   finally
     dm.Consulta.Close;
     edtcodcli.Clear;
     EdtNomeCli.Clear;
     edtcodcli.SetFocus;
   end;
end;

procedure TFrmMalaSel.BtnVoltaClick(Sender: TObject);
begin 
   panel6.SendToBack;
   btnadd.Enabled   := true;
   BtnExc.Enabled   := true;
   BtnLimpar.Enabled:= true;
   RDGClick(rdg);
end;

procedure TFrmMalaSel.BtnADDClick(Sender: TObject);
begin 
   DBGrid1.SendToBack;
   btnadd.Enabled    := false;
   BtnExc.Enabled    := false;
   BtnLimpar.Enabled := false;
   edtcodcli.Clear;
   edtnomecli.Clear;
   edtcodcli.SetFocus;
end;

procedure TFrmMalaSel.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmMalaSel.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmMalaSel.BtnVisClick(Sender: TObject);
var vl_data : string;
begin 
   if EdtCodCarta.Text = '' then
      begin 
         AlertaCad('Digite o código da carta');
//         EdtCodCarta.SetFocus;
         exit;
      end;

   Application.CreateForm(TFrmQRelCarta, FrmQRelCarta);

   { BUSCA DADOS DA EMPRESA }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QDadosEmpresa do
          begin 
             close;
             parambyname('codemp').AsInteger:= iEmp;
             open;
             FrmQRelCarta.QRLNomeEmpresa.Caption:= QDadosEmpresaFANTASIA_EMP.AsString;
             FrmQRelCarta.QRLEndEmp.Caption:= QDadosEmpresaEND_EMP.AsString + ' - ' +
             QDadosEmpresaBAI_EMP.AsString;
             FrmQRelCarta.QRLEnd1.Caption:= 'Cep: ' + QDadosEmpresaCEP_EMP.AsString + ' - ' +
             QDadosEmpresaCID_EMP.AsString + '-' + QDadosEmpresaEST_EMP.AsString;
             vl_data:= QDadosEmpresaCID_EMP.AsString + ', ' +
             FormatDateTime('d " de " mmmm " de "yyyy', date);
             FrmQRelCarta.QRLData.Caption:= vl_data;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar os dados da empresa');
     end;
   finally
     QDadosEmpresa.Close;
   end;

   { BUSCA O CONTEUDO DA CARTA }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QCarta do
          begin 
             close;
             parambyname('codcarta').AsInteger:= strtoint(EdtCodCarta.Text);
             open;
             FrmQRelCarta.QRLConteudo.Caption:= QCartaCONTEUDO_CARTA.AsString;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar o conteúdo da carta');
     end;
   finally
     QCarta.Close;
   end;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRelCobranca do
      begin 
         close;
         sql.Clear;
         sql.Add('SELECT R.COD_CTR, R.PARCELA_CTR, R.SEQUENCIA_CTR, R.DATA_CTR,  ' +
                 'R.VENCTO_CTR, R.VALOR_CTR, R.DEVOLUCAO_CTR, C.NOME_CLI, C.ENDRES_CLI, C.BAIRES_CLI, C.CIDRES_CLI,C.ESTRES_CLI, C.CEPRES_CLI, C.TELRES_CLI, C.NUMRES_CLI,' +
                 'R.COD_CLI, (CURRENT_DATE - R.VENCTO_CTR) DIAS, P.DIAS_CARENCIA, P.JUROS_ATRASO ' +
                 'FROM CONTAS_RECEBER R ' +
                 'INNER JOIN CLIENTE C ' +
                 'ON (R.COD_CLI = C.COD_CLI) ' +
                 'INNER JOIN PARAMETROS P ' +
                 'ON (R.COD_EMP = P.COD_EMP) ' + 
                 'WHERE R.VENCTO_CTR BETWEEN :DATAINI AND :DATAFIN AND ' +
                 'R.DTPAGTO_CTR IS NULL AND C.SELECIONADO_CLI = ' + #39 + 'S' + #39);
         if (not FrmMalaDireta.checkEmp.Checked) then
            begin 
               sql.Add(' AND R.COD_EMP = :CODEMP');
               Parambyname('codemp').AsInteger:= iEmp;
            end;
         if rdg.ItemIndex = 0 then
            begin 
               sql.add(' ORDER BY C.COD_CLI, R.VENCTO_CTR');
               FrmQRelCarta.QRGroup1.Expression:= 'COD_CLI';
            end
         else
            begin 
               sql.add(' ORDER BY C.NOME_CLI, R.VENCTO_CTR');
               FrmQRelCarta.QRGroup1.Expression:= 'NOME_CLI';
            end;
         Parambyname('dataini').AsDate:= FrmMalaDireta.EdtDataIni.Date;
         Parambyname('datafin').AsDate:= FrmMalaDireta.EdtDataFin.Date;
         open;
      end;
   if not CheckParcelas.Checked then
      FrmQRelCarta.DetailBand1.Enabled:= false
   else
      FrmQRelCarta.DetailBand1.Enabled:= true;
   FrmQRelCarta.QRCarta.PreviewInitialState:= wsMaximized;      
   FrmQRelCarta.QRCarta.Preview;
   FrmQRelCarta.QRCarta.QRPrinter:= nil;
   dm.IBTransaction.Commit;
   QRelCobranca.Close;
end;

procedure TFrmMalaSel.BtnLimparClick(Sender: TObject);
begin 
   if Application.MessageBox('Limpar a Seleção?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         try
           try
             with dm.Consulta do
                begin 
                   close;
                   sql.Clear;
                   sql.Add('UPDATE CLIENTE SET SELECIONADO_CLI = :1');
                   Parambyname('1').AsString:= 'N';
                   ExecOrOpen;
                end;
             dm.IBTransaction.Commit;
           except
             dm.IBTransaction.Rollback;
             AlertaCad('Erro ao limpar a seleção');
           end;
         finally
           dm.Consulta.Close;
           RDGClick(RDG);
         end;
     end;
end;

procedure TFrmMalaSel.QRelCobrancaCalcFields(DataSet: TDataSet);
begin 
   { CALCULO DO JUROS }
   if QRelCobrancaDIAS.Value > QRelCobrancaDIAS_CARENCIA.Value then
      QRelCobrancaCALC_JUROS.AsCurrency:= (((QRelCobrancaVALOR_CTR.AsCurrency - QRelCobrancaDEVOLUCAO_CTR.AsCurrency) * (QRelCobrancaJUROS_ATRASO.AsCurrency / 30) * QRelCobrancaDIAS.Value) / 100)
   else
      QRelCobrancaCALC_JUROS.AsCurrency:= 0;

   QRelCobrancaCALC_VALORLIQ.AsCurrency:= QRelCobrancaVALOR_CTR.AsCurrency - QRelCobrancaDEVOLUCAO_CTR.AsCurrency + QRelCobrancaCALC_JUROS.AsCurrency;
end;

end.
