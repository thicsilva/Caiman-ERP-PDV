unit URelProdutosVendidos;

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
  TFrmRelProdutosVendidos = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    QRelProdVend: TFDQuery;
    CheckEmp: TCheckBox;
    GB: TGroupBox;
    CheckTipo: TCheckBox;
    EdtCod: UNovosComponentes.TEdit;
    BtnCons: TsSpeedButton;
    EdtNome: TEdit;
    RdgTipo: TRadioGroup;
    GroupBox1: TGroupBox;
    Operador: TComboBox;
    todosop: TCheckBox;
    QRelProdVendQUANT: TBCDField;
    QRelProdVendTOTAL: TFMTBCDField;
    QRelProdVendCOD_PRO: TIntegerField;
    QRelProdVendNOME_PRO: TStringField;
    QRelProdVendCOD_SEC: TIntegerField;
    QRelProdVendCOD_LAB: TIntegerField;
    QRelProdVendNOME_SEC: TStringField;
    QRelProdVendNOME_LAB: TStringField;
    QRelProdVendDESCRICAO: TStringField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnVisClick(Sender: TObject);
    procedure CheckTipoClick(Sender: TObject);
    procedure BtnConsClick(Sender: TObject);
    procedure EdtCodEnter(Sender: TObject);
    procedure EdtCodExit(Sender: TObject);
    procedure EdtCodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RdgTipoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure todosopClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelProdutosVendidos: TFrmRelProdutosVendidos;

implementation
uses
  Udm, UQRelProdutosVendidos, UNovoPrincipal, UConsSecao, Ubibli1, UConsLab;
var sSql : string;

{$R *.dfm}

procedure TFrmRelProdutosVendidos.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelProdutosVendidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmRelProdutosVendidos.FormCreate(Sender: TObject);
begin 
   
      if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   Operador.Clear;
   with dm.QConsulta do
      begin 
         sql.Clear;
         sql.Add('SELECT * FROM USUARIO;');
         open;
         First;
         while not eof do
           begin 
              Operador.Items.Add(FormataStringD(fieldbyname('cod_usu').AsString, '2', '0') + ' - ' +
                                   fieldbyname('nome_usu').AsString);
              next;
           end;
      end;
   dm.IBTransaction.Commit;
   dm.QConsulta.Close;

end;

procedure TFrmRelProdutosVendidos.FormShow(Sender: TObject);
begin 
   sSql:= QRelProdVend.sql.Text;
   RdgTipo.ItemIndex:= 0;
   edtdataini.Date:= date;
   edtdatafin.Date:= date;
   CheckTipo.Checked:= true;
   TodosOp.Checked := true;
   CheckTipoClick(self);
   edtdataini.SetFocus;
end;

procedure TFrmRelProdutosVendidos.BtnVisClick(Sender: TObject);
begin 
   if edtdatafin.Date < edtdataini.Date then
      begin 
         AlertaCad('A data final não pode ser menor que a data inicial');
         exit;
      end;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRelProdVend do
      begin 
         close;
         sql.Clear;
         sql.Text:= sSql;
         sql.Add(' WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                 ' AND I.CANCELADO = 0 AND I.VENDA_CANCELADA = 0 ');
         if not CheckTipo.Checked then
            begin 
               if RdgTipo.ItemIndex = 0 then
                  sql.add(' AND P.COD_SEC = :COD')
               else
                  sql.add(' AND P.COD_LAB = :COD');
               Parambyname('cod').AsInteger:= strtoint(edtcod.Text);
            end;

         if (not CheckEmp.Checked) then
            begin 
               sql.Add(' AND V.COD_EMP = :CODEMP');
               Parambyname('codemp').AsInteger:= iEmp;
            end;

         if Operador.ItemIndex > -1  then
              sql.Add(' AND V.COD_USU =' + copy(Operador.Text, 1, 2));


         sql.Add(' GROUP BY I.COD_PRO, P.NOME_PRO, P.COD_SEC, P.COD_LAB, ' +
                 ' S.NOME_SEC, L.NOME_LAB, U.DESCRICAO');

         if RdgTipo.ItemIndex = 0 then
            sql.add(' ORDER BY P.COD_SEC, 1 DESC')
         else
            sql.add(' ORDER BY P.COD_LAB, 1 DESC');
         Parambyname('dataini').AsDate:= edtdataini.Date;
         Parambyname('datafin').AsDate:= edtdatafin.Date;
         open;

         Application.CreateForm(TFrmQRelProdutosVendidos, FrmQRelProdutosVendidos);
         FrmQRelProdutosVendidos.QRLNomeEmpresa.Caption := frmmenu.SB.Panels[3].Text;
         if Operador.ItemIndex > -1 then
            FrmQRelProdutosVendidos.QRLTitulo.Caption      := 'Relatório de Produtos Vendidos no período: ' + datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date) + '    Operador = ' + Operador.Text
         else
            FrmQRelProdutosVendidos.QRLTitulo.Caption      := 'Relatório de Produtos Vendidos no período: ' + datetostr(edtdataini.Date) + ' a ' + datetostr(edtdatafin.Date) + '    Operador = TODOS';
         if RdgTipo.ItemIndex = 0 then
            begin 
               FrmQRelProdutosVendidos.QRGroup1.Expression:= 'COD_SEC';
               FrmQRelProdutosVendidos.QRDBText6.DataField:= 'COD_SEC';
               FrmQRelProdutosVendidos.QRDBText7.DataField:= 'NOME_SEC';
            end
         else
            begin 
               FrmQRelProdutosVendidos.QRGroup1.Expression:= 'COD_LAB';
               FrmQRelProdutosVendidos.QRDBText6.DataField:= 'COD_LAB';
               FrmQRelProdutosVendidos.QRDBText7.DataField:= 'NOME_LAB';
            end;
         if sender = btnvis then
            begin 
               FrmQRelProdutosVendidos.QRProd.PreviewInitialState:= wsMaximized;
               FrmQRelProdutosVendidos.QRProd.Preview;
            end
         else
            begin 
               FrmQRelProdutosVendidos.QRProd.PrinterSetup;
               FrmQRelProdutosVendidos.QRProd.Print;
            end;
         FrmQRelProdutosVendidos.QRProd.QRPrinter:= nil;
      end;
   dm.IBTransaction.Commit;
   QRelProdVend.SQL.Clear;
   QRelProdVend.SQL.Text:= sSql;
   QRelProdVend.close;
