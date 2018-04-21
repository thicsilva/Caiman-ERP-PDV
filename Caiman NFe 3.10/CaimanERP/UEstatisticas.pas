unit UEstatisticas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinMetropolis, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.ExtCtrls, System.DateUtils, cxContainer, cxLabel, dxGDIPlusClasses;

type
  TfrmEstatisticas = class(TFrame)
    QResumoFinanceiro: TFDQuery;
    dsResumFinanceiro: TDataSource;
    TRResumoFinanceiro: TFDTransaction;
    Panel1: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    QResumoFinanceiroTIPO: TStringField;
    QResumoFinanceiroDESC_DIAS: TStringField;
    QResumoFinanceiroCODIGO: TIntegerField;
    QResumoFinanceiroEMISSAO: TDateField;
    QResumoFinanceiroVALOR: TBCDField;
    QResumoFinanceiroVENCIMENTO: TDateField;
    QResumoFinanceiroCOD_CLIFOR: TIntegerField;
    QResumoFinanceiroNOME: TStringField;
    QResumoFinanceiroTELEFONE: TStringField;
    cxGrid1DBTableView1TIPO: TcxGridDBColumn;
    cxGrid1DBTableView1DESC_DIAS: TcxGridDBColumn;
    cxGrid1DBTableView1CODIGO: TcxGridDBColumn;
    cxGrid1DBTableView1EMISSAO: TcxGridDBColumn;
    cxGrid1DBTableView1VALOR: TcxGridDBColumn;
    cxGrid1DBTableView1VENCIMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1NOME: TcxGridDBColumn;
    cxGrid1DBTableView1TELEFONE: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxstyl1: TcxStyle;
    cxstyl2: TcxStyle;
    cxstylRed: TcxStyle;
    cxLabel1: TcxLabel;
    cxstyl4: TcxStyle;
    cxstylVerde: TcxStyle;
    cxstylNavy: TcxStyle;
    QTotaisContas: TFDQuery;
    QTotaisContasRECEBER: TBCDField;
    QTotaisContasPAGAR: TBCDField;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Panel4: TPanel;
    lblPagar: TcxLabel;
    lblReceber: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    pnl1: TPanel;
    Panel5: TPanel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    Shape1: TShape;
    procedure cxGrid1DBTableView1StylesGetGroupSummaryStyle(
      Sender: TcxGridTableView; ARow: TcxGridGroupRow; AColumn: TcxGridColumn;
      ASummaryItem: TcxDataSummaryItem; var AStyle: TcxStyle);
    procedure cxGrid1DBTableView1StylesGetGroupStyle(Sender: TcxGridTableView;
      ARecord: TcxCustomGridRecord; ALevel: Integer; var AStyle: TcxStyle);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
    procedure ExpandGroups;
  public
    { Public declarations }
    function AtualizaResumo( const PrimeiraVez: Boolean = false ): Boolean;
  end;

implementation

{$R *.dfm}

uses UDM, UDicLib, UContasRecRec, UNovoPrincipal, UContasPagarPag;

{ TfrmEstatisticas }

function TfrmEstatisticas.AtualizaResumo(  const PrimeiraVez: Boolean = false ): Boolean;
var
   Dias_R: Integer;
   Dias_P: Integer;
