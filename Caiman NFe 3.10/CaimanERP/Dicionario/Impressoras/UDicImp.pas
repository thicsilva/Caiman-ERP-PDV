unit UDicImp;

interface

uses
   Windows, Printers, WinSpool, Variants, System.Classes, frxClass, UDicLib,
   System.UITypes, System.SysUtils, System.StrUtils, frxDesgn;

type
   TkadoshiPrinterType = ( tkpNaoIdentificado, tkpMatrix, tkpLaser );
   TKadoshiPrinters = class( TObject )
       private
          FListaPrinters: TStringList;
          const
          FDesc: array[0..3] of string = (
          'DEFINE A IMPRESSORA PADRAO DO MODULO',
          'DEFINIR MODELO DE IMPRESSAO',
          'DEFINE SE MOSTRA JANELA DE SELECAO DE TIPO DE IMPRESSAO',
          'DEFINE SE RELATORIO E VISUALIZADO ANTES DA IMPRESSAO' );
          FTipos: array[0..3] of string = (
          'IMP',
          'COMBO',
          'CHECK',
          'CHECK' );
          FValores: array[0..3] of string = (
          'PADRAO',
          'AUTOMATICO',
          'SIM',
          'SIM' );
          FPossibilidades: array[0..3] of string = (
          '',
          'AUTOMATICO;A4;A4(M);BOBINA;BOBINA(M)',
          'SIM;NAO',
          'SIM;NAO' );
          function VerificaTeclas: Boolean;
       public
          property Impressoras: TStringList read FListaPrinters;
          function TypeOfName( Nome: String ): TkadoshiPrinterType;
          function PaperA4( Nome: String ): Boolean;
          procedure ImprimirRel( frx: TfrxReport; Modulo: string;
               Prefixo: String; Relatorio: string; Padrao: String; Gravar: Boolean );
          procedure Atualiza;
          constructor Create;
          destructor Destroy; override;
   end;

var
   KadoshiPrinters: TKadoshiPrinters;

implementation

{ TkadoshiPrinters }

uses UDicImpForm, UDM, UDialog, Func;

procedure TKadoshiPrinters.Atualiza;
var
  I: Integer;
begin
   Printer.Refresh;
   for I := 0 to Printer.Printers.Count -1 do
      FListaPrinters.Add( Printer.Printers.Strings[I] );
end;

constructor TkadoshiPrinters.Create;
begin
  FListaPrinters := TStringList.Create;
  Atualiza;
end;

destructor TkadoshiPrinters.Destroy;
begin
  FListaPrinters.Clear;
  FListaPrinters.Free;
  inherited;
end;


procedure TKadoshiPrinters.ImprimirRel(frx: TfrxReport; Modulo: string;
               Prefixo: String; Relatorio: string; Padrao: String; Gravar: Boolean  );
var
  Form: TfrmKadoshiSelPrinter;
          FSeleciona: Boolean;
          FVisualzia: Boolean;
  TipoTemp: String;
  Design: TfrxDesigner;
  Desenhar: Boolean;
  label
    Ini;
