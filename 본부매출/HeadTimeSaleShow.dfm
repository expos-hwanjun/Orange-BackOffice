inherited HeadTimeSaleShowForm: THeadTimeSaleShowForm
  Caption = #49884#44036#45824#48324' '#47588#52636'('#48376#48512')'
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
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
    RootLevelOptions.DetailTabsPosition = dtpTop
    inherited GridTableView: TcxGridTableView
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewColumn2
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewColumn3
        end>
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object GridTableViewColumn1: TcxGridColumn
        Caption = #49884#44036#45824
        HeaderAlignmentHorz = taCenter
        Width = 182
      end
      object GridTableViewColumn2: TcxGridColumn
        Caption = #47588#52636#44552#50529
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 106
      end
      object GridTableViewColumn3: TcxGridColumn
        Caption = #44256#44061#49688
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 81
      end
      object GridTableViewColumn4: TcxGridColumn
        Caption = #44396#49457#48708
        HeaderAlignmentHorz = taCenter
        Width = 76
      end
    end
    object GridBandedLocalView: TcxGridBandedTableView [1]
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedLocalViewSaleAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedLocalViewCustomerCnt
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      Bands = <
        item
          Width = 129
        end
        item
          Caption = #54633#44228
          Width = 167
        end>
      object GridBandedLocalViewColumn1: TcxGridBandedColumn
        Caption = #49884#44036#45824
        DataBinding.FieldName = 'TIME_ZONE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedLocalViewSaleAmt: TcxGridBandedColumn
        Caption = #47588#52636#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.Content = StyleFontBlackBold
        Width = 100
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedLocalViewCustomerCnt: TcxGridBandedColumn
        Caption = #44256#44061#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'CNT_CUST'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.Content = StyleFontBlackBold
        Width = 67
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
    end
    object GridBandedSaleZoneView: TcxGridBandedTableView [2]
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedSaleZoneViewCustomerCnt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedSaleZoneViewSaleAmt
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      Bands = <
        item
          Width = 120
        end
        item
          Caption = #54633#44228
          Width = 178
        end>
      object GridBandedSaleZoneViewColumn1: TcxGridBandedColumn
        Caption = #49884#44036#45824
        DataBinding.FieldName = 'TIME_ZONE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedSaleZoneViewSaleAmt: TcxGridBandedColumn
        Caption = #47588#52636#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.Content = StyleFontBlackBold
        Width = 115
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedSaleZoneViewCustomerCnt: TcxGridBandedColumn
        Caption = #44256#44061#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'CNT_CUST'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.Content = StyleFontBlackBold
        Width = 73
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
    end
    inherited GridLevel: TcxGridLevel
      Caption = ' '#51648#50669#48324' '#47588#52636' '
      GridView = GridBandedLocalView
    end
    object GridLevel1: TcxGridLevel
      Caption = ' '#49345#44428#48324' '#47588#52636' '
      GridView = GridBandedSaleZoneView
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
      ReportDocument.CreationDate = 44426.393291192130000000
      PixelsPerInch = 96
      BuiltInReportLink = True
    end
  end
end
