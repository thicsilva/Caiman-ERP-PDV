unit UNewCaixaMovimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinMetropolis, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.ExtCtrls, Vcl.ImgList,
  cxTextEdit, System.StrUtils, cxPC,
  Vcl.ComCtrls, Vcl.ToolWin, cxContainer, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  cxLabel, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, UNovosComponentes, UNovoFormulario, System.ImageList,
  JvExControls, JvDBLookup, Vcl.Buttons, sSpeedButton;

type
  TcxViewInfoAcess = class(TcxGridTableDataCellViewInfo);
  TcxPainterAccess = class(TcxGridTableDataCellPainter);
  TfrmNewCaixaMovimentos = class(TForm)
    cxGridMov: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    QMovimentos: TFDQuery;
    dsMovimentos: TDataSource;
    TRMovimentos: TFDTransaction;
    cxGridMovDATA_HORA: TcxGridDBColumn;
    cxGridMovDESCRICAO: TcxGridDBColumn;
    cxGridMovPLANO_CONTAS: TcxGridDBColumn;
    cxGridMovVALOR: TcxGridDBColumn;
    cxGridMovPLANO_DESCRICAO: TcxGridDBColumn;
    cxGridMovFORMA_DESCRICAO: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxstylPadrao: TcxStyle;
    cxstylOdd: TcxStyle;
    cxstylHeader: TcxStyle;
    cxstylHeaderBold: TcxStyle;
    cxstylInactive: TcxStyle;
    cxstylVermelho: TcxStyle;
    shp1: TShape;
    cxGridMovSTATUS: TcxGridDBColumn;
    cxGridImg: TcxImageList;
    QMovimentosSTATUS: TStringField;
    cxGridMovPLANO_TIPO: TcxGridDBColumn;
    cxGridMovPLANO_OP_SALDO: TcxGridDBColumn;
    cxGridMovFORMA_TIPO: TcxGridDBColumn;
    QMovimentosSALDO_REAL: TCurrencyField;
    cxGridMovSALDO_REAL: TcxGridDBColumn;
    BarraMenu: TcxImageList;
    ToolBar1: TToolBar;
    BtnNovo: TToolButton;
    BtnGravar: TToolButton;
    BtnCancelar: TToolButton;
    BtnAlterar: TToolButton;
    BtnExcluir: TToolButton;
    ToolButton1: TToolButton;
    BtnSair: TToolButton;
    pnlEdit: TPanel;
    Panel2: TPanel;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    upMovimentos: TFDUpdateSQL;
    QMovimentosCOD_MOV: TIntegerField;
    QMovimentosCOD_EMP: TIntegerField;
    QMovimentosCOD_CAI: TIntegerField;
    QMovimentosCOD_USU: TIntegerField;
    QMovimentosDATA_HORA: TSQLTimeStampField;
    QMovimentosDESCRICAO: TStringField;
    QMovimentosMODULO: TStringField;
    QMovimentosDOCUMENTO: TStringField;
    QMovimentosPLANO_CONTAS: TStringField;
    QMovimentosCOD_FORMA: TIntegerField;
    QMovimentosVALOR: TBCDField;
    QMovimentosCANCELADO: TIntegerField;
    QMovimentosSUB_MODULO: TStringField;
    QMovimentosCOD: TIntegerField;
    QMovimentosPLANO_DESCRICAO: TStringField;
    QMovimentosPLANO_TIPO: TStringField;
    QMovimentosPLANO_OP_SALDO: TStringField;
    QMovimentosPLANO_OP_HIST_FECHA: TStringField;
    QMovimentosPLANO_OP_HIST_INFO: TStringField;
    QMovimentosPLANO_OP_HIST_COMP: TStringField;
    QMovimentosFORMA_DESCRICAO: TStringField;
    QMovimentosFORMA_TIPO: TStringField;
    cxLabel2: TcxLabel;
    dbedtDESCRICAO: TDBEdit;
    cxLabel1: TcxLabel;
    dbedtVALOR: TDBEdit;
    QFormas: TFDQuery;
    QFormasCODIGO: TIntegerField;
    QFormasDESCRICAO: TStringField;
    QFormasUSA_TEF: TStringField;
    QFormasABRE_GAVETA: TStringField;
    QFormasUSAR_CONTAS_RECEBER: TStringField;
    QFormasUSAR_CONTAS_PAGAR: TStringField;
    QFormasTIPO: TStringField;
    QFormasTABELA_PRECO: TIntegerField;
    QFormasCONCEDER_DESCONTO: TStringField;
    QFormasCODIGO_CONTA_VENDAS: TIntegerField;
    QFormasCODIGO_CENTRO_CUSTO_VENDAS: TIntegerField;
    QFormasUSAR_PAF_ECF: TStringField;
    QFormasCODIGO_CONTA_CTR: TIntegerField;
    QFormasCODIGO_CENTRO_CUSTO_CTR: TIntegerField;
    QFormasCODIGO_CONTA_CTP: TIntegerField;
    QFormasCODIGO_CONTA_CTR_ESTORNO: TIntegerField;
    QFormasCODIGO_CENTRO_CUSTO_CTR_ESTORNO: TIntegerField;
    QFormasCODIGO_CONTA_CTP_ESTORNO: TIntegerField;
    QFormasCODIGO_CENTRO_CUSTO_CTP_ESTORNO: TIntegerField;
    QFormasCODIGO_CONTA_VEN_ESTORNO: TIntegerField;
    QFormasCODIGO_CENTRO_CUSTO_VEN_ESTORNO: TIntegerField;
    dsFormas: TDataSource;
    cxLabel3: TcxLabel;
    cxDBCOD_FORMA: TcxDBLookupComboBox;
    Panel3: TPanel;
    cxLabel4: TcxLabel;
    dbedtPLANO_CONTAS: TDBEdit;
    Shape1: TShape;
    edtDescricao: TEdit;
    cxGridMovCANCELADO: TcxGridDBColumn;
    cxStyleCancelado: TcxStyle;
    cxGridMovPLANO_OP_HIST_INFO: TcxGridDBColumn;
    cxGridMovPLANO_OP_SALDO2: TcxGridDBColumn;
    btnAtualizar: TToolButton;
    cxGridMovDOCUMENTO: TcxGridDBColumn;
    cxStyleSemSaldo: TcxStyle;
    cxStyleGrupos: TcxStyle;
    Panel1: TPanel;
    qCaixa: TFDQuery;
    qCaixaCOD_CAI: TIntegerField;
    qCaixaDESC_CAI: TStringField;
    cxLabel5: TcxLabel;
    dsCaixa: TDataSource;
    dbCaixa: TJvDBLookupCombo;
    BtnConsCliFor: TsSpeedButton;
    qABCaixa: TFDQuery;
    qABCaixaCODIGO: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxGridMovSTATUSCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure QMovimentosCalcFields(DataSet: TDataSet);
    procedure BtnSairClick(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure dsMovimentosStateChange(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure cxGridMovStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure BtnCancelarClick(Sender: TObject);
    procedure cxGridMovPLANO_OP_HIST_INFOGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
    procedure cxGridMovPLANO_OP_SALDO2GetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
    procedure btnAtualizarClick(Sender: TObject);
    procedure cxGridMovDOCUMENTOGetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: string);
    procedure BtnConsCliForClick(Sender: TObject);
  private
     LockPnl: TObject;
     EditProg: Boolean;
    { Private declarations }
    procedure MostrarMovimentos;
    procedure cxVisualizaDBTableView1ColumnPosChanged(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure cxVisualizaDBTableView1ColumnSizeChanged(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure cxVisualizaDBTableView1Customization(Sender: TObject);
    procedure TodosEventos;
  public
    { Public declarations }
  end;

 function frmNewCaixaMovimentos: TfrmNewCaixaMovimentos;

implementation

{$R *.dfm}

uses UNovoPrincipal, UDM, UDicFluxo, UDicLib, UBuscaPlano, UDialog;

function frmNewCaixaMovimentos: TfrmNewCaixaMovimentos;
begin
   Result := TfrmNewCaixaMovimentos( BuscaFormulario( TfrmNewCaixaMovimentos, False ) );
end;

{ TfrmNewCaixaMovimentos }

procedure TfrmNewCaixaMovimentos.btnAtualizarClick(Sender: TObject);
begin
   QMovimentos.Refresh;
end;

procedure TfrmNewCaixaMovimentos.BtnCancelarClick(Sender: TObject);
begin
   EditProg := True;
   try
       if QMovimentosDOCUMENTO.AsString <> '' then
          begin
             AlertaCad( 'Movimento não pode ser cancelado', alertErro, 'Caixa' );
             Exit;
          end;
       if QMovimentosCOD_USU.AsInteger <> iCodUsu then
          begin
             AlertaCad( 'Movimento não pode ser cancelado por você', alertErro, 'Caixa' );
             Exit;
          end;
       if QMovimentosCANCELADO.AsInteger = 1 then
        if KDialog( 'Tem certeza que deseja habilitar este movimento?',
           'Movimento de Caixa', tdtPergunta ) then
           begin
              QMovimentos.Edit;
              QMovimentosCANCELADO.AsInteger := 0;
              QMovimentos.Post;
              TRMovimentos.CommitRetaining;
              QMovimentos.Refresh;
              Exit;
           end;
       if QMovimentosCANCELADO.AsInteger = 0 then
        if KDialog( 'Tem certeza que deseja cancelar este movimento?',
           'Movimento de Caixa', tdtPergunta ) then
           begin
              QMovimentos.Edit;
              QMovimentosCANCELADO.AsInteger := 1;
              QMovimentos.Post;
              TRMovimentos.CommitRetaining;
              QMovimentos.Refresh;
              Exit;
           end;
   finally
      EditProg := False;
   end;
end;

procedure TfrmNewCaixaMovimentos.BtnConsCliForClick(Sender: TObject);
begin
  MostrarMovimentos;
end;

procedure TfrmNewCaixaMovimentos.BtnNovoClick(Sender: TObject);
var
  RetPlano: TRetPlano;
begin
   edtDescricao.Clear;
   QMovimentos.Insert;
   if not ( QMovimentos.State = dsInsert ) then
      Exit;
   QMovimentosCOD_MOV.AsInteger := DicFluxo.CodMovimentos;
   QMovimentosCOD_CAI.AsInteger := DicFluxo.CodCaixa;
   QMovimentosCOD_EMP.AsInteger := DicFluxo.CodEmp;
   QMovimentosCOD_USU.AsInteger := DicFluxo.CodUsuario;
   QMovimentosCANCELADO.AsInteger := 0;
   RetPlano := SelecionarPlanoContas;
   QMovimentosPLANO_CONTAS.AsString := RetPlano.Codigo;
   edtDescricao.Text := RetPlano.Descricao + ' -> ' + RetPlano.Tipo;
   QMovimentosMODULO.AsString := 'FLUXO_MOVIMENTOS';
   if QMovimentosPLANO_CONTAS.AsString = '' then
      QMovimentos.Cancel;
   cxDBCOD_FORMA.Text := 'DINHEIRO';
   dbedtDESCRICAO.SetFocus;
end;

procedure TfrmNewCaixaMovimentos.BtnSairClick(Sender: TObject);
begin
   if Parent is TcxTabSheet then
      frmMenu.FTDI.CloseTabOfForm( TFormClass( Self.ClassType ) )
   else
      close;
end;

procedure TfrmNewCaixaMovimentos.cxGridMovDOCUMENTOGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
begin
   if AText = '' then
      AText := 'Outros Movimentos';
end;

procedure TfrmNewCaixaMovimentos.cxGridMovPLANO_OP_HIST_INFOGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
begin
   AText := IfThen( AText = 'S', 'Sim', 'Não'  );
end;

procedure TfrmNewCaixaMovimentos.cxGridMovPLANO_OP_SALDO2GetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
begin
   AText := IfThen( AText = 'S', 'Sim', 'Não'  );
end;

procedure TfrmNewCaixaMovimentos.cxGridMovSTATUSCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  APainter: TcxPainterAccess;
  PosAtu: Integer;
  iImg: Integer;
const
  ImgForma : array[0..7] of string = ( 'DN', 'PR', 'CC', 'CA', 'BO', 'TI', 'CH', 'TR' );
  iImgForma : array[0..7] of Integer = ( 4, 11, 6, 12, 7, 8, 6, 4 );
  iImgFormaCinza : array[0..7] of Integer = ( 13, 19, 16, 14, 17, 18, 16, 13 );
begin
  if not (AViewInfo.EditViewInfo is TcxCustomTextEditViewInfo) then
      Exit;
  APainter := TcxPainterAccess(TcxViewInfoAcess(AViewInfo).GetPainterClass.Create(ACanvas, AViewInfo));
  with APainter do
  begin
    try
      if AViewInfo.GridRecord.Values[cxGridMovPLANO_TIPO.Index] = null then
         Exit;
      with TcxCustomTextEditViewInfo(AViewInfo.EditViewInfo).TextRect do
            Left := Left + ( cxGridImg.Width * 2 ) + 6;
      with AViewInfo.ClientBounds do
        PosAtu :=  Left + 3;
      DrawContent;
      DrawBorders;

      if AViewInfo.GridRecord.Values[cxGridMovPLANO_TIPO.Index] = 'C' then
        begin
          if ( AViewInfo.GridRecord.Values[cxGridMovPLANO_OP_SALDO.Index] = 'S' )
          and ( ViewInfo.GridRecord.Values[cxGridMovCANCELADO.Index] <> '1'  )  then
            with AViewInfo.ClientBounds do
               cxGridImg.Draw(ACanvas.Canvas, PosAtu, Top + 1, 0)
          else
            with AViewInfo.ClientBounds do
               cxGridImg.Draw(ACanvas.Canvas, PosAtu, Top + 1, 2)
        end
      else
      if  AViewInfo.GridRecord.Values[cxGridMovPLANO_TIPO.Index] = 'D' then
        begin
          if ( AViewInfo.GridRecord.Values[cxGridMovPLANO_OP_SALDO.Index] = 'S' )
          and ( ViewInfo.GridRecord.Values[cxGridMovCANCELADO.Index] <> '1'  )  then
            with AViewInfo.ClientBounds do
               cxGridImg.Draw(ACanvas.Canvas,PosAtu, Top + 1, 1)
          else
            with AViewInfo.ClientBounds do
               cxGridImg.Draw(ACanvas.Canvas, PosAtu, Top + 1, 3)
        end;
      PosAtu := PosAtu + 16 + 3;
      if ViewInfo.GridRecord.Values[cxGridMovCANCELADO.Index] = '1' then
         iImg := iImgFormaCinza[
           IndexStr( ViewInfo.GridRecord.Values[cxGridMovFORMA_TIPO.Index], ImgForma )
          ]
      else
        iImg := iImgForma[
          IndexStr( ViewInfo.GridRecord.Values[cxGridMovFORMA_TIPO.Index], ImgForma )
         ];
      with AViewInfo.ClientBounds do
         cxGridImg.Draw(ACanvas.Canvas, PosAtu, Top + 1, iImg  );
    finally
      Free;
    end;
  end;
  ADone := True;

end;


procedure TfrmNewCaixaMovimentos.cxGridMovStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
   if ARecord.Values[cxGridMovCANCELADO.Index] = null then
      Exit;
   if ARecord.Values[cxGridMovCANCELADO.Index] = '1' then
      AStyle := cxStyleCancelado;
   if ARecord.Values[cxGridMovPLANO_OP_SALDO.Index] <> 'S' then
      AStyle := cxStyleSemSaldo;
end;

procedure TfrmNewCaixaMovimentos.cxVisualizaDBTableView1ColumnPosChanged(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
   if Sender <> nil then
   if Sender is TcxGridDBTableView then
      TDicLib.GravarGridDB( iCodUsu, TcxGridDBTableView( Sender ), Self,  dm.IBDatabase);
end;

procedure TfrmNewCaixaMovimentos.cxVisualizaDBTableView1ColumnSizeChanged(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
   if Sender <> nil then
   if Sender is TcxGridDBTableView then
      TDicLib.GravarGridDB( iCodUsu, TcxGridDBTableView( Sender ), Self,  dm.IBDatabase);
end;

procedure TfrmNewCaixaMovimentos.cxVisualizaDBTableView1Customization(
  Sender: TObject);
begin
   if Sender <> nil then
   if Sender is TcxGridDBTableView then
      TDicLib.GravarGridDB( iCodUsu, TcxGridDBTableView( Sender ), Self,  dm.IBDatabase);
end;

procedure TfrmNewCaixaMovimentos.dsMovimentosStateChange(Sender: TObject);
begin
   BtnNovo.Enabled := not ( QMovimentos.State in [ dsEdit, dsInsert ] );
   BtnCancelar.Enabled := QMovimentos.State = dsBrowse;
   cxGridMov.OptionsView.Footer := not ( QMovimentos.State in [ dsEdit, dsInsert ] );
   if EditProg then
      Exit;
   if ( QMovimentos.State in [ dsEdit, dsInsert ] )
     and ( pnlEdit.Height = 5 ) then
      TDicAnimacao.AnimarPropriedade( pnlEdit, 'Height', 118, 15, 10, LockPnl )
   else
     if ( pnlEdit.Height = 118 ) and
     (  not ( QMovimentos.State in [ dsEdit, dsInsert ] ) ) then
      TDicAnimacao.AnimarPropriedade( pnlEdit, 'Height', 5, 15, 10, LockPnl );
end;

procedure TfrmNewCaixaMovimentos.FormCreate(Sender: TObject);
begin
   LockPnl := TObject.Create;
   EditProg := False;
   pnlEdit.Height := 5;
   TodosEventos;
   TDicLib.MontaTelaUsu( iCodUsu, Self, DM.IBDatabase );
   qCaixa.Close;
   qCaixa.Params[0].AsInteger := iEmp;
   qCaixa.Open;
   MostrarMovimentos;
end;

procedure TfrmNewCaixaMovimentos.FormDestroy(Sender: TObject);
begin
   QFormas.Close;
   QMovimentos.Close;
   if TRMovimentos.Active then
      TRMovimentos.Commit;
   FreeAndNil( LockPnl );
end;

procedure TfrmNewCaixaMovimentos.MostrarMovimentos;
var CodCaixa, CodMov : Integer;
begin
  if dbCaixa.Text <> dbCaixa.DisplayEmpty then
    begin
      CodCaixa := dbCaixa.KeyValue;
      qABCaixa.Close;
      qABCaixa.Params[0].AsInteger := iEmp;
      qABCaixa.Params[1].AsInteger := CodCaixa;
      qABCaixa.Open;
    end
  else
    begin
      CodCaixa := 0;
      CodMov := 0;
    end;
//   cxGridMovSTATUS.Index := 0;
   if TRMovimentos.Active then
      TRMovimentos.Commit;
   TRMovimentos.StartTransaction;
   QFormas.Close;
   QFormas.Open();
   QMovimentos.Close;
   QMovimentos.ParamByName( 'cod_emp' ).AsInteger := DicFluxo.CodEmp;
   QMovimentos.ParamByName( 'cod_cai' ).AsInteger := CodCaixa;
   QMovimentos.ParamByName( 'cod_mov' ).AsInteger := qABCaixaCODIGO.AsInteger;
   QMovimentos.Open();
end;

procedure TfrmNewCaixaMovimentos.QMovimentosCalcFields(DataSet: TDataSet);
begin
   if QMovimentosPLANO_OP_SALDO.AsString = '' then
     begin
        QMovimentosSALDO_REAL.AsCurrency := 0;
        Exit;
     end;
   QMovimentosSTATUS.AsString :=
     IfThen( QMovimentosPLANO_TIPO.AsString = 'D', 'Débito', 'Crédito' ) +
     IfThen( QMovimentosCANCELADO.AsInteger = 1, '/CANCELADO' ) ;
   if ( QMovimentosPLANO_OP_SALDO.AsString = 'S' ) and
     ( QMovimentosCANCELADO.AsInteger <> 1 ) then
      QMovimentosSALDO_REAL.AsCurrency := QMovimentosVALOR.AsCurrency
   else
      QMovimentosSALDO_REAL.AsCurrency := 0;
   if ( QMovimentosPLANO_TIPO.AsString = 'D' )
   and ( QMovimentosSALDO_REAL.AsCurrency > 0 ) then
      QMovimentosSALDO_REAL.AsCurrency := QMovimentosSALDO_REAL.AsCurrency * -1;
end;

procedure TfrmNewCaixaMovimentos.TodosEventos;
var
  I: Integer;
begin
  for I := 0 to Self.ComponentCount -1 do
     begin
        if Self.Components[I] is TcxGridDBTableView then
           begin
              TcxGridDBTableView( Self.Components[I] ).OnColumnPosChanged := cxVisualizaDBTableView1ColumnPosChanged;
              TcxGridDBTableView( Self.Components[I] ).OnColumnSizeChanged := cxVisualizaDBTableView1ColumnSizeChanged;
              TcxGridDBTableView( Self.Components[I] ).OnCustomization := cxVisualizaDBTableView1Customization;
           end;
     end;
end;

procedure TfrmNewCaixaMovimentos.ToolButton2Click(Sender: TObject);
begin
   QMovimentos.Post;
   TRMovimentos.CommitRetaining;
   QMovimentos.RefreshRecord();
end;

procedure TfrmNewCaixaMovimentos.ToolButton3Click(Sender: TObject);
begin
    QMovimentos.Cancel;
    TRMovimentos.RollbackRetaining;
    QMovimentos.Refresh;
end;

end.
