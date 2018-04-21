unit UGerenciamentoNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Grids, DBGrids, pcnConversao, DB,
  Menus, AdvGlowButton, NxPageControl, NxScrollControl, NxCustomGridControl,
  NxCustomGrid, NxDBGrid, NxDBColumns, NxColumns, DBCtrls, Mask, sMaskEdit,
  sCustomComboEdit, sTooledit, ImgList, acAlphaImageList, acPNG, Buttons,
  UDialog, IOUtils, StrUtils, UNovosComponentes, UNovoFormulario,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util,
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet, cxPC,
  pcnConversaoNFe, System.ImageList;

type
  TFrmGerenciamentoNFe = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Combo: TComboBox;
    BtnOk: TButton;
    BtnSair: TButton;
    QConsNfe: TFDQuery;
    DSConsNFe: TDataSource;
    IBTRNfe: TFDTransaction;
    QConsNfeCOD_NF: TIntegerField;
    QConsNfeDATA_EMISSAO_NF: TDateField;
    QConsNfeVALOR_TOTAL_NF: TBCDField;
    QConsNfeNOME_CLI: TStringField;
    QConsNfeRAZAO_FOR: TStringField;
    QConsNfeNUMERO_NOTA_NF: TIntegerField;
    QConsNfeSTATUS_TRANSMITIDA: TStringField;
    QConsNfeSTATUS_CANCELADO: TStringField;
    QConsNfeSTATUS_INUTILIZADO: TStringField;
    QConsNfeSTATUS_EMAIL: TStringField;
    QConsNfeCALC_TRANSMITIDO: TStringField;
    QConsNfeCALC_CANCELADO: TStringField;
    QConsNfeCALC_INUTILIZADO: TStringField;
    QConsNfeCALC_EMAIL: TStringField;
    QConsNfeCALC_DESTINATARIO: TStringField;
    QConsNfeCOD_CLI: TIntegerField;
    QConsNfeCOD_FOR: TIntegerField;
    QConsNfeCHAVE_ACESSO_NFE: TStringField;
    QConsNfePROTOCOLO_NFE: TStringField;
    QConsNfeCHAVE2: TStringField;
    QConsNfeDEPEC: TIntegerField;
    PopupMenu1: TPopupMenu;
    Serviosespecias1: TMenuItem;
    ResetarNFe1: TMenuItem;
    btnStatus: TAdvGlowButton;
    btnConsulta: TAdvGlowButton;
    btnValida: TAdvGlowButton;
    btnInutiliza: TAdvGlowButton;
    btnCancela: TAdvGlowButton;
    btnEmail: TAdvGlowButton;
    btnImprime: TAdvGlowButton;
    Paginas: TNxPageControl;
    Notas: TNxTabSheet;
    Cartas: TNxTabSheet;
    DBGrid1: TDBGrid;
    QCartas: TFDQuery;
    QCartasCOD: TIntegerField;
    QCartasCOD_NF: TIntegerField;
    QCartasDATA: TDateField;
    QCartasSEQ: TIntegerField;
    QCartasCHAVE: TStringField;
    QCartasSTATUS_TRANSMITIDA: TStringField;
    QCartasPROTOCOLO: TStringField;
    QCartasDATA_AUT: TDateField;
    QCartasHORA_AUT: TTimeField;
    QCartasCORRECAO: TStringField;
    QCartasRETORNO: TWideMemoField;
    DSCartas: TDataSource;
    DBGrid2: TDBGrid;
    Panel4: TPanel;
    QCartasSTATUS: TStringField;
    btnEnviaCarta: TAdvGlowButton;
    btnExcluirCarta: TAdvGlowButton;
    btnNovaCarta: TAdvGlowButton;
    btnEditaCarta: TAdvGlowButton;
    ICartas: TFDQuery;
    Panel5: TPanel;
    Label2: TLabel;
    DBText1: TDBText;
    EdtDataIni: TsDateEdit;
    EdtDataFin: TsDateEdit;
    Imagens: TsAlphaImageList;
    QConsNfeSTATUS_GERAL: TStringField;
    QConsNfeCORRECAO: TStringField;
    GroupBox3: TGroupBox;
    Image1: TImage;
    Label34: TLabel;
    Image2: TImage;
    Label4: TLabel;
    Image3: TImage;
    Label5: TLabel;
    Image5: TImage;
    Label7: TLabel;
    Image6: TImage;
    Label8: TLabel;
    Image7: TImage;
    Label9: TLabel;
    GroupBox4: TGroupBox;
    Image4: TImage;
    Label6: TLabel;
    Image8: TImage;
    Label10: TLabel;
    Image9: TImage;
    Label11: TLabel;
    Image10: TImage;
    Label12: TLabel;
    Image11: TImage;
    Label13: TLabel;
    btnImpCarta: TAdvGlowButton;
    btnPeriodo: TAdvGlowButton;
    QDuplicaNota: TFDQuery;
    QDuplicaItens: TFDQuery;
    IBSQL1: TFDQuery;
    TR2: TFDTransaction;
    QAux: TFDQuery;
    D1: TMenuItem;
    QItens: TFDQuery;
    QItensORDEM: TIntegerField;
    QItensCOD_NF: TIntegerField;
    QItensCST: TStringField;
    QItensALIQ: TBCDField;
    QItensCOD_EMP: TIntegerField;
    QItensCOD_GRP: TIntegerField;
    QItensQUANT: TBCDField;
    QItensALIQ_IPI: TBCDField;
    QItensREDUCAO_ICMS: TBCDField;
    QItensCOD_CFO: TIntegerField;
    QItensSUB_TRIBUTARIA: TStringField;
    QItensVR_AGREGADO: TBCDField;
    QItensALIQUOTA_FORA_ESTADO: TBCDField;
    QItensUNIDADE: TStringField;
    QItensCOD_PRO: TIntegerField;
    QItensVALOR_TOTAL: TBCDField;
    QItensBASE_CALCULO: TBCDField;
    QItensVALOR_ICMS: TBCDField;
    QItensBASE_SUBTRIB: TBCDField;
    QItensVALOR_IPI: TBCDField;
    QItensVALOR_SUBTRIB: TBCDField;
    QItensCLASSIFICACAO_FISCAL: TStringField;
    QItensUNIT: TBCDField;
    QItensISENTAS: TBCDField;
    QItensOUTRAS: TBCDField;
    QItensFRETE: TFloatField;
    QItensDESCONTO: TFloatField;
    QItensBC_PIS: TBCDField;
    QItensALIQ_PIS: TBCDField;
    QItensVALOR_PIS: TBCDField;
    QItensBC_COFINS: TBCDField;
    QItensALIQ_COFINS: TBCDField;
    QItensVALOR_COFINS: TBCDField;
    QItensCANCELADO: TIntegerField;
    QItensNF_CANCELADA: TIntegerField;
    QItensCST_PIS: TStringField;
    QItensCST_COFINS: TStringField;
    QItensCSOSN: TStringField;
    QItensCST_IPI: TStringField;
    upItens: TFDUpdateSQL;
    Panel6: TPanel;
    Panel7: TPanel;
    procedure BtnConsultarServicoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QConsNfeCalcFields(DataSet: TDataSet);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnEnviarEmailClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure BtnInutilizarClick(Sender: TObject);
    procedure BtnCancelamentoClick(Sender: TObject);
    procedure BtnConsultaNFeClick(Sender: TObject);
    procedure BtnEnviarClick(Sender: TObject);
    procedure ResetarNFe1Click(Sender: TObject);
    procedure QConsNfeAfterOpen(DataSet: TDataSet);
    procedure QConsNfeAfterClose(DataSet: TDataSet);
    procedure QCartasCalcFields(DataSet: TDataSet);
    procedure QCartasAfterScroll(DataSet: TDataSet);
    procedure QCartasAfterOpen(DataSet: TDataSet);
    procedure QCartasAfterClose(DataSet: TDataSet);
    procedure btnNovaCartaClick(Sender: TObject);
    procedure btnEditaCartaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnExcluirCartaClick(Sender: TObject);
    procedure btnEnviaCartaClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnImpCartaClick(Sender: TObject);
    procedure btnPeriodoClick(Sender: TObject);
    procedure DuplicarNota( COD_NF: Integer; INFO: STring );
    procedure D1Click(Sender: TObject);
    procedure AbreCartasNota;
    procedure CartasShow(Sender: TObject);
  private
    { Private declarations }
    procedure VerificaBotoes;
  public
    { Public declarations }
    RetConfigura: Boolean;
    procedure Corrige();
  end;

 function FrmGerenciamentoNFe: TFrmGerenciamentoNFe;

