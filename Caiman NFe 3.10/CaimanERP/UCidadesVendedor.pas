unit UCidadesVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, StdCtrls, Mask, RxToolEdit, RxCurrEdit, Grids, DBGrids, Buttons, 
  sSpeedButton, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TfrmCidades_Vendedor = class(UNovoFormulario.TForm)
    Label1: TLabel;
    sSpeedButton3: TsSpeedButton;
    sSpeedButton4: TsSpeedButton;
    GroupBox1: TGroupBox;
    lblVendedor: TLabel;
    DBGrid1: TDBGrid;
    TRCidades: TFDTransaction;
    edtCidade: TEdit;
    QCidades: TFDQuery;
    QCidadesCOD: TIntegerField;
    QCidadesCOD_VEND: TIntegerField;
    QCidadesCIDADE: TStringField;
    dsCidades: TDataSource;
    upCidades: TFDUpdateSQL;
    procedure FormShow(Sender: TObject);
    procedure sSpeedButton4Click(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
        { Public declarations }
    cod_vend : Integer;
    nome_vend: string;
  end;

var
  frmCidades_Vendedor: TfrmCidades_Vendedor;

implementation

uses
  UNovoPrincipal;

{$R *.dfm}

procedure TfrmCidades_Vendedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if TRCidades.Active then
      TRCidades.Commit;
end;

procedure TfrmCidades_Vendedor.FormShow(Sender: TObject);
begin
     if TRCidades.Active then
      TRCidades.Commit;
   TRCidades.StartTransaction;
   QCidades.ParamByName( 'COD_VEND' ).AsInteger := cod_vend;
   QCidades.Open;
   lblVendedor.Caption := IntToStr( cod_vend ) + ' - ' + nome_vend;
         edtCidade.Text := '';


end;

procedure TfrmCidades_Vendedor.sSpeedButton3Click(Sender: TObject);
begin
   if not QCidadesCOD_VEND.IsNull then
      begin
          QCidades.Delete;
          QCidades.Refresh;
      end;
end;

procedure TfrmCidades_Vendedor.sSpeedButton4Click(Sender: TObject);
begin
   if edtCidade.Text <> '' then
       begin
          QCidades.Insert;
          QCidadesCOD_VEND.AsInteger := cod_vend;
          QCidadesCIDADE.AsString := edtCidade.Text;
          QCidades.Post;
          QCidades.Refresh;
       end;
end;

end.





