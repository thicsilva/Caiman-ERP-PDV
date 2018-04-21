unit URelCTR;

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
  TFrmRelCTR = class(UNovoFormulario.TForm)
    Panel2: TPanel;
    GroupConv: TGroupBox;
    BtnConsConv: TsSpeedButton;
    EdtCodConv: UNovosComponentes.TEdit;
    EdtNomeConv: TEdit;
    Panel1: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    StatusBar1: TStatusBar;
    GB: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    RdgOrdem: TRadioGroup;
    QAReceber: TFDQuery;
    CheckConv: TCheckBox;
    GroupCob: TGroupBox;
    BtnConsCob: TsSpeedButton;
    EdtCodCob: UNovosComponentes.TEdit;
    EdtNomeCob: TEdit;
    CheckCob: TCheckBox;
    CheckEmp: TCheckBox;
    GBCliente: TGroupBox;
    BtnConsCli: TsSpeedButton;
    EdtCodCli: UNovosComponentes.TEdit;
    EdtNomeCli: TEdit;
    CheckCliente: TCheckBox;
    EdtDias: UNovosComponentes.TEdit;
    Rdg: TRadioGroup;
    GroupCla: TGroupBox;
    BtnConsCla: TsSpeedButton;
    EdtCodCla: UNovosComponentes.TEdit;
    EdtNomeCla: TEdit;
    CheckCla: TCheckBox;
    gbVend: TGroupBox;
    SpeedButton1: TsSpeedButton;
    edtCodVend: UNovosComponentes.TEdit;
    edtNomeVend: TEdit;
    ckVend: TCheckBox;
    QAReceberCOD_CTR: TIntegerField;
    QAReceberSEQUENCIA_CTR: TIntegerField;
    QAReceberDATA_CTR: TDateField;
    QAReceberCOD_CLI: TIntegerField;
    QAReceberCOD_COB: TIntegerField;
    QAReceberVENCTO_CTR: TDateField;
    QAReceberVALOR_CTR: TBCDField;
    QAReceberDIAS: TIntegerField;
    QAReceberDEVOLUCAO_CTR: TBCDField;
    QAReceberNUMDOCUMENTO_CTR: TStringField;
    QAReceberNOME_CLI: TStringField;
    QAReceberTELRES_CLI: TStringField;
    QAReceberTELCOM_CLI: TStringField;
    QAReceberDESCRICAO: TStringField;
    QAReceberDIAS_CARENCIA: TIntegerField;
    QAReceberJUROS_ATRASO: TBCDField;
    QAReceberCOD_VEND: TIntegerField;
    QAReceberENDRES_CLI: TStringField;
    QAReceberNUMRES_CLI: TStringField;
    QAReceberBAIRES_CLI: TStringField;
    QAReceberCIDRES_CLI: TStringField;
    QAReceberESTRES_CLI: TStringField;
    QAReceberJUROS: TCurrencyField;
    QAReceberVALOR_LIQ: TCurrencyField;
    QAReceberCOD_VENDA: TIntegerField;
    procedure BtnSairClick(Sender: TObject);
    procedure EdtCodConvExit(Sender: TObject);
    procedure EdtCodConvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodConvKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsConvClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisClick(Sender: TObject);
    procedure QAReceberCalcFields(DataSet: TDataSet);
    procedure CheckConvClick(Sender: TObject);
    procedure CheckCobClick(Sender: TObject);
    procedure EdtCodConvEnter(Sender: TObject);
    procedure BtnConsCobClick(Sender: TObject);
    procedure EdtCodCobEnter(Sender: TObject);
    procedure EdtCodCobKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodCobExit(Sender: TObject);
    procedure EdtCodCliEnter(Sender: TObject);
    procedure EdtCodCliExit(Sender: TObject);
    procedure EdtCodCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckClienteClick(Sender: TObject);
    procedure BtnConsCliClick(Sender: TObject);
    procedure RdgClick(Sender: TObject);
    procedure CheckClaClick(Sender: TObject);
    procedure EdtCodClaEnter(Sender: TObject);
    procedure EdtCodClaExit(Sender: TObject);
    procedure EdtCodClaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsClaClick(Sender: TObject);
    procedure edtCodVendExit(Sender: TObject);
    procedure ckVendClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelCTR: TFrmRelCTR;

implementation
uses
  Ubibli1, Udm, UConsConvenio, UQRelAReceber, UNovoPrincipal, UConsTipoCobranca, 
  UQRelAReceberVencto, UConsCli, UConsClassifContasReceber;
