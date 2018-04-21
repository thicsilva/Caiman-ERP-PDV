unit UTSP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinMetropolis, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxProgressBar, cxClasses, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxGrid;

type
  TfrmTSP = class(TFrame)
    cxTarefas: TcxGrid;
    cxTarefasTableView1: TcxGridTableView;
    cxTarefasTableView1Column1: TcxGridColumn;
    cxTarefasTableView1Column3: TcxGridColumn;
    cxTarefasTableView1Column2: TcxGridColumn;
    cxTarefasTableView1Column4: TcxGridColumn;
    cxTarefasLevel1: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    cxstyl1: TcxStyle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
