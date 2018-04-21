unit UConsCentroCusto;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, StdCtrls, Mask, Grids, DBGrids, ExtCtrls, ComCtrls, UNovosComponentes, UNovoFormulario;

type
  TFrmConsCentroCusto = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    DBGrid: TDBGrid;
    BtnLocalizar: TButton;
    BtnSair: TButton;
    Panel1: TPanel;
    GB2: TGroupBox;
    EdtCons: TEdit;
    EdtConta: TMaskEdit;
    BtnOk: TButton;
    GB1: TGroupBox;
    ComboCons: TComboBox;
    procedure ComboConsChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsCentroCusto: TFrmConsCentroCusto;

implementation
Uses Udm, Ubibli1, UCadCentroCusto, ULancCC, UCadFormasPagamentos, UContasPagar,
     UCTRAdmRec, ULancContasPagar, UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsCentroCusto.ComboConsChange(Sender: TObject);
begin 
   case combocons.ItemIndex of
     0: begin 
           gb2.Caption       := 'Código';
           EdtConta.Visible  := false;
           EdtCons.Visible   := true;
           edtcons.Clear;
           edtcons.SetFocus;
        end;
     1: begin 
           gb2.Caption       := 'Número da Conta';
           edtcons.Visible   := false;
           EdtConta.Visible  := true;
           EdtConta.Clear;
           EdtConta.SetFocus;
        end;
     2: begin 
           gb2.Caption       := 'Nome da Conta';
           EdtConta.Visible  := false;
           edtcons.Visible   := true;
           edtcons.Clear;
           edtcons.SetFocus;
        end;
   end;
end;

procedure TFrmConsCentroCusto.FormShow(Sender: TObject);
begin 
   ComboCons.ItemIndex:= 0;
   ComboConsChange(sender);
end;

