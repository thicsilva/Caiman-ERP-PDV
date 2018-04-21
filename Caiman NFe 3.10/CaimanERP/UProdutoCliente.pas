unit UProdutoCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, DB, Grids, DBGrids, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmProdutoCliente = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    EdtCodCli: UNovosComponentes.TEdit;
    BtnConsCli: TsSpeedButton;
    EdtNomeCli: TEdit;
    GroupBox2: TGroupBox;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    Label1: TLabel;
    BtnOk: TButton;
    BtnSair: TButton;
    DBGrid1: TDBGrid;
    QConsProdCliente: TFDQuery;
    IBTRProd: TFDTransaction;
    QConsProdClienteCOD_PRO: TIntegerField;
    QConsProdClienteNOME_PRO: TStringField;
    DSQConsProdCliente: TDataSource;
    BtnVendas: TButton;
    CheckEmp: TCheckBox;
    QConsProdClienteQUANT: TBCDField;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnConsCliClick(Sender: TObject);
    procedure EdtCodCliExit(Sender: TObject);
    procedure EdtCodCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodCliKeyPress(Sender: TObject; var Key: Char);
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnVendasClick(Sender: TObject);
    procedure EdtCodCliEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProdutoCliente: TFrmProdutoCliente;

implementation
uses
  Udm, UBibli1, UConsCli, UVendasProduto, UNovoPrincipal;

{$R *.dfm}

procedure TFrmProdutoCliente.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmProdutoCliente.BtnConsCliClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsCli, FrmConsCli);
   FrmConsCli.tag:= 12;
   FrmConsCli.showmodal;
end;

procedure TFrmProdutoCliente.EdtCodCliExit(Sender: TObject);
begin 
   if btnsair.Focused then
      exit;
   EdtNomeCli.Text:= consulta('cliente', edtcodcli, 'cod_cli', 'nome_cli', dm.IBTransaction, dm.qConsulta);
   if edtnomecli.Text = '' then
      begin 
         AlertaCad('Cliente não Cadastrado');
//         edtcodcli.SetFocus;
      end;
end;

procedure TFrmProdutoCliente.EdtCodCliKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      btnconscli.Click;
end;

procedure TFrmProdutoCliente.EdtCodCliKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmProdutoCliente.BtnOkClick(Sender: TObject);
begin 
   if trim(edtcodcli.Text) = '' then
      begin 
         edtcodcli.SetFocus;
         exit;
      end;
   if edtdatafin.Date < edtdataini.Date then
      begin 
         AlertaCad('A data final não pode ser menor que a data inicial');
//         edtdatafin.SetFocus;
         exit;
      end;
   if IBTRProd.Active then
      IBTRProd.Commit;
   IBTRProd.StartTransaction;
   with QConsProdCliente do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT SUM(I.QUANT) QUANT, I.COD_PRO, P.NOME_PRO ' +
                 'FROM ITENS_VENDA I ' +
                 'INNER JOIN PRODUTO P ' +
                 'ON (I.COD_PRO = P.COD_PRO) ' +
                 'INNER JOIN VENDAS V ' +
                 'ON (I.COD_VEN = V.COD_VEN) ' +
                 'WHERE V.COD_CLI = :CODCLI AND V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                 'AND I.CANCELADO = 0 ');

         if (not CheckEmp.Checked) then
            begin 
               sql.Add(' AND I.COD_EMP = :CODEMP');
               Parambyname('codemp').AsInteger:= iEmp;
            end;
         sql.Add(' GROUP BY I.COD_PRO, P.NOME_PRO ORDER BY P.NOME_PRO');
         Parambyname('codcli').AsInteger := strtoint(edtcodcli.Text);
         Parambyname('dataini').AsDate   := edtdataini.Date;
         Parambyname('datafin').AsDate   := edtdatafin.Date;
         open;
      end;
   IBTRProd.CommitRetaining;
end;

procedure TFrmProdutoCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if IBTRProd.Active then
      IBTRProd.Commit;
   QConsProdCliente.Close;
   Action:= caFree;
end;

procedure TFrmProdutoCliente.FormShow(Sender: TObject);
begin 
   edtcodcli.Clear;
   edtnomecli.Clear;
   edtdataini.Date:= date;
   edtdatafin.Date:= date;
   CheckEmp.Checked:= false;
   edtcodcli.SetFocus;
end;

procedure TFrmProdutoCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      btnsair.Click;
end;

procedure TFrmProdutoCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmProdutoCliente.BtnVendasClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmVendasProduto, FrmVendasProduto);
   with FrmVendasProduto do
      begin 
         if IBTRProdVenda.Active then
            IBTRProdVenda.Commit;
         IBTRProdVenda.StartTransaction;
         QConsProdVenda.Close;
         QConsProdVenda.ParamByName('codpro').Value  := QConsProdClienteCOD_PRO.Value;
         QConsProdVenda.ParamByName('codcli').Value  := edtcodcli.Text;
         QConsProdVenda.ParamByName('dataini').Value := edtdataini.Date;
         QConsProdVenda.ParamByName('datafin').Value := edtdatafin.Date;
         QConsProdVenda.Open;
         IBTRProdVenda.CommitRetaining;       
         ShowModal;
      end;
end;

procedure TFrmProdutoCliente.EdtCodCliEnter(Sender: TObject);
begin 
   EdtCodCli.SelectAll;
end;

end.
