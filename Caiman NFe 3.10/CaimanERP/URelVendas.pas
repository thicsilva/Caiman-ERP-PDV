unit URelVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Buttons, StdCtrls, ComCtrls, ExtCtrls, DB, Grids, DBGrids, frxClass, 
  frxDBSet, frxRich, DBClient, UNovosComponentes, UNovoFormulario, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmRelVendas = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    CheckCli: TCheckBox;
    GB2: TGroupBox;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    EdtCodCli: UNovosComponentes.TEdit;
    BtnConsCli: TsSpeedButton;
    EdtNomeCli: TEdit;
    Label2: TLabel;
    BtnVis: TBitBtn;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    CheckEmp: TCheckBox;
    GBTipoVenda: TGroupBox;
    ComboTipoVenda: TComboBox;
    CheckTipoVenda: TCheckBox;
    GBCaixa: TGroupBox;
    ComboCaixa: TComboBox;
    CheckCaixa: TCheckBox;
    QRelVendas: TFDQuery;
    QRelVendasCOD_VEN: TIntegerField;
    QRelVendasDATA_VEN: TDateField;
    QRelVendasCOD_EMP: TIntegerField;
    QRelVendasTOTAL_VEN: TBCDField;
    QRelVendasNOME_CLI: TStringField;
    QRelVendasNOME_TPV: TStringField;
    GroupBox1: TGroupBox;
    Operador: TComboBox;
    todosop: TCheckBox;
    Vendas: TFDQuery;
    VendasTOTAL: TBCDField;
    Button1: TButton;
    QItens: TFDQuery;
    QItensCOD_VEN: TIntegerField;
    QItensCOD_PRO: TIntegerField;
    QItensORDEM: TIntegerField;
    QItensDESCONTO: TBCDField;
    QItensCOD_EMP: TIntegerField;
    QItensQUANT: TBCDField;
    QItensVALOR: TBCDField;
    QItensVALOR_CUSTO: TBCDField;
    QItensPRODUTO_PROMOCAO: TStringField;
    QItensCANCELADO: TIntegerField;
    QItensVENDA_CANCELADA: TIntegerField;
    QItensCOD_VEND: TIntegerField;
    QItensSTATUS_EXPORTA: TIntegerField;
    QVendas: TFDQuery;
    QVendasCOD_VEN: TIntegerField;
    QVendasDATA_VEN: TDateField;
    QVendasCOD_EMP: TIntegerField;
    QVendasCOD_CAI: TIntegerField;
    QVendasCOD_CLI: TIntegerField;
    QVendasDESCONTO_VEN: TBCDField;
    QVendasCOD_TPV: TIntegerField;
    QVendasTOTAL_VEN: TBCDField;
    QVendasCUPOM_FISCAL_VEN: TIntegerField;
    QVendasTOTAL_CUSTO_VEN: TBCDField;
    QVendasDATA_HORA_VEN: TSQLTimeStampField;
    QVendasDESC_PESSOA_AUTORIZADA: TStringField;
    QVendasCOD_NF: TIntegerField;
    QVendasCOD_USU: TIntegerField;
    QVendasCANCELADA_VEN: TIntegerField;
    QVendasCODIGO_PAF: TIntegerField;
    QVendasR04_CCF: TIntegerField;
    QVendasR04_NOME_CLIENTE: TStringField;
    QVendasR04_CNPJ_CLIENTE: TStringField;
    QVendasNUMERO_NOTA_FISCAL: TIntegerField;
    QVendasCOD_VEND: TIntegerField;
    QVendasSERIE_NOTA_FISCAL: TStringField;
    QVendasCODIFICACAO_FISCAL: TStringField;
    QVendasCER: TIntegerField;
    RelDetalhado: TfrxReport;
    frxVendas: TfrxDBDataset;
    frxItens: TfrxDBDataset;
    QRelItens: TFDQuery;
    QRelItensCOD_VEN: TIntegerField;
    QRelItensCOD_PRO: TIntegerField;
    QRelItensORDEM: TIntegerField;
    QRelItensDESCONTO: TBCDField;
    QRelItensCOD_EMP: TIntegerField;
    QRelItensQUANT: TBCDField;
    QRelItensVALOR: TBCDField;
    QRelItensVALOR_CUSTO: TBCDField;
    QRelItensPRODUTO_PROMOCAO: TStringField;
    QRelItensCANCELADO: TIntegerField;
    QRelItensVENDA_CANCELADA: TIntegerField;
    QRelItensCOD_VEND: TIntegerField;
    QRelItensSTATUS_EXPORTA: TIntegerField;
    btnDetalhado: TBitBtn;
    frxRichObject1: TfrxRichObject;
    QRelItensNOME_PRO: TStringField;
    QRelItensUNID: TStringField;
    QRelVendasCANCELADA_VEN: TIntegerField;
    QRelItensTOTAL: TCurrencyField;
    GroupBox2: TGroupBox;
    cbVendedor: TComboBox;
    opVendedor: TCheckBox;
    QVendedor: TFDQuery;
    QVendedorCOD_VEND: TIntegerField;
    QVendedorNOME_VEND: TStringField;
    QVendedorATIVO_VEND: TStringField;
    QVendedorCOMISSAO_VEND: TBCDField;
    Button2: TButton;
    QRomaneio: TFDQuery;
    QRomaneioCOD_PRO: TIntegerField;
    QRomaneioDESC_CUPOM: TStringField;
    QRomaneioSUM: TBCDField;
    RelRomaneio: TfrxReport;
    frxQRomaneio: TfrxDBDataset;
    Button3: TButton;
    Button4: TButton;
    Qdvendas: TClientDataSet;
    dsQdVendas: TDataSource;
    Qdvendascod_venda: TIntegerField;
    cdsFormas: TClientDataSet;
    cdsFormasforma: TStringField;
    cdsFormasvalor: TCurrencyField;
    frxFormas: TfrxDBDataset;
    RelSimples: TfrxReport;
    QFormasVendas: TFDQuery;
    QFormasVendasCOD_VENDA: TIntegerField;
    QFormasVendasCOD_FORMA: TIntegerField;
    QFormasVendasVALOR: TBCDField;
    QFormasVendasDESCRICAO: TStringField;
    frxFormasVendas: TfrxDBDataset;
    procedure CheckTipoVendaClick(Sender: TObject);
    procedure CheckCliClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckCaixaClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnConsCliClick(Sender: TObject);
    procedure EdtCodCliKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodCliExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnVisClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtCodCliEnter(Sender: TObject);
    procedure todosopClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure QRelVendasAfterScroll(DataSet: TDataSet);
    procedure QRelItensCalcFields(DataSet: TDataSet);
    procedure opVendedorClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CIDADE: String;
    Regiao: Integer;
    RegiaoDescricao: String;
  end;

