inherited SystemCCTVShowForm: TSystemCCTVShowForm
  Caption = 'CCTV '#51312#54924
  ClientWidth = 940
  ExplicitWidth = 956
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 340
    Top = 179
    Height = 400
    ExplicitLeft = 246
    ExplicitTop = 83
    ExplicitHeight = 496
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 940
    ExplicitWidth = 940
    inherited ButtonToolBar: TAdvToolBar
      Left = 408
      ExplicitLeft = 408
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
      Width = 813
      ExplicitWidth = 813
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        Visible = True
      end
      inherited ConditionToolBarDateLabel: TcxLabel
        Visible = True
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarToDateEdit: TcxDateEdit
        Visible = True
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        Visible = True
        AnchorX = 166
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        Left = 423
        Caption = 'POS'
        ExplicitLeft = 423
        ExplicitWidth = 41
        Width = 41
        AnchorX = 444
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Left = 464
        Visible = True
        ExplicitLeft = 464
        ExplicitWidth = 75
        Width = 75
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 689
        Properties.OnChange = nil
        ExplicitLeft = 689
      end
      object ConditionToolBarAcctTypeLabel: TcxLabel
        Left = 539
        Top = 2
        AutoSize = False
        Caption = #44208#51228#44396#48516
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 27
        Width = 63
        AnchorX = 571
        AnchorY = 16
      end
      object ConditionToolBarAcctTypeComboBox: TcxComboBox
        Left = 602
        Top = 2
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #51204#52404
          #54788#44552
          #49888#50857#52852#46300
          #54788#44552#50689#49688#51613
          #54252#51064#53944)
        Style.StyleController = EditStyleController
        TabOrder = 8
        Text = #51204#52404
        Height = 25
        Width = 87
      end
      object cxLabel2: TcxLabel
        Left = 265
        Top = 2
        AutoSize = False
        Caption = #51312#54924#44396#48516
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 27
        Width = 66
        AnchorX = 298
        AnchorY = 16
      end
      object ConditionToolBarSaleTypeComboBox: TcxComboBox
        Left = 331
        Top = 2
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #51204#52404
          #54032#47588
          #52712#49548
          #48152#54408
          #51077#44552#48320#44221
          #54788#50689#52628#54980
          #54252#51064#53944#52628#54980
          #51452#47928#52712#49548)
        Properties.OnChange = ConditionToolBarSaleTypeComboBoxPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 10
        Text = #51204#52404
        Height = 25
        Width = 92
      end
    end
    inherited GlassGroupBox: TcxGroupBox
      Style.IsFontAssigned = True
    end
  end
  inherited GridPanel: TPanel
    Top = 179
    Width = 340
    Height = 400
    ExplicitTop = 179
    ExplicitWidth = 340
    ExplicitHeight = 400
    inherited Grid: TcxGrid
      Width = 334
      Height = 394
      ExplicitWidth = 334
      ExplicitHeight = 394
      inherited GridTableView: TcxGridTableView
        OnCellDblClick = GridTableViewCellDblClick
        OnCustomDrawCell = nil
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0 '#44148
            Kind = skCount
            Column = GridTableViewSaleDate
          end>
        DataController.Data = {
          B90000000F00000044617461436F6E74726F6C6C657231070000001200000054
          6378537472696E6756616C756554797065140000005463784461746554696D65
          56616C756554797065140000005463784461746554696D6556616C7565547970
          6512000000546378537472696E6756616C756554797065120000005463785374
          72696E6756616C75655479706512000000546378537472696E6756616C756554
          79706512000000546378537472696E6756616C75655479706500000000}
        OptionsView.Footer = True
        Styles.OnGetContentStyle = GridTableViewStylesGetContentStyle
        object GridTableViewSaleType: TcxGridColumn
          Caption = #44396#48516
          DataBinding.FieldName = 'DS_SALE'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
        end
        object GridTableViewSaleTime: TcxGridColumn
          Caption = #54032#47588#51068#49884
          DataBinding.ValueType = 'DateTime'
          DataBinding.FieldName = 'DT_SALE'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 155
        end
        object GridTableViewChangeTime: TcxGridColumn
          Caption = #48320#44221#51068#49884
          DataBinding.ValueType = 'DateTime'
          DataBinding.FieldName = 'DT_CHANGE'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 163
        end
        object GridTableViewSaleAmt: TcxGridColumn
          Caption = #47588#52636#44552#50529
          DataBinding.FieldName = 'AMT_SALE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Width = 102
        end
        object GridTableViewSaleDate: TcxGridColumn
          Caption = #47588#52636#51068#51088
          DataBinding.FieldName = 'YMD_SALE'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 116
        end
        object GridTableViewPosNo: TcxGridColumn
          Caption = 'POS'
          DataBinding.FieldName = 'NO_POS'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 51
        end
        object GridTableViewRcpNo: TcxGridColumn
          Caption = #50689#49688#51613
          DataBinding.FieldName = 'NO_RCP'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 59
        end
      end
      object GridTableView1: TcxGridTableView [1]
        Tag = 99
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0 '#44148
            Kind = skCount
            Column = GridTableView1CancelTime
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.ContentEven = StyleEven
        object GridTableView1CancelTime: TcxGridColumn
          Caption = #52712#49548#51068#49884
          DataBinding.ValueType = 'DateTime'
          DataBinding.FieldName = 'DT_CANCEL'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 158
        end
        object GridTableView1OrderTime: TcxGridColumn
          Caption = #51452#47928#49884#44036
          DataBinding.FieldName = 'DT_ORDER'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          HeaderAlignmentHorz = taCenter
          Width = 178
        end
        object GridTableView1Menu: TcxGridColumn
          Caption = #47700#45684
          DataBinding.FieldName = 'NM_MENU'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Width = 150
        end
        object GridTableView1Qty: TcxGridColumn
          Caption = #49688#47049
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'QTY_CANCEL'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Width = 75
        end
        object GridTableView1Sawon: TcxGridColumn
          Caption = #52712#49548#49324#50896
          DataBinding.FieldName = 'NM_SAWON'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 83
        end
        object GridTableView1Table: TcxGridColumn
          Caption = #53580#51060#48660
          DataBinding.FieldName = 'NM_TABLE'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 84
        end
        object GridTableView1PosNo: TcxGridColumn
          Caption = 'POS'
          DataBinding.FieldName = 'NO_POS'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
        end
        object GridTableView1Channel: TcxGridColumn
          Caption = #52292#45328
          DataBinding.FieldName = 'NO_CHANNEL'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 346
    Top = 179
    Width = 594
    Height = 400
    Enabled = True
    ExplicitLeft = 346
    ExplicitTop = 179
    ExplicitWidth = 594
    ExplicitHeight = 400
    object AxVEC: TAxVECForm
      Left = 0
      Top = 0
      Width = 594
      Height = 400
      ParentColor = False
      ParentFont = False
      Align = alClient
      TabOrder = 0
      ExplicitLeft = -3
      ExplicitTop = 6
      ExplicitWidth = 651
      ExplicitHeight = 338
      ControlData = {
        545046300E544178564543466F726D496D706C094178564543466F726D0D5069
        78656C73506572496E636802600A54657874486569676874020D0000}
    end
  end
  object DetailSearchPanel: TAdvPanel [5]
    Left = 0
    Top = 65
    Width = 940
    Height = 114
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
    Version = '2.5.5.1'
    AutoHideChildren = False
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
    Caption.Text = 'CCTV '#49345#49464#44160#49353#51012' '#50896#54616#49884#47732' '#50668#44592#47484' '#53364#47533#54616#49901#49884#50724'.'
    Caption.Visible = True
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
    FullHeight = 92
    object DetailPanel: TPanel
      Left = 1
      Top = 19
      Width = 938
      Height = 94
      Align = alClient
      ParentColor = True
      TabOrder = 0
      object Label2: TLabel
        Left = 134
        Top = 37
        Width = 19
        Height = 17
        Caption = 'PW'
        Transparent = True
      end
      object Label110: TLabel
        Left = 9
        Top = 36
        Width = 27
        Height = 17
        Caption = 'User'
        Transparent = True
      end
      object Label109: TLabel
        Left = 17
        Top = 10
        Width = 16
        Height = 17
        Caption = ' IP'
        Transparent = True
      end
      object ControlPanel: TPanel
        Left = 230
        Top = 0
        Width = 687
        Height = 92
        BevelOuter = bvNone
        Enabled = False
        ParentColor = True
        TabOrder = 0
        object Label3: TLabel
          Left = 26
          Top = 9
          Width = 39
          Height = 17
          Caption = #49892#49884#44036
          Transparent = True
        end
        object Label4: TLabel
          Left = 298
          Top = 37
          Width = 13
          Height = 17
          Caption = #48516
          Transparent = True
        end
        object Label5: TLabel
          Left = 13
          Top = 37
          Width = 52
          Height = 17
          Caption = #51116#49373#51068#49884
          Transparent = True
        end
        object ConditionSearchDateEdit: TcxDateEdit
          Tag = 99
          Left = 71
          Top = 33
          AutoSize = False
          EditValue = 41425.6770833333d
          ParentFont = False
          Properties.DateButtons = [btnClear, btnNow, btnToday]
          Properties.Kind = ckDateTime
          Style.StyleController = EditStyleController
          TabOrder = 0
          Height = 25
          Width = 174
        end
        object MinuteSpinEdit: TcxSpinEdit
          Tag = 99
          Left = 247
          Top = 33
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.MaxValue = 60.000000000000000000
          Properties.MinValue = 1.000000000000000000
          Style.StyleController = EditStyleController
          TabOrder = 1
          Value = 3
          Width = 43
        end
        object PlayButton: TcxButton
          Left = 71
          Top = 62
          Width = 79
          Height = 26
          Caption = 'Play'
          LookAndFeel.Kind = lfOffice11
          TabOrder = 2
          OnClick = PlayButtonClick
        end
        object LiveButton: TcxButton
          Left = 71
          Top = 4
          Width = 79
          Height = 26
          Caption = 'LIVE'
          LookAndFeel.Kind = lfOffice11
          TabOrder = 3
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          OnClick = LiveButtonClick
        end
        object TimeSyncButton: TcxButton
          Left = 463
          Top = 36
          Width = 80
          Height = 26
          Caption = #49884#44036#46041#44592#54868
          LookAndFeel.Kind = lfOffice11
          TabOrder = 4
          OnClick = TimeSyncButtonClick
        end
        object LiveStopButton: TcxButton
          Left = 154
          Top = 4
          Width = 79
          Height = 26
          Caption = 'Live Stop'
          LookAndFeel.Kind = lfOffice11
          TabOrder = 5
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          OnClick = LiveStopButtonClick
        end
        object FastButton: TcxButton
          Left = 265
          Top = 62
          Width = 68
          Height = 26
          Caption = #9654#9654
          LookAndFeel.Kind = lfOffice11
          TabOrder = 6
          OnClick = FastButtonClick
        end
        object StopButton: TcxButton
          Left = 154
          Top = 62
          Width = 79
          Height = 26
          Caption = 'Stop'
          LookAndFeel.Kind = lfOffice11
          TabOrder = 7
          OnClick = StopButtonClick
        end
        object Show22Button: TcxButton
          Left = 293
          Top = 4
          Width = 79
          Height = 26
          Caption = '2X2 '#48372#44592
          LookAndFeel.Kind = lfOffice11
          TabOrder = 8
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          OnClick = Show22ButtonClick
        end
        object Show33Button: TcxButton
          Left = 378
          Top = 4
          Width = 79
          Height = 26
          Caption = '3X3 '#48372#44592
          LookAndFeel.Kind = lfOffice11
          TabOrder = 9
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          OnClick = Show33ButtonClick
        end
        object Show44Button: TcxButton
          Left = 463
          Top = 4
          Width = 79
          Height = 26
          Caption = '4X4 '#48372#44592
          LookAndFeel.Kind = lfOffice11
          TabOrder = 10
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          OnClick = Show44ButtonClick
        end
        object PauseButton: TcxButton
          Left = 334
          Top = 62
          Width = 68
          Height = 26
          Caption = '| |'
          LookAndFeel.Kind = lfOffice11
          TabOrder = 11
          OnClick = PauseButtonClick
        end
        object SlowButton: TcxButton
          Left = 404
          Top = 62
          Width = 68
          Height = 26
          Caption = #9654
          LookAndFeel.Kind = lfOffice11
          TabOrder = 12
          OnClick = SlowButtonClick
        end
      end
      object LoginInButton: TcxButton
        Left = 43
        Top = 63
        Width = 79
        Height = 26
        Caption = #47196#44536#51064
        LookAndFeel.Kind = lfOffice11
        TabOrder = 1
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        OnClick = LoginInButtonClick
      end
      object PwdEdit: TcxTextEdit
        Tag = 99
        Left = 159
        Top = 34
        ImeMode = imDisable
        ParentFont = False
        Properties.EchoMode = eemPassword
        Properties.ImeMode = imDisable
        Properties.MaxLength = 30
        Properties.PasswordChar = '*'
        Style.StyleController = EditStyleController
        TabOrder = 2
        Text = '12345'
        Width = 65
      end
      object UserIDEdit: TcxTextEdit
        Tag = 99
        Left = 43
        Top = 34
        ImeMode = imDisable
        ParentFont = False
        Properties.ImeMode = imDisable
        Properties.MaxLength = 30
        Style.StyleController = EditStyleController
        TabOrder = 3
        Text = 'admin'
        Width = 78
      end
      object VecPortEdit: TcxCurrencyEdit
        Tag = 99
        Left = 183
        Top = 6
        EditValue = 8000
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '#0'
        Properties.UseDisplayFormatWhenEditing = True
        Properties.UseLeftAlignmentOnEditing = False
        Style.StyleController = EditStyleController
        TabOrder = 4
        Width = 41
      end
      object VecIPEdit: TcxTextEdit
        Tag = 99
        Left = 43
        Top = 6
        ImeMode = imDisable
        ParentFont = False
        Properties.ImeMode = imDisable
        Properties.MaxLength = 30
        Style.StyleController = EditStyleController
        TabOrder = 5
        Width = 134
      end
    end
  end
  inherited EditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  object Save_Timer: TTimer
    Enabled = False
    Left = 231
    Top = 34
  end
end
