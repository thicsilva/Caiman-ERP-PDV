unit UfrmManifestacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, acPNG, ExtCtrls, DBCtrls, AdvGlowButton, Grids, DBGrids,
  NxPageControl, StdCtrls, Mask, sMaskEdit, sCustomComboEdit, sTooledit,
  ComCtrls, pcnConversao, ImgList, acAlphaImageList, StrUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util,
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet,
  pcnConversaoNFe, USincronizaManifestacao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis,
  dxSkinsdxStatusBarPainter, dxStatusBar, cxPC;

type
  TfrmManifestacao = class(TForm)
    TRManifest: TFDTransaction;
    QNotas: TFDQuery;
    QNotasCOD: TIntegerField;
    QNotasCOD_EMP: TIntegerField;
    QNotasCHAVE_NOTA: TStringField;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TsDateEdit;
    EdtDataFin: TsDateEdit;
    BtnOk: TButton;
    Paginas: TNxPageControl;
    Notas: TNxTabSheet;
    DBGrid1: TDBGrid;
    QNotasDATA_ENTRADA: TDateField;
    dsNotas: TDataSource;
    pnlBotoes: TPanel;
    AdvGlowButton2: TAdvGlowButton;
    QNotasEMITENTE: TStringField;
    QNotasCNPJ_EMI: TStringField;
    QNotasIE_EMI: TStringField;
    QNotasVALOR_NF: TBCDField;
    QNotasTIPO_NF: TStringField;
    QNotasSIT_NF: TStringField;
    QNotasSIT_CONF: TStringField;
    opNotas: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    opEmitente: TComboBox;
    TRManifestacao: TFDTransaction;
    GroupBox3: TGroupBox;
    Image1: TImage;
    Label2: TLabel;
    Image3: TImage;
    Label6: TLabel;
    Image5: TImage;
    Label7: TLabel;
    Image6: TImage;
    Label8: TLabel;
    Image7: TImage;
    Label9: TLabel;
    Image11: TImage;
    Label13: TLabel;
    Imagens: TsAlphaImageList;
    QNotasMANIFESTACAO: TIntegerField;
    QNotasSTATUS: TStringField;
    Image2: TImage;
    Label5: TLabel;
    Label10: TLabel;
    opMani: TComboBox;
    AdvGlowButton1: TAdvGlowButton;
    upNotas: TFDUpdateSQL;
    AdvGlowButton3: TAdvGlowButton;
    Image4: TImage;
    Label11: TLabel;
    AdvGlowButton8: TAdvGlowButton;
    Tray: TTrayIcon;
    Status: TdxStatusBar;
    btnSair: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure AdvGlowButton3Click(Sender: TObject);
    procedure AdvGlowButton8Click(Sender: TObject);
    procedure TrayDblClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SincronizaMani: TSincronizaManifestacao;
  end;

 function frmManifestacao: TfrmManifestacao;

implementation

uses
  UDM, UDialog, UImportXML, USendemail, UNovoPrincipal;

{$R *.dfm}

function frmManifestacao: TfrmManifestacao;
begin
   Result := TfrmManifestacao( BuscaFormulario( TfrmManifestacao, False ) );
end;

procedure TfrmManifestacao.AdvGlowButton1Click(Sender: TObject);
begin
  if trim(QNotasCHAVE_NOTA.AsString) <> '' then
  begin
    Status.Panels.Items[0].Text := 'Enviando Evento...';
    DM.ACBrNFe1.EventoNFe.Evento.Clear;
    with DM.ACBrNFe1.EventoNFe.Evento.Add do
    begin
      infEvento.chNFe := QNotasCHAVE_NOTA.AsString;
      infEvento.CNPJ := sCNPJEmpresa;
      infEvento.dhEvento := now;
      case opMani.ItemIndex of
        0:
          infEvento.tpEvento := teManifDestCiencia;
        1:
          infEvento.tpEvento := teManifDestConfirmacao;
        2:
          infEvento.tpEvento := teManifDestOperNaoRealizada;
        3:
          infEvento.tpEvento := teManifDestDesconhecimento;
      end;
      infEvento.cOrgao := 91;

    end;
    DM.ACBrNFe1.EnviarEvento(1);
    if DM.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0]
      .RetInfEvento.cStat = 135 then
    begin
      Status.Panels.Items[0].Text := 'Evento associado a nota com sucesso...';
      QNotas.Edit;
      // TpcnSituacaoManifDest = (smdSemManifestacao, smdConfirmada, smdDesconhecida, smdOperacaoNaoRealizada, smdCiencia);
      case opMani.ItemIndex of
        0:
          QNotasSIT_CONF.AsString := '4';
        1:
          QNotasSIT_CONF.AsString := '1';
        2:
          QNotasSIT_CONF.AsString := '3';
        3:
          QNotasSIT_CONF.AsString := '2';
      end;
      QNotas.Post;
      BtnOkClick(nil);
    end
    else
    begin
      Status.Panels.Items[0].Text := 'ERRO : ' +
        IntToStr(DM.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items
        [0].RetInfEvento.cStat) + ' - ' + DM.ACBrNFe1.WebServices.EnvEvento.
        EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo;
    end;

  end;
