inherited CodeBaeminMenuLinkForm: TCodeBaeminMenuLinkForm
  Caption = #48176#45804#47700#45684' '#50672#44208
  ClientWidth = 1052
  ExplicitWidth = 1068
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 578
    ExplicitLeft = 578
    ExplicitTop = 65
    ExplicitHeight = 514
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1052
    ExplicitWidth = 1052
    inherited ButtonToolBar: TAdvToolBar
      inherited ButtonToolBarNewButton: TAdvGlowButton
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
        Visible = True
        AnchorX = 298
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Properties.Items.Strings = (
          #50672#44208#50504' '#46108' '#47700#45684
          #51204#52404
          #50672#44208' '#46108' '#47700#45684)
        Text = #50672#44208#50504' '#46108' '#47700#45684
        Visible = True
      end
    end
  end
  inherited GridPanel: TPanel
    Width = 578
    ExplicitWidth = 578
    inherited Grid: TcxGrid
      Width = 572
      ExplicitWidth = 572
      inherited GridTableView: TcxGridTableView
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0 '#44060
            Kind = skCount
            Column = GridTableViewBaeminMenu
          end>
        OptionsData.DeletingConfirmation = False
        OptionsSelection.MultiSelect = True
        OptionsView.Footer = True
        object GridTableViewBaeminMenu: TcxGridColumn
          Caption = #48176#45804' '#47700#45684#47749
          DataBinding.FieldName = 'NM_BAEMIN'
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 233
        end
        object GridTableViewMenuName: TcxGridColumn
          Caption = #47588#51109#47700#45684#47749
          DataBinding.FieldName = 'NM_MENU'
          HeaderAlignmentHorz = taCenter
          Width = 209
        end
        object GridTableViewMenuCode: TcxGridColumn
          Caption = #47700#45684#53076#46300
          DataBinding.FieldName = 'CD_MENU'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 107
        end
        object GridTableViewOrgMenuCode: TcxGridColumn
          Tag = 99
          DataBinding.FieldName = 'CD_MENU_ORG'
          Visible = False
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 584
    Width = 468
    ExplicitLeft = 584
    ExplicitWidth = 468
    object DCTimeLabel: TLabel
      Left = -1
      Top = 17
      Width = 65
      Height = 17
      Caption = #48176#45804#47700#45684#47749
      Transparent = True
    end
    object Label1: TLabel
      Left = 12
      Top = 50
      Width = 52
      Height = 17
      Caption = #47588#51109#47700#45684
      Transparent = True
    end
    object BaeminMenueEdit: TcxTextEdit
      Left = 70
      Top = 13
      ParentFont = False
      Properties.ImeMode = imSHanguel
      Properties.MaxLength = 50
      Style.StyleController = EditStyleController
      TabOrder = 0
      Width = 371
    end
    object MenuCodeEdit: TcxButtonEdit
      Left = 70
      Top = 47
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ClickKey = 112
      Properties.ImeMode = imSHanguel
      Properties.OnButtonClick = MenuCodeEditPropertiesButtonClick
      Properties.OnChange = MenuCodeEditPropertiesChange
      Properties.OnValidate = MenuCodeEditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 1
      Width = 88
    end
    object MenuNameEdit: TcxTextEdit
      Left = 70
      Top = 78
      TabStop = False
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = 14737632
      Style.StyleController = EditStyleController
      TabOrder = 2
      Width = 371
    end
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