procedure TFrmConsCentroCusto.BtnOkClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QCentroCusto do
     begin 
        close;
        sql.Clear;
        sql.Add('SELECT * FROM CENTRO_CUSTO ');
        case ComboCons.ItemIndex of
          0: begin 
                if trim(EdtCons.Text) = '' then
                   sql.Add(' ORDER BY CODIGO')
                else
                   begin 
                      sql.Add(' WHERE CODIGO = :COD');
                      Parambyname('cod').AsInteger:= strtoint(EdtCons.Text);
                   end;
             end;
          1: begin 
                if trim(EdtConta.Text) = '' then
                   sql.Add(' ORDER BY CONTA')
                else
                   sql.add(' WHERE CONTA = ' + #39 + EdtConta.Text + #39);
             end;
          2: begin 
                sql.Add(' WHERE DESCRICAO LIKE ' +#39 + edtcons.Text + '%' + #39 +
                        ' ORDER BY DESCRICAO');
             end;
        end;
        open;
     end;
   dm.IBTransaction.CommitRetaining;
   dbgrid.SetFocus;
end;

procedure TFrmConsCentroCusto.BtnLocalizarClick(Sender: TObject);
begin 
   case tag of
     0: begin 
          BuscaFormulario( TFrmCadCentroCusto, True );
          with FrmCadCentroCusto do
             begin 
                tag:= 1;
                limpaedit(FrmCadCentroCusto);
                ededit(FrmCadCentroCusto, false);
                codigo.Text     := dm.QCentroCustoCODIGO.AsString;
                EdtConta.Text   := dm.QCentroCustoCONTA.AsString;
                EdtNome.Text    := dm.QCentroCustoDESCRICAO.AsString;

                if trim(dm.QCentroCustoTIPO.AsString) = 'A' then
                   ComboTipo.ItemIndex := 0
                else
                   ComboTipo.ItemIndex := 1;

                if trim(dm.QCentroCustoRECEITA_DESPESA.AsString) = 'R' then
                   ComboDR.ItemIndex := 0
                else
                   ComboDR.ItemIndex := 1;

                ComboDC.ItemIndex:= dm.QCentroCustoDEBCRED.AsInteger;

                FormShow(sender);
                show;
             end;
          close;
        end;
     1: begin 
           with FrmLancCC do
              begin 
                 if trim(dm.QCentroCustoTIPO.AsString) = 'S' then
                    begin 
                       AlertaCad('Conta Sintética');
                       exit;
                    end;
                 EdtCodigoCentro.Text := dm.QCentroCustoCODIGO.AsString;
                 EdtCentroCusto.Text  := dm.QCentroCustoCONTA.AsString;
                 EdtNomeCentro.Text   := dm.QCentroCustoDESCRICAO.AsString;
                 EdtValorCentro.SetFocus;
              end;
           close;
        end;
     2: begin 
           with FrmCadFormaPagamento do
              begin 
                 if trim(dm.QCentroCustoTIPO.AsString) = 'S' then
                    begin 
                       AlertaCad('Conta Sintética');
                       exit;
                    end;
                 EdtCodCentroCustoVendas.Text := dm.QCentroCustoCODIGO.AsString;
                 EdtCentroCustoVendas.Text    := dm.QCentroCustoCONTA.AsString;
                 EdtNomeCentroVendas.Text     := dm.QCentroCustoDESCRICAO.AsString;
              end;
           close;
        end;
     3: begin 
           with FrmCadFormaPagamento do
              begin 
                 if trim(dm.QCentroCustoTIPO.AsString) = 'S' then
                    begin 
                       AlertaCad('Conta Sintética');
                       exit;
                    end;
                 EdtCodCentroCustoCTR.Text   := dm.QCentroCustoCODIGO.AsString;
                 EdtCentroCustoCTR.Text      := dm.QCentroCustoCONTA.AsString;
                 EdtNomeCentroCustoCTR.Text  := dm.QCentroCustoDESCRICAO.AsString;
              end;
           close;
        end;
     5: begin 
           with FrmCadFormaPagamento do
              begin 
                 if trim(dm.QCentroCustoTIPO.AsString) = 'S' then
                    begin 
                       AlertaCad('Conta Sintética');
                       exit;
                    end;
                 EdtCodCentroCustoCTREstorno.Text   := dm.QCentroCustoCODIGO.AsString;
                 EdtCentroCustoCTREstorno.Text      := dm.QCentroCustoCONTA.AsString;
                 EdtNomeCentroCustoCTREstorno.Text  := dm.QCentroCustoDESCRICAO.AsString;
              end;
           close;
        end;
     6: begin 
           with FrmCadFormaPagamento do
              begin 
                 if trim(dm.QCentroCustoTIPO.AsString) = 'S' then
                    begin 
                       AlertaCad('Conta Sintética');
                       exit;
                    end;
                 EdtCodCentroCustoCTPEstorno.Text   := dm.QCentroCustoCODIGO.AsString;
                 EdtCentroCustoCTPEstorno.Text      := dm.QCentroCustoCONTA.AsString;
                 EdtNomeCentroCustoCTPEstorno.Text  := dm.QCentroCustoDESCRICAO.AsString;
              end;
           close;
        end;
     7: begin 
           with FrmCadFormaPagamento do
              begin 
                 if trim(dm.QCentroCustoTIPO.AsString) = 'S' then
                    begin 
                       AlertaCad('Conta Sintética');
                       exit;
                    end;
                 EdtCodCentroCustoVendasEstorno.Text   := dm.QCentroCustoCODIGO.AsString;
                 EdtCentroCustoVendasEstorno.Text      := dm.QCentroCustoCONTA.AsString;
                 EdtNomeCentroCustoVendasEstorno.Text  := dm.QCentroCustoDESCRICAO.AsString;
              end;
           close;
        end;
     8: begin 
           with FrmContasPagar do
              begin 
                 if trim(dm.QCentroCustoTIPO.AsString) = 'S' then
                    begin 
                       AlertaCad('Conta Sintética');
                       exit;
                    end;
                 EdtCodCentroCusto.Text   := dm.QCentroCustoCODIGO.AsString;
                 EdtCentroCusto.Text      := dm.QCentroCustoCONTA.AsString;
                 EdtNomeCentroCusto.Text  := dm.QCentroCustoDESCRICAO.AsString;
              end;
           close;
        end;
     10: begin 
           with FrmCtrAdmRec do
              begin 
                 if trim(dm.QCentroCustoTIPO.AsString) = 'S' then
                    begin 
                       AlertaCad('Conta Sintética');
                       exit;
                    end;
                 EdtCodCentroCusto.Text   := dm.QCentroCustoCODIGO.AsString;
                 EdtCentroCusto.Text      := dm.QCentroCustoCONTA.AsString;
                 EdtNomeCentroCusto.Text  := dm.QCentroCustoDESCRICAO.AsString;
              end;
           close;
        end;
     11: begin 
           with FrmLancContasPagar do
              begin 
                 if trim(dm.QCentroCustoTIPO.AsString) = 'S' then
                    begin 
                       AlertaCad('Conta Sintética');
                       exit;
                    end;
                 EdtCodCentroCusto.Text   := dm.QCentroCustoCODIGO.AsString;
                 EdtCentroCusto.Text      := dm.QCentroCustoCONTA.AsString;
                 EdtNomeCentroCusto.Text  := dm.QCentroCustoDESCRICAO.AsString;
                 EdtTipoDoc.SetFocus;
              end;
           close;
        end;
   end;
end;

procedure TFrmConsCentroCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.QCentroCusto.Close;
   Action:= caFree;
end;

procedure TFrmConsCentroCusto.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsCentroCusto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmConsCentroCusto.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

end.
