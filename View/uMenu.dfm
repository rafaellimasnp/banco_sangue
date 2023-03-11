object fMenu: TfMenu
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Banco de Sangue'
  ClientHeight = 483
  ClientWidth = 801
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu: TMainMenu
    Left = 456
    Top = 8
    object SIstema1: TMenuItem
      Caption = 'Sistema'
      object Sair1: TMenuItem
        Caption = '&Sair'
      end
    end
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Pessoa1: TMenuItem
        Caption = '&Pessoa'
        OnClick = Pessoa1Click
      end
    end
    object Processo1: TMenuItem
      Caption = 'Processo'
      object Doao1: TMenuItem
        Caption = '&Doa'#231#227'o'
      end
    end
    object Relatrio1: TMenuItem
      Caption = 'Relat'#243'rio'
      object Doao2: TMenuItem
        Caption = 'Relat'#243'rio de Doa'#231#245'es'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Configuraes1: TMenuItem
        Caption = '&Configura'#231#245'es'
      end
    end
  end
end
