unit UTributacaoPerfil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UCadNovoDB, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxClasses, Vcl.ImgList, Vcl.StdCtrls, cxButtons, Vcl.Mask, Vcl.ComCtrls,
  cxTextEdit, cxCurrencyEdit, cxLabel, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  Vcl.ExtCtrls, Vcl.ToolWin, Vcl.DBCtrls, UNovosComponentes, RzPanel, RzDBNav, System.StrUtils,
  cxDropDownEdit, cxDBExtLookupComboBox, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, JvExStdCtrls, JvCombobox, JvDBCombobox;

type
  TfrmCadTributacaoPerfil = class(TfrmCadNovoDB)
    QPrincipalCOD_PERFIL: TIntegerField;
    QPrincipalCOD_EMP: TIntegerField;
    QPrincipalDESCRICAO: TStringField;
    QPrincipalORIGEM_PROD: TIntegerField;
    QPrincipalINCIDE_PISCOFINS: TStringField;
    QPrincipalCOD_NAO_INSIDENTE: TIntegerField;
    QPrincipalDENTRO_CONT_CFOP: TIntegerField;
    QPrincipalDENTRO_CONT_CST_IPI: TStringField;
    QPrincipalDENTRO_CONT_IPI: TBCDField;
    QPrincipalDENTRO_NCONT_CFOP: TIntegerField;
    QPrincipalDENTRO_NCONT_CST_IPI: TStringField;
    QPrincipalDENTRO_NCONT_IPI: TBCDField;
    QPrincipalFORA_CONT_CFOP: TIntegerField;
    QPrincipalFORA_CONT_CST_IPI: TStringField;
    QPrincipalFORA_CONT_IPI: TBCDField;
    QPrincipalFORA_NCONT_CFOP: TIntegerField;
    QPrincipalFORA_NCONT_CST_IPI: TStringField;
    QPrincipalFORA_NCONT_IPI: TBCDField;
    QPrincipalISENTO_PISCOFINS: TStringField;
    QPrincipalCST_PIS: TStringField;
    QPrincipalPIS: TBCDField;
    QPrincipalCST_COFINS: TStringField;
    QPrincipalCOFINS: TBCDField;
    QPrincipalENT_DENTRO_CONT_CFOP: TIntegerField;
    QPrincipalENT_DENTRO_CONT_CST_IPI: TStringField;
    QPrincipalENT_DENTRO_CONT_IPI: TBCDField;
    QPrincipalENT_DENTRO_NCONT_CFOP: TIntegerField;
    QPrincipalENT_DENTRO_NCONT_CST_IPI: TStringField;
    QPrincipalENT_DENTRO_NCONT_IPI: TBCDField;
    QPrincipalENT_FORA_CONT_CFOP: TIntegerField;
    QPrincipalENT_FORA_CONT_CST_IPI: TStringField;
    QPrincipalENT_FORA_CONT_IPI: TBCDField;
    QPrincipalENT_FORA_NCONT_CFOP: TIntegerField;
    QPrincipalENT_FORA_NCONT_CST_IPI: TStringField;
    QPrincipalENT_FORA_NCONT_IPI: TBCDField;
    QPrincipalENT_ISENTO_PISCOFINS: TStringField;
    QPrincipalENT_CST_PIS: TStringField;
    QPrincipalENT_PIS: TBCDField;
    QPrincipalENT_CST_COFINS: TStringField;
    QPrincipalENT_COFINS: TBCDField;
    cxVisualizaDBTableView1ORIGEM_PROD: TcxGridDBColumn;
    cxVisualizaDBTableView1INCIDE_PISCOFINS: TcxGridDBColumn;
    cxVisualizaDBTableView1COD_NAO_INSIDENTE: TcxGridDBColumn;
    cxVisualizaDBTableView1COD_PERFIL: TcxGridDBColumn;
    cxVisualizaDBTableView1DESCRICAO: TcxGridDBColumn;
    cxVisualizaDBTableView2: TcxGridDBTableView;
    cxVisualizaDBTableView3: TcxGridDBTableView;
    cxstylHeader2: TcxStyle;
    cxVisualizaDBTableView3DENTRO_CONT_CFOP: TcxGridDBColumn;
    cxVisualizaDBTableView3DENTRO_CONT_CST_IPI: TcxGridDBColumn;
    cxVisualizaDBTableView3DENTRO_CONT_IPI: TcxGridDBColumn;
    cxVisualizaDBTableView3DENTRO_NCONT_CFOP: TcxGridDBColumn;
    cxVisualizaDBTableView3DENTRO_NCONT_CST_IPI: TcxGridDBColumn;
    cxVisualizaDBTableView3DENTRO_NCONT_IPI: TcxGridDBColumn;
    cxVisualizaDBTableView3FORA_CONT_CFOP: TcxGridDBColumn;
    cxVisualizaDBTableView3FORA_CONT_CST_IPI: TcxGridDBColumn;
    cxVisualizaDBTableView3FORA_CONT_IPI: TcxGridDBColumn;
    cxVisualizaDBTableView3FORA_NCONT_CFOP: TcxGridDBColumn;
    cxVisualizaDBTableView3FORA_NCONT_CST_IPI: TcxGridDBColumn;
    cxVisualizaDBTableView3FORA_NCONT_IPI: TcxGridDBColumn;
    cxVisualizaDBTableView3ISENTO_PISCOFINS: TcxGridDBColumn;
    cxVisualizaDBTableView3CST_PIS: TcxGridDBColumn;
    cxVisualizaDBTableView3PIS: TcxGridDBColumn;
    cxVisualizaDBTableView3CST_COFINS: TcxGridDBColumn;
    cxVisualizaDBTableView3COFINS: TcxGridDBColumn;
    upPrincipal: TFDUpdateSQL;
    cxPaginas2: TcxPageControl;
    Panel3: TPanel;
    pnl1: TPanel;
    cxLabel1: TcxLabel;
    dbedtCOD_PERFIL: TDBEdit;
    Panel4: TPanel;
    cxLabel2: TcxLabel;
    dbedtDESCRICAO: TDBEdit;
    Panel5: TPanel;
    dbrgrpORIGEM_PROD: TDBRadioGroup;
    dbrgrpINCIDE_PISCOFINS: TDBRadioGroup;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    cxTabSheet5: TcxTabSheet;
    cxTabSheet6: TcxTabSheet;
    cxGridNCM: TcxGrid;
    cxGridNCMView1: TcxGridDBTableView;
    cxGridNCMLevel1: TcxGridLevel;
    QNcm: TFDQuery;
    QNcmNCM: TIntegerField;
    dsNcm: TDataSource;
    cxGridNCMView1NCM: TcxGridDBColumn;
    pnlBootonNCm: TPanel;
    RzDBNavigator1: TRzDBNavigator;
    upNCM: TFDUpdateSQL;
    QNcmDESCRICAO: TStringField;
    cxGridNCMView1DESCRICAO: TcxGridDBColumn;
    QNcmCOD_PERFIL: TIntegerField;
    QNcmCOD_EMP: TIntegerField;
    cxEstados: TcxGrid;
    cxEstadosView1: TcxGridDBTableView;
    cxEstadosLevel1: TcxGridLevel;
    QEstados: TFDQuery;
    upEstados: TFDUpdateSQL;
    dsEstados: TDataSource;
    QEstadosCOD_PERFIL: TIntegerField;
    QEstadosCOD_EMP: TIntegerField;
    QEstadosUF: TStringField;
    QEstadosICMS_ENTRADA: TIntegerField;
    QEstadosICMS_SAIDA: TIntegerField;
    QEstadosENTRADA: TStringField;
    QEstadosSAIDA: TStringField;
    cxEstadosView1UF: TcxGridDBColumn;
    cxEstadosView1ICMS_ENTRADA: TcxGridDBColumn;
    cxEstadosView1ICMS_SAIDA: TcxGridDBColumn;
    cxEstadosView1ENTRADA: TcxGridDBColumn;
    cxEstadosView1SAIDA: TcxGridDBColumn;
    pnlEstados: TPanel;
    RzDBNavigator2: TRzDBNavigator;
    QICMS: TFDQuery;
    QICMSCOD_ICMS: TIntegerField;
    QICMSCOD_EMP: TIntegerField;
    QICMSDESCRICAO: TStringField;
    QICMSCST: TStringField;
    QICMSICMS: TBCDField;
    QICMSREDUCAO: TBCDField;
    QICMSDIF: TBCDField;
    QICMSMVA: TBCDField;
    dsICMS: TDataSource;
    cxEstadosICMSView: TcxGridDBTableView;
    cxEstadosICMSViewCOD_ICMS: TcxGridDBColumn;
    cxEstadosICMSViewDESCRICAO: TcxGridDBColumn;
    cxEstadosICMSViewCST: TcxGridDBColumn;
    cxEstadosICMSViewICMS: TcxGridDBColumn;
    cxEstadosICMSViewREDUCAO: TcxGridDBColumn;
    cxEstadosICMSViewDIF: TcxGridDBColumn;
    cxEstadosICMSViewMVA: TcxGridDBColumn;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    grpDSCont: TGroupBox;
    GroupBox1: TGroupBox;
    cxPageControl2: TcxPageControl;
    cxTabSheet7: TcxTabSheet;
    cxTabSheet8: TcxTabSheet;
    Panel6: TPanel;
    cxLabel3: TcxLabel;
    QCFOP: TFDQuery;
    QCFOPCOD_CFO: TIntegerField;
    QCFOPNOME_CFO: TStringField;
    QCFOPINF_COMPL_NF: TMemoField;
    QCFOPDESTACA_ICMS: TStringField;
    QCFOPSAIR_REL_RESUMO_ALIQ: TStringField;
    QCFOPTIPO: TStringField;
    QCFOPREGISTRADO_ECF: TStringField;
    QCFOPCALCULA_PIS_COFINS: TStringField;
    QCFOPUSA_CSOSN: TStringField;
    dsCFOP: TDataSource;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    Panel7: TPanel;
    cxLabel4: TcxLabel;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    Panel8: TPanel;
    dbrgrpDENTRO_CONT_CST_IPI: TDBRadioGroup;
    Panel9: TPanel;
    dbrgrpDENTRO_NCONT_CST_IPI: TDBRadioGroup;
    Panel10: TPanel;
    cxLabel5: TcxLabel;
    dbedtDENTRO_CONT_IPI: TDBEdit;
    Panel11: TPanel;
    cxLabel6: TcxLabel;
    dbedtDENTRO_NCONT_IPI: TDBEdit;
    GroupBox2: TGroupBox;
    Panel12: TPanel;
    cxLabel7: TcxLabel;
    cxDBLookupComboBox3: TcxDBLookupComboBox;
    Panel13: TPanel;
    dbrgrpFORA_CONT_CST_IPI: TDBRadioGroup;
    Panel14: TPanel;
    cxLabel8: TcxLabel;
    dbedtFORA_CONT_IPI: TDBEdit;
    GroupBox3: TGroupBox;
    Panel15: TPanel;
    cxLabel9: TcxLabel;
    cxDBLookupComboBox4: TcxDBLookupComboBox;
    Panel16: TPanel;
    dbrgrpFORA_NCONT_CST_IPI: TDBRadioGroup;
    Panel17: TPanel;
    cxLabel10: TcxLabel;
    dbedtFORA_NCONT_IPI: TDBEdit;
    GroupBox4: TGroupBox;
    Panel18: TPanel;
    cxLabel11: TcxLabel;
    cxDBLookupComboBox5: TcxDBLookupComboBox;
    Panel19: TPanel;
    dbrgrpENT_DENTRO_CONT_CST_IPI: TDBRadioGroup;
    Panel20: TPanel;
    cxLabel12: TcxLabel;
    dbedtENT_DENTRO_CONT_IPI: TDBEdit;
    GroupBox5: TGroupBox;
    Panel21: TPanel;
    cxLabel13: TcxLabel;
    cxDBLookupComboBox6: TcxDBLookupComboBox;
    Panel22: TPanel;
    dbrgrpENT_DENTRO_NCONT_CST_IPI: TDBRadioGroup;
    Panel23: TPanel;
    cxLabel14: TcxLabel;
    dbedtENT_DENTRO_NCONT_IPI: TDBEdit;
    GroupBox6: TGroupBox;
    Panel24: TPanel;
    cxLabel15: TcxLabel;
    cxDBLookupComboBox7: TcxDBLookupComboBox;
    Panel25: TPanel;
    dbrgrpENT_FORA_CONT_CST_IPI: TDBRadioGroup;
    Panel26: TPanel;
    cxLabel16: TcxLabel;
    dbedtENT_FORA_CONT_IPI: TDBEdit;
    GroupBox7: TGroupBox;
    Panel27: TPanel;
    cxLabel17: TcxLabel;
    cxDBLookupComboBox8: TcxDBLookupComboBox;
    Panel28: TPanel;
    dbrgrpENT_FORA_NCONT_CST_IPI: TDBRadioGroup;
    Panel29: TPanel;
    cxLabel18: TcxLabel;
    dbedtENT_FORA_NCONT_IPI: TDBEdit;
    cxTabSheet9: TcxTabSheet;
    cxTabSheet10: TcxTabSheet;
    Panel30: TPanel;
    dbchkISENTO_PISCOFINS: TDBCheckBox;
    Panel31: TPanel;
    cxLabel19: TcxLabel;
    JvDBComboBox1: TJvDBComboBox;
    cxLabel20: TcxLabel;
    dbedtPIS: TDBEdit;
    Panel32: TPanel;
    cxLabel21: TcxLabel;
    JvDBComboBox2: TJvDBComboBox;
    cxLabel22: TcxLabel;
    dbedtCOFINS: TDBEdit;
    Panel33: TPanel;
    dbchkENT_ISENTO_PISCOFINS: TDBCheckBox;
    Panel34: TPanel;
    cxLabel23: TcxLabel;
    JvDBComboBox3: TJvDBComboBox;
    cxLabel24: TcxLabel;
    dbedtENT_PIS: TDBEdit;
    Panel35: TPanel;
    cxLabel25: TcxLabel;
    JvDBComboBox4: TJvDBComboBox;
    cxLabel26: TcxLabel;
    dbedtENT_COFINS: TDBEdit;
    QNcmEX: TIntegerField;
    cxGridNCMView1Column1: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure QNcmAfterInsert(DataSet: TDataSet);
    procedure cxTabSheet2Show(Sender: TObject);
    procedure QPrincipalAfterPost(DataSet: TDataSet);
    procedure cxTabSheet3Show(Sender: TObject);
    procedure RzDBNavigator1BeforeAction(Sender: TObject;
      Button: TRzNavigatorButton);
    procedure QNcmAfterPost(DataSet: TDataSet);
    procedure cxVisualizaDBTableView1ORIGEM_PRODGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
    procedure cxTabSheet4Show(Sender: TObject);
    procedure QEstadosAfterInsert(DataSet: TDataSet);
    procedure QEstadosAfterPost(DataSet: TDataSet);
    procedure QPrincipalAfterEdit(DataSet: TDataSet);
    procedure cxDBLookupComboBox1PropertiesPopup(Sender: TObject);
    procedure cxDBLookupComboBox2PropertiesPopup(Sender: TObject);
    procedure cxDBLookupComboBox3PropertiesPopup(Sender: TObject);
    procedure cxDBLookupComboBox4PropertiesPopup(Sender: TObject);
    procedure cxDBLookupComboBox5PropertiesPopup(Sender: TObject);
    procedure cxDBLookupComboBox6PropertiesPopup(Sender: TObject);
    procedure cxDBLookupComboBox7PropertiesPopup(Sender: TObject);
    procedure cxDBLookupComboBox8PropertiesPopup(Sender: TObject);
    procedure cxTabSheet5Show(Sender: TObject);
    procedure cxTabSheet6Show(Sender: TObject);
  private
    { Private declarations }
    procedure AbreNCMS;
    procedure AbreEstados;
    procedure FiltraCFOPS( Num: String );
  public
    { Public declarations }
    procedure FechaQuerys; virtual;
  end;

 function frmCadTributacaoPerfil: TfrmCadTributacaoPerfil;

