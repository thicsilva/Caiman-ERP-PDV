unit UCadBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, Buttons, ExtCtrls, ComCtrls, StdCtrls, ImgList, ToolWin, 
  acPNG, UNovosComponentes, UNovoFormulario, cxGraphics, cxControls, 
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, 
  dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, acAlphaImageList, 
  dxStatusBar, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, Data.DB, System.ImageList;

type
  TFrmCadBanco = class(TFrmCadastroNovo)
    Label1: TLabel;
    cod_ban: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    IBSQLBan: TFDQuery;
    IBTRBan: TFDTransaction;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    EdtLinhaEmi: UNovosComponentes.TEdit;
    EdtColEmi: UNovosComponentes.TEdit;
    Label4: TLabel;
    EdtLinhaDoc: UNovosComponentes.TEdit;
    EdtColDoc: UNovosComponentes.TEdit;
    Label5: TLabel;
    EdtLinhaVenc: UNovosComponentes.TEdit;
    EdtColVenc: UNovosComponentes.TEdit;
    Label6: TLabel;
    EdtLinhaValor: UNovosComponentes.TEdit;
    EdtColValor: UNovosComponentes.TEdit;
    Label7: TLabel;
    EdtLinhaInst: UNovosComponentes.TEdit;
    EdtColInst: UNovosComponentes.TEdit;
    Label8: TLabel;
    EdtLinhaSac: UNovosComponentes.TEdit;
    EdtColSac: UNovosComponentes.TEdit;
    Label9: TLabel;
    EdtLinhasFinal: UNovosComponentes.TEdit;
    CheckParc: TCheckBox;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure cod_banKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsultarClick(Sender: TObject);
    procedure Botoes(acao : string);
    procedure EdtLinhaVencEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmCadBanco: TFrmCadBanco;

implementation
uses
  Udm, Ubibli1, UConsBanco, UNovoPrincipal;
var vl_grava : boolean;

{$R *.dfm}

function FrmCadBanco: TFrmCadBanco;
begin
   Result := TFrmCadBanco( BuscaFormulario( TFrmCadBanco, False ) );
end;

procedure TFrmCadBanco.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadBanco, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadBanco);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadBanco);
         EDedit(FrmCadBanco, false);
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

