unit URelEntradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmRelEntradas = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    CheckEmp: TCheckBox;
    GB3: TGroupBox;
    BtnConsFor: TsSpeedButton;
    EdtCodFor: UNovosComponentes.TEdit;
    EdtNomeFor: TEdit;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    GroupBox1: TGroupBox;
    ComboCons: TComboBox;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    CheckFor: TCheckBox;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    QRelNota: TFDQuery;
    QRelNotaCOD_EMP: TIntegerField;
    QRelNotaDATAEMI_ENT: TDateField;
    QRelNotaDATAENT_ENT: TDateField;
    QRelNotaTOTAL_ENT: TBCDField;
    QRelNotaNUMNF_ENT: TStringField;
    QRelNotaRAZAO_FOR: TStringField;
    QRelNotaTIPO_ENT: TStringField;
    RdgTipo: TRadioGroup;
    QRelItens: TFDQuery;
    QRelItensCOD_PRO: TIntegerField;
    QRelItensCUSTO: TBCDField;
    QRelItensQTD_PRO: TBCDField;
    QRelItensDATAENT_ENT: TDateField;
    QRelItensNUMNF_ENT: TStringField;
    QRelItensRAZAO_FOR: TStringField;
    QRelItensNOME_PRO: TStringField;
    QRelItensDATAEMI_ENT: TDateField;
    RDG: TRadioGroup;
    QRelNotaCOD_ENT: TIntegerField;
    QRelAgrupadaICMS: TFDQuery;
    QRelAgrupadaICMSTOTAL: TBCDField;
    QRelAgrupadaICMSNOME_GRP: TStringField;
    QRelDuplicatas: TFDQuery;
    QRelDuplicatasCOD_ENT: TIntegerField;
    QRelDuplicatasCOD_EMP: TIntegerField;
    QRelDuplicatasDATAEMI_ENT: TDateField;
    QRelDuplicatasDATAENT_ENT: TDateField;
    QRelDuplicatasTOTAL_ENT: TBCDField;
    QRelDuplicatasNUMNF_ENT: TStringField;
    QRelDuplicatasTIPO_ENT: TStringField;
    QRelDuplicatasRAZAO_FOR: TStringField;
    QRelDuplicatasTIPO_DOC_CTP: TStringField;
    QRelDuplicatasNUM_DOC_CTP: TStringField;
    QRelDuplicatasVALOR_CTP: TBCDField;
    QRelDuplicatasDTVENCTO_CTP: TDateField;
    QRelDuplicatasDTPAGTO_CTP: TDateField;
    procedure CheckForClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtCodForKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodForExit(Sender: TObject);
    procedure EdtCodForKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsForClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisClick(Sender: TObject);
    procedure EdtCodForEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelEntradas: TFrmRelEntradas;

implementation
uses
  Udm, Ubibli1, UConsFor, UQRelEntradas, UQRelItensEntradas, UNovoPrincipal, 
  UQRelEntradasGrupoICMS, UQRelDuplicatasEntradas;

{$R *.dfm}

procedure TFrmRelEntradas.CheckForClick(Sender: TObject);
begin 
   if CheckFor.Checked then
      begin 
         EdtCodFor.Clear;
         EdtNomeFor.Clear;
         gb3.Enabled:= false;
      end
   else
      begin 
         gb3.Enabled:= true;
         edtcodfor.clear;
         edtnomefor.clear;
         edtcodfor.SetFocus;
      end;
end;

procedure TFrmRelEntradas.FormShow(Sender: TObject);
begin 
   rdg.ItemIndex       := 0;
   RdgTipo.ItemIndex   := 2;
   ComboCons.ItemIndex := 0;
   edtdataini.Date     := date;
   edtdatafin.Date     := date;
   CheckFor.Checked    := true;
   CheckForClick(sender);
end;

procedure TFrmRelEntradas.EdtCodForKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmRelEntradas.EdtCodForExit(Sender: TObject);
begin 
   if (combocons.Focused) or (btnsair.Focused) or (CheckFor.Focused) then
      exit;
   EdtNomeFor.Text:= consulta('fornecedor', edtcodfor, 'cod_for', 'razao_for', dm.IBTransaction, dm.qConsulta);
   if edtnomefor.Text = '' then
      begin 
         AlertaCad('Fornecedor não Cadastrado');
//         edtcodfor.SetFocus;
         edtcodfor.SelectAll;
      end;
end;

procedure TFrmRelEntradas.EdtCodForKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsForClick(sender);
end;

procedure TFrmRelEntradas.BtnConsForClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsFor, FrmConsFor);
   FrmConsFor.tag:= 8;
   FrmConsFor.showmodal;
end;