implementation

{$R *.dfm}

uses UNovoPrincipal, UDM, UConsNCM, UDialog;

function frmCadTributacaoPerfil: TfrmCadTributacaoPerfil;
begin
   Result := TfrmCadTributacaoPerfil( BuscaFormulario( TfrmCadTributacaoPerfil, False ) );
end;

procedure TfrmCadTributacaoPerfil.AbreEstados;
begin
  FechaQuerys;
  QEstados.Close;
  QEstados.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
  QEstados.ParamByName( 'COD_PERFIL' ).AsInteger := QPrincipalCOD_PERFIL.AsInteger;
  QEstados.Open;
  QICMS.Close;
  QICMS.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
  QICMS.Open;
  QCFOP.Close;
  QCFOP.Open;
end;

procedure TfrmCadTributacaoPerfil.AbreNCMS;
begin
  FechaQuerys;
  QNcm.Close;
  QNcm.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
  QNcm.ParamByName( 'COD_PERFIL' ).AsInteger := QPrincipalCOD_PERFIL.AsInteger;
  QNcm.Open;
  cxPaginas2.ActivePageIndex := 0;
  QCFOP.Close;
  QCFOP.Open;
end;

procedure TfrmCadTributacaoPerfil.BtnNovoClick(Sender: TObject);
begin
  inherited;
  if dsPrincipal.State = dsInsert then
     QPrincipalCOD_EMP.AsInteger := iEmp;
