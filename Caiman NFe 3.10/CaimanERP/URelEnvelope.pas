unit URelEnvelope;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, Mask, MatrixPrinter, 
  UNovosComponentes, UNovoFormulario, sSpeedButton;

type
  TFrmRelEnvelope = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    ComboCliFor: TComboBox;
    GB: TGroupBox;
    BtnCons: TsSpeedButton;
    EdtCod: UNovosComponentes.TEdit;
    EdtNome: TEdit;
    BtnOK: TBitBtn;
    BtnSair: TBitBtn;
    GBDados: TGroupBox;
    Label1: TLabel;
    EdtEnd: TEdit;
    Label2: TLabel;
    EdtBairro: TEdit;
    Label3: TLabel;
    EdtCid: TEdit;
    Label4: TLabel;
    EdtCEP: TMaskEdit;
    Label5: TLabel;
    EdtContato: TEdit;
    Label6: TLabel;
    EdtNomeEmpresa: TEdit;
    BtnImp: TBitBtn;
    MP: TMatrixPrinter;
    procedure BtnConsClick(Sender: TObject);
    procedure EdtCodEnter(Sender: TObject);
    procedure EdtCodKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodExit(Sender: TObject);
    procedure ComboCliForChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Limpa;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnImpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelEnvelope: TFrmRelEnvelope;

implementation

uses
  Udm, Ubibli1, UConsCli, UConsFor, UNovoPrincipal;

{$R *.dfm}

procedure TFrmRelEnvelope.Limpa;
begin 
   EdtNomeEmpresa.Clear;
   EdtEnd.Clear;
   EdtCid.Clear;
   EdtBairro.Clear;
   edtcep.Clear;
   EdtContato.Clear;
end;

procedure TFrmRelEnvelope.BtnConsClick(Sender: TObject);
begin 
   if ComboCliFor.ItemIndex = 0 then
      begin 
         Application.CreateForm(TFrmConsCli, FrmConsCli);
         FrmConsCli.tag:= 30;
         FrmConsCli.showmodal;
      end
   else
      begin 
         Application.CreateForm(TFrmConsFor, FrmConsFor);
         FrmConsFor.tag:= 20;
         FrmConsFor.showmodal;
      end;
end;

procedure TFrmRelEnvelope.EdtCodEnter(Sender: TObject);
begin 
   EdtCod.SelectAll;
end;

procedure TFrmRelEnvelope.EdtCodKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmRelEnvelope.EdtCodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnCons.Click;
end;

procedure TFrmRelEnvelope.EdtCodExit(Sender: TObject);
begin 
   if (btnsair.Focused) or (ComboCliFor.Focused) or (edtcod.Text = '') then
       exit;
   if ComboCliFor.ItemIndex = 0 then
      begin 
         EdtNome.Text:= consulta('cliente', EdtCod, 'cod_cli', 'nome_cli', dm.IBTransaction, dm.qConsulta);
         if EdtNome.Text = '' then
            begin 
               AlertaCad('Cliente não Cadastrado');
//               EdtCod.SetFocus;
            end;
      end
   else
      begin 
         EdtNome.Text:= consulta('fornecedor', EdtCod, 'cod_for', 'razao_for', dm.IBTransaction, dm.qConsulta);
         if EdtNome.Text = '' then
            begin 
               AlertaCad('Fornecedor não Cadastrado');
//               EdtCod.SetFocus;
            end;
      end;
end;

procedure TFrmRelEnvelope.ComboCliForChange(Sender: TObject);
begin 
   limpa;
   EdtCod.Clear;
   edtnome.Clear;
   if ComboCliFor.ItemIndex = 0 then
      begin 
         gb.Caption:= 'Cliente';
         GBDados.Caption:= 'Dados do Cliente';
      end
   else
      begin 
         gb.Caption:= 'Fornecedor';
         GBDados.Caption:= 'Dados do Fornecedor';
      end;
end;

procedure TFrmRelEnvelope.FormShow(Sender: TObject);
begin 
   ComboCliFor.ItemIndex:= 0;
   ComboCliForChange(ComboCliFor);
   edtcod.Clear;
   EdtNome.Clear;
   EdtCod.SetFocus;
