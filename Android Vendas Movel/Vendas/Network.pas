unit Network;

interface

function IsConnected: Boolean;

function IsWiFiConnected: Boolean;

function IsMobileConnected: Boolean;

implementation

uses
  System.SysUtils,
  Androidapi.JNIBridge,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  FMX.Helpers.Android,
  Androidapi.Helpers;

type
  JConnectivityManager = interface;
  JNetworkInfo = interface;

  JNetworkInfoClass = interface(JObjectClass)
  ['{E92E86E8-0BDE-4D5F-B44E-3148BD63A14C}']
  end;

  [JavaSignature('android/net/NetworkInfo')]
  JNetworkInfo = interface(JObject)
  ['{6DF61A40-8D17-4E51-8EF2-32CDC81AC372}']
    {Methods}
    function isAvailable: Boolean; cdecl;
    function isConnected: Boolean; cdecl;
    function isConnectedOrConnecting: Boolean; cdecl;
  end;
  TJNetworkInfo = class(TJavaGenericImport<JNetworkInfoClass, JNetworkInfo>) end;

  JConnectivityManagerClass = interface(JObjectClass)
  ['{E03A261F-59A4-4236-8CDF-0068FC6C5FA1}']
    {Property methods}
    function _GetTYPE_WIFI: Integer; cdecl;
    function _GetTYPE_WIMAX: Integer; cdecl;
    function _GetTYPE_MOBILE: Integer; cdecl;
    {Properties}
    property TYPE_WIFI: Integer read _GetTYPE_WIFI;
    property TYPE_WIMAX: Integer read _GetTYPE_WIMAX;
    property TYPE_MOBILE: Integer read _GetTYPE_MOBILE;
  end;

  [JavaSignature('android/net/ConnectivityManager')]
  JConnectivityManager = interface(JObject)
  ['{1C4C1873-65AE-4722-8EEF-36BBF423C9C5}']
    {Methods}
    function getActiveNetworkInfo: JNetworkInfo; cdecl;
    function getNetworkInfo(networkType: Integer): JNetworkInfo; cdecl;
  end;
  TJConnectivityManager = class(TJavaGenericImport<JConnectivityManagerClass, JConnectivityManager>) end;

function GetConnectivityManager: JConnectivityManager;
var
  ConnectivityServiceNative: JObject;
begin
  ConnectivityServiceNative := SharedActivityContext.getSystemService(TJContext.JavaClass.CONNECTIVITY_SERVICE);
  if not Assigned(ConnectivityServiceNative) then
    raise Exception.Create('Could not locate Connectivity Service');
  Result := TJConnectivityManager.Wrap(
    (ConnectivityServiceNative as ILocalObject).GetObjectID);
  if not Assigned(Result) then
    raise Exception.Create('Could not access Connectivity Manager');
end;

function IsConnected: Boolean;
var
  ConnectivityManager: JConnectivityManager;
  ActiveNetwork: JNetworkInfo;
begin
  ConnectivityManager := GetConnectivityManager;
  ActiveNetwork := ConnectivityManager.getActiveNetworkInfo;
  Result := Assigned(ActiveNetwork) and ActiveNetwork.isConnected;
end;

function IsWiFiConnected: Boolean;
var
  ConnectivityManager: JConnectivityManager;
  WiFiNetwork: JNetworkInfo;
begin
  ConnectivityManager := GetConnectivityManager;
  WiFiNetwork := ConnectivityManager.getNetworkInfo(TJConnectivityManager.JavaClass.TYPE_WIFI);
  Result := WiFiNetwork.isConnected;
end;

function IsMobileConnected: Boolean;
var
  ConnectivityManager: JConnectivityManager;
  MobileNetwork: JNetworkInfo;
begin
  ConnectivityManager := GetConnectivityManager;
  MobileNetwork := ConnectivityManager.getNetworkInfo(TJConnectivityManager.JavaClass.TYPE_MOBILE);
  Result := MobileNetwork.isConnected;
end;
end.


