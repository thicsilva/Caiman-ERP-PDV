unit UConsLancPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UConsNovo, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, DB, Buttons, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsLancPadrao = class(TFrmConsNovo)
    QConsLancPadrao: TFDQuery;
    DSQConsLancPadrao: TDataSource;
    QConsLancPadraoCOD_LAN: TIntegerField;
    QConsLancPadraoNOME_LAN: TStringField;
    QConsLancPadraoCONTA_DEBITO: TIntegerField;
    QConsLancPadraoCONTA_CREDITO: TIntegerField;
    QConsLancPadraoCOD_HIS: TIntegerField;
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsLancPadrao: TFrmConsLancPadrao;

implementation
uses
  Udm, ULancContabil;

{$R *.dfm}

procedure TFrmConsLancPadrao.BtnOkClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with QConsLancPadrao do
     begin 
        close;
        sql.Clear;
        sql.Add('SELECT * FROM LANCAMENTO_PADRAO');
        case ComboCons.ItemIndex of
         0: sql.Add(' WHERE NOME_LAN LIKE ' + #39 + '%' + EdtCons.Text + '%' + #39 +
                    ' ORDER BY NOME_LAN');
         1: sql.Add(' WHERE NOME_LAN LIKE ' + #39 + EdtCons.Text + '%' + #39 +
                    ' ORDER BY NOME_LAN');
         2: begin 
              if edtcons.Text = '' then
                 sql.Add(' ORDER BY COD_LAN')
              else
                 sql.Add(' WHERE COD_LAN = ' + EdtCons.Text);
           end;
        end;
        open;
     end;
  DBGrid.SetFocus;
end;

procedure TFrmConsLancPadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  QConsLancPadrao.Close;
  Action:= caFree;
end;

procedure TFrmConsLancPadrao.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  case tag of
    0: begin 
          with FrmLancContabil do
             begin 
                EdtCod.Text      := QConsLancPadraoCOD_LAN.AsString;
                EdtNomeLanc.Text := QConsLancPadraoNOME_LAN.Value;
             end;
          close;
       end;
  end;
end;

end.
