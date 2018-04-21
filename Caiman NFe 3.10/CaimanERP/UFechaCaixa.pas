unit UFechaCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMetropolis,
  cxLabel, Vcl.ExtCtrls, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, UDicFluxo, cxCurrencyEdit, Vcl.Mask,
  RxToolEdit, RxCurrEdit, Datasnap.DBClient, cxCalc, UNovosComponentes, UNovoFormulario;

type
  TfrmFechaCaixa = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    lblCaixa: TcxLabel;
    Panel2: TPanel;
    cxLabel2: TcxLabel;
    lblUsuario: TcxLabel;
    Panel4: TPanel;
    cxLabel6: TcxLabel;
    Shape2: TShape;
    shp1: TShape;
    pnlPeriodo: TPanel;
    Panel5: TPanel;
    cxLabel4: TcxLabel;
    edtDateIni: TcxDateEdit;
    Panel6: TPanel;
    cxLabel5: TcxLabel;
    edtDateFim: TcxDateEdit;
    Shape1: TShape;
    QFormas: TFDQuery;
    TRFechamento: TFDTransaction;
    QFormasDESCRICAO: TStringField;
    QFormasTOTAL: TBCDField;
    cxGridFormasDBTableView1: TcxGridDBTableView;
    cxGridFormasLevel1: TcxGridLevel;
    cxGridFormas: TcxGrid;
    dsFormas: TDataSource;
    cxGridFormasDBTableView1DESCRICAO: TcxGridDBColumn;
    cxGridFormasDBTableView1TOTAL: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxstylPadrao: TcxStyle;
    cxstylOdd: TcxStyle;
    cxstylHeader: TcxStyle;
    cxstylHeaderBold: TcxStyle;
    cxstylInactive: TcxStyle;
    cxstylVermelho: TcxStyle;
    Panel9: TPanel;
    btnCancelar: TcxButton;
    btnConfirmar: TcxButton;
    pnlSaldoAnterior: TPanel;
    cxLabel3: TcxLabel;
    edtTotInicial: TcxLabel;
    Panel3: TPanel;
    cxLabel7: TcxLabel;
    edtTotFinal: TcxLabel;
    Panel7: TPanel;
    cxLabel9: TcxLabel;
    edtTotFormas: TcxLabel;
    Panel8: TPanel;
    cxLabel8: TcxLabel;
    cxLabel10: TcxLabel;
    edtSangria: TCurrencyEdit;
    tempFormas: TClientDataSet;
    tempFormasdescricao: TStringField;
    tempFormasvalor: TCurrencyField;
    tempFormasvalor_confere: TCurrencyField;
    cxGridFormasDBTableView1valor_confere: TcxGridDBColumn;
    tempFormasvalor_dif: TCurrencyField;
    cxGridFormasDBTableView1valor_dif: TcxGridDBColumn;
    QFormasCODIGO: TIntegerField;
    tempFormascodigo: TIntegerField;
    cxLabel11: TcxLabel;
    lblAbre: TcxLabel;
    QFormasSALDO: TBCDField;
    tempFormasvalor_saldo: TCurrencyField;
    tempFormasvalor_calc: TStringField;
    QFormasTIPO: TStringField;
    procedure edtSangriaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tempFormasvalor_confereChange(Sender: TField);
    procedure cxGridFormasEnter(Sender: TObject);
    procedure cxGridFormasExit(Sender: TObject);
    procedure tempFormasAfterPost(DataSet: TDataSet);
    procedure edtSangriaEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure tempFormasCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FDicFluxo: TDicFluxo;
    GridOn: Boolean;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; DicFluxo: TDicFluxo );
  end;

implementation

{$R *.dfm}

uses UDM;

{ TfrmFechaCaixa }

procedure TfrmFechaCaixa.btnCancelarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TfrmFechaCaixa.btnConfirmarClick(Sender: TObject);
begin
   ModalResult := mrOk;
end;

constructor TfrmFechaCaixa.Create(AOwner: TComponent; DicFluxo: TDicFluxo);
begin
  inherited Create( AOwner );
  GridOn := False;
  FDicFluxo := DicFluxo;
end;

procedure TfrmFechaCaixa.cxGridFormasEnter(Sender: TObject);
begin
   tempFormas.First;
   GridOn := True;
   cxGridFormasDBTableView1.Columns[2].FocusWithSelection;
end;

procedure TfrmFechaCaixa.cxGridFormasExit(Sender: TObject);
begin
   GridOn := False;
end;

procedure TfrmFechaCaixa.edtSangriaChange(Sender: TObject);
var
  Tot: Currency;
begin
   Tot := FDicFluxo.SaldoFormas + FDicFluxo.SaldoInicial;
   if edtSangria.Value > Tot then
      begin
         AlertaCad( 'Sangria não pode ser maior que o saldo!' );
         edtSangria.Value := 0;
      end;
   FDicFluxo.SaldoSangria := edtSangria.Value;
   FDicFluxo.SaldoFinal := Tot - FDicFluxo.SaldoSangria;
   edtTotFinal.Caption := FormatFloat( 'R$ 0.00 (=)', FDicFluxo.SaldoFinal );
end;

procedure TfrmFechaCaixa.edtSangriaEnter(Sender: TObject);
begin
   GridOn := False;
end;

procedure TfrmFechaCaixa.FormCreate(Sender: TObject);
begin
   tempFormas.Close;
   tempFormas.CreateDataSet;
   tempFormas.Open;
   tempFormas.EmptyDataSet;
end;

procedure TfrmFechaCaixa.FormDestroy(Sender: TObject);
begin
   tempFormas.EmptyDataSet;
   tempFormas.Close;
end;

procedure TfrmFechaCaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   if not GridOn then
      begin
          keybd_event( VK_TAB, VkKeyScan( chr( VK_TAB ) ), 0, 0 );
          keybd_event( VK_TAB, VkKeyScan( chr( VK_TAB )  ), KEYEVENTF_KEYUP, 0 );
      end;

end;

procedure TfrmFechaCaixa.tempFormasAfterPost(DataSet: TDataSet);
begin
   if GridOn then
     begin
         tempFormas.Next;
        if tempFormas.Eof then
           begin
             keybd_event( VK_TAB, VkKeyScan( chr( VK_TAB )  ), 0, 0 );
             keybd_event( VK_TAB, VkKeyScan( chr( VK_TAB )  ), KEYEVENTF_KEYUP, 0 );
           end;
     end;
end;

procedure TfrmFechaCaixa.tempFormasCalcFields(DataSet: TDataSet);
begin
   if tempFormasvalor_saldo.AsCurrency = 0 then
      tempFormasvalor_calc.AsString := FormatFloat( 'R$ ,0.00 (+)(*);R$ ,0.00 (-)(*)', tempFormasvalor.AsFloat )
   else
      tempFormasvalor_calc.AsString := FormatFloat( 'R$ ,0.00 (+);R$ ,0.00 (-)', tempFormasvalor.AsFloat );
end;

procedure TfrmFechaCaixa.tempFormasvalor_confereChange(Sender: TField);
begin
   if tempFormas.State = dsInsert then
      Exit;
   if tempFormas.State <> dsEdit then
      tempFormas.Edit;
   tempFormasvalor_dif.AsCurrency := ( tempFormasvalor.AsCurrency -
     tempFormasvalor_confere.AsCurrency ) * -1;
   if GridOn then
      tempFormas.Post;
end;

end.
