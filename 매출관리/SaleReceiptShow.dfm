inherited SaleReceiptShowForm: TSaleReceiptShowForm
  Left = 300
  Top = 120
  Caption = #50689#49688#51613#48324' '#47588#52636' '#51312#54924
  ClientHeight = 808
  ClientWidth = 1239
  HelpFile = #54980#48169'/'#47588#52636#44288#47532'/'#54032#47588'_'#44048#49324#51088#47308'_'#51312#54924'.htm'
  ExplicitWidth = 1255
  ExplicitHeight = 847
  PixelsPerInch = 96
  TextHeight = 17
  object GridSplitter: TAdvSplitter [0]
    Left = 136
    Top = 149
    Width = 6
    Height = 659
    AutoSnap = False
    MinSize = 50
    Appearance.BorderColor = clNone
    Appearance.BorderColorHot = clNone
    Appearance.Color = 14542308
    Appearance.ColorTo = 16768709
    Appearance.ColorHot = 15383705
    Appearance.ColorHotTo = 14922381
    GripStyle = sgFlatDots
    ExplicitTop = 41
    ExplicitHeight = 547
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1239
    ExplicitWidth = 1239
    inherited ButtonToolBar: TAdvToolBar
      Left = 951
      ExplicitLeft = 951
    end
    inherited ConditionToolBar: TAdvToolBar
      Width = 605
      ExplicitWidth = 605
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
        Caption = #50689#49688#51613#48264#54840
        Visible = True
        ExplicitWidth = 75
        ExplicitHeight = 24
        Height = 24
        Width = 75
        AnchorX = 453
        AnchorY = 14
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Left = 546
        ExplicitLeft = 546
        ExplicitWidth = 55
        Width = 55
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 490
        Visible = True
        ExplicitLeft = 490
        ExplicitWidth = 56
        Width = 56
      end
      inherited ConditionToolbarMonthRadioButton: TcxRadioButton
        TabOrder = 8
        Visible = True
      end
      inherited ConditionToolbarTodayRadioButton: TcxRadioButton
        TabOrder = 7
        Visible = True
      end
      inherited ConditionToolbarWeekRadioButton: TcxRadioButton
        Visible = True
      end
    end
  end
  inherited Grid: TcxGrid
    Left = 145
    Top = 152
    Width = 1091
    Height = 653
    ExplicitLeft = 145
    ExplicitTop = 152
    ExplicitWidth = 1091
    ExplicitHeight = 653
    inherited GridDBTableView: TcxGridDBTableView
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridDBTableViewDCAmt
        end
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
          Column = GridDBTableViewPoint
        end
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
        end
        item
          Format = ',0'#44148
          Kind = skCount
          Position = spFooter
          Column = GridDBTableViewBillNo
        end
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridDBTableViewTotAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'#44148
          Kind = skCount
          Column = GridDBTableViewBillNo
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewTotAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewDCAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewServiceAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewSaleAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewPerson
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewPoint
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewStamp
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewCashAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewCardAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewLetsOrderAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewTrustAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewPointAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewBankAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewGiftAmt
        end>
      OptionsData.DeletingConfirmation = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfAlwaysVisible
      Styles.ContentEven = StyleEven
      Styles.OnGetContentStyle = GridDBTableViewStylesGetContentStyle
      OnColumnHeaderClick = GridDBTableViewColumnHeaderClick
      object GridDBTableViewPosNo: TcxGridDBColumn
        Caption = 'POS'
        DataBinding.FieldName = 'NO_POS'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 50
      end
      object GridDBTableViewBillNo: TcxGridDBColumn
        Caption = #50689#49688#51613
        DataBinding.FieldName = 'NO_RCP'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Grouping = False
        Options.Moving = False
        Width = 60
      end
      object GridDBTableViewType: TcxGridDBColumn
        Caption = #44396#48516
        DataBinding.FieldName = 'DS_SALE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 60
      end
      object GridDBTableViewTotAmt: TcxGridDBColumn
        Caption = #52509#54032#47588#44552#50529
        DataBinding.FieldName = 'AMT_SALE_TOT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 91
      end
      object GridDBTableViewDCAmt: TcxGridDBColumn
        Caption = #54624#51064#44552#50529
        DataBinding.FieldName = 'DC_TOT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Grouping = False
        Options.Moving = False
        Styles.Content = StyleFontRed
        Width = 80
      end
      object GridDBTableViewServiceAmt: TcxGridDBColumn
        Caption = #49436#48708#49828#44552#50529
        DataBinding.FieldName = 'AMT_SERVICE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 89
      end
      object GridDBTableViewSaleAmt: TcxGridDBColumn
        Caption = #47588#52636#44552#50529
        DataBinding.FieldName = 'AMT_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Grouping = False
        Options.Moving = False
        Styles.Content = StyleFontBlackBold
        Width = 90
      end
      object GridDBTableViewTable: TcxGridDBColumn
        Caption = #53580#51060#48660
        DataBinding.FieldName = 'NO_TABLE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 70
      end
      object GridDBTableViewDeliveryNo: TcxGridDBColumn
        Caption = #48176#45804#48264#54840
        DataBinding.FieldName = 'NO_DELIVERY'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 105
      end
      object GridDBTableViewPayType: TcxGridDBColumn
        Caption = #44208#51228#49688#45800
        DataBinding.FieldName = 'PAY_TYPE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 76
      end
      object GridDBTableViewPerson: TcxGridDBColumn
        Caption = #44256#44061#49688
        DataBinding.FieldName = 'CNT_PERSON'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
      end
      object GridDBTableViewMemberType: TcxGridDBColumn
        Caption = #44256#44061
        DataBinding.FieldName = 'MEMBER_TYPE'
        HeaderAlignmentHorz = taCenter
        Width = 90
      end
      object GridDBTableViewPoint: TcxGridDBColumn
        Caption = #51201#47549#54252#51064#53944
        DataBinding.FieldName = 'PNT_OCCUR'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Grouping = False
        Options.Moving = False
        Width = 86
      end
      object GridDBTableViewStamp: TcxGridDBColumn
        Caption = #51201#47549#49828#53596#54532
        DataBinding.FieldName = 'SAVE_STAMP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 87
      end
      object GridDBTableViewCashierName: TcxGridDBColumn
        Caption = #44228#49328#50896
        DataBinding.FieldName = 'NM_SAWON'
        HeaderAlignmentHorz = taCenter
        Width = 80
      end
      object GridDBTableViewDamdang: TcxGridDBColumn
        Caption = #45812#45817#51088
        DataBinding.FieldName = 'NM_DAMDANG'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 81
      end
      object GridDBTableViewComeTime: TcxGridDBColumn
        Caption = #51077#51109#49884#44036
        DataBinding.FieldName = 'COME_TIME'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 86
      end
      object GridDBTableViewExitTime: TcxGridDBColumn
        Caption = #53748#51109#49884#44036
        DataBinding.FieldName = 'SALE_TIME'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 84
      end
      object GridDBTableViewStayTime: TcxGridDBColumn
        Caption = #52404#47448#49884#44036'('#48516')'
        DataBinding.FieldName = 'STAY_TIME'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 94
      end
      object GridDBTableViewChangeDate: TcxGridDBColumn
        Caption = #52572#51333#48320#44221#51068#49884
        DataBinding.FieldName = 'DT_CHANGE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Grouping = False
        Options.Moving = False
        Width = 93
      end
      object GridDBTableViewWhyCancel: TcxGridDBColumn
        Caption = #52712#49548#49324#50976
        DataBinding.FieldName = 'CANCEL_TXT'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 131
      end
      object GridDBTableViewOrgRcp: TcxGridDBColumn
        Caption = #50896#50689#49688#51613
        DataBinding.FieldName = 'NO_RCP_ORG'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 81
      end
      object GridDBTableViewCashAmt: TcxGridDBColumn
        Caption = #54788#44552
        DataBinding.FieldName = 'AMT_CASH'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
      end
      object GridDBTableViewCardAmt: TcxGridDBColumn
        Caption = #52852#46300
        DataBinding.FieldName = 'AMT_CARD'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
      end
      object GridDBTableViewLetsOrderAmt: TcxGridDBColumn
        Caption = #47131#52768#50724#45908
        DataBinding.FieldName = 'AMT_LETSORDER'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 78
      end
      object GridDBTableViewTrustAmt: TcxGridDBColumn
        Caption = #50808#49345
        DataBinding.FieldName = 'AMT_TRUST'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
      end
      object GridDBTableViewPointAmt: TcxGridDBColumn
        Caption = #54252#51064#53944
        DataBinding.FieldName = 'AMT_POINT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
      end
      object GridDBTableViewBankAmt: TcxGridDBColumn
        Caption = #44228#51340#51077#44552
        DataBinding.FieldName = 'AMT_BANK'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
      end
      object GridDBTableViewGiftAmt: TcxGridDBColumn
        Caption = #49345#54408#44428
        DataBinding.FieldName = 'AMT_GIFT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
      end
      object GridDBTableViewLetsOrder: TcxGridDBColumn
        Tag = 99
        DataBinding.FieldName = 'YN_LETSORDER'
        Visible = False
      end
    end
    inherited GridSubDBTableView: TcxGridDBTableView
      Tag = 99
      DataController.DetailKeyFieldNames = 'LINK'
      DataController.MasterKeyFieldNames = 'LINK'
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = GridSubDBTableViewVatAmt
        end>
      OptionsData.DeletingConfirmation = False
      Styles.ContentEven = StyleEven
      OnColumnSizeChanged = GridTableViewColumnSizeChanged
      object GridSubDBTableViewMenuCode: TcxGridDBColumn
        Caption = #47700#45684#53076#46300
        DataBinding.FieldName = 'CD_MENU'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 110
      end
      object GridSubDBTableViewMenuName: TcxGridDBColumn
        Caption = #47700#45684#51060#47492
        DataBinding.FieldName = 'NM_MENU'
        HeaderAlignmentHorz = taCenter
        Width = 200
      end
      object GridSubDBTableViewSalePrice: TcxGridDBColumn
        Caption = #54032#47588#45800#44032
        DataBinding.FieldName = 'PR_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 70
      end
      object GridSubDBTableViewSaleQty: TcxGridDBColumn
        Caption = #49688#47049
        DataBinding.FieldName = 'QTY_SALE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 40
      end
      object GridSubDBTableViewSaleAmt: TcxGridDBColumn
        Caption = #47588#52636#44552#50529
        DataBinding.FieldName = 'AMT_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 80
      end
      object GridSubDBTableViewVatAmt: TcxGridDBColumn
        Caption = #48512#44032#49464
        DataBinding.FieldName = 'AMT_VAT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 80
      end
      object GridSubDBTableViewDCAmt: TcxGridDBColumn
        Caption = #54624#51064#44552#50529
        DataBinding.FieldName = 'DC_TOT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 70
      end
      object GridSubDBTableViewSaveStamp: TcxGridDBColumn
        Caption = #51201#47549#49828#53596#54532
        DataBinding.FieldName = 'SAVE_STAMP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
      end
      object GridSubDBTableViewUseStamp: TcxGridDBColumn
        Caption = #49324#50857#49828#53596#54532
        DataBinding.FieldName = 'USE_STAMP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
      end
    end
    object PayGridDBCardView: TcxGridDBCardView [3]
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DetailKeyFieldNames = 'LINK'
      DataController.MasterKeyFieldNames = 'LINK'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.RowFiltering = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.CardIndent = 7
      object PayGridDBCardViewCashAmt: TcxGridDBCardViewRow
        Caption = #54788#44552
        DataBinding.FieldName = 'AMT_CASH'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object PayGridDBCardViewCashReceiptAmt: TcxGridDBCardViewRow
        Caption = '('#54788#44552#50689#49688#51613')'
        DataBinding.FieldName = 'AMT_CASHRCP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
        Styles.Content = StyleFontGray
      end
      object PayGridDBCardViewCardAmt: TcxGridDBCardViewRow
        Caption = #49888#50857#52852#46300
        DataBinding.FieldName = 'AMT_CARD'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object PayGridDBCardViewLetsOrderAmt: TcxGridDBCardViewRow
        Caption = #47131#52768#50724#45908
        DataBinding.FieldName = 'AMT_LETSORDER'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object PayGridDBCardViewCheckAmt: TcxGridDBCardViewRow
        Caption = #49688#54364
        DataBinding.FieldName = 'AMT_CHECK'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object PayGridDBCardViewCreditAmt: TcxGridDBCardViewRow
        Caption = #50808#49345
        DataBinding.FieldName = 'AMT_TRUST'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object PayGridDBCardViewGiftCardAmt: TcxGridDBCardViewRow
        Caption = #49345#54408#44428
        DataBinding.FieldName = 'AMT_GIFT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object PayGridDBCardViewTipAmt: TcxGridDBCardViewRow
        Caption = #48393#49324#47308
        DataBinding.FieldName = 'AMT_TIP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object PayGridDBCardViewBankAmt: TcxGridDBCardViewRow
        Caption = #44228#51340#51077#44552
        DataBinding.FieldName = 'AMT_BANK'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object PayGridDBCardViewPointAmt: TcxGridDBCardViewRow
        Caption = #54252#51064#53944
        DataBinding.FieldName = 'AMT_POINT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
    end
    object CardGridDBCardView: TcxGridDBCardView [4]
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DetailKeyFieldNames = 'LINK'
      DataController.MasterKeyFieldNames = 'LINK'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.RowFiltering = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.CardIndent = 7
      OptionsView.CardWidth = 220
      object CardGridDBCardViewType: TcxGridDBCardViewRow
        Caption = #44396#12288#12288#48516
        DataBinding.FieldName = 'DS_TRD'
        Position.BeginsLayer = True
      end
      object CardGridDBCardViewCardNo: TcxGridDBCardViewRow
        Caption = #52852#46300#48264#54840
        DataBinding.FieldName = 'NO_CARD'
        Position.BeginsLayer = True
      end
      object CardGridDBCardViewApprovalAmt: TcxGridDBCardViewRow
        Caption = #49849#51064#44552#50529
        DataBinding.FieldName = 'AMT_APPROVAL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object CardGridDBCardViewTaxAmt: TcxGridDBCardViewRow
        Caption = #48512#44032#49464#44552#50529
        DataBinding.FieldName = 'AMT_VAT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object CardGridDBCardViewTipAmt: TcxGridDBCardViewRow
        Caption = #48393#49324#47308
        DataBinding.FieldName = 'AMT_TIP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object CardGridDBCardViewDcAmt: TcxGridDBCardViewRow
        Caption = #54624#51064#44552#50529
        DataBinding.FieldName = 'AMT_DC'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object CardGridDBCardViewHalbu: TcxGridDBCardViewRow
        Caption = #54624#48512#44592#44036
        DataBinding.FieldName = 'TERM_HALBU'
        Position.BeginsLayer = True
      end
      object CardGridDBCardViewApprovalNo: TcxGridDBCardViewRow
        Caption = #49849#51064#48264#54840
        DataBinding.FieldName = 'NO_APPROVAL'
        Position.BeginsLayer = True
      end
      object CardGridDBCardViewApprovalType: TcxGridDBCardViewRow
        Caption = #49849#51064#50976#54805
        DataBinding.FieldName = 'TYPE_TRD'
        Position.BeginsLayer = True
      end
      object CardGridDBCardViewCardName: TcxGridDBCardViewRow
        Caption = #48156#44553#49324#47749
        DataBinding.FieldName = 'NM_CARDPL'
        Position.BeginsLayer = True
      end
      object CardGridDBCardViewCardCompany: TcxGridDBCardViewRow
        Caption = #47588#51077#49324#47749
        DataBinding.FieldName = 'NM_CARD_BUY'
        Position.BeginsLayer = True
      end
      object CardGridDBCardViewJoinNo: TcxGridDBCardViewRow
        Caption = #44032#47609#48264#54840
        DataBinding.FieldName = 'NO_CHAINPL'
        Position.BeginsLayer = True
      end
      object CardGridDBCardViewApprovalDate: TcxGridDBCardViewRow
        Caption = #49849#51064#51068#49884
        DataBinding.FieldName = 'DT_APPROVAL'
        Position.BeginsLayer = True
      end
      object CardGridDBCardViewCorner: TcxGridDBCardViewRow
        Caption = #49849#51064#50629#51109
        DataBinding.FieldName = 'CORNER'
        PropertiesClassName = 'TcxTextEditProperties'
        Position.BeginsLayer = True
      end
    end
    object CashReceiptGridDBCardView: TcxGridDBCardView [5]
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DetailKeyFieldNames = 'LINK'
      DataController.MasterKeyFieldNames = 'LINK'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.RowFiltering = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.CardIndent = 7
      OptionsView.CardWidth = 220
      object CashReceiptGridDBCardViewType: TcxGridDBCardViewRow
        Caption = #44396#12288#12288#48516
        DataBinding.FieldName = 'DS_TRD'
        Position.BeginsLayer = True
      end
      object CashReceiptGridDBCardViewCustomer: TcxGridDBCardViewRow
        Caption = #50857#12288#12288#46020
        DataBinding.FieldName = 'DS_KIND'
        Position.BeginsLayer = True
      end
      object CashReceiptGridDBCardViewCardNo: TcxGridDBCardViewRow
        Caption = #49885#48324#48264#54840
        DataBinding.FieldName = 'NO_CARD'
        Position.BeginsLayer = True
      end
      object CashReceiptGridDBCardViewApprovalAmt: TcxGridDBCardViewRow
        Caption = #49849#51064#44552#50529
        DataBinding.FieldName = 'AMT_APPROVAL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object CashReceiptGridDBCardViewApprovalNo: TcxGridDBCardViewRow
        Caption = #49849#51064#48264#54840
        DataBinding.FieldName = 'NO_APPROVAL'
        Position.BeginsLayer = True
      end
      object CashReceiptGridDBCardViewApprovalDate: TcxGridDBCardViewRow
        Caption = #49849#51064#51068#49884
        DataBinding.FieldName = 'DT_APPROVAL'
        Position.BeginsLayer = True
      end
      object CashReceiptGridDBCardViewCorner: TcxGridDBCardViewRow
        Caption = #49849#51064#50629#51109
        DataBinding.FieldName = 'CORNER'
        Position.BeginsLayer = True
      end
    end
    object MemberGridDBCardView: TcxGridDBCardView [6]
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DetailKeyFieldNames = 'LINK'
      DataController.MasterKeyFieldNames = 'LINK'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.RowFiltering = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.CardIndent = 7
      object MemberGridDBCardViewMemberNo: TcxGridDBCardViewRow
        Caption = #54924#50896#12288#48264#54840
        DataBinding.FieldName = 'CD_MEMBER'
        Position.BeginsLayer = True
      end
      object MemberGridDBCardViewMemberName: TcxGridDBCardViewRow
        Caption = #54924#50896#12288#51060#47492
        DataBinding.FieldName = 'NM_MEMBER'
        Position.BeginsLayer = True
      end
      object MemberGridDBCardViewCardNo: TcxGridDBCardViewRow
        Caption = #52852#46300#12288#48264#54840
        DataBinding.FieldName = 'NO_CARD'
        Position.BeginsLayer = True
      end
      object MemberGridDBCardViewTelNo: TcxGridDBCardViewRow
        Caption = #51204#54868#12288#48264#54840
        DataBinding.FieldName = 'TEL_MOBILE'
        Position.BeginsLayer = True
      end
      object MemberGridDBCardViewCreditAmt: TcxGridDBCardViewRow
        Caption = #50808#49345#12288#44552#50529
        DataBinding.FieldName = 'AMT_TRUST'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object MemberGridDBCardViewUsePoint: TcxGridDBCardViewRow
        Caption = #49324#50857#54252#51064#53944
        DataBinding.FieldName = 'AMT_POINT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object MemberGridDBCardViewSavePoint: TcxGridDBCardViewRow
        Caption = #51201#47549#54252#51064#53944
        DataBinding.FieldName = 'PNT_OCCUR'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
    end
    object DCGridDBCardView: TcxGridDBCardView [7]
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DetailKeyFieldNames = 'LINK'
      DataController.MasterKeyFieldNames = 'LINK'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.RowFiltering = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.CardIndent = 7
      object DCGridDBCardViewMenuDC: TcxGridDBCardViewRow
        Caption = #47700#45684' '#54624#51064
        DataBinding.FieldName = 'DC_MENU'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object DCGridDBCardViewMemberDC: TcxGridDBCardViewRow
        Caption = #54924#50896' '#54624#51064
        DataBinding.FieldName = 'DC_MEMBER'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object DCGridDBCardViewReceiptDC: TcxGridDBCardViewRow
        Caption = #50689#49688#51613' '#54624#51064
        DataBinding.FieldName = 'DC_RECEIPT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object DCGridDBCardViewCutDC: TcxGridDBCardViewRow
        Caption = #50896#45800#50948' '#51208#49324
        DataBinding.FieldName = 'DC_CUT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object DCGridDBCardViewPointDC: TcxGridDBCardViewRow
        Caption = #54252#51064#53944#54624#51064
        DataBinding.FieldName = 'DC_POINT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object DCGridDBCardViewCodeDcCode: TcxGridDBCardViewRow
        Caption = #51648#51221#54624#51064#47749
        DataBinding.FieldName = 'CD_CODE'
        Position.BeginsLayer = True
      end
      object DCGridDBCardViewCodeDC: TcxGridDBCardViewRow
        Caption = #51648#51221#54624#51064
        DataBinding.FieldName = 'DC_CODE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object DCGridDBCardViewVatDC: TcxGridDBCardViewRow
        Caption = #48512#44032#49464#54624#51064
        DataBinding.FieldName = 'DC_VAT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object DCGridDBCardViewSpcDC: TcxGridDBCardViewRow
        Caption = #54665#49324' '#54624#51064
        DataBinding.FieldName = 'DC_SPC'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object DCGridDBCardViewEventDC: TcxGridDBCardViewRow
        Caption = #50689#49688#51613#48324#54665#49324
        DataBinding.FieldName = 'DC_EVENT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object DCGridDBCardViewCouponDC: TcxGridDBCardViewRow
        Caption = #53216#54256#54624#51064
        DataBinding.FieldName = 'DC_COUPON'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object DCGridDBCardViewStampDc: TcxGridDBCardViewRow
        Caption = #49828#53596#54532#54624#51064
        DataBinding.FieldName = 'DC_STAMP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object DCGridDBCardViewTaxFreeDc: TcxGridDBCardViewRow
        Caption = 'TaxFree'#54624#51064
        DataBinding.FieldName = 'DC_TAXFREE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object DCGridDBCardViewUPlusDC: TcxGridDBCardViewRow
        Caption = #50976#54540#47084#49828' '#54624#51064
        DataBinding.FieldName = 'DC_UPLUS'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object DCGridDBCardViewKaKaoDc: TcxGridDBCardViewRow
        Caption = #52852#52852#50724#54624#51064
        DataBinding.FieldName = 'DC_KAKAO'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
      object DCGridDBCardViewLetsOrderDc: TcxGridDBCardViewRow
        Caption = #47131#52768#50724#45908
        DataBinding.FieldName = 'DC_LETSORDER'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0'
        Position.BeginsLayer = True
      end
    end
    object PrintGridDBCardView: TcxGridDBCardView [8]
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DetailKeyFieldNames = 'LINK'
      DataController.MasterKeyFieldNames = 'LINK'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.CardIndent = 7
      object PrintGridDBCardViewPrintName: TcxGridDBCardViewRow
        Caption = #54532#47536#53552#47749
        DataBinding.FieldName = 'PRT_NAME'
        Position.BeginsLayer = True
      end
      object PrintGridDBCardViewOrderNo: TcxGridDBCardViewRow
        Caption = #51452#47928#48264#54840
        DataBinding.FieldName = 'NO_ORDER'
        Position.BeginsLayer = True
      end
      object PrintGridDBCardViewOrderTime: TcxGridDBCardViewRow
        Caption = #51452#47928#49884#44036
        DataBinding.FieldName = 'ORDER_TIME'
        Position.BeginsLayer = True
      end
      object PrintGridDBCardViewDamDang: TcxGridDBCardViewRow
        Caption = #51452#47928#45812#45817
        DataBinding.FieldName = 'NM_SAWON'
        Position.BeginsLayer = True
      end
      object PrintGridDBCardViewPrintTxt: TcxGridDBCardViewRow
        Caption = #52636#47141#45236#50669
        DataBinding.FieldName = 'PRINT_DATA'
        Position.BeginsLayer = True
      end
    end
    object CancelGridDBTableView: TcxGridDBTableView [9]
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DetailKeyFieldNames = 'LINK'
      DataController.MasterKeyFieldNames = 'LINK'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object CancelGridDBTableViewMenuCode: TcxGridDBColumn
        Caption = #47700#45684#53076#46300
        DataBinding.FieldName = 'CD_MENU'
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
      end
      object CancelGridDBTableViewMenuName: TcxGridDBColumn
        Caption = #47700#45684#47749
        DataBinding.FieldName = 'NM_MENU'
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
      end
      object CancelGridDBTableViewCancelQty: TcxGridDBColumn
        Caption = #49688#47049
        DataBinding.FieldName = 'QTY_CANCEL'
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
      end
      object CancelGridDBTableViewFloor: TcxGridDBColumn
        Caption = #52789
        DataBinding.FieldName = 'NM_FLOOR'
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
      end
      object CancelGridDBTableViewTableName: TcxGridDBColumn
        Caption = #53580#51060#48660
        DataBinding.FieldName = 'NM_TABLE'
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
      end
      object CancelGridDBTableViewOrderTime: TcxGridDBColumn
        Caption = #51452#47928#51068#49884
        DataBinding.FieldName = 'DT_ORDER'
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
      end
      object CancelGridDBTableViewCancelTime: TcxGridDBColumn
        Caption = #52712#49548#51068#49884
        DataBinding.FieldName = 'DT_CANCEL'
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
      end
      object CancelGridDBTableViewPosNo: TcxGridDBColumn
        Caption = #52712#49548#54252#49828
        DataBinding.FieldName = 'NO_POS'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
      end
      object CancelGridDBTableViewSawon: TcxGridDBColumn
        Caption = #52712#49548#49324#50896
        DataBinding.FieldName = 'NM_SAWON'
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
      end
      object CancelGridDBTableViewCancelTxt: TcxGridDBColumn
        Caption = #52712#49548#49324#50976
        DataBinding.FieldName = 'CANCEL_TXT'
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
      end
    end
    object LetsOrderSyncDBCardView: TcxGridDBCardView [10]
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DetailKeyFieldNames = 'LINK'
      DataController.MasterKeyFieldNames = 'LINK'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.CardIndent = 7
      object LetsOrderSyncDBCardViewOrderTime: TcxGridDBCardViewRow
        Caption = #51452#47928#51068#49884
        DataBinding.FieldName = 'ORDER_TIME'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.EditMask = '0000\-00\-00\ 00:00;1;_'
        Position.BeginsLayer = True
        Styles.Content = StyleLetsOrderSync
      end
      object LetsOrderSyncDBCardViewOrderTelNo: TcxGridDBCardViewRow
        Caption = #51452#47928#51204#54868
        DataBinding.FieldName = 'TEL_MOBILE'
        PropertiesClassName = 'TcxLabelProperties'
        Position.BeginsLayer = True
        Styles.Content = StyleLetsOrderSync
      end
      object LetsOrderSyncDBCardViewOrderNo: TcxGridDBCardViewRow
        Caption = #51452#47928#48264#54840
        DataBinding.FieldName = 'NO_ORDER'
        PropertiesClassName = 'TcxLabelProperties'
        Position.BeginsLayer = True
        Styles.Content = StyleLetsOrderSync
      end
      object LetsOrderSyncDBCardViewOrderMenu: TcxGridDBCardViewRow
        Caption = #51452#47928#47700#45684
        DataBinding.FieldName = 'PRINT_DATA'
        PropertiesClassName = 'TcxMemoProperties'
        Position.BeginsLayer = True
        Position.LineCount = 5
        Position.Width = 350
        Styles.Content = StyleLetsOrderSync
      end
    end
    inherited GridLevel: TcxGridLevel
      Options.DetailTabsPosition = dtpTop
      inherited GridSubLevel: TcxGridLevel
        Caption = ' '#47700#45684#45236#50669'  '
      end
      object PayGridLevel: TcxGridLevel
        Caption = ' '#44208#51228#45236#50669' '
        GridView = PayGridDBCardView
      end
      object CardGridLevel: TcxGridLevel
        Caption = ' '#49888#50857#52852#46300' '
        GridView = CardGridDBCardView
      end
      object CashReceiptGridLevel: TcxGridLevel
        Caption = ' '#54788#44552#50689#49688#51613' '
        GridView = CashReceiptGridDBCardView
      end
      object MemberGridLevel: TcxGridLevel
        Caption = ' '#54924#50896' '
        GridView = MemberGridDBCardView
      end
      object DCGridLevel: TcxGridLevel
        Caption = ' '#54624#51064' '
        GridView = DCGridDBCardView
      end
      object PrintGridLevel: TcxGridLevel
        Caption = ' '#52636#47141#45236#50669
        GridView = PrintGridDBCardView
      end
      object CancelGridLevel: TcxGridLevel
        Caption = ' '#52712#49548#45236#50669
        GridView = CancelGridDBTableView
      end
      object LetsOrderSyncGridLevel: TcxGridLevel
        Caption = ' '#47131#52768#50724#45908#49905#53356' '
        GridView = LetsOrderSyncDBCardView
      end
    end
  end
  object ConditionPanel: TAdvPanel [3]
    Left = 0
    Top = 65
    Width = 1239
    Height = 84
    Align = alTop
    DockSite = True
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    UseDockManager = True
    Version = '2.5.11.0'
    AutoHideChildren = False
    BorderColor = clBlack
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.CloseColor = clHighlight
    Caption.Font.Charset = HANGEUL_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -13
    Caption.Font.Name = #47569#51008' '#44256#46357
    Caption.Font.Style = [fsBold]
    Caption.Indent = 0
    Caption.MinMaxButton = True
    Caption.MinMaxCaption = True
    Caption.Text = #49345#49464#51312#54924' '#51312#44148#51008' '#50668#44592#47484' '#53364#47533#54616#49901#49884#50724'.'
    Caption.Visible = True
    CollapsDelay = 0
    ColorTo = clInactiveCaption
    DoubleBuffered = True
    Ellipsis = True
    Position.Save = True
    Position.Location = clInifile
    ShowMoveCursor = True
    StatusBar.BevelInner = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    FullHeight = 84
    object Label4: TLabel
      Left = 162
      Top = 57
      Width = 39
      Height = 17
      Caption = #44228#49328#50896
      Transparent = True
    end
    object Label16: TLabel
      Left = 323
      Top = 28
      Width = 52
      Height = 17
      Caption = #44228#49328#49884#44036
      Transparent = True
    end
    object Label17: TLabel
      Left = 454
      Top = 28
      Width = 9
      Height = 17
      Caption = '~'
      Transparent = True
    end
    object Label8: TLabel
      Left = 8
      Top = 57
      Width = 52
      Height = 17
      Caption = #54252#49828#48264#54840
      Transparent = True
    end
    object Label1: TLabel
      Left = 150
      Top = 28
      Width = 52
      Height = 17
      Caption = #44208#51228#49688#45800
      Transparent = True
    end
    object Label2: TLabel
      Left = 8
      Top = 28
      Width = 52
      Height = 17
      Caption = #54032#47588#44396#48516
      Transparent = True
    end
    object Label3: TLabel
      Left = 323
      Top = 57
      Width = 52
      Height = 17
      Caption = #47588#52636#45824#49345
      Transparent = True
    end
    object Label6: TLabel
      Left = 635
      Top = 30
      Width = 52
      Height = 17
      Caption = #47700#45684#53076#46300
      Transparent = True
    end
    object ConditionDeliveryCheckBox: TcxCheckBox
      Tag = 99
      Left = 548
      Top = 26
      Caption = #48176#45804#47588#52636
      ParentFont = False
      Style.StyleController = EditStyleController
      TabOrder = 4
    end
    object ConditionSawonComboBox: TcxComboBox
      Left = 206
      Top = 53
      AutoSize = False
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Style.StyleController = EditStyleController
      TabOrder = 6
      Height = 25
      Width = 111
    end
    object ConditionPosComboBox: TcxComboBox
      Left = 64
      Top = 53
      AutoSize = False
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Style.StyleController = EditStyleController
      TabOrder = 5
      Height = 25
      Width = 80
    end
    object ConditionFromTimeEdit: TcxTimeEdit
      Left = 382
      Top = 25
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.TimeFormat = tfHourMin
      Style.StyleController = EditStyleController
      TabOrder = 2
      Width = 65
    end
    object ConditionToTimeEdit: TcxTimeEdit
      Left = 472
      Top = 25
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.TimeFormat = tfHourMin
      Style.StyleController = EditStyleController
      TabOrder = 3
      Width = 60
    end
    object ConditionAcctTypeComboBox: TcxComboBox
      Left = 206
      Top = 25
      AutoSize = False
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Style.StyleController = EditStyleController
      TabOrder = 1
      Height = 25
      Width = 111
    end
    object ConditionSaleTypeComboBox: TcxComboBox
      Left = 64
      Top = 24
      AutoSize = False
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Style.StyleController = EditStyleController
      TabOrder = 0
      Height = 25
      Width = 80
    end
    object ConditionSaleTargetComboBox: TcxComboBox
      Left = 382
      Top = 53
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        '['#51204#52404']'
        #51068#48152
        #54924#50896)
      Style.StyleController = EditStyleController
      TabOrder = 7
      Text = '['#51204#52404']'
      Height = 25
      Width = 80
    end
    object ConditionGoodsCodeEdit: TcxTextEdit
      Left = 693
      Top = 26
      AutoSize = False
      ParentFont = False
      Properties.ImeMode = imSHanguel
      Style.StyleController = EditStyleController
      TabOrder = 8
      OnKeyPress = ConditionToolBarEditKeyPress
      Height = 25
      Width = 111
    end
  end
  object ListGrid: TcxGrid [4]
    AlignWithMargins = True
    Left = 3
    Top = 152
    Width = 130
    Height = 653
    Align = alLeft
    TabOrder = 4
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.ScrollbarMode = sbmTouch
    object ListGridTableView: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      FilterBox.CustomizeDialog = False
      FilterBox.Visible = fvNever
      ScrollbarAnnotations.CustomAnnotations = <>
      OnFocusedRecordChanged = ListGridTableViewFocusedRecordChanged
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.GroupByBox = False
      object ListGridTableViewSaleDate: TcxGridColumn
        Caption = #47588#52636#51068#51088
        DataBinding.FieldName = 'YMD_SALE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 110
      end
      object ListGridTableViewYmdBuy: TcxGridColumn
        Tag = 99
        DataBinding.FieldName = 'YMD_BUY1'
        Visible = False
      end
    end
    object ListGridLevel: TcxGridLevel
      GridView = ListGridTableView
    end
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
    object StyleLetsOrderSync: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      TextColor = clBlack
    end
  end
  inherited Exec_Timer: TTimer
    OnTimer = Exec_TimerTimer
  end
  inherited ButtonToolBarPrintButtonImageList: TImageList
    Bitmap = {
      494C010103000800040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
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
    PixelsPerInch = 96
    inherited dxComponentPrinter1Link1: TdxGridReportLink
      PrinterPage.PageHeader.CenterTitle.Strings = (
        #50689#49688#51613#48324' '#47588#52636#51312#54924)
      ReportDocument.CreationDate = 40423.391571539350000000
      PixelsPerInch = 96
      BuiltInReportLink = True
    end
  end
  inherited SubDataSource: TDataSource
    Top = 352
  end
  inherited DataSource: TDataSource
    Top = 309
  end
  object DCDataSource: TDataSource
    Left = 769
    Top = 526
  end
  object MemberDataSource: TDataSource
    Left = 753
    Top = 488
  end
  object CashReceiptDataSource: TDataSource
    Left = 1001
    Top = 410
  end
  object CardDataSource: TDataSource
    Left = 905
    Top = 436
  end
  object PayDataSource: TDataSource
    Left = 905
    Top = 398
  end
  object PrintDataSource: TDataSource
    Left = 753
    Top = 566
  end
  object CancelDataSource: TDataSource
    Left = 745
    Top = 622
  end
  object LetsOrderSyncDataSource: TDataSource
    Left = 745
    Top = 678
  end
end
