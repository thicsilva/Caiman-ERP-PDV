unit URelContasReceberCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmRelContasReceberCartao = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    Panel2: TPanel;
    GBPeriodo: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    RdgOrdem: TRadioGroup;
    CheckEmp: TCheckBox;
    GBCliente: TGroupBox;
    BtnConsAdm: TsSpeedButton;
    EdtCodAdm: UNovosComponentes.TEdit;
    EdtNomeAdm: TEdit;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    ComboBandeira: TComboBox;
    Rdg: TRadioGroup;
    QAReceber: TFDQuery;
    QAReceberCODIGO: TIntegerField;
    QAReceberCODIGO_DUPLICATA: TIntegerField;
    QAReceberDOCUMENTO: TStringField;
    QAReceberEMISSAO: TDateField;
    QAReceberVENCIMENTO: TDateField;
    QAReceberVALOR: TBCDField;
    QAReceberNOME_CLI: TStringField;
    QAReceberDESCRICAO: TStringField;
    QAReceberPARCELA: TIntegerField;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnConsAdmClick(Sender: TObject);
    procedure EdtCodAdmEnter(Sender: TObject);
    procedure EdtCodAdmKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodAdmExit(Sender: TObject);
    procedure EdtCodAdmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BuscaBandeiras;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelContasReceberCartao: TFrmRelContasReceberCartao;

implementation
uses
  Udm, Ubibli1, UConsAdmCartaoCredito, UQRelCTRAdm, UNovoPrincipal;
var sSql : string;

{$R *.dfm}

procedure TFrmRelContasReceberCartao.BuscaBandeiras;
begin 
   ComboBandeira.Clear;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.Text:= 'SELECT CODIGO, DESCRICAO ' +
                        'FROM BANDEIRAS_CARTAO    ' +
                        'WHERE CODIGO_ADMINISTRADORA = :CODADM ' +
                        'ORDER BY CODIGO';
             Parambyname('codadm').AsInteger:= strtoint(EdtCodAdm.Text);
             open;
             while not eof do
                begin 
                   ComboBandeira.Items.Add(FormataStringD(fieldbyname('codigo').AsString, '2', '0') + '-' +
                                           fieldbyname('descricao').AsString);
                   next;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar as bandeiras');
     end;
   finally
     dm.qconsulta.Close;
     ComboBandeira.ItemIndex:= 0;
   end;
end;

procedure TFrmRelContasReceberCartao.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelContasReceberCartao.BtnConsAdmClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsAdmCartaoCredito, FrmConsAdmCartaoCredito);
   FrmConsAdmCartaoCredito.Tag:= 7;
   FrmConsAdmCartaoCredito.ShowModal;
end;

procedure TFrmRelContasReceberCartao.EdtCodAdmEnter(Sender: TObject);
begin 
   EdtCodAdm.SelectAll;
end;

procedure TFrmRelContasReceberCartao.EdtCodAdmKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmRelContasReceberCartao.EdtCodAdmExit(Sender: TObject);
begin 
   if BtnSair.Focused then
     exit;

   EdtNomeAdm.Text:= dm.RetornaStringTabela('descricao', 'administradora_cartao', 'codigo', strtoint(EdtCodAdm.Text));
   if trim(EdtNomeAdm.Text) = '' then
      begin 
         AlertaCad('Bandeira não cadastrada');
//         EdtCodAdm.SetFocus;
      end
   else
      BuscaBandeiras;
end;

procedure TFrmRelContasReceberCartao.EdtCodAdmKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsAdm.Click;
end;

procedure TFrmRelContasReceberCartao.FormShow(Sender: TObject);
begin 
   sSql:= QAReceber.SQL.Text;
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;
   EdtCodAdm.SetFocus;
end;

procedure TFrmRelContasReceberCartao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;

   Action:= caFree;
end;

procedure TFrmRelContasReceberCartao.BtnVisClick(Sender: TObject);
begin 
   if edtdatafin.Date < edtdataini.Date then
      begin 
         AlertaCad('A data final não pode ser menor que a data inicial');
//         Edtdataini.SetFocus;
         exit;
      end;

   if trim(EdtCodAdm.Text) = '' then
      begin 
         AlertaCad('Digite o código da administradora');
//         EdtCodAdm.SetFocus;
         exit;
      end;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QAReceber do
      begin 
         close;
           sql.Clear;
           sql.Text := sSql;

           case Rdg.ItemIndex of
            0:begin 
                 sql.Add(' AND R.VENCIMENTO BETWEEN :DATAINI AND :DATAFIN' +
                         ' AND R.DATA_PAGAMENTO IS NULL');
                 Parambyname('dataini').AsDate:= edtdataini.Date;
                 Parambyname('datafin').AsDate:= edtdatafin.Date;
              end;
            1:begin 
                  sql.Add(' AND R.EMISSAO <= :DATAFIN' +
                          ' AND (R.DATA_PAGAMENTO IS NULL OR R.DATA_PAGAMENTO > :DATAFIN)');
                 Parambyname('datafin').AsDate:= edtdatafin.Date;
              end;
           end;

           if (not CheckEmp.Checked) then
              begin 
                 sql.Add(' AND R.COD_EMP = :CODEMP');
                 Parambyname('codemp').AsInteger:= iEmp;
              end;

           if rdgordem.ItemIndex = 0 then
              sql.Add(' ORDER BY C.NOME_CLI, C.COD_CLI, R.VENCIMENTO')
           else
              sql.Add(' ORDER BY R.VENCIMENTO');

           Parambyname('codban').AsInteger:= strtoint(copy(ComboBandeira.Text, 1, 2));
           open;
      end;

     Application.CreateForm(TFrmQRelCTRAdm, FrmQRelCTRAdm);
     FrmQRelCTRAdm.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;

     case rdg.ItemIndex of
       0: FrmQRelCTRAdm.QRLTitulo.Caption := 'Relatório de Contas a Receber [Cartão] no Período de: ' +
          datetostr(EdtDataIni.Date) + ' a ' + datetostr(EdtDataFin.Date);

       1: FrmQRelCTRAdm.QRLTitulo.Caption := 'Relatório Contábil de Contas a Receber [Cartão] no Período de: ' +
          datetostr(EdtDataIni.Date) + ' a ' + datetostr(EdtDataFin.Date);
     end;

     if sender = btnvis then
        begin 
           FrmQRelCTRAdm.QRCTRAdm.PreviewInitialState:= wsMaximized;
           FrmQRelCTRAdm.QRCTRAdm.Preview;
        end
     else
        begin 
           FrmQRelCTRAdm.QRCTRAdm.PrinterSetup;
           FrmQRelCTRAdm.QRCTRAdm.Print;
        end;
     FrmQRelCTRAdm.QRCTRAdm.QRPrinter:= nil;
end;

end.