var
  FrmRelVendas: TFrmRelVendas;

implementation
uses
  Udm, Ubibli1, UConsCli, UQRelVendas, UNovoPrincipal, UDialog, UConsMunicipios, 
  UConsRegiao, USelVendasRel;
var  sSql : string;

{$R *.dfm}

procedure TFrmRelVendas.CheckTipoVendaClick(Sender: TObject);
begin 
   if CheckTipoVenda.Checked then
      begin 
         ComboTipoVenda.ItemIndex:= -1;
         GBTipoVenda.Enabled     := false;
      end
   else
      begin 
         GBTipoVenda.Enabled     := true;
         ComboTipoVenda.ItemIndex:= 0;
         ComboTipoVenda.SetFocus;
      end;
end;

procedure TFrmRelVendas.CheckCliClick(Sender: TObject);
begin 
   if CheckCli.Checked then
      begin 
         EdtCodCli.Clear;
         EdtNomeCli.Clear;
         EdtCodCli.Enabled  := false;
         EdtNomeCli.Enabled := false;
         BtnConsCli.Enabled := false;
      end
   else
      begin 
         EdtCodCli.Enabled  := true;
         EdtNomeCli.Enabled := true;
         BtnConsCli.Enabled := true;
         EdtCodCli.SetFocus;
      end;
end;

