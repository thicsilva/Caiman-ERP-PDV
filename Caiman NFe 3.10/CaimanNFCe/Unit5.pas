unit Unit5;

{$IFDEF FPC}
 {$mode objfpc}{$H+}
{$ENDIF}

interface

uses
  Classes, SysUtils,
   Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons, ExtCtrls,
  ACBrTEFDCliSiTef, acPNG, sLabel, Mask, RxToolEdit, RxCurrEdit, jpeg;

type

{$IFNDEF FPC}
 {$R *.dfm}
{$ELSE}
 {$R *.lfm}
{$ENDIF}

{ TForm5 }

  TForm5 = class(TForm)
    Image1: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Titulo: TsLabelFX;
    Edit1: TCurrencyEdit;
    Edit2: TEdit;
    EdtData: TMaskEdit;
     procedure Edit1KeyPress(Sender : TObject; var Key : char);
     procedure FormCloseQuery(Sender : TObject; var CanClose : boolean);
     procedure FormCreate(Sender : TObject);
     procedure FormShow(Sender : TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    TipoCampo : Integer;
    Operacao  : TACBrTEFDCliSiTefOperacaoCampo;
    TamanhoMinimo, TamanhoMaximo : Integer ;
  end;

function valida(MesAno: String): Boolean;

var
  Form5 : TForm5; 

implementation

uses UDM;

{ TForm5 }

procedure TForm5.FormCreate(Sender : TObject);
begin
   dm.ScaleForm( Self, False );
     TamanhoMinimo := 0 ;
  TamanhoMaximo := 0 ;
  Operacao      := tcString;
  TipoCampo     := 0 ;
end;

procedure TForm5.BitBtn1Click(Sender: TObject);

begin
   if EdtData.Visible then
      begin
         if not valida( EdtData.Text ) then
            begin
               ShowMessage( 'Data Inválida! ');
               Exit;
            end;

      end;
   ModalResult := mrOk;
end;

procedure TForm5.Edit1KeyPress(Sender : TObject; var Key : char);
begin
   if Key in [#13,#8] then exit ;  { Enter e BackSpace, OK }

   if Operacao in [tcDouble, tcCMC7] then
      if not (Key in ['0'..'9', FormatSettings.DecimalSeparator]) then    { Apenas números }
         Key := #0 ;

   if (TamanhoMaximo > 0) and (Length( Edit1.Text ) >= TamanhoMaximo) then
      Key := #0 ;
end;

procedure TForm5.FormCloseQuery(Sender : TObject; var CanClose : boolean);
begin
   if (ModalResult = mrOK) and (TamanhoMinimo > 0) then
   begin
      if Length( Edit1.Text ) < TamanhoMinimo then
      begin
         ShowMessage('O Tamanho Mínimo para este campo e: '+IntToStr(TamanhoMinimo) );
         CanClose := False ;
         Edit1.SetFocus;
      end;
   end;
end;

procedure TForm5.FormShow(Sender : TObject);
begin
//   Brush.Style := bsClear;
   if Operacao = tcDouble then
      Edit1.Text := '0,00' ;
   if Edit2.Visible then
      Edit2.SetFocus
   else
      if EdtData.Visible then
          EdtData.SetFocus
          else
             Edit1.SetFocus;
   Edit1.Color := dm.BuscaCor( dm.FundoEntradaTef, Edit1.Left, Edit1.Top );
   Edit2.Color := Edit1.Color;
   EdtData.Color :=Edit1.Color;
   DM.CriaImg;
   dm.CarregaImagem2( dm.FundoEntradaTef, dm.ImgTempCia );
   Image1.Picture.Bitmap.Assign( DM.ImgTempCia );
   DM.DestroyImg;


end;


function valida(MesAno: String): Boolean;
var Mes, Ano: Integer;
Begin
Mes := StrToInt(copy(MesAno, 1, 2));

Result := (Mes >= 1) and (Mes <= 12);
End;

end.

