unit UCadTransp;

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
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, dxSkinMetropolisDark, Data.DB;

type
  TFrmCadTransp = class(TFrmCadastroNovo)
    Label1: TLabel;
    cod_tra: UNovosComponentes.TEdit;
    Label3: TLabel;
    ComboFJ: TComboBox;
    Label2: TLabel;
    EdtNome: TEdit;
    Label6: TLabel;
    EdtEnd: TEdit;
    Label8: TLabel;
    EdtCid: TEdit;
    Label9: TLabel;
    ComboEst: TComboBox;
    Label11: TLabel;
    EdtCNPJ: TMaskEdit;
    Label12: TLabel;
    EdtDoc: TEdit;
    Label4: TLabel;
    EdtPlaca: TEdit;
    Label5: TLabel;
    ComboUFPlaca: TComboBox;
    IBSQLTransp: TFDQuery;
    IBTRTransp: TFDTransaction;
    Image1: TImage;
    procedure ComboFJChange(Sender: TObject);
    procedure Botoes(acao : string);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function FrmCadTransp: TFrmCadTransp;

implementation
uses
  Udm, Ubibli1, UConsTransp, UNovoPrincipal;
var vl_grava : boolean;

{$R *.dfm}

function FrmCadTransp: TFrmCadTransp;
begin
   Result := TFrmCadTransp( BuscaFormulario( TFrmCadTransp, False ) );
end;

procedure TFrmCadTransp.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadTransp, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadTransp);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadTransp);
         EDedit(FrmCadTransp, false);
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

procedure TFrmCadTransp.ComboFJChange(Sender: TObject);
begin 
  inherited;
  if ComboFJ.ItemIndex = 0 then
     begin 
        label11.Caption      := 'CPF(*)';
        label12.Caption      := 'Documento';
        edtcnpj.EditMask     := '999.999.999-99;1;_';
     end
  else
     begin 
        label11.Caption       := 'CNPJ(*)';
        label12.Caption       := 'Insc.Estadual';
        edtcnpj.EditMask      := '99.999.999/9999-99;1;_';
     end;
end;

procedure TFrmCadTransp.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        vl_grava:= true;
        if not DM.Acesso('C025','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             ComboFJ.ItemIndex:= 1;
             ComboFJChange(ComboFJ);
             ComboFJ.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmCadTransp.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  vl_grava:= true;
  if not DM.Acesso('C025','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  ComboFJ.ItemIndex:= 1;
  ComboFJChange(ComboFJ);
  ComboFJ.SetFocus;
end;

procedure TFrmCadTransp.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadTransp.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C025','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  vl_grava:= false;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmCadTransp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRTransp.Active then
     IBTRTransp.Commit;
  IBSQLTransp.Close;
  Action:= caFree;
end;

procedure TFrmCadTransp.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (vl_grava) and (not DM.Acesso('C025','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if edtnome.Text = '' then
     begin 
        AlertaCad('Digite o Nome da Transportadora');
//        edtnome.SetFocus;
        exit;
     end;
  if IBTRTransp.Active then
     IBTRTransp.Commit;
  IBTRTransp.StartTransaction;
  try
    try
      with IBSQLTransp do
        begin 
           close;
           sql.Clear;
           if vl_grava = true then
              begin 
                 cod_tra.Text:= inttostr(prxcod('transportadora', 'cod_tra', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO TRANSPORTADORA(COD_TRA, FJ_TRA, NOME_TRA, END_TRA, CID_TRA, ' +
                         'EST_TRA, CNPJ_TRA, INSC_TRA, PLACA_TRA, UF_PLACA_TRA) ' +
                         'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, :9, :10)');
              end
           else
              begin 
                 sql.Add('UPDATE TRANSPORTADORA SET FJ_TRA = :2, NOME_TRA = :3, END_TRA = :4, ' +
                         'CID_TRA = :5, EST_TRA = :6, CNPJ_TRA = :7, INSC_TRA = :8, PLACA_TRA = :9, ' +
                         'UF_PLACA_TRA = :10 WHERE COD_TRA = :1');
              end;
           Parambyname('1').AsInteger    := strtoint(cod_tra.Text);
           Parambyname('2').AsString     := ComboFJ.Text;
           Parambyname('3').AsString     := edtnome.Text;
           if EdtEnd.Text = '' then
              Parambyname('4').Value     := null
           else
              Parambyname('4').AsString  := EdtEnd.Text;
           if EdtCid.Text = '' then
              Parambyname('5').Value     := null
           else
              Parambyname('5').AsString  := EdtCid.Text;
           if ComboEst.ItemIndex = -1 then
              Parambyname('6').Value     := null
           else
              Parambyname('6').AsString  := ComboEst.Text;
           if (EdtCNPJ.Text = '  .   .   /    -  ') or (EdtCNPJ.Text = '   .   .   -  ') then
              Parambyname('7').Value     := null
           else
              Parambyname('7').AsString  := EdtCNPJ.Text;
           if EdtDoc.Text = '' then
              Parambyname('8').Value     := null
           else
              Parambyname('8').AsString  := EdtDoc.Text;
           if EdtPlaca.Text = '' then
              Parambyname('9').Value     := null
           else
              Parambyname('9').AsString  := EdtPlaca.Text;
           if ComboUFPlaca.ItemIndex = -1 then
              Parambyname('10').Value    := null
           else
              Parambyname('10').AsString := ComboUFPlaca.Text;
           ExecOrOpen;
        end;
      IBTRTransp.Commit;
      Botoes('G');
    except
      IBTRTransp.Rollback;
      AlertaCad('Erro ao Gravar a Transportadora');
    end;
  finally
    IBSQLTransp.Close;
  end;
end;

procedure TFrmCadTransp.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C025','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadTransp, 'transportadora', cod_tra, IBSQLTransp, IBTRTransp);
  Botoes('E');
end;

procedure TFrmCadTransp.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsTransp, FrmConsTransp);
  FrmConsTransp.tag := 0;
  FrmConsTransp.showmodal;
end;

end.
