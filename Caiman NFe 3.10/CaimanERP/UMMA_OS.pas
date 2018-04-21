unit UMMA_OS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, IBTable, ComCtrls, StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, 
  UConsCli, DBCtrls, Mask, Menus, sMaskEdit, sCustomComboEdit, sTooledit, 
  rxToolEdit, RXDBCtrl, acPNG, RzEdit, rxCurrEdit, RDprint, frxClass, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmMMA_OS = class(UNovoFormulario.TForm)
    DOS: TDataSource;
    BuscaOS: TFDQuery;
    BuscaOSCOD: TIntegerField;
    BuscaOSDATA_ENTRADA: TDateField;
    BuscaOSDATA_ORCAMENTO: TDateField;
    BuscaOSDATA_FECHAMENTO: TDateField;
    BuscaOSSTATUS: TStringField;
    BuscaOSCOD_EMP: TIntegerField;
    BuscaOSCOD_CAI: TIntegerField;
    BuscaOSVENDEDOR: TStringField;
    BuscaOSCOD_CLI: TIntegerField;
    BuscaOSCLIENTE: TStringField;
    BuscaOSTELEFONE: TStringField;
    BuscaOSCOD_USU: TIntegerField;
    BuscaOSCOD_TPV: TIntegerField;
    BuscaOSTIPO_VENDA: TStringField;
    BuscaOSRETORNO: TStringField;
    BuscaOSCOD_RETORNO: TIntegerField;
    BuscaOSAPARELHO_MODELO: TStringField;
    BuscaOSAPARELHO_MARCA: TStringField;
    BuscaOSAPARELHO_SERIE: TStringField;
    BuscaOSCARRO_MODELO: TStringField;
    BuscaOSCARRO_MARCA: TStringField;
    BuscaOSCARRO_CHASSI: TStringField;
    BuscaOSCARRO_ANO_FAB: TStringField;
    BuscaOSTOTAL_PROD: TFloatField;
    BuscaOSDESCONTO: TFloatField;
    BuscaOSSUB_TOTAL: TFloatField;
    DBuscaOS: TDataSource;
    Paginas: TPageControl;
    Consulta: TTabSheet;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Busca: TEdit;
    DBGrid1: TDBGrid;
    TR_OS: TFDTransaction;
    Panel1: TPanel;
    Itens: TFDQuery;
    DItens: TDataSource;
    Panel2: TPanel;
    cancelar: TsSpeedButton;
    salvar: TsSpeedButton;
    Panel3: TPanel;
    novo: TsSpeedButton;
    editar: TsSpeedButton;
    excluir: TsSpeedButton;
    Abertura: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    COD_CLIENTE: TEdit;
    BtnAddCli: TsSpeedButton;
    BtnConsCli: TsSpeedButton;
    Cliente: TEdit;
    Label4: TLabel;
    cod_vend: TEdit;
    Label5: TLabel;
    vendedor: TEdit;
    BtnConsVend: TsSpeedButton;
    BtnAddVend: TsSpeedButton;
    Label6: TLabel;
    DBText1: TDBText;
    PaginasOS: TPageControl;
    pagina1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    status: TDBComboBox;
    Label10: TLabel;
    Label11: TLabel;
    vendedoros: TDBEdit;
    cod_vende: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    cod_cliente_os: TDBEdit;
    Label14: TLabel;
    cliente_os: TDBEdit;
    SpeedButton1: TsSpeedButton;
    SpeedButton2: TsSpeedButton;
    comando: TFDQuery;
    Fechamento: TTabSheet;
    sql: TFDQuery;
    PopupMenu1: TPopupMenu;
    CancelarOSSelecionada1: TMenuItem;
    RetornodestaOS1: TMenuItem;
    Historico: TFDQuery;
    DHistorico: TDataSource;
    HistoricoCOD: TIntegerField;
    HistoricoCOD_OS: TIntegerField;
    HistoricoDATA: TDateField;
    HistoricoDESCRICAO: TStringField;
    Label18: TLabel;
    telefone: TDBEdit;
    GroupBox1: TGroupBox;
    Label15: TLabel;
    aparelho_modelo: TDBEdit;
    Label16: TLabel;
    aparelho_marca: TDBEdit;
    Label17: TLabel;
    aparelho_serie: TDBEdit;
    ItensCOD: TIntegerField;
    ItensCOD_OS: TIntegerField;
    ItensCOD_PROD: TIntegerField;
    ItensDESCRICAO: TStringField;
    ItensUNID: TStringField;
    ItensQUANT: TFloatField;
    ItensVALOR_UNID: TFloatField;
    ItensDESCONTO: TFloatField;
    ItensVALOR_TOTAL: TFloatField;
    GroupBox2: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    modelo_veiculo: TDBEdit;
    marca_veiculo: TDBEdit;
    chassi_veiculo: TDBEdit;
    Label22: TLabel;
    ano_veiculo: TDBEdit;
    Label23: TLabel;
    os_retorno: TDBEdit;
    Retorno: TDBRadioGroup;
    TabSheet4: TTabSheet;
    Label24: TLabel;
    defeito_reclamado: TDBMemo;
    Label25: TLabel;
    obs: TDBMemo;
    BuscaOSDEFEITO_RECLAMADO: TWideMemoField;
    BuscaOSOBS: TWideMemoField;
    BuscaOSTECNICO: TStringField;
    Label26: TLabel;
    DBGrid2: TDBGrid;
    Label27: TLabel;
    DBGrid3: TDBGrid;
    data_entrada: TDBDateEdit;
    data_orcamento: TDBDateEdit;
    data_entrega: TDBDateEdit;
    SpeedButton3: TsSpeedButton;
    Image1: TImage;
    Image2: TImage;
    Label28: TLabel;
    cod_produto: TEdit;
    Label29: TLabel;
    descricao_produto: TEdit;
    Label30: TLabel;
    SpeedButton4: TsSpeedButton;
    SpeedButton5: TsSpeedButton;
    unidade: TEdit;
    Label31: TLabel;
    Label32: TLabel;
    valor_unid: TCurrencyEdit;
    Label33: TLabel;
    desconto: TCurrencyEdit;
    Label34: TLabel;
    total_item: TCurrencyEdit;
    SpeedButton6: TsSpeedButton;
    SpeedButton7: TsSpeedButton;
    Label35: TLabel;
    Panel4: TPanel;
    DBText2: TDBText;
    Label36: TLabel;
    Panel6: TPanel;
    desconto_os: TDBEdit;
    Label37: TLabel;
    Panel7: TPanel;
    DBText3: TDBText;
    data_evento: TDateEdit;
    Label38: TLabel;
    Label39: TLabel;
    descricao_evento: TEdit;
    SpeedButton8: TsSpeedButton;
    SpeedButton9: TsSpeedButton;
    Image3: TImage;
    Cobrar: TCheckBox;
    ItensCOBRAR: TStringField;
    Shape1: TShape;
    Label40: TLabel;
    Shape2: TShape;
    Label41: TLabel;
    entrega_p: TsSpeedButton;
    Envetosdeoramento1: TMenuItem;
    Autorizar1: TMenuItem;
    N1: TMenuItem;
    Label42: TLabel;
    Shape3: TShape;
    Shape4: TShape;
    Label43: TLabel;
    Shape7: TShape;
    Label46: TLabel;
    entrega_S: TsSpeedButton;
    Image4: TImage;
    abertura_retorno: TPanel;
    Label49: TLabel;
    Label50: TLabel;
    SpeedButton12: TsSpeedButton;
    SpeedButton13: TsSpeedButton;
    Panel9: TPanel;
    Button3: TButton;
    Button4: TButton;
    cod_vend_retorno: TEdit;
    vendedor_retorno: TEdit;
    Config: TsSpeedButton;
    imprimir: TsSpeedButton;
    quantidade: TCurrencyEdit;
    LegendaOficina: TPanel;
    Shape5: TShape;
    Label44: TLabel;
    Shape6: TShape;
    Label45: TLabel;
    RDprint1: TRDprint;
    QReceber: TFDQuery;
    QReceberCOD_CTR: TIntegerField;
    QReceberDATA_CTR: TDateField;
    QReceberVENCTO_CTR: TDateField;
    QReceberVALOR_CTR: TBCDField;
    QReceberDTPAGTO_CTR: TDateField;
    QReceberVLRPAGO_CTR: TBCDField;
    QReceberPARCELA_CTR: TIntegerField;
    QReceberPAGO: TStringField;
    Label47: TLabel;
    Shape8: TShape;
    Label48: TLabel;
    Panel8: TPanel;
    dbtxtTOTAL_SERVICOS: TDBText;
    QInsVenda: TFDQuery;
    QInsVendaCODVEN: TIntegerField;
    IBTRVenda: TFDTransaction;
    IBSQLVenda: TFDQuery;
    QAux: TFDQuery;
    btnExporta: TsSpeedButton;
    Shape9: TShape;
    Label51: TLabel;
    UpOs: TFDUpdateSQL;
    BuscaOSTOTAL_SERVICOS: TBCDField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PaginasChange(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BuscaKeyPress(Sender: TObject; var Key: Char);
    procedure OSAfterScroll(DataSet: TDataSet);
    procedure DOSDataChange(Sender: TObject; Field: TField);
    procedure novoClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BtnConsCliClick(Sender: TObject);
    procedure BtnAddCliClick(Sender: TObject);
    procedure BtnConsVendClick(Sender: TObject);
    procedure BtnAddVendClick(Sender: TObject);
    procedure COD_CLIENTEExit(Sender: TObject);
    procedure cod_vendExit(Sender: TObject);
    procedure cod_cliente_osExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cancelarClick(Sender: TObject);
    procedure salvarClick(Sender: TObject);
    procedure editarClick(Sender: TObject);
    procedure excluirClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure quantidadeExit(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure descontoExit(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure cod_produtoExit(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure FechamentoShow(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CancelarOSSelecionada1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure TabSheet4Show(Sender: TObject);
    procedure Autorizar1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure RetornodestaOS1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure cod_vend_retornoExit(Sender: TObject);
    procedure entrega_SClick(Sender: TObject);
    procedure entrega_pClick(Sender: TObject);
    procedure OSAfterEdit(DataSet: TDataSet);
    procedure statusChange(Sender: TObject);
    procedure imprimirClick(Sender: TObject);
    procedure ConfigClick(Sender: TObject);

    // LAVANDERIA
    procedure ImprimeEntrada;
    procedure ImprimeEntregue;
    procedure imprimir2Click(Sender: TObject);
    procedure btnExportaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    busca_campo: String;
    inserindo: Boolean;
    os_edit: Integer;

    buscaCodP: Integer;
    buscaDescP: string;
    buscaUnidP: string;
    buscaValorP: double;

    telefone_cliente: string;
  end;

var
  FrmMMA_OS: TFrmMMA_OS;

implementation

uses
  Udm, UCadCli, UConsVend, UCadVend, UDeletaOS, UConsProd, UCadProduto, 
  UMMA_ITENS, UMMA_Fechamento, UMMAREL_OS_ABERTURA, UMMA_REL_FECHAMENTO, 
  frmMMA_Config, UNovoPrincipal, UPrincipal;
{$R *.dfm}


procedure TFrmMMA_OS.imprimir2Click(Sender: TObject);
begin 
  //
  if Paginas.TabIndex = 0 then
     Exit;
  if BuscaOSCOD.IsNull then
     Exit;
  if BuscaOSSTATUS.AsString = 'ORÇAMENTO' then
     begin 
        ImprimeEntrada;
     end
  else if BuscaOSSTATUS.AsString  = 'ENTREGUE PRONTO' then
    begin 
        ImprimeEntregue;
    end;
end;

procedure TFrmMMA_OS.Autorizar1Click(Sender: TObject);
var
  motivo: string;
  datatemp: tdate;
begin 
  motivo := inputbox('Autorização de conserto', 'Autorizado por :', '');
  if motivo <> '' then
  begin 
//    BuscaOS.Close;
    comando.Close;
    comando.sql.Text :=
      'update MMA_ORDEM_SERVICO set STATUS=:STATUS where COD=:COD';
    comando.ParamByName('STATUS').AsString := 'AUTORIZADO';
    comando.ParamByName('COD').AsInteger := BuscaOSCOD.AsInteger;
    comando.ExecOrOpen;
    comando.Close;
    comando.sql.Text :=
      'insert into MMA_ORDEM_HISTORICO( COD_OS, DATA, DESCRICAO ) ' +
      'values( :COD_OS, current_date, :DESCRICAO )';
    comando.ParamByName('COD_OS').AsInteger := BuscaOSCOD.AsInteger;
    comando.ParamByName('DESCRICAO').AsString := 'Autorizado por: ' + motivo;
    comando.ExecOrOpen;
    comando.Close;
    TR_OS.CommitRetaining;
    BuscaOS.Close;
    BuscaOS.sql.Text :=
      'Select * from MMA_ORDEM_SERVICO where COD_EMP = :COD_EMP';
    if Busca.Text <> '' then

      case BuscaOS.FieldByName(busca_campo).DataType of
        ftDate:
          begin 
            try
              datatemp := StrtoDate(Busca.Text);
            except
              AlertaCad('Data informada inválida!');
              exit;
            end;
            BuscaOS.sql.Add(' AND ' + busca_campo + ' = :BUSCA;');
            BuscaOS.ParamByName('BUSCA').AsDate := datatemp;
          end;
        ftInteger, ftFloat:
          begin 
            BuscaOS.sql.Add(' AND ' + busca_campo + ' = :BUSCA;');
            BuscaOS.ParamByName('BUSCA').AsString := Busca.Text;
          end;
        ftString, ftWord, ftFixedChar, ftWideString, ftLongWord:
          begin 
            BuscaOS.sql.Add(' AND ' + busca_campo + ' LIKE :BUSCA;');
            BuscaOS.ParamByName('BUSCA').AsString := '%' + Busca.Text + '%';
          end;

      end;
    BuscaOS.ParamByName('COD_EMP').AsInteger := iEmp;
    BuscaOS.Open;
  end;
end;

procedure TFrmMMA_OS.BtnAddCliClick(Sender: TObject);
begin 
  BuscaFormulario( TFrmCadCli, True );
end;

procedure TFrmMMA_OS.BtnAddVendClick(Sender: TObject);
begin 
  BuscaFormulario( TFrmCadVend, True );
end;

procedure TFrmMMA_OS.BtnConsCliClick(Sender: TObject);
begin 
  Application.CreateForm(TFrmConsCli, FrmConsCli);
  FrmConsCli.tag := 43;
  FrmConsCli.showmodal;
end;

procedure TFrmMMA_OS.BtnConsVendClick(Sender: TObject);
begin 
  Application.CreateForm(TFrmConsVend, FrmConsVend);
  FrmConsVend.tag := 3;
  FrmConsVend.showmodal;
end;

procedure TFrmMMA_OS.btnExportaClick(Sender: TObject);
var
  COD_VENDA: Integer;
  Ordem: Integer;
begin 
//
   if BuscaOSSTATUS.AsString = 'PRONTO FINALIZAR' then
      begin 
       if IBTRVenda.Active then
          IBTRVenda.Commit;
       IBTRVenda.StartTransaction;
       try
       with QInsVenda do
        begin 
          Close;
          ParamByName('data').AsDate := Date;
          ParamByName('codemp').AsInteger := iEmp;
          ParamByName('codcai').AsInteger := iCaixa;
          ParamByName('datahora').AsDateTime := now;
          ParamByName('codusu').AsInteger := iCodUsu;
          ParamByName('cupom').AsInteger := 0;
          ParamByName('codcli').AsInteger := BuscaOSCOD_CLI.AsInteger;
          ParamByName('codvend').AsInteger := BuscaOSCOD_CAI.AsInteger;
          ParamByName('codtpv').AsInteger := 1;
          ParamByName('codfiscal').AsString := '';
          ParamByName('serie').AsString := '';
          ParamByName('numero').AsInteger := 0;
          ParamByName('cancelada').AsInteger := 0;
          ParamByName('ccf').AsInteger := 0;
          ParamByName('cer').AsInteger := 0;
          ParamByName('CONSIGNADA').AsString := 'N';

          Open;
          COD_VENDA := QInsVendaCODVEN.AsInteger;
          QAux.Close;
          QAux.SQL.Text := 'update vendas set OBS=:obs where COD_VEN=:cod_ven and COD_EMP=:cod_emp';
          QAux.ParamByName( 'cod_ven' ).AsInteger := QInsVendaCODVEN.AsInteger;
          QAux.ParamByName( 'cod_emp' ).AsInteger := iEmp;
          QAux.ParamByName( 'obs' ).AsString  := BuscaOSOBS.AsString;
          QAux.ExecOrOpen;
          QAux.Close;
        end;
        Itens.First;
        Ordem := 0;
        while not Itens.Eof do
           begin 
              with IBSQLVenda do
                begin 
                    Inc( Ordem );
                    Close;
                    SQL.Clear;
                    SQL.text :=
                         'INSERT INTO ITENS_VENDA (COD_VEN, COD_PRO, ORDEM, DESCONTO,      ' +
                         'COD_EMP, QUANT, VALOR, VALOR_CUSTO, PRODUTO_PROMOCAO, CANCELADO, ' +
                         'VENDA_CANCELADA, COD_VEND)                                       ' +
                        'VALUES(:CODVEN, :CODPRO, :ORDEM, :DESCONTO, :CODEMP, :QUANT,     ' +
                        ':VALOR, :CUSTO, :PROMOCAO, :CANCELADO, :VENDACANCEL, :CODVEND)';

                        ParamByName('codven').AsInteger := COD_VENDA;
                        ParamByName('codpro').AsInteger := ItensCOD_PROD.AsInteger;
                        ParamByName('ordem').AsInteger := Ordem;
                        ParamByName('desconto').AsCurrency := ItensDESCONTO.AsCurrency;
                        ParamByName('codemp').AsInteger := iEmp;
                        ParamByName('quant').AsCurrency := ItensQUANT.AsFloat;
                        ParamByName('valor').AsCurrency := ItensVALOR_UNID.AsCurrency;
                        ParamByName('custo').AsCurrency := 0;
                        ParamByName('promocao').AsString := 'N';
                        ParamByName('cancelado').AsInteger := 0;
                        ParamByName('vendacancel').AsInteger := 0;
                        ParamByName('codvend').AsInteger := BuscaOSCOD_CAI.AsInteger;
                        ExecOrOpen;
                end;

              Itens.Next;
           end;


           if BuscaOS.State <> dsEdit then
              BuscaOS.Edit;
           BuscaOSSTATUS.AsString := 'EXPORTADO';
           BuscaOS.Post;
           TR_OS.CommitRetaining;
           BuscaOs.Close;
           BuscaOs.Open;
           IBTRVenda.Commit;

       except
          on E: Exception do
             begin 
                AlertaCad( 'Erro ao exportar venda' + #13 + E.Message);
                if IBTRVenda.Active then
                   IBTRVenda.Rollback;
             end;
       end;


      end;

end;

procedure TFrmMMA_OS.BuscaKeyPress(Sender: TObject; var Key: Char);
var
  datatemp: TDatetime;

begin 
  if Key = #13 then
  begin 
    Key := #0;
    BuscaOS.Close;
    BuscaOS.sql.Text :=
      'Select * from MMA_ORDEM_SERVICO where COD_EMP = :COD_EMP';
    if Busca.Text <> '' then

      case BuscaOS.FieldByName(busca_campo).DataType of
        ftDate:
          begin 
            try
              datatemp := StrtoDate(Busca.Text);
            except
              AlertaCad('Data informada inválida!');
              exit;
            end;
            BuscaOS.sql.Add(' AND ' + busca_campo + ' = :BUSCA;');
            BuscaOS.ParamByName('BUSCA').AsDate := datatemp;
          end;
        ftInteger, ftFloat:
          begin 
            BuscaOS.sql.Add(' AND ' + busca_campo + ' = :BUSCA;');
            BuscaOS.ParamByName('BUSCA').AsString := Busca.Text;
          end;
        ftString, ftWord, ftFixedChar, ftWideString, ftLongWord:
          begin 
            BuscaOS.sql.Add(' AND ' + busca_campo + ' LIKE :BUSCA;');
            BuscaOS.ParamByName('BUSCA').AsString := '%' + Busca.Text + '%';
          end;

      end;
    BuscaOS.ParamByName('COD_EMP').AsInteger := iEmp;
    BuscaOS.Open;
  end;
end;

procedure TFrmMMA_OS.Button1Click(Sender: TObject);
begin 
  if TR_OS.Active then
    TR_OS.CommitRetaining
  else
    TR_OS.StartTransaction;
  BuscaOS.Insert;
    BuscaOSCOD_EMP.AsInteger := iEmp;
    BuscaOSCOD_USU.AsInteger := iCodUsu;
    BuscaOSCOD_CAI.AsString := cod_vend.Text;
    BuscaOSVENDEDOR.AsString := vendedor.Text;
    BuscaOSCOD_CLI.AsString := COD_CLIENTE.Text;
    BuscaOSCLIENTE.AsString := Cliente.Text;
    BuscaOSRETORNO.AsString := 'N';
    BuscaOSTELEFONE.AsString := telefone_cliente;
    BuscaOSSTATUS.AsString := 'ABERTA' ;
    BuscaOS.Post;
    BuscaOS.Close;
    BuscaOS.Open;
    BuscaOS.Last;
    BuscaOS.Edit;
  TR_OS.CommitRetaining;
  inserindo := True;
  Paginas.TabIndex := 1;
  PaginasOS.TabIndex := 0;
  Abertura.Visible := False;
  Paginas.Enabled := True;
  Panel1.Enabled := True;
  data_orcamento.Date := Date + 1;
end;

procedure TFrmMMA_OS.Button2Click(Sender: TObject);
begin 
  Abertura.Visible := False;
  Paginas.Enabled := True;
  Panel1.Enabled := True;
  if not TR_OS.Active then
    TR_OS.StartTransaction;
  TR_OS.CommitRetaining;
  { Busca.Clear;
    BuscaOS.Close;
    BuscaOS.SQL.Text := 'select * from MMA_ORDEM_SERVICO where COD_EMP = :COD_EMP';
    BuscaOS.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
    BuscaOS.Open; }
end;

procedure TFrmMMA_OS.Button3Click(Sender: TObject);
begin 
  try
    comando.Close;
    comando.sql.Text := 'insert into MMA_ORDEM_SERVICO(' +
      'COD_EMP, COD_USU, COD_CAI, VENDEDOR, COD_CLI, CLIENTE, RETORNO, COD_RETORNO, STATUS, TELEFONE,' + ' APARELHO_MODELO, APARELHO_MARCA, APARELHO_SERIE, CARRO_MODELO, CARRO_MARCA, CARRO_CHASSI, CARRO_ANO_FAB) VALUES(' + ':COD_EMP,:COD_USU,:COD_CAI,:VENDEDOR,:COD_CLI, :CLIENTE, :RETORNO, :COD_RETORNO, :STATUS, :TELEFONE,' + ' :APARELHO_MODELO, :APARELHO_MARCA, :APARELHO_SERIE, :CARRO_MODELO, :CARRO_MARCA, :CARRO_CHASSI, :CARRO_ANO_FAB);';
    comando.ParamByName('COD_EMP').AsInteger := iEmp;
    comando.ParamByName('COD_USU').AsInteger := iCodUsu;
    comando.ParamByName('COD_CAI').AsString := cod_vend_retorno.Text;
    comando.ParamByName('VENDEDOR').AsString := vendedor_retorno.Text;
    comando.ParamByName('COD_CLI').AsString := BuscaOSCOD_CLI.AsString;
    comando.ParamByName('CLIENTE').AsString := BuscaOSCLIENTE.AsString;
    comando.ParamByName('RETORNO').AsString := 'S';
    comando.ParamByName('COD_RETORNO').AsString := BuscaOSCOD.AsString;
    comando.ParamByName('STATUS').AsString := 'RETORNO';
    comando.ParamByName('TELEFONE').AsString := BuscaOSTELEFONE.AsString;
    comando.ParamByName('APARELHO_MODELO').AsString :=
      BuscaOSAPARELHO_MODELO.AsString;
    comando.ParamByName('APARELHO_MARCA').AsString :=
      BuscaOSAPARELHO_MARCA.AsString;
    comando.ParamByName('APARELHO_SERIE').AsString :=
      BuscaOSAPARELHO_SERIE.AsString;
    comando.ParamByName('CARRO_MODELO').AsString :=
      BuscaOSCARRO_MODELO.AsString;
    comando.ParamByName('CARRO_MARCA').AsString := BuscaOSCARRO_MARCA.AsString;
    comando.ParamByName('CARRO_CHASSI').AsString :=
      BuscaOSCARRO_CHASSI.AsString;
    comando.ParamByName('CARRO_ANO_FAB').AsString :=
      BuscaOSCARRO_ANO_FAB.AsString;
    comando.ExecOrOpen;
  except
    TR_OS.RollbackRetaining;
    abertura_retorno.Visible := False;
    Paginas.Enabled := True;
    Panel1.Enabled := True;

    exit;
  end;
  TR_OS.CommitRetaining;
  comando.Close;
  comando.sql.Text := 'Select MAX( COD ) from MMA_ORDEM_SERVICO';
  comando.Open;
  os_edit := comando.FieldByName('MAX').AsInteger;
  comando.Close;
  BuscaOS.Open;
  BuscaOS.Refresh;
  BuscaOS.Locate('COD', IntToStr(os_edit), []);
  BuscaOS.Edit;
  inserindo := True;
  Paginas.TabIndex := 1;
  PaginasOS.TabIndex := 0;
  abertura_retorno.Visible := False;
  Paginas.Enabled := True;
  Panel1.Enabled := True;
end;

procedure TFrmMMA_OS.Button4Click(Sender: TObject);
begin 
  abertura_retorno.Visible := False;
  Paginas.Enabled := True;
  Panel1.Enabled := True;
  if not TR_OS.Active then
    TR_OS.StartTransaction;
  TR_OS.CommitRetaining;

end;

procedure TFrmMMA_OS.cancelarClick(Sender: TObject);
var
  datatemp: tdate;
begin 
  BuscaOS.Cancel;
  if inserindo then
  begin 
    BuscaOS.Close;
    comando.Close;
    comando.sql.Text := 'delete from MMA_ORDEM_SERVICO where COD=:COD;';
    comando.ParamByName('COD').AsInteger := os_edit;
    comando.ExecOrOpen;
    TR_OS.CommitRetaining;
    Paginas.TabIndex := 0;
    inserindo := False;
  end
  else
  begin 
    BuscaOS.Close;
    TR_OS.RollbackRetaining;
    Paginas.TabIndex := 0;
  end;
  BuscaOS.Close;
  BuscaOS.sql.Text :=
    'Select * from MMA_ORDEM_SERVICO where COD_EMP = :COD_EMP';
  if Busca.Text <> '' then

    case BuscaOS.FieldByName(busca_campo).DataType of
      ftDate:
        begin 
          try
            datatemp := StrtoDate(Busca.Text);
          except
            AlertaCad('Data informada inválida!');
            exit;
          end;
          BuscaOS.sql.Add(' AND ' + busca_campo + ' = :BUSCA;');
          BuscaOS.ParamByName('BUSCA').AsDate := datatemp;
        end;
      ftInteger, ftFloat:
        begin 
          BuscaOS.sql.Add(' AND ' + busca_campo + ' = :BUSCA;');
          BuscaOS.ParamByName('BUSCA').AsString := Busca.Text;
        end;
      ftString, ftWord, ftFixedChar, ftWideString, ftLongWord:
        begin 
          BuscaOS.sql.Add(' AND ' + busca_campo + ' LIKE :BUSCA;');
          BuscaOS.ParamByName('BUSCA').AsString := '%' + Busca.Text + '%';
        end;

    end;
  BuscaOS.ParamByName('COD_EMP').AsInteger := iEmp;
  BuscaOS.Open;
end;

procedure TFrmMMA_OS.CancelarOSSelecionada1Click(Sender: TObject);
var
  motivo: String;
  datatemp: tdate;
begin 
  motivo := inputbox('Cancelamento de OS', 'Motivo de cancelamento :', '');
  if motivo <> '' then
  begin 
    BuscaOS.Close;
    comando.Close;
    comando.sql.Text :=
      'update MMA_ORDEM_SERVICO set STATUS=:STATUS where COD=:COD';
    comando.ParamByName('STATUS').AsString := 'CANCELADA';
    comando.ParamByName('COD').AsInteger := BuscaOSCOD.AsInteger;
    comando.ExecOrOpen;
    comando.Close;
    comando.sql.Text :=
      'insert into MMA_ORDEM_HISTORICO( COD_OS, DATA, DESCRICAO ) ' +
      'values( :COD_OS, current_date, :DESCRICAO )';
    comando.ParamByName('COD_OS').AsInteger := BuscaOSCOD.AsInteger;
    comando.ParamByName('DESCRICAO').AsString := motivo;
    comando.ExecOrOpen;
    comando.Close;
    TR_OS.CommitRetaining;
    BuscaOS.Close;
    BuscaOS.sql.Text :=
      'Select * from MMA_ORDEM_SERVICO where COD_EMP = :COD_EMP';
    if Busca.Text <> '' then

      case BuscaOS.FieldByName(busca_campo).DataType of
        ftDate:
          begin 
            try
              datatemp := StrtoDate(Busca.Text);
            except
              AlertaCad('Data informada inválida!');
              exit;
            end;
            BuscaOS.sql.Add(' AND ' + busca_campo + ' = :BUSCA;');
            BuscaOS.ParamByName('BUSCA').AsDate := datatemp;
          end;
        ftInteger, ftFloat:
          begin 
            BuscaOS.sql.Add(' AND ' + busca_campo + ' = :BUSCA;');
            BuscaOS.ParamByName('BUSCA').AsString := Busca.Text;
          end;
        ftString, ftWord, ftFixedChar, ftWideString, ftLongWord:
          begin 
            BuscaOS.sql.Add(' AND ' + busca_campo + ' LIKE :BUSCA;');
            BuscaOS.ParamByName('BUSCA').AsString := '%' + Busca.Text + '%';
          end;

      end;
    BuscaOS.ParamByName('COD_EMP').AsInteger := iEmp;
    BuscaOS.Open;
  end;
end;

procedure TFrmMMA_OS.COD_CLIENTEExit(Sender: TObject);
begin 
  if not dm.IBTransaction.Active then
    dm.IBTransaction.StartTransaction;
  dm.QConsulta.Close;
  dm.QConsulta.sql.Text := 'select * from CLIENTE where COD_CLI=:CODCLI';
  dm.QConsulta.ParamByName('CODCLI').AsString := COD_CLIENTE.Text;
  dm.QConsulta.Open;
  if dm.QConsulta.IsEmpty then
  begin 
    AlertaCad('Cliente não encontrado!');
    COD_CLIENTE.Clear;
    Cliente.Clear;
    exit;
  end;
  Cliente.Text := dm.QConsulta.FieldByName('NOME_CLI').AsString;
  telefone_cliente := dm.QConsulta.FieldByName('TELRES_CLI').AsString;
  dm.QConsulta.Close;
  dm.IBTransaction.Commit;
end;

procedure TFrmMMA_OS.cod_cliente_osExit(Sender: TObject);
begin 
  if not dm.IBTransaction.Active then
    dm.IBTransaction.StartTransaction;
  dm.QConsulta.Close;
  dm.QConsulta.sql.Text := 'select * from CLIENTE where COD_CLI=:CODCLI';
  dm.QConsulta.ParamByName('CODCLI').AsString := BuscaOSCOD_CLI.AsString;
  dm.QConsulta.Open;
  if dm.QConsulta.IsEmpty then
  begin 
    AlertaCad('Cliente não encontrado!');
    BuscaOSCOD_CLI.AsString := '';
    BuscaOSCLIENTE.AsString := '';
    exit;
  end;
  BuscaOSCLIENTE.AsString := dm.QConsulta.FieldByName('NOME_CLI').AsString;
  dm.QConsulta.Close;
  dm.IBTransaction.Commit;
end;

procedure TFrmMMA_OS.cod_produtoExit(Sender: TObject);
var
  calc: double;
  cod_unidade: Integer;
begin 
  if cod_produto.Text <> '' then
  begin 
    comando.Close;
    comando.sql.Text :=
      'select * from PRODUTO where COD_PRO=' + cod_produto.Text;
    comando.Open;
    if not comando.IsEmpty then
    begin 
      descricao_produto.Text := comando.FieldByName('NOME_PRO').AsString;
      // unidade.Text := comando.FieldByName( 'UND_SAIDA' ).AsString;
      cod_unidade := comando.FieldByName('CODIGO_UNIDADE_SAIDA').AsInteger;
      valor_unid.Value := comando.FieldByName('VALOR_PRO').AsFloat;
      quantidade.Value := 1;
      desconto.Value := 0;
      Cobrar.Checked := True;
      total_item.Value := 0;
      calc := (quantidade.Value * valor_unid.Value) - desconto.Value;
      total_item.Value := calc;
      comando.Close;
      comando.sql.Text :=
        ' select * from UNIDADE_MEDIDA where codigo=' + IntToStr(cod_unidade);
      comando.Open;
      unidade.Text := comando.FieldByName('DESCRICAO').AsString;
      comando.Close;
    end;
  end;

end;

procedure TFrmMMA_OS.cod_vendExit(Sender: TObject);
begin 
  if not dm.IBTransaction.Active then
    dm.IBTransaction.StartTransaction;
  dm.QConsulta.Close;
  dm.QConsulta.sql.Text :=
    'select * from VENDEDOR where COD_VEND=:CODVEND and ATIVO_VEND=:ATIVO';
  dm.QConsulta.ParamByName('CODVEND').AsString := cod_vend.Text;
  dm.QConsulta.ParamByName('ATIVO').AsString := 'S';
  dm.QConsulta.Open;
  if dm.QConsulta.IsEmpty then
  begin 
    AlertaCad('Vendedor não encontrado!');
    cod_vend.Clear;
    vendedor.Clear;
    exit;
  end;
  vendedor.Text := dm.QConsulta.FieldByName('NOME_VEND').AsString;
  dm.QConsulta.Close;
  dm.IBTransaction.Commit;
end;

procedure TFrmMMA_OS.cod_vend_retornoExit(Sender: TObject);
begin 
  if not dm.IBTransaction.Active then
    dm.IBTransaction.StartTransaction;
  dm.QConsulta.Close;
  dm.QConsulta.sql.Text :=
    'select * from VENDEDOR where COD_VEND=:CODVEND and ATIVO_VEND=:ATIVO';
  dm.QConsulta.ParamByName('CODVEND').AsString := cod_vend_retorno.Text;
  dm.QConsulta.ParamByName('ATIVO').AsString := 'S';
  dm.QConsulta.Open;
  if dm.QConsulta.IsEmpty then
  begin 
    AlertaCad('Vendedor não encontrado!');
    cod_vend_retorno.Clear;
    vendedor_retorno.Clear;
    exit;
  end;
  vendedor_retorno.Text := dm.QConsulta.FieldByName('NOME_VEND').AsString;
  dm.QConsulta.Close;
  dm.IBTransaction.Commit;

end;

procedure TFrmMMA_OS.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin 
  // $00AEAEFF  cancelada
  /// $00D9FFCC entrege pronto      ENTREGUE PRONTO
  /// $00F0F0F0 entregue sem fazer  ENTREGUE SEM CONS.
  /// clred NÂO AUT.
  /// clGreen PRONTO                   PRONTO FINALIZAR    $00EAEAEA
  if trim(BuscaOSSTATUS.AsString) = 'CANCELADA' then
  begin 
    DBGrid1.Canvas.Brush.Color := $00BBBBFF;
    DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.columns[DataCol].Field, State);
  end;
  if trim(BuscaOSSTATUS.AsString) = 'ENTREGUE PRONTO' then
  begin 
    DBGrid1.Canvas.Brush.Color := $00D9FFCC;
    DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.columns[DataCol].Field, State);
  end;
  if trim(BuscaOSSTATUS.AsString) = 'ENTREGUE SEM CONS.' then
  begin 
    DBGrid1.Canvas.Brush.Color := $00F0F0F0;
    DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.columns[DataCol].Field, State);
  end;
  if trim(BuscaOSSTATUS.AsString) = 'EXPORTADO' then
  begin 
    DBGrid1.Canvas.Brush.Color := $00EAEAEA;
    DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.columns[DataCol].Field, State);
  end;

  if trim(BuscaOSSTATUS.AsString) = 'PRONTO FINALIZAR' then
  begin 
    DBGrid1.Canvas.Brush.Color := $0095FF95;
    DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.columns[DataCol].Field, State);
  end;

  if trim(BuscaOSSTATUS.AsString) = 'NÃO AUT.' then
  begin 
    DBGrid1.Canvas.Brush.Color := clRed;
    DBGrid1.Canvas.Font.Color := clWhite;
    DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.columns[DataCol].Field, State);
  end;
  if trim(BuscaOSSTATUS.AsString) = 'PRONTO' then
  begin 
    DBGrid1.Canvas.Brush.Color := clGreen;
    DBGrid1.Canvas.Font.Color := clWhite;
    DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.columns[DataCol].Field, State);
  end;
