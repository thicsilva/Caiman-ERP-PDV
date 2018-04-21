unit UAltPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, StdCtrls, Mask, Buttons, DB, ComCtrls, pngimage, 
  rxToolEdit, rxCurrEdit, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmAltPreco = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtnCancelar: TBitBtn;
    BtnOK: TBitBtn;
    Label1: TLabel;
    EdtValor: TCurrencyEdit;
    Label2: TLabel;
    EdtPromocao: TCurrencyEdit;
    QAlteraPreco: TFDQuery;
    IBTRPreco: TFDTransaction;
    Label3: TLabel;
    EdtCusto: TCurrencyEdit;
    StatusBar1: TStatusBar;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    EdtMLVarejoNormal: TCurrencyEdit;
    Label7: TLabel;
    EdtMLVarejoPro: TCurrencyEdit;
    Label11: TLabel;
    EdtProgramado: TCurrencyEdit;
    Label12: TLabel;
    EdtMLProgramado: TCurrencyEdit;
    GroupBox1: TGroupBox;
    LProduto: TLabel;
    Label13: TLabel;
    EdtMLVarejoNormalReal: TCurrencyEdit;
    Label14: TLabel;
    EdtMLVarejoProgReal: TCurrencyEdit;
    Label15: TLabel;
    EdtMLVarejoPromoReal: TCurrencyEdit;
    Label16: TLabel;
    EdtLucroVarejoNormal: TCurrencyEdit;
    Label17: TLabel;
    EdtLucroProg: TCurrencyEdit;
    Label18: TLabel;
    EdtLucroPromo: TCurrencyEdit;
    Image1: TImage;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtValorExit(Sender: TObject);
    procedure EdtMLVarejoNormalExit(Sender: TObject);
    procedure EdtMLVarejoProExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtMLProgramadoExit(Sender: TObject);
    procedure EdtMLVarejoNormalRealExit(Sender: TObject);
    procedure EdtMLVarejoProgRealExit(Sender: TObject);
    procedure EdtMLVarejoPromoRealExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAltPreco: TFrmAltPreco;

implementation
uses
  Udm, UAlteraPreco, UNovoPrincipal;

{$R *.dfm}

procedure TFrmAltPreco.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmAltPreco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      btncancelar.Click;
end;

procedure TFrmAltPreco.BtnCancelarClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmAltPreco.BtnOKClick(Sender: TObject);
var bInserido : boolean;
begin 
   { ALTERA VALOR DE VENDA E PROMOÇÃO }
   if IBTRPreco.Active then
      IBTRPreco.Commit;
   IBTRPreco.StartTransaction;
   try
     try
       with QAlteraPreco do
          begin 
             close;
             Parambyname('valorpro').AsCurrency    := strtocurr(edtvalor.Text);
             Parambyname('promocaopro').AsCurrency := strtocurr(EdtPromocao.Text);
             Parambyname('pg').AsCurrency          := strtocurr(EdtProgramado.Text);
             Parambyname('pc').AsCurrency          := strtocurr(EdtCusto.Text);
             Parambyname('codpro').AsInteger       := FrmAlteraPreco.QConsProdCODPRO.AsInteger;
             ExecOrOpen;
          end;
       IBTRPreco.Commit;
     except
       IBTRPreco.Rollback;
       AlertaCad('Erro ao Atualizar o Preço do Produto');
     end;
   finally
     QAlteraPreco.Close;
   end;

   FrmAlteraPreco.BtnOk.Click;
   close;
end;

procedure TFrmAltPreco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmAltPreco.EdtValorExit(Sender: TObject);
begin 
   if strtocurr(EdtCusto.Text) > 0 then
      begin 
         with sender as TCurrencyEdit do
            begin 
               if strtocurr(text) > 0 then
                  begin 
                     if sender = EdtValor then
                        begin 
                           EdtMLVarejoNormal.Text    := currtostr((((StrToCurr(EdtValor.text) - strtocurr(edtcusto.Text)) * 100) / strtocurr(EdtCusto.text)));
                           EdtMLVarejoNormalReal.Text:= currtostr((((strtocurr(EdtValor.Text) - strtocurr(EdtCusto.Text)) / strtocurr(EdtValor.Text)) * 100));
                           EdtLucroVarejoNormal.Text := currtostr(strtocurr(EdtValor.Text) - strtocurr(EdtCusto.Text));
                        end
                     else
                     if sender = EdtProgramado then
                        begin 
                           EdtMLProgramado.Text     := currtostr((((StrToCurr(EdtProgramado.text) - strtocurr(edtcusto.Text)) * 100) / strtocurr(EdtCusto.text)));
                           EdtMLVarejoProgReal.Text := currtostr((((strtocurr(EdtProgramado.Text) - strtocurr(EdtCusto.Text)) / strtocurr(EdtProgramado.Text)) * 100));
                           EdtLucroProg.Text        := currtostr(strtocurr(EdtProgramado.Text) - strtocurr(EdtCusto.Text));
                        end
                     else
                     if sender = EdtPromocao then
                        begin 
                           EdtMLVarejoPro.Text       := currtostr((((StrToCurr(EdtPromocao.text) - strtocurr(edtcusto.Text)) * 100) / strtocurr(EdtCusto.text)));
                           EdtMLVarejoPromoReal.Text := currtostr((((strtocurr(EdtPromocao.Text) - strtocurr(EdtCusto.Text)) / strtocurr(EdtPromocao.Text)) * 100));
                           EdtLucroPromo.Text        := currtostr(strtocurr(EdtPromocao.Text) - strtocurr(EdtCusto.Text));
                        end;
                  end;
            end;
      end
   else
      begin 
         EdtMLVarejoNormal.Clear;
         EdtMLVarejoNormalReal.Clear;
         EdtLucroVarejoNormal.Clear;

         EdtMLProgramado.Clear;
         EdtMLVarejoProgReal.Clear;
         EdtLucroProg.Clear;

         EdtMLVarejoPro.Clear;
         EdtMLVarejoPromoReal.Clear;
         EdtLucroPromo.Clear;
      end;
