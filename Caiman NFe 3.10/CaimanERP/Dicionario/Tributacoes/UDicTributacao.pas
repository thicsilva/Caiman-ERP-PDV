unit UDicTributacao;

interface
uses
  SysUtils, Classes, DB, Forms, menus, Dialogs, IniFiles, Controls, QRExport,
  RDprint, ACBrNFeDANFEClass, ACBrNFe, pcnConversao, MIDASLIB,
  ACBrNFeDANFEFR, ACBrBoleto, ACBrBoletoFCFR, ACBrBase, UDialog,
  Graphics, acAlphaImageList, Grids, ExtDlgs,
  rxCurrEdit, DateUtils, DBGrids, RzCmboBx, RzDBCmbo, DBCtrls, StdCtrls, Mask,
  ComCtrls, ExtCtrls, UNovoFormulario,
  ACBrSintegra, StrUtils, cxLookAndFeelPainters, cxGraphics, dxSkinsCore,
  dxSkinMetropolis, Vcl.ImgList, cxClasses, dxAlertWindow, Winapi.MMSystem,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinMetropolisDark, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt, FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.Phys.FB, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.IBBase, FireDAC.Phys.Intf, FireDAC.DApt.Intf, ACBrNFeDANFEFRDM,
  ACBrDFe, pcnConversaoNFe, System.IOUtils, AcbrUtil, IdSMTP, IdSSLOpenSSL,
  IdAttachmentFile, IdMessage, IdText, IdExplicitTLSClientServerBase, UDicLib,
  System.Generics.Collections;

type
   TTipoDecimal = ( tnTruc, tnArrendonda );
   TDicAligatorTrib = class( TObject )
       private
          FOpcoes: TStringList;
          FOpcoesRegime: TStringList;
       public
          TipoEmpresa: String;
          RegimeEmpresa: String;
          TipoDecimal: TTipoDecimal;
          procedure IniciaTributacao( Cod_emp: Integer );
          function GetCSOSN( CST: String ): string;
          constructor Create;
          destructor Destroy; override;
   end;

   var
      DicAligatorTrib: TDicAligatorTrib;

implementation

{ TDicAligatorTrib }

uses UDM;

constructor TDicAligatorTrib.Create;
begin
   inherited;
   FOpcoes := TStringList.Create;
   FOpcoesRegime := TStringList.Create;
   FOpcoes.Delimiter := ';';
   FOpcoes.StrictDelimiter := True;
   FOpcoesRegime.Delimiter := ';';
   FOpcoesRegime.StrictDelimiter := True;
   FOpcoes.Add(  '(A)-Tributacao Normal' );
   FOpcoes.Add(  '(F)-Emissor responsavel pela retenção do ICMS por ST' );
   FOpcoes.Add(  '(G)-Emissor substituído(Icms cobrado anteriormente )' );
   FOpcoes.Add(  '(H)-Importação' );
   FOpcoes.Add(  '(I)-Exportação' );
   FOpcoes.Add(  '(J)-Operações isentas' );
   FOpcoes.Add(  '(K)-Remessa para conserto' );
   FOpcoesRegime.Add( '(B)-Regime Normal' );
   FOpcoesRegime.Add( '(C)Simples Nacional ME' );
   FOpcoesRegime.Add( '(D)Simples Nacional EPP - ICMS sob faturamento' );
   FOpcoesRegime.Add( '(E)Simples Nacional EPP - valor ICMS Fixo' );
   FOpcoesRegime.Add( '(B*)- Simples Nacional excesso do sublimite da receita bruta' );
end;

destructor TDicAligatorTrib.Destroy;
begin
  FreeAndNil( FOpcoes );
  FreeAndNil( FOpcoesRegime );
  inherited;
end;


function TDicAligatorTrib.GetCSOSN(CST: String): string;
type
   Ar = array[ 0..10 ] of string;
var
   DicCST: TDictionary<String,Ar>;
   CstTemp: String;
