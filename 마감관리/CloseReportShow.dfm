inherited CloseReportShowForm: TCloseReportShowForm
  Left = 300
  Top = 120
  Caption = #50689#50629#51068#48372' '#51312#54924
  ClientHeight = 685
  ClientWidth = 1366
  HelpFile = #54980#48169'/'#47560#44048#44288#47532'/'#50689#50629#51068#48372#51312#54924'.htm'
  OnDestroy = FormDestroy
  ExplicitWidth = 1382
  ExplicitHeight = 724
  PixelsPerInch = 96
  TextHeight = 17
  object SaleSplitter: TAdvSplitter [0]
    Left = 0
    Top = 236
    Width = 1366
    Height = 6
    Cursor = crVSplit
    Align = alTop
    AutoSnap = False
    MinSize = 80
    Appearance.BorderColor = clNone
    Appearance.BorderColorHot = clNone
    Appearance.Color = 14542308
    Appearance.ColorTo = 16768709
    Appearance.ColorHot = 15383705
    Appearance.ColorHotTo = 14922381
    GripStyle = sgFlatDots
    ExplicitTop = 274
    ExplicitWidth = 949
  end
  object PaySplitter: TAdvSplitter [1]
    Left = 0
    Top = 342
    Width = 1366
    Height = 6
    Cursor = crVSplit
    Align = alTop
    AutoSnap = False
    MinSize = 80
    Appearance.BorderColor = clNone
    Appearance.BorderColorHot = clNone
    Appearance.Color = 14542308
    Appearance.ColorTo = 16768709
    Appearance.ColorHot = 15383705
    Appearance.ColorHotTo = 14922381
    GripStyle = sgFlatDots
    ExplicitLeft = 8
    ExplicitTop = 385
    ExplicitWidth = 949
  end
  object PosSplitter: TAdvSplitter [2]
    Left = 0
    Top = 545
    Width = 1366
    Height = 6
    Cursor = crVSplit
    Align = alTop
    AutoSnap = False
    MinSize = 80
    Appearance.BorderColor = clNone
    Appearance.BorderColorHot = clNone
    Appearance.Color = 14542308
    Appearance.ColorTo = 16768709
    Appearance.ColorHot = 15383705
    Appearance.ColorHotTo = 14922381
    GripStyle = sgFlatDots
    ExplicitLeft = 8
    ExplicitTop = 527
    ExplicitWidth = 949
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1366
    ExplicitWidth = 1366
    inherited ButtonToolBar: TAdvToolBar
      Left = 1078
      ExplicitLeft = 1078
      inherited ButtonToolBarSeparator2: TAdvToolBarSeparator
        Visible = False
      end
      inherited ButtonToolBarPrintButton: TAdvGlowMenuButton
        Visible = False
      end
    end
    inherited ConditionToolBar: TAdvToolBar
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        Visible = True
        OnKeyDown = ConditionToolBarFromDateEditKeyDown
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
    AlignWithMargins = False
    Left = 0
    Top = 242
    Width = 1366
    Height = 0
    Align = alTop
    Visible = False
    ExplicitLeft = 0
    ExplicitTop = 242
    ExplicitWidth = 1366
    ExplicitHeight = 0
  end
  object PayGrid: TcxGrid [5]
    Left = 0
    Top = 242
    Width = 1366
    Height = 100
    Align = alTop
    TabOrder = 2
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object PayGridBandedTableView: TcxGridBandedTableView
      Navigator.Buttons.CustomButtons = <>
      FilterBox.CustomizeDialog = False
      FilterBox.Visible = fvNever
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.BandMoving = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsView.GroupByBox = False
      Bands = <
        item
          Caption = #44396#48516
          Width = 108
        end
        item
          Caption = #54788#44552
        end
        item
          Caption = #54788#44552#50689#49688#51613
        end
        item
          Caption = #49888#50857#52852#46300
        end
        item
          Caption = #47131#52768#50724#45908
          Width = 134
        end
        item
          Caption = #50808#49345
        end
        item
          Caption = #49345#54408#44428
        end
        item
          Caption = #44228#51340#51077#44552
        end
        item
          Caption = #54252#51064#53944
        end
        item
          Caption = #49828#53596#54532
        end>
      object PayGridBandedTableViewType: TcxGridBandedColumn
        Tag = 98
        Caption = #44396#48516
        DataBinding.FieldName = 'GUBUN'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 45
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object PayGridBandedTableViewCashQty: TcxGridBandedColumn
        Tag = 98
        Caption = #44148#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'QTY_CASH'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 40
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object PayGridBandedTableViewCashAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASH'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 90
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object PayGridBandedTableViewCashReceiptQty: TcxGridBandedColumn
        Tag = 98
        Caption = #44148#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'QTY_CASHRCP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 40
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object PayGridBandedTableViewCashReceiptAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASHRCP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 90
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object PayGridBandedTableViewCardQty: TcxGridBandedColumn
        Tag = 98
        Caption = #44148#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'QTY_CARD'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 40
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object PayGridBandedTableViewCardAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CARD'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 90
        Position.BandIndex = 3
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object PayGridBandedTableViewLetsOrderQty: TcxGridBandedColumn
        Caption = #44148#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'QTY_LETSORDER'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object PayGridBandedTableViewLetsOrderAmt: TcxGridBandedColumn
        Caption = #44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_LETSORDER'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 4
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object PayGridBandedTableViewCreditQty: TcxGridBandedColumn
        Tag = 98
        Caption = #44148#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'QTY_TRUST'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 40
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object PayGridBandedTableViewCreditAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TRUST'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 90
        Position.BandIndex = 5
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object PayGridBandedTableViewGiftCardQty: TcxGridBandedColumn
        Tag = 98
        Caption = #44148#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'QTY_GIFT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 40
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object PayGridBandedTableViewGiftCardAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_GIFT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 90
        Position.BandIndex = 6
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object PayGridBandedTableViewBankQty: TcxGridBandedColumn
        Caption = #44148#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'QTY_BANK'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object PayGridBandedTableViewBankAmt: TcxGridBandedColumn
        Caption = #44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_BANK'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 7
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object PayGridBandedTableViewPointQty: TcxGridBandedColumn
        Caption = #44148#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'QTY_POINT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object PayGridBandedTableViewPointAmt: TcxGridBandedColumn
        Caption = #44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_POINT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 8
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object PayGridBandedTableViewStampQty: TcxGridBandedColumn
        Caption = #44148#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'QTY_STAMP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 9
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object PayGridBandedTableViewStampAmt: TcxGridBandedColumn
        Caption = #44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_STAMP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 9
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
    end
    object PayGridLevel: TcxGridLevel
      GridView = PayGridBandedTableView
    end
  end
  object PosGrid: TcxGrid [6]
    Left = 0
    Top = 348
    Width = 1366
    Height = 197
    Align = alTop
    TabOrder = 3
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object PosGridBandedTableView: TcxGridBandedTableView
      Navigator.Buttons.CustomButtons = <>
      FilterBox.CustomizeDialog = False
      FilterBox.Visible = fvNever
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.BandMoving = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsView.GroupByBox = False
      Bands = <
        item
          Caption = #44396#48516
        end
        item
          Caption = #47560#44048
        end
        item
          Caption = #48152#54408
        end
        item
          Caption = #47588#52636#52712#49548
        end
        item
          Caption = #51452#47928#52712#49548
        end>
      object PosGridBandedTableViewPosNo: TcxGridBandedColumn
        Tag = 98
        Caption = 'POS'
        DataBinding.FieldName = 'NO_POS'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 45
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object PosGridBandedTableViewCashierName: TcxGridBandedColumn
        Tag = 98
        Caption = #44228#49328#50896
        DataBinding.FieldName = 'NM_SAWON'
        HeaderAlignmentHorz = taCenter
        Width = 80
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object PosGridBandedTableViewReserveAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #51456#48708#44552
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_READY'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 70
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object PosGridBandedTableViewDepositAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #51473#44036#52636#44552
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_MID'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 90
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object PosGridBandedTableViewCashAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #54788#44552#49457' '#54032#47588
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASH'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 90
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object PosGridBandedTableViewOverShortAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #44284#48512#51313
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_LACK'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 70
        Position.BandIndex = 1
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object PosGridBandedTableViewSaleAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #54032#47588#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 90
        Position.BandIndex = 1
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object PosGridBandedTableViewReturnQty: TcxGridBandedColumn
        Tag = 98
        Caption = #44148#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'QTY_RETURN'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 40
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object PosGridBandedTableViewReturnAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_RETURN'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 80
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object PosGridBandedTableViewVoidQty: TcxGridBandedColumn
        Tag = 98
        Caption = #44148#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'CNT_VOID'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 40
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object PosGridBandedTableViewVoidAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_VOID'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 80
        Position.BandIndex = 3
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object PosGridBandedTableViewCancelQty: TcxGridBandedColumn
        Tag = 98
        Caption = #44148#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'QTY_CANCEL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 40
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object PosGridBandedTableViewCancelAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CANCEL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 80
        Position.BandIndex = 4
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
    end
    object PosGridLevel: TcxGridLevel
      GridView = PosGridBandedTableView
    end
  end
  object ChartPanel: TPanel [7]
    Left = 0
    Top = 551
    Width = 1366
    Height = 134
    Align = alClient
    BevelOuter = bvNone
    DoubleBuffered = False
    ParentDoubleBuffered = False
    TabOrder = 5
    OnResize = ChartPanelResize
    object CompanyChartPanel: TPanel
      Left = 0
      Top = 0
      Width = 320
      Height = 134
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
    end
    object ClassChartPanel: TPanel
      Left = 320
      Top = 0
      Width = 320
      Height = 134
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
    end
    object PayChartPanel: TPanel
      Left = 640
      Top = 0
      Width = 726
      Height = 134
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
    end
  end
  object SalePanel: TPanel [8]
    Left = 0
    Top = 65
    Width = 1366
    Height = 171
    Align = alTop
    BevelOuter = bvNone
    DoubleBuffered = False
    ParentDoubleBuffered = False
    TabOrder = 6
    object SaleGrid: TcxGrid
      Left = 0
      Top = 0
      Width = 1145
      Height = 171
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object SaleGridTableView: TcxGridTableView
        Tag = 99
        Navigator.Buttons.CustomButtons = <>
        FilterBox.CustomizeDialog = False
        FilterBox.Visible = fvNever
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsView.GroupByBox = False
        Styles.ContentEven = StyleEven
        object SaleGridTableViewType: TcxGridColumn
          Caption = #44396#48516
          DataBinding.FieldName = 'GUBUN'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 45
        end
        object SaleGridTableViewAmt: TcxGridColumn
          Caption = #52509' '#47588#52636#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_TOT'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
        object SaleGridTableViewDCAmt: TcxGridColumn
          Caption = #54624#51064#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'DC_TOT'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Width = 80
        end
        object SaleGridTableViewServiceAmt: TcxGridColumn
          Caption = #49436#48708#49828#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_SERVICE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Width = 75
        end
        object SaleGridTableViewSaleAmt: TcxGridColumn
          Caption = #47588#52636#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_SALE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
        object SaleGridTableViewNoTaxNetAmt: TcxGridColumn
          Caption = #47732#49464#47588#52636
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_DUTYFREE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
        object SaleGridTableViewTaxNetAmt: TcxGridColumn
          Caption = #44284#49464#44277#44553#44032
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_NET_SUPPLY'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
        object SaleGridTableViewVatAmt: TcxGridColumn
          Caption = #48512#44032#49464
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_TAX'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Width = 80
        end
        object SaleGridTableViewCustomerQty: TcxGridColumn
          Caption = #44061#49688
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'QTY_CUST'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Width = 50
        end
        object SaleGridTableViewCustomerAmt: TcxGridColumn
          Caption = #44061#45800#44032
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_CUST'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Width = 70
        end
        object SaleGridTableViewDeliveryCount: TcxGridColumn
          Caption = #48176#45804#44148#49688
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'CNT_DELIVERY'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 70
        end
        object SaleGridTableViewDeliveryAmt: TcxGridColumn
          Caption = #48176#45804#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_DELIVERY'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 90
        end
        object SaleGridTableViewDeliveryRate: TcxGridColumn
          Caption = #48176#45804#48708#50984
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'RATE_DELIVERY'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '0.00%'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Width = 55
        end
        object SaleGridTableViewDutyAmt: TcxGridColumn
          Tag = 99
          Caption = #44284#49464#47588#52636
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_NET'
          Visible = False
          Width = 90
        end
        object SaleGridTableViewEventSaleAmt: TcxGridColumn
          Caption = #54665#49324#47588#52636
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_SALE_EVENT'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
        end
        object SaleGridTableViewProfitAmt: TcxGridColumn
          Caption = #51060#51061#44552#50529
          DataBinding.FieldName = 'AMT_PROFIT'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Options.Focusing = False
        end
        object SaleGridTableViewProfitRate: TcxGridColumn
          Caption = #51060#51061#50984
          DataBinding.FieldName = 'RATE_PROFIT'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '0.00%'
          HeaderAlignmentHorz = taCenter
          Options.Focusing = False
        end
      end
      object DCGridTableView: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        object DCGridTableViewType: TcxGridColumn
          Caption = #44396#48516
          DataBinding.FieldName = 'GUBUN'
          Width = 50
        end
        object DCGridTableViewDCQty: TcxGridColumn
          Caption = #54624#51064#54943#49688
          DataBinding.ValueType = 'Integer'
          DataBinding.FieldName = 'QTY_DC'
          Width = 60
        end
        object DCGridTableViewDCAmt: TcxGridColumn
          Caption = #54624#51064#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_DC'
          Width = 90
        end
      end
      object ClassGridTableView: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        object ClassGridTableViewColumn1: TcxGridColumn
          DataBinding.FieldName = 'NM_CLASS'
        end
        object ClassGridTableViewColumn2: TcxGridColumn
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_SALE'
        end
        object ClassGridTableViewColumn3: TcxGridColumn
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'RATE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '.00%'
        end
      end
      object WorkGridTableView: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        object WorkGridTableViewSawonCode: TcxGridColumn
          DataBinding.FieldName = 'CD_SAWON'
        end
        object WorkGridTableViewSawonName: TcxGridColumn
          DataBinding.FieldName = 'NM_SAWON'
        end
        object WorkGridTableViewComeTime: TcxGridColumn
          DataBinding.FieldName = 'SETTLE_IN'
        end
        object WorkGridTableViewLeaveTime: TcxGridColumn
          DataBinding.FieldName = 'SETTLE_OUT'
        end
        object WorkGridTableViewWorkTime: TcxGridColumn
          DataBinding.FieldName = 'WORK_TIME'
        end
      end
      object AcctGridTableView: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        object AcctGridTableViewAcctName: TcxGridColumn
          DataBinding.FieldName = 'NM_ACCT'
        end
        object AcctGridTableViewInAmt: TcxGridColumn
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_PAYIN'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
        end
        object AcctGridTableViewOutAmt: TcxGridColumn
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_OUT'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
        end
        object AcctGridTableViewRemark: TcxGridColumn
          DataBinding.FieldName = 'REMARK'
        end
      end
      object SaleGridLevel: TcxGridLevel
        GridView = SaleGridTableView
      end
      object DCGridLevel: TcxGridLevel
        GridView = DCGridTableView
        Visible = False
      end
      object ClassGridLevel: TcxGridLevel
        GridView = ClassGridTableView
      end
      object WorkGridLevel: TcxGridLevel
        GridView = WorkGridTableView
      end
      object AcctGridLevel: TcxGridLevel
        GridView = AcctGridTableView
      end
    end
    object SumChartPanel: TPanel
      Left = 1145
      Top = 0
      Width = 221
      Height = 171
      Align = alRight
      BevelOuter = bvNone
      DoubleBuffered = False
      ParentDoubleBuffered = False
      TabOrder = 1
    end
  end
  inherited EditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 35
    PixelsPerInch = 96
  end
  inherited ToolBarStyler: TAdvToolBarOfficeStyler
    Left = 70
  end
  inherited StyleRepository: TcxStyleRepository
    Left = 1
    PixelsPerInch = 96
  end
  inherited Exec_Timer: TTimer
    OnTimer = Exec_TimerTimer
    Left = 171
  end
  inherited Query: TdxMemData
    Left = 108
  end
  inherited ButtonToolBarPrintButtonImageList: TImageList
    Left = 219
    Bitmap = {
      494C010103000800DC0110001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
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
  inherited ButtonToolBarPrintButtonPopupMenu: TPopupMenu
    Left = 285
    Top = 18
  end
  inherited dxComponentPrinter: TdxComponentPrinter
    Left = 325
    Top = 26
    inherited dxComponentPrinter1Link1: TdxGridReportLink
      PrinterPage.ScaleMode = smAdjust
      ReportDocument.CreationDate = 41432.707623009250000000
      ShrinkToPageWidth = False
      BuiltInReportLink = True
    end
  end
  object FastReportDCDataSet: TfrxUserDataSet
    UserName = 'FastReportDCDataSet'
    OnCheckEOF = FastReportDCDataSetCheckEOF
    Fields.Strings = (
      'GUBUN'
      'QTY_DC'
      'AMT_DC')
    OnNewGetValue = FastReportDCDataSetNewGetValue
    Left = 187
    Top = 95
  end
  object FastReportPosDataSet: TfrxUserDataSet
    UserName = 'FastReportPosDataSet'
    OnCheckEOF = FastReportPosDataSetCheckEOF
    Fields.Strings = (
      'NO_POS'
      'NM_SAWON'
      'AMT_READY'
      'AMT_MID'
      'AMT_CASH'
      'AMT_LACK'
      'AMT_SALE'
      'QTY_RETURN'
      'AMT_RETURN'
      'CNT_VOID'
      'AMT_VOID'
      'QTY_CANCEL'
      'AMT_CANCEL'
      'QTY_MODIFY'
      'AMT_MODIFY')
    OnNewGetValue = FastReportPosDataSetNewGetValue
    Left = 149
    Top = 95
  end
  object FastReportPayDataSet: TfrxUserDataSet
    UserName = 'FastReportPayDataSet'
    OnCheckEOF = FastReportPayDataSetCheckEOF
    Fields.Strings = (
      'GUBUN'
      'QTY_CASH'
      'AMT_CASH'
      'QTY_CASHRCP'
      'AMT_CASHRCP'
      'QTY_CARD'
      'AMT_CARD'
      'QTY_CHECK'
      'AMT_CHECK'
      'QTY_TRUST'
      'AMT_TRUST'
      'QTY_GIFT'
      'AMT_GIFT'
      'QTY_BANK'
      'AMT_BANK'
      'AMT_POINT'
      'AMT_STAMP')
    OnNewGetValue = FastReportPayDataSetNewGetValue
    Left = 111
    Top = 95
  end
  object FastReportSaleDataSet: TfrxUserDataSet
    UserName = 'FastReportSaleDataSet'
    OnCheckEOF = FastReportSaleDataSetCheckEOF
    Fields.Strings = (
      'GUBUN'
      'AMT_TOT'
      'DC_TOT'
      'AMT_SALE'
      'AMT_NET'
      'AMT_DUTYFREE'
      'AMT_DELIVERY'
      'AMT_PLAN'
      'RATE_PLAN'
      'QTY_CUST'
      'AMT_CUST'
      'AMT_PROFIT'
      'RATE_PROFIT')
    OnNewGetValue = FastReportSaleDataSetNewGetValue
    Left = 65
    Top = 95
  end
  object FastReport: TfrxReport
    Version = '6.4.9'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbZoom, pbNavigator, pbExportQuick, pbNoFullScreen]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40296.586905231500000000
    ReportOptions.LastChange = 40489.552695127300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 10
    Top = 95
    Datasets = <
      item
        DataSet = FastReportAcctDataSet
        DataSetName = 'FastReportAcctDataSet'
      end
      item
        DataSet = FastReportClassDataSet
        DataSetName = 'FastReportClassDataSet'
      end
      item
        DataSet = FastReportDCDataSet
        DataSetName = 'FastReportDCDataSet'
      end
      item
        DataSet = FastReportPayDataSet
        DataSetName = 'FastReportPayDataSet'
      end
      item
        DataSet = FastReportPosDataSet
        DataSetName = 'FastReportPosDataSet'
      end
      item
        DataSet = FastReportSaleDataSet
        DataSetName = 'FastReportSaleDataSet'
      end
      item
        DataSet = FastReportWorkDataSet
        DataSetName = 'FastReportWorkDataSet'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page: TfrxReportPage
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.001250000000000000
      RightMargin = 10.001250000000000000
      TopMargin = 14.999229166666700000
      BottomMargin = 10.001250000000000000
      Frame.Typ = []
      MirrorMode = []
      object PageFooter: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 1065.827460000000000000
        Width = 718.101251175000100000
        object ExtremeMartLabel: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #46027#50880
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Orange')
          ParentFont = False
          WordWrap = False
        end
        object PageLabel: TfrxSysMemoView
          Align = baCenter
          AllowVectorExport = True
          Left = 311.806500587500000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #46027#50880
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[PAGE#] / [TOTALPAGES#]')
          ParentFont = False
        end
        object ProgramNameLabel: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 623.613001175000100000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #46027#50880
          Font.Style = []
          Frame.Typ = []
          ParentFont = False
          WordWrap = False
        end
      end
      object ReportTitle: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 49.133890000000000000
        Top = 18.897650000000000000
        Width = 718.101251175000100000
        object TitleLabel: TfrxMemoView
          Align = baCenter
          AllowVectorExport = True
          Left = 245.664798817500000000
          Width = 226.771653540000000000
          Height = 49.133853390000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          Frame.DropShadow = True
          Frame.ShadowColor = clNavy
          Frame.ShadowWidth = 3.000000000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSkyBlue
          HAlign = haCenter
          Memo.UTF8W = (
            #50689#50629#51068#48372)
          ParentFont = False
        end
        object DateLabel: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 566.920148815000100000
          Top = 22.677180000000000000
          Width = 151.181102360000000000
          Height = 26.456710000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          ParentFont = False
          WordWrap = False
        end
      end
      object SaleData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #46027#50880#52404
        Font.Style = []
        Height = 24.566929130000000000
        ParentFont = False
        Top = 207.874150000000000000
        Width = 718.101251175000100000
        DataSet = FastReportSaleDataSet
        DataSetName = 'FastReportSaleDataSet'
        RowCount = 0
        object SaleTypeLabel: TfrxMemoView
          AllowVectorExport = True
          Width = 37.795300000000000000
          Height = 24.566929130000000000
          DataField = 'GUBUN'
          DataSet = FastReportSaleDataSet
          DataSetName = 'FastReportSaleDataSet'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportSaleDataSet."GUBUN"]')
          VAlign = vaCenter
        end
        object SaleAmtLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 38.000000000000000000
          Width = 99.150000000000000000
          Height = 24.566929130000000000
          DataField = 'AMT_TOT'
          DataSet = FastReportSaleDataSet
          DataSetName = 'FastReportSaleDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportSaleDataSet."AMT_TOT"]')
          VAlign = vaCenter
        end
        object SaleNetAmtLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 215.800000000000000000
          Width = 99.150000000000000000
          Height = 24.566929130000000000
          DataField = 'AMT_SALE'
          DataSet = FastReportSaleDataSet
          DataSetName = 'FastReportSaleDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportSaleDataSet."AMT_SALE"]')
          VAlign = vaCenter
        end
        object SaleNotAmtLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 137.440000000000000000
          Width = 78.610000000000000000
          Height = 24.566929130000000000
          DataField = 'DC_TOT'
          DataSet = FastReportSaleDataSet
          DataSetName = 'FastReportSaleDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportSaleDataSet."DC_TOT"]')
          VAlign = vaCenter
        end
        object SaleVatAmtLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 314.940000000000000000
          Width = 95.150000000000000000
          Height = 24.566929130000000000
          DataField = 'AMT_NET'
          DataSet = FastReportSaleDataSet
          DataSetName = 'FastReportSaleDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportSaleDataSet."AMT_NET"]')
          VAlign = vaCenter
        end
        object SaleCustomerQtyLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 488.338900000000000000
          Width = 48.000000000000000000
          Height = 24.566929130000000000
          DataField = 'QTY_CUST'
          DataSet = FastReportSaleDataSet
          DataSetName = 'FastReportSaleDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportSaleDataSet."QTY_CUST"]')
          VAlign = vaCenter
        end
        object SaleCustomerAmtLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 535.913730000000000000
          Width = 57.448818900000000000
          Height = 24.566929130000000000
          DataField = 'AMT_CUST'
          DataSet = FastReportSaleDataSet
          DataSetName = 'FastReportSaleDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportSaleDataSet."AMT_CUST"]')
          VAlign = vaCenter
        end
        object SaleProfitAmtLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 593.386210000000000000
          Width = 79.370076300000000000
          Height = 24.566929130000000000
          DataField = 'AMT_PROFIT'
          DataSet = FastReportSaleDataSet
          DataSetName = 'FastReportSaleDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportSaleDataSet."AMT_PROFIT"]')
          VAlign = vaCenter
        end
        object SaleProfitRateLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 672.756340000000000000
          Width = 45.354328270000000000
          Height = 24.566929130000000000
          DataField = 'RATE_PROFIT'
          DataSet = FastReportSaleDataSet
          DataSetName = 'FastReportSaleDataSet'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportSaleDataSet."RATE_PROFIT"]')
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 410.000000000000000000
          Width = 78.000000000000000000
          Height = 24.566929130000000000
          DataField = 'AMT_DUTYFREE'
          DataSet = FastReportSaleDataSet
          DataSetName = 'FastReportSaleDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportSaleDataSet."AMT_DUTYFREE"]')
          VAlign = vaCenter
        end
      end
      object PayData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #46027#50880#52404
        Font.Style = []
        Height = 24.566929130000000000
        ParentFont = False
        Top = 336.378170000000000000
        Width = 718.101251175000100000
        DataSet = FastReportPayDataSet
        DataSetName = 'FastReportPayDataSet'
        RowCount = 0
        object PayTypeLabel: TfrxMemoView
          AllowVectorExport = True
          Width = 37.795300000000000000
          Height = 24.566929130000000000
          DataField = 'GUBUN'
          DataSet = FastReportPayDataSet
          DataSetName = 'FastReportPayDataSet'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportPayDataSet."GUBUN"]')
          VAlign = vaCenter
        end
        object PayCashAmtLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795275590000000000
          Width = 89.039370080000000000
          Height = 24.566929130000000000
          DataField = 'AMT_CASH'
          DataSet = FastReportPayDataSet
          DataSetName = 'FastReportPayDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportPayDataSet."AMT_CASH"]')
          VAlign = vaCenter
        end
        object PayCashReceiptAmtLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 126.830000000000000000
          Width = 85.040000000000000000
          Height = 24.566929130000000000
          DataField = 'AMT_CASHRCP'
          DataSet = FastReportPayDataSet
          DataSetName = 'FastReportPayDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportPayDataSet."AMT_CASHRCP"]')
          VAlign = vaCenter
        end
        object PayCardAmtLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 211.760339999999900000
          Width = 93.040000000000000000
          Height = 24.566929130000000000
          DataField = 'AMT_CARD'
          DataSet = FastReportPayDataSet
          DataSetName = 'FastReportPayDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportPayDataSet."AMT_CARD"]')
          VAlign = vaCenter
        end
        object PayCreditAmtLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 304.800339999999500000
          Width = 85.039370080000000000
          Height = 24.566929130000000000
          DataField = 'AMT_TRUST'
          DataSet = FastReportPayDataSet
          DataSetName = 'FastReportPayDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportPayDataSet."AMT_TRUST"]')
          VAlign = vaCenter
        end
        object PayGiftCardAmtLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 389.840339999999500000
          Width = 85.039370080000000000
          Height = 24.566929130000000000
          DataField = 'AMT_GIFT'
          DataSet = FastReportPayDataSet
          DataSetName = 'FastReportPayDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportPayDataSet."AMT_GIFT"]')
          VAlign = vaCenter
        end
        object PayOKCashbagAmtLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 474.880340000000000000
          Width = 77.039370080000000000
          Height = 24.566929130000000000
          DataField = 'AMT_BANK'
          DataSet = FastReportPayDataSet
          DataSetName = 'FastReportPayDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportPayDataSet."AMT_BANK"]')
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 551.850340000000000000
          Width = 81.040000000000010000
          Height = 24.566929130000000000
          DataField = 'AMT_POINT'
          DataSet = FastReportPayDataSet
          DataSetName = 'FastReportPayDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportPayDataSet."AMT_POINT"]')
          VAlign = vaCenter
        end
        object PayCheckAmtLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 633.070866141732400000
          Width = 85.039370080000000000
          Height = 24.566929130000000000
          DataField = 'AMT_STAMP'
          DataSet = FastReportPayDataSet
          DataSetName = 'FastReportPayDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportPayDataSet."AMT_STAMP"]')
          VAlign = vaCenter
        end
      end
      object PosData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #46027#50880#52404
        Font.Style = []
        Height = 24.566929130000000000
        ParentFont = False
        Top = 464.882190000000000000
        Width = 718.101251175000100000
        DataSet = FastReportPosDataSet
        DataSetName = 'FastReportPosDataSet'
        RowCount = 0
        object PosLabel: TfrxMemoView
          AllowVectorExport = True
          Width = 37.795300000000000000
          Height = 24.566929130000000000
          DataField = 'NO_POS'
          DataSet = FastReportPosDataSet
          DataSetName = 'FastReportPosDataSet'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportPosDataSet."NO_POS"]')
          VAlign = vaCenter
        end
        object PosCashierLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Width = 56.692950000000000000
          Height = 24.566929130000000000
          DataField = 'NM_SAWON'
          DataSet = FastReportPosDataSet
          DataSetName = 'FastReportPosDataSet'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportPosDataSet."NM_SAWON"]')
          VAlign = vaCenter
        end
        object PosReserveAmtLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 94.488250000000000000
          Width = 75.590551180000000000
          Height = 24.566929130000000000
          DataField = 'AMT_READY'
          DataSet = FastReportPosDataSet
          DataSetName = 'FastReportPosDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportPosDataSet."AMT_READY"]')
          VAlign = vaCenter
        end
        object PosDepositAmtLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 170.078850000000000000
          Width = 83.149606300000000000
          Height = 24.566929130000000000
          DataField = 'AMT_MID'
          DataSet = FastReportPosDataSet
          DataSetName = 'FastReportPosDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportPosDataSet."AMT_MID"]')
          VAlign = vaCenter
        end
        object PosCashAmtLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 253.228510000000000000
          Width = 83.149606300000000000
          Height = 24.566929130000000000
          DataField = 'AMT_CASH'
          DataSet = FastReportPosDataSet
          DataSetName = 'FastReportPosDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportPosDataSet."AMT_CASH"]')
          VAlign = vaCenter
        end
        object PosOverShortAmtLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 336.378170000000000000
          Width = 56.692913390000000000
          Height = 24.566929130000000000
          DataField = 'AMT_LACK'
          DataSet = FastReportPosDataSet
          DataSetName = 'FastReportPosDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportPosDataSet."AMT_LACK"]')
          VAlign = vaCenter
        end
        object PosSaleAmtLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 393.071120000000000000
          Width = 83.149606300000000000
          Height = 24.566929130000000000
          DataField = 'AMT_SALE'
          DataSet = FastReportPosDataSet
          DataSetName = 'FastReportPosDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportPosDataSet."AMT_SALE"]')
          VAlign = vaCenter
        end
        object PosReturnQtyLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 476.220780000000000000
          Width = 37.795300000000000000
          Height = 24.566929130000000000
          DataField = 'QTY_RETURN'
          DataSet = FastReportPosDataSet
          DataSetName = 'FastReportPosDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportPosDataSet."QTY_RETURN"]')
          VAlign = vaCenter
        end
        object PosReturnAmtLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 514.016080000000000000
          Width = 83.149606300000000000
          Height = 24.566929130000000000
          DataField = 'AMT_RETURN'
          DataSet = FastReportPosDataSet
          DataSetName = 'FastReportPosDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportPosDataSet."AMT_RETURN"]')
          VAlign = vaCenter
        end
        object PosVoidQtyLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 597.165740000000000000
          Width = 37.795300000000000000
          Height = 24.566929130000000000
          DataField = 'CNT_VOID'
          DataSet = FastReportPosDataSet
          DataSetName = 'FastReportPosDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportPosDataSet."CNT_VOID"]')
          VAlign = vaCenter
        end
        object PosVoidAmtLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 634.961040000000000000
          Width = 83.149606300000000000
          Height = 24.566929130000000000
          DataField = 'AMT_VOID'
          DataSet = FastReportPosDataSet
          DataSetName = 'FastReportPosDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportPosDataSet."AMT_VOID"]')
          VAlign = vaCenter
        end
      end
      object DCData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #46027#50880#52404
        Font.Style = []
        Height = 24.566929130000000000
        ParentFont = False
        Top = 721.890230000000000000
        Width = 718.101251175000100000
        Columns = 3
        ColumnWidth = 238.110236220472000000
        ColumnGap = 1.889763779527560000
        DataSet = FastReportDCDataSet
        DataSetName = 'FastReportDCDataSet'
        RowCount = 0
        object DCTypeLabel: TfrxMemoView
          AllowVectorExport = True
          Width = 113.385826770000000000
          Height = 24.566929130000000000
          DataField = 'GUBUN'
          DataSet = FastReportDCDataSet
          DataSetName = 'FastReportDCDataSet'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDCDataSet."GUBUN"]')
          VAlign = vaCenter
        end
        object DCQtyLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385826770000000000
          Width = 41.574803150000000000
          Height = 24.566929130000000000
          DataField = 'QTY_DC'
          DataSet = FastReportDCDataSet
          DataSetName = 'FastReportDCDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDCDataSet."QTY_DC"]')
          VAlign = vaCenter
        end
        object DCAmtLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 154.976500000000000000
          Width = 83.149606300000000000
          Height = 24.566929130000000000
          DataField = 'AMT_DC'
          DataSet = FastReportDCDataSet
          DataSetName = 'FastReportDCDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDCDataSet."AMT_DC"]')
          VAlign = vaCenter
        end
      end
      object WorkData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #46027#50880#52404
        Font.Style = []
        Height = 24.566929130000000000
        ParentFont = False
        Top = 978.898270000000000000
        Width = 718.101251175000100000
        DataSet = FastReportWorkDataSet
        DataSetName = 'FastReportWorkDataSet'
        RowCount = 0
        object SawonCodeLabel: TfrxMemoView
          AllowVectorExport = True
          Width = 97.669450000000000000
          Height = 24.566929130000000000
          DataField = 'CD_SAWON'
          DataSet = FastReportWorkDataSet
          DataSetName = 'FastReportWorkDataSet'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportWorkDataSet."CD_SAWON"]')
          VAlign = vaCenter
        end
        object SawonNameLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 97.669450000000000000
          Width = 176.692950000000000000
          Height = 24.566929130000000000
          DataField = 'NM_SAWON'
          DataSet = FastReportWorkDataSet
          DataSetName = 'FastReportWorkDataSet'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[FastReportWorkDataSet."NM_SAWON"]')
          VAlign = vaCenter
        end
        object CompanySaleAmtLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 274.362400000000000000
          Width = 167.149606300000000000
          Height = 24.566929130000000000
          DataField = 'SETTLE_IN'
          DataSet = FastReportWorkDataSet
          DataSetName = 'FastReportWorkDataSet'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportWorkDataSet."SETTLE_IN"]')
          VAlign = vaCenter
        end
        object CompanyCashReceiptAmtLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 442.000000000000000000
          Width = 167.150000000000000000
          Height = 24.566929130000000000
          DataField = 'SETTLE_OUT'
          DataSet = FastReportWorkDataSet
          DataSetName = 'FastReportWorkDataSet'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportWorkDataSet."SETTLE_OUT"]')
          VAlign = vaCenter
        end
        object CompanyFeeAmtLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 608.960000000000000000
          Width = 111.150000000000000000
          Height = 24.566929130000000000
          DataField = 'WORK_TIME'
          DataSet = FastReportWorkDataSet
          DataSetName = 'FastReportWorkDataSet'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportWorkDataSet."WORK_TIME"]')
          VAlign = vaCenter
        end
      end
      object SaleHeader: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.362229130000000000
        Top = 128.504020000000000000
        Width = 718.101251175000100000
        object SaleTypeCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Top = 31.574830000000000000
          Width = 37.795300000000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #44396#48516)
          ParentFont = False
          VAlign = vaCenter
        end
        object SaleAmtCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 215.795300000000000000
          Top = 31.574829999999990000
          Width = 99.149606300000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #47588#52636#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object SaleNetAmtCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 410.000000000000000000
          Top = 31.574829999999990000
          Width = 78.000000000000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #47732#49464#47588#52636)
          ParentFont = False
          VAlign = vaCenter
        end
        object SaleNotAmtCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 314.944960000000000000
          Top = 31.574829999999990000
          Width = 95.149606300000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #44284#49464#47588#52636)
          ParentFont = False
          VAlign = vaCenter
        end
        object SaleVatAmtCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 137.440944880000000000
          Top = 31.574830000000000000
          Width = 78.614173230000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #54624#51064#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object SaleCustomerQtyCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 488.314960630000000000
          Top = 31.574830000000000000
          Width = 48.000000000000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #44061#49688)
          ParentFont = False
          VAlign = vaCenter
        end
        object SaleCustomerAmtCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 535.937007870000000000
          Top = 31.574830000000000000
          Width = 57.448818900000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #44061#45800#44032)
          ParentFont = False
          VAlign = vaCenter
        end
        object SaleProfitAmtCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 593.385826770000000000
          Top = 31.574830000000000000
          Width = 79.370076300000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #51060#51061#50696#49345)
          ParentFont = False
          VAlign = vaCenter
        end
        object SaleProfitRateCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 672.755905510000000000
          Top = 31.574830000000000000
          Width = 45.354330710000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #51060#51061'%')
          ParentFont = False
          VAlign = vaCenter
        end
        object SaleTitleLabel: TfrxMemoView
          AllowVectorExport = True
          Top = 5.338590000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '1. '#47588#52636' '#45236#50669)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 38.000000000000000000
          Top = 31.570000000000000000
          Width = 99.149606300000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #52509#47588#52636#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object DCHeader: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.362229130000000000
        Top = 642.520100000000000000
        Width = 718.101251175000100000
        object DCType1CaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Top = 31.574830000000000000
          Width = 113.385826770000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #44396#48516)
          ParentFont = False
          VAlign = vaCenter
        end
        object DCTitleLabel: TfrxMemoView
          AllowVectorExport = True
          Top = 5.338590000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '5. '#54624#51064' '#45236#50669)
          ParentFont = False
        end
        object DCQty1CaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385826770000000000
          Top = 31.574830000000000000
          Width = 41.574803150000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #44148#49688)
          ParentFont = False
          VAlign = vaCenter
        end
        object DCAmt1CaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 154.976500000000000000
          Top = 31.574830000000000000
          Width = 83.149606300000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #54624#51064#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object DCType2CaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 239.889920000000000000
          Top = 31.574830000000000000
          Width = 113.385826770000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #44396#48516)
          ParentFont = False
          VAlign = vaCenter
        end
        object DCQty2CaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 353.275746770000000000
          Top = 31.574830000000000000
          Width = 41.574803150000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #44148#49688)
          ParentFont = False
          VAlign = vaCenter
        end
        object DCAmt2CaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 394.866420000000000000
          Top = 31.574830000000000000
          Width = 83.149606300000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #54624#51064#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object DCType3CaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 480.000310000000000000
          Top = 31.574830000000000000
          Width = 113.385826770000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #44396#48516)
          ParentFont = False
          VAlign = vaCenter
        end
        object DCQty3CaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 593.386136770000000000
          Top = 31.574830000000000000
          Width = 41.574803150000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #44148#49688)
          ParentFont = False
          VAlign = vaCenter
        end
        object DCAmt3CaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 634.976810000000000000
          Top = 31.574830000000000000
          Width = 83.149606300000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #54624#51064#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PayHeader: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.362229130000000000
        Top = 257.008040000000000000
        Width = 718.101251175000100000
        object PayTitleLabel: TfrxMemoView
          AllowVectorExport = True
          Top = 5.338590000000000000
          Width = 147.401670000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '2. '#54252#49828#54032#47588' '#45236#50669)
          ParentFont = False
        end
        object PayTypeCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Top = 31.574830000000000000
          Width = 37.795300000000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #44396#48516)
          ParentFont = False
          VAlign = vaCenter
        end
        object PayCashAmtCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795275590000000000
          Top = 31.574830000000000000
          Width = 89.039370080000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #54788#44552)
          ParentFont = False
          VAlign = vaCenter
        end
        object PayCashReceiptAmtCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 126.834645670000000000
          Top = 31.574830000000000000
          Width = 85.039370080000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #54788#44552#50689#49688#51613)
          ParentFont = False
          VAlign = vaCenter
        end
        object PayCheckAmtCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 633.181375750000000000
          Top = 31.574830000000020000
          Width = 85.039370080000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #49828#53596#54532)
          ParentFont = False
          VAlign = vaCenter
        end
        object PayCardAmtCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 211.984195829999800000
          Top = 31.574830000000020000
          Width = 93.039370080000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #49888#50857#52852#46300)
          ParentFont = False
          VAlign = vaCenter
        end
        object PayCreditAmtCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 305.023565909999500000
          Top = 31.574830000000020000
          Width = 85.039370080000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #50808#49345)
          ParentFont = False
          VAlign = vaCenter
        end
        object PayGiftCardAmtCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 390.062935979999500000
          Top = 31.574830000000020000
          Width = 85.039370080000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #49345#54408#44428)
          ParentFont = False
          VAlign = vaCenter
        end
        object PayOKCashbagAmtCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 475.102306060000000000
          Top = 31.574830000000020000
          Width = 77.039370080000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #44228#51340#51077#44552)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 552.070810000000100000
          Top = 31.748031500000020000
          Width = 81.039370080000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #54252#51064#53944)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object POSHeader: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.362229130000000000
        Top = 385.512060000000000000
        Width = 718.101251175000100000
        object PosTitleLabel: TfrxMemoView
          AllowVectorExport = True
          Top = 4.338590000000000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '3. '#44228#49328#50896' '#47560#44048' '#45236#50669)
          ParentFont = False
        end
        object PosCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Top = 31.574830000000000000
          Width = 37.795300000000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            'POS')
          ParentFont = False
          VAlign = vaCenter
        end
        object PosCashierCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 31.574830000000000000
          Width = 56.692950000000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #44228#49328#50896)
          ParentFont = False
          VAlign = vaCenter
        end
        object PosReserveAmtCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 94.488250000000000000
          Top = 31.574830000000000000
          Width = 75.590551180000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #51456#48708#44552)
          ParentFont = False
          VAlign = vaCenter
        end
        object PosDepositAmtCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 170.078850000000000000
          Top = 31.574830000000000000
          Width = 83.149606300000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #51473#44036#52636#44552)
          ParentFont = False
          VAlign = vaCenter
        end
        object PosCashAmtCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 253.228510000000000000
          Top = 31.574830000000000000
          Width = 83.149606300000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #54788#44552#49457' '#54032#47588)
          ParentFont = False
          VAlign = vaCenter
        end
        object PosOverShortAmtCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 336.378170000000000000
          Top = 31.574830000000000000
          Width = 56.692913390000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #44284#48512#51313)
          ParentFont = False
          VAlign = vaCenter
        end
        object PosSaleAmtCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 393.071120000000000000
          Top = 31.574830000000000000
          Width = 83.149606300000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #54032#47588#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object PosReturnQtyCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 476.220780000000000000
          Top = 31.574830000000000000
          Width = 37.795300000000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #48152#54408)
          ParentFont = False
          VAlign = vaCenter
        end
        object PosReturnAmtCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 514.016080000000000000
          Top = 31.574830000000000000
          Width = 83.149606300000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #48152#54408#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object PosVoidQtyCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 597.165740000000000000
          Top = 31.574830000000000000
          Width = 37.795300000000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #52712#49548)
          ParentFont = False
          VAlign = vaCenter
        end
        object PosVoidAmtCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 634.961040000000000000
          Top = 31.574830000000000000
          Width = 83.149606300000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #52712#49548#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object CompanyHeader: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.362229130000000000
        Top = 899.528140000000000000
        Width = 718.101251175000100000
        object CompanyTitleLabel: TfrxMemoView
          AllowVectorExport = True
          Top = 5.338590000000000000
          Width = 188.976500000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '7. '#44540#53468' '#45236#50669)
          ParentFont = False
        end
        object CompanyNameCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Top = 31.574830000000000000
          Width = 97.669450000000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #49324#50896#53076#46300)
          ParentFont = False
          VAlign = vaCenter
        end
        object CompanyTypeCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 97.669450000000000000
          Top = 31.574830000000000000
          Width = 176.692950000000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #49324#50896#47749)
          ParentFont = False
          VAlign = vaCenter
        end
        object CompanySaleAmtCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 274.362400000000000000
          Top = 31.574830000000000000
          Width = 167.149606300000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #52636#44540#49884#44036)
          ParentFont = False
          VAlign = vaCenter
        end
        object CompanyFeeAmtCaptionLabel: TfrxMemoView
          AllowVectorExport = True
          Left = 608.961040000000000000
          Top = 31.570000000000000000
          Width = 111.149606300000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #44540#47924#49884#44036)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 442.000000000000000000
          Top = 31.570000000000000000
          Width = 167.150000000000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #53748#44540#49884#44036)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ClassData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #46027#50880#52404
        Font.Style = []
        Height = 24.566929130000000000
        ParentFont = False
        Top = 850.394250000000000000
        Width = 718.101251175000100000
        Columns = 2
        ColumnWidth = 359.055118110236000000
        DataSet = FastReportClassDataSet
        DataSetName = 'FastReportClassDataSet'
        RowCount = 0
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Width = 200.315016770000000000
          Height = 24.566929130000000000
          DataField = 'NM_CLASS'
          DataSet = FastReportClassDataSet
          DataSetName = 'FastReportClassDataSet'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[FastReportClassDataSet."NM_CLASS"]')
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 200.094546770000000000
          Width = 102.047283150000000000
          Height = 24.566929130000000000
          DataField = 'AMT_SALE'
          DataSet = FastReportClassDataSet
          DataSetName = 'FastReportClassDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportClassDataSet."AMT_SALE"]')
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 302.378170000000000000
          Width = 56.692913385826800000
          Height = 24.566929130000000000
          DataField = 'RATE'
          DataSet = FastReportClassDataSet
          DataSetName = 'FastReportClassDataSet'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportClassDataSet."RATE"]')
          VAlign = vaCenter
        end
      end
      object ClassHeader: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.362229130000000000
        Top = 771.024120000000000000
        Width = 718.101251175000100000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Top = 31.574830000000000000
          Width = 200.314960630000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #48516#47448#47749)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 5.338590000000000000
          Width = 173.858380000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '6. '#48516#47448#48324' '#54032#47588' '#45236#50669)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 199.937007870000000000
          Top = 31.574830000000000000
          Width = 102.047256300000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #54032#47588#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 358.834880000000000000
          Top = 31.574830000000000000
          Width = 200.314960630000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #48516#47448#47749)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 558.858690000000000000
          Top = 31.574830000000000000
          Width = 102.047256300000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #54032#47588#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 302.362204720000000000
          Top = 31.574830000000000000
          Width = 56.692913390000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #51216#50976#50984)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 660.976810000000000000
          Top = 31.574830000000000000
          Width = 56.692913390000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #51216#50976#50984)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.362229130000000000
        Top = 514.016080000000000000
        Width = 718.101251175000100000
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Top = 31.574830000000000000
          Width = 242.488196300000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #52636#45225#47749)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 241.826840000000000000
          Top = 31.574830000000000000
          Width = 114.488196300000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #49688#51077#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Top = 5.338590000000000000
          Width = 219.212740000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '4. '#52636#45225' '#45236#50669)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 355.826840000000000000
          Top = 31.570000000000000000
          Width = 114.490000000000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #51648#52636#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 470.000000000000000000
          Top = 31.570000000000000000
          Width = 248.000000000000000000
          Height = 24.566929130000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clSilver
          HAlign = haCenter
          Memo.UTF8W = (
            #48708'   '#44256)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object AcctData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #46027#50880#52404
        Font.Style = []
        Height = 24.566929130000000000
        ParentFont = False
        Top = 593.386210000000000000
        Width = 718.101251175000100000
        Columns = 1
        ColumnWidth = 358.000000000000000000
        ColumnGap = 1.889763779527560000
        DataSet = FastReportAcctDataSet
        DataSetName = 'FastReportAcctDataSet'
        RowCount = 0
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Width = 242.490000000000000000
          Height = 24.566929130000000000
          DataField = 'NM_ACCT'
          DataSet = FastReportAcctDataSet
          DataSetName = 'FastReportAcctDataSet'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[FastReportAcctDataSet."NM_ACCT"]')
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 355.830000000000000000
          Width = 114.490000000000000000
          Height = 24.566929130000000000
          DataField = 'AMT_OUT'
          DataSet = FastReportAcctDataSet
          DataSetName = 'FastReportAcctDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportAcctDataSet."AMT_OUT"]')
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 470.000000000000000000
          Width = 248.000000000000000000
          Height = 24.566929130000000000
          DataField = 'REMARK'
          DataSet = FastReportAcctDataSet
          DataSetName = 'FastReportAcctDataSet'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[FastReportAcctDataSet."REMARK"]')
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 241.830000000000000000
          Width = 114.490000000000000000
          Height = 24.566929130000000000
          DataField = 'AMT_PAYIN'
          DataSet = FastReportAcctDataSet
          DataSetName = 'FastReportAcctDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportAcctDataSet."AMT_PAYIN"]')
          VAlign = vaCenter
        end
      end
    end
  end
  object FastReportClassDataSet: TfrxUserDataSet
    UserName = 'FastReportClassDataSet'
    OnCheckEOF = FastReportClassDataSetCheckEOF
    Fields.Strings = (
      'NM_CLASS'
      'AMT_SALE'
      'RATE')
    OnNewGetValue = FastReportClassDataSetNewGetValue
    Left = 225
    Top = 95
  end
  object FastReportWorkDataSet: TfrxUserDataSet
    UserName = 'FastReportWorkDataSet'
    OnCheckEOF = FastReportWorkDataSetCheckEOF
    Fields.Strings = (
      'CD_SAWON'
      'NM_SAWON'
      'SETTLE_IN'
      'SETTLE_OUT'
      'WORK_TIME')
    OnNewGetValue = FastReportWorkDataSetNewGetValue
    Left = 265
    Top = 95
  end
  object FastReportAcctDataSet: TfrxUserDataSet
    UserName = 'FastReportAcctDataSet'
    OnCheckEOF = FastReportAcctDataSetCheckEOF
    Fields.Strings = (
      'NM_ACCT'
      'AMT_PAYIN'
      'AMT_OUT'
      'REMARK')
    OnNewGetValue = FastReportAcctDataSetNewGetValue
    Left = 305
    Top = 95
  end
end
