inherited FrmRelBanco: TFrmRelBanco
  Caption = 'Relat'#243'rio de Bancos'
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited BtnVis: TButton
      OnClick = BtnVisClick
    end
    inherited BtnImp: TButton
      OnClick = BtnVisClick
    end
  end
end
