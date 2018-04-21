unit URelCusto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmRelCusto = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    ComboTipo: TComboBox;
    GB2: TGroupBox;
    EdtCodIni: UNovosComponentes.TEdit;
    BtnConsIni: TsSpeedButton;
    EdtNomeIni: TEdit;
    EdtCodFin: UNovosComponentes.TEdit;
    BtnConsFin: TsSpeedButton;
    EdtNomeFin: TEdit;
    rdg: TRadioGroup;
    QRelCusto: TFDQuery;
    QRelCustoPRECO_CUSTO: TBCDField;
    QRelCustoPRECO_CUSTO_MEDIO: TBCDField;
    QRelCustoCOD_PRO: TIntegerField;
    QRelCustoNOME_PRO: TStringField;
    QRelCustoCOD_SEC: TIntegerField;
    QRelCustoCOD_LAB: TIntegerField;
    QRelCustoNOME_SEC: TStringField;
    QRelCustoNOME_LAB: TStringField;
    procedure ComboTipoChange(Sender: TObject);
    procedure EdtCodIniKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodIniKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodFinKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodIniExit(Sender: TObject);
    procedure EdtCodFinExit(Sender: TObject);
    procedure BtnConsIniClick(Sender: TObject);
    procedure BtnConsFinClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnVisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelCusto: TFrmRelCusto;

implementation
uses
  Udm, Ubibli1, UConsLab, UConsSecao, UQRelCusto, UNovoPrincipal;

{$R *.dfm}

procedure TFrmRelCusto.ComboTipoChange(Sender: TObject);
begin 
   case ComboTipo.ItemIndex of
     0: begin 
           gb2.Caption:= '';
           edtcodini.Clear;
           edtcodfin.Clear;
           edtnomeini.Clear;
           edtnomefin.Clear;
           gb2.Enabled:= false;
        end;
     1: begin 
           gb2.Enabled:= true;
           gb2.Caption:= 'Fabricante Inicial/Final';
           edtcodini.Clear;
           edtcodfin.Clear;
           edtnomeini.Clear;
           edtnomefin.Clear;
           edtcodini.SetFocus;
        end;
     2: begin 
           gb2.Enabled:= true;
           gb2.Caption:= 'Seção Inicial/Final';
           edtcodini.Clear;
           edtcodfin.Clear;
           edtnomeini.Clear;
           edtnomefin.Clear;
           edtcodini.SetFocus;
        end;
   end;
end;

procedure TFrmRelCusto.EdtCodIniKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmRelCusto.EdtCodIniKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsIni.Click;
end;

procedure TFrmRelCusto.EdtCodFinKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsFin.Click;
end;

procedure TFrmRelCusto.EdtCodIniExit(Sender: TObject);
begin 
   if btnsair.Focused then
      exit;
   if ComboTipo.ItemIndex = 1 then //fabricante
      begin 
         edtnomeini.Text:= Consulta('laboratorio', edtcodini, 'cod_lab', 'nome_lab', dm.IBTransaction, dm.qConsulta);
         if edtnomeini.Text = '' then
            begin 
               AlertaCad('Fabricante não Cadastrado');
//               edtcodini.SetFocus;
               edtcodini.SelectAll;
            end;
      end
   else
      if ComboTipo.ItemIndex = 2 then //secao
         begin 
            edtnomeini.Text:= Consulta('secao', edtcodini, 'cod_sec', 'nome_sec', dm.IBTransaction, dm.qConsulta);
            if edtnomeini.Text = '' then
               begin 
                  AlertaCad('Seção não Cadastrada');
//                  edtcodini.SetFocus;
                  edtcodini.SelectAll;
               end;
         end;
end;

procedure TFrmRelCusto.EdtCodFinExit(Sender: TObject);
begin 
   if btnsair.Focused then
      exit;
   if ComboTipo.ItemIndex = 1 then //fabricante
      begin 
         edtnomefin.Text:= Consulta('laboratorio', edtcodfin, 'cod_lab', 'nome_lab', dm.IBTransaction, dm.qConsulta);
         if edtnomefin.Text = '' then
            begin 
               AlertaCad('Fabricante não Cadastrado');
//               edtcodfin.SetFocus;
               edtcodfin.SelectAll;
            end;
      end
   else
      if ComboTipo.ItemIndex = 2 then //secao
         begin 
            edtnomefin.Text:= Consulta('secao', edtcodfin, 'cod_sec', 'nome_sec', dm.IBTransaction, dm.qConsulta);
            if edtnomefin.Text = '' then
               begin 
                  AlertaCad('Seção não Cadastrada');
//                  edtcodfin.SetFocus;
                  edtcodfin.SelectAll;
               end;
         end;
end;

procedure TFrmRelCusto.BtnConsIniClick(Sender: TObject);
begin 
   if ComboTipo.ItemIndex = 1 then
      begin 
         Application.CreateForm(TFrmConsLab, FrmConsLab);
         FrmConsLab.Tag:= 6;
         FrmConsLab.ShowModal;
      end
   else
      if ComboTipo.ItemIndex = 2 then
         begin 
            Application.CreateForm(TFrmConsSecao, FrmConsSecao);
            FrmConsSecao.Tag:= 6;
            FrmConsSecao.ShowModal;
         end;
