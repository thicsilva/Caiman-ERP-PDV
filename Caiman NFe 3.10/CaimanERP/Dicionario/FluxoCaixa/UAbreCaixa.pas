unit UAbreCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMetropolis,
  Vcl.ExtCtrls, cxLabel, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxCurrencyEdit, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, UDicFluxo;

type
  TfrmAbreCaixa = class(TForm)
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    shp1: TShape;
    lblCaixa: TcxLabel;
    Panel2: TPanel;
    cxLabel2: TcxLabel;
    lblUsuario: TcxLabel;
    pnlSaldoAnterior: TPanel;
    cxLabel3: TcxLabel;
    lblSaldo: TcxLabel;
    pnlPeriodo: TPanel;
    Panel5: TPanel;
    cxLabel4: TcxLabel;
    edtDateIni: TcxDateEdit;
    Panel6: TPanel;
    cxLabel5: TcxLabel;
    edtDateFim: TcxDateEdit;
    Shape2: TShape;
    Panel4: TPanel;
    cxLabel6: TcxLabel;
    Shape3: TShape;
    Panel7: TPanel;
    cxLabel7: TcxLabel;
    Shape1: TShape;
    Panel8: TPanel;
    cxLabel8: TcxLabel;
    edtSuprimento: TcxCurrencyEdit;
    Panel9: TPanel;
    btnCancelar: TcxButton;
    btnConfirmar: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    FDicFluxo: TDicFluxo;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; DicFluxo: TDicFluxo );
  end;

implementation

{$R *.dfm}

procedure TfrmAbreCaixa.btnCancelarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TfrmAbreCaixa.btnConfirmarClick(Sender: TObject);
begin
   ModalResult := mrOk;
end;

constructor TfrmAbreCaixa.Create(AOwner: TComponent; DicFluxo: TDicFluxo);
begin
  inherited Create( AOwner );
  FDicFluxo := DicFluxo;
end;

procedure TfrmAbreCaixa.FormShow(Sender: TObject);
begin
   edtDateIni.Date := Now;
   edtDateFim.Date := StrToDateTime( DateToStr( Now ) + ' 23:59:59' );
end;

end.
