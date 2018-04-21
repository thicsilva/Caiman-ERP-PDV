unit ULMFData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls;

type
  TFrmLMFData = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    BtnOk: TButton;
    BtnCancelar: TButton;
    StatusBar1: TStatusBar;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    BtnMenuFiscal: TButton;
    procedure FormShow(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnMenuFiscalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLMFData: TFrmLMFData;

implementation
Uses UDM, UECF, UMenuFiscal;

{$R *.dfm}

procedure TFrmLMFData.FormShow(Sender: TObject);
begin

   edtdataini.Date:= date;
   edtdatafin.Date:= date;
   edtdataini.SetFocus;
end;

procedure TFrmLMFData.BtnCancelarClick(Sender: TObject);
begin
   close;
end;

procedure TFrmLMFData.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action:= caFree;
   Self := nil;
end;

procedure TFrmLMFData.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmLMFData.BtnOkClick(Sender: TObject);
begin
   if edtdatafin.Date < edtdataini.Date then
      begin
         showmessage('A data final não pode ser menor que a data inicial');
         edtdataini.SetFocus;
         exit;
      end;
   LeituraMFPeriodo(iECF, EdtDataIni.Date, EdtDataFin.Date, true);
end;

procedure TFrmLMFData.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close;
end;

procedure TFrmLMFData.BtnMenuFiscalClick(Sender: TObject);
begin
   Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
   FrmMenuFiscal.showmodal;
end;

end.
