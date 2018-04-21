unit URelRecebimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmRelRecebimento = class(UNovoFormulario.TForm)
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
    GroupBox3: TGroupBox;
    ComboCaixa: TComboBox;
    CheckEmp: TCheckBox;
    RdgOrdem: TRadioGroup;
    GBConvenio: TGroupBox;
    BtnConsConv: TsSpeedButton;
    EdtCodConv: UNovosComponentes.TEdit;
    EdtNomeConv: TEdit;
    QRecDet: TFDQuery;
    QRecDetCOD_CTR: TIntegerField;
    QRecDetSEQUENCIA_CTR: TIntegerField;
    QRecDetVENCTO_CTR: TDateField;
    QRecDetDTPAGTO_CTR: TDateField;
    QRecDetVALOR_CTR: TBCDField;
    QRecDetACRESCIMO_RECEBIDO_CTR: TBCDField;
    QRecDetVLRPAGO_CTR: TBCDField;
    QRecDetNOME_CLI: TStringField;
    QRecDetDEVOLUCAO_CTR: TBCDField;
    QRecDetDESCONTO_CONCEDIDO_CTR: TBCDField;
    RdgTipo: TRadioGroup;
    CheckConvenio: TCheckBox;
    QRecRes: TFDQuery;
    QRecResVALOR_BRUTO: TBCDField;
    QRecResACRES_RECEBIDO: TBCDField;
    QRecResVALOR_PAGO: TBCDField;
    QRecResDEVOLUCAO: TBCDField;
    QRecResDESC_CONCEDIDO: TBCDField;
    QRecResNOME_CLI: TStringField;
    QRecResCOD_CLI: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtCodConvExit(Sender: TObject);
    procedure EdtCodConvKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodConvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsConvClick(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckConvenioClick(Sender: TObject);
    procedure RdgTipoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelRecebimento: TFrmRelRecebimento;

implementation
uses
  Udm, Ubibli1, UConsConvenio, UQRelRecebidas, UQRelRecebidasRes, 
  UNovoPrincipal;
var sSqlDet, sSqlRes: string;

{$R *.dfm}

procedure TFrmRelRecebimento.FormCreate(Sender: TObject);
begin 
   { BUSCA CAIXAS }
   
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QCaixa do
      begin 
         close;
         sql.Clear;
         sql.Text:= 'SELECT * FROM CAIXA ORDER BY COD_CAI';
         open;
         First;
         ComboCaixa.Items.Clear;
         combocaixa.Items.Add('TODOS');
         while not eof do
            begin 
               combocaixa.Items.Add(dm.QCaixaCOD_CAI.AsString + '-' + dm.QCaixaDESC_CAI.Value);
               next;
            end;
      end;
   dm.IBTransaction.Commit;
   dm.QCaixa.Close;
end;

procedure TFrmRelRecebimento.BtnSairClick(Sender: TObject);
begin 
   close; 
end;

procedure TFrmRelRecebimento.FormShow(Sender: TObject);
begin 
   sSqlDet:= QRecDet.SQL.Text;
   sSqlRes:= QRecRes.SQL.Text;
   CheckConvenio.Checked:= true;
   CheckConvenioClick(CheckConvenio);
   RdgTipo.ItemIndex:= 1;
   edtdataini.Date:= date;
   EdtDataFin.Date:= date;
   CheckEmp.Checked:= true;
   ComboCaixa.ItemIndex:= 0;
   RdgOrdem.ItemIndex:= 0;
   EdtDataIni.SetFocus;
end;

procedure TFrmRelRecebimento.EdtCodConvExit(Sender: TObject);
begin 
   if EdtCodConv.Text = '' then
      EdtNomeConv.Clear
   else
      begin 
         EdtNomeConv.Text:= consulta('convenio', EdtCodConv, 'cod_con', 'nome_con', dm.IBTransaction, dm.qConsulta);
         if EdtNomeConv.Text = '' then
            begin 
               AlertaCad('Convênio não Cadastrado');
//               EdtCodConv.SetFocus;
               EdtCodConv.SelectAll;
            end;
      end;
end;

procedure TFrmRelRecebimento.EdtCodConvKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmRelRecebimento.EdtCodConvKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsConv.Click;
end;

procedure TFrmRelRecebimento.BtnConsConvClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsConvenio, FrmConsConvenio);
   FrmConsConvenio.Tag:= 8;
   FrmConsConvenio.ShowModal;
end;

procedure TFrmRelRecebimento.BtnVisClick(Sender: TObject);
begin 
   if edtdatafin.Date < edtdataini.Date then
      begin 
         AlertaCad('A data final não pode ser menor que a data inicial');
