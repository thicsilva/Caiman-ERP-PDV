unit UCadPromocao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Grids, DBGrids, ComCtrls, ToolWin, StdCtrls, Buttons, Mask,
  ExtCtrls, DB, rxToolEdit, rxCurrEdit, cxPC, UNovosComponentes,
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script,
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmCadPromocao = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    cod_promocao: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtCodEmp: UNovosComponentes.TEdit;
    BtnConsEmp: TsSpeedButton;
    EdtNomeEmp: TEdit;
    Label3: TLabel;
    EdtCodProd: UNovosComponentes.TEdit;
    Label21: TLabel;
    BtnConsProd: TsSpeedButton;
    BtnAddProd: TsSpeedButton;
    EdtNomeProd: TEdit;
    Label22: TLabel;
    EdtInicio: TMaskEdit;
    Label4: TLabel;
    EdtTermino: TMaskEdit;
    Label6: TLabel;
    EdtPromocao: TCurrencyEdit;
    EdtPrecoVenda: TCurrencyEdit;
    Label8: TLabel;
    Label7: TLabel;
    Panel3: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    EdtCodProd1: UNovosComponentes.TEdit;
    BtnConsProd1: TsSpeedButton;
    EdtNomeProd1: TEdit;
    Label11: TLabel;
    EdtData: TDateTimePicker;
    Label12: TLabel;
    BtnOK: TBitBtn;
    ToolBar2: TToolBar;
    BtnDelete: TToolButton;
    BtnAltera: TToolButton;
    DBGrid1: TDBGrid;
    ImageList1: TImageList;
    QConsPromocao: TFDQuery;
    QConsPromocaoCOD_PROMOCAO: TIntegerField;
    QConsPromocaoCOD_PRO: TIntegerField;
    QConsPromocaoDATA_INICIO: TDateField;
    QConsPromocaoDATA_TERMINO: TDateField;
    QConsPromocaoVALOR_PROMOCAO: TBCDField;
    QConsPromocaoCOD_EMP: TIntegerField;
    QConsPromocaoNOME_PRO: TStringField;
    QConsPromocaoVALOR_PRO: TBCDField;
    DSQConsPromocao: TDataSource;
    IBSQLPromo: TFDQuery;
    IBTRPromo: TFDTransaction;
    QInsPromo: TFDQuery;
    BtnCancelar: TBitBtn;
    BtnSair: TBitBtn;
    Label5: TLabel;
    ComboTipo: TComboBox;
    QConsPromocaoCALC_TIPO: TStringField;
    QConsPromocaoTIPO_PROMOCAO: TIntegerField;
    procedure EdtCodProdEnter(Sender: TObject);
    procedure EdtCodProdKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsProdClick(Sender: TObject);
    procedure BtnAddProdClick(Sender: TObject);
    procedure BtnConsProd1Click(Sender: TObject);
    procedure EdtCodProdExit(Sender: TObject);
    procedure EdtCodEmpExit(Sender: TObject);
    procedure EdtCodEmpEnter(Sender: TObject);
    procedure EdtCodEmpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure EdtPromocaoExit(Sender: TObject);
    procedure Gravar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnConsEmpClick(Sender: TObject);
    procedure EdtCodProd1Enter(Sender: TObject);
    procedure EdtCodProd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodProd1Exit(Sender: TObject);
    procedure EdtInicioExit(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnAlteraClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure QConsPromocaoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function FrmCadPromocao: TFrmCadPromocao;

implementation
uses
  UDM, UBibli1, UConsProd, UCadProduto, UConsEmp, UNovoPrincipal;
var bGrava : boolean;
var iCod   : integer;

{$R *.dfm}

function FrmCadPromocao: TFrmCadPromocao;
begin
   Result := TFrmCadPromocao( BuscaFormulario( TFrmCadPromocao, False ) );
end;

procedure TFrmCadPromocao.Gravar;
begin
  if IBTRPromo.Active then
     IBTRPromo.Commit;
  IBTRPromo.StartTransaction;
  if bGrava then
     begin
        try
          try
            with QInsPromo do
              begin
                 close;
                 Parambyname('codpro').AsInteger    := strtoint(EdtCodProd.Text);
                 Parambyname('inicio').AsDate       := strtodate(EdtInicio.Text);
                 Parambyname('termino').AsDate      := strtodate(EdtTermino.Text);
                 Parambyname('promocao').AsCurrency := strtocurr(EdtPromocao.Text);
                 Parambyname('tipo').AsInteger      := ComboTipo.ItemIndex;
                 if EdtCodEmp.Text = '' then
                    Parambyname('codemp').value     := null
                 else
                    Parambyname('codemp').AsInteger := strtoint(EdtCodEmp.Text);
                 Open;
                 cod_promocao.Text:= fieldbyname('codigo').AsString;
              end;
            IBTRPromo.Commit;
            EdtCodProd1.Enabled:= true;
            EdtData.Enabled    := true;
          except
            IBTRPromo.Rollback;
            AlertaCad('Erro ao gravar a Promoção');
          end;
        finally
          QInsPromo.Close;
        end;
     end
  else
     begin
        try
          try
            with IBSQLPromo do
               begin
                  close;
                  sql.Clear;
                  sql.add('UPDATE PROMOCOES SET COD_PRO = :CODPRO, DATA_INICIO = :INICIO, ' +
                          'DATA_TERMINO = :TERMINO, VALOR_PROMOCAO = :PROMOCAO, ' +
                          'COD_EMP = :CODEMP, TIPO_PROMOCAO = :TIPO ' +
                          'WHERE COD_PROMOCAO = :COD');
                  Parambyname('codpro').AsInteger    := strtoint(EdtCodProd.Text);
                  Parambyname('inicio').AsDate       := strtodate(EdtInicio.Text);
                  Parambyname('termino').AsDate      := strtodate(EdtTermino.Text);
                  Parambyname('promocao').AsCurrency := strtocurr(EdtPromocao.Text);
                  if EdtCodEmp.Text = '' then
                     Parambyname('codemp').value     := null
                  else
                     Parambyname('codemp').AsInteger := strtoint(EdtCodEmp.Text);
                  Parambyname('tipo').AsInteger      := ComboTipo.ItemIndex;
                  Parambyname('cod').AsInteger       := strtoint(cod_promocao.Text);
                  ExecOrOpen;
               end;
            IBTRPromo.Commit;
            EdtCodProd1.Enabled:= true;
            EdtData.Enabled    := true;
          except
            IBTRPromo.Rollback;
            AlertaCad('Erro ao gravar a promoção');
          end;
        finally
          IBSQLPromo.Close;
        end;
     end;
end;

procedure TFrmCadPromocao.EdtCodProdEnter(Sender: TObject);
begin
   EdtCodProd.SelectAll;
end;

procedure TFrmCadPromocao.EdtCodProdKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmCadPromocao.EdtCodProdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f3 then
     BtnConsProd.Click
  else
     if key = vk_f2 then
        BtnAddProd.Click;
end;

procedure TFrmCadPromocao.BtnConsProdClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsProd, FrmConsProd);
   FrmConsProd.tag:= 22;
   FrmConsProd.showmodal;
