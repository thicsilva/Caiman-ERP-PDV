unit URelProdGRP;

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
  TFrmRelProdGRP = class(UNovoFormulario.TForm)
    Panel2: TPanel;
    Rdg: TRadioGroup;
    Panel1: TPanel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    GB1: TGroupBox;
    EdtCod: UNovosComponentes.TEdit;
    BtnCons: TsSpeedButton;
    EdtNome: TEdit;
    CheckGRP: TCheckBox;
    StatusBar1: TStatusBar;
    QRel: TFDQuery;
    RDGTipo: TRadioGroup;
    QRelCOD_PRO: TIntegerField;
    QRelNOME_PRO: TStringField;
    QRelNOME_GRP: TStringField;
    procedure CheckGRPClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnConsClick(Sender: TObject);
    procedure EdtCodEnter(Sender: TObject);
    procedure EdtCodExit(Sender: TObject);
    procedure EdtCodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodKeyPress(Sender: TObject; var Key: Char);
    procedure BtnVisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelProdGRP: TFrmRelProdGRP;

implementation
uses
  Udm, Ubibli1, UConsGRP, UQRelProdGRP, UNovoPrincipal;

{$R *.dfm}

procedure TFrmRelProdGRP.CheckGRPClick(Sender: TObject);
begin 
   if CheckGRP.Checked = true then
      begin 
         gb1.Enabled:= true;
         edtcod.Clear;
         edtnome.Clear;
         gb1.Enabled:= false;
      end
   else
      begin 
         gb1.Enabled:= true;
         edtcod.Clear;
         edtnome.Clear;
         edtcod.SetFocus;
      end;
end;

procedure TFrmRelProdGRP.FormShow(Sender: TObject);
begin 
   CheckGRP.Checked:= true;
   CheckGRPClick(self);
   RDGTipo.ItemIndex := 0;
   rdg.ItemIndex     := 0;
   btnvis.SetFocus;
end;

procedure TFrmRelProdGRP.BtnConsClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsGRP, FrmConsGRP);
   FrmConsGRP.tag:= 2;
   FrmConsGRP.showmodal;
end;

procedure TFrmRelProdGRP.EdtCodEnter(Sender: TObject);
begin 
   EdtCod.SelectAll;
end;

procedure TFrmRelProdGRP.EdtCodExit(Sender: TObject);
begin 
   if (btnsair.Focused) or (CheckGRP.Focused) then
      exit;
   edtnome.Text:= Consulta('grupo_icms', edtcod, 'cod_grp', 'nome_grp', dm.IBTransaction, dm.qConsulta);
   if edtnome.Text = '' then
      begin 
         AlertaCad('Grupo de ICMS não cadastrado');
//         EdtCod.SetFocus;
      end;
end;

procedure TFrmRelProdGRP.EdtCodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRelProdGRP.EdtCodKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmRelProdGRP.BtnVisClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRel do
      begin 
         close;
         UnPrepare;
         sql.Clear;
         sql.add('SELECT P.COD_PRO, P.NOME_PRO, G.NOME_GRP ' +
                 'FROM PRODUTO P ' +
                 'INNER JOIN GRUPO_ICMS G');
         if not CheckGRP.Checked then
            begin 
               case RDGTipo.ItemIndex of
                 0: sql.add(' ON (P.ICMS_CF_EST = G.COD_GRP)' +
                            ' WHERE P.ICMS_CF_EST = :CODGRP');
                 1: sql.add(' ON (P.ICMS_CF_FORA = G.COD_GRP)' +
                            ' WHERE P.ICMS_CF_FORA = :CODGRP');
                 2: sql.add(' ON (P.ICMS_CONT_EST = G.COD_GRP)' +
                            ' WHERE P.ICMS_CONT_EST = :CODGRP');
                 3: sql.add(' ON (P.ICMS_CONT_FORA = G.COD_GRP)' +
                            ' WHERE P.ICMS_CONT_FORA = :CODGRP');
               end;
                 Parambyname('codgrp').asinteger := strtoint(edtcod.Text);
            end
         else
            begin 
               case RDGTipo.ItemIndex of
                 0: sql.add(' ON (P.ICMS_CF_EST = G.COD_GRP)');
                 1: sql.add(' ON (P.ICMS_CF_FORA = G.COD_GRP)');
                 2: sql.add(' ON (P.ICMS_CONT_EST = G.COD_GRP)');
                 3: sql.add(' ON (P.ICMS_CONT_FORA = G.COD_GRP)');
               end;
            end;
         if rdg.ItemIndex = 0 then
            sql.add(' ORDER BY P.COD_PRO')
         else
            sql.add(' ORDER BY P.NOME_PRO');
         Prepare;
         open;

         Application.CreateForm(TFrmQRelProdGRP, FrmQRelProdGRP);
         FrmQRelProdGRP.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
         if not CheckGRP.Checked then
            FrmQRelProdGRP.QRLGRP.Caption:= 'Grupo de ICMS = ' + EdtNome.Text
         else
            FrmQRelProdGRP.QRLGRP.Caption:= 'Grupo de ICMS = TODOS';
         case RDGTipo.ItemIndex of
            0: FrmQRelProdGRP.QRLTipo.Caption:= 'Tipo = PF no Estado';
            1: FrmQRelProdGRP.QRLTipo.Caption:= 'Tipo = PF fora do Estado';
            2: FrmQRelProdGRP.QRLTipo.Caption:= 'Tipo = PJ no Estado';
            3: FrmQRelProdGRP.QRLTipo.Caption:= 'Tipo = PJ fora do Estado';
         end;

         if sender = btnvis then
            begin 
               FrmQRelProdGRP.QRProd.PreviewInitialState:= wsMaximized;
               FrmQRelProdGRP.QRProd.Preview;
            end
         else
            begin 
               FrmQRelProdGRP.QRProd.PrinterSetup;
               FrmQRelProdGRP.QRProd.Print;
            end;
         FrmQRelProdGRP.QRProd.QRPrinter:= nil;
      end;
end;

procedure TFrmRelProdGRP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QRel.Close;
   qrel.UnPrepare;
   Action:= caFree;
end;

procedure TFrmRelProdGRP.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelProdGRP.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.
