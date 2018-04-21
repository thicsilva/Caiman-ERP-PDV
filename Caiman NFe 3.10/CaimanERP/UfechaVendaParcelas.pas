unit UfechaVendaParcelas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinMetropolis, Vcl.StdCtrls,
  cxButtons, Vcl.Grids, Vcl.DBGrids, dxGDIPlusClasses, Vcl.ExtCtrls, cxControls,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, cxCalendar;

type
  TfrmFechaVendaParcelas = class(TForm)
    Image1: TImage;
    edtCodTpv: TEdit;
    edtCodCliente: TEdit;
    edtDescTPV: TEdit;
    edtDescCliente: TEdit;
    cxGridParcelasDB: TcxGridDBTableView;
    cxGridParcelasLV: TcxGridLevel;
    cxGridParcelas: TcxGrid;
    cxGridParcelasDBDATA_CTR: TcxGridDBColumn;
    cxGridParcelasDBVENCTO_CTR: TcxGridDBColumn;
    cxGridParcelasDBVALOR_CTR: TcxGridDBColumn;
    cxGridParcelasDBDTPAGTO_CTR: TcxGridDBColumn;
    cxGridParcelasDBPARCELA_CTR: TcxGridDBColumn;
    btnConfirmar: TcxButton;
    cxStyleRepository1: TcxStyleRepository;
    cxstyl1: TcxStyle;
    Label1: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edtCodTpvExit(Sender: TObject);
    procedure edtCodClienteExit(Sender: TObject);
    procedure edtCodTpvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConfirmarClick(Sender: TObject);
    function SelecionaCliente: Boolean;
    procedure cxGridParcelasEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Liberado: Boolean;
  end;

var
  frmFechaVendaParcelas: TfrmFechaVendaParcelas;

implementation

{$R *.dfm}

uses UFechaVenda, UDM, UConsTipoVenda, UConsCli, UVenda, USitCli,
  UsenhaLiberarVenda;

procedure TfrmFechaVendaParcelas.btnConfirmarClick(Sender: TObject);
begin
   if not Liberado then
      begin
         AlertaCad( 'Venda não Liberada!' );
         Exit;
      end;
   if ( FrmVenda.EdtCodTPV.Text <> edtCodTpv.Text )
    or ( FrmVenda.EdtCodcli.Text <> edtCodCliente.Text ) then
       begin
          if dm.IBTransaction.Active then
             DM.IBTransaction.Commit;
          DM.IBTransaction.StartTransaction;
          try
             with DM.QConsulta do
                begin
                   SQL.Text := 'UPDATE VENDAS SET COD_TPV=:COD_TPV,' +
                               'COD_CLI=:COD_CLI WHERE COD_VEN=:COD_VEN ' +
                               'AND COD_EMP=:COD_EMP';
                   ParamByName( 'COD_TPV' ).AsString := edtCodTpv.Text;
                   ParamByName( 'COD_CLI' ).AsString := edtCodCliente.Text;
                   ParamByName( 'COD_VEN' ).AsString := FrmVenda.EdtCod.Text;
                   ParamByName( 'COD_EMP' ).AsInteger := iEmp;
                   ExecSQL;
                   FrmVenda.EdtCodcli.Text := edtCodCliente.Text;
                   FrmVenda.EdtCodTPV.Text := edtCodTpv.Text;
                   FrmVenda.EdtNomeTPV.Text := edtDescTPV.Text;
                   FrmVenda.EdtNomecli.Text := edtDescCliente.Text;
                end;
          finally
              DM.QConsulta.Close;
             dm.IBTransaction.Commit;
          end;
       end;

    ModalResult := mrOk;
end;

procedure TfrmFechaVendaParcelas.cxGridParcelasEnter(Sender: TObject);
begin
   cxGridParcelasDB.Columns[3].FocusWithSelection;
end;

procedure TfrmFechaVendaParcelas.edtCodClienteExit(Sender: TObject);
begin
   Liberado := SelecionaCliente;
   if not Liberado then
      begin
         AlertaCad( 'Venda não Liberada!' );
         Exit;
      end;
   try
       FrmFechaVenda.GeraParcelas( 'PR', StrToInt( edtCodTpv.Text ), StrToInt( edtCodCliente.Text  ));
       cxGridParcelas.SetFocus;
   except
       AlertaCad( 'Erro ao Gerar Parcelas!' );
       edtCodTpv.SetFocus;
       Exit;
   end;
end;

procedure TfrmFechaVendaParcelas.edtCodClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   case Key of
       VK_F3: begin
                 Application.CreateForm( TFrmConsCli, FrmConsCli );
                 FrmConsCli.Tag := 47;
                 FrmConsCli.ShowModal;
              end;
   end;
end;

