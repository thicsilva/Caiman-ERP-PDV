unit UCFOP_Tributacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Menus, Mask, RxToolEdit, RxCurrEdit,
  Ubibli1, ComCtrls, sSpeedButton, UConsGrupo, UNovosComponentes,
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script,
  FireDAC.Comp.DataSet, Data.DB;

type
  TfrmCFOP_Tributacoes = class(UNovoFormulario.TForm)
    rbOrigem: TRadioGroup;
    GroupBox1: TGroupBox;
    lbDescCFOP: TLabel;
    Label6: TLabel;
    edtCST_IPI_Dentro: TComboBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    edtCodICMS: TEdit;
    Label2: TLabel;
    BtnConsICMSContEST: TsSpeedButton;
    edtDescICMS: TEdit;
    Label3: TLabel;
    edtCST_Dentro: TComboBox;
    Label7: TLabel;
    edtRed_dentro: TCurrencyEdit;
    CheckSTContEst: TCheckBox;
    Label8: TLabel;
    edtSTDentro: TCurrencyEdit;
    Label9: TLabel;
    edtIpiDentro: TCurrencyEdit;
    Label4: TLabel;
    edtCST_PIS: TComboBox;
    Label5: TLabel;
    edtCST_COFINS: TComboBox;
    Label10: TLabel;
    edtCSOSN: TComboBox;
    sSpeedButton1: TsSpeedButton;
    sSpeedButton2: TsSpeedButton;
    SQL_Tributacoes: TFDQuery;
    IBTR_Tributacoes: TFDTransaction;
    CheckPisCofins: TCheckBox;
    PanelPisCofins: TPanel;
    Label15: TLabel;
    edtPIS: TCurrencyEdit;
    Label17: TLabel;
    edtCOFINSS: TCurrencyEdit;
    Label18: TLabel;
    edtIR: TCurrencyEdit;
    Label19: TLabel;
    edtContSocial: TCurrencyEdit;
    Label20: TLabel;
    edtOutras: TCurrencyEdit;
    procedure CheckSTContEstClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BuscaTributacoes;
    procedure sSpeedButton2Click(Sender: TObject);
    procedure CheckPisCofinsClick(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure edtCodICMSExit(Sender: TObject);
    procedure BtnConsICMSContESTClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    bGrava: Boolean;
  public
    { Public declarations }
    CFOPEditando: Integer;
    CFOPDescricao: String;
  end;

var
  frmCFOP_Tributacoes: TfrmCFOP_Tributacoes;

implementation

uses
  UDM, UDialog, UConsGRP, UNovoPrincipal;

{$R *.dfm}

procedure TfrmCFOP_Tributacoes.BtnConsICMSContESTClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsGRP, FrmConsGRP);
  FrmConsGRP.Tag:= 21;
  FrmConsGRP.ShowModal;
end;

procedure TfrmCFOP_Tributacoes.BuscaTributacoes;
var
  Aux: STring;
