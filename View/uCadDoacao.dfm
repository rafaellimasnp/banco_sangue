inherited fCadDoacao: TfCadDoacao
  Caption = 'Cadastro de Doa'#231#245'es'
  ClientHeight = 161
  ClientWidth = 611
  ExplicitWidth = 617
  ExplicitHeight = 190
  PixelsPerInch = 96
  TextHeight = 16
  object lbNome: TLabel [0]
    Left = 2
    Top = 18
    Width = 96
    Height = 16
    Caption = 'Nome do doador'
  end
  object lbDataNasc: TLabel [1]
    Left = 41
    Top = 55
    Width = 59
    Height = 16
    Caption = 'Data Nasc'
    Enabled = False
  end
  object lbTipoSang: TLabel [2]
    Left = 244
    Top = 48
    Width = 88
    Height = 16
    Caption = 'Tipo Sangu'#237'neo'
    Enabled = False
  end
  object Label2: TLabel [3]
    Left = 16
    Top = 87
    Width = 85
    Height = 16
    Caption = 'Data de Coleta'
  end
  object lbQuantidade: TLabel [4]
    Left = 6
    Top = 120
    Width = 94
    Height = 16
    Caption = 'Quantidade(ml):'
  end
  inherited Panel1: TPanel
    Left = 516
    Height = 161
    TabOrder = 4
    ExplicitLeft = 516
    ExplicitHeight = 161
  end
  object edNome: TEdit
    Left = 162
    Top = 15
    Width = 271
    Height = 24
    Enabled = False
    MaxLength = 100
    TabOrder = 0
  end
  object cbTipoSang: TComboBox
    Left = 339
    Top = 45
    Width = 82
    Height = 24
    Style = csDropDownList
    Enabled = False
    TabOrder = 5
    Items.Strings = (
      'A+'
      'A-'
      'B+'
      'B-'
      'O+'
      'O-')
  end
  object edDataNasc: TscDateEdit
    Left = 106
    Top = 50
    Width = 103
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
    Enabled = False
    MaxLength = 10
    TabOrder = 6
  end
  object edIDDoador: TEdit
    Left = 439
    Top = 15
    Width = 57
    Height = 24
    Color = clSilver
    MaxLength = 100
    TabOrder = 7
  end
  object edQuantidade: TscNumericEdit
    Left = 106
    Top = 117
    Width = 82
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
    Increment = 1.000000000000000000
    SupportUpDownKeys = False
    ValueType = scvtInteger
    DisplayType = scedtNumeric
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
    RightButton.Visible = False
    RightButton.ShowHint = False
    RightButton.ShowEllipses = False
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
    TabOrder = 3
  end
  object edDataColeta: TDateTimePicker
    Left = 106
    Top = 85
    Width = 143
    Height = 24
    Date = 44996.000000000000000000
    Time = 0.867335555558383900
    TabOrder = 1
  end
  object edHora: TDateTimePicker
    Left = 255
    Top = 85
    Width = 143
    Height = 24
    Date = 44996.000000000000000000
    Time = 0.867335555558383900
    Kind = dtkTime
    TabOrder = 2
  end
  object btnBuscar: TBitBtn
    Left = 102
    Top = 15
    Width = 54
    Height = 25
    Caption = 'Buscar'
    TabOrder = 8
    OnClick = btnBuscarClick
  end
end
