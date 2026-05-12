inherited SaleQuickShowForm: TSaleQuickShowForm
  Left = 300
  Top = 120
  ActiveControl = ConditionToolBarToDateEdit
  Caption = #47588#52636' '#49549#48372' '#51312#54924
  ClientHeight = 902
  ClientWidth = 1202
  PopupMenu = BackGroundPopupMenu
  OnDestroy = FormDestroy
  ExplicitWidth = 1218
  ExplicitHeight = 941
  PixelsPerInch = 96
  TextHeight = 17
  object PricePanel: TAdvPanel [0]
    Left = 624
    Top = 324
    Width = 301
    Height = 299
    Color = clWhite
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 8
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
    Position.Key = 'SaleQuickShowForm'
    Position.Section = 'OrangePricePanel'
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
    Width = 1202
    ExplicitWidth = 1202
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
        Visible = False
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
        Visible = False
        Height = 25
        Width = 80
      end
    end
  end
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 25
  end
  object TablePanel: TAdvPanel [3]
    Left = 8
    Top = 368
    Width = 299
    Height = 255
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
    Caption.Text = '<P align="center">'#53580#51060#48660#48324' '#47588#52636'</P>'
    Caption.Visible = True
    ColorTo = clWhite
    DoubleBuffered = True
    Position.Save = True
    Position.Key = 'SaleQuickShowForm'
    Position.Section = 'OrangeTablePanel'
    ShadowOffset = 5
    ShowMoveCursor = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    DesignSize = (
      299
      255)
    FullHeight = 220
    object TableGrid: TcxGrid
      Left = 4
      Top = 28
      Width = 290
      Height = 222
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object TableGridTableView: TcxGridTableView
        Tag = 99
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        OptionsView.GroupByBox = False
        object TableGridTableViewTableNo: TcxGridColumn
          Caption = #53580#51060#48660#48264#54840
          DataBinding.FieldName = 'NM_TABLE'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 91
        end
        object TableGridTableViewCycleCount: TcxGridColumn
          Caption = #54924#51204#49688
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'CNT_SALE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Width = 46
        end
        object TableGridTableViewSaleAmt: TcxGridColumn
          Caption = #47588#52636#44552#50529
          DataBinding.FieldName = 'AMT_SALE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Width = 76
        end
        object TableGridTableViewColumn1: TcxGridColumn
          Caption = #44396#49457#48708
          DataBinding.ValueType = 'Integer'
          DataBinding.FieldName = 'RATE'
          PropertiesClassName = 'TcxProgressBarProperties'
          Properties.BarStyle = cxbsGradient
          Properties.BeginColor = clSkyBlue
          Properties.EndColor = clBlue
          Properties.SolidTextColor = True
          HeaderAlignmentHorz = taCenter
          Width = 56
        end
      end
      object TableGridLevel: TcxGridLevel
        GridView = TableGridTableView
      end
    end
  end
  object PayGraphPanel: TAdvPanel [4]
    Left = 313
    Top = 208
    Width = 285
    Height = 213
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
    Caption.Text = '<P align="center">'#44208#51228#49688#45800#48324' '#47588#52636'</P>'
    Caption.Visible = True
    ColorTo = clWhite
    DoubleBuffered = True
    Position.Save = True
    Position.Key = 'SaleQuickShowForm'
    Position.Section = 'OrangePayGraphPanel'
    ShadowOffset = 5
    ShowMoveCursor = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    DesignSize = (
      285
      213)
    FullHeight = 220
    object PayChartPanel: TPanel
      Left = 5
      Top = 28
      Width = 275
      Height = 179
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Ctl3D = False
      DoubleBuffered = False
      ParentCtl3D = False
      ParentDoubleBuffered = False
      TabOrder = 0
      OnResize = PayChartPanelResize
    end
  end
  object PosPanel: TAdvPanel [5]
    Left = 8
    Top = 213
    Width = 297
    Height = 149
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
    Caption.Text = '<P align="center">POS'#48324' '#47588#52636'</P>'
    Caption.Visible = True
    ColorTo = clWhite
    DoubleBuffered = True
    Position.Save = True
    Position.Key = 'SaleQuickShowForm'
    Position.Section = 'OrangePosPanel'
    ShadowOffset = 5
    ShowMoveCursor = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    DesignSize = (
      297
      149)
    FullHeight = 180
    object PosGrid: TcxGrid
      Left = 4
      Top = 28
      Width = 290
      Height = 116
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object PosGridBandedTableView: TcxGridBandedTableView
        Tag = 99
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        OnCellDblClick = PosGridBandedTableViewCellDblClick
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
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
            Column = PosGridBandedTableViewSaleAmt
          end
          item
          end
          item
            Format = ',0'
            Kind = skSum
            Column = PosGridBandedTableViewCustomerCnt
          end
          item
            Column = PosGridBandedTableViewCustomerAmt
          end
          item
            Kind = skSum
            Column = PosGridBandedTableViewBuyAmt
          end
          item
            Format = ',0.00%'
            Kind = skAverage
            Column = PosGridBandedTableViewProfitRate
          end
          item
            Format = ',0'
            Kind = skSum
            Column = PosGridBandedTableViewProfitAmt
          end
          item
            Format = ',0'
            Kind = skSum
            Column = PosGridBandedTableViewCardAmt
          end
          item
            Format = ',0'
            Kind = skSum
            Column = PosGridBandedTableViewCashRcpAmt
          end
          item
            Format = ',0'
            Kind = skSum
            Column = PosGridBandedTableViewEtcAmt
          end
          item
            Format = ',0'
            Kind = skSum
            Column = PosGridBandedTableViewCashAmt
          end>
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
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.BandHeaders = False
        Bands = <
          item
            Caption = 'POS'#48324' '#47588#52636
          end>
        object PosGridBandedTableViewPosNo: TcxGridBandedColumn
          Tag = 98
          Caption = 'POS'
          DataBinding.FieldName = 'NO_POS'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 50
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object PosGridBandedTableViewSaleAmt: TcxGridBandedColumn
          Tag = 98
          Caption = #47588#52636#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_SALE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 95
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object PosGridBandedTableViewBuyAmt: TcxGridBandedColumn
          Tag = 99
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_BUY'
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object PosGridBandedTableViewCustomerCnt: TcxGridBandedColumn
          Caption = #44061#49688
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'CNT_CUST'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 60
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object PosGridBandedTableViewCustomerAmt: TcxGridBandedColumn
          Caption = #44061#45800#44032
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_CUST'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 70
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object PosGridBandedTableViewProfitAmt: TcxGridBandedColumn
          Caption = #51060#51061#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_PROFIT'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Visible = False
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 0
        end
        object PosGridBandedTableViewProfitRate: TcxGridBandedColumn
          Caption = #51060#51061#47456
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'RATE_PROFIT'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DecimalPlaces = 2
          Properties.DisplayFormat = ',0.00%'
          Visible = False
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Position.BandIndex = 0
          Position.ColIndex = 6
          Position.RowIndex = 0
        end
        object PosGridBandedTableViewCashAmt: TcxGridBandedColumn
          Caption = #54788#44552
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_CASH'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Visible = False
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 0
          Position.ColIndex = 7
          Position.RowIndex = 0
        end
        object PosGridBandedTableViewCardAmt: TcxGridBandedColumn
          Caption = #49888#50857#52852#46300
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_CARD'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Visible = False
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taRightJustify
          Options.Filtering = False
          Position.BandIndex = 0
          Position.ColIndex = 8
          Position.RowIndex = 0
        end
        object PosGridBandedTableViewCashRcpAmt: TcxGridBandedColumn
          Caption = #54788#44552#50689#49688#51613
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_CASHRCP'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Visible = False
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taRightJustify
          Options.Filtering = False
          Width = 82
          Position.BandIndex = 0
          Position.ColIndex = 9
          Position.RowIndex = 0
        end
        object PosGridBandedTableViewEtcAmt: TcxGridBandedColumn
          Caption = #44592#53440
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_ETC'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Visible = False
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Position.BandIndex = 0
          Position.ColIndex = 10
          Position.RowIndex = 0
        end
      end
      object PosGridLevel: TcxGridLevel
        GridView = PosGridBandedTableView
      end
    end
  end
  object ClassPanel: TAdvPanel [6]
    Left = 908
    Top = 191
    Width = 286
    Height = 155
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
    Caption.Text = '<P align="center">'#48516#47448#48324' '#47588#52636'</P>'
    Caption.Visible = True
    ColorTo = clWhite
    DoubleBuffered = True
    Position.Save = True
    Position.Key = 'SaleQuickShowForm'
    Position.Section = 'OrangeClassPanel'
    ShadowOffset = 5
    ShowMoveCursor = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    DesignSize = (
      286
      155)
    FullHeight = 180
    object ClassGrid: TcxGrid
      Left = 4
      Top = 28
      Width = 277
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
          Caption = #48516#47448
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
          Tag = 99
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
          Width = 53
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
  object SummeryPanel: TAdvPanel [7]
    Left = 8
    Top = 71
    Width = 1004
    Height = 136
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
    Caption.Text = '<P align="center">'#47588#52636' '#50836#50557'</P>'
    Caption.Visible = True
    ColorTo = clWhite
    DoubleBuffered = True
    Position.Save = True
    Position.Key = 'SaleQuickShowForm'
    Position.Section = 'OrangeSummeryPanel'
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
      136)
    FullHeight = 108
    object Grid: TcxGrid
      Left = 4
      Top = 30
      Width = 755
      Height = 101
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
      Height = 101
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
  object TimeGraphPanel: TAdvPanel [8]
    Left = 313
    Top = 427
    Width = 324
    Height = 137
    Color = clWhite
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    UseDockManager = True
    Visible = False
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
    Position.Key = 'SaleQuickShowForm'
    Position.Section = 'OrangeTimeGraphPanel'
    ShadowOffset = 5
    ShowMoveCursor = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    DesignSize = (
      324
      137)
    FullHeight = 220
    object TimeChartPanel: TPanel
      Left = 4
      Top = 28
      Width = 314
      Height = 103
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Ctl3D = False
      DoubleBuffered = False
      ParentCtl3D = False
      ParentDoubleBuffered = False
      TabOrder = 0
      OnResize = TimeChartPanelResize
    end
  end
  object TimePanel: TAdvPanel [9]
    Left = 449
    Top = 625
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
    Position.Key = 'SaleQuickShowForm'
    Position.Section = 'OrangeTimePanel'
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
  object CornerPanel: TAdvPanel [10]
    Left = 908
    Top = 505
    Width = 286
    Height = 286
    Color = clWhite
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 11
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
    Caption.Text = '<P align="center">'#53076#45320#48324' '#47588#52636'</P>'
    Caption.Visible = True
    ColorTo = clWhite
    DoubleBuffered = True
    Position.Save = True
    Position.Key = 'SaleQuickShowForm'
    Position.Section = 'OrangeCornerPanel'
    ShadowOffset = 5
    ShowMoveCursor = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    DesignSize = (
      286
      286)
    FullHeight = 180
    object cxGrid1: TcxGrid
      Left = 4
      Top = 28
      Width = 279
      Height = 253
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object CornerGridBandedTableView: TcxGridBandedTableView
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
        object cxGridBandedColumn1: TcxGridBandedColumn
          Tag = 99
          Caption = #48516#47448#53076#46300
          DataBinding.FieldName = 'CD_CLASS'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object CornerGridBandedTableViewCornerrName: TcxGridBandedColumn
          Tag = 98
          Caption = #53076#45320
          DataBinding.FieldName = 'NM_CORNER'
          HeaderAlignmentHorz = taCenter
          Width = 118
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object CornerGridBandedTableViewSaleAmt: TcxGridBandedColumn
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
        object CornerGridBandedTableViewRate: TcxGridBandedColumn
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
      object CornerGridLevel: TcxGridLevel
        GridView = CornerGridBandedTableView
      end
    end
  end
  object OrderPanel: TAdvPanel [11]
    Left = 65
    Top = 629
    Width = 378
    Height = 285
    Color = clWhite
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 12
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
    Caption.Text = '<P align="center">'#51452#47928#54788#54889'</P>'
    Caption.Visible = True
    ColorTo = clWhite
    DoubleBuffered = True
    Position.Save = True
    Position.Key = 'SaleQuickShowForm'
    Position.Section = 'OrangeOrderPanel'
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
      285)
    FullHeight = 220
    object OrderGrid: TcxGrid
      Left = 4
      Top = 28
      Width = 369
      Height = 252
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object OrderGridTableView: TcxGridTableView
        Tag = 99
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0'
            Kind = skSum
            Column = cxGridColumn3
          end
          item
            Format = ',0'
            Kind = skSum
            Column = cxGridColumn4
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object cxGridColumn1: TcxGridColumn
          Caption = #53580#51060#48660
          DataBinding.FieldName = 'NM_TABLE'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          HeaderAlignmentHorz = taCenter
          Width = 118
        end
        object cxGridColumn2: TcxGridColumn
          Caption = #51077#51109#49884#44036
          DataBinding.FieldName = 'COME_TIME'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 117
        end
        object cxGridColumn3: TcxGridColumn
          Caption = #51452#47928#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_ORDER'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Width = 83
        end
        object cxGridColumn4: TcxGridColumn
          Caption = #44256#44061#49688
          DataBinding.ValueType = 'Integer'
          DataBinding.FieldName = 'CNT_PERSON'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Width = 68
        end
      end
      object OrderGridLevel: TcxGridLevel
        GridView = OrderGridTableView
      end
    end
  end
  object MenuPanel: TAdvPanel [12]
    Left = 614
    Top = 394
    Width = 378
    Height = 285
    Color = clWhite
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 13
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
    Position.Key = 'SaleQuickShowForm'
    Position.Section = 'OrangeMenuPanel'
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
      285)
    FullHeight = 220
    object MenuGrid: TcxGrid
      Left = 4
      Top = 28
      Width = 369
      Height = 252
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelInner = bvNone
      BevelOuter = bvNone
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object MenuGridTableView: TcxGridTableView
        Tag = 99
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        OnCellDblClick = MenuGridTableViewCellDblClick
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
      OnClick = mnuVisibleSummeryClick
    end
    object mnuVisiblePos: TMenuItem
      Caption = 'POS'#48324' '#47588#52636
      OnClick = mnuVisiblePosClick
    end
    object mnuVisibleOrder: TMenuItem
      Caption = #51452#47928' '#45236#50669
      OnClick = mnuVisibleOrderClick
    end
    object mnuVisibleClass: TMenuItem
      Caption = #48516#47448#48324' '#47588#52636
      OnClick = mnuVisibleClassClick
    end
    object mnuVisiblePrice: TMenuItem
      Caption = #44552#50529#45824#48324' '#47588#52636
      OnClick = mnuVisiblePriceClick
    end
    object mnuVisibleTime: TMenuItem
      Caption = #49884#44036#45824#48324' '#47588#52636
      OnClick = mnuVisibleTimeClick
    end
    object mnuVisibleTable: TMenuItem
      Caption = #53580#51060#48660#48324' '#47588#52636
      OnClick = mnuVisibleTableClick
    end
    object mnuVisibleCourner: TMenuItem
      Caption = #53076#45320#48324' '#47588#52636
      OnClick = mnuVisibleCournerClick
    end
    object mnuVisibleMenu: TMenuItem
      Caption = #47700#45684#48324' '#47588#52636
      OnClick = mnuVisibleMenuClick
    end
    object mnuVisiblePayGraph: TMenuItem
      Caption = #44208#51228#49688#45800#48324' '#47588#52636'('#52320#53944')'
      OnClick = mnuVisiblePayGraphClick
    end
    object mnuVisibleTimeGraph: TMenuItem
      Caption = #49884#44036#45824#48324' '#47588#52636'('#52320#53944')'
      OnClick = mnuVisibleTimeGraphClick
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
    Left = 840
    Top = 160
  end
end
