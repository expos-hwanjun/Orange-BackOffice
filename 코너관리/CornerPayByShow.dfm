inherited CornerPayByShowForm: TCornerPayByShowForm
  Left = 300
  Top = 120
  Caption = #50629#51109' '#44208#51228#49688#45800#48324' '#47588#52636' '#51312#54924
  ClientHeight = 602
  ClientWidth = 964
  ExplicitWidth = 980
  ExplicitHeight = 641
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
      Width = 801
      ExplicitWidth = 801
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
        ExplicitHeight = 24
        Height = 24
        AnchorX = 448
        AnchorY = 14
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        ExplicitWidth = 197
        Width = 197
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 677
        ExplicitLeft = 677
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
    Height = 531
    RootLevelOptions.DetailTabsPosition = dtpTop
    OnActiveTabChanged = GridActiveTabChanged
    ExplicitWidth = 958
    ExplicitHeight = 531
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
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewColumn9
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewColumn10
        end>
      DataController.Data = {
        090100000F00000044617461436F6E74726F6C6C6572310A0000001200000054
        6378537472696E6756616C7565547970651400000054637843757272656E6379
        56616C7565547970651400000054637843757272656E637956616C7565547970
        651400000054637843757272656E637956616C75655479706514000000546378
        43757272656E637956616C7565547970651400000054637843757272656E6379
        56616C7565547970651400000054637843757272656E637956616C7565547970
        651400000054637843757272656E637956616C75655479706514000000546378
        43757272656E637956616C7565547970651400000054637843757272656E6379
        56616C75655479706500000000}
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      object GridTableViewColumn1: TcxGridColumn
        Caption = #54032#47588#51068#51088
        DataBinding.FieldName = 'YMD_SALE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 105
      end
      object GridTableViewColumn2: TcxGridColumn
        Caption = #52509#54032#47588#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 100
      end
      object GridTableViewColumn10: TcxGridColumn
        Caption = #49688#49688#47308'('#44540#49324#52824')'
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_FEE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Visible = False
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 80
      end
      object GridTableViewColumn3: TcxGridColumn
        Caption = #54788#44552
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASH'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 100
      end
      object GridTableViewColumn5: TcxGridColumn
        Caption = #54788#44552#50689#49688#51613
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASHRCP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 100
      end
      object GridTableViewColumn4: TcxGridColumn
        Caption = #49888#50857#52852#46300
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CARD'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 100
      end
      object GridTableViewColumn6: TcxGridColumn
        Caption = #49345#54408#44428
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_GIFT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 100
      end
      object GridTableViewColumn7: TcxGridColumn
        Caption = #50808#49345
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
      object GridTableViewColumn8: TcxGridColumn
        Caption = 'OK'#52880#49772#48177
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_OKC'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 100
      end
      object GridTableViewColumn9: TcxGridColumn
        Caption = 'T-money'
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TMONEY'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 100
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
          Column = GridBandedTableView1SaleAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column5
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1CashAmt
        end
        item
          Format = ',0'
          Kind = skAverage
          Column = GridBandedTableView1Column7
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column8
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1CardAmt1
        end
        item
          Format = ',0'
          Kind = skAverage
          Column = GridBandedTableView1Column10
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column11
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1CashReceipt1
        end
        item
          Format = ',0'
          Kind = skAverage
          Column = GridBandedTableView1Column13
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column14
        end
        item
          Format = ',0'
          Kind = skSum
        end
        item
          Format = ',0'
          Kind = skAverage
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
          Kind = skAverage
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
          Kind = skAverage
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
          Kind = skAverage
        end
        item
          Format = ',0'
          Kind = skSum
        end
        item
          Format = '0.00%'
          Kind = skAverage
          Column = GridBandedTableView1Column3
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1CashReceipt2
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1CardAmt2
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      Bands = <
        item
          Caption = #50629#51109
          Width = 270
        end
        item
          Caption = #52509#47588#52636
          Width = 190
        end
        item
          Caption = #54788#44552
          Width = 260
        end
        item
          Caption = #54788#44552#50689#49688#51613
          Width = 350
        end
        item
          Caption = #49888#50857#52852#46300
          Width = 350
        end>
      object GridBandedTableView1CornerName: TcxGridBandedColumn
        Tag = 98
        Caption = #50629#51109#51060#47492
        DataBinding.FieldName = 'NM_TRDPL'
        HeaderAlignmentHorz = taCenter
        Width = 150
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column3: TcxGridBandedColumn
        Tag = 98
        Caption = #49688#49688#47308#50984
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'RATE_FEE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '0.00%'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 60
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableView1SaleAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #54032#47588#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 100
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column5: TcxGridBandedColumn
        Tag = 98
        Caption = #49688#49688#47308#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_FEE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 90
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableView1CashAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #54032#47588#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASH'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 96
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column7: TcxGridBandedColumn
        Tag = 98
        Caption = #49688#49688#47308#50984
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'RATE_FEE_CASH'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '0.00%'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 65
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column8: TcxGridBandedColumn
        Tag = 98
        Caption = #49688#49688#47308#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASH_FEE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 99
        Position.BandIndex = 2
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GridBandedTableView1CardAmt1: TcxGridBandedColumn
        Tag = 98
        Caption = #51088#52404' '#44208#51228
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CARD'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 100
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView1CardAmt2: TcxGridBandedColumn
        Tag = 98
        Caption = #51649#50689' '#45824#54665
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CARD_MART'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Options.Grouping = False
        Options.Moving = False
        Width = 100
        Position.BandIndex = 4
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column10: TcxGridBandedColumn
        Tag = 98
        Caption = #49688#49688#47308#50984
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'RATE_FEE_CARD'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '0.00%'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 60
        Position.BandIndex = 4
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column11: TcxGridBandedColumn
        Tag = 98
        Caption = #49688#49688#47308#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CARD_FEE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 90
        Position.BandIndex = 4
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object GridBandedTableView1CashReceipt1: TcxGridBandedColumn
        Tag = 98
        Caption = #51088#52404' '#44208#51228
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASHRCP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 100
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView1CashReceipt2: TcxGridBandedColumn
        Tag = 98
        Caption = #51649#50689' '#45824#54665
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASHRCP_MART'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Options.Grouping = False
        Options.Moving = False
        Width = 100
        Position.BandIndex = 3
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column13: TcxGridBandedColumn
        Tag = 98
        Caption = #49688#49688#47308#50984
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'RATE_FEE_CASHRCP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '0.00%'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 60
        Position.BandIndex = 3
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column14: TcxGridBandedColumn
        Tag = 98
        Caption = #49688#49688#47308#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASHRCP_FEE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 90
        Position.BandIndex = 3
        Position.ColIndex = 3
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
          Column = GridBandedTableView2Column2
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView2Column3
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView2Column4
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView2Column5
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView2Column6
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView2Column7
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView2Column8
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView2Column9
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
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      Bands = <
        item
          Caption = #52509#47588#52636
          Width = 270
        end
        item
          Caption = #54788#44552
          Width = 188
        end
        item
          Caption = #54788#44552#50689#49688#51613
          Width = 196
        end
        item
          Caption = #49888#50857#52852#46300
          Width = 200
        end>
      object GridBandedTableView2Column1: TcxGridBandedColumn
        Tag = 98
        Caption = #54032#47588#51068#51088
        DataBinding.FieldName = 'YMD_SALE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 90
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView2Column2: TcxGridBandedColumn
        Tag = 98
        Caption = #54032#47588#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 106
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableView2Column3: TcxGridBandedColumn
        Tag = 98
        Caption = #49688#49688#47308
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_FEE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 74
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GridBandedTableView2Column4: TcxGridBandedColumn
        Tag = 98
        Caption = #54032#47588#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASH'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 103
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView2Column5: TcxGridBandedColumn
        Tag = 98
        Caption = #49688#49688#47308
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASH_FEE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 85
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableView2Column6: TcxGridBandedColumn
        Tag = 98
        Caption = #54032#47588#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASHRCP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 119
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView2Column7: TcxGridBandedColumn
        Tag = 98
        Caption = #49688#49688#47308
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASHRCP_FEE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 77
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableView2Column8: TcxGridBandedColumn
        Tag = 98
        Caption = #54032#47588#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CARD'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 123
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView2Column9: TcxGridBandedColumn
        Tag = 98
        Caption = #49688#49688#47308
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CARD_FEE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 77
        Position.BandIndex = 3
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
    end
    inherited GridLevel: TcxGridLevel
      Caption = ' '#50629#51109#48324' '
      GridView = GridBandedTableView1
    end
    object GridLevel1: TcxGridLevel
      Caption = ' '#51068#51088#48324' '
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
      494C010104000800B40010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
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
      00000000000000000000000000000000000014100F005E5C5B00000000000000
      000000000000000000000000000000000000000000030000004B313131D48183
      83FF5D5D5DF7242424CF555656DFDFCFBDFFFFE8C7FFFFFFF0FFFFFFFFFFFFFF
      FFFFFFFFFFFFF0F2F4FFC1B9B3F70E0C0B61000000000000000A131010764D3E
      41B73E2A2EAB442F34BAC3B2B8F5F6E9ECFFF4D6D7FFF6D1D3FFC3A2A3EF947F
      80D9C0AFB1E8C8ADAFF5080607640000000C5A9B71EFB0C8BAFFC9CCCBFFCEDA
      D5FFD7E5DEFFECFAF6FFD6EBDEFFBDD9C5FFACD3B9FFD8EEE1FFA8D2B3FF4F92
      56FF347939FFB1D4B9FF828486DE0000002E0000000000000000000000000000
      000000000000000000002823200024231F002724200026242400000000000000
      0000000000000000000000000000000000000000003E373635DD9F9FA1FFC8C9
      CAFFC7C8C7FFB0B2B4FF949393FF9F8773FFB89D85FECCB59FFEE0C8B1FEF4E3
      D0FEFFF6E5FFF1E7E0FF474747B60000002D0000000000000020866D71DAFDF8
      EFFFABC2B2F7A2A19AEEDDBDC1FCECCFDCFFECCFDDFFE8C7D4FF5F4B51D10B07
      07770604045E020101370000000B0000000055926AEBC7DFD1FFE7FAF1FF79B9
      90FF68A97CFFBBD8C6FF7EB88FFF348847FF2C7E3EFF8DB596FF89BA93FF297E
      32FF33823AFFB0D5B8FF9B9F9FEA0101013B0000000000000000000000003734
      2F0035302D00312E29002D2A25002A272300272721002B2B25002C2A29000000
      00000000000000000000000000000000000009090970939594FFC3C6C5FFD1D1
      D2FFDEDFDFFFD9DEDFFFBEC1C3FFABB0B4FFA6B0B4FFA1A19EFFA29B95FFA191
      80FFA38F7BFF7B7170FD07070871000000000000000001000131997C83DEE3D0
      ABFF6F9A49FF97A852FFF2A55BFFF4AA74FFF2BA98FFF0C2B5FFC1A1A2F27060
      68CD302F31A811111083030202430000001C407E54E096BCA3FFC9E8D7FF4AA1
      68FF42975EFFA8CAB5FFABD5B8FF8DCA9DFF97CBA4FFB9D7C4FFD4EADDFFB4D3
      BCFFABCAB4FFDCF0E5FFACB3B3F30202024700000000000000005E5851003935
      300035322E00322F2B002D282500292621002B272200312F2E00312F2E003332
      2E00363434000000000000000000000000000A0A0A6BACB0AFFED5DAD9FFE7E7
      E7FEEEF5F8FEDED7D4FEBF7857FEB36946FEB58A79FEBBB1AEFEB4B5B5FEB6B3
      BCFEA2A7A4FE6AA869FF111B119E0000000C0000000205030343AC9095EAFBBC
      95FFBEAE76FFBCA761FFDF7B11FFE38017FFE78923FFEC9033FFF59E4BFFFEB2
      70FFEDBD86FFEDD8BFFF3F3438B20603045D3E7E53E2699E79FFEAF5ECFFDBEF
      E3FFDCEEE3FFF6FBF9FFE2ECE8FF9DA7A1FF9EA9A2FFF1FAF9FFC6DECEFF6B9E
      74FF46834EFF8FB696FFC1C8C7FC0404045600000000000000005E5851005E58
      51003F3D35003A3A3400312E2A002F2C27002C2925002B2A260045463D004846
      4500535149000000000000000000000000000606065EB7BBB9FBF5F7F7FFF6F6
      F7FFF9FFFFFFEBC7ACFFD36625FFCA5716FFC25319FFBB5625FFB4572AFFBE87
      71FFD6D6D6FFD3F1D9FF2126219D0000000C000000060B090954C7A8AAF6FAB8
      8DFFE9C79BFFE5BE8CFFD97A1BFFDA7917FFDA7A18FFDC7C18FFDD801AFFE280
      16FFE98516FFFFD0A1FF42393DB10403035748875DE2649F7AFFE8F1EAFFD8E6
      DFFFA1C6B0FFA2C7B0FF527157FF141B14FF49684FFFDBEAE1FFBDDAC4FF4593
      52FF34823CFF85B58CFFCED9D6FF0707076300000000000000005F5B56004542
      3D003F3B3600393534002429200094928700847B7200434139004C4944005451
      490058585200000000000000000000000000010202478A8B8BE4EFF0F0FFE3EC
      F2FFE7DCD3FEE8995EFEE88336FEE5853EFEE17E39FEDA7430FECF5A13FEC96C
      36FEEAE0D9FFFFFFFFFF1C1B1C8A000000050000000A0D0B0C63F2C7C4FFDAA9
      77FF84987EFFAB9869FFDB7B1DFFDD7D1DFFDD8223FFDE8628FFDE8A2CFFDC86
      26FFE08B27FFFFCDA4FF2F282BA101010141508E67E270AB8AFFDDECE4FFD8E9
      E0FF7ABB92FF338450FF002F05FF4B6C53FFCCE0D2FFDDEDE3FFDFF0E7FFC3DE
      CAFFBBD5C2FFD1E7DAFFDCE8E4FF0A0A0A7200000000000000004E4946001B18
      1400D4D5C500BCB1A90088847900827970006F6F630044453B004B4A46005450
      4B005D555500000000000000000000000000000000070304044A52575BC7C9CA
      CAFFCC8C66FFCC6524FFD5712EFFDE7934FFE58138FFEB873AFFEE8739FFF2BE
      98FFFFFFFFFFD9DBDCFB06060658000000000000001314111278FFD1C7FFC8A9
      7EFF42BECCFF64B7B6FFD4822AFFE28220FFE08A2DFFE29134FFE4973AFFE294
      34FFEA9E3DFFFFD4B3FF231E20930000003158946DE274AC8BFFCBE2D4FFFFFF
      FFFFD5E8DEFF2A734BFF024C1BFF639875FFD9E4DCFFFEFEFFFFDEEDE5FF8CB5
      94FF4F8A5AFF679B70FFD5E6DDFF111112830000000000000000D7CEC100C4B8
      B600B0A39B00847F76007C736A00666059006660590057544C005D5958005352
      480059594D00000000000000000000000000000000000000000008060548B99C
      81EBE0C1A4FFD5A586FFCF936DFFC68155FFC67544FFCE7237FFD79363FFECE5
      E0FFECEDEEFF333232A200000013000000000000002A241F2191FFDAD2FFD89D
      62FFB89F75FFC29456FFDA8527FFE18B2CFFE39438FFE69C40FFE9A347FFE7A0
      42FFF1AF52FFFCD7BCFF171416820000001F659E7AE586B498FFC7E0D0FFFAFC
      FBFF75AE93FF096839FF64A481FF5EA874FF5C986EFFC9DAD0FFDFEDE4FF67A9
      75FF3D8E4AFF6BA473FFDEF0E6FF1D1D1D98000000000000000000000000746E
      67006C665F0075796E0028251D0030302A003C3837004F4747004C4D44005152
      490044473E005E585100000000000000000000000000000000000C070344CDAE
      93E9FFFEECFFFFEDD3FFFCE4CAFFEDD9BEFFE3C8AEFF705A4ECE1D1E1E872A2D
      2F952424248D00000021000000000000000002010140352F31A1FFDACEFFDD8D
      47FFE19353FFE48D40FFE08625FFE29336FFE59D43FFE9A64DFFEDAE56FFEBAD
      51FFF8C16CFFF5DBC7FF0F0E0F74000000125B906ED9A8C6B4FFC5DDCEFFEFF9
      F6FF6FB393FF80BBA0FFF2FAF5FFD1EBDAFFA7CFB4FFBCD6C5FFEAF6F2FFDBEF
      E2FFD4EADBFFC1D0C7EEBBBFBDDD1414146B0000000000000000000000000000
      0000615C59001714100058514800555349005451490055534B00DFD4B8004B4C
      420052514700272F24000000000000000000000000000201001D83644BC0FFFF
      FFFFFFFFFFFFFFF8EEFFFFF3E3FFFFF8E7FFCCB499E606050434000000010000
      0007000000030000000000000000000000000B090A63544F52B7FFDDCDFFDA7E
      2EFFDA8C35FFD88F3CFFDA7E15FFE08D24FFE49A35FFE9A745FFEEB253FFEEB4
      53FFFECF7CFFEBD9CBFF0A090A650000000A1F472C9DC9DCD1FFC7D9CEFFE1F1
      E8FFE7F4ECFFEFF5F2FFE9F1EDFFE6F0ECFFE5EFEBFFD5E8DEFFC8DFD3FFDFEB
      E6FFB8D0C0FC353F3A8A0A0A0A350000000F0000000000000000000000000000
      0000000000005753520071685F006D6762006A6A5C006B695F0073706B007273
      6F007C7B77000000000000000000000000000000000003020124644E3FABA08F
      82D2BCAC9FE2E0DAD5F3FEFBF9FFFEFCFAFF4C37269600000000000000000000
      000000000000000000000000000000000000100E0E73615C5EC8FFF6F3FFFFCB
      ABFFFDC59AFFFABE8BFFF8B878FFF6B771FFF3B96EFFF3BD6DFFF3C06DFFF3BE
      5EFFFFDC8BFFD6CCC2FD0B090A5D000000080108033A7FAF8EE8EEEAEEFFD2DF
      D6FFCEDED2FFCADCCFFFBFD7C8FFBFD7C8FFC0D6C8FFBED5C7FFB9D3C2FFD0DE
      D5FF9CBFA9F90A120C5900000000000000000000000000000000000000000000
      000000000000000000008A877900827F7B008283790088867E005E5851000000
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
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000000000000FFFF
      000000000000FF3F000000000000FC3F000000000000E01F000000000000C007
      000000000000C007000000000000C007000000000000C007000000000000C007
      000000000000E003000000000000F003000000000000F807000000000000FC1F
      000000000000FFFF000000000000FFFF00000000000000000000000000000000
      000000000000}
  end
  inherited ButtonToolBarPrintButtonPopupMenu: TPopupMenu
    inherited ButtonToolBarPrintButtonPopupMenuReceipt: TMenuItem
      ImageIndex = 3
      Visible = True
    end
  end
  inherited dxComponentPrinter: TdxComponentPrinter
    Top = 168
    inherited dxComponentPrinter1Link1: TdxGridReportLink
      PrinterPage.PageHeader.CenterTitle.Strings = (
        #51076#45824#50629#51109' '#44208#51228#49688#45800#48324' '#49688#49688#47308' '#51312#54924)
      ReportDocument.CreationDate = 40423.402123842590000000
      BuiltInReportLink = True
    end
  end
end
