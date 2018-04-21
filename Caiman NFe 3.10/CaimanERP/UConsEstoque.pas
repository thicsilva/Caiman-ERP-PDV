unit UConsEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, Grids, DBGrids, StdCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmConsEstoque = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    ComboCons: TComboBox;
    GB3: TGroupBox;
    EdtCod: TEdit;
    BtnOk: TButton;
    BtnSair: TButton;
    DBGrid1: TDBGrid;
    QConsEstoque: TFDQuery;
    DSQConsEstoque: TDataSource;
    CheckEmp: TCheckBox;
    QConsEstoqueCOD_PRO: TIntegerField;
    QConsEstoqueNOME_PRO: TStringField;
    QConsEstoqueVALOR_PRO: TBCDField;
    QConsEstoquePROMOCAO_PRO: TBCDField;
    IBTREstoque: TFDTransaction;
    QConsEstoqueESTOQUE: TBCDField;
    procedure ComboConsChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridCorTamEnter(Sender: TObject);
    procedure DBGridCorTamExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsEstoque: TFrmConsEstoque;

implementation
uses
  Udm, Ubibli1, UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsEstoque.ComboConsChange(Sender: TObject);
begin 
   case ComboCons.ItemIndex of
    0: gb3.Caption  := 'Código';
    1: gb3.Caption  := 'Nome';
    2: gb3.Caption  := 'Referência';
   end;
  edtcod.Clear;
  edtcod.SetFocus;
end;

procedure TFrmConsEstoque.FormShow(Sender: TObject);
begin 
   {busca a posicao do combo}
   try
     ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsEstoque.ComboCons'));
   except
     ComboCons.ItemIndex:= 0;
   end;

   ComboConsChange(sender);
end;

procedure TFrmConsEstoque.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsEstoque.BtnOkClick(Sender: TObject);
begin 
   if IBTREstoque.Active then
      IBTREstoque.Commit;
   IBTREstoque.StartTransaction;
   with QConsEstoque do
      begin 
         close;
         sql.Clear;
         sql.Add('SELECT SUM(E.ESTOQUE) ESTOQUE, P.COD_PRO, P.NOME_PRO, ' +
                 'P.VALOR_PRO, P.PROMOCAO_PRO ' +
                 'FROM ESTOQUE E ' +
                 'INNER JOIN PRODUTO P ' +
                 'ON (E.COD_PRO = P.COD_PRO)');
         case combocons.ItemIndex of
          0:begin 
               if edtcod.Text = '' then
                  begin 
                     if (not CheckEmp.Checked) then
                        begin 
                           sql.Add(' WHERE E.COD_EMP = :CODEMP');
                           Parambyname('codemp').AsInteger:= iEmp;
                        end;
                  end
               else
                  begin 
                     sql.Add(' WHERE P.COD_PRO = :CODPRO');
                     if (not CheckEmp.Checked) then
                        begin 
                           sql.Add(' AND E.COD_EMP = :CODEMP');
                           Parambyname('codemp').AsInteger:= iEmp;
                        end;
                     Parambyname('codpro').AsInteger:= StrToInt(EdtCod.text);
                  end;
            end;
          1:begin 
               sql.Add(' WHERE P.NOME_PRO LIKE ' + #39 + edtcod.Text + '%' + #39);
               if (not CheckEmp.Checked) then
                  begin 
                     sql.Add(' AND E.COD_EMP = :CODEMP');
                     Parambyname('codemp').AsInteger:= iEmp;
                  end;
            end;
          2:begin 
               sql.Add(' WHERE P.NOME_PRO LIKE ' + #39 + '%' + edtcod.Text + '%' + #39);
               if (not CheckEmp.Checked) then
                  begin 
                     sql.Add(' AND E.COD_EMP = :CODEMP');
                     Parambyname('codemp').AsInteger:= iEmp;
                  end;
            end;
          3:begin 
               sql.Add(' WHERE P.REFERENCIA_PRO = ' + #39 + edtcod.Text + #39);
               if (not CheckEmp.Checked) then
                  begin 
                     sql.Add(' AND E.COD_EMP = :CODEMP');
                     Parambyname('codemp').AsInteger:= iEmp;
                  end;
            end;
         end;
         sql.add(' GROUP BY P.COD_PRO, P.NOME_PRO, P.VALOR_PRO, P.PROMOCAO_PRO');
         case ComboCons.ItemIndex of
           0: sql.add(' ORDER BY P.COD_PRO');
           1: sql.add(' ORDER BY P.NOME_PRO');
           2: sql.add(' ORDER BY P.REFERENCIA_PRO');
         end;
         open;
      end;
end;

procedure TFrmConsEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   {grava a posicao do combo}
   dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsEstoque.ComboCons', inttostr(ComboCons.itemIndex));

   if IBTREstoque.Active then
      IBTREstoque.Commit;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QConsEstoque.Close;
   Action:= caFree;
end;

procedure TFrmConsEstoque.FormCreate(Sender: TObject);
begin 
   
end;

procedure TFrmConsEstoque.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsEstoque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      btnsair.Click;
end;

procedure TFrmConsEstoque.EdtCodKeyPress(Sender: TObject; var Key: Char);
begin 
   if combocons.ItemIndex = 0 then
      begin 
         if not (key in ['0'..'9', #13, #8]) then
            key:= #0;
      end;
end;

procedure TFrmConsEstoque.DBGridCorTamEnter(Sender: TObject);
begin 
   FrmConsEstoque.KeyPreview:= false;
end;

procedure TFrmConsEstoque.DBGridCorTamExit(Sender: TObject);
begin 
   FrmConsEstoque.KeyPreview:= true;
end;

end.
