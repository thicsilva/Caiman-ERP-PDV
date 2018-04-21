unit URelEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmRelEstoque = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Rdg: TRadioGroup;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    QRelEstoque: TFDQuery;
    Rdg1: TRadioGroup;
    GBSecaoSetor: TGroupBox;
    CheckPrecoVenda: TCheckBox;
    CheckCustoVenda: TCheckBox;
    GBLocal: TGroupBox;
    BtnConsLocal: TsSpeedButton;
    EdtCodLocal: UNovosComponentes.TEdit;
    EdtNomeLocal: TEdit;
    CheckLocal: TCheckBox;
    QRelEstoqueCOD_PRO: TIntegerField;
    QRelEstoqueNOME_PRO: TStringField;
    QRelEstoquePRECO_CUSTO: TBCDField;
    QRelEstoqueVALOR_PRO: TBCDField;
    QRelEstoqueDESCRICAO: TStringField;
    QRelEstoqueESTOQUE: TBCDField;
    RDGSecaoSetorFab: TRadioGroup;
    PanelSecao: TPanel;
    EdtCodSec: UNovosComponentes.TEdit;
    EdtCodGrupo: UNovosComponentes.TEdit;
    EdtCodSub: UNovosComponentes.TEdit;
    CheckSecao: TCheckBox;
    BtnConsSub: TsSpeedButton;
    BtnConsGrupo: TsSpeedButton;
    BtnConsSec: TsSpeedButton;
    EdtNomeSec: TEdit;
    EdtNomeGrupo: TEdit;
    EdtNomeSub: TEdit;
    Label30: TLabel;
    PanelSetor: TPanel;
    BtnCons: TsSpeedButton;
    LabelTitulo: TLabel;
    EdtCod: UNovosComponentes.TEdit;
    Check: TCheckBox;
    EdtNome: TEdit;
    CheckValidade: TCheckBox;
    QRelEstoqueDATA_VALIDADE: TDateField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure EdtCodSecEnter(Sender: TObject);
    procedure EdtCodSecExit(Sender: TObject);
    procedure EdtCodSecKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodSecKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsSecClick(Sender: TObject);
    procedure CheckSecaoClick(Sender: TObject);
    procedure LimpaGBSecao;
    procedure DesabilitaSecao(const bAux : boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckPrecoVendaClick(Sender: TObject);
    procedure CheckCustoVendaClick(Sender: TObject);
    procedure EdtCodGrupoEnter(Sender: TObject);
    procedure EdtCodGrupoExit(Sender: TObject);
    procedure EdtCodGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodSubEnter(Sender: TObject);
    procedure EdtCodSubExit(Sender: TObject);
    procedure BtnConsGrupoClick(Sender: TObject);
    procedure BtnConsSubClick(Sender: TObject);
    procedure EdtCodLocalEnter(Sender: TObject);
    procedure EdtCodLocalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckLocalClick(Sender: TObject);
    procedure EdtCodLocalExit(Sender: TObject);
    procedure BtnConsLocalClick(Sender: TObject);
    procedure BtnConsClick(Sender: TObject);
    procedure CheckClick(Sender: TObject);
    procedure RDGSecaoSetorFabClick(Sender: TObject);
    procedure EdtCodEnter(Sender: TObject);
    procedure EdtCodExit(Sender: TObject);
    procedure EdtCodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelEstoque: TFrmRelEstoque;

implementation

{$R *.dfm}
uses
  Udm, UBibli1, UQRelEstoque, UNovoPrincipal, UConsSecao, 
  UQRelEstoquePrecoVenda, UQRelEstoqueCustoVenda, UConsGrupo, UConsSubGrupo, 
  UConsLocaisEstoque, UConsSetorEstoque, UConsLab;

procedure TFrmRelEstoque.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelEstoque.LimpaGBSecao;
begin 
   EdtCodSec.Clear;
   EdtNomeSec.Clear;
   EdtCodGrupo.Clear;
   EdtNomeGrupo.Clear;
   EdtCodSub.Clear;
   edtnomesub.Clear;
end;

procedure TFrmRelEstoque.DesabilitaSecao(const bAux : boolean);
begin 
   EdtCodSec.Enabled    := bAux;
   EdtNomeSec.Enabled   := bAux;
   EdtCodGrupo.Enabled  := bAux;
   EdtNomeGrupo.Enabled := bAux;
   EdtCodSub.Enabled    := bAux;
   edtnomesub.Enabled   := bAux;
end;

procedure TFrmRelEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelEstoque.FormShow(Sender: TObject);
begin 
   rdg.ItemIndex := 0;
   rdg1.ItemIndex:= 0;
   RDGSecaoSetorFab.ItemIndex:= 0;
   CheckSecao.Checked:= true;
   CheckSecaoClick(self);
   CheckLocal.Checked:= true;
   CheckLocalClick(self);
   Check.Checked:= true;
   CheckClick(self);
   RDGSecaoSetorFabClick(self);
end;

procedure TFrmRelEstoque.BtnVisClick(Sender: TObject);
var sAuxSql : string;
    sAuxEstoque : string;
begin 
   sAuxSql:= ' WHERE ';

   if CheckLocal.Checked then
      sAuxEstoque:= '(SELECT SUM(E.ESTOQUE) FROM ESTOQUE E WHERE E.COD_PRO = P.COD_PRO) ESTOQUE '
   else
      sAuxEstoque:= '(SELECT SUM(E.ESTOQUE) FROM ESTOQUE E WHERE E.COD_PRO = P.COD_PRO AND E.CODIGO_LOCAL_ESTOQUE = ' + EdtCodLocal.Text + ') ESTOQUE ';

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRelEstoque do
      begin 
         close;
         sql.clear;
         sql.Add('SELECT P.COD_PRO, P.NOME_PRO, P.PRECO_CUSTO, P.VALOR_PRO, P.DATA_VALIDADE, U.DESCRICAO, ' +
                 sAuxEstoque +
                 ' FROM PRODUTO P  ' +
                 'INNER JOIN UNIDADE_MEDIDA U  ' +
                 'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)');

         case RDGSecaoSetorFab.ItemIndex of
          0:begin 
               if not CheckSecao.Checked then
                  begin 
                     if trim(EdtCodSec.Text) <> '' then
                        begin 
                           sql.Add(sAuxSql +  ' P.COD_SEC = :CODSEC');
                           parambyname('codsec').AsInteger:= strtoint(EdtCodSec.Text);
                           sAuxSql:= ' AND ';
                        end;

                     if trim(EdtCodGrupo.Text) <> '' then
                        begin 
                           sql.Add(sAuxSql + ' P.COD_GRUPO = :CODGRP');
                           parambyname('codgrp').AsInteger:= strtoint(EdtCodGrupo.Text);
                           sAuxSql:= ' AND ';
                        end;

                     if trim(EdtCodSub.Text) <> '' then
                        begin 
                           sql.Add(sAuxSql + ' P.SUB_GRUPO = :CODSUB');
                           parambyname('codsub').AsInteger:= strtoint(EdtCodSub.Text);
                           sAuxSql:= ' AND ';
                        end;
                  end;
            end;
          1:begin 
               if not Check.Checked then
                  begin 
                     if trim(EdtCod.Text) <> '' then
                        begin 
                           sql.Add(sAuxSql +  ' P.CODIGO_SETOR_ESTOQUE = :CODSET');
                           parambyname('codset').AsInteger:= strtoint(EdtCod.Text);
                           sAuxSql:= ' AND ';
                        end;
                  end;
            end;
          2:begin 
               if not Check.Checked then
                  begin 
                     if trim(EdtCod.Text) <> '' then
                        begin 
                           sql.Add(sAuxSql +  ' P.COD_LAB = :CODLAB');
                           parambyname('codlab').AsInteger:= strtoint(EdtCod.Text);
                           sAuxSql:= ' AND ';
                        end;
                  end;
            end;
         end;

         if CheckLocal.Checked then
            begin 
               case Rdg1.ItemIndex of
                 1: sql.add(sAuxSql + ' ((SELECT SUM(E.ESTOQUE) FROM ESTOQUE E WHERE E.COD_PRO = P.COD_PRO) = 0 OR (SELECT SUM(E.ESTOQUE) FROM ESTOQUE E WHERE E.COD_PRO = P.COD_PRO) IS NULL)');
                 2: sql.add(sAuxSql + '  (SELECT SUM(E.ESTOQUE) FROM ESTOQUE E WHERE E.COD_PRO = P.COD_PRO) < 0');
                 3: sql.add(sAuxSql + '  (SELECT SUM(E.ESTOQUE) FROM ESTOQUE E WHERE E.COD_PRO = P.COD_PRO) > 0');
               end;
            end
         else
            begin 
               case Rdg1.ItemIndex of
                 1: sql.add(sAuxSql + ' ((SELECT SUM(E.ESTOQUE) FROM ESTOQUE E WHERE E.COD_PRO = P.COD_PRO AND E.CODIGO_LOCAL_ESTOQUE = ' + EdtCodLocal.Text + ') = 0 OR (SELECT SUM(E.ESTOQUE) FROM ESTOQUE E WHERE E.COD_PRO = P.COD_PRO) IS NULL)');
                 2: sql.add(sAuxSql + '  (SELECT SUM(E.ESTOQUE) FROM ESTOQUE E WHERE E.COD_PRO = P.COD_PRO AND E.CODIGO_LOCAL_ESTOQUE = ' + EdtCodLocal.Text + ') < 0');
                 3: sql.add(sAuxSql + '  (SELECT SUM(E.ESTOQUE) FROM ESTOQUE E WHERE E.COD_PRO = P.COD_PRO AND E.CODIGO_LOCAL_ESTOQUE = ' + EdtCodLocal.Text + ') > 0');
               end;
            end;

         if rdg.ItemIndex = 0 then
            sql.Add(' ORDER BY P.COD_PRO')
         else
            sql.Add(' ORDER BY P.NOME_PRO');
         open;

         if CheckPrecoVenda.Checked then
            begin 
               Application.CreateForm(TFrmQRelEstoquePrecoVenda, FrmQRelEstoquePrecoVenda);
               FrmQRelEstoquePrecoVenda.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;

               if CheckLocal.Checked then
                     FrmQRelEstoquePrecoVenda.QRLLocalEstoque.Caption:= 'Local de Estoque: Todos'
                  else
                     FrmQRelEstoquePrecoVenda.QRLLocalEstoque.Caption:= 'Local de Estoque: ' + trim(EdtNomeLocal.Text);

                  case RDGSecaoSetorFab.ItemIndex of
                    0:begin 
                         if trim(EdtCodSec.Text) <> '' then
                            FrmQRelEstoquePrecoVenda.QRLTitulo.Caption:= 'Seção: ' + Trim(EdtNomeSec.Text)
                         else
                            FrmQRelEstoquePrecoVenda.QRLTitulo.Caption:= 'Seção: Todas';

                         if trim(EdtCodGrupo.Text) <> '' then
                            FrmQRelEstoquePrecoVenda.QRLTitulo.Caption:= FrmQRelEstoquePrecoVenda.QRLTitulo.Caption + ' / ' + Trim(EdtNomeGrupo.Text);

                         if trim(EdtCodSub.Text) <> '' then
                            FrmQRelEstoquePrecoVenda.QRLTitulo.Caption:= FrmQRelEstoquePrecoVenda.QRLTitulo.Caption + ' / ' + Trim(EdtNomeSub.Text);
                      end;
                    1:begin 
                         if trim(EdtCod.Text) <> '' then
                            FrmQRelEstoquePrecoVenda.QRLTitulo.Caption:= 'Setor de Estoque: ' + Trim(EdtNome.Text)
                         else
                            FrmQRelEstoquePrecoVenda.QRLTitulo.Caption:= 'Setor de Estoque: Todos';
                      end;
                    2:begin 
                         if trim(EdtCod.Text) <> '' then
                            FrmQRelEstoquePrecoVenda.QRLTitulo.Caption:= 'Fabricante: ' + Trim(EdtNome.Text)
                         else
                            FrmQRelEstoquePrecoVenda.QRLTitulo.Caption:= 'Fabricante: Todos';
                      end;
                  end;

               if sender = btnvis then
                  begin 
                     FrmQRelEstoquePrecoVenda.QREstoque.PreviewInitialState:= wsMaximized;
                     FrmQRelEstoquePrecoVenda.QREstoque.Preview;
                  end
               else
                  begin 
                     FrmQRelEstoquePrecoVenda.QREstoque.PrinterSetup;
                     FrmQRelEstoquePrecoVenda.QREstoque.Print;
                  end;
               FrmQRelEstoquePrecoVenda.QREstoque.QRPrinter:= nil;
            end
         else
            if CheckCustoVenda.Checked then
               begin 
                  Application.CreateForm(TFrmQRelEstoqueCustoVenda, FrmQRelEstoqueCustoVenda);
                  FrmQRelEstoqueCustoVenda.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;

                  case RDGSecaoSetorFab.ItemIndex of
                    0:begin 
                         if trim(EdtCodSec.Text) <> '' then
                            FrmQRelEstoqueCustoVenda.QRLTitulo.Caption:= 'Seção: ' + Trim(EdtNomeSec.Text)
                         else
                            FrmQRelEstoqueCustoVenda.QRLTitulo.Caption:= 'Seção: Todas';

                         if trim(EdtCodGrupo.Text) <> '' then
                            FrmQRelEstoqueCustoVenda.QRLTitulo.Caption:= FrmQRelEstoqueCustoVenda.QRLTitulo.Caption + ' / ' + Trim(EdtNomeGrupo.Text);

                         if trim(EdtCodSub.Text) <> '' then
                            FrmQRelEstoqueCustoVenda.QRLTitulo.Caption:= FrmQRelEstoqueCustoVenda.QRLTitulo.Caption + ' / ' + Trim(EdtNomeSub.Text);
                      end;
                    1:begin 
                        if trim(EdtCod.Text) <> '' then
                           FrmQRelEstoqueCustoVenda.QRLTitulo.Caption:= 'Setor de Estoque: ' + Trim(EdtNome.Text)
                        else
                           FrmQRelEstoqueCustoVenda.QRLTitulo.Caption:= 'Setor de Estoque: Todos';
                      end;
                    2:begin 
                        if trim(EdtCod.Text) <> '' then
                           FrmQRelEstoqueCustoVenda.QRLTitulo.Caption:= 'Fabricante: ' + Trim(EdtNome.Text)
                        else
                           FrmQRelEstoqueCustoVenda.QRLTitulo.Caption:= 'Fabricante: Todos';
                      end;
                  end;

                  if sender = btnvis then
                     begin 
                        FrmQRelEstoqueCustoVenda.QREstoque.PreviewInitialState:= wsMaximized;
                        FrmQRelEstoqueCustoVenda.QREstoque.Preview;
                     end
                  else
                     begin 
                        FrmQRelEstoqueCustoVenda.QREstoque.PrinterSetup;
                        FrmQRelEstoqueCustoVenda.QREstoque.Print;
                     end;
                  FrmQRelEstoqueCustoVenda.QREstoque.QRPrinter:= nil;
               end
            else
               begin 
                  Application.CreateForm(TFrmQRelEstoque, FrmQRelEstoque);
                  FrmQRelEstoque.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;

                  if CheckLocal.Checked then
                     FrmQRelEstoque.QRLLocalEstoque.Caption:= 'Local de Estoque: Todos'
                  else
                     FrmQRelEstoque.QRLLocalEstoque.Caption:= 'Local de Estoque: ' + trim(EdtNomeLocal.Text);

                  case RDGSecaoSetorFab.ItemIndex of
                   0:begin 
                        if trim(EdtCodSec.Text) <> '' then
                           FrmQRelEstoque.QRLTitulo.Caption:= 'Seção: ' + Trim(EdtNomeSec.Text)
                        else
                           FrmQRelEstoque.QRLTitulo.Caption:= 'Seção: Todas';

                        if trim(EdtCodGrupo.Text) <> '' then
                           FrmQRelEstoque.QRLTitulo.Caption:= FrmQRelEstoque.QRLTitulo.Caption + ' / ' + Trim(EdtNomeGrupo.Text);

                        if trim(EdtCodSub.Text) <> '' then
                           FrmQRelEstoque.QRLTitulo.Caption:= FrmQRelEstoque.QRLTitulo.Caption + ' / ' + Trim(EdtNomeSub.Text);
                      end;
                   1:begin 
                        if trim(EdtCod.Text) <> '' then
                           FrmQRelEstoque.QRLTitulo.Caption:= 'Setor de Estoque: ' + Trim(EdtNome.Text)
                        else
                           FrmQRelEstoque.QRLTitulo.Caption:= 'Setor de Estoque: Todos';
                     end;
                   2:begin 
                        if trim(EdtCod.Text) <> '' then
                           FrmQRelEstoque.QRLTitulo.Caption:= 'Fabricante: ' + Trim(EdtNome.Text)
                        else
                           FrmQRelEstoque.QRLTitulo.Caption:= 'Fabricante: Todos';
                     end;
                  end;

                  if CheckValidade.Checked then
                     begin 
                        FrmQRelEstoque.QRLabel9.Enabled  := true;
                        FrmQRelEstoque.QRDBText4.Enabled := true;
                     end
                  else
                     begin 
                        FrmQRelEstoque.QRLabel9.Enabled  := false;
                        FrmQRelEstoque.QRDBText4.Enabled := false;
                     end;

                  if sender = btnvis then
                     begin 
                        FrmQRelEstoque.QREstoque.PreviewInitialState:= wsMaximized;
                        FrmQRelEstoque.QREstoque.Preview;
                     end
                  else
                     begin 
                        FrmQRelEstoque.QREstoque.PrinterSetup;
                        FrmQRelEstoque.QREstoque.Print;
                     end;
                  FrmQRelEstoque.QREstoque.QRPrinter:= nil;
               end;
      end;
   dm.IBTransaction.Commit;
   QRelEstoque.Close;
end;

procedure TFrmRelEstoque.EdtCodSecEnter(Sender: TObject);
begin 
   EdtCodSec.SelectAll;
end;

procedure TFrmRelEstoque.EdtCodSecExit(Sender: TObject);
begin 
   if EdtCodSec.Text = '' then
      exit;
   EdtNomeSec.Text:= consulta('secao', EdtCodSec, 'cod_sec', 'nome_sec', dm.IBTransaction, dm.qConsulta);
   if trim(EdtNomeSec.Text) = '' then
      begin 
         AlertaCad('Seção não Cadastrada');
//         EdtCodSec.SetFocus;
      end;
end;

procedure TFrmRelEstoque.EdtCodSecKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsSec.Click;
end;

procedure TFrmRelEstoque.EdtCodSecKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmRelEstoque.BtnConsSecClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsSecao, FrmConsSecao);
   FrmConsSecao.Tag:= 14;
   FrmConsSecao.ShowModal;
