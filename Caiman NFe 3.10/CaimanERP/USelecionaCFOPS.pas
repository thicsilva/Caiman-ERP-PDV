unit USelecionaCFOPS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, StdCtrls, RzCmboBx, RzDBCmbo, ExtCtrls, DBCtrls, Mask, Buttons, 
  ComCtrls, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TfrmSelecionaCFOPS = class(UNovoFormulario.TForm)
    GroupBox2: TGroupBox;
    Label95: TLabel;
    RzDBComboBox1: TRzDBComboBox;
    Label114: TLabel;
    RzDBComboBox6: TRzDBComboBox;
    PageControl1: TPageControl;
    TabSheet8: TTabSheet;
    Label96: TLabel;
    SpeedButton4: TsSpeedButton;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label115: TLabel;
    dbedtICMS_DENTRO: TDBEdit;
    Desc_icms_dentro: TEdit;
    RzDBComboBox2: TRzDBComboBox;
    dbchkTEM_SUBSTITUICAO: TDBCheckBox;
    dbedtREDU_ICMS_DENTRO: TDBEdit;
    dbedtAGREG_DENTRO: TDBEdit;
    dbedtIPI_DENTRO: TDBEdit;
    cfop_Dentro: TRzDBComboBox;
    TabSheet9: TTabSheet;
    Label102: TLabel;
    Label103: TLabel;
    SpeedButton5: TsSpeedButton;
    Label104: TLabel;
    Label105: TLabel;
    Label107: TLabel;
    Label116: TLabel;
    dbedtICMS_FORA: TDBEdit;
    Desc_icms_fora: TEdit;
    RzDBComboBox3: TRzDBComboBox;
    dbedtREDU_ICMS_FORA: TDBEdit;
    dbedtIPI_FORA: TDBEdit;
    cfop_fora: TRzDBComboBox;
    TabSheet10: TTabSheet;
    Label106: TLabel;
    Label108: TLabel;
    RzDBComboBox4: TRzDBComboBox;
    RzDBComboBox5: TRzDBComboBox;
    DBCheckBox1: TDBCheckBox;
    PanelPisCofins: TPanel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    dbedtPIS: TDBEdit;
    dbedtCOFINS: TDBEdit;
    dbedtIR: TDBEdit;
    dbedtCONT_SOCIAL: TDBEdit;
    dbedtOUTRAS: TDBEdit;
    Button1: TButton;
    SqlsPRODUTO_T_E: TFDUpdateSQL;
    PRODUTO_T_E: TFDQuery;
    GroupBox1: TGroupBox;
    lbproduto: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DS_T_E: TDataSource;
    PRODUTO_T_ECOD: TIntegerField;
    PRODUTO_T_ECOD_PROD: TIntegerField;
    PRODUTO_T_EORIGEM: TStringField;
    PRODUTO_T_EICMS_DENTRO: TIntegerField;
    PRODUTO_T_ECST_DENTRO: TStringField;
    PRODUTO_T_EIPI_DENTRO: TFloatField;
    PRODUTO_T_EREDU_ICMS_DENTRO: TFloatField;
    PRODUTO_T_ETEM_SUBSTITUICAO: TStringField;
    PRODUTO_T_EAGREG_DENTRO: TFloatField;
    PRODUTO_T_EICMS_FORA: TIntegerField;
    PRODUTO_T_ECST_FORA: TStringField;
    PRODUTO_T_EIPI_FORA: TFloatField;
    PRODUTO_T_EREDU_ICMS_FORA: TFloatField;
    PRODUTO_T_ECST_IPI: TStringField;
    PRODUTO_T_ECSOSN: TStringField;
    PRODUTO_T_ECST_PIS: TStringField;
    PRODUTO_T_ECST_COFINS: TStringField;
    PRODUTO_T_EISENTO_PIS_COFINS: TStringField;
    PRODUTO_T_EPIS: TFloatField;
    PRODUTO_T_ECOFINS: TFloatField;
    PRODUTO_T_EIR: TFloatField;
    PRODUTO_T_ECONT_SOCIAL: TFloatField;
    PRODUTO_T_EOUTRAS: TFloatField;
    PRODUTO_T_ECOD_EMP: TIntegerField;
    PRODUTO_T_ECOD_CFOP_DENTRO: TIntegerField;
    PRODUTO_T_ECOD_CFOP_FORA: TIntegerField;
    IBTransaction1: TFDTransaction;
    procedure BuscaTributacoesDentro;
    procedure BuscaTributacoesFora;
    procedure CarregaCfops;
    procedure dbedtICMS_DENTROExit(Sender: TObject);
    procedure dbedtICMS_FORAExit(Sender: TObject);
    procedure dbchkTEM_SUBSTITUICAOClick(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure IniciaTributos;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure cfop_DentroChange(Sender: TObject);
    procedure cfop_foraChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    Cod_produto: Integer;
    Descricao_produto: String;
  end;

var
  frmSelecionaCFOPS: TfrmSelecionaCFOPS;

implementation

uses
  UDM, UDMI, Ubibli1, UDialog, UCadCFOP, UNovoPrincipal;

{$R *.dfm}

procedure TfrmSelecionaCFOPS.BitBtn1Click(Sender: TObject);
begin
   if ( PRODUTO_T_E.State = dsEdit ) or ( PRODUTO_T_E.State = dsInsert ) then
      begin
         PRODUTO_T_E.Post;
      end;
    ModalResult := mrOk;
   if IBTransaction1.Active then
      IBTransaction1.Commit;

end;

procedure TfrmSelecionaCFOPS.BitBtn2Click(Sender: TObject);
begin
     if ( PRODUTO_T_E.State = dsEdit ) or ( PRODUTO_T_E.State = dsInsert ) then
      begin
         PRODUTO_T_E.Cancel;
       end;
   if IBTransaction1.Active then
      IBTransaction1.Rollback;
   ModalResult := mrCancel;
end;

procedure TfrmSelecionaCFOPS.BuscaTributacoesDentro;
begin
//
   if DM.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;

   dm.QCFOP_Tributacoes.Close;
   dm.QCFOP_Tributacoes.ParamByName( 'COD_CFOP' ).AsString := cfop_Dentro.Value;
   dm.QCFOP_Tributacoes.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
   dm.QCFOP_Tributacoes.Open;
   if not dm.QCFOP_Tributacoes.IsEmpty then
       begin
          if ( PRODUTO_T_E.State = dsEdit ) or  ( PRODUTO_T_E.State = dsInsert ) then
             begin
                PRODUTO_T_EORIGEM.AsString := DM.QCFOP_TributacoesORIGEM.AsString;
                PRODUTO_T_ECST_IPI.AsString := DM.QCFOP_TributacoesCST_IPI.AsString;
                PRODUTO_T_EICMS_DENTRO.AsInteger := dm.QCFOP_TributacoesICMS_DENTRO.AsInteger;
                PRODUTO_T_ECST_DENTRO.AsString := DM.QCFOP_TributacoesCST_DENTRO.AsString;
                PRODUTO_T_EREDU_ICMS_DENTRO.AsFloat := dm.QCFOP_TributacoesREDU_ICMS_DENTRO.AsFloat;
                PRODUTO_T_ETEM_SUBSTITUICAO.AsString := dm.QCFOP_TributacoesTEM_SUBSTITUICAO.AsString;
                PRODUTO_T_EAGREG_DENTRO.AsFloat := dm.QCFOP_TributacoesAGREG_DENTRO.AsFloat;
                PRODUTO_T_EIPI_DENTRO.AsFloat := DM.QCFOP_TributacoesIPI_DENTRO.AsFloat;
                PRODUTO_T_ECST_PIS.AsString := dm.QCFOP_TributacoesCST_PIS.AsString;
                PRODUTO_T_ECST_COFINS.AsString := dm.QCFOP_TributacoesCST_COFINS.AsString;
                PRODUTO_T_EISENTO_PIS_COFINS.AsString := dm.QCFOP_TributacoesISENTO_PIS_COFINS.AsString;
                PRODUTO_T_EPIS.AsFloat := dm.QCFOP_TributacoesPIS.AsFloat;
                PRODUTO_T_ECOFINS.AsFloat := dm.QCFOP_TributacoesCOFINS.AsFloat;
                PRODUTO_T_ECONT_SOCIAL.AsFloat := dm.QCFOP_TributacoesCONT_SOCIAL.AsFloat;
                PRODUTO_T_EIR.AsFloat := dm.QCFOP_TributacoesIR.AsFloat;
                PRODUTO_T_EOUTRAS.AsFloat := dm.QCFOP_TributacoesOUTRAS.AsFloat;
             end;

       end;
   dm.QCFOP_Tributacoes.Close;

   dm.IBTransaction.Commit;
   dbedtICMS_DENTROExit( nil );
end;


procedure TfrmSelecionaCFOPS.BuscaTributacoesFora;
begin
   if DM.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;

   dm.QCFOP_Tributacoes.Close;
   dm.QCFOP_Tributacoes.ParamByName( 'COD_CFOP' ).AsString :=cfop_fora.Value;
   dm.QCFOP_Tributacoes.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
   dm.QCFOP_Tributacoes.Open;
   if not dm.QCFOP_Tributacoes.IsEmpty then
       begin
          if ( PRODUTO_T_E.State = dsEdit ) or  ( PRODUTO_T_E.State = dsInsert ) then
             begin
                PRODUTO_T_EORIGEM.AsString := DM.QCFOP_TributacoesORIGEM.AsString;
                PRODUTO_T_ECST_IPI.AsString := DM.QCFOP_TributacoesCST_IPI.AsString;
                PRODUTO_T_EICMS_FORA.AsInteger := dm.QCFOP_TributacoesICMS_DENTRO.AsInteger;
                PRODUTO_T_ECST_FORA.AsString := DM.QCFOP_TributacoesCST_DENTRO.AsString;
                PRODUTO_T_EREDU_ICMS_FORA.AsFloat := dm.QCFOP_TributacoesREDU_ICMS_DENTRO.AsFloat;
                PRODUTO_T_EIPI_FORA.AsFloat := DM.QCFOP_TributacoesIPI_DENTRO.AsFloat;
                PRODUTO_T_ECST_PIS.AsString := dm.QCFOP_TributacoesCST_PIS.AsString;
                PRODUTO_T_ECST_COFINS.AsString := dm.QCFOP_TributacoesCST_COFINS.AsString;
                PRODUTO_T_EISENTO_PIS_COFINS.AsString := dm.QCFOP_TributacoesISENTO_PIS_COFINS.AsString;
                PRODUTO_T_EPIS.AsFloat := dm.QCFOP_TributacoesPIS.AsFloat;
                PRODUTO_T_ECOFINS.AsFloat := dm.QCFOP_TributacoesCOFINS.AsFloat;
                PRODUTO_T_ECONT_SOCIAL.AsFloat := dm.QCFOP_TributacoesCONT_SOCIAL.AsFloat;
                PRODUTO_T_EIR.AsFloat := dm.QCFOP_TributacoesIR.AsFloat;
                PRODUTO_T_EOUTRAS.AsFloat := dm.QCFOP_TributacoesOUTRAS.AsFloat;

             end;

       end;
   dm.QCFOP_Tributacoes.Close;

   dm.IBTransaction.Commit;
   dbedtICMS_FORAExit( nil );
   DBCheckBox1Click( nil );

end;

procedure TfrmSelecionaCFOPS.cfop_DentroChange(Sender: TObject);
begin
   if KDialog( 'Pegar Tributações do CFOP?', 'Cadastro Produto', tdtPergunta ) then
      begin
         BuscaTributacoesDentro;
      end;

end;

procedure TfrmSelecionaCFOPS.cfop_foraChange(Sender: TObject);
begin
   if KDialog( 'Pegar Tributações do CFOP?', 'Cadastro Produto', tdtPergunta ) then
      begin
         BuscaTributacoesFora;
      end;

end;

procedure TfrmSelecionaCFOPS.DBCheckBox1Click(Sender: TObject);
begin
  PanelPisCofins.Visible := not DBCheckBox1.Checked;

end;

procedure TfrmSelecionaCFOPS.dbchkTEM_SUBSTITUICAOClick(Sender: TObject);
begin

  dbedtAGREG_DENTRO.Enabled := dbchkTEM_SUBSTITUICAO.Checked;
  if not dbedtAGREG_DENTRO.Enabled then
     begin
        if ( PRODUTO_T_E.State = dsEdit ) or (  PRODUTO_T_E.State = dsInsert ) then
            PRODUTO_T_EAGREG_DENTRO.AsFloat := 0;
     end;

end;

procedure TfrmSelecionaCFOPS.dbedtICMS_DENTROExit(Sender: TObject);
var
   Ret: String;
begin
   if dbedtICMS_DENTRO.Text <> '' then
      Ret := ConsultaDBEdit('grupo_icms', dbedtICMS_DENTRO, 'cod_grp', 'nome_grp', dm.IBTransaction, dm.qConsulta)
   else
      Ret := '';
   if Ret = '' then
      Desc_icms_dentro.Text := 'Grupo não Encontrado'
   else
       Desc_icms_dentro.Text:= Ret;

end;

procedure TfrmSelecionaCFOPS.dbedtICMS_FORAExit(Sender: TObject);
var
   Ret: String;
begin
   if dbedtICMS_FORA.Text <> '' then
      Ret := ConsultaDBEdit('grupo_icms', dbedtICMS_FORA, 'cod_grp', 'nome_grp', dm.IBTransaction, dm.qConsulta)
   else
      Ret := '';
   if Ret = '' then
      Desc_icms_fora.Text := 'Grupo não Encontrado'
   else
       Desc_icms_fora.Text:= Ret;

end;

procedure TfrmSelecionaCFOPS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmSelecionaCFOPS.FormShow(Sender: TObject);
begin
   if IBTransaction1.Active then
      IBTransaction1.Commit;
   IBTransaction1.StartTransaction;
   lbproduto.Caption := Descricao_produto;
   CarregaCfops;
   IniciaTributos;
end;

procedure TfrmSelecionaCFOPS.IniciaTributos;
begin

        PRODUTO_T_E.Close;
        PRODUTO_T_E.ParamByName( 'COD_PRO' ).AsInteger := Cod_produto;
        PRODUTO_T_E.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
        PRODUTO_T_E.Open;
        if PRODUTO_T_E.IsEmpty then
           begin
              PRODUTO_T_E.Insert;
              PRODUTO_T_ECOD_PROD.AsInteger := Cod_produto;
              PRODUTO_T_ECOD_EMP.AsInteger := iEmp;
              PRODUTO_T_ETEM_SUBSTITUICAO.AsString := 'N';
              PRODUTO_T_EISENTO_PIS_COFINS.AsString := 'S';
              PRODUTO_T_E.Post;
           end;

        DBCheckBox1Click( nil );
        dbchkTEM_SUBSTITUICAOClick( nil );
        dbedtICMS_DENTROExit( nil );
        dbedtICMS_FORAExit( nil );

end;

procedure TfrmSelecionaCFOPS.Button1Click(Sender: TObject);
begin
  BuscaFormulario( TFrmCadCFOP, True );
  CarregaCfops;
end;

procedure TfrmSelecionaCFOPS.CarregaCfops;
var
  Aux: String;
begin
//
   if DM.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;

               cfop_Dentro.ClearItemsValues;
               cfop_fora.ClearItemsValues;
{               cfop_venda_dentro.Items.Clear;
               cfop_venda_fora.Items.Clear;
               cfop_venda_dentro.Values.Clear;
               cfop_venda_fora.Values.Clear;}

   dm.QConsulta.Close;
   dm.QConsulta.SQL.Text := 'select * from CFOP';
   dm.QConsulta.Open;
   dm.QConsulta.First;
   while not dm.QConsulta.Eof do
      begin
         Aux := Copy( dm.QConsulta.FieldByName( 'COD_CFO' ).AsString, 1, 1 ) ;
         if ( Aux[1] in ['1'..'3'] ) then
            begin
               cfop_Dentro.AddItemValue(dm.QConsulta.FieldByName( 'COD_CFO' ).AsString +
               ' - ' + dm.QConsulta.FieldByName( 'NOME_CFO' ).AsString, dm.QConsulta.FieldByName( 'COD_CFO' ).AsString );
               cfop_Fora.AddItemValue(dm.QConsulta.FieldByName( 'COD_CFO' ).AsString +
               ' - ' + dm.QConsulta.FieldByName( 'NOME_CFO' ).AsString, dm.QConsulta.FieldByName( 'COD_CFO' ).AsString );

            end;

         dm.QConsulta.Next;
      end;

   dm.QConsulta.Close;
   dm.IBTransaction.Commit;
end;


end.




