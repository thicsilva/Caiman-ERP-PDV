unit UCadTabPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls, DB, Grids, DBGrids, Buttons, sSpeedButton, 
  ComCtrls, sComboBoxes, Mask, RxToolEdit, RxCurrEdit, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmCadTabPreco = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Label1: TLabel;
    N_Cliente: TLabel;
    Label2: TLabel;
    C_Cliente: TLabel;
    TRTab: TFDTransaction;
    Busca_tab: TFDQuery;
    SBusca_Tab: TDataSource;
    Busca_tabCOD: TIntegerField;
    Busca_tabCOD_CLIENTE: TIntegerField;
    Busca_tabCLIENTE: TStringField;
    Busca_tabCOD_BARRA: TStringField;
    Busca_tabCOD_PRODUTO: TIntegerField;
    Busca_tabPRODUTO: TStringField;
    Busca_tabVALOR_VENDA: TBCDField;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    sSpeedButton1: TsSpeedButton;
    Excluir: TButton;
    EdtNomeProduto: TEdit;
    EdtCodPro: UNovosComponentes.TEdit;
    BtnConsPro: TsSpeedButton;
    Label3: TLabel;
    Add: TButton;
    Label5: TLabel;
    Label6: TLabel;
    EdtValor: TCurrencyEdit;
    Label4: TLabel;
    Label7: TLabel;
    EdtvalorVenda: TCurrencyEdit;
    QProd: TFDQuery;
    QProdCOD_PRO: TIntegerField;
    QProdCOD_LAB: TIntegerField;
    QProdCOD_SEC: TIntegerField;
    QProdVALOR_PRO: TBCDField;
    QProdPROMOCAO_PRO: TBCDField;
    QProdCONTROLA_ESTOQUE_PRO: TStringField;
    QProdCOMISSAO_PRO: TBCDField;
    QProdQUANT_UNIDADE_ENTRADA: TBCDField;
    QProdESTOQUE_MINIMO_PRO: TBCDField;
    QProdNOME_PRO: TStringField;
    QProdDESC_CUPOM: TStringField;
    QProdATIVO_PRO: TStringField;
    QProdMARGEM_LUCRO_PRO: TBCDField;
    QProdLOCALIZACAO_PRO: TStringField;
    QProdPRODUTO_PESADO_PRO: TStringField;
    QProdCOD_SETOR: TIntegerField;
    QProdTECLA_ATALHO_PRO: TIntegerField;
    QProdINDICE_RECEITA_PRO: TIntegerField;
    QProdDIAS_VALIDADE_PRO: TIntegerField;
    QProdREFERENCIA_PRO: TStringField;
    QProdCOMPLEMENTO_PRO: TStringField;
    QProdICMS_CONT_EST: TIntegerField;
    QProdICMS_CONT_FORA: TIntegerField;
    QProdICMS_CF_EST: TIntegerField;
    QProdICMS_CF_FORA: TIntegerField;
    QProdCST_CONT_EST: TStringField;
    QProdCST_CONT_FORA: TStringField;
    QProdCST_CF_EST: TStringField;
    QProdCST_CF_FORA: TStringField;
    QProdCAMINHO_FOTO_PRO: TStringField;
    QProdSAIR_TABELA_PRECO: TStringField;
    QProdCFOP_VENDAS_CONT_EST: TIntegerField;
    QProdCFOP_VENDAS_CF_EST: TIntegerField;
    QProdCFOP_VENDAS_CONT_FORA: TIntegerField;
    QProdCFOP_VENDAS_CF_FORA: TIntegerField;
    QProdST_CONT_EST: TStringField;
    QProdVR_AGREG_CONT_EST: TBCDField;
    QProdIPI_CONT_EST: TBCDField;
    QProdIPI_CF_EST: TBCDField;
    QProdIPI_CONT_FORA: TBCDField;
    QProdIPI_CF_FORA: TBCDField;
    QProdCOD_NCM: TStringField;
    QProdCLASSIFICACAO_FISCAL: TStringField;
    QProdCODIGO_TIPO: TIntegerField;
    QProdCOD_PRODUTO_ESTOQUE: TIntegerField;
    QProdCOD_GRUPO: TIntegerField;
    QProdSUB_GRUPO: TIntegerField;
    QProdPRECO_PROGRAMADO: TBCDField;
    QProdALIQUOTA_PIS: TBCDField;
    QProdALIQUOTA_COFINS: TBCDField;
    QProdALIQUOTA_IR: TBCDField;
    QProdALIQUOTA_CSLL: TBCDField;
    QProdALIQUOTA_OUTRAS: TBCDField;
    QProdISENTO_PIS_COFINS_PRO: TStringField;
    QProdPRECO_CUSTO: TBCDField;
    QProdCREDITO_ICMS: TBCDField;
    QProdPRECO_PRAZO_PRO: TBCDField;
    QProdTIPO_PRODUCAO: TStringField;
    QProdCODIGO_BARRA_PRO: TStringField;
    QProdCODIGO_UNIDADE_SAIDA: TIntegerField;
    QProdCODIGO_UNIDADE_ENTRADA: TIntegerField;
    QProdPRECO_PROGRAMADO_PRAZO: TBCDField;
    QProdRED_CF_EST: TBCDField;
    QProdRED_CF_FORA: TBCDField;
    QProdRED_CONT_EST: TBCDField;
    QProdRED_CONT_FORA: TBCDField;
    QProdDATA_VALIDADE: TDateField;
    QProdCODIGO_SETOR_ESTOQUE: TIntegerField;
    QProdORIG: TIntegerField;
    QProdCSOSN: TStringField;
    QProdIPI: TFloatField;
    QProdICMS: TFloatField;
    QProdRICMS: TFloatField;
    QProdIVA: TFloatField;
    QProdPIS: TFloatField;
    QProdCONFINS: TFloatField;
    QProdTAMANHO: TStringField;
    QProdCOR: TStringField;
    QProdOBS: TWideMemoField;
    QProdCST_PIS: TStringField;
    QProdCST_COFINS: TStringField;
    QProdCST_IPI: TStringField;
    QProdULTIMA_ALTERACAO: TDateField;
    OP: TComboBox;
    cmd: TFDQuery;
    Aux: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure Busca_tabela;
    procedure sSpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnConsProClick(Sender: TObject);
    procedure BuscaProduto( COD: string );
    procedure EdtCodProExit(Sender: TObject);
    procedure EdtCodProKeyPress(Sender: TObject; var Key: Char);
    procedure ExcluirClick(Sender: TObject);
    procedure EdtvalorVendaKeyPress(Sender: TObject; var Key: Char);
    procedure AddClick(Sender: TObject);
    procedure Limpar;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }

  public
    { Public declarations }
    COD_CLIENTE: Integer;
    Cliente: string;
    COD_PRO: Integer;
    COD_BARRA_PRO: STring;
  end;

