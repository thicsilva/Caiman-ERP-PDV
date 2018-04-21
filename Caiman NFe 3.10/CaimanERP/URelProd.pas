unit URelProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmRelProd = class(UNovoFormulario.TForm)
    Panel2: TPanel;
    RdgOrdem: TRadioGroup;
    GB: TGroupBox;
    BtnConsIni: TsSpeedButton;
    BtnConsFin: TsSpeedButton;
    EdtCodIni: UNovosComponentes.TEdit;
    EdtNomeIni: TEdit;
    EdtCodFin: UNovosComponentes.TEdit;
    EdtNomeFin: TEdit;
    Panel1: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    StatusBar1: TStatusBar;
    QRelProd: TFDQuery;
    QRelProdCOD_PRO: TIntegerField;
    QRelProdNOME_PRO: TStringField;
    QRelProdVALOR_PRO: TBCDField;
    QRelProdPROMOCAO_PRO: TBCDField;
    QRelProdREFERENCIA_PRO: TStringField;
    RdgTipo: TRadioGroup;
    RdgEstoque: TRadioGroup;
    QRelProdDESCRICAO: TStringField;
    GBGrupo: TGroupBox;
    Sec: TComboBox;
    Grupo: TComboBox;
    Subgrupo: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    QSecao: TFDQuery;
    QSecaoCOD_SEC: TIntegerField;
    QSecaoNOME_SEC: TStringField;
    QSecaoCAMINHO_FOTO_SEC: TStringField;
    QSecaoBEBIDAS_FUMO_SEC: TStringField;
    QGrupo: TFDQuery;
    QSubgrupo: TFDQuery;
    QGrupoCOD_SEC: TIntegerField;
    QGrupoCOD_GRUPO: TIntegerField;
    QGrupoDESCRICAO: TStringField;
    QSubgrupoCOD_SEC: TIntegerField;
    QSubgrupoCOD_GRUPO: TIntegerField;
    QSubgrupoCOD_SUBGRUPO: TIntegerField;
    QSubgrupoDESCRICAO: TStringField;
    gbTipo: TGroupBox;
    Label4: TLabel;
    TipoProduto: TComboBox;
    procedure BtnConsIniClick(Sender: TObject);
    procedure BtnConsFinClick(Sender: TObject);
    procedure EdtCodIniEnter(Sender: TObject);
    procedure EdtCodFinEnter(Sender: TObject);
    procedure EdtCodIniExit(Sender: TObject);
    procedure EdtCodFinExit(Sender: TObject);
    procedure EdtCodIniKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodIniKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodFinKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LimpaGB;
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVisClick(Sender: TObject);
    procedure RdgTipoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SecChange(Sender: TObject);
    procedure GrupoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelProd: TFrmRelProd;

implementation

uses
  UConsProd, Udm, Ubibli1, UQRelProd, UNovoPrincipal;

{$R *.dfm}

procedure TFrmRelProd.LimpaGB;
begin 
   edtcodini.Clear;
   edtcodfin.Clear;
   edtnomeini.Clear;
   edtnomefin.Clear;
end;

procedure TFrmRelProd.BtnConsIniClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsProd, FrmConsProd);
   frmConsProd.Tag:= 20;
   FrmConsProd.ShowModal;
end;

procedure TFrmRelProd.BtnConsFinClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsProd, FrmConsProd);
   frmConsProd.Tag:= 21;
   FrmConsProd.ShowModal;
end;

procedure TFrmRelProd.EdtCodIniEnter(Sender: TObject);
begin 
   edtcodini.SelectAll;
end;

procedure TFrmRelProd.EdtCodFinEnter(Sender: TObject);
begin 
   edtcodfin.SelectAll;
end;

procedure TFrmRelProd.EdtCodIniExit(Sender: TObject);
begin 
   if EdtCodIni.Text = '' then
      exit;
   EdtNomeIni.Text:= consulta('produto', EdtCodIni, 'cod_pro', 'nome_pro', dm.IBTransaction, dm.qConsulta);
   if EdtNomeIni.Text = '' then
      begin 
         AlertaCad('Produto não Cadastrado');
//         EdtCodIni.SetFocus;
      end;
end;

procedure TFrmRelProd.EdtCodFinExit(Sender: TObject);
begin 
   if EdtCodFin.Text = '' then
      exit;
   EdtNomeFin.Text:= consulta('produto', EdtCodFin, 'cod_pro', 'nome_pro', dm.IBTransaction, dm.qConsulta);
   if EdtNomeFin.Text = '' then
      begin 
         AlertaCad('Produto não Cadastrado');
//         EdtCodFin.SetFocus;
      end;
end;

procedure TFrmRelProd.EdtCodIniKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmRelProd.EdtCodIniKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsIni.Click;
end;

procedure TFrmRelProd.EdtCodFinKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsFin.Click;
end;