begin
  Form := TfrmKadoshiSelPrinter.Create(nil);
  try
    Desenhar := VerificaTeclas;
    Ini:
    with TDicLib.GetParam( iEmp, 'FATURAMENTO', Prefixo + '_IMPRESSAO_IMPRESSORA',
     DM.IBDatabase, FValores[0], FPossibilidades[0],
     Modulo, FTipos[0], FDesc[0] ) do
       begin
          Form.cbbImpressora.Items.Delimiter := ';';
          Form.cbbImpressora.Items.StrictDelimiter := True;
          Form.cbbImpressora.Items.DelimitedText := Possibilidades;
          Form.cbbImpressora.ItemIndex := Form.cbbImpressora.Items.IndexOf( Valor );
          if Form.cbbImpressora.ItemIndex < 0 then
             Form.cbbImpressora.ItemIndex := 0;
       end;
    with TDicLib.GetParam( iEmp, 'FATURAMENTO', Prefixo + '_IMPRESSAO_MODELO',
     DM.IBDatabase, FValores[1], FPossibilidades[1],
     Modulo, FTipos[1], FDesc[1] ) do
       begin
          Form.cbbModelo.Items.Delimiter := ';';
          Form.cbbModelo.Items.StrictDelimiter := True;
          Form.cbbModelo.Items.DelimitedText := Possibilidades;
          Form.cbbModelo.ItemIndex := Form.cbbModelo.Items.IndexOf( Valor );
          if Form.cbbModelo.ItemIndex < 0 then
             Form.cbbModelo.ItemIndex := 0;
       end;
    FSeleciona :=  TDicLib.GetParam( iEmp, 'FATURAMENTO', Prefixo + '_IMPRESSAO_SELECIONA_MODELO',
     DM.IBDatabase, FValores[2], FPossibilidades[2],
     Modulo, FTipos[2], FDesc[2] ).Valor = 'SIM';
    FVisualzia :=  TDicLib.GetParam( iEmp, 'FATURAMENTO', Prefixo + '_IMPRESSAO_VISUALIZAR',
     DM.IBDatabase, FValores[3], FPossibilidades[3],
     Modulo, FTipos[3], FDesc[3] ).Valor = 'SIM';
    if ( NOT FSeleciona ) and  ( not Desenhar ) then
       begin
          TipoTemp := Form.cbbModelo.Items.Strings[ Form.cbbModelo.ItemIndex ];
          if TipoTemp = 'AUTOMATICO' then
            begin
               TipoTemp := IfThen(
                 KadoshiPrinters.PaperA4( Form.cbbImpressora.Items.Strings[Form.cbbImpressora.ItemIndex] ),
                 'A4', 'BOBINA' ) +
                 IfThen( KadoshiPrinters.TypeOfName(
                  Form.cbbImpressora.Items.Strings[Form.cbbImpressora.ItemIndex] ) = tkpLaser,
                  '', '(M)' );
            end;
          if not TDicLib.GetRel( iEmp, 'FAT_VENDA',
             TipoTemp, frx, dm.IBDatabase ) then
             begin
                AlertaCad( 'Relatório ' + Relatorio + ' ' +
                  TipoTemp + ' Não Econtrado!'  );
                Exit;
             end;
          frx.PrintOptions.ShowDialog := False;
          frx.PrintOptions.Printer := Form.cbbImpressora.Items.Strings[Form.cbbImpressora.ItemIndex];
          if FVisualzia then
            begin
              frx.PrepareReport();
              frx.ShowReport();
            end
          else
             begin
               frx.PrepareReport();
               frx.Print;
             end;
          Exit;
       end;
    case Form.ShowModal of
        mrYes: begin
                    TipoTemp := Form.cbbModelo.Items.Strings[ Form.cbbModelo.ItemIndex ];
                    if TipoTemp = 'AUTOMATICO' then
                      begin
                         TipoTemp := IfThen(
                           KadoshiPrinters.PaperA4( Form.cbbImpressora.Items.Strings[Form.cbbImpressora.ItemIndex] ),
                           'A4', 'BOBINA' ) +
                           IfThen( KadoshiPrinters.TypeOfName(
                            Form.cbbImpressora.Items.Strings[Form.cbbImpressora.ItemIndex] ) = tkpLaser,
                            '', '(M)' );
                      end;
                    if not TDicLib.GetRel( iEmp, 'FAT_VENDA',
                       TipoTemp, frx, dm.IBDatabase ) then
                       begin
                          AlertaCad( 'Relatório ' + Relatorio + ' ' +
                            TipoTemp + ' Não Econtrado!'  );
                          Exit;
                       end;
                   frx.PrintOptions.ShowDialog := False;
                   frx.PrintOptions.Printer := Form.cbbImpressora.Items.Strings[Form.cbbImpressora.ItemIndex];
                   if Desenhar then
                      begin
                         Design := TfrxDesigner.Create( frx );
                         try
                            frx.DesignReport;
                         finally
                            Design.Free;
                         end;
                      end;
                   frx.PrepareReport();
                   frx.ShowReport();
                   if Desenhar and KDialog( 'Deseja salvar as alterações?', 'Salvar Relatório', tdtPergunta ) then
                      TDicLib.SetRel( iEmp, 'FAT_VENDA',
                       TipoTemp, frx, dm.IBDatabase );
                   if Desenhar then
                       goto Ini;
                   Exit;
               end;
        mrYesToAll: begin
                    TipoTemp := Form.cbbModelo.Items.Strings[ Form.cbbModelo.ItemIndex ];
                    if TipoTemp = 'AUTOMATICO' then
                      begin
                         TipoTemp := IfThen(
                           KadoshiPrinters.PaperA4( Form.cbbImpressora.Items.Strings[Form.cbbImpressora.ItemIndex] ),
                           'A4', 'BOBINA' ) +
                           IfThen( KadoshiPrinters.TypeOfName(
                            Form.cbbImpressora.Items.Strings[Form.cbbImpressora.ItemIndex] ) = tkpLaser,
                            '', '(M)' );
                      end;
                    if not TDicLib.GetRel( iEmp, 'FAT_VENDA',
                       TipoTemp, frx, dm.IBDatabase ) then
                       begin
                          AlertaCad( 'Relatório ' + Relatorio + ' ' +
                            TipoTemp + ' Não Econtrado!'  );
                          Exit;
                       end;
                   frx.PrintOptions.ShowDialog := False;
                   frx.PrintOptions.Printer := Form.cbbImpressora.Items.Strings[Form.cbbImpressora.ItemIndex];
                   frx.PrepareReport();
                   frx.Print;
               end;
    end;
  finally
    Form.Free;
  end;
