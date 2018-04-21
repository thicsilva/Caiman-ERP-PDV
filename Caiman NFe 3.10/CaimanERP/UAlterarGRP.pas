unit UAlterarGRP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, rxToolEdit, rxCurrEdit, 
  UNovosComponentes, UNovoFormulario, sSpeedButton;

type
  TFrmAlterarGRP = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    BtnOKImpostos: TButton;
    BtnCancelar2: TButton;
    Panel1: TPanel;
    Label77: TLabel;
    EdtAliqPis: TCurrencyEdit;
    Label78: TLabel;
    EdtAliqCofins: TCurrencyEdit;
    Label79: TLabel;
    EdtAliqIR: TCurrencyEdit;
    Label80: TLabel;
    EdtAliqCSLL: TCurrencyEdit;
    Label81: TLabel;
    EdtAliqOutras: TCurrencyEdit;
    Label30: TLabel;
    BtnOKGRP: TButton;
    Label3: TLabel;
    BtnCancelar1: TButton;
    CheckPisCofins: TCheckBox;
    GroupBox3: TGroupBox;
    BtnConsICMSContEST: TsSpeedButton;
    Label32: TLabel;
    Label33: TLabel;
    BtnConsICMSCFEST: TsSpeedButton;
    Label34: TLabel;
    Label35: TLabel;
    BtnConsCFOPVEstCont: TsSpeedButton;
    Label51: TLabel;
    Label52: TLabel;
    BtnConsCFOPVEstCF: TsSpeedButton;
    EdtICMSContEst: UNovosComponentes.TEdit;
    EdtNomeICMSContEST: TEdit;
    EdtICMSCFEst: UNovosComponentes.TEdit;
    EdtNomeICMSCFEST: TEdit;
    EdtCSTContEst: TEdit;
    EdtCSTCFEst: TEdit;
    EdtCFOPVEstCont: UNovosComponentes.TEdit;
    EdtNomeCFOPVEstCont: TEdit;
    EdtCFOPVEstCF: UNovosComponentes.TEdit;
    EdtNomeCFOPVEstCF: TEdit;
    GroupBox4: TGroupBox;
    Label36: TLabel;
    BtnConsICMSContFORA: TsSpeedButton;
    Label37: TLabel;
    Label38: TLabel;
    BtnConsICMSPFFORA: TsSpeedButton;
    Label39: TLabel;
    Label53: TLabel;
    BtnConsCFOPVForaCF: TsSpeedButton;
    Label54: TLabel;
    BtnConsCFOPVForaCont: TsSpeedButton;
    EdtICMSContFora: UNovosComponentes.TEdit;
    EdtNomeICMSContFORA: TEdit;
    EdtCSTContFora: TEdit;
    EdtICMSCFFora: UNovosComponentes.TEdit;
    EdtNomeICMSCFFORA: TEdit;
    EdtCSTCFFora: TEdit;
    EdtCFOPVForaCF: UNovosComponentes.TEdit;
    EdtNomeCFOPVForaCF: TEdit;
    EdtCFOPVForaCont: UNovosComponentes.TEdit;
    EdtNomeCFOPVForaCont: TEdit;
    procedure BtnOKImpostosClick(Sender: TObject);
    procedure BtnCancelar2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnOKGRPClick(Sender: TObject);
    procedure CheckPisCofinsClick(Sender: TObject);
    procedure EdtICMSContEstEnter(Sender: TObject);
    procedure EdtICMSContEstExit(Sender: TObject);
    procedure EdtICMSContEstKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtICMSContEstKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsICMSContESTClick(Sender: TObject);
    procedure BtnConsICMSCFESTClick(Sender: TObject);
    procedure BtnConsICMSContFORAClick(Sender: TObject);
    procedure BtnConsICMSPFFORAClick(Sender: TObject);
    procedure EdtICMSCFEstKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtICMSCFEstExit(Sender: TObject);
    procedure EdtICMSCFEstEnter(Sender: TObject);
    procedure EdtICMSContForaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtICMSContForaExit(Sender: TObject);
    procedure EdtICMSContForaEnter(Sender: TObject);
    procedure EdtICMSCFForaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtICMSCFForaExit(Sender: TObject);
    procedure EdtICMSCFForaEnter(Sender: TObject);
    procedure EdtCFOPVEstContEnter(Sender: TObject);
    procedure EdtCFOPVEstContExit(Sender: TObject);
    procedure EdtCFOPVEstContKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCFOPVEstCFEnter(Sender: TObject);
    procedure EdtCFOPVEstCFExit(Sender: TObject);
    procedure EdtCFOPVEstCFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCFOPVForaContEnter(Sender: TObject);
    procedure EdtCFOPVForaContExit(Sender: TObject);
    procedure EdtCFOPVForaContKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCFOPVForaCFEnter(Sender: TObject);
    procedure EdtCFOPVForaCFExit(Sender: TObject);
    procedure EdtCFOPVForaCFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsCFOPVEstContClick(Sender: TObject);
    procedure BtnConsCFOPVEstCFClick(Sender: TObject);
    procedure BtnConsCFOPVForaContClick(Sender: TObject);
    procedure BtnConsCFOPVForaCFClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAlterarGRP: TFrmAlterarGRP;

