unit UUltimaCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, Buttons, StdCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmUltimaCompra = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    GroupBox7: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    LDataEmissao: TLabel;
    LFornec: TLabel;
    LNF: TLabel;
    LQuantCompra: TLabel;
    LUnitCompra: TLabel;
    LFrete: TLabel;
    LICMS: TLabel;
    LIPI: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    LVlDesconto: TLabel;
    LVlAcrescimo: TLabel;
    Label58: TLabel;
    LDataEntrada: TLabel;
    Label68: TLabel;
    LVlSubTrib: TLabel;
    Label69: TLabel;
    LEmpresa: TLabel;
    GroupBox8: TGroupBox;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    LDataVenda: TLabel;
    LCliente: TLabel;
    LQuantVenda: TLabel;
    LUnitVenda: TLabel;
    GroupBox9: TGroupBox;
    BtnPrimeiro: TsSpeedButton;
    BtnAnterior: TsSpeedButton;
    BtnProximo: TsSpeedButton;
    BtnUltimo: TsSpeedButton;
    EdtCodPro: UNovosComponentes.TEdit;
    EdtNomePro: TEdit;
    QCompras: TFDQuery;
    QUltimaVenda: TFDQuery;
    Label49: TLabel;
    Label90: TLabel;
    LCOO: TLabel;
    LNFSaida: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUltimaCompra: TFrmUltimaCompra;

implementation
uses
  Udm, UNovoPrincipal;
var sSqlCompras : string;

{$R *.dfm}

procedure TFrmUltimaCompra.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmUltimaCompra.FormShow(Sender: TObject);
var iCodigoVenda : integer;
begin 
   iCodigoVenda:= 0;
   sSqlCompras:= QCompras.sql.Text;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.Text:= 'SELECT MAX(COD_VEN) CODVENDA ' +
                        'FROM ITENS_VENDA ' +
                        'WHERE COD_PRO = :CODPRO AND COD_EMP = :CODEMP ' +
                        'AND CANCELADO = 0 AND VENDA_CANCELADA = 0';
             Parambyname('codpro').AsInteger:= strtoint(EdtCodpro.text);;
             Parambyname('codemp').AsInteger:= iEmp;
             Open;
             iCodigoVenda:= fieldbyname('codvenda').AsInteger;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar o código da última venda');
     end;
   finally
     dm.QConsulta.Close;
   end;

   if iCodigoVenda > 0 then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         try
           try
             with QUltimaVenda do
                begin 
                   close;
                   Parambyname('codven').AsInteger:= iCodigoVenda;
                   Parambyname('codpro').AsInteger:= strtoint(EdtCodPro.text);
                   Parambyname('codemp').AsInteger:= iEmp;
                   open;

                   LDataVenda.Caption := FieldByName('data_ven').AsString;
                   LCliente.Caption   := FieldByName('nome_cli').AsString;
                   LQuantVenda.Caption:= FieldByName('quant').AsString;
                   LUnitVenda.Caption := CurrToStrF(FieldByName('valor').AsCurrency, ffNumber, 2);
                   if fieldbyname('cupom_fiscal_ven').AsInteger > 0 then
                      LCOO.Caption    := fieldbyname('cupom_fiscal_ven').AsString
                   else
                      LCOO.Caption    := '';

                   if fieldbyname('numero_nota_fiscal').AsInteger > 0 then
                      LNFSaida.Caption:= fieldbyname('numero_nota_fiscal').AsString
                   else
                      LNFSaida.Caption:= '';
                end;
             dm.IBTransaction.Commit;
           except
             dm.IBTransaction.Rollback;
           end;
         finally
           QUltimaVenda.Close;
         end;
      end
   else
      begin 
         LDataVenda.Caption  := '';
         LCliente.Caption    := '';
         LQuantVenda.Caption := '';
         LUnitVenda.Caption  := '';
         LCOO.Caption:= '';
         LNFSaida.Caption:= '';
      end;

   { compras }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QCompras do
        begin 
           close;
           sql.Clear;

           sql.Text:= sSqlCompras;
           sql.Add(' AND I.COD_EMP = :CODEMP');
           sql.add(' ORDER BY DATAENT_ENT');

           Parambyname('codemp').AsInteger:= iEmp;
           Parambyname('codpro').AsInteger:= strtoint(EdtCodPro.Text);
           open;
           if recordcount > 0 then
              BtnUltimo.Click
           else
              begin 
                 QCompras.Close;
                 dm.IBTransaction.Commit;

                 BtnPrimeiro.Enabled  := false;
                 BtnProximo.Enabled   := false;
                 BtnAnterior.Enabled  := false;
                 BtnUltimo.Enabled    := false;

                 LEmpresa.Caption     := '';
                 LDataEmissao.Caption := '';
                 LDataEntrada.Caption := '';
                 LFornec.Caption      := '';
                 LNF.Caption          := '';
                 LQuantCompra.Caption := '';
                 LUnitCompra.Caption  := '';
                 LFrete.Caption       := '';
                 LVlDesconto.Caption  := '';
                 LVlAcrescimo.Caption := '';
                 LVlSubTrib.Caption   := '';
                 LICMS.Caption        := '';
                 LIPI.Caption         := '';
              end;
        end;

