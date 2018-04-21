unit UGeraRegSaidasMapaResumo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, DB, UNovosComponentes, UNovoFormulario, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmGerarRegSaidasMapaResumo = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    QItensMapaResumo: TFDQuery;
    IBTRReg: TFDTransaction;
    QInsert: TFDQuery;
    QInsertCODREG: TIntegerField;
    QInsItensLivro: TFDQuery;
    QMapaResumo: TFDQuery;
    QMapaResumoCHECKOUT: TIntegerField;
    QMapaResumoDATA: TDateField;
    QMapaResumoCOO_INICIAL: TIntegerField;
    QMapaResumoCOO_FINAL: TIntegerField;
    QMapaResumoGT_INICIAL: TBCDField;
    QMapaResumoGT_FINAL: TBCDField;
    QMapaResumoCONT_REDUCAO: TIntegerField;
    QMapaResumoCONT_CANCEL: TIntegerField;
    QMapaResumoCONTADOR_REINICIO_OPERACAO: TIntegerField;
    QMapaResumoCOD_EMP: TIntegerField;
    QMapaResumoCODIGO: TIntegerField;
    QMapaResumoDATA_EMISSAO: TDateField;
    QMapaResumoHORA_EMISSAO: TTimeField;
    QMapaResumoCODIGO_PAF: TIntegerField;
    QItensMapaResumoCODIGO: TIntegerField;
    QItensMapaResumoCOD_GRP: TIntegerField;
    QItensMapaResumoVALOR: TBCDField;
    QItensMapaResumoCOD_EMP: TIntegerField;
    QItensMapaResumoINDICE_R03: TStringField;
    QItensMapaResumoALIQUOTA_GRP: TBCDField;
    QItensMapaResumoTIPO_GRP: TStringField;
    QTotalMapa: TFDQuery;                                        
    QTotalMapaTOTAL: TBCDField;
    QMapaResumoTRUNCAR_CAI: TStringField;
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure DeletaRegistros;
    procedure GeraRegistros;
    procedure GravaRegistro(const iCodigoMapa : integer; const cTotal : currency; const bTrunc : boolean);
    Procedure GravaItensRegistro(const iCodLivroSaida, iOrdem : integer; const bTrunc : boolean);
    function  TotalMapa(const iCodigoMapa : integer) : currency;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGerarRegSaidasMapaResumo: TFrmGerarRegSaidasMapaResumo;

implementation
uses
  Udm, UNovoPrincipal;

var sCNPJ, sInsc, sUF : string;

{$R *.dfm}

procedure TFrmGerarRegSaidasMapaResumo.Button2Click(Sender: TObject);
begin 
   close;
end;

procedure TFrmGerarRegSaidasMapaResumo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmGerarRegSaidasMapaResumo.FormShow(Sender: TObject);
begin 
   { busca os dados da empresa }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QConsulta do
      begin 
         close;
         sql.Clear;
         sql.Text:= 'SELECT CNPJ_EMP, INSC_EMP, EST_EMP ' +
                    'FROM EMPRESA ' +
                    'WHERE COD_EMP = :CODEMP';
         parambyname('codemp').AsInteger:= iEmp;
         open;
         sCNPJ:= fieldbyname('cnpj_emp').AsString;
         sInsc:= fieldbyname('insc_emp').AsString;
         sUF  := fieldbyname('est_emp').AsString;
      end;
   dm.IBTransaction.Commit;
   dm.QConsulta.Close;

   EdtDataIni.Date   := date;
   EdtDataFin.Date   := date;
   EdtDataIni.SetFocus;
end;

procedure TFrmGerarRegSaidasMapaResumo.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmGerarRegSaidasMapaResumo.DeletaRegistros;
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
             sql.Text:= 'DELETE FROM REGISTRO_LIVRO_SAIDAS ' +
                        'WHERE DATA BETWEEN :DATAINI AND :DATAFIN ' +
                        'AND CODIGO_EMPRESA = :CODEMP AND CODIFICACAO_FISCAL = ' + #39 + '18' + #39;
             Parambyname('dataini').AsDate   := EdtDataIni.Date;
             Parambyname('datafin').AsDate   := EdtDataFin.Date;
             Parambyname('codemp').AsInteger := iEmp;
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('erro ao excluir os registros');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmGerarRegSaidasMapaResumo.GeraRegistros;
var iAuxCodigoMapa : integer;
    cTotalMapa     : currency;
    bAuxTrunc      : boolean;
begin 
   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   dm.IBTRAux.StartTransaction;
   try
     try
       with QMapaResumo do
          begin 
             Parambyname('dataini').AsDate   := EdtDataIni.Date;
             Parambyname('datafin').AsDate   := EdtDataFin.Date;
             Parambyname('codemp').AsInteger := iEmp;
             open;
             while not eof do
                begin 
                   cTotalMapa:= TotalMapa(QMapaResumoCODIGO.AsInteger);

                   if cTotalMapa > 0 then
                      begin 
                         if trim(QMapaResumoTRUNCAR_CAI.AsString) = 'S' then
                            bAuxTrunc:= true
                         else
                            bAuxTrunc:= false;
                         GravaRegistro(QMapaResumoCODIGO.AsInteger, cTotalMapa, bAuxTrunc);
                      end;
                   next;
                end;
          end;
       dm.IBTRAux.Commit;
     except
       dm.IBTRAux.Rollback;
       AlertaCad('erro ao buscar os Mapas');
     end;
   finally
     QMapaResumo.Close;
   end;
end;