implementation
uses
  Udm, Ubibli1, UAlteraPreco, UConsGRP, UConsCFOP, UNovoPrincipal;

{$R *.dfm}

procedure TFrmAlterarGRP.BtnOKImpostosClick(Sender: TObject);
var iAux : integer;
begin 
   { verificar se tem algum selecionado }
   iAux:= 0;
   with FrmAlteraPreco.QConsProd do
      begin 
         DisableControls;
         First;
         while not eof do
           begin 
              if FrmAlteraPreco.DBGrid.SelectedRows.CurrentRowSelected then
                 begin 
                    iAux:= 1;
                    Break;
                 end;
              next;
           end;
         First;
         EnableControls;
      end;

   if not (iAux > 0) then
      begin 
         AlertaCad('Nenhum produto selecionado');
         exit;
      end;

   if Application.MessageBox('Confirma a Atualização dos Impostos?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         dm.QConsulta.close;
         dm.QConsulta.SQL.Clear;
         dm.QConsulta.sql.Text:= 'UPDATE PRODUTO SET          ' +
                                 'ALIQUOTA_PIS          = :1, ' +
                                 'ALIQUOTA_COFINS       = :2, ' +
                                 'ALIQUOTA_IR           = :3, ' +
                                 'ALIQUOTA_CSLL         = :4, ' +
                                 'ALIQUOTA_OUTRAS       = :5, ' +
                                 'ISENTO_PIS_COFINS_PRO = :6  ' +
                                 'WHERE COD_PRO         = :7';

         with FrmAlteraPreco.QConsProd do
            begin 
               DisableControls;
               First;
               while not eof do
                  begin 
                     if FrmAlteraPreco.DBGrid.SelectedRows.CurrentRowSelected then
                        begin 
                           iAuxCodPro:= FrmAlteraPreco.QConsProdCODPRO.AsInteger;
                           dm.QConsulta.Close;
                           dm.QConsulta.ParamByName('1').AsCurrency:= StrToCurr(EdtAliqPis.text);
                           dm.QConsulta.ParamByName('2').AsCurrency:= StrToCurr(EdtAliqCofins.text);
                           dm.QConsulta.ParamByName('3').AsCurrency:= StrToCurr(EdtAliqIR.text);
                           dm.QConsulta.ParamByName('4').AsCurrency:= StrToCurr(EdtAliqCSLL.text);
                           dm.QConsulta.ParamByName('5').AsCurrency:= StrToCurr(EdtAliqOutras.text);
                           if CheckPisCofins.Checked then
                              dm.QConsulta.ParamByName('6').AsString:= 'S'
                           else
                              dm.QConsulta.ParamByName('6').AsString:= 'N';
                           dm.QConsulta.ParamByName('7').AsInteger := FrmAlteraPreco.QConsProdCODPRO.AsInteger;
                           dm.QConsulta.ExecOrOpen;
                        end;
                     next;
                  end;
               EnableControls;
            end;
         dm.IBTransaction.Commit;
         dm.QConsulta.Close;
         dm.QConsulta.SQL.Clear;
         //FrmAlteraPreco.BtnOk.Click;
      end;
end;

procedure TFrmAlterarGRP.BtnCancelar2Click(Sender: TObject);
begin 
   close;
end;

procedure TFrmAlterarGRP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.QConsulta.close;
   FrmAlteraPreco.BtnOk.Click;
   Action:= caFree;
end;

procedure TFrmAlterarGRP.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmAlterarGRP.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if key = #13 then
      begin 
         key:= #0;
         SelectNext(ActiveControl, true, true);
      end;
end;

procedure TFrmAlterarGRP.BtnOKGRPClick(Sender: TObject);
var iAux : integer;
begin 
   if (trim(EdtICMSContEst.Text) = '')   or
      (trim(EdtICMSContFora.Text) = '')  or
      (trim(EdtICMSCFEst.Text) = '')     or
      (trim(EdtICMSCFFora.Text) = '')    or
      (trim(EdtCFOPVEstCont.Text) = '')  or
      (trim(EdtCFOPVForaCont.Text) = '') or
      (trim(EdtCFOPVEstCF.Text) = '')    or
      (trim(EdtCFOPVForaCF.Text) = '')   or
      (trim(EdtCSTContEst.Text) = '')    or
      (trim(EdtCSTContFora.Text) = '')   or
      (trim(EdtCSTCFEst.Text) = '')      or
      (trim(EdtCSTCFFora.Text) = '')     then
          begin 
             AlertaCad('Verifique se os campos, tem que preencher todos');
//             EdtICMSContEst.SetFocus;
             exit;
          end;

   { verificar se tem algum selecionado }
   iAux:= 0;
   with FrmAlteraPreco.QConsProd do
      begin 
         DisableControls;
         First;
         while not eof do
           begin 
              if FrmAlteraPreco.DBGrid.SelectedRows.CurrentRowSelected then
                 begin 
                    iAux:= 1;
                    Break;
                 end;
              next;
           end;
         First;
         EnableControls;
      end;

   if not (iAux > 0) then
      begin 
         AlertaCad('Nenhum produto selecionado');
         exit;
      end;

   if Application.MessageBox('Confirma a Atualização do Grupo de ICMS?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         dm.QConsulta.close;
         dm.QConsulta.SQL.Clear;
         dm.QConsulta.sql.Text:= 'UPDATE PRODUTO SET      ' +
                                 'ICMS_CF_EST             = :1,   ' +
                                 'ICMS_CF_FORA            = :2,   ' +
                                 'ICMS_CONT_EST           = :3,   ' +
                                 'ICMS_CONT_FORA          = :4,   ' +
                                 'CST_CONT_EST            = :5,   ' +
                                 'CST_CONT_FORA           = :6,   ' +
                                 'CST_CF_EST              = :7,   ' +
                                 'CST_CF_FORA             = :8,   ' +
                                 'CFOP_VENDAS_CONT_EST    = :9,   ' +
                                 'CFOP_VENDAS_CONT_FORA   = :10,  ' +
                                 'CFOP_VENDAS_CF_EST      = :11,  ' +
                                 'CFOP_VENDAS_CF_FORA     = :12   ' +
                                 'WHERE COD_PRO           = :13';

         with FrmAlteraPreco.QConsProd do
            begin 
               DisableControls;
               First;
               while not eof do
                  begin 
                     if FrmAlteraPreco.DBGrid.SelectedRows.CurrentRowSelected then
                        begin 
                           iAuxCodPro:= FrmAlteraPreco.QConsProdCODPRO.AsInteger;
                           dm.QConsulta.Close;
                           dm.QConsulta.ParamByName('1').AsInteger  := strtoint(EdtICMSCFEst.text);
                           dm.QConsulta.ParamByName('2').AsInteger  := strtoint(EdtICMSCFFora.text);
                           dm.QConsulta.ParamByName('3').AsInteger  := strtoint(EdtICMSContEst.text);
                           dm.QConsulta.ParamByName('4').AsInteger  := strtoint(EdtICMSContFora.text);
                           dm.QConsulta.ParamByName('5').AsString   :=  trim(EdtCSTContEst.text);
                           dm.QConsulta.ParamByName('6').AsString   :=  trim(EdtCSTContFora.text);
                           dm.QConsulta.ParamByName('7').AsString   :=  trim(EdtCSTCFEst.text);
                           dm.QConsulta.ParamByName('8').AsString   :=  trim(EdtCSTCFFora.text);
                           dm.QConsulta.ParamByName('9').AsString   :=  trim(EdtCFOPVEstCont.text);
                           dm.QConsulta.ParamByName('10').AsString  :=  trim(EdtCFOPVForaCont.text);
                           dm.QConsulta.ParamByName('11').AsString  :=  trim(EdtCFOPVEstCF.text);
                           dm.QConsulta.ParamByName('12').AsString  :=  trim(EdtCFOPVForaCF.text);
                           dm.QConsulta.ParamByName('13').AsInteger:= FrmAlteraPreco.QConsProdCODPRO.AsInteger;
                           dm.QConsulta.ExecOrOpen;
                        end;
                     next;
                  end;
               EnableControls;
            end;
         dm.IBTransaction.Commit;
         dm.QConsulta.Close;
         dm.QConsulta.SQL.Clear;
         FrmAlteraPreco.BtnOk.Click;
      end;
end;

procedure TFrmAlterarGRP.CheckPisCofinsClick(Sender: TObject);
begin 
   CheckPisCofins.Focused;

   if CheckPisCofins.Checked then
      begin 
         EdtAliqPis.Clear;
         EdtAliqCofins.Clear;
         EdtAliqPis.Enabled    := false;
         EdtAliqCofins.Enabled := false;
      end
   else
      begin 
         EdtAliqPis.Enabled    := true;
         EdtAliqCofins.Enabled := true;
         EdtAliqPis.SetFocus;
      end;
end;

procedure TFrmAlterarGRP.EdtICMSContEstEnter(Sender: TObject);
begin 
   EdtICMSCONTEst.SelectAll;
end;

procedure TFrmAlterarGRP.EdtICMSContEstExit(Sender: TObject);
begin 
   if BtnCancelar1.Focused then
     exit;
  EdtNomeICMSCONTEST.Text:= consulta('grupo_icms', EdtICMSCONTEst, 'cod_grp', 'nome_grp', dm.IBTransaction, dm.qConsulta);
  if EdtNomeICMSCONTEST.Text = '' then
     begin 
        AlertaCad('Grupo de ICMS não Cadastrado');
//        EdtICMSCONTEst.SetFocus;
     end;
end;

procedure TFrmAlterarGRP.EdtICMSContEstKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
     BtnConsICMSCONTEST.Click;
end;

procedure TFrmAlterarGRP.EdtICMSContEstKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
     key:= #0; 
end;

procedure TFrmAlterarGRP.BtnConsICMSContESTClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsGRP, FrmConsGRP);
   FrmConsGRP.Tag:= 10;
   FrmConsGRP.ShowModal;
end;

procedure TFrmAlterarGRP.BtnConsICMSCFESTClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsGRP, FrmConsGRP);
   FrmConsGRP.Tag:= 11;
   FrmConsGRP.ShowModal;
