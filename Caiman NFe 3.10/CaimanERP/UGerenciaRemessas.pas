unit UGerenciaRemessas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, DB, Buttons, sSpeedButton, Mask, 
  sMaskEdit, sCustomComboEdit, sTooledit, ImgList, acAlphaImageList, 
  UCadRemessa, ACBrBoleto, StrUtils, UNovosComponentes, UNovoFormulario, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet,
  System.ImageList;

type
  TfrmGerenciaRemessas = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtSelCedente: TComboBox;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    IBTRRemessas: TFDTransaction;
    QRemessas: TFDQuery;
    QRemessasCOD: TIntegerField;
    QRemessasCOD_EMP: TIntegerField;
    QRemessasCOD_CEDENTE: TIntegerField;
    QRemessasSTATUS: TStringField;
    QRemessasDATA_REMESSA: TDateField;
    QRemessasDATA_ENVIADA: TDateField;
    DSQRemessas: TDataSource;
    edtDataIni: TsDateEdit;
    edtDataFim: TsDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    btnAtualizar: TsSpeedButton;
    sSpeedButton1: TsSpeedButton;
    ImagensDBGrid: TsAlphaImageList;
    IBSQL: TFDQuery;
    sSpeedButton2: TsSpeedButton;
    sSpeedButton3: TsSpeedButton;
    sSpeedButton4: TsSpeedButton;
    QRemessasNUMER_REMESSA: TIntegerField;
    Aux: TFDQuery;
    QGeraRemessa: TFDQuery;
    QGeraRemessaCOD: TIntegerField;
    QGeraRemessaCOD_EMP: TIntegerField;
    QGeraRemessaCOD_CEDENTE: TIntegerField;
    QGeraRemessaCOD_CTR: TIntegerField;
    QGeraRemessaDATA_DOCUMENTO: TDateField;
    QGeraRemessaVENCIMENTO: TDateField;
    QGeraRemessaNUMERO_DOC: TStringField;
    QGeraRemessaESPECIE_DOC: TStringField;
    QGeraRemessaACEITE: TStringField;
    QGeraRemessaDATA_PROCESSAMENTO: TDateField;
    QGeraRemessaCARTEIRA: TStringField;
    QGeraRemessaNOSSO_NUMERO: TStringField;
    QGeraRemessaVALOR_DOCUMENTO: TBCDField;
    QGeraRemessaCOD_CLI: TIntegerField;
    QGeraRemessaVALOR_ABATIMENTO: TBCDField;
    QGeraRemessaLOCAL_PAGAMENTO: TStringField;
    QGeraRemessaVALOR_MORA_JURUS: TBCDField;
    QGeraRemessaVALOR_DESCONTO: TBCDField;
    QGeraRemessaDATA_MORA_JUROS: TDateField;
    QGeraRemessaDATA_DESCONTO: TDateField;
    QGeraRemessaDATA_ABATIMENTO: TDateField;
    QGeraRemessaDATA_PROTESTO: TDateField;
    QGeraRemessaPORCENTUAL_MULTA: TBCDField;
    QGeraRemessaOCORRENCIA: TStringField;
    QGeraRemessaSTATUS: TStringField;
    QGeraRemessaREMESSA: TIntegerField;
    QGeraRemessaNOME_CLI: TStringField;
    QGeraRemessaCNPJ_CLI: TStringField;
    QGeraRemessaENDRES_CLI: TStringField;
    QGeraRemessaNUMRES_CLI: TStringField;
    QGeraRemessaBAIRES_CLI: TStringField;
    QGeraRemessaCIDRES_CLI: TStringField;
    QGeraRemessaESTRES_CLI: TStringField;
    QGeraRemessaCEPRES_CLI: TStringField;
    sSpeedButton5: TsSpeedButton;
    QGeraRemessaVALOR_RECEBIDO: TBCDField;
    QGeraRemessaDATA_PAGAMENTO: TDateField;
    QGeraRemessaFJ_CLI: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtSelCedenteChange(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure sSpeedButton4Click(Sender: TObject);
    procedure sSpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    PastaRemessa: string;
    EstRemessa: string;
  end;

var
  frmGerenciaRemessas: TfrmGerenciaRemessas;

implementation

uses
  UDM, Ubibli1, UDialog, UImportaRetorno, UNovoPrincipal;

{$R *.dfm}

procedure TfrmGerenciaRemessas.btnAtualizarClick(Sender: TObject);
begin 
  if edtSelCedente.ItemIndex < 0 then
    Exit;
  if IBTRRemessas.Active then
    IBTRRemessas.Commit;
  IBTRRemessas.StartTransaction;
  QRemessas.Close;
  QRemessas.SQL.Text :=
    'Select * from Remessas where COD_CEDENTE=:CODCEDENTE and DATA_REMESSA between :dt1 and :dt2';
  QRemessas.ParamByName('CODCEDENTE').AsInteger :=
    StrToInt(Copy(edtSelCedente.Text, 1, 3));
  QRemessas.ParamByName('dt1').AsDate := edtDataIni.Date;
  QRemessas.ParamByName('dt2').AsDate := edtDataFim.Date;
  QRemessas.Open;
end;

procedure TfrmGerenciaRemessas.edtSelCedenteChange(Sender: TObject);
begin 
  if edtSelCedente.ItemIndex < 0 then
    Exit;
  if IBTRRemessas.Active then
    IBTRRemessas.Commit;
  IBTRRemessas.StartTransaction;
  QRemessas.Close;
  QRemessas.SQL.Text :=
    'Select * from Remessas where COD_CEDENTE=:CODCEDENTE and DATA_REMESSA between :dt1 and :dt2';
  QRemessas.ParamByName('CODCEDENTE').AsInteger :=
    StrToInt(Copy(edtSelCedente.Text, 1, 3));
  QRemessas.ParamByName('dt1').AsDate := edtDataIni.Date;
  QRemessas.ParamByName('dt2').AsDate := edtDataFim.Date;
  QRemessas.Open;

end;

procedure TfrmGerenciaRemessas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  QRemessas.Close;
  if IBTRRemessas.Active then
    IBTRRemessas.Commit;

  Action := caFree;
end;

procedure TfrmGerenciaRemessas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  case Key of
    vk_escape:
      Close;
  end;
end;

procedure TfrmGerenciaRemessas.FormShow(Sender: TObject);
var
  StrTemp: String;

begin 
  PastaRemessa := DM.RetornaStringTabela( 'PASTA_REMESSA', 'PARAMETROS',
  'COD_EMP', iEmp  ) + '\';
  EstRemessa := '.' + DM.RetornaStringTabela( 'EST_REMESSA', 'PARAMETROS',
  'COD_EMP', iEmp );
  if not DirectoryExists( PastaRemessa ) then
  begin 
    ForceDirectories( PastaRemessa );
  end;

  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  edtDataIni.Date := Date;
  edtDataFim.Date := Date;
  dm.QSacado.SQL.Text := 'select * from BOLETOS_SACADO where COD_EMP=:CODEMP';
  dm.QSacado.ParamByName('CODEMP').AsInteger := iEmp;
  edtSelCedente.Items.Clear;
  edtSelCedente.Clear;
  dm.QSacado.Open;
  if dm.QSacado.IsEmpty then
     begin 
        KDialog( 'Nenhum cedente Cadastrado', 'Gerenciador de Remessas', tdtInfo );
        Panel1.Enabled := False;
        Panel2.Enabled := false;
        DBGrid1.Enabled := False;
        Exit;
     end;
  dm.QSacado.First;
  while not dm.QSacado.Eof do
  begin 
    StrTemp := FormataStringD(dm.QSacadoCOD.AsString, '3', '0') + ' - ' +
      dm.QSacadoCODIGO_CEDENTE.AsString + '.' + dm.QSacadoSACADO_NOME.AsString;
    edtSelCedente.Items.Add(StrTemp);
    dm.QSacado.Next;
  end;
  dm.IBTransaction.Commit;
  edtSelCedente.ItemIndex := 0;
  edtSelCedenteChange(nil);
end;

procedure TfrmGerenciaRemessas.sSpeedButton1Click(Sender: TObject);
var
  Cod_novo: Integer;
  Numero_Remessa: Integer;
begin 
  if not dm.Acesso('C1027', 'I') then
  begin 
    Application.MessageBox('Você não tem permissão para efetuar esta operação.',
      'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
    Abort;
    Exit;
  end;
  try
    Cod_novo := prxcod('REMESSAS', 'COD', dm.IBTransaction, dm.ibsqlcod);
    Aux.Close;
    Aux.SQL.Text := 'select * from PEGA_REMESSA( :COD_CEDENTE )';
    Aux.ParamByName('COD_CEDENTE').AsInteger :=
      StrToInt(Copy(edtSelCedente.Text, 1, 3));
    Aux.Open;
    Numero_Remessa := Aux.FieldByName('NUMERO_REMESSAA').AsInteger;
    IBSQL.SQL.Text := 'insert into REMESSAS( COD, COD_EMP, COD_CEDENTE, STATUS,'
      + ' DATA_REMESSA, NUMER_REMESSA) values (:COD, :COD_EMP, :COD_CEDENTE, :STATUS,'
      + ' :DATA_REMESSA, :NUMER_REMESSA )';
    IBSQL.ParamByName('COD').AsInteger := Cod_novo;
    IBSQL.ParamByName('COD_EMP').AsInteger := iEmp;
    IBSQL.ParamByName('COD_CEDENTE').AsInteger :=
      StrToInt(Copy(edtSelCedente.Text, 1, 3));
    IBSQL.ParamByName('STATUS').AsString := 'ABERTA';
    IBSQL.ParamByName('NUMER_REMESSA').AsInteger := Numero_Remessa;
    IBSQL.ParamByName('DATA_REMESSA').AsDate := Date;
    IBSQL.ExecOrOpen;
    IBTRRemessas.Commit;
    edtSelCedenteChange(nil);
    Application.CreateForm(TfrmCadRemessa, frmCadRemessa);
    frmCadRemessa.edtCod.Text := IntToStr(Cod_novo);
    frmCadRemessa.edtCedente.Text := edtSelCedente.Text;
    frmCadRemessa.edtStatus.Text := 'ABERTA';
    frmCadRemessa.edtData.Text := FormatDateTime('dd/mm/yyyy', Date);
    frmCadRemessa.ShowModal;
  except
    KDialog('Erro ao cadastrar remessa', 'Gerenciamento de Remessas', tdtErro);
    Exit;
  end;

end;

procedure TfrmGerenciaRemessas.sSpeedButton2Click(Sender: TObject);
begin 
  if not dm.Acesso('C1027', 'E') then
  begin 
    Application.MessageBox('Você não tem permissão para efetuar esta operação.',
      'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
    Abort;
    Exit;
  end;

  if not QRemessasDATA_ENVIADA.IsNull then
  begin 
    KDialog('Você não pode excluir uma remessa ja enviada!',
      'Gerenciamento de remessas', tdtInfo);
    Exit;
  end;
  if not KDialog('tem certeza que deseja excluir está remessa',
    'Gerenciamento de remessas', tdtPergunta) then
  begin 
    Exit;
  end;

  IBSQL.SQL.Text := 'delete from REMESSAS where COD=:COD';
  IBSQL.ParamByName('COD').AsInteger := QRemessasCOD.AsInteger;
  IBSQL.ExecOrOpen;
  IBTRRemessas.Commit;
  IBTRRemessas.StartTransaction;
  QRemessas.Open;
end;

procedure TfrmGerenciaRemessas.sSpeedButton3Click(Sender: TObject);
begin 
  if QRemessasCOD.IsNull then
    Exit;
  if not dm.Acesso('C1027', 'A') then
  begin 
    Application.MessageBox('Você não tem permissão para efetuar esta operação.',
      'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
    Abort;
    Exit;
  end;
  Application.CreateForm(TfrmCadRemessa, frmCadRemessa);
  frmCadRemessa.edtCod.Text := QRemessasCOD.AsString;
  frmCadRemessa.edtCedente.Text := edtSelCedente.Text;
  frmCadRemessa.edtStatus.Text := QRemessasSTATUS.AsString;
  frmCadRemessa.edtData.Text := QRemessasDATA_REMESSA.AsString;
  frmCadRemessa.ShowModal;

end;

procedure TfrmGerenciaRemessas.sSpeedButton4Click(Sender: TObject);
var
  Titulo: TACBrTitulo;
const   Letra : String = 'ABCDEFGHIJKLMNOPQRSTUVXZ';
begin 

  if QRemessasCOD.IsNull then
  begin 
    Exit;
  end;
  try
    dm.SetarCedente(StrToInt(Copy(edtSelCedente.Text, 1, 3)));
    dm.Boleto.DirArqRemessa := PastaRemessa;
    dm.Boleto.NomeArqRemessa :=  QRemessasNUMER_REMESSA.AsString + Letra[iEmp] +
    FormatDateTime( 'ddmmyy', QRemessasDATA_REMESSA.AsDateTime )
     + EstRemessa;
    QGeraRemessa.Close;
    QGeraRemessa.ParamByName('CODREMESSA').AsInteger := QRemessasCOD.AsInteger;
    QGeraRemessa.Open;
    QGeraRemessa.First;
    while not QGeraRemessa.Eof do
    begin 
      Titulo := dm.Boleto.CriarTituloNaLista;
      with Titulo do
      begin 
        Vencimento := QGeraRemessaVENCIMENTO.AsDateTime;
        DataDocumento := QGeraRemessaDATA_DOCUMENTO.AsDateTime;
        NumeroDocumento := QGeraRemessaNUMERO_DOC.AsString;
        EspecieDoc := QGeraRemessaESPECIE_DOC.AsString;

        if Trim( QGeraRemessaACEITE.AsString ) = 'S' then
          Aceite := atSim
        else
          Aceite := atNao;
        DataProcessamento := QGeraRemessaDATA_PROCESSAMENTO.AsDateTime;
        NossoNumero := QGeraRemessaNOSSO_NUMERO.AsString;
        Carteira := QGeraRemessaCARTEIRA.AsString;
        ValorDocumento := QGeraRemessaVALOR_DOCUMENTO.AsCurrency;
        Sacado.NomeSacado := QGeraRemessaNOME_CLI.AsString;
        if QGeraRemessaFJ_CLI.AsString = 'J' then
           Sacado.Pessoa := pJuridica
        else
           Sacado.Pessoa := pFisica;
        Sacado.CNPJCPF := QGeraRemessaCNPJ_CLI.AsString;
        Sacado.Logradouro :=QGeraRemessaENDRES_CLI.AsString;
        Sacado.Numero := QGeraRemessaNUMRES_CLI.AsString;
        Sacado.Bairro := QGeraRemessaBAIRES_CLI.AsString;
        Sacado.Cidade := QGeraRemessaCIDRES_CLI.AsString;
        Sacado.UF := QGeraRemessaESTRES_CLI.AsString;
        Sacado.CEP := QGeraRemessaCEPRES_CLI.AsString;
        ValorAbatimento := 0;
        LocalPagamento := QGeraRemessaLOCAL_PAGAMENTO.AsString;
        ValorMoraJuros := QGeraRemessaVALOR_MORA_JURUS.AsCurrency;
        ValorDesconto := 0;
        ValorAbatimento := 0;
        DataMoraJuros := QGeraRemessaDATA_MORA_JUROS.AsDateTime;
        DataDesconto := 0;
        DataAbatimento := 0;
        if QGeraRemessaDATA_PROTESTO.IsNull then
           DataProtesto := 0
        else
           DataProtesto := QGeraRemessaDATA_PROTESTO.AsDateTime;
        PercentualMulta := QGeraRemessaPORCENTUAL_MULTA.AsCurrency;
        Mensagem.Text := '';
        OcorrenciaOriginal.Tipo := toRemessaRegistrar;
        Instrucao1 := '';
        Instrucao2 := '';
      end;

      QGeraRemessa.Next;
    end;
    if dm.Boleto.ListadeBoletos.Count > 0 then
       dm.Boleto.GerarRemessa( QRemessasNUMER_REMESSA.AsInteger );
    KDialog( 'Gerado com sucesso em : ' + #13 +
    PastaRemessa + QRemessasNUMER_REMESSA.AsString + Letra[iEmp] +
    FormatDateTime( 'ddmmyy', QRemessasDATA_REMESSA.AsDateTime )
     + EstRemessa, 'Gerenciador de remessas', tdtInfo );
    QGeraRemessa.Close;
    IBSQL.SQL.Text := 'update REMESSAS set STATUS=:STATUS, DATA_ENVIADA=:DATA_ENVIADA where COD=:COD';
    IBSQL.ParamByName( 'STATUS' ).AsString := 'GERADA';
    IBSQL.ParamByName( 'DATA_ENVIADA' ).AsDate := date;
    IBSQL.ParamByName( 'COD' ).AsInteger := QRemessasCOD.AsInteger;
    IBSQL.ExecOrOpen;
    IBTRRemessas.CommitRetaining;
    QRemessas.Close;
    Qremessas.Open;

  except
     on E:Exception do
        begin 
            KDialog('Erro ao gerar remessa' + #13 + E.Message, 'Gerenciador de Remessas', tdtErro);
            Exit;
        end;
  end;

end;

procedure TfrmGerenciaRemessas.sSpeedButton5Click(Sender: TObject);
begin 
   Application.CreateForm( TfrmImportaRetorno, frmImportaRetorno );
   frmImportaRetorno.CodCedente := StrToInt(Copy(edtSelCedente.Text, 1, 3));
   frmImportaRetorno.ShowModal;
end;

end.
