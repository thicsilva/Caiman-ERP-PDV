unit UConsFunc;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinsdxStatusBarPainter, dxStatusBar, Data.DB;

type
  TFrmConsFunc = class(TFrmConsNovo)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    _CodFunc : Integer;
    { Public declarations }
  end;

var
  FrmConsFunc: TFrmConsFunc;

implementation
Uses Udm, Ubibli1, UCadFunc, UCadVales, UValesBaixa, UConsValesFuncionario,
  UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsFunc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QFunc.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsFunc.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsFunc.BtnOkClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QFunc do
     begin 
        close;
        sql.Clear;
        sql.add('SELECT * FROM FUNCIONARIO');
        case ComboCons.ItemIndex of
         0: sql.Add(' WHERE NOME_FUN LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_FUN');
         1: sql.Add(' WHERE NOME_FUN LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_FUN');
         2: begin 
              if EdtCons.Text = '' then
                 sql.add(' FUNCIONARIO ORDER BY COD_FUN')
              else
                 sql.add(' WHERE COD_FUN = ' + edtcons.Text);
            end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsFunc.BtnLocalizarClick(Sender: TObject);
var i : integer;
begin 
  inherited;
  case tag of
   0,1:begin
          BuscaFormulario( TFrmCadFunc,  True );
          with FrmCadFunc do
             begin 
                tag:= 1;
                limpaedit(FrmCadFunc);
                ededit(FrmCadFunc, false);
                cod_func.Text         := dm.QFuncCOD_FUN.AsString;
                edtnome.Text          := dm.QFuncNOME_FUN.Value;
                EdtDataAdm.Text       := dm.QFuncDATA_ADM_FUN.AsString;
                EdtDataDem.Text       := dm.QFuncDATA_DEM_FUN.AsString;
                edtend.Text           := dm.QFuncEND_FUN.Value;
                edtbai.Text           := dm.QFuncBAI_FUN.Value;
                edtcid.Text           := dm.QFuncCID_FUN.Value;
                edtcep.Text           := dm.QFuncCEP_FUN.Text;
                for i:= 0 to 26 do
                   begin 
                      if ComboEst.Items[i] = dm.QFuncEST_FUN.Value then
                         ComboEst.ItemIndex:= i;
                   end;
                edtcpf.Text           := dm.QFuncCPF_FUN.Value;
                edtdoc.Text           := dm.QFuncDOC_FUN.Value;
                edttel.Text           := dm.QFuncTEL_FUN.Value;
                edtcel.Text           := dm.QFuncCEL_FUN.Value;
                edtobs.Text           := dm.QFuncOBS.Value;
                FormShow(sender);
                show;
             end;
          close;
       end;
   2:begin 
        with FrmCadVales do
          begin 
             EdtCodFun.Text  := dm.QFuncCOD_FUN.AsString;
             EdtNomeFun.Text := dm.QFuncNOME_FUN.AsString;
             EdtValor.SetFocus;
          end;
        close;
     end;
   3:begin 
        with FrmValesBaixa do
          begin 
             EdtCodFun.Text  := dm.QFuncCOD_FUN.AsString;
             EdtNomeFun.Text := dm.QFuncNOME_FUN.AsString;
             BtnOk.SetFocus;
          end;
        close;
     end;
   4:begin 
        with FrmConsValesFuncionario do
          begin 
             EdtCodFun.Text  := dm.QFuncCOD_FUN.AsString;
             EdtNomeFun.Text := dm.QFuncNOME_FUN.AsString;
          end;
        close;
     end;
   5:begin
       _CodFunc := dm.QFuncCOD_FUN.AsInteger;
       Close;
     end;
  end;
end;

procedure TFrmConsFunc.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsFunc.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.
