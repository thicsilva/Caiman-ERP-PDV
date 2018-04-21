unit URegEntradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, ImgList, ComCtrls, ToolWin, ExtCtrls, Buttons, Mask, 
  StdCtrls, Grids, DBGrids, DB, rxToolEdit, rxCurrEdit, UNovosComponentes, 
  UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, 
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White, 
  dxSkinsdxStatusBarPainter, acAlphaImageList, dxStatusBar, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton, dxSkinMetropolisDark;

type
  TFrmRegEntradas = class(TFrmCadastroNovo)
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    EdtCod: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtData: TMaskEdit;
    Label35: TLabel;
    EdtNumNF: TEdit;
    Label54: TLabel;
    EdtCodModelo: UNovosComponentes.TEdit;
    BtnConsModelo: TsSpeedButton;
    EdtNomeModelo: TEdit;
    Label34: TLabel;
    EdtSerie: TEdit;
    Label21: TLabel;
    EdtCNPJ: UNovosComponentes.TEdit;
    BtnAddFor: TsSpeedButton;
    EdtNomeFor: TEdit;
    Label22: TLabel;
    Label8: TLabel;
    EdtTotalNF: TCurrencyEdit;
    Label3: TLabel;
    EdtInscricao: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    ComboEmitente: TComboBox;
    Label6: TLabel;
    ComboSituacao: TComboBox;
    Label7: TLabel;
    EdtValorContabil: TCurrencyEdit;
    Label9: TLabel;
    EdtBaseCalculo: TCurrencyEdit;
    Label10: TLabel;
    EdtICMS: TCurrencyEdit;
    Label11: TLabel;
    EdtIsentas: TCurrencyEdit;
    Label12: TLabel;
    EdtOutras: TCurrencyEdit;
    Label13: TLabel;
    EdtAliquota: TCurrencyEdit;
    DBGrid1: TDBGrid;
    Label30: TLabel;
    BtnGrava: TButton;
    BtnExclui: TButton;
    IBTRReg: TFDTransaction;
    IBSQLReg: TFDQuery;
    Label14: TLabel;
    EdtUF: TEdit;
    QBuscaItens: TFDQuery;
    Label38: TLabel;
    EdtCFOP: UNovosComponentes.TEdit;
    BtnConsCFOP: TsSpeedButton;
    BtnAddCFOP: TsSpeedButton;
    EdtNomeCFOP: TEdit;
    Label39: TLabel;
    QBuscaItensCODIGO: TIntegerField;
    QBuscaItensORDEM: TIntegerField;
    QBuscaItensCFOP: TIntegerField;
    QBuscaItensBASE_CALCULO: TBCDField;
    QBuscaItensVALOR_ICMS: TBCDField;
    QBuscaItensISENTA_NAO_TRIBUTADA: TBCDField;
    QBuscaItensOUTRAS: TBCDField;
    QBuscaItensALIQUOTA: TBCDField;
    QBuscaItensCODIGO_EMPRESA: TIntegerField;
    QBuscaItensVALOR_TOTAL: TBCDField;
    DSBuscaItens: TDataSource;
    QBuscaItensNOME_CFO: TStringField;
    EdtCodFor: UNovosComponentes.TEdit;
    Label15: TLabel;
    EdtSubSerie: TEdit;
    Label16: TLabel;
    ComboFrete: TComboBox;
    Label17: TLabel;
    EdtICMSRetido: TCurrencyEdit;
    Label18: TLabel;
    EdtBaseRetido: TCurrencyEdit;
    QBuscaItensICMS_RETIDO: TBCDField;
    QBuscaItensBASE_CALCULO_RETIDO: TBCDField;
    QInsert: TFDQuery;
    QInsertCODREG: TIntegerField;
    procedure EdtCNPJExit(Sender: TObject);
    procedure BtnAddForClick(Sender: TObject);
    procedure EdtCNPJEnter(Sender: TObject);
    procedure EdtCNPJKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCNPJKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodModeloEnter(Sender: TObject);
    procedure EdtCodModeloExit(Sender: TObject);
    procedure EdtCodModeloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsModeloClick(Sender: TObject);
    procedure LimpaItens;
    procedure Botoes(acao : string);
    procedure EdtDataExit(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure BtnConsCFOPClick(Sender: TObject);
    procedure BtnAddCFOPClick(Sender: TObject);
    procedure EdtCFOPEnter(Sender: TObject);
    procedure EdtCFOPExit(Sender: TObject);
    procedure EdtCFOPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BuscaItens;
    procedure BtnExcluiClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    function  Ordem : integer;
    procedure BtnConsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRegEntradas: TFrmRegEntradas;

implementation

uses
  UDM, Ubibli1, UConsFor, UCadFor, UConsModelo, UConsCFOP, UCadCFOP, 
  UConsRegEntradas, UNovoPrincipal;
var  bGrava      : boolean;
     bGravaItem  : boolean;
     iOrdem      : integer;
{$R *.dfm}

function TFrmRegEntradas.Ordem : integer;
var iAux : integer;
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QConsulta do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT MAX(ORDEM) ORD ' +
                 'FROM ITENS_REGISTRO_LIVRO_ENTRADAS ' +
                 'WHERE CODIGO = :COD');
         Parambyname('cod').AsInteger:= strtoint(EdtCod.Text);
         Open;
         iAux:= fieldbyname('ord').AsInteger + 1;
      end;
   dm.IBTransaction.Commit;
   dm.QConsulta.Close;
   result:= iAux;
