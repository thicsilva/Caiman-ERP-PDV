unit UTransfMesa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, Grids, DBGrids, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmTransfMesa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Label2: TLabel;
    EdtOrigem: TEdit;
    EdtDestino: TEdit;
    BtnTransfItem: TBitBtn;
    BtnSair: TBitBtn;
    IBSPTransf: TFDStoredProc;
    QTransf: TFDQuery;
    DBGrid1: TDBGrid;
    BtnOK: TBitBtn;
    BtnTransfTudo: TBitBtn;
    IBTRItensMesa: TFDTransaction;
    QBuscaItensOrigem: TFDQuery;
    QBuscaItensOrigemCODIGO: TIntegerField;
    QBuscaItensOrigemORDEM: TIntegerField;
    QBuscaItensOrigemCOD_PRO: TIntegerField;
    QBuscaItensOrigemCOD_VEND: TIntegerField;
    QBuscaItensOrigemVALOR: TBCDField;
    QBuscaItensOrigemNOME_PRO: TStringField;
    QBuscaItensOrigemNOME_VEND: TStringField;
    QBuscaItensOrigemCALC_TOTAL: TCurrencyField;
    QBuscaItensOrigemCOD_EMP: TIntegerField;
    QBuscaItensOrigemQUANT: TBCDField;
    QBuscaItensOrigemDESC_CUPOM: TStringField;
    QBuscaItensOrigemCALC_DESCRICAO: TStringField;
    QBuscaItensOrigemCONTA_ORIGEM: TIntegerField;
    QBuscaItensOrigemCANCELADO: TIntegerField;
    DSQBuscaItensOrigem: TDataSource;
    QInsMesa: TFDQuery;
    QInsMesaCODIGO: TIntegerField;
    QOrdem: TFDQuery;
    QOrdemORDEM: TIntegerField;
    QBuscaMesa: TFDQuery;
    QBuscaItensOrigemMESA_ORIGEM: TStringField;
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function MesaAberta(const iMesa : integer) : integer;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtDestinoExit(Sender: TObject);
    procedure EdtDestinoEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure QBuscaItensOrigemCalcFields(DataSet: TDataSet);
    procedure BtnTransfTudoClick(Sender: TObject);
    procedure BtnTransfItemClick(Sender: TObject);
    function  OrdemItemDestino(const iCodigoContaCliente : integer) : integer;
    procedure FormCreate(Sender: TObject);
    procedure AtualizaDataMesa( codO, CodD: Integer );
  private
    { Private declarations }
  public
    { Public declarations }
    iedtOrigem: Integer;
    iedtDestino: Integer;
  end;

var
  FrmTransfMesa: TFrmTransfMesa;

implementation
uses
  Udm, UMenuFiscal, UMesas, UDialog;
var iCodigoOrigem, iCodigoDestino : Integer;

{$R *.dfm}

function TFrmTransfMesa.MesaAberta(const iMesa : integer) : integer;
begin
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   try
     try
        with dm.QConsultaServer do
           begin
              close;
              sql.Clear;
              sql.Text:= 'SELECT CODIGO ' +
                         'FROM CONTA_CLIENTE    ' +
                         'WHERE CONTA = :CONTA AND STATUS = 0';
              Parambyname('conta').AsInteger:= iMesa;
              open;
              Result:= fieldbyname('codigo').AsInteger;
           end;
        dm.IBTRServer.Commit;
     except
        dm.IBTRServer.Rollback;
        result:= 0;
        showmessage('Erro ao buscar o código da Conta');
     end;
   finally
     dm.QConsultaServer.Close;
   end;
end;

procedure TFrmTransfMesa.BtnSairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmTransfMesa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if IBTRItensMesa.Active then
      IBTRItensMesa.Commit;
   QBuscaItensOrigem.Close;
   Action:= caFree;
   Self := nil;
end;

procedure TFrmTransfMesa.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmTransfMesa.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmTransfMesa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close
   else
      if key = vk_f10 then
         begin
            Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
            FrmMenuFiscal.showmodal;
         end;
end;

procedure TFrmTransfMesa.EdtDestinoExit(Sender: TObject);
begin
   if BtnSair.Focused then
      exit;
   if trim(EdtOrigem.Text) = trim(EdtDestino.Text) then
      begin
         showmessage('A mesa destino não pode ser igual a mesa origem');
         EdtDestino.SetFocus;
      end;
end;

procedure TFrmTransfMesa.EdtDestinoEnter(Sender: TObject);
begin
   EdtOrigem.SelectAll;
end;

