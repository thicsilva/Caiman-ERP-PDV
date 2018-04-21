unit UCadAdmCartaoCredito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, ImgList, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask, 
  Grids, DBGrids, DB, pngimage, rxToolEdit, rxCurrEdit, UNovosComponentes, 
  UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, dxSkinMetropolisDark, 
  dxSkinsdxStatusBarPainter, acAlphaImageList, dxStatusBar, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmCadAdmCartaoCredito = class(TFrmCadastroNovo)
    Label1: TLabel;
    codigo: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    IBSQLAdm: TFDQuery;
    IBTRAdm: TFDTransaction;
    Panel3: TPanel;
    Panel4: TPanel;
    Label3: TLabel;
    EdtTaxaCredito: TCurrencyEdit;
    Label4: TLabel;
    EdtDiasCredito: UNovosComponentes.TEdit;
    Label7: TLabel;
    EdtDiasDebito: UNovosComponentes.TEdit;
    Label8: TLabel;
    Label30: TLabel;
    Label9: TLabel;
    EdtNomeBandeira: TEdit;
    Label10: TLabel;
    EdtCodBandeira: UNovosComponentes.TEdit;
    CheckAtivo: TCheckBox;
    Label5: TLabel;
    EdtTaxaDebito: TCurrencyEdit;
    Label6: TLabel;
    Label11: TLabel;
    ComboTipoCartao: TComboBox;
    BtnGrava: TButton;
    BtnExclui: TButton;
    DBGrid1: TDBGrid;
    DSBandeiras: TDataSource;
    QBandeiras: TFDQuery;
    QBandeirasCODIGO: TIntegerField;
    QBandeirasCODIGO_ADMINISTRADORA: TIntegerField;
    QBandeirasDESCRICAO: TStringField;
    QBandeirasATIVO: TStringField;
    QBandeirasTAXA_CREDITO: TBCDField;
    QBandeirasTAXA_DEBITO: TBCDField;
    QBandeirasDIAS_CREDITO: TIntegerField;
    QBandeirasDIAS_DEBITO: TIntegerField;
    QBandeirasTIPO_CARTAO: TStringField;
    QBandeirasCALC_TIPO: TStringField;
    EdtCodTEF: TEdit;
    EdtCodTEFBandeira: TEdit;
    QBandeirasCODIGO_TEF: TStringField;
    Image1: TImage;
    procedure Botoes(acao : string);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure EdtDiasCreditoEnter(Sender: TObject);
    procedure EdtDiasDebitoEnter(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    function  BuscaCodigoBandeira : integer;
    procedure LimpaBandeiras;
    procedure BuscaBandeiras;
    procedure BtnExcluiClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure QBandeirasCalcFields(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ComboTipoCartaoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmCadAdmCartaoCredito: TFrmCadAdmCartaoCredito;

implementation
uses
  Udm, Ubibli1, UConsAdmCartaoCredito, UNovoPrincipal;
var  bGrava : boolean;
     bGravaBandeira : boolean;

{$R *.dfm}

function FrmCadAdmCartaoCredito: TFrmCadAdmCartaoCredito;
begin
   Result := TFrmCadAdmCartaoCredito( BuscaFormulario( TFrmCadAdmCartaoCredito, False ) );
end;

procedure TFrmCadAdmCartaoCredito.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          panel3.Enabled       := true;
          panel4.Enabled       := false;
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadAdmCartaoCredito);
                btnExcluir.Enabled:= false
             end
          else
              btnExcluir.Enabled  := true;
          BtnConsultar.Enabled    := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadAdmCartaoCredito);
         Panel3.Enabled       := false;
         panel4.Enabled       := true;
         btnNovo.Enabled      := true;
         BtnGravar.Enabled    := false;
         btnCancelar.Enabled  := false;
         if (acao = 'C') or (acao = 'E') then
            btnalterar.Enabled:= false
         else
            btnalterar.Enabled:= true;
         if acao = 'G' then
            btnExcluir.Enabled:= true
         else
            BtnExcluir.Enabled:= false;
         BtnConsultar.Enabled := true;
      end;
end;