end;

procedure TFrmMMA_OS.DBGrid1TitleClick(Column: TColumn);
var
  I: Integer;
begin 
  // AlertaCad( column.Field.FieldName);
  for I := 0 to DBGrid1.columns.Count - 1 do
  begin 
    DBGrid1.columns.Items[I].Title.Font.Style := [];
  end;
  Column.Title.Font.Style := [fsBold];
  busca_campo := Column.Field.FieldName;
end;

procedure TFrmMMA_OS.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin 
  if trim(ItensCOBRAR.AsString) = 'S' then
  begin 
    DBGrid2.Canvas.Brush.Color := $00E1FFD7;
    DBGrid2.DefaultDrawDataCell(Rect, DBGrid2.columns[DataCol].Field, State);
  end
  else
  begin 
    DBGrid2.Canvas.Brush.Color := clWhite;
    DBGrid2.DefaultDrawDataCell(Rect, DBGrid2.columns[DataCol].Field, State);
  end;

end;

procedure TFrmMMA_OS.descontoExit(Sender: TObject);
var
  calc: double;
begin 
  calc := (quantidade.Value * valor_unid.Value) - desconto.Value;
  total_item.Value := calc;
end;

procedure TFrmMMA_OS.DOSDataChange(Sender: TObject; Field: TField);
begin 
  case DOS.State of
    dsInactive, dsBrowse:
      begin 
        novo.Enabled := True;
        editar.Enabled := True;
        salvar.Enabled := False;
        cancelar.Enabled := False;
        excluir.Enabled := True;
        Panel3.Visible := True;
        Panel2.Visible := False;
      end;
    dsEdit, dsInsert:
      begin
        if DOS.State = dsEdit then
          begin
             if not dm.Acesso( 'M301', 'A' ) then
               begin
                  Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
                  DOS.DataSet.Cancel;
                  Abort;
                  exit;
               end;
          end;
        if BuscaOSSTATUS.AsString = 'ENTREGUE PRONTO' then
        begin
          AlertaCad('OS não pode ser editada gerou contas a receber!');
          BuscaOS.Cancel;
          exit;
        end;
        novo.Enabled := False;
        editar.Enabled := False;
        salvar.Enabled := True;
        cancelar.Enabled := True;
        excluir.Enabled := False;
        Panel3.Visible := False;
        Panel2.Visible := True;
      end;
  end;
