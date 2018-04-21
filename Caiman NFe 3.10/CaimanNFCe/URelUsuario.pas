unit URelUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Mask, RzCmboBx, DB, RxToolEdit, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TfrmRelUsuario = class(TForm)
    cbUsuario: TRzComboBox;
    Label1: TLabel;
    QConsulta: TFDQuery;
    GroupBox1: TGroupBox;
    Button1: TButton;
    edtData: TDateEdit;
    edtTIni: TMaskEdit;
    edtTFim: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelUsuario: TfrmRelUsuario;

implementation

uses
  UDM, Ubibli1, UDialog, UConfereCaixa;

{$R *.dfm}

procedure TfrmRelUsuario.Button1Click(Sender: TObject);
var
   CodUsuario: Integer;
   Ini, Fim: TDateTime;
   Relatorio: TStrings;
   TotalCaixa: Double;
   Sup, San: Double;
begin
   TotalCaixa := 0;
  if dm.IBTransaction.Active then
     DM.IBTransaction.Commit;
  DM.IBTransaction.StartTransaction;

   CodUsuario := StrToInt( cbUsuario.Value );
   Ini := StrToDateTime( edtData.Text + ' ' + edtTini.Text );
   Fim := StrToDateTime( edtData.Text + ' ' + edtTFim.Text );
   Relatorio :=  TStringList.Create;
   Relatorio.Clear;
   Relatorio.Add( FormataStringD( '', '40', '-' ));
   Relatorio.Add(  'Usuario: '+ cbUsuario.Text  );
   Relatorio.Add(  'Lancamento: ' + FormatDateTime( 'dd/mm/yy - hh:mm:ss', Now )  );
   Relatorio.Add( FormataStringD( '', '40', '-' ));
   Relatorio.Add(  'Periodo: '+ FormatDateTime( 'dd/mm/yy', edtData.Date ) + ' - ' + edttIni.Text  + ' - ' + edtTfim.Text );
   Relatorio.Add(  'Dados relativos a cupons fiscais' );
   Relatorio.Add( FormataStringD( '', '40', '-' ));
   Relatorio.Add( FormataStringC( 'VENDAS', '40', '-' ));
   Relatorio.Add( FormataStringD( '', '40', '-' ));
  QConsulta.Close;
  Qconsulta.SQL.Text := 'select  case fp.tipo when ' + #39 + 'DN' + #39 +' then  (  COALESCE( ( select sum( cr.valor_ctr ) from contas_receber cr  inner join vendas vee on'+
   ' ( vee.cod_ven = cr.cod_venda )'+
   ' where vee.data_hora_ven between :dataini and :datafim  and vee.cod_usu=:codusu and cr.dtpagto_ctr is not null ), 0 )+ Sum( vf.valor ) )'+
   ' when  ' + #39 + 'PR' + #39 + ' then  (  Sum( vf.valor ) - COALESCE(( select sum( cr.valor_ctr ) from contas_receber cr  inner join vendas vee on'+
   ' ( vee.cod_ven = cr.cod_venda )'+
   ' where vee.data_hora_ven between :dataini and :datafim and vee.cod_usu=:codusu and cr.dtpagto_ctr=null ), 0 )  )'+
   ' else  Sum( vf.valor ) end total,'+

   ' case fp.tipo when ' + #39 + 'DN' + #39 + ' then coalesce( ( select sum ( vfs.valor ) from vendas_formas_pagamento vfs'+
   ' inner join formas_pagamento fps'+
   ' on ( fps.codigo = vfs.cod_forma )'+
   ' inner join vendas ves'+
   ' on ( ves.cod_ven = vfs.cod_venda )'+
   ' where  ves.cod_emp =:codemp and ves.cod_cai=:codcai and ves.cod_usu=:codusu and fps.tipo = ' + #39 + 'TR' + #39 +
   ' and vfs.valor >= 0 and ves.data_hora_ven between :dataini and :datafim group by fps.descricao, fps.tipo'+
    '  ) ,0 )'+
    '  when ' + #39 + 'CV' + #39 + ' then coalesce( ( select sum ( vfs.valor ) from vendas_formas_pagamento vfs'+
   ' inner join formas_pagamento fps'+
   ' on ( fps.codigo = vfs.cod_forma )'+
   ' inner join vendas ves'+
   ' on ( ves.cod_ven = vfs.cod_venda )'+
   ' where  ves.cod_emp =:codemp and ves.cod_cai=:codcai and ves.cod_usu=:codusu and fps.tipo = ' + #39 + 'TV' + #39 +
   ' and vfs.valor >= 0 and ves.data_hora_ven between :dataini and :datafim group by fps.descricao, fps.tipo'+
    '  ) ,0 ) else 0 end saidas,'+


    ' fp.descricao, fp.tipo'+
   '  from vendas_formas_pagamento vf'+
   ' inner join formas_pagamento fp'+
   ' on ( fp.codigo = vf.cod_forma )'+
   ' inner join vendas ve'+
   ' on ( ve.cod_ven = vf.cod_venda )'+
   ' where  ve.cod_emp =:codemp and ve.cod_cai=:codcai and ve.cod_usu=:codusu and fp.tipo <> ' + #39 + 'TR' + #39 +
   ' and fp.tipo <> ' + #39 + 'TV' + #39 +
   ' and ve.data_hora_ven between :dataini and :datafim and ve.cancelada_ven=0 group by fp.codigo, fp.descricao, fp.tipo';
  QConsulta.ParamByName( 'dataini' ).AsDateTime := Ini;
  QConsulta.ParamByName( 'datafim' ).AsDateTime :=  Fim;
  QConsulta.ParamByName( 'CODCAI' ).AsInteger := iCaixa;
  QConsulta.ParamByName( 'codusu' ).AsInteger := CodUsuario;
  QConsulta.ParamByName( 'CODEMP' ).AsInteger := iEmp;

  QConsulta.Open;
  QConsulta.First;
  Relatorio.Add( '                 Entradas   |    Saidas' );
  while not Qconsulta.Eof do
     begin
        Relatorio.Add( FormataStringE( Qconsulta.FieldByName( 'DESCRICAO' ).AsString, '13', ' ' ) +
        ':' + FormataStringD( FormatFloat( '0.00', Qconsulta.FieldByName( 'TOTAL' ).AsFloat  ), '13', ' ' ) + ' |' +
        FormataStringD( FormatFloat( '0.00', Qconsulta.FieldByName( 'SAIDAS' ).AsFloat  ), '13', ' ' ));
        if Qconsulta.FieldByName( 'TIPO' ).AsString = 'DN' then
           TotalCaixa := ( TotalCaixa + QConsulta.FieldByName( 'TOTAL' ).AsFloat ) -
           QConsulta.FieldByName( 'SAIDAS' ).AsFloat;
        if Qconsulta.FieldByName( 'TIPO' ).AsString = 'TR' then
           TotalCaixa := TotalCaixa - QConsulta.FieldByName( 'TOTAL' ).AsFloat;
        QConsulta.Next;
     end;

  QConsulta.Close;

  QConsulta.SQL.Text := 'select sum( S.valor ) total from suprimentos_ecf S ' +
  'where S.DATA_HORA between :dataini and :datafim and COD_CAI=:CODCAI and COD_EMP=:CODEMP and S.COD_USU=:cod_usu';
  QConsulta.ParamByName( 'dataini' ).AsDateTime := Ini;
  QConsulta.ParamByName( 'datafim' ).AsDateTime :=  Fim;
  QConsulta.ParamByName( 'CODCAI' ).AsInteger := iCaixa;
  QConsulta.ParamByName( 'cod_usu' ).AsInteger := CodUsuario;
  QConsulta.ParamByName( 'CODEMP' ).AsInteger := iEmp;
  QConsulta.Open;
  Relatorio.Add( FormataStringD( '', '40', '-' ));
  Sup :=    QConsulta.FieldByName( 'total' ).AsFloat;
  Relatorio.Add( 'Total dos Suprimentos: ' + FormatFloat( 'R$ 0.00', QConsulta.FieldByName( 'total' ).AsFloat ) );
  Relatorio.Add( FormataStringD( '', '40', '-' ));
  QConsulta.Close;
  QConsulta.SQL.Text := 'select sum( S.valor ) total from sangrias_ecf S ' +
  'where S.DATA_HORA between :dataini and :datafim and COD_CAI=:CODCAI and COD_EMP=:CODEMP and S.COD_USU=:cod_usu';
  QConsulta.ParamByName( 'dataini' ).AsDateTime := Ini;
  QConsulta.ParamByName( 'datafim' ).AsDateTime :=  Fim;
  QConsulta.ParamByName( 'CODCAI' ).AsInteger := iCaixa;
  QConsulta.ParamByName( 'cod_usu' ).AsInteger := CodUsuario;
  QConsulta.ParamByName( 'CODEMP' ).AsInteger := iEmp;
  QConsulta.Open;
  Relatorio.Add( FormataStringD( '', '40', '-' ));
  San :=    QConsulta.FieldByName( 'total' ).AsFloat;
  Relatorio.Add( 'Total das Sangrias: ' + FormatFloat( 'R$ 0.00', QConsulta.FieldByName( 'total' ).AsFloat ) );
  Relatorio.Add( FormataStringD( '', '40', '-' ));
  QConsulta.Close;

  Relatorio.Add( 'Total em Caixa : ' + FormatFloat( 'R$ 0.00', ( TotalCaixa + Sup ) - San ) );
  Qconsulta.SQL.Text := 'select sum( v.total_ven ) total from vendas v where v.cod_emp=:codemp' +
  ' and v.cod_cai=:codcai and v.cod_usu=:codusu and '+
  'v.data_hora_ven between :dataini and :datafim  and v.cancelada_ven=0';
  QConsulta.ParamByName( 'dataini' ).AsDateTime := Ini;
  QConsulta.ParamByName( 'datafim' ).AsDateTime :=  Fim;
  QConsulta.ParamByName( 'CODCAI' ).AsInteger := iCaixa;
  QConsulta.ParamByName( 'codusu' ).AsInteger := CodUsuario;
  QConsulta.ParamByName( 'CODEMP' ).AsInteger := iEmp;
  Qconsulta.Open;
  Relatorio.Add( 'Total das Vendas : ' + FormatFloat( 'R$ 0.00', QConsulta.FieldByName( 'total' ).AsFloat  ) );
  Qconsulta.Close;
