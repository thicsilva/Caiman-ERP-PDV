unit UConsCtrAdmCartaoCred;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Buttons, StdCtrls, ComCtrls, ExtCtrls, DB, Grids, DBGrids, Mask, 
  rxToolEdit, rxCurrEdit, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmConsAdmCartaoCred = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    CheckEmp: TCheckBox;
    EdtCodAdm: UNovosComponentes.TEdit;
    BtnConsAdm: TsSpeedButton;
    EdtNomeAdm: TEdit;
    BtnOk: TButton;
    BtnSair: TButton;
    Label4: TLabel;
    EdtTotalBruto: TCurrencyEdit;
    EdtValorTaxa: TCurrencyEdit;
    Label6: TLabel;
    EdtAcres: TCurrencyEdit;
    Label2: TLabel;
    EdtDesc: TCurrencyEdit;
    Label3: TLabel;
    Label7: TLabel;
    EdtTotalLiq: TCurrencyEdit;
    Rdg: TRadioGroup;
    QConsAdm: TFDQuery;
    DSQConsAdm: TDataSource;
    DBGrid2: TDBGrid;
    QConsAdmCODIGO: TIntegerField;
    QConsAdmCODIGO_BANDEIRA: TIntegerField;
    QConsAdmDOCUMENTO: TStringField;
    QConsAdmEMISSAO: TDateField;
    QConsAdmVENCIMENTO: TDateField;
    QConsAdmDATA_PAGAMENTO: TDateField;
    QConsAdmCOD_CAI: TIntegerField;
    QConsAdmCOD_EMP: TIntegerField;
    QConsAdmCOD_VEN: TIntegerField;
    QConsAdmVALOR: TBCDField;
    QConsAdmVALOR_PAGO: TBCDField;
    QConsAdmACRESCIMO: TBCDField;
    QConsAdmDESCONTO: TBCDField;
    QConsAdmTAXA: TBCDField;
    QConsAdmCODIGO_DUPLICATA: TIntegerField;
    QConsAdmCOD_CLI: TIntegerField;
    QConsAdmPARCELA: TIntegerField;
    QConsAdmLIQUIDO: TBCDField;
    QConsAdmNOME_TPV: TStringField;
    QConsAdmNOME_CLI: TStringField;
    QConsAdmDESCRICAO: TStringField;
    procedure EdtCodAdmEnter(Sender: TObject);
    procedure EdtCodAdmExit(Sender: TObject);
    procedure EdtCodAdmKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodAdmKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsAdmClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsAdmCartaoCred: TFrmConsAdmCartaoCred;

implementation
uses
  Udm, Ubibli1, UConsAdmCartaoCredito, UNovoPrincipal;
var sSql : string;

{$R *.dfm}

procedure TFrmConsAdmCartaoCred.EdtCodAdmEnter(Sender: TObject);
begin 
   EdtCodAdm.SelectAll;
end;

procedure TFrmConsAdmCartaoCred.EdtCodAdmExit(Sender: TObject);
begin 
   if BtnSair.Focused then
     exit;

   EdtNomeAdm.Text:= dm.RetornaStringTabela('descricao', 'administradora_cartao', 'codigo', strtoint(EdtCodAdm.Text));
   if trim(EdtNomeAdm.Text) = '' then
      begin 
         AlertaCad('Bandeira não cadastrada');
//         EdtCodAdm.SetFocus;
      end;
end;

procedure TFrmConsAdmCartaoCred.EdtCodAdmKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsAdm.Click;
end;

procedure TFrmConsAdmCartaoCred.EdtCodAdmKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key := #0;
end;

procedure TFrmConsAdmCartaoCred.BtnConsAdmClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsAdmCartaoCredito, FrmConsAdmCartaoCredito);
   FrmConsAdmCartaoCredito.Tag:= 6;
   FrmConsAdmCartaoCredito.ShowModal;
end;

procedure TFrmConsAdmCartaoCred.BtnOkClick(Sender: TObject);
var cBruto, cValorTaxa, cAcres, cDesc : currency;
begin 
   if EdtCodAdm.Text = '' then
      begin 
         AlertaCad('Digite o código da Administradora');
//         EdtCodAdm.SetFocus;
         exit;
      end;

   cBruto    := 0;
   cValorTaxa:= 0;
   cAcres    := 0;
   cDesc     := 0;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsAdm do
      begin 
         close;
         sql.Clear;
         sql.Text:= sSql;
         case rdg.ItemIndex of
           0: begin 
                 sql.add(' WHERE R.VENCIMENTO BETWEEN :DATAINI AND :DATAFIN ' +
                         ' AND A.CODIGO = :CODADM AND R.DATA_PAGAMENTO IS NULL');
                 if (not CheckEmp.Checked) then
                    begin 
                       sql.Add(' AND R.COD_EMP = :CODEMP');
                       Parambyname('codemp').AsInteger:= iEmp;
                    end;
                 sql.add(' ORDER BY R.VENCIMENTO');
              end;
           1: begin 
                 sql.add(' WHERE R.DATA_PAGAMENTO BETWEEN :DATAINI AND :DATAFIN ' +
                         'AND A.CODIGO = :CODADM');
                 if (not CheckEmp.Checked) then
                    begin 
                       sql.Add(' AND R.COD_EMP = :CODEMP');
                       Parambyname('codemp').AsInteger:= iEmp;
                    end;
                 sql.add(' ORDER BY R.DATA_PAGAMENTO');
              end;
           2: begin 
                 sql.add(' WHERE R.EMISSAO BETWEEN :DATAINI AND :DATAFIN ' +
                         ' AND A.CODIGO = :CODADM');
                 if (not CheckEmp.Checked) then
                    begin 
                       sql.Add(' AND R.COD_EMP = :CODEMP');
                       Parambyname('codemp').AsInteger:= iEmp;
                    end;
                 sql.add(' ORDER BY R.EMISSAO');
              end;
         end;
         Parambyname('dataini').AsDate:= edtdataini.Date;
         Parambyname('datafin').AsDate:= EdtDataFin.Date;
         Parambyname('codadm').AsInteger := strtoint(EdtCodAdm.Text);
         open;
         First;
         while not eof do
            begin 
               cBruto    := cBruto     + QConsAdmVALOR.AsCurrency;
               cValorTaxa:= cValorTaxa + ((QConsAdmVALOR.AsCurrency * QConsAdmTAXA.AsCurrency) / 100);
               cAcres    := cAcres     + QConsAdmACRESCIMO.AsCurrency;
               cDesc     := cDesc      + QConsAdmDESCONTO.AsCurrency;

               next;
            end;
         EdtTotalBruto.Text:= CurrToStr(cBruto);
         EdtValorTaxa.Text := CurrToStr(cValorTaxa);
         EdtTotalLiq.Text  := CurrToStr(cBruto - cValorTaxa);
      end;
end;

procedure TFrmConsAdmCartaoCred.FormShow(Sender: TObject);
begin 
   sSql:= QConsAdm.sql.Text;
   EdtDataIni.date:= date;
   EdtDataFin.Date:= date;
   EdtCodAdm.Clear;
   EdtNomeAdm.Clear;
   rdg.ItemIndex:= 0;
   EdtDataIni.SetFocus;
end;

procedure TFrmConsAdmCartaoCred.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QConsAdm.SQL.Clear;
   QConsAdm.sql.Text:= sSql;
   QConsAdm.Close;
   Action:= caFree;
end;

procedure TFrmConsAdmCartaoCred.BtnSairClick(Sender: TObject);
begin 
   close;
end;

end.