end;

procedure TFrmRelEstoque.CheckSecaoClick(Sender: TObject);
begin 
   CheckSecao.Focused;
   LimpaGBSecao;
   if CheckSecao.Checked then
      DesabilitaSecao(false)
   else
      begin 
         DesabilitaSecao(true);
         EdtCodSec.SetFocus;
      end;
end;

procedure TFrmRelEstoque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRelEstoque.CheckPrecoVendaClick(Sender: TObject);
begin 
   if CheckPrecoVenda.Checked then
      CheckCustoVenda.Checked  := false;
end;

procedure TFrmRelEstoque.CheckCustoVendaClick(Sender: TObject);
begin 
   if CheckCustoVenda.Checked then
      CheckPrecoVenda.Checked  := false;
end;

procedure TFrmRelEstoque.EdtCodGrupoEnter(Sender: TObject);
begin 
   EdtCodGrupo.SelectAll;
end;

procedure TFrmRelEstoque.EdtCodGrupoExit(Sender: TObject);
begin 
   if BtnSair.Focused then
      exit;
       
   if trim(EdtCodGrupo.Text) = '' then
     begin 
         EdtNomeGrupo.Clear;
         exit;
     end;

  if trim(EdtCodSec.Text) = '' then
     begin 
        EdtNomeGrupo.Clear;
        EdtCodGrupo.Clear;
        EdtCodSec.SetFocus;
        exit;
     end;

  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.QConsulta do
         begin 
            close;
            sql.Clear;
            sql.add('SELECT COD_GRUPO, DESCRICAO ' +
                    'FROM SECAO_GRUPO ' +
                    'WHERE COD_SEC = :CODSEC AND COD_GRUPO = :CODGRUPO');
            Parambyname('codsec').AsInteger   := strtoint(EdtCodSec.Text);
            Parambyname('codgrupo').AsInteger := strtoint(EdtCodGrupo.Text);
            Open;
            if not (fieldbyname('cod_grupo').IsNull) then
               edtNomeGrupo.Text:= fieldbyname('descricao').AsString
            else
               begin 
                  AlertaCad('Grupo não Cadastrado');
                  EdtNomeGrupo.Clear;
                  EdtCodGrupo.Clear;
