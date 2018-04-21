unit UMMA_Fechamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, RzEdit, Mask, rxToolEdit, rxCurrEdit, DB, Buttons, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TfrmMMA_Fechamento = class(UNovoFormulario.TForm)
    total: TCurrencyEdit;
    parcelas: TRzNumericEdit;
    Label1: TLabel;
    Label2: TLabel;
    entrada: TCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    dias: TRzNumericEdit;
    Label5: TLabel;
    restante: TCurrencyEdit;
    QGeraParc: TFDQuery;
    comando: TFDQuery;
    SpeedButton1: TsSpeedButton;
    SpeedButton2: TsSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure entradaExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GeraParcelas;
    procedure imprimeOS;
  private
    { Private declarations }
  public
    { Public declarations }
    valor_total: Double;
    OS: integer;
    cod_cliente: integer;
  end;

var
  frmMMA_Fechamento: TfrmMMA_Fechamento;

implementation

uses
  UDM, UMMA_OS, UMMA_TROCO, UMMA_REL_FECHAMENTO, UNovoPrincipal;
{$R *.dfm}

procedure TfrmMMA_Fechamento.imprimeOS;
begin 
  Application.CreateForm(TfrmREL_FECHAMENTO, frmREL_FECHAMENTO);

  frmREL_FECHAMENTO.Qemp.SQL.Text :=
    'Select * from empresa where COD_EMP=' + inttostr(iEmp);
  frmREL_FECHAMENTO.Qemp.Open;
  frmREL_FECHAMENTO.Qconfig.SQL.Text := 'select * from MMA_CONFIG';
  frmREL_FECHAMENTO.Qconfig.Open;
  frmREL_FECHAMENTO.qos.SQL.Text :=
    'Select * from MMA_ORDEM_SERVICO where COD=' + inttostr(OS);
  frmREL_FECHAMENTO.qos.Open;
  frmREL_FECHAMENTO.Qcliente.SQL.Text :=
    'select * from CLIENTE where COD_CLI='
    + inttostr(cod_cliente);
  frmREL_FECHAMENTO.Qcliente.Open;
  frmREL_FECHAMENTO.qitens.SQL.Text :=
    'select * from MMA_ORDEM_ITENS where COD_OS=' + inttostr(OS);
  frmREL_FECHAMENTO.qitens.Open;
  frmREL_FECHAMENTO.qreceber.SQL.Text :=
    'select * from CONTAS_RECEBER where COD_OS_MMA=' + inttostr(OS);
  frmREL_FECHAMENTO.qreceber.Open;
  frmREL_FECHAMENTO.statuss.Caption := 'ITENS DO CONSERTO';
  frmREL_FECHAMENTO.termo1.Font.Color := clblack;
  frmREL_FECHAMENTO.termo2.Font.Color := clblack;
  if fileexists(ExtractFilePath(Application.ExeName) + 'logo.bmp') then
    frmREL_FECHAMENTO.logo.Picture.LoadFromFile
      (ExtractFilePath(Application.ExeName) + 'logo.bmp');
  frmREL_FECHAMENTO.QuickRep1.PreviewModal;
  frmREL_FECHAMENTO.Qemp.Close;
  frmREL_FECHAMENTO.Qcliente.Close;
  frmREL_FECHAMENTO.Qconfig.Close;
  frmREL_FECHAMENTO.qos.Close;
  frmREL_FECHAMENTO.qitens.Close;
  frmREL_FECHAMENTO.Free;
end;

procedure TfrmMMA_Fechamento.GeraParcelas;
var
  i, parcelanum, iCodCobranca, iCodClassif: integer;
  ultimadata: Tdate;
  calc: Double;
  entradaa: boolean;
  numeroparcelas: integer;
