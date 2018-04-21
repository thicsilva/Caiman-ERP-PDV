unit URelAMR;

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
  TFrmRelAMR = class(UNovoFormulario.TForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    CheckEmp: TCheckBox;
    Panel1: TPanel;
    BtnSair: TBitBtn;
    BtnImp: TBitBtn;
    BtnVis: TBitBtn;
    SB: TStatusBar;
    QAux: TFDQuery;
    QAuxDIAS: TIntegerField;
    QAuxVALOR: TBCDField;
    QRel: TFDQuery;
    QRelDIAS: TIntegerField;
    QRelVALOR: TBCDField;
    QRelTOTAL: TBCDField;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelAMR: TFrmRelAMR;

implementation
uses
  Udm, UQRelAMR, UNovoPrincipal;

{$R *.dfm}

procedure TFrmRelAMR.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRelAMR.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelAMR.FormShow(Sender: TObject);
begin 
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;
   EdtDataIni.SetFocus;
end;

procedure TFrmRelAMR.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelAMR.BtnVisClick(Sender: TObject);
var cTotalVendas, cAuxTotal : currency;
begin 
   cTotalVendas:= 0;
   cAuxTotal   := 0;
   {limpar a tabela}
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.Consulta do
          begin 
             close;
             sql.Clear;
             sql.add('UPDATE PRAZO_ATRASO_MEDIO SET VALOR = 0 WHERE TIPO = 2');
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao limpar a tabela');
     end;
   finally
     dm.Consulta.Close;
   end;

   {buscar o total das vendas}
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.Consulta do
          begin 
             close;
             sql.Clear;
             sql.add('SELECT SUM(TOTAL_VEN) TOTAL FROM VENDAS ' +
                     'WHERE DATA_VEN BETWEEN :DATAINI AND :DATAFIN');
             if (not CheckEmp.Checked) then
                begin 
                   sql.Add(' AND COD_EMP = :CODEMP');
                   Parambyname('codemp').AsInteger:= iEmp;
                end;
             Parambyname('dataini').AsDate := edtdataini.Date;
             Parambyname('datafin').AsDate := EdtDataFin.Date;
             ExecOrOpen;
             cTotalVendas:= fieldbyname('total').AsCurrency;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       cTotalVendas:= 0;
       AlertaCad('Erro ao limpar a tabela');
     end;
   finally
     dm.Consulta.Close;
   end;

   {buscar as prestacoes para atualizar a tabela}
   sb.SimpleText:= 'Verificando as parcelas';
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QAux do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT (DTPAGTO_CTR - VENCTO_CTR) DIAS, (VLRPAGO_CTR - ACRESCIMO_RECEBIDO_CTR) VALOR ' +
                 'FROM CONTAS_RECEBER ' +
                 'WHERE DTPAGTO_CTR BETWEEN :DATAINI AND :DATAFIN');
         if (not CheckEmp.Checked) then
            begin 
               sql.Add(' AND COD_EMP = :CODEMP');
               Parambyname('codemp').AsInteger:= iEmp;
            end;
         Parambyname('dataini').AsDate := edtdataini.Date;
         Parambyname('datafin').AsDate := EdtDataFin.Date;
         open;
         while not eof do
            begin 
               try
                 dm.Consulta.Close;
                 dm.Consulta.SQL.Clear;
                 dm.Consulta.SQL.add('INSERT INTO PRAZO_ATRASO_MEDIO (DIAS, VALOR, TIPO) ' +
                                     'VALUES(:DIAS, :VALOR, :TIPO)');
                 dm.Consulta.ParamByName('dias').AsInteger:= fieldbyname('dias').AsInteger;
                 dm.Consulta.ParamByName('tipo').AsInteger:= 2;
                 dm.Consulta.ParamByName('valor').AsCurrency:= fieldbyname('valor').AsCurrency;
                 dm.Consulta.ExecOrOpen;
               except
                 dm.Consulta.Close;
                 dm.Consulta.SQL.Clear;
                 dm.Consulta.SQL.add('UPDATE PRAZO_ATRASO_MEDIO SET ' +
                                     'VALOR = VALOR + :VALOR WHERE DIAS = :DIAS AND TIPO = :TIPO');
                 dm.Consulta.ParamByName('dias').AsInteger:= fieldbyname('dias').AsInteger;
                 dm.Consulta.ParamByName('tipo').AsInteger:= 2;
                 dm.Consulta.ParamByName('valor').AsCurrency:= fieldbyname('valor').AsCurrency;
                 dm.Consulta.ExecOrOpen;
               end;
               next;
            end;
      end;
   dm.IBTransaction.Commit;
   QAux.close;
   dm.Consulta.Close;
   SB.SimpleText:= '';

   {Gera o Sql para o Relatório}
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRel do
     begin 
        close;
        open;
        while not Eof do
           begin 
              cAuxTotal:= cAuxTotal + fieldbyname('total').AsCurrency;
              next;
           end;
        First;
     end;

  Application.CreateForm(TFrmQRelAMR, FrmQRelAMR);
  FrmQRelAMR.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
  FrmQRelAMR.QRLTitulo.Caption:= 'Relatório de Atraso Médio de Recebimento no período: ' +
  datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
  FrmQRelAMR.QRLTotal.Caption  := CurrToStrF(cAuxTotal / cTotalVendas, ffNumber, 2);
  FrmQRelAMR.QRLVendas.Caption := CurrToStrF(cTotalVendas, ffNumber, 2);
  if sender = btnvis then
     begin 
        FrmQRelAMR.QRAMR.PreviewInitialState:= wsMaximized;
        FrmQRelAMR.QRAMR.Preview;
     end
  else
     begin 
        FrmQRelAMR.QRAMR.PrinterSetup;
        FrmQRelAMR.QRAMR.Print;
     end;
  FrmQRelAMR.QRAMR.QRPrinter:= nil;
  dm.IBTransaction.Commit;
  QRel.Close;
end;

end.