end;

procedure TFrmAlterarGRP.BtnConsICMSContFORAClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsGRP, FrmConsGRP);
   FrmConsGRP.Tag:= 14;
   FrmConsGRP.ShowModal;
end;

procedure TFrmAlterarGRP.BtnConsICMSPFFORAClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsGRP, FrmConsGRP);
   FrmConsGRP.Tag:= 15;
   FrmConsGRP.ShowModal;
end;

procedure TFrmAlterarGRP.EdtICMSCFEstKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
     BtnConsICMSCFEST.Click;
end;

procedure TFrmAlterarGRP.EdtICMSCFEstExit(Sender: TObject);
begin 
   if BtnCancelar1.Focused then
     exit;
  EdtNomeICMSCFEST.Text:= consulta('grupo_icms', EdtICMSCFEst, 'cod_grp', 'nome_grp', dm.IBTransaction, dm.qConsulta);
  if EdtNomeICMSCFEST.Text = '' then
     begin 
        AlertaCad('Grupo de ICMS não Cadastrado');
//        EdtICMSCFEst.SetFocus;
     end;
end;

procedure TFrmAlterarGRP.EdtICMSCFEstEnter(Sender: TObject);
begin 
   EdtICMSCFEst.SelectAll;
end;

procedure TFrmAlterarGRP.EdtICMSContForaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
     BtnConsICMSCONTFORA.Click;
