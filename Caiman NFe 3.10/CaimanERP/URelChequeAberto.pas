unit URelChequeAberto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmRelCheque = class(UNovoFormulario.TForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    CheckEmp: TCheckBox;
    Panel1: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    StatusBar1: TStatusBar;
    Rdg: TRadioGroup;
    QRelCheques: TFDQuery;
    QRelChequesCOD_CHE: TIntegerField;
    QRelChequesCOD_CLI: TIntegerField;
    QRelChequesCOD_BANCO: TIntegerField;
    QRelChequesAGENCIA_CHE: TStringField;
    QRelChequesCONTA_CHE: TStringField;
    QRelChequesNUMERO_CHE: TStringField;
    QRelChequesEMISSAO_CHE: TDateField;
    QRelChequesVENCTO_CHE: TDateField;
    QRelChequesVALOR_CHE: TBCDField;
    QRelChequesCOD_CONTA: TIntegerField;
    QRelChequesPRIDEP_CHE: TDateField;
    QRelChequesSEGDEP_CHE: TDateField;
    QRelChequesPRIDEV_CHE: TDateField;
    QRelChequesSEGDEV_CHE: TDateField;
    QRelChequesPAGTODEV_CHE: TDateField;
    QRelChequesOBS_CHE: TStringField;
    QRelChequesCOD_EMP: TIntegerField;
    QRelChequesNOME_CLI: TStringField;
    QRelChequesNOME_BAN: TStringField;
    QRelChequesNOME_CONTA: TStringField;
    QRelChequesCOD_CTR: TIntegerField;
    QRelChequesCOD_VENDA: TIntegerField;
    QRelChequesDESTINO_CHE: TStringField;
    QRelChequesCOD_REPASSE: TIntegerField;
    QRelChequesSELECIONADO_CHE: TStringField;
    GBCliente: TGroupBox;
    BtnConsCli: TsSpeedButton;
    EdtCodCli: UNovosComponentes.TEdit;
    EdtNomeCli: TEdit;
    CheckCliente: TCheckBox;
    QRelChequesEMITENTE: TStringField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnVisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckClienteClick(Sender: TObject);
    procedure EdtCodCliEnter(Sender: TObject);
    procedure BtnConsCliClick(Sender: TObject);
    procedure EdtCodCliKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodCliExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelCheque: TFrmRelCheque;

implementation
uses
  Udm, Ubibli1, UQRelChequeAberto, UNovoPrincipal, UConsCli;
var  sSql : string;

{$R *.dfm}

procedure TFrmRelCheque.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelCheque.FormShow(Sender: TObject);
begin 
   sSql:= QRelCheques.SQL.Text;
   CheckCliente.Checked:= true;
   CheckClienteClick(sender);
   rdg.ItemIndex  := 0;
   edtdataini.Date:= date;
   edtdatafin.Date:= date;
   edtdataini.SetFocus;
end;

procedure TFrmRelCheque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRelCheque.BtnVisClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRelCheques do
      begin 
         close;
         sql.Clear;
         sql.Text:= sSql;
         case rdg.ItemIndex of
           0:begin  //em aberto
                sql.Add(' WHERE CHE.PRIDEP_CHE IS NULL AND CHE.VENCTO_CHE' +
                        ' BETWEEN :DATAINI AND :DATAFIN');

                if not CheckCliente.Checked then
                    begin 
                       sql.add(' AND (CHE.COD_CLI = :CODCLI OR CHE.COD_EMITENTE = :CODEMI)');
                       Parambyname('codcli').AsInteger:= strtoint(EdtCodCli.Text);
                       Parambyname('codemi').AsInteger:= strtoint(EdtCodCli.Text);
                    end;

                if (not CheckEmp.Checked) then
                    begin 
                       sql.add(' AND CHE.COD_EMP = :CODEMP');
                       Parambyname('codemp').AsInteger:= iEmp;
                    end;
                sql.add(' ORDER BY CHE.VENCTO_CHE, CHE.COD_CHE');
                Parambyname('dataini').AsDate := edtdataini.Date;
                Parambyname('datafin').AsDate := edtdatafin.Date;
             end;
           1:begin  //devolvidos
                sql.Add(' WHERE (CHE.PRIDEV_CHE BETWEEN :DATAINI AND :DATAFIN OR' +
                        ' CHE.SEGDEV_CHE BETWEEN :DATAINI AND :DATAFIN)');

                if not CheckCliente.Checked then
                    begin 
                       sql.add(' AND (CHE.COD_CLI = :CODCLI OR CHE.COD_EMITENTE = :CODEMI)');
                       Parambyname('codcli').AsInteger:= strtoint(EdtCodCli.Text);
                       Parambyname('codemi').AsInteger:= strtoint(EdtCodCli.Text);
                    end;

                if (not CheckEmp.Checked) then
                    begin 
                       sql.add(' AND (CHE.COD_EMP = :CODEMP)');
                       Parambyname('codemp').AsInteger:= iEmp;
                    end;
                sql.add(' ORDER BY CHE.EMISSAO_CHE, CHE.COD_CHE');
                Parambyname('dataini').AsDate := edtdataini.Date;
                Parambyname('datafin').AsDate := edtdatafin.Date;
             end;
           2:begin  //pagos
                sql.Add(' WHERE CHE.PAGTODEV_CHE BETWEEN :DATAINI AND :DATAFIN');
                if not CheckCliente.Checked then
                    begin 
                       sql.add(' AND (CHE.COD_CLI = :CODCLI OR CHE.COD_EMITENTE = :CODEMI)');
                       Parambyname('codcli').AsInteger:= strtoint(EdtCodCli.Text);
                       Parambyname('codemi').AsInteger:= strtoint(EdtCodCli.Text);
                    end;

                if (not CheckEmp.Checked) then
                    begin 
                       sql.add(' AND CHE.COD_EMP = :CODEMP');
                       Parambyname('codemp').AsInteger:= iEmp;
                    end;

                sql.Add(' ORDER BY CHE.PAGTODEV_CHE');
                Parambyname('dataini').AsDate := edtdataini.Date;
                Parambyname('datafin').AsDate := edtdatafin.Date;
             end;
           3:begin  //depositados
                sql.Add(' WHERE (CHE.PRIDEP_CHE BETWEEN :DATAINI AND :DATAFIN OR' +
                        ' CHE.SEGDEP_CHE BETWEEN :DATAINI AND :DATAFIN)');
                if not CheckCliente.Checked then
                    begin 
                       sql.add(' AND (CHE.COD_CLI = :CODCLI OR CHE.COD_EMITENTE = :CODEMI)');
                       Parambyname('codcli').AsInteger:= strtoint(EdtCodCli.Text);
                       Parambyname('codemi').AsInteger:= strtoint(EdtCodCli.Text);
                    end;

                if (not CheckEmp.Checked) then
                    begin 
                       sql.add(' AND (CHE.COD_EMP = :CODEMP)');
                       Parambyname('codemp').AsInteger:= iEmp;
                    end;
                sql.Add(' ORDER BY CHE.EMISSAO_CHE');
                Parambyname('dataini').AsDate := edtdataini.Date;
                Parambyname('datafin').AsDate := edtdatafin.Date;
             end;
           4:begin  //todos
                if not CheckCliente.Checked then
                   begin 
                      sql.add(' WHERE (CHE.COD_CLI = :CODCLI OR CHE.COD_EMITENTE = :CODEMI)');
                      Parambyname('codcli').AsInteger:= strtoint(EdtCodCli.Text);
                      Parambyname('codemi').AsInteger:= strtoint(EdtCodCli.Text);
                   end;
                if (not CheckEmp.Checked) then
                   begin 
                      sql.Add(' AND CHE.COD_EMP = :CODEMP');
                      Parambyname('codemp').AsInteger:= iEmp;
                   end;
                sql.add(' ORDER BY EMISSAO_CHE');
             end;
         end;
         Open;
      end;
   Application.CreateForm(TFrmQRelCheque, FrmQRelCheque);
   FrmQRelCheque.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
   if rdg.ItemIndex = 0  then
      begin 
         FrmQRelCheque.DetailBand1.Height:= 15;
         FrmQRelCheque.DetailBand1.Frame.DrawBottom:= false;
      end
   else
      begin 
         FrmQRelCheque.DetailBand1.Height:= 39;
         FrmQRelCheque.DetailBand1.Frame.DrawBottom:= true;
      end;
   case rdg.ItemIndex of
    0: FrmQRelCheque.QRLTitulo.Caption:= 'Relatório de Cheques em Aberto no Período: ' +
          datetostr(edtdataini.Date) + ' à ' + datetostr(edtdatafin.Date);
    1: FrmQRelCheque.QRLTitulo.Caption:= 'Relatório de Cheques Devolvidos no Período: ' +
          datetostr(edtdataini.Date) + ' à ' + datetostr(edtdatafin.Date);
    2: FrmQRelCheque.QRLTitulo.Caption:= 'Relatório de Cheques Pagos no Período: ' +
          datetostr(edtdataini.Date) + ' à ' + datetostr(edtdatafin.Date);
    3: FrmQRelCheque.QRLTitulo.Caption:= 'Relatório de Cheques Depositados no Período: ' +
          datetostr(edtdataini.Date) + ' à ' + datetostr(edtdatafin.Date);
    4: begin 
          if not CheckCliente.Checked then
             FrmQRelCheque.QRLTitulo.Caption:= 'Relatório de Cheques do Cliente: ' + trim(EdtNomeCli.Text)
          else
             FrmQRelCheque.QRLTitulo.Caption:= 'Relatório de Cheques do Cliente: Todos';
       end;
   end;
   if sender = btnvis then
      begin 
         FrmQRelCheque.QRCheque.PreviewInitialState:= wsMaximized;
         FrmQRelCheque.QRCheque.Preview;
      end
   else
      begin 
         FrmQRelCheque.QRCheque.PrinterSetup;
         FrmQRelCheque.QRCheque.Print;
      end;
   FrmQRelCheque.QRCheque.QRPrinter:= nil;
end;

procedure TFrmRelCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QRelCheques.SQL.Clear;
   QRelCheques.SQL.Text:= sSql;
   QRelCheques.close;
   Action:= caFree;
end;

procedure TFrmRelCheque.CheckClienteClick(Sender: TObject);
begin 
   CheckCliente.SetFocus;
   EdtCodCli.Clear;
   EdtNomeCli.Clear;
   if CheckCliente.Checked then
      GBCliente.Enabled:= false
   else
      begin 
         GBCliente.Enabled:= true;
         EdtCodCli.SetFocus;
      end;
end;

procedure TFrmRelCheque.EdtCodCliEnter(Sender: TObject);
begin 
   EdtCodCli.SelectAll;
end;

procedure TFrmRelCheque.BtnConsCliClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsCli, FrmConsCli);
   FrmConsCli.Tag:= 39;
   FrmConsCli.ShowModal;
end;

procedure TFrmRelCheque.EdtCodCliKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmRelCheque.EdtCodCliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsCli.Click;
end;

procedure TFrmRelCheque.EdtCodCliExit(Sender: TObject);
begin 
   if (BtnSair.Focused) or (CheckCliente.Focused) then
      exit;
   EdtNomeCli.Text := consulta('cliente', EdtCodCli, 'cod_cli', 'nome_cli', dm.IBTransaction, dm.qConsulta);
   if EdtNomeCli.Text = '' then
      begin 
         AlertaCad('Cliente não Cadastrado');
//         EdtCodCli.SetFocus;
      end;
end;

end.
