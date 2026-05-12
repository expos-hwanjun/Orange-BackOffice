inherited StoreCustomerListShowForm: TStoreCustomerListShowForm
  Caption = #44032#47609#51216' '#47532#49828#53944
  ClientHeight = 788
  ClientWidth = 1299
  ExplicitWidth = 1315
  ExplicitHeight = 827
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1299
    ExplicitWidth = 1299
    inherited ConditionToolBar: TAdvToolBar
      Width = 753
      ExplicitWidth = 753
      inherited ConditionToolBarDateLabel: TcxLabel
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        AnchorX = 166
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        Visible = True
        AnchorX = 448
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Visible = True
        ExplicitWidth = 89
        Width = 89
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 569
        Visible = True
        ExplicitLeft = 569
        ExplicitWidth = 180
        Width = 180
      end
    end
  end
  inherited Grid: TcxGrid
    Width = 1293
    Height = 717
    ExplicitWidth = 1293
    ExplicitHeight = 717
    inherited GridTableView: TcxGridTableView
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = ',0 '#44148
          Kind = skCount
          Position = spFooter
          Column = GridTableViewStoreName
        end
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridTableViewColumn4
        end
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridTableViewColumn5
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0 '#44148
          Kind = skCount
          Column = GridTableViewStoreName
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewColumn4
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewColumn5
        end>
      OptionsView.Footer = True
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      Styles.ContentEven = StyleEven
      object GridTableViewColumn1: TcxGridColumn
        Caption = #54801#47141#49324
        DataBinding.FieldName = 'NM_PARTNER'
        HeaderAlignmentHorz = taCenter
        Width = 101
      end
      object GridTableViewColumn21: TcxGridColumn
        Caption = #51088#45824#47532#51216
        DataBinding.FieldName = 'SUB_PARTNER'
        HeaderAlignmentHorz = taCenter
        Width = 84
      end
      object GridTableViewColumn7: TcxGridColumn
        Caption = #48376#49324
        DataBinding.FieldName = 'NM_COMPANY'
        HeaderAlignmentHorz = taCenter
        Width = 123
      end
      object GridTableViewColumn2: TcxGridColumn
        Caption = #47588#51109#53076#46300
        DataBinding.FieldName = 'CD_CUSTOMER'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object GridTableViewStoreName: TcxGridColumn
        Caption = #47588#51109#51060#47492
        DataBinding.FieldName = 'NM_CUSTOMER'
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 125
      end
      object GridTableViewColumn4: TcxGridColumn
        Caption = #54252#49828
        DataBinding.ValueType = 'Integer'
        DataBinding.FieldName = 'ALLOW_POS'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
      end
      object GridTableViewColumn5: TcxGridColumn
        Caption = #53412#50724#49828#53356
        DataBinding.ValueType = 'Integer'
        DataBinding.FieldName = 'ALLOW_KIOSK'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 86
      end
      object GridTableViewColumn22: TcxGridColumn
        Caption = #53580#48660#47551
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'ALLOW_TABLET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
      end
      object GridTableViewColumn6: TcxGridColumn
        Caption = #51204#54868#48264#54840
        DataBinding.FieldName = 'TEL_MOBILE'
        HeaderAlignmentHorz = taCenter
        Width = 128
      end
      object GridTableViewColumn11: TcxGridColumn
        Caption = 'VAN'
        DataBinding.FieldName = 'VAN'
        HeaderAlignmentHorz = taCenter
      end
      object GridTableViewColumn12: TcxGridColumn
        Caption = 'VAN'#48169#49885
        DataBinding.FieldName = 'DS_VAN'
        HeaderAlignmentHorz = taCenter
        Width = 94
      end
      object GridTableViewColumn15: TcxGridColumn
        Caption = #44396#46021#48169#49885
        DataBinding.FieldName = 'DS_LICENSE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 80
      end
      object GridTableViewColumn16: TcxGridColumn
        Caption = #44396#46021#51333#47308
        DataBinding.FieldName = 'YMD_PAYEND'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 92
      end
      object GridTableViewColumn17: TcxGridColumn
        Caption = #44396#46021#48708#50857
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_ASP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 81
      end
      object GridTableViewColumn3: TcxGridColumn
        Caption = #51648#50669
        DataBinding.FieldName = 'NM_LOCAL'
        HeaderAlignmentHorz = taCenter
      end
      object GridTableViewColumn10: TcxGridColumn
        Caption = #45812#45817#51088
        DataBinding.FieldName = 'NM_MANAGER'
        HeaderAlignmentHorz = taCenter
      end
      object GridTableViewColumn13: TcxGridColumn
        Caption = #50629#51333
        DataBinding.FieldName = 'UPJONG'
        HeaderAlignmentHorz = taCenter
      end
      object GridTableViewColumn14: TcxGridColumn
        Caption = #47588#51109#44508#47784
        DataBinding.FieldName = 'STORE_SIZE'
        HeaderAlignmentHorz = taCenter
        Width = 87
      end
      object GridTableViewColumn8: TcxGridColumn
        Caption = #51452#49548
        DataBinding.FieldName = 'ADDR'
        HeaderAlignmentHorz = taCenter
        Width = 168
      end
      object GridTableViewColumn18: TcxGridColumn
        Caption = #44228#50557#44592#44036
        DataBinding.FieldName = 'STIPULATE_DATE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 139
      end
      object GridTableViewColumn19: TcxGridColumn
        Caption = #50557#51221#44148#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'STIPULATE_COUNT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 84
      end
      object GridTableViewColumn20: TcxGridColumn
        Caption = #50900#44288#47532#48708
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'RENTAL_FEE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 81
      end
      object GridTableViewColumn9: TcxGridColumn
        Caption = #49345#53468
        DataBinding.FieldName = 'DS_STATUS'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 89
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
      ReportDocument.CreationDate = 44518.630993888890000000
      PixelsPerInch = 96
      BuiltInReportLink = True
    end
  end
end