procedure TFrmRelProd.FormShow(Sender: TObject);
begin 
   RdgEstoque.ItemIndex:= 2;
   RdgOrdem.ItemIndex  := 0;
   RdgTipo.ItemIndex   := 2;
   RdgTipoClick(RdgTipo);
end;

procedure TFrmRelProd.GrupoChange(Sender: TObject);
var
   sAux: String;
   iAux: Integer;
begin 
        sAux := trim( Copy( Grupo.Text, 1, pos( '-', Grupo.Text ) -1 ));
        try
           iAux := StrToInt( sAux );
        except
           exit;
        end;
        if dm.IBTransaction.Active then
           dm.IBTransaction.Commit;
        dm.IBTransaction.StartTransaction;
        qsubgrupo.ParamByName( 'COD_GRUPO' ).AsInteger := iAux;
        qsubgrupo.Open;
        Subgrupo.Clear;
        SubGrupo.Items.Add( '0 - TODOS' );
        qsubgrupo.First;
        while not qsubgrupo.Eof do
           begin 
              subGrupo.Items.Add( qsubgrupocod_subgrupo.AsString + ' - ' + qsubgrupoDESCRICAO.AsString );
              qsubgrupo.Next;
           end;
        qsubgrupo.Close;
        SubGrupo.ItemIndex := 0;
        dm.IBTransaction.Commit;end;

procedure TFrmRelProd.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelProd.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelProd.BtnVisClick(Sender: TObject);
var sLiga : string;
   CodSecao: Integer;
   CodGrupo: Integer;
   CodSubgrupo : Integer;
   sAux : String;
