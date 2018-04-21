unit URelMapaResumo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, DB, RDprint, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmRelMapaResumo = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    QRelMapa: TFDQuery;
    Label2: TLabel;
    EdtResp: TEdit;
    Label3: TLabel;
    EdtFuncao: TEdit;
    EdtNumero: TEdit;
    EdtData: TDateTimePicker;
    Label1: TLabel;
    Label4: TLabel;
    RDprint: TRDprint;
    QRelMapaCHECKOUT: TIntegerField;
    QRelMapaDATA: TDateField;
    QRelMapaCOO_INICIAL: TIntegerField;
    QRelMapaCOO_FINAL: TIntegerField;
    QRelMapaGT_INICIAL: TBCDField;
    QRelMapaGT_FINAL: TBCDField;
    QRelMapaCONT_REDUCAO: TIntegerField;
    QRelMapaCONT_CANCEL: TIntegerField;
    QRelMapaCONTADOR_REINICIO_OPERACAO: TIntegerField;
    QRelMapaCOD_EMP: TIntegerField;
    QRelMapaCODIGO: TIntegerField;
    QRelMapaDATA_EMISSAO: TDateField;
    QRelMapaHORA_EMISSAO: TTimeField;
    QRelMapaCODIGO_PAF: TIntegerField;
    QItensMapa: TFDQuery;
    QItensMapaCODIGO: TIntegerField;
    QItensMapaCOD_GRP: TIntegerField;
    QItensMapaVALOR: TBCDField;
    QItensMapaCOD_EMP: TIntegerField;
    QItensMapaINDICE_R03: TStringField;
    QItensMapaCODIGO_LIVRO_FISCAL: TIntegerField;
    QItensMapaORDEM_LIVRO_FISCAL: TIntegerField;
    QItensMapaTIPO_GRP: TStringField;
    QItensMapaALIQUOTA_GRP: TBCDField;
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnImpClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RDprintNewPage(Sender: TObject; Pagina: Integer);
    procedure RDprintBeforeNewPage(Sender: TObject; Pagina: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelMapaResumo: TFrmRelMapaResumo;

implementation
uses
  Ubibli1, UDM, UNovoPrincipal;
var  iLinha, iLinhaPrincipal : integer;

{$R *.dfm}

procedure TFrmRelMapaResumo.FormShow(Sender: TObject);
begin 
   edtdata.date:= date;
   EdtNumero.Clear;
   EdtFuncao.Clear;
   EdtResp.Clear;
   edtdata.SetFocus;
end;

procedure TFrmRelMapaResumo.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelMapaResumo.BtnImpClick(Sender: TObject);
var cContabil, cMovimentoDia, cTotalMovDia, cTotalCancel,
    cTotalContabil, cTotalIsenta, cTotalSub,
    cTotalBase, cTotalImposto : currency;
begin 
   cContabil     := 0;
   cMovimentoDia := 0;
   cTotalMovDia  := 0;
   cTotalCancel  := 0;
   cTotalContabil:= 0;
   cTotalIsenta  := 0;
   cTotalSub     := 0;
   cTotalBase    := 0;
   cTotalImposto := 0;

   if Application.MessageBox('Confirma a Impressão?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         {==========================================================================}
         {================================ MAPA RESUMO =============================}
         {==========================================================================}
         RDprint.abrir;

         if dm.IBTRAux.Active then
            dm.IBTRAux.Commit;
         dm.IBTRAux.StartTransaction;
         QRelMapa.close;
         QRelMapa.Parambyname('data').AsDate:= edtdata.Date;
         QRelMapa.Parambyname('codemp').AsInteger:= iEmp;
         QRelMapa.open;

         while not QRelMapa.Eof do
            begin 
               iLinhaPrincipal:= iLinha;

               cMovimentoDia:= QRelMapaGT_FINAL.AsCurrency - QRelMapaGT_INICIAL.AsCurrency;
               cContabil    := cMovimentoDia;

               RDprint.imp(iLinhaPrincipal, 5,  FormataStringD(QRelMapaCHECKOUT.AsString,     '3', '0'));
               RDprint.Imp(iLinhaPrincipal, 11, FormataStringD(QRelMapaCOO_FINAL.AsString,    '6', '0'));
               RDprint.Imp(iLinhaPrincipal, 19, FormataStringD(QRelMapaCONT_REDUCAO.AsString, '6', '0'));
               RDprint.Imp(iLinhaPrincipal, 27, FormataStringD(QRelMapaCONT_CANCEL.AsString,  '6', '0'));
               RDprint.ImpVal(iLinhaPrincipal, 39, '#,##0.00', cMovimentoDia, []);

               { busca os itens do mapa resumo }
               if dm.IBTransaction.Active then
                  dm.IBTransaction.Commit;
               dm.IBTransaction.StartTransaction;
               with QItensMapa do
                  begin 
                     close;
                     parambyname('codigo').AsInteger:= QRelMapaCODIGO.AsInteger;
                     open;
                     while not eof do
                        begin 
                           if trim(QItensMapaTIPO_GRP.AsString) = 'TRI' then
                              begin 
                                 cTotalBase    := cTotalBase    + QItensMapaVALOR.AsCurrency;
                                 cTotalImposto := cTotalImposto + ((QItensMapaVALOR.AsCurrency * QItensMapaALIQUOTA_GRP.AsCurrency) / 100);

                                 RDprint.ImpVal(iLinha, 104, '#,##0.00', QItensMapaVALOR.AsCurrency, []);
                                 RDprint.Imp(iLinha, 114, CurrToStrF(QItensMapaALIQUOTA_GRP.AsCurrency, ffNumber, 2));
                                 RDprint.ImpVal(iLinha, 125, '#,##0.00', ((QItensMapaVALOR.AsCurrency * QItensMapaALIQUOTA_GRP.AsCurrency) / 100), []);
                                 inc(iLinha);
                              end
                           else
                           if trim(QItensMapaTIPO_GRP.AsString) = 'ISE' then
                              begin 
                                 cTotalIsenta:= cTotalIsenta + QItensMapaVALOR.AsCurrency;
                                 RDprint.ImpVal(iLinhaPrincipal, 76, '#,##0.00', QItensMapaVALOR.AsCurrency, []);
                              end
                           else
                           if trim(QItensMapaTIPO_GRP.AsString) = 'NT' then
                              begin 
                                 cTotalIsenta:= cTotalIsenta + QItensMapaVALOR.AsCurrency;
                                 RDprint.ImpVal(iLinhaPrincipal + 1, 76, '#,##0.00', QItensMapaVALOR.AsCurrency, []);
                              end
                           else
                           if trim(QItensMapaTIPO_GRP.AsString) = 'ST' then
                              begin 
                                 cTotalSub:= cTotalSub + QItensMapaVALOR.AsCurrency;
                                 RDprint.ImpVal(iLinhaPrincipal, 90, '#,##0.00', QItensMapaVALOR.AsCurrency, []);
                              end
                           else
                           if trim(QItensMapaTIPO_GRP.AsString) = 'CAN' then
                              begin 
                                 cContabil    := cContabil    - QItensMapaVALOR.AsCurrency;
                                 cTotalCancel := cTotalCancel + QItensMapaVALOR.AsCurrency;
                                 RDprint.ImpVal(iLinhaPrincipal, 50, '#,##0.00', QItensMapaVALOR.AsCurrency, []);
                              end
                           else
                           if trim(QItensMapaTIPO_GRP.AsString) = 'DES' then
                              begin 
                                 cContabil    := cContabil    - QItensMapaVALOR.AsCurrency;
                                 cTotalCancel := cTotalCancel + QItensMapaVALOR.AsCurrency;
                                 RDprint.ImpVal(iLinhaPrincipal + 1, 50, '#,##0.00', QItensMapaVALOR.AsCurrency, []);
                              end;

                           next;
                        end;
                  end;
               dm.IBTransaction.Commit;
               QItensMapa.Close;

               RDprint.ImpVal(iLinhaPrincipal, 65, '#,##0.00', cContabil, []);
               cTotalMovDia  := cTotalMovDia   + cMovimentoDia;
               cTotalContabil:= cTotalContabil + cContabil;
               inc(iLinha);
               QRelMapa.Next;
            end;
         dm.IBTRAux.Commit;
         QRelMapa.Close;

         { imprimindo os totais }
         RDprint.ImpVal(76, 38,  '#,##0.00', cTotalMovDia, []);
         RDprint.ImpVal(76, 50,  '#,##0.00', cTotalCancel, []);
         RDprint.ImpVal(76, 65,  '#,##0.00', cTotalContabil, []);
         RDprint.ImpVal(76, 76,  '#,##0.00', cTotalIsenta, []);
         RDprint.ImpVal(76, 90,  '#,##0.00', cTotalSub, []);
         RDprint.ImpVal(76, 104, '#,##0.00', cTotalBase, []);
         RDprint.ImpVal(76, 125, '#,##0.00', cTotalImposto, []);
         RDprint.Fechar;
      end;
end;

procedure TFrmRelMapaResumo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRelMapaResumo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;

   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;

   QRelMapa.Close;
   QItensMapa.Close;
   Action:= caFree;
end;

procedure TFrmRelMapaResumo.EdtNumeroKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmRelMapaResumo.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmRelMapaResumo.RDprintNewPage(Sender: TObject;
  Pagina: Integer);
begin 
   //CABEÇALHO
   RDprint.Imp(2, 79, FormataStringD(trim(EdtNumero.text), '6', '0'));
   RDprint.Imp(4, 79, datetostr(EdtData.Date));
   iLinha:= 9;
end;

procedure TFrmRelMapaResumo.RDprintBeforeNewPage(Sender: TObject;
  Pagina: Integer);
begin 
   RDprint.Imp(80, 65, trim(EdtResp.Text));
   RDprint.Imp(82, 61, trim(EdtFuncao.text));
end;

end.