var sSql : string;

{$R *.dfm}

procedure TFrmRelCTR.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelCTR.EdtCodConvExit(Sender: TObject);
begin 
   if (btnsair.Focused) or (EdtCodConv.Text = '') then
      begin 
         EdtNomeConv.Clear;
         exit;
      end;
   EdtNomeConv.Text:= consulta('convenio', EdtCodConv, 'cod_con', 'nome_con', dm.IBTransaction, dm.qConsulta);
   if EdtNomeConv.Text = '' then
      begin 
         AlertaCad('Convênio não Cadastrado');
//         EdtCodConv.SetFocus;
      end;
end;

procedure TFrmRelCTR.EdtCodConvKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsConv.Click;
end;

procedure TFrmRelCTR.EdtCodConvKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmRelCTR.edtCodVendExit(Sender: TObject);
begin 
  if edtCodVend.Text = '' then
     exit;
  edtNomeVend.Text := consulta('vendedor', edtCodVend, 'cod_vend',
    'nome_vend', dm.IBTransaction, dm.qConsulta);
  if edtNomeVend.Text = '' then
  begin 
    edtNomeVend.Text := 'Vendedor não Encontrado';
  end;

end;

procedure TFrmRelCTR.BtnConsConvClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsConvenio, FrmConsConvenio);
   FrmConsConvenio.Tag:= 7;
   FrmConsConvenio.ShowModal;
end;

procedure TFrmRelCTR.FormShow(Sender: TObject);
begin 
   sSql := QAReceber.SQL.Text;
   CheckConv.Checked    := true;
   CheckCob.Checked     := true;
   CheckEmp.Checked     := true;
   CheckCliente.Checked := true;
   CheckCla.Checked     := true;
   ckVend.Checked := true;
   ckVendClick( nil );
   CheckConvClick(CheckConv);
   CheckCobClick(CheckCob);
   CheckClienteClick(CheckCliente);
   CheckClaClick(CheckCla);
   RdgOrdem.ItemIndex:= 0;
   edtcodconv.Clear;
   edtnomeconv.Clear;
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;
   rdg.ItemIndex:= 0;
end;

procedure TFrmRelCTR.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end; 
end;

procedure TFrmRelCTR.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRelCTR.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QAReceber.SQL.Clear;
   QAReceber.SQL.Text := sSql;
   QAReceber.Close;
   Action:= caFree;
end;

