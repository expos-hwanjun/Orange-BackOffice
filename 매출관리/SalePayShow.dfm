inherited SalePayShowForm: TSalePayShowForm
  Left = 300
  Top = 120
  Caption = #44208#51228#49688#45800#48324' '#47588#52636' '#51312#54924
  ClientHeight = 735
  ClientWidth = 964
  OnDestroy = FormDestroy
  ExplicitWidth = 980
  ExplicitHeight = 774
  PixelsPerInch = 96
  TextHeight = 17
  object PosSplitter: TAdvSplitter [0]
    Left = 0
    Top = 552
    Width = 964
    Height = 6
    Cursor = crVSplit
    Align = alBottom
    AutoSnap = False
    MinSize = 80
    Appearance.BorderColor = clNone
    Appearance.BorderColorHot = clNone
    Appearance.Color = 14542308
    Appearance.ColorTo = 16768709
    Appearance.ColorHot = 15383705
    Appearance.ColorHotTo = 14922381
    GripStyle = sgFlatDots
    ExplicitLeft = -1
    ExplicitTop = 469
    ExplicitWidth = 893
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 964
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitWidth = 964
    inherited ButtonToolBar: TAdvToolBar
      Left = 676
      ExplicitLeft = 676
      inherited ButtonToolBarSeparator1: TAdvToolBarSeparator
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
      end
      inherited ButtonToolBarSeparator2: TAdvToolBarSeparator
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
      end
      inherited ButtonToolBarCloseButton: TAdvGlowButton
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
      end
      inherited ButtonToolBarSearchButton: TAdvGlowButton
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
      end
      inherited ButtonToolBarPrintButton: TAdvGlowMenuButton
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
      end
    end
    inherited ConditionToolBar: TAdvToolBar
      Width = 685
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitWidth = 685
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Visible = True
      end
      inherited ConditionToolBarDateLabel: TcxLabel
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Visible = True
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarToDateEdit: TcxDateEdit
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Visible = True
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Visible = True
        AnchorX = 166
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Visible = True
        AnchorX = 448
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Properties.Alignment.Horz = taCenter
        Properties.Items.Strings = (
          #51068#51088#48324
          #50900#48324)
        Text = #51068#51088#48324
        Visible = True
        ExplicitWidth = 81
        Width = 81
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 561
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitLeft = 561
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
    end
  end
  inherited Grid: TcxGrid
    Left = 4
    Top = 69
    Width = 956
    Height = 479
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    RootLevelOptions.DetailTabsPosition = dtpTop
    OnActiveTabChanged = GridActiveTabChanged
    ExplicitLeft = 4
    ExplicitTop = 69
    ExplicitWidth = 956
    ExplicitHeight = 479
    inherited GridTableView: TcxGridTableView
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridTableViewApprovalAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridTableViewApprovalNetAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridTableViewApprovalVatAmt
        end
        item
          Format = ',0 '#44148
          Kind = skCount
          Position = spFooter
          Column = GridTableViewSaleDate
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewApprovalAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewApprovalNetAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewApprovalVatAmt
        end
        item
          Format = ',0'#44148
          Kind = skCount
          Column = GridTableViewSaleDate
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewDcAmt
        end>
      OptionsView.GroupFooters = gfAlwaysVisible
      Styles.ContentEven = StyleEven
      Styles.OnGetContentStyle = GridTableViewStylesGetContentStyle
      object GridTableViewSaleDate: TcxGridColumn
        Caption = #54032#47588#51068#51088
        DataBinding.FieldName = 'YMD_SALE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 110
      end
      object GridTableViewPosNo: TcxGridColumn
        Caption = 'POS'
        DataBinding.FieldName = 'NO_POS'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 50
      end
      object GridTableViewBillNo: TcxGridColumn
        Caption = #51204#54364
        DataBinding.FieldName = 'NO_RCP'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 60
      end
      object GridTableViewType: TcxGridColumn
        Caption = #44396#48516
        DataBinding.FieldName = 'DS_TRD'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 60
      end
      object GridTableViewCardNo: TcxGridColumn
        Caption = #52852#46300#48264#54840
        DataBinding.FieldName = 'NO_CARD'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 150
      end
      object GridTableViewApprovalAmt: TcxGridColumn
        Caption = #49849#51064#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_APPROVAL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 100
      end
      object GridTableViewApprovalNetAmt: TcxGridColumn
        Caption = #44277#44553#44032
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 100
      end
      object GridTableViewApprovalVatAmt: TcxGridColumn
        Caption = #48512#44032#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TAX'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 90
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
        Width = 78
      end
      object GridTableViewApprovalDate: TcxGridColumn
        Caption = #49849#51064#51068#51088
        DataBinding.FieldName = 'YMD_APPROVAL'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 92
      end
      object GridTableViewApprovalTime: TcxGridColumn
        Caption = #49849#51064#49884#44036
        DataBinding.FieldName = 'TIME_APPROVAL'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 86
      end
      object GridTableViewApprovalNo: TcxGridColumn
        Caption = #49849#51064#48264#54840
        DataBinding.FieldName = 'NO_APPROVAL'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 90
      end
      object GridTableViewCardCompany: TcxGridColumn
        Caption = #47588#51077#49324
        DataBinding.FieldName = 'NM_CARD_BUY'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 150
      end
      object GridTableViewIssueName: TcxGridColumn
        Caption = #48156#44553#49324#47749
        DataBinding.FieldName = 'NM_CARDPL'
        HeaderAlignmentHorz = taCenter
        Width = 111
      end
      object GridTableViewHalbu: TcxGridColumn
        Caption = #54624#48512#44592#44036
        DataBinding.FieldName = 'TERM_HALBU'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 70
      end
      object GridTableViewApprovalType: TcxGridColumn
        Caption = #49849#51064#50976#54805
        DataBinding.FieldName = 'TYPE_TRD'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 90
      end
      object GridTableViewJoinNo: TcxGridColumn
        Caption = #44032#47609#51216#48264#54840
        DataBinding.FieldName = 'NO_CHAINPL'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 90
      end
      object GridTableViewCorner: TcxGridColumn
        Caption = #50629#51109
        DataBinding.FieldName = 'CORNER'
        HeaderAlignmentHorz = taCenter
        Width = 112
      end
    end
    object GridBandedTableView: TcxGridBandedTableView [1]
      Tag = 99
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridBandedTableViewBankCnt
        end
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridBandedTableViewBankAmt
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewSaleAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewSaleNotAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewSaleNetAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewSaleVatAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewCashCnt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewCashAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewCashNetAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewCashDutyfreeAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewCashTaxAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewCashReceiptCnt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewCashReceiptAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewCashReceiptNetAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewCashReceiptDutyfreeAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewCashReceiptTaxAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewCardCnt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewCardAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewCardNetAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewCardDutyFreeAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewCardTaxAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewLetsOrderCount
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewLetsOrderAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewLetsOrderNetAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewLetsOrderDutyfreeAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewLetsOrderTaxAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewCheckCnt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewCheckAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewCheckNetAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewCheckDutyfreeAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewCheckTaxAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewCreditCnt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewCreditAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewTrustNetAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewTrustDutyfreeAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewTrustTaxAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewGiftCardCnt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewGiftCardAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewGiftNetAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewGiftDutyfreeAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewGiftTaxAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewBankCnt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewBankAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewBankNetAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewBankDutyfreeAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewBankTaxAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewPointCnt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewPointAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewPointNetAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewPointDutyfreeAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewPointTaxAmt
        end
        item
          Format = ',0'
          Kind = skSum
        end
        item
          Format = ',0'
          Kind = skSum
        end
        item
          Format = ',0'
          Kind = skSum
        end
        item
          Format = ',0'
          Kind = skSum
        end
        item
          Format = ',0'
          Kind = skSum
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      Bands = <
        item
          Caption = #54032#47588
          Width = 502
        end
        item
          Caption = #54788#44552
          Width = 381
        end
        item
          Caption = #54788#44552#50689#49688#51613'('#54788#44552#54252#54632')'
          Styles.Content = StyleFontGray
          Styles.Header = StyleFontGray
        end
        item
          Caption = #49888#50857#52852#46300
        end
        item
          Caption = #47131#52768#50724#45908
          Width = 334
        end
        item
          Caption = #49688#54364
          Width = 382
        end
        item
          Caption = #50808#49345
          Width = 372
        end
        item
          Caption = #49345#54408#44428
        end
        item
          Caption = #44228#51340#51077#44552
          Width = 369
        end
        item
          Caption = #54252#51064#53944
          Width = 325
        end>
      object GridBandedTableViewSaleDate: TcxGridBandedColumn
        Tag = 98
        Caption = #54032#47588#51068#51088
        DataBinding.FieldName = 'YMD_SALE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 110
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableViewSaleAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #54032#47588#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.Content = StyleFontBlackBold
        Width = 108
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableViewSaleNotAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #47732#49464#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_DUTYFREE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        OnCustomDrawCell = GridBandedTableViewCustomDrawCell
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 114
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GridBandedTableViewSaleNetAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #44284#49464#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        OnCustomDrawCell = GridBandedTableViewCustomDrawCell
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object GridBandedTableViewSaleVatAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #48512#44032#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TAX'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        OnCustomDrawCell = GridBandedTableViewCustomDrawCell
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 90
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object GridBandedTableViewCashCnt: TcxGridBandedColumn
        Tag = 98
        Caption = #44148#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'CNT_CASH'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 52
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableViewCashAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASH'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.Content = StyleFontBlackBold
        Width = 90
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableViewCashNetAmt: TcxGridBandedColumn
        Caption = #44284#49464#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASH_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 80
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GridBandedTableViewCashDutyfreeAmt: TcxGridBandedColumn
        Caption = #47732#49464#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASH_DUTYFREE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 79
        Position.BandIndex = 1
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object GridBandedTableViewCashTaxAmt: TcxGridBandedColumn
        Caption = #48512#44032#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASH_TAX'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 80
        Position.BandIndex = 1
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object GridBandedTableViewCashReceiptCnt: TcxGridBandedColumn
        Tag = 98
        Caption = #44148#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'CNT_CASHRCP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.Header = StyleFontGray
        Width = 45
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableViewCashReceiptAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASHRCP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.Header = StyleFontGray
        Width = 90
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableViewCashReceiptNetAmt: TcxGridBandedColumn
        Caption = #44284#49464#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASHRCP_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        OnCustomDrawCell = GridBandedTableViewCustomDrawCell
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.Header = StyleFontGray
        Width = 90
        Position.BandIndex = 2
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GridBandedTableViewCashReceiptDutyfreeAmt: TcxGridBandedColumn
        Caption = #47732#49464#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASHRCP_DUTYFREE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        Styles.Header = StyleFontGray
        Position.BandIndex = 2
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object GridBandedTableViewCashReceiptTaxAmt: TcxGridBandedColumn
        Caption = #48512#44032#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASHRCP_TAX'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        OnCustomDrawCell = GridBandedTableViewCustomDrawCell
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.Header = StyleFontGray
        Width = 80
        Position.BandIndex = 2
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object GridBandedTableViewCardCnt: TcxGridBandedColumn
        Tag = 98
        Caption = #44148#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'CNT_CARD'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 45
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableViewCardAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CARD'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.Content = StyleFontBlackBold
        Width = 90
        Position.BandIndex = 3
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableViewCardNetAmt: TcxGridBandedColumn
        Caption = #44284#49464#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CARD_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        OnCustomDrawCell = GridBandedTableViewCustomDrawCell
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 90
        Position.BandIndex = 3
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GridBandedTableViewCardDutyFreeAmt: TcxGridBandedColumn
        Caption = #47732#49464#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CARD_DUTYFREE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 3
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object GridBandedTableViewCardTaxAmt: TcxGridBandedColumn
        Caption = #48512#44032#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CARD_TAX'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        OnCustomDrawCell = GridBandedTableViewCustomDrawCell
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 80
        Position.BandIndex = 3
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object GridBandedTableViewLetsOrderCount: TcxGridBandedColumn
        Tag = 98
        Caption = #44148#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'CNT_LETSORDER'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableViewLetsOrderAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_LETSORDER'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.Content = StyleFontBlackBold
        Position.BandIndex = 4
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableViewLetsOrderNetAmt: TcxGridBandedColumn
        Caption = #44284#49464#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_LETSORDER_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 4
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GridBandedTableViewLetsOrderDutyfreeAmt: TcxGridBandedColumn
        Caption = #47732#49464#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_LETSORDER_DUTYFREE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 4
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object GridBandedTableViewLetsOrderTaxAmt: TcxGridBandedColumn
        Caption = #48512#44032#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_LETSORDER_TAX'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 4
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object GridBandedTableViewCheckCnt: TcxGridBandedColumn
        Tag = 98
        Caption = #44148#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'CNT_CHECK'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 53
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableViewCheckAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CHECK'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.Content = StyleFontBlackBold
        Width = 92
        Position.BandIndex = 5
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableViewCheckNetAmt: TcxGridBandedColumn
        Caption = #44284#49464#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CHECK_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 78
        Position.BandIndex = 5
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GridBandedTableViewCheckDutyfreeAmt: TcxGridBandedColumn
        Caption = #47732#49464#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CHECK_DUTYFREE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 80
        Position.BandIndex = 5
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object GridBandedTableViewCheckTaxAmt: TcxGridBandedColumn
        Caption = #48512#44032#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CHECK_TAX'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 79
        Position.BandIndex = 5
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object GridBandedTableViewCreditCnt: TcxGridBandedColumn
        Tag = 98
        Caption = #44148#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'CNT_TRUST'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 51
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableViewCreditAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TRUST'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.Content = StyleFontBlackBold
        Width = 89
        Position.BandIndex = 6
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableViewTrustNetAmt: TcxGridBandedColumn
        Caption = #44284#49464#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TRUST_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 77
        Position.BandIndex = 6
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GridBandedTableViewTrustDutyfreeAmt: TcxGridBandedColumn
        Caption = #47732#49464#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TRUST_DUTYFREE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 77
        Position.BandIndex = 6
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object GridBandedTableViewTrustTaxAmt: TcxGridBandedColumn
        Caption = #48512#44032#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TRUST_TAX'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 78
        Position.BandIndex = 6
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object GridBandedTableViewGiftCardCnt: TcxGridBandedColumn
        Tag = 98
        Caption = #44148#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'CNT_GIFT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 45
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableViewGiftCardAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_GIFT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.Content = StyleFontBlackBold
        Width = 90
        Position.BandIndex = 7
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableViewGiftNetAmt: TcxGridBandedColumn
        Caption = #44284#49464#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_GIFT_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 7
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GridBandedTableViewGiftDutyfreeAmt: TcxGridBandedColumn
        Caption = #47732#49464#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_GIFT_DUTYFREE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 7
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object GridBandedTableViewGiftTaxAmt: TcxGridBandedColumn
        Caption = #48512#44032#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_GIFT_TAX'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 7
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object GridBandedTableViewBankCnt: TcxGridBandedColumn
        Tag = 98
        Caption = #44148#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'CNT_BANK'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableViewBankAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_BANK'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.Content = StyleFontBlackBold
        Position.BandIndex = 8
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableViewBankNetAmt: TcxGridBandedColumn
        Caption = #44284#49464#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_BANK_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 8
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GridBandedTableViewBankDutyfreeAmt: TcxGridBandedColumn
        Caption = #47732#49464#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_BANK_DUTYFREE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 8
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object GridBandedTableViewBankTaxAmt: TcxGridBandedColumn
        Caption = #48512#44032#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_BANK_TAX'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 8
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object GridBandedTableViewPointCnt: TcxGridBandedColumn
        Tag = 98
        Caption = #44148#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'CNT_POINT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 9
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableViewPointAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #54252#51064#53944
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_POINT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.Content = StyleFontBlackBold
        Position.BandIndex = 9
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableViewPointNetAmt: TcxGridBandedColumn
        Caption = #44284#49464#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_POINT_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 9
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GridBandedTableViewPointDutyfreeAmt: TcxGridBandedColumn
        Caption = #47732#49464#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_POINT_DUTYFREE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 9
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object GridBandedTableViewPointTaxAmt: TcxGridBandedColumn
        Caption = #48512#44032#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_POINT_TAX'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 9
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
    end
    object GridDBTableView: TcxGridDBTableView [2]
      Tag = 99
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewApprovalQty
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewApprovalAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewCancelQty
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewCancelAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewTotalQty
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewTotalAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewCardFee
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      object GridDBTableViewCardCompany: TcxGridDBColumn
        Caption = #52852#46300' '#47588#51077#49324
        DataBinding.FieldName = 'NM_CARD_BUY'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 150
      end
      object GridDBTableViewApprovalQty: TcxGridDBColumn
        Caption = #49849#51064#44148#49688
        DataBinding.FieldName = 'CNT_APPROVAL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 70
      end
      object GridDBTableViewApprovalAmt: TcxGridDBColumn
        Caption = #49849#51064#44552#50529
        DataBinding.FieldName = 'AMT_APPROVAL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 100
      end
      object GridDBTableViewCancelQty: TcxGridDBColumn
        Caption = #52712#49548#44148#49688
        DataBinding.FieldName = 'CNT_CANCEL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 70
      end
      object GridDBTableViewCancelAmt: TcxGridDBColumn
        Caption = #52712#49548#44552#50529
        DataBinding.FieldName = 'AMT_CANCEL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 100
      end
      object GridDBTableViewTotalQty: TcxGridDBColumn
        Caption = #52509' '#44148#49688
        DataBinding.FieldName = 'CNT_TOTAL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 70
      end
      object GridDBTableViewTotalAmt: TcxGridDBColumn
        Caption = #54633#44228#44552#50529
        DataBinding.FieldName = 'AMT_TOTAL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 100
      end
      object GridDBTableViewRate: TcxGridDBColumn
        Caption = #44396#49457#48708
        DataBinding.FieldName = 'RATE'
        PropertiesClassName = 'TcxProgressBarProperties'
        Properties.BarStyle = cxbsGradient
        Properties.BeginColor = clSkyBlue
        Properties.EndColor = clBlue
        Properties.SolidTextColor = True
        HeaderAlignmentHorz = taCenter
        Width = 80
      end
      object GridDBTableViewCardFee: TcxGridDBColumn
        Caption = #49688#49688#47308
        DataBinding.FieldName = 'RATE_FEE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 86
      end
    end
    object GridSubDBTableView: TcxGridDBTableView [3]
      Tag = 99
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DetailKeyFieldNames = 'NM_CARD_BUY'
      DataController.MasterKeyFieldNames = 'NM_CARD_BUY'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      Styles.OnGetContentStyle = GridSubDBTableViewStylesGetContentStyle
      object GridSubDBTableViewSaleDate: TcxGridDBColumn
        Caption = #49849#51064#51068#51088
        DataBinding.FieldName = 'YMD_SALE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 110
      end
      object GridSubDBTableViewPosNo: TcxGridDBColumn
        Caption = 'POS'
        DataBinding.FieldName = 'NO_POS'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 50
      end
      object GridSubDBTableViewBillNo: TcxGridDBColumn
        Caption = #51204#54364
        DataBinding.FieldName = 'NO_RCP'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 60
      end
      object GridSubDBTableViewType: TcxGridDBColumn
        Caption = #44396#48516
        DataBinding.FieldName = 'DS_TRD'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 70
      end
      object GridSubDBTableViewCardNo: TcxGridDBColumn
        Caption = #52852#46300#48264#54840
        DataBinding.FieldName = 'NO_CARD'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 150
      end
      object GridSubDBTableViewApprovalAmt: TcxGridDBColumn
        Caption = #49849#51064#44552#50529
        DataBinding.FieldName = 'AMT_APPROVAL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 100
      end
      object GridSubDBTableViewApprovalNo: TcxGridDBColumn
        Caption = #49849#51064#48264#54840
        DataBinding.FieldName = 'NO_APPROVAL'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 80
      end
      object GridSubDBTableViewHalbu: TcxGridDBColumn
        Caption = #54624#48512#44592#44036
        DataBinding.FieldName = 'TERM_HALBU'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 70
      end
      object GridSubDBTableViewIssueName: TcxGridDBColumn
        Caption = #48156#44553#49324#47749
        DataBinding.FieldName = 'NM_CARDPL'
        HeaderAlignmentHorz = taCenter
      end
    end
    object GridTableCashReceiptView: TcxGridTableView [4]
      Tag = 99
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridTableCashReceiptViewApprovalAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridTableCashReceiptViewColumn9
        end
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridTableCashReceiptViewColumn10
        end
        item
          Format = ',0 '#44148
          Kind = skCount
          Position = spFooter
          Column = GridTableCashReceiptViewColumn1
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableCashReceiptViewApprovalAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableCashReceiptViewColumn9
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableCashReceiptViewColumn10
        end
        item
          Format = ',0'#44148
          Kind = skCount
          Column = GridTableCashReceiptViewColumn1
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfAlwaysVisible
      Styles.ContentEven = StyleEven
      Styles.OnGetContentStyle = GridTableCashReceiptViewStylesGetContentStyle
      object GridTableCashReceiptViewColumn1: TcxGridColumn
        Caption = #54032#47588#51068#51088
        DataBinding.FieldName = 'YMD_SALE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 110
      end
      object GridTableCashReceiptViewColumn2: TcxGridColumn
        Caption = 'POS'
        DataBinding.FieldName = 'NO_POS'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 50
      end
      object GridTableCashReceiptViewColumn3: TcxGridColumn
        Caption = #51204#54364
        DataBinding.FieldName = 'NO_RCP'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 60
      end
      object GridTableCashReceiptViewColumn4: TcxGridColumn
        Caption = #44396#48516
        DataBinding.FieldName = 'DS_TRD'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 80
      end
      object GridTableCashReceiptViewColumn5: TcxGridColumn
        Caption = #50857#46020
        DataBinding.FieldName = 'DS_KIND'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 80
      end
      object GridTableCashReceiptViewCardNo: TcxGridColumn
        Caption = #49885#48324#48264#54840
        DataBinding.FieldName = 'NO_CARD'
        HeaderAlignmentHorz = taCenter
        Width = 150
      end
      object GridTableCashReceiptViewApprovalAmt: TcxGridColumn
        Caption = #49849#51064#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_APPROVAL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 100
      end
      object GridTableCashReceiptViewColumn9: TcxGridColumn
        Caption = #44277#44553#44032
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 100
      end
      object GridTableCashReceiptViewColumn10: TcxGridColumn
        Caption = #48512#44032#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_VAT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 90
      end
      object GridTableCashReceiptViewApprovalDate: TcxGridColumn
        Caption = #49849#51064#51068#51088
        DataBinding.FieldName = 'YMD_APPROVAL'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 90
      end
      object GridTableCashReceiptViewApprovalNo: TcxGridColumn
        Caption = #49849#51064#48264#54840
        DataBinding.FieldName = 'NO_APPROVAL'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 90
      end
    end
    object GridTableCreditView: TcxGridTableView [5]
      Tag = 99
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = ',0'
          Position = spFooter
          Column = GridTableCreditViewCreditAmt
        end
        item
          Format = ',0 '#44148
          Kind = skCount
          Position = spFooter
          Column = GridTableCreditViewSaleDate
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Column = GridTableCreditViewCreditAmt
        end
        item
          Format = ',0'#44148
          Kind = skCount
          Column = GridTableCreditViewSaleDate
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      object GridTableCreditViewSaleDate: TcxGridColumn
        Caption = #54032#47588#51068#51088
        DataBinding.FieldName = 'YMD_SALE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 110
      end
      object GridTableCreditViewMemberCode: TcxGridColumn
        Caption = #54924#50896#48264#54840
        DataBinding.FieldName = 'CD_MEMBER'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 110
      end
      object GridTableCreditViewMemberName: TcxGridColumn
        Caption = #54924#50896#51060#47492
        DataBinding.FieldName = 'NM_MEMBER'
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 150
      end
      object GridTableCreditViewColumn4: TcxGridColumn
        Caption = #54924#50896#44396#48516
        DataBinding.FieldName = 'DS_MEMBER'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 88
      end
      object GridTableCreditViewColumn9: TcxGridColumn
        Caption = #52852#46300#48264#54840
        DataBinding.FieldName = 'NO_CARD'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 169
      end
      object GridTableCreditViewColumn10: TcxGridColumn
        Caption = #51204#54868#48264#54840
        DataBinding.FieldName = 'TEL_MOBILE'
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 100
      end
      object GridTableCreditViewCreditAmt: TcxGridColumn
        Caption = #50808#49345#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TRUST'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 100
      end
      object GridTableCreditViewColumn3: TcxGridColumn
        Caption = #51204#54364
        DataBinding.FieldName = 'NO_RCP'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 150
      end
    end
    object GridTablePointView: TcxGridTableView [6]
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = GridTablePointViewPointAmt
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      object GridTablePointViewSaleDate: TcxGridColumn
        Caption = #47588#52636#51068#51088
        DataBinding.FieldName = 'YMD_SALE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 124
      end
      object GridTablePointViewPosNo: TcxGridColumn
        Caption = #54252#49828
        DataBinding.FieldName = 'NO_POS'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
      end
      object GridTablePointViewRcpNo: TcxGridColumn
        Caption = #50689#49688#51613
        DataBinding.FieldName = 'NO_RCP'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
      end
      object GridTablePointViewSaleAmt: TcxGridColumn
        Caption = #47588#52636#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 125
      end
      object GridTablePointViewMemberCode: TcxGridColumn
        Caption = #54924#50896#53076#46300
        DataBinding.FieldName = 'CD_MEMBER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 96
      end
      object GridTablePointViewMembrerName: TcxGridColumn
        Caption = #54924#50896#51060#47492
        DataBinding.FieldName = 'NM_MEMBER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 123
      end
      object GridTablePointViewCardNo: TcxGridColumn
        Caption = #52852#46300#48264#54840
        DataBinding.FieldName = 'NO_CARD'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 111
      end
      object GridTablePointViewTelNo: TcxGridColumn
        Caption = #51204#54868#48264#54840
        DataBinding.FieldName = 'NO_TEL'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 97
      end
      object GridTablePointViewPointAmt: TcxGridColumn
        Caption = #49324#50857#54252#51064#53944
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_POINT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 95
      end
    end
    object GridTableLetsOrderView: TcxGridTableView [7]
      Tag = 99
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'#44148
          Kind = skCount
          Column = GridTableLetsOrderViewColumn1
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableLetsOrderViewColumn5
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableLetsOrderViewCancelAmt
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      Styles.OnGetContentStyle = GridTableLetsOrderViewStylesGetContentStyle
      object GridTableLetsOrderViewColumn1: TcxGridColumn
        Caption = #54032#47588#51068#51088
        DataBinding.FieldName = 'YMD_SALE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 92
      end
      object GridTableLetsOrderViewColumn2: TcxGridColumn
        Caption = 'POS'
        DataBinding.FieldName = 'NO_POS'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 76
      end
      object GridTableLetsOrderViewColumn3: TcxGridColumn
        Caption = #51204#54364
        DataBinding.FieldName = 'NO_RCP'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
      end
      object GridTableLetsOrderViewType: TcxGridColumn
        Caption = #44396#48516
        DataBinding.FieldName = 'DS_TRD'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 75
      end
      object GridTableLetsOrderViewColumn5: TcxGridColumn
        Caption = #49849#51064#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_APPROVAL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 139
      end
      object GridTableLetsOrderViewCancelAmt: TcxGridColumn
        Caption = #52712#49548#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CANCEL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 113
      end
      object GridTableLetsOrderViewColumn4: TcxGridColumn
        Caption = #44208#51228#44396#48516
        DataBinding.FieldName = 'TYPE_TRD'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 79
      end
      object GridTableLetsOrderViewColumn6: TcxGridColumn
        Caption = #52852#46300#48264#54840
        DataBinding.FieldName = 'NO_CARD'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object GridTableLetsOrderViewColumn9: TcxGridColumn
        Caption = #54624#48512
        DataBinding.FieldName = 'TERM_HALBU'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
      end
      object GridTableLetsOrderViewColumn8: TcxGridColumn
        Caption = #52852#46300#49324
        DataBinding.FieldName = 'NM_CARDPL'
        HeaderAlignmentHorz = taCenter
        Width = 124
      end
      object GridTableLetsOrderViewColumn10: TcxGridColumn
        Caption = #49849#51064#48264#54840
        DataBinding.FieldName = 'NO_APPROVAL'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 106
      end
      object GridTableLetsOrderViewColumn7: TcxGridColumn
        Caption = #49849#51064#51068#49884
        DataBinding.FieldName = 'DT_APPROVAL'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 96
      end
    end
    inherited GridLevel: TcxGridLevel
      Caption = ' '#44208#51228#49688#45800#48324' '
      GridView = GridBandedTableView
    end
    object GridLevel1: TcxGridLevel
      Caption = ' '#49888#50857#52852#46300'('#47588#51077#49324#48324') '
      GridView = GridDBTableView
      object GridLevel8: TcxGridLevel
        GridView = GridSubDBTableView
      end
    end
    object GridLevel2: TcxGridLevel
      Caption = ' '#49888#50857#52852#46300'('#44148#48324') '
      GridView = GridTableView
    end
    object GridLevel3: TcxGridLevel
      Caption = ' '#54788#44552#50689#49688#51613' '
      GridView = GridTableCashReceiptView
    end
    object GridLevel5: TcxGridLevel
      Caption = ' '#50808#49345' '
      GridView = GridTableCreditView
    end
    object GridLevel6: TcxGridLevel
      Caption = ' '#54252#51064#53944' '
      GridView = GridTablePointView
    end
    object GridLevel4: TcxGridLevel
      Caption = ' '#47131#52768#50724#45908' '
      GridView = GridTableLetsOrderView
    end
  end
  object ChartPanel: TPanel [3]
    Left = 0
    Top = 558
    Width = 964
    Height = 177
    Align = alBottom
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Ctl3D = False
    DoubleBuffered = False
    ParentCtl3D = False
    ParentDoubleBuffered = False
    TabOrder = 3
    OnResize = ChartPanelResize
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited ButtonToolBarPrintButtonImageList: TImageList
    Bitmap = {
      494C010105000800040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000014100F005E5C5B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002823200024231F002724200026242400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003734
      2F0035302D00312E29002D2A25002A272300272721002B2B25002C2A29000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005E5851003935
      300035322E00322F2B002D282500292621002B272200312F2E00312F2E003332
      2E00363434000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005E5851005E58
      51003F3D35003A3A3400312E2A002F2C27002C2925002B2A260045463D004846
      4500535149000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005F5B56004542
      3D003F3B3600393534002429200094928700847B7200434139004C4944005451
      4900585852000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004E4946001B18
      1400D4D5C500BCB1A90088847900827970006F6F630044453B004B4A46005450
      4B005D5555000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D7CEC100C4B8
      B600B0A39B00847F76007C736A00666059006660590057544C005D5958005352
      480059594D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000746E
      67006C665F0075796E0028251D0030302A003C3837004F4747004C4D44005152
      490044473E005E58510000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000615C59001714100058514800555349005451490055534B00DFD4B8004B4C
      420052514700272F240000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005753520071685F006D6762006A6A5C006B695F0073706B007273
      6F007C7B77000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008A877900827F7B008283790088867E005E5851000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000300000022000000100000000C0000
      000000000000000000000000000000000000000000000000000102010136110E
      0E74120F0F770B090969040404550302023B0101012700000012000000050000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000020000
      00080000001000000029000000330000000B0000000000000000000000000000
      0000000000005F425F74724C72A5714A719F714A719F714A719F714A719F724C
      72A55E415E730000000000000000000000000000000000000000000000000000
      00020000000000000000000000000000002704050568030302520806064F0303
      032B0000000E00000001000000000000000000000000000000061B16167ACEB2
      B4F5FDDDDFFFF2D2D4FFDEBFC2FFB1989AF3706060D33B3232AE1D1819850907
      07580101012B0000000900000000000000000000000000000001000000030000
      00060000000B000000140000002000000030010101450303035B0A0A0A751717
      18902A2A2CA9525454CE242625B4000000200000000000000000000000000000
      000000000000947394CCFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFF8F8F8FFFDFD
      FDFF835E83C10000000000000000000000000000000000000000010101340808
      087C0202025F0000002A0101013D434646BBA5A29BF19D9689E9B6B4B2E88987
      84CE494542A41C1A19700C0B0A480201011C00000000000000000000001B1811
      128C554344C6897071DEE8D0D1FCFFF0F0FFFFE9EAFFFFE3E6FFFBDADCFFDCC3
      C5FF857A7AD92D27279E000000330000000505130962070D096F070707780F10
      0F881B1D1C9C292C2AAE464547C26C6B6ED6919697E8B9C0C0F9CDD7D5FFD2DB
      D5FFCDE1D6FFFFFFFFFF737575D7000000271B181B1C3F313F443C303C413C30
      3C403A2E3A3E907490D9FEFEFEFFF1F1F1FFEAEAEAFFE6E6E6FFE7E7E7FFF2F2
      F2FF7C577CBF000000000000000000000000000000030000004B313131D48183
      83FF5D5D5DF7242424CF555656DFDFCFBDFFFFE8C7FFFFFFF0FFFFFFFFFFFFFF
      FFFFFFFFFFFFF0F2F4FFC1B9B3F70E0C0B61000000000000000A131010764D3E
      41B73E2A2EAB442F34BAC3B2B8F5F6E9ECFFF4D6D7FFF6D1D3FFC3A2A3EF947F
      80D9C0AFB1E8C8ADAFF5080607640000000C5A9B71EFB0C8BAFFC9CCCBFFCEDA
      D5FFD7E5DEFFECFAF6FFD6EBDEFFBDD9C5FFACD3B9FFD8EEE1FFA8D2B3FF4F92
      56FF347939FFB1D4B9FF828486DE0000002E785178A9D9D9D9FFDCDCDCFFCDCD
      CDFFC1C1BDFFC4C4C1FFD0CDD0FFC7C6C7FFC1C1C1FFBCBCBCFFB6B6B6FFB6B6
      B6FF897B89F06442648717151718000000000000003E373635DD9F9FA1FFC8C9
      CAFFC7C8C7FFB0B2B4FF949393FF9F8773FFB89D85FECCB59FFEE0C8B1FEF4E3
      D0FEFFF6E5FFF1E7E0FF474747B60000002D0000000000000020866D71DAFDF8
      EFFFABC2B2F7A2A19AEEDDBDC1FCECCFDCFFECCFDDFFE8C7D4FF5F4B51D10B07
      07770604045E020101370000000B0000000055926AEBC7DFD1FFE7FAF1FF79B9
      90FF68A97CFFBBD8C6FF7EB88FFF348847FF2C7E3EFF8DB596FF89BA93FF297E
      32FF33823AFFB0D5B8FF9B9F9FEA0101013B907390D6BABABAFFCCCCCBFFD4D4
      DAFFC2C2E1FFCDCBE2FFC3D4C0FFD0D4D0FFD1D1D1FFCECECEFFC9C9C9FFC4C4
      C4FFC5C5C5FFB7B7B7FF6E4B6EC52621262709090970939594FFC3C6C5FFD1D1
      D2FFDEDFDFFFD9DEDFFFBEC1C3FFABB0B4FFA6B0B4FFA1A19EFFA29B95FFA191
      80FFA38F7BFF7B7170FD07070871000000000000000001000131997C83DEE3D0
      ABFF6F9A49FF97A852FFF2A55BFFF4AA74FFF2BA98FFF0C2B5FFC1A1A2F27060
      68CD302F31A811111083030202430000001C407E54E096BCA3FFC9E8D7FF4AA1
      68FF42975EFFA8CAB5FFABD5B8FF8DCA9DFF97CBA4FFB9D7C4FFD4EADDFFB4D3
      BCFFABCAB4FFDCF0E5FFACB3B3F302020247A794A7E8C5C5C5FFC0C0BFFFE5E5
      EBFF9898DFFFA7A3E3FFAFD0ACFFC3D2C3FFD3D1D3FFCFCFCFFFCBCBCBFFCACA
      CAFFCDCDCDFFC7C7C7FF918591F1433443490A0A0A6BACB0AFFED5DAD9FFE7E7
      E7FEEEF5F8FEDED7D4FEBF7857FEB36946FEB58A79FEBBB1AEFEB4B5B5FEB6B3
      BCFEA2A7A4FE6AA869FF111B119E0000000C0000000205030343AC9095EAFBBC
      95FFBEAE76FFBCA761FFDF7B11FFE38017FFE78923FFEC9033FFF59E4BFFFEB2
      70FFEDBD86FFEDD8BFFF3F3438B20603045D3E7E53E2699E79FFEAF5ECFFDBEF
      E3FFDCEEE3FFF6FBF9FFE2ECE8FF9DA7A1FF9EA9A2FFF1FAF9FFC6DECEFF6B9E
      74FF46834EFF8FB696FFC1C8C7FC04040456A793A7E6D0D0D0FFC2C2C2FFF1F1
      F0FFECECEAFFE5E5E6FFE3E2E4FFDDDDDDFFD4D3D4FFD1D1D1FFCDCDCDFFCCCC
      CCFFCCCCCCFFC9C9C9FF8F7F8FEC3C303C410606065EB7BBB9FBF5F7F7FFF6F6
      F7FFF9FFFFFFEBC7ACFFD36625FFCA5716FFC25319FFBB5625FFB4572AFFBE87
      71FFD6D6D6FFD3F1D9FF2126219D0000000C000000060B090954C7A8AAF6FAB8
      8DFFE9C79BFFE5BE8CFFD97A1BFFDA7917FFDA7A18FFDC7C18FFDD801AFFE280
      16FFE98516FFFFD0A1FF42393DB10403035748875DE2649F7AFFE8F1EAFFD8E6
      DFFFA1C6B0FFA2C7B0FF527157FF141B14FF49684FFFDBEAE1FFBDDAC4FF4593
      52FF34823CFF85B58CFFCED9D6FF07070763A996A9E6DADADAFFC3C3C3FFF4F4
      F4FFF1F1F1FFECEDECFFE8E8E8FFE4E4E4FFD5D5D5FFD2D2D2FFD0D0D0FFCFCF
      CFFFCDCDCDFFCDCDCDFF8F7B8FE8362C363A010202478A8B8BE4EFF0F0FFE3EC
      F2FFE7DCD3FEE8995EFEE88336FEE5853EFEE17E39FEDA7430FECF5A13FEC96C
      36FEEAE0D9FFFFFFFFFF1C1B1C8A000000050000000A0D0B0C63F2C7C4FFDAA9
      77FF84987EFFAB9869FFDB7B1DFFDD7D1DFFDD8223FFDE8628FFDE8A2CFFDC86
      26FFE08B27FFFFCDA4FF2F282BA101010141508E67E270AB8AFFDDECE4FFD8E9
      E0FF7ABB92FF338450FF002F05FF4B6C53FFCCE0D2FFDDEDE3FFDFF0E7FFC3DE
      CAFFBBD5C2FFD1E7DAFFDCE8E4FF0A0A0A72AC97ACE6E4E4E4FFC4C4C4FFF6F6
      F6FFF6F6F7FFF1F1F1FFECECECFFE9E9E9FFD8D8D9FFD3D3D3FFD1D1D1FFD2D2
      D2FFCFCFCFFFD1D1D1FF8F798FE4322A3235000000070304044A52575BC7C9CA
      CAFFCC8C66FFCC6524FFD5712EFFDE7934FFE58138FFEB873AFFEE8739FFF2BE
      98FFFFFFFFFFD9DBDCFB06060658000000000000001314111278FFD1C7FFC8A9
      7EFF42BECCFF64B7B6FFD4822AFFE28220FFE08A2DFFE29134FFE4973AFFE294
      34FFEA9E3DFFFFD4B3FF231E20930000003158946DE274AC8BFFCBE2D4FFFFFF
      FFFFD5E8DEFF2A734BFF024C1BFF639875FFD9E4DCFFFEFEFFFFDEEDE5FF8CB5
      94FF4F8A5AFF679B70FFD5E6DDFF11111283AF9BAFE6EEEEEEFFC3C3C3FFF6F5
      F5FFFEFFFFFFF8FCFEFFF3F7FAFFF0F3F5FFE4E8EAFFE1E5E7FFDDE1E3FFDADC
      DDFFDED5DEFFDCD8DCFF8C748CDF2E272E30000000000000000008060548B99C
      81EBE0C1A4FFD5A586FFCF936DFFC68155FFC67544FFCE7237FFD79363FFECE5
      E0FFECEDEEFF333232A200000013000000000000002A241F2191FFDAD2FFD89D
      62FFB89F75FFC29456FFDA8527FFE18B2CFFE39438FFE69C40FFE9A347FFE7A0
      42FFF1AF52FFFCD7BCFF171416820000001F659E7AE586B498FFC7E0D0FFFAFC
      FBFF75AE93FF096839FF64A481FF5EA874FF5C986EFFC9DAD0FFDFEDE4FF67A9
      75FF3D8E4AFF6BA473FFDEF0E6FF1D1D1D98B4A1B4E8FAFAFAFFC2C2C2FFEEEE
      EEFFE2B490FFDEA77AFFDEA87CFFDDA77BFFDDA77BFFDBA579FFDAA173FFDFC3
      B1FF7ACE82FFB7D7B7FF927392DA2923292B00000000000000000C070344CDAE
      93E9FFFEECFFFFEDD3FFFCE4CAFFEDD9BEFFE3C8AEFF705A4ECE1D1E1E872A2D
      2F952424248D00000021000000000000000002010140352F31A1FFDACEFFDD8D
      47FFE19353FFE48D40FFE08625FFE29336FFE59D43FFE9A64DFFEDAE56FFEBAD
      51FFF8C16CFFF5DBC7FF0F0E0F74000000125B906ED9A8C6B4FFC5DDCEFFEFF9
      F6FF6FB393FF80BBA0FFF2FAF5FFD1EBDAFFA7CFB4FFBCD6C5FFEAF6F2FFDBEF
      E2FFD4EADBFFC1D0C7EEBBBFBDDD1414146BAB93ABE0FFFFFFFFCACACBFFE0DF
      DFFFEBCEBBFFD7B5A1FFD4B39FFFD3B39EFFD3B29EFFD2B19DFFD2AF99FFD0BF
      B5FF90CB94FFC7E0C7FF765076AB0D0D0D0E000000000201001D83644BC0FFFF
      FFFFFFFFFFFFFFF8EEFFFFF3E3FFFFF8E7FFCCB499E606050434000000010000
      0007000000030000000000000000000000000B090A63544F52B7FFDDCDFFDA7E
      2EFFDA8C35FFD88F3CFFDA7E15FFE08D24FFE49A35FFE9A745FFEEB253FFEEB4
      53FFFECF7CFFEBD9CBFF0A090A650000000A1F472C9DC9DCD1FFC7D9CEFFE1F1
      E8FFE7F4ECFFEFF5F2FFE9F1EDFFE6F0ECFFE5EFEBFFD5E8DEFFC8DFD3FFDFEB
      E6FFB8D0C0FC353F3A8A0A0A0A350000000F4A384A526D4A6D89392E393D744E
      749EFBFEFFFFC3C7C9FFCBCED0FFCBCED1FFCDD0D2FFCED1D3FFD0D4D6FFCBCD
      CEFFBFB9BFFFA89AA8F3241F2425000000000000000003020124644E3FABA08F
      82D2BCAC9FE2E0DAD5F3FEFBF9FFFEFCFAFF4C37269600000000000000000000
      000000000000000000000000000000000000100E0E73615C5EC8FFF6F3FFFFCB
      ABFFFDC59AFFFABE8BFFF8B878FFF6B771FFF3B96EFFF3BD6DFFF3C06DFFF3BE
      5EFFFFDC8BFFD6CCC2FD0B090A5D000000080108033A7FAF8EE8EEEAEEFFD2DF
      D6FFCEDED2FFCADCCFFFBFD7C8FFBFD7C8FFC0D6C8FFBED5C7FFB9D3C2FFD0DE
      D5FF9CBFA9F90A120C5900000000000000000000000000000000000000000D0D
      0D0E372C373AADA0ADF1EFEFEFFFEDEDEDFFEFEFEFFFF1F1F1FFF4F4F4FFF4F4
      F4FF846584D6211D212200000000000000000000000000000004010100180503
      022909050238190F075C46332493655242AB0703013200000000000000000000
      000000000000000000000000000000000000000000240A08084F2F292B8F3D36
      39AA63555AC1867778D7B09A9DEDE2C3C1FFF5D5CFFFFEDDD4FFFFE3D5FFFFE4
      CAFFFFFEE6FFBCB2B1F50504044A000000030000000205160A5B7EAD8DE6E7EC
      E9FFEDEBECFFE8EAE7FFE9EBE8FFE9EBE9FFE9ECE9FFEAEDEBFFEAEDEBFFFCF9
      FCFFDAE9E2FD08150B6600000000000000000000000000000000000000000000
      0000000000007A537AADFEFEFEFFFAFAFAFFFDFDFDFFFFFFFFFFFFFFFFFFF9F9
      F9FF664566880000000000000000000000000000000000000000000000000000
      0000000000000000000E0C0602411A120B5C0100001400000000000000000000
      0000000000000000000000000000000000000000000000000000000000070000
      00110000001D020202290605053508070743050405550B090A62110E0F6E1714
      157A1B1819810907085B0000000F000000000000000000000001010804392045
      2C9B699878DA86B093E682AA8EE482A78EE480A78CE47FA68BE47DA188E290B3
      9BEC7BA788EB0411085D00000000000000000000000000000000000000000000
      000000000000563E5663F7F3F7FBD5C6D5EDD5C7D5EDD5C6D5EDD7C8D7EED6CB
      D6F2372C373A000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      FF3F000000000000FC3F000000000000E01F000000000000C007000000000000
      C007000000000000C007000000000000C007000000000000C007000000000000
      E003000000000000F003000000000000F807000000000000FC1F000000000000
      FFFF000000000000FFFF000000000000000000000000F807000000000000F807
      0000000000000007000000000000000100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000001000000000000E003
      000000000000F807000000000000F80700000000000000000000000000000000
      000000000000}
  end
  inherited ButtonToolBarPrintButtonPopupMenu: TPopupMenu
    inherited ButtonToolBarPrintButtonPopupMenuReceipt: TMenuItem
      Visible = True
    end
  end
  inherited dxComponentPrinter: TdxComponentPrinter
    PixelsPerInch = 96
    inherited dxComponentPrinter1Link1: TdxGridReportLink
      PrinterPage.PageHeader.CenterTitle.Strings = (
        #44208#51228#49688#45800#48324' '#47588#52636' '#51312#54924)
      ReportDocument.CreationDate = 40423.399609733790000000
      OptionsView.Caption = True
      PixelsPerInch = 96
      BuiltInReportLink = True
    end
  end
  object SubDataSource: TDataSource
    Left = 521
    Top = 376
  end
  object DataSource: TDataSource
    Left = 489
    Top = 325
  end
end
