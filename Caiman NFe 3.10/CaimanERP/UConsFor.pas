unit UConsFor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, 
  UNovosComponentes, UNovoFormulario;

type
  TFrmConsFor = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    ComboCons: TComboBox;
    GB2: TGroupBox;
    EdtCons: TEdit;
    BtnOk: TButton;
    Panel2: TPanel;
    BtnSair: TButton;
    DBGrid: TDBGrid;
    BtnLocalizar: TButton;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ComboConsChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsFor: TFrmConsFor;

implementation
uses
  Udm, Ubibli1, UCadFor, UContasPagar, UConsLancPagar, UContasPagarPag, 
  UConsPagar, UEntradas, UConsEntrada, URelEntradas, URelContasPagar, URelPagas, 
  UOutrasEntradas, UConsOutrasEntradas, URelOutrasEntradas, URelExtratoFor, 
  UNotaFiscal, URelBal, URelEnvelope, UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsFor.BtnSairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmConsFor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   {grava a posicao do combo}
   dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsFor.ComboCons', inttostr(ComboCons.itemIndex));
   if Tag < 41 then
      begin
         if dm.IBTransaction.Active then
           dm.IBTransaction.Commit;
         dm.QFor.Close;

         Action:= caFree;
      end;
end;

procedure TFrmConsFor.BtnOkClick(Sender: TObject);
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QFor do
     begin
        close;
        sql.Clear;
        case ComboCons.ItemIndex of
         0:begin
              if EdtCons.Text = '' then
                 sql.Text:= 'SELECT * FROM FORNECEDOR ORDER BY COD_FOR'
              else
                 sql.Text:= 'SELECT * FROM FORNECEDOR WHERE COD_FOR = ' + edtcons.Text;
              open;
           end;
         1:begin
              sql.Text:= 'SELECT * FROM FORNECEDOR WHERE RAZAO_FOR LIKE ' + #39 + edtcons.Text + '%' + #39 + ' ORDER BY RAZAO_FOR';
              open;
           end;
         2:begin
              sql.Text:= 'SELECT * FROM FORNECEDOR WHERE CNPJ_FOR = ' + #39 + FormataCNPJ(trim(edtcons.Text)) + #39;
              open;
           end;
         3:begin
              sql.Text:= 'SELECT * FROM FORNECEDOR WHERE RAZAO_FOR LIKE ' + #39 + '%' + trim(EdtCons.Text) + '%' + #39 + ' ORDER BY RAZAO_FOR';
              open;
           end;
        end;
     end;
  dm.IBTransaction.CommitRetaining;
  dbgrid.SetFocus;
end;