procedure TFrmRelVendas.FormCreate(Sender: TObject);
begin 
   { BUSCA CAIXA }
   
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   ComboCaixa.Clear;
   with dm.QConsulta do
      begin 
         sql.Clear;
         sql.Add('SELECT COD_CAI, DESC_CAI FROM CAIXA ORDER BY COD_CAI');
         open;
         First;
         while not eof do
           begin 
              ComboCaixa.Items.Add(FormataStringD(fieldbyname('cod_cai').AsString, '2', '0') + ' - ' +
                                   fieldbyname('desc_cai').AsString);
              next;
           end;
      end;
   dm.IBTransaction.Commit;
   dm.QConsulta.Close;


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

   { BUSCA TIPO DE VENDA }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   ComboTipoVenda.Clear;
   with dm.QConsulta do
      begin 
         sql.Clear;
         sql.Add('SELECT COD_TPV, NOME_TPV FROM TIPO_VENDA ORDER BY COD_TPV');
         open;
         First;
         while not eof do
           begin 
              ComboTipoVenda.Items.Add(FormataStringD(fieldbyname('cod_tpv').AsString, '2', '0') + ' - ' +
                                   fieldbyname('nome_tpv').AsString);
              next;
           end;
      end;

   { BUSCA VENDEDOR }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   cbVendedor.Clear;
   with dm.QConsulta do
      begin 
         sql.Clear;
         sql.Add('SELECT * FROM VENDEDOR');
         open;
         First;
         while not eof do
           begin 
               cbVendedor.Items.Add( FormataStringD( FieldByName('COD_VEND').AsString , '3', '0') +
               ' - ' + FieldByName('NOME_VEND').AsString );
              next;
           end;
      end;
   dm.IBTransaction.Commit;
   dm.QConsulta.Close;
   Qdvendas.CreateDataSet;

   Qdvendas.Open;
      Qdvendas.EmptyDataSet;
end;

procedure TFrmRelVendas.FormShow(Sender: TObject);
begin 
   sSql:= QRelVendas.SQL.Text;
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;
   CheckTipoVenda.Checked:= true;
   CheckCli.Checked      := true;
   CheckCaixa.Checked    := true;
   TodosOp.Checked := true;
   opVendedor.Checked := True;
   edtdataini.SetFocus;
end;

procedure TFrmRelVendas.opVendedorClick(Sender: TObject);
begin 
   if opVendedor.Checked then
      begin 
         cbVendedor.ItemIndex:= -1;
      end
   else
      begin 
         cbVendedor.ItemIndex:= 0;
         cbVendedor.SetFocus;
      end;
end;

procedure TFrmRelVendas.QRelItensCalcFields(DataSet: TDataSet);
begin 
   QRelItensTOTAL.AsCurrency := ( QRelItensQUANT.AsCurrency * QRelItensVALOR.AsCurrency  ) -
   QRelItensDESCONTO.AsCurrency;
end;

procedure TFrmRelVendas.QRelVendasAfterScroll(DataSet: TDataSet);
begin 
   if not QRelVendasCOD_VEN.IsNull then
      begin 
         QRelItens.Close;
         QRelItens.ParamByName( 'COD_VEN' ).AsInteger := QRelVendasCOD_VEN.AsInteger;
         QRelItens.ParamByName( 'COD_EMP' ).AsInteger := QRelVendasCOD_EMP.AsInteger;
         QRelItens.Open;
         QFormasVendas.Close;
         QFormasVendas.ParamByName( 'COD_VENDA' ).AsInteger := QRelVendasCOD_VEN.AsInteger;
         QFormasVendas.Open;

      end
   else
       begin 
          QRelItens.Close;
          QFormasVendas.Close;
       end;
end;

procedure TFrmRelVendas.todosopClick(Sender: TObject);
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

procedure TFrmRelVendas.CheckCaixaClick(Sender: TObject);
begin 
   if CheckCaixa.Checked then
      begin 
         ComboCaixa.ItemIndex:= -1;
         GBCaixa.Enabled     := false;
      end
   else
      begin 
         GBCaixa.Enabled     := true;
         ComboCaixa.ItemIndex:= 0;
         ComboCaixa.SetFocus;
      end;
end;

procedure TFrmRelVendas.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelVendas.BtnConsCliClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsCli, FrmConsCli);
   FrmConsCli.tag:= 14;
   FrmConsCli.showmodal;
end;

procedure TFrmRelVendas.EdtCodCliKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmRelVendas.EdtCodCliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      btnConsCli.click;
end;