end;

procedure TFrmMMA_OS.editarClick(Sender: TObject);
begin 
  if not BuscaOSCOD.IsNull then
  begin
    Paginas.TabIndex := 1;
    BuscaOS.Edit;
  end;
end;

procedure TFrmMMA_OS.entrega_pClick(Sender: TObject);
var
  datatemp: tdate;
begin 
  if not(DOS.State = dsEdit) then
    BuscaOS.Edit;
  BuscaOS.Post;
  Application.CreateForm(TfrmMMA_fechamento, frmMMA_fechamento);
  frmMMA_fechamento.Valor_total := BuscaOSSUB_TOTAL.AsFloat;
  frmMMA_fechamento.COD_CLIENTE := BuscaOSCOD_CLI.AsInteger;
  frmMMA_fechamento.OS := BuscaOSCOD.AsInteger;
  TR_OS.CommitRetaining;
  BuscaOS.Refresh;
  frmMMA_fechamento.showmodal;

  BuscaOS.Refresh;

end;

procedure TFrmMMA_OS.entrega_SClick(Sender: TObject);
var
  datatemp: tdate;
begin 
  if not(DOS.State = dsEdit) then
    BuscaOS.Edit;
  BuscaOSSTATUS.AsString := 'ENTREGUE SEM CONS.';
  BuscaOSDATA_FECHAMENTO.AsDateTime := date;
  BuscaOS.Post;
  comando.Close;
  comando.sql.Text :=
    'insert into MMA_ORDEM_HISTORICO( COD_OS, DATA, DESCRICAO ) ' +
    'values( :COD_OS, current_date, :DESCRICAO )';
  comando.ParamByName('COD_OS').AsInteger := BuscaOSCOD.AsInteger;
  comando.ParamByName('DESCRICAO').AsString := 'ENTREGUE SEM CONSERTO';
  comando.ExecOrOpen;
  comando.Close;
  BuscaOS.Close;
  TR_OS.CommitRetaining;
  Paginas.TabIndex := 0;

  BuscaOS.Close;
  BuscaOS.sql.Text :=
    'Select * from MMA_ORDEM_SERVICO where COD_EMP = :COD_EMP';
  if Busca.Text <> '' then

    case BuscaOS.FieldByName(busca_campo).DataType of
      ftDate:
        begin
          try
            datatemp := StrtoDate(Busca.Text);
          except
            AlertaCad('Data informada inválida!');
            exit;
          end;
          BuscaOS.sql.Add(' AND ' + busca_campo + ' = :BUSCA;');
          BuscaOS.ParamByName('BUSCA').AsDate := datatemp;
        end;
      ftInteger, ftFloat:
        begin 
          BuscaOS.sql.Add(' AND ' + busca_campo + ' = :BUSCA;');
          BuscaOS.ParamByName('BUSCA').AsString := Busca.Text;
        end;
      ftString, ftWord, ftFixedChar, ftWideString, ftLongWord:
        begin 
          BuscaOS.sql.Add(' AND ' + busca_campo + ' LIKE :BUSCA;');
          BuscaOS.ParamByName('BUSCA').AsString := '%' + Busca.Text + '%';
        end;

    end;
  BuscaOS.ParamByName('COD_EMP').AsInteger := iEmp;
  BuscaOS.Open;