//                  EdtCodGrupo.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('Erro o buscar o Grupo');
    end;
  finally
    dm.QConsulta.Close;
  end;
end;

procedure TFrmRelEstoque.EdtCodGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsGrupo.Click;
end;

procedure TFrmRelEstoque.EdtCodSubEnter(Sender: TObject);
begin 
   EdtCodSub.SelectAll;
end;

procedure TFrmRelEstoque.EdtCodSubExit(Sender: TObject);
begin 
   if BtnSair.Focused then
      exit;

   if EdtCodSub.Text = '' then
     begin 
        EdtNomeSub.Clear;
        exit;
     end;

  if trim(EdtCodSec.Text) = '' then
     begin 
        EdtCodSec.SetFocus;
        exit;
     end;

  if trim(EdtCodGrupo.Text) = '' then
     begin 
        EdtCodSub.Clear;
        EdtNomeSub.Clear;
        EdtCodGrupo.SetFocus;
        exit;
     end;

  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.QConsulta do
         begin 
            close;
            sql.Clear;
            sql.add('SELECT COD_SUBGRUPO, DESCRICAO ' +
                    'FROM SECAO_GRUPO_SUBGRUPO ' +
                    'WHERE COD_SEC = :CODSEC AND COD_GRUPO = :CODGRUPO AND COD_SUBGRUPO = :CODSUB');
            Parambyname('codsec').AsInteger   := strtoint(EdtCodSec.Text);
            Parambyname('codgrupo').AsInteger := strtoint(EdtCodGrupo.Text);
            Parambyname('codsub').AsInteger   := strtoint(EdtCodSub.Text);
            Open;
            if not (fieldbyname('cod_subgrupo').IsNull) then
               EdtNomeSub.Text:= fieldbyname('descricao').AsString
            else
               begin 
                  AlertaCad('Sub-Grupo não Cadastrado');
                  EdtNomeSub.Clear;
                  EdtCodSub.Clear;