begin
   Dias_R := StrToIntDef( TDicLib.GetParam( iEmp, 'FINANCEIRO', 'RECEBER_DIAS_RESUMO', DM.IBDatabase,
                    '5', '', 'FINANCEIRO', 'NUM', 'DETERMINA NUMERO DE DIAS PARA O RESUMO DE CONTAS A RECEBER' ).Valor, 5 );
   Dias_P := StrToIntDef( TDicLib.GetParam( iEmp, 'FINANCEIRO', 'PAGAR_DIAS_RESUMO', DM.IBDatabase,
                    '5', '', 'FINANCEIRO', 'NUM', 'DETERMINA NUMERO DE DIAS PARA O RESUMO DE CONTAS A PAGAR' ).Valor, 5 );
   if TRResumoFinanceiro.Active then
      TRResumoFinanceiro.Commit;
   TRResumoFinanceiro.StartTransaction;
   QResumoFinanceiro.Close;
   QResumoFinanceiro.ParamByName( 'DT_AVISO_R' ).AsDate := IncDay( Date, Dias_R );
   QResumoFinanceiro.ParamByName( 'DT_AVISO_P' ).AsDate := IncDay( Date, Dias_P );
   QResumoFinanceiro.ParamByName( 'DIAS_R' ).AsString := IntToStr( Dias_R );
   QResumoFinanceiro.ParamByName( 'DIAS_P' ).AsString := IntToStr( Dias_P );
   QResumoFinanceiro.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
   QResumoFinanceiro.Open;
   QTotaisContas.Close;
   QTotaisContas.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
   QTotaisContas.Open;
   ExpandGroups;
   Result := not QResumoFinanceiro.IsEmpty;
   lblPagar.Caption := FormatFloat( 'R$ ,0.00', QTotaisContasPAGAR.AsFloat );
   lblReceber.Caption := FormatFloat( 'R$ ,0.00', QTotaisContasRECEBER.AsFloat );
   if PrimeiraVez then
      begin
         if QTotaisContasRECEBER.AsFloat > 0 then
            AlertaCad( 'Você tem ' +
            FormatFloat( 'R$ ,0.00',QTotaisContasRECEBER.AsFloat ) + ' para receber no dia de Hoje',
            alertFinanceiro, 'Contas a Receber', True );
         if QTotaisContasPAGAR.AsFloat > 0 then
            AlertaCad( 'Você tem ' +
            FormatFloat( 'R$ ,0.00',QTotaisContasPAGAR.AsFloat ) + ' para pagar no dia de Hoje',
            alertFinanceiroRed, 'Contas a Pagar', True );
      end;
end;

procedure TfrmEstatisticas.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
    if QResumoFinanceiroTIPO.AsString = 'Contas a Receber' then
       begin
           BuscaFormulario( TFrmContasRecRec, True );
           FrmContasRecRec.EdtCodCli.Text := QResumoFinanceiroCOD_CLIFOR.AsString;
           FrmContasRecRec.EdtCodCliExit( nil );
           FrmContasRecRec.BtnOkClick( nil );
       end
    else
       begin
           BuscaFormulario( TFrmContasPagarPag, True );
           FrmContasPagarPag.EdtCodFor.Text := QResumoFinanceiroCOD_CLIFOR.AsString;
           FrmContasPagarPag.EdtCodForExit( nil );
           FrmContasPagarPag.EdtDataIni.DateTime := QResumoFinanceiroEMISSAO.AsDateTime;
           FrmContasPagarPag.EdtDataFin.DateTime := QResumoFinanceiroVENCIMENTO.AsDateTime;
           FrmContasPagarPag.BtnOkClick( nil );
       end;
end;

procedure TfrmEstatisticas.cxGrid1DBTableView1StylesGetGroupStyle(
  Sender: TcxGridTableView; ARecord: TcxCustomGridRecord; ALevel: Integer;
  var AStyle: TcxStyle);
begin
    case ALevel of
          0: AStyle := cxstylRed;
          1: AStyle := cxstylRed;
          2: AStyle := cxstylNavy;
    end;
end;

procedure TfrmEstatisticas.cxGrid1DBTableView1StylesGetGroupSummaryStyle(
  Sender: TcxGridTableView; ARow: TcxGridGroupRow; AColumn: TcxGridColumn;
  ASummaryItem: TcxDataSummaryItem; var AStyle: TcxStyle);
begin
    case ARow.Level of
          0: AStyle := cxstyl4;
          1: AStyle := cxstyl4;
          2: AStyle := cxstylNavy;
    end;

end;

procedure TfrmEstatisticas.ExpandGroups;
var
  I: Integer;
begin
   for I := 0 to cxGrid1DBTableView1.DataController.DataControllerInfo.DataGroups.Count -1 do
      if cxGrid1DBTableView1.DataController.DataControllerInfo.DataGroups.Items[I].Level < 2 then
         cxGrid1DBTableView1.DataController.Groups.ChangeExpanding( cxGrid1DBTableView1.DataController.DataControllerInfo.DataGroups.Items[I].RowIndex , True, False );
end;

end.