procedure TFrmRelCTR.BtnVisClick(Sender: TObject);
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
     with QAReceber do
        begin 
           close;
           sql.Clear;
           sql.Text := sSql;

            case rdg.ItemIndex of
            0:begin 
                 sql.Add(' WHERE R.VENCTO_CTR BETWEEN :DATAINI AND :DATAFIN' +
                         ' AND R.DTPAGTO_CTR IS NULL');
                 Parambyname('dataini').AsDate:= edtdataini.Date;
                 Parambyname('datafin').AsDate:= edtdatafin.Date;
              end;
            1:begin 
                 sql.Add(' WHERE R.VENCTO_CTR <= :DATA' +
                         ' AND R.DTPAGTO_CTR IS NULL');
                 Parambyname('data').AsDate:= date - strtoint(EdtDias.Text);
              end;
            2:begin 
                 sql.Add(' WHERE R.DATA_CTR <= :DATAFIN' +
                         ' AND (R.DTPAGTO_CTR IS NULL OR R.DTPAGTO_CTR > :DATAFIN)');
                 Parambyname('datafin').AsDate:= edtdatafin.Date;
              end;
           end;


           if not ckVend.Checked then
              begin 
                 sql.Add(' AND ( ( nf.cod_vend =:COD_VEND )  or ( ve.cod_vend = :COD_VEND) ) ');
                 Parambyname('COD_VEND').AsInteger := strtoint(edtCodVend.Text);

              end;

           if not CheckCliente.Checked then
              begin 
                 sql.Add(' AND C.COD_CLI = :CODCLI');
                 Parambyname('codcli').AsInteger := strtoint(EdtCodCli.Text);
              end;

           if not CheckConv.Checked then
              begin 
                 sql.Add(' AND C.COD_CON = :CODCON');
                 Parambyname('codcon').AsInteger := strtoint(EdtCodConv.Text);
              end;

           if not CheckCob.Checked then
              begin 
                 sql.Add(' AND R.COD_COB = :CODCOB');
                 Parambyname('codcob').AsInteger := strtoint(EdtCodCob.Text);
              end;

           if not CheckCla.Checked then
              begin 
                 sql.Add(' AND R.CODIGO_CLASSIFICACAO = :CODCLA');
                 Parambyname('codcla').AsInteger := strtoint(EdtCodCla.Text);
              end;

           if (not CheckEmp.Checked) then
              begin 
                 sql.Add(' AND R.COD_EMP = :CODEMP');
                 Parambyname('codemp').AsInteger:= iEmp;
              end;


           case RdgOrdem.ItemIndex of
               0: sql.Add(' ORDER BY C.NOME_CLI, C.COD_CLI, R.VENCTO_CTR');
               1: sql.Add(' ORDER BY R.VENCTO_CTR');
               2: sql.Add(' ORDER BY c.cidres_cli');
           end;

           Sql.SaveToFile( 'debug.txt' );
           open;
        end;
   if rdgordem.ItemIndex = 0 then
      begin 
         Application.CreateForm(TFrmQRelAReceber, FrmQRelAReceber);
         FrmQRelAReceber.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;

         case rdg.ItemIndex of
           0: FrmQRelAReceber.QRLTitulo.Caption := 'Relatório de Contas a Receber [vencimento] no Período de: ' +
              datetostr(EdtDataIni.Date) + ' a ' + datetostr(EdtDataFin.Date);

           1: FrmQRelAReceber.QRLTitulo.Caption := 'Relatório de Contas a Receber com vencimento até ' +
               datetostr(date - strtoint(EdtDias.Text));

           2: FrmQRelAReceber.QRLTitulo.Caption := 'Relatório de Contas a Receber [Contábil] no Período de: ' +
              datetostr(EdtDataIni.Date) + ' a ' + datetostr(EdtDataFin.Date);
         end;

         if Trim( edtCodVend.Text ) = '' then
            FrmQRelAReceber.QRVend.Caption := 'Vendedor: Todos'
         else
            FrmQRelAReceber.QRVend.Caption := 'Vendedor: ' + Trim( edtNomeVend.Text );


         if trim(EdtNomeConv.Text) = '' then
            FrmQRelAReceber.QRLConv.Caption := 'Convênio: Todos'
         else
            FrmQRelAReceber.QRLConv.Caption := 'Convênio: ' + trim(EdtNomeConv.Text);

         if trim(EdtNomeCla.Text) = '' then
            FrmQRelAReceber.QRLClassif.Caption := 'Classif.: Todas'
         else
            FrmQRelAReceber.QRLClassif.Caption := 'Classif: ' + trim(EdtNomeCla.Text);

         if sender = btnvis then
            begin 
               FrmQRelAReceber.QRCli.PreviewInitialState:= wsMaximized;
               FrmQRelAReceber.QRCli.Preview;
            end
         else
            begin 
               FrmQRelAReceber.QRCli.PrinterSetup;
               FrmQRelAReceber.QRCli.Print;
            end;
         FrmQRelAReceber.QRCli.QRPrinter:= nil;
      end
   else    if rdgordem.ItemIndex = 2 then
      begin 
         Application.CreateForm(TFrmQRelAReceber, FrmQRelAReceber);
         FrmQRelAReceber.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;

         case rdg.ItemIndex of
           0: FrmQRelAReceber.QRLTitulo.Caption := 'Relatório de Contas a Receber [vencimento] no Período de: ' +
              datetostr(EdtDataIni.Date) + ' a ' + datetostr(EdtDataFin.Date);

           1: FrmQRelAReceber.QRLTitulo.Caption := 'Relatório de Contas a Receber com vencimento até ' +
               datetostr(date - strtoint(EdtDias.Text));

           2: FrmQRelAReceber.QRLTitulo.Caption := 'Relatório de Contas a Receber [Contábil] no Período de: ' +
              datetostr(EdtDataIni.Date) + ' a ' + datetostr(EdtDataFin.Date);
         end;

         if Trim( edtCodVend.Text ) = '' then
            FrmQRelAReceber.QRVend.Caption := 'Vendedor: Todos'
         else
            FrmQRelAReceber.QRVend.Caption := 'Vendedor: ' + Trim( edtNomeVend.Text );


         if trim(EdtNomeConv.Text) = '' then
            FrmQRelAReceber.QRLConv.Caption := 'Convênio: Todos'
         else
            FrmQRelAReceber.QRLConv.Caption := 'Convênio: ' + trim(EdtNomeConv.Text);

         if trim(EdtNomeCla.Text) = '' then
            FrmQRelAReceber.QRLClassif.Caption := 'Classif.: Todas'
         else
            FrmQRelAReceber.QRLClassif.Caption := 'Classif: ' + trim(EdtNomeCla.Text);

         if sender = btnvis then
            begin 
               FrmQRelAReceber.QRCli.PreviewInitialState:= wsMaximized;
               FrmQRelAReceber.QRCli.Preview;
            end
         else
            begin 
               FrmQRelAReceber.QRCli.PrinterSetup;
               FrmQRelAReceber.QRCli.Print;
            end;
         FrmQRelAReceber.QRCli.QRPrinter:= nil;
      end
      else
      begin 
         Application.CreateForm(TFrmQRelAReceberVencto, FrmQRelAReceberVencto);
         FrmQRelAReceberVencto.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;

         case rdg.ItemIndex of
           0: FrmQRelAReceberVencto.QRLTitulo.Caption := 'Relatório de Contas a Receber [vencimento] no Período de: ' +
              datetostr(EdtDataIni.Date) + ' a ' + datetostr(EdtDataFin.Date);

           1: FrmQRelAReceberVencto.QRLTitulo.Caption := 'Relatório de Contas a Receber com vencimento até ' +
              datetostr(date - strtoint(EdtDias.Text));

           2: FrmQRelAReceberVencto.QRLTitulo.Caption := 'Relatório de Contas a Receber [Contábil] no Período de: ' +
              datetostr(EdtDataIni.Date) + ' a ' + datetostr(EdtDataFin.Date);
         end;

         FrmQRelAReceberVencto.QRLConv.Caption:= '';

         if trim(EdtNomeConv.Text) = '' then
            FrmQRelAReceberVencto.QRLConv.Caption := 'Convênio: Todos'
         else
            FrmQRelAReceberVencto.QRLConv.Caption := 'Convênio: ' + trim(EdtNomeConv.Text);

         if trim(EdtNomeCla.Text) = '' then
            FrmQRelAReceberVencto.QRLClassif.Caption := 'Classif.: Todas'
         else
            FrmQRelAReceberVencto.QRLClassif.Caption := 'Classif: ' + trim(EdtNomeCla.Text);

         if sender = btnvis then
            begin 
               FrmQRelAReceberVencto.QRCli.PreviewInitialState:= wsMaximized;
               FrmQRelAReceberVencto.QRCli.Preview;
            end
         else
            begin 
               FrmQRelAReceberVencto.QRCli.PrinterSetup;
               FrmQRelAReceberVencto.QRCli.Print;
            end;
         FrmQRelAReceberVencto.QRCli.QRPrinter:= nil;
      end;

   dm.IBTransaction.Commit;
   QAReceber.Close;
