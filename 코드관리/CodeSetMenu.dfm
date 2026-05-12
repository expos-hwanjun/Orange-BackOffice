inherited CodeSetMenuForm: TCodeSetMenuForm
  Caption = #49464#53944'/'#50724#54536#49464#53944'/'#44536#47353' '#47700#45684#44288#47532
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 307
    ExplicitLeft = 282
    ExplicitTop = 71
    ExplicitHeight = 514
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    inherited ConditionToolBar: TAdvToolBar
      Width = 549
      ExplicitWidth = 549
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
        AnchorX = 298
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Properties.Items.Strings = (
          #49464#53944
          #50724#54536#49464#53944
          #50500#50500#53596)
        Properties.OnChange = ConditionToolBarComboBoxPropertiesChange
        Text = #49464#53944
        Visible = True
        ExplicitWidth = 95
        Width = 95
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 425
        ExplicitLeft = 425
      end
    end
  end
  inherited GridPanel: TPanel
    Width = 307
    ExplicitWidth = 307
    inherited Grid: TcxGrid
      Width = 301
      ExplicitWidth = 301
      inherited GridTableView: TcxGridTableView
        Tag = 99
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0 '#44148
            Kind = skCount
            Column = GridTableViewMenuName
          end>
        OptionsView.Footer = True
        object GridTableViewMenuCode: TcxGridColumn
          Tag = 98
          Caption = #47700#45684#53076#46300
          DataBinding.FieldName = 'CD_MENU'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 89
        end
        object GridTableViewMenuName: TcxGridColumn
          Tag = 98
          Caption = #47700#45684#47749
          DataBinding.FieldName = 'NM_MENU'
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 189
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 313
    Width = 633
    ExplicitLeft = 313
    ExplicitWidth = 633
    object Grid1: TcxGrid
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 627
      Height = 508
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object GridTableView1: TcxGridTableView
        Tag = 99
        Navigator.Buttons.CustomButtons = <>
        FilterBox.CustomizeDialog = False
        FilterBox.Visible = fvNever
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0 '#44148
            Kind = skCount
            Column = GridTableView1MenuName
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsData.Deleting = False
        OptionsData.Inserting = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.ContentEven = StyleEven
        object GridTableView1MenuCode: TcxGridColumn
          Tag = 98
          Caption = #47700#45684#53076#46300
          DataBinding.FieldName = 'CD_MENU'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Focusing = False
          Width = 99
        end
        object GridTableView1MenuName: TcxGridColumn
          Tag = 98
          Caption = #47700#45684#47749
          DataBinding.FieldName = 'NM_MENU'
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Focusing = False
          Width = 223
        end
        object GridTableView1SalePrice: TcxGridColumn
          Tag = 98
          Caption = #54032#47588#45800#44032
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'PR_SALE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Focusing = False
          Width = 111
        end
        object GridTableView1Qty: TcxGridColumn
          Tag = 98
          Caption = #49688#47049
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'QTY_SET'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DisplayFormat = '#0'
          Properties.OnChange = EditPropertiesChange
          HeaderAlignmentHorz = taCenter
        end
        object GridTableView1Seq: TcxGridColumn
          Tag = 98
          Caption = #49692#48264
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'SEQ'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DisplayFormat = '#0'
          Properties.OnChange = EditPropertiesChange
          HeaderAlignmentHorz = taCenter
        end
        object GridTableView1Color: TcxGridColumn
          Caption = #48260#53948#49353#49345
          DataBinding.FieldName = 'COLOR'
          PropertiesClassName = 'TdxColorEditProperties'
          Properties.OnChange = EditPropertiesChange
          HeaderAlignmentHorz = taCenter
          Width = 70
        end
      end
      object GridLevel1: TcxGridLevel
        GridView = GridTableView1
      end
    end
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
