unit UApuracaoPisCofins;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmApuracaoPisCofins = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    Panel1: TPanel;
    GBPeriodo: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    QRel: TFDQuery;
    QRelISENTAS_ENTRADAS: TBCDField;
    QRelISENTAS_VENDAS: TBCDField;
    QRelTRIBUTADA_ENTRADAS: TBCDField;
    QRelTRIBUTADA_VENDAS: TBCDField;
    QRelTRIBUTADO_FRETE: TBCDField;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmApuracaoPisCofins: TFrmApuracaoPisCofins;

implementation

uses
  UDM, UQRelApuracaoPisCofins, UNovoPrincipal;
var  cPis, cCofins : currency;

{$R *.dfm}

procedure TFrmApuracaoPisCofins.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmApuracaoPisCofins.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmApuracaoPisCofins.FormShow(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.Text:= 'SELECT ALIQUOTA_PIS, ALIQUOTA_COFINS ' +
                        'FROM PARAMETROS WHERE COD_EMP = :CODEMP';
             Parambyname('codemp').AsInteger:= iEmp;
             Open;
             cPis    := fieldbyname('aliquota_pis').AsCurrency;
             cCofins := fieldbyname('aliquota_cofins').AsCurrency;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar os parametros');
     end;
   finally
     dm.QConsulta.Close;
   end;

   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;
   EdtDataIni.SetFocus;
end;

procedure TFrmApuracaoPisCofins.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmApuracaoPisCofins.BtnVisClick(Sender: TObject);
var cPisEntradas, cCofinsEntradas : currency;
    cPisSaidas, cCofinsSaidas, cPisFrete, cCofinsFrete : currency;
begin 
   cPisEntradas    := 0;
   cPisSaidas      := 0;
   cCofinsEntradas := 0;
   cCofinsSaidas   := 0;
   cPisFrete       := 0;
   cCofinsFrete    := 0;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRel do
      begin 
         close;
         Parambyname('dataini').AsDate    := EdtDataIni.Date;
         Parambyname('datafin').AsDate    := EdtDataFin.Date;
         Parambyname('codemp').AsInteger  := iEmp;
         Open;
      end;

   Application.CreateForm(TFrmQRelApuracaoPisCofins, FrmQRelApuracaoPisCofins);

   FrmQRelApuracaoPisCofins.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
   FrmQRelApuracaoPisCofins.QRLTitulo.Caption:= 'Apuração do PIS/COFINS no período: ' + datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);

   FrmQRelApuracaoPisCofins.QRLIsentasEntrada.Caption:= 'R$ ' + CurrToStrF(QRelISENTAS_ENTRADAS.AsCurrency, ffnumber, 2);
   FrmQRelApuracaoPisCofins.QRLNormalEntradas.Caption:= 'R$ ' + CurrToStrF(QRelTRIBUTADA_ENTRADAS.AsCurrency, ffnumber, 2);
   cPisEntradas:= (QRelTRIBUTADA_ENTRADAS.AsCurrency * cPis) / 100;
   FrmQRelApuracaoPisCofins.QRLPisEntradas.Caption:= 'R$ ' + CurrToStrF(cPisEntradas, ffnumber, 2);
   cCofinsEntradas:= (QRelTRIBUTADA_ENTRADAS.AsCurrency * cCofins) / 100;
   FrmQRelApuracaoPisCofins.QRLCofinsEntradas.Caption:= 'R$ ' + CurrToStrF(cCofinsEntradas, ffnumber, 2);

   cPisFrete     := (QRelTRIBUTADO_FRETE.AsCurrency * cPis) / 100;
   cCofinsFrete  := (QRelTRIBUTADO_FRETE.AsCurrency * cCofins) / 100;
   FrmQRelApuracaoPisCofins.QRLFrete.Caption       := 'R$ ' + CurrToStrF(QRelTRIBUTADO_FRETE.AsCurrency, ffnumber, 2);
   FrmQRelApuracaoPisCofins.QRLPisFrete.Caption    := 'R$ ' + CurrToStrF(cPisFrete,   ffnumber, 2);
   FrmQRelApuracaoPisCofins.QRLCofinsFrete.Caption := 'R$ ' + CurrToStrF(cCofinsFrete, ffnumber, 2);

   FrmQRelApuracaoPisCofins.QRLIsentasSaidas.Caption:= 'R$ ' + currtostrf(QRelISENTAS_VENDAS.AsCurrency, ffnumber,  2);
   FrmQRelApuracaoPisCofins.QRLNormalSaidas.Caption := 'R$ ' + currtostrf(QRelTRIBUTADA_VENDAS.AsCurrency, ffnumber, 2);
   cPisSaidas:= ((QRelTRIBUTADA_VENDAS.AsCurrency) * cPis) / 100;
   FrmQRelApuracaoPisCofins.QRLPisSaidas.Caption:= 'R$ ' + CurrToStrF(cPisSaidas, ffnumber, 2);
   cCofinsSaidas:= ((QRelTRIBUTADA_VENDAS.AsCurrency) * cCofins) / 100;
   FrmQRelApuracaoPisCofins.QRLCofinsSaidas.Caption:= 'R$ ' + CurrToStrF(cCofinsSaidas, ffnumber, 2);

   FrmQRelApuracaoPisCofins.QRLPis.Caption    := 'R$ ' + CurrToStrF(cPisSaidas - cPisEntradas - cPisFrete, ffnumber, 2);
   FrmQRelApuracaoPisCofins.QRLCofins.Caption := 'R$ ' + CurrToStrF(cCofinsSaidas - cCofinsEntradas - cCofinsFrete, ffnumber, 2);


   if sender = btnvis then
      begin 
         FrmQRelApuracaoPisCofins.QRApuracao.PreviewInitialState:= wsMaximized;
         FrmQRelApuracaoPisCofins.QRApuracao.Preview;
      end
   else
      begin 
         FrmQRelApuracaoPisCofins.QRApuracao.PrinterSetup;
         FrmQRelApuracaoPisCofins.QRApuracao.Print;
      end;
   FrmQRelApuracaoPisCofins.QRApuracao.QRPrinter:= nil;

   dm.IBTransaction.Commit;
   QRel.Close;
end;

end.