end;

procedure TFrmRelCTR.QAReceberCalcFields(DataSet: TDataSet);
begin 
   { CALCULO DO JUROS }
   if QAReceberDIAS.Value > QAReceberDIAS_CARENCIA.Value then
      QAReceberJUROS.Value:= (((QAReceberVALOR_CTR.Value - QAReceberDEVOLUCAO_CTR.Value) * (QAReceberJUROS_ATRASO.Value / 30) * QAReceberDIAS.Value) / 100)
   else
      QAReceberJUROS.Value:= 0;

   QAReceberVALOR_LIQ.Value:= QAReceberVALOR_CTR.Value - QAReceberDEVOLUCAO_CTR.value + QAReceberJUROS.Value;
end;

procedure TFrmRelCTR.CheckConvClick(Sender: TObject);
begin 
   if CheckConv.Checked then
      begin 
         EdtCodConv.Clear;
         EdtNomeConv.Clear;
         GroupConv.Enabled := false;
      end
   else
      begin 
         GroupConv.Enabled := true;
         EdtCodConv.SetFocus;
      end;
end;

procedure TFrmRelCTR.ckVendClick(Sender: TObject);
begin 
   if ckVend.Checked then
      begin 
         edtCodVend.Clear;
         edtNomeVend.Clear;
         gbVend.Enabled := false;
      end
   else
      begin 
         gbVend.Enabled := true;
         edtCodVend.SetFocus;
      end;
end;

procedure TFrmRelCTR.CheckCobClick(Sender: TObject);
begin 
   if CheckCob.Checked then
      begin 
         EdtCodCob.Clear;
         EdtNomeCob.Clear;
         GroupCob.Enabled := false;
      end
   else
      begin 
         GroupCob.Enabled := true;
         EdtCodCob.SetFocus;
      end;
end;

procedure TFrmRelCTR.EdtCodConvEnter(Sender: TObject);
begin 
   EdtCodConv.SelectAll;
end;

