unit UCadCarta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, ImgList, ComCtrls, ToolWin, ExtCtrls, StdCtrls, RxCombos, 
  Buttons, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, Data.DB, dxStatusBar;

type
  TFrmCadCarta = class(TFrmCadastroNovo)
    Label1: TLabel;
    cod_carta: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    IBSQLCarta: TFDQuery;
    IBTRCarta: TFDTransaction;
    GroupBox1: TGroupBox;
    Editor: TRichEdit;
    procedure Botoes(acao : string);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure EditorEnter(Sender: TObject);
    procedure EditorExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadCarta: TFrmCadCarta;

implementation
uses
  Udm, Ubibli1, UConsCartas;
var bgrava : boolean;

procedure TFrmCadCarta.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadCarta, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadCarta);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadCarta);
         EDedit(FrmCadCarta, false);
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

{$R *.dfm}

procedure TFrmCadCarta.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('R131','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             edtnome.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G'); 
end;

procedure TFrmCadCarta.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  if not DM.Acesso('R131','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  edtnome.SetFocus;
end;

procedure TFrmCadCarta.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadCarta.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('R131','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmCadCarta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRCarta.Active then
     IBTRCarta.Commit;
  IBSQLCarta.Close;
  Action:= caFree;
end;

procedure TFrmCadCarta.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('R131','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if edtnome.Text = '' then
     begin 
        AlertaCad('Digite o Nome da Carta');
//        edtnome.SetFocus;
        exit;
     end;
  if IBTRCarta.Active then
     IBTRCarta.Commit;
  IBTRCarta.StartTransaction;
  try
    try
      with IBSQLCarta do
        begin 
           close;
           sql.Clear;
           if bGrava = true then
              begin 
                 cod_carta.Text:= inttostr(prxcod('cartas', 'cod_carta', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO CARTAS(COD_CARTA, NOME_CARTA, CONTEUDO_CARTA) ' +
                         'VALUES(:1, :2, :3)');
              end
           else
              begin 
                 sql.Add('UPDATE CARTAS SET NOME_CARTA = :2, CONTEUDO_CARTA = :3 ' +
                         'WHERE COD_CARTA = :1');
              end;
           Parambyname('1').AsInteger:= strtoint(cod_carta.Text);
           Parambyname('2').AsString := edtnome.Text;
           Parambyname('3').AsString := Editor.Lines.Text;
           ExecOrOpen;
        end;
      IBTRCarta.Commit;
      Botoes('G');
    except
      IBTRCarta.Rollback;
      AlertaCad('Erro ao Gravar a Carta');
    end;
  finally
    IBSQLCarta.Close;
  end;
end;

procedure TFrmCadCarta.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('R131','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadCarta, 'cartas', cod_carta, IBSQLCarta, IBTRCarta);
  Botoes('E');
end;

procedure TFrmCadCarta.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCartas, FrmConsCartas);
  FrmConsCartas.Tag:= 0;
  FrmConsCartas.SHOWMODAL;
end;

procedure TFrmCadCarta.EditorEnter(Sender: TObject);
begin 
  inherited;
  FrmCadCarta.KeyPreview:= false;
end;

procedure TFrmCadCarta.EditorExit(Sender: TObject);
begin 
  inherited;
  FrmCadCarta.KeyPreview:= true;
end;

end.
