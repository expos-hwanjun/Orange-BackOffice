inherited KioskMenuMasterForm: TKioskMenuMasterForm
  Tag = 1
  Caption = #53412#50724#49828#53356' '#47700#45684#44288#47532
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    inherited ConditionToolBar: TAdvToolBar
      inherited ConditionToolBarDateLabel: TcxLabel
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        AnchorX = 166
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        AnchorX = 298
        AnchorY = 16
      end
    end
  end
  inherited MainPanel: TPanel
    inherited MenuPager: TcxPageControl
      inherited MainPager: TcxTabSheet
        inherited AdvScrollBox1: TAdvScrollBox
          inherited Panel2: TPanel
            inherited TopPanel: TPanel
              inherited HeadMenuStatus: TcxLabel
                AnchorX = 367
                AnchorY = 17
              end
            end
            inherited CenterPanel: TPanel
              inherited Label37: TLabel
                Visible = True
              end
              inherited Option6CheckBox: TcxCheckBox
                Left = 328
                Top = 281
                ExplicitLeft = 328
                ExplicitTop = 281
              end
              inherited Option7CheckBox: TcxCheckBox
                Visible = True
              end
              inherited Option10ComboBox: TcxComboBox
                Visible = True
              end
              inherited Option18CheckBox: TcxCheckBox
                Left = 307
                Top = 230
                Visible = True
                ExplicitLeft = 307
                ExplicitTop = 230
              end
            end
            inherited BottomPanel: TPanel
              Visible = False
            end
            inherited MenuClassTreeView: TcxTreeView
              Left = -35
              Top = 540
              ExplicitLeft = -35
              ExplicitTop = 540
            end
          end
        end
      end
      inherited PluPager: TcxTabSheet
        TabVisible = False
      end
      object ImagePage: TcxTabSheet
        Caption = #51060#48120#51648
        ImageIndex = 3
        object KioskImageSizeLabel: TLabel
          Left = 27
          Top = 283
          Width = 52
          Height = 17
          Caption = #51452#48169#52636#47141
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object KioskImageLoadButton: TAdvGlowButton
          Left = 20
          Top = 221
          Width = 85
          Height = 32
          Caption = #48520#47084#50724#44592
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          FocusType = ftHot
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          ParentFont = False
          RepeatPause = 10
          Rounded = False
          TabOrder = 0
          OnClick = KioskImageLoadButtonClick
          Appearance.BorderColor = 14727579
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15653832
          Appearance.ColorTo = 16178633
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = clNone
          Appearance.ColorDisabledTo = clNone
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 16245200
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = clNone
          Appearance.ColorMirrorDisabledTo = clNone
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
          Appearance.SystemFont = False
        end
        object KioskImageDeleteButton: TAdvGlowButton
          Left = 169
          Top = 221
          Width = 72
          Height = 32
          Caption = #49325#51228
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          FocusType = ftHot
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          ParentFont = False
          RepeatPause = 10
          Rounded = False
          TabOrder = 1
          OnClick = KioskImageDeleteButtonClick
          Appearance.BorderColor = 14727579
          Appearance.BorderColorHot = 10079963
          Appearance.BorderColorDown = 4548219
          Appearance.BorderColorChecked = 4548219
          Appearance.Color = 15653832
          Appearance.ColorTo = 16178633
          Appearance.ColorChecked = 11918331
          Appearance.ColorCheckedTo = 7915518
          Appearance.ColorDisabled = clNone
          Appearance.ColorDisabledTo = clNone
          Appearance.ColorDown = 7778289
          Appearance.ColorDownTo = 4296947
          Appearance.ColorHot = 15465983
          Appearance.ColorHotTo = 11332863
          Appearance.ColorMirror = 15586496
          Appearance.ColorMirrorTo = 16245200
          Appearance.ColorMirrorHot = 5888767
          Appearance.ColorMirrorHotTo = 10807807
          Appearance.ColorMirrorDown = 946929
          Appearance.ColorMirrorDownTo = 5021693
          Appearance.ColorMirrorChecked = 10480637
          Appearance.ColorMirrorCheckedTo = 5682430
          Appearance.ColorMirrorDisabled = clNone
          Appearance.ColorMirrorDisabledTo = clNone
          Appearance.GradientHot = ggVertical
          Appearance.GradientMirrorHot = ggVertical
          Appearance.GradientDown = ggVertical
          Appearance.GradientMirrorDown = ggVertical
          Appearance.GradientChecked = ggVertical
          Appearance.SystemFont = False
        end
        object ImagePanel: TAdvPanel
          Left = 21
          Top = 24
          Width = 220
          Height = 191
          Color = clWhite
          TabOrder = 2
          UseDockManager = True
          Version = '2.5.11.0'
          BorderColor = clBlack
          BorderWidth = 1
          Caption.Color = clHighlight
          Caption.ColorTo = clNone
          Caption.Font.Charset = HANGEUL_CHARSET
          Caption.Font.Color = clWindowText
          Caption.Font.Height = -13
          Caption.Font.Name = #47569#51008' '#44256#46357
          Caption.Font.Style = []
          Caption.Indent = 0
          DoubleBuffered = True
          StatusBar.Font.Charset = DEFAULT_CHARSET
          StatusBar.Font.Color = clWindowText
          StatusBar.Font.Height = -11
          StatusBar.Font.Name = 'Tahoma'
          StatusBar.Font.Style = []
          Text = ''
          TextVAlign = tvaBottom
          FullHeight = 200
          object MenuImage: TcxImage
            Left = -1
            Top = -1
            ParentShowHint = False
            Properties.Caption = 'No Image'
            Properties.FitMode = ifmStretch
            Properties.GraphicClassName = 'TdxPNGImage'
            ShowHint = True
            Style.BorderStyle = ebsNone
            TabOrder = 0
            Height = 132
            Width = 218
          end
        end
      end
    end
  end
  inherited DetailSearchPanel: TAdvPanel
    TabOrder = 4
    FullHeight = 244
    inherited ScrollBox1: TScrollBox
      inherited AdvGroupBox1: TAdvGroupBox
        inherited cxLabel2: TcxLabel
          AnchorX = 616
          AnchorY = 22
        end
      end
    end
  end
  inherited MenuInfoPanel: TAdvPanel
    Left = 458
    Top = 503
    ExplicitLeft = 458
    ExplicitTop = 503
    FullHeight = 310
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited PictureLoadDialog: TOpenPictureDialog
    Filter = 
      #44536#47548' '#54028#51068'(*.png;*.jpg)|*.png;*.jpg|'#44536#47548' '#54028#51068'(*.png)|*.png|'#44536#47548' '#54028#51068'(*.jpg)|*' +
      '.jpg'
  end
end