end;

procedure TFrmCadPromocao.BtnAddProdClick(Sender: TObject);
begin
   BuscaFormulario( TFrmCadProduto, True  );
end;

procedure TFrmCadPromocao.BtnConsProd1Click(Sender: TObject);
begin
   Application.CreateForm(TFrmConsProd, FrmConsProd);
   FrmConsProd.tag:= 23;
   FrmConsProd.showmodal;
end;

procedure TFrmCadPromocao.EdtCodProdExit(Sender: TObject);
begin
   if EdtCodProd.Text = '' then
     exit;

  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.QConsulta do
         begin
            close;
            sql.Clear;
            sql.add('SELECT COD_PRO, NOME_PRO, VALOR_PRO FROM PRODUTO WHERE COD_PRO = :CODPRO');
            Parambyname('codpro').AsInteger:= strtoint(EdtCodProd.text);
            open;
            if not fieldbyname('cod_pro').IsNull then
               begin
                  EdtNomeProd.Text  := fieldbyname('nome_pro').AsString;
                  EdtPrecoVenda.Text:= fieldbyname('valor_pro').AsString;
               end
            else
               begin
                  EdtNomeProd.Clear;
                  EdtPrecoVenda.Clear;
                  AlertaCad('Produto não Cadastrado');
//                  EdtCodProd.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('Erro ao buscar os dados do produto');
//      EdtCodProd.SetFocus;
    end;
  finally
    dm.QConsulta.Close;
  end;
end;

