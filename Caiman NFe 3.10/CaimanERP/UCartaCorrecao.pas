unit UCartaCorrecao;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, StdCtrls, Mask, sMaskEdit, sCustomComboEdit, sTooledit, Buttons, UNovosComponentes, UNovoFormulario;

type
  TfrmCadCartaCorrecao = class(UNovoFormulario.TForm)
    Label1: TLabel;
    Data: TsDateEdit;
    Correcao: TMemo;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Cancelado: Boolean;
  end;

var
  frmCadCartaCorrecao: TfrmCadCartaCorrecao;

implementation

uses UNovoPrincipal;

{$R *.dfm}

procedure TfrmCadCartaCorrecao.BitBtn1Click(Sender: TObject);
begin 
   Cancelado := false;
end;

procedure TfrmCadCartaCorrecao.BitBtn2Click(Sender: TObject);
begin 
  Cancelado := True;
end;

procedure TfrmCadCartaCorrecao.FormShow(Sender: TObject);
begin 
   Data.Date := Date;
   Cancelado := true;
end;

end.
