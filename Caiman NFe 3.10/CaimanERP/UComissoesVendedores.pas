unit UComissoesVendedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, sMaskEdit, sCustomComboEdit, 
  sTooledit, DB, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TfrmComissoesVendedores = class(UNovoFormulario.TForm)
    IBTRGeraComissoes: TFDTransaction;
    SelVend: TGroupBox;
    EdtCodVend: UNovosComponentes.TEdit;
    BtnConsCli: TsSpeedButton;
    EdtNomeVend: TEdit;
    GroupBox2: TGroupBox;
    DataIni: TsDateEdit;
    Label1: TLabel;
    DataFim: TsDateEdit;
    Label2: TLabel;
    TipoGeracao: TRadioGroup;
    Button1: TButton;
    QVendasVendedor: TFDQuery;
    QVendasVendedorCOD_VEN: TIntegerField;
    QVendasVendedorDATA_VEN: TDateField;
    QVendasVendedorCOD_EMP: TIntegerField;
    QVendasVendedorCOD_CAI: TIntegerField;
    QVendasVendedorCOD_CLI: TIntegerField;
    QVendasVendedorDESCONTO_VEN: TBCDField;
    QVendasVendedorCOD_TPV: TIntegerField;
    QVendasVendedorTOTAL_VEN: TBCDField;
    QVendasVendedorCUPOM_FISCAL_VEN: TIntegerField;
    QVendasVendedorTOTAL_CUSTO_VEN: TBCDField;
    QVendasVendedorDATA_HORA_VEN: TSQLTimeStampField;
    QVendasVendedorDESC_PESSOA_AUTORIZADA: TStringField;
    QVendasVendedorCOD_NF: TIntegerField;
    QVendasVendedorCOD_USU: TIntegerField;
    QVendasVendedorCANCELADA_VEN: TIntegerField;
    QVendasVendedorCODIGO_PAF: TIntegerField;
    QVendasVendedorR04_CCF: TIntegerField;
    QVendasVendedorR04_NOME_CLIENTE: TStringField;
    QVendasVendedorR04_CNPJ_CLIENTE: TStringField;
    QVendasVendedorNUMERO_NOTA_FISCAL: TIntegerField;
    QVendasVendedorCOD_VEND: TIntegerField;
    QVendasVendedorSERIE_NOTA_FISCAL: TStringField;
    QVendasVendedorCODIFICACAO_FISCAL: TStringField;
    QVendasVendedorCER: TIntegerField;
    QVendasVendedorCONSIGNADA: TStringField;
    QVendasVendedorIMPORTADO_NFE: TStringField;
    Status: TLabel;
    Log: TListBox;
    Label3: TLabel;
    IBSQL1: TFDQuery;
    QAux: TFDQuery;
    QVendedores: TFDQuery;
    QVendedoresCOD_VEND: TIntegerField;
    QVendedoresNOME_VEND: TStringField;
    QVendedoresATIVO_VEND: TStringField;
    QVendedoresCOMISSAO_VEND: TBCDField;
    QComissoes: TFDQuery;
    QComissoesCOD: TIntegerField;
    QComissoesCOD_VEND: TIntegerField;
    QComissoesPORC_DESCONTO: TBCDField;
    QComissoesPORC_COMISSAO: TBCDField;
    QPegaDesconto: TFDQuery;
    QPegaDescontoITENS_DESCONTOS: TBCDField;
    QPegaDescontoDESCONTO_VENDA: TBCDField;
    QItensVenda: TFDQuery;
    QItensVendaCOD_VEN: TIntegerField;
    QItensVendaCOD_PRO: TIntegerField;
    QItensVendaORDEM: TIntegerField;
    QItensVendaDESCONTO: TBCDField;
    QItensVendaCOD_EMP: TIntegerField;
    QItensVendaQUANT: TBCDField;
    QItensVendaVALOR: TBCDField;
    QItensVendaVALOR_CUSTO: TBCDField;
    QItensVendaPRODUTO_PROMOCAO: TStringField;
    QItensVendaCANCELADO: TIntegerField;
    QItensVendaVENDA_CANCELADA: TIntegerField;
    QItensVendaCOD_VEND: TIntegerField;
    QItensVendaSTATUS_EXPORTA: TIntegerField;
    procedure BtnConsCliClick(Sender: TObject);
    procedure EdtCodVendExit(Sender: TObject);
    procedure TipoGeracaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    function BuscaComissaoVendedor(COD_VEND: Integer): Double;
    function BuscaComissao( cod_venda, cond_vend: Integer; total_venda: Double ): Double;
    function BuscaTotalDesconto( cod_venda: Integer ): Double;
    function BuscaComissao2( cond_vend: Integer;
  total_venda, total_desconto: Double): Double;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComissoesVendedores: TfrmComissoesVendedores;

