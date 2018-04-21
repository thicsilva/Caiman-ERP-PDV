unit UFBalanca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, acPNG, ExtCtrls, StdCtrls, sLabel, ACBrBase, ACBrBAL, UVendasCaixa,
  jpeg;

type
  TfrmBalanca = class(TForm)
    Image1: TImage;
    Kilos: TsLabelFX;
    Stat: TsLabelFX;
    Balanca: TACBrBAL;
    Fecha: TTimer;
    Ler: TTimer;
    sLabelFX1: TsLabelFX;
    procedure FormShow(Sender: TObject);
    procedure BalancaLePeso(Peso: Double; Resposta: AnsiString);
    procedure FechaTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    iFecha: Integer;
  public
    { Public declarations }
    ErroBalanca: Boolean;
    Quant: Currency;
  end;

var
  frmBalanca: TfrmBalanca;

implementation

uses
  UDM, UMenuFiscal;

{$R *.dfm}

procedure TfrmBalanca.BalancaLePeso(Peso: Double; Resposta: AnsiString);
var
  valid : integer;
begin
   Kilos.Caption     := formatFloat('##0.000', Peso ) + '  KG';
   //sttResposta.Caption := Converte( Resposta ) ;
   Errobalanca := false;
   if Peso > 0 then
      begin
         Balanca.Desativar;
         Errobalanca := false;
         Quant := Peso;
         Fecha.Enabled := true;
         application.ProcessMessages;
         exit;
      end
   else
    begin
      valid := Trunc(Balanca.UltimoPesoLido);
      case valid of
         0 : begin
             Kilos.Caption := 'LENDO PESO...' ;
             application.ProcessMessages;
             ErroBalanca := true;
         end;
        -1 : begin
            kilos.Caption := 'Peso Instavel';
            application.ProcessMessages;
            ErroBalanca := true;
            ler.Enabled := True;

        end;
        -2 : begin
            kilos.Caption := 'Peso Negativo';
            application.ProcessMessages;
            ErroBalanca := true;
            ler.Enabled := True;
        end;
        -10: begin
            kilos.Caption := 'Sobrepeso';
            application.ProcessMessages;
            ErroBalanca := true;
            ler.Enabled := True;
        end;
        else begin
            kilos.Caption := 'LENDO PESO...';
            application.ProcessMessages;
            ErroBalanca := true;
            ler.Enabled := True;
        end;
      end;
    end ;
    Application.ProcessMessages;
end;

procedure TfrmBalanca.FechaTimer(Sender: TObject);
begin
   ifecha := ifecha - 1;
   if iFecha <= 0 then
      begin
         Close;
      end
   else
      Stat.Caption := 'Tecle esc para sair + ' + inttostr( iFecha );
end;

procedure TfrmBalanca.FormCreate(Sender: TObject);
begin
   dm.ScaleForm( Self, False );
end;

procedure TfrmBalanca.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = vk_escape then
      begin
         if Quant <= 0 then
            ErroBalanca := true;
         Close;
      end;
   if (ssAlt in Shift) and (chr(Key) in ['M', 'm']) then
      begin
         if (iCodPreVenda = 0) and (iCodOrcamento = 0) and (iCodOrdemServico = 0) and (iCodigoVenda = 0) and (iCodContaCliente = 0) then
            begin
               Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
               FrmMenuFiscal.showmodal;
            end;
      end;
end;

procedure TfrmBalanca.FormShow(Sender: TObject);
begin
   DM.CriaImg;
   dm.CarregaImagem2( dm.FundoBalanca, dm.ImgTempCia );
   Image1.Picture.Bitmap.Assign( DM.ImgTempCia );
   DM.DestroyImg;

   Fecha.Enabled := False;
   Brush.Style := bsClear;
   ErroBalanca := False;
   ifecha := 3;
   Quant := 0;
   kilos.Caption := 'LENDO PESO...';
   // configura porta de comunicação
   try
   Balanca.Modelo           := TACBrBALModelo( iIndiceBalanca );
   Balanca.Device.Baud      := iBaud;
   Balanca.Device.Porta     := 'COM' + IntToStr( iPorta );

   // Conecta com a balança
   Balanca.Ativar;
   Application.ProcessMessages;
   ler.Enabled := true;
   except
      Kilos.Caption := 'ERRO BALANCA';
      Errobalanca := true;
      Fecha.Enabled := True;
   end;

end;

procedure TfrmBalanca.LerTimer(Sender: TObject);
begin
   Ler.Enabled := false;
   Balanca.LePeso(1000);
end;

end.
