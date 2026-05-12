inherited AnalysisLargeClassSaleShowForm: TAnalysisLargeClassSaleShowForm
  Caption = #45824#48516#47448#48324' '#47588#52636
  ClientWidth = 1016
  ExplicitWidth = 1032
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1016
    ExplicitWidth = 1016
    inherited ConditionToolBar: TAdvToolBar
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        Visible = True
      end
      inherited ConditionToolBarDateLabel: TcxLabel
        Visible = True
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        AnchorX = 166
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        AnchorX = 448
        AnchorY = 16
      end
    end
  end
  inherited Grid: TcxGrid
    Width = 1010
    RootLevelOptions.DetailTabsPosition = dtpTop
    OnActiveTabChanged = GridActiveTabChanged
    ExplicitWidth = 1010
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
        end
        item
          Format = ',0'
          Kind = skSum
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
          Column = GridTableViewColumn6
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewColumn7
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewColumn8
        end>
      DataController.Data = {
        D90000000F00000044617461436F6E74726F6C6C657231080000001200000054
        6378537472696E6756616C7565547970651400000054637843757272656E6379
        56616C7565547970651400000054637843757272656E637956616C7565547970
        651400000054637843757272656E637956616C75655479706514000000546378
        43757272656E637956616C7565547970651400000054637843757272656E6379
        56616C7565547970651400000054637843757272656E637956616C7565547970
        651400000054637843757272656E637956616C75655479706500000000}
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      object GridTableViewColumn1: TcxGridColumn
        Tag = 98
        Caption = #48516#47448
        DataBinding.FieldName = 'NM_CLASS'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 148
      end
      object GridTableViewColumn2: TcxGridColumn
        Tag = 98
        Caption = '3'#50900'11'#51068
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE_6'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 109
      end
      object GridTableViewColumn3: TcxGridColumn
        Tag = 98
        Caption = '3'#50900'12'#51068
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE_5'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 115
      end
      object GridTableViewColumn4: TcxGridColumn
        Tag = 98
        Caption = '3'#50900'13'#51068
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE_4'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 109
      end
      object GridTableViewColumn5: TcxGridColumn
        Tag = 98
        Caption = '3'#50900'14'#51068
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE_3'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 102
      end
      object GridTableViewColumn6: TcxGridColumn
        Tag = 98
        Caption = '3'#50900'15'#51068
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE_2'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 99
      end
      object GridTableViewColumn7: TcxGridColumn
        Tag = 98
        Caption = '3'#50900'16'#51068
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE_1'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 106
      end
      object GridTableViewColumn8: TcxGridColumn
        Tag = 98
        Caption = '3'#50900'17'#51068
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 112
      end
    end
    object GridBandedTableView1: TcxGridBandedTableView [1]
      Tag = 99
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column2
        end
        item
          Format = ',0.00%'
          Kind = skAverage
          Column = GridBandedTableView1Column3
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column4
        end
        item
          Format = ',0.00%'
          Kind = skAverage
          Column = GridBandedTableView1Column5
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column7
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column6
        end
        item
          Format = ',0.00%'
          Kind = skAverage
          Column = GridBandedTableView1Column8
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column9
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      Bands = <
        item
          Width = 239
        end
        item
          Caption = '2013-03'
          Width = 210
        end
        item
          Caption = '2013-04'
          Width = 229
        end
        item
          Caption = '2013-05'
          Width = 247
        end>
      object GridBandedTableView1Column1: TcxGridBandedColumn
        Caption = #48516#47448
        DataBinding.FieldName = 'NM_CLASS'
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column2: TcxGridBandedColumn
        Caption = #54032#47588#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TWO'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 132
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column3: TcxGridBandedColumn
        Caption = #51060#51061#47456
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'RATE_TWO'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.00%'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 78
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column4: TcxGridBandedColumn
        Caption = #54032#47588#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_ONE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 94
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column5: TcxGridBandedColumn
        Caption = #51060#51061#47456
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'RATE_ONE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.00%'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 68
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column6: TcxGridBandedColumn
        Caption = #51613#44048
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_ONE_GROW'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.OnGetContentStyle = GridBandedTableView1Column6StylesGetContentStyle
        Width = 67
        Position.BandIndex = 2
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column7: TcxGridBandedColumn
        Caption = #54032#47588#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_NOW'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 103
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column8: TcxGridBandedColumn
        Caption = #51060#51061#47456
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'RATE_NOW'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.00%'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 72
        Position.BandIndex = 3
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column9: TcxGridBandedColumn
        Caption = #51613#44048
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_NOW_GROW'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Styles.OnGetContentStyle = GridBandedTableView1Column9StylesGetContentStyle
        Width = 72
        Position.BandIndex = 3
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
    end
    object GridBandedTableView2: TcxGridBandedTableView [2]
      Tag = 99
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView2SunSale
        end
        item
          Format = ',0.00%'
          Kind = skAverage
          Column = GridBandedTableView2SunRate
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView2MonSale
        end
        item
          Format = ',0.00%'
          Kind = skAverage
          Column = GridBandedTableView2MonRate
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView2TueSale
        end
        item
          Format = ',0.00%'
          Kind = skAverage
          Column = GridBandedTableView2TueRate
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView2WedSale
        end
        item
          Format = ',0.00%'
          Kind = skAverage
          Column = GridBandedTableView2WedRate
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView2ThuSale
        end
        item
          Format = ',0.00%'
          Kind = skAverage
          Column = GridBandedTableView2ThuRate
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView2FriSale
        end
        item
          Format = ',0.00%'
          Kind = skAverage
          Column = GridBandedTableView2FriRate
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView2SatSale
        end
        item
          Format = ',0.00%'
          Kind = skAverage
          Column = GridBandedTableView2SatRate
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      Bands = <
        item
          Width = 147
        end
        item
          Caption = #51068#50836#51068
          Width = 149
        end
        item
          Caption = #50900#50836#51068
          Width = 129
        end
        item
          Caption = #54868#50836#51068
          Width = 142
        end
        item
          Caption = #49688#50836#51068
          Width = 136
        end
        item
          Caption = #47785#50836#51068
          Width = 138
        end
        item
          Caption = #44552#50836#51068
          Width = 151
        end
        item
          Caption = #53664#50836#51068
          Width = 137
        end>
      object GridBandedTableView2Column1: TcxGridBandedColumn
        Caption = #48516#47448
        DataBinding.FieldName = 'NM_CLASS'
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView2SunSale: TcxGridBandedColumn
        Caption = #54032#47588#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE_SUN'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 78
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView2SunRate: TcxGridBandedColumn
        Caption = #48708#50984
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'RATE_SUN'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.00%'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 51
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableView2MonSale: TcxGridBandedColumn
        Caption = #54032#47588#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE_MON'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 68
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView2MonRate: TcxGridBandedColumn
        Caption = #48708#50984
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'RATE_MON'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.00%'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 43
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableView2TueSale: TcxGridBandedColumn
        Caption = #54032#47588#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE_TUE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 72
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView2TueRate: TcxGridBandedColumn
        Caption = #48708#50984
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'RATE_TUE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.00%'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 35
        Position.BandIndex = 3
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableView2WedSale: TcxGridBandedColumn
        Caption = #54032#47588#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE_WED'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 89
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView2WedRate: TcxGridBandedColumn
        Caption = #48708#50984
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'RATE_WED'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.00%'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 47
        Position.BandIndex = 4
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableView2ThuSale: TcxGridBandedColumn
        Caption = #54032#47588#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE_THU'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 96
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView2ThuRate: TcxGridBandedColumn
        Caption = #48708#50984
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'RATE_THU'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.00%'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 42
        Position.BandIndex = 5
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableView2FriSale: TcxGridBandedColumn
        Caption = #54032#47588#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE_FRI'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 103
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView2FriRate: TcxGridBandedColumn
        Caption = #48708#50984
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'RATE_FRI'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.00%'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 48
        Position.BandIndex = 6
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableView2SatSale: TcxGridBandedColumn
        Caption = #54032#47588#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE_SAT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 86
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView2SatRate: TcxGridBandedColumn
        Caption = #48708#50984
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'RATE_SAT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.00%'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 51
        Position.BandIndex = 7
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
    end
    inherited GridLevel: TcxGridLevel
      Caption = ' '#51452#44036' '#54032#47588' '#51312#54924' '
    end
    object GridLevel1: TcxGridLevel
      Caption = ' 3'#44060#50900' '#54032#47588' '#51312#54924' '
      GridView = GridBandedTableView1
    end
    object GridLevel2: TcxGridLevel
      Caption = ' '#50836#51068#48324' '#54032#47588' '#51312#54924' '
      GridView = GridBandedTableView2
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
      494C0101040008003C0110001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
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
      000000000000101010742D2D2DA52828289F2828289F2828289F2828289F2D2D
      2DA50D0D0D730000000000000000000000000000000000000000000000000000
      00020000000000000000000000000000002704050568030302520806064F0303
      032B0000000E00000001000000000000000000000000000000061B16167ACEB2
      B4F5FDDDDFFFF2D2D4FFDEBFC2FFB1989AF3706060D33B3232AE1D1819850907
      07580101012B0000000900000000000000000000000000000001000000030000
      00060000000B000000140000002000000030010101450303035B0A0A0A751717
      18902A2A2CA9525454CE242625B4000000200000000000000000000000000000
      000000000000757575CCFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFF8F8F8FFFDFD
      FDFF555555C10000000000000000000000000000000000000000010101340808
      087C0202025F0000002A0101013D434646BBA5A29BF19D9689E9B6B4B2E88987
      84CE494542A41C1A19700C0B0A480201011C00000000000000000000001B1811
      128C554344C6897071DEE8D0D1FCFFF0F0FFFFE9EAFFFFE3E6FFFBDADCFFDCC3
      C5FF857A7AD92D27279E000000330000000505130962070D096F070707780F10
      0F881B1D1C9C292C2AAE464547C26C6B6ED6919697E8B9C0C0F9CDD7D5FFD2DB
      D5FFCDE1D6FFFFFFFFFF737575D7000000270000001C02020244010101410101
      01400000003E747474D9FEFEFEFFF1F1F1FFEAEAEAFFE6E6E6FFE7E7E7FFF2F2
      F2FF484848BF000000000000000000000000000000030000004B313131D48183
      83FF5D5D5DF7242424CF555656DFDFCFBDFFFFE8C7FFFFFFF0FFFFFFFFFFFFFF
      FFFFFFFFFFFFF0F2F4FFC1B9B3F70E0C0B61000000000000000A131010764D3E
      41B73E2A2EAB442F34BAC3B2B8F5F6E9ECFFF4D6D7FFF6D1D3FFC3A2A3EF947F
      80D9C0AFB1E8C8ADAFF5080607640000000C5A9B71EFB0C8BAFFC9CCCBFFCEDA
      D5FFD7E5DEFFECFAF6FFD6EBDEFFBDD9C5FFACD3B9FFD8EEE1FFA8D2B3FF4F92
      56FF347939FFB1D4B9FF828486DE0000002E3A3A3AA9D9D9D9FFDCDCDCFFCDCD
      CDFFC1C1BDFFC4C4C1FFD0CDD0FFC7C6C7FFC1C1C1FFBCBCBCFFB6B6B6FFB6B6
      B6FF7C7C7CF00C0C0C8700000018000000000000003E373635DD9F9FA1FFC8C9
      CAFFC7C8C7FFB0B2B4FF949393FF9F8773FFB89D85FECCB59FFEE0C8B1FEF4E3
      D0FEFFF6E5FFF1E7E0FF474747B60000002D0000000000000020866D71DAFDF8
      EFFFABC2B2F7A2A19AEEDDBDC1FCECCFDCFFECCFDDFFE8C7D4FF5F4B51D10B07
      07770604045E020101370000000B0000000055926AEBC7DFD1FFE7FAF1FF79B9
      90FF68A97CFFBBD8C6FF7EB88FFF348847FF2C7E3EFF8DB596FF89BA93FF297E
      32FF33823AFFB0D5B8FF9B9F9FEA0101013B737373D6BABABAFFCCCCCBFFD4D4
      DAFFC2C2E1FFCDCBE2FFC3D4C0FFD0D4D0FFD1D1D1FFCECECEFFC9C9C9FFC4C4
      C4FFC5C5C5FFB7B7B7FF343434C50000002709090970939594FFC3C6C5FFD1D1
      D2FFDEDFDFFFD9DEDFFFBEC1C3FFABB0B4FFA6B0B4FFA1A19EFFA29B95FFA191
      80FFA38F7BFF7B7170FD07070871000000000000000001000131997C83DEE3D0
      ABFF6F9A49FF97A852FFF2A55BFFF4AA74FFF2BA98FFF0C2B5FFC1A1A2F27060
      68CD302F31A811111083030202430000001C407E54E096BCA3FFC9E8D7FF4AA1
      68FF42975EFFA8CAB5FFABD5B8FF8DCA9DFF97CBA4FFB9D7C4FFD4EADDFFB4D3
      BCFFABCAB4FFDCF0E5FFACB3B3F3020202479A9A9AE8C5C5C5FFC0C0BFFFE5E5
      EBFF9898DFFFA7A3E3FFAFD0ACFFC3D2C3FFD3D1D3FFCFCFCFFFCBCBCBFFCACA
      CAFFCDCDCDFFC7C7C7FF868686F1020202490A0A0A6BACB0AFFED5DAD9FFE7E7
      E7FEEEF5F8FEDED7D4FEBF7857FEB36946FEB58A79FEBBB1AEFEB4B5B5FEB6B3
      BCFEA2A7A4FE6AA869FF111B119E0000000C0000000205030343AC9095EAFBBC
      95FFBEAE76FFBCA761FFDF7B11FFE38017FFE78923FFEC9033FFF59E4BFFFEB2
      70FFEDBD86FFEDD8BFFF3F3438B20603045D3E7E53E2699E79FFEAF5ECFFDBEF
      E3FFDCEEE3FFF6FBF9FFE2ECE8FF9DA7A1FF9EA9A2FFF1FAF9FFC6DECEFF6B9E
      74FF46834EFF8FB696FFC1C8C7FC04040456999999E6D0D0D0FFC2C2C2FFF1F1
      F0FFECECEAFFE5E5E6FFE3E2E4FFDDDDDDFFD4D3D4FFD1D1D1FFCDCDCDFFCCCC
      CCFFCCCCCCFFC9C9C9FF808080EC010101410606065EB7BBB9FBF5F7F7FFF6F6
      F7FFF9FFFFFFEBC7ACFFD36625FFCA5716FFC25319FFBB5625FFB4572AFFBE87
      71FFD6D6D6FFD3F1D9FF2126219D0000000C000000060B090954C7A8AAF6FAB8
      8DFFE9C79BFFE5BE8CFFD97A1BFFDA7917FFDA7A18FFDC7C18FFDD801AFFE280
      16FFE98516FFFFD0A1FF42393DB10403035748875DE2649F7AFFE8F1EAFFD8E6
      DFFFA1C6B0FFA2C7B0FF527157FF141B14FF49684FFFDBEAE1FFBDDAC4FF4593
      52FF34823CFF85B58CFFCED9D6FF070707639C9C9CE6DADADAFFC3C3C3FFF4F4
      F4FFF1F1F1FFECEDECFFE8E8E8FFE4E4E4FFD5D5D5FFD2D2D2FFD0D0D0FFCFCF
      CFFFCDCDCDFFCDCDCDFF7C7C7CE80000003A010202478A8B8BE4EFF0F0FFE3EC
      F2FFE7DCD3FEE8995EFEE88336FEE5853EFEE17E39FEDA7430FECF5A13FEC96C
      36FEEAE0D9FFFFFFFFFF1C1B1C8A000000050000000A0D0B0C63F2C7C4FFDAA9
      77FF84987EFFAB9869FFDB7B1DFFDD7D1DFFDD8223FFDE8628FFDE8A2CFFDC86
      26FFE08B27FFFFCDA4FF2F282BA101010141508E67E270AB8AFFDDECE4FFD8E9
      E0FF7ABB92FF338450FF002F05FF4B6C53FFCCE0D2FFDDEDE3FFDFF0E7FFC3DE
      CAFFBBD5C2FFD1E7DAFFDCE8E4FF0A0A0A729F9F9FE6E4E4E4FFC4C4C4FFF6F6
      F6FFF6F6F7FFF1F1F1FFECECECFFE9E9E9FFD8D8D9FFD3D3D3FFD1D1D1FFD2D2
      D2FFCFCFCFFFD1D1D1FF7A7A7AE400000035000000070304044A52575BC7C9CA
      CAFFCC8C66FFCC6524FFD5712EFFDE7934FFE58138FFEB873AFFEE8739FFF2BE
      98FFFFFFFFFFD9DBDCFB06060658000000000000001314111278FFD1C7FFC8A9
      7EFF42BECCFF64B7B6FFD4822AFFE28220FFE08A2DFFE29134FFE4973AFFE294
      34FFEA9E3DFFFFD4B3FF231E20930000003158946DE274AC8BFFCBE2D4FFFFFF
      FFFFD5E8DEFF2A734BFF024C1BFF639875FFD9E4DCFFFEFEFFFFDEEDE5FF8CB5
      94FF4F8A5AFF679B70FFD5E6DDFF11111283A3A3A3E6EEEEEEFFC3C3C3FFF6F5
      F5FFFEFFFFFFF8FCFEFFF3F7FAFFF0F3F5FFE4E8EAFFE1E5E7FFDDE1E3FFDADC
      DDFFDED5DEFFDCD8DCFF737473DF00000030000000000000000008060548B99C
      81EBE0C1A4FFD5A586FFCF936DFFC68155FFC67544FFCE7237FFD79363FFECE5
      E0FFECEDEEFF333232A200000013000000000000002A241F2191FFDAD2FFD89D
      62FFB89F75FFC29456FFDA8527FFE18B2CFFE39438FFE69C40FFE9A347FFE7A0
      42FFF1AF52FFFCD7BCFF171416820000001F659E7AE586B498FFC7E0D0FFFAFC
      FBFF75AE93FF096839FF64A481FF5EA874FF5C986EFFC9DAD0FFDFEDE4FF67A9
      75FF3D8E4AFF6BA473FFDEF0E6FF1D1D1D98AAAAAAE8FAFAFAFFC2C2C2FFEEEE
      EEFFE2B490FFDEA77CFFDEA87EFFDDA77DFFDDA77DFFDBA57BFFDAA175FFDFC3
      B1FF7CCE82FFB7D7B7FF787478DA0000002B00000000000000000C070344CDAE
      93E9FFFEECFFFFEDD3FFFCE4CAFFEDD9BEFFE3C8AEFF705A4ECE1D1E1E872A2D
      2F952424248D00000021000000000000000002010140352F31A1FFDACEFFDD8D
      47FFE19353FFE48D40FFE08625FFE29336FFE59D43FFE9A64DFFEDAE56FFEBAD
      51FFF8C16CFFF5DBC7FF0F0E0F74000000125B906ED9A8C6B4FFC5DDCEFFEFF9
      F6FF6FB393FF80BBA0FFF2FAF5FFD1EBDAFFA7CFB4FFBCD6C5FFEAF6F2FFDBEF
      E2FFD4EADBFFC1D0C7EEBBBFBDDD1414146B9C9C9CE0FFFFFFFFCACACBFFE0DF
      DFFFEBCEBBFFD7B5A1FFD4B39FFFD3B39EFFD3B29EFFD2B19DFFD2AF99FFD0BF
      B5FF90CB94FFC7E0C7FF373637AB0000000E000000000201001D83644BC0FFFF
      FFFFFFFFFFFFFFF8EEFFFFF3E3FFFFF8E7FFCCB499E606050434000000010000
      0007000000030000000000000000000000000B090A63544F52B7FFDDCDFFDA7E
      2EFFDA8C35FFD88F3CFFDA7E15FFE08D24FFE49A35FFE9A745FFEEB253FFEEB4
      53FFFECF7CFFEBD9CBFF0A090A650000000A1F472C9DC9DCD1FFC7D9CEFFE1F1
      E8FFE7F4ECFFEFF5F2FFE9F1EDFFE6F0ECFFE5EFEBFFD5E8DEFFC8DFD3FFDFEB
      E6FFB8D0C0FC353F3A8A0A0A0A350000000F09090952292929890303033D3232
      339EFBFEFFFFC3C7C9FFCBCED0FFCBCED1FFCDD0D2FFCED1D3FFD0D4D6FFCBCD
      CEFFBFB9BFFFA19EA1F300000025000000000000000003020124644E3FABA08F
      82D2BCAC9FE2E0DAD5F3FEFBF9FFFEFCFAFF4C37269600000000000000000000
      000000000000000000000000000000000000100E0E73615C5EC8FFF6F3FFFFCB
      ABFFFDC59AFFFABE8BFFF8B878FFF6B771FFF3B96EFFF3BD6DFFF3C06DFFF3BE
      5EFFFFDC8BFFD6CCC2FD0B090A5D000000080108033A7FAF8EE8EEEAEEFFD2DF
      D6FFCEDED2FFCADCCFFFBFD7C8FFBFD7C8FFC0D6C8FFBED5C7FFB9D3C2FFD0DE
      D5FF9CBFA9F90A120C5900000000000000000000000000000000000000000000
      000E0303033AA5A5A5F1EFEFEFFFEDEDEDFFEFEFEFFFF1F1F1FFF4F4F4FFF4F4
      F4FF616061D60000002200000000000000000000000000000004010100180503
      022909050238190F075C46332493655242AB0703013200000000000000000000
      000000000000000000000000000000000000000000240A08084F2F292B8F3D36
      39AA63555AC1867778D7B09A9DEDE2C3C1FFF5D5CFFFFEDDD4FFFFE3D5FFFFE4
      CAFFFFFEE6FFBCB2B1F50504044A000000030000000205160A5B7EAD8DE6E7EC
      E9FFEDEBECFFE8EAE7FFE9EBE8FFE9EBE9FFE9ECE9FFEAEDEBFFEAEDEBFFFCF9
      FCFFDAE9E2FD08150B6600000000000000000000000000000000000000000000
      0000000000003F3F3FADFEFEFEFFFAFAFAFFFDFDFDFFFFFFFFFFFFFFFFFFF9F9
      F9FF131313880000000000000000000000000000000000000000000000000000
      0000000000000000000E0C0602411A120B5C0100001400000000000000000000
      0000000000000000000000000000000000000000000000000000000000070000
      00110000001D020202290605053508070743050405550B090A62110E0F6E1714
      157A1B1819810907085B0000000F000000000000000000000001010804392045
      2C9B699878DA86B093E682AA8EE482A78EE480A78CE47FA68BE47DA188E290B3
      9BEC7BA788EB0411085D00000000000000000000000000000000000000000000
      0000000000000E0E0E63F7F7F7FBD2D2D2EDD3D3D3EDD2D2D2EDD5D5D5EED4D4
      D4F20101013A000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  inherited dxComponentPrinter: TdxComponentPrinter
    inherited dxComponentPrinter1Link1: TdxGridReportLink
      ReportDocument.CreationDate = 41414.664677337960000000
      BuiltInReportLink = True
    end
  end
end
