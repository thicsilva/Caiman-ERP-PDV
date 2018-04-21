unit UCadNewFormas;

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
  cxClasses, Vcl.ImgList, Vcl.StdCtrls, Vcl.ExtCtrls, cxButtons, Vcl.Mask,
  Vcl.ComCtrls, cxTextEdit, cxCurrencyEdit, cxLabel, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC, Vcl.ToolWin, System.StrUtils, Vcl.DBCtrls, RxDBComb, Data.SqlExpr,
  cxMaskEdit, cxButtonEdit, cxDBEdit;

type
  TcxViewInfoAcess = class(TcxGridTableDataCellViewInfo);
  TcxPainterAccess = class(TcxGridTableDataCellPainter);
  TfrmCadNewFormas = class(TfrmCadNovoDB)
    QPrincipalCODIGO: TIntegerField;
    QPrincipalDESCRICAO: TStringField;
    QPrincipalUSA_TEF: TStringField;
    QPrincipalABRE_GAVETA: TStringField;
    QPrincipalUSAR_CONTAS_RECEBER: TStringField;
    QPrincipalUSAR_CONTAS_PAGAR: TStringField;
    QPrincipalTIPO: TStringField;
    QPrincipalTABELA_PRECO: TIntegerField;
    QPrincipalCONCEDER_DESCONTO: TStringField;
    QPrincipalCODIGO_CONTA_VENDAS: TIntegerField;
    QPrincipalCODIGO_CENTRO_CUSTO_VENDAS: TIntegerField;
    QPrincipalUSAR_PAF_ECF: TStringField;
    QPrincipalCODIGO_CONTA_CTR: TIntegerField;
    QPrincipalCODIGO_CENTRO_CUSTO_CTR: TIntegerField;
    QPrincipalCODIGO_CONTA_CTP: TIntegerField;
    QPrincipalCODIGO_CONTA_CTR_ESTORNO: TIntegerField;
    QPrincipalCODIGO_CENTRO_CUSTO_CTR_ESTORNO: TIntegerField;
    QPrincipalCODIGO_CONTA_CTP_ESTORNO: TIntegerField;
    QPrincipalCODIGO_CENTRO_CUSTO_CTP_ESTORNO: TIntegerField;
    QPrincipalCODIGO_CONTA_VEN_ESTORNO: TIntegerField;
    QPrincipalCODIGO_CENTRO_CUSTO_VEN_ESTORNO: TIntegerField;
    upPrincipal: TFDUpdateSQL;
    cxVisualizaDBTableView1CODIGO: TcxGridDBColumn;
    cxVisualizaDBTableView1DESCRICAO: TcxGridDBColumn;
    cxPaginas2: TcxPageControl;
    cxPageGeral: TcxTabSheet;
    cxGridImg: TcxImageList;
    cxVisualizaDBTableView1TIPO: TcxGridDBColumn;
    cxVisualizaDBTableView1TIPO2: TcxGridDBColumn;
    pnl1: TPanel;
    cxLabel1: TcxLabel;
    dbedtCODIGO: TDBEdit;
    pnl2: TPanel;
    cxLabel2: TcxLabel;
    dbedtDESCRICAO: TDBEdit;
    Panel3: TPanel;
    cxLabel3: TcxLabel;
    cbbTIPO: TRxDBComboBox;
    Panel4: TPanel;
    cxLabel4: TcxLabel;
    cbbTABELA_PRECO: TRxDBComboBox;
    Panel5: TPanel;
    grpOpcoes: TGroupBox;
    dbchkUSA_TEF: TDBCheckBox;
    dbchkABRE_GAVETA: TDBCheckBox;
    dbchkUSAR_PAF_ECF: TDBCheckBox;
    dbchkUSAR_CONTAS_RECEBER: TDBCheckBox;
    dbchkUSAR_CONTAS_PAGAR: TDBCheckBox;
    dbchkCONCEDER_DESCONTO: TDBCheckBox;
    cxPageFluxo: TcxTabSheet;
    QHistoricos: TFDQuery;
    upHistoricos: TFDUpdateSQL;
    dsHistoricos: TDataSource;
    cxImgButtons: TcxImageList;
    Panel34: TPanel;
    Panel35: TPanel;
    GroupBox8: TGroupBox;
    cxLabel36: TcxLabel;
    DBbFLUXO_RECEBER_CHAVE: TcxDBButtonEdit;
    dbchkFLUXO_RECEBER: TDBCheckBox;
    Panel36: TPanel;
    GroupBox9: TGroupBox;
    Panel6: TPanel;
    cxLabel38: TcxLabel;
    DBbFLUXO_PAGAR_CHAVE: TcxDBButtonEdit;
    dbchkFLUXO_PAGAR: TDBCheckBox;
    Panel7: TPanel;
    Panel8: TPanel;
    GroupBox1: TGroupBox;
    cxLabel5: TcxLabel;
    DBbFLUXO_VENDAS_CHAVE: TcxDBButtonEdit;
    dbchkFLUXO_VENDAS: TDBCheckBox;
    QHistoricosCOD_EMP: TIntegerField;
    QHistoricosCOD_FORMA: TIntegerField;
    QHistoricosFLUXO_VENDAS: TStringField;
    QHistoricosFLUXO_VENDAS_CHAVE: TStringField;
    QHistoricosFLUXO_RECEBER: TStringField;
    QHistoricosFLUXO_RECEBER_CHAVE: TStringField;
    QHistoricosFLUXO_PAGAR: TStringField;
    QHistoricosFLUXO_PAGAR_CHAVE: TStringField;
    procedure cxVisualizaDBTableView1TIPOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxVisualizaDBTableView1TIPOGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
    procedure QHistoricosAfterInsert(DataSet: TDataSet);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure dsPrincipalStateChange(Sender: TObject);
    procedure cxPageFluxoShow(Sender: TObject);
    procedure cxPageGeralShow(Sender: TObject);
    procedure FluxosPlanos(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxPaginasChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MostraFormas;
  end;

 function frmCadNewFormas: TfrmCadNewFormas;

implementation

{$R *.dfm}

uses UNovoPrincipal, UDM, UBuscaPlano, UNewCaixaGrupos;

function frmCadNewFormas: TfrmCadNewFormas;
begin
   Result := TfrmCadNewFormas( BuscaFormulario( TfrmCadNewFormas, False  ) );
end;

procedure TfrmCadNewFormas.BtnCancelarClick(Sender: TObject);
begin
  if ( QHistoricos.State in [ dsInsert, dsEdit ] ) then
     begin
        QHistoricos.Cancel;
     end;
  inherited;

end;

procedure TfrmCadNewFormas.BtnGravarClick(Sender: TObject);
begin
  if ( QHistoricos.State in [ dsInsert, dsEdit ] ) then
     begin
        QHistoricos.Post;
     end;
  inherited;
end;

procedure TfrmCadNewFormas.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  MostraFormas;
end;

procedure TfrmCadNewFormas.cxPageFluxoShow(Sender: TObject);
begin
  inherited;
  QHistoricos.Close;
  if QPrincipalCODIGO.AsInteger = 0 then
     Exit;
  QHistoricos.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
  QHistoricos.ParamByName( 'COD_FORMA' ).AsInteger := QPrincipalCODIGO.AsInteger;
  QHistoricos.Open;
end;

procedure TfrmCadNewFormas.cxPageGeralShow(Sender: TObject);
begin
  inherited;
  FechaQuerys;
end;

procedure TfrmCadNewFormas.cxPaginasChange(Sender: TObject);
begin
  inherited;
  cxPaginas2.ActivePageIndex := 0;
end;

procedure TfrmCadNewFormas.cxVisualizaDBTableView1TIPOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  APainter: TcxPainterAccess;
  PosAtu: Integer;
  iImg: Integer;
const
  ImgForma : array[0..9] of string = ( 'DN', 'PR', 'CC', 'CA', 'BO', 'TI', 'CH', 'TR', 'TV', 'CV' );
  iImgForma : array[0..9] of Integer = ( 4, 11, 6, 12, 7, 8, 6, 1, 3, 8 );
begin
  if not (AViewInfo.EditViewInfo is TcxCustomTextEditViewInfo) then
      Exit;
  APainter := TcxPainterAccess(TcxViewInfoAcess(AViewInfo).GetPainterClass.Create(ACanvas, AViewInfo));
  with APainter do
  begin
    try
      if AViewInfo.GridRecord.Values[cxVisualizaDBTableView1TIPO2.Index] = null then
         Exit;
      with TcxCustomTextEditViewInfo(AViewInfo.EditViewInfo).TextRect do
         Left := Left + ( cxGridImg.Width  )  + 6;
      with AViewInfo.ClientBounds do
        PosAtu :=  Left + 3;
      DrawContent;
      DrawBorders;
      iImg := iImgForma[
          IndexStr( ViewInfo.GridRecord.Values[cxVisualizaDBTableView1TIPO2.Index], ImgForma )
         ];
      with AViewInfo.ClientBounds do
         begin
            cxGridImg.Draw(ACanvas.Canvas, PosAtu, Top + 1, iImg  );
         end;
    finally
      Free;
    end;
  end;
  ADone := True;

end;

procedure TfrmCadNewFormas.cxVisualizaDBTableView1TIPOGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
const
  ImgForma : array[0..9] of string = ( 'DN', 'PR', 'CC', 'CA',
     'BO', 'TI', 'CH', 'TR', 'TV', 'CV' );
  iImgForma : array[0..9] of string = ( 'Dinheiro', 'Promissória', 'Consulta Cheque', 'Cartão',
     'Boleto', 'Ticket', 'Cheque', 'Troco', 'Troco Vale', 'Conta Vale' );
begin
  inherited;
  AText := iImgForma[ IndexStr( AText, ImgForma ) ];
end;

procedure TfrmCadNewFormas.dsPrincipalStateChange(Sender: TObject);
begin
  inherited;
  cxPageFluxo.Enabled := QPrincipal.State = dsEdit;
end;

procedure TfrmCadNewFormas.FluxosPlanos(Sender: TObject; AButtonIndex: Integer);
var
  Str: String;
begin
  inherited;
  if AButtonIndex = 0 then
     begin
          if not ( QHistoricos.State in [ dsInsert, dsEdit ] ) then
             QHistoricos.Edit;
          Str := SelecionarPlanoContas.Codigo;
          if Str = '' then
             Exit;
          QHistoricos.FieldByName( TcxDBButtonEdit( Sender ).
           DataBinding.DataField ).AsString := Str;
          Exit;
     end;
  BuscaFormulario( TfrmNewCaixaGrupos, True );
end;


procedure TfrmCadNewFormas.FormCreate(Sender: TObject);
begin
  inherited;
  CodigoTela := 'C236';
end;

procedure TfrmCadNewFormas.FormShow(Sender: TObject);
begin
  inherited;
  MostraFormas;
  cxVisualizaDBTableView1TIPO.Index := 0;
end;

procedure TfrmCadNewFormas.MostraFormas;
begin
   QPrincipal.Close;
   QPrincipal.SQL.Text := Sql;
   if ( VarToStr( Filtro.ValorFiltro ) <> '' ) and
     ( VarToStr( Filtro.ValorFiltro ) <> '0' ) then
     begin
        QPrincipal.SQL.Add( 'WHERE');
        QPrincipal.SQL.Add( Filtro.FieldName + ' LIKE :FILTRO'  );
        QPrincipal.ParamByName( 'FILTRO' ).AsString := VarToStr( Filtro.ValorFiltro ) + '%';
     end;
   QPrincipal.Open;
end;

procedure TfrmCadNewFormas.QHistoricosAfterInsert(DataSet: TDataSet);
begin
  inherited;
  QHistoricosCOD_EMP.AsInteger := iEmp;
  QHistoricosCOD_FORMA.AsInteger := QPrincipalCODIGO.AsInteger;
end;

end.