procedure TFrmTransfMesa.FormShow(Sender: TObject);
begin

   EdtOrigem.Clear;
   EdtDestino.Clear;
   EdtOrigem.SetFocus;
end;

procedure TFrmTransfMesa.AtualizaDataMesa( codO, Codd: Integer );
var
   DataMesaO: TDateTime;
   DataMesaD: TDateTime;

begin
   if dm.IBTRServer.Active then
      dm.IBTRServer.Commit;
   dm.IBTRServer.StartTransaction;
   try
     try
        with dm.QConsultaServer do
           begin
              close;
              sql.Clear;
              sql.Text:= 'select ( select cc.DATA_ABERTURA from conta_cliente cc '+
              'where cc.CODIGO=:COD1 ) DATA1, '+
              ' ( select c.DATA_ABERTURA from conta_cliente c where c.CODIGO=:COD2) '+
              ' DATA2 from RDB$Connection';
              Parambyname('COD1').AsInteger:= codo;
              Parambyname('COD2').AsInteger:= CodD;
              open;
              DataMesaO := fieldbyname('DATA1').AsDateTime;
              DataMesaD := fieldbyname('DATA2').AsDateTime;

           end;
        dm.IBTRServer.Commit;
     except
        dm.IBTRServer.Rollback;
        showmessage('Erro ao buscar Data da Mesa');
        Exit;

     end;
   finally
     dm.QConsultaServer.Close;
   end;
   if DataMesaO < DataMesaD then
      begin
             if dm.IBTRServer.Active then
                dm.IBTRServer.Commit;
             dm.IBTRServer.StartTransaction;
             try
               try
                  with dm.QConsultaServer do
                     begin
                        close;
                        sql.Clear;
                        sql.Text:= 'UPDATE CONTA_CLIENTE SET DATA_ABERTURA=:DATAA WHERE CODIGO=:COD';
                        Parambyname('COD').AsInteger:= CodD;
                        ParamByName('DATAA').AsDate :=  DataMesaO; ;
                        ExecOrOpen;
                     end;
                  dm.IBTRServer.Commit;
               except
                  dm.IBTRServer.Rollback;
                  showmessage('Erro ao buscar ao Cadastrar data Nova');
                  Exit;

               end;
             finally
               dm.QConsultaServer.Close;
             end;
      end;
end;

procedure TFrmTransfMesa.BtnOKClick(Sender: TObject);
var iAuxCodMesaOrigem : integer;
begin
   if (trim(EdtOrigem.Text) = '') or (trim(EdtDestino.Text) = '') then
      begin
         showmessage('Verifique os números das Mesas');
         EdtOrigem.SetFocus;
         exit;
      end;
   iedtOrigem := FrmMesas.LocalizaContaCliente( EdtOrigem.Text );
   iedtDestino := FrmMesas.LocalizaContaCliente( EdtDestino.Text );
   if iedtOrigem = 0 then
      begin
         KDialog( 'Mesa de Origem inexistente!', 'Transferência de Mesas', 'INFO' );
         Exit;
      end;
   if iedtDestino = 0 then
      begin
         KDialog( 'Mesa de Destino inexistente!', 'Transferência de Mesas', 'INFO' );
         Exit;
      end;

   iAuxCodMesaOrigem:= MesaAberta(iedtOrigem);

   { busca os itens da Mesa de Origem }
   if IBTRItensMesa.Active then
      IBTRItensMesa.Commit;
   IBTRItensMesa.StartTransaction;
   with QBuscaItensOrigem do
     begin
        close;
        ParamByName('cod').AsInteger:= iAuxCodMesaOrigem;
        open;
     end;
end;

procedure TFrmTransfMesa.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if QBuscaItensOrigemCANCELADO.AsInteger = 1 then
      begin
         DBGrid1.Canvas.Font.Color:= clRed;
         Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
      end;
end;

procedure TFrmTransfMesa.QBuscaItensOrigemCalcFields(DataSet: TDataSet);
begin
   if QBuscaItensOrigemCONTA_ORIGEM.AsInteger > 0 then
      QBuscaItensOrigemCALC_DESCRICAO.AsString := QBuscaItensOrigemDESC_CUPOM.AsString + ' ' + 'TRANSF. DA MESA ' + QBuscaItensOrigemMESA_ORIGEM.AsString
   else
      QBuscaItensOrigemCALC_DESCRICAO.AsString := QBuscaItensOrigemDESC_CUPOM.AsString;
end;

