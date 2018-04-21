unit UConsNovo;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms,
  Dialogs, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013White,
  dxSkinsdxStatusBarPainter, dxStatusBar, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, Data.DB;

type
  TFrmConsNovo = class( UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid: TDBGrid;
    Panel3: TPanel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    ComboCons: TComboBox;
    EdtCons: TEdit;
    LTipo: TLabel;
    BtnOK: TBitBtn;
    BtnLocalizar: TBitBtn;
    BtnSair: TBitBtn;
    StatusBar1: TdxStatusBar;
    procedure FormShow(Sender: TObject);
    procedure EdtConsKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairClick(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboConsChange(Sender: TObject);
    procedure DBGridColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsNovo: TFrmConsNovo;

implementation

uses UDM, UDicLib;

{$R *.dfm}

procedure TFrmConsNovo.FormShow(Sender: TObject);
begin

   EdtCons.Clear;
   ComboCons.ItemIndex:= 0;
   ComboConsChange(ComboCons);
   ComboCons.SetFocus;
end;

procedure TFrmConsNovo.EdtConsKeyPress(Sender: TObject; var Key: Char);
begin
   if ComboCons.ItemIndex = 2 then
      begin
         if not (key in ['0'..'9', #13, #8, '.']) then
            key:= #0;
      end;
end;

procedure TFrmConsNovo.FormCreate(Sender: TObject);
begin
   TDicLib.MontaTelaUsu( iCodUsu, Self, DM.IBDatabase );
end;

procedure TFrmConsNovo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
     close;
end;

procedure TFrmConsNovo.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsNovo.BtnSairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmConsNovo.DBGridColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
   TDicLib.GravarGridDB( iCodUsu, Sender, Self,  dm.IBDatabase);
end;

procedure TFrmConsNovo.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f3 then
     edtcons.SetFocus;
end;

procedure TFrmConsNovo.ComboConsChange(Sender: TObject);
begin
   EdtCons.Clear;
   case ComboCons.ItemIndex of
    0: LTipo.Caption:= 'Palavra chave';
    1: LTipo.Caption:= 'Nome';
    2: LTipo.Caption:= 'Código';
   end;
end;

end.