procedure TFrmRelEntradas.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelEntradas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      btnsair.Click;
end;

procedure TFrmRelEntradas.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmRelEntradas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelEntradas.BtnVisClick(Sender: TObject);
begin 
   case RDG.ItemIndex of
     0:begin 
          if dm.IBTransaction.Active then
             dm.IBTransaction.Commit;
          dm.IBTransaction.StartTransaction;
          with QRelNota do
             begin 
                close;
                sql.Clear;
                sql.Add('SELECT E.COD_ENT, E.COD_EMP, E.DATAEMI_ENT, ' +
                        'E.DATAENT_ENT, E.TOTAL_ENT, E.NUMNF_ENT, E.TIPO_ENT, F.RAZAO_FOR ' +
                        'FROM ENTRADAS E ' +
                        'INNER JOIN FORNECEDOR F ' +
                        'ON (E.COD_FOR = F.COD_FOR)');

                if ComboCons.ItemIndex = 0 then
                   sql.Add(' WHERE E.DATAEMI_ENT BETWEEN :DATAINI AND :DATAFIN')
                else
                   sql.Add(' WHERE E.DATAENT_ENT BETWEEN :DATAINI AND :DATAFIN');

                if trim(EdtCodFor.Text) <> '' then
                   begin 
                      sql.Add(' AND E.COD_FOR = :CODFOR ');
                      parambyname('codfor').AsInteger:= strtoint(EdtCodFor.Text);
                   end;

                case RdgTipo.ItemIndex of
                  0: sql.Add(' AND E.TIPO_ENT = ' + #39 + 'V' + #39);
                  1: sql.Add(' AND E.TIPO_ENT = ' + #39 + 'P' + #39);
                end;

                if (not CheckEmp.Checked) then
                   begin 
                      sql.Add(' AND E.COD_EMP = :CODEMP');
                      Parambyname('codemp').AsInteger:= iEmp;
                   end;

                if ComboCons.ItemIndex = 0 then
                   sql.Add(' ORDER BY E.DATAEMI_ENT, E.COD_ENT')
                else
                   sql.Add(' ORDER BY E.DATAENT_ENT, E.COD_ENT');

                Parambyname('dataini').AsDate:= edtdataini.Date;
                Parambyname('datafin').AsDate:= edtdatafin.Date;
                open;
                Application.CreateForm(TFrmQRelEntradas, FrmQRelEntradas);
                FrmQRelEntradas.QRLNomeEmpresa.Caption := frmmenu.SB.Panels[3].Text;
                if ComboCons.ItemIndex = 0 then
                   FrmQRelEntradas.QRLTitulo.Caption:= 'Relatório de Entradas ' +
                   'por Data de Emissão no período: ' +
                   datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date)
                else
                   FrmQRelEntradas.QRLTitulo.Caption:= 'Relatório de Entradas ' +
                   'por Data de Entrada no período: ' +
                   datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
                if sender = btnvis then
                   begin 
                      FrmQRelEntradas.QREnt.PreviewInitialState:= wsMaximized;
                      FrmQRelEntradas.QREnt.Preview;
                   end
                else
                   begin 
                      FrmQRelEntradas.QREnt.PrinterSetup;
                      FrmQRelEntradas.QREnt.Print;
                   end;
                FrmQRelEntradas.QREnt.QRPrinter:= nil;
             end;
          dm.IBTransaction.Commit;
          QRelNota.close;
       end;
     1:begin 
          if dm.IBTransaction.Active then
             dm.IBTransaction.Commit;
          dm.IBTransaction.StartTransaction;
          with QRelItens do
             begin 
                close;
                sql.Clear;
                sql.Add('SELECT I.COD_PRO, I.CUSTO, I.QTD_PRO, E.DATAENT_ENT, ' +
                        'E.DATAEMI_ENT, E.NUMNF_ENT, F.RAZAO_FOR, P.NOME_PRO ' +
                        'FROM ITENS_ENTRADA I ' +
                        'INNER JOIN ENTRADAS E ' +
                        'ON (I.COD_ENT = E.COD_ENT) ' +
                        'INNER JOIN PRODUTO P ' +
                        'ON (I.COD_PRO = P.COD_PRO) ' +
                        'INNER JOIN FORNECEDOR F ' +
                        'ON (E.COD_FOR = F.COD_FOR)');

                if ComboCons.ItemIndex = 0 then
                   sql.Add(' WHERE E.DATAEMI_ENT BETWEEN :DATAINI AND :DATAFIN')
                else
                   sql.Add(' WHERE E.DATAENT_ENT BETWEEN :DATAINI AND :DATAFIN');

                if trim(EdtCodFor.Text) <> '' then
                   begin 
                      sql.Add(' AND E.COD_FOR = :CODFOR ');
                      parambyname('codfor').AsInteger:= strtoint(EdtCodFor.Text);
                   end;

                if (not CheckEmp.Checked) then
                   begin 
                      sql.Add(' AND E.COD_EMP = :CODEMP');
                      Parambyname('codemp').AsInteger:= iEmp;
                   end;

                case RdgTipo.ItemIndex of
                  0: sql.Add(' AND E.TIPO_ENT = ' + #39 + 'V' + #39);
                  1: sql.Add(' AND E.TIPO_ENT = ' + #39 + 'P' + #39);
                end;

                if ComboCons.ItemIndex = 0 then
                   sql.Add(' ORDER BY E.DATAEMI_ENT, I.COD_ENT')
                else
                   sql.Add(' ORDER BY E.DATAENT_ENT, I.COD_ENT');

                Parambyname('dataini').AsDate:= edtdataini.Date;
                Parambyname('datafin').AsDate:= edtdatafin.Date;
                open;
                Application.CreateForm(TFrmQRelItensEntradas, FrmQRelItensEntradas);
                FrmQRelItensEntradas.QRLNomeEmpresa.Caption := frmmenu.SB.Panels[3].Text;
                if ComboCons.ItemIndex = 0 then
                   begin 
                      FrmQRelItensEntradas.QRLTitulo.Caption:= 'Relatório dos Itens das Entradas ' +
                      'por Data de Emissão no período: ' +
                      datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
                      FrmQRelItensEntradas.QRLabel6.Caption:= 'Dt.Emissão';
                      FrmQRelItensEntradas.QRDBText4.DataField:= 'DATAEMI_ENT';
                   end
                else
                   begin 
                      FrmQRelItensEntradas.QRLTitulo.Caption:= 'Relatório dos Itens das Entradas ' +
                      'por Data de Entrada no período: ' +
                      datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
                      FrmQRelItensEntradas.QRLabel6.Caption:= 'Dt.Entrada';
                      FrmQRelItensEntradas.QRDBText4.DataField:= 'DATAENT_ENT';
                   end;
                if sender = btnvis then
                   begin 
                      FrmQRelItensEntradas.QREnt.PreviewInitialState:= wsMaximized;
                      FrmQRelItensEntradas.QREnt.Preview;
                   end
                else
                   begin 
                      FrmQRelItensEntradas.QREnt.PrinterSetup;
                      FrmQRelItensEntradas.QREnt.Print;
                   end;
                FrmQRelItensEntradas.QREnt.QRPrinter:= nil;
             end;
          dm.IBTransaction.Commit;
          QRelItens.close;
       end;
     2:begin 
          if dm.IBTransaction.Active then
             dm.IBTransaction.Commit;
          dm.IBTransaction.StartTransaction;
          with QRelAgrupadaICMS do
             begin 
                close;
                sql.Clear;
                sql.add('SELECT SUM(I.VALOR_TOTAL) TOTAL, G.NOME_GRP ' +
                        'FROM ITENS_ENTRADA I ' +
                        'INNER JOIN PRODUTO P ' +
                        'ON (I.COD_PRO = P.COD_PRO) ' +
                        'INNER JOIN ENTRADAS E      ' +
                        'ON (I.COD_ENT = E.COD_ENT) ' +
                        'INNER JOIN GRUPO_ICMS G    ' +
                        'ON (P.ICMS_CF_EST = G.COD_GRP) ' +
                        'WHERE E.DATAENT_ENT BETWEEN :DATAINI AND :DATAFIN');

                if trim(EdtCodFor.Text) <> '' then
                   begin 
                      sql.Add(' AND E.COD_FOR = :CODFOR ');
                      parambyname('codfor').AsInteger:= strtoint(EdtCodFor.Text);
                   end;

                if (not CheckEmp.Checked) then
                    begin 
                       sql.Add(' AND I.COD_EMP = :CODEMP');
                       Parambyname('codemp').AsInteger:= iEmp;
                    end;
                sql.Add(' GROUP BY P.ICMS_CF_EST, G.NOME_GRP');
                Parambyname('dataini').AsDate:= EdtDataIni.Date;
                Parambyname('datafin').AsDate:= EdtDataFin.Date;
                Open;
             end;
          Application.CreateForm(TFrmQRelEntradasGrupoICMS, FrmQRelEntradasGrupoICMS);
          FrmQRelEntradasGrupoICMS.QRLNomeEmpresa.Caption := frmmenu.SB.Panels[3].Text;
          FrmQRelEntradasGrupoICMS.QRLTitulo.Caption      := 'Relatório do Resumo das Entradas por Grupo de ICMS no Período: ' +
          datetostr(EdtDataIni.Date) + ' a ' + datetostr(edtdatafin.Date);
          if sender = btnvis then
             begin 
                FrmQRelEntradasGrupoICMS.QREntradas.PreviewInitialState:= wsMaximized;
                FrmQRelEntradasGrupoICMS.QREntradas.Preview;
             end
          else
             begin 
                FrmQRelEntradasGrupoICMS.QREntradas.PrinterSetup;
                FrmQRelEntradasGrupoICMS.QREntradas.Print;
             end;
          FrmQRelEntradasGrupoICMS.QREntradas.QRPrinter:= nil;
          dm.IBTransaction.Commit;
          QRelAgrupadaICMS.close;
       end;
     3:begin 
          if dm.IBTransaction.Active then
             dm.IBTransaction.Commit;
          dm.IBTransaction.StartTransaction;
          with QRelDuplicatas do
             begin 
                close;
                sql.Clear;
                sql.Add('SELECT E.COD_ENT, E.COD_EMP, E.DATAEMI_ENT,                       ' +
                        'E.DATAENT_ENT, E.TOTAL_ENT, E.NUMNF_ENT, E.TIPO_ENT, F.RAZAO_FOR, ' +
                        'P.TIPO_DOC_CTP, P.NUM_DOC_CTP, P.VALOR_CTP, P.DTVENCTO_CTP,       ' +
                        'P.DTPAGTO_CTP              ' +
                        'FROM ENTRADAS E            ' +
                        'INNER JOIN FORNECEDOR F    ' +
                        'ON (E.COD_FOR = F.COD_FOR) ' +
                        'LEFT JOIN CONTAS_PAGAR P   ' +
                        'ON (E.COD_ENT = P.COD_ENTRADA)');

                if ComboCons.ItemIndex = 0 then
                   sql.Add(' WHERE E.DATAEMI_ENT BETWEEN :DATAINI AND :DATAFIN')
                else
                   sql.Add(' WHERE E.DATAENT_ENT BETWEEN :DATAINI AND :DATAFIN');

                if trim(EdtCodFor.Text) <> '' then
                   begin 
                      sql.Add(' AND E.COD_FOR = :CODFOR ');
                      parambyname('codfor').AsInteger:= strtoint(EdtCodFor.Text);
                   end;

                case RdgTipo.ItemIndex of
                  0: sql.Add(' AND E.TIPO_ENT = ' + #39 + 'V' + #39);
                  1: sql.Add(' AND E.TIPO_ENT = ' + #39 + 'P' + #39);
                end;

                if (not CheckEmp.Checked) then
                   begin 
                      sql.Add(' AND E.COD_EMP = :CODEMP');
                      Parambyname('codemp').AsInteger:= iEmp;
                   end;

                if ComboCons.ItemIndex = 0 then
                   sql.Add(' ORDER BY E.DATAEMI_ENT, E.COD_ENT, P.DTVENCTO_CTP')
                else
                   sql.Add(' ORDER BY E.DATAENT_ENT, E.COD_ENT, P.DTVENCTO_CTP');

                Parambyname('dataini').AsDate:= edtdataini.Date;
                Parambyname('datafin').AsDate:= edtdatafin.Date;
                open;

                Application.CreateForm(TFrmQRelDuplicatasEntradas, FrmQRelDuplicatasEntradas);
                FrmQRelDuplicatasEntradas.QRLNomeEmpresa.Caption := frmmenu.SB.Panels[3].Text;
                if ComboCons.ItemIndex = 0 then
                   FrmQRelDuplicatasEntradas.QRLTitulo.Caption:= 'Relatório de Entradas ' +
                   'por Data de Emissão no período: ' +
                   datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date)
                else
                   FrmQRelDuplicatasEntradas.QRLTitulo.Caption:= 'Relatório de Entradas ' +
                   'por Data de Entrada no período: ' +
                   datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date);
                if sender = btnvis then
                   begin 
                      FrmQRelDuplicatasEntradas.QREnt.PreviewInitialState:= wsMaximized;
                      FrmQRelDuplicatasEntradas.QREnt.Preview;
                   end
                else
                   begin 
                      FrmQRelDuplicatasEntradas.QREnt.PrinterSetup;
                      FrmQRelDuplicatasEntradas.QREnt.Print;
                   end;
                FrmQRelDuplicatasEntradas.QREnt.QRPrinter:= nil;
             end;
          dm.IBTransaction.Commit;
          QRelDuplicatas.close;
       end;
   end;
end;

procedure TFrmRelEntradas.EdtCodForEnter(Sender: TObject);
begin 
   EdtCodFor.SelectAll;
end;

end.