begin
//
   if DM.IBTransaction.Active then
      DM.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;

   DM.QCFOP_Tributacoes.Close;
   dm.QCFOP_Tributacoes.ParamByName( 'COD_CFOP' ).AsInteger := CFOPEditando;
   dm.QCFOP_Tributacoes.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
   DM.QCFOP_Tributacoes.Open;
   if DM.QCFOP_Tributacoes.IsEmpty then
      begin
         bGrava := True;
         Aux := Copy( IntToStr( CFOPEditando ), 1, 1 );
         if ( Aux = '1' ) or
         ( Aux = '2' )
         or( Aux = '3' )then
           begin
               with dm.QConsulta do
                  begin
                     close;
                     sql.Clear;
                     sql.Text:= 'SELECT PIS_ENTRADAS, COFINS_ENTRADAS, IR_ENTRADAS, ' +
                                'CONT_SOCIAL_ENTRADA, OUTRAS_ENTRADAS ' +
                                'FROM PARAMETROS ' +
                                'WHERE COD_EMP = :CODEMP';
                     Parambyname('codemp').AsInteger:= iEmp;
                     open;
                     edtPIS.Text    := fieldbyname('PIS_ENTRADAS').AsString;
                     edtCOFINSS.Text := fieldbyname('COFINS_ENTRADAS').AsString;
                     edtIR.Text     := fieldbyname('IR_ENTRADAS').AsString;
                     edtContSocial.Text   := fieldbyname('CONT_SOCIAL_ENTRADA').AsString;
                     edtOutras.Text := fieldbyname('OUTRAS_ENTRADAS').AsString;
                  end;
            end
         else
            begin
               with dm.QConsulta do
                  begin
                     close;
                     sql.Clear;
                     sql.Text:= 'SELECT ALIQUOTA_PIS, ALIQUOTA_COFINS, ALIQUOTA_IR, ' +
                        'ALIQUOTA_CSLL, ALIQUOTA_OUTRAS ' +
                        'FROM PARAMETROS ' +
                        'WHERE COD_EMP = :CODEMP';
                     Parambyname('codemp').AsInteger:= iEmp;
                     open;
                     edtPIS.Text    := fieldbyname('ALIQUOTA_PIS').AsString;
                     edtCOFINSS.Text := fieldbyname('ALIQUOTA_COFINS').AsString;
                     edtIR.Text     := fieldbyname('ALIQUOTA_IR').AsString;
                     edtContSocial.Text   := fieldbyname('ALIQUOTA_CSLL').AsString;
                     edtOutras.Text := fieldbyname('ALIQUOTA_OUTRAS').AsString;
                  end;
            end;

      end
   else
      begin
         bGrava := False;
         if dm.QCFOP_TributacoesORIGEM.AsString = '' then
            rbOrigem.ItemIndex := -1
         else
            rbOrigem.ItemIndex := dm.QCFOP_TributacoesORIGEM.AsInteger;
         BuscaCSTNoCombo( edtCST_IPI_Dentro,
              Trim( dm.QCFOP_TributacoesCST_IPI.AsString ) );
         BuscaCSTNoCombo( edtCSOSN,
              Trim( dm.QCFOP_TributacoesCSOSN.AsString ) );
         BuscaCSTNoCombo( edtCST_Dentro,
              Trim( dm.QCFOP_TributacoesCST_DENTRO.AsString ) );
         BuscaCSTNoCombo( edtCST_PIS,
              Trim( dm.QCFOP_TributacoesCST_PIS.AsString ) );
         BuscaCSTNoCombo( edtCST_COFINS,
              Trim( dm.QCFOP_TributacoesCST_COFINS.AsString ) );
         edtCodICMS.Text := dm.QCFOP_TributacoesICMS_DENTRO.AsString;
         edtCodICMS.Text := dm.QCFOP_TributacoesICMS_DENTRO.AsString;
         edtRed_dentro.Value := DM.QCFOP_TributacoesREDU_ICMS_DENTRO.AsFloat;
         edtSTDentro.Value := DM.QCFOP_TributacoesAGREG_DENTRO.AsFloat;
         edtIpiDentro.Value := dm.QCFOP_TributacoesIPI_DENTRO.AsFloat;
         CheckSTContEst.Checked := ( Trim( DM.QCFOP_TributacoesISENTO_PIS_COFINS.AsString ) = 'S' );

         edtPIS.Value := dm.QCFOP_TributacoesPIS.AsFloat;
         edtCOFINSS.Value := dm.QCFOP_TributacoesCOFINS.AsFloat;
         edtIR.Value := DM.QCFOP_TributacoesIR.AsFloat;
         edtContSocial.Value := dm.QCFOP_TributacoesCONT_SOCIAL.AsFloat;
         edtOutras.Value := dm.QCFOP_TributacoesOUTRAS.AsFloat;
         CheckPisCofins.Checked := ( Trim( DM.QCFOP_TributacoesISENTO_PIS_COFINS.AsString ) = 'S' );
      end;

   dm.IBTransaction.Commit;