procedure TFrmConsFor.BtnLocalizarClick(Sender: TObject);
var i : integer;
begin
   case tag of
     0,5: begin
             BuscaFormulario( TFrmCadFor, True );
             with FrmCadFor do
                begin
                   tag:= 1;
                   limpaedit(FrmCadFor);
                   ededit(FrmCadFor, false);
                   cod_for.Text         := dm.QForCOD_FOR.AsString;
                   if trim(dm.QForFJ_FOR.AsString) = 'F' then
                      begin
                         combofj.ItemIndex:= 0;
                         label11.Caption   := 'CPF';
                         label4.Caption    := 'Documento';
                         edtcnpj.EditMask  := '999.999.999-99;1;_';
                      end
                   else
                      begin
                         combofj.ItemIndex:= 1;
                         label11.Caption   := 'CNPJ';
                         label4.Caption    := 'Insc.Estadual';
                         edtcnpj.EditMask  := '99.999.999/9999-99;1;_';
                      end;
                   edtnome.Text         := dm.QForRAZAO_FOR.AsString;
                   edtend.Text          := dm.QForEND_FOR.AsString;
                   edtbai.Text          := dm.QForBAI_FOR.AsString;
                   edtcid.Text          := dm.QForCID_FOR.AsString;
                   for i:= 0 to 26 do
                      begin
                         if comboest.Items[i] = dm.QForEST_FOR.AsString then
                            comboest.ItemIndex:= i;
                      end;
                   edtcep.Text          := dm.QForCEP_FOR.AsString;
                   edttel.Text          := dm.QForTEL_FOR.AsString;
                   edtfax.Text          := dm.QForFAX_FOR.AsString;
                   edtcnpj.Text         := dm.QForCNPJ_FOR.AsString;
                   edtinsc.Text         := dm.QForINSC_FOR.AsString;
                   edtcontato.Text      := dm.QForCONTATO_FOR.AsString;
                   EdtIBGE.text         := dm.QForCODIGO_IBGE.AsString;
                   EdtNum.Text          := dm.QForNUM_FOR.AsString;
                   EdtEmail.Text        := dm.QForEMAIL_FOR.AsString;
                   FormShow(sender);
                   show;
                end;
             ModalResult := mrOK;
          end;
     1: begin
           with FrmContasPagar do
              begin
                 edtcodfor.Text    := dm.QForCOD_FOR.AsString;
                 edtnomefor.Text   := dm.QForRAZAO_FOR.Value;
                 EdtCodClassif.SetFocus;
              end;
           ModalResult := mrOK;
        end;
     2: begin
           with FrmConsLancPagar do
              begin
                 edtcodfor.Text  := dm.QForCOD_FOR.AsString;
                 edtnomefor.Text := dm.QForRAZAO_FOR.Value;
                 edtdataini.SetFocus;
              end;
           ModalResult := mrOK;
        end;
     3: begin
           with FrmContasPagarPag do
              begin
                 edtcodfor.Text   := dm.QForCOD_FOR.AsString;
                 edtnomefor.Text  := dm.QForRAZAO_FOR.Value;
                 btnok.SetFocus;
              end;
           ModalResult := mrOK;
        end;
     4: begin
           with FrmConsPagar do
              begin
                 edtcodfor.Text   := dm.QForCOD_FOR.AsString;
                 edtnomefor.Text  := dm.QForRAZAO_FOR.Value;
                 edtdataini.SetFocus;
              end;
           ModalResult := mrOK;
        end;
     6: begin
           with FrmEntradas do
              begin
                 edtcodfor.Text  := dm.QForCOD_FOR.AsString;
                 edtnomefor.Text := dm.QForRAZAO_FOR.Value;
                 EdtTotalProdutos.SetFocus;
              end;
           ModalResult := mrOK;
        end;
     7: begin
           with FrmConsEntrada do
              begin
                 edtcodfor.Text    := dm.QForCOD_FOR.AsString;
                 edtnomefor.Text   := dm.QForRAZAO_FOR.Value;
              end;
           ModalResult := mrOK;
        end;
     8: begin
           with FrmRelEntradas do
              begin
                 edtcodfor.Text  := dm.QForCOD_FOR.AsString;
                 edtnomefor.Text := dm.QForRAZAO_FOR.Value;
                 BtnOk.SetFocus;
              end;
           ModalResult := mrOK;
        end;
     9: begin
           with FrmRelContasAPagar do
              begin
                 EdtCodIni.Text  := dm.QForCOD_FOR.AsString;
                 EdtNomeIni.Text := dm.QForRAZAO_FOR.Value;
                 EdtCodFin.SetFocus;
             end;
           ModalResult := mrOK;
        end;
     10: begin
            with FrmRelContasAPagar do
               begin
                  EdtCodFin.Text  := dm.QForCOD_FOR.AsString;
                  EdtNomeFin.Text := dm.QForRAZAO_FOR.Value;
                  BtnVis.SetFocus;
               end;
            ModalResult := mrOK;
         end;
     11: begin
            with FrmRelPagas do
               begin
                  edtcodini.Text  := dm.QForCOD_FOR.AsString;
                  edtnomeini.Text := dm.QForRAZAO_FOR.Value;
                  edtcodfin.SetFocus;
               end;
            ModalResult := mrOK;
         end;
     12: begin
            with FrmRelPagas do
               begin
                  edtcodfin.Text  := dm.QForCOD_FOR.AsString;
                  edtnomefin.Text := dm.QForRAZAO_FOR.Value;
                  btnvis.SetFocus;
               end;
            ModalResult := mrOK;
         end;
     13: begin
            with FrmOutrasEntradas do
               begin
                  EdtCodFor.Text   := dm.QForCOD_FOR.AsString;
                  EdtNomeFor.Text  := dm.QForRAZAO_FOR.Value;
               end;
            ModalResult := mrOK;
         end;
     14: begin
            with FrmConsOutrasEntradas do
               begin
                  EdtCodFor.Text   := dm.QForCOD_FOR.AsString;
                  EdtNomeFor.Text  := dm.QForRAZAO_FOR.Value;
               end;
            ModalResult := mrOK;
         end;
     15: begin
            with FrmRelOutrasEntradas do
               begin
                  EdtCodFor.Text   := dm.QForCOD_FOR.AsString;
                  EdtNomeFor.Text  := dm.QForRAZAO_FOR.Value;
               end;
            ModalResult := mrOK;
         end;
     16: begin
            with FrmRelExtratoFor do
               begin
                  edtcod.Text  := dm.QForCOD_FOR.AsString;
                  edtnome.Text := dm.QForRAZAO_FOR.Value;
                  btnok.SetFocus;
               end;
            ModalResult := mrOK;
         end;
     17: begin
            with FrmNotaFiscal do
               begin
                  EdtCliFor.Text     := dm.QForCOD_FOR.AsString;
                  EdtNomeCliFor.Text := dm.QForRAZAO_FOR.Value;
                  EdtCodTPV.SetFocus;
               end;
            ModalResult := mrOK;
         end;
    { 18: begin
            with FrmDefProduto do
               begin
                  EdtCodFor.Text  := dm.QForCOD_FOR.AsString;
                  EdtNomeFor.Text := dm.QForRAZAO_FOR.AsString;
               end;
            ModalResult := mrOK;
         end;           }
     19: begin
            with FrmRelBal do
               begin
                  EdtCod.Text  := dm.QForCOD_FOR.AsString;
                  EdtNome.Text := dm.QForRAZAO_FOR.AsString;
                  BtnVis.SetFocus;
               end;
            ModalResult := mrOK;
         end;
     20: begin
            with FrmRelEnvelope do
               begin
                  EdtCod.Text  := dm.QForCOD_FOR.AsString;
                  EdtNome.Text := dm.QForRAZAO_FOR.AsString;
                  BtnOK.SetFocus;
               end;
            ModalResult := mrOK;
         end;
      41: ModalResult := mrOK;
   end;
end;

procedure TFrmConsFor.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f3 then
     edtcons.SetFocus;
end;

procedure TFrmConsFor.FormShow(Sender: TObject);
begin
   {busca a posicao do combo}
   try
     ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsFor.ComboCons'));
   except
     ComboCons.ItemIndex:= 0;
   end;
end;

procedure TFrmConsFor.ComboConsChange(Sender: TObject);
begin
   edtcons.Clear;
end;

procedure TFrmConsFor.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsFor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      begin
         btnsair.SetFocus;
         close;
      end;
end;

end.
