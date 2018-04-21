unit UPadraoPafEcf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, ExtCtrls, StdCtrls, ImgList,
  acPNG, UFechaVenda, ACBrECF, ACBrDevice, ACBrTEFD,
  ACBrTEFDClass, ACBrTEFDCliSiTef,
  sLabel, UDialog, System.ImageList, EAppProt;
const
   MOSTRA_CONEC = 0202;
   MOSTRA_DESCO = 1988;

type
  TFrmPadraoPafECf = class(TForm)
    SB: TStatusBar;
    ImageList1: TImageList;
    L000: TImage;
    M000: TImage;
    C000: TImage;
    F000: TImage;
    Image6: TImage;
    Image7: TImage;
    PopLeiturasECF: TPopupMenu;
    L001: TMenuItem;
    L002: TMenuItem;
    L003: TMenuItem;
    L004: TMenuItem;
    L005: TMenuItem;
    L006: TMenuItem;
    L007: TMenuItem;
    N8: TMenuItem;
    AdministraoTEF1: TMenuItem;
    N9: TMenuItem;
    L009: TMenuItem;
    L011: TMenuItem;
    ProgramarRelatriogerencial1: TMenuItem;
    L013: TMenuItem;
    L014: TMenuItem;
    popMovimentos: TPopupMenu;
    M001: TMenuItem;
    N4: TMenuItem;
    M002: TMenuItem;
    M004: TMenuItem;
    M003: TMenuItem;
    PopConsultas: TPopupMenu;
    C001: TMenuItem;
    PopProcessos: TPopupMenu;
    AtualizaEstoque2: TMenuItem;
    PopOpcoes: TPopupMenu;
    SelCli: TMenuItem;
    Image2: TImage;
    sLabelFX1: TsLabelFX;
    Image8: TImage;
    Image4: TImage;
    sLabelFX2: TsLabelFX;
    Label1: TLabel;
    Conec: TImage;
    Desco: TImage;
    RelatrioporUsurio1: TMenuItem;
    A1: TMenuItem;
    N1: TMenuItem;
    G1: TMenuItem;
    EvAppProtect1: TEvAppProtect;
    Label4: TLabel;
    procedure L002_Click(Sender: TObject);
    procedure BuscaDadosECF;
    procedure BloqueiaUsoECF;
    procedure Sair1Click(Sender: TObject);
    procedure Sair2_Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure L003_Click(Sender: TObject);
    procedure L004_Click(Sender: TObject);
    procedure L001_Click(Sender: TObject);
    procedure L007_Click(Sender: TObject);
    procedure L013_Click(Sender: TObject);
    procedure L014_Click(Sender: TObject);
    procedure M001_Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function  Is4DigitYear: Boolean;
    procedure FormCreate(Sender: TObject);
    procedure L009_Click(Sender: TObject);
    procedure L010_Click(Sender: TObject);
    procedure L011_Click(Sender: TObject);
    procedure C001_Click(Sender: TObject);
    procedure F000_Click(Sender: TObject);
    procedure M015Click(Sender: TObject);
    procedure M016Click(Sender: TObject);
    procedure M006_Click(Sender: TObject);
    procedure M007_Click(Sender: TObject);
    procedure M003_Click(Sender: TObject);
    procedure M004_Click(Sender: TObject);
    procedure ConfiguraMenu;
    procedure M012_Click(Sender: TObject);
    procedure M013_Click(Sender: TObject);
    procedure M009Click(Sender: TObject);
    procedure M010Click(Sender: TObject);
    procedure ProgramarRelatrioGerencial1_Click(Sender: TObject);
    procedure L006_Click(Sender: TObject);
    procedure AtualizaEstoque1Click(Sender: TObject);
    procedure SelCli_Click(Sender: TObject);
    procedure AdministraoTEF1_Click(Sender: TObject);
    procedure L000Click(Sender: TObject);
    procedure M000Click(Sender: TObject);
    procedure C000Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
     procedure MostraConec(var Message: TMessage); message MOSTRA_CONEC;
     procedure MostraDesco(var Message: TMessage); message MOSTRA_DESCO;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RelatrioporUsurio1Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure G1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrmPadraoPafECf: TFrmPadraoPafECf;
  var lista : TStringList;
         ErroImpressora: Boolean;

