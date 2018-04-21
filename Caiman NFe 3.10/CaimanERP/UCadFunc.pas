unit UCadFunc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, ImgList, ComCtrls, ToolWin, ExtCtrls, Mask, StdCtrls, 
  pngimage, UNovosComponentes, UNovoFormulario, cxGraphics, cxControls, 
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, 
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White, 
  dxSkinsdxStatusBarPainter, acAlphaImageList, dxStatusBar, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, dxSkinMetropolisDark, Data.DB,
  System.ImageList;

type
  TFrmCadFunc = class(TFrmCadastroNovo)
    Label1: TLabel;
    cod_func: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    Label6: TLabel;
    EdtEnd: TEdit;
    Label7: TLabel;
    EdtBai: TEdit;
    EdtCid: TEdit;
    Label8: TLabel;
    ComboEst: TComboBox;
    Label9: TLabel;
    EdtCep: TMaskEdit;
    Label10: TLabel;
    EdtCPF: TMaskEdit;
    Label11: TLabel;
    EdtDoc: TEdit;
    Label4: TLabel;
    EdtTel: TMaskEdit;
    Label5: TLabel;
    EdtCel: TMaskEdit;
    Label12: TLabel;
    EdtObs: TEdit;
    Label3: TLabel;
    Label13: TLabel;
    EdtDataAdm: TMaskEdit;
    EdtDataDem: TMaskEdit;
    Label14: TLabel;
    IBTRFunc: TFDTransaction;
    IBSQLFunc: TFDQuery;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure EdtDataAdmExit(Sender: TObject);
    procedure EdtDataDemExit(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure EdtCPFExit(Sender: TObject);
    procedure Botoes(acao : string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function FrmCadFunc: TFrmCadFunc;

implementation
uses
  Udm, Ubibli1, UConsFunc, UNovoPrincipal;
var vl_grava : boolean;

{$R *.dfm}

function FrmCadFunc: TFrmCadFunc;
begin
   Result := TFrmCadFunc( BuscaFormulario( TFrmCadFunc, False ) );
end;

procedure TFrmCadFunc.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadFunc, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadFunc);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadFunc);
         EDedit(FrmCadFunc, false);
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


