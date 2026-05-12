inherited StockNotSurveyConfirmForm: TStockNotSurveyConfirmForm
  Caption = #48120#51116#44256#49892#49324' '#49345#54408' '#54869#51221
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    inherited ConditionToolBar: TAdvToolBar
      Width = 847
      ExplicitWidth = 847
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        Visible = True
      end
      inherited ConditionToolBarDateLabel: TcxLabel
        Caption = #49892#49324#51068#51088
        Visible = True
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        AnchorX = 166
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        AnchorX = 298
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Properties.Alignment.Horz = taCenter
        Properties.Items.Strings = (
          #51204#52404
          #48516#47448
          #44144#47000#52376)
        Properties.OnChange = ConditionToolBarComboBoxPropertiesChange
        Text = #51204#52404
        Visible = True
        ExplicitWidth = 71
        Width = 71
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 491
        Enabled = False
        ExplicitLeft = 491
        ExplicitWidth = 186
        Width = 186
      end
      object ConditionToolBarButtonEdit: TcxButtonEdit
        Left = 401
        Top = 2
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = ConditionToolBarButtonEditPropertiesButtonClick
        Properties.OnValidate = EditPropertiesValidate
        TabOrder = 7
        Visible = False
        Width = 90
      end
      object ConditionToolBaComboBox: TcxComboBox
        Left = 677
        Top = 2
        Properties.DropDownListStyle = lsFixedList
        TabOrder = 8
        Visible = False
        Width = 166
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
    Width = 942
    Height = 510
    Align = alClient
    TabOrder = 3
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object GridTableView: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      FilterBox.CustomizeDialog = False
      FilterBox.Visible = fvNever
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
          Column = GridTableViewStockQty
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewSurveyQty
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewLossQty
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      object GridTableViewGoodsCode: TcxGridColumn
        Caption = #49345#54408#53076#46300
        DataBinding.FieldName = 'CD_MENU'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Grouping = False
        Options.Moving = False
        Width = 110
      end
      object GridTableViewGoodsName: TcxGridColumn
        Caption = #49345#54408#51060#47492
        DataBinding.FieldName = 'NM_MENU'
        HeaderAlignmentHorz = taCenter
        Options.Grouping = False
        Options.Moving = False
        Width = 200
      end
      object GridTableViewGoodsSpec: TcxGridColumn
        Caption = #44508#44201
        DataBinding.FieldName = 'NM_SPEC'
        HeaderAlignmentHorz = taCenter
        Options.Grouping = False
        Options.Moving = False
        Width = 100
      end
      object GridTableViewStockQty: TcxGridColumn
        Caption = #51204#49328#51116#44256
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'QTY_STOCK'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.##'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Grouping = False
        Options.Moving = False
        Width = 87
      end
      object GridTableViewSurveyQty: TcxGridColumn
        Caption = #54869#51221#49688#47049
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'QTY_SURVEY'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 77
      end
      object GridTableViewLossQty: TcxGridColumn
        Caption = #44284#48512#51313
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'QTY_ADJ'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Grouping = False
        Options.Moving = False
        Width = 70
      end
    end
    object GridLevel: TcxGridLevel
      Caption = ' '#51116#44256#49345#54408' '
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