implementation

uses
  UDM, UConsVend, Ubibli1, UNovoPrincipal;

{$R *.dfm}

procedure TfrmComissoesVendedores.BtnConsCliClick(Sender: TObject);
begin 
  Application.CreateForm(TFrmConsVend, FrmConsVend);
  FrmConsVend.Tag := 5;
  FrmConsVend.ShowModal;
end;

procedure TfrmComissoesVendedores.Button1Click(Sender: TObject);
var
  UltCod: Integer;
  ComissaoVendedor: Double;
  Totalvendas, TotalComissoes: Double;
  porc_comissao: Double;
  total_desconto_venda: Double;
begin 
  Totalvendas := 0;
  TotalComissoes := 0;
  if IBTRGeraComissoes.Active then
    IBTRGeraComissoes.Commit;
  IBTRGeraComissoes.StartTransaction;
  Status.Visible := True;
  Log.Items.Clear;
  try
    try
      case TipoGeracao.ItemIndex of
        0:
          begin 
            QVendedores.Open;
            QVendedores.First;
            while not QVendedores.Eof do
            begin 
              Totalvendas := 0;
              TotalComissoes := 0;
              QVendasVendedor.Close;
              QVendasVendedor.ParamByName('CODEMP').AsInteger := iEmp;
              QVendasVendedor.ParamByName('CODVEND').AsInteger :=
                QVendedoresCOD_VEND.AsInteger;
              QVendasVendedor.ParamByName('dataini').AsDate := DataIni.Date;
              QVendasVendedor.ParamByName('datafim').AsDate := DataFim.Date;
              QVendasVendedor.Open;
              if QVendasVendedor.IsEmpty then
              begin 
                Log.Items.Add('Vendedor : ' + QVendedoresCOD_VEND.AsString + ' - ' +
                  QVendedoresNOME_VEND.AsString + ' Não possui vendas no periodo.');
                Exit;
              end;
              UltCod := Prxcod('COMISSOES', 'COD', DM.IBTransaction, IBSQL1);
              Log.Items.Add('Gerando Comissoes Vendedor: ' + QVendedoresCOD_VEND.AsString +
                ' - ' + QVendedoresNOME_VEND.AsString );
              ComissaoVendedor := BuscaComissaoVendedor
                (QVendedoresCOD_VEND.AsInteger);
              QAux.Close;
              QAux.SQL.Text :=
                'INSERT INTO COMISSOES( COD, COD_EMP, VENDEDOR, DATA, PAGO, DATAINI, DATAFIN )'
                + ' VALUES ( :COD, :COD_EMP, :VENDEDOR, :DATA, :PAGO, :DATAINI, :DATAFIN )';
              QAux.ParamByName('COD').AsInteger := UltCod;
              QAux.ParamByName('COD_EMP').AsInteger := iEmp;
              QAux.ParamByName('VENDEDOR').AsInteger :=
                QVendedoresCOD_VEND.AsInteger;
              QAux.ParamByName('DATA').AsDate := Date;
              QAux.ParamByName('PAGO').AsString := 'N';
              QAux.ParamByName('DATAINI').AsDate := DataIni.Date;
              QAux.ParamByName('DATAFIN').AsDate := DataFim.Date;
              QAux.ExecOrOpen;
              QVendasVendedor.First;
              while not QVendasVendedor.Eof do
              begin 
                if QVendasVendedorCANCELADA_VEN.AsInteger = 0 then
                begin 
                QAux.Close;
                QAux.SQL.Text := 'INSERT INTO COMISSOES_VENDAS( COD_COMISSOES, '
                  + ' VENDA, TOTAL_VENDA, TOTAL_DESCONTOS ) VALUES ' +
                  ' ( :COD_COMISSOES, :VENDA, :TOTAL_VENDA, :TOTAL_DESCONTOS )';
                QAux.ParamByName('COD_COMISSOES').AsInteger := UltCod;
                QAux.ParamByName('VENDA').AsInteger :=
                  QVendasVendedorCOD_VEN.AsInteger;
                QAux.ParamByName('TOTAL_VENDA').AsCurrency :=
                  QVendasVendedorTOTAL_VEN.AsCurrency;
                Totalvendas := Totalvendas +
                  QVendasVendedorTOTAL_VEN.AsCurrency;


                QAux.ParamByName('TOTAL_DESCONTOS').AsCurrency := BuscaTotalDesconto( QVendasVendedorCOD_VEN.AsInteger );
                QAux.ExecOrOpen;
                QItensVenda.Close;
                QItensVenda.ParamByName( 'cod_emp' ).AsInteger := iEmp;
                QItensVenda.ParamByName('cod_ven').AsInteger := QVendasVendedorCOD_VEN.AsInteger;
                QItensVenda.Open;
                QItensVenda.First;
                total_desconto_venda := 0;
                while not QItensVenda.Eof do
                   begin 
                      if QItensVendaCANCELADO.AsInteger = 0 then
                      begin 
                      QAux.Close;
                      QAux.SQL.Text := 'INSERT INTO COMISSOES_VENDAS_ITENS(' +
                      'COD_EMP, COD_VENDA, ORDEM, COD_PRO, TOTAL, TOTAL_DESCONTOS, ' +
                      'PERC_DESCONTO, COMISSAO_APLICADA, TOTAL_COMISSAO, COD_COMISSAO, SUB_TOTAL )' +
                      ' values ( :COD_EMP, :COD_VENDA, :ORDEM, :COD_PRO, :TOTAL, :TOTAL_DESCONTOS, ' +
                      ':PERC_DESCONTO, :COMISSAO_APLICADA, :TOTAL_COMISSAO, :COD_COMISSAO, :SUB_TOTAL )';
                      QAux.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
                      QAux.ParamByName( 'COD_VENDA' ).AsInteger := QItensVendaCOD_VEN.AsInteger;
                      QAux.ParamByName( 'ORDEM' ).AsInteger := QItensVendaORDEM.AsInteger;
                      QAux.ParamByName( 'COD_PRO' ).AsInteger := QItensVendaCOD_PRO.AsInteger;
                      QAux.ParamByName( 'TOTAL' ).AsCurrency := QItensVendaQUANT.AsCurrency *
                          QItensVendaVALOR.AsCurrency;
                      QAux.ParamByName( 'TOTAL_DESCONTOS' ).AsCurrency := QItensVendaDESCONTO.AsCurrency;
                      QAux.ParamByName( 'PERC_DESCONTO' ).AsCurrency := ( QItensVendaDESCONTO.AsCurrency * 100 ) /  QAux.ParamByName( 'TOTAL' ).AsCurrency;
                      QAux.ParamByName( 'COMISSAO_APLICADA' ).AsCurrency := BuscaComissao2( QVendedoresCOD_VEND.AsInteger,
                      QAux.ParamByName( 'TOTAL' ).AsCurrency,QItensVendaDESCONTO.AsCurrency );
                      QAux.ParamByName( 'COD_COMISSAO' ).AsInteger := UltCod;
                      QAux.ParamByName( 'SUB_TOTAL' ).AsCurrency := QAux.ParamByName( 'TOTAL' ).AsCurrency -
                            QAux.ParamByName( 'TOTAL_DESCONTOS' ).AsCurrency;
                  QAux.ParamByName( 'TOTAL_COMISSAO' ).AsCurrency := ( QAux.ParamByName( 'SUB_TOTAL' ).AsCurrency *
                          QAux.ParamByName( 'COMISSAO_APLICADA' ).AsCurrency ) / 100;

                      total_desconto_venda := total_desconto_venda +
                         QAux.ParamByName( 'TOTAL_COMISSAO' ).AsCurrency;

                      QAux.ExecOrOpen;
                      end;
                      QItensVenda.Next;
                   end;
                QAux.Close;
                QAux.SQL.Text := 'UPDATE COMISSOES_VENDAS set TOTAL_COMISSAO=:TOTAL_COMISSAO where COD_COMISSOES=:COD and VENDA=:VENDA';
                QAux.ParamByName( 'COD' ).AsInteger := UltCod;
                QAux.ParamByName( 'VENDA' ).AsInteger := QVendasVendedorCOD_VEN.AsInteger;
                QAux.ParamByName( 'TOTAL_COMISSAO').AsFloat := total_desconto_venda;
                                TotalComissoes := TotalComissoes + total_desconto_venda;
                QAux.ExecOrOpen;
                end;
                QVendasVendedor.Next;
              end;
              QAux.Close;
              QAux.SQL.Text :=
                'Update COMISSOES set TOTAL_VENDAS=:TOTAL_VENDAS, TOTAL_COMISSOES=:TOTAL_COMISSOES '
                + ' where COD=:COD';
              QAux.ParamByName('TOTAL_VENDAS').AsCurrency := Totalvendas;
              QAux.ParamByName('TOTAL_COMISSOES').AsCurrency := TotalComissoes;
              QAux.ParamByName('COD').AsInteger := UltCod;
              QAux.ExecOrOpen;
              Log.Items.Add('Comissoes Geradas!');
              Log.Items.Add('Total Vendas Periodo: ' + FormatFloat('R$ 0.00',
                Totalvendas));
              Log.Items.Add('Total Comissões Periodo: ' + FormatFloat('R$ 0.00',
                TotalComissoes));

              QVendedores.Next;
            end;
          end;
        1:
          begin 

            if EdtCodVend.Text = '' then
            begin 
              Log.Items.Add('Selecione um vendedor');
              Exit;
            end;
            QVendasVendedor.Close;
            QVendasVendedor.ParamByName('CODEMP').AsInteger := iEmp;
            QVendasVendedor.ParamByName('CODVEND').AsInteger :=
              StrToInt(EdtCodVend.Text);
            QVendasVendedor.ParamByName('dataini').AsDate := DataIni.Date;
            QVendasVendedor.ParamByName('datafim').AsDate := DataFim.Date;
            QVendasVendedor.Open;
            if QVendasVendedor.IsEmpty then
            begin 
              Log.Items.Add('Vendedor : ' + EdtCodVend.Text + ' - ' +
                EdtNomeVend.Text + ' Não possui vendas no periodo.');
              Exit;
            end;
            UltCod := Prxcod('COMISSOES', 'COD', DM.IBTransaction, IBSQL1);
            Log.Items.Add('Gerando Comissoes Vendedor: ' + EdtCodVend.Text +
              ' - ' + EdtNomeVend.Text);
            ComissaoVendedor := BuscaComissaoVendedor
              (StrToInt(EdtCodVend.Text));
            QAux.Close;
            QAux.SQL.Text :=
              'INSERT INTO COMISSOES( COD, COD_EMP, VENDEDOR, DATA, PAGO, DATAINI, DATAFIN )'
              + ' VALUES ( :COD, :COD_EMP, :VENDEDOR, :DATA, :PAGO, :DATAINI, :DATAFIN )';
            QAux.ParamByName('COD').AsInteger := UltCod;
            QAux.ParamByName('COD_EMP').AsInteger := iEmp;
            QAux.ParamByName('VENDEDOR').AsInteger := StrToInt(EdtCodVend.Text);
            QAux.ParamByName('DATA').AsDate := Date;
            QAux.ParamByName('PAGO').AsString := 'N';
            QAux.ParamByName('DATAINI').AsDate := DataIni.Date;
            QAux.ParamByName('DATAFIN').AsDate := DataFim.Date;
            QAux.ExecOrOpen;
              QVendasVendedor.First;
              while not QVendasVendedor.Eof do
              begin 
                if QVendasVendedorCANCELADA_VEN.AsInteger = 0 then
                begin 
                QAux.Close;
                QAux.SQL.Text := 'INSERT INTO COMISSOES_VENDAS( COD_COMISSOES, '
                  + ' VENDA, TOTAL_VENDA, TOTAL_DESCONTOS ) VALUES ' +
                  ' ( :COD_COMISSOES, :VENDA, :TOTAL_VENDA, :TOTAL_DESCONTOS )';
                QAux.ParamByName('COD_COMISSOES').AsInteger := UltCod;
                QAux.ParamByName('VENDA').AsInteger :=
                  QVendasVendedorCOD_VEN.AsInteger;
                QAux.ParamByName('TOTAL_VENDA').AsCurrency :=
                  QVendasVendedorTOTAL_VEN.AsCurrency;
                Totalvendas := Totalvendas +
                  QVendasVendedorTOTAL_VEN.AsCurrency;


                QAux.ParamByName('TOTAL_DESCONTOS').AsCurrency := BuscaTotalDesconto( QVendasVendedorCOD_VEN.AsInteger );
                QAux.ExecOrOpen;
                QItensVenda.Close;
                QItensVenda.ParamByName( 'cod_emp' ).AsInteger := iEmp;
                QItensVenda.ParamByName('cod_ven').AsInteger := QVendasVendedorCOD_VEN.AsInteger;
                QItensVenda.Open;
                QItensVenda.First;
                total_desconto_venda := 0;
                while not QItensVenda.Eof do
                   begin 
                      if QItensVendaCANCELADO.AsInteger = 0 then
                      begin 
                      QAux.Close;
                      QAux.SQL.Text := 'INSERT INTO COMISSOES_VENDAS_ITENS(' +
                      'COD_EMP, COD_VENDA, ORDEM, COD_PRO, TOTAL, TOTAL_DESCONTOS, ' +
                      'PERC_DESCONTO, COMISSAO_APLICADA, TOTAL_COMISSAO, COD_COMISSAO, SUB_TOTAL )' +
                      ' values ( :COD_EMP, :COD_VENDA, :ORDEM, :COD_PRO, :TOTAL, :TOTAL_DESCONTOS, ' +
                      ':PERC_DESCONTO, :COMISSAO_APLICADA, :TOTAL_COMISSAO, :COD_COMISSAO, :SUB_TOTAL )';
                      QAux.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
                      QAux.ParamByName( 'COD_VENDA' ).AsInteger := QItensVendaCOD_VEN.AsInteger;
                      QAux.ParamByName( 'ORDEM' ).AsInteger := QItensVendaORDEM.AsInteger;
                      QAux.ParamByName( 'COD_PRO' ).AsInteger := QItensVendaCOD_PRO.AsInteger;
                      QAux.ParamByName( 'TOTAL' ).AsCurrency := QItensVendaQUANT.AsCurrency *
                          QItensVendaVALOR.AsCurrency;
                      QAux.ParamByName( 'TOTAL_DESCONTOS' ).AsCurrency := QItensVendaDESCONTO.AsCurrency;
                      QAux.ParamByName( 'PERC_DESCONTO' ).AsCurrency := ( QItensVendaDESCONTO.AsCurrency * 100 ) /  QAux.ParamByName( 'TOTAL' ).AsCurrency;
                      QAux.ParamByName( 'COMISSAO_APLICADA' ).AsCurrency := BuscaComissao2( StrToInt( EdtCodVend.Text ),
                      QAux.ParamByName( 'TOTAL' ).AsCurrency,QItensVendaDESCONTO.AsCurrency );
                      QAux.ParamByName( 'COD_COMISSAO' ).AsInteger := UltCod;
                      QAux.ParamByName( 'SUB_TOTAL' ).AsCurrency := QAux.ParamByName( 'TOTAL' ).AsCurrency -
                            QAux.ParamByName( 'TOTAL_DESCONTOS' ).AsCurrency;
                  QAux.ParamByName( 'TOTAL_COMISSAO' ).AsCurrency := ( QAux.ParamByName( 'SUB_TOTAL' ).AsCurrency *
                          QAux.ParamByName( 'COMISSAO_APLICADA' ).AsCurrency ) / 100;

                      total_desconto_venda := total_desconto_venda +
                         QAux.ParamByName( 'TOTAL_COMISSAO' ).AsCurrency;

                      QAux.ExecOrOpen;
                      end;
                      QItensVenda.Next;
                   end;
                QAux.Close;
                QAux.SQL.Text := 'UPDATE COMISSOES_VENDAS set TOTAL_COMISSAO=:TOTAL_COMISSAO where COD_COMISSOES=:COD and VENDA=:VENDA';
                QAux.ParamByName( 'COD' ).AsInteger := UltCod;
                QAux.ParamByName( 'VENDA' ).AsInteger := QVendasVendedorCOD_VEN.AsInteger;
                QAux.ParamByName( 'TOTAL_COMISSAO').AsFloat := total_desconto_venda;
                TotalComissoes := TotalComissoes + total_desconto_venda;
                QAux.ExecOrOpen;
                end;
                QVendasVendedor.Next;
              end;
            QAux.Close;
            QAux.SQL.Text :=
              'Update COMISSOES set TOTAL_VENDAS=:TOTAL_VENDAS, TOTAL_COMISSOES=:TOTAL_COMISSOES '
              + ' where COD=:COD';
            QAux.ParamByName('TOTAL_VENDAS').AsCurrency := Totalvendas;
            QAux.ParamByName('TOTAL_COMISSOES').AsCurrency := TotalComissoes;
            QAux.ParamByName('COD').AsInteger := UltCod;
            QAux.ExecOrOpen;
            Log.Items.Add('Comissoes Geradas!');
            Log.Items.Add('Total Vendas Periodo: ' + FormatFloat('R$ 0.00',
              Totalvendas));
            Log.Items.Add('Total Comissões Periodo: ' + FormatFloat('R$ 0.00',
              TotalComissoes));
          end;
      end;
    except
      ON E: EDatabaseError do
      begin 
        Log.Items.Add('Erro ao gerar comissões : ' + E.Message +
          ' ( ABORTADO )');
        QVendasVendedor.Close;
        IBTRGeraComissoes.Rollback;
        Status.Visible := False;
      end;
    end;
  finally
    IBTRGeraComissoes.Commit;
    QVendasVendedor.Close;
    Status.Visible := False;

  end;