procedure TFrmCadPromocao.EdtCodEmpExit(Sender: TObject);
begin
  if EdtCodEmp.Text = '' then
     begin
        EdtNomeEmp.Clear;
        exit;
        abort;
     end;
  EdtNomeEmp.Text:= Consulta('empresa', EdtCodEmp, 'cod_emp', 'razao_emp', dm.IBTransaction, dm.qConsulta);
  if EdtNomeEmp.Text = '' then
     begin
        AlertaCad('Empresa não Cadastrada');
//        EdtCodEmp.SetFocus;
     end;
end;

procedure TFrmCadPromocao.EdtCodEmpEnter(Sender: TObject);
begin
   EdtCodEmp.SelectAll;
end;

procedure TFrmCadPromocao.EdtCodEmpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f3 then
      BtnConsEmp.Click;
end;

procedure TFrmCadPromocao.FormShow(Sender: TObject);
begin
   iCod           := 0;
   bGrava         := true;
   EdtData.Date   := date;
   EdtInicio.Text := datetostr(date);
   EdtTermino.Text:= datetostr(date);
   ComboTipo.ItemIndex := 0;
   BtnOK.Click;
   EdtCodProd.SetFocus;
end;

procedure TFrmCadPromocao.EdtPromocaoExit(Sender: TObject);
begin
   if BtnCancelar.Focused then
      exit;

   if EdtCodProd.Text = '' then
      begin
         EdtCodProd.SetFocus;
         exit;
         abort;
      end;

   if EdtPromocao.Text = '0' then
      begin
         EdtPromocao.SetFocus;
         exit;
         abort;
      end;

   if strtodate(EdtTermino.Text) < StrToDate(EdtInicio.Text) then
      begin
         AlertaCad('O término tem que ser maior que o início');
//         EdtInicio.SetFocus;
         exit;
         abort;
      end;

  if strtodate(EdtTermino.Text) < date then
     begin
        AlertaCad('O término tem que ser maior ou igual hoje');
//        EdtInicio.SetFocus;
        exit;
        abort;
     end;

   if strtocurr(EdtPromocao.Text) > strtocurr(EdtPrecoVenda.Text) then
     begin
        AlertaCad('O preço de promocional está maior que o preco de venda');
//        EdtPromocao.SetFocus;
        exit;
        abort;
     end;
  if application.MessageBox('Confirma a Promoção?', 'Promoção', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton1) = 6 then
     begin
        Gravar;
        BtnOK.Click;
        if not bGrava then
           DBGrid1.SetFocus
        else
           EdtCodProd.SetFocus;
        bGrava:= true;
        EdtCodProd.Clear;
        EdtNomeProd.Clear;
        EdtPromocao.Clear;
        EdtPrecoVenda.Clear;
     end
  else
     bGrava:= true;
end;

procedure TFrmCadPromocao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if IBTRPromo.Active then
      IBTRPromo.Commit;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   QInsPromo.Close;
   IBSQLPromo.Close;
   Action:= caFree;
end;

procedure TFrmCadPromocao.BtnConsEmpClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsEmp, FrmConsEmp);
   FrmConsEmp.tag:= 3;
   FrmConsEmp.showmodal;
end;

procedure TFrmCadPromocao.EdtCodProd1Enter(Sender: TObject);
begin
    EdtCodProd1.SelectAll;
end;

procedure TFrmCadPromocao.EdtCodProd1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_f3 then
     BtnConsProd1.Click;
end;

procedure TFrmCadPromocao.EdtCodProd1Exit(Sender: TObject);
begin
  if EdtCodProd1.Text = '' then
     begin
        EdtNomeProd1.Clear;
        exit;
        abort;
     end;
  EdtNomeProd1.Text:= Consulta('produto', EdtCodProd1, 'cod_pro', 'nome_pro', dm.IBTransaction, dm.qConsulta);
  if EdtNomeProd1.Text = '' then
     begin
        AlertaCad('Produto não Cadastrado');
//        EdtCodProd1.SetFocus;
     end;
end;

procedure TFrmCadPromocao.EdtInicioExit(Sender: TObject);
begin
  with sender as TMaskEdit do
    begin
       try
         strtodate(Text);
       except
         AlertaCad('Data Inválida');
//         EdtInicio.SetFocus;
       end;
    end;
end;

