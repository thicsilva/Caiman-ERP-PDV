unit UEntradaValores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Mask, rxToolEdit, rxCurrEdit, ComCtrls, ExtCtrls, DB, 
  DBClient, Grids, DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmEntradaValores = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BtnOk: TButton;
    BtnCancelar: TButton;
    StatusBar1: TStatusBar;
    BtnMenuFiscal: TButton;
    QInsert: TFDQuery;
    QConsulta: TFDQuery;
    Panel3: TPanel;
    Label1: TLabel;
    EdtValor: TCurrencyEdit;
    DBGrid1: TDBGrid;
    DSCaixa: TDataSource;
    Label2: TLabel;
    EdtTotal: TCurrencyEdit;
    Caixa: TClientDataSet;
    CaixaCOD: TAutoIncField;
    CaixaDESCRICAO: TStringField;
    CaixaVALOR: TCurrencyField;
    CaixaTIPO: TStringField;
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnMenuFiscalClick(Sender: TObject);
    procedure GravaSangria;
    procedure ConsultaCaixa( Data: TDate );
    function CalculaTotal: Currency;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEntradaValores: TFrmEntradaValores;

implementation
uses
  Udm, UECF, Ubibli1, UMenuFiscal;

{$R *.dfm}

procedure TFrmEntradaValores.BtnCancelarClick(Sender: TObject);
begin
   close;
end;

procedure TFrmEntradaValores.FormShow(Sender: TObject);
begin

   case tag of
      0: begin
            Caption:= 'Sangria';
            Label1.Caption:= 'Valor da Sangria';
         end;
      1: begin
            Caption:= 'Suprimento';
            Label1.Caption:= 'Valor do Suprimento';
         end;
   end;
   edtvalor.Clear;
   edtvalor.SetFocus;
   if caixa.Active then
      caixa.Close;
  caixa.CreateDataSet;
  Caixa.Open;
  Caixa.EmptyDataSet;
  ConsultaCaixa( date );
end;