begin 
   if RdgTipo.ItemIndex = 4 then
      begin 
         sAux := trim( Copy( Sec.Text, 1, pos( '-', Sec.Text ) -1 ));
         CodSecao := StrToInt( sAux );
         sAux := trim( Copy( Grupo.Text, 1, pos( '-', Grupo.Text ) -1 ));
         CodGrupo := StrToInt( sAux );
         sAux := trim( Copy( SubGrupo.Text, 1, pos( '-', SubGrupo.Text ) -1 ));
         CodSubgrupo := StrToInt( sAux );
      end;

   sLiga:= ' WHERE ';
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRelProd do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT COD_PRO, NOME_PRO, VALOR_PRO, PROMOCAO_PRO, REFERENCIA_PRO, U.DESCRICAO ' +
                 'FROM PRODUTO P ' +
                 'INNER JOIN UNIDADE_MEDIDA U ' +
                 'ON (P.CODIGO_UNIDADE_SAIDA = U.CODIGO)');
         case rdgtipo.ItemIndex of
           0: begin 
                 sql.add(' WHERE PRODUTO_PESADO_PRO = ' + #39 + 'P' + #39 +
                         ' OR PRODUTO_PESADO_PRO = ' + #39 + 'U' + #39);
                 sLiga:= ' AND ';
              end;
           1: begin 
                 sql.add(' WHERE PRODUTO_PESADO_PRO = ' + #39 + 'N' + #39);
                 sLiga:= ' AND ';
              end;
           3: begin 
                 sql.add(' WHERE COD_PRO BETWEEN :CODINI AND :CODFIN');
                 sLiga:= ' AND ';
                 Parambyname('codini').AsInteger := strtoint(edtcodini.Text);
                 Parambyname('codfin').AsInteger := strtoint(edtcodfin.Text);
              end;
           4: begin 
                 if CodSecao > 0 then
                    begin 
                      sql.Add(' WHERE COD_SEC = :COD_SEC');
                       Parambyname('COD_SEC').AsInteger := CodSecao;
                       if CodGrupo > 0 then
                          begin 
                             sql.Add(' AND COD_GRUPO = :COD_GRUPO');
                             Parambyname('COD_GRUPO').AsInteger := CodGrupo;
                             if CodSubGrupo > 0 then
                                begin 
                                   sql.Add(' AND SUB_GRUPO = :SUB_GRUPO');
                                   Parambyname('SUB_GRUPO').AsInteger := CodsubGrupo;
                                end;
                          end;
                      sLiga:= ' AND ';

                    end;
              end;
           5: begin 

                sql.Add(' WHERE CODIGO_TIPO = :CODIGO_TIPO');
                Parambyname('CODIGO_TIPO').AsInteger := StrToInt( Copy( TipoProduto.Text, 1, 4 ) );
                sLiga:= ' AND ';
              end;

         end;
         case RdgEstoque.ItemIndex of
           0:sql.add(sLiga + ' CONTROLA_ESTOQUE_PRO = ' + #39 + 'S' + #39);
           1:sql.Add(sLiga + ' CONTROLA_ESTOQUE_PRO = ' + #39 + 'N' + #39);
         end;

         if RdgOrdem.ItemIndex = 0 then
            sql.add(' ORDER BY COD_PRO')
         else
            sql.add(' ORDER BY NOME_PRO');
         open;
      end;
   Application.CreateForm(TFrmQRelProd, FrmQRelProd);
   FrmQRelProd.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
   case RdgTipo.ItemIndex of
     0: FrmQRelProd.QRLTipo.Caption:= 'Tipo: Pesados';
     1: FrmQRelProd.QRLTipo.Caption:= 'Tipo: Não Pesados';
     2: FrmQRelProd.QRLTipo.Caption:= 'Tipo: Todos';
     3: FrmQRelProd.QRLTipo.Caption:= 'Tipo: Intervalo';
     4: begin 
         FrmQRelProd.QRLTipo.Caption:= 'Secao/G/S: ' +
         Sec.Text + '/' + grupo.Text + '/' + subgrupo.Text;
        end;
     5: begin 
         FrmQRelProd.QRLTipo.Caption:= 'Tipo : ' + TipoProduto.Text;
        end;

   end;



   case RdgEstoque.ItemIndex of
     0: FrmQRelProd.QRLEstoque.Caption:= 'Produtos que controlam estoque';
     1: FrmQRelProd.QRLEstoque.Caption:= 'Produtos que não controlam estoque';
     2: FrmQRelProd.QRLEstoque.Caption:= '';
   end;

   if sender = btnvis then
      begin 
         FrmQRelProd.QRProd.PreviewInitialState:= wsMaximized;
         FrmQRelProd.QRProd.Preview;
      end
   else
      begin 
         FrmQRelProd.QRProd.PrinterSetup;
         FrmQRelProd.QRProd.Print;
      end;
   FrmQRelProd.QRProd.QRPrinter:= nil;
   dm.IBTransaction.Commit;
   QRelProd.Close;
end;

procedure TFrmRelProd.RdgTipoClick(Sender: TObject);
begin 
   LimpaGB;
   Sec.Clear;
   Grupo.Clear;
   SubGrupo.Clear;
   if RdgTipo.ItemIndex = 3 then
      begin 
         gb.Enabled:= true;
         edtcodini.SetFocus;
      end
   else
      gb.Enabled:= false;

  case RdgTipo.ItemIndex of

  4:
     begin 
        gbTipo.Enabled := False;
        gbGrupo.Enabled := true;
        if dm.IBTransaction.Active then
           dm.IBTransaction.Commit;
        dm.IBTransaction.StartTransaction;
        QSecao.Open;
        Qsecao.First;
        Sec.Items.Add( '0 - TODOS' );
        while not qsecao.Eof do
           begin 
              Sec.Items.Add( qsecaocod_sec.AsString + ' - ' + qsecaoNOME_SEC.AsString );
              qsecao.Next;
           end;
        qsecao.Close;
        Grupo.Items.Add( '0 - TODOS' );
        SubGrupo.Items.Add( '0 - TODOS' );
        SEC.ItemIndex := 0;
        SubGrupo.ItemIndex :=0;
        Grupo.ItemIndex :=0;
        dm.IBTransaction.Commit;
     end;
     5:
     begin 
                gbTipo.Enabled := true;
        gbGrupo.Enabled := False;
        if dm.IBTransaction.Active then
           dm.IBTransaction.Commit;
        dm.IBTransaction.StartTransaction;
           dm.QConsulta.SQL.Text := 'select * from TIPO_PRODUTO';
           dm.QConsulta.Open;
           dm.QConsulta.First;
           TipoProduto.Items.Clear;
           while not dm.QConsulta.Eof do
               begin 
                  TipoProduto.Items.Add( FormataStringD( dm.QConsulta.FieldByName( 'CODIGO' ).AsString, '4', '0' ) + ' - ' +
                  dm.QConsulta.FieldByName( 'DESCRICAO' ).AsString );
                  dm.QConsulta.Next;
               end;
           TipoProduto.ItemIndex := 0;
        dm.IBTransaction.Commit;
     end;
  else
     begin 
        gbGrupo.Enabled := false;
        gbTipo.Enabled := False;
     end;
  end;
end;

procedure TFrmRelProd.SecChange(Sender: TObject);
var
   sAux: String;
   iAux: Integer;
begin 
        Grupo.Clear;
        sAux := trim( Copy( Sec.Text, 1, pos( '-', Sec.Text ) -1 ));
        try
           iAux := StrToInt( sAux );
        except
           exit;
        end;
        if dm.IBTransaction.Active then
           dm.IBTransaction.Commit;
        dm.IBTransaction.StartTransaction;
        qgrupo.ParamByName( 'COD_SEC' ).AsInteger := iAux;
        qgrupo.Open;
        Grupo.Clear;
        Subgrupo.Clear;
        Grupo.Items.Add( '0 - TODOS' );
        SubGrupo.Items.Add( '0 - TODOS' );
        qgrupo.First;
        while not qgrupo.Eof do
           begin 
              Grupo.Items.Add( qgrupocod_grupo.AsString + ' - ' + qgrupoDESCRICAO.AsString );
              qgrupo.Next;
           end;
        qgrupo.Close;
        Grupo.ItemIndex := 0;
        SubGrupo.ItemIndex := 0;
        dm.IBTransaction.Commit;
end;

procedure TFrmRelProd.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.
