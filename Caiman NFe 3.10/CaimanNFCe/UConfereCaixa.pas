unit UConfereCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, VirtualTrees, StdCtrls, ExtCtrls, DB, sLabel, Mask, RxToolEdit, 
  RxCurrEdit, RzCmboBx, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  pRegistro = ^rRegistro;
  rRegistro = record
        DESCRICAO: String;
        Fator: String;
        Valor: Currency;
        Cotacao: Currency;
  end;
  TfrmConfereCaixa = class(TForm)
    tvConfere: TVirtualStringTree;
    Panel1: TPanel;
    Label1: TLabel;
    lblTotCaixa: TLabel;
    Label2: TLabel;
    lblSOma: TLabel;
    cbbMoedas: TRzComboBox;
    edtValor: TCurrencyEdit;
    sLabelFX1: TsLabelFX;
    QAux: TFDQuery;
    IBTRA: TFDTransaction;
    procedure FormShow(Sender: TObject);
    procedure CarregaMoedas;
    procedure cbbMoedasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CalcTotal;
    procedure tvConfereGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tvConfereKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    Valor: Currency;
    ValorAdicionado: Currency;
  end;

var
  frmConfereCaixa: TfrmConfereCaixa;

implementation

uses
  UDM;

{$R *.dfm}

procedure TfrmConfereCaixa.CalcTotal;
var
   Node: PVirtualNode;
   Dados: pRegistro;
   Total: Currency;
begin
   Total := 0;
   Node := tvConfere.GetFirst( False );
   while Node <> nil do
       begin
          Dados := tvConfere.GetNodeData( Node );
          if Dados.Valor > 0 then
             BEGIN
                  if Dados.Fator = 'D' then
                     Total := Total + ( Dados.Valor * Dados.Cotacao )
                  else
                     Total := Total + ( Dados.Valor / Dados.Cotacao );
             END;
          Node := tvConfere.GetNext( Node );
       end;
   ValorAdicionado := Total;
   if ValorAdicionado < Valor then
      lblSOma.Font.Color := clRed
   else
   if ValorAdicionado >= Valor then
      lblSOma.Font.Color := clGreen;
   lblSOma.Caption := FormatFloat( 'R$ 0.00', Total );
end;

procedure TfrmConfereCaixa.CarregaMoedas;
begin
   if IBTRA.Active then
      IBTRA.Commit;
   IBTRA.StartTransaction;
   with QAux do
       begin
          Close;
          SQL.Text := 'SELECT * FROM MOEDAS';
          Open;
          cbbMoedas.ClearItemsValues;
          cbbMoedas.AddItemValue( 'REAL', 'M1' );
          First;
          while not Eof do
             begin
                cbbMoedas.AddItemValue( FieldByName( 'DESCRICAO' ) .AsString ,
                FieldByName( 'FATOR' ).AsString + FieldByName( 'COTACAO' ).AsString );
                Next;
             end;
          Close;
       end;
   cbbMoedas.ItemIndex := 0;
   IBTRA.Commit;
end;

procedure TfrmConfereCaixa.cbbMoedasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_RETURN then
       begin
           edtValor.SetFocus;
           edtValor.SelectAll;
       end;
end;

procedure TfrmConfereCaixa.edtValorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   Node: PVirtualNode;
   Dados: pRegistro;
   Str: String;
begin
   if Key = VK_RETURN then
        begin
           tvConfere.BeginUpdate;
           Node := tvConfere.AddChild( nil );
           Dados := tvConfere.GetNodeData( Node );
           Dados.DESCRICAO := cbbMoedas.Text;
           Str := cbbMoedas.Value;
           Dados.Fator := Str[1];
           Delete( Str, 1, 1 );
           Dados.Cotacao := StrToCurr( Str );
           Dados.Valor := edtValor.Value;
           tvConfere.EndUpdate;
           cbbMoedas.SetFocus;
           CalcTotal;
        end;
end;

procedure TfrmConfereCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmConfereCaixa.FormShow(Sender: TObject);
begin
   lblTotCaixa.Caption := FormatFloat( 'R$ 0.00', Valor );
   lblSOma.Caption := FormatFloat( 'R$ 0.00', 0 );
   tvConfere.Clear;
   tvConfere.NodeDataSize := SizeOf( rRegistro );
   CarregaMoedas;
   cbbMoedas.SetFocus;
end;

procedure TfrmConfereCaixa.tvConfereGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: string);
var
   Dados: pRegistro;
begin
   Dados := tvConfere.GetNodeData( Node );
   case Column of
       0: CellText := Dados.DESCRICAO;
       1: CellText := FormatFloat( '0.00', dados.Valor );
   end;
end;

procedure TfrmConfereCaixa.tvConfereKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   Node: PVirtualNode;
   Dados: pRegistro;
begin
   if Key = VK_DELETE then
       BEGIN
           Node := tvConfere.GetFirst( False );
           while Node <> nil do
               begin
                  if tvConfere.Selected[Node] then
                     tvConfere.DeleteNode( Node );
                  Node := tvConfere.GetNext( Node );
               end;
       END;
   CalcTotal;
end;

end.