implementation

uses
  UDM, Ubibli1, UImprimeNotaFiscal, USendemail, UCartaCorrecao, UFrmStatusNfe,
  UNovoPrincipal;

var
  sAmbienteNfe: string;
  sSql: string;
  coluna: Integer;
{$R *.dfm}

function FrmGerenciamentoNFe: TFrmGerenciamentoNFe;
begin
   Result := TFrmGerenciamentoNFe( BuscaFormulario( TFrmGerenciamentoNFe, False ) );
end;

procedure TFrmGerenciamentoNFe.CartasShow(Sender: TObject);
begin
   AbreCartasNota;
end;

procedure TFrmGerenciamentoNFe.Corrige;
var
  Chave2, caminho, protocolo, chave: string;
  cod: Integer;
begin

  Chave2 := copy(trim(QConsNfeCHAVE2.AsString), 4,
    length(trim(QConsNfeCHAVE2.AsString)) - 3);
  caminho := dm.ACBrNFe1.Configuracoes.Arquivos.PathSalvar + '\' + Chave2 +
    '-nfe.xml';
  cod := QConsNfeCOD_NF.AsInteger;

  if not fileexists(caminho) then
  begin
    KDialog('XML não encontrado!');
    exit;
  end;

  dm.ACBrNFe1.NotasFiscais.Clear;
  dm.ACBrNFe1.NotasFiscais.LoadFromFile(caminho);
  dm.ACBrNFe1.WebServices.Consulta.NFeChave := trim(Chave2);
  dm.ACBrNFe1.WebServices.Consulta.Executar;
  if dm.ACBrNFe1.WebServices.Consulta.cStat = 101 then
  begin
    KDialog('NF-e costa como cancelada!' + #13 +
      dm.ACBrNFe1.WebServices.Consulta.XMotivo);
         dm.ACBrNFe1.NotasFiscais.GravarXML();
    exit;
  end;
  if dm.ACBrNFe1.WebServices.Consulta.cStat = 217 then
  begin
    KDialog('NF-e não consta na base de dados da SEFAZ');
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;
    dm.Limpa.close;
    dm.Limpa.Parambyname('CODNF').AsInteger := cod;
    dm.Limpa.ExecOrOpen;
    dm.Limpa.close;
    dm.IBTransaction.Commit;
    BtnOkClick(nil);
    exit;
  end;

  if dm.ACBrNFe1.WebServices.Consulta.cStat = 999 then
  begin
    KDialog('Erro desconhecido nota sera resetada!');
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;
    dm.Limpa.close;
    dm.Limpa.Parambyname('CODNF').AsInteger := cod;
    dm.Limpa.ExecOrOpen;
    dm.Limpa.close;
    dm.IBTransaction.Commit;
    BtnOkClick(nil);
    exit;
  end;


  if dm.ACBrNFe1.NotasFiscais.Items[0].Confirmada then
  begin
        dm.ACBrNFe1.NotasFiscais.GravarXML();
    protocolo := dm.ACBrNFe1.WebServices.Consulta.protocolo;
    chave := Chave2;
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;

    try
      try
        with dm.QConsulta do
        begin

          close;
          sql.Clear;
          sql.Text := 'UPDATE NOTA_FISCAL ' +
            'SET CHAVE_ACESSO_NFE = :CHAVE, PROTOCOLO_NFE = :PROTO ' +
            'WHERE COD_NF = :CODNF';
          Parambyname('chave').AsString := trim(chave);
          Parambyname('proto').AsString := trim(protocolo);
          Parambyname('codnf').AsInteger := cod;
          ExecOrOpen;
        end;
        dm.IBTransaction.Commit;
      except
        dm.IBTransaction.Rollback;
        KDialog('Erro gravando a Chave e o Protrocolo da NFe');
      end;
    finally
      dm.QConsulta.close;
    end;
    KDialog(inttostr(dm.ACBrNFe1.WebServices.Consulta.cStat) + ': ' +
      dm.ACBrNFe1.WebServices.Consulta.XMotivo);

    // KDialog('Consulta concluída com sucesso!' + #13 + 'NFe autorizada...');

  end
  else
  begin
    KDialog(inttostr(dm.ACBrNFe1.WebServices.Consulta.cStat) + ': ' +
      dm.ACBrNFe1.WebServices.Consulta.XMotivo);

  end;

end;

procedure TFrmGerenciamentoNFe.BtnConsultarServicoClick(Sender: TObject);
var
  T: TStrings;
