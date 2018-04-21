unit UConsNCM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UConsNovo, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis,
  dxSkinsdxStatusBarPainter, dxStatusBar, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Data.DB, FireDAC.Comp.DataSet;

type
  TfrmConsNCM = class(TFrmConsNovo)
    QNCM: TFDQuery;
    TRNCM: TFDTransaction;
    dsNCM: TDataSource;
    QNCMCOD_EMP: TIntegerField;
    QNCMNCM: TIntegerField;
    QNCMEX: TIntegerField;
    QNCMTIPO: TIntegerField;
    QNCMDESCRICAO: TStringField;
    QNCMNACIONAL: TBCDField;
    QNCMIMPORTADO: TBCDField;
    QNCMESTADUAL: TBCDField;
    QNCMMUNICIPAL: TBCDField;
    QNCMDT_INI: TDateField;
    QNCMDT_FIM: TDateField;
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    Sql: String;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses UDM;

procedure TfrmConsNCM.BtnLocalizarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmConsNCM.BtnOKClick(Sender: TObject);
begin
  inherited;
  if TRNCM.Active then
     TRNCM.Commit;
  TRNCM.StartTransaction;
  QNCM.Close;
  QNCM.SQL.Text := Sql;
  case ComboCons.ItemIndex of
      0: begin
            QNCM.SQL.Add( 'WHERE NCM LIKE :FILTRO' );
            QNCM.SQL.Add( 'OR DESCRICAO LIKE :FILTRO' );
            QNCM.ParamByName( 'FILTRO' ).AsString := '%' + EdtCons.Text + '%';
         end;
      1: begin
            QNCM.SQL.Add( 'WHERE DESCRICAO LIKE :FILTRO' );
            QNCM.ParamByName( 'FILTRO' ).AsString := '%' + EdtCons.Text + '%';
         end;
      2: begin
            QNCM.SQL.Add( 'WHERE NCM LIKE :FILTRO' );
            QNCM.ParamByName( 'FILTRO' ).AsString := EdtCons.Text + '%';
         end;
  end;
  QNCM.SQL.Add( 'AND COD_EMP=:COD_EMP' );
  QNCM.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
  QNCM.Open;
end;

procedure TfrmConsNCM.BtnSairClick(Sender: TObject);
begin
  inherited;
   ModalResult := mrCancel;
end;

procedure TfrmConsNCM.FormDestroy(Sender: TObject);
begin
  inherited;
  QNCM.Close;
  if TRNCM.Active then
      TRNCM.Commit;
end;

procedure TfrmConsNCM.FormShow(Sender: TObject);
begin
  inherited;
  Sql :=  QNCM.SQL.Text;
end;

end.
