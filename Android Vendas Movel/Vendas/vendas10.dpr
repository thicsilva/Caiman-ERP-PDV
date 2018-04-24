program vendas10;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMFORMCADASTRO in 'FMFORMCADASTRO.pas' {FMCADASTROS},
  MDCONEXAO in 'MDCONEXAO.pas' {DMCONEXAO: TDataModule},
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TDMCONEXAO, DMCONEXAO);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFMCADASTROS, FMCADASTROS);
  Application.Run;
end.