procedure TFrmRelCTR.BtnConsCobClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsTipoCobranca, FrmConsTipoCobranca);
   FrmConsTipoCobranca.Tag := 3;
   FrmConsTipoCobranca.ShowModal;
end;

procedure TFrmRelCTR.EdtCodCobEnter(Sender: TObject);
begin 
   EdtCodCob.SelectAll;
end;

procedure TFrmRelCTR.EdtCodCobKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsCob.Click;
end;

procedure TFrmRelCTR.EdtCodCobExit(Sender: TObject);
begin 
   if (btnsair.Focused) or (EdtCodCob.Text = '') then
      begin 
         EdtNomeCob.Clear;
         exit;
      end;
   EdtNomeCob.Text:= consulta('tipo_cobranca', EdtCodCob, 'cod_cob', 'nome_cob', dm.IBTransaction, dm.qConsulta);
   if EdtNomeCob.Text = '' then
      begin 
         AlertaCad('Tipo de Cobrança não Cadastrado');
//         EdtCodCob.SetFocus;
      end;
end;

procedure TFrmRelCTR.EdtCodCliEnter(Sender: TObject);
begin 
   EdtCodCli.SelectAll;
end;

procedure TFrmRelCTR.EdtCodCliExit(Sender: TObject);
begin 
   if (btnsair.Focused) or (EdtCodCli.Text = '') then
      begin 
         EdtNomeCli.Clear;
         exit;
      end;
   EdtNomeCli.Text:= consulta('cliente', EdtCodCli, 'cod_cli', 'nome_cli', dm.IBTransaction, dm.qConsulta);
   if EdtNomeCli.Text = '' then
      begin 
         AlertaCad('Cliente não Cadastrado');
//         EdtCodCli.SetFocus;
      end;
end;

procedure TFrmRelCTR.EdtCodCliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsCli.Click;
end;

procedure TFrmRelCTR.CheckClienteClick(Sender: TObject);
begin 
   if CheckCliente.Checked then
      begin 
         EdtCodCli.Clear;
         EdtNomeCli.Clear;
         GBCliente.Enabled := false;
      end
   else
      begin 
         GBCliente.Enabled := true;
         EdtCodCli.SetFocus;
      end;
end;

procedure TFrmRelCTR.BtnConsCliClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsCli, FrmConsCli);
   FrmConsCli.Tag:= 28;
   FrmConsCli.ShowModal;
end;

procedure TFrmRelCTR.RdgClick(Sender: TObject);
begin 
   if (rdg.ItemIndex = 0) or (rdg.ItemIndex = 2) then
      begin 
         EdtDias.Visible   := false;
         EdtDataIni.Visible:= true;
         EdtDataFin.Visible:= true;
         Label1.Visible    := true;
         gb.Caption        := 'Período';
         EdtDataIni.SetFocus;
      end
   else
      begin 
         EdtDias.Visible   := true;
         EdtDataIni.Visible:= false;
         EdtDataFin.Visible:= false;
         Label1.Visible    := false;
         gb.Caption        := 'Dias';
         EdtDias.Clear;
         EdtDias.SetFocus;
      end;
end;

procedure TFrmRelCTR.CheckClaClick(Sender: TObject);
begin 
   if CheckCla.Checked then
      begin 
         EdtCodCla.Clear;
         EdtNomeCla.Clear;
         GroupCla.Enabled := false;
      end
   else
      begin 
         GroupCla.Enabled := true;
         EdtCodCla.SetFocus;
      end;
end;

procedure TFrmRelCTR.EdtCodClaEnter(Sender: TObject);
begin 
   EdtCodCla.SelectAll;
end;

procedure TFrmRelCTR.EdtCodClaExit(Sender: TObject);
begin 
   if (btnsair.Focused) or (EdtCodCla.Text = '') then
      begin 
         EdtNomeCla.Clear;
         exit;
      end;
   EdtNomeCla.Text:= consulta('classificacao_contas_receber', EdtCodCla, 'codigo', 'descricao', dm.IBTransaction, dm.qConsulta);
   if EdtNomeCla.Text = '' then
      begin 
         AlertaCad('Classificação não Cadastrada');
//         EdtCodCla.SetFocus;
      end;
end;

procedure TFrmRelCTR.EdtCodClaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsCla.Click;
end;

procedure TFrmRelCTR.BtnConsClaClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsClassifContasReceber, FrmConsClassifContasReceber);
   FrmConsClassifContasReceber.Tag:= 2;
   FrmConsClassifContasReceber.ShowModal;
end;

end.