end;

procedure TfrmCFOP_Tributacoes.CheckPisCofinsClick(Sender: TObject);
begin
   PanelPisCofins.Visible := not CheckPisCofins.Checked;
end;

procedure TfrmCFOP_Tributacoes.CheckSTContEstClick(Sender: TObject);
begin
   edtSTDentro.Value := 0;
   edtSTDentro.Enabled := CheckSTContEst.Checked;
end;

procedure TfrmCFOP_Tributacoes.edtCodICMSExit(Sender: TObject);
var
   Ret: String;
begin
   if edtCodICMS.Text <> '' then
      Ret := ConsultaEdit('grupo_icms', edtCodICMS, 'cod_grp', 'nome_grp', dm.IBTransaction, dm.qConsulta)
   else
      Ret := '';
   if Ret = '' then
      edtDescICMS.Text := 'Grupo não Encontrado'
   else
       edtDescICMS.Text:= Ret;

end;

procedure TfrmCFOP_Tributacoes.FormShow(Sender: TObject);
begin
   lbDescCFOP.Caption := IntToStr( CFOPEditando )  + ' - ' + CFOPDescricao;
   LimpaEdit( frmCFOP_Tributacoes );
   bGrava := False;
   BuscaTributacoes;
   CheckPisCofinsClick( nil );
   CheckSTContEstClick( nil );

   edtCodICMSExit( nil );
end;

procedure TfrmCFOP_Tributacoes.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmConsGRP, FrmConsGRP);
  FrmConsGRP.Tag:=22;
  FrmConsGRP.ShowModal;
end;

procedure TfrmCFOP_Tributacoes.sSpeedButton1Click(Sender: TObject);
begin
   Close;
end;

procedure TfrmCFOP_Tributacoes.sSpeedButton2Click(Sender: TObject);
var
   Sql: String;
