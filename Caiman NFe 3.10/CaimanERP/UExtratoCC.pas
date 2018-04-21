unit UExtratoCC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DB, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmExtratoCC = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    GB4: TGroupBox;
    BtnConsConta: TsSpeedButton;
    EdtCodConta: UNovosComponentes.TEdit;
    EdtNomeConta: TEdit;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    BtnOk: TButton;
    BtnSair: TButton;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    QConsCC: TFDQuery;
    DSQConsCC: TDataSource;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    IBSQLConc: TFDQuery;
    IBTRConc: TFDTransaction;
    CheckEmp: TCheckBox;
    QConsCCCONCILIADO_LAN: TIntegerField;
    QConsCCCOD_LAN: TIntegerField;
    QConsCCDATAEMI_LAN: TDateField;
    QConsCCDATAVENC_LAN: TDateField;
    QConsCCDC_LAN: TIntegerField;
    QConsCCDOCUMENTO_LAN: TStringField;
    QConsCCHISTORICO_LAN: TStringField;
    QConsCCNUM_CHEQUE_LAN: TStringField;
    QConsCCNOME_DOC: TStringField;
    QConsCCVALOR_LAN: TBCDField;
    QConsCCCALC_DEBCRED: TStringField;
    Label10: TLabel;
    LCredito: TLabel;
    Label11: TLabel;
    LDebito: TLabel;
    procedure EdtCodContaExit(Sender: TObject);
    procedure EdtCodContaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodContaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnConsContaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodContaEnter(Sender: TObject);
    procedure QConsCCCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmExtratoCC: TFrmExtratoCC;

implementation
uses
  Udm, Ubibli1, UConsConta, UNovoPrincipal;
var  bSaldoConciliado : boolean;
var  iAuxCodCC : integer;

{$R *.dfm}

procedure TFrmExtratoCC.EdtCodContaExit(Sender: TObject);
begin 
   if BtnSair.Focused then
     exit;
  EdtNomeConta.Text:= Consulta('contas_corrente', EdtCodConta, 'cod_conta', 'nome_conta', dm.IBTransaction, dm.qConsulta);
  if EdtNomeConta.Text = '' then
     begin 
        AlertaCad('Erro ao buscar a Conta');
//        EdtCodConta.SetFocus;
     end;
end;

procedure TFrmExtratoCC.EdtCodContaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsConta.Click;
end;

procedure TFrmExtratoCC.EdtCodContaKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmExtratoCC.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmExtratoCC.BtnConsContaClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsConta, FrmConsConta);
   FrmConsConta.tag:= 6;
   FrmConsConta.showmodal;
end;

procedure TFrmExtratoCC.FormShow(Sender: TObject);
begin 
   iAuxCodCC:= 0;
   { VERIFICA SE NOS PARAMETROS ESTA USANDO SALDO CONCILIADO }
   if trim(dm.RetornaStringTabela('saldo_conciliado_cc', 'parametros', 'cod_emp', iEmp)) = 'S' then
      begin 
         bSaldoConciliado:= true;
         DBGrid1.Columns[1].Visible:= true;
      end
   else
      begin 
         bSaldoConciliado:= false;
         DBGrid1.Columns[1].Visible:= false;
      end;
   label4.Caption   := '0,00';
   label5.Caption   := '0,00';
   label8.Caption   := '0,00';
   label9.Caption   := '0,00';
   LCredito.Caption := '0,00';
   LDebito.Caption  := '0,00';
   edtdataini.Date  := date;
   edtdatafin.Date  := date;
   EdtCodConta.Clear;
   EdtNomeConta.Clear;
   EdtCodConta.SetFocus;
end;

procedure TFrmExtratoCC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QConsCC.close;
   Action:= caFree;
end;

procedure TFrmExtratoCC.BtnOkClick(Sender: TObject);
var cDebCon, cCredCon, cDeb, cCred : currency;
    cTotalCredito, cTotalDebito : currency;
