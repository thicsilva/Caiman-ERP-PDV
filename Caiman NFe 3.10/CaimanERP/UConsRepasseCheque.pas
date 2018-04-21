unit UConsRepasseCheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Grids, DBGrids, DB, Buttons, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmConsRepasse = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    EdtDataIni: TDateTimePicker;
    Label1: TLabel;
    EdtDataFin: TDateTimePicker;
    BtnOK: TBitBtn;
    BtnSair: TBitBtn;
    QConsRepasse: TFDQuery;
    DSQConsRepasse: TDataSource;
    DBGrid1: TDBGrid;
    QConsRepasseTOTAL: TBCDField;
    QConsRepasseCOD_REPASSE: TIntegerField;
    QConsRepasseDESTINO_CHE: TStringField;
    QConsRepassePRIDEP_CHE: TDateField;
    BtnImp: TBitBtn;
    BtnCancelar: TBitBtn;
    IBTRRepasse: TFDTransaction;
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnImpClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsRepasse: TFrmConsRepasse;

implementation
uses
  Udm, UQRelRepasseCheque, UNovoPrincipal, UComissoesVendedores;

{$R *.dfm}

procedure TFrmConsRepasse.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsRepasse.FormShow(Sender: TObject);
begin 
   edtdataini.Date:= date;
   edtdatafin.Date:= date;
   edtdataini.SetFocus;
end;

procedure TFrmConsRepasse.BtnOKClick(Sender: TObject);
begin 
   if IBTRRepasse.Active then
      IBTRRepasse.Commit;
   IBTRRepasse.StartTransaction;
   with QConsRepasse do
     begin 
        close;
        Parambyname('dataini').AsDate  := edtdataini.Date;
        Parambyname('datafin').AsDate  := edtdatafin.Date;
        Open;
     end;
end;

procedure TFrmConsRepasse.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if IBTRRepasse.Active then
      IBTRRepasse.Commit;
   QConsRepasse.Close;
   Action:= caFree;
end;

procedure TFrmConsRepasse.BtnCancelarClick(Sender: TObject);
begin 
   if Application.MessageBox('Confirma o cancelamento do Repasse?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
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
                   sql.Add('UPDATE CHEQUE SET COD_REPASSE = NULL, DESTINO_CHE = NULL, ' +
                           'PRIDEP_CHE = NULL, SELECIONADO_CHE = ' + #39 + 'N' + #39 +
                           ' WHERE COD_REPASSE = :COD');
                   Parambyname('cod').AsInteger := QConsRepasseCOD_REPASSE.Value;
                   ExecOrOpen;
                end;
             dm.IBTransaction.Commit;
           except
             dm.IBTransaction.Rollback;
             AlertaCad('Erro ao cancelar o repasse');
           end;
         finally
           dm.Consulta.Close;
           btnok.Click;
         end;
      end;
end;

procedure TFrmConsRepasse.BtnImpClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   With dm.QRelRepasse do
      begin 
          close;
          parambyname('codrepasse').AsInteger:= QConsRepasseCOD_REPASSE.AsInteger;
          open;
      end;
   Application.CreateForm(TFrmQRelRepasseCheque, FrmQRelRepasseCheque);
   FrmQRelRepasseCheque.QRLTitulo.Caption := 'Repassados para: ' +
   QConsRepasseDESTINO_CHE.Value;
   FrmQRelRepasseCheque.QRLRepasse.Caption:= 'Repasse: ' +
   FormatFloat('000000', strtofloat(QConsRepasseCOD_REPASSE.AsString));
   FrmQRelRepasseCheque.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
   FrmQRelRepasseCheque.QRRepasse.PreviewInitialState:= wsMaximized;
   FrmQRelRepasseCheque.QRRepasse.Preview;
   FrmQRelRepasseCheque.QRRepasse.QRPrinter:= nil;
   dm.IBTransaction.Commit;
   dm.QRelRepasse.Close;
end;

procedure TFrmConsRepasse.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.