end;

procedure TfrmCadTributacaoPerfil.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  QPrincipal.Close;
  QPrincipal.SQL.Text := Sql;
  if ( VarToStr( Filtro.ValorFiltro ) <> '' ) and
     ( VarToStr( Filtro.ValorFiltro ) <> '0' ) then
     begin
        QPrincipal.SQL.Add( 'AND ' + Filtro.FieldName + ' LIKE :FILTRO'  );
        QPrincipal.ParamByName( 'FILTRO' ).AsString := VarToStr( Filtro.ValorFiltro ) + '%';
     end;
  QPrincipal.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
  QPrincipal.Open;
end;

procedure TfrmCadTributacaoPerfil.cxDBLookupComboBox1PropertiesPopup(
  Sender: TObject);
begin
  inherited;
  FiltraCFOPS( '5' );
end;

procedure TfrmCadTributacaoPerfil.cxDBLookupComboBox2PropertiesPopup(
  Sender: TObject);
begin
  inherited;
  FiltraCFOPS( '5' );
end;

procedure TfrmCadTributacaoPerfil.cxDBLookupComboBox3PropertiesPopup(
  Sender: TObject);
begin
  inherited;
  FiltraCFOPS( '6' );
end;

procedure TfrmCadTributacaoPerfil.cxDBLookupComboBox4PropertiesPopup(
  Sender: TObject);
