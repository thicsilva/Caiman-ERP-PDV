unit UMapaResumo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Mask, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, ComCtrls, DB, 
  rxToolEdit, rxCurrEdit, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmMapaResumo = class(UNovoFormulario.TForm)
    Panel4: TPanel;
    Panel6: TPanel;
    DBGrid1: TDBGrid;
    BtnInc: TBitBtn;
    BtnAlt: TBitBtn;
    BtnExc: TBitBtn;
    Panel5: TPanel;
    Label3: TLabel;
    Label6: TLabel;
    Label21: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label22: TLabel;
    Label7: TLabel;
    EdtCheck: UNovosComponentes.TEdit;
    EdtCOOIni: UNovosComponentes.TEdit;
    EdtCRZ: UNovosComponentes.TEdit;
    EdtGTIni: TCurrencyEdit;
    EdtGTFin: TCurrencyEdit;
    EdtContCanc: UNovosComponentes.TEdit;
    EdtCOOFin: UNovosComponentes.TEdit;
    Panel3: TPanel;
    Label5: TLabel;
    EdtDataMovimento: TMaskEdit;
    BtnOK: TBitBtn;
    BtnGravar: TBitBtn;
    BtnVoltar: TBitBtn;
    StatusBar1: TStatusBar;
    IBSQLMapa: TFDQuery;
    IBTRMapa: TFDTransaction;
    QMapa: TFDQuery;
    DSQMapa: TDataSource;
    Label1: TLabel;
    EdtNumSerie: TEdit;
    BtnSair: TBitBtn;
    Label2: TLabel;
    EdtCRO: UNovosComponentes.TEdit;
    GroupBox2: TGroupBox;
    Label23: TLabel;
    Label26: TLabel;
    LTotalDia: TLabel;
    LTotalDigitado: TLabel;
    Label27: TLabel;
    LDiferenca: TLabel;
    Label28: TLabel;
    EdtDataEmissao: TMaskEdit;
    Label29: TLabel;
    Label30: TLabel;
    EdtHoraEmissao: TMaskEdit;
    PanelTotalizadores: TPanel;
    Label17: TLabel;
    EdtCodGrp: UNovosComponentes.TEdit;
    BtnConsGRP: TsSpeedButton;
    EdtNomeGrp: TEdit;
    Label18: TLabel;
    Label15: TLabel;
    EdtValor: TCurrencyEdit;
    DBGrid2: TDBGrid;
    BtnGravaItem: TBitBtn;
    BtnExcluiItem: TBitBtn;
    BtnNovo: TBitBtn;
    EdtCodigo: UNovosComponentes.TEdit;
    QItens: TFDQuery;
    QItensCODIGO: TIntegerField;
    QItensCOD_GRP: TIntegerField;
    QItensVALOR: TBCDField;
    QItensNOME_GRP: TStringField;
    DSItens: TDataSource;
    QinsMapa: TFDQuery;
    QinsMapaCODMAPA: TIntegerField;
    QItensICMS_SERVICO_GRP: TStringField;
    QItensTIPO_GRP: TStringField;
    QItensCOD_EMP: TIntegerField;
    QItensINDICE_R03: TStringField;
    QMapaCHECKOUT: TIntegerField;
    QMapaDATA: TDateField;
    QMapaCOO_INICIAL: TIntegerField;
    QMapaCOO_FINAL: TIntegerField;
    QMapaGT_INICIAL: TBCDField;
    QMapaGT_FINAL: TBCDField;
    QMapaCONT_REDUCAO: TIntegerField;
    QMapaCONT_CANCEL: TIntegerField;
    QMapaCONTADOR_REINICIO_OPERACAO: TIntegerField;
    QMapaCOD_EMP: TIntegerField;
    QMapaCODIGO: TIntegerField;
    QMapaDATA_EMISSAO: TDateField;
    QMapaHORA_EMISSAO: TTimeField;
    Label4: TLabel;
    QMapaCODIGO_PAF: TIntegerField;
    QMapaR01_NUMERO_SERIE: TStringField;
    procedure FormShow(Sender: TObject);
    procedure Limpa;
    procedure LimpaItens;
    procedure BtnVoltarClick(Sender: TObject);
    procedure BtnIncClick(Sender: TObject);
    procedure BtnAltClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnExcClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure EdtCheckExit(Sender: TObject);
    procedure EdtCROEnter(Sender: TObject);
    procedure EdtCheckEnter(Sender: TObject);
    procedure EdtCOOIniEnter(Sender: TObject);
    procedure EdtCOOFinEnter(Sender: TObject);
    procedure EdtCRZEnter(Sender: TObject);
    procedure EdtContCancEnter(Sender: TObject);
    procedure BtnConsGRPClick(Sender: TObject);
    procedure EdtCodGrpKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodGrpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodGrpEnter(Sender: TObject);
    procedure EdtCodGrpExit(Sender: TObject);
    procedure BtnGravaItemClick(Sender: TObject);
    procedure BuscaItens;
    procedure BtnExcluiItemClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure EdtGTIniExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMapaResumo: TFrmMapaResumo;