end;

procedure TFrmMMA_OS.excluirClick(Sender: TObject);
begin 
  if not dm.Acesso( 'M301', 'E' ) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        exit;
     end;

  if not BuscaOSCOD.IsNull then
  begin 
    frmDeletaOS.Panel5.Caption := 'Excluir OS ' + BuscaOSCOD.AsString;
    frmDeletaOS.showmodal;
    if frmDeletaOS.senhaex <> '' then
    begin 
      comando.Close;
      comando.sql.Text := 'select SENHA_EXCLUIR_VENDA from parametros';
      comando.Open;
      if frmDeletaOS.senhaex = comando.FieldByName('SENHA_EXCLUIR_VENDA')
        .AsString then
      begin 
        comando.Close;
        comando.sql.Text := 'delete from MMA_ORDEM_SERVICO where COD=:COD';
        comando.ParamByName('COD').AsInteger := BuscaOSCOD.AsInteger;
        comando.ExecOrOpen;
        TR_OS.CommitRetaining;
        BuscaOS.Close;
        BuscaOS.sql.Text :=
          'select * from MMA_ORDEM_SERVICO where COD_EMP = :COD_EMP';
        BuscaOS.ParamByName('COD_EMP').AsInteger := iEmp;
        BuscaOS.Open;
        AlertaCad('Ordem de serviço excluída com sucesso!');
      end
      else
      begin 
        AlertaCad('Senha inválida!');
        comando.Close;
      end;
    end;
  end;
end;

procedure TFrmMMA_OS.FechamentoShow(Sender: TObject);
begin 
  data_evento.date := date;
  descricao_evento.Clear;
end;

procedure TFrmMMA_OS.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
  BuscaOS.Close;
  BuscaOS.Close;
  if TR_OS.Active then
    TR_OS.Commit;
  Action := caFree;
end;

procedure TFrmMMA_OS.FormShow(Sender: TObject);

begin 
  LegendaOficina.Visible := ( AtivaLavanderia = False );
  GroupBox1.Visible := ( AtivaLavanderia = False );
  GroupBox2.Visible := ( AtivaLavanderia = False );
  if not ControlaEstoqueOS then
     begin 
        entrega_S.Visible := False;
        entrega_p.Visible := false;
        Label24.Caption := 'Serviço Realizado';
        status.Items.Add( 'PRONTO FINALIZAR' );
        btnExporta.Visible := True;
     end
  else
     begin 
        btnExporta.Visible := True;
     end;
  if GroupBox1.Visible then
     GroupBox1.Visible := ( AtivaConserto =  True );
  if AtivaLavanderia then
     begin 
        PaginasOS.Pages[1].Free;
        BuscaOSRETORNO.Visible := False;
        os_retorno.Visible := False;
        Label23.Visible := False;
        Retorno.Visible := False;
        RetornodestaOS1.Visible := False;
        Label8.Caption := 'Previsão de entrega :';
        imprimir.OnClick := imprimir2Click;
        Config.Visible := False;
        entrega_S.Visible := False;
     end;
  inserindo := False;
  busca_campo := 'COD';
  DBGrid1.columns.Items[0].Title.Font.Style := [fsBold];
  if not TR_OS.Active then
    TR_OS.StartTransaction;
  Paginas.TabIndex := 0;
  BuscaOS.Close;
  BuscaOS.sql.Text :=
    'select * from MMA_ORDEM_SERVICO where COD_EMP = :COD_EMP';
  BuscaOS.ParamByName('COD_EMP').AsInteger := iEmp;
  BuscaOS.Open;
  Busca.Clear;
  case DOS.State of
    dsInactive:
      begin 
        novo.Enabled := True;
        editar.Enabled := True;
        salvar.Enabled := False;
        cancelar.Enabled := False;
        excluir.Enabled := True;
        Panel3.Visible := True;
        Panel2.Visible := False;
      end;
    dsEdit, dsInsert:
      begin 
        novo.Enabled := False;
        editar.Enabled := False;
        salvar.Enabled := True;
        cancelar.Enabled := True;
        excluir.Enabled := False;
        Panel3.Visible := False;
        Panel2.Visible := True;
      end;
  end;
  if not dm.Acesso( 'M301', 'I' ) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Novo.Enabled := false;
        Editar.Enabled := false;
        Excluir.Enabled := false;
        Imprimir.Enabled := false;
        Config.Enabled := False;
        Abort;
        Exit;
     end;

end;

procedure TFrmMMA_OS.Image3Click(Sender: TObject);
var
  TotalServicos, TotalProdutos : Double;
begin 
  comando.Close;
  comando.sql.Text :=
    'select SUM( OI.VALOR_TOTAL ) from MMA_ORDEM_ITENS OI' +
    ' left outer join produto p'+
    ' on ( p.cod_pro = oi.cod_prod )'+
    ' left outer join tipo_produto tp'+
    ' on ( tp.codigo = p.codigo_tipo )'+
    ' where tp.servico=:servico and OI.COD_OS=:COD_OS and COBRAR=:COBRAR';
  comando.ParamByName( 'COD_OS' ).AsInteger := BuscaOSCOD.AsInteger;
  comando.ParamByName( 'COBRAR' ).AsString := 'S';
  comando.ParamByName( 'servico' ).AsString := 'S';
  comando.Open;
  TotalServicos := comando.FieldByName('SUM').AsFloat;
  comando.Close;
  comando.ParamByName( 'COD_OS' ).AsInteger := BuscaOSCOD.AsInteger;
  comando.ParamByName( 'COBRAR' ).AsString := 'S';
  comando.ParamByName( 'servico' ).AsString := 'N';
  comando.Open;
  TotalProdutos := comando.FieldByName('SUM').AsFloat;
  if not(DOS.State = dsEdit) then
    BuscaOS.Edit;

  BuscaOSTOTAL_PROD.AsFloat := TotalProdutos;
  BuscaOSTOTAL_SERVICOS.AsFloat := TotalServicos;
  comando.Close;
  BuscaOS.Post;
  TR_OS.CommitRetaining;
end;

procedure TFrmMMA_OS.imprimirClick(Sender: TObject);
var
  COD_C, OSS, STATUS_OS: String;