begin
  inherited;
  FiltraCFOPS( '6' );
end;

procedure TfrmCadTributacaoPerfil.cxDBLookupComboBox5PropertiesPopup(
  Sender: TObject);
begin
  inherited;
  FiltraCFOPS( '1' );
end;

procedure TfrmCadTributacaoPerfil.cxDBLookupComboBox6PropertiesPopup(
  Sender: TObject);
begin
  inherited;
  FiltraCFOPS( '1' );
end;

procedure TfrmCadTributacaoPerfil.cxDBLookupComboBox7PropertiesPopup(
  Sender: TObject);
begin
  inherited;
  FiltraCFOPS( '2' );
end;

procedure TfrmCadTributacaoPerfil.cxDBLookupComboBox8PropertiesPopup(
  Sender: TObject);
begin
  inherited;
  FiltraCFOPS( '2' );
end;

procedure TfrmCadTributacaoPerfil.cxTabSheet2Show(Sender: TObject);
begin
  inherited;
  AbreNCMS;
end;

procedure TfrmCadTributacaoPerfil.cxTabSheet3Show(Sender: TObject);
begin
  inherited;
   AbreNCMS;
end;

procedure TfrmCadTributacaoPerfil.cxTabSheet4Show(Sender: TObject);
begin
  inherited;
   AbreEstados;
