unit UItensEntradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, Grids, DBGrids, ComCtrls, Mask, StdCtrls, DB, rxToolEdit, 
  rxCurrEdit, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmItensEntradas = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    EdtCod: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtEmissao: TMaskEdit;
    Label3: TLabel;
    EdtEnt: TMaskEdit;
    Label35: TLabel;
    EdtNumNF: TEdit;
    EdtCodFor: UNovosComponentes.TEdit;
    EdtNomeFor: TEdit;
    Label22: TLabel;
    EdtTotalNF: TCurrencyEdit;
    Label8: TLabel;
    StatusBar1: TStatusBar;
    DBGrid1: TDBGrid;
    QEntradas: TFDQuery;
    IBTRItens: TFDTransaction;
    QItensEntrada: TFDQuery;
    DSQItensEntradas: TDataSource;
    QItensEntradaCOD_PRO: TIntegerField;
    QItensEntradaQTD_PRO: TBCDField;
    QItensEntradaVALOR_UNIT_PRO: TBCDField;
    QItensEntradaNOME_PRO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmItensEntradas: TFrmItensEntradas;

implementation
uses
  Udm, UContasPagarPag, UConsLancPagar, UConsPagar, UConsEntrada, 
  UNovoPrincipal;

{$R *.dfm}

procedure TFrmItensEntradas.FormShow(Sender: TObject);
begin 
   if IBTRItens.Active then
      IBTRItens.Commit;
   IBTRItens.StartTransaction;
   with QEntradas do
      begin 
         close;
         case FrmItensEntradas.Tag of
            0: Parambyname('codent').AsInteger := FrmContasPagarPag.QConsContasPagarCOD_ENTRADA.AsInteger; //contas a pagar - pagamentos
            1: Parambyname('codent').AsInteger := FrmConsLancPagar.QConsLancPagarCOD_ENTRADA.AsInteger;    //consulta dos lancamento do contas a pagar
            2: Parambyname('codent').AsInteger := FrmConsPagar.QConsPagarCOD_ENTRADA.AsInteger;            //movimento - consulta contas pagar
            3: Parambyname('codent').AsInteger := FrmConsEntrada.QConsEntCOD_ENT.AsInteger;                //consulta de entradas
         end;
         open;
         edtcod.Text     := FieldByName('cod_ent').AsString;
         EdtEmissao.Text := FieldByName('dataemi_ent').AsString;
         edtent.Text     := FieldByName('dataent_ent').AsString;
         EdtNumNF.Text   := FieldByName('numnf_ent').Value;
         EdtTotalNF.Text := FieldByName('total_ent').AsString;
         EdtCodFor.Text  := FieldByName('cod_for').AsString;
         EdtNomeFor.Text := FieldByName('razao_for').Value;
      end;
   IBTRItens.Commit;
   QEntradas.Close;

   IBTRItens.StartTransaction;
   with QItensEntrada do
      begin 
         close;
         case FrmItensEntradas.Tag of
            0: Parambyname('codent').AsInteger := FrmContasPagarPag.QConsContasPagarCOD_ENTRADA.AsInteger; //contas a pagar - pagamentos
            1: Parambyname('codent').AsInteger := FrmConsLancPagar.QConsLancPagarCOD_ENTRADA.AsInteger;    //consulta dos lancamento do contas a pagar
            2: Parambyname('codent').AsInteger := FrmConsPagar.QConsPagarCOD_ENTRADA.AsInteger;            //movimento - consulta contas pagar
            3: Parambyname('codent').AsInteger := FrmConsEntrada.QConsEntCOD_ENT.AsInteger;                //consulta de entradas
         end;
         open;
      end;
end;

procedure TFrmItensEntradas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if IBTRItens.Active then
      IBTRItens.Commit;
   QItensEntrada.Close;
end;

procedure TFrmItensEntradas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.