procedure TFrmGerarRegSaidasMapaResumo.Button1Click(Sender: TObject);
begin 
   if Application.MessageBox('Confirma a geração do Livro de Saída?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin 
        DeletaRegistros;
        GeraRegistros;
        AlertaCad('processo concluído');
     end;
end;

procedure TFrmGerarRegSaidasMapaResumo.GravaRegistro(const iCodigoMapa : integer; const cTotal : currency; const bTrunc : boolean);
var iCodLivroSaida : integer;
    iOrdem         : integer;
begin 
   if IBTRReg.Active then
      IBTRReg.Commit;
   IBTRReg.StartTransaction;
   try
     try
       with QInsert do
          begin 
             close;
             Params[0].AsDate       := QMapaResumoDATA.value;
             Params[1].AsString     := sCNPJ;
             Params[2].AsString     := '18';
             Params[3].Value        := null;
             Params[4].AsInteger    := QMapaResumoCOO_INICIAL.AsInteger;
             Params[5].AsString     := 'P';
             Params[6].AsCurrency   := cTotal;
             Params[7].AsString     := 'N';
             Params[8].AsInteger    := iEmp;
             Params[9].Value        := null;
             Params[10].AsString    := sUF;
             Params[11].AsString    := sInsc;
             Params[12].AsInteger   := QMapaResumoCOO_FINAL.AsInteger;
             Params[13].AsInteger   := QMapaResumoCODIGO.AsInteger;
             Open;
             iCodLivroSaida:= QInsertCODREG.AsInteger;
          end;
       IBTRReg.Commit;
     except
       IBTRReg.Rollback;
       iCodLivroSaida:= 0;
       AlertaCad('erro ao gravar o Registro');
     end;
   finally
     QInsert.Close;
   end;

   if iCodLivroSaida > 0 then   //se o livro foi gravado, entao grava os itens do livro
      begin 
         iOrdem:= 0;
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         try
           try
             with QItensMapaResumo do
                begin 
                   close;
                   parambyname('codigo').AsInteger:= iCodigoMapa;
                   open;
                   while not eof do
                      begin 
                         inc(iOrdem);
                         GravaItensRegistro(iCodLivroSaida, iOrdem, bTrunc);
                         next;
                      end;
                end;
             dm.IBTransaction.Commit;
           except
             dm.IBTransaction.Rollback;
             AlertaCad('erro ao gravar os itens do livro');
           end;
         finally
           dm.QConsulta.Close;
         end;
      end;
end;

procedure TFrmGerarRegSaidasMapaResumo.GravaItensRegistro(const iCodLivroSaida, iOrdem : integer; const bTrunc : boolean);
var cAuxValor : currency;
begin 
   if IBTRReg.Active then
      IBTRReg.Commit;
   IBTRReg.StartTransaction;
   try
     try
       with QInsItensLivro do
          begin 
             close;
             parambyname('1').AsInteger  := iCodLivroSaida;
             parambyname('2').AsInteger  := iOrdem;

             if trim(QItensMapaResumoTIPO_GRP.AsString) = 'TRI' then
                begin 
                   cAuxValor:= ((QItensMapaResumoVALOR.AsCurrency * QItensMapaResumoALIQUOTA_GRP.AsCurrency) / 100);

                   if bTrunc then
                      cAuxValor:= trunc((cAuxValor * 100) + 0.0009) / 100;

                   Parambyname('3').AsInteger  := 5102;
                   parambyname('4').AsCurrency := QItensMapaResumoVALOR.AsCurrency;
                   Parambyname('5').AsCurrency := cAuxValor;
                   Parambyname('6').AsCurrency := 0;
                   Parambyname('7').AsCurrency := 0;
                   Parambyname('8').AsCurrency := QItensMapaResumoALIQUOTA_GRP.AsCurrency;
                   Parambyname('10').AsCurrency:= QItensMapaResumoVALOR.AsCurrency;
                end
             else
             if trim(QItensMapaResumoTIPO_GRP.AsString) = 'ST' then
                begin 
                   Parambyname('3').AsInteger  := 5405;
                   parambyname('4').AsCurrency := 0;
                   Parambyname('5').AsCurrency := 0;
                   Parambyname('6').AsCurrency := 0;
                   Parambyname('7').AsCurrency := QItensMapaResumoVALOR.AsCurrency;
                   Parambyname('8').AsCurrency := 0;
                   Parambyname('10').AsCurrency:= QItensMapaResumoVALOR.AsCurrency;
                end
             else
             if (trim(QItensMapaResumoTIPO_GRP.AsString) = 'ISE') or (trim(QItensMapaResumoTIPO_GRP.AsString) = 'NT') then
                begin 
                   Parambyname('3').AsInteger  := 5102;
                   parambyname('4').AsCurrency := 0;
                   Parambyname('5').AsCurrency := 0;
                   Parambyname('6').AsCurrency := QItensMapaResumoVALOR.AsCurrency;
                   Parambyname('7').AsCurrency := 0;
                   Parambyname('8').AsCurrency := 0;
                   Parambyname('10').AsCurrency:= QItensMapaResumoVALOR.AsCurrency;
                end;

             Parambyname('9').AsInteger  := iEmp;
             Parambyname('11').AsCurrency:= 0;
             Parambyname('12').AsCurrency:= 0;
             ExecOrOpen;
          end;
       IBTRReg.Commit;
     except
       IBTRReg.Rollback;
       AlertaCad('Erro ao Gravar o Item');
     end;
   finally
     QInsItensLivro.Close;
   end;
end;

function TFrmGerarRegSaidasMapaResumo.TotalMapa(const iCodigoMapa : integer) : currency;
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QTotalMapa do
      begin 
         close;
         ParamByName('codigo').AsInteger:= iCodigoMapa;
         open;
         result:= QTotalMapaTOTAL.AsCurrency;
      end;
   dm.IBTransaction.Commit;
   QTotalMapa.Close;
end;

end.
