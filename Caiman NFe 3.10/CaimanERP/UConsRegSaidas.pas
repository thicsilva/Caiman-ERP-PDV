unit UConsRegSaidas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ComCtrls, Grids, DBGrids, ExtCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmConsRegSaidas = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    BtnLocalizar: TButton;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    GroupBox2: TGroupBox;
    EdtCNPJ: UNovosComponentes.TEdit;
    BtnOK: TButton;
    BtnSair: TButton;
    QCons: TFDQuery;
    QConsCODIGO: TIntegerField;
    QConsDATA: TDateField;
    QConsCNPJ: TStringField;
    QConsSERIE_NOTA: TStringField;
    QConsNUMERO_NOTA: TIntegerField;
    QConsEMITENTE: TStringField;
    QConsVALOR_TOTAL: TBCDField;
    QConsSITUACAO: TStringField;
    QConsCODIGO_EMPRESA: TIntegerField;
    QConsINSCRICAO: TStringField;
    QConsUF: TStringField;
    QConsDESCRICAO: TStringField;
    DSCons: TDataSource;
    QConsCODIGO_SAIDA: TIntegerField;
    QConsNUMERO_NOTA_FINAL: TIntegerField;
    QConsCODIGO_MAPA_RESUMO: TIntegerField;
    QConsCODIFICACAO_FISCAL: TStringField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsRegSaidas: TFrmConsRegSaidas;

implementation
uses
  Udm, URegSaidas, UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsRegSaidas.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsRegSaidas.FormShow(Sender: TObject);
begin 
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;
   EdtCNPJ.Clear;
   EdtDataIni.SetFocus;
end;

procedure TFrmConsRegSaidas.BtnOKClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QCons do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT R.*, M.DESCRICAO ' +
                 'FROM REGISTRO_LIVRO_SAIDAS R ' +
                 'INNER JOIN CODIFICACAO_DOCUMENTOS M ' +
                 'ON (R.CODIFICACAO_FISCAL = M.CODIGO) ' +
                 'WHERE R.DATA BETWEEN :DATAINI AND :DATAFIN AND ' +
                 'R.CODIGO_EMPRESA = :CODEMP');
         if EdtCNPJ.Text <> '' then
            sql.Add(' AND R.CNPJ = ' + #39 + trim(EdtCNPJ.Text) + #39);
         sql.add(' ORDER BY R.DATA, R.CODIGO');
         Parambyname('dataini').AsDate  := EdtDataIni.Date;
         Parambyname('datafin').AsDate  := EdtDataFin.Date;
         Parambyname('codemp').AsInteger:= iEmp;
         open;
      end;
end;

procedure TFrmConsRegSaidas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QCons.Close;
   Action:= caFree;
end;

procedure TFrmConsRegSaidas.FormCreate(Sender: TObject);
begin 
   
end;

procedure TFrmConsRegSaidas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmConsRegSaidas.BtnLocalizarClick(Sender: TObject);
begin 
   if (tag = 0) or (tag = 1) then
      begin 
         if tag = 1 then
            Application.CreateForm(TFrmRegSaidas, FrmRegSaidas);
         with FrmRegSaidas do
            begin 
               tag                := 1;
               EdtCod.Text        := QConsCODIGO.AsString;
               EdtData.Text       := QConsDATA.AsString;
               EdtNFInicial.Text  := QConsNUMERO_NOTA.AsString;
               EdtCodModelo.Text  := QConsCODIFICACAO_FISCAL.AsString;
               EdtNomeModelo.Text := QConsDESCRICAO.AsString;
               EdtSerie.Text      := QConsSERIE_NOTA.AsString;
               EdtCNPJ.Text       := QConsCNPJ.AsString;
               EdtInscricao.Text  := QConsINSCRICAO.AsString;
               EdtUF.Text         := QConsUF.AsString;
               EdtTotalNF.Text    := QConsVALOR_TOTAL.AsString;
               if QConsEMITENTE.AsString = 'P' then
                  ComboEmitente.ItemIndex:= 0
               else
                  ComboEmitente.ItemIndex:= 1;
               if QConsSITUACAO.AsString = 'N' then
                  ComboSituacao.ItemIndex:= 0
               else
                  ComboSituacao.ItemIndex:= 1;
               EdtNFFinal.Text    := QConsNUMERO_NOTA_FINAL.AsString;
               BuscaItens;
               show;
               FormShow(sender);
            end;
         close;
      end;
end;

end.
