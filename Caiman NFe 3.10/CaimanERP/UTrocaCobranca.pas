unit UTrocaCobranca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton, Data.DB;

type
  TFrmTrocaCobranca = class(UNovoFormulario.TForm)
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Label10: TLabel;
    EdtCodCob: UNovosComponentes.TEdit;
    BtnConsCob: TsSpeedButton;
    BtnAddCob: TsSpeedButton;
    EdtNomeCob: TEdit;
    Label11: TLabel;
    BtnOK: TButton;
    BtnCancela: TButton;
    IBTRTrocaCob: TFDTransaction;
    IBSQLTrocaCob: TFDQuery;
    procedure BtnConsCobClick(Sender: TObject);
    procedure BtnAddCobClick(Sender: TObject);
    procedure EdtCodCobEnter(Sender: TObject);
    procedure EdtCodCobExit(Sender: TObject);
    procedure EdtCodCobKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodCobKeyPress(Sender: TObject; var Key: Char);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnCancelaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTrocaCobranca: TFrmTrocaCobranca;

implementation

uses
  UConsTipoCobranca, UCadTipoCobranca, Udm, Ubibli1, UConsContasRec, 
  UNovoPrincipal;

{$R *.dfm}

procedure TFrmTrocaCobranca.BtnConsCobClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsTipoCobranca, FrmConsTipoCobranca);
   FrmConsTipoCobranca.Tag:= 5;
   FrmConsTipoCobranca.ShowModal;
end;

procedure TFrmTrocaCobranca.BtnAddCobClick(Sender: TObject);
begin 
   BuscaFormulario( TFrmCadTipoCobranca, True );
end;

procedure TFrmTrocaCobranca.EdtCodCobEnter(Sender: TObject);
begin 
   EdtCodCob.SelectAll;
end;

procedure TFrmTrocaCobranca.EdtCodCobExit(Sender: TObject);
begin 
   if BtnCancela.Focused then
     exit;
   EdtNomeCob.Text := Consulta('tipo_cobranca', edtcodcob, 'cod_cob', 'nome_cob', dm.IBTransaction, dm.qConsulta);
   if EdtNomeCob.Text = '' then
      begin 
         AlertaCad('Tipo de Cobrança não Cadastrado');
//         EdtCodCob.SetFocus;
      end;
end;

procedure TFrmTrocaCobranca.EdtCodCobKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
     BtnConsCob.Click
  else
    if key = vk_f2 then
       BtnAddCob.Click;
end;

procedure TFrmTrocaCobranca.EdtCodCobKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key := #0;
end;

procedure TFrmTrocaCobranca.BtnOKClick(Sender: TObject);
begin 
   if IBTRTrocaCob.Active then
      IBTRTrocaCob.Commit;
   IBTRTrocaCob.StartTransaction;
   try
     try
       FrmConsContasRec.QConsAReceber.First;
       while not FrmConsContasRec.QConsAReceber.Eof do
         begin 
            if FrmConsContasRec.DBGridARec.SelectedRows.CurrentRowSelected = true then
               begin 
                  with IBSQLTrocaCob do
                    begin 
                       close;
                       sql.Clear;
                       sql.add('UPDATE CONTAS_RECEBER SET COD_COB = :1 ' +
                               'WHERE COD_CTR = :2 AND SEQUENCIA_CTR = :3');
                       Parambyname('1').AsInteger  := strtoint(EdtCodCob.Text);
                       Parambyname('2').AsInteger  := FrmConsContasRec.QConsAReceberCOD_CTR.Value;
                       Parambyname('3').AsInteger  := FrmConsContasRec.QConsAReceberSEQUENCIA_CTR.Value;
                       ExecOrOpen;
                    end;
               end;
            FrmConsContasRec.QConsAReceber.Next;
         end;
       IBTRTrocaCob.Commit;
     except
       IBTRTrocaCob.Rollback;
       AlertaCad('Erro ao trocar o tipo de cobrança');
     end;
   finally
     IBSQLTrocaCob.Close;
   end;
   FrmConsContasRec.BtnOk.Click;
   close;
end;

procedure TFrmTrocaCobranca.BtnCancelaClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmTrocaCobranca.FormShow(Sender: TObject);
begin 
   EdtCodCob.Clear;
   EdtNomeCob.Clear;
   EdtCodCob.SetFocus;
end;

procedure TFrmTrocaCobranca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmTrocaCobranca.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmTrocaCobranca.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

end.
