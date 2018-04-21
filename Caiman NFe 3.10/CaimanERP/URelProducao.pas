unit URelProducao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet;

type
  TFrmRelProducao = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    BtnVis: TBitBtn;
    BtnSair: TBitBtn;
    frxProducao: TfrxReport;
    Producao: TfrxDBDataset;
    QItens: TFDQuery;
    DateField1: TDateField;
    IntegerField1: TIntegerField;
    BCDField1: TBCDField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    IntegerField3: TIntegerField;
    StringField2: TStringField;
    StringField3: TStringField;
    FMTBCDField1: TFMTBCDField;
    itens: TfrxDBDataset;
    QProducao: TFDQuery;
    QProducaoDATA: TDateField;
    QProducaoCODIGO: TIntegerField;
    QProducaoQUANT: TBCDField;
    QProducaoCOD_PRO: TIntegerField;
    QProducaoNOME_PRO: TStringField;
    QProducaoFANTASIA_EMP: TStringField;
    dsNested: TDataSource;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelProducao: TFrmRelProducao;

implementation

{$R *.dfm}

uses UDM;

procedure TFrmRelProducao.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelProducao.BtnVisClick(Sender: TObject);
var
   RelFile: String;
begin
   RelFile := ExtractFilePath( Application.ExeName ) + 'Report\Producao.fr3';
   if not FileExists( RelFile ) then
      begin
         AlertaCad( 'Arquivo Producao.fr3 não encontrado!' );
         Exit;
      end;
   frxProducao.LoadFromFile( RelFile );

   QProducao.Close;
   QProducao.Params[0].AsInteger := iEmp;
   QProducao.Params[1].AsDate := EdtDataIni.Date;
   QProducao.Params[2].AsDate := EdtDataFin.Date;
   QProducao.Open;
   frxProducao.Variables['periodo'] := QuotedStr('Período: '+FormatDateTime('dd/mm/yyyy', EdtDataIni.Date)+ ' até '+FormatDateTime('dd/mm/yyyy', EdtDataFin.Date));

   frxProducao.ShowReport( true );

end;

procedure TFrmRelProducao.FormCreate(Sender: TObject);
begin
  EdtDataIni.Date := Date;
  EdtDataFin.Date := Date;
end;

end.
