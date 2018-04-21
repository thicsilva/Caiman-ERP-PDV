unit UCadNovo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Buttons, ImgList, ToolWin,
  Grids, ExtDlgs, rxCurrEdit, DateUtils, DBGrids, RzCmboBx, RzDBCmbo, DBCtrls,
  StdCtrls, Mask, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013White, dxSkinsdxStatusBarPainter,
  dxStatusBar, cxPC, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  UNovosComponentes, UNovoFormulario, System.ImageList;


type
  TFrmCadastroNovo = class(UNovoFormulario.TForm)
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
    SB: TdxStatusBar;
    BarraMenu: TcxImageList;
    Shape1: TShape;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Saindo: Boolean;
    const

  public
    { Public declarations }
  end;

var
  FrmCadastroNovo: TFrmCadastroNovo;

implementation

uses
  UNovoPrincipal, UDialog;

{$R *.dfm}


procedure TFrmCadastroNovo.BtnCancelarClick(Sender: TObject);
var
   I:Integer;
begin

  for I := 0 to Self.ComponentCount - 1 do
       begin
          if ( Components[I] is TEdit ) then
              begin
                 TEdit( Components[I] ).Color := clWindow;
                 if  TEdit( Components[I] ).ReadOnly then
                    TEdit( Components[I] ).Color := CorReadOnly;
              end;
          if ( Components[I] is TEdit ) then
             begin
                TEdit( Components[I] ).Color := clWindow;
                 if  TEdit( Components[I] ).ReadOnly then
                    TEdit( Components[I] ).Color := CorReadOnly;
             end;
          if ( Components[I] is TMaskEdit ) then
             begin
                TMaskEdit( Components[I] ).Color := clWindow;
                 if  TMaskEdit( Components[I] ).ReadOnly then
                    TMaskEdit( Components[I] ).Color := CorReadOnly;
             end;
          if ( Components[I] is TComboBox ) then
             begin
                TComboBox( Components[I] ).Color := clWindow;
             end;
          if ( Components[I] is TMemo ) then
             begin
                TMemo( Components[I] ).Color := clWindow;
                 if  TMemo( Components[I] ).ReadOnly then
                    TMemo( Components[I] ).Color := CorReadOnly;
             end;
          if ( Components[I] is TCurrencyEdit ) then
             begin
                TCurrencyEdit( Components[I] ).Color := clWindow;
                 if  TCurrencyEdit( Components[I] ).ReadOnly then
                    TCurrencyEdit( Components[I] ).Color := CorReadOnly;
             end;
       end;

end;

procedure TFrmCadastroNovo.BtnExcluirClick(Sender: TObject);
var
   I:Integer;
begin

  for I := 0 to Self.ComponentCount - 1 do
       begin
          if ( Components[I] is TEdit ) then
              begin
                 TEdit( Components[I] ).Color := clWindow;
                 if  TEdit( Components[I] ).ReadOnly then
                    TEdit( Components[I] ).Color := CorReadOnly;
              end;
          if ( Components[I] is TEdit ) then
             begin
                TEdit( Components[I] ).Color := clWindow;
                 if  TEdit( Components[I] ).ReadOnly then
                    TEdit( Components[I] ).Color := CorReadOnly;
             end;
          if ( Components[I] is TMaskEdit ) then
             begin
                TMaskEdit( Components[I] ).Color := clWindow;
                 if  TMaskEdit( Components[I] ).ReadOnly then
                    TMaskEdit( Components[I] ).Color := CorReadOnly;
             end;
          if ( Components[I] is TComboBox ) then
             begin
                TComboBox( Components[I] ).Color := clWindow;
             end;
          if ( Components[I] is TMemo ) then
             begin
                TMemo( Components[I] ).Color := clWindow;
                 if  TMemo( Components[I] ).ReadOnly then
                    TMemo( Components[I] ).Color := CorReadOnly;
             end;
          if ( Components[I] is TCurrencyEdit ) then
             begin
                TCurrencyEdit( Components[I] ).Color := clWindow;
                 if  TCurrencyEdit( Components[I] ).ReadOnly then
                    TCurrencyEdit( Components[I] ).Color := CorReadOnly;
             end;
       end;

end;


procedure TFrmCadastroNovo.BtnGravarClick(Sender: TObject);
var
    I: Integer;
    CampoSemPreencher: Boolean;
