unit URegistrosPafEcf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, DB, DBClient, Grids, DBGrids;

type
  TfrmRegistrosDoPafEcf = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    BtnGeraArquivo: TButton;
    PB: TProgressBar;
    DBGrid1: TDBGrid;
    Parcial: TClientDataSet;
    SParcial: TDataSource;
    ParcialDESCRICAO: TStringField;
    ParcialCOD_BARRA: TStringField;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    PB2: TProgressBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtDataFin: TDateTimePicker;
    EdtDataIni: TDateTimePicker;
    ParcialCOD_PRO: TIntegerField;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);



    // VALIDACAO DE ARQUIVO

    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnGeraArquivoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    COD_PROParcial  : String;
    DescricaoParcial : String;
    COD_P: Integer;
  end;

var
  frmRegistrosDoPafEcf: TfrmRegistrosDoPafEcf;


implementation

uses
  UDM, UConsProd;

{$R *.dfm}

procedure TfrmRegistrosDoPafEcf.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close;
end;

procedure TfrmRegistrosDoPafEcf.FormShow(Sender: TObject);
begin

   Parcial.CreateDataSet;
   Parcial.Open;
   EdtDataIni.Date := Date;
   EdtDataFin.Date := Date;
end;

procedure TfrmRegistrosDoPafEcf.BtnGeraArquivoClick(Sender: TObject);
begin
   DM.GeraMovimento( iCaixa, EdtDataIni.Date, EdtDataFin.Date, 0,  '' );
end;

procedure TfrmRegistrosDoPafEcf.Button1Click(Sender: TObject);
begin
   COD_PROParcial := '';
   Application.CreateForm( TfrmConsProd, frmConsProd );
   frmConsProd.Tag := 888;
   frmConsProd.ShowModal;
   if COD_PROParcial <> '' then
      begin
         try
            Parcial.Insert;
             ParcialCOD_BARRA.AsString := COD_PROParcial;
             ParcialDESCRICAO.AsString := DescricaoParcial;
             ParcialCOD_PRO.AsInteger :=  COD_P;
             Parcial.Post;
         except
            if ( SParcial.State = dsEdit ) or ( SParcial.State = dsInsert ) then
               Parcial.Cancel;
         end;
      end;
end;

procedure TfrmRegistrosDoPafEcf.Button2Click(Sender: TObject);
begin
   if not ParcialCOD_BARRA.IsNull then
      begin
         Parcial.Delete;
      end;
end;

procedure TfrmRegistrosDoPafEcf.Button3Click(Sender: TObject);
var
   Str: string;
begin
   if Parcial.IsEmpty then
      begin
         ShowMessage( 'Você precisa selecionar ao menos um produto!' );
         Exit;
      end;
   Parcial.First;
   Str := '';
   while not Parcial.Eof do
      begin
         if Str <> '' then
            Str := Str + ',' + ParcialCOD_PRO.AsString
          else
             Str := ParcialCOD_PRO.AsString;
         Parcial.Next;
      end;

   DM.GeraMovimento( iCaixa, EdtDataIni.Date, EdtDataFin.Date, 0,  Str );
end;



procedure TfrmRegistrosDoPafEcf.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Parcial.EmptyDataSet;
   Parcial.Close;


   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.QConsulta.Close;
   Action:= caFree;
   Self := nil;
end;

procedure TfrmRegistrosDoPafEcf.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;



//SP_VERIFICA_PRO_ESTOQUE
end.
