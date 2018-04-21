unit URepasseCheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, Mask, 
  RXDBCtrl, rxToolEdit, rxCurrEdit, UNovosComponentes, UNovoFormulario, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet, cxPC;

type
  TFrmRepasseCheque = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    Label1: TLabel;
    BtnOK: TBitBtn;
    BtnSair: TBitBtn;
    Panel3: TPanel;
    QConsCheque: TFDQuery;
    DSQConsCheque: TDataSource;
    QConsChequeCOD_CHE: TIntegerField;
    QConsChequeCOD_CLI: TIntegerField;
    QConsChequeAGENCIA_CHE: TStringField;
    QConsChequeCONTA_CHE: TStringField;
    QConsChequeNUMERO_CHE: TStringField;
    QConsChequeEMISSAO_CHE: TDateField;
    QConsChequeVENCTO_CHE: TDateField;
    QConsChequeVALOR_CHE: TBCDField;
    QConsChequePRIDEP_CHE: TDateField;
    QConsChequePRIDEV_CHE: TDateField;
    QConsChequeSEGDEP_CHE: TDateField;
    QConsChequeSEGDEV_CHE: TDateField;
    QConsChequeOBS_CHE: TStringField;
    QConsChequeNOME_CLI: TStringField;
    QConsChequeNOME_BAN: TStringField;
    QConsChequePAGTODEV_CHE: TDateField;
    QConsChequeCOD_EMP: TIntegerField;
    Label2: TLabel;
    EdtDestino: TEdit;
    Label3: TLabel;
    EdtTotal: TCurrencyEdit;
    Label4: TLabel;
    EdtDataRepasse: TDateTimePicker;
    BtnGrava: TBitBtn;
    Label5: TLabel;
    EdtCod: UNovosComponentes.TEdit;
    DBGrid1: TDBGrid;
    IBTRConsCheque: TFDTransaction;
    QRepassa: TFDQuery;
    IBTRRepassa: TFDTransaction;
    QConsChequeSELECIONADO_CHE: TStringField;
    CheckDev: TCheckBox;
    CheckEmp: TCheckBox;
    QConsChequeEMITENTE: TStringField;
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravaClick(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmRepasseCheque: TFrmRepasseCheque;

implementation
uses
  Udm, UQRelRepasseCheque, UNovoPrincipal, UComissoesVendedores, UPrincipal;
var iCodCheque : integer;
    sSql       : string;

{$R *.dfm}

function FrmRepasseCheque: TFrmRepasseCheque;
begin
   Result := TFrmRepasseCheque( BuscaFormulario( TFrmRepasseCheque, False  ) );
end;

procedure TFrmRepasseCheque.BtnOKClick(Sender: TObject);
var cValotTotal : currency;
begin
   cValotTotal:= 0;
   edtdestino.Clear;
   edtcod.Clear;
   if IBTRConsCheque.Active then
      IBTRConsCheque.Commit;
   IBTRConsCheque.StartTransaction;
   with QConsCheque do
      begin 
         close;
         sql.Clear;
         sql.Text:= sSql;
         if CheckDev.Checked then
            sql.Add(' WHERE ((CHE.VENCTO_CHE BETWEEN :DATAINI AND :DATAFIN AND CHE.PRIDEP_CHE IS NULL) ' +
                    ' OR (CHE.PRIDEV_CHE IS NOT NULL AND CHE.SEGDEP_CHE IS NULL))')
         else
            sql.Add(' WHERE CHE.VENCTO_CHE BETWEEN :DATAINI AND :DATAFIN AND CHE.PRIDEP_CHE IS NULL');
         if (not CheckEmp.Checked) then
            begin 
               sql.Add(' AND (CHE.COD_EMP = :CODEMP' + ')');
               Parambyname('codemp').AsInteger:= iEmp;
            end;

         SQL.Add(' ORDER BY CHE.VENCTO_CHE, CHE.COD_CHE');
         Parambyname('dataini').AsDate  := edtdataini.Date;
         Parambyname('datafin').AsDate  := edtdatafin.Date;
         Open;
         if recordcount > 0 then
            begin 
               DisableControls;
               First;
               while not eof do
                  begin 
                     if trim(QConsChequeSELECIONADO_CHE.AsString) = 'S' then
                        cValotTotal:= cValotTotal + QConsChequeVALOR_CHE.AsCurrency;
                     next;
                  end;
               First;
               EnableControls;
               panel3.Enabled := true;
               DBGrid1.SetFocus;
            end
         else
            begin 
               panel3.Enabled := false;
               edtdataini.SetFocus;
            end;
      end;
   EdtTotal.Text:= currtostr(cValotTotal);
   QConsCheque.Locate('COD_CHE', iCodCheque, []);
end;

procedure TFrmRepasseCheque.FormShow(Sender: TObject);
begin 
   sSql                := QConsCheque.SQL.Text;
   iCodCheque          := 0;
   panel3.Enabled      := false;
   edtdataini.Date     := date;
   edtdatafin.Date     := date;
   edtdatarepasse.Date := date;
   CheckDev.Checked    := true;
   EdtDestino.Clear;
   edttotal.Clear;
   edtdataini.SetFocus;
end;

procedure TFrmRepasseCheque.DBGrid1DblClick(Sender: TObject);
begin 
   iCodCheque:= QConsChequeCOD_CHE.AsInteger;
   if trim(QConsChequeSELECIONADO_CHE.AsString) = 'N' then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with dm.Consulta do
            begin 
               close;
               sql.Clear;
               sql.Add('UPDATE CHEQUE SET SELECIONADO_CHE = ' + #39 + 'S' + #39 +
                       ' WHERE COD_CHE = ' + QConsChequeCOD_CHE.AsString);
               ExecOrOpen;
            end;
         dm.IBTransaction.Commit;
         DM.Consulta.Close;
      end
   else
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with dm.Consulta do
            begin 
               close;
               sql.Clear;
               sql.Add('UPDATE CHEQUE SET SELECIONADO_CHE = ' + #39 + 'N' + #39 +
                       ' WHERE COD_CHE = ' + QConsChequeCOD_CHE.AsString);
               ExecOrOpen;
            end;
         dm.IBTransaction.Commit;
         DM.Consulta.Close;
      end;
   BtnOK.Click;
end;

procedure TFrmRepasseCheque.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin 
   if key = #13 then
      begin 
         key:= #0;
         DBGrid1DblClick(dbgrid1);
      end;
end;

procedure TFrmRepasseCheque.BtnSairClick(Sender: TObject);
begin 
   if Parent is TcxTabSheet then
      frmMenu.FTDI.CloseTabOfForm( TFormClass( Self.ClassType ) )
   else
      close;
end;

procedure TFrmRepasseCheque.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmRepasseCheque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRepasseCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if IBTRConsCheque.Active then
      IBTRConsCheque.Commit;
   QConsCheque.Close;
   Action:= caFree;
end;

procedure TFrmRepasseCheque.BtnGravaClick(Sender: TObject);
begin 
   if edtdestino.Text = '' then
      begin 
         AlertaCad('Digite o destino dos cheques');
//         edtdestino.SetFocus;
         exit;
      end;
   if Application.MessageBox('Confirma o Repasse dos Cheques?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         { BUSCA O CÓDIGO DO REPASSE }
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         try
           try
             with dm.Consulta do
                begin 
                   close;
                   sql.Clear;
                   sql.Add('SELECT MAX(COD_REPASSE) CODREPASSE FROM CHEQUE');
                   ExecOrOpen;
                   if FieldByName('codrepasse').IsNull then
                      EdtCod.Text:= '1'
                   else
                      EdtCod.Text:= inttostr(fieldbyname('codrepasse').AsInteger + 1);
                end;
             dm.IBTransaction.Commit;
           except
             dm.IBTransaction.Rollback;
             AlertaCad('Erro ao buscar o código do repasse');
           end;
         finally
           dm.Consulta.Close;
         end;

         { BAIXA  OS  CHEQUES }
         QConsCheque.DisableControls;
         QConsCheque.First;
         while not QConsCheque.Eof do
            begin 
               if trim(QConsChequeSELECIONADO_CHE.AsString) = 'S' then
                  begin 
                     if IBTRRepassa.Active then
                        IBTRRepassa.Commit;
                     IBTRRepassa.StartTransaction;
                     try
                       try
                         with QRepassa do
                            begin 
                               close;
                               sql.Clear;
                               if QConsChequePRIDEP_CHE.IsNull then
                                  sql.Add('UPDATE CHEQUE SET PRIDEP_CHE = :DATAREP, ' +
                                          'COD_REPASSE = :CODREPASSE, DESTINO_CHE = :DESTINOCHE ' +
                                          'WHERE COD_CHE = :CODCHE')
                               else
                                  if QConsChequeSEGDEP_CHE.IsNull then
                                     sql.Add('UPDATE CHEQUE SET SEGDEP_CHE = :DATAREP, ' +
                                             'COD_REPASSE = :CODREPASSE, DESTINO_CHE = :DESTINOCHE ' +
                                             'WHERE COD_CHE = :CODCHE');
                               Parambyname('datarep').AsDate      := EdtDataRepasse.Date;
                               Parambyname('destinoche').AsString := EdtDestino.Text;
                               Parambyname('codrepasse').AsInteger:= strtoint(EdtCod.Text);
                               Parambyname('codche').AsInteger    := QConsChequeCOD_CHE.Value;
                               ExecOrOpen;
                            end;
                         IBTRRepassa.Commit;
                       except
                         IBTRRepassa.Rollback;
                         AlertaCad('Erro ao Gravar o Repasse');
                       end;
                     finally
                       QRepassa.Close;
                     end;
                  end;
               QConsCheque.Next;
            end;
         QConsCheque.EnableControls;

         { IMPRIME O REPASSE }
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         with dm.QRelRepasse do
            begin 
               close;
               parambyname('codrepasse').AsInteger:= strtoint(EdtCod.Text);
               open;
            end;
         Application.CreateForm(TFrmQRelRepasseCheque, FrmQRelRepasseCheque);
         FrmQRelRepasseCheque.QRLTitulo.Caption := 'Repassados para: ' +
         EdtDestino.Text;
         FrmQRelRepasseCheque.QRLRepasse.Caption:= 'Repasse: ' +
         FormatFloat('000000', strtofloat(EdtCod.Text));
         FrmQRelRepasseCheque.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
         FrmQRelRepasseCheque.QRRepasse.PreviewInitialState:= wsMaximized;
         FrmQRelRepasseCheque.QRRepasse.Preview;
         FrmQRelRepasseCheque.QRRepasse.QRPrinter:= nil;
         dm.IBTransaction.Commit;
         dm.QRelRepasse.Close;
         BtnOK.click;
      end;
end;

procedure TFrmRepasseCheque.DBGrid1Enter(Sender: TObject);
begin 
   FrmRepasseCheque.KeyPreview:= false;
end;

procedure TFrmRepasseCheque.DBGrid1Exit(Sender: TObject);
begin 
   FrmRepasseCheque.KeyPreview:= true;
end;

procedure TFrmRepasseCheque.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin 
   If trim(QConsChequeSELECIONADO_CHE.AsString) = 'S' then
      begin 
         Dbgrid1.Canvas.Font.Color:= clRed; // cor
         DBGrid1.Canvas.Font.Style:= [fsBold];
      end
   else
      begin 
         Dbgrid1.Canvas.Font.Color:= clWindowText; // cor
         DBGrid1.Canvas.Font.Style:= [];
      end;
   Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
end;

end.