end;

procedure TFrmUltimaCompra.BtnPrimeiroClick(Sender: TObject);
var cTaxaFrete, cTaxaSubTrib, cTaxaAcres, cTaxaDesc : currency;
begin 
   cTaxaFrete   := 0;
   cTaxaSubTrib := 0;
   cTaxaAcres   := 0;
   cTaxaDesc    := 0;

   if sender = BtnPrimeiro then
      QCompras.First
   else
      if sender = BtnAnterior then
         QCompras.Prior
      else
         if sender = BtnProximo then
            QCompras.Next
         else
            if sender  = BtnUltimo then
               QCompras.Last;

   if (QCompras.fieldbyname('frete_incluso').AsString = 'S') and (QCompras.fieldbyname('frete_ent').AsCurrency > 0) then
      cTaxaFrete:= (QCompras.fieldbyname('frete_ent').AsCurrency * 100) / QCompras.fieldbyname('total_ent').AsCurrency
   else
      cTaxaFrete:= 0;
   if (QCompras.fieldbyname('icms_sub_incluso').AsString = 'S') and (QCompras.fieldbyname('valor_icms_sub').AsCurrency > 0) then
      cTaxaSubTrib:= (QCompras.fieldbyname('valor_icms_sub').AsCurrency * 100) / (QCompras.fieldbyname('total_ent').AsCurrency - QCompras.fieldbyname('valor_icms_sub').AsCurrency - QCompras.fieldbyname('acres_ent').AsCurrency + QCompras.fieldbyname('desc_ent').AsCurrency)
   else
      cTaxaSubTrib:= 0;
   if QCompras.fieldbyname('acres_ent').AsCurrency > 0 then
      cTaxaAcres:= (QCompras.fieldbyname('acres_ent').AsCurrency * 100) / (QCompras.fieldbyname('total_ent').AsCurrency - QCompras.fieldbyname('valor_icms_sub').AsCurrency - QCompras.fieldbyname('acres_ent').AsCurrency + QCompras.fieldbyname('desc_ent').AsCurrency)
   else
      cTaxaAcres:= 0;
   if QCompras.fieldbyname('desc_ent').AsCurrency > 0 then
      cTaxaDesc:= (QCompras.fieldbyname('desc_ent').AsCurrency * 100) / (QCompras.fieldbyname('total_ent').AsCurrency - QCompras.fieldbyname('valor_icms_sub').AsCurrency - QCompras.fieldbyname('acres_ent').AsCurrency + QCompras.fieldbyname('desc_ent').AsCurrency)
   else
      cTaxaDesc:= 0;

   LEmpresa.Caption      := QCompras.fieldbyname('razao_emp').AsString;
   LDataEmissao.Caption  := QCompras.FieldByName('dataemi_ent').AsString;
   LDataEntrada.Caption  := QCompras.FieldByName('dataent_ent').AsString;
   LFornec.Caption       := QCompras.FieldByName('razao_for').AsString;
   LNF.Caption           := QCompras.FieldByName('numnf_ent').AsString;
   LQuantCompra.Caption  := QCompras.FieldByName('qtd_pro').AsString;
   LUnitCompra.Caption   := currtostrf(QCompras.FieldByName('valor_unit_pro').AsCurrency, ffnumber, 2);
   LFrete.Caption        := currtostrf((QCompras.fieldbyname('valor_unit_pro').AsCurrency * cTaxaFrete) / 100, ffnumber, 2);
   LVlDesconto.Caption   := currtostrf(QCompras.fieldbyname('valor_desconto').AsCurrency +
                                                      ((QCompras.fieldbyname('valor_unit_pro').AsCurrency * cTaxaDesc) / 100), ffnumber, 2);
   LVlAcrescimo.Caption  := currtostrf(QCompras.fieldbyname('valor_acrescimo').AsCurrency +
                                                      ((QCompras.fieldbyname('valor_unit_pro').AsCurrency * cTaxaAcres) / 100), ffnumber, 2);
   LVlSubTrib.Caption    := currtostrf((QCompras.fieldbyname('valor_unit_pro').AsCurrency * cTaxaSubTrib) / 100, ffnumber, 2);
   LICMS.Caption         := currtostrf(QCompras.FieldByName('perc_icms').AsCurrency, ffnumber, 2) + '%';
   LIPI.Caption          := currtostrf(QCompras.FieldByName('perc_ipi').AsCurrency, ffnumber, 2) + '%';

   if QCompras.bof then
      begin 
         BtnPrimeiro.Enabled:= false;
         BtnAnterior.Enabled:= false;
         BtnProximo.Enabled := true;
         BtnUltimo.Enabled  := true;
      end
   else
      if QCompras.Eof then
         begin 
            BtnPrimeiro.Enabled:= true;
            BtnAnterior.Enabled:= true;
            BtnProximo.Enabled := false;
            BtnUltimo.Enabled  := false;
         end
      else
         begin 
            BtnPrimeiro.Enabled:= true;
            BtnAnterior.Enabled:= true;
            BtnProximo.Enabled := true;
            BtnUltimo.Enabled  := true;
         end;
end;

procedure TFrmUltimaCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QCompras.Close;
   Action:= caFree;
end;

end.
