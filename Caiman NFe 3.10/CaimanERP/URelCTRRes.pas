unit URelCTRRes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmRelAReceberRes = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    GB: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    RdgOrdem: TRadioGroup;
    Panel1: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    QRelCTR: TFDQuery;
    QRelCTRTOTAL: TBCDField;
    QRelCTRCOD_CLI: TIntegerField;
    QRelCTRNOME_CLI: TStringField;
    CheckEmp: TCheckBox;
    Rdg: TRadioGroup;
    EdtDias: UNovosComponentes.TEdit;
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RdgClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelAReceberRes: TFrmRelAReceberRes;

implementation
uses
  Udm, Ubibli1, UQRelCTRRes, UNovoPrincipal;

{$R *.dfm}

procedure TFrmRelAReceberRes.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelAReceberRes.FormShow(Sender: TObject);
begin 
   CheckEmp.Checked  := true;
   RdgOrdem.ItemIndex:= 0;
   Rdg.ItemIndex:= 0;
end;

procedure TFrmRelAReceberRes.BtnVisClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRelCTR do
     begin 
        close;
        sql.Clear;
        sql.Add('SELECT SUM(R.VALOR_CTR - R.DEVOLUCAO_CTR) TOTAL, R.COD_CLI, C.NOME_CLI ' +
                'FROM CONTAS_RECEBER R ' +
                'INNER JOIN CLIENTE C ' +
                'ON (R.COD_CLI = C.COD_CLI)');
        if rdg.ItemIndex = 0 then
           begin 
              sql.Add(' WHERE R.DTPAGTO_CTR IS NULL AND R.VENCTO_CTR BETWEEN :DATAINI AND :DATAFIN');
              Parambyname('dataini').AsDate:= edtdataini.Date;
              Parambyname('datafin').AsDate:= edtdatafin.Date;
           end
        else
           begin 
              sql.Add(' WHERE R.DTPAGTO_CTR IS NULL AND R.VENCTO_CTR <= :DATA');
              Parambyname('data').AsDate:= date - strtoint(EdtDias.Text);
           end;

        if (not CheckEmp.Checked) then
           begin 
              sql.Add(' AND R.COD_EMP = :CODEMP');
              Parambyname('codemp').AsInteger:= iEmp;
           end;

        sql.Add(' GROUP BY R.COD_CLI, C.NOME_CLI');
        if RdgOrdem.ItemIndex = 0 then
           sql.Add(' ORDER BY C.NOME_CLI')
        else
           sql.Add(' ORDER BY R.COD_CLI');
        open;
     end;
   Application.CreateForm(TFrmQRelCTRRes, FrmQRelCTRRes);
   FrmQRelCTRRes.QRLNomeEmpresa.Caption  := frmmenu.SB.Panels[3].Text;

   if rdg.ItemIndex = 0 then
      begin 
         FrmQRelCTRRes.QRTitulo.Caption:= 'Relatório de Contas à Receber no Período de ' +
         datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
      end
   else
      begin 
         FrmQRelCTRRes.QRTitulo.Caption:= 'Relatório de Contas à Receber com vencimento até ' +
         datetostr(date - strtoint(EdtDias.Text));
      end;

   if sender = btnvis then
      begin 
         FrmQRelCTRRes.QRRec.PreviewInitialState:= wsMaximized;
         FrmQRelCTRRes.QRRec.Preview;
      end
   else
      begin 
         FrmQRelCTRRes.QRRec.PrinterSetup;
         FrmQRelCTRRes.QRRec.Print;
      end;
   FrmQRelCTRRes.QRRec.QRPrinter:= nil;
   dm.IBTransaction.Commit;
   QRelCTR.Close;
end;

procedure TFrmRelAReceberRes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelAReceberRes.FormCreate(Sender: TObject);
begin 
   
end;

procedure TFrmRelAReceberRes.RdgClick(Sender: TObject);
begin 
   if rdg.ItemIndex = 0 then
      begin 
         EdtDias.Visible   := false;
         EdtDataIni.Visible:= true;
         EdtDataFin.Visible:= true;
         EdtDataIni.Date   := date;
         EdtDataFin.Date   := date;
         Label1.Visible    := true;
         gb.Caption        := 'Período';
         EdtDataIni.SetFocus;
      end
   else
      begin 
         EdtDias.Visible   := true;
         EdtDataIni.Visible:= false;
         EdtDataFin.Visible:= false;
         Label1.Visible    := false;
         gb.Caption        := 'Dias';
         EdtDias.Clear;
         EdtDias.SetFocus;
      end;
end;

end.
