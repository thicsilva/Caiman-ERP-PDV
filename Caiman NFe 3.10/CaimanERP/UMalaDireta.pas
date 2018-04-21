unit UMalaDireta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmMalaDireta = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    PC: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    EdtDataIni: TDateTimePicker;
    EdtDataFin: TDateTimePicker;
    Label1: TLabel;
    Panel2: TPanel;
    CheckEmp: TCheckBox;
    BtnImp: TBitBtn;
    BtnSair: TBitBtn;
    QCobranca: TFDQuery;
    QSeleciona: TFDQuery;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    EdtDtAniIni: TDateTimePicker;
    EdtDtAniFin: TDateTimePicker;
    RadioClientes: TRadioButton;
    RadioFilhos: TRadioButton;
    QNiverCliente: TFDQuery;
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnImpClick(Sender: TObject);
    procedure LimpaSelecao;
    procedure Seleciona(codcli : integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnImpKeyPress(Sender: TObject; var Key: Char);
    procedure BtnImpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMalaDireta: TFrmMalaDireta;

implementation
uses
  Udm, UMalaSel, UNovoPrincipal;

{$R *.dfm}

procedure TFrmMalaDireta.Seleciona(codcli : integer);
begin 
   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   dm.IBTRAux.StartTransaction;
   try
     try
       with QSeleciona do
          begin 
             close;
             Parambyname('codcli').AsInteger := codcli;
             ExecOrOpen;
          end;
       dm.IBTRAux.Commit;
     except
        dm.IBTRAux.Rollback;
        AlertaCad('Erro ao selecionar o cliente ' + inttostr(codcli));
     end;
   finally
     QSeleciona.Close;
   end;
end;

procedure TFrmMalaDireta.LimpaSelecao;
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.add('UPDATE CLIENTE ' +
                     'SET SELECIONADO_CLI = ' + #39 + 'N' + #39);
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao Limpar a Seleção');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmMalaDireta.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmMalaDireta.FormShow(Sender: TObject);
begin 
   EdtDataIni.Date    := date;
   EdtDataFin.Date    := date;
   EdtDtAniIni.Date   := date;
   EdtDtAniFin.Date   := date;
   pc.ActivePageIndex := 0;
end;

procedure TFrmMalaDireta.BtnImpClick(Sender: TObject);
begin 
   if Application.MessageBox('Limpar a Seleção Anterior?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin 
        LimpaSelecao;
        if dm.IBTransaction.Active then
           dm.IBTransaction.Commit;
        dm.IBTransaction.StartTransaction;
        case PC.ActivePageIndex of
          0: begin 
                with QCobranca do
                   begin 
                      close;
                      sql.Clear;
                      sql.add('SELECT COD_CLI ' +
                              'FROM CONTAS_RECEBER ' +
                              'WHERE VENCTO_CTR BETWEEN :DATAINI AND :DATAFIN ' +
                              'AND DTPAGTO_CTR IS NULL');
                      if (not CheckEmp.Checked) then
                          begin 
                             sql.Add(' AND COD_EMP = :CODEMP');
                             Parambyname('codemp').AsInteger:= iEmp;
                          end;
                      Parambyname('dataini').Asdate:= EdtDataIni.Date;
                      Parambyname('datafin').Asdate:= EdtDataFin.Date;
                      Open;
                      First;
                      while not eof do
                         begin 
                            Seleciona(fieldbyname('cod_cli').AsInteger);
                            next;
                         end;
                   end;
                dm.IBTransaction.Commit;
                QCobranca.Close;
             end;
          1: begin 
                if RadioClientes.Checked then
                   begin 
                      with QNiverCliente do
                         begin 
                            parambyname('dia1').AsInteger := strtoint(copy(datetostr(EdtDtAniIni.Date), 1,2));
                            parambyname('dia2').AsInteger := strtoint(copy(datetostr(EdtDtAniFin.Date), 1,2));
                            parambyname('mes1').AsInteger := strtoint(copy(datetostr(EdtDtAniIni.Date), 4,2));
                            parambyname('mes2').AsInteger := strtoint(copy(datetostr(EdtDtAniFin.Date), 4,2));
                            Open;
                            First;
                            while not eof do
                                begin 
                                   Seleciona(fieldbyname('cod_cli').AsInteger);
                                   next;
                                end;
                         end;
                      dm.IBTransaction.Commit;
                      QNiverCliente.Close;
                   end
                else
                   begin 

                   end;
             end;
        end;
     end;

   Application.CreateForm(TFrmMalaSel, FrmMalaSel);
   FrmMalaSel.ShowModal;
end;

procedure TFrmMalaDireta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   Action:= caFree;
end;

procedure TFrmMalaDireta.BtnImpKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmMalaDireta.BtnImpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.
