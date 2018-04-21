unit UPrecosProgramados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, DB, Grids, DBGrids, StdCtrls, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmPrecosProgramados = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    QCons: TFDQuery;
    DSCons: TDataSource;
    BtnSelecionar: TButton;
    BtnAtualizar: TButton;
    BtnSair: TButton;
    QAtualiza: TFDQuery;
    BtnExcluir: TButton;
    QDeleta: TFDQuery;
    QConsCOD_PRO: TIntegerField;
    QConsNOME_PRO: TStringField;
    QConsPRECO_PROGRAMADO: TBCDField;
    BtnImprimir: TButton;
    QConsCOD_SEC: TIntegerField;
    QConsNOME_SEC: TStringField;
    QRel: TFDQuery;
    IntegerField1: TIntegerField;
    IBStringField1: TStringField;
    IBBCDField1: TBCDField;
    IntegerField2: TIntegerField;
    IBStringField2: TStringField;
    Button1: TButton;
    QConsDESC_CUPOM: TStringField;
    QConsDESCRICAO: TStringField;
    QConsPRECO_PROGRAMADO_PRAZO: TBCDField;
    QRelPRECO_PROGRAMADO_PRAZO: TBCDField;
    procedure BtnSelecionarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnAtualizarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrecosProgramados: TFrmPrecosProgramados;

implementation
uses
  Udm, Ubibli1, UQRelPrecosProgramados, UNovoPrincipal;
var  sAuxSql : string;

{$R *.dfm}

procedure TFrmPrecosProgramados.BtnSelecionarClick(Sender: TObject);
begin 
   QCons.First;
   while not QCons.EOF do
       begin 
          DBGrid1.SelectedRows.CurrentRowSelected:= true;
          QCons.Next;
       end;
   QCons.First;
end;

procedure TFrmPrecosProgramados.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmPrecosProgramados.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   QCons.Close;
   Action:= caFree;
end;

procedure TFrmPrecosProgramados.FormShow(Sender: TObject);
begin 
   sAuxSql:= QRel.SQL.Text;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   QCons.Close;
   QCons.Open;
   if QCons.RecordCount > 0 then
      begin 
         BtnSelecionar.Enabled := true;
         BtnAtualizar.Enabled  := true;
         BtnExcluir.Enabled    := true;
      end
   else
      begin 
         BtnSelecionar.Enabled := false;
         BtnAtualizar.Enabled  := false;
         BtnExcluir.Enabled    := false;
      end;
end;

