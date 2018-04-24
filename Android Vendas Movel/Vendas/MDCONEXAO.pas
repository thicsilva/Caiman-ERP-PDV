unit MDCONEXAO;

interface

uses
  System.SysUtils, System.Classes, IdMessage, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, FMX.Types, FMX.Controls, SQLiteUniProvider, UniProvider,
  MySQLUniProvider, Data.DB, DBAccess, Uni, Data.DBXDataSnap, IPPeerClient,
  Data.DBXCommon, Datasnap.DBClient, Datasnap.DSConnect, Data.SqlExpr;

type
  TDMCONEXAO = class(TDataModule)
    CONEXAO_INT: TUniConnection;
    SQLiteUniProvider1: TSQLiteUniProvider;
    IdSMTP: TIdSMTP;
    IdMessage: TIdMessage;
    CDS_AUX: TClientDataSet;
    CDS_AUX2: TClientDataSet;
    DSProviderConnection1: TDSProviderConnection;
    CONEXAO_EXT: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCONEXAO: TDMCONEXAO;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
