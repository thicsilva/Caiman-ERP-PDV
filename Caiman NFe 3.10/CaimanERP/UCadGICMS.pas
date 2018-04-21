unit UCadGICMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, Buttons, ExtCtrls, ComCtrls, Mask, StdCtrls, ImgList, 
  ToolWin, rxToolEdit, rxCurrEdit, acAlphaImageList, UNovosComponentes, 
  UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, dxSkinMetropolisDark, 
  dxSkinsdxStatusBarPainter, dxStatusBar, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, Data.DB;

type
  TFrmCadGICMS = class(TFrmCadastroNovo)
    Label1: TLabel;
    cod_grp: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    Label3: TLabel;
    EdtAliq: TCurrencyEdit;
    IBSQLGRP: TFDQuery;
    IBTRGRP: TFDTransaction;
    Label4: TLabel;
    ComboTipo: TComboBox;
    Label5: TLabel;
    EdtCST: TEdit;
    Label6: TLabel;
    ComboICMSServico: TComboBox;
    CheckECF: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure Botoes(acao : string);
    procedure BtnConsICMSContESTClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function FrmCadGICMS: TFrmCadGICMS;

implementation
uses
  Udm, Ubibli1, UConsGRP, UNovoPrincipal;
var  bGrava : boolean;

{$R *.dfm}

function FrmCadGICMS: TFrmCadGICMS;
begin
   Result := TFrmCadGICMS( BuscaFormulario( TFrmCadGICMS, False ) );
end;

procedure TFrmCadGICMS.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadGICMS, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadGICMS);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadGICMS);
         EDedit(FrmCadGICMS, false);
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

procedure TFrmCadGICMS.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('C005','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             ComboTipo.ItemIndex:= 0;
             ComboICMSServico.ItemIndex:= 0;
             CheckECF.SetFocus;
           end;
     end
  else
    if tag = 1 then
       Botoes('G');
end;

procedure TFrmCadGICMS.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  if not DM.Acesso('C005','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  ComboTipo.ItemIndex:= 0;
  ComboICMSServico.ItemIndex:= 0;
  CheckECF.SetFocus;
end;

procedure TFrmCadGICMS.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadGICMS.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C005','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('A');
  bGrava := false;
  edtnome.SetFocus;
end;

procedure TFrmCadGICMS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRGRP.Active then
     IBTRGRP.Commit;
  IBSQLGRP.Close;
  Action:= caFree;
end;

procedure TFrmCadGICMS.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('C005','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if edtnome.Text = '' then
     begin 
        AlertaCad('Digite o Nome do Grupo');
//        edtnome.SetFocus;
        exit;
     end;
  if IBTRGRP.Active then
     IBTRGRP.Commit;
  IBTRGRP.StartTransaction;
  try
    try
      with IBSQLGRP do
        begin 
           close;
           sql.Clear;
           if bGrava then
              begin 
                 cod_grp.Text:= inttostr(prxcod('grupo_icms', 'cod_grp', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO GRUPO_ICMS(COD_GRP, NOME_GRP, ALIQUOTA_GRP, TIPO_GRP, ' +
                         'CST, ICMS_SERVICO_GRP, ECF) ' +
                         'VALUES(:1, :2, :3, :4, :5, :6, :7)');
              end
           else
              begin 
                 sql.Add('UPDATE GRUPO_ICMS SET NOME_GRP = :2, ALIQUOTA_GRP = :3,  ' +
                         'TIPO_GRP = :4, CST = :5, ICMS_SERVICO_GRP = :6, ECF = :7 ' +
                         'WHERE COD_GRP = :1');
              end;
           Parambyname('1').AsInteger := strtoint(cod_grp.Text);
           Parambyname('2').AsString  := edtnome.Text;
           Parambyname('3').AsFloat   := strtofloat(edtaliq.Text);
           case ComboTipo.ItemIndex of
             0: Parambyname('4').AsString:= 'TRI';
             1: Parambyname('4').AsString:= 'ST';
             2: Parambyname('4').AsString:= 'ISE';
             3: Parambyname('4').AsString:= 'NT';
             4: Parambyname('4').AsString:= 'DES';
             5: Parambyname('4').AsString:= 'ACR';
             6: Parambyname('4').AsString:= 'CAN';
             7: Parambyname('4').AsString:= 'ONF';
             8: Parambyname('4').AsString:= 'OUT';

           end;
           Parambyname('5').AsString:= EdtCST.Text;
           case ComboICMSServico.ItemIndex of
             0: Parambyname('6').AsString:= 'I';
             1: Parambyname('6').AsString:= 'S';
             2: Parambyname('6').AsString:= 'N';
           end;
           if CheckECF.Checked then
              Parambyname('7').AsString:= 'S'
           else
              Parambyname('7').AsString:= 'N';
           ExecOrOpen;
        end;
      IBTRGRP.Commit;
      Botoes('G');
    except
      IBTRGRP.Rollback;
      AlertaCad('Erro ao Gravar o Grupo');
    end;
  finally
    IBSQLGRP.Close;
  end;
end;

procedure TFrmCadGICMS.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C005','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadGICMS, 'grupo_icms', cod_grp, IBSQLGRP, IBTRGRP);
  Botoes('E');
end;

procedure TFrmCadGICMS.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsGRP, FrmConsGRP);
  FrmConsGRP.tag:= 0;
  FrmConsGRP.showmodal;
end;

procedure TFrmCadGICMS.BtnConsICMSContESTClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsGRP, FrmConsGRP);
  FrmConsGRP.tag:= 14;
  FrmConsGRP.showmodal;
end;

end.
