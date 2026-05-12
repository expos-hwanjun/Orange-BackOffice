object FavoriteForm: TFavoriteForm
  Left = 300
  Top = 120
  BorderStyle = bsDialog
  Caption = #51600#44200#52286#44592
  ClientHeight = 412
  ClientWidth = 439
  Color = 16768709
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object NameLabel: TLabel
    Left = 22
    Top = 24
    Width = 83
    Height = 17
    Caption = #51600#44200#52286#44592' '#51060#47492
  end
  object OKButton: TButton
    Left = 235
    Top = 368
    Width = 90
    Height = 30
    Caption = #54869#51064'(&K)'
    Default = True
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 330
    Top = 368
    Width = 90
    Height = 30
    Cancel = True
    Caption = #52712#49548'(&C)'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object NameEdit: TcxTextEdit
    Left = 115
    Top = 20
    Style.BorderStyle = ebsOffice11
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.BorderStyle = ebsOffice11
    StyleFocused.Color = 8454143
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 0
    Width = 190
  end
  object ImageListView: TListView
    Left = 20
    Top = 55
    Width = 400
    Height = 304
    Columns = <>
    LargeImages = ImageList
    TabOrder = 3
  end
  object ImageList: TImageList
    ColorDepth = cd32Bit
    Height = 24
    Width = 24
    Left = 380
    Top = 70
  end
end