procedure TFrmRelVendas.EdtCodCliExit(Sender: TObject);
begin 
   if btnsair.Focused then
      exit;
   edtnomecli.text:= Consulta('cliente', edtcodcli, 'cod_cli', 'nome_cli', dm.IBTransaction, dm.qConsulta);
   if edtnomecli.Text = '' then
      begin 
         AlertaCad('Cliente não Cadastrado');
//         edtcodcli.SetFocus;
      end;
end;

procedure TFrmRelVendas.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmRelVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmRelVendas.BtnVisClick(Sender: TObject);
var
  Totais, teste: String;
  I, TPV: integer;
  SubTotal: Double;
  Arquivo: string;
  Arquivo2: string;
begin 
   Arquivo := ExtractFilePath( Application.ExeName ) + 'Report\VendasDetalhadas.fr3';
   Arquivo2 := ExtractFilePath( Application.ExeName ) + 'Report\VendasSimples.fr3';
   if not FileExists( Arquivo ) then
      begin 
         KDialog( 'Arquivo VendasDetalhadas.fr3 não encontrado!' );
         Exit;
      end;
   if not FileExists( Arquivo2 ) then
      begin 
         KDialog( 'Arquivo VendasSimples.fr3 não encontrado!' );
         Exit;
      end;
   RelDetalhado.LoadFromFile( Arquivo );
   RelSimples.LoadFromFile( Arquivo2 );
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QRelVendas do
      begin 
         close;
         sql.Clear;
         sql.Text:= sSql;
         sql.Add(' WHERE V.DATA_VEN BETWEEN :DATAINI AND :DATAFIN ' +
                 ' AND V.CANCELADA_VEN = 0 ');

         if edtcodcli.Text <> '' then
            sql.Add(' AND V.COD_CLI = ' + edtcodcli.Text);

         if ComboCaixa.ItemIndex > -1 then
            sql.Add(' AND V.COD_CAI = ' + copy(ComboCaixa.Text, 1, 2));

         if ComboTipoVenda.ItemIndex > -1 then
            sql.Add(' AND V.COD_TPV = ' + copy(ComboTipoVenda.Text, 1, 2));

         if Operador.ItemIndex > -1  then
              sql.Add(' AND V.COD_USU =' + copy(Operador.Text, 1, 2));

         if (not CheckEmp.Checked) then
            begin 
               sql.Add(' AND V.COD_EMP = :CODEMP');
               Parambyname('codemp').AsInteger:= iEmp;
            end;

         if ( not opVendedor.Checked ) then
            begin 
               sql.Add(' AND V.COD_VEND = :CODVEND');
               Parambyname('CODVEND').AsString:= Copy( cbVendedor.Text, 1, 3 );
            end;


         sql.Add(' ORDER BY V.DATA_VEN, V.COD_VEN');
         Parambyname('dataini').AsDate:= edtdataini.Date;
         Parambyname('datafin').AsDate:= EdtDataFin.Date;
         open;
      end;

   Application.CreateForm(TFrmQRelVendas, FrmQRelVendas);
   FrmQRelVendas.QRLNomeEmpresa.Caption := frmmenu.SB.Panels[3].Text;
   RelDetalhado.Variables['EMPRESA'] := QuotedStr( frmmenu.SB.Panels[3].Text );
   RelSimples.Variables['EMPRESA'] := QuotedStr( frmmenu.SB.Panels[3].Text );
   FrmQRelVendas.QRLTitulo.Caption      := 'Relatório de Vendas no período: ' + datetostr(EdtDataIni.Date) + ' a ' + datetostr(edtdatafin.Date);
   RelDetalhado.Variables['DATAINI'] := QuotedStr( datetostr(EdtDataIni.Date) );
   RelSimples.Variables['DATAINI'] := QuotedStr( datetostr(EdtDataIni.Date) );
   RelDetalhado.Variables['DATAFIM'] := QuotedStr( datetostr(EdtDataFin.Date) );
   RelSimples.Variables['DATAFIM'] := QuotedStr( datetostr(EdtDataFin.Date) );
   if ComboCaixa.ItemIndex > -1 then
      begin 
          FrmQRelVendas.QRLCaixa.Caption:= 'Caixa = ' + ComboCaixa.Text;
          RelDetalhado.Variables['CAIXA'] := QuotedStr( ComboCaixa.Text );
          RelSimples.Variables['CAIXA'] := QuotedStr( ComboCaixa.Text );
      end
   else
      begin 
          FrmQRelVendas.QRLCaixa.Caption:= 'Caixa = Todos';
          RelDetalhado.Variables['CAIXA'] := QuotedStr( 'Todos' );
          RelSimples.Variables['CAIXA'] := QuotedStr( 'Todos' );
      end;

   if Operador.ItemIndex > -1 then
      begin 
          FrmQRelVendas.QRLCaixa.Caption := FrmQRelVendas.QRLCaixa.Caption + '    Operador = ' + Operador.Text;
          RelDetalhado.Variables['OPERADOR'] := QuotedStr(  Operador.Text );
          RelSimples.Variables['OPERADOR'] := QuotedStr(  Operador.Text );
      end
   else
       begin 
          FrmQRelVendas.QRLCaixa.Caption := FrmQRelVendas.QRLCaixa.Caption + '    Operador = TODOS';
          RelDetalhado.Variables['OPERADOR'] := QuotedStr( 'Todos' );
          RelSimples.Variables['OPERADOR'] := QuotedStr( 'Todos' );
       end;

   if ComboTipoVenda.ItemIndex > -1 then
      begin 

         RelDetalhado.Variables['TIPO_VENDA'] := QuotedStr(  ComboTipoVenda.Text );
         RelSimples.Variables['TIPO_VENDA'] := QuotedStr(  ComboTipoVenda.Text );
      end
   else
      begin 
         RelDetalhado.Variables['TIPO_VENDA'] := QuotedStr( 'Todos' );
         RelSimples.Variables['TIPO_VENDA'] := QuotedStr( 'Todos' );
      end;
   if CheckCli.Checked then
      begin 
         RelDetalhado.Variables['CLIENTE'] := QuotedStr( 'Todos' );
         RelSimples.Variables['CLIENTE'] := QuotedStr( 'Todos' );
      end
   else
      begin 
         RelDetalhado.Variables['CLIENTE'] := QuotedStr( EdtCodCli.Text +
           ' - ' + EdtNomeCli.Text );
           RelSimples.Variables['CLIENTE'] := QuotedStr( EdtCodCli.Text +
           ' - ' + EdtNomeCli.Text );
      end;
   if opVendedor.Checked then
      begin 
         RelDetalhado.Variables['VENDEDOR'] := QuotedStr( 'Todos' );
         RelSimples.Variables['VENDEDOR'] := QuotedStr( 'Todos' );
      end
   else
      begin 
         RelDetalhado.Variables['VENDEDOR'] := QuotedStr( cbVendedor.Text );
         RelSimples.Variables['VENDEDOR'] := QuotedStr( cbVendedor.Text );
      end;
   // ROTINA NOVA

   if cdsFormas.Active then
      cdsFormas.Close;
   cdsFormas.CreateDataSet;
   cdsFormas.Open;
   cdsFormas.EmptyDataSet;

   SubTotal := 0;
   TPV := ComboTipoVenda.Items.Count;
   Totais := '';
   for I := 0 to TPV -1 do
      begin 
         Vendas.Close;
         Vendas.SQL.Clear;
         Teste := copy(ComboTipoVenda.Items[I], 1, 2);
         Vendas.SQL.Add('select SUM( TOTAL_VEN ) TOTAL from VENDAS where DATA_VEN BETWEEN :DATAINI AND :DATAFIN and COD_TPV=' + copy(ComboTipoVenda.Items[I], 1, 2) );
         if not CheckEmp.Checked then
            begin 
               Vendas.SQL.Add( ' and COD_EMP=' + IntTostr( IEmp ) );
            end;
         if not CheckCaixa.Checked then
            begin 
               Vendas.SQL.Add( ' and COD_CAI=' + copy(ComboCaixa.Text, 1, 2));
            end;
         if not CheckCli.Checked then
            begin 
               Vendas.SQL.Add( ' and COD_CLI=' + edtcodcli.Text);
            end;
         if not TodosOp.Checked then
            begin 
               Vendas.SQL.Add( ' and COD_USU=' + copy(Operador.Text, 1, 2));
            end;
         if ( not opVendedor.Checked ) then
            begin 
               Vendas.sql.Add(' ANd COD_VEND = :CODVEND');
               Vendas.Parambyname('CODVEND').AsString:= Copy( cbVendedor.Text, 1, 3 );
            end;
         vendas.Parambyname('dataini').AsDate:= edtdataini.Date;
         vendas.Parambyname('datafin').AsDate:= EdtDataFin.Date;
         vendas.Open;
         if Vendas.FieldByName( 'TOTAL' ).AsFloat > 0 then
            begin 
               cdsFormas.Insert;
               cdsFormasforma.AsString := ComboTipoVenda.Items[I] + ' : ';
               cdsFormasvalor.AsCurrency := Vendas.FieldByName( 'TOTAL' ).AsFloat;
               cdsFormas.Post;
            end;

         SubTotal := SubTotal + Vendas.FieldByName( 'TOTAL' ).AsFloat;

      end;
      RelDetalhado.Variables['SUBTOTAL'] := QuotedStr( FormatFloat( 'R$ 0.00', Subtotal ) );
      RelSimples.Variables['SUBTOTAL'] := QuotedStr( FormatFloat( 'R$ 0.00', Subtotal ) );
   // FIM

   if sender = btnvis then
      begin 
         RelSimples.ShowReport;
      end
   else if sender = btnDetalhado then
        begin 
           RelDetalhado.ShowReport;
        end
        else
            begin 
               RelSimples.ShowReport;
            end;

   FrmQRelVendas.QRVendas.QRPrinter:= nil;
   dm.IBTransaction.Commit;
   QRelVendas.SQL.Clear;
   QRelVendas.SQL.Text:= sSql;
   QRelVendas.close;
