unit UMovimentoPorECF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, DB;

type
  TFrmMovimentoPorECF = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    BtnOK: TButton;
    BtnSair: TButton;
    GroupBox1: TGroupBox;
    EdtDataFin: TDateTimePicker;
    EdtDataIni: TDateTimePicker;
    GroupBox2: TGroupBox;
    ComboECF: TComboBox;
    Label1: TLabel;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BuscaECFs;
    procedure BtnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMovimentoPorECF: TFrmMovimentoPorECF;

implementation
uses
  Udm, Ubibli1;

{$R *.dfm}

procedure TFrmMovimentoPorECF.BtnSairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmMovimentoPorECF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:= caFree;
   Self := nil;
end;

procedure TFrmMovimentoPorECF.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmMovimentoPorECF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close;
end;

procedure TFrmMovimentoPorECF.FormShow(Sender: TObject);
begin

   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;
   buscaECFs;
   ComboECF.ItemIndex:= 0;
   edtDataini.SetFocus;
end;

procedure TFrmMovimentoPorECF.BuscaECFs;
begin
   ComboECF.Clear;
   ComboECF.Items.Add('Todas');

   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   with dm.QConsultaServer do
      begin
         close;
         sql.Clear;
         sql.Text:= 'SELECT COD_CAI, R01_NUMERO_SERIE ' +
                    'FROM CAIXA ' +
                    'WHERE COD_EMP = :CODEMP AND R01_NUMERO_SERIE IS NOT NULL ' +
                    'ORDER BY COD_CAI';
         Parambyname('codemp').AsInteger:= iEmp;
         open;
         while not eof do
            begin
               ComboECF.Items.Add('ECF: '+ FormataStringD(fieldbyname('cod_cai').AsString, '3', '0') + '    NS: ' + fieldbyname('r01_numero_serie').AsString);
               next;
            end;
      end;
   dm.IBTRServer.Commit;
   dm.QConsultaServer.Close;
end;

procedure TFrmMovimentoPorECF.BtnOKClick(Sender: TObject);
var iNumeroECF   : integer;
    i : integer;
begin
   if ComboECF.ItemIndex = 0 then
      begin
         for i:= 1 to ComboECF.Items.Count -1 do
            begin
               iNumeroECF:= strtoint(copy(ComboECF.Items[i], 6, 3));
               dm.GeraMovimento(iNumeroECF, EdtDataIni.Date, EdtDataFin.Date, 0, '');
            end;
      end
   else
      begin
         iNumeroECF:= strtoint(copy(ComboECF.Text, 6, 3));
         dm.GeraMovimento(iNumeroECF, EdtDataIni.Date, EdtDataFin.Date, 0, '');
      end;
end;


end.