const
   cCST: ar = ( '00','10', '20',
         '30', '40', '41', '50', '51', '60', '70', '90' );
   A_C:  Ar = ( '103','203', '103',
         '203', '400', '300', '400', '900', '500', '203', '103' );
   A_D:  Ar = ( '101','201', '101',
         '201', '400', '300', '400', '900', '500', '201', '101' );
   A_E:  Ar = ( '102','202', '102',
         '202', '400', '300', '400', '900', '500', '202', '102' );

   F_C:  Ar = ( '103','203', '103',
         '203', '400', '300', '400', '900', '500', '203', '203' );
   F_D:  Ar = ( '101','201', '101',
         '201', '400', '300', '400', '900', '500', '201', '201' );
   F_E:  Ar = ( '102','202', '102',
         '202', '400', '300', '400', '900', '500', '202', '202' );

   G_C:  Ar = ( '103','203', '103',
         '203', '400', '300', '400', '900', '500', '203', '103' );
   G_D:  Ar = ( '101','201', '101',
         '201', '400', '300', '400', '900', '500', '201', '101' );
   G_E:  Ar = ( '102','202', '102',
         '202', '400', '300', '400', '900', '500', '202', '102' );

   H_C:  Ar = ( '900','203', '900',
         '203', '400', '300', '400', '900', '500', '203', '900' );
   H_D:  Ar = ( '900','203', '900',
         '203', '400', '300', '400', '900', '500', '203', '900' );
   H_E:  Ar = ( '900','203', '900',
         '203', '400', '300', '400', '900', '500', '203', '900' );

   I_C:  Ar = ( '103','203', '103',
         '203', '400', '300', '400', '900', '500', '203', '103' );
   I_D:  Ar = ( '101','201', '101',
         '201', '400', '300', '400', '900', '500', '201', '101' );
   I_E:  Ar = ( '102','202', '102',
         '202', '400', '300', '400', '900', '500', '202', '102' );

   J_C:  Ar = ( '103','203', '103',
         '203', '400', '400', '400', '900', '500', '203', '103' );
   J_D:  Ar = ( '101','201', '101',
         '201', '400', '400', '400', '900', '500', '201', '101' );
   J_E:  Ar = ( '102','202', '102',
         '202', '400', '400', '400', '900', '500', '202', '102' );

begin
   DicCST := TDictionary<String,Ar>.Create();
   try
      DicCST.Add( 'AC', A_C );
      DicCST.Add( 'AD', A_D );
      DicCST.Add( 'AE', A_E );

      DicCST.Add( 'AB', cCST );

      DicCST.Add( 'FC', F_C );
      DicCST.Add( 'FD', F_D );
      DicCST.Add( 'FE', F_E );

      DicCST.Add( 'GC', G_C );
      DicCST.Add( 'GD', G_D );
      DicCST.Add( 'GE', G_E );

      DicCST.Add( 'HC', H_C );
      DicCST.Add( 'HD', H_D );
      DicCST.Add( 'HE', H_E );

      DicCST.Add( 'IC', I_C );
      DicCST.Add( 'ID', I_D );
      DicCST.Add( 'IE', I_E );

      DicCST.Add( 'JC', J_C );
      DicCST.Add( 'JD', J_D );
      DicCST.Add( 'JE', J_E );

      DicCST.Add( 'KC', J_C );
      DicCST.Add( 'KD', J_D );
      DicCST.Add( 'KE', J_E );

      CstTemp := CST;
      if Length( Trim( CstTemp ) ) > 2 then
         CstTemp := Copy( CST, 2, 2 );
      Result := DicCST.Items[ TipoEmpresa + RegimeEmpresa ][ IndexStr( CstTemp, cCST )];

   finally
      DicCST.Clear;
      FreeAndNil( DicCST );
   end;
end;

procedure TDicAligatorTrib.IniciaTributacao(Cod_emp: Integer);
begin
   TDicLib.DeleteParam(  Cod_emp, 'TRIBUTACAO EMPRESA', 'TRIB_EMPRESA_TIPO', DM.IBDatabase );
   TipoEmpresa := TDicLib.StrEntre(
     TDicLib.GetParam( Cod_emp, 'TRIBUTACAO EMPRESA', 'TRIB_EMPRESA_CLASSIFICACAO',
                      DM.IBDatabase, FOpcoes.Strings[0], FOpcoes.DelimitedText,
                       'TRIBUTAÇÃO APLICADA NA EMPRESA',
                       'COMBO',
                       'TIPO DA EMPRESA DEFINE APLICAÇÃO DE CALCULOS E TRIBUTAÇÕES' ).Valor,
                        '(', ')' );
   RegimeEmpresa := TDicLib.StrEntre( TDicLib.GetParam( Cod_emp, 'TRIBUTACAO EMPRESA', 'TRIB_EMPRESA_REGIME',
                      DM.IBDatabase, FOpcoesRegime.Strings[0], FOpcoesRegime.DelimitedText,
                       'REGIME TRIBUTARIO DA EMPRESA',
                       'COMBO',
                       'REGIME TRIBUTARIO DA EMPRESA DEFINE APLICAÇÃO DE CALCULOS E TRIBUTAÇÕES' ).Valor,
                        '(', ')' );
   TipoDecimal := TTipoDecimal( IndexStr(  TDicLib.GetParam( Cod_emp,
                      'TRIBUTACAO EMPRESA', 'TRIB_DECIMAL',
                      DM.IBDatabase, 'ARREDONDAMENTO', 'ARREDONDAMENTO;TRUNCAMENTO',
                       'TRIBUTAÇÃO APLICADA NA EMPRESA',
                       'COMBO',
                       'METODO USADO NAS CASAS DECIMAIS CALCULADAS' ).Valor,
                        [ 'ARREDONDAMENTO', 'TRUCAMENTO' ] ) );
end;

initialization
    DicAligatorTrib := TDicAligatorTrib.Create;

finalization
    DicAligatorTrib.Free;

end.



