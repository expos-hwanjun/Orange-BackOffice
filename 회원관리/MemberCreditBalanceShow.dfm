inherited MemberCreditBalanceShowForm: TMemberCreditBalanceShowForm
  Left = 300
  Top = 122
  ClientHeight = 606
  ClientWidth = 990
  ExplicitLeft = 300
  ExplicitTop = 112
  ExplicitHeight = 606
  ExplicitWidth = 990
  Caption = #54924#50896#48324' '#50808#49345' '#51092#50529' '#51312#54924
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
        Caption = #51312#54924#54924#50896
        Visible = True
        AnchorX = 448
        AnchorY = 16
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Visible = True
        OnKeyPress = ConditionToolBarEditKeyPress
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
    RootLevelOptions.DetailTabsPosition = dtpTop
    OnActiveTabChanged = GridActiveTabChanged
    inherited GridTableView: TcxGridTableView
      OnDblClick = GridTableViewDblClick
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewColumn6
        end>
      DataController.Data = {
        E70000000F00000044617461436F6E74726F6C6C657231090000001200000054
        6378537472696E6756616C75655479706512000000546378537472696E675661
        6C75655479706512000000546378537472696E6756616C756554797065120000
        00546378537472696E6756616C7565547970651400000054637843757272656E
        637956616C7565547970651400000054637843757272656E637956616C756554
        7970651400000054637843757272656E637956616C7565547970651200000054
        6378537472696E6756616C75655479706512000000546378537472696E675661
        6C75655479706500000000}
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 39
      Styles.ContentEven = StyleEven
      object GridTableViewMemberCode: TcxGridColumn
        Caption = #54924#50896#53076#46300
        DataBinding.FieldName = 'CD_MEMBER'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 113
      end
      object GridTableViewMemberName: TcxGridColumn
        Caption = #54924#50896#51060#47492
        DataBinding.FieldName = 'NM_MEMBER'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 153
      end
      object GridTableViewColumn4: TcxGridColumn
        Caption = #52852#46300#48264#54840
        DataBinding.FieldName = 'NO_CARD'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 124
      end
      object GridTableViewColumn5: TcxGridColumn
        Caption = #55092#45824#51204#54868
        DataBinding.FieldName = 'TEL_MOBIL'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 134
      end
      object GridTableViewColumn8: TcxGridColumn
        Caption = #51060#50900#44552#50529'(A)'
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_BEFORE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 90
      end
      object GridTableViewColumn1: TcxGridColumn
        Caption = #50808#49345#44552#50529'(B)'
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TRUST'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 90
      end
      object GridTableViewColumn9: TcxGridColumn
        Caption = #44208#51228#44552#50529'(C)'
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_PAYIN'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 109
      end
      object GridTableViewColumn6: TcxGridColumn
        Caption = #50808#49345#51092#50529'(A+B-C)'
        DataBinding.FieldName = 'AMT_REMAIN'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 90
      end
      object GridTableViewColumn7: TcxGridColumn
        Caption = #52572#51333#44208#51228#51068#51088
        DataBinding.FieldName = 'YMD_ACCT'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 106
      end
    end
    object BookGridTableView: TcxGridTableView [1]
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = BookGridTableViewTrustAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = BookGridTableViewPayInAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = BookGridTableViewRemainAmt
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      Styles.OnGetContentStyle = BookGridTableViewStylesGetContentStyle
      object BookGridTableViewColumn1: TcxGridColumn
        Caption = #51068#51088
        DataBinding.FieldName = 'YMD_SALE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 127
      end
      object BookGridTableViewColumn2: TcxGridColumn
        Caption = #44396#48516
        DataBinding.FieldName = 'DS_TYPE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 73
      end
      object BookGridTableViewTrustAmt: TcxGridColumn
        Caption = #50808#49345#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TRUST'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 118
      end
      object BookGridTableViewPayInAmt: TcxGridColumn
        Caption = #44208#51228#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_PAYIN'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 119
      end
      object BookGridTableViewRemainAmt: TcxGridColumn
        Caption = #50808#49345#51092#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_REMAIN'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 137
      end
      object BookGridTableViewColumn6: TcxGridColumn
        Caption = #48708' '#44256
        DataBinding.FieldName = 'REMARK'
        HeaderAlignmentHorz = taCenter
        Width = 201
      end
    end
    inherited GridLevel: TcxGridLevel
      Caption = ' '#54924#50896#48324' '#50808#49345' '#51092#50529' '
    end
    object GridLevel1: TcxGridLevel
      Caption = ' '#50808#49345#50896#51109' '
      GridView = BookGridTableView
    end
  end
  inherited EditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited DXPrinter: TdxComponentPrinter
    inherited DXPrinterLink: TdxGridReportLink
      PrinterPage.PageHeader.CenterTitle.Strings = (
        #54924#50896#48324' '#50808#49345' '#51092#50529' '#51312#54924
        '')
      ReportDocument.CreationDate = 40457.396340416660000000
      OptionsView.Caption = True
      BuiltInReportLink = True
    end
  end
end
