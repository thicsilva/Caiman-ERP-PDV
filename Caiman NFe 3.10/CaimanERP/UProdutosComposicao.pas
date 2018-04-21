unit UProdutosComposicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Grids, DBGrids, Mask, Buttons, DB, 
  rxToolEdit, rxCurrEdit, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmProdutosComposicao = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    EdtCodPro: TEdit;
    BtnConsProd: TsSpeedButton;
    EdtNomePro: TEdit;
    Label2: TLabel;
    EdtQuant: TCurrencyEdit;
    Label12: TLabel;
    DBGrid1: TDBGrid;
    BtnGrava: TButton;
    BtnExclui: TButton;
    QProd: TFDQuery;
    QProdCOD_PRO: TIntegerField;
    QProdCOD_PRO_COMPOSICAO: TIntegerField;
    QProdQUANT: TBCDField;
    QProdNOME_PRO: TStringField;
    DSProd: TDataSource;
    IBTRProd: TFDTransaction;
    BtnAddPro: TsSpeedButton;
    LabelUnd: TLabel;
    Button1: TButton;
    QProdDESCRICAO: TStringField;
    procedure EdtCodProEnter(Sender: TObject);
    procedure EdtCodProKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodProKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodProExit(Sender: TObject);
    procedure BtnConsProdClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure BuscaProduto;
    procedure BtnExcluiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnAddProClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProdutosComposicao: TFrmProdutosComposicao;

implementation

uses
  UDM, Ubibli1, UConsProd, UAlteraPreco, UCadProduto, UQRelProdComposicao, 
  UNovoPrincipal;

{$R *.dfm}

procedure TFrmProdutosComposicao.BuscaProduto;
begin
   if IBTRProd.Active then
      IBTRProd.Commit;
   IBTRProd.StartTransaction;
   with QProd do
      begin
         close;
         Parambyname('codpro').AsInteger:= FrmAlteraPreco.QConsProdCODPRO.AsInteger;
         open;
         last;
      end;
end;


procedure TFrmProdutosComposicao.EdtCodProEnter(Sender: TObject);
begin
   EdtCodPro.SelectAll;
end;

procedure TFrmProdutosComposicao.EdtCodProKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f3 then
      BtnConsProd.Click
   else
      if key = vk_f2 then
         BtnAddPro.Click;
end;

procedure TFrmProdutosComposicao.EdtCodProKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmProdutosComposicao.EdtCodProExit(Sender: TObject);
begin
   if trim(EdtCodPro.Text) = '' then
      exit;

   if DBGrid1.Focused then
      exit;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.clear;
             sql.Add('SELECT P.COD_PRO, P.NOME_PRO, U.DESCRICAO ' +
                     'FROM PRODUTO P ' +
                     'INNER JOIN UNIDADE_MEDIDA U ' +
                     'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO) ' +
                     'WHERE P.COD_PRO = :CODPRO');
             Parambyname('codpro').AsInteger:= strtoint(EdtCodPro.Text);
             Open;
             if not fieldbyname('cod_pro').IsNull then
                begin
                   EdtNomePro.Text := fieldbyname('nome_pro').AsString;
                   LabelUnd.Caption:= fieldbyname('descricao').AsString;
                   EdtQuant.SetFocus;
                end
             else
                begin
                   EdtNomePro.Clear;
                   LabelUnd.Caption:= '';
                   AlertaCad('Produto não Cadastrado');
//                   EdtCodPro.SetFocus;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar o produto');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmProdutosComposicao.BtnConsProdClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsProd, FrmConsProd);
   FrmConsProd.Tag:= 27;
   FrmConsProd.ShowModal;
end;

procedure TFrmProdutosComposicao.BtnGravaClick(Sender: TObject);
begin
   if EdtCodPro.Text = '' then
      begin
         AlertaCad('Digite o código do Produto');
//         EdtCodPro.SetFocus;
         exit;
      end;

   if not (strtocurr(EdtQuant.Text) > 0) then
      begin
         AlertaCad('Verifique a quantidade');