end;

procedure TFrmRegEntradas.BuscaItens;
begin 
   if IBTRReg.Active then
      IBTRReg.Commit;
   IBTRReg.StartTransaction;
   with QBuscaItens do
      begin 
         close;
         Parambyname('cod').AsInteger:= strtoint(EdtCod.Text);
         open;
      end;
end;

procedure TFrmRegEntradas.EdtCNPJExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;

  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.QConsulta do
         begin 
            close;
            sql.Clear;
            sql.add('SELECT COD_FOR, RAZAO_FOR, INSC_FOR, EST_FOR ' +
                    'FROM FORNECEDOR ' +
                    'WHERE CNPJ_FOR = ' + #39 +  FormataCNPJ(EdtCNPJ.Text) + #39);
            open;
            if not (fieldbyname('cod_for').IsNull) then
               begin 
                  EdtCodFor.Text    := fieldbyname('cod_for').AsString;
                  EdtNomeFor.Text   := fieldbyname('razao_for').AsString;
                  EdtInscricao.Text := fieldbyname('insc_for').AsString;
                  EdtUF.Text        := fieldbyname('est_for').AsString;
               end
            else
               begin 
                  EdtCodFor.Text;
                  EdtNomeFor.Clear;
                  EdtCNPJ.Clear;
                  EdtInscricao.clear;
                  edtuf.Clear;
                  AlertaCad('Fornecedor não Cadastrado');
//                  EdtCNPJ.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      EdtCNPJ.Clear;
      EdtNomeFor.Clear;
      AlertaCad('Erro ao buscar o Fornecedor');
//      EdtCNPJ.SetFocus;
    end;
  finally
    dm.QConsulta.Close;
  end;
end;

procedure TFrmRegEntradas.BtnAddForClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadFor, True );
end;

procedure TFrmRegEntradas.EdtCNPJEnter(Sender: TObject);
begin 
  inherited;
  EdtCNPJ.SelectAll;
end;

procedure TFrmRegEntradas.EdtCNPJKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if key = vk_f2 then
     BtnAddFor.Click;
end;

procedure TFrmRegEntradas.EdtCNPJKeyPress(Sender: TObject;
  var Key: Char);
begin 
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmRegEntradas.EdtCodModeloEnter(Sender: TObject);
begin 
  inherited;
  EdtCodModelo.SelectAll;
end;

procedure TFrmRegEntradas.EdtCodModeloExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;
  EdtNomeModelo.Text:= consulta('codificacao_documentos', EdtCodModelo, 'codigo', 'descricao', dm.IBTransaction, dm.QConsulta);
  if trim(EdtNomeModelo.Text) = '' then
     begin 
        AlertaCad('Modelo de Nota Fiscal não Cadastrado');
