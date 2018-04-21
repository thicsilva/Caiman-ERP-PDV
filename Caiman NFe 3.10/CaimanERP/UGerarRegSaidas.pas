unit UGerarRegSaidas;

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
  TFrmGerarRegSaidas = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    BtnGerar: TBitBtn;
    BtnSair: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    QCons: TFDQuery;
    QConsNUM_MIN: TIntegerField;
    QConsNUM_MAX: TIntegerField;
    QInsItensLivro: TFDQuery;
    QInsRegistro: TFDQuery;
    QInsRegistroCODREG: TIntegerField;
    QConsDATA_VEN: TDateField;
    QTotal: TFDQuery;
    QTotalTOTAL: TBCDField;
    QItensLivro: TFDQuery;
    QItensLivroCFOP_VENDAS_CF_EST: TIntegerField;
    QItensLivroALIQUOTA_GRP: TBCDField;
    QItensLivroICMS_SERVICO_GRP: TStringField;
    QItensLivroTIPO_GRP: TStringField;
    QItensLivroVALOR: TFloatField;
    QItensLivroCST_CF_EST: TStringField;
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnGerarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGerarRegSaidas: TFrmGerarRegSaidas;

implementation
uses
  Udm, Ubibli1, UNovoPrincipal;

{$R *.dfm}

procedure TFrmGerarRegSaidas.FormShow(Sender: TObject);
begin 
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;
   EdtDataIni.SetFocus;
end;

procedure TFrmGerarRegSaidas.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmGerarRegSaidas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmGerarRegSaidas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmGerarRegSaidas.BtnGerarClick(Sender: TObject);
var sCNPJ, sInsc, sUF : string;
    iAuxCodigo : integer;
    cTotalDia : currency;
    iOrdem    : integer;
