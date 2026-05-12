inherited StoreCustomerTreeShowForm: TStoreCustomerTreeShowForm
  Caption = #54801#47141#49324'/'#52404#51064' '#47588#51109#47532#49828#53944
  ClientHeight = 750
  ClientWidth = 1069
  ExplicitWidth = 1085
  ExplicitHeight = 789
  PixelsPerInch = 96
  TextHeight = 17
  object GridSplitter: TAdvSplitter [0]
    Left = 250
    Top = 65
    Width = 6
    Height = 685
    AutoSnap = False
    MinSize = 50
    Appearance.BorderColor = clNone
    Appearance.BorderColorHot = clNone
    Appearance.Color = 14542308
    Appearance.ColorTo = 16768709
    Appearance.ColorHot = 15383705
    Appearance.ColorHotTo = 14922381
    GripStyle = sgFlatDots
    ExplicitTop = 44
    ExplicitHeight = 537
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1069
    ExplicitWidth = 1069
    inherited ButtonToolBar: TAdvToolBar
      Left = 781
      ExplicitLeft = 781
      inherited ButtonToolBarSeparator1: TAdvToolBarSeparator
        Height = 27
        ExplicitHeight = 27
      end
      inherited ButtonToolBarSearchButton: TAdvGlowButton
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
        AnchorX = 448
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Visible = True
      end
    end
  end
  inherited Grid: TcxGrid
    Left = 259
    Width = 807
    Height = 679
    RootLevelOptions.DetailTabsPosition = dtpTop
    OnActiveTabChanged = GridActiveTabChanged
    ExplicitLeft = 259
    ExplicitWidth = 807
    ExplicitHeight = 747
    inherited GridTableView: TcxGridTableView
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skCount
          Column = GridTableViewColumn2
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewColumn11
        end>
      OptionsView.Footer = True
      Styles.ContentEven = StyleEven
      object GridTableViewColumn13: TcxGridColumn
        Caption = #48376#49324#47749
        DataBinding.FieldName = 'NM_COMPANY'
        HeaderAlignmentHorz = taCenter
        Width = 108
      end
      object GridTableViewColumn1: TcxGridColumn
        Caption = #47588#51109#53076#46300
        DataBinding.FieldName = 'CD_CUSTOMER'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 133
      end
      object GridTableViewColumn2: TcxGridColumn
        Caption = #47588#51109#51060#47492
        DataBinding.FieldName = 'NM_CUSTOMER'
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 162
      end
      object GridTableViewColumn9: TcxGridColumn
        Caption = #49556#47336#49496
        DataBinding.FieldName = 'DS_SOLUTION'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 82
      end
      object GridTableViewColumn3: TcxGridColumn
        Caption = #45812#45817#51088
        DataBinding.FieldName = 'NM_MANAGER'
        HeaderAlignmentHorz = taCenter
        Width = 85
      end
      object GridTableViewColumn4: TcxGridColumn
        Caption = 'VAN'
        DataBinding.FieldName = 'VAN'
        HeaderAlignmentHorz = taCenter
        Width = 83
      end
      object GridTableViewColumn5: TcxGridColumn
        Caption = 'POS'
        DataBinding.FieldName = 'ALLOW_POS'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 91
      end
      object GridTableViewColumn6: TcxGridColumn
        Caption = 'KIOSK'
        DataBinding.FieldName = 'ALLOW_KIOSK'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 87
      end
      object GridTableViewColumn12: TcxGridColumn
        Caption = 'TABLET'
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'ALLOW_TABLET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 70
      end
      object GridTableViewColumn14: TcxGridColumn
        Caption = #47131#52768#50724#45908
        DataBinding.FieldName = 'DS_LETSORDER'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
      end
      object GridTableViewColumn7: TcxGridColumn
        Caption = #50672#46973#52376
        DataBinding.FieldName = 'TEL_MOBILE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 99
      end
      object GridTableViewColumn10: TcxGridColumn
        Caption = #49444#52824#51068#51088
        DataBinding.FieldName = 'YMD_SETUP'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
      end
      object GridTableViewColumn11: TcxGridColumn
        Caption = #44396#46021#47308
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_ASP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
      end
      object GridTableViewColumn8: TcxGridColumn
        Caption = #49345#53468
        DataBinding.FieldName = 'DS_STATUS'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
      end
    end
    object GridTableView1: TcxGridTableView [1]
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      Styles.OnGetContentStyle = GridTableView1StylesGetContentStyle
      object GridTableView1Column8: TcxGridColumn
        Caption = #48376#49324#47749
        DataBinding.FieldName = 'NM_COMPANY'
        HeaderAlignmentHorz = taCenter
        Width = 125
      end
      object GridTableView1Column1: TcxGridColumn
        Caption = #47588#51109#53076#46300
        DataBinding.FieldName = 'CD_CUSTOMER'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 120
      end
      object GridTableView1Column7: TcxGridColumn
        Caption = #47588#51109#47749
        DataBinding.FieldName = 'NM_CUSTOMER'
        HeaderAlignmentHorz = taCenter
        Width = 144
      end
      object GridTableView1Column2: TcxGridColumn
        Caption = #50500#51060#46356
        DataBinding.FieldName = 'ID_USER'
        HeaderAlignmentHorz = taCenter
        Width = 107
      end
      object GridTableView1Column5: TcxGridColumn
        Caption = #49324#50857#51088#47749
        DataBinding.FieldName = 'NM_USER'
        HeaderAlignmentHorz = taCenter
        Width = 117
      end
      object GridTableView1Column3: TcxGridColumn
        Caption = #54056#49828#50892#46300
        DataBinding.FieldName = 'PW_USER'
        HeaderAlignmentHorz = taCenter
        Width = 118
      end
      object GridTableView1DsUser: TcxGridColumn
        Caption = #44428#54620
        DataBinding.FieldName = 'DS_USER'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 99
      end
      object GridTableView1Column6: TcxGridColumn
        Caption = #49345#53468
        DataBinding.FieldName = 'DS_STATUS'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 92
      end
    end
    inherited GridLevel: TcxGridLevel
      Caption = ' '#47588#51109#51221#48372' '
    end
    object GridLevel1: TcxGridLevel
      Caption = ' '#49324#50857#51088#51221#48372' '
      GridView = GridTableView1
    end
  end
  object TreeView: TcxTreeView [3]
    Left = 0
    Top = 65
    Width = 250
    Height = 685
    Align = alLeft
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = #47569#51008' '#44256#46357
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 3
    OnDblClick = TreeViewDblClick
    MultiSelectStyle = []
    ReadOnly = True
    RightClickSelect = True
    OnChange = TreeViewChange
    OnExpanding = TreeViewExpanding
    ExplicitHeight = 753
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited dxComponentPrinter: TdxComponentPrinter
    PixelsPerInch = 96
    inherited dxComponentPrinter1Link1: TdxGridReportLink
      ReportDocument.CreationDate = 44941.603429918980000000
      PixelsPerInch = 96
      BuiltInReportLink = True
    end
  end
end
