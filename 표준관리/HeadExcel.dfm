inherited HeadExcelForm: THeadExcelForm
  Left = 297
  Caption = #50641#49472' '#51088#47308' '#48520#47084#50724#44592
  ClientHeight = 609
  ClientWidth = 967
  ExplicitWidth = 983
  ExplicitHeight = 648
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 967
    ExplicitWidth = 967
    inherited ButtonToolBar: TAdvToolBar
      Left = 607
      ExplicitLeft = 607
      inherited ButtonToolBarDeleteButton: TAdvGlowButton
        Visible = False
      end
    end
    inherited ConditionToolBar: TAdvToolBar
      Width = 581
      ExplicitWidth = 581
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        Left = 2
        ExplicitLeft = 2
        ExplicitWidth = 0
        Width = 0
      end
      inherited ConditionToolBarDateLabel: TcxLabel
        ExplicitWidth = 0
        Width = 0
        AnchorX = 2
        AnchorY = 16
      end
      inherited ConditionToolBarToDateEdit: TcxDateEdit
        Left = 457
        ExplicitLeft = 457
        ExplicitWidth = 0
        Width = 0
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        Left = 457
        ExplicitLeft = 457
        ExplicitWidth = 0
        Width = 0
        AnchorX = 457
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        Left = 2
        Caption = #47560#49828#53552
        Visible = True
        ExplicitLeft = 2
        ExplicitWidth = 50
        Width = 50
        AnchorX = 27
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Left = 52
        Properties.Items.Strings = (
          #47700#45684#47560#49828#53552
          #47700#45684#48516#47448
          #54924#50896)
        Properties.OnChange = ConditionToolBarComboBoxPropertiesChange
        Properties.OnEditValueChanged = ConditionToolBarComboBoxPropertiesEditValueChanged
        Visible = True
        ExplicitLeft = 52
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 457
        ExplicitLeft = 457
      end
      object ConditionComboBox: TcxComboBox
        Left = 173
        Top = 2
        AutoSize = False
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #44592#51316#54924#50896' '#47784#46160' '#49325#51228#54620' '#54980' '#51088#47308' '#52628#44032
          #44592#51316#50640' '#50630#45716' '#54924#50896#47564' '#52628#44032)
        Style.StyleController = EditStyleController
        TabOrder = 7
        Text = #44592#51316#54924#50896' '#47784#46160' '#49325#51228#54620' '#54980' '#51088#47308' '#52628#44032
        Visible = False
        Height = 25
        Width = 284
      end
    end
  end
  object Grid: TcxGrid [1]
    AlignWithMargins = True
    Left = 3
    Top = 68
    Width = 961
    Height = 538
    Align = alClient
    TabOrder = 2
    TabStop = False
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object GridTableView: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'#44148
          Kind = skCount
        end>
      DataController.Summary.SummaryGroups = <>
      FilterRow.InfoText = #54596#53552#47484' '#51201#50857#54616#47140#47732' '#51060#44275#51012' '#53364#47533#54616#49464#50836'.'
      NewItemRow.InfoText = #49352#47196' '#52628#44032#54616#47140#47732' '#51060#44275#51012' '#53364#47533#54616#49464#50836'.'
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnMoving = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 23
    end
    object GridLevel: TcxGridLevel
      GridView = GridTableView
    end
  end
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 25
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
