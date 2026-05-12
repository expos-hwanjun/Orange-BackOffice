inherited CodeEventForm: TCodeEventForm
  Left = 300
  Top = 120
  Caption = #54665#49324' '#44288#47532
  ClientHeight = 602
  ClientWidth = 1030
  HelpFile = #54980#48169'/'#49345#54408#44288#47532'/'#54665#49324#44288#47532'.htm'
  ExplicitWidth = 1046
  ExplicitHeight = 641
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 240
    Height = 537
    AutoSnap = True
    ExplicitLeft = 240
    ExplicitTop = 64
    ExplicitHeight = 566
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1030
    ExplicitWidth = 1030
    inherited ButtonToolBar: TAdvToolBar
      Left = 428
      Width = 533
      ExplicitLeft = 428
      ExplicitWidth = 533
      inherited ButtonToolBarSeparator: TAdvToolBarSeparator
        Left = 360
        ExplicitLeft = 360
      end
      inherited ButtonToolBarCloseButton: TAdvGlowButton
        Left = 456
        ExplicitLeft = 456
      end
      inherited ButtonToolBarSaveButton: TAdvGlowButton
        Left = 274
        ExplicitLeft = 274
      end
      inherited ButtonToolBarDeleteButton: TAdvGlowButton
        Width = 90
        Caption = #54665#49324#51333#47308
        ExplicitWidth = 90
      end
      inherited ButtonToolBarCancelButton: TAdvGlowButton
        Left = 370
        ExplicitLeft = 370
      end
    end
    inherited ConditionToolBar: TAdvToolBar
      Width = 554
      ExplicitWidth = 554
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
      inherited ConditionToolBarComboBox: TcxComboBox
        Properties.Items.Strings = (
          #51204#52404' '#54665#49324
          #51652#54665' '#54665#49324
          #50696#51221' '#54665#49324
          #51333#47308' '#54665#49324)
        Text = #51204#52404' '#54665#49324
        Visible = True
        ExplicitWidth = 100
        Width = 100
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 430
        Hint = #54665#49324#51060#47492', '#54665#49324#53076#46300' '#46321'...'
        ParentShowHint = False
        ShowHint = True
        Visible = True
        ExplicitLeft = 430
      end
    end
  end
  inherited GridPanel: TPanel
    Width = 240
    Height = 537
    ExplicitWidth = 240
    ExplicitHeight = 537
    inherited Grid: TcxGrid
      Width = 234
      Height = 531
      OnEnter = GridEnter
      OnExit = GridExit
      ExplicitWidth = 234
      ExplicitHeight = 531
      inherited GridTableView: TcxGridTableView
        Tag = 99
        PopupMenu = GoodsCopyPopupMenu
        OnCustomDrawCell = nil
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0'#44148
            Kind = skCount
            Column = GridTableViewDCCode
          end>
        OptionsView.Footer = True
        Styles.OnGetContentStyle = GridTableViewStylesGetContentStyle
        object GridTableViewDCCode: TcxGridColumn
          Tag = 98
          Caption = #54665#49324#53076#46300
          DataBinding.FieldName = 'NO_SPC'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Width = 60
        end
        object GridTableViewDCName: TcxGridColumn
          Tag = 98
          Caption = #54665#49324#51060#47492
          DataBinding.FieldName = 'NM_SPC'
          HeaderAlignmentHorz = taCenter
          Width = 150
        end
        object GridTableViewUseYN: TcxGridColumn
          Tag = 99
          DataBinding.FieldName = 'YN_USE'
          PropertiesClassName = 'TcxLabelProperties'
          Visible = False
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 246
    Width = 784
    Height = 537
    ExplicitLeft = 246
    ExplicitWidth = 784
    ExplicitHeight = 537
    object DCGrid: TcxGrid
      Left = 0
      Top = 137
      Width = 784
      Height = 400
      Align = alClient
      TabOrder = 0
      TabStop = False
      OnEnter = GridEnter
      OnExit = GridExit
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      OnActiveTabChanged = DCGridActiveTabChanged
      object GoodsGridTableView: TcxGridTableView
        Tag = 99
        Navigator.Buttons.CustomButtons = <>
        FilterBox.Visible = fvNever
        ScrollbarAnnotations.CustomAnnotations = <>
        OnFocusedRecordChanged = GoodsGridTableViewFocusedRecordChanged
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0'#44148
            Kind = skCount
            Column = GoodsGridTableViewGoodsCode
          end
          item
            Format = '0.00%'
            Kind = skAverage
            Column = GoodsGridTableViewDCRate
          end
          item
            Format = '0.00%'
            Kind = skAverage
          end>
        DataController.Summary.SummaryGroups = <>
        DataController.OnAfterPost = GoodsGridTableViewDataControllerAfterPost
        DataController.OnBeforePost = GoodsGridTableViewDataControllerBeforePost
        NewItemRow.InfoText = #54624#51064#54624' '#47700#45684#51012' '#52628#44032#54616#47140#47732' '#51060#44275#51012' '#45572#47476#49901#49884#50724'.'
        NewItemRow.Visible = True
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsData.CancelOnExit = False
        OptionsView.NoDataToDisplayInfoText = '<'#46321#47197' '#49345#54408' '#50630#51020'>'
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 23
        Styles.ContentEven = StyleEven
        Styles.OnGetContentStyle = GoodsGridTableViewStylesGetContentStyle
        object GoodsGridTableViewGoodsCode: TcxGridColumn
          Tag = 98
          Caption = #47700#45684#53076#46300
          DataBinding.FieldName = 'CD_MENU'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ClickKey = 112
          Properties.OnButtonClick = GoodsGridTableViewGoodsCodePropertiesButtonClick
          Properties.OnChange = GoodsGridTableViewGoodsCodePropertiesChange
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Width = 110
        end
        object GoodsGridTableViewGoodsName: TcxGridColumn
          Tag = 98
          Caption = #47700#45684#51060#47492
          DataBinding.FieldName = 'NM_MENU'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Focusing = False
          Width = 230
        end
        object GoodsGridTableViewSalePrice: TcxGridColumn
          Tag = 98
          Caption = #51221#49345#54032#47588#44032
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'PR_SALE_M'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Properties.Nullable = False
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Focusing = False
          Width = 96
        end
        object GoodsGridTableViewDCSalePrice: TcxGridColumn
          Tag = 98
          Caption = #54665#49324#54032#47588#44032
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'PR_SALE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.AssignedValues.MinValue = True
          Properties.DisplayFormat = ',0'
          Properties.EditFormat = ',#'
          Properties.Nullable = False
          Properties.Nullstring = '0'
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnValidate = GoodsGridTableViewDCSalePricePropertiesValidate
          HeaderAlignmentHorz = taCenter
          Width = 93
        end
        object GoodsGridTableViewDCRate: TcxGridColumn
          Caption = #54624#51064#50984
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'DC_RATE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DecimalPlaces = 2
          Properties.DisplayFormat = '0.00%'
          Properties.MaxValue = 100.000000000000000000
          Properties.Nullable = False
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Width = 60
        end
        object GoodsGridTableViewUseYN: TcxGridColumn
          Caption = #49324#50857
          DataBinding.ValueType = 'Boolean'
          DataBinding.FieldName = 'YN_USE'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taCenter
          Properties.DisplayChecked = 'true'
          Properties.DisplayUnchecked = 'false'
          Properties.DisplayGrayed = 'false'
          Properties.NullStyle = nssInactive
          Properties.OnChange = GoodsGridTableViewUseYNPropertiesChange
          HeaderAlignmentHorz = taCenter
          Width = 52
        end
        object GoodsGridTableViewSeq: TcxGridColumn
          Tag = 99
          Caption = #54364#49884#49692#49436
          DataBinding.FieldName = 'SEQ'
          Visible = False
        end
        object GoodsGridTableViewRowState: TcxGridColumn
          Tag = 99
          DataBinding.FieldName = 'ROW_STATE'
          Visible = False
        end
      end
      object ReceiptGridTableView: TcxGridTableView
        Tag = 99
        Navigator.Buttons.CustomButtons = <>
        FilterBox.Visible = fvNever
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0 '#44148
            Kind = skCount
            Column = ReceiptGridTableViewReceiptNo
          end
          item
            Format = '0.00%'
            Kind = skAverage
          end>
        DataController.Summary.SummaryGroups = <>
        DataController.OnAfterPost = ClassGridTableViewDataControllerAfterPost
        NewItemRow.InfoText = #50689#49688#51613#48264#54840#47484' '#52628#44032#54616#47140#47732' '#51060#44275#51012' '#45572#47476#49901#49884#50724'.'
        NewItemRow.Visible = True
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsCustomize.ColumnFiltering = False
        OptionsView.NoDataToDisplayInfoText = '<'#46321#47197' '#50689#49688#51613' '#50630#51020'>'
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object ReceiptGridTableViewReceiptNo: TcxGridColumn
          Tag = 98
          Caption = #50689#49688#51613#48264#54840
          DataBinding.FieldName = 'CD_MENU'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 4
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Options.Sorting = False
          Width = 104
        end
      end
      object GoodsGridLevel: TcxGridLevel
        Caption = #49345#54408
        GridView = GoodsGridTableView
      end
      object ReceiptGridLevel: TcxGridLevel
        Caption = #48516#47448
        GridView = ReceiptGridTableView
      end
    end
    object DCPanel: TPanel
      Left = 0
      Top = 0
      Width = 784
      Height = 137
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object DCCodeLabel: TLabel
        Left = 7
        Top = 13
        Width = 52
        Height = 17
        Caption = #54665#49324#53076#46300
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
        Caption = #54665#49324#51060#47492
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object DCSaleDateLabel: TLabel
        Left = 7
        Top = 73
        Width = 52
        Height = 17
        Caption = #54665#49324#44592#44036
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object DCTimeLabel: TLabel
        Left = 7
        Top = 104
        Width = 52
        Height = 17
        Caption = #54665#49324#49884#44036
        Transparent = True
      end
      object DCCodeEdit: TcxCurrencyEdit
        Left = 67
        Top = 10
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.DisplayFormat = '0000'
        Properties.EditFormat = '0000'
        Properties.MaxLength = 5
        Properties.OnChange = EditPropertiesChange
        Properties.OnValidate = EditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 0
        Width = 60
      end
      object DCNameEdit: TcxTextEdit
        Left = 67
        Top = 40
        ParentFont = False
        Properties.ImeMode = imSHanguel
        Properties.MaxLength = 50
        Properties.OnChange = EditPropertiesChange
        Properties.OnValidate = EditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 1
        Width = 250
      end
      object DCSaleDateFromEdit: TcxDateEdit
        Left = 68
        Top = 70
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 2
        OnExit = EditExit
        Width = 110
      end
      object DCSaleDateToEdit: TcxDateEdit
        Left = 205
        Top = 70
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 3
        OnExit = EditExit
        Width = 110
      end
      object DCTimeFromEdit: TcxTimeEdit
        Left = 67
        Top = 100
        ParentFont = False
        Properties.TimeFormat = tfHourMin
        Properties.Use24HourFormat = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 4
        Width = 86
      end
      object DCTimeToEdit: TcxTimeEdit
        Left = 159
        Top = 101
        ParentFont = False
        Properties.TimeFormat = tfHourMin
        Properties.Use24HourFormat = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 5
        Width = 88
      end
      object DCWeeklyGroupBox: TcxGroupBox
        Left = 345
        Top = 37
        Caption = ' '#51201#50857#50836#51068' '
        ParentFont = False
        Style.StyleController = EditStyleController
        TabOrder = 6
        Height = 57
        Width = 335
        object DCWeeklyMonCheckBox: TcxCheckBox
          Left = 5
          Top = 23
          Caption = #50900
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 0
        end
        object DCWeeklyTueCheckBox: TcxCheckBox
          Left = 42
          Top = 23
          Caption = #54868
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
        end
        object DCWeeklyWedCheckBox: TcxCheckBox
          Left = 79
          Top = 23
          Caption = #49688
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 2
        end
        object DCWeeklyThuCheckBox: TcxCheckBox
          Left = 117
          Top = 23
          Caption = #47785
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 3
        end
        object DCWeeklyFriCheckBox: TcxCheckBox
          Left = 154
          Top = 23
          Caption = #44552
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 4
        end
        object DCWeeklySatCheckBox: TcxCheckBox
          Left = 191
          Top = 23
          Caption = #53664
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          Style.TextColor = clBlue
          TabOrder = 5
        end
        object DCWeeklySunCheckBox: TcxCheckBox
          Left = 229
          Top = 23
          Caption = #51068
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          Style.TextColor = clRed
          TabOrder = 6
        end
        object DCWeeklySelectAllButton: TButton
          Left = 268
          Top = 23
          Width = 60
          Height = 25
          Caption = #51204#52404
          TabOrder = 7
          OnClick = DCWeeklySelectAllButtonClick
        end
      end
      object DCStatusEdit: TcxTextEdit
        Left = 180
        Top = 10
        TabStop = False
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 7
        Width = 137
      end
      object DCCodeCreateButton: TButton
        Left = 129
        Top = 10
        Width = 45
        Height = 25
        Caption = #49373#49457
        Enabled = False
        TabOrder = 8
        TabStop = False
        OnClick = DCCodeCreateButtonClick
      end
      object DcAllTimeCheckBox: TcxCheckBox
        Left = 253
        Top = 101
        Caption = '24'#49884#44036
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 9
      end
      object GoodsBatchButton: TAdvGlowButton
        Left = 420
        Top = 100
        Width = 89
        Height = 28
        Caption = #47700#45684#51068#44292#46321#47197
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        DisabledPicture.Data = {
          89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
          0D00000006624B474400FF00FF00FFA0BDA7930000026449444154388DB5943D
          68144118869F6FF7B2974A30909080A60A9253B8E3D8B93256D621812B246802
          76A2752258A508686AB10F5888A4486ACB9323B23FC589E7612A252468131B7F
          58B8FD2C32BBACE7E544D0B71976BE9987F7FD6666E11F4B461555D509C3F02A
          306BA73E1A63BA2292FE15B0DD6E4F789EB70EAC01D303E51360C7F3BCED6AB5
          7AFA47601CC7D7D334DD0526812EB02F22EFADE32BC01250013E8B48D3F7FDD6
          B9400B7B097C57D5BBC698E722A2C535AA2A711CAFA8EA53605C446E14A139D0
          C6EC011EB0608C7933AC1D99A228AAAA6A0BF8E179DE7C16DFC91694CBE50D60
          D23AFB0DD66EB7278ADFBEEF7754F53E309524C97A36EFD8188EAAAE025D63CC
          F3618ECAE5F26618868F54354F658C7906F48035557572601445D7806955DD1B
          EC59A6344D05D888E378EFE0E0E002805DBB07CC04415001285987974404C771
          0E0182207828222B45A0AA4EDB71B1542ABD0EC370D918D353D54311C175DDCB
          C0DB339B8E93B91A79D10B4A543519D8A3B9C3344D8F4484344DE7001A8DC616
          B055240441F004B807BC181B1BBB53ABD5BEDAD87300FD7EFF28EFA131A60B9C
          88C872B1E94589481F78E0FBFECD0C660F6209386E341ADD1C68DFE60E5089E3
          7865183049924D63CCE3E2A18561780B980776B2F9DC4DA7D3B99824498FB3DB
          BFE0FB7E675413E338AEA569DA02BEB9AE3B5FAFD7BFE40E01AAD5EAA9883481
          71556D0541707B587C5575822058B5300F6866B05F1C668AA2684155778129CE
          2EEDBE88F46CB9A2AA8B36E627A0698C7955DC3FF4006CFCECF73533503E0676
          5CD7DD2E3A1B091C885711915900D7753FD4EBF577E7BDA6FFA29F74F9170538
          BE751D0000000049454E44AE426082}
        FocusType = ftHot
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        RepeatPause = 10
        Rounded = False
        TabOrder = 10
        OnClick = GoodsBatchButtonClick
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
      object GoodsSearchButton: TAdvGlowButton
        Left = 512
        Top = 100
        Width = 68
        Height = 28
        Caption = #47700#45684#52286#44592
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        DisabledPicture.Data = {
          89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
          0D00000006624B474400FF00FF00FFA0BDA7930000026449444154388DB5943D
          68144118869F6FF7B2974A30909080A60A9253B8E3D8B93256D621812B246802
          76A2752258A508686AB10F5888A4486ACB9323B23FC589E7612A252468131B7F
          58B8FD2C32BBACE7E544D0B71976BE9987F7FD6666E11F4B461555D509C3F02A
          306BA73E1A63BA2292FE15B0DD6E4F789EB70EAC01D303E51360C7F3BCED6AB5
          7AFA47601CC7D7D334DD0526812EB02F22EFADE32BC01250013E8B48D3F7FDD6
          B9400B7B097C57D5BBC698E722A2C535AA2A711CAFA8EA53605C446E14A139D0
          C6EC011EB0608C7933AC1D99A228AAAA6A0BF8E179DE7C16DFC91694CBE50D60
          D23AFB0DD66EB7278ADFBEEF7754F53E309524C97A36EFD8188EAAAE025D63CC
          F3618ECAE5F26618868F54354F658C7906F48035557572601445D7806955DD1B
          EC59A6344D05D888E378EFE0E0E002805DBB07CC04415001285987974404C771
          0E0182207828222B45A0AA4EDB71B1542ABD0EC370D918D353D54311C175DDCB
          C0DB339B8E93B91A79D10B4A543519D8A3B9C3344D8F4484344DE7001A8DC616
          B055240441F004B807BC181B1BBB53ABD5BEDAD87300FD7EFF28EFA131A60B9C
          88C872B1E94589481F78E0FBFECD0C660F6209386E341ADD1C68DFE60E5089E3
          7865183049924D63CCE3E2A18561780B980776B2F9DC4DA7D3B99824498FB3DB
          BFE0FB7E675413E338AEA569DA02BEB9AE3B5FAFD7BFE40E01AAD5EAA9883481
          71556D0541707B587C5575822058B5300F6866B05F1C668AA2684155778129CE
          2EEDBE88F46CB9A2AA8B36E627A0698C7955DC3FF4006CFCECF73533503E0676
          5CD7DD2E3A1B091C885711915900D7753FD4EBF577E7BDA6FFA29F74F9170538
          BE751D0000000049454E44AE426082}
        FocusType = ftHot
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        RepeatPause = 10
        Rounded = False
        TabOrder = 11
        OnClick = GoodsSearchButtonClick
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
      object GridDeleteButton: TAdvGlowButton
        Left = 583
        Top = 100
        Width = 91
        Height = 28
        Caption = #54665#49324#47700#45684#49325#51228
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
        TabOrder = 12
        OnClick = GridDeleteButtonClick
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
      object DcRateChangeButton: TAdvGlowButton
        Left = 332
        Top = 100
        Width = 85
        Height = 28
        Caption = #54624#51064#50984#48320#44221
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        DisabledPicture.Data = {
          89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
          0D00000006624B474400FF00FF00FFA0BDA7930000026449444154388DB5943D
          68144118869F6FF7B2974A30909080A60A9253B8E3D8B93256D621812B246802
          76A2752258A508686AB10F5888A4486ACB9323B23FC589E7612A252468131B7F
          58B8FD2C32BBACE7E544D0B71976BE9987F7FD6666E11F4B461555D509C3F02A
          306BA73E1A63BA2292FE15B0DD6E4F789EB70EAC01D303E51360C7F3BCED6AB5
          7AFA47601CC7D7D334DD0526812EB02F22EFADE32BC01250013E8B48D3F7FDD6
          B9400B7B097C57D5BBC698E722A2C535AA2A711CAFA8EA53605C446E14A139D0
          C6EC011EB0608C7933AC1D99A228AAAA6A0BF8E179DE7C16DFC91694CBE50D60
          D23AFB0DD66EB7278ADFBEEF7754F53E309524C97A36EFD8188EAAAE025D63CC
          F3618ECAE5F26618868F54354F658C7906F48035557572601445D7806955DD1B
          EC59A6344D05D888E378EFE0E0E002805DBB07CC04415001285987974404C771
          0E0182207828222B45A0AA4EDB71B1542ABD0EC370D918D353D54311C175DDCB
          C0DB339B8E93B91A79D10B4A543519D8A3B9C3344D8F4484344DE7001A8DC616
          B055240441F004B807BC181B1BBB53ABD5BEDAD87300FD7EFF28EFA131A60B9C
          88C872B1E94589481F78E0FBFECD0C660F6209386E341ADD1C68DFE60E5089E3
          7865183049924D63CCE3E2A18561780B980776B2F9DC4DA7D3B99824498FB3DB
          BFE0FB7E675413E338AEA569DA02BEB9AE3B5FAFD7BFE40E01AAD5EAA9883481
          71556D0541707B587C5575822058B5300F6866B05F1C668AA2684155778129CE
          2EEDBE88F46CB9A2AA8B36E627A0698C7955DC3FF4006CFCECF73533503E0676
          5CD7DD2E3A1B091C885711915900D7753FD4EBF577E7BDA6FFA29F74F9170538
          BE751D0000000049454E44AE426082}
        FocusType = ftHot
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        ParentFont = False
        RepeatPause = 10
        Rounded = False
        TabOrder = 13
        OnClick = DcRateChangeButtonClick
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
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 21
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  object GoodsCopyPopupMenu: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = GoodsCopyPopupMenuPopup
    Left = 280
    Top = 34
    object CopyMenuItem: TMenuItem
      Caption = #54665#49324#49345#54408' '#48373#49324
      OnClick = CopyMenuItemClick
    end
    object PasteMenuItem: TMenuItem
      Caption = #54665#49324#49345#54408' '#48537#50668#45347#44592
      OnClick = PasteMenuItemClick
    end
  end
end
