unit USincronizaManifestacao;

interface

uses
  Classes, ACBrNFe, SysUtils, Variants, UNovosComponentes,
  UNovoFormulario, pcnConversaoNFe, pcnConversao,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt, FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.Phys.FB, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.IBBase, FireDAC.Phys.Intf, FireDAC.DApt.Intf;

type
  TSincronizaManifestacao = class(TThread)
  private
    { Private declarations }
    NFe1: TACBrNFe;
    FDM: TDataModule;
    Indicador: TpcnIndicadorNFe;
    EMitente: TpcnIndicadorEmissor;
    FDCon: TFDConnection;
    FDTrans: TFDTransaction;
    FAcbr: TACBrNFe;
    procedure AtualizaFrmManifestacao( Mensagem: string; DesativaPanel: Boolean );
    const
       SqlInsert: String =  'UPDATE OR INSERT INTO NOTAS_MANIFESTACAO' +
              '(COD_EMP,' + sLineBreak +
              'CHAVE_NOTA,' + sLineBreak +
              'DATA_ENTRADA,' + sLineBreak +
              'EMITENTE,' + sLineBreak +
              'CNPJ_EMI,' + sLineBreak +
              'IE_EMI,' + sLineBreak +
              'VALOR_NF,' + sLineBreak +
              'TIPO_NF,' + sLineBreak +
              'SIT_NF,' + sLineBreak +
              'SIT_CONF,' + sLineBreak +
              'MANIFESTACAO ) VALUES (' +
              ':COD_EMP,' + sLineBreak +
              ':CHAVE_NOTA,' + sLineBreak +
              ':DATA_ENTRADA,' + sLineBreak +
              ':EMITENTE,' + sLineBreak +
              ':CNPJ_EMI,' + sLineBreak +
              ':IE_EMI,' + sLineBreak +
              ':VALOR_NF,' + sLineBreak +
              ':TIPO_NF,' + sLineBreak +
              ':SIT_NF,' + sLineBreak +
              ':SIT_CONF, :MANIFESTACAO ) MATCHING( CHAVE_NOTA )';
  protected
    procedure Execute; override;
  public
    isRun: Boolean;
    constructor Create(DMm: TDataModule; indNota: TpcnIndicadorNFe;
      indEmi: TpcnIndicadorEmissor);
    destructor Destroy; override;

  end;

implementation

uses
  UDM, UfrmManifestacao;


{ TSincronizaManifestacao }

procedure TSincronizaManifestacao.AtualizaFrmManifestacao(Mensagem: string;
  DesativaPanel: Boolean);
begin
   Synchronize(
      procedure
          begin
              frmManifestacao.Status.Panels.Items[0].Text := Mensagem;
              frmManifestacao.pnlBotoes.Enabled := DesativaPanel;
          end
   );
end;

constructor TSincronizaManifestacao.Create(DMm: TDataModule;
  indNota: TpcnIndicadorNFe; indEmi: TpcnIndicadorEmissor);
begin 
   inherited Create(False);
   FreeOnTerminate := False;
   FDM := DMm;
   Indicador := indNota;
   EMitente := indEmi;
   isRun := False;
end;

destructor TSincronizaManifestacao.Destroy;
begin

  inherited;
end;

procedure TSincronizaManifestacao.Execute;
var
  IDCont: TpcnIndicadorContinuacao;
  UltNSU: String;
  FDquery: TFDQuery;
  Notas: Integer;
  Consultas: Integer;
  I: Integer;