end;

procedure TFrmRelProdutosVendidos.CheckTipoClick(Sender: TObject);
begin 
   CheckTipo.SetFocus;
   edtcod.Clear;
   edtnome.Clear;
   if CheckTipo.Checked then
      begin 
         GB.Enabled:= false;
      end
   else
      begin 
         GB.Enabled:= true;
         edtcod.SetFocus;
      end;
end;

procedure TFrmRelProdutosVendidos.BtnConsClick(Sender: TObject);
begin 
   if RdgTipo.ItemIndex = 0 then
      begin 
         Application.CreateForm(TFrmConsSecao, FrmConsSecao);
         FrmConsSecao.Tag:= 9;
         FrmConsSecao.ShowModal;
      end
   else
      begin 
         Application.CreateForm(TFrmConsLab, FrmConsLab);
         FrmConsLab.Tag:= 10;
         FrmConsLab.ShowModal;
      end;
end;

procedure TFrmRelProdutosVendidos.EdtCodEnter(Sender: TObject);
begin 
   edtcod.SelectAll;
end;

procedure TFrmRelProdutosVendidos.EdtCodExit(Sender: TObject);
begin 
   if CheckTipo.Focused then
      exit;
   if RdgTipo.ItemIndex = 0 then
      begin 
         EdtNome.Text:= Consulta('secao', edtcod, 'cod_sec', 'nome_sec', dm.IBTransaction, dm.qConsulta);
         if edtnome.Text = '' then
            begin 
               AlertaCad('Seção não Cadastrada');
//               EdtCod.SetFocus;
            end;
      end
   else
      begin 
         EdtNome.Text:= Consulta('laboratorio', edtcod, 'cod_lab', 'nome_lab', dm.IBTransaction, dm.qConsulta);
         if EdtNome.Text = '' then
            begin 
               AlertaCad('Fabricante não Cadastrado');
//               EdtCod.SetFocus;
            end;
      end;
end;

procedure TFrmRelProdutosVendidos.EdtCodKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      btncons.Click;
end;

procedure TFrmRelProdutosVendidos.EdtCodKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key := #0;
end;

procedure TFrmRelProdutosVendidos.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRelProdutosVendidos.RdgTipoClick(Sender: TObject);
begin 
   if RdgTipo.ItemIndex = 0 then
      begin 
         gb.Caption:= 'Seção';
         CheckTipo.Caption:= 'Todas as Seções';
      end
   else
      begin 
         gb.Caption:= 'Fabricante';
         CheckTipo.Caption:= 'Todos os Fabricantes';
      end;
end;

procedure TFrmRelProdutosVendidos.todosopClick(Sender: TObject);
begin 
   if TodosOp.Checked then
      begin 
         Operador.ItemIndex:= -1;
      end
   else
      begin 
         Operador.ItemIndex:= 0;
         Operador.SetFocus;
      end;
end;

end.
