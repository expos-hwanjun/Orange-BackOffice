inherited HeadStoreMenuForm: THeadStoreMenuForm
  Caption = #47588#51109#48324' '#47700#45684#47532#49828#53944
  ClientHeight = 682
  ClientWidth = 1107
  ExplicitWidth = 1123
  ExplicitHeight = 721
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 292
    Height = 617
    ExplicitLeft = 292
    ExplicitHeight = 617
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1107
    ExplicitWidth = 1107
    inherited ButtonToolBar: TAdvToolBar
      Left = 575
      ExplicitLeft = 575
      inherited ButtonToolBarSeparator: TAdvToolBarSeparator
        Height = 27
        ExplicitHeight = 27
      end
      inherited ButtonToolBarSaveButton: TAdvGlowButton
        Visible = False
      end
      inherited ButtonToolBarDeleteButton: TAdvGlowButton
        Visible = False
      end
      inherited ButtonToolBarNewButton: TAdvGlowButton
        Visible = False
      end
      inherited ButtonToolBarCancelButton: TAdvGlowButton
        Visible = False
      end
    end
    inherited ConditionToolBar: TAdvToolBar
      Width = 655
      ExplicitWidth = 655
      inherited ConditionToolBarDateLabel: TcxLabel
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        AnchorX = 166
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        Caption = #47700#45684#47749
        Visible = True
        AnchorX = 298
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Left = 530
        ExplicitLeft = 530
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 330
        Visible = True
        ExplicitLeft = 330
        ExplicitWidth = 200
        Width = 200
      end
    end
  end
  inherited GridPanel: TPanel
    Width = 292
    Height = 617
    ExplicitWidth = 292
    ExplicitHeight = 617
    inherited Grid: TcxGrid
      Width = 286
      Height = 611
      ExplicitWidth = 286
      ExplicitHeight = 611
      inherited GridTableView: TcxGridTableView
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0'
            Kind = skCount
            Column = GridTableViewStoreName
          end>
        OptionsView.Footer = True
        object GridTableViewStoreCode: TcxGridColumn
          Caption = #47588#51109#53076#46300
          DataBinding.FieldName = 'CD_STORE'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 88
        end
        object GridTableViewStoreName: TcxGridColumn
          Caption = #47588#51109#47749
          DataBinding.FieldName = 'NM_STORE'
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 175
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 298
    Width = 809
    Height = 617
    ExplicitLeft = 298
    ExplicitWidth = 809
    ExplicitHeight = 617
    object Grid1: TcxGrid
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 803
      Height = 611
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
            Format = ',0'
            Kind = skCount
            Column = GridTableView1Column1
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.ContentEven = StyleEven
        Styles.OnGetContentStyle = GridTableView1StylesGetContentStyle
        object cxGridColumn2: TcxGridColumn
          Caption = #47700#45684#53076#46300
          DataBinding.FieldName = 'CD_MENU'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 124
        end
        object GridTableView1Column1: TcxGridColumn
          Caption = #47700#45684#47749
          DataBinding.FieldName = 'NM_MENU'
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 197
        end
        object GridTableView1Column2: TcxGridColumn
          Caption = #54032#47588#45800#44032
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'PR_SALE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Width = 112
        end
        object GridTableView1Type: TcxGridColumn
          Caption = #44396#48516
          DataBinding.FieldName = 'DS_TYPE'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 75
        end
        object GridTableView1Column5: TcxGridColumn
          Caption = #46321#47197#51068#49884
          DataBinding.FieldName = 'DT_INSERT'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 113
        end
      end
      object GridLevel1: TcxGridLevel
        GridView = GridTableView1
      end
    end
  end
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 21
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
