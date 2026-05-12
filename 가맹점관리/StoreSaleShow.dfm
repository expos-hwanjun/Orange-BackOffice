inherited StoreSaleShowForm: TStoreSaleShowForm
  Caption = #47588#51109#48324' '#47588#52636#45236#50669
  ClientWidth = 1222
  ExplicitWidth = 1238
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1222
    ExplicitWidth = 1222
    inherited ButtonToolBar: TAdvToolBar
      Left = 934
      ExplicitLeft = 934
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
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        Visible = True
        AnchorX = 166
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        Visible = True
        AnchorX = 448
        AnchorY = 16
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Visible = True
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
    Width = 1216
    ExplicitWidth = 1216
    inherited GridTableView: TcxGridTableView
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridTableViewSaleAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridTableViewCardAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridTableViewCashAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridTableViewEtcAmt
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
          Kind = skCount
          Position = spFooter
          Column = GridTableViewColumn4
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewSaleAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewCardAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewCashAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewEtcAmt
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
          Kind = skCount
          Column = GridTableViewColumn4
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewColumn5
        end
        item
          Format = ',0'
          Kind = skSum
        end
        item
          Format = ',0'
          Kind = skSum
        end>
      OptionsView.Footer = True
      OptionsView.GroupFooters = gfAlwaysVisible
      Styles.ContentEven = StyleEven
      object GridTableViewColumn1: TcxGridColumn
        Caption = #54801#47141#49324
        DataBinding.FieldName = 'NM_PARTNER'
        HeaderAlignmentHorz = taCenter
        Width = 122
      end
      object GridTableViewColumn2: TcxGridColumn
        Caption = #48376#49324
        DataBinding.FieldName = 'NM_COMPANY'
        HeaderAlignmentHorz = taCenter
        Width = 131
      end
      object GridTableViewStoreCode: TcxGridColumn
        Caption = #47588#51109#53076#46300
        DataBinding.FieldName = 'CD_CUSTOMER'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 97
      end
      object GridTableViewColumn4: TcxGridColumn
        Caption = #47588#51109#47749
        DataBinding.FieldName = 'NM_CUSTOMER'
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 180
      end
      object GridTableViewColumn3: TcxGridColumn
        Caption = #50557#51221#51068#51088
        DataBinding.FieldName = 'STIPULATE_TO'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 89
      end
      object GridTableViewColumn5: TcxGridColumn
        Caption = #50557#51221#44148#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'STIPULATE_COUNT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 75
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
        Styles.Content = StyleFontBlackBold
        Width = 107
      end
      object GridTableViewCardAmt: TcxGridColumn
        Caption = #52852#46300#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CARD'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 85
      end
      object GridTableViewCashAmt: TcxGridColumn
        Caption = #54788#44552
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASH'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 72
      end
      object GridTableViewEtcAmt: TcxGridColumn
        Caption = #44592#53440
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_ECT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
      end
    end
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
      ReportDocument.CreationDate = 44525.737171076390000000
      PixelsPerInch = 96
      BuiltInReportLink = True
    end
  end
end
