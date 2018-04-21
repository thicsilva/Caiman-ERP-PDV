unit UCadTeclasAtalho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, ImgList, acAlphaImageList, ComCtrls, ToolWin, ExtCtrls, 
  StdCtrls, UNovosComponentes, UNovoFormulario, DB, Grids, DBGrids, Buttons, 
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, 
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, 
  dxStatusBar, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TfrmCadTeclasAtalho = class(TFrmCadastroNovo)
    Label2: TLabel;
    edtTecla: TEdit;
    Label1: TLabel;
    edtDescricao: TEdit;
    TRTeclas: TFDTransaction;
    QTeclas: TFDQuery;
    pnlTeclas: TPanel;
    TRSubTeclas: TFDTransaction;
    QSubTeclas: TFDQuery;
    QSubTeclasNUMERO: TSmallintField;
    QSubTeclasTECLA: TStringField;
    QSubTeclasCOD_PRO: TIntegerField;
    DBGrid1: TDBGrid;
    dsSubTeclas: TDataSource;
    QSubTeclasDESC_CUPOM: TStringField;
    Label3: TLabel;
    edtNum: TEdit;
    Label73: TLabel;
    edtCodPro: TEdit;
    btnConsProduto: TsSpeedButton;
    Label74: TLabel;
    edtproduto: TEdit;
    BtnGravarFor: TButton;
    BtnExcFor: TButton;
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure Botoes(acao : string);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure MostraTeclas;
    procedure btnConsProdutoClick(Sender: TObject);
    procedure edtCodProExit(Sender: TObject);
    procedure BtnExcForClick(Sender: TObject);
    procedure BtnGravarForClick(Sender: TObject);
    procedure edtCodProKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

  public
    { Public declarations }
    bGrava : boolean;
  end;

  function frmCadTeclasAtalho: TfrmCadTeclasAtalho;

implementation

uses
  UDM, Ubibli1, UConsTeclasAtalho, UConsProd, UNovoPrincipal;

{$R *.dfm}

function frmCadTeclasAtalho: TfrmCadTeclasAtalho;
begin
   Result := TfrmCadTeclasAtalho( BuscaFormulario( TfrmCadTeclasAtalho, False ) );
end;

procedure TfrmCadTeclasAtalho.Botoes(acao : string);
begin
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }
   pnlTeclas.Visible := false;
   if (acao = 'N') or (acao = 'A') then
      begin
          EDedit(Self, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin
                Limpaedit(Self);
                btnExcluir.Enabled   := false
             end
          else
              begin
                 MostraTeclas;
                 btnExcluir.Enabled   := true;
              end;
          BtnConsultar.Enabled := false;
      end
   else
      begin
         if not (acao = 'G') then
            Limpaedit(Self);
         EDedit(Self, false);
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


procedure TfrmCadTeclasAtalho.BtnAlterarClick(Sender: TObject);
begin
  inherited;
  if not DM.Acesso('C1031','A') then
     begin
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  edtDescricao.SetFocus;
  edtTecla.ReadOnly := true;
end;

procedure TfrmCadTeclasAtalho.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  Botoes('C');
end;

procedure TfrmCadTeclasAtalho.btnConsProdutoClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm( TFrmConsProd, FrmConsProd );
  FrmConsProd.Tag := 102;
  FrmConsProd.ShowModal;
end;

procedure TfrmCadTeclasAtalho.BtnConsultarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmConsTeclasAtalho, frmConsTeclasAtalho);
  frmConsTeclasAtalho.Tag:= 0;
  frmConsTeclasAtalho.ShowModal;

end;

procedure TfrmCadTeclasAtalho.BtnExcForClick(Sender: TObject);
begin
  inherited;
  if QSubTeclasNUMERO.IsNull then
     Exit;
  if dm.IBTransaction.Active then
     DM.IBTransaction.Commit;
  DM.IBTransaction.StartTransaction;
  try
      with Dm.QConsulta do
        begin
            Close;
            SQL.Clear;
            SQL.Text := 'delete from GRUPO_TECLAS_DETALHES where TECLA=:TECLA and NUMERO=:NUMERO';
            ParamByName( 'TECLA' ).AsString := edtTecla.Text;
            ParamByName( 'NUMERO' ).AsInteger := QSubTeclasNUMERO.AsInteger;
            ExecOrOpen;
        end;
      DM.IBTransaction.Commit;
  except
      DM.IBTransaction.Rollback;
  end;
  MostraTeclas;
end;