//        EdtCodModelo.SetFocus;
        exit;
     end;
  try
    case strtoint(EdtCodModelo.Text) of
      7,8,9,10,11,26: begin 
                         Label16.Visible    := true;
                         ComboFrete.Visible := true;
                      end;
    else
       begin 
          Label16.Visible    := false;
          ComboFrete.Visible := false;
       end;
    end;
  except
    Label16.Visible    := false;
    ComboFrete.Visible := false;
  end;

end;

procedure TFrmRegEntradas.EdtCodModeloKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsModelo.Click;
end;

procedure TFrmRegEntradas.BtnConsModeloClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsModelo, FrmConsModelo);
  FrmConsModelo.tag:= 3;
  FrmConsModelo.showmodal;
end;

procedure TFrmRegEntradas.LimpaItens;
begin 
   EdtCFOP.Clear;
   EdtNomeCFOP.Clear;
   EdtValorContabil.Clear;
   EdtBaseCalculo.Clear;
   EdtAliquota.Clear;
   EdtICMS.Clear;
   EdtIsentas.Clear;
   EdtOutras.Clear;
end;

procedure TFrmRegEntradas.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmRegEntradas);
                btnExcluir.Enabled:= false
             end
          else
              btnExcluir.Enabled:= true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmRegEntradas);
         btnNovo.Enabled      := true;
         BtnGravar.Enabled    := false;
         btnCancelar.Enabled  := false;
         if (acao = 'C') or (acao = 'E') then
            begin 
               btnalterar.Enabled:= false;
               BtnConsultar.Enabled := true;
            end
         else
            btnalterar.Enabled:= true;
         if acao = 'G' then
            btnExcluir.Enabled:= true
         else
            BtnExcluir.Enabled:= false;
      end;
end;

procedure TFrmRegEntradas.EdtDataExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;
  try
    strtodate(edtdata.Text)
  except
    AlertaCad('Data Inválida');
//    EdtData.SetFocus;
  end;
end;

