unit URecEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, Buttons, StdCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmRecEstoque = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GB1: TGroupBox;
    EdtCodLocal: UNovosComponentes.TEdit;
    BtnConsLocal: TsSpeedButton;
    EdtNomeLocal: TEdit;
    GB2: TGroupBox;
    BtnConsSetor: TsSpeedButton;
    EdtCodSetor: UNovosComponentes.TEdit;
    EdtNomeSetor: TEdit;
    BtnSair: TBitBtn;
    BtnOK: TBitBtn;
    QConsPro: TFDQuery;
    IBTRAux: TFDTransaction;
    QAux: TFDQuery;
    IBSPEstoque: TFDStoredProc;
    SB: TStatusBar;
    QComposicao: TFDQuery;
    QComposicaoCOD_PRO_COMPOSICAO: TIntegerField;
    QComposicaoQUANT: TBCDField;
    Label1: TLabel;
    Label2: TLabel;
    QConsProCOD_PRO: TIntegerField;
    QLimpaEstoque: TFDQuery;
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtCodLocalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodLocalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodSetorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnConsLocalClick(Sender: TObject);
    procedure BtnConsSetorClick(Sender: TObject);
    procedure EdtCodLocalEnter(Sender: TObject);
    procedure EdtCodLocalExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnOKClick(Sender: TObject);
    procedure EdtCodSetorExit(Sender: TObject);
    procedure EdtCodSetorEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRecEstoque: TFrmRecEstoque;

implementation
uses
  Udm, UBibli1, UConsLocaisEstoque, UConsSetorEstoque, UNovoPrincipal;

{$R *.dfm}

procedure TFrmRecEstoque.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRecEstoque.FormShow(Sender: TObject);
begin 
   EdtCodLocal.SetFocus;
end;

procedure TFrmRecEstoque.EdtCodLocalKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
     key:= #0; 
end;

procedure TFrmRecEstoque.EdtCodLocalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsLocal.Click
end;

procedure TFrmRecEstoque.EdtCodSetorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsSetor.Click
end;

procedure TFrmRecEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QConsPro.Close;

   if IBTRAux.Active then
      IBTRAux.Commit;
   QAux.close;

   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   QComposicao.Close;

   Action:= caFree;
end;

procedure TFrmRecEstoque.BtnConsLocalClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsLocaisEstoque, FrmConsLocaisEstoque);
   FrmConsLocaisEstoque.tag:= 6;
   FrmConsLocaisEstoque.showmodal;
end;

procedure TFrmRecEstoque.BtnConsSetorClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsSetorEstoque, FrmConsSetorEstoque);
   FrmConsSetorEstoque.tag:= 4;
   FrmConsSetorEstoque.showmodal;
end;

procedure TFrmRecEstoque.EdtCodLocalEnter(Sender: TObject);
begin 
   EdtCodLocal.SelectAll;
end;

procedure TFrmRecEstoque.EdtCodLocalExit(Sender: TObject);
begin 
   if (BtnSair.Focused) then
      exit;

   EdtNomeLocal.Text:= consulta('locais_estoque', EdtCodLocal, 'codigo', 'descricao', dm.IBTransaction, dm.qConsulta);
   if EdtNomeLocal.Text = '' then
      begin 
         AlertaCad('Local de Estoque não Cadastrado');
//         EdtCodLocal.SetFocus;
      end;
end;

procedure TFrmRecEstoque.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmRecEstoque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRecEstoque.BtnOKClick(Sender: TObject);
var dData : TDateTime;
    iLocalVendas : integer;