end;

procedure TFrmRelVendas.Button1Click(Sender: TObject);
var
   sVendas, sItens: TStrings;
begin 
   sVendas := TStringList.Create;
   sItens := TStringList.Create;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   QVendas.SQL.Text := 'Select * from VENDAS WHERE COD_EMP=:COD_EMP and DATA_VEN BETWEEN :DATAINI AND :DATAFIN;';
   Qvendas.ParamByName( 'DATAINI' ).AsDate := EdtDataini.DateTime;
   Qvendas.ParamByName( 'DATAFIN' ).AsDate := EdtDatafin.DateTime;
   Qvendas.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
   QVendas.Open;
   if not QVendas.IsEmpty then
      begin 
         QVendas.First;
         while not QVendas.Eof do
             begin 
                sVendas.Add( QVendasCOD_VEN.AsString + '|' +
                QVendasCOD_VEN.AsString + '|' +
                QVendasDATA_VEN.AsString + '|' +
                QVendasCOD_EMP.AsString + '|' +
                QVendasCOD_CAI.AsString + '|' +
                QVendasCOD_CLI.AsString + '|' +
                QVendasDESCONTO_VEN.AsString + '|' +
                QVendasCOD_TPV.AsString + '|' +
                QVendasTOTAL_VEN.AsString + '|' +
                QVendasCUPOM_FISCAL_VEN.AsString + '|' +
                QVendasTOTAL_CUSTO_VEN.AsString + '|' +
                QVendasDATA_HORA_VEN.AsString + '|' +
                QVendasDESC_PESSOA_AUTORIZADA.AsString + '|' +
                QVendasCOD_NF.AsString + '|' +
                QVendasCOD_USU.AsString + '|' +
                QVendasCANCELADA_VEN.AsString + '|' +
                QVendasCODIGO_PAF.AsString + '|' +
                QVendasR04_CCF.AsString + '|' +
                QVendasR04_NOME_CLIENTE.AsString + '|' +
                QVendasR04_CNPJ_CLIENTE.AsString + '|' +
                QVendasNUMERO_NOTA_FISCAL.AsString + '|' +
                QVendasCOD_VEND.AsString + '|' +
                QVendasSERIE_NOTA_FISCAL.AsString + '|' +
                QVendasCODIFICACAO_FISCAL.AsString + '|' +
                QVendasCER.AsString);

                QItens.Close;
                QItens.SQL.Text := 'Select * from itens_venda where COD_VEN=' + QVendasCOD_VEN.AsString;
                QItens.open;
                if not Qitens.IsEmpty then
                   begin 
                      QItens.First;
                      while not QItens.Eof do
                          begin 
                             sItens.Add( QItensCOD_VEN.AsString + '|' +
                             QItensCOD_PRO.AsString + '|' +
                             QItensORDEM.AsString + '|' +
                             QItensDESCONTO.AsString + '|' +
                             QItensCOD_EMP.AsString + '|' +
                             QItensQUANT.AsString + '|' +
                             QItensVALOR.AsString + '|' +
                             QItensVALOR_CUSTO.AsString + '|' +
                             QItensPRODUTO_PROMOCAO.AsString + '|' +
                             QItensCANCELADO.AsString + '|' +
                             QItensVENDA_CANCELADA.AsString + '|' +
                             QItensCOD_VEND.AsString + '|' +
                             QItensSTATUS_EXPORTA.AsString );
                             QItens.Next;
                          end;
                   end;
                QItens.Close;
                QVendas.Next;
             end;
   QVendas.Close;
   sVendas.SaveToFile( 'C:\Vendas_' + FormatDateTime( 'dd_mm_yyyy', date ) + '.txt' );
   sItens.SaveToFile( 'C:\Itens_' + FormatDateTime( 'dd_mm_yyyy', date ) + '.txt' );
   AlertaCad( 'Arquivos gerados :' + #13 +
    'C:\Vendas_' + FormatDateTime( 'dd_mm_yyyy', date ) + '.txt' + #13 +
     'C:\Itens_' + FormatDateTime( 'dd_mm_yyyy', date ) + '.txt' );
      end
        else
          AlertaCad( 'Sem vendas neste periodo!' );