begin 
   cTotalDia:= 0;
   iOrdem   := 0;

   {BUSCA OS DADOS DA EMPRESA}
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QConsulta do
      begin 
         sql.Clear;
         sql.add('SELECT CNPJ_EMP, INSC_EMP, EST_EMP ' +
                 'FROM EMPRESA ' +
                 'WHERE COD_EMP = :CODEMP');
         Parambyname('codemp').AsInteger:= iEmp;
         Open;
         sCNPJ:= fieldbyname('cnpj_emp').AsString;
         sInsc:= fieldbyname('insc_emp').AsString;
         sUF  := fieldbyname('est_emp').AsString;
      end;
   dm.IBTransaction.Commit;
   dm.QConsulta.Close;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QCons do
      begin 
         close;
         Parambyname('dataini').AsDate   := EdtDataIni.Date;
         Parambyname('datafin').AsDate   := EdtDataFin.Date;
         Parambyname('codemp').AsInteger := iEmp;
         Open;
         while not eof do
            begin 
               cTotalDia:= 0;
               
               { busca o total do dia - nao soma as canceladas }
               if dm.IBTRAux.Active then
                  dm.IBTRAux.Commit;
               dm.IBTRAux.StartTransaction;
               QTotal.Close;
               QTotal.ParamByName('data').AsDate      := QConsDATA_VEN.AsDateTime;
               QTotal.ParamByName('codemp').AsInteger := iEmp;
               QTotal.Open;
               cTotalDia:= QTotalTOTAL.AsCurrency;

               dm.IBTRAux.Commit;
               QTotal.Close;

               if dm.IBTRAux.Active then
                  dm.IBTRAux.Commit;
               dm.IBTRAux.StartTransaction;
               try
                 try
                   { GRAVA O LIVRO DE SAIDA }
                   QInsRegistro.Close;
                   QInsRegistro.ParamByName('data').AsDate         := QConsDATA_VEN.AsDateTime;
                   QInsRegistro.ParamByName('cnpj').AsString       := trim(RetiraCaracter(sCNPJ));
                   QInsRegistro.ParamByName('codmodelo').AsString  := '02';
                   QInsRegistro.ParamByName('serie').AsString      := 'D';
                   QInsRegistro.ParamByName('numini').AsInteger    := QConsNUM_MIN.AsInteger;
                   QInsRegistro.ParamByName('numfin').AsInteger    := QConsNUM_MAX.AsInteger;
                   QInsRegistro.ParamByName('emitente').AsString   := 'P';
                   QInsRegistro.ParamByName('valor').AsCurrency    := cTotalDia;
                   QInsRegistro.ParamByName('situacao').AsString   := 'N';
                   QInsRegistro.ParamByName('codemp').AsInteger    := iEmp;
                   QInsRegistro.ParamByName('uf').AsString         := trim(sUF);
                   QInsRegistro.ParamByName('insc').AsString       := trim(sInsc);
                   QInsRegistro.ParamByName('codsaida').Value      := null;
                   QInsRegistro.ParamByName('codmapa').Value       := null;
                   QInsRegistro.Open;
                   iAuxCodigo:= QInsRegistroCODREG.AsInteger;

                   { GRAVA OS ITENS DO LIVRO DE SAIDA }
                   QItensLivro.Close;
                   QItensLivro.ParamByName('dataini').AsDate   := EdtDataIni.Date;
                   QItensLivro.ParamByName('datafin').AsDate   := EdtDataFin.Date;
                   QItensLivro.ParamByName('codemp').AsInteger := iEmp;
                   QItensLivro.Open;
                   while not QItensLivro.Eof do
                       begin 
                          inc(iOrdem);
                          QInsItensLivro.Close;
                          QInsItensLivro.parambyname('1').AsInteger  := iAuxCodigo;
                          QInsItensLivro.ParamByName('2').AsInteger  := iOrdem;
                          QInsItensLivro.Parambyname('3').AsInteger  := QItensLivroCFOP_VENDAS_CF_EST.AsInteger;
                          if trim(QItensLivroTIPO_GRP.AsString) = 'TRI' then
                             begin 
                               QInsItensLivro.parambyname('4').AsCurrency := QItensLivroVALOR.AsCurrency;
                               QInsItensLivro.Parambyname('5').AsCurrency := (QItensLivroVALOR.AsCurrency * QItensLivroALIQUOTA_GRP.AsCurrency) / 100;
                               QInsItensLivro.Parambyname('6').AsCurrency := 0;
                               QInsItensLivro.Parambyname('7').AsCurrency := 0;
                               QInsItensLivro.Parambyname('8').AsCurrency := QItensLivroALIQUOTA_GRP.AsCurrency;
                             end
                          else
                             if (trim(QItensLivroTIPO_GRP.AsString) = 'ISE') or (trim(QItensLivroTIPO_GRP.AsString) = 'NT') then
                                 begin 
                                    QInsItensLivro.parambyname('4').AsCurrency := 0;
                                    QInsItensLivro.Parambyname('5').AsCurrency := 0;
                                    QInsItensLivro.Parambyname('6').AsCurrency := QItensLivroVALOR.AsCurrency;
                                    QInsItensLivro.Parambyname('7').AsCurrency := 0;
                                    QInsItensLivro.Parambyname('8').AsCurrency := 0;
                                 end
                             else
                                if (trim(QItensLivroTIPO_GRP.AsString) = 'ST') then
                                   begin 
                                      QInsItensLivro.parambyname('4').AsCurrency := 0;
                                      QInsItensLivro.Parambyname('5').AsCurrency := 0;
                                      QInsItensLivro.Parambyname('6').AsCurrency := 0;
                                      QInsItensLivro.Parambyname('7').AsCurrency := QItensLivroVALOR.AsCurrency;
                                      QInsItensLivro.Parambyname('8').AsCurrency := 0;
                                   end;
                          QInsItensLivro.Parambyname('9').AsInteger  := iEmp;
                          QInsItensLivro.Parambyname('10').AsCurrency:= QItensLivroVALOR.AsCurrency;
                          QInsItensLivro.Parambyname('11').AsCurrency:= 0;
                          QInsItensLivro.Parambyname('12').AsCurrency:= 0;
                          QInsItensLivro.ParamByName('13').AsString  := QItensLivroCST_CF_EST.AsString;
                          QInsItensLivro.ExecOrOpen;

                          QItensLivro.Next;
                       end;

                   dm.IBTRAux.Commit;
                 except
                   dm.IBTRAux.Rollback;
                   AlertaCad('Erro ao gerar o lançamento');
                 end;
               finally
                   QInsItensLivro.Close;
                   QInsRegistro.Close;
                   QItensLivro.Close;
               end;
               next;
            end;
      end;
   dm.IBTransaction.Commit;
   AlertaCad('Processo Concluído');
end;

end.

