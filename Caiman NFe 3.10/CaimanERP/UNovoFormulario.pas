unit UNovoFormulario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Dialogs, 
  StdCtrls, ExtCtrls, Buttons, Menus, Mask, RxToolEdit, RxCurrEdit, Ubibli1, 
  ComCtrls, sSpeedButton, Forms, UNovosComponentes;

type
   TForm = class( Forms.TForm )
       private
          FPanelFecha: TPanel;
          const
             CorReadOnly:  TColor = clWindow;
       public
           function ShowModal: Integer; override;
           constructor Create(AOwner: TComponent); override;
  end;
implementation

{ TForm }

constructor TForm.Create(AOwner: TComponent);
var
  I: Integer;
begin
  inherited;
  //if Self.Name <> 'FrmMenu' then
   //  Self.FormStyle := fsStayOnTop;
  Self.Color := clWhite;
  for I := 0 to Self.ComponentCount - 1 do
       begin
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
  if Position = poDesktopCenter then
       Position := poScreenCenter;
end;

function TForm.ShowModal: Integer;
begin
   PopupParent := nil;
   Parent := nil;
   Refresh;
   Repaint;
   inherited;
end;

end.