end;

procedure TFrmRelVendas.Button2Click(Sender: TObject);
var
   Arquivo: String;
begin 
   Arquivo := ExtractFilePath( Application.ExeName ) + 'Report\Romaneio.fr3';
   if not FileExists( Arquivo ) then
      begin 
         KDialog( 'Arquivo Romaneio.fr3 não encontrado!' );
         Exit;
      end;
   CIDADE := '%';
   if KDialog( 'Deseja Selecionar a Cidade?', 'Pergunta', tdtPergunta ) then
       begin 
            Application.CreateForm(TFrmConsMunicipios, FrmConsMunicipios);
            FrmConsMunicipios.Tag := 4;
            FrmConsMunicipios.ShowModal;
       end;
   RelRomaneio.LoadFromFile( Arquivo );
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;

   QRomaneio.Close;
   QRomaneio.SQL.Text := 'select i.cod_pro, p.desc_cupom, sum (i.quant ) from itens_venda i' +
        ' inner join vendas v ' +
        ' on ( v.cod_ven = I.cod_ven )' +
        ' inner join produto p' +
        ' on ( p.cod_pro = i.cod_pro ) ' +
        ' inner join cliente cli '+
        ' on ( cli.cod_cli = v.cod_cli )' +
        ' where v.data_ven between :dataini and :datafim ' +
        ' and v.cod_emp = :cod_emp and cli.cidres_cli like :cidade '+
        ' group by i.cod_pro, p.desc_cupom';

   QRomaneio.ParamByName( 'dataini' ).AsDate := EdtDataIni.Date;
   QRomaneio.ParamByName( 'datafim' ).AsDate := EdtDataFin.Date;
   QRomaneio.ParamByName( 'cidade' ).AsString := CIDADE;
   QRomaneio.ParamByName( 'cod_emp' ).AsInteger := iEmp;
   QRomaneio.Open;

   RelRomaneio.Variables['DATAINI'] := QuotedStr( DateToStr( EdtDataIni.Date ) );
   if CIDADE <> '%'  then
      RelRomaneio.Variables['DATAFIM'] := QuotedStr( DateToStr( EdtDataFin.Date )+
      '     Cidade : ' + CIDADE)
   else
      RelRomaneio.Variables['DATAFIM'] := QuotedStr( DateToStr( EdtDataFin.Date ) +
      '     Cidade : Todas' );

   RelRomaneio.ShowReport( True );
   dm.IBTransaction.Commit;