end;

procedure TFrmAltPreco.EdtMLVarejoNormalExit(Sender: TObject);
begin 
   if strtocurr(EdtValor.Text) > 0 then
      begin 
         if (strtocurr(EdtCusto.Text) > 0) and (strtocurr(EdtMLVarejoNormal.text) > 0) then
             edtvalor.Text:= currtostr((((strtocurr(EdtCusto.Text) * strtocurr(EdtMLVarejoNormal.Text)) / 100) + strtocurr(EdtCusto.Text)));
         EdtValorExit(EdtValor);
      end
   else
      begin 
         EdtMLVarejoNormal.Clear;
         EdtLucroVarejoNormal.Clear;
      end;
end;

procedure TFrmAltPreco.EdtMLVarejoProExit(Sender: TObject);
begin 
   if strtocurr(EdtPromocao.Text) > 0 then
      begin 
         if (strtocurr(EdtCusto.Text) > 0) and (strtocurr(EdtMLVarejoPro.text) > 0) then
            EdtPromocao.Text:= currtostr((((strtocurr(EdtCusto.Text) * strtocurr(EdtMLVarejoPro.Text)) / 100) + strtocurr(EdtCusto.Text)));
         EdtValorExit(EdtPromocao);
      end
   else
      begin 
         EdtMLVarejoPro.Clear;
         EdtLucroPromo.Clear;
      end;
end;

procedure TFrmAltPreco.FormShow(Sender: TObject);
begin 
   EdtValorExit(edtvalor);
   EdtValorExit(EdtProgramado);
   EdtValorExit(EdtPromocao);
end;

procedure TFrmAltPreco.EdtMLProgramadoExit(Sender: TObject);
begin 
   if strtocurr(EdtProgramado.Text) > 0 then
      begin 
         if (strtocurr(EdtCusto.Text) > 0) and (strtocurr(EdtMLProgramado.text) > 0) then
             EdtProgramado.Text:= currtostr((((strtocurr(EdtCusto.Text) * strtocurr(EdtMLProgramado.Text)) / 100) + strtocurr(EdtCusto.Text)));
         EdtValorExit(EdtProgramado);
      end
   else
      begin 
         EdtMLProgramado.Clear;
         EdtLucroProg.Clear;
      end;
end;

procedure TFrmAltPreco.EdtMLVarejoNormalRealExit(Sender: TObject);
begin 
   if strtocurr(EdtValor.Text) > 0 then
      begin 
         if (strtocurr(EdtCusto.Text) > 0) and (strtocurr(EdtMLVarejoNormalReal.text) > 0) then
             edtvalor.Text:= currtostr(strtocurr(EdtCusto.Text) / (1 - (strtocurr(EdtMLVarejoNormalReal.Text) / 100)));
         EdtValorExit(EdtValor);
      end
   else
      begin 
         EdtMLVarejoNormalReal.Clear;
         EdtLucroVarejoNormal.Clear;
      end;
end;

procedure TFrmAltPreco.EdtMLVarejoProgRealExit(Sender: TObject);
begin 
   if strtocurr(EdtProgramado.Text) > 0 then
      begin 
         if (strtocurr(EdtCusto.Text) > 0) and (strtocurr(EdtMLVarejoProgReal.text) > 0) then
             EdtProgramado.Text:= currtostr(strtocurr(EdtCusto.Text) / (1 - (strtocurr(EdtMLVarejoProgReal.Text) / 100)));
         EdtValorExit(EdtProgramado);
      end
   else
      begin 
         EdtMLVarejoProgReal.Clear;
         EdtLucroProg.Clear;
      end;
end;

procedure TFrmAltPreco.EdtMLVarejoPromoRealExit(Sender: TObject);
begin 
   if strtocurr(EdtPromocao.Text) > 0 then
      begin 
         if (strtocurr(EdtCusto.Text) > 0) and (strtocurr(EdtMLVarejoPromoReal.text) > 0) then
             EdtPromocao.Text:= currtostr(strtocurr(EdtCusto.Text) / (1 - (strtocurr(EdtMLVarejoPromoReal.Text) / 100)));
         EdtValorExit(EdtPromocao);
      end
   else
      begin 
         EdtMLVarejoPromoReal.Clear;
         EdtLucroPromo.Clear;
      end;
end;

end.
