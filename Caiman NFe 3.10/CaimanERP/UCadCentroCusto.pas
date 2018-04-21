unit UCadCentroCusto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, ImgList, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask, 
  UNovosComponentes, UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, dxSkinMetropolisDark, 
  dxSkinsdxStatusBarPainter, acAlphaImageList, dxStatusBar, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, Data.DB;

type
  TFrmCadCentroCusto = class(TFrmCadastroNovo)
    Label1: TLabel;
    codigo: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtConta: TMaskEdit;
    ComboDR: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    EdtNome: TEdit;
    Label5: TLabel;
    ComboTipo: TComboBox;
    IBSQLCusto: TFDQuery;
    IBTRCusto: TFDTransaction;
    Label6: TLabel;
    ComboDC: TComboBox;
    procedure Botoes(acao : string);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure EdtContaExit(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmCadCentroCusto: TFrmCadCentroCusto;

implementation
uses
  Udm, Ubibli1, UConsCentroCusto, UNovoPrincipal;
var  bGrava : boolean;

{$R *.dfm}

function FrmCadCentroCusto: TFrmCadCentroCusto;
begin
Result := TFrmCadCentroCusto( BuscaFormulario( TFrmCadCentroCusto, False ) );
end;

procedure TFrmCadCentroCusto.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadCentroCusto, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadCentroCusto);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled:= true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadCentroCusto);
         EDedit(FrmCadCentroCusto, false);
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


procedure TFrmCadCentroCusto.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        Botoes('N');
        ComboTipo.ItemIndex := 0;
        ComboDR.ItemIndex   := 0;
        EdtConta.SetFocus;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmCadCentroCusto.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  Botoes('N');
  ComboTipo.ItemIndex:= 0;
  ComboDR.ItemIndex  := 0;
  EdtConta.SetFocus;
end;

procedure TFrmCadCentroCusto.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadCentroCusto.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  bGrava:= false;
  Botoes('A');
  EdtConta.SetFocus;
end;

procedure TFrmCadCentroCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRCusto.Active then
     IBTRCusto.Commit;
  IBSQLCusto.Close;
  Action:= caFree;
end;

procedure TFrmCadCentroCusto.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if trim(edtnome.Text) = '' then
     begin 
        AlertaCad('Digite o Nome da Conta');
//        edtnome.SetFocus;
        exit;
     end;

  AlertaCad(EdtConta.Text);

  if IBTRCusto.Active then
     IBTRCusto.Commit;
  IBTRCusto.StartTransaction;
  try
    try
      with IBSQLCusto do
        begin 
           close;
           sql.Clear;
           if bGrava then
              begin 
                 codigo.Text:= inttostr(prxcod('centro_custo', 'codigo', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO CENTRO_CUSTO(CODIGO, CONTA, DESCRICAO, TIPO, RECEITA_DESPESA, DEBCRED) ' +
                         'VALUES(:1, :2, :3, :4, :5, :6)');
              end
           else
              begin 
                 sql.Add('UPDATE CENTRO_CUSTO SET CONTA = :2, DESCRICAO = :3, TIPO = :4, RECEITA_DESPESA = :5, ' +
                         'DEBCRED = :6 WHERE CODIGO = :1');
              end;
           Parambyname('1').AsInteger := strtoint(codigo.Text);
           Parambyname('2').AsString  := EdtConta.Text;
           Parambyname('3').AsString  := trim(EdtNome.Text);
           Parambyname('4').AsString  := copy(ComboTipo.Text, 1, 1);
           Parambyname('5').AsString  := copy(ComboDR.Text, 1, 1);
           Parambyname('6').AsInteger := ComboDC.ItemIndex;
           ExecOrOpen;
        end;
      IBTRCusto.Commit;
      Botoes('G');
    except
      IBTRCusto.Rollback;
      AlertaCad('Erro ao Gravar o Centro de Custo' + #13 +
                  'Verifique se a conta já está cadastrado');
//      EdtConta.SetFocus;
    end;
  finally
    IBSQLCusto.Close;
  end;
end;

procedure TFrmCadCentroCusto.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  excluir(FrmCadCentroCusto, 'centro_custo', codigo, IBSQLCusto, IBTRCusto);
  Botoes('E');
end;

procedure TFrmCadCentroCusto.EdtContaExit(Sender: TObject);
begin 
  inherited;
  {if (length(EdtConta.Text) >= 7) and (length(EdtConta.Text) < 10) then
     begin 
        AlertaCad('Digite o número da contas corretamente');
//        edtnum.SetFocus;
     end;}
end;

procedure TFrmCadCentroCusto.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsCentroCusto, FrmConsCentroCusto);
  FrmConsCentroCusto.tag:= 0;
  FrmConsCentroCusto.showmodal;
end;

end.
