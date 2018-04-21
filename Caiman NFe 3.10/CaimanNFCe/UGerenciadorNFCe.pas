unit UGerenciadorNFCe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, AdvGlowButton, ExtCtrls, Grids, DBGrids, StdCtrls, Mask, sMaskEdit, 
  sCustomComboEdit, sTooledit, DB, StrUtils, acPNG, ImgList,
  acAlphaImageList, pcnConversao, ACBrUtil, JvBaseDlg, JvSelectDirectory, 
  IOUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, System.ImageList;

type
  TfrmGerenciador = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnConsultar: TAdvGlowButton;
    btnValidar: TAdvGlowButton;
    btnImprimir: TAdvGlowButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TsDateEdit;
    EdtDataFin: TsDateEdit;
    GroupBox2: TGroupBox;
    Combo: TComboBox;
    BtnOk: TButton;
    DBGrid1: TDBGrid;
    QNFce: TFDQuery;
    TRNFCe: TFDTransaction;
    QNFceDATA_VEN: TDateField;
    QNFceCOD_VEN: TIntegerField;
    QNFceNFCE_SERIE: TIntegerField;
    QNFceNFCE_NUM: TIntegerField;
    QNFceNOME_CLI: TStringField;
    QNFceTOTAL_VEN: TBCDField;
    QNFceNOME_TPV: TStringField;
    dsNFCe: TDataSource;
    QNFceNFCE_CANCELADA: TStringField;
    QNFceCHAVE_NFCE: TStringField;
    QNFceOFFLINE: TIntegerField;
    QNFceNFCE_PROTOCOLO: TStringField;
    Panel3: TPanel;
    Image1: TImage;
    Label34: TLabel;
    Image3: TImage;
    Label5: TLabel;
    Image11: TImage;
    Label13: TLabel;
    Imagens: TsAlphaImageList;
    QNFceSTATUS: TStringField;
    AdvGlowButton5: TAdvGlowButton;
    QAux: TFDQuery;
    AdvGlowButton1: TAdvGlowButton;
    AdvGlowButton2: TAdvGlowButton;
    TRVendasoff: TFDTransaction;
    QVendasOFFLINE: TFDQuery;
    QVendasOFFLINECOD_VEN: TIntegerField;
    QVendasOFFLINEDATA_VEN: TDateField;
    QVendasOFFLINECOD_EMP: TIntegerField;
    QVendasOFFLINECOD_CAI: TIntegerField;
    QVendasOFFLINECOD_CLI: TIntegerField;
    QVendasOFFLINEDESCONTO_VEN: TBCDField;
    QVendasOFFLINECOD_TPV: TIntegerField;
    QVendasOFFLINETOTAL_VEN: TBCDField;
    QVendasOFFLINECUPOM_FISCAL_VEN: TIntegerField;
    QVendasOFFLINETOTAL_CUSTO_VEN: TBCDField;
    QVendasOFFLINEDATA_HORA_VEN: TDateTimeField;
    QVendasOFFLINEDESC_PESSOA_AUTORIZADA: TStringField;
    QVendasOFFLINECOD_NF: TIntegerField;
    QVendasOFFLINECOD_USU: TIntegerField;
    QVendasOFFLINECANCELADA_VEN: TIntegerField;
    QVendasOFFLINECODIGO_PAF: TIntegerField;
    QVendasOFFLINER04_CCF: TIntegerField;
    QVendasOFFLINER04_NOME_CLIENTE: TStringField;
    QVendasOFFLINER04_CNPJ_CLIENTE: TStringField;
    QVendasOFFLINENUMERO_NOTA_FISCAL: TIntegerField;
    QVendasOFFLINECOD_VEND: TIntegerField;
    QVendasOFFLINESERIE_NOTA_FISCAL: TStringField;
    QVendasOFFLINECODIFICACAO_FISCAL: TStringField;
    QVendasOFFLINECER: TIntegerField;
    QVendasOFFLINECONSIGNADA: TStringField;
    QVendasOFFLINEIMPORTADO_NFE: TStringField;
    QVendasOFFLINEOBS: TStringField;
    QVendasOFFLINESTATUS_EXPORTA: TIntegerField;
    QVendasOFFLINEEXPORTA_CANCELADA: TIntegerField;
    QVendasOFFLINEAUXILIAR: TStringField;
    QVendasOFFLINEPOSTO_PLACA: TStringField;
    QVendasOFFLINEPOSTO_KILOMETRAGEM: TIntegerField;
    QVendasOFFLINEDATA_HORA_INS: TDateTimeField;
    QVendasOFFLINECHAVE_NFCE: TStringField;
    QVendasOFFLINEOFFLINE: TIntegerField;
    QVendasOFFLINENFCE_NUM: TIntegerField;
    QVendasOFFLINENFCE_SERIE: TIntegerField;
    QVendasOFFLINENFCE_PROTOCOLO: TStringField;
    JvSelectDirectory1: TJvSelectDirectory;
    AdvGlowButton3: TAdvGlowButton;
    AdvGlowButton4: TAdvGlowButton;
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnValidarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure AdvGlowButton5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
    procedure AdvGlowButton3Click(Sender: TObject);
    procedure AdvGlowButton4Click(Sender: TObject);
    procedure EnvioConsultaNFCe;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerenciador: TfrmGerenciador;

