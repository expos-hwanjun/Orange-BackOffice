inherited StockSurveyConfirmForm: TStockSurveyConfirmForm
  Left = 300
  Top = 120
  Caption = #51116#44256' '#49892#49324' '#54869#51221
  ClientHeight = 602
  ClientWidth = 964
  HelpFile = #54980#48169'/'#51116#44256#44288#47532'/'#49892#49324#54869#51221'.htm'
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
      inherited ButtonToolBarSaveButton: TAdvGlowButton
        Caption = #54869#51221'(F5)'
      end
      inherited ButtonToolBarDeleteButton: TAdvGlowButton
        Visible = False
      end
    end
    inherited ConditionToolBar: TAdvToolBar
      Width = 265
      ExplicitWidth = 265
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        Left = 261
        TabStop = False
        Visible = True
        ExplicitLeft = 261
        ExplicitWidth = 0
        Width = 0
      end
      inherited ConditionToolBarDateLabel: TcxLabel
        Caption = #49892#49324#51068#51088
        Visible = True
        ExplicitWidth = 79
        Width = 79
        AnchorX = 42
        AnchorY = 16
      end
      inherited ConditionToolBarToDateEdit: TcxDateEdit
        Left = 261
        ExplicitLeft = 261
        ExplicitWidth = 0
        Width = 0
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        Left = 261
        ExplicitLeft = 261
        ExplicitWidth = 0
        Width = 0
        AnchorX = 261
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        Left = 261
        ExplicitLeft = 261
        ExplicitWidth = 0
        Width = 0
        AnchorX = 261
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Left = 81
        Properties.Alignment.Horz = taCenter
        Properties.OnChange = EditPropertiesChange
        Visible = True
        ExplicitLeft = 81
        ExplicitWidth = 100
        Width = 100
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 181
        TabStop = False
        Properties.Alignment.Horz = taCenter
        Properties.ReadOnly = True
        ExplicitLeft = 181
        ExplicitWidth = 80
        Width = 80
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
    RootLevelOptions.DetailTabsPosition = dtpTop
    object GridTableView: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      FilterBox.CustomizeDialog = False
      FilterBox.Visible = fvNever
      OnCellDblClick = GridTableViewCellDblClick
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'#44148
          Kind = skCount
          Column = GridTableViewGoodsCode
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object GridTableViewCompanyName: TcxGridColumn
        Caption = #44144#47000#52376
        DataBinding.FieldName = 'NM_TRDPL'
        HeaderAlignmentHorz = taCenter
        Width = 200
      end
      object GridTableViewGoodsCode: TcxGridColumn
        Caption = #49345#54408#53076#46300
        DataBinding.FieldName = 'CD_GOODS'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Grouping = False
        Options.Moving = False
        Width = 110
      end
      object GridTableViewGoodsName: TcxGridColumn
        Caption = #49345#54408#51060#47492
        DataBinding.FieldName = 'NM_GOODS'
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
        HeaderAlignmentHorz = taCenter
        Options.Grouping = False
        Options.Moving = False
        Width = 70
      end
      object GridTableViewSurveyQty: TcxGridColumn
        Caption = #49892#49324#51116#44256
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'QTY_SILSA'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.##'
        HeaderAlignmentHorz = taCenter
        Options.Grouping = False
        Options.Moving = False
        Width = 70
      end
      object GridTableViewLossQty: TcxGridColumn
        Caption = #47196#49828
        DataBinding.FieldName = 'QTY_SETTLE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Grouping = False
        Options.Moving = False
        Width = 70
      end
    end
    object GridTableView1: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object GridTableView1Column1: TcxGridColumn
        Caption = #49345#54408#53076#46300
        DataBinding.FieldName = 'CD_GOODS'
        HeaderAlignmentHorz = taCenter
        Width = 147
      end
      object GridTableView1Column2: TcxGridColumn
        Caption = #49345#54408#51060#47492
        DataBinding.FieldName = 'NM_MENU'
        HeaderAlignmentHorz = taCenter
        Width = 218
      end
      object GridTableView1Column3: TcxGridColumn
        Caption = #44508#44201
        DataBinding.FieldName = 'NM_SPEC'
        HeaderAlignmentHorz = taCenter
        Width = 121
      end
      object GridTableView1Column5: TcxGridColumn
        Caption = #49892#49324#49688#47049
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'QTY_SILSA'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.##'
        HeaderAlignmentHorz = taCenter
        Width = 142
      end
      object GridTableView1Column6: TcxGridColumn
        Caption = #51077#47141#51109#48708
        DataBinding.FieldName = 'NO_POS'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
      end
    end
    object GridLevel: TcxGridLevel
      Caption = ' '#51116#44256#49345#54408' '
      GridView = GridTableView
    end
    object GridLevel1: TcxGridLevel
      Caption = ' '#49345#49464#49892#49324#45236#50669' '
      GridView = GridTableView1
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
