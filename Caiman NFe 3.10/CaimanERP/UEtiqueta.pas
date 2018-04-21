unit UEtiqueta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Grids, DBGrids, Buttons, 
  UNovosComponentes, UNovoFormulario;

type
  TFrmEtiqueta = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    cod_lab: UNovosComponentes.TEdit;
    BtnOK: TBitBtn;
    BtnSair: TBitBtn;
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEtiqueta: TFrmEtiqueta;

implementation

uses
  UNovoPrincipal;

{$R *.dfm}

end.