begin 
   if (EdtCodLocal.Text = '') or (EdtCodSetor.Text = '') then
      begin 
         AlertaCad('Verifique o Campos obrigatórios');
         exit;
         abort;
      end;

   { BUSCA O LOCAL DO ESTOQUE DAS VENDAS }
   iLocalVendas:= dm.RetornaIntegerTabela('codigo_local_estoque_vendas', 'parametros', 'cod_emp', iEmp);

   { BUSCA A DATA DE INICIO DO ESTOQUE }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QConsulta do
      begin 
         close;
         sql.Clear;
         sql.Text:= 'SELECT DATA_INICIO_ESTOQUE FROM SETORES_ESTOQUE WHERE CODIGO = :CODIGO ';
         Parambyname('codigo').AsInteger:= strtoint(EdtCodSetor.Text);
         Open;
         dData:= fieldbyname('data_inicio_estoque').Value;
      end;
   dm.IBTransaction.Commit;
   dm.QConsulta.Close;


   { LIMPANDO O ESTOQUE }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.Text:= 'SELECT COD_PRO FROM PRODUTO WHERE CODIGO_SETOR_ESTOQUE = :SETOR ' +
                        'ORDER BY COD_PRO';
             Parambyname('setor').AsInteger:= strtoint(EdtCodSetor.Text);
             Open;
             while not eof do
                 begin 
                    QLimpaEstoque.Close;
                    QLimpaEstoque.ParamByName('codpro').AsInteger:= fieldbyname('cod_pro').AsInteger;
                    QLimpaEstoque.ParamByName('local').AsInteger := strtoint(EdtCodLocal.Text);
                    QLimpaEstoque.ParamByName('codemp').AsInteger:= iEmp;
                    QLimpaEstoque.ExecOrOpen;
                    next;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao limpar o estoque');
     end;
   finally
     dm.Consulta.close;
   end;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsPro do
      begin 
         close;
         sql.Clear;
         sql.Text:= 'SELECT COD_PRO ' +
                    'FROM PRODUTO   ' +
                    'WHERE CODIGO_SETOR_ESTOQUE = :SETOR AND CONTROLA_ESTOQUE_PRO = ' + #39 + 'S' + #39 +
                    ' ORDER BY COD_PRO';
         Parambyname('setor').AsInteger:= strtoint(EdtCodSetor.Text);
         open;

         while not eof do
            begin 
               { busca produtos composicao }
               if dm.IBTRAux.Active then
                  dm.IBTRAux.Commit;
               dm.IBTRAux.StartTransaction;
               QComposicao.Close;
               QComposicao.ParamByName('codpro').AsInteger:= QConsProCOD_PRO.AsInteger;
               QComposicao.Open;

               { ITENS DAS ENTRADAS }
               if IBTRAux.Active then
                  IBTRAux.Commit;
               IBTRAux.StartTransaction;
               QAux.close;
               qaux.SQL.Clear;
               QAux.sql.Add('SELECT I.QTD_PRO      ' +
                            'FROM ITENS_ENTRADA I  ' +
                            'INNER JOIN ENTRADAS E ' +
                            'ON (I.COD_ENT = E.COD_ENT) ' +
                            'WHERE I.COD_PRO = :CODPRO AND E.DATAENT_ENT >= :DATA AND I.COD_EMP = :CODEMP AND I.CODIGO_LOCAL_ESTOQUE = :LOCAL');
               QAux.ParamByName('codpro').AsInteger := QConsProCOD_PRO.AsInteger;
               QAux.ParamByName('data').AsDate      := dData;
               QAux.ParamByName('codemp').AsInteger := iEmp;
               QAux.ParamByName('local').AsInteger := strtoint(EdtCodLocal.Text);
               QAux.open;
               sb.SimpleText:= 'Produto: ' + QConsProCOD_PRO.AsString +  '  [Entradas]';
               while not QAux.Eof do
                  begin 
                     IBSPEstoque.Close;
                     IBSPEstoque.ParamByName('codemp').AsInteger := iEmp;
                     IBSPEstoque.ParamByName('codpro').AsInteger := QConsProCOD_PRO.AsInteger;
                     IBSPEstoque.ParamByName('quant').AsCurrency := QAux.fieldbyname('qtd_pro').AsCurrency;
                     IBSPEstoque.ParamByName('local').AsInteger  := strtoint(EdtCodLocal.Text);
                     IBSPEstoque.ExecProc;
                     QAux.Next;
                  end;
               IBTRAux.Commit;
               QAux.Close;
               IBSPEstoque.Close;

               { ITENS DAS VENDAS }
               if strtoint(EdtCodLocal.Text) = iLocalVendas then
                  begin 
                     if IBTRAux.Active then
                        IBTRAux.Commit;
                     IBTRAux.StartTransaction;
                     QAux.close;
                     qaux.SQL.Clear;
                     QAux.sql.Add('SELECT I.QUANT ' +
                                  'FROM ITENS_VENDA I ' +
                                  'INNER JOIN VENDAS V ' +
                                  'ON (I.COD_VEN = V.COD_VEN) ' +
                                  'WHERE I.COD_PRO = :CODPRO AND V.DATA_VEN >= :DATA AND I.COD_EMP = :CODEMP ' +
                                  'AND I.CANCELADO = 0 AND I.VENDA_CANCELADA = 0');

                     QAux.ParamByName('codpro').AsInteger := QConsProCOD_PRO.AsInteger;
                     QAux.ParamByName('data').AsDate      := dData;
                     QAux.ParamByName('codemp').AsInteger := iEmp;
                     QAux.open;
                     sb.SimpleText:= 'Produto: ' + QConsProCOD_PRO.AsString +'  [Vendas]';

                     while not QAux.Eof do
                        begin 
                           IBSPEstoque.Close;
                           IBSPEstoque.ParamByName('codemp').AsInteger := iEmp;
                           IBSPEstoque.ParamByName('codpro').AsInteger := QConsProCOD_PRO.AsInteger;
                           IBSPEstoque.ParamByName('quant').AsCurrency := QAux.fieldbyname('quant').AsCurrency * -1;
                           IBSPEstoque.ParamByName('local').AsInteger  := strtoint(EdtCodLocal.Text);
                           IBSPEstoque.ExecProc;

                           { PRODUTOS COMPOSICAO - VENDAS }
                           QComposicao.First;
                           while not QComposicao.Eof do
                              begin 
                                 sb.SimpleText:= 'Produto Composição: ' + QComposicaoCOD_PRO_COMPOSICAO.AsString + '  [Vendas]';
                                 IBSPEstoque.Close;
                                 IBSPEstoque.ParamByName('codemp').AsInteger    := iEmp;
                                 IBSPEstoque.ParamByName('codpro').AsInteger    := QComposicaoCOD_PRO_COMPOSICAO.AsInteger;
                                 IBSPEstoque.ParamByName('quant').AsCurrency    := (QComposicaoQUANT.AsCurrency * QAux.fieldbyname('quant').AsCurrency) * -1;
                                 IBSPEstoque.ParamByName('local').AsInteger     := strtoint(EdtCodLocal.Text);
                                 IBSPEstoque.ExecProc;

                                 QComposicao.Next;
                              end;

                           QAux.Next;
                        end;
                     IBTRAux.Commit;
                     QAux.Close;
                     IBSPEstoque.Close;
                  end;

               { ITENS DO ACERTO DE ESTOQUE (ENTRADA) }
               if IBTRAux.Active then
                  IBTRAux.Commit;
               IBTRAux.StartTransaction;
               QAux.close;
               qaux.SQL.Clear;
               QAux.sql.Add('SELECT I.QUANT              ' +
                            'FROM ITENS_ACERTO_ESTOQUE I ' +
                            'INNER JOIN ACERTO_ESTOQUE A ' +
                            'ON (I.COD_ACE = A.COD_ACE)  ' +
                            'INNER JOIN MOTIVO_ACERTO M  ' +
                            'ON (A.COD_MOT = M.COD_MOT)  ' +
                            'WHERE I.COD_PRO = :CODPRO AND A.DATA_ACE >= :DATA AND I.COD_EMP = :CODEMP AND I.CODIGO_LOCAL_ESTOQUE = :LOCAL ' +
                            'AND M.ENTSAI_MOT = ' + #39 + 'E' + #39);
               QAux.ParamByName('codpro').AsInteger := QConsProCOD_PRO.AsInteger;
               QAux.ParamByName('data').AsDate      := dData;
               QAux.ParamByName('codemp').AsInteger := iEmp;
               QAux.ParamByName('local').AsInteger  := strtoint(EdtCodLocal.Text);
               QAux.open;
               sb.SimpleText:= 'Produto: ' + QConsProCOD_PRO.AsString + '  [Acerto de Estoque - Entradas]';
               while not QAux.Eof do
                  begin 
                     IBSPEstoque.Close;
                     IBSPEstoque.ParamByName('codemp').AsInteger := iEmp;
                     IBSPEstoque.ParamByName('codpro').AsInteger := QConsProCOD_PRO.AsInteger;
                     IBSPEstoque.ParamByName('quant').AsCurrency := QAux.fieldbyname('quant').AsCurrency;
                     IBSPEstoque.ParamByName('local').AsInteger  := strtoint(EdtCodLocal.Text);
                     IBSPEstoque.ExecProc;
                     QAux.Next;
                  end;
               IBTRAux.Commit;
               QAux.Close;
               IBSPEstoque.Close;

               { ITENS DO ACERTO DE ESTOQUE (SAIDA) }
               if IBTRAux.Active then
                  IBTRAux.Commit;
               IBTRAux.StartTransaction;
               QAux.close;
               qaux.SQL.Clear;
               QAux.sql.Add('SELECT I.QUANT              ' +
                            'FROM ITENS_ACERTO_ESTOQUE I ' +
                            'INNER JOIN ACERTO_ESTOQUE A ' +
                            'ON (I.COD_ACE = A.COD_ACE) ' +
                            'INNER JOIN MOTIVO_ACERTO M ' +
                            'ON (A.COD_MOT = M.COD_MOT) ' +
                            'WHERE I.COD_PRO = :CODPRO AND A.DATA_ACE >= :DATA AND I.COD_EMP = :CODEMP AND I.CODIGO_LOCAL_ESTOQUE = :LOCAL ' +
                            'AND M.ENTSAI_MOT = ' + #39 + 'S' + #39);
               QAux.ParamByName('codpro').AsInteger := QConsProCOD_PRO.AsInteger;
               QAux.ParamByName('data').AsDate      := dData;
               QAux.ParamByName('codemp').AsInteger := iEmp;
               QAux.ParamByName('local').AsInteger := strtoint(EdtCodLocal.Text);
               QAux.open;
               sb.SimpleText:= 'Produto: ' + QConsProCOD_PRO.AsString + '  [Acerto de Estoque - Saídas]';
               while not QAux.Eof do
                  begin 
                     IBSPEstoque.Close;
                     IBSPEstoque.ParamByName('codemp').AsInteger := iEmp;
                     IBSPEstoque.ParamByName('codpro').AsInteger := QConsProCOD_PRO.AsInteger;
                     IBSPEstoque.ParamByName('quant').AsCurrency := QAux.fieldbyname('quant').AsCurrency * -1;
                     IBSPEstoque.ParamByName('local').AsInteger  := strtoint(EdtCodLocal.Text);
                     IBSPEstoque.ExecProc;
                     QAux.Next;
                  end;
               IBTRAux.Commit;
               QAux.Close;
               IBSPEstoque.Close;

               { ITENS DAS OUTRAS ENTRADAS }
               if IBTRAux.Active then
                  IBTRAux.Commit;
               IBTRAux.StartTransaction;
               QAux.close;
               qaux.SQL.Clear;
               QAux.sql.Add('SELECT I.QUANT_ITEM            ' +
                            'FROM ITENS_OUTRAS_ENTRADAS I   ' +
                            'INNER JOIN OUTRAS_ENTRADAS O   ' +
                            'ON (I.COD_OUTRA = O.COD_OUTRA) ' +
                            'WHERE I.COD_PRO = :CODPRO AND O.DATA_OUTRA >= :DATA AND I.COD_EMP = :CODEMP AND I.CODIGO_LOCAL_ESTOQUE = :LOCAL ' +
                            'AND I.CANCELADO = 0');
               QAux.ParamByName('codpro').AsInteger := QConsProCOD_PRO.AsInteger;
               QAux.ParamByName('data').AsDate      := dData;
               QAux.ParamByName('codemp').AsInteger := iEmp;
               QAux.ParamByName('local').AsInteger  := strtoint(EdtCodLocal.Text);
               QAux.open;
               sb.SimpleText:= 'Produto: ' + QConsProCOD_PRO.AsString + '  [Outras Entradas]';
               while not QAux.Eof do
                  begin 
                     IBSPEstoque.Close;
                     IBSPEstoque.ParamByName('codemp').AsInteger := iEmp;
                     IBSPEstoque.ParamByName('codpro').AsInteger := QConsProCOD_PRO.AsInteger;
                     IBSPEstoque.ParamByName('quant').AsCurrency := QAux.fieldbyname('quant_item').AsCurrency;
                     IBSPEstoque.ParamByName('local').AsInteger  := strtoint(EdtCodLocal.Text);
                     IBSPEstoque.ExecProc;
                     QAux.Next;
                  end;
               IBTRAux.Commit;
               QAux.Close;
               IBSPEstoque.Close;

               { ITENS DAS OUTRAS SAIDAS }
               if IBTRAux.Active then
                  IBTRAux.Commit;
               IBTRAux.StartTransaction;
               QAux.close;
               qaux.SQL.Clear;
               QAux.sql.Add('SELECT I.QUANT_ITEM        ' +
                            'FROM ITENS_OUTRAS_SAIDAS I ' +
                            'INNER JOIN OUTRAS_SAIDAS O ' +
                            'ON (I.COD_OUTRA = O.COD_OUTRA) ' +
                            'WHERE I.COD_PRO = :CODPRO AND O.DATA_OUTRA >= :DATA AND I.COD_EMP = :CODEMP AND I.CODIGO_LOCAL_ESTOQUE = :LOCAL ' +
                            'AND I.CANCELADO = 0');
               QAux.ParamByName('codpro').AsInteger := QConsProCOD_PRO.AsInteger;
               QAux.ParamByName('data').AsDate      := dData;
               QAux.ParamByName('codemp').AsInteger := iEmp;
               QAux.ParamByName('local').AsInteger  := strtoint(EdtCodLocal.Text);
               QAux.open;
               sb.SimpleText:= 'Produto: ' + QConsProCOD_PRO.AsString + '  [Outras Saidas]';
               while not QAux.Eof do
                  begin 
                     IBSPEstoque.Close;
                     IBSPEstoque.ParamByName('codemp').AsInteger := iEmp;
                     IBSPEstoque.ParamByName('codpro').AsInteger := QConsProCOD_PRO.AsInteger;
                     IBSPEstoque.ParamByName('quant').AsCurrency := QAux.fieldbyname('quant_item').AsCurrency * -1;
                     IBSPEstoque.ParamByName('local').AsInteger  := strtoint(EdtCodLocal.Text);
                     IBSPEstoque.ExecProc;
                     QAux.Next;
                  end;
               IBTRAux.Commit;
               QAux.Close;
               IBSPEstoque.Close;

               next;
            end;
      end;
   dm.IBTransaction.Commit;
   qconspro.Close;
   sb.SimpleText:= '';
   AlertaCad('Processo concluído');
end;

procedure TFrmRecEstoque.EdtCodSetorExit(Sender: TObject);
begin 
   if (BtnSair.Focused) then
      exit;

   EdtNomeSetor.Text:= consulta('setores_estoque', EdtCodSetor, 'codigo', 'descricao', dm.IBTransaction, dm.qConsulta);
   if EdtNomeSetor.Text = '' then
      begin 
         AlertaCad('Setor de Estoque não Cadastrado');
//         EdtCodSetor.SetFocus;
      end;
end;

procedure TFrmRecEstoque.EdtCodSetorEnter(Sender: TObject);
begin 
   EdtCodSetor.SelectAll;
end;

end.
