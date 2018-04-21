unit UCadFor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, Buttons, ExtCtrls, ComCtrls, StdCtrls, Mask, ImgList, 
  ToolWin, pngimage, acPNG, sSpeedButton, cep, acAlphaImageList, InvokeRegistry, 
  Rio, SOAPHTTPClient, UNovosComponentes, UNovoFormulario, cxGraphics, 
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, 
  dxSkinMetropolis, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, 
  dxSkinOffice2013White, dxSkinsdxStatusBarPainter, dxStatusBar, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet,
  dxSkinMetropolisDark, Data.DB;

type
  TFrmCadFor = class(TFrmCadastroNovo)
    Label1: TLabel;
    cod_for: TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    Label6: TLabel;
    EdtEnd: TEdit;
    Label7: TLabel;
    EdtBai: TEdit;
    Label11: TLabel;
    EdtCNPJ: TMaskEdit;
    EdtInsc: TEdit;
    EdtCep: TMaskEdit;
    Label10: TLabel;
    ComboEst: TComboBox;
    Label9: TLabel;
    EdtCid: TEdit;
    Label8: TLabel;
    Label3: TLabel;
    EdtContato: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    ComboFJ: TComboBox;
    IBSQLFor: TFDQuery;
    IBTRFor: TFDTransaction;
    EdtTel: TEdit;
    EdtFax: TEdit;
    Label47: TLabel;
    EdtIBGE: TEdit;
    BtnConsCidade: TsSpeedButton;
    Label53: TLabel;
    EdtNum: TEdit;
    Label57: TLabel;
    EdtEmail: TEdit;
    Image1: TImage;
    sSpeedButton1: TsSpeedButton;
    HTTPRIO1: THTTPRIO;
    procedure ComboFJChange(Sender: TObject);
    procedure EdtCNPJExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure Botoes(acao : string);
    procedure BtnConsCidadeClick(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure EdtCNPJKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function FrmCadFor: TFrmCadFor;

implementation
uses
  Udm, Ubibli1, UConsFor, UConsMunicipios, frmConsultaCPFCNPJ, UNovoPrincipal;
var  bGrava : boolean;

{$R *.dfm}

function FrmCadFor: TFrmCadFor;
begin
   Result := TFrmCadFor( BuscaFormulario( TFrmCadFor, False ) );
end;

procedure TFrmCadFor.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadFor, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadFor);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadFor);
         EDedit(FrmCadFor, false);
         btnNovo.Enabled      := true;
         BtnGravar.Enabled    := false;
         btnCancelar.Enabled  := false;
         if (acao = 'C') or (acao = 'E') then
            btnalterar.Enabled:= false
         else
            btnalterar.Enabled:= true;
         if acao = 'G' then
            btnExcluir.Enabled:= true
         else
            BtnExcluir.Enabled:= false;
         BtnConsultar.Enabled := true;
      end;
end;

procedure TFrmCadFor.ComboFJChange(Sender: TObject);
begin 
  inherited;
  if combofj.ItemIndex = 0 then
     begin 
        label11.Caption   := 'CPF';
        label4.Caption    := 'Documento';
        edtcnpj.EditMask  := '999.999.999-99;1;_';
     end
  else
     begin 
        label11.Caption   := 'CNPJ';
        label4.Caption    := 'Insc.Estadual';
        edtcnpj.EditMask  := '99.999.999/9999-99;1;_';
     end;
end;

procedure TFrmCadFor.EdtCNPJExit(Sender: TObject);
begin 
  inherited;
  if combofj.ItemIndex = 0 then //fisica
     begin 
        if edtcnpj.Text = '   .   .   -  ' then
           exit;
        if not cpf(RetiraCaracter(edtcnpj.Text)) then
           begin 
              AlertaCad('CPF Inválido');
//              edtcnpj.SetFocus;
           end;
     end
  else
     begin 
        if edtcnpj.Text = '  .   .   /    -  ' then
          exit;
        if not cnpj(edtcnpj.Text) then
           begin 
              AlertaCad('CNPJ Inválido');
//              edtcnpj.SetFocus;
           end;
     end;
end;

procedure TFrmCadFor.EdtCNPJKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   case Key of
      vk_f3: sSpeedButton1.Click;
   end;
end;

