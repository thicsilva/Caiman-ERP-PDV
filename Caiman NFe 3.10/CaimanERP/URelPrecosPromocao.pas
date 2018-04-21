unit URelPrecosPromocao;

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
  TFrmRelPrecoPromocao = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    RdgImp: TRadioGroup;
    RdgTipo: TRadioGroup;
    GB: TGroupBox;
    EdtCodIni: UNovosComponentes.TEdit;
    BtnConsIni: TsSpeedButton;
    EdtNomeIni: TEdit;
    EdtNomeFin: TEdit;
    BtnConsFin: TsSpeedButton;
    EdtCodFin: UNovosComponentes.TEdit;
    Check: TCheckBox;
    RdgTipo1: TRadioGroup;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    QRelPromocao: TFDQuery;
    QRelPromocaoCOD_PRO: TIntegerField;
    QRelPromocaoVALOR_PROMOCAO: TBCDField;
    QRelPromocaoNOME_PRO: TStringField;
    QRelPromocaoVALOR_PRO: TBCDField;
    QRelPromocaoCOD_SEC: TIntegerField;
    QRelPromocaoCOD_LAB: TIntegerField;
    QRelPromocaoNOME_SEC: TStringField;
    QRelPromocaoNOME_LAB: TStringField;
    QRelPromocaoDATA_INICIO: TDateField;
    QRelPromocaoDATA_TERMINO: TDateField;
    QRelPromocaoCOD_EMP: TIntegerField;
    GroupBox1: TGroupBox;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    Label1: TLabel;
    QRelPromocaoTIPO_PROMOCAO: TIntegerField;
    QRelPromocaoCALC_TIPO: TStringField;
    procedure LimpaGB;
    procedure RdgTipoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnConsIniClick(Sender: TObject);
    procedure EdtCodIniKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodFinKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodIniKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodIniEnter(Sender: TObject);
    procedure EdtCodFinEnter(Sender: TObject);
    procedure EdtCodIniExit(Sender: TObject);
    procedure EdtCodFinExit(Sender: TObject);
    procedure BtnConsFinClick(Sender: TObject);
    procedure CheckClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRelPromocaoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelPrecoPromocao: TFrmRelPrecoPromocao;

implementation

uses
  Udm, Ubibli1, UConsSecao, UConsLab, UQRelPromocaoGeral, UNovoPrincipal;
var  sAuxSqlProm : string;

{$R *.dfm}

procedure TFrmRelPrecoPromocao.LimpaGB;
begin 
   EdtCodIni.Clear;
   EdtCodFin.Clear;
   EdtNomeIni.Clear;
   EdtNomeFin.Clear;
end;

procedure TFrmRelPrecoPromocao.RdgTipoClick(Sender: TObject);
begin 
   LimpaGB;
   case RdgTipo.ItemIndex of
    0:begin 
         gb.Enabled    := false;
         gb.Caption    := '';
         check.Enabled := false;
         check.Caption := 'Todos';
      end;
    1:begin 
         gb.Enabled:= true;
         gb.Caption:= 'Seção';
         check.Enabled:= true;
         check.Caption:= 'Todas as Seções';
      end;
    2:begin 
         gb.Enabled:= true;
         gb.Caption:= 'Fabricante';
         check.Enabled:= true;
         check.Caption:= 'Todos as Fabricantes';
      end;
   end;
end;

procedure TFrmRelPrecoPromocao.FormShow(Sender: TObject);
begin 
   sAuxSqlProm:= QRelPromocao.SQL.Text;
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;
   RdgImp.ItemIndex  := 1;
   RdgTipo.ItemIndex := 0;
   RdgTipoClick(RdgTipo);
   RdgTipo1.ItemIndex:= 0;

end;

procedure TFrmRelPrecoPromocao.BtnConsIniClick(Sender: TObject);
begin 
   case RdgTipo.ItemIndex of
    1: begin 
          Application.CreateForm(TFrmConsSecao, FrmConsSecao);
          FrmConsSecao.tag:= 18;
          frmConsSecao.showmodal;
       end;
    2: begin 
          Application.CreateForm(TFrmConsLab, FrmConsLab);
          FrmConsLab.tag:= 8;
          frmConsLab.showmodal;
       end;
   end;
end;

procedure TFrmRelPrecoPromocao.EdtCodIniKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsIni.Click;
end;

procedure TFrmRelPrecoPromocao.EdtCodFinKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsFin.Click;
end;

procedure TFrmRelPrecoPromocao.EdtCodIniKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmRelPrecoPromocao.EdtCodIniEnter(Sender: TObject);
begin 
   edtcodini.SelectAll;
end;

procedure TFrmRelPrecoPromocao.EdtCodFinEnter(Sender: TObject);
begin 
   edtcodfin.SelectAll;
end;

