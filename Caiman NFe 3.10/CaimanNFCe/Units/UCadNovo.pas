unit UCadNovo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ImgList, ToolWin, acAlphaImageList;

type
  TFrmCadastroNovo = class(TForm)
    SB: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    BtnNovo: TToolButton;
    BtnGravar: TToolButton;
    BtnCancelar: TToolButton;
    BtnAlterar: TToolButton;
    BtnExcluir: TToolButton;
    ToolButton6: TToolButton;
    BtnConsultar: TToolButton;
    BtnSair: TToolButton;
    ImageList3: TsAlphaImageList;
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageList: TImageList;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroNovo: TFrmCadastroNovo;

implementation

{$R *.dfm}

procedure TFrmCadastroNovo.BtnSairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmCadastroNovo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
     vk_escape : BtnSair.Click;
     vk_f2: begin
               if (BtnConsultar.Enabled) and (BtnNovo.Enabled) then
                  BtnConsultar.Click;
            end;
     vk_f5: begin
               if btnnovo.Enabled then
                  btnnovo.Click;
            end;
     vk_f6: begin
               if btngravar.Enabled then
                  btngravar.Click;
            end;
     vk_f7: begin
               if btncancelar.Enabled then
                  btncancelar.Click;
            end;
     vk_f8: begin
               if btnalterar.Enabled then
                  btnalterar.Click;
            end;
     vk_f9: begin
               if btnexcluir.Enabled then
                  btnexcluir.Click;
            end;
   end;
end;

procedure TFrmCadastroNovo.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      begin
         key:= #0;
         SelectNext(ActiveControl, true, true);
      end;
end;

end.
