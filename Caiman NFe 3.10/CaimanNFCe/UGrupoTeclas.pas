unit UGrupoTeclas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, CurvyControls, Mask, DB, RxToolEdit, RxCurrEdit, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TProdutos = class( TCollectionItem )
       public
        CodigoProduto: Integer;
        Quantidade: Double;
        Valor: Currency;
        CodICMS: Integer;
        Unidade: string;
        DescCupom: string;
        codigoBarras: string;
  end;
  TfrmGrupoTeclas = class(TForm)
    P0: TCurvyPanel;
    lblStatus: TLabel;
    C0: TCheckBox;
    P1: TCurvyPanel;
    C1: TCheckBox;
    P2: TCurvyPanel;
    C2: TCheckBox;
    P3: TCurvyPanel;
    C3: TCheckBox;
    P4: TCurvyPanel;
    C4: TCheckBox;
    P5: TCurvyPanel;
    C5: TCheckBox;
    P6: TCurvyPanel;
    C6: TCheckBox;
    P7: TCurvyPanel;
    C7: TCheckBox;
    P8: TCurvyPanel;
    C8: TCheckBox;
    P9: TCurvyPanel;
    C9: TCheckBox;
    QConsulta: TFDQuery;
    TRTeclas: TFDTransaction;
    E0: TEdit;
    E1: TEdit;
    E2: TEdit;
    E3: TEdit;
    E4: TEdit;
    E5: TEdit;
    E6: TEdit;
    E7: TEdit;
    E8: TEdit;
    E9: TEdit;
    Q0: TCurrencyEdit;
    Q1: TCurrencyEdit;
    Q2: TCurrencyEdit;
    Q3: TCurrencyEdit;
    Q4: TCurrencyEdit;
    Q5: TCurrencyEdit;
    Q6: TCurrencyEdit;
    Q7: TCurrencyEdit;
    Q8: TCurrencyEdit;
    Q9: TCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MostraBotoes;
    procedure Q0KeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure GeraClasse;
    procedure C0Click(Sender: TObject);
  private
    { Private declarations }
    Foco: Boolean;
  public
    { Public declarations }
    Tecla: Char;
    Produtos: TCollection;
  end;

var
  frmGrupoTeclas: TfrmGrupoTeclas;

implementation

uses
  UDM;

{$R *.dfm}

procedure TfrmGrupoTeclas.C0Click(Sender: TObject);
var
   T: string;
begin
         if TCheckBox( Sender ).Checked then
            begin
               if not TeclasSemQuantidade then
                  begin
                     T := Copy( TCheckBox( Sender ).Name, 2, 1 );
                    TCurrencyEdit( FindComponent( 'Q' + UpperCase( T ) ) ).Enabled := True;
                    TCurrencyEdit( FindComponent( 'Q' + UpperCase( T ) ) ).SetFocus;
                    TCurrencyEdit( FindComponent( 'Q' + UpperCase( T ) ) ).SelectAll;
                     TCurrencyEdit( FindComponent( 'Q' + UpperCase( T ) ) ).Color := clYellow;
                    Foco := true;
                  end;
            end;

end;

procedure TfrmGrupoTeclas.FormCreate(Sender: TObject);
begin
   dm.ScaleForm( Self, True );
   Self.Position := poScreenCenter;
   Foco := False;
   Produtos := TCollection.Create( TProdutos );
   Produtos.Clear;
end;

procedure TfrmGrupoTeclas.FormDestroy(Sender: TObject);
begin
   Produtos.Clear;
   FreeAndNil( Produtos );
end;

procedure TfrmGrupoTeclas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Foco then
      Exit;
   if Chr( Key ) = Tecla  then
      begin
         GeraClasse;
         ModalResult := mrOk;
         Exit;
      end;
   if Key = VK_ESCAPE then
       begin
          ModalResult := mrCancel;
       end;
   if FindComponent( 'C' + UpperCase( Chr( key ) ) ) <> nil then
      begin
         TCheckBox( FindComponent( 'C' + UpperCase( Chr( key ) ) ) ).Checked := not
            TCheckBox( FindComponent( 'C' + UpperCase( Chr( key ) ) ) ).Checked;
         if TCheckBox( FindComponent( 'C' + UpperCase( Chr( key ) ) ) ).Checked then
            begin
               if TeclasSemQuantidade then
                  begin
                     GeraClasse;
                     ModalResult := mrOk;
                     Foco := False;
                     Exit;
                  end;
              TCurrencyEdit( FindComponent( 'Q' + UpperCase( Chr( key ) ) ) ).Enabled := True;
              TCurrencyEdit( FindComponent( 'Q' + UpperCase( Chr( key ) ) ) ).SetFocus;
              TCurrencyEdit( FindComponent( 'Q' + UpperCase( Chr( key ) ) ) ).SelectAll;
               TCurrencyEdit( FindComponent( 'Q' + UpperCase( Chr( key ) ) ) ).Color := clYellow;
              Foco := true;
            end;
      end;
end;

procedure TfrmGrupoTeclas.FormShow(Sender: TObject);
var
    I: Integer;