begin 
  iCodCobranca := 1;
  iCodClassif := 1;
  /// Verifica se tem entrada se tem crfia o contas a receber
  ///

  entradaa := false;
  if entrada.Value > 0 then
  begin 
    entradaa := true;
    Application.CreateForm(TfrmMMA_TROCO, frmMMA_TROCO);
    frmMMA_TROCO.valor := entrada.Value;
    frmMMA_TROCO.ShowModal;
    QGeraParc.Close;
    QGeraParc.Parambyname('seq').AsInteger := 1;
    QGeraParc.Parambyname('codemp').AsInteger := iEmp;
    QGeraParc.Parambyname('datactr').AsDate := date;
    QGeraParc.Parambyname('codcli').AsInteger := cod_cliente;
    QGeraParc.Parambyname('venctoctr').AsDate := date;
    QGeraParc.Parambyname('valorctr').AsCurrency := entrada.Value;
    QGeraParc.Parambyname('dtpagtoctr').AsDate := date;
    QGeraParc.Parambyname('vlrpagoctr').AsCurrency := entrada.Value;
    QGeraParc.Parambyname('codcob').AsInteger := iCodCobranca;
    QGeraParc.Parambyname('descconc').AsCurrency := 0;
    QGeraParc.Parambyname('desc').AsCurrency := 0;
    QGeraParc.Parambyname('acres').AsCurrency := 0;
    QGeraParc.Parambyname('acresrec').AsCurrency := 0;
    QGeraParc.Parambyname('caixaemi').AsInteger := iCaixa;
    QGeraParc.Parambyname('codcai').AsInteger := iCaixa;
    QGeraParc.Parambyname('parc').AsCurrency := 1;
    QGeraParc.Parambyname('devol').AsCurrency := 0;
    QGeraParc.Parambyname('codcla').AsInteger := iCodClassif;
    QGeraParc.Parambyname('cod_os_mma').AsInteger := OS;
    QGeraParc.Open;
    QGeraParc.Close;
    frmMMA_OS.TR_OS.CommitRetaining;

  end;
  calc := restante.Value / parcelas.Value;
  ultimadata := date;
  numeroparcelas := strtoint(parcelas.Text);
  for i := 1 to numeroparcelas do
  begin 
    if entradaa then
      parcelanum := i + 1
    else
      parcelanum := i;
    ultimadata := ultimadata + dias.Value;
    QGeraParc.Close;
    QGeraParc.Parambyname('seq').AsInteger := 1;
    QGeraParc.Parambyname('codemp').AsInteger := iEmp;
    QGeraParc.Parambyname('datactr').AsDate := date;
    QGeraParc.Parambyname('codcli').AsInteger := cod_cliente;
    QGeraParc.Parambyname('venctoctr').AsDate := ultimadata;
    QGeraParc.Parambyname('valorctr').AsCurrency := calc;
    QGeraParc.Parambyname('dtpagtoctr').Value := null;
    QGeraParc.Parambyname('vlrpagoctr').AsCurrency := 0;
    QGeraParc.Parambyname('codcob').AsInteger := iCodCobranca;
    QGeraParc.Parambyname('descconc').AsCurrency := 0;
    QGeraParc.Parambyname('desc').AsCurrency := 0;
    QGeraParc.Parambyname('acres').AsCurrency := 0;
    QGeraParc.Parambyname('acresrec').AsCurrency := 0;
    QGeraParc.Parambyname('caixaemi').AsInteger := iCaixa;
    QGeraParc.Parambyname('codcai').Value := null;
    QGeraParc.Parambyname('parc').AsCurrency := parcelanum;
    QGeraParc.Parambyname('devol').AsCurrency := 0;
    QGeraParc.Parambyname('codcla').AsInteger := iCodClassif;
    QGeraParc.Parambyname('cod_os_mma').AsInteger := OS;
    QGeraParc.Open;
    QGeraParc.Close;
    frmMMA_OS.TR_OS.CommitRetaining;
  end;

  /// Grava status e histórico
  ///

  comando.Close;
  comando.SQL.Text := 'update MMA_ORDEM_SERVICO set STATUS=' + quotedstr
    ('ENTREGUE PRONTO') + ', DATA_FECHAMENTO=current_date where COD=' +
    inttostr(OS);
  comando.Open;
  comando.Close;
  comando.SQL.Text :=
    'insert into MMA_ORDEM_HISTORICO( COD_OS, DATA, DESCRICAO ) ' +
    'values( :COD_OS, current_date, :DESCRICAO )';
  comando.Parambyname('COD_OS').AsInteger := OS;
  comando.Parambyname('DESCRICAO').asstring := 'ENTREGUE PAGAMENTO À PRAZO';
  comando.Open;
  comando.Close;
  if not AtivaLavanderia then
    imprimeOS;
  frmMMA_OS.TR_OS.CommitRetaining;

