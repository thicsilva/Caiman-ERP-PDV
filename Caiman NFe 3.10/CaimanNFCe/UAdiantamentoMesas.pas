unit UAdiantamentoMesas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Mask, RxToolEdit, RxCurrEdit, sLabel, DB, Grids, DBGrids, 
  ComCtrls, RzCmboBx, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TfrmAdiantamentosMesa = class(TForm)
    sLabelFX1: TsLabelFX;
    edtValor: TCurrencyEdit;
    IBAd: TFDQuery;
    IBTRA: TFDTransaction;
    DBGrid1: TDBGrid;
    IBAdCODIGO: TIntegerField;
    IBAdORDEM: TIntegerField;
    IBAdVALOR: TBCDField;
    IBAdDESCRICAO: TStringField;
    UpA: TFDUpdateSQL;
    sLabelFX2: TsLabelFX;
    DsA: TDataSource;
    edtDescricao: TEdit;
    StatusBar1: TStatusBar;
    cbbMoedas: TRzComboBox;
    QAux: TFDQuery;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure MostraAdiantamentos;
    procedure LimpaCampos;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure cbbMoedasChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    CodigoDaMesa: Integer;
  end;

var
  frmAdiantamentosMesa: TfrmAdiantamentosMesa;

implementation

uses
  UDM, UDialog;

{$R *.dfm}

procedure TfrmAdiantamentosMesa.cbbMoedasChange(Sender: TObject);
var
   Abre: String;
begin
   if cbbMoedas.ItemIndex = 0 then
      Abre := 'R$'
   else
      Abre := Copy( cbbMoedas.Text, 1, 3 );
   edtValor.DisplayFormat := Abre + ' ,0.00;-' + Abre + ' ,0.00';
end;

procedure TfrmAdiantamentosMesa.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_DELETE then
        begin
           IBAd.Delete;
        end;
end;

procedure TfrmAdiantamentosMesa.edtDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
                try
                    IBAd.Insert;
                    IBAdCODIGO.AsInteger := CodigoDaMesa;
                    IBAdVALOR.AsCurrency := edtValor.Value;
                    IBAdDESCRICAO.AsString := edtDescricao.Text;
                    IBAd.Post;
                    IBTRA.CommitRetaining;
                    LimpaCampos;
                    MostraAdiantamentos;
                except
                    IBAd.Cancel;
                    KDialog( 'Erro Inserindo Adiantamento', 'Adinatamentos', 'ERRO' );
                    IBTRA.RollbackRetaining;
                    LimpaCampos;
                    MostraAdiantamentos;
                end;
      end;
end;

procedure TfrmAdiantamentosMesa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    IBAd.Close;
    if IBTRA.Active then
        IBTRA.Commit;
    Action := caFree;
    Self := nil;
end;

procedure TfrmAdiantamentosMesa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_ESCAPE : Close;
      VK_F2: LimpaCampos;
      VK_F3: begin
                try
                    IBAd.Insert;
                    IBAdCODIGO.AsInteger := CodigoDaMesa;
                    IBAdVALOR.AsCurrency := edtValor.Value * StrToCurr( cbbMoedas.Value );
                    IBAdDESCRICAO.AsString := edtDescricao.Text;
                    IBAd.Post;
                    IBTRA.CommitRetaining;
                    LimpaCampos;
                    MostraAdiantamentos;
                except
                    IBAd.Cancel;
                    KDialog( 'Erro Inserindo Adiantamento', 'Adiantamentos', 'ERRO' );
                    IBTRA.RollbackRetaining;
                    LimpaCampos;
                    MostraAdiantamentos;
                end;
             end;
      VK_F4: DBGrid1.SetFocus;
   end;
end;

procedure TfrmAdiantamentosMesa.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TfrmAdiantamentosMesa.FormShow(Sender: TObject);
begin
  LimpaCampos;
  MostraAdiantamentos;
end;

procedure TfrmAdiantamentosMesa.LimpaCampos;
begin
   cbbMoedas.ItemIndex := 0;
   cbbMoedasChange( NIL );
   edtDescricao.Clear;
   edtValor.Value := 0;
   edtValor.SelectAll;
   cbbMoedas.SetFocus;
end;

procedure TfrmAdiantamentosMesa.MostraAdiantamentos;
begin
   if IBTRA.Active then
       IBTRA.Commit;
   IBTRA.StartTransaction;
   IBAd.Close;
   IBAd.ParamByName( 'COD' ).AsInteger := CodigoDaMesa;
   IBAd.Open;
   with QAux do
       begin
          Close;
          SQL.Text := 'SELECT * FROM MOEDAS';
          Open;
          cbbMoedas.ClearItemsValues;
          cbbMoedas.AddItemValue( 'PADRAO', CurrToStr( 1 ) );
          First;
          while not Eof do
             begin
                cbbMoedas.AddItemValue( FieldByName( 'DESCRICAO' ) .AsString ,
                FieldByName( 'COTACAO' ).AsString );
                Next;
             end;
          Close;
       end;
   cbbMoedas.ItemIndex := 0;
end;

end.
