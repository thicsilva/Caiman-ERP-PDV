unit URelComissoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Grids, DBGrids, DB, Buttons, sSpeedButton, frxClass, 
  frxDBSet, frxExportPDF, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TfrmRelComissoes = class(UNovoFormulario.TForm)
    GroupBox1: TGroupBox;
    lblVendedor: TLabel;
    DBGrid1: TDBGrid;
    TRRelComissos: TFDTransaction;
    QComissoes: TFDQuery;
    QComissoesCOD: TIntegerField;
    QComissoesCOD_EMP: TIntegerField;
    QComissoesVENDEDOR: TIntegerField;
    QComissoesDATA: TDateField;
    QComissoesTOTAL_VENDAS: TBCDField;
    QComissoesTOTAL_COMISSOES: TBCDField;
    QComissoesPAGO: TStringField;
    QComissoesDATAINI: TDateField;
    QComissoesDATAFIN: TDateField;
    dsComissoes: TDataSource;
    sSpeedButton1: TsSpeedButton;
    QVendas_Comissoes: TFDQuery;
    QVendas_ComissoesCOD: TIntegerField;
    QVendas_ComissoesCOD_COMISSOES: TIntegerField;
    QVendas_ComissoesVENDA: TIntegerField;
    QVendas_ComissoesTOTAL_VENDA: TBCDField;
    QVendas_ComissoesTOTAL_COMISSAO: TBCDField;
    QVendas_ComissoesTOTAL_DESCONTOS: TBCDField;
    QVendas_ComissoesPORC_DESCONTO: TBCDField;
    QVendas_ComissoesCOMISSAO_APLICADA: TBCDField;
    sSpeedButton2: TsSpeedButton;
    frxComissoes: TfrxReport;
    frxQComissoes: TfrxDBDataset;
    frxQVendas: TfrxDBDataset;
    QVendas_ComissoesNOME_CLI: TStringField;
    QTabComissoes: TFDQuery;
    QTabComissoesCOD: TIntegerField;
    QTabComissoesCOD_VEND: TIntegerField;
    QTabComissoesPORC_DESCONTO: TBCDField;
    QTabComissoesPORC_COMISSAO: TBCDField;
    frxQTabComissoes: TfrxDBDataset;
    QTabComissoesCOMISSAO_VEND: TBCDField;
    QItensC: TFDQuery;
    QItensCCOD: TIntegerField;
    QItensCCOD_COMISSAO: TIntegerField;
    QItensCCOD_EMP: TIntegerField;
    QItensCCOD_VENDA: TIntegerField;
    QItensCORDEM: TIntegerField;
    QItensCCOD_PRO: TIntegerField;
    QItensCTOTAL: TBCDField;
    QItensCTOTAL_DESCONTOS: TBCDField;
    QItensCPERC_DESCONTO: TBCDField;
    QItensCCOMISSAO_APLICADA: TBCDField;
    QItensCTOTAL_COMISSAO: TBCDField;
    QItensCSUB_TOTAL: TBCDField;
    QItensCDESC_CUPOM: TStringField;
    frxQItensC: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure QComissoesAfterScroll(DataSet: TDataSet);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure QVendas_ComissoesAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    cod_vendedor: integer;
    nome_vendedor: String;
  end;

var
  frmRelComissoes: TfrmRelComissoes;

implementation

uses
  UDM, UConsVend, UDialog, UNovoPrincipal;

{$R *.dfm}

procedure TfrmRelComissoes.FormActivate(Sender: TObject);
begin
   if cod_vendedor = 0 then
      begin
          Application.CreateForm(TFrmConsVend, FrmConsVend);
          FrmConsVend.Tag:= 6;
          FrmConsVend.ShowModal;

          if cod_vendedor = 0 then
             close
          else
          begin
             if TRRelComissos.Active then
                TRRelComissos.Commit;
             TRRelComissos.StartTransaction;
             QComissoes.Close;
             QComissoes.ParamByName( 'cod_emp' ).AsInteger := iEmp;
             QComissoes.ParamByName( 'cod_vend' ).AsInteger := cod_vendedor;
             QComissoes.Open;
             QTabComissoes.Close;
             QTabComissoes.ParamByName( 'cod_vend' ).AsInteger := cod_vendedor;
             QTabComissoes.Open;
             lblVendedor.Caption := IntToStr( cod_vendedor ) + ' - ' + nome_vendedor;
          end;
      end;
