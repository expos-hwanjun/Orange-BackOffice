inherited CloseAspOrderForm: TCloseAspOrderForm
  Caption = 'ASP'#44592#51456#48156#51452#46321#47197
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    inherited ButtonToolBar: TAdvToolBar
      inherited ButtonToolBarDeleteButton: TAdvGlowButton
        Visible = False
      end
    end
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
    Width = 942
    Height = 510
    Align = alClient
    TabOrder = 3
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object GridTableView: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'#44148
          Kind = skCount
          Column = GridTableViewGoodsCode
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.OnGetContentStyle = GridTableViewStylesGetContentStyle
      object GridTableViewClassName: TcxGridColumn
        Caption = #48516#47448
        DataBinding.FieldName = 'NM_CLASS'
        HeaderAlignmentHorz = taCenter
        Width = 218
      end
      object GridTableViewGoodsCode: TcxGridColumn
        Tag = 98
        Caption = #49345#54408#53076#46300
        DataBinding.FieldName = 'CD_GOODS'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ClickKey = 112
        Properties.ImeMode = imSHanguel
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 110
      end
      object GridTableViewGoodsName: TcxGridColumn
        Tag = 98
        Caption = #49345#54408#51060#47492
        DataBinding.FieldName = 'NM_GOODS'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 284
      end
      object GridTableViewSpec: TcxGridColumn
        Caption = #45800#50948'/'#44508#44201
        DataBinding.FieldName = 'NM_UNIT'
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Width = 141
      end
      object GridTableViewOrderPrice: TcxGridColumn
        Caption = #48156#51452#45800#44032
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'PR_ORDER'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.##'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 83
      end
      object GridTableViewOrderQty: TcxGridColumn
        Tag = 98
        Caption = #48156#51452#49688#47049
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'QTY_ORDER'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.##'
        Properties.EditFormat = ',0.##'
        Properties.Nullstring = '('#48120#46321#47197')'
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = EditPropertiesChange
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 93
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
