unit UImportaRetorno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, FileCtrl, FlCtrlEx, ExtCtrls, DB, DBClient, Grids, DBGrids, 
  Buttons, sSpeedButton, ImgList, acAlphaImageList, ACBrBoleto, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TfrmImportaRetorno = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    ListaArquivos: TFileListBoxEx;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    BoletosRetorno: TClientDataSet;
    BoletosRetornoNOSSO_NUMERO: TStringField;
    BoletosRetornoCOD: TAutoIncField;
    BoletosRetornoOCORRENCIA: TStringField;
    BoletosRetornoDATA_OCORRENCIA: TDateField;
    BoletosRetornoVALOR_DOC: TFloatField;
    BoletosRetornoVALOR_RECEBIDO: TFloatField;
    DS: TDataSource;
    BoletosRetornoENCONTRADO: TStringField;
    BoletosRetornoSELECIONADO: TStringField;
    BoletosRetornoSEL: TStringField;
    BoletosRetornoENC: TStringField;
    Imagens: TsAlphaImageList;
    btnImporta: TsSpeedButton;
    sSpeedButton2: TsSpeedButton;
    QBoletos: TFDQuery;
    IBTRImporta: TFDTransaction;
    QBoletosCOD: TIntegerField;
    QBoletosCOD_EMP: TIntegerField;
    QBoletosCOD_CEDENTE: TIntegerField;
    QBoletosCOD_CTR: TIntegerField;
    QBoletosDATA_DOCUMENTO: TDateField;
    QBoletosVENCIMENTO: TDateField;
    QBoletosNUMERO_DOC: TStringField;
    QBoletosESPECIE_DOC: TStringField;
    QBoletosACEITE: TStringField;
    QBoletosDATA_PROCESSAMENTO: TDateField;
    QBoletosCARTEIRA: TStringField;
    QBoletosNOSSO_NUMERO: TStringField;
    QBoletosVALOR_DOCUMENTO: TBCDField;
    QBoletosCOD_CLI: TIntegerField;
    QBoletosVALOR_ABATIMENTO: TBCDField;
    QBoletosLOCAL_PAGAMENTO: TStringField;
    QBoletosVALOR_MORA_JURUS: TBCDField;
    QBoletosVALOR_DESCONTO: TBCDField;
    QBoletosDATA_MORA_JUROS: TDateField;
    QBoletosDATA_DESCONTO: TDateField;
    QBoletosDATA_ABATIMENTO: TDateField;
    QBoletosDATA_PROTESTO: TDateField;
    QBoletosPORCENTUAL_MULTA: TBCDField;
    QBoletosOCORRENCIA: TStringField;
    QBoletosSTATUS: TStringField;
    QBoletosREMESSA: TIntegerField;
    QBoletosVALOR_RECEBIDO: TBCDField;
    QBoletosDATA_PAGAMENTO: TDateField;
    QAux: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DSStateChange(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure btnImportaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodCedente: Integer;
    ArquivoCarregado: String;
    PastaRetornos: string;
  end;

var
  frmImportaRetorno: TfrmImportaRetorno;

implementation

uses
  UDM, UDialog, Func, UNovoPrincipal;

{$R *.dfm}

procedure TfrmImportaRetorno.btnImportaClick(Sender: TObject);
var
   I: Integer;
   ArqS, ArqDest: String;
begin 
   if IBTRImporta.Active then
      IBTRImporta.Commit;
   IBTRImporta.StartTransaction;
   try
   for I := 0 to dm.Boleto.ListadeBoletos.Count - 1 do
     begin 
        if DM.Boleto.ListadeBoletos.Objects[I].OcorrenciaOriginal.Tipo = toRetornoLiquidado then
           begin 
              QAux.Close;
              QAux.SQL.Text :=  'update boletos set VALOR_RECEBIDO=:VALOR, DATA_PAGAMENTO=:DATA where NOSSO_NUMERO=:NN';
              QAux.ParamByName( 'NN' ).AsInteger := StrToInt( DM.Boleto.ListadeBoletos.Objects[I].NossoNumero );
              QAux.ParamByName( 'VALOR' ).AsCurrency :=  DM.Boleto.ListadeBoletos.Objects[I].ValorRecebido;
              QAux.ParamByName( 'DATA' ).AsDate :=  DM.Boleto.ListadeBoletos.Objects[I].DataOcorrencia;
              QAux.ExecOrOpen;
           end;
     end;
      IBTRImporta.Commit;
      if not DirectoryExists( ListaArquivos.Directory + '\backups\' ) then
         ForceDirectories( ListaArquivos.Directory + '\backups\' );
      ArqDest := ListaArquivos.Directory + '\backups\Importado' + FormatDateTime( 'ddmmyy', Date ) + FormatDateTime( 'hhmmss', time ) + '.ret' ;
      CopyFile( PChar( ArquivoCarregado ) , PChar( ArqDest ), true  );
      DeleteFile( ArquivoCarregado );
      KDialog( 'Importado com exito', 'Importador de retornos', tdtInfo  );
      dm.Boleto.ListadeBoletos.Clear;
      BoletosRetorno.Close;
      ListaArquivos.Directory := 'C:\';
      ListaArquivos.Directory := PastaRetornos

      ;
      ListaArquivos.Refresh;
   except
        on E: Exception do
           begin 
              IBTRImporta.Rollback;
              KDialog( 'Erro ao importar ( ABORTADO ):' +
              E.Message, 'Importador de retornos', tdtErro);

           end;
   end;
end;

procedure TfrmImportaRetorno.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin 
  if Column.field.FieldName = 'SEL' then // o nome do campo
  begin 
    DBGrid1.Canvas.FillRect(Rect);
    if (BoletosRetornoENCONTRADO.AsString = 'S') then
       Imagens.Draw(DBGrid1.Canvas, Rect.Left + 5, Rect.Top + 1, 0)
    else
       Imagens.Draw(DBGrid1.Canvas, Rect.Left + 5, Rect.Top + 1, 1);
  end;

end;

procedure TfrmImportaRetorno.DSStateChange(Sender: TObject);
begin 
   if DS.State = dsBrowse then
      btnImporta.Enabled := True
   else
      btnImporta.Enabled := False;
end;

procedure TfrmImportaRetorno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action := caFree;
end;

procedure TfrmImportaRetorno.FormShow(Sender: TObject);
begin 
   dm.SetarCedente( CodCedente );
   PastaRetornos :=  DM.RetornaStringTabela( 'PASTA_RETORNOS', 'PARAMETROS',
  'COD_EMP',  iEmp  ) + '\';
   ListaArquivos.Directory := PastaRetornos;
end;

procedure TfrmImportaRetorno.sSpeedButton2Click(Sender: TObject);
var
  I: Integer;
begin 
   if ListaArquivos.FileName <> '' then
      begin 
         dm.Boleto.ListadeBoletos.Clear;
         dm.Boleto.LeCedenteRetorno := True;
         dm.Boleto.DirArqRetorno := PastaRetornos;
         dm.Boleto.NomeArqRetorno := ExtractFileName( ListaArquivos.FileName );
         dm.Boleto.LerRetorno;
         if dm.Boleto.Cedente.CNPJCPF <> FormataCNPJ_CPF( dm.cnpj_cedente ) then
            begin 
               KDialog( 'Arquivo retorno não é do cedente selecionado!' +
               #13 + 'Cnpj retorno : ' + dm.Boleto.Cedente.CNPJCPF + #13 +
               'Cnpj Cedente : ' + dm.cnpj_cedente, 'Importação de Retornos', tdtInfo );
               dm.Boleto.ListadeBoletos.Clear;
               if BoletosRetorno.Active then
                  BoletosRetorno.Close;
               ArquivoCarregado := '';
               Exit;

            end;
         if BoletosRetorno.Active then
            BoletosRetorno.Close;
         BoletosRetorno.CreateDataSet;
         BoletosRetorno.EmptyDataSet;
         BoletosRetorno.Active := True;
         if IBTRImporta.Active then
            IBTRImporta.Commit;
         IBTRImporta.StartTransaction;
         ArquivoCarregado := ListaArquivos.FileName;
         for I := 0 to dm.Boleto.ListadeBoletos.Count - 1 do
             begin 
                BoletosRetorno.Insert;
                BoletosRetornoNOSSO_NUMERO.AsString := dm.Boleto.ListadeBoletos.Objects[I].NossoNumero;
                BoletosRetornoOCORRENCIA.AsString := dm.Boleto.ListadeBoletos.Objects[I].OcorrenciaOriginal.Descricao;
                BoletosRetornoDATA_OCORRENCIA.AsDateTime := dm.Boleto.ListadeBoletos.Objects[I].DataOcorrencia;
                BoletosRetornoVALOR_RECEBIDO.AsCurrency := dm.Boleto.ListadeBoletos.Objects[I].ValorRecebido;
                BoletosRetornoVALOR_DOC.AsCurrency := dm.Boleto.ListadeBoletos.Objects[I].ValorDocumento;
                QBoletos.Close;
                Qboletos.SQL.Text := 'select * from boletos where NOSSO_NUMERO=:NN';
                Qboletos.ParamByName( 'NN' ).AsInteger := BoletosRetornoNOSSO_NUMERO.AsInteger;
                Qboletos.Open;
                if Qboletos.IsEmpty then
                   BoletosRetornoENCONTRADO.AsString := 'N'
                else
                   BoletosRetornoENCONTRADO.AsString := 'S';
                Qboletos.Close;
                BoletosRetorno.Post;
             end;
         IBTRImporta.Commit;
      end;

end;

end.