//         Edtdataini.SetFocus;
         exit;
      end;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   if RdgTipo.ItemIndex = 0 then
      begin 
         with QRecDet do
            begin 
               close;
               sql.Clear;
               sql.Text:= sSqlDet;
               sql.Add(' WHERE R.DTPAGTO_CTR BETWEEN :DATAINI AND :DATAFIN');
               if not CheckConvenio.Checked then
                  begin 
                     sql.Add(' AND C.COD_CON = :CODCON');
                     Parambyname('codcon').AsInteger:= strtoint(EdtCodConv.Text);
                  end;

               if ComboCaixa.ItemIndex > 0 then
                  begin 
                     sql.Add(' AND R.COD_CAI = :CODCAI');
                     Parambyname('codcai').AsInteger:= strtoint(copy(ComboCaixa.Text, 1, 1));
                  end;

               if (not CheckEmp.Checked) then
                  begin 
                     sql.Add(' AND R.COD_EMP = :CODEMP');
                     Parambyname('codemp').AsInteger:= iEmp;
                  end;

               if RdgOrdem.ItemIndex = 0 then
                  sql.Add(' ORDER BY C.NOME_CLI')
               else
                  sql.Add(' ORDER BY R.DTPAGTO_CTR');
               Parambyname('dataini').AsDate  := edtdataini.Date;
               Parambyname('datafin').AsDate  := edtdatafin.Date;
               open;
            end;
         Application.CreateForm(TFrmQRelRecebidas, FrmQRelRecebidas);
         FrmQRelRecebidas.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
         FrmQRelRecebidas.QRLTitulo.Caption:= 'Relatório de Contas Recebidas no Período: ' +
         datetostr(edtdataini.Date) + ' à ' + datetostr(edtdatafin.Date);
         if CheckConvenio.Checked then
            FrmQRelRecebidas.QRLConv.Caption:= 'Convênio: Todos'
         else
            FrmQRelRecebidas.QRLConv.Caption:= 'Convênio: ' + EdtNomeConv.Text;

         if sender = btnvis then
            begin 
               FrmQRelRecebidas.QRCli.PreviewInitialState:= wsMaximized;
               FrmQRelRecebidas.QRCli.Preview;
            end
         else
            begin 
               FrmQRelRecebidas.QRCli.PrinterSetup;
               FrmQRelRecebidas.QRCli.Print;
            end;
         FrmQRelRecebidas.QRCli.QRPrinter:= nil;
         dm.IBTransaction.Commit;
         QRecDet.Close;
      end
   else
      begin 
         with QRecRes do
            begin 
               close;
               sql.Clear;
               sql.Text:= sSqlRes;
               sql.Add(' WHERE R.DTPAGTO_CTR BETWEEN :DATAINI AND :DATAFIN');
               if not CheckConvenio.Checked then
                  begin 
                     sql.Add(' AND C.COD_CON = :CODCON');
                     Parambyname('codcon').AsInteger:= strtoint(EdtCodConv.Text);
                  end;

               if ComboCaixa.ItemIndex > 0 then
                  begin 
                     sql.Add(' AND R.COD_CAI = :CODCAI');
                     Parambyname('codcai').AsInteger:= strtoint(copy(ComboCaixa.Text, 1, 1));
                  end;

               if (not CheckEmp.Checked) then
                  begin 
                     sql.Add(' AND R.COD_EMP = :CODEMP');
                     Parambyname('codemp').AsInteger:= iEmp;
                  end;
               sql.add(' GROUP BY R.COD_CLI, C.NOME_CLI');

               if RdgOrdem.ItemIndex = 0 then
                  sql.Add(' ORDER BY C.NOME_CLI')
               else
                  sql.Add(' ORDER BY R.COD_CLI');
               Parambyname('dataini').AsDate:= edtdataini.Date;
               Parambyname('datafin').AsDate:= edtdatafin.Date;
               open;
            end;
         Application.CreateForm(TFrmQRelRecebidasRes, FrmQRelRecebidasRes);
         FrmQRelRecebidasRes.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
         FrmQRelRecebidasRes.QRLTitulo.Caption:= 'Relatório de Contas Recebidas no Período: ' +
         datetostr(edtdataini.Date) + ' à ' + datetostr(edtdatafin.Date);
         if CheckConvenio.Checked then
            FrmQRelRecebidasRes.QRLConvenio.Caption:= 'Convênio: Todos'
         else
            FrmQRelRecebidasRes.QRLConvenio.Caption:= 'Convênio: ' + EdtNomeConv.Text;

         if sender = btnvis then
            begin 
               FrmQRelRecebidasRes.QRCli.PreviewInitialState:= wsMaximized;
               FrmQRelRecebidasRes.QRCli.Preview;
            end
         else
            begin 
               FrmQRelRecebidasRes.QRCli.PrinterSetup;
               FrmQRelRecebidasRes.QRCli.Print;
            end;
         FrmQRelRecebidasRes.QRCli.QRPrinter:= nil;
         dm.IBTransaction.Commit;
         QRecRes.Close;
      end;
end;

procedure TFrmRelRecebimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QRecDet.SQL.Clear;
   QRecDet.SQL.Text:= sSqlDet;
   QRecDet.Close;

   QRecRes.SQL.Clear;
   QRecRes.SQL.Text:= sSqlRes;
   QRecRes.Close;

   Action:= caFree;
end;

procedure TFrmRelRecebimento.CheckConvenioClick(Sender: TObject);
begin 
   CheckConvenio.SetFocus;
   EdtCodConv.Clear;
   EdtNomeConv.Clear;
   if CheckConvenio.Checked then
      GBConvenio.Enabled:= false
   else
      begin 
         GBConvenio.Enabled:= true;
         EdtCodConv.SetFocus;
      end;
end;

procedure TFrmRelRecebimento.RdgTipoClick(Sender: TObject);
begin 
   if RdgTipo.ItemIndex = 0 then
      RdgOrdem.Items[1]:= 'Data Pagamento'
   else
      RdgOrdem.Items[1]:= 'Código';
end;

end.
