inherited CodeAutoCouponForm: TCodeAutoCouponForm
  Caption = #53216#54256#51088#46041#48156#54665
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
  inherited GridPanel: TPanel
    inherited Grid: TcxGrid
      inherited GridTableView: TcxGridTableView
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0 '#44148
            Kind = skCount
            Column = GridTableViewName
          end>
        OptionsView.Footer = True
        object GridTableViewCode: TcxGridColumn
          Caption = #53076#46300
          DataBinding.FieldName = 'NO_EVENT'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 70
        end
        object GridTableViewName: TcxGridColumn
          Caption = #53076#46300#47749
          DataBinding.FieldName = 'NM_EVENT'
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 147
        end
        object GridTableViewStatus: TcxGridColumn
          Tag = 99
          DataBinding.FieldName = 'YN_USE'
          Visible = False
        end
      end
    end
  end
  inherited MainPanel: TPanel
    object SaleAmtLabel: TLabel
      Left = 7
      Top = 237
      Width = 52
      Height = 17
      Caption = #44396#47588#44552#50529
      Transparent = True
    end
    object DCTimeLabel: TLabel
      Left = 6
      Top = 104
      Width = 52
      Height = 17
      Caption = #54665#49324#49884#44036
      Transparent = True
    end
    object DCCodeLabel: TLabel
      Left = 7
      Top = 13
      Width = 51
      Height = 17
      Caption = #53076'     '#46300
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object DCNameLabel: TLabel
      Left = 7
      Top = 43
      Width = 52
      Height = 17
      Caption = #53076#46300#51060#47492
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label1: TLabel
      Left = 8
      Top = 271
      Width = 52
      Height = 17
      Caption = #48156#54665#53216#54256
      Transparent = True
    end
    object EventDateLabel: TcxLabel
      Left = 5
      Top = 71
      AutoSize = False
      Caption = #48156#54665#44592#44036
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Height = 21
      Width = 56
      AnchorX = 33
      AnchorY = 82
    end
    object EventFromDateEdit: TcxDateEdit
      Left = 67
      Top = 70
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.ImmediatePost = True
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 2
      Height = 25
      Width = 90
    end
    object cxLabel3: TcxLabel
      Left = 157
      Top = 70
      AutoSize = False
      Caption = '~'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Height = 27
      Width = 18
      AnchorX = 166
      AnchorY = 84
    end
    object EventToDateEdit: TcxDateEdit
      Left = 175
      Top = 70
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.ImmediatePost = True
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 3
      Height = 25
      Width = 90
    end
    object SaleFromAmtEdit: TcxCurrencyEdit
      Left = 65
      Top = 234
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0,'
      Properties.EditFormat = '#,'
      Properties.UseLeftAlignmentOnEditing = False
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 9
      Width = 90
    end
    object PointCheckBox: TcxCheckBox
      Left = 4
      Top = 301
      Caption = ' '#54252#51064#53944#51201#47549' '#47700#45684#47564' '#44396#47588#44552#50529#51004#47196' '#51064#51221#54633#45768#45796'.'
      ParentFont = False
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 11
    end
    object UseDateLabel: TcxLabel
      Left = 5
      Top = 335
      AutoSize = False
      Caption = #49324#50857#44592#44036
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Height = 21
      Width = 56
      AnchorX = 33
      AnchorY = 346
    end
    object UseFromDateEdit: TcxDateEdit
      Left = 67
      Top = 332
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.ImmediatePost = True
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 12
      Height = 25
      Width = 90
    end
    object cxLabel5: TcxLabel
      Left = 155
      Top = 334
      AutoSize = False
      Caption = '~'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Height = 27
      Width = 18
      AnchorX = 164
      AnchorY = 348
    end
    object UseToDateEdit: TcxDateEdit
      Left = 173
      Top = 332
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.ImmediatePost = True
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 13
      Height = 25
      Width = 90
    end
    object WeeklyGroupBox: TcxGroupBox
      Left = 3
      Top = 136
      Caption = ' '#48156#54665#50836#51068' '
      ParentFont = False
      Style.StyleController = EditStyleController
      TabOrder = 7
      Height = 57
      Width = 358
      object WeeklyMonCheckBox: TcxCheckBox
        Left = 5
        Top = 23
        Caption = #50900
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        State = cbsChecked
        Style.StyleController = EditStyleController
        TabOrder = 0
      end
      object WeeklyTueCheckBox: TcxCheckBox
        Left = 42
        Top = 23
        Caption = #54868
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        State = cbsChecked
        Style.StyleController = EditStyleController
        TabOrder = 1
      end
      object WeeklyWedCheckBox: TcxCheckBox
        Left = 79
        Top = 23
        Caption = #49688
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        State = cbsChecked
        Style.StyleController = EditStyleController
        TabOrder = 2
      end
      object WeeklyThuCheckBox: TcxCheckBox
        Left = 117
        Top = 23
        Caption = #47785
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        State = cbsChecked
        Style.StyleController = EditStyleController
        TabOrder = 3
      end
      object WeeklyFriCheckBox: TcxCheckBox
        Left = 152
        Top = 23
        Caption = #44552
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        State = cbsChecked
        Style.StyleController = EditStyleController
        TabOrder = 4
      end
      object WeeklySatCheckBox: TcxCheckBox
        Left = 191
        Top = 23
        Caption = #53664
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        State = cbsChecked
        Style.StyleController = EditStyleController
        Style.TextColor = clBlue
        TabOrder = 5
      end
      object WeeklySunCheckBox: TcxCheckBox
        Left = 229
        Top = 23
        Caption = #51068
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        State = cbsChecked
        Style.StyleController = EditStyleController
        Style.TextColor = clRed
        TabOrder = 6
      end
      object CouponWeeklySelectAllButton: TAdvGlowButton
        Left = 277
        Top = 22
        Width = 66
        Height = 25
        Caption = #51204#52404
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
        TabOrder = 7
        OnClick = CouponWeeklySelectAllButtonClick
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
    object TimeFromEdit: TcxTimeEdit
      Left = 67
      Top = 100
      ParentFont = False
      Properties.ImmediatePost = True
      Properties.TimeFormat = tfHourMin
      Properties.Use24HourFormat = False
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 4
      Width = 86
    end
    object TimeToEdit: TcxTimeEdit
      Left = 159
      Top = 101
      ParentFont = False
      Properties.ImmediatePost = True
      Properties.TimeFormat = tfHourMin
      Properties.Use24HourFormat = False
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 5
      Width = 88
    end
    object AllTimeCheckBox: TcxCheckBox
      Left = 253
      Top = 101
      Caption = '24'#49884#44036
      ParentFont = False
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 6
    end
    object EventCodeEdit: TcxCurrencyEdit
      Left = 67
      Top = 10
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.DisplayFormat = '00000'
      Properties.EditFormat = '00000'
      Properties.MaxLength = 5
      Properties.ReadOnly = True
      Style.StyleController = EditStyleController
      TabOrder = 0
      Width = 60
    end
    object EventNameEdit: TcxTextEdit
      Left = 67
      Top = 40
      ParentFont = False
      Properties.ImeMode = imSHanguel
      Properties.MaxLength = 50
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 1
      Width = 250
    end
    object cxLabel1: TcxLabel
      Left = 6
      Top = 365
      AutoSize = False
      Caption = #49324#50857#50668#48512
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Height = 21
      Width = 56
      AnchorX = 34
      AnchorY = 376
    end
    object UseComboBox: TcxComboBox
      Left = 67
      Top = 363
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #49324#50857
        #49324#50857' '#50504' '#54632)
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 14
      Text = #49324#50857
      Width = 89
    end
    object cxLabel6: TcxLabel
      Left = 155
      Top = 232
      AutoSize = False
      Caption = '~'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Visible = False
      Height = 27
      Width = 18
      AnchorX = 164
      AnchorY = 246
    end
    object SaleToAmtEdit: TcxCurrencyEdit
      Left = 173
      Top = 234
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0,'
      Properties.EditFormat = '#,'
      Properties.UseLeftAlignmentOnEditing = False
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 10
      Width = 90
    end
    object MemberCheckBox: TcxCheckBox
      Left = 6
      Top = 202
      Caption = ' '#54924#50896#47564' '#48156#54665#54633#45768#45796'.'
      ParentFont = False
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 8
    end
    object DcAmtEdit: TcxCurrencyEdit
      Left = 173
      Top = 268
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = '0,'
      Properties.EditFormat = '#,'
      Properties.UseLeftAlignmentOnEditing = False
      Properties.OnChange = EditPropertiesChange
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -13
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = []
      Style.StyleController = EditStyleController
      Style.IsFontAssigned = True
      TabOrder = 21
      Width = 90
    end
    object TypeComboBox: TcxComboBox
      Left = 65
      Top = 268
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #54788#44552#53216#54256
        #54624#51064#53216#54256)
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 22
      Text = #54788#44552#53216#54256
      Width = 90
    end
    object RatePercentLabel: TcxLabel
      Left = 266
      Top = 270
      AutoSize = False
      Caption = #50896
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -13
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Height = 21
      Width = 16
      AnchorX = 274
      AnchorY = 281
    end
  end
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 21
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
