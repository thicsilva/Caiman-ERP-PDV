unit URelOutrasSaidas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmRelOutrasSaidas = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    GBTipoVenda: TGroupBox;
    EdtCodTipo: UNovosComponentes.TEdit;
    BtnConsTipo: TsSpeedButton;
    EdtNomeTipo: TEdit;
    GroupBox1: TGroupBox;
    BtnConsCli: TsSpeedButton;
    EdtCodCli: UNovosComponentes.TEdit;
    EdtNomeCli: TEdit;
    CheckTipo: TCheckBox;
    CheckCliente: TCheckBox;
    CheckEmp: TCheckBox;
    QRelOS: TFDQuery;
    QRelOSQUANT: TBCDField;
    QRelOSCOD_ES: TIntegerField;
    QRelOSCOD_PRO: TIntegerField;
    QRelOSNOME_PRO: TStringField;
    QRelOSNOME_ES: TStringField;
    QRelOSVALOR_PRO: TBCDField;
    QRelOSUNIDADE_SAIDA_PRO: TStringField;
    QRelOSMARGEM_LUCRO_PRO: TBCDField;
    QRelOSVALOR: TFloatField;
    procedure CheckTipoClick(Sender: TObject);
    procedure CheckClienteClick(Sender: TObject);
    procedure BtnConsTipoClick(Sender: TObject);
    procedure EdtCodTipoExit(Sender: TObject);
    procedure EdtCodTipoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodTipoKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsCliClick(Sender: TObject);
    procedure EdtCodCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodCliExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelOutrasSaidas: TFrmRelOutrasSaidas;

implementation
uses
  Udm, UConsTipoES, UConsCli, UBibli1, UNovoPrincipal, UQRelOutrasSaidas;

{$R *.dfm}

procedure TFrmRelOutrasSaidas.CheckTipoClick(Sender: TObject);
begin 
   if CheckTipo.Checked then
      begin 
         EdtCodTipo.Clear;
         EdtNomeTipo.Clear;
         BtnConsTipo.Enabled := false;
         edtcodtipo.Enabled  := false;
         EdtNomeTipo.Enabled := false;
      end
   else
      begin 
         BtnConsTipo.Enabled := true;
         edtcodtipo.Enabled  := true;
         edtnometipo.Enabled := true;
         edtcodtipo.Clear;
         edtnometipo.Clear;
         edtcodtipo.SetFocus;
      end;
end;

procedure TFrmRelOutrasSaidas.CheckClienteClick(Sender: TObject);
begin 
   if CheckCliente.Checked then
      begin 
         EdtCodCli.Clear;
         EdtNomeCli.Clear;
         BtnConsCli.Enabled := false;
         EdtCodCli.Enabled  := false;
         EdtNomeCli.Enabled := false;
      end
   else
      begin 
         BtnConsCli.Enabled := true;
         EdtCodCli.Enabled  := true;
         EdtNomeCli.Enabled := true;
         EdtCodCli.Clear;
         EdtNomeCli.Clear;
         EdtCodCli.SetFocus;
      end;
end;

procedure TFrmRelOutrasSaidas.BtnConsTipoClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsTipoES, FrmConsTipoES);
   FrmConsTipoES.tag:= 6;
   FrmConsTipoES.showmodal;
end;

procedure TFrmRelOutrasSaidas.EdtCodTipoExit(Sender: TObject);
begin 
   if EdtCodTipo.Text = '' then
      begin 
         edtcodtipo.Clear;
         edtnometipo.Clear;
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
             sql.Add('SELECT NOME_ES ' +
                     'FROM TIPO_ES ' +
                     'WHERE COD_ES = ' + EdtCodTipo.text + ' AND TIPO_ES = ' + #39 + 'S' + #39);
             ExecOrOpen;
             if recordcount > 0 then
                EdtNomeTipo.Text:= fieldbyname('nome_es').Value
             else
                begin 
                   AlertaCad('Tipo de Outras Saídas não Cadastrado');
                   EdtNomeTipo.Clear;
//                   EdtCodTipo.SetFocus;
                   EdtCodTipo.SelectAll;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       AlertaCad('Erro ao Buscar o Tipo de Outras Saídas');
       EdtNomeTipo.Clear;
//       EdtCodTipo.SetFocus;
       EdtCodTipo.SelectAll;
     end;
   finally
       DM.Consulta.Close;
   end;
end;

procedure TFrmRelOutrasSaidas.EdtCodTipoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsTipo.Click
end;

procedure TFrmRelOutrasSaidas.EdtCodTipoKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmRelOutrasSaidas.BtnConsCliClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsCli, FrmConsCli);
   FrmConsCli.tag:= 17;
   FrmConsCli.showmodal;