procedure TfrmFechaVendaParcelas.edtCodTpvExit(Sender: TObject);
begin
   try
       edtDescTPV.Text := dm.RetornaStringTabela( 'NOME_TPV', 'TIPO_VENDA', 'COD_TPV',
        StrToInt( edtCodTpv.Text ) );
   except
       AlertaCad( 'Erro ao Buscar Tipo de Venda!' );
       edtDescTPV.Clear;
       edtCodTpv.SetFocus;
       Exit;
   end;
end;

procedure TfrmFechaVendaParcelas.edtCodTpvKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   case Key of
       VK_F3: begin
                 Application.CreateForm( TFrmConsTipoVenda, FrmConsTipoVenda );
                 FrmConsTipoVenda.Tag := 10;
                 FrmConsTipoVenda.ShowModal;
              end;
   end;
end;

procedure TfrmFechaVendaParcelas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
       VK_ESCAPE: ModalResult := mrCancel;
       VK_F8: edtCodTpv.SetFocus;
       VK_RETURN: GetParentForm(Self).Perform(CM_DIALOGKEY, VK_TAB, 0);
    end;
end;

procedure TfrmFechaVendaParcelas.FormShow(Sender: TObject);
begin
   Liberado := False;
    edtCodTpvExit(nil);
   try
       edtDescCliente.Text := dm.RetornaStringTabela( 'NOME_CLI', 'CLIENTE', 'COD_CLI',
        StrToInt( edtCodCliente.Text ) );
   except
       AlertaCad( 'Erro ao Buscar Cliente!' );
       edtDescCliente.Clear;
       edtCodCliente.SetFocus;
       Exit;
   end;
    edtCodTpv.SetFocus;
end;

function TfrmFechaVendaParcelas.SelecionaCliente: Boolean;
var
  bContLimiteCli, bAchou, bBloqueado: boolean;
begin
  inherited;
  Result := False;
  if dm.IBTransaction.Active then
    dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.Consulta do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT C.COD_CLI, C.NOME_CLI, C.BLOQUEADO_CLI,  ' +
            'C.CONTROLAR_LIMITE, C.ESTRES_CLI, V.NOME_CON, V.DESCONTO_CON  ' +
            'FROM CLIENTE C ' + 'INNER JOIN CONVENIO V ' +
            'ON (C.COD_CON = V.COD_CON) ' + 'WHERE C.COD_CLI = :CODCLI');
        ParamByName('codcli').AsInteger := strtoint(EdtCodCliente.text);
        ExecOrOpen;
        if recordcount > 0 then
        begin
          bAchou := true;
          if trim(FieldByName('controlar_limite').AsString) = 'S' then
            bContLimiteCli := true
          else
            bContLimiteCli := false;

          edtDescCliente.text := FieldByName('nome_cli').AsString;

          if trim(FieldByName('bloqueado_cli').AsString) = 'S' then
          begin
            bBloqueado := true;
            AlertaCad('Cliente Bloqueado');
            EdtDesccliente.Clear;

//            EdtCodcli.SetFocus;
          end
          else
          begin
            bBloqueado := false;
        //    LConv.Caption := FieldByName('nome_con').AsString;
          end;
        end
        else
        begin
          bAchou := false;
          AlertaCad('Cliente não Cadastrado');
          EdtDesccliente.Clear;

//          EdtCodcli.SetFocus;
        end;
      end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      bAchou := false;
      AlertaCad('Erro ao Buscar o Cliente');
      EdtDesccliente.Clear;

//      EdtCodcli.SetFocus;
    end;
  finally
    dm.Consulta.Close;
  end;
  Result := True;
  if (bAchou) and (strtoint(EdtCodCliente.text) <> FrmVenda.iClienteVista) then
  begin
    Application.CreateForm(TFrmSitCli, FrmSitCli);
    FrmSitCli.tag := 1;
    FrmSitCli.showmodal;

    if not bBloqueado then
    begin
      if iAtrasoMaximo > 0 then
      begin
        if iDiasAtrazo > iAtrasoMaximo then
        begin
          AlertaCad('O Cliente ultrapassou o atraso máximo');
          Application.CreateForm(TFrmSenhaLiberaVenda, FrmSenhaLiberaVenda);
          FrmSenhaLiberaVenda.tag := 2;
          FrmSenhaLiberaVenda.showmodal;
          if not Result then
            edtCodCliente.SetFocus;
          Result := false;
        end;
      end;
      if bContLimiteCli then
      begin
        if cSaldoCliente < 0 then
        begin
          AlertaCad('Cliente sem Saldo, verifique o Limite do Cliente');
          Application.CreateForm(TFrmSenhaLiberaVenda, FrmSenhaLiberaVenda);
          FrmSenhaLiberaVenda.tag := 4;
          FrmSenhaLiberaVenda.showmodal;
          if Not Result then
            edtCodCliente.SetFocus;
          Result := false;
        end;
      end;
    end;
  end;
end;

end.