implementation

uses
  UDM, UDialog, UECF, UStatus;

{$R *.dfm}

procedure TfrmGerenciador.AdvGlowButton1Click(Sender: TObject);
begin
   dm.ConfiguraNFCe;
   try
       if dm.NFCe.WebServices.StatusServico.Executar then
          KDialog( 'Status NFCe : ' + dm.NFCe.WebServices.StatusServico.Msg +
          '(' + IntToStr( dm.NFCe.WebServices.StatusServico.cStat ) + ')', 'Status WebService', 'INFO'  )
       else
          KDialog( 'Status NFCe : ' + dm.NFCe.WebServices.StatusServico.Msg +
          '(' + IntToStr( dm.NFCe.WebServices.StatusServico.cStat ) + ')', 'Status WebService', 'INFO'  );
   except
      on E: Exception do
         begin
            begin
                 try
                      KDialog( 'ERRO NFCe: ' +
                      E.Message , 'Status WebService', 'ERRO'  )
                 except
                 end;
            end;

         end;
   end;
end;

procedure TfrmGerenciador.AdvGlowButton2Click(Sender: TObject);
var
    NaoEnviadas: String;
begin
     NaoEnviadas := '';
    if QNFce.IsEmpty then
       begin
           KDialog( 'Não Existe notas em offline!', 'NFC-e', 'INFOR' );
            exit;
       end;
    QNFce.First;
           while not QNFce.Eof do
               begin
                   if QNFceOFFLINE.AsInteger = 1 then
                      begin
                           if not GeraNFCe( QNFceCOD_VEN.AsInteger, True ) then
                              NaoEnviadas := NaoEnviadas + 'Venda: ' + QNFceCOD_VEN.AsString + #13;
                      end;
                   Application.ProcessMessages;
                   QNFce.Next;
               end;
    if NaoEnviadas <> '' then
              KDialog( 'Notas não Enviadas: ' + #13 + NaoEnviadas, 'NFC-e', 'INFO' );
    Exit;

    QVendasOFFLINE.Close;
    QVendasOFFLINE.ParamByName( 'cod_emp' ).AsInteger := iEmp;
    QVendasOFFLINE.ParamByName( 'cod_cai' ).AsInteger := iCaixa;
    QVendasOFFLINE.Open;
    if not QVendasOFFLINE.IsEmpty   then
       begin
           while not QVendasOFFLINE.Eof do
               begin
                   if not GeraNFCe( QVendasOFFLINECOD_VEN.AsInteger, True ) then
                      NaoEnviadas := NaoEnviadas + 'Venda: ' + QVendasOFFLINECOD_VEN.AsString + #13;
                   Application.ProcessMessages;
                   QVendasOFFLINE.Next;
               end;
           if NaoEnviadas <> '' then
              KDialog( 'Notas não Enviadas: ' + #13 + NaoEnviadas, 'NFC-e', 'INFO' );
       end
    else
       KDialog( 'Não Existe notas em offline!', 'NFC-e', 'INFOR' );
    QVendasOFFLINE.Close;
end;

procedure TfrmGerenciador.AdvGlowButton3Click(Sender: TObject);
var
  SCaminho,
  SCaminho2: String;
begin
   if QNFce.IsEmpty then
      Exit;
   if not JvSelectDirectory1.Execute then
      Exit;
   dm.ConfiguraNFCe;
   frmStatus.Show;
   frmStatus.BringToFront;
   try
     QNFce.Last;
     QNFce.First;
     frmStatus.lblStatus.Caption := 'Copiando arquivos 0/' + IntToStr( QNFce.RecordCount );
     Application.ProcessMessages;
     while not QNFce.Eof do
         begin
            if ( QNFceNFCE_CANCELADA.AsString <> 'S' ) and
            ( QNFceOFFLINE.AsInteger <> 1 ) and
            ( Trim( QNFceNFCE_PROTOCOLO.AsString ) <> '' )  then
                 begin
                     frmStatus.lblStatus.Caption := 'Copiando arquivos ' +
                        IntToStr( QNFce.RecNo ) + '/' +
                       IntToStr( QNFce.RecordCount );
                    Application.ProcessMessages;
                    SCaminho := dm.NFCe.Configuracoes.Arquivos.GetPathNFe( QNFceDATA_VEN.AsDateTime, sCnpj, 65 ) + '\' + trim
                       (QNFceCHAVE_NFCE.AsString) + '-nfe.xml';
                    SCaminho2 :=  JvSelectDirectory1.Directory + '\'+ trim
                       (QNFceCHAVE_NFCE.AsString) + '-nfe.xml';
                    if FileExists( SCaminho ) then
                       CopyFile( pwidechar( SCaminho ), pwidechar( SCaminho2 ), false );
                 end;
            QNFce.Next;
         end;
   finally
      frmStatus.Close;
   end;
end;

procedure TfrmGerenciador.AdvGlowButton4Click(Sender: TObject);

begin
   QNFce.First;
   while not QNFce.Eof do
      begin
         EnvioConsultaNFCe;
         QNFce.Next;
      end;
end;

procedure TfrmGerenciador.AdvGlowButton5Click(Sender: TObject);
var
   sJustifNFe, sCaminhoArquivo: String;
   Chave: String;
begin
  dm.ConfiguraNFCe;
  if Trim( QNFceNFCE_PROTOCOLO.AsString ) = ''  then
     begin
         KDialog( 'NFCe sem protocolo', 'Gerenciamento de NFCe', 'INFO');
         Exit;
     end;
  if Trim( QNFceNFCE_CANCELADA.AsString ) = 'S' then
     begin
         KDialog( 'NFCe já Cancelada', 'Gerenciamento de NFCe', 'INFO');
         Exit;
     end;

  sCaminhoArquivo := dm.NFCe.Configuracoes.Arquivos.GetPathNFe( QNFceDATA_VEN.AsDateTime, sCnpj, 65 ) + '\' + trim
     (QNFceCHAVE_NFCE.AsString) + '-nfe.xml';

    dm.NFCe.NotasFiscais.Clear;
    dm.NFCe.NotasFiscais.LoadFromFile(sCaminhoArquivo);

  if not(InputQuery('WebServices Cancelamento', 'Justificativa', sJustifNFe))
    then
    exit;
    dm.NFCe.EventoNFe.Evento.Clear;
    // dm.ACBrNFe1.EventoNFe.idLote := 1;
    with dm.NFCe.EventoNFe.Evento.Add do
    begin
      infEvento.dhEvento := now;
      infEvento.tpEvento := teCancelamento;
      infEvento.detEvento.xJust := sJustifNFe;
    end;
     try
         if dm.NFCe.EnviarEvento(1) then
            begin
                if dm.NFCe.WebServices.EnvEvento.cStat = 128 then
                begin
                  if dm.NFCe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0]
                    .RetInfEvento.cStat = 135 then
                      begin
                          DM.NFCe.NotasFiscais.GravarXML();

                          Chave :=
                            DM.NFCe.NotasFiscais.Items[0].NFe.procNFe.chNFe;
                          dm.NFCe.EventoNFe.Evento.Clear;
                          dm.NFCe.NotasFiscais.Clear;
                          dm.NFCe.NotasFiscais.LoadFromFile(sCaminhoArquivo);
                          dm.NFCe.WebServices.Consulta.NFeChave := CHAVE;
                          if dm.NFCe.WebServices.Consulta.Executar then
                            begin
                               if dm.NFCe.WebServices.Consulta.cStat = 101 then
                                  begin
                                      DM.NFCe.NotasFiscais.GravarXML();
                                     if DM.IBTRServer.Active then
                                        DM.IBTRServer.Commit;
                                     DM.IBTRServer.StartTransaction;

                                     QAux.Close;
                                     QAux.SQL.Clear;
                                     QAux.SQL.Text := 'update VENDAS SET CANCELADA_VEN=1, NFCE_CANCELADA=:S' +
                                                      ' Where COD_VEN=:COD_VEN and COD_EMP=:COD_EMP';
                                     QAux.ParamByName( 'S' ).AsString := 'S';
                                     QAux.ParamByName( 'COD_VEN' ).AsInteger := QNFceCOD_VEN.AsInteger;
                                     QAux.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
                                     QAux.ExecSQL;

                                     dm.IBTRServer.Commit;
                                  end;
                            end;
                      end;
                end;
            end
         else
            begin
                  KDialog (inttostr(dm.NFCe.WebServices.EnvEvento.cStat) + ': ' +
                    dm.NFCe.WebServices.EnvEvento.Msg, Application.Title, 'INFO' );
                  Exit;
            end;
     except
       on E: Exception do
          begin
            KDialog (inttostr(dm.NFCe.WebServices.EnvEvento.cStat) + ': ' +
              dm.NFCe.WebServices.EnvEvento.Msg + sLineBreak +
              E.Message, Application.Title, 'ERRO'   );
            exit;
          end;
     end;
//    dm.AtualizaStatusNfe(iCodigoNfe, 'STATUS_CANCELADO', sJustifNFe);
  // ShowMessage(dm.ACBrNFe1.WebServices.Cancelamento.Protocolo);
  BtnOk.Click;
end;

procedure TfrmGerenciador.btnConsultarClick(Sender: TObject);
var
   sCaminhoArquivo: String;
begin
   if trim(QNFceCHAVE_NFCE.AsString) = '' then
      begin
          KDialog( 'Nota sem Chave de acesso', 'NFCe', 'INFO' );
          Exit;
      end;
   dm.ConfiguraNFCe;
   sCaminhoArquivo := DM.NFCe.Configuracoes.Arquivos.GetPathNFe( QNFceDATA_VEN.AsDateTime, sCnpj , 65 );
   sCaminhoArquivo := TPath.Combine( sCaminhoArquivo,
       QNFceCHAVE_NFCE.AsString + '-nfe.xml' );
   if not FileExists( sCaminhoArquivo ) then
      begin
          KDialog( 'XML não encontrado!' + sLineBreak + sCaminhoArquivo, 'NFCe', 'INFO' );
          Exit;
      end;
    dm.NFCe.NotasFiscais.Clear;
    dm.NFCe.NotasFiscais.LoadFromFile(sCaminhoArquivo);
    dm.NFCe.WebServices.Consulta.NFeChave := trim(QNFceCHAVE_NFCE.AsString);
   try
        dm.NFCe.WebServices.Consulta.Executar;
        if DM.NFCe.WebServices.Consulta.cStat = 101 then
          begin
    //          dm.NFCe.NotasFiscais.Items[0].SaveToFile;
             if DM.IBTRServer.Active then
                DM.IBTRServer.Commit;
             DM.IBTRServer.StartTransaction;

             QAux.Close;
             QAux.SQL.Clear;
             QAux.SQL.Text := 'update VENDAS SET CANCELADA_VEN=1, NFCE_CANCELADA=:S' +
                              ' Where COD_VEN=:COD_VEN and COD_EMP=:COD_EMP';
             QAux.ParamByName( 'S' ).AsString := 'S';
             QAux.ParamByName( 'COD_VEN' ).AsInteger := QNFceCOD_VEN.AsInteger;
             QAux.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
             QAux.ExecSQL;

             dm.IBTRServer.Commit;
          end;
        if DM.NFCe.WebServices.Consulta.cStat in [ 100, 150 ] then
          begin
               dm.NFCe.NotasFiscais.Items[0].GravarXML();
               if DM.IBTRServer.Active then
                  DM.IBTRServer.Commit;
               DM.IBTRServer.StartTransaction;


               QAux.Close;
               QAux.SQL.Clear;
               QAux.SQL.Text := 'update VENDAS set ' +
                                                'OFFLINE=0, NFCE_PROTOCOLO=:PROT where cod_ven=:venda and cod_emp=:emp';
               QAux.ParamByName( 'venda' ).AsInteger := QNFceCOD_VEN.AsInteger;
               QAux.ParamByName( 'emp' ).AsInteger := iEmp;
               QAux.ParamByName( 'PROT' ).AsString := dm.NFCe.NotasFiscais.Items[0].NFe.procNFe.nProt;
               QAux.ExecSQL;

               dm.IBTRServer.Commit;
          end;

        KDialog(inttostr(dm.NFCe.WebServices.Consulta.cStat)
          + ': ' + dm.NFCe.WebServices.Consulta.XMotivo, 'Gerenciador NFCe', 'INFO' );
       BtnOk.Click;
   except
      on E: Exception do
         begin
            KDialog( E.Message + sLineBreak +
             'UF: '+ dm.NFCe.Configuracoes.WebServices.UF + '/' +
             IntToStr( dm.NFCe.Configuracoes.WebServices.UFCodigo ), 'NFCe', 'ERRO' );
         end;
   end;
end;

procedure TfrmGerenciador.btnImprimirClick(Sender: TObject);
var
   sCaminhoArquivo: string;
begin
   dm.ConfiguraNFCe;
   if QNFceCHAVE_NFCE.IsNull then
      exit;
  sCaminhoArquivo := dm.NFCe.Configuracoes.Arquivos.GetPathNFe( QNFceDATA_VEN.AsDateTime, sCnpj, 65 ) + '\' + trim
     (QNFceCHAVE_NFCE.AsString) + '-nfe.xml';
   if not FileExists( sCaminhoArquivo ) then
      begin
         KDialog( 'Arquivo XML não encontrado' + #13 +
         sCaminhoArquivo, 'Gerenciador de Arquivos', 'INFO' );
         Exit;
      end;
   dm.NFCe.NotasFiscais.Clear;
   dm.NFCe.NotasFiscais.LoadFromFile(sCaminhoArquivo);
   DM.Danfcenaofiscal.MostrarPreview := true;
   DM.Danfcenaofiscal.ImprimirDANFE( dm.NFCe.NotasFiscais.Items[0].NFe );
   DM.Danfcenaofiscal.MostrarPreview := False;
   BtnOk.Click;
end;

procedure TfrmGerenciador.BtnOkClick(Sender: TObject);
begin
   if TRNFCe.Active then
      TRNFCe.Commit;
   TRNFCe.StartTransaction;
   with QNFce do
      begin
         Close;
         ParamByName( 'DATAINI' ).AsDate := EdtDataIni.Date;
         ParamByName( 'DATAFIM' ).AsDate := EdtDataFin.Date;
         ParamByName( 'COD_EMP' ).AsInteger := iEmp;
         ParamByName( 'CANCELADA' ).AsString := IfThen( Combo.ItemIndex = 1,
         'S', '%');
         ParamByName( 'OFFLINE' ).AsString := IfThen( Combo.ItemIndex = 2,
         '1', '%' );
         Open;
      end;
end;

procedure TfrmGerenciador.btnValidarClick(Sender: TObject);
begin
  DM.ConfiguraNFCe;
  if ( QNFceOFFLINE.AsInteger = 0 ) and
  ( Trim( QNFceNFCE_PROTOCOLO.AsString )  <> ''  ) then
     begin
        KDialog( 'NFCe já enviada', 'Gerenciador de NFCe', 'INFO' );
        Exit;
     end;
   GeraNFCe( QNFceCOD_VEN.AsInteger, True );
   BtnOk.Click;
end;

procedure TfrmGerenciador.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if Column.field.FieldName = 'STATUS' then // o nome do campo
      begin
         DBGrid1.Canvas.FillRect(Rect);
         if QNFceOFFLINE.AsInteger = 1 then
             Imagens.Draw(DBGrid1.Canvas, Rect.Left + 5, Rect.Top + 1, 6)
         else
            if QNFceNFCE_CANCELADA.AsString = 'S' then
               Imagens.Draw(DBGrid1.Canvas, Rect.Left + 5, Rect.Top + 1, 0)
                   else
                      if ( QNFceNFCE_CANCELADA.AsString <> 'S' ) and
                      ( QNFceOFFLINE.AsInteger <> 1 ) and
                      ( Trim( QNFceNFCE_PROTOCOLO.AsString ) <> '' )  then
                           Imagens.Draw(DBGrid1.Canvas, Rect.Left + 5, Rect.Top + 1, 1);

      end;
end;

procedure TfrmGerenciador.EnvioConsultaNFCe;
var
   sCaminhoArquivo: String;
begin
//    if QNFceOFFLINE.AsInteger <> 1 then
 //      Exit;
    if ( QNFceNFCE_CANCELADA.AsString = 'S' ) or
        ( QNFceOFFLINE.AsInteger = 0 ) or
        ( QNFceNFCE_PROTOCOLO.AsString <> '' ) then
        Exit;

    if trim(QNFceCHAVE_NFCE.AsString) = '' then
      begin
//          KDialog( 'Nota sem Chave de acesso', 'NFCe', 'INFO' );
          Exit;
      end;
   dm.ConfiguraNFCe;
   sCaminhoArquivo := DM.NFCe.Configuracoes.Arquivos.GetPathNFe( QNFceDATA_VEN.AsDateTime, sCnpj , 65 );
   sCaminhoArquivo := TPath.Combine( sCaminhoArquivo,
       QNFceCHAVE_NFCE.AsString + '-nfe.xml' );
   if not FileExists( sCaminhoArquivo ) then
      begin
//                  KDialog( 'XML não encontrado!' + sLineBreak + sCaminhoArquivo, 'NFCe', 'INFO' );
          Exit;
      end;
    dm.NFCe.NotasFiscais.Clear;
    dm.NFCe.NotasFiscais.LoadFromFile(sCaminhoArquivo);
    dm.NFCe.WebServices.Consulta.NFeChave := trim(QNFceCHAVE_NFCE.AsString);
   try
        dm.NFCe.WebServices.Consulta.Executar;
        if DM.NFCe.WebServices.Consulta.cStat = 101 then
          begin
    //          dm.NFCe.NotasFiscais.Items[0].SaveToFile;
             if DM.IBTRServer.Active then
                DM.IBTRServer.Commit;
             DM.IBTRServer.StartTransaction;

             QAux.Close;
             QAux.SQL.Clear;
             QAux.SQL.Text := 'update VENDAS SET CANCELADA_VEN=1, NFCE_CANCELADA=:S' +
                              ' Where COD_VEN=:COD_VEN and COD_EMP=:COD_EMP';
             QAux.ParamByName( 'S' ).AsString := 'S';
             QAux.ParamByName( 'COD_VEN' ).AsInteger := QNFceCOD_VEN.AsInteger;
             QAux.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
             QAux.ExecSQL;

             dm.IBTRServer.Commit;
          end;
        if DM.NFCe.WebServices.Consulta.cStat in [ 100, 150 ] then
          begin
               dm.NFCe.NotasFiscais.Items[0].GravarXML();
               if DM.IBTRServer.Active then
                  DM.IBTRServer.Commit;
               DM.IBTRServer.StartTransaction;


               QAux.Close;
               QAux.SQL.Clear;
               QAux.SQL.Text := 'update VENDAS set ' +
                                                'OFFLINE=0, NFCE_PROTOCOLO=:PROT where cod_ven=:venda and cod_emp=:emp';
               QAux.ParamByName( 'venda' ).AsInteger := QNFceCOD_VEN.AsInteger;
               QAux.ParamByName( 'emp' ).AsInteger := iEmp;
               QAux.ParamByName( 'PROT' ).AsString := dm.NFCe.NotasFiscais.Items[0].NFe.procNFe.nProt;
               QAux.ExecSQL;

               dm.IBTRServer.Commit;
          end;
   except
      on E: Exception do
         begin
         end;
   end;
end;

procedure TfrmGerenciador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   QNFce.Close;
   if TRNFCe.Active then
      TRNFCe.Commit;
   Action := caFree;
end;

procedure TfrmGerenciador.FormShow(Sender: TObject);
begin
   EdtDataIni.Date := Now;
   EdtDataFin.Date := Now;
   Combo.ItemIndex := 0;
   dm.ConfiguraNFCe;
end;

end.

