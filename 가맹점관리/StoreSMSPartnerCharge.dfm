inherited StoreSMSChargeForm: TStoreSMSChargeForm
  Caption = #47928#51088#52649#51204
  ClientHeight = 643
  ClientWidth = 976
  ExplicitWidth = 992
  ExplicitHeight = 682
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 976
    ExplicitWidth = 976
    inherited ConditionToolBar: TAdvToolBar
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        Visible = True
      end
      inherited ConditionToolBarDateLabel: TcxLabel
        Caption = #52649#51204#51068#51088
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
    end
  end
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 25
  end
  object Grid: TcxGrid [2]
    AlignWithMargins = True
    Left = 3
    Top = 68
    Width = 970
    Height = 572
    Align = alClient
    TabOrder = 3
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object GridTableView: TcxGridTableView
      Tag = 99
      Navigator.Buttons.CustomButtons = <>
      FilterBox.Visible = fvNever
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'#44148
          Kind = skCount
          Column = GridTableViewCustomerCode
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.OnAfterPost = GridTableViewDataControllerAfterPost
      DataController.OnBeforePost = GridTableViewDataControllerBeforePost
      DataController.OnDataChanged = GridTableViewDataControllerDataChanged
      NewItemRow.Visible = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      object GridTableViewCustomerCode: TcxGridColumn
        Caption = #47588#51109#53076#46300
        DataBinding.FieldName = 'CD_CUSTOMER'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ImeMode = imSHanguel
        Properties.OnButtonClick = GridTableViewGoodsCodePropertiesButtonClick
        Properties.OnValidate = GridTableViewCustomerCodePropertiesValidate
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 110
      end
      object GridTableViewCustomerName: TcxGridColumn
        Caption = #47588#51109#51060#47492
        DataBinding.FieldName = 'NM_CUSTOMER'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 200
      end
      object GridTableViewProgram: TcxGridColumn
        Caption = #49556#47336#49496
        DataBinding.FieldName = 'DS_PROGRAM'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Width = 79
      end
      object GridTableViewChargeType: TcxGridColumn
        Caption = #52649#51204#50976#54805
        DataBinding.FieldName = 'DC_CHARGE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
      end
      object GridTableViewReceiveAmt: TcxGridColumn
        Caption = #51077#44552#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_RECEIVE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 78
      end
      object GridTableViewChargeAmt: TcxGridColumn
        Caption = #52649#51204#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CHARGE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.MinValue = True
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.##'
        Properties.EditFormat = ',0.##'
        Properties.UseLeftAlignmentOnEditing = False
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Styles.Content = StyleFocused
        Width = 89
      end
      object GridTableViewDcRate: TcxGridColumn
        Caption = #54624#51064#50984
        DataBinding.FieldName = 'DC_RATE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '0.00%'
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Width = 75
      end
      object GridTableViewRemark: TcxGridColumn
        Caption = #48708#44256
        DataBinding.FieldName = 'REMARK'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ImeMode = imSHanguel
        Properties.MaxLength = 100
        HeaderAlignmentHorz = taCenter
        Width = 250
      end
      object GridTableViewRowState: TcxGridColumn
        Tag = 99
        DataBinding.FieldName = 'ROW_STATE'
        Visible = False
        Options.Focusing = False
      end
      object GridTableViewUser: TcxGridColumn
        Caption = #51089#50629#51088
        DataBinding.FieldName = 'USER_ID'
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Width = 91
      end
      object GridTableViewInsertDate: TcxGridColumn
        Caption = #46321#47197#51068#49884
        DataBinding.FieldName = 'DT_INSERT'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Width = 90
      end
      object GridTableViewUpdateDate: TcxGridColumn
        Caption = #48320#44221#51068#49884
        DataBinding.FieldName = 'DT_CHANGE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Width = 82
      end
      object GridTableViewSeq: TcxGridColumn
        Tag = 99
        Caption = 'No'
        DataBinding.ValueType = 'Integer'
        DataBinding.FieldName = 'SEQ'
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
  inherited Exec_Timer: TTimer
    OnTimer = Exec_TimerTimer
  end
end