procedure TFrmCadFunc.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        vl_grava:= true;
        if not DM.Acesso('C014','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             edtdataadm.Text:= datetostr(date);
             edtdataadm.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmCadFunc.EdtDataAdmExit(Sender: TObject);
begin 
  inherited;
  if EdtDataAdm.Text = '  /  /    ' then
     exit;
  try
    strtodate(EdtDataAdm.Text);
  except
    AlertaCad('Data Inválida');
//    EdtDataAdm.SetFocus;
  end;

end;

procedure TFrmCadFunc.EdtDataDemExit(Sender: TObject);
begin 
  inherited;
  if EdtDataDem.Text = '  /  /    ' then
     exit;
  try
    strtodate(EdtDataDem.Text);
  except
    AlertaCad('Data Inválida');
//    edtdatadem.SetFocus;
  end;
end;

procedure TFrmCadFunc.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  vl_grava:= true;
  if not DM.Acesso('C014','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  edtdataadm.Text:= datetostr(date);
  edtdataadm.SetFocus;
end;

procedure TFrmCadFunc.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadFunc.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C014','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  vl_grava:= false;
  Botoes('A');
  EdtDataAdm.SetFocus;
end;

procedure TFrmCadFunc.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
  inherited;
  if IBTRFunc.Active then
     IBTRFunc.Commit;
  IBSQLFunc.Close;
  Action:= caFree;
end;

procedure TFrmCadFunc.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (vl_grava) and (not DM.Acesso('C014','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if edtnome.Text = '' then
     begin 
        AlertaCad('Digite o Nome do Funcionário');
//        edtnome.SetFocus;
        exit;
     end;
  if IBTRFunc.Active then
     IBTRFunc.Commit;
  IBTRFunc.StartTransaction;
  try
    try
      with IBSQLFunc do
        begin 
           close;
           sql.Clear;
           if vl_grava = true then
              begin 
                 cod_func.Text:= inttostr(prxcod('funcionario', 'cod_fun', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO FUNCIONARIO(COD_FUN, DATA_ADM_FUN, DATA_DEM_FUN, NOME_FUN, END_FUN, BAI_FUN, CID_FUN, CEP_FUN, EST_FUN, CPF_FUN, DOC_FUN, TEL_FUN, CEL_FUN, OBS) ' +
                                          'VALUES(:CODFUN, :DATA_ADMFUN, :DATA_DEMFUN, :NOMEFUN, :ENDFUN, :BAIFUN, :CIDFUN, :CEPFUN, :ESTFUN, :CPFFUN, :DOCFUN, :TELFUN, :CELFUN, :OB)');
              end
           else
              begin 
                 sql.Add('UPDATE FUNCIONARIO SET DATA_ADM_FUN = :DATA_ADMFUN, DATA_DEM_FUN = :DATA_DEMFUN, NOME_FUN = :NOMEFUN, END_FUN = :ENDFUN, BAI_FUN = :BAIFUN, CID_FUN = :CIDFUN, ' +
                         'CEP_FUN = :CEPFUN, EST_FUN = :ESTFUN, CPF_FUN = :CPFFUN, DOC_FUN = :DOCFUN, TEL_FUN = :TELFUN, CEL_FUN = :CELFUN, OBS = :OB WHERE COD_FUN = :CODFUN');
              end;
           Parambyname('codfun').AsInteger     := strtoint(cod_func.Text);
           Parambyname('data_admfun').AsDate   := strtodate(EdtDataAdm.Text);
           if EdtDataDem.Text = '  /  /    ' then
              Parambyname('data_demfun').Value := null
           else
              Parambyname('data_demfun').AsDate:= strtodate(EdtDataDem.Text);
           Parambyname('nomefun').AsString     := edtnome.Text;
           if edtend.Text = '' then
              Parambyname('endfun').value      := null
           else
              Parambyname('endfun').AsString   := edtend.Text;
           if edtbai.Text = '' then
              Parambyname('baifun').value      := null
           else
              Parambyname('baifun').AsString   := edtbai.Text;
           if edtcid.Text = '' then
              Parambyname('cidfun').value      := null
           else
              Parambyname('cidfun').AsString   := edtcid.Text;
           Parambyname('cepfun').AsString      := edtcep.Text;
           Parambyname('estfun').AsString      := ComboEst.Text;
           Parambyname('cpffun').AsString      := edtcpf.Text;
           if edtdoc.Text = '' then
              Parambyname('docfun').value      := null
           else
              Parambyname('docfun').AsString   := edtdoc.Text;
           Parambyname('telfun').AsString      := edttel.Text;
           Parambyname('celfun').AsString      := edtcel.Text;
           if edtobs.Text = '' then
              Parambyname('ob').value          := null
           else
              Parambyname('ob').AsString       := edtobs.Text;
           ExecOrOpen;
        end;
      IBTRFunc.Commit;
      Botoes('G');
    except
      IBTRFunc.Rollback;
      AlertaCad('Erro ao Gravar o Funcionário');
    end;
  finally
    IBSQLFunc.Close;
  end;
end;

procedure TFrmCadFunc.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C014','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadFunc, 'funcionario', cod_func, IBSQLFunc, IBTRFunc);
  Botoes('E');
end;

procedure TFrmCadFunc.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsFunc, FrmConsFunc);
  FrmConsFunc.tag := 0;
  FrmConsFunc.showmodal;
end;

procedure TFrmCadFunc.EdtCPFExit(Sender: TObject);
begin 
  inherited;
  if EdtCPF.Text = '   .   .   -  ' then
     exit;
  if not cpf(RetiraCaracter(EdtCPF.Text)) then
     begin 
        AlertaCad('CPF Inválido');
//        EdtCPF.SetFocus;
     end;
end;

end.
