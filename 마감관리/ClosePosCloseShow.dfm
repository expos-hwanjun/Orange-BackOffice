inherited ClosePosCloseShowForm: TClosePosCloseShowForm
  Left = 300
  Top = 120
  Caption = 'POS '#47560#44048' '#51312#54924
  ClientHeight = 612
  ClientWidth = 964
  HelpFile = #54980#48169'/'#47560#44048#44288#47532'/POS'#47560#44048'.htm'
  ExplicitWidth = 980
  ExplicitHeight = 651
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 964
    ExplicitWidth = 964
    inherited ButtonToolBar: TAdvToolBar
      Left = 676
      ExplicitLeft = 676
    end
    inherited ConditionToolBar: TAdvToolBar
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
        OnKeyDown = ConditionToolBarToDateEditKeyDown
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        Visible = True
        AnchorX = 166
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        AnchorX = 448
        AnchorY = 16
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
    Width = 958
    Height = 541
    ExplicitWidth = 958
    ExplicitHeight = 541
    inherited GridDBTableView: TcxGridDBTableView
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridDBTableViewSaleAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridDBTableViewCashAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridDBTableViewCardAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridDBTableViewGiftCardAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridDBTableViewCreditAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
        end
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
        end
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridDBTableViewOverShortAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridDBTableViewCustomerQty
        end
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
        end
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridDBTableViewVoidAmt
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewSaleAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewCashAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewCashReceiptAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewCardAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewCreditAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewGiftCardAmt
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
          Column = GridDBTableViewOverShortAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewCustomerQty
        end
        item
          Format = ',0'
          Column = GridDBTableViewCustomerAmt
        end
        item
          Format = ',0'
          Kind = skSum
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewVoidAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewBankAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewPointAmt
        end
        item
          Format = ',0'
          Kind = skSum
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewLetsOrderAmt
        end>
      OptionsData.DeletingConfirmation = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfAlwaysVisible
      Styles.ContentEven = StyleEven
      object GridDBTableViewCloseDate: TcxGridDBColumn
        Caption = #47560#44048#51068#51088
        DataBinding.FieldName = 'YMD_CLOSE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 110
      end
      object GridDBTableViewPosNo: TcxGridDBColumn
        Caption = 'POS'
        DataBinding.FieldName = 'NO_POS'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 60
      end
      object GridDBTableViewStatus: TcxGridDBColumn
        Caption = #49345#53468
        DataBinding.FieldName = 'DS_STATUS'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 70
      end
      object GridDBTableViewCashierQty: TcxGridDBColumn
        Caption = #44228#49328#50896#49688
        DataBinding.FieldName = 'CNT_CASHIER'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 70
      end
      object GridDBTableViewSaleAmt: TcxGridDBColumn
        Caption = #54032#47588#44552#50529
        DataBinding.FieldName = 'AMT_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 100
      end
      object GridDBTableViewCashAmt: TcxGridDBColumn
        Caption = #54788#44552
        DataBinding.FieldName = 'AMT_CASH'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 90
      end
      object GridDBTableViewCashReceiptAmt: TcxGridDBColumn
        Caption = #54788#44552#50689#49688#51613
        DataBinding.FieldName = 'AMT_CASHRCP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.Content = StyleFontGray
        Styles.Header = StyleFontGray
        Width = 90
      end
      object GridDBTableViewCardAmt: TcxGridDBColumn
        Caption = #49888#50857#52852#46300
        DataBinding.FieldName = 'AMT_CARD'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 90
      end
      object GridDBTableViewLetsOrderAmt: TcxGridDBColumn
        Caption = #47131#52768#50724#45908
        DataBinding.FieldName = 'AMT_LETSORDER'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 84
      end
      object GridDBTableViewCreditAmt: TcxGridDBColumn
        Caption = #50808#49345
        DataBinding.FieldName = 'AMT_TRUST'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 90
      end
      object GridDBTableViewGiftCardAmt: TcxGridDBColumn
        Caption = #49345#54408#44428
        DataBinding.FieldName = 'AMT_GIFT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 90
      end
      object GridDBTableViewBankAmt: TcxGridDBColumn
        Caption = #44228#51340#51077#44552
        DataBinding.FieldName = 'AMT_BANK'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 73
      end
      object GridDBTableViewPointAmt: TcxGridDBColumn
        Caption = #54252#51064#53944
        DataBinding.FieldName = 'AMT_POINT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 81
      end
      object GridDBTableViewOverShortAmt: TcxGridDBColumn
        Caption = #44284#48512#51313
        DataBinding.FieldName = 'AMT_LACK'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 70
      end
      object GridDBTableViewCustomerQty: TcxGridDBColumn
        Caption = #44061#49688
        DataBinding.FieldName = 'CNT_CUSTOMER'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 70
      end
      object GridDBTableViewCustomerAmt: TcxGridDBColumn
        Caption = #44061#45800#44032
        DataBinding.FieldName = 'AMT_CUSTOMER'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 80
      end
      object GridDBTableViewVoidAmt: TcxGridDBColumn
        Caption = #52712#49548#44552#50529
        DataBinding.FieldName = 'AMT_VOID'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 80
      end
      object GridDBTableViewOpenTime: TcxGridDBColumn
        Caption = #44060#51216#49884#44036
        DataBinding.FieldName = 'DT_OPEN'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 87
      end
      object GridDBTableViewCloseTime: TcxGridDBColumn
        Caption = #47560#44048#49884#44036
        DataBinding.FieldName = 'DT_CLOSE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 95
      end
    end
    object GridDBCardView: TcxGridDBCardView [3]
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = SubDataSource
      DataController.DetailKeyFieldNames = 'LINK'
      DataController.MasterKeyFieldNames = 'LINK'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.CaptionWidth = 110
      OptionsView.CardAutoWidth = True
      OptionsView.CardIndent = 7
      OptionsView.CardWidth = 260
      OptionsView.CategoryRowCaptionInRowAlternateCaption = True
      OptionsView.CategorySeparatorWidth = 10
      OptionsView.CellAutoHeight = True
      OptionsView.EmptyRows = False
      OptionsView.SeparatorWidth = 10
      object GridDBCardViewCashierName: TcxGridDBCardViewRow
        Tag = 99
        Caption = #44228#49328#50896
        DataBinding.FieldName = 'NM_SAWON'
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
      object GridDBCardViewStatus: TcxGridDBCardViewRow
        Caption = #49345#53468
        DataBinding.FieldName = 'DS_STATUS'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taRightJustify
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
      object GridDBCardViewCloseDateTime: TcxGridDBCardViewRow
        Caption = #47560#44048#51068#49884
        DataBinding.FieldName = 'DT_CHANGE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taRightJustify
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
      object GridDBCardViewSaleAmt: TcxGridDBCardViewRow
        Caption = #54032#47588#44552#50529
        DataBinding.FieldName = 'AMT_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
      object GridDBCardViewVoidAmt: TcxGridDBCardViewRow
        Caption = #52712#49548#44552#50529
        DataBinding.FieldName = 'AMT_VOID'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
      object GridDBCardViewReserveAmt: TcxGridDBCardViewRow
        Caption = #51456#48708#44552'(+)'
        DataBinding.FieldName = 'AMT_READY'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
      object GridDBCardViewDepositAmt: TcxGridDBCardViewRow
        Caption = #51473#44036#52636#44552'(-)'
        DataBinding.FieldName = 'AMT_MID_CASH'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
      object GridDBCardViewAcctInCash: TcxGridDBCardViewRow
        Caption = #52636#45225' '#54788#44552#51077#44552'(+)'
        DataBinding.FieldName = 'AMT_ACCT_CASH'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Position.BeginsLayer = True
      end
      object GridDBCardViewAcctInCard: TcxGridDBCardViewRow
        Caption = #52636#45225' '#52852#46300' '#51077#44552
        DataBinding.FieldName = 'AMT_ACCT_CASH'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Position.BeginsLayer = True
      end
      object GridDBCardViewAcctOut: TcxGridDBCardViewRow
        Caption = #52636#45225' '#52636#44552'(-)'
        DataBinding.FieldName = 'AMT_ACCT_OUT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Position.BeginsLayer = True
      end
      object GridDBCardViewCashAmt: TcxGridDBCardViewRow
        Caption = #54788#44552'(+)'
        DataBinding.FieldName = 'AMT_CASH'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
      object GridDBCardViewCashReceiptAmt: TcxGridDBCardViewRow
        Caption = #54788#44552#50689#49688#51613
        DataBinding.FieldName = 'AMT_CASHRCP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
      object GridDBCardViewCardQty: TcxGridDBCardViewRow
        Caption = #52852#46300' '#44148#49688
        DataBinding.FieldName = 'CNT_CARD'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
      object GridDBCardViewCardAmt: TcxGridDBCardViewRow
        Caption = #49888#50857#52852#46300
        DataBinding.FieldName = 'AMT_CARD'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
      object GridDBCardViewCreditAmt: TcxGridDBCardViewRow
        Caption = #50808#49345
        DataBinding.FieldName = 'AMT_TRUST'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
      object GridDBCardViewGiftCardAmt: TcxGridDBCardViewRow
        Caption = #49345#54408#44428
        DataBinding.FieldName = 'AMT_GIFT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
      object GridDBCardViewBankAmt: TcxGridDBCardViewRow
        Caption = #44228#51340#51077#44552
        DataBinding.FieldName = 'AMT_BANK'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
      end
      object GridDBCardViewPointAmt: TcxGridDBCardViewRow
        Caption = #54252#51064#53944
        DataBinding.FieldName = 'AMT_POINT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Position.BeginsLayer = True
      end
      object GridDBCardViewLetsOrderAmt: TcxGridDBCardViewRow
        Caption = #47131#52768#50724#45908
        DataBinding.FieldName = 'AMT_LETSORDER'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Position.BeginsLayer = True
      end
      object GridDBCardViewDepositCheckAmt: TcxGridDBCardViewRow
        Caption = #49688#54364#44552#50529
        DataBinding.FieldName = '_CHECK'
        CaptionAlignmentHorz = taRightJustify
        Position.BeginsLayer = True
      end
      object GridDBCardViewDeposit50000Amt: TcxGridDBCardViewRow
        Caption = #50724#47564#50896
        DataBinding.FieldName = '_50000'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
      object GridDBCardViewDeposit10000Amt: TcxGridDBCardViewRow
        Caption = #47564#50896
        DataBinding.FieldName = '_10000'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
      object GridDBCardViewDeposit5000Amt: TcxGridDBCardViewRow
        Caption = #50724#52380#50896
        DataBinding.FieldName = '_5000'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
      object GridDBCardViewDeposit1000Amt: TcxGridDBCardViewRow
        Caption = #52380#50896
        DataBinding.FieldName = '_1000'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
      object GridDBCardViewDeposit500Amt: TcxGridDBCardViewRow
        Caption = #50724#48177#50896
        DataBinding.FieldName = '_500'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
      object GridDBCardViewDeposit100Amt: TcxGridDBCardViewRow
        Caption = #48177#50896
        DataBinding.FieldName = '_100'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
      object GridDBCardViewDeposit50Amt: TcxGridDBCardViewRow
        Caption = #50724#49901#50896
        DataBinding.FieldName = '_50'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
      object GridDBCardViewDeposit10Amt: TcxGridDBCardViewRow
        Caption = #49901#50896
        DataBinding.FieldName = '_10'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
      object GridDBCardViewCloseAmt: TcxGridDBCardViewRow
        Caption = #47560#44048#49884#51116
        DataBinding.FieldName = 'AMT_CLOSE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Options.Editing = False
        Options.Filtering = False
        Position.BeginsLayer = True
      end
      object GridDBCardViewLackAmt: TcxGridDBCardViewRow
        Caption = #44284#48512#51313#44552#50529
        DataBinding.FieldName = 'AMT_LACK'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Options.Editing = False
        Options.Filtering = False
        Position.BeginsLayer = True
        Styles.Content = StyleFontRed
      end
      object GridDBCardViewCustomerQty: TcxGridDBCardViewRow
        Caption = #44061#49688
        DataBinding.FieldName = 'CNT_CUSTOMER'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
      object GridDBCardViewCustomerAmt: TcxGridDBCardViewRow
        Caption = #44061#45800#44032
        DataBinding.FieldName = 'AMT_CUSTOMER'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
      object GridDBCardViewDCAmt: TcxGridDBCardViewRow
        Caption = #54624#51064#44552#50529
        DataBinding.FieldName = 'DC_TOT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
      object GridDBCardViewCancelAmt: TcxGridDBCardViewRow
        Caption = #51204#54364#52712#49548
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = ''
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
      object GridDBCardViewModifyAmt: TcxGridDBCardViewRow
        Caption = #51221#51221
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = ''
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        CaptionAlignmentHorz = taRightJustify
        Options.Filtering = False
        Position.BeginsLayer = True
        VisibleForCustomization = False
      end
    end
    inherited GridLevel: TcxGridLevel
      inherited GridSubLevel: TcxGridLevel
        GridView = GridDBCardView
      end
    end
  end
  inherited EditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited ButtonToolBarPrintButtonImageList: TImageList
    Bitmap = {
      494C010103000800380110001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000300000022000000100000000C0000
      000000000000000000000000000000000000000000000000000102010136110E
      0E74120F0F770B090969040404550302023B0101012700000012000000050000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000020000
      00080000001000000029000000330000000B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00020000000000000000000000000000002704050568030302520806064F0303
      032B0000000E00000001000000000000000000000000000000061B16167ACEB2
      B4F5FDDDDFFFF2D2D4FFDEBFC2FFB1989AF3706060D33B3232AE1D1819850907
      07580101012B0000000900000000000000000000000000000001000000030000
      00060000000B000000140000002000000030010101450303035B0A0A0A751717
      18902A2A2CA9525454CE242625B4000000200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000010101340808
      087C0202025F0000002A0101013D434646BBA5A29BF19D9689E9B6B4B2E88987
      84CE494542A41C1A19700C0B0A480201011C00000000000000000000001B1811
      128C554344C6897071DEE8D0D1FCFFF0F0FFFFE9EAFFFFE3E6FFFBDADCFFDCC3
      C5FF857A7AD92D27279E000000330000000505130962070D096F070707780F10
      0F881B1D1C9C292C2AAE464547C26C6B6ED6919697E8B9C0C0F9CDD7D5FFD2DB
      D5FFCDE1D6FFFFFFFFFF737575D7000000270000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000030000004B313131D48183
      83FF5D5D5DF7242424CF555656DFDFCFBDFFFFE8C7FFFFFFF0FFFFFFFFFFFFFF
      FFFFFFFFFFFFF0F2F4FFC1B9B3F70E0C0B61000000000000000A131010764D3E
      41B73E2A2EAB442F34BAC3B2B8F5F6E9ECFFF4D6D7FFF6D1D3FFC3A2A3EF947F
      80D9C0AFB1E8C8ADAFF5080607640000000C5A9B71EFB0C8BAFFC9CCCBFFCEDA
      D5FFD7E5DEFFECFAF6FFD6EBDEFFBDD9C5FFACD3B9FFD8EEE1FFA8D2B3FF4F92
      56FF347939FFB1D4B9FF828486DE0000002E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000003E373635DD9F9FA1FFC8C9
      CAFFC7C8C7FFB0B2B4FF949393FF9F8773FFB89D85FECCB59FFEE0C8B1FEF4E3
      D0FEFFF6E5FFF1E7E0FF474747B60000002D0000000000000020866D71DAFDF8
      EFFFABC2B2F7A2A19AEEDDBDC1FCECCFDCFFECCFDDFFE8C7D4FF5F4B51D10B07
      07770604045E020101370000000B0000000055926AEBC7DFD1FFE7FAF1FF79B9
      90FF68A97CFFBBD8C6FF7EB88FFF348847FF2C7E3EFF8DB596FF89BA93FF297E
      32FF33823AFFB0D5B8FF9B9F9FEA0101013B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000009090970939594FFC3C6C5FFD1D1
      D2FFDEDFDFFFD9DEDFFFBEC1C3FFABB0B4FFA6B0B4FFA1A19EFFA29B95FFA191
      80FFA38F7BFF7B7170FD07070871000000000000000001000131997C83DEE3D0
      ABFF6F9A49FF97A852FFF2A55BFFF4AA74FFF2BA98FFF0C2B5FFC1A1A2F27060
      68CD302F31A811111083030202430000001C407E54E096BCA3FFC9E8D7FF4AA1
      68FF42975EFFA8CAB5FFABD5B8FF8DCA9DFF97CBA4FFB9D7C4FFD4EADDFFB4D3
      BCFFABCAB4FFDCF0E5FFACB3B3F3020202470000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A0A0A6BACB0AFFED5DAD9FFE7E7
      E7FEEEF5F8FEDED7D4FEBF7857FEB36946FEB58A79FEBBB1AEFEB4B5B5FEB6B3
      BCFEA2A7A4FE6AA869FF111B119E0000000C0000000205030343AC9095EAFBBC
      95FFBEAE76FFBCA761FFDF7B11FFE38017FFE78923FFEC9033FFF59E4BFFFEB2
      70FFEDBD86FFEDD8BFFF3F3438B20603045D3E7E53E2699E79FFEAF5ECFFDBEF
      E3FFDCEEE3FFF6FBF9FFE2ECE8FF9DA7A1FF9EA9A2FFF1FAF9FFC6DECEFF6B9E
      74FF46834EFF8FB696FFC1C8C7FC040404560000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000606065EB7BBB9FBF5F7F7FFF6F6
      F7FFF9FFFFFFEBC7ACFFD36625FFCA5716FFC25319FFBB5625FFB4572AFFBE87
      71FFD6D6D6FFD3F1D9FF2126219D0000000C000000060B090954C7A8AAF6FAB8
      8DFFE9C79BFFE5BE8CFFD97A1BFFDA7917FFDA7A18FFDC7C18FFDD801AFFE280
      16FFE98516FFFFD0A1FF42393DB10403035748875DE2649F7AFFE8F1EAFFD8E6
      DFFFA1C6B0FFA2C7B0FF527157FF141B14FF49684FFFDBEAE1FFBDDAC4FF4593
      52FF34823CFF85B58CFFCED9D6FF070707630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000010202478A8B8BE4EFF0F0FFE3EC
      F2FFE7DCD3FEE8995EFEE88336FEE5853EFEE17E39FEDA7430FECF5A13FEC96C
      36FEEAE0D9FFFFFFFFFF1C1B1C8A000000050000000A0D0B0C63F2C7C4FFDAA9
      77FF84987EFFAB9869FFDB7B1DFFDD7D1DFFDD8223FFDE8628FFDE8A2CFFDC86
      26FFE08B27FFFFCDA4FF2F282BA101010141508E67E270AB8AFFDDECE4FFD8E9
      E0FF7ABB92FF338450FF002F05FF4B6C53FFCCE0D2FFDDEDE3FFDFF0E7FFC3DE
      CAFFBBD5C2FFD1E7DAFFDCE8E4FF0A0A0A720000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000070304044A52575BC7C9CA
      CAFFCC8C66FFCC6524FFD5712EFFDE7934FFE58138FFEB873AFFEE8739FFF2BE
      98FFFFFFFFFFD9DBDCFB06060658000000000000001314111278FFD1C7FFC8A9
      7EFF42BECCFF64B7B6FFD4822AFFE28220FFE08A2DFFE29134FFE4973AFFE294
      34FFEA9E3DFFFFD4B3FF231E20930000003158946DE274AC8BFFCBE2D4FFFFFF
      FFFFD5E8DEFF2A734BFF024C1BFF639875FFD9E4DCFFFEFEFFFFDEEDE5FF8CB5
      94FF4F8A5AFF679B70FFD5E6DDFF111112830000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000008060548B99C
      81EBE0C1A4FFD5A586FFCF936DFFC68155FFC67544FFCE7237FFD79363FFECE5
      E0FFECEDEEFF333232A200000013000000000000002A241F2191FFDAD2FFD89D
      62FFB89F75FFC29456FFDA8527FFE18B2CFFE39438FFE69C40FFE9A347FFE7A0
      42FFF1AF52FFFCD7BCFF171416820000001F659E7AE586B498FFC7E0D0FFFAFC
      FBFF75AE93FF096839FF64A481FF5EA874FF5C986EFFC9DAD0FFDFEDE4FF67A9
      75FF3D8E4AFF6BA473FFDEF0E6FF1D1D1D980000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000C070344CDAE
      93E9FFFEECFFFFEDD3FFFCE4CAFFEDD9BEFFE3C8AEFF705A4ECE1D1E1E872A2D
      2F952424248D00000021000000000000000002010140352F31A1FFDACEFFDD8D
      47FFE19353FFE48D40FFE08625FFE29336FFE59D43FFE9A64DFFEDAE56FFEBAD
      51FFF8C16CFFF5DBC7FF0F0E0F74000000125B906ED9A8C6B4FFC5DDCEFFEFF9
      F6FF6FB393FF80BBA0FFF2FAF5FFD1EBDAFFA7CFB4FFBCD6C5FFEAF6F2FFDBEF
      E2FFD4EADBFFC1D0C7EEBBBFBDDD1414146B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000201001D83644BC0FFFF
      FFFFFFFFFFFFFFF8EEFFFFF3E3FFFFF8E7FFCCB499E606050434000000010000
      0007000000030000000000000000000000000B090A63544F52B7FFDDCDFFDA7E
      2EFFDA8C35FFD88F3CFFDA7E15FFE08D24FFE49A35FFE9A745FFEEB253FFEEB4
      53FFFECF7CFFEBD9CBFF0A090A650000000A1F472C9DC9DCD1FFC7D9CEFFE1F1
      E8FFE7F4ECFFEFF5F2FFE9F1EDFFE6F0ECFFE5EFEBFFD5E8DEFFC8DFD3FFDFEB
      E6FFB8D0C0FC353F3A8A0A0A0A350000000F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000003020124644E3FABA08F
      82D2BCAC9FE2E0DAD5F3FEFBF9FFFEFCFAFF4C37269600000000000000000000
      000000000000000000000000000000000000100E0E73615C5EC8FFF6F3FFFFCB
      ABFFFDC59AFFFABE8BFFF8B878FFF6B771FFF3B96EFFF3BD6DFFF3C06DFFF3BE
      5EFFFFDC8BFFD6CCC2FD0B090A5D000000080108033A7FAF8EE8EEEAEEFFD2DF
      D6FFCEDED2FFCADCCFFFBFD7C8FFBFD7C8FFC0D6C8FFBED5C7FFB9D3C2FFD0DE
      D5FF9CBFA9F90A120C5900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000004010100180503
      022909050238190F075C46332493655242AB0703013200000000000000000000
      000000000000000000000000000000000000000000240A08084F2F292B8F3D36
      39AA63555AC1867778D7B09A9DEDE2C3C1FFF5D5CFFFFEDDD4FFFFE3D5FFFFE4
      CAFFFFFEE6FFBCB2B1F50504044A000000030000000205160A5B7EAD8DE6E7EC
      E9FFEDEBECFFE8EAE7FFE9EBE8FFE9EBE9FFE9ECE9FFEAEDEBFFEAEDEBFFFCF9
      FCFFDAE9E2FD08150B6600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000E0C0602411A120B5C0100001400000000000000000000
      0000000000000000000000000000000000000000000000000000000000070000
      00110000001D020202290605053508070743050405550B090A62110E0F6E1714
      157A1B1819810907085B0000000F000000000000000000000001010804392045
      2C9B699878DA86B093E682AA8EE482A78EE480A78CE47FA68BE47DA188E290B3
      9BEC7BA788EB0411085D00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  inherited dxComponentPrinter: TdxComponentPrinter
    inherited dxComponentPrinter1Link1: TdxGridReportLink
      PrinterPage.PageHeader.CenterTitle.Strings = (
        'POS '#47560#44048' '#51312#54924
        '')
      ReportDocument.CreationDate = 40423.406033703700000000
      BuiltInReportLink = True
    end
  end
end
