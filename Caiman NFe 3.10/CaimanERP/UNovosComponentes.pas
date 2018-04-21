unit UNovosComponentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Buttons, ImgList, ToolWin,
  Grids, ExtDlgs, rxCurrEdit, DateUtils, DBGrids, DBCtrls,
  StdCtrls, Mask, dxAlertWindow;

type
     TAlertas = class( TObject )
         private
            FAlert: TdxAlertWindowManager;
         public
            constructor Create;
            destructor Destroy; override;
     end;

     TEdit = class( StdCtrls.TEdit )
            private
               FOldColor: TColor;
                FObrigatorio: Boolean;
                procedure SetObrigatorio(const Value: Boolean);
                { Private declarations }
                procedure WMNCPaint( var msg: TWMNCPaint ); message WM_NCPAINT;
            protected
                procedure DoEnter; override;  { Estamos reescrevendo o método DoEnter, para adaptar de acordo com a nossa necessidade}
                procedure DoExit; override;
                procedure Click; override;

            public
               constructor Create(AOwner: TComponent); override;
            published
               property Obrigatorio: Boolean read FObrigatorio write SetObrigatorio;
        end;
     TDBEdit = class( DBCtrls.TDBEdit )
            private
                FOldColor: TColor;
                FObrigatorio: Boolean;
                procedure SetObrigatorio(const Value: Boolean);
                { Private declarations }
                procedure WMNCPaint( var msg: TWMNCPaint ); message WM_NCPAINT;
            protected
                procedure DoEnter; override;  { Estamos reescrevendo o método DoEnter, para adaptar de acordo com a nossa necessidade}
                procedure DoExit; override;
                procedure Click; override;

            public
               constructor Create(AOwner: TComponent); override;
            published
               property Obrigatorio: Boolean read FObrigatorio write SetObrigatorio;
        end;
     TMaskEdit = class( Mask.TMaskEdit )
            private
               FOldColor: TColor;
                FObrigatorio: Boolean;
                procedure SetObrigatorio(const Value: Boolean);
                procedure WMNCPaint( var msg: TWMNCPaint ); message WM_NCPAINT;
            protected
                procedure DoEnter; override;  { Estamos reescrevendo o método DoEnter, para adaptar de acordo com a nossa necessidade}
                procedure DoExit; override;
                procedure Click; override;  { Estamos reescrevendo o método DoExit, para adaptar de acordo com a nossa necessidade}

            public
                constructor Create(AOwner: TComponent); override;
            published
               property Obrigatorio: Boolean read FObrigatorio write SetObrigatorio;
        end;
     TComboBox = class( StdCtrls.TComboBox )
            private
               FOldColor: TColor;
                FObrigatorio: Boolean;
                procedure SetObrigatorio(const Value: Boolean);
                procedure WMNCPaint( var msg: TWMNCPaint ); message WM_NCPAINT;
            protected
                procedure DoEnter; override;  { Estamos reescrevendo o método DoEnter, para adaptar de acordo com a nossa necessidade}
                procedure DoExit; override;
                procedure Click; override;  { Estamos reescrevendo o método DoExit, para adaptar de acordo com a nossa necessidade}

            public
                constructor Create(AOwner: TComponent); override;
            published
               property Obrigatorio: Boolean read FObrigatorio write SetObrigatorio;

        end;
     TMemo = class( StdCtrls.TMemo )
            private
               FOldColor: TColor;
                  FObrigatorio: Boolean;
                  procedure SetObrigatorio(const Value: Boolean);
            protected
                procedure DoEnter; override;  { Estamos reescrevendo o método DoEnter, para adaptar de acordo com a nossa necessidade}
                procedure DoExit; override;
                procedure Click; override;  { Estamos reescrevendo o método DoExit, para adaptar de acordo com a nossa necessidade}

            public
                constructor Create(AOwner: TComponent); override;
            published
               property Obrigatorio: Boolean read FObrigatorio write SetObrigatorio;

        end;
     TCurrencyEdit = class( rxCurrEdit.TCurrencyEdit )
            private
               FOldColor: TColor;
                FObrigatorio: Boolean;
                procedure SetObrigatorio(const Value: Boolean);
                procedure WMNCPaint( var msg: TWMNCPaint ); message WM_NCPAINT;
            protected
                procedure DoEnter; override;  { Estamos reescrevendo o método DoEnter, para adaptar de acordo com a nossa necessidade}
                procedure DoExit; override;
                procedure Click; override;  { Estamos reescrevendo o método DoExit, para adaptar de acordo com a nossa necessidade}

            public
                constructor Create(AOwner: TComponent); override;
            published
               property Obrigatorio: Boolean read FObrigatorio write SetObrigatorio;

        end;
    const
{       CorPadraoFonte: TColor =  clBlack;
       CorPadraoCampo: TColor = clWindow;
       CorDestaqueFonte: TColor = clYellow;
       CorDestaqueCampo: TColor = clYellow;
       CorReadOnly: TColor = $00EBEBEB;}
       CorPadraoFonte: TColor =  clBlack;
       CorPadraoCampo: TColor = clWindow;
       CorDestaqueFonte: TColor = clWindow;
       CorDestaqueCampo: TColor = clWhite;
       CorReadOnly: TColor = clWindow;

