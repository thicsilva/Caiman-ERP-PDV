unit UConsCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DB, UVendasCaixa, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmConsCli = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    ComboCons: TComboBox;
    GB2: TGroupBox;
    EdtCons: TEdit;
    BtnOk: TButton;
    Panel2: TPanel;
    BtnSair: TButton;
    DBGrid: TDBGrid;
    BtnLocalizar: TButton;
    QConsCli: TFDQuery;
    DSQConsCli: TDataSource;
    QConsCliNOME_CLI: TStringField;
    QConsCliCNPJ_CLI: TStringField;
    QConsCliENDRES_CLI: TStringField;
    QConsCliBAIRES_CLI: TStringField;
    QConsCliCOD_CON: TIntegerField;
    QConsCliTELRES_CLI: TStringField;
    QConsCliNOME_CON: TStringField;
    QConsCliCOD_CLI: TIntegerField;
    QConsCliOBS_VENDA: TStringField;
    QConsCliLIMITE_CLI: TBCDField;
    QConsCliTIPO_CREDITO_CLI: TStringField;
    QConsCliDOC_CLI: TStringField;
    QConsCliBLOQUEADO_CLI: TStringField;
    QConsCliATIVO_CLI: TStringField;
    Panel3: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    Shape2: TShape;
    Label2: TLabel;
    Shape3: TShape;
    Label3: TLabel;
    QConsCliLIMITE_CHEQUE: TBCDField;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure EdtConsKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsCli: TFrmConsCli;

implementation
uses
  Udm, UDadosCliente, UConsCheque, ULancCheques, UPreVenda, UDavOrcamento, 
  UVendasPED, UDAVOrdemServico, UDadosADM, UMenuFiscal;
var  sSql : string;

{$R *.dfm}

procedure TFrmConsCli.FormShow(Sender: TObject);
begin
   sSql := QConsCli.SQL.Text;
   btnlocalizar.Enabled:= false;
   ComboCons.ItemIndex:= 1;
   edtcons.Clear;
   edtcons.SetFocus;
end;

