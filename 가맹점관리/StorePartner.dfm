inherited StorePartnerForm: TStorePartnerForm
  Caption = #54801#47141#49324#44288#47532
  ClientHeight = 894
  ClientWidth = 1111
  ExplicitWidth = 1127
  ExplicitHeight = 933
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 316
    Height = 829
    ExplicitLeft = 258
    ExplicitHeight = 582
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1111
    ExplicitWidth = 1111
    inherited ConditionToolBar: TAdvToolBar
      Width = 563
      ExplicitWidth = 563
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
        Properties.Alignment.Horz = taCenter
        Properties.Items.Strings = (
          #51221#49345
          #54644#51648
          #51204#52404)
        Text = #51221#49345
        Visible = True
        ExplicitWidth = 75
        Width = 75
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 405
        Visible = True
        ExplicitLeft = 405
        ExplicitWidth = 154
        Width = 154
      end
    end
  end
  inherited GridPanel: TPanel
    Width = 316
    Height = 829
    ExplicitWidth = 316
    ExplicitHeight = 829
    inherited Grid: TcxGrid
      Width = 310
      Height = 823
      ExplicitWidth = 310
      ExplicitHeight = 823
      inherited GridTableView: TcxGridTableView
        object GridTableViewPartnerCode: TcxGridColumn
          Caption = #54801#47141#49324#53076#46300
          DataBinding.FieldName = 'CD_PARTNER'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 77
        end
        object GridTableViewPartnerName: TcxGridColumn
          Caption = #54801#47141#49324#47749
          DataBinding.FieldName = 'NM_PARTNER'
          HeaderAlignmentHorz = taCenter
          Width = 200
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 322
    Width = 789
    Height = 829
    ExplicitLeft = 322
    ExplicitWidth = 789
    ExplicitHeight = 829
    object AdvOfficePager1: TcxPageControl
      Left = 0
      Top = 0
      Width = 789
      Height = 829
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = cxTabSheet1
      Properties.CustomButtons.Buttons = <>
      Properties.TabWidth = 120
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      ClientRectBottom = 829
      ClientRectRight = 789
      ClientRectTop = 28
      object cxTabSheet1: TcxTabSheet
        Caption = #54801#47141#49324#51221#48372
        ImageIndex = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object GoodsCodeLabel: TLabel
          Left = 11
          Top = 12
          Width = 65
          Height = 17
          Caption = #54801#47141#49324#53076#46300
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object GoodsNameLabel: TLabel
          Left = 12
          Top = 41
          Width = 65
          Height = 17
          Caption = #54801#47141#49324#51060#47492
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object CEONameLabel: TLabel
          Left = 256
          Top = 129
          Width = 52
          Height = 17
          Caption = #45824#54364#51088#47749
          Transparent = True
        end
        object IDNoLabel: TLabel
          Left = 11
          Top = 128
          Width = 65
          Height = 17
          Caption = #49324#50629#51088#48264#54840
          Transparent = True
        end
        object TelNoLabel: TLabel
          Left = 24
          Top = 156
          Width = 52
          Height = 17
          Caption = #54924#49324#51204#54868
          Transparent = True
        end
        object AddrLabel: TLabel
          Left = 24
          Top = 215
          Width = 52
          Height = 17
          Caption = #51452#12288#12288#49548
          Transparent = True
        end
        object UseYNLabel: TLabel
          Left = 26
          Top = 563
          Width = 52
          Height = 17
          Caption = #49324#50857#50668#48512
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object RemarkLabel: TLabel
          Left = 24
          Top = 447
          Width = 52
          Height = 17
          Caption = #48708#12288#12288#44256
          Transparent = True
        end
        object Label1: TLabel
          Left = 24
          Top = 335
          Width = 52
          Height = 17
          Caption = #54532#47532#54589#49828
          Transparent = True
        end
        object EnterDateLabel: TLabel
          Left = 26
          Top = 532
          Width = 52
          Height = 17
          Caption = #44228#50557#51068#51088
          Transparent = True
        end
        object RetireDateLabel: TLabel
          Left = 250
          Top = 534
          Width = 52
          Height = 17
          Caption = #54644#51648#51068#51088
          Transparent = True
        end
        object Label4: TLabel
          Left = 24
          Top = 305
          Width = 49
          Height = 17
          Caption = #45812' '#45817' '#51088
          Transparent = True
        end
        object Label5: TLabel
          Left = 232
          Top = 306
          Width = 52
          Height = 17
          Caption = #45812#45817#51204#54868
          Transparent = True
        end
        object Label6: TLabel
          Left = 232
          Top = 156
          Width = 78
          Height = 17
          Caption = #45824#54364#55092#45824#48264#54840
          Transparent = True
        end
        object Label7: TLabel
          Left = 24
          Top = 185
          Width = 52
          Height = 17
          Caption = #54057#49828#51204#54868
          Transparent = True
        end
        object Label8: TLabel
          Left = 24
          Top = 275
          Width = 49
          Height = 17
          Caption = #51060' '#47700' '#51068
          Transparent = True
        end
        object Label9: TLabel
          Left = 232
          Top = 336
          Width = 52
          Height = 17
          Caption = #44208#51228#51068#51088
          Transparent = True
        end
        object AppIDLabel: TLabel
          Left = 23
          Top = 72
          Width = 52
          Height = 17
          Alignment = taRightJustify
          Caption = #47196#44536#51064'ID'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object AppPWDLabel: TLabel
          Left = 26
          Top = 100
          Width = 52
          Height = 17
          Alignment = taRightJustify
          Caption = #48708#48128#48264#54840
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label12: TLabel
          Left = 250
          Top = 564
          Width = 83
          Height = 17
          Caption = #49888#44508#47588#51109' '#52628#44032
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label17: TLabel
          Left = 232
          Top = 185
          Width = 78
          Height = 17
          Caption = #51064#51613#51204#50857#48264#54840
          Transparent = True
        end
        object Label33: TLabel
          Left = 25
          Top = 500
          Width = 52
          Height = 17
          Caption = #54252#49828#44277#51648
          Transparent = True
        end
        object PartnerCodeEdit: TcxTextEdit
          Left = 84
          Top = 9
          Enabled = False
          ParentFont = False
          Properties.ImeMode = imDisable
          Properties.MaxLength = 14
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 76
        end
        object PartnerNameEdit: TcxTextEdit
          Left = 84
          Top = 38
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 150
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 309
        end
        object CEONameEdit: TcxTextEdit
          Left = 316
          Top = 126
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 20
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 2
          Width = 120
        end
        object BizNoEdit: TcxMaskEdit
          Left = 84
          Top = 125
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.EditMask = '999\-99\-99999;1;_'
          Properties.MaxLength = 0
          Properties.ValidateOnEnter = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 3
          Text = '   -  -     '
          Width = 120
        end
        object OfficeTelEdit: TcxTextEdit
          Left = 84
          Top = 153
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 13
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 4
          OnExit = CeoMobileTelEditExit
          Width = 120
        end
        object ZipCodeEdit: TcxButtonEdit
          Left = 84
          Top = 212
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ClickKey = 112
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 0
          Properties.OnButtonClick = ZipCodeEditPropertiesButtonClick
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 5
          Width = 76
        end
        object Addr1Edit: TcxTextEdit
          Left = 162
          Top = 212
          TabStop = False
          ParentFont = False
          Properties.MaxLength = 80
          Properties.ReadOnly = True
          Style.Color = 14737632
          Style.StyleController = EditStyleController
          StyleFocused.Color = 14737632
          TabOrder = 6
          Width = 392
        end
        object Addr2Edit: TcxTextEdit
          Left = 162
          Top = 241
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 7
          Width = 392
        end
        object UseYNComboBox: TcxComboBox
          Left = 84
          Top = 560
          Hint = 'DS_STATUS'
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 8
          Text = #49324#50857
          Width = 120
        end
        object RemarkMemo: TcxMemo
          Left = 84
          Top = 444
          Hint = 'REMARK'
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 100
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 9
          Height = 45
          Width = 470
        end
        object PrefixEdit: TcxTextEdit
          Left = 84
          Top = 332
          ParentFont = False
          Properties.ImeMode = imDisable
          Properties.MaxLength = 2
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 10
          Width = 47
        end
        object PosGroupBox: TcxGroupBox
          Left = 24
          Top = 374
          Caption = #51452#47928#54252#49828
          TabOrder = 11
          Height = 58
          Width = 522
          object DisplaySeqLabel: TLabel
            Left = 22
            Top = 27
            Width = 52
            Height = 17
            Caption = #44396#47588#49688#47049
            Transparent = True
          end
          object Label2: TLabel
            Left = 162
            Top = 27
            Width = 52
            Height = 17
            Caption = #49324#50857#49688#47049
            Transparent = True
          end
          object Label3: TLabel
            Left = 291
            Top = 27
            Width = 78
            Height = 17
            Caption = #49324#50857#44032#45733#49688#47049
            Transparent = True
          end
          object PosCountEdit: TcxSpinEdit
            Left = 80
            Top = 22
            Enabled = False
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 1000.000000000000000000
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 0
            Width = 55
          end
          object UseCountEdit: TcxSpinEdit
            Left = 222
            Top = 22
            Enabled = False
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 100.000000000000000000
            Properties.ReadOnly = True
            Style.StyleController = EditStyleController
            TabOrder = 1
            Width = 55
          end
          object PossibleEdit: TcxSpinEdit
            Left = 383
            Top = 22
            Enabled = False
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 100.000000000000000000
            Properties.ReadOnly = True
            Style.StyleController = EditStyleController
            TabOrder = 2
            Width = 55
          end
          object OrderPosAddButton: TAdvGlassButton
            Left = 445
            Top = 21
            Width = 65
            Height = 27
            BackColor = clBlack
            Caption = #52628#44032
            CornerRadius = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            ForeColor = clWhite
            GlowColor = 16760205
            ImageIndex = -1
            InnerBorderColor = clBlack
            OuterBorderColor = clWhite
            ParentFont = False
            ShineColor = clWhite
            TabOrder = 3
            Version = '1.3.3.0'
            OnClick = OrderPosAddButtonClick
          end
        end
        object EnterDateEdit: TcxDateEdit
          Left = 84
          Top = 529
          ParentFont = False
          Properties.DateButtons = [btnClear, btnNow]
          Properties.ImeMode = imSAlpha
          Properties.ImmediatePost = True
          Properties.UseNullString = True
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 12
          Width = 120
        end
        object RetireDateEdit: TcxDateEdit
          Left = 308
          Top = 529
          ParentFont = False
          Properties.DateButtons = [btnClear, btnNow]
          Properties.ImeMode = imSAlpha
          Properties.UseNullString = True
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 13
          Width = 120
        end
        object DamdangNameEdit: TcxTextEdit
          Left = 84
          Top = 302
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 50
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 14
          Width = 120
        end
        object DamdangMobileEdit: TcxTextEdit
          Left = 292
          Top = 302
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 13
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 15
          OnExit = CeoMobileTelEditExit
          Width = 120
        end
        object CeoMobileTelEdit: TcxTextEdit
          Left = 316
          Top = 154
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 13
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 16
          OnExit = CeoMobileTelEditExit
          Width = 120
        end
        object Option1CheckBox: TcxCheckBox
          Left = 432
          Top = 336
          Hint = 'YN_USE'
          Caption = ' '#44277#54637#44277#49324
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 17
        end
        object FaxTelEdit: TcxTextEdit
          Left = 84
          Top = 182
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 13
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 18
          OnExit = CeoMobileTelEditExit
          Width = 120
        end
        object EmailEdit: TcxTextEdit
          Left = 84
          Top = 272
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 150
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 19
          Width = 309
        end
        object PayDayEdit: TcxSpinEdit
          Left = 292
          Top = 333
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.AssignedValues.MinValue = True
          Properties.MaxValue = 31.000000000000000000
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 20
          Width = 55
        end
        object UserIDEdit: TcxTextEdit
          Left = 84
          Top = 67
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 20
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 21
          Width = 120
        end
        object IDDupCheckButton: TAdvGlassButton
          Left = 209
          Top = 66
          Width = 65
          Height = 27
          BackColor = clBlack
          Caption = #51473#48373#52404#53356
          CornerRadius = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ForeColor = clWhite
          GlowColor = 16760205
          ImageIndex = -1
          InnerBorderColor = clBlack
          OuterBorderColor = clWhite
          ParentFont = False
          ShineColor = clWhite
          TabOrder = 22
          Version = '1.3.3.0'
          OnClick = IDDupCheckButtonClick
        end
        object AppPWDEdit: TcxTextEdit
          Left = 84
          Top = 96
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 30
          Properties.PasswordChar = '*'
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 23
          Width = 120
        end
        object NewStoreComboBox: TcxComboBox
          Left = 339
          Top = 560
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #44032#45733
            #52628#44032#50504#46120)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 24
          Text = #44032#45733
          Width = 89
        end
        object AuthTelNoEdit: TcxTextEdit
          Left = 316
          Top = 183
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 50
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 25
          Width = 238
        end
        object PosNoticeComboBox: TcxComboBox
          Left = 84
          Top = 496
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #44036#54200#47700#45684#50620
            #54801#47141#49324#44277#51648)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 26
          Width = 138
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = #51452#47928#54252#49828#49324#50857
        ImageIndex = 1
        OnShow = cxTabSheet2Show
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Grid1: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 783
          Height = 795
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
          object OrderPosUseTableView: TcxGridTableView
            Tag = 99
            Navigator.Buttons.CustomButtons = <>
            FilterBox.CustomizeDialog = False
            FilterBox.Visible = fvNever
            ScrollbarAnnotations.CustomAnnotations = <>
            DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = ',0'#44148
                Kind = skCount
                Column = OrderPosUseTableViewStoreName
              end
              item
                Format = ',0'
                Kind = skSum
              end
              item
                Format = ',0'
                Kind = skSum
              end
              item
                Format = ',0'
                Kind = skSum
              end
              item
                Format = ',0'
                Kind = skSum
              end
              item
                Format = ',0'
                Kind = skSum
              end
              item
                Format = ',0'
                Kind = skSum
              end
              item
                Format = ',0'
                Kind = skSum
                Column = OrderPosUseTableViewPosCount
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnMoving = False
            OptionsData.Deleting = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.ShowEditButtons = gsebForFocusedRecord
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            Styles.ContentEven = StyleEven
            object OrderPosUseTableViewStoreCode: TcxGridColumn
              Caption = #47588#51109#53076#46300
              DataBinding.FieldName = 'CD_CUSTOMER'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 102
            end
            object OrderPosUseTableViewStoreName: TcxGridColumn
              Caption = #47588#51109#47749
              DataBinding.FieldName = 'NM_CUSTOMER'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taLeftJustify
              FooterAlignmentHorz = taRightJustify
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Width = 253
            end
            object OrderPosUseTableViewPosCount: TcxGridColumn
              Caption = #52628#44032' '#54252#49828#49688#47049
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'ALLOW_POS'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0'
              FooterAlignmentHorz = taRightJustify
              HeaderAlignmentHorz = taCenter
              Width = 102
            end
          end
          object GridLevel1: TcxGridLevel
            GridView = OrderPosUseTableView
          end
        end
      end
      object cxTabSheet3: TcxTabSheet
        Caption = #51452#47928#54252#49828#46321#47197' '#51060#47141
        ImageIndex = 2
        OnShow = cxTabSheet3Show
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object cxGrid1: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 783
          Height = 795
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
          object ChangeGridTableView: TcxGridTableView
            Tag = 99
            Navigator.Buttons.CustomButtons = <>
            FilterBox.CustomizeDialog = False
            FilterBox.Visible = fvNever
            ScrollbarAnnotations.CustomAnnotations = <>
            DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = ',0'
                Kind = skSum
                Column = cxGridColumn2
              end
              item
                Format = ',0'
                Kind = skSum
              end
              item
                Format = ',0'
                Kind = skSum
              end
              item
                Format = ',0'
                Kind = skSum
              end
              item
                Format = ',0'
                Kind = skSum
              end
              item
                Format = ',0'
                Kind = skSum
              end
              item
                Format = ',0'
                Kind = skSum
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnMoving = False
            OptionsData.Deleting = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.ShowEditButtons = gsebForFocusedRecord
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            Styles.ContentEven = StyleEven
            object cxGridColumn1: TcxGridColumn
              Caption = #46321#47197#51068#51088
              DataBinding.FieldName = 'YMD_INSERT'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 134
            end
            object cxGridColumn2: TcxGridColumn
              Caption = #46321#47197#49688#47049
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'POS_COUNT'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0'
              FooterAlignmentHorz = taRightJustify
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Width = 82
            end
            object ChangeGridTableViewColumn1: TcxGridColumn
              Caption = #48708'   '#44256
              DataBinding.FieldName = 'REMARK'
              PropertiesClassName = 'TcxMemoProperties'
              HeaderAlignmentHorz = taCenter
              Width = 266
            end
            object cxGridColumn3: TcxGridColumn
              Caption = #46321#47197#49324#50857#51088
              DataBinding.FieldName = 'ID_USER'
              PropertiesClassName = 'TcxLabelProperties'
              FooterAlignmentHorz = taRightJustify
              HeaderAlignmentHorz = taCenter
              Width = 102
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = ChangeGridTableView
          end
        end
      end
      object cxTabSheet4: TcxTabSheet
        Caption = #47928#51088#52649#51204#45236#50669
        ImageIndex = 3
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object cxGrid2: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 783
          Height = 795
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
          object cxGridTableView1: TcxGridTableView
            Tag = 99
            Navigator.Buttons.CustomButtons = <>
            FilterBox.CustomizeDialog = False
            FilterBox.Visible = fvNever
            ScrollbarAnnotations.CustomAnnotations = <>
            DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = ',0'
                Kind = skSum
                Column = cxGridColumn5
              end
              item
                Format = ',0'
                Kind = skSum
              end
              item
                Format = ',0'
                Kind = skSum
              end
              item
                Format = ',0'
                Kind = skSum
              end
              item
                Format = ',0'
                Kind = skSum
              end
              item
                Format = ',0'
                Kind = skSum
              end
              item
                Format = ',0'
                Kind = skSum
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnMoving = False
            OptionsData.Deleting = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.ShowEditButtons = gsebForFocusedRecord
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            Styles.ContentEven = StyleEven
            object cxGridColumn4: TcxGridColumn
              Caption = #52649#51204#51068#51088
              DataBinding.FieldName = 'YMD_INSERT'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 172
            end
            object cxGridColumn5: TcxGridColumn
              Caption = #52649#51204#44552#50529
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'POS_COUNT'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0'
              FooterAlignmentHorz = taRightJustify
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Width = 119
            end
            object cxGridColumn6: TcxGridColumn
              Caption = #46321#47197#49324#50857#51088
              DataBinding.FieldName = 'ID_USER'
              PropertiesClassName = 'TcxLabelProperties'
              FooterAlignmentHorz = taRightJustify
              HeaderAlignmentHorz = taCenter
              Width = 119
            end
          end
          object cxGridLevel2: TcxGridLevel
            GridView = cxGridTableView1
          end
        end
      end
      object cxTabSheet5: TcxTabSheet
        Caption = #47131#52768#50724#45908
        ImageIndex = 4
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label13: TLabel
          Left = 24
          Top = 54
          Width = 39
          Height = 17
          Caption = #49688#49688#47308
          Transparent = True
        end
        object Label14: TLabel
          Left = 22
          Top = 85
          Width = 52
          Height = 17
          Caption = #44228#50557#51068#51088
          Transparent = True
        end
        object Label15: TLabel
          Left = 22
          Top = 118
          Width = 52
          Height = 17
          Caption = #54644#51648#51068#51088
          Transparent = True
        end
        object Label16: TLabel
          Left = 138
          Top = 55
          Width = 11
          Height = 17
          Caption = '%'
          Transparent = True
        end
        object Option2CheckBox: TcxCheckBox
          Left = 20
          Top = 19
          TabStop = False
          Caption = ' '#47131#52768#50724#45908' '#49324#50857
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 0
        end
        object LetsOrderRateEdit: TcxCurrencyEdit
          Left = 80
          Top = 50
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
          ShowHint = True
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 52
        end
        object LetsOrderEnderDateEdit: TcxDateEdit
          Left = 80
          Top = 82
          ParentFont = False
          Properties.DateButtons = [btnClear, btnNow]
          Properties.ImeMode = imSAlpha
          Properties.UseNullString = True
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 2
          Width = 120
        end
        object LetsOrderRetireDateEdit: TcxDateEdit
          Left = 80
          Top = 113
          ParentFont = False
          Properties.DateButtons = [btnClear, btnNow]
          Properties.ImeMode = imSAlpha
          Properties.UseNullString = True
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 3
          Width = 120
        end
      end
      object CloudUsePage: TcxTabSheet
        Caption = 'DB '#49324#50857#54788#54889
        ImageIndex = 5
        OnShow = CloudUsePageShow
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label20: TLabel
          Left = 29
          Top = 79
          Width = 110
          Height = 17
          Caption = 'Use DataBase Size'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label21: TLabel
          Left = 29
          Top = 47
          Width = 95
          Height = 17
          Caption = 'DataBase Name'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label22: TLabel
          Left = 29
          Top = 18
          Width = 94
          Height = 17
          Caption = 'Cloud '#44228#50557' Size'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label23: TLabel
          Left = 212
          Top = 15
          Width = 17
          Height = 17
          Caption = 'GB'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label24: TLabel
          Left = 212
          Top = 79
          Width = 17
          Height = 17
          Caption = 'GB'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object CloudUseSizeEdit: TcxCurrencyEdit
          Left = 150
          Top = 74
          EditValue = 0.000000000000000000
          ParentFont = False
          ParentShowHint = False
          Properties.Alignment.Horz = taRightJustify
          Properties.AssignedValues.MaxValue = True
          Properties.AssignedValues.MinValue = True
          Properties.DecimalPlaces = 2
          Properties.DisplayFormat = '0.00'
          Properties.EditFormat = '#.00'
          Properties.ImeMode = imDisable
          Properties.Nullable = False
          Properties.ReadOnly = True
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = EditPropertiesChange
          ShowHint = True
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 52
        end
        object CloudDBNameEdit: TcxTextEdit
          Left = 150
          Top = 43
          TabStop = False
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 136
        end
        object CloudSizeEdit: TcxCurrencyEdit
          Left = 150
          Top = 12
          EditValue = 0.000000000000000000
          ParentFont = False
          ParentShowHint = False
          Properties.Alignment.Horz = taRightJustify
          Properties.AssignedValues.MaxValue = True
          Properties.AssignedValues.MinValue = True
          Properties.DecimalPlaces = 2
          Properties.DisplayFormat = '0.00'
          Properties.EditFormat = '#.00'
          Properties.ImeMode = imDisable
          Properties.Nullable = False
          Properties.ReadOnly = True
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = EditPropertiesChange
          ShowHint = True
          Style.StyleController = EditStyleController
          TabOrder = 2
          Width = 52
        end
        object cxGroupBox1: TcxGroupBox
          Left = 26
          Top = 128
          Caption = #53580#51060#48660#48324' '#49324#50857' '#54788#54889
          TabOrder = 3
          Height = 456
          Width = 522
          object cxGrid3: TcxGrid
            AlignWithMargins = True
            Left = 14
            Top = 31
            Width = 512
            Height = 426
            TabOrder = 0
            LookAndFeel.Kind = lfOffice11
            LookAndFeel.NativeStyle = False
            object CloudDBTableView: TcxGridTableView
              Tag = 99
              Navigator.Buttons.CustomButtons = <>
              FilterBox.CustomizeDialog = False
              FilterBox.Visible = fvNever
              ScrollbarAnnotations.CustomAnnotations = <>
              DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = ',0'
                  Kind = skSum
                end
                item
                  Format = ',0'
                  Kind = skSum
                end
                item
                  Format = ',0'
                  Kind = skSum
                end
                item
                  Format = ',0'
                  Kind = skSum
                end
                item
                  Format = ',0'
                  Kind = skSum
                end
                item
                  Format = ',0'
                  Kind = skSum
                end
                item
                  Format = ',0.00 GB'
                  Kind = skSum
                  Column = CloudDBTableViewSize
                end>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.FocusCellOnTab = True
              OptionsBehavior.GoToNextCellOnEnter = True
              OptionsBehavior.FocusCellOnCycle = True
              OptionsCustomize.ColumnGrouping = False
              OptionsCustomize.ColumnMoving = False
              OptionsData.Deleting = False
              OptionsData.Inserting = False
              OptionsSelection.CellSelect = False
              OptionsView.ShowEditButtons = gsebForFocusedRecord
              OptionsView.Footer = True
              OptionsView.GroupByBox = False
              Styles.ContentEven = StyleEven
              object CloudDBTableViewNo: TcxGridColumn
                Caption = 'NO'
                DataBinding.FieldName = 'SEQ'
                PropertiesClassName = 'TcxLabelProperties'
                Properties.Alignment.Horz = taCenter
                HeaderAlignmentHorz = taCenter
                Width = 59
              end
              object CloudDBTableViewTableName: TcxGridColumn
                Caption = 'Table Name'
                DataBinding.FieldName = 'table_name'
                PropertiesClassName = 'TcxLabelProperties'
                Properties.Alignment.Horz = taLeftJustify
                HeaderAlignmentHorz = taCenter
                Options.Editing = False
                Options.Filtering = False
                Options.Focusing = False
                Width = 253
              end
              object CloudDBTableViewSize: TcxGridColumn
                Caption = 'Size(GB)'
                DataBinding.ValueType = 'Currency'
                DataBinding.FieldName = 'DB_SIZE'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.DecimalPlaces = 2
                Properties.DisplayFormat = ',0.00'
                FooterAlignmentHorz = taRightJustify
                HeaderAlignmentHorz = taCenter
                Width = 102
              end
            end
            object cxGridLevel3: TcxGridLevel
              GridView = CloudDBTableView
            end
          end
        end
        object cxGroupBox2: TcxGroupBox
          Left = 405
          Top = 11
          Caption = #47588#51109' '#54788#54889
          Enabled = False
          TabOrder = 4
          Height = 109
          Width = 143
          object Label25: TLabel
            Left = 22
            Top = 26
            Width = 26
            Height = 17
            Caption = #51204#52404
            Transparent = True
          end
          object Label26: TLabel
            Left = 23
            Top = 54
            Width = 26
            Height = 17
            Caption = #49324#50857
            Transparent = True
          end
          object Label27: TLabel
            Left = 24
            Top = 81
            Width = 26
            Height = 17
            Caption = #54224#50629
            Transparent = True
          end
          object TotalStoreEdit: TcxCurrencyEdit
            Left = 76
            Top = 21
            EditValue = 0.000000000000000000
            ParentFont = False
            ParentShowHint = False
            Properties.Alignment.Horz = taRightJustify
            Properties.AssignedValues.MaxValue = True
            Properties.AssignedValues.MinValue = True
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0'
            Properties.EditFormat = ',0'
            Properties.ImeMode = imDisable
            Properties.Nullable = False
            Properties.ReadOnly = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            ShowHint = True
            Style.StyleController = EditStyleController
            TabOrder = 0
            Width = 38
          end
          object UseStoreEdit: TcxCurrencyEdit
            Left = 76
            Top = 49
            EditValue = 0.000000000000000000
            ParentFont = False
            ParentShowHint = False
            Properties.Alignment.Horz = taRightJustify
            Properties.AssignedValues.MaxValue = True
            Properties.AssignedValues.MinValue = True
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0'
            Properties.EditFormat = ',0'
            Properties.ImeMode = imDisable
            Properties.Nullable = False
            Properties.ReadOnly = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            ShowHint = True
            Style.StyleController = EditStyleController
            TabOrder = 1
            Width = 38
          end
          object DisUseStoreEdit: TcxCurrencyEdit
            Left = 76
            Top = 78
            EditValue = 0.000000000000000000
            ParentFont = False
            ParentShowHint = False
            Properties.Alignment.Horz = taRightJustify
            Properties.AssignedValues.MaxValue = True
            Properties.AssignedValues.MinValue = True
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0'
            Properties.EditFormat = ',0'
            Properties.ImeMode = imDisable
            Properties.Nullable = False
            Properties.ReadOnly = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            ShowHint = True
            Style.StyleController = EditStyleController
            TabOrder = 2
            Width = 38
          end
        end
      end
    end
  end
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 21
  end
  object OrderPosAddPanel: TAdvPanel [5]
    Left = 148
    Top = 399
    Width = 378
    Height = 224
    Color = clWhite
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    UseDockManager = True
    Visible = False
    Version = '2.5.11.0'
    BorderColor = clBlack
    BorderWidth = 1
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.Font.Charset = HANGEUL_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -15
    Caption.Font.Name = #47569#51008' '#44256#46357
    Caption.Font.Style = [fsBold]
    Caption.Height = 30
    Caption.Indent = 1
    Caption.Text = '<P align="center">'#51452#47928#54252#49828' '#52628#44032'</P>'
    Caption.TopIndent = 3
    Caption.Visible = True
    ColorTo = clWhite
    DoubleBuffered = True
    Position.Key = 'SaleQuickShowForm'
    Position.Section = 'OrangeMenuPanel'
    ShadowOffset = 5
    ShowMoveCursor = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    DesignSize = (
      378
      224)
    FullHeight = 220
    object Label18: TLabel
      Left = 22
      Top = 46
      Width = 52
      Height = 17
      Caption = #52628#44032#49688#47049
      Transparent = True
    end
    object Label19: TLabel
      Left = 24
      Top = 79
      Width = 52
      Height = 17
      Caption = #48708#12288#12288#44256
      Transparent = True
    end
    object OrderPosCountEdit: TcxSpinEdit
      Left = 88
      Top = 41
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.MaxValue = 1000.000000000000000000
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 0
      Width = 55
    end
    object OrderPosAddMemo: TcxMemo
      Left = 88
      Top = 77
      Hint = 'REMARK'
      ParentFont = False
      Properties.ImeMode = imSHanguel
      Properties.MaxLength = 100
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 1
      Height = 52
      Width = 264
    end
    object OKButton: TAdvGlowButton
      Left = 103
      Top = 155
      Width = 83
      Height = 31
      Anchors = [akRight, akBottom]
      Caption = #51200#51109
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      DisabledPicture.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000026449444154388DB5943D
        68144118869F6FF7B2974A30909080A60A9253B8E3D8B93256D621812B246802
        76A2752258A508686AB10F5888A4486ACB9323B23FC589E7612A252468131B7F
        58B8FD2C32BBACE7E544D0B71976BE9987F7FD6666E11F4B461555D509C3F02A
        306BA73E1A63BA2292FE15B0DD6E4F789EB70EAC01D303E51360C7F3BCED6AB5
        7AFA47601CC7D7D334DD0526812EB02F22EFADE32BC01250013E8B48D3F7FDD6
        B9400B7B097C57D5BBC698E722A2C535AA2A711CAFA8EA53605C446E14A139D0
        C6EC011EB0608C7933AC1D99A228AAAA6A0BF8E179DE7C16DFC91694CBE50D60
        D23AFB0DD66EB7278ADFBEEF7754F53E309524C97A36EFD8188EAAAE025D63CC
        F3618ECAE5F26618868F54354F658C7906F48035557572601445D7806955DD1B
        EC59A6344D05D888E378EFE0E0E002805DBB07CC04415001285987974404C771
        0E0182207828222B45A0AA4EDB71B1542ABD0EC370D918D353D54311C175DDCB
        C0DB339B8E93B91A79D10B4A543519D8A3B9C3344D8F4484344DE7001A8DC616
        B055240441F004B807BC181B1BBB53ABD5BEDAD87300FD7EFF28EFA131A60B9C
        88C872B1E94589481F78E0FBFECD0C660F6209386E341ADD1C68DFE60E5089E3
        7865183049924D63CCE3E2A18561780B980776B2F9DC4DA7D3B99824498FB3DB
        BFE0FB7E675413E338AEA569DA02BEB9AE3B5FAFD7BFE40E01AAD5EAA9883481
        71556D0541707B587C5575822058B5300F6866B05F1C668AA2684155778129CE
        2EEDBE88F46CB9A2AA8B36E627A0698C7955DC3FF4006CFCECF73533503E0676
        5CD7DD2E3A1B091C885711915900D7753FD4EBF577E7BDA6FFA29F74F9170538
        BE751D0000000049454E44AE426082}
      FocusType = ftHot
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Picture.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA793000001C649444154388DCDD13F
        481B611806F0E7BB3BE35D4C1AD3A42655519142B142C1DAD2A09BA2AB741014
        1CEA226E82E2E66AA7E0D21228B86553B7A44B0B66AA37B4108A7430C484048D
        A1E0DF4BBDCBDD7D771D9498D034F28943DFED79E1FDC1F37DC03D0FA90EB31F
        9307CFBB1E188D0EBEA64E3A3990F18D8597895BF5C8E76CD6BE65DE7FC9DB2B
        5B7BE5371F9263F50C8EA90F008107DE8E3C71F4079DF17A283308003C47FE89
        0AAC58BA58C2F68F0200A0CBE774A40ACA27008E3B83E1E9BE9A6C1AE6E14655
        BE53E546F3FF813C47DAEE159C1BED765667E64F291B16A272114717143A059A
        79602AB21BA19AB2B4B938A4328165C3C26A3C078F3F80B6C762651F7AF868FE
        DB6E6660726D6784A972542EC2E30FC0E5146BF67D8166F2E259CF6B41728799
        C0A30BFA17F6AA9D60B09DC0EB16894B12434C950DEB06C99CDAE8F512F4B412
        C45216740AF04D9C87096CBAEE73AC02134F39283A104B59D0CCAB3D35AC7326
        B0C3C343D174644E1D302DE0D76FBB82A99A6E2B97AA5C0326F3E7643D914FD7
        C3388E0467863B5CEFE239B87D01E471F396AAA6DBDF7FEECB542B2D937AC78D
        66726D47122477B845124382C0B752939E2997AA4CB5D2F2E6E290FA071184BE
        EF3C66C5FA0000000049454E44AE426082}
      RepeatPause = 10
      Rounded = False
      TabOrder = 2
      OnClick = OKButtonClick
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
    object CloseButton: TAdvGlowButton
      Left = 205
      Top = 155
      Width = 83
      Height = 31
      Anchors = [akRight, akBottom]
      Caption = #45803#44592
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      DisabledPicture.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000026449444154388DB5943D
        68144118869F6FF7B2974A30909080A60A9253B8E3D8B93256D621812B246802
        76A2752258A508686AB10F5888A4486ACB9323B23FC589E7612A252468131B7F
        58B8FD2C32BBACE7E544D0B71976BE9987F7FD6666E11F4B461555D509C3F02A
        306BA73E1A63BA2292FE15B0DD6E4F789EB70EAC01D303E51360C7F3BCED6AB5
        7AFA47601CC7D7D334DD0526812EB02F22EFADE32BC01250013E8B48D3F7FDD6
        B9400B7B097C57D5BBC698E722A2C535AA2A711CAFA8EA53605C446E14A139D0
        C6EC011EB0608C7933AC1D99A228AAAA6A0BF8E179DE7C16DFC91694CBE50D60
        D23AFB0DD66EB7278ADFBEEF7754F53E309524C97A36EFD8188EAAAE025D63CC
        F3618ECAE5F26618868F54354F658C7906F48035557572601445D7806955DD1B
        EC59A6344D05D888E378EFE0E0E002805DBB07CC04415001285987974404C771
        0E0182207828222B45A0AA4EDB71B1542ABD0EC370D918D353D54311C175DDCB
        C0DB339B8E93B91A79D10B4A543519D8A3B9C3344D8F4484344DE7001A8DC616
        B055240441F004B807BC181B1BBB53ABD5BEDAD87300FD7EFF28EFA131A60B9C
        88C872B1E94589481F78E0FBFECD0C660F6209386E341ADD1C68DFE60E5089E3
        7865183049924D63CCE3E2A18561780B980776B2F9DC4DA7D3B99824498FB3DB
        BFE0FB7E675413E338AEA569DA02BEB9AE3B5FAFD7BFE40E01AAD5EAA9883481
        71556D0541707B587C5575822058B5300F6866B05F1C668AA2684155778129CE
        2EEDBE88F46CB9A2AA8B36E627A0698C7955DC3FF4006CFCECF73533503E0676
        5CD7DD2E3A1B091C885711915900D7753FD4EBF577E7BDA6FFA29F74F9170538
        BE751D0000000049454E44AE426082}
      FocusType = ftHot
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Picture.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000022549444154388DAD94CD
        4E135118869F6FCED0B2681A20113551D74517FE403110ACA134E20574ADF126
        9034C62046A92EB903F7DE8091526B1B135A886CA86C3506221B20C0A2ED9C39
        2E86C1E954FE12BEDD79CF9BE77C7F3970C121275D9A19ACFD6F4337AD96BA01
        E076E95FB1D1E5BACCE09E0BB83B39D2A7B49EC2F014B812BADEC4C807A7D9F5
        BEA752D93E15B8974EA604F98870E9A4EC812D17B2F142B57C2C702F9D4C89C8
        6720720ACC8FA60B9920F408B83B39D2A75A7AFD0C997564EA342209BF7CCB57
        95A39F87616A7018940A08CAD3DAA3DF8EB4A6FC8305DE3481276158777E9E68
        6ED6832A4534374B777EBE132AE6D921031BE0A032720B74DB34F5F7659CC54F
        D8138FC1B2C071B01F6670BE2EA25757C2595EDE2F2507A0B6660388DBBA66C4
        6AB7B82E8D77AF40043B3D0980532ED278F302B40E03118BEBC09A57B288E970
        1C39E5E4F33FDD80DF43657E77182C8BE8F40CF6F8239C72D12BFFC138D1DC6B
        B0ED0EBBD11EC306888D2ED70FCAC39BC055DFA0EE0E79B0D2028DB72F0F4585
        9D9AC0B97D0FBD520DE23662C55A1D027BB89FBE3F8798E9E0AB6A70D81B80DF
        33A550770643300033172BD4726DC09DB1B15E3BDA5C07FAFFDFA463E34F4B37
        13BD5F567720B0D83D95CAB60B59A0790E58C315C9FAB0362040BC502DBB9001
        B6CE92992B92892F2C5582A21576C50BD5B2D38824309207363B396603CC5C4B
        371361189CE5832D25072C31DE072BEA67ACB0F443E0F8BDBDE8F80B58A1CCAD
        5F2025160000000049454E44AE426082}
      RepeatPause = 10
      Rounded = False
      TabOrder = 3
      OnClick = CloseButtonClick
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
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
