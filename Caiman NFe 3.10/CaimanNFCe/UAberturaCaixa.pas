unit UAberturaCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Mask, ComCtrls, ExtCtrls, DB, rxToolEdit, rxCurrEdit, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmAberturaCaixa = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    BtnOk: TButton;
    BtnCancelar: TButton;
    StatusBar1: TStatusBar;
    EdtData: TMaskEdit;
    EdtHora: TMaskEdit;
    IBSQLAbre: TFDQuery;
    Label3: TLabel;
    EdtNomeCaixa: TEdit;
    EdtCodCaixa: TEdit;
    EdtSuprimento: TCurrencyEdit;
    Label4: TLabel;
    BtnMenuFiscal: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BuscaCaixa;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnMenuFiscalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAberturaCaixa: TFrmAberturaCaixa;

implementation
uses
  Udm, UECF, UMenuFiscal;

{$R *.dfm}

procedure TFrmAberturaCaixa.BuscaCaixa;
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QConsulta do
      begin
         close;
         sql.Clear;
         sql.Add('SELECT DESC_CAI ' +
                 'FROM CAIXA      ' +
                 'WHERE COD_CAI = :CODCAI AND COD_EMP = :CODEMP');
         Parambyname('codcai').AsInteger := iCaixa;
         Parambyname('codemp').AsInteger := iEmp;
         Open;
         if recordcount > 0 then
            EdtNomeCaixa.Text:= fieldbyname('desc_cai').AsString
         else
            begin
               showmessage('Caixa não Cadastrado');
               EdtNomeCaixa.Clear;
            end;
      end;
   dm.IBTransaction.Commit;
   dm.QConsulta.Close;
end;

procedure TFrmAberturaCaixa.FormShow(Sender: TObject);
begin
   EdtCodCaixa.Text := inttostr(iCaixa);
   buscacaixa;
   edtdata.Text := datetostr(now);
   edthora.Text := timetostr(time);
   edtdata.setfocus;

end;

procedure TFrmAberturaCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:= caFree;
   Self := nil;
end;

procedure TFrmAberturaCaixa.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmAberturaCaixa.BtnCancelarClick(Sender: TObject);
begin
   close;
end;

procedure TFrmAberturaCaixa.BtnOkClick(Sender: TObject);
var iCodAF : integer;
begin
   iCodAF:= 0;

   { verifica se valor negativo }
   if strtocurr(EdtSuprimento.Text) < 0 then
      begin
         showmessage('Valor do suprimento não pode ser negativo');
         EdtSuprimento.SetFocus;
         exit;
         abort;
      end;

   { Verifica se o caixa ja foi aberto }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.add('SELECT CODIGO ' +
                     'FROM ABRE_FECHA_CAIXA ' +
                     'WHERE DATA_ABRE = :DATA AND COD_CAI = :CODCAI AND COD_EMP = :CODEMP');
             Parambyname('data').AsDate       := strtodate(EdtData.text);
             Parambyname('codcai').AsInteger  := iCaixa;
             Parambyname('codemp').AsInteger  := iEmp;
             Open;
             iCodAF:= fieldbyname('codigo').AsInteger;
          end;
       dm.IBTransaction.Commit;
     except
       iCodAF:= 0;
       dm.IBTransaction.Rollback;
       showmessage('Erro ao verificar se o caixa está aberto');
     end;
   finally
     dm.QConsulta.Close;
   end;

   if iCodAF > 0 then
      begin
         showmessage('Este Caixa já está Aberto');
         exit;
         abort;
      end;

   if Application.MessageBox('Deseja abrir o Caixa?', 'Abertura do Caixa', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin
         if AbreECF(iECF, strtocurr(EdtSuprimento.Text)) = 0 then
            begin
               { gravando a abertura do caixa }
               if dm.IBTransaction.Active then
                  dm.IBTransaction.Commit;
               dm.IBTransaction.StartTransaction;
               try
                 try
                   with IBSQLAbre do
                      begin
                         close;
                         sql.Clear;
                         sql.Add('INSERT INTO ABRE_FECHA_CAIXA (CODIGO, COD_EMP, COD_CAI, COD_USU, DATA_ABRE, HORA_ABRE) ' +
                                 'VALUES(GEN_ID(GNT_COD_ABRE_FECHA_CAIXA, 1), :CODEMP, :CODCAI, :CODUSU, :DATAABRE, :HORAABRE)');
                         Parambyname('codemp').AsInteger := iEmp;
                         Parambyname('codcai').AsInteger := iCaixa;
                         Parambyname('codusu').AsInteger := ICodUsu;
                         Parambyname('dataabre').AsDate  := strtodate(EdtData.Text);
                         Parambyname('horaabre').AsTime  := strtotime(edthora.Text);
                         ExecOrOpen;
                      end;
                   dm.IBTransaction.Commit;
                 except
                   showmessage('Erro ao gravar a Abertura do Caixa');
                   dm.IBTransaction.Rollback;
                 end;
               finally
                 IBSQLAbre.Close;
               end;
            end;
      end;
end;

procedure TFrmAberturaCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close;
end;

procedure TFrmAberturaCaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmAberturaCaixa.BtnMenuFiscalClick(Sender: TObject);
begin
   Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
   FrmMenuFiscal.showmodal;
end;

end.
