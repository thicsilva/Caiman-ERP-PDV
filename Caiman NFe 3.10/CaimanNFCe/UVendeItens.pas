unit UVendeItens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, RxToolEdit, RxCurrEdit, ChatControl,
  RzButton, RzRadChk;

type
  TItemConta = class( TCollectionItem )
       private
          Fpanel: TChatBallao;
          FCheckBox: TRzCheckBox;
          FLabel:  TLabel;
          FEdt: TCurrencyEdit;

          FCod_pro: Integer;
          FQuant: Extended;
          FSelecionado: Boolean;
          FDescricao: string;
          FQauntEdit: Extended;
          FOrdem: Integer;
          FCodIcms: Integer;
          FValor: Currency;
          FUnidade: String;
          FCodigoBarras: String;
          FCanceladoNoCupom: Boolean;
          FOrdemCupom: Integer;
          procedure SetCod_pro(const Value: Integer);
          procedure SetDescricao(const Value: string);
          procedure SetOrdem(const Value: Integer);
          procedure SetQauntEdit(const Value: Extended);
          function GetQuantEdit: Extended;
          procedure SetQuant(const Value: Extended);
          procedure SetSelecionado(const Value: Boolean);
          function GetSelecionado: Boolean;
          procedure edtQuanttempExit(Sender: TObject);
          procedure EnterCheck(Sender: TObject);
          procedure ExitCheck(Sender: TObject);
          procedure SetCodIcms(const Value: Integer);
          procedure SetUnidade(const Value: String);
          procedure SetValor(const Value: Currency);
          procedure SetCodigoBarras(const Value: String);
          procedure SetCanceladoNoCupom(const Value: Boolean);
          procedure SetOrdemCupom(const Value: Integer);
       public
           property Ordem: Integer read FOrdem write SetOrdem;
           property Cod_pro: Integer read FCod_pro write SetCod_pro;
           property Descricao: string read FDescricao write SetDescricao;
           property Quant: Extended read FQuant write SetQuant;
           property QauntEdit: Extended read GetQuantEdit write SetQauntEdit;
           property Selecionado: Boolean read GetSelecionado write SetSelecionado;
           property CodIcms: Integer read FCodIcms write SetCodIcms;
           property Unidade: String read FUnidade write SetUnidade;
           property Valor: Currency read FValor write SetValor;
           property CodigoBarras: String read FCodigoBarras write SetCodigoBarras;
           property CanceladoNoCupom: Boolean read FCanceladoNoCupom write SetCanceladoNoCupom;
           property OrdemCupom: Integer read FOrdemCupom write SetOrdemCupom;
           destructor Destroy; override;
           constructor Create( Collection: TCollection ); override;
  end;
  TListaItens = class( TCollection )
       private
            FForm: TForm;
            FFormatDisplay: string;
            FCodigoConta: Integer;
            function GetItensPedido(Index: Integer): TItemConta;
            procedure SetItensPedido(Index: Integer; const Value: TItemConta);
            procedure SetFormatDisplay(const Value: string);
            procedure SetCodigoConta(const Value: Integer);
       public
           function Novo: TItemConta;
           function QuantidadeSelecionada: Integer;
           function BuscaItemOrdemCupom( Ordem: Integer ): TItemConta;
           property ItensPedido[Index: Integer]: TItemConta read GetItensPedido;
           property FormatDisplay: string read FFormatDisplay write SetFormatDisplay;
           property CodigoConta: Integer read FCodigoConta write SetCodigoConta;
           constructor Create(AOwner: TForm);
  end;
  TfrmSelecionaItens = class(TForm)
    Scroll: TScrollBox;
    pnlFooter: TPanel;
    pnlTempitem: TPanel;
    lbltempQuant: TLabel;
    edtQuanttemp: TCurrencyEdit;
    lblECLAS: TLabel;
    chkTempItem: TRzCheckBox;
    chkTodos: TRzCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chkTodosClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure chkTempItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lblECLASClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ListaItens : TListaItens;
  end;

var
  frmSelecionaItens: TfrmSelecionaItens;

implementation

uses UDM, UDialog;

{$R *.dfm}

procedure TfrmSelecionaItens.chkTempItemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   T: TComponent;
begin
   if Key = VK_F2 then
      begin
          T := FindComponent(  'Edit' + IntToStr( TRzCheckBox( Sender ).Tag ) );
          if T <> nil then
            begin
             TCurrencyEdit( T ).SetFocus;
             TCurrencyEdit( T ).SelectAll;
            end;
      end;
