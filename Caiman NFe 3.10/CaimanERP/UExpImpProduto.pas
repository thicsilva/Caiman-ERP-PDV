unit UExpImpProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Mask, Buttons, DB, jpeg, rxToolEdit, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmExpImpProduto = class(UNovoFormulario.TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    QAux: TFDQuery;
    QNomeCampos: TFDQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    RDG: TRadioGroup;
    GroupBox1: TGroupBox;
    Arquivo: TFilenameEdit;
    GBTabela: TGroupBox;
    EdtCod: UNovosComponentes.TEdit;
    BtnOK: TBitBtn;
    BtnSair: TBitBtn;
    Button1: TButton;
    PB: TProgressBar;
    QColetor: TFDQuery;
    QColetorDESC_CUPOM: TStringField;
    QColetorVALOR_PRO: TBCDField;
    BtnColetados: TButton;
    OP: TOpenDialog;
    QInsProdutoColetor: TFDQuery;
    BtnImprimir: TButton;
    QRelProdutosColetados: TFDQuery;
    QRelProdutosColetadosCOD_PRO: TIntegerField;
    QRelProdutosColetadosQUANT: TBCDField;
    QRelProdutosColetadosNOME_PRO: TStringField;
    QRelProdutosColetadosPRECO_CUSTO: TBCDField;
    QRelProdutosColetadosUNIDADE_SAIDA_PRO: TStringField;
    Image1: TImage;
    QColetorCODIGO_BARRA_PRO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure Exporta(tabela : string);
    procedure Importa(Linha  : string);
    procedure Button1Click(Sender: TObject);
    procedure BtnColetadosClick(Sender: TObject);
    procedure GravaItensColetor(const CodProd : integer; const Quant : currency);
    procedure BtnImprimirClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var

  FrmExpImpProduto: TFrmExpImpProduto;

implementation
uses
  Udm, Ubibli1, UQRelProdutosColetados, UNovoPrincipal;
var  f : TextFile;
     sCampoPK  : string;
     aCampos   : array of array of string;
     sAuxTabela: string;
     sSqlInsert, sSqlUpdate : string;

{$R *.dfm}

procedure TFrmExpImpProduto.FormShow(Sender: TObject);
begin 
   PageControl1.ActivePageIndex:= 0;
   sAuxTabela := '';
   rdg.ItemIndex:= 0;
   edtcod.Clear;
   GBTabela.Caption:= 'Tabela';
end;

procedure TFrmExpImpProduto.GravaItensColetor(const CodProd : integer; const Quant : currency);

begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QInsProdutoColetor do
      begin 
         close;
         Parambyname('codpro').AsInteger := CodProd;
         Parambyname('quant').AsCurrency := Quant;
         ExecOrOpen;
      end;
   dm.IBTransaction.Commit;
   QInsProdutoColetor.Close;
end;

procedure TFrmExpImpProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmExpImpProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   dm.QConsulta.Close;
   Action:= caFree;
end;

procedure TFrmExpImpProduto.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmExpImpProduto.BtnOKClick(Sender: TObject);
var sAuxLinha : string;
begin 
   case RDG.ItemIndex of
    0:begin 
         AssignFile(f, Arquivo.FileName);
         Rewrite(f);
         Exporta('LABORATORIO');
         Exporta('SECAO');
         Exporta('CFOP');
         Exporta('GRUPO_ICMS');
         Exporta('PRODUTO');
         Exporta('CODIGO_BARRA');
      end;
    1:begin 
         AssignFile(f, Arquivo.FileName);
         Reset(f);

         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;

         while not eof(f) do
            begin 
               Readln(f, sauxlinha);
               Importa(sAuxLinha);
            end;

         dm.IBTransaction.Commit;
      end;
   end;
   CloseFile(f);
   AlertaCad('Processo Concluído');
end;

procedure TFrmExpImpProduto.Exporta(tabela : string);
var sLinha   : string;
var sAuxCurr : string;
begin 
   GBTabela.Caption:= tabela;
   GBTabela.Refresh;

   {BUSCA O PK DA TABELA}
   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   dm.IBTRAux.StartTransaction;
   with QAux do
     begin 
        close;
        sql.Clear;
        sql.add('SELECT I.RDB$FIELD_NAME ' +
                'FROM RDB$RELATION_CONSTRAINTS R ' +
                'JOIN RDB$INDEX_SEGMENTS I ' +
                'ON (R.RDB$INDEX_NAME = I.RDB$INDEX_NAME) ' +
                'WHERE R.RDB$RELATION_NAME = ' + #39 + Tabela + #39 +
                ' AND R.RDB$CONSTRAINT_TYPE = ' + #39 + 'PRIMARY KEY' + #39);
        open;
        sCampoPK:= fieldbyname('RDB$FIELD_NAME').AsString;
     end;
   dm.IBTRAux.Commit;
   QAux.Close;

   {BUSCA O REGISTRO PARA EXPORTAR}
   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   dm.IBTRAux.StartTransaction;
   with QAux do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT * FROM ' + tabela);
         Open;
      end;

   {BUSCA OS NOMES E TAMANHOS DOS CAMPOS DA TABELA}
   with QNomeCampos do
      begin 
         close;
         sql.Clear;
         sql.Add('SELECT * FROM ' +
                 'TABELAS_CAMPOS WHERE NOME_TABELA = ' + #39 + Tabela + #39 +
                 ' ORDER BY CODIGO');
         open;
      end;

   QAux.First;
   while not QAux.Eof do
      begin 
         {EXPORTANDO O REGISTRO}
         sLinha:= '';
         EdtCod.Text:= QAux.FieldByName(trim(sCampoPK)).AsString;
         EdtCod.Refresh;
         with QNomeCampos do
            begin 
               First;
               sLinha:= sLinha + fieldbyname('NOME_TABELA').AsString + ';';
               while not eof do
                  begin 
                     if qaux.FieldByName(fieldbyname('NOME_CAMPO').AsString).IsNull then
                        sLinha:= sLinha + 'null' + ';'
                     else
                        begin 
                           if fieldbyname('TIPO_CAMPO').AsString = 'N' then
                              begin 
                                 sAuxCurr:= CurrToStrF(QAux.Fieldbyname(fieldbyname('nome_campo').AsString).AsCurrency, ffFixed, 2);
                                 sLinha:= sLinha + sAuxCurr + ';';
                              end
                           else
                              if fieldbyname('TIPO_CAMPO').AsString = 'S' then
                                 sLinha:= sLinha + RetiraCR(QAux.Fieldbyname(fieldbyname('nome_campo').AsString).AsString) + ';'
                              else
                                 sLinha:= sLinha + QAux.fieldbyname(fieldbyname('NOME_CAMPO').AsString).AsString + ';'
                        end;
                     next;
                  end;
            end;
         Writeln(f, sLinha);
         QAux.Next;
      end;
   dm.IBTRAux.Commit;
   QAux.Close;
   QNomeCampos.Close;
end;

procedure TFrmExpImpProduto.Importa(Linha : string);
var sTabela     : string;
var sLiga       : string;
var sValorCampo : string;
var sAuxLInha   : string;
var i           : integer;
begin 
   sAuxLInha   := Linha;
   sTabela     := copy(sAuxLinha, 1, pos(';', sAuxLinha) - 1);
   sAuxLinha   := copy(sAuxLinha, pos(';', sAuxLinha) + 1, length(sAuxLinha));
   sValorCampo := copy(sAuxLinha, 1, pos(';', sAuxLinha) - 1);

   if Trim(sTabela) <> sAuxTabela then
      begin 
         sAuxTabela:= sTabela;
         {BUSCA O PK DA TABELA}
         if dm.IBTRAux.Active then
            dm.IBTRAux.Commit;
         dm.IBTRAux.StartTransaction;
         with QAux do
           begin 
              close;
              sql.Clear;
              sql.add('SELECT I.RDB$FIELD_NAME ' +
                      'FROM RDB$RELATION_CONSTRAINTS R ' +
                      'JOIN RDB$INDEX_SEGMENTS I ' +
                      'ON (R.RDB$INDEX_NAME = I.RDB$INDEX_NAME) ' +
                      'WHERE R.RDB$RELATION_NAME = ' + #39 + sTabela + #39 +
                      ' AND R.RDB$CONSTRAINT_TYPE = ' + #39 + 'PRIMARY KEY' + #39);
              open;
              sCampoPK:= fieldbyname('RDB$FIELD_NAME').AsString;
           end;
         dm.IBTRAux.Commit;
         QAux.Close;

         {BUSCA OS NOMES E TAMANHOS DOS CAMPOS DA TABELA}
         if dm.IBTRAux.Active then
            dm.IBTRAux.Commit;
         dm.IBTRAux.StartTransaction;
         with QNomeCampos do
            begin 
               close;
               sql.Clear;
               sql.Add('SELECT * FROM ' +
                       'TABELAS_CAMPOS WHERE NOME_TABELA = ' + #39 + trim(sTabela) + #39 +
                       ' ORDER BY CODIGO');
               open;
               SetLength(aCampos, 0);
               while not eof do
                  begin 
                     SetLength(aCampos, length(aCampos) + 1);
                     SetLength(acampos[length(aCampos) - 1], 2);
                     aCampos[length(aCampos) - 1, 0]:= fieldbyname('nome_campo').AsString;
                     aCampos[length(aCampos) - 1, 1]:= fieldbyname('tipo_campo').AsString;
                     next;
                  end;
            end;
         dm.IBTRAux.Commit;
         QNomeCampos.Close;

         { MONTA O SQL DO INSERT }
         sSqlInsert:= '';
         sSqlInsert:= 'INSERT INTO ' + sTabela + '(';
         sLiga:= '';
         for i:= 0 to high(aCampos) do
           begin 
              sSqlInsert:= sSqlInsert + sLiga + acampos[i, 0];
              sLiga:= ', ';
           end;
         sSqlInsert:= sSqlInsert + ') VALUES(';
         sLiga:= '';
         for i:= 0 to high(aCampos) do
           begin 
              sSqlInsert:= sSqlInsert + sLiga + ':' + acampos[i, 0];
              sLiga:= ', ';
           end;
         sSqlInsert:= sSqlInsert + ')';

         {**** MONTA O SQL DO UPDATE *****}
         sSqlUpdate:= '';
         sSqlUpdate:= 'UPDATE ' + sTabela + ' SET ';
         sLiga:= '';
         for i:= 0 to high(aCampos) do
           begin 
              sSqlUpdate:= sSqlUpdate + sLiga + acampos[i, 0] + ' = :' + acampos[i, 0];
              sLiga:= ', ';
           end;
         sSqlUpdate:= sSqlUpdate + ' WHERE ' + sCampoPK + ' = ' + ':CAMPO_PK';
      end;

   GBTabela.Caption:= sTabela;
   EdtCod.Text     := sValorCampo;
   GBTabela.Refresh;

   {INSERINDO}
   try
     sAuxLInha:= Linha;
     sauxLinha:= copy(sAuxLinha, pos(';', sAuxLinha) + 1, length(sAuxLinha));
     with dm.QConsulta do
        begin 
           Close;
           SQL.Clear;
           SQL.Text:= sSqlInsert;
           for i:= 0 to length(aCampos) - 1 do
             begin 
                sValorCampo := copy(sAuxLinha, 1, pos(';', sAuxLinha) - 1);
                sAuxLInha   := copy(sAuxLinha, pos(';', sAuxLinha) + 1, length(sAuxLinha));
                if trim(sValorCampo) = 'null' then
                   ParamByName(acampos[i,0]).Value:= null
                else
                   begin 
                      if acampos[i,1] = 'I' then
                         ParamByName(acampos[i,0]).AsInteger:= strtoint(sValorCampo)
                      else
                         if acampos[i,1] = 'S' then
                            ParamByName(acampos[i,0]).AsString:= trim(sValorCampo)
                         else
                            if acampos[i,1] = 'N' then
                               ParamByName(acampos[i,0]).AsCurrency:= strtocurr(sValorCampo)
                            else
                               if acampos[i,1] = 'D' then
                                  ParamByName(acampos[i,0]).AsDate:= strtodate(sValorCampo);
                   end;
             end;
           dm.QConsulta.ExecOrOpen;
           dm.QConsulta.Close;
        end;
     except
     end;

   {UPDATE}
   try
     sAuxLInha   := Linha;
     sauxLinha   := copy(sAuxLinha, pos(';', sAuxLinha) + 1, length(sAuxLinha));
     sValorCampo := copy(sAuxLinha, 1, pos(';', sAuxLinha) - 1);
     with dm.QConsulta do
        begin 
           Close;
           SQL.Clear;
           SQL.Text:= sSqlUpdate;
           if not (sTabela = 'CODIGO_BARRA') then
              ParamByName('CAMPO_PK').AsInteger:= strtoint(sValorCampo)
           else
              ParamByName('CAMPO_PK').AsString := trim(sValorCampo);
           for i:= 0 to length(aCampos) - 1 do
             begin 
                sValorCampo := copy(sAuxLinha, 1, pos(';', sAuxLinha) - 1);
                sAuxLInha   := copy(sAuxLinha, pos(';', sAuxLinha) + 1, length(sAuxLinha));
                if trim(sValorCampo) = 'null' then
                   ParamByName(acampos[i,0]).Value:= null
                else
                   begin 
                      if acampos[i,1] = 'I' then
                         Parambyname(acampos[i,0]).AsInteger:= strtoint(sValorCampo)
                      else
                         if acampos[i,1] = 'S' then
                            dm.QConsulta.ParamByName(acampos[i,0]).AsString:= trim(sValorCampo)
                         else
                            if acampos[i,1] = 'N' then
                               dm.QConsulta.ParamByName(acampos[i,0]).AsCurrency:= strtocurr(sValorCampo)
                            else
                               if acampos[i,1] = 'D' then
                                  dm.QConsulta.ParamByName(acampos[i,0]).AsDate:= strtodate(sValorCampo);
                   end;
             end;
           dm.QConsulta.ExecOrOpen;
           dm.QConsulta.Close;
        end;
     except
        AlertaCad('Erro ao atualizar ' + sTabela);
     end;
end;

procedure TFrmExpImpProduto.Button1Click(Sender: TObject);
var txtColetor : textfile;
    i : integer;
begin 
   i:= 0;
   assignfile(txtColetor, 'C:\COLETOR\PRODUTOS.TXT');
   rewrite(txtColetor);

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QColetor do
      begin 
         close;
         open;
         last;
         pb.Max:= RecordCount;
         First;
         while not eof do
            begin 
               try
                 if (Length(trim(fieldbyname('codigo_barra_pro').AsString)) > 7)  and
                    (Length(trim(fieldbyname('codigo_barra_pro').AsString)) < 14) then
                    begin 
                       write(txtColetor,   FormataStringE(trim(fieldbyname('codigo_barra_pro').asstring), '13', ' '));
                       write(txtColetor,   FormataStringE(copy(fieldbyname('desc_cupom').asstring, 1, 14), '14', ' '));
                       writeln(txtColetor, FormatastringD(currtostrf(fieldbyname('valor_pro').AsCurrency, ffnumber, 2), '9', ' '));
                    end;
               except
               end;

               Inc(i);
               pb.Position:= i;
               next;
            end;
      end;
   CloseFile(txtColetor);
   dm.IBTransaction.Commit;
   QColetor.Close;
   FrmExpImpProduto.Refresh;
   AlertaCad('Processo Concluído');
   pb.Position:=0;
end;

procedure TFrmExpImpProduto.BtnColetadosClick(Sender: TObject);
var txt : TStrings;
    i   : integer;
    sCodBarra    : string;
    sQuant       : string;
    cQuant       : currency;
    iPosVirgula  : integer;
    iAuxCodProd  : integer;
begin 
   if OP.Execute then
      begin 
         if Application.MessageBox('Confirma a Importação?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
            begin 
               if Application.MessageBox('Limpar a tabela de Produtos Coletados?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
                  begin 
                     if dm.IBTransaction.Active then
                        dm.IBTransaction.Commit;
                     dm.IBTransaction.StartTransaction;
                     with dm.QConsulta do
                        begin 
                           close;
                           sql.Clear;
                           sql.Text:= 'DELETE FROM PRODUTOS_COLETADOS';
                           ExecOrOpen;
                        end;
                     dm.IBTransaction.Commit;
                     dm.QConsulta.Close;
                  end;

               txt:= TStringList.Create;
               txt.LoadFromFile(OP.FileName);
               pb.Max:= txt.Count;
               pb.Min:= 0;
               if txt.Count = 0 then
                  raise Exception.Create('arquivo vazio');

               for i:= 0 to txt.Count -1 do
                  begin 
                     try
                       iPosVirgula:= pos(',', txt[i]);
                       sCodBarra  := IntToStr(StrToInt64(copy(txt[i], 1, (iPosVirgula - 1))));
                       sQuant     := copy(txt[i], iPosVirgula + 1, length(txt[i]) - iPosVirgula);
                       cQuant     := StrToCurr(InverteValor(sQuant));
                       if cQuant > 0 then
                          begin 
                             {busca o produto}
                             if dm.IBTransaction.Active then
                                dm.IBTransaction.Commit;
                             dm.IBTransaction.StartTransaction;
                             with dm.QConsulta do
                                 begin 
                                    close;
                                    sql.Clear;
                                    sql.Add('SELECT COD_PRO ' +
                                            'FROM PRODUTO   ' +
                                            'WHERE CODIGO_BARRA_PRO = ' + #39 + sCodBarra + #39);
                                    Open;
                                    iAuxCodProd:= fieldbyname('cod_pro').AsInteger;
                                 end;
                             dm.IBTransaction.Commit;
                             dm.QConsulta.close;

                             if iAuxCodProd > 0 then
                                begin 
                                   GravaItensColetor(iAuxCodProd, cQuant);
                                end;
                          end;
                     except
                     end;
                     pb.Position:= i + 1;
                  end;
               txt.Free;
               AlertaCad('Processo Concluido');
            end;
      end;
end;

procedure TFrmExpImpProduto.BtnImprimirClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with QRelProdutosColetados do
     begin 
        close;
        Open;
     end;
  Application.CreateForm(TFrmQRelProdutosColetados, FrmQRelProdutosColetados);
  FrmQRelProdutosColetados.QRLNomeEmpresa.Caption:= frmmenu.SB.Panels[3].Text;
  FrmQRelProdutosColetados.QRProd.PreviewInitialState:= wsMaximized;
  FrmQRelProdutosColetados.QRProd.Preview;
  FrmQRelProdutosColetados.QRProd.QRPrinter:= nil;

  dm.IBTransaction.Commit;
  QRelProdutosColetados.Close;
end;

end.