implementation
Uses UDm, UECF, ULMFRed, ULMFData, UAberturaCaixa,
     UFechamento, UEntradaValores, UVendasCaixa, UConsVendasCaixa,
     UHorarioVerao, UAliquota, UMenuFiscal, UPreVenda,
     USelfService, UMesas, UConsPreVenda, UDavOrcamento, UVendasPED,
     UConsVendasPED, UConsOrcamento, UDavOrdemServico, UConsOrdemServico,
     UProgramaRelGerencial, UCancelaCupomFiscal, UCarrega,
  URelUsuario, UGerenciadorNFCe;

{$R *.dfm}



procedure TFrmPadraoPafECf.Image6Click(Sender: TObject);
var
 T: TPoint;
begin
   getCursorPos( T );
   popProcessos.Popup( T.X, T.Y );
end;

procedure TFrmPadraoPafECf.Image7Click(Sender: TObject);
var
 T: TPoint;
begin
   getCursorPos( T );
   popOpcoes.Popup( T.X, T.Y );
end;

function TFrmPadraoPafECf.Is4DigitYear: Boolean;
begin
   result:= (Pos('yyyy',FormatSettings.ShortDateFormat) > 0);
end;

procedure TFrmPadraoPafECf.BuscaDadosECF;
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
             sql.Add('SELECT R01_MARCA_ECF, ECF_MFD, INDICE_GAVETA,               ' +
                     'TAMANHO_DESC_CUPOM, TRUNCAR_CAI, TEF_CAI, IP_SERVIDOR_TEF,  ' +
                     'ID_LOJA_TEF, ID_TERMINAL_TEF                                ' +
                     'FROM CAIXA WHERE COD_CAI = :CODCAI AND COD_EMP = :CODEMP');
             Parambyname('codcai').AsInteger:= iCaixa;
             Parambyname('codemp').AsInteger:= iEmp;
             Open;
             if recordcount > 0 then
                begin
                   iECF := 1;

                   iTamDescCupom := fieldbyname('tamanho_desc_cupom').AsInteger;
                   IGaveta       := Fieldbyname('indice_gaveta').AsInteger;
                   if trim(fieldbyname('truncar_cai').AsString) = 'S' then
                      bTruncar:= true
                   else
                      bTruncar:= false;
                   if trim(fieldbyname('ecf_mfd').AsString) = 'S' then
                      bMFD:= true
                   else
                      bMFD:= false;
                   if trim(fieldbyname('tef_cai').AsString) = 'S' then
                      bTEF:= true
                   else
                      bTEF:= false;
                   if trim( fieldbyname('ID_LOJA_TEF').AsString ) <> '' then
                      begin
                          if Length( trim( fieldbyname('ID_LOJA_TEF').AsString ) ) > 1 then
                             TipoTEF := 4
                          else
                             TipoTef := StrtoInt(  trim( fieldbyname('ID_LOJA_TEF').AsString ) );
                      end;
                   if trim( fieldbyname('IP_SERVIDOR_TEF').AsString ) <> '' then
                      begin
                         IPServidor := trim( fieldbyname('IP_SERVIDOR_TEF').AsString);
                      end;

                   sIPTEF      := trim(fieldbyname('ip_servidor_tef').AsString);
                   sIDLojaTEF  := trim(fieldbyname('id_loja_tef').AsString);
                   sIDTermTEF  := trim(fieldbyname('id_terminal_tef').AsString);
                end
             else
                showmessage('Caixa não Cadastrado');
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao Buscar o Caixa');
     end;
   finally
     dm.QConsulta.Close;
   end;

   { Configura o Menu para PAF com ECF e PAF sem ECF }
   ConfiguraMenu;
end;

procedure TFrmPadraoPafECf.L002_Click(Sender: TObject);
begin
   if application.MessageBox('Confirma a Leitura X', 'Leitura X', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton1) = 6 then
      begin
         LeituraX(iECF);
      end;
end;