end;

procedure TfrmCadTributacaoPerfil.cxTabSheet5Show(Sender: TObject);
begin
  inherited;
  QCFOP.Close;
  QCFOP.Open;
end;

procedure TfrmCadTributacaoPerfil.cxTabSheet6Show(Sender: TObject);
begin
  inherited;
  QCFOP.Close;
  QCFOP.Open;
end;

procedure TfrmCadTributacaoPerfil.cxVisualizaDBTableView1ORIGEM_PRODGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
begin
  inherited;
  case IndexStr( AText, ['0', '1'] ) of
      0: AText := '0 - Nacional';
      1: AText := '0 - Importado';
  end;
end;

procedure TfrmCadTributacaoPerfil.FechaQuerys;
begin
  inherited;
  QCFOP.Close;
  QCFOP.Open;
end;

procedure TfrmCadTributacaoPerfil.FiltraCFOPS(Num: String);
begin
  QCFOP.Filtered := False;
  QCFOP.Filter := 'COD_CFO >= ' + Num + '000 AND COD_CFO <= ' + Num + '999';
  QCFOP.Filtered := True;
end;

procedure TfrmCadTributacaoPerfil.FormShow(Sender: TObject);
begin
  inherited;
  if TRPrincipal.Active then
     TRPrincipal.Commit;
  TRPrincipal.StartTransaction;
  QPrincipal.Close;
  QPrincipal.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
  QPrincipal.Open;
