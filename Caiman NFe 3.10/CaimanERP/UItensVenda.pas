unit UItensVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, DB, Grids, DBGrids, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmItensVenda = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    DBGrid1: TDBGrid;
    QItens: TFDQuery;
    DSQItens: TDataSource;
    QItensCOD_VEN: TIntegerField;
    QItensCOD_PRO: TIntegerField;
    QItensORDEM: TIntegerField;
    QItensDESCONTO: TBCDField;
    QItensCOD_EMP: TIntegerField;
    QItensQUANT: TBCDField;
    QItensVALOR: TBCDField;
    QItensNOME_PRO: TStringField;
    QItensDESCRICAO: TStringField;
    QItensTOTAL: TCurrencyField;
    IBTRItens: TFDTransaction;
    QItensVALOR_CUSTO: TBCDField;
    QItensPRODUTO_PROMOCAO: TStringField;
    QItensCANCELADO: TIntegerField;
    QItensVENDA_CANCELADA: TIntegerField;
    QItensCOD_VEND: TIntegerField;
    QItensCODIGO_BARRA_PRO: TStringField;
    procedure QItensCalcFields(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmItensVenda: TFrmItensVenda;

implementation
uses
  Udm, UConsVendas, UConsVendaCaixa, UConsVendasCF, UNovoPrincipal;

{$R *.dfm}

procedure TFrmItensVenda.QItensCalcFields(DataSet: TDataSet);
begin 
   QItensTOTAL.AsCurrency:= (QItensQUANT.AsCurrency * QItensVALOR.AsCurrency) - QItensDESCONTO.AsCurrency;
end;

procedure TFrmItensVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmItensVenda.FormShow(Sender: TObject);
begin 
   if IBTRItens.Active then
      IBTRItens.Commit;
   IBTRItens.StartTransaction;

   with QItens do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT I.*, P.NOME_PRO, P.CODIGO_BARRA_PRO ' +
                 'FROM ITENS_VENDA I     ' +
                 'INNER JOIN PRODUTO P   ' +
                 'ON (I.COD_PRO = P.COD_PRO) ' +
                 'WHERE I.COD_VEN = :CODVEN  ' +
                 'ORDER BY ORDEM');

         case FrmItensVenda.Tag of
            0: Parambyname('codven').AsInteger:= FrmConsVendas.QConsVendasCOD_VEN.AsInteger;
            1: Parambyname('codven').AsInteger:= FrmConsVendaCaixa.QVendasCOD_VEN.AsInteger;
            2: Parambyname('codven').AsInteger:= FrmConsVendaCaixa.QRecCOD_VENDA.AsInteger;
            3: Parambyname('codven').AsInteger:= FrmConsVendaCaixa.QVendasDescCOD_VEN.AsInteger;
            4: Parambyname('codven').AsInteger:= FrmConsVendaCaixa.QVendasExcCOD_VEN.AsInteger;
            5: Parambyname('codven').AsInteger:= FrmConsVendasCF.QConsVendasCOD_VEN.AsInteger;
         end;
         open;
      end;
end;

procedure TFrmItensVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if IBTRItens.Active then
      IBTRItens.Commit;
   QItens.Close;
   Action:= caFree;
end;

procedure TFrmItensVenda.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin 
   if QItensCANCELADO.AsInteger = 1 then
      begin 
         DBGrid1.Canvas.Font.Color:= clRed;
         Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
      end;
end;

end.
