unit UConfigurarPisCofins;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, UNovosComponentes, UNovoFormulario, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TfrmConfigurarPisCofins = class(UNovoFormulario.TForm)
    Regime: TRadioGroup;
    Metodo: TRadioGroup;
    Tipo: TRadioGroup;
    BitBtn1: TBitBtn;
    Conf: TFDQuery;
    ConfCOD: TIntegerField;
    ConfCOD_EMP: TIntegerField;
    ConfVERSAO: TIntegerField;
    ConfREGIME_APURACAO: TIntegerField;
    ConfMETODO: TIntegerField;
    ConfTIPO_CONT: TIntegerField;
    Versao: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    Existe: Boolean;
  public
    { Public declarations }
    CODEMP: Integer;
  end;

var
  frmConfigurarPisCofins: TfrmConfigurarPisCofins;

implementation

uses
  UDM, UNovoPrincipal;

{$R *.dfm}

procedure TfrmConfigurarPisCofins.BitBtn1Click(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;

   dm.QConsulta.Close;
   if Existe then
         dm.QConsulta.SQL.Text := 'update EFD_PISCOFINS set VERSAO=:VERSAO,' +
                                  'REGIME_APURACAO=:REGIME_APURACAO, METODO=:METODO,' +
                                  'TIPO_CONT=:TIPO_CONT where COD_EMP=:COD_EMP'
   else
       dm.QConsulta.SQL.Text := 'insert into EFD_PISCOFINS( COD_EMP, VERSAO, REGIME_APURACAO,' +
                                'METODO, TIPO_CONT ) Values ( :COD_EMP, :VERSAO, :REGIME_APURACAO,' +
                                ':METODO, :TIPO_CONT);';
   DM.QConsulta.ParamByName( 'COD_EMP' ).AsInteger := CODEMP;
   dm.QConsulta.ParamByName( 'VERSAO').AsInteger := Versao.ItemIndex;
   dm.QConsulta.ParamByName( 'REGIME_APURACAO').AsInteger := regime.ItemIndex;
   dm.QConsulta.ParamByName( 'METODO').AsInteger := Metodo.ItemIndex;
   dm.QConsulta.ParamByName( 'TIPO_CONT').AsInteger := Tipo.ItemIndex;
   dm.QConsulta.ExecOrOpen;
   dm.IBTransaction.Commit;
end;

procedure TfrmConfigurarPisCofins.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  Action := caFree;
end;

procedure TfrmConfigurarPisCofins.FormShow(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;

   Conf.Close;
   Conf.ParamByName( 'CODEMP' ).AsInteger := CODEMP;
   Conf.Open;
   if Conf.IsEmpty then
      begin 
         Existe := false;
         regime.ItemIndex := 0;
         Metodo.ItemIndex := 0;
         Tipo.ItemIndex := 0;
         Versao.ItemIndex := 0;
      end
   else
      begin 
         Existe := True;
         Regime.ItemIndex := ConfREGIME_APURACAO.AsInteger;
         Metodo.ItemIndex := ConfMETODO.AsInteger;
         Tipo.ItemIndex := ConfTIPO_CONT.AsInteger;
         versao.ItemIndex := ConfVERSAO.AsInteger;
      end;

   dm.IBTransaction.Commit;
end;

end.