end;

procedure TfrmCadTributacaoPerfil.QEstadosAfterInsert(DataSet: TDataSet);
begin
  inherited;
  QEstadosCOD_PERFIL.AsInteger := QPrincipalCOD_PERFIL.AsInteger;
  QEstadosCOD_EMP.AsInteger := iEmp;
end;

procedure TfrmCadTributacaoPerfil.QEstadosAfterPost(DataSet: TDataSet);
begin
  inherited;
  QEstados.RefreshRecord();

end;

procedure TfrmCadTributacaoPerfil.QNcmAfterInsert(DataSet: TDataSet);
var
   FormCons: TfrmConsNCM;
   Result: TModalResult;
begin
  inherited;
   if QPrincipalCOD_PERFIL.IsNull then
      QNcm.Cancel;
   QNcmCOD_PERFIL.AsInteger := QPrincipalCOD_PERFIL.AsInteger;
   QNcmCOD_EMP.AsInteger := iEmp;
   Application.CreateForm( TfrmConsNCM, FormCons );
   try
      Result := FormCons.ShowModal;
      Result := FormCons.ModalResult;
      if Result <> mrOk then
         begin
            QNcm.Cancel;
            Exit;
         end;
      QNcmNCM.AsInteger := FormCons.QNCMNCM.AsInteger;
      QNcmEX.AsInteger := FormCons.QNCMEX.AsInteger;
      QNcm.Post;
   finally
      FormCons.Free;
   end;
end;

procedure TfrmCadTributacaoPerfil.QNcmAfterPost(DataSet: TDataSet);
begin
  inherited;
  QNcm.RefreshRecord();

end;

procedure TfrmCadTributacaoPerfil.QPrincipalAfterEdit(DataSet: TDataSet);
begin
  inherited;
  QCFOP.Close;
  QCFOP.Open;
end;

procedure TfrmCadTributacaoPerfil.QPrincipalAfterPost(DataSet: TDataSet);
begin
  inherited;
  AbreNCMS;
end;

procedure TfrmCadTributacaoPerfil.RzDBNavigator1BeforeAction(Sender: TObject;
  Button: TRzNavigatorButton);
begin
  inherited;
  if Button = nbDelete then
     begin
        if not KDialog( 'Tem certeza que deseja excluir este Registro?', 'Exclusão', tdtPergunta )  then
           begin
              Abort;
              Exit;
           end;
     end;
end;

end.
