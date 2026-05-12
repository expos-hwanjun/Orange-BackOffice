inherited SystemCodeForm: TSystemCodeForm
  Left = 300
  Top = 120
  Caption = #44277#53685#53076#46300' '#46321#47197
  ClientHeight = 1023
  ClientWidth = 969
  HelpFile = #54980#48169'/'#49884#49828#53596#44288#47532'/'#44277#53685#53076#46300#44288#47532'/'#44277#53685#53076#46300#44288#47532'.htm'
  ExplicitWidth = 985
  ExplicitHeight = 1062
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 398
    Height = 958
    ExplicitLeft = 398
    ExplicitTop = 65
    ExplicitHeight = 575
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 969
    ExplicitWidth = 969
    inherited ButtonToolBar: TAdvToolBar
      Left = 432
      ExplicitLeft = 432
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
  inherited GridPanel: TPanel
    Left = 148
    Height = 958
    ExplicitLeft = 148
    ExplicitHeight = 958
    inherited Grid: TcxGrid
      Height = 952
      ExplicitHeight = 952
      inherited GridTableView: TcxGridTableView
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0'#44148
            Kind = skCount
            Column = GridTableViewCode
          end>
        OptionsView.Footer = True
        Styles.OnGetContentStyle = GridTableViewStylesGetContentStyle
        object GridTableViewCode: TcxGridColumn
          Caption = #53076#46300
          DataBinding.FieldName = 'CD_CODE'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Width = 60
        end
        object GridTableViewName: TcxGridColumn
          Caption = #53076#46300#51060#47492
          DataBinding.FieldName = 'NM_CODE1'
          HeaderAlignmentHorz = taCenter
          Width = 160
        end
        object GridTableViewDsStatus: TcxGridColumn
          Tag = 99
          DataBinding.FieldName = 'DS_STATUS'
          Visible = False
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 404
    Width = 565
    Height = 958
    TabOrder = 1
    ExplicitLeft = 404
    ExplicitWidth = 565
    ExplicitHeight = 958
    object CodeLabel: TLabel
      Left = 20
      Top = 13
      Width = 52
      Height = 17
      Caption = #53076#12288#12288#46300
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object CodeEdit: TcxTextEdit
      Left = 80
      Top = 10
      ParentFont = False
      Properties.ImeMode = imDisable
      Properties.MaxLength = 3
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 0
      Width = 65
    end
    object Notebook: TNotebook
      Left = 20
      Top = 41
      Width = 535
      Height = 600
      PageIndex = 1
      TabOrder = 1
      object TPage
        Left = 0
        Top = 0
        Caption = 'POS'
        object POSNoLabel: TLabel
          Left = 0
          Top = 4
          Width = 51
          Height = 17
          Caption = 'POS'#48264#54840
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object POSIPLabel: TLabel
          Left = 0
          Top = 33
          Width = 53
          Height = 17
          Caption = 'I P '#51452' '#49548
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object POSRemarkLabel: TLabel
          Left = 0
          Top = 92
          Width = 52
          Height = 17
          Caption = #48708#12288#12288#44256
          Transparent = True
        end
        object POSTypeLabel: TLabel
          Left = -1
          Top = 62
          Width = 52
          Height = 17
          Caption = #54252#49828#44396#48516
          Transparent = True
        end
        object PosUseLabel: TLabel
          Left = 0
          Top = 123
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
        object POSUserNameLabel: TLabel
          Left = -1
          Top = 155
          Width = 49
          Height = 17
          Caption = #49324' '#50857' '#51088
          Transparent = True
          Visible = False
        end
        object POSPhoneNoLabel: TLabel
          Left = -1
          Top = 186
          Width = 52
          Height = 17
          Caption = #51204#54868#48264#54840
          Transparent = True
          Visible = False
        end
        object POSPrinterLabel: TLabel
          Left = 0
          Top = 219
          Width = 49
          Height = 17
          Caption = #51452' '#47928' '#49436
          Transparent = True
          Visible = False
        end
        object ServicePrintLabel: TLabel
          Left = -1
          Top = 250
          Width = 52
          Height = 17
          Caption = #54840#52636#52636#47141
          Transparent = True
          Visible = False
        end
        object PosUserComboBox: TcxComboBox
          Left = 186
          Top = 59
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #53580#51060#48660#51228
            #49440#48520#51228)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 3
          Text = #53580#51060#48660#51228
          Visible = False
          Width = 138
        end
        object POSStatusEdit: TcxTextEdit
          Left = 186
          Top = 59
          Enabled = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 10
          Text = #51221#49345
          Visible = False
          Width = 53
        end
        object POSNoEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imDisable
          Properties.MaxLength = 2
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 46
        end
        object POSIPEdit: TcxTextEdit
          Left = 60
          Top = 28
          ParentFont = False
          Properties.ImeMode = imDisable
          Properties.MaxLength = 15
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 120
        end
        object POSRemarkEdit: TcxTextEdit
          Left = 60
          Top = 89
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 5
          Width = 300
        end
        object POSTypeComboBox: TcxComboBox
          Left = 60
          Top = 59
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.DropDownListStyle = lsFixedList
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 2
          Width = 120
        end
        object POSType1ComboBox: TcxComboBox
          Left = 186
          Top = 58
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #53580#51060#48660#51228
            #49440#48520#51228)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 4
          Text = #53580#51060#48660#51228
          Width = 80
        end
        object PosUseComboBox: TcxComboBox
          Left = 60
          Top = 120
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 6
          Text = #49324#50857
          Width = 120
        end
        object POSUserNameEdit: TcxTextEdit
          Left = 60
          Top = 152
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 8
          Visible = False
          Width = 112
        end
        object POSPhoneNoEdit: TcxTextEdit
          Left = 60
          Top = 183
          Enabled = False
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 9
          Visible = False
          Width = 156
        end
        object VanGroupBox: TAdvGroupBox
          Left = -1
          Top = 311
          Width = 393
          Height = 228
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          Caption = ' Van'#51221#48372' '
          ParentCtl3D = True
          TabOrder = 7
          object VanLabel: TLabel
            Left = 8
            Top = 31
            Width = 45
            Height = 17
            Caption = 'VAN '#49324
            Transparent = True
          end
          object VanTIDLabel: TLabel
            Left = 7
            Top = 64
            Width = 52
            Height = 17
            Caption = #53552#48120#45328'ID'
            Transparent = True
          end
          object VanSerialNoLabel: TLabel
            Left = 7
            Top = 126
            Width = 52
            Height = 17
            Caption = #51068#47144#48264#54840
            Transparent = True
          end
          object VanPasswordLabel: TLabel
            Left = 7
            Top = 157
            Width = 52
            Height = 17
            Caption = #48708#48128#48264#54840
            Transparent = True
          end
          object POSLicenseKeyLabel: TLabel
            Left = 7
            Top = 95
            Width = 57
            Height = 17
            Caption = #49324#50629#51088'No'
            Transparent = True
          end
          object Label26: TLabel
            Left = 7
            Top = 189
            Width = 52
            Height = 17
            Caption = #44036#54200#44208#51228
            Transparent = True
          end
          object VanComboBox: TcxComboBox
            Left = 67
            Top = 29
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.DropDownRows = 15
            Properties.Items.Strings = (
              'KOCES ('#54620#44397#49888#50857#52852#46300#44208#51228')'
              'Daou ('#45796#50864#48180')'
              'NICE ('#45208#51060#49828#51221#48372#53685#49888')'
              'KICC ('#54620#44397#51221#48372#53685#49888')'
              'KIS (KIS'#51221#48372#53685#49888')'
              'KSNET ('#52992#51060#50640#49828#45367')'
              'KCP ('#54620#44397#49324#51060#48260#44208#51228')'
              'FDIK ('#44396' KMPS)'
              'JTNET ('#45208#51060#49828#54168#51060#47676#52768')'
              'KFTC ('#44552#50997#44208#51228#50896')'
              'Smartro ('#49828#47560#53944#47196')'
              'KOVAN ('#53076#48180')'
              'SPC')
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            Style.ButtonStyle = btsOffice11
            TabOrder = 0
            Text = 'KOCES ('#54620#44397#49888#50857#52852#46300#44208#51228')'
            Width = 181
          end
          object VanTIDEdit: TcxTextEdit
            Left = 67
            Top = 61
            ParentFont = False
            Properties.ImeMode = imSAlpha
            Properties.MaxLength = 15
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 1
            Width = 120
          end
          object VanSerialNoEdit: TcxTextEdit
            Left = 67
            Top = 123
            ParentFont = False
            Properties.ImeMode = imSAlpha
            Properties.MaxLength = 20
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 2
            Width = 120
          end
          object VanPasswordEdit: TcxTextEdit
            Left = 67
            Top = 153
            ParentFont = False
            Properties.ImeMode = imSAlpha
            Properties.MaxLength = 20
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 3
            Width = 120
          end
          object VanBizNoEdit: TcxTextEdit
            Left = 67
            Top = 92
            ParentFont = False
            Properties.ImeMode = imSAlpha
            Properties.MaxLength = 10
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 4
            Width = 120
          end
          object VanEayPayComboBox: TcxComboBox
            Left = 65
            Top = 184
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.Items.Strings = (
              #49324#50857#50504#54632
              #47680#54000#54056#46300
              #53685#54633#44208#51228)
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 5
            Text = #49324#50857#50504#54632
            Width = 120
          end
        end
        object POSPrinterComboBox: TcxComboBox
          Left = 60
          Top = 214
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #52636#47141#50504#54632
            #51088#52404#50672#44208' '#54532#47536#53552
            #54532#47536#53552' '#44536#47353
            #45936#47788'POS'#50640' '#50689#49688#51613#54532#47536#53552
            #51452#48169#54532#47536#53552'('#54252#49828#50640#49436' '#49444#51221')')
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 11
          Text = #45936#47788'POS'#50640' '#50689#49688#51613#54532#47536#53552
          Width = 266
        end
        object PosGroupBox: TcxGroupBox
          Left = 382
          Top = 37
          Caption = 'POS '#46356#51088#51064
          TabOrder = 12
          Height = 87
          Width = 143
          object Label15: TLabel
            Left = 12
            Top = 27
            Width = 39
            Height = 17
            Caption = #46356#51088#51064
            Transparent = True
          end
          object Label22: TLabel
            Left = 14
            Top = 56
            Width = 32
            Height = 17
            Caption = 'P L U'
            Transparent = True
          end
          object PosDesignComboBox: TcxComboBox
            Left = 60
            Top = 23
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.DropDownListStyle = lsFixedList
            Properties.Items.Strings = (
              '01'
              '02'
              '03'
              '04'
              '05'
              '06'
              '07'
              '08'
              '09')
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 0
            Text = '01'
            Width = 61
          end
          object PosPLUComboBox: TcxComboBox
            Left = 60
            Top = 52
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.DropDownListStyle = lsFixedList
            Properties.Items.Strings = (
              '01'
              '02'
              '03'
              '04'
              '05'
              '06'
              '07'
              '08'
              '09')
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 1
            Text = '01'
            Width = 61
          end
        end
        object ServicePrintComboBox: TcxComboBox
          Left = 60
          Top = 246
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 13
          Visible = False
          Width = 266
        end
        object ServiceKitchenCheckListBox: TCheckListBox
          Left = 284
          Top = 358
          Width = 189
          Height = 162
          ImeName = 'Microsoft Office IME 2007'
          ItemHeight = 17
          TabOrder = 14
          Visible = False
          OnClick = EditPropertiesChange
        end
        object RustDeskGroupBox: TAdvGroupBox
          Left = 344
          Top = 130
          Width = 173
          Height = 105
          BorderColor = 12895944
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          Transparent = False
          Caption = #50896#44201#51221#48372
          ParentCtl3D = True
          TabOrder = 15
          object Label24: TLabel
            Left = 20
            Top = 34
            Width = 13
            Height = 17
            Caption = 'ID'
            Transparent = True
          end
          object RustDeskIDEdit: TcxTextEdit
            Left = 38
            Top = 31
            ParentFont = False
            Properties.MaxLength = 80
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 0
            Width = 120
          end
          object RustDeskLinkButton: TAdvSmoothToggleButton
            Tag = 7
            Left = 49
            Top = 67
            Width = 87
            Height = 28
            RepeatInterval = 0
            FontColorDisabled = clWhite
            Color = 13473116
            ColorDisabled = 16752190
            ColorDown = clSilver
            BorderColor = clNone
            BorderInnerColor = 8208128
            BevelWidth = 0
            BevelColorDisabled = 8404992
            BevelColorDown = 14925219
            DropDownArrowColor = clWhite
            AutoToggle = False
            PictureDown.Data = {
              89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
              0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
              2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
              89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
              7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
              39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
              D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
              D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
              C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
              963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
              5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
              1BA968E7016785BFC00000000049454E44AE426082}
            Appearance.GlowPercentage = 20
            Appearance.PictureAlignment = taCenter
            Appearance.PictureStretch = True
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWhite
            Appearance.Font.Height = -13
            Appearance.Font.Name = #47569#51008' '#44256#46357
            Appearance.Font.Style = []
            Appearance.FocusColor = clWhite
            Appearance.SimpleLayout = True
            Appearance.ImageIndex = 0
            Appearance.Rounding = 3
            Caption = #50672#44208
            Version = '1.7.2.2'
            Status.Caption = '0'
            Status.Appearance.Fill.Color = clRed
            Status.Appearance.Fill.ColorMirror = clNone
            Status.Appearance.Fill.ColorMirrorTo = clNone
            Status.Appearance.Fill.GradientType = gtSolid
            Status.Appearance.Fill.GradientMirrorType = gtSolid
            Status.Appearance.Fill.BorderColor = clGray
            Status.Appearance.Fill.Rounding = 8
            Status.Appearance.Fill.ShadowOffset = 0
            Status.Appearance.Fill.Glow = gmNone
            Status.Appearance.Font.Charset = DEFAULT_CHARSET
            Status.Appearance.Font.Color = clWhite
            Status.Appearance.Font.Height = -11
            Status.Appearance.Font.Name = 'Tahoma'
            Status.Appearance.Font.Style = []
            GroupIndex = 1
            ParentFont = False
            TabOrder = 1
            OnClick = RustDeskLinkButtonClick
            TMSStyle = 0
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Kitchen'
        object Label9: TLabel
          Left = 0
          Top = 3
          Width = 52
          Height = 17
          Caption = #51452#48169#51060#47492
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label11: TLabel
          Left = 2
          Top = 338
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
        object Label12: TLabel
          Left = -1
          Top = 34
          Width = 52
          Height = 17
          Caption = #50672#44208#54252#49828
          Transparent = True
        end
        object Label14: TLabel
          Left = -1
          Top = 64
          Width = 51
          Height = 17
          Caption = #54252'     '#53944
          Transparent = True
        end
        object KitchenIPAdressLabel: TLabel
          Left = 0
          Top = 95
          Width = 52
          Height = 17
          Caption = 'I P '#51452' '#49548
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label16: TLabel
          Left = 0
          Top = 126
          Width = 51
          Height = 17
          Caption = #44592'     '#51333
          Transparent = True
        end
        object Label17: TLabel
          Left = 1
          Top = 157
          Width = 51
          Height = 17
          Caption = #49549'     '#46020
          Transparent = True
        end
        object Label18: TLabel
          Left = 0
          Top = 219
          Width = 52
          Height = 17
          Caption = #52636#47141#47588#49688
          Transparent = True
        end
        object Label2: TLabel
          Left = 126
          Top = 189
          Width = 52
          Height = 17
          Caption = #54616#45800#50668#48177
          Transparent = True
        end
        object Label3: TLabel
          Left = 1
          Top = 189
          Width = 52
          Height = 17
          Caption = #49345#45800#50668#48177
          Transparent = True
        end
        object KitchenNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 300
        end
        object KitchenUseComboBox: TcxComboBox
          Left = 60
          Top = 335
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 13
          Text = #49324#50857
          Width = 120
        end
        object KitchenLinkPosComboBox: TcxComboBox
          Left = 60
          Top = 31
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #51221#49328#54252#49828
            #51452#47928#54252#49828
            #47924#49440#51452#47928#44592
            #49828#47560#53944#51452#47928#44592)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #51221#49328#54252#49828
          Width = 120
        end
        object KitchenPortComboBox: TcxComboBox
          Left = 60
          Top = 60
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            'COM1'
            'COM2'
            'COM3'
            'COM4'
            'COM5'
            'COM6'
            'COM7'
            'COM8'
            'COM9'
            'COM10'
            'COM11'
            'COM12'
            'COM13'
            'COM14'
            'COM15'
            'COM16'
            'COM17'
            'LPT'
            'Ethernet(LAN)')
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 2
          Text = 'COM1'
          Width = 120
        end
        object KitchenIPAdressEdit: TcxTextEdit
          Left = 60
          Top = 91
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 15
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 3
          Width = 120
        end
        object KitchenDeviceComboBox: TcxComboBox
          Left = 60
          Top = 122
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            '0. Epson '#44228#50676
            '1. TM '#44228#50676
            '2. KICC'#45800#47568#44592)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 4
          Text = '0. Epson '#44228#50676
          Width = 214
        end
        object KitchenBaudRateComboBox: TcxComboBox
          Left = 60
          Top = 153
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            '9600'
            '19200'
            '38400'
            '57600'
            '115200')
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 6
          Text = '9600'
          Width = 117
        end
        object KitchenPrintCountEdit: TcxSpinEdit
          Left = 60
          Top = 215
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.LargeIncrement = 1.000000000000000000
          Properties.MaxValue = 9.000000000000000000
          Properties.MinValue = 1.000000000000000000
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 9
          Value = 1
          Width = 54
        end
        object KitchenFirstPrintCheckBox: TcxCheckBox
          Left = 59
          Top = 246
          Caption = ' '#53580#51060#48660' '#52395' '#51452#47928' '#49884#50640#47564' '#52636#47141#54633#45768#45796
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 10
        end
        object KitchenFloorGroupBox: TAdvGroupBox
          Left = 10
          Top = 381
          Width = 255
          Height = 205
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          Caption = ' '#54532#47536#53552' '#49324#50857#52789'('#52789#51060' '#44057#51012' '#46412')'
          ParentCtl3D = True
          TabOrder = 14
          object KitchenCheckListBox: TCheckListBox
            Left = 15
            Top = 30
            Width = 227
            Height = 162
            ImeName = 'Microsoft Office IME 2007'
            ItemHeight = 17
            TabOrder = 0
            OnClick = EditPropertiesChange
          end
        end
        object KitchenFloor1GroupBox: TAdvGroupBox
          Left = 271
          Top = 381
          Width = 255
          Height = 205
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          Caption = ' '#54532#47536#53552' '#49324#50857#52789'('#52789#51060' '#45796#47484' '#46412')'
          ParentCtl3D = True
          TabOrder = 15
          object Kitchen1CheckListBox: TCheckListBox
            Left = 15
            Top = 30
            Width = 227
            Height = 162
            ImeName = 'Microsoft Office IME 2007'
            ItemHeight = 17
            TabOrder = 0
            OnClick = EditPropertiesChange
          end
        end
        object KitchenDisplayCheckBox: TcxCheckBox
          Left = 59
          Top = 272
          Caption = ' '#51452#48169#47784#45768#53552'(KDS)'#50640' '#51452#47928#45236#50669' '#54364#49884#54633#45768#45796' .'
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 11
        end
        object KitchenColumComboBox: TcxComboBox
          Left = 282
          Top = 122
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            '42 Colum'
            '48 Colum')
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 5
          Text = '42 Colum'
          Width = 82
        end
        object KitchenPrintBottomMaginEdit: TcxSpinEdit
          Left = 186
          Top = 184
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.AssignedValues.MinValue = True
          Properties.LargeIncrement = 1.000000000000000000
          Properties.MaxValue = 20.000000000000000000
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 8
          Width = 54
        end
        object KitchenPrintTopMaginEdit: TcxSpinEdit
          Left = 60
          Top = 184
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.AssignedValues.MinValue = True
          Properties.LargeIncrement = 1.000000000000000000
          Properties.MaxValue = 20.000000000000000000
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 7
          Width = 54
        end
        object LetsOrderOnlyCheckBox: TcxCheckBox
          Left = 59
          Top = 298
          Caption = ' '#47131#52768#50724#45908' '#51452#47928#47564' '#52636#47141#54633#45768#45796'.'
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 12
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Floor'
        object Label19: TLabel
          Left = 0
          Top = 3
          Width = 51
          Height = 17
          Caption = #52789'     '#47749
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label20: TLabel
          Left = 207
          Top = 46
          Width = 52
          Height = 17
          Caption = #44544#51088#53356#44592
          Transparent = True
        end
        object Label21: TLabel
          Left = 207
          Top = 108
          Width = 52
          Height = 17
          Caption = #44544#51088#53356#44592
          Transparent = True
        end
        object TableAmountFontSizeLabel: TLabel
          Left = 207
          Top = 143
          Width = 52
          Height = 17
          Caption = #44544#51088#53356#44592
          Transparent = True
        end
        object Label23: TLabel
          Left = 207
          Top = 172
          Width = 52
          Height = 17
          Caption = #44544#51088#53356#44592
          Transparent = True
        end
        object CornerLabel: TLabel
          Left = 0
          Top = 342
          Width = 51
          Height = 17
          Caption = #53076'     '#45320
          Transparent = True
        end
        object Label30: TLabel
          Left = 2
          Top = 372
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
        object TableButton: TPosButton
          Left = 10
          Top = 47
          Width = 191
          Height = 147
          Style = bsRound
          BorderColor = 12615680
          Number.NumberString = ' VIP'
          Number.Height = 25
          Number.Font.Charset = DEFAULT_CHARSET
          Number.Font.Color = clWhite
          Number.Font.Height = -13
          Number.Font.Name = #47569#51008' '#44256#46357
          Number.Font.Style = []
          Number.Color = 7819520
          Number.ShowColor = True
          Bottom.LeftString = '2'#47749
          Bottom.Height = 25
          Bottom.Font.Charset = DEFAULT_CHARSET
          Bottom.Font.Color = clWhite
          Bottom.Font.Height = -12
          Bottom.Font.Name = #47569#51008' '#44256#46357
          Bottom.Font.Style = []
          Bottom.Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Caption = ''
          Menu.Name = #44608#52824#52236#44172
          Menu.Qty = '2'
          Menu.Font.Charset = DEFAULT_CHARSET
          Menu.Font.Color = clWhite
          Menu.Font.Height = -13
          Menu.Font.Name = #47569#51008' '#44256#46357
          Menu.Font.Style = []
          Amount.Caption = '[10,000'#50896']'
          Amount.Font.Charset = DEFAULT_CHARSET
          Amount.Font.Color = clWhite
          Amount.Font.Height = -17
          Amount.Font.Name = #47569#51008' '#44256#46357
          Amount.Font.Style = [fsBold]
          Down = False
          Color = 12615680
          LayoutTop = True
          IsWork = False
          IsUse = False
        end
        object Label43: TLabel
          Left = 15
          Top = 213
          Width = 127
          Height = 17
          Caption = #48120#51452#47928' '#49884' '#53580#51060#48660#48264#54840
          Transparent = True
        end
        object Label7: TLabel
          Left = 15
          Top = 242
          Width = 83
          Height = 17
          Caption = #47700#45684#54364#49884' '#44079#49688
          Transparent = True
        end
        object Label159: TLabel
          Left = 15
          Top = 309
          Width = 70
          Height = 17
          Caption = #52789' '#48176#44221#49353#49345
        end
        object FloorNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 261
        end
        object TableTitleFontSizeEdit: TcxSpinEdit
          Left = 265
          Top = 40
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.LargeIncrement = 1.000000000000000000
          Properties.MaxValue = 20.000000000000000000
          Properties.MinValue = 6.000000000000000000
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Value = 6
          Width = 54
        end
        object TableCaptionFontSizeEdit: TcxSpinEdit
          Left = 267
          Top = 104
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.LargeIncrement = 1.000000000000000000
          Properties.MaxValue = 20.000000000000000000
          Properties.MinValue = 6.000000000000000000
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 2
          Value = 6
          Width = 54
        end
        object TableAmountFontSizeEdit: TcxSpinEdit
          Left = 267
          Top = 139
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.LargeIncrement = 1.000000000000000000
          Properties.MaxValue = 20.000000000000000000
          Properties.MinValue = 6.000000000000000000
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 3
          Value = 6
          Width = 54
        end
        object TableBottomFontSizeEdit: TcxSpinEdit
          Left = 267
          Top = 168
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.LargeIncrement = 1.000000000000000000
          Properties.MaxValue = 20.000000000000000000
          Properties.MinValue = 6.000000000000000000
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 4
          Value = 6
          Width = 54
        end
        object CornerComboBox: TcxComboBox
          Left = 60
          Top = 338
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #51221#49328#54252#49828
            #51452#47928#54252#49828
            #47924#49440#51452#47928#44592
            #49828#47560#53944#51452#47928#44592)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 5
          Text = #51221#49328#54252#49828
          Width = 293
        end
        object FloorUseComboBox: TcxComboBox
          Left = 60
          Top = 369
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 6
          Text = #49324#50857
          Width = 120
        end
        object TableTableNoSpinEdit: TcxSpinEdit
          Left = 149
          Top = 208
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.LargeIncrement = 1.000000000000000000
          Properties.MaxValue = 30.000000000000000000
          Properties.MinValue = 10.000000000000000000
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 7
          Value = 10
          Width = 54
        end
        object TableMenuDPCountEdit: TcxSpinEdit
          Left = 149
          Top = 239
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.AssignedValues.MinValue = True
          Properties.LargeIncrement = 1.000000000000000000
          Properties.MaxValue = 20.000000000000000000
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 8
          Width = 54
        end
        object WaitFloorCheckBox: TcxCheckBox
          Left = 15
          Top = 274
          Caption = ' '#45824#44592#51204#50857' '#52789
          Properties.OnChange = EditPropertiesChange
          TabOrder = 9
        end
        object FloorColorPanel: TPanel
          Left = 118
          Top = 306
          Width = 76
          Height = 26
          BevelOuter = bvSpace
          BorderStyle = bsSingle
          Color = clWhite
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 10
          OnClick = FloorColorPanelClick
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'GuestType'
        object GuestTypeNameLabel: TLabel
          Left = 0
          Top = 3
          Width = 52
          Height = 17
          Caption = #44061#12288#12288#52789
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object GuestTypeUseLabel: TLabel
          Left = 0
          Top = 33
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
        object GuestTypeNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 300
        end
        object GuestTypeUseComboBox: TcxComboBox
          Left = 60
          Top = 30
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #49324#50857
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Member'
        object MemberTypeNameLabel: TLabel
          Left = 0
          Top = 3
          Width = 49
          Height = 17
          Caption = #44396' '#48516' '#47749
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object MemberTypeUseLabel: TLabel
          Left = 0
          Top = 468
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
        object Label31: TLabel
          Left = 0
          Top = 66
          Width = 49
          Height = 17
          Caption = #54624' '#51064' '#50984
          Transparent = True
        end
        object Label32: TLabel
          Left = 136
          Top = 67
          Width = 11
          Height = 17
          Caption = '%'
          Transparent = True
        end
        object Label25: TLabel
          Left = 0
          Top = 37
          Width = 52
          Height = 17
          Caption = #51201#50857#44396#48516
          Transparent = True
        end
        object HeadMemberRemarkLabel: TLabel
          Left = 60
          Top = 506
          Width = 355
          Height = 20
          Caption = #8251' '#53685#54633#54924#50896' '#49324#50857#49884#50640#45716' '#48376#48512#50640#49436' '#49688#51221#51060' '#44032#45733#54633#45768#45796'.'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -15
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = False
        end
        object MemberTypeNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 300
        end
        object MemberTypeUseComboBox: TcxComboBox
          Left = 60
          Top = 464
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 5
          Text = #49324#50857
          Width = 120
        end
        object MemberDcRateEdit: TcxCurrencyEdit
          Left = 60
          Top = 63
          EditValue = 0.000000000000000000
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = ',0'
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 2
          Width = 70
        end
        object PointGroupBox: TAdvGroupBox
          Left = 0
          Top = 102
          Width = 415
          Height = 224
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          Caption = ' '#54252#51064#53944' '#51201#47549#50984' '
          ParentCtl3D = True
          TabOrder = 3
          Visible = False
          object Label35: TLabel
            Left = 30
            Top = 95
            Width = 365
            Height = 17
            Caption = #54788#44552#50689#49688#51613#44552#50529'                  '#50896' '#47560#45796' '#54252#51064#53944#47484'              '#51216
            Transparent = True
          end
          object Label34: TLabel
            Left = 43
            Top = 63
            Width = 352
            Height = 17
            Caption = #49888#50857#52852#46300#44552#50529'                  '#50896' '#47560#45796' '#54252#51064#53944#47484'              '#51216
            Transparent = True
          end
          object Label33: TLabel
            Left = 69
            Top = 32
            Width = 326
            Height = 17
            Caption = #54788#44552#44552#50529'                  '#50896' '#47560#45796' '#54252#51064#53944#47484'              '#51216
            Transparent = True
          end
          object Label1: TLabel
            Left = 56
            Top = 126
            Width = 339
            Height = 17
            Caption = #49345#54408#44428#44552#50529'                  '#50896' '#47560#45796' '#54252#51064#53944#47484'              '#51216
            Transparent = True
          end
          object Label4: TLabel
            Left = 69
            Top = 157
            Width = 326
            Height = 17
            Caption = #50808#49345#44552#50529'                  '#50896' '#47560#45796' '#54252#51064#53944#47484'              '#51216
            Transparent = True
          end
          object Label5: TLabel
            Left = 56
            Top = 188
            Width = 339
            Height = 17
            Caption = #54252#51064#53944#44552#50529'                  '#50896' '#47560#45796' '#54252#51064#53944#47484'              '#51216
            Transparent = True
          end
          object MemberCashAmountEdit: TcxCurrencyEdit
            Left = 129
            Top = 29
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0'
            Properties.UseDisplayFormatWhenEditing = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 0
            Width = 77
          end
          object MemberCashPointEdit: TcxSpinEdit
            Left = 325
            Top = 29
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 1000.000000000000000000
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 1
            Width = 54
          end
          object MemberCardPointEdit: TcxSpinEdit
            Left = 325
            Top = 60
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 1000.000000000000000000
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 2
            Width = 54
          end
          object MemberCardAmountEdit: TcxCurrencyEdit
            Left = 129
            Top = 60
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0'
            Properties.UseDisplayFormatWhenEditing = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 3
            Width = 77
          end
          object MemberCashRcpPointEdit: TcxSpinEdit
            Left = 325
            Top = 91
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 1000.000000000000000000
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 4
            Width = 54
          end
          object MemberCashRcpAmountEdit: TcxCurrencyEdit
            Left = 129
            Top = 92
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0'
            Properties.UseDisplayFormatWhenEditing = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 5
            Width = 77
          end
          object MemberGiftAmountEdit: TcxCurrencyEdit
            Left = 129
            Top = 123
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0'
            Properties.UseDisplayFormatWhenEditing = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 6
            Width = 77
          end
          object MemberGiftPointEdit: TcxSpinEdit
            Left = 325
            Top = 123
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 1000.000000000000000000
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 7
            Width = 54
          end
          object MemberTrustAmountEdit: TcxCurrencyEdit
            Left = 129
            Top = 154
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0'
            Properties.UseDisplayFormatWhenEditing = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 8
            Width = 77
          end
          object MemberTrustPointEdit: TcxSpinEdit
            Left = 325
            Top = 154
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 1000.000000000000000000
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 9
            Width = 54
          end
          object MemberPointAmountEdit: TcxCurrencyEdit
            Left = 129
            Top = 185
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0'
            Properties.UseDisplayFormatWhenEditing = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 10
            Width = 77
          end
          object MemberPointPointEdit: TcxSpinEdit
            Left = 325
            Top = 185
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 1000.000000000000000000
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 11
            Width = 54
          end
        end
        object MemberTypeComboBox: TcxComboBox
          Left = 60
          Top = 31
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #54624#51064
            #54252#51064#53944
            #54624#51064'&'#54252#51064#53944
            #47700#45684#48324' '#54624#51064#50984)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #54624#51064
          Width = 117
        end
        object AdvGroupBox1: TAdvGroupBox
          Left = 0
          Top = 332
          Width = 417
          Height = 119
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          Caption = ' '#54924#50896#44396#48516' '#44592#51456' '
          ParentCtl3D = True
          TabOrder = 4
          object Label28: TLabel
            Left = 30
            Top = 29
            Width = 52
            Height = 17
            Hint = #45572#51201#54252#51064#53944
            Caption = #44396#47588#44552#50529
            Transparent = True
          end
          object Label47: TLabel
            Left = 32
            Top = 59
            Width = 52
            Height = 17
            Hint = #45572#51201#54252#51064#53944
            Caption = #44396#47588#44148#49688
            Transparent = True
          end
          object Label29: TLabel
            Left = 178
            Top = 60
            Width = 152
            Height = 17
            Hint = #45572#51201#54252#51064#53944
            Caption = #44148' '#51060#49345'( 0'#51008' '#44552#50529#47564' '#52404#53356')'
            Transparent = True
          end
          object Label50: TLabel
            Left = 178
            Top = 29
            Width = 165
            Height = 17
            Hint = #45572#51201#54252#51064#53944
            Caption = #50896' '#51060#49345' (0'#51008' '#44396#47588#44148#47564' '#52404#53356')'
            Transparent = True
          end
          object MemberTypeSaleAmtEdit: TcxCurrencyEdit
            Left = 90
            Top = 25
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0'
            Properties.UseDisplayFormatWhenEditing = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 0
            Width = 81
          end
          object MemberSaleCountEdit: TcxSpinEdit
            Tag = 99
            Left = 90
            Top = 55
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 100000.000000000000000000
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 1
            Width = 50
          end
          object MemberClassNotChangeCheckBox: TcxCheckBox
            Left = 25
            Top = 86
            Caption = ' '#46321#44553#51312#51221' '#51228#50808
            TabOrder = 2
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'CardCompany'
        object CardCompanyNameLabel: TLabel
          Left = 0
          Top = 3
          Width = 52
          Height = 17
          Caption = #47588#51077#49324#47749
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object CardCompanyJoinNoLabel: TLabel
          Left = 0
          Top = 33
          Width = 52
          Height = 17
          Caption = #44032#47609#48264#54840
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object CardCompanyFeeLabel: TLabel
          Left = 0
          Top = 63
          Width = 52
          Height = 17
          Caption = #49688#49688#47308#50984
          Transparent = True
        end
        object CardCompanyUseLabel: TLabel
          Left = 0
          Top = 93
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
        object CardCompanyFeePercentLabel: TLabel
          Left = 165
          Top = 63
          Width = 11
          Height = 17
          Caption = '%'
          Transparent = True
        end
        object CardCompanyNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 20
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 197
        end
        object CardCompanyUseComboBox: TcxComboBox
          Left = 60
          Top = 90
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 3
          Text = #49324#50857
          Width = 120
        end
        object CardCompanyJoinNoEdit: TcxTextEdit
          Left = 60
          Top = 30
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 20
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 120
        end
        object CardCompanyFeeEdit: TcxCurrencyEdit
          Left = 60
          Top = 60
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DecimalPlaces = 2
          Properties.DisplayFormat = '0.00'
          Properties.MaxValue = 100.000000000000000000
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 2
          Width = 103
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Discount'
        object DcNameLabel: TLabel
          Left = 0
          Top = 3
          Width = 49
          Height = 17
          Caption = #54624' '#51064' '#47749
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label36: TLabel
          Left = 0
          Top = 34
          Width = 52
          Height = 17
          Caption = #54624#51064#44396#48516
          Transparent = True
        end
        object Label37: TLabel
          Left = 0
          Top = 63
          Width = 49
          Height = 17
          Caption = #54624' '#51064' '#50984
          Transparent = True
        end
        object Label38: TLabel
          Left = 151
          Top = 63
          Width = 11
          Height = 17
          Caption = '%'
          Transparent = True
        end
        object Label39: TLabel
          Left = 0
          Top = 94
          Width = 52
          Height = 17
          Caption = #44592#51456#44552#50529
          Transparent = True
        end
        object Label40: TLabel
          Left = 0
          Top = 125
          Width = 52
          Height = 17
          Caption = #54624#51064#44552#50529
          Transparent = True
        end
        object Label41: TLabel
          Left = 0
          Top = 157
          Width = 52
          Height = 17
          Caption = #47700#45684#48516#47448
          Transparent = True
        end
        object Label42: TLabel
          Left = 0
          Top = 187
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
        object DcNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 20
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 197
        end
        object DcTypeComboBox: TcxComboBox
          Left = 60
          Top = 30
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #54624#51064#50984
            #54624#51064#44552#50529
            #48516#47448#54624#51064)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #54624#51064#50984
          Width = 85
        end
        object DcRateEdit: TcxCurrencyEdit
          Left = 60
          Top = 60
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DecimalPlaces = 2
          Properties.DisplayFormat = '0.00'
          Properties.MaxValue = 100.000000000000000000
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 3
          Width = 85
        end
        object DcStandardAmountEdit: TcxCurrencyEdit
          Left = 60
          Top = 91
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = ',0'
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 4
          Width = 120
        end
        object DcAmountEdit: TcxCurrencyEdit
          Left = 60
          Top = 122
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = ',0'
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 5
          Width = 120
        end
        object DcMenuClassComboBox: TcxComboBox
          Left = 60
          Top = 153
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #54624#51064#50984
            #54624#51064#44552#50529
            #48516#47448#54624#51064)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 6
          Text = #48516#47448#54624#51064
          Width = 197
        end
        object DcUseComboBox: TcxComboBox
          Left = 60
          Top = 184
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 7
          Text = #49324#50857
          Width = 120
        end
        object DcTypeMenuComboBox: TcxComboBox
          Left = 151
          Top = 30
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857#50504#54632
            #49440#53469#47700#45684
            #54788#51116#51452#47928#46108' '#47700#45684)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 2
          Text = #49440#53469#47700#45684
          Width = 106
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'OrderCancel'
        object OrderCancelNameLabel: TLabel
          Left = 0
          Top = 3
          Width = 52
          Height = 17
          Caption = #52712#49548#49324#50976
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label44: TLabel
          Left = 0
          Top = 35
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
        object OrderCancelNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 20
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 253
        end
        object OrderCancelUseComboBox: TcxComboBox
          Left = 60
          Top = 32
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #49324#50857
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'SaleCancel'
        object SaleCancelNameLabel: TLabel
          Left = 0
          Top = 3
          Width = 52
          Height = 17
          Caption = #52712#49548#49324#50976
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object SaleCancelUseLabel: TLabel
          Left = 0
          Top = 33
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
        object SaleCancelNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 300
        end
        object SaleCancelUseComboBox: TcxComboBox
          Left = 60
          Top = 30
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #49324#50857
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'TimePay'
        object TimePayNameLabel: TLabel
          Left = 0
          Top = 3
          Width = 52
          Height = 17
          Caption = #49884#44553#51060#47492
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object TimePayAmtLabel: TLabel
          Left = 0
          Top = 34
          Width = 51
          Height = 17
          Caption = #49884'     '#44553
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object TimePayUseLabel: TLabel
          Left = 0
          Top = 65
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
        object TimePayNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 165
        end
        object TimePayAmtEdit: TcxCurrencyEdit
          Left = 60
          Top = 31
          EditValue = 0.000000000000000000
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 120
        end
        object TimePayUseComboBox: TcxComboBox
          Left = 60
          Top = 62
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 2
          Text = #49324#50857
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'InOut'
        object InOutNameLabel: TLabel
          Left = 0
          Top = 3
          Width = 52
          Height = 17
          Caption = #52636#45225#51060#47492
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object InOutLabel: TLabel
          Left = 0
          Top = 33
          Width = 52
          Height = 17
          Caption = #52636#45225#44396#48516
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object InOutRemarkLabel: TLabel
          Left = 0
          Top = 93
          Width = 52
          Height = 17
          Caption = #48708#12288#12288#44256
          Transparent = True
        end
        object InOutUseLabel: TLabel
          Left = 0
          Top = 123
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
        object InOutLinkLabel: TLabel
          Left = 0
          Top = 63
          Width = 52
          Height = 17
          Caption = #50672#44208#44228#51221
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object InOutNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 300
        end
        object InOutComboBox: TcxComboBox
          Left = 60
          Top = 30
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49688#51077
            #51648#52636)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #49688#51077
          Width = 120
        end
        object InOutRemarkEdit: TcxTextEdit
          Left = 60
          Top = 90
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 3
          Width = 300
        end
        object InOutUseComboBox: TcxComboBox
          Left = 60
          Top = 120
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 4
          Text = #49324#50857
          Width = 120
        end
        object InOutLinkComboBox: TcxComboBox
          Left = 60
          Top = 60
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #50630#51020
            #54924#50896#50808#49345#45824#44552
            #54788#44552#47588#51077
            #50808#49345#47588#51077#44552' '#51648#44553
            #50689#50629#50808' '#48708#50857'/'#49688#51061)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 2
          Text = #50630#51020
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'PointSave'
        object PointSaveNameLabel: TLabel
          Left = 0
          Top = 3
          Width = 52
          Height = 17
          Caption = #51201#47549#49324#50976
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object PointSaveLabel: TLabel
          Left = 0
          Top = 33
          Width = 52
          Height = 17
          Caption = #51201#47549#51216#49688
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object PointSaveUseLabel: TLabel
          Left = 0
          Top = 93
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
        object PointSavePointLabel: TLabel
          Left = 144
          Top = 33
          Width = 39
          Height = 17
          Caption = #54252#51064#53944
          Transparent = True
        end
        object PointSaveSaleLabel: TLabel
          Left = 0
          Top = 63
          Width = 52
          Height = 17
          Caption = #49345#54408#54032#47588
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object PointSaveNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 300
        end
        object PointSaveEdit: TcxCurrencyEdit
          Left = 60
          Top = 30
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Properties.ImeMode = imSAlpha
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseLeftAlignmentOnEditing = False
          Properties.UseThousandSeparator = True
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 80
        end
        object PointSaveUseComboBox: TcxComboBox
          Left = 60
          Top = 90
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 3
          Text = #49324#50857
          Width = 120
        end
        object PointSaveSaleComboBox: TcxComboBox
          Left = 60
          Top = 60
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #44592#53440' '#49324#50976
            #49345#54408' '#54032#47588)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 2
          Text = #44592#53440' '#49324#50976
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'PointUse'
        object PointUseNameLabel: TLabel
          Left = 0
          Top = 3
          Width = 52
          Height = 17
          Caption = #49324#50857#49324#50976
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object PointUseLabel: TLabel
          Left = 0
          Top = 33
          Width = 52
          Height = 17
          Caption = #52264#44048#51216#49688
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object PointUsePointLabel: TLabel
          Left = 144
          Top = 33
          Width = 39
          Height = 17
          Caption = #54252#51064#53944
          Transparent = True
        end
        object PointUseUseLabel: TLabel
          Left = 0
          Top = 93
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
        object PointUseSaleLabel: TLabel
          Left = 0
          Top = 63
          Width = 52
          Height = 17
          Caption = #49345#54408#44396#51077
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object PointUseNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 300
        end
        object PointUseEdit: TcxCurrencyEdit
          Left = 60
          Top = 30
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Properties.ImeMode = imSAlpha
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseLeftAlignmentOnEditing = False
          Properties.UseThousandSeparator = True
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 80
        end
        object PointUseUseComboBox: TcxComboBox
          Left = 60
          Top = 90
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 3
          Text = #49324#50857
          Width = 120
        end
        object PointUseSaleComboBox: TcxComboBox
          Left = 60
          Top = 60
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #44592#53440' '#49324#50976
            #49345#54408' '#44396#51077)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 2
          Text = #44592#53440' '#49324#50976
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'AgeGroup'
        object AgeGroupNameLabel: TLabel
          Left = 0
          Top = 3
          Width = 49
          Height = 17
          Caption = #50672' '#47161' '#45824
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label49: TLabel
          Left = 0
          Top = 35
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
        object AgeGroupNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 20
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 181
        end
        object AgeGroupUseComboBox: TcxComboBox
          Left = 60
          Top = 32
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #49324#50857
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'TimeZone'
        object TimeZoneLabel: TLabel
          Left = 2
          Top = 3
          Width = 49
          Height = 17
          Caption = #49884' '#44036' '#45824
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object TimeZoneUseLabel: TLabel
          Left = 0
          Top = 33
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
        object TimeZoneEdit: TcxMaskEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.EditMask = '00:00 ~ 00:00;1; '
          Properties.MaxLength = 0
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Text = '  :   ~   :  '
          Width = 120
        end
        object TimeZoneUseComboBox: TcxComboBox
          Left = 60
          Top = 30
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #49324#50857
          Width = 120
        end
        object TimeZoneAutoGroupBox: TcxGroupBox
          Left = 0
          Top = 100
          Caption = ' '#51088#46041' '#49373#49457' '
          ParentFont = False
          Style.StyleController = EditStyleController
          TabOrder = 2
          Height = 95
          Width = 365
          object TimeZoneAutoLabel: TLabel
            Left = 115
            Top = 28
            Width = 229
            Height = 17
            Caption = #48512#53552'            '#48516' '#44036#44201#51004#47196' '#49373#49457#54633#45768#45796'.'
            Transparent = True
          end
          object TimeZoneAutoStartTimeEdit: TcxTimeEdit
            Left = 20
            Top = 25
            ParentFont = False
            Properties.TimeFormat = tfHourMin
            Properties.Use24HourFormat = False
            Style.StyleController = EditStyleController
            TabOrder = 0
            Width = 90
          end
          object TimeZoneAutoIntervalEdit: TcxSpinEdit
            Tag = 99
            Left = 150
            Top = 25
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.Increment = 30.000000000000000000
            Properties.MaxValue = 360.000000000000000000
            Properties.MinValue = 30.000000000000000000
            Style.StyleController = EditStyleController
            TabOrder = 1
            Value = 60
            Width = 50
          end
          object TimeZoneAutoButton: TButton
            Left = 253
            Top = 55
            Width = 90
            Height = 25
            Caption = #51088#46041' '#49373#49457
            DoubleBuffered = True
            ParentDoubleBuffered = False
            TabOrder = 2
            OnClick = TimeZoneAutoButtonClick
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'KitchenMemo'
        object KitchenMemoNameLabel: TLabel
          Left = 0
          Top = 3
          Width = 51
          Height = 17
          Caption = #45236'     '#50857
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label54: TLabel
          Left = 0
          Top = 33
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
        object KitchenMemoNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 300
        end
        object KitchenMemoUseComboBox: TcxComboBox
          Left = 60
          Top = 30
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #49324#50857
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'UserGrade'
        object UserGradeNameLabel: TLabel
          Left = 0
          Top = 3
          Width = 52
          Height = 17
          Caption = #44536#47353#51060#47492
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object UserGradeUseLabel: TLabel
          Left = 0
          Top = 33
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
        object UserGradeNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 300
        end
        object UserGradeUseComboBox: TcxComboBox
          Left = 60
          Top = 30
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #49324#50857
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'SMS'
        object SMSNameLabel: TLabel
          Left = 0
          Top = 3
          Width = 52
          Height = 17
          Caption = #51228#12288#12288#47785
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object SMSUseLabel: TLabel
          Left = 0
          Top = 324
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
        object SMSLabel: TLabel
          Left = 0
          Top = 65
          Width = 53
          Height = 17
          Caption = 'SMS'#45236#50857
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object SMSLengthLabel: TLabel
          Left = 245
          Top = 297
          Width = 50
          Height = 19
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0'
          Transparent = True
        end
        object Label6: TLabel
          Left = 0
          Top = 35
          Width = 51
          Height = 17
          Caption = #44396'     '#48516
          Transparent = True
        end
        object SMSNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 300
        end
        object SMSUseComboBox: TcxComboBox
          Left = 60
          Top = 321
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 3
          Text = #49324#50857
          Width = 120
        end
        object SMSMemo: TcxMemo
          Tag = 1
          Left = 60
          Top = 86
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 300
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.Font.Charset = HANGEUL_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -17
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = []
          Style.StyleController = EditStyleController
          Style.IsFontAssigned = True
          TabOrder = 2
          Height = 203
          Width = 239
        end
        object Sms1Button: TcxButton
          Left = 305
          Top = 190
          Width = 88
          Height = 25
          Caption = #44256' '#44061' '#47749
          LookAndFeel.Kind = lfOffice11
          TabOrder = 4
          Visible = False
          OnClick = EditPropertiesChange
        end
        object Sms2Button: TcxButton
          Left = 305
          Top = 215
          Width = 88
          Height = 25
          Caption = #51201#47549#54252#51064#53944
          LookAndFeel.Kind = lfOffice11
          TabOrder = 5
          Visible = False
          OnClick = EditPropertiesChange
        end
        object Sms4Button: TcxButton
          Left = 305
          Top = 265
          Width = 88
          Height = 25
          Caption = #51092#50668#54252#51064#53944
          LookAndFeel.Kind = lfOffice11
          TabOrder = 6
          Visible = False
          OnClick = EditPropertiesChange
        end
        object Sms3Button: TcxButton
          Left = 305
          Top = 240
          Width = 88
          Height = 25
          Caption = #49324#50857#54252#51064#53944
          LookAndFeel.Kind = lfOffice11
          TabOrder = 7
          Visible = False
          OnClick = EditPropertiesChange
        end
        object SmsTypeComboBox: TcxComboBox
          Left = 60
          Top = 31
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #51068#48152
            #44396#47588#54924#50896' '#49884
            #54924#50896#44032#51077' '#49884)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #51068#48152
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Bank'
        object BankLabel: TLabel
          Left = 1
          Top = 3
          Width = 52
          Height = 17
          Caption = #51008#54665#51060#47492
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
        end
        object BankUseLabel: TLabel
          Left = 0
          Top = 93
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
        object BankNumberLabel: TLabel
          Left = 0
          Top = 33
          Width = 52
          Height = 17
          Caption = #44228#51340#48264#54840
        end
        object BankMasterLabel: TLabel
          Left = 1
          Top = 63
          Width = 49
          Height = 17
          Caption = #50696' '#44552' '#51452
        end
        object BankEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 120
        end
        object BankUseComboBox: TcxComboBox
          Left = 60
          Top = 90
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 3
          Text = #49324#50857
          Width = 120
        end
        object BankNumberEdit: TcxTextEdit
          Left = 60
          Top = 30
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 120
        end
        object BankMasterEdit: TcxTextEdit
          Left = 60
          Top = 60
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 2
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'DeliveryCourse'
        object DeliveryCourseNameLabel: TLabel
          Left = 0
          Top = 3
          Width = 49
          Height = 17
          Caption = #53076' '#49828' '#47749
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label56: TLabel
          Left = 0
          Top = 33
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
        object DeliveryCourseNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 300
        end
        object DeliveryCourseUseComboBox: TcxComboBox
          Left = 60
          Top = 30
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #49324#50857
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'DeliveryItem'
        object DeliveryItemNameLabel: TLabel
          Left = 0
          Top = 3
          Width = 49
          Height = 17
          Caption = #50500' '#51060' '#53596
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label58: TLabel
          Left = 0
          Top = 33
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
        object DeliveryItemNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 300
        end
        object DeliveryItemUseComboBox: TcxComboBox
          Left = 60
          Top = 30
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #49324#50857
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'DeliveryLocal'
        object DeliveryLocalNameLabel: TLabel
          Left = 0
          Top = 3
          Width = 51
          Height = 17
          Caption = #51648'     '#50669
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label60: TLabel
          Left = 0
          Top = 33
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
        object DeliveryLocalNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 300
        end
        object DeliveryLocalUseComboBox: TcxComboBox
          Left = 60
          Top = 30
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #49324#50857
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Service'
        object ServiceWhyLabel: TLabel
          Left = 0
          Top = 3
          Width = 51
          Height = 17
          Caption = #49324'     '#50976
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label8: TLabel
          Left = 0
          Top = 33
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
        object ServiceWhyEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 300
        end
        object ServiceUseComboBox: TcxComboBox
          Left = 60
          Top = 30
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #49324#50857
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'TableMemo'
        object TableMemoLabel: TLabel
          Left = 0
          Top = 3
          Width = 51
          Height = 17
          Caption = #47700'     '#47784
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label13: TLabel
          Left = 0
          Top = 33
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
        object TableMemoEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 300
        end
        object TableMemoUseComboBox: TcxComboBox
          Left = 60
          Top = 30
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #49324#50857
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'PrinterGroup'
        object PrinterGroupNameLabel: TLabel
          Left = 0
          Top = 3
          Width = 49
          Height = 17
          Caption = #44536' '#47353' '#47749
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label10: TLabel
          Left = 0
          Top = 65
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
        object PrinterGroupKitchenLabel: TLabel
          Left = -1
          Top = 34
          Width = 52
          Height = 17
          Caption = #52636#47141#51452#48169
          Transparent = True
        end
        object PrinterGroupNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 300
        end
        object PrinterGroupUseComboBox: TcxComboBox
          Left = 60
          Top = 62
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 2
          Text = #49324#50857
          Width = 120
        end
        object PrinterGroupKitchenComboBox: TcxComboBox
          Left = 59
          Top = 31
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownListStyle = lsFixedList
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'ServiceCall'
        object ServiceCallLabel: TLabel
          Left = 0
          Top = 11
          Width = 52
          Height = 17
          Caption = #54840#52636#49324#50976
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label45: TLabel
          Left = 0
          Top = 77
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
        object Label27: TLabel
          Left = 0
          Top = 44
          Width = 52
          Height = 17
          Caption = #51020#49457#54868#51068
          Transparent = True
        end
        object ServiceCallEdit: TcxTextEdit
          Left = 60
          Top = 8
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 300
        end
        object ServiceCallUseComboBox: TcxComboBox
          Left = 60
          Top = 74
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 2
          Text = #49324#50857
          Width = 120
        end
        object ServiceCallWavFileNameEdit: TcxTextEdit
          Left = 60
          Top = 41
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 205
        end
      end
    end
  end
  object MenuScrollBox: TScrollBox [5]
    AlignWithMargins = True
    Left = 3
    Top = 68
    Width = 142
    Height = 952
    HorzScrollBar.Visible = False
    Align = alLeft
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object KitchenButton: TAdvSmoothToggleButton
      Tag = 2
      Left = 0
      Top = 36
      Width = 142
      Height = 36
      Hint = 'Kitchen'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      Down = True
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #51452#48169#51452#47928#49436
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 0
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton1: TAdvSmoothToggleButton
      Tag = 1
      Left = 0
      Top = 0
      Width = 142
      Height = 36
      Hint = 'POS'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #54252#49828#44288#47532
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 1
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton2: TAdvSmoothToggleButton
      Tag = 3
      Left = 0
      Top = 72
      Width = 142
      Height = 36
      Hint = 'Floor'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #52789#44288#47532
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 2
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton3: TAdvSmoothToggleButton
      Tag = 4
      Left = 0
      Top = 108
      Width = 142
      Height = 36
      Hint = 'GuestType'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #44256#44061#50976#54805#44288#47532
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 3
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton4: TAdvSmoothToggleButton
      Tag = 5
      Left = 0
      Top = 144
      Width = 142
      Height = 36
      Hint = 'Member'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #54924#50896#44396#48516
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 4
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton5: TAdvSmoothToggleButton
      Tag = 6
      Left = 0
      Top = 180
      Width = 142
      Height = 36
      Hint = 'CardCompany'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #52852#46300#47588#51077#49324
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 5
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton6: TAdvSmoothToggleButton
      Tag = 7
      Left = 0
      Top = 216
      Width = 142
      Height = 36
      Hint = 'Discount'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #54624#51064#53076#46300
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 6
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton7: TAdvSmoothToggleButton
      Tag = 8
      Left = 0
      Top = 252
      Width = 142
      Height = 36
      Hint = 'OrderCancel'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #51452#47928#52712#49548#53076#46300
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 7
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton8: TAdvSmoothToggleButton
      Tag = 10
      Left = 0
      Top = 324
      Width = 142
      Height = 36
      Hint = 'TimePay'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #49884#44553#53076#46300
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 8
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton9: TAdvSmoothToggleButton
      Tag = 9
      Left = 0
      Top = 288
      Width = 142
      Height = 36
      Hint = 'SaleCancel'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #47588#52636#52712#49548#53076#46300
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 9
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton10: TAdvSmoothToggleButton
      Tag = 11
      Left = 0
      Top = 360
      Width = 142
      Height = 36
      Hint = 'InOut'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #52636#45225#53076#46300
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 10
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton11: TAdvSmoothToggleButton
      Tag = 12
      Left = 0
      Top = 396
      Width = 142
      Height = 36
      Hint = 'PointSave'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #54252#51064#53944#51201#47549#53076#46300
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 11
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton12: TAdvSmoothToggleButton
      Tag = 13
      Left = 0
      Top = 432
      Width = 142
      Height = 36
      Hint = 'PointUse'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #54252#51064#53944#49324#50857#53076#46300
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 12
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton13: TAdvSmoothToggleButton
      Tag = 22
      Left = 0
      Top = 756
      Width = 142
      Height = 36
      Hint = 'DeliveryLocal'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #48176#45804#51648#50669#53076#46300
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 13
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton14: TAdvSmoothToggleButton
      Tag = 14
      Left = 0
      Top = 468
      Width = 142
      Height = 36
      Hint = 'AgeGroup'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #50672#47161#45824#53076#46300
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 14
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton15: TAdvSmoothToggleButton
      Tag = 15
      Left = 0
      Top = 504
      Width = 142
      Height = 36
      Hint = 'TimeZone'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #49884#44036#45824#53076#46300
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 15
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton16: TAdvSmoothToggleButton
      Tag = 16
      Left = 0
      Top = 540
      Width = 142
      Height = 36
      Hint = 'KitchenMemo'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #51452#48169#47700#47784#53076#46300
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 16
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton17: TAdvSmoothToggleButton
      Tag = 17
      Left = 0
      Top = 576
      Width = 142
      Height = 36
      Hint = 'UserGrade'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #49324#50857#51088#44536#47353#53076#46300
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 17
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton18: TAdvSmoothToggleButton
      Tag = 18
      Left = 0
      Top = 612
      Width = 142
      Height = 36
      Hint = 'SMS'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = 'SMS '#47700#49464#51648#54632
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 18
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton19: TAdvSmoothToggleButton
      Tag = 19
      Left = 0
      Top = 648
      Width = 142
      Height = 36
      Hint = 'Bank'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #51008#54665#53076#46300
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 19
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton20: TAdvSmoothToggleButton
      Tag = 20
      Left = 0
      Top = 684
      Width = 142
      Height = 36
      Hint = 'DeliveryCourse'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #48176#45804#53076#49828' '#53076#46300
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 20
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton21: TAdvSmoothToggleButton
      Tag = 21
      Left = 0
      Top = 720
      Width = 142
      Height = 36
      Hint = 'DeliveryItem'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #48176#45804#50500#51060#53596' '#53076#46300
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 21
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton22: TAdvSmoothToggleButton
      Tag = 23
      Left = 0
      Top = 792
      Width = 142
      Height = 36
      Hint = 'Service'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #49436#48708#49828' '#53076#46300
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 22
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton23: TAdvSmoothToggleButton
      Tag = 24
      Left = 0
      Top = 828
      Width = 142
      Height = 36
      Hint = 'TableMemo'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #53580#51060#48660#47700#47784#53076#46300
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 23
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton25: TAdvSmoothToggleButton
      Tag = 25
      Left = 0
      Top = 864
      Width = 142
      Height = 36
      Hint = 'PrinterGroup'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #54532#47536#53552#44536#47353
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 24
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton26: TAdvSmoothToggleButton
      Tag = 26
      Left = 0
      Top = 900
      Width = 142
      Height = 36
      Hint = 'ServiceCall'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 13473116
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 8208128
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #49436#48708#49828#54840#52636
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 25
      OnClick = MenuButtonClick
      TMSStyle = 0
    end
  end
  inherited EditStyleController: TcxEditStyleController
    Top = 26
    PixelsPerInch = 96
  end
  inherited ToolBarStyler: TAdvToolBarOfficeStyler
    Top = 26
  end
  inherited StyleRepository: TcxStyleRepository
    Top = 26
    PixelsPerInch = 96
  end
  inherited AdvOfficeTabSetOfficeStyler: TAdvOfficeTabSetOfficeStyler
    Left = 288
    Top = 240
  end
  object OpenPictureDialog: TOpenPictureDialog
    Filter = 'JPG|*.JPG'
    Left = 232
    Top = 32
  end
  object ColorDialog: TColorDialog
    Left = 720
    Top = 368
  end
end