end;

procedure TfrmComissoesVendedores.EdtCodVendExit(Sender: TObject);
begin 
  if DM.IBTransaction.Active then
    DM.IBTransaction.Commit;
  DM.IBTransaction.StartTransaction;

  try
    DM.QVend.SQL.Text := 'select * from VENDEDOR where COD_VEND=:COD_VEND';
    DM.QVend.ParamByName('COD_VEND').AsInteger := StrToInt(EdtCodVend.Text);
    DM.QVend.Open;
    if DM.QVend.IsEmpty then
    begin 
      AlertaCad('Vendedor não encontrato');
      EdtNomeVend.Clear;
      EdtCodVend.Clear;
      DM.IBTransaction.Commit;
      Exit;
    end;
    EdtNomeVend.Text := DM.QVendNOME_VEND.AsString;
    DM.QVend.Close;
    DM.IBTransaction.Commit;
  except
    DM.IBTransaction.Rollback;
    EdtNomeVend.Clear;
    EdtCodVend.Clear;
    AlertaCad('Erro ao buscar o vendedor');
  end;

end;

procedure TfrmComissoesVendedores.FormShow(Sender: TObject);
begin 
  DataIni.Date := Date;
  DataFim.Date := Date;
  TipoGeracao.ItemIndex := 0;
  TipoGeracaoClick(nil);

