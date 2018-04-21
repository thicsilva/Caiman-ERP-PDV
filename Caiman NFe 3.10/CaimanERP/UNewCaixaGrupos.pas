unit UNewCaixaGrupos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, dxtree, dxdbtree,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, Vcl.ImgList, ACBrUtil, VirtualTrees, System.StrUtils,
  Vcl.ExtCtrls, Vcl.Menus, cxGraphics, Vcl.ToolWin, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMetropolis,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, cxLabel, UNovosComponentes, UNovoFormulario,
  System.ImageList;

type
  PGrupos = ^TGrupos;
  TGrupos = record
      COD_EMP, NV1, NV2, NV3, NV4, NV5: Integer;
      Descricao: String;
      Tipo_DC: string;
      TIPO: Integer;
      OP_SALDO: String;
      OP_HIST_INFO, OP_HIST_FECHA: STring;
      OP_COMPROVANTE: String;
      ImageIndex: Integer;
      Nivel: Integer;
  end;

  TfrmNewCaixaGrupos = class(TForm)
    QGrupos: TFDQuery;
    TRGrupos: TFDTransaction;
    QGruposCOD_EMP: TIntegerField;
    QGruposNV1: TIntegerField;
    QGruposNV2: TIntegerField;
    QGruposNV3: TIntegerField;
    QGruposDESCRICAO: TStringField;
    QGruposTIPO_DC: TStringField;
    QGruposTIPO: TIntegerField;
    QGruposOP_SALDO: TStringField;
    QGruposOP_HIST_FECHA: TStringField;
    QGruposOP_HIST_INFO: TStringField;
    QGruposOP_COMPROVANTE: TStringField;
    dsGrupos: TDataSource;
    ilTree: TImageList;
    tvGrupos: TVirtualStringTree;
    QGruposNV4: TIntegerField;
    QGruposNV5: TIntegerField;
    upGrupos: TFDUpdateSQL;
    pnlEdit: TPanel;
    ToolBar1: TToolBar;
    BarraMenu: TcxImageList;
    BarraSubMenu: TcxImageList;
    btnNovo: TToolButton;
    btnEditar: TToolButton;
    btnExcluir: TToolButton;
    pnl1: TPanel;
    dbrgrpTIPO: TDBRadioGroup;
    cxLabel2: TcxLabel;
    dbedtNOME_PRO: TDBEdit;
    pnlTipo: TPanel;
    dbrgrpTIPO_DC: TDBRadioGroup;
    dbrgrpOP_SALDO: TDBRadioGroup;
    dbrgrpOP_HIST_FECHA: TDBRadioGroup;
    Panel1: TPanel;
    dbrgrpOP_HIST_INFO: TDBRadioGroup;
    dbrgrpOP_COMPROVANTE: TDBRadioGroup;
    pnlTipoVisible: TPanel;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    lblNivel: TcxLabel;
    QAux: TFDQuery;
    TRAux: TFDTransaction;
    shp1: TShape;
    shp2: TShape;
    Panel2: TPanel;
    Shape1: TShape;
    cxLabel1: TcxLabel;
    edtLocalizar: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure tvGruposGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure btnEditarClick(Sender: TObject);
    procedure dsGruposStateChange(Sender: TObject);
    procedure QGruposAfterPost(DataSet: TDataSet);
    procedure QGruposAfterCancel(DataSet: TDataSet);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure QGruposAfterScroll(DataSet: TDataSet);
    procedure QGruposTIPOChange(Sender: TField);
    procedure tvGruposChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure QGruposBeforePost(DataSet: TDataSet);
    procedure dbrgrpTIPOChange(Sender: TObject);
    procedure tvGruposDrawText(Sender: TBaseVirtualTree; TargetCanvas: TCanvas;
      Node: PVirtualNode; Column: TColumnIndex; const Text: string;
      const CellRect: TRect; var DefaultDraw: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure edtLocalizarChange(Sender: TObject);
    procedure tvGruposGetImageIndexEx(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
      var Ghosted: Boolean; var ImageIndex: TImageIndex;
      var ImageList: TCustomImageList);
  private
    { Private declarations }
    LockPnl: TObject;
    Selecionado: PVirtualNode;
    NivelSelecionado: Integer;
    NivelIncluindo: Integer;
    NodeIncluindo: PVirtualNode;
    NodePrincipal: PVirtualNode;
    procedure MostraGruposTree;
    procedure DeletaGrupoNivel( vNivel: Integer );
    procedure LocalizaGrupo( Filtro: STring );
  public
    { Public declarations }
  end;

  function frmNewCaixaGrupos: TfrmNewCaixaGrupos;

implementation

{$R *.dfm}

uses UNovoPrincipal, UDM, UDialog, UDicLib;

function frmNewCaixaGrupos: TfrmNewCaixaGrupos;
begin
   Result := TfrmNewCaixaGrupos( BuscaFormulario( TfrmNewCaixaGrupos, False ) );
end;

procedure TfrmNewCaixaGrupos.btnEditarClick(Sender: TObject);
begin
   if QGruposNV1.IsNull then
      Exit;
   QGrupos.Edit;
end;

procedure TfrmNewCaixaGrupos.btnExcluirClick(Sender: TObject);
begin
   if QGruposNV1.IsNull then
      Exit;
   if not KDialog( 'Tem Certeza que deseja excluir esse registro?', 'Exclusão', tdtPergunta ) then
      Exit;
   if QGruposTIPO.AsInteger = 0 then
      DeletaGrupoNivel( NivelSelecionado )
   else
      QGrupos.Delete;
   TRGrupos.CommitRetaining;
   MostraGruposTree;
end;

procedure TfrmNewCaixaGrupos.btnNovoClick(Sender: TObject);
var
   Dados: PGrupos;
begin
   NivelIncluindo := NivelSelecionado;
   NodeIncluindo := nil;
   if ( Selecionado <> nil ) then
      begin
         Dados := tvGrupos.GetNodeData( Selecionado );
         if Dados.TIPO = 1 then
            begin
               if Selecionado.Parent <> nil then
                 NodeIncluindo := Selecionado.Parent
               else
                 NodeIncluindo := Selecionado;
            end
         else
            NodeIncluindo := Selecionado;
      end;
   QGrupos.Insert;
   QGruposTIPO.AsInteger := 0;
end;

procedure TfrmNewCaixaGrupos.dbrgrpTIPOChange(Sender: TObject);
begin
   pnlTipoVisible.Visible := QGruposTIPO.AsInteger = 1;
end;

procedure TfrmNewCaixaGrupos.DeletaGrupoNivel(vNivel: Integer);
var
  I: Integer;
begin
//
   if QGruposTIPO.AsInteger = 1 then
      Exit;
   if TRAux.Active then
      TRAux.Commit;
   TRAux.StartTransaction;
   try
       QAux.Close;
       QAux.SQL.Clear;
       QAux.SQL.Add( 'DELETE FROM NEW_CAIXA_GRUPOS WHERE NV1=:NV1');
       QAux.ParamByName( 'NV1' ).AsInteger := QGruposNV1.AsInteger;
       if vNivel > 1 then
       for I := 1 to vNivel do
          begin
             QAux.SQL.Add( 'AND NV' + IntToStr( I ) + '=:NV' + IntToStr( I ) );
             QAux.ParamByName( 'NV' + IntToStr( I ) ).AsInteger :=
                QGrupos.FieldByName( 'NV' + IntToStr( I ) ).AsInteger;
          end;
       QAux.ExecSQL;
   finally
      TRAux.Commit;
   end;
end;

procedure TfrmNewCaixaGrupos.dsGruposStateChange(Sender: TObject);
begin
   if ( QGrupos.State in [ dsEdit, dsInsert ] )
     and ( pnlEdit.Height = 5 ) then
      TDicAnimacao.AnimarPropriedade( pnlEdit, 'Height', 178, 15, 10, LockPnl )
   else
     if ( pnlEdit.Height = 178 ) and
     (  not ( QGrupos.State in [ dsEdit, dsInsert ] ) ) then
      TDicAnimacao.AnimarPropriedade( pnlEdit, 'Height', 5, 15, 10, LockPnl );
//   pnlEdit.Visible := QGrupos.State in [ dsEdit, dsInsert ];
   btnNovo.Enabled := not ( QGrupos.State in [ dsEdit, dsInsert ] );
   btnExcluir.Enabled := not (  QGrupos.State in [ dsEdit, dsInsert ] );
   btnEditar.Enabled := not (  QGrupos.State in [ dsEdit, dsInsert ] );
end;

procedure TfrmNewCaixaGrupos.edtLocalizarChange(Sender: TObject);
begin
   LocalizaGrupo( edtLocalizar.Text );
end;

procedure TfrmNewCaixaGrupos.FormCreate(Sender: TObject);
begin
   LockPnl := TObject.Create;
   pnlEdit.Height := 5;
   tvGrupos.NodeDataSize := SizeOf( TGrupos );
   tvGrupos.Clear;
   MostraGruposTree;
end;

procedure TfrmNewCaixaGrupos.FormDestroy(Sender: TObject);
begin
   FreeAndNil( LockPnl );
   QGrupos.Close;
   QAux.Close;
   if TRGrupos.Active then
      TRGrupos.Commit;
   if TRAux.Active then
      TRAux.Commit;
end;

procedure TfrmNewCaixaGrupos.LocalizaGrupo(Filtro: STring);
var
  Node, NodeParent: PVirtualNode;
  Dados: PGrupos;
begin
  tvGrupos.BeginUpdate;
  try
      Node := tvGrupos.GetFirst();
      while node <> nil do
          begin
             if Filtro = '' then
                begin
                    Include( Node.States, vsVisible );
                end
             else
             if Node.Parent <> nil then
                begin
                   Exclude( Node.States, vsVisible );
                end;
             Node := tvGrupos.GetNext( Node );
          end;
       if Filtro = '' then
          Exit;
      Node := tvGrupos.GetFirst();
      while node <> nil do
          begin
             Dados := tvGrupos.GetNodeData( Node );
             if Pos( Filtro, Dados.Descricao ) > 0 then
                begin
                   Include( Node.States, vsVisible );
                   NodeParent := Node.Parent;
                   while NodeParent <> nil do
                       begin
                          Include( NodeParent.States, vsVisible );
                          NodeParent := NodeParent.Parent;
                       end;
                end;
             Node := tvGrupos.GetNext( Node );
          end;
  finally
        tvGrupos.EndUpdate;
  end;
end;

procedure TfrmNewCaixaGrupos.MostraGruposTree;
var
   NV1, NV2, NV3, NV4, NV5: PVirtualNode;
   Dados: PGrupos;
   procedure PreencheDadosG( vImg, vNivel: Integer; vDados: PGrupos );
   begin
       vDados.ImageIndex := vImg;
       vDados.COD_EMP := QGruposCOD_EMP.AsInteger;
       vDados.NV1 := QGruposNV1.AsInteger;
       vDados.NV2 := QGruposNV2.AsInteger;
       vDados.NV3 := QGruposNV3.AsInteger;
       vDados.NV4 := QGruposNV4.AsInteger;
       vDados.NV5 := QGruposNV5.AsInteger;
       vDados.Descricao := QGruposDESCRICAO.AsString;
       vDados.Tipo_DC := QGruposTIPO_DC.AsString;
       vDados.TIPO := QGruposTIPO.AsInteger;
       vDados.OP_SALDO := QGruposOP_SALDO.AsString;
       vDados.OP_HIST_INFO := QGruposOP_HIST_INFO.AsString;
       vDados.OP_HIST_FECHA := QGruposOP_HIST_FECHA.AsString;
       vDados.OP_COMPROVANTE := QGruposOP_COMPROVANTE.AsString;
       vDados.Nivel := vNivel;
   end;
begin
  tvGrupos.BeginUpdate;
  try
       if TRGrupos.Active then
          TRGrupos.Commit;
       NivelSelecionado := 0;
       lblNivel.Caption := 'Selecionado' + sLineBreak + 'Nível 0';
       Selecionado := nil;
       NivelIncluindo := 0;
       NodeIncluindo := nil;
       TRGrupos.StartTransaction;
       tvGrupos.Clear;
       NodePrincipal := tvGrupos.AddChild( nil );
       Dados := tvGrupos.GetNodeData( NodePrincipal );
       Dados.TIPO := 99;
       Dados.ImageIndex := 3;
       QGrupos.Close;
       QGrupos.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
       QGrupos.Open;
       QGrupos.First;
       while not QGrupos.Eof do
          begin
             if ( QGruposNV2.AsInteger = 0 )
              and ( QGruposNV3.AsInteger = 0 )
              and ( QGruposNV4.AsInteger = 0 )
              and ( QGruposNV5.AsInteger = 0 ) then
                begin
                   NV1 := tvGrupos.AddChild( NodePrincipal );
                   Dados := tvGrupos.GetNodeData( NV1 );
                   PreencheDadosG( QGruposTIPO.AsInteger + 1, 1, Dados );
                end
             else
             if ( QGruposNV2.AsInteger > 0 )
              and ( QGruposNV3.AsInteger = 0 )
              and ( QGruposNV4.AsInteger = 0 )
              and ( QGruposNV5.AsInteger = 0 ) then
                begin
                   NV2 := tvGrupos.AddChild( NV1 );
                   Dados := tvGrupos.GetNodeData( NV2 );
                   PreencheDadosG( QGruposTIPO.AsInteger + 1, 2, Dados );
                end
             else
              if ( QGruposNV2.AsInteger > 0 )
              and ( QGruposNV3.AsInteger > 0 )
              and ( QGruposNV4.AsInteger = 0 )
              and ( QGruposNV5.AsInteger = 0 ) then
                begin
                   NV3 := tvGrupos.AddChild( NV2 );
                   Dados := tvGrupos.GetNodeData( NV3 );
                   PreencheDadosG( QGruposTIPO.AsInteger + 1, 3, Dados );
                end
             else
              if ( QGruposNV2.AsInteger > 0 )
              and ( QGruposNV3.AsInteger > 0 )
              and ( QGruposNV4.AsInteger > 0 )
              and ( QGruposNV5.AsInteger = 0 ) then
                begin
                   NV4 := tvGrupos.AddChild( NV3 );
                   Dados := tvGrupos.GetNodeData( NV4 );
                   PreencheDadosG( QGruposTIPO.AsInteger + 1, 4, Dados );
                end
             else
              if ( QGruposNV2.AsInteger > 0 )
              and ( QGruposNV3.AsInteger > 0 )
              and ( QGruposNV4.AsInteger > 0 )
              and ( QGruposNV5.AsInteger > 0 ) then
                begin
                   NV5 := tvGrupos.AddChild( NV4 );
                   Dados := tvGrupos.GetNodeData( NV5 );
                   PreencheDadosG( QGruposTIPO.AsInteger + 1, 5, Dados );
                end;
             QGrupos.Next;
          end;
       tvGrupos.FullExpand;
       edtLocalizar.Text := '';
   finally
      tvGrupos.EndUpdate;
   end;
end;

procedure TfrmNewCaixaGrupos.QGruposAfterCancel(DataSet: TDataSet);
begin
   TRGrupos.CommitRetaining;
   MostraGruposTree;
end;

procedure TfrmNewCaixaGrupos.QGruposAfterPost(DataSet: TDataSet);
begin
   TRGrupos.CommitRetaining;
   MostraGruposTree;
end;

procedure TfrmNewCaixaGrupos.QGruposAfterScroll(DataSet: TDataSet);
begin
   pnlTipoVisible.Visible := QGruposTIPO.AsInteger = 1;
end;

procedure TfrmNewCaixaGrupos.QGruposBeforePost(DataSet: TDataSet);
var
  Dados: PGrupos;
begin
    if not ( QGrupos.State = dsInsert ) then
       Exit;
    QGruposNV1.AsInteger := 0;
    QGruposNV2.AsInteger := 0;
    QGruposNV3.AsInteger := 0;
    QGruposNV4.AsInteger := 0;
    QGruposNV5.AsInteger := 0;
    QGruposCOD_EMP.AsInteger := iEmp;
    if QGruposTIPO.AsInteger = 0 then
       QGruposTIPO_DC.AsString := 'D';
    if NodeIncluindo <> nil then
       begin
          Dados := tvGrupos.GetNodeData( NodeIncluindo );
          if Dados.NV1 > 0 then
             QGruposNV1.AsInteger := Dados.NV1;
          if Dados.NV2 = 0 then
             begin
                QGruposNV2.AsInteger :=
                   TDicLib.ProximoCodigo( 'NEW_CAIXA_GRUPOS',
                   'NV2',
                   'COD_EMP=' + IntToStr( iEmp ) +
                   ' AND NV1=' + IntToStr( Dados.NV1 ), DM.IBDatabase );
                Exit;
             end;
          QGruposNV2.AsInteger := Dados.NV2;
          if Dados.NV3 = 0 then
             begin
                QGruposNV3.AsInteger :=
                   TDicLib.ProximoCodigo( 'NEW_CAIXA_GRUPOS',
                   'NV3',
                   'COD_EMP=' + IntToStr( iEmp ) +
                   ' AND NV1=' + IntToStr( Dados.NV1 ) +
                   ' AND NV2=' + IntToStr( Dados.NV2 ), DM.IBDatabase );
                Exit;
             end;
          QGruposNV3.AsInteger := Dados.NV3;
          if Dados.NV4 = 0 then
             begin
                QGruposNV4.AsInteger :=
                   TDicLib.ProximoCodigo( 'NEW_CAIXA_GRUPOS',
                   'NV4',
                   'COD_EMP=' + IntToStr( iEmp ) +
                   ' AND NV1=' + IntToStr( Dados.NV1 ) +
                   ' AND NV2=' + IntToStr( Dados.NV2 ) +
                   ' AND NV3=' + IntToStr( Dados.NV3 ), DM.IBDatabase );
                Exit;
             end;
          QGruposNV4.AsInteger := Dados.NV4;
          if Dados.NV5 = 0 then
             begin
                QGruposNV5.AsInteger :=
                   TDicLib.ProximoCodigo( 'NEW_CAIXA_GRUPOS',
                   'NV5',
                   'COD_EMP=' + IntToStr( iEmp ) +
                   ' AND NV1=' + IntToStr( Dados.NV1 ) +
                   ' AND NV2=' + IntToStr( Dados.NV2 ) +
                   ' AND NV3=' + IntToStr( Dados.NV3 ) +
                   ' AND NV4=' + IntToStr( Dados.NV4 ), DM.IBDatabase );
                Exit;
             end;
          QGruposNV5.AsInteger := Dados.NV5;
       end;
    QGruposNV1.AsInteger := TDicLib.ProximoCodigo( 'NEW_CAIXA_GRUPOS',
       'NV1',
       'COD_EMP=' + IntToStr( iEmp ), DM.IBDatabase );
end;

procedure TfrmNewCaixaGrupos.QGruposTIPOChange(Sender: TField);
begin
   pnlTipoVisible.Visible := QGruposTIPO.AsInteger = 1;
end;

procedure TfrmNewCaixaGrupos.ToolButton1Click(Sender: TObject);
begin
   QGrupos.Post;
end;

procedure TfrmNewCaixaGrupos.ToolButton2Click(Sender: TObject);
begin
   QGrupos.Cancel;
end;

procedure TfrmNewCaixaGrupos.tvGruposChange(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  Dados: PGrupos;
begin
   if Node = nil then
      Exit;
   Selecionado := Node;
   Dados := tvGrupos.GetNodeData( Selecionado );
   if Dados = nil then
      Exit;
   if Dados.TIPO = 99 then
     begin
           NivelSelecionado := 0;
           lblNivel.Caption := 'Selecionado' + sLineBreak + 'Nível 0';
           Selecionado := nil;
           NivelIncluindo := 0;
           NodeIncluindo := nil;
           Exit;
     end;
   NivelSelecionado := Dados.Nivel;
   lblNivel.Caption := 'Selecionado' + sLineBreak + 'Nível ' + IntToStr( Dados.Nivel );
   QGrupos.Locate( 'NV1;NV2;NV3;NV4;NV5',
     VarArrayOf( [ Dados.NV1,
     Dados.NV2,
     Dados.NV3,
     Dados.NV4,
     Dados.NV5 ] ), [ loCaseInsensitive, loPartialKey ] );
end;

procedure TfrmNewCaixaGrupos.tvGruposDrawText(Sender: TBaseVirtualTree;
  TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  const Text: string; const CellRect: TRect; var DefaultDraw: Boolean);
var
   Dados: PGrupos;
begin
   Dados := tvGrupos.GetNodeData( Node );
   if ( Dados.TIPO = 99 ) then
      begin
         TargetCanvas.Font.Color := clGray;
         TargetCanvas.Font.Style := [fsItalic];
         Exit;
      end;
   if Dados.TIPO = 0 then
      begin
         TargetCanvas.Font.Color := clGrayText;
         TargetCanvas.Font.Style := [fsBold];
         Exit;
      end;
end;

procedure TfrmNewCaixaGrupos.tvGruposGetImageIndexEx(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
  var Ghosted: Boolean; var ImageIndex: TImageIndex;
  var ImageList: TCustomImageList);
var
  Dados: PGrupos;
begin
   if not ( Kind in [ ikNormal, ikSelected ] ) then
      begin
         Exit;
      end;
   Dados := tvGrupos.GetNodeData( Node );
   case Column of
       0: ImageIndex := Dados.ImageIndex;
   end;
end;

procedure TfrmNewCaixaGrupos.tvGruposGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: string);
var
   Dados: PGrupos;
begin
   Dados := tvGrupos.GetNodeData( Node );
   if ( Dados.TIPO = 99 ) and ( Column <> 0 ) then
      begin
         CellText := '';
         Exit;
      end;
   if ( Dados.TIPO = 99 ) then
      begin
         CellText := 'Raiz';
         Exit;
      end;
   case Column of
       0: CellText := IntToStr( Dados.NV1 ) +
          IfThen( Dados.NV2 > 0, '.' + IntToStr( Dados.NV2 ), ''  ) +
          IfThen( Dados.NV3 > 0, '.' + IntToStr( Dados.NV3 ), ''  ) +
          IfThen( Dados.NV4 > 0, '.' + IntToStr( Dados.NV4 ), ''  ) +
          IfThen( Dados.NV5 > 0, '.' + IntToStr( Dados.NV5 ), ''  ) ;
       1: CellText :=  ifthen( Dados.TIPO = 1,
          ifThen( Dados.Tipo_DC = 'D','(-) ', '(+) ' ) , '' ) + Dados.Descricao;
       2: CellText := IfThen( Dados.TIPO = 0, '',
                         IfThen( Dados.Tipo_DC = 'D', 'Débito', 'Crédito' ) );
       3: CellText := IfThen( Dados.TIPO = 0, '',
                         IfThen(  Dados.OP_SALDO = 'S', 'Sim', 'Não' ) );
       4: CellText := IfThen( Dados.TIPO = 0, '',
                         IfThen(  Dados.OP_HIST_FECHA = 'S', 'Sim', 'Não' ) );
       5: CellText := IfThen( Dados.TIPO = 0, '',
                         IfThen(  Dados.OP_HIST_INFO = 'S', 'Sim', 'Não' ) );
       6: CellText := IfThen( Dados.TIPO = 0, '',
                         IfThen(  Dados.OP_COMPROVANTE = 'S', 'Sim', 'Não' ) );
   end;
end;

end.
