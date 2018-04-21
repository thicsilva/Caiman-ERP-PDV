unit URelEtiqueta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Grids, DBGrids, Buttons, DB, RDprint, 
  MatrixPrinter, UKRelEtiquetas, DBClient, frxClass, frxDBSet, frxDesgn, 
  ACBrBase, ACBrETQ, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton, cxPC, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinMetropolis, cxProgressBar;

type
  TFrmRelEtiqueta = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Label17: TLabel;
    EdtCodPro: UNovosComponentes.TEdit;
    BtnConsPro: TsSpeedButton;
    BtnAddPro: TsSpeedButton;
    EdtNomePro: TEdit;
    Label18: TLabel;
    BtnOK: TBitBtn;
    BtnSair: TBitBtn;
    BtnImp: TBitBtn;
    BtnExc: TBitBtn;
    BtnLimpar: TBitBtn;
    IBSQLETQ: TFDQuery;
    IBTRETQ: TFDTransaction;
    Label1: TLabel;
    EdtQuant: UNovosComponentes.TEdit;
    DSQBuscaETQ: TDataSource;
    QbuscaETQ: TFDQuery;
    QbuscaETQCOD_ETQ: TIntegerField;
    QbuscaETQCOD_PRO: TIntegerField;
    QbuscaETQQUANT_ETQ: TIntegerField;
    QbuscaETQVALOR_PRO: TBCDField;
    QbuscaETQPROMOCAO_PRO: TBCDField;
    RdgImp: TRadioGroup;
    QbuscaETQREFERENCIA_PRO: TStringField;
    Label2: TLabel;
    EdtDescEtiqueta: TEdit;
    QbuscaETQPRECO_PRAZO_PRO: TBCDField;
    QbuscaETQDESCRICAO: TStringField;
    QbuscaETQUNIDADE_SAIDA: TStringField;
    QbuscaETQVALOR_ATACADO: TBCDField;
    QbuscaETQCOR: TStringField;
    QbuscaETQTAMANHO: TStringField;
    QbuscaETQREFERENCIA_PRO_1: TStringField;
    QbuscaETQDESC_SETOR: TStringField;
    pnlBottom: TPanel;
    frxDBEtiquetas: TfrxDBDataset;
    frxEtiquetas: TfrxReport;
    cbbModelo: TComboBox;
    QbuscaETQCODIGO_BARRA_PRO: TStringField;
    btnEtiquetas: TsSpeedButton;
    QEtiqModelos: TFDQuery;
    QEtiqModelosCOD_EMP: TIntegerField;
    QEtiqModelosNOME_REL: TStringField;
    QEtiqModelosTIPO: TStringField;
    QEtiqModelosREL: TMemoField;
    QEtiqModelosPADRAO: TIntegerField;
    upEtiModelos: TFDUpdateSQL;
    dsEtiModelos: TDataSource;
    frxDesigner1: TfrxDesigner;
    QEmpresa: TFDQuery;
    QEmpresaCOD_EMP: TIntegerField;
    QEmpresaRAZAO_EMP: TStringField;
    QEmpresaEND_EMP: TStringField;
    QEmpresaBAI_EMP: TStringField;
    QEmpresaCID_EMP: TStringField;
    QEmpresaCEP_EMP: TStringField;
    QEmpresaEST_EMP: TStringField;
    QEmpresaINSC_EMP: TStringField;
    QEmpresaTEL_EMP: TStringField;
    QEmpresaFAX_EMP: TStringField;
    QEmpresaNOME_EMP_ETIQUETA: TStringField;
    QEmpresaNUMERO_EMP: TStringField;
    QEmpresaRESP_EMP: TStringField;
    QEmpresaCAMINHO_FOTO_EMP: TStringField;
    QEmpresaFANTASIA_EMP: TStringField;
    QEmpresaMOSTRAR_SITCLI_PREVENDA: TStringField;
    QEmpresaCADASTRAR_CLIENTE_SEM_CPF: TStringField;
    QEmpresaTIPO_EMP: TIntegerField;
    QEmpresaTIPO_CARGA_BALANCA: TIntegerField;
    QEmpresaCNPJ_EMP: TStringField;
    QEmpresaCAMINHO_VALIDADOR_SINTEGRA: TStringField;
    QEmpresaINSCRICAO_MUNICIPAL: TStringField;
    QEmpresaPERFIL_EFD: TStringField;
    QEmpresaCODIGO_MUNICIPIO: TStringField;
    QEmpresaTIPO_ATIVIDADE_EFD: TIntegerField;
    QEmpresaNOME_CONTADOR: TStringField;
    QEmpresaCPF_CONTADOR: TStringField;
    QEmpresaCRC_CONTADOR: TStringField;
    QEmpresaCNPJ_CONTADOR: TStringField;
    QEmpresaCEP_CONTADOR: TStringField;
    QEmpresaEND_CONTADOR: TStringField;
    QEmpresaNUMERO_CONTADOR: TStringField;
    QEmpresaBAIRRO_CONTADOR: TStringField;
    QEmpresaTEL_CONTADOR: TStringField;
    QEmpresaFAX_CONTADOR: TStringField;
    QEmpresaCODIGO_MUNICIPIO_CONTADOR: TStringField;
    QEmpresaVERSAO_EFD: TIntegerField;
    QEmpresaEMAIL_CONTADOR: TStringField;
    frxDBEmpresa: TfrxDBDataset;
    dsTempEtiquetas: TClientDataSet;
    dsTempEtiquetasCOD_ETQ: TIntegerField;
    dsTempEtiquetasCOD_PRO: TIntegerField;
    dsTempEtiquetasQUANT_ETQ: TIntegerField;
    dsTempEtiquetasVALOR_PRO: TCurrencyField;
    dsTempEtiquetasPROMOCAO_PRO: TCurrencyField;
    dsTempEtiquetasREFERENCIA_PRO: TStringField;
    dsTempEtiquetasPRECO_PRAZO_PRO: TCurrencyField;
    dsTempEtiquetasDESCRICAO: TStringField;
    dsTempEtiquetasUNIDADE_SAIDA: TStringField;
    dsTempEtiquetasVALOR_ATACADO: TCurrencyField;
    dsTempEtiquetasCOR: TStringField;
    dsTempEtiquetasTAMANHO: TStringField;
    dsTempEtiquetasDESC_SETOR: TStringField;
    dsTempEtiquetasCODIGO_BARRA_PRO: TStringField;
    dsTempEtiquetasCOD_AUT: TAutoIncField;
    cxProgres: TcxProgressBar;
    procedure BtnConsProClick(Sender: TObject);
    procedure BtnAddProClick(Sender: TObject);
    procedure EdtCodProEnter(Sender: TObject);
    procedure EdtCodProKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodProExit(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure EdtQuantEnter(Sender: TObject);
    procedure BuscaETQ;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnExcClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnImpClick(Sender: TObject);
    procedure btnEtiquetasClick(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaModelosEti;
    procedure PreencheTabTemp;
  public
    { Public declarations }
  end;

 function FrmRelEtiqueta: TFrmRelEtiqueta;

implementation

uses
  Udm, Ubibli1, UConsProd, UCadProduto, UNovoPrincipal, UCadEtiquetasModelos,
  UDicLib;

{$R *.dfm}

 function FrmRelEtiqueta: TFrmRelEtiqueta;
 begin
    Result := TFrmRelEtiqueta(  BuscaFormulario( TFrmRelEtiqueta, False ) );
 end;

procedure TFrmRelEtiqueta.BuscaETQ;
begin 
   if IBTRETQ.Active then
      IBTRETQ.Commit;
   IBTRETQ.StartTransaction;
   with QbuscaETQ do
      begin 
         close;
         open;
         if recordcount > 0 then
            begin 
               btnimp.Enabled    := true;
               BtnExc.Enabled    := true;
               BtnLimpar.Enabled := true;
            end
         else
            begin 
               btnimp.Enabled    := false;
               BtnExc.Enabled    := false;
               BtnLimpar.Enabled := false;
            end;
      end;
   AtualizaModelosEti;
   TDicLib.MontaTelaUsu( iCodUsu, Self, DM.IBDatabase );
end;

procedure TFrmRelEtiqueta.BtnConsProClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsprod, FrmConsProd);
   FrmConsProd.Tag := 15;
   FrmConsProd.ShowModal;
end;

procedure TFrmRelEtiqueta.btnEtiquetasClick(Sender: TObject);
begin
   frmCadEtiquetasModelos := TfrmCadEtiquetasModelos.Create( nil );
   try
      frmCadEtiquetasModelos.showmodal;
      AtualizaModelosEti;
   finally
        FreeAndNil( frmCadEtiquetasModelos );
   end;
end;

procedure TFrmRelEtiqueta.AtualizaModelosEti;
begin
   IBTRETQ.CommitRetaining;
   cbbModelo.Clear;
   cbbModelo.Items.Clear;
   QEmpresa.Close;
   QEmpresa.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
   QEmpresa.Open;
   QEtiqModelos.Close;
   QEtiqModelos.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
   QEtiqModelos.Open;
   QEtiqModelos.First;
   while not QEtiqModelos.Eof do
      begin
         cbbModelo.Items.Add( QEtiqModelosTIPO.AsString );
         QEtiqModelos.Next;
      end;
   if cbbModelo.Items.Count > 0 then
      cbbModelo.ItemIndex := 0;
end;

procedure TFrmRelEtiqueta.BtnAddProClick(Sender: TObject);
begin 
  BuscaFormulario( TFrmCadProduto, True );
end;

procedure TFrmRelEtiqueta.EdtCodProEnter(Sender: TObject);
begin 
   EdtCodPro.SelectAll;
end;

procedure TFrmRelEtiqueta.EdtCodProKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsPro.Click
   else
      if key = vk_f2 then
         BtnAddPro.Click;
end;

procedure TFrmRelEtiqueta.EdtCodProExit(Sender: TObject);
begin 
   if EdtCodPro.Text = '' then
      begin 
         EdtNomePro.Clear;
         exit;
      end;

  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.QConsulta do
         begin 
            close;
            sql.Clear;
            if Length(trim(EdtCodPro.Text)) > 7 then
               begin 
                  sql.Add('SELECT COD_PRO, NOME_PRO, DESC_CUPOM ' +
                          'FROM PRODUTO WHERE CODIGO_BARRA_PRO = ' + #39 + trim(EdtCodPro.Text) + #39);
               end
            else
               begin 
                  sql.Add('SELECT COD_PRO, NOME_PRO, DESC_CUPOM ' +
                          'FROM PRODUTO WHERE COD_PRO = :CODPRO');
                  Parambyname('codpro').AsInteger := strtoint(EdtCodPro.text);
               end;
            Open;

            if not (fieldbyname('cod_pro').IsNull) then
               begin 
                  EdtCodPro.Text  := fieldbyname('cod_pro').AsString;
                  if RdgImp.ItemIndex = 0 then
                     begin 
                        EdtNomePro.Text      := fieldbyname('nome_pro').AsString;
                        EdtDescEtiqueta.Text := fieldbyname('nome_pro').AsString;
                     end
                  else
                     begin 
                        EdtNomePro.Text      := fieldbyname('desc_cupom').AsString;
                        EdtDescEtiqueta.Text := fieldbyname('desc_cupom').AsString;
                     end;
               end
            else
               begin 
                  AlertaCad('Produto não Cadastrado');
                  edtnomepro.Clear;
//                  EdtCodPro.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('Erro ao Buscar o Produto');
      edtnomepro.Clear;
//      edtcodpro.SetFocus;
    end;
  finally
    dm.QConsulta.Close;
  end;
end;

procedure TFrmRelEtiqueta.BtnOKClick(Sender: TObject);
begin 
   if EdtCodPro.Text = '' then
      begin 
         AlertaCad('Digite o Código do Produto');
//         EdtCodPro.SetFocus;
         exit;
      end;

   if EdtQuant.Text = '' then
      begin 
         AlertaCad('Digite a Quantidade');
//         EdtQuant.SetFocus;
         exit;
      end;

   if trim(EdtDescEtiqueta.Text) = '' then
      begin 
         AlertaCad('Digite a Descrição do Produto');
//         EdtDescEtiqueta.SetFocus;
         exit;
      end;

   if IBTRETQ.Active then
      IBTRETQ.Commit;
   IBTRETQ.StartTransaction;
   try
     try
       with IBSQLETQ do
          begin 
             close;
             sql.Clear;
             sql.Add('INSERT INTO ETIQUETA (COD_ETQ, COD_PRO, QUANT_ETQ, DESCRICAO) ' +
                     'VALUES(:1, :2, :3, :4)');
             Parambyname('1').AsInteger:= prxcod('etiqueta', 'cod_etq', dm.IBTransaction, dm.ibsqlcod);
             Parambyname('2').AsInteger:= strtoint(EdtCodPro.Text);
             Parambyname('3').AsInteger:= strtoint(EdtQuant.Text);
             Parambyname('4').AsString := trim(EdtDescEtiqueta.Text);

            ExecOrOpen;
          end;
       IBTRETQ.Commit;
     except
       IBTRETQ.Rollback;
       AlertaCad('Erro ao Gravar');
       EdtCodPro.Clear;
       EdtNomePro.Clear;
       EdtDescEtiqueta.Clear;
       EdtQuant.Text:= '1';
//       EdtCodPro.SetFocus;
     end;
   finally
      IBSQLETQ.Close;
      BuscaETQ;
      EdtCodPro.Clear;
      EdtNomePro.Clear;
      EdtDescEtiqueta.Clear;
      EdtQuant.Text:= '1';
      EdtCodPro.SetFocus;
    end;
end;

procedure TFrmRelEtiqueta.BtnSairClick(Sender: TObject);
begin 
   if Parent is TcxTabSheet then
      frmMenu.FTDI.CloseTabOfForm( TFormClass( Self.ClassType ) )
   else
      close;
end;

procedure TFrmRelEtiqueta.EdtQuantEnter(Sender: TObject);
begin 
   EdtQuant.SelectAll;
end;

procedure TFrmRelEtiqueta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if IBTRETQ.Active then
      IBTRETQ.Commit;
   QbuscaETQ.Close;

   {grava a posicao do combo}
   TDicLib.GravarGridDB( iCodUsu, RdgImp, Self, DM.IBDatabase );
   TDicLib.GravarGridDB( iCodUsu, cbbModelo, Self, DM.IBDatabase );
//   dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmRelEtiqueta.RdgEtq', inttostr(RdgEtq.itemIndex));
  // dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmRelEtiqueta.RdgImp', inttostr(RdgImp.itemIndex));
   Action:= caFree;
end;

procedure TFrmRelEtiqueta.BtnLimparClick(Sender: TObject);
begin 
   if Application.MessageBox('Confirma a Exclusão?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         if IBTRETQ.Active then
            IBTRETQ.Commit;
         IBTRETQ.StartTransaction;
         try
           try
             with IBSQLETQ do
                begin 
                   close;
                   sql.Clear;
                   sql.Add('DELETE FROM ETIQUETA');
                   ExecOrOpen;
                end;
             IBTRETQ.Commit;
           except
             IBTRETQ.Rollback;
             AlertaCad('Erro ao excluir as etiquetas');
           end;
         finally
           IBSQLETQ.close;
           btnimp.Enabled    := false;
           BtnExc.Enabled    := false;
           BtnLimpar.Enabled := false;
         end;
      end;
   BuscaETQ;
end;

procedure TFrmRelEtiqueta.FormShow(Sender: TObject);
begin 
   EdtCodPro.Clear;
   EdtNomePro.Clear;
   EdtQuant.Text:= '1';
   BuscaETQ;
   EdtCodPro.SetFocus;
end;

procedure TFrmRelEtiqueta.PreencheTabTemp;
var
  I: Integer;
  Tot: Integer;
  Calc: Integer;
begin
   dsTempEtiquetas.CreateDataSet;
   try
       dsTempEtiquetas.Open;
       dsTempEtiquetas.EmptyDataSet;
       QbuscaETQ.Last;
       QbuscaETQ.First;
       Tot := QbuscaETQ.RecordCount;
       cxProgres.Position := 0;
       while not QbuscaETQ.Eof do
          begin
             for I := 1 to QbuscaETQQUANT_ETQ.AsInteger do
                 begin
                     dsTempEtiquetas.Insert;
                     dsTempEtiquetasCOD_ETQ.AsInteger := QbuscaETQCOD_ETQ.AsInteger;
                     dsTempEtiquetasCOD_PRO.AsInteger := QbuscaETQCOD_PRO.AsInteger;
                     dsTempEtiquetasQUANT_ETQ.AsInteger := QbuscaETQQUANT_ETQ.AsInteger;
                     dsTempEtiquetasVALOR_PRO.AsCurrency := QbuscaETQVALOR_PRO.AsCurrency;
                     dsTempEtiquetasPROMOCAO_PRO.AsCurrency := QbuscaETQPROMOCAO_PRO.AsCurrency;
                     dsTempEtiquetasREFERENCIA_PRO.AsString := QbuscaETQREFERENCIA_PRO.AsString;
                     dsTempEtiquetasPRECO_PRAZO_PRO.AsCurrency := QbuscaETQPRECO_PRAZO_PRO.AsCurrency;
                     dsTempEtiquetasDESCRICAO.AsString := QbuscaETQDESCRICAO.AsString;
                     dsTempEtiquetasUNIDADE_SAIDA.AsString := QbuscaETQUNIDADE_SAIDA.AsString;
                     dsTempEtiquetasVALOR_ATACADO.AsCurrency := QbuscaETQVALOR_ATACADO.AsCurrency;
                     dsTempEtiquetasCOR.AsString := QbuscaETQCOR.AsString;
                     dsTempEtiquetasTAMANHO.AsString := QbuscaETQTAMANHO.AsString;
                     dsTempEtiquetasDESC_SETOR.AsString := QbuscaETQDESC_SETOR.AsString;
                     dsTempEtiquetasCODIGO_BARRA_PRO.AsString := QbuscaETQCODIGO_BARRA_PRO.AsString;
                     dsTempEtiquetas.Post;
                 end;
             QbuscaETQ.Next;
             Calc := Trunc( TDicCalc.Dividir( QbuscaETQ.RecNo * 100, Tot ) );
             cxProgres.Position := Calc;
             Application.ProcessMessages;
          end;
       dsTempEtiquetas.First;
       frxEtiquetas.PrepareReport();
       frxEtiquetas.ShowReport();
   finally
       dsTempEtiquetas.EmptyDataSet;
       dsTempEtiquetas.Close;
   end;
end;

procedure TFrmRelEtiqueta.BtnExcClick(Sender: TObject);
var iAuxCodigo : integer;
begin 
   if Application.MessageBox('Confirma a Exclusão do Item?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         iAuxCodigo:= QbuscaETQCOD_ETQ.AsInteger;
         if IBTRETQ.Active then
            IBTRETQ.Commit;
         IBTRETQ.StartTransaction;
         try
           try
             with IBSQLETQ do
                begin 
                   close;
                   sql.Clear;
                   sql.add('DELETE FROM ETIQUETA WHERE COD_ETQ = :COD');
                   Parambyname('cod').AsInteger:= iAuxCodigo;
                   ExecOrOpen;
                end;
             IBTRETQ.Commit;
           except
             IBTRETQ.Rollback;
             AlertaCad('Erro ao Excluir a Etiqueta');
           end;
         finally
           IBSQLETQ.Close;
           BuscaETQ;
         end;
      end;
end;

procedure TFrmRelEtiqueta.BtnImpClick(Sender: TObject);
begin
   if cbbModelo.ItemIndex > -1 then
      begin
        TDicLib.GetRel( iEmp, 'REL_ETIQUETAS', cbbModelo.Text,
          frxEtiquetas, DM.IBDatabase );
      end;
   PreencheTabTemp;
end;

procedure TFrmRelEtiqueta.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmRelEtiqueta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.