end;

procedure TfrmManifestacao.AdvGlowButton2Click(Sender: TObject);
var
  OK: Boolean;
begin

    if Assigned( SincronizaMani ) then
       begin
          if SincronizaMani.isRun then
             begin
                SincronizaMani.Terminate;
                SincronizaMani.WaitFor;
             end;
          FreeAndNil( SincronizaMani );
       end;
    SincronizaMani:= TSincronizaManifestacao.Create(DM,
      StrToIndicadorNFe(OK, IntToStr(opNotas.ItemIndex)),
      StrToIndicadorEmissor(OK, IntToStr(opEmitente.ItemIndex)));
end;

procedure TfrmManifestacao.AdvGlowButton3Click(Sender: TObject);
begin

  if QNotasCHAVE_NOTA.AsString <> '' then
  begin
    if (QNotasSIT_CONF.AsString = '4') or (QNotasSIT_CONF.AsString = '4') then
    begin
      if not FileExists(DM.ACBrNFe1.Configuracoes.Arquivos.PathSalvar + '\' +
        QNotasCHAVE_NOTA.AsString + '-nfe.xml') then
      begin
        Status.Panels.Items[0].Text := 'Download Iniciado...';
        DM.ACBrNFe1.Configuracoes.WebServices.Visualizar := False;
        DM.ACBrNFe1.Configuracoes.Arquivos.Salvar := False;
        DM.ACBrNFe1.DownloadNFe.Download.tpAmb := DM.ACBrNFe1.Configuracoes.WebServices.Ambiente;
        DM.ACBrNFe1.Configuracoes.WebServices.Ambiente := DM.ACBrNFe1.Configuracoes.WebServices.Ambiente;
        DM.ACBrNFe1.DownloadNFe.Download.Chaves.Clear;
        DM.ACBrNFe1.DownloadNFe.Download.CNPJ := sCNPJEmpresa;
        with DM.ACBrNFe1.DownloadNFe.Download.Chaves.Add do
          chNFe := QNotasCHAVE_NOTA.AsString;
        DM.ACBrNFe1.Download;
        Status.Panels.Items[0].Text :=
          DM.ACBrNFe1.WebServices.DownloadNFe.retDownloadNFe.xMotivo;
      end;
      if FileExists(DM.ACBrNFe1.Configuracoes.Arquivos.PathSalvar + '\' +
        QNotasCHAVE_NOTA.AsString + '-nfe.xml') then
        begin
           if KDialog( 'Abrir XML no importador?', 'Importador de XML', tdtPergunta) then
              begin
                    if ImportXML = nil then
                         begin
                            ImportXML := TImportXML.Create(nil);
                             ImportXML.Arquivo1.Text := DM.ACBrNFe1.Configuracoes.Arquivos.PathSalvar + '\' +
                                  QNotasCHAVE_NOTA.AsString + '-nfe.xml';
                            ImportXML.Show;

                         end;
              end;
        end;

    end
    else
      Status.Panels.Items[0].Text :=
        'Você precisa primeiro Manifestar ciência de operação!';

  end;
end;

procedure TfrmManifestacao.AdvGlowButton8Click(Sender: TObject);
var
  tempdata: string;
  sCaminhoXML: string;
  sCaminhoPDF: String;