end;

procedure TfrmSelecionaItens.chkTodosClick(Sender: TObject);
var
  I: Integer;
begin
   for I := 0 to frmSelecionaItens.ComponentCount - 1 do
        begin
           if ( frmSelecionaItens.Components[I] is TRzCheckBox )
           and ( frmSelecionaItens.Components[I].Name <>'chkTodos' ) then
              begin
                 TRzCheckBox( frmSelecionaItens.Components[I] ).Checked := chkTodos.Checked;
              end;
        end;
end;

procedure TfrmSelecionaItens.FormCreate(Sender: TObject);
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.add('SELECT CASAS_DECIMAIS, IMPRIMIR_COMPROVANTE_ECF ' +
                     'FROM CAIXA ' +
                     'WHERE COD_CAI = :CODCAI AND COD_EMP = :CODEMP');
             Parambyname('CODCAI').AsInteger := iCaixa;
             Parambyname('CODEMP').AsInteger := iEmp;
             Open;

             ICasasDecimaisQuant := fieldbyname('casas_decimais').AsInteger;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao buscar casas decimais');
     end;
   finally
     dm.QConsulta.Close;
   end;

   edtQuanttemp.DecimalPlaces := ICasasDecimaisQuant;
   edtQuanttemp.DisplayFormat := ' ,0.' + StringOfChar( '0', ICasasDecimaisQuant ) +
   ';- ,0.' + StringOfChar( '0', ICasasDecimaisQuant ) ;
   ListaItens := TListaItens.Create( Self );
   ListaItens.FormatDisplay := '0.' + StringOfChar( '0', ICasasDecimaisQuant );
end;

procedure TfrmSelecionaItens.FormDestroy(Sender: TObject);
begin
   if Assigned( ListaItens ) then
      FreeAndNil( ListaItens );
end;

procedure TfrmSelecionaItens.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
       VK_ESCAPE: ModalResult := mrCancel;
       VK_F3: begin
                 chkTodos.Checked := not chkTodos.Checked;
                 chkTodosClick( nil );
              end;
       VK_F6: begin
                 if ListaItens.QuantidadeSelecionada = 0 then
                    begin
                       KDialog( 'Nenhum Item Selecionado', 'Seleção de itens', 'INFO' );
                       Exit;
                    end
                 else
                   ModalResult := mrOk;
              end;
   end;
end;

procedure TfrmSelecionaItens.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TfrmSelecionaItens.FormShow(Sender: TObject);
var
  I: Integer;
  TamanhoHeight: Integer;
begin
   TamanhoHeight := 0;
   for I := 0 to Self.ComponentCount - 1 do
       begin
          if ( ( Self.Components[I] is TPanel ) OR (  Self.Components[I] is TChatBallao))
          AND ( Self.Components[I].Name <> 'Scroll' ) then
             begin
                Inc( TamanhoHeight, TWinControl( Self.Components[I] ).Height +
                TWinControl( Self.Components[I] ).Margins.Top +
                TWinControl( Self.Components[I] ).Margins.Bottom);
             end;
       end;
   Inc( TamanhoHeight, 50 );
   if TamanhoHeight > Screen.Height then
      Self.Height := Screen.Height
   else
      Self.Height := TamanhoHeight;
   Self.Top := ( Screen.Height - Self.Height ) div 2;
   Self.Left := ( Screen.Width - Self.Width ) div 2;
    chkTodosClick( chkTodos );
   chkTodos.Checked := False;
end;

procedure TfrmSelecionaItens.lblECLASClick(Sender: TObject);
begin

end;

{ TItemConta }

constructor TItemConta.Create( Collection: TCollection );
begin
   inherited Create( Collection );
   FCod_pro := 0;
   FQuant := 0;
   FQauntEdit := 0;
   FCanceladoNoCupom := False;
   FOrdemCupom := 0;
   FDescricao := '';
   FSelecionado := True;
   with  TListaItens( Collection )  do
      begin
         Fpanel := TChatBallao.Create( FForm );
         Fpanel.Align := alTop;
         Fpanel.AlignWithMargins := True;
         Fpanel.Margins.Top := 1;
         Fpanel.Margins.Bottom := 1;