begin 
   if AtivaLavanderia then
      begin 
         imprimir2Click( nil );
         Exit;
      end;
  if not dm.Acesso( 'M301', 'I' ) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        exit;
     end;

  if Paginas.TabIndex = 0 then
  begin 
    if BuscaOSCOD.IsNull then
      exit;
    OSS := IntToStr(BuscaOSCOD.AsInteger);
    COD_C := IntToStr(BuscaOSCOD_CLI.AsInteger);
    STATUS_OS := BuscaOSSTATUS.AsString;
  end
  else
  begin 
    if BuscaOSCOD.IsNull then
      exit;
    OSS := IntToStr(BuscaOSCOD.AsInteger);
    COD_C := BuscaOSCOD_CLI.AsString;
    STATUS_OS := BuscaOSSTATUS.AsString;
  end;
  if STATUS_OS = 'ORÇAMENTO' then
  begin 
    Application.CreateForm(TfrmREL_FECHAMENTO, frmREL_FECHAMENTO);
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;
    frmREL_FECHAMENTO.Qemp.sql.Text :=
      'Select * from empresa where COD_EMP=' + IntToStr(iEmp);
    frmREL_FECHAMENTO.Qemp.Open;
    frmREL_FECHAMENTO.Qconfig.sql.Text := 'select * from MMA_CONFIG';
    frmREL_FECHAMENTO.Qconfig.Open;
    frmREL_FECHAMENTO.qos.sql.Text :=
      'Select * from MMA_ORDEM_SERVICO where COD=' + OSS;
    frmREL_FECHAMENTO.qos.Open;
    frmREL_FECHAMENTO.Qcliente.sql.Text :=
      'select * from CLIENTE where COD_CLI=' + COD_C;
    frmREL_FECHAMENTO.Qcliente.Open;
    frmREL_FECHAMENTO.qitens.sql.Text :=
      'select * from MMA_ORDEM_ITENS where COD_OS=' + OSS;
    frmREL_FECHAMENTO.qitens.Open;
    frmREL_FECHAMENTO.statuss.Caption := 'ITENS DO ORÇAMENTO';
    frmREL_FECHAMENTO.QRSubDetail3.Enabled := False;
    frmREL_FECHAMENTO.QRSubDetail2.Enabled := False;
    frmREL_FECHAMENTO.QRSubDetail4.Enabled := false;
    frmREL_FECHAMENTO.QRSubDetail5.Enabled := false;
    frmREL_FECHAMENTO.termo1.Font.Color := clWhite;
    frmREL_FECHAMENTO.termo2.Font.Color := clWhite;
    if fileexists(ExtractFilePath(Application.ExeName) + 'logo.bmp') then
      frmREL_FECHAMENTO.logo.Picture.LoadFromFile
        (ExtractFilePath(Application.ExeName) + 'logo.bmp');
    frmREL_FECHAMENTO.QuickRep1.PreviewModal;
    frmREL_FECHAMENTO.Qemp.Close;
    frmREL_FECHAMENTO.Qcliente.Close;
    frmREL_FECHAMENTO.Qconfig.Close;
    frmREL_FECHAMENTO.qos.Close;
    frmREL_FECHAMENTO.qitens.Close;
    frmREL_FECHAMENTO.Free;
    dm.IBTransaction.Commit;
  end
  else if STATUS_OS = 'ENTREGUE PRONTO' then
  begin 
    Application.CreateForm(TfrmREL_FECHAMENTO, frmREL_FECHAMENTO);
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;
    frmREL_FECHAMENTO.Qemp.sql.Text :=
      'Select * from empresa where COD_EMP=' + IntToStr(iEmp);
    frmREL_FECHAMENTO.Qemp.Open;
    frmREL_FECHAMENTO.Qconfig.sql.Text := 'select * from MMA_CONFIG';
    frmREL_FECHAMENTO.Qconfig.Open;
    frmREL_FECHAMENTO.qos.sql.Text :=
      'Select * from MMA_ORDEM_SERVICO where COD=' + OSS;
    frmREL_FECHAMENTO.qos.Open;
    frmREL_FECHAMENTO.Qcliente.sql.Text :=
      'select * from CLIENTE where COD_CLI=' + COD_C;
    frmREL_FECHAMENTO.Qcliente.Open;
    frmREL_FECHAMENTO.qitens.sql.Text :=
      'select * from MMA_ORDEM_ITENS where COD_OS=' + OSS;
    frmREL_FECHAMENTO.qitens.Open;
    frmREL_FECHAMENTO.qreceber.sql.Text :=
      'select * from CONTAS_RECEBER where COD_OS_MMA=' + OSS;
    frmREL_FECHAMENTO.qreceber.Open;
    frmREL_FECHAMENTO.statuss.Caption := 'ITENS DO CONSERTO';
    frmREL_FECHAMENTO.termo1.Font.Color := clblack;
    frmREL_FECHAMENTO.termo2.Font.Color := clblack;
    frmREL_FECHAMENTO.termo1.Enabled := true;
    frmREL_FECHAMENTO.termo2.Enabled := true;
    frmREL_FECHAMENTO.QRSubDetail2.Enabled := True;
    frmREL_FECHAMENTO.QRSubDetail3.Enabled := True;
    frmREL_FECHAMENTO.QRSubDetail4.Enabled := True;
    frmREL_FECHAMENTO.QRSubDetail5.Enabled := false;
    if fileexists(ExtractFilePath(Application.ExeName) + 'logo.bmp') then
      frmREL_FECHAMENTO.logo.Picture.LoadFromFile
        (ExtractFilePath(Application.ExeName) + 'logo.bmp');
    frmREL_FECHAMENTO.QuickRep1.PreviewModal;
    frmREL_FECHAMENTO.Qemp.Close;
    frmREL_FECHAMENTO.Qcliente.Close;
    frmREL_FECHAMENTO.Qconfig.Close;
    frmREL_FECHAMENTO.qos.Close;
    frmREL_FECHAMENTO.qitens.Close;

    frmREL_FECHAMENTO.Free;
    dm.IBTransaction.Commit;
  end
  else
  if STATUS_OS = 'PRONTO FINALIZAR' then
  begin 
    Application.CreateForm(TfrmREL_FECHAMENTO, frmREL_FECHAMENTO);
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;
    frmREL_FECHAMENTO.Qemp.sql.Text :=
      'Select * from empresa where COD_EMP=' + IntToStr(iEmp);
    frmREL_FECHAMENTO.Qemp.Open;
    frmREL_FECHAMENTO.Qconfig.sql.Text := 'select * from MMA_CONFIG';
    frmREL_FECHAMENTO.Qconfig.Open;
    frmREL_FECHAMENTO.qos.sql.Text :=
      'Select * from MMA_ORDEM_SERVICO where COD=' + OSS;
    frmREL_FECHAMENTO.qos.Open;
    frmREL_FECHAMENTO.Qcliente.sql.Text :=
      'select * from CLIENTE where COD_CLI=' + COD_C;
    frmREL_FECHAMENTO.Qcliente.Open;
    frmREL_FECHAMENTO.qitens.sql.Text :=
      'select * from MMA_ORDEM_ITENS where COD_OS=' + OSS;
    frmREL_FECHAMENTO.qitens.Open;
    frmREL_FECHAMENTO.qreceber.sql.Text :=
      'select * from CONTAS_RECEBER where COD_OS_MMA=' + OSS;
    frmREL_FECHAMENTO.qreceber.Open;
    frmREL_FECHAMENTO.statuss.Caption := 'ITENS DO SERVIÇO';
    frmREL_FECHAMENTO.termo1.Font.Color := clblack;
    frmREL_FECHAMENTO.termo2.Font.Color := clblack;
    if fileexists(ExtractFilePath(Application.ExeName) + 'logo.bmp') then
      frmREL_FECHAMENTO.logo.Picture.LoadFromFile
        (ExtractFilePath(Application.ExeName) + 'logo.bmp');
    frmREL_FECHAMENTO.termo1.Enabled := false;
    frmREL_FECHAMENTO.termo2.Enabled := false;
    frmREL_FECHAMENTO.QRSubDetail2.Enabled := False;
    frmREL_FECHAMENTO.QRSubDetail3.Enabled := False;
    frmREL_FECHAMENTO.QRSubDetail4.Enabled := False;
    frmREL_FECHAMENTO.QRSubDetail5.Enabled := true;
    frmREL_FECHAMENTO.QuickRep1.PreviewModal;
    frmREL_FECHAMENTO.Qemp.Close;
    frmREL_FECHAMENTO.Qcliente.Close;
    frmREL_FECHAMENTO.Qconfig.Close;
    frmREL_FECHAMENTO.qos.Close;
    frmREL_FECHAMENTO.qitens.Close;

    frmREL_FECHAMENTO.Free;
    dm.IBTransaction.Commit;
  end
  else

  begin 
    Application.CreateForm(TfrmMMAREL_OS_ABERTURA, frmMMAREL_OS_ABERTURA);
    if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
    dm.IBTransaction.StartTransaction;
    frmMMAREL_OS_ABERTURA.Qemp.sql.Text :=
      'Select * from empresa where COD_EMP=' + IntToStr(iEmp);
    frmMMAREL_OS_ABERTURA.Qemp.Open;
    frmMMAREL_OS_ABERTURA.Qconfig.sql.Text := 'select * from MMA_CONFIG';
    frmMMAREL_OS_ABERTURA.Qconfig.Open;
    frmMMAREL_OS_ABERTURA.qos.sql.Text :=
      'Select * from MMA_ORDEM_SERVICO where COD=' + OSS;
    frmMMAREL_OS_ABERTURA.qos.Open;
    frmMMAREL_OS_ABERTURA.Qcliente.sql.Text :=
      'select * from CLIENTE where COD_CLI=' + COD_C;
    frmMMAREL_OS_ABERTURA.Qcliente.Open;
    if fileexists(ExtractFilePath(Application.ExeName) + 'logo.bmp') then
      frmMMAREL_OS_ABERTURA.logo.Picture.LoadFromFile
        (ExtractFilePath(Application.ExeName) + 'logo.bmp');
    frmMMAREL_OS_ABERTURA.QuickRep1.PreviewModal;
    frmMMAREL_OS_ABERTURA.Qemp.Close;
    frmMMAREL_OS_ABERTURA.Qcliente.Close;
    frmMMAREL_OS_ABERTURA.Qconfig.Close;
    frmMMAREL_OS_ABERTURA.qos.Close;
    frmMMAREL_OS_ABERTURA.Free;
    dm.IBTransaction.Commit;
  end;
end;


procedure TFrmMMA_OS.N1Click(Sender: TObject);
var
  motivo: string;
  datatemp: tdate;
begin 
  motivo := inputbox('Reheição de conserto', 'Rejeitado por :', '');
  if motivo <> '' then
  begin 
    BuscaOS.Close;
    comando.Close;
    comando.sql.Text :=
      'update MMA_ORDEM_SERVICO set STATUS=:STATUS where COD=:COD';
    comando.ParamByName('STATUS').AsString := 'NÃO AUT.';
    comando.ParamByName('COD').AsInteger := BuscaOSCOD.AsInteger;
    comando.ExecOrOpen;
    comando.Close;
    comando.sql.Text :=
      'insert into MMA_ORDEM_HISTORICO( COD_OS, DATA, DESCRICAO ) ' +
      'values( :COD_OS, current_date, :DESCRICAO )';
    comando.ParamByName('COD_OS').AsInteger := BuscaOSCOD.AsInteger;
    comando.ParamByName('DESCRICAO').AsString := 'Rejeitado por: ' + motivo;
    comando.ExecOrOpen;
    comando.Close;
    TR_OS.CommitRetaining;
    BuscaOS.Close;
    BuscaOS.sql.Text :=
      'Select * from MMA_ORDEM_SERVICO where COD_EMP = :COD_EMP';
    if Busca.Text <> '' then

      case BuscaOS.FieldByName(busca_campo).DataType of
        ftDate:
          begin 
            try
              datatemp := StrtoDate(Busca.Text);
            except
              AlertaCad('Data informada inválida!');
              exit;
            end;
            BuscaOS.sql.Add(' AND ' + busca_campo + ' = :BUSCA;');
            BuscaOS.ParamByName('BUSCA').AsDate := datatemp;
          end;
        ftInteger, ftFloat:
          begin 
            BuscaOS.sql.Add(' AND ' + busca_campo + ' = :BUSCA;');
            BuscaOS.ParamByName('BUSCA').AsString := Busca.Text;
          end;
        ftString, ftWord, ftFixedChar, ftWideString, ftLongWord:
          begin 
            BuscaOS.sql.Add(' AND ' + busca_campo + ' LIKE :BUSCA;');
            BuscaOS.ParamByName('BUSCA').AsString := '%' + Busca.Text + '%';
          end;

      end;
    BuscaOS.ParamByName('COD_EMP').AsInteger := iEmp;
    BuscaOS.Open;
  end;
end;

procedure TFrmMMA_OS.novoClick(Sender: TObject);
var
  Entrada: String;
  Valor: Integer;