procedure TfrmCadTeclasAtalho.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  if not DM.Acesso('C1031','E') then
     begin
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if TRTeclas.Active  then
    TRTeclas.Commit;
  TRTeclas.StartTransaction;
  try
      with QTeclas do
         begin

                  Close;
                  SQL.Clear;
                  SQL.Text := 'delete from GRUPO_TECLAS_DETALHES where TECLA=:TECLA';
                  ParamByName( 'TECLA' ).AsString := edtTecla.Text;
                  ExecOrOpen;
                  Close;
                  SQL.Clear;
                  SQL.Text := 'delete from GRUPO_TECLAS where TECLA=:TECLA';
                  ParamByName( 'TECLA' ).AsString := edtTecla.Text;
                  ExecOrOpen;
                  Close;
         end;
       TRTeclas.Commit;
  except
      AlertaCad( 'Erro ao excluir grupo de tecla' );
      TRTeclas.Rollback;
  end;


  Botoes('E');

end;

procedure TfrmCadTeclasAtalho.BtnGravarClick(Sender: TObject);
begin
  inherited;
  if (bGrava) and (not DM.Acesso('C1031','I')) then
     begin
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if TRTeclas.Active then
     TRTeclas.Commit;
  TRTeclas.StartTransaction;
  try
    try
      with QTeclas do
        begin
           close;
           sql.Clear;
           if bGrava then
              begin
                 sql.Add('INSERT INTO GRUPO_TECLAS( TECLA, DESCRICAO ) VALUES( :TECLA, :DESCRICAO )');
              end
           else
              begin
                 sql.Add('UPDATE GRUPO_TECLAS SET DESCRICAO=:DESCRICAO WHERE TECLA=:TECLA ');
              end;
           ParamByName( 'TECLA' ).AsString := edtTecla.Text;
           ParamByName( 'DESCRICAO' ).AsString := edtDescricao.Text;
           ExecOrOpen;
        end;
           TRTeclas.Commit;
           Botoes( 'G' );
    except
      TRTeclas.Rollback;
      AlertaCad('Erro ao Gravar o Vendedor');
    end;
  finally
    QTeclas.Close;
  end;
end;

procedure TfrmCadTeclasAtalho.BtnGravarForClick(Sender: TObject);
begin
  inherited;
  //
  if DM.IBTransaction.Active then
     DM.IBTransaction.Commit;
  DM.IBTransaction.StartTransaction;
  try
     with dm.QConsulta do
        begin
           Close;
           SQL.Clear;
           SQL.Text := 'insert into GRUPO_TECLAS_DETALHES( numero, tecla, cod_pro )' +
                       ' values ( :numero, :tecla, :cod_pro )';
           ParamByName( 'numero' ).AsInteger := StrToInt( edtNum.Text );
           ParamByName( 'tecla' ).AsString := edtTecla.Text;
           ParamByName( 'cod_pro' ).AsInteger := StrToInt( edtCodPro.Text );
           ExecOrOpen;
           DM.IBTransaction.Commit;
        end;
  except
     DM.IBTransaction.Rollback;
     AlertaCad( 'Erro ao Gravar Tecla' );
  end;
  MostraTeclas;

end;

procedure TfrmCadTeclasAtalho.BtnNovoClick(Sender: TObject);
begin
  inherited;
    bGrava:= true;
  if not DM.Acesso('C1031','I') then
     begin
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  edtTecla.ReadOnly := False;
  edtTecla.SetFocus;
end;

procedure TfrmCadTeclasAtalho.edtCodProExit(Sender: TObject);
begin
  inherited;
   if trim(EdtCodPro.Text) = '' then
      exit;


   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.clear;
             sql.Add('SELECT P.COD_PRO, P.NOME_PRO, U.DESCRICAO ' +
                     'FROM PRODUTO P ' +
                     'INNER JOIN UNIDADE_MEDIDA U ' +
                     'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO) ' +
                     'WHERE P.COD_PRO = :CODPRO');
             Parambyname('codpro').AsInteger:= strtoint(EdtCodPro.Text);
             Open;
             if not fieldbyname('cod_pro').IsNull then
                begin
                   edtproduto.Text := FieldByName( 'NOME_PRO' ).AsString;
                end
             else
                begin
                   edtproduto.Clear;
                   AlertaCad('Produto não Cadastrado');
//                   EdtCodPro.SetFocus;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar o produto');
     end;
   finally
     dm.QConsulta.Close;
   end;

end;

procedure TfrmCadTeclasAtalho.edtCodProKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = vk_f3 then
     begin
         btnConsProduto.Click;
     end;

end;

procedure TfrmCadTeclasAtalho.FormShow(Sender: TObject);
begin
  inherited;
  edtTecla.Obrigatorio := True;
  edtDescricao.Obrigatorio := True;
  BtnNovo.Click;
  edtTecla.SetFocus;
end;

procedure TfrmCadTeclasAtalho.MostraTeclas;
begin
                 pnlTeclas.Visible := true;
                 if TRSubTeclas.Active then
                    TRSubTeclas.Commit;;
                 TRSubTeclas.StartTransaction;
                 QSubTeclas.ParamByName( 'TECLA' ).AsString := edtTecla.Text;
                 QSubTeclas.Open;
                 edtNum.Clear;
                 edtCodPro.Clear;
                 edtproduto.Clear;

end;

end.