begin 
   cDebCon := 0;
   cCredCon:= 0;
   cDeb    := 0;
   cCred   := 0;
   cTotalCredito := 0;
   cTotalDebito  := 0;

   if edtdatafin.Date < edtdataini.Date then
      begin 
         AlertaCad('A data final não pode ser menor que a data inicial');
         exit;
      end;

   { VERIFICA SE USA SALDO CONCILIADO }
   if bSaldoConciliado then
      begin 
         { BUSCA SALDO ANTERIOR DEBITO (CONCILIADO) }
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with dm.Consulta do
            begin 
               close;
               sql.Clear;
               sql.Add('SELECT SUM(VALOR_LAN) VALOR FROM LANCAMENTOS_CONTAS_CORRENTE ' +
                       'WHERE DATAVENC_LAN < :DATAINI AND COD_CONTA = :CODCONTA AND ' +
                       'DC_LAN = :DB AND CONCILIADO_LAN = :CONC');
               Parambyname('dataini').AsDate     := edtdataini.Date;
               Parambyname('codconta').AsInteger := strtoint(EdtCodConta.text);
               Parambyname('db').AsInteger       := 0;
               Parambyname('conc').AsInteger     := 0;
               ExecOrOpen;
               cDebCon:= Fieldbyname('valor').AsCurrency;
            end;
         dm.IBTransaction.Commit;
         dm.Consulta.Close;

         { BUSCA SALDO ANTERIOR CREDITO (CONCILIADO) }
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with dm.Consulta do
            begin 
               close;
               sql.Clear;
               sql.Add('SELECT SUM(VALOR_LAN) VALOR FROM LANCAMENTOS_CONTAS_CORRENTE ' +
                       'WHERE DATAVENC_LAN < :DATAINI AND COD_CONTA = :CODCONTA AND ' +
                       'DC_LAN = :DB AND CONCILIADO_LAN = :CONC');
               Parambyname('dataini').AsDate     := edtdataini.Date;
               Parambyname('codconta').AsInteger := strtoint(EdtCodConta.text);
               Parambyname('db').AsInteger       := 1;
               Parambyname('conc').AsInteger     := 0;
               ExecOrOpen;
               cCredCon:= Fieldbyname('valor').AsCurrency;
            end;
         dm.IBTransaction.Commit;
         dm.Consulta.Close;
      end;

   { BUSCA SALDO ANTERIOR DEBITO }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.Consulta do
      begin 
         close;
         sql.Clear;
         sql.Add('SELECT SUM(VALOR_LAN) VALOR FROM LANCAMENTOS_CONTAS_CORRENTE ' +
                 'WHERE DATAVENC_LAN < :DATAINI AND COD_CONTA = :CODCONTA AND ' +
                 'DC_LAN = :DB');
         Parambyname('dataini').AsDate     := edtdataini.Date;
         Parambyname('codconta').AsInteger := strtoint(EdtCodConta.text);
         Parambyname('db').AsInteger       := 0;
         ExecOrOpen;
         cDeb:= Fieldbyname('valor').AsCurrency;
      end;
   dm.IBTransaction.Commit;
   dm.Consulta.Close;

   { BUSCA SALDO ANTERIOR CREDITO }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.Consulta do
      begin 
         close;
         sql.Clear;
         sql.Add('SELECT SUM(VALOR_LAN) VALOR FROM LANCAMENTOS_CONTAS_CORRENTE ' +
                 'WHERE DATAVENC_LAN < :DATAINI AND COD_CONTA = :CODCONTA AND ' +
                 'DC_LAN = :DB');
         Parambyname('dataini').AsDate     := edtdataini.Date;
         Parambyname('codconta').AsInteger := strtoint(EdtCodConta.text);
         Parambyname('db').AsInteger       := 1;
         ExecOrOpen;
         cCred:= Fieldbyname('valor').AsCurrency;
      end;
   dm.IBTransaction.Commit;
   dm.Consulta.Close;

   label4.Caption:= currtostrf(cCred - cDeb, ffnumber, 2);
   label5.Caption:= currtostrf(cCredCon - cDebCon, ffnumber, 2);

   { busca o movimento }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsCC do
      begin 
         close;
         Parambyname('dataini').Value  := edtdataini.Date;
         Parambyname('datafin').Value  := edtdatafin.Date;
         Parambyname('codconta').AsInteger := strtoint(EdtCodConta.text);
         open;
         DisableControls;
         while not eof do
            begin 
               if QConsCCDC_LAN.AsInteger = 0 then
                  cTotalDebito:= cTotalDebito + QConsCCVALOR_LAN.AsCurrency
               else
                  cTotalCredito:= cTotalCredito + QConsCCVALOR_LAN.AsCurrency;

               if bSaldoConciliado then
                  begin 
                     if (QConsCCCONCILIADO_LAN.AsInteger = 0) and (QConsCCDC_LAN.AsInteger = 0) then
                        begin 
                           cDebCon:= cDebCon + QConsCCVALOR_LAN.AsCurrency;
                           cDeb   := cDeb    + QConsCCVALOR_LAN.AsCurrency;
                        end
                     else
                        if (QConsCCCONCILIADO_LAN.AsInteger = 0) and (QConsCCDC_LAN.AsInteger = 1) then
                           begin 
                              cCredCon:= cCredCon + QConsCCVALOR_LAN.AsCurrency;
                              cCred   := cCred    + QConsCCVALOR_LAN.AsCurrency;
                           end
                        else
                           if (QConsCCCONCILIADO_LAN.AsInteger = 1) and (QConsCCDC_LAN.AsInteger = 0) then
                              cDeb:= cDeb + QConsCCVALOR_LAN.AsCurrency
                           else
                              if (QConsCCCONCILIADO_LAN.AsInteger = 1) and (QConsCCDC_LAN.AsInteger = 1) then
                                 cCred:= cCred + QConsCCVALOR_LAN.AsCurrency;
                  end
               else
                  begin 
                     if QConsCCDC_LAN.AsInteger = 0 then
                        cDeb := cDeb + QConsCCVALOR_LAN.AsCurrency
                     else
                        cCred:= cCred + QConsCCVALOR_LAN.AsCurrency;
                  end;
               next;
            end;
         First;
         EnableControls;
         if iAuxCodCC > 0 then
            Locate('COD_LAN', iAuxCodCC, []);
         label8.Caption:= currtostrf(cCred - cDeb, ffnumber, 2);
         label9.Caption:= currtostrf(cCredCon - cDebCon, ffnumber, 2);

         LCredito.Caption:= currtostrf(cTotalCredito, ffnumber, 2);
         LDebito.Caption := currtostrf(cTotalDebito, ffnumber, 2);
      end;
