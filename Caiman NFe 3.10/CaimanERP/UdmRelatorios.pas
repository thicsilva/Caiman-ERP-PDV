unit UdmRelatorios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Data.DB, FireDAC.Comp.DataSet, frxClass, frxDBSet;

type
  TdmRelatorios = class(TDataModule)
    QCaixaMovFechamento: TFDQuery;
    TRRelCaixa: TFDTransaction;
    QCaixaFormas: TFDQuery;
    QCaixaAbreFecha: TFDQuery;
    QCaixaAbreFechaCODIGO: TIntegerField;
    QCaixaAbreFechaCOD_EMP: TIntegerField;
    QCaixaAbreFechaCOD_CAI: TIntegerField;
    QCaixaAbreFechaCOD_USU: TIntegerField;
    QCaixaAbreFechaDATA_ABRE: TDateField;
    QCaixaAbreFechaDATA_FECHA: TDateField;
    QCaixaAbreFechaHORA_ABRE: TTimeField;
    QCaixaAbreFechaHORA_FECHA: TTimeField;
    QCaixaAbreFechaPERIODO_INI: TSQLTimeStampField;
    QCaixaAbreFechaPERIODO_FIM: TSQLTimeStampField;
    QCaixaAbreFechaSALDO_ANTERIOR: TBCDField;
    QCaixaAbreFechaSALDO_FINAL: TBCDField;
    QCaixaAbreFechaSALDO_INICIAL: TBCDField;
    QCaixaAbreFechaDATA_HORA_ABRE: TSQLTimeStampField;
    QCaixaAbreFechaDATA_HORA_FECHA: TSQLTimeStampField;
    QCaixaAbreFechaNOME_USU: TStringField;
    QCaixaAbreFechaRAZAO_EMP: TStringField;
    QCaixaAbreFechaEMISSAO: TDateField;
    QCaixaFormasCOD_MOV: TIntegerField;
    QCaixaFormasCOD_FORMA: TIntegerField;
    QCaixaFormasCOD_EMP: TIntegerField;
    QCaixaFormasCOD_CAI: TIntegerField;
    QCaixaFormasVALOR: TBCDField;
    QCaixaFormasVALOR_CONFERE: TBCDField;
    QCaixaFormasVALOR_DIF: TBCDField;
    QCaixaFormasDESC_FORMA: TStringField;
    QCaixaMovFechamentoPLANO_CONTAS: TStringField;
    QCaixaMovFechamentoPLANO_DESCRICAO: TStringField;
    QCaixaMovFechamentoOP_SALDO: TStringField;
    QCaixaMovFechamentoVALOR: TBCDField;
    QCaixaMovFechamentoSALDO: TBCDField;
    frxCaixaMovFechamento: TfrxDBDataset;
    frxCaixaFormas: TfrxDBDataset;
    frxCaixaAbreFecha: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRelatorios: TdmRelatorios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UDM;

{$R *.dfm}

end.