var
  FrmCadTabPreco: TFrmCadTabPreco;

implementation

uses
  UDM, UConsCli, UConsProd, UNovoPrincipal;

{$R *.dfm}

procedure TFrmCadTabPreco.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
   TRTab.Commit;
   Action := caFree;
end;

procedure TFrmCadTabPreco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if Key = vk_escape then
      begin 
         Close;
      end;

end;

procedure TFrmCadTabPreco.FormShow(Sender: TObject);
begin 
   C_Cliente.Caption := IntToStr( COD_CLIENTE );
   N_Cliente.Caption := Cliente;

   Busca_tabela;

 end;

procedure TFrmCadTabPreco.sSpeedButton1Click(Sender: TObject);
begin 
   Application.CreateForm( TFrmConsCli, FrmConsCli);
   FrmConsCli.Tag := 46;
   Close;
   FrmConsCli.Show;
end;

procedure TFrmCadTabPreco.AddClick(Sender: TObject);
var
   COD_REG: Integer;
begin 
   if (EdtCodPro.Text = '') or ( COD_PRO = 0 ) then
      exit;
   Aux.Close;
   Aux.SQL.Clear;
   Aux.SQL.Text := 'Select * from CLIENTE_PRECO where COD_CLIENTE=:COD_CLI and COD_PRODUTO=:COD_PRO';
   Aux.ParamByName( 'COD_CLI' ).AsInteger := COD_CLIENTE;
   Aux.ParamByName( 'COD_PRO' ).AsInteger := COD_PRO;
   Aux.Open;
   if not Aux.IsEmpty then
      begin 
         COD_REG := Aux.FieldByName( 'COD' ).AsInteger;
         Aux.Close;
         Aux.SQL.Clear;
         Aux.SQL.Text := 'Update CLIENTE_PRECO set VALOR_VENDA=:VALOR where COD=:COD';
         Aux.ParamByName( 'VALOR' ).AsCurrency := EdtvalorVenda.Value;
         Aux.ParamByName( 'COD' ).AsInteger := COD_REG;
         Aux.ExecOrOpen;
      end
   else
      begin 
         Aux.Close;
         Aux.Close;
         Aux.SQL.Clear;
         Aux.SQL.Text := 'insert into CLIENTE_PRECO ( COD_CLIENTE, CLIENTE,'+
         ' COD_BARRA, COD_PRODUTO, PRODUTO, VALOR_VENDA)'+
         ' values (:COD_CLI, :CLI,:COD_BARRA,:COD_PRO, :PRO, :VALOR_VENDA );';
         Aux.ParamByName( 'COD_CLI' ).AsInteger := COD_CLIENTE;
         Aux.ParamByName( 'CLI' ).AsString := Cliente;
         Aux.ParamByName( 'COD_BARRA' ).AsString := COD_BARRA_PRO;
         Aux.ParamByName( 'COD_PRO' ).AsInteger := COD_PRO;
         Aux.ParamByName( 'PRO' ).AsString := EdtNomeProduto.Text;
         Aux.ParamByName( 'VALOR_VENDA' ).AsCurrency := EdtvalorVenda.Value;
         Aux.ExecOrOpen;
      end;
   Limpar;
   Busca_tabela;

