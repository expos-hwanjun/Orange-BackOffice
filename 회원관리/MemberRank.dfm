inherited MemberRankForm: TMemberRankForm
  Left = 300
  Top = 120
  Caption = #54924#50896' '#46321#44553' '#51312#51221
  ClientHeight = 612
  ClientWidth = 964
  HelpFile = #54980#48169'/'#51116#44256#44288#47532'/'#49892#49324#51456#48708'.htm'
  ExplicitWidth = 980
  ExplicitHeight = 651
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 964
    ExplicitWidth = 964
    inherited ButtonToolBar: TAdvToolBar
      Left = 879
      ExplicitLeft = 879
    end
    inherited ConditionToolBar: TAdvToolBar
      Width = 529
      ExplicitWidth = 529
      inherited ConditionToolBarDateLabel: TcxLabel
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        AnchorX = 166
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        Caption = #49892#49324#45380#50900
        AnchorX = 298
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        ExplicitWidth = 75
        Width = 75
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 405
        ExplicitLeft = 405
      end
    end
  end
  object GridPanel: TGridPanel [1]
    Left = 0
    Top = 65
    Width = 964
    Height = 547
    Align = alClient
    ColumnCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        SizeStyle = ssAbsolute
        Value = 350.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 1
        Control = RankPanel
        Row = 1
      end>
    RowCollection = <
      item
        Value = 51.693402276845920000
      end
      item
        SizeStyle = ssAbsolute
        Value = 250.000000000000000000
      end
      item
        Value = 48.306597723154080000
      end>
    TabOrder = 1
    object RankPanel: TPanel
      Left = 307
      Top = 153
      Width = 350
      Height = 250
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      ParentColor = True
      TabOrder = 0
      DesignSize = (
        350
        250)
      object Label8: TLabel
        Left = 185
        Top = 84
        Width = 5
        Height = 17
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object CountLabel: TcxLabel
        Left = 98
        Top = 186
        Anchors = []
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taCenter
        Transparent = True
        Height = 24
        Width = 162
        AnchorX = 179
      end
      object LastChangeLabel: TcxLabel
        Left = 64
        Top = 216
        Anchors = []
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taCenter
        Transparent = True
        Height = 24
        Width = 241
        AnchorX = 185
      end
      object PriodLabel: TcxLabel
        Left = 34
        Top = 52
        AutoSize = False
        Caption = #44396#47588#44592#44036
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 27
        Width = 65
        AnchorX = 67
        AnchorY = 66
      end
      object BeginDateEdit: TcxDateEdit
        Left = 108
        Top = 52
        AutoSize = False
        ParentFont = False
        Properties.DisplayFormat = 'yyyy-mm-dd'
        Properties.EditFormat = 'yyyy-mm-dd'
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Properties.OnChange = ConditionToolBarFromDateEditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 3
        Height = 25
        Width = 90
      end
      object TermLabel: TcxLabel
        Left = 198
        Top = 52
        AutoSize = False
        Caption = '~'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 27
        Width = 18
        AnchorX = 207
        AnchorY = 66
      end
      object EndDateEdit: TcxDateEdit
        Left = 218
        Top = 52
        AutoSize = False
        ParentFont = False
        Properties.DisplayFormat = 'yyyy-mm-dd'
        Properties.EditFormat = 'yyyy-mm-dd'
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Properties.OnChange = ConditionToolBarToDateEditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 5
        Height = 25
        Width = 90
      end
      object RankchangeButton: TAdvGlowButton
        Left = 120
        Top = 116
        Width = 121
        Height = 37
        Caption = #54924#50896#44396#48516#48320#44221
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
        TabOrder = 6
        OnClick = RankchangeButtonClick
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
end
