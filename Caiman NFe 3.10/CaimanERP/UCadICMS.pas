unit UCadICMS;

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
  Vcl.ExtCtrls, Vcl.ToolWin, Vcl.DBCtrls, UNovosComponentes;

type
  TfrmCadICMS = class(TfrmCadNovoDB)
    QPrincipalCOD_ICMS: TIntegerField;
    QPrincipalCOD_EMP: TIntegerField;
    QPrincipalDESCRICAO: TStringField;
    QPrincipalCST: TStringField;
    QPrincipalICMS: TBCDField;
    QPrincipalREDUCAO: TBCDField;
    QPrincipalDIF: TBCDField;
    QPrincipalMVA: TBCDField;
    cxVisualizaDBTableView1COD_ICMS: TcxGridDBColumn;
    cxVisualizaDBTableView1DESCRICAO: TcxGridDBColumn;
    cxVisualizaDBTableView1CST: TcxGridDBColumn;
    cxVisualizaDBTableView1ICMS: TcxGridDBColumn;
    cxVisualizaDBTableView1REDUCAO: TcxGridDBColumn;
    cxVisualizaDBTableView1DIF: TcxGridDBColumn;
    cxVisualizaDBTableView1MVA: TcxGridDBColumn;
    upPrincipal: TFDUpdateSQL;
    Panel3: TPanel;
    cxLabel1: TcxLabel;
    dbedtCOD_ICMS: TDBEdit;
    Panel4: TPanel;
    cxLabel2: TcxLabel;
    dbedtDESCRICAO: TDBEdit;
    Panel5: TPanel;
    dbrgrpCST: TDBRadioGroup;
    Panel6: TPanel;
    pnlIcms: TPanel;
    cxLabel3: TcxLabel;
    dbedtICMS: TDBEdit;
    pnlReducao: TPanel;
    cxLabel4: TcxLabel;
    dbedtREDUCAO: TDBEdit;
    pnlDiferido: TPanel;
    cxLabel5: TcxLabel;
    dbedtDIF: TDBEdit;
    pnlMva: TPanel;
    cxLabel6: TcxLabel;
    dbedtMVA: TDBEdit;
    procedure dbrgrpCSTChange(Sender: TObject);
    procedure QPrincipalAfterScroll(DataSet: TDataSet);
    procedure QPrincipalAfterInsert(DataSet: TDataSet);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure MostraCampos;
  public
    { Public declarations }
  end;

 function frmCadICMS: TfrmCadICMS;

implementation

{$R *.dfm}

uses UNovoPrincipal, UDM;

function frmCadICMS: TfrmCadICMS;
begin
   Result := TfrmCadICMS( BuscaFormulario( TfrmCadICMS, False  ) );
end;

{ TfrmCadICMS }

procedure TfrmCadICMS.btnPesquisarClick(Sender: TObject);
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

procedure TfrmCadICMS.dbrgrpCSTChange(Sender: TObject);
begin
  inherited;
  MostraCampos;
end;

procedure TfrmCadICMS.FormShow(Sender: TObject);
begin
  inherited;
  if TRPrincipal.Active then
     TRPrincipal.Commit;
  TRPrincipal.StartTransaction;
  QPrincipal.Close;
  QPrincipal.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
  QPrincipal.Open;
end;

procedure TfrmCadICMS.MostraCampos;
begin
   pnlIcms.Visible := dbrgrpCST.ItemIndex in [ 0, 1, 2, 6, 7, 8, 9, 10 ];
   pnlReducao.Visible := dbrgrpCST.ItemIndex in [ 2, 9, 10 ];
   pnlDiferido.Visible := dbrgrpCST.ItemIndex in [ 7, 10 ];
   pnlMva.Visible := dbrgrpCST.ItemIndex in [ 1, 3, 8, 9, 10 ];
end;

procedure TfrmCadICMS.QPrincipalAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if dsPrincipal.State = dsInsert then
     QPrincipalCOD_EMP.AsInteger := iEmp;
  MostraCampos;
end;

procedure TfrmCadICMS.QPrincipalAfterScroll(DataSet: TDataSet);
begin
  inherited;
  MostraCampos;
end;

end.
