inherited HeadMonthSaleShowForm: THeadMonthSaleShowForm
  Caption = #50900#48324' '#47588#52636'('#48376#48512')'
  ClientHeight = 648
  ExplicitHeight = 687
  PixelsPerInch = 96
  TextHeight = 17
  object PosSplitter: TAdvSplitter [0]
    Left = 0
    Top = 478
    Width = 946
    Height = 6
    Cursor = crVSplit
    Align = alBottom
    AutoSnap = False
    MinSize = 80
    Appearance.BorderColor = clNone
    Appearance.BorderColorHot = clNone
    Appearance.Color = 14542308
    Appearance.ColorTo = 16768709
    Appearance.ColorHot = 15383705
    Appearance.ColorHotTo = 14922381
    GripStyle = sgFlatDots
    ExplicitLeft = -8
    ExplicitTop = 567
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    inherited ConditionToolBar: TAdvToolBar
      Width = 693
      ExplicitWidth = 693
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        Left = 156
        ExplicitLeft = 156
      end
      inherited ConditionToolBarDateLabel: TcxLabel
        Caption = #51312#54924#45380#46020
        Visible = True
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarToDateEdit: TcxDateEdit
        Left = 264
        ExplicitLeft = 264
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        Left = 246
        ExplicitLeft = 246
        AnchorX = 255
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        Left = 504
        ExplicitLeft = 504
        AnchorX = 537
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Left = 67
        Properties.Alignment.Horz = taCenter
        Visible = True
        ExplicitLeft = 67
        ExplicitWidth = 89
        Width = 89
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 569
        ExplicitLeft = 569
      end
      inherited ConditionToolbarMonthRadioButton: TcxRadioButton
        Left = 454
        ExplicitLeft = 454
      end
      inherited ConditionToolbarTodayRadioButton: TcxRadioButton
        Left = 354
        ExplicitLeft = 354
      end
      inherited ConditionToolbarWeekRadioButton: TcxRadioButton
        Left = 404
        ExplicitLeft = 404
      end
    end
  end
  inherited Grid: TcxGrid
    Height = 407
    ExplicitHeight = 407
    inherited GridTableView: TcxGridTableView
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewJan
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewFeb
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewMar
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewApr
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewMay
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewJun
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewJul
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewAug
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewSep
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewOct
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewNov
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewDec
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewTotal
        end
        item
          Format = ',0 '#44148
          Kind = skCount
          Column = GridTableViewStoreName
        end>
      DataController.Data = {
        690100000F00000044617461436F6E74726F6C6C6572310E0000001200000054
        6378537472696E6756616C7565547970651400000054637843757272656E6379
        56616C7565547970651400000054637843757272656E637956616C7565547970
        651400000054637843757272656E637956616C75655479706514000000546378
        43757272656E637956616C7565547970651400000054637843757272656E6379
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
      object GridTableViewStoreName: TcxGridColumn
        Caption = #47588#51109#47749
        DataBinding.FieldName = 'NM_STORE_SHORT'
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 166
      end
      object GridTableViewJan: TcxGridColumn
        Caption = '1'#50900
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_01'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object GridTableViewFeb: TcxGridColumn
        Caption = '2'#50900
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_02'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object GridTableViewMar: TcxGridColumn
        Caption = '3'#50900
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_03'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object GridTableViewApr: TcxGridColumn
        Caption = '4'#50900
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_04'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object GridTableViewMay: TcxGridColumn
        Caption = '5'#50900
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_05'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object GridTableViewJun: TcxGridColumn
        Caption = '6'#50900
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_06'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object GridTableViewJul: TcxGridColumn
        Caption = '7'#50900
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_07'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object GridTableViewAug: TcxGridColumn
        Caption = '8'#50900
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_08'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object GridTableViewSep: TcxGridColumn
        Caption = '9'#50900
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_09'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object GridTableViewOct: TcxGridColumn
        Caption = '10'#50900
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_10'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object GridTableViewNov: TcxGridColumn
        Caption = '11'#50900
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_11'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object GridTableViewDec: TcxGridColumn
        Caption = '12'#50900
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_12'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object GridTableViewTotal: TcxGridColumn
        Caption = #54633#44228#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TOT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 96
      end
    end
  end
  object ChartGraphPanel: TPanel [3]
    Left = 0
    Top = 484
    Width = 946
    Height = 164
    Align = alBottom
    BevelOuter = bvNone
    DoubleBuffered = False
    ParentDoubleBuffered = False
    TabOrder = 3
    OnResize = ChartGraphPanelResize
    object ChartPanel: TPanel
      Left = 0
      Top = 0
      Width = 946
      Height = 164
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
    end
  end
  inherited EditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited dxComponentPrinter: TdxComponentPrinter
    inherited dxComponentPrinter1Link1: TdxGridReportLink
      ReportDocument.CreationDate = 44243.733943472220000000
      BuiltInReportLink = True
    end
  end
end