begin
  { Place thread code here }
   isRun := true;
   AtualizaFrmManifestacao( 'Iniciando a Sincronização!', False );
   Notas := 0;
   Consultas := 0;
   FAcbr := TACBrNFe.Create( nil );
   FDCon := TFDConnection.Create( nil );
   FDTrans := TFDTransaction.Create( nil );
   FDCon.Transaction := FDTrans;
   FDTrans.Connection := FDCon;
   FDCon.DriverName := 'FB';
   FDCon.Params.Assign( TDM( FDM ).IBDatabase.Params );
   FDquery := TFDQuery.Create( nil );
   FDquery.Transaction := FDTrans;
   FDquery.Connection := FDCon;
   FDquery.SQL.Text := SqlInsert;
   try
      try
          FDCon.Open;
          IDCont := icPossuiMaisDocumentos;
          UltNSU := '0';
          if not TDM( FDM ).ConfiguraNFe( FAcbr ) then
             begin
                AtualizaFrmManifestacao( 'Erro nas Configuracoes da Nota!', True );
                Exit;
             end;
          if not TDM( FDM ).VerificaWebServices( FAcbr ) then
             begin
                AtualizaFrmManifestacao( 'WebService não operante!', True );
                Exit;
             end;
          while ( ( IDCont = icPossuiMaisDocumentos ) and
            ( not Terminated ) ) do
            begin
                FAcbr.ConsultaNFeDest(sCNPJEmpresa, Indicador,
                    EMitente, ultNSU);
                with FAcbr.WebServices.ConsNFeDest do
                   begin
                        IDCont := retConsNFeDest.indCont;
                        UltNSU := retConsNFeDest.ultNSU;
                        if retConsNFeDest.ret.Count > 0 then
                           begin
                               if FDTrans.Active then
                                  FDTrans.Commit;
                               FDTrans.StartTransaction;
                           end;
                        try
                        for I := 0 to retConsNFeDest.ret.Count -1 do
                           begin
                               with FDquery do
                                  begin
                                     if trim( retConsNFeDest.ret.Items[i].resNFe.chNFe )<> '' then
                                        Continue;
                                     ParamByName( 'COD_EMP' ).AsInteger := iEmp;
                                     ParamByName( 'CHAVE_NOTA' ).AsString :=
                                       retConsNFeDest.ret.Items[i].resNFe.chNFe;
                                     ParamByName( 'DATA_ENTRADA' ).AsDateTime :=
                                        retConsNFeDest.ret.Items[i].resNFe.dEmi;
                                     ParamByName( 'EMITENTE' ).AsString :=
                                        retConsNFeDest.ret.Items[i].resNFe.xNome;
                                     ParamByName( 'CNPJ_EMI' ).AsString :=
                                        retConsNFeDest.ret.Items[i].resNFe.CNPJCPF;
                                     ParamByName( 'IE_EMI' ).AsString :=
                                        retConsNFeDest.ret.Items[i].resNFe.IE;
                                     ParamByName( 'VALOR_NF' ).AsCurrency :=
                                        retConsNFeDest.ret.Items[i].resNFe.vNF;
                                     ParamByName( 'TIPO_NF' ).AsString :=
                                        VarToStr( retConsNFeDest.ret.Items[i].resNFe.tpNF );
                                     ParamByName( 'SIT_NF' ).AsString :=
                                       VarToStr( retConsNFeDest.ret.Items[i].resNFe.cSitNFe );
                                     ParamByName( 'SIT_CONF' ).AsString :=
                                       VarToStr( retConsNFeDest.ret.Items[i].resNFe.cSitConf );
                                     ExecOrOpen;
                                     Inc( Notas );
                                  end;
                               AtualizaFrmManifestacao( 'Sincronizando... ' +
                                      IntToStr(Notas) + ' Notas Encontradas   ' +
                                      IntToStr(Consultas) + ' Consultas realizadas', False );
                           end;
                        finally
                           if FDTrans.Active then
                              FDTrans.Commit;
                        end;
                   end;
            end;
          AtualizaFrmManifestacao( 'Sincronização Finalizada! (' +
            IntToStr( Consultas )+ ') e ( '+
            IntToStr( Notas ) +
            ' ) Notas Encontradas', True );
      except
         on E: Exception do
            begin
                AtualizaFrmManifestacao( 'Sincronização Finalizada com ERROS! (' +
                  IntToStr( Consultas )+ ') e ( '+
                  IntToStr( Notas ) +
                  ' ) Notas Encontradas ' , True );
                Synchronize(
                procedure
                    begin
                        AlertaCad( 'Erro na Sincronização');
                    end );
            end;
      end;
   finally
         if FDTrans.Active then
            FDTrans.Commit;
         if FDCon.Connected then
             FDCon.Close;
         if FDquery.Active then
            FDquery.Close;
         FreeAndNil( FDquery );
         FreeAndNil( FDTrans );
         FreeAndNil( FDCon );
         FreeAndNil( FAcbr );
         isRun := False;
   end;
end;

end.