//  dm.IBTransaction.Commit;
  dm.ECF.RelatorioGerencial(Relatorio, 1 );
 //Relatorio.SaveToFile( 'teste.txt' );
  Relatorio.Free;
  if KDialog( 'Deseja Abrir a tela de Conferência?', 'Conferência de Moedas', 'PERGUNTA' ) then
     begin
        Application.CreateForm( TfrmConfereCaixa, frmConfereCaixa );
        frmConfereCaixa.Valor := ( TotalCaixa + Sup ) - San ;
        frmConfereCaixa.ShowModal;
     end;

end;

procedure TfrmRelUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmRelUsuario.FormCreate(Sender: TObject);
begin
   dm.ScaleForm( Self, False );
end;

procedure TfrmRelUsuario.FormShow(Sender: TObject);
var
   Num: Integer;
   index: Integer;
begin
  Num := 0;
   cbUsuario.ClearItemsValues;
    if dm.IBTransaction.Active then
       DM.IBTransaction.Commit;
    DM.IBTransaction.StartTransaction;

    QConsulta.Close;
    QConsulta.Sql.Text := 'select * from usuario';
    QConsulta.Open;
    Qconsulta.First;
    while not Qconsulta.Eof  do
         begin
             cbUsuario.AddItemValue( Qconsulta.FieldByName( 'COD_USU' ).AsString +
             ' - ' + Qconsulta.FieldByName( 'NOME_USU' ).AsString,
             Qconsulta.FieldByName( 'COD_USU' ).AsString );
             if Qconsulta.FieldByName( 'COD_USU' ).AsInteger = iCodUsu then
                Index := Num;
             Qconsulta.Next;
             Inc( Num );
         end;
    QConsulta.close;
    cbusuario.ItemIndex := Index;
    edtData.Date := Date;
    edttIni.Text  := '00:00:00';
    edttFim.Text  := '23:59:59';
end;

end.
