unit UConfigEtiquetas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  RxToolEdit, RxCurrEdit, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Vcl.Menus, dxSkinsCore, dxSkinMetropolis, cxButtons;

type
  TfrmConfigEtiquetas = class(TForm)
    pnl1: TPanel;
    grp1: TGroupBox;
    lbl1: TLabel;
    Label1: TLabel;
    curTop: TCurrencyEdit;
    curBottom: TCurrencyEdit;
    Label2: TLabel;
    curLeft: TCurrencyEdit;
    Label3: TLabel;
    curRight: TCurrencyEdit;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    curWidth: TCurrencyEdit;
    Label5: TLabel;
    curHeight: TCurrencyEdit;
    chkEndLess: TCheckBox;
    Label6: TLabel;
    curColunms: TCurrencyEdit;
    Label7: TLabel;
    curEspColunas: TCurrencyEdit;
    Label8: TLabel;
    curLargEtiqueta: TCurrencyEdit;
    Label9: TLabel;
    curAltEtiqueta: TCurrencyEdit;
    pnl2: TPanel;
    btnCancelar: TcxButton;
    btnConfirmar: TcxButton;
    Panel2: TPanel;
    Label10: TLabel;
    edtDescricao: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigEtiquetas: TfrmConfigEtiquetas;

implementation

{$R *.dfm}

procedure TfrmConfigEtiquetas.btnCancelarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TfrmConfigEtiquetas.btnConfirmarClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

end.
