unit USpedPis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ACBrSpedPisCofins, StdCtrls, Mask, sMaskEdit, sCustomComboEdit, 
  sTooledit, Buttons, ImgList, acAlphaImageList, ComCtrls, sTreeView, DB, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton, System.ImageList;

type
  TfrmSpedPis = class(UNovoFormulario.TForm)
    Data_INI: TsDateEdit;
    Label1: TLabel;
    Data_Fim: TsDateEdit;
    Label2: TLabel;
    SpeedButton1: TsSpeedButton;
    Imagens: TsAlphaImageList;
    ListaErro: TsTreeView;
    Empresas: TFDQuery;
    EmpresasCOD_EMP: TIntegerField;
    EmpresasRAZAO_EMP: TStringField;
    EmpresasEND_EMP: TStringField;
    EmpresasBAI_EMP: TStringField;
    EmpresasCID_EMP: TStringField;
    EmpresasCEP_EMP: TStringField;
    EmpresasEST_EMP: TStringField;
    EmpresasINSC_EMP: TStringField;
    EmpresasTEL_EMP: TStringField;
    EmpresasFAX_EMP: TStringField;
    EmpresasNOME_EMP_ETIQUETA: TStringField;
    EmpresasNUMERO_EMP: TStringField;
    EmpresasRESP_EMP: TStringField;
    EmpresasCAMINHO_FOTO_EMP: TStringField;
    EmpresasFANTASIA_EMP: TStringField;
    EmpresasMOSTRAR_SITCLI_PREVENDA: TStringField;
    EmpresasCADASTRAR_CLIENTE_SEM_CPF: TStringField;
    EmpresasTIPO_EMP: TIntegerField;
    EmpresasTIPO_CARGA_BALANCA: TIntegerField;
    EmpresasCNPJ_EMP: TStringField;
    EmpresasCAMINHO_VALIDADOR_SINTEGRA: TStringField;
    EmpresasINSCRICAO_MUNICIPAL: TStringField;
    EmpresasPERFIL_EFD: TStringField;
    EmpresasCODIGO_MUNICIPIO: TStringField;
    EmpresasTIPO_ATIVIDADE_EFD: TIntegerField;
    EmpresasNOME_CONTADOR: TStringField;
    EmpresasCPF_CONTADOR: TStringField;
    EmpresasCRC_CONTADOR: TStringField;
    EmpresasCNPJ_CONTADOR: TStringField;
    EmpresasCEP_CONTADOR: TStringField;
    EmpresasEND_CONTADOR: TStringField;
    EmpresasNUMERO_CONTADOR: TStringField;
    EmpresasBAIRRO_CONTADOR: TStringField;
    EmpresasTEL_CONTADOR: TStringField;
    EmpresasFAX_CONTADOR: TStringField;
    EmpresasCODIGO_MUNICIPIO_CONTADOR: TStringField;
    CheckMatrizFilial: TCheckBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ListaErroExpanded(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
  public
    { Public declarations }
    Errogeracao: Boolean;
    procedure AdicionaItem( Texto: string; Imagen: Integer );
    procedure LimparLista;
  end;

var
  frmSpedPis: TfrmSpedPis;

implementation

uses
  UDMefd, UDM, UDialog, UNovoPrincipal;

{$R *.dfm}

procedure TfrmSpedPis.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
   Action := caFree;
   Self := nil;
end;

procedure TfrmSpedPis.FormShow(Sender: TObject);
begin 
   Data_INI.Date := Date;
   Data_Fim.Date := Date;
   LimparLista;
   AdicionaItem( 'Aguardando Geração', 5 );
end;

procedure TfrmSpedPis.SpeedButton1Click(Sender: TObject);
begin 
   Errogeracao := false;
   LimparLista();
   DMefd.DATA_INCIO := Data_INI.Date;
   DMefd.DATA_Fim := Data_Fim.Date;
   DMefd.GeraMatrizFilial := CheckMatrizFilial.Checked;

  if DMefd.TREfd.Active then
    DMefd.TREfd.Commit;
  DMefd.TREfd.StartTransaction;
   DMefd.Bloco_0;
        if not DMefd.GeraMatrizFilial then
           begin 
              Empresas.Close;
              Empresas.SQL.Text := 'select * from empresa where COD_EMP=:CODEMP';
              Empresas.ParamByName( 'CODEMP' ).AsInteger := iEmp;
           end;
   Empresas.Open;
   Empresas.First;
   while not Empresas.Eof do
      begin 
         DMefd.EmpresaGera := EmpresasCOD_EMP.AsInteger;
         DMefd.AbreTabelas;
         DMefd.Bloco_a;
         Empresas.Next;
      end;
   Empresas.First;
   while not Empresas.Eof do
      begin 
         DMefd.EmpresaGera := EmpresasCOD_EMP.AsInteger;
         DMefd.AbreTabelas;
         DMefd.Bloco_C;
         Empresas.Next;
      end;
   DMefd.PisCofins.WriteBloco_C(True); // True, fecha o Bloco
   Empresas.First;
   while not Empresas.Eof do
      begin 
         DMefd.EmpresaGera := EmpresasCOD_EMP.AsInteger;
         DMefd.AbreTabelas;
         DMefd.Bloco_D;
         Empresas.Next;
      end;

    Empresas.First;
   while not Empresas.Eof do
      begin 
         DMefd.EmpresaGera := EmpresasCOD_EMP.AsInteger;
         DMefd.AbreTabelas;
         DMefd.Bloco_F;
         Empresas.Next;
      end;



   DMefd.FechaTudo;
   DMefd.PisCofins.SaveFileTXT;
   if Errogeracao then
        AdicionaItem( 'Sped Gerado com erros!', 2 )
   else
       AdicionaItem( 'Sped gerado com sucesso!', 3 );

       DMefd.EmpresaFilha.SQL.Text := DMefd.SqlEmpresa;
       Empresas.SQL.Text := DMefd.SqlEmpresa;
       KDialog( 'Arquivo gerado em : ' + #13 +
   DMefd.PisCofins.Path + DMefd.PisCofins.Arquivo , 'Sped Pis Cofins', tdtInfo );


end;

procedure TfrmSpedPis.AdicionaItem(Texto: string; Imagen: Integer);
var
  Itens: TTreeNode;
begin 
  Itens := ListaErro.Items.Add( nil, Texto );
  Itens.ImageIndex := Imagen;
  Itens.SelectedIndex := Imagen;
  Itens.ExpandedImageIndex := Imagen;

end;

procedure TfrmSpedPis.LimparLista;
begin 
  ListaErro.Items.Clear;
end;

procedure TfrmSpedPis.ListaErroExpanded(Sender: TObject; Node: TTreeNode);
begin 
   ListaErro.FullCollapse;
end;

end.