end;

procedure TFrmRelVendas.Button3Click(Sender: TObject);
var
   Arquivo: String;
begin 
   Arquivo := ExtractFilePath( Application.ExeName ) + 'Report\Romaneio.fr3';
   if not FileExists( Arquivo ) then
      begin 
         KDialog( 'Arquivo Romaneio.fr3 não encontrado!' );
         Exit;
      end;
   CIDADE := '%';
   Application.CreateForm(TfrmConsRegiao, frmConsRegiao);
   frmConsRegiao.Tag := 3;
   if frmConsRegiao.ShowModal <> mrOk then
     Exit;


  RelRomaneio.LoadFromFile( Arquivo );
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;

   QRomaneio.Close;
   QRomaneio.SQL.Text := 'select i.cod_pro, p.desc_cupom, ' +
   ' sum (i.quant ) from itens_venda i' +
   ' inner join vendas v' +
    ' on ( v.cod_ven = I.cod_ven )' +
    ' inner join produto p' +
    ' on ( p.cod_pro = i.cod_pro ) ' +
    ' inner join cliente cli ' +
    ' on ( cli.cod_cli = v.cod_cli ) ' +
    ' where v.data_ven between :dataini and :datafim ' +
    ' and v.cod_emp = :cod_emp ' +
    ' and cli.cidres_cli in ( select descricao from regiao_cidades where cod_regiao=:regiao ) group by i.cod_pro, p.desc_cupom';

   QRomaneio.ParamByName( 'dataini' ).AsDate := EdtDataIni.Date;
   QRomaneio.ParamByName( 'datafim' ).AsDate := EdtDataFin.Date;
   QRomaneio.ParamByName( 'regiao' ).AsInteger := Regiao;
   QRomaneio.ParamByName( 'cod_emp' ).AsInteger := iEmp;
   QRomaneio.Open;

   RelRomaneio.Variables['DATAINI'] := QuotedStr( DateToStr( EdtDataIni.Date ) );
      RelRomaneio.Variables['DATAFIM'] := QuotedStr( DateToStr( EdtDataFin.Date )+
      '     Região : ' + RegiaoDescricao);

   RelRomaneio.ShowReport( True );
   dm.IBTransaction.Commit;