end;

procedure TfrmComissoesVendedores.TipoGeracaoClick(Sender: TObject);
begin 
  case TipoGeracao.ItemIndex of
    0:
      begin 
        SelVend.Visible := False;
      end;
    1:
      begin 
        SelVend.Visible := True;
      end;
  end;
end;

function TfrmComissoesVendedores.BuscaComissao(cod_venda, cond_vend: Integer;
  total_venda: Double): Double;
var
 porc_desconto: Double;
 soma_descontos: double;
begin 
//
   QPegaDesconto.Close;
   QPegaDesconto.ParamByName( 'codven' ).AsInteger := cod_venda;
   QPegaDesconto.Open;
   soma_descontos := Abs( QPegaDescontoITENS_DESCONTOS.AsFloat ) + Abs( QPegaDescontoDESCONTO_VENDA.AsFloat) ;
   if  soma_descontos > 0 then
       begin 
          porc_desconto := ( soma_descontos * 100 ) / total_venda;
          QComissoes.Close;
          QComissoes.SQL.Text := 'select FIRST 1 * from VENDEDOR_DESC_COMISSAO' +
          ' where COD_VEND=:COD_VEND and  ( PORC_DESCONTO >= :PORC ) ' +
          ' order by PORC_DESCONTO';
          QComissoes.ParamByName( 'COD_VEND' ).AsInteger := cond_vend;
          QComissoes.ParamByName( 'PORC' ).AsFloat := porc_desconto;
          QComissoes.Open;
          if QComissoes.IsEmpty then
             begin 
                QComissoes.Close;
                QComissoes.SQL.Text := 'select FIRST 1 * from VENDEDOR_DESC_COMISSAO' +
                ' where COD_VEND=:COD_VEND and  ( PORC_DESCONTO <= :PORC ) ' +
                ' order by PORC_DESCONTO desc';
                QComissoes.ParamByName( 'COD_VEND' ).AsInteger := cond_vend;
                QComissoes.ParamByName( 'PORC' ).AsFloat := porc_desconto;
                QComissoes.Open;
             end;
          if QComissoes.IsEmpty then
             begin 
                Result := BuscaComissaoVendedor( cond_vend );
                QComissoes.Close;
             end
          else
             begin 
                Result := QComissoesPORC_COMISSAO.AsFloat;
                QComissoes.Close;
             end;
       end
    else
      Result := BuscaComissaoVendedor( cond_vend );

   QPegaDesconto.Close;
