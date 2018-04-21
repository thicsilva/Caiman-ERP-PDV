unit UCadConvenio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCADNOVO, Buttons, ExtCtrls, ComCtrls, StdCtrls, Mask, ImgList, 
  ToolWin, rxToolEdit, rxCurrEdit, acPNG, acAlphaImageList, UNovosComponentes, 
  UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, dxSkinMetropolisDark, 
  dxSkinsdxStatusBarPainter, dxStatusBar, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, Data.DB;

type
  TFrmCadConvenio = class(TFrmCadastroNovo)
    Label1: TLabel;
    cod_con: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    Label3: TLabel;
    EdtEnd: TEdit;
    Label4: TLabel;
    EdtBai: TEdit;
    Label5: TLabel;
    EdtCid: TEdit;
    Label6: TLabel;
    ComboEst: TComboBox;
    Label7: TLabel;
    EdtCep: TMaskEdit;
    Label8: TLabel;
    ComboAtivo: TComboBox;
    Label9: TLabel;
    EdtCNPJ: TMaskEdit;
    Label10: TLabel;
    EdtInsc: TEdit;
    Label11: TLabel;
    EdtTel: TMaskEdit;
    EdtFax: TMaskEdit;
    Label12: TLabel;
    EdtResp: TEdit;
    IBSQLCon: TFDQuery;
    IBTRCon: TFDTransaction;
    MemoTermo: TMemo;
    Label13: TLabel;
    Label14: TLabel;
    ComboDia: TComboBox;
    Label15: TLabel;
    EdtDesconto: TCurrencyEdit;
    Label16: TLabel;
    Image1: TImage;
    procedure EdtCNPJExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure Botoes(acao : string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function FrmCadConvenio: TFrmCadConvenio;

implementation
uses
  Udm, Ubibli1, UConsConvenio, UNovoPrincipal;
var vl_grava : boolean;

{$R *.dfm}

function FrmCadConvenio: TFrmCadConvenio;
begin
   Result := TFrmCadConvenio( BuscaFormulario( TFrmCadConvenio, False ) );
end;

procedure TFrmCadConvenio.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadConvenio, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadConvenio);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadConvenio);
         EDedit(FrmCadConvenio, false);
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

procedure TFrmCadConvenio.EdtCNPJExit(Sender: TObject);
begin 
  inherited;
  if edtcnpj.Text = '  .   .   /    -  ' then
     exit;
  if not cnpj(edtcnpj.Text) then
     begin 
        AlertaCad('CNPJ Inválido');
//        edtcnpj.SetFocus;
     end;
end;

