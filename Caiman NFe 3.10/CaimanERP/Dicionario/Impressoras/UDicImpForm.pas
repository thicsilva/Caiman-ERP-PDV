unit UDicImpForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, Vcl.Buttons, sSpeedButton;

type
  TfrmKadoshiSelPrinter = class(TForm)
    pnlImpressora: TPanel;
    Label1: TLabel;
    cbbImpressora: TComboBox;
    Panel2: TPanel;
    Label3: TLabel;
    cbbModelo: TComboBox;
    Panel3: TPanel;
    btnImprimir: TsSpeedButton;
    btnVisualizar: TsSpeedButton;
    btnCancelar: TsSpeedButton;
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cbbModeloKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

uses UDM;

procedure TfrmKadoshiSelPrinter.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
       VK_RETURN: GetParentForm(Self).Perform(CM_DIALOGKEY, VK_TAB, 0);
       VK_ESCAPE: btnCancelar.Click;
       VK_F2: btnVisualizar.Click;
       VK_F3: btnImprimir.Click;
   end;
end;

procedure TfrmKadoshiSelPrinter.FormShow(Sender: TObject);
begin
   cbbImpressora.SetFocus;
end;

procedure TfrmKadoshiSelPrinter.btnImprimirClick(Sender: TObject);
begin
   ModalResult := mrYesToAll;
end;

procedure TfrmKadoshiSelPrinter.btnVisualizarClick(Sender: TObject);
begin
   ModalResult := mrYes;
end;

procedure TfrmKadoshiSelPrinter.cbbModeloKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
      btnVisualizar.Click;
end;

procedure TfrmKadoshiSelPrinter.btnCancelarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

end.
