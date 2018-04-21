unit UCTRDevolucao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, StdCtrls, Mask, ComCtrls, ExtCtrls, rxToolEdit, rxCurrEdit, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmCTRDevolucao = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    EdtCod: UNovosComponentes.TEdit;
    EdtSeq: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtTotal: TCurrencyEdit;
    Label3: TLabel;
    EdtValorDev: TCurrencyEdit;
    BtnOk: TButton;
    BtnSair: TButton;
    QDevolucao: TFDQuery;
    IBTRDev: TFDTransaction;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCTRDevolucao: TFrmCTRDevolucao;

implementation
uses
  Udm, UContasRecRec, UNovoPrincipal;

{$R *.dfm}

procedure TFrmCTRDevolucao.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmCTRDevolucao.BtnOkClick(Sender: TObject);
begin 
   if StrToCurr(EdtValorDev.Text) > FrmContasRecRec.QConsARecVALOR_CTR.Value then
      begin 
         AlertaCad('O valor da devolução não pode ser maior que o valor da parcela');
//         EdtValorDev.SetFocus;
         exit;
      end;
   if IBTRDev.Active then
      IBTRDev.Commit;
   IBTRDev.StartTransaction;
   try
     try
       with QDevolucao do
          begin 
             close;
             parambyname('codctr').Value := edtcod.Text;
             Parambyname('seq').Value    := EdtSeq.Text;
             Parambyname('dev').Value    := EdtValorDev.Text;
             ExecOrOpen;
          end;
       IBTRDev.Commit;
     except
       IBTRDev.Rollback;
       AlertaCad('Erro ao gravar a devolução');
     end;
   finally
     QDevolucao.Close;
     FrmContasRecRec.BtnOk.Click;
     close;
   end;
end;

procedure TFrmCTRDevolucao.FormShow(Sender: TObject);
begin 
   edtvalordev.SetFocus;
end;

procedure TFrmCTRDevolucao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmCTRDevolucao.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmCTRDevolucao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.