procedure TFrmRelPrecoPromocao.EdtCodIniExit(Sender: TObject);
begin 
   if EdtCodIni.text = '' then
      begin 
         EdtNomeIni.Clear;
         exit;
      end;
   case RdgTipo.ItemIndex of
    1:begin 
         EdtNomeIni.Text:= Consulta('secao', edtcodini, 'cod_sec', 'nome_sec', dm.IBTransaction, dm.qConsulta);
         if EdtNomeIni.Text = '' then
            begin 
               AlertaCad('Seção não cadastrada');
//               EdtCodIni.SetFocus;
            end;
      end;
    2:begin 
         EdtNomeIni.Text:= Consulta('laboratorio', edtcodini, 'cod_lab', 'nome_lab', dm.IBTransaction, dm.qConsulta);
         if EdtNomeIni.Text = '' then
            begin 
               AlertaCad('Fabricante não cadastrado');
//               EdtCodIni.SetFocus;
            end;
      end;
   end;
end;

procedure TFrmRelPrecoPromocao.EdtCodFinExit(Sender: TObject);
begin 
   if EdtCodFin.text = '' then
      begin 
         EdtNomeFin.Clear;
         exit;
      end;
   case RdgTipo.ItemIndex of
    1:begin 
         EdtNomeFin.Text:= Consulta('secao', EdtCodFin, 'cod_sec', 'nome_sec', dm.IBTransaction, dm.qConsulta);
         if EdtNomeFin.Text = '' then
            begin 
               AlertaCad('Seção não cadastrada');
//               EdtCodFin.SetFocus;
            end;
      end;
    2:begin 
         EdtNomeFin.Text:= Consulta('laboratorio', EdtCodFin, 'cod_lab', 'nome_lab', dm.IBTransaction, dm.qConsulta);
         if EdtNomeFin.Text = '' then
            begin 
               AlertaCad('Fabricante não cadastrado');
//               EdtCodFin.SetFocus;
            end;
      end;
   end;
end;

procedure TFrmRelPrecoPromocao.BtnConsFinClick(Sender: TObject);
begin 
   case RdgTipo.ItemIndex of
    1: begin 
          Application.CreateForm(TFrmConsSecao, FrmConsSecao);
          FrmConsSecao.tag:= 19;
          frmConsSecao.showmodal;
       end;
    2: begin 
          Application.CreateForm(TFrmConsLab, FrmConsLab);
          FrmConsLab.tag:= 9;
          frmConsLab.showmodal;
       end;
   end;
end;

procedure TFrmRelPrecoPromocao.CheckClick(Sender: TObject);
begin 
   Check.Focused;
   if (RdgTipo.ItemIndex = 1) or (RdgTipo.ItemIndex = 2) then
      begin 
         LimpaGB;
         if Check.Checked then
            gb.Enabled:= false
         else
            begin 
               gb.Enabled:= true;
               EdtCodIni.SetFocus;
            end;
      end;
end;