begin
  dm.ACBrNFe1.WebServices.StatusServico.Executar;
  KDialog('Concluido:' + #13 + dm.ACBrNFe1.WebServices.StatusServico.XMotivo);
  T := TStringList.Create;
  T.Text := dm.ACBrNFe1.WebServices.StatusServico.RetornoWS;
  T.SaveToFile(ExtractFilePath(Application.ExeName) + '\UltimoRetorno.txt');
  T.Free;
end;

procedure TFrmGerenciamentoNFe.FormCreate(Sender: TObject);
begin
  sSql := QConsNfe.sql.Text;

  { busca parametros }
  RetConfigura := dm.ConfiguraNfe( dm.AcbrNfe1 )
end;

procedure TFrmGerenciamentoNFe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if IBTRNfe.Active then
    IBTRNfe.Commit;

  Action := caFree;
end;

procedure TFrmGerenciamentoNFe.QCartasAfterClose(DataSet: TDataSet);
begin
  btnNovaCarta.Enabled := true;
  btnEditaCarta.Enabled := false;
  btnExcluirCarta.Enabled := false;
  btnEnviaCarta.Enabled := false;
end;

procedure TFrmGerenciamentoNFe.QCartasAfterOpen(DataSet: TDataSet);
begin
  if QCartasCOD.IsNull then
  begin
    btnNovaCarta.Enabled := true;
    btnEditaCarta.Enabled := false;
    btnExcluirCarta.Enabled := false;
    btnEnviaCarta.Enabled := false;
  end
  else
  begin
    btnNovaCarta.Enabled := true;
    btnEditaCarta.Enabled := true;
    btnExcluirCarta.Enabled := true;
    btnEnviaCarta.Enabled := true and RetConfigura;
  end;
end;

procedure TFrmGerenciamentoNFe.QCartasAfterScroll(DataSet: TDataSet);
begin
  if QCartasCOD.IsNull then
  begin
    btnNovaCarta.Enabled := true;
    btnEditaCarta.Enabled := false;
    btnExcluirCarta.Enabled := false;
    btnEnviaCarta.Enabled := false;
  end
  else
  begin
    btnNovaCarta.Enabled := true;
    btnEditaCarta.Enabled := true;
    btnExcluirCarta.Enabled := true;
    btnEnviaCarta.Enabled := true and RetConfigura;
    btnImpCarta.Enabled := true;
  end;
end;

procedure TFrmGerenciamentoNFe.QCartasCalcFields(DataSet: TDataSet);
begin
  if (QCartasSTATUS_TRANSMITIDA.AsString = 'N') or
    (QCartasSTATUS_TRANSMITIDA.AsString = '') then
    QCartasSTATUS.AsString := '';
  if (QCartasSTATUS_TRANSMITIDA.AsString = 'S') then
    QCartasSTATUS.AsString := '';
  if (QCartasSTATUS_TRANSMITIDA.AsString = 'A') then
    QCartasSTATUS.AsString := '';

end;

procedure TFrmGerenciamentoNFe.QConsNfeAfterClose(DataSet: TDataSet);
begin
  QCartas.close;
end;

procedure TFrmGerenciamentoNFe.QConsNfeAfterOpen(DataSet: TDataSet);
begin
  if QConsNfeCOD_NF.IsNull then
    QCartas.close
  else
  begin
    QCartas.close;
    QCartas.sql.Text :=
      'select * from NOTA_FISCAL_CCE where COD_NF=:COD_NF order by SEQ desc';
    QCartas.Parambyname('COD_NF').AsInteger := QConsNfeCOD_NF.AsInteger;
    QCartas.Open;
  end;
end;

procedure TFrmGerenciamentoNFe.QConsNfeCalcFields(DataSet: TDataSet);
begin
  if trim(QConsNfeSTATUS_TRANSMITIDA.AsString) = 'S' then
    QConsNfeCALC_TRANSMITIDO.AsString := 'TRANSMITIDA OK'
  else
    QConsNfeCALC_TRANSMITIDO.AsString := '';
  if QConsNfeDEPEC.AsInteger = 1 then
    QConsNfeCALC_TRANSMITIDO.AsString := 'TRANS. DEPEC';

  if trim(QConsNfeSTATUS_CANCELADO.AsString) = 'S' then
    QConsNfeCALC_CANCELADO.AsString := 'CANCELADA'
  else
    QConsNfeCALC_CANCELADO.AsString := '';

  if trim(QConsNfeSTATUS_INUTILIZADO.AsString) = 'S' then
    QConsNfeCALC_INUTILIZADO.AsString := 'INUTILIZADO'
  else
    QConsNfeCALC_INUTILIZADO.AsString := '';

  if trim(QConsNfeSTATUS_EMAIL.AsString) = 'S' then
    QConsNfeCALC_EMAIL.AsString := 'EMAIL OK'
  else
    QConsNfeCALC_EMAIL.AsString := '';

  if QConsNfeRAZAO_FOR.IsNull then
    QConsNfeCALC_DESTINATARIO.AsString := QConsNfeNOME_CLI.AsString
  else
    QConsNfeCALC_DESTINATARIO.AsString := QConsNfeRAZAO_FOR.AsString;
end;

procedure TFrmGerenciamentoNFe.ResetarNFe1Click(Sender: TObject);
var
  Senha: String;
  codnota: Integer;
begin
  Senha := inputBox('Senha programação', 'Digite a senha de programação', '');
  if Senha <> '' then
  begin
    if Senha = 'maicon020288' then
    begin
      codnota := QConsNfeCOD_NF.AsInteger;
      if dm.IBTransaction.Active then
        dm.IBTransaction.Commit;
      dm.IBTransaction.StartTransaction;
      dm.Limpa.close;
      dm.Limpa.Parambyname('CODNF').AsInteger := codnota;
      dm.Limpa.ExecOrOpen;
      dm.Limpa.close;
      dm.IBTransaction.Commit;
      BtnOkClick(self);
    end
    else
      KDialog('Senha incorreta!');
  end;
end;

procedure TFrmGerenciamentoNFe.VerificaBotoes;
begin
    btnStatus.Enabled := RetConfigura;
    btnConsulta.Enabled := RetConfigura;
    btnValida.Enabled := RetConfigura;
    btnInutiliza.Enabled := RetConfigura;
    btnCancela.Enabled := RetConfigura;
    btnEnviaCarta.Enabled := RetConfigura;
end;

procedure TFrmGerenciamentoNFe.D1Click(Sender: TObject);
var
   Just: String;
begin
   if not QConsNfeCOD_NF.IsNull then
      begin
         Just := InputBox( 'Nota de estorno', 'Justificativa de estorno', '' );
         if Just <> '' then
            begin
               DuplicarNota( QConsNfeCOD_NF.AsInteger, Just );
            end
         else
            exit;

      end;

end;

procedure TFrmGerenciamentoNFe.DBGrid1DblClick(Sender: TObject);
begin
  if not QConsNfeCOD_NF.IsNull then
    Paginas.ActivePageIndex := 1;
end;

procedure TFrmGerenciamentoNFe.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  { If Odd(QConsNfe.RecNo) then
    begin
    DBGrid1.Canvas.Brush.Color:= $00CEFFFF;
    end
    else
    begin
    DBGrid1.Canvas.Brush.Color:= clWhite;
    end; }
  { if trim(QConsNfeSTATUS_TRANSMITIDA.AsString) = 'S' then
    begin
    DBGrid1.Canvas.Font.Color := clBlue;
    DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.columns[DataCol].field, State);
    end;
    if QConsNfeDEPEC.AsInteger = 1 then
    begin
    DBGrid1.Canvas.Font.Color := clGreen;
    DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.columns[DataCol].field, State);
    end;
    if trim(QConsNfeSTATUS_CANCELADO.AsString) = 'S' then
    begin
    DBGrid1.Canvas.Font.Color := clRed;
    DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.columns[DataCol].field, State);
    end; }

  if Column.field.FieldName = 'STATUS_GERAL' then // o nome do campo
  begin
    DBGrid1.Canvas.FillRect(Rect);
    if not(QConsNfeSTATUS_TRANSMITIDA.AsString = 'S') then
    begin
      Imagens.Draw(DBGrid1.Canvas, Rect.Left + 5, Rect.Top + 1, 3);
      if QConsNfeDEPEC.AsInteger = 1 then
        Imagens.Draw(DBGrid1.Canvas, Rect.Left + 5 + 18 + 18, Rect.Top + 1, 6);
    end
    else
    begin
      if QConsNfeSTATUS_TRANSMITIDA.AsString = 'S' then
        Imagens.Draw(DBGrid1.Canvas, Rect.Left + 5, Rect.Top + 1, 1);
      if QConsNfeSTATUS_CANCELADO.AsString = 'S' then
        Imagens.Draw(DBGrid1.Canvas, Rect.Left + 5 + 18 + 18, Rect.Top + 1, 0);
      if QConsNfeSTATUS_EMAIL.AsString = 'S' then
        Imagens.Draw(DBGrid1.Canvas, Rect.Left + 5 + 18, Rect.Top + 1, 2);
      if QConsNfeCORRECAO.AsString = 'S' then
        Imagens.Draw(DBGrid1.Canvas, Rect.Left + 5 + 18 + 18 + 18,
          Rect.Top + 1, 4);
      if (trim(QConsNfeCHAVE_ACESSO_NFE.AsString) = '') and
        (trim(QConsNfeCHAVE2.AsString) <> '') then
        Imagens.Draw(DBGrid1.Canvas, Rect.Left + 5 + 18 + 18 + 18 + 18,
          Rect.Top + 1, 5);

    end;
  end;
  { DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top,Column.Field.AsString); }

