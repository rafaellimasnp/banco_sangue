inherited fCadPessoa: TfCadPessoa
  Caption = 'Cadastro de Pessoa'
  ClientHeight = 115
  ClientWidth = 506
  ExplicitWidth = 512
  ExplicitHeight = 144
  PixelsPerInch = 96
  TextHeight = 16
  object lbNome: TLabel [0]
    Left = 16
    Top = 18
    Width = 33
    Height = 16
    Caption = 'Nome'
  end
  object lbDataNasc: TLabel [1]
    Left = 16
    Top = 48
    Width = 57
    Height = 16
    Caption = 'Data Nasc'
  end
  object lbTipoSang: TLabel [2]
    Left = 16
    Top = 78
    Width = 89
    Height = 16
    Caption = 'Tipo Sangu'#237'neo'
  end
  inherited Panel1: TPanel
    Left = 411
    Height = 115
    TabOrder = 3
    ExplicitLeft = 411
    ExplicitHeight = 115
    DesignSize = (
      95
      115)
    inherited btnSair: TBitBtn
      TabOrder = 3
    end
    inherited StaticText1: TStaticText
      TabOrder = 0
    end
    inherited btnGravar: TBitBtn
      TabOrder = 2
    end
    inherited StaticText2: TStaticText
      TabOrder = 1
    end
  end
  object edNome: TEdit
    Left = 110
    Top = 15
    Width = 267
    Height = 24
    MaxLength = 100
    TabOrder = 0
  end
  object cbTipoSang: TComboBox
    Left = 110
    Top = 70
    Width = 267
    Height = 24
    Style = csDropDownList
    TabOrder = 2
    Items.Strings = (
      'A+'
      'A-'
      'B+'
      'B-'
      'O+'
      'O-')
  end
  object edDataNasc: TscDateEdit
    Left = 110
    Top = 42
    Width = 131
    Height = 24
    FluentUIOpaque = False
    UseFontColorToStyleColor = False
    ContentMarginLeft = 0
    ContentMarginRight = 0
    ContentMarginTop = 0
    ContentMarginBottom = 0
    CustomBackgroundImageNormalIndex = -1
    CustomBackgroundImageHotIndex = -1
    CustomBackgroundImageDisabledIndex = -1
    PromptTextColor = clNone
    HideMaskWithEmptyText = False
    HidePromptTextIfFocused = False
    WallpaperIndex = -1
    BlanksChar = ' '
    TodayDefault = False
    CalendarWidth = 200
    CalendarHeight = 150
    CalendarFont.Charset = DEFAULT_CHARSET
    CalendarFont.Color = clWindowText
    CalendarFont.Height = -11
    CalendarFont.Name = 'Tahoma'
    CalendarFont.Style = []
    CalendarBoldDays = False
    CalendarBackgroundStyle = sccasPanel
    CalendarWallpaperIndex = -1
    FirstDayOfWeek = Sun
    WeekNumbers = False
    ShowToday = False
    LeftButton.ComboButton = False
    LeftButton.Enabled = True
    LeftButton.Visible = False
    LeftButton.ShowHint = False
    LeftButton.ShowEllipses = False
    LeftButton.StyleKind = scbsPushButton
    LeftButton.Width = 18
    LeftButton.ImageIndex = -1
    LeftButton.ImageHotIndex = -1
    LeftButton.ImagePressedIndex = -1
    LeftButton.RepeatClick = False
    LeftButton.RepeatClickInterval = 200
    LeftButton.CustomImageNormalIndex = -1
    LeftButton.CustomImageHotIndex = -1
    LeftButton.CustomImagePressedIndex = -1
    LeftButton.CustomImageDisabledIndex = -1
    RightButton.ComboButton = False
    RightButton.Enabled = True
    RightButton.Visible = True
    RightButton.ShowHint = False
    RightButton.ShowEllipses = True
    RightButton.StyleKind = scbsPushButton
    RightButton.Width = 18
    RightButton.ImageIndex = -1
    RightButton.ImageHotIndex = -1
    RightButton.ImagePressedIndex = -1
    RightButton.RepeatClick = False
    RightButton.RepeatClickInterval = 200
    RightButton.CustomImageNormalIndex = -1
    RightButton.CustomImageHotIndex = -1
    RightButton.CustomImagePressedIndex = -1
    RightButton.CustomImageDisabledIndex = -1
    Transparent = False
    BorderKind = scebFrame
    FrameColor = clBtnShadow
    FrameActiveColor = clHighlight
    MaxLength = 10
    TabOrder = 1
  end
end