begin 
  if not dm.Acesso( 'M301', 'I' ) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        exit;
     end;

  BuscaOS.Close;
  BuscaOS.sql.Text :=
    'Select * from MMA_ORDEM_SERVICO where COD_EMP = :COD_EMP';
  BuscaOS.ParamByName('COD_EMP').AsInteger := iEmp;
  BuscaOS.Open;

  if BuscaOS.IsEmpty then
  begin 
    Entrada := inputbox('Parametrização', 'Sua primeira O.S começará em?', '1');
    if Entrada <> '' then
    begin 
      try
        Valor := StrToInt(Entrada);
        sql.sql.Text :=
          'ALTER SEQUENCE GEN_MMA_ORDEM_SERVICO_ID RESTART WITH ' + IntToStr(Valor - 1);
        sql.Prepare;
        sql.ExecOrOpen;
        TR_OS.CommitRetaining;
      except
        AlertaCad('Valor informado é inválido');
        exit;
      end;
    end;
    // ALTER SEQUENCE GEN_MMA_ORDEM_SERVICO_ID RESTART WITH :VALOR;
  end;
  Abertura.Visible := True;
  Paginas.Enabled := False;
  Panel1.Enabled := False;
  COD_CLIENTE.Clear;
  Cliente.Clear;
  cod_vend.Clear;
  vendedor.Clear;
end;

procedure TFrmMMA_OS.OSAfterEdit(DataSet: TDataSet);
begin 
  if not dm.Acesso( 'M301', 'A' ) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        BuscaOS.Cancel;
        Abort;
        exit;
     end;

  if BuscaOSSTATUS.AsString = 'ENTREGUE PRONTO' then
  begin 
    AlertaCad('OS não pode ser editada gerou contas a receber!');
    BuscaOS.Cancel;
    exit;
  end;

end;

procedure TFrmMMA_OS.OSAfterScroll(DataSet: TDataSet);
begin 
  if not BuscaOSCOD.IsNull then
  begin 
    Itens.Close;
    Itens.sql.Text :=
      'Select * from MMA_ORDEM_ITENS where COD_OS=:COD_OS order by cod';
    Itens.ParamByName('COD_OS').AsInteger := BuscaOSCOD.AsInteger;
    Itens.Open;
    Historico.Close;
    Historico.sql.Text :=
      'Select * from MMA_ORDEM_HISTORICO where COD_OS=:COD_OS order by cod';
    Historico.ParamByName('COD_OS').AsInteger := BuscaOSCOD.AsInteger;
    Historico.Open;

  end;

end;

procedure TFrmMMA_OS.PaginasChange(Sender: TObject);
begin 
  if Paginas.TabIndex = 1 then
    if BuscaOSCOD.IsNull then
    begin 
      AlertaCad('Você deve inserir um novo registro ou selecionar uma OS');
      Paginas.TabIndex := 0;
      exit;
    end;

  if not inserindo then
  begin 
   { OS.Open;
    OS.Locate('COD', BuscaOSCOD.AsString, []);
    PaginasOS.TabIndex := 0;}
  end;
end;

procedure TFrmMMA_OS.PopupMenu1Popup(Sender: TObject);
begin 
  if BuscaOSSTATUS.AsString <> 'ENTREGUE PRONTO' then
    RetornodestaOS1.Enabled := False
  else
    RetornodestaOS1.Enabled := True;
  if BuscaOSSTATUS.AsString <> 'ORÇAMENTO' then
    Envetosdeoramento1.Enabled := False
  else
    Envetosdeoramento1.Enabled := True;
  if BuscaOSSTATUS.AsString = 'ABERTA' then
    CancelarOSSelecionada1.Enabled := True
  else
    CancelarOSSelecionada1.Enabled := False;
end;

procedure TFrmMMA_OS.quantidadeExit(Sender: TObject);
var
  calc: double;
begin 
  calc := (quantidade.Value * valor_unid.Value) - desconto.Value;
  total_item.Value := calc;
end;

procedure TFrmMMA_OS.RetornodestaOS1Click(Sender: TObject);
begin 
  abertura_retorno.Visible := True;
  Paginas.Enabled := False;
  Panel1.Enabled := False;
  cod_vend_retorno.Clear;
  vendedor_retorno.Clear;
end;

procedure TFrmMMA_OS.salvarClick(Sender: TObject);
var
  datatemp: tdate;
begin 
  if (DOS.State = dsEdit) or (DOS.State = dsInsert) then
     begin 
        if ( AtivaLavanderia ) then
           begin 
               if ( BuscaOSSTATUS.AsString = 'ABERTA') or ( status.ItemIndex = 0 ) then
                  BuscaOSSTATUS.AsString := 'ORÇAMENTO';
           end;

        BuscaOS.Post;
     end;
  inserindo := False;
  TR_OS.CommitRetaining;
  BuscaOS.Refresh;
  inserindo := False;
{  BuscaOS.Close;
  BuscaOS.sql.Text :=
    'Select * from MMA_ORDEM_SERVICO where COD_EMP = :COD_EMP';
  if Busca.Text <> '' then

    case BuscaOS.FieldByName(busca_campo).DataType of
      ftDate:
        begin 
          try
            datatemp := StrtoDate(Busca.Text);
          except
            AlertaCad('Data informada inválida!');
            exit;
          end;
          BuscaOS.sql.Add(' AND ' + busca_campo + ' = :BUSCA;');
          BuscaOS.ParamByName('BUSCA').AsDate := datatemp;
        end;
      ftInteger, ftFloat:
        begin 
          BuscaOS.sql.Add(' AND ' + busca_campo + ' = :BUSCA;');
          BuscaOS.ParamByName('BUSCA').AsString := Busca.Text;
        end;
      ftString, ftWord, ftFixedChar, ftWideString, ftLongWord:
        begin 
          BuscaOS.sql.Add(' AND ' + busca_campo + ' LIKE :BUSCA;');
          BuscaOS.ParamByName('BUSCA').AsString := '%' + Busca.Text + '%';
        end;

    end;
  BuscaOS.ParamByName('COD_EMP').AsInteger := iEmp;
  if True then
     begin 

     end;
  BuscaOS.Open;      }
end;

procedure TFrmMMA_OS.ConfigClick(Sender: TObject);
begin 
  if not dm.Acesso( 'M301', 'A' ) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        exit;
     end;

  Application.CreateForm(TFrmMMA_ConfigT, FrmMMA_ConfigT);
  if TR_OS.Active then
    TR_OS.Commit;
  TR_OS.StartTransaction;
  FrmMMA_ConfigT.showmodal;
  TR_OS.Commit;
  TR_OS.StartTransaction;
  inserindo := False;
  busca_campo := 'COD';
  DBGrid1.columns.Items[0].Title.Font.Style := [fsBold];
  Paginas.TabIndex := 0;
  BuscaOS.Close;
  BuscaOS.sql.Text :=
    'select * from MMA_ORDEM_SERVICO where COD_EMP = :COD_EMP';
  BuscaOS.ParamByName('COD_EMP').AsInteger := iEmp;
  BuscaOS.Open;
  Busca.Clear;

end;

procedure TFrmMMA_OS.SpeedButton12Click(Sender: TObject);
begin 
  Application.CreateForm(TFrmConsVend, FrmConsVend);
  FrmConsVend.tag := 4;
  FrmConsVend.showmodal;
end;

procedure TFrmMMA_OS.SpeedButton3Click(Sender: TObject);
begin 
  if (BuscaOSRETORNO.AsString = 'S') and (not BuscaOSCOD_RETORNO.IsNull) then
  begin 
    Application.CreateForm(TfrmMMA_ITENS, frmMMA_ITENS);
    frmMMA_ITENS.OS := BuscaOSCOD_RETORNO.AsInteger;
    frmMMA_ITENS.showmodal;
  end
  else
    AlertaCad('OS não  possue um código de retorno!');

end;

procedure TFrmMMA_OS.SpeedButton4Click(Sender: TObject);
var
  calc: double;
begin 
  buscaDescP := '';
  Application.CreateForm(TFrmConsProd, FrmConsProd);
  FrmConsProd.tag := 33;
  FrmConsProd.showmodal;

  if buscaDescP <> '' then
  begin 
    cod_produto.Text := IntToStr(buscaCodP);
    descricao_produto.Text := buscaDescP;
    unidade.Text := buscaUnidP;
    valor_unid.Value := buscaValorP;
    quantidade.Value := 1;
    calc := (quantidade.Value * valor_unid.Value) - desconto.Value;
    total_item.Value := calc;
  end;
end;

procedure TFrmMMA_OS.SpeedButton5Click(Sender: TObject);
begin 
   BuscaFormulario( TFrmCadProduto, True  );
end;

procedure TFrmMMA_OS.SpeedButton6Click(Sender: TObject);
var
  calc: double;
