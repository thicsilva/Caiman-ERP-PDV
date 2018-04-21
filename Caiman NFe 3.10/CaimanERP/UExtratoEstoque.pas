unit UExtratoEstoque;

interface
                                                                                 
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Mask, Grids, DB, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmExtratoEstoque = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    EdtCodPro: UNovosComponentes.TEdit;
    BtnConsPro: TsSpeedButton;
    EdtNomePro: TEdit;
    Label1: TLabel;
    BtnOk: TBitBtn;
    BtnSair: TBitBtn;
    CheckEmp: TCheckBox;
    Label2: TLabel;
    EdtInicioEstoque: TMaskEdit;
    Label3: TLabel;
    EdtData: TMaskEdit;
    SG: TStringGrid;
    QSaldoAnt: TFDQuery;
    QMov: TFDQuery;
    QSaldoAntESTOQUE: TBCDField;
    QMovTIPO: TIntegerField;
    QMovCOD_EMP: TIntegerField;
    QMovDATA: TDateField;
    QMovQUANT: TBCDField;
    QMovHISTORICO: TStringField;
    procedure EdtCodProEnter(Sender: TObject);
    procedure EdtCodProExit(Sender: TObject);
    procedure EdtCodProKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodProKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsProClick(Sender: TObject);
    procedure EdtDataExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmExtratoEstoque: TFrmExtratoEstoque;

implementation
uses
  Udm, Ubibli1, UConsProd, UNovoPrincipal;

{$R *.dfm}

procedure TFrmExtratoEstoque.EdtCodProEnter(Sender: TObject);
begin 
   EdtCodPro.SelectAll;
end;

procedure TFrmExtratoEstoque.EdtCodProExit(Sender: TObject);
begin 
   if BtnSair.Focused then
      exit;
   EdtNomePro.Text:= Consulta('produto', edtcodpro, 'cod_pro', 'nome_pro', dm.IBTransaction, dm.qConsulta);
   if edtnomepro.Text = '' then
      begin 
         AlertaCad('Produto não Cadastrado');
//         edtcodpro.SetFocus;
      end;
end;

procedure TFrmExtratoEstoque.EdtCodProKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsPro.Click;
end;

procedure TFrmExtratoEstoque.EdtCodProKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key := #0;
end;

procedure TFrmExtratoEstoque.BtnConsProClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsProd, FrmConsProd);
   FrmConsProd.tag:= 17;
   FrmConsProd.showmodal;
end;

procedure TFrmExtratoEstoque.EdtDataExit(Sender: TObject);
begin 
   if btnsair.Focused then
      exit;
   try
     strtodate(EdtData.text);
   except
     AlertaCad('Data Inválida');
//     edtdata.SetFocus;
   end;
end;

procedure TFrmExtratoEstoque.FormShow(Sender: TObject);
begin 
   sg.Cols[0].Text:= 'DATA';
   sg.Cols[1].Text:= 'ENTRADAS';
   sg.Cols[2].Text:= 'SAÍDAS';
   sg.Cols[3].Text:= 'SALDO';
   sg.Cols[4].Text:= 'HISTÓRICO';
   sg.Cols[5].Text:= 'EMP';

   { BUSCA A DATA INICIAL DO ESTOQUE }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.Consulta do
          begin 
             close;
             sql.Clear;
             sql.add('SELECT DATA_INICIO_ESTOQUE FROM PARAMETROS WHERE COD_EMP = :CODEMP');
             Parambyname('codemp').AsInteger:= iEmp;
             ExecOrOpen;
             EdtInicioEstoque.Text:= fieldbyname('data_inicio_estoque').AsString;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar a data inicial');
     end;
   finally
    dm.Consulta.Close;
   end;
   
   EdtData.Text:= datetostr(date);
   edtcodpro.Clear;
   EdtNomePro.clear;
   EdtCodPro.SetFocus;
end;

procedure TFrmExtratoEstoque.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmExtratoEstoque.BtnOkClick(Sender: TObject);
var iRow : integer;
var rSaldo : Real;
begin 
   rSaldo:= 0;
   iRow:= 1;
   SG.RowCount:= iRow + 1;
   if EdtCodPro.Text = '' then
      begin 
         AlertaCad('Digite o código do produto');
//         EdtCodPro.SetFocus;
         exit;
      end;
   if strtodate(EdtData.text) < strtodate(EdtInicioEstoque.Text) then
      begin 
         AlertaCad('A data não pode ser menor que a data inicial do estoque');
//         EdtData.SetFocus;
         exit;
      end;

   { BUSCA O SALDO ANTERIOR }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QSaldoAnt do
      begin 
         close;
         if (not CheckEmp.Checked) then
            Parambyname('codemp').AsInteger:= iEmp
         else
            Parambyname('codemp').AsInteger := 0;
         Parambyname('codpro').AsInteger    := strtoint(edtcodpro.Text);
         Parambyname('dataini').AsDate      := strtodate(EdtData.Text) - 1;
         Open;
         rSaldo:= QSaldoAntESTOQUE.Value;
         sg.Cells[3, 1]:= currtostrf(QSaldoAntESTOQUE.Value, ffnumber, 3);
         sg.Cells[4, 1]:= 'Saldo Anterior';
      end;

   { BUSCA O MOVIMENTO }
   with QMov do
      begin 
         close;
         if (not CheckEmp.Checked) then
            Parambyname('codemp').AsInteger := iEmp
         else
            Parambyname('codemp').AsInteger := 0;
         Parambyname('codpro').AsInteger    := strtoint(edtcodpro.Text);
         Parambyname('dataini').AsDate      := strtodate(EdtData.Text);
         Open;
         First;
         while not eof do
            begin 
               { ALIMENTA O GRID }
               inc(iRow);
               SG.RowCount:= iRow + 1;
               sg.Cells[0, iRow]:= QMovDATA.AsString;
               if QMovTIPO.AsInteger in [1,2,3,4,5,6] then
                  begin 
                     sg.Cells[1, iRow]:= CurrToStrF(qMovQUANT.AsCurrency, ffnumber, 3);
                     sg.Cells[2, iRow]:= '0,000';
                     rSaldo:= rSaldo + QMovQUANT.AsCurrency;
                  end
               else
                  begin 
                     sg.Cells[1, iRow]:= '0,000';
                     sg.Cells[2, iRow]:= CurrToStrF(qMovQUANT.AsCurrency, ffnumber, 3);
                     rSaldo:= rSaldo - QMovQUANT.AsCurrency;
                  end;
               sg.Cells[3, iRow]:= CurrToStrF(rSaldo, ffnumber, 3);
               sg.Cells[4, iRow]:= QMovHISTORICO.AsString;
               sg.Cells[5, iRow]:= QMovCOD_EMP.AsString;
               next;
            end;
      end;
end;

procedure TFrmExtratoEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QSaldoAnt.Close;
   QMov.Close;
   Action:= caFree;
end;

procedure TFrmExtratoEstoque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.