end;

procedure TFrmRelCusto.BtnConsFinClick(Sender: TObject);
begin 
   if ComboTipo.ItemIndex = 1 then
      begin 
         Application.CreateForm(TFrmConsLab, FrmConsLab);
         FrmConsLab.Tag:= 7;
         FrmConsLab.ShowModal;
      end
   else
      if ComboTipo.ItemIndex = 2 then
         begin 
            Application.CreateForm(TFrmConsSecao, FrmConsSecao);
            FrmConsSecao.Tag:= 7;
            FrmConsSecao.ShowModal;
         end;
end;

procedure TFrmRelCusto.FormShow(Sender: TObject);
begin 
   ComboTipo.ItemIndex:= 0;
   ComboTipoChange(combotipo);
   rdg.ItemIndex:= 1;
end;

procedure TFrmRelCusto.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelCusto.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmRelCusto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRelCusto.BtnVisClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRelCusto do
      begin 
         close;
         sql.Clear;
         sql.Add('SELECT C.PRECO_CUSTO, C.PRECO_CUSTO_MEDIO, C.COD_PRO, P.NOME_PRO, ' +
                 'P.COD_SEC, P.COD_LAB, S.NOME_SEC, L.NOME_LAB ' +
                 'FROM CUSTOS C ' +
                 'INNER JOIN PRODUTO P ' +
                 'ON (C.COD_PRO = P.COD_PRO) ' +
                 'INNER JOIN SECAO S ' +
                 'ON (P.COD_SEC = S.COD_SEC) ' +
                 'INNER JOIN LABORATORIO L ' +
                 'ON (P.COD_LAB = L.COD_LAB)');
         if ComboTipo.ItemIndex = 1 then //fabricante
            begin 
               sql.Add(' WHERE C.COD_EMP = :CODEMP AND P.COD_LAB BETWEEN :CODINI AND :CODFIN');
               if rdg.ItemIndex = 0 then
                     sql.Add(' ORDER BY P.COD_LAB, P.COD_PRO')
                  else
                     sql.Add(' ORDER BY P.COD_LAB, P.NOME_PRO');
               Parambyname('codini').AsInteger := strtoint(edtcodini.Text);
               Parambyname('codfin').AsInteger := strtoint(edtcodfin.Text);
               Parambyname('codemp').AsInteger := iEmp;
            end
         else
            if ComboTipo.ItemIndex = 2 then //secao
               begin 
                  sql.Add(' WHERE C.COD_EMP = :CODEMP AND P.COD_SEC BETWEEN :CODINI AND :CODFIN');
                  if rdg.ItemIndex = 0 then
                     sql.Add(' ORDER BY P.COD_SEC, P.COD_PRO')
                  else
                     sql.Add(' ORDER BY P.COD_SEC, P.NOME_PRO');
                  Parambyname('codini').AsInteger := strtoint(edtcodini.Text);
                  Parambyname('codfin').AsInteger := strtoint(edtcodfin.Text);
                  Parambyname('codemp').AsInteger := iEmp;
               end
            else
               begin 
                  if rdg.ItemIndex = 0 then
                     sql.Add(' WHERE C.COD_EMP = :CODEMP ORDER BY P.COD_PRO')
                  else
                     sql.Add(' WHERE C.COD_EMP = :CODEMP ORDER BY P.NOME_PRO');
                  Parambyname('codemp').AsInteger:= iEmp;
               end;
         open;
      end;
   Application.CreateForm(TFrmQRelCusto, FrmQRelCusto);
   FrmQRelCusto.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
   if ComboTipo.ItemIndex = 1 then //fabricante
      begin 
         FrmQRelCusto.QRGroup1.Enabled:= true;
         FrmQRelCusto.QRDBText9.DataField  := 'COD_LAB';
         FrmQRelCusto.QRDBText10.DataField := 'NOME_LAB';
         FrmQRelCusto.QRGroup1.Expression  := 'COD_LAB';
      end
   else
      if ComboTipo.ItemIndex = 2 then //secao
         begin 
            FrmQRelCusto.QRGroup1.Enabled     := true;
            FrmQRelCusto.QRDBText9.DataField  := 'COD_SEC';
            FrmQRelCusto.QRDBText10.DataField := 'NOME_SEC';
            FrmQRelCusto.QRGroup1.Expression  := 'COD_SEC';
         end
      else
         begin 
            FrmQRelCusto.QRGroup1.Enabled:= false;
         end;
   if sender = btnvis then
      begin 
         FrmQRelCusto.QRProd.PreviewInitialState:= wsMaximized;
         FrmQRelCusto.QRProd.Preview;
      end
   else
      begin 
         FrmQRelCusto.QRProd.PrinterSetup;
         FrmQRelCusto.QRProd.Print;
      end;
   FrmQRelCusto.QRProd.QRPrinter:= nil;
   dm.IBTransaction.Commit;
   QRelCusto.Close;
end;

procedure TFrmRelCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

end.
