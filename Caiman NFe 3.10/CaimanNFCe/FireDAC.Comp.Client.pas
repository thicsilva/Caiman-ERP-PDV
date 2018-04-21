{*******************************************************}
{                                                       }
{               Delphi FireDAC Framework                }
{             FireDAC high-level components             }
{                                                       }
{ Copyright(c) 2016 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
{$I FireDAC.inc}

unit FireDAC.Comp.Client;

interface

uses
{$IFDEF MSWINDOWS}
  Winapi.Windows,
{$ENDIF}
  System.Classes, System.SysUtils, Data.DB, System.Generics.Collections,
  FireDAC.Stan.Intf, FireDAC.Stan.Param, FireDAC.Stan.Util, FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Column, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.UI, FireDAC.Stan.Option,
  System.StrUtils;

type
  TFDCustomManager = class;
  TFDCustomManagerClass = class of TFDCustomManager;
  TFDCustomConnection = class;
  TFDCustomConnectionClass = class of TFDCustomConnection;
  TFDCustomTransaction = class;
  TFDCustomEventAlerter = class;
  TFDCustomCommand = class;
  TFDCustomTableAdapter = class;
  TFDCustomSchemaAdapter = class;
  TFDCustomUpdateObject = class;
  TFDLocalSQLDataSet = class;
  TFDLocalSQLDataSets = class;
  TFDCustomLocalSQL = class;
  TFDAdaptedDataSet = class;
  TFDCustomMemTable = class;
  TFDRdbmsDataSet = class;
  TFDCustomQuery = class;
  TFDCustomStoredProc = class;

  TFDManager = class;
  TFDConnection = class;
  TFDTransaction = class;
  TFDEventAlerter = class;
  TFDCommand = class;
  TFDTableAdapter = class;
  TFDSchemaAdapter = class;
  TFDMetaInfoCommand = class;
  TFDMemTable = class;
  TFDQuery = class;
  TFDTable = class;
  TFDStoredProc = class;
  TFDMetaInfoQuery = class;
  TFDUpdateSQL = class;

  TFDConnectionLoginEvent = procedure (AConnection: TFDCustomConnection;
    AParams: TFDConnectionDefParams) of object;
  TFDReconcileRowEvent = procedure (ASender: TObject; ARow: TFDDatSRow;
    var Action: TFDDAptReconcileAction) of object;
  TFDUpdateRowEvent = procedure (ASender: TObject; ARow: TFDDatSRow;
    ARequest: TFDUpdateRequest; AUpdRowOptions: TFDUpdateRowOptions;
    var AAction: TFDErrorAction) of object;
  TFDExecuteErrorEvent = procedure (ASender: TObject; ATimes, AOffset: LongInt;
    AError: EFDDBEngineException; var AAction: TFDErrorAction) of object;
  TFDConnectionRecoverEvent = procedure (ASender, AInitiator: TObject;
    AException: Exception; var AAction: TFDPhysConnectionRecoverAction) of object;
  TFDEventAlerterEvent = procedure (ASender: TFDCustomEventAlerter;
    const AEventName: String; const AArgument: Variant) of object;
  TFDOperationFinishedEvent = procedure (ASander: TObject; AState: TFDStanAsyncState;
    AException: Exception) of object;
  TFDGetDatasetEvent = procedure (ASender: TObject; const ASchemaName, AName: String;
    var ADataSet: TDataSet; var AOwned: Boolean) of object;
  TFDOpenDatasetEvent = procedure (ASender: TObject; const ASchemaName, AName: String;
    const ADataSet: TDataSet) of object;

  TFDCommandFlags = set of (ckMacros, ckLockParse, ckPrepare,
    ckCreateIntfDontPrepare);
  TFDBindedBy = (bbNone, bbName, bbObject);
  TFDReleaseClientMode = (rmFetchAll, rmClose, rmOffline, rmDisconnect);
  TFDInfoReportItems = set of (riConnDef, riFireDAC, riClientLog, riClient,
    riSessionHints, riSession, riTryConnect, riKeepConnected);
  TFDInfoReportStatus = set of (rsClientError, rsSessionError, rsClientWarning,
    rsSessionWarning);

  PFDTableBookmarkData = ^TFDTableBookmarkData;
  TFDTableBookmarkData = record
    FDatasetData: TFDBookmarkData;
    FValuesBuffer: array of Byte;
  end;

  TFDCustomManager = class(TFDComponent, IFDStanOptions, IFDStanObject)
  private
    FAutoCreated: Boolean;
    FStreamedActive: Boolean;
    FConnections: TFDObjList;
    FBeforeStartup: TNotifyEvent;
    FAfterStartup: TNotifyEvent;
    FBeforeShutdown: TNotifyEvent;
    FAfterShutdown: TNotifyEvent;
    FLock: TMultiReadExclusiveWriteSynchronizer;
    FOptionsIntf: IFDStanOptions;
    FCachedConnection: TFDCustomConnection;
    FActiveStoredUsage: TFDStoredActivationUsage;
    function GetActive: Boolean;
    function GetConnectionDefFileName: String;
    function GetConnection(AIndex: Integer): TFDCustomConnection;
    function GetConnectionCount: Integer;
    function GetSilentMode: Boolean;
    function GetWaitCursor: TFDGUIxScreenCursor;
    procedure SetActive(const AValue: Boolean);
    procedure SetConnectionDefFileName(const AValue: String);
    procedure SetSilentMode(const AValue: Boolean);
    procedure SetWaitCursor(const AValue: TFDGUIxScreenCursor);
    procedure AddConnection(AConn: TFDCustomConnection);
    procedure RemoveConnection(AConn: TFDCustomConnection);
    procedure SetOptionsIntf(const AValue: IFDStanOptions);
    function GetFetchOptions: TFDFetchOptions;
    function GetFormatOptions: TFDFormatOptions;
    function GetResourceOptions: TFDTopResourceOptions;
    function GetUpdateOptions: TFDUpdateOptions;
    procedure SetFetchOptions(const AValue: TFDFetchOptions);
    procedure SetFormatOptions(const AValue: TFDFormatOptions);
    procedure SetUpdateOptions(const AValue: TFDUpdateOptions);
    procedure SetResourceOptions(const AValue: TFDTopResourceOptions);
    function GetConnectionDefs: IFDStanConnectionDefs;
    function GetState: TFDPhysManagerState;
    function GetAfterLoadConnectionDefFile: TNotifyEvent;
    function GetBeforeLoadConnectionDefFile: TNotifyEvent;
    function GetConnectionDefAutoLoad: Boolean;
    function GetConnectionDefsLoaded: Boolean;
    procedure SetAfterLoadConnectionDefFile(const AValue: TNotifyEvent);
    procedure SetBeforeLoadConnectionDefFile(const AValue: TNotifyEvent);
    procedure SetConnectionDefAutoLoad(const AValue: Boolean);
    function GetDriverDefAutoLoad: Boolean;
    function GetDriverDefFileName: String;
    procedure SetDriverDefAutoLoad(const AValue: Boolean);
    procedure SetDriverDefFileName(const AValue: String);
    function GetDriverDefs: IFDStanDefinitions;
    function GetActualConnectionDefFileName: String;
    function GetActualDriverDefFileName: String;
  protected
    // other
    procedure InternalClose; virtual;
    procedure InternalOpen; virtual;
    function InternalAcquireConnection(AConnection: TFDCustomConnection;
      const AConnectionName, AObjName: String): TFDCustomConnection; virtual;
    function InternalAcquireTemporaryConnection(const AConnectionName: string): TFDCustomConnection; virtual;
    procedure InternalReleaseConnection(var AConnection: TFDCustomConnection); virtual;
    function InternalFindConnection(const AConnectionName: string): TFDCustomConnection; virtual;
    procedure DoBeforeStartup; virtual;
    procedure DoAfterStartup; virtual;
    procedure DoBeforeShutdown; virtual;
    procedure DoAfterShutdown; virtual;
    procedure Loaded; override;
    procedure CheckActive;
    procedure CheckInactive;
    { IFDStanObject }
    function GetName: TComponentName;
    function GetParent: IFDStanObject;
    procedure BeforeReuse;
    procedure AfterReuse;
    procedure SetOwner(const AOwner: TObject; const ARole: TComponentName);
    // IFDStanOptions
    property OptionsIntfImpl: IFDStanOptions read FOptionsIntf implements IFDStanOptions;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Open;
    procedure Close;
    function AcquireConnection(const AConnectionName,
      AObjName: String): TFDCustomConnection; overload;
    function AcquireConnection(AConnection: TFDCustomConnection;
      const AObjName: String): TFDCustomConnection; overload;
    procedure ReleaseConnection(var AConnection: TFDCustomConnection);
    procedure DropConnections;
    function FindConnection(const AConnectionName: string): TFDCustomConnection;
    procedure GetConnectionNames(AList: TStrings); overload;
    procedure GetConnectionNames(AList: TStrings; ADriverName: string); overload;
    procedure GetConnectionDefNames(AList: TStrings);
    procedure GetDriverNames(AList: TStrings; AValidate: Boolean = False;
      ABaseOnly: Boolean = False);
    procedure GetCatalogNames(const AConnectionName, APattern: string; AList: TStrings);
    procedure GetSchemaNames(const AConnectionName, ACatalogName, APattern: string;
      AList: TStrings);
    procedure GetTableNames(const AConnectionName, ACatalogName, ASchemaName,
      APattern: string; AList: TStrings; AScopes: TFDPhysObjectScopes = [osMy];
      AFullName: Boolean = True);
    procedure GetFieldNames(const AConnectionName, ACatalogName, ASchemaName,
      ATableName, APattern: string; AList: TStrings);
    procedure GetKeyFieldNames(const AConnectionName, ACatalogName, ASchemaName,
      ATableName, APattern: string; AList: TStrings);
    /// <summary> The GetIndexNames method returns list of the database table
    ///  indexes. AConnectionName specifies FireDAC connection definition name.
    ///  ACatalogName and ASchemaName specify optional database table catalog
    ///  and/or schema names. ATableName specifies the database table name.
    ///  APattern specifies optional table search pattern, which uses SQL LIKE
    ///  rules. After the call the AList will be filled by the database table
    ///  index names. </summary>
    procedure GetIndexNames(const AConnectionName, ACatalogName, ASchemaName,
      ATableName, APattern: string; AList: TStrings);
    procedure GetPackageNames(const AConnectionName, ACatalogName, ASchemaName,
      APattern: string; AList: TStrings; AScopes: TFDPhysObjectScopes = [osMy];
      AFullName: Boolean = True);
    procedure GetStoredProcNames(const AConnectionName, ACatalogName, ASchemaName,
      APackage, APattern: string; AList: TStrings; AScopes: TFDPhysObjectScopes = [osMy];
      AFullName: Boolean = True);
    procedure GetGeneratorNames(const AConnectionName, ACatalogName, ASchemaName,
      APattern: string; AList: TStrings; AScopes: TFDPhysObjectScopes = [osMy];
      AFullName: Boolean = True);
    function IsConnectionDef(const AName: String): Boolean;
    procedure AddConnectionDef(const AName, ADriver: string; AList: TStrings = nil;
      APersistent: Boolean = False);
    procedure DeleteConnectionDef(const AName: string);
    procedure ModifyConnectionDef(const AName: string; AList: TStrings);
    /// <summary> The RenameConnectionDef method renames existing AOldName
    ///  connection definition to ANewName. </summary>
    procedure RenameConnectionDef(const AOldName, ANewName: string);
    procedure GetConnectionDefParams(const AName: string; AList: TStrings);
    procedure CloseConnectionDef(const AName: string);
    procedure SaveConnectionDefFile;
    procedure LoadConnectionDefFile;
    procedure RefreshMetadataCache;
    procedure RefreshConnectionDefFile;
    function GetBaseDriverID(const ADriverID: String): String;
    function GetBaseDriverDesc(const ADriverID: String): String;
    function GetRDBMSKind(const ADriverID: String): TFDRDBMSKind;
    // RO
    property State: TFDPhysManagerState read GetState;
    property AutoCreated: Boolean read FAutoCreated;
    property ConnectionCount: Integer read GetConnectionCount;
    property Connections[Index: Integer]: TFDCustomConnection read GetConnection;
    property ConnectionDefs: IFDStanConnectionDefs read GetConnectionDefs;
    property DriverDefs: IFDStanDefinitions read GetDriverDefs;
    property ConnectionDefFileLoaded: Boolean read GetConnectionDefsLoaded;
    property ActualDriverDefFileName: String read GetActualDriverDefFileName;
    property ActualConnectionDefFileName: String read GetActualConnectionDefFileName;
    // RW
    property DriverDefFileAutoLoad: Boolean read GetDriverDefAutoLoad
      write SetDriverDefAutoLoad default True;
    property DriverDefFileName: String read GetDriverDefFileName
      write SetDriverDefFileName;
    property ConnectionDefFileAutoLoad: Boolean read GetConnectionDefAutoLoad
      write SetConnectionDefAutoLoad default True;
    property ConnectionDefFileName: String read GetConnectionDefFileName
      write SetConnectionDefFileName;

    property WaitCursor: TFDGUIxScreenCursor read GetWaitCursor
      write SetWaitCursor default gcrSQLWait;
    property SilentMode: Boolean read GetSilentMode write SetSilentMode default False;

    property OptionsIntf: IFDStanOptions read FOptionsIntf write SetOptionsIntf;
    property FetchOptions: TFDFetchOptions read GetFetchOptions write SetFetchOptions;
    property FormatOptions: TFDFormatOptions read GetFormatOptions write SetFormatOptions;
    property UpdateOptions: TFDUpdateOptions read GetUpdateOptions write SetUpdateOptions;
    property ResourceOptions: TFDTopResourceOptions read GetResourceOptions write SetResourceOptions;

    property Active: Boolean read GetActive write SetActive default False;
    property ActiveStoredUsage: TFDStoredActivationUsage read FActiveStoredUsage
      write FActiveStoredUsage default [auDesignTime, auRunTime];

    property BeforeStartup: TNotifyEvent read FBeforeStartup write FBeforeStartup;
    property AfterStartup: TNotifyEvent read FAfterStartup write FAfterStartup;
    property BeforeShutdown: TNotifyEvent read FBeforeShutdown write FBeforeShutdown;
    property AfterShutdown: TNotifyEvent read FAfterShutdown write FAfterShutdown;
    property BeforeLoadConnectionDefFile: TNotifyEvent
      read GetBeforeLoadConnectionDefFile write SetBeforeLoadConnectionDefFile;
    property AfterLoadConnectionDefFile: TNotifyEvent
      read GetAfterLoadConnectionDefFile write SetAfterLoadConnectionDefFile;
  end;

  [ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidOSX32 or
    pidiOSSimulator or pidiOSDevice32 or pidiOSDevice64 or pidAndroid or
    pidLinux64)]
  TFDManager = class(TFDCustomManager)
  published
    property DriverDefFileAutoLoad;
    property DriverDefFileName;
    property ConnectionDefFileAutoLoad;
    property ConnectionDefFileName;
    property WaitCursor;
    property SilentMode;
    property FetchOptions;
    property FormatOptions;
    property ResourceOptions;
    property UpdateOptions;
    property ActiveStoredUsage;
    property Active;
    property BeforeStartup;
    property AfterStartup;
    property BeforeShutdown;
    property AfterShutdown;
    property BeforeLoadConnectionDefFile;
    property AfterLoadConnectionDefFile;
  end;

  TFDCustomConnection = class(TCustomConnection,
    IFDStanOptions, IFDStanErrorHandler, IFDStanObject, IFDPhysConnectionRecoveryHandler,
    IFDPhysTransactionStateHandler)
  private
    FConnectionIntf: IFDPhysConnection;
    FTmpConnectionIntf: IFDPhysConnection;
    FConnectionName: String;
    FParams: IFDStanConnectionDef;
    FRefCount: Integer;
    FTemporary: Boolean;
    FOnLogin: TFDConnectionLoginEvent;
    FOptionsIntf: IFDStanOptions;
    FTxOptions: TFDTxOptions;
    FCommands: TFDObjList;
    FOnError: TFDErrorEvent;
    FLoginDialog: TFDGUIxLoginDialog;
    FSharedCliHandle: Pointer;
    FOfflined: Boolean;
    FOnLost: TNotifyEvent;
    FOnRestored: TNotifyEvent;
    FOnRecover: TFDConnectionRecoverEvent;
    [Weak] FUpdateTransaction: TFDCustomTransaction;
    [Weak] FTransaction: TFDCustomTransaction;
    FLastUsed: TDateTime;
    FConnectedStoredUsage: TFDStoredActivationUsage;
    FExecSQLCommand: IFDPhysCommand;
    FExecSQLTab: TFDDatSTable;
    FDisconnecting: Boolean;
    FDeferredUnregs: TFDObjList;
    FBeforeStartTransaction: TNotifyEvent;
    FAfterStartTransaction: TNotifyEvent;
    FBeforeCommit: TNotifyEvent;
    FAfterCommit: TNotifyEvent;
    FBeforeRollback: TNotifyEvent;
    FAfterRollback: TNotifyEvent;
    function GetParams: TFDConnectionDefParams;
    procedure SetConnectionName(const AValue: String);
    procedure SetParams(const AValue: TFDConnectionDefParams);
    procedure ParamsChanging(ASender: TObject);
    function GetConnectionDefName: string;
    procedure SetConnectionDefName(const AValue: string);
    function GetDriverName: string;
    procedure SetDriverName(const AValue: string);
    function GetInTransaction: Boolean;
    function GetSQLBased: Boolean;
    function GetCommandCount: Integer;
    function GetCommands(AIndex: Integer): TFDCustomCommand;
    procedure GetParentOptions(var AOpts: IFDStanOptions);
    procedure SetOptionsIntf(const AValue: IFDStanOptions);
    function GetFetchOptions: TFDFetchOptions;
    function GetFormatOptions: TFDFormatOptions;
    function GetUpdateOptions: TFDUpdateOptions;
    function GetResourceOptions: TFDTopResourceOptions;
    procedure SetFetchOptions(const AValue: TFDFetchOptions);
    procedure SetFormatOptions(const AValue: TFDFormatOptions);
    procedure SetUpdateOptions(const AValue: TFDUpdateOptions);
    procedure SetResourceOptions(const AValue: TFDTopResourceOptions);
    procedure SetTxOptions(const AValue: TFDTxOptions);
    function GetRDBMSKind: TFDRDBMSKind;
    function CnvMetaValue(const AStr: Variant; const ADefault: String = ''): String;
    procedure DoInternalLogin;
    function GetConnectionMetadata(AOpen: Boolean = False): IFDPhysConnectionMetadata;
    procedure SetLoginDialog(const AValue: TFDGUIxLoginDialog);
    function GetCliObj: Pointer;
    function GetCliHandle: Pointer;
    procedure SetOfflined(AValue: Boolean);
    procedure AcquireDefaultTransaction(const AConnIntf: IFDPhysConnection);
    procedure AcquireConnectionIntf(out AConnIntf: IFDPhysConnection);
    procedure ReleaseDefaultTransaction(const AConnIntf: IFDPhysConnection);
    procedure ReleaseConnectionIntf(var AConnIntf: IFDPhysConnection);
    function GetMessages: EFDDBEngineException;
    function BaseCreateSQL: IFDPhysCommand;
    function BasePrepareSQL(const ACommand: IFDPhysCommand; const ASQL: String;
      const AParams: array of Variant; const ATypes: array of TFieldType;
      ABindMode: TFDParamBindMode): Boolean;
    function GetConnectionMetadataIntf: IFDPhysConnectionMetadata;
    function GetConnectionString: String;
    procedure SetConnectionString(const AConnectionString: String);
    procedure SetUserNamePassword(const AUserName, APassword: String);
    function GetActualDriverID: String;
    procedure PrepareConnectionDef(ACheckDef: Boolean);
    procedure SetSharedCliHandle(const AValue: Pointer);
    function EncodeListName(const ACatalogName, ASchemaName: String;
      const ABaseField, AObjField: String; ARow: TFDDatSRow; AList: TStrings;
      AFullName: Boolean): String;
    function GetCurrentCatalog: String;
    function GetCurrentSchema: String;
    function GetState: TFDPhysConnectionState;
  protected
    { IFDStanObject }
    function GetName: TComponentName;
    function GetParent: IFDStanObject;
    procedure BeforeReuse;
    procedure AfterReuse;
    procedure SetOwner(const AOwner: TObject; const ARole: TComponentName);
    { IFDStanErrorHandler }
    procedure HandleException(const AInitiator: IFDStanObject;
      var AException: Exception); virtual;
    { IFDPhysConnectionRecoveryHandler }
    procedure HandleConnectionRecover(const AInitiator: IFDStanObject;
      AException: Exception; var AAction: TFDPhysConnectionRecoverAction);
    procedure HandleConnectionRestored;
    procedure HandleConnectionLost;
    { IFDPhysTransactionStateHandler }
    procedure HandleDisconnectCommands(AFilter: TFDPhysDisconnectFilter;
      AMode: TFDPhysDisconnectMode);
    procedure HandleTxOperation(AOperation: TFDPhysTransactionState;
      ABefore: Boolean);
    // other
    /// <summary> AttachClient is used internally to associate objects with
    ///  the connection component. Datasets call this method when they start
    ///  using the connection component. </summary>
    procedure AttachClient(AClient: TObject);
    /// <summary> DetachClient is used internally to remove objects from the
    ///  internal list of objects that are informed when a connection is
    ///  created or terminated. AClient should be an object that was previously
    ///  associated by a call to AttachClient. Datasets call this method when
    ///  they stop using the connection component. </summary>
    procedure DetachClient(AClient: TObject);
    procedure UnRegisterClient(AClient: TObject); override;
    procedure DoConnect; override;
    procedure DoDisconnect; override;
    procedure DoValidateName(const AName: string); virtual;
    function GetConnected: Boolean; override;
    procedure SetConnected(AValue: Boolean); override;
    procedure DoLogin(const AConnectionDef: IFDStanConnectionDef); virtual;
    procedure DoRecover(const AInitiator: IFDStanObject; AException: Exception;
      var AAction: TFDPhysConnectionRecoverAction); virtual;
    procedure DoRestored; virtual;
    procedure DoLost; virtual;
    function GetADDataSet(AIndex: Integer): TFDDataSet;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; AOperation: TOperation); override;
    procedure SetTransaction(const AValue: TFDCustomTransaction); virtual;
    procedure SetUpdateTransaction(const AValue: TFDCustomTransaction); virtual;
    // IFDStanOptions
    property OptionsIntfImpl: IFDStanOptions read FOptionsIntf implements IFDStanOptions;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    /// <summary> The CloneConnection method creates a clone of this connection
    ///  object and assigns most property values of this connection to the cloned
    ///  connection object. </summary>
    function CloneConnection: TFDCustomConnection;

    procedure Commit;
    procedure CommitRetaining;
    procedure Rollback;
    procedure RollbackRetaining;
    procedure StartTransaction;

    procedure Open(const AConnectionString: String); overload;
    procedure Open(const AConnectionString: String;
      const AUserName: String; const APassword: String); overload;
    procedure Open(const AUserName: String; const APassword: String); overload;
    procedure Offline;
    procedure Online;
    procedure CheckOnline;
    procedure CheckActive;
    procedure CheckInactive;
    function Ping: Boolean;
    procedure AbortJob(AWait: Boolean = False);

{$IFDEF FireDAC_MONITOR_Comp}
    procedure Trace(AStep: TFDMoniEventStep; ASender: TObject;
      const AMsg: String; const AArgs: array of const);
{$ENDIF}
    function GetInfoReport(AList: TStrings;
      AItems: TFDInfoReportItems = [riConnDef .. riKeepConnected]): TFDInfoReportStatus;

    procedure GetCatalogNames(const APattern: string; AList: TStrings);
    procedure GetSchemaNames(const ACatalogName, APattern: string; AList: TStrings);
    procedure GetTableNames(const ACatalogName, ASchemaName, APattern: string;
      AList: TStrings; AScopes: TFDPhysObjectScopes = [osMy];
      AKinds: TFDPhysTableKinds = [tkSynonym, tkTable, tkView];
      AFullName: Boolean = True);
    procedure GetFieldNames(const ACatalogName, ASchemaName, ATableName, APattern: string;
      AList: TStrings);
    procedure GetKeyFieldNames(const ACatalogName, ASchemaName, ATableName, APattern: string;
      AList: TStrings);
    /// <summary> The GetIndexNames method returns list of the database table
    ///  indexes. ACatalogName and ASchemaName specify optional database table
    ///  catalog and/or schema names. ATableName specifies the database table name.
    ///  APattern specifies optional table search pattern, which uses SQL LIKE
    ///  rules. After the call the AList will be filled by the database table
    ///  index names. </summary>
    procedure GetIndexNames(const ACatalogName, ASchemaName, ATableName, APattern: string;
      AList: TStrings);
    procedure GetPackageNames(const ACatalogName, ASchemaName, APattern: string;
      AList: TStrings; AScopes: TFDPhysObjectScopes = [osMy];
      AFullName: Boolean = True);
    procedure GetStoredProcNames(const ACatalogName, ASchemaName, APackage, APattern: string;
      AList: TStrings; AScopes: TFDPhysObjectScopes = [osMy]; AFullName: Boolean = True);
    procedure GetGeneratorNames(const ACatalogName, ASchemaName, APattern: string;
      AList: TStrings; AScopes: TFDPhysObjectScopes = [osMy]; AFullName: Boolean = True);
    procedure RefreshMetadataCache(const AObjName: String = '');

    function EncodeObjectName(const ACatalogName, ASchemaName, ABaseObjectName,
      AObjectName: String): String;
    procedure DecodeObjectName(const AFullName: String; var ACatalogName,
      ASchemaName, ABaseObjectName, AObjectName: String);

    procedure CheckConnectionDef; virtual;
    procedure ApplyUpdates(const ADataSets: array of TFDDataSet);
      deprecated 'Use Centralized Cached Updates and TFDSchemaAdapter instead';
    procedure ReleaseClients(AMode: TFDReleaseClientMode = rmDisconnect);
    function GetLastAutoGenValue(const AName: String): Variant;
    function ExecSQL(const ASQL: String; AIgnoreObjNotExists: Boolean = False): LongInt; overload;
    function ExecSQL(const ASQL: String; const AParams: array of Variant): LongInt; overload;
    function ExecSQL(const ASQL: String; const AParams: array of Variant;
      const ATypes: array of TFieldType): LongInt; overload;
    /// <summary> The ExecSQL method executes the specified ASQL command using
    ///  AParams parameter values. The method bind parameters to the SQL command
    ///  parameter markers by position. The method returns the number of affected
    ///  records. </summary>
    function ExecSQL(const ASQL: String; AParams: TFDParams): LongInt; overload;
    /// <summary> The ExecSQL method executes the specified ASQL command using
    ///  AParams parameter values. The method bind parameters to the SQL command
    ///  parameter markers by position. When SQL command returns a result set,
    ///  then AResultSet will be assigned to a dataset with the result set.
    ///  The method returns the number of affected records. </summary>
    function ExecSQL(const ASQL: String; AParams: TFDParams; var AResultSet: TDataSet): LongInt; overload;
    function ExecSQL(const ASQL: String; var AResultSet: TDataSet): LongInt; overload;
    function ExecSQLScalar(const ASQL: String): Variant; overload;
    function ExecSQLScalar(const ASQL: String; const AParams: array of Variant): Variant; overload;
    function ExecSQLScalar(const ASQL: String; const AParams: array of Variant;
      const ATypes: array of TFieldType): Variant; overload;

    property IsSQLBased: Boolean read GetSQLBased;
    property RDBMSKind: TFDRDBMSKind read GetRDBMSKind;
    property ActualDriverID: String read GetActualDriverID;
    property InTransaction: Boolean read GetInTransaction;
    property DataSets[AIndex: Integer]: TFDDataSet read GetADDataSet;
    property CommandCount: Integer read GetCommandCount;
    property Commands[AIndex: Integer]: TFDCustomCommand read GetCommands;
    property LastUsed: TDateTime read FLastUsed;
    property RefCount: Integer read FRefCount;
    property Messages: EFDDBEngineException read GetMessages;
    /// <summary> The CurrentCatalog property returns the database session
    ///  current catalog. </summary>
    property CurrentCatalog: String read GetCurrentCatalog;
    /// <summary> The CurrentSchema property returns the database session
    ///  current schema. </summary>
    property CurrentSchema: String read GetCurrentSchema;
    /// <summary> The State property returns the current state of this
    ///  connection object. </summary>
    property State: TFDPhysConnectionState read GetState;

    property ConnectionIntf: IFDPhysConnection read FConnectionIntf;
    property ConnectionMetaDataIntf: IFDPhysConnectionMetadata read GetConnectionMetadataIntf;
    property CliObj: Pointer read GetCliObj;
    property CliHandle: Pointer read GetCliHandle;
    property SharedCliHandle: Pointer read FSharedCliHandle write SetSharedCliHandle;

    property ConnectionName: String read FConnectionName write SetConnectionName;
    property ConnectionDefName: String read GetConnectionDefName write SetConnectionDefName stored False;
    property ConnectionString: String read GetConnectionString write SetConnectionString;
    property DriverName: String read GetDriverName write SetDriverName stored False;
    property Params: TFDConnectionDefParams read GetParams write SetParams;
    property ResultConnectionDef: IFDStanConnectionDef read FParams;

    property OptionsIntf: IFDStanOptions read FOptionsIntf write SetOptionsIntf;
    property FetchOptions: TFDFetchOptions read GetFetchOptions write SetFetchOptions;
    property FormatOptions: TFDFormatOptions read GetFormatOptions write SetFormatOptions;
    property UpdateOptions: TFDUpdateOptions read GetUpdateOptions write SetUpdateOptions;
    property ResourceOptions: TFDTopResourceOptions read GetResourceOptions write SetResourceOptions;
    property TxOptions: TFDTxOptions read FTxOptions write SetTxOptions;

    property Temporary: Boolean read FTemporary write FTemporary default False;
    [Default(False)]
    // include Connected into public section, so DOM will allow to document this property
    property Connected default False;
    property ConnectedStoredUsage: TFDStoredActivationUsage read FConnectedStoredUsage
      write FConnectedStoredUsage default [auDesignTime, auRunTime];
    property Offlined: Boolean read FOfflined write SetOfflined default False;
    [Default(True)]
    property LoginPrompt default True;
    property LoginDialog: TFDGUIxLoginDialog read FLoginDialog write SetLoginDialog;

    property Transaction: TFDCustomTransaction read FTransaction
      write SetTransaction;
    property UpdateTransaction: TFDCustomTransaction read FUpdateTransaction
      write SetUpdateTransaction;

    property OnLogin: TFDConnectionLoginEvent read FOnLogin write FOnLogin;
    property OnError: TFDErrorEvent read FOnError write FOnError;
    property OnLost: TNotifyEvent read FOnLost write FOnLost;
    property OnRestored: TNotifyEvent read FOnRestored write FOnRestored;
    property OnRecover: TFDConnectionRecoverEvent read FOnRecover write FOnRecover;
    property BeforeStartTransaction: TNotifyEvent read FBeforeStartTransaction
      write FBeforeStartTransaction;
    property AfterStartTransaction: TNotifyEvent read FAfterStartTransaction
      write FAfterStartTransaction;
    property BeforeCommit: TNotifyEvent read FBeforeCommit write FBeforeCommit;
    property AfterCommit: TNotifyEvent read FAfterCommit write FAfterCommit;
    property BeforeRollback: TNotifyEvent read FBeforeRollback write FBeforeRollback;
    property AfterRollback: TNotifyEvent read FAfterRollback write FAfterRollback;
  end;

  [ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidOSX32 or
    pidiOSSimulator or pidiOSDevice32 or pidiOSDevice64 or pidAndroid or
    pidLinux64)]
  TFDConnection = class(TFDCustomConnection)
  published
    property ConnectionDefName;
    property DriverName;
    property ConnectionName;
    property Params;
    property FetchOptions;
    property FormatOptions;
    property ResourceOptions;
    property UpdateOptions;
    property TxOptions;
    property ConnectedStoredUsage;
    property Connected;
    property LoginDialog;
    property LoginPrompt;
    property Transaction;
    property UpdateTransaction;
    property OnLogin;
    property OnError;
    property OnLost;
    property OnRestored;
    property OnRecover;
    property AfterConnect;
    property BeforeConnect;
    property AfterDisconnect;
    property BeforeDisconnect;
    property BeforeStartTransaction;
    property AfterStartTransaction;
    property BeforeCommit;
    property AfterCommit;
    property BeforeRollback;
    property AfterRollback;
  end;

  TFDCustomTransaction = class(TFDComponent, IFDPhysTransactionStateHandler)
  private
    FTransactionIntf: IFDPhysTransaction;
    FConnection: TFDCustomConnection;
    FOptionsIntf: TFDTxOptions;
    FDataSets: TFDObjList;
    FNestingLevel: LongWord;
    FSerialID: LongWord;
    FBeforeStartTransaction: TNotifyEvent;
    FAfterStartTransaction: TNotifyEvent;
    FBeforeCommit: TNotifyEvent;
    FAfterCommit: TNotifyEvent;
    FBeforeRollback: TNotifyEvent;
    FAfterRollback: TNotifyEvent;
    function GetActive: Boolean;
    function GetDataSetCount: Integer;
    function GetDataSets(AIndex: Integer): TFDDataSet;
    procedure SetConnection(const AValue: TFDCustomConnection);
    procedure SetOptions(const AValue: TFDTxOptions);
    procedure DoConnectChanged(Sender: TObject; Connecting: Boolean);
    procedure InternalCreateTxIntf;
    procedure InternalDeleteTxIntf;
    procedure CheckReleased(ARetaining, AMyTrans: Boolean);
  protected
    procedure CheckConnected;
    function CheckActive: Boolean;
    // IFDPhysTransactionStateHandler
    procedure HandleDisconnectCommands(AFilter: TFDPhysDisconnectFilter;
      AMode: TFDPhysDisconnectMode);
    procedure HandleTxOperation(AOperation: TFDPhysTransactionState;
      ABefore: Boolean);
    // other
    procedure Notification(AComponent: TComponent; AOperation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure StartTransaction;
    procedure Commit;
    procedure CommitRetaining;
    procedure Rollback;
    procedure RollbackRetaining;
    property Active: Boolean read GetActive;
    property TransactionIntf: IFDPhysTransaction read FTransactionIntf;
    property DataSetCount: Integer read GetDataSetCount;
    property DataSets[AIndex: Integer]: TFDDataSet read GetDataSets;
    property Options: TFDTxOptions read FOptionsIntf write SetOptions;
    property Connection: TFDCustomConnection read FConnection write SetConnection;
    property BeforeStartTransaction: TNotifyEvent read FBeforeStartTransaction
      write FBeforeStartTransaction;
    property AfterStartTransaction: TNotifyEvent read FAfterStartTransaction
      write FAfterStartTransaction;
    property BeforeCommit: TNotifyEvent read FBeforeCommit write FBeforeCommit;
    property AfterCommit: TNotifyEvent read FAfterCommit write FAfterCommit;
    property BeforeRollback: TNotifyEvent read FBeforeRollback write FBeforeRollback;
    property AfterRollback: TNotifyEvent read FAfterRollback write FAfterRollback;
  end;

  [ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidOSX32 or
    pidiOSSimulator or pidiOSDevice32 or pidiOSDevice64 or pidAndroid or
    pidLinux64)]
  TFDTransaction = class(TFDCustomTransaction)
  published
    property Options;
    property Connection;
    property BeforeStartTransaction;
    property AfterStartTransaction;
    property BeforeCommit;
    property AfterCommit;
    property BeforeRollback;
    property AfterRollback;
  end;

  TFDCustomEventAlerter = class (TFDComponent, IFDPhysEventHandler)
  private
    FEventAlerterIntf: IFDPhysEventAlerter;
    FConnection: TFDCustomConnection;
    FNames: TStrings;
    FOptionsIntf: TFDEventAlerterOptions;
    FOnAlert: TFDEventAlerterEvent;
    FOnTimeout: TNotifyEvent;
    FStreamedActive: Boolean;
    FSubscriptionName: String;
    FChangeHandlers: TInterfaceList;
    procedure CheckAutoRegister;
    function GetActive: Boolean;
    procedure SetConnection(const AValue: TFDCustomConnection);
    procedure SetNames(const AValue: TStrings);
    procedure SetOptions(const AValue: TFDEventAlerterOptions);
    procedure DoConnectChanged(Sender: TObject; Connecting: Boolean);
    procedure DoNamesChanged(ASender: TObject);
    procedure SetActive(const AValue: Boolean);
    procedure SetSubscriptionName(const AValue: String);
  protected
    // IFDPhysEventHandler
    procedure HandleEvent(const AEventName: String; const AArgument: Variant);
    procedure HandleTimeout(var AContinue: Boolean);
    // other
    procedure Notification(AComponent: TComponent; AOperation: TOperation); override;
    procedure Loaded; override;
    /// <summary> Adds a change handler (eg, TFDAdaptedDataSet) to this event alerter.
    /// AddChangeHandler is called automatically when TFDAdaptedDataSet.ChangeAlerter
    /// is set to not nil value. </summary>
    procedure AddChangeHandler(const AHandler: IFDPhysChangeHandler);
    /// <summary> Removes a change handler (eg, TFDAdaptedDataSet) from this event alerter.
    /// RemoveChangeHandler is called automatically when TFDAdaptedDataSet.ChangeAlerter
    /// is set to nil. </summary>
    procedure RemoveChangeHandler(const AHandler: IFDPhysChangeHandler);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Register;
    procedure Unregister;
    procedure Signal(const AEvent: String; const AArgument: Variant);
    /// <summary> Refreshes the change handler (eg, TFDAdaptedDataSet) content.
    ///  When AForce=False, then refresh will be performed if alerter received
    ///  a change notification after last refreshing. When AForce=True, then
    ///  refresh will be performed unconditionally.
    ///  When AHandler=nil, then all registered change handlers will be refreshed.
    ///  Otherwise only specified change handler.
    ///  See also Options.AutoRefresh </summary>
    procedure Refresh(const AHandler: IFDPhysChangeHandler; AForce: Boolean); overload;
    property EventAlerterIntf: IFDPhysEventAlerter read FEventAlerterIntf;
    property Active: Boolean read GetActive write SetActive default False;
    property Connection: TFDCustomConnection read FConnection write SetConnection;
    property Names: TStrings read FNames write SetNames;
    /// <summary> Specifies a change notification subscription name.
    ///  The value depends on a database:
    ///  * InterBase - XE7 Change View subscription name
    ///  * SQL Server - &lt;service&gt;;&lt;queue&gt; </summary>
    property SubscriptionName: String read FSubscriptionName write SetSubscriptionName;
    property Options: TFDEventAlerterOptions read FOptionsIntf write SetOptions;
    property OnAlert: TFDEventAlerterEvent read FOnAlert write FOnAlert;
    property OnTimeout: TNotifyEvent read FOnTimeout write FOnTimeout;
  end;

  [ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidOSX32 or
    pidiOSSimulator or pidiOSDevice32 or pidiOSDevice64 or pidAndroid or
    pidLinux64)]
  TFDEventAlerter = class(TFDCustomEventAlerter)
  published
    property Active;
    property Connection;
    property Names;
    property SubscriptionName;
    property Options;
    property OnAlert;
    property OnTimeout;
  end;

  TFDCustomCommand = class(TFDComponent, IFDStanOptions, IFDStanErrorHandler,
    IFDStanObject, IFDStanAsyncHandler, IFDPhysCommandStateHandler)
  private
    FCommandIntf: IFDPhysCommand;
    FCommandText: TStrings;
    FConnectionName: String;
    FConnection: TFDCustomConnection;
    FOptionsIntf: IFDStanOptions;
    FParams: TFDParams;
    FMacros: TFDMacros;
    FStreamedActive, FStreamedPrepared: Boolean;
    FFlags: TFDCommandFlags;
    [Weak] FOwner: TFDDataSet;
    FRowsAffected: TFDCounter;
    FOverload: Word;
    FBeforePrepare, FAfterPrepare,
    FBeforeUnprepare, FAfterUnprepare,
    FBeforeOpen, FAfterOpen,
    FBeforeClose, FAfterClose,
    FBeforeExecute, FAfterExecute,
    FBeforeFetch, FAfterFetch: TNotifyEvent;
    FFixedCommandKind: Boolean;
    FCommandKind: TFDPhysCommandKind;
    FBaseObjectName: String;
    FSchemaName: String;
    FCatalogName: String;
    FBindedBy: TFDBindedBy;
    FOnError: TFDErrorEvent;
    FOnCommandChanged: TNotifyEvent;
    FOperationFinished: TFDOperationFinishedEvent;
    FThreadID: TThreadID;
    [Weak] FTableAdapter: TFDCustomTableAdapter;
    FTransaction: TFDCustomTransaction;
    FActiveStoredUsage: TFDStoredActivationUsage;
    function GetCommandKind: TFDPhysCommandKind;
    function GetState: TFDPhysCommandState;
    procedure SetConnection(const AValue: TFDCustomConnection);
    procedure SetConnectionName(const AValue: String);
    function GetActive: Boolean;
    procedure SetActiveBase(const AValue, ABlocked: Boolean);
    procedure SetActive(const AValue: Boolean);
    function IsPS: Boolean;
    function GetPrepared: Boolean;
    procedure SetPrepared(const AValue: Boolean);
    procedure CheckInactive;
    procedure CheckActive;
    procedure GetParentOptions(var AOpts: IFDStanOptions);
    procedure SetOptionsIntf(const AValue: IFDStanOptions);
    function GetFetchOptions: TFDFetchOptions;
    function GetFormatOptions: TFDFormatOptions;
    function GetResourceOptions: TFDBottomResourceOptions;
    function GetUpdateOptions: TFDBottomUpdateOptions;
    procedure SetFetchOptions(const AValue: TFDFetchOptions);
    procedure SetFormatOptions(const AValue: TFDFormatOptions);
    procedure SetUpdateOptions(const AValue: TFDBottomUpdateOptions);
    procedure SetResourceOptions(const AValue: TFDBottomResourceOptions);
    procedure DoSQLChanging(ASender: TObject);
    procedure DoSQLChange(ASender: TObject);
    procedure PreprocessSQL(const ASQL: String; AParams: TFDParams;
      AMacrosUpd, AMacrosRead: TFDMacros; ACreateParams, ACreateMacros,
      AExpandMacros, AExpandEscape, AParseSQL: Boolean;
      var ACommandKind: TFDPhysCommandKind; var AFrom: String);
    procedure SetCommandTextStrs(const AValue: TStrings); overload;
    procedure SetCommandText(const ASQL: String; AResetParams: Boolean); overload;
    procedure SetMacros(const AValue: TFDMacros);
    procedure SetParams(const AValue: TFDParams);
    function IsCNNS: Boolean;
    function IsCNS: Boolean;
    procedure SetOverload(const AValue: Word);
    procedure CheckUnprepared;
    procedure CheckAsyncProgress;
    procedure CheckPrepared;
    procedure SetCommandKind(const AValue: TFDPhysCommandKind);
    procedure SetBaseObjectName(const AValue: String);
    procedure SetSchemaName(const AValue: String);
    function CheckComponentState(AState: TComponentState): Boolean;
    procedure SetCatalogName(const AValue: String);
    procedure MacrosChanged(ASender: TObject);
    procedure PropertyChange;
    procedure SetParamBindMode(const AValue: TFDParamBindMode);
    procedure InternalCloseConnection;
    function GetConnectionMetadata: IFDPhysConnectionMetadata;
    procedure FetchFinished(ASender: TObject; AState: TFDStanAsyncState;
      AException: Exception);
    procedure WriteCollection(AWriter: TWriter; ACollection: TCollection);
    procedure ReadCollection(AReader: TReader; ACollection: TCollection);
    procedure ReadMacros(Reader: TReader);
    procedure ReadParams(Reader: TReader);
    procedure WriteMacros(Writer: TWriter);
    procedure WriteParams(Writer: TWriter);
    function GetParamBindMode: TFDParamBindMode;
    function IsCKS: Boolean;
    function GetParamsOwner: TPersistent;
    function GetDisplayName: String;
    function GetSQLText: String;
    function GetValues(const AParamNames: String): Variant;
    procedure SetValues(const AParamNames: String; const AValue: Variant);
    procedure ReadPrepared(Reader: TReader);
    function DoStoredActivation: Boolean;
  protected
    FEnableParamsStorage: Boolean;
    { IFDStanObject }
    function GetName: TComponentName;
    function GetParent: IFDStanObject;
    procedure BeforeReuse;
    procedure AfterReuse;
    procedure SetOwner(const AOwner: TObject; const ARole: TComponentName);
    { IFDStanErrorHandler }
    procedure HandleException(const AInitiator: IFDStanObject;
      var AException: Exception); virtual;
    { IFDPhysCommandStateHandler }
    procedure HandleFinished(const AInitiator: IFDStanObject;
      AState: TFDStanAsyncState; AException: Exception); virtual;
    procedure HandleUnprepare;
    // other
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; AOperation: TOperation); override;
    procedure DefineProperties(AFiler: TFiler); override;
    // own
    procedure InternalCreateCommandIntf; virtual;
    procedure InternalPrepare; virtual;
    procedure InternalUnprepare; virtual;
    procedure InternalOpen(ABlocked: Boolean); virtual;
    procedure InternalOpenFinished(ASender: TObject; AState: TFDStanAsyncState;
      AException: Exception); virtual;
    procedure InternalClose(AAll: Boolean); virtual;
    procedure InternalExecute(ATimes: Integer; AOffset: Integer; ABlocked: Boolean); virtual;
    procedure InternalExecuteFinished(ASender: TObject; AState: TFDStanAsyncState;
      AException: Exception); virtual;
    procedure DoBeforePrepare; virtual;
    procedure DoBeforeUnprepare; virtual;
    procedure DoAfterPrepare; virtual;
    procedure DoAfterUnprepare; virtual;
    procedure DoBeforeOpen; virtual;
    procedure DoBeforeClose; virtual;
    procedure DoAfterOpen; virtual;
    procedure DoAfterClose; virtual;
    procedure DoAfterExecute; virtual;
    procedure DoBeforeExecute; virtual;
    procedure DoAfterFetch; virtual;
    procedure DoBeforeFetch; virtual;
    procedure SetTransaction(const AValue: TFDCustomTransaction); virtual;
    // IFDStanOptions
    property OptionsIntfImpl: IFDStanOptions read FOptionsIntf implements IFDStanOptions;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetConnection(ACheck: Boolean): TFDCustomConnection;
    function AcquireConnection: TFDCustomConnection;
    procedure ReleaseConnection(var AConnection: TFDCustomConnection);
    procedure FillParams(AParams: TFDParams; const ASQL: String = '');
    function FindParam(const AValue: string): TFDParam;
    function ParamByName(const AValue: string): TFDParam;
    function FindMacro(const AValue: string): TFDMacro;
    function MacroByName(const AValue: string): TFDMacro;

{$IFDEF FireDAC_MONITOR_Comp}
    procedure Trace(AStep: TFDMoniEventStep;
      const AMsg: String; const AArgs: array of const);
{$ENDIF}

    procedure AbortJob(AWait: Boolean = False);
    procedure Disconnect(AAbortJob: Boolean = False);
    procedure Prepare(const ACommandText: String = '');
    procedure Unprepare;
    procedure Open(ABlocked: Boolean = False);
    function OpenOrExecute(ABlocked: Boolean = False): Boolean;
    procedure Close;
    procedure CloseAll;
    procedure CloseStreams;
    procedure NextRecordSet;
    procedure Execute(ATimes: Integer = 0; AOffset: Integer = 0; ABlocked: Boolean = False); overload;
    function Execute(const ASQL: String): LongInt; overload;
    function Execute(const ASQL: String; const AParams: array of Variant): LongInt; overload;
    function Execute(const ASQL: String; const AParams: array of Variant;
      const ATypes: array of TFieldType): LongInt; overload;
    function Define(ASchema: TFDDatSManager; ATable: TFDDatSTable = nil;
      AMetaInfoMergeMode: TFDPhysMetaInfoMergeMode = mmReset): TFDDatSTable; overload;
    function Define(ATable: TFDDatSTable = nil;
      AMetaInfoMergeMode: TFDPhysMetaInfoMergeMode = mmReset): TFDDatSTable; overload;
    procedure Fetch(ATable: TFDDatSTable; AAll: Boolean = True; ABlocked: Boolean = False); overload;

    property BindedBy: TFDBindedBy read FBindedBy;
    property CommandIntf: IFDPhysCommand read FCommandIntf;
    property RowsAffected: TFDCounter read FRowsAffected;
    property State: TFDPhysCommandState read GetState;
    property SQLText: String read GetSQLText;
    property DataSet: TFDDataSet read FOwner;

    property OptionsIntf: IFDStanOptions read FOptionsIntf write SetOptionsIntf;
    property FormatOptions: TFDFormatOptions read GetFormatOptions write SetFormatOptions;
    property FetchOptions: TFDFetchOptions read GetFetchOptions write SetFetchOptions;
    property ResourceOptions: TFDBottomResourceOptions read GetResourceOptions write SetResourceOptions;
    property UpdateOptions: TFDBottomUpdateOptions read GetUpdateOptions write SetUpdateOptions;

    property Connection: TFDCustomConnection read FConnection write SetConnection stored IsCNS;
    property ConnectionName: String read FConnectionName write SetConnectionName stored IsCNNS;
    property Transaction: TFDCustomTransaction read FTransaction write SetTransaction;
    property CatalogName: String read FCatalogName write SetCatalogName;
    property SchemaName: String read FSchemaName write SetSchemaName;
    property BaseObjectName: String read FBaseObjectName write SetBaseObjectName;
    property Overload: Word read FOverload write SetOverload default 0;
    property Macros: TFDMacros read FMacros write SetMacros stored False;
    property Params: TFDParams read FParams write SetParams stored False;
    property ParamBindMode: TFDParamBindMode read GetParamBindMode
      write SetParamBindMode default pbByName;
    property FixedCommandKind: Boolean read FFixedCommandKind write FFixedCommandKind;
    property CommandKind: TFDPhysCommandKind read GetCommandKind write SetCommandKind
      stored IsCKS default skUnknown;
    property CommandText: TStrings read FCommandText write SetCommandTextStrs;
    property Values[const AParamNames: String]: Variant read GetValues write SetValues; default;

    property Prepared: Boolean read GetPrepared write SetPrepared stored IsPS default False;
    property Active: Boolean read GetActive write SetActive default False;
    property ActiveStoredUsage: TFDStoredActivationUsage read FActiveStoredUsage
      write FActiveStoredUsage default [auDesignTime, auRunTime];

    property BeforePrepare: TNotifyEvent read FBeforePrepare write FBeforePrepare;
    property AfterPrepare: TNotifyEvent read FAfterPrepare write FAfterPrepare;
    property AfterUnprepare: TNotifyEvent read FAfterUnprepare write FAfterUnprepare;
    property BeforeUnprepare: TNotifyEvent read FBeforeUnprepare write FBeforeUnprepare;
    property BeforeExecute: TNotifyEvent read FBeforeExecute write FBeforeExecute;
    property AfterExecute: TNotifyEvent read FAfterExecute write FAfterExecute;
    property BeforeClose: TNotifyEvent read FBeforeClose write FBeforeClose;
    property AfterClose: TNotifyEvent read FAfterClose write FAfterClose;
    property BeforeOpen: TNotifyEvent read FBeforeOpen write FBeforeOpen;
    property AfterOpen: TNotifyEvent read FAfterOpen write FAfterOpen;
    property BeforeFetch: TNotifyEvent read FBeforeFetch write FBeforeFetch;
    property AfterFetch: TNotifyEvent read FAfterFetch write FAfterFetch;
    property OnError: TFDErrorEvent read FOnError write FOnError;
    property OnCommandChanged: TNotifyEvent read FOnCommandChanged write FOnCommandChanged;
  end;

  [ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidOSX32 or
    pidiOSSimulator or pidiOSDevice32 or pidiOSDevice64 or pidAndroid or
    pidLinux64)]
  TFDCommand = class(TFDCustomCommand)
  published
    property ConnectionName;
    property Connection;
    property Transaction;
    property CatalogName;
    property SchemaName;
    property BaseObjectName;
    property Overload;
    property Params;
    property Macros;
    property FetchOptions;
    property FormatOptions;
    property ResourceOptions;
    property UpdateOptions;
    property CommandKind;
    property CommandText;
    property ActiveStoredUsage;
    property Active;
    property BeforeClose;
    property BeforeOpen;
    property AfterClose;
    property AfterOpen;
    property BeforeUnprepare;
    property BeforePrepare;
    property AfterUnprepare;
    property AfterPrepare;
    property BeforeExecute;
    property AfterExecute;
    property OnError;
    property OnCommandChanged;
  end;

  [ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidOSX32 or
    pidiOSSimulator or pidiOSDevice32 or pidiOSDevice64 or pidAndroid or
    pidLinux64)]
  TFDMetaInfoCommand = class(TFDCustomCommand)
  private
    FWildcard: String;
    FMetaInfoKind: TFDPhysMetaInfoKind;
    FTableKinds: TFDPhysTableKinds;
    FObjectScopes: TFDPhysObjectScopes;
    procedure SetMetaInfoKind(const AValue: TFDPhysMetaInfoKind);
    procedure SetTableKinds(const AValue: TFDPhysTableKinds);
    procedure SetWildcard(const AValue: String);
    function GetObjectName: String;
    procedure SetObjectName(const AValue: String);
    procedure SetObjectScopes(const AValue: TFDPhysObjectScopes);
  protected
    procedure InternalCreateCommandIntf; override;
    procedure InternalPrepare; override;
    procedure DoAfterClose; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Active;
    property ConnectionName;
    property Connection;
    property FormatOptions;
    property Overload;
    property ObjectName: String read GetObjectName write SetObjectName;
    property MetaInfoKind: TFDPhysMetaInfoKind read FMetaInfoKind
      write SetMetaInfoKind default mkTables;
    property TableKinds: TFDPhysTableKinds read FTableKinds
      write SetTableKinds default [tkSynonym, tkTable, tkView];
    property Wildcard: String read FWildcard write SetWildcard;
    property ObjectScopes: TFDPhysObjectScopes read FObjectScopes
      write SetObjectScopes default [osMy];
    property CatalogName;
    property SchemaName;
    property BaseObjectName;
    property BeforeClose;
    property BeforeOpen;
    property AfterClose;
    property AfterOpen;
    property OnError;
    property OnCommandChanged;
  end;

  TFDCustomTableAdapter = class(TFDComponent, IFDStanErrorHandler,
    IFDDAptUpdateHandler)
  private
    FTableAdapterIntf: IFDDAptTableAdapter;
    FTableAdapterOwned: Boolean;
    FSelectCommand: TFDCustomCommand;
    FInsertCommand: TFDCustomCommand;
    FUpdateCommand: TFDCustomCommand;
    FDeleteCommand: TFDCustomCommand;
    FLockCommand: TFDCustomCommand;
    FUnLockCommand: TFDCustomCommand;
    FFetchRowCommand: TFDCustomCommand;
    FOnError: TFDErrorEvent;
    FOnReconcileRow: TFDReconcileRowEvent;
    FOnUpdateRow: TFDUpdateRowEvent;
    FSchemaAdapter: TFDCustomSchemaAdapter;
    [Weak] FAdaptedDataSet: TFDAdaptedDataSet;
    FUpdateTransaction: TFDCustomTransaction;

    procedure SetUpdateTransaction(const AValue: TFDCustomTransaction);
    procedure SetDeleteCommand(const AValue: TFDCustomCommand);
    procedure SetFetchRowCommand(const AValue: TFDCustomCommand);
    procedure SetInsertCommand(const AValue: TFDCustomCommand);
    procedure SetLockCommand(const AValue: TFDCustomCommand);
    procedure SetSelectCommand(const AValue: TFDCustomCommand);
    procedure SetUnLockCommand(const AValue: TFDCustomCommand);
    procedure SetUpdateCommand(const AValue: TFDCustomCommand);
    procedure InternalUpdateTransaction;
    function InternalUpdateAdapterCmd(ACmd: TFDActionRequest): Boolean;
    procedure UpdateAdapterCmd(ACmd: TFDActionRequest);
    procedure UpdateAdapterCmds(const ACmds: array of TFDActionRequest);
    procedure SetAdapterCmd(const ACmd: IFDPhysCommand;
      ACmdKind: TFDActionRequest);
    procedure SetCommand(var AVar: TFDCustomCommand;
      const AValue: TFDCustomCommand; ACmdKind: TFDActionRequest);
    function GetDatSTable: TFDDatSTable; inline;
    function GetDatSTableName: String; inline;
    function GetMetaInfoMergeMode: TFDPhysMetaInfoMergeMode; inline;
    function GetSourceRecordSetID: Integer; inline;
    function GetSourceRecordSetName: String; inline;
    function GetUpdateTableName: String; inline;
    procedure SetDatSTable(const AValue: TFDDatSTable); inline;
    procedure SetDatSTableName(const AValue: String); inline;
    procedure SetMetaInfoMergeMode(const AValue: TFDPhysMetaInfoMergeMode); inline;
    procedure SetSourceRecordSetID(const AValue: Integer);
    procedure SetSourceRecordSetName(const AValue: String);
    procedure SetUpdateTableName(const AValue: String); inline;
    function GetColumnMappings: TFDDAptColumnMappings; inline;
    procedure SetSchemaAdapter(const AValue: TFDCustomSchemaAdapter);
    function IsSRSNS: Boolean;
    function GetCommand(ACmdKind: TFDActionRequest): TFDCustomCommand;
    procedure SetTableAdapterIntf(const AAdapter: IFDDAptTableAdapter;
      AOwned: Boolean);
    procedure SetColumnMappings(const AValue: TFDDAptColumnMappings);
    function IsDTNS: Boolean;
    function IsUTNS: Boolean;
    function IsCMS: Boolean;
    function GetDatSManager: TFDDatSManager; inline;
    procedure SetDatSManager(AValue: TFDDatSManager);
    function GetSender: TObject;
    function GetActualTransaction: TFDCustomTransaction;
    function GetActualUpdateTransaction: TFDCustomTransaction;
  protected
    procedure Notification(AComponent: TComponent; AOperation: TOperation); override;
    // IFDStanErrorHandler
    procedure HandleException(const AInitiator: IFDStanObject;
      var AException: Exception); virtual;
    // IFDDAptUpdateHandler
    procedure ReconcileRow(ARow: TFDDatSRow; var AAction: TFDDAptReconcileAction); virtual;
    procedure UpdateRow(ARow: TFDDatSRow; ARequest: TFDUpdateRequest;
      AUpdRowOptions: TFDUpdateRowOptions; var AAction: TFDErrorAction); virtual;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function Define: TFDDatSTable;
    procedure Fetch(AAll: Boolean = False); overload;
    function ApplyUpdates(AMaxErrors: Integer = -1): Integer; overload;
    function Reconcile: Boolean;
    procedure Reset;

    procedure Fetch(ARow: TFDDatSRow; var AAction: TFDErrorAction;
      AColumn: Integer; ARowOptions: TFDPhysFillRowOptions); overload;
    procedure Update(ARow: TFDDatSRow; var AAction: TFDErrorAction;
      AUpdRowOptions: TFDUpdateRowOptions = []; AForceRequest: TFDActionRequest = arFromRow); overload;
    procedure Lock(ARow: TFDDatSRow; var AAction: TFDErrorAction;
      AUpdRowOptions: TFDUpdateRowOptions = []);
    procedure UnLock(ARow: TFDDatSRow; var AAction: TFDErrorAction;
      AUpdRowOptions: TFDUpdateRowOptions = []);

    property SchemaAdapter: TFDCustomSchemaAdapter read FSchemaAdapter
      write SetSchemaAdapter;
    property DataSet: TFDAdaptedDataSet read FAdaptedDataSet;

    property SourceRecordSetName: String read GetSourceRecordSetName
      write SetSourceRecordSetName stored IsSRSNS;
    property SourceRecordSetID: Integer read GetSourceRecordSetID
      write SetSourceRecordSetID default -1;
    property UpdateTableName: String read GetUpdateTableName write SetUpdateTableName
      stored IsUTNS;
    property DatSTableName: String read GetDatSTableName write SetDatSTableName
      stored IsDTNS;
    property DatSTable: TFDDatSTable read GetDatSTable write SetDatSTable;
    property MetaInfoMergeMode: TFDPhysMetaInfoMergeMode read GetMetaInfoMergeMode
      write SetMetaInfoMergeMode default mmReset;
    property DatSManager: TFDDatSManager read GetDatSManager write SetDatSManager;

    property TableAdapterIntf: IFDDAptTableAdapter read FTableAdapterIntf;
    property ColumnMappings: TFDDAptColumnMappings read GetColumnMappings
      write SetColumnMappings stored IsCMS;

    property UpdateTransaction: TFDCustomTransaction read FUpdateTransaction
      write SetUpdateTransaction;
    property SelectCommand: TFDCustomCommand read FSelectCommand
      write SetSelectCommand;
    property InsertCommand: TFDCustomCommand read FInsertCommand
      write SetInsertCommand;
    property UpdateCommand: TFDCustomCommand read FUpdateCommand
      write SetUpdateCommand;
    property DeleteCommand: TFDCustomCommand read FDeleteCommand
      write SetDeleteCommand;
    property LockCommand: TFDCustomCommand read FLockCommand
      write SetLockCommand;
    property UnLockCommand: TFDCustomCommand read FUnLockCommand
      write SetUnLockCommand;
    property FetchRowCommand: TFDCustomCommand read FFetchRowCommand
      write SetFetchRowCommand;

    property OnError: TFDErrorEvent read FOnError write FOnError;
    property OnReconcileRow: TFDReconcileRowEvent read FOnReconcileRow
      write FOnReconcileRow;
    property OnUpdateRow: TFDUpdateRowEvent read FOnUpdateRow
      write FOnUpdateRow;
  end;

  [ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidOSX32 or
    pidiOSSimulator or pidiOSDevice32 or pidiOSDevice64 or pidAndroid or
    pidLinux64)]
  TFDTableAdapter = class(TFDCustomTableAdapter)
  published
    property SchemaAdapter;
    property SourceRecordSetName;
    property SourceRecordSetID;
    property UpdateTableName;
    property DatSTableName;
    property MetaInfoMergeMode;
    property UpdateTransaction;
    property SelectCommand;
    property InsertCommand;
    property UpdateCommand;
    property DeleteCommand;
    property LockCommand;
    property UnLockCommand;
    property FetchRowCommand;
    property ColumnMappings;
    property OnError;
    property OnReconcileRow;
    property OnUpdateRow;
  end;

  TFDCustomSchemaAdapter = class(TFDComponent, IUnknown,
    IFDStanErrorHandler, IFDDAptUpdateHandler)
  private
    FTableAdapters: TFDObjList;
    FDAptSchemaAdapter: IFDDAptSchemaAdapter;
    FEncoder: TFDEncoder;
    FBeforeApplyUpdate: TNotifyEvent;
    FAfterApplyUpdate: TNotifyEvent;
    FOnError: TFDErrorEvent;
    FOnReconcileRow: TFDReconcileRowEvent;
    FOnUpdateRow: TFDUpdateRowEvent;
    function GetTableAdaptersIntf: IFDDAptTableAdapters; inline;
    function GetDatSManager: TFDDatSManager; inline;
    procedure SetDatSManager(const AValue: TFDDatSManager); inline;
    function GetCount: Integer; inline;
    function GetTableAdapters(AIndex: Integer): TFDCustomTableAdapter; inline;
    function GetDataSets(AIndex: Integer): TFDAdaptedDataSet; inline;
    function GetResourceOptions: TFDBottomResourceOptions;
    procedure SetResourceOptions(const AValue: TFDBottomResourceOptions);
    function GetUpdateOptions: TFDUpdateOptions;
    procedure SetUpdateOptions(const AValue: TFDUpdateOptions);
    procedure SaveToStorage(const AFileName: String; AStream: TStream;
      AFormat: TFDStorageFormat);
    procedure LoadFromStorage(const AFileName: String; AStream: TStream;
      AFormat: TFDStorageFormat);
    procedure StartWait;
    procedure StopWait;
    function GetChangeCount: Integer;
    function GetSavePoint: Int64;
    function GetUpdatesPending: Boolean;
    procedure SetSavePoint(const AValue: Int64);
    procedure CheckDataSets(ACancel: Boolean);
    procedure ResyncDataSets;
    procedure SetActive(AValue: Boolean);
  protected
    procedure DoAfterApplyUpdate(AErrors: Integer); virtual;
    procedure DoBeforeApplyUpdate; virtual;
    // IFDStanErrorHandler
    procedure HandleException(const AInitiator: IFDStanObject;
      var AException: Exception); virtual;
    // IFDDAptUpdateHandler
    procedure ReconcileRow(ARow: TFDDatSRow; var AAction: TFDDAptReconcileAction); virtual;
    procedure UpdateRow(ARow: TFDDatSRow; ARequest: TFDUpdateRequest;
      AUpdRowOptions: TFDUpdateRowOptions; var AAction: TFDErrorAction); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    /// <summary> Open method opens all datasets associated with this schema adapter. </summary>
    procedure Open;
    /// <summary> Close method closes all datasets associated with this schema adapter. </summary>
    procedure Close;

    function ApplyUpdates(AMaxErrors: Integer = -1): Integer;
    function Reconcile: Boolean;
    /// <summary> CommitUpdates method marks all records in this schema adapter changes log
    ///  as unmodified and removes them from the changes log. </summary>
    procedure CommitUpdates;
    /// <summary> CancelUpdates method cancels changes for all records in this schema adapter
    ///  changes log and removes them from the changes log. </summary>
    procedure CancelUpdates;
    /// <summary> UndoLastChange method cancels last record change in this schema adapter
    ///  changes log and removes the record from the changes log. </summary>
    function UndoLastChange: Boolean;

    procedure LoadFromStream(AStream: TStream; AFormat: TFDStorageFormat = sfAuto);
    procedure LoadFromFile(const AFileName: String = ''; AFormat: TFDStorageFormat = sfAuto);
    procedure SaveToStream(AStream: TStream; AFormat: TFDStorageFormat = sfAuto);
    procedure SaveToFile(const AFileName: String = ''; AFormat: TFDStorageFormat = sfAuto);

    property DatSManager: TFDDatSManager read GetDatSManager write SetDatSManager;
    property TableAdaptersIntf: IFDDAptTableAdapters read GetTableAdaptersIntf;

    property TableAdapters[AIndex: Integer]: TFDCustomTableAdapter read GetTableAdapters; default;
    property DataSets[AIndex: Integer]: TFDAdaptedDataSet read GetDataSets;
    property Count: Integer read GetCount;

    property ResourceOptions: TFDBottomResourceOptions read GetResourceOptions write SetResourceOptions;
    /// <summary> UpdateOptions property returns reference to update options,
    ///  will be used at applying updates. </summary>
    property UpdateOptions: TFDUpdateOptions read GetUpdateOptions write SetUpdateOptions;
    /// <summary> SavePoint property returns current position in the changes log. When assigned,
    ///  then changes log will return to the state, when the value was obtained. </summary>
    property SavePoint: Int64 read GetSavePoint write SetSavePoint;
    /// <summary> UpdatesPending property returns True when changes log has changed rows. </summary>
    property UpdatesPending: Boolean read GetUpdatesPending;
    /// <summary> ChangeCount property returns the number of changes in the changes log. </summary>
    property ChangeCount: Integer read GetChangeCount;

    property BeforeApplyUpdate: TNotifyEvent read FBeforeApplyUpdate write FBeforeApplyUpdate;
    property AfterApplyUpdate: TNotifyEvent read FAfterApplyUpdate write FAfterApplyUpdate;
    property OnError: TFDErrorEvent read FOnError write FOnError;
    property OnReconcileRow: TFDReconcileRowEvent read FOnReconcileRow write FOnReconcileRow;
    property OnUpdateRow: TFDUpdateRowEvent read FOnUpdateRow write FOnUpdateRow;
  end;

  [ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidOSX32 or
    pidiOSSimulator or pidiOSDevice32 or pidiOSDevice64 or pidAndroid or
    pidLinux64)]
  TFDSchemaAdapter = class(TFDCustomSchemaAdapter)
  published
    property ResourceOptions;
    property UpdateOptions;
    property BeforeApplyUpdate;
    property AfterApplyUpdate;
    property OnError;
    property OnReconcileRow;
    property OnUpdateRow;
  end;

  TFDCustomUpdateObject = class(TFDComponent)
  private
    [Weak] FDataSet: TFDAdaptedDataSet;
    procedure SetDataSet(const AValue: TFDAdaptedDataSet);
  protected
    procedure Notification(AComponent: TComponent; AOperation: TOperation); override;
    procedure AttachToAdapter; virtual; abstract;
    procedure DetachFromAdapter; virtual; abstract;
  public
    procedure Apply(ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
      AOptions: TFDUpdateRowOptions); virtual; abstract;
    property DataSet: TFDAdaptedDataSet read FDataSet write SetDataSet;
  end;

  TFDLocalSQLDataSet = class (TCollectionItem)
  private
    FDataSet: TDataSet;
    FSchemaName: String;
    FName: String;
    FAdapter: IFDPhysLocalSQLAdapter;
    FTemporary: Boolean;
    FOwned: Boolean;
    procedure SetSchemaName(const AValue: String);
    procedure SetName(const AValue: String);
    procedure SetDataSet(const AValue: TDataSet);
    procedure Changing;
    procedure Changed;
    procedure UpdateAdapter;
    function GetActualName: String;
    function GetIsValid: Boolean;
    procedure Vacate;
    function GetActualSchemaName: String;
    function GetFullName: String;
  protected
    function GetDisplayName: String; override;
  public
    destructor Destroy; override;
    procedure Assign(ASource: TPersistent); override;
    property ActualSchemaName: String read GetActualSchemaName;
    property ActualName: String read GetActualName;
    property FullName: String read GetFullName;
    property IsValid: Boolean read GetIsValid;
    property Adapter: IFDPhysLocalSQLAdapter read FAdapter;
  published
    property DataSet: TDataSet read FDataSet write SetDataSet;
    property SchemaName: String read FSchemaName write SetSchemaNAme;
    property Name: String read FName write SetName;
    property Temporary: Boolean read FTemporary write FTemporary default False;
    property Owned: Boolean read FOwned write FOwned default False;
  end;

  TFDLocalSQLDataSets = class (TCollection)
  private
    [Weak] FOwner: TFDCustomLocalSQL;
    function GetItems(AIndex: Integer): TFDLocalSQLDataSet;
    procedure SetItems(AIndex: Integer; const AValue: TFDLocalSQLDataSet);
    procedure CheckUnique(AItem: TFDLocalSQLDataSet);
  protected
    function GetOwner: TPersistent; override;
  public
    constructor Create(AOwner: TFDCustomLocalSQL);
    function Add: TFDLocalSQLDataSet; overload;
    function Add(ADataSet: TDataSet; const ASchemaName: String = '';
      const AName: String = ''): TFDLocalSQLDataSet; overload;
    procedure Remove(ADataSet: TDataSet);
    procedure Vacate;
    function FindDataSet(const ASchemaName, AName: String): TFDLocalSQLDataSet;
    property Items[AIndex: Integer]: TFDLocalSQLDataSet read GetItems write SetItems; default;
  end;

  TFDCustomLocalSQL = class(TFDComponent, IFDPhysSQLHandler)
  private
    FSchemaName: String;
    FActive: Boolean;
    FStreamedActive: Boolean;
    FActivated: Boolean;
    FConnection: TFDCustomConnection;
    FDataSets: TFDLocalSQLDataSets;
    FOnGetDataSet: TFDGetDatasetEvent;
    FOnOpenDataSet: TFDOpenDatasetEvent;
    FOnCloseDataSet: TFDOpenDatasetEvent;
    FOnReleaseDataSet: TFDGetDatasetEvent;
    procedure SetSchemaName(const AValue: String);
    procedure SetConnection(const AValue: TFDCustomConnection);
    procedure DoConnectChanged(Sender: TObject; Connecting: Boolean);
    procedure CheckDataSetAdded(const AItem: TFDLocalSQLDataSet);
    procedure CheckDataSetRemoving(const AItem: TFDLocalSQLDataSet);
    procedure SetActive(const AValue: Boolean);
    procedure SetDataSets(const AValue: TFDLocalSQLDataSets);
    procedure ReadDataSets(Reader: TReader);
    procedure WriteDataSets(Writer: TWriter);
    procedure ReleaseDataSet(AItem: TFDLocalSQLDataSet);
    function MatchSchema(var ASchemaName: String): Boolean;
  protected
    // IFDPhysSQLHandler
    function FindAdapter(const ASchemaName, AName: String): IFDPhysLocalSQLAdapter;
    function GetDataSet(const ASchemaName, AName: String): Boolean;
    procedure OpenDataSet(const ASchemaName, AName: String; ADataSet: TObject);
    procedure CloseDataSet(const ASchemaName, AName: String; ADataSet: TObject);
    // internal overridable
    procedure InternalAttachToSQL; virtual; abstract;
    procedure InternalDetachFromSQL; virtual; abstract;
    procedure InternalDataSetAdded(ADataSet: TFDLocalSQLDataSet); virtual; abstract;
    procedure InternalDataSetRemoving(ADataSet: TFDLocalSQLDataSet); virtual; abstract;
    // user overridable
    procedure DoGetDataSet(const ASchemaName, AName: String;
      var ADataSet: TDataSet; var AOwned: Boolean); virtual;
    procedure DoReleaseDataSet(const ASchemaName, AName: String;
      var ADataSet: TDataSet; var AOwned: Boolean); virtual;
    procedure DoOpenDataSet(const ASchemaName, AName: String;
      const ADataSet: TDataSet); virtual;
    procedure DoCloseDataSet(const ASchemaName, AName: String;
      const ADataSet: TDataSet); virtual;
    // other
    procedure Notification(AComponent: TComponent; AOperation: TOperation); override;
    procedure DefineProperties(AFiler: TFiler); override;
    procedure Loaded; override;
    function GetActualActive: Boolean;
    procedure CheckActivate;
    procedure CheckDeactivate;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function FindDataSet(const ASchemaName, AName: String): TFDLocalSQLDataSet;
    procedure RefreshDataSet(const ASchemaName, AName: String);
    property SchemaName: String read FSchemaName write SetSchemaName;
    property DataSets: TFDLocalSQLDataSets read FDataSets write SetDataSets stored False;
    property Connection: TFDCustomConnection read FConnection write SetConnection;
    property Active: Boolean read FActive write SetActive default False;
    property OnGetDataSet: TFDGetDatasetEvent read FOnGetDataSet write FOnGetDataSet;
    property OnReleaseDataSet: TFDGetDatasetEvent read FOnReleaseDataSet write FOnReleaseDataSet;
    property OnOpenDataSet: TFDOpenDatasetEvent read FOnOpenDataSet write FOnOpenDataSet;
    property OnCloseDataSet: TFDOpenDatasetEvent read FOnCloseDataSet write FOnCloseDataSet;
  end;

  TFDAdaptedDataSet = class(TFDDataSet, IFDPhysChangeHandler)
  private
    FAdapter: TFDCustomTableAdapter;
    FDatSManager: TFDDatSManager;
    FUpdateObject: TFDCustomUpdateObject;
    FServerEditRow: TFDDatSRow;
    FServerEditRequest: TFDActionRequest;
    FOnExecuteError: TFDExecuteErrorEvent;
    FOnError: TFDErrorEvent;
    FUnpreparing: Boolean;
    FForcePropertyChange: Boolean;
    FLocalSQL: TFDCustomLocalSQL;
    FChangeAlerter: TFDCustomEventAlerter;
    FChangeAlertName: String;
    FContentModified: Boolean;
    FTxSupported: Integer;
    procedure SetUpdateObject(const AValue: TFDCustomUpdateObject);
    procedure InternalServerEdit(AServerEditRequest: TFDUpdateRequest);
    function GetConnection(ACheck: Boolean): TFDCustomConnection;
    function GetPointedConnection: TFDCustomConnection;
    procedure InternalUpdateErrorHandler(ASender: TObject;
      const AInitiator: IFDStanObject; var AException: Exception);
    procedure InternalReconcileErrorHandler(ASender: TObject; ARow: TFDDatSRow;
      var AAction: TFDDAptReconcileAction);
    function GetCommand: TFDCustomCommand;
    procedure InternalUpdateRecordHandler(ASender: TObject;
      ARow: TFDDatSRow; ARequest: TFDUpdateRequest;
      AOptions: TFDUpdateRowOptions; var AAction: TFDErrorAction);
    procedure SetDatSManager(AManager: TFDDatSManager);
    procedure SetLocalSQL(const AValue: TFDCustomLocalSQL);
    procedure SetChangeAlerter(const AValue: TFDCustomEventAlerter);
    function InternalPSExecuteStatement(const ASQL: string; AParams: TParams;
      AMode: Integer; var AResultSet: TFDQuery): Integer;
    procedure SetChangeAlertName(const AValue: String);
  protected
    FVclParams: TParams;
    procedure SetAdapter(AAdapter: TFDCustomTableAdapter);
    // TComponent
    procedure Notification(AComponent: TComponent; AOperation: TOperation); override;
    // TDataSet
    procedure InternalClose; override;
    // TFDDataSet
    procedure CheckOnline(APrepare: Boolean = True); override;
    procedure ReleaseBase(AOffline: Boolean); override;
    procedure DoDefineDatSManager; override;
    procedure DoOpenSource(ABlocked, AInfoQuery, AStructQuery: Boolean); override;
    function DoIsSourceOpen: Boolean; override;
    function DoIsSourceAsync: Boolean; override;
    function DoIsSourceOnline: Boolean; override;
    procedure DoPrepareSource; override;
    procedure DoUnprepareSource; override;
    function DoApplyUpdates(ATable: TFDDatSTable; AMaxErrors: Integer): Integer; override;
    function DoFetch(ATable: TFDDatSTable; AAll: Boolean;
      ADirection: TFDFetchDirection = fdDown): Integer; overload; override;
    function DoFetch(ARow: TFDDatSRow; AColumn: Integer;
      ARowOptions: TFDPhysFillRowOptions): Boolean; overload; override;
    procedure DoClearBeforeRefetch; override;
    procedure DoMasterDefined; override;
    procedure DoMasterParamSetValues(AMasterFieldList: TFDFieldList); override;
    function DoMasterParamDependent(AMasterFieldList: TFDFieldList): Boolean; override;
    procedure DoCloseSource; override;
    procedure DoResetDatSManager; override;
    function DoGetDatSManager: TFDDatSManager; override;
    function DoGetTableName: String; override;
    procedure DoProcessUpdateRequest(ARequest: TFDUpdateRequest;
      AOptions: TFDUpdateRowOptions); override;
    procedure DoExecuteSource(ATimes, AOffset: Integer); override;
    procedure DoCloneCursor(AReset, AKeepSettings: Boolean); override;
    function GetParams: TFDParams; override;
    function DoStoredActivation: Boolean; override;
    property UpdateObject: TFDCustomUpdateObject read FUpdateObject
      write SetUpdateObject;
    // IFDStanOptions
    function GetOptionsIntf: IFDStanOptions; override;
    procedure SetOptionsIntf(const AValue: IFDStanOptions); override;
    // IFDPhysLocalSQLAdapter
    function GetConn: NativeUInt; override;
    function GetFeatures: TFDPhysLocalSQLAdapterFeatures; override;
    // IProviderSupport
{$WARN SYMBOL_DEPRECATED OFF}
    function PSInTransaction: Boolean; override;
    procedure PSStartTransaction; override;
    procedure PSEndTransaction(Commit: Boolean); override;
    function PSIsSQLBased: Boolean; override;
    function PSIsSQLSupported: Boolean; override;
    function PSGetQuoteChar: string; override;
    function PSGetParams: TParams; override;
    procedure PSSetParams(AParams: TParams); override;
    function PSGetCommandText: string; override;
    function PSGetCommandType: TPSCommandType; override;
    procedure PSSetCommandText(const CommandText: string); override;
    function PSExecuteStatement(const ASQL: string; AParams: TParams;
      AResultSet: Pointer = nil): Integer; overload; {$IFNDEF NEXTGEN} override; {$ENDIF}
    function PSExecuteStatement(const ASQL: string; AParams: TParams;
      var AResultSet: TDataSet): Integer; overload; override;
    function PSExecuteStatement(const ASQL: string;
      AParams: TParams): Integer; overload; override;
    procedure PSGetAttributes(AList: TPacketAttributeList); override;
{$WARN SYMBOL_DEPRECATED ON}
    // IFDPhysChangeHandler
    function GetTrackCommand: IFDPhysCommand;
    function GetTrackEventName: String;
    function GetMergeTable: TFDDatSTable;
    function GetMergeManager: TFDDatSManager;
    function GetContentModified: Boolean;
    procedure SetContentModified(AValue: Boolean);
    procedure RefreshContent;
    procedure ResyncContent;
    // IDataSetCommandSupport
    function GetCommandStates(const ACommand: String): TDataSetCommandStates; override;
    procedure ExecuteCommand(const ACommand: String; const AArgs: array of const); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AttachTable(ATable: TFDDatSTable; AView: TFDDatSView); override;
    procedure NextRecordSet;
    procedure GetResults;
    procedure CloseStreams;
    procedure AbortJob(AWait: Boolean = False);
    procedure Disconnect(AAbortJob: Boolean = False); override;
    procedure ServerAppend;
    procedure ServerEdit;
    procedure ServerDelete;
    procedure ServerPerform;
    procedure ServerCancel;
    procedure ServerDeleteAll(ANoUndo: Boolean = False); virtual;
    procedure ServerSetKey;
    function ServerGotoKey: Boolean;
    property Adapter: TFDCustomTableAdapter read FAdapter;
    property DatSManager write SetDatSManager;
    property Command: TFDCustomCommand read GetCommand;
    property PointedConnection: TFDCustomConnection read GetPointedConnection;
    property ServerEditRequest: TFDActionRequest read FServerEditRequest;
    property LocalSQL: TFDCustomLocalSQL read FLocalSQL write SetLocalSQL;
    /// <summary> Associates dataset (change handler) with specified change alerter.
    /// The dataset will be refreshed automatically on receiving change notification
    /// by specified change alerter. A change notification name must match to
    /// ChangeAlertName value. </summary>
    property ChangeAlerter: TFDCustomEventAlerter read FChangeAlerter write SetChangeAlerter;
    /// <summary> Specifies optional change notification name. By default it is
    ///  equal to a SQL query base table name. </summary>
    property ChangeAlertName: String read FChangeAlertName write SetChangeAlertName;
    property OnExecuteError: TFDExecuteErrorEvent read FOnExecuteError
      write FOnExecuteError;
    property OnError: TFDErrorEvent read FOnError write FOnError;
    { TFDDataSet }
    property FetchOptions;
    property FormatOptions;
    property ResourceOptions;
    property UpdateOptions;
  end;

  TFDCustomMemTable = class(TFDAdaptedDataSet)
  private
    FOptionsIntf: IFDStanOptions;
    procedure ReadAutoCommitUpdates(AReader: TReader);
    function GetDisableStringTrim: Boolean;
    function GetFetchOnDemand: Boolean;
    function GetIsClone: Boolean;
    function GetLogChanges: Boolean;
    function GetProviderEOF: Boolean;
    function GetReadOnly: Boolean;
    function GetStatusFilter: TFDUpdateRecordTypes;
    function GetXMLData: string;
    procedure SetDisableStringTrim(const AValue: Boolean);
    procedure SetFetchOnDemand(const AValue: Boolean);
    procedure SetLogChanges(const AValue: Boolean);
    procedure SetProviderEOF(const AValue: Boolean);
    procedure SetReadOnly(const AValue: Boolean);
    procedure SetStatusFilter(const AValue: TFDUpdateRecordTypes);
    procedure SetXMLData(const AValue: string);
    function GetCommandText: String;
    procedure SetCommandText(const AValue: String);
    function GetFileName: string;
    function GetPacketRecords: Integer;
    procedure SetFileName(const AValue: string);
    procedure SetPacketRecords(const AValue: Integer);
    function GetOptionalParamTab: TFDDatSTable;
  protected
    FStoreDefs: Boolean;
    procedure DefineProperties(AFiler: TFiler); override;
    // TFDDataSet
    procedure DefChanged(ASender: TObject); override;
    function GetExists: Boolean; override;
    function SaveToDFM(const AAncestor: TFDDataSet): Boolean; override;
    property StoreDefs: Boolean read FStoreDefs write FStoreDefs default False;
    // IFDStanOptions
    function GetOptionsIntf: IFDStanOptions; override;
    procedure GetParentOptions(var AOpts: IFDStanOptions);
 public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Adapter write SetAdapter;
    // TClientDataSet compatibility
    procedure AppendData(const AData: IFDDataSetReference; AHitEOF: Boolean = True);
    function ConstraintsDisabled: Boolean;
    procedure MergeChangeLog;
    function GetOptionalParam(const AParamName: string): Variant;
    procedure SetOptionalParam(const AParamName: string; const AValue: Variant;
      AIncludeInDelta: Boolean = False); virtual;
    // Using Get/Set here prevents from Code Completion bug, when it does not
    // check parent class for a field existence and adds the field to this class.
    property IsClone: Boolean read GetIsClone;
    property CommandText: String read GetCommandText write SetCommandText;
    property DisableStringTrim: Boolean read GetDisableStringTrim write SetDisableStringTrim;
    property FetchOnDemand: Boolean read GetFetchOnDemand write SetFetchOnDemand;
    property FileName: string read GetFileName write SetFileName;
    property LogChanges: Boolean read GetLogChanges write SetLogChanges;
    property PacketRecords: Integer read GetPacketRecords write SetPacketRecords;
    property ProviderEOF: Boolean read GetProviderEOF write SetProviderEOF;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly;
    property StatusFilter: TFDUpdateRecordTypes read GetStatusFilter write SetStatusFilter;
    property XMLData: string read GetXMLData write SetXMLData;
  end;

  [ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidOSX32 or
    pidiOSSimulator or pidiOSDevice32 or pidiOSDevice64 or pidAndroid or
    pidLinux64)]
  TFDMemTable = class(TFDCustomMemTable)
  published
    property ActiveStoredUsage;
    { TDataSet }
    property Active;
    property AutoCalcFields;
    property BeforeOpen;
    property AfterOpen;
    property BeforeClose;
    property AfterClose;
    property BeforeInsert;
    property AfterInsert;
    property BeforeEdit;
    property AfterEdit;
    property BeforePost;
    property AfterPost;
    property BeforeCancel;
    property AfterCancel;
    property BeforeDelete;
    property AfterDelete;
    property BeforeScroll;
    property AfterScroll;
    property BeforeRefresh;
    property AfterRefresh;
    property OnCalcFields;
    property OnDeleteError;
    property OnEditError;
    property OnNewRecord;
    property OnPostError;
    property FieldOptions;
    property Filtered;
    property FilterOptions;
    property Filter;
    property OnFilterRecord;
    property ObjectView default True;
    property Constraints;
    property DataSetField;
    property FieldDefs stored FStoreDefs;
    { TFDDataSet }
    property CachedUpdates;
    property FilterChanges;
    property IndexDefs stored FStoreDefs;
    property Indexes;
    property IndexesActive;
    property IndexName;
    property IndexFieldNames;
    property Aggregates;
    property AggregatesActive;
    property ConstraintsEnabled;
    property MasterSource;
    property MasterFields;
    property DetailFields;
    property OnUpdateRecord;
    property OnUpdateError;
    property OnReconcileError;
    property BeforeApplyUpdates;
    property AfterApplyUpdates;
    property BeforeGetRecords;
    property AfterGetRecords;
    property AfterGetRecord;
    property BeforeRowRequest;
    property AfterRowRequest;
    property BeforeExecute;
    property AfterExecute;
    property FetchOptions;
    property FormatOptions;
    property ResourceOptions;
    property UpdateOptions;
    { TFDAdaptedDataSet }
    property LocalSQL;
    property ChangeAlerter;
    property ChangeAlertName;
    { TFDCustomMemTable }
    property Adapter;
    property StoreDefs;
  end;

  TFDRdbmsDataSet = class(TFDAdaptedDataSet)
  private
    FStreamedPrepared: Boolean;
    function GetConnection: TFDCustomConnection;
    function GetConnectionName: String;
    procedure SetConnection(const AValue: TFDCustomConnection);
    procedure SetConnectionName(const AValue: String);
    function GetPrepared: Boolean;
    procedure SetPrepared(const AValue: Boolean);
    function IsCNNS: Boolean;
    function IsCNS: Boolean;
    function GetOnError: TFDErrorEvent;
    procedure SetOnError(const AValue: TFDErrorEvent);
    function GetParamBindMode: TFDParamBindMode;
    procedure SetParamBindMode(const AValue: TFDParamBindMode);
    function GetOnCommandChanged: TNotifyEvent;
    procedure SetOnCommandChanged(const AValue: TNotifyEvent);
    function GetMacrosCount: Integer;
    function GetMacros: TFDMacros;
    procedure SetMacros(const AValue: TFDMacros);
    function IsPS: Boolean;
    function GetRowsAffected: TFDCounter;
    function GetTransaction: TFDCustomTransaction;
    function GetUpdateTransaction: TFDCustomTransaction;
    function GetSchemaAdapter: TFDCustomSchemaAdapter;
    procedure SetSchemaAdapter(const AValue: TFDCustomSchemaAdapter);
  protected
    procedure Loaded; override;
    procedure DefineProperties(AFiler: TFiler); override;
    // TDataSet
    procedure InternalClose; override;
    procedure OpenCursor(InfoQuery: Boolean); override;
    procedure CheckCachedUpdatesMode; override;
    procedure ReleaseBase(AOffline: Boolean); override;
    // introduced
    function InternalCreateAdapter: TFDCustomTableAdapter; virtual;
    procedure SetTransaction(const AValue: TFDCustomTransaction); virtual;
    procedure SetUpdateTransaction(const AValue: TFDCustomTransaction); virtual;
    // props
    property ParamBindMode: TFDParamBindMode read GetParamBindMode write SetParamBindMode default pbByName;
    property Macros: TFDMacros read GetMacros write SetMacros stored False;
    property MacroCount: Integer read GetMacrosCount;
    property RowsAffected: TFDCounter read GetRowsAffected;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Disconnect(AAbortJob: Boolean = False); override;
    procedure Prepare;
    procedure Unprepare;
    procedure Open(const ASQL: String); overload;
    procedure Open(const ASQL: String; const AParams: array of Variant); overload;
    procedure Open(const ASQL: String; const AParams: array of Variant;
      const ATypes: array of TFieldType); overload;
    function MacroByName(const AValue: string): TFDMacro;
    function FindMacro(const AValue: string): TFDMacro;
    property ConnectionName: String read GetConnectionName write SetConnectionName stored IsCNNS;
    property Connection: TFDCustomConnection read GetConnection write SetConnection stored IsCNS;
    property Prepared: Boolean read GetPrepared write SetPrepared stored IsPS default False;
    property Transaction: TFDCustomTransaction read GetTransaction write SetTransaction;
    property UpdateTransaction: TFDCustomTransaction read GetUpdateTransaction write SetUpdateTransaction;
    property SchemaAdapter: TFDCustomSchemaAdapter read GetSchemaAdapter write SetSchemaAdapter;
    property OnError: TFDErrorEvent read GetOnError write SetOnError;
    property OnCommandChanged: TNotifyEvent read GetOnCommandChanged write SetOnCommandChanged;
    { TFDDataSet }
    property Params;
  end;

  [ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidOSX32 or
    pidiOSSimulator or pidiOSDevice32 or pidiOSDevice64 or pidAndroid or
    pidLinux64)]
  TFDUpdateSQL = class(TFDCustomUpdateObject)
  private
    FCommands: array [0 .. 5] of TFDCustomCommand;
    FConnectionName: String;
    FConnection: TFDCustomConnection;
    function GetSQL(const AIndex: Integer): TStrings;
    procedure SetSQL(const AIndex: Integer; const AValue: TStrings);
    function GetCommand(ARequest: TFDUpdateRequest): TFDCustomCommand;
    function GetURSQL(ARequest: TFDUpdateRequest): TStrings;
    procedure SetURSQL(ARequest: TFDUpdateRequest; const Value: TStrings);
    procedure SetConnection(const Value: TFDCustomConnection);
    procedure SetConnectionName(const Value: String);
    procedure UpdateAdapter;
  protected
    procedure Notification(AComponent: TComponent; AOperation: TOperation); override;
    procedure AttachToAdapter; override;
    procedure DetachFromAdapter; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Apply(ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
      AOptions: TFDUpdateRowOptions); override;
    property Commands[ARequest: TFDUpdateRequest]: TFDCustomCommand read GetCommand;
    property SQL[ARequest: TFDUpdateRequest]: TStrings read GetURSQL write SetURSQL;
  published
    property Connection: TFDCustomConnection read FConnection write SetConnection;
    property ConnectionName: String read FConnectionName write SetConnectionName;
    property InsertSQL: TStrings index 0 read GetSQL write SetSQL;
    property ModifySQL: TStrings index 1 read GetSQL write SetSQL;
    property DeleteSQL: TStrings index 2 read GetSQL write SetSQL;
    property LockSQL: TStrings index 3 read GetSQL write SetSQL;
    property UnlockSQL: TStrings index 4 read GetSQL write SetSQL;
    property FetchRowSQL: TStrings index 5 read GetSQL write SetSQL;
  end;

  TFDCustomQuery = class(TFDRdbmsDataSet)
  private
    procedure SetSQL(const AValue: TStrings);
    function GetSQL: TStrings;
    function GetText: String;
    function GetDS: TDataSource;
    procedure SetDS(const AValue: TDataSource);
    procedure ReadDataSource(AReader: TReader);
    procedure ReadCommandText(AReader: TReader);
  protected
    procedure UpdateRecordCount; override;
    procedure DefineProperties(AFiler: TFiler); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ExecSQL; overload;
    procedure ExecOrOpen;
    function ExecSQL(AExecDirect: Boolean): LongInt; overload;
    function ExecSQL(const ASQL: String): LongInt; overload;
    function ExecSQL(const ASQL: String; const AParams: array of Variant): LongInt; overload;
    function ExecSQL(const ASQL: String; const AParams: array of Variant;
      const ATypes: array of TFieldType): LongInt; overload;
    property SQL: TStrings read GetSQL write SetSQL;
    property Text: String read GetText;
    property ParamCount;
    property DataSource: TDataSource read GetDS write SetDS;
  end;

  [ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidOSX32 or
    pidiOSSimulator or pidiOSDevice32 or pidiOSDevice64 or pidAndroid or
    pidLinux64)]
  TFDQuery = class(TFDCustomQuery)
  public
    property RowsAffected;
    property MacroCount;
  published
    property ActiveStoredUsage;
    { TDataSet }
    property Active;
    property AutoCalcFields;
    property BeforeOpen;
    property AfterOpen;
    property BeforeClose;
    property AfterClose;
    property BeforeInsert;
    property AfterInsert;
    property BeforeEdit;
    property AfterEdit;
    property BeforePost;
    property AfterPost;
    property BeforeCancel;
    property AfterCancel;
    property BeforeDelete;
    property AfterDelete;
    property BeforeScroll;
    property AfterScroll;
    property BeforeRefresh;
    property AfterRefresh;
    property OnCalcFields;
    property OnDeleteError;
    property OnEditError;
    property OnNewRecord;
    property OnPostError;
    property FieldOptions;
    property Filtered;
    property FilterOptions;
    property Filter;
    property OnFilterRecord;
    property ObjectView default True;
    property Constraints;
    { TFDDataSet }
    property CachedUpdates;
    property FilterChanges;
    property Indexes;
    property IndexesActive;
    property IndexName;
    property IndexFieldNames;
    property Aggregates;
    property AggregatesActive;
    property ConstraintsEnabled;
    property MasterSource;
    property MasterFields;
    property DetailFields;
    property OnUpdateRecord;
    property OnUpdateError;
    property OnReconcileError;
    property BeforeExecute;
    property AfterExecute;
    property BeforeApplyUpdates;
    property AfterApplyUpdates;
    property BeforeGetRecords;
    property AfterGetRecords;
    property AfterGetRecord;
    property BeforeRowRequest;
    property AfterRowRequest;
    property OnMasterSetValues;
    { TFDAdaptedDataSet }
    property LocalSQL;
    property ChangeAlerter;
    property ChangeAlertName;
    { TFDRdbmsDataSet }
    property ConnectionName;
    property Connection;
    property Transaction;
    property UpdateTransaction;
    property SchemaAdapter;
    property Params;
    property FetchOptions;
    property FormatOptions;
    property ResourceOptions;
    property UpdateOptions;
    property UpdateObject;
    property OnError;
    property OnExecuteError;
    property OnCommandChanged;
    { TFDCustomQuery }
    property SQL;
    property Macros;
  end;

  [ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidOSX32 or
    pidiOSSimulator or pidiOSDevice32 or pidiOSDevice64 or pidAndroid or
    pidLinux64)]
  TFDTable = class(TFDCustomQuery)
  private
    FWindowSize: Integer;
    FServerCursor: Boolean;
    FTableName: String;
    FExclusive: Boolean;
    FCatalogName: String;
    FSchemaName: String;
    FTableParams: TFDPhysTableParams;
    FWindowOperation: Boolean;
    FPrimaryKeyFields: String;
    FResetIndexFieldNames: Boolean;
    FIndexFieldChanged: Boolean;
    procedure MoveData(ATableSrc, ATableDst: TFDDatSTable);
    procedure TableChanged;
    procedure SetTableName(const AValue: String);
    procedure SetCatalogName(const AValue: String);
    procedure SetSchemaName(const AValue: String);
    function GetBookmarkColSize(ACol: TFDDatSColumn): LongWord;
    function Bookmark2Fields(const ABookmark: TBookmark; var ADataPtr: Pointer): String;
    function Bookmark2Key(const ABookmark: TBookmark; APKOnly: Boolean = False): Variant;
    function InternalBookmarkValid(ABookmark: Pointer): Boolean;
    procedure ParseIndexFields(out AOrderFields, ADescFields, ANoCaseFields, AExpression: String);
    function GetActualIndexFields: String;
    function AllIndexFieldNull(const ARowIndex: Integer = 0): Boolean;
    procedure ClearTableButCurrent;
    procedure UpdateLocalIndexName;
    procedure SetupTable;
    function GetWindowedRows: TFDDatSRowListBase;
  protected
    FAdjustIndexes: Boolean;
    // TFDDataSet
    function InternalCreateAdapter: TFDCustomTableAdapter; override;
    procedure DoCachedUpdatesChanged; override;
    function DoIsSourceOpen: Boolean; override;
    procedure OpenCursor(AInfoQuery: Boolean); override;
    procedure ReleaseBase(AOffline: Boolean); override;
    function CalcBookmarkSize: LongWord; override;
    procedure GetBookmarkData(Buffer: TRecBuf; Data: TBookmark); override;
    procedure InternalGotoBookmark(ABookmark: Pointer); overload; {$IFNDEF NEXTGEN} override; {$ENDIF}
    procedure InternalGotoBookmark(Bookmark: TBookmark); overload; override;
    function DoAdjustSortFields(const AFields, AExpression: String; var AIndexOptions: TFDSortOptions): String; override;
    procedure DoSortOrderChanging; override;
    procedure DoSortOrderChanged; override;
    procedure UpdateIndexDefs; override;
    procedure DoFilteringUpdated(AResync: Boolean); override;
    function DoPurge(AView: TFDDatSView; ADirection: TFDFetchDirection = fdDown): Integer; override;
    function DoFetch(ATable: TFDDatSTable; AAll: Boolean; ADirection: TFDFetchDirection = fdDown): Integer; override;
    procedure InternalFirst; override;
    procedure InternalLast; override;
    function InternalDefaultKeyFieldCount(ABuffer: PFDKeyBuffer; ADefault: Integer): Integer; override;
    function InternalGotoKey(ANearest: Boolean): Boolean; override;
    function GetCanRefresh: Boolean; override;
    procedure InternalRefresh; override;
    procedure InternalDelete; override;
    procedure SetFieldData(AField: TField; ABuffer: TValueBuffer); override;
    procedure InternalAddRecord(Buffer: TRecBuf;
      Append: Boolean); override;
    procedure InternalPost; override;
    procedure InternalCancel; override;
    procedure InternalResetRange; override;
    function GetRecNo: Integer; override;
    procedure InternalSetRecNo(AValue: Integer); override;
    procedure SetRecNo(AValue: Integer); override;
    function GetRecordCount: Integer; override;
    procedure DoMasterDefined; override;
    procedure DoMasterReset; override;
    procedure MasterChanged(Sender: TObject); override;
    procedure CheckMasterRange; override;
    function GetExists: Boolean; override;
    procedure SaveToStorage(const AFileName: String; AStream: TStream;
      AFormat: TFDStorageFormat); override;
    // TFDTable
    function UpdateCursorKind: Boolean;
    function GetCustomWhere: String; virtual;
    procedure FetchWindow(out AFetched: Integer; APrepOnly: Boolean = False;
      AForceClear: Boolean = False; ATable: TFDDatsTable = nil);
    function InternalSearch(ATable: TFDDatSTable; const AKeyFields: String; const AKeyValues: Variant;
      const AExpression: String = ''; const AResultFields: String = '';
      AOptions: TFDDataSetLocateOptions = []): Boolean;
    function InternalLocateEx(const AKeyFields: String; const AKeyValues: Variant;
      const AExpression: String = ''; AOptions: TFDDataSetLocateOptions = [];
       ApRecordIndex: PInteger = nil): Boolean;
    function InternalLookupEx(const AKeyFields: String; const AKeyValues: Variant;
      const AExpression: String; const AResultFields: String; AOptions: TFDDataSetLocateOptions = [];
      ApRecordIndex: PInteger = nil): Variant;
    // IProviderSupport
    function PSGetTableName: string; override;
    function PSGetCommandText: string; override;
    function PSGetCommandType: TPSCommandType; override;
    procedure PSSetCommandText(const ACommandText: string); override;
  public
    constructor Create(AOwner: TComponent); override;
    function IsSequenced: Boolean; override;
    procedure Open(const ATableName: String); overload;
    procedure Disconnect(AAbortJob: Boolean = False); override;
    function BookmarkValid(ABookmark: TBookmark): Boolean; override;
    function CompareBookmarks(Bookmark1: TBookmark; Bookmark2: TBookmark): Integer; override;
    function GenerateSQL: String;
    procedure RefireSQL;
    function LookupEx(const AExpression: String; const AResultFields: String;
      AOptions: TFDDataSetLocateOptions = []; ApRecordIndex: PInteger = nil): Variant; override;
    function LookupEx(const AKeyFields: String; const AKeyValues: Variant;
      const AResultFields: String; AOptions: TFDDataSetLocateOptions = [];
      ApRecordIndex: PInteger = nil): Variant; override;
    function LocateEx(const AExpression: String; AOptions: TFDDataSetLocateOptions = [];
      ApRecordIndex: PInteger = nil): Boolean; override;
    function LocateEx(const AKeyFields: String; const AKeyValues: Variant;
      AOptions: TFDDataSetLocateOptions = []; ApRecordIndex: PInteger = nil): Boolean; override;
    procedure RefreshMetadata;
    procedure CreateTable(ARecreate: Boolean = True;
      AParts: TFDPhysCreateTableParts = [tpTable .. tpIndexes]);
    procedure CreateDataSet; override;
    property ActualIndexFieldNames: String read GetActualIndexFields;
  published
    property ActiveStoredUsage;
    { TDataSet }
    property Active;
    property AutoCalcFields;
    property BeforeOpen;
    property AfterOpen;
    property BeforeClose;
    property AfterClose;
    property BeforeInsert;
    property AfterInsert;
    property BeforeEdit;
    property AfterEdit;
    property BeforePost;
    property AfterPost;
    property BeforeCancel;
    property AfterCancel;
    property BeforeDelete;
    property AfterDelete;
    property BeforeScroll;
    property AfterScroll;
    property BeforeRefresh;
    property AfterRefresh;
    property OnCalcFields;
    property OnDeleteError;
    property OnEditError;
    property OnNewRecord;
    property OnPostError;
    property FieldOptions;
    property Filtered;
    property FilterOptions;
    property Filter;
    property OnFilterRecord;
    property ObjectView default True;
    property Constraints;
    { TFDDataSet }
    property CachedUpdates;
    property FilterChanges;
    property IndexName;
    property IndexFieldNames;
    property Aggregates;
    property AggregatesActive;
    property ConstraintsEnabled;
    property MasterSource;
    property MasterFields;
    property DetailFields;
    property OnUpdateRecord;
    property OnUpdateError;
    property OnReconcileError;
    property BeforeApplyUpdates;
    property AfterApplyUpdates;
    property BeforeGetRecords;
    property AfterGetRecords;
    property AfterGetRecord;
    property BeforeRowRequest;
    property AfterRowRequest;
    { TFDAdaptedDataSet }
    property LocalSQL;
    property ChangeAlerter;
    property ChangeAlertName;
    { TFDRdbmsDataSet }
    property ConnectionName;
    property Connection;
    property Transaction;
    property UpdateTransaction;
    property SchemaAdapter;
    property FetchOptions;
    property FormatOptions;
    property ResourceOptions;
    property UpdateOptions;
    property UpdateObject;
    property OnError;
    property OnExecuteError;
    property OnCommandChanged;
    { TFDTable }
    property Exclusive: Boolean read FExclusive write FExclusive default False;
    property CatalogName: String read FCatalogName write SetCatalogName;
    property SchemaName: String read FSchemaName write SetSchemaName;
    property TableName: String read FTableName write SetTableName;
  end;

  TFDCustomStoredProc = class(TFDRdbmsDataSet)
  private
    procedure SetOverload(const AValue: Word);
    procedure SetProcName(const AValue: string);
    function GetOverload: Word;
    function GetProcName: string;
    function GetPackageName: String;
    function GetSchemaName: String;
    procedure SetPackageName(const AValue: String);
    procedure SetSchemaName(const AValue: String);
    procedure ProcNameChanged;
    function GetCatalogName: String;
    procedure SetCatalogName(const AValue: String);
    procedure ExecProcBase(const AProcName: String; AFunction: Boolean;
      const AParams: array of Variant; const ATypes: array of TFieldType);
  protected
    function InternalCreateAdapter: TFDCustomTableAdapter; override;
  public
    function DescriptionsAvailable: Boolean;
    procedure ExecProc; overload;
    function ExecProc(const AProcName: String): LongInt; overload;
    function ExecProc(const AProcName: String; const AParams: array of Variant): LongInt; overload;
    function ExecProc(const AProcName: String; const AParams: array of Variant;
      const ATypes: array of TFieldType): LongInt; overload;
    function ExecFunc: Variant; overload;
    function ExecFunc(const AProcName: String): Variant; overload;
    function ExecFunc(const AProcName: String; const AParams: array of Variant): Variant; overload;
    function ExecFunc(const AProcName: String; const AParams: array of Variant;
      const ATypes: array of TFieldType): Variant; overload;
    property CatalogName: String read GetCatalogName write SetCatalogName;
    property SchemaName: String read GetSchemaName write SetSchemaName;
    property PackageName: String read GetPackageName write SetPackageName;
    property StoredProcName: string read GetProcName write SetProcName;
    property Overload: Word read GetOverload write SetOverload default 0;
    property ParamCount;
    property RowsAffected;
  end;

  [ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidOSX32 or
    pidiOSSimulator or pidiOSDevice32 or pidiOSDevice64 or pidAndroid or
    pidLinux64)]
  TFDStoredProc = class(TFDCustomStoredProc)
  published
    property ActiveStoredUsage;
    { TDataSet }
    property Active;
    property AutoCalcFields;
    property BeforeOpen;
    property AfterOpen;
    property BeforeClose;
    property AfterClose;
    property BeforeInsert;
    property AfterInsert;
    property BeforeEdit;
    property AfterEdit;
    property BeforePost;
    property AfterPost;
    property BeforeCancel;
    property AfterCancel;
    property BeforeDelete;
    property AfterDelete;
    property BeforeScroll;
    property AfterScroll;
    property BeforeRefresh;
    property AfterRefresh;
    property OnCalcFields;
    property OnDeleteError;
    property OnEditError;
    property OnNewRecord;
    property OnPostError;
    property FieldOptions;
    property Filtered;
    property FilterOptions;
    property Filter;
    property OnFilterRecord;
    property ObjectView default True;
    property Constraints;
    { TFDDataSet }
    property CachedUpdates;
    property FilterChanges;
    property Indexes;
    property IndexesActive;
    property IndexName;
    property IndexFieldNames;
    property Aggregates;
    property AggregatesActive;
    property ConstraintsEnabled;
    property MasterSource;
    property MasterFields;
    property DetailFields;
    property OnUpdateRecord;
    property OnUpdateError;
    property OnReconcileError;
    property BeforeExecute;
    property AfterExecute;
    property BeforeApplyUpdates;
    property AfterApplyUpdates;
    property BeforeGetRecords;
    property AfterGetRecords;
    property AfterGetRecord;
    property BeforeRowRequest;
    property AfterRowRequest;
    { TFDAdaptedDataSet }
    property LocalSQL;
    property ChangeAlerter;
    property ChangeAlertName;
    { TFDRdbmsDataSet }
    property ConnectionName;
    property Connection;
    property Transaction;
    property UpdateTransaction;
    property SchemaAdapter;
    property Params;
    property FetchOptions;
    property FormatOptions;
    property ResourceOptions;
    property UpdateOptions;
    property UpdateObject;
    property OnError;
    property OnExecuteError;
    property OnCommandChanged;
    property ParamBindMode;
    { TFDCustomStoredProc }
    property CatalogName;
    property SchemaName;
    property PackageName;
    property StoredProcName;
    property Overload;
  end;

  [ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidOSX32 or
    pidiOSSimulator or pidiOSDevice32 or pidiOSDevice64 or pidAndroid or
    pidLinux64)]
  TFDMetaInfoQuery = class(TFDRdbmsDataSet)
  private
    function GetMetaInfoKind: TFDPhysMetaInfoKind;
    function GetObjectName: String;
    function GetTableKinds: TFDPhysTableKinds;
    function GetWildcard: String;
    procedure SetMetaInfoKind(const AValue: TFDPhysMetaInfoKind);
    procedure SetObjectName(const AValue: String);
    procedure SetTableKinds(const AValue: TFDPhysTableKinds);
    procedure SetWildcard(const AValue: String);
    function GetOverload: Word;
    procedure SetOverload(const AValue: Word);
    procedure SetObjectScopes(const AValue: TFDPhysObjectScopes);
    function GetObjectScopes: TFDPhysObjectScopes;
    function GetBaseObjectName: String;
    function GetSchemaName: String;
    procedure SetBaseObjectName(const AValue: String);
    procedure SetSchemaName(const AValue: String);
    function GetCatalogName: String;
    procedure SetCatalogName(const AValue: String);
  protected
    function InternalCreateAdapter: TFDCustomTableAdapter; override;
  published
    property ActiveStoredUsage;
    { TDataSet }
    property Active;
    property AutoCalcFields;
    property BeforeOpen;
    property AfterOpen;
    property BeforeClose;
    property AfterClose;
    property BeforeScroll;
    property AfterScroll;
    property BeforeRefresh;
    property AfterRefresh;
    property OnCalcFields;
    property FieldOptions;
    property Filtered;
    property FilterOptions;
    property Filter;
    property OnFilterRecord;
    { TFDDataSet }
    property Indexes;
    property IndexesActive;
    property IndexName;
    property IndexFieldNames;
    property Aggregates;
    property AggregatesActive;
    property BeforeGetRecords;
    property AfterGetRecords;
    property AfterGetRecord;
    property BeforeRowRequest;
    property AfterRowRequest;
    { TFDAdaptedDataSet }
    property LocalSQL;
    { TFDRdbmsDataSet }
    property ConnectionName;
    property Connection;
    property Transaction;
    property UpdateTransaction;
    property SchemaAdapter;
    property FetchOptions;
    property FormatOptions;
    property ResourceOptions;
    property OnError;
    property OnCommandChanged;
    { Introduced }
    property MetaInfoKind: TFDPhysMetaInfoKind read GetMetaInfoKind
      write SetMetaInfoKind default mkTables;
    property TableKinds: TFDPhysTableKinds read GetTableKinds
      write SetTableKinds default [tkSynonym, tkTable, tkView];
    property Wildcard: String read GetWildcard write SetWildcard;
    property ObjectScopes: TFDPhysObjectScopes read GetObjectScopes
      write SetObjectScopes default [osMy];
    property CatalogName: String read GetCatalogName write SetCatalogName;
    property SchemaName: String read GetSchemaName write SetSchemaName;
    property BaseObjectName: String read GetBaseObjectName write SetBaseObjectName;
    property Overload: Word read GetOverload write SetOverload default 0;
    property ObjectName: String read GetObjectName write SetObjectName;
  end;

function FDManager: TFDCustomManager;
procedure FDSetManagerClass(AClass: TFDCustomManagerClass);
procedure FDSetConnectionClass(AClass: TFDCustomConnectionClass);
function FDFindDefaultConnection(AComp: TComponent): TFDCustomConnection;
function FDIsDesigning(AComp: TComponent): Boolean;

{-------------------------------------------------------------------------------}
implementation

uses
  System.Variants, Data.FmtBcd, Data.SqlTimSt, System.Types, System.TypInfo,
  FireDAC.Stan.Consts, FireDAC.Stan.SQLTimeInt, FireDAC.Stan.Expr,
    FireDAC.Stan.Factory, FireDAC.Stan.ResStrs,
  FireDAC.Phys.SQLPreprocessor;

var
  FManagerSingletonClass: TFDCustomManagerClass = TFDManager;
  FManagerSingleton: TFDCustomManager = nil;
  FManagerOptsIntf: IFDStanOptions = nil;
  FConnectionClass: TFDCustomConnectionClass = TFDConnection;

{$HINTS OFF}
type
  __TReader = class(TReader)
  end;

  __TWriter = class(TFiler)
  private
    FRootAncestor: TComponent;
    FPropPath: string;
  end;
{$HINTS ON}

{-------------------------------------------------------------------------------}
function FDManager: TFDCustomManager;
begin
  if FManagerSingleton = nil then begin
    FManagerSingleton := FManagerSingletonClass.Create(nil);
    FManagerSingleton.FAutoCreated := True;
  end;
  Result := FManagerSingleton;
end;

{-------------------------------------------------------------------------------}
procedure FDSetManagerClass(AClass: TFDCustomManagerClass);
begin
  FManagerSingletonClass := AClass;
end;

{-------------------------------------------------------------------------------}
procedure FDSetConnectionClass(AClass: TFDCustomConnectionClass);
begin
  FConnectionClass := AClass;
end;

{-------------------------------------------------------------------------------}
function FDFindDefaultConnection(AComp: TComponent): TFDCustomConnection;
var
  oRoot: TComponent;
  i: Integer;
begin
  Result := nil;
  oRoot := AComp;
  while (oRoot.Owner <> nil) and (Result = nil) do begin
    oRoot := oRoot.Owner;
    for i := 0 to oRoot.ComponentCount - 1 do
      if oRoot.Components[i] is TFDCustomConnection then begin
        Result := TFDCustomConnection(oRoot.Components[i]);
        Break;
      end;
  end;
end;

{-------------------------------------------------------------------------------}
function FDIsDesigning(AComp: TComponent): Boolean;
begin
  Result :=
    ([csDesigning, csLoading] * AComp.ComponentState = [csDesigning]) and
    ((AComp.Owner = nil) or
     ([csDesigning, csLoading] * AComp.Owner.ComponentState = [csDesigning]));
end;

{-------------------------------------------------------------------------------}
{ TFDCustomManager                                                              }
{-------------------------------------------------------------------------------}
constructor TFDCustomManager.Create(AOwner: TComponent);
var
  oPrevMgr: TFDCustomManager;
  i: Integer;
begin
  if (FManagerSingleton <> nil) and not FManagerSingleton.FAutoCreated and
     ((AOwner = nil) or not (csDesigning in AOwner.ComponentState)) then
    FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_ClntSessMBSingle, []);
  FLock := TMultiReadExclusiveWriteSynchronizer.Create;
  FLock.BeginWrite;
  try
    inherited Create(AOwner);
    SetOptionsIntf(nil);
    FConnections := TFDObjList.Create;
    FActiveStoredUsage := [auDesignTime, auRunTime];
    if (FManagerSingleton = nil) or FManagerSingleton.FAutoCreated then begin
      oPrevMgr := FManagerSingleton;
      FManagerSingleton := Self;
      QueryInterface(IFDStanOptions, FManagerOptsIntf);
      if oPrevMgr <> nil then begin
        FConnections.Clear;
        for i := 0 to oPrevMgr.FConnections.Count - 1 do
          FConnections.Add(oPrevMgr.FConnections[i]);
        oPrevMgr.FConnections.Clear;
        FDFree(oPrevMgr);
      end;
    end;
  finally
    FLock.EndWrite;
  end;
end;

{-------------------------------------------------------------------------------}
destructor TFDCustomManager.Destroy;
begin
  if FLock <> nil then
    FLock.BeginWrite;
  Destroying;
  if FManagerSingleton = Self then begin
    Close;
    FManagerOptsIntf := nil;
    FManagerSingleton := nil;
  end;
  inherited Destroy;
  FDFreeAndNil(FConnections);
  if FOptionsIntf <> nil then begin
    FOptionsIntf.ObjectDestroyed(Self);
    FOptionsIntf := nil;
  end;
  FDFreeAndNil(FLock);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.Loaded;
begin
  inherited Loaded;
  try
    if FStreamedActive and FDCheckStoredUsage(ComponentState, ActiveStoredUsage) then
      SetActive(True);
  except
    if csDesigning in ComponentState then
      FDHandleException
    else
      raise;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.CheckInactive;
begin
  if Active then
    if (csDesigning in ComponentState) or ResourceOptions.AutoConnect then
      Close
    else
      FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_ClntSessMBInactive, []);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.CheckActive;
begin
  if not Active then
    if ResourceOptions.AutoConnect then
      Open
    else
      FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_ClntSessMBActive, []);
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.GetSilentMode: Boolean;
begin
  Result := FFDGUIxSilentMode;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.SetSilentMode(const AValue: Boolean);
begin
  FFDGUIxSilentMode := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.GetWaitCursor: TFDGUIxScreenCursor;
var
  oWait: IFDGUIxWaitCursor;
begin
  FDCreateInterface(IFDGUIxWaitCursor, oWait);
  Result := oWait.WaitCursor;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.SetWaitCursor(const AValue: TFDGUIxScreenCursor);
var
  oWait: IFDGUIxWaitCursor;
begin
  FDCreateInterface(IFDGUIxWaitCursor, oWait);
  oWait.WaitCursor := AValue;
end;

{-------------------------------------------------------------------------------}
// IFDStanObject

function TFDCustomManager.GetName: TComponentName;
begin
  if Name = '' then
    Result := '$' + IntToHex(Integer(Self), 8)
  else
    Result := Name;
  Result := Result + ': ' + ClassName;
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.GetParent: IFDStanObject;
begin
  Result := nil;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.AfterReuse;
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.BeforeReuse;
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.SetOwner(const AOwner: TObject;
  const ARole: TComponentName);
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
// IFDStanOptions

procedure TFDCustomManager.SetOptionsIntf(const AValue: IFDStanOptions);
begin
  if (FOptionsIntf <> AValue) or (FOptionsIntf = nil) and (AValue = nil) then begin
    FOptionsIntf := AValue;
    if FOptionsIntf = nil then begin
      FOptionsIntf := TFDOptionsContainer.Create(Self, TFDFetchOptions,
        TFDUpdateOptions, TFDTopResourceOptions, nil);
      FOptionsIntf.FormatOptions.OwnMapRules := True;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.GetFetchOptions: TFDFetchOptions;
begin
  Result := FOptionsIntf.FetchOptions;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.SetFetchOptions(const AValue: TFDFetchOptions);
begin
  FOptionsIntf.FetchOptions.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.GetFormatOptions: TFDFormatOptions;
begin
  Result := FOptionsIntf.FormatOptions;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.SetFormatOptions(const AValue: TFDFormatOptions);
begin
  FOptionsIntf.FormatOptions.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.GetUpdateOptions: TFDUpdateOptions;
begin
  Result := FOptionsIntf.UpdateOptions;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.SetUpdateOptions(const AValue: TFDUpdateOptions);
begin
  FOptionsIntf.UpdateOptions.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.GetResourceOptions: TFDTopResourceOptions;
begin
  Result := TFDTopResourceOptions(FOptionsIntf.ResourceOptions);
  ASSERT((Result <> nil) and (Result is TFDTopResourceOptions));
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.SetResourceOptions(const AValue: TFDTopResourceOptions);
begin
  FOptionsIntf.ResourceOptions.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
// Phys Manager control

function TFDCustomManager.GetActive: Boolean;
var
  oMgr: IFDPhysManager;
begin
  FDCreateInterface(IFDPhysManager, oMgr, False);
  Result := (oMgr <> nil) and (oMgr.State = dmsActive);
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.GetState: TFDPhysManagerState;
var
  oMgr: IFDPhysManager;
begin
  FDCreateInterface(IFDPhysManager, oMgr, False);
  if oMgr <> nil then
    Result := oMgr.State
  else
    Result := dmsInactive;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.SetActive(const AValue: Boolean);
var
  i, iAct: Integer;
  oConn: TFDCustomConnection;
begin
  if csReading in ComponentState then
    FStreamedActive := AValue
  else begin
    iAct := 0;
    if Active <> AValue then
      if AValue then
        DoBeforeStartup
      else
        DoBeforeShutdown;
    FLock.BeginRead;
    try
      if Active <> AValue then
        if AValue then begin
          FLock.BeginWrite;
          try
            CheckInactive;
            // check that IFDPhysManager implementation is linked
            FDPhysManager();
          finally
            FLock.EndWrite;
          end;
          iAct := 1;
        end
        else begin
          FLock.BeginWrite;
          try
            CheckActive;
            for i := FConnections.Count - 1 downto 0 do begin
              oConn := TFDCustomConnection(FConnections[i]);
              if oConn.Temporary then
                FDFree(oConn)
              else begin
                oConn.Close;
                oConn.ResultConnectionDef.ParentDefinition := nil;
              end;
            end;
          finally
            FLock.EndWrite;
          end;
          iAct := -1;
        end;
    finally
      FLock.EndRead;
    end;
    if iAct = 1 then begin
      InternalOpen;
      DoAfterStartup;
    end
    else if iAct = -1 then begin
      InternalClose;
      DoAfterShutdown;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.InternalOpen;
begin
  FDPhysManager.Open;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.DoBeforeStartup;
begin
  if Assigned(FBeforeStartup) then
    FBeforeStartup(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.DoAfterStartup;
begin
  if Assigned(FAfterStartup) then
    FAfterStartup(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.Open;
begin
  Active := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.InternalClose;
begin
  FDPhysManager.Close(True);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.DoBeforeShutdown;
begin
  if Assigned(FBeforeShutdown) then
    FBeforeShutdown(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.DoAfterShutdown;
begin
  if Assigned(FAfterShutdown) then
    FAfterShutdown(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.Close;
begin
  Active := False;
end;

{-------------------------------------------------------------------------------}
// Connection management

procedure TFDCustomManager.AddConnection(AConn: TFDCustomConnection);
begin
  FLock.BeginWrite;
  try
    if FConnections.IndexOf(AConn) = -1 then begin
      FConnections.Add(AConn);
      FreeNotification(AConn);
    end;
  finally
    FLock.EndWrite;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.RemoveConnection(AConn: TFDCustomConnection);
begin
  FLock.BeginWrite;
  try
    if FCachedConnection = AConn then
      FCachedConnection := nil;
    RemoveFreeNotification(AConn);
    FConnections.Remove(AConn);
  finally
    FLock.EndWrite;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.GetConnectionCount: Integer;
begin
  FLock.BeginRead;
  try;
    Result := FConnections.Count;
  finally
    FLock.EndRead;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.GetConnection(AIndex: Integer): TFDCustomConnection;
begin
  FLock.BeginRead;
  try;
    Result := TFDCustomConnection(FConnections[AIndex]);
  finally
    FLock.EndRead;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.InternalAcquireConnection(AConnection: TFDCustomConnection;
  const AConnectionName, AObjName: String): TFDCustomConnection;
begin
  if (AConnection = nil) and (AConnectionName = '') then
    FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_ClntDbNotDefined, [AObjName]);
  FLock.BeginWrite;
  try
    if AConnection <> nil then
      Result := AConnection
    else begin
      Result := FindConnection(AConnectionName);
      if Result = nil then
        Result := InternalAcquireTemporaryConnection(AConnectionName);
    end;
    if Result.FRefCount >= 0 then
      Inc(Result.FRefCount);
  finally
    FLock.EndWrite;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.InternalAcquireTemporaryConnection(
  const AConnectionName: string): TFDCustomConnection;
begin
  Result := FConnectionClass.Create(Self);
  try
    Result.ConnectionName := AConnectionName;
    Result.Temporary := True;
  except
    FDFree(Result);
    raise;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.AcquireConnection(const AConnectionName: string;
  const AObjName: String): TFDCustomConnection;
begin
  Result := InternalAcquireConnection(nil, AConnectionName, AObjName);
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.AcquireConnection(AConnection: TFDCustomConnection;
  const AObjName: String): TFDCustomConnection;
begin
  Result := InternalAcquireConnection(AConnection, '', AObjName);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.InternalReleaseConnection(var AConnection: TFDCustomConnection);
begin
  FLock.BeginWrite;
  try
    AConnection.FLastUsed := Now();
    if AConnection.FRefCount > 0 then
      Dec(AConnection.FRefCount);
    if (AConnection.FRefCount = 0) and not AConnection.ResourceOptions.KeepConnection then
      if not AConnection.Temporary then
        AConnection.Close
      else if not (csDestroying in AConnection.ComponentState) then begin
        FDFree(AConnection);
        AConnection := nil;
      end;
  finally
    FLock.EndWrite;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.ReleaseConnection(var AConnection: TFDCustomConnection);
begin
  if AConnection = nil then
    Exit;
  InternalReleaseConnection(AConnection);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.DropConnections;
var
  i: Integer;
  oConn: TFDCustomConnection;
begin
  FLock.BeginWrite;
  try
    for i := FConnections.Count - 1 downto 0 do begin
      oConn := TFDCustomConnection(FConnections[i]);
      if oConn.RefCount = 0 then
        if oConn.Temporary then
          FDFree(oConn)
        else
          oConn.Connected := False;
    end;
  finally
    FLock.EndWrite;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.FindConnection(const AConnectionName: string): TFDCustomConnection;
begin
  if AConnectionName = '' then begin
    Result := nil;
    Exit;
  end;
  FLock.BeginRead;
  try
    if (FCachedConnection <> nil) and
       ({$IFDEF FireDAC_NOLOCALE_META} CompareText {$ELSE} AnsiCompareText {$ENDIF}
         (FCachedConnection.ConnectionName, AConnectionName) = 0) then
      Result := FCachedConnection
    else begin
      Result := InternalFindConnection(AConnectionName);
      if Result <> nil then
        FCachedConnection := Result;
    end;
  finally
    FLock.EndRead;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.InternalFindConnection(const AConnectionName: string): TFDCustomConnection;
var
  i: Integer;
  oConn: TFDCustomConnection;
begin
  Result := nil;
  for i := 0 to FConnections.Count - 1 do begin
    oConn := TFDCustomConnection(FConnections[i]);
    if {$IFDEF FireDAC_NOLOCALE_META} CompareText {$ELSE} AnsiCompareText {$ENDIF}
         (oConn.ConnectionName, AConnectionName) = 0 then begin
      Result := oConn;
      Break;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
// Get XXX names

procedure TFDCustomManager.GetConnectionNames(AList: TStrings);
begin
  GetConnectionNames(AList, '');
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.GetConnectionNames(AList: TStrings; ADriverName: string);
var
  i: Integer;
  oNames: TFDStringList;
  oConn: TFDCustomConnection;
begin
  Active := True;
  oNames := TFDStringList.Create(dupIgnore, True, False);
  FLock.BeginRead;
  try
    oNames.BeginUpdate;
    for i := 0 to ConnectionDefs.Count - 1 do
      if (ConnectionDefs[i].Name <> '') and ((ADriverName = '') or (CompareText(ADriverName, ConnectionDefs[i].Params.DriverID) = 0)) then
        oNames.Add(ConnectionDefs[i].Name);
    for i := 0 to FConnections.Count - 1 do begin
      oConn := TFDCustomConnection(FConnections[I]);
      if (oConn.ConnectionName <> '') and ((ADriverName = '') or (CompareText(ADriverName, oConn.DriverName) = 0)) then
        oNames.Add(oConn.ConnectionName);
    end;
    AList.SetStrings(oNames);
  finally
    FLock.EndRead;
    FDFree(oNames);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.GetConnectionDefNames(AList: TStrings);
var
  i: Integer;
  oNames: TFDStringList;
begin
  Active := True;
  oNames := TFDStringList.Create(dupIgnore, True, False);
  FLock.BeginRead;
  try
    oNames.BeginUpdate;
    for i := 0 to ConnectionDefs.Count - 1 do
      if ConnectionDefs[i].Name <> '' then
        oNames.Add(ConnectionDefs[i].Name);
    AList.SetStrings(oNames);
  finally
    FLock.EndRead;
    FDFree(oNames);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.GetDriverNames(AList: TStrings;
  AValidate: Boolean = False; ABaseOnly: Boolean = False);
var
  oNames: TFDStringList;
  i: Integer;
  oManMeta: IFDPhysManagerMetadata;
  oDrv: IFDPhysDriver;
begin
  Open;
  oNames := TFDStringList.Create(dupIgnore, True, False);
  try
    oNames.BeginUpdate;
    FDPhysManager.CreateMetadata(oManMeta);
    for i := 0 to oManMeta.DriverCount - 1 do
      if not ABaseOnly or (CompareText(oManMeta.DriverID[i], oManMeta.BaseDriverID[i]) = 0) then
        try
          if AValidate then
            FDPhysManager.CreateDriver(oManMeta.DriverID[i], oDrv);
          oNames.Add(oManMeta.DriverID[i]);
        except
          // silent
        end;
    AList.SetStrings(oNames);
  finally
    FDFree(oNames);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.GetCatalogNames(const AConnectionName,
  APattern: string; AList: TStrings);
var
  oConn: TFDCustomConnection;
begin
  oConn := AcquireConnection(AConnectionName, Name);
  try
    oConn.GetCatalogNames(APattern, AList);
  finally
    ReleaseConnection(oConn);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.GetSchemaNames(const AConnectionName, ACatalogName,
  APattern: string; AList: TStrings);
var
  oConn: TFDCustomConnection;
begin
  oConn := AcquireConnection(AConnectionName, Name);
  try
    oConn.GetSchemaNames(ACatalogName, APattern, AList);
  finally
    ReleaseConnection(oConn);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.GetTableNames(const AConnectionName, ACatalogName,
  ASchemaName, APattern: string; AList: TStrings; AScopes: TFDPhysObjectScopes;
  AFullName: Boolean);
var
  oConn: TFDCustomConnection;
begin
  oConn := AcquireConnection(AConnectionName, Name);
  try
    oConn.GetTableNames(ACatalogName, ASchemaName, APattern, AList, AScopes,
      [tkSynonym, tkTable, tkView], AFullName);
  finally
    ReleaseConnection(oConn);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.GetFieldNames(const AConnectionName, ACatalogName,
  ASchemaName, ATableName, APattern: string; AList: TStrings);
var
  oConn: TFDCustomConnection;
begin
  oConn := AcquireConnection(AConnectionName, Name);
  try
    oConn.GetFieldNames(ACatalogName, ASchemaName, ATableName, APattern, AList);
  finally
    ReleaseConnection(oConn);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.GetKeyFieldNames(const AConnectionName, ACatalogName,
  ASchemaName, ATableName, APattern: string; AList: TStrings);
var
  oConn: TFDCustomConnection;
begin
  oConn := AcquireConnection(AConnectionName, Name);
  try
    oConn.GetKeyFieldNames(ACatalogName, ASchemaName, ATableName, APattern, AList);
  finally
    ReleaseConnection(oConn);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.GetIndexNames(const AConnectionName, ACatalogName,
  ASchemaName, ATableName, APattern: string; AList: TStrings);
var
  oConn: TFDCustomConnection;
begin
  oConn := AcquireConnection(AConnectionName, Name);
  try
    oConn.GetIndexNames(ACatalogName, ASchemaName, ATableName, APattern, AList);
  finally
    ReleaseConnection(oConn);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.GetPackageNames(const AConnectionName, ACatalogName,
  ASchemaName, APattern: string; AList: TStrings; AScopes: TFDPhysObjectScopes;
  AFullName: Boolean);
var
  oConn: TFDCustomConnection;
begin
  oConn := AcquireConnection(AConnectionName, Name);
  try
    oConn.GetPackageNames(ACatalogName, ASchemaName, APattern, AList, AScopes,
      AFullName);
  finally
    ReleaseConnection(oConn);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.GetStoredProcNames(const AConnectionName, ACatalogName,
  ASchemaName, APackage, APattern: string; AList: TStrings; AScopes: TFDPhysObjectScopes;
  AFullName: Boolean);
var
  oConn: TFDCustomConnection;
begin
  oConn := AcquireConnection(AConnectionName, Name);
  try
    oConn.GetStoredProcNames(ACatalogName, ASchemaName, APackage, APattern,
      AList, AScopes, AFullName);
  finally
    ReleaseConnection(oConn);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.GetGeneratorNames(const AConnectionName, ACatalogName,
  ASchemaName, APattern: string; AList: TStrings; AScopes: TFDPhysObjectScopes;
  AFullName: Boolean);
var
  oConn: TFDCustomConnection;
begin
  oConn := AcquireConnection(AConnectionName, Name);
  try
    oConn.GetGeneratorNames(ACatalogName, ASchemaName, APattern, AList, AScopes,
      AFullName);
  finally
    ReleaseConnection(oConn);
  end;
end;

{-------------------------------------------------------------------------------}
// Connection definitions

function TFDCustomManager.GetConnectionDefs: IFDStanConnectionDefs;
begin
  Result := FDPhysManager.ConnectionDefs;
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.GetConnectionDefFileName: String;
begin
  Result := ConnectionDefs.Storage.FileName;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.SetConnectionDefFileName(const AValue: String);
begin
  ConnectionDefs.Storage.FileName := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.GetActualConnectionDefFileName: String;
begin
  Result := ConnectionDefs.Storage.ActualFileName;
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.GetAfterLoadConnectionDefFile: TNotifyEvent;
begin
  Result := ConnectionDefs.AfterLoad;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.SetAfterLoadConnectionDefFile(const AValue: TNotifyEvent);
begin
  ConnectionDefs.AfterLoad := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.GetBeforeLoadConnectionDefFile: TNotifyEvent;
begin
  Result := ConnectionDefs.BeforeLoad;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.SetBeforeLoadConnectionDefFile(const AValue: TNotifyEvent);
begin
  ConnectionDefs.BeforeLoad := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.GetConnectionDefAutoLoad: Boolean;
begin
  Result := ConnectionDefs.AutoLoad;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.SetConnectionDefAutoLoad(const AValue: Boolean);
begin
  ConnectionDefs.AutoLoad := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.GetConnectionDefsLoaded: Boolean;
begin
  Result := ConnectionDefs.Loaded;
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.IsConnectionDef(const AName: String): Boolean;
begin
  Result := (AName <> '') and (ConnectionDefs.FindConnectionDef(AName) <> nil);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.AddConnectionDef(const AName, ADriver: string;
  AList: TStrings = nil; APersistent: Boolean = False);
var
  oDef: IFDStanConnectionDef;
begin
  oDef := ConnectionDefs.AddConnectionDef;
  oDef.Params.BeginUpdate;
  try
    if AList <> nil then
      oDef.Params.SetStrings(AList);
    if AName <> '' then
      oDef.Name := AName;
    if ADriver <> '' then
      oDef.Params.DriverID := ADriver;
  finally
    oDef.Params.EndUpdate;
  end;
  if APersistent then
    oDef.MarkPersistent;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.DeleteConnectionDef(const AName: string);
begin
  ConnectionDefs.ConnectionDefByName(AName).Delete;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.ModifyConnectionDef(const AName: string; AList: TStrings);
var
  i: Integer;
  sName, sValue: String;
  oDef: IFDStanConnectionDef;
begin
  oDef := ConnectionDefs.ConnectionDefByName(AName);
  oDef.Params.BeginUpdate;
  try
    for i := 0 to AList.Count - 1 do begin
      sName := AList.KeyNames[i];
      sValue := AList.ValueFromIndex[i];
      oDef.AsString[sName] := sValue;
    end;
  finally
    oDef.Params.EndUpdate;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.RenameConnectionDef(const AOldName, ANewName: string);
begin
  ConnectionDefs.ConnectionDefByName(AOldName).Name := ANewName;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.GetConnectionDefParams(const AName: string; AList: TStrings);
begin
  AList.SetStrings(ConnectionDefs.ConnectionDefByName(AName).Params);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.CloseConnectionDef(const AName: string);
var
  oDef: IFDStanConnectionDef;
  i: Integer;
begin
  oDef := ConnectionDefs.FindConnectionDef(AName);
  if oDef = nil then
    Exit;
  FLock.BeginWrite;
  try
    for i := ConnectionCount - 1 downto 0 do
      if (CompareText(Connections[i].ConnectionDefName, AName) = 0) and
         not Connections[i].Offlined then
        Connections[i].Close;
    FDPhysManager.CloseConnectionDef(oDef);
  finally
    FLock.EndWrite;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.SaveConnectionDefFile;
begin
  ConnectionDefs.Save;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.LoadConnectionDefFile;
begin
  ConnectionDefs.Load;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.RefreshMetadataCache;
begin
  if Active then
    FDPhysManager.RefreshMetadataCache;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.RefreshConnectionDefFile;
begin
  if ConnectionDefs.Loaded then
    ConnectionDefs.Refresh;
end;

{-------------------------------------------------------------------------------}
// Driver configurations

function TFDCustomManager.GetDriverDefs: IFDStanDefinitions;
begin
  Result := FDPhysManager.DriverDefs;
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.GetDriverDefAutoLoad: Boolean;
begin
  Result := FDPhysManager.DriverDefs.AutoLoad;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.SetDriverDefAutoLoad(const AValue: Boolean);
begin
  FDPhysManager.DriverDefs.AutoLoad := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.GetDriverDefFileName: String;
begin
  Result := FDPhysManager.DriverDefs.Storage.FileName;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomManager.SetDriverDefFileName(const AValue: String);
begin
  FDPhysManager.DriverDefs.Storage.FileName := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.GetActualDriverDefFileName: String;
begin
  Result := FDPhysManager.DriverDefs.Storage.ActualFileName;
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.GetBaseDriverID(const ADriverID: String): String;
var
  oManMeta: IFDPhysManagerMetadata;
begin
  FDPhysManager.CreateMetadata(oManMeta);
  Result := oManMeta.GetBaseDriverID(ADriverID);
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.GetBaseDriverDesc(const ADriverID: String): String;
var
  oManMeta: IFDPhysManagerMetadata;
  oDrvMeta: IFDPhysDriverMetadata;
begin
  FDPhysManager.CreateMetadata(oManMeta);
  oManMeta.CreateDriverMetadata(ADriverID, oDrvMeta);
  Result := oDrvMeta.BaseDriverDesc;
end;

{-------------------------------------------------------------------------------}
function TFDCustomManager.GetRDBMSKind(const ADriverID: String): TFDRDBMSKind;
var
  oManMeta: IFDPhysManagerMetadata;
begin
  FDPhysManager.CreateMetadata(oManMeta);
  Result := oManMeta.GetRDBMSKind(ADriverID);
end;

{-------------------------------------------------------------------------------}
{ TFDCustomConnection                                                           }
{-------------------------------------------------------------------------------}
constructor TFDCustomConnection.Create(AOwner: TComponent);
var
  oOpts: IFDStanOptions;
begin
  inherited Create(AOwner);
  SetOptionsIntf(nil);
  FDCreateInterface(IFDStanConnectionDef, FParams);
  FParams.OnChanging := ParamsChanging;
  FTxOptions := TFDTxOptions.Create;
  FCommands := TFDObjList.Create;
  LoginPrompt := True;
  oOpts := Self as IFDStanOptions;
  FOptionsIntf := oOpts;
  FLastUsed := Now;
  FConnectedStoredUsage := [auDesignTime, auRunTime];
  FDeferredUnregs := TFDObjList.Create;
  FDManager.AddConnection(Self);
end;

{-------------------------------------------------------------------------------}
destructor TFDCustomConnection.Destroy;
begin
  Destroying;
  Close;
  if FManagerSingleton <> nil then
    FDManager.RemoveConnection(Self);
  inherited Destroy;
  SetLoginDialog(nil);
  FParams := nil;
  if FOptionsIntf <> nil then begin
    FOptionsIntf.ObjectDestroyed(Self);
    FOptionsIntf := nil;
  end;
  FDFreeAndNil(FCommands);
  FDFreeAndNil(FTxOptions);
  FDFreeAndNil(FDeferredUnregs);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.Loaded;
begin
  StreamedConnected := StreamedConnected and
    FDCheckStoredUsage(ComponentState, FDManager.ActiveStoredUsage * ConnectedStoredUsage);
  inherited Loaded;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.Notification(AComponent: TComponent;
  AOperation: TOperation);
begin
  if AOperation = opRemove then
    if FLoginDialog = AComponent then
      SetLoginDialog(nil)
    else if Transaction = AComponent then
      Transaction := nil
    else if UpdateTransaction = AComponent then
      UpdateTransaction := nil;
  inherited Notification(AComponent, AOperation);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.Assign(Source: TPersistent);
var
  oSrc: TFDCustomConnection;
begin
  if Source is TFDCustomConnection then begin
    oSrc := Source as TFDCustomConnection;
    Connected := False;
    Params := oSrc.Params;
    FetchOptions := oSrc.FetchOptions;
    FormatOptions := oSrc.FormatOptions;
    ResourceOptions := oSrc.ResourceOptions;
    UpdateOptions := oSrc.UpdateOptions;
    TxOptions := oSrc.TxOptions;
    SharedCliHandle := oSrc.SharedCliHandle;
    Temporary := oSrc.Temporary;
    ConnectedStoredUsage := oSrc.ConnectedStoredUsage;
    Offlined := oSrc.Offlined;
    LoginPrompt := oSrc.LoginPrompt;
    LoginDialog := oSrc.LoginDialog;
    AfterConnect := oSrc.AfterConnect;
    BeforeConnect := oSrc.BeforeConnect;
    AfterDisconnect := oSrc.AfterDisconnect;
    BeforeDisconnect := oSrc.BeforeDisconnect;
    OnLogin := oSrc.OnLogin;
    OnError := oSrc.OnError;
    OnLost := oSrc.OnLost;
    OnRestored := oSrc.OnRestored;
    OnRecover := oSrc.OnRecover;
    BeforeStartTransaction := oSrc.BeforeStartTransaction;
    AfterStartTransaction := oSrc.AfterStartTransaction;
    BeforeCommit := oSrc.BeforeCommit;
    AfterCommit := oSrc.AfterCommit;
    BeforeRollback := oSrc.BeforeRollback;
    AfterRollback := oSrc.AfterRollback;
  end
  else
    inherited Assign(Source);
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.CloneConnection: TFDCustomConnection;
begin
  Result := TFDCustomConnectionClass(ClassType).Create(nil);
  Result.Assign(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.CheckActive;
begin
  CheckOnline;
  if not Connected then
    if Temporary or ResourceOptions.AutoConnect then
      Open
    else
      FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_ClntDbMBActive, [GetName]);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.CheckInactive;
begin
  if Connected then
    if (csDesigning in ComponentState) or Temporary or ResourceOptions.AutoConnect then
      Close
    else
      FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_ClntDbMBInactive, [GetName]);
end;

{-------------------------------------------------------------------------------}
// IFDStanOptions

procedure TFDCustomConnection.GetParentOptions(var AOpts: IFDStanOptions);
begin
  if FManagerOptsIntf = nil then
    FDManager();
  AOpts := FManagerOptsIntf;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.SetOptionsIntf(const AValue: IFDStanOptions);
begin
  if (FOptionsIntf <> AValue) or (FOptionsIntf = nil) and (AValue = nil) then begin
    FOptionsIntf := AValue;
    if FOptionsIntf = nil then
      FOptionsIntf := TFDOptionsContainer.Create(Self, TFDFetchOptions,
        TFDUpdateOptions, TFDTopResourceOptions, GetParentOptions);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetFetchOptions: TFDFetchOptions;
begin
  Result := FOptionsIntf.FetchOptions;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.SetFetchOptions(const AValue: TFDFetchOptions);
begin
  FOptionsIntf.FetchOptions.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetFormatOptions: TFDFormatOptions;
begin
  Result := FOptionsIntf.FormatOptions;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.SetFormatOptions(const AValue: TFDFormatOptions);
begin
  FOptionsIntf.FormatOptions.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetUpdateOptions: TFDUpdateOptions;
begin
  Result := FOptionsIntf.UpdateOptions;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.SetUpdateOptions(const AValue: TFDUpdateOptions);
begin
  FOptionsIntf.UpdateOptions.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetResourceOptions: TFDTopResourceOptions;
begin
  Result := TFDTopResourceOptions(FOptionsIntf.ResourceOptions);
  ASSERT((Result <> nil) and (Result is TFDTopResourceOptions));
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.SetResourceOptions(const AValue: TFDTopResourceOptions);
begin
  FOptionsIntf.ResourceOptions.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
// Other

procedure TFDCustomConnection.SetTxOptions(const AValue: TFDTxOptions);
begin
  FTxOptions.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.HandleException(const AInitiator: IFDStanObject;
  var AException: Exception);
begin
  if Assigned(FOnError) then
    if AInitiator = nil then
      FOnError(Self, Self, AException)
    else
      FOnError(Self, AInitiator as TObject, AException);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.DoRecover(const AInitiator: IFDStanObject;
  AException: Exception; var AAction: TFDPhysConnectionRecoverAction);
begin
  if Assigned(FOnRecover) then
    FOnRecover(Self, AInitiator as TObject, AException, AAction);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.HandleConnectionRecover(const AInitiator: IFDStanObject;
  AException: Exception; var AAction: TFDPhysConnectionRecoverAction);
begin
  if csReading in ComponentState then
    AAction := faFail
  else if AInitiator = nil then
    DoRecover(Self as IFDStanObject, AException, AAction)
  else
    DoRecover(AInitiator, AException, AAction);
  FTmpConnectionIntf := FConnectionIntf;
  case AAction of
  faCloseAbort:
    Connected := False;
  faOfflineAbort:
    Offlined := True;
  faFail:
    Connected := False;
  faDefault:
    if not GetResourceOptions.AutoReconnect then begin
      DoLost;
      Connected := False;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.DoLost;
begin
  if Assigned(FOnLost) then
    FOnLost(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.HandleConnectionLost;
begin
  if Connected and not Offlined then
    Connected := False;
  ReleaseConnectionIntf(FTmpConnectionIntf);
  DoLost;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.DoRestored;
begin
  if Assigned(FOnRestored) then
    FOnRestored(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.HandleConnectionRestored;
begin
  if FTmpConnectionIntf = FConnectionIntf then
    FTmpConnectionIntf := nil
  else
    ReleaseConnectionIntf(FTmpConnectionIntf);
  DoRestored;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetSQLBased: Boolean;
begin
  Result := not (RDBMSKind in [TFDRDBMSKinds.Unknown, TFDRDBMSKinds.DataSnap]);
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetRDBMSKind: TFDRDBMSKind;
begin
  Result := FDManager.GetRDBMSKind(ActualDriverID);
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetParams: TFDConnectionDefParams;
var
  sDef: String;
  oParDef: IFDStanDefinition;
begin
  sDef := FParams.Params.Values[S_FD_DefinitionParam_Common_ConnectionDef];
  if sDef = '' then
    sDef := ConnectionName;
  oParDef := FParams.ParentDefinition;
  if (sDef <> '') xor (oParDef <> nil) or
     (sDef <> '') and (CompareText(oParDef.Name, sDef) <> 0) then
    PrepareConnectionDef(False);
  Result := FParams.Params;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.ParamsChanging(ASender: TObject);
begin
  CheckInactive;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.SetParams(const AValue: TFDConnectionDefParams);
begin
  FParams.Params.SetStrings(AValue);
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetConnectionDefName: string;
begin
  Result := FParams.Params.ConnectionDef;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.SetConnectionDefName(const AValue: string);
begin
  if FParams.Params.Values[S_FD_DefinitionParam_Common_ConnectionDef] <> AValue then begin
    FParams.ParentDefinition := nil;
    FParams.Params.DriverID := '';
    FParams.Params.ConnectionDef := AValue;
    PrepareConnectionDef(False);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetDriverName: string;
begin
  Result := FParams.Params.DriverID;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.SetDriverName(const AValue: string);
begin
  if FParams.Params.Values[S_FD_ConnParam_Common_DriverID] <> AValue then begin
    FParams.ParentDefinition := nil;
    FParams.Params.ConnectionDef := '';
    FParams.Params.DriverID := AValue;
    PrepareConnectionDef(False);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetActualDriverID: String;
var
  oDef: IFDStanConnectionDef;
begin
  Result := DriverName;
  if Result = '' then begin
    FDManager.CheckActive;
    if ConnectionDefName <> '' then
      oDef := FDManager.ConnectionDefs.FindConnectionDef(ConnectionDefName)
    else if ConnectionName <> '' then
      oDef := FDManager.ConnectionDefs.FindConnectionDef(ConnectionName)
    else
      oDef := nil;
    if oDef <> nil then
      Result := oDef.Params.DriverID;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.DoValidateName(const AName: string);
var
  oConn: TFDCustomConnection;
begin
  if AName <> '' then begin
    oConn := FDManager.FindConnection(AName);
    if (oConn <> nil) and (oConn <> Self) then begin
      if not oConn.Temporary or (oConn.FRefCount <> 0) then
        FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_ClntDbDupName, [AName]);
      FDFree(oConn);
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.SetConnectionName(const AValue: String);
begin
  if csReading in ComponentState then
    FConnectionName := AValue
  else if FConnectionName <> AValue then begin
    CheckInactive;
    DoValidateName(AValue);
    FConnectionName := AValue;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.SetLoginDialog(const AValue: TFDGUIxLoginDialog);
begin
  if FLoginDialog <> nil then begin
    FLoginDialog.RemoveFreeNotification(Self);
    FLoginDialog.ConnectionDef := nil;
  end;
  FLoginDialog := AValue;
  if FLoginDialog <> nil then begin
    FLoginDialog.FreeNotification(Self);
    FLoginDialog.ConnectionDef := ResultConnectionDef;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.DoInternalLogin;
begin
  ConnectionIntf.LoginPrompt := False;
  ConnectionIntf.Open;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.DoLogin(const AConnectionDef: IFDStanConnectionDef);
  procedure ErrorLoginAborted;
  var
    s: String;
  begin
    s := ConnectionName;
    if s = '' then
      s := ConnectionDefName;
    if s = '' then
      s := ResultConnectionDef.Name;
    if s = '' then
      s := S_FD_Unnamed;
    FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_ClntDbLoginAborted, [s]);
  end;
var
  oDlg: IFDGUIxLoginDialog;
begin
  if Assigned(FOnLogin) then
    FOnLogin(Self, AConnectionDef.Params)
  else begin
    if (Assigned(FLoginDialog) and not Assigned(FLoginDialog.LoginDialog)) or
        not Assigned(FLoginDialog) then begin
      FDCreateInterface(IFDGUIxLoginDialog, oDlg, False);
      if oDlg = nil then begin
        DoInternalLogin;
        Exit;
      end;
      oDlg.ConnectionDef := ResultConnectionDef;
    end
    else
      oDlg := FLoginDialog as IFDGUIxLoginDialog;
    try
      if not oDlg.Execute(DoInternalLogin) then
        ErrorLoginAborted;
    finally
      if not Assigned(FLoginDialog) then
        oDlg.ConnectionDef := nil;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.PrepareConnectionDef(ACheckDef: Boolean);
begin
  if (ConnectionDefName <> '') or (ConnectionName <> '') then
    FDManager.CheckActive;
  FParams.ParentDefinition := nil;
  if ConnectionDefName <> '' then
    if ACheckDef then
      FParams.ParentDefinition := FDManager.ConnectionDefs.ConnectionDefByName(ConnectionDefName)
    else
      FParams.ParentDefinition := FDManager.ConnectionDefs.FindConnectionDef(ConnectionDefName)
  else if ConnectionName <> '' then
    FParams.ParentDefinition := FDManager.ConnectionDefs.FindConnectionDef(ConnectionName);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.CheckConnectionDef;
begin
  PrepareConnectionDef(True);
  try
    if FParams.Params.Pooled and
       not ((FParams.Params.Count = 0) or
            (FParams.Params.Count = 1) and
              (FParams.Params.Names[0] = S_FD_DefinitionParam_Common_ConnectionDef)) then
      FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_ClntDbCantConnPooled, [GetName]);
    if FParams.Params.DriverID = '' then
      FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_AccSrvNotDefined, []);
  except
    FParams.ParentDefinition := nil;
    raise;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetConnectionMetadata(AOpen: Boolean): IFDPhysConnectionMetadata;
begin
  if AOpen then
    CheckActive;
  if ConnectionIntf <> nil then
    ConnectionIntf.CreateMetadata(Result)
  else
    Result := nil;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetConnectionMetadataIntf: IFDPhysConnectionMetadata;
begin
  Result := GetConnectionMetadata(True);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.AcquireDefaultTransaction(const AConnIntf: IFDPhysConnection);
var
  oTX: IFDPhysTransaction;
begin
  if AConnIntf.Transaction = nil then begin
    AConnIntf.CreateTransaction(oTX);
    AConnIntf.Transaction := oTX;
  end;
  AConnIntf.Transaction.AddStateHandler(Self as IFDPhysTransactionStateHandler);
  AConnIntf.Transaction.Options := FTxOptions;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.AcquireConnectionIntf(out AConnIntf: IFDPhysConnection);
var
  oObjIntf: IFDStanObject;
begin
  FDManager.CheckActive;
  CheckConnectionDef;
  if FParams.Params.Pooled then
    FDPhysManager.CreateConnection(
      FParams.ParentDefinition as IFDStanConnectionDef, AConnIntf)
  else begin
    FDPhysManager.CreateConnection(FParams, AConnIntf);
    if FSharedCliHandle <> nil then
      AConnIntf.SharedCliHandle := FSharedCliHandle;
  end;
  if Supports(AConnIntf, IFDStanObject, oObjIntf) then begin
    oObjIntf.SetOwner(Self, '');
    oObjIntf := nil;
  end;
  AConnIntf.ErrorHandler := Self as IFDStanErrorHandler;
  AConnIntf.RecoveryHandler := Self as IFDPhysConnectionRecoveryHandler;
  AConnIntf.Options := Self as IFDStanOptions;
  FParams.ReadOptions(FormatOptions, UpdateOptions, FetchOptions, ResourceOptions);
  AcquireDefaultTransaction(AConnIntf);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.ReleaseDefaultTransaction(const AConnIntf: IFDPhysConnection);
begin
  if AConnIntf.Transaction <> nil then begin
    AConnIntf.Transaction.Options := nil;
    AConnIntf.Transaction.RemoveStateHandler(Self as IFDPhysTransactionStateHandler);
    AConnIntf.Transaction := nil;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.ReleaseConnectionIntf(var AConnIntf: IFDPhysConnection);

  procedure DoCleanup;
  begin
    AConnIntf.ErrorHandler := nil;
    AConnIntf.RecoveryHandler := nil;
    ReleaseDefaultTransaction(AConnIntf);
    AConnIntf := nil;
  end;

begin
  if AConnIntf <> nil then
    DoCleanup;
  if AConnIntf = FConnectionIntf then
    FParams.ParentDefinition := nil;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetConnected: Boolean;
begin
  Result := (ConnectionIntf <> nil) and
    (ConnectionIntf.State in [csRecovering, csConnected]);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.UnRegisterClient(AClient: TObject);
begin
  if FDisconnecting then
    FDeferredUnregs.Add(AClient)
  else
    inherited UnRegisterClient(AClient);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.SetConnected(AValue: Boolean);
var
  i: Integer;
begin
  try
    try
      FDisconnecting := not AValue;
      inherited SetConnected(AValue);
    finally
      FDisconnecting := False;
      if FDeferredUnregs <> nil then
        for i := 0 to FDeferredUnregs.Count - 1 do
          UnRegisterClient(TObject(FDeferredUnregs[i]));
    end;
  finally
    if FDeferredUnregs <> nil then
      FDeferredUnregs.Clear;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.DoConnect;
var
  lErasePassword: Boolean;
begin
  if not Connected then
  try
    inherited DoConnect;
    lErasePassword := False;
    try
      AcquireConnectionIntf(FConnectionIntf);
      lErasePassword := not FParams.HasValue(S_FD_ConnParam_Common_Password) and
        not ResourceOptions.AutoReconnect and not FParams.Params.Pooled;
      if LoginPrompt and not FParams.Params.Pooled and (Assigned(FOnLogin) or not FDGUIxSilent()) and
         (FSharedCliHandle = nil) then
        DoLogin(FParams);
      if ConnectionIntf.State = csDisconnected then
        DoInternalLogin;
      FOfflined := False;
    finally
      FParams.OnChanging := nil;
      if lErasePassword then
        FParams.Params.Password := ''
      else if (FParams.Params.NewPassword <> '') and (ExceptObject() = nil) then
        FParams.Params.Password := FParams.Params.NewPassword;
      FParams.Params.NewPassword := '';
      FParams.OnChanging := ParamsChanging;
    end;
  except
    ReleaseConnectionIntf(FConnectionIntf);
    raise;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.DoDisconnect;
begin
  if not Connected then
    Exit;
  if FExecSQLCommand <> nil then begin
    FExecSQLCommand.ErrorHandler := nil;
    FExecSQLCommand := nil;
  end;
  FDFreeAndNil(FExecSQLTab);
  if ConnectionIntf <> nil then begin
    try
      FRefCount := -1;
      if FOfflined then
        ReleaseClients(rmOffline)
      else
        ReleaseClients(rmDisconnect);
      if not FParams.Params.Pooled then
        ConnectionIntf.Close;
    finally
      FRefCount := 0;
    end;
  end;
  if FTmpConnectionIntf = FConnectionIntf then
    FConnectionIntf := nil
  else
    ReleaseConnectionIntf(FConnectionIntf);
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetConnectionString: String;
var
  sName: String;
  sStr: String;
begin
  sName := ConnectionDefName;
  sStr := Trim(ResultConnectionDef.BuildString());
  if (sName <> '') and
     (CompareText(sStr, S_FD_DefinitionParam_Common_ConnectionDef + '=' + sName) = 0) then
    Result := sName
  else
    Result := sStr;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.SetConnectionString(const AConnectionString: String);
begin
  Connected := False;
  ResultConnectionDef.Clear;
  if Pos('=', AConnectionString) <> 0 then
    ResultConnectionDef.ParseString(AConnectionString)
  else
    ConnectionDefName := AConnectionString;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.SetUserNamePassword(const AUserName: String;
  const APassword: String);
begin
  Connected := False;
  if AUserName <> '' then
    Params.UserName := AUserName;
  if APassword <> '' then
    Params.Password := APassword;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.Open(const AConnectionString: String);
begin
  if ConnectionString <> AConnectionString then
    SetConnectionString(AConnectionString);
  Connected := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.Open(const AConnectionString: String;
  const AUserName: String; const APassword: String);
begin
  SetConnectionString(AConnectionString);
  SetUserNamePassword(AUserName, APassword);
  Connected := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.Open(const AUserName: String; const APassword: String);
begin
  SetUserNamePassword(AUserName, APassword);
  Connected := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.SetOfflined(AValue: Boolean);
begin
  if Offlined <> AValue then begin
    FOfflined := AValue;
    Connected := not AValue;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.Offline;
begin
  Offlined := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.Online;
begin
  Offlined := False;
  Connected := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.CheckOnline;
begin
  if Offlined then
    if Temporary or ResourceOptions.AutoConnect then
      Online
    else
      FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_ClntDbMBOnline, [GetName]);
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.Ping: Boolean;
begin
  if ConnectionIntf <> nil then
    Result := ConnectionIntf.Ping
  else
    try
      Connected := True;
      Result := True;
    except
      Result := False;
    end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.AbortJob(AWait: Boolean = False);
var
  i: Integer;
begin
  i := DataSetCount - 1;
  while i >= 0 do begin
    if (i < DataSetCount) and (DataSets[i] is TFDAdaptedDataSet) then
      try
        TFDAdaptedDataSet(DataSets[i]).AbortJob(AWait);
      except
      end;
    Dec(i);
  end;
  i := CommandCount - 1;
  while i >= 0 do begin
    if i < CommandCount then
      try
        Commands[i].AbortJob(AWait);
      except
      end;
    Dec(i);
  end;
end;

{-------------------------------------------------------------------------------}
{$IFDEF FireDAC_MONITOR_Comp}
procedure TFDCustomConnection.Trace(AStep: TFDMoniEventStep; ASender: TObject;
  const AMsg: String; const AArgs: array of const);
begin
  if (ConnectionIntf <> nil) and ConnectionIntf.Tracing then
    ConnectionIntf.Monitor.Notify(ekComponent, AStep, ASender, AMsg, AArgs);
end;
{$ENDIF}

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetInfoReport(AList: TStrings;
  AItems: TFDInfoReportItems = [riConnDef .. riKeepConnected]): TFDInfoReportStatus;
var
  oWait: IFDGUIxWaitCursor;
  oMAIntf: IFDMoniAdapter;
  i: Integer;
  sSessionMsg, sClientMsg, sMsg, sName, sVal: String;
  oDef: IFDStanDefinition;
  oConnIntf: IFDPhysConnection;
  lHasInfo, lDisconnect: Boolean;
  oMessages: TStrings;

  procedure Header(const ACaption: String);
  begin
    AList.Add('================================');
    AList.Add(ACaption);
    AList.Add('================================');
    lHasInfo := False;
  end;

  procedure CheckNA;
  begin
    if not lHasInfo then
      AList.Add(S_FD_ClntNotAccessible);
  end;

  procedure PutItems(AKind: TFDMoniAdapterItemKind);
  var
    i: Integer;
    sName: String;
    vValue: Variant;
    eKind: TFDMoniAdapterItemKind;
  begin
    if oMAIntf <> nil then
      for i := 0 to oMAIntf.ItemCount - 1 do begin
        oMAIntf.GetItem(i, sName, vValue, eKind);
        if eKind = AKind then begin
          AList.Add(sName + ' = ' + VarToStr(vValue));
          lHasInfo := True;
        end;
      end;
  end;

begin
  Result := [];
  oWait := nil;
  sSessionMsg := '';
  sClientMsg := '';
  sMsg := '';
  lDisconnect := False;
  AList.BeginUpdate;
  if not ResourceOptions.ActualSilentMode then begin
    FDCreateInterface(IFDGUIxWaitCursor, oWait);
    oWait.StartWait;
  end;
  try
    AList.Clear;
    if (riTryConnect in AItems) and not Connected then
      try
        Connected := True;
        lDisconnect := not (riKeepConnected in AItems);
      except
        on E: Exception do
          sSessionMsg := E.Message;
      end;
    try
      if ConnectionIntf = nil then
        AcquireConnectionIntf(oConnIntf)
      else
        oConnIntf := ConnectionIntf;
      if (oConnIntf <> nil) and (oConnIntf.Driver.State = drsRegistered) then
        oConnIntf.Driver.Load;
    except
      on E: Exception do
        sClientMsg := E.Message;
    end;

    if (oConnIntf = nil) or (oConnIntf.Driver.State = drsRegistered) then
      Include(Result, rsClientError)
    else if (oConnIntf.State <> csConnected) and (riTryConnect in AItems) then
      Include(Result, rsSessionError);

    try

      if riConnDef in AItems then begin
        Header(S_FD_ClntConnDefParams);
        oDef := ResultConnectionDef;
        while oDef <> nil do begin
          for i := 0 to oDef.Params.Count - 1 do begin
            sName := oDef.Params.KeyNames[i];
            sVal := oDef.Params.ValueFromIndex[i];
            if Pos(UpperCase(S_FD_ConnParam_Common_Password), UpperCase(sName)) <> 0 then
              sVal := '*****';
            AList.Add(sName + '=' + sVal);
            lHasInfo := True;
          end;
          oDef := oDef.ParentDefinition;
        end;
        CheckNA;
      end;

      oMAIntf := oConnIntf as IFDMoniAdapter;
      if riFireDAC in AItems then begin
        Header(C_FD_Product + ' info');
        PutItems(ikFireDACInfo);
        CheckNA;
      end;

      if riClient in AItems then begin
        Header(S_FD_ClntClientInfo);
        if (riClientLog in AItems) and
           (oConnIntf <> nil) and (oConnIntf.Driver.Messages <> nil) then begin
          lHasInfo := True;
          for i := 0 to oConnIntf.Driver.Messages.Count - 1 do begin
            sMsg := oConnIntf.Driver.Messages[i];
            if (Pos(S_FD_Warning, sMsg) > 0) or (Pos(S_FD_Error, sMsg) > 0) then
              Include(Result, rsClientWarning);
            AList.Add(sMsg);
          end;
        end;
        if sClientMsg <> '' then begin
          AList.Add(S_FD_ClntFailedToLoad);
          if Pos(sClientMsg, sMsg) = 0 then begin
            AList.Add(sClientMsg);
            lHasInfo := True;
          end;
        end
        else
          PutItems(ikClientInfo);
        CheckNA;
      end;

      if riSession in AItems then begin
        Header(S_FD_ClntSessionInfo);
        if (sSessionMsg <> '') and (not (riClient in AItems) or (sClientMsg <> sSessionMsg)) then begin
          AList.Add(S_FD_ClntFailedToConnect);
          AList.Add(sSessionMsg);
          lHasInfo := True;
        end
        else if (oConnIntf = nil) or (oConnIntf.State <> csConnected) then begin
          AList.Add(S_FD_ClntNotConnected);
          lHasInfo := True;
        end
        else begin
          if riSessionHints in AItems then begin
            oMessages := TFDStringList.Create;
            try
              oConnIntf.AnalyzeSession(oMessages);
              if oMessages.Count > 0 then begin
                lHasInfo := True;
                AList.Add(S_FD_ClntCheckingSession);
                for i := 0 to oMessages.Count - 1 do begin
                  sMsg := oMessages[i];
                  if (Pos(S_FD_Warning, sMsg) > 0) or (Pos(S_FD_Error, sMsg) > 0) then
                    Include(Result, rsSessionWarning);
                  AList.Add('  ' + sMsg);
                end;
              end;
            finally
              FDFree(oMessages);
            end;
          end;
          PutItems(ikSessionInfo);
        end;
        CheckNA;
      end;

    finally
      if ConnectionIntf = nil then
        ReleaseConnectionIntf(oConnIntf);
    end;
  finally
    if lDisconnect then
      Connected := False;
    if oWait <> nil then
      oWait.StopWait;
    AList.EndUpdate;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetInTransaction: Boolean;
begin
  if Connected then
    Result := ConnectionIntf.Transaction.Active
  else
    Result := False;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.StartTransaction;
begin
  CheckActive;
  ConnectionIntf.Transaction.StartTransaction;
  if (FUpdateTransaction <> nil) and
     (ConnectionIntf.Transaction <> FUpdateTransaction.TransactionIntf) then
    FUpdateTransaction.StartTransaction;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.Commit;
begin
  CheckActive;
  ConnectionIntf.Transaction.Commit;
  if (FUpdateTransaction <> nil) and
     (ConnectionIntf.Transaction <> FUpdateTransaction.TransactionIntf) then
    FUpdateTransaction.Commit;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.CommitRetaining;
begin
  CheckActive;
  ConnectionIntf.Transaction.CommitRetaining;
  if (FUpdateTransaction <> nil) and
     (ConnectionIntf.Transaction <> FUpdateTransaction.TransactionIntf) then
    FUpdateTransaction.CommitRetaining;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.Rollback;
begin
  CheckActive;
  ConnectionIntf.Transaction.Rollback;
  if (FUpdateTransaction <> nil) and
     (ConnectionIntf.Transaction <> FUpdateTransaction.TransactionIntf) then
    FUpdateTransaction.Rollback;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.RollbackRetaining;
begin
  CheckActive;
  ConnectionIntf.Transaction.RollbackRetaining;
  if (FUpdateTransaction <> nil) and
     (ConnectionIntf.Transaction <> FUpdateTransaction.TransactionIntf) then
    FUpdateTransaction.RollbackRetaining;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.HandleDisconnectCommands(AFilter: TFDPhysDisconnectFilter;
  AMode: TFDPhysDisconnectMode);
var
  i: Integer;
  oDS: TFDRdbmsDataSet;
begin
  for i := DataSetCount - 1 downto 0 do
    if DataSets[i] is TFDRdbmsDataSet then begin
      oDS := TFDRdbmsDataSet(DataSets[i]);
      if (oDS.Transaction = nil) and oDS.Prepared and
         (not Assigned(AFilter) or AFilter(oDS.Command.CommandIntf.CliObj)) then
        case AMode of
        dmOffline: oDS.Offline;
        dmRelease: oDS.Release;
        end;
    end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.HandleTxOperation(AOperation: TFDPhysTransactionState;
  ABefore: Boolean);
begin
  case AOperation of
  tsActive:
    if ABefore then begin
      if Assigned(BeforeStartTransaction) then
        BeforeStartTransaction(Self);
    end
    else begin
      if Assigned(AfterStartTransaction) then
        AfterStartTransaction(Self);
    end;
  tsCommiting:
    if ABefore then begin
      if Assigned(BeforeCommit) then
        BeforeCommit(Self);
    end
    else begin
      if Assigned(AfterCommit) then
        AfterCommit(Self);
    end;
  tsRollingback:
    if ABefore then begin
      if Assigned(BeforeRollback) then
        BeforeRollback(Self);
    end
    else begin
      if Assigned(AfterRollback) then
        AfterRollback(Self);
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.ReleaseClients(AMode: TFDReleaseClientMode = rmDisconnect);
var
  n, i: Integer;
  oDS: TFDAdaptedDataSet;
begin
  for i := DataSetCount - 1 downto 0 do
    case AMode of
    rmFetchAll:
      begin
        oDS := TFDAdaptedDataSet(DataSets[i]);
        if oDS.Active and not oDS.SourceEOF and oDS.DoIsSourceOpen then
          if not oDS.FClientCursor then
            oDS.Release
          else if oDS.FetchOptions.Unidirectional then
            oDS.Close
          else
            oDS.FetchAll;
      end;
    rmClose:
      DataSets[i].Close;
    rmOffline:
      DataSets[i].Offline;
    rmDisconnect:
      begin
        n := DataSetCount;
        DataSets[i].Disconnect(True);
        if n = DataSetCount then
          DetachClient(DataSets[i]);
      end;
    end;
  for i := CommandCount - 1 downto 0 do begin
    case AMode of
    rmFetchAll,
    rmClose:
      Commands[i].Close;
    rmOffline,
    rmDisconnect:
      begin
        n := CommandCount;
        Commands[i].Disconnect(True);
        if n = CommandCount then
          DetachClient(Commands[i]);
      end;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetADDataSet(AIndex: Integer): TFDDataSet;
begin
  Result := inherited DataSets[AIndex] as TFDDataSet;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetCommandCount: Integer;
begin
  Result := FCommands.Count;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetCommands(AIndex: Integer): TFDCustomCommand;
begin
  Result := TFDCustomCommand(FCommands[AIndex]);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.AttachClient(AClient: TObject);
begin
  RegisterClient(AClient);
  if AClient is TFDCustomCommand then
    FCommands.Add(AClient);
  if FRefCount = 0 then
    Open
  else if FRefCount > 0 then
    Inc(FRefCount);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.DetachClient(AClient: TObject);
begin
  UnRegisterClient(AClient);
  if AClient is TFDCustomCommand then
    FCommands.Remove(AClient);
  if FRefCount = 1 then begin
    if not ResourceOptions.KeepConnection then
      Close;
  end
  else if FRefCount > 0 then
    Dec(FRefCount);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.GetFieldNames(const ACatalogName, ASchemaName,
  ATableName, APattern: String; AList: TStrings);
var
  oConnMeta: IFDPhysConnectionMetadata;
  oView: TFDDatSView;
  i: Integer;
  oConn: TFDCustomConnection;
begin
  oConn := FDManager.AcquireConnection(Self, Name);
  try
    oConnMeta := GetConnectionMetadata(True);
    oView := oConnMeta.GetTableFields(ACatalogName, ASchemaName, ATableName, APattern);
    AList.BeginUpdate;
    try
      AList.Clear;
      for i := 0 to oView.Rows.Count - 1 do
        AList.Add(EncodeObjectName('*', '*', '*',
          CnvMetaValue(oView.Rows[i].GetData('COLUMN_NAME'))));
    finally
      AList.EndUpdate;
      FDClearMetaView(oView, FetchOptions);
    end;
  finally
    FDManager.ReleaseConnection(oConn);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.GetKeyFieldNames(const ACatalogName,
  ASchemaName, ATableName, APattern: string; AList: TStrings);
var
  oConnMeta: IFDPhysConnectionMetadata;
  oView: TFDDatSView;
  i: Integer;
  oConn: TFDCustomConnection;
begin
  oConn := FDManager.AcquireConnection(Self, Name);
  try
    oConnMeta := GetConnectionMetadata(True);
    oView := oConnMeta.GetTablePrimaryKeyFields(ACatalogName, ASchemaName, ATableName, APattern);
    AList.BeginUpdate;
    try
      AList.Clear;
      for i := 0 to oView.Rows.Count - 1 do
        AList.Add(EncodeObjectName('*', '*', '*',
          CnvMetaValue(oView.Rows[i].GetData('COLUMN_NAME'))));
    finally
      AList.EndUpdate;
      FDClearMetaView(oView, FetchOptions);
    end;
  finally
    FDManager.ReleaseConnection(oConn);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.GetIndexNames(const ACatalogName, ASchemaName,
  ATableName, APattern: string; AList: TStrings);
var
  oConnMeta: IFDPhysConnectionMetadata;
  oView: TFDDatSView;
  i: Integer;
  oConn: TFDCustomConnection;
begin
  oConn := FDManager.AcquireConnection(Self, Name);
  try
    oConnMeta := GetConnectionMetadata(True);
    oView := oConnMeta.GetTableIndexes(ACatalogName, ASchemaName, ATableName, APattern);
    AList.BeginUpdate;
    try
      AList.Clear;
      for i := 0 to oView.Rows.Count - 1 do
        AList.Add(EncodeObjectName('*', '*', '*',
          CnvMetaValue(oView.Rows[i].GetData('INDEX_NAME'))));
    finally
      AList.EndUpdate;
      FDClearMetaView(oView, FetchOptions);
    end;
  finally
    FDManager.ReleaseConnection(oConn);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.EncodeObjectName(const ACatalogName, ASchemaName,
  ABaseObjectName, AObjectName: String): String;
var
  oConMeta: IFDPhysConnectionMetadata;
  rName: TFDPhysParsedName;
begin
  CheckActive;
  rName.FCatalog := CnvMetaValue(ACatalogName);
  rName.FSchema := CnvMetaValue(ASchemaName);
  rName.FBaseObject := CnvMetaValue(ABaseObjectName);
  rName.FObject := CnvMetaValue(AObjectName);
  ConnectionIntf.CreateMetadata(oConMeta);
  Result := oConMeta.EncodeObjName(rName, nil, [eoBeautify]);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.DecodeObjectName(const AFullName: String;
  var ACatalogName, ASchemaName, ABaseObjectName, AObjectName: String);
var
  oConMeta: IFDPhysConnectionMetadata;
  rName: TFDPhysParsedName;
begin
  CheckActive;
  ConnectionIntf.CreateMetadata(oConMeta);
  oConMeta.DecodeObjName(AFullName, rName, nil, [doUnquote, doNormalize]);
  ACatalogName := rName.FCatalog;
  ASchemaName := rName.FSchema;
  ABaseObjectName := rName.FBaseObject;
  AObjectName := rName.FObject;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.CnvMetaValue(const AStr: Variant; const ADefault: String = ''): String;
begin
  Result := VarToStrDef(AStr, '');
  if (CompareText(Result, '<NULL>') = 0) or
     (ADefault <> '') and (CompareText(Result, ADefault) = 0) then
    Result := '';
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.GetCatalogNames(const APattern: string;
  AList: TStrings);
var
  oConnMeta: IFDPhysConnectionMetadata;
  oView: TFDDatSView;
  i: Integer;
  oConn: TFDCustomConnection;
begin
  oConn := FDManager.AcquireConnection(Self, Name);
  try
    oConnMeta := GetConnectionMetadata(True);
    oView := oConnMeta.GetCatalogs(APattern);
    AList.BeginUpdate;
    try
      AList.Clear;
      for i := 0 to oView.Rows.Count - 1 do
        AList.Add(CnvMetaValue(oView.Rows[i].GetData('CATALOG_NAME'), ''));
    finally
      AList.EndUpdate;
      FDFree(oView.Table);
    end;
  finally
    FDManager.ReleaseConnection(oConn);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.GetSchemaNames(const ACatalogName,
  APattern: string; AList: TStrings);
var
  oConnMeta: IFDPhysConnectionMetadata;
  oView: TFDDatSView;
  i: Integer;
  oConn: TFDCustomConnection;
begin
  oConn := FDManager.AcquireConnection(Self, Name);
  try
    oConnMeta := GetConnectionMetadata(True);
    oView := oConnMeta.GetSchemas(ACatalogName, APattern);
    AList.BeginUpdate;
    try
      AList.Clear;
      for i := 0 to oView.Rows.Count - 1 do
        AList.Add(CnvMetaValue(oView.Rows[i].GetData('SCHEMA_NAME'), ''));
    finally
      AList.EndUpdate;
      FDFree(oView.Table);
    end;
  finally
    FDManager.ReleaseConnection(oConn);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.EncodeListName(const ACatalogName, ASchemaName: String;
  const ABaseField, AObjField: String; ARow: TFDDatSRow; AList: TStrings;
  AFullName: Boolean): String;
var
  sBase, sObj, sName: String;
begin
  Result := '';
  sBase := '';
  sObj := '';
  sName := '';
  if ABaseField <> '' then begin
    sBase := CnvMetaValue(ARow.GetData(ABaseField));
    sName := sBase;
  end;
  if AObjField <> '' then begin
    sObj := CnvMetaValue(ARow.GetData(AObjField));
    sName := sObj;
  end;
  if not AFullName then begin
    Result := EncodeObjectName('', '', '', sName);
    if AList.IndexOf(Result) >= 0 then
      Result := '';
  end;
  if Result = '' then
    Result := EncodeObjectName(
      CnvMetaValue(ARow.GetData('CATALOG_NAME'), ACatalogName),
      CnvMetaValue(ARow.GetData('SCHEMA_NAME'), ASchemaName),
      sBase, sObj);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.GetTableNames(const ACatalogName, ASchemaName,
  APattern: string; AList: TStrings; AScopes: TFDPhysObjectScopes;
  AKinds: TFDPhysTableKinds; AFullName: Boolean);
var
  oConnMeta: IFDPhysConnectionMetadata;
  oView: TFDDatSView;
  i: Integer;
  oConn: TFDCustomConnection;
begin
  oConn := FDManager.AcquireConnection(Self, Name);
  try
    oConnMeta := GetConnectionMetadata(True);
    oView := oConnMeta.GetTables(AScopes, AKinds, ACatalogName, ASchemaName, APattern);
    AList.BeginUpdate;
    try
      AList.Clear;
      for i := 0 to oView.Rows.Count - 1 do
        AList.Add(EncodeListName(ACatalogName, ASchemaName, '', 'TABLE_NAME',
          oView.Rows[i], AList, AFullName));
    finally
      AList.EndUpdate;
      FDFree(oView.Table);
    end;
  finally
    FDManager.ReleaseConnection(oConn);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.GetPackageNames(const ACatalogName, ASchemaName,
  APattern: string; AList: TStrings; AScopes: TFDPhysObjectScopes; AFullName: Boolean);
var
  oConnMeta: IFDPhysConnectionMetadata;
  oView: TFDDatSView;
  i: Integer;
  oConn: TFDCustomConnection;
begin
  oConn := FDManager.AcquireConnection(Self, Name);
  try
    oConnMeta := GetConnectionMetadata(True);
    oView := oConnMeta.GetPackages(AScopes, ACatalogName, ASchemaName, APattern);
    AList.BeginUpdate;
    try
      AList.Clear;
      for i := 0 to oView.Rows.Count - 1 do
        AList.Add(EncodeListName(ACatalogName, ASchemaName, 'PACKAGE_NAME', '',
          oView.Rows[i], AList, AFullName));
    finally
      AList.EndUpdate;
      FDFree(oView.Table);
    end;
  finally
    FDManager.ReleaseConnection(oConn);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.GetStoredProcNames(const ACatalogName, ASchemaName,
  APackage, APattern: string; AList: TStrings; AScopes: TFDPhysObjectScopes;
  AFullName: Boolean);
var
  oConnMeta: IFDPhysConnectionMetadata;
  oView: TFDDatSView;
  i: Integer;
  s: String;
  oConn: TFDCustomConnection;
begin
  oConn := FDManager.AcquireConnection(Self, Name);
  try
    oConnMeta := GetConnectionMetadata(True);
    if APackage = '' then
      oView := oConnMeta.GetProcs(AScopes, ACatalogName, ASchemaName, APattern)
    else
      oView := oConnMeta.GetPackageProcs(ACatalogName, ASchemaName, APackage, APattern);
    AList.BeginUpdate;
    try
      AList.Clear;
      for i := 0 to oView.Rows.Count - 1 do begin
        if APackage <> '' then
          s := CnvMetaValue(oView.Rows[i].GetData('PROC_NAME'))
        else
          s := EncodeListName(ACatalogName, ASchemaName, '', 'PROC_NAME',
            oView.Rows[i], AList, AFullName);
        AList.Add(s);
      end;
    finally
      AList.EndUpdate;
      if APackage = '' then
        FDFree(oView.Table)
      else
        FDClearMetaView(oView, FetchOptions);
    end;
  finally
    FDManager.ReleaseConnection(oConn);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.GetGeneratorNames(const ACatalogName, ASchemaName,
  APattern: string; AList: TStrings; AScopes: TFDPhysObjectScopes; AFullName: Boolean);
var
  oConnMeta: IFDPhysConnectionMetadata;
  oView: TFDDatSView;
  i: Integer;
  oConn: TFDCustomConnection;
begin
  oConn := FDManager.AcquireConnection(Self, Name);
  try
    oConnMeta := GetConnectionMetadata(True);
    oView := oConnMeta.GetGenerators(AScopes, ACatalogName, ASchemaName, APattern);
    AList.BeginUpdate;
    try
      AList.Clear;
      for i := 0 to oView.Rows.Count - 1 do
        AList.Add(EncodeListName(ACatalogName, ASchemaName, '', 'GENERATOR_NAME',
          oView.Rows[i], AList, AFullName));
    finally
      AList.EndUpdate;
      FDFree(oView.Table);
    end;
  finally
    FDManager.ReleaseConnection(oConn);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.RefreshMetadataCache(const AObjName: String = '');
var
  oConnMeta: IFDPhysConnectionMetadata;
begin
  if Connected then begin
    oConnMeta := GetConnectionMetadata(False);
    oConnMeta.RefreshMetadataCache(AObjName);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.ApplyUpdates(const ADataSets: array of TFDDataSet);
var
  i: Integer;
  oDS: TFDDataSet;
  oConn: TFDCustomConnection;
begin
  StartTransaction;
  try
    for i := Low(ADataSets) to High(ADataSets) do begin
      oDS := ADataSets[i];
      if oDS is TFDAdaptedDataSet then begin
        oConn := TFDAdaptedDataSet(oDS).GetConnection(False);
        if (oConn <> nil) and (oConn <> Self) then
          FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_ClntConnNotMatch, []);
      end;
      oDS.ApplyUpdates;
    end;
    Commit;
  except
    Rollback;
    raise;
  end;
  for i := Low(ADataSets) to High(ADataSets) do
    ADataSets[i].CommitUpdates;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetName: TComponentName;
begin
  if Name = '' then
    Result := '$' + IntToHex(Integer(Self), 8)
  else
    Result := Name;
  Result := Result + ': ' + ClassName;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetParent: IFDStanObject;
begin
  Result := FDManager as IFDStanObject;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.AfterReuse;
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.BeforeReuse;
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.SetOwner(const AOwner: TObject;
  const ARole: TComponentName);
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetLastAutoGenValue(const AName: String): Variant;
begin
  CheckActive;
  Result := ConnectionIntf.GetLastAutoGenValue(AName);
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetMessages: EFDDBEngineException;
begin
  if ConnectionIntf <> nil then
    Result := ConnectionIntf.Messages
  else
    Result := nil;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetCurrentCatalog: String;
begin
  if ConnectionIntf <> nil then
    Result := ConnectionIntf.CurrentCatalog
  else
    Result := '';
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetCurrentSchema: String;
begin
  if ConnectionIntf <> nil then
    Result := ConnectionIntf.CurrentSchema
  else
    Result := '';
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetState: TFDPhysConnectionState;
begin
  if ConnectionIntf <> nil then
    Result := ConnectionIntf.State
  else
    Result := csDisconnected;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.BaseCreateSQL: IFDPhysCommand;
var
  oFtch: TFDFetchOptions;
  oRes: TFDResourceOptions;
begin
  CheckActive;
  if FExecSQLCommand = nil then begin
    FConnectionIntf.CreateCommand(Result);

    oFtch := Result.Options.FetchOptions;
    oFtch.RowsetSize := 1;
    oFtch.Items := oFtch.Items - [fiMeta];
    oFtch.AutoClose := True;
    oFtch.AutoFetchAll := afAll;
    oFtch.RecordCountMode := cmVisible;
    oFtch.Mode := fmOnDemand;

    oRes := Result.Options.ResourceOptions;
    if oRes.CmdExecMode = amAsync then
      oRes.CmdExecMode := amBlocking;
    oRes.DirectExecute := True;
    oRes.ParamCreate := True;
    oRes.ParamExpand := True;
    oRes.Persistent := False;

    Result.ErrorHandler := Self as IFDStanErrorHandler;
    if FExecSQLCommand = nil then
      FExecSQLCommand := Result;
  end
  else
    Result := FExecSQLCommand;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.BasePrepareSQL(const ACommand: IFDPhysCommand; const ASQL: String;
  const AParams: array of Variant; const ATypes: array of TFieldType; ABindMode: TFDParamBindMode): Boolean;
var
  i: Integer;
begin
  Result := (ACommand.CommandText <> ASQL) and (ASQL <> '') or
    (ACommand.Params.BindMode <> ABindMode);
  if Result then begin
    ACommand.Disconnect;
    ACommand.Params.Clear;
    ACommand.CommandText := '';
    ACommand.Params.BindMode := ABindMode;
    ACommand.CommandKind := skUnknown;
    ACommand.CommandText := ASQL;
  end;
  if High(AParams) >= Low(AParams) then begin
    for i := Low(ATypes) to High(ATypes) do
      if ATypes[i] <> ftUnknown then
        ACommand.Params[i].DataType := ATypes[i];
    for i := Low(AParams) to High(AParams) do
      ACommand.Params[i].Value := AParams[i];
    if ACommand.State = csInactive then begin
      Result := True;
      ACommand.Prepare();
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.ExecSQL(const ASQL: String; const AParams: array of Variant;
  const ATypes: array of TFieldType): LongInt;
var
  oCmd: IFDPhysCommand;
begin
  oCmd := BaseCreateSQL;
  try
    BasePrepareSQL(oCmd, ASQL, AParams, ATypes, pbByName);
    oCmd.Execute();
    Result := oCmd.RowsAffected;
  finally
    oCmd.AbortJob(True);
    oCmd.CloseAll;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.ExecSQL(const ASQL: String; AIgnoreObjNotExists: Boolean = False): LongInt;
begin
  try
    Result := ExecSQL(ASQL, [], []);
  except
    on E: EFDDBEngineException do
      if not AIgnoreObjNotExists or (E.Kind <> ekObjNotExists) then
        raise
      else
        Result := 0;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.ExecSQL(const ASQL: String; const AParams: array of Variant): LongInt;
begin
  Result := ExecSQL(ASQL, AParams, []);
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.ExecSQL(const ASQL: String; AParams: TFDParams): LongInt;
var
  oCmd: IFDPhysCommand;
begin
  oCmd := BaseCreateSQL;
  try
    BasePrepareSQL(oCmd, ASQL, [], [], pbByNumber);
    AParams.BindMode := pbByNumber;
    oCmd.Params := AParams;
    oCmd.Execute();
    Result := oCmd.RowsAffected;
  finally
    oCmd.AbortJob(True);
    oCmd.CloseAll;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.ExecSQL(const ASQL: String; AParams: TFDParams;
  var AResultSet: TDataSet): LongInt;
var
  oQry: TFDQuery;
begin
  oQry := TFDQuery.Create(nil);
  try
    oQry.Connection := Self;
    oQry.SQL.Text := ASQL;
    if AParams <> nil then begin
      AParams.BindMode := pbByNumber;
      oQry.Params := AParams;
    end;
    oQry.Open;
    Result := oQry.RecordCount;
  finally
    AResultSet := oQry;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.ExecSQL(const ASQL: String; var AResultSet: TDataSet): LongInt;
begin
  Result := ExecSQL(ASQL, nil, AResultSet);
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.ExecSQLScalar(const ASQL: String;
  const AParams: array of Variant; const ATypes: array of TFieldType): Variant;
var
  oCmd: IFDPhysCommand;
begin
  oCmd := BaseCreateSQL;
  try
    if BasePrepareSQL(oCmd, ASQL, AParams, ATypes, pbByName) or (FExecSQLTab = nil) then begin
      FDFreeAndNil(FExecSQLTab);
      FExecSQLTab := oCmd.Define;
    end;
    oCmd.Open;
    oCmd.Fetch(FExecSQLTab);
    if (FExecSQLTab.Rows.Count > 0) and (FExecSQLTab.Columns.Count > 0) then
      Result := FExecSQLTab.Rows[0].GetData(0)
    else
      Result := Unassigned;
  finally
    if FExecSQLTab <> nil then
      FExecSQLTab.Clear;
    oCmd.AbortJob(True);
    oCmd.CloseAll;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.ExecSQLScalar(const ASQL: String): Variant;
begin
  Result := ExecSQLScalar(ASQL, [], []);
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.ExecSQLScalar(const ASQL: String;
  const AParams: array of Variant): Variant;
begin
  Result := ExecSQLScalar(ASQL, AParams, []);
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetCliObj: Pointer;
begin
  CheckActive;
  Result := ConnectionIntf.CliObj;
end;

{-------------------------------------------------------------------------------}
function TFDCustomConnection.GetCliHandle: Pointer;
begin
  CheckActive;
  Result := ConnectionIntf.CliHandle;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.SetSharedCliHandle(const AValue: Pointer);
begin
  if SharedCliHandle <> AValue then begin
    CheckInactive;
    FSharedCliHandle := AValue;
    DriverName := FDPhysManager.DriverIDFromSharedCliHandle(AValue);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.SetTransaction(const AValue: TFDCustomTransaction);
begin
  if FTransaction <> AValue then begin
    FTransaction := AValue;
    if FTransaction <> nil then begin
      FTransaction.FreeNotification(Self);
      FTransaction.Connection := Self;
      if ConnectionIntf <> nil then
        ConnectionIntf.Transaction := FTransaction.TransactionIntf;
    end
    else begin
      if ConnectionIntf <> nil then begin
        ConnectionIntf.Transaction := nil;
        AcquireDefaultTransaction(ConnectionIntf);
      end;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomConnection.SetUpdateTransaction(const AValue: TFDCustomTransaction);
begin
  if FUpdateTransaction <> AValue then begin
    FUpdateTransaction := AValue;
    if FUpdateTransaction <> nil then begin
      FUpdateTransaction.FreeNotification(Self);
      FUpdateTransaction.Connection := Self;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
{ TFDCustomTransaction                                                          }
{-------------------------------------------------------------------------------}
constructor TFDCustomTransaction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FOptionsIntf := TFDTxOptions.Create;
  FDataSets := TFDObjList.Create;
  if FDIsDesigning(Self) then
    Connection := FDFindDefaultConnection(Self);
end;

{-------------------------------------------------------------------------------}
destructor TFDCustomTransaction.Destroy;
begin
  Destroying;
  Connection := nil;
  inherited Destroy;
  FDFreeAndNil(FOptionsIntf);
  FDFreeAndNil(FDataSets);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTransaction.Notification(AComponent: TComponent; AOperation: TOperation);
begin
  inherited Notification(AComponent, AOperation);
  if AOperation = opRemove then
    if AComponent = Connection then
      Connection := nil;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTransaction.SetConnection(const AValue: TFDCustomConnection);
begin
  if FConnection <> AValue then begin
    if FConnection <> nil then begin
      InternalDeleteTxIntf;
      FConnection.UnRegisterClient(Self);
    end;
    FConnection := AValue;
    if FConnection <> nil then begin
      FConnection.RegisterClient(Self, DoConnectChanged);
      FConnection.FreeNotification(Self);
      if FConnection.Connected then
        InternalCreateTxIntf;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTransaction.DoConnectChanged(Sender: TObject; Connecting: Boolean);
begin
  if Connecting then
    InternalCreateTxIntf
  else
    InternalDeleteTxIntf;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTransaction.SetOptions(const AValue: TFDTxOptions);
begin
  FOptionsIntf.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
function TFDCustomTransaction.GetActive: Boolean;
begin
  Result := (FTransactionIntf <> nil) and FTransactionIntf.Active;
end;

{-------------------------------------------------------------------------------}
function TFDCustomTransaction.GetDataSetCount: Integer;
begin
  Result := FDataSets.Count;
end;

{-------------------------------------------------------------------------------}
function TFDCustomTransaction.GetDataSets(AIndex: Integer): TFDDataSet;
begin
  Result := TFDDataSet(FDataSets[AIndex]);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTransaction.InternalCreateTxIntf;
begin
  if FTransactionIntf = nil then begin
    Connection.ConnectionIntf.CreateTransaction(FTransactionIntf);
    FTransactionIntf.Options.Assign(FOptionsIntf);
    FTransactionIntf.AddStateHandler(Self);
    FDFree(FOptionsIntf);
    FOptionsIntf := FTransactionIntf.Options;
    if Connection.Transaction = Self then
      Connection.ConnectionIntf.Transaction := FTransactionIntf;
    FSerialID := 0;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTransaction.InternalDeleteTxIntf;
var
  i: Integer;
begin
  HandleDisconnectCommands(nil, dmRelease);
  if FTransactionIntf <> nil then begin
    if (FTransactionIntf.State = tsActive) and (FSerialID = FTransactionIntf.SerialID) then
      if FNestingLevel = FTransactionIntf.NestingLevel then
        FTransactionIntf.Disconnect
      else begin
        for i := FNestingLevel downto 1 do
          if Active then
            case Options.DisconnectAction of
            xdCommit:   Commit;
            xdRollback: Rollback;
            end;
      end;
    if (Connection <> nil) and (Connection.ConnectionIntf <> nil) and
       (Connection.ConnectionIntf.Transaction = FTransactionIntf) and
       Connection.ConnectionMetaDataIntf.TxMultiple then begin
      Connection.ConnectionIntf.Transaction := nil;
      Connection.AcquireDefaultTransaction(Connection.ConnectionIntf);
    end;
    FOptionsIntf := TFDTxOptions.Create;
    FOptionsIntf.Assign(FTransactionIntf.Options);
    FTransactionIntf.RemoveStateHandler(Self);
    FTransactionIntf := nil;
    FSerialID := 0;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTransaction.StartTransaction;
begin
  if FNestingLevel = 0 then
    FDManager.AcquireConnection(FConnection, Name);
  try
    FConnection.CheckActive;
    ASSERT(FTransactionIntf <> nil);
    FTransactionIntf.StartTransaction;
  except
    if FNestingLevel = 0 then
      FDManager.ReleaseConnection(FConnection);
    raise;
  end;
  Inc(FNestingLevel);
  FSerialID := FTransactionIntf.SerialID;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTransaction.CheckConnected;
begin
  if Connection = nil then
    FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_ClntDbNotDefined, [Name]);
  if not FConnection.Connected then
    FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_ClntDbMBActive, [Name]);
  ASSERT(FTransactionIntf <> nil);
end;

{-------------------------------------------------------------------------------}
function TFDCustomTransaction.CheckActive: Boolean;
begin
  CheckConnected;
  if not FTransactionIntf.Active then
    FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_ClntTxMBActive, [Name]);
  Result := FSerialID = FTransactionIntf.SerialID;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTransaction.CheckReleased(ARetaining, AMyTrans: Boolean);
begin
  // if retaining, then just sync local field to Phys Layer value
  if ARetaining then
    FNestingLevel := FTransactionIntf.NestingLevel
  // if finishing, then if Phys Layer TX finished or Comp Layer is finishing,
  // then release connection objects
  else if (FTransactionIntf = nil) or (FTransactionIntf.NestingLevel = 0) or
          (FNestingLevel = 1) then begin
    FDManager.ReleaseConnection(FConnection);
    FNestingLevel := 0;
  end
  // sync local field to Phys Layer value
  else if FNestingLevel > 0 then begin
    FNestingLevel := FTransactionIntf.NestingLevel;
    if FNestingLevel > 0 then
      Dec(FNestingLevel);
  end;
  if AMyTrans then
    FSerialID := FTransactionIntf.SerialID
  else
    FSerialID := 0;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTransaction.Commit;
var
  lMyTrans: Boolean;
begin
  lMyTrans := CheckActive;
  try
    FTransactionIntf.Commit;
  finally
    CheckReleased(False, lMyTrans);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTransaction.CommitRetaining;
var
  lMyTrans: Boolean;
begin
  lMyTrans := CheckActive;
  try
    FTransactionIntf.CommitRetaining;
  finally
    CheckReleased(True, lMyTrans);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTransaction.Rollback;
var
  lMyTrans: Boolean;
begin
  lMyTrans := CheckActive;
  try
    FTransactionIntf.Rollback;
  finally
    CheckReleased(False, lMyTrans);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTransaction.RollbackRetaining;
var
  lMyTrans: Boolean;
begin
  lMyTrans := CheckActive;
  try
    FTransactionIntf.RollbackRetaining;
  finally
    CheckReleased(True, lMyTrans);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTransaction.HandleDisconnectCommands(AFilter: TFDPhysDisconnectFilter;
  AMode: TFDPhysDisconnectMode);
var
  i: Integer;
  oDS: TFDRdbmsDataSet;
begin
  for i := DataSetCount - 1 downto 0 do
    if (i < DataSetCount) and (DataSets[i] is TFDRdbmsDataSet) then begin
      oDS := TFDRdbmsDataSet(DataSets[i]);
      if (oDS.Command.CommandIntf <> nil) and
         (not Assigned(AFilter) or AFilter(oDS.Command.CommandIntf.CliObj)) then
        case AMode of
        dmOffline: oDS.Offline;
        dmRelease: oDS.Release;
        end
      else
        if (AMode = dmRelease) and
           not ((TransactionIntf <> nil) and
                (TransactionIntf.State in [tsStarting, tsCommiting, tsRollingback])) then
          oDS.Cancel;
    end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTransaction.HandleTxOperation(AOperation: TFDPhysTransactionState;
  ABefore: Boolean);
begin
  case AOperation of
  tsActive:
    if ABefore then begin
      if Assigned(BeforeStartTransaction) then
        BeforeStartTransaction(Self);
    end
    else begin
      if Assigned(AfterStartTransaction) then
        AfterStartTransaction(Self);
    end;
  tsCommiting:
    if ABefore then begin
      if Assigned(BeforeCommit) then
        BeforeCommit(Self);
    end
    else begin
      if Assigned(AfterCommit) then
        AfterCommit(Self);
    end;
  tsRollingback:
    if ABefore then begin
      if Assigned(BeforeRollback) then
        BeforeRollback(Self);
    end
    else begin
      if Assigned(AfterRollback) then
        AfterRollback(Self);
    end;
  end;
end;

{-------------------------------------------------------------------------------}
{ TFDCustomEventAlerter                                                         }
{-------------------------------------------------------------------------------}
constructor TFDCustomEventAlerter.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FNames := TFDStringList.Create;
  TFDStringList(FNames).OnChange := DoNamesChanged;
  FOptionsIntf := TFDEventAlerterOptions.Create;
  FChangeHandlers := TInterfaceList.Create;
  if FDIsDesigning(Self) then
    Connection := FDFindDefaultConnection(Self);
end;

{-------------------------------------------------------------------------------}
destructor TFDCustomEventAlerter.Destroy;
begin
  Destroying;
  Connection := nil;
  inherited Destroy;
  FDFreeAndNil(FOptionsIntf);
  FDFreeAndNil(FNames);
  FDFreeAndNil(FChangeHandlers);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomEventAlerter.Notification(AComponent: TComponent;
  AOperation: TOperation);
begin
  inherited Notification(AComponent, AOperation);
  if AOperation = opRemove then
    if AComponent = Connection then
      Connection := nil;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomEventAlerter.Loaded;
begin
  inherited Loaded;
  try
    if FStreamedActive then
      SetActive(True);
  except
    if csDesigning in ComponentState then
      FDHandleException
    else
      raise;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomEventAlerter.CheckAutoRegister;
begin
  if not (csDestroying in ComponentState) and
     Options.AutoRegister and (Names.Count > 0) and
     (Connection <> nil) and Connection.Connected then
    Register;
end;

{-------------------------------------------------------------------------------}
function TFDCustomEventAlerter.GetActive: Boolean;
begin
  Result := (FEventAlerterIntf <> nil) and
    (FEventAlerterIntf.State in [esRegistered, esFiring]);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomEventAlerter.SetActive(const AValue: Boolean);
begin
  if csReading in ComponentState then
    FStreamedActive := AValue
  else if Active <> AValue then
    if AValue then
      Register
    else
      Unregister;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomEventAlerter.SetConnection(const AValue: TFDCustomConnection);
begin
  if FConnection <> AValue then begin
    if FConnection <> nil then begin
      Unregister;
      FConnection.UnRegisterClient(Self);
    end;
    FConnection := AValue;
    if FConnection <> nil then begin
      FConnection.RegisterClient(Self, DoConnectChanged);
      FConnection.FreeNotification(Self);
      CheckAutoRegister;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomEventAlerter.DoConnectChanged(Sender: TObject; Connecting: Boolean);
begin
  if Connecting then
    CheckAutoRegister
  else
    Unregister;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomEventAlerter.DoNamesChanged(ASender: TObject);
begin
  Unregister;
  CheckAutoRegister;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomEventAlerter.SetNames(const AValue: TStrings);
begin
  FNames.SetStrings(AValue);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomEventAlerter.SetSubscriptionName(const AValue: String);
begin
  if FSubscriptionName <> AValue then begin
    Unregister;
    FSubscriptionName := AValue;
    CheckAutoRegister;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomEventAlerter.SetOptions(const AValue: TFDEventAlerterOptions);
begin
  FOptionsIntf.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomEventAlerter.HandleEvent(const AEventName: String;
  const AArgument: Variant);
begin
  if Assigned(FOnAlert) then
    FOnAlert(Self, AEventName, AArgument);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomEventAlerter.HandleTimeout(var AContinue: Boolean);
begin
  if Assigned(FOnTimeout) then
    FOnTimeout(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomEventAlerter.Register;
var
  i: Integer;
begin
  if Active then
    Exit;
  FDManager.AcquireConnection(FConnection, Name);
  try
    Connection.CheckActive;
    Connection.ConnectionIntf.CreateEvent(Options.Kind, FEventAlerterIntf);
    FEventAlerterIntf.SubscriptionName := FSubscriptionName;
    FEventAlerterIntf.Options := FOptionsIntf;
    FEventAlerterIntf.Names := FNames;
    FEventAlerterIntf.Handler := Self as IFDPhysEventHandler;
    for i := 0 to FChangeHandlers.Count - 1 do
      FEventAlerterIntf.AddChangeHandler(FChangeHandlers[i] as IFDPhysChangeHandler);
    FEventAlerterIntf.Register;
  except
    FDManager.ReleaseConnection(FConnection);
    raise;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomEventAlerter.Unregister;
begin
  if not Active then
    Exit;
  FEventAlerterIntf.Options := nil;
  FEventAlerterIntf.Handler := nil;
  FEventAlerterIntf.Unregister;
  FEventAlerterIntf := nil;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomEventAlerter.Signal(const AEvent: String;
  const AArgument: Variant);
begin
  Register;
  FEventAlerterIntf.Signal(AEvent, AArgument);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomEventAlerter.Refresh(const AHandler: IFDPhysChangeHandler; AForce: Boolean);
begin
  Register;
  FEventAlerterIntf.Refresh(AHandler, AForce);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomEventAlerter.AddChangeHandler(const AHandler: IFDPhysChangeHandler);
begin
  FChangeHandlers.Add(AHandler);
  if Active then
    FEventAlerterIntf.AddChangeHandler(AHandler);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomEventAlerter.RemoveChangeHandler(const AHandler: IFDPhysChangeHandler);
begin
  FChangeHandlers.Remove(AHandler);
  if Active then
    FEventAlerterIntf.RemoveChangeHandler(AHandler);
end;

{-------------------------------------------------------------------------------}
{ TFDCustomCommand                                                              }
{-------------------------------------------------------------------------------}
constructor TFDCustomCommand.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FEnableParamsStorage := True;
  SetOptionsIntf(nil);
  FCommandText := TFDStringList.Create;
  TFDStringList(FCommandText).TrailingLineBreak := False;
  TFDStringList(FCommandText).OnChanging := DoSQLChanging;
  TFDStringList(FCommandText).OnChange := DoSQLChange;
  FMacros := TFDMacros.CreateRefCounted(GetParamsOwner);
  FMacros.OnChanged := MacrosChanged;
  FParams := TFDParams.CreateRefCounted(GetParamsOwner);
  FRowsAffected := -1;
  FActiveStoredUsage := [auDesignTime, auRunTime];
  if FDIsDesigning(Self) then
    Connection := FDFindDefaultConnection(Self);
end;

{-------------------------------------------------------------------------------}
destructor TFDCustomCommand.Destroy;
begin
  Destroying;
  Disconnect(True);
  Transaction := nil;
  inherited Destroy;
  FParams.RemRef;
  FParams := nil;
  FMacros.RemRef;
  FMacros := nil;
  if FOptionsIntf <> nil then begin
    FOptionsIntf.ObjectDestroyed(Self);
    FOptionsIntf := nil;
  end;
  FDFreeAndNil(FCommandText);
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.GetParamsOwner: TPersistent;
begin
  if FOwner <> nil then
    Result := FOwner
  else
    Result := Self;
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.GetDisplayName: String;
begin
  if FOwner <> nil then
    Result := FOwner.Name
  else
    Result := GetName;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.PropertyChange;
begin
  if (FOwner <> nil) and (FOwner is TFDAdaptedDataSet) and
     not (csDestroying in FOwner.ComponentState) then
    TFDAdaptedDataSet(FOwner).DataEvent(dePropertyChange, 0);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.Loaded;
begin
  inherited Loaded;
  try
    if DoStoredActivation then begin
      if FStreamedPrepared then
        SetPrepared(True);
      if FStreamedActive then
        SetActive(True);
    end;
  except
    if csDesigning in ComponentState then
      FDHandleException
    else
      raise;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.Notification(AComponent: TComponent;
  AOperation: TOperation);
begin
  if AOperation = opRemove then
    if AComponent = FConnection then
      SetConnection(nil)
    else if AComponent = FTransaction then
      SetTransaction(nil);
  inherited Notification(AComponent, AOperation);
end;

{-------------------------------------------------------------------------------}
{$IFDEF FireDAC_MONITOR_Comp}
procedure TFDCustomCommand.Trace(AStep: TFDMoniEventStep;
  const AMsg: String; const AArgs: array of const);
begin
  if FConnection <> nil then
    FConnection.Trace(AStep, Self, AMsg, AArgs);
end;
{$ENDIF}

{-------------------------------------------------------------------------------}
function TFDCustomCommand.CheckComponentState(AState: TComponentState): Boolean;
begin
  Result := (AState * ComponentState <> []) or
    (FOwner <> nil) and (AState * FOwner.ComponentState <> []);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.CheckInactive;
begin
  if Active then
    if CheckComponentState([csDesigning]) then
      CloseAll
    else
      FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_ClntAdaptMBInactive,
        [GetDisplayName]);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.CheckActive;
begin
  if not Active then
    FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_ClntAdaptMBActive,
      [GetDisplayName]);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.CheckUnprepared;
begin
  CheckInactive;
  Prepared := False;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.CheckAsyncProgress;
begin
  if CommandIntf <> nil then
    CommandIntf.CheckAsyncProgress;
  if (FOwner <> nil) and (FOwner.State = dsOpening) and
     ((FThreadID = 0) or (FThreadID <> TThread.CurrentThread.ThreadID)) then
    FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_AccAsyncOperInProgress, []);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.CheckPrepared;
begin
  CheckAsyncProgress;
  Prepared := True;
end;

{-------------------------------------------------------------------------------}
// IFDStanOptions

procedure TFDCustomCommand.GetParentOptions(var AOpts: IFDStanOptions);
var
  oConn: TFDCustomConnection;
begin
  if FConnection <> nil then
    AOpts := FConnection.OptionsIntf
  else begin
    oConn := GetConnection(False);
    if oConn <> nil then
      AOpts := oConn.OptionsIntf;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.SetOptionsIntf(const AValue: IFDStanOptions);
begin
  if (FOptionsIntf <> AValue) or (FOptionsIntf = nil) and (AValue = nil) then begin
    FOptionsIntf := AValue;
    if FOptionsIntf = nil then
      FOptionsIntf := TFDOptionsContainer.Create(Self, TFDFetchOptions,
        TFDBottomUpdateOptions, TFDBottomResourceOptions, GetParentOptions);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.GetFetchOptions: TFDFetchOptions;
begin
  Result := FOptionsIntf.FetchOptions;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.SetFetchOptions(const AValue: TFDFetchOptions);
begin
  FOptionsIntf.FetchOptions.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.GetFormatOptions: TFDFormatOptions;
begin
  Result := FOptionsIntf.FormatOptions;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.SetFormatOptions(const AValue: TFDFormatOptions);
begin
  FOptionsIntf.FormatOptions.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.GetUpdateOptions: TFDBottomUpdateOptions;
begin
  Result := TFDBottomUpdateOptions(FOptionsIntf.UpdateOptions);
  ASSERT((Result <> nil) and (Result is TFDBottomUpdateOptions));
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.SetUpdateOptions(const AValue: TFDBottomUpdateOptions);
begin
  FOptionsIntf.UpdateOptions.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.GetResourceOptions: TFDBottomResourceOptions;
begin
  Result := TFDBottomResourceOptions(FOptionsIntf.ResourceOptions);
  ASSERT((Result <> nil) and (Result is TFDBottomResourceOptions));
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.SetResourceOptions(const AValue: TFDBottomResourceOptions);
begin
  FOptionsIntf.ResourceOptions.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
// Other

function TFDCustomCommand.GetConnection(ACheck: Boolean): TFDCustomConnection;
begin
  if FConnection <> nil then
    Result := FConnection
  else begin
    Result := FDManager.FindConnection(ConnectionName);
    if (Result = nil) and ACheck then
      FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_ClntDBNotFound,
        [ConnectionName, GetDisplayName]);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.SetConnection(const AValue: TFDCustomConnection);
begin
  if FConnection <> AValue then begin
    CheckUnprepared;
    FConnection := AValue;
    if FConnection <> nil then begin
      FConnection.FreeNotification(Self);
      FConnectionName := FConnection.ConnectionName;
      FBindedBy := bbObject;
    end
    else begin
      FConnectionName := '';
      FBindedBy := bbNone;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.SetConnectionName(const AValue: String);
begin
  if FConnectionName <> AValue then begin
    CheckUnprepared;
    FConnectionName := AValue;
    FConnection := nil;
    FBindedBy := bbName;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.IsCNNS: Boolean;
begin
  Result := (FBindedBy = bbName);
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.IsCNS: Boolean;
begin
  Result := (FBindedBy = bbObject);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.SetTransaction(const AValue: TFDCustomTransaction);
begin
  if FTransaction <> AValue then begin
    CheckUnprepared;
    if FTransaction <> nil then
      if FOwner <> nil then
        FTransaction.FDataSets.Remove(FOwner);
    FTransaction := AValue;
    if FTransaction <> nil then begin
      FTransaction.FreeNotification(Self);
      if FOwner <> nil then
        FTransaction.FDataSets.Add(FOwner);
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.AcquireConnection: TFDCustomConnection;
begin
  if FBindedBy = bbObject then
    Result := FDManager.AcquireConnection(FConnection, GetDisplayName)
  else
    Result := FDManager.AcquireConnection(ConnectionName, GetDisplayName);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.ReleaseConnection(var AConnection: TFDCustomConnection);
begin
  FDManager.ReleaseConnection(AConnection);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.InternalCreateCommandIntf;
begin
  FConnection.ConnectionIntf.CreateCommand(FCommandIntf);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.HandleFinished(const AInitiator: IFDStanObject;
  AState: TFDStanAsyncState; AException: Exception);
var
  oFinished: TFDOperationFinishedEvent;
begin
  if Assigned(FOperationFinished) then begin
    oFinished := FOperationFinished;
    FOperationFinished := nil;
    FThreadID := TThread.CurrentThread.ThreadID;
    try
      oFinished(Self, AState, AException);
    finally
      FThreadID := 0;
      // an interface releasing is deferred in the TFDCustomCommand.SetPrepared
      // until an operation finish handler will fire
      if (FCommandIntf <> nil) and (FCommandIntf.State = csInactive) then begin
        FCommandIntf := nil;
        InternalCloseConnection;
      end;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.HandleUnprepare;
begin
  if ckPrepare in FFlags then
    Exit;
  if (CommandIntf <> nil) and (FRowsAffected = 0) and (CommandIntf.RowsAffected > 0) then
    FRowsAffected := CommandIntf.RowsAffected;
  Unprepare;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.DoBeforePrepare;
begin
  if Assigned(FBeforePrepare) then
    FBeforePrepare(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.DoAfterPrepare;
begin
  if Assigned(FAfterPrepare) then
    FAfterPrepare(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.DoBeforeUnprepare;
begin
  if Assigned(FBeforeUnprepare) then
    FBeforeUnprepare(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.DoAfterUnprepare;
begin
  if Assigned(FAfterUnprepare) then
    FAfterUnprepare(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.InternalPrepare;
begin
  if Transaction <> nil then begin
    Transaction.CheckConnected;
    CommandIntf.Transaction := Transaction.TransactionIntf;
  end;
  CommandIntf.StateHandler := Self as IFDPhysCommandStateHandler;
  CommandIntf.ErrorHandler := Self as IFDStanErrorHandler;
  CommandIntf.Options := Self as IFDStanOptions;
  if FFixedCommandKind then
    CommandIntf.CommandKind := FCommandKind;
  CommandIntf.CatalogName := FCatalogName;
  CommandIntf.SchemaName := FSchemaName;
  CommandIntf.BaseObjectName := FBaseObjectName;
  CommandIntf.Overload := FOverload;
  CommandIntf.Macros := FMacros;
  if (FCommandKind in [skStoredProc, skStoredProcWithCrs, skStoredProcNoCrs]) and
     (fiMeta in CommandIntf.Options.FetchOptions.Items) and not (ckCreateIntfDontPrepare in FFlags) then begin
    CommandIntf.Params.BindMode := FParams.BindMode;
    CommandIntf.Prepare(FCommandText.Text);
    if CommandIntf.Params <> FParams then begin
      CommandIntf.Params.AssignValues(FParams);
      FParams.Assign(CommandIntf.Params);
      CommandIntf.Params := FParams;
    end;
  end
  else begin
    CommandIntf.Params := FParams;
    if not (ckCreateIntfDontPrepare in FFlags) then
      CommandIntf.Prepare(FCommandText.Text, False)
    else
      CommandIntf.CommandText := FCommandText.Text;
  end;
  FRowsAffected := -1;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.InternalUnprepare;
begin
  if CommandIntf.State = csOpen then
    CommandIntf.CloseAll;
  if CommandIntf.State = csPrepared then
    CommandIntf.Unprepare;
  // Do not clear StateHandler, while we are inside of operation
  if not Assigned(FOperationFinished) then
    CommandIntf.StateHandler := nil;
  CommandIntf.ErrorHandler := nil;
  // Do not clear Options, it is refcounted now
  // CommandIntf.Options := nil;
  CommandIntf.Params := nil;
  CommandIntf.Macros := nil;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.InternalCloseConnection;
var
  oConn: TFDCustomConnection;
begin
  oConn := FConnection;
  if FBindedBy <> bbObject then
    FConnection := nil;
  ReleaseConnection(oConn);
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.GetPrepared: Boolean;
begin
  Result := (CommandIntf <> nil) and (CommandIntf.State <> csInactive);
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.DoStoredActivation: Boolean;
var
  eUsage: TFDStoredActivationUsage;
begin
  eUsage := FDManager.ActiveStoredUsage;
  if GetConnection(False) <> nil then
    eUsage := eUsage * GetConnection(False).ConnectedStoredUsage;
  Result := FDCheckStoredUsage(ComponentState, eUsage * ActiveStoredUsage);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.SetPrepared(const AValue: Boolean);
var
  lFull: Boolean;
  oObjIntf: IFDStanObject;
{$IFDEF FireDAC_MONITOR_Comp}
  oConn: TFDCustomConnection;
{$ENDIF}
begin
  if csReading in ComponentState then
    FStreamedPrepared := AValue
  else if not (ckPrepare in FFlags) and ((Prepared <> AValue) or
               not AValue and (CommandIntf <> nil) and (CommandIntf.Connection.State <> csRecovering)) then begin
    Include(FFlags, ckPrepare);
    try
      if AValue then begin
        DoBeforePrepare;
        lFull := (CommandIntf = nil) or (FConnection = nil);
        if lFull then
          FConnection := AcquireConnection;
{$IFDEF FireDAC_MONITOR_Comp}
        Trace(esStart, 'TFDCustomCommand.Prepare', ['Command', CommandText.Text]);
        try
          try
{$ENDIF}
            try
              FConnection.CheckActive;
              if lFull then
                InternalCreateCommandIntf;
              try
                if Supports(CommandIntf, IFDStanObject, oObjIntf) then begin
                  if FOwner <> nil then
                    oObjIntf.SetOwner(FOwner, '')
                  else
                    oObjIntf.SetOwner(Self, '');
                  oObjIntf := nil;
                end;
                InternalPrepare;
              except
                InternalUnprepare;
                FCommandIntf := nil;
                raise;
              end;
            except
              InternalCloseConnection;
              raise;
            end;
            if lFull then
              FConnection.AttachClient(Self);
{$IFDEF FireDAC_MONITOR_Comp}
          except
            on E: Exception do begin
              Trace(esProgress, 'TFDCustomCommand.Prepare - Exception',
                ['Class', E.ClassName, 'Msg', E.Message]);
              raise;
            end;
          end;
        finally
          Trace(esEnd, 'TFDCustomCommand.Prepare', ['Command', CommandText.Text]);
        end;
{$ENDIF}
        DoAfterPrepare;
      end
      else begin
        CheckAsyncProgress;
        DoBeforeUnprepare;
{$IFDEF FireDAC_MONITOR_Comp}
        oConn := FConnection;
        Trace(esStart, 'TFDCustomCommand.Unprepare', ['Command', CommandText.Text]);
        try
          try
{$ENDIF}
            if FConnection <> nil then
              FConnection.DetachClient(Self);
            try
              if FOwner <> nil then
                FOwner.Offline;
              InternalUnprepare;
            finally
              // defer interface releasing to the operation finish handler
              if not Assigned(FOperationFinished) then begin
                FCommandIntf := nil;
                InternalCloseConnection;
              end;
              if (FTableAdapter <> nil) and (FTableAdapter.SelectCommand = Self) then
                FTableAdapter.Reset;
            end;
{$IFDEF FireDAC_MONITOR_Comp}
          except
            on E: Exception do begin
              if oConn <> nil then
                oConn.Trace(esProgress, Self, 'TFDCustomCommand.Unprepare - Exception',
                  ['Class', E.ClassName, 'Msg', E.Message]);
              raise;
            end;
          end;
        finally
          if oConn <> nil then
            oConn.Trace(esEnd, Self, 'TFDCustomCommand.Unprepare',
              ['Command', CommandText.Text]);
        end;
{$ENDIF}
        DoAfterUnprepare;
      end;
      PropertyChange;
    finally
      Exclude(FFlags, ckPrepare);
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.IsPS: Boolean;
begin
  Result := Prepared and not Active;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.Prepare(const ACommandText: String = '');
begin
  if ACommandText <> '' then
    SetCommandText(ACommandText, False);
  Prepared := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.Unprepare;
begin
  Prepared := False;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.DoBeforeOpen;
begin
  if Assigned(FBeforeOpen) then
    FBeforeOpen(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.DoAfterOpen;
begin
  if Assigned(FAfterOpen) then
    FAfterOpen(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.DoBeforeClose;
begin
  if Assigned(FBeforeClose) then
    FBeforeClose(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.DoAfterClose;
begin
  if Assigned(FAfterClose) then
    FAfterClose(self);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.InternalClose(AAll: Boolean);
begin
  if not Active then
    Exit;
{$IFDEF FireDAC_MONITOR_Comp}
  Trace(esStart, 'TFDCustomCommand.InternalClose',
    ['Command', CommandText.Text, 'AAll', AAll]);
  try
    try
{$ENDIF}
      if AAll then
        CommandIntf.CloseAll
      else
        CommandIntf.Close;
{$IFDEF FireDAC_MONITOR_Comp}
    except
      on E: Exception do begin
        Trace(esProgress, 'TFDCustomCommand.InternalClose - Exception',
          ['Class', E.ClassName, 'Msg', E.Message]);
        raise;
      end;
    end;
  finally
    Trace(esEnd, 'TFDCustomCommand.InternalClose',
      ['Command', CommandText.Text, 'AAll', AAll]);
  end;
{$ENDIF}
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.InternalOpenFinished(ASender: TObject;
  AState: TFDStanAsyncState; AException: Exception);
begin
{$IFDEF FireDAC_MONITOR_Comp}
  if AException <> nil then
    Trace(esProgress, 'TFDCustomCommand.InternalOpenFinished - Exception',
      ['Class', AException.ClassName, 'Msg', AException.Message]);
  Trace(esProgress, 'TFDCustomCommand.InternalOpenFinished',
    ['Command', CommandText.Text, 'AState', Integer(AState)]);
{$ENDIF}
  if AState = asFinished then begin
    DoAfterOpen;
    if FOwner <> nil then
      TFDAdaptedDataSet(FOwner).CheckAsyncOpenComplete;
  end
  else if AState in [asFailed, asAborted, asExpired] then begin
    if FOwner <> nil then
      TFDAdaptedDataSet(FOwner).CheckAsyncOpenFailed;
  end;
end;

procedure TFDCustomCommand.InternalOpen(ABlocked: Boolean);
begin
  if Active then
    Exit;
{$IFDEF FireDAC_MONITOR_Comp}
  Trace(esStart, 'TFDCustomCommand.InternalOpen',
    ['Command', CommandText.Text, 'ABlocked', ABlocked]);
  try
    try
{$ENDIF}
      FOperationFinished := InternalOpenFinished;
      CommandIntf.Open(ABlocked);
{$IFDEF FireDAC_MONITOR_Comp}
    except
      on E: Exception do begin
        Trace(esProgress, 'TFDCustomCommand.InternalOpen - Exception',
          ['Class', E.ClassName, 'Msg', E.Message]);
        raise;
      end;
    end;
  finally
    Trace(esEnd, 'TFDCustomCommand.InternalOpen',
      ['Command', CommandText.Text, 'ABlocked', ABlocked]);
  end;
{$ENDIF}
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.GetActive: Boolean;
begin
  Result := Prepared and (CommandIntf.State = csOpen);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.SetActiveBase(const AValue, ABlocked: Boolean);
begin
  if csReading in ComponentState then
    FStreamedActive := AValue
  else if Active <> AValue then
    if AValue then begin
      CheckPrepared;
      DoBeforeOpen;
      InternalOpen(ABlocked);
    end
    else begin
      CheckAsyncProgress;
      DoBeforeClose;
      InternalClose(False);
      DoAfterClose;
    end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.SetActive(const AValue: Boolean);
begin
  SetActiveBase(AValue, False);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.Open(ABlocked: Boolean = False);
begin
  SetActiveBase(True, ABlocked);
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.OpenOrExecute(ABlocked: Boolean = False): Boolean;
begin
  try
    Open(ABlocked);
  except
    on E: EFDException do
      if E.FDCode <> er_FD_AccCmdMHRowSet then
        raise;
  end;
  Result := Active;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.Close;
begin
  Active := False;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.CloseAll;
begin
  if Active then begin
    CheckAsyncProgress;
    DoBeforeClose;
    InternalClose(True);
    DoAfterClose;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.AbortJob(AWait: Boolean = False);
begin
  if GetState in [csExecuting, csFetching] then
    CommandIntf.AbortJob(AWait);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.Disconnect(AAbortJob: Boolean = False);
begin
  if AAbortJob then
    AbortJob(True);
  Active := False;
  Prepared := False;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.DoBeforeExecute;
begin
  if Assigned(FBeforeExecute) then
    FBeforeExecute(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.DoAfterExecute;
begin
  if Assigned(FAfterExecute) then
    FAfterExecute(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.InternalExecuteFinished(ASender: TObject;
  AState: TFDStanAsyncState; AException: Exception);
begin
  if CommandIntf <> nil then
    FRowsAffected := CommandIntf.RowsAffected;
{$IFDEF FireDAC_MONITOR_Comp}
  if AException <> nil then
    Trace(esProgress, 'TFDCustomCommand.InternalExecuteFinished - Exception',
      ['Class', AException.ClassName, 'Msg', AException.Message]);
  Trace(esProgress, 'TFDCustomCommand.InternalExecuteFinished',
    ['Command', CommandText.Text, 'AState', Integer(AState),
     'FRowsAffected', FRowsAffected]);
{$ENDIF}
  if CommandKind in [skCreate, skAlter, skDrop,
                     skStartTransaction, skCommit, skRollback,
                     skSet, skSetSchema] then
    Unprepare;
  if AState = asFinished then begin
    DoAfterExecute;
    if FOwner <> nil then
      TFDAdaptedDataSet(FOwner).CheckAsyncExecFinished;
  end;
end;

procedure TFDCustomCommand.InternalExecute(ATimes: Integer; AOffset: Integer;
  ABlocked: Boolean);
begin
{$IFDEF FireDAC_MONITOR_Comp}
  Trace(esStart, 'TFDCustomCommand.InternalExecute',
    ['Command', CommandText.Text, 'ATimes', ATimes, 'AOffset', AOffset,
     'ABlocked', ABlocked]);
  try
    try
{$ENDIF}
      FRowsAffected := -1;
      FOperationFinished := InternalExecuteFinished;
      CommandIntf.Execute(ATimes, AOffset, ABlocked);
{$IFDEF FireDAC_MONITOR_Comp}
    except
      on E: Exception do begin
        Trace(esProgress, 'TFDCustomCommand.InternalExecute - Exception',
          ['Class', E.ClassName, 'Msg', E.Message]);
        raise;
      end;
    end;
  finally
    Trace(esEnd, 'TFDCustomCommand.InternalExecute',
      ['Command', CommandText.Text, 'ATimes', ATimes, 'AOffset', AOffset,
       'ABlocked', ABlocked]);
  end;
{$ENDIF}
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.Execute(ATimes: Integer = 0; AOffset: Integer = 0;
  ABlocked: Boolean = False);
begin
  CheckPrepared;
  DoBeforeExecute;
  InternalExecute(ATimes, AOffset, ABlocked);
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.Execute(const ASQL: String;
  const AParams: array of Variant; const ATypes: array of TFieldType): LongInt;
var
  i: Integer;
begin
  Close;
  if ASQL <> '' then
    SetCommandText(ASQL, ResourceOptions.ParamCreate);
  if Params.BindMode = pbByNumber then
    for i := 0 to Params.Count - 1 do
      Params[i].Position := i + 1;
  for i := Low(ATypes) to High(ATypes) do
    if ATypes[i] <> ftUnknown then
      Params[i].DataType := ATypes[i];
  for i := Low(AParams) to High(AParams) do
    Params[i].Value := AParams[i];
  Prepare;
  Execute(1, 0);
  Result := RowsAffected;
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.Execute(const ASQL: String): LongInt;
begin
  Result := Execute(ASQL, [], []);
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.Execute(const ASQL: String;
  const AParams: array of Variant): LongInt;
begin
  Result := Execute(ASQL, AParams, []);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.NextRecordSet;
begin
  CheckPrepared;
  CommandIntf.NextRecordSet := True;
  try
    Close;
    PropertyChange;
    Open;
  finally
    CommandIntf.NextRecordSet := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.CloseStreams;
begin
  if CommandIntf <> nil then
    CommandIntf.CloseStreams;
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.GetCommandKind: TFDPhysCommandKind;
begin
  if (CommandIntf <> nil) and not FFixedCommandKind then
    Result := CommandIntf.CommandKind
  else
    Result := FCommandKind;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.SetCommandKind(const AValue: TFDPhysCommandKind);
begin
  if FCommandKind <> AValue then begin
    CheckUnprepared;
    FCommandKind := AValue;
    FFixedCommandKind := (AValue <> skUnknown);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.IsCKS: Boolean;
begin
  Result := FFixedCommandKind and (CommandKind <> skUnknown);
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.GetState: TFDPhysCommandState;
begin
  if CommandIntf <> nil then
    Result := CommandIntf.State
  else
    Result := csInactive;
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.GetSQLText: String;
begin
  if CommandIntf <> nil then
    Result := CommandIntf.SQLText
  else
    Result := '';
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.SetOverload(const AValue: Word);
begin
  if FOverload <> AValue then begin
    CheckUnprepared;
    FOverload := AValue;
    if not CheckComponentState([csReading]) then
      FParams.Clear;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.SetBaseObjectName(const AValue: String);
begin
  if FBaseObjectName <> AValue then begin
    CheckUnprepared;
    FBaseObjectName := AValue;
    if not CheckComponentState([csReading]) then
      FParams.Clear;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.SetSchemaName(const AValue: String);
begin
  if FSchemaName <> AValue then begin
    CheckUnprepared;
    FSchemaName := AValue;
    if not CheckComponentState([csReading]) then
      FParams.Clear;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.SetCatalogName(const AValue: String);
begin
  if FCatalogName <> AValue then begin
    CheckUnprepared;
    FCatalogName := AValue;
    if not CheckComponentState([csReading]) then
      FParams.Clear;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.SetParamBindMode(const AValue: TFDParamBindMode);
begin
  if FParams.BindMode <> AValue then begin
    CheckUnprepared;
    FParams.BindMode := AValue;
    if not CheckComponentState([csReading]) then
      FParams.Clear;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.GetParamBindMode: TFDParamBindMode;
begin
  Result := FParams.BindMode;
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.Define(ATable: TFDDatSTable;
  AMetaInfoMergeMode: TFDPhysMetaInfoMergeMode): TFDDatSTable;
begin
  CheckPrepared;
  Result := CommandIntf.Define(ATable, AMetaInfoMergeMode);
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.Define(ASchema: TFDDatSManager;
  ATable: TFDDatSTable; AMetaInfoMergeMode: TFDPhysMetaInfoMergeMode): TFDDatSTable;
begin
  CheckPrepared;
  if CommandKind = skStoredProc then begin
    FCommandKind := skStoredProcWithCrs;
    CommandIntf.CommandKind := skStoredProcWithCrs;
  end;
  Result := CommandIntf.Define(ASchema, ATable, AMetaInfoMergeMode);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.DoBeforeFetch;
begin
  if Assigned(FBeforeFetch) then
    FBeforeFetch(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.DoAfterFetch;
begin
  if Assigned(FAfterFetch) then
    FAfterFetch(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.FetchFinished(ASender: TObject;
  AState: TFDStanAsyncState; AException: Exception);
begin
  if CommandIntf <> nil then
    FRowsAffected := CommandIntf.RowsAffected;
{$IFDEF FireDAC_MONITOR_Comp}
  if AException <> nil then
    Trace(esProgress, 'TFDCustomCommand.FetchFinished - Exception',
      ['Class', AException.ClassName, 'Msg', AException.Message]);
  Trace(esProgress, 'TFDCustomCommand.FetchFinished',
    ['Command', CommandText.Text, 'AState', Integer(AState),
     'FRowsAffected', FRowsAffected]);
{$ENDIF}
  if AState = asFinished then
    DoAfterFetch;
end;

procedure TFDCustomCommand.Fetch(ATable: TFDDatSTable; AAll: Boolean = True;
  ABlocked: Boolean = False);
begin
  CheckActive;
  DoBeforeFetch;
{$IFDEF FireDAC_MONITOR_Comp}
  Trace(esStart, 'TFDCustomCommand.Fetch',
    ['Command', CommandText.Text, 'AAll', AAll, 'ABlocked', ABlocked]);
  try
    try
{$ENDIF}
      FRowsAffected := 0;
      FOperationFinished := FetchFinished;
      CommandIntf.Fetch(ATable, AAll, ABlocked);
{$IFDEF FireDAC_MONITOR_Comp}
    except
      on E: Exception do begin
        Trace(esProgress, 'TFDCustomCommand.Fetch - Exception',
          ['Class', E.ClassName, 'Msg', E.Message]);
        raise;
      end;
    end;
  finally
    Trace(esEnd, 'TFDCustomCommand.Fetch',
      ['Command', CommandText.Text, 'AAll', AAll, 'ABlocked', ABlocked]);
  end;
{$ENDIF}
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.SetCommandTextStrs(const AValue: TStrings);
begin
  if FCommandText <> AValue then
    FCommandText.SetStrings(AValue);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.SetCommandText(const ASQL: String; AResetParams: Boolean);
begin
  if (CommandText.Count = 1) and (CommandText[0] = ASQL) then
    Exit;
  CommandText.BeginUpdate;
  try
    if AResetParams then
      Params.Clear;
    CommandText.Clear;
    CommandText.Add(ASQL);
  finally
    CommandText.EndUpdate;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.SetMacros(const AValue: TFDMacros);
begin
  if AValue <> FMacros then
    FMacros.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.SetParams(const AValue: TFDParams);
begin
  if AValue <> FParams then
    FParams.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.PreprocessSQL(const ASQL: String; AParams: TFDParams;
  AMacrosUpd, AMacrosRead: TFDMacros; ACreateParams, ACreateMacros, AExpandMacros,
  AExpandEscape, AParseSQL: Boolean; var ACommandKind: TFDPhysCommandKind;
  var AFrom: String);
var
  oConMeta: IFDPhysConnectionMetadata;
  oPrep: TFDPhysPreprocessor;
begin
  if not ACreateParams and not ACreateMacros and not AParseSQL then
    Exit;
  oPrep := TFDPhysPreprocessor.Create;
  try
    oPrep.Params := AParams;
    oPrep.MacrosUpd := AMacrosUpd;
    oPrep.MacrosRead := AMacrosRead;
    oPrep.Source := ASQL;
    oPrep.DesignMode := CheckComponentState([csDesigning]);
    oPrep.Instrs := [];
    oPrep.ConnMetadata := GetConnectionMetadata;
    if oPrep.ConnMetadata = nil then begin
      FDPhysManager.CreateDefaultConnectionMetadata(oConMeta);
      oPrep.ConnMetadata := oConMeta;
    end;
    if ACreateParams then
      oPrep.Instrs := oPrep.Instrs + [piCreateParams];
    if ACreateMacros then
      oPrep.Instrs := oPrep.Instrs + [piCreateMacros];
    if AExpandMacros then
      oPrep.Instrs := oPrep.Instrs + [piExpandMacros];
    if AExpandEscape then
      oPrep.Instrs := oPrep.Instrs + [piExpandEscapes];
    if AParseSQL then
      oPrep.Instrs := oPrep.Instrs + [piParseSQL];
    oPrep.Execute;
    ACommandKind := oPrep.SQLCommandKind;
    AFrom := oPrep.SQLFromValue;
  finally
    FDFree(oPrep);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.FillParams(AParams: TFDParams; const ASQL: String = '');
var
  oConn: TFDCustomConnection;
  oGen: IFDPhysCommandGenerator;
  eCmdKind: TFDPhysCommandKind;
  s: String;
  oRes: TFDResourceOptions;
begin
  if ASQL = '' then
    s := Trim(CommandText.Text)
  else
    s := ASQL;
  if CommandKind in [skStoredProc, skStoredProcWithCrs, skStoredProcNoCrs] then begin
    oConn := AcquireConnection;
    try
      oConn.CheckActive;
      oConn.ConnectionIntf.CreateCommandGenerator(oGen, nil);
      oGen.Params := AParams;
      oGen.Options := Self as IFDStanOptions;
      oGen.GenerateStoredProcParams(CatalogName, SchemaName, BaseObjectName, s);
    finally
      ReleaseConnection(oConn);
    end;
  end
  else begin
    eCmdKind := skUnknown;
    oRes := ResourceOptions;
    PreprocessSQL(s, AParams, nil, nil, True, False, oRes.MacroExpand,
      oRes.EscapeExpand, False, eCmdKind, s);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.DoSQLChanging(ASender: TObject);
begin
  CheckAsyncProgress;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.DoSQLChange(ASender: TObject);
var
  oPList: TFDParams;
  oMList: TFDMacros;
  eCmdKind: TFDPhysCommandKind;
  lPCreate, lMCreate, lMExpand, lEExpand: Boolean;
  sFrom: String;
  oRes: TFDResourceOptions;
begin
  if CheckComponentState([csReading]) or TFDStringList(CommandText).Updating or
     (ckLockParse in FFlags) then
    Exit;
  if FOwner <> nil then
    FOwner.Disconnect
  else
    Disconnect;
  oRes := GetResourceOptions;
  lPCreate := oRes.ParamCreate;
  lMCreate := oRes.MacroCreate and not (ckMacros in FFlags);
  lMExpand := oRes.MacroExpand;
  lEExpand := oRes.EscapeExpand;
  if lPCreate or lMCreate or CheckComponentState([csDesigning]) then begin
    oPList := nil;
    if lPCreate then begin
      oPList := TFDParams.CreateRefCounted(GetParamsOwner);
      oPList.BindMode := FParams.BindMode;
    end;
    oMList := nil;
    if lMCreate then
      oMList := TFDMacros.CreateRefCounted(GetParamsOwner);
    Include(FFlags, ckLockParse);
    try
      try
        eCmdKind := skUnknown;
        PreprocessSQL(FCommandText.Text, oPList, oMList, FMacros, lPCreate,
          lMCreate, lMExpand, lEExpand, False, eCmdKind, sFrom);
        if not FFixedCommandKind then
          FCommandKind := eCmdKind;
        if lPCreate then begin
          oPList.AssignValues(FParams);
          FParams.Assign(oPList);
        end;
        if lMCreate then begin
          oMList.AssignValues(FMacros);
          FMacros.Assign(oMList);
        end;
      finally
        if lPCreate then
          oPList.RemRef;
        if lMCreate then
          oMList.RemRef;
      end;
    finally
      Exclude(FFlags, ckLockParse);
    end;
  end;
  Include(FFlags, ckLockParse);
  try
    if Assigned(FOnCommandChanged) then
      FOnCommandChanged(Self);
  finally
    Exclude(FFlags, ckLockParse);
  end;
  PropertyChange;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.MacrosChanged(ASender: TObject);
begin
  if FCommandText.Count > 0 then
    try
      Include(FFlags, ckMacros);
      DoSQLChange(nil);
    finally
      Exclude(FFlags, ckMacros);
    end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.FindParam(const AValue: string): TFDParam;
begin
  Result := FParams.FindParam(AValue);
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.ParamByName(const AValue: string): TFDParam;
begin
  Result := FParams.ParamByName(AValue);
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.FindMacro(const AValue: string): TFDMacro;
begin
  Result := FMacros.FindMacro(AValue);
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.MacroByName(const AValue: string): TFDMacro;
begin
  Result := FMacros.MacroByName(AValue);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.HandleException(const AInitiator: IFDStanObject;
  var AException: Exception);
var
  oInit: IFDStanObject;
begin
  if AInitiator = nil then begin
    if (FOwner = nil) or not Supports(TObject(FOwner), IFDStanObject, oInit) then
      oInit := Self as IFDStanObject;
  end
  else
    oInit := AInitiator;
  if Assigned(FOnError) then
    FOnError(Self, oInit as TObject, AException);
  if (Connection <> nil) and (AException <> nil) then
    Connection.HandleException(oInit, AException);
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.GetConnectionMetadata: IFDPhysConnectionMetadata;
var
  oConn: TFDCustomConnection;
begin
  oConn := GetConnection(False);
  if oConn <> nil then
    Result := oConn.GetConnectionMetadata
  else
    Result := nil;
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.GetName: TComponentName;
begin
  if Name = '' then
    Result := '$' + IntToHex(Integer(Self), 8)
  else
    Result := Name;
  Result := Result + ': ' + ClassName;
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.GetParent: IFDStanObject;
begin
  Result := GetConnection(False) as IFDStanObject;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.AfterReuse;
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.BeforeReuse;
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.SetOwner(const AOwner: TObject;
  const ARole: TComponentName);
begin
  // nothing
                                                                                 
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.DefineProperties(AFiler: TFiler);

  function AreParamsStorable(AFiler: TFiler): Boolean;
  begin
    if not FEnableParamsStorage then
      Result := False
    else begin
      Result := Params.Count > 0;
      if AFiler.Ancestor <> nil then
        if AFiler.Ancestor is TFDCustomCommand then
          Result := not Params.IsEqual(TFDCustomCommand(AFiler.Ancestor).Params)
        else if AFiler.Ancestor is TFDRdbmsDataSet then
          Result := not Params.IsEqual(TFDRdbmsDataSet(AFiler.Ancestor).Params);
    end;
  end;

  function AreMacrosStorable(AFiler: TFiler): Boolean;
  begin
    if not FEnableParamsStorage then
      Result := False
    else begin
      Result := Macros.Count > 0;
      if AFiler.Ancestor <> nil then
        if AFiler.Ancestor is TFDCustomCommand then
          Result := not Macros.IsEqual(TFDCustomCommand(AFiler.Ancestor).Macros)
        else if AFiler.Ancestor is TFDRdbmsDataSet then
          Result := not Macros.IsEqual(TFDRdbmsDataSet(AFiler.Ancestor).Macros);
    end;
  end;

begin
  AFiler.DefineProperty('ParamData', ReadParams, WriteParams, AreParamsStorable(AFiler));
  AFiler.DefineProperty('MacroData', ReadMacros, WriteMacros, AreMacrosStorable(AFiler));
  AFiler.DefineProperty('Prepared', ReadPrepared, nil, False);
  if FOwner = nil then
    inherited DefineProperties(AFiler);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.WriteCollection(AWriter: TWriter; ACollection: TCollection);
var
  sPropPath: String;
begin
  sPropPath := __TWriter(AWriter).FPropPath;
  try
    if (FOwner <> nil) and (csSubComponent in FOwner.ComponentStyle) or
       (FOwner = nil) and (csSubComponent in ComponentStyle) then
      __TWriter(AWriter).FPropPath := '';
    AWriter.WriteCollection(ACollection);
  finally
    __TWriter(AWriter).FPropPath := sPropPath;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.ReadCollection(AReader: TReader; ACollection: TCollection);
begin
  AReader.ReadValue;
  AReader.ReadCollection(ACollection);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.ReadParams(Reader: TReader);
begin
  ReadCollection(Reader, Params);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.WriteParams(Writer: TWriter);
begin
  WriteCollection(Writer, Params);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.ReadMacros(Reader: TReader);
begin
  ReadCollection(Reader, Macros);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.WriteMacros(Writer: TWriter);
begin
  WriteCollection(Writer, Macros);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.ReadPrepared(Reader: TReader);
begin
  Reader.ReadBoolean;
end;

{-------------------------------------------------------------------------------}
function TFDCustomCommand.GetValues(const AParamNames: String): Variant;
begin
  Result := Params.ParamValues[AParamNames];
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomCommand.SetValues(const AParamNames: String; const AValue: Variant);
begin
  Params.ParamValues[AParamNames] := AValue;
end;

{-------------------------------------------------------------------------------}
{ TFDMetaInfoCommand                                                            }
{-------------------------------------------------------------------------------}
constructor TFDMetaInfoCommand.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMetaInfoKind := mkTables;
  FTableKinds := [tkSynonym, tkTable, tkView];
  FObjectScopes := [osMy];
  UpdateOptions.ReadOnly := True;
  FEnableParamsStorage := False;
end;

{-------------------------------------------------------------------------------}
procedure TFDMetaInfoCommand.InternalCreateCommandIntf;
var
  oMetaInfoCmd: IFDPhysMetaInfoCommand;
begin
  FConnection.ConnectionIntf.CreateMetaInfoCommand(oMetaInfoCmd);
  FCommandIntf := oMetaInfoCmd as IFDPhysCommand;
end;

{-------------------------------------------------------------------------------}
procedure TFDMetaInfoCommand.InternalPrepare;
var
  oCmd: IFDPhysMetaInfoCommand;
begin
  oCmd := CommandIntf as IFDPhysMetaInfoCommand;
  oCmd.MetaInfoKind := FMetaInfoKind;
  oCmd.TableKinds := FTableKinds;
  oCmd.Wildcard := FWildcard;
  oCmd.ObjectScopes := FObjectScopes;
  inherited InternalPrepare;
end;

{-------------------------------------------------------------------------------}
procedure TFDMetaInfoCommand.DoAfterClose;
begin
  try
    inherited DoAfterClose;
  finally
    Prepared := False;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDMetaInfoCommand.GetObjectName: String;
begin
  Result := Trim(CommandText.Text);
end;

{-------------------------------------------------------------------------------}
procedure TFDMetaInfoCommand.SetObjectName(const AValue: String);
begin
  SetCommandText(AValue, False);
end;

{-------------------------------------------------------------------------------}
procedure TFDMetaInfoCommand.SetMetaInfoKind(const AValue: TFDPhysMetaInfoKind);
begin
  CheckUnprepared;
  FMetaInfoKind := AValue;
end;

{-------------------------------------------------------------------------------}
procedure TFDMetaInfoCommand.SetTableKinds(const AValue: TFDPhysTableKinds);
begin
  CheckUnprepared;
  FTableKinds := AValue;
end;

{-------------------------------------------------------------------------------}
procedure TFDMetaInfoCommand.SetWildcard(const AValue: String);
begin
  CheckUnprepared;
  FWildcard := AValue;
end;

{-------------------------------------------------------------------------------}
procedure TFDMetaInfoCommand.SetObjectScopes(const AValue: TFDPhysObjectScopes);
begin
  CheckUnprepared;
  FObjectScopes := AValue;
end;

{-------------------------------------------------------------------------------}
{ TFDCustomTableAdapter                                                         }
{-------------------------------------------------------------------------------}
constructor TFDCustomTableAdapter.Create(AOwner: TComponent);
var
  oAdapt: IFDDAptTableAdapter;
begin
  inherited Create(AOwner);
  FDCreateInterface(IFDDAptTableAdapter, oAdapt);
  SetTableAdapterIntf(oAdapt, True);
end;

{-------------------------------------------------------------------------------}
destructor TFDCustomTableAdapter.Destroy;
begin
  Destroying;
  SelectCommand := nil;
  InsertCommand := nil;
  UpdateCommand := nil;
  DeleteCommand := nil;
  LockCommand := nil;
  UnLockCommand := nil;
  FetchRowCommand := nil;
  SchemaAdapter := nil;
  inherited Destroy;
  if FTableAdapterIntf <> nil then begin
    FTableAdapterIntf.DatSTable := nil;
    SetTableAdapterIntf(nil, True);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.SetTableAdapterIntf(const AAdapter: IFDDAptTableAdapter;
  AOwned: Boolean);
begin
  if FTableAdapterIntf <> nil then begin
    FTableAdapterIntf.ErrorHandler := nil;
    FTableAdapterIntf.UpdateHandler := nil;
    FTableAdapterIntf.ColumnMappings.SetOwner(nil);
  end;
  FTableAdapterIntf := AAdapter;
  FTableAdapterOwned := AOwned;
  if FTableAdapterIntf <> nil then begin
    FTableAdapterIntf.ErrorHandler := Self as IFDStanErrorHandler;
    FTableAdapterIntf.UpdateHandler := Self as IFDDAptUpdateHandler;
    FTableAdapterIntf.ColumnMappings.SetOwner(Self);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.Notification(AComponent: TComponent;
  AOperation: TOperation);
begin
  inherited Notification(AComponent, AOperation);
  if AOperation = opRemove then
    if UpdateTransaction = AComponent then
      UpdateTransaction := nil
    else if SelectCommand = AComponent then
      SelectCommand := nil
    else if InsertCommand = AComponent then
      InsertCommand := nil
    else if UpdateCommand = AComponent then
      UpdateCommand := nil
    else if DeleteCommand = AComponent then
      DeleteCommand := nil
    else if LockCommand = AComponent then
      LockCommand := nil
    else if UnLockCommand = AComponent then
      UnLockCommand := nil
    else if FetchRowCommand = AComponent then
      FetchRowCommand := nil
    else if SchemaAdapter = AComponent then
      SchemaAdapter := nil;
end;

{-------------------------------------------------------------------------------}
function TFDCustomTableAdapter.GetSender: TObject;
begin
  if Assigned(DataSet) then
    Result := DataSet
  else
    Result := Self;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.HandleException(
  const AInitiator: IFDStanObject; var AException: Exception);
begin
  if Assigned(DataSet) then
    DataSet.InternalUpdateErrorHandler(GetSender, AInitiator, AException);
  if (AException <> nil) and Assigned(FOnError) then
    FOnError(GetSender, AInitiator as TObject, AException);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.ReconcileRow(ARow: TFDDatSRow;
  var AAction: TFDDAptReconcileAction);
begin
  if Assigned(DataSet) then
    DataSet.InternalReconcileErrorHandler(GetSender, ARow, AAction);
  if Assigned(FOnReconcileRow) then
    FOnReconcileRow(GetSender, ARow, AAction);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.UpdateRow(ARow: TFDDatSRow;
  ARequest: TFDUpdateRequest; AUpdRowOptions: TFDUpdateRowOptions;
  var AAction: TFDErrorAction);
begin
  if Assigned(DataSet) then
    DataSet.InternalUpdateRecordHandler(GetSender, ARow, ARequest,
      AUpdRowOptions, AAction);
  if Assigned(FOnUpdateRow) then
    FOnUpdateRow(GetSender, ARow, ARequest, AUpdRowOptions, AAction);
end;

{-------------------------------------------------------------------------------}
function TFDCustomTableAdapter.GetActualTransaction: TFDCustomTransaction;
var
  oConn: TFDCustomConnection;
begin
  if SelectCommand = nil then
    Result := nil
  else if SelectCommand.Transaction <> nil then
    Result := SelectCommand.Transaction
  else begin
    oConn := SelectCommand.GetConnection(False);
    Result := oConn.Transaction;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomTableAdapter.GetActualUpdateTransaction: TFDCustomTransaction;
var
  oConn: TFDCustomConnection;
begin
  if UpdateTransaction <> nil then
    Result := UpdateTransaction
  else if SelectCommand = nil then
    Result := nil
  else begin
    oConn := SelectCommand.GetConnection(False);
    if oConn.UpdateTransaction <> nil then
      Result := oConn.UpdateTransaction
    else
      Result := GetActualTransaction;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.InternalUpdateTransaction;
var
  oUpdTX: TFDCustomTransaction;
begin
  oUpdTX := GetActualUpdateTransaction;
  if oUpdTX <> nil then begin
    oUpdTX.CheckConnected;
    FTableAdapterIntf.UpdateTransaction := oUpdTX.TransactionIntf;
  end
  else
    FTableAdapterIntf.UpdateTransaction := nil;
end;

{-------------------------------------------------------------------------------}
function TFDCustomTableAdapter.InternalUpdateAdapterCmd(ACmd: TFDActionRequest): Boolean;
var
  oCmd: TFDCustomCommand;
begin
  Result := True;
  oCmd := GetCommand(ACmd);
  if oCmd <> nil then begin
    if oCmd.CommandIntf = nil then begin
      if ACmd = arSelect then
        oCmd.Transaction := GetActualTransaction
      else
        oCmd.Transaction := GetActualUpdateTransaction;
      if oCmd.CommandText.Count > 0 then begin
        Include(oCmd.FFlags, ckCreateIntfDontPrepare);
        try
          oCmd.Prepare;
        finally
          Exclude(oCmd.FFlags, ckCreateIntfDontPrepare);
        end;
      end;
    end;
    if oCmd.CommandIntf <> nil then begin
      SetAdapterCmd(oCmd.CommandIntf, ACmd);
      Result := False;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.UpdateAdapterCmd(ACmd: TFDActionRequest);
begin
  if InternalUpdateAdapterCmd(ACmd) then
    InternalUpdateTransaction;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.UpdateAdapterCmds(const ACmds: array of TFDActionRequest);
var
  i: Integer;
  lUpdated, lUpdateTX: Boolean;
begin
  lUpdateTX := False;
  for i := Low(ACmds) to High(ACmds) do begin
    lUpdated := InternalUpdateAdapterCmd(ACmds[i]);
    lUpdateTX := lUpdateTX or lUpdated;
  end;
  if lUpdateTX then
    InternalUpdateTransaction;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.SetAdapterCmd(const ACmd: IFDPhysCommand;
  ACmdKind: TFDActionRequest);
begin
  case ACmdKind of
  arSelect:   FTableAdapterIntf.SelectCommand := ACmd;
  arInsert:   FTableAdapterIntf.InsertCommand := ACmd;
  arUpdate:   FTableAdapterIntf.UpdateCommand := ACmd;
  arDelete:   FTableAdapterIntf.DeleteCommand := ACmd;
  arLock:     FTableAdapterIntf.LockCommand := ACmd;
  arUnlock:   FTableAdapterIntf.UnLockCommand := ACmd;
  arFetchRow: FTableAdapterIntf.FetchRowCommand := ACmd;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomTableAdapter.GetCommand(ACmdKind: TFDActionRequest): TFDCustomCommand;
begin
  case ACmdKind of
  arSelect:   Result := SelectCommand;
  arInsert:   Result := InsertCommand;
  arUpdate:   Result := UpdateCommand;
  arDelete:   Result := DeleteCommand;
  arLock:     Result := LockCommand;
  arUnlock:   Result := UnLockCommand;
  arFetchRow: Result := FetchRowCommand;
  else        Result := nil;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.SetCommand(var AVar: TFDCustomCommand;
  const AValue: TFDCustomCommand; ACmdKind: TFDActionRequest);
begin
  if AVar <> nil then begin
    AVar.FTableAdapter := nil;
    AVar.RemoveFreeNotification(Self);
    SetAdapterCmd(nil, ACmdKind);
  end;
  AVar := AValue;
  if AVar <> nil then begin
    AVar.FTableAdapter := Self;
    AVar.FreeNotification(Self);
    if AVar.CommandIntf <> nil then
      SetAdapterCmd(AVar.CommandIntf, ACmdKind);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomTableAdapter.Define: TFDDatSTable;
begin
  UpdateAdapterCmd(arSelect);
  Result := FTableAdapterIntf.Define;
  if (Result <> nil) and (FAdaptedDataSet <> nil) and (FAdaptedDataSet.Name <> '') and
     (DatSTableName = SourceRecordSetName) then
    Result.Name := FAdaptedDataSet.Name;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.Fetch(AAll: Boolean);
begin
  UpdateAdapterCmd(arSelect);
  // Call TFDCustomCommand.Fetch here to properly handle async commands
  FSelectCommand.Fetch(FTableAdapterIntf.DatSTable, AAll, True);
end;

{-------------------------------------------------------------------------------}
function TFDCustomTableAdapter.ApplyUpdates(AMaxErrors: Integer): Integer;
begin
  UpdateAdapterCmds([arInsert, arUpdate, arDelete, arLock, arUnlock, arFetchRow]);
  Result := FTableAdapterIntf.Update(AMaxErrors);
end;

{-------------------------------------------------------------------------------}
function TFDCustomTableAdapter.Reconcile: Boolean;
begin
  Result := FTableAdapterIntf.Reconcile;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.Fetch(ARow: TFDDatSRow;
  var AAction: TFDErrorAction; AColumn: Integer;
  ARowOptions: TFDPhysFillRowOptions);
begin
  UpdateAdapterCmd(arFetchRow);
  FTableAdapterIntf.Fetch(ARow, AAction, AColumn, ARowOptions);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.Update(ARow: TFDDatSRow;
  var AAction: TFDErrorAction; AUpdRowOptions: TFDUpdateRowOptions;
  AForceRequest: TFDActionRequest);
begin
  if AForceRequest = arFromRow then
    UpdateAdapterCmds([arInsert, arUpdate, arDelete, arLock, arUnlock, arFetchRow])
  else if AForceRequest in [arInsert, arUpdate] then
    UpdateAdapterCmds([AForceRequest, arFetchRow])
  else
    UpdateAdapterCmd(AForceRequest);
  FTableAdapterIntf.Update(ARow, AAction, AUpdRowOptions, AForceRequest);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.Lock(ARow: TFDDatSRow;
  var AAction: TFDErrorAction; AUpdRowOptions: TFDUpdateRowOptions);
begin
  UpdateAdapterCmd(arLock);
  FTableAdapterIntf.Update(ARow, AAction, AUpdRowOptions, arLock);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.UnLock(ARow: TFDDatSRow;
  var AAction: TFDErrorAction; AUpdRowOptions: TFDUpdateRowOptions);
begin
  UpdateAdapterCmd(arUnLock);
  FTableAdapterIntf.Update(ARow, AAction, AUpdRowOptions, arUnlock);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.SetUpdateTransaction(const AValue: TFDCustomTransaction);
begin
  if FUpdateTransaction <> AValue then begin
    FUpdateTransaction := AValue;
    if FUpdateTransaction <> nil then
      FUpdateTransaction.FreeNotification(Self);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.SetDeleteCommand(const AValue: TFDCustomCommand);
begin
  SetCommand(FDeleteCommand, AValue, arDelete);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.SetFetchRowCommand(const AValue: TFDCustomCommand);
begin
  SetCommand(FFetchRowCommand, AValue, arFetchRow);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.SetInsertCommand(const AValue: TFDCustomCommand);
begin
  SetCommand(FInsertCommand, AValue, arInsert);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.SetLockCommand(const AValue: TFDCustomCommand);
begin
  SetCommand(FLockCommand, AValue, arLock);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.SetSelectCommand(const AValue: TFDCustomCommand);
begin
  SetCommand(FSelectCommand, AValue, arSelect);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.SetUnLockCommand(const AValue: TFDCustomCommand);
begin
  SetCommand(FUnLockCommand, AValue, arUnLock);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.SetUpdateCommand(const AValue: TFDCustomCommand);
begin
  SetCommand(FUpdateCommand, AValue, arUpdate);
end;

{-------------------------------------------------------------------------------}
function TFDCustomTableAdapter.GetColumnMappings: TFDDAptColumnMappings;
begin
  Result := FTableAdapterIntf.ColumnMappings;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.SetColumnMappings(const AValue: TFDDAptColumnMappings);
begin
  FTableAdapterIntf.ColumnMappings.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
function TFDCustomTableAdapter.IsCMS: Boolean;
begin
  Result := ColumnMappings.Count > 0;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.SetSchemaAdapter(const AValue: TFDCustomSchemaAdapter);
var
  oAdapt: IFDDAptTableAdapter;
begin
  if FSchemaAdapter <> AValue then begin
    if FSchemaAdapter <> nil then begin
      FSchemaAdapter.FTableAdapters.Remove(Self);
      FSchemaAdapter.RemoveFreeNotification(Self);
      if DataSet <> nil then
        DataSet.DatSManager := nil;
      if FTableAdapterOwned then
        FSchemaAdapter.FDAptSchemaAdapter.TableAdapters.Remove(FTableAdapterIntf)
      else begin
        FDCreateInterface(IFDDAptTableAdapter, oAdapt);
        SetTableAdapterIntf(oAdapt, True);
      end;
    end;
    FSchemaAdapter := AValue;
    if FSchemaAdapter <> nil then begin
      FSchemaAdapter.FTableAdapters.Add(Self);
      FSchemaAdapter.FreeNotification(Self);
      if FTableAdapterOwned then
        FSchemaAdapter.FDAptSchemaAdapter.TableAdapters.Add(FTableAdapterIntf);
      if DataSet <> nil then
        DataSet.DatSManager := FSchemaAdapter.DatSManager;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomTableAdapter.GetDatSTable: TFDDatSTable;
begin
  Result := FTableAdapterIntf.DatSTable;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.SetDatSTable(const AValue: TFDDatSTable);
begin
  FTableAdapterIntf.DatSTable := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDCustomTableAdapter.GetDatSTableName: String;
begin
  Result := FTableAdapterIntf.DatSTableName;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.SetDatSTableName(const AValue: String);
begin
  FTableAdapterIntf.DatSTableName := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDCustomTableAdapter.IsDTNS: Boolean;
begin
  Result := DatSTableName <> SourceRecordSetName;
end;

{-------------------------------------------------------------------------------}
function TFDCustomTableAdapter.GetMetaInfoMergeMode: TFDPhysMetaInfoMergeMode;
begin
  Result := FTableAdapterIntf.MetaInfoMergeMode;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.SetMetaInfoMergeMode(const AValue: TFDPhysMetaInfoMergeMode);
begin
  FTableAdapterIntf.MetaInfoMergeMode := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDCustomTableAdapter.GetSourceRecordSetID: Integer;
begin
  Result := FTableAdapterIntf.SourceRecordSetID;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.SetSourceRecordSetID(const AValue: Integer);
begin
  if FSchemaAdapter <> nil then begin
    if FTableAdapterOwned then
      FSchemaAdapter.FDAptSchemaAdapter.TableAdapters.Remove(FTableAdapterIntf);
    SetTableAdapterIntf(FSchemaAdapter.FDAptSchemaAdapter.TableAdapters.Lookup(
      TFDPhysMappingName.Create(AValue, nkID)), False);
    if FTableAdapterIntf = nil then begin
      SetTableAdapterIntf(FSchemaAdapter.FDAptSchemaAdapter.TableAdapters.Add('', '', ''), True);
      FTableAdapterIntf.SourceRecordSetID := AValue;
    end;
  end
  else
    FTableAdapterIntf.SourceRecordSetID := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDCustomTableAdapter.GetSourceRecordSetName: String;
begin
  Result := FTableAdapterIntf.SourceRecordSetName;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.SetSourceRecordSetName(const AValue: String);
begin
  if FSchemaAdapter <> nil then begin
    if FTableAdapterOwned then
      FSchemaAdapter.FDAptSchemaAdapter.TableAdapters.Remove(FTableAdapterIntf);
    SetTableAdapterIntf(FSchemaAdapter.FDAptSchemaAdapter.TableAdapters.Lookup(
      TFDPhysMappingName.Create(AValue, nkSource)), False);
    if FTableAdapterIntf = nil then begin
      SetTableAdapterIntf(FSchemaAdapter.FDAptSchemaAdapter.TableAdapters.Add(AValue, '', ''), True);
      FTableAdapterIntf.SourceRecordSetName := AValue;
    end;
  end
  else
    FTableAdapterIntf.SourceRecordSetName := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDCustomTableAdapter.IsSRSNS: Boolean;
begin
  if (SelectCommand <> nil) and (SelectCommand.CommandIntf <> nil) then
    Result := SourceRecordSetName <> SelectCommand.CommandIntf.SourceObjectName
  else
    Result := True;
end;

{-------------------------------------------------------------------------------}
function TFDCustomTableAdapter.GetUpdateTableName: String;
begin
  Result := FTableAdapterIntf.UpdateTableName;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.SetUpdateTableName(const AValue: String);
begin
  FTableAdapterIntf.UpdateTableName := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDCustomTableAdapter.IsUTNS: Boolean;
begin
  Result := UpdateTableName <> SourceRecordSetName;
end;

{-------------------------------------------------------------------------------}
function TFDCustomTableAdapter.GetDatSManager: TFDDatSManager;
begin
  Result := FTableAdapterIntf.DatSManager;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.SetDatSManager(AValue: TFDDatSManager);
begin
  ASSERT((csDestroying in ComponentState) or (FTableAdapterIntf <> nil));
  if FTableAdapterIntf <> nil then
    FTableAdapterIntf.DatSManager := AValue;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomTableAdapter.Reset;
var
  i: TFDActionRequest;
  oCmd: TFDCustomCommand;
begin
  for i := Low(TFDActionRequest) to High(TFDActionRequest) do begin
    oCmd := GetCommand(i);
    if oCmd <> nil then begin
      SetAdapterCmd(nil, i);
      oCmd.Prepared := False;
    end;
  end;
  FTableAdapterIntf.Reset;
end;

{-------------------------------------------------------------------------------}
{ TFDCustomSchemaAdapter                                                        }
{-------------------------------------------------------------------------------}
constructor TFDCustomSchemaAdapter.Create(AOwner: TComponent);
var
  oMgr: TFDDatSManager;
begin
  inherited Create(AOwner);
  FTableAdapters := TFDObjList.Create;
  FDCreateInterface(IFDDAptSchemaAdapter, FDAptSchemaAdapter);
  oMgr := TFDDatSManager.Create;
  oMgr.UpdatesRegistry := True;
  oMgr.CountRef(0);
  FDAptSchemaAdapter.DatSManager := oMgr;
  FDAptSchemaAdapter.ErrorHandler := Self as IFDStanErrorHandler;
  FDAptSchemaAdapter.UpdateHandler := Self as IFDDAptUpdateHandler;
  if FManagerOptsIntf = nil then
    FDManager();
  FDAptSchemaAdapter.Options.ParentOptions := FManagerOptsIntf;
  FEncoder := TFDEncoder.Create(nil);
end;

{-------------------------------------------------------------------------------}
destructor TFDCustomSchemaAdapter.Destroy;
begin
  inherited Destroy;
  FDAptSchemaAdapter.Options.ParentOptions := nil;
  FDAptSchemaAdapter.DatSManager := nil;
  FDAptSchemaAdapter.ErrorHandler := nil;
  FDAptSchemaAdapter.UpdateHandler := nil;
  FDAptSchemaAdapter := nil;
  FDFreeAndNil(FTableAdapters);
  FDFreeAndNil(FEncoder);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomSchemaAdapter.StartWait;
var
  oWait: IFDGUIxWaitCursor;
begin
  if not ResourceOptions.ActualSilentMode then begin
    FDCreateInterface(IFDGUIxWaitCursor, oWait);
    oWait.StartWait;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomSchemaAdapter.StopWait;
var
  oWait: IFDGUIxWaitCursor;
begin
  FDCreateInterface(IFDGUIxWaitCursor, oWait);
  oWait.StopWait;
end;

{-------------------------------------------------------------------------------}
function TFDCustomSchemaAdapter.GetCount: Integer;
begin
  Result := FTableAdapters.Count;
end;

{-------------------------------------------------------------------------------}
function TFDCustomSchemaAdapter.GetTableAdapters(AIndex: Integer): TFDCustomTableAdapter;
begin
  Result := TFDCustomTableAdapter(FTableAdapters[AIndex]);
end;

{-------------------------------------------------------------------------------}
function TFDCustomSchemaAdapter.GetDataSets(AIndex: Integer): TFDAdaptedDataSet;
begin
  Result := TableAdapters[AIndex].DataSet;
end;

{-------------------------------------------------------------------------------}
function TFDCustomSchemaAdapter.GetTableAdaptersIntf: IFDDAptTableAdapters;
begin
  Result := FDAptSchemaAdapter.TableAdapters;
end;

{-------------------------------------------------------------------------------}
function TFDCustomSchemaAdapter.GetDatSManager: TFDDatSManager;
begin
  Result := FDAptSchemaAdapter.DatSManager;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomSchemaAdapter.SetDatSManager(const AValue: TFDDatSManager);
begin
  FDAptSchemaAdapter.DatSManager := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDCustomSchemaAdapter.GetResourceOptions: TFDBottomResourceOptions;
begin
  Result := FDAptSchemaAdapter.Options.ResourceOptions as TFDBottomResourceOptions;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomSchemaAdapter.SetResourceOptions(const AValue: TFDBottomResourceOptions);
begin
  FDAptSchemaAdapter.Options.ResourceOptions.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
function TFDCustomSchemaAdapter.GetUpdateOptions: TFDUpdateOptions;
begin
  Result := FDAptSchemaAdapter.Options.UpdateOptions;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomSchemaAdapter.SetUpdateOptions(const AValue: TFDUpdateOptions);
begin
  FDAptSchemaAdapter.Options.UpdateOptions.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomSchemaAdapter.HandleException(
  const AInitiator: IFDStanObject; var AException: Exception);
begin
  if Assigned(FOnError) then
    FOnError(Self, AInitiator as TObject, AException);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomSchemaAdapter.SetActive(AValue: Boolean);
var
  i: Integer;
  oDS: TFDAdaptedDataSet;
begin
  for i := 0 to Count - 1 do begin
    oDS := DataSets[i];
    if oDS <> nil then
      oDS.Active := AValue;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomSchemaAdapter.Open;
begin
  SetActive(True);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomSchemaAdapter.Close;
begin
  SetActive(False);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomSchemaAdapter.ReconcileRow(ARow: TFDDatSRow;
  var AAction: TFDDAptReconcileAction);
begin
  if Assigned(FOnReconcileRow) then
    FOnReconcileRow(Self, ARow, AAction);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomSchemaAdapter.UpdateRow(ARow: TFDDatSRow;
  ARequest: TFDUpdateRequest; AUpdRowOptions: TFDUpdateRowOptions;
  var AAction: TFDErrorAction);
begin
  if Assigned(FOnUpdateRow) then
    FOnUpdateRow(Self, ARow, ARequest, AUpdRowOptions, AAction);
end;

{-------------------------------------------------------------------------------}
function TFDCustomSchemaAdapter.Reconcile: Boolean;
begin
  Result := FDAptSchemaAdapter.Reconcile;
  ResyncDataSets;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomSchemaAdapter.DoBeforeApplyUpdate;
begin
  if Assigned(FBeforeApplyUpdate) then
    FBeforeApplyUpdate(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomSchemaAdapter.DoAfterApplyUpdate(AErrors: Integer);
begin
  if Assigned(FAfterApplyUpdate) then
    FAfterApplyUpdate(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomSchemaAdapter.CheckDataSets(ACancel: Boolean);
var
  i: Integer;
  oDS: TFDAdaptedDataSet;
begin
  for i := 0 to Count - 1 do begin
    oDS := DataSets[i];
    if (oDS <> nil) and oDS.Active then begin
      if ACancel then
        oDS.Cancel;
      oDS.CheckBrowseMode;
      oDS.CheckCachedUpdatesMode;
      oDS.UpdateCursorPos;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomSchemaAdapter.ResyncDataSets;
var
  i: Integer;
  oDS: TFDAdaptedDataSet;
begin
  for i := 0 to Count - 1 do begin
    oDS := DataSets[i];
    if (oDS <> nil) and oDS.Active then
      oDS.ResyncViews;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomSchemaAdapter.ApplyUpdates(AMaxErrors: Integer): Integer;
var
  i: Integer;
begin
  StartWait;
  try
    DoBeforeApplyUpdate;
    CheckDataSets(False);
    for i := 0 to Count - 1 do
      TableAdapters[i].UpdateAdapterCmds([arSelect, arInsert, arUpdate, arDelete,
                                          arLock, arUnlock, arFetchRow]);
    Result := FDAptSchemaAdapter.Update(AMaxErrors);
    DoAfterApplyUpdate(Result);
    if DatSManager.HasErrors then
      Reconcile
    else if UpdateOptions.AutoCommitUpdates then
      CommitUpdates
    else
      ResyncDataSets;
  finally
    StopWait;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomSchemaAdapter.CommitUpdates;
begin
  CheckDataSets(False);
  DatSManager.Updates.AcceptChanges(nil);
  ResyncDataSets;
end;

{-------------------------------------------------------------------------------}
function TFDCustomSchemaAdapter.UndoLastChange: Boolean;
var
  oRow: TFDDatSRow;
begin
  CheckDataSets(True);
  Result := UpdatesPending;
  if Result then begin
    oRow := DatSManager.Updates.LastChange(nil);
    oRow.RejectChanges;
    ResyncDataSets;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomSchemaAdapter.CancelUpdates;
begin
  SetSavePoint(0);
end;

{-------------------------------------------------------------------------------}
function TFDCustomSchemaAdapter.GetSavePoint: Int64;
begin
  CheckDataSets(False);
  Result := DatSManager.Updates.SavePoint;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomSchemaAdapter.SetSavePoint(const AValue: Int64);
begin
  CheckDataSets(True);
  DatSManager.Updates.SavePoint := AValue;
  ResyncDataSets;
end;

{-------------------------------------------------------------------------------}
function TFDCustomSchemaAdapter.GetUpdatesPending: Boolean;
begin
  Result := DatSManager.Updates.FirstChange(nil) <> nil;
end;

{-------------------------------------------------------------------------------}
function TFDCustomSchemaAdapter.GetChangeCount: Integer;
begin
  Result := DatSManager.Updates.GetCount(nil);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomSchemaAdapter.SaveToStorage(const AFileName: String;
  AStream: TStream; AFormat: TFDStorageFormat);
var
  oStrg: IFDStanStorage;
  i: Integer;
  oDS: TFDAdaptedDataSet;
begin
  StartWait;
  try
                                              
                                                        
    for i := 0 to Count - 1 do begin
      oDS := DataSets[i];
      if (oDS <> nil) and oDS.Active then
        oDS.CheckFetchedAll;
    end;
    oStrg := ResourceOptions.GetStorage(AFileName, AFormat);
    if oStrg.IsStored(siVisible) then
      for i := 0 to Count - 1 do begin
        oDS := DataSets[i];
        if (oDS <> nil) and (oDS.Table <> nil) and (oDS.SourceView <> nil) then
          oStrg.AddFilterObj(oDS.Table, oDS.SourceView);
      end;
    oStrg.Open(ResourceOptions, FEncoder, AFileName, AStream, smWrite);
    DatSManager.SaveToStorage(oStrg);
  finally
    StopWait;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomSchemaAdapter.LoadFromStorage(const AFileName: String;
  AStream: TStream; AFormat: TFDStorageFormat);
var
  oStrg: IFDStanStorage;
  i: Integer;
  oDS: TFDAdaptedDataSet;
  oAdapt: TFDCustomTableAdapter;
begin
  StartWait;
  try
    oStrg := ResourceOptions.GetStorage(AFileName, AFormat);
    oStrg.Open(ResourceOptions, FEncoder, AFileName, AStream, smRead);
    for i := 0 to Count - 1 do begin
      oDS := DataSets[i];
      if oDS <> nil then
        oDS.DisableControls;
    end;
    try
      for i := 0 to Count - 1 do begin
        oDS := DataSets[i];
        if oDS <> nil then
          if not ResourceOptions.StoreMerge then
            oDS.Disconnect
          else
            oDS.Open;
      end;

      DatSManager.LoadFromStorage(oStrg, ResourceOptions.StoreMergeData,
        ResourceOptions.StoreMergeMeta, [moPreserveState]);

      for i := 0 to Count - 1 do begin
        oDS := DataSets[i];
        if oDS <> nil then
          if not ResourceOptions.StoreMerge then begin
            Include(oDS.FFlags, dfOfflining);
            try
              oAdapt := oDS.Adapter;
              oDS.SetAdapter(nil);
              oDS.SetAdapter(oAdapt);
              oDS.Open;
            finally
              Exclude(oDS.FFlags, dfOfflining);
            end;
          end
          else
            oDS.Resync([]);
      end;
    finally
      for i := 0 to Count - 1 do begin
        oDS := DataSets[i];
        if oDS <> nil then
          oDS.EnableControls;
      end;
    end;
  finally
    StopWait;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomSchemaAdapter.SaveToStream(AStream: TStream;
  AFormat: TFDStorageFormat);
begin
  SaveToStorage('', AStream, AFormat);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomSchemaAdapter.SaveToFile(const AFileName: String;
  AFormat: TFDStorageFormat);
begin
  SaveToStorage(AFileName, nil, AFormat);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomSchemaAdapter.LoadFromStream(AStream: TStream;
  AFormat: TFDStorageFormat);
begin
  LoadFromStorage('', AStream, AFormat);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomSchemaAdapter.LoadFromFile(const AFileName: String;
  AFormat: TFDStorageFormat);
begin
  LoadFromStorage(AFileName, nil, AFormat);
end;

{-------------------------------------------------------------------------------}
{ TFDCustomUpdateObject                                                         }
{-------------------------------------------------------------------------------}
procedure TFDCustomUpdateObject.Notification(AComponent: TComponent;
  AOperation: TOperation);
begin
  if (AOperation = opRemove) and (AComponent = FDataSet) then
    DataSet := nil;
  inherited Notification(AComponent, AOperation);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomUpdateObject.SetDataSet(const AValue: TFDAdaptedDataSet);
begin
  if FDataSet <> AValue then begin
    if FDataSet <> nil then
      FDataSet.UpdateObject := nil;
    FDataSet := AValue;
    if FDataSet <> nil then
      FDataSet.UpdateObject := Self;
  end;
end;

{-------------------------------------------------------------------------------}
{ TFDDefaultLocalSQLAdapter                                                     }
{-------------------------------------------------------------------------------}
type
  TFDDefaultLocalSQLAdapter = class (TFDObject, IFDPhysLocalSQLAdapter)
  private
    FDataSet: TDataSet;
  protected
    // IFDPhysLocalSQLAdapter
    function GetFeatures: TFDPhysLocalSQLAdapterFeatures;
    function GetCachedUpdates: Boolean;
    procedure SetCachedUpdates(const AValue: Boolean);
    function GetSavePoint: Int64;
    procedure SetSavePoint(const AValue: Int64);
    function GetIndexFieldNames: String;
    procedure SetIndexFieldNames(const AValue: String);
    function GetDataSet: TObject;
    procedure SetDataSet(ADataSet: TObject);
    function GetConn: NativeUInt;
    function ApplyUpdates(AMaxErrors: Integer = -1): Integer;
    procedure CommitUpdates;
    procedure CancelUpdates;
    procedure SetRange(const AStartValues, AEndValues: array of const;
      AStartExclusive: Boolean = False; AEndExclusive: Boolean = False);
    procedure CancelRange;
    function IsPKViolation(AExc: Exception): Boolean;
  end;

{-------------------------------------------------------------------------------}
function TFDDefaultLocalSQLAdapter.GetDataSet: TObject;
begin
  Result := FDataSet;
end;

{-------------------------------------------------------------------------------}
procedure TFDDefaultLocalSQLAdapter.SetDataSet(ADataSet: TObject);
begin
  FDataSet := ADataSet as TDataSet;
end;

{-------------------------------------------------------------------------------}
function TFDDefaultLocalSQLAdapter.GetConn: NativeUInt;
begin
  // nothing
  Result := 0;
end;

{-------------------------------------------------------------------------------}
function TFDDefaultLocalSQLAdapter.GetFeatures: TFDPhysLocalSQLAdapterFeatures;
begin
  // nothing
  Result := [];
end;

{-------------------------------------------------------------------------------}
function TFDDefaultLocalSQLAdapter.GetCachedUpdates: Boolean;
begin
  // nothing
  Result := False;
end;

{-------------------------------------------------------------------------------}
procedure TFDDefaultLocalSQLAdapter.SetCachedUpdates(const AValue: Boolean);
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
function TFDDefaultLocalSQLAdapter.GetSavePoint: Int64;
begin
  // nothing
  Result := 0;
end;

{-------------------------------------------------------------------------------}
procedure TFDDefaultLocalSQLAdapter.SetSavePoint(const AValue: Int64);
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
function TFDDefaultLocalSQLAdapter.GetIndexFieldNames: String;
begin
  // nothing
  Result := '';
end;

{-------------------------------------------------------------------------------}
procedure TFDDefaultLocalSQLAdapter.SetIndexFieldNames(const AValue: String);
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
procedure TFDDefaultLocalSQLAdapter.SetRange(const AStartValues,
  AEndValues: array of const; AStartExclusive: Boolean = False;
  AEndExclusive: Boolean = False);
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
procedure TFDDefaultLocalSQLAdapter.CancelRange;
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
function TFDDefaultLocalSQLAdapter.ApplyUpdates(AMaxErrors: Integer): Integer;
begin
  // nothing
  Result := 0;
end;

{-------------------------------------------------------------------------------}
procedure TFDDefaultLocalSQLAdapter.CommitUpdates;
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
procedure TFDDefaultLocalSQLAdapter.CancelUpdates;
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
function TFDDefaultLocalSQLAdapter.IsPKViolation(AExc: Exception): Boolean;
begin
  // nothing
  Result := False;
end;

{-------------------------------------------------------------------------------}
{ TFDLocalSQLDataSet                                                            }
{-------------------------------------------------------------------------------}
destructor TFDLocalSQLDataSet.Destroy;
begin
  Vacate;
  DataSet := nil;
  Changing;
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
procedure TFDLocalSQLDataSet.Vacate;
begin
  if DataSet <> nil then begin
    if (Collection <> nil) and (TFDLocalSQLDataSets(Collection).FOwner <> nil) then
      TFDLocalSQLDataSets(Collection).FOwner.ReleaseDataSet(Self);
    if Owned and (DataSet <> nil) then begin
      FDFreeAndNil(FDataSet);
      FAdapter := nil;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDLocalSQLDataSet.Assign(ASource: TPersistent);
begin
  if ASource is TFDLocalSQLDataSet then begin
    Changing;
    FDataSet := TFDLocalSQLDataSet(ASource).FDataSet;
    FSchemaName := TFDLocalSQLDataSet(ASource).FSchemaName;
    FName := TFDLocalSQLDataSet(ASource).FName;
    FTemporary := TFDLocalSQLDataSet(ASource).FTemporary;
    FOwned := TFDLocalSQLDataSet(ASource).FOwned;
    UpdateAdapter;
    Changed;
  end
  else
    inherited Assign(ASource);
end;

{-------------------------------------------------------------------------------}
function TFDLocalSQLDataSet.GetDisplayName: String;
begin
  Result := FullName;
  if Result = '' then
    Result := inherited GetDisplayName;
end;

{-------------------------------------------------------------------------------}
function TFDLocalSQLDataSet.GetActualSchemaName: String;
begin
  if SchemaName <> '' then
    Result := SchemaName
  else if (Collection <> nil) and (TFDLocalSQLDataSets(Collection).FOwner <> nil) and
          (TFDLocalSQLDataSets(Collection).FOwner.SchemaName <> '') then
    Result := TFDLocalSQLDataSets(Collection).FOwner.SchemaName
  else
    Result := '';
end;

{-------------------------------------------------------------------------------}
function TFDLocalSQLDataSet.GetActualName: String;
begin
  if Name <> '' then
    Result := Name
  else if DataSet <> nil then
    Result := DataSet.Name
  else
    Result := '';
end;

{-------------------------------------------------------------------------------}
function TFDLocalSQLDataSet.GetFullName: String;
var
  sSchema: String;
begin
  Result := ActualName;
  sSchema := ActualSchemaName;
  if (sSchema <> '') and (Result <> '') then
    Result := sSchema + '.' + Result;
end;

{-------------------------------------------------------------------------------}
function TFDLocalSQLDataSet.GetIsValid: Boolean;
begin
  Result := (FullName <> '') and (FAdapter <> nil) and
    (FDataSet <> nil) and (Collection <> nil) and
    (TFDLocalSQLDataSets(Collection).FOwner <> nil);
end;

{-------------------------------------------------------------------------------}
procedure TFDLocalSQLDataSet.Changing;
begin
  if IsValid then
    TFDLocalSQLDataSets(Collection).FOwner.CheckDataSetRemoving(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDLocalSQLDataSet.Changed;
begin
  if IsValid and not (csDestroying in FDataSet.ComponentState) then
    TFDLocalSQLDataSets(Collection).FOwner.CheckDataSetAdded(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDLocalSQLDataSet.UpdateAdapter;
var
  oClass: TClass;
begin
  if (FAdapter = nil) and (FDataSet <> nil) then
    if not Supports(FDataSet, IFDPhysLocalSQLAdapter, FAdapter) then begin
      oClass := FDataSet.ClassType;
      repeat
        FDCreateInterface(IFDPhysLocalSQLAdapter, FAdapter, False, oClass.ClassName);
        oClass := oClass.ClassParent;
      until (FAdapter <> nil) or (oClass = nil) or (oClass = TDataSet);
      if FAdapter = nil then
        FAdapter := IFDPhysLocalSQLAdapter(TFDDefaultLocalSQLAdapter.Create);
      FAdapter.DataSet := FDataSet;
    end;
end;

{-------------------------------------------------------------------------------}
procedure TFDLocalSQLDataSet.SetSchemaName(const AValue: String);
begin
  if FName <> AValue then begin
    Changing;
    FSchemaName := AValue;
    Changed;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDLocalSQLDataSet.SetName(const AValue: String);
begin
  if FName <> AValue then begin
    Changing;
    FName := AValue;
    Changed;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDLocalSQLDataSet.SetDataSet(const AValue: TDataSet);
begin
  if FDataSet <> AValue then begin
    Changing;
    if (FDataSet <> nil) and (TFDLocalSQLDataSets(Collection).FOwner <> nil) then
      FDataSet.RemoveFreeNotification(TFDLocalSQLDataSets(Collection).FOwner);
    FDataSet := AValue;
    FAdapter := nil;
    if (FDataSet <> nil) and (TFDLocalSQLDataSets(Collection).FOwner <> nil) then
      FDataSet.FreeNotification(TFDLocalSQLDataSets(Collection).FOwner);
    UpdateAdapter;
    Changed;
  end;
end;

{-------------------------------------------------------------------------------}
{ TFDLocalSQLDataSets                                                           }
{-------------------------------------------------------------------------------}
constructor TFDLocalSQLDataSets.Create(AOwner: TFDCustomLocalSQL);
begin
  inherited Create(TFDLocalSQLDataSet);
  FOwner := AOwner;
end;

{-------------------------------------------------------------------------------}
function TFDLocalSQLDataSets.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

{-------------------------------------------------------------------------------}
function TFDLocalSQLDataSets.GetItems(AIndex: Integer): TFDLocalSQLDataSet;
begin
  Result := TFDLocalSQLDataSet(inherited Items[AIndex]);
end;

{-------------------------------------------------------------------------------}
procedure TFDLocalSQLDataSets.SetItems(AIndex: Integer; const AValue: TFDLocalSQLDataSet);
begin
  inherited Items[AIndex] := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDLocalSQLDataSets.Add: TFDLocalSQLDataSet;
begin
  Result := TFDLocalSQLDataSet(inherited Add);
end;

{-------------------------------------------------------------------------------}
function TFDLocalSQLDataSets.Add(ADataSet: TDataSet; const ASchemaName: String = '';
  const AName: String = ''): TFDLocalSQLDataSet;
begin
  Result := Add;
  Result.FDataSet := ADataSet;
  Result.FSchemaName := ASchemaName;
  Result.FName := AName;
  if ADataSet <> nil then
    ADataSet.FreeNotification(FOwner);
  Result.UpdateAdapter;
  Result.Changed;
end;

{-------------------------------------------------------------------------------}
procedure TFDLocalSQLDataSets.Remove(ADataSet: TDataSet);
var
  i: Integer;
  oItem: TFDLocalSQLDataSet;
begin
  for i := Count - 1 downto 0 do begin
    oItem := Items[i];
    if oItem.DataSet = ADataSet then
      if oItem.Temporary then
        FDFree(oItem)
      else begin
        oItem.Vacate;
        oItem.DataSet := nil;
      end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDLocalSQLDataSets.Vacate;
var
  i: Integer;
  oItem: TFDLocalSQLDataSet;
begin
  for i := Count - 1 downto 0 do begin
    oItem := Items[i];
    if oItem.Owned then
      if oItem.Temporary then
        FDFree(oItem)
      else
        oItem.Vacate;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDLocalSQLDataSets.CheckUnique(AItem: TFDLocalSQLDataSet);
var
  i: Integer;
  sFull, sName: String;
begin
  sFull := AItem.FullName;
  if sFull = '' then
    Exit;
  for i := 0 to Count - 1 do
    if (Items[i] <> AItem) and (CompareText(Items[i].FullName, sFull) = 0) then begin
      if FOwner <> nil then
        sName := FOwner.Name
      else
        sName := '';
      FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_ClntDSNameNotUnique,
        [sFull, sName]);
    end;
end;

{-------------------------------------------------------------------------------}
function TFDLocalSQLDataSets.FindDataSet(const ASchemaName, AName: String): TFDLocalSQLDataSet;
var
  i: Integer;
  oItem: TFDLocalSQLDataSet;
  sName: String;
begin
  Result := nil;
  sName := AName;
  if ASchemaName <> '' then
    sName := ASchemaName + '.' + sName;
  for i := 0 to Count - 1 do begin
    oItem := Items[i];
    if CompareText(oItem.FullName, sName) = 0 then begin
      Result := oItem;
      Exit;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
{ TFDCustomLocalSQL                                                             }
{-------------------------------------------------------------------------------}
constructor TFDCustomLocalSQL.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDataSets := TFDLocalSQLDataSets.Create(Self);
end;

{-------------------------------------------------------------------------------}
destructor TFDCustomLocalSQL.Destroy;
begin
  Destroying;
  Connection := nil;
  inherited Destroy;
  FDFreeAndNil(FDataSets);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomLocalSQL.Notification(AComponent: TComponent; AOperation: TOperation);
begin
  inherited Notification(AComponent, AOperation);
  if AOperation = opRemove then
    if AComponent = Connection then
      Connection := nil
    else if AComponent is TDataSet then
      DataSets.Remove(TDataSet(AComponent));
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomLocalSQL.ReadDataSets(Reader: TReader);
begin
  Reader.ReadCollection(DataSets);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomLocalSQL.WriteDataSets(Writer: TWriter);
var
  oCol: TFDLocalSQLDataSets;
  i: Integer;
begin
  oCol := TFDLocalSQLDataSets.Create(nil);
  try
    for i := 0 to DataSets.Count - 1 do
      if not DataSets[i].Temporary then
        oCol.Add.Assign(DataSets[i]);
    Writer.WriteCollection(oCol);
  finally
    FDFree(oCol);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomLocalSQL.DefineProperties(AFiler: TFiler);

  function AreDataSetsStorable(AFiler: TFiler): Boolean;
  begin
    Result := DataSets.Count > 0;
    if AFiler.Ancestor <> nil then
      if AFiler.Ancestor is TFDCustomLocalSQL then
        Result := not CollectionsEqual(DataSets, TFDCustomLocalSQL(AFiler.Ancestor).DataSets,
          Self, TFDCustomLocalSQL(AFiler.Ancestor));
  end;

begin
  AFiler.DefineProperty('DataSets', ReadDataSets, WriteDataSets, AreDataSetsStorable(AFiler));
  inherited DefineProperties(AFiler);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomLocalSQL.Loaded;
begin
  inherited Loaded;
  try
    if FStreamedActive then
      SetActive(True);
  except
    if csDesigning in ComponentState then
      FDHandleException
    else
      raise;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomLocalSQL.SetDataSets(const AValue: TFDLocalSQLDataSets);
begin
  FDataSets.Assign(AValue);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomLocalSQL.SetActive(const AValue: Boolean);
begin
  if csReading in ComponentState then
    FStreamedActive := AValue
  else if FActive <> AValue then begin
    FActive := AValue;
    if Active then
      CheckActivate
    else
      CheckDeactivate;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomLocalSQL.GetActualActive: Boolean;
begin
  Result := Active and (Connection <> nil) and Connection.Connected;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomLocalSQL.CheckActivate;
var
  i: Integer;
begin
  if GetActualActive and not FActivated then begin
    for i := 0 to DataSets.Count - 1 do
      DataSets.CheckUnique(DataSets[i]);
    FActivated := True;
    InternalAttachToSQL;
    for i := 0 to DataSets.Count - 1 do
      if DataSets[i].IsValid then
        InternalDataSetAdded(DataSets[i]);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomLocalSQL.CheckDeactivate;
var
  i: Integer;
begin
  if GetActualActive and FActivated then begin
    FActivated := False;
    for i := 0 to DataSets.Count - 1 do
      if DataSets[i].IsValid then
        InternalDataSetRemoving(DataSets[i]);
    InternalDetachFromSQL;
    DataSets.Vacate;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomLocalSQL.CheckDataSetAdded(const AItem: TFDLocalSQLDataSet);
begin
  if GetActualActive then begin
    DataSets.CheckUnique(AItem);
    InternalDataSetAdded(AItem);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomLocalSQL.CheckDataSetRemoving(const AItem: TFDLocalSQLDataSet);
begin
  if GetActualActive then
    InternalDataSetRemoving(AItem);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomLocalSQL.DoConnectChanged(Sender: TObject; Connecting: Boolean);
begin
  if Connecting then
    CheckActivate
  else
    CheckDeactivate;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomLocalSQL.SetConnection(const AValue: TFDCustomConnection);
begin
  if FConnection <> AValue then begin
    if FConnection <> nil then begin
      CheckDeactivate;
      FConnection.UnRegisterClient(Self);
    end;
    FConnection := AValue;
    if FConnection <> nil then begin
      FConnection.RegisterClient(Self, DoConnectChanged);
      FConnection.FreeNotification(Self);
      CheckActivate;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomLocalSQL.SetSchemaName(const AValue: String);
begin
  if FSchemaName <> AValue then begin
    CheckDeactivate;
    FSchemaName := AValue;
    CheckActivate;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomLocalSQL.MatchSchema(var ASchemaName: String): Boolean;
begin
  if CompareText(ASchemaName, 'main') = 0 then
    ASchemaName := '';
  Result := not (csDestroying in ComponentState) and
     ((SchemaName = '') or (CompareText(SchemaName, ASchemaName) = 0));
end;

{-------------------------------------------------------------------------------}
function TFDCustomLocalSQL.FindDataSet(const ASchemaName, AName: String): TFDLocalSQLDataSet;
var
  sSchema: String;
begin
  sSchema := ASchemaName;
  if MatchSchema(sSchema) then
    Result := DataSets.FindDataSet(sSchema, AName)
  else
    Result := nil;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomLocalSQL.RefreshDataSet(const ASchemaName, AName: String);
var
  oDS: TFDLocalSQLDataSet;
begin
  oDS := FindDataSet(ASchemaName, AName);
  if (oDS <> nil) and oDS.IsValid then begin
    InternalDataSetRemoving(oDS);
    InternalDataSetAdded(oDS);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomLocalSQL.FindAdapter(const ASchemaName, AName: String): IFDPhysLocalSQLAdapter;
var
  oDS: TFDLocalSQLDataSet;
begin
  oDS := FindDataSet(ASchemaName, AName);
  if (oDS <> nil) and oDS.IsValid then
    Result := oDS.Adapter
  else
    Result := nil;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomLocalSQL.DoGetDataSet(const ASchemaName, AName: String;
  var ADataSet: TDataSet; var AOwned: Boolean);
begin
  if Assigned(OnGetDataSet) then
    OnGetDataSet(Self, ASchemaName, AName, ADataSet, AOwned);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomLocalSQL.DoReleaseDataSet(const ASchemaName, AName: String;
  var ADataSet: TDataSet; var AOwned: Boolean);
begin
  if Assigned(OnReleaseDataSet) then
    OnReleaseDataSet(Self, ASchemaName, AName, ADataSet, AOwned);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomLocalSQL.DoOpenDataSet(const ASchemaName, AName: String;
  const ADataSet: TDataSet);
begin
  if Assigned(OnOpenDataSet) then
    OnOpenDataSet(Self, ASchemaName, AName, ADataSet);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomLocalSQL.DoCloseDataSet(const ASchemaName, AName: String;
  const ADataSet: TDataSet);
begin
  if Assigned(OnCloseDataSet) then
    OnCloseDataSet(Self, ASchemaName, AName, ADataSet);
end;

{-------------------------------------------------------------------------------}
function TFDCustomLocalSQL.GetDataSet(const ASchemaName, AName: String): Boolean;
var
  oDS: TDataSet;
  oItem: TFDLocalSQLDataSet;
  lOwned: Boolean;
  sSchema: String;
begin
  Result := False;
  sSchema := ASchemaName;
  if MatchSchema(sSchema) then begin
    oItem := DataSets.FindDataSet(ASchemaName, AName);
    if (oItem = nil) or (oItem.DataSet = nil) then begin
      oDS := nil;
      lOwned := (oItem = nil) or oItem.Owned;
      DoGetDataSet(ASchemaName, AName, oDS, lOwned);
      if oDS <> nil then begin
        if oItem = nil then begin
          oItem := DataSets.Add(oDS, ASchemaName, AName);
          oItem.Temporary := True;
        end
        else
          oItem.DataSet := oDS;
        oItem.Owned := lOwned;
        Result := True;
      end;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomLocalSQL.ReleaseDataSet(AItem: TFDLocalSQLDataSet);
begin
  if AItem.DataSet <> nil then
    try
      DoReleaseDataSet(AItem.ActualSchemaName, AItem.ActualName,
        AItem.FDataSet, AItem.FOwned);
    finally
      if AItem.FDataSet = nil then
        AItem.FAdapter := nil;
    end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomLocalSQL.OpenDataSet(const ASchemaName, AName: String;
  ADataSet: TObject);
begin
  if not (csDestroying in ComponentState) then
    DoOpenDataSet(ASchemaName, AName, TDataSet(ADataSet));
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomLocalSQL.CloseDataSet(const ASchemaName, AName: String;
  ADataSet: TObject);
begin
  if not (csDestroying in ComponentState) then
    DoCloseDataSet(ASchemaName, AName, TDataSet(ADataSet));
end;

{-------------------------------------------------------------------------------}
{ TFDAdaptedDataSet                                                             }
{-------------------------------------------------------------------------------}
constructor TFDAdaptedDataSet.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NestedDataSetClass := TFDCustomMemTable;
  FDatSManager := TFDDatSManager.Create;
  FDatSManager.UpdatesRegistry := True;
  FDatSManager.CountRef;
  FTxSupported := -1;
end;

{-------------------------------------------------------------------------------}
destructor TFDAdaptedDataSet.Destroy;
begin
  LocalSQL := nil;
  ChangeAlerter := nil;
  FDFreeAndNil(FVclParams);
  SetDatSManager(nil);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.Notification(AComponent: TComponent;
  AOperation: TOperation);
begin
  inherited Notification(AComponent, AOperation);
  if AOperation = opRemove then
    if AComponent = UpdateObject then
      UpdateObject := nil
    else if AComponent = Adapter then begin
      Disconnect(True);
      SetAdapter(nil);
    end
    else if AComponent = Command then
      Disconnect(True)
    else if AComponent = LocalSQL then
      LocalSQL := nil
    else if AComponent = ChangeAlerter then
      ChangeAlerter := nil;
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.GetCommand: TFDCustomCommand;
begin
  if Adapter <> nil then
    Result := Adapter.SelectCommand
  else
    Result := nil;
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.GetParams: TFDParams;
begin
  if Command <> nil then
    Result := Command.Params
  else
    Result := nil;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.SetLocalSQL(const AValue: TFDCustomLocalSQL);
begin
  if FLocalSQL <> AValue then begin
    if FLocalSQL <> nil then
      FLocalSQL.DataSets.Remove(Self);
    FLocalSQL := AValue;
    if FLocalSQL <> nil then begin
      FLocalSQL.DataSets.Add(Self).Temporary := True;
      FLocalSQL.FreeNotification(Self);
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.SetChangeAlerter(const AValue: TFDCustomEventAlerter);
begin
  if FChangeAlerter <> AValue then begin
    if FChangeAlerter <> nil then
      FChangeAlerter.RemoveChangeHandler(Self);
    FChangeAlerter := AValue;
    if FChangeAlerter <> nil then begin
      FChangeAlerter.AddChangeHandler(Self);
      FChangeAlerter.FreeNotification(Self);
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.SetChangeAlertName(const AValue: String);
var
  oAlerter: TFDCustomEventAlerter;
begin
  if FChangeAlertName <> AValue then begin
    oAlerter := ChangeAlerter;
    ChangeAlerter := nil;
    FChangeAlertName := AValue;
    ChangeAlerter := oAlerter;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.CheckOnline(APrepare: Boolean = True);
var
  oConn: TFDCustomConnection;
begin
  if Command <> nil then begin
    oConn := Command.GetConnection(False);
    if oConn <> nil then
      oConn.CheckOnline;
    if not Command.Prepared and APrepare then
      DoPrepareSource;
    if (Command.CommandIntf = nil) or
       (Command.CommandIntf <> FAdapter.TableAdapterIntf.SelectCommand) then
      FAdapter.UpdateAdapterCmd(arSelect);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.ReleaseBase(AOffline: Boolean);
var
  oConn: TFDCustomConnection;
begin
  if Command <> nil then begin
    oConn := PointedConnection;
    if Active and (oConn <> nil) and
       ((oConn.ConnectionIntf = nil) or (oConn.ConnectionIntf.State = csRecovering)) then
      FSourceEOF := True;
  end;
  inherited ReleaseBase(AOffline);
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.InternalUpdateErrorHandler(ASender: TObject;
  const AInitiator: IFDStanObject; var AException: Exception);
var
  eAction: TFDErrorAction;
  oConn: TFDCustomConnection;
  oUpdExc: EFDDAptRowUpdateException;
  oArrErr: EFDDBArrayExecuteError;
begin
  if AException is EFDDAptRowUpdateException then begin
    oUpdExc := EFDDAptRowUpdateException(AException);
    eAction := oUpdExc.Action;
    DoUpdateErrorHandler(oUpdExc.Row, oUpdExc.Exception, oUpdExc.Request, eAction);
    oUpdExc.Action := eAction;
  end
  else if AException is EFDDBArrayExecuteError then begin
    if Assigned(FOnExecuteError) then begin
      oArrErr := EFDDBArrayExecuteError(AException);
      eAction := oArrErr.Action;
      FOnExecuteError(Self, oArrErr.Times, oArrErr.Offset, oArrErr.Exception, eAction);
      oArrErr.Action := eAction;
    end;
  end
  else begin
    if Assigned(FOnError) then
      FOnError(Self, AInitiator as TObject, AException);
    if (Command <> nil) and (AException <> nil) then begin
      oConn := Command.GetConnection(False);
      if oConn <> nil then
        oConn.HandleException(AInitiator, AException);
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.InternalUpdateRecordHandler(ASender: TObject;
  ARow: TFDDatSRow; ARequest: TFDUpdateRequest; AOptions: TFDUpdateRowOptions;
  var AAction: TFDErrorAction);
begin
  DoUpdateRecordHandler(ARow, ARequest, AOptions, AAction);
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.InternalReconcileErrorHandler(ASender: TObject;
  ARow: TFDDatSRow; var AAction: TFDDAptReconcileAction);
begin
  DoReconcileErrorHandler(ARow, ARow.RowError, ARow.RowState, AAction);
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.SetAdapter(AAdapter: TFDCustomTableAdapter);
begin
  if FAdapter <> AAdapter then begin
    if (AAdapter <> nil) and (AAdapter.DataSet <> nil) then
      FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_ClntCantShareAdapt,
        [AAdapter.Name, GetDisplayName, AAdapter.DataSet.GetDisplayName]);
    if FAdapter <> nil then begin
      FAdapter.RemoveFreeNotification(Self);
      if (FAdapter.DatSTable <> nil) and
         (FAdapter.DatSTable = Table) then
        AttachTable(nil, nil)
      else
        FAdapter.DatSTable := nil;
      if (FAdapter.SchemaAdapter <> nil) and
         (FAdapter.SchemaAdapter.DatSManager = DatSManager) then
        DatSManager := nil
      else
        FAdapter.DatSManager := nil;
      if FAdapter.SelectCommand <> nil then
        FAdapter.SelectCommand.RemoveFreeNotification(Self);
      FAdapter.FAdaptedDataSet := nil;
      if FUpdateObject <> nil then
        FUpdateObject.DetachFromAdapter;
    end;
    FAdapter := AAdapter;
    if FAdapter <> nil then begin
      FAdapter.FreeNotification(Self);
      if FAdapter.SchemaAdapter <> nil then
        DatSManager := FAdapter.SchemaAdapter.DatSManager
      else
        FAdapter.DatSManager := DatSManager;
      if FAdapter.DatSTable <> nil then
        AttachTable(FAdapter.DatSTable, nil)
      else
        FAdapter.DatSTable := Table;
      if FAdapter.SelectCommand <> nil then
        FAdapter.SelectCommand.FreeNotification(Self);
      FAdapter.FAdaptedDataSet := Self;
      if FUpdateObject <> nil then
        FUpdateObject.AttachToAdapter;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.SetDatSManager(AManager: TFDDatSManager);
begin
  if FDatSManager <> AManager then begin
    if (AManager = nil) or
       (Table <> nil) and (AManager.Tables.IndexOf(Table) = -1) or
       (View <> nil) and (AManager.Tables.IndexOf(View.Table) = -1) then
      AttachTable(nil, nil);
    if Adapter <> nil then
      Adapter.DatSManager := nil;
    if FDatSManager <> nil then begin
      FDatSManager.RemRef;
      FDatSManager := nil;
    end;
    FDatSManager := AManager;
    if FDatSManager <> nil then
      FDatSManager.AddRef;
    if Adapter <> nil then
      Adapter.DatSManager := AManager;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.AttachTable(ATable: TFDDatSTable; AView: TFDDatSView);
begin
  inherited AttachTable(ATable, AView);
  if (Table <> nil) and (DatSManager <> nil) and
     (Adapter <> nil) and (Adapter.DatSManager = DatSManager) and
     (Adapter.DatSTable <> Table) then
    Adapter.DatSTable := Table;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.DoCloneCursor(AReset, AKeepSettings: Boolean);
begin
  DatSManager := CloneSource.DatSManager;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.SetUpdateObject(const AValue: TFDCustomUpdateObject);
begin
  if FUpdateObject <> AValue then begin
    if (AValue <> nil) and (AValue.DataSet <> nil) then
      AValue.DataSet.UpdateObject := nil;
    if (FUpdateObject <> nil) and (FUpdateObject.DataSet = Self) then begin
      FUpdateObject.RemoveFreeNotification(Self);
      if Adapter <> nil then
        FUpdateObject.DetachFromAdapter;
      FUpdateObject.FDataSet := nil;
    end;
    FUpdateObject := AValue;
    if FUpdateObject <> nil then begin
      FUpdateObject.FDataSet := Self;
      if Adapter <> nil then
        FUpdateObject.AttachToAdapter;
      FUpdateObject.FreeNotification(Self);
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.NextRecordSet;
begin
  if Command <> nil then begin
    CheckOnline;
    DisableControls;
    Command.CommandIntf.NextRecordSet := True;
    try
      Close;
      Command.PropertyChange;
      DoOpenSource(True, False, False);
      if Command.Active then begin
        Open;
        FForcePropertyChange := True;
      end
      else
        FForcePropertyChange := False;
    finally
      if Command.CommandIntf <> nil then
        Command.CommandIntf.NextRecordSet := False;
      EnableControls;
    end;
  end
  else
    Close;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.GetResults;
begin
  DisableControls;
  StartWait;
  try
    repeat
      NextRecordSet;
    until not Active;
  finally
    StopWait;
    EnableControls;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.CloseStreams;
begin
  if Command <> nil then
    Command.CloseStreams;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.AbortJob(AWait: Boolean = False);
begin
  if Command <> nil then
    Command.AbortJob(AWait);
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.InternalClose;
begin
  ServerCancel;
  inherited InternalClose;
  if FForcePropertyChange then begin
    FForcePropertyChange := False;
    if Command <> nil then
      Command.PropertyChange;
  end;
  FTxSupported := -1;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.Disconnect(AAbortJob: Boolean = False);
begin
  if AAbortJob then
    AbortJob(True);
  inherited Disconnect(AAbortJob);
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.InternalServerEdit(AServerEditRequest: TFDUpdateRequest);
begin
  if (Adapter = nil) or (FServerEditRequest <> arNone) then
    Exit;
  CheckOnline;
  CheckBrowseMode;
  FServerEditRow := Table.NewRow(False);
  FServerEditRequest := AServerEditRequest;
  BeginForceRow(FServerEditRow, True, False);
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.ServerAppend;
begin
  if Adapter = nil then
    Append
  else
    InternalServerEdit(arInsert);
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.ServerDelete;
begin
  InternalServerEdit(arDelete);
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.ServerEdit;
begin
  InternalServerEdit(arUpdate);
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.ServerPerform;
var
  eAction: TFDErrorAction;
begin
  if (Adapter = nil) and (State = dsInsert) then
    Post
  else begin
    CheckOnline;
    CheckBrowseMode;
    if FServerEditRequest <> arNone then begin
      StartWait;
      try
        if Adapter <> nil then begin
          eAction := eaApplied;
          Adapter.Update(FServerEditRow, eAction, [], FServerEditRequest);
        end;
      finally
        StopWait;
        ServerCancel;
      end;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.ServerCancel;
begin
  if (Adapter = nil) and (State = dsInsert) then
    Cancel
  else if FServerEditRequest <> arNone then begin
    EndForceRow;
    FDFreeAndNil(FServerEditRow);
    FServerEditRequest := arNone;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.ServerDeleteAll(ANoUndo: Boolean);
var
  oGen: IFDPhysCommandGenerator;
  oCmd: IFDPhysCommand;
  oConn: TFDCustomConnection;
  oConnMeta: IFDPhysConnectionMetadata;
begin
  CheckOnline;
  if Adapter <> nil then begin
    StartWait;
    try
      oConn := PointedConnection;
      oConn.ConnectionIntf.CreateMetadata(oConnMeta);
      if ANoUndo and oConnMeta.TruncateSupported then
        while oConn.InTransaction do
          oConn.Commit;
      oConn.ConnectionIntf.CreateCommandGenerator(oGen, nil);
      oGen.MappingHandler := Adapter.TableAdapterIntf as IFDPhysMappingHandler;
      oConn.ConnectionIntf.CreateCommand(oCmd);
      oCmd.CommandText := oGen.GenerateDeleteAll(ANoUndo);
      oCmd.CommandKind := oGen.CommandKind;
      oCmd.Prepare;
      oCmd.Execute;
    finally
      StopWait;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.ServerSetKey;
begin
                                             
  raise Exception.Create('Not implemented');
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.ServerGotoKey: Boolean;
begin
                                              
  raise Exception.Create('Not implemented');
  Result := False;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.DoMasterDefined;
begin
  if Command <> nil then
    inherited DoMasterDefined;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.DoMasterParamSetValues(AMasterFieldList: TFDFieldList);
begin
  if Command <> nil then
    inherited DoMasterParamSetValues(AMasterFieldList);
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.DoMasterParamDependent(AMasterFieldList: TFDFieldList): Boolean;
begin
  if Command <> nil then
    Result := inherited DoMasterParamDependent(AMasterFieldList)
  else
    Result := False;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.DoPrepareSource;
var
  oConn: TFDCustomConnection;
begin
  if (Command <> nil) and (Command.State = csInactive) then begin
    oConn := PointedConnection;
    if (LocalSQL <> nil) and (LocalSQL.Connection = oConn) and
       not oConn.Connected and oConn.ResourceOptions.AutoConnect then
      FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_ClntLocalSQLMisuse,
        [GetDisplayName]);
    FieldDefs.Updated := False;
    IndexDefs.Updated := False;
    DoMasterDefined;
    Command.Prepare;
    FAdapter.UpdateAdapterCmd(arSelect);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.DoUnprepareSource;
begin
  if FUnpreparing then
    Exit;
  FUnpreparing := True;
  try
    if Command <> nil then begin
      if Command.State <> csInactive then begin
        if not (dfOfflining in FFlags) then begin
          FieldDefs.Updated := False;
          IndexDefs.Updated := False;
        end
        else
          Command.AbortJob(False);
      end;
      if Command.CommandIntf <> nil then
        Command.Unprepare;
    end;
    if Adapter <> nil then
      Adapter.Reset;
  finally
    FUnpreparing := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.DoDefineDatSManager;
var
  oTab: TFDDatSTable;
begin
  if (Command <> nil) and not (dfOfflining in FFlags) then begin
    CheckOnline;
    oTab := Adapter.Define;
    AttachTable(oTab, nil);
    // if to call TFDAdaptedDataSet.Open for command returning resultset without columns,
    // then it will be executed twice:
    // - here at Adapter.Define call -> state remains csPrepared, so second time ...
    // - at TFDDataSet.InternalOpen.DoOpenSource
    if Command.State = csPrepared then
      FSourceEOF := True;
  end
  else begin
    inherited DoDefineDatSManager;
    FSourceEOF := dfOfflining in FFlags;
    if (Adapter <> nil) and (Table <> nil) and
       (Adapter.DatSTableName = Adapter.SourceRecordSetName) and (Table.Name <> '') then
      Adapter.DatSTableName := Table.Name;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.DoOpenSource(ABlocked, AInfoQuery, AStructQuery: Boolean);
begin
  if Command <> nil then begin
    CheckOnline;
    if Command.State = csPrepared then
      Command.Open(ABlocked);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.DoIsSourceOpen: Boolean;
begin
  Result := (Command <> nil) and (Command.State = csOpen);
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.DoIsSourceAsync: Boolean;
begin
  Result := inherited DoIsSourceAsync and
    not ((Command <> nil) and (Command.CommandIntf <> nil) and
        Command.CommandIntf.NextRecordSet);
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.DoIsSourceOnline: Boolean;
var
  oConn: TFDCustomConnection;
begin
  Result := inherited DoIsSourceOnline;
  if Result and (Command <> nil) then begin
    oConn := Command.GetConnection(False);
    if oConn <> nil then
      Result := not oConn.Offlined and oConn.Connected;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.DoCloseSource;
begin
  if Command <> nil then begin
    if Command.State = csOpen then
      Command.Close;
  end
  else
    inherited DoCloseSource;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.DoResetDatSManager;
begin
  inherited DoResetDatSManager;
  AttachTable(nil, nil);
  if DatSManager <> nil then begin
    if (Adapter <> nil) and (Adapter.DatSTable <> nil) and
       (Adapter.DatSTable.Manager = DatSManager) then
      Adapter.DatSTable := nil;
    if not ((Adapter <> nil) and (Adapter.DatSManager = DatSManager) and (DatSManager.Refs > 2) or
            (Adapter = nil) and (DatSManager.Refs > 1)) then
      DatSManager.Reset;
  end;
  ASSERT(Table = nil); // else we need Table.Reset;
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.DoGetDatSManager: TFDDatSManager;
begin
  Result := FDatSManager;
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.DoGetTableName: String;
var
  eCmdKind: TFDPhysCommandKind;
  oCmd: TFDCustomCommand;
  oRes: TFDResourceOptions;
  oConn: TFDCustomConnection;
  rName: TFDPhysParsedName;
begin
  Result := '';
  oCmd := Command;
  if oCmd <> nil then begin
    if oCmd.CommandIntf <> nil then
      Result := oCmd.CommandIntf.SourceObjectName;
    if Result = '' then begin
      eCmdKind := skUnknown;
      oRes := ResourceOptions;
      oCmd.PreprocessSQL(oCmd.CommandText.Text, oCmd.Params, nil, oCmd.Macros,
        False, False, oRes.MacroExpand, oRes.EscapeExpand, True, eCmdKind, Result);
      oConn := PointedConnection;
      if oConn <> nil then begin
        rName.FObject := Result;
        Result := PointedConnection.ConnectionMetaDataIntf.EncodeObjName(
          rName, nil, [eoNormalize]);
      end;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.DoFetch(ATable: TFDDatSTable; AAll: Boolean;
  ADirection: TFDFetchDirection = fdDown): Integer;
begin
  if (ADirection = fdDown) and (Command <> nil) and (Command.State = csOpen) then begin
    ASSERT(Adapter.DatSTable = ATable);
    Adapter.Fetch(AAll);
    Result := Command.RowsAffected;
  end
  else
    Result := 0;
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.DoFetch(ARow: TFDDatSRow; AColumn: Integer;
  ARowOptions: TFDPhysFillRowOptions): Boolean;
var
  eAction: TFDErrorAction;
begin
  eAction := eaDefault;
  if Adapter <> nil then
    Adapter.Fetch(ARow, eAction, AColumn, ARowOptions);
  Result := eAction in [eaApplied, eaExitSuccess];
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.DoClearBeforeRefetch;
var
  oFtch: TFDFetchOptions;
begin
  if Command <> nil then
    inherited DoClearBeforeRefetch
  else begin
    oFtch := FetchOptions;
    if not (fiDetails in oFtch.Cache) then
      oFtch.Cache := oFtch.Cache + [fiDetails];
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.DoExecuteSource(ATimes, AOffset: Integer);
begin
  if Command <> nil then begin
    CheckOnline;
    Command.Execute(ATimes, AOffset);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.DoApplyUpdates(ATable: TFDDatSTable; AMaxErrors: Integer): Integer;
begin
  if Adapter <> nil then begin
    CheckOnline(False);
    ASSERT(Adapter.DatSTable = ATable);
    Result := Adapter.ApplyUpdates(AMaxErrors);
  end
  else
    Result := inherited DoApplyUpdates(ATable, AMaxErrors);
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.DoProcessUpdateRequest(ARequest: TFDUpdateRequest;
  AOptions: TFDUpdateRowOptions);
var
  oConn: TFDCustomConnection;
  oRow: TFDDatSRow;
  eAction: TFDErrorAction;
begin
  if ParentDataSet <> nil then
    TFDAdaptedDataSet(ParentDataSet).DoProcessUpdateRequest(ARequest, AOptions)
  else if UpdateOptions.CheckRequest(ARequest, AOptions, CachedUpdates) then begin
    oConn := PointedConnection;
    oRow := GetRow(TRecBuf(ActiveBuffer));
    eAction := eaApplied;
    if not (csDestroying in ComponentState) and (Adapter <> nil) and
       ((oConn = nil) or (oConn.ConnectionIntf = nil) or
        (oConn.ConnectionIntf.State <> csRecovering)) then begin
      CheckOnline(False);
      case ARequest of
      arLock:   Adapter.Lock(oRow, eAction, AOptions);
      arUnLock: Adapter.UnLock(oRow, eAction, AOptions);
      arFetchGenerators,
      arInsert,
      arUpdate,
      arDelete: Adapter.Update(oRow, eAction, AOptions, ARequest);
      end;
    end
    else
      inherited DoProcessUpdateRequest(ARequest, AOptions);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.GetOptionsIntf: IFDStanOptions;
begin
  Result := Command.OptionsIntf;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.SetOptionsIntf(const AValue: IFDStanOptions);
begin
  Command.OptionsIntf := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.GetConnection(ACheck: Boolean): TFDCustomConnection;
begin
  if Command <> nil then
    Result := Command.GetConnection(ACheck)
  else
    Result := nil;
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.GetPointedConnection: TFDCustomConnection;
begin
  Result := GetConnection(False);
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.DoStoredActivation: Boolean;
var
  eUsage: TFDStoredActivationUsage;
begin
  eUsage := FDManager.ActiveStoredUsage;
  if PointedConnection <> nil then
    eUsage := eUsage * PointedConnection.ConnectedStoredUsage;
  Result := FDCheckStoredUsage(ComponentState, eUsage * ActiveStoredUsage);
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.GetConn: NativeUInt;
begin
  Result := NativeUInt(PointedConnection);
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.GetFeatures: TFDPhysLocalSQLAdapterFeatures;

  procedure UpdateTxSup;
  begin
    if (PointedConnection <> nil) and PointedConnection.Connected and
       PointedConnection.ConnectionMetaDataIntf.TxSupported then
      FTxSupported := 1
    else
      FTxSupported := 0;
  end;

begin
  Result := inherited GetFeatures;
  if FTxSupported = -1 then
    UpdateTxSup;
  if FTxSupported <> 0 then
    Include(Result, afTransactions);
end;

{-------------------------------------------------------------------------------}
{ IProviderSupport }

function TFDAdaptedDataSet.PSInTransaction: Boolean;
var
  oConn: TFDCustomConnection;
begin
  oConn := GetConnection(False);
  Result := (oConn <> nil) and oConn.InTransaction;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.PSStartTransaction;
var
  oConn: TFDCustomConnection;
begin
  oConn := GetConnection(False);
  if oConn <> nil then begin
    oConn.CheckOnline;
    if oConn.ConnectionMetaDataIntf.TxSupported then
      oConn.StartTransaction;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.PSEndTransaction(Commit: Boolean);
var
  oConn: TFDCustomConnection;
begin
  oConn := GetConnection(False);
  if oConn <> nil then begin
    oConn.CheckOnline;
    if oConn.ConnectionMetaDataIntf.TxSupported then
      if Commit then
        oConn.Commit
      else
        oConn.Rollback;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.PSIsSQLBased: Boolean;
var
  oConn: TFDCustomConnection;
begin
  oConn := GetConnection(False);
  Result := (oConn <> nil) and oConn.IsSQLBased;
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.PSIsSQLSupported: Boolean;
begin
  Result := PSIsSQLBased;
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.PSGetQuoteChar: string;
var
  oConn: TFDCustomConnection;
  oConnMeta: IFDPhysConnectionMetadata;
  eQuote: TFDPhysNameQuoteLevel;
begin
  Result := '"';
  oConn := GetConnection(False);
  if oConn <> nil then begin
    oConn.CheckOnline;
    oConnMeta := oConn.GetConnectionMetadata;
    if oConnMeta <> nil then
      for eQuote := Low(TFDPhysNameQuoteLevel) to High(TFDPhysNameQuoteLevel) do
        // TSQLResolver supports only single quote char for both start and end
        if not FDInSet(oConnMeta.NameQuoteChar[eQuote, nsLeft], [#0, ' ']) and
           (oConnMeta.NameQuoteChar[eQuote, nsLeft] = oConnMeta.NameQuoteChar[eQuote, nsRight]) then begin
          Result := oConnMeta.NameQuoteChar[eQuote, nsLeft];
          Break;
        end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.PSGetParams: TParams;
begin
  if Command <> nil then begin
    if FVclParams = nil then
      FVclParams := TParams.Create;
    FVclParams.Assign(Params);
    Result := FVclParams;
  end
  else
    Result := nil;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.PSSetParams(AParams: TParams);
begin
  if Command <> nil then begin
    if AParams.Count <> 0 then
      Params.Assign(AParams);
    Close;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.PSGetCommandText: string;
begin
  if Command <> nil then
    Result := Command.CommandText.Text
  else
    Result := '';
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.PSGetCommandType: TPSCommandType;
begin
  Result := ctUnknown;
  if Command <> nil then
    case Command.CommandKind of
    skSelect,
    skSelectForLock,
    skSelectForUnLock: Result := ctSelect;
    skDelete:          Result := ctDelete;
    skInsert,
    skMerge:           Result := ctInsert;
    skUpdate:          Result := ctUpdate;
    skCreate,
    skAlter,
    skDrop:            Result := ctDDL;
    skStoredProc,
    skStoredProcWithCrs,
    skStoredProcNoCrs: Result := ctStoredProc;
    end;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.PSSetCommandText(const CommandText: string);
begin
  if Command <> nil then
    Command.SetCommandText(CommandText, False);
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.InternalPSExecuteStatement(const ASQL: string;
  AParams: TParams; AMode: Integer; var AResultSet: TFDQuery): Integer;
begin
  Result := 0;
  CheckOnline(False);
  AResultSet := TFDQuery.Create(nil);
  try
    AResultSet.OptionsIntf.ParentOptions := OptionsIntf;
    AResultSet.FormatOptions.DataSnapCompatibility := True;
    AResultSet.ResourceOptions.ParamCreate := False;
    AResultSet.ResourceOptions.MacroCreate := False;
    AResultSet.ResourceOptions.MacroExpand := False;
    AResultSet.Connection := GetConnection(True);
    if Command <> nil then
      AResultSet.Transaction := Command.Transaction;
    AResultSet.Command.SetCommandText(ASQL, False);
    AResultSet.Params.Assign(AParams);
    case AMode of
    0:
      begin
        AResultSet.ExecSQL;
        Result := AResultSet.RowsAffected;
      end;
    1:
      begin
        AResultSet.Open;
        Result := AResultSet.RecordCount;
      end;
    2:
      if AResultSet.OpenOrExecute then
        Result := AResultSet.RecordCount
      else
        Result := AResultSet.RowsAffected;
    end;
  except
    FDFreeAndNil(AResultSet);
    raise;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.PSExecuteStatement(const ASQL: string;
  AParams: TParams; AResultSet: Pointer = nil): Integer;
var
  oQry: TFDQuery;
begin
  oQry := nil;
  try
    Result := InternalPSExecuteStatement(ASQL, AParams, Integer(Assigned(AResultSet)), oQry);
  finally
    if Assigned(AResultSet) then
      TFDQuery(AResultSet^) := oQry
    else
      FDFree(oQry);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.PSExecuteStatement(const ASQL: string;
  AParams: TParams; var AResultSet: TDataSet): Integer;
var
  oQry: TFDQuery;
begin
  oQry := nil;
  try
    Result := InternalPSExecuteStatement(ASQL, AParams, 2, oQry);
  finally
    AResultSet := oQry;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.PSExecuteStatement(const ASQL: string;
  AParams: TParams): Integer;
var
  oQry: TFDQuery;
begin
  oQry := nil;
  try
    Result := InternalPSExecuteStatement(ASQL, AParams, 0, oQry);
  finally
    FDFree(oQry);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.PSGetAttributes(AList: TPacketAttributeList);
begin
  inherited PSGetAttributes(AList);
end;

{-------------------------------------------------------------------------------}
{ IFDPhysChangeHandler }

function TFDAdaptedDataSet.GetTrackCommand: IFDPhysCommand;
begin
  if Command <> nil then begin
    if not (csDestroying in ComponentState) then
      CheckOnline(False);
    Result := Command.CommandIntf;
  end
  else
    Result := nil;
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.GetTrackEventName: String;
begin
  if ChangeAlertName <> '' then
    Result := ChangeAlertName
  else
    Result := PSGetTableName;
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.GetMergeTable: TFDDatSTable;
begin
  Result := Table;
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.GetMergeManager: TFDDatSManager;
begin
  Result := DatSManager;
end;

{-------------------------------------------------------------------------------}
function TFDAdaptedDataSet.GetContentModified: Boolean;
begin
  Result := FContentModified;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.SetContentModified(AValue: Boolean);
begin
  FContentModified := AValue;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.RefreshContent;
begin
  FContentModified := False;
  if UpdatesPending then
    CancelUpdates;
  Refresh;
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.ResyncContent;
begin
  FContentModified := False;
  ResyncViews;
end;

{-------------------------------------------------------------------------------}
{ IDataSetCommandSupport }

function TFDAdaptedDataSet.GetCommandStates(const ACommand: String): TDataSetCommandStates;
begin
  if (Adapter = nil) or (Adapter.SchemaAdapter = nil) then
    Result := inherited GetCommandStates(ACommand)
  else if SameText(ACommand, sApplyUpdatesDataSetCommand) or
          SameText(ACommand, sCancelUpdatesDataSetCommand) then begin
    Result := [dcSupported];
    if Adapter.SchemaAdapter.UpdatesPending then
      Include(Result, dcEnabled);
  end
  else
    Result := [];
end;

{-------------------------------------------------------------------------------}
procedure TFDAdaptedDataSet.ExecuteCommand(const ACommand: String;
  const AArgs: array of const);
var
  iMaxErrors: Integer;
begin
  if (Adapter = nil) or (Adapter.SchemaAdapter = nil) then
    inherited ExecuteCommand(ACommand, AArgs)
  else if SameText(ACommand, sApplyUpdatesDataSetCommand) then begin
    if Length(AArgs) = 1 then
      iMaxErrors := AArgs[0].VInteger
    else
      iMaxErrors := -1;
    Adapter.SchemaAdapter.ApplyUpdates(iMaxErrors);
  end
  else if SameText(ACommand, sCancelUpdatesDataSetCommand) then
    Adapter.SchemaAdapter.CancelUpdates;
end;

{-------------------------------------------------------------------------------}
{ TFDCustomMemTable                                                             }
{-------------------------------------------------------------------------------}
constructor TFDCustomMemTable.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FetchOptions.Mode := fmAll;
  ResourceOptions.SilentMode := True;
  UpdateOptions.CheckRequired := False;
  UpdateOptions.AutoCommitUpdates := True;
end;

{-------------------------------------------------------------------------------}
destructor TFDCustomMemTable.Destroy;
begin
  Close;
  Destroying;
  inherited Destroy;
  Adapter := nil;
  if FOptionsIntf <> nil then begin
    FOptionsIntf.ObjectDestroyed(Self);
    FOptionsIntf := nil;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomMemTable.DefineProperties(AFiler: TFiler);
begin
  inherited DefineProperties(AFiler);
  AFiler.DefineProperty('AutoCommitUpdates', ReadAutoCommitUpdates, nil, False);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomMemTable.ReadAutoCommitUpdates(AReader: TReader);
var
  lAutoCommit: Boolean;
begin
  lAutoCommit := AReader.ReadBoolean;
  if UpdateOptions.AutoCommitUpdates <> lAutoCommit then
    UpdateOptions.AutoCommitUpdates := lAutoCommit;
end;

{-------------------------------------------------------------------------------}
function TFDCustomMemTable.GetOptionsIntf: IFDStanOptions;
begin
  if Command = nil then begin
    if FOptionsIntf = nil then
      FOptionsIntf := TFDOptionsContainer.Create(Self, TFDFetchOptions,
        TFDBottomUpdateOptions, TFDBottomResourceOptions, GetParentOptions);
    Result := FOptionsIntf;
  end
  else begin
    if FOptionsIntf <> nil then begin
      // Override the command options by the FDMemTable options
      Command.FetchOptions := FOptionsIntf.FetchOptions;
      Command.FormatOptions := FOptionsIntf.FormatOptions;
      Command.UpdateOptions := FOptionsIntf.UpdateOptions as TFDBottomUpdateOptions;
      Command.ResourceOptions := FOptionsIntf.ResourceOptions as TFDBottomResourceOptions;
      // And switch to the command options usage
      FOptionsIntf := nil;
    end;
    Result := inherited GetOptionsIntf;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomMemTable.GetParentOptions(var AOpts: IFDStanOptions);
begin
  if Command <> nil then
    Command.GetParentOptions(AOpts)
  else begin
    if FManagerOptsIntf = nil then
      FDManager();
    AOpts := FManagerOptsIntf;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomMemTable.DefChanged(ASender: TObject);
begin
  FStoreDefs := True;
end;

{-------------------------------------------------------------------------------}
function TFDCustomMemTable.SaveToDFM(const AAncestor: TFDDataSet): Boolean;
begin
  Result := (DataSetField = nil) and (ParentDataSet = nil) and (DatSManager <> nil) and
    Active and (FStorage = nil) and ResourceOptions.Persistent and (ResourceOptions.PersistentFileName = '');
  if Result and (AAncestor <> nil) then
    Result := not TFDCustomMemTable(AAncestor).SaveToDFM(nil) or
      not Table.IsEqualTo(TFDCustomMemTable(AAncestor).Table) or
      not Table.Rows.IsEqualTo(TFDCustomMemTable(AAncestor).Table.Rows);
end;

{-------------------------------------------------------------------------------}
function TFDCustomMemTable.GetCommandText: String;
begin
  if Command <> nil then
    Result := Command.CommandText.Text
  else
    Result := '';
end;

{-------------------------------------------------------------------------------}
function TFDCustomMemTable.GetDisableStringTrim: Boolean;
begin
  Result := not FormatOptions.StrsTrim;
end;

{-------------------------------------------------------------------------------}
function TFDCustomMemTable.GetFetchOnDemand: Boolean;
begin
  Result := FetchOptions.Mode = fmOnDemand;
end;

{-------------------------------------------------------------------------------}
function TFDCustomMemTable.GetIsClone: Boolean;
var
  oBaseDS: TFDDataSet;
begin
  oBaseDS := Self;
  while Assigned(oBaseDS.DataSetField) do
    oBaseDS := oBaseDS.DataSetField.DataSet as TFDDataSet;
  Result := Assigned(oBaseDS.CloneSource);
end;

{-------------------------------------------------------------------------------}
function TFDCustomMemTable.GetLogChanges: Boolean;
begin
  Result := CachedUpdates;
end;

{-------------------------------------------------------------------------------}
function TFDCustomMemTable.GetProviderEOF: Boolean;
begin
  Result := SourceEOF;
end;

{-------------------------------------------------------------------------------}
function TFDCustomMemTable.GetReadOnly: Boolean;
begin
  Result := UpdateOptions.ReadOnly;
end;

{-------------------------------------------------------------------------------}
function TFDCustomMemTable.GetStatusFilter: TFDUpdateRecordTypes;
begin
  Result := FilterChanges;
end;

{-------------------------------------------------------------------------------}
function TFDCustomMemTable.GetXMLData: string;
var
  oStr: TStringStream;
begin
  oStr := TStringStream.Create('', TEncoding.UTF8);
  try
    SaveToStream(oStr, sfXML);
    Result := oStr.DataString;
  finally
    FDFree(oStr);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomMemTable.GetPacketRecords: Integer;
begin
  Result := FetchOptions.RowsetSize;
end;

{-------------------------------------------------------------------------------}
function TFDCustomMemTable.GetFileName: string;
begin
  Result := ResourceOptions.PersistentFileName;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomMemTable.SetCommandText(const AValue: String);
begin
  if Command <> nil then
    Command.CommandText.Text := AValue;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomMemTable.SetDisableStringTrim(const AValue: Boolean);
begin
  FormatOptions.StrsTrim := not AValue;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomMemTable.SetFetchOnDemand(const AValue: Boolean);
begin
  if AValue then
    FetchOptions.Mode := fmOnDemand
  else
    FetchOptions.Mode := fmManual;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomMemTable.SetLogChanges(const AValue: Boolean);
begin
  CachedUpdates := AValue;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomMemTable.SetProviderEOF(const AValue: Boolean);
begin
  FSourceEOF := AValue;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomMemTable.SetReadOnly(const AValue: Boolean);
begin
  UpdateOptions.ReadOnly := AValue;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomMemTable.SetStatusFilter(const AValue: TFDUpdateRecordTypes);
begin
  FilterChanges := AValue;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomMemTable.SetXMLData(const AValue: string);
var
  oStr: TStringStream;
begin
  oStr := TStringStream.Create(AValue, TEncoding.UTF8);
  try
    LoadFromStream(oStr, sfXML);
  finally
    FDFree(oStr);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomMemTable.SetFileName(const AValue: string);
begin
  ResourceOptions.PersistentFileName := AValue;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomMemTable.SetPacketRecords(const AValue: Integer);
begin
  FetchOptions.RowsetSize := AValue;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomMemTable.AppendData(const AData: IFDDataSetReference; AHitEOF: Boolean = True);
begin
  if Active then begin
    if (AData <> nil) and (AData.DataView <> nil) then begin
      Table.Import(AData.DataView);
      Resync([]);
    end;
  end
  else
    Data := AData;
  if AHitEOF then
    FSourceEOF := True;
end;

{-------------------------------------------------------------------------------}
function TFDCustomMemTable.ConstraintsDisabled: Boolean;
begin
  Result := not ConstraintsEnabled;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomMemTable.MergeChangeLog;
begin
  CommitUpdates;
end;

{-------------------------------------------------------------------------------}
function TFDCustomMemTable.GetOptionalParamTab: TFDDatSTable;
var
  i: Integer;
  sTabName: String;
begin
  sTabName := C_FD_SysNamePrefix + 'OPTIONAL_PARAMS';
  i := DatSManager.Tables.IndexOfName(sTabName);
  if i >= 0 then
    Result := DatSManager.Tables[i]
  else
    Result := DatSManager.Tables.Add(sTabName);
end;

{-------------------------------------------------------------------------------}
function TFDCustomMemTable.GetOptionalParam(const AParamName: string): Variant;
var
  oTab: TFDDatSTable;
  iCol: Integer;
begin
  oTab := GetOptionalParamTab;
  iCol := oTab.Columns.IndexOfName(AParamName);
  if (iCol = -1) or (oTab.Rows.Count <> 1) then
    Result := Unassigned
  else
    Result := oTab.Rows[0].GetData(iCol);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomMemTable.SetOptionalParam(const AParamName: string;
  const AValue: Variant; AIncludeInDelta: Boolean);

  function GetValueType: TFDDataType;
  var
    tp: Word;
  begin
    tp := VarType(AValue);
    case tp of
      varShortInt:
        Result := dtSByte;
      varByte:
        Result := dtByte;
      varSmallint:
        Result := dtInt16;
      varWord:
        Result := dtUInt16;
      varLongWord:
        Result := dtUInt32;
      varInteger:
        Result := dtInt32;
      varCurrency:
        Result := dtCurrency;
      varSingle:
        Result := dtSingle;
      varDouble:
        Result := dtDouble;
      varDate:
        Result := dtDateTime;
      varBoolean:
        Result := dtBoolean;
      varUString,
      varString,
      varOleStr:
        Result := dtWideMemo;
      varUInt64:
        Result := dtUInt64;
      varInt64:
        Result := dtInt64;
      varArray or varByte:
        Result := dtBlob;
    else
      if tp = VarFMTBcd then
        Result := dtFmtBCD
      else if tp = VarSQLTimeStamp then
        Result := dtDateTimeStamp
      else if tp = FDVarSQLTimeInterval then
        Result := dtTimeIntervalFull
      else
        Result := dtBlob;
      end;
    end;

var
  oTab, oTab2: TFDDatSTable;
  iCol: Integer;
  oRow: TFDDatSRow;
begin
  oTab := GetOptionalParamTab;
  iCol := oTab.Columns.IndexOfName(AParamName);
  if (oTab.Rows.Count > 0) and (iCol = -1) then begin
    oTab2 := TFDDatSTable.Create;
    oTab2.Columns.Assign(oTab.Columns);
    iCol := oTab2.Columns.Add(AParamName, GetValueType).Index;
    oTab2.ImportRow(oTab.Rows[0]);
    FDFree(oTab);
    oTab2.Name := C_FD_SysNamePrefix + 'OPTIONAL_PARAMS';
    DatSManager.Tables.Add(oTab2);
    oTab := oTab2;
  end
  else if (oTab.Rows.Count = 0) and (iCol = -1) then begin
    iCol := oTab.Columns.Add(AParamName, GetValueType).Index;
    oTab.Rows.Add([]);
  end;
  oRow := oTab.Rows[0];
  oRow.BeginEdit;
  oRow.SetData(iCol, AValue);
  oRow.EndEdit(True);
end;

{-------------------------------------------------------------------------------}
function TFDCustomMemTable.GetExists: Boolean;
begin
  Result := Active;
end;

{-------------------------------------------------------------------------------}
{ TFDRdbmsDataSet                                                               }
{-------------------------------------------------------------------------------}
constructor TFDRdbmsDataSet.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  SetAdapter(InternalCreateAdapter);
  Command.FOwner := Self;
  if FDIsDesigning(Self) then
    Connection := FDFindDefaultConnection(Self);
end;

{-------------------------------------------------------------------------------}
destructor TFDRdbmsDataSet.Destroy;
begin
  Destroying;
  ChangeAlerter := nil;
  Disconnect(True);
  Connection := nil;
  ConnectionName := '';
  Transaction := nil;
  inherited Destroy;
  if Command <> nil then
    Command.FOwner := nil;
  FDFreeAndNil(FAdapter);
end;

{-------------------------------------------------------------------------------}
procedure TFDRdbmsDataSet.Loaded;
begin
  inherited Loaded;
  try
    if FStreamedPrepared and DoStoredActivation then
      SetPrepared(True);
  except
    if csDesigning in ComponentState then
      InternalHandleException
    else
      raise;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDRdbmsDataSet.DefineProperties(AFiler: TFiler);
begin
  inherited DefineProperties(AFiler);
  Command.DefineProperties(AFiler);
end;

{-------------------------------------------------------------------------------}
function TFDRdbmsDataSet.InternalCreateAdapter: TFDCustomTableAdapter;
begin
  Result := TFDTableAdapter.Create(nil);
  Result.SelectCommand := TFDCommand.Create(Result);
end;

{-------------------------------------------------------------------------------}
function TFDRdbmsDataSet.GetConnection: TFDCustomConnection;
begin
  if Command = nil then
    Result := nil
  else
    Result := Command.Connection;
end;

{-------------------------------------------------------------------------------}
procedure TFDRdbmsDataSet.SetConnection(const AValue: TFDCustomConnection);
begin
  if Connection <> AValue then begin
    Disconnect(True);
    Command.Connection := AValue;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDRdbmsDataSet.GetConnectionName: String;
begin
  if Command = nil then
    Result := ''
  else
    Result := Command.ConnectionName;
end;

{-------------------------------------------------------------------------------}
procedure TFDRdbmsDataSet.SetConnectionName(const AValue: String);
begin
  if ConnectionName <> AValue then
    Command.ConnectionName := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDRdbmsDataSet.IsCNNS: Boolean;
begin
  Result := not IsCNS;
end;

{-------------------------------------------------------------------------------}
function TFDRdbmsDataSet.IsCNS: Boolean;
begin
  Result := (Connection <> nil) and
    (Connection.Name <> '') and (Connection.Owner <> nil) and
    (Connection.ConnectionName = ConnectionName);
end;

{-------------------------------------------------------------------------------}
function TFDRdbmsDataSet.GetTransaction: TFDCustomTransaction;
begin
  if Command = nil then
    Result := nil
  else
    Result := Command.Transaction;
end;

{-------------------------------------------------------------------------------}
procedure TFDRdbmsDataSet.SetTransaction(const AValue: TFDCustomTransaction);
begin
  if Transaction <> AValue then
    Command.Transaction := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDRdbmsDataSet.GetUpdateTransaction: TFDCustomTransaction;
begin
  Result := Adapter.UpdateTransaction;
end;

{-------------------------------------------------------------------------------}
procedure TFDRdbmsDataSet.SetUpdateTransaction(const AValue: TFDCustomTransaction);
begin
  Adapter.UpdateTransaction := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDRdbmsDataSet.GetSchemaAdapter: TFDCustomSchemaAdapter;
begin
  Result := Adapter.SchemaAdapter;
end;

{-------------------------------------------------------------------------------}
procedure TFDRdbmsDataSet.SetSchemaAdapter(const AValue: TFDCustomSchemaAdapter);
begin
  CheckInactive;
  Adapter.SchemaAdapter := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDRdbmsDataSet.GetPrepared: Boolean;
begin
  Result := Command.Prepared;
end;

{-------------------------------------------------------------------------------}
procedure TFDRdbmsDataSet.SetPrepared(const AValue: Boolean);
begin
  if csReading in ComponentState then
    FStreamedPrepared := AValue
  else if (Command <> nil) and
    // The second OR part protects against the case, when the command interface was
    // created with ckCreateIntfDontPrepare in FFlags. Without it an app may run
    // into "FDPhysManager timeout". See FD-0250 for details.
          ((Command.Prepared <> AValue) or not AValue and (Command.CommandIntf <> nil)) then begin
    if AValue then
      DoPrepareSource
    else
      DoUnprepareSource;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDRdbmsDataSet.ReleaseBase(AOffline: Boolean);
var
  oAdapt: IFDDAptTableAdapter;
begin
  inherited ReleaseBase(AOffline);
  if Adapter <> nil then begin
    oAdapt := Adapter.TableAdapterIntf;
    if oAdapt <> nil then begin
      oAdapt.Transaction := nil;
      oAdapt.UpdateTransaction := nil;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDRdbmsDataSet.IsPS: Boolean;
begin
  Result := Prepared and not Active;
end;

{-------------------------------------------------------------------------------}
procedure TFDRdbmsDataSet.CheckCachedUpdatesMode;
begin
  if not CachedUpdates then
    FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_ClntNotCachedUpdates,
      [GetDisplayName]);
end;

{-------------------------------------------------------------------------------}
function TFDRdbmsDataSet.FindMacro(const AValue: string): TFDMacro;
begin
  Result := Command.Macros.FindMacro(AValue);
end;

{-------------------------------------------------------------------------------}
function TFDRdbmsDataSet.MacroByName(const AValue: string): TFDMacro;
begin
  Result := Command.Macros.MacroByName(AValue);
end;

{-------------------------------------------------------------------------------}
function TFDRdbmsDataSet.GetMacrosCount: Integer;
begin
  Result := Command.Macros.Count;
end;

{-------------------------------------------------------------------------------}
function TFDRdbmsDataSet.GetMacros: TFDMacros;
begin
  Result := Command.Macros;
end;

{-------------------------------------------------------------------------------}
procedure TFDRdbmsDataSet.SetMacros(const AValue: TFDMacros);
begin
  Command.Macros := AValue;
end;

{-------------------------------------------------------------------------------}
procedure TFDRdbmsDataSet.OpenCursor(InfoQuery: Boolean);
var
  oConn: TFDCustomConnection;
begin
  oConn := Command.AcquireConnection;
  try
    oConn.AttachClient(Self);
    try
      inherited OpenCursor(InfoQuery);
    except
      oConn.DetachClient(Self);
      raise;
    end;
  finally
    Command.ReleaseConnection(oConn);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDRdbmsDataSet.InternalClose;
var
  oConn: TFDCustomConnection;
begin
  oConn := Command.GetConnection(False);
  try
    inherited InternalClose;
  finally
    if oConn <> nil then
      oConn.DetachClient(Self);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDRdbmsDataSet.Disconnect(AAbortJob: Boolean = False);
begin
  inherited Disconnect(AAbortJob);
  Prepared := False;
end;

{-------------------------------------------------------------------------------}
procedure TFDRdbmsDataSet.Prepare;
begin
  Prepared := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDRdbmsDataSet.Unprepare;
begin
  Prepared := False;
end;

{-------------------------------------------------------------------------------}
procedure TFDRdbmsDataSet.Open(const ASQL: String; const AParams: array of Variant;
  const ATypes: array of TFieldType);
var
  i: Integer;
begin
  Close;
  if ASQL <> '' then
    Command.SetCommandText(ASQL,
      not (Command.CommandKind in [skStoredProc, skStoredProcNoCrs, skStoredProcWithCrs]) and
      ResourceOptions.ParamCreate);
  if Command.CommandKind in [skStoredProc, skStoredProcNoCrs, skStoredProcWithCrs] then
    Prepare;
  if Params.BindMode = pbByNumber then
    for i := 0 to Params.Count - 1 do
      Params[i].Position := i + 1;
  for i := Low(ATypes) to High(ATypes) do
    if ATypes[i] <> ftUnknown then
      Params[i].DataType := ATypes[i];
  for i := Low(AParams) to High(AParams) do
    Params[i].Value := AParams[i];
  if not (Command.CommandKind in [skStoredProc, skStoredProcNoCrs, skStoredProcWithCrs]) then
    Prepare;
  Open;
end;

{-------------------------------------------------------------------------------}
procedure TFDRdbmsDataSet.Open(const ASQL: String);
begin
  Open(ASQL, [], []);
end;

{-------------------------------------------------------------------------------}
procedure TFDRdbmsDataSet.Open(const ASQL: String; const AParams: array of Variant);
begin
  Open(ASQL, AParams, []);
end;

{-------------------------------------------------------------------------------}
function TFDRdbmsDataSet.GetOnError: TFDErrorEvent;
begin
  Result := FAdapter.OnError;
end;

{-------------------------------------------------------------------------------}
procedure TFDRdbmsDataSet.SetOnError(const AValue: TFDErrorEvent);
begin
  FAdapter.OnError := AValue;
  Command.OnError := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDRdbmsDataSet.GetOnCommandChanged: TNotifyEvent;
begin
  Result := Command.OnCommandChanged;
end;

{-------------------------------------------------------------------------------}
procedure TFDRdbmsDataSet.SetOnCommandChanged(const AValue: TNotifyEvent);
begin
  Command.OnCommandChanged := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDRdbmsDataSet.GetParamBindMode: TFDParamBindMode;
begin
  Result := Command.ParamBindMode;
end;

{-------------------------------------------------------------------------------}
procedure TFDRdbmsDataSet.SetParamBindMode(const AValue: TFDParamBindMode);
begin
  Command.ParamBindMode := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDRdbmsDataSet.GetRowsAffected: TFDCounter;
begin
  Result := Command.RowsAffected;
end;

{-------------------------------------------------------------------------------}
{ TFDUpdateSQL                                                                  }
{-------------------------------------------------------------------------------}
constructor TFDUpdateSQL.Create(AOwner: TComponent);
var
  i: Integer;
begin
  inherited Create(AOwner);
  for i := 0 to 5 do
    FCommands[i] := TFDCustomCommand.Create(nil);
  if FDIsDesigning(Self) then
    Connection := FDFindDefaultConnection(Self);
end;

{-------------------------------------------------------------------------------}
destructor TFDUpdateSQL.Destroy;
var
  i: Integer;
begin
  for i := 0 to 5 do
    if FCommands[i] <> nil then
      FDFreeAndNil(FCommands[i]);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
procedure TFDUpdateSQL.Notification(AComponent: TComponent; AOperation: TOperation);
begin
  if (AOperation = opRemove) and (AComponent = Connection) then
    Connection := nil;
  inherited Notification(AComponent, AOperation);
end;

{-------------------------------------------------------------------------------}
procedure TFDUpdateSQL.AttachToAdapter;
var
  oAdapt: TFDCustomTableAdapter;
begin
  oAdapt := FDataSet.Adapter;
  oAdapt.InsertCommand := GetCommand(arInsert);
  oAdapt.UpdateCommand := GetCommand(arUpdate);
  oAdapt.DeleteCommand := GetCommand(arDelete);
  oAdapt.LockCommand := GetCommand(arLock);
  oAdapt.UnLockCommand := GetCommand(arUnlock);
  oAdapt.FetchRowCommand := GetCommand(arFetchRow);
end;

{-------------------------------------------------------------------------------}
procedure TFDUpdateSQL.DetachFromAdapter;
var
  i: Integer;
  oAdapt: TFDCustomTableAdapter;
begin
  for i := 0 to 5 do
    if FCommands[i] <> nil then
      FCommands[i].OptionsIntf.ParentOptions := nil;
  oAdapt := FDataSet.Adapter;
  oAdapt.InsertCommand := nil;
  oAdapt.UpdateCommand := nil;
  oAdapt.DeleteCommand := nil;
  oAdapt.LockCommand := nil;
  oAdapt.UnLockCommand := nil;
  oAdapt.FetchRowCommand := nil;
end;

{-------------------------------------------------------------------------------}
function TFDUpdateSQL.GetCommand(ARequest: TFDUpdateRequest): TFDCustomCommand;
var
  sConnName: String;
  oConn: TFDCustomConnection;
  onErr: TFDErrorEvent;
  oFtch: TFDFetchOptions;
  oRes: TFDResourceOptions;
begin
  Result := FCommands[Integer(ARequest) - Integer(Low(TFDUpdateRequest))];
  sConnName := ConnectionName;
  oConn := Connection;
  onErr := nil;
  if DataSet is TFDRdbmsDataSet then begin
    if (sConnName = '') and (oConn = nil) then begin
      oConn := TFDRdbmsDataSet(DataSet).Connection;
      sConnName := TFDRdbmsDataSet(DataSet).ConnectionName;
    end;
    onErr := TFDRdbmsDataSet(DataSet).OnError;
  end;
  if (Result.ConnectionName <> sConnName) or (Result.Connection <> oConn) or
     not Result.Prepared then begin
    Result.Disconnect;
    Result.ConnectionName := sConnName;
    Result.Connection := oConn;
    if DataSet <> nil then
      Result.OptionsIntf.ParentOptions := DataSet.OptionsIntf
    else
      Result.OptionsIntf.ParentOptions := nil;

    oFtch := Result.FetchOptions;
    oFtch.Mode := fmExactRecsMax;
    oFtch.RecsMax := 1;
    oFtch.Items := oFtch.Items - [fiMeta];
    oFtch.Cache := [];
    oFtch.AutoClose := True;
    oFtch.AutoFetchAll := afAll;

    oRes := Result.ResourceOptions;
    if oRes.CmdExecMode = amAsync then
      oRes.CmdExecMode := amBlocking;
    oRes.Persistent := False;

    Result.OnError := onErr;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDUpdateSQL.GetSQL(const AIndex: Integer): TStrings;
begin
  Result := FCommands[AIndex].CommandText;
end;

{-------------------------------------------------------------------------------}
procedure TFDUpdateSQL.SetSQL(const AIndex: Integer; const AValue: TStrings);
begin
  FCommands[AIndex].CommandText := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDUpdateSQL.GetURSQL(ARequest: TFDUpdateRequest): TStrings;
begin
  Result := FCommands[Integer(ARequest) - Integer(Low(TFDUpdateRequest))].CommandText;
end;

{-------------------------------------------------------------------------------}
procedure TFDUpdateSQL.SetURSQL(ARequest: TFDUpdateRequest;
  const Value: TStrings);
begin
  FCommands[Integer(ARequest) - Integer(Low(TFDUpdateRequest))].CommandText := Value;
end;

{-------------------------------------------------------------------------------}
procedure TFDUpdateSQL.UpdateAdapter;
begin
  if (FDataSet <> nil) and (FDataSet.Adapter <> nil) then begin
    DetachFromAdapter;
    AttachToAdapter;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDUpdateSQL.SetConnection(const Value: TFDCustomConnection);
begin
  if FConnection <> Value then begin
    FConnection := Value;
    if FConnection <> nil then
      FConnection.FreeNotification(Self);
    UpdateAdapter;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDUpdateSQL.SetConnectionName(const Value: String);
begin
  if FConnectionName <> Value then begin
    FConnectionName := Value;
    UpdateAdapter;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDUpdateSQL.Apply(ARequest: TFDUpdateRequest;
  var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
var
  oCmd: TFDCustomCommand;
begin
  oCmd := Commands[ARequest];
  if (oCmd.CommandText.Count > 0) and (DataSet <> nil) and (DataSet.Adapter <> nil) then begin
    DataSet.Adapter.Update(DataSet.GetRow(), AAction, AOptions, ARequest);
    if oCmd.CommandIntf <> nil then
      oCmd.FRowsAffected := oCmd.CommandIntf.RowsAffected;
  end;
end;

{-------------------------------------------------------------------------------}
{ TFDCustomQuery                                                                }
{-------------------------------------------------------------------------------}
constructor TFDCustomQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // FetchOptions.Items := FetchOptions.Items - [fiMeta];
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomQuery.DefineProperties(AFiler: TFiler);
begin
  inherited DefineProperties(AFiler);
  AFiler.DefineProperty('DataSource', ReadDataSource, nil, False);
  AFiler.DefineProperty('CommandText', ReadCommandText, nil, False);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomQuery.ReadDataSource(AReader: TReader);
begin
  __TReader(AReader).ReadPropValue(Self, GetPropInfo(ClassInfo, 'MasterSource'));
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomQuery.ReadCommandText(AReader: TReader);
begin
  Command.CommandText.Text := AReader.ReadString;
end;

{-------------------------------------------------------------------------------}
function TFDCustomQuery.GetSQL: TStrings;
begin
  Result := Command.CommandText;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomQuery.SetSQL(const AValue: TStrings);
begin
  Command.CommandText := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDCustomQuery.GetText: String;
begin
  Result := Command.SQLText;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomQuery.ExecSQL;
begin
  Execute;
end;

{-------------------------------------------------------------------------------}
function TFDCustomQuery.ExecSQL(AExecDirect: Boolean): LongInt;
begin
  ResourceOptions.CmdExecMode := amBlocking;
  ResourceOptions.DirectExecute := AExecDirect;
  try
    Execute;
  finally
    if AExecDirect then
      Disconnect();
  end;
  Result := RowsAffected;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomQuery.ExecOrOpen;
var
 I: Integer;
begin
   for I := 0 to ParamCount - 1 do
       if Params.Items[I].AsString = '' then
          Params.Items[I].Value := null;
   if StartsText( 'SELECT', UpperCase( SQL.Text ) ) then
      Open
   else
     Execute;
end;

function TFDCustomQuery.ExecSQL(const ASQL: String; const AParams: array of Variant;
  const ATypes: array of TFieldType): LongInt;
var
  i: Integer;
begin
  Close;
  if ASQL <> '' then
    Command.SetCommandText(ASQL, ResourceOptions.ParamCreate);
  if Params.BindMode = pbByNumber then
    for i := 0 to Params.Count - 1 do
      Params[i].Position := i + 1;
  for i := Low(ATypes) to High(ATypes) do
    if ATypes[i] <> ftUnknown then
      Params[i].DataType := ATypes[i];
  for i := Low(AParams) to High(AParams) do
    Params[i].Value := AParams[i];
  Prepare;
  Execute;
  Result := RowsAffected;
end;

{-------------------------------------------------------------------------------}
function TFDCustomQuery.ExecSQL(const ASQL: String): LongInt;
begin
  Result := ExecSQL(ASQL, [], []);
end;

{-------------------------------------------------------------------------------}
function TFDCustomQuery.ExecSQL(const ASQL: String;
  const AParams: array of Variant): LongInt;
begin
  Result := ExecSQL(ASQL, AParams, []);
end;

{-------------------------------------------------------------------------------}
function TFDCustomQuery.GetDS: TDataSource;
begin
  Result := MasterSource;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomQuery.SetDS(const AValue: TDataSource);
begin
  MasterSource := AValue;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomQuery.UpdateRecordCount;
var
  oQuery: TFDQuery;
  oGen: IFDPhysCommandGenerator;
  oFtch: TFDFetchOptions;
  oRes: TFDResourceOptions;
begin
  FRecordCount := 0;
  Prepared := True;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.ConnectionName := ConnectionName;
    oQuery.Connection := Connection;
    oQuery.Transaction := Transaction;

    oFtch := oQuery.FetchOptions;
    oFtch.RecsMax := 1;
    oFtch.Items := [];
    oFtch.AutoClose := True;
    oFtch.AutoFetchAll := afAll;
    oFtch.RecordCountMode := cmVisible;
    oFtch.Mode := fmExactRecsMax;

    oRes := oQuery.ResourceOptions;
    if oRes.CmdExecMode = amAsync then
      oRes.CmdExecMode := amBlocking;
    oRes.DirectExecute := True;
    oRes.PreprocessCmdText := False;
    oRes.Persistent := False;

    PointedConnection.ConnectionIntf.CreateCommandGenerator(oGen, Command.CommandIntf);
    oQuery.SQL.Text := oGen.GenerateCountSelect();
    oQuery.Params.Assign(Params);
    oQuery.Open;
    FRecordCount := oQuery.Fields[0].AsInteger;
    // If RecsMax >= 0, then TFDPhysCommand.GenerateLimitSelect always
    // asks for RecsMax + 1 records.
    oFtch := FetchOptions;
    if (oFtch.Mode = fmExactRecsMax) and (oFtch.RecsMax >= 0) and (FRecordCount > 0) then
      Dec(FRecordCount);
  finally
    FDFree(oQuery);
  end;
end;

{-------------------------------------------------------------------------------}
{ TFDTable                                                                      }
{-------------------------------------------------------------------------------}
                                                                          
                             

constructor TFDTable.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FClientCursor := False;
  FWindowSize := 2;
  UpdateOptions.RequestLive := True;
end;

{-------------------------------------------------------------------------------}
function TFDTable.InternalCreateAdapter: TFDCustomTableAdapter;
begin
  Result := inherited InternalCreateAdapter;
  Result.SelectCommand.FEnableParamsStorage := False;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.MoveData(ATableSrc, ATableDst: TFDDatSTable);
var
  rState: TFDDatSLoadState;
begin
  ATableDst.BeginLoadData(rState, lmHavyLoading);
  try
    ATableDst.Import(ATableSrc);
  finally
    ATableDst.EndLoadData(rState);
  end;
end;

{-------------------------------------------------------------------------------}
{ Get / set props }

function TFDTable.GetCustomWhere: String;
begin
  // nothing
  Result := '';
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.TableChanged;
begin
  Unprepare;
  FPrimaryKeyFields := '';
  if FResetIndexFieldNames then begin
    IndexFieldNames := '';
    FResetIndexFieldNames := False;
  end;
  SQL.Clear;
  Indexes.Clear;
  IndexDefs.Clear;
  IndexDefs.Updated := False;
  FieldDefs.Updated := False;
  DataEvent(dePropertyChange, 0);
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.SetTableName(const AValue: String);
begin
  CheckInactive;
  if FTableName <> AValue then begin
    FTableName := AValue;
    UpdateOptions.UpdateTableName := AValue;
    TableChanged;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.SetSchemaName(const AValue: String);
begin
  CheckInactive;
  if FSchemaName <> AValue then begin
    FSchemaName := AValue;
    TableChanged;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.SetCatalogName(const AValue: String);
begin
  CheckInactive;
  if FCatalogName <> AValue then begin
    FCatalogName := AValue;
    TableChanged;
  end;
end;

{-------------------------------------------------------------------------------}
{ Open / close }

function TFDTable.UpdateCursorKind: Boolean;
var
  lPrevCursor: Boolean;
begin
  lPrevCursor := FClientCursor;

  // Setup cursor kind
  if CachedUpdates or FetchOptions.Unidirectional or Filtered and Assigned(OnFilterRecord) or
     (FStorage <> nil) then
    FClientCursor := True
  else
    case FetchOptions.CursorKind of
    ckAutomatic:
      FClientCursor := FPrimaryKeyFields = '';
    ckDefault,
    ckStatic,
    ckForwardOnly:
      FClientCursor := True;
    ckDynamic:
      FClientCursor := False;
    end;

  // The table must have a primary key !
  // Without it the live data window will not work properly.
  if not FClientCursor and (FPrimaryKeyFields = '') then
    FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_ClntPKNotFound,
      [GetDisplayName]);

  Result := (lPrevCursor <> FClientCursor) and Active;

  // After changing the cursor kind the bookmark size may be changed
  if Result then begin
    BookmarkSize := CalcBookmarkSize;
    Adapter.DatSTable := Table;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDTable.IsSequenced: Boolean;
begin
  Result := FClientCursor or FetchOptions.LiveWindowParanoic;
end;

{-------------------------------------------------------------------------------}
function TFDTable.DoIsSourceOpen: Boolean;
begin
  if FClientCursor then
    Result := inherited DoIsSourceOpen
  else
    Result := Active;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.SetupTable;
var
  oView, oView2: TFDDatSView;
  oConnMeta: IFDPhysConnectionMetadata;
  oConn: TFDCustomConnection;
  iVal, i: Integer;
begin
  oConn := Command.AcquireConnection;
  try
    oConnMeta := oConn.GetConnectionMetadataIntf;
    FServerCursor := oConnMeta.ServerCursorSupported;

    // Get unique identifying fields
    if FPrimaryKeyFields = '' then
      FPrimaryKeyFields := PSGetKeyFields;

    if (FPrimaryKeyFields = '') and (fiMeta in FetchOptions.Items) then begin
      oView := oConnMeta.GetTablePrimaryKeyFields(CatalogName, SchemaName, TableName, '');
      try
        FPrimaryKeyFields := oView.Rows.GetValuesList('COLUMN_NAME', ';', '');
      finally
        FDClearMetaView(oView, FetchOptions);
      end;
      if FPrimaryKeyFields = '' then begin
        oView := oConnMeta.GetTableIndexes(CatalogName, SchemaName, TableName, '');
        try
          for i := 0 to oView.Rows.Count - 1 do begin
            iVal := oView.Rows[i].GetData('INDEX_TYPE');
            if TFDPhysIndexKind(iVal) = ikUnique then begin
              oView2 := oConnMeta.GetTableIndexFields(CatalogName, SchemaName,
                TableName, oView.Rows[i].GetData('INDEX_NAME'), '');
              try
                FPrimaryKeyFields := oView2.Rows.GetValuesList('COLUMN_NAME', ';', '');
              finally
                FDFree(oView2);
              end;
              Break;
            end;
          end;
        finally
          FDClearMetaView(oView, FetchOptions);
        end;
      end;
    end;

    // Setup cursor kind
    UpdateCursorKind();

    // Save null location for window generation
    FTableParams.FNullLocation := oConnMeta.NullLocations;
  finally
    Command.ReleaseConnection(oConn);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.OpenCursor(AInfoQuery: Boolean);
var
  iFetched: Integer;
  eOptions: TFDSortOptions;
begin
  SetupTable;
  UpdateIndexDefs;
  eOptions := [];
  FResetIndexFieldNames := (IndexFieldNames = '') and (IndexName = '');
  if FResetIndexFieldNames then
    IndexFieldNames := DoAdjustSortFields('', '', eOptions);

  FTableParams.FTableCommand := tcBof;
  FTableParams.FLastTableCommand := tcUnknown;
  FetchWindow(iFetched, True);

  inherited OpenCursor(AInfoQuery);
  if not FClientCursor and (FRecordIndex > -1) then
    FRecordIndex := 0;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.Open(const ATableName: String);
begin
  Close;
  if ATableName <> '' then
    TableName := ATableName;
  Open;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.ReleaseBase(AOffline: Boolean);
begin
  inherited ReleaseBase(AOffline);
  if FClientCursor then
    Exit;

  FSourceEOF := False;
  FTableParams.FLastTableCommand := tcUnknown;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.Disconnect(AAbortJob: Boolean);
begin
  if not FWindowOperation or FClientCursor then
    inherited Disconnect(AAbortJob);
  Prepared := False;
end;

{-------------------------------------------------------------------------------}
{ Bookmarks }

type
  TLen = Cardinal;
  PLen = ^TLen;

function TFDTable.GetBookmarkColSize(ACol: TFDDatSColumn): LongWord;
begin
  Result := SizeOf(TLen);
  if caBlobData in ACol.Attributes then
    Inc(Result, FDAlign(FormatOptions.InlineDataSize))
  else if ACol.DataType in C_FD_StrTypes then
    Inc(Result, FDAlign(ACol.StorageSize - SizeOf(Word)))
  else
    Inc(Result, FDAlign(ACol.StorageSize));
end;

{-------------------------------------------------------------------------------}
function TFDTable.CalcBookmarkSize: LongWord;
var
  i: Integer;
  sIndexFields: String;
  oCol: TFDDatSColumn;
begin
  Result := inherited CalcBookmarkSize;
  if FClientCursor then
    Exit;

  i := 1;
  sIndexFields := ActualIndexFieldNames;
  while i <= Length(sIndexFields) do begin
    oCol := Table.Columns.ColumnByName(FDExtractFieldName(sIndexFields, i));
    Inc(Result, GetBookmarkColSize(oCol));
  end;
  Result := LongWord(SizeOf(TLen) +                 // Str length
    FDAlign(Length(sIndexFields) * SizeOf(Char))) + // str
    Result;                                         // data buffer
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.GetBookmarkData(Buffer: TRecBuf; Data: TBookmark);
var
  i, iIndFldLen: Integer;
  oCol: TFDDatSColumn;
  iBuffLen,
  iDataLen: LongWord;
  pBuff,
  pData: Pointer;
  sIndexFields: String;
begin
  inherited GetBookmarkData(Buffer, Data);
  if FClientCursor then
    Exit;

  sIndexFields := ActualIndexFieldNames;
  iIndFldLen := Length(sIndexFields) * SizeOf(Char);
  // length of index fields
  pBuff := PByte(Data) + SizeOf(TFDBookmarkData);
  PLen(pBuff)^ := iIndFldLen;
  // index fields
  pBuff := PByte(pBuff) + SizeOf(TLen);
  Move(sIndexFields[1], pBuff^, iIndFldLen);
  pBuff := PByte(pBuff) + FDAlign(iIndFldLen);

  // fields data
  i := 1;
  while i <= Length(sIndexFields) do begin
    oCol := PFDBookmarkData(Data)^.FRow.Table.Columns.ColumnByName(
      FDExtractFieldName(sIndexFields, i));
    iBuffLen := GetBookmarkColSize(oCol) - SizeOf(TLen);
    pData := PByte(pBuff) + SizeOf(TLen);
    if PFDBookmarkData(Data)^.FRow.GetData(oCol.Index, rvDefault, pData,
                                           iBuffLen, iDataLen, True) then
      PLen(pBuff)^ := iDataLen
    else
      PLen(pBuff)^ := TLen(-1);
    pBuff := PByte(pBuff) + SizeOf(TLen) + iBuffLen;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDTable.Bookmark2Fields(const ABookmark: TBookmark; var ADataPtr: Pointer): String;
var
  iDataLen: Integer;
  pBuff: Pointer;
begin
  Result := '';
  if ABookmark <> nil then begin
    pBuff := PByte(ABookmark) + SizeOf(TFDBookmarkData);
    iDataLen := PLen(pBuff)^;
    pBuff := PByte(pBuff) + SizeOf(TLen);
    SetString(Result, PChar(pBuff), iDataLen div SizeOf(Char));
    ADataPtr := PByte(pBuff) + FDAlign(iDataLen);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDTable.Bookmark2Key(const ABookmark: TBookmark; APKOnly: Boolean = False): Variant;
var
  oRow: TFDDatSRow;
  oCol: TFDDatSColumn;
  i: Integer;
  iBuffLen,
  iDataLen: LongWord;
  pBuff: Pointer;
  sIndexFields: String;
begin
  oRow := Table.NewRow(False);
  try
    sIndexFields := Bookmark2Fields(ABookmark, pBuff);
    i := 1;
    while i <= Length(sIndexFields) do begin
      oCol := oRow.Table.Columns.ColumnByName(FDExtractFieldName(sIndexFields, i));
      iBuffLen := GetBookmarkColSize(oCol);
      iDataLen := PLen(pBuff)^;
      if iDataLen = TLen(-1) then
        oRow.SetData(oCol.Index, nil, 0)
      else
        oRow.SetData(oCol.Index, PByte(pBuff) + SizeOf(TLen), iDataLen);
      pBuff := PByte(pBuff) + iBuffLen;
    end;
    if APKOnly then
      Result := oRow.GetValues(FPrimaryKeyFields)
    else
      Result := oRow.GetValues(sIndexFields);
  finally
    FDFree(oRow);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDTable.InternalBookmarkValid(ABookmark: Pointer): Boolean;
var
  i: Integer;
  sBookmarFields: String;
  sField: String;
  pBuff: Pointer;
begin
  sBookmarFields := ';' + UpperCase(Bookmark2Fields(ABookmark, pBuff)) + ';';
  Result := True;
  i := 1;
  while i <= Length(FPrimaryKeyFields) do begin
    sField := ';' + UpperCase(FDExtractFieldName(FPrimaryKeyFields, i)) + ';';
    if Pos(sField, sBookmarFields) = 0 then begin
      Result := False;
      Break;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDTable.BookmarkValid(ABookmark: TBookmark): Boolean;
begin
  if FClientCursor then begin
    Result := inherited BookmarkValid(ABookmark);
    Exit;
  end;

  Result := (ABookmark <> nil) and InternalBookmarkValid(ABookmark);
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.InternalGotoBookmark(ABookmark: Pointer);

  procedure ErrorNoBmk;
  var
    pBuff: Pointer;
  begin
    FDException(Self, [S_FD_LComp, S_FD_LComp_PDS], er_FD_DSIncompatBmkFields,
      [Bookmark2Fields(ABookmark, pBuff), GetDisplayName, FPrimaryKeyFields]);
  end;

var
  vLocValue: Variant;
  oTable: TFDDatSTable;
begin
  if FClientCursor then begin
    inherited InternalGotoBookmark(ABookmark);
    Exit;
  end;

  if not InternalBookmarkValid(ABookmark) then
    ErrorNoBmk;

  oTable := nil;
  try
    vLocValue := Bookmark2Key(ABookmark, True);
    if not inherited LocateRecord(FPrimaryKeyFields, vLocValue, [lxoCheckOnly], FRecordIndex) then begin
      oTable := TFDDatSTable.Create;
      if InternalSearch(oTable, FPrimaryKeyFields, vLocValue) then begin
        Table.Clear;
        MoveData(oTable, Table);
        FRecordIndex := 0;
      end;
    end;
  finally
    FDFree(oTable);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.InternalGotoBookmark(Bookmark: TBookmark);
begin
  InternalGotoBookmark(Pointer(Bookmark));
end;

{-------------------------------------------------------------------------------}
function TFDTable.CompareBookmarks(Bookmark1, Bookmark2: TBookmark): Integer;

  procedure ErrorNoBmk(const AFields1, AFields2: String);
  begin
    FDException(Self, [S_FD_LComp, S_FD_LComp_PDS], er_FD_DSIncompatBmkFields,
      [AFields1, GetDisplayName, AFields2]);
  end;

var
  vValues1: Variant;
  vValues2: Variant;
  sFields1: String;
  sFields2: String;
  lPKOnly1: Boolean;
  lPKOnly2: Boolean;
  sIndexFields: String;
  lNullFirst: Boolean;
  sDescFields: String;
  sNoCaseFields: String;
  sTmp: String;
  sField: String;
  i: Integer;
  iVarIndex: Integer;
  pBuff: Pointer;

  function CompareVar(const AValue1, AValue2: Variant; const AField: String): Integer;
  var
    lDesc: Boolean;
    lNoCase: Boolean;
    eCmpResult: TVariantRelationship;
  begin
    ASSERT(not VarIsArray(AValue1) and not VarIsArray(AValue2));

    Result := 0;
    if FDSameVariants(AValue1, AValue2) or
       VarIsNull(AValue1) and VarIsNull(AValue2) then
      // nothing to do

    else if VarIsNull(AValue1) and not VarIsNull(AValue2) then
      if lNullFirst then
        Result := -1
      else
        Result := 1

    else if not VarIsNull(AValue1) and VarIsNull(AValue2) then
      if lNullFirst then
        Result := 1
      else
        Result := -1

    else begin
      lDesc := Pos(UpperCase(sDescFields), AField) > 0;
      lNoCase := Pos(UpperCase(sNoCaseFields), AField) > 0;

      // DescFields handling
      if lDesc and not lNoCase then begin
        eCmpResult := VarCompareValue(AValue1, AValue2);
        // invert result comparsion.
        if eCmpResult = vrLessThan then
          Result := 1
        else if eCmpResult = vrGreaterThan then
          Result := -1
        else
          // never happen unless varEmpty
          ASSERT(False);
      end

      // nocase field handling
      else if not lDesc and lNoCase then
        Result := CompareText(VarToStr(vValues1), VarToStr(vValues2))

      else if lDesc and lNoCase then begin
        Result := CompareText(VarToStr(vValues1), VarToStr(vValues2));
        // invert result
        Result := -Result;
      end

      // not lDesc and not lNoCase
      else begin
        eCmpResult := VarCompareValue(AValue1, AValue2);
        if eCmpResult = vrLessThan then
          Result := -1
        else if eCmpResult = vrGreaterThan then
          Result := 1
        else
          // never happens unless varEmpty
          ASSERT(False);
      end;
    end;
  end;

begin
  if FClientCursor then begin
    Result := inherited CompareBookmarks(Bookmark1, Bookmark2);
    Exit;
  end;

  lNullFirst := FTableParams.FNullLocation = [nlAscFirst, nlDescLast];
  if (Bookmark1 = nil) or (Bookmark2 = nil) then begin
    if (Bookmark1 <> nil) and (Bookmark2 = nil) then
      if lNullFirst then
        Result := 1
      else
        Result := -1
    else if (Bookmark1 = nil) and (Bookmark2 <> nil) then
      if lNullFirst then
        Result := -1
      else
        Result := 1
    else
      Result := 0;
    Exit;
  end;


  sIndexFields := ActualIndexFieldNames;
  ParseIndexFields(sTmp, sDescFields, sNoCaseFields, sTmp);
  sFields1 := Bookmark2Fields(Bookmark1, pBuff);
  sFields2 := Bookmark2Fields(Bookmark2, pBuff);
  lPKOnly1 := (sFields1 <> sIndexFields);
  lPKOnly2 := (sFields2 <> sIndexFields);

  if lPKOnly1 and (FPrimaryKeyFields = '') then
    ErrorNoBmk(sFields1, sIndexFields);
  try
    vValues1 := Bookmark2Key(Bookmark1, lPKOnly1 or lPKOnly2);
  except
    ErrorNoBmk(sFields1, sIndexFields);
  end;

  if lPKOnly2 and (FPrimaryKeyFields = '') then
    ErrorNoBmk(sFields2, sIndexFields);
  try
    vValues2 := Bookmark2Key(Bookmark2, lPKOnly1 or lPKOnly2);
  except
    ErrorNoBmk(sFields2, sIndexFields);
  end;

  if lPKOnly1 or lPKOnly2 then
    sIndexFields := FPrimaryKeyFields;

  if not VarIsArray(vValues1) then
    // for one field in bookmark
    Result := CompareVar(vValues1, vValues2, sIndexFields)

  else begin
    // compare values in index order
    i := 1;
    iVarIndex := 0;
    Result := 0;
    while i <= Length(sIndexFields) do begin
      sField := FDExtractFieldName(sIndexFields, i);
      Result := CompareVar(vValues1[iVarIndex], vValues2[iVarIndex], sField);
      if Result <> 0 then
        Break;
      Inc(iVarIndex);
    end;
  end;
end;

{-------------------------------------------------------------------------------}
{ Indexes / Filters }

procedure TFDTable.ParseIndexFields(out AOrderFields, ADescFields, ANoCaseFields,
  AExpression: String);
var
  sOrdFields2, sField: String;
  i1, i2, iFrom: Integer;
  lNoCase, lDesc: Boolean;
  oIndDef: TIndexDef;

  procedure AddField(var AFields: String; const AName: String);
  begin
    if AFields <> '' then
      AFields := AFields + ';';
    AFields := AFields + AName;
  end;

begin
  ADescFields := '';
  ANoCaseFields := '';
  AExpression := '';

  // If IndexFieldNames is specified
  if IndexFieldNames <> '' then begin
    if SortView <> nil then
      AOrderFields := SortView.Sort
    else
      AOrderFields := IndexFieldNames;
    if Pos(':', AOrderFields) > 0 then begin
      sOrdFields2 := '';
      i1 := 1;
      while i1 <= Length(AOrderFields) do begin
        sField := FDExtractFieldName(AOrderFields, i1);
        i2 := Pos(':', sField);
        lNoCase := False;
        lDesc := False;
        if i2 <> 0 then begin
          iFrom := i2;
          while i2 <= Length(sField) do begin
            case sField[i2] of
            'n', 'N': lNoCase := True;
            'd', 'D': lDesc := True;
            'a', 'A': lDesc := False;
            end;
            Inc(i2);
          end;
          sField := Copy(sField, 1, iFrom - 1);
        end;
        AddField(sOrdFields2, sField);
        if lNoCase then
          AddField(ANocaseFields, sField);
        if lDesc then
          AddField(ADescFields, sField);
      end;
      AOrderFields := sOrdFields2;
    end;
  end

  // If IndexName is specified
  else if IndexName <> '' then begin
    IndexDefs.Update;
    UpdateLocalIndexName;
    oIndDef := IndexDefs.Find(LocalIndexName);

    if (oIndDef = nil) or (oIndDef.Expression <> '') or (ixExpression in oIndDef.Options) then
      FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_ClntWrongIndex,
        [GetDisplayName, IndexName]);

    AOrderFields := oIndDef.Fields;
    ADescFields := oIndDef.DescFields;
    ANocaseFields := oIndDef.CaseInsFields;
    if ixCaseInsensitive in oIndDef.Options then
      ANocaseFields := AOrderFields;
    if ixDescending in oIndDef.Options then
      ADescFields := AOrderFields;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDTable.GetActualIndexFields: String;
var
  sOrderFields, sDescFields, sNoCaseFields, sExpression: String;
begin
  ParseIndexFields(sOrderFields, sDescFields, sNoCaseFields, sExpression);
  Result := FDMergeFieldNames(sOrderFields, FPrimaryKeyFields);
end;

{-------------------------------------------------------------------------------}
function TFDTable.DoAdjustSortFields(const AFields, AExpression: String;
  var AIndexOptions: TFDSortOptions): String;
var
  oConnMeta: IFDPhysConnectionMetadata;
  oConn: TFDCustomConnection;
  eLoc: TFDPhysNullLocations;
begin
  Result := AFields;
  oConn := Command.AcquireConnection;
  try
    if AExpression = '' then begin
      Result := FDMergeFieldNames(Result, FPrimaryKeyFields, True);

      // Set Null location. Null location on server and client MUST BE THE SAME.
      // Without that the data window WILL NOT WORK PROPERLY.
      oConnMeta := oConn.GetConnectionMetadataIntf;
      eLoc := oConnMeta.NullLocations;
      if nlAscFirst in eLoc then
        Include(AIndexOptions, soNullFirst)
      else if nlAscLast in eLoc then
        Exclude(AIndexOptions, soNullFirst);
      if nlDescLast in eLoc then
        Include(AIndexOptions, soDescNullLast)
      else if nlDescFirst in eLoc then
        Exclude(AIndexOptions, soDescNullLast);
    end;
  finally
    Command.ReleaseConnection(oConn);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.UpdateLocalIndexName;
var
  oConn: TFDCustomConnection;
  sTmp, sIndex: String;
begin
  if IndexName <> '' then begin
    oConn := PointedConnection;
    if (oConn <> nil) and oConn.Connected then begin
      oConn.DecodeObjectName(IndexName, sTmp, sTmp, sTmp, sIndex);
      FLocalIndexName := sIndex;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.DoSortOrderChanging;
begin
  FTableParams.FLastTableCommand := tcUnknown;
  UpdateLocalIndexName;
  inherited DoSortOrderChanging;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.DoSortOrderChanged;
begin
  if Active and not FClientCursor then begin
    // After changing the sort order the bookmark size may be changed
    BookmarkSize := CalcBookmarkSize;
    // Remove references (FRow) to existing records for 2 reasons:
    // 1) When BookmarkSize is changed, then "touching" to a buffer may lead to AV
    // 2) When dataset will be refreshed later, then record references are invalid
    ClearBuffers;
    if not IsLinkedDetail and not FWindowOperation then
      InternalRefresh;
  end;
  inherited DoSortOrderChanged;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.DoCachedUpdatesChanged;
begin
  inherited DoCachedUpdatesChanged;
  if UpdateCursorKind() then
    RefireSQL;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.DoFilteringUpdated(AResync: Boolean);
var
  oRow: TFDDatSRow;
  vKeyValues: Variant;
begin
  if UpdateCursorKind() then begin
    inherited DoFilteringUpdated(False);
    RefireSQL;
  end
  else if not FClientCursor and Active and not Assigned(OnFilterRecord) then begin
    FTableParams.FLastTableCommand := tcUnknown;
    inherited DoFilteringUpdated(False);
    UpdateCursorPos;
    oRow := GetRow();
    if oRow <> nil then
      vKeyValues := oRow.GetValues(FPrimaryKeyFields);
    Table.Clear;
    First;
    if (oRow <> nil) and AResync then
      inherited LocateEx(FPrimaryKeyFields, vKeyValues, []);
  end
  else
    inherited DoFilteringUpdated(AResync);
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.UpdateIndexDefs;
var
  i, j: Integer;
  oConn: TFDCustomConnection;
  oConnMeta: IFDPhysConnectionMetadata;
  oVInds, oVIndFlds: TFDDatSView;
  oInd: TFDIndex;
  sName: String;
  eOptions: TFDSortOptions;
  oRow: TFDDatSRow;
  lDesc: Boolean;

  function NormName(const AName: Variant; APart: TFDPhysNamePart): String;
  begin
    Result := oConn.CnvMetaValue(AName);
    // PostgreSQL: when a DB was created with quoted mixed-case name and
    // catalog name is not quoted here, then GetTableIndexFields will
    // lower case it and no fields will be returned.
    if (APart = npObject) or
       (APart in (oConnMeta.NameQuotedSupportedParts - oConnMeta.NameParts)) then
      Result := oConnMeta.QuoteObjName(Result, APart);
  end;

begin
  if (csDesigning in ComponentState) and (IndexDefs.Count > 0) then
    Exit;
  // Really IndexDefs can be updated only for closed dataset
  if not IndexDefs.Updated then begin
    if fiMeta in FetchOptions.Items then begin
      oConn := Command.AcquireConnection;
      try
        oConnMeta := oConn.GetConnectionMetadata(True);
        oVInds := oConnMeta.GetTableIndexes(CatalogName, SchemaName, TableName, '');
        try
          for i := 0 to oVInds.Rows.Count - 1 do begin
            oRow := oVInds.Rows[i];
            oVIndFlds := oConnMeta.GetTableIndexFields(
              NormName(oRow.GetData('CATALOG_NAME'), npCatalog),
              NormName(oRow.GetData('SCHEMA_NAME'), npSchema),
              NormName(oRow.GetData('TABLE_NAME'), npObject),
              NormName(oRow.GetData('INDEX_NAME'), npObject), '');
            try
              sName := oConn.CnvMetaValue(oRow.GetData('INDEX_NAME'));
              oInd := Indexes.FindIndex(sName);
              if oInd = nil then
                oInd := Indexes.Add;
              oInd.Name := sName;
              oInd.Fields := oVIndFlds.Rows.GetValuesList('COLUMN_NAME', ';', '');
              oInd.Options := FormatOptions.SortOptions - [soUnique, soPrimary];
              case TFDPhysIndexKind(oRow.GetData('INDEX_TYPE')) of
              ikNonUnique:  ;
              ikUnique:     oInd.Options := oInd.Options + [soUnique];
              ikPrimaryKey: oInd.Options := oInd.Options + [soPrimary];
              end;
              lDesc := True;
              for j := 0 to oVIndFlds.Rows.Count - 1 do
                if oVIndFlds.Rows[j].GetData('SORT_ORDER') <> 'D' then begin
                  lDesc := False;
                  Break;
                end;
              if lDesc then
                oInd.Options := oInd.Options + [soDescending];
              if FAdjustIndexes then begin
                eOptions := oInd.Options;
                oInd.Fields := DoAdjustSortFields(oInd.Fields, '', eOptions);
                oInd.Options := eOptions;
              end;
              oInd.Active := oInd.Fields <> '';
            finally
              FDClearMetaView(oVIndFlds, FetchOptions);
            end;
          end;
        finally
          FDClearMetaView(oVInds, FetchOptions);
        end;
      finally
        Command.ReleaseConnection(oConn);
      end;
    end;
    inherited UpdateIndexDefs;
  end;
end;

{-------------------------------------------------------------------------------}
{ Data window SQL generation / fetching }

function TFDTable.GetWindowedRows: TFDDatSRowListBase;
begin
  if SourceView.SortingMechanism <> nil then
    Result := SourceView.SortingMechanism.SortedRows
  else
    Result := Table.Rows;
end;

{-------------------------------------------------------------------------------}
function TFDTable.GenerateSQL: String;
var
  sCat, sSch, sBObj, sObj, sOrdFields, sDescFields,
    sNocaseFields, sExpression, sMastFields, sMastNullFields: String;
  oConn: TFDCustomConnection;
  oGen: IFDPhysCommandGenerator;
  oRows: TFDDatSRowListBase;
  i: Integer;
  pKeyBuff: PFDKeyBuffer;
begin
  ASSERT(not FClientCursor or (FTableParams.FTableCommand = tcBof));

  oConn := Command.AcquireConnection;
  try
    Command.Unprepare;
    oConn.CheckActive;
    oConn.ConnectionIntf.CreateCommandGenerator(oGen, nil);

    // Prepare table name
    oConn.DecodeObjectName(TableName, sCat, sSch, sBObj, sObj);
    if sCat = '' then
      sCat := CatalogName;
    if sSch = '' then
      sSch := SchemaName;
    if (sBObj <> '') and (sObj = '') then
      sObj := sBObj;
    FTableParams.FCatalog := sCat;
    FTableParams.FSchema := sSch;
    FTableParams.FTable := sObj;

    FTableParams.FPrimaryKeyFields := '';
    FTableParams.FRangeStartRow := nil;
    FTableParams.FRangeStartFieldCount := -1;
    FTableParams.FRangeStartExclusive := False;
    FTableParams.FRangeEndRow := nil;
    FTableParams.FRangeEndFieldCount := -1;
    FTableParams.FRangeEndExclusive := False;
    FTableParams.FLocateRow := nil;
    FTableParams.FIndexFields := '';
    FTableParams.FDescFields := '';
    FTableParams.FNoCaseFields := '';
    FTableParams.FIndexExpression := '';
    FTableParams.FMasterFields := '';
    FTableParams.FFilter := '';
    FTableParams.FFiltered := False;
    FTableParams.FFilterNoCase := False;
    FTableParams.FFilterPartial := False;
    FTableParams.FRanged := False;
    FTableParams.FExclusive := False;
    FTableParams.FReadOnly := UpdateOptions.ReadOnly;
    FTableParams.FCustomWhere := '';
    FTableParams.FKeyFieldCount := -1;
    FTableParams.FRecordCount := -1;

    if FClientCursor then begin
      Result := oGen.GenerateSelectTable(FTableParams);
      Exit;
    end;

    sOrdFields := '';
    sDescFields := '';
    sNocaseFields := '';
    sExpression := '';
    sMastFields := '';
    sMastNullFields := '';

    if (FTableParams.FTableCommand <> tcGetRowCount) or
       (FetchOptions.RecordCountMode <> cmTotal) then begin
      // Prepare indexed field lists
      ParseIndexFields(sOrdFields, sDescFields, sNocaseFields, sExpression);

      // When sOrdFields does not contain PK fields, then add them
      FTableParams.FPrimaryKeyFields := FPrimaryKeyFields;

      if IsLinkedDetail then begin
        sMastFields := MasterFields;
        if not FClientCursor then
          for i := 0 to MasterLink.Fields.Count - 1 do
            if MasterLink.Fields[i].IsNull then
              sMastNullFields := sMastNullFields + ';' + MasterLink.Fields[i].FieldName;
      end;

      oGen.Params := Params;
      oGen.Options := Command;

      // Set range rows
      if IsRanged then begin
        pKeyBuff := GetKeyBuffer(kiRangeStart);
        if Assigned(pKeyBuff) then begin
          FTableParams.FRangeStartRow := GetKeyRow(pKeyBuff);
          FTableParams.FRangeStartFieldCount := FRangeFromFieldCount;
          FTableParams.FRangeStartExclusive := pKeyBuff^.FExclusive;
        end;
        pKeyBuff := GetKeyBuffer(kiRangeEnd);
        if Assigned(pKeyBuff) then begin
          FTableParams.FRangeEndRow := GetKeyRow(pKeyBuff);
          FTableParams.FRangeEndFieldCount := FRangeToFieldCount;
          FTableParams.FRangeEndExclusive := pKeyBuff^.FExclusive;
        end;
      end;
    end;

    // Set current and locate rows
    case FTableParams.FTableCommand of
    tcLocate:
      begin
        FTableParams.FLocateRow := GetLocateRow;
        if (FRecordIndex = -1) or (FRecordIndex > SourceView.Rows.Count - 1) then
          // no record
          oGen.Row := nil
        else
          // set current record
          oGen.Row := SourceView.Rows[FRecordIndex];
        FTableParams.FRecordCount := 1;
      end;

    tcGetRecNo:
      begin
        if SourceView.Rows.Count > 0 then begin
          if Bof or (FRecordIndex < 0) then
            // special for bof
            oGen.Row := SourceView.Rows[0]
          else if Eof or (FRecordIndex > SourceView.Rows.Count - 1) then
            // special for eof
            oGen.Row := SourceView.Rows[SourceView.Rows.Count - 1]
          else
            // in other cases
            oGen.Row := SourceView.Rows[FRecordIndex];
        end
        else
          oGen.Row := nil;
        FTableParams.FRecordCount := 1;
      end;


    tcFindKey,
    tcFindNearest:
      begin
        pKeyBuff := GetKeyBuffer(kiLookup);
        oGen.Row := GetKeyRow(pKeyBuff);
        FTableParams.FRecordCount := 1;
        if FKeyBuffer^.FFieldCount <= 0 then
          FTableParams.FKeyFieldCount := InternalDefaultKeyFieldCount(pKeyBuff,
            SortView.SortingMechanism.SortColumnList.Count)
        else
          FTableParams.FKeyFieldCount := pKeyBuff^.FFieldCount;
      end;

    tcPageDown:
      begin
        oRows := GetWindowedRows;
        oGen.Row := oRows[oRows.Count - 1];
        if FServerCursor and not (FetchOptions.LiveWindowFastFirst and not FClientCursor) then
          FTableParams.FRecordCount := -1
        else
          FTableParams.FRecordCount := FWindowSize * FetchOptions.RowsetSize;
      end;

    tcPageUp:
      begin
        oRows := GetWindowedRows;
        oGen.Row := oRows[0];
        if FServerCursor and not (FetchOptions.LiveWindowFastFirst and not FClientCursor) then
          FTableParams.FRecordCount := -1
        else
          FTableParams.FRecordCount := FWindowSize * FetchOptions.RowsetSize;
      end;

    tcBof,
    tcEof:
      if (FClientCursor or FServerCursor) and
         not (FetchOptions.LiveWindowFastFirst and not FClientCursor) then
        FTableParams.FRecordCount := -1
      else
        FTableParams.FRecordCount := FWindowSize * FetchOptions.RowsetSize;

    tcSetRecNo:
      FTableParams.FRecordCount := 1;

    tcCurrentRecord:
      begin
        oGen.Row := SourceView.Rows[FRecordIndex];
        FTableParams.FRecordCount := 1;
      end;
    end;

    if sExpression = '' then begin
      FTableParams.FIndexFields      := sOrdFields;
      FTableParams.FDescFields       := sDescFields;
      FTableParams.FNoCaseFields     := sNocaseFields;
    end
    else
      FTableParams.FIndexExpression  := sExpression;

    if (FTableParams.FTableCommand <> tcGetRowCount) or
       (FetchOptions.RecordCountMode <> cmTotal) then begin
      FTableParams.FMasterFields     := sMastFields;
      FTableParams.FMasterNullFields := sMastNullFields;
      FTableParams.FFilter           := Filter;
      FTableParams.FFiltered         := Filtered and not Assigned(OnFilterRecord);
      FTableParams.FFilterNoCase     := foCaseInsensitive in FilterOptions;
      FTableParams.FFilterPartial    := not (foNoPartialCompare in FilterOptions);
      FTableParams.FRanged           := IsRanged;
      FTableParams.FExclusive        := (FKeyBuffer <> nil) and FKeyBuffer^.FExclusive;
      FTableParams.FCustomWhere      := GetCustomWhere;
    end;

    Result := oGen.GenerateSelectTable(FTableParams);
  finally
    Command.ReleaseConnection(oConn);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.FetchWindow(out AFetched: Integer; APrepOnly: Boolean = False;
  AForceClear: Boolean = False; ATable: TFDDatsTable = nil);

  function IsPrefixed(const AName, APrefix: String; var AField: String): Boolean;
  begin
    Result := Pos(UpperCase(APrefix), UpperCase(AName)) = 1;
    if Result then
      AField := Copy(AName, Length(APrefix) + 1, Length(AName))
    else
      AField := '';
  end;

var
  i: Integer;
  oParam: TFDParam;
  sField: String;
  oField: TField;
  iNullCount: Integer;
  lIndDefUpdated: Boolean;
  lFldDefUpdated: Boolean;
  oRows: TFDDatSRowListBase;
  oFtch: TFDFetchOptions;
begin
  ASSERT(not FClientCursor or (FTableParams.FTableCommand = tcBof));
  ASSERT(not FWindowOperation);

  FWindowOperation := True;
  try
    oFtch := FetchOptions;
    AFetched := 0;
    iNullCount := 0;
    if ATable = nil then
      ATable := Table;

    lIndDefUpdated := IndexDefs.Updated;
    lFldDefUpdated := FieldDefs.Updated;
    try
      // avoid repeatative, not needed window operations
      if FServerCursor and (ATable = Table) and (Table <> nil) and (Table.Columns.Count > 0) and
         not (oFtch.LiveWindowFastFirst and not FClientCursor) then
        case FTableParams.FTableCommand of
        tcBof:
          if (FTableParams.FLastTableCommand = tcBof) and
             not oFtch.LiveWindowParanoic then begin
            AFetched := Table.Rows.Count;
            Exit;
          end;
        tcPageUp:
          if FTableParams.FLastTableCommand in [tcPageUp, tcEof] then begin
            if Command.Active then begin
              Command.Fetch(ATable, False, True);
              AFetched := Command.RowsAffected;
            end;
            FTableParams.FLastTableCommand := FTableParams.FTableCommand;
            Exit;
          end;
        tcPageDown:
          if FTableParams.FLastTableCommand in [tcPageDown, tcBof] then begin
            if Command.Active then begin
              Command.Fetch(ATable, False, True);
              AFetched := Command.RowsAffected;
            end;
            FTableParams.FLastTableCommand := FTableParams.FTableCommand;
            Exit;
          end;
        tcEof:
          if (FTableParams.FLastTableCommand = tcEof) and
             not oFtch.LiveWindowParanoic then begin
            AFetched := Table.Rows.Count;
            Exit;
          end;
        end;

      Command.CommandText.Clear;
    finally
      IndexDefs.Updated := lIndDefUpdated;
      FieldDefs.Updated := lFldDefUpdated;
    end;
    Command.CommandText.Add(GenerateSQL);

    // Set master params
    DoMasterParamSetValues(MasterLink.Fields);
    // Set other params
    for i := 0 to Command.Params.Count - 1 do begin
      oParam := Command.Params[i];

      // check range params
      if IsPrefixed(oParam.Name, C_FD_CmdGenRangeStart, sField) then
        oParam.AssignFieldValue(FieldByName(sField),
          GetKeyRow(GetKeyBuffer(kiRangeStart)).ValueS[sField])
      else if IsPrefixed(oParam.Name, C_FD_CmdGenRangeFinish, sField) then
        oParam.AssignFieldValue(FieldByName(sField),
          GetKeyRow(GetKeyBuffer(kiRangeEnd)).ValueS[sField])

      // check locate params
      else if IsPrefixed(oParam.Name, C_FD_CmdGenLocate, sField) then begin
        oParam.AssignFieldValue(FieldByName(sField), GetLocateRow.ValueS[sField]);
        // made LIKE compatible String
        if FTableParams.FLocatePartial and
           (oParam.DataType in [ftString, ftWideString, ftFixedChar, ftFixedWideChar]) then
          oParam.Value := VarToStr(oParam.Value) + '%';
      end

      // all other params must have WINDOW_ prefix or does not have a prefix for master/detail
      else begin
        if not IsPrefixed(oParam.Name, C_FD_CmdGenWindow, sField) then
          Continue;
        oField := FieldByName(sField);
        case FTableParams.FTableCommand of
        tcBof,
        tcEof,
        tcFindKey,
        tcFindNearest:
          // use key buffer
          oParam.AssignFieldValue(oField, GetKeyRow(GetKeyBuffer(kiLookup)).ValueS[sField]);

        tcPageUp:
          begin
            // use first row
            oRows := GetWindowedRows;
            oParam.AssignFieldValue(oField, oRows[0].ValueS[sField]);
          end;

        tcPageDown:
          begin
            // use last row
            oRows := GetWindowedRows;
            oParam.AssignFieldValue(oField, oRows[oRows.Count - 1].ValueS[sField]);
          end;

        tcCurrentRecord,
        tcGetRecNo,
        tcLocate:
          // for locate (lxoCurrentRecord)
          if SourceView.Rows.Count > 0 then begin
            if Bof or (FRecordIndex < 0) then
              // use first row
              oParam.AssignFieldValue(oField, SourceView.Rows[0].ValueS[sField])
            else if Eof or (FRecordIndex > SourceView.Rows.Count - 1) then
              // use last row
              oParam.AssignFieldValue(oField, SourceView.Rows[SourceView.Rows.Count - 1].ValueS[sField])
            else
              // use current row
              oParam.AssignFieldValue(oField, SourceView.Rows[FRecordIndex].ValueS[sField]);
          end
          else
            oParam.Clear;
        end;
      end;

      if oParam.IsNull then
        Inc(iNullCount);
    end;

    // When all params are null's or just preparing a SQL - nothing to do
    if not ((Command.Params.Count > 0) and (Command.Params.Count = iNullCount)) and
       not APrepOnly then begin
      lIndDefUpdated := IndexDefs.Updated;
      lFldDefUpdated := FieldDefs.Updated;
      try
        // open and fetch data
        DoPrepareSource;
        DoOpenSource(True, False, False);

         // When paging then append fetched record to the existing ones, otherwise - replace
        if not (FTableParams.FTableCommand in [tcPageUp, tcPageDown]) or AForceClear then
          ATable.Clear;

        if ATable.Columns.Count = 0 then
          Command.Define(ATable);
        Command.Fetch(ATable, (oFtch.LiveWindowFastFirst and not FClientCursor) or
                              not FServerCursor or
                              not (FTableParams.FTableCommand in
                                   [tcBof, tcEof, tcPageUp, tcPageDown]), True);
        AFetched := Command.RowsAffected;
        FAdapter.DatSTableName := ATable.Name;
        FTableParams.FLastTableCommand := FTableParams.FTableCommand;
      finally
        IndexDefs.Updated := lIndDefUpdated;
        FieldDefs.Updated := lFldDefUpdated;
      end;
    end;
  finally
    FWindowOperation := False;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDTable.DoPurge(AView: TFDDatSView; ADirection: TFDFetchDirection): Integer;
var
  rState: TFDDatSLoadState;
  i: Integer;
  ircWindowSize: Integer;
begin
  Result := inherited DoPurge(AView, ADirection);
  if FClientCursor then
    Exit;

  // Calc window size
  ircWindowSize := FWindowSize * FetchOptions.RowsetSize;
  // ATable must be greater than buffer count
  Result := AView.Rows.Count - ircWindowSize - BufferCount;
  if Result <= 0 then begin
    Result := 0;
    Exit;
  end;

  AView.Table.BeginLoadData(rState, lmDestroying);
  try
    case ADirection of
    fdDown:
      // remove top records
      for i := 0 to Result - 1 do
        AView.Table.Rows.Remove(AView.Rows[i]);
    fdUp:
      // remove bottom records
      for i := AView.Rows.Count - 1 downto AView.Rows.Count - Result - 1 do
        AView.Table.Rows.Remove(AView.Rows[i]);
    end;
  finally
    AView.Table.EndLoadData(rState);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDTable.DoFetch(ATable: TFDDatSTable; AAll: Boolean;
  ADirection: TFDFetchDirection): Integer;
begin
  if FClientCursor then begin
    Result := inherited DoFetch(ATable, AAll, ADirection);
    Exit;
  end;

  if AAll then
    FDCapabilityNotSupported(Self, [S_FD_LComp, S_FD_LComp_PClnt]);
  case ADirection of
  fdUp:
    begin
      if GetWindowedRows.Count = 0 then
        FTableParams.FTableCommand := tcEof
      else
        FTableParams.FTableCommand := tcPageUp;
      FetchWindow(Result);
    end;
  fdDown:
    begin
      if GetWindowedRows.Count = 0 then
        FTableParams.FTableCommand := tcBof
      else
        FTableParams.FTableCommand := tcPageDown;
      FetchWindow(Result);
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDTable.InternalSearch(ATable: TFDDatSTable; const AKeyFields: String;
  const AKeyValues: Variant; const AExpression, AResultFields: String;
  AOptions: TFDDataSetLocateOptions): Boolean;
var
  iFetched: Integer;
begin
  try
    if AKeyFields <> '' then
      InitLocateRow(AKeyFields, AKeyValues);

    FTableParams.FTableCommand := tcLocate;
    FTableParams.FSelectFields := AResultFields;
    FTableParams.FLocateIgnoreCase := lxoCaseInsensitive in AOptions;
    FTableParams.FLocatePartial := lxoPartialKey in AOptions;
    FTableParams.FLocateBackward := lxoBackward in AOptions;
    FTableParams.FLocateFromCurrent := lxoFromCurrent in AOptions;
    if AExpression = '' then
      FTableParams.FLocateFields := AKeyFields
    else
      FTableParams.FLocateExpression := AExpression;

    FetchWindow(iFetched, False, False, ATable);
    Result := iFetched > 0;
  finally
    FTableParams.FSelectFields := '';
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.RefireSQL;
begin
  FTableParams.FLastTableCommand := tcUnknown;
  if Active then begin
    DisableControls;
    try
      Disconnect;
      Open;
    finally
      EnableControls;
    end;
  end
  else
    SQL.Clear;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.InternalFirst;
var
  iFetched: Integer;
begin
  if not FClientCursor then begin
    FTableParams.FTableCommand := tcBof;
    FSourceEOF := False;
    FetchWindow(iFetched);
  end;
  inherited InternalFirst;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.InternalLast;
var
  iFetched: Integer;
begin
  if not FClientCursor then begin
    FTableParams.FTableCommand := tcEof;
    FSourceEOF := False;
    FetchWindow(iFetched);
  end;
  inherited InternalLast;
end;

{-------------------------------------------------------------------------------}
function TFDTable.InternalDefaultKeyFieldCount(ABuffer: PFDKeyBuffer; ADefault: Integer): Integer;
begin
  Result := ABuffer^.FAssignedFieldCount;
  if Result <= 0 then
    Result := ADefault;
end;

{-------------------------------------------------------------------------------}
function TFDTable.InternalGotoKey(ANearest: Boolean): Boolean;
var
  iFetched: Integer;
  oTable: TFDDatSTable;
  iPos: Integer;
begin
  Result := inherited InternalGotoKey(ANearest);
  if FClientCursor or
     Result and not FetchOptions.LiveWindowParanoic then
    Exit;

  BeginLocate([], nil);

  if ANearest then
    FTableParams.FTableCommand := tcFindNearest
  else
    FTableParams.FTableCommand := tcFindKey;

  oTable := TFDDatSTable.Create;
  try
    oTable.Assign(Table);
    FetchWindow(iFetched, False, False, oTable);
    Result := iFetched > 0;
    if Result then begin
      Table.Clear;
      MoveData(oTable, Table);
      FRecordIndex := 0;
    end;
  finally
    FDFree(oTable);
  end;

  if not Result and ANearest then begin
    InternalLast;
    iPos := SourceView.Rows.Count - 1;
    Result := True;
  end
  else
    iPos := 0;
  EndLocate(Result, iPos, [], nil);
end;

{-------------------------------------------------------------------------------}
function TFDTable.AllIndexFieldNull(const ARowIndex: Integer): Boolean;
var
  i: Integer;
  sField: String;
begin
  Result := False;
  if SourceView.Rows.Count = 0 then
    Exit;
  i := 1;
  while i <= Length(FTableParams.FIndexFields) do begin
    sField := FDExtractFieldName(FTableParams.FIndexFields, i);
    if not VarIsNull(SourceView.Rows[ARowIndex].ValueS[sField]) then
      Exit;
  end;
  Result := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.ClearTableButCurrent;
var
  i: Integer;
  rState: TFDDatSLoadState;
  oRow: TFDDatSRow;
begin
  // all clear
  if SourceView.Rows.Count <= 1 then
    Exit;
  Table.BeginLoadData(rState, lmDestroying);
  try
    oRow := SourceView.Rows[FRecordIndex];
    for i := Table.Rows.Count - 1 downto 0 do
      if Table.Rows[i] <> oRow then
        Table.Rows.RemoveAt(i);
  finally
    Table.EndLoadData(rState);
    ASSERT((Table.Rows.Count = 1) and (SourceView.Rows.Count <= 1));
  end;
  // set correct index
  FRecordIndex := 0;
  FTableParams.FLastTableCommand := tcUnknown;
end;

{-------------------------------------------------------------------------------}
function TFDTable.GetCanRefresh: Boolean;
begin
  Result := not FetchOptions.Unidirectional and inherited GetCanRefresh;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.InternalRefresh;
var
  lHasRecs: Boolean;
  iFetched: Integer;
  iLastRecord: Integer;
  oTable: TFDDatSTable;
begin
  if FClientCursor then begin
    inherited InternalRefresh;
    Exit;
  end;

  CheckBrowseMode;
  CheckBidirectional;
  if UpdatesPending then
    FDException(Self, [S_FD_LComp, S_FD_LComp_PDS], er_FD_DSRefreshError,
      [GetDisplayName]);

  // check no records or stand on a "all null's record"
  lHasRecs := not (IsEmpty or AllIndexFieldNull) and
    (FRecordIndex > -1) and (FRecordIndex <= SourceView.Rows.Count - 1);
  iLastRecord := FRecordIndex;

  // make temporary row
  oTable := TFDDatSTable.Create;
  try
    oTable.Assign(Table);
    FSourceEOF := False;

    // when records exist, then try refetch current record
    if lHasRecs then begin
      ClearTableButCurrent;
      lHasRecs := SourceView.Rows.Count > 0;
    end;

    if not lHasRecs then begin
      // when no records, then just fetch bof
      FTableParams.FTableCommand := tcBof;
      FetchWindow(iFetched);
      if iFetched > 0 then
        FRecordIndex := 0
      else
        // set to Bof
        FRecordIndex := -1;
    end

    else begin
      oTable.Clear;
      // backup current rows
      MoveData(Table, oTable);
      FTableParams.FTableCommand := tcCurrentRecord;
      FetchWindow(iFetched);
      if iFetched = 0 then begin
        // check page down
        // current record index
        iLastRecord := -1;
        Table.Clear;
        // restore current rows
        MoveData(oTable, Table);
        FTableParams.FTableCommand := tcPageDown;
        // force clear
        FetchWindow(iFetched, False, True);
        if iFetched = 0 then begin
          // check page up
          Table.Clear;
          // restore current row
          MoveData(oTable, Table);
          FTableParams.FTableCommand := tcPageUp;
          // force clear
          FetchWindow(iFetched, False, True);
          if iFetched = 0 then
            // nothing found
            FSourceEOF := True;
        end;
      end;
    end;

    // just stay on single row in buffer and let Resync refetch window
    FRecordIndex := iLastRecord;
    if FRecordIndex > SourceView.Rows.Count - 1 then
      FRecordIndex := SourceView.Rows.Count - 1;
  finally
    FDFree(oTable);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.InternalDelete;
var
  iFetched: Integer;
begin
  if not FClientCursor then begin
    // If to delete single cached record, then Resync([]) will jump to the
    // first record. Because DoFetch will perform tcBof.
    if SourceView.Rows.Count = 1 then begin
      FTableParams.FTableCommand := tcPageDown;
      FetchWindow(iFetched);
    end;
  end;
  inherited InternalDelete;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.SetFieldData(AField: TField; ABuffer: TValueBuffer);
begin
  inherited SetFieldData(AField, ABuffer);
  if (State in [dsEdit, dsInsert]) and GetIsIndexField(AField) then
    FIndexFieldChanged := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.InternalAddRecord(Buffer: TRecBuf; Append: Boolean);
begin
  inherited InternalAddRecord(Buffer, Append);
  if not FClientCursor and FIndexFieldChanged then
    ClearTableButCurrent;
  FIndexFieldChanged := False;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.InternalPost;
begin
  inherited InternalPost;
  if not FClientCursor and FIndexFieldChanged then
    if State = dsEdit then begin
      ClearTableButCurrent;
      if IsRanged or Filtered then
        FTableParams.FLastTableCommand := tcUnknown;
    end;
  FIndexFieldChanged := False;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.InternalCancel;
begin
  inherited InternalCancel;
  FIndexFieldChanged := False;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.InternalResetRange;
var
  iFetched: Integer;
begin
  if FClientCursor then begin
    inherited InternalResetRange;
    Exit;
  end;

  if IsRanged then begin
    FTableParams.FLastTableCommand := tcUnknown;
    FTableParams.FTableCommand := tcBof;
    FetchWindow(iFetched);
    First;
  end
  else begin
    FTableParams.FRanged := False;
    FTableParams.FLastTableCommand := tcUnknown;
    FSourceEOF := False;
    Resync([]);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.InternalSetRecNo(AValue: Integer);
var
  oTable: TFDDatSTable;
  iFetched: Integer;
begin
  if FClientCursor then begin
    inherited InternalSetRecNo(AValue);
    Exit;
  end;

  if AValue < 1  then
    FRecordIndex := -1;

  FTableParams.FTableCommand := tcSetRecNo;
  FTableParams.FRecordNumber := AValue;
  oTable := TFDDatSTable.Create;
  try
    oTable.Assign(Table);
    FetchWindow(iFetched, False, False, oTable);
    if iFetched > 0 then begin
      Table.Clear;
      MoveData(oTable, Table);
      FRecordIndex := 0;
    end;
  finally
    FDFree(oTable);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.SetRecNo(AValue: Integer);
begin
  if not FClientCursor then
    Include(FFlags, dfNoRecNoCmp)
  else
    Exclude(FFlags, dfNoRecNoCmp);
  inherited SetRecNo(AValue);
end;

{-------------------------------------------------------------------------------}
function TFDTable.GetRecNo: Integer;
var
  oTable: TFDDatSTable;
  iFetched: Integer;
begin
  if FClientCursor then begin
    Result := inherited GetRecNo;
    Exit;
  end;

  Result := -1;
  if not FetchOptions.LiveWindowParanoic or (State = dsInsert) or
     (SourceView = nil) or (SourceView.Rows.Count = 0) then
    Exit;

  FTableParams.FTableCommand := tcGetRecNo;
  oTable := TFDDatSTable.Create;
  try
    FetchWindow(iFetched, False, False, oTable);
    ASSERT(oTable.Rows.Count > 0);
    Result := oTable.Rows[0].ValueI[0];
  finally
    FDFree(oTable);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDTable.GetRecordCount: Integer;
var
  oTable: TFDDatSTable;
  iFetched: Integer;
begin
  if FClientCursor then begin
    Result := inherited GetRecordCount;
    Exit;
  end;

  Result := 0;
  if (SourceView = nil) or (SourceView.Rows.Count = 0) then
    Exit;

  FTableParams.FTableCommand := tcGetRowCount;
  FTableParams.FRecordCount := 0;
  oTable := TFDDatSTable.Create;
  try
    FetchWindow(iFetched, False, False, oTable);
    ASSERT(oTable.Rows.Count > 0);
    Result := oTable.Rows[0].ValueI[0];
  finally
    FDFree(oTable);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDTable.InternalLookupEx(const AKeyFields: String; const AKeyValues: Variant;
  const AExpression: String; const AResultFields: String;
  AOptions: TFDDataSetLocateOptions = []; ApRecordIndex: PInteger = nil): Variant;
var
  oTable: TFDDatSTable;
  lResult: Boolean;
  i, iData, iCols: Integer;
  iPos: Integer;
begin
  // for data window table record index has no sense
  if ApRecordIndex <> nil then
    ApRecordIndex^ := -1;

  if AExpression = '' then
    Result := inherited LookupEx(AKeyFields, AKeyValues, AResultFields, AOptions, @iPos)
  else
    Result := inherited LookupEx(AExpression, AResultFields, AOptions, @iPos);

  if not VarIsNull(Result) and not FetchOptions.LiveWindowParanoic then
    Exit;

  Result := Null;
  oTable := TFDDatSTable.Create;
  try
    lResult := InternalSearch(oTable, AKeyFields, AKeyValues, '', AResultFields, AOptions);
    if lResult and (oTable.Rows.Count > 0) then begin
      iCols := 0;
      iData := -1;
      for i := 0 to oTable.Columns.Count - 1 do
        if not (caInternal in oTable.Columns[i].Attributes) then begin
          iData := i;
          Inc(iCols);
        end;
      if iCols = 1 then
        Result := oTable.Rows[0].ValueI[iData]
      else if iCols > 1 then begin
        Result := VarArrayCreate([0, iCols - 1], varVariant);
        iData := 0;
        for i := 0 to oTable.Columns.Count - 1 do
          if not (caInternal in oTable.Columns[i].Attributes) then begin
            Result[iData] := oTable.Rows[0].ValueI[i];
            Inc(iData);
          end;
      end;
    end;
  finally
    FDFree(oTable);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDTable.LookupEx(const AExpression, AResultFields: String;
  AOptions: TFDDataSetLocateOptions; ApRecordIndex: PInteger): Variant;
begin
  if FClientCursor then
    Result := inherited LookupEx(AExpression, AResultFields, AOptions,
      ApRecordIndex)
  else
    Result := InternalLookupEx('', Null, AExpression, AResultFields, AOptions,
      ApRecordIndex);
end;

{-------------------------------------------------------------------------------}
function TFDTable.LookupEx(const AKeyFields: String; const AKeyValues: Variant;
  const AResultFields: String; AOptions: TFDDataSetLocateOptions;
  ApRecordIndex: PInteger): Variant;
begin
  if FClientCursor then
    Result := inherited LookupEx(AKeyFields, AKeyValues, AResultFields, AOptions,
      ApRecordIndex)
  else
    Result := InternalLookupEx(AKeyFields, AKeyValues, '', AResultFields, AOptions,
      ApRecordIndex);
end;

{-------------------------------------------------------------------------------}
function TFDTable.InternalLocateEx(const AKeyFields: String;
  const AKeyValues: Variant; const AExpression: String;
  AOptions: TFDDataSetLocateOptions; ApRecordIndex: PInteger): Boolean;
var
  oTable: TFDDatSTable;
  iPos: Integer;
begin
  iPos := BeginLocate(AOptions, ApRecordIndex);

  // for data window table record index has no sense
  if ApRecordIndex <> nil then
    ApRecordIndex^ := -1;

  if AExpression = '' then
    Result := inherited LocateRecord(AKeyFields, AKeyValues, AOptions, iPos)
  else
    Result := inherited LocateRecord(AExpression, AOptions, iPos);

  if Result and not FetchOptions.LiveWindowParanoic and
     ((iPos > 0) or (iPos < SourceView.Rows.Count - 1)) then begin
    // when matching record exists in window and it is not FIRST
    // or LAST (for lxoBackward) matching record in index
    EndLocate(True, iPos, AOptions, nil);
    Exit;
  end;

  oTable := TFDDatSTable.Create;
  try
    // for columns and others
    oTable.Assign(Table);
    Result := InternalSearch(oTable, AKeyFields, AKeyValues, AExpression, '', AOptions);
    if Result and not (lxoCheckOnly in AOptions) then begin
      Table.Clear;
      MoveData(oTable, Table);
      EndLocate(True, 0, AOptions, nil);
    end
    else
      EndLocate(False, -1, AOptions, nil);
  finally
    FDFree(oTable);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDTable.LocateEx(const AKeyFields: String; const AKeyValues: Variant;
  AOptions: TFDDataSetLocateOptions; ApRecordIndex: PInteger): Boolean;
begin
  if FClientCursor then
    Result := inherited LocateEx(AKeyFields, AKeyValues, AOptions, ApRecordIndex)
  else
    Result := InternalLocateEx(AKeyFields, AKeyValues, '', AOptions, ApRecordIndex);
end;

{-------------------------------------------------------------------------------}
function TFDTable.LocateEx(const AExpression: String;
  AOptions: TFDDataSetLocateOptions; ApRecordIndex: PInteger): Boolean;
begin
  if FClientCursor then
    Result := inherited LocateEx(AExpression, AOptions, ApRecordIndex)
  else
    Result := InternalLocateEx('', Null, AExpression, AOptions, ApRecordIndex);
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.DoMasterDefined;
var
  sFields: String;
begin
  sFields := MasterFields;
  inherited DoMasterDefined;
  if sFields <> MasterFields then
    RefireSQL;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.DoMasterReset;
begin
  if not FClientCursor then begin
    FTableParams.FLastTableCommand := tcUnknown;
    InternalRefresh;
    Resync([]);
  end;
  inherited DoMasterReset;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.MasterChanged(Sender: TObject);
begin
  if FClientCursor or
     (IndexFieldNames <> '') or (IndexName <> '') then begin
    FTableParams.FLastTableCommand := tcUnknown;
    inherited MasterChanged(Sender);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.CheckMasterRange;
begin
  if FClientCursor then begin
    inherited CheckMasterRange;
    Exit;
  end;

  if IsLinkedDetail and ((IndexFieldCount = 0) or MasterRangeChanged()) then
    if Active then begin
      FRecordIndex := -1;
      Table.Clear;
      First;
    end;
end;

{-------------------------------------------------------------------------------}
function TFDTable.PSGetCommandText: String;
begin
  Result := TableName;
end;

{-------------------------------------------------------------------------------}
function TFDTable.PSGetCommandType: TPSCommandType;
begin
  Result := ctTable;
end;

{-------------------------------------------------------------------------------}
function TFDTable.PSGetTableName: String;
begin
  Result := TableName;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.PSSetCommandText(const ACommandText: String);
begin
  TableName := ACommandText;
end;

{-------------------------------------------------------------------------------}
function TFDTable.GetExists: Boolean;
var
  oConn: TFDCustomConnection;
  oList: TStrings;
begin
  oConn := Command.AcquireConnection;
  oList := TFDStringList.Create;
  try
    try
      oConn.GetFieldNames(CatalogName, SchemaName, TableName, '', oList);
      Result := (oList.Count > 0);
    except
      Result := False;
    end;
  finally
    FDFree(oList);
    Command.ReleaseConnection(oConn);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.RefreshMetadata;
var
  oConn: TFDCustomConnection;
begin
  if ((Connection = nil) and (ConnectionName = '')) or
     (TableName = '') then
    Exit;
  oConn := Command.AcquireConnection;
  try
    if not oConn.Connected then
      Exit;
    oConn.RefreshMetadataCache(TableName);
    IndexDefs.Updated := False;
    IndexDefs.Update;
  finally
    Command.ReleaseConnection(oConn);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.CreateTable(ARecreate: Boolean = True;
  AParts: TFDPhysCreateTableParts = [tpTable .. tpIndexes]);
var
  sCat, sSch, sBObj, sObj: String;
  oConn: TFDCustomConnection;
  oGen: IFDPhysCommandGenerator;
  oSQLs: TStrings;
  i: Integer;
  lClearIndexes: Boolean;
begin
  CheckInactive;

  Include(FFlags, dfOfflining);
  lClearIndexes := Indexes.Count = 0;
  try
    // Build Table from FieldDefs and IndexDefs
    CheckTable;
    OpenIndexes;

    oConn := Command.AcquireConnection;
    try
      Command.Disconnect;
      oConn.CheckActive;
      oConn.ConnectionIntf.CreateCommandGenerator(oGen, nil);
      oGen.Options := OptionsIntf;
      oGen.Table := Table;
      oGen.GenOptions := [goBeautify, goSkipUnsupTypes];

      // Prepare table name
      oConn.DecodeObjectName(TableName, sCat, sSch, sBObj, sObj);
      if sCat = '' then
        sCat := CatalogName;
      if sSch = '' then
        sSch := SchemaName;
      if (sBObj <> '') and (sObj = '') then
        sObj := sBObj;
      Table.SourceName := oConn.EncodeObjectName(sCat, sSch, sBObj, sObj);

      // Generate DROP TABLE SQL's and execute them
      if ARecreate then begin
        oSQLs := oGen.GenerateDropTable(AParts);
        try
          for i := 0 to oSQLs.Count - 1 do
            try
              Command.Execute(oSQLs[i]);
            except
              on E: EFDDBEngineException do
                if E.Kind <> ekObjNotExists then
                  raise;
            end;
        finally
          FDFree(oSQLs);
        end;
      end;

      // Generate CREATE TABLE SQL's and execute them
      oSQLs := oGen.GenerateCreateTable(AParts);
      try
        for i := 0 to oSQLs.Count - 1 do
          Command.Execute(oSQLs[i]);
      finally
        FDFree(oSQLs);
      end;
    finally
      Command.Disconnect;
      Command.CommandText.Clear;
      Command.ReleaseConnection(oConn);
    end;

  finally
    if lClearIndexes then
      Indexes.Clear;
    Exclude(FFlags, dfOfflining);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.CreateDataSet;
begin
  CreateTable(True, [tpTable .. tpIndexes]);
  Active := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDTable.SaveToStorage(const AFileName: String; AStream: TStream;
  AFormat: TFDStorageFormat);
var
  lPrevCachedUpdates: Boolean;
begin
  lPrevCachedUpdates := CachedUpdates;
  if not lPrevCachedUpdates then
    CachedUpdates := True;
  try
    inherited SaveToStorage(AFileName, AStream, AFormat);
  finally
    if not lPrevCachedUpdates then
      CachedUpdates := False;
  end;
end;

{-------------------------------------------------------------------------------}
{ TFDCustomStoredProc                                                           }
{-------------------------------------------------------------------------------}
function TFDCustomStoredProc.InternalCreateAdapter: TFDCustomTableAdapter;
begin
  Result := inherited InternalCreateAdapter;
  Result.SelectCommand.CommandKind := skStoredProc;
end;

{-------------------------------------------------------------------------------}
function TFDCustomStoredProc.DescriptionsAvailable: Boolean;
var
  oConn: TFDCustomConnection;
  oList: TStrings;
begin
  oConn := Command.AcquireConnection;
  oList := TFDStringList.Create;
  try
    try
      oConn.GetStoredProcNames(CatalogName, SchemaName, PackageName, StoredProcName,
        oList, [osMy, osOther]);
      Result := (oList.Count > 0);
    except
      Result := False;
    end;
  finally
    FDFree(oList);
    Command.ReleaseConnection(oConn);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomStoredProc.ProcNameChanged;
begin
  Command.CommandKind := skStoredProc;
  if not (csReading in ComponentState) and (csDesigning in ComponentState) and
     (StoredProcName <> '') then
    Prepare;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomStoredProc.ExecProc;
begin
  Execute;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomStoredProc.ExecProcBase(const AProcName: String;
  AFunction: Boolean; const AParams: array of Variant;
  const ATypes: array of TFieldType);
var
  i, j, iOver, iErr: Integer;
  s: String;
begin
  Close;
  if AProcName <> '' then begin
    s := AProcName;
    iOver := 0;
    i := Pos(';', s);
    if i <> 0 then begin
      Val(Copy(s, i + 1, MAXINT), iOver, iErr);
      if iErr = 0 then
        s := Copy(s, 1, i - 1);
    end;
    Overload := iOver;
    StoredProcName := s;
  end;
  if not (fiMeta in FetchOptions.Items) and (Params.Count = 0) then begin
    Params.BindMode := pbByNumber;
    if AFunction then
      Params.Add.ParamType := ptResult;
    for i := 0 to High(AParams) do
      Params.Add;
  end;
  if Params.BindMode = pbByNumber then
    for i := 0 to Params.Count - 1 do
      Params[i].Position := i + 1;
  for i := 0 to High(ATypes) do
    if ATypes[i] <> ftUnknown then
      Params[i].DataType := ATypes[i];
  if fiMeta in FetchOptions.Items then
    Prepare;
  j := 0;
  for i := 0 to High(AParams) do begin
    if Params[j].ParamType = ptResult then
      Inc(j);
    Params[j].Value := AParams[i];
    Inc(j);
  end;
  if not (fiMeta in FetchOptions.Items) then
    Prepare;
  Execute;
end;

{-------------------------------------------------------------------------------}
function TFDCustomStoredProc.ExecProc(const AProcName: String;
  const AParams: array of Variant; const ATypes: array of TFieldType): LongInt;
begin
  ExecProcBase(AProcName, False, AParams, ATypes);
  Result := RowsAffected;
end;

{-------------------------------------------------------------------------------}
function TFDCustomStoredProc.ExecProc(const AProcName: String): LongInt;
begin
  Result := ExecProc(AProcName, [], []);
end;

{-------------------------------------------------------------------------------}
function TFDCustomStoredProc.ExecProc(const AProcName: String;
  const AParams: array of Variant): LongInt;
begin
  Result := ExecProc(AProcName, AParams, []);
end;

{-------------------------------------------------------------------------------}
function TFDCustomStoredProc.ExecFunc: Variant;
begin
  Execute;
  Result := ParamByName('Result').Value;
end;

{-------------------------------------------------------------------------------}
function TFDCustomStoredProc.ExecFunc(const AProcName: String;
  const AParams: array of Variant; const ATypes: array of TFieldType): Variant;
begin
  ExecProcBase(AProcName, True, AParams, ATypes);
  Result := ParamByName('Result').Value;
end;

{-------------------------------------------------------------------------------}
function TFDCustomStoredProc.ExecFunc(const AProcName: String): Variant;
begin
  Result := ExecFunc(AProcName, [], []);
end;

{-------------------------------------------------------------------------------}
function TFDCustomStoredProc.ExecFunc(const AProcName: String;
  const AParams: array of Variant): Variant;
begin
  Result := ExecFunc(AProcName, AParams, []);
end;

{-------------------------------------------------------------------------------}
function TFDCustomStoredProc.GetOverload: Word;
begin
  Result := Command.Overload;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomStoredProc.SetOverload(const AValue: Word);
begin
  if Command.Overload <> AValue then begin
    Command.Overload := AValue;
    ProcNameChanged;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomStoredProc.GetProcName: string;
begin
  Result := Trim(Command.CommandText.Text);
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomStoredProc.SetProcName(const AValue: string);
var
  s: String;
begin
  s := Trim(AValue);
  if Trim(Command.CommandText.Text) <> s then begin
    Command.SetCommandText(s, False);
    ProcNameChanged;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomStoredProc.GetPackageName: String;
begin
  Result := Command.BaseObjectName;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomStoredProc.SetPackageName(const AValue: String);
begin
  if Command.BaseObjectName <> AValue then begin
    Command.BaseObjectName := AValue;
    ProcNameChanged;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomStoredProc.GetSchemaName: String;
begin
  Result := Command.SchemaName;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomStoredProc.SetSchemaName(const AValue: String);
begin
  if Command.SchemaName <> AValue then begin
    Command.SchemaName := AValue;
    ProcNameChanged;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDCustomStoredProc.GetCatalogName: String;
begin
  Result := Command.CatalogName;
end;

{-------------------------------------------------------------------------------}
procedure TFDCustomStoredProc.SetCatalogName(const AValue: String);
begin
  if Command.CatalogName <> AValue then begin
    Command.CatalogName := AValue;
    ProcNameChanged;
  end;
end;

{-------------------------------------------------------------------------------}
{ TFDMetaInfoQuery                                                              }
{-------------------------------------------------------------------------------}
function TFDMetaInfoQuery.InternalCreateAdapter: TFDCustomTableAdapter;
begin
  Result := TFDTableAdapter.Create(nil);
  Result.SelectCommand := TFDMetaInfoCommand.Create(Result);
end;

{-------------------------------------------------------------------------------}
function TFDMetaInfoQuery.GetMetaInfoKind: TFDPhysMetaInfoKind;
begin
  Result := TFDMetaInfoCommand(Command).MetaInfoKind;
end;

{-------------------------------------------------------------------------------}
procedure TFDMetaInfoQuery.SetMetaInfoKind(
  const AValue: TFDPhysMetaInfoKind);
begin
  TFDMetaInfoCommand(Command).MetaInfoKind := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDMetaInfoQuery.GetObjectName: String;
begin
  Result := TFDMetaInfoCommand(Command).ObjectName;
end;

{-------------------------------------------------------------------------------}
procedure TFDMetaInfoQuery.SetObjectName(const AValue: String);
begin
  TFDMetaInfoCommand(Command).ObjectName := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDMetaInfoQuery.GetTableKinds: TFDPhysTableKinds;
begin
  Result := TFDMetaInfoCommand(Command).TableKinds;
end;

{-------------------------------------------------------------------------------}
procedure TFDMetaInfoQuery.SetTableKinds(const AValue: TFDPhysTableKinds);
begin
  TFDMetaInfoCommand(Command).TableKinds := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDMetaInfoQuery.GetWildcard: String;
begin
  Result := TFDMetaInfoCommand(Command).Wildcard;
end;

{-------------------------------------------------------------------------------}
procedure TFDMetaInfoQuery.SetWildcard(const AValue: String);
begin
  TFDMetaInfoCommand(Command).Wildcard := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDMetaInfoQuery.GetOverload: Word;
begin
  Result := TFDMetaInfoCommand(Command).Overload;
end;

{-------------------------------------------------------------------------------}
procedure TFDMetaInfoQuery.SetOverload(const AValue: Word);
begin
  TFDMetaInfoCommand(Command).Overload := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDMetaInfoQuery.GetObjectScopes: TFDPhysObjectScopes;
begin
  Result := TFDMetaInfoCommand(Command).ObjectScopes;
end;

{-------------------------------------------------------------------------------}
procedure TFDMetaInfoQuery.SetObjectScopes(const AValue: TFDPhysObjectScopes);
begin
  TFDMetaInfoCommand(Command).ObjectScopes := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDMetaInfoQuery.GetBaseObjectName: String;
begin
  Result := TFDMetaInfoCommand(Command).BaseObjectName;
end;

{-------------------------------------------------------------------------------}
procedure TFDMetaInfoQuery.SetBaseObjectName(const AValue: String);
begin
  TFDMetaInfoCommand(Command).BaseObjectName := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDMetaInfoQuery.GetSchemaName: String;
begin
  Result := TFDMetaInfoCommand(Command).SchemaName;
end;

{-------------------------------------------------------------------------------}
procedure TFDMetaInfoQuery.SetSchemaName(const AValue: String);
begin
  TFDMetaInfoCommand(Command).SchemaName := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDMetaInfoQuery.GetCatalogName: String;
begin
  Result := TFDMetaInfoCommand(Command).CatalogName;
end;

{-------------------------------------------------------------------------------}
procedure TFDMetaInfoQuery.SetCatalogName(const AValue: String);
begin
  TFDMetaInfoCommand(Command).CatalogName := AValue;
end;

{-------------------------------------------------------------------------------}
{ TFDDataSetParamObject                                                         }
{-------------------------------------------------------------------------------}
type
  TFDDataSetParamObject = class(TParamObject, IFDPhysDataSetParamReader)
  protected
    // IFDPhysDataSetParamReader
    function Reset: Boolean;
    function Next: Boolean;
    function GetData(const AColumn: Integer; var ABuff: Pointer;
      ABuffLen: LongWord; var ADataLen: LongWord; AByVal: Boolean): Boolean;
  public
    constructor Create(AObject: TObject; ADataType: TFieldType; AInstanceOwner: Boolean); override;
  end;

{-------------------------------------------------------------------------------}
constructor TFDDataSetParamObject.Create(AObject: TObject; ADataType: TFieldType;
  AInstanceOwner: Boolean);
var
  oDS: TFDDataSet;
begin
  if not (((AObject is TFDDatSTable) or (AObject is TFDDataSet)) and (ADataType = ftDataSet)) then
    FDException(Self, [S_FD_LComp, S_FD_LComp_PClnt], er_FD_ClntDataSetParamIncompat, []);
  if AObject is TFDDatSTable then begin
    oDS := TFDMemTable.Create(nil);
    TFDDatSTable(AObject).CountRef(0);
    oDS.AttachTable(TFDDatSTable(AObject), nil);
  end
  else
    oDS := TFDDataSet(AObject);
  oDS.Active := True;
  inherited Create(oDS, ADataType, AInstanceOwner);
end;

{-------------------------------------------------------------------------------}
function TFDDataSetParamObject.Reset: Boolean;
var
  oDS: TFDDataSet;
begin
  oDS := GetInstance(False) as TFDDataSet;
  if oDS = nil then
    Result := False
  else begin
    if not oDS.OptionsIntf.FetchOptions.Unidirectional then
      oDS.First;
    Result := oDS.Active and not oDS.Eof;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDataSetParamObject.Next: Boolean;
var
  oDS: TFDDataSet;
begin
  oDS := GetInstance(False) as TFDDataSet;
  if oDS = nil then
    Result := False
  else begin
    oDS.Next;
    Result := oDS.Active and not oDS.Eof;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDataSetParamObject.GetData(const AColumn: Integer;
  var ABuff: Pointer; ABuffLen: LongWord; var ADataLen: LongWord; AByVal: Boolean): Boolean;
var
  oDS: TFDDataSet;
begin
  oDS := GetInstance(False) as TFDDataSet;
  Result := oDS.GetRow().GetData(AColumn, rvDefault, ABuff, ABuffLen, ADataLen, AByVal);
end;

{-------------------------------------------------------------------------------}
initialization
  FDRegisterParamObjectClass(ftDataSet, TFDDataSetParamObject);
  FDRegisterParamObjectClass(ftStream, TParamStreamObject);

finalization
  if (FManagerSingleton <> nil) and FManagerSingleton.FAutoCreated then begin
    FDFree(FManagerSingleton);
    FManagerSingleton := nil;
  end;

end.
