unit UCadNovoDB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls,
  Vcl.ImgList, cxGraphics, cxPC, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, dxSkinscxPCPainter,
  dxBarBuiltInMenu, Data.DB, FireDAC.Stan.Intf, FireDAC.Comp.Client, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxContainer, cxLabel, Vcl.StdCtrls,
  Vcl.Mask, sMaskEdit, sCustomComboEdit, sToolEdit, cxTextEdit, cxCurrencyEdit,
  cxButtons, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, UNovoFormulario,
  Vcl.Menus, FireDAC.Phys.Intf, FireDAC.DApt.Intf, System.ImageList;

type
  TfrmCadNovoDB = class;
  TAliatorFilter = class( TObject )
     private
        FForm: TfrmCadNovoDB;
        FTipoFiltro: TFieldType;
        FFieldName: string;
        function GetValorFiltro: Variant;
        procedure SetFieldName(const Value: string);
     public
        property ValorFiltro: Variant read GetValorFiltro;
        property FieldName: string read FFieldName write SetFieldName;
        procedure SetFocus;
        function GetFocus: Boolean;
        procedure TipoFiltro( Tipo: TFieldType; Mask: String; Field: TField;
                  Coluna: TcxGridDBColumn );
        constructor Create( Form: TfrmCadNovoDB );
        destructor Destroy; override;
  end;
  TfrmCadNovoDB = class(TForm)
    BarraMenu: TcxImageList;
    ToolBar1: TToolBar;
    BtnNovo: TToolButton;
    BtnGravar: TToolButton;
    BtnCancelar: TToolButton;
    BtnAlterar: TToolButton;
    BtnExcluir: TToolButton;
    ToolButton1: TToolButton;
    BtnSair: TToolButton;
    pnlGeral: TPanel;
    cxPaginas: TcxPageControl;
    PageConsulta: TcxTabSheet;
    PageEdit: TcxTabSheet;
    dsPrincipal: TDataSource;
    TRPrincipal: TFDTransaction;
    cxVisualizaDBTableView1: TcxGridDBTableView;
    cxVisualizaLevel1: TcxGridLevel;
    cxVisualiza: TcxGrid;
    Panel1: TPanel;
    lblPesquisa: TcxLabel;
    cxStyleRepository1: TcxStyleRepository;
    cxstylPadrao: TcxStyle;
    cxstylOdd: TcxStyle;
    Panel2: TPanel;
    edtText: TEdit;
    edtCurr: TcxCurrencyEdit;
    edtData: TDateTimePicker;
    btnPesquisar: TcxButton;
    edtMask: TMaskEdit;
    QPrincipal: TFDQuery;
    pnlData2: TPanel;
    edtData2: TDateTimePicker;
    cxstylHeader: TcxStyle;
    cxstylHeaderBold: TcxStyle;
    cxstylInactive: TcxStyle;
    BarraSubMenu: TcxImageList;
    shp1: TShape;
    cxstylVermelho: TcxStyle;
    cxImgsGrid: TcxImageList;
    rgOptionGrid: TRadioGroup;
    cxstylGrupos: TcxStyle;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnSairClick(Sender: TObject);
    procedure dsPrincipalStateChange(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxVisualizaDBTableView1ColumnHeaderClick(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxVisualizaDBTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxPaginasChange(Sender: TObject);

    procedure cxVisualizaDBTableView1StylesGetHeaderStyle(
      Sender: TcxGridTableView; AColumn: TcxGridColumn; var AStyle: TcxStyle);
    procedure cxVisualizaDBTableView1ColumnPosChanged(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure cxVisualizaDBTableView1ColumnSizeChanged(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxVisualizaDBTableView1Customization(Sender: TObject);
    procedure QPrincipalBeforeCancel(DataSet: TDataSet);
    procedure rgOptionGridClick(Sender: TObject);
    procedure QPrincipalAfterInsert(DataSet: TDataSet);
    procedure QPrincipalAfterEdit(DataSet: TDataSet);
    procedure QPrincipalBeforeDelete(DataSet: TDataSet);
    procedure TRPrincipalAfterCommit(Sender: TObject);
    procedure TRPrincipalAfterRollback(Sender: TObject);
  private
    { Private declarations }
    procedure TodosEventos;
  public
     Filtro: TAliatorFilter;
     ControleComKeyDow: Boolean;
     Sql: string;
     CodigoTela: String;
     procedure AtualizaQuerys;
     procedure FechaQuerys;
    { Public declarations }
  end;



implementation

{$R *.dfm}

uses UNovoPrincipal, UDM, UDialog, UDicImp, UDicLib;

procedure TfrmCadNovoDB.AtualizaQuerys;
var
  I: Integer;
begin
   for I := 0 to ComponentCount -1 do
     if Components[I] is TFDQuery then
        if TFDQuery( Components[I] ).Name <> 'QPrincipal' then
           if TFDQuery( Components[I] ).Active then
              begin
                TFDQuery( Components[I] ).Close;
                TFDQuery( Components[I] ).Open;
              end;
end;

procedure TfrmCadNovoDB.BtnAlterarClick(Sender: TObject);
begin
    dsPrincipal.DataSet.Edit;
end;

procedure TfrmCadNovoDB.BtnCancelarClick(Sender: TObject);
begin
    dsPrincipal.DataSet.Cancel;
    TRPrincipal.RollbackRetaining;
    AtualizaQuerys;
end;

procedure TfrmCadNovoDB.BtnExcluirClick(Sender: TObject);
begin
   if not KDialog( 'Tem certeza que deseja excluir este registro?', 'Exclusão', tdtPergunta )  then
      Exit;
   try
     try
      dsPrincipal.DataSet.Delete;
     except
        On E: Exception do
           begin
              AlertaCad( 'Erro ao excluir : ' + E.Message );
              TRPrincipal.RollbackRetaining;
           end;
     end;
   finally
      TRPrincipal.CommitRetaining;
   end;
end;

procedure TfrmCadNovoDB.BtnGravarClick(Sender: TObject);
begin
    dsPrincipal.DataSet.Post;
    TRPrincipal.CommitRetaining;
    QPrincipal.RefreshRecord();
end;

procedure TfrmCadNovoDB.BtnNovoClick(Sender: TObject);
begin
    dsPrincipal.DataSet.Insert;
end;

procedure TfrmCadNovoDB.BtnSairClick(Sender: TObject);
begin
   if Parent is TcxTabSheet then
      frmMenu.FTDI.CloseTabOfForm( TFormClass( Self.ClassType ) )
   else
      close;
end;

procedure TfrmCadNovoDB.cxPaginasChange(Sender: TObject);
begin
   if cxPaginas.ActivePageIndex = 0 then
      FechaQuerys;
end;

procedure TfrmCadNovoDB.cxVisualizaDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
   if not QPrincipal.IsEmpty then
     cxPaginas.ActivePageIndex := 1;
end;

procedure TfrmCadNovoDB.cxVisualizaDBTableView1ColumnHeaderClick(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
var
  Col: TcxGridDBColumn;
begin
   if AColumn is TcxGridDBColumn then
     begin
        Col := AColumn as TcxGridDBColumn;
        if QPrincipal.FieldByName( Col.DataBinding.FieldName ).ReadOnly then
           Exit;
        Filtro.TipoFiltro(
        QPrincipal.FieldByName( Col.DataBinding.FieldName ).DataType,
        QPrincipal.FieldByName( Col.DataBinding.FieldName ).EditMask,
        QPrincipal.FieldByName( Col.DataBinding.FieldName ), Col );
        Filtro.SetFocus;
     end;
end;

procedure TfrmCadNovoDB.cxVisualizaDBTableView1ColumnPosChanged(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
   if Sender <> nil then
   if Sender is TcxGridDBTableView then
      TDicLib.GravarGridDB( iCodUsu, TcxGridDBTableView( Sender ), Self,  dm.IBDatabase);
end;

procedure TfrmCadNovoDB.cxVisualizaDBTableView1ColumnSizeChanged(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
   if Sender <> nil then
   if Sender is TcxGridDBTableView then
      TDicLib.GravarGridDB( iCodUsu, TcxGridDBTableView( Sender ), Self,  dm.IBDatabase);
end;

procedure TfrmCadNovoDB.cxVisualizaDBTableView1Customization(Sender: TObject);
begin
   if Sender <> nil then
   if Sender is TcxGridDBTableView then
      TDicLib.GravarGridDB( iCodUsu, TcxGridDBTableView( Sender ), Self,  dm.IBDatabase);
end;

procedure TfrmCadNovoDB.cxVisualizaDBTableView1StylesGetHeaderStyle(
  Sender: TcxGridTableView; AColumn: TcxGridColumn; var AStyle: TcxStyle);
begin
  if not ( AColumn is TcxGridDBColumn)  then
     begin
        AStyle := cxstylHeader;
        Exit;
     end;
  if not Assigned( Filtro )  then
     begin
        AStyle := cxstylHeader;
        Exit;
     end;
  if TcxGridDBColumn( AColumn ).DataBinding.FieldName = Filtro.FieldName then
     AStyle := cxstylHeaderBold
  else
     AStyle := cxstylHeader;
end;

procedure TfrmCadNovoDB.dsPrincipalStateChange(Sender: TObject);
begin
   BtnNovo.Enabled :=  dsPrincipal.State in [dsBrowse];
   BtnGravar.Enabled :=  dsPrincipal.State in [dsEdit, dsInsert ];
   BtnCancelar.Enabled := dsPrincipal.State in [dsEdit, dsInsert ];
   BtnAlterar.Enabled :=  ( dsPrincipal.State in [dsBrowse] ) and
      ( dsPrincipal.DataSet.RecNo > 0 );
   BtnExcluir.Enabled :=   ( dsPrincipal.State in [dsBrowse] ) and
      ( dsPrincipal.DataSet.RecNo > 0 );
   if ( dsPrincipal.State in [dsEdit, dsInsert ] ) then
      cxPaginas.ActivePageIndex := 1;
   PageEdit.Enabled := dsPrincipal.State in [dsEdit, dsInsert ];
end;

procedure TfrmCadNovoDB.FechaQuerys;
var
  I: Integer;
begin
   for I := 0 to ComponentCount -1 do
     if Components[I] is TFDQuery then
        if TFDQuery( Components[I] ).Name <> 'QPrincipal' then
           if TFDQuery( Components[I] ).Active then
              begin
                TFDQuery( Components[I] ).Close;
              end;
end;


procedure TfrmCadNovoDB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if QPrincipal.State in [ dsInsert, dsEdit ] then
     BtnCancelar.Click;
   TDicLib.GravarGridDB( iCodUsu, rgOptionGrid, Self, DM.IBDatabase );
end;

procedure TfrmCadNovoDB.FormCreate(Sender: TObject);
begin
   TodosEventos;
   ControleComKeyDow := False;
   Filtro := TAliatorFilter.Create( Self );
   Sql := QPrincipal.SQL.Text;
   TDicLib.MontaTelaUsu( iCodUsu, Self, DM.IBDatabase );
end;

procedure TfrmCadNovoDB.FormDestroy(Sender: TObject);
begin
  QPrincipal.Close;
  if TRPrincipal.Active then
     TRPrincipal.Commit;
   Filtro.Free;
end;

procedure TfrmCadNovoDB.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ControleComKeyDow then
      Exit;
   case key of
     VK_ESCAPE:  begin
                     BtnSairClick( nil );
                     Abort;
                     Exit;
                 end;
     vk_f5: begin
               if btnnovo.Enabled then
                  btnnovo.Click;
            end;
     vk_f6: begin
               if btngravar.Enabled then
                  btngravar.Click;
            end;
     vk_f7: begin
               if btncancelar.Enabled then
                  btncancelar.Click;
            end;
     vk_f8: begin
               if btnalterar.Enabled then
                  btnalterar.Click;
            end;
     vk_f9: begin
               if btnexcluir.Enabled then
                  btnexcluir.Click;
            end;
     VK_F3: begin
               if QPrincipal.State in [ dsInsert, dsEdit ] then
                  Exit;
               if Filtro.GetFocus then
                  btnPesquisar.Click
               else
                  begin
                     cxPaginas.ActivePageIndex := 0;
                     Filtro.SetFocus;
                  end;
            end;
{     VK_RETURN: begin
                   SelectNext(ActiveControl, true, true);
                end;}
   end;

end;

procedure TfrmCadNovoDB.FormShow(Sender: TObject);
var
   Col: TcxGridDBColumn;
begin
   cxPaginas.ActivePageIndex := 0;
   Col := TcxGridDBColumn( cxVisualizaDBTableView1.Columns[0] );
    Filtro.TipoFiltro(
    QPrincipal.FieldByName( Col.DataBinding.FieldName ).DataType,
    QPrincipal.FieldByName( Col.DataBinding.FieldName ).EditMask,
    QPrincipal.FieldByName( Col.DataBinding.FieldName ), Col );
end;

procedure TfrmCadNovoDB.QPrincipalAfterEdit(DataSet: TDataSet);
begin
  if not DM.Acesso(CodigoTela,'A') then
     begin
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        QPrincipal.Cancel;
        Abort;
        Exit;
     end;
end;

procedure TfrmCadNovoDB.QPrincipalAfterInsert(DataSet: TDataSet);
begin
  if not DM.Acesso(CodigoTela,'I') then
     begin
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        QPrincipal.Cancel;
        Abort;
        Exit;
     end;
end;

procedure TfrmCadNovoDB.QPrincipalBeforeCancel(DataSet: TDataSet);
begin
  if not KDialog( 'Tem Certeza certeza que deseja cancelar a edição?', 'Cancelamento de Edição', tdtPergunta ) then
     begin
        Abort;
     end;
end;

procedure TfrmCadNovoDB.QPrincipalBeforeDelete(DataSet: TDataSet);
begin
  if not DM.Acesso(CodigoTela,'E') then
     begin
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        QPrincipal.Cancel;
        Abort;
        Exit;
     end;
end;

procedure TfrmCadNovoDB.rgOptionGridClick(Sender: TObject);
begin
   btnPesquisar.Click;
end;

procedure TfrmCadNovoDB.TodosEventos;
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





procedure TfrmCadNovoDB.TRPrincipalAfterCommit(Sender: TObject);
begin
   BtnNovo.Enabled :=  dsPrincipal.State in [dsBrowse];
   BtnGravar.Enabled :=  dsPrincipal.State in [dsEdit, dsInsert ];
   BtnCancelar.Enabled := dsPrincipal.State in [dsEdit, dsInsert ];
   BtnAlterar.Enabled :=  ( dsPrincipal.State in [dsBrowse] ) and
      ( dsPrincipal.DataSet.RecNo > 0 );
   BtnExcluir.Enabled :=   ( dsPrincipal.State in [dsBrowse] ) and
      ( dsPrincipal.DataSet.RecNo > 0 );
   if ( dsPrincipal.State in [dsEdit, dsInsert ] ) then
      cxPaginas.ActivePageIndex := 1;
   PageEdit.Enabled := dsPrincipal.State in [dsEdit, dsInsert ];

end;

procedure TfrmCadNovoDB.TRPrincipalAfterRollback(Sender: TObject);
begin
   BtnNovo.Enabled :=  dsPrincipal.State in [dsBrowse];
   BtnGravar.Enabled :=  dsPrincipal.State in [dsEdit, dsInsert ];
   BtnCancelar.Enabled := dsPrincipal.State in [dsEdit, dsInsert ];
   BtnAlterar.Enabled :=  ( dsPrincipal.State in [dsBrowse] ) and
      ( dsPrincipal.DataSet.RecNo > 0 );
   BtnExcluir.Enabled :=   ( dsPrincipal.State in [dsBrowse] ) and
      ( dsPrincipal.DataSet.RecNo > 0 );
   if ( dsPrincipal.State in [dsEdit, dsInsert ] ) then
      cxPaginas.ActivePageIndex := 1;
   PageEdit.Enabled := dsPrincipal.State in [dsEdit, dsInsert ];

end;

constructor TAliatorFilter.Create( Form: TfrmCadNovoDB );
begin
   FForm := Form;
   FFieldName := '';
end;

destructor TAliatorFilter.Destroy;
begin
  //
  inherited;
end;

function TAliatorFilter.GetFocus: Boolean;
begin
   if FForm.edtText.Visible then
     Result := FForm.edtText.Focused;
   if FForm.edtCurr.Visible then
     Result := FForm.edtCurr.Focused;
   if FForm.edtData.Visible then
     Result := FForm.edtData.Focused;
   if FForm.edtMask.Visible then
     Result := FForm.edtMask.Focused;
//   if FForm.edtData2.Visible then
  //   Result := FForm.edtData2.Focused;
end;

function TAliatorFilter.GetValorFiltro: Variant;
begin
  case FTipoFiltro of
    ftUnknown: ;
    ftString: Result := FForm.edtMask.Text;
    ftSmallint,
    ftInteger: Result := Trunc( FForm.edtCurr.Value );
    ftFloat,
    ftCurrency,
    ftBCD,
    ftExtended: Result := FForm.edtCurr.Value;
    ftDate: ;
    ftTime: ;
    ftDateTime: ;
    ftBytes: ;
    ftVarBytes: ;
    ftAutoInc: ;
    ftBlob: ;
    ftMemo: ;
    ftGraphic: ;
    ftFmtMemo: ;
    ftParadoxOle: ;
    ftDBaseOle: ;
    ftTypedBinary: ;
    ftCursor: ;
    ftFixedChar: ;
    ftWideString: ;
    ftLargeint: ;
    ftADT: ;
    ftArray: ;
    ftReference: ;
    ftDataSet: ;
    ftOraBlob: ;
    ftOraClob: ;
    ftVariant: ;
    ftInterface: ;
    ftIDispatch: ;
    ftGuid: ;
    ftTimeStamp: ;
    ftFMTBcd: ;
    ftFixedWideChar: ;
    ftWideMemo: ;
    ftOraTimeStamp: ;
    ftOraInterval: ;
    ftLongWord: ;
    ftShortint: ;
    ftByte: ;
    ftConnection: ;
    ftParams: ;
    ftStream: ;
    ftTimeStampOffset: ;
    ftObject: ;
    ftSingle: ;
  end;

end;


procedure TAliatorFilter.SetFieldName(const Value: string);
begin
  FFieldName := Value;
end;

procedure TAliatorFilter.SetFocus;
begin
   if FForm.edtText.Visible then
      FForm.edtText.SetFocus;
   if FForm.edtCurr.Visible then
      FForm.edtCurr.SetFocus;
   if FForm.edtData.Visible then
      FForm.edtData.SetFocus;
   if FForm.edtMask.Visible then
      FForm.edtMask.SetFocus;
end;

procedure TAliatorFilter.TipoFiltro(Tipo: TFieldType; Mask: String; Field: TField;
          Coluna: TcxGridDBColumn);
begin
  FTipoFiltro := Tipo;
  if Field <> nil then
    FFieldName := Field.FieldName;
  FForm.edtText.Visible := False;
  FForm.edtData.Visible := FTipoFiltro in [ ftDate, ftTime, ftDateTime ];
  FForm.edtCurr.Visible := FTipoFiltro in [ ftFloat, ftCurrency,
    ftExtended, ftBCD, ftInteger ];
  FForm.edtMask.Visible := FTipoFiltro in [ ftString ];
  FForm.pnlData2.Visible := FTipoFiltro in [ ftDate, ftTime, ftDateTime ];
  FForm.edtData2.Visible := FTipoFiltro in [ ftDate, ftTime, ftDateTime ];
  FForm.lblPesquisa.Caption := 'Pesquisar (' + Coluna.Caption + ') :';
  case FTipoFiltro of
    ftUnknown: ;
    ftString: begin
                 FForm.edtMask.Clear;
                 FForm.edtMask.EditMask := Mask;
              end;
    ftSmallint: ;
    ftInteger: begin
                 FForm.edtCurr.Clear;
                 FForm.edtCurr.Properties.DisplayFormat := '0';
                 FForm.edtCurr.Properties.DecimalPlaces := 0;
                 FForm.edtCurr.Properties.EditFormat := '0';
              end;
    ftWord: ;
    ftBoolean: ;
    ftFloat, ftCurrency,
    ftExtended, ftBCD: begin
                 FForm.edtCurr.Clear;
                 case FTipoFiltro of
                      ftFloat: FForm.edtCurr.Properties.DecimalPlaces := TFloatField( Field ).Size;
                      ftCurrency: FForm.edtCurr.Properties.DecimalPlaces := TCurrencyField( Field ).Size;
                      ftExtended: FForm.edtCurr.Properties.DecimalPlaces := TExtendedField( Field ).Size;
                      ftBCD: FForm.edtCurr.Properties.DecimalPlaces := TBCDField( Field ).Size;
                 end;
                 FForm.edtCurr.Properties.DisplayFormat := ',0.' + StringOfChar( '0',FForm.edtCurr.Properties.DecimalPlaces )  +
                   ';-,0.'+ StringOfChar( '0',FForm.edtCurr.Properties.DecimalPlaces );
                 FForm.edtCurr.Properties.EditFormat := '0.' + StringOfChar( '0',FForm.edtCurr.Properties.DecimalPlaces);
              end;
    ftDate: begin
               FForm.edtData.DateTime := Now;
               FForm.edtData2.DateTime := Now;
            end;
    ftTime: ;
    ftDateTime: ;
    ftBytes: ;
    ftVarBytes: ;
    ftAutoInc: ;
    ftBlob: ;
    ftMemo: ;
    ftGraphic: ;
    ftFmtMemo: ;
    ftParadoxOle: ;
    ftDBaseOle: ;
    ftTypedBinary: ;
    ftCursor: ;
    ftFixedChar: ;
    ftWideString: ;
    ftLargeint: ;
    ftADT: ;
    ftArray: ;
    ftReference: ;
    ftDataSet: ;
    ftOraBlob: ;
    ftOraClob: ;
    ftVariant: ;
    ftInterface: ;
    ftIDispatch: ;
    ftGuid: ;
    ftTimeStamp: ;
    ftFMTBcd: ;
    ftFixedWideChar: ;
    ftWideMemo: ;
    ftOraTimeStamp: ;
    ftOraInterval: ;
    ftLongWord: ;
    ftShortint: ;
    ftByte: ;
    ftConnection: ;
    ftParams: ;
    ftStream: ;
    ftTimeStampOffset: ;
    ftObject: ;
    ftSingle: ;
  end;
end;



end.
