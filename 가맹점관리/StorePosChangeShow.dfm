inherited StorePosChangeShowForm: TStorePosChangeShowForm
  Caption = #51064#51613#45236#50669' '#51312#54924
  ClientHeight = 764
  ClientWidth = 980
  ExplicitWidth = 996
  ExplicitHeight = 803
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 980
    ExplicitWidth = 1073
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
        AnchorX = 448
        AnchorY = 16
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
    Width = 974
    Height = 693
    ExplicitWidth = 1067
    inherited GridTableView: TcxGridTableView
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skCount
          Column = GridTableViewColumn3
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
        end>
      OptionsView.Footer = True
      object GridTableViewColumn1: TcxGridColumn
        Caption = #54801#47141#49324
        DataBinding.FieldName = 'NM_PARTNER'
        HeaderAlignmentHorz = taCenter
        Width = 125
      end
      object GridTableViewColumn2: TcxGridColumn
        Caption = #48376#49324
        DataBinding.FieldName = 'NM_COMPANY'
        HeaderAlignmentHorz = taCenter
        Width = 158
      end
      object GridTableViewColumn9: TcxGridColumn
        Caption = #47588#51109#53076#46300
        DataBinding.FieldName = 'CD_CUSTOMER'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
      end
      object GridTableViewColumn3: TcxGridColumn
        Caption = #47588#51109#47749
        DataBinding.FieldName = 'NM_CUSTOMER'
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 145
      end
      object GridTableViewColumn4: TcxGridColumn
        Caption = #49556#47336#49496
        DataBinding.FieldName = 'DS_SOLUTION'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 122
      end
      object GridTableViewColumn5: TcxGridColumn
        Caption = 'POS'
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'ALLOW_POS'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 82
      end
      object GridTableViewColumn6: TcxGridColumn
        Caption = 'KIOSK'
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'ALLOW_KIOSK'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 80
      end
      object GridTableViewColumn7: TcxGridColumn
        Caption = 'TABLET'
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'ALLOW_TABLET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 77
      end
      object GridTableViewColumn8: TcxGridColumn
        Caption = #48320#44221#51068#49884
        DataBinding.FieldName = 'DT_INSERT'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 107
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
      ReportDocument.CreationDate = 45966.763538090280000000
      PixelsPerInch = 96
      BuiltInReportLink = True
    end
  end
end