//                  EdtCodSub.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('Erro o buscar o Sub-Grupo');
    end;
  finally
    dm.QConsulta.Close;
  end;
end;

procedure TFrmRelEstoque.BtnConsGrupoClick(Sender: TObject);
begin 
   if trim(EdtCodSec.Text) = '' then
      exit;
   Application.CreateForm(TFrmConsGrupo, FrmConsGrupo);
   FrmConsGrupo.tag:= 4;
   FrmConsGrupo.showmodal;
end;

procedure TFrmRelEstoque.BtnConsSubClick(Sender: TObject);
begin 
   if (trim(EdtCodSec.Text) = '') or (trim(EdtCodGrupo.Text) = '') then
      exit;
   Application.CreateForm(TFrmConsSubGrupo, FrmConsSubGrupo);
   FrmConsSubGrupo.tag:= 4;
   FrmConsSubGrupo.showmodal;
end;

procedure TFrmRelEstoque.EdtCodLocalEnter(Sender: TObject);
begin 
   EdtCodLocal.SelectAll;
end;

procedure TFrmRelEstoque.EdtCodLocalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsLocal.Click;
end;

procedure TFrmRelEstoque.CheckLocalClick(Sender: TObject);
begin 
   CheckLocal.Focused;
   EdtCodLocal.Clear;
   EdtNomeLocal.Clear;

   if CheckLocal.Checked then
      GBLocal.Enabled:= false
   else
      begin 
         GBLocal.Enabled:= true;
         EdtCodLocal.SetFocus;
      end;