procedure TFrmPadraoPafECf.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPadraoPafECf.Sair2_Click(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TFrmPadraoPafECf.SelCli_Click(Sender: TObject);
begin
   SelCli.Checked := not SelCli.Checked;
   if SelCli.Checked then
      dm.GravaIni( GetCurrentDir +  '\PafEcf.ini', 'VENDAS', 'SELCLI', 'S' )
   else
      dm.GravaIni( GetCurrentDir +  '\PafEcf.ini', 'VENDAS', 'SELCLI', 'N' );
end;

procedure TFrmPadraoPafECf.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:= caFree;
   Self := nil;
end;

procedure TFrmPadraoPafECf.L003_Click(Sender: TObject);
begin
   Application.CreateForm(TFrmLMFRed, FrmLMFRed);
   FrmLMFRed.showmodal;
end;

procedure TFrmPadraoPafECf.L004_Click(Sender: TObject);
begin
   Application.CreateForm(TFrmLMFData, FrmLMFData);
   FrmLMFData.showmodal;
end;

procedure TFrmPadraoPafECf.L000Click(Sender: TObject);
var
 T: TPoint;
begin
   getCursorPos( T );
   PopLeiturasECF.Popup( T.X, T.Y );
end;

procedure TFrmPadraoPafECf.L001_Click(Sender: TObject);
begin
   Application.CreateForm(TFrmAberturaCaixa, FrmAberturaCaixa);
   FrmAberturaCaixa.showmodal;
end;

procedure TFrmPadraoPafECf.L007_Click(Sender: TObject);
var sAuxData : string;
begin
   { busca a data do movimento }
   sAuxData:= DataMovimentoECF(iECF);
   if (trim(sAuxData) = '000000') or (trim(sAuxData) = '010100') then
      begin
         showmessage('ECF sem movimento');
         exit;
      end;

   Application.CreateForm(TFrmFechamento, FrmFechamento);
   FrmFechamento.showmodal;
end;

procedure TFrmPadraoPafECf.L013_Click(Sender: TObject);
begin
   Application.CreateForm(TFrmEntradaValores, FrmEntradaValores);
   FrmEntradaValores.tag:= 0;
   FrmEntradaValores.showmodal;
end;

procedure TFrmPadraoPafECf.L014_Click(Sender: TObject);
begin
   Application.CreateForm(TFrmEntradaValores, FrmEntradaValores);
   FrmEntradaValores.tag:= 1;
   FrmEntradaValores.showmodal;
end;

procedure TFrmPadraoPafECf.M000Click(Sender: TObject);
var
 T: TPoint;
begin
   getCursorPos( T );
   PopMovimentos.Popup( T.X, T.Y );
end;

procedure TFrmPadraoPafECf.M001_Click(Sender: TObject);
begin
    if dm.ECF.Estado = estRequerZ then
       begin
           KDialog( 'ECF Requer leitura Z. Fechamento do caixa pendente', 'SLPDV Informação', 'INFO' );
           Exit;
       end;

    if not DM.VerificaCaixaAberto then
        begin
           KDialog( 'Caixa ainda não foi aberto', 'SLPDV Informação', 'INFO' );
           Exit;
        end;
   Application.CreateForm(TFrmVendasCaixa, FrmVendasCaixa);
   FrmVendasCaixa.Tag:= 0;
//   hide;
   FrmVendasCaixa.ShowModal;
//   show;
end;

procedure TFrmPadraoPafECf.FormShow(Sender: TObject);
var
  SelCli2: String;
  HoraECFT: TTime;
  Tolerancia: TTime;
begin
  if PUsuario <> '' then
        ShowWindow(Application.Handle, SW_HIDE);
  BuscaDadosECF;
   Application.CreateForm( TfrmCarrega, frmCarrega );
   frmCarrega.Show;
   Application.ProcessMessages;
   TEFCancelado := false;
   application.CreateForm( TfrmFechaVenda, frmfechaVenda );
   frmCarrega.Close;
   frmFechaVenda.Free;

   Label1.Caption := FrmPadraoPafECf.sb.Panels[3].Text;
 //  brush.Style := bsClear;
   SelCli2 := dm.LeIni( GetCurrentDir +  '\PafEcf.ini', 'VENDAS', 'SELCLI' );
   if SelCli2 = 'S' then
      SelCli.Checked := true
   else
      SelCli.Checked := false;
   { inicializa a variavel iTabelaPreco }
                           if not Dm.ECF.Ativo then
                              begin
                                 //showmessage('Erro ao incializar impressora');
                                 BloqueiaUsoEcf;
                              end;
                           if ErroImpressora then
                              begin
                                BloqueiaUsoEcf;
                              end;

   iTabelaPreco:= 0;   // 0 - Normal   1 - A prazo

   sb.Panels[4].Text:= datetostr(date);

 //  BuscaDadosECF;

   { verifica a data da ecf com a data do micro }
   if iECF < 99 then
      begin
         if DataECF(iECF) <> date then
            begin
               showmessage('Data da ECF diferente da Data do Micro');
               Application.Terminate;
            end;
         HoraECFT := StrToTime( FormatDateTime( 'hh:mm:ss', DM.ECF.DataHora ) );
         Tolerancia := StrToTime( '0:59:00' );
         if ( HoraECFT > ( Time + Tolerancia ) )  or ( HoraECFT < ( Time - Tolerancia )) then
            begin
               showmessage('Hora do ECF diferente da do Micro');
               Application.Terminate;
            end;

      end;

   { verifica numero de serie da ecf }
   if iECF < 99 then
      begin
         if (not VerificaNumeroSerie(0) ) and ( not ErroImpressora )  then
            begin
               //showmessage('Número de Série da ECF não confere');
               dm.ECF.Desativar;
               ErroImpressora := true;
               iECF := 99;
               ConfiguraMenu;
               BloqueiaUsoEcf;
            end;

         { verifica o GT da ECF - mesmo caso acima }
         if ( not VerificaGT(0) ) and ( not ErroImpressora ) then
            begin
//               showmessage('Totalizador Geral do ECF não confere');
               ErroImpressora := true;
               BloqueiaUsoECF;
            end;
      end;

   { BUSCA O INDICE DA BALANÇA e CASAS DECIMAIS DO CAIXA }
   iBaud  := 0;
   iPorta := 0;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin
             close;
             sql.Clear;
             sql.add('SELECT INDICE_BALANCA, PORTA_BALANCA, BAUD_BALANCA ' +
                     'FROM CAIXA ' +
                     'WHERE COD_CAI = :CODCAI AND COD_EMP = :CODEMP');
             Parambyname('CODCAI').AsInteger := iCaixa;
             Parambyname('CODEMP').AsInteger := iEmp;
             Open;
             iIndiceBalanca:= fieldbyname('indice_balanca').AsInteger;
             if iIndiceBalanca < 7 then
                begin
                   iPorta:= fieldbyname('porta_balanca').AsInteger;
                   iBaud := fieldbyname('baud_balanca').AsInteger;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       iIndiceBalanca:= 7;  //sem balanca
       showmessage('Erro ao buscar o Índice da Balança');
     end;
   finally
     dm.QConsulta.Close;
   end;

   if not bTef then
         AdministraoTEF1.Visible := False;

   if not ErroImpressora then
   begin
    if dm.ECF.Estado = estRequerZ then
       begin
           KDialog( 'ECF Requer leitura Z. Fechamento do caixa pendente', 'SLPDV Informação', 'INFO' );
             Application.ProcessMessages;
             Sleep(200);
           Exit;
       end;
    if not DM.VerificaCaixaAberto then
        begin
           KDialog( 'Caixa ainda não foi aberto', 'SLPDV Informação', 'INFO' );
             Application.ProcessMessages;
             Sleep(200);
           Exit;
        end;
   end
   else
       M002.Visible := False;


      if not ErroImpressora then
         begin
             if ( dm.ACBrAAC1.IdentPAF.Paf.BarSimilarECFComum ) and ( PArquivoVenda = '' ) then
                begin
                   A1.Click;
                end
             else
                begin
                   M001.Click;
                end;
         end;
end;

procedure TFrmPadraoPafECf.G1Click(Sender: TObject);
begin
   Application.CreateForm( TfrmGerenciador, frmGerenciador );
   frmGerenciador.ShowModal;
end;

procedure TFrmPadraoPafECf.FormCreate(Sender: TObject);
begin
   if not Is4DigitYear then
      showmessage('Acerte o formato do ano para 4 Dígitos');
end;

procedure TFrmPadraoPafECf.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (ssCtrl in Shift) and (chr(Key) in ['F', 'f']) then  // Orçamento
      begin
         AdministraoTEF1_Click( nil );
      end;
end;

procedure TFrmPadraoPafECf.L009_Click(Sender: TObject);
begin
   Application.CreateForm(TFrmHorarioVerao, FrmHorarioVerao);
   FrmHorarioVerao.showmodal;
end;

procedure TFrmPadraoPafECf.L010_Click(Sender: TObject);
begin
   ImprimiConfigImpressora(iECF);
end;

procedure TFrmPadraoPafECf.L011_Click(Sender: TObject);
begin
   Application.CreateForm(TFrmAliquota, FrmAliquota);
   FrmAliquota.showmodal;
end;

procedure TFrmPadraoPafECf.C000Click(Sender: TObject);
var
 T: TPoint;
begin
   getCursorPos( T );
   popConsultas.Popup( T.X, T.Y );
end;

procedure TFrmPadraoPafECf.C001_Click(Sender: TObject);
begin
   Application.CreateForm(TFrmConsVendasCaixa, FrmConsVendasCaixa);
   FrmConsVendasCaixa.ShowModal;
end;

procedure TFrmPadraoPafECf.F000_Click(Sender: TObject);
begin
   Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
   FrmMenuFiscal.showmodal;
end;

procedure TFrmPadraoPafECf.M015Click(Sender: TObject);
begin
   Application.CreateForm(TFrmSelfService, FrmSelfService);
   FrmSelfService.showmodal;
end;

procedure TFrmPadraoPafECf.M016Click(Sender: TObject);
begin
   Application.CreateForm(TFrmMesas, FrmMesas);
   FrmMesas.showmodal;
end;

procedure TFrmPadraoPafECf.M006_Click(Sender: TObject);
begin
   Application.CreateForm(TFrmPreVenda, FrmPreVenda);
   FrmPreVenda.ShowModal;
end;

procedure TFrmPadraoPafECf.M007_Click(Sender: TObject);
begin
   Application.CreateForm(TFrmConsPreVenda, FrmConsPreVenda);
   FrmConsPreVenda.showmodal;
end;

procedure TFrmPadraoPafECf.M003_Click(Sender: TObject);
begin
   Application.CreateForm(TFrmVendasPED, frmvendasPED);
   FrmVendasPED.Tag:= 0;
   FrmVendasPED.ShowModal;
end;

procedure TFrmPadraoPafECf.M004_Click(Sender: TObject);
begin
   Application.CreateForm(TFrmConsVendasPED, FrmConsVendasPED);
   FrmConsVendasPED.tag:= 0;
   FrmConsVendasPED.showmodal;
end;


procedure TFrmPadraoPafEcf.ConfiguraMenu;
begin
   if not dm.ECF.Ativo then
      iecf := 99
   else
      iecf := 1;

   if iECF = 99 then   // sem ecf
      begin


         if DM.ACBrAAC1.IdentPAF.Paf.EmitePED then
            begin
               if dm.ECF.Estado = estBloqueada then
                  M002.Visible := True
               else
                  M002.Visible := False;
            end;

         L000.Visible := false;
         M001.Visible := false;

         A1.Visible := False;
//         M002.Visible := True;
         C000.Visible := false;
      end
   else
      begin

         M002.Visible := False;
         A1.Visible := dm.ACBrAAC1.IdentPAF.Paf.BarSimilarECFComum;


         if DM.ACBrAAC1.IdentPAF.Paf.EmitePED then
            begin
               if dm.ECF.Estado = estBloqueada then
                  M002.Visible := True
               else
                  M002.Visible := False;
            end;
      end;
end;
procedure TFrmPadraoPafECf.M012_Click(Sender: TObject);
begin
   Application.CreateForm(TFrmDavOrcamento, FrmDavOrcamento);
   FrmDavOrcamento.tag:= 0;
   FrmDavOrcamento.showmodal;
end;

procedure TFrmPadraoPafECf.M013_Click(Sender: TObject);
begin
   Application.CreateForm(TFrmConsOrcamento, FrmConsOrcamento);
   FrmConsOrcamento.showmodal;
end;

procedure TFrmPadraoPafECf.M009Click(Sender: TObject);
begin
   Application.CreateForm(TFrmDAVOrdemServico, FrmDAVOrdemServico);
   FrmDAVOrdemServico.tag:= 0;
   FrmDAVOrdemServico.showmodal;
end;

procedure TFrmPadraoPafECf.M010Click(Sender: TObject);
begin
   Application.CreateForm(TFrmConsOrdemServico, FrmConsOrdemServico);
   FrmConsOrdemServico.tag:= 0;
   FrmConsOrdemServico.showmodal;
end;

procedure TFrmPadraoPafECf.ProgramarRelatrioGerencial1_Click(
  Sender: TObject);
begin
   Application.CreateForm(TFrmProgramaRelGerencial, FrmProgramaRelGerencial);
   FrmProgramaRelGerencial.showmodal;
end;

procedure TFrmPadraoPafECf.RelatrioporUsurio1Click(Sender: TObject);
begin
   Application.CreateForm( TfrmRelUsuario, frmRelUsuario );
   frmRelUsuario.ShowModal;
end;

procedure TFrmPadraoPafECf.L006_Click(Sender: TObject);
begin
   Application.CreateForm(TFrmCancelaCupomFiscal, FrmCancelaCupomFiscal);
   FrmCancelaCupomFiscal.showmodal;
end;

procedure TFrmPadraoPafECf.A1Click(Sender: TObject);
begin
    if dm.ECF.Estado = estRequerZ then
       begin
           KDialog( 'ECF Requer leitura Z. Fechamento do caixa pendente', 'SLPDV Informação', 'INFO' );
           Exit;
       end;

    if not DM.VerificaCaixaAberto then
        begin
           KDialog( 'Caixa ainda não foi aberto', 'SLPDV Informação', 'INFO' );
           Exit;
        end;
   Application.CreateForm( TFrmMesas, FrmMesas );
   FrmMesas.ShowModal;
end;

procedure TFrmPadraoPafECf.AdministraoTEF1_Click(Sender: TObject);
begin
   Application.CreateForm( TfrmFechaVenda, frmFechavenda );
   frmFechavenda.Tag := 1;
   if TipoTEF = 4 then
      begin
         FrmFechaVenda.ACBrTEFD1.TEFCliSiTef.CodigoLoja := sIDLojaTEF;
         FrmFechaVenda.ACBrTEFD1.TEFCliSiTef.EnderecoIP := sIPTEF;
         FrmFechaVenda.ACBrTEFD1.TEFCliSiTef.NumeroTerminal := sIDTermTEF;
      end;

   frmFechaVenda.ACBrTEFD1.Inicializar( TACBrTEFDTipo( TipoTef ) );
   frmFechaVenda.ACBrTEFD1.ADM( TACBrTEFDTipo( TipoTef ) );
   frmFechaVenda.ACBrTEFD1.DesInicializar( TACBrTEFDTipo( TipoTef ) );
   frmFechaVenda.Free;
end;

procedure TFrmPadraoPafECf.AtualizaEstoque1Click(Sender: TObject);
begin
   if Application.MessageBox('Confirma a Atualização do Estoque?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin
         dm.VerificaEstoqueDia( 1 );
      end;
end;

procedure TFrmPadraoPafEcf.BloqueiaUsoECF;
begin


   L000.Visible:= false;
   M001.Visible:= false;
   A1.Visible := false;
   if dm.ECF.AAC.IdentPAF.Paf.EmitePED then
      M002.Visible := True
   else
      M002.Visible := False;
end;

procedure TFrmPadraoPafECf.MostraConec(var Message: TMessage);
begin
  //
  Conec.Visible := True;
  Desco.Visible := false;
end;
procedure TFrmPadraoPafECf.MostraDesco(var Message: TMessage);
begin
  //
  Conec.Visible := false;
  Desco.Visible := true;
end;

end.

