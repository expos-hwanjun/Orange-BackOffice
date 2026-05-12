inherited SystemCashBoxShowForm: TSystemCashBoxShowForm
  Caption = #44552#51204#54632' '#49324#50857#47196#44536
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    inherited ConditionToolBar: TAdvToolBar
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
        Caption = #44228#49328#50896
        Visible = True
        AnchorX = 448
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Visible = True
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
    inherited GridTableView: TcxGridTableView
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0 '#54924
          Kind = skCount
          Column = GridTableViewColumn3
        end>
      OptionsView.Footer = True
      Styles.ContentEven = StyleEven
      object GridTableViewColumn1: TcxGridColumn
        Caption = #49884#49828#53596#51068#51088
        DataBinding.FieldName = 'YMD_REAL'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 97
      end
      object GridTableViewColumn2: TcxGridColumn
        Caption = #49692#48264
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'SEQ'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 66
      end
      object GridTableViewColumn3: TcxGridColumn
        Caption = #47588#52636#51068#51088
        DataBinding.FieldName = 'YMD_SALE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 98
      end
      object GridTableViewColumn4: TcxGridColumn
        Caption = #54252#49828
        DataBinding.FieldName = 'NO_POS'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 74
      end
      object GridTableViewColumn5: TcxGridColumn
        Caption = #50689#49688#51613
        DataBinding.FieldName = 'NO_RCP'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 92
      end
      object GridTableViewColumn6: TcxGridColumn
        Caption = #44228#49328#50896
        DataBinding.FieldName = 'NM_SAWON'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 96
      end
      object GridTableViewColumn7: TcxGridColumn
        Caption = #49324#50857#51068#49884
        DataBinding.FieldName = 'DT_CHANGE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 144
      end
    end
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited dxComponentPrinter: TdxComponentPrinter
    PixelsPerInch = 96
    inherited dxComponentPrinter1Link1: TdxGridReportLink
      ReportDocument.CreationDate = 41410.588045428240000000
      PixelsPerInch = 96
      BuiltInReportLink = True
    end
  end
end
