unit UCadVales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, ImgList, ComCtrls, ToolWin, ExtCtrls, Mask, Buttons, 
  StdCtrls, MatrixPrinter, rxToolEdit, rxCurrEdit, frxClass, acAlphaImageList, 
  UNovosComponentes, UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, 
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White, 
  dxSkinsdxStatusBarPainter, dxStatusBar, dxSkinMetropolisDark, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton,
  Data.DB;

type
  TFrmCadVales = class(TFrmCadastroNovo)
    Label4: TLabel;
    EdtCodFun: UNovosComponentes.TEdit;
    BtnConsFun: TsSpeedButton;
    BtnAddFun: TsSpeedButton;
    EdtNomeFun: TEdit;
    Label5: TLabel;
    Label1: TLabel;
    cod_vale: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtData: TDateTimePicker;
    Label10: TLabel;
    EdtValor: TCurrencyEdit;
    Label3: TLabel;
    EdtAutorizado: TEdit;
    Label6: TLabel;
    EdtPendente: TCurrencyEdit;
    IBSQLVale: TFDQuery;
    IBTRVale: TFDTransaction;
    MP: TMatrixPrinter;
    frxVale: TfrxReport;
    procedure BtnAddFunClick(Sender: TObject);
    procedure BtnConsFunClick(Sender: TObject);
    procedure EdtCodFunKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValorExit(Sender: TObject);
    procedure EdtCodFunKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodFunEnter(Sender: TObject);
    procedure EdtCodFunExit(Sender: TObject);
    procedure Botoes(acao : string);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure Imprimir;
    procedure BtnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmCadVales: TFrmCadVales;

implementation
uses
  Udm, Ubibli1, UCadFunc, UConsFunc, UConsValesFuncionario, Ext, UDialog, 
  UNovoPrincipal, UPrincipal;
var sGrava : boolean;

{$R *.dfm}

function FrmCadVales: TFrmCadVales;
begin
   Result := TFrmCadVales( BuscaFormulario( TFrmCadVales, False ) );
end;

procedure TFrmCadVales.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadVales, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadVales);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadVales);
         EDedit(FrmCadVales, false);
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

procedure TFrmCadVales.Imprimir;
var
    CaminhoRel: string;
begin 
//
   CaminhoRel := ExtractFilePath( Application.ExeName ) + '\Report\vale.fr3';
   if not FileExists( CaminhoRel ) then
      begin 
         KDialog( 'Arquivo vale.f3 não encontrado' ) ;
         exit;
      end;
   frxVale.LoadFromFile( CaminhoRel );
   frxVale.Variables[ 'empresa' ] := QuotedStr( trim(dm.RetornaStringTabela('RAZAO_EMP', 'empresa', 'cod_emp', iEmp)) ) ;
   frxVale.Variables[ 'valor' ] := QuotedStr( FormatFloat( '0.00', EdtValor.Value ));
   frxVale.Variables[ 'funcionario' ] := QuotedStr( EdtNomeFun.Text );
   frxVale.Variables[ 'local' ] := QuotedStr( trim(dm.RetornaStringTabela('CID_EMP', 'empresa', 'cod_emp', iEmp))  + ' - ' +
   trim(dm.RetornaStringTabela('EST_EMP', 'empresa', 'cod_emp', iEmp))) ;
   frxVale.Variables[ 'data_extenso' ] := QuotedStr( FormatDateTime('dddddd',Now) );
   frxVale.Variables[ 'valor_extenso' ] := QuotedStr( extenso( EdtValor.Text));
   frxVale.ShowReport( True );
end;

procedure TFrmCadVales.BtnAddFunClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadFunc,  True );
end;

procedure TFrmCadVales.BtnConsFunClick(Sender: TObject);
begin 
  inherited;
  application.CreateForm(TFrmConsFunc, FrmConsFunc);
  FrmConsFunc.Tag:= 2;
  FrmConsFunc.ShowModal;