end;

procedure TFrmGerenciamentoNFe.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Column.field.FieldName = 'STATUS' then // o nome do campo
  begin
    DBGrid2.Canvas.FillRect(Rect);
    if QCartasSTATUS_TRANSMITIDA.AsString = 'A' then
      Imagens.Draw(DBGrid2.Canvas, Rect.Left + 5, Rect.Top + 1, 1);
    if QCartasSTATUS_TRANSMITIDA.AsString = 'S' then
      Imagens.Draw(DBGrid2.Canvas, Rect.Left + 5, Rect.Top + 1, 0);
    if QCartasSTATUS_TRANSMITIDA.AsString = 'N' then
      Imagens.Draw(DBGrid2.Canvas, Rect.Left + 5, Rect.Top + 1, 3);
    if QCartasSTATUS_TRANSMITIDA.AsString = 'C' then
      Imagens.Draw(DBGrid2.Canvas, Rect.Left + 5, Rect.Top + 1, 4);
  end;
end;

procedure TFrmGerenciamentoNFe.DuplicarNota(COD_NF: Integer; INFO: STring);
var
   CodigoNF: Integer;
   NumeroNF: Integer;
begin
//
   if DM.IBTransaction.Active then
       dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
   QAux.Close;
   QAux.SQL.Text := 'SELECT GEN_ID(GNT_COD_NOTA_FISCAL, 1) Novo FROM RDB$Connection';
   QAux.Open;
   CodigoNF := QAux.FieldByName( 'Novo' ).AsInteger;
   Qaux.Close;
   NumeroNF := Prxcod2( iEmp, TR2, IBSQL1 );
   QDuplicaNota.Close;
   QDuplicaNota.ParamByName('NOVO_COD' ).AsInteger := CodigoNF;
   QDuplicaNota.ParamByName('NUMERO_NOTA' ).AsInteger := NumeroNF;
   QDuplicaNota.ParamByName('INFOAD' ).AsString := INFO;
   QDuplicaNota.ParamByName('COD_NF' ).AsInteger := COD_NF;
   QDuplicaNota.ExecOrOpen;
   QDuplicaItens.ParamByName( 'NOVO_CODIGO' ).AsInteger := CodigoNF;
   QDuplicaItens.ParamByName( 'COD_NF' ).AsInteger := COD_NF;
   QDuplicaItens.ExecOrOpen;
   QItens.Close;
   QItens.ParamByName( 'COD_NF' ).AsInteger := CodigoNF;
   QItens.Open;
   QItens.First;
   while not QItens.Eof do
       begin
           QItens.Edit;
           if Copy( QItensCOD_CFO.AsString, 1, 1 ) = '5' then
               begin
                  QItensCOD_CFO.AsInteger := 1102;
               end
           else
           if Copy( QItensCOD_CFO.AsString, 1, 1 ) = '6' then
               begin
                  QItensCOD_CFO.AsInteger := 2102;
               end;
           QItens.Post;

           QItens.Next;
       end;
      dm.IBTransaction.Commit;
   except
        on E:exception do
          begin
             AlertaCad( 'Erro ao duplicar a nota' + #13 + E.Message );
             dm.IBTransaction.Rollback;
          end;
   end;

   BtnOk.Click;

end;

procedure TFrmGerenciamentoNFe.btnEditaCartaClick(Sender: TObject);
begin
  if QConsNfeCOD_NF.IsNull then
  begin
    KDialog('NFe não Selecionada');
    exit;
  end;
  if QConsNfeCHAVE_ACESSO_NFE.AsString = '' then
  begin
    KDialog('NFe sem chave de acesso!');
    exit;
  end;
  if (not QCartasPROTOCOLO.IsNull) and
    ((QCartasSTATUS_TRANSMITIDA.AsString = 'A') or
    (QCartasSTATUS_TRANSMITIDA.AsString = 'C')) then
  begin
    KDialog('Carta de correção ja foi envianda não pode ser alterada!');
    exit;
  end;
  if QCartasCOD.IsNull then
  begin
    KDialog('Carta não selecionada!');
    exit;
  end;

  try
    Application.CreateForm(TfrmCadCartaCorrecao, frmCadCartaCorrecao);
    frmCadCartaCorrecao.Data.Date := QCartasDATA.AsDateTime;
    frmCadCartaCorrecao.Correcao.Lines.Text := QCartasCORRECAO.AsString;
    frmCadCartaCorrecao.ShowModal;
    if not frmCadCartaCorrecao.Cancelado then
    begin
      if frmCadCartaCorrecao.Correcao.Lines.Text <> '' then
      begin
        ICartas.close;
        ICartas.sql.Clear;
        ICartas.sql.Text :=
          'UPDATE NOTA_FISCAL_CCE SET DATA=:DATA, CORRECAO=:CORRECAO' +
          ' WHERE COD=:COD';
        ICartas.Parambyname('DATA').AsDate := frmCadCartaCorrecao.Data.Date;
        ICartas.Parambyname('CORRECAO').AsString :=
          frmCadCartaCorrecao.Correcao.Lines.Text;
        ICartas.Parambyname('COD').AsInteger := QCartasCOD.AsInteger;
        ICartas.ExecOrOpen;
        ICartas.close;
        IBTRNfe.CommitRetaining;
        QCartas.close;
        QCartas.Parambyname('COD_NF').AsInteger := QConsNfeCOD_NF.AsInteger;
        QCartas.Open;
      end;
    end;
  finally
    FreeAndNil(frmCadCartaCorrecao);
  end;
end;

procedure TFrmGerenciamentoNFe.btnEnviaCartaClick(Sender: TObject);
var
  CODD: Integer;
begin
  if QConsNfeCOD_NF.IsNull then
  begin
    KDialog('NFe não Selecionada');
    exit;
  end;
  if QConsNfeCHAVE_ACESSO_NFE.AsString = '' then
  begin
    KDialog('NFe sem chave de acesso!');
    exit;
  end;
  if (not QCartasPROTOCOLO.IsNull) and
    ((QCartasSTATUS_TRANSMITIDA.AsString = 'A') or
    (QCartasSTATUS_TRANSMITIDA.AsString = 'C')) then
  begin
    KDialog('Carta de correção ja foi envianda não pode ser alterada!');
    exit;
  end;
  if QCartasCOD.IsNull then
  begin
    KDialog('Carta não selecionada!');
    exit;
  end;
  EnviarrCarta(QCartasCOD.AsInteger, QCartasCOD_NF.AsInteger);
  CODD := QConsNfeCOD_NF.AsInteger;
  if IBTRNfe.Active then
    IBTRNfe.Commit;
  IBTRNfe.StartTransaction;
  with QConsNfe do
  begin
    close;
    sql.Clear;
    sql.Text := sSql;
    sql.Add(' WHERE N.DATA_EMISSAO_NF BETWEEN :DATAINI AND :DATAFIN ' +
      ' AND N.CODIFICACAO_FISCAL = ' + #39 + '55' + #39 +
      ' ORDER BY N.DATA_EMISSAO_NF, N.COD_NF');
    Parambyname('dataini').AsDate := EdtDataIni.Date;
    Parambyname('datafin').AsDate := EdtDataFin.Date;
    Open;
  end;
  QConsNfe.Locate('COD_NF', CODD, []);
end;

procedure TFrmGerenciamentoNFe.btnExcluirCartaClick(Sender: TObject);
begin
  if QConsNfeCOD_NF.IsNull then
  begin
    KDialog('NFe não Selecionada');
    exit;
  end;
  if QConsNfeCHAVE_ACESSO_NFE.AsString = '' then
  begin
    KDialog('NFe sem chave de acesso!');
    exit;
  end;
  if (not QCartasPROTOCOLO.IsNull) and
    ((QCartasSTATUS_TRANSMITIDA.AsString = 'A') or
    (QCartasSTATUS_TRANSMITIDA.AsString = 'C')) then
  begin
    KDialog('Carta de correção ja foi envianda não pode ser alterada!');
    exit;
  end;
  if QCartasCOD.IsNull then
  begin
    KDialog('Carta não selecionada!');
    exit;
  end;
  ICartas.close;
  ICartas.sql.Clear;
  ICartas.sql.Text := 'DELETE FROM NOTA_FISCAL_CCE WHERE COD=:COD';
  ICartas.Parambyname('COD').AsInteger := QCartasCOD.AsInteger;
  ICartas.ExecOrOpen;
  ICartas.close;
  IBTRNfe.CommitRetaining;
  QCartas.close;
  QCartas.Parambyname('COD_NF').AsInteger := QConsNfeCOD_NF.AsInteger;
  QCartas.Open;
end;

procedure TFrmGerenciamentoNFe.BtnOkClick(Sender: TObject);
var
   vNF: Integer;
begin
  coluna := 0;
  if IBTRNfe.Active then
     begin
       vNF := QConsNfeCOD_NF.AsInteger;
       IBTRNfe.Commit;
     end;
  IBTRNfe.StartTransaction;
  with QConsNfe do
  begin
    close;
    sql.Clear;
    sql.Text := sSql;
    sql.Add(' WHERE N.DATA_EMISSAO_NF BETWEEN :DATAINI AND :DATAFIN ' +
      ' AND N.CODIFICACAO_FISCAL = ' + #39 + '55' + #39 +
      ' AND COD_EMP=:CODEMP ORDER BY N.DATA_EMISSAO_NF, N.COD_NF');
    Parambyname('dataini').AsDate := EdtDataIni.Date;
    Parambyname('datafin').AsDate := EdtDataFin.Date;
    Parambyname('CODEMP').AsInteger := iEmp;
    Open;
    QConsNfe.Locate( 'COD_NF', vNF, [] );
    Paginas.ActivePageIndex := 0;
  end;
end;

procedure TFrmGerenciamentoNFe.BtnSairClick(Sender: TObject);
begin
   if Parent is TcxTabSheet then
      frmMenu.FTDI.CloseTabOfForm( TFormClass( Self.ClassType ) )
   else
      close;
end;

procedure TFrmGerenciamentoNFe.FormShow(Sender: TObject);
begin
  EdtDataIni.Date := Date;
  EdtDataFin.Date := Date;
  EdtDataIni.SetFocus;
end;

procedure TFrmGerenciamentoNFe.btnNovaCartaClick(Sender: TObject);
Var
  SEQQ: Integer;

begin
  if QConsNfeCOD_NF.IsNull then
  begin
    KDialog('NFe não Selecionada');
    exit;
  end;
  if QConsNfeCHAVE_ACESSO_NFE.AsString = '' then
  begin
    KDialog('NFe sem chave de acesso!');
    exit;
  end;
  try
    Application.CreateForm(TfrmCadCartaCorrecao, frmCadCartaCorrecao);
    if not QCartas.IsEmpty then
    begin
      ICartas.close;
      ICartas.sql.Clear;
      ICartas.sql.Text :=
        'select MAX( SEQ ) from NOTA_FISCAL_CCE where COD_NF=:COD_NF';
      ICartas.Parambyname('COD_NF').AsInteger := QConsNfeCOD_NF.AsInteger;
      ICartas.Open;
      QCartas.Locate('SEQ', ICartas.fieldbyname('MAX').AsInteger, []);
      frmCadCartaCorrecao.Correcao.Lines.Add( 'CCe:' + QCartasSEQ.AsString + ' -> ' +
        QCartasCORRECAO.AsString);
      ICartas.close;
    end;
    frmCadCartaCorrecao.ShowModal;
    if not frmCadCartaCorrecao.Cancelado then
    begin
      if frmCadCartaCorrecao.Correcao.Lines.Text <> '' then
      begin
        ICartas.close;
        ICartas.sql.Clear;
        ICartas.sql.Text :=
          'select MAX( SEQ ) from NOTA_FISCAL_CCE where COD_NF=:COD_NF';
        ICartas.Parambyname('COD_NF').AsInteger := QConsNfeCOD_NF.AsInteger;
        ICartas.Open;
        if ICartas.IsEmpty then
          SEQQ := 1
        else
        begin
          SEQQ := ICartas.fieldbyname('MAX').AsInteger + 1;
          if SEQQ > 1 then
            KDialog('Esta nova carta ira substituir a anterior!');
        end;
        ICartas.close;
        ICartas.sql.Clear;
        ICartas.sql.Text := 'Insert into NOTA_FISCAL_CCE(COD_NF,SEQ,CHAVE,' +
          'STATUS_TRANSMITIDA, DATA, CORRECAO) values( :COD_NF,:SEQ,:CHAVE,' +
          ':STATUS_TRANSMITIDA, :DATA, :CORRECAO)';
        ICartas.Parambyname('SEQ').AsInteger := SEQQ;
        ICartas.Parambyname('COD_NF').AsInteger := QConsNfeCOD_NF.AsInteger;
        ICartas.Parambyname('CHAVE').AsString :=
          QConsNfeCHAVE_ACESSO_NFE.AsString;
        ICartas.Parambyname('STATUS_TRANSMITIDA').AsString := 'N';
        ICartas.Parambyname('DATA').AsDate := frmCadCartaCorrecao.Data.Date;
        ICartas.Parambyname('CORRECAO').AsString :=
          frmCadCartaCorrecao.Correcao.Lines.Text;
        ICartas.ExecOrOpen;
        ICartas.close;
        IBTRNfe.CommitRetaining;
        QCartas.close;
        QCartas.Parambyname('COD_NF').AsInteger := QConsNfeCOD_NF.AsInteger;
        QCartas.Open;
      end;
    end;
  finally
    FreeAndNil(frmCadCartaCorrecao);
  end;
end;

procedure TFrmGerenciamentoNFe.BtnEnviarEmailClick(Sender: TObject);
var
  sCaminhoXML, sCaminhoPDF, sEmail: string;
  tempdata: string;
  PDFCCe: string;
  SXMLCCe: String;
begin
   AbreCartasNota;
  if not(QConsNfe.State = dsbrowse) then
    exit;

  if trim(QConsNfeSTATUS_TRANSMITIDA.AsString) = 'N' then
  begin
    KDialog('NFe não transmitida');
    exit;
  end;

  if trim(QConsNfeCHAVE_ACESSO_NFE.AsString) = '' then
  begin
    KDialog('NFe sem chave de acesso');
    exit;
  end;

  if trim(QConsNfePROTOCOLO_NFE.AsString) = '' then
  begin
    KDialog('NFe sem protocolo');
    exit;
  end;

  iCodigoNfe := QConsNfeCOD_NF.AsInteger;

  sCaminhoXMl :=
  tpath.Combine(
  DM.ACBrNFe1.Configuracoes.Arquivos.GetPathNFe(
  QConsNfeDATA_EMISSAO_NF.AsDateTime, sCNPJEmpresa, 55 ) ,
   trim(QConsNfeCHAVE_ACESSO_NFE.AsString) + '-nfe.xml' );
  sCaminhoPDF :=  TPath.Combine( dm.ACBrNFeDANFEFR1.PathPDF,
    trim(QConsNfeCHAVE_ACESSO_NFE.AsString) + '-nfe.pdf' );

  if not fileexists(sCaminhoXML) then
  begin
    sCaminhoXML := dm.ACBrNFe1.Configuracoes.Arquivos.PathSalvar + '\' +
      trim(QConsNfeCHAVE_ACESSO_NFE.AsString) + '-nfe.xml';
    if not fileexists(sCaminhoXML) then
    begin
      KDialog('XML da NFe não encontrada');
      exit;
    end;
  end;

  if not fileexists(sCaminhoPDF) then
     begin
        DM.ACBrNFe1.NotasFiscais.ImprimirPDF;
     end;
  if not fileexists(sCaminhoPDF) then
      begin
        KDialog('PDF da NFe não encontrada');
        exit;
      end;
  dm.ACBrNFe1.NotasFiscais.Clear;
  dm.ACBrNFe1.NotasFiscais.LoadFromFile(sCaminhoXML);
  { verifica se existe email cadastrado no cliente ou fornecedor }
  if not(QConsNfeCOD_CLI.IsNull) then
    sEmail := trim(dm.RetornaStringTabela('email_cli', 'cliente', 'cod_cli',
      QConsNfeCOD_CLI.AsInteger))
  else if not(QConsNfeCOD_FOR.IsNull) then
    sEmail := trim(dm.RetornaStringTabela('email_for', 'fornecedor', 'cod_for',
      QConsNfeCOD_FOR.AsInteger))
  else
    sEmail := '';

  Application.CreateForm(TFrmSendEmail, FrmSendEmail);
  FrmSendEmail.EdtPara.Text := sEmail;
  FrmSendEmail.LbAnexos.Items.Add(sCaminhoXML);
  FrmSendEmail.LbAnexos.Items.Add(sCaminhoPDF);
  if (trim(QConsNfeCORRECAO.AsString) = 'S') then
  begin
    QCartas.First;
    SXMLCCe := TPath.Combine(
    DM.ACBrNFe1.Configuracoes.Arquivos.GetPathEvento( teCCe, sCNPJEmpresa, QCartasDATA.AsDateTime ),
    '110110' + trim(QConsNfeCHAVE_ACESSO_NFE.AsString) + formatastringD(
      qcartasSeq.asstring, '2', '0' )	  + '-procEventoNFe.xml' );
    PDFCCe := TPath.Combine( dm.ACBrNFeDANFEFR1.PathPDF , '110110' +
      trim(QConsNfeCHAVE_ACESSO_NFE.AsString) + formatastringD(
      qcartasSeq.asstring, '2', '0' )	  + '-procEventoNFe.pdf' );
    if not fileexists(PDFCCe) then
    begin
      KDialog('PDF CC-e não encontrado. Sera enviado sem o mesmo!',
        'KNFe - Envio por e-mail', tdtInfo);
    end
    else
    begin
      FrmSendEmail.CCe := true;
      FrmSendEmail.LbAnexos.Items.Add(PDFCCe);
      FrmSendEmail.LbAnexos.Items.Add(SXMLCCe);
    end;
  end;

  FrmSendEmail.ShowModal;

  BtnOk.Click;

end;

procedure TFrmGerenciamentoNFe.BtnImprimirClick(Sender: TObject);
var
  sCaminhoArquivo: string;
  tempdata: string;
begin

  { verifica se a nota foi transmitida e tem protocolo e chave }
  if trim(QConsNfeSTATUS_TRANSMITIDA.AsString) = 'N' then
  begin
    KDialog('NFe não transmitida');
    exit;
  end;

  if trim(QConsNfeCHAVE_ACESSO_NFE.AsString) = '' then
  begin
    KDialog('NFe sem chave de acesso');
    exit;
  end;

  if trim(QConsNfePROTOCOLO_NFE.AsString) = '' then
  begin
    KDialog('NFe sem protocolo');
    exit;
  end;


  sCaminhoArquivo :=
  tpath.Combine(
  DM.ACBrNFe1.Configuracoes.Arquivos.GetPathNFe(
  QConsNfeDATA_EMISSAO_NF.AsDateTime, sCNPJEmpresa, 55 ) ,
   trim(QConsNfeCHAVE_ACESSO_NFE.AsString) + '-nfe.xml' );

    if not fileexists(sCaminhoArquivo) then
    begin
      sCaminhoArquivo := dm.ACBrNFe1.Configuracoes.Arquivos.PathSalvar + '\' +
        trim(QConsNfeCHAVE_ACESSO_NFE.AsString) + '-nfe.xml';
      if not fileexists(sCaminhoArquivo) then
      begin
        KDialog('NFe não encontrada');
        exit;
      end;
    end;

    dm.ACBrNFe1.NotasFiscais.Clear;
    dm.ACBrNFe1.NotasFiscais.LoadFromFile(sCaminhoArquivo);

    dm.ACBrNFe1.NotasFiscais.Imprimir;
    dm.ACBrNFe1.NotasFiscais.ImprimirPDF;
  BtnOk.Click;
end;

procedure TFrmGerenciamentoNFe.BtnInutilizarClick(Sender: TObject);
var
  sModelo, sSerie, sAno, sNumeroInicial, sNumeroFinal: String;
  sCNPJ: string;
begin
  sCNPJ := RetiraCaracter(dm.RetornaStringTabela('cnpj_emp', 'empresa',
    'cod_emp', iEmp));
  sModelo := '55';

  if not(InputQuery('WebServices Inutilização ', 'Ano', sAno)) then
    exit;
  if not(InputQuery('WebServices Inutilização ', 'Serie', sSerie)) then
    exit;
  if not(InputQuery('WebServices Inutilização ', 'Número Inicial',
    sNumeroInicial)) then
    exit;
  if not(InputQuery('WebServices Inutilização ', 'Número Final',
    sNumeroFinal)) then
    exit;
  if not(InputQuery('WebServices Inutilização ', 'Justificativa',
    sJustifNFe)) then
    exit;

  iCodigoNfe := QConsNfeCOD_NF.AsInteger;

  dm.ACBrNFe1.WebServices.Inutiliza(sCNPJ, sJustifNFe, StrToInt(sAno),
    StrToInt(sModelo), StrToInt(sSerie), StrToInt(sNumeroInicial),
    StrToInt(sNumeroFinal));
  KDialog('Numeração Iutilizada');
  BtnOk.Click;
end;

procedure TFrmGerenciamentoNFe.btnImpCartaClick(Sender: TObject);
var
  sCaminhoXML: String;
  sCaminhoXMLEvento: String;
//  CCeImp1: TCCeImp;
  PastaPDFs: String;
begin

  sCaminhoXML := tpath.Combine(
      DM.ACBrNFe1.Configuracoes.Arquivos.GetPathNFe(
     QConsNfeDATA_EMISSAO_NF.AsDateTime, sCNPJEmpresa, 55 ) ,
   trim(QConsNfeCHAVE_ACESSO_NFE.AsString) + '-nfe.xml' );
  sCaminhoXMLEvento := tpath.Combine(
    dm.ACBrNFe1.Configuracoes.Arquivos.GetPathEvento( teCCe, sCNPJEmpresa, QCartasDATA.AsDateTime),
       '110110' + trim(QConsNfeCHAVE_ACESSO_NFE.AsString) +
    FormataStringD( QCartasSEQ.AsString, '2', '0' ) + '-ProcEventoNFe.xml' );
  if not fileexists(sCaminhoXML) then
  begin
    KDialog('Arquivo XML NFe não encontrado!', 'KNFe - Impressão CCe', tdtErro);
    exit;
  end;
  if not fileexists(sCaminhoXMLEvento) then
  begin
    KDialog('Arquivo XML NFe não encontrado!', 'KNFe - Impressão CCe', tdtErro);
    exit;
  end;
  PastaPDFs := dm.ACBrNFe1.Configuracoes.Arquivos.PathNFe + '\PDFsEventos\';
  if not DirectoryExists(PastaPDFs) then
  begin
    ForceDirectories(PastaPDFs);
  end;


  try
     dm.ACBrNFe1.NotasFiscais.Clear;
      dm.ACBrNFe1.NotasFiscais.LoadFromFile( sCaminhoXML );

      dm.ACBrNFeDANFEFR1.FastFileEvento := ExtractFilePath( Application.ExeName ) +
      '\Report\EVENTOS.fr3';
      dm.ACBrNFe1.EventoNFe.Evento.Clear;
      dm.ACBrNFe1.EventoNFe.LerXML( sCaminhoXMLEvento);
      dm.ACBrNFe1.ImprimirEvento;
      dm.ACBrNFe1.ImprimirEventoPDF;

  except
    // Tratamento
    KDialog('Erro na impressão da CCe', 'KNFe - Impressão CCe', tdtErro);
  end;
  // tps_PDF ou tps_Print

end;

procedure TFrmGerenciamentoNFe.AbreCartasNota;
begin
  if QConsNfeCOD_NF.IsNull then
    QCartas.close
  else
  begin
    QCartas.close;
    QCartas.sql.Text :=
      'select * from NOTA_FISCAL_CCE where COD_NF=:COD_NF order by SEQ desc';
    QCartas.Parambyname('COD_NF').AsInteger := QConsNfeCOD_NF.AsInteger;
    QCartas.Open;
  end;

end;

procedure TFrmGerenciamentoNFe.btnPeriodoClick(Sender: TObject);
var
  tempdata: string;
  sCaminhoXML: string;
  sCaminhoPDF: String;
  sEmail: string;
begin
  if not QConsNfe.IsEmpty then
  begin
    Application.CreateForm(TFrmSendEmail, FrmSendEmail);
    QConsNfe.First;
    while not QConsNfe.Eof do
    begin
      iCodigoNfe := QConsNfeCOD_NF.AsInteger;

      tempdata := formatdatetime('yyyy', QConsNfeDATA_EMISSAO_NF.AsDateTime) +
        formatdatetime('mm', QConsNfeDATA_EMISSAO_NF.AsDateTime);
      { verifica se o arquivo xml da nota existe no caminho especificado }
      sCaminhoXML := tpath.Combine(
            DM.ACBrNFe1.Configuracoes.Arquivos.GetPathNFe(
            QConsNfeDATA_EMISSAO_NF.AsDateTime, sCNPJEmpresa, 55 ) ,
             trim(QConsNfeCHAVE_ACESSO_NFE.AsString) + '-nfe.xml' );
      sCaminhoPDF := TPath.Combine( dm.ACBrNFeDANFEFR1.PathPDF,
             trim(QConsNfeCHAVE_ACESSO_NFE.AsString) + '-nfe.pdf' );
      FrmSendEmail.LbAnexos.Items.Add(sCaminhoXML);
      FrmSendEmail.LbAnexos.Items.Add(sCaminhoPDF);
      QConsNfe.Next;

    end;
    sEmail := trim(dm.RetornaStringTabela('EMAIL_CONTADOR', 'EMPRESA', 'COD_EMP',
      iEmp));
    FrmSendEmail.EdtPara.Text := sEmail;
    FrmSendEmail.ShowModal;
  end;

end;

procedure TFrmGerenciamentoNFe.BtnCancelamentoClick(Sender: TObject);
var
  sCaminhoArquivo: string;
  tempdata: string;
begin
  { verifica se a nota foi transmitida e tem protocolo e chave }
  if trim(QConsNfeSTATUS_TRANSMITIDA.AsString) = 'N' then
  begin
    KDialog('NFe não transmitida');
    exit;
  end;

  if trim(QConsNfeSTATUS_CANCELADO.AsString) = 'S' then
  begin
    KDialog('NFe Cancelada');
    exit;
  end;

  if trim(QConsNfeCHAVE_ACESSO_NFE.AsString) = '' then
  begin
    KDialog('NFe sem chave de acesso');
    exit;
  end;

  if trim(QConsNfePROTOCOLO_NFE.AsString) = '' then
  begin
    KDialog('NFe sem protocolo');
    exit;
  end;

  iCodigoNfe := QConsNfeCOD_NF.AsInteger;

  sCaminhoArquivo :=
  tpath.Combine(
  DM.ACBrNFe1.Configuracoes.Arquivos.GetPathNFe(
  QConsNfeDATA_EMISSAO_NF.AsDateTime, sCNPJEmpresa, 55 ) ,
   trim(QConsNfeCHAVE_ACESSO_NFE.AsString) + '-nfe.xml' );

  if not fileexists(sCaminhoArquivo) then
  begin


    sCaminhoArquivo :=  tpath.Combine(
     DM.ACBrNFe1.Configuracoes.Arquivos.GetPathNFe(
     QConsNfeDATA_EMISSAO_NF.AsDateTime, sCNPJEmpresa, 55 ) ,
      trim(QConsNfeCHAVE_ACESSO_NFE.AsString) + '-nfe.xml' );
    if not fileexists(sCaminhoArquivo) then
    begin
      KDialog('NFe não encontrada');
      exit;
    end;
  end;
  if not KDialog( 'Tem certeza que deseja cancelar esta nota?', 'Cancelamento de NFe', tdtPergunta)  then
     Exit;
  dm.ACBrNFe1.NotasFiscais.Clear;
  dm.ACBrNFe1.NotasFiscais.LoadFromFile(sCaminhoArquivo);
  sJustifNFe := 'NOTA FISCAL COM ERRO';

  // dm.ACBrNFe1.Cancelamento(sJustifNFe);
  try
    dm.ACBrNFe1.EventoNFe.Evento.Clear;
    // dm.ACBrNFe1.EventoNFe.idLote := 1;
    with dm.ACBrNFe1.EventoNFe.Evento.Add do
    begin
      infEvento.dhEvento := now;
      infEvento.tpEvento := teCancelamento;
      infEvento.detEvento.xJust := sJustifNFe;
    end;
    if (frmStatusNfe = nil) then
      frmStatusNfe := TfrmStatusNfe.Create(Application);
    frmStatusNfe.lblStatus.Caption := 'Enviando cancelamento de NFe...';
    frmStatusNfe.Show;
    frmStatusNfe.BringToFront;
    dm.ACBrNFe1.Configuracoes.Geral.Salvar := True;
    if dm.ACBrNFe1.EnviarEvento(1) then
    begin
      dm.ACBrNFe1.Configuracoes.Geral.Salvar := False;
      if dm.ACBrNFe1.WebServices.EnvEvento.cStat = 128 then
      begin
        if dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0]
          .RetInfEvento.cStat = 135 then
            begin
               dm.ACBrNFe1.EventoNFe.Evento.Clear;
               dm.ACBrNFe1.NotasFiscais.Clear;
               dm.ACBrNFe1.NotasFiscais.LoadFromFile(sCaminhoArquivo);
               dm.ACBrNFe1.WebServices.Consulta.NFeChave :=
                  dm.ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.chNFe;
               if dm.ACBrNFe1.WebServices.Consulta.Executar then
                  begin
                     if dm.ACBrNFe1.WebServices.Consulta.cStat = 101 then
                        begin
                           dm.AtualizaStatusNfe(iCodigoNfe, 'STATUS_CANCELADO', sJustifNFe)
                        end;
                  end;
            end
        else
          KDialog(dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.
            Items[0].RetInfEvento.XMotivo);
      end;

      frmStatusNfe.close;
    end;

  except
    frmStatusNfe.close;
    KDialog(inttostr(dm.ACBrNFe1.WebServices.EnvEvento.cStat) + ': ' +
      dm.ACBrNFe1.WebServices.EnvEvento.Msg);
    exit;
  end;


  // if dm.ACBrNFe1.WebServices.Cancelamento.cStat = 101 then //135

  // KDialog( IntToStr( dm.ACBrNFe1.WebServices.EnvEvento.cStat) + ': ' + dm.ACBrNFe1.WebServices.EnvEvento.Msg);
  // KDialog(dm.ACBrNFe1.WebServices.Cancelamento.Protocolo);
  BtnOk.Click;
