inherited BuyOrderBuyForm: TBuyOrderBuyForm
  Left = 300
  Top = 122
  ClientHeight = 606
  ClientWidth = 990
  ExplicitLeft = 300
  ExplicitTop = 112
  ExplicitHeight = 606
  ExplicitWidth = 990
  Caption = #48156#51452' '#44160#49688
  HelpFile = #54980#48169'/'#48156#51452#47588#51077#44288#47532'/'#48156#51452#44160#49688'_'#47588#51077'.htm'
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    ExplicitLeft = -3
    ExplicitTop = -3
    inherited ButtonToolBar: TAdvToolBar
      Left = 506
      Width = 277
      ExplicitLeft = 506
      ExplicitWidth = 277
      inherited ButtonToolBarSeparator1: TAdvToolBarSeparator
        Width = 6
        ExplicitWidth = 6
      end
      inherited ButtonToolBarSeparator2: TAdvToolBarSeparator
        Left = 194
        Width = 6
        ExplicitLeft = 194
        ExplicitWidth = 6
      end
      inherited ButtonToolBarCloseButton: TAdvGlowButton
        Left = 200
        ExplicitLeft = 200
      end
      inherited ButtonToolBarPrintButton: TAdvGlowMenuButton
        Left = 94
        ExplicitLeft = 94
      end
    end
    inherited ConditionToolBar: TAdvToolBar
      Width = 704
      ExplicitWidth = 704
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
      inherited ConditionToolBarComboBox: TcxComboBox
        Left = 600
        Properties.Items.Strings = (
          #48156#51452' '#51204#54364
          #47588#51077' '#51204#54364
          #51204#52404' '#51204#54364)
        Visible = True
        ExplicitLeft = 600
        ExplicitWidth = 100
        Width = 100
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 480
        ExplicitLeft = 480
      end
    end
  end
  inherited Grid: TcxGrid
    ExplicitLeft = -2
    inherited GridDBTableView: TcxGridDBTableView
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'#44148
          Kind = skCount
          Column = GridDBTableViewOrderDate
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewOrderAmt
        end>
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      object GridDBTableViewOrderDate: TcxGridDBColumn
        Caption = #48156#51452#51068#51088
        DataBinding.FieldName = 'YMD_ORDER'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 106
      end
      object GridDBTableViewOrderNo: TcxGridDBColumn
        Caption = #48156#51452#48264#54840
        DataBinding.FieldName = 'NO_ORDER'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 76
      end
      object GridDBTableViewCompanyName: TcxGridDBColumn
        Caption = #44144#47000#52376
        DataBinding.FieldName = 'NM_TRDPL'
        HeaderAlignmentHorz = taCenter
        Width = 225
      end
      object GridDBTableViewOrderAmt: TcxGridDBColumn
        Caption = #48156#51452#44552#50529
        DataBinding.FieldName = 'AMT_ORDER'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 95
      end
      object GridDBTableViewBuyDate: TcxGridDBColumn
        Caption = #47588#51077#51068#51088
        DataBinding.FieldName = 'YMD_BUY'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 116
      end
      object GridDBTableViewBuyNo: TcxGridDBColumn
        Caption = #47588#51077#48264#54840
        DataBinding.FieldName = 'NO_BUY'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 73
      end
      object GridDBTableViewBuyAmt: TcxGridDBColumn
        Caption = #47588#51077#44552#50529
        DataBinding.FieldName = 'AMT_BUY'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 118
      end
    end
    inherited GridSubDBTableView: TcxGridDBTableView
      Tag = 99
      DataController.DetailKeyFieldNames = 'LINK'
      DataController.MasterKeyFieldNames = 'LINK'
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0 '#44148
          Kind = skCount
          Column = GridSubDBTableViewGoodsName
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridSubDBTableViewNetAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridSubDBTableViewVatAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridSubDBTableViewAmt
        end>
      OptionsView.Footer = True
      Styles.ContentEven = StyleEven
      object GridSubDBTableViewGoodsCode: TcxGridDBColumn
        Caption = #49345#54408#53076#46300
        DataBinding.FieldName = 'CD_GOODS'
        HeaderAlignmentHorz = taCenter
        Width = 105
      end
      object GridSubDBTableViewGoodsName: TcxGridDBColumn
        Caption = #49345#54408#51060#47492
        DataBinding.FieldName = 'NM_GOODS'
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 200
      end
      object GridSubDBTableViewGoodsSpec: TcxGridDBColumn
        Caption = #44508#44201
        DataBinding.FieldName = 'NM_SPEC'
        HeaderAlignmentHorz = taCenter
        Width = 120
      end
      object GridSubDBTableViewOrderQty: TcxGridDBColumn
        Caption = #49688#47049
        DataBinding.FieldName = 'QTY_ORDER'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 65
      end
      object GridSubDBTableViewOrderPrice: TcxGridDBColumn
        Caption = #45800#44032
        DataBinding.FieldName = 'PR_ORDER'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.00'
        HeaderAlignmentHorz = taCenter
        Width = 95
      end
      object GridSubDBTableViewNetAmt: TcxGridDBColumn
        Caption = #44277#44553#44032
        DataBinding.FieldName = 'AMT_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 95
      end
      object GridSubDBTableViewVatAmt: TcxGridDBColumn
        Caption = #48512#44032#49464
        DataBinding.FieldName = 'AMT_TAX'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 85
      end
      object GridSubDBTableViewAmt: TcxGridDBColumn
        Caption = #48156#51452#44552#50529
        DataBinding.FieldName = 'AMT_ORDER'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 95
      end
    end
  end
  inherited EditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited DXPrinter: TdxComponentPrinter
    inherited DXPrinterLink: TdxGridReportLink
      ReportDocument.CreationDate = 40448.943865555560000000
      BuiltInReportLink = True
    end
  end
end