implementation

{ UNovosComponentes.TEdit }

procedure TEdit.Click;
begin
  inherited;
  Self.SetFocus;
end;

constructor TEdit.Create(AOwner: TComponent);
begin
  inherited;
    if ReadOnly then
     Color := CorReadOnly;
  FObrigatorio := False;
end;

procedure TEdit.DoEnter;
begin
   if Color <> CorDestaqueCampo then
      begin
           FOldColor := Color;
           Color := CorDestaqueCampo;
      end;
  inherited;
end;




procedure TEdit.DoExit;
begin
  Color := FOldColor;
  inherited;
end;

procedure TEdit.SetObrigatorio(const Value: Boolean);
begin
  FObrigatorio := Value;
end;

procedure TEdit.WMNCPaint(var msg: TWMNCPaint);
var
  cv: TCanvas;
  dc: HDC;
  r: TRect;
begin
  dc:= GetWindowDC( handle );
  SaveDC( dc );
  try
    cv:= TCanvas.Create;
    try
      cv.CopyMode := cmMergeCopy;
      cv.Handle := dc;
      cv.Lock;
      r:= Rect( 0, 0, Width, Height );
      With cv.Brush Do Begin
        Color := Self.Color;
        Style := bsSolid;
      End;
      cv.FrameRect( r );
      InflateRect( r, -1, -1 );
      cv.FrameRect( r );
      With cv.Pen Do Begin
         if Self.Focused then
            begin
               Color := clBlue;
               Width := 2;
            end
         else
           begin
              Color := clWindowFrame;
              Width := 1;
           end;
        Style := psSolid;
      End;
      cv.MoveTo( r.Left, r.Bottom );
      cv.LineTo( r.right, r.Bottom );
    finally
      cv.Unlock;
      cv.free;
    end;
  finally
    RestoreDC( dc, -1 );
    ReleaseDC( handle, dc );
  end;
end;


{ TMaskEdit }

procedure TMaskEdit.Click;
begin
  inherited;
  Self.SetFocus;
end;

constructor TMaskEdit.Create(AOwner: TComponent);
begin
  inherited;
    if ReadOnly then
     Color := CorReadOnly;
  FObrigatorio := False;
end;

procedure TMaskEdit.DoEnter;
begin
   if Color <> CorDestaqueCampo then
      begin
           FOldColor := Color;
           Color := CorDestaqueCampo;
      end;
  inherited;
end;

procedure TMaskEdit.DoExit;
begin
   Color := FOldColor;
  inherited;