implementation
uses
  Udm, Ubibli1, UConsGRP, UNovoPrincipal;
var  bGrava : boolean;

{$R *.dfm}

procedure TFrmMapaResumo.Limpa;
begin 
   EdtCodigo.Clear;
   EdtCheck.Clear;
   EdtCOOIni.Clear;
   EdtCOOFin.Clear;
   EdtGTIni.Clear;
   EdtGTFin.Clear;
   EdtCRZ.Clear;
   EdtContCanc.Text:= '0';
   EdtCRO.Clear;
   EdtNumSerie.Clear;
   EdtDataEmissao.Text:= EdtDataMovimento.Text;
   EdtHoraEmissao.Clear;

   LTotalDia.Caption      := '0,00';
   LTotalDigitado.Caption := '0,00';
   LDiferenca.Caption     := '0,00';
end;

procedure TFrmMapaResumo.FormShow(Sender: TObject);
begin 
   panel5.SendToBack;
   EdtDataMovimento.Text:= datetostr(date);
   EdtDataMovimento.SetFocus;
end;

procedure TFrmMapaResumo.BtnVoltarClick(Sender: TObject);
begin 
   panel5.SendToBack;
   btnok.Click;
end;

procedure TFrmMapaResumo.BtnIncClick(Sender: TObject);
begin 
   bGrava:= true;
   PanelTotalizadores.Enabled:= false;
   Limpa;
   Panel6.SendToBack;
   EdtCheck.SetFocus;
end;

procedure TFrmMapaResumo.BtnAltClick(Sender: TObject);
begin 
   bGrava:= false;
   limpa;

   EdtCodigo.Text            := QMapaCODIGO.AsString;
   EdtCheck.Text             := QMapaCHECKOUT.AsString;
   EdtNumSerie.Text          := QMapaR01_NUMERO_SERIE.AsString;
   EdtCOOIni.Text            := QMapaCOO_INICIAL.AsString;
   EdtCOOFin.Text            := QMapaCOO_FINAL.AsString;
   EdtGTIni.Text             := QMapaGT_INICIAL.AsString;
   EdtGTFin.Text             := QMapaGT_FINAL.AsString;
   EdtCRZ.Text               := QMapaCONT_REDUCAO.AsString;
   EdtContCanc.Text          := QMapaCONT_CANCEL.AsString;
   EdtCRO.Text               := QMapaCONTADOR_REINICIO_OPERACAO.AsString;
   EdtDataEmissao.Text       := QMapaDATA_EMISSAO.AsString;
   EdtHoraEmissao.Text       := QMapaHORA_EMISSAO.AsString;
   BuscaItens;

   panel6.SendToBack;
   EdtCheck.SetFocus;
end;

procedure TFrmMapaResumo.LimpaItens;
begin 
   EdtCodGrp.Clear;
   EdtNomeGrp.Clear;
   EdtValor.Clear;
end;

procedure TFrmMapaResumo.BtnOKClick(Sender: TObject);
begin 
   Panel5.SendToBack;
   if IBTRMapa.Active then
      IBTRMapa.Commit;
   IBTRMapa.StartTransaction;
   with QMapa do
      begin 
         close;
         Parambyname('data').Value   := strtodate(EdtDataMovimento.Text);
         Parambyname('codemp').Value := iEmp;
         open;
      end;
