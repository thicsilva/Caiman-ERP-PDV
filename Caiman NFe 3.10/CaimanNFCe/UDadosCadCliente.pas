unit UDadosCadCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, DB, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmDadosCadCliente = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Label1: TLabel;
    EdtCPF: TEdit;
    Label2: TLabel;
    EdtDataNasc: TEdit;
    Label3: TLabel;
    EdtDoc: TEdit;
    Label6: TLabel;
    EdtEndRes: TEdit;
    Label7: TLabel;
    EdtBaiRes: TEdit;
    Label8: TLabel;
    EdtCidRes: TEdit;
    Label10: TLabel;
    Label9: TLabel;
    EdtPR: TEdit;
    EdtCel: TEdit;
    EdtTelRes: TEdit;
    Label13: TLabel;
    Label35: TLabel;
    Label44: TLabel;
    Label4: TLabel;
    EdtCod: TEdit;
    Label5: TLabel;
    EdtNome: TEdit;
    EdtUF: TEdit;
    QConsCliente: TFDQuery;
    Label11: TLabel;
    EdtDataCadastro: TEdit;
    Label12: TLabel;
    EdtRef: TEdit;
    Label14: TLabel;
    QConsClienteBAIRES_CLI: TStringField;
    QConsClienteCELULAR_CLI: TStringField;
    QConsClienteCEPRES_CLI: TStringField;
    QConsClienteCIDRES_CLI: TStringField;
    QConsClienteCNPJ_CLI: TStringField;
    QConsClienteDATACADASTRO_CLI: TDateField;
    QConsClienteDOC_CLI: TStringField;
    QConsClienteENDRES_CLI: TStringField;
    QConsClienteESTRES_CLI: TStringField;
    QConsClienteNASCIMENTO_CLI: TDateField;
    QConsClienteTELRES_CLI: TStringField;
    QConsClientePONTO_REFERENCIA: TStringField;
    QConsClienteBLOQUEADO_CLI: TStringField;
    QConsClienteTIPO_CREDITO_CLI: TStringField;
    EdtCepRes: TEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDadosCadCliente: TFrmDadosCadCliente;

implementation
uses
  Udm;

{$R *.dfm}

procedure TFrmDadosCadCliente.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmDadosCadCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close;
end;

procedure TFrmDadosCadCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   QConsCliente.Close;
   Action:= caFree;
   Self := nil;
end;

procedure TFrmDadosCadCliente.FormShow(Sender: TObject);
begin

   if edtcod.Text = '' then
      exit;

   if QConsCliente.Transaction.Active then
      QConsCliente.Transaction.Commit;
   QConsCliente.Transaction.StartTransaction;
   try
     with QConsCliente do
        begin
           close;
           parambyname('codcli').AsInteger:= StrToInt(EdtCod.text);
           Open;
           if QConsClienteBLOQUEADO_CLI.AsString = 'S' then
              begin
                 Label14.Font.Color:= clRed;
                 Label14.Caption:= 'BLOQUEADO';
              end
           else
              begin
                 Label14.Font.Color:= clNavy;
                 Label14.Caption:= '';
              end;
           EdtDataCadastro.Text  := QConsClienteDATACADASTRO_CLI.AsString;
           EdtRef.Text           := QConsClienteTIPO_CREDITO_CLI.AsString;
           EdtDataNasc.Text      := QConsClienteNASCIMENTO_CLI.AsString;
           EdtCPF.Text           := QConsClienteCNPJ_CLI.AsString;
           EdtDoc.Text           := QConsClienteDOC_CLI.AsString;
           EdtEndRes.Text        := QConsClienteENDRES_CLI.AsString;
           EdtBaiRes.Text        := QConsClienteBAIRES_CLI.AsString;
           EdtCidRes.Text        := QConsClienteCIDRES_CLI.AsString;
           edtuf.Text            := QConsClienteESTRES_CLI.AsString;
           EdtCepRes.Text        := QConsClienteCEPRES_CLI.AsString;
           EdtTelRes.Text        := QConsClienteTELRES_CLI.AsString;
           EdtCel.Text           := QConsClienteCELULAR_CLI.AsString;
           EdtPR.Text            := QConsClientePONTO_REFERENCIA.AsString;
        end;
   finally
      QConsCliente.Close;
      QConsCliente.Transaction.Commit;
   end;
end;

end.
