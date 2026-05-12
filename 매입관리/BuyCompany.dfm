inherited BuyCompanyForm: TBuyCompanyForm
  Tag = 1
  Left = 274
  Top = 77
  Caption = #47588#51077#52376' '#44288#47532
  ClientHeight = 837
  ClientWidth = 964
  HelpFile = #54980#48169'/'#44144#47000#52376#44288#47532'/'#44144#47000#52376#46321#47197'.html'
  ExplicitWidth = 980
  ExplicitHeight = 876
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 260
    Height = 638
    ExplicitLeft = 260
    ExplicitTop = 65
    ExplicitHeight = 653
  end
  object AdvSplitter: TAdvSplitter [1]
    Left = 0
    Top = 703
    Width = 964
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    AutoSnap = False
    MinSize = 50
    Appearance.BorderColor = clNone
    Appearance.BorderColorHot = clNone
    Appearance.Color = 14542308
    Appearance.ColorTo = 16768709
    Appearance.ColorHot = 15383705
    Appearance.ColorHotTo = 14922381
    GripStyle = sgFlatDots
    ExplicitLeft = -169
    ExplicitTop = 595
    ExplicitWidth = 1011
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 964
    ExplicitWidth = 964
    inherited ButtonToolBar: TAdvToolBar
      Left = 432
      ExplicitLeft = 432
    end
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
        Visible = True
        AnchorX = 298
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Properties.Items.Strings = (
          #51204#52404
          #47588#51077#52376
          #51076#45824#50629#51109
          #49688#49688#47308#50629#51109
          #50948#53441#50629#51109)
        Text = #51204#52404
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Visible = True
      end
    end
  end
  inherited GridPanel: TPanel
    Width = 260
    Height = 638
    ExplicitWidth = 260
    ExplicitHeight = 638
    inherited Grid: TcxGrid
      Width = 254
      Height = 632
      ExplicitWidth = 254
      ExplicitHeight = 632
      inherited GridTableView: TcxGridTableView
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0'#44148
            Kind = skCount
            Column = GridTableViewCompanyCode
          end>
        OptionsCustomize.ColumnFiltering = True
        OptionsView.Footer = True
        Styles.OnGetContentStyle = GridTableViewStylesGetContentStyle
        object GridTableViewCompanyCode: TcxGridColumn
          Tag = 98
          Caption = #47588#51077#52376#53076#46300
          DataBinding.FieldName = 'CD_TRDPL'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Width = 80
        end
        object GridTableViewCompanyName: TcxGridColumn
          Tag = 98
          Caption = #47588#51077#52376#51060#47492
          DataBinding.FieldName = 'NM_TRDPL'
          HeaderAlignmentHorz = taCenter
          Width = 150
        end
        object GridTableViewDsStatus: TcxGridColumn
          Tag = 99
          DataBinding.FieldName = 'DS_STATUS'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 266
    Width = 698
    Height = 638
    ExplicitLeft = 266
    ExplicitWidth = 698
    ExplicitHeight = 638
    object TopPanel: TPanel
      Left = 0
      Top = 0
      Width = 698
      Height = 100
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object TaxLabel: TLabel
        Left = 20
        Top = 73
        Width = 52
        Height = 17
        Caption = #49464#47924#44396#48516
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object CompanyCodeLabel: TLabel
        Left = 7
        Top = 13
        Width = 65
        Height = 17
        Caption = #47588#51077#52376#53076#46300
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object CompanyNameLabel: TLabel
        Left = 7
        Top = 43
        Width = 65
        Height = 17
        Caption = #47588#51077#52376#51060#47492
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object TaxComboBox: TcxComboBox
        Left = 80
        Top = 70
        Hint = 'DS_TAX'
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #47732#49464
          #44284#49464'('#54252#54632')'
          #44284#49464'('#48324#46020')')
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 2
        Text = #44284#49464'('#54252#54632')'
        Width = 120
      end
      object CompanyCodeEdit: TcxTextEdit
        Left = 80
        Top = 10
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.ImeMode = imDisable
        Properties.MaxLength = 6
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = EditPropertiesChange
        Properties.OnValidate = EditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 0
        Width = 70
      end
      object CompanyNameEdit: TcxTextEdit
        Left = 80
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
      object CompanyCodeCreateButton: TAdvGlowButton
        Left = 156
        Top = 10
        Width = 44
        Height = 25
        Caption = #49373#49457
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
        Rounded = False
        TabOrder = 3
        OnClick = CompanyCodeCreateButtonClick
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
    object ClientPanel: TPanel
      Left = 0
      Top = 100
      Width = 698
      Height = 208
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      TabStop = True
      object CEONameLabel: TLabel
        Left = 20
        Top = 32
        Width = 52
        Height = 17
        Caption = #45824#54364#51088#47749
        Transparent = True
      end
      object IDNoLabel: TLabel
        Left = 7
        Top = 3
        Width = 65
        Height = 17
        Caption = #49324#50629#51088#48264#54840
        Transparent = True
      end
      object JongmokLabel: TLabel
        Left = 370
        Top = 62
        Width = 54
        Height = 17
        Caption = #51333#12288'   '#47785
        Transparent = True
      end
      object UptaeLabel: TLabel
        Left = 370
        Top = 31
        Width = 54
        Height = 17
        Caption = #50629#12288'   '#53468
        Transparent = True
      end
      object TelNoLabel: TLabel
        Left = 20
        Top = 62
        Width = 52
        Height = 17
        Caption = #51204#54868#48264#54840
        Transparent = True
      end
      object FaxNoLabel: TLabel
        Left = 370
        Top = 91
        Width = 52
        Height = 17
        Caption = #54057#49828#48264#54840
        Transparent = True
      end
      object AddrLabel: TLabel
        Left = 20
        Top = 151
        Width = 52
        Height = 17
        Caption = #51452#12288#12288#49548
        Transparent = True
      end
      object ContactTelNoLabel: TLabel
        Left = 20
        Top = 91
        Width = 52
        Height = 17
        Caption = #55092#45824#51204#54868
        Transparent = True
      end
      object EMailLabel: TLabel
        Left = 21
        Top = 121
        Width = 47
        Height = 17
        Caption = 'E - Mail'
        Transparent = True
      end
      object ContactNameLabel: TLabel
        Left = 359
        Top = 122
        Width = 65
        Height = 17
        Caption = #50629#52404#45812#45817#51088
        Transparent = True
      end
      object OrderCreditAmtLabel: TLabel
        Left = 370
        Top = 3
        Width = 52
        Height = 17
        Caption = #48120#51648#44553#50529
        Transparent = True
      end
      object CEONameEdit: TcxTextEdit
        Left = 80
        Top = 29
        ParentFont = False
        Properties.ImeMode = imSHanguel
        Properties.MaxLength = 20
        Properties.OnChange = EditPropertiesChange
        Properties.OnValidate = EditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 1
        Width = 120
      end
      object IDNoEdit: TcxMaskEdit
        Left = 80
        Top = 0
        ParentFont = False
        Properties.ImeMode = imSAlpha
        Properties.EditMask = '999\-99\-99999;1;_'
        Properties.MaxLength = 0
        Properties.ValidateOnEnter = False
        Properties.OnChange = EditPropertiesChange
        Properties.OnValidate = EditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 0
        Text = '   -  -     '
        Width = 120
      end
      object JongmokEdit: TcxTextEdit
        Left = 430
        Top = 59
        ParentFont = False
        Properties.ImeMode = imSHanguel
        Properties.MaxLength = 30
        Properties.OnChange = EditPropertiesChange
        Properties.OnValidate = EditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 4
        Width = 120
      end
      object UptaeEdit: TcxTextEdit
        Left = 430
        Top = 29
        ParentFont = False
        Properties.ImeMode = imSHanguel
        Properties.MaxLength = 30
        Properties.OnChange = EditPropertiesChange
        Properties.OnValidate = EditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 2
        Width = 120
      end
      object TelNoEdit: TcxTextEdit
        Left = 80
        Top = 59
        ParentFont = False
        Properties.ImeMode = imSAlpha
        Properties.MaxLength = 13
        Properties.OnChange = EditPropertiesChange
        Properties.OnValidate = EditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 3
        Width = 120
      end
      object FaxNoEdit: TcxTextEdit
        Left = 430
        Top = 88
        ParentFont = False
        Properties.ImeMode = imSAlpha
        Properties.MaxLength = 13
        Properties.OnChange = EditPropertiesChange
        Properties.OnValidate = EditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 6
        Width = 120
      end
      object ZipCodeEdit: TcxButtonEdit
        Left = 80
        Top = 148
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ClickKey = 112
        Properties.ImeMode = imSAlpha
        Properties.MaxLength = 0
        Properties.OnButtonClick = ZipCodeEditPropertiesButtonClick
        Properties.OnChange = EditPropertiesChange
        Properties.OnValidate = EditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 9
        Width = 76
      end
      object Addr1Edit: TcxTextEdit
        Left = 158
        Top = 148
        TabStop = False
        ParentFont = False
        Properties.MaxLength = 80
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        StyleFocused.Color = 14737632
        TabOrder = 10
        Width = 392
      end
      object Addr2Edit: TcxTextEdit
        Left = 158
        Top = 177
        ParentFont = False
        Properties.ImeMode = imSHanguel
        Properties.MaxLength = 80
        Properties.OnChange = EditPropertiesChange
        Properties.OnValidate = EditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 11
        Width = 392
      end
      object MobileTelNoEdit: TcxTextEdit
        Left = 80
        Top = 88
        ParentFont = False
        Properties.ImeMode = imSAlpha
        Properties.MaxLength = 13
        Properties.OnChange = EditPropertiesChange
        Properties.OnValidate = EditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 5
        Width = 120
      end
      object EMailEdit: TcxTextEdit
        Left = 80
        Top = 118
        ParentFont = False
        Properties.ImeMode = imSAlpha
        Properties.MaxLength = 40
        Properties.OnChange = EditPropertiesChange
        Properties.OnValidate = EditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 7
        Width = 250
      end
      object ContactNameEdit: TcxTextEdit
        Left = 430
        Top = 117
        ParentFont = False
        Properties.ImeMode = imSHanguel
        Properties.MaxLength = 40
        Properties.OnChange = EditPropertiesChange
        Properties.OnValidate = EditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 8
        Width = 120
      end
      object OrderCreditAmtEdit: TcxCurrencyEdit
        Left = 430
        Top = 0
        TabStop = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '#,'
        Properties.ImeMode = imSAlpha
        Properties.ReadOnly = True
        Style.BorderColor = clWindowFrame
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        StyleFocused.Color = 14737632
        TabOrder = 12
        Width = 120
      end
    end
    object CornerPanel: TPanel
      Left = 0
      Top = 308
      Width = 698
      Height = 110
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
      object VanGroupBox: TcxGroupBox
        Left = 20
        Top = 0
        Caption = ' VAN '
        Style.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        TabOrder = 1
        Height = 106
        Width = 229
        object VanPasswordLabel: TLabel
          Left = 30
          Top = 77
          Width = 52
          Height = 17
          Alignment = taRightJustify
          Caption = #48708#48128#48264#54840
          Transparent = True
        end
        object VanSerialNoLabel: TLabel
          Left = 17
          Top = 46
          Width = 65
          Height = 17
          Alignment = taRightJustify
          Caption = #49884#47532#50620#48264#54840
          Transparent = True
        end
        object Label1: TLabel
          Left = 62
          Top = 18
          Width = 20
          Height = 17
          Caption = 'TID'
          Transparent = True
        end
        object VanPasswordEdit: TcxTextEdit
          Left = 100
          Top = 74
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 30
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 2
          Width = 114
        end
        object VanSerialNoEdit: TcxTextEdit
          Left = 100
          Top = 45
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 30
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 114
        end
        object VanTidEdit: TcxTextEdit
          Left = 100
          Top = 16
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 30
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 114
        end
      end
      object VanRateGroupBox: TcxGroupBox
        Left = 255
        Top = 0
        Caption = ' '#49688#49688#47308' '
        Style.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        TabOrder = 0
        Height = 106
        Width = 293
        object RentAddFeeCashRateLabel: TLabel
          Left = 38
          Top = 46
          Width = 26
          Height = 17
          Caption = #54788#44552
          Transparent = True
        end
        object RentAddFeeCardRateLabel: TLabel
          Left = 12
          Top = 75
          Width = 52
          Height = 17
          Caption = #49888#50857#52852#46300
          Transparent = True
        end
        object Label4: TLabel
          Left = 129
          Top = 48
          Width = 165
          Height = 17
          Caption = '% ('#49688#54364', '#49345#54408#44428', '#50808#49345', '#44228#51340')'
          Transparent = True
        end
        object Label5: TLabel
          Left = 128
          Top = 77
          Width = 11
          Height = 17
          Caption = '%'
          Transparent = True
        end
        object Label6: TLabel
          Left = 38
          Top = 18
          Width = 26
          Height = 17
          Caption = #44592#48376
          Transparent = True
        end
        object Label7: TLabel
          Left = 129
          Top = 19
          Width = 11
          Height = 17
          Caption = '%'
          Transparent = True
        end
        object Label8: TLabel
          Left = 150
          Top = 75
          Width = 65
          Height = 17
          Caption = #54788#44552#50689#49688#51613
          Transparent = True
        end
        object Label9: TLabel
          Left = 275
          Top = 77
          Width = 11
          Height = 17
          Caption = '%'
          Transparent = True
        end
        object CashRateEdit: TcxCurrencyEdit
          Left = 73
          Top = 43
          EditValue = 0.000000000000000000
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.AssignedValues.MinValue = True
          Properties.DecimalPlaces = 2
          Properties.DisplayFormat = '0.00'
          Properties.MaxValue = 100.000000000000000000
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.Color = clWindow
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 50
        end
        object CardRateEdit: TcxCurrencyEdit
          Left = 73
          Top = 72
          EditValue = 0.000000000000000000
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.AssignedValues.MinValue = True
          Properties.DecimalPlaces = 2
          Properties.DisplayFormat = '0.00'
          Properties.MaxValue = 100.000000000000000000
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.Color = clWindow
          Style.StyleController = EditStyleController
          TabOrder = 2
          Width = 50
        end
        object DefaultRateEdit: TcxCurrencyEdit
          Left = 73
          Top = 14
          EditValue = 0.000000000000000000
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.AssignedValues.MinValue = True
          Properties.DecimalPlaces = 2
          Properties.DisplayFormat = '0.00'
          Properties.MaxValue = 100.000000000000000000
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.Color = clWindow
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 50
        end
        object CashrcpRateEdit: TcxCurrencyEdit
          Left = 220
          Top = 72
          EditValue = 0.000000000000000000
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.AssignedValues.MinValue = True
          Properties.DecimalPlaces = 2
          Properties.DisplayFormat = '0.00'
          Properties.MaxValue = 100.000000000000000000
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.Color = clWindow
          Style.StyleController = EditStyleController
          TabOrder = 3
          Width = 50
        end
      end
    end
    object BottomPanel: TPanel
      Left = 0
      Top = 418
      Width = 698
      Height = 106
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object UseYNLabel: TLabel
        Left = 20
        Top = 58
        Width = 52
        Height = 17
        Caption = #49324#50857#50668#48512
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object RemarkLabel: TLabel
        Left = 20
        Top = 7
        Width = 52
        Height = 17
        Caption = #48708#12288#12288#44256
        Transparent = True
      end
      object UseYNComboBox: TcxComboBox
        Left = 80
        Top = 55
        Hint = 'DS_STATUS'
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #49324#50857
          #49324#50857' '#50504#54632)
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 1
        Text = #49324#50857
        Width = 120
      end
      object RemarkMemo: TcxMemo
        Left = 80
        Top = 4
        Hint = 'REMARK'
        ParentFont = False
        Properties.ImeMode = imSHanguel
        Properties.MaxLength = 100
        Properties.OnChange = EditPropertiesChange
        Properties.OnValidate = EditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 0
        Height = 45
        Width = 470
      end
    end
  end
  object BuyGrid: TcxGrid [6]
    AlignWithMargins = True
    Left = 3
    Top = 709
    Width = 958
    Height = 125
    Align = alBottom
    Anchors = []
    TabOrder = 5
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object SaleGridTableView: TcxGridTableView
      Tag = 99
      Navigator.Buttons.CustomButtons = <>
      FilterBox.CustomizeDialog = False
      FilterBox.Visible = fvNever
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'#44148
          Kind = skCount
          Column = SaleGridTableViewSaleDate
        end
        item
          Format = ',0'
          Kind = skSum
          Column = SaleGridTableViewSaleAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = SaleGridTableViewDCAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = SaleGridTableViewSavePoint
        end
        item
          Format = ',0'
          Kind = skSum
          Column = SaleGridTableViewUsePoint
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ShowEditButtons = gsebForFocusedRecord
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      object SaleGridTableViewSaleDate: TcxGridColumn
        Caption = #44396#47588#51068#51088
        DataBinding.FieldName = 'YMD_SALE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Width = 110
      end
      object SaleGridTableViewSaleType: TcxGridColumn
        Caption = #44396#48516
        DataBinding.FieldName = 'DS_SALE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 70
      end
      object SaleGridTableViewSaleAmt: TcxGridColumn
        Caption = #44396#47588#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Width = 100
      end
      object SaleGridTableViewDCAmt: TcxGridColumn
        Caption = #54624#51064#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'DC_TOT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Width = 88
      end
      object SaleGridTableViewSavePoint: TcxGridColumn
        Caption = #51201#47549#54252#51064#53944
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'PNT_OCCUR'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 92
      end
      object SaleGridTableViewUsePoint: TcxGridColumn
        Caption = #49324#50857#54252#51064#53944
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_POINT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 90
      end
      object SaleGridTableViewDsAcct: TcxGridColumn
        Caption = #44208#51228#44396#48516
        DataBinding.FieldName = 'DS_ACCT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 101
      end
      object SaleGridTableViewRcpNo: TcxGridColumn
        Caption = #50689#49688#51613
        DataBinding.FieldName = 'NO_RCP'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.EditMask = '00000000\-00\-0000;1;_'
        HeaderAlignmentHorz = taCenter
        Width = 120
      end
    end
    object BuyGridTableView: TcxGridTableView
      Tag = 99
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      OnCellDblClick = BuyGridTableViewCellDblClick
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0 '#44148
          Kind = skCount
          Column = BuyGridTableViewBuyDate
        end
        item
          Format = ',0'
          Kind = skSum
          Column = BuyGridTableViewColumn3
        end
        item
          Format = ',0'
          Kind = skSum
          Column = BuyGridTableViewColumn4
        end
        item
          Format = ',0'
          Kind = skSum
          Column = BuyGridTableViewColumn5
        end
        item
          Format = ',0'
          Kind = skSum
        end
        item
          Format = ',0'
          Kind = skSum
          Column = BuyGridTableViewColumn7
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      object BuyGridTableViewBuyDate: TcxGridColumn
        Caption = #47588#51077#51068#51088
        DataBinding.FieldName = 'YMD_BUY'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 122
      end
      object BuyGridTableViewBuyNo: TcxGridColumn
        Caption = #51204#54364#48264#54840
        DataBinding.FieldName = 'NO_BUY'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 71
      end
      object BuyGridTableViewColumn3: TcxGridColumn
        Caption = #44284#49464#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 108
      end
      object BuyGridTableViewColumn4: TcxGridColumn
        Caption = #48512#44032#49464#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TAX'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 98
      end
      object BuyGridTableViewColumn5: TcxGridColumn
        Caption = #47732#49464#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_DUTYFREE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 102
      end
      object BuyGridTableViewColumn7: TcxGridColumn
        Caption = #47588#51077#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_BUY'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 101
      end
    end
    object BuyGridLevel: TcxGridLevel
      GridView = BuyGridTableView
    end
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
