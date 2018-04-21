unit UIsentasPisEntradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmIsentasPisEntradas = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    Rdg: TRadioGroup;
    QRelProd: TFDQuery;
    QRelProdNOME_PRO: TStringField;
    QRelProdNOME_SEC: TStringField;
    QRelSecao: TFDQuery;
    QRelSecaoNOME_SEC: TStringField;
    QRelProdTOTAL: TBCDField;
    QRelSecaoTOTAL: TBCDField;
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnVisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmIsentasPisEntradas: TFrmIsentasPisEntradas;

implementation
uses
  UQRelPisCofinsEntradasProduto, UNovoPrincipal, UDM, 
  UQRelPisCofinsEntradasSecao;
{$R *.dfm}

procedure TFrmIsentasPisEntradas.FormShow(Sender: TObject);
begin 
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;
   rdg.ItemIndex:= 1;
   EdtDataIni.SetFocus;
end;

procedure TFrmIsentasPisEntradas.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmIsentasPisEntradas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QRelSecao.Close;
   QRelProd.Close;
   Action:= caFree;
end;

procedure TFrmIsentasPisEntradas.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmIsentasPisEntradas.BtnVisClick(Sender: TObject);
begin 
   case rdg.ItemIndex of
     0: begin 
           with QRelProd do
              begin 
                 close;
                 Parambyname('dataini').AsDate   := EdtDataIni.Date;
                 Parambyname('datafin').AsDate   := EdtDataFin.Date;
                 Parambyname('codemp').AsInteger := iEmp;
                 Open;
              end;
           Application.CreateForm(TFrmQRelPisCofinsEntradasProduto, FrmQRelPisCofinsEntradasProduto);
           FrmQRelPisCofinsEntradasProduto.QRLNomeEmpresa.Caption := frmmenu.SB.Panels[3].Text;
           FrmQRelPisCofinsEntradasProduto.QRLTitulo.Caption      := 'Rel.de Produtos Isentos Pis/Cofins (Entradas) no Período: ' +
           datetostr(EdtDataIni.Date) + ' a ' + datetostr(edtdatafin.Date);
           if sender = btnvis then
              begin 
                 FrmQRelPisCofinsEntradasProduto.QRPisCofins.PreviewInitialState:= wsMaximized;
                 FrmQRelPisCofinsEntradasProduto.QRPisCofins.Preview;
              end
           else
              begin 
                 FrmQRelPisCofinsEntradasProduto.QRPisCofins.PrinterSetup;
                 FrmQRelPisCofinsEntradasProduto.QRPisCofins.Print;
              end;
           FrmQRelPisCofinsEntradasProduto.QRPisCofins.QRPrinter:= nil;
           dm.IBTransaction.Commit;
           QRelProd.close;
        end;
     1: begin 
           with QRelSecao do
              begin 
                 close;
                 Parambyname('dataini').AsDate   := EdtDataIni.Date;
                 Parambyname('datafin').AsDate   := EdtDataFin.Date;
                 Parambyname('codemp').AsInteger := iEmp;
                 Open;
              end;
           Application.CreateForm(TFrmQRelPisCofinsEntradasSecao, FrmQRelPisCofinsEntradasSecao);
           FrmQRelPisCofinsEntradasSecao.QRLNomeEmpresa.Caption := frmmenu.SB.Panels[3].Text;
           FrmQRelPisCofinsEntradasSecao.QRLTitulo.Caption      := 'Rel.Produtos Isentos Pis/Cofins (Entradas) no Período: ' +
           datetostr(EdtDataIni.Date) + ' a ' + datetostr(edtdatafin.Date);
           if sender = btnvis then
              begin 
                 FrmQRelPisCofinsEntradasSecao.QRPisCofins.PreviewInitialState:= wsMaximized;
                 FrmQRelPisCofinsEntradasSecao.QRPisCofins.Preview;
              end
           else
              begin 
                 FrmQRelPisCofinsEntradasSecao.QRPisCofins.PrinterSetup;
                 FrmQRelPisCofinsEntradasSecao.QRPisCofins.Print;
              end;
           FrmQRelPisCofinsEntradasSecao.QRPisCofins.QRPrinter:= nil;
           dm.IBTransaction.Commit;
           QRelSecao.close;
        end;
   end;
end;

end.
