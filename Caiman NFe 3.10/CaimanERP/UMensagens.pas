unit UMensagens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, DBClient, Grids, DBGrids, StdCtrls, Buttons, sSpeedButton, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TfrmMensagens = class(UNovoFormulario.TForm)
    sCDSMen: TDataSource;
    CDSMen: TClientDataSet;
    CDSMenCOD: TIntegerField;
    CDSMenMENSAGEN: TStringField;
    Men: TFDQuery;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Edit1: TEdit;
    sSpeedButton1: TsSpeedButton;
    sSpeedButton2: TsSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AtualizaMens;
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMensagens: TfrmMensagens;

implementation

uses
  UDM, UNovoPrincipal;

{$R *.dfm}

procedure TfrmMensagens.AtualizaMens;
begin 
   CDSMen.Close;
   CDSMen.CreateDataSet;
   CDSMen.Open;
   CDSMen.EmptyDataSet;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   Men.Close;
   Men.SQL.Text := 'select * from Mensagens where COD_EMP=:COD_EMP';
   Men.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
   Men.Open;
   Men.First;
   while not Men.Eof do
      begin 
         CDSmen.Insert;
         CDSmenCOD.AsInteger := Men.FieldByName( 'COD' ).AsInteger;
         CDSmenMensagen.AsString := Men.FieldByName( 'Mensagen' ).AsString;
         CDSMen.Post;
         Men.Next;
      end;
   Men.Close;
   dm.IBTransaction.Commit;
end;

procedure TfrmMensagens.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
   Action := caFree;
end;

procedure TfrmMensagens.FormShow(Sender: TObject);
begin 
    Edit1.Clear;
    if not dm.Acesso('C1023', 'I') then
    begin 
      Application.MessageBox(
        'Você não tem permissão para efetuar esta operação.', 'Aviso',
        mb_ApplModal + MB_ICONINFORMATION + MB_OK + mb_DefButton1);
      Exit;
    end;
    AtualizaMens;
end;

procedure TfrmMensagens.SpeedButton6Click(Sender: TObject);
begin 
   if Edit1.Text <> '' then
     begin 
        Men.Close;
        if dm.IBTransaction.Active then
           dm.IBTransaction.Commit;
        dm.IBTransaction.StartTransaction;
        Men.Close;
        Men.SQL.Text := 'insert into mensagens(COD_EMP, MENSAGEN) values( :COD_EMP, :MEN );';
        Men.ParamByName( 'MEN' ).AsString := Edit1.Text;
        Men.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
        Men.ExecOrOpen;
        Men.Close;
        dm.IBTransaction.Commit;
        AtualizaMens;
        Edit1.Clear;
     end;
end;

procedure TfrmMensagens.SpeedButton7Click(Sender: TObject);
begin 
   if not CDSMenCOD.IsNull then
     begin 
        Men.Close;
        if dm.IBTransaction.Active then
           dm.IBTransaction.Commit;
        dm.IBTransaction.StartTransaction;
        Men.Close;
        Men.SQL.Text := 'delete from MENSAGENS where COD=:COD';
        Men.ParamByName( 'COD' ).AsInteger := CDSMenCOD.AsInteger;
        Men.ExecOrOpen;
        Men.Close;
        dm.IBTransaction.Commit;
        AtualizaMens;

     end;
end;

end.                                                 (
