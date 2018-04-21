inherited FrmRelSecao: TFrmRelSecao
  Left = 554
  Top = 339
  Caption = 'Relat'#243'rio de Se'#231#227'o'
  ClientWidth = 339
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 339
    ExplicitWidth = 339
    inherited Rdg: TRadioGroup
      Width = 335
      ExplicitWidth = 335
    end
  end
  inherited Panel1: TPanel
    Width = 339
    ExplicitWidth = 339
    inherited BtnVis: TButton
      OnClick = BtnVisClick
    end
    inherited BtnImp: TButton
      OnClick = BtnVisClick
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 339
    ExplicitWidth = 339
  end
  object QRelSecao: TFDQuery
    Connection = DM.IBDatabase
    Transaction = DM.IBTransaction
    SQL.Strings = (
      
        'SELECT S.COD_SEC, S.NOME_SEC, G.COD_GRUPO, G.DESCRICAO NOME_GRUP' +
        'O,'
      'SUB.COD_SUBGRUPO, SUB.DESCRICAO NOME_SUBGRUPO'
      'FROM SECAO S'
      'LEFT JOIN SECAO_GRUPO G'
      'ON (S.COD_SEC = G.COD_SEC)'
      'LEFT JOIN SECAO_GRUPO_SUBGRUPO SUB'
      'ON (G.COD_SEC = SUB.COD_SEC AND G.COD_GRUPO = SUB.COD_GRUPO)')
    Left = 248
    Top = 8
  end
end