end;

procedure TFrmCadVales.EdtCodFunKeyPress(Sender: TObject; var Key: Char);
begin 
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmCadVales.EdtValorExit(Sender: TObject);
begin 
  inherited;
  if EdtValor.Text = '0' then
     EdtValor.SetFocus;
end;

procedure TFrmCadVales.EdtCodFunKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsFun.Click
  else
     if key = vk_f2 then
        BtnAddFun.Click;
end;

procedure TFrmCadVales.EdtCodFunEnter(Sender: TObject);
begin 
  inherited;
  EdtCodFun.SelectAll;
end;

procedure TFrmCadVales.EdtCodFunExit(Sender: TObject);
begin 
  inherited;
  if (ToolBar1.Focused) or (EdtCodFun.Text = '')  then
     exit;
  EdtNomeFun.Text:= Consulta('funcionario', EdtCodFun, 'cod_fun', 'nome_fun', dm.IBTransaction, dm.qConsulta);
  if EdtNomeFun.Text = '' then
     begin 
        AlertaCad('Funcionário não cadastrado');
//        EdtCodFun.SetFocus;
     end;
end;

procedure TFrmCadVales.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        sGrava:= true;
        if not DM.Acesso('M031','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             EdtData.Date:= date;
             EdtCodFun.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmCadVales.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  sGrava:= true;
  if not DM.Acesso('M031','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  EdtData.Date:= DATE;
  EdtCodFun.SetFocus;
end;

procedure TFrmCadVales.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadVales.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('M031','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  sGrava:= false;
  Botoes('A');
  EdtData.SetFocus;
end;

procedure TFrmCadVales.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRVale.Active then
     IBTRVale.Commit;
  IBSQLVale.Close;
  Action:= caFree;
end;

procedure TFrmCadVales.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (sGrava) and (not DM.Acesso('M031','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if IBTRVale.Active then
     IBTRVale.Commit;
  IBTRVale.StartTransaction;
  try
    try
      with IBSQLVale do
        begin 
           close;
           sql.Clear;
           if sGrava = true then
              begin 
                 cod_vale.Text:= inttostr(prxcod('vales_funcionario', 'cod_vale', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO VALES_FUNCIONARIO(COD_VALE, COD_FUN, DATA_VALE, VALOR_VALE, AUTORIZADO_VALE) ' +
                         'VALUES(:1, :2, :3, :4, :5)');
              end
           else
              begin 
                 sql.Add('UPDATE VALES_FUNCIONARIO SET COD_FUN = :2, DATA_VALE = :3, VALOR_VALE = :4, ' +
                         'AUTORIZADO_VALE = :5 WHERE COD_VALE = :1');
              end;
           Parambyname('1').AsInteger   := strtoint(cod_vale.Text);
           Parambyname('2').AsInteger   := strtoint(EdtCodFun.Text);
           Parambyname('3').AsDate      := EdtData.Date;
           Parambyname('4').AsCurrency  := strtocurr(EdtValor.Text);
           Parambyname('5').AsString    := trim(EdtAutorizado.Text);
           ExecOrOpen;
        end;
      IBTRVale.Commit;
      Botoes('G');
    except
      IBTRVale.Rollback;
      AlertaCad('Erro ao Gravar o Lançamento');
    end;
  finally
    IBSQLVale.Close;
    if application.MessageBox('Confirma a Impressão', 'Impressão do Vale', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton1) = 6 then
       begin 
          imprimir;
       end;
  end;
end;

procedure TFrmCadVales.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('M031','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadVales, 'vales_funcionario', cod_vale, IBSQLVale, IBTRVale);
  Botoes('E');
end;

procedure TFrmCadVales.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsValesFuncionario, FrmConsValesFuncionario);
  FrmConsValesFuncionario.tag:= 0;
  FrmConsValesFuncionario.showmodal;
end;

end.