procedure TFrmRelPrecoPromocao.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelPrecoPromocao.BtnVisClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;

   case RdgTipo1.ItemIndex of
    0: begin 
          with QRelPromocao do
             begin 
                close;
                sql.Clear;
                sql.Text:= sAuxSqlProm;
                sql.add('WHERE PRO.DATA_TERMINO >= :DATATERMINO AND PRO.DATA_INICIO <= :DATAINICIO');
                Parambyname('datatermino').AsDate := EdtDataFin.Date;
                Parambyname('datainicio').AsDate  := EdtDataIni.Date;
             end;
       end;
    1:begin 
         with QRelPromocao do
             begin 
                close;
                sql.Clear;
                sql.Text:= sAuxSqlProm;
                sql.add('WHERE PRO.DATA_INICIO BETWEEN :DATAINI AND :DATAFIN');
                Parambyname('dataini').AsDate := EdtDataIni.Date;
                Parambyname('datafin').AsDate := EdtDataFin.Date;
              end;
      end;
    2:begin 
         with QRelPromocao do
             begin 
                close;
                sql.Clear;
                sql.Text:= sAuxSqlProm;
                sql.add('WHERE PRO.DATA_TERMINO BETWEEN :DATAINI AND :DATAFIN');
                Parambyname('dataini').AsDate := EdtDataIni.Date;
                Parambyname('datafin').AsDate := EdtDataFin.Date;
              end;
      end;
   end;

   with QRelPromocao do
      begin 
         if (EdtCodIni.Text <> '') and (EdtCodFin.Text <> '') then
             begin 
                case RdgTipo.ItemIndex of
                  1:begin 
                       sql.add(' AND P.COD_SEC BETWEEN :CODINI AND :CODFIN');
                       if rdgimp.ItemIndex = 0 then
                          sql.add(' ORDER BY P.COD_SEC, PRO.COD_PRO')
                       else
                          sql.add(' ORDER BY P.COD_SEC, P.NOME_PRO');
                       Parambyname('codini').AsInteger:= strtoint(EdtCodIni.Text);
                       Parambyname('codfin').AsInteger:= strtoint(EdtCodFin.Text);
                    end;
                  2:begin 
                       sql.add(' AND P.COD_LAB BETWEEN :CODINI AND :CODFIN');
                       if rdgimp.ItemIndex = 0 then
                          sql.add(' ORDER BY P.COD_LAB, PRO.COD_PRO')
                       else
                          sql.add(' ORDER BY P.COD_LAB, P.NOME_PRO');
                       Parambyname('codini').AsInteger:= strtoint(EdtCodIni.Text);
                       Parambyname('codfin').AsInteger:= strtoint(EdtCodFin.Text);
                    end;
                end;
             end
         else
             begin 
                case RdgTipo.ItemIndex of
                  0:begin 
                       if RdgImp.ItemIndex = 0 then
                          sql.add(' ORDER BY PRO.COD_PRO')
                       else
                          sql.add(' ORDER BY P.NOME_PRO');
                    end;
                  1:begin 
                       if RdgImp.ItemIndex = 0 then
                          sql.add(' ORDER BY P.COD_SEC, PRO.COD_PRO')
                       else
                          sql.add(' ORDER BY P.COD_SEC, P.NOME_PRO');
                    end;
                  2:begin 
                       if RdgImp.ItemIndex = 0 then
                          sql.add(' ORDER BY P.COD_LAB, PRO.COD_PRO')
                       else
                          sql.add(' ORDER BY P.COD_LAB, P.NOME_PRO');
                    end;
                end;
             end;
         open;
      end;
    Application.CreateForm(TFrmQRelPromocaoGeral, FrmQRelPromocaoGeral);
    FrmQRelPromocaoGeral.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
    case RdgTipo.ItemIndex of
     0: begin 
           case RdgTipo1.ItemIndex of
             0: FrmQRelPromocaoGeral.QRLTitulo.Caption:= 'Relatório de Produto Promocionais';
             1: FrmQRelPromocaoGeral.QRLTitulo.Caption:= 'Relatório de Produto Promocionais [Iniciando]';
             2: FrmQRelPromocaoGeral.QRLTitulo.Caption:= 'Relatório de Produto Promocionais [Terminando]';
           end;
           FrmQRelPromocaoGeral.QRGroup1.Enabled := false;
        end;
     1: begin 
           case RdgTipo1.ItemIndex of
             0: FrmQRelPromocaoGeral.QRLTitulo.Caption   := 'Relatório de Produto Promocionais agrupado por Seção';
             1: FrmQRelPromocaoGeral.QRLTitulo.Caption   := 'Relatório de Produto Promocionais agrupado por Seção [Iniciando]';
             2: FrmQRelPromocaoGeral.QRLTitulo.Caption   := 'Relatório de Produto Promocionais agrupado por Seção [Terminando]';
           end;
           FrmQRelPromocaoGeral.QRGroup1.Enabled    := true;
           FrmQRelPromocaoGeral.QRDBText3.DataField := 'COD_SEC';
           FrmQRelPromocaoGeral.QRDBText4.DataField := 'NOME_SEC';
           FrmQRelPromocaoGeral.QRGroup1.Expression := 'COD_SEC';
        end;
     2: begin 
           case RdgTipo1.ItemIndex of
            0: FrmQRelPromocaoGeral.QRLTitulo.Caption   := 'Relatório de Produto Promocionais agrupado por Fabricante';
            1: FrmQRelPromocaoGeral.QRLTitulo.Caption   := 'Relatório de Produto Promocionais agrupado por Fabricante [Iniciando]';
            2: FrmQRelPromocaoGeral.QRLTitulo.Caption   := 'Relatório de Produto Promocionais agrupado por Fabricante [Terminando]';
           end;
           FrmQRelPromocaoGeral.QRGroup1.Enabled    := true;
           FrmQRelPromocaoGeral.QRDBText3.DataField := 'COD_LAB';
           FrmQRelPromocaoGeral.QRDBText4.DataField := 'NOME_LAB';
           FrmQRelPromocaoGeral.QRGroup1.Expression := 'COD_LAB';
        end;
    end;

   if sender = btnvis then
      begin 
         FrmQRelPromocaoGeral.QRProd.PreviewInitialState:= wsMaximized;
         FrmQRelPromocaoGeral.QRProd.Preview;
      end
   else
      begin 
         FrmQRelPromocaoGeral.QRProd.PrinterSetup;
         FrmQRelPromocaoGeral.QRProd.Print;
      end;
   FrmQRelPromocaoGeral.QRProd.QRPrinter:= nil;
   dm.IBTransaction.Commit;
   QRelPromocao.Close;
end;

procedure TFrmRelPrecoPromocao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QRelPromocao.SQL.Clear;
   QRelPromocao.SQL.Text:= sAuxSqlProm;
   QRelPromocao.Close;
   Action:= caFree;
end;

procedure TFrmRelPrecoPromocao.QRelPromocaoCalcFields(DataSet: TDataSet);
begin 
   case QRelPromocaoTIPO_PROMOCAO.AsInteger of
     0: QRelPromocaoCALC_TIPO.AsString:= 'PANFLETO';
     1: QRelPromocaoCALC_TIPO.AsString:= 'DA CASA';
     2: QRelPromocaoCALC_TIPO.AsString:= 'VENCIMENTO';
   end;
end;

end.