end;

function TKadoshiPrinters.PaperA4(Nome: String): Boolean;
var
  DeviceMode: THandle;
  Device, Driver, Port: array [0..79] of Char;
  pDevice, pDriver, pPort: PChar;
  oPrinter: TPrinter;
begin
  oPrinter := TPrinter.Create;
  try
      Result:= True;
      pDevice := @Device;
      pDriver := @Driver;
      pPort   := @Port;

      Device  := #0;
      Driver  := #0;
      Port    := #0;
      oPrinter.PrinterIndex := Printer.Printers.IndexOf( Nome );
      oPrinter.GetPrinter(pDevice, pDriver, pPort, DeviceMode);
      Result := (GetDeviceCaps(oPrinter.Handle,HORZSIZE)<270);
  finally
      oPrinter.Free;
  end;
end;

function TKadoshiPrinters.TypeOfName(Nome: String): TkadoshiPrinterType;
var
  DeviceMode: THandle;
  Device, Driver, Port: array [0..79] of Char;
  pDevice, pDriver, pPort: PChar;
  oPrinter: TPrinter;
begin
  oPrinter := TPrinter.Create;
  try
      Result:= tkpNaoIdentificado;
      pDevice := @Device;
      pDriver := @Driver;
      pPort   := @Port;

      Device  := #0;
      Driver  := #0;
      Port    := #0;
      oPrinter.PrinterIndex := Printer.Printers.IndexOf( Nome );
      oPrinter.GetPrinter(pDevice, pDriver, pPort, DeviceMode);
      if (GetDeviceCaps(oPrinter.Handle,NUMCOLORS)<=16) and
         (DeviceCapabilities(pDevice, pPort,DC_TRUETYPE,nil,nil) = DCTT_BITMAP)
      then
          Result := tkpMatrix
      else
          Result := tkpLaser;
  finally
      oPrinter.Free;
  end;
end;

function TKadoshiPrinters.VerificaTeclas: Boolean;
begin
   Result := ( GetAsyncKeyState( VK_RSHIFT ) <> 0 )
   and ( GetAsyncKeyState( VK_RCONTROL ) <> 0 );
end;

initialization
     KadoshiPrinters := TKadoshiPrinters.Create;

finalization
     KadoshiPrinters.Free;

end.

