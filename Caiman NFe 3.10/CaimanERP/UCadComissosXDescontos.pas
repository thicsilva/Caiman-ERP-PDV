unit UCadComissosXDescontos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, StdCtrls, Grids, DBGrids, Mask, RxToolEdit, RxCurrEdit, Buttons, 
  sSpeedButton, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TfrmCadComissosXDescontos = class(UNovoFormulario.TForm)
    TRComissos: TFDTransaction;
    QComissos: TFDQuery;
    UpComicoes: TFDUpdateSQL;
    QComissosCOD: TIntegerField;
    QComissosCOD_VEND: TIntegerField;
    QComissosPORC_DESCONTO: TBCDField;
    QComissosPORC_COMISSAO: TBCDField;
    GroupBox1: TGroupBox;
    lblVendedor: TLabel;
    DBGrid1: TDBGrid;
    dsComissoes: TDataSource;
    Label1: TLabel;
    edtDesconto: TCurrencyEdit;
    Label2: TLabel;
    edtComissao: TCurrencyEdit;
    sSpeedButton3: TsSpeedButton;
    sSpeedButton4: TsSpeedButton;
    procedure sSpeedButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sSpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cod_vend : Integer;
    nome_vend: string;
  end;

var
  frmCadComissosXDescontos: TfrmCadComissosXDescontos;

implementation

uses
  UDM, UNovoPrincipal;

{$R *.dfm}

procedure TfrmCadComissosXDescontos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   TRComissos.Commit;
   Action := caFree;
end;

procedure TfrmCadComissosXDescontos.FormShow(Sender: TObject);
begin 
   if TRComissos.Active then
      TRComissos.Commit;
   TRComissos.StartTransaction;
   QComissos.ParamByName( 'cod_vend' ).AsInteger := cod_vend;
   QComissos.Open;
   lblVendedor.Caption := IntToStr( cod_vend ) + ' - ' + nome_vend;
         edtDesconto.Value := 0;
         edtComissao.Value := 0;

end;

procedure TfrmCadComissosXDescontos.sSpeedButton3Click(Sender: TObject);
begin 
   if not QComissosCOD.IsNull then
      QComissos.Delete;
end;

procedure TfrmCadComissosXDescontos.sSpeedButton4Click(Sender: TObject);
begin 
   if ( edtDesconto.Value > 0 ) and ( edtComissao.Value > 0 )  then
      begin 
         QComissos.Insert;
         QComissosCOD_VEND.AsInteger := cod_vend;
         QComissosPORC_DESCONTO.AsCurrency := edtDesconto.Value;
         QComissosPORC_COMISSAO.AsCurrency := edtComissao.Value;
         QComissos.Post;
         QComissos.Close;
         QComissos.Open;
         edtDesconto.Value := 0;
         edtComissao.Value := 0;

      end;
end;

end.