begin
    CampoSemPreencher := False;
   for I := 0 to Self.ComponentCount - 1 do
       begin                               //TMemo
          if ( Self.Components[I] is TEdit ) then
             begin
                if TEdit( Components[I] ).Obrigatorio then
                    begin
                       if TEdit( Components[I] ).Text = ''  then
                          begin
                              TEdit( Components[I] ).Color := $00B0B0FF;
                              CampoSemPreencher := True;
                          end
                       else
                         TEdit( Components[I] ).Color := clWindow;
                    end;
             end;
          if ( Self.Components[I] is TEdit ) then
             begin
                   if TEdit( Components[I] ).Obrigatorio then
                    begin
                       if TEdit( Components[I] ).Text = ''  then
                          begin
                              TEdit( Components[I] ).Color := $00B0B0FF;
                              CampoSemPreencher := True;
                          end
                       else
                         TEdit( Components[I] ).Color := clWindow;
                    end;

             end;
          if ( Self.Components[I] is TMaskEdit ) then
             begin
                if TMaskEdit( Components[I] ).Obrigatorio then
                    begin
                       if TMaskEdit( Components[I] ).Text = ''  then
                          begin
                             TMaskEdit( Components[I] ).Color := $00B0B0FF;
                             CampoSemPreencher := True;
                          end
                       else
                         TMaskEdit( Components[I] ).Color := clWindow;
                    end;

             end;
          if ( Self.Components[I] is TComboBox ) then
             begin
                 if TComboBox( Components[I] ).Obrigatorio then
                    begin
                       if TComboBox( Components[I] ).ItemIndex = -1 then
                          begin
                             TComboBox( Components[I] ).Color := $00B0B0FF;
                             CampoSemPreencher := True;
                          end
                       else
                         TComboBox( Components[I] ).Color := clWindow;
                    end;

             end;
          if ( Self.Components[I] is TCurrencyEdit )then
              begin
                if TCurrencyEdit( Components[I] ).Obrigatorio then
                    begin
                       if TCurrencyEdit( Components[I] ).Value = 0  then
                          begin
                             TCurrencyEdit( Components[I] ).Color := $00B0B0FF;
                             CampoSemPreencher := True;
                          end
                       else
                         TCurrencyEdit( Components[I] ).Color := clWindow;
                    end;
              end;

       end;
    if CampoSemPreencher then
       begin
           KDialog( 'Preencha todos os campos obrigatórios!' );
           Abort;
           Exit;
       end;
end;

procedure TFrmCadastroNovo.BtnNovoClick(Sender: TObject);
var
   I:Integer;
begin

  for I := 0 to Self.ComponentCount - 1 do
       begin
          if ( Components[I] is TEdit ) then
              begin
                 TEdit( Components[I] ).Color := clWindow;
                 if  TEdit( Components[I] ).ReadOnly then
                    TEdit( Components[I] ).Color := CorReadOnly;
              end;
          if ( Components[I] is TEdit ) then
             begin
                TEdit( Components[I] ).Color := clWindow;
                 if  TEdit( Components[I] ).ReadOnly then
                    TEdit( Components[I] ).Color := CorReadOnly;
             end;
          if ( Components[I] is TMaskEdit ) then
             begin
                TMaskEdit( Components[I] ).Color := clWindow;
                 if  TMaskEdit( Components[I] ).ReadOnly then
                    TMaskEdit( Components[I] ).Color := CorReadOnly;
             end;
          if ( Components[I] is TComboBox ) then
             begin
                TComboBox( Components[I] ).Color := clWindow;
             end;
          if ( Components[I] is TMemo ) then
             begin
                TMemo( Components[I] ).Color := clWindow;
                 if  TMemo( Components[I] ).ReadOnly then
                    TMemo( Components[I] ).Color := CorReadOnly;
             end;
          if ( Components[I] is TCurrencyEdit ) then
             begin
                TCurrencyEdit( Components[I] ).Color := clWindow;
                 if  TCurrencyEdit( Components[I] ).ReadOnly then
                    TCurrencyEdit( Components[I] ).Color := CorReadOnly;
             end;
       end;

end;


procedure TFrmCadastroNovo.BtnSairClick(Sender: TObject);
begin
   Saindo := True;
   if Parent is TcxTabSheet then
      frmMenu.FTDI.CloseTabOfForm( TFormClass( Self.ClassType ) )
   else
      close;
end;

procedure TFrmCadastroNovo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if BtnCancelar.Enabled then
      BtnCancelar.Click;
end;

procedure TFrmCadastroNovo.FormCreate(Sender: TObject);
begin
   Saindo := False;
end;

procedure TFrmCadastroNovo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
   case key of
     VK_ESCAPE:  begin
                     BtnSairClick( nil );
                     Abort;
                     Exit;
                 end;
     vk_f3: begin
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
{     VK_RETURN: begin
                   SelectNext(ActiveControl, true, true);
                end;}
   end;
end;

end.