procedure TFrmTransfMesa.BtnTransfTudoClick(Sender: TObject);
begin
   if trim(EdtOrigem.Text) = '' then
      begin
         showmessage('Digite a Mesa Origem');
         EdtOrigem.SetFocus;
         exit;
      end;

   if trim(EdtDestino.Text) = '' then
      begin
         showmessage('Digite a Mesa Destino');
         EdtDestino.SetFocus;
         exit;
      end;

   iCodigoOrigem  := MesaAberta(iedtOrigem);
   iCodigoDestino := MesaAberta(iedtDestino);

   if iCodigoOrigem = 0 then
      begin
         showmessage('Mesa de Origem não Aberta');
         EdtOrigem.SetFocus;
         exit;
         abort;
      end;

   if iCodigoDestino = 0 then
      begin
         if Application.MessageBox('Confirma a transferência da mesa?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
            begin
               if dm.IBTRServer.Active then
                  dm.IBTRServer.Commit;
               dm.IBTRServer.StartTransaction;
               try
                 try
                   with QTransf do
                      begin
                         close;
                         sql.Clear;
                         sql.Text:= 'UPDATE CONTA_CLIENTE  ' +
                                    'SET CONTA = :CONTA, CONTA_ORIGEM = :ORIGEM ' +
                                    'WHERE CODIGO = :COD';
                         Parambyname('conta').AsInteger  := iedtDestino;
                         Parambyname('cod').AsInteger    := iCodigoOrigem;
                         Parambyname('origem').AsInteger := iedtOrigem;
                         ExecOrOpen;

                         close;
                         sql.Text:= 'UPDATE ITENS_CONTA_CLIENTE ' +
                                    'SET CONTA_ORIGEM = :ORIGEM ' +
                                    'WHERE CODIGO = :COD';
                         Parambyname('origem').AsInteger := iedtOrigem;
                         Parambyname('cod').AsInteger    := iCodigoOrigem;
                         ExecOrOpen;

                         close;
                      end;
                   dm.IBTRServer.Commit;
                   showmessage('Troca efetuada com sucesso');
                   AtualizaDataMesa( iCodigoOrigem, iCodigoDestino );
                   FrmMesas.EdtMesa.Text:= EdtDestino.text;
                 except
                   dm.IBTRServer.Rollback;
                   showmessage('Erro ao Transferir a Mesa');
                 end;
               finally
                 QTransf.Close;
               end;
            end;
      end
   else
      begin
         if application.MessageBox(pchar('Mesa ' + EdtDestino.Text + ' Ocupada, Deseja juntar as Mesas?'), 'Mesa Ocupada', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton1) = 6 then
            begin
               if dm.IBTRServer.Active then
                  dm.IBTRServer.Commit;
               dm.IBTRServer.StartTransaction;
               try
                 try
                   with IBSPTransf do
                      begin
                         close;
                         Parambyname('newcod').AsInteger:= iCodigoDestino;
                         Parambyname('oldcod').AsInteger:= iCodigoOrigem;
                         ExecProc;
                      end;
                   dm.IBTRServer.Commit;
                   AtualizaDataMesa( iCodigoOrigem, iCodigoDestino );
                   FrmMesas.EdtMesa.Text:= EdtDestino.text;
                 except
                   dm.IBTRServer.Rollback;
                   showmessage('Erro ao Juntar as Mesas');
                 end;
               finally
                 IBSPTransf.Close;
               end;
            end;
      end;
   FrmMesas.EdtMesa.Text:= EdtDestino.Text;
   FrmMesas.EdtMesaExit(sender);
   close;
end;

procedure TFrmTransfMesa.BtnTransfItemClick(Sender: TObject);

var iAuxCodigo : integer;
    iAuxOrdem  : integer;
label
    VerificaMesa;
begin
      if trim(EdtOrigem.Text) = '' then
      begin
         showmessage('Digite a Mesa Origem');
         EdtOrigem.SetFocus;
         exit;
      end;

   if trim(EdtDestino.Text) = '' then
      begin
         showmessage('Digite a Mesa Destino');
         EdtDestino.SetFocus;
         exit;
      end;

   iCodigoOrigem  := MesaAberta(iedtOrigem);
   iCodigoDestino := MesaAberta(iedtDestino);

   if iCodigoOrigem = 0 then
      begin
         showmessage('Mesa de Origem não Aberta');
         EdtOrigem.SetFocus;
         exit;
         abort;
      end;

   if not (QBuscaItensOrigem.State = dsBrowse) then
      exit;

   if QBuscaItensOrigemCANCELADO.AsInteger = 1 then
      begin
         showmessage('Item Cancelado não pode ser transferido');
         exit;
      end;

   { verifica se tem item selecionado }
   VerificaMesa:
   if iCodigoDestino = 0 then
      begin
         if Application.MessageBox('Deseja Abrir a Mesa Destino?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
            begin
               if dm.IBTRServer.Active then
                  dm.IBTRServer.Commit;
               dm.IBTRServer.StartTransaction;
               try
                 try
                   with QInsMesa do
                      begin
                         close;
                         Parambyname('data').AsDate      := date;
                         Parambyname('hora').AsTime      := now;
                         Parambyname('conta').AsInteger  := strtoint(EdtDestino.Text);
                         Parambyname('codcai').AsInteger := iCaixa;
                         Parambyname('codemp').AsInteger := iEmp;
                         open;
                         iCodigoDestino:= QInsMesaCODIGO.AsInteger;

                      end;
                   dm.IBTRServer.Commit;
                 except
                   dm.IBTRServer.Rollback;
                   showmessage('Erro ao Abrir a Mesa');
                   Exit;
                 end;
               finally
                 QInsMesa.Close;

               end;
               goto VerificaMesa;
            end;
      end
   else
      begin
         if application.MessageBox('Confirma a Transferência do Item', 'Mesa Ocupada', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton1) = 6 then
            begin
               iAuxCodigo := QBuscaItensOrigemCODIGO.AsInteger;
               iAuxOrdem  := QBuscaItensOrigemORDEM.AsInteger;

               { gravando o item na mesa destino }
               if dm.IBTRServer.Active then
                  dm.IBTRServer.Commit;
               dm.IBTRServer.StartTransaction;
               try
                 try
                   with dm.QConsultaServer do
                      begin
                         close;
                         sql.Clear;
                         sql.Add('INSERT INTO ITENS_CONTA_CLIENTE (CODIGO, ORDEM, COD_PRO, COD_VEND, ' +
                                'QUANT, VALOR, COD_EMP, CANCELADO, CONTA_ORIGEM) ' +
                                 'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, :9)');
                         Parambyname('1').AsInteger  := iCodigoDestino;
                         Parambyname('2').AsInteger  := OrdemItemDestino(iCodigoDestino);
                         Parambyname('3').AsInteger  := QBuscaItensOrigemCOD_PRO.AsInteger;
                         Parambyname('4').AsInteger  := QBuscaItensOrigemCOD_VEND.AsInteger;
                         Parambyname('5').AsCurrency := QBuscaItensOrigemQUANT.AsCurrency;
                         Parambyname('6').AsCurrency := QBuscaItensOrigemVALOR.AsCurrency;
                         Parambyname('7').AsInteger  := QBuscaItensOrigemCOD_EMP.AsInteger;
                         Parambyname('8').AsInteger  := QBuscaItensOrigemCANCELADO.AsInteger;
                         Parambyname('9').AsInteger  := iedtOrigem;
                         ExecOrOpen;
                      end;
                   dm.IBTRServer.Commit;
                 except
                   dm.IBTRServer.Rollback;
                   showmessage('Erro ao Gravar o Item');
                 end;
               finally
                 dm.QConsultaServer.Close;
               end;

               { deletando o item da mesa Origem }
               if dm.IBTRServer.Active then
                  dm.IBTRServer.Commit;
               dm.IBTRServer.StartTransaction;
               try
                 try
                   with dm.QConsultaServer do
                      begin
                         close;
                         sql.Clear;
                         sql.Text:= 'DELETE FROM ITENS_CONTA_CLIENTE ' +
                                    'WHERE CODIGO = :COD AND ORDEM = :ORD';
                         Parambyname('cod').AsInteger  := iAuxCodigo;
                         Parambyname('ord').AsInteger  := iAuxOrdem;
                         ExecOrOpen;
                      end;
                   dm.IBTRServer.Commit;
                 except
                   dm.IBTRServer.Rollback;
                   showmessage('Erro ao Excluir o Item da Mesa Origem');
                 end;
               finally
                 dm.QConsultaServer.Close;
                 BtnOK.Click;
               end;
               AtualizaDataMesa( iCodigoOrigem, iCodigoDestino );
            end;
      end;
end;

function TFrmTransfMesa.OrdemItemDestino(const iCodigoContaCliente : integer) : integer;
begin
   if dm.IBTRAuxServer.Active then
      dm.IBTRAuxServer.Commit;
   dm.IBTRAuxServer.StartTransaction;
   with QOrdem do
      begin
         close;
         parambyname('codigo').AsInteger:= iCodigoContaCliente;
         open;
         result:= QOrdemORDEM.AsInteger + 1;
      end;
   dm.IBTRAuxServer.Commit;
   QOrdem.close;
end;

end.
