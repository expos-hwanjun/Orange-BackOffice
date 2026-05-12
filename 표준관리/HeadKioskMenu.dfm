inherited HeadKioskMenuForm: THeadKioskMenuForm
  Tag = 1
  Caption = #53412#50724#49828#53356' '#47700#45684#44288#47532'('#54364#51456')'
  ClientHeight = 1007
  ClientWidth = 1149
  ExplicitWidth = 1165
  ExplicitHeight = 1046
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Height = 803
  end
  inherited AdvSplitter1: TAdvSplitter
    Top = 886
    Width = 1149
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1149
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
  inherited GridPanel: TPanel
    Height = 803
    inherited Grid: TcxGrid
      Height = 797
    end
  end
  inherited MainPanel: TPanel
    Width = 893
    Height = 803
    inherited MenuPager: TAdvOfficePager
      Width = 893
      Height = 803
      NextPictureChanged = False
      PrevPictureChanged = False
      inherited AdvOfficePager11: TAdvOfficePage
        Width = 891
        Height = 776
        ExplicitWidth = 891
        ExplicitHeight = 776
        inherited RightPanel: TPanel
          Width = 462
          Height = 772
          inherited StampGroupBox: TAdvGroupBox
            inherited StampSaveEdit: TcxSpinEdit
              ExplicitHeight = 25
            end
            inherited StampUseEdit: TcxSpinEdit
              ExplicitHeight = 25
            end
          end
        end
        inherited Panel2: TPanel
          Height = 772
          Color = 16768709
          inherited KitchenPanel: TPanel
            inherited KitchenComboBox: TcxComboBox
              ExplicitHeight = 25
            end
            inherited Option13ComboBox: TcxComboBox
              Visible = True
              ExplicitHeight = 25
            end
            inherited MemoGroupBox: TAdvGroupBox
              Top = 33
              Height = 96
              ExplicitTop = 33
              ExplicitHeight = 96
              inherited MemoCheckListBox: TcxCheckListBox
                Height = 67
                ExplicitHeight = 67
              end
            end
          end
          inherited TopPanel: TPanel
            inherited MenuNameEdit: TcxTextEdit
              ExplicitHeight = 25
            end
            inherited MenuShortNameEdit: TcxTextEdit
              ExplicitHeight = 25
            end
            inherited MenuCodeEdit: TcxTextEdit
              ExplicitHeight = 25
            end
            inherited MenuClassCodeEdit: TcxButtonEdit
              ExplicitHeight = 25
            end
            inherited MenuClassNameEdit: TcxTextEdit
              ExplicitHeight = 25
            end
            inherited InputRemainCheckBox: TcxCheckBox
              ExplicitWidth = 74
              ExplicitHeight = 25
            end
          end
          inherited CenterPanel: TPanel
            inherited PriceSaleEdit: TcxCurrencyEdit
              ExplicitHeight = 25
            end
            inherited MenuTypeComboBox: TcxComboBox
              ExplicitHeight = 25
            end
            inherited TaxComboBox: TcxComboBox
              ExplicitHeight = 25
            end
            inherited PriceProfitRateEdit: TcxCurrencyEdit
              ExplicitHeight = 25
            end
            inherited MenuNoEdit: TcxTextEdit
              ExplicitHeight = 25
            end
            inherited PriceTipEdit: TcxCurrencyEdit
              ExplicitHeight = 25
            end
            inherited PriceDoubleEdit: TcxCurrencyEdit
              ExplicitHeight = 25
            end
            inherited DisplaySeqEdit: TcxSpinEdit
              ExplicitHeight = 25
            end
            inherited GroupNoEdit: TcxSpinEdit
              ExplicitHeight = 25
            end
            inherited DcCheckBox: TcxCheckBox
              ExplicitWidth = 48
              ExplicitHeight = 25
            end
            inherited PointCheckBox: TcxCheckBox
              ExplicitWidth = 87
              ExplicitHeight = 25
            end
            inherited UseCheckBox: TcxCheckBox
              ExplicitWidth = 48
              ExplicitHeight = 25
            end
            inherited PrintCheckBox: TcxCheckBox
              ExplicitWidth = 87
              ExplicitHeight = 25
            end
            inherited MenuCountEdit: TcxSpinEdit
              ExplicitHeight = 25
            end
            inherited PriceBuyEdit: TcxCurrencyEdit
              ExplicitHeight = 25
            end
            inherited BillPrintCheckBox: TcxCheckBox
              ExplicitWidth = 113
              ExplicitHeight = 25
            end
            inherited PointLimitCheckBox: TcxCheckBox
              ExplicitWidth = 113
              ExplicitHeight = 25
            end
            inherited TableColorCheckBox: TcxCheckBox
              ExplicitWidth = 87
              ExplicitHeight = 25
            end
            inherited TicketCheckBox: TcxCheckBox
              ExplicitWidth = 48
              ExplicitHeight = 25
            end
            inherited SoldOutCheckBox: TcxCheckBox
              ExplicitWidth = 48
              ExplicitHeight = 25
            end
            inherited SalePriceFixCheckBox: TcxCheckBox
              ExplicitWidth = 100
              ExplicitHeight = 25
            end
            inherited PackingCheckBox: TcxCheckBox
              ExplicitWidth = 74
              ExplicitHeight = 25
            end
            inherited PricePackingEdit: TcxCurrencyEdit
              ExplicitHeight = 25
            end
            inherited Option4Edit: TcxSpinEdit
              ExplicitHeight = 25
            end
            inherited Option14Edit: TcxSpinEdit
              ExplicitHeight = 25
            end
            inherited Option12CheckBox: TcxCheckBox
              ExplicitWidth = 74
              ExplicitHeight = 25
            end
          end
          inherited BottomPanel: TPanel
            inherited StockGroupBox: TAdvGroupBox
              inherited StockTypeComboBox: TcxComboBox
                ExplicitHeight = 25
              end
              inherited UnitQtyEdit: TcxCurrencyEdit
                ExplicitHeight = 25
              end
            end
          end
        end
      end
      inherited LogPager: TAdvOfficePage
        Width = 891
        Height = 776
        ExplicitWidth = 891
        ExplicitHeight = 776
        inherited cxGrid1: TcxGrid
          Width = 881
          Height = 766
        end
      end
      inherited PadImagePage: TAdvOfficePage
        Width = 891
        Height = 776
        ExplicitWidth = 891
        ExplicitHeight = 776
      end
      object ImagePage: TAdvOfficePage
        Left = 1
        Top = 25
        Width = 891
        Height = 776
        Caption = ' '#51060#48120#51648' '
        DoubleBuffered = True
        PageAppearance.BorderColor = clNone
        PageAppearance.Color = 16768709
        PageAppearance.ColorTo = 16768709
        PageAppearance.ColorMirror = 16768709
        PageAppearance.ColorMirrorTo = 16768709
        PageAppearance.Gradient = ggVertical
        PageAppearance.GradientMirror = ggVertical
        Text = ''
        TabAppearance.BorderColor = clWhite
        TabAppearance.BorderColorHot = clNone
        TabAppearance.BorderColorSelected = clNone
        TabAppearance.BorderColorSelectedHot = clNone
        TabAppearance.BorderColorDisabled = clNone
        TabAppearance.BorderColorDown = clNone
        TabAppearance.Color = clWhite
        TabAppearance.ColorTo = clWhite
        TabAppearance.ColorSelected = clWhite
        TabAppearance.ColorSelectedTo = clWhite
        TabAppearance.ColorDisabled = 15658734
        TabAppearance.ColorDisabledTo = clNone
        TabAppearance.ColorHot = 16316922
        TabAppearance.ColorHotTo = 16316922
        TabAppearance.ColorMirror = clWhite
        TabAppearance.ColorMirrorTo = clWhite
        TabAppearance.ColorMirrorHot = 16316922
        TabAppearance.ColorMirrorHotTo = 16316922
        TabAppearance.ColorMirrorSelected = clWhite
        TabAppearance.ColorMirrorSelectedTo = clWhite
        TabAppearance.ColorMirrorDisabled = 15658734
        TabAppearance.ColorMirrorDisabledTo = clNone
        TabAppearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Font.Color = clWindowText
        TabAppearance.Font.Height = -11
        TabAppearance.Font.Name = 'Tahoma'
        TabAppearance.Font.Style = []
        TabAppearance.Gradient = ggVertical
        TabAppearance.GradientMirror = ggVertical
        TabAppearance.GradientHot = ggVertical
        TabAppearance.GradientMirrorHot = ggVertical
        TabAppearance.GradientSelected = ggVertical
        TabAppearance.GradientMirrorSelected = ggVertical
        TabAppearance.GradientDisabled = ggVertical
        TabAppearance.GradientMirrorDisabled = ggVertical
        TabAppearance.TextColor = 4474440
        TabAppearance.TextColorHot = 14916384
        TabAppearance.TextColorSelected = 4474440
        TabAppearance.TextColorDisabled = 7303023
        TabAppearance.ShadowColor = clNone
        TabAppearance.HighLightColor = clNone
        TabAppearance.HighLightColorHot = clNone
        TabAppearance.HighLightColorSelected = clNone
        TabAppearance.HighLightColorSelectedHot = clNone
        TabAppearance.HighLightColorDown = clNone
        TabAppearance.DrawLine = False
        TabAppearance.TextSelectedBold = True
        TabAppearance.BackGround.Color = 16773350
        TabAppearance.BackGround.ColorTo = 16773350
        TabAppearance.BackGround.Direction = gdHorizontal
        object KioskImageLoadButton: TAdvGlowButton
          Left = 28
          Top = 272
          Width = 98
          Height = 31
          Caption = #48520#47084#50724#44592
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          Rounded = True
          TabOrder = 0
          OnClick = KioskImageLoadButtonClick
          Appearance.ColorChecked = 16111818
          Appearance.ColorCheckedTo = 16367008
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 16111818
          Appearance.ColorDownTo = 16367008
          Appearance.ColorHot = 16117985
          Appearance.ColorHotTo = 16372402
          Appearance.ColorMirror = clSilver
          Appearance.ColorMirrorTo = clWhite
          Appearance.ColorMirrorHot = 16107693
          Appearance.ColorMirrorHotTo = 16775412
          Appearance.ColorMirrorDown = 16102556
          Appearance.ColorMirrorDownTo = 16768988
          Appearance.ColorMirrorChecked = 16102556
          Appearance.ColorMirrorCheckedTo = 16768988
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
        end
        object KioskImageDeleteButton: TAdvGlowButton
          Left = 171
          Top = 272
          Width = 98
          Height = 31
          Caption = #49325#51228
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          Rounded = True
          TabOrder = 1
          OnClick = KioskImageDeleteButtonClick
          Appearance.ColorChecked = 16111818
          Appearance.ColorCheckedTo = 16367008
          Appearance.ColorDisabled = 15921906
          Appearance.ColorDisabledTo = 15921906
          Appearance.ColorDown = 16111818
          Appearance.ColorDownTo = 16367008
          Appearance.ColorHot = 16117985
          Appearance.ColorHotTo = 16372402
          Appearance.ColorMirror = clSilver
          Appearance.ColorMirrorTo = clWhite
          Appearance.ColorMirrorHot = 16107693
          Appearance.ColorMirrorHotTo = 16775412
          Appearance.ColorMirrorDown = 16102556
          Appearance.ColorMirrorDownTo = 16768988
          Appearance.ColorMirrorChecked = 16102556
          Appearance.ColorMirrorCheckedTo = 16768988
          Appearance.ColorMirrorDisabled = 11974326
          Appearance.ColorMirrorDisabledTo = 15921906
        end
        object KioskImageSizeLabel: TcxLabel
          Left = 29
          Top = 311
          AutoSize = False
          Caption = #51060#48120#51648#53356#44592
          Properties.Alignment.Vert = taVCenter
          Transparent = True
          Height = 31
          Width = 233
          AnchorY = 327
        end
        object ImagePanel: TAdvPanel
          Left = 31
          Top = 18
          Width = 240
          Height = 243
          Color = clWhite
          TabOrder = 3
          UseDockManager = True
          Version = '2.5.11.0'
          BorderColor = 3750201
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
            Properties.FitMode = ifmStretch
            Properties.GraphicClassName = 'TdxPNGImage'
            Properties.PopupMenuLayout.MenuItems = []
            Style.BorderStyle = ebsNone
            TabOrder = 0
            Height = 186
            Width = 240
          end
        end
      end
    end
  end
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 25
  end
  inherited DetailSearchPanel: TAdvPanel
    Width = 1149
    TabOrder = 4
    FullHeight = 244
    inherited ScrollBox1: TScrollBox
      Width = 1149
      inherited AdvGroupBox1: TAdvGroupBox
        inherited ConditionGoodsClassCodeEdit: TcxButtonEdit
          ExplicitHeight = 25
        end
        inherited ConditionGoodsClassNameEdit: TcxTextEdit
          ExplicitHeight = 25
        end
        inherited cxLabel2: TcxLabel
          AnchorX = 616
          AnchorY = 22
        end
      end
      inherited ConditionVanComboBox: TcxComboBox
        ExplicitHeight = 25
      end
      inherited ConditionKitchenComboBox: TcxComboBox
        ExplicitHeight = 25
      end
      inherited ConditionCornerComboBox: TcxComboBox
        ExplicitHeight = 25
      end
    end
  end
  inherited Grid2: TcxGrid
    Top = 889
    Width = 1149
    inherited GridTableView2: TcxGridTableView
      inherited GridTableView2RowState: TcxGridColumn
        IsCaptionAssigned = True
      end
    end
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
