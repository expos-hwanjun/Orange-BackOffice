inherited SystemExcelForm: TSystemExcelForm
  Left = 297
  Caption = #50641#49472' '#51088#47308' '#48520#47084#50724#44592
  ClientHeight = 609
  ClientWidth = 967
  HelpFile = #54980#48169'/'#49884#49828#53596#44288#47532'/'#50641#49472#48520#47084#50724#44592'.htm'
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
      Width = 627
      ExplicitWidth = 627
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
        Left = 503
        ExplicitLeft = 503
        ExplicitWidth = 0
        Width = 0
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        Left = 503
        ExplicitLeft = 503
        ExplicitWidth = 0
        Width = 0
        AnchorX = 503
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
          #47588#51077#52376
          #54924#50896
          'PLU'
          #53580#51060#48660)
        Properties.OnEditValueChanged = ConditionToolBarComboBoxPropertiesEditValueChanged
        Visible = True
        ExplicitLeft = 52
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 503
        ExplicitLeft = 503
      end
      object ConditionComboBox: TcxComboBox
        Left = 173
        Top = 2
        AutoSize = False
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #44592#51316#47700#45684#47484' '#47784#46160' '#49325#51228#54620' '#54980' '#51088#47308' '#52628#44032
          #44592#51316#50640' '#50630#45716' '#49888#44508#47700#45684#47564' '#52628#44032)
        Style.StyleController = EditStyleController
        TabOrder = 7
        Text = #44592#51316#47700#45684#47484' '#47784#46160' '#49325#51228#54620' '#54980' '#51088#47308' '#52628#44032
        Visible = False
        Height = 25
        Width = 330
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
  object Connection: TUniConnection
    ProviderName = 'SQL Server'
    Port = 4171
    Database = 'ExtremeFood'
    SpecificOptions.Strings = (
      'SQL Server.ConnectionTimeout=10'
      'SQL Server.Provider=prSQL')
    PoolingOptions.MaxPoolSize = 10000
    Pooling = True
    Username = 'anypos'
    Server = 'www.expos.co.kr'
    LoginPrompt = False
    Left = 494
    Top = 36
    EncryptedPassword = '9EFF91FF86FF8FFF9EFF8CFF8CFF'
  end
  object LocalQuery: TUniQuery
    Connection = Connection
    ReadOnly = True
    UniDirectional = True
    Left = 558
    Top = 35
  end
end
