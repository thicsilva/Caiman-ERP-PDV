unit UGeraBalanca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Mask, Buttons, DB, jpeg, rxToolEdit, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmGeraBalanca = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    DirBalanca: TDirectoryEdit;
    Label1: TLabel;
    QConsPro: TFDQuery;
    Label2: TLabel;
    ComboBalanca: TComboBox;
    Panel2: TPanel;
    BtnOK: TBitBtn;
    BtnSair: TBitBtn;
    StatusBar1: TStatusBar;
    ImageToledo: TImage;
    ImageFilizola: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ComboBalancaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGeraBalanca: TFrmGeraBalanca;

implementation
uses
  Udm, Ubibli1, UNovoPrincipal;

{$R *.dfm}

procedure TFrmGeraBalanca.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmGeraBalanca.BtnOKClick(Sender: TObject);
var vl_Prod    : textfile;
    vl_Setor   : textfile;
    vl_receita : textfile;

    iTipoCarga : integer;
begin 
   iTipoCarga:= dm.RetornaIntegerTabela('tipo_carga_balanca', 'empresa', 'cod_emp', iEmp);
   // 0- por produto   1- por codigo de barra

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;

   with QConsPro do
      begin 
         close;
         open;
         if recordcount > 0 then
            begin 
               case ComboBalanca.ItemIndex of
                0: begin 
                      assignfile(vl_Prod, DirBalanca.Text + '\cadtxt.txt');
                      rewrite(vl_Prod);

                      assignfile(vl_Setor, DirBalanca.Text + '\setortxt.txt');
                      rewrite(vl_Setor);

                      assignfile(vl_receita, DirBalanca.Text + '\rec_ass.txt');
                      rewrite(vl_receita);
                   end;
                1: begin 
                      assignfile(vl_Prod, DirBalanca.Text + '\txitens.txt');
                      rewrite(vl_Prod);
                   end;
               end;
               First;
               while not eof do
                  begin 
                     case ComboBalanca.ItemIndex of
                       0: begin 
                             { CADTXT.TXT }
                             if iTipoCarga = 0 then
                                write(vl_prod, FormataStringD(fieldbyname('cod_pro').asstring, '6', '0'))
                             else
                                begin 
                                   if Length(trim(fieldbyname('codigo_barra_pro').AsString)) > 6 then
                                      AlertaCad('Verifique o Código de Barras do produto ' + fieldbyname('cod_pro').AsString);
                                   write(vl_prod, FormataStringD(fieldbyname('codigo_barra_pro').asstring, '6', '0'));
                                end;

                             write(vl_prod, fieldbyname('produto_pesado_pro').AsString);
                             write(vl_prod, formatastringE(copy(fieldbyname('desc_cupom').AsString, 1, 22), '22', ' '));

                             if fieldbyname('promocao_pro').AsCurrency > 0 then
                                write(vl_prod, formatastringd(RetiraCaracter(CurrToStrF(fieldbyname('promocao_pro').AsCurrency, ffnumber, 2)), '7', '0'))
                             else
                                write(vl_prod, formatastringd(RetiraCaracter(CurrToStrF(fieldbyname('valor_pro').AsCurrency, ffnumber, 2)), '7', '0'));

                             if fieldbyname('dias_validade_pro').IsNull then
                                writeln(vl_prod, '000')
                             else
                                writeln(vl_prod, formatastringd(fieldbyname('dias_validade_pro').asstring, '3', '0'));

                             { SETOR.TXT }
                             write(vl_setor, formatastringE(copy(fieldbyname('nome_set').AsString, 1, 12), '12', ' '));

                             if iTipoCarga = 0 then
                                write(vl_setor, FormataStringD(fieldbyname('cod_pro').asstring, '6', '0'))
                             else
                                write(vl_setor, FormataStringD(fieldbyname('codigo_barra_pro').asstring, '6', '0'));

                             write(vl_setor, '0000');
                             writeln(vl_setor, FormataStringD(fieldbyname('tecla_atalho_pro').asstring, '3', '0'));

                             { REC_ASS.TXT }
                             if FieldByName('ingredientes').AsString <> '' then
                                begin 
                                   write(vl_receita, formatastringE(copy(fieldbyname('nome_set').AsString, 1, 12), '12', ' '));

                                   if iTipoCarga = 0 then
                                      write(vl_receita, FormataStringD(fieldbyname('cod_pro').asstring, '6', '0'))
                                   else
                                      write(vl_receita, FormataStringD(fieldbyname('codigo_barra_pro').asstring, '6', '0'));

                                   write(vl_receita, FormataStringD(fieldbyname('indice_receita_pro').asstring, '6', '0'));
                                   writeln(vl_receita, FieldByName('ingredientes').AsString + '@');
                                end;
                          end;
                       1: begin 
                             { TXITENS.TEXT }
                             write(vl_prod, FormataStringD(fieldbyname('cod_setor').asstring, '2', '0'));
                             write(vl_prod, '01');
                             if trim(FieldByName('produto_pesado_pro').AsString) = 'P' then
                                write(vl_prod, '0')
                             else
                                if trim(FieldByName('produto_pesado_pro').AsString) = 'U' then
                                write(vl_prod, '1');

                             if iTipoCarga = 0 then
                                write(vl_prod, FormataStringD(fieldbyname('cod_pro').asstring, '6', '0'))
                             else
                                write(vl_prod, FormataStringD(fieldbyname('codigo_barra_pro').asstring, '6', '0'));

                             if not (fieldbyname('promocao_pro').IsNull) and
                                    (fieldbyname('promocao_pro').value > 0) then
                                write(vl_prod, formatastringd(RetiraCaracter(floattostrf(fieldbyname('promocao_pro').value, ffnumber, 15,2)), '6', '0'))
                             else
                                if not (fieldbyname('valor_pro').IsNull) and
                                       (fieldbyname('valor_pro').value > 0) then
                                   write(vl_prod, formatastringd(RetiraCaracter(floattostrf(fieldbyname('valor_pro').value, ffnumber, 15,2)), '6', '0'));
                             if fieldbyname('dias_validade_pro').IsNull then
                                write(vl_prod, '000')
                             else
                                write(vl_prod, formatastringd(fieldbyname('dias_validade_pro').asstring, '3', '0'));
                             write(vl_prod, formatastringE(copy(fieldbyname('desc_cupom').value, 1, 25), '25', ' '));
                             write(vl_prod, formatastringE('', '25', ' '));
                             write(vl_prod, formatastringE('', '50', ' '));
                             write(vl_prod, formatastringE('', '50', ' '));
                             write(vl_prod, formatastringE('', '50', ' '));
                             write(vl_prod, formatastringE('', '50', ' '));
                             writeln(vl_prod, formatastringE('', '50', ' '));
                          end;
                     end;
                     next;
                  end;
               CloseFile(vl_prod);
               if ComboBalanca.ItemIndex = 0 then
                  begin 
                     CloseFile(vl_setor);
                     CloseFile(vl_receita);
                  end;
            end;
      end;
   dm.IBTransaction.Commit;
   QConsPro.Close;
   AlertaCad('processo concluido');
end;

procedure TFrmGeraBalanca.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmGeraBalanca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   dm.GravaIni('cnfcomercio.ini', 'configuracaolocal', 'caminhobalanca', DirBalanca.Text);
   Action:= caFree;
end;

procedure TFrmGeraBalanca.FormShow(Sender: TObject);
begin 
   ComboBalanca.ItemIndex:= 0;
   DirBalanca.Text:= dm.LeIni('cnfcomercio.ini', 'configuracaolocal', 'caminhobalanca');
end;

procedure TFrmGeraBalanca.ComboBalancaChange(Sender: TObject);
begin 
   if ComboBalanca.ItemIndex = 0 then
      ImageToledo.SendToBack
   else
      ImageFilizola.SendToBack;
end;

end.