//         Fpanel.BevelOuter := bvNone;
         Fpanel.Height := TfrmSelecionaItens( FForm ).pnlTempitem.Height;
         Fpanel.Name :=   'Panel' + IntToStr( Index );
         Fpanel.Parent := TfrmSelecionaItens( FForm ).Scroll;
         FEdt := TCurrencyEdit.Create( FForm );
         FEdt.Align := TfrmSelecionaItens( FForm ).edtQuanttemp.Align;
         FEdt.Width := TfrmSelecionaItens( FForm ).edtQuanttemp.Width;
         FEdt.OnExit := edtQuanttempExit;
         FEdt.DisplayFormat := TfrmSelecionaItens( FForm ).edtQuanttemp.DisplayFormat;
         FEdt.DecimalPlaces := TfrmSelecionaItens( FForm ).edtQuanttemp.DecimalPlaces;
         FEdt.Margins.Assign( TfrmSelecionaItens( FForm ).edtQuanttemp.Margins );
         FEdt.ParentFont := False;
         FEdt.Font.Assign( TfrmSelecionaItens( FForm ).edtQuanttemp.Font );
         FEdt.TabStop := False;
         FEdt.Name := 'Edit' + IntToStr( Index );
         FEdt.Parent := Fpanel;
         FLabel := TLabel.Create( FForm );
         FLabel.AutoSize := False;
         FLabel.Font.Assign( TfrmSelecionaItens( FForm ).lbltempQuant.Font );
         FLabel.Align := TfrmSelecionaItens( FForm ).lbltempQuant.Align;
         FLabel.Name :=  'Label' + IntToStr( Index );
         FLabel.Width := TfrmSelecionaItens( FForm ).lbltempQuant.Width;
         FLabel.Margins.Assign( TfrmSelecionaItens( FForm ).lbltempQuant.Margins );
         FLabel.ParentFont := False;
         FLabel.Font.Assign( TfrmSelecionaItens( FForm ).lbltempQuant.Font );
         FLabel.Parent := Fpanel;
         FCheckBox := TRzCheckBox.Create( FForm );
         FCheckBox.Width := TfrmSelecionaItens( FForm ).chkTempItem.Width;
         FCheckBox.Align := TfrmSelecionaItens( FForm ).chkTempItem.Align;
         FCheckBox.Name :=  'Check'  + IntToStr( Index );
         FCheckBox.Tag :=  Index;
         FCheckBox.Margins.Assign( TfrmSelecionaItens( FForm ).chkTempItem.Margins );
         FCheckBox.OnKeyDown := TfrmSelecionaItens( FForm ).chkTempItemKeyDown;
         FCheckBox.OnEnter := EnterCheck;
         FCheckBox.OnExit := ExitCheck;
         FCheckBox.Parent := Fpanel;
         FCheckBox.ParentFont := False;
         FCheckBox.Font.Assign( TfrmSelecionaItens( FForm ).chkTempItem.Font );
//         Fpanel.Caption := '';
         FCheckBox.Caption := FDescricao;
         FCheckBox.Checked := FSelecionado;
         FCheckBox.ParentFont := False;
         FCheckBox.ParentColor := False;
         FCheckBox.Color := Fpanel.Color1;
         FLabel.Caption := FormatFloat( FormatDisplay, FQuant );
         FEdt.Value := FQauntEdit;
         if Count > 1 then
            begin
               Fpanel.Top := ItensPedido[ Index - 1 ].Fpanel.Top +
                  ItensPedido[ Index - 1 ].Fpanel.Height + 10;
            end;

      end;
end;

destructor TItemConta.Destroy;
begin
{  if Assigned( FLabel ) then
     FreeAndNil( Fpanel );
  if Assigned( FEdt ) then
     FreeAndNil( FEdt );
  if Assigned( FCheckBox ) then
     FreeAndNil( FCheckBox );
  if Assigned( Fpanel ) then
     FreeAndNil( Fpanel );}
  inherited;
end;

procedure TItemConta.edtQuanttempExit(Sender: TObject);
begin
   if TCurrencyEdit( Sender ).Value > FQuant then
      begin
         KDialog( 'Quantidade Informada Maior que a quantidade real', 'Seleção de Itens', 'INFO' );
         TCurrencyEdit( Sender ).Value := FQuant;
         TCurrencyEdit( Sender ).SetFocus;
         TCurrencyEdit( Sender ).SelectAll;
      end;
end;

procedure TItemConta.EnterCheck(Sender: TObject);
begin
   TRzCheckBox( Sender ).Font.Color := clRed;
   TRzCheckBox( Sender ).Font.Style := [fsBold];