begin 
  calc := (quantidade.Value * valor_unid.Value) - desconto.Value;
  total_item.Value := calc;
  if (cod_produto.Text <> '') and (descricao_produto.Text <> '') and
    (unidade.Text <> '') and (valor_unid.Text <> '') then
  begin 
    try
      comando.Close;
      comando.sql.Text :=
        'insert into MMA_ORDEM_ITENS( COD_OS, COD_PROD, DESCRICAO,' +
        'UNID, QUANT, VALOR_UNID, DESCONTO, COBRAR, CONTROLA_ESTOQUE ) values ( :COD_OS, :COD_PROD,'
        + ':DESCRICAO, :UNID, :QUANT, :VALOR_UNID, :DESCONTO, :COBRAR, :CONTROLA_ESTOQUE )';
      comando.ParamByName('COD_OS').AsInteger := BuscaOSCOD.AsInteger;
      comando.ParamByName('COD_PROD').AsString := cod_produto.Text;
      comando.ParamByName('DESCRICAO').AsString := descricao_produto.Text;
      comando.ParamByName('UNID').AsString := unidade.Text;
      comando.ParamByName('QUANT').AsFloat := quantidade.Value;
      comando.ParamByName('VALOR_UNID').AsFloat := valor_unid.Value;
      comando.ParamByName('DESCONTO').AsFloat := desconto.Value;
      if ControlaEstoqueOS then
         comando.ParamByName('CONTROLA_ESTOQUE').AsString := 'S'
      else
         comando.ParamByName('CONTROLA_ESTOQUE').AsString := 'N';

      if Cobrar.Checked then
        comando.ParamByName('COBRAR').AsString := 'S'
      else
        comando.ParamByName('COBRAR').AsString := 'N';
      comando.ExecOrOpen;
      TR_OS.CommitRetaining;
    except
       on E: Exception do
          begin 
              TR_OS.RollbackRetaining;
              AlertaCad('Erro ao inserir item!' + #13 + E.Message );
          end;
    end;
    Itens.Close;
    Itens.sql.Text :=
      'Select * from MMA_ORDEM_ITENS where COD_OS=:COD_OS order by cod';
    Itens.ParamByName('COD_OS').AsInteger := BuscaOSCOD.AsInteger;
    Itens.Open;
    cod_produto.Clear;
    descricao_produto.Clear;
    unidade.Clear;
    valor_unid.Value := 0;
    quantidade.Value := 1;
    desconto.Value := 0;
    Cobrar.Checked := True;
    total_item.Value := 0;
    comando.Close;
    comando.sql.Text :=
      'select SUM( VALOR_TOTAL ) from MMA_ORDEM_ITENS where COD_OS=' +
      BuscaOSCOD.AsString + ' and COBRAR=' + quotedstr('S');
    comando.Open;
    if not(DOS.State = dsEdit) then
      BuscaOS.Edit;
    BuscaOSTOTAL_PROD.AsFloat := comando.FieldByName('SUM').AsFloat;
    comando.Close;
  end;
  Image3Click( nil );
end;

procedure TFrmMMA_OS.SpeedButton7Click(Sender: TObject);
begin 
  if not ItensCOD.IsNull then
  begin 
    try
      comando.Close;
      comando.sql.Text :=
        'delete from MMA_ORDEM_ITENS where COD=' + ItensCOD.AsString;
      comando.ExecOrOpen;
      TR_OS.CommitRetaining;
    except
      TR_OS.RollbackRetaining;
      AlertaCad('Erro ao excluir item!');
    end;
    Itens.Close;
    Itens.sql.Text :=
      'Select * from MMA_ORDEM_ITENS where COD_OS=:COD_OS order by cod';
    Itens.ParamByName('COD_OS').AsInteger := BuscaOSCOD.AsInteger;
    Itens.Open;
    cod_produto.Clear;
    descricao_produto.Clear;
    unidade.Clear;
    valor_unid.Value := 0;
    quantidade.Value := 1;
    desconto.Value := 0;
    Cobrar.Checked := True;
    total_item.Value := 0;
    comando.Close;
    comando.sql.Text :=
      'select SUM( VALOR_TOTAL ) from MMA_ORDEM_ITENS where COD_OS=' +
      BuscaOSCOD.AsString + ' and COBRAR=' + quotedstr('S');
    comando.Open;
    if not(DOS.State = dsEdit) then
      BuscaOS.Edit;

    BuscaOSTOTAL_PROD.AsFloat := comando.FieldByName('SUM').AsFloat;
    comando.Close;
  end;
  Image3Click( nil );
end;

procedure TFrmMMA_OS.SpeedButton8Click(Sender: TObject);
begin 
  if (data_evento.Text <> '') and (descricao_evento.Text <> '') then
  begin 
    try
      comando.Close;
      comando.sql.Text :=
        'insert into MMA_ORDEM_HISTORICO( COD_OS, DATA, DESCRICAO ) ' +
        'values( :COD_OS, :DATA, :DESCRICAO )';
      comando.ParamByName('COD_OS').AsInteger := BuscaOSCOD.AsInteger;
      comando.ParamByName('DATA').AsDate := data_evento.date;
      comando.ParamByName('DESCRICAO').AsString := descricao_evento.Text;
      comando.ExecOrOpen;
      TR_OS.CommitRetaining;
      data_evento.date := date;
      descricao_evento.Clear;
    except
      TR_OS.RollbackRetaining;
      AlertaCad('Erro ao adicionar evento!');
    end;
    Historico.Close;
    Historico.sql.Text :=
      'Select * from MMA_ORDEM_HISTORICO where COD_OS=:COD_OS order by cod';
    Historico.ParamByName('COD_OS').AsInteger := BuscaOSCOD.AsInteger;
    Historico.Open;

  end;
end;

procedure TFrmMMA_OS.SpeedButton9Click(Sender: TObject);
begin 
  if not HistoricoCOD.IsNull then
  begin 
    try
      frmDeletaOS.Panel5.Caption := 'Excluir Histórico';
      frmDeletaOS.showmodal;
      if frmDeletaOS.senhaex <> '' then
      begin 
        comando.Close;
        comando.sql.Text := 'select SENHA_EXCLUIR_VENDA from parametros';
        comando.Open;
        if frmDeletaOS.senhaex = comando.FieldByName('SENHA_EXCLUIR_VENDA')
          .AsString then
        begin 
          comando.Close;
          comando.sql.Text :=
            'delete from MMA_ORDEM_HISTORICO where COD=' +
            HistoricoCOD.AsString;
          comando.ExecOrOpen;
          comando.Close;
          TR_OS.CommitRetaining;
        end
        else
        begin 
          AlertaCad('Senha inválida!');
          comando.Close;
        end;
      end;

    except
      TR_OS.RollbackRetaining;
      AlertaCad('Erro ao deletar evento!');
    end;
    Historico.Close;
    Historico.sql.Text :=
      'Select * from MMA_ORDEM_HISTORICO where COD_OS=:COD_OS order by cod';
    Historico.ParamByName('COD_OS').AsInteger := BuscaOSCOD.AsInteger;
    Historico.Open;

  end;

end;

procedure TFrmMMA_OS.statusChange(Sender: TObject);
var
  motivo: String;
begin 
  { ABERTA
    ORÇAMENTO
    AGUARDANDO AUT.
    AUTORIZADO
    NÃO AUT.
    PRONTO
    ENTREGUE PRONTO
    ENTREGUE SEM CONS.
    }
  motivo := '';
  if status.ItemIndex = 1 then
  begin 
    BuscaOSDATA_ORCAMENTO.AsDateTime := date;
    comando.Close;
    comando.sql.Text :=
      'insert into MMA_ORDEM_HISTORICO( COD_OS, DATA, DESCRICAO ) ' +
      'values( :COD_OS, current_date, :DESCRICAO )';
    comando.ParamByName('COD_OS').AsInteger := BuscaOSCOD.AsInteger;
    comando.ParamByName('DESCRICAO').AsString := 'ORÇAMENTO PRONTO';
    comando.ExecOrOpen;
    comando.Close;
  end;
  if status.ItemIndex = 2 then
  begin 

    comando.Close;
    comando.sql.Text :=
      'insert into MMA_ORDEM_HISTORICO( COD_OS, DATA, DESCRICAO ) ' +
      'values( :COD_OS, current_date, :DESCRICAO )';
    comando.ParamByName('COD_OS').AsInteger := BuscaOSCOD.AsInteger;
    comando.ParamByName('DESCRICAO').AsString :=
      'PASSADO ORÇAMENTO AGUARDANDO AUTORIZAÇÃO';
    comando.ExecOrOpen;
    comando.Close;
  end;
  if status.ItemIndex = 3 then
  begin 
    motivo := inputbox('Autorizarção de conserto', 'Autorizado por :', '');
    if motivo = '' then
    begin 
      BuscaOS.Cancel;
      exit;
    end;
    comando.Close;
    comando.sql.Text :=
      'insert into MMA_ORDEM_HISTORICO( COD_OS, DATA, DESCRICAO ) ' +
      'values( :COD_OS, current_date, :DESCRICAO )';
    comando.ParamByName('COD_OS').AsInteger := BuscaOSCOD.AsInteger;
    comando.ParamByName('DESCRICAO').AsString := 'Autorizado por : ' + uppercase
      (motivo);
    comando.ExecOrOpen;
    comando.Close;
  end;
  if status.ItemIndex = 4 then
  begin 
    motivo := inputbox('Rejeição de conserto', 'Rejeitado por :', '');
    if motivo = '' then
    begin 
      BuscaOS.Cancel;
      exit;
    end;
    comando.Close;
    comando.sql.Text :=
      'insert into MMA_ORDEM_HISTORICO( COD_OS, DATA, DESCRICAO ) ' +
      'values( :COD_OS, current_date, :DESCRICAO )';
    comando.ParamByName('COD_OS').AsInteger := BuscaOSCOD.AsInteger;
    comando.ParamByName('DESCRICAO').AsString := 'Rejeitado por : ' + uppercase
      (motivo);
    comando.ExecOrOpen;
    comando.Close;
  end;

  if status.ItemIndex = 5 then
  begin 

    comando.Close;
    comando.sql.Text :=
      'insert into MMA_ORDEM_HISTORICO( COD_OS, DATA, DESCRICAO ) ' +
      'values( :COD_OS, current_date, :DESCRICAO )';
    comando.ParamByName('COD_OS').AsInteger := BuscaOSCOD.AsInteger;
    comando.ParamByName('DESCRICAO').AsString := 'PRONTO';
    comando.ExecOrOpen;
    comando.Close;
  end;
  Itens.Close;
  Itens.sql.Text :=
    'Select * from MMA_ORDEM_ITENS where COD_OS=:COD_OS order by cod';
  Itens.ParamByName('COD_OS').AsInteger := BuscaOSCOD.AsInteger;
  Itens.Open;
  Historico.Close;
  Historico.sql.Text :=
    'Select * from MMA_ORDEM_HISTORICO where COD_OS=:COD_OS order by cod';
  Historico.ParamByName('COD_OS').AsInteger := BuscaOSCOD.AsInteger;
  Historico.Open;

end;

procedure TFrmMMA_OS.TabSheet1Show(Sender: TObject);
begin 
  PaginasOS.TabIndex := 0;
end;

procedure TFrmMMA_OS.TabSheet3Show(Sender: TObject);
begin 
  cod_produto.Clear;
  descricao_produto.Clear;
  unidade.Clear;
  valor_unid.Value := 0;
  quantidade.Value := 1;
  desconto.Value := 0;
  Cobrar.Checked := True;
  total_item.Value := 0;
end;

procedure TFrmMMA_OS.TabSheet4Show(Sender: TObject);
begin 
  /// clred NÂO AUT.
  /// clGreen PRONTO
  ///
  if BuscaOSSTATUS.AsString = 'PRONTO' then
  begin 
    entrega_p.Enabled := True;
    entrega_S.Enabled := False;
  end
  else if BuscaOSSTATUS.AsString = 'NÃO AUT.' then
  begin 
    entrega_p.Enabled := False;
    entrega_S.Enabled := True;
  end
  else
  begin 
    entrega_p.Enabled := False;
    entrega_S.Enabled := False;
  end;

end;

procedure TFrmMMA_OS.ImprimeEntrada;
var
     subtotal, total : currency;
     linha : integer;
     traco : string;
     Razao_emp, Endereco_emp, CEP_emp, CID_emp,
     ESTADO_EMP, Numero_emp, TEL_EMP: string;

     COD_CLI,CLI, END_CLI, NUMERO_CLI, CEP_CLI, CID_CLI, ESTADO_CLI: String;
     Conf: String;
begin 
  //
     Total := 0;
     Traco    := '-------------------------------------------------------';
     rdprint1.TamanhoQteLinhas      := 1;      // Linhas (deve ser 1 quando for CUPOM)
     rdprint1.TamanhoQteColunas     := 55;     // Largura da Bobina aprox. 7 cm (7 / 2.54 * 20)
     rdprint1.FonteTamanhoPadrao    := s20cpp; // Fonte Comprimido em 20 cpp
     rdprint1.TitulodoRelatorio := 'Ordem de Serviço';
     rdprint1.OpcoesPreview.Preview := false;
     if dm.IBTransaction.Active then
        dm.IBTransaction.Commit;
     dm.IBTransaction.StartTransaction;

     // DADOS DA EMPRESA
     dm.QConsulta.Close;
     dm.QConsulta.SQL.text := 'select * from EMPRESA where COD_EMP=:CODEMP';
     dm.QConsulta.ParamByName('CODEMP').AsInteger := iEmp;
     dm.QConsulta.Open;
     if dm.QConsulta.IsEmpty then
        begin 
           AlertaCad( 'Erro ao buscar dados da empresa' );
           dm.QConsulta.Close;
           dm.IBTransaction.Commit;
           exit;
        end;
     Razao_emp := dm.QConsulta.FieldByName('RAZAO_EMP').AsString;
     Endereco_emp := dm.QConsulta.FieldByName('END_EMP').AsString;
     Numero_emp := dm.QConsulta.FieldByName('NUMERO_EMP').AsString;
     CEP_EMP := dm.QConsulta.FieldByName('CEP_EMP').AsString;
     CID_emp := dm.QConsulta.FieldByName('CID_EMP').AsString;
     ESTADO_emp := dm.QConsulta.FieldByName('EST_EMP').AsString;
     TEL_emp := dm.QConsulta.FieldByName('TEL_EMP').AsString;
     dm.QConsulta.Close;

     if dm.IBTransaction.Active then
        dm.IBTransaction.Commit;
     dm.IBTransaction.StartTransaction;

     //DADOS DO CLIENTE
     dm.QConsulta.SQL.Text := 'select * from CLIENTE where COD_CLI=:CODCLI';
     dm.QConsulta.ParamByName('CODCLI').AsString := BuscaOSCOD_CLI.AsString;
     dm.QConsulta.Open;
     if dm.QConsulta.IsEmpty then
        begin 
           AlertaCad( 'Erro ao buscar dados do cliente' );
           dm.QConsulta.Close;
           dm.IBTransaction.Commit;
           exit;
        end;
     COD_CLI := dm.QConsulta.FieldByName( 'COD_CLI' ).AsString;
     CLI := dm.QConsulta.FieldByName('NOME_CLI').AsString;
     END_CLI := dm.QConsulta.FieldByName('ENDRES_CLI').AsString;
     Numero_CLI := dm.QConsulta.FieldByName('NUMRES_CLI').AsString;
     CEP_CLI := dm.QConsulta.FieldByName('CEPRES_CLI').AsString;
     CID_CLI := dm.QConsulta.FieldByName('CIDRES_CLI').AsString;
     ESTADO_CLI := dm.QConsulta.FieldByName('ESTRES_CLI').AsString;
     dm.QConsulta.Close;

     dm.IBTransaction.Commit;

     // Cabeçalho do Cupom...
     Linha := 1;

     with rdprint1 do
        begin 
        abrir;
        Inc(Linha );
        if length( Razao_emp ) > 32 then
           impc(Linha,28,RAZAO_EMP,[comp17, Negrito])
        else
           impc(Linha,28,RAZAO_EMP,[comp12, Negrito]);
        Inc(Linha );
        impc(Linha,28,ENDERECO_EMP + ',' + NUMERO_EMP ,[Comp12]);
        Inc(Linha );
        impc(Linha,28,CEP_EMP + ' - ' + CID_EMP + ' - ' + ESTADO_EMP,[Comp12]);
        Inc(Linha );
        impc(Linha,28,'Fone ' + tel_emp,[Comp12]);
//        ImpC( )
        // Dados do Cliente...
        Inc(Linha );
        Inc(Linha );
        impf( Linha, 01, 'OS: ' + BuscaOSCOD.AsString + '  DATA :' + BuscaOSDATA_ENTRADA.AsString, [comp12] );
        Inc(Linha );
        impf( Linha, 01, 'PREVISAO ENTREGA: ' + BuscaOSDATA_ORCAMENTO.AsString, [comp12] );
        Inc(Linha );
        Inc(Linha );
        impf( Linha, 01, 'DADOS CLIENTE', [comp12]  );
        Inc(Linha );
        imp (Linha,01,traco);
        Inc(Linha );
        impf(Linha,01,CLI + ' - ' + COD_CLI,[comp12]);
        Inc(Linha );
        impf(Linha,01, END_CLI + ',' + NUMERO_CLI,[comp12]);
        Inc(Linha );
        impf(Linha,01,CEP_CLI  + ' - ' +
                   CID_CLI + ' - ' +
                   ESTADO_CLI, [comp12]);
        Inc(Linha );
        impf(Linha,01,'Telefone : ' + BuscaOSTELEFONE.AsString, [comp12]);

        // Titulo dos Itens...
        Inc(Linha );
        imp (Linha,01,traco);
        Inc(Linha );
        imp (Linha,01,'Qte Descricao dos Produtos        UN Unitario Sub-Total');
        Inc(Linha );
        imp (Linha,01,traco);
        end;
        Itens.First;
        Inc( Linha );

        // ITENS
        while not Itens.Eof do
        begin 
            with rdprint1 do
               begin 
                   impval(linha,01,'##0',itensquant.Value,[]);
                   impf  (linha,05,ItensDESCRICAO.AsString,[]);
                   impf  (linha,35,ItensUNID.AsString,  []);
                   impval(linha,38,'#,##0.00', ItensVALOR_UNID.Value,[]);
                   subtotal := ItensVALOR_TOTAL.Value;
                   total    := total + subtotal;
                   impval(linha,47,'##,##0.00', subtotal, []);
                   inc(linha);
               end;
          itens.next;
        end;

      // FINAL
      Inc(Linha);
      with RDprint1 do
      begin 
          imp   (linha,01,traco);
          inc   (linha);
          imp   (linha,01,'Total Geral ');
          impval(linha,42,'###,###,##0.00',total,[]);
          Inc( linha );
          imp   (linha,01,traco);
          Inc( linha );
          ImpC( Linha, 28, 'COMPROVANTE DE SERVICOS', [comp12] );
          Inc( Linha );
          ImpC( linha, 28, 'SOLICITADOS',[comp12] );
          Inc( linha );
          imp   (linha,01,traco);

      end;

     rdprint1.OpcoesPreview.Preview := true;
      rdprint1.TamanhoQteLinhas := linha;
      RDprint1.Fechar;
     rdprint1.OpcoesPreview.Preview := false;
      rdprint1.TamanhoQteLinhas := 1;


end;


procedure TFrmMMA_OS.ImprimeEntregue;
var
     subtotal, total : currency;
     linha : integer;
     traco : string;
     Razao_emp, Endereco_emp, CEP_emp, CID_emp,
     ESTADO_EMP, Numero_emp, TEL_EMP: string;

     COD_CLI, CLI, END_CLI, NUMERO_CLI, CEP_CLI, CID_CLI, ESTADO_CLI: String;
     Conf: String;
begin 
  //
     Total := 0;
     Traco    := '-------------------------------------------------------';
     rdprint1.TamanhoQteLinhas      := 1;      // Linhas (deve ser 1 quando for CUPOM)
     rdprint1.TamanhoQteColunas     := 55;     // Largura da Bobina aprox. 7 cm (7 / 2.54 * 20)
     rdprint1.FonteTamanhoPadrao    := s20cpp; // Fonte Comprimido em 20 cpp
     rdprint1.TitulodoRelatorio := 'Ordem de Serviço';
     rdprint1.OpcoesPreview.Preview := false;
     if dm.IBTransaction.Active then
        dm.IBTransaction.Commit;
     dm.IBTransaction.StartTransaction;

     // DADOS DA EMPRESA
     dm.QConsulta.Close;
     dm.QConsulta.SQL.text := 'select * from EMPRESA where COD_EMP=:CODEMP';
     dm.QConsulta.ParamByName('CODEMP').AsInteger := iEmp;
     dm.QConsulta.Open;
     if dm.QConsulta.IsEmpty then
        begin 
           AlertaCad( 'Erro ao buscar dados da empresa' );
           dm.QConsulta.Close;
           dm.IBTransaction.Commit;
           exit;
        end;
     Razao_emp := dm.QConsulta.FieldByName('RAZAO_EMP').AsString;
     Endereco_emp := dm.QConsulta.FieldByName('END_EMP').AsString;
     Numero_emp := dm.QConsulta.FieldByName('NUMERO_EMP').AsString;
     CEP_EMP := dm.QConsulta.FieldByName('CEP_EMP').AsString;
     CID_emp := dm.QConsulta.FieldByName('CID_EMP').AsString;
     ESTADO_emp := dm.QConsulta.FieldByName('EST_EMP').AsString;
     TEL_emp := dm.QConsulta.FieldByName('TEL_EMP').AsString;
     dm.QConsulta.Close;

     if dm.IBTransaction.Active then
        dm.IBTransaction.Commit;
     dm.IBTransaction.StartTransaction;

     //DADOS DO CLIENTE
     dm.QConsulta.SQL.Text := 'select * from CLIENTE where COD_CLI=:CODCLI';
     dm.QConsulta.ParamByName('CODCLI').AsString := BuscaOSCOD_CLI.AsString;
     dm.QConsulta.Open;
     if dm.QConsulta.IsEmpty then
        begin 
           AlertaCad( 'Erro ao buscar dados do cliente' );
           dm.QConsulta.Close;
           dm.IBTransaction.Commit;
           exit;
        end;
        COD_CLI := dm.QConsulta.FieldByName( 'COD_CLI' ).AsString;
     CLI := dm.QConsulta.FieldByName('NOME_CLI').AsString;
     END_CLI := dm.QConsulta.FieldByName('ENDRES_CLI').AsString;
     Numero_CLI := dm.QConsulta.FieldByName('NUMRES_CLI').AsString;
     CEP_CLI := dm.QConsulta.FieldByName('CEPRES_CLI').AsString;
     CID_CLI := dm.QConsulta.FieldByName('CIDRES_CLI').AsString;
     ESTADO_CLI := dm.QConsulta.FieldByName('ESTRES_CLI').AsString;
     dm.QConsulta.Close;

     dm.IBTransaction.Commit;

     // Cabeçalho do Cupom...
     Linha := 1;

     with rdprint1 do
        begin 
        abrir;
        Inc(Linha );
        if length( Razao_emp ) > 32 then
           impc(Linha,28,RAZAO_EMP,[comp17, Negrito])
        else
           impc(Linha,28,RAZAO_EMP,[comp12, Negrito]);
        Inc(Linha );
        impc(Linha,28,ENDERECO_EMP + ',' + NUMERO_EMP ,[Comp12]);
        Inc(Linha );
        impc(Linha,28,CEP_EMP + ' - ' + CID_EMP + ' - ' + ESTADO_EMP,[Comp12]);
        Inc(Linha );
        impc(Linha,28,'Fone ' + tel_emp,[Comp12]);
//        ImpC( )
        // Dados do Cliente...
        Inc(Linha );
        Inc(Linha );
        impf( Linha, 01, 'OS: ' + BuscaOSCOD.AsString + '  DATA :' + BuscaOSDATA_ENTRADA.AsString, [comp12] );
        Inc(Linha );
        impf( Linha, 01, 'PREVISAO ENTREGA: ' + BuscaOSDATA_ORCAMENTO.AsString, [comp12] );
        Inc(Linha );
        impf( Linha, 01, 'DATA DA ENTREGA: ' + BuscaOSDATA_FECHAMENTO.AsString, [comp12] );
        Inc(Linha );
        Inc(Linha );
        impf( Linha, 01, 'DADOS CLIENTE', [comp12]  );
        Inc(Linha );
        imp (Linha,01,traco);
        Inc(Linha );
        impf(Linha,01,CLI + ' - ' + COD_CLI,[comp12]);
        Inc(Linha );
        impf(Linha,01, END_CLI + ',' + NUMERO_CLI,[comp12]);
        Inc(Linha );
        impf(Linha,01,CEP_CLI  + ' - ' +
                   CID_CLI + ' - ' +
                   ESTADO_CLI, [comp12]);
        Inc(Linha );
        impf(Linha,01,'Telefone : ' + BuscaOSTELEFONE.AsString, [comp12]);

        // Titulo dos Itens...
        Inc(Linha );
        imp (Linha,01,traco);
        Inc(Linha );
        imp (Linha,01,'Qte Descricao dos Produtos        UN UnitArio Sub-Total');
        Inc(Linha );
        imp (Linha,01,traco);
        end;
        Itens.First;
        Inc( Linha );

        // ITENS
        while not Itens.Eof do
        begin 
            with rdprint1 do
               begin 
                   impval(linha,01,'##0',itensquant.Value,[]);
                   impf  (linha,05,ItensDESCRICAO.AsString,[]);
                   impf  (linha,35,ItensUNID.AsString,  []);
                   impval(linha,38,'#,##0.00', ItensVALOR_UNID.Value,[]);
                   subtotal := ItensVALOR_TOTAL.Value;
                   total    := total + subtotal;
                   impval(linha,47,'##,##0.00', subtotal, []);
                   inc(linha);
               end;
          itens.next;
        end;
      if DM.IBTransaction.Active then
         dm.IBTransaction.Commit;
      dm.IBTransaction.StartTransaction;
      QReceber.sql.Text :=
      'select * from CONTAS_RECEBER where COD_OS_MMA=' + BuscaOSCOD.AsString;
      QReceber.Open;
      // FINAL
      Inc(Linha);
      with RDprint1 do
      begin 
          imp   (linha,01,traco);
          inc   (linha);
          imp   (linha,01,'Total Geral ');
          impval(linha,42,'###,###,##0.00',total,[]);
          Inc(Linha);
          // Formas de pagamento
            imp   (linha,01,traco);
            inc   (linha);
            impf(linha,01,'Formas de pagamento',[comp12,negrito]);
            Inc( Linha );
            imp   (linha,01,traco);
            inc   (linha);

          QReceber.Last;
          QReceber.First;
          if ( QReceber.RecordCount = 1 ) and ( not ( QReceberDTPAGTO_CTR.IsNull ) ) then
             begin 
                impf  (linha,01,'Pagamento a Vista  ',[]);
                impval(linha,38,'#,##0.00', QReceberVLRPAGO_CTR.Value,[]);
             end
          else
          while not QReceber.Eof do
             begin 
                impf  (linha,01,'Pac.: ' + QReceberPARCELA_CTR.AsString,[]);
                impf  (linha,10,'Venc.: ' + QReceberVENCTO_CTR.AsString,  []);
                impf  (linha,30,'Valor: ',  []);
                impval(linha,38,'#,##0.00', QReceberVALOR_CTR.Value,[]);
                if QReceberVLRPAGO_CTR.AsCurrency > 0 then
                   ImpF( Linha, 51, 'PAGO', [] );
                Inc( Linha );
                QReceber.Next;
             end;
          Inc( linha );
          imp   (linha,01,traco);
          Inc( linha );
          ImpC( Linha, 28, 'COMPROVANTE DE SERVIÇOS', [comp12] );
          Inc( Linha );
          ImpC( linha, 28, 'ENTREGUES',[comp12] );
          Inc( Linha );
          ImpC( linha, 28, 'Obrigado(a). Volte Sempre!',[comp12] );

          Inc( linha );
          imp   (linha,01,traco);

      end;

     rdprint1.OpcoesPreview.Preview := true;
      rdprint1.TamanhoQteLinhas := linha;
      RDprint1.Fechar;
     rdprint1.OpcoesPreview.Preview := false;
      rdprint1.TamanhoQteLinhas := 1;
      QReceber.Close;
     dm.IBTransaction.Commit;

end;




end.

