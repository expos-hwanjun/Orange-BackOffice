inherited StockBaseStockForm: TStockBaseStockForm
  Left = 300
  Top = 120
  Caption = #44592#52488' '#51116#44256' '#46321#47197
  ClientHeight = 602
  ClientWidth = 964
  HelpFile = #54980#48169'/'#51116#44256#44288#47532'/'#44592#52488#51116#44256#46321#47197'.htm'
  ExplicitWidth = 980
  ExplicitHeight = 641
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 964
    ExplicitWidth = 964
    inherited ButtonToolBar: TAdvToolBar
      Left = 604
      ExplicitLeft = 604
      inherited ButtonToolBarDeleteButton: TAdvGlowButton
        Visible = False
      end
    end
    inherited ConditionToolBar: TAdvToolBar
      Width = 654
      ExplicitWidth = 654
      inherited ConditionToolBarDateLabel: TcxLabel
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        AnchorX = 166
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        Caption = #44144#47000#52376
        Visible = True
        AnchorX = 298
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Visible = True
        ExplicitWidth = 200
        Width = 200
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 530
        ExplicitLeft = 530
      end
    end
  end
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 25
  end
  object Grid: TcxGrid [2]
    AlignWithMargins = True
    Left = 3
    Top = 68
    Width = 958
    Height = 531
    Align = alClient
    TabOrder = 2
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object GridTableView: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'#44148
          Kind = skCount
          Column = GridTableViewGoodsCode
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewBuyAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewSaleAmt
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object GridTableViewGoodsCode: TcxGridColumn
        Caption = #49345#54408#53076#46300
        DataBinding.FieldName = 'CD_GOODS'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ClickKey = 112
        Properties.ImeMode = imSHanguel
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 110
      end
      object GridTableViewGoodsName: TcxGridColumn
        Caption = #49345#54408#51060#47492
        DataBinding.FieldName = 'NM_GOODS'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 200
      end
      object GridTableViewStockQty: TcxGridColumn
        Caption = #51116#44256#49688#47049
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'QTY_BASE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.##'
        Properties.OnValidate = EditPropertiesValidate
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 70
      end
      object GridTableViewBuyPrice: TcxGridColumn
        Caption = #47588#51077#45800#44032
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'PR_BUY'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.00'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 80
      end
      object GridTableViewBuyAmt: TcxGridColumn
        Caption = #47588#51077#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_BASE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.00'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 100
      end
      object GridTableViewSalePrice: TcxGridColumn
        Caption = #54032#47588#45800#44032
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'PR_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 80
      end
      object GridTableViewSaleAmt: TcxGridColumn
        Caption = #54032#47588'('#50696#49345')'#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_BASE_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 100
      end
      object GridTableViewChanged: TcxGridColumn
        Tag = 99
        Caption = #49688#51221#50668#48512
        DataBinding.ValueType = 'Boolean'
        Visible = False
      end
    end
    object GridLevel: TcxGridLevel
      GridView = GridTableView
    end
  end
  inherited EditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