end;

procedure TfrmMMA_Fechamento.Button1Click(Sender: TObject);
var
  i, iCodCobranca, iCodClassif: integer;

begin 
  iCodCobranca := 1;
  iCodClassif := 1;

  if entrada.Value > total.Value then
  begin 
    AlertaCad('Entrada não pode ser maior que o valor total!');
    exit;
  end;
  restante.Value := total.Value - entrada.Value;
  if restante.Value = 0 then
  begin 
    Application.CreateForm(TfrmMMA_TROCO, frmMMA_TROCO);
    frmMMA_TROCO.valor := entrada.Value;
    frmMMA_TROCO.ShowModal;
    QGeraParc.Close;
    QGeraParc.Parambyname('seq').AsInteger := 1;
    QGeraParc.Parambyname('codemp').AsInteger := iEmp;
    QGeraParc.Parambyname('datactr').AsDate := date;
    QGeraParc.Parambyname('codcli').AsInteger := cod_cliente;
    QGeraParc.Parambyname('venctoctr').AsDate := date;
    QGeraParc.Parambyname('valorctr').AsCurrency :=
      frmMMA_Fechamento.valor_total;
    QGeraParc.Parambyname('dtpagtoctr').AsDate := date;
    QGeraParc.Parambyname('vlrpagoctr').AsCurrency :=
      frmMMA_Fechamento.valor_total;
    QGeraParc.Parambyname('codcob').AsInteger := iCodCobranca;
    QGeraParc.Parambyname('descconc').AsCurrency := 0;
    QGeraParc.Parambyname('desc').AsCurrency := 0;
    QGeraParc.Parambyname('acres').AsCurrency := 0;
    QGeraParc.Parambyname('acresrec').AsCurrency := 0;
    QGeraParc.Parambyname('caixaemi').AsInteger := iCaixa;
    QGeraParc.Parambyname('codcai').AsInteger := iCaixa;
    QGeraParc.Parambyname('parc').AsCurrency := 1;
    QGeraParc.Parambyname('devol').AsCurrency := 0;
    QGeraParc.Parambyname('codcla').AsInteger := iCodClassif;
    QGeraParc.Parambyname('cod_os_mma').AsInteger := OS;
    QGeraParc.Open;
    QGeraParc.Close;
    frmMMA_OS.TR_OS.CommitRetaining;

    comando.Close;
    comando.SQL.Text := 'update MMA_ORDEM_SERVICO set STATUS=' + quotedstr
      ('ENTREGUE PRONTO') + ', DATA_FECHAMENTO=current_date where COD=' +
      inttostr(OS);
    comando.Open;
    comando.Close;
    comando.SQL.Text :=
      'insert into MMA_ORDEM_HISTORICO( COD_OS, DATA, DESCRICAO ) ' +
      'values( :COD_OS, current_date, :DESCRICAO )';
    comando.Parambyname('COD_OS').AsInteger := OS;
    comando.Parambyname('DESCRICAO').asstring := 'ENTREGUE PAGAMENTO À VISTA';
    comando.Open;
    comando.Close;
    if not AtivaLavanderia then
      imprimeOS;
    frmMMA_OS.TR_OS.CommitRetaining;
  end
  else
    GeraParcelas;

  AlertaCad('Entrega efetuada com sucesso!', alertOK);
  Close;

end;

procedure TfrmMMA_Fechamento.Button2Click(Sender: TObject);
begin 
  Close;
end;

procedure TfrmMMA_Fechamento.entradaExit(Sender: TObject);
begin 
  if entrada.Value > total.Value then
  begin 
    AlertaCad('Entrada não pode ser maior que o valor total!');
    exit;
  end;
  restante.Value := total.Value - entrada.Value;
end;

procedure TfrmMMA_Fechamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  Action := cafree;
end;

procedure TfrmMMA_Fechamento.FormShow(Sender: TObject);
begin 

  total.Value := valor_total;
  Caption := 'Fechamento da OS --> ' + inttostr(OS);
  parcelas.Value := 0;
  entrada.Value := 0;
  restante.Value := 0;
  dias.Value := 0;
end;

end.
