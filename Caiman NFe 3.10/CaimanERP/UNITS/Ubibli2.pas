unit Ubibli2;

interface

uses
  SysUtils, StdCtrls, Dialogs, Controls, IB, DB, Mask, Windows, ComCtrls,
  ExtCtrls, Grids, ExtDlgs, rxCurrEdit, DateUtils, DBGrids, RzCmboBx, RzDBCmbo,
  DBCtrls, Forms, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script,
  FireDAC.Comp.DataSet;

  Procedure LimpaEdit(form: Tform);
  function SomenteNumeros(N: String): String;

implementation

function SomenteNumeros(N: String): String;
var
  I: Integer;
begin
   Result := '';
   for I := 0 to Length(N) do
      if True then
         if CharInSet( N[I], ['0'..'9'] ) then
            Result := Result + N[I];
end;

Procedure LimpaEdit(form: Tform);
var
  i: Integer;
begin
  for i := 0 to form.ComponentCount - 1 do
  begin
    if form.Components[i] is TEdit then
      TEdit(form.Components[i]).Clear
    else if form.Components[i] is TEdit then
      TEdit(form.Components[i]).Clear
    else if form.Components[i] is Tmaskedit then
      Tmaskedit(form.Components[i]).Clear
    else if form.Components[i] is Tcombobox then
    begin
      if Tcombobox(form.Components[i]).Style = csDropDown then
        Tcombobox(form.Components[i]).Text := ''
      else
        Tcombobox(form.Components[i]).ItemIndex := -1;
    end
    else if form.Components[i] is Tcheckbox then
    begin
      Tcheckbox(form.Components[i]).Checked := false
    end
    else if form.Components[i] is Tmemo then
      Tmemo(form.Components[i]).Clear
    else if form.Components[i] is TOpenPictureDialog then
      TOpenPictureDialog(form.Components[i]).FileName := ''
    else if form.Components[i] is TCurrencyEdit then
      TCurrencyEdit(form.Components[i]).Text := '0,00'
    else if form.Components[i] is TListBox then
      TListBox(form.Components[i]).Clear
    else if form.Components[i] is TRichEdit then
      TRichEdit(form.Components[i]).Clear
    else if form.Components[i] is TRadioGroup then
      TRadioGroup(form.Components[i]).ItemIndex := -1;
  end;
end;

end.