end;

procedure TFrmRelOutrasSaidas.EdtCodCliKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsCli.Click;
end;

procedure TFrmRelOutrasSaidas.EdtCodCliExit(Sender: TObject);
begin 
   if BtnSair.Focused then
      exit;
   EdtNomeCli.Text:= consulta('cliente', edtcodcli, 'cod_cli', 'nome_cli', dm.IBTransaction, dm.qConsulta);
   if EdtNomeCli.Text = '' then
      begin 
         AlertaCad('Cliente não Cadastrado');
//         edtcodcli.SetFocus;
         edtcodcli.SelectAll;
      end;
end;

procedure TFrmRelOutrasSaidas.FormShow(Sender: TObject);
begin 
   edtdataini.Date          := date;
   edtdatafin.Date          := date;
   CheckTipo.Checked        := true;
   CheckTipoClick(sender);
   CheckCliente.Checked     := true;
   CheckClienteClick(sender);
end;

procedure TFrmRelOutrasSaidas.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelOutrasSaidas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelOutrasSaidas.BtnVisClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRelOS do
      begin 
         close;
         sql.Clear;
         sql.Add('SELECT SUM(I.QUANT_ITEM) QUANT, SUM(I.QUANT_ITEM * I.VALOR_ITEM) VALOR, O.COD_ES, I.COD_PRO, P.NOME_PRO, P.VALOR_PRO, ' +
                 'P.UNIDADE_SAIDA_PRO, P.MARGEM_LUCRO_PRO, T.NOME_ES ' +
                 'FROM ITENS_OUTRAS_SAIDAS I ' +
                 'INNER JOIN PRODUTO P       ' +
                 'ON (I.COD_PRO = P.COD_PRO) ' +
                 'INNER JOIN OUTRAS_SAIDAS O ' +
                 'ON (I.COD_OUTRA = O.COD_OUTRA) ' +
                 'INNER JOIN TIPO_ES T ' +
                 'ON (O.COD_ES = T.COD_ES)');
         sql.Add(' WHERE O.DATA_OUTRA BETWEEN :DATAINI AND :DATAFIN');
         if not CheckTipo.Checked then
            sql.Add(' AND O.COD_ES = ' + EdtCodTipo.Text);
         if not CheckCliente.Checked then
            sql.Add(' AND O.COD_CLI = ' + EdtCodCli.Text);
         if (not CheckEmp.Checked) then
            begin 
               sql.Add(' AND O.COD_EMP = :CODEMP');
               Parambyname('codemp').AsInteger:= iEmp;
            end;
         sql.add(' GROUP BY O.COD_ES, I.COD_PRO, P.NOME_PRO, P.VALOR_PRO, P.UNIDADE_SAIDA_PRO, P.MARGEM_LUCRO_PRO, T.NOME_ES');
         sql.Add(' ORDER BY O.COD_ES, P.NOME_PRO');
         Parambyname('dataini').AsDate  := edtdataini.Date;
         Parambyname('datafin').AsDate  := edtdatafin.Date;
         open;
      end;
   Application.CreateForm(TFrmQRelOutrasSaidas, FrmQRelOutrasSaidas);
   FrmQRelOutrasSaidas.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
   FrmQRelOutrasSaidas.QRLTitulo.Caption := 'Relatório de Outras Saídas no Período: ' +
   datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
   if not CheckCliente.Checked then
      FrmQRelOutrasSaidas.QRLCliente.Caption:= 'Cliente: ' + EdtNomeCli.Text
   else
      FrmQRelOutrasSaidas.QRLCliente.Caption:= '';
   if sender = btnvis then
      begin 
         FrmQRelOutrasSaidas.QROS.PreviewInitialState:= wsMaximized;
         FrmQRelOutrasSaidas.QROS.Preview;
      end
   else
      begin 
         FrmQRelOutrasSaidas.QROS.PrinterSetup;
         FrmQRelOutrasSaidas.QROS.Print;
      end;
   FrmQRelOutrasSaidas.QROS.QRPrinter:= nil;
   dm.IBTransaction.Commit;
   QRelOS.Close;
end;

end.