end;

function TfrmComissoesVendedores.BuscaComissao2( cond_vend: Integer;
  total_venda, total_desconto: Double): Double;
var
 porc_desconto: Double;
 soma_descontos: double;
begin 
//

   soma_descontos := total_desconto;
   if  soma_descontos > 0 then
       begin 
          porc_desconto := ( soma_descontos * 100 ) / total_venda;
          QComissoes.Close;
          QComissoes.SQL.Text := 'select FIRST 1 * from VENDEDOR_DESC_COMISSAO' +
          ' where COD_VEND=:COD_VEND and  ( PORC_DESCONTO >= :PORC ) ' +
          ' order by PORC_DESCONTO';
          QComissoes.ParamByName( 'COD_VEND' ).AsInteger := cond_vend;
          QComissoes.ParamByName( 'PORC' ).AsFloat := porc_desconto;
          QComissoes.Open;
          if QComissoes.IsEmpty then
             begin 
                QComissoes.Close;
                QComissoes.SQL.Text := 'select FIRST 1 * from VENDEDOR_DESC_COMISSAO' +
                ' where COD_VEND=:COD_VEND and  ( PORC_DESCONTO <= :PORC ) ' +
                ' order by PORC_DESCONTO desc';
                QComissoes.ParamByName( 'COD_VEND' ).AsInteger := cond_vend;
                QComissoes.ParamByName( 'PORC' ).AsFloat := porc_desconto;
                QComissoes.Open;
             end;
          if QComissoes.IsEmpty then
             begin 
                Result := BuscaComissaoVendedor( cond_vend );
                QComissoes.Close;
             end
          else
             begin 
                Result := QComissoesPORC_COMISSAO.AsFloat;
                QComissoes.Close;
             end;
       end
    else
      Result := BuscaComissaoVendedor( cond_vend );


