inherited StoreHolidayForm: TStoreHolidayForm
  Caption = #44277#55092#51068#44288#47532
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    inherited ButtonToolBar: TAdvToolBar
      inherited ButtonToolBarDeleteButton: TAdvGlowButton
        Enabled = False
      end
    end
    inherited ConditionToolBar: TAdvToolBar
      Width = 624
      ExplicitWidth = 624
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        Left = 116
        ExplicitLeft = 116
      end
      inherited ConditionToolBarDateLabel: TcxLabel
        Caption = #45380#46020
        Visible = True
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarToDateEdit: TcxDateEdit
        Left = 224
        ExplicitLeft = 224
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        Left = 206
        ExplicitLeft = 206
        AnchorX = 215
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        Left = 314
        ExplicitLeft = 314
        AnchorX = 347
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Left = 379
        ExplicitLeft = 379
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 500
        ExplicitLeft = 500
      end
      object ConditionToolBarYearEdit: TcxMaskEdit
        Left = 67
        Top = 2
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.EditMask = '0000;1;_'
        Properties.MaxLength = 0
        Style.StyleController = EditStyleController
        TabOrder = 7
        Text = '    '
        Width = 49
      end
    end
  end
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 25
  end
  object Grid: TcxGrid [2]
    Left = 0
    Top = 65
    Width = 948
    Height = 516
    Align = alClient
    TabOrder = 3
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object GridTableView: TcxGridTableView
      Tag = 99
      Navigator.Buttons.CustomButtons = <>
      OnFocusedRecordChanged = GridTableViewFocusedRecordChanged
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0 '#51068
          Kind = skCount
          Column = GridTableViewHoliday
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.OnAfterPost = GridTableViewDataControllerAfterPost
      DataController.OnBeforePost = GridTableViewDataControllerBeforePost
      NewItemRow.Visible = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object GridTableViewHoliday: TcxGridColumn
        Caption = #44277#55092#51068
        DataBinding.FieldName = 'HOLIDAY'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.HideSelection = False
        Properties.EditMask = '!90-90;1;_'
        Properties.OnEditValueChanged = GridTableViewHolidayPropertiesEditValueChanged
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 119
      end
      object GridTableViewRemark: TcxGridColumn
        Caption = #55092#51068#47749
        DataBinding.FieldName = 'REMARK'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 161
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
