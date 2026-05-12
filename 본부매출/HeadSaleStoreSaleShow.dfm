inherited HeadSaleStoreSaleShowForm: THeadSaleStoreSaleShowForm
  Caption = #47588#51109#48324' '#47588#52636' '#51312#54924'('#48376#48512')'
  ClientWidth = 1142
  ExplicitWidth = 1158
  PixelsPerInch = 96
  TextHeight = 17
  object GridSplitter: TAdvSplitter [0]
    Left = 0
    Top = 385
    Width = 1142
    Height = 6
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
    ExplicitTop = 65
    ExplicitWidth = 326
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1142
    ExplicitWidth = 1142
    inherited ConditionToolBar: TAdvToolBar
      Width = 1087
      ExplicitWidth = 1087
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        Visible = True
      end
      inherited ConditionToolBarDateLabel: TcxLabel
        Visible = True
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarToDateEdit: TcxDateEdit
        Visible = True
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        Visible = True
        AnchorX = 166
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        Left = 649
        Caption = #51648#50669
        Visible = True
        ExplicitLeft = 649
        ExplicitWidth = 50
        Width = 50
        AnchorX = 674
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Left = 699
        Properties.DropDownListStyle = lsEditFixedList
        Visible = True
        ExplicitLeft = 699
        ExplicitWidth = 105
        Width = 105
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 963
        ExplicitLeft = 963
      end
      inherited ConditionToolbarMonthRadioButton: TcxRadioButton
        Visible = True
      end
      inherited ConditionToolbarTodayRadioButton: TcxRadioButton
        Visible = True
      end
      inherited ConditionToolbarWeekRadioButton: TcxRadioButton
        Visible = True
      end
      object SaleZoneComboBox: TcxComboBox
        Left = 854
        Top = 2
        AutoSize = False
        ParentFont = False
        Properties.DropDownListStyle = lsEditFixedList
        Properties.OnChange = ConditionToolBarEditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 10
        Height = 25
        Width = 109
      end
      object cxLabel1: TcxLabel
        Left = 804
        Top = 2
        AutoSize = False
        Caption = #49345#44428
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 27
        Width = 50
        AnchorX = 829
        AnchorY = 16
      end
      object cxLabel2: TcxLabel
        Left = 415
        Top = 2
        AutoSize = False
        Caption = #47588#51109
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Visible = False
        Height = 27
        Width = 50
        AnchorX = 440
        AnchorY = 16
      end
      object StoreComboBox: TcxComboBox
        Left = 465
        Top = 2
        AutoSize = False
        ParentFont = False
        Properties.DropDownListStyle = lsEditFixedList
        Properties.OnChange = StoreComboBoxPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 13
        Visible = False
        Height = 25
        Width = 184
      end
    end
  end
  inherited Grid: TcxGrid
    Width = 1136
    Height = 314
    LevelTabs.Style = 8
    RootLevelOptions.DetailTabsPosition = dtpTop
    OnActiveTabChanged = GridActiveTabChanged
    ExplicitWidth = 1136
    ExplicitHeight = 314
    inherited GridTableView: TcxGridTableView
      OnCellDblClick = GridTableViewCellDblClick
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewTotSaleAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewServiceAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewTipAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewSaleAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewTaxAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewSoonSaleAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewGuestCount
        end
        item
          Format = ',0'
          Kind = skAverage
          Column = GridTableViewGuestAverage
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewNetAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewDutyFreeAmt
        end
        item
          Format = ',0 '#44148
          Kind = skCount
          Column = GridTableViewStoreName
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewDcAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewDeliveryAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewDeliveryCount
        end>
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      Styles.OnGetContentStyle = GridTableViewStylesGetContentStyle
      object GridTableViewSaleDate: TcxGridColumn
        Tag = 99
        Caption = #47588#52636#51068#51088
        DataBinding.FieldName = 'YMD_SALE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        Visible = False
        HeaderAlignmentHorz = taCenter
      end
      object GridTableViewStoreName: TcxGridColumn
        Caption = #47588#51109#47749
        DataBinding.FieldName = 'NM_STORE_SHORT'
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 179
      end
      object GridTableViewTotSaleAmt: TcxGridColumn
        Caption = #52509#47588#52636#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE_TOT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.GroupFooters = False
        Options.Grouping = False
        Width = 116
      end
      object GridTableViewDcAmt: TcxGridColumn
        Caption = #54624#51064#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_DC'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.Content = StyleFontRed
        Width = 85
      end
      object GridTableViewServiceAmt: TcxGridColumn
        Caption = #49436#48708#49828#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SERVICE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.GroupFooters = False
        Options.Grouping = False
        Styles.Content = StyleFontBlue
        Width = 116
      end
      object GridTableViewTipAmt: TcxGridColumn
        Caption = #48393#49324#47308#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TIP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.GroupFooters = False
        Options.Grouping = False
        Width = 89
      end
      object GridTableViewSaleAmt: TcxGridColumn
        Caption = #47588#52636#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.GroupFooters = False
        Options.Grouping = False
        Styles.Content = StyleFontBlackBold
        Styles.Header = StyleFontBlackBold
        Width = 95
      end
      object GridTableViewTaxAmt: TcxGridColumn
        Caption = #48512#44032#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TAX'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.GroupFooters = False
        Options.Grouping = False
      end
      object GridTableViewSoonSaleAmt: TcxGridColumn
        Caption = #49692#47588#52636#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SOON'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.GroupFooters = False
        Options.Grouping = False
        Width = 86
      end
      object GridTableViewDeliveryAmt: TcxGridColumn
        Caption = #48176#45804#47588#52636
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_DELIVERY'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 76
      end
      object GridTableViewDeliveryCount: TcxGridColumn
        Caption = #48176#45804#44148
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'CNT_DELIVERY'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
      end
      object GridTableViewGuestCount: TcxGridColumn
        Caption = #44061#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'CNT_GUEST'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.GroupFooters = False
        Options.Grouping = False
      end
      object GridTableViewGuestAverage: TcxGridColumn
        Caption = #44061#45800#44032
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AVG_GUEST'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.GroupFooters = False
        Options.Grouping = False
      end
      object GridTableViewRcpCount: TcxGridColumn
        Caption = #50689#49688#51613#44148#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'RCP_CNT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 83
      end
      object GridTableViewNetAmt: TcxGridColumn
        Caption = #44284#49464#47588#52636
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.GroupFooters = False
        Options.Grouping = False
      end
      object GridTableViewDutyFreeAmt: TcxGridColumn
        Caption = #47732#49464#47588#52636
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_DUTYFREE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.GroupFooters = False
        Options.Grouping = False
      end
      object GridTableViewStoreCode: TcxGridColumn
        Tag = 99
        Caption = #47588#51109#53076#46300
        DataBinding.FieldName = 'CD_STORE'
        Visible = False
      end
      object GridTableViewAvgAmt: TcxGridColumn
        Tag = 99
        Caption = #54217#44512#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_AVG'
        Visible = False
      end
    end
    object GridTableView1: TcxGridTableView [1]
      Tag = 99
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableView1TotAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableView1DcAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableView1ServiceAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableView1TipAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableView1SaleAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableView1TaxAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableView1SoonAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableView1GuestCount
        end
        item
          Format = ',0'
          Kind = skAverage
          Column = GridTableView1GuestAverage
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableView1NetAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableView1DutyFreeAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableView1RcpCount
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableView1DeliveryAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableView1DeliveryCount
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      object GridTableView1SaleDate: TcxGridColumn
        Caption = #47588#52636#51068#51088
        DataBinding.FieldName = 'YMD_SALE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 121
      end
      object GridTableView1TotAmt: TcxGridColumn
        Caption = #52509#47588#52636#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE_TOT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 91
      end
      object GridTableView1DcAmt: TcxGridColumn
        Caption = #54624#51064#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_DC'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.Content = StyleFontRed
        Width = 101
      end
      object GridTableView1ServiceAmt: TcxGridColumn
        Caption = #49436#48708#49828#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SERVICE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.Content = StyleFontBlue
        Width = 102
      end
      object GridTableView1TipAmt: TcxGridColumn
        Caption = #48393#49324#47308#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TIP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 87
      end
      object GridTableView1SaleAmt: TcxGridColumn
        Caption = #47588#52636#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.Content = StyleFontBlackBold
        Styles.Header = StyleFontBlackBold
        Width = 99
      end
      object GridTableView1TaxAmt: TcxGridColumn
        Caption = #48512#44032#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TAX'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 95
      end
      object GridTableView1SoonAmt: TcxGridColumn
        Caption = #49692#47588#52636#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SOON'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 95
      end
      object GridTableView1DeliveryAmt: TcxGridColumn
        Caption = #48176#45804#47588#52636
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_DELIVERY'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 83
      end
      object GridTableView1DeliveryCount: TcxGridColumn
        Caption = #48176#45804#44148
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'CNT_DELIVERY'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
      end
      object GridTableView1GuestCount: TcxGridColumn
        Caption = #44061#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'CNT_GUEST'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 77
      end
      object GridTableView1GuestAverage: TcxGridColumn
        Caption = #44061#45800#44032
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AVG_GUEST'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 85
      end
      object GridTableView1RcpCount: TcxGridColumn
        Caption = #50689#49688#51613#44148#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'RCP_CNT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
      end
      object GridTableView1NetAmt: TcxGridColumn
        Caption = #44284#49464#47588#52636
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
      end
      object GridTableView1DutyFreeAmt: TcxGridColumn
        Caption = #47732#49464#47588#52636
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_DUTYFREE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
      end
    end
    inherited GridLevel: TcxGridLevel
      Caption = ' '#47588#51109#48324' '#47588#52636' '
    end
    object GridLevel1: TcxGridLevel
      Caption = ' '#51068#51088#48324' '#47588#52636' '
      GridView = GridTableView1
    end
  end
  object ChartPanel: TAdvPanel [3]
    Left = 0
    Top = 391
    Width = 1142
    Height = 190
    Align = alBottom
    Color = clWhite
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    UseDockManager = True
    OnResize = ChartPanelResize
    Version = '2.5.11.0'
    BorderColor = clBlack
    BorderWidth = 1
    BottomIndent = 1
    CanMove = True
    CanSize = True
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.Font.Charset = HANGEUL_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -15
    Caption.Font.Name = #47569#51008' '#44256#46357
    Caption.Font.Style = [fsBold]
    Caption.Height = 25
    Caption.Indent = 0
    Caption.Text = '<P align="center">'#47588#51109#48324' '#54217#44512' ('#50948#52824' '#48143' '#53356#44592#51312#51221#44032#45733')</P>'
    ColorTo = clWhite
    DoubleBuffered = True
    Padding.Left = 2
    Padding.Top = 2
    Padding.Right = 2
    Padding.Bottom = 2
    Position.Save = True
    Position.Key = 'HeadAvgSaleShowForm'
    Position.Section = 'StorePanel'
    ShadowOffset = 5
    ShowMoveCursor = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Height = 10
    Text = ''
    FullHeight = 220
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited dxComponentPrinter: TdxComponentPrinter
    PixelsPerInch = 96
    inherited dxComponentPrinter1Link1: TdxGridReportLink
      ReportDocument.CreationDate = 44200.746598252310000000
      PixelsPerInch = 96
      BuiltInReportLink = True
    end
  end
end
