unit UfrmSpedFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ImgList, acAlphaImageList, StdCtrls, ComCtrls, sTreeView, Mask, 
  sMaskEdit, sCustomComboEdit, sTooledit, Buttons, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton, System.ImageList;

type
  TfrmSpedFiscal = class(UNovoFormulario.TForm)
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TsSpeedButton;
    Data_INI: TsDateEdit;
    Data_Fim: TsDateEdit;
    ListaErro: TsTreeView;
    Imagens: TsAlphaImageList;
    QInsert: TFDQuery;
    QInsertCODIGO: TIntegerField;
    CMD: TFDQuery;
    GroupBox1: TGroupBox;
    chkInventario: TCheckBox;
    chkZerados: TCheckBox;
    data_fim_inv: TsDateEdit;
    Label3: TLabel;
    data_ini_inv: TsDateEdit;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
        procedure ListaErroExpanded(Sender: TObject; Node: TTreeNode);
    procedure SpeedButton1Click(Sender: TObject);
    procedure chkInventarioClick(Sender: TObject);
    procedure GeraInventario;
  private
    { Private declarations }
  public
    { Public declarations }
    Errogeracao: Boolean;
    procedure AdicionaItem( Texto: string; Imagen: Integer );
    procedure LimparLista;
  end;

var
  frmSpedFiscal: TfrmSpedFiscal;

implementation

uses
  UdmEFDFiscal, UDM, UDialog, UNovoPrincipal;

{$R *.dfm}





procedure TfrmSpedFiscal.AdicionaItem(Texto: string; Imagen: Integer);
var
  Itens: TTreeNode;
begin 
  Itens := ListaErro.Items.Add( nil, Texto );
  Itens.ImageIndex := Imagen;
  Itens.SelectedIndex := Imagen;
  Itens.ExpandedImageIndex := Imagen;

end;

procedure TfrmSpedFiscal.chkInventarioClick(Sender: TObject);
begin 
   chkZerados.Visible := chkInventario.Checked;
end;

procedure TfrmSpedFiscal.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
     Action := caFree;
     Self := nil;
end;

procedure TfrmSpedFiscal.FormShow(Sender: TObject);
begin 
   Data_INI.Date := Date;
   Data_Fim.Date := Date;
   LimparLista;
   AdicionaItem( 'Aguardando Geração', 5 );
end;

procedure TfrmSpedFiscal.GeraInventario;
var
   iAuxCod: Integer;
begin 
   AdicionaItem( 'Gerando inventário', 4 );
   { Incluindo na Tabela INVENTARIO_ESTOQUE }
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QInsert do
          begin 
             close;
             Parambyname('data').AsDate:= Data_Fim_inv.Date;
             Parambyname('codemp').AsInteger:= iEmp;
             open;
             iAuxCod:= QInsertCODIGO.AsInteger;
          end;
       dm.IBTransaction.Commit;
     except
       iAuxCod:= 0;
       dm.IBTransaction.Rollback;
        AdicionaItem( 'Erro ao gravar inventário!', 2 );
                dmEFDFiscal.CodInventario := 0;
        Exit;
     end;
   finally
     dm.QConsulta.Close;
   end;
   AdicionaItem( 'Código Inventário : ' + IntToStr( iAuxCod ), 6 );
   AdicionaItem( 'Processando...', 6 );

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       CMD.SQL.Clear;
       CMD.SQL.Add( 'execute procedure SP_GERA_INVENTARIO(  :COD_EMP, :DATA_ESTOQUE, :DATA_INV, :COD_INV,:ZERADO );');
       cmd.ParamByName( 'COD_EMP' ).AsInteger := iEmp;
       cmd.ParamByName( 'DATA_ESTOQUE' ).AsDate := data_ini_inv.Date;
       cmd.ParamByName( 'DATA_INV' ).AsDate := Data_Fim_inv.Date;
       cmd.ParamByName( 'COD_INV' ).AsInteger := iAuxCod;
       if chkZerados.Checked then
          cmd.ParamByName( 'ZERADO' ).AsString := 'S'
       else
          cmd.ParamByName( 'ZERADO' ).AsString := 'N';
{       with IBSP do
          begin 
             close;
             Params[0].AsInteger := iEmp;
             Params[1].AsDate    := DataEstoque;
             Params[2].AsDate    := EdtData.Date;
             Params[3].AsInteger := iAuxCod;
             if Check.Checked then
                Params[4].AsString:= 'S'
             else
                Params[4].AsString:= 'N';
             ExecProc;
          end;}
          cmd.Prepare;
          cmd.ExecOrOpen;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
        AdicionaItem( 'Erro ao gravar inventário!', 2 );
        dmEFDFiscal.CodInventario := 0;
        Exit;
     end;
   finally
//     IBSP.Close;
     Cmd.Close;
   end;
   dmEFDFiscal.CodInventario := iAuxCod;
   dmEFDFiscal.data_inv_ini := data_ini_inv.Date;
   dmEFDFiscal.data_inv_fim := data_fim_inv.Date;
   AdicionaItem( 'Inventário Concluido!', 1 );
end;

procedure TfrmSpedFiscal.LimparLista;
begin 
  ListaErro.Items.Clear;
end;

procedure TfrmSpedFiscal.ListaErroExpanded(Sender: TObject; Node: TTreeNode);
begin 
   ListaErro.FullCollapse;
end;


procedure TfrmSpedFiscal.SpeedButton1Click(Sender: TObject);
begin 
   LimparLista;
   if chkInventario.Checked then
      begin 
        GeraInventario;
        if dmEFDFiscal.CodInventario = 0 then
           Exit;
      end;
   dmEFDFiscal.GeraSped( iEmp, Data_INI.Date, Data_Fim.Date );

   if Errogeracao then
        AdicionaItem( 'Sped Gerado com erros!', 2 )
   else
       AdicionaItem( 'Sped gerado com sucesso!', 3 );


   KDialog( 'Arquivo gerado em : ' + #13 +
   dmEFDFiscal.ACBrSPEDFiscal1.Path +dmEFDFiscal.ACBrSPEDFiscal1.Arquivo , 'Sped Fiscal', tdtInfo );
end;

end.
