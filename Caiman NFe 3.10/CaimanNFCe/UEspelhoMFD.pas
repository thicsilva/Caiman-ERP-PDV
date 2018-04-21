unit UEspelhoMFD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, dxCore, ComCtrls, ExtCtrls;

type
  TFrmEspelhoMFD = class(TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    LabelTitulo: TLabel;
    GBData: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    GBCRZ: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    EdtCOOInicial: TEdit;
    EdtCOOFinal: TEdit;
    BtnGravarEspelho: TButton;
    Panel1: TPanel;
    RdgPeriodo: TRadioButton;
    RdgCRZ: TRadioButton;
    BtnSair: TButton;
    procedure BtnSairClick(Sender: TObject);
    procedure RdgPeriodoClick(Sender: TObject);
    procedure RdgCRZClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnGravarEspelhoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GravaArquivoMFD;
    procedure EdtCOOInicialKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEspelhoMFD: TFrmEspelhoMFD;

implementation
uses
  UECF, Udm, UBemaMFD;
var  iControle : integer;

{$R *.dfm}

procedure TFrmEspelhoMFD.BtnSairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmEspelhoMFD.RdgPeriodoClick(Sender: TObject);
begin
   iControle:= 0;
   GBCRZ.SendToBack;
   LabelTitulo.Caption:= 'Período de Data';
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;
   EdtDataIni.SetFocus;
end;

procedure TFrmEspelhoMFD.RdgCRZClick(Sender: TObject);
begin
   iControle:= 1;
   GBData.SendToBack;
   LabelTitulo.Caption:= 'Intervalo de CRZ';
   EdtCOOInicial.Clear;
   EdtCOOFinal.Clear;
   EdtCOOInicial.SetFocus;
end;

procedure TFrmEspelhoMFD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:= caFree;
   Self := nil;
end;

procedure TFrmEspelhoMFD.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmEspelhoMFD.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close;
end;

procedure TFrmEspelhoMFD.BtnGravarEspelhoClick(Sender: TObject);
begin
   if iECF = 99 then
      Exit;
   StatusBar1.Panels[1].Text:= 'Aguarde...';
   StatusBar1.Refresh;

   case FrmEspelhoMFD.Tag of
      0: begin  // ESPELHO MFD
            if iControle = 0 then // data
                EspelhoMDFPerido(iECF, EdtDataIni.Date, EdtDataFin.Date)
            else
               EspelhoMDFCOO(iECF, strtoint(EdtCOOInicial.Text), strtoint(EdtCOOFinal.Text));
         end;
      1: begin  // ARQUIVO MFD
            if bMFD then
               GravaArquivoMFD
            else
               ShowMessage(sMensagemECF);
         end;
   end;

   StatusBar1.Panels[1].Text:= '';
   StatusBar1.Refresh;
   showmessage('Processo Concluído');
end;

procedure TFrmEspelhoMFD.FormShow(Sender: TObject);
begin

   if FrmEspelhoMFD.Tag = 0 then
      BtnGravarEspelho.Caption:= '&Gravar Espelho MFD'
   else
      BtnGravarEspelho.Caption:= '&Gravar Arquivo MFD';

   RdgPeriodo.Checked:= true;
end;

procedure TFrmEspelhoMFD.GravaArquivoMFD;
var sArquivoMFD  : string;
    sArquivo1704 : string;
    sTipo        : string;
    sUsuario     : string;
    sCMD         : string;
    sRazao, sEnd : string;
    sModeloECF   : string;

    sArquivoTXT  : string;
    sFormato     : string;
    sTipoDownload: string;
    sLinha       : string;
    sDataInicial : string;
    sDataFinal   : string;
    sCOOInicial  : string;
    sCOOFinal    : string;

    cArqTemp     : TextFile;
    cArqTempTXT  : TextFile;

    Texto : TStringList;
begin
   sArquivo1704  := 'C:\PAF_ECF\MFD_DATA.txt';
   if RdgPeriodo.Checked then
      begin
         dm.ECF.PafMF_MFD_Cotepe1704( Edtdataini.Date, edtDatafin.Date, sArquivo1704 );
      end
   else
      begin
         dm.ECF.PafMF_MFD_Cotepe1704( StrToInt( edtCooInicial.Text),  StrToInt( edtCooFinal.Text), sArquivo1704 );
      end;
   ShowMessage( 'Arquivo gravado em : ' + #13 +sArquivo1704 );

   DM.AssinaturaDigital(sArquivo1704);

end;

procedure TFrmEspelhoMFD.EdtCOOInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

end.
