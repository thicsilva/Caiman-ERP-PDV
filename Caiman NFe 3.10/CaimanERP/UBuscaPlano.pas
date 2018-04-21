unit UBuscaPlano;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMetropolis,
  VirtualTrees, Vcl.StdCtrls, cxLabel, Vcl.ExtCtrls, Vcl.ImgList,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.StrUtils, UNovosComponentes, UNovoFormulario,
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

  TRetPlano = record
      Codigo, Descricao, Tipo: string;
  end;
  TfrmBuscaPlano = class(TForm)
    ilTree: TImageList;
    BarraMenu: TcxImageList;
    BarraSubMenu: TcxImageList;
    Shape1: TShape;
    Panel2: TPanel;
    cxLabel1: TcxLabel;
    edtLocalizar: TEdit;
    shp1: TShape;
    tvGrupos: TVirtualStringTree;
    QGrupos: TFDQuery;
    QGruposCOD_EMP: TIntegerField;
    QGruposNV1: TIntegerField;
    QGruposNV2: TIntegerField;
    QGruposNV3: TIntegerField;
    QGruposNV4: TIntegerField;
    QGruposNV5: TIntegerField;
    QGruposDESCRICAO: TStringField;
    QGruposTIPO_DC: TStringField;
    QGruposTIPO: TIntegerField;
    QGruposOP_SALDO: TStringField;
    QGruposOP_HIST_FECHA: TStringField;
    QGruposOP_HIST_INFO: TStringField;
    QGruposOP_COMPROVANTE: TStringField;
    TRGrupos: TFDTransaction;
    QGruposCHAVE: TStringField;
    lblNivel: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tvGruposChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure tvGruposDrawText(Sender: TBaseVirtualTree; TargetCanvas: TCanvas;
      Node: PVirtualNode; Column: TColumnIndex; const Text: string;
      const CellRect: TRect; var DefaultDraw: Boolean);
    procedure tvGruposGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure edtLocalizarChange(Sender: TObject);
    procedure tvGruposDblClick(Sender: TObject);
    procedure tvGruposKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tvGruposGetImageIndexEx(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
      var Ghosted: Boolean; var ImageIndex: TImageIndex;
      var ImageList: TCustomImageList);
  private
    { Private declarations }
    Selecionado: PVirtualNode;
    NivelSelecionado: Integer;
    NivelIncluindo: Integer;
    NodeIncluindo: PVirtualNode;
    NodePrincipal: PVirtualNode;

    procedure MostraGruposTree;
    procedure LocalizaGrupo( Filtro: STring );
  public
    { Public declarations }
  end;

  function SelecionarPlanoContas: TRetPlano;

implementation

{$R *.dfm}

uses UDM;

{ TfrmBuscaPlano }

function SelecionarPlanoContas: TRetPlano;
var
   Form: TfrmBuscaPlano;
begin
   Result.Codigo := '';
   Form := TfrmBuscaPlano.Create( nil );
   try
      Form.ShowModal;
      if Form.ModalResult <> mrOk then
         Exit;
      Result.Codigo := Form.QGruposCHAVE.AsString;
      Result.Descricao := Form.QGruposDESCRICAO.AsString;
      Result.Tipo := ifthen( Form.QGruposTIPO_DC.AsString = 'D', 'Débito', 'Crédito' );
   finally
      FreeAndNil( Form );
   end;
end;

procedure TfrmBuscaPlano.edtLocalizarChange(Sender: TObject);
begin
   LocalizaGrupo( edtLocalizar.Text );
end;

procedure TfrmBuscaPlano.FormCreate(Sender: TObject);
begin
   edtLocalizar.Clear;
   tvGrupos.NodeDataSize := SizeOf( TGrupos );
   tvGrupos.Clear;
   MostraGruposTree;
end;

procedure TfrmBuscaPlano.FormDestroy(Sender: TObject);
begin
   QGrupos.Close;
   if TRGrupos.Active then
      TRGrupos.Commit;
end;

procedure TfrmBuscaPlano.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
       VK_ESCAPE: Close;
   end;
end;

procedure TfrmBuscaPlano.LocalizaGrupo(Filtro: STring);
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

procedure TfrmBuscaPlano.MostraGruposTree;
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

procedure TfrmBuscaPlano.tvGruposChange(Sender: TBaseVirtualTree;
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

procedure TfrmBuscaPlano.tvGruposDblClick(Sender: TObject);
begin
   ModalResult := mrOk;
end;

procedure TfrmBuscaPlano.tvGruposDrawText(Sender: TBaseVirtualTree;
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


procedure TfrmBuscaPlano.tvGruposGetImageIndexEx(Sender: TBaseVirtualTree;
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

procedure TfrmBuscaPlano.tvGruposGetText(Sender: TBaseVirtualTree;
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

procedure TfrmBuscaPlano.tvGruposKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_RETURN: ModalResult := mrOk;
   end;
end;

end.