procedure TFrmCadPromocao.BtnOKClick(Sender: TObject);
begin
   if DM.IBTRAux.Active THEN
      dm.IBTRAux.Commit;
   dm.IBTRAux.StartTransaction;
   with QConsPromocao do
     begin
        close;
        sql.Clear;
        sql.add('SELECT P.*, Z.NOME_PRO, Z.VALOR_PRO ' +
                'FROM PROMOCOES P ' +
                ' INNER JOIN PRODUTO Z ' +
                'ON (P.COD_PRO = Z.COD_PRO)');
        if trim(EdtCodProd1.Text) <> '' then
           begin
              sql.add(' WHERE P.COD_PRO = :CODPRO AND P.DATA_TERMINO >= :DATA');
              Parambyname('codpro').AsInteger:= strtoint(EdtCodProd1.Text);
           end
        else
           sql.Add(' WHERE P.DATA_TERMINO >= :DATA');
        sql.add(' ORDER BY Z.NOME_PRO');
        Parambyname('data').AsDate:= edtdata.Date;
        open;
        Locate('COD_PROMOCAO', iCod, []);
     end;
  DBGrid1.SetFocus;
end;

procedure TFrmCadPromocao.BtnDeleteClick(Sender: TObject);
begin
   if application.MessageBox('Confirma a Exclusão da Promoção?', 'Exclusão', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton2) = 6 then
     begin
        QConsPromocao.Next;
        iCod:= QConsPromocaoCOD_PROMOCAO.AsInteger;
        QConsPromocao.Prior;
        if dm.IBTransaction.Active then
           dm.IBTransaction.Commit;
        dm.IBTransaction.StartTransaction;
        try
          try
            with dm.Consulta do
               begin
                  close;
                  sql.Clear;
                  sql.add('DELETE FROM PROMOCOES WHERE COD_PROMOCAO = :COD');
                  Parambyname('cod').AsInteger:= QConsPromocaoCOD_PROMOCAO.AsInteger;
                  ExecOrOpen;
               end;
            dm.IBTransaction.Commit;
          except
            dm.IBTransaction.Rollback;
            AlertaCad('Erro ao excluir a promoção');
          end;
        finally
          dm.Consulta.Close;
          BtnOK.Click;
        end;
     end;
end;

procedure TFrmCadPromocao.BtnAlteraClick(Sender: TObject);
begin
   bGrava:= false;
   iCod               := QConsPromocaoCOD_PROMOCAO.AsInteger;
   cod_promocao.Text  := QConsPromocaoCOD_PROMOCAO.AsString;
   EdtCodProd.Text    := QConsPromocaoCOD_PRO.AsString;
   EdtNomeProd.Text   := QConsPromocaoNOME_PRO.AsString;
   EdtCodEmp.Text     := QConsPromocaoCOD_EMP.AsString;
   EdtInicio.Text     := QConsPromocaoDATA_INICIO.AsString;
   EdtTermino.Text    := QConsPromocaoDATA_TERMINO.AsString;
   EdtPromocao.Text   := QConsPromocaoVALOR_PROMOCAO.AsString;
   ComboTipo.ItemIndex:= QConsPromocaoTIPO_PROMOCAO.AsInteger;
   EdtCodProd.SetFocus;
end;

procedure TFrmCadPromocao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close;
end;

procedure TFrmCadPromocao.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmCadPromocao.BtnSairClick(Sender: TObject);
begin
   if Parent is TcxTabSheet then
      frmMenu.FTDI.CloseTabOfForm( TFormClass( Self.ClassType ) )
   else
      close;

end;

procedure TFrmCadPromocao.BtnCancelarClick(Sender: TObject);
begin
   bGrava:= true;
   EdtCodProd.Clear;
   EdtNomeProd.Clear;
   EdtCodEmp.Clear;
   EdtNomeEmp.Clear;
   EdtPromocao.Clear;
   EdtPrecoVenda.Clear;
   EdtCodProd.SetFocus;
end;

procedure TFrmCadPromocao.DBGrid1Enter(Sender: TObject);
begin
   FrmCadPromocao.KeyPreview:= false;
end;

procedure TFrmCadPromocao.DBGrid1Exit(Sender: TObject);
begin
   FrmCadPromocao.KeyPreview:= true;
end;

procedure TFrmCadPromocao.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      BtnAltera.Click;
end;

procedure TFrmCadPromocao.QConsPromocaoCalcFields(DataSet: TDataSet);
begin
   case QConsPromocaoTIPO_PROMOCAO.AsInteger of
     0: QConsPromocaoCALC_TIPO.AsString:= 'PANFLETO';
     1: QConsPromocaoCALC_TIPO.AsString:= 'DA CASA';
     2: QConsPromocaoCALC_TIPO.AsString:= 'VENCIMENTO';
   end;
end;

end.