procedure TFrmConsCli.BtnSairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmConsCli.BtnOkClick(Sender: TObject);
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QConsCli do
      begin
         close;
         sql.Clear;
         sql.Text:= sSql;
         case FrmConsCli.Tag of
           0: begin
                 if ComboCons.ItemIndex = 0 then
                    begin
                       if EdtCons.Text = '' then
                          sql.Add(' AND C.TIPO_CREDITO_CLI IN (' + #39 + 'PR' + #39 + ',' + #39 + 'PC' + #39 + ',' + #39 + 'DN' + #39 +') ORDER BY COD_CLI')
                       else
                          sql.Add(' AND C.COD_CLI = ' + edtcons.Text +
                                  ' AND C.TIPO_CREDITO_CLI IN (' + #39 + 'PR' + #39 + ',' + #39 + 'PC' + #39 + ',' + #39 + 'DN' + #39 +')');
                       Open;
                    end
                 else
                    if combocons.ItemIndex = 1 then
                       begin
                          sql.Add(' AND C.NOME_CLI LIKE ' + #39 + edtcons.Text + '%' + #39 +
                                  ' AND C.TIPO_CREDITO_CLI IN (' + #39 + 'PR' + #39 + ',' + #39 + 'PC' + #39 + ',' + #39 + 'DN' + #39 +') ' +
                                  ' ORDER BY C.NOME_CLI');
                          open;
                       end
                    else
                       if combocons.ItemIndex = 2 then
                          begin
                             if EdtCons.Text = '' then
                                begin
                                   showmessage('Digite o CNPJ/CPF');
                                   exit;
                                end
                             else
                                begin
                                   sql.Add(' AND C.CNPJ_CLI = ' + #39 + edtcons.Text + #39 +
                                           ' AND C.TIPO_CREDITO_CLI IN (' + #39 + 'PR' + #39 + ',' + #39 + 'PC' + #39 + ',' + #39 + 'DN' + #39 +')');
                                   open;
                                end;
                          end;
              end;
       1,6,8,9: begin
                 if ComboCons.ItemIndex = 0 then
                    begin
                       if EdtCons.Text = '' then
                          sql.Add(' ORDER BY COD_CLI')
                       else
                          sql.Add(' AND C.COD_CLI = ' + edtcons.Text);
                       Open;
                    end
                 else
                    if combocons.ItemIndex = 1 then
                       begin
                          sql.Add(' AND C.NOME_CLI LIKE ' + #39 + edtcons.Text + '%' + #39 +
                                  ' ORDER BY C.NOME_CLI');
                          open;
                       end
                    else
                       if combocons.ItemIndex = 2 then
                          begin
                             if EdtCons.Text = '' then
                                begin
                                   showmessage('Digite o CNPJ/CPF');
                                   exit;
                                end
                             else
                                begin
                                   sql.Add(' AND C.CNPJ_CLI = ' + #39 + edtcons.Text + #39);
                                   open;
                                end;
                          end;
              end;
           2: begin
                 if ComboCons.ItemIndex = 0 then
                    begin
                       if EdtCons.Text = '' then
                          sql.Add(' ORDER BY COD_CLI')
                       else
                          sql.Add(' AND C.COD_CLI = ' + edtcons.Text);
                       Open;
                    end
                 else
                    if combocons.ItemIndex = 1 then
                       begin
                          sql.Add(' AND C.NOME_CLI LIKE ' + #39 + edtcons.Text + '%' + #39 +
                                  ' ORDER BY C.NOME_CLI');
                          open;
                       end
                    else
                       if combocons.ItemIndex = 2 then
                          begin
                             if EdtCons.Text = '' then
                                begin
                                   showmessage('Digite o CNPJ/CPF');
                                   exit;
                                end
                             else
                                begin
                                   sql.Add(' AND C.CNPJ_CLI = ' + #39 + edtcons.Text + #39);
                                   open;
                                end;
                          end;
              end;
           3,4,5: begin
                 if ComboCons.ItemIndex = 0 then
                    begin
                       if EdtCons.Text = '' then
                          sql.Add(' AND C.TIPO_CREDITO_CLI IN (' + #39 + 'CH' + #39 + ',' + #39 + 'PC' + #39 + ') ORDER BY COD_CLI')
                       else
                          sql.Add(' AND C.COD_CLI = ' + edtcons.Text +
                                  ' AND C.TIPO_CREDITO_CLI IN (' + #39 + 'CH' + #39 + ',' + #39 + 'PC' + #39 + ')');
                       Open;
                    end
                 else
                    if combocons.ItemIndex = 1 then
                       begin
                          sql.Add(' AND C.NOME_CLI LIKE ' + #39 + edtcons.Text + '%' + #39 +
                                  ' AND C.TIPO_CREDITO_CLI IN (' + #39 + 'CH' + #39 + ',' + #39 + 'PC' + #39 + ') ' +
                                  ' ORDER BY C.NOME_CLI');
                          open;
                       end
                    else
                       if combocons.ItemIndex = 2 then
                          begin
                             if EdtCons.Text = '' then
                                begin
                                   showmessage('Digite o CNPJ/CPF');
                                   exit;
                                end
                             else
                                begin
                                   sql.Add(' AND C.CNPJ_CLI = ' + #39 + edtcons.Text + #39 +
                                           ' AND C.TIPO_CREDITO_CLI IN (' + #39 + 'CH' + #39 + ',' + #39 + 'PC' + #39 + ')');
                                   open;
                                end;
                          end;
              end;
         end;
         
         if not fieldbyname('cod_cli').IsNull then
            begin
               btnlocalizar.Enabled:= true;
               dbgrid.setfocus;
            end
         else
            begin
               btnlocalizar.Enabled:= false;
            end;
      end;
   dm.IBTransaction.CommitRetaining;
end;

procedure TFrmConsCli.BtnLocalizarClick(Sender: TObject);
begin
   if trim(QConsCliBLOQUEADO_CLI.AsString) = 'S' then
      begin
         showmessage('Cliente Bloqueado ' + #13 +
                     'Verifique com a Gerência');
         DBGrid.SetFocus;
         exit;
      end;

   case FrmConsCli.tag of
    0: begin
          with FrmDadosCliente do
             begin
                EdtCodCli.Text    := QConsCliCOD_CLI.AsString;
                EdtNomeCli.Text   := QConsCliNOME_CLI.AsString;
                LConvenio.Caption := QConsCliNOME_CON.AsString;
                EdtLimite.Text    := QConsCliLIMITE_CLI.AsString;
                MemoObs.Text      := QConsCliOBS_VENDA.AsString;
                if trim(QConsCliTIPO_CREDITO_CLI.AsString) = 'PR' then
                   LCredito.Caption:= 'PROMISSORIA'
                else
                   if trim(QConsCliTIPO_CREDITO_CLI.AsString) = 'CH' then
                      LCredito.Caption:= 'CHEQUE'
                   else
                      if trim(QConsCliTIPO_CREDITO_CLI.AsString) = 'CC' then
                         LCredito.Caption:= 'CONTAS CORRENTE'
                      else
                         LCredito.Caption:= 'PROMISSÓRIA/CHEQUE';
             end;
       end;
    1: begin
          with FrmPreVenda do
             begin
                EdtCodcli.text  := QConsCliCOD_CLI.AsString;
                EdtNomecli.Text := QConsCliNOME_CLI.AsString;
                EdtCodcli.SetFocus;
             end;
          close;
       end;
    3: begin
          with FrmConsCheque do
             begin
                edtcodcli.text      := QConsCliCOD_CLI.AsString;
                EdtNomeCli.Text     := QConsCliNOME_CLI.AsString;
                LTipoCredito.Caption:= QConsCliTIPO_CREDITO_CLI.AsString;
                EdtLimite.Text      := QConsCliLIMITE_CHEQUE.AsString;
                MemoObs.Text        := QConsCliOBS_VENDA.AsString;
             end;
          close;
       end;
    4: begin
          with FrmLancCheques do
             begin
                EdtCodCliente.text  := QConsCliCOD_CLI.AsString;
                EdtNomeCliente.Text := QConsCliNOME_CLI.AsString;
                EdtCodEmitente.SetFocus;
             end;
          close;
       end;
    5: begin
          with FrmLancCheques do
             begin
                EdtCodEmitente.text  := QConsCliCOD_CLI.AsString;
                EdtNomeEmitente.Text := QConsCliNOME_CLI.AsString;
                EdtCodBanco.SetFocus;
             end;
          close;
       end;
    6: begin
          with FrmDavOrcamento do
             begin
                EdtCodcli.text  := QConsCliCOD_CLI.AsString;
                EdtNomecli.Text := QConsCliNOME_CLI.AsString;
                EdtCodVend.SetFocus;
             end;
          close;
       end;
    7: begin
          with FrmVendasPED do
             begin
                EdtCodcli.text  := QConsCliCOD_CLI.AsString;
                EdtNomecli.Text := QConsCliNOME_CLI.AsString;
                EdtCodcli.SetFocus;
             end;
          close;
       end;
    8: begin
          with FrmDAVOrdemServico do
             begin
                EdtCodcli.text  := QConsCliCOD_CLI.AsString;
                EdtNomecli.Text := QConsCliNOME_CLI.AsString;
                EdtCodcli.SetFocus;
             end;
          close;
       end;
    9: begin
          with FrmDadosAdm do
             begin
                EdtCodcli.text  := QConsCliCOD_CLI.AsString;
                EdtNomecli.Text := QConsCliNOME_CLI.AsString;
                EdtValor.SetFocus;
             end;
          close;
       end;
   end;
   close;
end;

procedure TFrmConsCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QConsCli.SQL.Clear;
   QConsCli.SQL.Text:= sSql;
   QConsCli.Close;
   Action:= cafree;
   Self := nil;
end;

procedure TFrmConsCli.FormCreate(Sender: TObject);
begin
   dm.ScaleForm( Self, False );
end;

procedure TFrmConsCli.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close;
   if (ssAlt in Shift) and (chr(Key) in ['M', 'm']) then
      begin
         if (iCodPreVenda = 0) and (iCodOrcamento = 0) and (iCodOrdemServico = 0) and (iCodigoVenda = 0) and (iCodContaCliente = 0) then
            begin
               Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
               FrmMenuFiscal.showmodal;
            end;
      end;
end;

procedure TFrmConsCli.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f2 then
      EdtCons.SetFocus;
end;

procedure TFrmConsCli.DBGridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     begin
        BtnLocalizar.SetFocus;
     end;
end;

procedure TFrmConsCli.EdtConsKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
          Key := #0;
          BtnOk.Click;
      end;
end;

procedure TFrmConsCli.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if trim(QConsCliBLOQUEADO_CLI.AsString) = 'S' then
      begin
         DBGrid.Canvas.Font.Color:= clRed;
         Dbgrid.DefaultDrawDataCell(Rect, dbgrid.columns[datacol].field, State);
      end
   else
      if trim(QConsCliATIVO_CLI.AsString) = 'N' then
         begin
            DBGrid.Canvas.Font.Color:= clGreen;
            Dbgrid.DefaultDrawDataCell(Rect, dbgrid.columns[datacol].field, State);
         end
      else
         if trim(QConsCliTIPO_CREDITO_CLI.AsString) = 'CH' then
            begin
               DBGrid.Canvas.Font.Color:= clBackground;
               Dbgrid.DefaultDrawDataCell(Rect, dbgrid.columns[datacol].field, State);
            end;
end;

end.