end;


function TfrmComissoesVendedores.BuscaComissaoVendedor
  (COD_VEND: Integer): Double;
begin 
  //
  if DM.IBTransaction.Active then
    DM.IBTransaction.Commit;
  DM.IBTransaction.StartTransaction;
  DM.QConsulta.Close;
  DM.QConsulta.SQL.Text :=
    'select COMISSAO_VEND from VENDEDOR where COD_VEND=:COD_VEND';
  DM.QConsulta.ParamByName('COD_VEND').AsInteger := COD_VEND;
  DM.QConsulta.Open;
  result := DM.QConsulta.FieldByName('COMISSAO_VEND').AsCurrency;
  DM.QConsulta.Close;

  DM.IBTransaction.Commit;
end;

function TfrmComissoesVendedores.BuscaTotalDesconto(cod_venda: Integer): Double;
var
   soma_descontos: Double;
begin 
   QPegaDesconto.Close;
   QPegaDesconto.ParamByName( 'codven' ).AsInteger := cod_venda;
   QPegaDesconto.Open;
   soma_descontos := Abs( QPegaDescontoITENS_DESCONTOS.AsFloat ) + Abs( QPegaDescontoDESCONTO_VENDA.AsFloat) ;
   result := soma_descontos;
   QPegaDesconto.Close;
end;

end.