end;


procedure TFrmRelVendas.Button4Click(Sender: TObject);
var
   Arquivo: String;
begin 

   Arquivo := ExtractFilePath( Application.ExeName ) + 'Report\Romaneio.fr3';
   if not FileExists( Arquivo ) then
      begin 
         KDialog( 'Arquivo Romaneio.fr3 não encontrado!' );
         Exit;
      end;
      Application.CreateForm(  TfrmSelVendasRel, frmSelVendasRel );
      if frmSelVendasRel.ShowModal <> mrOk then
          Exit;
      if Qdvendas.IsEmpty then
          Exit;
   CIDADE := '%';


  RelRomaneio.LoadFromFile( Arquivo );
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;

   QRomaneio.Close;
   QRomaneio.SQL.Text := 'select i.cod_pro, p.desc_cupom, ' +
   ' sum (i.quant ) from itens_venda i' +
   ' inner join vendas v' +
    ' on ( v.cod_ven = I.cod_ven )' +
    ' inner join produto p' +
    ' on ( p.cod_pro = i.cod_pro ) ' +
    ' inner join cliente cli ' +
    ' on ( cli.cod_cli = v.cod_cli ) ' +
    ' where ' +
    ' v.cod_emp = :cod_emp ' +
    ' and v.cod_ven in(';

   Qdvendas.First;
   while not Qdvendas.Eof do
       begin 
          if Qdvendas.Bof then
             QRomaneio.SQL.Add( Qdvendascod_venda.AsString )
          else
             QRomaneio.SQL.Add( ',' + Qdvendascod_venda.AsString );
          Qdvendas.Next;
       end;
   QRomaneio.SQL.Add( ') group by i.cod_pro, p.desc_cupom');

   QRomaneio.ParamByName( 'cod_emp' ).AsInteger := iEmp;
   QRomaneio.Open;

   RelRomaneio.Variables['DATAINI'] := QuotedStr( 'Romaneio Por vendas' );
      RelRomaneio.Variables['DATAFIM'] := QuotedStr( 'Romaneio Por vendas' );

   RelRomaneio.ShowReport( True );
   dm.IBTransaction.Commit;
end;

procedure TFrmRelVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Qdvendas.CloSe;
   Action:= caFree;
end;

procedure TFrmRelVendas.EdtCodCliEnter(Sender: TObject);
begin 
   EdtCodCli.SelectAll;
end;

end.