procedure TFrmCadBanco.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        vl_grava:= true;
        if not DM.Acesso('C010','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             cod_ban.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmCadBanco.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  vl_grava:= true;
  if not DM.Acesso('C010','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  cod_ban.SetFocus;
end;

procedure TFrmCadBanco.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadBanco.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C010','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  vl_grava:= false;
  Botoes('A');
  cod_ban.Enabled:= false;
  edtnome.SetFocus;
end;

procedure TFrmCadBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRBan.Active then
     IBTRBan.Commit;
  IBSQLBan.Close;
  Action:= caFree;
end;

procedure TFrmCadBanco.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (vl_grava) and (not DM.Acesso('C010','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if edtnome.Text = '' then
     begin 
        AlertaCad('Digite o Nome do Banco');
//        edtnome.SetFocus;
        exit;
     end;
  if IBTRBan.Active then
     IBTRBan.Commit;
  IBTRBan.StartTransaction;
  try
    try
      with IBSQLBan do
        begin 
           close;
           sql.Clear;
           if vl_grava = true then
              begin 
                 sql.Add('INSERT INTO BANCO(COD_BAN, NOME_BAN, LINHA_EMISSAO_BOLETO, ' +
                         'COL_EMISSAO_BOLETO, LINHA_DOC_BOLETO, COL_DOC_BOLETO, ' +
                         'LINHA_VENC_BOLETO, COL_VENC_BOLETO, LINHA_VALOR_BOLETO, COL_VALOR_BOLETO, ' +
                         'LINHA_INST_BOLETO, COL_INST_BOLETO, LINHA_SACADO_BOLETO, COL_SACADO_BOLETO, ' +
                         'LINHAS_FINAL_BOLETO, IMPRIMIR_PARCELA_BOLETO) ' +
                         'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11, :12, :13, :14, :15, :16)');
              end
           else
              begin 
                 sql.Add('UPDATE BANCO SET NOME_BAN = :2, LINHA_EMISSAO_BOLETO = :3, COL_EMISSAO_BOLETO = :4, ' +
                         'LINHA_DOC_BOLETO = :5, COL_DOC_BOLETO = :6, LINHA_VENC_BOLETO = :7, COL_VENC_BOLETO = :8, ' +
                         'LINHA_VALOR_BOLETO = :9, COL_VALOR_BOLETO = :10, LINHA_INST_BOLETO = :11, COL_INST_BOLETO = :12, ' +
                         'LINHA_SACADO_BOLETO = :13, COL_SACADO_BOLETO = :14, LINHAS_FINAL_BOLETO = :15, IMPRIMIR_PARCELA_BOLETO = :16 ' +
                         'WHERE COD_BAN = :1');
              end;
           Parambyname('1').AsInteger     := strtoint(cod_ban.Text);
           Parambyname('2').AsString      := edtnome.Text;
           if EdtLinhaEmi.Text = '' then
              Parambyname('3').AsInteger  := 0
           else
              Parambyname('3').AsInteger  := strtoint(EdtLinhaEmi.Text);
           if EdtColEmi.Text = '' then
              Parambyname('4').AsInteger  := 0
           else
              Parambyname('4').AsInteger  := strtoint(EdtColEmi.Text);
           if EdtLinhaDoc.Text = '' then
              Parambyname('5').AsInteger  := 0
           else
              Parambyname('5').AsInteger  := strtoint(EdtLinhaDoc.Text);
           if EdtColDoc.Text = '' then
              Parambyname('6').AsInteger  := 0
           else
              Parambyname('6').AsInteger  := strtoint(EdtColDoc.Text);
           if EdtLinhaVenc.Text = '' then
              Parambyname('7').AsInteger  := 0
           else
              Parambyname('7').AsInteger  := strtoint(EdtLinhaVenc.Text);
           if EdtColVenc.Text = '' then
              Parambyname('8').AsInteger  := 0
           else
              Parambyname('8').AsInteger  := strtoint(EdtColVenc.Text);
           if EdtLinhaValor.Text = '' then
              Parambyname('9').AsInteger  := 0
           else
              Parambyname('9').AsInteger  := strtoint(EdtLinhaValor.Text);
           if EdtColValor.Text = '' then
              Parambyname('10').AsInteger := 0
           else
              Parambyname('10').AsInteger := strtoint(EdtColValor.Text);
           if EdtLinhaInst.Text = '' then
              Parambyname('11').AsInteger := 0
           else
              Parambyname('11').AsInteger := strtoint(EdtLinhaInst.Text);
           if EdtColInst.Text = '' then
              Parambyname('12').AsInteger := 0
           else
              Parambyname('12').AsInteger := strtoint(EdtColInst.Text);
           if EdtLinhaSac.Text = '' then
              Parambyname('13').AsInteger := 0
           else
              Parambyname('13').AsInteger := strtoint(EdtLinhaSac.Text);
           if EdtColSac.Text = '' then
              Parambyname('14').AsInteger := 0
           else
              Parambyname('14').AsInteger := strtoint(EdtColSac.Text);
           if EdtLinhasFinal.Text = '' then
              Parambyname('15').AsInteger := 0
           else
              Parambyname('15').AsInteger := strtoint(EdtLinhasFinal.Text);
           if CheckParc.Checked then
              Parambyname('16').AsString  := 'S'
           else
              Parambyname('16').AsString  := 'N';
           ExecOrOpen;
        end;
      IBTRBan.Commit;
      Botoes('G');
    except
      IBTRBan.Rollback;
      AlertaCad('Erro ao Gravar o Banco' + #13 +
                  'Verifique se já foi gravado com este código');
    end;
  finally
    IBSQLBan.Close;
  end;
end;

procedure TFrmCadBanco.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C010','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadBanco, 'banco', cod_ban, IBSQLBan, IBTRBan);
  Botoes('E');
end;

procedure TFrmCadBanco.cod_banKeyPress(Sender: TObject; var Key: Char);
begin 
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmCadBanco.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsBanco, FrmConsBanco);
  FrmConsBanco.tag:= 0;
  FrmConsBanco.showmodal;
end;

procedure TFrmCadBanco.EdtLinhaVencEnter(Sender: TObject);
begin 
  inherited;
  with sender as UNovosComponentes.TEdit do
     selectall;
end;

end.
