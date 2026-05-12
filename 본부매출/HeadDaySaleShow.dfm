inherited HeadDaySaleShowForm: THeadDaySaleShowForm
  Caption = #51068#51068#47588#52636' '#51312#54924'('#48376#48512')'
  ClientHeight = 651
  ClientWidth = 1330
  ExplicitWidth = 1346
  ExplicitHeight = 690
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 323
    Height = 586
    ExplicitLeft = 323
    ExplicitHeight = 586
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1330
    ExplicitWidth = 1330
    inherited ButtonToolBar: TAdvToolBar
      Left = 777
      ExplicitLeft = 777
      inherited ButtonToolBarSeparator: TAdvToolBarSeparator
        Height = 27
        ExplicitHeight = 27
      end
      inherited ButtonToolBarSaveButton: TAdvGlowButton
        Visible = False
      end
      inherited ButtonToolBarDeleteButton: TAdvGlowButton
        Visible = False
      end
      inherited ButtonToolBarNewButton: TAdvGlowButton
        Visible = False
      end
      inherited ButtonToolBarCancelButton: TAdvGlowButton
        Visible = False
      end
    end
    inherited ConditionToolBar: TAdvToolBar
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        Visible = True
      end
      inherited ConditionToolBarDateLabel: TcxLabel
        Caption = #47588#52636#51068#51088
        Visible = True
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        AnchorX = 166
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        Caption = #44208#51228#49688#45800
        AnchorX = 298
        AnchorY = 16
      end
    end
  end
  inherited GridPanel: TPanel
    Width = 323
    Height = 586
    ExplicitWidth = 323
    ExplicitHeight = 586
    inherited Grid: TcxGrid
      Width = 317
      Height = 580
      ExplicitWidth = 317
      ExplicitHeight = 580
      object GridStoreView: TcxGridCardView [1]
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        OnFocusedRecordChanged = GridStoreViewFocusedRecordChanged
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.CaptionSeparator = #0
        OptionsView.CardIndent = 8
        OptionsView.CardWidth = 300
        object GridStoreViewStoreName: TcxGridCardViewRow
          DataBinding.FieldName = 'NM_STORE'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ShowAccelChar = False
          Options.Filtering = False
          Options.Focusing = False
          Options.Moving = False
          Options.ShowCaption = False
          Position.BeginsLayer = True
          Styles.Content = StyleHighlight
        end
        object GridStoreViewSaleAmt: TcxGridCardViewRow
          Caption = #47588#52636#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_SALE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Options.Filtering = False
          Options.Focusing = False
          Options.Moving = False
          Position.BeginsLayer = True
          Styles.Content = StyleFontBlue
          Styles.Caption = StyleFontBlue
        end
        object GridStoreViewDeliveryAmt: TcxGridCardViewRow
          Caption = #48176#45804#47588#52636
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_DELIVERY'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Options.Filtering = False
          Options.Focusing = False
          Options.Moving = False
          Position.BeginsLayer = False
        end
        object GridStoreViewDcAmt: TcxGridCardViewRow
          Caption = #54624#51064#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_DC'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Options.Filtering = False
          Options.Focusing = False
          Options.Moving = False
          Position.BeginsLayer = True
        end
        object GridStoreViewVatAmt: TcxGridCardViewRow
          Caption = '  '#48512#44032#49464
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_VAT'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Options.Filtering = False
          Options.Focusing = False
          Options.Moving = False
          Position.BeginsLayer = False
        end
        object GridStoreViewServiceAmt: TcxGridCardViewRow
          Caption = #49436' '#48708' '#49828
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_SERVICE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Options.Filtering = False
          Options.Focusing = False
          Options.Moving = False
          Position.BeginsLayer = True
        end
        object GridStoreViewSoonAmt: TcxGridCardViewRow
          Caption = '  '#49692#47588#52636
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_SOON'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Options.Filtering = False
          Options.Focusing = False
          Options.Moving = False
          Position.BeginsLayer = False
        end
        object GridStoreViewTotalAmt: TcxGridCardViewRow
          Caption = #52509' '#47588' '#52636
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_TOT'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Options.Filtering = False
          Options.Focusing = False
          Options.Moving = False
          Position.BeginsLayer = True
        end
        object GridStoreViewGuestCount: TcxGridCardViewRow
          Caption = '  '#44256#44061#49688
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'CNT_GUEST'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'#47749
          Options.Filtering = False
          Options.Focusing = False
          Options.Moving = False
          Position.BeginsLayer = False
          Styles.Content = StyleFontBlack
          Styles.Caption = StyleFontBlack
        end
        object GridStoreViewStoreCode: TcxGridCardViewRow
          Caption = #47588#51109#53076#46300
          DataBinding.FieldName = 'CD_STORE'
          Visible = False
          Position.BeginsLayer = True
        end
      end
      inherited GridLevel: TcxGridLevel
        GridView = GridStoreView
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 329
    Width = 1001
    Height = 586
    ExplicitLeft = 329
    ExplicitWidth = 1001
    ExplicitHeight = 586
    object cxGrid1: TcxGrid
      AlignWithMargins = True
      Left = 3
      Top = 87
      Width = 995
      Height = 496
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object cxGridTableView1: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        FilterBox.CustomizeDialog = False
        FilterBox.Visible = fvNever
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
      end
      object GridDBTableView: TcxGridDBTableView
        Tag = 99
        Navigator.Buttons.CustomButtons = <>
        FilterBox.CustomizeDialog = False
        FilterBox.Visible = fvNever
        ScrollbarAnnotations.CustomAnnotations = <>
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
            Column = GridDBTableViewDCAmt
          end
          item
            Format = ',0'
            Kind = skSum
            Column = GridDBTableViewSaleAmt
          end
          item
            Format = ',0'
            Kind = skSum
            Column = GridDBTableViewPoint
          end
          item
            Format = ',0'
            Kind = skSum
            Column = GridDBTableViewTotAmt
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
          end
          item
            Format = ',0'
            Kind = skSum
            Column = GridDBTableViewServiceAmt
          end
          item
            Format = ',0'
            Kind = skSum
            Column = GridDBTableViewStamp
          end
          item
            Format = ',0'
            Kind = skSum
            Column = GridDBTableViewLetsOrderAmt
          end
          item
            Format = ',0'
            Kind = skSum
            Column = GridDBTableViewZeroPayAmt
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        Styles.ContentEven = StyleEven
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
          FooterAlignmentHorz = taRightJustify
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
        object GridDBTableViewZeroPayAmt: TcxGridDBColumn
          Caption = #51228#47196#54168#51060
          DataBinding.FieldName = 'AMT_ZEROPAY'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
        end
      end
      object GridSubDBTableView: TcxGridDBTableView
        Tag = 99
        Navigator.Buttons.CustomButtons = <>
        FilterBox.CustomizeDialog = False
        FilterBox.Visible = fvNever
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DetailKeyFieldNames = 'LINK'
        DataController.MasterKeyFieldNames = 'LINK'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0'
            Kind = skSum
            Column = GridSubDBTableViewVatAmt
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsView.GroupByBox = False
        Styles.ContentEven = StyleEven
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
      object PayGridDBCardView: TcxGridDBCardView
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
      object CardGridDBCardView: TcxGridDBCardView
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
      object CashReceiptGridDBCardView: TcxGridDBCardView
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
      object MemberGridDBCardView: TcxGridDBCardView
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
      object DCGridDBCardView: TcxGridDBCardView
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
        object DCGridDBCardViewMCardDC: TcxGridDBCardViewRow
          Caption = 'M'#52852#46300#54624#51064
          DataBinding.FieldName = 'DC_MCARD'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0'
          Position.BeginsLayer = True
        end
        object DCGridDBCardViewEnuriDC: TcxGridDBCardViewRow
          Caption = #51088#53804#47532#54624#51064
          DataBinding.FieldName = 'DC_ENURI'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0'
          Position.BeginsLayer = True
        end
        object DCGridDBCardViewKBankDC: TcxGridDBCardViewRow
          Caption = #44305#51452#51008#54665#52852#46300#54624#51064
          DataBinding.FieldName = 'DC_KBANK'
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
      object PrintGridDBCardView: TcxGridDBCardView
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
      object CancelGridDBTableView: TcxGridDBTableView
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
      object cxGridLevel1: TcxGridLevel
        GridView = GridDBTableView
        Options.DetailTabsPosition = dtpTop
        object GridSubLevel: TcxGridLevel
          Caption = ' '#47700#45684#45236#50669'  '
          GridView = GridSubDBTableView
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
      end
    end
    object ConditionPanel: TAdvPanel
      Left = 0
      Top = 0
      Width = 1001
      Height = 84
      Align = alTop
      DockSite = True
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      TabOrder = 1
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
        Left = 5
        Top = 60
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
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 4
      end
      object ConditionFromTimeEdit: TcxTimeEdit
        Left = 382
        Top = 25
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.TimeFormat = tfHourMin
        Properties.OnChange = EditPropertiesChange
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
        Properties.OnChange = EditPropertiesChange
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
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 0
        Height = 25
        Width = 80
      end
      object ConditionSaleTargetComboBox: TcxComboBox
        Left = 64
        Top = 56
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '['#51204#52404']'
          #51068#48152
          #54924#50896)
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 5
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
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 6
        OnKeyPress = ConditionToolBarEditKeyPress
        Height = 25
        Width = 111
      end
    end
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
    inherited StyleFontBlue: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      TextColor = clBlack
    end
    inherited StyleFontBlackBold: TcxStyle
      Font.Height = -15
    end
    inherited StyleHighlight: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Font.Height = -16
      Font.Name = #47569#51008' '#44256#46357
    end
  end
  object SubDataSource: TDataSource
    Left = 897
    Top = 272
  end
  object DataSource: TDataSource
    Left = 897
    Top = 229
  end
  object DCDataSource: TDataSource
    Left = 897
    Top = 446
  end
  object MemberDataSource: TDataSource
    Left = 897
    Top = 416
  end
  object CashReceiptDataSource: TDataSource
    Left = 897
    Top = 386
  end
  object CardDataSource: TDataSource
    Left = 897
    Top = 356
  end
  object PayDataSource: TDataSource
    Left = 897
    Top = 318
  end
  object PrintDataSource: TDataSource
    Left = 897
    Top = 471
  end
  object CancelDataSource: TDataSource
    Left = 881
    Top = 471
  end
end