end;

procedure TFrmExtratoCC.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin 
   { VERIFICA SE USA SALDO CONCILIADO }
   if bSaldoConciliado then
      begin 
         if QConsCCCONCILIADO_LAN.AsInteger = 1 then
            begin 
               DBGrid1.Canvas.Font.Color:= clRed;
               Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
            end;
         end;
end;

procedure TFrmExtratoCC.DBGrid1DblClick(Sender: TObject);
begin 
   { VERIFICA SE USA SALDO CONCILIADO }
   if bSaldoConciliado then
      begin 
         if QConsCCCONCILIADO_LAN.AsInteger = 1 then
            begin 
               if IBTRConc.Active then
                  IBTRConc.Commit;
               IBTRConc.StartTransaction;
               with IBSQLConc do
                  begin 
                     close;
                     sql.Clear;
                     sql.Add('UPDATE LANCAMENTOS_CONTAS_CORRENTE ' +
                             'SET CONCILIADO_LAN = 0 ' +
                             'WHERE COD_LAN = :CODLAN');
                     Parambyname('codlan').AsInteger:= QConsCCCOD_LAN.AsInteger;
                     ExecOrOpen;
                  end;
               IBTRConc.Commit;
               IBSQLConc.Close;
            end
         else
            begin 
               if IBTRConc.Active then
                  IBTRConc.Commit;
               IBTRConc.StartTransaction;
               with IBSQLConc do
                  begin 
                     close;
                     sql.Clear;
                     sql.Add('UPDATE LANCAMENTOS_CONTAS_CORRENTE ' +
                             'SET CONCILIADO_LAN = 1 ' +
                             ' WHERE COD_LAN = :CODLAN');
                     Parambyname('codlan').AsInteger:= QConsCCCOD_LAN.AsInteger;
                     ExecOrOpen;
                  end;
               IBTRConc.Commit;
               IBSQLConc.Close;
            end;
         iAuxCodCC:= QConsCCCOD_LAN.AsInteger;
         btnok.Click;
      end;
end;

procedure TFrmExtratoCC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmExtratoCC.EdtCodContaEnter(Sender: TObject);
begin 
   EdtCodConta.SelectAll;
end;

procedure TFrmExtratoCC.QConsCCCalcFields(DataSet: TDataSet);
begin 
   case QConsCCDC_LAN.AsInteger of
    0:QConsCCCALC_DEBCRED.AsString:= 'DÉBITO';
    1:QConsCCCALC_DEBCRED.AsString:= 'CRÉDITO';
   end;
end;

end.
