inherited ClosePosCloseForm: TClosePosCloseForm
  Left = 300
  Top = 120
  Caption = 'POS '#47560#44048'/'#52712#49548
  ClientHeight = 612
  ClientWidth = 964
  HelpFile = #54980#48169'/'#47560#44048#44288#47532'/POS'#47560#44048'_'#52712#49548'.htm'
  ExplicitWidth = 980
  ExplicitHeight = 650
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 964
    ExplicitWidth = 964
    inherited ButtonToolBar: TAdvToolBar
      Left = 577
      Width = 384
      ExplicitLeft = 577
      ExplicitWidth = 384
      inherited ButtonToolBarSeparator: TAdvToolBarSeparator
        Left = 297
        ExplicitLeft = 297
      end
      inherited ButtonToolBarCloseButton: TAdvGlowButton
        Left = 307
        ExplicitLeft = 307
      end
      inherited ButtonToolBarSaveButton: TAdvGlowButton
        Left = 98
        Caption = #47560#44048'(F5)'
        ExplicitLeft = 98
      end
      inherited ButtonToolBarDeleteButton: TAdvGlowButton
        Left = 184
        Width = 113
        Caption = #47560#44048#52712#49548'(F4)'
        Enabled = False
        ExplicitLeft = 184
        ExplicitWidth = 113
      end
    end
    inherited ConditionToolBar: TAdvToolBar
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        Visible = True
        OnKeyDown = ConditionToolBarFromDateEditKeyDown
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
        AnchorX = 298
        AnchorY = 16
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
    Height = 541
    Align = alClient
    TabOrder = 3
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object GridTableView: TcxGridTableView
      FilterBox.CustomizeDialog = False
      FilterBox.Visible = fvNever
      OnFocusedRecordChanged = GridTableViewFocusedRecordChanged
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      Styles.OnGetContentStyle = GridTableViewStylesGetContentStyle
      object GridTableViewCloseDate: TcxGridColumn
        Caption = #47560#44048#51068#51088
        DataBinding.FieldName = 'YMD_CLOSE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 110
      end
      object GridTableViewPosNo: TcxGridColumn
        Caption = 'POS'
        DataBinding.FieldName = 'NO_POS'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Grouping = False
        Options.Moving = False
        Width = 60
      end
      object GridTableViewStatus: TcxGridColumn
        Caption = #49345#53468
        DataBinding.FieldName = 'DS_STATUS'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 70
      end
      object GridTableViewReserveAmt: TcxGridColumn
        Caption = #51456#48708#44552
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_READY'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Options.Grouping = False
        Options.Moving = False
        Width = 90
      end
      object GridTableViewDepositAmt: TcxGridColumn
        Caption = #51473#44036#52636#44552
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_MID'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Options.Grouping = False
        Options.Moving = False
        Width = 100
      end
      object GridTableViewCashAmt: TcxGridColumn
        Caption = #54788#44552#54032#47588
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASH'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Options.Grouping = False
        Options.Moving = False
        Width = 100
      end
      object GridTableViewOverShortAmt: TcxGridColumn
        Caption = #44284#48512#51313
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_LACK'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Options.Grouping = False
        Options.Moving = False
        Width = 70
      end
      object GridTableViewSaleAmt: TcxGridColumn
        Caption = #47588#52636#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Options.Grouping = False
        Options.Moving = False
        Width = 100
      end
      object GridTableViewVoidAmt: TcxGridColumn
        Caption = #47588#52636#52712#49548
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_VOID'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Options.Grouping = False
        Options.Moving = False
        Width = 80
      end
      object GridTableViewReturnAmt: TcxGridColumn
        Caption = #48152#54408#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_BANPUM'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Options.Grouping = False
        Options.Moving = False
        Width = 80
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
