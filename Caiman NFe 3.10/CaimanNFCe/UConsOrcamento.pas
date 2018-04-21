unit UConsOrcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, ComCtrls, DB, ACBrDevice, 
  frxClass, frxDBSet, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmConsOrcamento = class(TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    GB1: TGroupBox;
    ComboCons: TComboBox;
    GB2: TGroupBox;
    EdtCons: TEdit;
    BtnOk: TButton;
    BtnSair: TButton;
    IBTRConsOrcamento: TFDTransaction;
    QConsOrcamento: TFDQuery;
    DSQOrcamento: TDataSource;
    Label1: TLabel;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    Panel3: TPanel;
    Button1: TButton;
    QBuscaItens: TFDQuery;
    QConsulta: TFDQuery;
    QConsOrcamentoCODIGO: TIntegerField;
    QConsOrcamentoSEQUENCIA_DAV: TLargeintField;
    QConsOrcamentoCOD_EMP: TIntegerField;
    QConsOrcamentoDATA: TDateField;
    QConsOrcamentoCOD_CLI: TIntegerField;
    QConsOrcamentoCOD_TPV: TIntegerField;
    QConsOrcamentoCOD_VEND: TIntegerField;
    QConsOrcamentoTOTAL: TBCDField;
    QConsOrcamentoSTATUS: TIntegerField;
    QConsOrcamentoCOO: TIntegerField;
    QConsOrcamentoCOO_VENDA: TIntegerField;
    QConsOrcamentoCOD_CAI: TIntegerField;
    QConsOrcamentoCCF_VENDA: TIntegerField;
    QConsOrcamentoNOME_CLI: TStringField;
    QConsOrcamentoNOME_TPV: TStringField;
    QConsOrcamentoNOME_VEND: TStringField;
    QConsOrcamentoENDRES_CLI: TStringField;
    QBuscaItensCODIGO: TIntegerField;
    QBuscaItensORDEM: TIntegerField;
    QBuscaItensCOD_PRO: TIntegerField;
    QBuscaItensDESCONTO: TBCDField;
    QBuscaItensCOD_EMP: TIntegerField;
    QBuscaItensQUANT: TBCDField;
    QBuscaItensVALOR: TBCDField;
    QBuscaItensPRODUTO_PROMOCAO: TStringField;
    QBuscaItensCANCELADO: TIntegerField;
    QBuscaItensCHAVE: TStringField;
    QBuscaItensDATA_INCLUSAO: TDateField;
    QBuscaItensNOME_PRO: TStringField;
    QBuscaItensDESC_CUPOM: TStringField;
    QBuscaItensDESCRICAO: TStringField;
    QBuscaItensCODIGO_BARRA_PRO: TStringField;
    QConsOrcamentoCALC_STATUS: TStringField;
    RelatorioDAV: TfrxReport;
    DAVItem: TfrxDBDataset;
    DAV: TfrxDBDataset;
    QBuscaItensSUB_TOTAL: TCurrencyField;
    QConsOrcamentoCNPJ_CLI: TStringField;
    QConsOrcamentoRAZAO_EMP: TStringField;
    QConsOrcamentoCNPJ_EMP: TStringField;
    QConsOrcamentoSEQ_PROC: TStringField;
    DataSource1: TDataSource;
    QBuscaItensSTATUS2: TStringField;
    procedure ComboConsChange(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure EdtConsKeyPress(Sender: TObject; var Key: Char);
    procedure QConsOrcamentoCalcFields(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure ImprimeECF;
    procedure ImprimeNaoFiscal;
    procedure QBuscaItensCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsOrcamento: TFrmConsOrcamento;

implementation
uses
  Udm, UMenuFiscal, Ubibli1;
var  sSql : string;

{$R *.dfm}

procedure TFrmConsOrcamento.ComboConsChange(Sender: TObject);
begin
   EdtCons.Clear;
   case ComboCons.ItemIndex of
     0:begin
          gb2.Enabled        := true;
          GB2.Caption        := 'Código do Orçamento';
          EdtDataIni.Visible := false;
          EdtDataFin.Visible := false;
          Label1.Visible     := false;
          EdtCons.Visible    := true;
          edtcons.SetFocus;
       end;
     1:begin
          gb2.Enabled        := true;
          GB2.Caption        := 'Data';
          EdtDataIni.Visible := true;
          EdtDataFin.Visible := true;
          Label1.Visible     := true;
          EdtCons.Visible    := false;
          EdtDataIni.SetFocus;
       end;
     2:begin
          gb2.Caption:= '';
          EdtDataIni.Visible := false;
          EdtDataFin.Visible := false;
          Label1.Visible     := false;
          EdtCons.Visible    := true;
          gb2.Enabled        := false;
       end;
   end;
end;

procedure TFrmConsOrcamento.BtnSairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmConsOrcamento.Button1Click(Sender: TObject);
begin
   if ( not QConsOrcamentoCODIGO.IsNull ) then
      begin
         if ( QConsOrcamentoSTATUS.AsInteger = 0 ) then
         begin
         if TemDAVAnexoII then
            begin
               ImprimeNaoFiscal;
            end
         else
            begin
               ImprimeECF;
            end;
         end;
      end;
end;

procedure TFrmConsOrcamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if IBTRConsOrcamento.Active then
      IBTRConsOrcamento.Commit;

   QConsOrcamento.SQL.Clear;
   QConsOrcamento.SQL.Text:= sSql;
   QConsOrcamento.Close;

   { grava posicao combo }
   dm.GravaIni(GetCurrentDir + '\cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsOrcamento.ComboCons', inttostr(ComboCons.itemIndex));

   Action:= caFree;
   Self := nil;
end;

procedure TFrmConsOrcamento.FormCreate(Sender: TObject);
begin
   dm.ScaleForm( Self, False );
end;

procedure TFrmConsOrcamento.BtnOkClick(Sender: TObject);
begin
   if IBTRConsOrcamento.Active then
      IBTRConsOrcamento.Commit;
   IBTRConsOrcamento.StartTransaction;
   with QConsOrcamento do
      begin
         close;
         sql.Clear;
         sql.Text:= sSql;
         case ComboCons.ItemIndex of
           0:begin
                if edtcons.Text = '' then
                   begin
                      edtcons.SetFocus;
                      exit;
                   end;
                sql.Add(' WHERE O.SEQUENCIA_DAV = :SEQ AND O.COD_EMP = :CODEMP');
                Parambyname('seq').AsInteger    := strtoint(edtcons.Text);
                Parambyname('codemp').AsInteger := iEmp;
                open;
             end;
           1:begin
                sql.Add(' WHERE O.DATA BETWEEN :DATAINI AND :DATAFIN ' +
                        ' AND O.COD_EMP = :CODEMP ORDER BY O.CODIGO');
                Parambyname('dataini').Asdate   := EdtDataIni.Date;
                Parambyname('datafin').Asdate   := EdtDataFin.Date;
                Parambyname('codemp').AsInteger := iEmp;
                open;
             end;
           2:begin
                sql.Add(' WHERE O.STATUS = 0 AND O.COD_EMP = :CODEMP ORDER BY O.CODIGO');
                Parambyname('codemp').AsInteger := iEmp;
                open;
             end;
         end;
      end;
end;

procedure TFrmConsOrcamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmConsOrcamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close
   else
      if key = vk_F10 then
         begin
            Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
            FrmMenuFiscal.showmodal;
         end;
end;

procedure TFrmConsOrcamento.FormShow(Sender: TObject);
begin

   sSql:= QConsOrcamento.SQL.Text;
   EdtDataIni.Date:= date;
   EdtDataFin.Date:= date;

   {busca a posicao do combo}
   try
     ComboCons.ItemIndex:= strtoint(dm.LeINI(GetCurrentDir + '\cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsOrcamento.ComboCons'));
   except
     ComboCons.ItemIndex:= 0;
   end;

   ComboConsChange(ComboCons);
end;

procedure TFrmConsOrcamento.EdtConsKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmConsOrcamento.QBuscaItensCalcFields(DataSet: TDataSet);
begin
   QBuscaItensSUB_TOTAL.AsCurrency := ( QBuscaItensQUANT.AsCurrency *
   QBuscaItensVALOR.AsCurrency ) - QBuscaItensDESCONTO.AsCurrency;
   if QBuscaItensCANCELADO.AsInteger = 1 then
      QBuscaItensSTATUS2.AsString := 'Cancelado'
   else
      QBuscaItensSTATUS2.AsString := '';
end;

procedure TFrmConsOrcamento.QConsOrcamentoCalcFields(DataSet: TDataSet);
begin
   case QConsOrcamentoSTATUS.AsInteger of
    0: QConsOrcamentoCALC_STATUS.AsString:= 'ABERTO';
    1: QConsOrcamentoCALC_STATUS.AsString:= 'FECHADO';
    3: QConsOrcamentoCALC_STATUS.AsString:= 'IMPRESSO';
   end;
   QConsOrcamentoSEQ_PROC.AsString := FormataStringD( QConsOrcamentoSEQUENCIA_DAV.AsString, '10', '0' );
end;

procedure TFrmConsOrcamento.ImprimeECF;
var cAuxTotal : currency;
    sAuxCNPJ  : string;
    sIndice   : string;
    iCoo      : integer;
    CanceladoItem: Boolean;
    Codorc: integer;
begin
   cAuxTotal:= 0;
   try

   { busca o CNPJ/CPF do cliente }

   sAuxCNPJ:= dm.RetornaStringTabela('cnpj_cli', 'cliente', 'cod_cli',
     QConsOrcamentoCOD_CLI.AsInteger);
   sIndice := trim(dm.IndiceRelGerencial('ORCAMENTO'));
   dm.ECF.DAV_Abrir( QConsOrcamentoDATA.AsDateTime, 'ORÇAMENTO',
   FormataStringD( QConsOrcamentoSEQUENCIA_DAV.AsString, '10', '0' ),
   'Aberto', QConsOrcamentoNOME_VEND.AsString, '', sAuxCNPJ,
   QConsOrcamentoNOME_CLI.AsString, QConsOrcamentoENDRES_CLI.AsString  );

   Canceladoitem := False;

   { busca o COO atual }
     iCOO:= StrToInt( dm.ECF.NumCOO );
     Codorc := QConsOrcamentoCODIGO.AsInteger;

   { Impriem os Itens }
   QBuscaItens.Close;
   QBuscaItens.ParamByName('COD').AsInteger := QConsOrcamentoCODIGO.AsInteger;
   QBuscaItens.Open;
   with QBuscaItens do
      begin
         DisableControls;
         First;
         while not eof do
            begin
               if QBuscaItensCANCELADO.AsInteger = 1 then
                  Canceladoitem := true
               else
                  Canceladoitem := False;
               dm.ECF.DAV_RegistrarItem(
               QBuscaItensCODIGO_BARRA_PRO.AsString,
               QBuscaItensDESC_CUPOM.AsString,
               QBuscaItensDESCRICAO.AsString,
               QBuscaItensQUANT.AsCurrency,
               QBuscaItensVALOR.AsCurrency,
               QBuscaItensDESCONTO.AsCurrency,
               0,
                Canceladoitem );
               next;
            end;
         EnableControls;
      end;
   dm.ECF.DAV_Fechar( '' );
   QBuscaItens.Close;
   except
      ShowMessage( 'Erro ao imprimir orçamento!' );
      if dm.ECF.Estado = estRelatorio then
         dm.ECF.FechaRelatorio;
       Exit;
       Abort;
   end;

  { atualiza o orçamento }
   if IBTRConsOrcamento.Active then
      IBTRConsOrcamento.Commit;
   IBTRConsOrcamento.StartTransaction;
   try
     try
       with QConsulta do
          begin
             close;
             sql.Clear;
             sql.add('UPDATE ORCAMENTO ' +
                     'SET  COO = :COO, COD_CAI = :CAIXA, STATUS=3, STATUS_ALTERADO=0 ' +
                     'WHERE CODIGO = :COD ');
             Parambyname('cod').AsInteger    := Codorc;
//             Parambyname('total').AsCurrency := cTotalOrcamento; TOTAL = :TOTAL
             Parambyname('caixa').AsInteger  := iCaixa;
             if iCOO = 0 then
                Parambyname('coo').Value     := null
             else
                Parambyname('coo').AsInteger := iCOO;

             ExecOrOpen;
          end;
       IBTRConsOrcamento.Commit;
     except
       IBTRConsOrcamento.Rollback;
       showmessage('Erro ao atualizar o Orçamento');
     end;
   finally
    Qconsulta.Close;
   end;
   BtnOk.Click;



end;


procedure TFrmConsOrcamento.ImprimeNaoFiscal;
var sCNPJEmpresa, sEmpresa, sCNPJCLiente : string;
   CodOrc: Integer;
begin
   { busca dados da empresa}
   CodOrc := QConsOrcamentoCODIGO.AsInteger;
   try
     try
       with QConsulta do
          begin
             close;
             sql.Clear;
             sql.Text:= 'SELECT RAZAO_EMP, CNPJ_EMP ' +
                        'FROM EMPRESA ' +
                        'WHERE COD_EMP = :CODEMP';
             Parambyname('codemp').AsInteger:= iEmp;
             open;
             sEmpresa       := fieldbyname('razao_emp').AsString;
             sCNPJEmpresa   := fieldbyname('cnpj_emp').AsString;
          end;
     except
       showmessage('Erro ao buscar os dados da empresa');
       BtnOk.Click;
       Exit;
     end;
   finally
     QConsulta.close;
   end;

   sCNPJCLiente:= DM.RetornaStringTabela('cnpj_cli', 'cliente', 'cod_cli', QConsOrcamentoCODIGO.AsInteger);

   QBuscaItens.Close;
   QBuscaItens.ParamByName( 'COD' ).AsInteger := QConsOrcamentoCODIGO.AsInteger;
   QBuscaItens.Open;
   RelatorioDAV.ShowReport( );
   QBuscaItens.Close;
  { atualiza o orçamento }
   if IBTRConsOrcamento.Active then
      IBTRConsOrcamento.Commit;
   IBTRConsOrcamento.StartTransaction;
   try
     try
       with QConsulta do
          begin
             close;
             sql.Clear;
             sql.add('UPDATE ORCAMENTO ' +
                     'SET   COD_CAI = :CAIXA, STATUS=3, STATUS_ALTERADO=0 ' +
                     'WHERE CODIGO = :COD ');
             Parambyname('cod').AsInteger    := Codorc;
             Parambyname('caixa').AsInteger  := iCaixa;
             ExecOrOpen;
          end;
       IBTRConsOrcamento.Commit;
     except
       IBTRConsOrcamento.Rollback;
       showmessage('Erro ao atualizar o Orçamento');
     end;
   finally
    Qconsulta.Close;
   end;
   BtnOk.Click;


end;



end.