begin
  if not Qnotas.IsEmpty then
  begin
    Application.CreateForm(TFrmSendEmail, FrmSendEmail);
    Qnotas.First;
    while not Qnotas.Eof do
    begin


      sCaminhoXML := DM.ACBrNFe1.Configuracoes.Arquivos.PathSalvar + '\' +
        QNotasCHAVE_NOTA.AsString + '-nfe.xml';
        if FileExists( sCaminhoXML ) then
           begin
              FrmSendEmail.LbAnexos.Items.Add(sCaminhoXML);
               FrmSendEmail.LbAnexos.Items.Add(sCaminhoPDF);
           end;
      Qnotas.Next;

    end;
    FrmSendEmail.ShowModal;
  end;

end;
procedure TfrmManifestacao.BtnOkClick(Sender: TObject);
begin
  if TRManifestacao.Active then
    TRManifestacao.Commit;
  TRManifestacao.StartTransaction;
  QNotas.Close;
  QNotas.SQL.Text :=
    'select * from NOTAS_MANIFESTACAO where DATA_ENTRADA between :DATA_INI and :DATA_FIM and COD_EMP=:COD_EMP';
  QNotas.ParamByName('DATA_INI').AsDate := EdtDataIni.Date;
  QNotas.ParamByName('DATA_FIM').AsDate := EdtDataFin.Date;
  QNotas.ParamByName('COD_EMP').AsInteger := iEmp;
  QNotas.Open;
end;

procedure TfrmManifestacao.btnSairClick(Sender: TObject);
begin
   if Parent is TcxTabSheet then
      frmMenu.FTDI.CloseTabOfForm( TFormClass( Self.ClassType ) )
   else
      close;
end;

procedure TfrmManifestacao.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Pos: Integer;
begin
  Pos := 0;
  if Column.field.FieldName = 'STATUS' then // o nome do campo
  begin
    if (QNotasSIT_NF.AsString = '0') then
    begin
      Pos := Rect.Left + 5;
      Imagens.Draw(DBGrid1.Canvas, Pos, Rect.Top + 1, 5);
    end
    else
    begin
      Pos := Rect.Left + 5;
      Imagens.Draw(DBGrid1.Canvas, Pos, Rect.Top + 1, 6);
    end;
    // (smdSemManifestacao, smdConfirmada, smdDesconhecida, smdOperacaoNaoRealizada, smdCiencia);
    Pos := Pos + 18;
    if QNotasSIT_CONF.AsString = '0' then
      Imagens.Draw(DBGrid1.Canvas, Pos, Rect.Top + 1, 3)
    else if QNotasSIT_CONF.AsString = '1' then
      Imagens.Draw(DBGrid1.Canvas, Pos, Rect.Top + 1, 1)
    else if QNotasSIT_CONF.AsString = '2' then
      Imagens.Draw(DBGrid1.Canvas, Pos, Rect.Top + 1, 7)
    else if QNotasSIT_CONF.AsString = '3' then
      Imagens.Draw(DBGrid1.Canvas, Pos, Rect.Top + 1, 0)
    else if QNotasSIT_CONF.AsString = '4' then
      Imagens.Draw(DBGrid1.Canvas, Pos, Rect.Top + 1, 4);

  end;
end;

procedure TfrmManifestacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QNotas.Close;
  if TRManifestacao.Active then
    TRManifestacao.Commit;
  if Assigned( SincronizaMani ) then
     begin
        if not SincronizaMani.isRun then
           begin
              SincronizaMani.Terminate;
              SincronizaMani.WaitFor;
           end;
        FreeAndNil( SincronizaMani );
     end;
end;

procedure TfrmManifestacao.FormCreate(Sender: TObject);
begin
  { busca parametros }

     dm.ConfiguraNFe( dm.ACBrNFe1 );
end;

procedure TfrmManifestacao.FormShow(Sender: TObject);
begin
  EdtDataIni.Date := Date - 30;
  EdtDataFin.Date := Date;
  if TRManifestacao.Active then
    TRManifestacao.Commit;
  TRManifestacao.StartTransaction;
  QNotas.Close;
  // select * from NOTAS_MANIFESTACAO where DATA_ENTRADA between :DATA_INI and :DATA_FIM
  QNotas.ParamByName('DATA_INI').AsDate := EdtDataIni.Date;
  QNotas.ParamByName('DATA_FIM').AsDate := EdtDataFin.Date;
  QNotas.ParamByName('COD_EMP').AsInteger := iEmp;
  QNotas.Open;
end;

procedure TfrmManifestacao.TrayDblClick(Sender: TObject);
begin
   Show;

end;

end.