end;

procedure TFrmAlterarGRP.EdtICMSContForaExit(Sender: TObject);
begin 
   if BtnCancelar1.Focused then
     exit;
  EdtNomeICMSCONTFORA.Text:= consulta('grupo_icms', EdtICMSCONTFora, 'cod_grp', 'nome_grp', dm.IBTransaction, dm.qConsulta);
  if EdtNomeICMSCONTFORA.Text = '' then
     begin 
        AlertaCad('Grupo de ICMS não Cadastrado');
//        EdtICMSCONTFora.SetFocus;
     end;
end;

procedure TFrmAlterarGRP.EdtICMSContForaEnter(Sender: TObject);
begin 
   EdtICMSCONTFora.SelectAll;
end;

procedure TFrmAlterarGRP.EdtICMSCFForaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
     BtnConsICMSPFFORA.Click;
end;

procedure TFrmAlterarGRP.EdtICMSCFForaExit(Sender: TObject);
begin 
   if BtnCancelar1.Focused then
     exit;
  EdtNomeICMSCFFORA.Text:= consulta('grupo_icms', EdtICMSCFFora, 'cod_grp', 'nome_grp', dm.IBTransaction, dm.qConsulta);
  if EdtNomeICMSCFFORA.Text = '' then
     begin 
        AlertaCad('Grupo de ICMS não Cadastrado');
//        EdtICMSCFFora.SetFocus;
     end;
end;

procedure TFrmAlterarGRP.EdtICMSCFForaEnter(Sender: TObject);
begin 
   EdtICMSCFFora.SelectAll;
end;