end;

procedure TFrmMapaResumo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if IBTRMapa.Active then
      IBTRMapa.Commit;
   QMapa.Close;
   QItens.Close;
   Action:= caFree;
end;

procedure TFrmMapaResumo.BtnGravarClick(Sender: TObject);
begin 
   if bGrava then
      begin 
         if IBTRMapa.Active then
            IBTRMapa.Commit;
         IBTRMapa.StartTransaction;
         try
           try
             with QinsMapa do
                begin 
                   close;
                   Parambyname('checkout').AsInteger     := strtoint(EdtCheck.Text);
                   Parambyname('data').AsDate            := strtodate(EdtDataMovimento.Text);
                   Parambyname('coo_inicial').AsInteger  := strtoint(EdtCOOIni.text);
                   Parambyname('coo_final').AsInteger    := strtoint(EdtCOOFin.text);
                   Parambyname('gt_inicial').AsCurrency  := strtocurr(EdtGTIni.text);
                   Parambyname('gt_final').AsCurrency    := strtocurr(EdtGTFin.Text);
                   Parambyname('crz').AsInteger          := strtoint(EdtCRZ.Text);
                   Parambyname('cont_cancel').AsInteger  := strtoint(EdtContCanc.Text);
                   Parambyname('cro').AsInteger          := strtoint(EdtCRO.text);
                   Parambyname('cod_emp').AsInteger      := iEmp;
                   Parambyname('data_emissao').AsDate    := strtodate(EdtDataEmissao.Text);
                   Parambyname('hora_emissao').AsTime    := strtotime(EdtHoraEmissao.Text);
                   open;
                   EdtCodigo.Text:= QinsMapaCODMAPA.AsString;
                end;
             IBTRMapa.Commit;
             PanelTotalizadores.Enabled:= true;
           except
             IBTRMapa.Rollback;
             AlertaCad('Erro ao gravar o Mapa Resumo');
           end;
         finally
           QinsMapa.close;
           BuscaItens;
         end;
      end
   else
      begin 
         if IBTRMapa.Active then
            IBTRMapa.Commit;
         IBTRMapa.StartTransaction;
         try
           try
             with IBSQLMapa do
                begin 
                   close;
                   sql.Clear;
                   sql.Text:= 'UPDATE MAPA_RESUMO SET CHECKOUT = :2, DATA = :3, COO_INICIAL = :4, COO_FINAL = :5,  ' +
                              'GT_INICIAL = :6, GT_FINAL = :7, CONT_REDUCAO = :8, CONT_CANCEL = :9,                ' +
                              'CONTADOR_REINICIO_OPERACAO = :10, COD_EMP = :11, DATA_EMISSAO = :12,                ' +
                              'HORA_EMISSAO = :13 WHERE CODIGO = :1';

                   Parambyname('2').AsInteger     := strtoint(EdtCheck.Text);
                   Parambyname('3').AsDate        := strtodate(EdtDataMovimento.Text);
                   Parambyname('4').AsInteger     := strtoint(EdtCOOIni.text);
                   Parambyname('5').AsInteger     := strtoint(EdtCOOFin.text);
                   Parambyname('6').AsCurrency    := strtocurr(EdtGTIni.text);
                   Parambyname('7').AsCurrency    := strtocurr(EdtGTFin.Text);
                   Parambyname('8').AsInteger     := strtoint(EdtCRZ.Text);
                   Parambyname('9').AsInteger     := strtoint(EdtContCanc.Text);
                   Parambyname('10').AsInteger    := strtoint(EdtCRO.text);
                   Parambyname('11').AsInteger    := iEmp;
                   Parambyname('12').AsDate       := strtodate(EdtDataEmissao.Text);
                   Parambyname('13').AsTime       := strtotime(EdtHoraEmissao.Text);
                   Parambyname('1').AsInteger     := strtoint(EdtCodigo.Text);
                   ExecOrOpen;
                end;
             IBTRMapa.Commit;
             PanelTotalizadores.Enabled:= true;
           except
             IBTRMapa.Rollback;
             AlertaCad('Erro ao gravar o Mapa Resumo');
           end;
         finally
           IBSQLMapa.close;
           BuscaItens;
         end;
      end;
   EdtCodGrp.SetFocus;
