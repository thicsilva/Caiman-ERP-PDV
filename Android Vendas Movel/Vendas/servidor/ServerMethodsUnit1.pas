unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,FireDAC.Comp.Client,
    Datasnap.DSServer, Datasnap.DSAuth, DataSnap.DSProviderDataModuleAdapter,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.Oracle, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  Data.DB,  FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Datasnap.Provider,
  FireDAC.Phys.IB, FireDAC.Phys.IBBase, IBX.IBDatabase, IBX.IBCustomDataSet,
  IBX.IBQuery, FireDAC.Phys.MSSQL, FireDAC.Phys.ODBCBase;

type
  TServerMethods1 = class(TDSServerModule)
    DSP_AUX: TDataSetProvider;
    DSP_AUX2: TDataSetProvider;
    COENXAO_FB: TIBDatabase;
    QRYAUX: TIBQuery;
    QRYAUX2: TIBQuery;
    IBTransaction1: TIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
  end;

implementation


{$R *.dfm}


uses System.StrUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