//         EdtQuant.SetFocus;
         exit;
      end;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.Consulta do
          begin
             close;
             sql.Clear;
             sql.add('INSERT INTO PRODUTOS_COMPOSICAO (COD_PRO, COD_PRO_COMPOSICAO, QUANT) ' +
                     'VALUES (:1, :2, :3)');
             Parambyname('1').AsInteger := FrmAlteraPreco.QConsProdCODPRO.AsInteger;
             Parambyname('2').AsInteger := strtoint(EdtCodPro.Text);
             Parambyname('3').AsCurrency:= strtocurr(EdtQuant.Text);
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao gravar o Produto ' + #13 +
                   'Verifique se está gravado');
       EdtCodPro.Clear;
       EdtNomePro.clear;
       EdtQuant.Clear;
       LabelUnd.Caption:= '';
//       EdtCodPro.SetFocus;
     end;
   finally
     dm.Consulta.close;
     BuscaProduto;
     EdtCodPro.Clear;
     EdtNomePro.clear;
     EdtQuant.Clear;
     LabelUnd.Caption:= '';
     EdtCodPro.SetFocus;
   end;
end;

procedure TFrmProdutosComposicao.BtnExcluiClick(Sender: TObject);
begin
   if not QProdCOD_PRO_COMPOSICAO.IsNull then
      begin
         if Application.MessageBox('Confirma a Exclusão do Produto?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
           begin
              if dm.IBTransaction.Active then
                 dm.IBTransaction.Commit;
              dm.IBTransaction.StartTransaction;
              try
                try
                  with dm.Consulta do
                      begin
                         close;
                         sql.Clear;
                         sql.add('DELETE FROM PRODUTOS_COMPOSICAO ' +
                                 'WHERE COD_PRO = :1 AND COD_PRO_COMPOSICAO = :2');
                         Parambyname('1').AsInteger := FrmAlteraPreco.QConsProdCODPRO.AsInteger;
                         Parambyname('2').AsInteger := QProdCOD_PRO_COMPOSICAO.AsInteger;
                         ExecOrOpen;
                      end;
                  dm.IBTransaction.Commit;
                except
                  dm.IBTransaction.Rollback;
                  AlertaCad('Erro ao excluir o Produto');
                end;
              finally
                dm.Consulta.close;
                BuscaProduto;
                EdtCodPro.Clear;
                EdtNomePro.clear;
                EdtCodPro.SetFocus;
              end;
           end;
      end;
end;

procedure TFrmProdutosComposicao.FormShow(Sender: TObject);
begin
   BuscaProduto;
end;

procedure TFrmProdutosComposicao.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_escape then
      close;
end;

procedure TFrmProdutosComposicao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   if IBTRProd.Active then
      IBTRProd.Commit;
   QProd.Close;
   Action:= caFree;
end;

procedure TFrmProdutosComposicao.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
      begin
         key:= #0;
         SelectNext(ActiveControl, true, true);
      end;
end;

procedure TFrmProdutosComposicao.BtnAddProClick(Sender: TObject);
begin
   BuscaFormulario( TFrmCadProduto, True  );
end;

procedure TFrmProdutosComposicao.FormCreate(Sender: TObject);
begin
   
    LabelUnd.Caption:= '';
end;

procedure TFrmProdutosComposicao.Button1Click(Sender: TObject);
begin
   Application.CreateForm(TFrmQRelProdComposicao, FrmQRelProdComposicao);
   FrmQRelProdComposicao.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
   FrmQRelProdComposicao.QRLTitulo.Caption:= FrmAlteraPreco.QConsProdCODPRO.AsString + ' - ' + FrmAlteraPreco.QConsProdNOMEPRO.AsString;
   FrmQRelProdComposicao.QRProd.PreviewInitialState:= wsMaximized;
   FrmQRelProdComposicao.QRProd.Preview;
   FrmQRelProdComposicao.QRProd.QRPrinter:= nil;
end;

end.