end;

procedure TFrmMapaResumo.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmMapaResumo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmMapaResumo.BtnExcClick(Sender: TObject);
var iCod : integer;
begin 
   iCod:= QMapaCHECKOUT.AsInteger;
   if Application.MessageBox('Confirma a Exclusão?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         if IBTRMapa.Active then
            IBTRMapa.Commit;
         IBTRMapa.StartTransaction;
         try
           try
             with IBSQLMapa do
                begin 
                   close;
                   sql.Clear;
                   sql.add('DELETE FROM MAPA_RESUMO WHERE ' +
                           'DATA = :1 AND CHECKOUT = :2 AND COD_EMP = :3');
                   Parambyname('1').AsDate   := strtodate(EdtDataMovimento.Text);;
                   Parambyname('2').AsInteger:= iCod;
                   Parambyname('3').AsInteger:= iEmp;
                   ExecOrOpen;
                end;
             IBTRMapa.Commit;
           except
              IBTRMapa.Rollback;
              AlertaCad('Erro ao excluir');
           end;
         finally
             IBSQLMapa.Close;
             btnok.Click;
         end;
      end;
end;

procedure TFrmMapaResumo.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmMapaResumo.EdtCheckExit(Sender: TObject);
var auxData : TDate;
begin 
   if (BtnSair.Focused) or (BtnVoltar.Focused) then
      exit;
   if bGrava then
      begin 
         { busca o numero de serie do checkout }
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         try
           try
             with dm.QConsulta do
                begin 
                   close;
                   sql.Clear;
                   sql.Add('SELECT COD_CAI, R01_NUMERO_SERIE ' +
                           'FROM CAIXA ' +
                           'WHERE COD_CAI = :1 AND COD_EMP = :2');
                   Parambyname('1').AsInteger:= strtoint(EdtCheck.Text);
                   Parambyname('2').AsInteger:= iEmp;
                   Open;
                   if fieldbyname('cod_cai').IsNull then
                      begin 
                         AlertaCad('Caixa não cadastrado');
//                         EdtCheck.SetFocus;
                      end
                   else
                      begin 
                         EdtNumSerie.Text:= trim(fieldbyname('R01_NUMERO_SERIE').AsString);
                      end;
                end;
             dm.IBTransaction.Commit;
           except
             dm.IBTransaction.Rollback;
             AlertaCad('erro ao buscar os dados do caixa');
           end;
         finally
           dm.QConsulta.Close;
         end;

         { BUSCA A DATA DA ÚLTIMA REDUÇÃO }
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         try
           try
             with dm.QConsulta do
                begin 
                   close;
                   sql.Clear;
                   sql.Add('SELECT MAX(DATA) DATA ' +
                           'FROM MAPA_RESUMO ' +
                           'WHERE CHECKOUT = :1 AND COD_EMP = :2 AND DATA < :3');
                   Parambyname('1').AsInteger:= strtoint(EdtCheck.Text);
                   Parambyname('2').AsInteger:= iEmp;
                   Parambyname('3').AsDate   := strtodate(EdtDataMovimento.Text);
                   Open;
                   if not fieldbyname('data').IsNull then
                      auxData:= fieldbyname('data').AsDateTime
                   else
                      auxData:= strtodate('01/01/1980');
                end;
             dm.IBTransaction.Commit;
           except
             dm.IBTransaction.Rollback;
             AlertaCad('Erro ao buscar a data da última redução');
           end;
         finally
           dm.QConsulta.Close;
         end;

         if auxData > strtodate('01/01/1980') then
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
                         sql.add('SELECT CONTADOR_REINICIO_OPERACAO, COO_FINAL, ' +
                                 'CONT_REDUCAO, GT_FINAL ' +
                                 'FROM MAPA_RESUMO ' +
                                 'WHERE CHECKOUT = :1 AND COD_EMP = :2 AND DATA = :3');
                         Parambyname('1').AsInteger := strtoint(EdtCheck.Text);
                         Parambyname('2').AsInteger := iEmp;
                         Parambyname('3').AsDate    := auxData;
                         Open;
                         EdtCRO.Text     := fieldbyname('contador_reinicio_operacao').AsString;
                         EdtCOOIni.Text  := inttostr(fieldbyname('coo_final').AsInteger + 1);
                         EdtCRZ.Text     := inttostr(fieldbyname('cont_reducao').AsInteger + 1);
                         EdtGTIni.Text   := fieldbyname('gt_final').AsString;
                      end;
                   dm.IBTransaction.Commit;
                 except
                   dm.IBTransaction.Rollback;
                   AlertaCad('Erro ao buscar os dados da última redução');
                 end;
               finally
                 dm.QConsulta.Close;
               end;
            end;
      end;
end;

procedure TFrmMapaResumo.EdtCROEnter(Sender: TObject);
begin 
   EdtCRO.SelectAll;
end;

procedure TFrmMapaResumo.EdtCheckEnter(Sender: TObject);
begin 
   EdtCheck.SelectAll;
end;

procedure TFrmMapaResumo.EdtCOOIniEnter(Sender: TObject);
begin 
   EdtCOOIni.SelectAll;
end;

procedure TFrmMapaResumo.EdtCOOFinEnter(Sender: TObject);
begin 
   EdtCOOFin.SelectAll;
end;

procedure TFrmMapaResumo.EdtCRZEnter(Sender: TObject);
begin 
   EdtCRZ.SelectAll;
end;

procedure TFrmMapaResumo.EdtContCancEnter(Sender: TObject);
begin 
   EdtContCanc.SelectAll;
end;

procedure TFrmMapaResumo.BtnConsGRPClick(Sender: TObject);
begin 
   application.CreateForm(TFrmConsGRP, FrmConsGRP);
   FrmConsGRP.Tag:= 16;
   FrmConsGRP.showmodal;
end;

procedure TFrmMapaResumo.EdtCodGrpKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmMapaResumo.EdtCodGrpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsGRP.Click;
end;

procedure TFrmMapaResumo.EdtCodGrpEnter(Sender: TObject);
begin 
   EdtCodGrp.SelectAll;
end;

procedure TFrmMapaResumo.EdtCodGrpExit(Sender: TObject);
begin 
   if (DBGrid2.Focused) or (BtnVoltar.Focused) or (EdtDataMovimento.Focused) then
      exit;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.Text:= 'SELECT COD_GRP, NOME_GRP, ECF ' +
                        'FROM GRUPO_ICMS ' +
                        'WHERE COD_GRP = :CODGRP AND ECF = ' + #39 + 'S' + #39;
             Parambyname('codgrp').AsInteger:= strtoint(EdtCodGrp.Text);
             open;
             if not fieldbyname('cod_grp').IsNull then
                begin 
                   if trim(fieldbyname('ecf').AsString) = 'S' then
                      begin 
                         EdtNomeGrp.Text:= fieldbyname('nome_grp').AsString;
                         EdtValor.SetFocus;
                      end
                   else
                      begin 
                         AlertaCad('Grupo não usado em ECF');
//                         EdtCodGrp.SetFocus;
                      end;
                end
             else
                begin 
                   AlertaCad('Grupo não Cadastrado');
//                   EdtCodGrp.SetFocus;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar o grupo');
     end;
   finally
     dm.QConsulta.close;
   end;
end;

procedure TFrmMapaResumo.BtnGravaItemClick(Sender: TObject);
var sR03 : string;
begin 
   if trim(EdtCodGrp.Text) = '' then
      begin 
         AlertaCad('Digite o código do grupo');
//         EdtCodGrp.SetFocus;
         exit;
      end;

   { busca o indice R03 }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.Text:= 'SELECT INDICE_R03 ' +
                        'FROM INDICE_ECF   ' +
                        'WHERE COD_CAI = :CODCAI AND COD_EMP = :CODEMP AND COD_GRP = :CODGRP';
             Parambyname('codcai').AsInteger := strtoint(EdtCheck.Text);
             Parambyname('codemp').AsInteger := iEmp;
             Parambyname('codgrp').AsInteger := StrToInt(EdtCodGrp.Text);
             open;
             sR03:= fieldbyname('indice_r03').AsString;
          end;
       dm.IBTransaction.Commit;
     except
       dm.QConsulta.Close;
     end;
   finally
     dm.QConsulta.Close;
   end;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.clear;
             sql.Text:= 'INSERT INTO ITENS_MAPA_RESUMO (CODIGO, COD_GRP, VALOR, COD_EMP, INDICE_R03) ' +
                        'VALUES(:CODIGO, :CODGRP, :VALOR, :CODEMP, :R03)';
             Parambyname('codigo').AsInteger  := strtoint(EdtCodigo.Text);
             Parambyname('codgrp').AsInteger  := strtoint(EdtCodGrp.Text);
             Parambyname('valor').AsCurrency  := strtocurr(EdtValor.Text);
             Parambyname('codemp').AsInteger  := iEmp;
             Parambyname('R03').AsString      := trim(sR03);
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao gravar');
     end;
   finally
     dm.QConsulta.Close;
     BuscaItens;
     LimpaItens;
     EdtCodGrp.SetFocus;
   end;
end;

procedure TFrmMapaResumo.BuscaItens;
var cVendaBruta, cTotalDigitado : currency;
begin 
   cVendaBruta    := 0;
   cTotalDigitado := 0;

   { Venda Bruta do Dia }
   cVendaBruta:= strtocurr(EdtGTFin.Text) - strtocurr(EdtGTIni.Text);

   if IBTRMapa.Active then
      IBTRMapa.Commit;
   IBTRMapa.StartTransaction;
   with QItens do
      begin 
         close;
         Parambyname('cod').AsInteger:= strtoint(EdtCodigo.Text);
         open;
         while not eof do
            begin 
               if trim(QItensTIPO_GRP.AsString) <> 'ONF' then
                  cTotalDigitado:= cTotalDigitado + QItensVALOR.AsCurrency;
               next;
            end;
      end;

   LTotalDia.Caption      := currtostrf(cVendaBruta, ffnumber, 2);
   LTotalDigitado.Caption := currtostrf(cTotalDigitado, ffnumber, 2);

   LDiferenca.Caption:= currtostrf(cTotalDigitado - cVendaBruta, ffnumber, 2);
   if (cTotalDigitado - cVendaBruta) < 0 then
      LDiferenca.Font.Color:= clRed
   else
      LDiferenca.Font.Color:= clNavy;
end;

procedure TFrmMapaResumo.BtnExcluiItemClick(Sender: TObject);
begin 
   if Application.MessageBox('Confirma a Exclusão do Item?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin 
        if dm.IBTransaction.Active then
           dm.IBTransaction.Commit;
        dm.IBTransaction.StartTransaction;
        try
          try
            with dm.QConsulta do
               begin 
                  close;
                  sql.clear;
                  sql.Text:= 'DELETE FROM ITENS_MAPA_RESUMO ' +
                             'WHERE CODIGO = :CODIGO AND COD_GRP = :CODGRP';
                  Parambyname('codigo').AsInteger  := strtoint(EdtCodigo.Text);
                  Parambyname('codgrp').AsInteger  := QItensCOD_GRP.AsInteger;
                  ExecOrOpen;
               end;
            dm.IBTransaction.Commit;
          except
            dm.IBTransaction.Rollback;
            AlertaCad('Erro ao excluir');
          end;
        finally
          dm.QConsulta.Close;
          BuscaItens;
        end;
     end;
end;

procedure TFrmMapaResumo.BtnNovoClick(Sender: TObject);
begin 
   bGrava:= true;
   limpa;
   limpaItens;
   PanelTotalizadores.Enabled:= false;
   if IBTRMapa.Active then
      IBTRMapa.Commit;
   QItens.Close;
   EdtCheck.SetFocus;
end;

procedure TFrmMapaResumo.EdtGTIniExit(Sender: TObject);
var cVendaBruta : currency;
begin 
   { Venda Bruta do Dia }
   cVendaBruta:= strtocurr(EdtGTFin.Text) - strtocurr(EdtGTIni.Text);
   LTotalDia.Caption:= currtostrf(cVendaBruta, ffnumber, 2);
end;

end.