end;

procedure TfrmRelComissoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   QComissoes.Close;
   if TRRelComissos.Active then
      TRRelComissos.Commit;
   Action := caFree;
end;

procedure TfrmRelComissoes.FormShow(Sender: TObject);
begin
   cod_vendedor := 0;

end;

procedure TfrmRelComissoes.QComissoesAfterScroll(DataSet: TDataSet);
begin
   if not QComissoesCOD.IsNull then
      begin
         QVendas_Comissoes.Close;
         QVendas_Comissoes.ParamByName( 'COD_COMISSAO' ).AsInteger := QComissoesCOD.AsInteger;
         QVendas_Comissoes.Open;
      end;
end;

procedure TfrmRelComissoes.QVendas_ComissoesAfterScroll(DataSet: TDataSet);
begin
   if not QVendas_ComissoesCOD.IsNull then
      begin
         QItensC.Close;
         QItensC.ParamByName( 'cod_venda' ).AsInteger := QVendas_ComissoesVENDA.AsInteger;
         QItensC.ParamByName( 'cod_comissao' ).AsInteger := QVendas_ComissoesCOD_COMISSOES.AsInteger;
         QItensC.Open;
      end
   else
      QItensC.Close;

end;

procedure TfrmRelComissoes.sSpeedButton1Click(Sender: TObject);
begin
          Application.CreateForm(TFrmConsVend, FrmConsVend);
          FrmConsVend.Tag:= 6;
          FrmConsVend.ShowModal;
             if TRRelComissos.Active then
                TRRelComissos.Commit;
             TRRelComissos.StartTransaction;
             QComissoes.Close;
             QComissoes.ParamByName( 'cod_emp' ).AsInteger := iEmp;
             QComissoes.ParamByName( 'cod_vend' ).AsInteger := cod_vendedor;
             QComissoes.Open;
             QTabComissoes.Close;
             QTabComissoes.ParamByName( 'cod_vend' ).AsInteger := cod_vendedor;
             QTabComissoes.Open;
             lblVendedor.Caption := IntToStr( cod_vendedor ) + ' - ' + nome_vendedor;

end;

procedure TfrmRelComissoes.sSpeedButton2Click(Sender: TObject);
var
   NomeEmpresa: String;
   relArq: String;
   Sql: String;
   Cod: Integer;
begin
   relArq := ExtractFilePath( Application.ExeName ) + 'Report\comissoes_vendedor.fr3';
   if not FileExists( relArq ) then
      begin
        KDialog( 'Arquivo comissoes_vendedor.fr3 não encontrado');
        exit;
      end;
      frxComissoes.LoadFromFile( relArq );
   Sql := 'select * from COMISSOES where cod_emp=:cod_emp and vendedor=:cod_vend';
   Cod := QComissoesCOD.AsInteger;
   QComissoes.Close;
   QComissoes.SQL.Text := 'select * from COMISSOES where cod_emp=:cod_emp and vendedor=:cod_vend and cod=:cod';
   QComissoes.ParamByName( 'cod_emp' ).AsInteger := iEmp;
   QComissoes.ParamByName( 'cod_vend' ).AsInteger := cod_vendedor;
   QComissoes.ParamByName( 'cod' ).AsInteger := cod;
   QComissoes.Open;
   NomeEmpresa := dm.RetornaStringTabela( 'RAZAO_EMP', 'EMPRESA', 'COD_EMP', iEmp );
   frxComissoes.Variables['VENDEDOR'] := QuotedStr( lblVendedor.Caption );
   frxComissoes.Variables['Empresa'] := QuotedStr(  NomeEmpresa );
   frxComissoes.ShowReport( True );
   QComissoes.Close;
   QComissoes.SQL.Text := Sql;
   QComissoes.ParamByName( 'cod_emp' ).AsInteger := iEmp;
   QComissoes.ParamByName( 'cod_vend' ).AsInteger := cod_vendedor;
   QComissoes.Open;

end;

end.




