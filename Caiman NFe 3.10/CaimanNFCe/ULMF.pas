unit ULMF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, dxCore, ExtCtrls, ComCtrls, StdCtrls;

type
  TFrmLMF = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    LabelTitulo: TLabel;
    GBData: TGroupBox;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    Label1: TLabel;
    GBCRZ: TGroupBox;
    Label2: TLabel;
    EdtCRZInicial: TEdit;
    Label3: TLabel;
    EdtCRZFinal: TEdit;
    BtnImprimir: TButton;
    BtnGravarEspelho: TButton;
    RdgPeriodo: TRadioButton;
    RdgCRZ: TRadioButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtCRZInicialEnter(Sender: TObject);
    procedure EdtCRZFinalEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarEspelhoClick(Sender: TObject);
    procedure RdgPeriodoClick(Sender: TObject);
    procedure RdgCRZClick(Sender: TObject);
    procedure EdtCRZInicialKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLMF: TFrmLMF;

implementation
uses
  UECF, Udm;
var  iControle : integer;

{$R *.dfm}

procedure TFrmLMF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close;
end;

procedure TFrmLMF.BtnImprimirClick(Sender: TObject);
var bAux : boolean;
begin
   if iECF = 99 then
      Exit;
   if FrmLMF.Tag = 0 then
      bAux:= true    //completa
   else
      bAux:= false;  //resumida

   case iControle of
     0: leituraMFPeriodo(iECF, EdtDataIni.Date, EdtDataFin.Date, bAux); // por data
     1: begin     // por reducao
   try
       StrToInt( EdtCRZInicial.Text );
       StrToInt( EdtCRZFinal.Text );
   except
        showmessage('Verifique as Reduções digitadas');
         EdtCRZInicial.SetFocus;
         Exit;
   end;

             if strtoint(EdtCRZInicial.Text) > strtoint(EdtCRZFinal.Text) then
                begin
                   showmessage('A Redução Final esta menor que Redução Inicial');
                   EdtCRZInicial.SetFocus;
                   exit
                end;
             LeituraMFReducao(iECF, strtoint(EdtCRZInicial.Text), strtoint(EdtCRZFinal.Text), bAux);
        end;
   end;
end;

procedure TFrmLMF.FormShow(Sender: TObject);
begin

   {RdgPeriodo.Checked:= true;
   if FrmLMF.Tag = 1 then
      BtnGravarArquivo.Enabled:= false;}
end;

procedure TFrmLMF.EdtCRZInicialEnter(Sender: TObject);
begin
   EdtCRZInicial.SelectAll;
end;

procedure TFrmLMF.EdtCRZFinalEnter(Sender: TObject);
begin
   EdtCRZFinal.SelectAll;
end;

procedure TFrmLMF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
   Self := nil;
end;

procedure TFrmLMF.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmLMF.BtnGravarEspelhoClick(Sender: TObject);
var bAux : boolean;
begin


   StatusBar1.Panels[1].Text:= 'Aguarde...';
   StatusBar1.Refresh;

   if FrmLMF.Tag = 0 then
      bAux:= true    //completa
   else
      bAux:= false;  //resumida

   case iControle of
     0: EspelhoMFPeriodo(iECF, EdtDataIni.Date, EdtDataFin.Date, bAux); // por data
     1: begin        //por reducao
   try
       StrToInt( EdtCRZInicial.Text );
       StrToInt( EdtCRZFinal.Text );
   except
        showmessage('Verifique as Reduções digitadas');
         EdtCRZInicial.SetFocus;
         exit;
   end;
             if strtoint(EdtCRZInicial.Text) > strtoint(EdtCRZFinal.Text) then
                begin
                   showmessage('A Redução Final esta menor que Redução Inicial');
                   EdtCRZInicial.SetFocus;
                   exit;
                end;
             EspelhoMFReducao(iECF, strtoint(EdtCRZInicial.Text), strtoint(EdtCRZFinal.Text), bAux);


        end;
   end;
   StatusBar1.Panels[1].Text:= '';
end;

procedure TFrmLMF.RdgPeriodoClick(Sender: TObject);
begin
   iControle:= 0;
   GBCRZ.SendToBack;
   LabelTitulo.Caption:= 'Período de Data';
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;
   EdtDataIni.SetFocus;
end;

procedure TFrmLMF.RdgCRZClick(Sender: TObject);
begin
   iControle:= 1;
   GBData.SendToBack;
   LabelTitulo.Caption:= 'Intervalo de CRZ';
   EdtCRZInicial.Clear;
   EdtCRZFinal.Clear;
   EdtCRZInicial.SetFocus;
end;

procedure TFrmLMF.EdtCRZInicialKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

end.