end;

procedure TFrmRelEnvelope.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelEnvelope.BtnOKClick(Sender: TObject);
begin 
   if EdtCod.text <> '' then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with dm.QConsulta do
            begin 
               close;
               sql.Clear;
               if ComboCliFor.ItemIndex = 0 then
                  begin 
                     sql.add('SELECT ENDRES_CLI, BAIRES_CLI, CIDRES_CLI, CEPRES_CLI, ' +
                             'ESTRES_CLI, CONTATO_CLI ' +
                             'FROM CLIENTE WHERE COD_CLI = :COD');
                     Parambyname('cod').AsInteger:= strtoint(edtcod.Text);
                     open;
                     EdtNomeEmpresa.Text:= EdtNome.Text;
                     edtend.Text        := fieldbyname('endres_cli').AsString;
                     EdtCid.Text        := fieldbyname('cidres_cli').AsString + ' - ' + fieldbyname('estres_cli').AsString;
                     EdtBairro.Text     := fieldbyname('baires_cli').AsString;
                     EdtCEP.Text        := fieldbyname('cepres_cli').AsString;
                     EdtContato.Text    := fieldbyname('contato_cli').AsString;
                  end
               else
                  begin 
                     sql.add('SELECT END_FOR, BAI_FOR, CID_FOR, CEP_FOR, ' +
                             'EST_FOR, CONTATO_FOR ' +
                             'FROM FORNECEDOR WHERE COD_FOR = :COD');
                     Parambyname('cod').AsInteger:= strtoint(edtcod.Text);
                     open;
                     EdtNomeEmpresa.Text:= EdtNome.Text;
                     edtend.Text        := fieldbyname('end_for').AsString;
                     EdtCid.Text        := fieldbyname('cid_for').AsString + ' - ' + fieldbyname('est_for').AsString;
                     EdtBairro.Text     := fieldbyname('bai_for').AsString;
                     EdtCEP.Text        := fieldbyname('cep_for').AsString;
                     EdtContato.Text    := fieldbyname('contato_for').AsString;
                  end;
            end;
         dm.IBTransaction.Commit;
         DM.QConsulta.Close;
      end
   else
      begin 
         EdtNomeEmpresa.Clear;
         edtnome.Clear;
         EdtEnd.Clear;
         edtcid.Clear;
         EdtBairro.Clear;
         EdtCEP.Clear;
         EdtContato.clear;
      end;
end;

procedure TFrmRelEnvelope.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   Action:= caFree;
end;

procedure TFrmRelEnvelope.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmRelEnvelope.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRelEnvelope.BtnImpClick(Sender: TObject);
var sPorta : string;
var iLInha : integer;
begin 
   iLInha:= 0;
   {****** Busca a porta da impressora *****}
   sPorta:= dm.LeIni('cnfcomercio.ini', 'ConfiguracaoLocal', 'CaminhoImpressora');
   {==========================================================================}
   {======================= INICIALIZA IMPRESSORA  ===========================}
   {==========================================================================}
   MP.BeginPrintProcess(sPorta);
   MP.InitializePrinter;
   MP.BoldOn;
   mp.PutIntoPrinter(iLInha + 1, 1, 'Destinatário:');
   mp.PutIntoPrinter(iLInha + 2, 1, trim(EdtNomeEmpresa.Text));
   mp.PutIntoPrinter(iLInha + 3, 1, 'A/C Sr(a).');
   mp.PutIntoPrinter(iLInha + 4, 1, trim(EdtContato.Text));
   mp.PutIntoPrinter(iLInha + 5, 1, trim(EdtEnd.Text));
   mp.PutIntoPrinter(iLInha + 6, 1, trim(EdtBairro.Text));
   mp.PutIntoPrinter(iLInha + 7, 1, trim(EdtCid.Text));
   mp.PutIntoPrinter(iLInha + 8, 1, EdtCEP.text);

   {==========================================================================}
   {=========================== FINALIZA IMPRESSORA  =========================}
   {==========================================================================}
   MP.BoldOff;
   mp.Eject;
   MP.EndPrintProcess;
end;

end.