begin
   for I := 0 to 9 do
       if FindComponent( 'P' + IntToStr( I ) ) <> nil then
          TCurvyPanel( FindComponent( 'P' + IntToStr( I ) ) ).Visible := False;
   if TeclasSemQuantidade then
      begin
         for I := 0 to 9 do
             if FindComponent( 'Q' + IntToStr( I ) ) <> nil then
                TCurvyPanel( FindComponent( 'Q' + IntToStr( I ) ) ).Visible := False;
      end;
   MostraBotoes;
end;

procedure TfrmGrupoTeclas.GeraClasse;
var
  I: Integer;
begin
   for I := 0 to 9 do
      begin
         if not TCurvyPanel( FindComponent( 'P' + IntToStr( I ) ) ).Visible  then
            Continue;
         if not TCheckBox( FindComponent( 'C' + IntToStr( I ) ) ).Checked  then
            Continue;
         if TCurrencyEdit(  FindComponent( 'Q' + IntToStr( I ) )).Value <= 0  then
            Continue;
         with TProdutos( Produtos.Add ) do
            begin
               CodigoProduto :=
                    StrToInt( TEdit( FindComponent( 'E' + IntToStr( I ) ) ).Text );
               Quantidade :=  TCurrencyEdit( FindComponent( 'Q' + IntToStr( I ) ) ).Value;
               if TRTeclas.Active then
                  TRTeclas.Commit;
               TRTeclas.StartTransaction;
               with QConsulta do
                  begin
                     Close;
                     SQL.Clear;
                     SQL.Text := 'select P.valor_pro, P.icms_cf_est, P.CODIGO_BARRA_PRO, P.DESC_CUPOM,' +
                                 ' U.descricao from produto P' +
                                 ' inner join unidade_medida U' +
                                 ' on ( U.codigo = p.codigo_unidade_saida )' +
                                 ' where P.cod_pro=:codpro';
                     ParamByName( 'codpro' ).AsInteger := CodigoProduto;
                     Open;
                     if not IsEmpty then
                        Valor := FieldByName( 'valor_pro' ).AsCurrency
                     else
                        Valor := 0;
                     CodICMS := FieldByName( 'icms_cf_est' ).AsInteger;
                     Unidade := FieldByName( 'descricao' ).AsString;
                     DescCupom :=  FieldByName( 'DESC_CUPOM' ).AsString;
                     codigoBarras :=  FieldByName( 'CODIGO_BARRA_PRO' ).AsString;
                     Close;
                  end;
               TRTeclas.Commit;
            end;
      end;
end;

procedure TfrmGrupoTeclas.MostraBotoes;
var
   DescPanel, DescCheck, DescEdit, DescE: String;
   Panel: TComponent;
   Check: TComponent;
   Editd: TComponent;
   E: TComponent;
begin
   if TRTeclas.Active then
      TRTeclas.Commit;
   TRTeclas.StartTransaction;

   with QConsulta do
       begin
          Close;
          Sql.Clear;
          Sql.Text := 'Select T.DESCRICAO, P.desc_cupom, TD.* from GRUPO_TECLAS_DETALHES TD ' +
                      ' inner join GRUPO_TECLAS T ' +
                      ' on ( T.TECLA = TD.TECLA ) ' +
                      ' INNER JOIN PRODUTO P ' +
                      ' ON ( P.cod_pro = TD.cod_pro )' +
                      ' where TD.TECLA=:TECLA';
          ParamByName( 'TECLA' ).AsString := Tecla;
          Open;
          First;
          Self.Caption := 'Grupo ( ' + FieldByName( 'DESCRICAO' ).AsString + ' )';
          lblStatus.Caption := 'Pressione ' + Tecla + ' Para confirmar';
          while  not Eof do
             begin
                DescPanel := Trim( 'P' + FieldByName( 'NUMERO').AsString );
                Panel := frmGrupoTeclas.FindComponent(  DescPanel );
                DescCheck := Trim( 'C' + FieldByName( 'NUMERO').AsString );
                Check :=   frmGrupoTeclas.FindComponent( DescCheck );
                DescEdit := Trim( 'Q' + FieldByName( 'NUMERO').AsString );
                Editd :=  frmGrupoTeclas.FindComponent( DescEdit ) ;
                DescE := Trim( 'E' + FieldByName( 'NUMERO').AsString );
                E :=  frmGrupoTeclas.FindComponent(  DescE );
                TCurvyPanel( Panel ).Visible := true;
                TCheckBox( Check ).Visible := True;
                TCheckBox( Check ).Caption :=
                   FieldByName( 'DESC_CUPOM' ).AsString;
                TCheckBox( Check ).Checked := False;
                TCurrencyEdit( Editd ).Text := '1';
                TEdit( E ).Text := FieldByName( 'COD_PRO' ).AsString;
                Next;
             end;
          Close;
       end;

   TRTeclas.Commit;
end;

procedure TfrmGrupoTeclas.Q0KeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         Foco := False;
         TCurrencyEdit( Sender ).Color := clWindow;
         frmGrupoTeclas.SetFocus;
         TCurrencyEdit( Sender ).Enabled := False;
      end;
end;

end.
