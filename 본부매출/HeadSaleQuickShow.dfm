inherited HeadSaleQuickShowForm: THeadSaleQuickShowForm
  Left = 300
  Top = 120
  Caption = #47588#52636' '#49549#48372'('#48376#48512')'
  ClientHeight = 822
  ClientWidth = 1197
  PopupMenu = BackGroundPopupMenu
  OnDestroy = FormDestroy
  ExplicitWidth = 1213
  ExplicitHeight = 861
  PixelsPerInch = 96
  TextHeight = 17
  object PricePanel: TAdvPanel [0]
    Left = 528
    Top = 404
    Width = 301
    Height = 299
    Color = clWhite
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    UseDockManager = True
    OnClick = SummeryPanelClick
    Version = '2.5.11.0'
    BorderColor = clBlack
    BorderWidth = 1
    CanMove = True
    CanSize = True
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.CloseButton = True
    Caption.Font.Charset = HANGEUL_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -15
    Caption.Font.Name = #47569#51008' '#44256#46357
    Caption.Font.Style = [fsBold]
    Caption.Height = 25
    Caption.Indent = 0
    Caption.MinMaxButton = True
    Caption.Text = '<P align="center">'#44552#50529#45824#48324' '#47588#52636'</P>'
    Caption.Visible = True
    ColorTo = clWhite
    DoubleBuffered = True
    Position.Save = True
    Position.Key = 'PricePanel'
    Position.Section = 'HeadSaleQuickShowForm'
    ShadowOffset = 5
    ShowMoveCursor = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    DesignSize = (
      301
      299)
    FullHeight = 180
    object MoneyGrid: TcxGrid
      Left = 4
      Top = 28
      Width = 292
      Height = 267
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object MoneyGridBandedTableView: TcxGridBandedTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
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
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.GroupByBox = False
        OptionsView.BandHeaders = False
        Bands = <
          item
            Caption = #44552#50529#45824#48324' '#47588#52636
          end>
        object MoneyGridBandedTableViewMoenyZone: TcxGridBandedColumn
          Tag = 98
          Caption = #44552#50529#45824
          DataBinding.FieldName = 'MONEY_ZONE'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 100
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object MoneyGridBandedTableViewCustomerCnt: TcxGridBandedColumn
          Tag = 98
          Caption = #44061#49688
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'CNT_CUST'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Width = 60
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
      end
      object MoneyGridLevel: TcxGridLevel
        GridView = MoneyGridBandedTableView
      end
    end
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1197
    ExplicitWidth = 1197
    inherited ButtonToolBar: TAdvToolBar
      Left = 614
      Width = 347
      ExplicitLeft = 614
      ExplicitWidth = 347
      inherited ButtonToolBarSeparator: TAdvToolBarSeparator
        Left = 260
        Height = 27
        ExplicitLeft = 260
        ExplicitHeight = 27
      end
      inherited ButtonToolBarSeparator1: TAdvToolBarSeparator
        Width = 0
        ExplicitWidth = 0
      end
      inherited ButtonToolBarCloseButton: TAdvGlowButton
        Left = 270
        ExplicitLeft = 270
      end
      inherited ButtonToolBarSaveButton: TAdvGlowButton
        Left = 174
        Visible = False
        ExplicitLeft = 174
      end
      inherited ButtonToolBarDeleteButton: TAdvGlowButton
        Left = 88
        Visible = False
        ExplicitLeft = 88
      end
    end
    inherited ConditionToolBar: TAdvToolBar
      Width = 707
      ExplicitWidth = 707
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        Left = 222
        Visible = True
        OnKeyDown = ConditionToolBarFromDateEditKeyDown
        ExplicitLeft = 222
      end
      inherited ConditionToolBarDateLabel: TcxLabel
        Caption = #51312#54924#51068#51088
        Visible = True
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarToDateEdit: TcxDateEdit
        Left = 67
        Visible = True
        ExplicitLeft = 67
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        Left = 312
        ExplicitLeft = 312
        AnchorX = 321
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        Left = 157
        Caption = #48708#44368#51068#51088
        Visible = True
        ExplicitLeft = 157
        AnchorX = 190
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        ExplicitWidth = 110
        Width = 110
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 440
        ExplicitLeft = 440
      end
      object cxLabel2: TcxLabel
        Left = 560
        Top = 2
        AutoSize = False
        Caption = #51088#46041#44081#49888
        ParentShowHint = False
        ShowHint = True
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 24
        Width = 63
        AnchorX = 592
        AnchorY = 14
      end
      object RefreshToolBarComboBox: TcxComboBox
        Left = 623
        Top = 2
        AutoSize = False
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.OnChange = RefreshToolBarComboBoxPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 8
        Height = 25
        Width = 80
      end
    end
  end
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 25
  end
  object PayChartPanel: TAdvPanel [3]
    Left = 488
    Top = 519
    Width = 285
    Height = 249
    Color = clWhite
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    UseDockManager = True
    OnClick = SummeryPanelClick
    OnResize = PayChartPanelResize
    Version = '2.5.11.0'
    BorderColor = clBlack
    BorderWidth = 1
    CanMove = True
    CanSize = True
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.CloseButton = True
    Caption.Font.Charset = HANGEUL_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -15
    Caption.Font.Name = #47569#51008' '#44256#46357
    Caption.Font.Style = [fsBold]
    Caption.Height = 25
    Caption.Indent = 0
    Caption.MinMaxButton = True
    Caption.Text = '<P align="center">'#44208#51228#49688#45800#48324' '#47588#52636'</P>'
    Caption.Visible = True
    ColorTo = clWhite
    DoubleBuffered = True
    Padding.Left = 2
    Padding.Top = 2
    Padding.Right = 2
    Padding.Bottom = 2
    Position.Save = True
    Position.Key = 'PayGraphPanel'
    Position.Section = 'HeadSaleQuickShowForm'
    ShadowOffset = 5
    ShowMoveCursor = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    FullHeight = 220
  end
  object ClassPanel: TAdvPanel [4]
    Left = 0
    Top = 491
    Width = 512
    Height = 155
    Color = clWhite
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    UseDockManager = True
    OnClick = SummeryPanelClick
    Version = '2.5.11.0'
    BorderColor = clBlack
    BorderWidth = 1
    CanMove = True
    CanSize = True
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.CloseButton = True
    Caption.Font.Charset = HANGEUL_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -15
    Caption.Font.Name = #47569#51008' '#44256#46357
    Caption.Font.Style = [fsBold]
    Caption.Height = 25
    Caption.Indent = 0
    Caption.MinMaxButton = True
    Caption.Text = '<P align="center">'#48516#47448#48324' '#47588#52636'</P>'
    Caption.Visible = True
    ColorTo = clWhite
    DoubleBuffered = True
    Position.Save = True
    Position.Key = 'ClassPanel'
    Position.Section = 'HeadSaleQuickShowForm'
    ShadowOffset = 5
    ShowMoveCursor = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    DesignSize = (
      512
      155)
    FullHeight = 180
    object ClassGrid: TcxGrid
      Left = 4
      Top = 28
      Width = 503
      Height = 123
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object ClassGridBandedTableView: TcxGridBandedTableView
        Tag = 99
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        OnCellDblClick = ClassGridBandedTableViewCellDblClick
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
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.GroupByBox = False
        OptionsView.BandHeaders = False
        Bands = <
          item
            Caption = #49345#54408' '#48516#47448#48324' '#47588#52636
          end>
        object ClassGridBandedTableViewClass: TcxGridBandedColumn
          Tag = 99
          Caption = #48516#47448#53076#46300
          DataBinding.FieldName = 'CD_CLASS'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object ClassGridBandedTableViewClassName: TcxGridBandedColumn
          Tag = 98
          Caption = #47700#45684#48516#47448
          DataBinding.FieldName = 'NM_CLASS'
          HeaderAlignmentHorz = taCenter
          Width = 118
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object ClassGridBandedTableViewSaleAmt: TcxGridBandedColumn
          Tag = 98
          Caption = #47588#52636#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_SALE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 95
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object ClassGridBandedTableViewRate: TcxGridBandedColumn
          Caption = #44396#49457#48708
          DataBinding.ValueType = 'Integer'
          DataBinding.FieldName = 'RATE'
          PropertiesClassName = 'TcxProgressBarProperties'
          Properties.BarStyle = cxbsGradient
          Properties.BeginColor = clSkyBlue
          Properties.EndColor = clBlue
          Properties.SolidTextColor = True
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 44
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
      end
      object ClassGridLevel: TcxGridLevel
        GridView = ClassGridBandedTableView
      end
    end
  end
  object SummeryPanel: TAdvPanel [5]
    Left = 36
    Top = 71
    Width = 1004
    Height = 146
    Color = clWhite
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    UseDockManager = True
    OnClick = SummeryPanelClick
    Version = '2.5.11.0'
    BorderColor = clBlack
    BorderWidth = 1
    CanMove = True
    CanSize = True
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.CloseButton = True
    Caption.Font.Charset = HANGEUL_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -15
    Caption.Font.Name = #47569#51008' '#44256#46357
    Caption.Font.Style = [fsBold]
    Caption.Height = 25
    Caption.Indent = 0
    Caption.MinMaxButton = True
    Caption.Text = '<P align="center">'#47588#52636' '#50836#50557'</P>'
    Caption.Visible = True
    ColorTo = clWhite
    DoubleBuffered = True
    Position.Save = True
    Position.Key = 'SummeryPanel'
    Position.Section = 'HeadSaleQuickShowForm'
    ShadowOffset = 5
    ShowMoveCursor = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    DesignSize = (
      1004
      146)
    FullHeight = 108
    object Grid: TcxGrid
      Left = 4
      Top = 30
      Width = 755
      Height = 111
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object GridTableView: TcxGridTableView
        Tag = 99
        Navigator.Buttons.CustomButtons = <>
        FilterBox.CustomizeDialog = False
        FilterBox.Visible = fvNever
        ScrollbarAnnotations.CustomAnnotations = <>
        OnCellDblClick = GridTableViewCellDblClick
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
        object GridTableViewType: TcxGridColumn
          Tag = 98
          Caption = #44396#48516
          DataBinding.FieldName = 'GUBUN'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 50
        end
        object GridTableViewYmdSale: TcxGridColumn
          Tag = 99
          Caption = #54032#47588#51068#51088
          DataBinding.FieldName = 'YMD_SALE'
          Visible = False
          Options.Filtering = False
        end
        object GridTableViewStoreCount: TcxGridColumn
          Caption = #47588#51109#49688
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'STORE_COUNT'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
        end
        object GridTableViewAvgAmt: TcxGridColumn
          Caption = #54217#44512#47588#52636
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_AVG'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Width = 89
        end
        object GridTableViewTotalAmt: TcxGridColumn
          Caption = #52509' '#47588#52636#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_TOT'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 96
        end
        object GridTableViewDCAmt: TcxGridColumn
          Caption = #54624#51064#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'DC_TOT'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 81
        end
        object GridTableViewColumn1: TcxGridColumn
          Caption = #49436#48708#49828#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_SERVICE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Width = 84
        end
        object GridTableViewVatAmt: TcxGridColumn
          Caption = #48512#44032#49464
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_TAX'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 80
        end
        object GridTableViewSaleAmt: TcxGridColumn
          Caption = #47588#52636#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_SALE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 95
        end
        object GridTableViewCustomerQty: TcxGridColumn
          Caption = #44061#49688
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'QTY_CUST'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 73
        end
        object GridTableViewCustomerAmt: TcxGridColumn
          Caption = #44061#45800#44032
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_CUST'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 77
        end
        object GridTableViewDutySaleAmt: TcxGridColumn
          Caption = #44284#49464#54032#47588
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_SALE_DUTY'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 95
        end
        object GridTableViewDutyFreeSaleAmt: TcxGridColumn
          Caption = #47732#49464#54032#47588
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_SALE_DUTYFREE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 95
        end
        object GridTableViewDeliveryCount: TcxGridColumn
          Caption = #48176#45804#44148#49688
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'CNT_DELIVERY'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 60
        end
        object GridTableViewDeliveryAmt: TcxGridColumn
          Caption = #48176#45804#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_DELIVERY'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 95
        end
        object GridTableViewProfitAmt: TcxGridColumn
          Caption = #51060#51061#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_PROFIT'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
        end
        object GridTableViewProfitRate: TcxGridColumn
          Caption = #51060#51061#47456
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'RATE_PROFIT'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DecimalPlaces = 2
          Properties.DisplayFormat = ',0.00%'
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
        end
      end
      object GridLevel: TcxGridLevel
        GridView = GridTableView
      end
    end
    object SummeryChartPanel: TPanel
      Left = 765
      Top = 29
      Width = 233
      Height = 111
      Anchors = [akTop, akRight, akBottom]
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Ctl3D = False
      DoubleBuffered = False
      ParentCtl3D = False
      ParentDoubleBuffered = False
      TabOrder = 1
      OnResize = SummeryChartPanelResize
    end
  end
  object TimeChartPanel: TAdvPanel [6]
    Left = 8
    Top = 348
    Width = 514
    Height = 137
    Color = clWhite
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    UseDockManager = True
    Visible = False
    OnClick = SummeryPanelClick
    OnResize = TimeChartPanelResize
    Version = '2.5.11.0'
    BorderColor = clBlack
    BorderWidth = 1
    CanMove = True
    CanSize = True
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.CloseButton = True
    Caption.Font.Charset = HANGEUL_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -15
    Caption.Font.Name = #47569#51008' '#44256#46357
    Caption.Font.Style = [fsBold]
    Caption.Height = 25
    Caption.Indent = 0
    Caption.MinMaxButton = True
    Caption.Text = '<P align="center">'#49884#44036#45824#48324' '#47588#52636'('#52264#53944')</P>'
    Caption.Visible = True
    ColorTo = clWhite
    DoubleBuffered = True
    Padding.Left = 2
    Padding.Top = 2
    Padding.Right = 2
    Padding.Bottom = 2
    Position.Save = True
    Position.Key = 'TimeGraphPanel'
    Position.Section = 'HeadSaleQuickShowForm'
    ShadowOffset = 5
    ShowMoveCursor = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    FullHeight = 220
  end
  object TimePanel: TAdvPanel [7]
    Left = 104
    Top = 639
    Width = 418
    Height = 407
    Color = clWhite
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    UseDockManager = True
    OnClick = SummeryPanelClick
    Version = '2.5.11.0'
    BorderColor = clBlack
    BorderWidth = 1
    CanMove = True
    CanSize = True
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.CloseButton = True
    Caption.Font.Charset = HANGEUL_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -15
    Caption.Font.Name = #47569#51008' '#44256#46357
    Caption.Font.Style = [fsBold]
    Caption.Height = 25
    Caption.Indent = 0
    Caption.MinMaxButton = True
    Caption.Text = '<P align="center">'#49884#44036#45824#48324' '#47588#52636'</P>'
    Caption.Visible = True
    ColorTo = clWhite
    DoubleBuffered = True
    Position.Save = True
    Position.Key = 'TimePanel'
    Position.Section = 'HeadSaleQuickShowForm'
    ShadowOffset = 5
    ShowMoveCursor = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    DesignSize = (
      418
      407)
    FullHeight = 220
    object TimeGrid: TcxGrid
      Left = 4
      Top = 28
      Width = 409
      Height = 374
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object TimeGridBandedTableView: TcxGridBandedTableView
        Tag = 99
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        OnCellDblClick = TimeGridBandedTableViewCellDblClick
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
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.GroupByBox = False
        Bands = <
          item
            Caption = #44396#48516
          end
          item
            Caption = #48708#44368' '#49884#44036#45824#48324' '#47588#52636
          end
          item
            Caption = #50724#45720' '#49884#44036#45824#48324' '#47588#52636
          end>
        object TimeGridBandedTableViewTimeZome: TcxGridBandedColumn
          Tag = 98
          Caption = #49884#44036#45824
          DataBinding.FieldName = 'TIME_ZONE'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 100
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object imeGridBandedTableViewYSaleAmt: TcxGridBandedColumn
          Tag = 98
          Caption = #47588#52636#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_SALE_Y'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 80
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object imeGridBandedTableViewYCustomerCnt: TcxGridBandedColumn
          Tag = 98
          Caption = #44061#49688
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'CNT_CUST_Y'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 50
          Position.BandIndex = 1
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object TimeGridBandedTableViewSaleAmt: TcxGridBandedColumn
          Tag = 98
          Caption = #47588#52636#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_SALE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 80
          Position.BandIndex = 2
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object TimeGridBandedTableViewCustomerCnt: TcxGridBandedColumn
          Tag = 98
          Caption = #44061#49688
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'CNT_CUST'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 50
          Position.BandIndex = 2
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object imeGridBandedTableViewCustomerAmt: TcxGridBandedColumn
          Tag = 98
          Caption = #44061#45800#44032
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_CUST'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 70
          Position.BandIndex = 2
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
      end
      object TimeGridLevel: TcxGridLevel
        GridView = TimeGridBandedTableView
      end
    end
  end
  object MenuPanel: TAdvPanel [8]
    Left = 859
    Top = 426
    Width = 486
    Height = 285
    Color = clWhite
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    UseDockManager = True
    OnClick = SummeryPanelClick
    Version = '2.5.11.0'
    BorderColor = clBlack
    BorderWidth = 1
    CanMove = True
    CanSize = True
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.CloseButton = True
    Caption.Font.Charset = HANGEUL_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -15
    Caption.Font.Name = #47569#51008' '#44256#46357
    Caption.Font.Style = [fsBold]
    Caption.Height = 25
    Caption.Indent = 0
    Caption.MinMaxButton = True
    Caption.Text = '<P align="center">'#47700#45684#48324' '#47588#52636'</P>'
    Caption.Visible = True
    ColorTo = clWhite
    DoubleBuffered = True
    Position.Save = True
    Position.Key = 'MenuPanel'
    Position.Section = 'HeadSaleQuickShowForm'
    ShadowOffset = 5
    ShowMoveCursor = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    DesignSize = (
      486
      285)
    FullHeight = 220
    object MenuGrid: TcxGrid
      Left = 4
      Top = 28
      Width = 477
      Height = 252
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object MenuGridTableView: TcxGridTableView
        Tag = 99
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0'
            Kind = skSum
            Column = cxGridColumn7
          end
          item
            Format = ',0'
            Kind = skSum
          end
          item
            Format = ',0 '#44148
            Kind = skCount
            Column = cxGridColumn5
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object cxGridColumn5: TcxGridColumn
          Caption = #47700#45684#47749
          DataBinding.FieldName = 'NM_MENU'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 186
        end
        object cxGridColumn6: TcxGridColumn
          Caption = #49688#47049
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'QTY_SALE'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Width = 78
        end
        object cxGridColumn7: TcxGridColumn
          Caption = #47588#52636#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_SALE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Width = 82
        end
      end
      object MenuGridLevel: TcxGridLevel
        GridView = MenuGridTableView
      end
    end
  end
  object StoreChartPanel: TAdvPanel [9]
    Left = 0
    Top = 217
    Width = 522
    Height = 137
    Color = clWhite
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    UseDockManager = True
    Visible = False
    OnClick = SummeryPanelClick
    OnResize = StoreChartPanelResize
    Version = '2.5.11.0'
    BorderColor = clBlack
    BorderWidth = 1
    CanMove = True
    CanSize = True
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.CloseButton = True
    Caption.Font.Charset = HANGEUL_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -15
    Caption.Font.Name = #47569#51008' '#44256#46357
    Caption.Font.Style = [fsBold]
    Caption.Height = 25
    Caption.Indent = 0
    Caption.MinMaxButton = True
    Caption.Text = '<P align="center">'#47588#51109#48324' '#47588#52636'('#52264#53944')</P>'
    Caption.Visible = True
    ColorTo = clWhite
    DoubleBuffered = True
    Padding.Left = 2
    Padding.Top = 2
    Padding.Right = 2
    Padding.Bottom = 2
    Position.Save = True
    Position.Key = 'StoreGraphPanel'
    Position.Section = 'HeadSaleQuickShowForm'
    ShadowOffset = 5
    ShowMoveCursor = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    FullHeight = 220
  end
  object LocalChartPanel: TAdvPanel [10]
    Left = 528
    Top = 217
    Width = 522
    Height = 137
    Color = clWhite
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    UseDockManager = True
    Visible = False
    OnClick = SummeryPanelClick
    OnResize = LocalChartPanelResize
    Version = '2.5.11.0'
    BorderColor = clBlack
    BorderWidth = 1
    CanMove = True
    CanSize = True
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.CloseButton = True
    Caption.Font.Charset = HANGEUL_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -15
    Caption.Font.Name = #47569#51008' '#44256#46357
    Caption.Font.Style = [fsBold]
    Caption.Height = 25
    Caption.Indent = 0
    Caption.MinMaxButton = True
    Caption.Text = '<P align="center">'#51648#50669#48324' '#47588#52636'('#52264#53944')</P>'
    Caption.Visible = True
    ColorTo = clWhite
    DoubleBuffered = True
    Padding.Left = 2
    Padding.Top = 2
    Padding.Right = 2
    Padding.Bottom = 2
    Position.Save = True
    Position.Key = 'LocalPanel'
    Position.Section = 'HeadSaleQuickShowForm'
    ShadowOffset = 3
    ShowMoveCursor = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    FullHeight = 220
  end
  object SaleZoneChartPanel: TAdvPanel [11]
    Left = 675
    Top = 536
    Width = 522
    Height = 137
    Color = clWhite
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    UseDockManager = True
    Visible = False
    OnClick = SummeryPanelClick
    OnResize = SaleZoneChartPanelResize
    Version = '2.5.11.0'
    BorderColor = clBlack
    BorderWidth = 1
    CanMove = True
    CanSize = True
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.CloseButton = True
    Caption.Font.Charset = HANGEUL_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -15
    Caption.Font.Name = #47569#51008' '#44256#46357
    Caption.Font.Style = [fsBold]
    Caption.Height = 25
    Caption.Indent = 0
    Caption.MinMaxButton = True
    Caption.Text = '<P align="center">'#49345#44428#48324' '#47588#52636'('#52264#53944')</P>'
    Caption.Visible = True
    ColorTo = clWhite
    DoubleBuffered = True
    Padding.Left = 2
    Padding.Top = 2
    Padding.Right = 2
    Padding.Bottom = 2
    Position.Save = True
    Position.Key = 'LocalPanel'
    Position.Section = 'HeadSaleQuickShowForm'
    ShadowOffset = 3
    ShowMoveCursor = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    FullHeight = 220
  end
  object StorePanel: TAdvPanel [12]
    Left = 518
    Top = 519
    Width = 378
    Height = 354
    Color = clWhite
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    UseDockManager = True
    OnClick = SummeryPanelClick
    Version = '2.5.11.0'
    BorderColor = clBlack
    BorderWidth = 1
    CanMove = True
    CanSize = True
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.CloseButton = True
    Caption.Font.Charset = HANGEUL_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -15
    Caption.Font.Name = #47569#51008' '#44256#46357
    Caption.Font.Style = [fsBold]
    Caption.Height = 25
    Caption.Indent = 0
    Caption.MinMaxButton = True
    Caption.Text = '<P align="center">'#47588#51109#48324' '#47588#52636'</P>'
    Caption.Visible = True
    ColorTo = clWhite
    DoubleBuffered = True
    Position.Save = True
    Position.Key = 'HeadSaleQuickShowForm'
    Position.Section = 'StorePanel'
    ShadowOffset = 5
    ShowMoveCursor = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    DesignSize = (
      378
      354)
    FullHeight = 220
    object StoreGrid: TcxGrid
      Left = 4
      Top = 28
      Width = 369
      Height = 321
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object StoreGridTableView: TcxGridTableView
        Tag = 99
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0'
            Kind = skSum
            Column = StoreGridTableSaleAmt
          end
          item
            Format = ',0'
            Kind = skSum
          end
          item
            Format = ',0 '#44148
            Kind = skCount
            Column = StoreGridTableStoreName
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object StoreGridTableStoreName: TcxGridColumn
          Caption = #47588#51109#47749
          DataBinding.FieldName = 'NM_STORE'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 186
        end
        object StoreGridTableSaleAmt: TcxGridColumn
          Caption = #47588#52636#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_SALE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Width = 82
        end
        object StoreGridTableRate: TcxGridColumn
          Caption = #54217#44512#48708
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'RATE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '#.00%'
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Width = 78
        end
        object StoreGridTableViewAvgAmt: TcxGridColumn
          Tag = 99
          Caption = #54217#44512#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_AVG'
          Visible = False
        end
      end
      object StoreGridLevel: TcxGridLevel
        GridView = StoreGridTableView
      end
    end
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  object BackGroundPopupMenu: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = BackGroundPopupMenuPopup
    Left = 848
    Top = 104
    object mnuVisibleSummery: TMenuItem
      Caption = #47588#52636' '#50836#50557
      Hint = 'SummeryPanel'
      OnClick = mnuVisibleSummeryClick
    end
    object mnuVisibleClass: TMenuItem
      Caption = #49345#54408#48516#47448#48324' '#47588#52636
      Hint = 'ClassPanel'
      OnClick = mnuVisibleSummeryClick
    end
    object mnuVisiblePrice: TMenuItem
      Caption = #44552#50529#45824#48324' '#47588#52636
      Hint = 'PricePanel'
      OnClick = mnuVisibleSummeryClick
    end
    object mnuVisibleTime: TMenuItem
      Caption = #49884#44036#45824#48324' '#47588#52636
      Hint = 'TimePanel'
      OnClick = mnuVisibleSummeryClick
    end
    object mnuVisibleStore: TMenuItem
      Caption = #47588#51109#48324' '#47588#52636
      Hint = 'StorePanel'
      OnClick = mnuVisibleSummeryClick
    end
    object mnuVisibleMenu: TMenuItem
      Caption = #47700#45684#48324' '#47588#52636
      Hint = 'MenuPanel'
      OnClick = mnuVisibleSummeryClick
    end
    object mnuVisibleStoreChart: TMenuItem
      Caption = #47588#51109#48324' '#47588#52636'('#52264#53944')'
      Hint = 'StoreChartPanel'
      OnClick = mnuVisibleSummeryClick
    end
    object mnuVisibleLocalChart: TMenuItem
      Caption = #51648#50669#48324' '#47588#52636'('#52264#53944')'
      Hint = 'LocalChartPanel'
      OnClick = mnuVisibleSummeryClick
    end
    object mnuVisibleSaleZoneChart: TMenuItem
      Caption = #49345#44428#48324' '#47588#52636'('#52264#53944')'
      Hint = 'SaleZoneChartPanel'
      OnClick = mnuVisibleSummeryClick
    end
    object mnuVisibleTimeChart: TMenuItem
      Caption = #49884#44036#45824#48324' '#47588#52636'('#52320#53944')'
      Hint = 'TimeChartPanel'
      OnClick = mnuVisibleSummeryClick
    end
    object mnuVisiblePayChart: TMenuItem
      Caption = #44208#51228#49688#45800#48324' '#47588#52636'('#52320#53944')'
      Hint = 'PayChartPanel'
      OnClick = mnuVisibleSummeryClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuAutoArrange: TMenuItem
      Caption = #44592#48376#54805#53468#47196' '#51221#47148'(&S)'
      OnClick = mnuAutoArrangeClick
    end
  end
  object RefreshTimer: TTimer
    Enabled = False
    OnTimer = RefreshTimerTimer
    Left = 832
    Top = 136
  end
end
