inherited SystemStoreAuthForm: TSystemStoreAuthForm
  Left = 300
  Top = 122
  ClientHeight = 606
  ClientWidth = 990
  ExplicitLeft = 300
  ExplicitTop = 112
  ExplicitHeight = 606
  ExplicitWidth = 990
  Caption = #47588#51109' '#44428#54620' '#44288#47532
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
  object Grid: TcxGrid [2]
    AlignWithMargins = True
    Left = 3
    Top = 68
    Width = 256
    Height = 535
    Align = alLeft
    TabOrder = 3
    LookAndFeel.Kind = lfOffice11
    object GridTableView: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      FilterBox.CustomizeDialog = False
      FilterBox.Visible = fvNever
      OnFocusedRecordChanged = GridTableViewFocusedRecordChanged
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
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
      OptionsView.GroupByBox = False
      object GridTableViewSawonCode: TcxGridColumn
        Caption = #49324#50896#53076#46300
        DataBinding.FieldName = 'CD_SAWON'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Sorting = False
        Width = 93
      end
      object GridTableViewColumn2: TcxGridColumn
        Caption = #49324#50896#51060#47492
        DataBinding.FieldName = 'NM_SAWON'
        HeaderAlignmentHorz = taCenter
        Options.Sorting = False
        Width = 138
      end
    end
    object GridLevel: TcxGridLevel
      GridView = GridTableView
    end
  end
  object Panel3: TPanel [3]
    Left = 262
    Top = 65
    Width = 728
    Height = 541
    Align = alClient
    TabOrder = 4
    ExplicitLeft = 252
    ExplicitTop = 71
    ExplicitWidth = 693
    ExplicitHeight = 467
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 315
      Height = 539
      Align = alLeft
      Caption = 'SourcePanel'
      TabOrder = 0
      object cxGrid1: TcxGrid
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 307
        Height = 531
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        ExplicitWidth = 274
        ExplicitHeight = 524
        object FromGridTableView: TcxGridTableView
          NavigatorButtons.ConfirmDelete = False
          FilterBox.CustomizeDialog = False
          FilterBox.Visible = fvNever
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
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
          OptionsView.GroupByBox = False
          object cxGridColumn1: TcxGridColumn
            Caption = #47588#51109#53076#46300
            DataBinding.FieldName = 'CD_STORE'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Sorting = False
            Width = 93
          end
          object cxGridColumn2: TcxGridColumn
            Caption = #47588#51109#47749
            DataBinding.FieldName = 'NM_STORE'
            HeaderAlignmentHorz = taCenter
            Options.Sorting = False
            Width = 192
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = FromGridTableView
        end
      end
    end
    object Panel2: TPanel
      Left = 378
      Top = 1
      Width = 349
      Height = 539
      Align = alClient
      Caption = 'TargetPanel'
      TabOrder = 1
      ExplicitLeft = 654
      ExplicitTop = -38
      ExplicitWidth = 282
      ExplicitHeight = 532
      object cxGrid2: TcxGrid
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 341
        Height = 531
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        ExplicitWidth = 274
        ExplicitHeight = 524
        object ToGridTableView: TcxGridTableView
          NavigatorButtons.ConfirmDelete = False
          FilterBox.CustomizeDialog = False
          FilterBox.Visible = fvNever
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
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
          OptionsView.GroupByBox = False
          object cxGridColumn3: TcxGridColumn
            Caption = #47588#51109#53076#46300
            DataBinding.FieldName = 'CD_STORE'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Options.Sorting = False
            Width = 93
          end
          object cxGridColumn4: TcxGridColumn
            Caption = #47588#51109#47749
            DataBinding.FieldName = 'NM_STORE'
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Options.Sorting = False
            Width = 195
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = ToGridTableView
        end
      end
    end
    object Panel4: TPanel
      Left = 316
      Top = 1
      Width = 62
      Height = 539
      Align = alLeft
      TabOrder = 2
      ExplicitLeft = 283
      ExplicitHeight = 465
      object AddButton: TcxButton
        Left = 7
        Top = 184
        Width = 48
        Height = 41
        Caption = #8594
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = True
        TabOrder = 0
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = AddButtonClick
      end
      object DelButton: TcxButton
        Left = 7
        Top = 242
        Width = 48
        Height = 41
        Caption = #8592
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = True
        TabOrder = 1
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = DelButtonClick
      end
    end
  end
  inherited EditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
end