end;

procedure TMaskEdit.SetObrigatorio(const Value: Boolean);
begin
  FObrigatorio := Value;
end;

procedure TMaskEdit.WMNCPaint(var msg: TWMNCPaint);
var
  cv: TCanvas;
  dc: HDC;
  r: TRect;
begin
  dc:= GetWindowDC( handle );
  SaveDC( dc );
  try
    cv:= TCanvas.Create;
    try
      cv.Handle := dc;
      cv.Lock;
      r:= Rect( 0, 0, Width, Height );
      With cv.Brush Do Begin
        Color := Self.Color;
        Style := bsSolid;
      End;
      cv.FrameRect( r );
      InflateRect( r, -1, -1 );
      cv.FrameRect( r );
      With cv.Pen Do Begin
         if Self.Focused then
            begin
               Color := clBlue;
               Width := 2;
            end
         else
           begin
              Color := clWindowFrame;
              Width := 1;
           end;
        Style := psSolid;
      End;
      cv.MoveTo( r.Left, r.Bottom );
      cv.LineTo( r.right, r.Bottom );
    finally
      cv.Unlock;
      cv.free;
    end;
  finally
    RestoreDC( dc, -1 );
    ReleaseDC( handle, dc );
  end;
end;

{ Tcombobox }

procedure TComboBox.Click;
begin
  inherited;
  Self.SetFocus;
end;

constructor TComboBox.Create(AOwner: TComponent);
begin
  inherited;
  FObrigatorio := False;
end;

procedure Tcombobox.DoEnter;
begin
   if Color <> CorDestaqueCampo then
      begin
           FOldColor := Color;
           Color := CorDestaqueCampo;
      end;
  inherited;
end;

procedure Tcombobox.DoExit;
begin
   Color := FOldColor;
  inherited;
end;

procedure TComboBox.SetObrigatorio(const Value: Boolean);
begin
  FObrigatorio := Value;
end;

procedure TComboBox.WMNCPaint(var msg: TWMNCPaint);
var
  cv: TCanvas;
  dc: HDC;
  r: TRect;
begin
  dc:= GetWindowDC( handle );
  SaveDC( dc );
  try
    cv:= TCanvas.Create;
    try
      cv.Handle := dc;
      cv.Lock;
      r:= Rect( 0, 0, Width, Height );
      With cv.Brush Do Begin
        Color := Self.Color;
        Style := bsSolid;
      End;
      cv.FrameRect( r );
      InflateRect( r, -1, -1 );
      cv.FrameRect( r );
      With cv.Pen Do Begin
         if Self.Focused then
            begin
               Color := clBlue;
               Width := 2;
            end
         else
           begin
              Color := clWindowFrame;
              Width := 1;
           end;
        Style := psSolid;
      End;
      cv.MoveTo( r.Left, r.Bottom );
      cv.LineTo( r.right, r.Bottom );
    finally
      cv.Unlock;
      cv.free;
    end;
  finally
    RestoreDC( dc, -1 );
    ReleaseDC( handle, dc );
  end;
end;

{ TMemo }

procedure TMemo.Click;
begin
  inherited;
  Self.SetFocus;
end;

constructor TMemo.Create(AOwner: TComponent);
begin
  inherited;
    if ReadOnly then
     Color := CorReadOnly;
  FObrigatorio := False;
end;

procedure TMemo.DoEnter;
begin
   if Color <> CorDestaqueCampo then
      begin
           FOldColor := Color;
           Color := CorDestaqueCampo;
      end;
  inherited;

end;

procedure TMemo.DoExit;
begin
   Color := FOldColor;
  inherited;

end;

procedure TMemo.SetObrigatorio(const Value: Boolean);
begin
  FObrigatorio := Value;
end;

{ TCurrencyEdit }

procedure TCurrencyEdit.Click;
begin
  inherited;
    Self.SetFocus;
end;

