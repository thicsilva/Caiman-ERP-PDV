unit UCadEtiquetasModelos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.ImgList, cxGraphics, Vcl.ExtCtrls, RzPanel, RzDBNav, Vcl.ComCtrls,
  Vcl.ToolWin, frxClass, frxDBSet, frxDesgn, System.StrUtils;

const
   fr1mm = 10;
type
  TfrmCadEtiquetasModelos = class(TForm)
    dbGridEtiquetas: TDBGrid;
    BarraSubMenu: TcxImageList;
    tlbEtiquetas: TToolBar;
    btnNovo: TToolButton;
    btnEditar: TToolButton;
    btnCancelar: TToolButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Configuracoes( const Novo: Boolean = false );
  public
    { Public declarations }
  end;

var
  frmCadEtiquetasModelos: TfrmCadEtiquetasModelos;

implementation

{$R *.dfm}

uses UDM, URelEtiqueta, UDicLib, UConfigEtiquetas, UDialog;

procedure TfrmCadEtiquetasModelos.btnCancelarClick(Sender: TObject);
begin
   if not KDialog( 'Tem certeza que deseja excluir esse modelo?', 'Exclusão', tdtPergunta ) then
      Exit;
   FrmRelEtiqueta.QEtiqModelos.Delete;
   FrmRelEtiqueta.IBTRETQ.CommitRetaining;
   FrmRelEtiqueta.QEtiqModelos.Refresh;
end;

procedure TfrmCadEtiquetasModelos.btnEditarClick(Sender: TObject);
begin
   if FrmRelEtiqueta.QEtiqModelosNOME_REL.AsString <> '' then
      begin
        TDicLib.GetRel( iEmp, 'REL_ETIQUETAS', FrmRelEtiqueta.QEtiqModelosTIPO.AsString,
          FrmRelEtiqueta.frxEtiquetas, DM.IBDatabase );
      end;
   Configuracoes;
end;

procedure TfrmCadEtiquetasModelos.btnNovoClick(Sender: TObject);
begin
   if FrmRelEtiqueta.QEtiqModelosNOME_REL.AsString <> '' then
      begin
        TDicLib.GetRel( iEmp, 'REL_ETIQUETAS', FrmRelEtiqueta.QEtiqModelosTIPO.AsString,
          FrmRelEtiqueta.frxEtiquetas, DM.IBDatabase );
      end;
   Configuracoes( True );
end;

procedure TfrmCadEtiquetasModelos.Configuracoes( const Novo: Boolean = false  );
var
   Form: TfrmConfigEtiquetas;
   Modal: TModalResult;
begin
   Form := TfrmConfigEtiquetas.Create( nil );
   try
      Form.edtDescricao.Text := ifthen( Novo, 'NOVO MODELO', FrmRelEtiqueta.QEtiqModelosTIPO.AsString );
      Form.edtDescricao.ReadOnly := not Novo;
      with TfrxReportPage( FrmRelEtiqueta.frxEtiquetas.FindComponent( 'Page1' ) ) do
          begin
              Form.curTop.Value :=  TDicCalc.Dividir( TopMargin , fr1cm  );
              Form.curBottom.Value := TDicCalc.Dividir( BottomMargin , fr1cm );
              Form.curLeft.Value := TDicCalc.Dividir( LeftMargin , fr1cm );
              Form.curRight.Value := TDicCalc.Dividir( RightMargin , fr1cm );
              Form.curHeight.Value := TDicCalc.Dividir( PaperHeight , fr1mm );
              Form.curWidth.Value := TDicCalc.Dividir( PaperWidth , fr1mm );
              Form.chkEndLess.Checked := EndlessHeight;
              Form.curColunms.Value := Columns;
          end;
        with TfrxMasterData( FrmRelEtiqueta.frxEtiquetas.FindComponent( 'dbMaster' ) ) do
            begin
               Form.curEspColunas.Value := TDicCalc.Dividir( ColumnWidth , fr1cm );
               Form.curLargEtiqueta.Value := TDicCalc.Dividir( ColumnGap, fr1cm );
               Form.curAltEtiqueta.Value := TDicCalc.Dividir( Height, fr1cm );
            end;
      Modal := Form.ShowModal;
      if Form.ModalResult = mrOk then
          begin
               with TfrxReportPage( FrmRelEtiqueta.frxEtiquetas.FindComponent( 'Page1' ) ) do
                  begin
                      TopMargin := Form.curTop.Value * fr1cm;
                      BottomMargin := Form.curBottom.Value * fr1cm;
                      LeftMargin := Form.curLeft.Value * fr1cm;
                      RightMargin := Form.curRight.Value * fr1cm;
                      PaperHeight := Form.curHeight.Value * fr1mm;
                      PaperWidth := Form.curWidth.Value * fr1mm;;
                      EndlessHeight := Form.chkEndLess.Checked;
                      Columns := Round( Form.curColunms.Value );
                  end;
                with TfrxMasterData( FrmRelEtiqueta.frxEtiquetas.FindComponent( 'dbMaster' ) ) do
                    begin
                       ColumnWidth :=  Form.curEspColunas.Value * fr1cm;
                       ColumnGap :=  Form.curLargEtiqueta.Value * fr1cm;
                       Height :=  Form.curAltEtiqueta.Value * fr1cm;
                    end;
               FrmRelEtiqueta.frxEtiquetas.DesignReport( True, False );
               TDicLib.SetRel( iEmp, 'REL_ETIQUETAS', Form.edtDescricao.Text,
                 FrmRelEtiqueta.frxEtiquetas, DM.IBDatabase );
               FrmRelEtiqueta.IBTRETQ.CommitRetaining;
               FrmRelEtiqueta.QEtiqModelos.Refresh;
          end;

   finally
      FreeAndNil( Form );
   end;
end;

end.
