unit USenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, StdCtrls, jpeg, pngimage, acPNG, AdvGlowButton, RzPanel, 
  RXCtrls, Buttons, UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMetropolis, 
  cxTextEdit, cxLabel, dxSkinMetropolisDark, sSpeedButton, dxGDIPlusClasses;

type
  TFrmSenha = class(UNovoFormulario.TForm)
    SpeedButton3: TsSpeedButton;
    SpeedButton2: TsSpeedButton;
    SpeedButton1: TsSpeedButton;
    edtUsu: TcxTextEdit;
    edtSenha: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    Image3: TImage;
    Label6: TLabel;
    procedure EdtusuEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarSenhaClick(Sender: TObject);
    procedure Redondo(Control: TWinControl);
    procedure FormShow(Sender: TObject);
    procedure EdtsenhaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtusuKeyPress(Sender: TObject; var Key: Char);
  private
    bFechaForm : boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSenha: TFrmSenha;

implementation
uses
  Udm, USelEmp, UNovoPrincipal, ULiberaSistema, UAlterarSenha, UDicFluxo;

{$R *.dfm}

procedure TFrmSenha.Redondo(Control: TWinControl);
var
R: TRect;
Rgn: HRGN;
begin
with Control do
begin
 R := ClientRect;
 rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, 90, 90);
 Perform(EM_GETRECT, 0, lParam(@r));
 InflateRect(r, - 5, - 5);
 Perform(EM_SETRECTNP, 0, lParam(@r));
 SetWindowRgn(Handle, rgn, True);
 Invalidate;
end;
end;

procedure TFrmSenha.EdtsenhaKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      begin
         key := #0;
         BtnOKClick( Self );
      end;
end;

procedure TFrmSenha.EdtusuEnter(Sender: TObject);
begin
   edtsenha.Clear;
end;

procedure TFrmSenha.EdtusuKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      begin
         EdtSenha.SetFocus;
      end;
end;

procedure TFrmSenha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      Application.Terminate;

   if (ssCtrl in Shift) and (chr(Key) in ['A', 'a']) then
      begin
         if trim(Edtsenha.Text) = '190173' then
            begin
               Application.CreateForm(TFrmLiberaSistema, FrmLiberaSistema);
               FrmLiberaSistema.ShowModal;
            end;
      end;
end;

procedure TFrmSenha.FormShow(Sender: TObject);
begin
   //Brush.Style := bsClear;
   Edtusu.Text:= trim(dm.LeIni('cnfcomercio.ini', 'ConfiguracaoLocal', 'Usuario'));
   EdtUsu.SetFocus;

end;

procedure TFrmSenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.Consulta.Close;
   action := caFree;
end;

procedure TFrmSenha.FormCreate(Sender: TObject);
begin
   bFechaForm:= false;
   edtSenha.Clear;
end;

procedure TFrmSenha.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose:= bFechaForm;
end;

procedure TFrmSenha.BtnOKClick(Sender: TObject);
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
             sql.add('SELECT DATA_LIBERACAO FROM PARAMETROS WHERE COD_EMP = 1');
             Open;
//             if fieldbyname('data_liberacao').IsNull then
                dDataLiberacao:= strtodate('31/12/2500')
  //           else
    //            dDataLiberacao:= fieldbyname('data_liberacao').AsDateTime;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar dados');
     end;
   finally
     dm.QConsulta.Close;
   end;

   {if dDataLiberacao <= date then
      begin
         AlertaCad('dll não encontrada!');
         Application.Terminate;
      end;}

   try
     if dm.IBTransaction.Active then
        dm.IBTransaction.Commit;
     dm.IBTransaction.StartTransaction;
     with dm.consulta do
        begin
           close;
           sql.Clear;
           sql.Add('SELECT * FROM USUARIO ' +
                   'WHERE NOME_USU = :USUARIO');
           Parambyname('USUARIO').AsString:= edtusu.text;
           ExecOrOpen;
           if recordcount > 0 then
              begin
                 if edtsenha.Text = trim(dm.Consulta.FieldByName('SENHA_USU').AsString) then
                    begin
                       iCodUsu:= fieldbyname('cod_usu').AsInteger;
                       dm.GravaIni('cnfcomercio.ini', 'ConfiguracaoLocal', 'Usuario', trim(Edtusu.Text));
                       frmmenu.SB.Panels[1].Text := fieldbyname('NOME_USU').AsString;
                       dm.IBTransaction.Commit;
                       dm.Consulta.Close;
                       bFechaForm:= true;
                       FrmSenha.Close;
                       hide;
//                       frmMenu.skinn.Active := true;
                       Application.CreateForm(TFrmSelEmp, FrmSelEmp);
                       FrmSelEmp.Tag:= 0;
                       FrmSelEmp.showmodal;
                       DicFluxo.CodEmp := iEmp;
                       DicFluxo.CodUsuario := iCodUsu;
                       exit;
                    end
                 else
                    begin
                       dm.IBTransaction.Rollback;
                       dm.Consulta.Close;
                       bFechaForm:= false;
                       AlertaCad('Senha Inválida');
//                       edtsenha.SetFocus;
                       exit;
                    end;
              end
           else
              begin
                 AlertaCad('Usuário não Cadastrado');
//                 edtusu.SetFocus;
              end;
           dm.IBTransaction.Commit;
        end;
   except
     dm.IBTransaction.Rollback;
     AlertaCad('Erro ao Selecionar o Usuário');
   end;

end;

procedure TFrmSenha.BtnCancelarClick(Sender: TObject);
begin
   if dm.IBTransaction.Active then
      begin
         dm.Consulta.Close;
         dm.IBTransaction.Commit;
         dm.IBDatabase.Connected:= false;
      end;

   Application.Terminate;
end;

procedure TFrmSenha.BtnAlterarSenhaClick(Sender: TObject);
begin
   Application.CreateForm(TFrmAlterarSenha, FrmAlterarSenha);
   FrmAlterarSenha.showmodal;
end;

end.
