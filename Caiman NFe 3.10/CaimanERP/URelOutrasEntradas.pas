unit URelOutrasEntradas;

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
  TFrmRelOutrasEntradas = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    GBTipoVenda: TGroupBox;
    BtnConsTipo: TsSpeedButton;
    EdtCodTipo: UNovosComponentes.TEdit;
    EdtNomeTipo: TEdit;
    CheckTipo: TCheckBox;
    GroupBox1: TGroupBox;
    BtnConsFor: TsSpeedButton;
    EdtCodFor: UNovosComponentes.TEdit;
    EdtNomeFor: TEdit;
    CheckFor: TCheckBox;
    CheckEmp: TCheckBox;
    Panel2: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    StatusBar1: TStatusBar;
    QRelOE: TFDQuery;
    QRelOEQUANT: TBCDField;
    QRelOECOD_ES: TIntegerField;
    QRelOECOD_PRO: TIntegerField;
    QRelOENOME_PRO: TStringField;
    QRelOENOME_ES: TStringField;
    procedure CheckTipoClick(Sender: TObject);
    procedure CheckForClick(Sender: TObject);
    procedure BtnConsTipoClick(Sender: TObject);
    procedure EdtCodTipoExit(Sender: TObject);
    procedure EdtCodTipoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodTipoKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsForClick(Sender: TObject);
    procedure EdtCodForKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodForExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelOutrasEntradas: TFrmRelOutrasEntradas;

implementation
uses
  Udm, UConsTipoES, UConsFor, UBibli1, UNovoPrincipal, UQRelOutrasEntradas;

{$R *.dfm}

procedure TFrmRelOutrasEntradas.CheckTipoClick(Sender: TObject);
begin 
    if CheckTipo.Checked then
      begin 
         EdtCodTipo.Clear;
         EdtNomeTipo.Clear;
         BtnConsTipo.Enabled := false;
         edtcodtipo.Enabled  := false;
         EdtNomeTipo.Enabled := false;
      end
   else
      begin 
         BtnConsTipo.Enabled := true;
         edtcodtipo.Enabled  := true;
         edtnometipo.Enabled := true;
         edtcodtipo.Clear;
         edtnometipo.Clear;
         edtcodtipo.SetFocus;
      end;
end;

procedure TFrmRelOutrasEntradas.CheckForClick(Sender: TObject);
begin 
   if CheckFor.Checked then
      begin 
         EdtCodFor.Clear;
         EdtNomeFor.Clear;
         BtnConsFor.Enabled := false;
         EdtCodFor.Enabled  := false;
         EdtNomeFor.Enabled := false;
      end
   else
      begin 
         BtnConsFor.Enabled := true;
         EdtCodFor.Enabled  := true;
         EdtNomeFor.Enabled := true;
         EdtCodFor.Clear;
         EdtNomeFor.Clear;
         EdtCodFor.SetFocus;
      end;
end;

procedure TFrmRelOutrasEntradas.BtnConsTipoClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsTipoES, FrmConsTipoES);
   FrmConsTipoES.tag:= 7;
   FrmConsTipoES.showmodal;
end;

procedure TFrmRelOutrasEntradas.EdtCodTipoExit(Sender: TObject);
begin 
   if EdtCodTipo.Text = '' then
      begin 
         edtcodtipo.Clear;
         edtnometipo.Clear;
         exit;
      end;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.Consulta do
          begin 
             close;
             sql.Clear;
             sql.Add('SELECT NOME_ES ' +
                     'FROM TIPO_ES ' +
                     'WHERE COD_ES = ' + EdtCodTipo.text + ' AND TIPO_ES = ' + #39 + 'E' + #39);
             ExecOrOpen;
             if recordcount > 0 then
                EdtNomeTipo.Text:= fieldbyname('nome_es').Value
             else
                begin 
                   AlertaCad('Tipo de Outras Entradas não Cadastrado');
                   EdtNomeTipo.Clear;
//                   EdtCodTipo.SetFocus;
                   EdtCodTipo.SelectAll;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       AlertaCad('Erro ao Buscar o Tipo de Outras Entradas');
       EdtNomeTipo.Clear;
//       EdtCodTipo.SetFocus;
       EdtCodTipo.SelectAll;
     end;
   finally
       DM.Consulta.Close;
   end;
end;

procedure TFrmRelOutrasEntradas.EdtCodTipoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsTipo.Click
end;

procedure TFrmRelOutrasEntradas.EdtCodTipoKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmRelOutrasEntradas.BtnConsForClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsFor, FrmConsFor);
   FrmConsFor.tag:= 15;
   FrmConsFor.showmodal;