procedure TFrmPrecosProgramados.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmPrecosProgramados.BtnAtualizarClick(Sender: TObject);
var iAux : integer;
begin 
   iAux:= 0;
   qcons.DisableControls;
   qcons.First;
   while not qcons.Eof do
      begin 
         if DBGrid1.SelectedRows.CurrentRowSelected = true then
            inc(iAux);
         qcons.Next;
      end;
   qcons.First;
   qcons.EnableControls;

   if iAux = 0 then
      begin 
         AlertaCad('Nenhum produto Selecionado');
         exit;
         abort;
      end;

   if Application.MessageBox('Confirma a Atualização?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         QCons.First;
         while not QCons.Eof do
            begin 
               if DBGrid1.SelectedRows.CurrentRowSelected = true then
                  begin 
                     with QAtualiza do
                        begin 
                           if (QConsPRECO_PROGRAMADO.AsCurrency > 0) and (QConsPRECO_PROGRAMADO_PRAZO.AsCurrency > 0) then
                              begin 
                                 if dm.IBTRAux.Active then
                                    dm.IBTRAux.Commit;
                                 dm.IBTRAux.StartTransaction;

                                 close;
                                 sql.Clear;
                                 sql.Add('UPDATE PRODUTO SET VALOR_PRO = :VALOR, ' +
                                         'PRECO_PRAZO_PRO = :PRAZO ' +
                                         'WHERE COD_PRO   = :CODPRO');
                                 Parambyname('valor').AsCurrency := QConsPRECO_PROGRAMADO.AsCurrency;
                                 Parambyname('prazo').AsCurrency := QConsPRECO_PROGRAMADO_PRAZO.AsCurrency;
                                 ParamByName('codpro').AsInteger := QConsCOD_PRO.AsInteger;
                                 ExecOrOpen;
                                 dm.IBTRAux.Commit;
                              end
                           else
                              if QConsPRECO_PROGRAMADO.AsCurrency > 0 then
                                 begin 
                                    if dm.IBTRAux.Active then
                                       dm.IBTRAux.Commit;
                                    dm.IBTRAux.StartTransaction;

                                    close;
                                    sql.Clear;
                                    sql.Add('UPDATE PRODUTO SET VALOR_PRO = :VALOR ' +
                                            'WHERE COD_PRO   = :CODPRO');
                                    Parambyname('valor').AsCurrency := QConsPRECO_PROGRAMADO.AsCurrency;
                                    ParamByName('codpro').AsInteger := QConsCOD_PRO.AsInteger;
                                    ExecOrOpen;
                                    dm.IBTRAux.Commit;
                                 end
                              else
                                 if QConsPRECO_PROGRAMADO_PRAZO.AsCurrency > 0 then
                                    begin 
                                       if dm.IBTRAux.Active then
                                          dm.IBTRAux.Commit;
                                       dm.IBTRAux.StartTransaction;

                                       close;
                                       sql.Clear;
                                       sql.Add('UPDATE PRODUTO SET PRECO_PRAZO_PRO = :VALOR ' +
                                               'WHERE COD_PRO = :CODPRO');
                                       Parambyname('valor').AsCurrency := QConsPRECO_PROGRAMADO_PRAZO.AsCurrency;
                                       ParamByName('codpro').AsInteger := QConsCOD_PRO.AsInteger;
                                       ExecOrOpen;
                                       dm.IBTRAux.Commit;
                                    end;

                           if dm.IBTRAux.Active then
                              dm.IBTRAux.Commit;
                           dm.IBTRAux.StartTransaction;
                           close;
                           sql.Clear;
                           sql.Add('UPDATE PRODUTO SET PRECO_PROGRAMADO = 0, ' +
                                   'PRECO_PROGRAMADO_PRAZO = 0 ' +
                                   'WHERE COD_PRO = :CODPRO');
                           ParamByName('codpro').AsInteger := QConsCOD_PRO.AsInteger;
                           ExecOrOpen;
                           dm.IBTRAux.Commit;
                        end;
                  end;
               QCons.Next;
            end;
         FormShow(sender);
      end;
end;

procedure TFrmPrecosProgramados.BtnExcluirClick(Sender: TObject);
begin 
   if Application.MessageBox('Confirma a Exclusão?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         if dm.IBTRAux.Active then
            dm.IBTRAux.Commit;
         dm.IBTRAux.StartTransaction;
         try
           try
             with QDeleta do
                begin 
                   close;
                   parambyname('codpro').AsInteger:= QConsCOD_PRO.AsInteger;
                   ExecOrOpen;
                end;
             dm.IBTRAux.Commit;
           except
             dm.IBTRAux.Rollback;
             AlertaCad('Erro ao excluir');
           end;
         finally
           QDeleta.Close;
           FormShow(self);
         end;
      end;
end;

procedure TFrmPrecosProgramados.BtnImprimirClick(Sender: TObject);
begin 
   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   dm.IBTRAux.StartTransaction;
   with QRel do
     begin 
        close;
        sql.Clear;
        sql.Text:= sAuxSql;
        Application.CreateForm(TFrmQRelPrecosProgramados, FrmQRelPrecosProgramados);
        if Application.MessageBox('Agrupar por Seção?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
           begin 
              sql.Add(' ORDER BY P.COD_SEC, P.NOME_PRO');
              FrmQRelPrecosProgramados.QRGroup1.Enabled:= true;
           end
        else
           begin 
              sql.Add(' ORDER BY P.NOME_PRO');
              FrmQRelPrecosProgramados.QRGroup1.Enabled:= false;
           end;
        open;
     end;

   FrmQRelPrecosProgramados.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
   FrmQRelPrecosProgramados.QRRel.PreviewInitialState:= wsMaximized;
   FrmQRelPrecosProgramados.QRRel.Preview;
   qrel.Close;
   dm.IBTRAux.Commit;
end;

procedure TFrmPrecosProgramados.Button1Click(Sender: TObject);
var iAux : integer;
    tArq : TextFile;
begin 
   iAux:= 0;
   qcons.DisableControls;
   qcons.First;
   while not qcons.Eof do
      begin 
         if DBGrid1.SelectedRows.CurrentRowSelected = true then
            inc(iAux);
         qcons.Next;
      end;
   qcons.First;
   qcons.EnableControls;

   if iAux = 0 then
      begin 
         AlertaCad('Nenhum produto Selecionado');
         exit;
         abort;
      end;

   if Application.MessageBox('Confirma a Impressão?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         QCons.First;
         while not QCons.Eof do
            begin 
               if DBGrid1.SelectedRows.CurrentRowSelected = true then
                  begin 
                     AssignFile(tArq, 'LPT1');
                     Rewrite(tArq);
                     write(tArq,CHR(2)+'O0220'+CHR(13)); //Configura o Offset de borda
                     Write(tArq,CHR(2)+'e'+CHR(13));     //Aqui habilito o sensor
                     Write(tArq,CHR(2)+'L'+CHR(13));     //Comando que Abilita a Impressora p/ impressao
                     Write(tArq,'H16'+CHR(13));          //Define a temperatura de impressao
                     Write(tArq,'D11'+CHR(13));          //Define o tamanho do Pixel

                     Writeln(tArq,'490000200100050COD: ' + qConsCOD_PRO.asstring);
                     Writeln(tArq,'190200500600060'      + copy(PrimeiraLetraMaiuscula(LowerCase(qConsDESC_CUPOM.asstring)), 1, 29));
                     Writeln(tArq,'190000500250070'      + qConsDESCRICAO.asstring);
                     Writeln(tArq,'190200400000150'      + 'R$');
                     Writeln(tArq,'192200700000200'      + currtostrf(qConsPRECO_PROGRAMADO.AsCurrency, ffnumber, 2));
                     write(tArq,'E'+CHR(13));            //Aqui finalizo o envio de comandos
                     closeFile(tArq);                    //Aqui fecho o arquivo
                  end;
               qcons.Next;
            end;
         QCons.First;
      end;
end;

end.