procedure TFrmCadConvenio.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        vl_grava:= true;
        if not DM.Acesso('C003','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             comboativo.ItemIndex:= 0;
             edtnome.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmCadConvenio.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  vl_grava:= true;
  if not DM.Acesso('C003','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  comboativo.ItemIndex:= 0;
  edtnome.SetFocus;
end;

procedure TFrmCadConvenio.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadConvenio.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C003','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  vl_grava:= false;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmCadConvenio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRCon.Active then
     IBTRCon.Commit;
  IBSQLCon.Close;
  Action:= caFree;
end;

procedure TFrmCadConvenio.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (vl_grava) and (not DM.Acesso('C003','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if edtnome.Text = '' then
     begin 
        AlertaCad('Digite o Nome do Convênio');
//        edtnome.SetFocus;
        exit;
     end;
  if IBTRCon.Active then
     IBTRCon.Commit;
  IBTRCon.StartTransaction;
  try
    try
      with IBSQLCon do
        begin 
           close;
           sql.Clear;
           if vl_grava = true then
              begin 
                 cod_con.Text:= inttostr(prxcod('convenio', 'cod_con', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO CONVENIO(COD_CON, NOME_CON, END_CON, BAI_CON, CID_CON, CEP_CON, TEL_CON, FAX_CON, ATIVO_CON, RESPONSAVEL_CON, CNPJ_CON, INSC_CON, ' +
                         'EST_CON, OBS_AUTORIZACAO_CON, DIA_REFERENCIA_CON, DESCONTO_CON) ' +
                         'VALUES(:CODCON, :NOMECON, :ENDCON, :BAICON, :CIDCON, :CEPCON, :TELCON, :FAXCON, :ATIVOCON, :RESPONSAVELCON, :CNPJCON, :INSCCON, ' +
                         ':ESTCON, :OBS_AUTORIZACAOCON, :DIA_REFERENCIACON, :DESCONTOCON)');
              end
           else
              begin 
                 sql.Add('UPDATE CONVENIO SET NOME_CON = :NOMECON, END_CON = :ENDCON, BAI_CON = :BAICON, CID_CON = :CIDCON, EST_CON = :ESTCON, CEP_CON = :CEPCON, TEL_CON = :TELCON, ' +
                                                         'FAX_CON = :FAXCON, ATIVO_CON = :ATIVOCON, RESPONSAVEL_CON = :RESPONSAVELCON, CNPJ_CON = :CNPJCON, INSC_CON = :INSCCON, ' +
                                                         'OBS_AUTORIZACAO_CON = :OBS_AUTORIZACAOCON, DIA_REFERENCIA_CON = :DIA_REFERENCIACON, DESCONTO_CON = :DESCONTOCON WHERE COD_CON = :CODCON');
              end;
           Parambyname('codcon').AsInteger               := strtoint(cod_con.Text);
           Parambyname('nomecon').AsString               := edtnome.Text;
           if edtend.Text = '' then
              Parambyname('endcon').Value                := null
           else
              Parambyname('endcon').AsString             := edtend.Text;
           if edtbai.Text = '' then
              Parambyname('baicon').Value                := null
           else
              Parambyname('baicon').AsString             := edtbai.Text;
           if edtcid.Text = '' then
              Parambyname('cidcon').Value                := null
           else
              Parambyname('cidcon').AsString             := edtcid.Text;
           Parambyname('estcon').AsString                := comboest.Text;
           Parambyname('cepcon').AsString                := edtcep.Text;
           Parambyname('telcon').AsString                := edttel.Text;
           Parambyname('faxcon').AsString                := edtfax.Text;
           Parambyname('ativocon').AsString              := copy(comboativo.Text, 1, 1);
           if edtresp.Text = '' then
              Parambyname('responsavelcon').Value        := null
           else
              Parambyname('responsavelcon').AsString     := edtresp.Text;
           Parambyname('cnpjcon').AsString               := edtcnpj.Text;
           Parambyname('insccon').AsString               := edtinsc.Text;
           if MemoTermo.Text = '' then
              Parambyname('obs_autorizacaocon').Value    := null
           else
              Parambyname('obs_autorizacaocon').AsString := MemoTermo.Text;
           if ComboDia.Text = '' then
              Parambyname('dia_referenciacon').Value     := null
           else
              Parambyname('dia_referenciacon').AsInteger := strtoint(ComboDia.Text);
           if edtdesconto.Text = '0' then
              Parambyname('descontocon').Value           := null
           else
              Parambyname('descontocon').AsFloat         := strtofloat(edtdesconto.Text);
           ExecOrOpen;
        end;
      IBTRCon.Commit;
      Botoes('G');
    except
      IBTRCon.Rollback;
      AlertaCad('Erro ao Gravar o Convênio');
    end;
  finally
    IBSQLCon.Close;
  end;
end;

procedure TFrmCadConvenio.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C003','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadConvenio, 'convenio', cod_con, IBSQLCon, IBTRCon);
  Botoes('E');
end;

procedure TFrmCadConvenio.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsConvenio, FrmConsConvenio);
  FrmConsConvenio.tag:=0;
  FrmConsConvenio.showmodal;
end;

end.