end;

procedure TFrmGerenciamentoNFe.BtnConsultaNFeClick(Sender: TObject);
var
  sCaminhoArquivo: string;
  tempdata: string;
begin
  if (trim(QConsNfeCHAVE_ACESSO_NFE.AsString) = '') and
    (trim(QConsNfePROTOCOLO_NFE.AsString) = '') and
    (trim(QConsNfeCHAVE2.AsString) <> '') then
  Begin
    // KDialog( 'NFe danificada será corrigida!');
    Corrige;
    BtnOkClick(nil);
    exit;
  end;
  { verifica se a nota foi transmitida e tem protocolo e chave }
  if trim(QConsNfeCHAVE_ACESSO_NFE.AsString) = '' then
  begin
    KDialog('NFe sem chave de acesso');
    exit;
  end;

  if trim(QConsNfePROTOCOLO_NFE.AsString) = '' then
  begin
    KDialog('NFe sem protocolo');
    exit;
  end;

  { verifica se o arquivo xml da nota existe no caminho especificado }
  sCaminhoArquivo :=
  tpath.Combine(
  DM.ACBrNFe1.Configuracoes.Arquivos.GetPathNFe(
  QConsNfeDATA_EMISSAO_NF.AsDateTime, sCNPJEmpresa, 55 ) ,
   trim(QConsNfeCHAVE_ACESSO_NFE.AsString) + '-nfe.xml' );

  if not fileexists(sCaminhoArquivo) then
  begin
    sCaminhoArquivo := dm.ACBrNFe1.Configuracoes.Arquivos.PathSalvar + '\' +
      trim(QConsNfeCHAVE_ACESSO_NFE.AsString) + '-nfe.xml';
    if not fileexists(sCaminhoArquivo) then
    begin
      KDialog('NFe não encontrada');
      exit;
    end;
  end;

  dm.ACBrNFe1.NotasFiscais.Clear;
  dm.ACBrNFe1.NotasFiscais.LoadFromFile(sCaminhoArquivo);
  dm.ACBrNFe1.WebServices.Consulta.NFeChave :=
    trim(QConsNfeCHAVE_ACESSO_NFE.AsString);
  dm.ACBrNFe1.WebServices.Consulta.Executar;

  if dm.ACBrNFe1.WebServices.Consulta.cStat = 101 then
    if QConsNfeSTATUS_CANCELADO.AsString <> 'S' then
      dm.AtualizaStatusNfe(QConsNfeCOD_NF.AsInteger, 'STATUS_CANCELADO',
        'Sem Status');
  if dm.ACBrNFe1.WebServices.Consulta.cStat = 100 then
     begin
        dm.AtualizaStatusNfe(QConsNfeCOD_NF.AsInteger, 'STATUS_TRANSMITIDA', 'NULL');
        dm.AtualizaStatusNfe(QConsNfeCOD_NF.AsInteger, 'STATUS_RETORNO', 'NULL');
        { atualiza chave e protoco }
        if dm.IBTransaction.Active then
          dm.IBTransaction.Commit;
        dm.IBTransaction.StartTransaction;
        try
          try
            with dm.QConsulta do
            begin
              close;
              sql.Clear;
              sql.Text := 'UPDATE NOTA_FISCAL ' +
                'SET CHAVE_ACESSO_NFE = :CHAVE, PROTOCOLO_NFE = :PROTO, DEPEC = :IDEPEC, HORA_SAIDA_NF=current_time '
                + 'WHERE COD_NF = :CODNF';
              Parambyname('chave').AsString := dm.acbrnfe1.NotasFiscais.Items[0].NFe.procNFe.chNFe;
              Parambyname('proto').AsString := dm.acbrnfe1.NotasFiscais.Items[0].NFe.procNFe.nProt;
              Parambyname('codnf').AsInteger := QConsNfeCOD_NF.AsInteger;
              Parambyname('IDEPEC').AsInteger := 0;
              ExecOrOpen;
            end;
            dm.IBTransaction.Commit;
          except
            dm.IBTransaction.Rollback;
            KDialog('Erro gravando a Chave e o Protrocolo da NFe');
          end;
        finally
          dm.QConsulta.close;
        end;

     end;


  KDialog(inttostr(dm.ACBrNFe1.WebServices.Consulta.cStat) + ': ' +
    dm.ACBrNFe1.WebServices.Consulta.XMotivo);
  BtnOk.Click;
//  BtnOk.Click;
end;

procedure TFrmGerenciamentoNFe.BtnEnviarClick(Sender: TObject);
begin
  if (trim(QConsNfeCHAVE2.AsString) <> '') and
    (QConsNfeDEPEC.AsInteger <> 1) then
  begin
    KDialog('NFe ja enviada... Correções precione consultar!');
    exit;
  end;

  iCodigoNfe := QConsNfeCOD_NF.AsInteger;
  NotaFiscalEletronica(QConsNfeCOD_NF.AsInteger);
  BtnOk.Click;
end;

end.