procedure TFrmRegEntradas.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('M035','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;

  { verifica insc.estadual }
  if trim(EdtInscricao.Text) <> '' then
     begin 
{        if not VerificaInscricao(EdtInscricao.Text, EdtUF.Text) then
           begin 
              AlertaCad('Inscrição Estadual inválida para ' + EdtUF.Text);
              exit;
              abort;
           end;}
     end;

  if IBTRReg.Active then
     IBTRReg.Commit;
  IBTRReg.StartTransaction;
  if bGrava then
     begin 
        try
          try
            with QInsert do
               begin 
                  close;
                  Params[0].AsDate       := strtodate(EdtData.Text);
                  Params[1].AsInteger    := strtoint(EdtCodFor.Text);
                  Params[2].AsString     := trim(EdtCNPJ.Text);
                  Params[3].AsString     := EdtCodModelo.Text;
                  if trim(EdtSerie.Text) = '' then
                     Params[4].Value     := null
                  else
                     Params[4].AsString  := trim(EdtSerie.Text);
                  Params[5].AsInteger    := strtoint(EdtNumNF.Text);
                  Params[6].AsString     := copy(ComboEmitente.Text, 1, 1);
                  Params[7].AsCurrency   := strtocurr(EdtTotalNF.Text);
                  if ComboSituacao.ItemIndex = 0 then
                     Params[8].AsString  := 'N'
                  else
                     Params[8].AsString  := 'S';
                  Params[9].AsInteger    := iEmp;
                  Params[10].value       := null;
                  Params[11].AsString    := trim(EdtUF.Text);
                  Params[12].AsString    := RetiraCaracter(trim(EdtInscricao.Text));
                  if trim(EdtSubSerie.Text) = '' then
                     Params[13].value    := null
                  else
                     Params[13].AsString := trim(EdtSubSerie.Text);
                  Params[14].AsInteger   := ComboFrete.ItemIndex;
                  Params[15].Value       := null;
                  Open;
                  EdtCod.Text:= QInsertCODREG.AsString;
               end;
            IBTRReg.Commit;
            Botoes('G');
            panel3.Enabled:= false;
            panel4.Enabled:= true;
            EdtCFOP.SetFocus;
          except
            IBTRReg.Rollback;
            AlertaCad('erro ao gravar o registro');
          end;
        finally
          QInsert.Close;
          BuscaItens;
        end;
     end
  else
     begin 
        try
          try
            with IBSQLReg do
               begin 
                  close;
                  sql.Clear;
                  sql.add('UPDATE REGISTRO_LIVRO_ENTRADAS SET ' +
                          'DATA = :2, CNPJ = :3, CODIFICACAO_FISCAL = :4, SERIE_NOTA = :5, ' +
                          'NUMERO_NOTA = :6, EMITENTE = :7, VALOR_TOTAL = :8, SITUACAO = :9, ' +
                          'UF = :10, INSCRICAO = :11, COD_FOR = :12, SUB_SERIE = :13, ' +
                          'CIF_FOB = :14 WHERE CODIGO = :1');
                  Parambyname('1').AsInteger   := strtoint(EdtCod.Text);
                  Parambyname('2').AsDate      := strtodate(EdtData.Text);
                  Parambyname('3').AsString    := Trim(EdtCNPJ.Text);
                  Parambyname('4').AsString    := trim(EdtCodModelo.Text);
                  if EdtSerie.Text = '' then
                     ParamByName('5').Value    := null
                  else
                     ParamByName('5').AsString := trim(EdtSerie.Text);
                  ParamByName('6').AsInteger   := strtoint(EdtNumNF.Text);
                  Parambyname('7').AsString    := copy(ComboEmitente.Text, 1, 1);
                  Parambyname('8').AsCurrency  := strtocurr(EdtTotalNF.Text);
                  if ComboSituacao.ItemIndex = 0 then
                     ParamByName('9').AsString := 'N'
                  else
                     ParamByName('9').AsString := 'S';
                  ParamByName('10').AsString   := trim(EdtUF.Text);
                  ParamByName('11').AsString   := RetiraCaracter(trim(EdtInscricao.Text));
                  Parambyname('12').AsInteger  := strtoint(EdtCodFor.Text);
                  if EdtSubSerie.Text = '' then
                     ParamByName('13').value   := null
                  else
                     ParamByName('13').AsString := trim(EdtSubSerie.Text);
                  ParamByName('14').AsInteger  := ComboFrete.ItemIndex;
                  ExecOrOpen;
               end;
            IBTRReg.Commit;
            Botoes('G');
            panel3.Enabled:= false;
            panel4.Enabled:= true;
            EdtCFOP.SetFocus;
          except
            IBTRReg.Rollback;
            AlertaCad('Erro ao gravar o registro');
          end;
        finally
          IBSQLReg.Close;
          BuscaItens;
        end;
     end;
end;

procedure TFrmRegEntradas.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  ToolBar1.SetFocus;

  if IBTRReg.Active then
     IBTRReg.Commit;
  QBuscaItens.Close;
  bGrava:= true;
  bGravaItem:= true;
  if not DM.Acesso('M035','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        panel3.Enabled:= false;
        panel4.Enabled:= false;
        Abort;
        Exit;
     end;
  Botoes('N');
  panel3.Enabled := true;
  panel4.Enabled := false;
  Label16.Visible:= false;
  ComboFrete.Visible:= false;
  EdtData.Text   := datetostr(date);
  ComboEmitente.ItemIndex:= 1;
  ComboSituacao.ItemIndex:= 0;
  Edtdata.SetFocus;
end;

procedure TFrmRegEntradas.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  ToolBar1.SetFocus;
  if not panel3.Enabled then
     AlertaCad('Lançamento gravado')
  else
     begin 
        Botoes('C');
        panel3.Enabled:= false;
        panel4.Enabled:= false;
     end;
end;

procedure TFrmRegEntradas.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('M035','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  panel3.Enabled:= true;
  Botoes('A');
  edtdata.SetFocus;
end;

procedure TFrmRegEntradas.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  ToolBar1.SetFocus;
  if not DM.Acesso('M035','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if Application.MessageBox('Confirma a Exclusão do Registro?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin 
        if IBTRReg.Active then
           IBTRReg.Commit;
        QBuscaItens.Close;
        IBTRReg.StartTransaction;
        try
          try
            with IBSQLReg do
               begin 
                  close;
                  sql.Clear;
                  sql.Add('DELETE FROM REGISTRO_LIVRO_ENTRADAS WHERE CODIGO = :COD');
                  Parambyname('cod').AsInteger:= strtoint(EdtCod.Text);
                  ExecOrOpen;
               end;
            IBTRReg.Commit;
            panel3.Enabled:= false;
            panel4.Enabled:= false;
            Botoes('E');
          except
            IBTRReg.Rollback;
            AlertaCad('Erro ao Excluir o Lançamento');
          end;
        finally
          IBSQLReg.Close;
        end;
     end;
end;

procedure TFrmRegEntradas.FormShow(Sender: TObject);
begin 
  inherited;
  panel3.Enabled := false;
  panel4.Enabled := false;
  
  if tag = 0 then
     begin 
        bGrava:= true;
        bGravaItem:= true;
        if not DM.Acesso('M035','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             panel3.Enabled := true;
             Edtdata.Text   := datetostr(date);
             ComboEmitente.ItemIndex:= 1;
             ComboSituacao.ItemIndex:= 0;
             Edtdata.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmRegEntradas.BtnGravaClick(Sender: TObject);
begin 
  inherited;
  { VERIFICA SE OS VALORES }
  {if strtocurr(EdtValorContabil.Text) <> (strtocurr(EdtBaseCalculo.Text) +
                                          strtocurr(EdtIsentas.Text)     +
                                          strtocurr(EdtOutras.Text)) then
     begin 
        AlertaCad('Verifique os valores digitados');
//        EdtValorContabil.SetFocus;
        exit;
        abort;
     end;}

  if IBTRReg.Active then
     IBTRReg.Commit;
  IBTRReg.StartTransaction;
  try
    try
      with IBSQLReg do
         begin 
            close;
            sql.Clear;
            if bGravaItem then
               begin 
                  sql.Add('INSERT INTO ITENS_REGISTRO_LIVRO_ENTRADAS (CODIGO, ORDEM, CFOP, ' +
                          'BASE_CALCULO, VALOR_ICMS, ISENTA_NAO_TRIBUTADA, OUTRAS, ALIQUOTA, ' +
                          'CODIGO_EMPRESA, VALOR_TOTAL, ICMS_RETIDO, BASE_CALCULO_RETIDO) ' +
                          'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11, :12)');
                  parambyname('2').AsInteger:= Ordem;
               end
            else
               begin 
                  sql.Add('UPDATE ITENS_REGISTRO_LIVRO_ENTRADAS SET CFOP = :3, ' +
                       'BASE_CALCULO = :4, VALOR_ICMS = :5, ISENTA_NAO_TRIBUTADA = :6, ' +
                       'OUTRAS = :7, ALIQUOTA = :8, CODIGO_EMPRESA = :9, VALOR_TOTAL = :10, ' +
                       'ICMS_RETIDO = :11, BASE_CALCULO_RETIDO = :12 ' +
                       'WHERE CODIGO = :1 AND ORDEM = :2');
                  parambyname('2').AsInteger:= iOrdem;
               end;
            parambyname('1').AsInteger  := strtoint(EdtCod.Text);
            Parambyname('3').AsInteger  := StrToInt(EdtCFOP.Text);
            parambyname('4').AsCurrency := StrToCurr(EdtBaseCalculo.Text);
            Parambyname('5').AsCurrency := strtocurr(EdtICMS.Text);
            Parambyname('6').AsCurrency := strtocurr(EdtIsentas.Text);
            Parambyname('7').AsCurrency := strtocurr(EdtOutras.Text);
            Parambyname('8').AsCurrency := strtocurr(EdtAliquota.Text);
            Parambyname('9').AsInteger  := iEmp;
            Parambyname('10').AsCurrency:= strtocurr(EdtValorContabil.Text);
            Parambyname('11').AsCurrency:= strtocurr(EdtICMSRetido.Text);
            Parambyname('12').AsCurrency:= strtocurr(EdtBaseRetido.Text);
            ExecOrOpen;
         end;
      IBTRReg.Commit;
    except
      IBTRReg.Rollback;
      AlertaCad('Erro ao Gravar o Item');
    end;
  finally
    bGravaItem:= true;
    IBSQLReg.Close;
    LimpaItens;
    BuscaItens;
    EdtCFOP.SetFocus;
  end;
end;

procedure TFrmRegEntradas.BtnConsCFOPClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCFOP, FrmConsCFOP);
  FrmConsCFOP.tag:= 11;
  FrmConsCFOP.showmodal;
end;

procedure TFrmRegEntradas.BtnAddCFOPClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadCFOP, True );
end;

procedure TFrmRegEntradas.EdtCFOPEnter(Sender: TObject);
begin 
  inherited;
  edtcfop.SelectAll;
end;

procedure TFrmRegEntradas.EdtCFOPExit(Sender: TObject);
begin 
  inherited;
  if (ToolBar1.Focused) or (EdtCFOP.Text = '') then
     begin 
        EdtNomeCFOP.Clear;
        exit;
     end;

  if (copy(trim(EdtCFOP.Text), 1, 1) <> '1') and (copy(trim(EdtCFOP.Text), 1, 1) <> '2') then
  begin 
     AlertaCad('CFOP nao é Válido para Entradas');
//     EdtCFOP.SetFocus;
     exit;
  end;

  EdtNomeCFOP.Text:= consulta('cfop', EdtCFOP, 'cod_cfo', 'nome_cfo', dm.IBTransaction, dm.qConsulta);
  if EdtNomeCFOP.Text = '' then
     begin 
        AlertaCad('CFOP não Cadastrado');
//        edtcfop.SetFocus;
     end;
end;

procedure TFrmRegEntradas.EdtCFOPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsCFOP.Click
  else
     if key = vk_f2 then
        BtnAddCFOP.Click;
end;

procedure TFrmRegEntradas.BtnExcluiClick(Sender: TObject);
begin 
  inherited;
  if Application.MessageBox('Confirma a Exclusão do Item?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin 
        iOrdem:= QBuscaItensORDEM.AsInteger;
        if IBTRReg.Active then
           IBTRReg.Commit;
        QBuscaItens.Close;
        IBTRReg.StartTransaction;
        try
          try
            with IBSQLReg do
               begin 
                  close;
                  sql.Clear;
                  sql.Add('DELETE FROM ITENS_REGISTRO_LIVRO_ENTRADAS ' +
                          'WHERE CODIGO = :1 AND ORDEM = :2');
                  Parambyname('1').AsInteger := strtoint(EdtCod.text);
                  Parambyname('2').AsInteger := iOrdem;
                  ExecOrOpen;
               end;
            IBTRReg.Commit;
          except
            IBTRReg.Rollback;
            AlertaCad('Erro ao Excluir o Item');
          end;
        finally
          IBSQLReg.Close;
          LimpaItens;
          BuscaItens;
        end;
     end;
end;

procedure TFrmRegEntradas.DBGrid1DblClick(Sender: TObject);
begin 
  inherited;
  iOrdem                := QBuscaItensORDEM.AsInteger;
  EdtCFOP.Text          := QBuscaItensCFOP.AsString;
  EdtNomeCFOP.Text      := QBuscaItensNOME_CFO.AsString;
  EdtValorContabil.Text := QBuscaItensVALOR_TOTAL.AsString;
  EdtBaseCalculo.Text   := QBuscaItensBASE_CALCULO.AsString;
  EdtAliquota.Text      := QBuscaItensALIQUOTA.AsString;
  EdtICMS.Text          := QBuscaItensVALOR_ICMS.AsString;
  EdtIsentas.Text       := QBuscaItensISENTA_NAO_TRIBUTADA.AsString;
  EdtOutras.Text        := QBuscaItensOUTRAS.AsString;
  EdtBaseRetido.Text    := QBuscaItensBASE_CALCULO_RETIDO.AsString;
  EdtICMSRetido.Text    := QBuscaItensICMS_RETIDO.AsString;
  bGravaItem:= false;
  EdtCFOP.SetFocus;
end;

procedure TFrmRegEntradas.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsRegEntradas, FrmConsRegEntradas);
  FrmConsRegEntradas.tag:= 0;
  FrmConsRegEntradas.showmodal;
end;

procedure TFrmRegEntradas.FormCreate(Sender: TObject);
begin 
  inherited;
  label16.Visible:= false;
  ComboFrete.Visible:= false;
end;

procedure TFrmRegEntradas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRReg.Active then
     IBTRReg.Commit;
  QBuscaItens.Close;
  Action:= caFree;
end;

end.
