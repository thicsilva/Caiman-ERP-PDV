unit UTroco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, acPNG, ExtCtrls, StdCtrls, sLabel, ComCtrls, ImgList, 
  acAlphaImageList, CalculaTroco, UVendasCaixa, NxCollection, DB, jpeg, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TfrmTroco = class(TForm)
    imgTroco: TImage;
    Mostra: TsLabelFX;
    ImNotas: TsAlphaImageList;
    ImMoedas: TsAlphaImageList;
    CT: TCalculaTroco;
    Panel1: TPanel;
    Moedas: TTreeView;
    Notas: TTreeView;
    sLabelFX1: TsLabelFX;
    sLabelFX2: TsLabelFX;
    pnlMoedas: TNxHeaderPanel;
    ScrollMoedas: TScrollBox;
    pnlTempMoedas: TPanel;
    lblDescTempMoedas: TLabel;
    lblTempValorMoeda: TLabel;
    QAux: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    function NotaImage( notav: integer ): integer;
    function MoedaImage( moedav: integer ): integer;
    procedure NotasDblClick(Sender: TObject);
    procedure MoedasDblClick(Sender: TObject);
    procedure NotasExpanded(Sender: TObject; Node: TTreeNode);
    procedure MoedasExpanded(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
    procedure AtualizaLabelMoeda(Descricao: string; Valor: Currency);
    procedure AbreMoedas;
  private
    { Private declarations }
  public
    { Public declarations }
    Troco: Double;
  end;

var
  frmTroco: TfrmTroco;

implementation

uses
  UMenuFiscal, UDM;

{$R *.dfm}

procedure TfrmTroco.AbreMoedas;
begin
   pnlMoedas.Visible := True;
   if DM.IBTransaction.Active then
      DM.IBTransaction.Commit;
   DM.IBTransaction.StartTransaction;

   with QAux do
      begin
         Close;
         SQL.Text := 'SELECT * FROM MOEDAS';
         Open;
         First;
         while not Eof do
            begin
               if FieldByName( 'FATOR' ).AsString = 'D' then
                  begin
                     AtualizaLabelMoeda(FieldByName( 'DESCRICAO' ).AsString,
                     Troco / FieldByName( 'COTACAO' ).AsCurrency );
                  end;
               if FieldByName( 'FATOR' ).AsString = 'M' then
                  begin
                     AtualizaLabelMoeda(FieldByName( 'DESCRICAO' ).AsString,
                     Troco * FieldByName( 'COTACAO' ).AsCurrency );
                  end;
               Next;
            end;
         Close;
      end;
   dm.IBTransaction.Commit;
end;


procedure TfrmTroco.AtualizaLabelMoeda(Descricao: string; Valor: Currency);
var
   Pnl: TPanel;
   LblDescricao: TLabel;
   lblValor: TLabel;
   Comp: TComponent;
   I: Integer;
begin

   Comp := Self.FindComponent( Trim( 'lblValorMoeda' + Trim( Descricao ) ) );
   if Comp = nil then
      begin
         Pnl := TPanel.Create( frmTroco );
         Pnl.Name := Trim( 'pnlMoeda' + Trim( Descricao ) ) ;
         Pnl.Height := pnlTempMoedas.Height;
         Pnl.Align := alTop;
         Pnl.AlignWithMargins := True;
         Pnl.Margins.Top := 5;
         Pnl.Margins.Bottom := 5;
         Pnl.Caption := '';
         Pnl.BevelOuter := bvNone;
         Pnl.Parent := ScrollMoedas;
         LblDescricao := TLabel.Create( frmTroco );
         LblDescricao.Name := Trim( 'lblDescMoeda' + Trim( Descricao ) );
         LblDescricao.Align := alLeft;
         LblDescricao.AlignWithMargins := True;
         LblDescricao.Margins.Top := 0;
         LblDescricao.Margins.Bottom := 0;
         LblDescricao.Margins.Left := 3;
         LblDescricao.Font.Assign( lblDescTempMoedas.Font );
         LblDescricao.Caption := Descricao;
         LblDescricao.Margins.Right := 0;
         LblDescricao.Parent := Pnl;
         lblValor := TLabel.Create( frmTroco );
         lblValor.Name := Trim( 'lblValorMoeda' + Trim( Descricao ) );
         lblValor.Align := alRight;
         lblValor.AlignWithMargins := True;
         lblValor.Margins.Top := 0;
         lblValor.Margins.Bottom := 0;
         lblValor.Font.Assign( lblTempValorMoeda.Font );
         lblValor.Margins.Left := 0;
         lblValor.Margins.Right := 10;
         lblValor.Parent := Pnl;
         lblValor.Caption := FormatFloat( '0.00', Valor );
      end;
   if Comp <> nil then
      lblValor := TLabel( Comp );
   if lblValor <> nil then
      lblValor.Caption := FormatFloat( '0.00', Valor );
    pnl := nil;
    LblDescricao := nil;
    lblValor := nil;
end;

procedure TfrmTroco.FormCreate(Sender: TObject);
begin
   dm.ScaleForm( Self, False );
end;

procedure TfrmTroco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = vk_escape then
      begin
          Close;
      end;
   if (ssAlt in Shift) and (chr(Key) in ['M', 'm']) then
      begin
         if (iCodPreVenda = 0) and (iCodOrcamento = 0) and (iCodOrdemServico = 0) and (iCodigoVenda = 0) and (iCodContaCliente = 0) then
            begin
               Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
               FrmMenuFiscal.showmodal;
            end;
      end;
   case Key of
       VK_F10: begin
                  AbreMoedas;
               end;
   end;
end;

procedure TfrmTroco.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Close;
      end;
end;

procedure TfrmTroco.FormShow(Sender: TObject);
var
  It: TTreeNode;
  ItemMoeda: Integer;
begin

   Panel1.Color := dm.BuscaCor( DM.Fundotroco, Panel1.left, Panel1.Top );
   Notas.Color := Panel1.Color;
   Moedas.Color := Panel1.Color;
   Notas.Items.Clear;
   Moedas.Items.Clear;
 //  Brush.Style := bsClear;
   Mostra.Caption := 'R$ ' + formatFloat( '###,##0.00', troco );
   CT.CalcularTroco( Troco );
   ItemMoeda := 0;
   if not CT.DBtroco.IsEmpty then
      begin
        CT.DBtroco.First;
        while not CT.DBtroco.Eof do
           begin
               if trim( CT.DBtroco.FieldByName( 'TIPO' ).AsString ) = 'N' then
                  begin
                        It := Notas.Items.Add(nil, 'X ' + CT.DBtroco.FieldByName( 'QUANT' ).AsString ); { Adiciona o node raiz }
                        It.ImageIndex := NotaImage( CT.DBtroco.FieldByName( 'VALOR' ).AsInteger );
                        it.SelectedIndex := It.ImageIndex;
                        { Adiciona um sub item no node adiciona anteriormente }
                        Notas.Items.AddChild( IT, '' );
                  end;
               if trim( CT.DBtroco.FieldByName( 'TIPO' ).AsString ) = 'M' then
                  begin
                        It := Moedas.Items.Add(nil, 'X ' + CT.DBtroco.FieldByName( 'QUANT' ).AsString ); { Adiciona o node raiz }
                        It.ImageIndex := MoedaImage( CT.DBtroco.FieldByName( 'VALOR' ).AsInteger );
                        it.SelectedIndex := It.ImageIndex;
                        { Adiciona um sub item no node adiciona anteriormente }
                        Moedas.Items.AddChild( IT, '' );
                  end;

               CT.DBtroco.Next;
           end;
      end;
   DM.CriaImg;
   dm.CarregaImagem2( dm.Fundotroco, dm.ImgTempCia );
   imgTroco.Picture.Bitmap.Assign( DM.ImgTempCia );
   DM.DestroyImg;


end;

function tfrmTroco.NotaImage(notav: Integer): integer;
Const
  nota: array [1 .. 7] of integer = (100, 50, 20, 10, 5, 2, 1);
var
  I: integer;
begin
   I := 0;
   for I := 1 to 7 do
      begin
         if nota[I] = notav then
            begin
               result := I - 1;
               exit;
            end;
      end;
end;

procedure TfrmTroco.NotasDblClick(Sender: TObject);
begin
   Notas.FullCollapse;
end;

procedure TfrmTroco.NotasExpanded(Sender: TObject; Node: TTreeNode);
begin
   Notas.FullCollapse;
end;

function TfrmTroco.MoedaImage(moedav: Integer): integer;
const
   centavos: array [1 .. 5] of integer = (50, 25, 10, 5, 1);
var
   I: integer;
begin
   I := 0;
   for I := 1 to 5 do
     begin
        if centavos[i] = moedav then
           begin
              result := I -1;
              exit;
           end;
     end;
end;

procedure TfrmTroco.MoedasDblClick(Sender: TObject);
begin
   Moedas.FullCollapse;
end;

procedure TfrmTroco.MoedasExpanded(Sender: TObject; Node: TTreeNode);
begin
   Moedas.FullCollapse;
end;

end.