end;

procedure TFrmRelEstoque.EdtCodLocalExit(Sender: TObject);
begin 
   if (BtnSair.Focused) or (EdtCodLocal.Text = '') then
     exit;

   EdtNomeLocal.Text:= consulta('locais_estoque', EdtCodLocal, 'codigo', 'descricao', dm.IBTransaction, dm.qConsulta);
   if trim(EdtNomeLocal.Text) = '' then
      begin 
         AlertaCad('Local de Estoque não Cadastrado');
//         EdtCodLocal.SetFocus;
      end;
end;

procedure TFrmRelEstoque.BtnConsLocalClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsLocaisEstoque, FrmConsLocaisEstoque);
   FrmConsLocaisEstoque.Tag:= 4;
   FrmConsLocaisEstoque.ShowModal;
end;

procedure TFrmRelEstoque.BtnConsClick(Sender: TObject);
begin 
   case RDGSecaoSetorFab.ItemIndex of
    1:begin 
         Application.CreateForm(TFrmConsSetorEstoque, FrmConsSetorEstoque);
         FrmConsSetorEstoque.Tag:= 2;
         FrmConsSetorEstoque.ShowModal;
      end;
    2:begin 
         Application.CreateForm(TFrmConsLab, FrmConsLab);
         FrmConsLab.Tag:= 11;
         FrmConsLab.ShowModal;
      end;
   end;
