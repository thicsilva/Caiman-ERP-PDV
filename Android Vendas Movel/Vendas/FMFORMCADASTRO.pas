unit FMFORMCADASTRO;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Layouts, FMX.ListView.Types, MultiDetailAppearanceU, FMX.Edit,
  FMX.ListBox, FMX.StdCtrls, FMX.ListView, Data.DB, MemDS, DBAccess, Uni,System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, System.Actions,
  FMX.ActnList,System.StrUtils,FMX.VirtualKeyboard,FMX.Platform,System.Math,
  FMX.Controls.Presentation, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base;

type
  TFMCADASTROS = class(TForm)
    VertScrollBox1: TVertScrollBox;
    MainLayout1: TLayout;
    TAB_GERAL: TTabControl;
    tabproduto: TTabItem;
    ToolBar11: TToolBar;
    Label11: TLabel;
    ToolBar12: TToolBar;
    SpeedButton6: TSpeedButton;
    BTN_ALTERAPROD: TSpeedButton;
    ListViewMultiDetail: TListView;
    Panel2: TPanel;
    CB_TIPOPROD: TComboBox;
    BTN_BUSCA_PROD: TSpeedButton;
    EDT_BUSCAPROD: TEdit;
    QRYAUX_INT: TUniQuery;
    QRYPROD: TUniQuery;
    QRYPRODID: TStringField;
    QRYPRODDESC_PROD: TStringField;
    QRYPRODUN: TStringField;
    QRYPRODID_GRUP: TStringField;
    QRYPRODGRUP: TStringField;
    QRYPRODSIT: TStringField;
    QRYPRODVL_VARJ: TFloatField;
    QRYPRODVL_ATAC: TFloatField;
    QRYPRODESTOQUE: TFloatField;
    QRYPRODDATA_CAD: TMemoField;
    QRYPRODfoto: TBlobField;
    CAD_LATERPROD: TTabItem;
    ToolBar26: TToolBar;
    Label61: TLabel;
    ToolBar27: TToolBar;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    Label62: TLabel;
    EDT_DESPROD: TEdit;
    Label63: TLabel;
    EDT_UNPROD: TEdit;
    Label64: TLabel;
    EDT_GRUP_PROD: TEdit;
    Label66: TLabel;
    EDT_VLRPRODV: TEdit;
    Label67: TLabel;
    EDT_VLRPRODA: TEdit;
    lista: TActionList;
    ChangeTabAction1: TChangeTabAction;
    ChangeTabAction2: TChangeTabAction;
    CLIENTES: TTabItem;
    ToolBar17: TToolBar;
    Label34: TLabel;
    ToolBar18: TToolBar;
    SpeedButton14: TSpeedButton;
    BTN_ALTERACLI: TSpeedButton;
    Panel12: TPanel;
    CB_TIPOCLIENTE_VISU: TComboBox;
    SpeedButton15: TSpeedButton;
    EDT_BUSCACLIVISU: TEdit;
    LV_NOVOCLI: TListView;
    CADALTERCLI: TTabItem;
    ToolBar15: TToolBar;
    Label12: TLabel;
    ToolBar16: TToolBar;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    VertScrollBox2: TVertScrollBox;
    Label13: TLabel;
    Label14: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    EDT_EMAIL: TEdit;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    CB_TPCLI: TComboBox;
    EDT_CNPJ_CPF: TEdit;
    EDT_RAZAO: TEdit;
    EDT_FANTASIA: TEdit;
    EDT_LOUG: TEdit;
    EDT_NUMERO: TEdit;
    EDT_COMPLEMENTO: TEdit;
    EDT_BAIRRO: TEdit;
    EDT_CIDADE: TEdit;
    EDT_CEP: TEdit;
    EDT_INCEST: TEdit;
    EDT_FONE: TEdit;
    EDT_CELULAR: TEdit;
    ChangeTabAction3: TChangeTabAction;
    ChangeTabAction4: TChangeTabAction;
    QRYNOVOCLI: TUniQuery;
    QRYNOVOCLICOD_EMPRESA: TIntegerField;
    QRYNOVOCLIID: TIntegerField;
    QRYNOVOCLIID_CID: TIntegerField;
    QRYNOVOCLICNPJ_CPF: TStringField;
    QRYNOVOCLITIPO_CLIENTE: TStringField;
    QRYNOVOCLIRAZAO: TStringField;
    QRYNOVOCLIFANTASIA: TStringField;
    QRYNOVOCLILOUGRAD: TStringField;
    QRYNOVOCLINR: TStringField;
    QRYNOVOCLICOMPLEMT: TStringField;
    QRYNOVOCLIBAIRRO: TStringField;
    QRYNOVOCLIUF: TStringField;
    QRYNOVOCLICIDADE: TStringField;
    QRYNOVOCLICEP: TStringField;
    QRYNOVOCLIINC_ESTADUAL: TStringField;
    QRYNOVOCLIFONE: TStringField;
    QRYNOVOCLICELULAR: TStringField;
    QRYNOVOCLIIMAIL: TStringField;
    QRYNOVOCLIDATA_CAD: TMemoField;
    QRYNOVOCLIFALG_NOVO: TMemoField;
    BTN_ADDCLI: TSpeedButton;
    BTN_NOVOPROD: TSpeedButton;
    CB_UF: TComboBox;
    function GetSelectedValue(AObject: TObject): TValue;
    procedure BTN_BUSCA_PRODClick(Sender: TObject);
    PROCEDURE BUSCA_PROD;
    PROCEDURE CARREGA_PROD;
    procedure SpeedButton23Click(Sender: TObject);
    FUNCTION MAX_ALPHA(EDIT:STRING;I_TAMANHO:INTEGER):STRING;
    function TrocaVirgPPto(Valor: string): String;
    procedure SpeedButton22Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BTN_NOVOPRODClick(Sender: TObject);
    procedure BTN_ALTERAPRODClick(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    function ValidaCNPJ(numCNPJ: string): boolean;
    function ValidaCPF(numCPF: string): boolean;
    procedure SpeedButton12Click(Sender: TObject);
    PROCEDURE ATUALIZA_CLINOVO;
    procedure BTN_ADDCLIClick(Sender: TObject);
    procedure CB_TPCLIChange(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure BTN_ALTERACLIClick(Sender: TObject);
    procedure LV_NOVOCLIItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure CB_TIPOCLIENTE_VISUChange(Sender: TObject);
    procedure CB_TIPOPRODChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormVirtualKeyboardShown(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure SpeedButton15Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    S_PROD,
    S_COD_GRUP,
    S_ID_USUA,
    S_EXCL_CLINOVO,
    S_ROTA : string;
    B_INSERE_PROD,
    B_ALTERA_CLI : BOOLEAN;
    FKBBounds: TRectF;
    FNeedOffset: Boolean;
    procedure CalcContentBoundsProc(Sender: TObject; var ContentBounds: TRectF);
    procedure RestorePosition;
    procedure UpdateKBBounds;
  end;

var
  FMCADASTROS: TFMCADASTROS;

implementation

{$R *.fmx}

uses Unit1;

procedure TFMCADASTROS.ATUALIZA_CLINOVO;
var
  LItem: TListViewItem;
begin
  // Code to fill TListView
  LV_NOVOCLI.BeginUpdate;
  try
    LV_NOVOCLI.Items.Clear;

    QRYNOVOCLI.Close;
    QRYNOVOCLI.SQL.Clear;
    QRYNOVOCLI.SQL.Add('SELECT * FROM CLIENTE');
    QRYNOVOCLI.SQL.Add('WHERE COD_EMPRESA = 1 ');
    if CB_TIPOCLIENTE_VISU.ItemIndex = 1 then
       if EDT_BUSCACLIVISU.Text.Trim <> '' then
          QRYNOVOCLI.SQL.Add('AND ID = '+EDT_BUSCACLIVISU.Text+' ');

    if CB_TIPOCLIENTE_VISU.ItemIndex = 0 then
       if EDT_BUSCACLIVISU.Text.Trim <> '' then
          QRYNOVOCLI.SQL.Add('AND RAZAO LIKE ''%'+UpperCase(EDT_BUSCACLIVISU.Text)+'%'' ');
    QRYNOVOCLI.SQL.Add('ORDER BY RAZAO        ');
    QRYNOVOCLI.Open;

    while NOT QRYNOVOCLI.Eof do
    begin
      LItem := LV_NOVOCLI.Items.Add;
      LItem.Text := QRYNOVOCLIID.AsString;
      // Update data managed by custom appearance
      LItem.Data[TMultiDetailAppearanceNames.Detail1] := QRYNOVOCLIID.AsString+' - '+QRYNOVOCLIRAZAO.AsString;
      LItem.Data[TMultiDetailAppearanceNames.Detail2] := 'CNPJ/CPF: '+QRYNOVOCLICNPJ_CPF.AsString;
      LItem.Data[TMultiDetailAppearanceNames.Detail3] := 'Fone: '+QRYNOVOCLIFONE.AsString;

      QRYNOVOCLI.Next;
    end;
  finally
    LV_NOVOCLI.EndUpdate;
  end;
  QRYNOVOCLI.Close;
end;

procedure TFMCADASTROS.BTN_ADDCLIClick(Sender: TObject);
begin
   VertScrollBox2.ViewportPosition:=pointf(0,0);
   B_ALTERA_CLI := FALSE;
   CB_TPCLI.Enabled:= TRUE;
   EDT_CNPJ_CPF.Enabled := TRUE;
   CB_TPCLI.ItemIndex :=0;
   CB_TPCLIChange(SELF);
   ChangeTabAction4.ExecuteTarget(self);
end;

procedure TFMCADASTROS.BTN_ALTERACLIClick(Sender: TObject);
begin
   if LV_NOVOCLI.Items.Count = 0 then
      ABORT;

  if S_EXCL_CLINOVO = '' then
  BEGIN
     ShowMessage('Selecione um cliente');
     ABORT;
  END;

  QRYAUX_INT.Close;
  QRYAUX_INT.SQL.Clear;
  QRYAUX_INT.SQL.Add('SELECT * FROM CLIENTE           ');
  QRYAUX_INT.SQL.Add('WHERE  ID = '+S_EXCL_CLINOVO+'            ');
  QRYAUX_INT.Open;

  EDT_RAZAO.Text := QRYAUX_INT.FieldByName('RAZAO').AsString;
  EDT_FANTASIA.Text := QRYAUX_INT.FieldByName('FANTASIA').AsString;
  EDT_LOUG.Text := QRYAUX_INT.FieldByName('LOUGRAD').AsString;
  EDT_NUMERO.Text := QRYAUX_INT.FieldByName('NR').AsString;
  EDT_COMPLEMENTO.Text := QRYAUX_INT.FieldByName('COMPLEMT').AsString;
  EDT_BAIRRO.Text := QRYAUX_INT.FieldByName('BAIRRO').AsString;
  CB_UF.Items.Text := QRYAUX_INT.FieldByName('UF').AsString;
  EDT_CIDADE.Text := QRYAUX_INT.FieldByName('CIDADE').AsString;
  EDT_CEP.Text := QRYAUX_INT.FieldByName('CEP').AsString;
  EDT_INCEST.Text := QRYAUX_INT.FieldByName('INC_ESTADUAL').AsString;
  EDT_FONE.Text := QRYAUX_INT.FieldByName('FONE').AsString;
  EDT_CELULAR.Text := QRYAUX_INT.FieldByName('CELULAR').AsString;
  EDT_EMAIL.Text := QRYAUX_INT.FieldByName('IMAIL').AsString;

  if QRYAUX_INT.FieldByName('TIPO_CLIENTE').AsString = 'JURIDICA' then
     CB_TPCLI.ItemIndex := 0
  ELSE
     CB_TPCLI.ItemIndex := 1;

  EDT_CNPJ_CPF.Enabled := FALSE;
  CB_TPCLIChange(SELF);
  CB_TPCLI.Enabled:= FALSE;

  B_ALTERA_CLI := TRUE;

  EDT_CNPJ_CPF.Text := QRYAUX_INT.FieldByName('CNPJ_CPF').AsString;//ADD CPF DEPOIS QEU PASSA PELO COMBOBOX
  VertScrollBox2.ViewportPosition:=pointf(0,0);
  ChangeTabAction4.ExecuteTarget(self);
end;

procedure TFMCADASTROS.BTN_ALTERAPRODClick(Sender: TObject);
begin
   if ListViewMultiDetail.Items.Count = 0 then
   BEGIN
      ShowMessage('Nenhum Item na lista');
      ABORT;
   END;

   if S_PROD = '' then
   BEGIN
      ShowMessage('Selecione um Item');
      ABORT;
   END;

   QRYAUX_INT.Close;
   QRYAUX_INT.SQL.Clear;
   QRYAUX_INT.SQL.Add('SELECT * FROM PRODUTO        ');
   QRYAUX_INT.SQL.Add('WHERE ID = '+S_PROD+'                 ');
   QRYAUX_INT.Open;

   EDT_DESPROD.Text := QRYAUX_INT.FieldByName('DESC_PROD').AsString;
   EDT_UNPROD.Text := QRYAUX_INT.FieldByName('UN').AsString;
   EDT_GRUP_PROD.Text := QRYAUX_INT.FieldByName('ID_GRUP').AsString;
   EDT_VLRPRODV.Text := FormatFloat(',.00',QRYAUX_INT.FieldByName('VL_VARJ').AsFloat);
   EDT_VLRPRODA.Text := FormatFloat(',.00',QRYAUX_INT.FieldByName('VL_ATAC').AsFloat);

   B_INSERE_PROD := FALSE;

   ChangeTabAction1.ExecuteTarget(self);
end;

procedure TFMCADASTROS.BTN_BUSCA_PRODClick(Sender: TObject);
begin
   BUSCA_PROD;
end;

procedure TFMCADASTROS.BTN_NOVOPRODClick(Sender: TObject);
begin
   B_INSERE_PROD := TRUE;

   ChangeTabAction1.ExecuteTarget(self);
end;

procedure TFMCADASTROS.BUSCA_PROD;
var
  LItem: TListViewItem;
begin
  // Code to fill TListView
  ListViewMultiDetail.BeginUpdate;
  try
    ListViewMultiDetail.Items.Clear;

    QRYPROD.Close;
    QRYPROD.SQL.Clear;
    QRYPROD.SQL.Add('SELECT * FROM PRODUTO');
    QRYPROD.SQL.Add('WHERE ID_GRUP = 1');
    if CB_TIPOPROD.ItemIndex = 1 then
       if EDT_BUSCAPROD.Text.Trim <> '' then
          QRYPROD.SQL.Add('AND ID = '+EDT_BUSCAPROD.Text+' ');

    if CB_TIPOPROD.ItemIndex = 0 then
       if EDT_BUSCAPROD.Text.Trim <> '' then
          QRYPROD.SQL.Add('AND DESC_PROD LIKE ''%'+EDT_BUSCAPROD.Text+'%'' ');
    QRYPROD.SQL.Add('ORDER BY DESC_PROD ');
    QRYPROD.Open;

    while NOT QRYPROD.Eof do
    begin
      LItem := ListViewMultiDetail.Items.Add;
      LItem.Text := QRYPRODID.AsString;
      // Update data managed by custom appearance
      LItem.Data[TMultiDetailAppearanceNames.Detail1] := QRYPRODID.AsString+' - '+QRYPRODDESC_PROD.AsString;
      LItem.Data[TMultiDetailAppearanceNames.Detail2] := 'Vlr. Atc.: '+FormatFloat('"R$ ",.00', QRYPRODVL_ATAC.AsFloat)+' Vlr. Varj.: '+FormatFloat('"R$ ",.00', QRYPRODVL_VARJ.AsFloat);
      LItem.Data[TMultiDetailAppearanceNames.Detail3] := 'Estoque: '+QRYPRODESTOQUE.AsString;

      QRYPROD.Next;
    end;
  finally
    ListViewMultiDetail.EndUpdate;
  end;
  QRYPROD.Close;
end;

procedure TFMCADASTROS.CalcContentBoundsProc(Sender: TObject;
  var ContentBounds: TRectF);
begin
  if FNeedOffset and (FKBBounds.Top > 0) then
  begin
    ContentBounds.Bottom := Max(ContentBounds.Bottom,
                                2 * ClientHeight - FKBBounds.Top);
  end;
end;

procedure TFMCADASTROS.CARREGA_PROD;
begin
   BUSCA_PROD;
end;

procedure TFMCADASTROS.CB_TIPOCLIENTE_VISUChange(Sender: TObject);
begin
   if CB_TIPOCLIENTE_VISU.ItemIndex = 0 then
      EDT_BUSCACLIVISU.KeyboardType := TVirtualKeyboardType(0)
   ELSE
      EDT_BUSCACLIVISU.KeyboardType := TVirtualKeyboardType(2);
end;

procedure TFMCADASTROS.CB_TIPOPRODChange(Sender: TObject);
begin
   if CB_TIPOPROD.ItemIndex = 0 then
      EDT_BUSCAPROD.KeyboardType := TVirtualKeyboardType(0)
   ELSE
      EDT_BUSCAPROD.KeyboardType := TVirtualKeyboardType(2);
end;

procedure TFMCADASTROS.CB_TPCLIChange(Sender: TObject);
begin
   if CB_TPCLI.ItemIndex = 0 then
      Label14.Text := 'CNPJ'
    ELSE
       Label14.Text := 'CPF';

    EDT_CNPJ_CPF.Text:='';
end;

procedure TFMCADASTROS.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var FService : IFMXVirtualKeyboardService;
begin
   if (Key = vkHardwareBack) then
   begin
      TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));
      if (FService <> nil) and (TVirtualKeyboardState.Visible  in FService.VirtualKeyBoardState) then
      begin
      // botao back pressionado se o teclado estiver aberto ele fecha se nao vai pra proxima verificação
      end
      else
         // Ignora o botão de voltarr e não faz nenhuma ação
         Key := 0;
   end;
end;

procedure TFMCADASTROS.FormVirtualKeyboardHidden(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
  FKBBounds.Create(0, 0, 0, 0);
  FNeedOffset := False;
  RestorePosition;
end;

procedure TFMCADASTROS.FormVirtualKeyboardShown(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
  FKBBounds := TRectF.Create(Bounds);
  FKBBounds.TopLeft := ScreenToClient(FKBBounds.TopLeft);
  FKBBounds.BottomRight := ScreenToClient(FKBBounds.BottomRight);
  UpdateKBBounds;
end;

function TFMCADASTROS.GetSelectedValue(AObject: TObject): TValue;
var
  LEditor: IBindListEditorCommon;
begin
  LEditor := GetBindEditor(AObject, IBindListEditorCommon) as IBindListEditorCommon;
  Result := LEditor.SelectedValue
end;

procedure TFMCADASTROS.LV_NOVOCLIItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
   S_EXCL_CLINOVO := '';

  { if QRYNOVOCLI.IsEmpty then
      ABORT; }
   if LV_NOVOCLI.Items.Count = 0 then
      ABORT;

   S_EXCL_CLINOVO := GetSelectedValue(LV_NOVOCLI).ToString;
end;

function TFMCADASTROS.MAX_ALPHA(EDIT: STRING; I_TAMANHO: INTEGER): STRING;
begin
   RESULT := Copy(EDIT,0,I_TAMANHO);
end;

procedure TFMCADASTROS.RestorePosition;
begin
  VertScrollBox1.ViewportPosition := PointF(VertScrollBox1.ViewportPosition.X, 0);
  MainLayout1.Align := TAlignLayout.alClient;
  VertScrollBox1.RealignContent;
end;

procedure TFMCADASTROS.SpeedButton12Click(Sender: TObject);
begin
   EDT_CNPJ_CPF.Text := '';
   EDT_RAZAO.Text := '';
   EDT_FANTASIA.Text := '';
   EDT_LOUG.Text := '';
   EDT_NUMERO.Text := '';
   EDT_COMPLEMENTO.Text := '';
   EDT_BAIRRO.Text := '';
   CB_UF.ItemIndex := 0;
   EDT_CIDADE.Text := '';
   EDT_CEP.Text := '';
   EDT_INCEST.Text := '';
   EDT_FONE.Text := '';
   EDT_CELULAR.Text := '';
   EDT_EMAIL.Text := '';

   ATUALIZA_CLINOVO;
   ChangeTabAction3.ExecuteTarget(self);

end;

procedure TFMCADASTROS.SpeedButton13Click(Sender: TObject);
VAR S_IDCLI_TEMP : STRING;
begin
  { if EDT_CNPJ_CPF.Text.Trim = '' then
   begin
      ShowMessage('CNPJ/CPF Deve ser informado');
      EDT_CNPJ_CPF.SetFocus;
      ABORT;
   end;

   if CB_UF.ItemIndex = 0 then
   BEGIN
      ShowMessage('UF Deve ser informada');
      CB_UF.SetFocus;
      ABORT;
   END;  }

  { if EDT_RAZAO.Text.Trim = '' then
   begin
      ShowMessage('Razão Social deve ser informada');
      EDT_RAZAO.SetFocus;
      ABORT;
   end;

   if EDT_FANTASIA.Text.Trim = '' then
   begin
      ShowMessage('Nome Fantasia deve ser informado');
      EDT_FANTASIA.SetFocus;
      ABORT;
   end;

   if EDT_LOUG.Text.Trim = '' then
   begin
      ShowMessage('Lougradura deve ser informada');
      EDT_LOUG.SetFocus;
      ABORT;
   end;

   if EDT_NUMERO.Text.Trim = '' then
   begin
      ShowMessage('Numero deve ser informado');
      EDT_NUMERO.SetFocus;
      ABORT;
   end;

   if EDT_BAIRRO.Text.Trim = '' then
   begin
      ShowMessage('Bairro deve ser informado');
      EDT_BAIRRO.SetFocus;
      ABORT;
   end;

   if EDT_UF.Text.Trim = '' then
   begin
      ShowMessage('UF deve ser informado');
      EDT_UF.SetFocus;
      ABORT;
   end;

   if EDT_CIDADE.Text.Trim = '' then
   begin
      ShowMessage('Cidade deve ser informada');
      EDT_CIDADE.SetFocus;
      ABORT;
   end;

   if EDT_CEP.Text.Trim = '' then
   begin
      ShowMessage('CEP deve ser informado');
      EDT_CEP.SetFocus;
      ABORT;
   end;

   if EDT_FONE.Text.Trim = '' then
   begin
      ShowMessage('Telefone deve ser informado');
      EDT_FONE.SetFocus;
      ABORT;
   end;}

 {  if EDT_CNPJ_CPF.Text.Trim<> '' then
   begin
      if CB_TPCLI.ItemIndex = 0 then
      BEGIN
         IF NOT  ValidaCNPJ(EDT_CNPJ_CPF.Text) THEN
         BEGIN
            ShowMessage('CNPJ invalido');
            EDT_CNPJ_CPF.SetFocus;
            ABORT;
         END;
      END ELSE
      BEGIN
         IF NOT  ValidaCPF(EDT_CNPJ_CPF.Text) THEN
         BEGIN
            ShowMessage('CPF invalido');
            EDT_CNPJ_CPF.SetFocus;
            ABORT;
         END;
      END;
   end;       }

   EDT_CNPJ_CPF.Text := MAX_ALPHA(EDT_CNPJ_CPF.Text,19);
   //verifica se ja esta cadastrado
   if NOT B_ALTERA_CLI then
   BEGIN
      QRYAUX_INT.Close;
      QRYAUX_INT.SQL.Clear;
      QRYAUX_INT.SQL.Add('SELECT * FROM CLIENTE              ');
      QRYAUX_INT.SQL.Add('WHERE CNPJ_CPF = '+QuotedStr(EDT_CNPJ_CPF.Text)+'  ');
      QRYAUX_INT.Open;
      if NOT QRYAUX_INT.IsEmpty then
      BEGIN
         ShowMessage('Cliente ja cadastrado');
         ABORT;
      END;
   END;

   //ARRUMA O EDIT COM TAMANHO MAXIMO
   EDT_RAZAO.Text := MAX_ALPHA(EDT_RAZAO.Text,35);
   EDT_FANTASIA.Text := MAX_ALPHA(EDT_FANTASIA.Text,35);
   EDT_LOUG.Text := MAX_ALPHA(EDT_LOUG.Text,45);
   EDT_NUMERO.Text := MAX_ALPHA(EDT_NUMERO.Text,20);
   EDT_COMPLEMENTO.Text := MAX_ALPHA(EDT_COMPLEMENTO.Text,45);
   EDT_BAIRRO.Text := MAX_ALPHA(EDT_BAIRRO.Text,40);
   EDT_CIDADE.Text := MAX_ALPHA(EDT_CIDADE.Text,40);
   EDT_CEP.Text := MAX_ALPHA(EDT_CEP.Text,16);
   EDT_INCEST.Text := MAX_ALPHA(EDT_INCEST.Text,20);
   EDT_FONE.Text := MAX_ALPHA(EDT_FONE.Text,16);
   EDT_CELULAR.Text := MAX_ALPHA(EDT_CELULAR.Text,16);
   EDT_EMAIL.Text := MAX_ALPHA(EDT_EMAIL.Text,50);
   ///////////////////////////////////
   TRY
      if B_ALTERA_CLI then
      BEGIN

         QRYAUX_INT.Close;
         QRYAUX_INT.SQL.Clear;
         QRYAUX_INT.SQL.Add('UPDATE CLIENTE                          ');
         QRYAUX_INT.SQL.Add('SET RAZAO = '+QuotedStr(UpperCase(EDT_RAZAO.Text))+',                        ');
         QRYAUX_INT.SQL.Add('    FANTASIA = '+QuotedStr(UpperCase(EDT_FANTASIA.Text))+',                     ');
         QRYAUX_INT.SQL.Add('    LOUGRAD = '+QuotedStr(UpperCase(EDT_LOUG.Text))+',                      ');
         QRYAUX_INT.SQL.Add('    NR = '+EDT_NUMERO.Text+',                           ');
         QRYAUX_INT.SQL.Add('    COMPLEMT = '+QuotedStr(UpperCase(EDT_COMPLEMENTO.Text))+',                    ');
         QRYAUX_INT.SQL.Add('    BAIRRO = '+QuotedStr(UpperCase(EDT_BAIRRO.Text))+',                      ');
         QRYAUX_INT.SQL.Add('    UF = '+QuotedStr(UpperCase(CB_UF.Selected.Text))+',                          ');
         QRYAUX_INT.SQL.Add('    CIDADE = '+QuotedStr(UpperCase(EDT_CIDADE.Text))+',                      ');
         QRYAUX_INT.SQL.Add('    CEP = '+QuotedStr(UpperCase(EDT_CEP.Text))+',                         ');
         QRYAUX_INT.SQL.Add('    INC_ESTADUAL = '+QuotedStr(UpperCase(EDT_INCEST.Text))+',                ');
         QRYAUX_INT.SQL.Add('    FONE = '+QuotedStr(UpperCase(EDT_FONE.Text))+',                       ');
         QRYAUX_INT.SQL.Add('    CELULAR = '+QuotedStr(UpperCase(EDT_CELULAR.Text))+',                    ');
         QRYAUX_INT.SQL.Add('    IMAIL ='+QuotedStr(EDT_EMAIL.Text)+',             ');
         QRYAUX_INT.SQL.Add('    FLAG_ALTER = ''S''  ,             ');
         QRYAUX_INT.SQL.Add('    ROTA ='+S_ROTA+'             ');
         QRYAUX_INT.SQL.Add('WHERE                       ');
         QRYAUX_INT.SQL.Add('      CNPJ_CPF = '+QuotedStr(UpperCase(EDT_CNPJ_CPF.Text))+'                    ');
         QRYAUX_INT.ExecSQL;

      END ELSE
      BEGIN

         S_IDCLI_TEMP := S_ID_USUA+FormatDateTime('DDmmSS',NOW);



         QRYAUX_INT.Close;
         QRYAUX_INT.SQL.Clear;
         QRYAUX_INT.SQL.Add('INSERT INTO CLIENTE(COD_EMPRESA,          ');
         QRYAUX_INT.SQL.Add('                    ID,                    ');
         QRYAUX_INT.SQL.Add('                    CNPJ_CPF,              ');
         QRYAUX_INT.SQL.Add('                    TIPO_CLIENTE,          ');
         QRYAUX_INT.SQL.Add('                    RAZAO,                 ');
         QRYAUX_INT.SQL.Add('                    FANTASIA,              ');
         QRYAUX_INT.SQL.Add('                    LOUGRAD,               ');
         QRYAUX_INT.SQL.Add('                    NR,                     ');
         QRYAUX_INT.SQL.Add('                    COMPLEMT,              ');
         QRYAUX_INT.SQL.Add('                    BAIRRO,                ');
         QRYAUX_INT.SQL.Add('                    UF,                    ');
         QRYAUX_INT.SQL.Add('                    CIDADE,                ');
         QRYAUX_INT.SQL.Add('                    CEP,                   ');
         QRYAUX_INT.SQL.Add('                    INC_ESTADUAL,          ');
         QRYAUX_INT.SQL.Add('                    FONE,                  ');
         QRYAUX_INT.SQL.Add('                    CELULAR,               ');
         QRYAUX_INT.SQL.Add('                    IMAIL,                 ');
         QRYAUX_INT.SQL.Add('                    DATA_CAD,              ');
         QRYAUX_INT.SQL.Add('                    FALG_NOVO              ');
         QRYAUX_INT.SQL.Add('                    )VALUES(               ');
         QRYAUX_INT.SQL.Add('                    1,                     ');
         QRYAUX_INT.SQL.Add('                    '+S_IDCLI_TEMP+',                  ');
         QRYAUX_INT.SQL.Add('                    '+QuotedStr(UpperCase(EDT_CNPJ_CPF.Text))+',                ');
         QRYAUX_INT.SQL.Add('                    '+QuotedStr(UpperCase(CB_TPCLI.Selected.Text))+',             ');
         QRYAUX_INT.SQL.Add('                    '+QuotedStr(UpperCase(EDT_RAZAO.Text))+',               ');
         QRYAUX_INT.SQL.Add('                    '+QuotedStr(UpperCase(EDT_FANTASIA.Text))+',            ');
         QRYAUX_INT.SQL.Add('                    '+QuotedStr(UpperCase(EDT_LOUG.Text))+',             ');
         if EDT_NUMERO.Text.Trim <> '' then
            QRYAUX_INT.SQL.Add('                    '+EDT_NUMERO.Text+',                   ')
         ELSE
            QRYAUX_INT.SQL.Add('                    ''0'',                   ');
         QRYAUX_INT.SQL.Add('                    '+QuotedStr(UpperCase(EDT_COMPLEMENTO.Text))+',         ');
         QRYAUX_INT.SQL.Add('                    '+QuotedStr(UpperCase(EDT_BAIRRO.Text))+',              ');
         QRYAUX_INT.SQL.Add('                    '+QuotedStr(UpperCase(CB_UF.Selected.Text))+',                  ');
         QRYAUX_INT.SQL.Add('                    '+QuotedStr(UpperCase(EDT_CIDADE.Text))+',              ');
         QRYAUX_INT.SQL.Add('                    '+QuotedStr(UpperCase(EDT_CEP.Text))+',                 ');
         QRYAUX_INT.SQL.Add('                    '+QuotedStr(UpperCase(EDT_INCEST.Text))+',             ');
         QRYAUX_INT.SQL.Add('                    '+QuotedStr(UpperCase(EDT_FONE.Text))+',                ');
         QRYAUX_INT.SQL.Add('                    '+QuotedStr(UpperCase(EDT_CELULAR.Text))+',             ');
         QRYAUX_INT.SQL.Add('                    '+QuotedStr(EDT_EMAIL.Text)+',               ');
         QRYAUX_INT.SQL.Add('                    '+QuotedStr(FormatDateTime('YYYY-MM-DD',NOW))+',          ');
         QRYAUX_INT.SQL.Add('                    ''S''   )              ');
         QRYAUX_INT.ExecSQL;

      END;

   EXCEPT
   ON E: EXCEPTION DO
   BEGIN
      IF E.MESSAGE <> 'Operation aborted' THEN
         ShowMessage(E.Message);
         ABORT;
      END;
   END;
   VertScrollBox2.ViewportPosition:=pointf(0,0);
   EDT_CNPJ_CPF.Text := '';
   EDT_RAZAO.Text := '';
   EDT_FANTASIA.Text := '';
   EDT_LOUG.Text := '';
   EDT_NUMERO.Text := '';
   EDT_COMPLEMENTO.Text := '';
   EDT_BAIRRO.Text := '';
   CB_UF.ItemIndex := 0;
   EDT_CIDADE.Text := '';
   EDT_CEP.Text := '';
   EDT_INCEST.Text := '';
   EDT_FONE.Text := '';
   EDT_CELULAR.Text := '';
   EDT_EMAIL.Text := '';
   if B_ALTERA_CLI then
      ShowMessage('Cliente atualizado')
   ELSE
      ShowMessage('Cliente Cadastrado');
end;

procedure TFMCADASTROS.SpeedButton14Click(Sender: TObject);
begin
   EDT_CNPJ_CPF.Text := '';
   EDT_RAZAO.Text := '';
   EDT_FANTASIA.Text := '';
   EDT_LOUG.Text := '';
   EDT_NUMERO.Text := '';
   EDT_COMPLEMENTO.Text := '';
   EDT_BAIRRO.Text := '';
   CB_UF.ItemIndex :=0;
   EDT_CIDADE.Text := '';
   EDT_CEP.Text := '';
   EDT_INCEST.Text := '';
   EDT_FONE.Text := '';
   EDT_CELULAR.Text := '';
   EDT_EMAIL.Text := '';
   QRYNOVOCLI.Close;
   LV_NOVOCLI.Items.Clear;
   Form1.ChangeTabAction2.ExecuteTarget(self);
   CLOSE;
end;

procedure TFMCADASTROS.SpeedButton15Click(Sender: TObject);
begin
   ATUALIZA_CLINOVO;
end;

procedure TFMCADASTROS.SpeedButton22Click(Sender: TObject);
begin
   EDT_DESPROD.Text :='';
   EDT_UNPROD.Text :='';
   EDT_VLRPRODV.Text :='';
   EDT_VLRPRODA.Text :='';
   EDT_GRUP_PROD.TEXT :='';
   S_PROD := '';

   ChangeTabAction2.ExecuteTarget(self);
end;

procedure TFMCADASTROS.SpeedButton23Click(Sender: TObject);
VAR S_NOVAID_PROD : STRING;
begin
   if EDT_DESPROD.Text.Trim = '' then
   BEGIN
      ShowMessage('Descrição deve ser informada');
      EDT_DESPROD.SetFocus;
      ABORT;
   END;

   if EDT_UNPROD.Text.Trim = '' then
   BEGIN
      ShowMessage('Un deve ser informada');
      EDT_UNPROD.SetFocus;
      ABORT;
   END;

   if EDT_VLRPRODV.Text.Trim = '' then
   BEGIN
      ShowMessage('Valor Varejo ser informado');
      EDT_VLRPRODV.SetFocus;
      ABORT;
   END;

   if EDT_VLRPRODA.Text.Trim = '' then
   BEGIN
      ShowMessage('Valor atacado ser informado');
      EDT_VLRPRODA.SetFocus;
      ABORT;
   END;

   EDT_DESPROD.Text := MAX_ALPHA(EDT_DESPROD.Text,30);
   EDT_UNPROD.Text := MAX_ALPHA(EDT_UNPROD.Text,2);

   //ALTERA A VIRGULA POR PONTO
   EDT_VLRPRODV.Text :=  TrocaVirgPPto(EDT_VLRPRODV.Text);
   EDT_VLRPRODA.Text :=  TrocaVirgPPto(EDT_VLRPRODA.Text);

   FormatSettings.DecimalSeparator := '.';
   if NOT B_INSERE_PROD then
   BEGIN
      QRYAUX_INT.Close;
      QRYAUX_INT.SQL.Clear;
      QRYAUX_INT.SQL.Add('UPDATE PRODUTO            ');
      QRYAUX_INT.SQL.Add('SET DESC_PROD = '+QuotedStr(UpperCase(EDT_DESPROD.Text))+',       ');
      QRYAUX_INT.SQL.Add('    UN = '+QuotedStr(UpperCase(EDT_UNPROD.Text))+',              ');
      QRYAUX_INT.SQL.Add('    ID_GRUP = '+EDT_GRUP_PROD.Text+' ,         ');
      QRYAUX_INT.SQL.Add('    VL_VARJ = '''+FloatToStr(StrToFloat(EDT_VLRPRODV.Text))+''',          ');
      QRYAUX_INT.SQL.Add('    VL_ATAC = '''+FloatToStr(StrToFloat(EDT_VLRPRODA.Text))+'''          ');
      QRYAUX_INT.SQL.Add('WHERE ID = '+S_PROD+'            ');
      QRYAUX_INT.ExecSQL;

      ShowMessage('Produto alterado');
   END ELSE
   BEGIN
      S_NOVAID_PROD := FormatDateTime('YYYYMMDDSS',now);

      QRYAUX_INT.Close;
      QRYAUX_INT.SQL.Clear;
      QRYAUX_INT.SQL.Add('INSERT INTO PRODUTO(ID,                      ');
      QRYAUX_INT.SQL.Add('                    DESC_PROD,               ');
      QRYAUX_INT.SQL.Add('                    UN,                      ');
      QRYAUX_INT.SQL.Add('                    ID_GRUP,                 ');
      QRYAUX_INT.SQL.Add('                    SIT,                     ');
      QRYAUX_INT.SQL.Add('                    VL_VARJ,                 ');
      QRYAUX_INT.SQL.Add('                    VL_ATAC,                 ');
      QRYAUX_INT.SQL.Add('                    FLAG_NOVO,                 ');
      QRYAUX_INT.SQL.Add('                    DATA_CAD                 ');
      QRYAUX_INT.SQL.Add('                    )VALUES(                 ');
      QRYAUX_INT.SQL.Add('                    '+S_NOVAID_PROD+',                     ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(UpperCase(EDT_DESPROD.Text))+',                  ');
      QRYAUX_INT.SQL.Add('                    '+QuotedStr(UpperCase(EDT_UNPROD.Text))+',                    ');
      QRYAUX_INT.SQL.Add('                    '+EDT_GRUP_PROD.Text+',                       ');
      QRYAUX_INT.SQL.Add('                    ''A'',                     ');
      QRYAUX_INT.SQL.Add('                    '''+FloatToStr(StrToFloat(EDT_VLRPRODV.Text))+''',                     ');
      QRYAUX_INT.SQL.Add('                    '''+FloatToStr(StrToFloat(EDT_VLRPRODA.Text))+''' ,                     ');
      QRYAUX_INT.SQL.Add('                    ''S'' ,                     ');
      QRYAUX_INT.SQL.Add('                    '''+FormatDateTime('YYYY-MM-DD',NOW)+'''  )          ');
      QRYAUX_INT.ExecSQL;

      ShowMessage('Produto cadastrado');
   END;
   FormatSettings.DecimalSeparator := ',';
   EDT_DESPROD.Text :='';
   EDT_UNPROD.Text :='';
   EDT_GRUP_PROD.Text :='';
   EDT_VLRPRODV.Text :='';
   EDT_VLRPRODA.Text :='';
end;

procedure TFMCADASTROS.SpeedButton6Click(Sender: TObject);
begin
   QRYPROD.Close;
   ListViewMultiDetail.Items.Clear;
   Form1.ChangeTabAction2.ExecuteTarget(self);
   CLOSE;
end;

function TFMCADASTROS.TrocaVirgPPto(Valor: string): String;
   var i:integer;
begin
    if Valor <>'' then begin
        for i := 0 to Length(Valor) do begin
            if Valor[i]=',' then Valor[i]:='.';

        end;
     end;
     Result := valor;
end;

procedure TFMCADASTROS.UpdateKBBounds;
var
  LFocused : TControl;
  LFocusRect: TRectF;
begin
  FNeedOffset := False;
  if Assigned(Focused) then
  begin
    LFocused := TControl(Focused.GetObject);
    LFocusRect := LFocused.AbsoluteRect;
    LFocusRect.Offset(VertScrollBox1.ViewportPosition);
    if (LFocusRect.IntersectsWith(TRectF.Create(FKBBounds))) and
       (LFocusRect.Bottom > FKBBounds.Top) then
    begin
      FNeedOffset := True;
      MainLayout1.Align := TAlignLayout.alHorizontal;
      VertScrollBox1.RealignContent;
      Application.ProcessMessages;
      VertScrollBox1.ViewportPosition :=
        PointF(VertScrollBox1.ViewportPosition.X,
               LFocusRect.Bottom - FKBBounds.Top);
    end;
  end;
  if not FNeedOffset then
    RestorePosition;
end;

function TFMCADASTROS.ValidaCNPJ(numCNPJ: string): boolean;
var
  cnpj: string;
  dg1, dg2: integer;
  x, total: integer;
  ret: boolean;
begin
ret:=False;
cnpj:='';
//Analisa os formatos
if Length(numCNPJ) = 18 then
	if (Copy(numCNPJ,3,1) + Copy(numCNPJ,7,1) + Copy(numCNPJ,11,1) + Copy(numCNPJ,16,1) = '../-') then
		begin
		cnpj:=Copy(numCNPJ,1,2) + Copy(numCNPJ,4,3) + Copy(numCNPJ,8,3) + Copy(numCNPJ,12,4) + Copy(numCNPJ,17,2);
		ret:=True;
		end;
if Length(numCNPJ) = 14 then
	begin
	cnpj:=numCNPJ;
	ret:=True;
	end;
//Verifica
if ret then
	begin
	try
		//1° digito
		total:=0;
		for x:=1 to 12 do
			begin
			if x < 5 then
				Inc(total, StrToInt(Copy(cnpj, x, 1)) * (6 - x))
			else
				Inc(total, StrToInt(Copy(cnpj, x, 1)) * (14 - x));
			end;
		dg1:=11 - (total mod 11);
		if dg1 > 9 then
			dg1:=0;
		//2° digito
		total:=0;
		for x:=1 to 13 do
			begin
			if x < 6 then
				Inc(total, StrToInt(Copy(cnpj, x, 1)) * (7 - x))
			else
				Inc(total, StrToInt(Copy(cnpj, x, 1)) * (15 - x));
			end;
		dg2:=11 - (total mod 11);
		if dg2 > 9 then
			dg2:=0;
		//Validação final
		if (dg1 = StrToInt(Copy(cnpj, 13, 1))) and (dg2 = StrToInt(Copy(cnpj, 14, 1))) then
			ret:=True
		else
			ret:=False;
	except
		ret:=False;
		end;
	//Inválidos
	case AnsiIndexStr(cnpj,['00000000000000','11111111111111','22222222222222','33333333333333','44444444444444',

						   '55555555555555','66666666666666','77777777777777','88888888888888','99999999999999']) of

		0..9:   ret:=False;

		end;
	end;
ValidaCNPJ:=ret;
end;

function TFMCADASTROS.ValidaCPF(numCPF: string): boolean;
var
	cpf: string;
	x, total, dg1, dg2: Integer;
	ret: boolean;
begin
ret:=True;
for x:=1 to Length(numCPF) do
	if not (numCPF[x] in ['0'..'9', '-', '.', ' ']) then
		ret:=False;
if ret then
	begin
	ret:=True;
	cpf:='';
	for x:=1 to Length(numCPF) do
		if numCPF[x] in ['0'..'9'] then
			cpf:=cpf + numCPF[x];
	if Length(cpf) <> 11 then
		ret:=False;
	if ret then
		begin
		//1° dígito
		total:=0;
		for x:=1 to 9 do
			total:=total + (StrToInt(cpf[x]) * x);
		dg1:=total mod 11;
		if dg1 = 10 then
			dg1:=0;
		//2° dígito
		total:=0;
		for x:=1 to 8 do
			total:=total + (StrToInt(cpf[x + 1]) * (x));
		total:=total + (dg1 * 9);
		dg2:=total mod 11;
		if dg2 = 10 then
			dg2:=0;
		//Validação final
		if dg1 = StrToInt(cpf[10]) then
			if dg2 = StrToInt(cpf[11]) then
				ret:=True;
		//Inválidos

		case AnsiIndexStr(cpf,['00000000000','11111111111','22222222222','33333333333','44444444444',

							   '55555555555','66666666666','77777777777','88888888888','99999999999']) of

			0..9:   ret:=False;

			end;

		end
	else
		begin
		//Se não informado deixa passar
		if cpf = '' then
			ret:=True;
		end;
	end;
ValidaCPF:=ret;
end;

end.
