unit UAuxPromocao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask, ComCtrls, ExtCtrls, rxToolEdit, rxCurrEdit, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, Data.DB;

type
  TFrmAuxPromocao = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Label4: TLabel;
    EdtInicio: TMaskEdit;
    Label6: TLabel;
    EdtTermino: TMaskEdit;
    Label7: TLabel;
    EdtPromocao: TCurrencyEdit;
    BtnOK: TBitBtn;
    BtnCancelar: TBitBtn;
    GroupBox1: TGroupBox;
    IBSQLAux: TFDQuery;
    Label5: TLabel;
    ComboTipo: TComboBox;
    Label1: TLabel;
    EdtEmp: UNovosComponentes.TEdit;
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAuxPromocao: TFrmAuxPromocao;

implementation
uses
  Udm, UConsProd, UNovoPrincipal;

{$R *.dfm}

procedure TFrmAuxPromocao.BtnCancelarClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmAuxPromocao.FormShow(Sender: TObject);
begin 
   ComboTipo.ItemIndex:= 0;

   try
      EdtInicio.Text:= dm.LeINI('ConfigLocal.ini', 'ConfiguracaoLocal', 'InicioPromocao');
   except
      EdtInicio.Clear;
   end;

   try
      EdtTermino.Text:= dm.LeINI('ConfigLocal.ini', 'ConfiguracaoLocal', 'FinalPromocao');
   except
      EdtTermino.Clear;
   end;

   EdtPromocao.Clear;
   ComboTipo.SetFocus;
end;

procedure TFrmAuxPromocao.BtnOKClick(Sender: TObject);
begin 
   if BtnCancelar.Focused then
      exit;

   if EdtPromocao.Text = '0' then
      begin 
         EdtPromocao.SetFocus;
         exit;
         abort;
      end;

   if strtodate(EdtTermino.Text) < StrToDate(EdtInicio.Text) then
      begin 
         AlertaCad('O término tem que ser maior que o início');
//         EdtInicio.SetFocus;
         exit;
         abort;
      end;

   if strtodate(EdtTermino.Text) < date then
      begin 
         AlertaCad('O término tem que ser maior ou igual hoje');
//         EdtInicio.SetFocus;
         exit;
         abort;
      end;

  if application.MessageBox('Confirma a Promoção?', 'Promoção', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton1) = 6 then
     begin 
        if dm.IBTRAux.Active then
           dm.IBTRAux.Commit;
        dm.IBTRAux.StartTransaction;
        with dm.QProd do
           begin 
              DisableControls;
              First;
              while not eof do
                  begin 
                     if FrmConsProd.DBGrid.SelectedRows.CurrentRowSelected then
                        begin 
                           IBSQLAux.Close;
                           IBSQLAux.Parambyname('codpro').AsInteger    := dm.QProdCOD_PRO.AsInteger;
                           IBSQLAux.Parambyname('inicio').AsDate       := strtodate(EdtInicio.Text);
                           IBSQLAux.Parambyname('termino').AsDate      := strtodate(EdtTermino.Text);
                           IBSQLAux.Parambyname('promocao').AsCurrency := strtocurr(EdtPromocao.Text);
                           if trim(EdtEmp.Text) = '' then
                              IBSQLAux.Parambyname('codemp').value     := null
                           else
                              IBSQLAux.Parambyname('codemp').AsInteger := strtoint(EdtEmp.Text);
                           IBSQLAux.ParamByName('tipo').AsInteger      := ComboTipo.ItemIndex;
                           IBSQLAux.ExecOrOpen;
                        end;
                     next;
                  end;
              First;
              EnableControls;
           end;
        dm.IBTRAux.Commit;
        IBSQLAux.close;

        { grava as datas }
        DM.GravaIni('ConfigLocal.ini', 'ConfiguracaoLocal', 'InicioPromocao', EdtInicio.Text);
        DM.GravaIni('ConfigLocal.ini', 'ConfiguracaoLocal', 'FinalPromocao', EdtTermino.Text);

        close;
     end;
end;

procedure TFrmAuxPromocao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   IBSQLAux.close;
   Action:= caFree;
end;

procedure TFrmAuxPromocao.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if key = #13 then
      begin 
         key:= #0;
         SelectNext(ActiveControl, true, true);
      end;
end;

procedure TFrmAuxPromocao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.
