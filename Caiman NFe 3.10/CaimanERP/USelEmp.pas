unit USelEmp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, StdCtrls, DB, Grids, DBGrids, ComCtrls, pngimage, acPNG, 
  pcnConversao, UGerenciamentoNFe, UNovosComponentes, UNovoFormulario, 
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, 
  dxSkinMetropolis, dxSkinsdxStatusBarPainter, dxStatusBar, dxGDIPlusClasses, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet,
  dxSkinMetropolisDark;

type
  TFrmSelEmp = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    QEmp: TFDQuery;
    DSQEmp: TDataSource;
    BtnOk: TButton;
    BtnSair: TButton;
    QEmpCOD_EMP: TIntegerField;
    QEmpRAZAO_EMP: TStringField;
    QConsCaixa: TFDQuery;
    IBTRSelEmp: TFDTransaction;
    QEmpCAMINHO_FOTO_EMP: TStringField;
    QEmpTIPO_EMP: TIntegerField;
    QEmpCNPJ_EMP: TStringField;
    Image1: TImage;
    dxStatusBar1: TdxStatusBar;
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BuscaEmpresas;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelEmp: TFrmSelEmp;

implementation
uses
  Udm, Ubibli1, UNovoPrincipal, UDicTributacao;
var  bFechaForm : boolean;

{$R *.dfm}

procedure TFrmSelEmp.BuscaEmpresas;
begin 
   { verifica se o sistema é demonstracao }
   if bDemonstracao then
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
                   sql.Text:= 'UPDATE EMPRESA SET RAZAO_EMP = ' + #39 + 'EMPRESA DEMONSTRACAO' + #39 + ', ' +
                              'FANTASIA_EMP = ' + #39 + 'EMPRESA DEMONSTRACAO' + #39;
                   ExecOrOpen;
                end;
             dm.IBTransaction.Commit;
           except
             dm.IBTransaction.Rollback;
           end;
         finally
           dm.QConsulta.Close;
         end;
      end;

   if IBTRSelEmp.Active then
      IBTRSelEmp.Commit;
   IBTRSelEmp.StartTransaction;
   with QEmp do
      begin 
         close;
         sql.Clear;
         sql.Add('SELECT U.COD_EMP, E.RAZAO_EMP, E.TIPO_EMP, E.CNPJ_EMP, ' +
                 'E.CAMINHO_FOTO_EMP         ' +
                 'FROM EMPRESA_USUARIO U     ' +
                 'INNER JOIN EMPRESA E       ' +
                 'ON (U.COD_EMP = E.COD_EMP) ' +
                 'WHERE U.COD_USU = :CODUSU  ' +
                 'ORDER BY U.COD_EMP');
         Parambyname('codusu').AsInteger:= iCodUsu;
         open;
         if recordcount = 0 then
            btnok.Enabled:= false
         else
            btnok.Enabled:= true;
         first;
      end;
   IBTRSelEmp.CommitRetaining;
   dbgrid1.SetFocus;
end;

procedure TFrmSelEmp.BtnSairClick(Sender: TObject);
begin 
   bFechaForm:= true;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QEmp.Close;
   if tag = 0 then
      begin 
         //dm.IBDatabase.Connected:= false;
         Application.Terminate;
      end
   else
      close;
end;

procedure TFrmSelEmp.FormShow(Sender: TObject);
begin 
   bFechaForm:= false;
   BuscaEmpresas;
end;

procedure TFrmSelEmp.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
   if IBTRSelEmp.Active then
      IBTRSelEmp.Commit;
   QEmp.Close;
   Action:= caFree;
end;

procedure TFrmSelEmp.BtnOkClick(Sender: TObject);
begin
   iEmp         := QEmpCOD_EMP.AsInteger;
   iTipoEmp     := QEmpTIPO_EMP.AsInteger;
   sCNPJEmpresa := QEmpCNPJ_EMP.AsString;

   if not dm.VerificaCNPJCadastrado(sCNPJEmpresa) then
      begin 
         AlertaCad('Empresa não autorizada');
         IBTRSelEmp.Commit;
         Application.Terminate;
      end;

   FrmMenu.sb.Panels[3].Text:= QEmpRAZAO_EMP.AsString;

   DicAligatorTrib.IniciaTributacao( iEmp );

   { VERIFICA SE TEM CAIXA CADASTRADO NA EMPRESA SELECIONADA }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QConsCaixa do
          begin 
             Parambyname('codemp').AsInteger:= iEmp;
             open;
             if recordcount = 0 then
                begin 
                   AlertaCad('Empresa sem caixa cadastrado, ' + #13 +
                               '- Não deixe de cadastrar o(s) caixas para esta empresa' + #13 +
                               '- Não esqueça das configurações');
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao Verificar se tem caixa cadastrado nesta empresa');
     end;
   finally
     QConsCaixa.Close;
   end;

   bFechaForm:= true;


  { busca parametros }
   DM.ConfiguraNFe( DM.ACBrNFe1 );
   close;
end;

procedure TFrmSelEmp.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmSelEmp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      BtnSair.Click;
end;

procedure TFrmSelEmp.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin 
   CanClose:= bFechaForm;
end;

end.