constructor TCurrencyEdit.Create(AOwner: TComponent);
begin
  inherited;
  if ReadOnly then
     Color := CorReadOnly;
  FObrigatorio := False;
end;

procedure TCurrencyEdit.DoEnter;
begin
   if Color <> CorDestaqueCampo then
      begin
           FOldColor := Color;
           Color := CorDestaqueCampo;
      end;
  inherited;
end;

procedure TCurrencyEdit.DoExit;
begin
   Color := FOldColor;
  inherited;
end;

procedure TCurrencyEdit.SetObrigatorio(const Value: Boolean);
begin
  FObrigatorio := Value;
end;

procedure TCurrencyEdit.WMNCPaint(var msg: TWMNCPaint);
var
  cv: TCanvas;
  dc: HDC;
  r: TRect;
begin
  dc:= GetWindowDC( handle );
  SaveDC( dc );
  try
    cv:= TCanvas.Create;
    try
      cv.Handle := dc;
      cv.Lock;
      r:= Rect( 0, 0, Width, Height );
      With cv.Brush Do Begin
        Color := Self.Color;
        Style := bsSolid;
      End;
      cv.FrameRect( r );
      InflateRect( r, -1, -1 );
      cv.FrameRect( r );
      With cv.Pen Do Begin
         if Self.Focused then
            begin
               Color := clBlue;
               Width := 2;
            end
         else
           begin
              Color := clWindowFrame;
              Width := 1;
           end;
        Style := psSolid;
      End;
      cv.MoveTo( r.Left, r.Bottom );
      cv.LineTo( r.right, r.Bottom );
    finally
      cv.Unlock;
      cv.free;
    end;
  finally
    RestoreDC( dc, -1 );
    ReleaseDC( handle, dc );
  end;
end;

{ TAlertas }

constructor TAlertas.Create;
begin
   FAlert := TdxAlertWindowManager.Create( nil );
//   FAlert.OptionsAnimate.
end;

destructor TAlertas.Destroy;
begin

  inherited;
end;


{TDBEdit}
procedure TDBEdit.Click;
begin
  inherited;
  Self.SetFocus;
end;

constructor TDBEdit.Create(AOwner: TComponent);
begin
  inherited;
    if ReadOnly then
     Color := CorReadOnly;
  FObrigatorio := False;
end;

procedure TDBEdit.DoEnter;
begin
   if Color <> CorDestaqueCampo then
      begin
           FOldColor := Color;
           Color := CorDestaqueCampo;
      end;
  inherited;
end;




procedure TDBEdit.DoExit;
begin
  Color := FOldColor;
  inherited;
end;

procedure TDBEdit.SetObrigatorio(const Value: Boolean);
begin
  FObrigatorio := Value;
end;

procedure TDBEdit.WMNCPaint(var msg: TWMNCPaint);
var
  cv: TCanvas;
  dc: HDC;
  r: TRect;
begin
  dc:= GetWindowDC( handle );
  SaveDC( dc );
  try
    cv:= TCanvas.Create;
    try
      cv.CopyMode := cmMergeCopy;
      cv.Handle := dc;
      cv.Lock;
      r:= Rect( 0, 0, Width, Height );
      With cv.Brush Do Begin
        Color := Self.Color;
        Style := bsSolid;
      End;
      cv.FrameRect( r );
      InflateRect( r, -1, -1 );
      cv.FrameRect( r );
      With cv.Pen Do Begin
         if Self.Focused then
            begin
               Color := clBlue;
               Width := 2;
            end
         else
           begin
              Color := clWindowFrame;
              Width := 1;
           end;
        Style := psSolid;
      End;
      cv.MoveTo( r.Left, r.Bottom );
      cv.LineTo( r.right, r.Bottom );
    finally
      cv.Unlock;
      cv.free;
    end;
  finally
    RestoreDC( dc, -1 );
    ReleaseDC( handle, dc );
  end;
end;


end.


