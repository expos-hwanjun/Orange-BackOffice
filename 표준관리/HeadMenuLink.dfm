inherited HeadMenuLinkForm: THeadMenuLinkForm
  Caption = #54364#51456'-'#47588#51109#47700#45684' '#50672#44208
  ClientHeight = 808
  ClientWidth = 1071
  ExplicitWidth = 1087
  ExplicitHeight = 847
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 369
    Height = 743
    ExplicitLeft = 369
    ExplicitHeight = 743
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1071
    ExplicitWidth = 1071
    inherited ButtonToolBar: TAdvToolBar
      Left = 539
      ExplicitLeft = 539
      inherited ButtonToolBarDeleteButton: TAdvGlowButton
        Visible = False
      end
      inherited ButtonToolBarNewButton: TAdvGlowButton
        Caption = #52628#44032'(F3)'
        Enabled = False
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
        Caption = #44160#49353#50612
        Visible = True
        AnchorX = 298
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Properties.Alignment.Horz = taCenter
        Properties.Items.Strings = (
          #51204#52404
          #50672#44208' '#50504' '#46108' '#47700#45684)
        Text = #51204#52404
        Visible = True
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Visible = True
        ExplicitWidth = 200
        Width = 200
      end
    end
  end
  inherited GridPanel: TPanel
    Width = 369
    Height = 743
    ExplicitWidth = 369
    ExplicitHeight = 743
    inherited Grid: TcxGrid
      Width = 363
      Height = 737
      ExplicitWidth = 363
      ExplicitHeight = 737
      inherited GridTableView: TcxGridTableView
        object GridTableViewMenuCode: TcxGridColumn
          Caption = #47700#45684#53076#46300
          DataBinding.FieldName = 'CD_MENU'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 81
        end
        object GridTableViewMenuName: TcxGridColumn
          Caption = #47700#45684#47749
          DataBinding.FieldName = 'NM_MENU'
          HeaderAlignmentHorz = taCenter
          Width = 158
        end
        object GridTableViewSalePrice: TcxGridColumn
          Caption = #54032#47588#45800#44032
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'PR_SALE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Width = 102
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 375
    Width = 696
    Height = 743
    ExplicitLeft = 375
    ExplicitWidth = 696
    ExplicitHeight = 743
    object Grid1: TcxGrid
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 690
      Height = 737
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object GridTableView1: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        FilterBox.CustomizeDialog = False
        FilterBox.Visible = fvNever
        ScrollbarAnnotations.CustomAnnotations = <>
        OnCanFocusRecord = GridTableView1CanFocusRecord
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            Column = GridTableView1StoreName
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsData.Deleting = False
        OptionsData.Inserting = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.OnGetContentStyle = GridTableView1StylesGetContentStyle
        object GridTableView1StoreCode: TcxGridColumn
          Caption = #47588#51109#53076#46300
          DataBinding.FieldName = 'CD_STORE'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Options.Focusing = False
          Styles.Content = StyleFontBlackBold
          Width = 102
        end
        object GridTableView1StoreName: TcxGridColumn
          Caption = #47588#51109#47749
          DataBinding.FieldName = 'NM_STORE'
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Options.Focusing = False
          Styles.Content = StyleFontBlackBold
          Width = 186
        end
        object GridTableView1MenuCode: TcxGridColumn
          Caption = #47700#45684#53076#46300
          DataBinding.FieldName = 'CD_MENU'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = GridTableView1MenuCodePropertiesButtonClick
          Properties.OnValidate = GridTableView1MenuCodePropertiesValidate
          HeaderAlignmentHorz = taCenter
          Width = 99
        end
        object GridTableView1MenuName: TcxGridColumn
          Caption = #47700#45684#47749
          DataBinding.FieldName = 'NM_MENU'
          HeaderAlignmentHorz = taCenter
          Options.Focusing = False
          Width = 136
        end
        object GridTableView1SalePrice: TcxGridColumn
          Caption = #54032#47588#45800#44032
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'PR_SALE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',#'
          HeaderAlignmentHorz = taCenter
          Options.Focusing = False
          Width = 102
        end
        object GridTableView1OrgMenuCode: TcxGridColumn
          Tag = 99
          Caption = #50896#47700#45684#53076#46300
          DataBinding.FieldName = 'CD_MENU_ORG'
          Visible = False
        end
        object GridTableView1RowState: TcxGridColumn
          Tag = 99
          DataBinding.FieldName = 'ROW_STATE'
          Visible = False
        end
      end
      object cxGridLevel1: TcxGridLevel
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
