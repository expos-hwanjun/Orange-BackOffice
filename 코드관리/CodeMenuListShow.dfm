inherited CodeMenuListShowForm: TCodeMenuListShowForm
  Caption = #47700#45684#47532#49828#53944
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    inherited ConditionToolBar: TAdvToolBar
      inherited ConditionToolBarDateLabel: TcxLabel
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        AnchorX = 166
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        AnchorX = 448
        AnchorY = 16
      end
    end
  end
  inherited Grid: TcxGrid
    inherited GridTableView: TcxGridTableView
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0 '#44148
          Kind = skCount
          Column = GridTableViewMenuCode
        end>
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      object GridTableViewMenuCode: TcxGridColumn
        Caption = #47700#45684#53076#46300
        DataBinding.FieldName = 'CD_MENU'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 121
      end
      object GridTableViewMenuNo: TcxGridColumn
        Caption = #47700#45684#48264#54840
        DataBinding.FieldName = 'NO_MENU'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 77
      end
      object GridTableViewMenuName: TcxGridColumn
        Caption = #47700#45684#51060#47492
        DataBinding.FieldName = 'NM_MENU'
        HeaderAlignmentHorz = taCenter
        Width = 250
      end
      object GridTableViewSpec: TcxGridColumn
        Caption = #44508#44201
        DataBinding.FieldName = 'NM_SPEC'
        HeaderAlignmentHorz = taCenter
        Width = 82
      end
      object GridTableViewMenuType: TcxGridColumn
        Caption = #47700#45684#44396#48516
        DataBinding.FieldName = 'DS_MENU_TYPE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 94
      end
      object GridTableViewSelectQty: TcxGridColumn
        Caption = #47700#45684#44079#49688
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'QTY_SELECT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
      end
      object GridTableViewBuyPrice: TcxGridColumn
        Caption = #47588#51077#45800#44032
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'PR_BUY'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 120
      end
      object GridTableViewSalePrice: TcxGridColumn
        Caption = #54032#47588#45800#44032
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'PR_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 91
      end
      object GridTableViewDoublePrice: TcxGridColumn
        Caption = #44273#48764#44592
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'PR_SALE_DOUBLE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 78
      end
      object GridTableViewPackingPrice: TcxGridColumn
        Caption = #54252#51109#45800#44032
        DataBinding.FieldName = 'PR_SALE_PACKING'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 79
      end
      object GridTableViewTipPrice: TcxGridColumn
        Caption = #48393#49324#47308
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'PR_TIP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
      end
      object GridTableViewDsTax: TcxGridColumn
        Caption = #44284#49464#44396#48516
        DataBinding.FieldName = 'DS_TAX'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 76
      end
      object GridTableViewKitchenCode: TcxGridColumn
        Caption = #51452#48169
        DataBinding.FieldName = 'CD_PRINTER'
        HeaderAlignmentHorz = taCenter
        Width = 113
      end
      object GridTableViewSavePoint: TcxGridColumn
        Caption = #54252#51064#53944#51201#47549
        DataBinding.FieldName = 'SAVE_POINT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 93
      end
      object GridTableViewUsePoint: TcxGridColumn
        Caption = #54252#51064#53944#49324#50857
        DataBinding.FieldName = 'USE_POINT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 84
      end
      object GridTableViewDcYN: TcxGridColumn
        Caption = #54624#51064
        DataBinding.FieldName = 'YN_DC'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 80
      end
      object GridTableViewSoldOut: TcxGridColumn
        Caption = #54408#51208
        DataBinding.FieldName = 'YN_SOLDOUT'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
      end
      object GridTableViewClassCode: TcxGridColumn
        Caption = #48516#47448
        DataBinding.FieldName = 'CD_CLASS'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 109
      end
      object GridTableViewCompanyCode: TcxGridColumn
        Caption = #47588#51077#52376
        DataBinding.FieldName = 'NM_TRDPL'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 110
      end
      object GridTableViewPerson: TcxGridColumn
        Caption = #44256#44061#49688#52628#51221
        DataBinding.FieldName = 'YN_PERSON'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 88
      end
      object GridTableViewStampSave: TcxGridColumn
        Caption = #49828#53596#54532#51201#47549
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'SAVE_STAMP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 93
      end
      object GridTableViewStampUse: TcxGridColumn
        Caption = #49828#53596#54532#49324#50857
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'USE_STAMP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 86
      end
      object GridTableViewUseYN: TcxGridColumn
        Caption = #49324#50857#50668#48512
        DataBinding.FieldName = 'YN_USE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
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
      PrinterPage.Margins.Top = 25100
      ReportDocument.CreationDate = 43237.498798726850000000
      PixelsPerInch = 96
      BuiltInReportLink = True
    end
  end
end
