unit UConfigPostos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, ComCtrls, StdCtrls, ExtCtrls, DBCtrls, Mask, Buttons, Grids, 
  DBGrids, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TfrmConfigPostos = class(UNovoFormulario.TForm)
    Paginas: TPageControl;
    TabSheet1: TTabSheet;
    QConcentrador: TFDQuery;
    UpConcentrador: TFDUpdateSQL;
    QConcentradorCOD_EMP: TIntegerField;
    QConcentradorCONCENTRADOR: TIntegerField;
    QConcentradorTIPO_COMUNICAO: TIntegerField;
    QConcentradorPORTA: TStringField;
    QConcentradorIPCONCENTRADOR: TStringField;
    QConcentradorVELOCIDADE: TIntegerField;
    dbrgrpConcentrador: TDBRadioGroup;
    dsConcentrador: TDataSource;
    dbrgrpTIPO_COMUNICAO: TDBRadioGroup;
    Label1: TLabel;
    dbedtPORTA: TDBEdit;
    Label2: TLabel;
    dbedtIPCONCENTRADOR: TDBEdit;
    dbedtVELOCIDADE: TDBEdit;
    Label3: TLabel;
    btnSalvaCon: TsSpeedButton;
    btnCancelaCon: TsSpeedButton;
    TabSheet2: TTabSheet;
    dsTanques: TDataSource;
    QTanques: TFDQuery;
    upTanques: TFDUpdateSQL;
    QTanquesCOD_EMP: TIntegerField;
    QTanquesCOD_TAQ: TIntegerField;
    QTanquesCOD_PRO: TIntegerField;
    QTanquesCAPACIDADE: TBCDField;
    QTanquesSALDO_INICIAL: TBCDField;
    DBGrid1: TDBGrid;
    QTanquesDESC_CUPOM: TStringField;
    btnCancTaq: TsSpeedButton;
    btnSalvaTaq: TsSpeedButton;
    Label4: TLabel;
    dbedtCOD_TAQ: TDBEdit;
    btnNovoTaq: TsSpeedButton;
    dbedtCOD_PRO: TDBEdit;
    Label5: TLabel;
    dbedtDESC_CUPOM: TDBEdit;
    Label6: TLabel;
    BtnConsProdEstoque: TsSpeedButton;
    Label7: TLabel;
    dbedtCAPACIDADE: TDBEdit;
    Label8: TLabel;
    dbedtSALDO_INICIAL: TDBEdit;
    TRConfigPostos: TFDTransaction;
    TabSheet3: TTabSheet;
    DsBicos: TDataSource;
    QBicos: TFDQuery;
    UpBicos: TFDUpdateSQL;
    QBicosCOD_EMP: TIntegerField;
    QBicosCOD_TAQ: TIntegerField;
    QBicosCODIGO_BICO: TIntegerField;
    QBicosCODIGO_FISICO: TStringField;
    QBicosCASA_PRECO: TIntegerField;
    QBicosCASA_VOLUME: TIntegerField;
    QBicosCASA_ENCERRANTE: TIntegerField;
    DBGrid2: TDBGrid;
    Label9: TLabel;
    dbedtCODIGO_BICO: TDBEdit;
    btnCancBico: TsSpeedButton;
    btnSalvaBico: TsSpeedButton;
    btnNovoBico: TsSpeedButton;
    Label10: TLabel;
    dbedtCOD_TAQ1: TDBEdit;
    Label11: TLabel;
    dbedtCODIGO_FISICO: TDBEdit;
    Label12: TLabel;
    dbedtCASA_PRECO: TDBEdit;
    Label13: TLabel;
    dbedtCASA_VOLUME: TDBEdit;
    Label14: TLabel;
    dbedtCASA_ENCERRANTE: TDBEdit;
    TabSheet4: TTabSheet;
    DsBombas: TDataSource;
    QBombas: TFDQuery;
    upBombas: TFDUpdateSQL;
    QBombasCOD_EMP: TIntegerField;
    QBombasCOD_BOMBA: TIntegerField;
    QBombasSERIE: TStringField;
    QBombasFABRICANTE: TStringField;
    QBombasMODELO: TStringField;
    QBombasTIPO_MEDICAO: TIntegerField;
    QBombasNUM_LACRE: TStringField;
    QBombasDT_APLICACAO: TDateField;
    DBGrid3: TDBGrid;
    Label15: TLabel;
    dbedtCOD_BOMBA: TDBEdit;
    dbedtSERIE: TDBEdit;
    Label16: TLabel;
    dbedtFABRICANTE: TDBEdit;
    Label17: TLabel;
    dbedtMODELO: TDBEdit;
    Label18: TLabel;
    dbedtNUM_LACRE: TDBEdit;
    Label19: TLabel;
    dbedtDT_APLICACAO: TDBEdit;
    Label20: TLabel;
    btnCancBomba: TsSpeedButton;
    btnSalvaBomba: TsSpeedButton;
    btnNovoBomba: TsSpeedButton;
    dbrgrpTIPO_MEDICAO: TDBRadioGroup;
    procedure QConcentradorBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsConcentradorStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvaConClick(Sender: TObject);
    procedure btnCancelaConClick(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure QTanquesBeforePost(DataSet: TDataSet);
    procedure dsTanquesStateChange(Sender: TObject);
    procedure btnNovoTaqClick(Sender: TObject);
    procedure BtnConsProdEstoqueClick(Sender: TObject);
    procedure btnSalvaTaqClick(Sender: TObject);
    procedure btnCancTaqClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure QBicosBeforePost(DataSet: TDataSet);
    procedure btnCancBicoClick(Sender: TObject);
    procedure btnSalvaBicoClick(Sender: TObject);
    procedure btnNovoBicoClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DsBicosStateChange(Sender: TObject);
    procedure DsBombasStateChange(Sender: TObject);
    procedure btnCancBombaClick(Sender: TObject);
    procedure btnSalvaBombaClick(Sender: TObject);
    procedure btnNovoBombaClick(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure QBombasBeforePost(DataSet: TDataSet);
    procedure TabSheet4Show(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigPostos: TfrmConfigPostos;

implementation

uses
  UDM, UConsProd, UNovoPrincipal;

{$R *.dfm}

procedure TfrmConfigPostos.btnCancBombaClick(Sender: TObject);
begin
   QBombas.Cancel;
end;

procedure TfrmConfigPostos.btnCancelaConClick(Sender: TObject);
begin
   QConcentrador.Cancel;
end;

procedure TfrmConfigPostos.btnCancTaqClick(Sender: TObject);
begin
   QTanques.Cancel;
   QTanques.Refresh;
end;

procedure TfrmConfigPostos.BtnConsProdEstoqueClick(Sender: TObject);
begin
   if  (dsTanques.State = dsInsert ) or (dsTanques.State = dsEdit) then
       begin
          Application.CreateForm(TFrmConsProd, FrmConsProd);
          FrmConsProd.Tag:= 101;
          FrmConsProd.ShowModal;
       end;
end;

procedure TfrmConfigPostos.btnNovoTaqClick(Sender: TObject);
begin
   QTanques.Insert;
end;

procedure TfrmConfigPostos.btnSalvaConClick(Sender: TObject);
begin
   QConcentrador.Post;
end;

procedure TfrmConfigPostos.btnSalvaTaqClick(Sender: TObject);
begin
   QTanques.Post;
   QTanques.Refresh;
end;

procedure TfrmConfigPostos.DBGrid1DblClick(Sender: TObject);
begin
   if not QTanquesCOD_TAQ.IsNull then
      begin
          QTanques.Edit;
      end;
end;

procedure TfrmConfigPostos.DBGrid2DblClick(Sender: TObject);
begin
   if not QBicosCODIGO_BICO.IsNull   then
      begin
         QBicos.Edit;
      end;
end;

procedure TfrmConfigPostos.DBGrid3DblClick(Sender: TObject);
begin
   if not QBombasCOD_BOMBA.IsNull then
      QBombas.Edit;
end;

procedure TfrmConfigPostos.DsBicosStateChange(Sender: TObject);
begin
    case DsBicos.State of
      dsBrowse: begin
                    btnSalvaBico.Enabled := False;
                    btnCancBico.Enabled := False;
                    btnNovoBico.Enabled := True;
                end;
      dsEdit,
      dsInsert: begin
                    btnSalvaBico.Enabled := True;
                    btnCancBico.Enabled := true;
                    btnNovoBico.Enabled := False;
                end;
    end;

end;

procedure TfrmConfigPostos.DsBombasStateChange(Sender: TObject);
begin
    case DsBombas.State of
      dsBrowse: begin
                    btnSalvaBomba.Enabled := False;
                    btnCancBomba.Enabled := False;
                    btnNovoBomba.Enabled := True;
                end;
      dsEdit,
      dsInsert: begin
                    btnSalvaBomba.Enabled := True;
                    btnCancBomba.Enabled := true;
                    btnNovoBomba.Enabled := False;
                end;
    end;

end;

procedure TfrmConfigPostos.dsConcentradorStateChange(Sender: TObject);
begin
    case dsConcentrador.State of
      dsBrowse: begin
                    btnSalvaCon.Enabled := False;
                    btnCancelaCon.Enabled := False;
                end;
      dsEdit,
      dsInsert: begin
                    btnSalvaCon.Enabled := True;
                    btnCancelaCon.Enabled := true;
                end;
    end;
end;

procedure TfrmConfigPostos.dsTanquesStateChange(Sender: TObject);
begin
    case dsTanques.State of
      dsBrowse: begin
                    btnSalvaTaq.Enabled := False;
                    btnCancTaq.Enabled := False;
                    btnNovoTaq.Enabled := True;
                end;
      dsEdit,
      dsInsert: begin
                    btnSalvaTaq.Enabled := True;
                    btnCancTaq.Enabled := true;
                    btnNovoTaq.Enabled := False;
                end;
    end;

end;

procedure TfrmConfigPostos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   QConcentrador.Close;
   Action := caFree;
   Self := nil;
end;

procedure TfrmConfigPostos.FormShow(Sender: TObject);
begin
   QConcentrador.Close;
   QConcentrador.ParamByName( 'cod_emp' ).AsInteger := iEmp;
   QConcentrador.Open;
   Paginas.TabIndex := 0;
end;

procedure TfrmConfigPostos.QBicosBeforePost(DataSet: TDataSet);
begin
   QBicosCOD_EMP.AsInteger := iEmp;
end;

procedure TfrmConfigPostos.QBombasBeforePost(DataSet: TDataSet);
begin
   QBombasCOD_EMP.AsInteger := iEmp;
end;

procedure TfrmConfigPostos.QConcentradorBeforePost(DataSet: TDataSet);
begin
   QConcentradorCOD_EMP.AsInteger := iEmp;
end;

procedure TfrmConfigPostos.QTanquesBeforePost(DataSet: TDataSet);
begin
   QTanquesCOD_EMP.AsInteger := iEmp;
end;

procedure TfrmConfigPostos.btnCancBicoClick(Sender: TObject);
begin
   QBicos.Cancel;
end;

procedure TfrmConfigPostos.btnSalvaBicoClick(Sender: TObject);
begin
   QBicos.Post;
end;

procedure TfrmConfigPostos.btnSalvaBombaClick(Sender: TObject);
begin
   QBombas.Post;
end;

procedure TfrmConfigPostos.btnNovoBicoClick(Sender: TObject);
begin
   QBicos.Insert;
end;

procedure TfrmConfigPostos.btnNovoBombaClick(Sender: TObject);
begin
   QBombas.Insert;
end;

procedure TfrmConfigPostos.TabSheet1Show(Sender: TObject);
begin
   QBicos.Close;
    QConcentrador.Close;
    QConcentrador.ParamByName( 'cod_emp' ).AsInteger := iEmp;
    QConcentrador.Open;
end;

procedure TfrmConfigPostos.TabSheet2Show(Sender: TObject);
begin
   QBicos.Close;
   QConcentrador.Close;
   QTanques.Close;
   QTanques.ParamByName( 'cod_emp' ).AsInteger := iEmp;
   QTanques.Open;
end;

procedure TfrmConfigPostos.TabSheet3Show(Sender: TObject);
begin
   QConcentrador.Close;
   QTanques.Close;
   QBicos.Close;
   QBicos.ParamByName( 'cod_emp' ).AsInteger := iEmp;
   QBicos.Open;
end;

procedure TfrmConfigPostos.TabSheet4Show(Sender: TObject);
begin
   QConcentrador.Close;
   QTanques.Close;
   QBicos.Close;
   QBombas.Close;
   QBombas.ParamByName( 'cod_emp' ).AsInteger := iEmp;
   QBombas.Open;
end;

end.






