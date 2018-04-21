unit URelPMV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmRelPMV = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SB: TStatusBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    CheckEmp: TCheckBox;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    QAux: TFDQuery;
    QRel: TFDQuery;
    QRelDIAS: TIntegerField;
    QRelVALOR: TBCDField;
    QRelTOTAL: TBCDField;
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelPMV: TFrmRelPMV;

implementation
uses
  Udm, UQRelPMV, UNovoPrincipal;

{$R *.dfm}

procedure TFrmRelPMV.FormShow(Sender: TObject);
begin 
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;
   EdtDataIni.SetFocus;
end;

procedure TFrmRelPMV.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelPMV.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelPMV.FormCreate(Sender: TObject);
begin 
   
end;

procedure TFrmRelPMV.BtnVisClick(Sender: TObject);
begin 
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
             sql.add('UPDATE PRAZO_ATRASO_MEDIO SET VALOR = 0 WHERE TIPO = 1');
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

   {buscar as prestacoes para atualizar a tabela}
   sb.SimpleText:= 'Verificando as parcelas';
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QAux do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT (VENCTO_CTR - DATA_CTR) DIAS, VALOR_CTR ' +
                 'FROM CONTAS_RECEBER ' +
                 'WHERE DATA_CTR BETWEEN :DATAINI AND :DATAFIN AND SEQUENCIA_CTR = 1');
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
                 dm.Consulta.ParamByName('tipo').AsInteger:= 1;
                 dm.Consulta.ParamByName('valor').AsCurrency:= fieldbyname('valor_ctr').AsCurrency;
                 dm.Consulta.ExecOrOpen;
               except
                 dm.Consulta.Close;
                 dm.Consulta.SQL.Clear;
                 dm.Consulta.SQL.add('UPDATE PRAZO_ATRASO_MEDIO SET ' +
                                     'VALOR = VALOR + :VALOR WHERE DIAS = :DIAS AND TIPO = :TIPO');
                 dm.Consulta.ParamByName('dias').AsInteger:= fieldbyname('dias').AsInteger;
                 dm.Consulta.ParamByName('tipo').AsInteger:= 1;
                 dm.Consulta.ParamByName('valor').AsCurrency:= fieldbyname('valor_ctr').AsCurrency;
                 dm.Consulta.ExecOrOpen;
               end;
               next;
            end;
      end;
   dm.IBTransaction.Commit;
   QAux.close;
   dm.Consulta.Close;
   SB.SimpleText:= '';

   {buscar as vendas a vista(dinheiro - troco)}
   sb.SimpleText:= 'Verificando as vendas a vista';
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QAux do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT SUM(DINHEIRO_VEN - TROCO_VEN) DINHEIRO ' +
                 'FROM VENDAS WHERE DATA_VEN BETWEEN :DATAINI AND :DATAFIN');
         if (not CheckEmp.Checked) then
            begin 
               sql.Add(' AND COD_EMP = :CODEMP');
               Parambyname('codemp').AsInteger:= iEmp;
            end;
         Parambyname('dataini').AsDate := edtdataini.Date;
         Parambyname('datafin').AsDate := EdtDataFin.Date;
         open;
         try
           dm.Consulta.Close;
           dm.Consulta.SQL.Clear;
           dm.Consulta.SQL.add('INSERT INTO PRAZO_ATRASO_MEDIO (DIAS, VALOR, TIPO) ' +
                               'VALUES(:DIAS, :VALOR, :TIPO)');
           dm.Consulta.ParamByName('dias').AsInteger:= 0;
           dm.Consulta.ParamByName('tipo').AsInteger:= 1;
           dm.Consulta.ParamByName('valor').AsCurrency:= fieldbyname('dinheiro').AsCurrency;
           dm.Consulta.ExecOrOpen;
         except
           dm.Consulta.Close;
           dm.Consulta.SQL.Clear;
           dm.Consulta.SQL.add('UPDATE PRAZO_ATRASO_MEDIO SET ' +
                               'VALOR = :VALOR WHERE DIAS = :DIAS AND TIPO = :TIPO');
           dm.Consulta.ParamByName('dias').AsInteger:= 0;
           dm.Consulta.ParamByName('tipo').AsInteger:= 1;
           dm.Consulta.ParamByName('valor').AsCurrency:= fieldbyname('dinheiro').AsCurrency;
           dm.Consulta.ExecOrOpen;
         end;
      end;
   dm.IBTransaction.Commit;
   QAux.close;
   dm.Consulta.Close;
   SB.SimpleText:= '';

   {buscar os cheques para atualizar a tabela}
   sb.SimpleText:= 'Verificando os Cheques';
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QAux do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT (VENCTO_CHE - EMISSAO_CHE) DIAS, VALOR_CHE ' +
                 'FROM CHEQUE ' +
                 'WHERE EMISSAO_CHE BETWEEN :DATAINI AND :DATAFIN AND COD_VENDA IS NOT NULL');
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
                 dm.Consulta.ParamByName('tipo').AsInteger:= 1;
                 dm.Consulta.ParamByName('valor').AsCurrency:= fieldbyname('valor_che').AsCurrency;
                 dm.Consulta.ExecOrOpen;
               except
                 dm.Consulta.Close;
                 dm.Consulta.SQL.Clear;
                 dm.Consulta.SQL.add('UPDATE PRAZO_ATRASO_MEDIO SET ' +
                                     'VALOR = VALOR + :VALOR WHERE DIAS = :DIAS AND TIPO = :TIPO');
                 dm.Consulta.ParamByName('dias').AsInteger:= fieldbyname('dias').AsInteger;
                 dm.Consulta.ParamByName('tipo').AsInteger:= 1;
                 dm.Consulta.ParamByName('valor').AsCurrency:= fieldbyname('valor_che').AsCurrency;
                 dm.Consulta.ExecOrOpen;
               end;
               next;
            end;
      end;
   dm.IBTransaction.Commit;
   QAux.close;
   dm.Consulta.Close;
   SB.SimpleText:= '';

   {buscar os cartoes de credito para atualizar a tabela}
   sb.SimpleText:= 'Verificando os Cartões de Crédito';
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QAux do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT (VENCTO_CTRADM - EMISSAO_CTRADM) DIAS, VALOR_CTRADM ' +
                 'FROM CONTAS_RECEBER_ADM ' +
                 'WHERE EMISSAO_CTRADM BETWEEN :DATAINI AND :DATAFIN');
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
                 dm.Consulta.ParamByName('tipo').AsInteger:= 1;
                 dm.Consulta.ParamByName('valor').AsCurrency:= fieldbyname('valor_ctradm').AsCurrency;
                 dm.Consulta.ExecOrOpen;
               except
                 dm.Consulta.Close;
                 dm.Consulta.SQL.Clear;
                 dm.Consulta.SQL.add('UPDATE PRAZO_ATRASO_MEDIO SET ' +
                                     'VALOR = VALOR + :VALOR WHERE DIAS = :DIAS AND TIPO = :TIPO');
                 dm.Consulta.ParamByName('dias').AsInteger:= fieldbyname('dias').AsInteger;
                 dm.Consulta.ParamByName('tipo').AsInteger:= 1;
                 dm.Consulta.ParamByName('valor').AsCurrency:= fieldbyname('valor_ctradm').AsCurrency;
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
     end;

  Application.CreateForm(TFrmQRelPMV, FrmQRelPMV);
  FrmQRelPMV.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
  FrmQRelPMV.QRLTitulo.Caption:= 'Relatório de Prazo Médio de Venda no período: ' +
  datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
  if sender = btnvis then
     begin 
        FrmQRelPMV.QRPMV.PreviewInitialState:= wsMaximized;
        FrmQRelPMV.QRPMV.Preview;
     end
  else
     begin 
        FrmQRelPMV.QRPMV.PrinterSetup;
        FrmQRelPMV.QRPMV.Print;
     end;
  FrmQRelPMV.QRPMV.QRPrinter:= nil;
  dm.IBTransaction.Commit;
  QRel.Close;
end;

procedure TFrmRelPMV.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.