procedure TFrmEntradaValores.BtnOkClick(Sender: TObject);
var sCupom : string;
begin
   if strtocurr(edtvalor.Text) <= 0 then
      begin
         showmessage('Verifique o Valor Digitado');
         edtvalor.SetFocus;
         exit;
         abort;
      end;

   if Application.MessageBox(pchar('Confirma o ' + Label1.Caption + ' ?'), 'Sangria/Suprimento', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin
         case FrmEntradaValores.Tag of
            0: begin
                  if EdtValor.Value > EdtTotal.Value then
                     begin
                         showmessage('Valor em caixa inferior ao digitado!');
                         edtvalor.SetFocus;
                         exit;
                         abort;
                     end;
                  if Sangria(iECF, strtocurr(EdtValor.Text)) = 0 then
                  GravaSangria;
               end;
            1: begin
                  if Suprimento(iECF, strtocurr(EdtValor.Text)) = 0 then
                     begin
                        GravaSuprimento(StrToCurr(EdtValor.Text));
                        showmessage('Processo Concluído');
                        close;
                     end;
               end;
         end;
         ConsultaCaixa( Date );
      end;
end;

procedure TFrmEntradaValores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Caixa.Close;
   Action:= caFree;
   Self := nil;
end;

procedure TFrmEntradaValores.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmEntradaValores.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close;
end;

procedure TFrmEntradaValores.BtnMenuFiscalClick(Sender: TObject);
begin
   Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
   FrmMenuFiscal.showmodal;
end;

procedure TFrmEntradaValores.GravaSangria;
var sDataHoraECF : string;
    iAuxCupom    : integer;
    sNumeroCOO   : string;
    sDataCupom   : string;
    sHoraCupom   : string;
begin
   sNumeroCOO:= NumeroCupom(iECF);
   try
     iAuxCupom:= strtoint(sNumeroCOO);
   except
     iAuxCupom:= 0;
   end;

   { BUSCA DATA E HORA DA ECF }
   sDataHoraECF:= DataHoraECF(iECF);
   sDataCupom  := FormataDataEcf(sDataHoraECF);
   sHoraCupom  := FormataHoraECF(sDataHoraECF);

   { GRAVANDO A SANGRIA }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QInsert do
         begin
            close;
            sql.Clear;
            sql.Text:= 'INSERT INTO SANGRIAS_ECF (CODIGO, DATA_HORA, COO, COD_CAI, COD_EMP, VALOR, COD_USU) ' +
                       'VALUES(GEN_ID(GNT_COD_SANGRIAS_ECF, 1), :DATAHORA, :COO, :CODCAI, :CODEMP, :VALOR, :CODUSU)';
            Parambyname('datahora').AsDateTime := StrToDateTime(sDataCupom + ' ' + sHoraCupom);
            Parambyname('coo').AsInteger       := iAuxCupom;
            Parambyname('codcai').AsInteger    := iCaixa;
            Parambyname('codemp').AsInteger    := iEmp;
            Parambyname('valor').AsCurrency    := strtocurr(EdtValor.Text);
            Parambyname('codusu').AsInteger    := ICodUsu;
            ExecOrOpen;
         end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao Gravar a Sangria');
     end;
   finally
     QInsert.Close;
   end;
   showmessage('Processo Concluído');
   close;

end;

procedure TFrmEntradaValores.ConsultaCaixa( Data: TDate );
var
   TotalCaixa, Sup, San, TotVendas: Double;
begin
  //
  TotalCaixa := 0;
  Caixa.EmptyDataSet;
  if dm.IBTransaction.Active then
     DM.IBTransaction.Commit;
  DM.IBTransaction.StartTransaction;

 QConsulta.Close;
  Qconsulta.SQL.Text := 'select  case fp.tipo when  '+ #39 + 'DN'+ #39 +' then  (  COALESCE( ( select sum( cr.valor_ctr ) from contas_receber cr  inner join vendas vee on' +
  ' ( vee.cod_ven = cr.cod_venda )' +
  ' where vee.data_hora_ven between :dataini and :datafim and cr.dtpagto_ctr is not null ), 0 )+ Sum( vf.valor ) )' +
  ' when  '+ #39 + 'PR'+ #39 +' then  (  Sum( vf.valor ) - COALESCE(( select sum( cr.valor_ctr ) from contas_receber cr  inner join vendas vee on ' +
  ' ( vee.cod_ven = cr.cod_venda )' +
  ' where vee.data_hora_ven between :dataini and :datafim and cr.dtpagto_ctr is  null ), 0 )  )' +
  ' else  Sum( vf.valor ) end total,' +
  ' fp.descricao, fp.tipo'+
  ' from vendas_formas_pagamento vf'+
  ' inner join formas_pagamento fp'+
  ' on ( fp.codigo = vf.cod_forma )'+
  ' inner join vendas ve' +
  ' on ( ve.cod_ven = vf.cod_venda )'+
  ' where  ve.cod_emp =:codemp and ve.cod_cai=:codcai ' +
  ' and ve.data_hora_ven between :dataini and :datafim group by fp.descricao, fp.tipo';
  QConsulta.ParamByName( 'dataini' ).AsDateTime :=  StrToDateTime( Datetostr( Data ) + ' 00:00:00' );
  QConsulta.ParamByName( 'datafim' ).AsDateTime :=  StrToDateTime( Datetostr( Data ) + ' 23:59:59' );
  QConsulta.ParamByName( 'CODCAI' ).AsInteger := iCaixa;
  QConsulta.ParamByName( 'CODEMP' ).AsInteger := iEmp;

  QConsulta.Open;
  QConsulta.First;
  while not QConsulta.Eof do
      begin
         Caixa.Insert;
         CaixaDESCRICAO.AsString := QConsulta.FieldByName( 'DESCRICAO' ).AsString;
         CaixaVALOR.AsCurrency := QConsulta.FieldByName( 'TOTAL' ).AsCurrency;
         if QConsulta.FieldByName( 'TIPO' ).AsString = 'TV'  then
            CaixaTIPO.AsString := 'Neutro'
         else
         if QConsulta.FieldByName( 'TIPO' ).AsString = 'TR'  then
            CaixaTIPO.AsString := 'Saidas'
         else
             CaixaTIPO.AsString := 'Entradas';

         Caixa.Post;
        if Qconsulta.FieldByName( 'TIPO' ).AsString = 'DN' then
           TotalCaixa := TotalCaixa + QConsulta.FieldByName( 'TOTAL' ).AsFloat;
        if Qconsulta.FieldByName( 'TIPO' ).AsString = 'TR' then
           TotalCaixa := TotalCaixa - QConsulta.FieldByName( 'TOTAL' ).AsFloat;
         QConsulta.Next;
      end;
   QConsulta.Close;

  QConsulta.SQL.Text := 'select sum( S.valor ) total from suprimentos_ecf S ' +
  'where S.DATA_HORA between :dataini and :datafim and COD_CAI=:CODCAI and COD_EMP=:CODEMP';
  QConsulta.ParamByName( 'dataini' ).AsDateTime := StrToDateTime( Datetostr( Data ) + ' 00:00:00' );
  QConsulta.ParamByName( 'datafim' ).AsDateTime :=  StrToDateTime( Datetostr( Data ) + ' 23:59:59' );
  QConsulta.ParamByName( 'CODCAI' ).AsInteger := iCaixa;
  QConsulta.ParamByName( 'CODEMP' ).AsInteger := iEmp;
  QConsulta.Open;
  if not QConsulta.IsEmpty then
     begin
        Sup :=    QConsulta.FieldByName( 'total' ).AsFloat;
        Caixa.Insert;
        CaixaDESCRICAO.AsString := 'SUPRIMENTOS';
        CaixaVALOR.AsCurrency := Sup;
        CaixaTIPO.AsString := 'Entradas';
        Caixa.Post;
     end;
  QConsulta.Close;

  QConsulta.SQL.Text := 'select sum( S.valor ) total2 from sangrias_ecf S ' +
  'where S.DATA_HORA between :dataini and :datafim and COD_CAI=:CODCAI and COD_EMP=:CODEMP ';
  QConsulta.ParamByName( 'dataini' ).AsDateTime := StrToDateTime( Datetostr( Data ) + ' 00:00:00' );
  QConsulta.ParamByName( 'datafim' ).AsDateTime :=  StrToDateTime( Datetostr( Data ) + ' 23:59:59' );
  QConsulta.ParamByName( 'CODCAI' ).AsInteger := iCaixa;
  QConsulta.ParamByName( 'CODEMP' ).AsInteger := iEmp;
  QConsulta.Open;
  if not QConsulta.IsEmpty then
     begin
        San :=    QConsulta.FieldByName( 'total2' ).AsFloat;
        Caixa.Insert;
        CaixaDESCRICAO.AsString := 'SANGRIAS';
        CaixaVALOR.AsCurrency := San;
        CaixaTIPO.AsString := 'Saidas';
        Caixa.Post;
     end;
  QConsulta.Close;

  Qconsulta.SQL.Text := 'select sum( v.total_ven ) total from vendas v where v.cod_emp=:codemp' +
  ' and v.cod_cai=:codcai and '+
  'v.data_hora_ven between :dataini and :datafim  and v.cancelada_ven=0';
  QConsulta.ParamByName( 'dataini' ).AsDateTime := StrToDateTime( Datetostr( Data ) + ' 00:00:00' );
  QConsulta.ParamByName( 'datafim' ).AsDateTime :=  StrToDateTime( Datetostr( Data ) + ' 23:59:59' );
  QConsulta.ParamByName( 'CODCAI' ).AsInteger := iCaixa;
  QConsulta.ParamByName( 'CODEMP' ).AsInteger := iEmp;
  Qconsulta.Open;
  TotVendas := QConsulta.FieldByName( 'total' ).AsFloat ;
  Qconsulta.Close;

  dm.IBTransaction.Commit;
  EdtTotal.Value :=  ( TotalCaixa + Sup ) - San ;

end;

procedure TFrmEntradaValores.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  begin
     if Pos( 'Entradas', CaixaTIPO.AsString ) > 0 then
        begin
            DBGrid1.Canvas.Brush.Color := $00AAFFAA;
            DBGrid1.Canvas.Font.Color := clBlack;
        end
    else if Pos( 'Neutro', CaixaTIPO.AsString ) > 0 then
        begin
            DBGrid1.Canvas.Brush.Color := $00F3F3F3;
            DBGrid1.Canvas.Font.Color := clBlack;
        end
    else
       begin
          DBGrid1.Canvas.Brush.Color := $00BBBBFF;
            DBGrid1.Canvas.Font.Color := clBlack;
       end;
  end;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

function TFrmEntradaValores.CalculaTotal: Currency;
var
  TotalCalc: Currency;
begin
  //
  TotalCalc := 0;
  Caixa.First;
  while not Caixa.Eof do
     begin
        if Trim( CaixaTIPO.AsString ) = 'Entradas' then
           TotalCalc := TotalCalc + CaixaVALOR.AsCurrency
        else
           TotalCalc := TotalCalc - CaixaVALOR.AsCurrency;
        Caixa.Next;
     end;
  Caixa.First;
  result := TotalCalc;
end;

end.