begin
   if bGrava then
      begin
         Sql := 'insert into CFOP_TRIBUTACOES( COD_CFOP, ORIGEM, ICMS_DENTRO, CST_DENTRO,' +
                'IPI_DENTRO, REDU_ICMS_DENTRO, TEM_SUBSTITUICAO, AGREG_DENTRO, ICMS_FORA, CST_FORA,' +
                'IPI_FORA, REDU_ICMS_FORA, CST_IPI, CSOSN, CST_PIS, CST_COFINS, ISENTO_PIS_COFINS,' +
                'PIS, COFINS, IR, CONT_SOCIAL, OUTRAS, COD_EMP ) VALUES( :COD_CFOP, :ORIGEM,' +
                ':ICMS_DENTRO, :CST_DENTRO, :IPI_DENTRO, :REDU_ICMS_DENTRO, :TEM_SUBSTITUICAO,' +
                ':AGREG_DENTRO, :ICMS_FORA, :CST_FORA, :IPI_FORA, :REDU_ICMS_FORA, :CST_IPI,' +
                ':CSOSN, :CST_PIS, :CST_COFINS, :ISENTO_PIS_COFINS, :PIS,:COFINS, :IR,' +
                ':CONT_SOCIAL, :OUTRAS, :COD_EMP );';
      end
   else
      begin
         Sql := 'update CFOP_TRIBUTACOES set ORIGEM=:ORIGEM, ICMS_DENTRO=:ICMS_DENTRO,' +
                'CST_DENTRO=:CST_DENTRO, IPI_DENTRO=:IPI_DENTRO,' +
                'REDU_ICMS_DENTRO=:REDU_ICMS_DENTRO, TEM_SUBSTITUICAO=:TEM_SUBSTITUICAO,' +
                'AGREG_DENTRO=:AGREG_DENTRO, ICMS_FORA=:ICMS_FORA,' +
                'CST_FORA=:CST_FORA, IPI_FORA=:IPI_FORA,' +
                'REDU_ICMS_FORA=:REDU_ICMS_FORA, CST_IPI=:CST_IPI,' +
                'CSOSN=:CSOSN, CST_PIS=:CST_PIS, CST_COFINS=:CST_COFINS,' +
                'ISENTO_PIS_COFINS=:ISENTO_PIS_COFINS, PIS=:PIS,' +
                'COFINS=:COFINS, IR=:IR, CONT_SOCIAL=:CONT_SOCIAL,' +
                'OUTRAS=:OUTRAS where COD_CFOP=:COD_CFOP and COD_EMP=:COD_EMP;';
      end;
   if IBTR_Tributacoes.Active then
      IBTR_Tributacoes.Commit;
   IBTR_Tributacoes.StartTransaction;
   try
   SQL_Tributacoes.SQL.Text := Sql;
   SQL_Tributacoes.ParamByName( 'COD_CFOP' ).AsInteger := CFOPEditando;
   if rbOrigem.ItemIndex >= 0 then
      SQL_Tributacoes.ParamByName( 'ORIGEM' ).AsString := IntToStr( rbOrigem.ItemIndex )
   else
      SQL_Tributacoes.ParamByName( 'ORIGEM' ).AsString := '';
   SQL_Tributacoes.ParamByName( 'ICMS_DENTRO' ).AsInteger := StrToInt( edtCodICMS.Text );
   SQL_Tributacoes.ParamByName( 'CST_DENTRO' ).AsString := Copy( edtCST_Dentro.Text, 1, 2 );
   SQL_Tributacoes.ParamByName( 'IPI_DENTRO' ).AsString := Copy( edtIpiDentro.Text, 1, 2 );
   SQL_Tributacoes.ParamByName( 'REDU_ICMS_DENTRO' ).AsFloat := edtRed_dentro.Value;
   if CheckSTContEst.Checked then
      SQL_Tributacoes.ParamByName( 'TEM_SUBSTITUICAO' ).AsString := 'S'
   else
      SQL_Tributacoes.ParamByName( 'TEM_SUBSTITUICAO' ).AsString := 'N';
   SQL_Tributacoes.ParamByName( 'AGREG_DENTRO' ).AsFloat := edtSTDentro.Value;
   SQL_Tributacoes.ParamByName( 'CST_IPI' ).AsString := Copy( edtCST_IPI_Dentro.Text, 1, 2 );
   SQL_Tributacoes.ParamByName( 'CSOSN' ).AsString := Copy( edtCSOSN.Text, 1, 3 );
   SQL_Tributacoes.ParamByName( 'CST_PIS' ).AsString := Copy( edtCST_PIS.Text, 1, 2 );
   SQL_Tributacoes.ParamByName( 'CST_COFINS' ).AsString := Copy( edtCST_COFINS.Text, 1, 2 );
   SQL_Tributacoes.ParamByName( 'PIS' ).AsFloat := edtPIS.Value;
   SQL_Tributacoes.ParamByName( 'COFINS' ).AsFloat := edtCOFINSS.Value;
   SQL_Tributacoes.ParamByName( 'IR' ).AsFloat := edtIR.Value;
   SQL_Tributacoes.ParamByName( 'CONT_SOCIAL' ).AsFloat := edtContSocial.Value;
   SQL_Tributacoes.ParamByName( 'OUTRAS' ).AsFloat := edtOutras.Value;
   SQL_Tributacoes.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
   SQL_Tributacoes.Prepare;
   SQL_Tributacoes.ExecOrOpen;
   IBTR_Tributacoes.Commit;
   Close;
   except
       KDialog( 'Erro ao Gravar tributações', 'Tributações', tdtInfo );
       IBTR_Tributacoes.Rollback;
   end;

end;

end.
