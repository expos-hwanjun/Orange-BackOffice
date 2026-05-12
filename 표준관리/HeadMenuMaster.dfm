inherited HeadMenuMasterForm: THeadMenuMasterForm
  Caption = #54364#51456#47700#45684#44288#47532
  ClientHeight = 840
  ClientWidth = 1083
  ExplicitWidth = 1099
  ExplicitHeight = 879
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Top = 83
    Height = 636
    ExplicitTop = 83
    ExplicitHeight = 633
  end
  object AdvSplitter1: TAdvSplitter [1]
    Left = 0
    Top = 719
    Width = 1083
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    MinSize = 50
    Appearance.BorderColor = clNone
    Appearance.BorderColorHot = clNone
    Appearance.Color = 14542308
    Appearance.ColorTo = 16768709
    Appearance.ColorHot = 15383705
    Appearance.ColorHotTo = 14922381
    GripStyle = sgFlatDots
    ExplicitLeft = -1
    ExplicitTop = 725
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1083
    ExplicitWidth = 1083
    inherited ButtonToolBar: TAdvToolBar
      Left = 412
      ExplicitLeft = 412
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
        Caption = #44160#49353#50612
        Visible = True
        AnchorX = 298
        AnchorY = 16
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Visible = True
      end
    end
  end
  inherited GridPanel: TPanel
    Top = 83
    Height = 636
    ExplicitTop = 83
    ExplicitHeight = 636
    inherited Grid: TcxGrid
      Height = 630
      ExplicitHeight = 630
      inherited GridTableView: TcxGridTableView
        Tag = 99
        OnCustomDrawCell = nil
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0 '#44148
            Kind = skCount
            Column = GridTableViewMenuName
          end>
        OptionsSelection.MultiSelect = True
        OptionsView.Footer = True
        Styles.OnGetContentStyle = GridTableViewStylesGetContentStyle
        object GridTableViewMenuCode: TcxGridColumn
          Tag = 98
          Caption = #47700#45684#53076#46300
          DataBinding.FieldName = 'CD_MENU'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 85
        end
        object GridTableViewMenuName: TcxGridColumn
          Tag = 98
          Caption = #47700#45684#51060#47492
          DataBinding.FieldName = 'NM_MENU'
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 182
        end
        object GridTableViewStatus: TcxGridColumn
          Tag = 99
          Caption = #49345#53468
          DataBinding.FieldName = 'YN_USE'
          Visible = False
        end
        object GridTableViewInsertDate: TcxGridColumn
          Caption = #46321#47197#51068#49884
          DataBinding.ValueType = 'DateTime'
          DataBinding.FieldName = 'DT_INSERT'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 105
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Top = 83
    Width = 827
    Height = 636
    ExplicitTop = 83
    ExplicitWidth = 827
    ExplicitHeight = 636
    object MenuPager: TAdvOfficePager
      Left = 0
      Top = 0
      Width = 827
      Height = 636
      AdvOfficePagerStyler = AdvOfficePagerOfficeStyler
      Align = alClient
      ActivePage = AdvOfficePager11
      ButtonSettings.CloseButtonPicture.Data = {
        424DA20400000000000036040000280000000900000009000000010008000000
        00006C000000C30E0000C30E00000001000000010000427B8400DEEFEF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0001000001010100000100
        0000000202000100020200000000000202020002020200000000010002020202
        0200010000000101000202020001010000000100020202020200010000000002
        0202000202020000000000020200010002020000000001000001010100000100
        0000}
      ButtonSettings.PageListButtonPicture.Data = {
        424DA20400000000000036040000280000000900000009000000010008000000
        00006C000000C30E0000C30E00000001000000010000427B8400DEEFEF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0001010101000101010100
        0000010101000200010101000000010100020202000101000000010002020202
        0200010000000002020200020202000000000002020001000202000000000100
        0001010100000100000001010101010101010100000001010101010101010100
        0000}
      ButtonSettings.ScrollButtonPrevPicture.Data = {
        424DA20400000000000036040000280000000900000009000000010008000000
        00006C000000C30E0000C30E00000001000000010000427B8400DEEFEF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0001010101000001010100
        0000010101000202000101000000010100020202000101000000010002020200
        0101010000000002020200010101010000000100020202000101010000000101
        0002020200010100000001010100020200010100000001010101000001010100
        0000}
      ButtonSettings.ScrollButtonNextPicture.Data = {
        424DA20400000000000036040000280000000900000009000000010008000000
        00006C000000C30E0000C30E00000001000000010000427B8400DEEFEF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0001010000010101010100
        0000010002020001010101000000010002020200010101000000010100020202
        0001010000000101010002020200010000000101000202020001010000000100
        0202020001010100000001000202000101010100000001010000010101010100
        0000}
      ButtonSettings.ScrollButtonFirstPicture.Data = {
        424DC60400000000000036040000280000001000000009000000010008000000
        000000000000C40E0000C40E00000001000000010000427B84FFDEEFEFFFFFFF
        FFFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF01010101010000010101
        0101000001010101010100020200010101000202000101010100020202000101
        0002020200010101000202020001010002020200010101000202020001010002
        0202000101010101000202020001010002020200010101010100020202000101
        0002020200010101010100020200010101000202000101010101010000010101
        010100000101}
      ButtonSettings.ScrollButtonLastPicture.Data = {
        424DC60400000000000036040000280000001000000009000000010008000000
        000000000000C40E0000C40E00000001000000010000427B84FFDEEFEFFFFFFF
        FFFF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF01010000010101010100
        0001010101010100020200010101000202000101010101000202020001010002
        0202000101010101000202020001010002020200010101010100020202000101
        0002020200010101000202020001010002020200010101000202020001010002
        0202000101010100020200010101000202000101010101010000010101010100
        000101010101}
      ButtonSettings.ClosedListButtonPicture.Data = {
        424DA20400000000000036040000280000000900000009000000010008000000
        00006C000000C30E0000C30E00000001000000010000427B8400DEEFEF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0001010101000101010100
        0000010101000200010101000000010100020202000101000000010002020202
        0200010000000002020200020202000000000002020001000202000000000100
        0001010100000100000001010101010101010100000001010101010101010100
        0000}
      ButtonSettings.CloseButtonHint = 'Close'
      ButtonSettings.InsertButtonHint = 'Insert new page'
      ButtonSettings.PageListButtonHint = 'Page List'
      ButtonSettings.ScrollButtonNextHint = 'Next'
      ButtonSettings.ScrollButtonPrevHint = 'Previous'
      ButtonSettings.ScrollButtonFirstHint = 'First'
      ButtonSettings.ScrollButtonLastHint = 'Last'
      ButtonSettings.ClosedListButtonHint = 'Closed Pages'
      DoubleBuffered = True
      TabSettings.StartMargin = 0
      TabSettings.Height = 25
      Text = ''
      ShowShortCutHints = False
      TabOrder = 0
      NextPictureChanged = False
      PrevPictureChanged = False
      object AdvOfficePager11: TAdvOfficePage
        Left = 1
        Top = 25
        Width = 825
        Height = 609
        Caption = ' '#51068'      '#48152
        DoubleBuffered = True
        PageAppearance.BorderColor = clNone
        PageAppearance.Color = 16768709
        PageAppearance.ColorTo = 16768709
        PageAppearance.ColorMirror = 16768709
        PageAppearance.ColorMirrorTo = 16768709
        PageAppearance.Gradient = ggVertical
        PageAppearance.GradientMirror = ggVertical
        Text = ''
        TabAppearance.BorderColor = clWhite
        TabAppearance.BorderColorHot = clNone
        TabAppearance.BorderColorSelected = clNone
        TabAppearance.BorderColorSelectedHot = clNone
        TabAppearance.BorderColorDisabled = clNone
        TabAppearance.BorderColorDown = clNone
        TabAppearance.Color = clWhite
        TabAppearance.ColorTo = clWhite
        TabAppearance.ColorSelected = clWhite
        TabAppearance.ColorSelectedTo = clWhite
        TabAppearance.ColorDisabled = 15658734
        TabAppearance.ColorDisabledTo = clNone
        TabAppearance.ColorHot = 16316922
        TabAppearance.ColorHotTo = 16316922
        TabAppearance.ColorMirror = clWhite
        TabAppearance.ColorMirrorTo = clWhite
        TabAppearance.ColorMirrorHot = 16316922
        TabAppearance.ColorMirrorHotTo = 16316922
        TabAppearance.ColorMirrorSelected = clWhite
        TabAppearance.ColorMirrorSelectedTo = clWhite
        TabAppearance.ColorMirrorDisabled = 15658734
        TabAppearance.ColorMirrorDisabledTo = clNone
        TabAppearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Font.Color = clWindowText
        TabAppearance.Font.Height = -11
        TabAppearance.Font.Name = 'Tahoma'
        TabAppearance.Font.Style = []
        TabAppearance.Gradient = ggVertical
        TabAppearance.GradientMirror = ggVertical
        TabAppearance.GradientHot = ggVertical
        TabAppearance.GradientMirrorHot = ggVertical
        TabAppearance.GradientSelected = ggVertical
        TabAppearance.GradientMirrorSelected = ggVertical
        TabAppearance.GradientDisabled = ggVertical
        TabAppearance.GradientMirrorDisabled = ggVertical
        TabAppearance.TextColor = 4474440
        TabAppearance.TextColorHot = 14916384
        TabAppearance.TextColorSelected = 4474440
        TabAppearance.TextColorDisabled = 7303023
        TabAppearance.ShadowColor = clNone
        TabAppearance.HighLightColor = clNone
        TabAppearance.HighLightColorHot = clNone
        TabAppearance.HighLightColorSelected = clNone
        TabAppearance.HighLightColorSelectedHot = clNone
        TabAppearance.HighLightColorDown = clNone
        TabAppearance.DrawLine = False
        TabAppearance.TextSelectedBold = True
        TabAppearance.BackGround.Color = 16773350
        TabAppearance.BackGround.ColorTo = 16773350
        TabAppearance.BackGround.Direction = gdHorizontal
        object MenuClassTreeView: TcxTreeView
          Left = 100
          Top = 132
          Width = 250
          Height = 340
          ParentFont = False
          Style.StyleController = EditStyleController
          TabOrder = 1
          Visible = False
          OnDblClick = MenuClassTreeViewDblClick
          OnExit = MenuClassTreeViewExit
          OnKeyDown = MenuClassTreeViewKeyDown
          MultiSelectStyle = []
          ReadOnly = True
          RightClickSelect = True
          OnExpanding = MenuClassTreeViewExpanding
        end
        object RightPanel: TPanel
          Left = 427
          Top = 2
          Width = 396
          Height = 605
          Margins.Left = 20
          Margins.Right = 30
          Align = alClient
          BevelOuter = bvNone
          Color = 16768709
          ParentBackground = False
          TabOrder = 0
          object MemberGroupBox: TAdvGroupBox
            Left = 9
            Top = 3
            Width = 284
            Height = 232
            Margins.Left = 20
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = clWindowText
            CaptionFont.Height = -11
            CaptionFont.Name = 'Tahoma'
            CaptionFont.Style = []
            Transparent = False
            RoundEdges = True
            Caption = ' '#54924#50896#46321#44553#48324' '#54624#51064'/'#54252#51064#53944' '
            ParentCtl3D = True
            TabOrder = 0
            object Grid1: TcxGrid
              Left = 11
              Top = 27
              Width = 262
              Height = 190
              TabOrder = 0
              LookAndFeel.Kind = lfOffice11
              object GridTableView1: TcxGridTableView
                Tag = 99
                Navigator.Buttons.CustomButtons = <>
                ScrollbarAnnotations.CustomAnnotations = <>
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsView.GroupByBox = False
                object GridTableView1Column1: TcxGridColumn
                  Caption = #54924#50896#44396#48516
                  DataBinding.FieldName = 'NM_CODE1'
                  HeaderAlignmentHorz = taCenter
                  Options.Editing = False
                  Options.Filtering = False
                  Options.Focusing = False
                  Options.Moving = False
                  Width = 130
                end
                object GridTableView1DcRate: TcxGridColumn
                  Caption = #54624#51064#50984
                  DataBinding.ValueType = 'Currency'
                  DataBinding.FieldName = 'DC_RATE'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Properties.Alignment.Horz = taRightJustify
                  Properties.DisplayFormat = '#0.0'
                  Properties.OnEditValueChanged = GridTableView1DcRatePropertiesEditValueChanged
                  HeaderAlignmentHorz = taCenter
                  Options.Filtering = False
                  Options.Moving = False
                  Width = 62
                end
                object GridTableView1PointRate: TcxGridColumn
                  Caption = #51201#47549#50984
                  DataBinding.ValueType = 'Currency'
                  DataBinding.FieldName = 'POINT_RATE'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Properties.Alignment.Horz = taRightJustify
                  Properties.DisplayFormat = '#0.0'
                  Properties.OnEditValueChanged = GridTableView1PointRatePropertiesEditValueChanged
                  HeaderAlignmentHorz = taCenter
                  Options.Filtering = False
                  Options.Moving = False
                  Width = 55
                end
                object GridTableView1Column4: TcxGridColumn
                  DataBinding.FieldName = 'CD_CODE'
                  Visible = False
                end
              end
              object GridLevel1: TcxGridLevel
                GridView = GridTableView1
              end
            end
          end
          object ItemGroupBox: TAdvGroupBox
            Left = 9
            Top = 238
            Width = 284
            Height = 163
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = clWindowText
            CaptionFont.Height = -11
            CaptionFont.Name = 'Tahoma'
            CaptionFont.Style = []
            Transparent = False
            Caption = ' '#50500#51060#53596' '
            ParentCtl3D = True
            TabOrder = 1
            DesignSize = (
              284
              163)
            object ItemCheckListBox: TcxCheckListBox
              Left = 11
              Top = 24
              Width = 262
              Height = 127
              Anchors = [akLeft, akTop, akRight, akBottom]
              DragMode = dmAutomatic
              EditValueFormat = cvfIndices
              ImeName = 'Microsoft Office IME 2007'
              Items = <>
              ParentFont = False
              Style.StyleController = EditStyleController
              TabOrder = 0
              OnEditValueChanged = EditPropertiesChange
            end
          end
          object StampGroupBox: TAdvGroupBox
            Left = 9
            Top = 407
            Width = 284
            Height = 71
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = clWindowText
            CaptionFont.Height = -11
            CaptionFont.Name = 'Tahoma'
            CaptionFont.Style = []
            Transparent = False
            Caption = ' '#49828#53596#54532' '
            ParentCtl3D = True
            TabOrder = 2
            DesignSize = (
              284
              71)
            object Label11: TLabel
              Left = 30
              Top = 32
              Width = 26
              Height = 17
              Caption = #51201#47549
              Transparent = True
            end
            object StampUseLabel: TLabel
              Left = 174
              Top = 33
              Width = 26
              Height = 17
              Anchors = [akRight]
              Caption = #49324#50857
              Transparent = True
            end
            object StampSaveEdit: TcxSpinEdit
              Left = 69
              Top = 29
              Hint = 'SAVE_STAMP'
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.AssignedValues.MinValue = True
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 0
              OnClick = GroupNoEditClick
              Width = 49
            end
            object StampUseEdit: TcxSpinEdit
              Left = 211
              Top = 29
              Hint = 'USE_STAMP'
              Anchors = [akRight]
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.AssignedValues.MinValue = True
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 1
              OnClick = GroupNoEditClick
              Width = 49
            end
          end
        end
        object Panel2: TPanel
          Left = 2
          Top = 2
          Width = 425
          Height = 605
          Align = alLeft
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 2
          object KitchenPanel: TPanel
            Left = 0
            Top = 395
            Width = 425
            Height = 165
            Align = alTop
            BevelOuter = bvNone
            BiDiMode = bdLeftToRight
            Color = 16768709
            ParentBiDiMode = False
            ParentBackground = False
            TabOrder = 2
            object Label13: TLabel
              Left = 294
              Top = 10
              Width = 26
              Height = 17
              Caption = #48195#51648
              Font.Charset = HANGEUL_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #47569#51008' '#44256#46357
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object KitchenGroupBox: TAdvGroupBox
              Left = 13
              Top = 2
              Width = 185
              Height = 127
              CaptionFont.Charset = DEFAULT_CHARSET
              CaptionFont.Color = clWindowText
              CaptionFont.Height = -11
              CaptionFont.Name = 'Tahoma'
              CaptionFont.Style = []
              Transparent = False
              Caption = ' '#51452#48169#52636#47141' '
              ParentCtl3D = True
              TabOrder = 0
              object KitchenCheckListBox: TcxCheckListBox
                Left = 13
                Top = 22
                Width = 161
                Height = 98
                Hint = 'CD_PRINTER'
                ImeName = 'Microsoft Office IME 2007'
                Items = <>
                ParentFont = False
                Style.StyleController = EditStyleController
                TabOrder = 0
                OnEditValueChanged = EditPropertiesChange
              end
            end
            object KitchenComboBox: TcxComboBox
              Left = 13
              Top = 138
              Hint = 'DS_KITCHEN'
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 2
              Width = 300
            end
            object Option13ComboBox: TcxComboBox
              Left = 326
              Top = 6
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 3
              Visible = False
              Width = 76
            end
            object MemoGroupBox: TAdvGroupBox
              Left = 209
              Top = 2
              Width = 211
              Height = 127
              CaptionFont.Charset = DEFAULT_CHARSET
              CaptionFont.Color = clWindowText
              CaptionFont.Height = -11
              CaptionFont.Name = 'Tahoma'
              CaptionFont.Style = []
              Transparent = False
              Caption = ' '#51452#48169#47700#47784' '
              ParentCtl3D = True
              TabOrder = 1
              DesignSize = (
                211
                127)
              object MemoCheckListBox: TcxCheckListBox
                Left = 13
                Top = 22
                Width = 185
                Height = 98
                Anchors = [akLeft, akTop, akBottom]
                ImeName = 'Microsoft Office IME 2007'
                Items = <>
                ParentFont = False
                Style.StyleController = EditStyleController
                TabOrder = 0
                OnEditValueChanged = EditPropertiesChange
              end
            end
          end
          object TopPanel: TPanel
            Left = 0
            Top = 0
            Width = 425
            Height = 120
            Align = alTop
            BevelOuter = bvNone
            Color = 16768709
            ParentBackground = False
            TabOrder = 0
            object MenuCodeLabel: TLabel
              Left = 13
              Top = 8
              Width = 52
              Height = 17
              Caption = #47700#45684#53076#46300
              Font.Charset = HANGEUL_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #47569#51008' '#44256#46357
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object MenuNameLabel: TLabel
              Left = 13
              Top = 38
              Width = 52
              Height = 17
              Caption = #47700#45684#51060#47492
              Font.Charset = HANGEUL_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #47569#51008' '#44256#46357
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object MenuShortNameLabel: TLabel
              Left = 13
              Top = 69
              Width = 52
              Height = 17
              Caption = #45800#52629#51060#47492
              Font.Charset = HANGEUL_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #47569#51008' '#44256#46357
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object MenuClassLabel: TLabel
              Left = 13
              Top = 98
              Width = 52
              Height = 17
              Caption = #47700#45684#48516#47448
              Transparent = True
            end
            object MenuNameEdit: TcxTextEdit
              Left = 73
              Top = 35
              ParentFont = False
              Properties.ImeMode = imSHanguel
              Properties.MaxLength = 150
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 3
              OnExit = MenuNameEditExit
              Width = 345
            end
            object MenuShortNameEdit: TcxTextEdit
              Left = 73
              Top = 65
              ParentFont = False
              Properties.ImeMode = imSHanguel
              Properties.MaxLength = 60
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 4
              Width = 278
            end
            object MenuCodeEdit: TcxTextEdit
              Left = 73
              Top = 5
              ParentFont = False
              Properties.ImeMode = imDisable
              Properties.MaxLength = 14
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 0
              Width = 100
            end
            object MenuClassCodeEdit: TcxButtonEdit
              Left = 73
              Top = 95
              Hint = 'CD_CLASS'
              ParentFont = False
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              Properties.ClickKey = 112
              Properties.ImeMode = imSHanguel
              Properties.OnButtonClick = MenuClassCodeEditPropertiesButtonClick
              Properties.OnChange = EditPropertiesChange
              Properties.OnValidate = EditPropertiesValidate
              Style.StyleController = EditStyleController
              TabOrder = 5
              Width = 88
            end
            object MenuClassNameEdit: TcxTextEdit
              Left = 164
              Top = 95
              TabStop = False
              Enabled = False
              ParentFont = False
              Properties.ReadOnly = True
              Style.Color = 14737632
              Style.StyleController = EditStyleController
              TabOrder = 6
              Width = 254
            end
            object InputRemainCheckBox: TcxCheckBox
              Tag = 99
              Left = 236
              Top = 4
              Caption = #49888#44508#44256#51221
              ParentFont = False
              Properties.OnChange = InputRemainCheckBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 2
            end
            object KeyInButton: TAdvGlowButton
              Left = 176
              Top = 4
              Width = 56
              Height = 25
              Caption = #49688#46041#51077#47141
              Font.Charset = HANGEUL_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #47569#51008' '#44256#46357
              Font.Style = []
              FocusType = ftHot
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              ParentFont = False
              Rounded = True
              TabOrder = 1
              OnClick = KeyInButtonClick
              Appearance.BorderColor = 14727579
              Appearance.BorderColorHot = 10079963
              Appearance.BorderColorDown = 4548219
              Appearance.BorderColorChecked = 4548219
              Appearance.Color = 15653832
              Appearance.ColorTo = 16178633
              Appearance.ColorChecked = 11918331
              Appearance.ColorCheckedTo = 7915518
              Appearance.ColorDisabled = clNone
              Appearance.ColorDisabledTo = clNone
              Appearance.ColorDown = 7778289
              Appearance.ColorDownTo = 4296947
              Appearance.ColorHot = 15465983
              Appearance.ColorHotTo = 11332863
              Appearance.ColorMirror = 15586496
              Appearance.ColorMirrorTo = 16245200
              Appearance.ColorMirrorHot = 5888767
              Appearance.ColorMirrorHotTo = 10807807
              Appearance.ColorMirrorDown = 946929
              Appearance.ColorMirrorDownTo = 5021693
              Appearance.ColorMirrorChecked = 10480637
              Appearance.ColorMirrorCheckedTo = 5682430
              Appearance.ColorMirrorDisabled = clNone
              Appearance.ColorMirrorDisabledTo = clNone
              Appearance.GradientHot = ggVertical
              Appearance.GradientMirrorHot = ggVertical
              Appearance.GradientDown = ggVertical
              Appearance.GradientMirrorDown = ggVertical
              Appearance.GradientChecked = ggVertical
              Appearance.SystemFont = False
            end
          end
          object CenterPanel: TPanel
            Left = 0
            Top = 120
            Width = 425
            Height = 275
            Align = alTop
            BevelOuter = bvNone
            Color = 16768709
            ParentBackground = False
            TabOrder = 1
            object PriceSaleLabel: TLabel
              Left = 13
              Top = 40
              Width = 52
              Height = 17
              Caption = #54032#47588#45800#44032
              Transparent = True
            end
            object GoodsTypeLabel: TLabel
              Left = 13
              Top = 9
              Width = 52
              Height = 17
              Caption = #47700#45684#44396#48516
              Font.Charset = HANGEUL_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #47569#51008' '#44256#46357
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label1: TLabel
              Left = 286
              Top = 9
              Width = 52
              Height = 17
              Caption = #44284#49464#44396#48516
              Font.Charset = HANGEUL_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #47569#51008' '#44256#46357
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object PriceProfitRateLabel: TLabel
              Left = 323
              Top = 40
              Width = 39
              Height = 17
              Caption = #51060#51061#47456
              Transparent = True
            end
            object MenuNoLabel: TLabel
              Left = 166
              Top = 101
              Width = 52
              Height = 17
              Caption = #47700#45684#48264#54840
              Transparent = True
            end
            object PriceTipLabel: TLabel
              Left = 13
              Top = 100
              Width = 49
              Height = 17
              Caption = #48393' '#49324' '#47308
              Transparent = True
            end
            object PriceDoubleLabel: TLabel
              Left = 13
              Top = 71
              Width = 49
              Height = 17
              Caption = #44273' '#48764' '#44592
              Transparent = True
            end
            object DisplaySeqLabel: TLabel
              Left = 310
              Top = 69
              Width = 52
              Height = 17
              Caption = #54364#49884#49692#48264
              Transparent = True
            end
            object GroupNoLabel: TLabel
              Left = 310
              Top = 99
              Width = 52
              Height = 17
              Caption = #44536#47353#48264#54840
              Transparent = True
            end
            object Label18: TLabel
              Left = 169
              Top = 9
              Width = 52
              Height = 17
              Caption = #47700#45684#44079#49688
              Transparent = True
            end
            object PriceBuyLabel: TLabel
              Left = 169
              Top = 41
              Width = 52
              Height = 17
              Caption = #47588#51077#45800#44032
              Transparent = True
            end
            object Label2: TLabel
              Left = 169
              Top = 71
              Width = 52
              Height = 17
              Caption = #54252#51109#45800#44032
              Transparent = True
            end
            object Label3: TLabel
              Left = 18
              Top = 132
              Width = 49
              Height = 17
              Caption = #44256' '#44061' '#49688
              Transparent = True
            end
            object Label6: TLabel
              Left = 130
              Top = 131
              Width = 13
              Height = 17
              Caption = #47749
              Transparent = True
            end
            object Label15: TLabel
              Left = 167
              Top = 130
              Width = 52
              Height = 17
              Caption = #52572#49548#51452#47928
              Transparent = True
            end
            object PriceSaleEdit: TcxCurrencyEdit
              Left = 73
              Top = 36
              EditValue = 0.000000000000000000
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0'
              Properties.EditFormat = ',#'
              Properties.ImeMode = imSAlpha
              Properties.UseLeftAlignmentOnEditing = False
              Properties.OnChange = EditPropertiesChange
              Properties.OnValidate = EditPropertiesValidate
              Style.StyleController = EditStyleController
              TabOrder = 3
              Width = 88
            end
            object MenuTypeComboBox: TcxComboBox
              Left = 73
              Top = 6
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 0
              Width = 88
            end
            object TaxComboBox: TcxComboBox
              Left = 342
              Top = 6
              Hint = 'DS_TAX'
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 2
              Width = 76
            end
            object PriceProfitRateEdit: TcxCurrencyEdit
              Left = 368
              Top = 36
              EditValue = 0.000000000000000000
              ParentFont = False
              ParentShowHint = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DecimalPlaces = 2
              Properties.DisplayFormat = '0.00'
              Properties.EditFormat = '#.00'
              Properties.ImeMode = imDisable
              Properties.MaxValue = 100.000000000000000000
              Properties.MinValue = -100.000000000000000000
              Properties.Nullable = False
              Properties.UseLeftAlignmentOnEditing = False
              Properties.OnChange = EditPropertiesChange
              Properties.OnValidate = EditPropertiesValidate
              ShowHint = True
              Style.StyleController = EditStyleController
              TabOrder = 6
              Width = 50
            end
            object MenuNoEdit: TcxTextEdit
              Left = 225
              Top = 96
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.ImeMode = imSAlpha
              Properties.MaxLength = 4
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 8
              Width = 49
            end
            object PriceTipEdit: TcxCurrencyEdit
              Left = 73
              Top = 96
              EditValue = 0.000000000000000000
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0'
              Properties.EditFormat = ',#'
              Properties.ImeMode = imSAlpha
              Properties.UseLeftAlignmentOnEditing = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 7
              Width = 88
            end
            object PriceDoubleEdit: TcxCurrencyEdit
              Left = 73
              Top = 66
              EditValue = 0.000000000000000000
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0'
              Properties.EditFormat = ',#'
              Properties.ImeMode = imSAlpha
              Properties.UseLeftAlignmentOnEditing = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 5
              Width = 88
            end
            object DisplaySeqEdit: TcxSpinEdit
              Left = 368
              Top = 66
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.AssignedValues.MinValue = True
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 9
              Width = 50
            end
            object GroupNoEdit: TcxSpinEdit
              Left = 368
              Top = 96
              Hint = 'NO_GROUP'
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.AssignedValues.MinValue = True
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 10
              OnClick = GroupNoEditClick
              Width = 50
            end
            object DcCheckBox: TcxCheckBox
              Left = 179
              Top = 162
              Hint = 'YN_DC'
              Caption = #54624#51064
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 14
            end
            object PointCheckBox: TcxCheckBox
              Left = 53
              Top = 188
              Hint = 'YN_POINT'
              Caption = #54252#51064#53944#51201#47549
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 16
            end
            object UseCheckBox: TcxCheckBox
              Left = 53
              Top = 243
              Hint = 'YN_USE'
              Caption = #49324#50857
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 22
            end
            object PrintCheckBox: TcxCheckBox
              Left = 304
              Top = 188
              Caption = #50689#49688#51613#52636#47141
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 18
            end
            object MenuCountEdit: TcxSpinEdit
              Left = 225
              Top = 6
              Hint = 'QTY_SELECT'
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.AssignedValues.MinValue = True
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 1
              OnClick = GroupNoEditClick
              Width = 40
            end
            object PriceBuyEdit: TcxCurrencyEdit
              Left = 225
              Top = 36
              EditValue = 0.000000000000000000
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0'
              Properties.EditFormat = ',#'
              Properties.ImeMode = imSAlpha
              Properties.UseLeftAlignmentOnEditing = False
              Properties.OnChange = EditPropertiesChange
              Properties.OnValidate = EditPropertiesValidate
              Style.StyleController = EditStyleController
              TabOrder = 4
              Width = 75
            end
            object BillPrintCheckBox: TcxCheckBox
              Left = 304
              Top = 160
              Hint = 'YN_BILL'
              Caption = #44256#44061#51452#47928#49436#52636#47141
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 15
            end
            object PointLimitCheckBox: TcxCheckBox
              Left = 179
              Top = 188
              Hint = 'YN_POINT_LIMIT'
              Caption = #54252#51064#53944#49324#50857#51228#54620
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 17
            end
            object TableColorCheckBox: TcxCheckBox
              Left = 179
              Top = 216
              Hint = 'YN_TABLECOLOR'
              Caption = #53580#51060#48660#49353#49345
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 20
            end
            object TicketCheckBox: TcxCheckBox
              Left = 179
              Top = 243
              Hint = 'YN_TICKET'
              Caption = #54000#53011
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 23
            end
            object SoldOutCheckBox: TcxCheckBox
              Left = 304
              Top = 216
              Hint = 'YN_SOLDOUT'
              Caption = #54408#51208
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 21
            end
            object SalePriceFixCheckBox: TcxCheckBox
              Left = 53
              Top = 162
              Hint = 'YN_PRICEFIX'
              Caption = #54032#47588#45800#44032#44256#51221
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 13
            end
            object PackingCheckBox: TcxCheckBox
              Left = 53
              Top = 216
              Hint = 'YN_PACKING'
              Caption = #54252#51109#50504#46120
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 19
            end
            object PricePackingEdit: TcxCurrencyEdit
              Left = 225
              Top = 66
              EditValue = 0.000000000000000000
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0'
              Properties.EditFormat = ',#'
              Properties.ImeMode = imSAlpha
              Properties.UseLeftAlignmentOnEditing = False
              Properties.OnChange = EditPropertiesChange
              Properties.OnValidate = EditPropertiesValidate
              Style.StyleController = EditStyleController
              TabOrder = 24
              Width = 75
            end
            object Option4Edit: TcxSpinEdit
              Left = 73
              Top = 126
              Hint = 'GUEST_COUNT'
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.AssignedValues.MinValue = True
              Properties.MaxValue = 9.000000000000000000
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 11
              OnClick = GroupNoEditClick
              Width = 45
            end
            object Option14Edit: TcxSpinEdit
              Left = 225
              Top = 126
              Hint = 'GUEST_COUNT'
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.AssignedValues.MinValue = True
              Properties.MaxValue = 9.000000000000000000
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 12
              OnClick = GroupNoEditClick
              Width = 50
            end
            object Option12CheckBox: TcxCheckBox
              Left = 305
              Top = 243
              Hint = 'YN_ADULT'
              Caption = #49457#51064#51204#50857
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 25
            end
          end
          object BottomPanel: TPanel
            Left = 0
            Top = 560
            Width = 425
            Height = 69
            Align = alTop
            BevelOuter = bvNone
            Color = 16768709
            ParentBackground = False
            TabOrder = 3
            object StockGroupBox: TAdvGroupBox
              Left = 13
              Top = 6
              Width = 399
              Height = 55
              CaptionFont.Charset = DEFAULT_CHARSET
              CaptionFont.Color = clWindowText
              CaptionFont.Height = -11
              CaptionFont.Name = 'Tahoma'
              CaptionFont.Style = []
              Transparent = False
              Caption = ' '#51116#44256#44288#47532' '
              ParentCtl3D = True
              TabOrder = 0
              object StockTypeLabel: TLabel
                Left = 11
                Top = 26
                Width = 52
                Height = 17
                Caption = #51116#44256#44288#47532
                Transparent = True
              end
              object Label9: TLabel
                Left = 243
                Top = 26
                Width = 52
                Height = 17
                Caption = #44060#45817#51473#47049
                Transparent = True
              end
              object Label10: TLabel
                Left = 379
                Top = 26
                Width = 8
                Height = 17
                Caption = 'g'
                Transparent = True
              end
              object StockTypeComboBox: TcxComboBox
                Left = 71
                Top = 22
                Hint = 'DS_STOCK'
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 0
                Width = 120
              end
              object UnitQtyEdit: TcxCurrencyEdit
                Left = 303
                Top = 22
                Hint = 'QTY_UNIT'
                EditValue = 0.000000000000000000
                ParentFont = False
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0'
                Properties.EditFormat = ',#'
                Properties.ImeMode = imSAlpha
                Properties.UseLeftAlignmentOnEditing = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 1
                Width = 72
              end
            end
          end
        end
      end
      object LogPager: TAdvOfficePage
        Left = 1
        Top = 25
        Width = 825
        Height = 609
        Caption = ' '#49688#51221#51060#47141' '
        DoubleBuffered = True
        PageAppearance.BorderColor = clNone
        PageAppearance.Color = 16768709
        PageAppearance.ColorTo = 16768709
        PageAppearance.ColorMirror = 16768709
        PageAppearance.ColorMirrorTo = 16768709
        PageAppearance.Gradient = ggVertical
        PageAppearance.GradientMirror = ggVertical
        Text = ''
        TabAppearance.BorderColor = clWhite
        TabAppearance.BorderColorHot = clNone
        TabAppearance.BorderColorSelected = clNone
        TabAppearance.BorderColorSelectedHot = clNone
        TabAppearance.BorderColorDisabled = clNone
        TabAppearance.BorderColorDown = clNone
        TabAppearance.Color = clWhite
        TabAppearance.ColorTo = clWhite
        TabAppearance.ColorSelected = clWhite
        TabAppearance.ColorSelectedTo = clWhite
        TabAppearance.ColorDisabled = 15658734
        TabAppearance.ColorDisabledTo = clNone
        TabAppearance.ColorHot = 16316922
        TabAppearance.ColorHotTo = 16316922
        TabAppearance.ColorMirror = clWhite
        TabAppearance.ColorMirrorTo = clWhite
        TabAppearance.ColorMirrorHot = 16316922
        TabAppearance.ColorMirrorHotTo = 16316922
        TabAppearance.ColorMirrorSelected = clWhite
        TabAppearance.ColorMirrorSelectedTo = clWhite
        TabAppearance.ColorMirrorDisabled = 15658734
        TabAppearance.ColorMirrorDisabledTo = clNone
        TabAppearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Font.Color = clWindowText
        TabAppearance.Font.Height = -11
        TabAppearance.Font.Name = 'Tahoma'
        TabAppearance.Font.Style = []
        TabAppearance.Gradient = ggVertical
        TabAppearance.GradientMirror = ggVertical
        TabAppearance.GradientHot = ggVertical
        TabAppearance.GradientMirrorHot = ggVertical
        TabAppearance.GradientSelected = ggVertical
        TabAppearance.GradientMirrorSelected = ggVertical
        TabAppearance.GradientDisabled = ggVertical
        TabAppearance.GradientMirrorDisabled = ggVertical
        TabAppearance.TextColor = 4474440
        TabAppearance.TextColorHot = 14916384
        TabAppearance.TextColorSelected = 4474440
        TabAppearance.TextColorDisabled = 7303023
        TabAppearance.ShadowColor = clNone
        TabAppearance.HighLightColor = clNone
        TabAppearance.HighLightColorHot = clNone
        TabAppearance.HighLightColorSelected = clNone
        TabAppearance.HighLightColorSelectedHot = clNone
        TabAppearance.HighLightColorDown = clNone
        TabAppearance.DrawLine = False
        TabAppearance.TextSelectedBold = True
        TabAppearance.BackGround.Color = 16773350
        TabAppearance.BackGround.ColorTo = 16773350
        TabAppearance.BackGround.Direction = gdHorizontal
        OnShow = LogPagerShow
        object cxGrid1: TcxGrid
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 815
          Height = 599
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
          object HistoryGridTableView: TcxGridTableView
            Tag = 99
            Navigator.Buttons.CustomButtons = <>
            FilterBox.CustomizeDialog = False
            FilterBox.Visible = fvNever
            ScrollbarAnnotations.CustomAnnotations = <>
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = ',0'#44148
                Kind = skCount
                Column = HistoryGridTableViewHistoryDate
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            object HistoryGridTableViewHistoryDate: TcxGridColumn
              Caption = #48320#44221' '#51068#49884
              DataBinding.FieldName = 'DT_HIST'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              FooterAlignmentHorz = taRightJustify
              HeaderAlignmentHorz = taCenter
              Options.Grouping = False
              Options.Moving = False
              Width = 150
            end
            object HistoryGridTableViewWorkType: TcxGridColumn
              Caption = #51089#50629
              DataBinding.FieldName = 'GUBUN'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 50
            end
            object HistoryGridTableViewMenusName: TcxGridColumn
              Caption = #47700#45684#51060#47492
              DataBinding.FieldName = 'NM_MENU'
              PropertiesClassName = 'TcxLabelProperties'
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Options.Moving = False
              Width = 200
            end
            object HistoryGridTableViewSalePrice: TcxGridColumn
              Caption = #54032#47588#44032'('#51204')'
              DataBinding.FieldName = 'PR_SALE_OLD'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0'
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Options.Moving = False
              Width = 80
            end
            object HistoryGridTableViewAfterSalePrice: TcxGridColumn
              Caption = #54032#47588#44032'('#54980')'
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'PR_SALE'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0'
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object HistoryGridTableViewProfitRate: TcxGridColumn
              Caption = #51060#51061#47456
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'PR_SALE_PROFIT'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DecimalPlaces = 2
              Properties.DisplayFormat = ',0.00'
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Options.Moving = False
              Width = 60
            end
            object HistoryGridTableViewMakerCode: TcxGridColumn
              Caption = #51452#48169
              DataBinding.FieldName = 'CD_PRINTER'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 135
            end
            object HistoryGridTableViewMenuShortName: TcxGridColumn
              Caption = #47700#45684#45800#52629#51060#47492
              DataBinding.FieldName = 'NM_MENU_SHORT'
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Options.Moving = False
              Width = 150
            end
            object HistoryGridTableViewBuyPrice: TcxGridColumn
              Caption = #47588#51077#44032'('#51204')'
              DataBinding.FieldName = 'PR_BUY_OLD'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DecimalPlaces = 2
              Properties.DisplayFormat = ',0.00'
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Options.Moving = False
              Width = 80
            end
            object HistoryGridTableViewAfterBuyPrice: TcxGridColumn
              Caption = #47588#51077#44032'('#54980')'
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'PR_BUY'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00'
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object HistoryGridTableViewClassCode: TcxGridColumn
              Caption = #47700#45684#48516#47448
              DataBinding.FieldName = 'NM_CLASS'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
              Width = 200
            end
            object HistoryGridTableViewType: TcxGridColumn
              Caption = #44396#48516
              DataBinding.FieldName = 'DS_MENU_TYPE'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 70
            end
            object HistoryGridTableViewTaxYN: TcxGridColumn
              Caption = #44284#49464
              DataBinding.FieldName = 'DS_TAX'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 50
            end
            object HistoryGridTableViewStockType: TcxGridColumn
              Caption = #51116#44256#44396#48516
              DataBinding.FieldName = 'DS_STOCK'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 70
            end
            object HistoryGridTableViewUnitQty: TcxGridColumn
              Caption = #44060#45817#51473#47049
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'QTY_UNIT'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0'
              HeaderAlignmentHorz = taCenter
              Width = 75
            end
            object HistoryGridTableViewCompanyCode: TcxGridColumn
              Caption = #47588#51077#52376
              DataBinding.FieldName = 'NM_TRDPL'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
              Width = 200
            end
            object HistoryGridTableViewDoublePrice: TcxGridColumn
              Caption = #44273#48764#44592
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'PR_SALE_DOUBLE'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0'
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewTipPrice: TcxGridColumn
              Caption = #48393#49324#47308
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'PR_TIP'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0'
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewMenuCount: TcxGridColumn
              Caption = #47700#45684#44079#49688
              DataBinding.ValueType = 'Integer'
              DataBinding.FieldName = 'QTY_SELECT'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.DisplayFormat = ',0'
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewMenuNo: TcxGridColumn
              Caption = #47700#45684#48264#54840
              DataBinding.FieldName = 'NO_MENU'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.DisplayFormat = ',0'
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewDisplaySeq: TcxGridColumn
              Caption = #54364#49884#49692#48264
              DataBinding.ValueType = 'Integer'
              DataBinding.FieldName = 'BILL_SEQ'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.DisplayFormat = ',0'
              HeaderAlignmentHorz = taCenter
              Width = 76
            end
            object HistoryGridTableViewGroupNo: TcxGridColumn
              Caption = #44536#47353#48264#54840
              DataBinding.ValueType = 'Integer'
              DataBinding.FieldName = 'NO_GROUP'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.DisplayFormat = ',0'
              HeaderAlignmentHorz = taCenter
              Width = 75
            end
            object HistoryGridTableViewDsKitchen: TcxGridColumn
              Caption = #52636#47141#44396#48516
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'DS_KITCHEN'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.DisplayFormat = ',0'
              HeaderAlignmentHorz = taCenter
              Width = 69
            end
            object HistoryGridTableViewStampSave: TcxGridColumn
              Caption = #49828#53596#54532#51201#47549
              DataBinding.FieldName = 'SAVE_STAMP'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = '#,#'
              HeaderAlignmentHorz = taCenter
              Width = 96
            end
            object HistoryGridTableViewStampUse: TcxGridColumn
              Caption = #49828#53596#54532#49324#50857
              DataBinding.FieldName = 'USE_STAMP'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = '#,#'
              HeaderAlignmentHorz = taCenter
              Width = 78
            end
            object HistoryGridTableViewColumn1: TcxGridColumn
              Caption = #50741#49496
              DataBinding.FieldName = 'CONFIG'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewUseYN: TcxGridColumn
              Caption = #49324#50857
              DataBinding.FieldName = 'YN_USE'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 59
            end
            object HistoryGridTableViewUserName: TcxGridColumn
              Caption = #51089#50629#49324#50896
              DataBinding.FieldName = 'NM_SAWON'
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object HistoryGridTableViewInsertDate: TcxGridColumn
              Caption = #46321#47197#51068#49884
              DataBinding.FieldName = 'DT_INSERT'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Grouping = False
              Options.Moving = False
              Width = 150
            end
            object HistoryGridTableViewPrgChange: TcxGridColumn
              Caption = #48320#44221'PG'
              DataBinding.FieldName = 'PRG_CHANGE'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = HistoryGridTableView
          end
        end
      end
      object PadImagePage: TAdvOfficePage
        Left = 1
        Top = 25
        Width = 825
        Height = 609
        Caption = ' '#49828#47560#53944#54056#46300' '#51060#48120#51648' '
        DoubleBuffered = True
        PageAppearance.BorderColor = clNone
        PageAppearance.Color = 16768709
        PageAppearance.ColorTo = 16768709
        PageAppearance.ColorMirror = 16768709
        PageAppearance.ColorMirrorTo = 16768709
        PageAppearance.Gradient = ggVertical
        PageAppearance.GradientMirror = ggVertical
        TabVisible = False
        Text = ''
        TabAppearance.BorderColor = clWhite
        TabAppearance.BorderColorHot = clNone
        TabAppearance.BorderColorSelected = clNone
        TabAppearance.BorderColorSelectedHot = clNone
        TabAppearance.BorderColorDisabled = clNone
        TabAppearance.BorderColorDown = clNone
        TabAppearance.Color = clWhite
        TabAppearance.ColorTo = clWhite
        TabAppearance.ColorSelected = clWhite
        TabAppearance.ColorSelectedTo = clWhite
        TabAppearance.ColorDisabled = 15658734
        TabAppearance.ColorDisabledTo = clNone
        TabAppearance.ColorHot = 16316922
        TabAppearance.ColorHotTo = 16316922
        TabAppearance.ColorMirror = clWhite
        TabAppearance.ColorMirrorTo = clWhite
        TabAppearance.ColorMirrorHot = 16316922
        TabAppearance.ColorMirrorHotTo = 16316922
        TabAppearance.ColorMirrorSelected = clWhite
        TabAppearance.ColorMirrorSelectedTo = clWhite
        TabAppearance.ColorMirrorDisabled = 15658734
        TabAppearance.ColorMirrorDisabledTo = clNone
        TabAppearance.Font.Charset = DEFAULT_CHARSET
        TabAppearance.Font.Color = clWindowText
        TabAppearance.Font.Height = -11
        TabAppearance.Font.Name = 'Tahoma'
        TabAppearance.Font.Style = []
        TabAppearance.Gradient = ggVertical
        TabAppearance.GradientMirror = ggVertical
        TabAppearance.GradientHot = ggVertical
        TabAppearance.GradientMirrorHot = ggVertical
        TabAppearance.GradientSelected = ggVertical
        TabAppearance.GradientMirrorSelected = ggVertical
        TabAppearance.GradientDisabled = ggVertical
        TabAppearance.GradientMirrorDisabled = ggVertical
        TabAppearance.TextColor = 4474440
        TabAppearance.TextColorHot = 14916384
        TabAppearance.TextColorSelected = 4474440
        TabAppearance.TextColorDisabled = 7303023
        TabAppearance.ShadowColor = clNone
        TabAppearance.HighLightColor = clNone
        TabAppearance.HighLightColorHot = clNone
        TabAppearance.HighLightColorSelected = clNone
        TabAppearance.HighLightColorSelectedHot = clNone
        TabAppearance.HighLightColorDown = clNone
        TabAppearance.DrawLine = False
        TabAppearance.TextSelectedBold = True
        TabAppearance.BackGround.Color = 16773350
        TabAppearance.BackGround.ColorTo = 16773350
        TabAppearance.BackGround.Direction = gdHorizontal
        object AdvGroupBox2: TAdvGroupBox
          Left = 19
          Top = 10
          Width = 255
          Height = 269
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          Transparent = False
          Caption = ' '#44396#48516'(01) ('#51221#49345')'
          ParentCtl3D = True
          TabOrder = 0
          object cxImage1: TcxImage
            Left = 22
            Top = 26
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Properties.Caption = #51060#48120#51648' '#50630#51020
            Properties.FitMode = ifmProportionalStretch
            Properties.GraphicClassName = 'TdxSmartImage'
            Properties.GraphicTransparency = gtTransparent
            Style.BorderStyle = ebsNone
            Style.TransparentBorder = False
            TabOrder = 0
            Height = 192
            Width = 212
          end
          object cxButton1: TcxButton
            Left = 20
            Top = 221
            Width = 101
            Height = 35
            Caption = #48520#47084#50724#44592
            TabOrder = 1
          end
          object cxButton2: TcxButton
            Left = 127
            Top = 221
            Width = 108
            Height = 35
            Caption = #49325#51228
            TabOrder = 2
          end
        end
        object AdvGroupBox3: TAdvGroupBox
          Left = 295
          Top = 10
          Width = 253
          Height = 269
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          Transparent = False
          Caption = ' '#44396#48516'(01) ('#54408#51208')'
          ParentCtl3D = True
          TabOrder = 1
          object cxImage2: TcxImage
            Left = 22
            Top = 25
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Properties.Caption = #51060#48120#51648' '#50630#51020
            Properties.FitMode = ifmProportionalStretch
            Properties.GraphicClassName = 'TdxSmartImage'
            Properties.GraphicTransparency = gtTransparent
            Style.BorderStyle = ebsNone
            Style.TransparentBorder = False
            TabOrder = 0
            Height = 192
            Width = 212
          end
          object cxButton3: TcxButton
            Left = 20
            Top = 220
            Width = 114
            Height = 35
            Caption = #48520#47084#50724#44592
            TabOrder = 1
          end
          object cxButton4: TcxButton
            Left = 136
            Top = 220
            Width = 99
            Height = 35
            Caption = #49325#51228
            TabOrder = 2
          end
        end
      end
    end
  end
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 21
  end
  object DetailSearchPanel: TAdvPanel [6]
    Left = 0
    Top = 65
    Width = 1083
    Height = 18
    Align = alTop
    DockSite = True
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    UseDockManager = True
    Version = '2.5.11.0'
    AutoHideChildren = False
    BorderColor = clBlack
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.CloseColor = clHighlight
    Caption.Font.Charset = HANGEUL_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -13
    Caption.Font.Name = #47569#51008' '#44256#46357
    Caption.Font.Style = [fsBold]
    Caption.Indent = 0
    Caption.MinMaxButton = True
    Caption.MinMaxCaption = True
    Caption.Text = #49345#49464#44160#49353#51012' '#50896#54616#49884#47732' '#50668#44592#47484' '#53364#47533#54616#49901#49884#50724'.'
    Caption.Visible = True
    Collaps = True
    CollapsDelay = 0
    ColorTo = clInactiveCaption
    DoubleBuffered = True
    Ellipsis = True
    Position.Save = True
    Position.Location = clInifile
    ShowMoveCursor = True
    StatusBar.BevelInner = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    FullHeight = 244
    object ScrollBox1: TScrollBox
      Left = 0
      Top = 18
      Width = 1083
      Height = 0
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clInactiveCaption
      Ctl3D = True
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 0
      object ConditionVanLabel: TLabel
        Left = 601
        Top = 167
        Width = 27
        Height = 17
        Caption = 'VAN'
        Transparent = True
      end
      object Label5: TLabel
        Left = 456
        Top = 166
        Width = 26
        Height = 17
        Caption = #51452#48169
        Transparent = True
      end
      object ConditionCornerLabel: TLabel
        Left = 456
        Top = 198
        Width = 26
        Height = 17
        Caption = #50629#51109
        Transparent = True
        Visible = False
      end
      object Conditon1RadioGroup: TAdvOfficeRadioGroup
        Tag = 99
        Left = 14
        Top = 52
        Width = 115
        Height = 80
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Version = '1.8.0.3'
        BiDiMode = bdLeftToRight
        Caption = #54032#47588#44396#48516
        ParentBackground = False
        ParentBiDiMode = False
        ParentCtl3D = True
        TabOrder = 0
        ItemIndex = 1
        Items.Strings = (
          #51204#52404
          #54032#47588#51473
          #45800#51333#47700#45684)
        ButtonVertAlign = tlCenter
        Ellipsis = False
      end
      object Conditon2RadioGroup: TAdvOfficeRadioGroup
        Tag = 99
        Left = 141
        Top = 52
        Width = 136
        Height = 167
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Version = '1.8.0.3'
        BiDiMode = bdLeftToRight
        Caption = #47700#45684#44396#48516
        ParentBackground = False
        ParentBiDiMode = False
        ParentCtl3D = True
        TabOrder = 1
        ItemIndex = 0
        Items.Strings = (
          #51204#52404
          #51068#48152' '#47700#45684
          #49903#44032' '#47700#45684
          #49464#53944' '#47700#45684
          #53076#49828#47700#45684
          #50724#54536#49464#53944' '#47700#45684
          #51200#50872' '#47700#45684
          #50500#51060#53596' '#47700#45684
          #44536#47353#47700#45684)
        ButtonVertAlign = tlCenter
        Ellipsis = False
      end
      object Conditon3RadioGroup: TAdvOfficeRadioGroup
        Tag = 99
        Left = 283
        Top = 52
        Width = 165
        Height = 133
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Version = '1.8.0.3'
        BiDiMode = bdLeftToRight
        Caption = #54624#51064'/'#54252#51064#53944
        ParentBackground = False
        ParentBiDiMode = False
        ParentCtl3D = True
        TabOrder = 2
        ItemIndex = 0
        Items.Strings = (
          #51204#52404
          #54624#51064' '#44032#45733' '#47700#45684
          #54624#51064' '#48520#44032' '#47700#45684
          #54252#51064#53944' '#51201#47549' '#47700#45684
          #54252#51064#53944' '#48120#51201#47549' '#47700#45684)
        ButtonVertAlign = tlCenter
        Ellipsis = False
      end
      object Conditon4RadioGroup: TAdvOfficeRadioGroup
        Tag = 99
        Left = 455
        Top = 52
        Width = 138
        Height = 105
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Version = '1.8.0.3'
        BiDiMode = bdLeftToRight
        Caption = #44284#49464'/'#47732#49464
        ParentBackground = False
        ParentBiDiMode = False
        ParentCtl3D = True
        TabOrder = 3
        ItemIndex = 0
        Items.Strings = (
          #51204#52404
          #44284#49464'('#54252#54632')'
          #47732#49464
          #44284#49464'('#48324#46020')')
        ButtonVertAlign = tlCenter
        Ellipsis = False
      end
      object Conditon5RadioGroup: TAdvOfficeRadioGroup
        Tag = 99
        Left = 599
        Top = 52
        Width = 144
        Height = 79
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Version = '1.8.0.3'
        BiDiMode = bdLeftToRight
        Caption = #51116#44256#44396#48516
        ParentBackground = False
        ParentBiDiMode = False
        ParentCtl3D = True
        TabOrder = 4
        ItemIndex = 0
        Items.Strings = (
          #51204#52404
          #44288#47532#50504#54632
          #44288#47532#54632)
        ButtonVertAlign = tlCenter
        Ellipsis = False
      end
      object AdvGroupBox1: TAdvGroupBox
        Left = 14
        Top = 4
        Width = 729
        Height = 42
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        ParentCtl3D = True
        TabOrder = 5
        object ConditionGoodsClassLabel: TLabel
          Left = 5
          Top = 8
          Width = 52
          Height = 25
          AutoSize = False
          Caption = #47700#45684#48516#47448
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
          Layout = tlCenter
        end
        object Label4: TLabel
          Left = 457
          Top = 8
          Width = 52
          Height = 25
          AutoSize = False
          Caption = #49688#51221#44592#44036
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
          Layout = tlCenter
        end
        object ConditionGoodsClassCodeEdit: TcxButtonEdit
          Tag = 99
          Left = 65
          Top = 7
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ClickKey = 112
          Properties.ImeMode = imSHanguel
          Properties.ReadOnly = False
          Properties.OnButtonClick = ConditionGoodsClassCodeEditPropertiesButtonClick
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 80
        end
        object ConditionGoodsClassNameEdit: TcxTextEdit
          Tag = 99
          Left = 151
          Top = 7
          TabStop = False
          ParentFont = False
          Properties.ReadOnly = True
          Style.Color = 14737632
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 283
        end
        object ConditionFromDateEdit: TcxDateEdit
          Tag = 99
          Left = 517
          Top = 8
          AutoSize = False
          ParentFont = False
          Properties.ImmediatePost = True
          Style.StyleController = EditStyleController
          TabOrder = 2
          Height = 25
          Width = 90
        end
        object cxLabel2: TcxLabel
          Left = 607
          Top = 8
          AutoSize = False
          Caption = '~'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Transparent = True
          Height = 27
          Width = 18
          AnchorX = 616
          AnchorY = 22
        end
        object ConditionToDateEdit: TcxDateEdit
          Tag = 99
          Left = 625
          Top = 8
          AutoSize = False
          ParentFont = False
          Properties.ImmediatePost = True
          Style.StyleController = EditStyleController
          TabOrder = 4
          Height = 25
          Width = 90
        end
      end
      object ConditionNotClassCheckBox: TAdvOfficeCheckBox
        Tag = 99
        Left = 14
        Top = 132
        Width = 119
        Height = 26
        TabOrder = 6
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = #48516#47448' '#48120#51648#51221
        ReturnIsTab = False
        Version = '1.8.0.3'
      end
      object ConditionVanComboBox: TcxComboBox
        Tag = 99
        Left = 634
        Top = 163
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Style.StyleController = EditStyleController
        TabOrder = 9
        Width = 109
      end
      object ConditionKitchenComboBox: TcxComboBox
        Tag = 99
        Left = 485
        Top = 163
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          ''
          'ONE VAN'
          'TWO VAN')
        Style.StyleController = EditStyleController
        TabOrder = 10
        Width = 108
      end
      object ConditionCornerComboBox: TcxComboBox
        Tag = 99
        Left = 485
        Top = 194
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Style.StyleController = EditStyleController
        TabOrder = 11
        Visible = False
        Width = 258
      end
      object ConditionCustomerCheckBox: TAdvOfficeCheckBox
        Tag = 99
        Left = 14
        Top = 175
        Width = 119
        Height = 26
        TabOrder = 7
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = #44256#44061#49688' '#52628#51221#47700#45684
        ReturnIsTab = False
        Version = '1.8.0.3'
      end
      object BillPrinterCheckBox: TAdvOfficeCheckBox
        Tag = 99
        Left = 14
        Top = 153
        Width = 119
        Height = 26
        TabOrder = 8
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = #44256#44061#51452#47928#49436#52636#47141
        ReturnIsTab = False
        Version = '1.8.0.3'
      end
      object ConditionPointLimitCheckBox: TAdvOfficeCheckBox
        Tag = 99
        Left = 14
        Top = 197
        Width = 119
        Height = 26
        TabOrder = 12
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = #54252#51064#53944' '#49324#50857#51228#54620
        ReturnIsTab = False
        Version = '1.8.0.3'
      end
    end
  end
  object Grid2: TcxGrid [7]
    Left = 0
    Top = 722
    Width = 1083
    Height = 118
    Align = alBottom
    TabOrder = 6
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object GridTableView2: TcxGridTableView
      Tag = 99
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skCount
          Column = GridTableView2StoreName
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object GridTableView2StoreCode: TcxGridColumn
        Caption = #47588#51109#53076#46300
        DataBinding.FieldName = 'CD_STORE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Options.Focusing = False
        Width = 114
      end
      object GridTableView2StoreName: TcxGridColumn
        Caption = #47588#51109#47749
        DataBinding.FieldName = 'NM_STORE'
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Options.Focusing = False
        Options.Sorting = False
        Width = 234
      end
      object GridTableView2MenuCode: TcxGridColumn
        Caption = #47700#45684#53076#46300
        DataBinding.FieldName = 'CD_MENU'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = GridTableView2MenuCodePropertiesButtonClick
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Width = 103
      end
      object GridTableView2MenuName: TcxGridColumn
        Caption = #47700#45684#47749
        DataBinding.FieldName = 'NM_MENU'
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Options.Focusing = False
        Options.Sorting = False
        Width = 200
      end
      object GridTableView2SalePrice: TcxGridColumn
        Caption = #54032#47588#45800#44032
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'PR_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Options.Sorting = False
        Styles.OnGetContentStyle = GridTableView2SalePriceStylesGetContentStyle
        Width = 112
      end
      object GridTableView2DsTrdpl: TcxGridColumn
        Tag = 99
        DataBinding.FieldName = 'DS_TRDPL'
        Visible = False
      end
      object GridTableView2RowState: TcxGridColumn
        Tag = 99
        DataBinding.FieldName = 'ROW_STATE'
        Visible = False
        IsCaptionAssigned = True
      end
    end
    object StoreGridLevel: TcxGridLevel
      Caption = ' '#47588#51109#48324' '#49345#54408' '
      GridView = GridTableView2
    end
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  object PictureLoadDialog: TOpenPictureDialog
    Filter = #44536#47548' '#54028#51068'(*.png)|*.png'
    Left = 1011
    Top = 176
  end
end