procedure TFrmCadAdmCartaoCredito.LimpaBandeiras;
begin 
   EdtCodBandeira.Clear;
   EdtNomeBandeira.Clear;
   CheckAtivo.Checked:= true;
   ComboTipoCartao.ItemIndex:= 0;
   EdtTaxaCredito.Clear;
   EdtTaxaDebito.Clear;
   EdtDiasCredito.Clear;
   EdtDiasDebito.Clear;
   EdtCodTEFBandeira.Clear;
end;

procedure TFrmCadAdmCartaoCredito.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        bGravaBandeira:= true;
        if not DM.Acesso('C026','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             EdtDiasCredito.Text:= '0';
             EdtDiasDebito.Text:= '0';
             edtnome.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmCadAdmCartaoCredito.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  bGravaBandeira:= true;
  if not DM.Acesso('C026','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  EdtDiasCredito.Text:= '0';
  EdtDiasDebito.Text := '0';
  edtnome.SetFocus;
end;

procedure TFrmCadAdmCartaoCredito.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadAdmCartaoCredito.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C026','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmCadAdmCartaoCredito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRAdm.Active then
     IBTRAdm.Commit;
  IBSQLAdm.Close;
  QBandeiras.Close;
  Action:= caFree;
end;

procedure TFrmCadAdmCartaoCredito.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('C026','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;

  if edtnome.Text = '' then
     begin 
        AlertaCad('Digite o Nome da Administradora');
//        edtnome.SetFocus;
        exit;
     end;

  if IBTRAdm.Active then
     IBTRAdm.Commit;
  IBTRAdm.StartTransaction;
  try
    try
      with IBSQLAdm do
        begin 
           close;
           sql.Clear;
           if bGrava then
              begin 
                 codigo.Text:= inttostr(prxcod('administradora_cartao', 'codigo', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO ADMINISTRADORA_CARTAO(CODIGO, DESCRICAO, CODIGO_TEF) ' +
                         'VALUES(:COD, :NOME, :TEF)');
              end
           else
              begin 
                 sql.Add('UPDATE ADMINISTRADORA_CARTAO SET DESCRICAO = :NOME, ' +
                         'CODIGO_TEF = :TEF WHERE CODIGO = :COD');
              end;
           Parambyname('cod').AsInteger    := strtoint(codigo.Text);
           Parambyname('nome').AsString    := trim(edtnome.Text);
           Parambyname('tef').AsString     := trim(EdtCodTEF.Text);
           ExecOrOpen;
        end;
      IBTRAdm.Commit;
      Botoes('G');
    except
      IBTRAdm.Rollback;
      AlertaCad('Erro ao Gravar a Administradora');
    end;
  finally
    IBSQLAdm.Close;
    LimpaBandeiras;
    BuscaBandeiras;
    EdtNomeBandeira.SetFocus;
  end;
end;

procedure TFrmCadAdmCartaoCredito.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C026','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;

  if Application.MessageBox('Confirma a Exclusão da Administradora?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin 
        if IBTRAdm.Active then
           IBTRAdm.Commit;
        IBTRAdm.StartTransaction;
        try
          try
            with IBSQLAdm do
               begin 
                  close;
                  sql.Clear;
                  sql.Text:= 'DELETE FROM ADMINISTRADORA_CARTAO ' +
                             'WHERE CODIGO = :COD';
                  Parambyname('cod').AsInteger:= strtoint(codigo.Text);
                  ExecOrOpen;
                  Botoes('E');
               end;
            IBTRAdm.Commit;
          except
            IBTRAdm.Rollback;
            AlertaCad('Erro ao excluir a administradora');
          end;
        finally
          IBSQLAdm.close;
        end;
     end;
end;

procedure TFrmCadAdmCartaoCredito.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsAdmCartaoCredito, FrmConsAdmCartaoCredito);
  FrmConsAdmCartaoCredito.tag:= 0;
  FrmConsAdmCartaoCredito.showmodal;
end;

procedure TFrmCadAdmCartaoCredito.EdtDiasCreditoEnter(Sender: TObject);
begin 
  inherited;
  EdtDiasCredito.SelectAll;
end;

procedure TFrmCadAdmCartaoCredito.EdtDiasDebitoEnter(Sender: TObject);
begin 
  inherited;
  EdtDiasDebito.SelectAll;
end;

procedure TFrmCadAdmCartaoCredito.BtnGravaClick(Sender: TObject);
begin 
  inherited;
  if trim(codigo.Text) = '' then
     begin 
        AlertaCad('Selecione uma Administradora');
        exit;
     end;

  if IBTRAdm.Active then
     IBTRAdm.Commit;
  IBTRAdm.StartTransaction;
  try
    try
      with IBSQLAdm do
        begin 
           close;
           sql.Clear;
           if bGravaBandeira then
              begin 
                 EdtCodBandeira.Text:= inttostr(buscaCodigoBandeira);
                 sql.Add('INSERT INTO BANDEIRAS_CARTAO(CODIGO, CODIGO_ADMINISTRADORA,      ' +
                         'DESCRICAO, ATIVO, TAXA_CREDITO, TAXA_DEBITO, DIAS_CREDITO,       ' +
                         'DIAS_DEBITO, TIPO_CARTAO, CODIGO_TEF)                            ' +
                         'VALUES(:COD, :CODADM, :NOME, :ATIVO, :TXCRED, :TXDEB, :DIASCRED, ' +
                         ':DIASDEB, :TPCARTAO, :TEF)');
              end
           else
              begin 
                 sql.Add('UPDATE BANDEIRAS_CARTAO SET CODIGO_ADMINISTRADORA = :CODADM,       ' +
                         'DESCRICAO = :NOME, ATIVO = :ATIVO, TAXA_CREDITO = :TXCRED,         ' +
                         'TAXA_DEBITO = :TXDEB, DIAS_CREDITO = :DIASCRED,                    ' +
                         'DIAS_DEBITO = :DIASDEB, TIPO_CARTAO = :TPCARTAO, CODIGO_TEF = :TEF ' +
                         'WHERE CODIGO = :COD');
              end;
           Parambyname('cod').AsInteger    := strtoint(EdtCodBandeira.Text);
           Parambyname('codadm').AsInteger := strtoint(codigo.Text);
           Parambyname('nome').AsString    := trim(EdtNomeBandeira.Text);

           if CheckAtivo.Checked then
              Parambyname('ativo').AsString:= 'S'
           else
              Parambyname('ativo').AsString:= 'N';

           parambyname('txcred').AsCurrency := strtocurr(EdtTaxaCredito.Text);
           parambyname('txdeb').AsCurrency  := strtocurr(EdtTaxaDebito.Text);

           if trim(EdtDiasCredito.Text) = '' then
              parambyname('diascred').AsInteger:= 0
           else
              parambyname('diascred').AsInteger:= strtoint(EdtDiasCredito.Text);

           if trim(EdtDiasDebito.Text) = '' then
              parambyname('diasdeb').AsInteger:= 0
           else
              parambyname('diasdeb').AsInteger:= strtoint(EdtDiasDebito.Text);

           parambyname('tpcartao').AsString:= copy(ComboTipoCartao.Text, 1, 1);
           parambyname('tef').AsString     := trim(EdtCodTEFBandeira.Text);
           ExecOrOpen;
        end;
      IBTRAdm.Commit;
      BuscaBandeiras;
      LimpaBandeiras;
      bGravaBandeira:= true;
      EdtNomeBandeira.SetFocus;
    except
      IBTRAdm.Rollback;
      AlertaCad('Erro ao Gravar a Bandeira');
    end;
  finally
    IBSQLAdm.Close;
  end;
end;

function TFrmCadAdmCartaoCredito.BuscaCodigoBandeira : integer;
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.Text:= 'SELECT MAX(CODIGO) MAXCOD ' +
                        'FROM BANDEIRAS_CARTAO';
             open;
             result:= fieldbyname('maxcod').AsInteger + 1;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       result:= 0;
       AlertaCad('erro ao buscar o código da bandeira');
     end;
   finally
     dm.qconsulta.close;
   end;
end;

procedure TFrmCadAdmCartaoCredito.BuscaBandeiras;
begin 
   if IBTRAdm.Active then
      IBTRAdm.Commit;
   IBTRAdm.StartTransaction;
   with QBandeiras do
      begin 
         close;
         parambyname('cod').AsInteger:= strtoint(codigo.Text);
         open;
      end;
end;

procedure TFrmCadAdmCartaoCredito.BtnExcluiClick(Sender: TObject);
begin 
  inherited;
  if (QBandeiras.State = dsbrowse) and (QBandeirasCODIGO.AsInteger > 0) then
     begin 
        if Application.MessageBox('Confirma a Exclusão da Bandeira?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
           begin 
              if dm.IBTransaction.Active then
                 dm.IBTransaction.Commit;
              dm.IBTransaction.StartTransaction;
              try
                try
                  with dm.QConsulta do
                     begin 
                        close;
                        sql.Clear;
                        sql.Text:= 'DELETE FROM BANDEIRAS_CARTAO ' +
                                   'WHERE CODIGO = :COD';
                        parambyname('cod').AsInteger:= QBandeirasCODIGO.AsInteger;
                        ExecOrOpen;
                     end;
                  dm.IBTransaction.Commit;
                except
                  dm.IBTransaction.Rollback;
                  AlertaCad('Erro ao excluir a bandeira');
                end;
              finally
                bGravaBandeira:= true;
                dm.QConsulta.close;
                BuscaBandeiras;
              end;
           end;
        end;
end;

procedure TFrmCadAdmCartaoCredito.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin 
  inherited;
  if trim(QBandeirasATIVO.AsString) = 'N' then
      begin 
         DBGrid1.Canvas.Font.Color:= clRed;
         Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
      end;
end;

procedure TFrmCadAdmCartaoCredito.QBandeirasCalcFields(DataSet: TDataSet);
begin 
  inherited;
  if trim(QBandeirasTIPO_CARTAO.AsString) = 'C' then
     QBandeirasCALC_TIPO.AsString:= 'CRÉDITO'
  else
  if trim(QBandeirasTIPO_CARTAO.AsString) = 'D' then
     QBandeirasCALC_TIPO.AsString:= 'DÉBITO'
  else
  if trim(QBandeirasTIPO_CARTAO.AsString) = 'A' then
     QBandeirasCALC_TIPO.AsString:= 'AMBOS'
  else
     QBandeirasCALC_TIPO.AsString:= '';
end;

procedure TFrmCadAdmCartaoCredito.DBGrid1DblClick(Sender: TObject);
begin 
  inherited;
  bGravaBandeira:= false;
  EdtCodBandeira.Text   := QBandeirasCODIGO.AsString;
  EdtNomeBandeira.Text  := QBandeirasDESCRICAO.AsString;
  if trim(QBandeirasATIVO.AsString) = 'S' then
     CheckAtivo.Checked:= true
  else
     CheckAtivo.Checked:= false;

  if trim(QBandeirasTIPO_CARTAO.AsString) = 'C' then
     ComboTipoCartao.ItemIndex:= 0
  else
  if trim(QBandeirasTIPO_CARTAO.AsString) = 'D' then
     ComboTipoCartao.ItemIndex:= 1
  else
  if trim(QBandeirasTIPO_CARTAO.AsString) = 'A' then
     ComboTipoCartao.ItemIndex:= 2
  else
     ComboTipoCartao.ItemIndex:= -1;

  EdtTaxaCredito.Text     := QBandeirasTAXA_CREDITO.AsString;
  EdtTaxaDebito.Text      := QBandeirasTAXA_DEBITO.AsString;
  EdtDiasCredito.Text     := QBandeirasDIAS_CREDITO.AsString;
  EdtDiasDebito.Text      := QBandeirasDIAS_DEBITO.AsString;
  EdtCodTEFBandeira.Text  := QBandeirasCODIGO_TEF.AsString;
  EdtNomeBandeira.SetFocus;
end;

procedure TFrmCadAdmCartaoCredito.ComboTipoCartaoChange(Sender: TObject);
begin 
  inherited;
  case ComboTipoCartao.ItemIndex of
    0: begin 
          EdtTaxaDebito.clear;
          EdtDiasDebito.Clear;
          EdtTaxaCredito.Enabled:= true;
          EdtDiasCredito.Enabled:= true;
          EdtTaxaDebito.Enabled := false;
          EdtDiasDebito.Enabled := false;
       end;
    1: begin 
          EdtTaxaCredito.clear;
          EdtDiasCredito.Clear;
          EdtTaxaDebito.Enabled := true;
          EdtDiasDebito.Enabled := true;
          EdtTaxaCredito.Enabled:= false;
          EdtDiasCredito.Enabled:= false;
       end;
    2: begin 
          EdtTaxaCredito.Enabled := true;
          EdtTaxaDebito.Enabled  := true;
          EdtDiasCredito.Enabled := true;
          EdtDiasDebito.Enabled  := true;
       end;
  end;
end;

end.