procedure TFrmAlterarGRP.EdtCFOPVEstContEnter(Sender: TObject);
begin 
   EdtCFOPVEstCONT.SelectAll;
end;

procedure TFrmAlterarGRP.EdtCFOPVEstContExit(Sender: TObject);
begin 
   if BtnCancelar1.Focused then
     begin 
        EdtNomeCFOPVEstCONT.Clear;
        exit;
     end;
  EdtNomeCFOPVEstCONT.Text:= consulta('CFOP', EdtCFOPVEstCONT, 'cod_cfo', 'nome_cfo', dm.IBTransaction, dm.qConsulta);
  if EdtNomeCFOPVEstCONT.Text = '' then
     begin 
        AlertaCad('CFOP não Cadastrado');
//        EdtCFOPVEstCONT.SetFocus;
     end;
end;

procedure TFrmAlterarGRP.EdtCFOPVEstContKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsCFOPVEstCONT.Click;
end;

procedure TFrmAlterarGRP.EdtCFOPVEstCFEnter(Sender: TObject);
begin 
   EdtCFOPVEstCF.SelectAll;
end;

procedure TFrmAlterarGRP.EdtCFOPVEstCFExit(Sender: TObject);
begin 
   if BtnCancelar1.Focused then
     begin 
        EdtNomeCFOPVEstCF.Clear;
        exit;
     end;
  EdtNomeCFOPVEstCF.Text:= consulta('CFOP', EdtCFOPVEstCF, 'cod_cfo', 'nome_cfo', dm.IBTransaction, dm.qConsulta);
  if EdtNomeCFOPVEstCF.Text = '' then
     begin 
        AlertaCad('CFOP não Cadastrado');
//        EdtCFOPVEstCF.SetFocus;
     end;
end;

procedure TFrmAlterarGRP.EdtCFOPVEstCFKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsCFOPVEstCF.Click;
end;

procedure TFrmAlterarGRP.EdtCFOPVForaContEnter(Sender: TObject);
begin 
   EdtCFOPVForaCONT.SelectAll;
end;

procedure TFrmAlterarGRP.EdtCFOPVForaContExit(Sender: TObject);
begin 
   if BtnCancelar1.Focused then
     begin 
        EdtNomeCFOPVForaCONT.Clear;
        exit;
     end;
  EdtNomeCFOPVForaCONT.Text:= consulta('CFOP', EdtCFOPVForaCONT, 'cod_cfo', 'nome_cfo', dm.IBTransaction, dm.qConsulta);
  if EdtNomeCFOPVForaCONT.Text = '' then
     begin 
        AlertaCad('CFOP não Cadastrado');
//        EdtCFOPVForaCONT.SetFocus;
     end;
end;

procedure TFrmAlterarGRP.EdtCFOPVForaContKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsCFOPVForaCONT.Click;
end;

procedure TFrmAlterarGRP.EdtCFOPVForaCFEnter(Sender: TObject);
begin 
   EdtCFOPVForaCF.SelectAll;
end;

procedure TFrmAlterarGRP.EdtCFOPVForaCFExit(Sender: TObject);
begin 
   if BtnCancelar1.Focused then
     begin 
        EdtNomeCFOPVForaCF.Clear;
        exit;
     end;
  EdtNomeCFOPVForaCF.Text:= consulta('CFOP', EdtCFOPVForaCF, 'cod_cfo', 'nome_cfo', dm.IBTransaction, dm.qConsulta);
  if EdtNomeCFOPVForaCF.Text = '' then
     begin 
        AlertaCad('CFOP não Cadastrado');
//        EdtCFOPVForaCF.SetFocus;
     end;
end;

procedure TFrmAlterarGRP.EdtCFOPVForaCFKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsCFOPVForaCF.Click;
end;

procedure TFrmAlterarGRP.BtnConsCFOPVEstContClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsCFOP, FrmConsCFOP);
   FrmConsCFOP.Tag:= 13;
   FrmConsCFOP.ShowModal;
end;

procedure TFrmAlterarGRP.BtnConsCFOPVEstCFClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsCFOP, FrmConsCFOP);
   FrmConsCFOP.Tag:= 14;
   FrmConsCFOP.ShowModal;
end;

procedure TFrmAlterarGRP.BtnConsCFOPVForaContClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsCFOP, FrmConsCFOP);
   FrmConsCFOP.Tag:= 15;
   FrmConsCFOP.ShowModal;
end;

procedure TFrmAlterarGRP.BtnConsCFOPVForaCFClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsCFOP, FrmConsCFOP);
   FrmConsCFOP.Tag:= 16;
   FrmConsCFOP.ShowModal;
end;

end.
