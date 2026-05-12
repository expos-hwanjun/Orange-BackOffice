inherited CloseSaleUpdateForm: TCloseSaleUpdateForm
  Caption = #47588#52636#44081#49888
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
  object GridPanel: TGridPanel [1]
    Left = 0
    Top = 65
    Width = 943
    Height = 504
    Align = alClient
    ColumnCollection = <
      item
        Value = 50.000000000000040000
      end
      item
        SizeStyle = ssAbsolute
        Value = 500.000000000000000000
      end
      item
        Value = 49.999999999999960000
      end>
    ControlCollection = <
      item
        Column = 1
        Control = CalculatePanel
        Row = 1
      end>
    RowCollection = <
      item
        Value = 50.000000000000040000
      end
      item
        SizeStyle = ssAbsolute
        Value = 350.000000000000000000
      end
      item
        Value = 49.999999999999960000
      end>
    TabOrder = 2
    object CalculatePanel: TPanel
      Left = 222
      Top = 77
      Width = 500
      Height = 350
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      ParentColor = True
      TabOrder = 0
      object LastCloseMonthCaptionLabel: TLabel
        Left = 94
        Top = 39
        Width = 52
        Height = 17
        Caption = #44081#49888#44592#44036
        Transparent = True
      end
      object CloseMonthCaptionLabel: TLabel
        Left = 279
        Top = 39
        Width = 9
        Height = 17
        Caption = '~'
        Transparent = True
      end
      object FromDateEdit: TcxDateEdit
        Left = 166
        Top = 36
        AutoSize = False
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 0
        Height = 25
        Width = 98
      end
      object ToDateEdit: TcxDateEdit
        Left = 298
        Top = 36
        AutoSize = False
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 1
        Height = 25
        Width = 98
      end
      object UpdateCheckGroup: TcxCheckGroup
        Left = 166
        Top = 95
        Caption = ' '#44081#49888' '
        ParentFont = False
        Properties.Items = <
          item
            Caption = ' '#51060#51061#47456
          end
          item
            Caption = ' '#49884#44036#45824#47588#52636
          end>
        Style.StyleController = EditStyleController
        TabOrder = 2
        Height = 90
        Width = 203
      end
      object cxLabel1: TcxLabel
        Left = 24
        Top = 288
        Caption = #8251' '#54788#51116' '#49345#54408#47560#49828#53552#51032'  '#47588#51077#45800#44032' '#46608#45716' '#51060#51061#47456#51012' '#44592#51456#51004#47196' '#47588#52636#45936#51060#53552#51032' '
        Transparent = True
      end
      object cxLabel2: TcxLabel
        Left = 38
        Top = 312
        Caption = #51060#51061#44552#50529#51012' '#45796#49884' '#44228#49328#54633#45768#45796'.'
        Transparent = True
      end
      object SaleUpdateButton: TAdvGlowButton
        Left = 208
        Top = 220
        Width = 121
        Height = 37
        Caption = #47588#52636#44081#49888
        Font.Charset = HANGEUL_CHARSET
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
        Picture.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000006624B474400FF00FF00FFA0BDA7930000021C49444154388D8D93CD
          6B135114C5CF7B4DD2346926C9249D44622435DAD260880B8B685D8A2B0D4417
          D9585DB870698916FD17228AB80BB810B4E02AB45015BA10975D9414AC16249A
          0C98069CC9E7343171C632E3A29D36E6A3F56C1EEFDEF33BDCF7E012F4512C99
          99B2B2E69B2683C103008AB223488DF6EBE507E7BE767B49E7259E5A8F3023B6
          A4CFE3BAC0B9188692DDB6AA692855B6A5E2CFD26AA5AE3C4CCF85377A02E2A9
          CFD7035EF7D3F1E35CA0DF54BAF25B225F106A893777434BFB01F1D47A24E03D
          B67414AC2B5710F8EF3F4AD1C57B912F14006CE6D127FF035B8CBB67D0EF1977
          3BAD4900A0B1679929BFD73D7D147CE904C1D509BAFF661FE7988926D726E9A8
          D53C3BE662EC87C1337E82D32CC1475E85B657E35887DDE6B0CC529371C8A3FF
          360038CDBDF029966039ABA2D43AA8534A60321A3C146448D58B361370234411
          1A23FFC0EFBEA928B7D02342A86690FF28A2AA69A084A0A1001FF21A2E9F2408
          3A01766430ACAA1A645916E8AFEAEF8552655BD21B7C5DC34A4E83D34CF07E00
          0C006259AA37A4F60201803B2FB32BD3E1E0954E8381023B6A7F1800329BB9B7
          2F6E4F5CA3005097E4F9FC96C8771A0E837305215FADB41E01000580F45C78A3
          20D412B982C00FC60EE0A2504BA413673781AE658A3DFF74C66DB73CF6799D17
          39D661A7746F99540D6259AA17C5F26AB5DA9ED7E19E005DD1E4DA24E3B0DC1A
          1E367100A0C88AD06C365F2DDE3F9FEDF6FE057F69CBDF60A52AEC0000000049
          454E44AE426082}
        Rounded = True
        TabOrder = 5
        OnClick = SaleUpdateButtonClick
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
    end
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited AdvOfficeTabSetOfficeStyler: TAdvOfficeTabSetOfficeStyler
    Left = 264
    Top = 224
  end
end