end;

procedure TFrmRelOutrasEntradas.EdtCodForKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsFor.Click;
end;

procedure TFrmRelOutrasEntradas.EdtCodForExit(Sender: TObject);
begin 
   if BtnSair.Focused then
      exit;
   EdtNomeFor.Text:= consulta('fornecedor', edtcodfor, 'cod_for', 'razao_for', dm.IBTransaction, dm.qConsulta);
   if EdtNomeFor.Text = '' then
      begin 
         AlertaCad('Fornecedor não Cadastrado');
//         EdtCodFor.SetFocus;
         EdtCodFor.SelectAll;
      end;
end;

procedure TFrmRelOutrasEntradas.FormShow(Sender: TObject);
begin 
   edtdataini.Date          := date;
   edtdatafin.Date          := date;
   CheckTipo.Checked        := true;
   CheckTipoClick(sender);
   CheckFor.Checked     := true;
   CheckForClick(sender);
end;

procedure TFrmRelOutrasEntradas.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelOutrasEntradas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelOutrasEntradas.BtnVisClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRelOE do
      begin 
         close;
         sql.Clear;
         sql.Add('SELECT SUM(QUANT_ITEM) QUANT, O.COD_ES, I.COD_PRO, P.NOME_PRO, T.NOME_ES ' +
                 'FROM ITENS_OUTRAS_ENTRADAS I ' +
                 'INNER JOIN PRODUTO P ' +
                 'ON (I.COD_PRO = P.COD_PRO) ' +
                 'INNER JOIN OUTRAS_ENTRADAS O ' +
                 'ON (I.COD_OUTRA = O.COD_OUTRA) ' +
                 'INNER JOIN TIPO_ES T ' +
                 'ON (O.COD_ES = T.COD_ES)');
         sql.Add(' WHERE O.DATA_OUTRA BETWEEN :DATAINI AND :DATAFIN');
         if not CheckTipo.Checked then
            sql.Add(' AND O.COD_ES = ' + EdtCodTipo.Text);
         if not CheckFor.Checked then
            sql.Add(' AND O.COD_FOR = ' + EdtCodFor.Text);
         if (not CheckEmp.Checked) then
            begin 
               sql.Add(' AND O.COD_EMP = :CODEMP');
               Parambyname('codemp').AsInteger:= iEmp;
            end;
         sql.add(' GROUP BY O.COD_ES, I.COD_PRO, P.NOME_PRO, T.NOME_ES');
         sql.Add(' ORDER BY O.COD_ES, P.NOME_PRO');
         Parambyname('dataini').AsDate  := edtdataini.Date;
         Parambyname('datafin').AsDate  := edtdatafin.Date;
         open;
      end;
   Application.CreateForm(TFrmQRelOutrasEntradas, FrmQRelOutrasEntradas);
   FrmQRelOutrasEntradas.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
   FrmQRelOutrasEntradas.QRLTitulo.Caption := 'Relatório de Outras Entradas no Período: ' +
   datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
   if not CheckFor.Checked then
      FrmQRelOutrasEntradas.QRLFor.Caption:= 'Fornecedor: ' + EdtNomeFor.Text
   else
      FrmQRelOutrasEntradas.QRLFor.Caption:= '';
   if sender = btnvis then
      begin 
         FrmQRelOutrasEntradas.QROE.PreviewInitialState:= wsMaximized;
         FrmQRelOutrasEntradas.QROE.Preview;
      end
   else
      begin 
         FrmQRelOutrasEntradas.QROE.PrinterSetup;
         FrmQRelOutrasEntradas.QROE.Print;
      end;
   FrmQRelOutrasEntradas.QROE.QRPrinter:= nil;
   dm.IBTransaction.Commit;
   QRelOE.Close;
end;

end.
