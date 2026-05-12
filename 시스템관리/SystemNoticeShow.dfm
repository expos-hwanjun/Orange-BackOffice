object SystemNoticeShowForm: TSystemNoticeShowForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #44277#51648#49324#54637
  ClientHeight = 924
  ClientWidth = 997
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  DesignSize = (
    997
    924)
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 24
    Top = 112
    Width = 946
    Height = 1
    Anchors = [akLeft, akTop, akRight]
    Pen.Color = clGray
  end
  object Shape2: TShape
    Left = 24
    Top = 45
    Width = 946
    Height = 1
    Anchors = [akLeft, akTop, akRight]
    Pen.Color = clGray
    ExplicitWidth = 625
  end
  object cxLabel1: TcxLabel
    Left = 24
    Top = 16
    Caption = #51228'   '#47785
    ParentFont = False
    Style.BorderStyle = ebsNone
    Style.Font.Charset = HANGEUL_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = #47569#51008' '#44256#46357
    Style.Font.Style = [fsBold]
    Style.StyleController = EditStyleController
    Style.IsFontAssigned = True
  end
  object cxLabel2: TcxLabel
    Left = 24
    Top = 56
    Caption = #51089#49457#51088
    ParentFont = False
    Style.BorderStyle = ebsNone
    Style.Font.Charset = HANGEUL_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = #47569#51008' '#44256#46357
    Style.Font.Style = [fsBold]
    Style.StyleController = EditStyleController
    Style.IsFontAssigned = True
  end
  object cxLabel3: TcxLabel
    Left = 726
    Top = 55
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = #51089#49457#51068#51088
    ParentFont = False
    Style.BorderStyle = ebsNone
    Style.Font.Charset = HANGEUL_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = #47569#51008' '#44256#46357
    Style.Font.Style = [fsBold]
    Style.StyleController = EditStyleController
    Style.IsFontAssigned = True
    ExplicitLeft = 891
    Height = 21
    Width = 56
  end
  object cxLabel4: TcxLabel
    Left = 24
    Top = 272
    Caption = #45236#50857
    ParentFont = False
    Style.BorderStyle = ebsNone
    Style.Font.Charset = HANGEUL_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = #47569#51008' '#44256#46357
    Style.Font.Style = [fsBold]
    Style.StyleController = EditStyleController
    Style.IsFontAssigned = True
  end
  object TitleLabel: TcxLabel
    Left = 87
    Top = 16
    Caption = #53580#49828#53944' '#44277#51648#49324#54637
    ParentFont = False
    Style.BorderStyle = ebsNone
    Style.StyleController = EditStyleController
  end
  object UserNameLabel: TcxLabel
    Left = 84
    Top = 56
    Caption = #54861#44600#46041
    ParentFont = False
    Style.BorderStyle = ebsNone
    Style.StyleController = EditStyleController
  end
  object WriteDateLabel: TcxLabel
    Left = 788
    Top = 54
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = '2011'#45380' 11'#50900' 28'#51068' 10'#49884' 30'#48516
    ParentFont = False
    Style.BorderStyle = ebsNone
    Style.StyleController = EditStyleController
    ExplicitLeft = 953
    Height = 21
    Width = 182
  end
  object NoticesEdit: TAdvRichEditor
    Left = 84
    Top = 128
    Width = 887
    Height = 777
    Cursor = crIBeam
    HorzScrollBar.Tracking = True
    VertScrollBar.Range = 6
    VertScrollBar.Tracking = True
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ReadOnly = True
    TabOrder = 7
    TabStop = True
    URLOpen = uoClick
    ParentFont = False
    Version = '1.6.7.0'
  end
  object NoticeRangeLabel: TcxLabel
    Left = 726
    Top = 82
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = '2018.08.01. ~ 2021.09.31'
    ParentFont = False
    Style.BorderStyle = ebsNone
    Style.StyleController = EditStyleController
    Properties.Alignment.Horz = taCenter
    Height = 21
    Width = 244
    AnchorX = 848
  end
  object NoticeTargetLabel: TcxLabel
    Left = 84
    Top = 85
    ParentFont = False
    Style.BorderStyle = ebsNone
    Style.StyleController = EditStyleController
  end
  object EditStyleController: TcxEditStyleController
    Style.BorderStyle = ebsFlat
    Style.Color = clWindow
    Style.Font.Charset = HANGEUL_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = #47569#51008' '#44256#46357
    Style.Font.Style = []
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.NativeStyle = True
    Style.IsFontAssigned = True
    StyleDisabled.BorderColor = clWindowFrame
    StyleDisabled.Color = 14737632
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleDisabled.TextColor = clWindowText
    StyleFocused.BorderStyle = ebsFlat
    StyleFocused.Color = 8454143
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.BorderStyle = ebsFlat
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.NativeStyle = True
    Left = 133
    Top = 162
    PixelsPerInch = 96
  end
end