end;

procedure TItemConta.ExitCheck(Sender: TObject);
begin
   TRzCheckBox( Sender ).Font.Color := clBlack;
   TRzCheckBox( Sender ).Font.Style := [];
end;

function TItemConta.GetQuantEdit: Extended;
begin
   Result := FEdt.Value;
end;

function TItemConta.GetSelecionado: Boolean;
begin
   Result := FCheckBox.Checked;
end;

procedure TItemConta.SetCanceladoNoCupom(const Value: Boolean);
begin
  FCanceladoNoCupom := Value;
end;

procedure TItemConta.SetCodIcms(const Value: Integer);
begin
  FCodIcms := Value;
end;

procedure TItemConta.SetCodigoBarras(const Value: String);
begin
  FCodigoBarras := Value;
end;

procedure TItemConta.SetCod_pro(const Value: Integer);
begin
  FCod_pro := Value;
  FCheckBox.Caption := IntToStr( FOrdem ) + ') ' + IntToStr( FCod_pro ) +
  ' - ' + FDescricao;
  FLabel.Caption := 'x ' + FormatFloat( TListaItens( Collection ).FormatDisplay, FQuant );
end;

procedure TItemConta.SetDescricao(const Value: string);
begin
  FDescricao := Value;
  FCheckBox.Caption := IntToStr( FOrdem ) + ') ' + IntToStr( FCod_pro ) +
  ' - ' + FDescricao;
  FLabel.Caption := 'x ' + FormatFloat( TListaItens( Collection ).FormatDisplay, FQuant );
end;

procedure TItemConta.SetOrdem(const Value: Integer);
begin
  FOrdem := Value;
  FCheckBox.Caption := IntToStr( FOrdem ) + ') ' + IntToStr( FCod_pro ) +
  ' - ' + FDescricao;
  FLabel.Caption := 'x ' + FormatFloat( TListaItens( Collection ).FormatDisplay, FQuant );

end;

procedure TItemConta.SetOrdemCupom(const Value: Integer);
begin
  FOrdemCupom := Value;
end;

procedure TItemConta.SetQauntEdit(const Value: Extended);
begin
  FQauntEdit := Value;
  FEdt.Value := FQauntEdit;
end;

procedure TItemConta.SetQuant(const Value: Extended);
begin
  FQuant := Value;
  FCheckBox.Caption := IntToStr( FOrdem ) + ') ' + IntToStr( FCod_pro ) +
  ' - ' + FDescricao;
  FLabel.Caption := 'x ' + FormatFloat( TListaItens( Collection ).FormatDisplay, FQuant );
end;

procedure TItemConta.SetSelecionado(const Value: Boolean);
begin
  FSelecionado := Value;
  FCheckBox.Checked := FSelecionado;
end;

procedure TItemConta.SetUnidade(const Value: String);
begin
  FUnidade := Value;
end;

procedure TItemConta.SetValor(const Value: Currency);
begin
  FValor := Value;
end;

{ TListaItens }

function TListaItens.BuscaItemOrdemCupom(Ordem: Integer): TItemConta;
var
   I: Integer;
begin
   Result := Nil;
   for I := 0 to Self.Count - 1 do
       begin
          if Self.ItensPedido[I].OrdemCupom = Ordem then
             begin
                Result := Self.ItensPedido[I];
                Break;
             end;
       end;
end;

constructor TListaItens.Create(AOwner: TForm);
begin
  inherited Create( TItemConta );
  FForm := AOwner;
end;


function TListaItens.GetItensPedido(Index: Integer): TItemConta;
begin
   Result := TItemConta( Items[Index] );
end;

function TListaItens.Novo: TItemConta;
begin
   Result := Add as TItemConta;
end;

function TListaItens.QuantidadeSelecionada: Integer;
var
  I: Integer;
begin
   Result := 0;
   for I := 0 to Self.Count - 1 do
       begin
          if Self.ItensPedido[I].Selecionado then
            Inc( Result );
       end;
end;

procedure TListaItens.SetCodigoConta(const Value: Integer);
begin
  FCodigoConta := Value;
end;

procedure TListaItens.SetFormatDisplay(const Value: string);
begin
  FFormatDisplay := Value;
end;

procedure TListaItens.SetItensPedido(Index: Integer; const Value: TItemConta);
begin

end;

end.
