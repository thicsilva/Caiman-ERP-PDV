unit UContasRecItens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Grids, DBGrids, ExtCtrls, ComCtrls, DB, StdCtrls, RDprint, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmContasRecItens = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    QConsItens: TFDQuery;
    DSQConsItens: TDataSource;
    IBTRItens: TFDTransaction;
    QConsItensCOD_VEN: TIntegerField;
    QConsItensCOD_PRO: TIntegerField;
    QConsItensORDEM: TIntegerField;
    QConsItensQUANT: TBCDField;
    QConsItensVALOR: TBCDField;
    QConsItensDESCONTO: TBCDField;
    QConsItensNOME_PRO: TStringField;
    BtnSair: TButton;
    BtnComp: TButton;
    QConsItensCOD_EMP: TIntegerField;
    QConsItensDATA_VEN: TDateField;
    QConsItensCOD_CAI: TIntegerField;
    QConsItensDATA_HORA_VEN: TSQLTimeStampField;
    QConsItensDESCONTO_VEN: TBCDField;
    QConsItensVALOR_CUSTO: TBCDField;
    QConsItensCALC_TOTAL: TCurrencyField;
    RDprint: TRDprint;
    QConsItensPRODUTO_PROMOCAO: TStringField;
    QConsItensCANCELADO: TIntegerField;
    QConsItensVENDA_CANCELADA: TIntegerField;
    QConsItensCOD_VEND: TIntegerField;
    procedure QConsItensCalcFields(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnCompClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmContasRecItens: TFrmContasRecItens;

implementation
uses
  Udm, UContasRecRec, UConsContasRec, UNovoPrincipal;

{$R *.dfm}

procedure TFrmContasRecItens.QConsItensCalcFields(DataSet: TDataSet);
begin 
   QConsItensCALC_TOTAL.AsCurrency:= ((QConsItensVALOR.AsCurrency * QConsItensQUANT.AsCurrency) - QConsItensDESCONTO.AsCurrency);
end;

procedure TFrmContasRecItens.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmContasRecItens.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmContasRecItens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if IBTRItens.Active then
      IBTRItens.Commit;
   QConsItens.Close;
   Action:= caFree;
end;

procedure TFrmContasRecItens.FormShow(Sender: TObject);
begin 
   if IBTRItens.Active then
      IBTRItens.Commit;
   IBTRItens.StartTransaction;
   
   with QConsItens do
      begin 
         close;
         case FrmContasRecItens.tag of
           0:parambyname('codven').AsInteger := FrmContasRecRec.QConsARecCOD_VENDA.AsInteger;
           1:parambyname('codven').AsInteger := FrmConsContasRec.QConsRecebidasCOD_VENDA.AsInteger;
           2:parambyname('codven').AsInteger := FrmConsContasRec.QConsAReceberCOD_VENDA.AsInteger;
           3:parambyname('codven').AsInteger := FrmContasRecRec.QConsRecCOD_VENDA.AsInteger;
         end;
         open;
         if recordcount > 0 then
            BtnComp.Enabled:= true
         else
            BtnComp.Enabled:= false;
      end;
end;

procedure TFrmContasRecItens.BtnCompClick(Sender: TObject);
var iLinha       : integer;
    sData        : string;
    cTotal       : currency;
    bCab         : boolean;
    iLinhasFinal : integer;
begin 
   if Application.MessageBox('Confirma a Impressão do Comprovante?', 'Impressão de Comprovante de Venda', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         bCab         := false;
         iLinhasFinal := 0;
         {==========================================================================}
         {============================= BUSCA PARAMETROS ===========================}
         {==========================================================================}
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         try
           try
             with dm.Consulta do
                begin 
                   close;
                   sql.Clear;
                   sql.Add('SELECT LINHAS_FINAL, IMP_CABECALHO ' +
                           'FROM PARAMETROS ' +
                           'WHERE COD_EMP = :CODEMP');
                   Parambyname('codemp').AsInteger:= iEmp;
                   ExecOrOpen;
                   if trim(fieldbyname('IMP_CABECALHO').AsString) = 'S' then
                      bCab:= true
                   else
                      bCab:= false;
                   iLinhasFinal:= fieldbyname('LINHAS_FINAL').AsInteger;
                end;
             dm.IBTransaction.Commit;
           except
             dm.IBTransaction.Rollback;
           end;
         finally
           dm.Consulta.Close;
         end;

         {==========================================================================}
         {======================= IMPRESSAO DO COMPROVANTE DE VENDA ================}
         {==========================================================================}
         RDprint.TamanhoQteLinhas:= 1;
         RDprint.Abrir;

         {==========================================================================}
         {============================= IMPRESSAO DO CABEÇALHO =====================}
         {==========================================================================}
         if bCab then
            begin 
               if dm.IBTransaction.Active then
                  dm.IBTransaction.Commit;
               dm.IBTransaction.StartTransaction;
               with dm.Consulta do
                  begin 
                     close;
                     sql.Clear;
                     sql.Add('SELECT RAZAO_EMP, TEL_EMP FROM EMPRESA WHERE COD_EMP = :CODEMP');
                     Parambyname('codemp').AsInteger:= iEmp;
                     ExecOrOpen;
                     RDprint.ImpC(1, 28, FieldByName('RAZAO_EMP').AsString, []);
                     RDprint.ImpC(2, 28, FieldByName('TEL_EMP').AsString, []);
                  end;
               dm.IBTransaction.Commit;
               dm.Consulta.Close;

               RDprint.Imp(4, 1, '=====================================================');
               sData:= FormatDateTime('dddd, d "de" mmmm "de" yyyy', QConsItensDATA_VEN.Value);
               RDprint.Imp(5, 1, sData);
               RDprint.Imp(6, 1, 'Orcamento....: ' + QConsItensCOD_VEN.AsString);
               RDprint.Imp(6, 40, 'Caixa: ' + QConsItensCOD_CAI.asstring);
               sData:= FormatDateTime('hh:mm:ss', QConsItensDATA_HORA_VEN.AsDateTime);
               RDprint.Imp(7, 40, sData );
               RDprint.Imp(8, 1, '=====================================================');
               iLinha:= 9;
            end
         else
            begin
               RDprint.Imp(1, 1, '=====================================================');
               sData:= FormatDateTime('dddd, d "de" mmmm "de" yyyy', QConsItensDATA_VEN.Value);
               RDprint.Imp(2, 1, sData);
               RDprint.Imp(3, 1, 'Orcamento....: ' + QConsItensCOD_VEN.AsString);
               RDprint.Imp(3, 40, 'Caixa: ' + QConsItensCOD_CAI.asstring);
               sData:= FormatDateTime('hh:mm:ss', QConsItensDATA_HORA_VEN.AsDateTime );
               RDprint.Imp(4, 40, sData);
               RDprint.Imp(5, 1, '=====================================================');
               iLinha:= 6;
            end;

         {==========================================================================}
         {================================= ITENS DA VENDA =========================}
         {==========================================================================}
         RDprint.imp(iLinha, 1, 'Cod.       Descricao         Quant.   Unit.    Total ');
         inc(iLinha);
         RDprint.imp(iLinha, 1, '-----------------------------------------------------');
         inc(iLinha);

         cTotal:= 0;
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with QConsItens do
            begin 
               DisableControls;
               First;
               while not eof do
                  begin 
                     RDprint.Imp(iLinha, 1, QConsItensCOD_PRO.AsString);
                     RDprint.Imp(iLinha, 7, copy(trim(QConsItensNOME_PRO.AsString), 1, 20));
                     RDprint.ImpVal(iLinha, 27, '#,##0.00', QConsItensQUANT.AsCurrency, []);
                     RDprint.ImpVal(iLinha, 36, '#,##0.00', QConsItensVALOR.AsCurrency, []);
                     RDprint.ImpVal(iLinha, 46, '#,##0.00', QConsItensQUANT.AsCurrency * QConsItensVALOR.AsCurrency, []);

                     if QConsItensDESCONTO.AsCurrency > 0 then
                        begin 
                           inc(iLinha);
                           RDprint.Imp(iLinha, 7, 'Desconto');
                           RDprint.ImpVal(iLinha, 46, '#,##0.00', QConsItensDESCONTO.AsCurrency * -1, []);
                        end;

                     if QConsItensCANCELADO.AsInteger = 1 then
                        begin 
                           inc(iLinha);
                           RDprint.Imp(iLinha, 7, 'Cancelado Item ' + QConsItensORDEM.AsString);
                           RDprint.ImpVal(iLinha, 46, '#,##0.00', QConsItensCALC_TOTAL.AsCurrency, []);
                        end;

                     inc(iLinha);

                     if QConsItensCANCELADO.AsInteger = 0 then
                        cTotal:= cTotal + QConsItensCALC_TOTAL.AsCurrency;
                        
                     next;
                  end;
               First;
               EnableControls;
            end;

         {==========================================================================}
         {========================== IMPRESSAO DOS TOTAIS ==========================}
         {==========================================================================}
         RDprint.Imp(iLinha , 1, '-----------------------------------------------------');
         inc(iLinha);
         if QConsItensDESCONTO_VEN.AsCurrency > 0 then
            begin 
               RDprint.Imp(iLinha, 1, '                              SubTotal..:');
               RDprint.ImpVal(iLinha, 46, '#,##0.00', cTotal, []);
               inc(iLinha);
               RDprint.Imp(iLinha, 1, '                              Desconto..:');
               RDprint.ImpVal(iLinha, 46, '#,##0.00', QConsItensDESCONTO_VEN.AsCurrency, []);
               inc(ilinha);
               RDprint.Imp(iLinha , 1, '                              Total.....:');
               RDprint.ImpVal(iLinha, 46, '#,##0.00', cTotal - QConsItensDESCONTO_VEN.AsCurrency, []);
               inc(iLinha);
            end
         else
            begin 
               RDprint.Imp(iLinha, 1, '                              Total.....:');
               RDprint.ImpVal(iLinha, 46, '#,##0.00', cTotal, []);
               inc(iLinha);
            end;

         {==========================================================================}
         {========================== FINALIZA A IMPRESSAO ==========================}
         {==========================================================================}
         iLinha:= iLinha + iLinhasFinal;
         RDprint.Imp(iLinha, 1, ' ');
         if strtoint(dm.LeIni('cnfcomercio.ini', 'configuracaolocal', 'visualizarrelatorios')) = 1 then
            begin 
               RDprint.TamanhoQteLinhas:= iLinha;
               RDprint.OpcoesPreview.Preview:= true;
            end
         else
            begin 
               RDprint.TamanhoQteLinhas:= 1;
               RDprint.OpcoesPreview.Preview:= false;
            end;
         RDprint.Fechar;
      end;
end;

procedure TFrmContasRecItens.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin 
   if QConsItensCANCELADO.AsInteger = 1 then
      begin 
         DBGrid1.Canvas.Font.Color:= clRed;
         Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
      end;
end;

end.