end;

procedure TFrmRelEstoque.CheckClick(Sender: TObject);
begin 
   Check.Focused;
   EdtCod.Clear;
   EdtNome.Clear;

   if Check.Checked then
      begin 
         EdtCod.Enabled  := false;
      end
   else
      begin 
         begin 
            EdtCod.Enabled  := true;
            EdtCod.SetFocus;
         end;
      end;
end;

procedure TFrmRelEstoque.RDGSecaoSetorFabClick(Sender: TObject);
begin 
   if RDGSecaoSetorFab.ItemIndex = 0 then
      begin 
         PanelSetor.SendToBack;
      end
   else
      begin 
         PanelSecao.SendToBack;
      end;
end;

procedure TFrmRelEstoque.EdtCodEnter(Sender: TObject);
begin 
   EdtCod.SelectAll;
end;

procedure TFrmRelEstoque.EdtCodExit(Sender: TObject);
begin 
   if (BtnSair.Focused) or (EdtCod.Text = '') then
     exit;

   case RDGSecaoSetorFab.ItemIndex of
     1: begin 
           EdtNome.Text:= consulta('setores_estoque', EdtCod, 'codigo', 'descricao', dm.IBTransaction, dm.qConsulta);
           if trim(EdtNome.Text) = '' then
              begin 
                 AlertaCad('Setor de Estoque não Cadastrado');
//                 EdtCod.SetFocus;
              end;
        end;
     2: begin 
           EdtNome.Text:= consulta('laboratorio', EdtCod, 'cod_lab', 'nome_lab', dm.IBTransaction, dm.qConsulta);
           if trim(EdtNome.Text) = '' then
              begin 
                 AlertaCad('Fabricante não Cadastrado');
//                 EdtCod.SetFocus;
              end;
        end;
   end;
end;

procedure TFrmRelEstoque.EdtCodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnCons.Click;
end;

end.