procedure TFrmCadFor.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('C002','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
              Botoes('N');
              comboest.ItemIndex:= 7;
              combofj.ItemIndex:= 1;
              combofjchange(sender);
              edtnome.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmCadFor.sSpeedButton1Click(Sender: TObject);
  var
   I: Integer;
   Ret: String;
   Rua, Cidade, Bairro, Estado, Ibge: String;
   Cons: CEPServicePort;


begin
  Application.CreateForm( TfmConsultaReceita, fmConsultaReceita );
  if ComboFJ.ItemIndex = 0 then
     fmConsultaReceita.TipoConsulta := consCPF
  else
     fmConsultaReceita.TipoConsulta := consCNPJ;
  fmConsultaReceita.CPFCNPJ := EdtCNPJ.Text;
  if fmConsultaReceita.ShowModal =  mrOk then
     begin
          EdtNome.Text := fmConsultaReceita.Razao;
          EdtEnd.Text := fmConsultaReceita.Endereco;
          EdtNum.Text := fmConsultaReceita.Numero;
          EdtBai.Text := fmConsultaReceita.Bairro;
          EdtCid.Text := fmConsultaReceita.Cidade;
          EdtCep.Text := FormataCEP( fmConsultaReceita.CEP );
                      for i:= 0 to 26 do
                         begin
                            if comboest.Items[i] = fmConsultaReceita.UF then
                               comboest.ItemIndex:= i;
                         end;
        Cons:= GetCEPServicePorT(false,'',HTTPRIO1);
        Ret := Cons.obterLogradouroAuth( EdtCep.Text, 'maiconferreira', 'kelly1' );
        ProcessaRetConsCep( Ret, Rua, Bairro, Cidade, Estado, Ibge );
     end;
   FreeAndNil( fmConsultaReceita );

end;
procedure TFrmCadFor.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  if not DM.Acesso('C002','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  comboest.ItemIndex:= 7;
  combofj.ItemIndex:= 1;
  combofjchange(sender);
  edtnome.SetFocus;
end;

procedure TFrmCadFor.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadFor.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C002','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmCadFor.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
  inherited;
  if IBTRFor.Active then
     IBTRFor.Commit;
  IBSQLFor.Close;
  Action:= caFree;
end;

procedure TFrmCadFor.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('C002','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;

  if edtnome.Text = '' then
     begin 
        AlertaCad('Digite Razão Social do Fornecedor');
//        edtnome.SetFocus;
        exit;
     end;

  { verifica insc.estadual }
{ if trim(EdtInsc.Text) <> '' then
     begin 
        if not VerificaInscricao(EdtInsc.Text, ComboEst.Text) then
           begin 
              AlertaCad('Inscrição Estadual inválida para ' + ComboEst.Text);
              exit;
              abort;
           end;
     end;}

  if IBTRFor.Active then
     IBTRFor.Commit;
  IBTRFor.StartTransaction;
  try
    try
      with IBSQLFor do
        begin 
           close;
           sql.Clear;
           if bGrava then
              begin 
                 cod_for.Text:= inttostr(prxcod('fornecedor', 'cod_for', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO FORNECEDOR(COD_FOR, FJ_FOR, RAZAO_FOR, END_FOR, BAI_FOR, CID_FOR, ' +
                         'EST_FOR, CEP_FOR, TEL_FOR, FAX_FOR, CNPJ_FOR, INSC_FOR, CONTATO_FOR, CODIGO_IBGE, NUM_FOR, EMAIL_FOR) ' +
                         'VALUES(:CODFOR, :FJFOR, :RAZAOFOR, :ENDFOR, :BAIFOR, :CIDFOR, :ESTFOR, ' +
                         ':CEPFOR, :TELFOR, :FAXFOR, :CNPJFOR, :INSCFOR, :CONTATOFOR, :IBGE, :NUM, :EMAIL)');
              end
           else
              begin 
                 sql.Add('UPDATE FORNECEDOR SET FJ_FOR = :FJFOR, RAZAO_FOR = :RAZAOFOR, END_FOR = :ENDFOR, ' +
                         'BAI_FOR = :BAIFOR, CID_FOR = :CIDFOR, EST_FOR = :ESTFOR, CEP_FOR = :CEPFOR, ' +
                         'TEL_FOR = :TELFOR, FAX_FOR = :FAXFOR, CNPJ_FOR = :CNPJFOR, INSC_FOR = :INSCFOR, ' +
                         'CONTATO_FOR = :CONTATOFOR, CODIGO_IBGE = :IBGE, NUM_FOR = :NUM, EMAIL_FOR = :EMAIL WHERE COD_FOR = :CODFOR');
              end;
           Parambyname('codfor').AsInteger     := strtoint(cod_for.Text);
           Parambyname('fjfor').AsString       := combofj.Text;
           Parambyname('razaofor').AsString    := edtnome.Text;
           if edtend.Text = '' then
              Parambyname('endfor').Value      := null
           else
              Parambyname('endfor').AsString   := edtend.Text;
           if edtbai.Text = '' then
              Parambyname('baifor').Value      := null
           else
              Parambyname('baifor').AsString   := edtbai.Text;
           if edtcid.Text = '' then
              Parambyname('cidfor').Value      := null
           else
              Parambyname('cidfor').AsString   := edtcid.Text;
           Parambyname('estfor').AsString      := comboest.Text;
           Parambyname('cepfor').AsString      := edtcep.Text;
           Parambyname('telfor').AsString      := edttel.Text;
           Parambyname('faxfor').AsString      := edtfax.Text;
           Parambyname('cnpjfor').AsString     := edtcnpj.Text;
           Parambyname('inscfor').AsString     := edtinsc.Text;
           Parambyname('contatofor').AsString  := edtcontato.Text;

           if trim(EdtIBGE.text) = '' then
              Parambyname('ibge').Value        := null
           else
              Parambyname('ibge').AsInteger    := strtoint(EdtIBGE.Text);

           Parambyname('num').AsString         := trim(EdtNum.Text);

           if trim(EdtEmail.text) = '' then
              Parambyname('email').Value        := null
           else
              Parambyname('email').AsString     := trim(EdtEmail.Text);

           ExecOrOpen;
        end;
      IBTRFor.Commit;
      Botoes('G');
    except
      IBTRFor.Rollback;
      AlertaCad('Erro ao Gravar o Fornecedor');
    end;
  finally
    IBSQLFor.Close;
  end;
end;

procedure TFrmCadFor.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C002','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadFor, 'fornecedor', cod_for, IBSQLFor, IBTRFor);
  Botoes('E');
end;

procedure TFrmCadFor.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsFor, FrmConsFor);
  FrmConsFor.tag:= 0;
  FrmConsFor.showmodal;
end;

procedure TFrmCadFor.BtnConsCidadeClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsMunicipios, FrmConsMunicipios);
  FrmConsMunicipios.tag:= 3;
  FrmConsMunicipios.showmodal;
end;

end.
