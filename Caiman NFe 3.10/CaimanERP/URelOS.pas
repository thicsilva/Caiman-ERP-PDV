unit URelOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls,
  JvExStdCtrls, JvCombobox, JvDBSearchComboBox, Vcl.ComCtrls, JvExControls,
  JvDBLookup, frxClass, frxDBSet, frxExportPDF;

type
  TfrmRelOS = class(TForm)
    grp1: TGroupBox;
    edtDataIni: TDateTimePicker;
    edtDataFim: TDateTimePicker;
    GroupBox2: TGroupBox;
    pnl1: TPanel;
    btnVisualizar: TButton;
    QFuncionario: TFDQuery;
    QFuncionarioCOD_FUN: TIntegerField;
    QFuncionarioNOME_FUN: TStringField;
    dsFuncionario: TDataSource;
    QRelOS: TFDQuery;
    QRelOSID_OS: TIntegerField;
    QRelOSNOME_FUN: TStringField;
    QRelOSNOME_CLI: TStringField;
    QRelOSSIT: TStringField;
    QRelOSVALOR_DESCONTO: TFloatField;
    QRelOSVALOR_SERVICOS: TFloatField;
    QRelOSDATA_CADASATRO: TDateField;
    QRelOSVALOR_ITENS: TFloatField;
    QRelOSVALOR_TOTAL: TFloatField;
    edttecnico: TJvDBLookupCombo;
    frxPDFExport1: TfrxPDFExport;
    frxOS: TfrxDBDataset;
    frxFROS: TfrxReport;
    FDTROS: TFDTransaction;
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelOS: TfrmRelOS;

implementation

{$R *.dfm}

uses UDM;

procedure TfrmRelOS.btnVisualizarClick(Sender: TObject);
var
   RelFile: String;
begin
   RelFile := ExtractFilePath( Application.ExeName ) + 'Report\relos.fr3';
   if not FileExists( RelFile ) then
      begin
         AlertaCad( 'Arquivo relos.fr3 não encontrado!' );
         Exit;
      end;
   frxFROS.LoadFromFile( RelFile );
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;

   if edttecnico.Text = edttecnico.DisplayEmpty then
     begin
       MessageDlg('Selecione um Técnico !', mtInformation, [mbOK],0) ;
       edttecnico.SetFocus;
       Exit;
     end;
   QRelOS.Close;
   QRelOS.SQL.Clear;

   QRelOS.SQL.Text := 'SELECT OS.ID_OS, F.NOME_FUN, C.NOME_CLI, CASE WHEN OS.SITUACAO = ''F'' THEN ''Fechado'' ELSE ''Aberto'' END SIT, '+
                      '       OS.VALOR_DESCONTO, OS.VALOR_SERVICOS, OS.DATA_CADASATRO, '+
                      '       COALESCE((SELECT SUM(OSI.QUANTIDADE * OSI.VALOR_UNITARIO) FROM OS_ITEM OSI WHERE OSI.ID_OS = OS.ID_OS),0) AS  VALOR_ITENS,'+
                      '       (OS.VALOR_SERVICOS + COALESCE((SELECT SUM(OSI.QUANTIDADE * OSI.VALOR_UNITARIO) FROM OS_ITEM OSI WHERE OSI.ID_OS = OS.ID_OS),0)) - OS.VALOR_DESCONTO AS VALOR_TOTAL '+
                      '  FROM OS '+
                      '       LEFT OUTER JOIN CLIENTE C ON(C.COD_CLI = OS.ID_CLIENTE) '+
                      '       LEFT OUTER JOIN FUNCIONARIO F ON(F.COD_FUN = OS.TECNICO) '+
                      '  WHERE OS.DATA_CADASATRO BETWEEN '''+FormatDateTime('DD.MM.YYYY', edtDataIni.Date)+''' AND '''+FormatDateTime('DD.MM.YYYY', edtDataFim.Date)+''' '+
                      '    AND OS.TECNICO = '+edttecnico.KeyValue +
                      '   ORDER BY F.NOME_FUN, OS.DATA_CADASATRO ';

   QRelOS.Open;
   frxFROS.Variables['VENDEDOR'] := QuotedStr( QRelOS.FieldByName('NOME_FUN').AsString );
   frxFROS.Variables['DATAINI'] := QuotedStr( FormatDateTime('DD/MM/YYYY', edtDataIni.Date) );
   frxFROS.Variables['DATAFIN'] := QuotedStr( FormatDateTime('DD/MM/YYYY', edtDataFim.Date) );
   frxFROS.PrepareReport();
   frxFROS.ShowReport();
   QRelOS.Close;
end;

procedure TfrmRelOS.FormShow(Sender: TObject);
begin
  edtDataIni.Date := Date;
  edtDataFim.Date := Date;
  QFuncionario.Open;
end;

end.
