unit UAtualizaEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, acPNG, ExtCtrls, ComCtrls, StdCtrls, sLabel, UVendasCaixa;

type
  TfrmAtualizaEstoque = class(TForm)
    LabelEstoque: TsLabelFX;
    PBEstoque: TProgressBar;
    ImgAtu: TImage;
    sLabelFX1: TsLabelFX;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtualizaEstoque: TfrmAtualizaEstoque;

implementation

uses UMenuFiscal, UDM;

{$R *.dfm}

procedure TfrmAtualizaEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FreeAndNil( frmAtualizaEstoque );
end;

procedure TfrmAtualizaEstoque.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TfrmAtualizaEstoque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (ssAlt in Shift) and (chr(Key) in ['M', 'm']) then
      begin
         if (iCodPreVenda = 0) and (iCodOrcamento = 0) and (iCodOrdemServico = 0) and (iCodigoVenda = 0) and (iCodContaCliente = 0) then
            begin
               Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
               FrmMenuFiscal.showmodal;
            end;
      end;
end;

procedure TfrmAtualizaEstoque.FormShow(Sender: TObject);
begin
//   Brush.Style := bsClear;
   DM.CriaImg;
   dm.CarregaImagem2( dm.FundoMenTef, dm.ImgTempCia );
   ImgAtu.Picture.Bitmap.Assign( DM.ImgTempCia );
   DM.DestroyImg;


end;

end.