end;

procedure TFrmCadTabPreco.BtnConsProClick(Sender: TObject);
begin 
  Application.CreateForm(TFrmConsProd, FrmConsProd);
  FrmConsProd.tag := 100;
  FrmConsProd.ShowModal;
end;

procedure TFrmCadTabPreco.Busca_tabela;
begin 
   if TRTab.Active then
      TRTab.Commit;
   TRTab.StartTransaction;
   Busca_tab.Close;
   Busca_tab.SQL.Clear;
   Busca_tab.SQL.Text := 'Select * from CLIENTE_PRECO where COD_CLIENTE=:COD_CLI';
   Busca_tab.ParamByName( 'COD_CLI' ).AsInteger := COD_CLIENTE;
   Busca_tab.Open;

end;

procedure TFrmCadTabPreco.EdtCodProExit(Sender: TObject);
begin 
   BuscaProduto( EdtCodPro.Text );
end;

procedure TFrmCadTabPreco.EdtCodProKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
          Key := #0;
          BuscaProduto( EdtCodPro.Text );
      end;
end;

procedure TFrmCadTabPreco.EdtvalorVendaKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
          Key := #0;
          AddClick( Add );
      end;
end;

procedure TFrmCadTabPreco.ExcluirClick(Sender: TObject);
begin 
   if busca_tabCOD.IsNull then
      Exit;
   if application.MessageBox(PChar( 'Confirma a Exclusão do produto: ' + #13 + Busca_TabProduto.AsString), 'Confirmar exclusão', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         cmd.Close;
         cmd.SQL.Clear;
         cmd.SQL.Text := 'Delete from CLIENTE_PRECO where COD=:COD';
         cmd.ParamByName( 'COD' ).AsInteger := busca_tabCOD.AsInteger;
         cmd.ExecOrOpen;
         Busca_tabela;
      end;
end;

procedure TFrmCadTabPreco.BuscaProduto( COD: string );
begin 
   if COD = '' then
      Exit;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
   QProd.Close;
   QProd.SQL.Clear;
   QProd.SQL.Text := 'Select * from PRODUTO';
   case OP.ItemIndex of
      0: QProd.SQL.Add( ' where COD_PRO=:COD');
      1: QProd.SQL.Add( ' where CODIGO_BARRA_PRO=:COD');
   end;
   QProd.ParamByName( 'COD' ).AsString := COD;
   Qprod.Open;
   if QProd.IsEmpty then
      begin 
            AlertaCad( 'Produto não localizado' );
            Dm.IBTransaction.Commit;
            exit;
      end;
   EdtNomeProduto.Text := QProdNOME_PRO.AsString;
   EdtValor.Value := QProdVALOR_PRO.AsCurrency;
   EdtvalorVenda.Value := QProdVALOR_PRO.AsCurrency;
   COD_PRO := QProdCOD_PRO.AsInteger;
   Qprod.Close;
   except
      on E: Exception do
         begin 
            AlertaCad( 'Erro ao buscar Produto ' + #13 + E.Message );
            Dm.IBTransaction.Rollback;
         end;
   end;
   dm.IBTransaction.Commit;
end;

procedure TFrmCadTabPreco.Limpar;
begin 
  //
  EdtCodPro.Clear;
  EdtNomeProduto.Clear;
  EdtValor.Clear;
  EdtvalorVenda.Clear;
  COD_PRO := 0;
  COD_BARRA_PRO := '';
end;
end.
