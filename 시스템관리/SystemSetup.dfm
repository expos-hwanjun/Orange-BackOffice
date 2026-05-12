inherited SystemSetupForm: TSystemSetupForm
  Left = 300
  Top = 120
  Caption = #54872#44221' '#49444#51221
  ClientHeight = 1023
  ClientWidth = 1279
  ExplicitWidth = 1295
  ExplicitHeight = 1062
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1279
    ExplicitWidth = 1279
    inherited ButtonToolBar: TAdvToolBar
      Left = 617
      Width = 347
      ExplicitLeft = 617
      ExplicitWidth = 347
      inherited ButtonToolBarSeparator: TAdvToolBarSeparator
        Left = 260
        ExplicitLeft = 260
      end
      inherited ButtonToolBarSeparator1: TAdvToolBarSeparator
        Width = 0
        ExplicitWidth = 0
      end
      inherited ButtonToolBarCloseButton: TAdvGlowButton
        Left = 270
        ExplicitLeft = 270
      end
      inherited ButtonToolBarSaveButton: TAdvGlowButton
        Left = 174
        ExplicitLeft = 174
      end
      inherited ButtonToolBarDeleteButton: TAdvGlowButton
        Left = 88
        Visible = False
        ExplicitLeft = 88
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
        Caption = #44160#49353#50612
        Visible = True
        AnchorX = 298
        AnchorY = 16
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Visible = True
        OnKeyDown = ConditionToolBarEditKeyDown
      end
    end
  end
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 25
  end
  object Pager: TcxPageControl [2]
    Left = 0
    Top = 65
    Width = 1279
    Height = 958
    Align = alClient
    TabOrder = 5
    Properties.ActivePage = LetsOrderPage
    Properties.CustomButtons.Buttons = <>
    Properties.Images = ImageList1
    Properties.TabHeight = 30
    Properties.TabWidth = 120
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    ClientRectBottom = 958
    ClientRectRight = 1279
    ClientRectTop = 32
    object StorePage: TcxTabSheet
      Caption = #47588#51109#51221#48372
      ImageIndex = 0
      object AdvScrollBox16: TAdvScrollBox
        Left = 0
        Top = 0
        Width = 1279
        Height = 926
        Align = alClient
        BorderStyle = bsNone
        DoubleBuffered = True
        Ctl3D = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        TabOrder = 0
        object CompanyCodeLabel: TLabel
          Left = 20
          Top = 13
          Width = 52
          Height = 17
          Caption = #47588#51109#53076#46300
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object CompanyNameLabel: TLabel
          Left = 20
          Top = 43
          Width = 52
          Height = 17
          Caption = #47588#51109#51060#47492
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object CEONameLabel: TLabel
          Left = 20
          Top = 102
          Width = 52
          Height = 17
          Caption = #45824#54364#51088#47749
          Transparent = True
        end
        object IDNoLabel: TLabel
          Left = 8
          Top = 130
          Width = 65
          Height = 17
          Caption = #49324#50629#51088#48264#54840
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object JongmokLabel: TLabel
          Left = 20
          Top = 190
          Width = 52
          Height = 17
          Caption = #51333#12288#12288#47785
          Transparent = True
        end
        object UptaeLabel: TLabel
          Left = 20
          Top = 160
          Width = 52
          Height = 17
          Caption = #50629#12288#12288#53468
          Transparent = True
        end
        object TelNoLabel: TLabel
          Left = 20
          Top = 251
          Width = 52
          Height = 17
          Caption = #47588#51109#48264#54840
          Transparent = True
        end
        object FaxNoLabel: TLabel
          Left = 20
          Top = 284
          Width = 52
          Height = 17
          Caption = #54057#49828#48264#54840
          Transparent = True
        end
        object AddrLabel: TLabel
          Left = 20
          Top = 314
          Width = 52
          Height = 17
          Caption = #51452#12288#12288#49548
          Transparent = True
        end
        object Label3: TLabel
          Left = 20
          Top = 221
          Width = 52
          Height = 17
          Caption = #55092#45824#51204#54868
          Transparent = True
        end
        object Label16: TLabel
          Left = 20
          Top = 373
          Width = 436
          Height = 17
          Caption = #50508#47548#53665#49688#49888' '#51204#54868#48264#54840'('#51452#47928#52712#49548', '#47560#44048', '#44208#51228#48320#44221') ,'#47196' '#44396#48516#54644#49436' 2'#47749#51060#49345' '#44032#45733
          Transparent = True
        end
        object Label225: TLabel
          Left = 20
          Top = 72
          Width = 49
          Height = 17
          Caption = #45800' '#52629' '#47749
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object CompanyCodeEdit: TcxTextEdit
          Left = 80
          Top = 11
          TabStop = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 6
          Properties.ReadOnly = True
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = EditPropertiesChange
          Style.Color = 15856113
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 70
        end
        object StoreNameEdit: TcxTextEdit
          Left = 80
          Top = 40
          Enabled = False
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 50
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 250
        end
        object CEONameEdit: TcxTextEdit
          Left = 80
          Top = 98
          Enabled = False
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 20
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 2
          Width = 121
        end
        object IDNoEdit: TcxMaskEdit
          Left = 80
          Top = 127
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.EditMask = '999\-99\-99999;1; '
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 3
          Text = '   -  -     '
          Width = 120
        end
        object JongmokEdit: TcxTextEdit
          Left = 80
          Top = 187
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 30
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 4
          Width = 250
        end
        object UptaeEdit: TcxTextEdit
          Left = 80
          Top = 157
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 30
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 5
          Width = 250
        end
        object TelNoEdit: TcxTextEdit
          Left = 80
          Top = 248
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 15
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 6
          OnExit = MobileNoEditExit
          Width = 120
        end
        object FaxNoEdit: TcxTextEdit
          Left = 80
          Top = 279
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 13
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 7
          OnExit = MobileNoEditExit
          Width = 120
        end
        object Addr1Edit: TcxTextEdit
          Left = 80
          Top = 311
          TabStop = False
          ParentFont = False
          Properties.MaxLength = 80
          Properties.ReadOnly = True
          Style.Color = clWhite
          Style.StyleController = EditStyleController
          StyleFocused.Color = 14737632
          TabOrder = 8
          Width = 385
        end
        object Addr2Edit: TcxTextEdit
          Left = 80
          Top = 341
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.ReadOnly = True
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 9
          Width = 385
        end
        object MobileNoEdit: TcxTextEdit
          Left = 80
          Top = 217
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 13
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 10
          OnExit = MobileNoEditExit
          Width = 120
        end
        object KTISGroupBox: TAdvGroupBox
          Left = 313
          Top = 431
          Width = 205
          Height = 72
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          Caption = ' Tax Refund'
          Enabled = False
          ParentCtl3D = True
          TabOrder = 11
          Visible = False
          object Label166: TLabel
            Left = 14
            Top = 31
            Width = 52
            Height = 17
            Caption = #44032#47609#48264#54840
            Transparent = True
          end
          object KTISStoreCodeEdit: TcxTextEdit
            Left = 96
            Top = 28
            ParentFont = False
            Properties.ImeMode = imSAlpha
            Properties.MaxLength = 15
            Properties.ReadOnly = True
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 0
            Width = 96
          end
        end
        object AdvGroupBox1: TAdvGroupBox
          Left = 81
          Top = 431
          Width = 205
          Height = 72
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          Caption = ' '#50976#54540#47084#49828'(UPLUS)'
          ParentCtl3D = True
          TabOrder = 12
          Visible = False
          object Label188: TLabel
            Left = 14
            Top = 31
            Width = 52
            Height = 17
            Caption = #44032#47609#48264#54840
            Transparent = True
          end
          object UplusJoinCodeEdit: TcxTextEdit
            Left = 88
            Top = 28
            ParentFont = False
            Properties.ImeMode = imSAlpha
            Properties.MaxLength = 15
            Properties.ReadOnly = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 0
            Width = 104
          end
        end
        object AdvGroupBox2: TAdvGroupBox
          Left = 351
          Top = 7
          Width = 305
          Height = 267
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          CheckBox.Checked = True
          CheckBox.State = cbChecked
          Caption = ' '#45796#47480#47588#51109' '#51221#48372' '#44032#51256#50724#44592' '
          ParentCtl3D = True
          TabOrder = 13
          object Label32: TLabel
            Left = 22
            Top = 37
            Width = 52
            Height = 17
            Caption = #44256#44061#48264#54840
            Transparent = True
          end
          object CopyStoreNameLabel: TLabel
            Left = 88
            Top = 68
            Width = 214
            Height = 17
            AutoSize = False
            Transparent = True
          end
          object CopyItem1CheckBox: TcxCheckBox
            Left = 22
            Top = 94
            Caption = ' '#47700#45684#51221#48372'('#48516#47448#54252#54632')'
            ParentFont = False
            Style.StyleController = EditStyleController
            TabOrder = 0
          end
          object CopyItem2CheckBox: TcxCheckBox
            Left = 22
            Top = 120
            Caption = ' PLU'#51221#48372
            ParentFont = False
            Style.StyleController = EditStyleController
            TabOrder = 1
          end
          object CopyItem3CheckBox: TcxCheckBox
            Left = 22
            Top = 147
            Caption = ' '#44277#53685#53076#46300
            ParentFont = False
            Style.StyleController = EditStyleController
            TabOrder = 2
          end
          object CopyItem4CheckBox: TcxCheckBox
            Left = 22
            Top = 174
            Caption = ' '#54872#44221#49444#51221
            ParentFont = False
            Style.StyleController = EditStyleController
            TabOrder = 3
          end
          object CopyItem5CheckBox: TcxCheckBox
            Left = 22
            Top = 200
            Caption = ' '#54252#49828#46356#51088#51064
            ParentFont = False
            Style.StyleController = EditStyleController
            TabOrder = 4
          end
          object CopyStoreCodeEdit: TcxButtonEdit
            Left = 80
            Top = 37
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = CopyStoreCodeEditPropertiesButtonClick
            Properties.OnChange = CopyStoreCodeEditPropertiesChange
            TabOrder = 5
            OnKeyPress = CopyStoreCodeEditKeyPress
            Width = 103
          end
          object CopyOkButton: TAdvGlowButton
            Left = 186
            Top = 219
            Width = 82
            Height = 30
            Caption = #54869#51064
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            FocusType = ftHot
            NotesFont.Charset = DEFAULT_CHARSET
            NotesFont.Color = clWindowText
            NotesFont.Height = -11
            NotesFont.Name = 'Tahoma'
            NotesFont.Style = []
            ParentFont = False
            Picture.Data = {
              89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
              0D00000006624B474400FF00FF00FFA0BDA7930000025B49444154388DADD4CD
              4B54611406F0E7BDE338134E90526A3023C5047EE4A6A510D942A828106A3605
              7D216EE60FD00A8D4B8BA0562DA445186181A0688B48284AB1345C55D0629416
              53CE88A9238C9124CECC7B9E16D7B93377704603CFE67E9EDF3DF73DE75E608F
              4395BC6A9A46A021DE64285DA73380D23A168F0623304DF92FD03FDC5155E642
              17B55CA7B0964250041482945F140EB837D4C3587830B9237874B4E31489118A
              1CB22007967FBC229050A27364AA28B885BDA348F90E18280290298A6A4B8473
              A80DFA873BAACA0CCCEDA2326B4B42ACFD156DA41B7E87C792006064C13285EE
              DD624A0B9091ECB96AA48CAEAC6364BB49CAB5DD601EBA3074AE078367EF8069
              0B85F0264CD3B0417FD3CFE38E6E6A82E9CCB6D88B33DD683D7202D1E462EE81
              941A9F77A6D1065D22FEFCE49603C73073E911EABDB5DB62FD9F5FE3D6C77E10
              C8A1060236A8C5A0E33509D4545462B4DD44FDBEC3F08881E77958D7872710E5
              5C1288A60DAA8C5EC85FB34FABB3B831F600156E2F5E5EBC87A1F3BD385D02A3
              102AE55AB0C1783418D9FA02EC919858FA86ABAFEEC3E7F6A225D08C81AF6F8A
              62142EAEF7BE8D00800B003039495F7BF3418A9CB46F0411FDB38C2FF139CC27
              97D033FDAC180688F4A55B7F8C3B06BBEEF195CA4D77668E22D579436B2569AB
              EAED308A2C7BB46E583327D71C831D0B0F260512029992827129816D42A95016
              73800090E81C99A2A8368AAC941E70AB3228D5B6D1F37E3ADF70A120FE8E4562
              E517824F9901952048CAFEC20640A4CFA3F5E5F5BB13DF0BF377FCC1FABC338D
              02D60180217A7EFDF6F82C1458326F2FE31F7C2EA5FD4E9FD969000000004945
              4E44AE426082}
            RepeatPause = 10
            Rounded = False
            TabOrder = 6
            OnClick = CopyOkButtonClick
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
          object CopyItem6CheckBox: TcxCheckBox
            Left = 22
            Top = 226
            Caption = ' '#53580#51060#48660#51221#48372
            ParentFont = False
            Style.StyleController = EditStyleController
            TabOrder = 7
          end
        end
        object SmsUserGroupBox: TcxGroupBox
          Left = 668
          Top = 14
          Caption = ' '#47928#51088#48156#49569
          ParentFont = False
          Style.StyleController = EditStyleController
          TabOrder = 14
          Height = 137
          Width = 300
          object AppIDLabel: TLabel
            Left = 47
            Top = 27
            Width = 39
            Height = 17
            Alignment = taRightJustify
            Caption = #50500#51060#46356
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object AppPWDLabel: TLabel
            Left = 34
            Top = 56
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
          object Label48: TLabel
            Left = 5
            Top = 87
            Width = 83
            Height = 17
            Alignment = taRightJustify
            Caption = #54869#51064' '#48708#48128#48264#54840
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object AppIDEdit: TcxTextEdit
            Left = 96
            Top = 22
            ParentFont = False
            Properties.ImeMode = imSAlpha
            Properties.MaxLength = 20
            Style.StyleController = EditStyleController
            TabOrder = 0
            Width = 113
          end
          object AppPWDEdit: TcxTextEdit
            Left = 96
            Top = 53
            ParentFont = False
            Properties.ImeMode = imSAlpha
            Properties.MaxLength = 30
            Style.StyleController = EditStyleController
            TabOrder = 1
            Width = 113
          end
          object AppPWDConfirmEdit: TcxTextEdit
            Left = 96
            Top = 84
            ParentFont = False
            Properties.ImeMode = imSAlpha
            Properties.MaxLength = 30
            Style.StyleController = EditStyleController
            TabOrder = 2
            Width = 113
          end
          object AppIDDupCheckButton: TAdvGlowButton
            Left = 215
            Top = 22
            Width = 74
            Height = 25
            Caption = #51473#48373#52404#53356
            Font.Charset = DEFAULT_CHARSET
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
            Picture.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              6100000006624B474400FF00FF00FFA0BDA7930000016C49444154388DA5504B
              4B0261143D337EE3634CCD3151A9D0528336421B836A51D02EA91FD3A2AD8B36
              2DFA0FFD855C544884BD8C34C4C0102A1B7108351BA5067C3BD32E2C049D3ABB
              CBBDE775817F825ADFBB99DF0ACE440C7A9DA286D868B6A8C304BF4968996239
              CEE6933AB42A678E9541CB79960080DDD0C39445A34AA0D5EE01000800784C5D
              F89D3A55024FA52E00405DEE0120FD43E5B30DBB598BDB5C0DA2D4194858F098
              E11AD7A3272B80A2901F0276B31600B0E8B50E75AE486DB81DC6C09F13588D0C
              823E0B45065E0DC1D5631591B4A874656A5B758524FF81E34C5509FAB8CE49BA
              D418B982CDC440CB102484B6EC9F76D0E70F8298132AAB2327B81724C4F956CF
              EDE23467A9FC65A158DB8885D7A4917E10CB8AB8CE379580D7A939BDE32F78A1
              1C8AECAC480040645AA91FA5CB49B38169FE2616C4BA75698E33668B75879121
              6C34F95C2BBCBE7F9301801AE61EDA8D4F1296A46627C60E322FB5FD6878F9AD
              7FFF051A7898D83237C62C0000000049454E44AE426082}
            RepeatPause = 10
            Rounded = False
            TabOrder = 3
            OnClick = AppIDDupCheckButtonClick
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
          object AppUserSaveButton: TAdvGlowButton
            Left = 215
            Top = 84
            Width = 74
            Height = 25
            Caption = #51200#51109
            Font.Charset = DEFAULT_CHARSET
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
            Picture.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              6100000006624B474400FF00FF00FFA0BDA7930000021C49444154388D8D93CD
              6B135114C5CF7B4DD2346926C9249D44622435DAD260880B8B685D8A2B0D4417
              D9585DB870698916FD17228AB80BB810B4E02AB45015BA10975D9414AC16249A
              0C98069CC9E7343171C632E3A29D36E6A3F56C1EEFDEF33BDCF7E012F4512C99
              99B2B2E69B2683C103008AB223488DF6EBE507E7BE767B49E7259E5A8F3023B6
              A4CFE3BAC0B9188692DDB6AA692855B6A5E2CFD26AA5AE3C4CCF85377A02E2A9
              CFD7035EF7D3F1E35CA0DF54BAF25B225F106A893777434BFB01F1D47A24E03D
              B67414AC2B5710F8EF3F4AD1C57B912F14006CE6D127FF035B8CBB67D0EF1977
              3BAD4900A0B1679929BFD73D7D147CE904C1D509BAFF661FE7988926D726E9A8
              D53C3BE662EC87C1337E82D32CC1475E85B657E35887DDE6B0CC529371C8A3FF
              360038CDBDF029966039ABA2D43AA8534A60321A3C146448D58B361370234411
              1A23FFC0EFBEA928B7D02342A86690FF28A2AA69A084A0A1001FF21A2E9F2408
              3A01766430ACAA1A645916E8AFEAEF8552655BD21B7C5DC34A4E83D34CF07E00
              0C006259AA37A4F60201803B2FB32BD3E1E0954E8381023B6A7F1800329BB9B7
              2F6E4F5CA3005097E4F9FC96C8771A0E837305215FADB41E01000580F45C78A3
              20D412B982C00FC60EE0A2504BA413673781AE658A3DFF74C66DB73CF6799D17
              39D661A7746F99540D6259AA17C5F26AB5DA9ED7E19E005DD1E4DA24E3B0DC1A
              1E367100A0C88AD06C365F2DDE3F9FEDF6FE057F69CBDF60A52AEC0000000049
              454E44AE426082}
            RepeatPause = 10
            Rounded = False
            TabOrder = 4
            OnClick = AppUserSaveButtonClick
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
        object KakaoTalkEdit: TcxTextEdit
          Left = 80
          Top = 396
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 100
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 15
          OnExit = MobileNoEditExit
          Width = 467
        end
        object StoreShortNameEdit: TcxTextEdit
          Left = 80
          Top = 69
          Enabled = False
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 50
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 16
          Width = 250
        end
      end
    end
    object BackPage: TcxTabSheet
      Caption = #44288#47532#54532#47196#44536#47016
      ImageIndex = 1
      object Label4: TLabel
        Left = 22
        Top = 397
        Width = 140
        Height = 17
        Caption = #49888#50857#52852#46300' '#54217#44512' '#49688#49688#47308#50984
        Transparent = True
      end
      object Option171CheckBox: TcxCheckBox
        Left = 18
        Top = 252
        Caption = ' '#54532#47196#44536#47016' '#49884#51089' '#49884' '#51068#51221#44288#47532' '#54268#51012' '#46916#50881#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 0
      end
      object Option222CheckBox: TcxCheckBox
        Left = 18
        Top = 280
        Caption = ' '#51068#51221#44288#47532#50640' '#47588#52636#44552#50529#51012' '#48372#51060#51648' '#50506#49845#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 1
      end
      object Option211CheckBox: TcxCheckBox
        Left = 18
        Top = 308
        Caption = ' '#47588#51077#51204#54364#50640' '#45800#44032#47484' '#48512#44032#49464#54252#54632#44552#50529#51004#47196' '#51077#47141#54633#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 2
      end
      object CardAverageRateEdit: TcxCurrencyEdit
        Left = 180
        Top = 395
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.MinValue = True
        Properties.DecimalPlaces = 1
        Properties.DisplayFormat = ',0.0 %'
        Properties.ImeMode = imSAlpha
        Properties.MaxLength = 8
        Properties.Nullable = False
        Properties.Nullstring = '0'
        Properties.OnChange = EditPropertiesChange
        Properties.OnValidate = EditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 3
        Width = 51
      end
      object cxGroupBox2: TcxGroupBox
        Left = 435
        Top = 17
        Caption = ' '#50689#49688#51613#54532#47536#53552' '#49444#51221' '
        ParentFont = False
        Style.StyleController = EditStyleController
        TabOrder = 4
        Height = 189
        Width = 420
        object Label5: TLabel
          Left = 28
          Top = 159
          Width = 375
          Height = 17
          Caption = #8251' '#54252#49828#50640#49436' '#51452#48169#54532#47536#53552#47196' '#49324#50857' '#51473#51064' '#54252#53944#45716' '#49324#50857#54624' '#49688' '#50630#49845#45768#45796
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label6: TLabel
          Left = 15
          Top = 34
          Width = 26
          Height = 17
          Caption = #44592#51333
          Transparent = True
        end
        object Label7: TLabel
          Left = 15
          Top = 66
          Width = 26
          Height = 17
          Caption = #54252#53944
          Transparent = True
        end
        object Label8: TLabel
          Left = 201
          Top = 66
          Width = 26
          Height = 17
          Caption = #49549#46020
          Transparent = True
        end
        object Label33: TLabel
          Left = 15
          Top = 99
          Width = 52
          Height = 17
          Caption = #54616#45800#50668#48177
          Transparent = True
        end
        object PosPrinterUseCheckBox: TcxCheckBox
          Left = 15
          Top = 127
          Caption = ' '#54252#49828#50640#49436' '#50689#49688#51613#54532#47536#53552#47196' '#49324#50857#54633#45768#45796
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 4
        end
        object PrinterDeviceComboBox: TcxComboBox
          Left = 54
          Top = 29
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            '0. Epson '#44228#50676
            '1. TM '#44228#50676
            '2. KICC'#45800#47568#44592)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 0
          Text = '0. Epson '#44228#50676
          Width = 275
        end
        object PrinterPortComboBox: TcxComboBox
          Left = 54
          Top = 62
          ParentFont = False
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
            'LPT')
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = 'COM1'
          Width = 70
        end
        object PrinterBaudRateComboBox: TcxComboBox
          Left = 240
          Top = 61
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            '9600'
            '19200'
            '38400'
            '57600'
            '115200')
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 2
          Text = '9600'
          Width = 90
        end
        object ReceiptBottomMarginSpinEdit: TcxSpinEdit
          Left = 76
          Top = 95
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.AssignedValues.MinValue = True
          Properties.MaxValue = 30.000000000000000000
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 3
          Width = 48
        end
      end
      object CodeGroupBox: TcxGroupBox
        Left = 23
        Top = 24
        Caption = ' '#53076' '#46300' '
        ParentFont = False
        Style.StyleController = EditStyleController
        TabOrder = 5
        Height = 204
        Width = 394
        object GoodsPrefixLabel: TLabel
          Left = 15
          Top = 92
          Width = 114
          Height = 17
          Caption = #51088#52404' '#47700#45684' '#49884#51089#49707#51088
          Transparent = True
        end
        object ScalePrefixLabel: TLabel
          Left = 16
          Top = 123
          Width = 114
          Height = 17
          Caption = #51200#50872' '#47700#45684' '#49884#51089#49707#51088
          Transparent = True
        end
        object GoodsLengthLabel: TLabel
          Left = 238
          Top = 92
          Width = 52
          Height = 17
          Caption = #51204#52404#44600#51060
          Transparent = True
        end
        object Label88: TLabel
          Left = 15
          Top = 63
          Width = 83
          Height = 17
          Caption = #47700#45684#44592#48376' '#51088#47532
          Transparent = True
        end
        object Label87: TLabel
          Left = 16
          Top = 30
          Width = 83
          Height = 17
          Caption = #47700#45684' '#48516#47448#45800#44228
          Transparent = True
        end
        object GoodsPrefixEdit: TcxCurrencyEdit
          Left = 140
          Top = 89
          EditValue = 28.000000000000000000
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.DisplayFormat = '00'
          Properties.MaxLength = 2
          Properties.MaxValue = 29.000000000000000000
          Properties.MinValue = 20.000000000000000000
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 2
          Width = 25
        end
        object GoodsLengthComboBox: TcxComboBox
          Left = 298
          Top = 89
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            '8'
            '13')
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 3
          Text = '8'
          Width = 40
        end
        object ScalePrefixEdit: TcxTextEdit
          Left = 140
          Top = 119
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 2
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 4
          Text = '20'
          Width = 25
        end
        object Option248ComboBox: TcxComboBox
          Left = 112
          Top = 26
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #45824#48516#47448'(1'#45800#44228')'#47484' '#49324#50857#54633#45768#45796'.'
            #45824', '#51473#48516#47448'(2'#45800#44228')'#47484' '#49324#50857#54633#45768#45796'.'
            #45824', '#51473', '#49548#48516#47448'(3'#45800#44228')'#47484' '#49324#50857#54633#45768#45796'.'
            #45824', '#51473', '#49548', '#49464#48516#47448'(4'#45800#44228')'#47484' '#49324#50857#54633#45768#45796'.')
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 0
          Text = #45824#48516#47448'(1'#45800#44228')'#47484' '#49324#50857#54633#45768#45796'.'
          Width = 257
        end
        object MenuCodeLengthEdit: TcxSpinEdit
          Left = 117
          Top = 59
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.MaxValue = 14.000000000000000000
          Properties.MinValue = 4.000000000000000000
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Value = 4
          Width = 48
        end
        object cxLabel52: TcxLabel
          Left = 14
          Top = 152
          Caption = '13'#51088#47532' - '#54532#47532#54589#49828'(2)+'#47700#45684#53076#46300'(4)+'#44552#50529'(6)+'#52404#53356#48708#53944'(1)'
          ParentFont = False
          Style.Font.Charset = HANGEUL_CHARSET
          Style.Font.Color = clRed
          Style.Font.Height = -12
          Style.Font.Name = #44404#47548#52404
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
        object cxLabel32: TcxLabel
          Left = 8
          Top = 174
          Caption = ' 18'#51088#47532' - '#54532#47532#54589#49828'(2)+'#47700#45684#53076#46300'(4)+'#51473#47049'(5)+'#44552#50529'(6)+'#52404#53356#48708#53944'(1)'
          ParentFont = False
          Style.Font.Charset = HANGEUL_CHARSET
          Style.Font.Color = clRed
          Style.Font.Height = -12
          Style.Font.Name = #44404#47548#52404
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Transparent = True
        end
      end
      object Option002CheckBox: TcxCheckBox
        Left = 18
        Top = 226
        Caption = ' '#53076#46300#44050#51012' '#51088#46041' '#51613#44032#54633#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 6
      end
      object Option389CheckBox: TcxCheckBox
        Left = 18
        Top = 335
        Caption = ' '#52888#47536#45908#47588#52636#50640' '#54788#44552#50689#49688#51613' '#45824#49888' '#50808#49345#47588#52636#51012' '#54364#49884#54633#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 7
        Visible = False
      end
      object Option454CheckBox: TcxCheckBox
        Left = 18
        Top = 363
        Caption = ' '#47700#45684#47749' '#49688#51221' '#49884' '#45800#52629#47749#51012' '#51088#46041#51004#47196' '#49688#51221#54616#51648' '#50506#49845#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 8
        Visible = False
      end
    end
    object POSPage: TcxTabSheet
      Caption = 'POS '#54872#44221
      ImageIndex = 2
      OnShow = POSPageShow
      object POSPageControl: TcxPageControl
        Left = 0
        Top = 0
        Width = 1279
        Height = 926
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = POSCommonTabSheet
        Properties.CustomButtons.Buttons = <>
        Properties.MultiLine = True
        Properties.TabHeight = 25
        Properties.TabWidth = 100
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        ClientRectBottom = 926
        ClientRectRight = 1279
        ClientRectTop = 54
        object POSCommonTabSheet: TcxTabSheet
          Caption = #44277#53685
          ImageIndex = 0
          object AdvScrollBox1: TAdvScrollBox
            Left = 0
            Top = 0
            Width = 1279
            Height = 872
            Align = alClient
            BorderStyle = bsNone
            DoubleBuffered = True
            Ctl3D = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            TabOrder = 0
            object Label21: TLabel
              Left = 23
              Top = 266
              Width = 96
              Height = 17
              Caption = #53580#51060#48660' '#44592#48376#47700#45684
            end
            object Label22: TLabel
              Left = 285
              Top = 264
              Width = 52
              Height = 17
              Caption = #47700#51064#54252#49828
            end
            object Label23: TLabel
              Left = 24
              Top = 296
              Width = 109
              Height = 17
              Caption = #47588#52636#54788#54889' '#54056#49828#50892#46300
            end
            object Label24: TLabel
              Left = 219
              Top = 296
              Width = 122
              Height = 17
              Caption = #50689#49688#51613#44288#47532' '#54056#49828#50892#46300
            end
            object Label95: TLabel
              Left = 37
              Top = 329
              Width = 96
              Height = 17
              Caption = #51452#47928#48264#54840' '#51088#47532#49688
            end
            object Option138CheckBox: TcxCheckBox
              Left = 18
              Top = 106
              Caption = ' '#44256#44061'/'#51452#48169' '#51452#47928#49436#50640' '#50672#47161#45824#48324#47196' '#44256#44061#49688#47484' '#52636#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 2
            end
            object Option040CheckBox: TcxCheckBox
              Left = 18
              Top = 55
              Caption = ' '#48152#54408', '#44208#51228#52712#49548' '#49884' '#49324#50976#47484' '#51077#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 3
            end
            object Option044CheckBox: TcxCheckBox
              Left = 18
              Top = 80
              Caption = ' '#44552#51204#54632#51012' '#50676#46412' '#48708#48128#48264#54840#47484' '#54869#51064#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              Style.TextColor = clWindowText
              TabOrder = 4
            end
            object Option054CheckBox: TcxCheckBox
              Left = 18
              Top = 8
              Caption = ' '#50689#49688#51613#44288#47532' '#54868#47732#50640' '#44552#50529#51012' '#54364#49884#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 0
            end
            object TipGroupBox: TcxGroupBox
              Left = 456
              Top = 3
              Caption = ' '#48393#49324#47308' '#44288#47144' '
              ParentFont = False
              Style.StyleController = EditStyleController
              TabOrder = 5
              Height = 134
              Width = 418
              object Option183Label: TLabel
                Left = 20
                Top = 103
                Width = 70
                Height = 17
                Caption = #48393#49324#47308' '#47700#45684
              end
              object Label9: TLabel
                Left = 213
                Top = 103
                Width = 44
                Height = 17
                Caption = #44552#50529'/'#50984
              end
              object Option020CheckBox: TcxCheckBox
                Left = 15
                Top = 20
                Caption = ' '#48393#49324#47308' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 0
              end
              object Option160CheckBox: TcxCheckBox
                Left = 15
                Top = 45
                Caption = ' '#47700#45684#50640' '#48393#49324#47308' '#44552#50529#51012' '#54252#54632#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 1
              end
              object TipTypeComboBox: TcxComboBox
                Left = 345
                Top = 99
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  #50896
                  '%')
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 5
                Text = #50896
                Width = 41
              end
              object Option289CheckBox: TcxCheckBox
                Left = 15
                Top = 70
                Caption = ' '#47700#45684#50640' '#48393#49324#47308#47484' '#48324#46020#44552#50529#51004#47196' '#51077#47141#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 2
              end
              object TipMenuEdit: TcxButtonEdit
                Left = 98
                Top = 99
                ParentFont = False
                Properties.Buttons = <
                  item
                    Default = True
                    Kind = bkEllipsis
                  end>
                Properties.ReadOnly = True
                Properties.OnButtonClick = TableDefaultMenuEditPropertiesButtonClick
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 3
                Width = 108
              end
              object TipDefaultEdit: TcxCurrencyEdit
                Left = 265
                Top = 99
                ParentFont = False
                Properties.Alignment.Horz = taRightJustify
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = ',0'
                Properties.ImeMode = imSAlpha
                Properties.MaxLength = 8
                Properties.Nullable = False
                Properties.Nullstring = '0'
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 4
                Width = 78
              end
            end
            object DCGroupBox: TcxGroupBox
              Left = 456
              Top = 139
              Caption = ' '#50696#50557#44288#47144' '
              ParentFont = False
              Style.StyleController = EditStyleController
              TabOrder = 6
              Height = 121
              Width = 418
              object Label10: TLabel
                Left = 21
                Top = 25
                Width = 140
                Height = 17
                Caption = #53580#51060#48660#50640' '#50696#50557#54364#49884' '#49884#44036
              end
              object Label12: TLabel
                Left = 217
                Top = 25
                Width = 98
                Height = 17
                Caption = #48516' '#51204'  '#51333#47308#49884#44036' '
              end
              object Label13: TLabel
                Left = 366
                Top = 25
                Width = 31
                Height = 17
                Caption = #48516' '#54980
              end
              object Label14: TLabel
                Left = 21
                Top = 59
                Width = 70
                Height = 17
                Caption = #49440#49688#44552' '#47700#45684
              end
              object BookingTableDisplayBeforeTimeEdit: TcxCurrencyEdit
                Left = 167
                Top = 22
                ParentFont = False
                Properties.Alignment.Horz = taRightJustify
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = ',0'
                Properties.ImeMode = imSAlpha
                Properties.MaxLength = 8
                Properties.Nullable = False
                Properties.Nullstring = '0'
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 0
                Width = 45
              end
              object BookingTableDisplayEndTimeEdit: TcxCurrencyEdit
                Left = 316
                Top = 22
                ParentFont = False
                Properties.Alignment.Horz = taRightJustify
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = ',0'
                Properties.ImeMode = imSAlpha
                Properties.MaxLength = 8
                Properties.Nullable = False
                Properties.Nullstring = '0'
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 1
                Width = 45
              end
              object BookingMenuEdit: TcxButtonEdit
                Left = 108
                Top = 55
                ParentFont = False
                Properties.Buttons = <
                  item
                    Default = True
                    Kind = bkEllipsis
                  end>
                Properties.ReadOnly = True
                Properties.OnButtonClick = TableDefaultMenuEditPropertiesButtonClick
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 2
                Width = 121
              end
              object Option206CheckBox: TcxCheckBox
                Left = 15
                Top = 81
                Caption = ' '#53580#51060#48660#50640' '#48708#44256#45236#50857#51012' '#54364#49884#54633#45768#45796
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 3
              end
            end
            object OverTimeGroupBox: TcxGroupBox
              Left = 456
              Top = 266
              Caption = ' '#52628#44032#50836#44552' '
              ParentFont = False
              Style.StyleController = EditStyleController
              TabOrder = 7
              Height = 136
              Width = 418
              object Label18: TLabel
                Left = 22
                Top = 22
                Width = 83
                Height = 17
                Caption = #52628#44032#50836#44552' '#47700#45684
              end
              object Label19: TLabel
                Left = 69
                Top = 53
                Width = 282
                Height = 17
                Caption = #48516' '#51060#54980#48512#53552'           '#48516' '#47560#45796'                    '#50896
              end
              object Option223CheckBox: TcxCheckBox
                Left = 15
                Top = 80
                Caption = ' '#44256#44061#49688' '#48324#47196' '#52628#44032#50836#44552#51012' '#51201#50857#54633#45768#45796
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 0
              end
              object AddFareMenuEdit: TcxButtonEdit
                Left = 111
                Top = 18
                ParentFont = False
                Properties.Buttons = <
                  item
                    Default = True
                    Kind = bkEllipsis
                  end>
                Properties.ReadOnly = True
                Properties.OnButtonClick = TableDefaultMenuEditPropertiesButtonClick
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 1
                Width = 121
              end
              object AddFareDefaultTimeEdit: TcxCurrencyEdit
                Left = 19
                Top = 49
                ParentFont = False
                Properties.Alignment.Horz = taRightJustify
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = ',0'
                Properties.ImeMode = imSAlpha
                Properties.MaxLength = 8
                Properties.Nullable = False
                Properties.Nullstring = '0'
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 2
                Width = 47
              end
              object AddFareEachTimeEdit: TcxCurrencyEdit
                Left = 143
                Top = 49
                ParentFont = False
                Properties.Alignment.Horz = taRightJustify
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = ',0'
                Properties.ImeMode = imSAlpha
                Properties.MaxLength = 8
                Properties.Nullable = False
                Properties.Nullstring = '0'
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 3
                Width = 47
              end
              object AddFareAmountEdit: TcxCurrencyEdit
                Left = 248
                Top = 49
                ParentFont = False
                Properties.Alignment.Horz = taRightJustify
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = ',0'
                Properties.ImeMode = imSAlpha
                Properties.MaxLength = 8
                Properties.Nullable = False
                Properties.Nullstring = '0'
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 4
                Width = 86
              end
              object Option412CheckBox: TcxCheckBox
                Left = 15
                Top = 105
                Caption = ' '#44592#51456#49884#44036#51060' '#51648#45208#47732' '#47924#51312#44148' '#52628#44032#50836#44552#51012' '#44228#49328#54620#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 5
              end
            end
            object Option172CheckBox: TcxCheckBox
              Left = 18
              Top = 132
              Caption = ' '#44428#54620#51060' '#50630#51012' '#46412' '#44428#54620#51060' '#51080#45716' '#49324#50857#51088#47484' '#51312#54924#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 8
            end
            object Option265CheckBox: TcxCheckBox
              Left = 18
              Top = 158
              Caption = ' '#54252#49828#50640#49436' '#52636#53748#44540' '#49884' '#51060#48120#51648#47484' '#51200#51109#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 9
            end
            object TableDefaultMenuEdit: TcxButtonEdit
              Left = 140
              Top = 261
              ParentFont = False
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              Properties.ReadOnly = True
              Properties.OnButtonClick = TableDefaultMenuEditPropertiesButtonClick
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 10
              Width = 101
            end
            object MainPosComboBox: TcxComboBox
              Left = 344
              Top = 259
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                '01')
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 11
              Text = '01'
              Width = 61
            end
            object SaleReportPasswordEdit: TcxTextEdit
              Left = 140
              Top = 292
              ParentFont = False
              Properties.MaxLength = 10
              Properties.PasswordChar = '*'
              Properties.OnChange = EditPropertiesChange
              Properties.OnValidate = EditPropertiesValidate
              Style.StyleController = EditStyleController
              TabOrder = 12
              Width = 61
            end
            object SaleSearchPasswordEdit: TcxTextEdit
              Left = 346
              Top = 293
              ParentFont = False
              Properties.MaxLength = 10
              Properties.PasswordChar = '*'
              Properties.OnChange = EditPropertiesChange
              Properties.OnValidate = EditPropertiesValidate
              Style.StyleController = EditStyleController
              TabOrder = 13
              Width = 60
            end
            object Option357CheckBox: TcxCheckBox
              Left = 18
              Top = 184
              Caption = ' '#44208#51228#52712#49548' '#49884' '#48152#54408#51004#47196' '#51200#51109#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 14
            end
            object Option363CheckBox: TcxCheckBox
              Left = 18
              Top = 208
              Caption = ' '#54252#49828#50640#49436' '#47700#45684#46321#47197' '#48143' '#45800#44032#49688#51221' '#44592#45733#51012' '#49324#50857#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 15
            end
            object Option304SpinEdit: TcxSpinEdit
              Left = 140
              Top = 325
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.MaxValue = 8.000000000000000000
              Properties.MinValue = 2.000000000000000000
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 17
              Value = 4
              Width = 46
            end
            object Option385CheckBox: TcxCheckBox
              Left = 20
              Top = 359
              Caption = ' '#44552#50529#51077#47141' '#53412#54056#46300#50640' '#39'000'#39#51012' '#39'00'#39#53412#47196' '#49324#50857#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 18
            end
            object cxGroupBox17: TcxGroupBox
              Left = 30
              Top = 390
              Caption = ' '#51652#46041'('#54840#52636')'#48296' '
              ParentFont = False
              Style.StyleController = EditStyleController
              TabOrder = 19
              Height = 159
              Width = 381
              object Label130: TLabel
                Left = 20
                Top = 64
                Width = 70
                Height = 17
                Caption = #44228#49328#50756#47308' '#54980
              end
              object Label172: TLabel
                Left = 20
                Top = 93
                Width = 52
                Height = 17
                Caption = #54589#50629#51109#49548
              end
              object Option311CheckBox: TcxCheckBox
                Left = 18
                Top = 28
                Caption = ' '#51652#46041#48296'('#54840#52636') '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 0
              end
              object Option061ComboBox: TcxComboBox
                Left = 96
                Top = 59
                ParentFont = False
                Properties.Alignment.Horz = taLeftJustify
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  #54840#52636#48264#54840#47484' '#51077#47141#54633#45768#45796'.'
                  #51204#54868#48264#54840#47484' '#51077#47141#54633#45768#45796'.'
                  #51204#54868#48264#54840' '#51077#47141'+'#51204#51088#50689#49688#51613' '#48156#49569)
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 1
                Text = #54840#52636#48264#54840#47484' '#51077#47141#54633#45768#45796'.'
                Width = 200
              end
              object DefaultPickUpEdit: TcxTextEdit
                Left = 96
                Top = 89
                ParentFont = False
                Properties.MaxLength = 50
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 2
                Width = 245
              end
              object Option478CheckBox: TcxCheckBox
                Left = 19
                Top = 121
                Caption = ' DID '#54840#52636' '#49884' '#50508#47548#53665#46020' '#44057#51060' '#48156#49569#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 3
              end
            end
            object Option194CheckBox: TcxCheckBox
              Left = 18
              Top = 233
              Caption = ' '#50836#51068#48324#45800#44032' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 16
            end
            object Option498CheckBox: TcxCheckBox
              Left = 20
              Top = 33
              Caption = ' '#50689#49688#51613#44288#47532' '#54868#47732#50640' '#51452#47928#44552#50529#50640' '#54788#50689#44552#50529' '#54364#49884' '#54633#45768#45796
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              Style.TransparentBorder = False
              TabOrder = 1
            end
          end
        end
        object POSOrderTabSheet: TcxTabSheet
          Caption = #51452#47928#44288#47144
          ImageIndex = 1
          object AdvScrollBox2: TAdvScrollBox
            Left = 0
            Top = 0
            Width = 1279
            Height = 872
            Align = alClient
            BorderStyle = bsNone
            DoubleBuffered = True
            Ctl3D = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            TabOrder = 0
            object Label102: TLabel
              Left = 430
              Top = 351
              Width = 70
              Height = 17
              Caption = #48512#47700#45684' '#54364#49884
            end
            object Label227: TLabel
              Left = 26
              Top = 248
              Width = 75
              Height = 17
              Caption = #51452#47928' '#52712#49548' '#49884
            end
            object Option014CheckBox: TcxCheckBox
              Left = 20
              Top = 2
              Caption = ' '#51452#47928' '#49884' '#44256#44061#51221#48372#47484' '#51077#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 0
            end
            object Option014RadioGroup: TcxRadioGroup
              Left = 17
              Top = 25
              ParentFont = False
              Properties.Items = <
                item
                  Caption = #44256#44061#49688#47484' '#51077#47141#54633#45768#45796'.'
                end
                item
                  Caption = #44256#44061#51221#48372#47484' '#51077#47141#54633#45768#45796'.'
                end
                item
                  Caption = #45812#45817#51088#47484' '#51077#47141#54633#45768#45796'.'
                end
                item
                  Caption = #45812#45817#51088'+'#44256#44061#49688#47484' '#51077#47141#54633#45768#45796'.'
                end
                item
                  Caption = #45812#45817#51088'+'#44256#44061#51221#48372#47484' '#51077#47141#54633#45768#45796'.'
                end>
              Properties.OnChange = EditPropertiesChange
              Style.BorderStyle = ebsOffice11
              Style.StyleController = EditStyleController
              Style.TransparentBorder = True
              TabOrder = 1
              Transparent = True
              Height = 137
              Width = 271
            end
            object Option037CheckBox: TcxCheckBox
              Left = 15
              Top = 166
              Caption = ' '#51452#47928' '#49884' '#47560#45796' '#45812#45817#51088#47484' '#51077#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 2
            end
            object Option095CheckBox: TcxCheckBox
              Left = 15
              Top = 190
              Caption = ' '#52636#44540#54620' '#45812#45817#51088#47564' '#49324#50857#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 3
            end
            object Option036CheckBox: TcxCheckBox
              Left = 15
              Top = 215
              Caption = ' '#51452#47928#49688#47049' '#54633#44228#47484' '#54364#49884#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 4
            end
            object Option057CheckBox: TcxCheckBox
              Left = 15
              Top = 340
              Caption = ' '#50500#51060#53596' '#47700#45684#47484' '#49324#50857#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 5
            end
            object Option046CheckBox: TcxCheckBox
              Left = 15
              Top = 364
              Caption = ' '#51221#49328#54252#49828#46020' '#44060#51216#51012' '#54644#50556' '#51452#47928#51012' '#54624' '#49688' '#51080#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 6
            end
            object Option071CheckBox: TcxCheckBox
              Left = 427
              Top = 3
              Caption = ' '#49440#51452#47928' '#54980#49436#48708#49828' '#48169#49885#51004#47196' '#49324#50857#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 7
            end
            object Option303CheckBox: TcxCheckBox
              Left = 427
              Top = 54
              Caption = ' '#49440#51452#47928' '#54980#54252#51109' '#48169#49885#51012' '#49324#50857#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 8
            end
            object Option164CheckBox: TcxCheckBox
              Left = 427
              Top = 80
              Caption = ' '#47700#45684#51032' '#54364#49884#49692#48264' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 9
            end
            object Option178CheckBox: TcxCheckBox
              Left = 427
              Top = 106
              Caption = ' '#50689#49688#51613#50640' '#52636#47141#54616#51648' '#50506#45716' '#47700#45684#45716' '#51200#51109#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 10
            end
            object Option247CheckBox: TcxCheckBox
              Left = 427
              Top = 132
              Caption = ' '#47700#45684#48264#54840' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 11
            end
            object Option084CheckBox: TcxCheckBox
              Left = 427
              Top = 157
              Caption = ' '#51452#47928' '#49884' '#48512#44032#49464#44552#50529#51012' '#54364#49884#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 12
            end
            object Option262CheckBox: TcxCheckBox
              Left = 427
              Top = 183
              Caption = ' '#51452#47928#52712#49548' '#49884' '#47928#51088#47484' '#48156#49569#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 13
            end
            object Option300CheckBox: TcxCheckBox
              Left = 427
              Top = 209
              Caption = ' '#51452#47928' '#49884' '#51452#47928#54869#51064#54364#49884' '#44592#45733#51012' '#49324#50857#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 14
            end
            object Option307CheckBox: TcxCheckBox
              Left = 427
              Top = 235
              Caption = ' '#44256#44061#49688' '#52628#51221#47700#45684' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 15
            end
            object Option326CheckBox: TcxCheckBox
              Left = 427
              Top = 261
              Caption = ' '#44256#44061#49688' '#52628#52397#47700#45684' '#44228#49328' '#49884' '#46972#48296#51012' '#52636#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 16
            end
            object Option342CheckBox: TcxCheckBox
              Left = 427
              Top = 288
              Caption = ' '#49436#48708#49828' '#49884' '#49436#48708#49828#49324#50976#47484' '#49440#53469#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 17
            end
            object Option350ComboBox: TcxComboBox
              Left = 512
              Top = 348
              ParentFont = False
              Properties.Alignment.Horz = taLeftJustify
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #47784#46160'('#51452#47928', '#46272#50620') '#54364#49884#54633#45768#45796
                #46272#50620#50640' '#54364#49884#54616#51648' '#50506#49845#45768#45796
                #47700#51064#50640' '#54364#49884#54616#51648' '#50506#49845#45768#45796
                #47784#46160' '#54364#49884#54616#51648' '#50506#49845#45768#45796)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 18
              Text = #47784#46160'('#51452#47928', '#46272#50620') '#54364#49884#54633#45768#45796
              Width = 200
            end
            object Option396CheckBox: TcxCheckBox
              Left = 427
              Top = 28
              Caption = ' '#49436#48708#49828#47196' '#48320#44221' '#49884' '#51452#48169#50640' '#52636#47141#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 19
            end
            object cxGroupBox15: TcxGroupBox
              Left = 21
              Top = 274
              Caption = ' '#51452#48169#47700#47784' '
              ParentFont = False
              Style.StyleController = EditStyleController
              TabOrder = 20
              Height = 56
              Width = 404
              object Option156ComboBox: TcxComboBox
                Left = 10
                Top = 21
                ParentFont = False
                Properties.Alignment.Horz = taLeftJustify
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  '0. '#47700#45684#48324#47196' '#49324#50857#54616#51648' '#50506#49845#45768#45796'.'
                  '1. '#47700#45684#48324#47196' '#49324#50857#54616#44256' '#51452#47928' '#49884' '#51452#48169#47700#47784#47484' '#49440#53469#54633#45768#45796'.'
                  '2. '#47700#45684#48324#47196' '#49324#50857#54616#44256' '#51452#47928' '#49884' '#51452#48169#47700#47784#47484' '#49440#53469#54616#51648' '#50506#49845#45768#45796'.')
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 0
                Text = '0. '#47700#45684#48324#47196' '#49324#50857#54616#51648' '#50506#49845#45768#45796'.'
                Width = 378
              end
            end
            object Option433CheckBox: TcxCheckBox
              Left = 427
              Top = 315
              Caption = ' '#51200#50872#47700#45684' '#51452#47928' '#49884' '#51473#47049'(g)'#51012' '#51077#47141#48155#49845#45768#45796'('#44592#48376' '#44552#50529')'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 21
            end
            object Option023CheckBox: TcxCheckBox
              Left = 15
              Top = 389
              Caption = ' '#53076#49828#47700#45684#50640' '#48512#47700#45684#51032' '#45800#44032#47484' '#51201#50857#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 22
            end
            object Option414CheckBox: TcxCheckBox
              Left = 427
              Top = 380
              Caption = ' '#51452#47928#54868#47732#50640#49436' '#52636#47141#50668#48512' 2'#52264' '#49440#53469#48169#49885' '#49324#50857
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 23
            end
            object Option491CheckBox: TcxCheckBox
              Left = 15
              Top = 413
              Caption = ' '#45817#51068' '#54032#47588#49688#47049#51012' '#44288#47532#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 24
            end
            object Option015ComboBox: TcxComboBox
              Left = 114
              Top = 243
              ParentFont = False
              Properties.Alignment.Horz = taLeftJustify
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52712#49548#50668#48512#47484' '#54869#51064#54633#45768#45796'.'
                #52712#49548#49324#50976#51012' '#51077#47141#54633#45768#45796'.'
                #52712#49548#49324#50976#47484' '#54869#51064#54616#51648' '#50506#49845#45768#45796'.')
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 25
              Text = #52712#49548#50668#48512#47484' '#54869#51064#54633#45768#45796'.'
              Width = 200
            end
          end
        end
        object POSTableTabSheet: TcxTabSheet
          Caption = #53580#51060#48660#44288#47144
          ImageIndex = 2
          object AdvScrollBox3: TAdvScrollBox
            Left = 0
            Top = 0
            Width = 1279
            Height = 872
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            DoubleBuffered = True
            Ctl3D = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            TabOrder = 0
            object Label134: TLabel
              Left = 419
              Top = 10
              Width = 197
              Height = 17
              Caption = #44228#49328#50756#47308' '#54980' ['#53580#51060#48660#51221#47532'] '#47928#44396#47484' '
            end
            object Label135: TLabel
              Left = 676
              Top = 10
              Width = 117
              Height = 17
              Caption = #52488' '#46041#50504' '#54364#49884#54633#45768#45796'.'
            end
            object Label159: TLabel
              Left = 416
              Top = 225
              Width = 127
              Height = 17
              Caption = #47700#45684#50672#46041' '#53580#51060#48660' '#49353#49345
            end
            object TableButton: TPosButton
              Left = 251
              Top = 11
              Width = 137
              Height = 109
              Style = bsRound
              BorderColor = 12615680
              Number.NumberString = '1-1'
              Number.Height = 23
              Number.Font.Charset = DEFAULT_CHARSET
              Number.Font.Color = clWhite
              Number.Font.Height = -15
              Number.Font.Name = #47569#51008' '#44256#46357
              Number.Font.Style = []
              Number.Color = 8804864
              Number.ShowColor = True
              Bottom.LeftString = '2'#47749
              Bottom.Height = 25
              Bottom.Font.Charset = DEFAULT_CHARSET
              Bottom.Font.Color = clWhite
              Bottom.Font.Height = -15
              Bottom.Font.Name = #47569#51008' '#44256#46357
              Bottom.Font.Style = []
              Bottom.Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = #47569#51008' '#44256#46357
              Font.Style = []
              Caption = ''
              Menu.Name = #50500#47700#47532#52852#45432
              Menu.Qty = '5'
              Menu.Font.Charset = DEFAULT_CHARSET
              Menu.Font.Color = clWhite
              Menu.Font.Height = -13
              Menu.Font.Name = #47569#51008' '#44256#46357
              Menu.Font.Style = []
              Amount.Caption = '[5,000'#50896']'
              Amount.Font.Charset = DEFAULT_CHARSET
              Amount.Font.Color = clWhite
              Amount.Font.Height = -16
              Amount.Font.Name = #47569#51008' '#44256#46357
              Amount.Font.Style = []
              Down = False
              Color = 12615680
              LayoutTop = True
              IsWork = False
              IsUse = False
            end
            object Label104: TLabel
              Left = 21
              Top = 318
              Width = 83
              Height = 17
              Caption = #50864#52769#54616#45800' '#54364#49884
            end
            object Label196: TLabel
              Left = 20
              Top = 347
              Width = 150
              Height = 17
              Caption = #53580#51060#48660' '#51216#50976' '#54980' '#51088#46041' '#45803#55192
            end
            object Label105: TLabel
              Left = 416
              Top = 261
              Width = 70
              Height = 17
              Caption = #48148#45797' '#51060#48120#51648
            end
            object Option025CheckBox: TcxCheckBox
              Left = 21
              Top = 6
              Caption = ' '#53580#51060#48660#47749' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 0
            end
            object Option024RadioGroup: TcxRadioGroup
              Left = 19
              Top = 48
              Alignment = alCenterCenter
              ParentFont = False
              Properties.Items = <
                item
                  Caption = ' '#53580#51060#48660#47749' '#54364#49884
                end
                item
                  Caption = ' '#51452#47928#47700#45684' '#54364#49884
                end>
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 1
              Transparent = True
              Height = 70
              Width = 196
            end
            object Option174CheckBox: TcxCheckBox
              Left = 17
              Top = 130
              Caption = ' '#51452#47928' '#49884' '#53580#51060#48660#47749#51012' '#51340#52769#49345#45800#50640' '#54364#49884#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 2
            end
            object Option175CheckBox: TcxCheckBox
              Left = 17
              Top = 156
              Caption = ' '#51452#47928' '#49884' '#51452#47928#44552#50529#51012' '#54364#49884#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 3
            end
            object Option059CheckBox: TcxCheckBox
              Left = 18
              Top = 182
              Caption = ' '#53580#51060#48660#50640' '#44221#44284#49884#44036#51012' '#54364#49884#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 4
            end
            object Option058CheckBox: TcxCheckBox
              Left = 18
              Top = 207
              Caption = ' '#52789#51012' '#49324#50857#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 5
            end
            object cxGroupBox3: TcxGroupBox
              Left = 21
              Top = 372
              Caption = ' '#53580#51060#48660#54868#47732' '#44552#50529#54364#49884' '
              ParentFont = False
              Style.StyleController = EditStyleController
              TabOrder = 6
              Height = 85
              Width = 380
              object Label30: TLabel
                Left = 15
                Top = 24
                Width = 52
                Height = 17
                Caption = #51221#49328#54252#49828
              end
              object Label29: TLabel
                Left = 15
                Top = 52
                Width = 52
                Height = 17
                Caption = #51452#47928#54252#49828
              end
              object Option013ComboBox: TcxComboBox
                Left = 89
                Top = 20
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  #47588#52636#44552#50529' + '#51452#47928#44552#50529
                  #51452#47928#44552#50529
                  #50630#51020)
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 0
                Width = 247
              end
              object Option170ComboBox: TcxComboBox
                Left = 89
                Top = 49
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  '0. '#47588#52636#44552#50529' + '#51452#47928#44552#50529
                  '1. '#51452#47928#44552#50529
                  '2. '#50630#51020)
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 1
                Text = '0. '#47588#52636#44552#50529' + '#51452#47928#44552#50529
                Width = 247
              end
            end
            object Option321CheckBox: TcxCheckBox
              Left = 18
              Top = 232
              Caption = ' '#52572#51333#51452#47928' '#53580#51060#48660' '#49353#49345#51012' '#48320#44221#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 7
            end
            object Option360ComboBox: TcxComboBox
              Left = 622
              Top = 6
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                '0'
                '30'
                '40'
                '50'
                '60'
                '70'
                '80'
                '90'
                '100'
                '110')
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 8
              Text = '0'
              Width = 46
            end
            object cxGroupBox8: TcxGroupBox
              Left = 413
              Top = 43
              Caption = ' '#44536#47353#49353#49345
              ParentFont = False
              Style.StyleController = EditStyleController
              TabOrder = 9
              Height = 163
              Width = 380
              object Label143: TLabel
                Left = 27
                Top = 28
                Width = 64
                Height = 17
                Caption = '1'#48264#51704' '#44536#47353
              end
              object Label144: TLabel
                Left = 27
                Top = 59
                Width = 64
                Height = 17
                Caption = '2'#48264#51704' '#44536#47353
              end
              object Label145: TLabel
                Left = 27
                Top = 90
                Width = 64
                Height = 17
                Caption = '3'#48264#51704' '#44536#47353
              end
              object Label146: TLabel
                Left = 27
                Top = 121
                Width = 64
                Height = 17
                Caption = '4'#48264#51704' '#44536#47353
              end
              object Label147: TLabel
                Left = 203
                Top = 27
                Width = 64
                Height = 17
                Caption = '5'#48264#51704' '#44536#47353
              end
              object Label148: TLabel
                Left = 203
                Top = 58
                Width = 64
                Height = 17
                Caption = '6'#48264#51704' '#44536#47353
              end
              object Label149: TLabel
                Left = 203
                Top = 89
                Width = 64
                Height = 17
                Caption = '7'#48264#51704' '#44536#47353
              end
              object Label150: TLabel
                Left = 203
                Top = 119
                Width = 64
                Height = 17
                Caption = '8'#48264#51704' '#44536#47353
              end
              object TableGroupColor1Panel: TPanel
                Left = 111
                Top = 25
                Width = 76
                Height = 26
                BevelOuter = bvSpace
                BorderStyle = bsSingle
                Caption = #50630#51020
                Color = clWhite
                Ctl3D = False
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 0
                OnClick = TableGroupColor1PanelClick
              end
              object TableGroupColor2Panel: TPanel
                Left = 111
                Top = 56
                Width = 76
                Height = 26
                BevelOuter = bvSpace
                BorderStyle = bsSingle
                Caption = #50630#51020
                Color = clWhite
                Ctl3D = False
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 1
                OnClick = TableGroupColor1PanelClick
              end
              object TableGroupColor3Panel: TPanel
                Left = 111
                Top = 87
                Width = 76
                Height = 26
                BevelOuter = bvSpace
                BorderStyle = bsSingle
                Caption = #50630#51020
                Color = clWhite
                Ctl3D = False
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 2
                OnClick = TableGroupColor1PanelClick
              end
              object TableGroupColor4Panel: TPanel
                Left = 111
                Top = 118
                Width = 76
                Height = 26
                BevelOuter = bvSpace
                BorderStyle = bsSingle
                Caption = #50630#51020
                Color = clWhite
                Ctl3D = False
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 3
                OnClick = TableGroupColor1PanelClick
              end
              object TableGroupColor5Panel: TPanel
                Left = 287
                Top = 24
                Width = 76
                Height = 26
                BevelOuter = bvSpace
                BorderStyle = bsSingle
                Caption = #50630#51020
                Color = clWhite
                Ctl3D = False
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 4
                OnClick = TableGroupColor1PanelClick
              end
              object TableGroupColor6Panel: TPanel
                Left = 287
                Top = 55
                Width = 76
                Height = 26
                BevelOuter = bvSpace
                BorderStyle = bsSingle
                Caption = #50630#51020
                Color = clWhite
                Ctl3D = False
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 5
                OnClick = TableGroupColor1PanelClick
              end
              object TableGroupColor7Panel: TPanel
                Left = 287
                Top = 86
                Width = 76
                Height = 26
                BevelOuter = bvSpace
                BorderStyle = bsSingle
                Caption = #50630#51020
                Color = clWhite
                Ctl3D = False
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 6
                OnClick = TableGroupColor1PanelClick
              end
              object TableGroupColor8Panel: TPanel
                Left = 287
                Top = 117
                Width = 76
                Height = 26
                BevelOuter = bvSpace
                BorderStyle = bsSingle
                Caption = #50630#51020
                Color = clWhite
                Ctl3D = False
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 7
                OnClick = TableGroupColor1PanelClick
              end
            end
            object Option378CheckBox: TcxCheckBox
              Left = 18
              Top = 257
              Caption = ' '#51077#51109#49884#44036#51012' '#54364#49884#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 10
            end
            object MenuColorPanel: TPanel
              Left = 565
              Top = 220
              Width = 76
              Height = 26
              BevelOuter = bvSpace
              BorderStyle = bsSingle
              Caption = #50630#51020
              Color = clWhite
              Ctl3D = False
              ParentBackground = False
              ParentCtl3D = False
              TabOrder = 11
              OnClick = TableGroupColor1PanelClick
            end
            object cxGroupBox13: TcxGroupBox
              Left = 21
              Top = 467
              Caption = ' '#53580#51060#48660#49353#49345' '#48320#44221
              ParentFont = False
              Style.StyleController = EditStyleController
              TabOrder = 12
              Height = 74
              Width = 380
              object Label27: TLabel
                Left = 17
                Top = 34
                Width = 44
                Height = 17
                Caption = #51077#51109' '#54980
              end
              object Label28: TLabel
                Left = 133
                Top = 35
                Width = 13
                Height = 17
                Caption = #48516
              end
              object Label11: TLabel
                Left = 203
                Top = 34
                Width = 26
                Height = 17
                Caption = #49353#49345
              end
              object TableColorChangeTimeEdit: TcxCurrencyEdit
                Left = 70
                Top = 30
                ParentFont = False
                Properties.Alignment.Horz = taRightJustify
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = ',0'
                Properties.ImeMode = imSAlpha
                Properties.MaxLength = 8
                Properties.Nullable = False
                Properties.Nullstring = '0'
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 0
                Width = 56
              end
              object TableChangeColorPanel: TPanel
                Left = 238
                Top = 29
                Width = 58
                Height = 26
                BevelOuter = bvSpace
                BorderStyle = bsSingle
                Caption = #50630#51020
                Color = clWhite
                Ctl3D = False
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 1
                OnClick = TableGroupColor1PanelClick
              end
            end
            object Option252CheckBox: TcxCheckBox
              Left = 18
              Top = 284
              Caption = ' '#53580#51060#48660#50640' '#51060#48120#51648#47484' '#54364#49884#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 13
            end
            object Option237ComboBox: TcxComboBox
              Left = 124
              Top = 314
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #49324#50857#50504#54632
                #52572#51333#51452#47928#49884#44036
                #51452#47928#49692#48264
                #51452#47928#44552#50529
                #45812#45817#51088)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 14
              Text = #49324#50857#50504#54632
              Width = 130
            end
            object Option432ComboBox: TcxComboBox
              Left = 187
              Top = 343
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #49324#50857#50504#54632
                '30'#52488
                '40'#52488
                '50'#52488
                '60'#52488
                '180'#52488)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 15
              Text = #49324#50857#50504#54632
              Width = 97
            end
            object Option499ComboBox: TcxComboBox
              Left = 565
              Top = 255
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #49324#50857#50504#54632
                #45824#47532#49437
                #45824#47532#49437'2'
                #47560#47336
                #50640#54253#49884)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 16
              Text = #45824#47532#49437
              Width = 76
            end
          end
        end
        object POSCardTabSheet: TcxTabSheet
          Caption = #49888#50857#52852#46300#44288#47144
          ImageIndex = 3
          object AdvScrollBox4: TAdvScrollBox
            Left = 0
            Top = 0
            Width = 1279
            Height = 872
            Align = alClient
            BorderStyle = bsNone
            DoubleBuffered = True
            Ctl3D = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            TabOrder = 0
            object Label99: TLabel
              Left = 405
              Top = 10
              Width = 381
              Height = 17
              Caption = #52852#46300' '#44552#50529#51060'                 '#48120#47564#51060#47732' '#51088#46041#51004#47196' '#49849#51064#51012' '#50836#52397#54633#45768#45796'.'
            end
            object Label142: TLabel
              Left = 405
              Top = 207
              Width = 137
              Height = 17
              Caption = #45800#47568#44592' '#49849#51064' '#49884' '#50689#49688#51613' '
            end
            object Label158: TLabel
              Left = 405
              Top = 174
              Width = 114
              Height = 17
              Caption = #49888#50857#52852#46300' '#51204#54364' '#52636#47141
            end
            object Panel1: TPanel
              Left = 18
              Top = 8
              Width = 256
              Height = 368
              BevelOuter = bvNone
              BorderStyle = bsSingle
              Color = clWhite
              Ctl3D = False
              ParentBackground = False
              ParentCtl3D = False
              TabOrder = 0
              object Panel48: TPanel
                Left = 0
                Top = 0
                Width = 254
                Height = 26
                Align = alTop
                BevelOuter = bvNone
                Caption = '['#49888#50857#52852#46300'('#49849#51064')'#51204#54364']'
                Color = clWhite
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
              end
              object Panel69: TPanel
                Left = 0
                Top = 26
                Width = 254
                Height = 18
                Align = alTop
                BevelOuter = bvNone
                Caption = '('#52852#46300#49324#51228#52636#50857')'
                Color = clWhite
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object Option208Panel: TPanel
                Left = 0
                Top = 81
                Width = 254
                Height = 26
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = ' '#52852' '#46300' '#47749' : '#49888#54620#52852#46300
                Color = clWhite
                TabOrder = 2
              end
              object Option209Panel: TPanel
                Left = 0
                Top = 107
                Width = 254
                Height = 26
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = ' '#52852#46300#48264#54840' : 1111-2222-3333-4444'
                Color = clWhite
                TabOrder = 3
              end
              object Option218Panel: TPanel
                Left = 0
                Top = 133
                Width = 254
                Height = 26
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = ' '#44277#44553#44552#50529' : 10,000'#50896
                Color = clWhite
                TabOrder = 4
              end
              object Option219Panel: TPanel
                Left = 0
                Top = 159
                Width = 254
                Height = 26
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = '   '#48512#44032#49464' :  1,000'#50896
                Color = clWhite
                TabOrder = 5
              end
              object Option220Panel: TPanel
                Left = 0
                Top = 185
                Width = 254
                Height = 26
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = '   '#48393#49324#47308' :      0'#50896
                Color = clWhite
                TabOrder = 6
              end
              object Option212Panel: TPanel
                Left = 0
                Top = 211
                Width = 254
                Height = 26
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = ' '#49849#51064#44552#50529' : 11,000'#50896'('#51068#49884#48520')'
                Color = clWhite
                TabOrder = 7
              end
              object Option214Panel: TPanel
                Left = 0
                Top = 237
                Width = 254
                Height = 26
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = ' '#49849#51064#48264#54840' : 14343435 ('#44032#47609#51216#48264#54840')'
                Color = clWhite
                TabOrder = 8
              end
              object Option215Panel: TPanel
                Left = 0
                Top = 263
                Width = 254
                Height = 26
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = ' '#47588#51077#49324#47749' : '#49888#54620#51008#54665'(STARVAN)'
                Color = clWhite
                TabOrder = 9
              end
              object Option216Panel: TPanel
                Left = 0
                Top = 289
                Width = 254
                Height = 26
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = ' '#49849#51064#51068#49884' : 2009'#45380'03'#50900'13'#51068' 11:01'
                Color = clWhite
                TabOrder = 10
              end
              object Option217Panel: TPanel
                Left = 0
                Top = 315
                Width = 254
                Height = 26
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = ' '#51204#54364#44396#48516' : '#52285#44396#47588#51077#48520#44032
                Color = clWhite
                TabOrder = 11
              end
              object Panel61: TPanel
                Left = 0
                Top = 70
                Width = 254
                Height = 3
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = ' -------------------------------------------------'
                Color = clWhite
                TabOrder = 12
              end
              object Panel2: TPanel
                Left = 0
                Top = 73
                Width = 254
                Height = 8
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Color = clWhite
                TabOrder = 13
              end
              object Panel336: TPanel
                Left = 0
                Top = 44
                Width = 254
                Height = 26
                Align = alTop
                BevelOuter = bvNone
                Caption = ' '#47588#51109#51221#48372
                Color = clWhite
                TabOrder = 14
              end
              object Panel4: TPanel
                Left = 0
                Top = 341
                Width = 254
                Height = 26
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = ' '#53580#51060#48660#48264#54840' : 1'#52789' 10'
                Color = clWhite
                TabOrder = 15
              end
            end
            object Option208ComboBox: TcxComboBox
              Left = 276
              Top = 91
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#54869#45824)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 1
              Text = #48372#53685
              Width = 80
            end
            object Option209ComboBox: TcxComboBox
              Left = 276
              Top = 117
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#54869#45824)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 2
              Text = #48372#53685
              Width = 80
            end
            object Option218ComboBox: TcxComboBox
              Left = 276
              Top = 143
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#54869#45824)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 3
              Text = #48372#53685
              Width = 80
            end
            object Option219ComboBox: TcxComboBox
              Left = 276
              Top = 169
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#54869#45824)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 4
              Text = #48372#53685
              Width = 80
            end
            object Option220ComboBox: TcxComboBox
              Left = 276
              Top = 195
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#54869#45824)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 5
              Text = #48372#53685
              Width = 80
            end
            object Option212ComboBox: TcxComboBox
              Left = 276
              Top = 221
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#54869#45824)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 6
              Text = #48372#53685
              Width = 80
            end
            object Option214ComboBox: TcxComboBox
              Left = 276
              Top = 247
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#54869#45824)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 7
              Text = #48372#53685
              Width = 80
            end
            object Option215ComboBox: TcxComboBox
              Left = 276
              Top = 273
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#54869#45824)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 8
              Text = #52636#47141#50504#54632
              Width = 80
            end
            object Option216ComboBox: TcxComboBox
              Left = 276
              Top = 299
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#54869#45824)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 9
              Text = #52636#47141#50504#54632
              Width = 80
            end
            object Option217ComboBox: TcxComboBox
              Left = 276
              Top = 325
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#54869#45824)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 10
              Text = #52636#47141#50504#54632
              Width = 80
            end
            object Option033CheckBox: TcxCheckBox
              Left = 401
              Top = 33
              Caption = ' '#49888#50857#52852#46300' '#44208#51228' '#49884' '#44552#51204#54632#51012' '#50685#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 11
            end
            object Option069CheckBox: TcxCheckBox
              Left = 401
              Top = 60
              Caption = ' '#50689#49688#51613#50640' '#49436#47749#51060#48120#51648#47484' '#52636#47141#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 12
            end
            object Option042CheckBox: TcxCheckBox
              Left = 401
              Top = 87
              Caption = ' '#50689#49688#51613#44284' '#49888#50857#52852#46300' '#51204#54364#47484' '#48324#46020#47196' '#52636#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 13
            end
            object Option230CheckBox: TcxCheckBox
              Left = 401
              Top = 114
              Caption = ' '#49888#50857#52852#46300'/'#54788#44552#50689#49688#51613' '#49849#51064' '#49884' '#50689#49688#51613#51012' '#52636#47141#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 14
            end
            object Option045CheckBox: TcxCheckBox
              Left = 401
              Top = 141
              Caption = ' '#49849#51064' '#51593#49884' '#49888#50857#52852#46300' '#51204#54364#47484' '#52636#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 15
            end
            object Option201CheckBox: TcxCheckBox
              Left = 407
              Top = 456
              Caption = ' '#45796#51473#49324#50629#51088' '#49324#50857' '#49884' '#49436#47749#51012' '#54620#48264#47564' '#54633#45768#45796
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 16
              Visible = False
            end
            object Option229CheckBox: TcxCheckBox
              Left = 401
              Top = 238
              Caption = ' '#52852#46300' '#52712#49548' '#49884' '#49324#51109#45784#44760' '#47928#51088#47484' '#48156#49569#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 17
            end
            object Option324CheckBox: TcxCheckBox
              Left = 401
              Top = 264
              Caption = ' '#47196#44536#49849#51064' '#44592#45733#51012' '#49324#50857#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 18
            end
            object Option063ComboBox: TcxComboBox
              Left = 479
              Top = 6
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                '0 '#50896
                '5 '#47564#50896
                '10 '#47564#50896
                '30 '#47564#50896
                '50 '#47564#50896)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 19
              Text = '0 '#50896
              Width = 80
            end
            object cxGroupBox1: TcxGroupBox
              Left = 17
              Top = 381
              Caption = ' '#49888#50857#52852#46300' '#54616#45800#47928#44396' '
              ParentFont = False
              Style.StyleController = EditStyleController
              TabOrder = 20
              Height = 164
              Width = 339
              object CardEnd3Edit: TcxTextEdit
                Left = 10
                Top = 75
                ParentFont = False
                Properties.MaxLength = 42
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 2
                Width = 320
              end
              object CardEnd2Edit: TcxTextEdit
                Left = 10
                Top = 48
                ParentFont = False
                Properties.MaxLength = 42
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 1
                Width = 320
              end
              object CardEnd1Edit: TcxTextEdit
                Left = 10
                Top = 21
                ParentFont = False
                Properties.MaxLength = 42
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 0
                Width = 320
              end
              object CardEnd5Edit: TcxTextEdit
                Left = 10
                Top = 129
                ParentFont = False
                Properties.MaxLength = 42
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 4
                Width = 320
              end
              object CardEnd4Edit: TcxTextEdit
                Left = 10
                Top = 102
                ParentFont = False
                Properties.MaxLength = 42
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 3
                Width = 320
              end
            end
            object Option125ComboBox: TcxComboBox
              Tag = 21
              Left = 544
              Top = 203
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #52636#47141#54632
                #51116#48156#54665#49884#47564' '#52636#47141#54632)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 21
              Text = #52636#47141#50504#54632
              Width = 167
            end
            object Option382ComboBox: TcxComboBox
              Left = 276
              Top = 30
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #52636#47141#54632)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 22
              Text = #52636#47141#50504#54632
              Width = 80
            end
            object Option006ComboBox: TcxComboBox
              Tag = 21
              Left = 544
              Top = 170
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #44256#44061'('#54924#50896')'#48372#44288#50857
                #44256#44061'('#54924#50896')'#48372#44288#50857','#44032#47609#51216#48372#44288#50857
                #44256#44061'('#54924#50896')'#48372#44288#50857','#44032#47609#51216#48372#44288#50857','#52852#46300#49324#51228#52636#50857)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 23
              Text = #44256#44061'('#54924#50896')'#48372#44288#50857
              Width = 279
            end
            object Option407CheckBox: TcxCheckBox
              Left = 401
              Top = 290
              Caption = ' '#52852#46300#51204#54364' '#52636#47141#50668#48512#47484' '#54869#51064#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 24
            end
            object Option055CheckBox: TcxCheckBox
              Left = 401
              Top = 317
              Caption = ' '#44228#49328#50756#47308' '#54980' '#52852#46300#51228#44144' '#51020#49457#51012' '#52636#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 25
            end
            object Option336ComboBox: TcxComboBox
              Left = 276
              Top = 56
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #52636#47141#54632)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 26
              Text = #52636#47141#50504#54632
              Width = 80
            end
            object Option124ComboBox: TcxComboBox
              Left = 275
              Top = 351
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#54869#45824)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 27
              Text = #52636#47141#50504#54632
              Width = 80
            end
            object Option494CheckBox: TcxCheckBox
              Left = 401
              Top = 343
              Caption = ' '#50808#48512#49849#51064' '#44592#45733#51012' '#49324#50857#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 28
            end
            object Option495CheckBox: TcxCheckBox
              Left = 401
              Top = 369
              Caption = ' '#45800#47568#44592#49849#51064' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 29
            end
            object Option165CheckBox: TcxCheckBox
              Left = 833
              Top = 91
              Caption = ' '#51204#51088#49436#47749' '#49324#50857' '#49884' '#49888#50857#52852#46300' '#51204#54364#47484' '#52636#47141#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              Style.TransparentBorder = False
              TabOrder = 30
              Visible = False
            end
          end
        end
        object PosAcctTabSheet: TcxTabSheet
          Caption = #44208#51228#44288#47144
          ImageIndex = 4
          object AdvScrollBox5: TAdvScrollBox
            Left = 0
            Top = 0
            Width = 1279
            Height = 872
            Align = alClient
            BorderStyle = bsNone
            DoubleBuffered = True
            Ctl3D = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            TabOrder = 0
            object Label31: TLabel
              Left = 484
              Top = 294
              Width = 84
              Height = 17
              Caption = 'VAN '#49849#51064#48169#49885
              Transparent = True
            end
            object Label182: TLabel
              Left = 19
              Top = 150
              Width = 122
              Height = 17
              Caption = #54788#44552#50689#49688#51613' '#51088#51652#48156#44553
              Transparent = True
            end
            object Label45: TLabel
              Left = 33
              Top = 15
              Width = 52
              Height = 17
              Caption = #48373#54633#44208#51228
              Transparent = True
            end
            object Option065CheckBox: TcxCheckBox
              Left = 12
              Top = 180
              Caption = ' '#54788#44552#44552#50529#51060' '#51080#51012' '#46412' '#47924#51312#44148' '#54788#44552#50689#49688#51613' '#54268#51012' '#46916#50881#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 0
            end
            object Option159CheckBox: TcxCheckBox
              Left = 12
              Top = 208
              Caption = ' '#49440#48520#51228#51068' '#46412' '#51221#49328' '#54980' '#54868#47732#51012' Clear '#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 1
            end
            object Option250CheckBox: TcxCheckBox
              Left = 12
              Top = 234
              Caption = ' '#54924#50896#47564' '#50808#49345#51012' '#49324#50857#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 2
            end
            object Option213CheckBox: TcxCheckBox
              Left = 12
              Top = 261
              Caption = ' '#44208#51228' '#49884' '#44256#44061#51221#48372#47484' '#51077#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 3
            end
            object Option259CheckBox: TcxCheckBox
              Left = 12
              Top = 288
              Caption = ' '#44208#51228' '#49884' '#45812#45817#51088#47484' '#51077#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 4
            end
            object Option022CheckBox: TcxCheckBox
              Left = 12
              Top = 314
              Caption = ' '#44208#51228#48320#44221' '#49884' '#48708#48128#48264#54840#47484' '#51077#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 5
            end
            object Option235CheckBox: TcxCheckBox
              Left = 12
              Top = 339
              Caption = ' '#44208#51228#48320#44221' '#49884' '#47700#45684#47484' '#49688#51221#54624' '#49688' '#51080#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 6
            end
            object Option299CheckBox: TcxCheckBox
              Left = 481
              Top = 10
              Caption = ' '#49888#50857#52852#46300#44032' '#52712#49548#46104#51648' '#50506#51004#47732' '#54788#44552#48152#54408#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 7
            end
            object Option261CheckBox: TcxCheckBox
              Left = 481
              Top = 37
              Caption = ' '#44208#51228#52712#49548', '#44208#51228#48320#44221' '#49884' '#47928#51088#47484' '#48156#49569#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 8
            end
            object Option266CheckBox: TcxCheckBox
              Left = 481
              Top = 65
              Caption = ' '#54788#44552#50689#49688#51613' '#48156#54665' '#49884' '#54924#50896#51060#47732' '#55092#45824#48264#54840#47484' '#51088#46041#51077#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 9
            end
            object Option287CheckBox: TcxCheckBox
              Left = 481
              Top = 92
              Caption = ' '#50808#49345#44208#51228' '#49884' '#44552#50529#51012' '#51077#47141' '#48155#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 10
            end
            object Option376CheckBox: TcxCheckBox
              Left = 481
              Top = 118
              Caption = ' '#51452#47928#54868#47732#50640#49436' '#48155#51008#44552#50529#51012' '#51077#47141#48155#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 11
            end
            object Option398CheckBox: TcxCheckBox
              Left = 481
              Top = 144
              Caption = ' '#44208#51228#48320#44221' '#49884' '#51088#46041#51004#47196' '#44208#51228#47484' '#52712#49548' '#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 12
            end
            object Option400CheckBox: TcxCheckBox
              Left = 481
              Top = 171
              Caption = ' '#54788#44552#50689#49688#51613#48260#53948' '#53364#47533' '#49884' '#51088#46041#51004#47196' '#49849#51064' '#50836#52397#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 13
            end
            object Option379ComboBox: TcxComboBox
              Left = 595
              Top = 290
              ParentFont = False
              Properties.Alignment.Horz = taLeftJustify
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                'IC '#48372#50504
                #45800#47568#44592'(CAT)  '#50672#46041
                #44032#49345#45800#47568#44592'(VCAT) '#50672#46041)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 14
              Text = 'IC '#48372#50504
              Width = 185
            end
            object Option169ComboBox: TcxComboBox
              Left = 156
              Top = 146
              ParentFont = False
              Properties.Alignment.Horz = taLeftJustify
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #49324#50857#54616#51648' '#50506#49845#45768#45796'.'
                #47924#51312#44148' '#48156#54665#54633#45768#45796'.'
                '10'#47564#50896' '#51060#49345#51068#46412' '#48156#54665#54633#45768#45796'.')
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 15
              Text = #49324#50857#54616#51648' '#50506#49845#45768#45796'.'
              Width = 226
            end
            object Option441CheckBox: TcxCheckBox
              Left = 481
              Top = 197
              Caption = ' '#54788#44552#50689#49688#51613' '#49849#51064' '#49884' '#49345#54408#44428#44552#50529#51012' '#54252#54632#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 16
            end
            object Option446CheckBox: TcxCheckBox
              Left = 481
              Top = 223
              Caption = ' '#49888#50857#52852#46300' '#49849#51064' '#54980' '#51221#49328#50756#47308' '#49884' '#49849#51064#45236#50669#51012' '#54364#49884#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 17
            end
            object PayListBox: TcxCheckListBox
              Left = 110
              Top = 13
              Width = 130
              Height = 118
              ImeName = 'Microsoft IME 2003'
              Items = <
                item
                  Text = #49345#54408#44428
                end
                item
                  Text = #54252#51064#53944
                end
                item
                  Text = #50808#49345
                end
                item
                  Text = #44228#51340#51077#44552
                end
                item
                  Text = #49688#54364
                end>
              ParentFont = False
              Style.StyleController = EditStyleController
              TabOrder = 18
              OnEditValueChanged = EditPropertiesChange
            end
            object Option401CheckBox: TcxCheckBox
              Left = 12
              Top = 365
              Caption = ' '#45908#52824#54168#51060' '#51064#50896#51648#51221' '#49884' '#47700#45684#47484' '#51088#46041' '#48176#48516#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 19
            end
            object Option486CheckBox: TcxCheckBox
              Left = 481
              Top = 250
              Caption = ' '#54788#44552#51221#49328#48260#53948' '#53364#47533' '#49884' '#44208#51228#50668#48512#47484' '#54869#51064#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 20
            end
          end
        end
        object ReceiptTabSheet: TcxTabSheet
          Caption = #50689#49688#51613#44288#47144
          ImageIndex = 5
          object PrintPager: TcxPageControl
            Left = 0
            Top = 0
            Width = 1279
            Height = 872
            Align = alClient
            TabOrder = 0
            Properties.ActivePage = ReceiptPage
            Properties.CustomButtons.Buttons = <>
            Properties.TabWidth = 80
            LookAndFeel.Kind = lfOffice11
            LookAndFeel.NativeStyle = False
            ClientRectBottom = 872
            ClientRectRight = 1279
            ClientRectTop = 28
            object ReceiptPage: TcxTabSheet
              Caption = #50689#49688#51613
              ImageIndex = 0
              object AdvScrollBox6: TAdvScrollBox
                Left = 0
                Top = 0
                Width = 1279
                Height = 844
                Align = alClient
                BorderStyle = bsNone
                DoubleBuffered = True
                Ctl3D = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                TabOrder = 0
                object Label34: TLabel
                  Left = 417
                  Top = 340
                  Width = 96
                  Height = 17
                  Caption = #50689#49688#51613' '#52636#47141#47588#49688
                end
                object Label35: TLabel
                  Left = 592
                  Top = 340
                  Width = 86
                  Height = 17
                  Caption = '('#52852#46300#51204#54364#51228#50808')'
                end
                object Label36: TLabel
                  Left = 417
                  Top = 370
                  Width = 96
                  Height = 17
                  Caption = #44036#51060#50689#49688#51613' '#47928#44396
                end
                object Label153: TLabel
                  Left = 418
                  Top = 238
                  Width = 132
                  Height = 17
                  Caption = #54924#50896#47588#52636' '#49884' '#54924#50896#51221#48372' '
                end
                object Label154: TLabel
                  Left = 416
                  Top = 184
                  Width = 127
                  Height = 17
                  Caption = #47700#45684' '#54616#45800#50640' '#54624#51064#45236#50669
                end
                object Label173: TLabel
                  Left = 422
                  Top = 58
                  Width = 96
                  Height = 17
                  Caption = #49436#47749#51060#48120#51648' '#52636#47141
                end
                object Panel10: TPanel
                  Left = 18
                  Top = 4
                  Width = 269
                  Height = 454
                  BevelOuter = bvNone
                  BorderStyle = bsSingle
                  Color = clWhite
                  Ctl3D = False
                  Padding.Left = 8
                  Padding.Right = 8
                  ParentBackground = False
                  ParentCtl3D = False
                  TabOrder = 0
                  object Option126Panel: TPanel
                    Left = 8
                    Top = 0
                    Width = 251
                    Height = 33
                    Align = alTop
                    BevelOuter = bvNone
                    Caption = #50689' '#49688' '#51613
                    Color = clWhite
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -20
                    Font.Name = #44404#47548#52404
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 0
                  end
                  object Panel12: TPanel
                    Left = 8
                    Top = 63
                    Width = 251
                    Height = 15
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = #51064#52380#49884' '#50672#49688#44396' '#49569#46020#44284#54617#47196' 13'
                    Color = clWhite
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = #44404#47548#52404
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 1
                  end
                  object Panel13: TPanel
                    Left = 8
                    Top = 114
                    Width = 251
                    Height = 26
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = '   #  '#49345'  '#54408'           '#45800' '#44032'  '#49688#47049'     '#44552' '#50529
                    Color = clWhite
                    TabOrder = 2
                  end
                  object Panel14: TPanel
                    Left = 8
                    Top = 166
                    Width = 251
                    Height = 21
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = '  8801236223544    1,000      1      1,000'
                    Color = clWhite
                    TabOrder = 3
                  end
                  object Panel15: TPanel
                    Left = 8
                    Top = 190
                    Width = 251
                    Height = 26
                    Align = alTop
                    Alignment = taRightJustify
                    BevelOuter = bvNone
                    Caption = #54032#47588#44552#50529'                  1,000'
                    Color = clWhite
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -19
                    Font.Name = #47569#51008' '#44256#46357
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 4
                  end
                  object Panel16: TPanel
                    Left = 8
                    Top = 256
                    Width = 251
                    Height = 23
                    Align = alTop
                    Alignment = taRightJustify
                    BevelOuter = bvNone
                    Caption = #48155#51012#44552#50529'                  1,000'
                    Color = clWhite
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -19
                    Font.Name = #47569#51008' '#44256#46357
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 5
                  end
                  object Panel19: TPanel
                    Left = 8
                    Top = 279
                    Width = 251
                    Height = 20
                    Align = alTop
                    Alignment = taRightJustify
                    BevelOuter = bvNone
                    Caption = '                     '#54788'     '#44552'             1,000'
                    Color = clWhite
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #47569#51008' '#44256#46357
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 6
                  end
                  object Panel28: TPanel
                    Left = 8
                    Top = 111
                    Width = 251
                    Height = 3
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = '--------------------------------------------------'
                    Color = clWhite
                    TabOrder = 7
                  end
                  object Panel29: TPanel
                    Left = 8
                    Top = 33
                    Width = 251
                    Height = 15
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = #49345#54840' : '#51061#49828#53944#47548#54252#49828
                    Color = clWhite
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = #44404#47548#52404
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 8
                  end
                  object Panel30: TPanel
                    Left = 8
                    Top = 93
                    Width = 251
                    Height = 18
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = '2015'#45380'12'#50900'21'#51068' 10'#49884'19'#48516'    01-0123-'#44228#49328#50896
                    Color = clWhite
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = #44404#47548#52404
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 9
                  end
                  object Panel31: TPanel
                    Left = 8
                    Top = 48
                    Width = 251
                    Height = 15
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = #49324#50629#51088' : 123-45-67890      '#45824#54364#51088':'#54861#44600#46041
                    Color = clWhite
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = #44404#47548#52404
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 10
                  end
                  object Panel32: TPanel
                    Left = 8
                    Top = 140
                    Width = 251
                    Height = 3
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = '--------------------------------------------------'
                    Color = clWhite
                    TabOrder = 11
                  end
                  object Panel33: TPanel
                    Left = 8
                    Top = 253
                    Width = 251
                    Height = 3
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = '--------------------------------------------------'
                    Color = clWhite
                    TabOrder = 12
                  end
                  object Panel35: TPanel
                    Left = 8
                    Top = 299
                    Width = 251
                    Height = 3
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = '--------------------------------------------------'
                    Color = clWhite
                    TabOrder = 13
                  end
                  object Panel37: TPanel
                    Left = 8
                    Top = 143
                    Width = 251
                    Height = 23
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = '001 '#48296#46972#51648#50724
                    Color = clWhite
                    TabOrder = 14
                  end
                  object Panel43: TPanel
                    Left = 8
                    Top = 78
                    Width = 251
                    Height = 15
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = #50672#46973#52376' : 1544-4171'
                    Color = clWhite
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = #44404#47548#52404
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 15
                  end
                  object Panel44: TPanel
                    Left = 8
                    Top = 302
                    Width = 251
                    Height = 33
                    Align = alTop
                    BevelOuter = bvNone
                    Color = clWhite
                    TabOrder = 16
                    object Image1: TImage
                      Left = 33
                      Top = 0
                      Width = 174
                      Height = 32
                      Picture.Data = {
                        0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000148
                        0000007D0806000000C0D4FA990000000467414D410000B18F0BFC6105000000
                        097048597300000EBC00000EBC0195BC724900000A8C49444154785EEDD72D8F
                        5459108061FC5814090E85C1202641A350181C6257204970187E000902854091
                        F00F08091E4982C52091281018446FDE5B536C75D56DA687CFD9E5ADA4C29DD3
                        F79E73CF473DDD9CF9F0E1C3C6344DD39C796663188661AC86401A8661EC0881
                        340CC3D811026918C61F139F3F7F3EBADA2F7602F9E9D3A7E55F3A5CEBB4B673
                        6FCD8C5DED27893A0EFFD6FEB2BD468E93F7D6EB9AB5BDC7AE71EABDF5F39EF5
                        FE9A3DEABDFCBBEBB9B5F133F86CEDDE6CAFD73589DE96CF66D43E88BCA6BDDF
                        BB6FACF557A38E99D79939666D5B4BA2F65383B65DFD107DCCE3DA6BD4B67E5D
                        33A35E67D4F7AECF90F5BDBF36871ED9BE4FDFFF85C839E47CBE3687DA9ECF11
                        F5B9DADE63279067CEC447AF5EBDDADCBD7B77B9AE71E7CE9DCD8B172F96EBB3
                        67CF2EF7677EFCF871F3F6EDDBAD36726D02DC57E3FDFBF74B663C7DFA7473EF
                        DEBDE59A316B7FCF9E3D5BDA6BD0CE8479EFF3E7CF2F6DF7EFDFDF7A8E24B8E7
                        AFBFFF5AAE6B305EBDF7D1A3474B3BD76FDEBC59E6573FEFF9F2E5CB2FF7D7EC
                        1B71FBF6EDCD93274F966BC6C871AE5FBFBEF5DCC3870F97F673E7CE2DE3D760
                        7DEABDAC11C1DCE88778F0E0C1D63DD7AE5D5BDAFB7AE67E66E41E12396782FB
                        729C1ACCEFDDBB77477F45D047DDF7AB57AF7E9943F65783CF6EDDBAB55CF77D
                        CBB5BA7CF9F2567B4DD688600F73DD6AB0268CC17BF66789D7AF5F8F76E6C59E
                        D6B65CDB1AB4E7FC0F0E0E9673CCDCEB7324E3F319D73DF8ECE6CD9BCB753F07
                        CF9F3F5FDAB9667FF3BA66AD1D827DE35D08D6833525D887FA5C9ED91ACCA59E
                        D9BEBFFC9D7B59639F73C073BC5B8FDE5FF7807E2E5EBCB85C53FF750E796E6A
                        700ED209EEE11D18A33EC75AEC8AB94347C183041B9140D5A02D17F5D2A54B5B
                        0332F1B503989B5A03C4EA26B089147DC6E3C78FBF6C6A87AB1734413BFD71D0
                        2924823EEB730927F780548F5E98BC039140D17FFDBCE7DAE1E54BA4CE93E08B
                        27E7CA18390E05529F4D38994F3F40FD90E45E31B72C349EAFF764FB71EBD981
                        BC70E1C2729D58F403CEFD57AE5C39FA2B82C3570F387DE41CB2EF1A7C96F876
                        D873AD7A71D7CC3D670F73DD6A3077C6E8E7B39E89DA4EB26F1DC85CC31AB427
                        0C1431F33E2990AC61167A3F07B93FF49D67ACFF38A96B4DB047090AE72BBF34
                        6EDCB8B1F55C9EBD1A7C91D6F3C698B55EF89B67FBB9A6BDAF0FE7A2BE1BCFED
                        FA81532165CFB3FE09FECE33D6CFFEDA9736CFE6BA710FC19CEA736B5F761973
                        878E223B63B23F13C8C3C3C3AD05E650D78563E304F27402D9E7C3FDFDB0F177
                        2D0C8A35E7907DD7E0B33F0148D693EB1EBF0BC8FC755E83F1799F0CC6ACFF9B
                        CCB5AAA011DCD77FCD816D07327F11D7603E1DC87C67E27F0D240BDA83035D0B
                        4D200552204F0790DC53CF1B6BF3BB81E4BC0BA4406E3D2B9091022990022990
                        A330043252200552200572148640460AA4400AA4408EC210C8488114488114C8
                        51180219299002299002390A43202305522005522047610864A4400AA4400AE4
                        280C818C1448811448811C85219091022990022990A330043252200552200572
                        148640460AA4400AA4408EC210C8488114488114C85118021929900229900239
                        0A43202305522005522047610864A4400AA4400AE4280C818C1448811448811C
                        85219091022990022990A330043252200552200572148640460AA4400AA4408E
                        C210C8488114488114C851180219299002299002390A43202305522005522047
                        610864A4400AA4400AE4280C818C1448811448811C85219091022990022990A3
                        30043252200552200572148640460AA4400AA4408EC210C8488114488114C851
                        180219299002299002390A43202305522005522047610864A4400AA4400AE428
                        0C818C1448811448811C85219091022990022990A33004325220055220057214
                        8640460AA4400AA4408EC210C8488114488114C851180219299002299002390A
                        43202305522005522047610864A4400AA4400AE4280C818C1448811448811C85
                        219091022990022990A330043252200552200572148640460AA4400AA4408EC2
                        10C8488114488114C851180219299002299002390A4320230552200552204761
                        0864A4400AA4400AE4280C818C1448811448811C85219091022990022990A330
                        043252200552200572148640460AA4400AA4408EC210C8488114488114C85118
                        0219299002299002390A43202305522005522047610864A4400AA4400AE4280C
                        818C1448811448811C85219091022990022990A3300432522005522005721486
                        40460AA4400AA4408EC210C8488114488114C851180219299002299002390A43
                        202305522005522047610864A4400AA4400AE4280C818C1448811448811C8521
                        9091022990022990A330043252200552200572148640460AA4400AA4408EC210
                        C8488114488114C851180219299002299002390A432023055220055220476108
                        64A4400AA4400AE4280C818C1448811448811C85219091022990022990A33004
                        3252200552200572148640460AA4400AA4408EC210C8488114488114C8511802
                        19299002299002390A43202305522005522047610864A4400AA4400AE4280C81
                        8C1448811448811C85219091022990022990A330043252200552200572148640
                        460AA4400AA4408EC210C8488114488114C851180219299002299002390A4320
                        2305522005522047610864A4400AA4400AE4280C818C1448811448811C852190
                        91022990022990A330043252200552200572148640460AA4400AA4408EC210C8
                        488114488114C851180219299002299002390A43202305522005522047610864
                        A4400AA4400AE4280C818C1448811448811C85219091022990022990A3300432
                        52200552200572148640460AA4400AA4408EC210C8488114488114C851180219
                        299002299002390A43202305522005522047610864A4400AA4400AE4280C818C
                        1448811448811C85219091022990022990A33004325220055220057214864046
                        0AA4400AA4408EC210C848811448813CC540B2792C2EFDD7CF7B0AE4BF2190EB
                        40F219D73DF601927DF85540F23E19ACCD3E40D2FE3D40D673751220EBBB65FC
                        362079991C980DA803B229595C3573536B7C0F906B0B4C3BFD311670131D487E
                        0912DCF32D4032BFFA79CF9C676D3B383818A000411ECC7D80ACB864EC3A24BC
                        4316719F3F079F382990894862415B8D1F0D64DF877D80CC3D3F299079267E14
                        9020F62B80E45CD57BD680CC2F36D623B1615FEA733F1248DEED67FD82E4EF93
                        FE82CC71F25D59FFFADC3701998BCA22D417CC60E0FC05C90040473241368583
                        421FB41D1E1E2E2F929B5A8303BD2F90FCA2A0C0E893BE73FC1A8C457FBC774E
                        9C3EF23992022358A835FC7987BC9F7F6B617260128BEC2F93B1EBE1652DF233
                        36B503C9BC72AE8C91E380366371A89843DEC301A80796600D28240E24FFE641
                        676EB96EF49BF361BDF34BE1B8F5642C3E279873AE1BF3633FFB7CB89F77AEC1
                        FBD7C2601CDE2DAF7BD047EE49DF875C07E699EBDA33F79C67D78A9E3564FC7A
                        3EC97A266A3BC93C9973B6B3866BC5C87E2790090205996725CF479E21DA7AF0
                        5922C4188C95CFE5FED037E79BE05CE57B72CF1A90B9279C83FC12E60C64DFEC
                        65B6D75803B2CEFB7B81AC759E01F8C701997BC51746DD933CEF357836D72DDF
                        9539D5FAEDEF5A632790BF2AFAE21AFF8DD8B56FBDFDB8BF8DD31B6B7BB5EF7E
                        1E77DFB73E47EC7AF667C46F07D2300CE3B486401A8661EC0881340CC3588DCD
                        E61F848C4870B6AE3DDA0000000049454E44AE426082}
                      Stretch = True
                    end
                  end
                  object Panel45: TPanel
                    Left = 8
                    Top = 335
                    Width = 251
                    Height = 12
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = '============================'
                    Color = clWhite
                    TabOrder = 17
                  end
                  object Option3932Panel: TPanel
                    Left = 8
                    Top = 366
                    Width = 251
                    Height = 15
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = #53748#51109#49884#44036' : 2015-12-21('#50900') '#50724#54980' 18:00'
                    Color = clWhite
                    TabOrder = 18
                  end
                  object Option3931Panel: TPanel
                    Left = 8
                    Top = 347
                    Width = 251
                    Height = 19
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = #51077#51109#49884#44036' : 2015-12-21('#50900') '#50724#54980' 16:30'
                    Color = clWhite
                    TabOrder = 19
                  end
                  object Option127Panel: TPanel
                    Left = 8
                    Top = 216
                    Width = 251
                    Height = 21
                    Align = alTop
                    Alignment = taRightJustify
                    BevelOuter = bvNone
                    Caption = '               '#44284#49464#44277#44553#44032#50529'               910'
                    Color = clWhite
                    TabOrder = 20
                  end
                  object Option128Panel: TPanel
                    Left = 8
                    Top = 237
                    Width = 251
                    Height = 16
                    Align = alTop
                    Alignment = taRightJustify
                    BevelOuter = bvNone
                    Caption = '                     '#48512#44032#49464#50529'                90'
                    Color = clWhite
                    TabOrder = 21
                  end
                  object Panel53: TPanel
                    Left = 8
                    Top = 187
                    Width = 251
                    Height = 3
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = '--------------------------------------------------'
                    Color = clWhite
                    TabOrder = 22
                  end
                  object Option155Panel: TPanel
                    Left = 8
                    Top = 381
                    Width = 251
                    Height = 15
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = #53580#51060#48660#48264#54840' : 1'#52789' 10'
                    Color = clWhite
                    TabOrder = 23
                  end
                  object Panel27: TPanel
                    Left = 8
                    Top = 396
                    Width = 251
                    Height = 12
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = '============================'
                    Color = clWhite
                    TabOrder = 24
                  end
                  object Option320Panel: TPanel
                    Left = 8
                    Top = 408
                    Width = 251
                    Height = 21
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = #51452#47928#48264#54840' : 15'
                    Color = clWhite
                    TabOrder = 25
                  end
                  object Option314Panel: TPanel
                    Left = 8
                    Top = 429
                    Width = 251
                    Height = 21
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = #54840#52636#48264#54840' : 10'
                    Color = clWhite
                    TabOrder = 26
                  end
                end
                object Option333ComboBox: TcxComboBox
                  Left = 293
                  Top = 310
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#50504#54632
                    #52636#47141#54632)
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 1
                  Text = #52636#47141#50504#54632
                  Width = 80
                end
                object Option393ComboBox: TcxComboBox
                  Left = 293
                  Top = 346
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#50504#54632
                    #52636#47141#54632)
                  Properties.OnChange = Option108ComboBoxPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 2
                  Text = #52636#47141#50504#54632
                  Width = 80
                end
                object Option155ComboBox: TcxComboBox
                  Left = 293
                  Top = 379
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#54632
                    #52636#47141#50504#54632)
                  Properties.OnChange = Option108ComboBoxPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 3
                  Text = #52636#47141#54632
                  Width = 80
                end
                object Option314ComboBox: TcxComboBox
                  Left = 293
                  Top = 433
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#50504#54632
                    #48372#53685
                    #49464#47196#54869#45824
                    #44032#47196#49464#47196#54869#45824
                    '3'#48176#54869#45824)
                  Properties.OnChange = Option108ComboBoxPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 4
                  Text = #52636#47141#50504#54632
                  Width = 80
                end
                object Option320ComboBox: TcxComboBox
                  Left = 293
                  Top = 406
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#50504#54632
                    #48372#53685
                    #49464#47196#54869#45824
                    #44032#47196#49464#47196#54869#45824
                    '3'#48176#54869#45824)
                  Properties.OnChange = Option108ComboBoxPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 5
                  Text = #52636#47141#50504#54632
                  Width = 80
                end
                object Option081ComboBox: TcxComboBox
                  Left = 296
                  Top = 169
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #54620#51460#52636#47141
                    #46160#51460#52636#47141)
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 6
                  Text = #54620#51460#52636#47141
                  Width = 80
                end
                object Option260ComboBox: TcxComboBox
                  Left = 295
                  Top = 93
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #44060#51216#51068#51088
                    #49884#49828#53596#51068#51088)
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 7
                  Text = #44060#51216#51068#51088
                  Width = 80
                end
                object Option127ComboBox: TcxComboBox
                  Left = 296
                  Top = 220
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#54632
                    #52636#47141#50504#54632)
                  Properties.OnChange = Option108ComboBoxPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 8
                  Text = #52636#47141#54632
                  Width = 80
                end
                object Option126ComboBox: TcxComboBox
                  Left = 295
                  Top = 11
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #50689#49688#51613
                    #52636#47141#50504#54632
                    #49345#54840)
                  Properties.OnChange = Option108ComboBoxPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 9
                  Text = #50689#49688#51613
                  Width = 80
                end
                object Option068ComboBox: TcxComboBox
                  Left = 295
                  Top = 118
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#54632
                    #52636#47141#50504#54632'('#47700#45684#51221#48372')')
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 10
                  Text = #52636#47141#54632
                  Width = 80
                end
                object Option157CheckBox: TcxCheckBox
                  Left = 412
                  Top = 5
                  Caption = ' '#50689#49688#51613#48264#54840#47484' '#52636#47141#54616#51648' '#50506#49845#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 11
                end
                object Option005CheckBox: TcxCheckBox
                  Left = 412
                  Top = 81
                  Caption = ' '#50689#49688#51613#50640' '#54252#51064#53944#45236#50669#51012' '#52636#47141#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 12
                end
                object Option158CheckBox: TcxCheckBox
                  Left = 412
                  Top = 104
                  Caption = ' '#54252#51064#53944#44208#51228' '#49884' '#49436#47749#48155#45716' '#50689#49688#51613#51012' '#52636#47141#54616#51648' '#50506#49845#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 13
                end
                object Option176CheckBox: TcxCheckBox
                  Left = 412
                  Top = 128
                  Caption = ' '#48512#44032#49464#48324#46020' '#47700#45684#45716' '#47700#45684#44552#50529#50640#49436' '#48512#44032#49464#44552#50529#51012' '#51228#50808#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 14
                end
                object Option255CheckBox: TcxCheckBox
                  Left = 412
                  Top = 152
                  Caption = ' '#47732#49464#47700#45684' '#50526#50640' * '#54364#47484' '#52636#47141#54633#45768#45796'('#44592#48376' '#48324#46020#47700#45684').'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 15
                end
                object Option264CheckBox: TcxCheckBox
                  Left = 414
                  Top = 209
                  Caption = ' '#54924#50896#47588#52636' '#49884' '#50689#49688#51613#51012' '#52636#47141#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 16
                end
                object Option080SpinEdit: TcxSpinEdit
                  Left = 531
                  Top = 337
                  ParentFont = False
                  Properties.Alignment.Horz = taCenter
                  Properties.MaxValue = 9.000000000000000000
                  Properties.MinValue = 1.000000000000000000
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 17
                  Value = 1
                  Width = 54
                end
                object SimpleReceiptEdit: TcxTextEdit
                  Left = 531
                  Top = 366
                  ParentFont = False
                  Properties.MaxLength = 42
                  Properties.OnChange = EditPropertiesChange
                  Properties.OnValidate = EditPropertiesValidate
                  Style.StyleController = EditStyleController
                  TabOrder = 18
                  Width = 229
                end
                object Option318CheckBox: TcxCheckBox
                  Left = 414
                  Top = 260
                  Caption = ' '#50808#49345' '#49884' '#50689#49688#51613#51012' '#52636#47141#54616#51648' '#50506#49845#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 19
                end
                object Option323CheckBox: TcxCheckBox
                  Left = 414
                  Top = 308
                  Caption = ' '#54032#47588#44552#50529#50640' '#49436#48708#49828#44552#50529#51012' '#54252#54632#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 20
                end
                object Option373CheckBox: TcxCheckBox
                  Left = 414
                  Top = 284
                  Caption = ' '#50808#49345' '#49884' '#50808#49345#51092#50529#51012' '#52636#47141#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 21
                end
                object Option319ComboBox: TcxComboBox
                  Left = 550
                  Top = 234
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#54616#51648' '#50506#51020
                    #51204#54868#48264#54840#47484' '#52636#47141#54633#45768#45796'.'
                    #51452#49548#47484' '#52636#47141#54633#45768#45796'.'
                    #51204#54868#48264#54840'+'#51452#49548#47484' '#52636#47141#54633#45768#45796'.')
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 22
                  Text = #52636#47141#54616#51648' '#50506#51020
                  Width = 240
                end
                object Option390ComboBox: TcxComboBox
                  Left = 550
                  Top = 180
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#54616#51648' '#50506#51020
                    #47700#45684#54624#51064#47564' '#52636#47141#54633#45768#45796
                    #47700#45684', '#51204#52404#54624#51064#51012' '#52636#47141#54633#45768#45796)
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 23
                  Text = #52636#47141#54616#51648' '#50506#51020
                  Width = 240
                end
                object Option399ComboBox: TcxComboBox
                  Left = 296
                  Top = 195
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #44032#47196#54869#45824
                    #48372#53685)
                  Properties.OnChange = Option108ComboBoxPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 24
                  Text = #48372#53685
                  Width = 80
                end
                object Option008CheckBox: TcxCheckBox
                  Left = 412
                  Top = 29
                  Caption = ' '#50689#49688#51613' '#52636#47141' '#50668#48512#47484' '#54869#51064#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 25
                end
                object Option027ComboBox: TcxComboBox
                  Left = 550
                  Top = 53
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#54616#51648' '#50506#49845#45768#45796'.'
                    #49345#45800#50640' '#51060#48120#51648#47484' '#52636#47141#54633#45768#45796'.'
                    #54616#45800#50640' '#51060#48120#51648#47484' '#52636#47141#54633#45768#45796'.'
                    #49345#54616#45800#50640' '#51060#48120#51648#47484' '#52636#47141#54633#45768#45796'.')
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 26
                  Text = #52636#47141#54616#51648' '#50506#49845#45768#45796'.'
                  Width = 240
                end
                object Option472CheckBox: TcxCheckBox
                  Left = 412
                  Top = 399
                  Caption = ' '#54532#47536#53552' '#54252#53944#47484' '#45796#47480' '#54532#47196#44536#47016#44284' '#44057#51060' '#49324#50857#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 27
                end
                object Option484ComboBox: TcxComboBox
                  Left = 296
                  Top = 144
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #48372#53685
                    #49464#47196#54869#45824)
                  Properties.OnChange = Option108ComboBoxPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 28
                  Text = #48372#53685
                  Width = 80
                end
                object Option492CheckBox: TcxCheckBox
                  Left = 415
                  Top = 430
                  Caption = ' '#50689#49688#51613#47532#48624' QR'#51012' '#52636#47141#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  Style.TransparentBorder = False
                  TabOrder = 29
                end
              end
            end
            object ReceiptTitlePage: TcxTabSheet
              Caption = #49345'/'#54616#45800#47928#44396
              ImageIndex = 1
              object ReceiptTitleGroupBox: TcxGroupBox
                Left = 17
                Top = 13
                Caption = ' '#50689#49688#51613' '#49345#45800#47928#44396' '
                ParentFont = False
                Style.StyleController = EditStyleController
                TabOrder = 0
                Height = 142
                Width = 369
                object ReceiptTitle1Edit: TcxTextEdit
                  Left = 12
                  Top = 27
                  ParentFont = False
                  Properties.MaxLength = 48
                  Properties.OnChange = EditPropertiesChange
                  Properties.OnValidate = EditPropertiesValidate
                  Style.StyleController = EditStyleController
                  TabOrder = 0
                  Width = 344
                end
                object ReceiptTitle2Edit: TcxTextEdit
                  Left = 12
                  Top = 55
                  ParentFont = False
                  Properties.MaxLength = 48
                  Properties.OnChange = EditPropertiesChange
                  Properties.OnValidate = EditPropertiesValidate
                  Style.StyleController = EditStyleController
                  TabOrder = 1
                  Width = 344
                end
                object ReceiptTitle3Edit: TcxTextEdit
                  Left = 12
                  Top = 82
                  ParentFont = False
                  Properties.MaxLength = 48
                  Properties.OnChange = EditPropertiesChange
                  Properties.OnValidate = EditPropertiesValidate
                  Style.StyleController = EditStyleController
                  TabOrder = 2
                  Width = 344
                end
                object ReceiptTitle4Edit: TcxTextEdit
                  Left = 12
                  Top = 110
                  ParentFont = False
                  Properties.MaxLength = 48
                  Properties.OnChange = EditPropertiesChange
                  Properties.OnValidate = EditPropertiesValidate
                  Style.StyleController = EditStyleController
                  TabOrder = 3
                  Width = 344
                end
              end
              object DeliveryPrintGroupBox: TcxGroupBox
                Left = 15
                Top = 177
                Caption = ' '#50689#49688#51613' '#54616#45800#47928#44396' '
                ParentFont = False
                Style.StyleController = EditStyleController
                TabOrder = 1
                Height = 257
                Width = 388
                object cxScrollBox1: TcxScrollBox
                  Left = 7
                  Top = 18
                  Width = 373
                  Height = 229
                  LookAndFeel.NativeStyle = True
                  TabOrder = 0
                  object Label109: TLabel
                    Left = 7
                    Top = 10
                    Width = 7
                    Height = 17
                    Caption = '1'
                  end
                  object Label110: TLabel
                    Left = 7
                    Top = 36
                    Width = 7
                    Height = 17
                    Caption = '2'
                  end
                  object Label111: TLabel
                    Left = 7
                    Top = 64
                    Width = 7
                    Height = 17
                    Caption = '3'
                  end
                  object Label112: TLabel
                    Left = 7
                    Top = 91
                    Width = 7
                    Height = 17
                    Caption = '4'
                  end
                  object Label113: TLabel
                    Left = 7
                    Top = 145
                    Width = 7
                    Height = 17
                    Caption = '6'
                  end
                  object Label114: TLabel
                    Left = 7
                    Top = 118
                    Width = 7
                    Height = 17
                    Caption = '5'
                  end
                  object Label115: TLabel
                    Left = 7
                    Top = 199
                    Width = 7
                    Height = 17
                    Caption = '8'
                  end
                  object Label116: TLabel
                    Left = 7
                    Top = 172
                    Width = 7
                    Height = 17
                    Caption = '7'
                  end
                  object ReceiptBottom3Edit: TcxTextEdit
                    Left = 19
                    Top = 59
                    ParentFont = False
                    Properties.MaxLength = 48
                    Properties.OnChange = EditPropertiesChange
                    Properties.OnValidate = EditPropertiesValidate
                    Style.StyleController = EditStyleController
                    TabOrder = 0
                    Width = 320
                  end
                  object ReceiptBottom2Edit: TcxTextEdit
                    Left = 19
                    Top = 32
                    ParentFont = False
                    Properties.MaxLength = 48
                    Properties.OnChange = EditPropertiesChange
                    Properties.OnValidate = EditPropertiesValidate
                    Style.StyleController = EditStyleController
                    TabOrder = 1
                    Width = 320
                  end
                  object ReceiptBottom1Edit: TcxTextEdit
                    Left = 19
                    Top = 5
                    ParentFont = False
                    Properties.MaxLength = 48
                    Properties.OnChange = EditPropertiesChange
                    Properties.OnValidate = EditPropertiesValidate
                    Style.StyleController = EditStyleController
                    TabOrder = 2
                    Width = 320
                  end
                  object ReceiptBottom6Edit: TcxTextEdit
                    Left = 19
                    Top = 140
                    ParentFont = False
                    Properties.MaxLength = 48
                    Properties.OnChange = EditPropertiesChange
                    Properties.OnValidate = EditPropertiesValidate
                    Style.StyleController = EditStyleController
                    TabOrder = 3
                    Width = 320
                  end
                  object ReceiptBottom5Edit: TcxTextEdit
                    Left = 19
                    Top = 113
                    ParentFont = False
                    Properties.MaxLength = 48
                    Properties.OnChange = EditPropertiesChange
                    Properties.OnValidate = EditPropertiesValidate
                    Style.StyleController = EditStyleController
                    TabOrder = 4
                    Width = 320
                  end
                  object ReceiptBottom4Edit: TcxTextEdit
                    Left = 19
                    Top = 86
                    ParentFont = False
                    Properties.MaxLength = 48
                    Properties.OnChange = EditPropertiesChange
                    Properties.OnValidate = EditPropertiesValidate
                    Style.StyleController = EditStyleController
                    TabOrder = 5
                    Width = 320
                  end
                  object ReceiptBottom8Edit: TcxTextEdit
                    Left = 19
                    Top = 195
                    ParentFont = False
                    Properties.MaxLength = 48
                    Properties.OnChange = EditPropertiesChange
                    Properties.OnValidate = EditPropertiesValidate
                    Style.StyleController = EditStyleController
                    TabOrder = 6
                    Width = 320
                  end
                  object ReceiptBottom7Edit: TcxTextEdit
                    Left = 19
                    Top = 167
                    ParentFont = False
                    Properties.MaxLength = 48
                    Properties.OnChange = EditPropertiesChange
                    Properties.OnValidate = EditPropertiesValidate
                    Style.StyleController = EditStyleController
                    TabOrder = 7
                    Width = 320
                  end
                end
              end
            end
          end
        end
        object MemberTabSheet: TcxTabSheet
          Caption = #54924#50896'&&'#54252#51064#53944
          ImageIndex = 6
          object AdvScrollBox7: TAdvScrollBox
            Left = 0
            Top = 0
            Width = 1279
            Height = 872
            Align = alClient
            BorderStyle = bsNone
            DoubleBuffered = True
            Ctl3D = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            TabOrder = 0
            object Label91: TLabel
              Left = 26
              Top = 25
              Width = 109
              Height = 17
              Caption = #54924#50896#52852#46300' '#54532#47532#54589#49828
              Transparent = True
            end
            object Label92: TLabel
              Left = 245
              Top = 25
              Width = 102
              Height = 17
              Caption = #51204#52404'          '#51088#47532
              Transparent = True
            end
            object Label93: TLabel
              Left = 245
              Top = 54
              Width = 102
              Height = 17
              Caption = #51204#52404'          '#51088#47532
              Transparent = True
            end
            object Label94: TLabel
              Left = 24
              Top = 145
              Width = 282
              Height = 17
              Caption = #54924#50896' '#51312#54924' '#49884'                   '#47700#45684#47484' '#51452#47928#54633#45768#45796'.'
              Transparent = True
            end
            object Label138: TLabel
              Left = 41
              Top = 272
              Width = 249
              Height = 17
              Caption = '('#44277#53685#53076#46300' SMS '#47700#49464#51648#50640#49436' '#47928#44396#51648#51221' '#44032#45733')'
              Transparent = True
            end
            object Label56: TLabel
              Left = 26
              Top = 354
              Width = 140
              Height = 17
              Caption = #54924#50896#44396#48516' '#51312#51221' '#44396#47588#44592#44036
              Transparent = True
            end
            object cxGroupBox19: TcxGroupBox
              Left = 388
              Top = 13
              Caption = ' '#54252#51064#53944' '
              ParentFont = False
              Style.StyleController = EditStyleController
              TabOrder = 0
              Height = 346
              Width = 464
              object Label70: TLabel
                Left = 20
                Top = 222
                Width = 368
                Height = 17
                Caption = #51092#50668' '#54252#51064#53944'               '#51216' '#51060#49345' '#49884' '#54252#51064#53944' '#49324#50857#51060' '#44032#45733#54633#45768#45796'.'
                Transparent = True
              end
              object Label71: TLabel
                Left = 20
                Top = 283
                Width = 387
                Height = 17
                Caption = #54924#50896#44032#51077' '#49884'                           '#51201#47549#53076#46300' '#54252#51064#53944#47484' '#51201#47549#54633#45768#45796'.'
                Transparent = True
              end
              object Label160: TLabel
                Left = 20
                Top = 52
                Width = 114
                Height = 17
                Caption = #54252#51064#53944' '#49324#50857' '#50689#49688#51613
                Transparent = True
              end
              object MemberJoinCodeEdit: TcxButtonEdit
                Left = 140
                Top = 278
                ParentFont = False
                Properties.Buttons = <
                  item
                    Default = True
                    Kind = bkEllipsis
                  end>
                Properties.ClickKey = 112
                Properties.ImeMode = imSAlpha
                Properties.MaxLength = 0
                Properties.ReadOnly = True
                Properties.OnButtonClick = MemberJoinCodeEditPropertiesButtonClick
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 0
                Width = 80
              end
              object MinUsePointEdit: TcxCurrencyEdit
                Left = 96
                Top = 218
                EditValue = 0.000000000000000000
                ParentFont = False
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = '0,'
                Properties.EditFormat = '#,'
                Properties.UseLeftAlignmentOnEditing = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 1
                Width = 65
              end
              object Option310CheckBox: TcxCheckBox
                Left = 15
                Top = 160
                Caption = ' '#54252#51064#53944' '#52628#54980#51201#47549' '#44592#45733#51012' '#49324#50857#54616#51648' '#50506#49845#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 2
              end
              object Option306CheckBox: TcxCheckBox
                Left = 15
                Top = 133
                Caption = ' '#44208#51228#48320#44221' '#49884' '#54252#51064#53944#49324#50857#51012' '#49324#50857#54624' '#49688' '#50630#49845#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 3
              end
              object Option302CheckBox: TcxCheckBox
                Left = 15
                Top = 105
                Caption = ' '#54665#49324' '#47700#45684#45716' '#54252#51064#53944#47484' '#51201#47549#54616#51648' '#50506#49845#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 4
              end
              object Option210CheckBox: TcxCheckBox
                Left = 15
                Top = 77
                Caption = ' '#46272#50620#54868#47732#50640' '#54252#51064#53944#45236#50669#51012' '#54364#49884#54616#51648' '#50506#49845#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 5
              end
              object Option258CheckBox: TcxCheckBox
                Left = 15
                Top = 21
                Caption = ' '#47700#45684#48324#47196' '#54252#51064#53944#47484' '#51201#47549#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 6
              end
              object Option372CheckBox: TcxCheckBox
                Left = 15
                Top = 187
                Caption = ' '#54252#51064#53944#49324#50857#51012' '#54624#51064#51004#47196' '#49324#50857#54633#45768#45796'('#44592#48376#51008' '#47588#52636')'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 8
              end
              object Option391CheckBox: TcxCheckBox
                Left = 15
                Top = 248
                Caption = ' '#52572#49548' '#51092#50668#54252#51064#53944' '#51060#54616#46020' '#49324#50857#54624' '#49688' '#51080#44172' '#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 9
              end
              object Option296ComboBox: TcxComboBox
                Left = 138
                Top = 48
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  #54252#51064#53944#47484' '#51201#47549#54616#51648' '#50506#49845#45768#45796'.'
                  #54252#51064#53944#47484' '#51201#47549#54633#45768#45796'.'
                  #51204#52404' '#44552#50529#50640' '#45824#54644' '#51201#47549#54633#45768#45796'.')
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 7
                Text = #54252#51064#53944#47484' '#51201#47549#54616#51648' '#50506#49845#45768#45796'.'
                Width = 295
              end
              object Option413CheckBox: TcxCheckBox
                Left = 15
                Top = 310
                Caption = ' '#54624#51064'('#47700#45684#54624#51064') '#54620' '#47700#45684#45716' '#54252#51064#53944#47484' '#51201#47549#54616#51648' '#50506#49845#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 10
              end
            end
            object Option150CheckBox: TcxCheckBox
              Left = 18
              Top = 89
              Caption = ' '#54924#50896' '#51200#51109' '#49884' '#51204#54868#48264#54840#47564' '#52404#53356#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 1
            end
            object Option297CheckBox: TcxCheckBox
              Left = 18
              Top = 114
              Caption = ' '#54924#50896#51312#54924' '#49884' '#51204#54868#48264#54840' '#44032#50868#45936' '#48264#54840#47484' * '#47196' '#54364#49884#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 2
            end
            object MemberCardPrefix1Edit: TcxTextEdit
              Left = 153
              Top = 22
              ParentFont = False
              Properties.MaxLength = 6
              Properties.OnChange = EditPropertiesChange
              Properties.OnValidate = EditPropertiesValidate
              Style.StyleController = EditStyleController
              TabOrder = 3
              Width = 71
            end
            object MemberCardLength1Edit: TcxCurrencyEdit
              Left = 280
              Top = 21
              EditValue = 0.000000000000000000
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = '0,'
              Properties.EditFormat = '#,'
              Properties.UseLeftAlignmentOnEditing = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 4
              Width = 37
            end
            object MemberCardPrefix2Edit: TcxTextEdit
              Left = 153
              Top = 51
              ParentFont = False
              Properties.MaxLength = 6
              Properties.OnChange = EditPropertiesChange
              Properties.OnValidate = EditPropertiesValidate
              Style.StyleController = EditStyleController
              TabOrder = 5
              Width = 71
            end
            object MemberCardLength2Edit: TcxCurrencyEdit
              Left = 280
              Top = 50
              EditValue = 0.000000000000000000
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = '0,'
              Properties.EditFormat = '#,'
              Properties.UseLeftAlignmentOnEditing = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 6
              Width = 37
            end
            object MemberSearchDefaultMenuEdit: TcxButtonEdit
              Left = 111
              Top = 142
              ParentFont = False
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              Properties.ClickKey = 112
              Properties.ImeMode = imSAlpha
              Properties.MaxLength = 0
              Properties.ReadOnly = True
              Properties.OnButtonClick = MemberSearchDefaultMenuEditPropertiesButtonClick
              Properties.OnChange = EditPropertiesChange
              Properties.OnValidate = EditPropertiesValidate
              Style.StyleController = EditStyleController
              TabOrder = 7
              Width = 80
            end
            object Option317CheckBox: TcxCheckBox
              Left = 18
              Top = 171
              Caption = ' '#54924#50896#51312#54924' '#54980' '#51088#46041' '#50808#49345#44208#51228' '#52376#47532#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 8
            end
            object Option322CheckBox: TcxCheckBox
              Left = 18
              Top = 197
              Caption = ' '#51452#47928#54868#47732#50640#49436' 4'#51088#47532' '#51077#47141' '#49884' '#54924#50896#51012' '#51312#54924#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 9
            end
            object Option345CheckBox: TcxCheckBox
              Left = 18
              Top = 223
              Caption = ' POS'#50640#49436' '#54924#50896#46321#47197' '#49884' '#45812#45817#51088#47484' '#51648#51221#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 10
            end
            object Option367CheckBox: TcxCheckBox
              Left = 18
              Top = 250
              Caption = ' '#54924#50896#44032#51077' '#49884' '#47928#51088#47484' '#48156#49569#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 11
            end
            object Option031ComboBox: TcxComboBox
              Left = 174
              Top = 350
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #51648#51221#50504#54632
                #52572#44540' 1'#44060#50900
                #52572#44540' 3'#44060#50900
                #52572#44540' 6'#44060#50900
                #52572#44540' 1'#45380)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 12
              Width = 131
            end
            object Option179CheckBox: TcxCheckBox
              Left = 18
              Top = 294
              Caption = ' '#54252#51064#53944' && '#49828#53596#54532' '#51201#47549'/'#49324#50857' '#49884' '#50508#47548#53665#51012' '#48156#49569#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 13
            end
            object Option386CheckBox: TcxCheckBox
              Left = 18
              Top = 322
              Caption = ' '#54924#50896#51312#54924' '#54868#47732#50640' '#44592#48376' '#49707#51088#54056#46300#47484' '#54364#49884#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 14
            end
            object Option292CheckBox: TcxCheckBox
              Left = 18
              Top = 380
              Caption = ' '#50808#49345#51012' '#49440#52649#51204' '#48169#49885#51004#47196' '#49324#50857#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 15
            end
          end
        end
        object OpenCloseTabSheet: TcxTabSheet
          Caption = #44060#51216'&&'#47560#44048
          ImageIndex = 7
          object AdvScrollBox8: TAdvScrollBox
            Left = 0
            Top = 0
            Width = 1279
            Height = 872
            Align = alClient
            BorderStyle = bsNone
            DoubleBuffered = True
            Ctl3D = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            TabOrder = 0
            object ReserveAmtLabel: TLabel
              Left = 423
              Top = 335
              Width = 70
              Height = 17
              Caption = #44592#48376' '#51456#48708#44552
              Transparent = True
            end
            object Label37: TLabel
              Left = 422
              Top = 304
              Width = 122
              Height = 17
              Caption = #54252#49828#51221#49328#49436' '#52636#47141#47588#49688
            end
            object Label38: TLabel
              Left = 421
              Top = 275
              Width = 135
              Height = 17
              Caption = #44228#49328#50896#51221#49328#49436' '#52636#47141#47588#49688
            end
            object Label39: TLabel
              Left = 49
              Top = 198
              Width = 256
              Height = 17
              Caption = #8251' '#47588#52636#45236#50669#44284' '#47560#44048#45936#51060#53552#44032' '#50504#47582#51012' '#49688' '#51080#51020
              Font.Charset = HANGEUL_CHARSET
              Font.Color = clRed
              Font.Height = -13
              Font.Name = #47569#51008' '#44256#46357
              Font.Style = []
              ParentFont = False
            end
            object Label40: TLabel
              Left = 48
              Top = 240
              Width = 256
              Height = 17
              Caption = #8251' '#47588#52636#45236#50669#44284' '#47560#44048#45936#51060#53552#44032' '#50504#47582#51012' '#49688' '#51080#51020
              Font.Charset = HANGEUL_CHARSET
              Font.Color = clRed
              Font.Height = -13
              Font.Name = #47569#51008' '#44256#46357
              Font.Style = []
              ParentFont = False
            end
            object Label151: TLabel
              Left = 424
              Top = 366
              Width = 83
              Height = 17
              Caption = #47560#44048' '#54056#49828#50892#46300
            end
            object Label152: TLabel
              Left = 426
              Top = 406
              Width = 80
              Height = 17
              Caption = #54252#49828' '#47560#44048' '#49884' '
            end
            object ReserveAmtEdit: TcxCurrencyEdit
              Left = 563
              Top = 332
              EditValue = 0.000000000000000000
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = '0,'
              Properties.EditFormat = '#,'
              Properties.UseLeftAlignmentOnEditing = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 0
              Width = 104
            end
            object Option043CheckBox: TcxCheckBox
              Left = 21
              Top = 117
              Caption = ' '#47700#51064#54252#49828' '#47560#44048' '#49884' '#51452#47928#48264#54840#47484' '#52488#44592#54868#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 1
            end
            object Option173CheckBox: TcxCheckBox
              Left = 21
              Top = 145
              Caption = ' '#47560#44048#54868#47732#50640' '#47588#52636#45236#50669#51012' '#48372#51060#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 2
            end
            object CashierClosePrintGroupBox: TcxGroupBox
              Left = 438
              Top = 6
              Caption = ' '#44228#49328#50896#47560#44048' '#49884' '#52636#47141' '
              ParentFont = False
              Style.StyleController = EditStyleController
              TabOrder = 3
              Height = 249
              Width = 229
              object CashierClosePrintCheckListBox: TcxCheckListBox
                Left = 13
                Top = 25
                Width = 204
                Height = 213
                ImeName = 'Microsoft IME 2003'
                Items = <
                  item
                    Tag = 1
                    Text = #49888#50857#52852#46300' '#49849#51064#45236#50669'('#47588#51077#49324#48324')'
                  end
                  item
                    Tag = 2
                    Text = #49888#50857#52852#46300' '#49849#51064#45236#50669'('#44148#48324')'
                  end
                  item
                    Tag = 6
                    Text = #48516#47448#48324' '#47588#52636#45236#50669
                  end
                  item
                    Tag = 7
                    Text = #47700#45684#48324' '#47588#52636#45236#50669
                  end
                  item
                    Tag = 9
                    Text = #49884#44036#45824#48324' '#47588#52636#45236#50669
                  end
                  item
                    Tag = 5
                    Text = #54624#51064#45236#50669
                  end
                  item
                    Tag = 3
                    Text = #54788#44552#50689#49688#51613' '#48156#54665#45236#50669
                  end
                  item
                    Text = #49436#48708#49828' '#47588#52636#45236#50669
                  end
                  item
                    Text = #52636#45225#45236#50669
                  end
                  item
                    Tag = 4
                    Text = #45812#45817#51088#48324' '#47588#52636#45236#50669
                  end
                  item
                    Tag = 8
                    Text = #48516#47448#48324' '#47700#45684#47588#52636#45236#50669
                  end
                  item
                    Text = #54252#51109' '#47588#52636#45236#50669
                  end>
                ParentFont = False
                Style.StyleController = EditStyleController
                TabOrder = 0
                OnEditValueChanged = EditPropertiesChange
              end
            end
            object PosClosePrintGroupBox: TcxGroupBox
              Left = 679
              Top = 5
              Caption = ' '#54252#49828#47560#44048' '#49884' '#52636#47141' '
              ParentFont = False
              Style.StyleController = EditStyleController
              TabOrder = 4
              Height = 295
              Width = 240
              object PosClosePrintCheckListBox: TcxCheckListBox
                Left = 14
                Top = 21
                Width = 211
                Height = 263
                ImeName = 'Microsoft IME 2003'
                Items = <
                  item
                    Tag = 1
                    Text = #49888#50857#52852#46300' '#49849#51064#45236#50669'('#47588#51077#49324#48324')'
                  end
                  item
                    Tag = 2
                    Text = #49888#50857#52852#46300' '#49849#51064#45236#50669'('#44148#48324')'
                  end
                  item
                    Tag = 6
                    Text = #48516#47448#48324' '#47588#52636#45236#50669
                  end
                  item
                    Tag = 7
                    Text = #47700#45684#48324' '#47588#52636#45236#50669
                  end
                  item
                    Tag = 9
                    Text = #49884#44036#45824#48324' '#47588#52636#45236#50669
                  end
                  item
                    Tag = 5
                    Text = #54624#51064#45236#50669
                  end
                  item
                    Tag = 3
                    Text = #54788#44552#50689#49688#51613' '#48156#54665#45236#50669
                  end
                  item
                    Text = #49436#48708#49828' '#47588#52636#45236#50669
                  end
                  item
                    Text = #52636#45225#45236#50669
                  end
                  item
                    Tag = 4
                    Text = #45812#45817#51088#48324' '#47588#52636#45236#50669
                  end
                  item
                    Tag = 8
                    Text = #48516#47448#48324' '#47700#45684#47588#52636#45236#50669
                  end
                  item
                    Text = #48176#45804#50896#48324' '#47588#52636#45236#50669
                  end
                  item
                    Text = #51452#47928#52712#49548#45236#50669
                  end
                  item
                    Text = #47588#52636#52712#49548#45236#50669
                  end
                  item
                    Text = #54252#51109' '#47588#52636#45236#50669
                  end>
                ParentFont = False
                Style.StyleController = EditStyleController
                TabOrder = 0
                OnEditValueChanged = EditPropertiesChange
              end
            end
            object Option128CheckBox: TcxCheckBox
              Left = 21
              Top = 173
              Caption = ' '#47560#44048' '#46108' '#50689#49688#51613#50640' '#45824#54644' '#54788#44552#50689#49688#51613#51012' '#48156#54665#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 5
            end
            object Option221CheckBox: TcxCheckBox
              Left = 21
              Top = 216
              Caption = ' '#47560#44048' '#46108' '#50689#49688#51613#50640' '#45824#54644' '#47588#52636#52712#49548' '#48143' '#51077#44552#48320#44221#51012' '#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 6
            end
            object Option139CheckBox: TcxCheckBox
              Left = 21
              Top = 262
              Caption = ' '#54252#49828#47560#44048' '#49884' '#49324#51109#45784#44760' '#47928#51088#47484' '#48156#49569#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 7
            end
            object Option263CheckBox: TcxCheckBox
              Left = 21
              Top = 289
              Caption = ' '#44228#49328#50896' '#51221#49328#49436' '#54616#45800#50640' '#47700#47784#46976#51012' '#52636#47141#54633#45768#45796
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 8
            end
            object Option239CheckBox: TcxCheckBox
              Left = 21
              Top = 317
              Caption = ' '#44060#51216' '#49884' '#49903#44032#47700#45684#51032' '#44552#50529#51012' '#51077#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 9
            end
            object Option268CheckBox: TcxCheckBox
              Left = 21
              Top = 344
              Caption = ' '#44060#51216' '#54980' '#51456#48708#44552#51012' '#51077#47141#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 10
            end
            object Option075SpinEdit: TcxSpinEdit
              Left = 613
              Top = 301
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 11
              Width = 54
            end
            object Option074SpinEdit: TcxSpinEdit
              Left = 613
              Top = 270
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 12
              Width = 54
            end
            object Option328CheckBox: TcxCheckBox
              Left = 21
              Top = 371
              Caption = ' '#51221#49328#54252#49828#44032' 2'#45824#51060#49345#51068' '#46412' '#44060#51216#51068#51088#47484' '#46041#51068#54616#44172' '#49324#50857#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 13
            end
            object Option349CheckBox: TcxCheckBox
              Left = 21
              Top = 397
              Caption = ' '#44228#49328#50896#47560#44048' '#49884' '#47560#44048#49884#51116#47484' '#51077#47141#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 14
            end
            object Option351CheckBox: TcxCheckBox
              Left = 21
              Top = 424
              Caption = ' '#54252#49828#47560#44048' '#49884' '#51060#51061#47456' '#48143' '#51060#51061#44552#50529#51012' '#52636#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 15
            end
            object ClosePasswordEdit: TcxTextEdit
              Left = 607
              Top = 363
              ParentFont = False
              Properties.MaxLength = 8
              Properties.PasswordChar = '*'
              Properties.OnChange = EditPropertiesChange
              Properties.OnValidate = EditPropertiesValidate
              Style.StyleController = EditStyleController
              TabOrder = 16
              Width = 60
            end
            object Option029ComboBox: TcxComboBox
              Left = 512
              Top = 403
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #48708#48128#48264#54840#47484' '#49324#50857#54616#51648' '#50506#49845#45768#45796'.'
                #47196#44536#51064' '#49324#50857#51088#51032' '#48708#48128#48264#54840#47484' '#51077#47141#48155#49845#45768#45796'.'
                #47560#44048' '#48708#48128#48264#54840#47484' '#51077#47141#48155#49845#45768#45796'.')
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 17
              Text = #48708#48128#48264#54840#47484' '#49324#50857#54616#51648' '#50506#49845#45768#45796'.'
              Width = 276
            end
            object cxPageControl4: TcxPageControl
              Left = 22
              Top = 9
              Width = 377
              Height = 97
              TabOrder = 18
              Properties.ActivePage = cxTabSheet14
              Properties.CustomButtons.Buttons = <>
              Properties.Style = 8
              LookAndFeel.Kind = lfOffice11
              LookAndFeel.NativeStyle = False
              ClientRectBottom = 97
              ClientRectRight = 377
              ClientRectTop = 28
              object cxTabSheet14: TcxTabSheet
                Caption = #51068#48152#47588#51109
                ImageIndex = 0
                object Option123CheckBox: TcxCheckBox
                  Left = 12
                  Top = 9
                  Caption = ' '#44228#49328#50896#47560#44048' '#49884' '#51088#46041' '#54252#49828#47560#44048#51012' '#54633#45768#45796'. '
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 0
                end
                object Option129CheckBox: TcxCheckBox
                  Left = 12
                  Top = 37
                  Caption = ' '#44060#51216'/'#47560#44048#51012' '#51088#46041#51004#47196' '#49324#50857#54633#45768#45796'.('#47196#44536#51064' '#49884' '#51201#50857')'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 1
                end
              end
              object cxTabSheet15: TcxTabSheet
                Caption = '24'#49884#44036' '#47588#51109
                ImageIndex = 1
                object Label221: TLabel
                  Left = 22
                  Top = 42
                  Width = 83
                  Height = 17
                  Caption = #54252#49828#47560#44048' '#49884#44036
                end
                object Option375CheckBox: TcxCheckBox
                  Left = 17
                  Top = 12
                  Caption = ' '#54252#49828#47560#44048#51012' '#51088#46041#51004#47196' '#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 0
                end
                object PosCloseTimeEdit: TcxTimeEdit
                  Left = 116
                  Top = 38
                  ParentFont = False
                  Properties.TimeFormat = tfHourMin
                  Properties.Use24HourFormat = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 1
                  Width = 86
                end
              end
            end
          end
        end
        object CustomerPrintTabSheet: TcxTabSheet
          Caption = #44256#44061#51452#47928#49436
          ImageIndex = 8
          object AdvScrollBox9: TAdvScrollBox
            Left = 0
            Top = 0
            Width = 1279
            Height = 872
            Align = alClient
            BorderStyle = bsNone
            DoubleBuffered = True
            Ctl3D = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            TabOrder = 0
            object Label41: TLabel
              Left = 218
              Top = 460
              Width = 52
              Height = 17
              Caption = #51452#47928#48264#54840
            end
            object Label42: TLabel
              Left = 404
              Top = 366
              Width = 109
              Height = 17
              Caption = #44256#44061#51452#47928#49436' '#53440#51060#53952
            end
            object Label43: TLabel
              Left = 21
              Top = 460
              Width = 52
              Height = 17
              Caption = #52636#47141#47588#49688
            end
            object Label161: TLabel
              Left = 406
              Top = 394
              Width = 52
              Height = 17
              Caption = #52636#47141#54805#53468
            end
            object Label185: TLabel
              Left = 579
              Top = 427
              Width = 52
              Height = 17
              Caption = #49345#45800#50668#48177
            end
            object Label186: TLabel
              Left = 579
              Top = 458
              Width = 52
              Height = 17
              Caption = #54616#45800#50668#48177
            end
            object Panel7: TPanel
              Left = 18
              Top = 6
              Width = 264
              Height = 447
              BevelOuter = bvNone
              BorderStyle = bsSingle
              Color = clWhite
              Ctl3D = False
              Padding.Left = 8
              Padding.Right = 8
              ParentBackground = False
              ParentCtl3D = False
              TabOrder = 0
              object Panel8: TPanel
                Left = 8
                Top = 0
                Width = 246
                Height = 5
                Align = alTop
                BevelOuter = bvNone
                Color = clWhite
                TabOrder = 0
              end
              object Option108Panel: TPanel
                Left = 8
                Top = 5
                Width = 246
                Height = 26
                Align = alTop
                BevelOuter = bvNone
                Caption = #44256#44061#51452#47928#49436
                Color = clWhite
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
              end
              object Option109Panel: TPanel
                Left = 8
                Top = 31
                Width = 246
                Height = 24
                Align = alTop
                BevelOuter = bvNone
                Caption = '[ '#52628#44032#51452#47928' ]'
                Color = clWhite
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
                TabOrder = 2
              end
              object Option110Panel: TPanel
                Left = 8
                Top = 115
                Width = 246
                Height = 25
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = #53580' '#51060' '#48660' : 13'
                Color = clWhite
                TabOrder = 3
              end
              object Option111Panel: TPanel
                Left = 8
                Top = 140
                Width = 246
                Height = 25
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = #44256' '#44061' '#49688' : 4'
                Color = clWhite
                TabOrder = 4
              end
              object Option112Panel: TPanel
                Left = 8
                Top = 193
                Width = 246
                Height = 26
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = '      '#47700'   '#45684'                '#49688#47049'        '#44552#50529
                Color = clWhite
                TabOrder = 5
              end
              object Option113Panel: TPanel
                Left = 8
                Top = 222
                Width = 246
                Height = 26
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = ' '#44608#52824#52236#44060'                      2      10,000'
                Color = clWhite
                TabOrder = 6
              end
              object Option114Panel: TPanel
                Left = 8
                Top = 248
                Width = 246
                Height = 26
                Align = alTop
                BevelOuter = bvNone
                Caption = '  '#44277'            '#48177'  '
                Color = clWhite
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = [fsStrikeOut]
                ParentFont = False
                TabOrder = 7
              end
              object Panel231: TPanel
                Left = 8
                Top = 274
                Width = 246
                Height = 14
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = ' '#46108#51109#52236#44060'                      1       5,000'
                Color = clWhite
                TabOrder = 8
              end
              object Option115Panel: TPanel
                Left = 8
                Top = 363
                Width = 246
                Height = 26
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = #51452#47928#45812#45817' : '#54861#44600#46041
                Color = clWhite
                TabOrder = 9
              end
              object Panel18: TPanel
                Left = 8
                Top = 389
                Width = 246
                Height = 26
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Color = clWhite
                TabOrder = 10
                object Option117Panel: TPanel
                  Left = 0
                  Top = 0
                  Width = 130
                  Height = 26
                  Align = alLeft
                  Alignment = taLeftJustify
                  BevelOuter = bvNone
                  Caption = '2012-06-13 17:47:20       '
                  Color = clWhite
                  TabOrder = 0
                end
                object Option116Panel: TPanel
                  Left = 136
                  Top = 0
                  Width = 110
                  Height = 26
                  Align = alRight
                  Alignment = taLeftJustify
                  BevelOuter = bvNone
                  Caption = '      '#51452#47928#48264#54840' : 12      '
                  Color = clWhite
                  TabOrder = 1
                end
              end
              object Option313Panel: TPanel
                Left = 8
                Top = 415
                Width = 246
                Height = 26
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = #54840#52636#48264#54840' : 10'
                Color = clWhite
                TabOrder = 11
              end
              object Panel21: TPanel
                Left = 8
                Top = 288
                Width = 246
                Height = 12
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = '==========================='
                Color = clWhite
                TabOrder = 12
              end
              object Panel22: TPanel
                Left = 8
                Top = 190
                Width = 246
                Height = 3
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = '--------------------------------------------------'
                Color = clWhite
                TabOrder = 13
              end
              object Panel25: TPanel
                Left = 8
                Top = 360
                Width = 246
                Height = 3
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = '--------------------------------------------------'
                Color = clWhite
                TabOrder = 14
              end
              object Option370Panel: TPanel
                Left = 8
                Top = 165
                Width = 246
                Height = 25
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = #47700'    '#47784' : VIP'#49552#45784
                Color = clWhite
                TabOrder = 15
              end
              object Option1624Panel: TPanel
                Left = 8
                Top = 55
                Width = 246
                Height = 15
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = #49345#54840' : '#51061#49828#53944#47548#54252#49828
                Color = clWhite
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
                TabOrder = 16
              end
              object Option1621Panel: TPanel
                Left = 8
                Top = 70
                Width = 246
                Height = 15
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = #49324#50629#51088' : 123-45-67890      '#45824#54364#51088':'#54861#44600#46041
                Color = clWhite
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
                TabOrder = 17
              end
              object Option1622Panel: TPanel
                Left = 8
                Top = 85
                Width = 246
                Height = 15
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = #51064#52380#49884' '#50672#49688#44396' '#49569#46020#44284#54617#47196' 13'
                Color = clWhite
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
                TabOrder = 18
              end
              object Option1623Panel: TPanel
                Left = 8
                Top = 100
                Width = 246
                Height = 15
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = #50672#46973#52376' : 1544-4171'
                Color = clWhite
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
                TabOrder = 19
              end
              object Option0521Panel: TPanel
                Left = 8
                Top = 300
                Width = 246
                Height = 21
                Align = alTop
                Alignment = taRightJustify
                BevelOuter = bvNone
                Caption = #44284#49464#44552#50529'              22,728'
                Color = clWhite
                TabOrder = 20
              end
              object Panel23: TPanel
                Left = 8
                Top = 337
                Width = 246
                Height = 23
                Align = alTop
                Alignment = taRightJustify
                BevelOuter = bvNone
                Caption = #51452#47928#54633#44228#44552#50529'          25,000'
                Color = clWhite
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -17
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
                TabOrder = 21
              end
              object Panel24: TPanel
                Left = 8
                Top = 219
                Width = 246
                Height = 3
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = '--------------------------------------------------'
                Color = clWhite
                TabOrder = 22
              end
              object Option0522Panel: TPanel
                Left = 8
                Top = 321
                Width = 246
                Height = 16
                Align = alTop
                Alignment = taRightJustify
                BevelOuter = bvNone
                Caption = #48512#44032#49464#44552#50529'               2,272'
                Color = clWhite
                TabOrder = 23
              end
            end
            object Option108ComboBox: TcxComboBox
              Left = 284
              Top = 8
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#54869#45824
                #44032#47196#49464#47196#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 1
              Text = #48372#53685
              Width = 80
            end
            object Option109ComboBox: TcxComboBox
              Left = 284
              Top = 33
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#49464#47196#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 2
              Text = #48372#53685
              Width = 80
            end
            object Option110ComboBox: TcxComboBox
              Left = 284
              Top = 126
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#49464#47196#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 3
              Text = #48372#53685
              Width = 80
            end
            object Option111ComboBox: TcxComboBox
              Left = 284
              Top = 152
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#49464#47196#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 4
              Text = #48372#53685
              Width = 80
            end
            object Option112ComboBox: TcxComboBox
              Left = 284
              Top = 205
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 5
              Text = #48372#53685
              Width = 80
            end
            object Option113ComboBox: TcxComboBox
              Left = 284
              Top = 233
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#49464#47196#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 6
              Text = #48372#53685
              Width = 80
            end
            object Option114ComboBox: TcxComboBox
              Left = 284
              Top = 259
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #52636#47141#54632)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 7
              Text = #52636#47141#50504#54632
              Width = 80
            end
            object Option115ComboBox: TcxComboBox
              Left = 284
              Top = 369
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#49464#47196#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 8
              Text = #52636#47141#50504#54632
              Width = 80
            end
            object Option117ComboBox: TcxComboBox
              Left = 284
              Top = 395
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#49464#47196#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 9
              Text = #52636#47141#50504#54632
              Width = 80
            end
            object Option313ComboBox: TcxComboBox
              Left = 284
              Top = 424
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#49464#47196#54869#45824
                '3'#48176#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 10
              Text = #52636#47141#50504#54632
              Width = 80
            end
            object Option116ComboBox: TcxComboBox
              Left = 284
              Top = 455
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#49464#47196#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 11
              Text = #52636#47141#50504#54632
              Width = 80
            end
            object Option039SpinEdit: TcxSpinEdit
              Left = 87
              Top = 455
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 12
              Width = 54
            end
            object Option152RadioGroup: TcxRadioGroup
              Left = 406
              Top = 416
              Caption = ' '#52636#47141#54805#53468' '
              ParentFont = False
              Properties.Items = <
                item
                  Caption = ' '#47560#51648#47561#51452#47928'+'#52509#51452#47928
                end
                item
                  Caption = ' '#47560#51648#47561#51452#47928
                end
                item
                  Caption = ' '#52509#51452#47928
                end>
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 13
              Transparent = True
              Height = 81
              Width = 157
            end
            object Option011CheckBox: TcxCheckBox
              Left = 403
              Top = -2
              Caption = ' '#44256#44061' '#51452#47928#49436#47484' '#52636#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 14
            end
            object Option167CheckBox: TcxCheckBox
              Left = 403
              Top = 22
              Caption = ' '#54252#49828#48324#47196' '#52636#47141#50668#48512#47484' '#49444#51221#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 15
            end
            object Option041CheckBox: TcxCheckBox
              Left = 403
              Top = 46
              Caption = ' '#51452#47928' '#49884' '#52636#47141#50668#48512#47484' '#54869#51064#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 16
            end
            object Option038CheckBox: TcxCheckBox
              Left = 403
              Top = 71
              Caption = ' '#51088#47532' '#51060#46041','#54633#49437','#47700#45684#51060#46041' '#49884' '#44256#44061#51452#47928#49436#47484' '#52636#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 17
            end
            object Option224CheckBox: TcxCheckBox
              Left = 403
              Top = 95
              Caption = ' '#48512#44032#49464#48324#46020' '#47700#45684#45716' '#47700#45684#44552#50529#50640' '#48512#44032#49464#44552#50529#51012' '#51228#50808#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 18
            end
            object Option163CheckBox: TcxCheckBox
              Left = 403
              Top = 119
              Caption = ' '#52712#49548#51452#47928#51008' '#52636#47141#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 19
            end
            object Option161CheckBox: TcxCheckBox
              Left = 403
              Top = 144
              Caption = ' '#44256#44061#51452#47928#49436#50640' '#51452#48169#47700#47784#47484' '#52636#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 20
            end
            object Option073CheckBox: TcxCheckBox
              Left = 403
              Top = 192
              Caption = ' '#44256#44061' '#51452#47928#49436#47484' '#52395#51109#47564' '#52636#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 21
            end
            object Option003CheckBox: TcxCheckBox
              Left = 403
              Top = 238
              Caption = ' '#54616#45800#45236#50857#52636#47141#51012' '#49324#50857#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 22
            end
            object CustomerBottomMemo: TcxMemo
              Left = 406
              Top = 264
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 23
              OnEnter = CustomerBottomMemoEnter
              OnExit = CustomerBottomMemoExit
              Height = 93
              Width = 303
            end
            object Option338CheckBox: TcxCheckBox
              Left = 403
              Top = 168
              Caption = ' '#48512#47700#45684#47484' '#52636#47141#54616#51648' '#50506#49845#45768#45796'.('#49464#53944','#53076#49828','#50724#54536#49464#53944', '#50500#51060#53596')'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 24
            end
            object Option370ComboBox: TcxComboBox
              Left = 283
              Top = 178
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 25
              Text = #48372#53685
              Width = 80
            end
            object Option162ComboBox: TcxComboBox
              Left = 284
              Top = 59
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #52636#47141#54632)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 26
              Text = #52636#47141#50504#54632
              Width = 80
            end
            object Option052ComboBox: TcxComboBox
              Left = 284
              Top = 307
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #52636#47141#54632)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 27
              Text = #52636#47141#50504#54632
              Width = 80
            end
            object Option409CheckBox: TcxCheckBox
              Left = 403
              Top = 215
              Caption = ' '#44256#44061#51452#47928#49436#50640' '#44552#50529#51012' '#52636#47141#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 28
            end
            object Option410ComboBox: TcxComboBox
              Left = 487
              Top = 391
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #51452#47928#49436#48324#47196' '#52636#47141#54633#45768#45796'.'
                #47700#45684#48324' '#45233#51109#51004#47196' '#52636#47141#54633#45768#45796'.'
                #47700#45684#48324' '#52636#47141#54633#45768#45796'.')
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 29
              Text = #51452#47928#49436#48324#47196' '#52636#47141#54633#45768#45796'.'
              Width = 222
            end
            object Option435SpinEdit: TcxSpinEdit
              Left = 667
              Top = 422
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.MaxValue = 9.000000000000000000
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 30
              Width = 42
            end
            object Option436SpinEdit: TcxSpinEdit
              Left = 667
              Top = 453
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.MaxValue = 9.000000000000000000
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 31
              Width = 42
            end
            object CustomerTitleEdit: TcxTextEdit
              Left = 522
              Top = 362
              ParentFont = False
              Properties.MaxLength = 42
              Properties.OnChange = EditPropertiesChange
              Properties.OnValidate = EditPropertiesValidate
              Style.StyleController = EditStyleController
              TabOrder = 32
              Width = 186
            end
          end
        end
        object DiscountTabSheet: TcxTabSheet
          Caption = #54624#51064#44288#47144
          ImageIndex = 9
          object AdvScrollBox10: TAdvScrollBox
            Left = 0
            Top = 0
            Width = 1279
            Height = 872
            Align = alClient
            BorderStyle = bsNone
            DoubleBuffered = True
            Ctl3D = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            TabOrder = 0
            object Label74: TLabel
              Left = 35
              Top = 283
              Width = 349
              Height = 17
              Caption = #54624#51064#48260#53948' '#53364#47533' '#49884'                                    '#49892#54665#54633#45768#45796'.'
              Transparent = True
            end
            object Label72: TLabel
              Left = 35
              Top = 220
              Width = 101
              Height = 17
              Caption = #50689#49688#51613' '#44592#48376#54624#51064' '
              Transparent = True
            end
            object Label73: TLabel
              Left = 35
              Top = 252
              Width = 109
              Height = 17
              Caption = #51088#46041#51208#49324' '#54624#51064#45800#50948
              Transparent = True
            end
            object Label75: TLabel
              Left = 35
              Top = 314
              Width = 209
              Height = 17
              Caption = #54624#51064#50984' '#54624#51064#45800#50948'                    '#50896
              Transparent = True
            end
            object cxGroupBox12: TcxGroupBox
              Left = 25
              Top = 10
              Caption = ' '#49324#50857' '#54624' '#54624#51064' '
              ParentFont = False
              Style.StyleController = EditStyleController
              TabOrder = 0
              Height = 195
              Width = 290
              object DcUseCheckListBox: TcxCheckListBox
                Left = 13
                Top = 25
                Width = 265
                Height = 151
                ImeName = 'Microsoft IME 2003'
                Items = <
                  item
                    Tag = 1
                    Text = ' '#51204#52404' % '#54624#51064
                  end
                  item
                    Tag = 2
                    Text = ' '#51204#52404' '#44552#50529' '#54624#51064
                  end
                  item
                    Tag = 6
                    Text = ' '#47700#45684' % '#54624#51064
                  end
                  item
                    Tag = 7
                    Text = ' '#47700#45684' '#44552#50529' '#54624#51064
                  end
                  item
                    Tag = 3
                    Text = ' '#48512#44032#49464' '#54624#51064
                  end
                  item
                    Text = ' '#45800#44032#48320#44221
                  end
                  item
                    Text = ' '#48393#49324#47308' '
                  end
                  item
                    Text = ' '#50976#54540#47084#49828' '#54624#51064
                  end>
                ParentFont = False
                Style.StyleController = EditStyleController
                TabOrder = 0
                OnEditValueChanged = EditPropertiesChange
              end
            end
            object ReceiptDefaultDcComboBox: TcxComboBox
              Left = 171
              Top = 216
              ParentFont = False
              Properties.Alignment.Horz = taLeftJustify
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                '')
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 1
              Width = 139
            end
            object Option153ComboBox: TcxComboBox
              Left = 171
              Top = 248
              ParentFont = False
              Properties.Alignment.Horz = taLeftJustify
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                '10'#50896' '#45800#50948
                '100'#50896' '#45800#50948
                '1,000'#50896' '#45800#50948
                '10,000'#50896' '#45800#50948
                #49324#50857#50504#54632)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 2
              Text = '10'#50896' '#45800#50948
              Width = 139
            end
            object Option246ComboBox: TcxComboBox
              Left = 171
              Top = 279
              ParentFont = False
              Properties.Alignment.Horz = taLeftJustify
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                '0. '#49324#50857#50504#54632
                '1. '#51204#52404' '#44552#50529#54624#51064
                '2. '#51204#52404' %'#54624#51064)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 3
              Width = 139
            end
            object DcRateUnitEdit: TcxCurrencyEdit
              Left = 171
              Top = 311
              EditValue = 0.000000000000000000
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = '0,'
              Properties.EditFormat = '#,'
              Properties.UseLeftAlignmentOnEditing = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 4
              Width = 53
            end
            object Option305CheckBox: TcxCheckBox
              Left = 447
              Top = 11
              Caption = ' '#49888#50857#52852#46300' '#44228#49328' '#49884' '#51088#46041#51208#49324' '#44592#45733#51012' '#49324#50857#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 5
            end
            object Option294CheckBox: TcxCheckBox
              Left = 447
              Top = 35
              Caption = ' '#51473#48373#54624#51064#51012' '#54728#50857' '#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 6
            end
            object Option251CheckBox: TcxCheckBox
              Left = 447
              Top = 59
              Caption = ' '#54924#50896#44396#48516#48324' '#47700#45684#54624#51064#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 7
            end
            object Option298CheckBox: TcxCheckBox
              Left = 447
              Top = 84
              Caption = ' '#44208#51228#48320#44221' '#49884' '#54624#51064' '#44592#45733#51012' '#49324#50857#54624' '#49688' '#50630#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 8
            end
            object Option366CheckBox: TcxCheckBox
              Left = 447
              Top = 108
              Caption = ' '#51204#52404' % '#54624#51064' '#49884' '#54624#51064#44552#50529#51012' '#51204#52404#54624#51064#44552#50529#51004#47196' '#54624#51064#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 9
            end
            object cxGroupBox22: TcxGroupBox
              Left = 446
              Top = 174
              Caption = ' '#49828#53596#54532' '
              ParentFont = False
              Style.StyleController = EditStyleController
              TabOrder = 10
              Height = 116
              Width = 386
              object Label168: TLabel
                Left = 19
                Top = 80
                Width = 101
                Height = 17
                Caption = #49828#53596#54532' '#49324#50857' '#48169#49885
                Transparent = True
              end
              object StampDcAmtWonLabel: TLabel
                Left = 365
                Top = 81
                Width = 13
                Height = 17
                Caption = #50896
                Transparent = True
              end
              object StampDcCountLabel: TLabel
                Left = 275
                Top = 82
                Width = 13
                Height = 17
                Caption = #51109
              end
              object Label2: TLabel
                Left = 40
                Top = 49
                Width = 264
                Height = 17
                Caption = #49828#53596#54532' '#49324#50857' '#49884' '#54252#51064#53944#44592#45733#51008' '#49324#50857#54624' '#49688' '#50630#51020
                Transparent = True
              end
              object Option406ComboBox: TcxComboBox
                Left = 130
                Top = 77
                ParentFont = False
                Properties.Alignment.Horz = taLeftJustify
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  #47700#45684#48324#54624#51064
                  #44552#50529#54624#51064)
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 0
                Text = #47700#45684#48324#54624#51064
                Width = 89
              end
              object StampDcAmtEdit: TcxCurrencyEdit
                Left = 293
                Top = 77
                EditValue = 0.000000000000000000
                ParentFont = False
                Properties.Alignment.Horz = taRightJustify
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = '0,'
                Properties.EditFormat = '#,'
                Properties.UseLeftAlignmentOnEditing = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 1
                Width = 66
              end
              object StampDcCountEdit: TcxSpinEdit
                Left = 228
                Top = 77
                ParentFont = False
                Properties.Alignment.Horz = taCenter
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 2
                Width = 43
              end
              object Option021CheckBox: TcxCheckBox
                Left = 18
                Top = 22
                Caption = ' '#49828#53596#54532#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 3
              end
            end
            object cxGroupBox16: TcxGroupBox
              Left = 27
              Top = 352
              Caption = ' '#53216#54256' '
              ParentFont = False
              Style.StyleController = EditStyleController
              TabOrder = 11
              Height = 126
              Width = 386
              object Label136: TLabel
                Left = 27
                Top = 35
                Width = 109
                Height = 17
                Caption = #53216#54256#48264#54840' '#54532#47532#54589#49828
                Transparent = True
              end
              object Label1: TLabel
                Left = 203
                Top = 35
                Width = 52
                Height = 17
                Caption = #51204#52404#44600#51060
                Transparent = True
              end
              object CouponPrefixEdit: TcxMaskEdit
                Left = 163
                Top = 30
                Properties.Alignment.Horz = taCenter
                Properties.EditMask = '!99;1;_'
                Properties.MaxLength = 0
                Properties.OnChange = EditPropertiesChange
                TabOrder = 0
                Text = '29'
                Width = 32
              end
              object CouponLengthEdit: TcxSpinEdit
                Left = 259
                Top = 30
                ParentFont = False
                Properties.Alignment.Horz = taCenter
                Properties.MaxValue = 30.000000000000000000
                Properties.MinValue = 8.000000000000000000
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 1
                Value = 8
                Width = 43
              end
              object Option064CheckBox: TcxCheckBox
                Left = 25
                Top = 87
                Caption = ' '#53216#54256#49324#50857' '#49884' '#53216#54256#51012' '#48156#54665#54616#51648' '#50506#49845#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 3
              end
              object Option335CheckBox: TcxCheckBox
                Left = 25
                Top = 61
                Caption = ' '#44228#49328' '#49884' '#53216#54256#51012' '#48156#54665#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 2
              end
            end
          end
        end
        object POSDeliveryTabSheet: TcxTabSheet
          Caption = #48176#45804#44288#47144
          ImageIndex = 10
          object DeliveryPager: TcxPageControl
            Left = 0
            Top = 0
            Width = 1279
            Height = 872
            Align = alClient
            TabOrder = 0
            Properties.ActivePage = Delivery1Page
            Properties.CustomButtons.Buttons = <>
            Properties.TabWidth = 80
            LookAndFeel.Kind = lfOffice11
            LookAndFeel.NativeStyle = False
            ClientRectBottom = 872
            ClientRectRight = 1279
            ClientRectTop = 28
            object Delivery1Page: TcxTabSheet
              Caption = #48176#45804#49444#51221'1'
              ImageIndex = 0
              object AdvScrollBox11: TAdvScrollBox
                Left = 0
                Top = 0
                Width = 1279
                Height = 844
                Align = alClient
                BorderStyle = bsNone
                DoubleBuffered = True
                Ctl3D = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                TabOrder = 0
                object Label68: TLabel
                  Left = 14
                  Top = 164
                  Width = 298
                  Height = 17
                  Caption = #51204#54868#44032' '#50772#51012' '#46412' '#49688#54868#44592#51221#48372' '#50976#54952#49884#44036'              '#52488
                end
                object Label64: TLabel
                  Left = 14
                  Top = 44
                  Width = 83
                  Height = 17
                  Caption = #48176#45804' '#44592#48376#51452#49548
                end
                object Label65: TLabel
                  Left = 15
                  Top = 73
                  Width = 137
                  Height = 17
                  Caption = #48512#51116' '#51473' '#51204#54868' '#48372#44288' '#44079#49688
                end
                object Label66: TLabel
                  Left = 14
                  Top = 103
                  Width = 88
                  Height = 17
                  Caption = #44592#48376' '#48176#45804' '#44396#48516
                end
                object Label139: TLabel
                  Left = 15
                  Top = 13
                  Width = 83
                  Height = 17
                  Caption = #48176#45804#54868#47732' '#53440#51077
                end
                object Label157: TLabel
                  Left = 15
                  Top = 134
                  Width = 88
                  Height = 17
                  Caption = #44592#48376' '#44208#51228' '#48169#48277
                end
                object DeliveryTableGroupBox: TcxGroupBox
                  Left = 412
                  Top = 9
                  Caption = ' '#48176#45804' '#53580#51060#48660#44288#47144' '
                  ParentFont = False
                  Style.StyleController = EditStyleController
                  TabOrder = 0
                  Height = 488
                  Width = 364
                  object Label50: TLabel
                    Left = 15
                    Top = 23
                    Width = 83
                    Height = 17
                    Caption = #48176#45804#54364#49884' '#44079#49688
                  end
                  object Label51: TLabel
                    Left = 195
                    Top = 24
                    Width = 8
                    Height = 17
                    Caption = 'X'
                  end
                  object Label52: TLabel
                    Left = 214
                    Top = 59
                    Width = 52
                    Height = 17
                    Caption = #44544#51088#53356#44592
                  end
                  object Label53: TLabel
                    Left = 214
                    Top = 92
                    Width = 52
                    Height = 17
                    Caption = #44544#51088#53356#44592
                  end
                  object Label54: TLabel
                    Left = 214
                    Top = 143
                    Width = 52
                    Height = 17
                    Caption = #44544#51088#53356#44592
                  end
                  object Label55: TLabel
                    Left = 213
                    Top = 169
                    Width = 52
                    Height = 17
                    Caption = #44544#51088#53356#44592
                  end
                  object Label58: TLabel
                    Left = 15
                    Top = 210
                    Width = 158
                    Height = 17
                    Caption = #48512#51116' '#51473' '#51204#54868#48264#54840' '#44544#51088#53356#44592
                  end
                  object Label59: TLabel
                    Left = 17
                    Top = 241
                    Width = 83
                    Height = 17
                    Caption = #48120#51452#47928#49884' '#49353#49345
                  end
                  object Label60: TLabel
                    Left = 17
                    Top = 270
                    Width = 75
                    Height = 17
                    Caption = #51452#47928' '#49884' '#49353#49345
                  end
                  object Label61: TLabel
                    Left = 17
                    Top = 299
                    Width = 75
                    Height = 17
                    Caption = #48176#45804' '#49884' '#49353#49345
                  end
                  object Label62: TLabel
                    Left = 17
                    Top = 328
                    Width = 75
                    Height = 17
                    Caption = #44228#49328' '#49884' '#49353#49345
                  end
                  object Label67: TLabel
                    Left = 17
                    Top = 426
                    Width = 114
                    Height = 17
                    Caption = #53580#51060#48660#50640' '#54364#49884' '#45236#50857
                  end
                  object POSTableButton: TPosButton
                    Left = 24
                    Top = 57
                    Width = 154
                    Height = 127
                    BorderColor = 12615680
                    Number.NumberString = #54861#44600#46041
                    Number.CenterString = '0010'
                    Number.RightString = '17:30'
                    Number.Height = 23
                    Number.Font.Charset = DEFAULT_CHARSET
                    Number.Font.Color = clWhite
                    Number.Font.Height = -15
                    Number.Font.Name = #47569#51008' '#44256#46357
                    Number.Font.Style = []
                    Number.Color = 8804864
                    Number.ShowColor = True
                    Bottom.LeftString = #51452#47928
                    Bottom.Height = 25
                    Bottom.Font.Charset = DEFAULT_CHARSET
                    Bottom.Font.Color = clWhite
                    Bottom.Font.Height = -15
                    Bottom.Font.Name = #47569#51008' '#44256#46357
                    Bottom.Font.Style = []
                    Bottom.Color = clWhite
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = #47569#51008' '#44256#46357
                    Font.Style = []
                    Caption = ''
                    Menu.Name = #49569#46020#48716#46972' 302'
                    Menu.Font.Charset = DEFAULT_CHARSET
                    Menu.Font.Color = clWhite
                    Menu.Font.Height = -16
                    Menu.Font.Name = #47569#51008' '#44256#46357
                    Menu.Font.Style = []
                    Amount.Caption = '15,000'#50896
                    Amount.Font.Charset = DEFAULT_CHARSET
                    Amount.Font.Color = clWhite
                    Amount.Font.Height = -16
                    Amount.Font.Name = #47569#51008' '#44256#46357
                    Amount.Font.Style = []
                    Down = False
                    Color = 12615680
                    LayoutTop = True
                    IsWork = False
                    IsUse = False
                  end
                  object Label90: TLabel
                    Left = 17
                    Top = 357
                    Width = 70
                    Height = 17
                    Caption = #53580#46160#47532' '#49353#49345
                  end
                  object Label195: TLabel
                    Left = 17
                    Top = 388
                    Width = 57
                    Height = 17
                    Caption = #44544#51088' '#49353#49345
                  end
                  object DeliveryXSizeEdit: TcxSpinEdit
                    Left = 135
                    Top = 20
                    ParentFont = False
                    Properties.Alignment.Horz = taCenter
                    Properties.MaxValue = 30.000000000000000000
                    Properties.MinValue = 2.000000000000000000
                    Properties.OnChange = EditPropertiesChange
                    Style.StyleController = EditStyleController
                    TabOrder = 0
                    Value = 5
                    Width = 54
                  end
                  object DeliveryYSizeEdit: TcxSpinEdit
                    Left = 209
                    Top = 20
                    ParentFont = False
                    Properties.Alignment.Horz = taCenter
                    Properties.MaxValue = 30.000000000000000000
                    Properties.MinValue = 2.000000000000000000
                    Properties.OnChange = EditPropertiesChange
                    Style.StyleController = EditStyleController
                    TabOrder = 1
                    Value = 5
                    Width = 54
                  end
                  object DeliveryTableTitleSizeEdit: TcxSpinEdit
                    Left = 282
                    Top = 54
                    ParentFont = False
                    Properties.Alignment.Horz = taCenter
                    Properties.MaxValue = 30.000000000000000000
                    Properties.MinValue = 5.000000000000000000
                    Properties.OnChange = EditPropertiesChange
                    Style.StyleController = EditStyleController
                    TabOrder = 2
                    Value = 5
                    Width = 54
                  end
                  object DeliveryTableMenuSizeEdit: TcxSpinEdit
                    Left = 282
                    Top = 87
                    ParentFont = False
                    Properties.Alignment.Horz = taCenter
                    Properties.MaxValue = 30.000000000000000000
                    Properties.MinValue = 5.000000000000000000
                    Properties.OnChange = EditPropertiesChange
                    Style.StyleController = EditStyleController
                    TabOrder = 3
                    Value = 5
                    Width = 54
                  end
                  object DeliveryTableAmountSizeEdit: TcxSpinEdit
                    Left = 282
                    Top = 138
                    ParentFont = False
                    Properties.Alignment.Horz = taCenter
                    Properties.MaxValue = 30.000000000000000000
                    Properties.MinValue = 5.000000000000000000
                    Properties.OnChange = EditPropertiesChange
                    Style.StyleController = EditStyleController
                    TabOrder = 4
                    Value = 5
                    Width = 54
                  end
                  object DeliveryTableBottomSizeEdit: TcxSpinEdit
                    Left = 281
                    Top = 166
                    ParentFont = False
                    Properties.Alignment.Horz = taCenter
                    Properties.MaxValue = 30.000000000000000000
                    Properties.MinValue = 5.000000000000000000
                    Properties.OnChange = EditPropertiesChange
                    Style.StyleController = EditStyleController
                    TabOrder = 5
                    Value = 5
                    Width = 54
                  end
                  object DeliveryTablePhoneNumberSizeEdit: TcxSpinEdit
                    Left = 184
                    Top = 206
                    ParentFont = False
                    Properties.Alignment.Horz = taCenter
                    Properties.MaxValue = 30.000000000000000000
                    Properties.MinValue = 5.000000000000000000
                    Properties.OnChange = EditPropertiesChange
                    Style.StyleController = EditStyleController
                    TabOrder = 6
                    Value = 5
                    Width = 54
                  end
                  object Option187ComboBox: TcxComboBox
                    Left = 181
                    Top = 423
                    ParentFont = False
                    Properties.Alignment.Horz = taLeftJustify
                    Properties.DropDownListStyle = lsFixedList
                    Properties.Items.Strings = (
                      '0. '#50630#51020
                      '1. '#47700#45684
                      '2. '#51452#49548
                      '3. '#44256#44061#47749
                      '4. '#51204#54868#48264#54840
                      '5. '#51452#49548'+'#51204#54868#48264#54840
                      '6. '#47700#45684'+'#51204#54868#48264#54840)
                    Properties.OnChange = EditPropertiesChange
                    Style.StyleController = EditStyleController
                    TabOrder = 7
                    Text = '0. '#50630#51020
                    Width = 143
                  end
                  object Option295CheckBox: TcxCheckBox
                    Left = 15
                    Top = 452
                    Caption = ' '#48176#45804#53580#51060#48660#50640' '#51452#47928#44221#44284#49884#44036'('#48516')'#51012' '#54364#49884#54633#45768#45796'.'
                    ParentFont = False
                    Properties.OnChange = EditPropertiesChange
                    Style.StyleController = EditStyleController
                    TabOrder = 8
                  end
                  object DeliveryReadyColorPanel: TPanel
                    Left = 200
                    Top = 237
                    Width = 63
                    Height = 25
                    BevelOuter = bvNone
                    BorderStyle = bsSingle
                    Color = clGreen
                    Ctl3D = False
                    ParentBackground = False
                    ParentCtl3D = False
                    TabOrder = 9
                    OnClick = DeliveryReadyColorPanelClick
                  end
                  object DeliveryOrderColorPanel: TPanel
                    Left = 200
                    Top = 266
                    Width = 63
                    Height = 25
                    BevelOuter = bvNone
                    BorderStyle = bsSingle
                    Color = clGreen
                    Ctl3D = False
                    ParentBackground = False
                    ParentCtl3D = False
                    TabOrder = 10
                    OnClick = DeliveryReadyColorPanelClick
                  end
                  object DeliveryAccountColorPanel: TPanel
                    Left = 200
                    Top = 324
                    Width = 63
                    Height = 25
                    BevelOuter = bvNone
                    BorderStyle = bsSingle
                    Color = clGreen
                    Ctl3D = False
                    ParentBackground = False
                    ParentCtl3D = False
                    TabOrder = 11
                    OnClick = DeliveryReadyColorPanelClick
                  end
                  object DeliveryDeliveryColorPanel: TPanel
                    Left = 200
                    Top = 295
                    Width = 63
                    Height = 25
                    BevelOuter = bvNone
                    BorderStyle = bsSingle
                    Color = clGreen
                    Ctl3D = False
                    ParentBackground = False
                    ParentCtl3D = False
                    TabOrder = 12
                    OnClick = DeliveryReadyColorPanelClick
                  end
                  object DeliveryBorderColorPanel: TPanel
                    Left = 200
                    Top = 353
                    Width = 63
                    Height = 25
                    BevelOuter = bvNone
                    BorderStyle = bsSingle
                    Color = clGreen
                    Ctl3D = False
                    ParentBackground = False
                    ParentCtl3D = False
                    TabOrder = 13
                    OnClick = DeliveryReadyColorPanelClick
                  end
                  object DeliveryFontColorPanel: TPanel
                    Left = 200
                    Top = 382
                    Width = 63
                    Height = 25
                    BevelOuter = bvNone
                    BorderStyle = bsSingle
                    Color = clGreen
                    Ctl3D = False
                    ParentBackground = False
                    ParentCtl3D = False
                    TabOrder = 14
                    OnClick = DeliveryReadyColorPanelClick
                  end
                end
                object DeliveryDefaultAddressEdit: TcxTextEdit
                  Left = 111
                  Top = 40
                  ParentFont = False
                  Properties.MaxLength = 42
                  Properties.OnChange = EditPropertiesChange
                  Properties.OnValidate = EditPropertiesValidate
                  Style.StyleController = EditStyleController
                  TabOrder = 1
                  Width = 273
                end
                object DeliveryPhoneCountEdit: TcxSpinEdit
                  Left = 161
                  Top = 69
                  ParentFont = False
                  Properties.Alignment.Horz = taCenter
                  Properties.MaxValue = 30.000000000000000000
                  Properties.MinValue = 5.000000000000000000
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 2
                  Value = 5
                  Width = 54
                end
                object Option118ComboBox: TcxComboBox
                  Left = 113
                  Top = 99
                  ParentFont = False
                  Properties.Alignment.Horz = taCenter
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #48176#45804
                    #54252#51109)
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 3
                  Text = #48176#45804
                  Width = 78
                end
                object DeliveryAvailTimeSpinEdit: TcxSpinEdit
                  Left = 240
                  Top = 161
                  ParentFont = False
                  Properties.Alignment.Horz = taCenter
                  Properties.MaxValue = 100.000000000000000000
                  Properties.MinValue = 20.000000000000000000
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 4
                  Value = 30
                  Width = 54
                end
                object Option228CheckBox: TcxCheckBox
                  Left = 11
                  Top = 187
                  Caption = ' '#49688#44592#51452#47928#49436#50640' '#54616#45800#45236#50857#51012' '#52636#47141#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 5
                end
                object DeliveryBottomMemo: TcxMemo
                  Left = 15
                  Top = 219
                  Lines.Strings = (
                    'cxMemo2')
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 6
                  OnEnter = CustomerBottomMemoEnter
                  OnExit = CustomerBottomMemoExit
                  Height = 219
                  Width = 310
                end
                object Option368ComboBox: TcxComboBox
                  Left = 112
                  Top = 9
                  ParentFont = False
                  Properties.Alignment.Horz = taCenter
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #53580#51060#48660
                    #44536#47532#46300)
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 7
                  Text = #53580#51060#48660
                  Width = 87
                end
                object DeliveryGridGroupBox: TcxGroupBox
                  Left = 786
                  Top = 4
                  Caption = ' '#44536#47532#46300#44288#47144' '
                  ParentFont = False
                  Style.StyleController = EditStyleController
                  TabOrder = 8
                  Height = 84
                  Width = 160
                  object Label140: TLabel
                    Left = 15
                    Top = 24
                    Width = 44
                    Height = 17
                    Caption = #51460' '#45458#51060
                  end
                  object Label141: TLabel
                    Left = 15
                    Top = 53
                    Width = 52
                    Height = 17
                    Caption = #44544#51088#53356#44592
                  end
                  object DeliveryGridRowHeigthEdit: TcxSpinEdit
                    Left = 93
                    Top = 20
                    ParentFont = False
                    Properties.Alignment.Horz = taCenter
                    Properties.MaxValue = 50.000000000000000000
                    Properties.MinValue = 15.000000000000000000
                    Properties.OnChange = EditPropertiesChange
                    Style.StyleController = EditStyleController
                    TabOrder = 0
                    Value = 15
                    Width = 54
                  end
                  object DeliveryGridFontSizeEdit: TcxSpinEdit
                    Left = 93
                    Top = 49
                    ParentFont = False
                    Properties.Alignment.Horz = taCenter
                    Properties.MaxValue = 30.000000000000000000
                    Properties.MinValue = 8.000000000000000000
                    Properties.OnChange = EditPropertiesChange
                    Style.StyleController = EditStyleController
                    TabOrder = 1
                    Value = 8
                    Width = 54
                  end
                end
                object Option395ComboBox: TcxComboBox
                  Left = 113
                  Top = 130
                  ParentFont = False
                  Properties.Alignment.Horz = taCenter
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52852#46300
                    #54788#44552)
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 9
                  Text = #52852#46300
                  Width = 78
                end
                object Option018CheckBox: TcxCheckBox
                  Left = 226
                  Top = 8
                  Caption = ' '#44592#45733#48260#53948' '#45796#53356#47784#46300
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 10
                end
              end
            end
            object Delivery2Page: TcxTabSheet
              Caption = #48176#45804#49444#51221'2'
              ImageIndex = 1
              object AdvScrollBox12: TAdvScrollBox
                Left = 0
                Top = 0
                Width = 1279
                Height = 844
                Align = alClient
                BorderStyle = bsNone
                DoubleBuffered = True
                Ctl3D = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                TabOrder = 0
                object Label156: TLabel
                  Left = 370
                  Top = 371
                  Width = 143
                  Height = 17
                  Caption = '('#44536#47532#46300#53440#51077#50640#49436#47564' '#49324#50857')'
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clRed
                  Font.Height = -13
                  Font.Name = #47569#51008' '#44256#46357
                  Font.Style = []
                  ParentFont = False
                end
                object Label192: TLabel
                  Left = 372
                  Top = 268
                  Width = 223
                  Height = 17
                  Caption = '('#44032#47196#49464#47196#54869#45824' '#49884' "'#47700#45684#47749'('#49688#47049')" '#52636#47141')'
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clRed
                  Font.Height = -13
                  Font.Name = #47569#51008' '#44256#46357
                  Font.Style = []
                  ParentFont = False
                end
                object Panel49: TPanel
                  Left = 18
                  Top = 9
                  Width = 264
                  Height = 458
                  BevelOuter = bvNone
                  BorderStyle = bsSingle
                  Color = clWhite
                  Ctl3D = False
                  ParentBackground = False
                  ParentCtl3D = False
                  TabOrder = 0
                  object Option121Panel: TPanel
                    Left = 0
                    Top = 0
                    Width = 262
                    Height = 26
                    Align = alTop
                    BevelOuter = bvNone
                    Caption = #48176#45804#51204#54364
                    Color = clWhite
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -15
                    Font.Name = #44404#47548#52404
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 0
                  end
                  object Option272Panel: TPanel
                    Left = 0
                    Top = 54
                    Width = 262
                    Height = 26
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = ' '#51452#47928#49884#44036' : 2012-07-16 15:18'
                    Color = clWhite
                    TabOrder = 1
                  end
                  object Option277Panel: TPanel
                    Left = 0
                    Top = 184
                    Width = 262
                    Height = 26
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = ' '#53945#51060#49324#54637
                    Color = clWhite
                    TabOrder = 2
                  end
                  object Option278Panel: TPanel
                    Left = 0
                    Top = 213
                    Width = 262
                    Height = 24
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = '    '#47700' '#45684'                '#45800#44032'    '#49688#47049'     '#44552#50529'   '
                    Color = clWhite
                    TabOrder = 3
                  end
                  object Panel57: TPanel
                    Left = 0
                    Top = 274
                    Width = 262
                    Height = 26
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = ' '#48374#51020#48165'                5,500       2    11,000'
                    Color = clWhite
                    TabOrder = 4
                  end
                  object Option280Panel: TPanel
                    Left = 0
                    Top = 309
                    Width = 262
                    Height = 20
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = ' 2012-07-16 17:15:30  '
                    Color = clWhite
                    TabOrder = 5
                  end
                  object Panel73: TPanel
                    Left = 0
                    Top = 300
                    Width = 262
                    Height = 9
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = '============================'
                    Color = clWhite
                    TabOrder = 6
                  end
                  object Panel78: TPanel
                    Left = 0
                    Top = 210
                    Width = 262
                    Height = 3
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = ' --------------------------------------------------'
                    Color = clWhite
                    TabOrder = 7
                  end
                  object Panel79: TPanel
                    Left = 0
                    Top = 240
                    Width = 262
                    Height = 8
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Color = clWhite
                    TabOrder = 8
                  end
                  object Panel80: TPanel
                    Left = 0
                    Top = 26
                    Width = 262
                    Height = 2
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Color = clWhite
                    TabOrder = 9
                  end
                  object Panel81: TPanel
                    Left = 0
                    Top = 237
                    Width = 262
                    Height = 3
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = ' --------------------------------------------------'
                    Color = clWhite
                    TabOrder = 10
                  end
                  object Option271Panel: TPanel
                    Left = 0
                    Top = 28
                    Width = 262
                    Height = 26
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = ' '#48176#45804#48264#54840' : 20120716-0001'
                    Color = clWhite
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #47569#51008' '#44256#46357
                    Font.Style = [fsStrikeOut]
                    ParentFont = False
                    TabOrder = 11
                  end
                  object Option191Panel: TPanel
                    Left = 0
                    Top = 433
                    Width = 262
                    Height = 26
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = ' '#53216'     '#54256' : 3 '#51109
                    Color = clWhite
                    TabOrder = 12
                  end
                  object Option282Panel: TPanel
                    Left = 0
                    Top = 381
                    Width = 262
                    Height = 26
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = ' '#48176#45804#53076#49828' : A'#53076#49828
                    Color = clWhite
                    TabOrder = 13
                  end
                  object Option281Panel: TPanel
                    Left = 0
                    Top = 329
                    Width = 262
                    Height = 26
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = ' '#48176#45804#45812#45817' : '#48264#44060#47592
                    Color = clWhite
                    TabOrder = 14
                  end
                  object Option274Panel: TPanel
                    Left = 0
                    Top = 106
                    Width = 262
                    Height = 26
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = ' '#50672#46973#52376' 1 : 010-123-4567'
                    Color = clWhite
                    TabOrder = 15
                  end
                  object Option273Panel: TPanel
                    Left = 0
                    Top = 80
                    Width = 262
                    Height = 26
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = ' '#44256' '#44061' '#47749' : '#54861#44600#46041
                    Color = clWhite
                    TabOrder = 16
                  end
                  object Option276Panel: TPanel
                    Left = 0
                    Top = 158
                    Width = 262
                    Height = 26
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = ' '#51452'   '#49548
                    Color = clWhite
                    TabOrder = 17
                  end
                  object Option275Panel: TPanel
                    Left = 0
                    Top = 132
                    Width = 262
                    Height = 26
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = ' '#50672#46973#52376' 2 : 02-123-4567'
                    Color = clWhite
                    TabOrder = 18
                  end
                  object Option279Panel: TPanel
                    Left = 0
                    Top = 248
                    Width = 262
                    Height = 26
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = ' '#51676#51109#47732'                5,000       2    10,000'
                    Color = clWhite
                    TabOrder = 19
                  end
                  object Option283Panel: TPanel
                    Left = 0
                    Top = 407
                    Width = 262
                    Height = 26
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = ' '#48176#45804#51648#50669' : '#50500#54028#53944
                    Color = clWhite
                    TabOrder = 20
                  end
                  object Option394Panel: TPanel
                    Left = 0
                    Top = 355
                    Width = 262
                    Height = 26
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = ' '#44208#51228#44396#48516' : '#52852#46300
                    Color = clWhite
                    TabOrder = 21
                  end
                end
                object Option121ComboBox: TcxComboBox
                  Left = 284
                  Top = 11
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#50504#54632
                    #48372#53685
                    #49464#47196#54869#45824
                    #44032#47196#54869#45824
                    #44032#47196#49464#47196#54869#45824)
                  Properties.OnChange = Option108ComboBoxPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 1
                  Text = #48372#53685
                  Width = 80
                end
                object Option271ComboBox: TcxComboBox
                  Left = 284
                  Top = 38
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#50504#54632
                    #48372#53685
                    #49464#47196#54869#45824
                    #44032#47196#54869#45824
                    #44032#47196#49464#47196#54869#45824)
                  Properties.OnChange = Option108ComboBoxPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 2
                  Text = #48372#53685
                  Width = 80
                end
                object Option272ComboBox: TcxComboBox
                  Left = 284
                  Top = 64
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#50504#54632
                    #48372#53685
                    #49464#47196#54869#45824)
                  Properties.OnChange = Option108ComboBoxPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 3
                  Text = #52636#47141#50504#54632
                  Width = 80
                end
                object Option273ComboBox: TcxComboBox
                  Left = 284
                  Top = 90
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#50504#54632
                    #48372#53685
                    #49464#47196#54869#45824
                    #44032#47196#54869#45824
                    #44032#47196#49464#47196#54869#45824)
                  Properties.OnChange = Option108ComboBoxPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 4
                  Text = #48372#53685
                  Width = 80
                end
                object Option274ComboBox: TcxComboBox
                  Left = 284
                  Top = 116
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#50504#54632
                    #48372#53685
                    #49464#47196#54869#45824
                    #44032#47196#54869#45824
                    #44032#47196#49464#47196#54869#45824)
                  Properties.OnChange = Option108ComboBoxPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 5
                  Text = #48372#53685
                  Width = 80
                end
                object Option275ComboBox: TcxComboBox
                  Left = 284
                  Top = 143
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#50504#54632
                    #48372#53685
                    #49464#47196#54869#45824
                    #44032#47196#54869#45824
                    #44032#47196#49464#47196#54869#45824)
                  Properties.OnChange = Option108ComboBoxPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 6
                  Text = #48372#53685
                  Width = 80
                end
                object Option276ComboBox: TcxComboBox
                  Left = 284
                  Top = 170
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#50504#54632
                    #48372#53685
                    #49464#47196#54869#45824
                    #44032#47196#49464#47196#54869#45824)
                  Properties.OnChange = Option108ComboBoxPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 7
                  Text = #48372#53685
                  Width = 80
                end
                object Option277ComboBox: TcxComboBox
                  Left = 284
                  Top = 196
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#50504#54632
                    #48372#53685
                    #49464#47196#54869#45824)
                  Properties.OnChange = Option108ComboBoxPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 8
                  Text = #52636#47141#50504#54632
                  Width = 80
                end
                object Option278ComboBox: TcxComboBox
                  Left = 284
                  Top = 225
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#50504#54632
                    #52636#47141#54632)
                  Properties.OnChange = Option108ComboBoxPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 9
                  Text = #52636#47141#50504#54632
                  Width = 80
                end
                object Option279ComboBox: TcxComboBox
                  Left = 284
                  Top = 262
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#50504#54632
                    #48372#53685
                    #49464#47196#54869#45824
                    #44032#47196#49464#47196)
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 10
                  Text = #52636#47141#50504#54632
                  Width = 80
                end
                object Option280ComboBox: TcxComboBox
                  Left = 284
                  Top = 315
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#50504#54632
                    #48372#53685
                    #49464#47196#54869#45824
                    #44032#47196#54869#45824)
                  Properties.OnChange = Option108ComboBoxPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 11
                  Text = #52636#47141#50504#54632
                  Width = 80
                end
                object Option281ComboBox: TcxComboBox
                  Left = 284
                  Top = 341
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#50504#54632
                    #48372#53685
                    #49464#47196#54869#45824
                    #44032#47196#54869#45824
                    #44032#47196#49464#47196#54869#45824)
                  Properties.OnChange = Option108ComboBoxPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 12
                  Text = #52636#47141#50504#54632
                  Width = 80
                end
                object Option282ComboBox: TcxComboBox
                  Left = 284
                  Top = 391
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#50504#54632
                    #48372#53685
                    #49464#47196#54869#45824
                    #44032#47196#54869#45824
                    #44032#47196#49464#47196#54869#45824)
                  Properties.OnChange = Option108ComboBoxPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 13
                  Text = #52636#47141#50504#54632
                  Width = 80
                end
                object Option283ComboBox: TcxComboBox
                  Left = 284
                  Top = 417
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#50504#54632
                    #48372#53685
                    #49464#47196#54869#45824
                    #44032#47196#54869#45824
                    #44032#47196#49464#47196#54869#45824)
                  Properties.OnChange = Option108ComboBoxPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 14
                  Text = #52636#47141#50504#54632
                  Width = 80
                end
                object Option191ComboBox: TcxComboBox
                  Left = 284
                  Top = 443
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#50504#54632
                    #48372#53685
                    #49464#47196#54869#45824
                    #44032#47196#54869#45824
                    #44032#47196#49464#47196#54869#45824)
                  Properties.OnChange = Option108ComboBoxPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 15
                  Text = #52636#47141#50504#54632
                  Width = 80
                end
                object cxGroupBox5: TcxGroupBox
                  Left = 441
                  Top = 8
                  Caption = ' '#54616#45800#47928#44396' '
                  ParentFont = False
                  Style.StyleController = EditStyleController
                  TabOrder = 16
                  Height = 164
                  Width = 339
                  object DeliveryEnd3Edit: TcxTextEdit
                    Left = 10
                    Top = 75
                    ParentFont = False
                    Properties.MaxLength = 42
                    Properties.OnChange = EditPropertiesChange
                    Properties.OnValidate = EditPropertiesValidate
                    Style.StyleController = EditStyleController
                    TabOrder = 2
                    Width = 320
                  end
                  object DeliveryEnd2Edit: TcxTextEdit
                    Left = 10
                    Top = 48
                    ParentFont = False
                    Properties.MaxLength = 42
                    Properties.OnChange = EditPropertiesChange
                    Properties.OnValidate = EditPropertiesValidate
                    Style.StyleController = EditStyleController
                    TabOrder = 1
                    Width = 320
                  end
                  object DeliveryEnd1Edit: TcxTextEdit
                    Left = 10
                    Top = 21
                    ParentFont = False
                    Properties.MaxLength = 42
                    Properties.OnChange = EditPropertiesChange
                    Properties.OnValidate = EditPropertiesValidate
                    Style.StyleController = EditStyleController
                    TabOrder = 0
                    Width = 320
                  end
                  object DeliveryEnd5Edit: TcxTextEdit
                    Left = 10
                    Top = 129
                    ParentFont = False
                    Properties.MaxLength = 42
                    Properties.OnChange = EditPropertiesChange
                    Properties.OnValidate = EditPropertiesValidate
                    Style.StyleController = EditStyleController
                    TabOrder = 4
                    Width = 320
                  end
                  object DeliveryEnd4Edit: TcxTextEdit
                    Left = 10
                    Top = 102
                    ParentFont = False
                    Properties.MaxLength = 42
                    Properties.OnChange = EditPropertiesChange
                    Properties.OnValidate = EditPropertiesValidate
                    Style.StyleController = EditStyleController
                    TabOrder = 3
                    Width = 320
                  end
                end
                object Option394ComboBox: TcxComboBox
                  Left = 284
                  Top = 366
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #52636#47141#50504#54632
                    #48372#53685
                    #49464#47196#54869#45824
                    #44032#47196#54869#45824
                    #44032#47196#49464#47196#54869#45824)
                  Properties.OnChange = Option108ComboBoxPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 17
                  Text = #52636#47141#50504#54632
                  Width = 80
                end
              end
            end
            object cxTabSheet21: TcxTabSheet
              Caption = #48176#45804#49444#51221'3'
              ImageIndex = 2
              object AdvScrollBox13: TAdvScrollBox
                Left = 0
                Top = 0
                Width = 1279
                Height = 844
                Align = alClient
                BorderStyle = bsNone
                DoubleBuffered = True
                Ctl3D = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                TabOrder = 0
                object Label103: TLabel
                  Left = 38
                  Top = 265
                  Width = 255
                  Height = 17
                  Caption = #44228#49328' '#49884' '#48176#45804#51204#54364#47484'           '#51109' '#52636#47141#54633#45768#45796'.'
                end
                object Label101: TLabel
                  Left = 38
                  Top = 236
                  Width = 255
                  Height = 17
                  Caption = #48176#45804' '#49884' '#48176#45804#51204#54364#47484'           '#51109' '#52636#47141#54633#45768#45796'.'
                end
                object Label100: TLabel
                  Left = 37
                  Top = 207
                  Width = 255
                  Height = 17
                  Caption = #51452#47928' '#49884' '#48176#45804#51204#54364#47484'           '#51109' '#52636#47141#54633#45768#45796'.'
                end
                object Label155: TLabel
                  Left = 469
                  Top = 181
                  Width = 132
                  Height = 17
                  Caption = ' '#49888#44508#44256#44061#51068#46412' '#51452#47928' '#49884
                end
                object Label106: TLabel
                  Left = 48
                  Top = 424
                  Width = 323
                  Height = 17
                  Caption = #8251' '#47588#52636#47196' '#52376#47532#46104#51648' '#50506#44256' '#48176#45804#49345#53468#47564' "'#44228#49328#50756#47308'"'#47196' '#48320#44221
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clRed
                  Font.Height = -13
                  Font.Name = #47569#51008' '#44256#46357
                  Font.Style = []
                  ParentFont = False
                end
                object Label191: TLabel
                  Left = 475
                  Top = 246
                  Width = 130
                  Height = 17
                  Caption = #48176#45804'('#48120#51648#51221') '#51452#47928#47700#45684
                end
                object BaeminMenuNameLabel: TLabel
                  Left = 716
                  Top = 245
                  Width = 217
                  Height = 17
                  AutoSize = False
                end
                object Option347CheckBox: TcxCheckBox
                  Left = 471
                  Top = 65
                  Caption = ' '#48176#45804#51452#47928' '#54980' '#48176#45804#51221#48372' '#54868#47732#51004#47196' '#46028#50500#44049#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 0
                end
                object Option344CheckBox: TcxCheckBox
                  Left = 471
                  Top = 37
                  Caption = ' '#48176#45804#44208#51228' '#49884' '#50689#49688#51613#51012' '#52636#47141#54616#51648' '#50506#49845#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 1
                end
                object Option056CheckBox: TcxCheckBox
                  Left = 33
                  Top = 10
                  Caption = ' '#44536#47355#54924#49688' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 2
                end
                object Option144CheckBox: TcxCheckBox
                  Left = 33
                  Top = 37
                  Caption = ' '#44536#47355#54924#49688' '#45812#45817#51088#47484' '#49324#50857#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 3
                end
                object Option270CheckBox: TcxCheckBox
                  Left = 33
                  Top = 64
                  Caption = ' '#44536#47355#54924#49688#47532#49828#53944#50640' '#47700#45684#45236#50669#51012' '#52636#47141#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 4
                end
                object Option301CheckBox: TcxCheckBox
                  Left = 33
                  Top = 91
                  Caption = ' '#44536#47355#54924#49688#47532#49828#53944#47484' '#44036#47029#54616#44172' '#52636#47141#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 5
                end
                object Option120CheckBox: TcxCheckBox
                  Left = 33
                  Top = 172
                  Caption = ' '#48176#45804' '#45812#45817#51088#47484' '#49324#50857#54616#51648' '#50506#49845#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 6
                end
                object Option186CheckBox: TcxCheckBox
                  Left = 33
                  Top = 287
                  Caption = ' '#51452#47928' '#49884' '#44256#44061#50689#49688#51613#51012' '#52636#47141#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 7
                end
                object Option119CheckBox: TcxCheckBox
                  Left = 33
                  Top = 315
                  Caption = ' '#48176#45804' '#49884' '#44256#44061#50689#49688#51613#51012' '#52636#47141#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 8
                end
                object Option190CheckBox: TcxCheckBox
                  Left = 33
                  Top = 342
                  Caption = ' '#44228#49328' '#49884' '#44256#44061#50689#49688#51613#51012' '#52636#47141#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 9
                end
                object Option188CheckBox: TcxCheckBox
                  Left = 33
                  Top = 370
                  Caption = ' '#51204#54868#44032' '#50772#51012' '#46412' '#44592#51316#44256#44061#51060#47732' '#51452#47928#54868#47732#51012' '#54364#49884#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 10
                end
                object Option284CheckBox: TcxCheckBox
                  Left = 33
                  Top = 398
                  Caption = ' '#54252#49828#47560#44048' '#49884' '#51452#47928'/'#48176#45804' '#49345#53468#51032' '#48176#45804#51012' '#44228#49328#50756#47308#47196' '#48320#44221#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 11
                end
                object Option316CheckBox: TcxCheckBox
                  Left = 471
                  Top = 10
                  Caption = ' '#49888#44508#51452#47928' '#49884' '#51204#54868#48264#54840' '#46608#45716' '#51452#49548#46976#50640' '#52964#49436#47484' '#50948#52824#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 12
                end
                object Option143SpinEdit: TcxSpinEdit
                  Left = 161
                  Top = 203
                  ParentFont = False
                  Properties.Alignment.Horz = taCenter
                  Properties.AssignedValues.MinValue = True
                  Properties.MaxValue = 9.000000000000000000
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 13
                  Width = 40
                end
                object Option189SpinEdit: TcxSpinEdit
                  Left = 161
                  Top = 232
                  ParentFont = False
                  Properties.Alignment.Horz = taCenter
                  Properties.AssignedValues.MinValue = True
                  Properties.MaxValue = 9.000000000000000000
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 14
                  Width = 40
                end
                object Option145SpinEdit: TcxSpinEdit
                  Left = 161
                  Top = 261
                  ParentFont = False
                  Properties.Alignment.Horz = taCenter
                  Properties.AssignedValues.MinValue = True
                  Properties.MaxValue = 9.000000000000000000
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 15
                  Width = 40
                end
                object Option348CheckBox: TcxCheckBox
                  Left = 471
                  Top = 93
                  Caption = ' '#44256#44061#50689#49688#51613#50640' '#51452#48169#47700#47784#47484' '#52636#47141#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 16
                end
                object Option364CheckBox: TcxCheckBox
                  Left = 471
                  Top = 121
                  Caption = ' '#48176#45804#51452#47928' '#51200#51109' '#49884' '#44592#51316' '#54924#50896#51221#48372#47484' '#48320#44221#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 17
                end
                object Option377CheckBox: TcxCheckBox
                  Left = 471
                  Top = 148
                  Caption = ' '#54924#50896#51200#51109' '#49884' '#54924#50896#47749#51060' '#50630#51012' '#46412' '#51452#49548#47484' '#54924#50896#47749#51004#47196' '#51200#51109#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 18
                end
                object Option380CheckBox: TcxCheckBox
                  Left = 33
                  Top = 145
                  Caption = ' '#44536#47495#54924#49688#47532#49828#53944' '#52636#47141' '#54980' '#54924#49688#50756#47308' '#50668#48512#47484' '#54869#51064#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 19
                end
                object Option392ComboBox: TcxComboBox
                  Left = 609
                  Top = 177
                  ParentFont = False
                  Properties.Alignment.Horz = taLeftJustify
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #54924#50896#51004#47196' '#51200#51109#54616#51648' '#50506#49845#45768#45796'.'
                    #54924#50896' '#51200#51109#50668#48512#47484' '#54869#51064#54633#45768#45796'.'
                    #54924#50896' '#51200#51109#50668#48512#47484' '#54869#51064#54616#51648' '#50506#44256' '#51200#51109#54633#45768#45796'.')
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 20
                  Text = #54924#50896#51004#47196' '#51200#51109#54616#51648' '#50506#49845#45768#45796'.'
                  Width = 280
                end
                object Option397CheckBox: TcxCheckBox
                  Left = 33
                  Top = 118
                  Caption = ' '#44536#47495#54924#49688#47532#49828#53944#47484' '#52636#47141' '#54624' '#48176#45804#44148#51012' '#49440#53469#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 21
                end
                object Option082CheckBox: TcxCheckBox
                  Left = 471
                  Top = 208
                  Caption = ' '#44256#44061#50689#49688#51613#50640' '#44256#44061#51221#48372#47484' '#52636#47141#54633#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 22
                end
                object BaeminMenuEdit: TcxButtonEdit
                  Left = 617
                  Top = 242
                  ParentFont = False
                  Properties.Buttons = <
                    item
                      Default = True
                      Kind = bkEllipsis
                    end>
                  Properties.ReadOnly = False
                  Properties.OnButtonClick = BaeminMenuEditPropertiesButtonClick
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 23
                  Width = 93
                end
                object Option443CheckBox: TcxCheckBox
                  Left = 471
                  Top = 396
                  Caption = ' '#48176#45804#51032' '#48124#51313' '#51452#47928' '#49884' '#48176#45804#51204#54364#47484' '#52636#47141#54633#45768#45796'.('#44536#47532#46300#48169#49885#47564' '#51648#50896')'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 24
                  Visible = False
                end
                object Option444CheckBox: TcxCheckBox
                  Left = 471
                  Top = 424
                  Caption = ' '#48176#45804#51032' '#48124#51313' '#51204#54364#47484' '#52636#47141#54616#51648' '#50506#49845#45768#45796'.'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 25
                  Visible = False
                end
                object Option434CheckBox: TcxCheckBox
                  Left = 470
                  Top = 275
                  Caption = ' '#48176#45804#51452#47928' '#49884' '#51452#48169#51452#47928#49436#47484' '#52636#47141#54633#45768#45796'.('#48176#48124','#53216#54049','#50836#44592#50836')'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 26
                end
                object Option489CheckBox: TcxCheckBox
                  Left = 470
                  Top = 302
                  Caption = ' '#48176#45804#51452#47928' '#47700#45684#47564' '#49688#51665#54633#45768#45796'. ('#51204#54364#45716' '#49373#49457#54616#51648' '#50506#51020')'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 27
                end
              end
            end
          end
        end
        object WaitParkingTabSheet: TcxTabSheet
          Caption = #45824#44592#54364'&&'#51452#52264#51613
          ImageIndex = 11
          object AdvScrollBox14: TAdvScrollBox
            Left = 0
            Top = 0
            Width = 1279
            Height = 872
            Align = alClient
            BorderStyle = bsNone
            DoubleBuffered = True
            Ctl3D = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            TabOrder = 0
            object cxGroupBox9: TcxGroupBox
              Left = 22
              Top = 7
              Caption = ' '#45824#44592#54364' '
              ParentFont = False
              Style.StyleController = EditStyleController
              TabOrder = 0
              Height = 379
              Width = 389
              object Label96: TLabel
                Left = 35
                Top = 210
                Width = 96
                Height = 17
                Caption = #45824#44592#54364' '#52636#47141#47588#49688
              end
              object Label57: TLabel
                Left = 35
                Top = 174
                Width = 88
                Height = 17
                Caption = #51077#51109' '#45824#44592#49884#44036' '
              end
              object Label131: TLabel
                Left = 35
                Top = 140
                Width = 140
                Height = 17
                Caption = #53580#51060#48660#45817' '#50696#49345#45824#44592' '#49884#44036
              end
              object Option200CheckBox: TcxCheckBox
                Left = 22
                Top = 78
                Caption = ' '#47700#51064#54252#49828' '#47560#44048' '#49884' '#45824#44592#54364#51221#48372#47484' '#52488#44592#54868' '#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 2
              end
              object cxGroupBox10: TcxGroupBox
                Left = 7
                Top = 251
                Caption = ' '#54616#45800#47928#44396' '
                ParentFont = False
                Style.StyleController = EditStyleController
                TabOrder = 7
                Height = 111
                Width = 374
                object WaitBottom1Edit: TcxTextEdit
                  Left = 15
                  Top = 21
                  ParentFont = False
                  Properties.MaxLength = 42
                  Properties.OnChange = EditPropertiesChange
                  Properties.OnValidate = EditPropertiesValidate
                  Style.StyleController = EditStyleController
                  TabOrder = 0
                  Width = 344
                end
                object WaitBottom2Edit: TcxTextEdit
                  Left = 15
                  Top = 49
                  ParentFont = False
                  Properties.MaxLength = 42
                  Properties.OnChange = EditPropertiesChange
                  Properties.OnValidate = EditPropertiesValidate
                  Style.StyleController = EditStyleController
                  TabOrder = 1
                  Width = 344
                end
                object WaitBottom3Edit: TcxTextEdit
                  Left = 15
                  Top = 76
                  ParentFont = False
                  Properties.MaxLength = 42
                  Properties.OnChange = EditPropertiesChange
                  Properties.OnValidate = EditPropertiesValidate
                  Style.StyleController = EditStyleController
                  TabOrder = 2
                  Width = 344
                end
              end
              object Option151SpinEdit: TcxSpinEdit
                Left = 166
                Top = 206
                ParentFont = False
                Properties.Alignment.Horz = taCenter
                Properties.MaxValue = 5.000000000000000000
                Properties.MinValue = 1.000000000000000000
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 6
                Value = 1
                Width = 54
              end
              object Option070CheckBox: TcxCheckBox
                Left = 23
                Top = 26
                Caption = ' '#45824#44592#54364' '#52636#47141' '#49884' '#51064#50896' '#49688#47484' '#51077#47141#54616#51648' '#50506#49845#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 0
              end
              object Option196CheckBox: TcxCheckBox
                Left = 23
                Top = 52
                Caption = ' '#45824#44592#54364#50640' '#45824#44592#51064#50896#51012' '#52636#47141#54616#51648' '#50506#49845#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 1
              end
              object Option286CheckBox: TcxCheckBox
                Left = 22
                Top = 105
                Caption = ' '#45824#44592' '#54840#52636' '#49884' '#52852#52852#50724' '#50508#47548#53665#51012' '#49324#50857#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 3
              end
              object Option309ComboBox: TcxComboBox
                Left = 129
                Top = 170
                ParentFont = False
                Properties.Alignment.Horz = taLeftJustify
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  '5'#48516
                  '10'#48516
                  '15'#48516)
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 5
                Width = 91
              end
              object Option353ComboBox: TcxComboBox
                Left = 185
                Top = 136
                ParentFont = False
                Properties.Alignment.Horz = taCenter
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  #49324#50857#50504#54632
                  #51088#46041
                  '20'#48516
                  '30'#48516
                  '40'#48516
                  '50'#48516
                  '60'#48516
                  '70'#48516
                  '80'#48516
                  '90'#48516)
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 4
                Text = #51088#46041
                Width = 85
              end
            end
            object cxGroupBox11: TcxGroupBox
              Left = 422
              Top = 8
              Caption = ' '#51452#52264#54624#51064#44428
              ParentFont = False
              Style.StyleController = EditStyleController
              TabOrder = 1
              Height = 118
              Width = 356
              object Label26: TLabel
                Left = 36
                Top = 36
                Width = 65
                Height = 17
                Caption = #51452#52264#49884#49828#53596
              end
              object ParkingLabel: TcxLabel
                Left = 36
                Top = 65
                Caption = #51648#51216#53076#46300'(6)'
                ParentFont = False
                Style.BorderStyle = ebsNone
                Style.Font.Charset = HANGEUL_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = #47569#51008' '#44256#46357
                Style.Font.Style = []
                Style.StyleController = EditStyleController
                Style.IsFontAssigned = True
                Transparent = True
              end
              object ParkingCodeEdit: TcxTextEdit
                Left = 114
                Top = 63
                ParentFont = False
                Properties.Alignment.Horz = taCenter
                Properties.MaxLength = 6
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 1
                Width = 67
              end
              object Option291ComboBox: TcxComboBox
                Left = 114
                Top = 32
                ParentFont = False
                Properties.Alignment.Horz = taLeftJustify
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  #49324#50857#50504#54632
                  #45208#51060#49828#54028#53356
                  #50500#47560#45432#53076#47532#50500)
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 2
                Width = 135
              end
            end
          end
        end
        object StockTabSheet: TcxTabSheet
          Caption = #51116#44256#44288#47144
          ImageIndex = 12
          object Label25: TLabel
            Left = 26
            Top = 24
            Width = 88
            Height = 17
            Caption = #48120#46321#47197' '#49345#54408' '#49884
          end
          object Label177: TLabel
            Left = 27
            Top = 145
            Width = 186
            Height = 17
            Caption = #48148#53076#46300' '#49828#52884' '#49884' '#50526' '#49324#50857#51088#47532'  '#49688
          end
          object Option331CheckBox: TcxCheckBox
            Left = 21
            Top = 54
            Caption = ' '#49345#54408#51312#54924#50640' '#47588#51077#45800#44032#47484' '#54364#49884#54633#45768#45796'.'
            ParentFont = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 0
          end
          object Option330ComboBox: TcxComboBox
            Left = 131
            Top = 20
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.Items.Strings = (
              #54032#47588' '#54616#51648' '#50506#49845#45768#45796
              #49345#54408#46321#47197' '#54868#47732#51012' '#46916#50881#45768#45796
              #46024#53685#51012' '#50676#44256' '#49345#54408#46321#47197' '#54868#47732#51012' '#46916#50881#45768#45796)
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 1
            Text = #54032#47588' '#54616#51648' '#50506#49845#45768#45796
            Width = 270
          end
          object Option332CheckBox: TcxCheckBox
            Left = 21
            Top = 82
            Caption = ' '#45800#44032#48320#44221' '#49884' '#49345#54408#51221#48372#51032' '#54032#47588#45800#44032#47484' '#48320#44221#54633#45768#45796'.'
            ParentFont = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 2
          end
          object Option371CheckBox: TcxCheckBox
            Left = 21
            Top = 110
            Caption = ' '#50948#54644#49345#54408#52264#45800' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
            ParentFont = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 3
          end
          object BarcodeScan415SpinEdit: TcxSpinEdit
            Left = 228
            Top = 140
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 16.000000000000000000
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 4
            Width = 54
          end
        end
        object POSFoodCourtTabSheet: TcxTabSheet
          Caption = #54392#46300#53076#53944#44288#47144
          ImageIndex = 13
          object Option233CheckBox: TcxCheckBox
            Left = 22
            Top = 17
            Caption = ' '#51452#47928#49436#47484' '#53076#45320#48324#47196' '#52636#47141#54633#45768#45796'.('#49440#48520#51228#47564' '#44032#45733')'
            ParentFont = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 0
          end
          object Option269CheckBox: TcxCheckBox
            Left = 22
            Top = 46
            Caption = ' '#51452#47928#48264#54840#47484' '#46041#51068#54616#44172' '#49324#50857#54633#45768#45796'('#49440#48520#51228#47564' '#44032#45733')'
            ParentFont = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 1
          end
          object Option232CheckBox: TcxCheckBox
            Left = 22
            Top = 74
            Caption = ' '#50689#49688#51613#50640' '#53076#45320#51221#48372#47484' '#52636#47141#54633#45768#45796'.'
            ParentFont = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 2
          end
          object Option234CheckBox: TcxCheckBox
            Left = 22
            Top = 101
            Caption = ' '#54252#49828#47560#44048' '#49884' '#53076#45320#48324' '#47588#52636#51012' '#52636#47141#54633#45768#45796'.'
            ParentFont = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 3
          end
          object Option267CheckBox: TcxCheckBox
            Left = 22
            Top = 128
            Caption = ' '#52789#48324#47196' VAN'#51012' '#45796#47476#44172' '#49324#50857#54633#45768#45796'.'
            ParentFont = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 4
          end
          object Option365CheckBox: TcxCheckBox
            Left = 22
            Top = 156
            Caption = ' '#44256#44061#51452#47928#49436#47484' '#47700#45684#51333#47448#48324#47196' '#52636#47141#54633#45768#45796'('#53076#45320#51452#47928#49436#45716' '#53685#54633')'
            ParentFont = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 5
          end
          object Option249CheckBox: TcxCheckBox
            Left = 25
            Top = 185
            Caption = ' '#49324#50629#51088#48324#47196' '#49888#50857#52852#46300' '#49849#51064#51012' '#49324#50857#54633#45768#45796'.'
            ParentFont = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            Style.TransparentBorder = False
            TabOrder = 6
          end
        end
        object KioskTabSheet: TcxTabSheet
          Caption = #53412#50724#49828#53356#44288#47144
          ImageIndex = 14
          object KioskPager: TcxPageControl
            Left = 0
            Top = 0
            Width = 1279
            Height = 872
            Align = alClient
            TabOrder = 0
            Properties.ActivePage = cxTabSheet26
            Properties.CustomButtons.Buttons = <>
            Properties.TabWidth = 80
            LookAndFeel.Kind = lfOffice11
            LookAndFeel.NativeStyle = False
            ClientRectBottom = 872
            ClientRectRight = 1279
            ClientRectTop = 28
            object cxTabSheet26: TcxTabSheet
              Caption = #50741#49496'1'
              ImageIndex = 0
              object Label187: TLabel
                Left = 443
                Top = 272
                Width = 194
                Height = 17
                Caption = #51452#47928'/'#44208#51228' '#51473' '#51089#50629#45236#50669' '#51088#46041#52712#49548' '
              end
              object Label189: TLabel
                Left = 441
                Top = 234
                Width = 119
                Height = 17
                Caption = #44536#47353#47700#45684' '#54364#49884' '#48169#49885' '
              end
              object Label190: TLabel
                Left = 692
                Top = 234
                Width = 14
                Height = 17
                Caption = ' '#215
              end
              object Label212: TLabel
                Left = 25
                Top = 20
                Width = 57
                Height = 17
                Caption = #44060#51216'/'#47560#44048
              end
              object Label118: TLabel
                Left = 462
                Top = 351
                Width = 179
                Height = 17
                Caption = '('#54840#52636#48264#54840#44032' '#51080#51004#47732' '#51088#46041' '#54364#49884')'
              end
              object Label228: TLabel
                Left = 443
                Top = 406
                Width = 53
                Height = 17
                Caption = #54252#51109' PLU'
              end
              object Label231: TLabel
                Left = 443
                Top = 435
                Width = 113
                Height = 17
                Caption = #51217#44540#49457'('#51200#51088#49464') PLU'
              end
              object Label233: TLabel
                Left = 443
                Top = 466
                Width = 113
                Height = 17
                Caption = #51217#44540#49457'('#51200#49884#47141') PLU'
              end
              object Option411CheckBox: TcxCheckBox
                Left = 21
                Top = 50
                Caption = ' '#54788#44552#44228#49328' '#50756#47308' '#54980' '#54788#44552#50689#49688#51613' '#48156#54665#50668#48512#47484' '#54869#51064#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 0
              end
              object Option417CheckBox: TcxCheckBox
                Left = 21
                Top = 77
                Caption = ' '#47588#51109#51060#50857'/'#54252#51109' '#51221#48372#47484' '#51452#48169'&&'#44256#44061#51452#47928#49436' '#51228#47785' '#50948#52824#50640' '#52636#47141#54633#45768#45796
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 1
              end
              object Option418CheckBox: TcxCheckBox
                Left = 21
                Top = 103
                Caption = ' '#44208#51228' '#49884' '#54924#50896#50668#48512#47484' '#54869#51064#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 2
              end
              object Option421CheckBox: TcxCheckBox
                Left = 21
                Top = 130
                Caption = ' '#54924#50896#51312#54924' '#54980' '#48120#44032#51077#54924#50896#51068#46412' '#49888#44508#54924#50896#51012' '#48155#49845#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 3
              end
              object Option422CheckBox: TcxCheckBox
                Left = 21
                Top = 209
                Caption = ' '#50500#51060#53596#47700#45684' '#51452#47928' '#49884' '#47700#45684#49688#47049' '#48320#44221#44592#45733#51012' '#49324#50857#54616#51648' '#50506#49845#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 4
              end
              object Option285CheckBox: TcxCheckBox
                Left = 21
                Top = 235
                Caption = ' '#54252#51064#53944'&&'#49828#53596#54532#47484' 2'#48176#47196' '#51201#47549#54633#45768#45796'.('#53412#50724#49828#53356#50640#49436' '#44228#49328#49884')'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 5
              end
              object Option423CheckBox: TcxCheckBox
                Left = 21
                Top = 156
                Caption = ' '#54924#50896#44032#51077#50640' '#55092#45824#54256#48264#54840' '#51064#51613#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 6
              end
              object Option425CheckBox: TcxCheckBox
                Left = 21
                Top = 261
                Caption = ' '#52572#51333' '#51452#47928#54869#51064' '#44592#45733#51012' '#49324#50857#54616#51648' '#50506#49845#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 7
              end
              object Option442CheckBox: TcxCheckBox
                Left = 21
                Top = 182
                Caption = ' '#54924#50896#51312#54924' '#49884' '#44592#48376' 010'#51012' '#54364#49884#54616#51648' '#50506#49845#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 8
              end
              object Option028CheckBox: TcxCheckBox
                Left = 21
                Top = 287
                Caption = ' '#51452#47928' '#47532#49828#53944#50640' '#47700#45684' '#45800#44032#47484' '#54364#49884#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 9
              end
              object Option035CheckBox: TcxCheckBox
                Left = 21
                Top = 314
                Caption = ' '#50500#51060#53596#47700#45684' '#51452#47928' '#49884' '#47700#45684#51060#48120#51648#47196' '#49440#53469#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 10
              end
              object Option236CheckBox: TcxCheckBox
                Left = 21
                Top = 340
                Caption = ' '#44228#49328' '#49884' '#54840#52636'('#52852#52852#50724#53665') '#48155#51012' '#51204#54868#48264#54840#47484' '#48155#49845#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 11
              end
              object Option337CheckBox: TcxCheckBox
                Left = 21
                Top = 366
                Caption = ' '#44228#49328' '#50756#47308' '#54980' '#50689#49688#51613' '#52636#47141#50668#48512' '#54869#51064#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 12
              end
              object Option293CheckBox: TcxCheckBox
                Left = 21
                Top = 393
                Caption = ' '#53076#49828#51452#47928#51012' '#48260#53948' '#48169#49885#51004#47196' '#49324#50857#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 13
              end
              object cxGroupBox18: TcxGroupBox
                Left = 439
                Top = 11
                Caption = ' '#51092#46024' '#48512#51313' '#50508#47548' '
                ParentFont = False
                Style.StyleController = EditStyleController
                TabOrder = 14
                Height = 98
                Width = 152
                object Label162: TLabel
                  Left = 10
                  Top = 35
                  Width = 26
                  Height = 17
                  Caption = #52380#50896
                end
                object Label163: TLabel
                  Left = 98
                  Top = 35
                  Width = 44
                  Height = 17
                  Caption = #51109' '#51060#54616
                end
                object Label164: TLabel
                  Left = 10
                  Top = 68
                  Width = 26
                  Height = 17
                  Caption = #48177#50896
                end
                object Label165: TLabel
                  Left = 98
                  Top = 68
                  Width = 44
                  Height = 17
                  Caption = #44060' '#51060#54616
                end
                object Alarm1000SpinEdit: TcxSpinEdit
                  Left = 42
                  Top = 31
                  ParentFont = False
                  Properties.Alignment.Horz = taCenter
                  Properties.AssignedValues.MinValue = True
                  Properties.LargeIncrement = 1.000000000000000000
                  Properties.MaxValue = 300.000000000000000000
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 0
                  Width = 54
                end
                object Alarm100SpinEdit: TcxSpinEdit
                  Left = 42
                  Top = 64
                  ParentFont = False
                  Properties.Alignment.Horz = taCenter
                  Properties.AssignedValues.MinValue = True
                  Properties.LargeIncrement = 1.000000000000000000
                  Properties.MaxValue = 300.000000000000000000
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 1
                  Width = 54
                end
              end
              object cxGroupBox21: TcxGroupBox
                Left = 595
                Top = 10
                Caption = ' '#51092#46024' '#48512#51313' '#51473#51648' '
                ParentFont = False
                Style.StyleController = EditStyleController
                TabOrder = 15
                Height = 98
                Width = 154
                object Label178: TLabel
                  Left = 11
                  Top = 35
                  Width = 26
                  Height = 17
                  Caption = #52380#50896
                end
                object Label179: TLabel
                  Left = 99
                  Top = 35
                  Width = 44
                  Height = 17
                  Caption = #51109' '#51060#54616
                end
                object Label180: TLabel
                  Left = 11
                  Top = 68
                  Width = 26
                  Height = 17
                  Caption = #48177#50896
                end
                object Label181: TLabel
                  Left = 99
                  Top = 68
                  Width = 44
                  Height = 17
                  Caption = #44060' '#51060#54616
                end
                object Stop1000SpinEdit: TcxSpinEdit
                  Left = 43
                  Top = 31
                  ParentFont = False
                  Properties.Alignment.Horz = taCenter
                  Properties.LargeIncrement = 1.000000000000000000
                  Properties.MaxValue = 300.000000000000000000
                  Properties.MinValue = 10.000000000000000000
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 0
                  Value = 10
                  Width = 54
                end
                object Stop100SpinEdit: TcxSpinEdit
                  Left = 43
                  Top = 64
                  ParentFont = False
                  Properties.Alignment.Horz = taCenter
                  Properties.LargeIncrement = 1.000000000000000000
                  Properties.MaxValue = 300.000000000000000000
                  Properties.MinValue = 10.000000000000000000
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 1
                  Value = 10
                  Width = 54
                end
              end
              object Option437ComboBox: TcxComboBox
                Left = 643
                Top = 266
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  #49324#50857#54616#51648#50506#51020
                  '30'#52488
                  '1'#48516
                  '2'#48516
                  '3'#48516
                  '4'#48516
                  '5'#48516)
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 16
                Text = #49324#50857#54616#51648#50506#51020
                Width = 131
              end
              object Option438ComboBox: TcxComboBox
                Left = 575
                Top = 231
                ParentFont = False
                Properties.Alignment.Horz = taCenter
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  #51088#46041
                  #44256#51221)
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 17
                Text = #51088#46041
                Width = 60
              end
              object Option439SpinEdit: TcxSpinEdit
                Left = 646
                Top = 231
                ParentFont = False
                Properties.Alignment.Horz = taCenter
                Properties.MaxValue = 9.000000000000000000
                Properties.MinValue = 1.000000000000000000
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 18
                Value = 1
                Width = 44
              end
              object Option440SpinEdit: TcxSpinEdit
                Left = 712
                Top = 231
                ParentFont = False
                Properties.Alignment.Horz = taCenter
                Properties.MaxValue = 9.000000000000000000
                Properties.MinValue = 1.000000000000000000
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 19
                Value = 1
                Width = 44
              end
              object cxGroupBox20: TcxGroupBox
                Left = 438
                Top = 119
                Caption = ' PLU '#47700#45684
                TabOrder = 20
                Height = 98
                Width = 310
                object Label183: TLabel
                  Left = 21
                  Top = 61
                  Width = 57
                  Height = 17
                  Caption = #54364#49884' '#44079#49688
                end
                object Label184: TLabel
                  Left = 161
                  Top = 60
                  Width = 14
                  Height = 17
                  Caption = ' '#215
                end
                object Option429SpinEdit: TcxSpinEdit
                  Left = 115
                  Top = 57
                  ParentFont = False
                  Properties.Alignment.Horz = taCenter
                  Properties.MaxValue = 9.000000000000000000
                  Properties.MinValue = 1.000000000000000000
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 1
                  Value = 1
                  Width = 44
                end
                object Option430SpinEdit: TcxSpinEdit
                  Left = 181
                  Top = 58
                  ParentFont = False
                  Properties.Alignment.Horz = taCenter
                  Properties.MaxValue = 9.000000000000000000
                  Properties.MinValue = 1.000000000000000000
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 2
                  Value = 1
                  Width = 44
                end
                object Option428CheckBox: TcxCheckBox
                  Left = 18
                  Top = 27
                  Caption = ' '#51204#52404#47484' '#44536#47353#47700#45684#47196' '#49324#50857#54633#45768#45796
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 0
                end
              end
              object Option341CheckBox: TcxCheckBox
                Left = 784
                Top = 218
                Caption = ' '#54000#53011#51012' '#52636#47141#54633#45768#45796'('#45233#51109')'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 21
                Visible = False
              end
              object Option470CheckBox: TcxCheckBox
                Left = 21
                Top = 420
                Caption = ' '#44208#51228#50756#47308' '#49884' '#51204#51088#50689#49688#51613#51012' '#50508#47548#53665#51004#47196' '#48156#49569#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 22
              end
              object Option471CheckBox: TcxCheckBox
                Left = 21
                Top = 447
                Caption = ' '#54665#49324' '#44592#44036#45236' '#54665#49324' '#48120#51201#50857' '#49884' '#54408#51208#47196' '#54364#49884#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 23
              end
              object Option416ComboBox: TcxComboBox
                Left = 103
                Top = 15
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  #49324#50857#51088#44032' '#51076#51032#47196' '#54632
                  #51088#46041' '#52376#47532'(24'#49884#44036#47588#51109')'
                  #47700#51064#54252#49828' '#47560#44048' '#49884' '#51088#46041#47560#44048)
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 24
                Text = #49324#50857#51088#44032' '#51076#51032#47196' '#54632
                Width = 254
              end
              object Option481CheckBox: TcxCheckBox
                Left = 435
                Top = 301
                Caption = ' '#52852#46300#48260#53948' '#53364#47533' '#49884' '#44036#54200#44208#51228'/'#49888#50857#52852#46300#47484' '#49440#53469#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 25
              end
              object Option490CheckBox: TcxCheckBox
                Left = 436
                Top = 327
                Caption = ' '#44228#49328#50756#47308' '#54980' '#51452#47928#50756#47308' '#54868#47732#51012' '#54364#49884#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 26
              end
              object Option493CheckBox: TcxCheckBox
                Left = 436
                Top = 371
                Caption = ' '#50508#47548#53665' '#49324#50857' '#49884' '#54869#51064#52285#51012' '#46916#50881#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 27
              end
              object Option325ComboBox: TcxComboBox
                Left = 569
                Top = 401
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
                TabOrder = 28
                Text = '01'
                Width = 56
              end
              object Option387ComboBox: TcxComboBox
                Left = 569
                Top = 432
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
                TabOrder = 29
                Text = '01'
                Width = 56
              end
              object Option388ComboBox: TcxComboBox
                Left = 569
                Top = 463
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
                TabOrder = 30
                Text = '01'
                Width = 56
              end
            end
            object cxTabSheet27: TcxTabSheet
              Caption = #50741#49496'2'
              ImageIndex = 1
              object Label174: TLabel
                Left = 17
                Top = 21
                Width = 109
                Height = 17
                Caption = #53412#50724#49828#53356' '#54056#49828#50892#46300
              end
              object Label15: TLabel
                Left = 18
                Top = 52
                Width = 102
                Height = 17
                Caption = #50508#47548#53665#49688#49888'(,'#44396#48516')'
              end
              object Label17: TLabel
                Left = 19
                Top = 83
                Width = 127
                Height = 17
                Caption = #44228#49328' '#50756#47308#51204' '#51452#47928#47700#45684
              end
              object Label198: TLabel
                Left = 109
                Top = 116
                Width = 26
                Height = 17
                Caption = #49828#53416
              end
              object cxGroupBox25: TcxGroupBox
                Left = 17
                Top = 164
                Caption = ' '#45796#44397#50612' '
                TabOrder = 0
                Height = 240
                Width = 220
                object LanguageCheckListBox: TcxCheckListBox
                  Left = 24
                  Top = 83
                  Width = 121
                  Height = 149
                  Items = <
                    item
                      Text = #48120#44397#50612
                    end
                    item
                      Text = #51473#44397#50612
                    end
                    item
                      Text = #51068#48376#50612
                    end
                    item
                      Text = #48176#53944#45224#50612
                    end
                    item
                      Text = #53468#44397#50612
                    end
                    item
                      Text = #51064#46020
                    end
                    item
                      Text = #54532#46993#49828#50612
                    end
                    item
                      Text = #46021#51068#50612
                    end>
                  TabOrder = 0
                  OnClick = EditPropertiesChange
                end
                object Option457CheckBox: TcxCheckBox
                  Left = 21
                  Top = 24
                  Caption = ' '#45796#44397#50612' '#44592#45733#51012' '#49324#50857#54633#45768#45796
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 1
                end
                object Option485CheckBox: TcxCheckBox
                  Left = 21
                  Top = 51
                  Caption = ' '#44397#44592#47484' '#53356#44172' '#54364#49884#54633#45768#45796
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 2
                end
              end
              object KioskPwdEdit: TcxTextEdit
                Left = 152
                Top = 17
                ParentFont = False
                Properties.MaxLength = 10
                Properties.PasswordChar = '*'
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 1
                Width = 61
              end
              object KakaoTelNoEdit: TcxTextEdit
                Left = 152
                Top = 48
                ParentFont = False
                Properties.ImeMode = imSAlpha
                Properties.MaxLength = 50
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 2
                Width = 259
              end
              object KioskMustMenuCodeEdit: TcxButtonEdit
                Left = 152
                Top = 79
                ParentFont = False
                Properties.Buttons = <
                  item
                    Default = True
                    Kind = bkEllipsis
                  end>
                Properties.ReadOnly = True
                Properties.OnButtonClick = TableDefaultMenuEditPropertiesButtonClick
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 3
                Width = 105
              end
              object Option458ComboBox: TcxComboBox
                Left = 152
                Top = 111
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  #49324#50857#50504#54632
                  'Blue'
                  'Black'
                  'Red'
                  'Green')
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 4
                Text = #49324#50857#50504#54632
                Width = 105
              end
            end
            object KioskStanby: TcxTabSheet
              Caption = #51452#47928#45824#44592
              ImageIndex = 2
              OnShow = KioskStanbyShow
              object Label169: TLabel
                Left = 29
                Top = 26
                Width = 88
                Height = 17
                Caption = #51452#47928' '#49884#51089' '#45824#44592
              end
              object Label170: TLabel
                Left = 47
                Top = 92
                Width = 70
                Height = 17
                Caption = #53580#51060#48660' '#49440#53469
              end
              object Label209: TLabel
                Left = 494
                Top = 27
                Width = 70
                Height = 17
                Caption = #47673#44256' '#44040#44172#50836
              end
              object Label210: TLabel
                Left = 494
                Top = 58
                Width = 83
                Height = 17
                Caption = #54252#51109#54644' '#44040#44172#50836
              end
              object Label200: TLabel
                Left = 30
                Top = 60
                Width = 96
                Height = 17
                Caption = #45824#44592#51060#48120#51648' '#53364#47533
              end
              object Option424ComboBox: TcxComboBox
                Left = 132
                Top = 22
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  #49324#50857#50504#54632
                  '"'#51452#47928#54616#44592'" '#49324#50857
                  '"'#47673#44256#44040#44172#50836'", "'#54252#51109#54644' '#44040#44172#50836'"')
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 0
                Text = '"'#47673#44256#44040#44172#50836'", "'#54252#51109#54644' '#44040#44172#50836'"'
                Width = 249
              end
              object Option426ComboBox: TcxComboBox
                Left = 132
                Top = 88
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  #49440#53469#51012' '#49324#50857#54616#51648' '#50506#49845#45768#45796
                  #51452#47928' '#50756#47308' '#49884' '#49440#53469#54633#45768#45796'.'
                  #51452#47928' '#49884#51089' '#49884' '#49440#53469#54633#45768#45796'.('#45824#44592#54868#47732#49324#50857#49884')'
                  #51452#47928' '#50756#47308' '#49884' '#49440#53469'('#53580#51060#48660#48264#54840#51077#47141')'
                  #51452#47928' '#49884#51089' '#49884' '#49440#53469'.('#45824#44592#54868#47732#49324#50857#49884')('#53580#51060#48324#48264#54840' '#51077#47141')'
                  #45824#44592#54868#47732#50640#49436' '#53580#51060#48660#51012' '#49440#53469#54633#45768#45796'.')
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 1
                Text = #49440#53469#51012' '#49324#50857#54616#51648' '#50506#49845#45768#45796
                Width = 309
              end
              object Grid: TcxGrid
                Left = 52
                Top = 157
                Width = 385
                Height = 210
                TabOrder = 2
                LookAndFeel.Kind = lfOffice11
                LookAndFeel.NativeStyle = False
                object GridTableView: TcxGridTableView
                  Tag = 99
                  Navigator.Buttons.CustomButtons = <>
                  ScrollbarAnnotations.CustomAnnotations = <>
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  OptionsSelection.CellSelect = False
                  OptionsView.GroupByBox = False
                  object GridTableViewColumn1: TcxGridColumn
                    Caption = #49692#48264
                    DataBinding.ValueType = 'Integer'
                    DataBinding.FieldName = 'SEQ'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.Alignment.Horz = taCenter
                    Properties.DisplayFormat = '#0'
                    HeaderAlignmentHorz = taCenter
                    Width = 67
                  end
                  object GridTableViewColumn2: TcxGridColumn
                    Caption = #54868#51068#47749
                    DataBinding.FieldName = 'NM_CODE1'
                    HeaderAlignmentHorz = taCenter
                    Width = 276
                  end
                end
                object GridLevel: TcxGridLevel
                  GridView = GridTableView
                end
              end
              object AddButton: TAdvGlowButton
                Left = 266
                Top = 379
                Width = 83
                Height = 31
                Caption = #52628#44032
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
                  0D00000006624B474400FF00FF00FFA0BDA793000001F649444154388DCD9431
                  6B93411CC67FFFBBD7D836B53A342643DFA4346DA424E8E41004290E12C44227
                  C12FE02770092EEF64967E02677741078B83E0145A5AA1428B98465B63693485
                  4A69D2B4C97BE790B65148ACC4223E70DC03070FBF7B8EFFC1FF2EC9E4F25ECB
                  A907636EE8B097908FA54A006B9E00380073D9B4373DBB3073F54AEC5A2F81A5
                  ADEDE5170FD35E2697F714309AC9E53DDF37915EC2007CDF448E6E3AAA80F5B9
                  6CDAD35A957B0DD45A95E7B2690F58FFF78499712178EE0C096317857B49C5E4
                  B09C0D214040C3CD98706742B810F84BC29F3532244C865AA4D56A9D7265875A
                  ADFE0BA1734C383DBB300384BB85ED1EC09B0DCBDB4F3B2CAD1469FA16472B9A
                  4D0322C3C6CAA21283731AA1B1F0EEAB6571CBB2F9ED3BF3CB05E26E8464C245
                  0BF81656D74ABAB0517E8E55AF4FEDF0D97BC3FCA6C537B0B45224EE4648255C
                  04B81C040192E32EF16818C4DE38E9D018063B056ED75A7B75BF4EC3B724136E
                  C74A52135141387F42A8147BDDFA03D8ADEE13500A2D101A68AD4B7D6DAF051C
                  51F6D40E8F3514ECA7610CBE85CA11B5566D8F858635F2C7B31CECEFC3D19AD5
                  B552C7F395E2172B7020995C7E0A98525A258606FA7EFB1F1E1C3647EACDC6AD
                  B191B0A412D1F62B174A7CF85CB618C9769FA72EBAFD78FEAE72EC53605023D6
                  C70A963DD3D4F75F3DBAFEF20726BEF963A36A535F0000000049454E44AE4260
                  82}
                RepeatPause = 10
                Rounded = False
                TabOrder = 3
                OnClick = AddButtonClick
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
              object DeleteButton: TAdvGlowButton
                Left = 354
                Top = 379
                Width = 83
                Height = 31
                Caption = #49325#51228
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
                TabOrder = 4
                OnClick = DeleteButtonClick
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
              object KioskBegin1Edit: TcxTextEdit
                Left = 585
                Top = 24
                ParentFont = False
                Properties.ImeMode = imSHanguel
                Properties.MaxLength = 30
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 5
                Width = 170
              end
              object KioskBegin2Edit: TcxTextEdit
                Left = 585
                Top = 55
                ParentFont = False
                Properties.ImeMode = imSHanguel
                Properties.MaxLength = 30
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 6
                Width = 170
              end
              object KioskTableImageButton: TAdvGlowButton
                Left = 269
                Top = 430
                Width = 160
                Height = 31
                Caption = #53580#51060#48660#49440#53469' '#51060#48120#51648
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
                  0D00000006624B474400FF00FF00FFA0BDA7930000016449444154388DCD94BD
                  4E02411446CFEC8F1014259A20B1A130341636165696BE83A5A56F2495B5EF60
                  6362A926262616C604C10011352C985D777776198B1559703102C6F83533993B
                  39F7BB377706FEBBC4FEE155F960B7B8F71BB0F249F5D89833B5F4F67A6EC9F2
                  D44CB05C4A7074FA9036FA07963B9BBB5C2A5A8DEFAF25CB9170D9882ADA5A13
                  64CC414C9B06D8B2158E8CC02D7BB8555301F3F391AB8C19EDE31A5B72F89158
                  175F631913768A0981710E6508F716D43A10F6C627FB11F02D804A07FC10DC00
                  AA5D903168DB85B3AAE2F625193854B2E542D306620EBC00AA1D282EC2A3ADB8
                  7902A5A0D256F88160230F9A48003E398A6727B92F3284BB3634BB11ACAFFAAB
                  42F6049B858492C7C1E2CA6705E648935AB6E2A23EC832D1D8E80256B302531F
                  3E8FBFB289E75013505810A4F4E4F8670F4BCB93814B2B02C7876064AC0C5FF6
                  DCEB86E74DEA540881A6E9BA0A82502938AF812F7B337E317FA1771FEE826AD0
                  BD0CA80000000049454E44AE426082}
                RepeatPause = 10
                Rounded = False
                TabOrder = 7
                OnClick = KioskMainImageButtonClick
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
              object KioskMainImageButton: TAdvGlowButton
                Left = 61
                Top = 430
                Width = 188
                Height = 31
                Caption = #47700#51064' '#51060#48120#51648
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
                  0D00000006624B474400FF00FF00FFA0BDA7930000016449444154388DCD94BD
                  4E02411446CFEC8F1014259A20B1A130341636165696BE83A5A56F2495B5EF60
                  6362A926262616C604C10011352C985D777776198B1559703102C6F83533993B
                  39F7BB377706FEBBC4FEE155F960B7B8F71BB0F249F5D89833B5F4F67A6EC9F2
                  D44CB05C4A7074FA9036FA07963B9BBB5C2A5A8DEFAF25CB9170D9882ADA5A13
                  64CC414C9B06D8B2158E8CC02D7BB8555301F3F391AB8C19EDE31A5B72F89158
                  175F631913768A0981710E6508F716D43A10F6C627FB11F02D804A07FC10DC00
                  AA5D903168DB85B3AAE2F625193854B2E542D306620EBC00AA1D282EC2A3ADB8
                  7902A5A0D256F88160230F9A48003E398A6727B92F3284BB3634BB11ACAFFAAB
                  42F6049B858492C7C1E2CA6705E648935AB6E2A23EC832D1D8E80256B302531F
                  3E8FBFB289E75013505810A4F4E4F8670F4BCB93814B2B02C7876064AC0C5FF6
                  DCEB86E74DEA540881A6E9BA0A82502938AF812F7B337E317FA1771FEE826AD0
                  BD0CA80000000049454E44AE426082}
                RepeatPause = 10
                Rounded = False
                TabOrder = 8
                OnClick = KioskMainImageButtonClick
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
              object Option477ComboBox: TcxComboBox
                Left = 132
                Top = 55
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  #49324#50857#50504#54632
                  #51452#47928#54616#44592
                  #54252#51109#54644' '#44040#44172#50836)
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 9
                Text = #49324#50857#50504#54632
                Width = 249
              end
              object Option488CheckBox: TcxCheckBox
                Left = 127
                Top = 122
                Caption = ' '#53580#51060#48660' '#51221#47532' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 10
              end
              object BarrierFreeWheelChairImageutton: TAdvGlowButton
                Left = 61
                Top = 467
                Width = 188
                Height = 31
                Caption = #51217#44540#49457'('#51200#51088#49464')'
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
                  0D00000006624B474400FF00FF00FFA0BDA7930000016449444154388DCD94BD
                  4E02411446CFEC8F1014259A20B1A130341636165696BE83A5A56F2495B5EF60
                  6362A926262616C604C10011352C985D777776198B1559703102C6F83533993B
                  39F7BB377706FEBBC4FEE155F960B7B8F71BB0F249F5D89833B5F4F67A6EC9F2
                  D44CB05C4A7074FA9036FA07963B9BBB5C2A5A8DEFAF25CB9170D9882ADA5A13
                  64CC414C9B06D8B2158E8CC02D7BB8555301F3F391AB8C19EDE31A5B72F89158
                  175F631913768A0981710E6508F716D43A10F6C627FB11F02D804A07FC10DC00
                  AA5D903168DB85B3AAE2F625193854B2E542D306620EBC00AA1D282EC2A3ADB8
                  7902A5A0D256F88160230F9A48003E398A6727B92F3284BB3634BB11ACAFFAAB
                  42F6049B858492C7C1E2CA6705E648935AB6E2A23EC832D1D8E80256B302531F
                  3E8FBFB289E75013505810A4F4E4F8670F4BCB93814B2B02C7876064AC0C5FF6
                  DCEB86E74DEA540881A6E9BA0A82502938AF812F7B337E317FA1771FEE826AD0
                  BD0CA80000000049454E44AE426082}
                RepeatPause = 10
                Rounded = False
                TabOrder = 11
                OnClick = KioskMainImageButtonClick
                Appearance.BorderColor = 14727579
                Appearance.BorderColorHot = 10079963
                Appearance.BorderColorCheckedHot = 11565130
                Appearance.BorderColorDown = 4548219
                Appearance.BorderColorChecked = 4548219
                Appearance.BorderColorDisabled = 13948116
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
                Appearance.TextColorChecked = 3750459
                Appearance.TextColorDown = 2303013
                Appearance.TextColorHot = 2303013
                Appearance.TextColorDisabled = 13948116
              end
              object BarrierFreeLowVisionImageutton: TAdvGlowButton
                Left = 61
                Top = 504
                Width = 188
                Height = 31
                Caption = #51217#44540#49457'('#51200#49884#47141')'
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
                  0D00000006624B474400FF00FF00FFA0BDA7930000016449444154388DCD94BD
                  4E02411446CFEC8F1014259A20B1A130341636165696BE83A5A56F2495B5EF60
                  6362A926262616C604C10011352C985D777776198B1559703102C6F83533993B
                  39F7BB377706FEBBC4FEE155F960B7B8F71BB0F249F5D89833B5F4F67A6EC9F2
                  D44CB05C4A7074FA9036FA07963B9BBB5C2A5A8DEFAF25CB9170D9882ADA5A13
                  64CC414C9B06D8B2158E8CC02D7BB8555301F3F391AB8C19EDE31A5B72F89158
                  175F631913768A0981710E6508F716D43A10F6C627FB11F02D804A07FC10DC00
                  AA5D903168DB85B3AAE2F625193854B2E542D306620EBC00AA1D282EC2A3ADB8
                  7902A5A0D256F88160230F9A48003E398A6727B92F3284BB3634BB11ACAFFAAB
                  42F6049B858492C7C1E2CA6705E648935AB6E2A23EC832D1D8E80256B302531F
                  3E8FBFB289E75013505810A4F4E4F8670F4BCB93814B2B02C7876064AC0C5FF6
                  DCEB86E74DEA540881A6E9BA0A82502938AF812F7B337E317FA1771FEE826AD0
                  BD0CA80000000049454E44AE426082}
                RepeatPause = 10
                Rounded = False
                TabOrder = 12
                OnClick = KioskMainImageButtonClick
                Appearance.BorderColor = 14727579
                Appearance.BorderColorHot = 10079963
                Appearance.BorderColorCheckedHot = 11565130
                Appearance.BorderColorDown = 4548219
                Appearance.BorderColorChecked = 4548219
                Appearance.BorderColorDisabled = 13948116
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
                Appearance.TextColorChecked = 3750459
                Appearance.TextColorDown = 2303013
                Appearance.TextColorHot = 2303013
                Appearance.TextColorDisabled = 13948116
              end
            end
          end
        end
        object KitchenPrintTabSheet: TcxTabSheet
          Caption = #51452#48169#51452#47928#49436
          ImageIndex = 15
          object AdvScrollBox15: TAdvScrollBox
            Left = 0
            Top = 0
            Width = 1279
            Height = 872
            Align = alClient
            BorderStyle = bsNone
            DoubleBuffered = True
            Ctl3D = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            TabOrder = 0
            object Label44: TLabel
              Left = 18
              Top = 488
              Width = 57
              Height = 17
              Caption = #51452#47928#49884#44036' '
            end
            object Label46: TLabel
              Left = 225
              Top = 488
              Width = 52
              Height = 17
              Caption = #51452#47928#48264#54840
            end
            object Label47: TLabel
              Left = 417
              Top = 125
              Width = 158
              Height = 17
              Caption = #47588#52636#52712#49548' '#49884' '#51452#48169#51452#47928#49436#47484' '
            end
            object Label49: TLabel
              Left = 419
              Top = 340
              Width = 392
              Height = 17
              Caption = #49345#53468#52404#53356'('#51221#49345') '#54980'             '#52488' '#51060#45236#50640' '#45716' '#45796#49884' '#52404#53356#54616#51648' '#50506#49845#45768#45796'.'
            end
            object Label176: TLabel
              Left = 416
              Top = 174
              Width = 75
              Height = 17
              Caption = #51452#47928#52712#49548' '#49884' '
            end
            object Panel20: TPanel
              Left = 18
              Top = 8
              Width = 264
              Height = 475
              BevelOuter = bvNone
              BorderStyle = bsSingle
              Color = clWhite
              Ctl3D = False
              ParentBackground = False
              ParentCtl3D = False
              TabOrder = 0
              object Option096Panel: TPanel
                Left = 0
                Top = 0
                Width = 262
                Height = 26
                Align = alTop
                BevelOuter = bvNone
                Caption = #51452#48169#51452#47928#49436
                Color = clWhite
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = #44404#47548#52404
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                object KitchenTieleEdit: TcxTextEdit
                  Left = 30
                  Top = 1
                  ParentFont = False
                  Properties.MaxLength = 42
                  Properties.OnChange = EditPropertiesChange
                  Properties.OnValidate = EditPropertiesValidate
                  Style.StyleController = EditStyleController
                  TabOrder = 0
                  Width = 196
                end
              end
              object Option097Panel: TPanel
                Left = 0
                Top = 26
                Width = 262
                Height = 18
                Align = alTop
                BevelOuter = bvNone
                Caption = '[ '#52628#44032#51452#47928' ]'
                Color = clWhite
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #44404#47548#52404
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object Option099Panel: TPanel
                Left = 0
                Top = 74
                Width = 262
                Height = 26
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = ' '#53580' '#51060' '#48660' : 13'
                Color = clWhite
                TabOrder = 2
              end
              object Option100Panel: TPanel
                Left = 0
                Top = 100
                Width = 262
                Height = 26
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = ' '#44256' '#44061' '#49688' : 4'
                Color = clWhite
                TabOrder = 3
              end
              object Option101Panel: TPanel
                Left = 0
                Top = 155
                Width = 262
                Height = 23
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = '             '#47700'   '#45684'                     '#49688#47049'         '
                Color = clWhite
                TabOrder = 4
              end
              object Option103Panel: TPanel
                Left = 0
                Top = 207
                Width = 262
                Height = 26
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = #44608#52824#52236#44060'                                   2 '
                Color = clWhite
                TabOrder = 5
              end
              object Option104Panel: TPanel
                Left = 0
                Top = 233
                Width = 262
                Height = 26
                Align = alTop
                BevelOuter = bvNone
                Caption = '  '#44277'            '#48177'  '
                Color = clWhite
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = [fsStrikeOut]
                ParentFont = False
                TabOrder = 6
              end
              object Panel34: TPanel
                Left = 0
                Top = 259
                Width = 262
                Height = 14
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = #46108#51109#52236#44060'                                   1'
                Color = clWhite
                TabOrder = 7
              end
              object Option288Panel: TPanel
                Left = 0
                Top = 404
                Width = 262
                Height = 22
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = #48176#45804#51452#49548' : '#48317#49328#50500#54028#53944' 205'#46041' 103'#54840
                Color = clWhite
                TabOrder = 8
              end
              object Panel36: TPanel
                Left = 0
                Top = 308
                Width = 262
                Height = 20
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = '2012-06-13 17:47:20           '#51452#47928#48264#54840' : 12'
                Color = clWhite
                TabOrder = 9
              end
              object Option312Panel: TPanel
                Left = 0
                Top = 448
                Width = 262
                Height = 22
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = #54840#52636#48264#54840' : 10'
                Color = clWhite
                TabOrder = 10
              end
              object Panel38: TPanel
                Left = 0
                Top = 273
                Width = 262
                Height = 9
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = '============================='
                Color = clWhite
                TabOrder = 11
              end
              object Panel39: TPanel
                Left = 0
                Top = 152
                Width = 262
                Height = 3
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = ' --------------------------------------------------'
                Color = clWhite
                TabOrder = 12
              end
              object Panel40: TPanel
                Left = 0
                Top = 181
                Width = 262
                Height = 8
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Color = clWhite
                TabOrder = 13
              end
              object Panel42: TPanel
                Left = 0
                Top = 178
                Width = 262
                Height = 3
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = ' --------------------------------------------------'
                Color = clWhite
                TabOrder = 14
              end
              object Option098Panel: TPanel
                Left = 0
                Top = 44
                Width = 262
                Height = 30
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = ' '#51452' '#48169' '#47749' : '#54620#49885#51452#48169
                Color = clWhite
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = [fsStrikeOut]
                ParentFont = False
                TabOrder = 15
              end
              object Option102Panel: TPanel
                Left = 0
                Top = 189
                Width = 262
                Height = 18
                Align = alTop
                BevelOuter = bvNone
                Caption = '( '#52628#44032#51452#47928' )'
                Color = clWhite
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #44404#47548#52404
                Font.Style = []
                ParentFont = False
                TabOrder = 16
              end
              object Option204Panel: TPanel
                Left = 0
                Top = 379
                Width = 262
                Height = 25
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = #48176#45804#51648#50669' : '#50500#54028#53944
                Color = clWhite
                TabOrder = 17
              end
              object Option203Panel: TPanel
                Left = 0
                Top = 354
                Width = 262
                Height = 25
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = #48176#45804#53076#49828' : A'#53076#49828
                Color = clWhite
                TabOrder = 18
              end
              object Option107Panel: TPanel
                Left = 0
                Top = 328
                Width = 262
                Height = 26
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = #51452#47928#45812#45817' : '#54861#44600#46041
                Color = clWhite
                TabOrder = 19
              end
              object Option343Panel: TPanel
                Left = 0
                Top = 126
                Width = 262
                Height = 26
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = ' '#47700'    '#47784' : VIP'#49552#45784
                Color = clWhite
                TabOrder = 20
              end
              object Panel3: TPanel
                Left = 0
                Top = 282
                Width = 262
                Height = 26
                Align = alTop
                Alignment = taRightJustify
                BevelOuter = bvNone
                Caption = #51452#47928#44552#50529'                1,000 '
                Color = clWhite
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
                TabOrder = 21
              end
              object Option448Panel: TPanel
                Left = 0
                Top = 426
                Width = 262
                Height = 22
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = #50672' '#46973' '#52376'  :  010-1111-2222'
                Color = clWhite
                TabOrder = 22
              end
            end
            object Option096ComboBox: TcxComboBox
              Left = 286
              Top = 7
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#54869#45824
                #44032#47196#49464#47196#54868#45824
                '3'#48176#52636#47141)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 1
              Text = #48372#53685
              Width = 80
            end
            object Option097ComboBox: TcxComboBox
              Left = 286
              Top = 33
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#49464#47196#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 2
              Text = #48372#53685
              Width = 80
            end
            object Option098ComboBox: TcxComboBox
              Left = 286
              Top = 59
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#49464#47196#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 3
              Text = #52636#47141#50504#54632
              Width = 80
            end
            object Option099ComboBox: TcxComboBox
              Left = 286
              Top = 85
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#49464#47196#54869#45824
                '3'#48176#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 4
              Text = #48372#53685
              Width = 80
            end
            object Option100ComboBox: TcxComboBox
              Left = 286
              Top = 111
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#49464#47196#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 5
              Text = #48372#53685
              Width = 80
            end
            object Option101ComboBox: TcxComboBox
              Left = 286
              Top = 162
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#49464#47196#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 6
              Text = #48372#53685
              Width = 80
            end
            object Option102ComboBox: TcxComboBox
              Left = 286
              Top = 189
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#49464#47196#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 7
              Text = #48372#53685
              Width = 80
            end
            object Option103ComboBox: TcxComboBox
              Left = 286
              Top = 215
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#49464#47196#54869#45824
                '3'#48176#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 8
              Text = #48372#53685
              Width = 80
            end
            object Option104ComboBox: TcxComboBox
              Left = 286
              Top = 242
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #52636#47141#54632)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 9
              Text = #52636#47141#50504#54632
              Width = 80
            end
            object Option107ComboBox: TcxComboBox
              Left = 286
              Top = 333
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#49464#47196#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 10
              Text = #52636#47141#50504#54632
              Width = 80
            end
            object Option105ComboBox: TcxComboBox
              Left = 84
              Top = 485
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#49464#47196#54869#45824)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 11
              Text = #52636#47141#50504#54632
              Width = 80
            end
            object Option203ComboBox: TcxComboBox
              Left = 286
              Top = 358
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#49464#47196#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 12
              Text = #52636#47141#50504#54632
              Width = 80
            end
            object Option204ComboBox: TcxComboBox
              Left = 286
              Top = 383
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#49464#47196#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 13
              Text = #52636#47141#50504#54632
              Width = 80
            end
            object Option288ComboBox: TcxComboBox
              Left = 286
              Top = 408
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 14
              Text = #52636#47141#50504#54632
              Width = 80
            end
            object Option312ComboBox: TcxComboBox
              Left = 286
              Top = 458
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#49464#47196#54869#45824
                '3'#48176#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 15
              Text = #52636#47141#50504#54632
              Width = 80
            end
            object Option106ComboBox: TcxComboBox
              Left = 286
              Top = 484
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#49464#47196#54869#45824)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 16
              Text = #52636#47141#50504#54632
              Width = 80
            end
            object Option010CheckBox: TcxCheckBox
              Left = 412
              Top = 8
              Caption = ' '#51452#48169' '#51452#47928#49436#47484' '#52636#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 17
            end
            object Option012CheckBox: TcxCheckBox
              Left = 412
              Top = 29
              Caption = ' '#51088#47532' '#51060#46041','#54633#49437','#47700#45684#51060#46041' '#49884' '#51452#48169#51452#47928#49436#47484' '#52636#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 18
            end
            object Option017CheckBox: TcxCheckBox
              Left = 412
              Top = 52
              Caption = ' '#51452#48169#51452#47928#49436' '#52636#47141#49884' '#54532#47536#53552' '#49345#53468' '#52404#53356' '#54980' '#52636#47141' '#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 19
            end
            object Option026CheckBox: TcxCheckBox
              Left = 412
              Top = 74
              Caption = ' '#54532#47536#53552#51032' '#49444#51221' '#52789#51004#47196#47564' '#51452#48169#51452#47928#49436#47484' '#52636#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 20
            end
            object Option077CheckBox: TcxCheckBox
              Left = 412
              Top = 97
              Caption = ' '#51088#47532' '#51060#46041', '#54633#49437#49884' '#47700#45684#45236#50669#51012' '#52636#47141#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 21
            end
            object Option072ComboBox: TcxComboBox
              Left = 581
              Top = 122
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#54616#51648' '#50506#49845#45768#45796
                #52636#47141#54633#45768#45796'('#54252#49828#50640#49436' '#48320#44221#44032#45733')'
                #52636#47141#54633#45768#45796'('#54252#49828#50640#49436' '#48320#44221#47803#54632')')
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 22
              Text = #52636#47141#54616#51648' '#50506#49845#45768#45796
              Width = 236
            end
            object Option154CheckBox: TcxCheckBox
              Left = 412
              Top = 146
              Caption = ' '#51452#47928#52712#49548' '#45236#50669#51012' '#52636#47141#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 23
            end
            object Option149CheckBox: TcxCheckBox
              Left = 412
              Top = 192
              Caption = ' '#52712#49548' '#49884' '#50669#49345#51004#47196' '#52636#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 24
            end
            object Option205CheckBox: TcxCheckBox
              Left = 412
              Top = 216
              Caption = ' '#51452#48169#51452#47928#49436' '#53440#51060#53952#50640' '#51452#48169#47749#51012' '#52636#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 25
            end
            object Option142RadioGroup: TcxRadioGroup
              Left = 669
              Top = 365
              Caption = ' '#49903#44032#47700#45684
              ParentFont = False
              Properties.Items = <
                item
                  Caption = ' '#44552#50529#51012' '#52636#47141#54633#45768#45796'.'
                end
                item
                  Caption = ' '#49688#47049#51012' '#52636#47141#54633#45768#45796'.'
                end
                item
                  Caption = ' '#44552#50529'+('#49688#47049')'#51012' '#52636#47141#54633#45768#45796'.'
                end>
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 26
              Transparent = True
              Height = 99
              Width = 199
            end
            object cxGroupBox7: TcxGroupBox
              Left = 413
              Top = 365
              Caption = ' '#52636#47141#48169#49885' '
              ParentFont = False
              Style.StyleController = EditStyleController
              TabOrder = 27
              Height = 99
              Width = 250
              object Option079CheckBox: TcxCheckBox
                Left = 11
                Top = 70
                Caption = ' '#47700#45684#48324' '#44536#47353#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 0
              end
              object Option009RadioGroup: TcxRadioGroup
                Left = 10
                Top = 20
                Alignment = alCenterCenter
                ParentFont = False
                Properties.Items = <
                  item
                    Caption = ' '#51452#47928#49436#48324#47196' '#51452#47928#49436' '#54620#51109#50640' '#52636#47141
                  end
                  item
                    Caption = ' '#47700#45684#48324#47196' '#51452#47928#49436' '#52636#47141
                  end>
                Properties.OnChange = EditPropertiesChange
                ItemIndex = 0
                Style.StyleController = EditStyleController
                TabOrder = 1
                Transparent = True
                Height = 49
                Width = 229
              end
            end
            object PrinterCheckTimerEdit: TcxSpinEdit
              Left = 531
              Top = 336
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 28
              Width = 54
            end
            object Option256CheckBox: TcxCheckBox
              Left = 413
              Top = 241
              Caption = ' '#54252#49828#50640#49436' '#52636#47141#50668#48512#47484' '#48320#44221#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 29
            end
            object Option343ComboBox: TcxComboBox
              Left = 286
              Top = 136
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 30
              Text = #48372#53685
              Width = 80
            end
            object Option374CheckBox: TcxCheckBox
              Left = 419
              Top = 464
              Caption = ' '#47700#45684#48324' '#45233#51109#51004#47196' '#52636#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 31
            end
            object Option408CheckBox: TcxCheckBox
              Left = 413
              Top = 264
              Caption = ' '#44208#51228#48320#44221' '#49884' '#51452#48169#51452#47928#49436#47484' '#52636#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 32
            end
            object Option447ComboBox: TcxComboBox
              Left = 286
              Top = 289
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#49464#47196#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 33
              Text = #52636#47141#50504#54632
              Width = 80
            end
            object Option448ComboBox: TcxComboBox
              Left = 286
              Top = 433
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #52636#47141#50504#54632
                #48372#53685
                #49464#47196#54869#45824
                #44032#47196#49464#47196#54869#45824)
              Properties.OnChange = Option108ComboBoxPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 34
              Text = #52636#47141#50504#54632
              Width = 80
            end
            object Option030ComboBox: TcxComboBox
              Left = 497
              Top = 169
              ParentFont = False
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #47700#45684#47749' '#50526#50640' ('#52712#49548') '#52636#47141
                #52636#47141#54616#51648' '#50506#49845#45768#45796'.'
                #47700#45684#47749' '#50948#50640' ('#52712#49548')'#47484' '#52636#47141#54633#45768#45796'.')
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 35
              Width = 236
            end
            object Option308CheckBox: TcxCheckBox
              Left = 419
              Top = 489
              Caption = ' '#51452#48169#51204#50857' '#47700#45684#47749#51012' '#52636#47141#54633#45768#45796'. '
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 36
            end
            object Option354CheckBox: TcxCheckBox
              Left = 414
              Top = 289
              Caption = ' '#48512#47700#45684#47484' '#52636#47141#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 37
            end
            object Option241CheckBox: TcxCheckBox
              Left = 414
              Top = 312
              Caption = ' '#48512#47700#45684#47484' '#49444#51221' '#51452#48169#51004#47196' '#52636#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 38
            end
            object Option482ComboBox: TcxImageComboBox
              Left = 369
              Top = 85
              Properties.DefaultImageIndex = 0
              Properties.Images = ImageList
              Properties.Items = <
                item
                  ImageIndex = 0
                  Value = '0'
                end
                item
                  ImageIndex = 1
                  Value = '1'
                end
                item
                  ImageIndex = 2
                  Value = '2'
                end>
              Properties.OnChange = EditPropertiesChange
              TabOrder = 39
              Width = 37
            end
          end
        end
      end
    end
    object KDSPage: TcxTabSheet
      Caption = 'KDS '#46356#51088#51064
      ImageIndex = 3
      object AdvScrollBox21: TAdvScrollBox
        Left = 0
        Top = 0
        Width = 1279
        Height = 926
        Align = alClient
        BorderStyle = bsNone
        DoubleBuffered = True
        Ctl3D = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        TabOrder = 0
        DesignSize = (
          1279
          926)
        object TemplateLabel: TLabel
          Left = 12
          Top = 14
          Width = 26
          Height = 17
          Caption = #51452#48169
          Transparent = True
        end
        object Label122: TLabel
          Left = 135
          Top = 89
          Width = 8
          Height = 17
          Caption = 'X'
          Transparent = True
        end
        object Label123: TLabel
          Left = 43
          Top = 89
          Width = 26
          Height = 17
          Caption = #44079#49688
          Transparent = True
        end
        object Label222: TLabel
          Left = 416
          Top = 134
          Width = 57
          Height = 17
          Caption = #44592#48376' '#49345#53468
          Transparent = True
        end
        object DesignGroupBox: TcxGroupBox
          Left = 12
          Top = 157
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = ' '#46356#51088#51064' '
          Enabled = False
          ParentFont = False
          Style.StyleController = EditStyleController
          TabOrder = 0
          Height = 741
          Width = 1298
          object Msg2Label: TLabel
            Left = 229
            Top = 396
            Width = 269
            Height = 17
            Caption = ' [Shiftl + '#48169#54693#53412'] '#47196' '#53356#44592#51312#51221#54624' '#49688' '#51080#49845#45768#45796
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Msg1Label: TLabel
            Left = 219
            Top = 373
            Width = 445
            Height = 17
            Caption = #8251' [Ctrl + '#48169#54693#53412'] '#46608#45716' [Ctrl+Shift + '#48169#54693#53412']'#47196' '#50948#52824#47484' '#51060#46041#54624' '#49688' '#51080#49845#45768#45796
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object DesignLocationTopLabel: TLabel
            Left = 104
            Top = 112
            Width = 26
            Height = 17
            Caption = #50948#51901
            Transparent = True
          end
          object DesignLocationLeftLabel: TLabel
            Left = 104
            Top = 142
            Width = 26
            Height = 17
            Caption = #50812#51901
            Transparent = True
          end
          object DesignLocationLabel: TLabel
            Left = 33
            Top = 112
            Width = 26
            Height = 17
            Caption = #50948#52824
            Transparent = True
          end
          object DesignAlignmentLabel: TLabel
            Left = 26
            Top = 207
            Width = 26
            Height = 17
            Caption = #51221#47148
            Transparent = True
          end
          object DesignTextCommentLabel: TLabel
            Left = 70
            Top = 171
            Width = 4
            Height = 15
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object DesignFontLabel: TLabel
            Left = 26
            Top = 175
            Width = 26
            Height = 17
            Caption = #44544#44852
            Transparent = True
          end
          object Label117: TLabel
            Left = 26
            Top = 250
            Width = 26
            Height = 17
            Caption = #54252#47607
            Transparent = True
          end
          object Label124: TLabel
            Left = 449
            Top = 31
            Width = 57
            Height = 17
            Caption = #49345#45800' '#45458#51060
            Transparent = True
          end
          object Label125: TLabel
            Left = 446
            Top = 63
            Width = 57
            Height = 17
            Caption = #54616#45800' '#45458#51060
            Transparent = True
          end
          object exLabel: TLabel
            Left = 69
            Top = 277
            Width = 104
            Height = 17
            Caption = #50696') '#51452#47928' '#48264#54840': %s'
            Transparent = True
          end
          object Label126: TLabel
            Left = 69
            Top = 300
            Width = 60
            Height = 17
            Caption = #50696') [%s'#48516']'
            Transparent = True
          end
          object KDSDesignPanel: TPanel
            Left = 215
            Top = 110
            Width = 339
            Height = 251
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Color = clWhite
            Ctl3D = False
            ParentBackground = False
            ParentCtl3D = False
            TabOrder = 3
            OnResize = KDSDesignPanelResize
            object DesignTopPanel: TPanel
              Left = 0
              Top = 0
              Width = 337
              Height = 44
              Align = alTop
              BevelOuter = bvNone
              BorderStyle = bsSingle
              Color = clWhite
              Ctl3D = False
              ParentBackground = False
              ParentCtl3D = False
              TabOrder = 0
              OnClick = DesignTopPanelClick
              object cxImage3: TcxImage
                Tag = 53
                Left = 148
                Top = 68
                AutoSize = True
                Style.BorderStyle = ebsNone
                TabOrder = 0
                Visible = False
                Height = 22
                Width = 41
              end
            end
            object DesignBottomPanel: TPanel
              Left = 0
              Top = 203
              Width = 337
              Height = 46
              Align = alBottom
              BevelOuter = bvNone
              BorderStyle = bsSingle
              Color = clWhite
              Ctl3D = False
              ParentBackground = False
              ParentCtl3D = False
              TabOrder = 1
              OnClick = DesignTopPanelClick
              object cxImage1: TcxImage
                Tag = 53
                Left = 148
                Top = 68
                AutoSize = True
                Style.BorderStyle = ebsNone
                TabOrder = 0
                Visible = False
                Height = 22
                Width = 41
              end
              object Design12Label: TcxLabel
                Tag = 12
                Left = 127
                Top = 4
                AutoSize = False
                Caption = #48260' '#53948
                ParentColor = False
                Style.BorderColor = clNone
                Style.BorderStyle = ebsOffice11
                Style.Color = clSkyBlue
                Style.HotTrack = False
                Style.Shadow = False
                Style.TransparentBorder = True
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                Properties.Angle = 1
                Properties.Depth = 1
                Properties.LineOptions.Alignment = cxllaBottom
                Properties.LineOptions.Visible = True
                OnClick = DesignLabelClick
                Height = 36
                Width = 98
                AnchorX = 176
                AnchorY = 22
              end
            end
            object DesignCenterPanel: TPanel
              Left = 0
              Top = 44
              Width = 337
              Height = 159
              Align = alClient
              BevelOuter = bvNone
              BorderStyle = bsSingle
              Color = clWhite
              Ctl3D = False
              ParentBackground = False
              ParentCtl3D = False
              TabOrder = 2
              OnClick = DesignTopPanelClick
              object Design4Label: TcxLabel
                Tag = 4
                Left = 40
                Top = 56
                Caption = #49444#47105#53461
                OnClick = DesignLabelClick
              end
              object Design9Label: TcxLabel
                Tag = 9
                Left = 201
                Top = 57
                Caption = '9'
                OnClick = DesignLabelClick
                OnMouseDown = NodeMouseDown
                OnMouseMove = NodeMouseMove
                OnMouseUp = NodeMouseUp
              end
            end
          end
          object DesignLocationTopEdit: TcxCurrencyEdit
            Left = 144
            Top = 108
            EditValue = 0.000000000000000000
            Enabled = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = '0'
            Properties.ImeMode = imSAlpha
            Properties.Nullable = False
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 0
            Width = 51
          end
          object DesignLocationLeftEdit: TcxCurrencyEdit
            Left = 144
            Top = 139
            EditValue = 0.000000000000000000
            Enabled = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = '0'
            Properties.ImeMode = imSAlpha
            Properties.Nullable = False
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 1
            Width = 51
          end
          object DesignOrderNumberButton: TcxButton
            Tag = 1
            Left = 15
            Top = 25
            Width = 83
            Height = 31
            Caption = #51452#47928#48264#54840
            LookAndFeel.Kind = lfOffice11
            OptionsImage.Layout = blGlyphTop
            OptionsImage.Spacing = 0
            SpeedButtonOptions.GroupIndex = 1
            SpeedButtonOptions.CanBeFocused = False
            SpeedButtonOptions.Down = True
            SpeedButtonOptions.Transparent = True
            TabOrder = 4
            OnClick = DesignOrderNumberButtonClick
          end
          object DesignTableNameButton: TcxButton
            Tag = 2
            Left = 98
            Top = 25
            Width = 83
            Height = 31
            Hint = 'Table :%s'
            Caption = #53580#51060#48660#47749
            LookAndFeel.Kind = lfOffice11
            OptionsImage.Layout = blGlyphTop
            OptionsImage.Spacing = 0
            SpeedButtonOptions.GroupIndex = 1
            SpeedButtonOptions.CanBeFocused = False
            SpeedButtonOptions.Transparent = True
            TabOrder = 5
            OnClick = DesignOrderNumberButtonClick
          end
          object DesignOrderTimeButton: TcxButton
            Tag = 3
            Left = 181
            Top = 25
            Width = 83
            Height = 31
            Hint = 'hh:nn:ss'
            Caption = #51452#47928#49884#44036
            LookAndFeel.Kind = lfOffice11
            OptionsImage.Layout = blGlyphTop
            OptionsImage.Spacing = 0
            SpeedButtonOptions.GroupIndex = 1
            SpeedButtonOptions.CanBeFocused = False
            SpeedButtonOptions.Transparent = True
            TabOrder = 6
            OnClick = DesignOrderNumberButtonClick
          end
          object DesignMenuOrderTimeButton: TcxButton
            Tag = 11
            Left = 264
            Top = 57
            Width = 83
            Height = 31
            Caption = #47700#45684#51452#47928#49884#44036
            LookAndFeel.Kind = lfOffice11
            OptionsImage.Layout = blGlyphTop
            OptionsImage.Spacing = 0
            SpeedButtonOptions.GroupIndex = 1
            SpeedButtonOptions.CanBeFocused = False
            SpeedButtonOptions.Transparent = True
            TabOrder = 7
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            ParentFont = False
            OnClick = DesignOrderNumberButtonClick
          end
          object DesignDeleteButton: TButton
            Left = 25
            Top = 333
            Width = 170
            Height = 27
            Caption = #49440#53469#54620' '#44061#52404' '#49325#51228
            Enabled = False
            TabOrder = 8
            TabStop = False
            OnClick = DesignDeleteButtonClick
          end
          object DesignAlignmentComboBox: TcxComboBox
            Left = 70
            Top = 203
            Enabled = False
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.Items.Strings = (
              #50812#51901
              #50724#47480#51901
              #44032#50868#45936)
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 2
            Text = #50812#51901
            Width = 125
          end
          object DesignMenuMemoButton: TcxButton
            Tag = 5
            Left = 264
            Top = 25
            Width = 83
            Height = 31
            Caption = #54840#52636#48264#54840
            LookAndFeel.Kind = lfOffice11
            OptionsImage.Layout = blGlyphTop
            OptionsImage.Spacing = 0
            SpeedButtonOptions.GroupIndex = 1
            SpeedButtonOptions.CanBeFocused = False
            SpeedButtonOptions.Transparent = True
            TabOrder = 9
            OnClick = DesignOrderNumberButtonClick
          end
          object DesignTableMemoButton: TcxButton
            Tag = 10
            Left = 347
            Top = 25
            Width = 83
            Height = 31
            Caption = #53580#51060#48660#47700#47784
            LookAndFeel.Kind = lfOffice11
            OptionsImage.Layout = blGlyphTop
            OptionsImage.Spacing = 0
            SpeedButtonOptions.GroupIndex = 1
            SpeedButtonOptions.CanBeFocused = False
            SpeedButtonOptions.Transparent = True
            TabOrder = 10
            OnClick = DesignOrderNumberButtonClick
          end
          object DesignCustomerButton: TcxButton
            Tag = 7
            Left = 98
            Top = 57
            Width = 83
            Height = 31
            Caption = #44256' '#44061' '#49688
            LookAndFeel.Kind = lfOffice11
            OptionsImage.Layout = blGlyphTop
            OptionsImage.Spacing = 0
            SpeedButtonOptions.GroupIndex = 1
            SpeedButtonOptions.CanBeFocused = False
            SpeedButtonOptions.Transparent = True
            TabOrder = 11
            OnClick = DesignOrderNumberButtonClick
          end
          object DesignDelaytimeButton: TcxButton
            Tag = 8
            Left = 181
            Top = 57
            Width = 83
            Height = 31
            Caption = #44221#44284#49884#44036
            LookAndFeel.Kind = lfOffice11
            OptionsImage.Layout = blGlyphTop
            OptionsImage.Spacing = 0
            SpeedButtonOptions.GroupIndex = 1
            SpeedButtonOptions.CanBeFocused = False
            SpeedButtonOptions.Transparent = True
            TabOrder = 12
            OnClick = DesignOrderNumberButtonClick
          end
          object DesignFontEdit: TcxButtonEdit
            Left = 70
            Top = 172
            Enabled = False
            ParentFont = False
            Properties.Buttons = <
              item
                Kind = bkEllipsis
              end>
            Properties.ClickKey = 112
            Properties.ImeMode = imSHanguel
            Properties.ReadOnly = True
            Properties.OnButtonClick = DesignFontEditPropertiesButtonClick
            Style.StyleController = EditStyleController
            TabOrder = 13
            Width = 125
          end
          object DesignFormatEdit: TcxTextEdit
            Left = 70
            Top = 245
            AutoSize = False
            Enabled = False
            ParentFont = False
            Properties.ImeMode = imSHanguel
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 14
            Height = 25
            Width = 125
          end
          object DesignStatusButton: TcxButton
            Tag = 6
            Left = 15
            Top = 57
            Width = 83
            Height = 31
            Caption = #49345#53468
            LookAndFeel.Kind = lfOffice11
            OptionsImage.Layout = blGlyphTop
            OptionsImage.Spacing = 0
            SpeedButtonOptions.GroupIndex = 1
            SpeedButtonOptions.CanBeFocused = False
            SpeedButtonOptions.Transparent = True
            TabOrder = 15
            OnClick = DesignOrderNumberButtonClick
          end
          object DesignTopHeightEdit: TcxCurrencyEdit
            Left = 509
            Top = 28
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = '0'
            Properties.ImeMode = imSAlpha
            Properties.Nullable = False
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 16
            Width = 45
          end
          object DesignBottomHeightEdit: TcxCurrencyEdit
            Left = 509
            Top = 60
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = '0'
            Properties.ImeMode = imSAlpha
            Properties.Nullable = False
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 17
            Width = 45
          end
          object DesignObjectClearButton: TButton
            Left = 347
            Top = 57
            Width = 83
            Height = 31
            Caption = #47784#46160#49325#51228
            TabOrder = 18
            TabStop = False
            OnClick = DesignObjectClearButtonClick
          end
        end
        object DesignTemplateComboBox: TcxComboBox
          Left = 52
          Top = 10
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.OnChange = DesignTemplateComboBoxPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 174
        end
        object DesignRowSizeEdit: TcxSpinEdit
          Left = 78
          Top = 85
          Enabled = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.MaxValue = 10.000000000000000000
          Properties.MinValue = 1.000000000000000000
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 2
          Value = 3
          Width = 48
        end
        object DesignColSizeEdit: TcxSpinEdit
          Left = 154
          Top = 85
          Enabled = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.MaxValue = 10.000000000000000000
          Properties.MinValue = 1.000000000000000000
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 3
          Value = 3
          Width = 48
        end
        object KDSColorGroupBox: TcxGroupBox
          Left = 240
          Top = 10
          Caption = #49345#45800' '#49353#49345
          Enabled = False
          ParentFont = False
          Style.StyleController = EditStyleController
          TabOrder = 4
          Height = 144
          Width = 152
          object Label119: TLabel
            Left = 10
            Top = 30
            Width = 52
            Height = 17
            Caption = #51312#47532#45824#44592
          end
          object Label120: TLabel
            Left = 10
            Top = 66
            Width = 44
            Height = 17
            Caption = #51312#47532' '#51473
          end
          object Label121: TLabel
            Left = 10
            Top = 103
            Width = 52
            Height = 17
            Caption = #51312#47532#50756#47308
          end
          object WaitColorPanel: TPanel
            Left = 74
            Top = 26
            Width = 65
            Height = 26
            ParentBackground = False
            TabOrder = 0
            OnClick = WaitColorPanelClick
          end
          object CookingColorPanel: TPanel
            Left = 74
            Top = 63
            Width = 65
            Height = 26
            ParentBackground = False
            TabOrder = 1
            OnClick = WaitColorPanelClick
          end
          object FinishColorPanel: TPanel
            Left = 74
            Top = 101
            Width = 65
            Height = 26
            ParentBackground = False
            TabOrder = 2
            OnClick = WaitColorPanelClick
          end
        end
        object Option355CheckBox: TcxCheckBox
          Left = 409
          Top = 7
          Caption = ' '#51652#46041#48296' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 5
        end
        object Option356CheckBox: TcxCheckBox
          Left = 409
          Top = 31
          Caption = ' '#51068#48512' '#50756#47308' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 6
        end
        object Option358CheckBox: TcxCheckBox
          Left = 409
          Top = 80
          Caption = ' '#51312#47532' '#50756#47308#46108' '#47700#45684#47484' '#54364#49884#54633#45768#45796'.'
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 7
        end
        object KDSAllKitchenCopyButton: TButton
          Left = 51
          Top = 36
          Width = 176
          Height = 27
          Caption = #51204#52404#51452#48169#50640' '#46041#51068#54616#44172' '#51201#50857
          Enabled = False
          TabOrder = 9
          TabStop = False
          OnClick = KDSAllKitchenCopyButtonClick
        end
        object Option381CheckBox: TcxCheckBox
          Left = 409
          Top = 55
          Caption = ' '#51312#47532#50756#47308' '#49884' '#54869#51064#51613#51012' '#52636#47141#54633#45768#45796'.'
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 10
        end
        object Option362ComboBox: TcxComboBox
          Left = 488
          Top = 129
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #51312#47532#45824#44592
            #51312#47532#51473
            #51312#47532#50756#47308
            #51312#47532#51473','#47131#52768#50724#45908' '#51452#47928' '#49884' '#51312#47532#45824#44592)
          Properties.OnChange = DesignTemplateComboBoxPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 8
          Text = #51312#47532#51473','#47131#52768#50724#45908' '#51452#47928' '#49884' '#51312#47532#45824#44592
          Width = 240
        end
        object Option193CheckBox: TcxCheckBox
          Left = 409
          Top = 104
          Caption = ' '#47700#45684#48324#47196' '#47700#45684#47484' '#54364#49884#54633#45768#45796'.'
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 11
        end
      end
    end
    object SystemPage: TcxTabSheet
      Caption = #54532#47196#44536#47016#49444#51221
      ImageIndex = 4
      object Label89: TLabel
        Left = 20
        Top = 22
        Width = 57
        Height = 17
        Caption = #47588#51109#54872#44221' '
        Transparent = True
      end
      object Label20: TLabel
        Left = 23
        Top = 200
        Width = 145
        Height = 17
        Caption = #54252#49828' '#47588#52636#51088#47308' '#48372#44288' '#44592#44036
      end
      object Option051CheckBox: TcxCheckBox
        Left = 18
        Top = 51
        Caption = ' '#49888#50857#52852#46300'/'#54788#44552#50689#49688#51613' '#44592#45733#51012' '#49324#50857#54616#51648' '#50506#49845#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 0
      end
      object Option019CheckBox: TcxCheckBox
        Left = 18
        Top = 78
        Caption = ' '#51116#44256' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 1
      end
      object Option185CheckBox: TcxCheckBox
        Left = 18
        Top = 104
        Caption = ' '#48176#45804' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 2
      end
      object Option231CheckBox: TcxCheckBox
        Left = 23
        Top = 391
        Caption = ' '#54392#46300#53076#53944' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 3
        Visible = False
      end
      object Option016ComboBox: TcxComboBox
        Left = 118
        Top = 18
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          ' '#53580#51060#48660#51228
          ' '#49440#48520#51228
          ' '#54844#54633'('#54252#49828#48324')')
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 4
        Text = ' '#53580#51060#48660#51228
        Width = 109
      end
      object Option403CheckBox: TcxCheckBox
        Left = 18
        Top = 162
        Caption = ' '#53412#50724#49828#53356' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 5
      end
      object Option060CheckBox: TcxCheckBox
        Left = 18
        Top = 131
        Caption = ' '#45796#51473#49324#50629#51088' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 6
      end
      object Option122ComboBox: TcxComboBox
        Left = 179
        Top = 197
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '3'#44060#50900
          '6'#44060#50900
          '1'#45380)
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 7
        Text = '3'#44060#50900
        Width = 73
      end
      object Option427CheckBox: TcxCheckBox
        Left = 20
        Top = 231
        Caption = ' '#54252#49828' 1'#45824' '#51068#46412' '#51452#48169#44284' '#50689#49688#51613#54532#47536#53552' '#44057#51060' '#49324#50857#54633#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 8
      end
    end
    object LetsOrderPage: TcxTabSheet
      Caption = #47131#52768#50724#45908
      ImageIndex = 5
      OnShow = LetsOrderPageShow
      object LetsOrderOfficePager: TcxPageControl
        Left = 0
        Top = 0
        Width = 1279
        Height = 926
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = TableOptionPage
        Properties.CustomButtons.Buttons = <>
        Properties.TabHeight = 25
        Properties.TabWidth = 100
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        ClientRectBottom = 926
        ClientRectRight = 1279
        ClientRectTop = 28
        object LetsOrderOptionPager: TcxTabSheet
          Caption = #44592#48376#51221#48372
          ImageIndex = 0
          object AdvScrollBox19: TAdvScrollBox
            Left = 0
            Top = 0
            Width = 1279
            Height = 898
            Align = alClient
            BorderStyle = bsNone
            DoubleBuffered = True
            Ctl3D = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            TabOrder = 0
            object Label63: TLabel
              Left = 21
              Top = 18
              Width = 52
              Height = 17
              Caption = #50689#50629#49884#44036
              Transparent = True
            end
            object Label69: TLabel
              Left = 21
              Top = 50
              Width = 49
              Height = 17
              Caption = #55092' '#47924' '#51068
              Transparent = True
            end
            object Label76: TLabel
              Left = 21
              Top = 78
              Width = 49
              Height = 17
              Caption = #50896' '#49328' '#51648
              Transparent = True
            end
            object Label80: TLabel
              Left = 23
              Top = 254
              Width = 49
              Height = 17
              Caption = #49436' '#48708' '#49828
              Transparent = True
            end
            object Label81: TLabel
              Left = 22
              Top = 270
              Width = 52
              Height = 17
              Caption = #44592#48376#47928#44396
              Transparent = True
            end
            object Label77: TLabel
              Left = 408
              Top = 49
              Width = 34
              Height = 17
              Caption = 'PG ID'
              Transparent = True
            end
            object Label78: TLabel
              Left = 408
              Top = 79
              Width = 42
              Height = 17
              Caption = 'PG Key'
              Transparent = True
            end
            object Label107: TLabel
              Left = 704
              Top = 439
              Width = 252
              Height = 17
              Caption = '(002:'#44592#50629#51008#54665', 004:'#44397#48124#51008#54665', 020:'#50864#47532#51008#54665')'
              Transparent = True
              Visible = False
            end
            object Label108: TLabel
              Left = 704
              Top = 460
              Width = 245
              Height = 17
              Caption = '(081:'#54616#45208#51008#54665', 088:'#49888#54620#51008#54665', 011:NH'#45453#54801')'
              Transparent = True
              Visible = False
            end
            object Label137: TLabel
              Left = 705
              Top = 481
              Width = 252
              Height = 17
              Caption = '(035:'#51228#51452#51008#54665', 034:'#44305#51452#51008#54665', 032:'#48512#49328#51008#54665')'
              Transparent = True
              Visible = False
            end
            object Label171: TLabel
              Left = 704
              Top = 503
              Width = 181
              Height = 17
              Caption = '(031:'#45824#44396#51008#54665', 090:'#52852#52852#50724#48197#53356')'
              Transparent = True
              Visible = False
            end
            object Label127: TLabel
              Left = 23
              Top = 346
              Width = 52
              Height = 17
              Caption = #53469#48176#51452#47928
              Transparent = True
            end
            object Label128: TLabel
              Left = 23
              Top = 365
              Width = 52
              Height = 17
              Caption = #52280#44256#49324#54637
              Transparent = True
            end
            object Label199: TLabel
              Left = 410
              Top = 20
              Width = 34
              Height = 17
              Caption = 'PG '#49324
              Transparent = True
            end
            object Label129: TLabel
              Left = 406
              Top = 109
              Width = 44
              Height = 17
              Caption = #54252#51109'QR'
              Transparent = True
            end
            object BusinessHoursEdit: TcxTextEdit
              Left = 100
              Top = 14
              Properties.Alignment.Horz = taLeftJustify
              Properties.OnChange = EditPropertiesChange
              TabOrder = 0
              Width = 283
            end
            object DayOffEdit: TcxTextEdit
              Left = 100
              Top = 45
              Properties.Alignment.Horz = taLeftJustify
              Properties.OnChange = EditPropertiesChange
              TabOrder = 1
              TextHint = #47588#51452' '#50900#50836#51068
              Width = 283
            end
            object OriginMemo: TcxMemo
              Left = 99
              Top = 76
              Properties.OnChange = EditPropertiesChange
              TabOrder = 2
              Height = 167
              Width = 284
            end
            object ServiceDefaultMemo: TcxMemo
              Left = 99
              Top = 250
              Properties.OnChange = EditPropertiesChange
              TabOrder = 3
              Height = 88
              Width = 284
            end
            object StoreImageButton: TAdvGlowButton
              Left = 99
              Top = 451
              Width = 134
              Height = 31
              Caption = #47588#51109#51060#48120#51648
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
                0D00000006624B474400FF00FF00FFA0BDA7930000016449444154388DCD94BD
                4E02411446CFEC8F1014259A20B1A130341636165696BE83A5A56F2495B5EF60
                6362A926262616C604C10011352C985D777776198B1559703102C6F83533993B
                39F7BB377706FEBBC4FEE155F960B7B8F71BB0F249F5D89833B5F4F67A6EC9F2
                D44CB05C4A7074FA9036FA07963B9BBB5C2A5A8DEFAF25CB9170D9882ADA5A13
                64CC414C9B06D8B2158E8CC02D7BB8555301F3F391AB8C19EDE31A5B72F89158
                175F631913768A0981710E6508F716D43A10F6C627FB11F02D804A07FC10DC00
                AA5D903168DB85B3AAE2F625193854B2E542D306620EBC00AA1D282EC2A3ADB8
                7902A5A0D256F88160230F9A48003E398A6727B92F3284BB3634BB11ACAFFAAB
                42F6049B858492C7C1E2CA6705E648935AB6E2A23EC832D1D8E80256B302531F
                3E8FBFB289E75013505810A4F4E4F8670F4BCB93814B2B02C7876064AC0C5FF6
                DCEB86E74DEA540881A6E9BA0A82502938AF812F7B337E317FA1771FEE826AD0
                BD0CA80000000049454E44AE426082}
              RepeatPause = 10
              Rounded = False
              TabOrder = 4
              OnClick = StoreImageButtonClick
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
            object PGMidEdit: TcxTextEdit
              Left = 460
              Top = 46
              ParentFont = False
              Properties.ImeMode = imDisable
              Properties.MaxLength = 30
              Properties.OnChange = EditPropertiesChange
              Properties.OnValidate = EditPropertiesValidate
              Style.StyleController = EditStyleController
              TabOrder = 5
              Width = 250
            end
            object PGMidKeyEdit: TcxTextEdit
              Left = 460
              Top = 76
              ParentFont = False
              Properties.ImeMode = imSHanguel
              Properties.MaxLength = 200
              Properties.OnChange = EditPropertiesChange
              Properties.OnValidate = EditPropertiesValidate
              Style.StyleController = EditStyleController
              TabOrder = 6
              Width = 418
            end
            object cxGroupBox6: TcxGroupBox
              Left = 418
              Top = 425
              Caption = ' '#54872#48520' '#44228#51340#51221#48372' '
              TabOrder = 7
              Visible = False
              Height = 129
              Width = 276
              object Label86: TLabel
                Left = 27
                Top = 30
                Width = 52
                Height = 17
                Caption = #51008#54665#53076#46300
                Transparent = True
              end
              object Label97: TLabel
                Left = 27
                Top = 61
                Width = 52
                Height = 17
                Caption = #44228#51340#48264#54840
                Transparent = True
              end
              object Label98: TLabel
                Left = 27
                Top = 92
                Width = 49
                Height = 17
                Caption = #50696' '#44552' '#51452
                Transparent = True
              end
              object BankNoEdit: TcxTextEdit
                Left = 90
                Top = 57
                ParentFont = False
                Properties.ImeMode = imDisable
                Properties.MaxLength = 20
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 1
                Width = 175
              end
              object BankOwnerEdit: TcxTextEdit
                Left = 90
                Top = 88
                ParentFont = False
                Properties.ImeMode = imDisable
                Properties.MaxLength = 20
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 2
                Width = 175
              end
              object BankCodeEdit: TcxTextEdit
                Left = 90
                Top = 26
                ParentFont = False
                Properties.Alignment.Horz = taCenter
                Properties.ImeMode = imDisable
                Properties.MaxLength = 3
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 0
                Width = 46
              end
            end
            object Option290CheckBox: TcxCheckBox
              Left = 716
              Top = 46
              Caption = ' '#53580#49828#53944#50857
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 8
            end
            object cxGroupBox14: TcxGroupBox
              Left = 686
              Top = 148
              Caption = ' '#46041#44592#54868
              ParentFont = False
              Style.StyleController = EditStyleController
              TabOrder = 9
              Height = 167
              Width = 208
              object LetsOrderMenuDeleteButton: TAdvGlowButton
                Left = 28
                Top = 33
                Width = 141
                Height = 31
                Caption = #47700#45684' '#46041#44592#54868
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
                RepeatPause = 10
                Rounded = False
                TabOrder = 0
                OnClick = LetsOrderMenuDeleteButtonClick
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
              object LetsOrderTableDeleteButton: TAdvGlowButton
                Left = 28
                Top = 107
                Width = 141
                Height = 31
                Caption = #53580#51060#48660' '#46041#44592#54868
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
                RepeatPause = 10
                Rounded = False
                TabOrder = 1
                OnClick = LetsOrderTableDeleteButtonClick
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
              object AdvGlowButton1: TAdvGlowButton
                Left = 28
                Top = 70
                Width = 141
                Height = 31
                Caption = #47700#45684#44396#49457' '#46041#44592#54868
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
                RepeatPause = 10
                Rounded = False
                TabOrder = 2
                OnClick = AdvGlowButton1Click
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
            object LetsOrderDeliveryMemo: TcxMemo
              Left = 99
              Top = 346
              Properties.OnChange = EditPropertiesChange
              TabOrder = 10
              Height = 88
              Width = 284
            end
            object Option453ComboBox: TcxComboBox
              Left = 460
              Top = 16
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                'KIS'
                'NICE '#54168#51060#47676#52768)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 11
              Text = 'KIS'
              Width = 122
            end
            object cxGroupBox33: TcxGroupBox
              Left = 457
              Top = 144
              Caption = ' '#50545
              TabOrder = 12
              Height = 219
              Width = 202
              object Label79: TLabel
                Left = 46
                Top = 169
                Width = 26
                Height = 17
                Caption = #49353#49345
              end
              object LogoLoadButton: TAdvGlowButton
                Left = 50
                Top = 122
                Width = 55
                Height = 31
                Caption = #51312#54924
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
                RepeatPause = 10
                Rounded = False
                TabOrder = 0
                OnClick = LogoLoadButtonClick
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
              object LetsOrderAppColorPanel: TPanel
                Left = 89
                Top = 164
                Width = 76
                Height = 26
                BevelOuter = bvSpace
                BorderStyle = bsSingle
                Caption = #50630#51020
                Color = clWhite
                Ctl3D = False
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 1
                OnClick = TableGroupColor1PanelClick
              end
              object LogoImage: TcxImage
                Left = 50
                Top = 18
                TabStop = False
                Properties.Caption = #51060#48120#51648' '#50630#51020
                Properties.GraphicClassName = 'TdxPNGImage'
                Properties.PopupMenuLayout.MenuItems = []
                Style.StyleController = EditStyleController
                Style.TextColor = clGrayText
                TabOrder = 2
                Height = 98
                Width = 115
              end
              object LogoDeleteButton: TAdvGlowButton
                Left = 111
                Top = 122
                Width = 55
                Height = 31
                Caption = #49325#51228
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
                RepeatPause = 10
                Rounded = False
                TabOrder = 3
                OnClick = LogoDeleteButtonClick
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
            object TakeOutURLEdit: TcxTextEdit
              Left = 460
              Top = 106
              ParentFont = False
              Properties.ImeMode = imDisable
              Properties.MaxLength = 100
              Properties.OnChange = EditPropertiesChange
              Properties.OnValidate = EditPropertiesValidate
              Style.StyleController = EditStyleController
              TabOrder = 13
              Width = 418
            end
          end
        end
        object LetsOrderOption1Pager: TcxTabSheet
          Caption = #50741#49496'1'
          ImageIndex = 1
          object AdvScrollBox20: TAdvScrollBox
            Left = 0
            Top = 0
            Width = 1279
            Height = 898
            Align = alClient
            BorderStyle = bsNone
            DoubleBuffered = True
            Ctl3D = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            TabOrder = 0
            object LetsOrderTypeLabel: TLabel
              Left = 31
              Top = 15
              Width = 52
              Height = 17
              Caption = #51452#47928#48169#49885
              Transparent = True
            end
            object Label84: TLabel
              Left = 473
              Top = 89
              Width = 109
              Height = 17
              Caption = #44208#51228#52712#49548' '#54056#49828#50892#46300
              Transparent = True
            end
            object Label85: TLabel
              Left = 35
              Top = 204
              Width = 101
              Height = 17
              Caption = #44208#51228' '#49884' '#54924#50896#51221#48372
              Transparent = True
            end
            object Label193: TLabel
              Left = 725
              Top = 27
              Width = 127
              Height = 17
              Caption = #52395#51452#47928' '#52572#49548' '#47700#45684#49688#47049
              Transparent = True
              Visible = False
            end
            object Label194: TLabel
              Left = 724
              Top = 51
              Width = 161
              Height = 17
              Caption = '('#47700#45684#51221#48372#50640' '#44256#44061#49688#47196' '#52404#53356')'
              Font.Charset = HANGEUL_CHARSET
              Font.Color = 204
              Font.Height = -13
              Font.Name = #47569#51008' '#44256#46357
              Font.Style = []
              ParentFont = False
              Transparent = True
              Visible = False
            end
            object Label132: TLabel
              Left = 35
              Top = 367
              Width = 189
              Height = 17
              Caption = #47131#52768#50724#45908' '#54840#52636' '#49884' '#54252#49828#54868#47732' '#54364#49884
              Transparent = True
            end
            object Label197: TLabel
              Left = 471
              Top = 120
              Width = 83
              Height = 17
              Caption = #51649#50896#54840#52636' '#47700#45684
              Visible = False
            end
            object Label223: TLabel
              Left = 35
              Top = 174
              Width = 104
              Height = 17
              Caption = #50508#47548#53665' '#48156#49569'('#54252#51109')'
              Transparent = True
            end
            object Option062CheckBox: TcxCheckBox
              Left = 30
              Top = 91
              Caption = ' '#51452#47928' '#49884' '#51312#47532#51473' '#49345#53468#47196' '#51200#51109#54633#45768#45796'. (KDS)'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 2
            end
            object Option066CheckBox: TcxCheckBox
              Left = 30
              Top = 141
              Caption = ' '#51312#47532#50756#47308' '#48143' '#54840#52636' '#49884' '#54869#51064#51613#51012' '#52636#47141#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 3
            end
            object Option094ComboBox: TcxComboBox
              Left = 91
              Top = 11
              ParentFont = False
              Properties.Alignment.Horz = taLeftJustify
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                ' '#49440#48520#51228'('#53580#51060#48660' '#50630#51020')'
                ' '#49440#48520#51228'('#53580#51060#48660' '#51080#51020')'
                ' '#49440#54980#48520' '#48373#54633
                ' '#51452#47928#51204#50857)
              Properties.ReadOnly = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 0
              Text = ' '#49440#48520#51228'('#53580#51060#48660' '#51080#51020')'
              Width = 178
            end
            object Option140CheckBox: TcxCheckBox
              Left = 30
              Top = 65
              Caption = ' '#49440#48520#50857' QR '#51069#50632#51012' '#46412' '#47588#51109#51060#50857' or '#54252#51109' '#49440#53469#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 1
            end
            object cxGroupBox4: TcxGroupBox
              Left = 473
              Top = 15
              Caption = #49440#48520#51228' '#51452#47928#51217#49688
              TabOrder = 6
              Height = 61
              Width = 240
              object Label83: TLabel
                Left = 27
                Top = 29
                Width = 26
                Height = 17
                Caption = #54364#49884
                Transparent = True
              end
              object Label82: TLabel
                Left = 123
                Top = 30
                Width = 8
                Height = 17
                Caption = 'X'
                Transparent = True
              end
              object Option450SpinEdit: TcxSpinEdit
                Left = 143
                Top = 26
                ParentFont = False
                Properties.Alignment.Horz = taCenter
                Properties.MaxValue = 9.000000000000000000
                Properties.MinValue = 2.000000000000000000
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 0
                Value = 3
                Width = 48
              end
              object Option449SpinEdit: TcxSpinEdit
                Left = 64
                Top = 25
                ParentFont = False
                Properties.Alignment.Horz = taCenter
                Properties.MaxValue = 9.000000000000000000
                Properties.MinValue = 4.000000000000000000
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 1
                Value = 4
                Width = 48
              end
            end
            object Option148CheckBox: TcxCheckBox
              Left = 30
              Top = 228
              Caption = ' '#47131#52768#50724#45908#50640#49436' '#44208#51228#50756#47308' '#49884' '#54252#49828#50640#49436' '#54869#51064' '#54980' '#50756#47308#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 7
            end
            object Option166CheckBox: TcxCheckBox
              Left = 30
              Top = 254
              Caption = ' '#44208#51228#52712#49548' '#49884' '#49324#51109#45784#44760' '#50508#47548#53665#51012' '#48156#49569#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 8
            end
            object PGCancelPwdEdit: TcxTextEdit
              Left = 594
              Top = 85
              ParentFont = False
              Properties.ImeMode = imDisable
              Properties.MaxLength = 20
              Properties.OnChange = EditPropertiesChange
              Properties.OnValidate = EditPropertiesValidate
              Style.StyleController = EditStyleController
              TabOrder = 9
              Width = 183
            end
            object Option141ComboBox: TcxComboBox
              Left = 169
              Top = 199
              ParentFont = False
              Properties.Alignment.Horz = taLeftJustify
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #51077#47141#48155#51648' '#50506#49845#45768#45796'.'
                #49828#53596#54532#51201#47549' '#51204#54868#48264#54840#47484' '#51077#47141#48155#49845#45768#45796'.'
                #54252#51064#53944#51201#47549' '#51204#54868#48264#54840#47484' '#51077#47141#48155#49845#45768#45796'.')
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 5
              Text = #51077#47141#48155#51648' '#50506#49845#45768#45796'.'
              Width = 257
            end
            object Option420CheckBox: TcxCheckBox
              Left = 30
              Top = 280
              Caption = ' '#54252#51064#53944'&&'#49828#53596#54532#47484' 2'#48176#47196' '#51201#47549#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 10
            end
            object Option180SpinEdit: TcxSpinEdit
              Left = 860
              Top = 22
              ParentFont = False
              Properties.Alignment.Horz = taCenter
              Properties.MaxValue = 9.000000000000000000
              Properties.MinValue = 4.000000000000000000
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 11
              Value = 4
              Visible = False
              Width = 37
            end
            object Option334CheckBox: TcxCheckBox
              Left = 30
              Top = 306
              Caption = ' '#49440#48520#44208#51228'(TakeOut) '#49884' '#54840#52636#48264#54840#47484' '#49373#49457#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 12
            end
            object Option405CheckBox: TcxCheckBox
              Left = 30
              Top = 331
              Caption = ' '#47131#52768#50724#45908#50640#49436' '#51452#47928' '#49884' '#48376#51064#51064#51613' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 13
            end
            object Option083ComboBox: TcxComboBox
              Left = 230
              Top = 363
              ParentFont = False
              Properties.Alignment.Horz = taLeftJustify
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #54364#49884#54616#51648' '#50506#49845#45768#45796'.'
                '10'#52488' '#54364#49884' '#54980' '#51088#46041' '#45803#55192
                '20'#52488' '#54364#49884' '#54980' '#51088#46041' '#45803#55192
                '30'#52488' '#54364#49884' '#54980' '#51088#46041' '#45803#55192
                #44228#49549#54364#49884)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 14
              Width = 212
            end
            object Option352CheckBox: TcxCheckBox
              Left = 31
              Top = 394
              Caption = ' '#47131#52768#50724#45908' '#51452#47928'/'#54840#52636' '#49884' '#51204#54252#49828#50640' '#54364#49884' '#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 15
            end
            object cxGroupBox23: TcxGroupBox
              Left = 28
              Top = 432
              Caption = ' '#44256#44061#51452#47928#49436
              TabOrder = 16
              Height = 96
              Width = 419
              object Label133: TLabel
                Left = 20
                Top = 59
                Width = 83
                Height = 17
                Caption = #54252#49828#54868#47732' '#54364#49884
                Transparent = True
              end
              object Label167: TLabel
                Left = 20
                Top = 29
                Width = 70
                Height = 17
                Caption = #54532#47536#53552' '#52636#47141
                Transparent = True
              end
              object Option181ComboBox: TcxComboBox
                Left = 124
                Top = 55
                ParentFont = False
                Properties.Alignment.Horz = taLeftJustify
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  #54364#49884#54616#51648' '#50506#49845#45768#45796'.'
                  #51204#47700#45684#47484' '#54364#49884#54633#45768#45796'.'
                  #52636#47141' '#49444#51221#54620' '#47700#45684#47564' '#54364#49884#54633#45768#45796'.')
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 0
                Width = 254
              end
              object Option182ComboBox: TcxComboBox
                Left = 124
                Top = 24
                ParentFont = False
                Properties.Alignment.Horz = taLeftJustify
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  #52636#47141#54616#51648' '#50506#49845#45768#45796'.'
                  #51204#47700#45684#47484' '#52636#47141#54633#45768#45796'.'
                  #52636#47141' '#49444#51221#54620' '#47700#45684#47564' '#52636#47141#54633#45768#45796'.')
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 1
                Width = 254
              end
            end
            object Option369CheckBox: TcxCheckBox
              Left = 470
              Top = 160
              Caption = ' '#48176#45804#51452#47928' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.('#53580#51060#53356#50500#50883' '#51452#47928#49884')'
              Enabled = False
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 17
            end
            object Option402CheckBox: TcxCheckBox
              Left = 470
              Top = 187
              Caption = ' '#44208#51228#50756#47308' '#49884' '#53580#51060#48660#50640' '#51452#47928#47700#45684#47484' '#54364#49884#54616#51648' '#50506#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 18
            end
            object LetsOrderServiceMenuCodeButtonEdit: TcxButtonEdit
              Left = 595
              Top = 116
              ParentFont = False
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              Properties.ReadOnly = True
              Properties.OnButtonClick = TableDefaultMenuEditPropertiesButtonClick
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 19
              Visible = False
              Width = 101
            end
            object Option359CheckBox: TcxCheckBox
              Left = 470
              Top = 215
              Caption = ' '#54252#49828#50640' '#50689#49688#51613#44288#47532#50640' '#44592#48376#51012' '#47131#52768#50724#45908#47196' '#49324#50857#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 20
            end
            object Option474CheckBox: TcxCheckBox
              Left = 470
              Top = 245
              Caption = ' '#52636#47141' '#49892#54056' '#49884' '#50508#47548#53665#51012' '#48156#49569#54633#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 21
            end
            object Option192ComboBox: TcxComboBox
              Left = 169
              Top = 168
              ParentFont = False
              Properties.Alignment.Horz = taLeftJustify
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #48156#49569#54616#51648' '#50506#51020
                #51452#47928' '#51217#49688' '#49884' '#48156#49569
                'KDS'#50640#49436' '#51452#47928' '#51217#49688' '#49884' '#48156#49569)
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 4
              Width = 255
            end
            object Option093CheckBox: TcxCheckBox
              Left = 30
              Top = 116
              Caption = ' '#54252#51109#51452#47928' '#49884' '#51204#54868#48264#54840#47484' '#51077#47141' '#48155#49845#45768#45796'.'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 22
            end
            object Option483ComboBox: TcxComboBox
              Left = 91
              Top = 39
              ParentFont = False
              Properties.Alignment.Horz = taLeftJustify
              Properties.DropDownListStyle = lsFixedList
              Properties.Items.Strings = (
                #54252#49828' '#51452#47928#51012' '#44208#51228#54616#51648' '#50506#49845#45768#45796'.'
                #54252#49828' '#51452#47928#51012' '#44057#51060' '#44208#51228#54633#45768#45796'.'
                #54252#49828' '#51452#47928#51012' '#51452#47928#45236#50669#50640#49436' '#44208#51228#54633#45768#45796'.')
              Properties.ReadOnly = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 23
              Text = #54252#49828' '#51452#47928#51012' '#44208#51228#54616#51648' '#50506#49845#45768#45796'.'
              Width = 298
            end
          end
        end
        object LetsOrderOption2Page: TcxTabSheet
          Caption = #50741#49496'2'
          ImageIndex = 2
          object cxGroupBox24: TcxGroupBox
            Left = 15
            Top = 16
            Caption = #48176#49569#48169#48277
            TabOrder = 0
            Height = 74
            Width = 309
            object DelyveryType1CheckBox: TcxCheckBox
              Left = 32
              Top = 28
              Caption = ' '#53469#48176
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 0
            end
            object DelyveryType2CheckBox: TcxCheckBox
              Left = 111
              Top = 28
              Caption = ' '#48176#45804
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 1
            end
            object DelyveryType3CheckBox: TcxCheckBox
              Left = 186
              Top = 27
              Caption = ' '#54252#51109
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 2
            end
          end
          object cxGroupBox26: TcxGroupBox
            Left = 16
            Top = 107
            Caption = ' '#48176#45804' '#49884' '#50836#52397#49324#54637
            ParentFont = False
            Style.StyleController = EditStyleController
            TabOrder = 1
            Height = 195
            Width = 388
            object cxScrollBox2: TcxScrollBox
              Left = 7
              Top = 21
              Width = 373
              Height = 156
              LookAndFeel.NativeStyle = True
              TabOrder = 0
              object Label201: TLabel
                Left = 12
                Top = 17
                Width = 7
                Height = 17
                Caption = '1'
              end
              object Label202: TLabel
                Left = 12
                Top = 43
                Width = 7
                Height = 17
                Caption = '2'
              end
              object Label203: TLabel
                Left = 12
                Top = 71
                Width = 7
                Height = 17
                Caption = '3'
              end
              object Label204: TLabel
                Left = 12
                Top = 98
                Width = 7
                Height = 17
                Caption = '4'
              end
              object Label205: TLabel
                Left = 12
                Top = 152
                Width = 7
                Height = 17
                Caption = '6'
              end
              object Label206: TLabel
                Left = 12
                Top = 125
                Width = 7
                Height = 17
                Caption = '5'
              end
              object Label207: TLabel
                Left = 12
                Top = 206
                Width = 7
                Height = 17
                Caption = '8'
              end
              object Label208: TLabel
                Left = 12
                Top = 179
                Width = 7
                Height = 17
                Caption = '7'
              end
              object DeliveryRemark3Edit: TcxTextEdit
                Left = 24
                Top = 66
                ParentFont = False
                Properties.MaxLength = 48
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 0
                Width = 320
              end
              object DeliveryRemark2Edit: TcxTextEdit
                Left = 24
                Top = 39
                ParentFont = False
                Properties.MaxLength = 48
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 1
                Width = 320
              end
              object DeliveryRemark1Edit: TcxTextEdit
                Left = 24
                Top = 12
                ParentFont = False
                Properties.MaxLength = 48
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 2
                Width = 320
              end
              object DeliveryRemark6Edit: TcxTextEdit
                Left = 24
                Top = 147
                ParentFont = False
                Properties.MaxLength = 48
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 3
                Width = 320
              end
              object DeliveryRemark5Edit: TcxTextEdit
                Left = 24
                Top = 120
                ParentFont = False
                Properties.MaxLength = 48
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 4
                Width = 320
              end
              object DeliveryRemark4Edit: TcxTextEdit
                Left = 24
                Top = 93
                ParentFont = False
                Properties.MaxLength = 48
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 5
                Width = 320
              end
              object DeliveryRemark8Edit: TcxTextEdit
                Left = 24
                Top = 202
                ParentFont = False
                Properties.MaxLength = 48
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 6
                Width = 320
              end
              object DeliveryRemark7Edit: TcxTextEdit
                Left = 24
                Top = 174
                ParentFont = False
                Properties.MaxLength = 48
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 7
                Width = 320
              end
            end
          end
          object LetsOrderGroupBox: TAdvGroupBox
            Left = 15
            Top = 310
            Width = 232
            Height = 136
            CaptionFont.Charset = DEFAULT_CHARSET
            CaptionFont.Color = clWindowText
            CaptionFont.Height = -11
            CaptionFont.Name = 'Tahoma'
            CaptionFont.Style = []
            Caption = ' '#44208#51228#50756#47308' '#49884' '#52636#47141#51452#48169'  '
            ParentCtl3D = True
            TabOrder = 2
            object LetsOrderCheckListBox: TcxCheckListBox
              Left = 13
              Top = 25
              Width = 205
              Height = 98
              Hint = 'CD_PRINTER'
              ImeName = 'Microsoft Office IME 2007'
              Items = <
                item
                  Text = #47700#51064#51452#47581
                end>
              ParentFont = False
              Style.StyleController = EditStyleController
              TabOrder = 0
              OnEditValueChanged = EditPropertiesChange
            end
          end
        end
        object TabletUsePage: TcxTabSheet
          Caption = #53468#48660#47551#44288#47532
          ImageIndex = 3
          OnShow = TabletUsePageShow
          DesignSize = (
            1279
            898)
          object cxGrid2: TcxGrid
            Left = 9
            Top = 44
            Width = 1263
            Height = 845
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            LookAndFeel.Kind = lfOffice11
            LookAndFeel.NativeStyle = False
            object GridTableTablet: TcxGridTableView
              Tag = 99
              Navigator.Buttons.CustomButtons = <>
              ScrollbarAnnotations.CustomAnnotations = <>
              OnCellDblClick = GridTableTabletCellDblClick
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = ',0 '#45824
                  Kind = skCount
                  Column = GridTableTabletName
                end>
              DataController.Summary.SummaryGroups = <>
              DataController.OnAfterPost = GridTableTabletDataControllerAfterPost
              OptionsBehavior.FocusCellOnTab = True
              OptionsBehavior.GoToNextCellOnEnter = True
              OptionsBehavior.FocusCellOnCycle = True
              OptionsSelection.ShowCheckBoxesDynamically = True
              OptionsView.Footer = True
              OptionsView.GroupByBox = False
              Styles.OnGetContentStyle = GridTableTabletStylesGetContentStyle
              object GridTableTabletColumn3: TcxGridColumn
                Caption = 'No'
                DataBinding.FieldName = 'SEQ'
                PropertiesClassName = 'TcxLabelProperties'
                Properties.Alignment.Horz = taCenter
                HeaderAlignmentHorz = taCenter
                Options.Editing = False
                Options.Filtering = False
                Options.Focusing = False
              end
              object GridTableTabletNo: TcxGridColumn
                Caption = #53580#51060#48660#48264#54840
                DataBinding.ValueType = 'Integer'
                DataBinding.FieldName = 'NO_TABLE'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.DisplayFormat = '#0'
                HeaderAlignmentHorz = taCenter
                Options.Editing = False
                Options.Filtering = False
                Options.Focusing = False
                Options.Moving = False
                Width = 95
              end
              object GridTableTabletName: TcxGridColumn
                Caption = #53580#51060#48660#47749
                DataBinding.FieldName = 'NM_TABLE'
                PropertiesClassName = 'TcxLabelProperties'
                Properties.Alignment.Horz = taCenter
                FooterAlignmentHorz = taCenter
                HeaderAlignmentHorz = taCenter
                Options.Editing = False
                Options.Filtering = False
                Options.Focusing = False
                Options.Moving = False
                Width = 112
              end
              object GridTableTabletVanTID: TcxGridColumn
                Caption = 'VAN TID'
                DataBinding.FieldName = 'VAN_TID'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.OnValidate = GridTableTabletVanTIDPropertiesValidate
                HeaderAlignmentHorz = taCenter
                Width = 80
              end
              object GridTableTabletSerialNo: TcxGridColumn
                Tag = 99
                Caption = #49884#47532#50620#48264#54840
                DataBinding.FieldName = 'VAN_SERIAL'
                PropertiesClassName = 'TcxTextEditProperties'
                HeaderAlignmentHorz = taCenter
                Width = 90
              end
              object GridTableTabletRegDate: TcxGridColumn
                Caption = #46321#47197#51068#49884
                DataBinding.FieldName = 'DT_INSERT'
                PropertiesClassName = 'TcxLabelProperties'
                Properties.Alignment.Horz = taCenter
                HeaderAlignmentHorz = taCenter
                Options.Editing = False
                Options.Filtering = False
                Options.Focusing = False
                Width = 117
              end
              object GridTableTabletLastConnect: TcxGridColumn
                Caption = #52572#51333#51217#49549
                DataBinding.FieldName = 'DT_LOGIN'
                PropertiesClassName = 'TcxLabelProperties'
                Properties.Alignment.Horz = taCenter
                HeaderAlignmentHorz = taCenter
                Options.Editing = False
                Options.Filtering = False
                Options.Focusing = False
                Width = 164
              end
              object GridTableTabletUUID: TcxGridColumn
                Tag = 99
                DataBinding.FieldName = 'NO_UUID'
                Visible = False
              end
              object GridTableTabletLapeTime: TcxGridColumn
                Caption = #44221#44284#49884#44036
                DataBinding.FieldName = 'LAPE_TIME'
                PropertiesClassName = 'TcxLabelProperties'
                Properties.Alignment.Horz = taRightJustify
                HeaderAlignmentHorz = taCenter
                Options.Editing = False
                Options.Filtering = False
                Options.Focusing = False
                Width = 106
              end
              object GridTableTabletAppVersion: TcxGridColumn
                Caption = #48260#51204
                DataBinding.FieldName = 'APP_VERSION'
                PropertiesClassName = 'TcxLabelProperties'
                Properties.Alignment.Horz = taCenter
                HeaderAlignmentHorz = taCenter
                Options.Editing = False
                Options.Filtering = False
                Options.Focusing = False
                Width = 100
              end
              object GridTableTabletInit: TcxGridColumn
                Tag = 99
                DataBinding.FieldName = 'MASTER_INIT'
                Visible = False
              end
              object GridTableTabletRowState: TcxGridColumn
                Tag = 99
                Caption = 'RowState'
                DataBinding.FieldName = 'ROW_STATE'
                Visible = False
              end
              object GridTableTabletSame: TcxGridColumn
                Tag = 99
                Caption = #51473#48373
                Visible = False
              end
              object GridTableTabletStatus: TcxGridColumn
                Caption = #49345#53468
                DataBinding.FieldName = 'DS_STATUS'
                PropertiesClassName = 'TcxComboBoxProperties'
                Properties.Alignment.Horz = taCenter
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  #51221#49345
                  #48120#49444#52824
                  #44256#51109)
                HeaderAlignmentHorz = taCenter
                Options.Filtering = False
                Width = 96
              end
              object GridTableTabletRustdeskID: TcxGridColumn
                Caption = #50896#44201'ID'
                DataBinding.FieldName = 'RUSTDESK_ID'
                PropertiesClassName = 'TcxTextEditProperties'
                Properties.Alignment.Horz = taCenter
                HeaderAlignmentHorz = taCenter
                Width = 118
              end
            end
            object cxGridLevel3: TcxGridLevel
              GridView = GridTableTablet
            end
          end
          object TabletSaveButton: TAdvGlowButton
            Left = 10
            Top = 10
            Width = 79
            Height = 28
            Caption = #51200#51109
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            FocusType = ftHot
            NotesFont.Charset = DEFAULT_CHARSET
            NotesFont.Color = clWindowText
            NotesFont.Height = -11
            NotesFont.Name = 'Tahoma'
            NotesFont.Style = []
            ParentFont = False
            Picture.Data = {
              89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
              0D00000006624B474400FF00FF00FFA0BDA7930000018B49444154388DCD93B1
              2F03511CC73FEFAE3D776D6911C160692C8D70431783D1223689D9264C56F11F
              18C5C2E81F2061B030904E42440C064C12B922B47A55AABD6740DDE9A936217C
              A6F7DEEFFBFBE6FDBE2F0FFE3BE27D915C3E1F728A85D1D243C60418EC14DD31
              0DC32D0EAA4A3E6C686980DD6B63FFAEA81DEE4DF7AEB935818AB3E30C239DD9
              52210F40A2C5201E532BC26C26C3FAC63AA66932306092BA098D3842CAE4D2D9
              CCC154EFE2BB4EA97794C2E323C74747A42DCB33A1402E24974FC71B36AC8110
              0E7D5F185622A52CBD1543D7E9374D3ABBBA5EEB2EAD9B807BA36A3A5A4B3BB2
              5C66DB02EBC97155DB888F4C622B0A9B6995DBA28A1F81CF07C15014801B60E7
              DEB7A7263F91A107CF0D131D4DAC8CF57C914E35129858BDE0E4EAC9DF301454
              10C0F55D96AC9DAF69168D84E9688D120A7A87ACCA1020D61CA1396CF8952AA8
              4A9D8F0290C9D975DFB02E4343D710DF04A93769BEE7BFFBCA97B967B6CEEDB7
              0FE39FD10765903697B9677F43A1CA94952BCDCF6D5955ADDF2154996AB8E9CF
              7801CA5471BB7172CBF30000000049454E44AE426082}
            RepeatPause = 10
            Rounded = False
            TabOrder = 1
            OnClick = TabletSaveButtonClick
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
            Enabled = False
          end
          object TabletPowerOffButton: TAdvGlowButton
            Left = 95
            Top = 10
            Width = 130
            Height = 28
            Caption = #51204#50896#45124#44592#51204#52404')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            FocusType = ftHot
            NotesFont.Charset = DEFAULT_CHARSET
            NotesFont.Color = clWindowText
            NotesFont.Height = -11
            NotesFont.Name = 'Tahoma'
            NotesFont.Style = []
            ParentFont = False
            RepeatPause = 10
            Rounded = False
            TabOrder = 2
            OnClick = TabletPowerOffButtonClick
            Appearance.BorderColor = 14727579
            Appearance.BorderColorHot = 10079963
            Appearance.BorderColorCheckedHot = 11565130
            Appearance.BorderColorDown = 4548219
            Appearance.BorderColorChecked = 4548219
            Appearance.BorderColorDisabled = 13948116
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
            Appearance.TextColorChecked = 3750459
            Appearance.TextColorDown = 2303013
            Appearance.TextColorHot = 2303013
            Appearance.TextColorDisabled = 13948116
          end
          object TabletAppRestartButton: TAdvGlowButton
            Left = 239
            Top = 10
            Width = 122
            Height = 28
            Caption = #50545' '#51116#49892#54665'('#51204#52404')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            FocusType = ftHot
            NotesFont.Charset = DEFAULT_CHARSET
            NotesFont.Color = clWindowText
            NotesFont.Height = -11
            NotesFont.Name = 'Tahoma'
            NotesFont.Style = []
            ParentFont = False
            RepeatPause = 10
            Rounded = False
            TabOrder = 3
            OnClick = TabletPowerOffButtonClick
            Appearance.BorderColor = 14727579
            Appearance.BorderColorHot = 10079963
            Appearance.BorderColorCheckedHot = 11565130
            Appearance.BorderColorDown = 4548219
            Appearance.BorderColorChecked = 4548219
            Appearance.BorderColorDisabled = 13948116
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
            Appearance.TextColorChecked = 3750459
            Appearance.TextColorDown = 2303013
            Appearance.TextColorHot = 2303013
            Appearance.TextColorDisabled = 13948116
          end
          object TabletAppUpdateButton: TAdvGlowButton
            Left = 375
            Top = 10
            Width = 122
            Height = 28
            Caption = #50545' '#50629#45936#51060#53944
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            FocusType = ftHot
            NotesFont.Charset = DEFAULT_CHARSET
            NotesFont.Color = clWindowText
            NotesFont.Height = -11
            NotesFont.Name = 'Tahoma'
            NotesFont.Style = []
            ParentFont = False
            RepeatPause = 10
            Rounded = False
            TabOrder = 4
            OnClick = TabletPowerOffButtonClick
            Appearance.BorderColor = 14727579
            Appearance.BorderColorHot = 10079963
            Appearance.BorderColorCheckedHot = 11565130
            Appearance.BorderColorDown = 4548219
            Appearance.BorderColorChecked = 4548219
            Appearance.BorderColorDisabled = 13948116
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
            Appearance.TextColorChecked = 3750459
            Appearance.TextColorDown = 2303013
            Appearance.TextColorHot = 2303013
            Appearance.TextColorDisabled = 13948116
          end
          object TabletMenuUpdateButton: TAdvGlowButton
            Left = 511
            Top = 10
            Width = 122
            Height = 28
            Caption = #47700#45684' '#50629#45936#51060#53944
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            FocusType = ftHot
            NotesFont.Charset = DEFAULT_CHARSET
            NotesFont.Color = clWindowText
            NotesFont.Height = -11
            NotesFont.Name = 'Tahoma'
            NotesFont.Style = []
            ParentFont = False
            RepeatPause = 10
            Rounded = False
            TabOrder = 5
            OnClick = TabletPowerOffButtonClick
            Appearance.BorderColor = 14727579
            Appearance.BorderColorHot = 10079963
            Appearance.BorderColorCheckedHot = 11565130
            Appearance.BorderColorDown = 4548219
            Appearance.BorderColorChecked = 4548219
            Appearance.BorderColorDisabled = 13948116
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
            Appearance.TextColorChecked = 3750459
            Appearance.TextColorDown = 2303013
            Appearance.TextColorHot = 2303013
            Appearance.TextColorDisabled = 13948116
          end
        end
        object TableOptionPage: TcxTabSheet
          Caption = #53468#48660#47551#50741#49496
          ImageIndex = 4
          OnShow = TableOptionPageShow
          object TabletSubOptionPager: TcxPageControl
            Left = 0
            Top = 0
            Width = 1279
            Height = 898
            Align = alClient
            TabOrder = 0
            Properties.ActivePage = TableOption2TabSheet
            Properties.CustomButtons.Buttons = <>
            Properties.TabWidth = 60
            LookAndFeel.Kind = lfOffice11
            LookAndFeel.NativeStyle = False
            ClientRectBottom = 898
            ClientRectRight = 1279
            ClientRectTop = 28
            object cxTabSheet38: TcxTabSheet
              Caption = #50741#49496'1'
              ImageIndex = 0
              object Label213: TLabel
                Left = 360
                Top = 12
                Width = 63
                Height = 17
                Caption = 'Last Order'
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object Label214: TLabel
                Left = 360
                Top = 45
                Width = 67
                Height = 17
                Caption = 'Break Time'
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object Label175: TLabel
                Left = 523
                Top = 14
                Width = 53
                Height = 17
                Caption = #50696') 22:00'
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object Label211: TLabel
                Left = 630
                Top = 15
                Width = 101
                Height = 17
                Caption = #44228#49328' '#49884' '#52404#53356#47700#45684
              end
              object KitchenPrintGroupBox: TcxGroupBox
                Left = 20
                Top = 52
                Caption = ' '#47700#45684' '#54364#49884
                ParentFont = False
                Style.Font.Charset = HANGEUL_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = #47569#51008' '#44256#46357
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 0
                Height = 156
                Width = 244
                object Option4610RadioButton: TcxRadioButton
                  Left = 32
                  Top = 24
                  Width = 169
                  Height = 17
                  Caption = ' '#54620#51460#50640' 2'#44060#50473' '#54364#49884
                  TabOrder = 0
                  OnClick = EditPropertiesChange
                end
                object Option4611RadioButton: TcxRadioButton
                  Left = 32
                  Top = 46
                  Width = 169
                  Height = 17
                  Caption = ' '#54620#51460#50640' 3'#44060#50473' '#54364#49884
                  Checked = True
                  TabOrder = 1
                  TabStop = True
                  OnClick = EditPropertiesChange
                end
                object Option462RadioGroup: TcxRadioGroup
                  AlignWithMargins = True
                  Left = 32
                  Top = 69
                  Caption = ' '#47700#45684' '#51060#48120#51648' '#54364#49884
                  Enabled = False
                  Properties.Items = <
                    item
                      Caption = ' '#44032#50868#45936' '#54364#49884'('#50577' '#50694' '#51088#47476#44592')'
                    end
                    item
                      Caption = ' '#44873' '#52264#44172' '#45720#47532#44592
                    end
                    item
                      Caption = ' '#44873' '#52264#44172' '#50948#50500#47000' '#51088#47476#44592
                    end>
                  Properties.OnChange = EditPropertiesChange
                  TabOrder = 2
                  Height = 84
                  Width = 204
                end
              end
              object Option459Switch: TToggleSwitch
                Left = 138
                Top = 13
                Width = 74
                Height = 20
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
                State = tssOn
                TabOrder = 1
                ThumbColor = clBlack
                OnClick = EditPropertiesChange
              end
              object cxLabel12: TcxLabel
                Left = 22
                Top = 14
                HelpType = htKeyword
                HelpKeyword = 'C'
                Caption = #48512#54021' '#49884' '#51088#46041#49892#54665
                ParentFont = False
                Style.Font.Charset = HANGEUL_CHARSET
                Style.Font.Color = clBlack
                Style.Font.Height = -13
                Style.Font.Name = #47569#51008' '#44256#46357
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object QRGroupBox: TcxGroupBox
                Left = 33
                Top = 227
                Caption = ' '#51064#51613' QR'
                ParentFont = False
                Style.Font.Charset = HANGEUL_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = #47569#51008' '#44256#46357
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 3
                DesignSize = (
                  230
                  205)
                Height = 205
                Width = 230
                object PaintBox: TPaintBox
                  Left = 50
                  Top = 51
                  Width = 121
                  Height = 110
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  OnPaint = PaintBoxPaint
                end
                object QRStoreLabel: TcxLabel
                  Left = 7
                  Top = 27
                  HelpType = htKeyword
                  HelpKeyword = 'C'
                  Caption = #47588#51109#47749
                  ParentFont = False
                  Style.Font.Charset = HANGEUL_CHARSET
                  Style.Font.Color = clBlack
                  Style.Font.Height = -13
                  Style.Font.Name = #47569#51008' '#44256#46357
                  Style.Font.Style = []
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object QRPasswordEdit: TCurvyEdit
                  Left = 47
                  Top = 167
                  Width = 61
                  Height = 30
                  Margins.Left = 0
                  Rounding = 5
                  TabOrder = 1
                  TabStop = True
                  Version = '1.2.2.2'
                  Alignment = taCenter
                  Controls = <>
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = #47569#51008' '#44256#46357
                  Font.Style = []
                  ImeName = ''
                  ParentFont = False
                  Text = ''
                  OnChange = QRPasswordEditChange
                end
                object AuthNoEdit: TCurvyEdit
                  Left = 114
                  Top = 167
                  Width = 57
                  Height = 30
                  Rounding = 5
                  TabOrder = 2
                  TabStop = True
                  Version = '1.2.2.2'
                  Alignment = taCenter
                  Controls = <>
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = #47569#51008' '#44256#46357
                  Font.Style = []
                  ImeName = ''
                  ParentFont = False
                  Text = ''
                end
                object cxLabel8: TcxLabel
                  Left = 10
                  Top = 171
                  Caption = #50516#54840
                  ParentFont = False
                  Style.Font.Charset = HANGEUL_CHARSET
                  Style.Font.Color = clBlack
                  Style.Font.Height = -13
                  Style.Font.Name = #47569#51008' '#44256#46357
                  Style.Font.Style = []
                  Style.IsFontAssigned = True
                  Transparent = True
                end
              end
              object BreakTimeEdit: TcxMaskEdit
                Left = 467
                Top = 43
                ParentFont = False
                Properties.Alignment.Horz = taCenter
                Properties.EditMask = '!00:00~00:00;1;_'
                Properties.OnChange = EditPropertiesChange
                Style.Font.Charset = HANGEUL_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = #47569#51008' '#44256#46357
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 4
                Text = '00:00~00:00'
                Width = 87
              end
              object LastOrderTimeEdit: TcxTextEdit
                Left = 467
                Top = 9
                ParentFont = False
                Properties.Alignment.Horz = taCenter
                Properties.ImeMode = imDisable
                Properties.MaxLength = 5
                Properties.ReadOnly = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 5
                Width = 50
              end
              object cxGroupBox27: TcxGroupBox
                Left = 268
                Top = 80
                Caption = ' '#54868#47732' '#49444#51221
                ParentFont = False
                Style.Font.Charset = HANGEUL_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = #47569#51008' '#44256#46357
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 6
                Height = 196
                Width = 333
                object cxLabel15: TcxLabel
                  Left = 16
                  Top = 31
                  Caption = #45824#44592' '#54868#47732' '#54364#49884' '#49884#44036'('#48516')'
                  ParentFont = False
                  Style.Font.Charset = HANGEUL_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -13
                  Style.Font.Name = #47569#51008' '#44256#46357
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object Option464SpinEdit: TcxSpinEdit
                  Left = 246
                  Top = 30
                  Properties.Alignment.Horz = taCenter
                  Properties.AssignedValues.MinValue = True
                  Properties.MaxValue = 9.000000000000000000
                  Properties.OnChange = EditPropertiesChange
                  TabOrder = 1
                  Width = 49
                end
                object cxLabel16: TcxLabel
                  Left = 20
                  Top = 56
                  Caption = #8251' 0:'#54364#49884' '#50504#54632', 1~9:n'#48516' '#46041#50504' '#51077#47141#51060' '#50630#51012' '#46412
                  Transparent = True
                end
                object cxLabel17: TcxLabel
                  Left = 16
                  Top = 82
                  Caption = #54868#47732#51012' '#50612#46177#44172' '#54364#49884#54624' '#49884#44036'('#48516')'
                  ParentFont = False
                  Style.Font.Charset = HANGEUL_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -13
                  Style.Font.Name = #47569#51008' '#44256#46357
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object Option465SpinEdit: TcxSpinEdit
                  Left = 246
                  Top = 81
                  Properties.Alignment.Horz = taCenter
                  Properties.AssignedValues.MinValue = True
                  Properties.MaxValue = 9.000000000000000000
                  Properties.OnChange = EditPropertiesChange
                  TabOrder = 4
                  Width = 49
                end
                object cxLabel18: TcxLabel
                  Left = 20
                  Top = 108
                  Caption = #8251' 0:'#50612#46177#44172' '#50504#54632', 1~9:n'#48516' '#46041#50504' '#51077#47141#51060' '#50630#51012' '#46412
                  Transparent = True
                end
                object cxLabel19: TcxLabel
                  Left = 16
                  Top = 136
                  Caption = #54868#47732#51012' '#50612#46177#44172' '#54624' '#46412' '#48157#44592
                  ParentFont = False
                  Style.Font.Charset = HANGEUL_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -13
                  Style.Font.Name = #47569#51008' '#44256#46357
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object cxLabel20: TcxLabel
                  Left = 20
                  Top = 162
                  Caption = #8251' 0~9:10~100%'
                  Transparent = True
                end
                object Option466SpinEdit: TcxSpinEdit
                  Left = 246
                  Top = 136
                  Properties.Alignment.Horz = taCenter
                  Properties.AssignedValues.MinValue = True
                  Properties.MaxValue = 9.000000000000000000
                  Properties.OnChange = EditPropertiesChange
                  TabOrder = 8
                  Width = 49
                end
              end
              object CheckMenuButtonEdit: TcxButtonEdit
                Left = 754
                Top = 10
                ParentFont = False
                ParentShowHint = False
                Properties.Buttons = <
                  item
                    Default = True
                    Kind = bkEllipsis
                  end>
                Properties.ReadOnly = True
                Properties.OnButtonClick = TableDefaultMenuEditPropertiesButtonClick
                Properties.OnChange = EditPropertiesChange
                ShowHint = True
                Style.Shadow = False
                Style.StyleController = EditStyleController
                TabOrder = 7
                Width = 101
              end
              object cxLabel1: TcxLabel
                Left = 625
                Top = 48
                Caption = #52395' '#51452#47928' '#52572#49548' '#51452#47928#49688#47049
                ParentFont = False
                Style.Font.Charset = HANGEUL_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = #47569#51008' '#44256#46357
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object Option419SpinEdit: TcxSpinEdit
                Left = 806
                Top = 46
                Properties.Alignment.Horz = taCenter
                Properties.AssignedValues.MinValue = True
                Properties.MaxValue = 9.000000000000000000
                Properties.OnChange = EditPropertiesChange
                TabOrder = 9
                Width = 49
              end
              object cxLabel2: TcxLabel
                Left = 625
                Top = 68
                Caption = '('#44256#44061' '#52628#51221#47700#45684#47196' '#52404#53356')'
                Transparent = True
              end
              object Option361CheckBox: TcxCheckBox
                Left = 620
                Top = 138
                Caption = ' '#54788#44552#44208#51228' '#50836#52397' '#49884' '#51452#47928#49436#47484' '#52636#47141#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 11
              end
              object cxLabel3: TcxLabel
                Left = 629
                Top = 164
                Caption = '('#44592#48376' '#51076#49884#51452#47928')'
                Transparent = True
              end
              object Option476CheckBox: TcxCheckBox
                Left = 620
                Top = 190
                Caption = ' '#54788#44552#44208#51228#50836#52397' '#44592#45733#51012' '#49324#50857#54616#51648' '#50506#49845#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 13
              end
              object Option479CheckBox: TcxCheckBox
                Left = 620
                Top = 242
                Caption = ' '#45796#44397#50612' '#44592#45733#51012' '#49324#50857#54616#51648' '#50506#49845#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 14
              end
              object cxGroupBox29: TcxGroupBox
                Left = 267
                Top = 287
                Caption = ' VAN'#51221#48372
                ParentFont = False
                Style.Font.Charset = HANGEUL_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = #47569#51008' '#44256#46357
                Style.Font.Style = []
                Style.IsFontAssigned = True
                TabOrder = 15
                Height = 85
                Width = 334
                object Label215: TLabel
                  Left = 83
                  Top = 20
                  Width = 40
                  Height = 17
                  Caption = 'VAN'#49324
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = #47569#51008' '#44256#46357
                  Font.Style = []
                  ParentFont = False
                  Transparent = True
                end
                object Option468ComboBox: TcxComboBox
                  Left = 138
                  Top = 16
                  ParentFont = False
                  Properties.Alignment.Horz = taLeftJustify
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #49324#50857#50504#54632
                    #45208#51060#49828#54168#51060#47676#52768
                    #53076#48180
                    #53076#49464#49828)
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 0
                  Text = #49324#50857#50504#54632
                  Width = 121
                end
                object cxLabel23: TcxLabel
                  Left = 43
                  Top = 46
                  Caption = #51452#47928#47700#45684' '#54364#49884
                  ParentFont = False
                  Style.Font.Charset = HANGEUL_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -13
                  Style.Font.Name = #47569#51008' '#44256#46357
                  Style.Font.Style = []
                  Style.IsFontAssigned = True
                  Transparent = True
                end
                object Option469ComboBox: TcxComboBox
                  Left = 138
                  Top = 45
                  ParentFont = False
                  Properties.Alignment.Horz = taLeftJustify
                  Properties.DropDownListStyle = lsFixedList
                  Properties.Items.Strings = (
                    #54364#49884#50504#54632
                    #51452#47928' '#54980' 5'#48516
                    #51452#47928' '#54980' 10'#48516
                    #51452#47928' '#54980' 15'#48516
                    #51452#47928' '#54980' 20'#48516
                    #51452#47928' '#54980' 30'#48516
                    #51452#47928' '#54980' 40'#48516
                    #51452#47928' '#54980' 50'#48516
                    #51452#47928' '#54980' 60'#48516
                    '')
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 2
                  Width = 120
                end
              end
              object cxLabel4: TcxLabel
                Left = 625
                Top = 101
                Caption = #44256#44061#49688' '#52404#53356
                ParentFont = False
                Style.Font.Charset = HANGEUL_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = #47569#51008' '#44256#46357
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object Option475ComboBox: TcxComboBox
                Left = 704
                Top = 99
                ParentFont = False
                Properties.Alignment.Horz = taLeftJustify
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  #54869#51064#54616#51648' '#50506#51020
                  #51452#47928' '#47700#45684#49688#47049#44284' '#44057#51648' '#50506#51004#47732' '#47561#55192
                  #51452#47928' '#47700#45684#49688#47049#44284' '#44057#51648' '#50506#51004#47732' '#54869#51064)
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 17
                Text = #54869#51064#54616#51648' '#50506#51020
                Width = 217
              end
              object Option463CheckBox: TcxCheckBox
                Left = 622
                Top = 270
                Caption = ' '#52628#44032' '#51452#47928' '#49884' '#44592#51316' '#51452#47928#45236#50669#51012' '#54869#51064#54633#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                Style.TransparentBorder = False
                TabOrder = 18
              end
              object cxLabel9: TcxLabel
                Left = 641
                Top = 292
                Caption = '('#51452#47928#51204#50857'/'#49440#54980#48520' '#48373#54633#47588#51109#47564' '#51201#50857')'
                Transparent = True
              end
              object Option460CheckBox: TcxCheckBox
                Left = 622
                Top = 218
                Caption = ' '#45908#52824#54168#51060' '#44592#45733#51012' '#49324#50857#54616#51648' '#50506#49845#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                Style.TransparentBorder = False
                TabOrder = 20
              end
              object Option473CheckBox: TcxCheckBox
                Left = 622
                Top = 319
                Caption = ' '#51109#48148#44396#45768#50640' '#48148#47196' '#51452#47928' '#44592#45733#51012' '#49324#50857#54616#51648' '#50506#49845#45768#45796'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                Style.TransparentBorder = False
                TabOrder = 21
              end
              object cxLabel10: TcxLabel
                Left = 618
                Top = 417
                Caption = #51020#49457#50504#45236
                ParentFont = False
                Style.Font.Charset = HANGEUL_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = #47569#51008' '#44256#46357
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object Option467ComboBox: TcxComboBox
                Left = 684
                Top = 415
                ParentFont = False
                Properties.Alignment.Horz = taLeftJustify
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  #47700#45684#51452#47928'+'#51452#47928#50756#47308
                  #51452#47928#50756#47308
                  #49324#50857#50504#54632)
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 23
                Text = #47700#45684#51452#47928'+'#51452#47928#50756#47308
                Width = 167
              end
              object Option496CheckBox: TcxCheckBox
                Left = 622
                Top = 349
                Caption = ' WiFI '#50672#44208#51060' '#45130#44220#51012' '#46412' '#44221#44256#51020#51004#47196' '#50508#47548
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                Style.TransparentBorder = False
                TabOrder = 24
              end
              object cxLabel11: TcxLabel
                Left = 602
                Top = 448
                Caption = #48176#53552#47532' '#50508#47548
                ParentFont = False
                Style.Font.Charset = HANGEUL_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = #47569#51008' '#44256#46357
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Transparent = True
              end
              object Option195ComboBox: TcxComboBox
                Left = 684
                Top = 446
                ParentFont = False
                Properties.Alignment.Horz = taLeftJustify
                Properties.DropDownListStyle = lsFixedList
                Properties.Items.Strings = (
                  #49324#50857#50504#54632
                  '20%'#48120#47564' '#51068#46412' '
                  '15%'#48120#47564' '#51068#46412
                  '10%'#48120#47564' '#51068#46412)
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 26
                Width = 167
              end
              object Option487CheckBox: TcxCheckBox
                Left = 622
                Top = 378
                Caption = ' '#51109#48148#44396#45768' '#54869#51064' '#47700#49464#51648' '#54364#49884' '#50504#54632'.'
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                Style.TransparentBorder = False
                TabOrder = 27
              end
            end
            object TableOption2TabSheet: TcxTabSheet
              Caption = #50741#49496'2'
              ImageIndex = 1
              OnShow = TableOption2TabSheetShow
              object AdvScrollBox18: TAdvScrollBox
                Left = 0
                Top = 0
                Width = 1279
                Height = 870
                Align = alClient
                DoubleBuffered = True
                Ctl3D = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                TabOrder = 0
                object Label216: TLabel
                  Left = 22
                  Top = 354
                  Width = 57
                  Height = 17
                  Caption = #52395#51452#47928' '#54980
                  Transparent = True
                end
                object Label217: TLabel
                  Left = 22
                  Top = 380
                  Width = 57
                  Height = 17
                  Caption = #54364#49884' '#47928#44396
                  Transparent = True
                end
                object Label218: TLabel
                  Left = 28
                  Top = 21
                  Width = 52
                  Height = 17
                  Caption = #44396#44544#44228#51221
                  Transparent = True
                end
                object Label229: TLabel
                  Left = 25
                  Top = 443
                  Width = 54
                  Height = 17
                  Caption = 'WiFi  SID'
                  Transparent = True
                end
                object Label230: TLabel
                  Left = 231
                  Top = 444
                  Width = 26
                  Height = 17
                  Caption = #50516#54840
                  Transparent = True
                end
                object Label232: TLabel
                  Left = 27
                  Top = 473
                  Width = 52
                  Height = 17
                  Caption = #51109#48148#44396#45768
                  Transparent = True
                end
                object POSIPLabel: TLabel
                  Left = 40
                  Top = 504
                  Width = 37
                  Height = 17
                  Caption = 'Pos IP'
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = #47569#51008' '#44256#46357
                  Font.Style = []
                  ParentFont = False
                  Transparent = True
                end
                object GoogleIDEdit: TcxTextEdit
                  Left = 84
                  Top = 18
                  ParentFont = False
                  Properties.MaxLength = 100
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 0
                  Width = 319
                end
                object cxGroupBox31: TcxGroupBox
                  Left = 420
                  Top = 15
                  Caption = ' '#51204#50896' '#50696#50557'ON/OFF'
                  ParentFont = False
                  Style.Font.Charset = HANGEUL_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -13
                  Style.Font.Name = #47569#51008' '#44256#46357
                  Style.Font.Style = []
                  Style.IsFontAssigned = True
                  TabOrder = 1
                  Height = 144
                  Width = 317
                  object Label219: TLabel
                    Left = 33
                    Top = 35
                    Width = 52
                    Height = 17
                    Caption = #51204#50896#53020#44592
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #47569#51008' '#44256#46357
                    Font.Style = []
                    ParentFont = False
                    Transparent = True
                  end
                  object Label220: TLabel
                    Left = 31
                    Top = 66
                    Width = 52
                    Height = 17
                    Caption = #51204#50896#45124#44592
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #47569#51008' '#44256#46357
                    Font.Style = []
                    ParentFont = False
                    Transparent = True
                  end
                  object SunCheckBox: TcxCheckBox
                    Left = 27
                    Top = 95
                    Caption = #51068
                    Properties.OnChange = EditPropertiesChange
                    Style.TextColor = 204
                    TabOrder = 0
                  end
                  object MonCheckBox: TcxCheckBox
                    Left = 65
                    Top = 95
                    Caption = #50900
                    Properties.OnChange = EditPropertiesChange
                    TabOrder = 1
                  end
                  object WedCheckBox: TcxCheckBox
                    Left = 146
                    Top = 95
                    Caption = #49688
                    TabOrder = 2
                  end
                  object TueCheckBox: TcxCheckBox
                    Left = 107
                    Top = 95
                    Caption = #54868
                    Properties.OnChange = EditPropertiesChange
                    TabOrder = 3
                  end
                  object ThuCheckBox: TcxCheckBox
                    Left = 182
                    Top = 95
                    Caption = #47785
                    Properties.OnChange = EditPropertiesChange
                    TabOrder = 4
                  end
                  object FriCheckBox: TcxCheckBox
                    Left = 219
                    Top = 95
                    Caption = #44552
                    Properties.OnChange = EditPropertiesChange
                    TabOrder = 5
                  end
                  object SatCheckBox: TcxCheckBox
                    Left = 255
                    Top = 95
                    Caption = #53664
                    Properties.OnChange = EditPropertiesChange
                    TabOrder = 6
                  end
                  object PowerOnTimeEdit: TcxTimeEdit
                    Left = 89
                    Top = 31
                    AutoSize = False
                    ParentFont = False
                    Properties.Alignment.Horz = taCenter
                    Properties.TimeFormat = tfHourMin
                    Properties.ValidateOnEnter = False
                    Properties.OnChange = EditPropertiesChange
                    Style.Font.Charset = DEFAULT_CHARSET
                    Style.Font.Color = clBlack
                    Style.Font.Height = -13
                    Style.Font.Name = #47569#51008' '#44256#46357
                    Style.Font.Style = []
                    Style.IsFontAssigned = True
                    TabOrder = 7
                    Height = 23
                    Width = 64
                  end
                  object PowerOffTimeEdit: TcxTimeEdit
                    Left = 89
                    Top = 63
                    AutoSize = False
                    ParentFont = False
                    Properties.Alignment.Horz = taCenter
                    Properties.TimeFormat = tfHourMin
                    Properties.ValidateOnEnter = False
                    Properties.OnChange = EditPropertiesChange
                    Style.Font.Charset = DEFAULT_CHARSET
                    Style.Font.Color = clBlack
                    Style.Font.Height = -13
                    Style.Font.Name = #47569#51008' '#44256#46357
                    Style.Font.Style = []
                    Style.IsFontAssigned = True
                    TabOrder = 8
                    Height = 23
                    Width = 64
                  end
                  object PowrOnOffButton: TAdvSmoothButton
                    Left = 173
                    Top = 61
                    Width = 78
                    Height = 28
                    Appearance.PictureAlignment = taCenter
                    Appearance.Font.Charset = HANGEUL_CHARSET
                    Appearance.Font.Color = clWhite
                    Appearance.Font.Height = -13
                    Appearance.Font.Name = #47569#51008' '#44256#46357
                    Appearance.Font.Style = []
                    Appearance.ShiftDown = 0
                    Appearance.FocusColor = clWhite
                    Appearance.SimpleLayout = True
                    Appearance.Rounding = 3
                    Status.Caption = '0'
                    Status.Appearance.Fill.Color = clWhite
                    Status.Appearance.Fill.ColorMirror = clNone
                    Status.Appearance.Fill.ColorMirrorTo = clNone
                    Status.Appearance.Fill.GradientType = gtSolid
                    Status.Appearance.Fill.GradientMirrorType = gtSolid
                    Status.Appearance.Fill.BorderColor = clGray
                    Status.Appearance.Fill.Rounding = 11
                    Status.Appearance.Fill.ShadowOffset = 0
                    Status.Appearance.Fill.Glow = gmNone
                    Status.Appearance.Font.Charset = DEFAULT_CHARSET
                    Status.Appearance.Font.Color = clBlack
                    Status.Appearance.Font.Height = -13
                    Status.Appearance.Font.Name = #47569#51008' '#44256#46357
                    Status.Appearance.Font.Style = []
                    Caption = #51201#50857
                    Color = 11031552
                    ParentFont = False
                    DisabledColor = clWhite
                    TabOrder = 9
                    ShowFocus = False
                    HorizontalSpacing = 0
                    VerticalSpacing = 0
                    Version = '2.2.2.0'
                    OnClick = PowrOnOffButtonClick
                    TMSStyle = 8
                  end
                end
                object cxGroupBox32: TcxGroupBox
                  Left = 420
                  Top = 175
                  Caption = ' '#55092#47924#51068
                  ParentFont = False
                  Style.StyleController = EditStyleController
                  TabOrder = 2
                  Height = 181
                  Width = 311
                  object HolidayListBox: TListBox
                    Left = 32
                    Top = 32
                    Width = 113
                    Height = 132
                    Margins.Left = 10
                    Font.Charset = HANGEUL_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = #47569#51008' '#44256#46357
                    Font.Style = []
                    ItemHeight = 21
                    ParentFont = False
                    TabOrder = 0
                  end
                  object ScheduleAddButton: TAdvSmoothButton
                    Left = 157
                    Top = 99
                    Width = 78
                    Height = 28
                    Appearance.PictureAlignment = taCenter
                    Appearance.Font.Charset = HANGEUL_CHARSET
                    Appearance.Font.Color = clWhite
                    Appearance.Font.Height = -13
                    Appearance.Font.Name = #47569#51008' '#44256#46357
                    Appearance.Font.Style = []
                    Appearance.ShiftDown = 0
                    Appearance.FocusColor = clWhite
                    Appearance.SimpleLayout = True
                    Appearance.Rounding = 3
                    Status.Caption = '0'
                    Status.Appearance.Fill.Color = clWhite
                    Status.Appearance.Fill.ColorMirror = clNone
                    Status.Appearance.Fill.ColorMirrorTo = clNone
                    Status.Appearance.Fill.GradientType = gtSolid
                    Status.Appearance.Fill.GradientMirrorType = gtSolid
                    Status.Appearance.Fill.BorderColor = clGray
                    Status.Appearance.Fill.Rounding = 11
                    Status.Appearance.Fill.ShadowOffset = 0
                    Status.Appearance.Fill.Glow = gmNone
                    Status.Appearance.Font.Charset = DEFAULT_CHARSET
                    Status.Appearance.Font.Color = clBlack
                    Status.Appearance.Font.Height = -13
                    Status.Appearance.Font.Name = #47569#51008' '#44256#46357
                    Status.Appearance.Font.Style = []
                    Caption = #52628#44032
                    Color = 11031552
                    ParentFont = False
                    DisabledColor = clWhite
                    TabOrder = 1
                    ShowFocus = False
                    HorizontalSpacing = 0
                    VerticalSpacing = 0
                    Version = '2.2.2.0'
                    OnClick = ScheduleAddButtonClick
                    TMSStyle = 8
                  end
                  object ScheduleDelButton: TAdvSmoothButton
                    Left = 157
                    Top = 134
                    Width = 78
                    Height = 28
                    Appearance.PictureAlignment = taCenter
                    Appearance.Font.Charset = HANGEUL_CHARSET
                    Appearance.Font.Color = clWhite
                    Appearance.Font.Height = -13
                    Appearance.Font.Name = #47569#51008' '#44256#46357
                    Appearance.Font.Style = []
                    Appearance.ShiftDown = 0
                    Appearance.FocusColor = clWhite
                    Appearance.SimpleLayout = True
                    Appearance.Rounding = 3
                    Status.Caption = '0'
                    Status.Appearance.Fill.Color = clWhite
                    Status.Appearance.Fill.ColorMirror = clNone
                    Status.Appearance.Fill.ColorMirrorTo = clNone
                    Status.Appearance.Fill.GradientType = gtSolid
                    Status.Appearance.Fill.GradientMirrorType = gtSolid
                    Status.Appearance.Fill.BorderColor = clGray
                    Status.Appearance.Fill.Rounding = 11
                    Status.Appearance.Fill.ShadowOffset = 0
                    Status.Appearance.Fill.Glow = gmNone
                    Status.Appearance.Font.Charset = DEFAULT_CHARSET
                    Status.Appearance.Font.Color = clBlack
                    Status.Appearance.Font.Height = -13
                    Status.Appearance.Font.Name = #47569#51008' '#44256#46357
                    Status.Appearance.Font.Style = []
                    Caption = #49325#51228
                    Color = 8355711
                    ParentFont = False
                    DisabledColor = clWhite
                    TabOrder = 2
                    ShowFocus = False
                    HorizontalSpacing = 0
                    VerticalSpacing = 0
                    Version = '2.2.2.0'
                    OnClick = ScheduleDelButtonClick
                    TMSStyle = 8
                  end
                end
                object TabletFirstOrderMemo: TcxMemo
                  Left = 98
                  Top = 346
                  Properties.MaxLength = 100
                  Properties.OnChange = EditPropertiesChange
                  TabOrder = 3
                  Height = 88
                  Width = 285
                end
                object TabletWaitImageGroupBox: TcxGroupBox
                  Left = 23
                  Top = 58
                  Caption = ' '#45824#44592#51060#48120#51648' '
                  ParentFont = False
                  Style.StyleController = EditStyleController
                  TabOrder = 8
                  Height = 285
                  Width = 377
                  object TableWaitImageLoadButton: TAdvGlowButton
                    Left = 16
                    Top = 235
                    Width = 93
                    Height = 31
                    Caption = #52628#44032
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
                      0D00000006624B474400FF00FF00FFA0BDA7930000025149444154388DCD94CD
                      4B546114879FF7DE997B9B9B4EDA9858290DA808214120D2266C53415B89366D
                      92D9F457B42A88FE83B0562148540BA9B611B49124ED4B52138D3ECC71C6D199
                      B933F7EB7D5B8C7355E6A3DCF5830B97C339CFF99DF7BDF7C0FF2E517DB9BAAE
                      BADC80EB48F40311340243E7D1E34EB10610A9C65D9F3101B7775BFCA314B83E
                      0670A7C2AF5A55187FAB358462C428D0AD7BFBE27B6B2335554D346665B86CE6
                      29298D54AE075B693539B591268A0A05808E426B70340D1DFA9EA49873693D6A
                      A2E995EA07C504CBBEC9A2675290F5BDD405BA4EC0EAC71C6E39C08CE92407DB
                      89181AB6D2785E8E379DA2A68D53F2F9FA2E4BA9E011F8123BEFB13C97C57324
                      F6B6C7DA721E7BDBABC7AA75582EFA2CCD66F09C605F5231EFB23093C66A8DA2
                      0228641DBA7AE3B4B4D77E18217073CD3EB13ABF45E0CBBA9DCB051FAF2C696D
                      335152F26DEE0B6DC7B358F116AC785F480EEF6A702AFD2AFBBB34D270961D69
                      C2C1B45E228D0F80DA81444B12EFC6CAE8F864E85049D5D01DBB49E8E614D2F8
                      0C40CFE10E324E1EDB776202267A9FA6D2E1A5040104BE6AFE38692247E6437E
                      AAFF1267DA93A179A9B8B5C7A1547F7318D17E028A6E2BC1CD812B0C25FA3869
                      2538DF799A7B9F9E010C85C0ED8C331BF8EA4233A0D02A8B28EB1678F1E32DC7
                      0EC599DE586426B3544D29EE02B7E45DA5544EA062D558AC259234CCE8299442
                      2A507EBF2EA579D6F69DC89BF579CE750C30BDB1C0FBCD95CA94424C1D745991
                      7C92BA266082DA9FE2BB441B3ED0720058191D9FD4041781D74009482B211E4A
                      B4E1D5D1FBBFFE00E67A0FA67A3463C10000000049454E44AE426082}
                    RepeatPause = 10
                    Rounded = False
                    TabOrder = 0
                    OnClick = TableWaitImageLoadButtonClick
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
                  object TableWaitImageDeleteButton: TAdvGlowButton
                    Left = 267
                    Top = 235
                    Width = 93
                    Height = 31
                    Caption = #49325#51228
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = #47569#51008' '#44256#46357
                    Font.Style = []
                    FocusType = ftHot
                    NotesFont.Charset = DEFAULT_CHARSET
                    NotesFont.Color = clWindowText
                    NotesFont.Height = -11
                    NotesFont.Name = 'Tahoma'
                    NotesFont.Style = []
                    ParentFont = False
                    Picture.Data = {
                      89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
                      0D00000006624B474400FF00FF00FFA0BDA7930000021849444154388DCD943D
                      6F134110869FD9DDBBBDCBD967E37C801470112AE482C226055D8A889FC0CFA0
                      42A2A345A2E01FA44442945488228836B210A2714314C94808210444F1C7F97C
                      B714C747EC8B13928AE95633EF33EFCCAE16FEF790E38727BB6FEB63A36551F1
                      898071943FD8BEFE6306F8F8E5BB08EDBD16E85CD0D79ECB265BF7EFDC1C2800
                      A5FDAD8BC300DC2DA5FD2D005534C8C3F3C88D31AC342E1158FF98C982A1CE12
                      8B9457BA5CABB15C8B596B344AB953815A6BA2680999BD3B06A3219369CAE160
                      50767F8A37C2204089C2063EE371F22773341C71341C9DA85AE8300C2C4A1569
                      DFF331BAE85D8D22026B17DA381168B4C1F3BCB9060181F5B9B2D2607D6D1563
                      F4BF014584300C4A85DA28D62FAFA194C2184D73B5C18A9F5337190AF7D7CCBC
                      30086CF96605EA950A466B04473CFC4C987C43968A74EA84AF99B90D3C37F3CA
                      34CD48D36CD69D567CE708806B72C8920CB1D69224092242E47B986472AFDBED
                      BE98033AA6D3B434EE740A49926095A3511D61ADA5D56AD1EFF789E318CFF3E8
                      F57A92E7F9C302E8D488637B5814159D2352C0FBFD3ECD66932CCBE8F57AC57C
                      221D059067935D90BDB380D9AF9E22421CC7645986528A6AB5FABB6430B3FD47
                      AF3ED45C3058F836AF8626B8C1F0BDEFFBCB1B1B1B1C1C1C50A95488E398FDFD
                      7D4464E75C7F1F40B7DBBDEB9C7B4AF9C97D0436CFFC1CE6A3DD6E3F13916DE7
                      DC1B60047C11911D60B3D3E97CFA09EBEA95837FA019160000000049454E44AE
                      426082}
                    RepeatPause = 10
                    Rounded = False
                    TabOrder = 1
                    OnClick = TableWaitImageDeleteButtonClick
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
                    Enabled = False
                  end
                  object Grid1: TcxGrid
                    Left = 16
                    Top = 27
                    Width = 343
                    Height = 202
                    TabOrder = 2
                    LookAndFeel.Kind = lfOffice11
                    LookAndFeel.NativeStyle = False
                    object StandbyImageGridTableView: TcxGridTableView
                      Navigator.Buttons.CustomButtons = <>
                      ScrollbarAnnotations.CustomAnnotations = <>
                      OnCellDblClick = StandbyImageGridTableViewCellDblClick
                      OnFocusedRecordChanged = StandbyImageGridTableViewFocusedRecordChanged
                      DataController.Summary.DefaultGroupSummaryItems = <>
                      DataController.Summary.FooterSummaryItems = <>
                      DataController.Summary.SummaryGroups = <>
                      OptionsSelection.CellSelect = False
                      OptionsView.GroupByBox = False
                      object StandbyImageGridTableViewSeq: TcxGridColumn
                        Caption = #49692#48264
                        DataBinding.ValueType = 'Integer'
                        DataBinding.FieldName = 'SEQ'
                        PropertiesClassName = 'TcxCurrencyEditProperties'
                        Properties.Alignment.Horz = taCenter
                        Properties.DisplayFormat = '#0'
                        HeaderAlignmentHorz = taCenter
                        Width = 48
                      end
                      object StandbyImageGridTableViewFileName: TcxGridColumn
                        Caption = #54868#51068#47749
                        DataBinding.FieldName = 'NM_CODE1'
                        HeaderAlignmentHorz = taCenter
                        Width = 272
                      end
                      object StandbyImageGridTableViewImageURL: TcxGridColumn
                        Visible = False
                      end
                    end
                    object cxGridLevel1: TcxGridLevel
                      GridView = StandbyImageGridTableView
                    end
                  end
                end
                object SchedulePanel: TAdvPanel
                  Left = 180
                  Top = 565
                  Width = 232
                  Height = 329
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = #47569#51008' '#44256#46357
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 9
                  UseDockManager = True
                  Visible = False
                  Version = '2.5.11.0'
                  BorderColor = clBlack
                  BorderWidth = 1
                  Caption.Color = clHighlight
                  Caption.ColorTo = clNone
                  Caption.Font.Charset = HANGEUL_CHARSET
                  Caption.Font.Color = clHighlightText
                  Caption.Font.Height = -20
                  Caption.Font.Name = #47569#51008' '#44256#46357
                  Caption.Font.Style = [fsBold]
                  Caption.Height = 45
                  Caption.Indent = 10
                  Caption.Text = '<P align="center"><FONT size="14"></FONT>'#48320#44221' '#54624' '#54252#49828'</P>'
                  Caption.TopIndent = 5
                  ColorTo = clWhite
                  DoubleBuffered = True
                  ShadowOffset = 5
                  ShowMoveCursor = True
                  StatusBar.Font.Charset = DEFAULT_CHARSET
                  StatusBar.Font.Color = clWindowText
                  StatusBar.Font.Height = -11
                  StatusBar.Font.Name = 'Tahoma'
                  StatusBar.Font.Style = []
                  Text = ''
                  FullHeight = 220
                  object CalendarView: TCalendarView
                    Left = 1
                    Top = 1
                    Width = 230
                    Height = 271
                    Date = 45330.000000000000000000
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -13
                    Font.Name = 'Segoe UI'
                    Font.Style = []
                    HeaderInfo.DaysOfWeekFont.Charset = DEFAULT_CHARSET
                    HeaderInfo.DaysOfWeekFont.Color = clWindowText
                    HeaderInfo.DaysOfWeekFont.Height = -13
                    HeaderInfo.DaysOfWeekFont.Name = 'Segoe UI'
                    HeaderInfo.DaysOfWeekFont.Style = []
                    HeaderInfo.Font.Charset = DEFAULT_CHARSET
                    HeaderInfo.Font.Color = clWindowText
                    HeaderInfo.Font.Height = -20
                    HeaderInfo.Font.Name = 'Segoe UI'
                    HeaderInfo.Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                  end
                  object ConfirmButton: TAdvSmoothButton
                    Left = 34
                    Top = 284
                    Width = 78
                    Height = 31
                    Appearance.PictureAlignment = taCenter
                    Appearance.Font.Charset = HANGEUL_CHARSET
                    Appearance.Font.Color = clWhite
                    Appearance.Font.Height = -13
                    Appearance.Font.Name = #47569#51008' '#44256#46357
                    Appearance.Font.Style = []
                    Appearance.ShiftDown = 0
                    Appearance.FocusColor = clWhite
                    Appearance.SimpleLayout = True
                    Appearance.Rounding = 3
                    Status.Caption = '0'
                    Status.Appearance.Fill.Color = clWhite
                    Status.Appearance.Fill.ColorMirror = clNone
                    Status.Appearance.Fill.ColorMirrorTo = clNone
                    Status.Appearance.Fill.GradientType = gtSolid
                    Status.Appearance.Fill.GradientMirrorType = gtSolid
                    Status.Appearance.Fill.BorderColor = clGray
                    Status.Appearance.Fill.Rounding = 11
                    Status.Appearance.Fill.ShadowOffset = 0
                    Status.Appearance.Fill.Glow = gmNone
                    Status.Appearance.Font.Charset = DEFAULT_CHARSET
                    Status.Appearance.Font.Color = clBlack
                    Status.Appearance.Font.Height = -13
                    Status.Appearance.Font.Name = #47569#51008' '#44256#46357
                    Status.Appearance.Font.Style = []
                    Caption = #54869#51064
                    Color = 11031552
                    ParentFont = False
                    DisabledColor = clWhite
                    TabOrder = 1
                    ShowFocus = False
                    HorizontalSpacing = 0
                    VerticalSpacing = 0
                    Version = '2.2.2.0'
                    OnClick = ConfirmButtonClick
                    TMSStyle = 8
                  end
                  object CancelButton: TAdvSmoothButton
                    Left = 123
                    Top = 284
                    Width = 78
                    Height = 31
                    Appearance.PictureAlignment = taCenter
                    Appearance.Font.Charset = HANGEUL_CHARSET
                    Appearance.Font.Color = clWhite
                    Appearance.Font.Height = -13
                    Appearance.Font.Name = #47569#51008' '#44256#46357
                    Appearance.Font.Style = []
                    Appearance.ShiftDown = 0
                    Appearance.FocusColor = clWhite
                    Appearance.SimpleLayout = True
                    Appearance.Rounding = 3
                    Status.Caption = '0'
                    Status.Appearance.Fill.Color = clWhite
                    Status.Appearance.Fill.ColorMirror = clNone
                    Status.Appearance.Fill.ColorMirrorTo = clNone
                    Status.Appearance.Fill.GradientType = gtSolid
                    Status.Appearance.Fill.GradientMirrorType = gtSolid
                    Status.Appearance.Fill.BorderColor = clGray
                    Status.Appearance.Fill.Rounding = 11
                    Status.Appearance.Fill.ShadowOffset = 0
                    Status.Appearance.Fill.Glow = gmNone
                    Status.Appearance.Font.Charset = DEFAULT_CHARSET
                    Status.Appearance.Font.Color = clBlack
                    Status.Appearance.Font.Height = -13
                    Status.Appearance.Font.Name = #47569#51008' '#44256#46357
                    Status.Appearance.Font.Style = []
                    Caption = #52712#49548
                    Color = 8355711
                    ParentFont = False
                    DisabledColor = clWhite
                    TabOrder = 2
                    ShowFocus = False
                    HorizontalSpacing = 0
                    VerticalSpacing = 0
                    Version = '2.2.2.0'
                    OnClick = CancelButtonClick
                    TMSStyle = 8
                  end
                end
                object cxGroupBox28: TcxGroupBox
                  Left = 418
                  Top = 362
                  Caption = ' '#50896#44201#51221#48372
                  ParentFont = False
                  Style.Font.Charset = HANGEUL_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -13
                  Style.Font.Name = #47569#51008' '#44256#46357
                  Style.Font.Style = []
                  Style.IsFontAssigned = True
                  TabOrder = 10
                  DesignSize = (
                    183
                    159)
                  Height = 159
                  Width = 183
                  object RustDeskPaintBox: TPaintBox
                    Left = 26
                    Top = 35
                    Width = 119
                    Height = 110
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    OnPaint = RustDeskPaintBoxPaint
                  end
                end
                object WifiSidEdit: TcxTextEdit
                  Left = 98
                  Top = 440
                  ParentFont = False
                  Properties.ImeMode = imDisable
                  Properties.MaxLength = 100
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 4
                  Width = 121
                end
                object WifiPwdEdit: TcxTextEdit
                  Left = 264
                  Top = 441
                  ParentFont = False
                  Properties.ImeMode = imDisable
                  Properties.MaxLength = 100
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 5
                  Width = 119
                end
                object ShoppingCartEdit: TcxTextEdit
                  Left = 98
                  Top = 471
                  ParentFont = False
                  Properties.ImeMode = imSHanguel
                  Properties.MaxLength = 100
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 6
                  Width = 121
                end
                object POSIPEdit: TcxTextEdit
                  Left = 98
                  Top = 502
                  ParentFont = False
                  Properties.ImeMode = imDisable
                  Properties.MaxLength = 15
                  Properties.ReadOnly = True
                  Properties.OnChange = EditPropertiesChange
                  Properties.OnValidate = EditPropertiesValidate
                  Style.StyleController = EditStyleController
                  TabOrder = 7
                  Width = 120
                end
                object Option497CheckBox: TcxCheckBox
                  Left = 98
                  Top = 536
                  Caption = ' '#54252#49828#50752' '#53468#48660#47551#51032' '#45348#53944#50892#53356#44032' '#45796#47492'('#54252#53944':17310)'
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  Style.TransparentBorder = False
                  TabOrder = 11
                end
                object LetsOrderMQCheckButton: TAdvGlowButton
                  Left = 225
                  Top = 502
                  Width = 128
                  Height = 25
                  Caption = #50672#44208#53580#49828#53944
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
                    0D000000097048597300002E2300002E230178A53F760000034F49444154789C
                    C5946D48536114C767A57D48997333776D11912F6B4458124505F525E8536024
                    1141655A91DAA4B4D21CDD9252CBAD9969B0344832A8D53475D5A4DCDD9AB7CD
                    A553E76585EEC5B997EBD2593398C9DC7DE2CEB49A06D32F1DF8F37039E7FE9E
                    3FE71C1E0AE57F0600208C3C711CAC728E8C9EB6D946F2866C0EAEC934948361
                    58CC5280CBC8D3E170B0AD3687D7621906838366E2F3672350ABBBB62F196837
                    D993FAF498E763976E5AABED9E423F744E2B14E8B6E0EAB079FA07D062B16C34
                    7C1A98ECC73E819EDE7EA25BA70708A2DA118AA9B0857A6830182099AC0D9136
                    BFEA6A7ED9AA6D943469C4627172F0EDE100808820CD7319526C691EDF7C5039
                    613C867ACC473B3CA6232ACFE021A567746FEB581E993F77F7F54AB158BCFC8F
                    CB974F4CFCE0B85C5F53EC2E570A8EBB37611816310764D53AF7C73FF502A8C1
                    ED8F6F7003E8F1988F2521C01AD16855A0400C02301886033DC4B0C1047DBFE1
                    7B4F2F06BA757D7EAD56476834DDA973C0B57CEB3E56ED17C01239A65922BB7F
                    ADC8EE83EADC609750D7297DF2F8EA33490BFF954C7E78B65EAFD7B3D5EA8F5E
                    558706289428A150A2A0AD4DFE7B6DA09BA67D5095134042EB345469F543C221
                    1FB37A14708ADAD5F959C72F72B9F91542614D7F7575C33AB25EA3D1705054EB
                    55A9D40051A80885A2E36F200BB6EC872AC701F30EEE670A70C014387DF13593
                    60F535EB3D327F5924A6DE2815BCE3F14A0293441024A155FAF65BD34B192169
                    7AE393344A7D2D2D2D5BE780F1D99D293199EF2DB4199969994A232DEBBD9B9E
                    89E693793EFF09E37A493972FE7C61C24C2F9115305C9D505454C5E6F1EE27F3
                    789589300C47FCB56F74CACE282A65378D42D9133DABD4D4D47032595E2EA25E
                    E195205C2E2F3130A3F4F4B9892F2A66A75A565646BB5478B53D2BB7783DF9CD
                    91BA981B9B1DF24489BD6BC30B9B36F1F9B09A5D6F4A0AFA9D5CE28544A164A7
                    A747161414AB05358F323AA44D2927EA55C7190F9D538C3A1CC43EB013AB6B47
                    409C08DFBE28976907D2324E9FC941CF9DCD7D97965BA689150C4C3204E62906
                    DF38155B61F4312B86831E8790E8338F03FD963939A602F7D2F92E40BFE52018
                    B747405C69880EFF740AFF0272602C32FA8C229B7AB2BD809A25BF107D4A9E17
                    95D3495FBCC310E2273028D9AC5190A3D60000000049454E44AE426082}
                  RepeatPause = 10
                  Rounded = False
                  TabOrder = 12
                  OnClick = LetsOrderMQCheckButtonClick
                  Appearance.BorderColor = 14727579
                  Appearance.BorderColorHot = 10079963
                  Appearance.BorderColorCheckedHot = 11565130
                  Appearance.BorderColorDown = 4548219
                  Appearance.BorderColorChecked = 4548219
                  Appearance.BorderColorDisabled = 13948116
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
                  Appearance.TextColorChecked = 3750459
                  Appearance.TextColorDown = 2303013
                  Appearance.TextColorHot = 2303013
                  Appearance.TextColorDisabled = 13948116
                end
              end
            end
          end
        end
        object TableLogOfficePage: TcxTabSheet
          Caption = #53468#48660#47551#49324#50857#47196#44536
          ImageIndex = 5
          OnShow = TableLogOfficePageShow
          DesignSize = (
            1279
            898)
          object cxGrid1: TcxGrid
            Left = 6
            Top = 43
            Width = 1267
            Height = 850
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            LookAndFeel.Kind = lfOffice11
            LookAndFeel.NativeStyle = False
            object TabletLogTableView: TcxGridTableView
              Tag = 99
              Navigator.Buttons.CustomButtons = <>
              ScrollbarAnnotations.CustomAnnotations = <>
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsView.GroupByBox = False
              object TabletLogTableViewColumn1: TcxGridColumn
                Caption = #48156#49373#51068#49884
                DataBinding.FieldName = 'DT_INSERT'
                PropertiesClassName = 'TcxLabelProperties'
                Properties.Alignment.Horz = taCenter
                HeaderAlignmentHorz = taCenter
                Options.Focusing = False
                Width = 109
              end
              object TabletLogTableViewColumn2: TcxGridColumn
                Caption = #53580#51060#48660#48264#54840
                DataBinding.FieldName = 'ACTION_NAME'
                PropertiesClassName = 'TcxLabelProperties'
                Properties.Alignment.Horz = taCenter
                HeaderAlignmentHorz = taCenter
                Options.Focusing = False
                Width = 99
              end
              object TabletLogTableViewColumn5: TcxGridColumn
                Caption = 'ActionName'
                HeaderAlignmentHorz = taCenter
                Options.Focusing = False
                Width = 128
              end
              object TabletLogTableViewColumn3: TcxGridColumn
                Caption = #47196#44536#45236#50857
                DataBinding.FieldName = 'LOG_TEXT'
                PropertiesClassName = 'TcxMemoProperties'
                HeaderAlignmentHorz = taCenter
                Width = 554
              end
              object TabletLogTableViewColumn4: TcxGridColumn
                Caption = #48260#51204
                DataBinding.FieldName = 'VERSION'
                PropertiesClassName = 'TcxLabelProperties'
                Properties.Alignment.Horz = taCenter
                HeaderAlignmentHorz = taCenter
                Width = 99
              end
            end
            object cxGridLevel2: TcxGridLevel
              GridView = TabletLogTableView
            end
          end
          object cxLabel5: TcxLabel
            Left = 10
            Top = 10
            AutoSize = False
            Caption = #51312#54924#51068#51088
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Transparent = True
            Height = 27
            Width = 65
            AnchorX = 43
            AnchorY = 24
          end
          object LogDateEdit: TcxDateEdit
            Left = 81
            Top = 10
            AutoSize = False
            ParentFont = False
            Properties.ImmediatePost = True
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.ShowToday = False
            Style.StyleController = EditStyleController
            TabOrder = 2
            Height = 25
            Width = 90
          end
          object TabletLogSearchButton: TAdvGlowButton
            Left = 182
            Top = 10
            Width = 86
            Height = 25
            Caption = #51312#54924
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            FocusType = ftHot
            NotesFont.Charset = DEFAULT_CHARSET
            NotesFont.Color = clWindowText
            NotesFont.Height = -11
            NotesFont.Name = 'Tahoma'
            NotesFont.Style = []
            ParentFont = False
            RepeatPause = 10
            Rounded = False
            TabOrder = 3
            OnClick = TabletLogSearchButtonClick
            Appearance.BorderColor = 14727579
            Appearance.BorderColorHot = 10079963
            Appearance.BorderColorCheckedHot = 11565130
            Appearance.BorderColorDown = 4548219
            Appearance.BorderColorChecked = 4548219
            Appearance.BorderColorDisabled = 13948116
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
            Appearance.TextColorChecked = 3750459
            Appearance.TextColorDown = 2303013
            Appearance.TextColorHot = 2303013
            Appearance.TextColorDisabled = 13948116
          end
          object TableLogCheckBox: TcxCheckBox
            Left = 282
            Top = 11
            Caption = #52572#44540' 7'#51068
            ParentFont = False
            Style.StyleController = EditStyleController
            Style.TransparentBorder = False
            TabOrder = 4
          end
        end
      end
    end
    object SmartPadPage: TcxTabSheet
      Caption = #49828#47560#53944#54056#46300
      ImageIndex = 6
      OnShow = SmartPadPageShow
      object cxGroupBox34: TcxGroupBox
        Left = 28
        Top = 75
        Caption = ' '#45824#44592' '#51060#48120#51648' '
        ParentFont = False
        Style.StyleController = EditStyleController
        TabOrder = 0
        Height = 285
        Width = 377
        object SmartPadImageAddButton: TAdvGlowButton
          Left = 83
          Top = 240
          Width = 93
          Height = 31
          Caption = #52628#44032
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
            0D00000006624B474400FF00FF00FFA0BDA7930000025149444154388DCD94CD
            4B546114879FF7DE997B9B9B4EDA9858290DA808214120D2266C53415B89366D
            92D9F457B42A88FE83B0562148540BA9B611B49124ED4B52138D3ECC71C6D199
            B933F7EB7D5B8C7355E6A3DCF5830B97C339CFF99DF7BDF7C0FF2E517DB9BAAE
            BADC80EB48F40311340243E7D1E34EB10610A9C65D9F3101B7775BFCA314B83E
            0670A7C2AF5A55187FAB358462C428D0AD7BFBE27B6B2335554D346665B86CE6
            29298D54AE075B693539B591268A0A05808E426B70340D1DFA9EA49873693D6A
            A2E995EA07C504CBBEC9A2675290F5BDD405BA4EC0EAC71C6E39C08CE92407DB
            89181AB6D2785E8E379DA2A68D53F2F9FA2E4BA9E011F8123BEFB13C97C57324
            F6B6C7DA721E7BDBABC7AA75582EFA2CCD66F09C605F5231EFB23093C66A8DA2
            0228641DBA7AE3B4B4D77E18217073CD3EB13ABF45E0CBBA9DCB051FAF2C696D
            335152F26DEE0B6DC7B358F116AC785F480EEF6A702AFD2AFBBB34D270961D69
            C2C1B45E228D0F80DA81444B12EFC6CAE8F864E85049D5D01DBB49E8E614D2F8
            0C40CFE10E324E1EDB776202267A9FA6D2E1A5040104BE6AFE38692247E6437E
            AAFF1267DA93A179A9B8B5C7A1547F7318D17E028A6E2BC1CD812B0C25FA3869
            2538DF799A7B9F9E010C85C0ED8C331BF8EA4233A0D02A8B28EB1678F1E32DC7
            0EC599DE586426B3544D29EE02B7E45DA5544EA062D558AC259234CCE8299442
            2A507EBF2EA579D6F69DC89BF579CE750C30BDB1C0FBCD95CA94424C1D745991
            7C92BA266082DA9FE2BB441B3ED0720058191D9FD4041781D74009482B211E4A
            B4E1D5D1FBBFFE00E67A0FA67A3463C10000000049454E44AE426082}
          RepeatPause = 10
          Rounded = False
          TabOrder = 0
          OnClick = SmartPadImageAddButtonClick
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
        object SmartPadImageDeleteButton: TAdvGlowButton
          Left = 200
          Top = 240
          Width = 93
          Height = 31
          Caption = #49325#51228
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          FocusType = ftHot
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          ParentFont = False
          Picture.Data = {
            89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
            0D00000006624B474400FF00FF00FFA0BDA7930000021849444154388DCD943D
            6F134110869FD9DDBBBDCBD967E37C801470112AE482C226055D8A889FC0CFA0
            42A2A345A2E01FA44442945488228836B210A2714314C94808210444F1C7F97C
            B714C747EC8B13928AE95633EF33EFCCAE16FEF790E38727BB6FEB63A36551F1
            898071943FD8BEFE6306F8F8E5BB08EDBD16E85CD0D79ECB265BF7EFDC1C2800
            A5FDAD8BC300DC2DA5FD2D005534C8C3F3C88D31AC342E1158FF98C982A1CE12
            8B9457BA5CABB15C8B596B344AB953815A6BA2680999BD3B06A3219369CAE160
            50767F8A37C2204089C2063EE371F22773341C71341C9DA85AE8300C2C4A1569
            DFF331BAE85D8D22026B17DA381168B4C1F3BCB9060181F5B9B2D2607D6D1563
            F4BF014584300C4A85DA28D62FAFA194C2184D73B5C18A9F5337190AF7D7CCBC
            30086CF96605EA950A466B04473CFC4C987C43968A74EA84AF99B90D3C37F3CA
            34CD48D36CD69D567CE708806B72C8920CB1D69224092242E47B986472AFDBED
            BE98033AA6D3B434EE740A49926095A3511D61ADA5D56AD1EFF789E318CFF3E8
            F57A92E7F9C302E8D488637B5814159D2352C0FBFD3ECD66932CCBE8F57AC57C
            221D059067935D90BDB380D9AF9E22421CC7645986528A6AB5FABB6430B3FD47
            AF3ED45C3058F836AF8626B8C1F0BDEFFBCB1B1B1B1C1C1C50A95488E398FDFD
            7D4464E75C7F1F40B7DBBDEB9C7B4AF9C97D0436CFFC1CE6A3DD6E3F13916DE7
            DC1B60047C11911D60B3D3E97CFA09EBEA95837FA019160000000049454E44AE
            426082}
          RepeatPause = 10
          Rounded = False
          TabOrder = 1
          OnClick = SmartPadImageDeleteButtonClick
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
          Enabled = False
        end
        object Grid4: TcxGrid
          Left = 16
          Top = 27
          Width = 343
          Height = 202
          TabOrder = 2
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
          object SmartPadView: TcxGridTableView
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            OnFocusedRecordChanged = SmartPadViewFocusedRecordChanged
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsSelection.CellSelect = False
            OptionsView.GroupByBox = False
            object cxGridColumn3: TcxGridColumn
              Caption = #49692#48264
              DataBinding.ValueType = 'Integer'
              DataBinding.FieldName = 'SEQ'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.DisplayFormat = '#0'
              HeaderAlignmentHorz = taCenter
              Width = 48
            end
            object cxGridColumn4: TcxGridColumn
              Caption = #54868#51068#47749
              DataBinding.FieldName = 'NM_CODE1'
              HeaderAlignmentHorz = taCenter
              Width = 272
            end
          end
          object cxGridLevel4: TcxGridLevel
            GridView = SmartPadView
          end
        end
      end
      object cxLabel6: TcxLabel
        Left = 41
        Top = 27
        Caption = #49324#51652#51204#54872
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Transparent = True
      end
      object WaitImageChangeTimeSpinEdit: TcxSpinEdit
        Left = 114
        Top = 25
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.MaxValue = 9.000000000000000000
        Properties.MinValue = 4.000000000000000000
        Properties.OnChange = WaitImageChangeTimeSpinEditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 2
        Value = 4
        Width = 48
      end
      object cxLabel7: TcxLabel
        Left = 168
        Top = 28
        Caption = #52488
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Transparent = True
      end
    end
  end
  object LogPanel: TAdvPanel [3]
    Left = 70
    Top = 800
    Width = 657
    Height = 559
    Color = clWhite
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    UseDockManager = True
    Visible = False
    Version = '2.5.11.0'
    BorderColor = clBlack
    BorderWidth = 1
    CanMove = True
    CanSize = True
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.CloseButton = True
    Caption.Font.Charset = HANGEUL_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -15
    Caption.Font.Name = #47569#51008' '#44256#46357
    Caption.Font.Style = [fsBold]
    Caption.Height = 25
    Caption.Indent = 0
    Caption.Text = '<P align="center">'#53468#48660#47551#47196#44536'</P>'
    Caption.Visible = True
    ColorTo = clWhite
    ColorMirror = clWhite
    ColorMirrorTo = clWhite
    DoubleBuffered = True
    HoverColor = clWhite
    Position.Key = 'SaleQuickShowForm'
    ShadowOffset = 5
    ShowMoveCursor = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    FullHeight = 108
    object LogMemo: TcxMemo
      Left = 1
      Top = 24
      Align = alClient
      TabOrder = 0
      Height = 534
      Width = 655
    end
  end
  object SearchPanel: TAdvPanel [4]
    Left = -34
    Top = 785
    Width = 657
    Height = 559
    Color = clWhite
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    UseDockManager = True
    Visible = False
    Version = '2.5.11.0'
    BorderColor = clBlack
    BorderWidth = 1
    CanMove = True
    CanSize = True
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.CloseButton = True
    Caption.Font.Charset = HANGEUL_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -15
    Caption.Font.Name = #47569#51008' '#44256#46357
    Caption.Font.Style = [fsBold]
    Caption.Height = 25
    Caption.Indent = 0
    Caption.Text = '<P align="center">'#44160#49353#44208#44284'</P>'
    Caption.Visible = True
    ColorTo = clWhite
    DoubleBuffered = True
    Position.Key = 'SaleQuickShowForm'
    ShadowOffset = 5
    ShowMoveCursor = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    FullHeight = 108
  end
  object StandbyImagePanel: TAdvPanel [5]
    Left = 370
    Top = 824
    Width = 680
    Height = 443
    Color = clWhite
    TabOrder = 9
    UseDockManager = True
    Visible = False
    Version = '2.5.11.0'
    BorderColor = clBlack
    BorderWidth = 1
    CanMove = True
    CanSize = True
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.CloseButton = True
    Caption.CloseMaxGlyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      200000000000000400000000000000000000000000000000000000000000131C
      3C471E2B5F700000000000000000000000000000000000000000000000000000
      00000000000000000000000000001F2D6375131C3C4700000000131C3C474260
      D0F64463D8FF1F2D617300000000000000000000000000000000000000000000
      00000000000000000000202E65774463D8FF4260D1F7131C3C472130687B4463
      D8FF4463D8FF4463D8FF1F2D6173000000000000000000000000000000000000
      000000000000202E65774463D8FF4463D8FF4463D8FF212F677A000000002231
      6C7F4463D8FF4463D8FF4463D8FF1F2D61730000000000000000000000000000
      0000202E65774463D8FF4463D8FF4463D8FF22316B7E00000000000000000000
      000022316C7F4463D8FF4463D8FF4463D8FF1F2D61730000000000000000202E
      65774463D8FF4463D8FF4463D8FF22316B7E0000000000000000000000000000
      00000000000022316C7F4463D8FF4463D8FF4463D8FF1F2D6173202E65774463
      D8FF4463D8FF4463D8FF22316B7E000000000000000000000000000000000000
      0000000000000000000022316C7F4463D8FF4463D8FF4463D8FF4463D8FF4463
      D8FF4463D8FF22316B7E00000000000000000000000000000000000000000000
      000000000000000000000000000022316C7F4463D8FF4463D8FF4463D8FF4463
      D8FF22316B7E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000202E65774463D8FF4463D8FF4463D8FF4463
      D8FF1F2D62740000000000000000000000000000000000000000000000000000
      00000000000000000000202E65774463D8FF4463D8FF4463D8FF4463D8FF4463
      D8FF4463D8FF1F2D627400000000000000000000000000000000000000000000
      000000000000202E65774463D8FF4463D8FF4463D8FF22316B7E22316C7F4463
      D8FF4463D8FF4463D8FF1F2D6274000000000000000000000000000000000000
      0000202E65774463D8FF4463D8FF4463D8FF21316A7D00000000000000002231
      6C7F4463D8FF4463D8FF4463D8FF1F2D6274000000000000000000000000202E
      65774463D8FF4463D8FF4463D8FF21316A7D0000000000000000000000000000
      000022316C7F4463D8FF4463D8FF4463D8FF1F2D6274000000001F2D63754463
      D8FF4463D8FF4463D8FF21316A7D000000000000000000000000000000000000
      00000000000022316C7F4463D8FF4463D8FF4463D8FF1E2C6172151E414D4261
      D3F94463D8FF21316A7D00000000000000000000000000000000000000000000
      0000000000000000000022316C7F4463D8FF4261D3F9151E424E00000000151E
      414D212F677A0000000000000000000000000000000000000000000000000000
      00000000000000000000000000002130687B151E414D00000000}
    Caption.Font.Charset = HANGEUL_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -13
    Caption.Font.Name = #47569#51008' '#44256#46357
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Height = 30
    Caption.Indent = 0
    Caption.ShadeLight = 255
    Caption.Text = '<FONT color="#FFFFFF">'#45824#44592#51060#48120#51648'</FONT>'
    Caption.TopIndent = 5
    Caption.Visible = True
    CollapsColor = clNone
    CollapsDelay = 0
    DoubleBuffered = True
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = clWhite
    StatusBar.GradientDirection = gdVertical
    StatusBar.TopIndent = 3
    Text = ''
    FullHeight = 310
    object StandbyViewImage: TcxImage
      Left = 7
      Top = 34
      Properties.FitMode = ifmStretch
      Properties.PopupMenuLayout.MenuItems = [pmiSave]
      TabOrder = 0
      Height = 399
      Width = 666
    end
  end
  object LogDataPanel: TAdvPanel [6]
    Left = 37
    Top = 734
    Width = 255
    Height = 318
    Color = clWhite
    TabOrder = 10
    UseDockManager = True
    Visible = False
    Version = '2.5.11.0'
    BorderColor = clBlack
    BorderWidth = 1
    CanMove = True
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.CloseButton = True
    Caption.CloseMaxGlyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      200000000000000400000000000000000000000000000000000000000000131C
      3C471E2B5F700000000000000000000000000000000000000000000000000000
      00000000000000000000000000001F2D6375131C3C4700000000131C3C474260
      D0F64463D8FF1F2D617300000000000000000000000000000000000000000000
      00000000000000000000202E65774463D8FF4260D1F7131C3C472130687B4463
      D8FF4463D8FF4463D8FF1F2D6173000000000000000000000000000000000000
      000000000000202E65774463D8FF4463D8FF4463D8FF212F677A000000002231
      6C7F4463D8FF4463D8FF4463D8FF1F2D61730000000000000000000000000000
      0000202E65774463D8FF4463D8FF4463D8FF22316B7E00000000000000000000
      000022316C7F4463D8FF4463D8FF4463D8FF1F2D61730000000000000000202E
      65774463D8FF4463D8FF4463D8FF22316B7E0000000000000000000000000000
      00000000000022316C7F4463D8FF4463D8FF4463D8FF1F2D6173202E65774463
      D8FF4463D8FF4463D8FF22316B7E000000000000000000000000000000000000
      0000000000000000000022316C7F4463D8FF4463D8FF4463D8FF4463D8FF4463
      D8FF4463D8FF22316B7E00000000000000000000000000000000000000000000
      000000000000000000000000000022316C7F4463D8FF4463D8FF4463D8FF4463
      D8FF22316B7E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000202E65774463D8FF4463D8FF4463D8FF4463
      D8FF1F2D62740000000000000000000000000000000000000000000000000000
      00000000000000000000202E65774463D8FF4463D8FF4463D8FF4463D8FF4463
      D8FF4463D8FF1F2D627400000000000000000000000000000000000000000000
      000000000000202E65774463D8FF4463D8FF4463D8FF22316B7E22316C7F4463
      D8FF4463D8FF4463D8FF1F2D6274000000000000000000000000000000000000
      0000202E65774463D8FF4463D8FF4463D8FF21316A7D00000000000000002231
      6C7F4463D8FF4463D8FF4463D8FF1F2D6274000000000000000000000000202E
      65774463D8FF4463D8FF4463D8FF21316A7D0000000000000000000000000000
      000022316C7F4463D8FF4463D8FF4463D8FF1F2D6274000000001F2D63754463
      D8FF4463D8FF4463D8FF21316A7D000000000000000000000000000000000000
      00000000000022316C7F4463D8FF4463D8FF4463D8FF1E2C6172151E414D4261
      D3F94463D8FF21316A7D00000000000000000000000000000000000000000000
      0000000000000000000022316C7F4463D8FF4261D3F9151E424E00000000151E
      414D212F677A0000000000000000000000000000000000000000000000000000
      00000000000000000000000000002130687B151E414D00000000}
    Caption.Font.Charset = HANGEUL_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -13
    Caption.Font.Name = #47569#51008' '#44256#46357
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Height = 30
    Caption.Indent = 0
    Caption.ShadeLight = 255
    Caption.Text = '<FONT color="#FFFFFF">'#51204#49569#51068#51088'</FONT>'
    Caption.TopIndent = 5
    Caption.Visible = True
    CollapsColor = clNone
    CollapsDelay = 0
    DoubleBuffered = True
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = clWhite
    StatusBar.GradientDirection = gdVertical
    StatusBar.TopIndent = 3
    Text = ''
    OnClose = LogDataPanelClose
    FullHeight = 310
    object LogCalendarView: TAdvSmoothCalendar
      Left = 1
      Top = 29
      Width = 253
      Height = 288
      Year = 2026
      Month = 1
      Fill.Color = clWhite
      Fill.ColorTo = clNone
      Fill.ColorMirror = clNone
      Fill.ColorMirrorTo = clNone
      Fill.GradientType = gtVertical
      Fill.GradientMirrorType = gtSolid
      Fill.BorderColor = clNone
      Fill.Rounding = 0
      Fill.ShadowOffset = 0
      Fill.Glow = gmNone
      DateAppearance.DateFont.Charset = DEFAULT_CHARSET
      DateAppearance.DateFont.Color = clBlack
      DateAppearance.DateFont.Height = -16
      DateAppearance.DateFont.Name = #47569#51008' '#44256#46357
      DateAppearance.DateFont.Style = []
      DateAppearance.DateFill.Color = clWhite
      DateAppearance.DateFill.ColorTo = clNone
      DateAppearance.DateFill.ColorMirror = clNone
      DateAppearance.DateFill.ColorMirrorTo = clNone
      DateAppearance.DateFill.GradientType = gtVertical
      DateAppearance.DateFill.GradientMirrorType = gtVertical
      DateAppearance.DateFill.BorderColor = clNone
      DateAppearance.DateFill.Rounding = 0
      DateAppearance.DateFill.ShadowOffset = 0
      DateAppearance.DateFill.Glow = gmNone
      DateAppearance.DayOfWeekFont.Charset = DEFAULT_CHARSET
      DateAppearance.DayOfWeekFont.Color = clBlack
      DateAppearance.DayOfWeekFont.Height = -16
      DateAppearance.DayOfWeekFont.Name = #47569#51008' '#44256#46357
      DateAppearance.DayOfWeekFont.Style = []
      DateAppearance.DayOfWeekFill.Color = clWhite
      DateAppearance.DayOfWeekFill.ColorTo = clNone
      DateAppearance.DayOfWeekFill.ColorMirror = clNone
      DateAppearance.DayOfWeekFill.ColorMirrorTo = clNone
      DateAppearance.DayOfWeekFill.GradientType = gtVertical
      DateAppearance.DayOfWeekFill.GradientMirrorType = gtSolid
      DateAppearance.DayOfWeekFill.BorderColor = clWhite
      DateAppearance.DayOfWeekFill.Rounding = 0
      DateAppearance.DayOfWeekFill.ShadowOffset = 0
      DateAppearance.DayOfWeekFill.Glow = gmNone
      DateAppearance.SelectedDateFont.Charset = DEFAULT_CHARSET
      DateAppearance.SelectedDateFont.Color = clBlack
      DateAppearance.SelectedDateFont.Height = -16
      DateAppearance.SelectedDateFont.Name = #47569#51008' '#44256#46357
      DateAppearance.SelectedDateFont.Style = []
      DateAppearance.SelectedDateFill.Color = 14925219
      DateAppearance.SelectedDateFill.ColorTo = clNone
      DateAppearance.SelectedDateFill.ColorMirror = clNone
      DateAppearance.SelectedDateFill.ColorMirrorTo = clNone
      DateAppearance.SelectedDateFill.GradientType = gtVertical
      DateAppearance.SelectedDateFill.GradientMirrorType = gtVertical
      DateAppearance.SelectedDateFill.BorderColor = 14925219
      DateAppearance.SelectedDateFill.Rounding = 0
      DateAppearance.SelectedDateFill.ShadowOffset = 0
      DateAppearance.SelectedDateFill.Glow = gmNone
      DateAppearance.CurrentDateFont.Charset = DEFAULT_CHARSET
      DateAppearance.CurrentDateFont.Color = 16744448
      DateAppearance.CurrentDateFont.Height = -16
      DateAppearance.CurrentDateFont.Name = #47569#51008' '#44256#46357
      DateAppearance.CurrentDateFont.Style = [fsBold]
      DateAppearance.CurrentDateFill.Color = clWhite
      DateAppearance.CurrentDateFill.ColorTo = clNone
      DateAppearance.CurrentDateFill.ColorMirror = clNone
      DateAppearance.CurrentDateFill.ColorMirrorTo = clNone
      DateAppearance.CurrentDateFill.GradientType = gtVertical
      DateAppearance.CurrentDateFill.GradientMirrorType = gtVertical
      DateAppearance.CurrentDateFill.BorderColor = 14925219
      DateAppearance.CurrentDateFill.Rounding = 0
      DateAppearance.CurrentDateFill.ShadowOffset = 0
      DateAppearance.CurrentDateFill.Glow = gmNone
      DateAppearance.WeekendFill.Color = clWhite
      DateAppearance.WeekendFill.ColorTo = clNone
      DateAppearance.WeekendFill.ColorMirror = clNone
      DateAppearance.WeekendFill.ColorMirrorTo = clNone
      DateAppearance.WeekendFill.GradientType = gtVertical
      DateAppearance.WeekendFill.GradientMirrorType = gtVertical
      DateAppearance.WeekendFill.BorderColor = clNone
      DateAppearance.WeekendFill.Rounding = 0
      DateAppearance.WeekendFill.ShadowOffset = 0
      DateAppearance.WeekendFill.Glow = gmNone
      DateAppearance.WeekendFont.Charset = DEFAULT_CHARSET
      DateAppearance.WeekendFont.Color = clBlack
      DateAppearance.WeekendFont.Height = -16
      DateAppearance.WeekendFont.Name = #47569#51008' '#44256#46357
      DateAppearance.WeekendFont.Style = []
      DateAppearance.HoverDateFont.Charset = DEFAULT_CHARSET
      DateAppearance.HoverDateFont.Color = 3881787
      DateAppearance.HoverDateFont.Height = -11
      DateAppearance.HoverDateFont.Name = 'Tahoma'
      DateAppearance.HoverDateFont.Style = []
      DateAppearance.HoverDateFill.Color = 15917525
      DateAppearance.HoverDateFill.ColorTo = clNone
      DateAppearance.HoverDateFill.ColorMirror = clNone
      DateAppearance.HoverDateFill.ColorMirrorTo = clNone
      DateAppearance.HoverDateFill.GradientType = gtVertical
      DateAppearance.HoverDateFill.GradientMirrorType = gtVertical
      DateAppearance.HoverDateFill.BorderColor = 15917525
      DateAppearance.HoverDateFill.Rounding = 0
      DateAppearance.HoverDateFill.ShadowOffset = 0
      DateAppearance.HoverDateFill.Glow = gmNone
      DateAppearance.MonthDateFont.Charset = DEFAULT_CHARSET
      DateAppearance.MonthDateFont.Color = clBlack
      DateAppearance.MonthDateFont.Height = -11
      DateAppearance.MonthDateFont.Name = 'Tahoma'
      DateAppearance.MonthDateFont.Style = []
      DateAppearance.YearDateFont.Charset = ANSI_CHARSET
      DateAppearance.YearDateFont.Color = clBlack
      DateAppearance.YearDateFont.Height = -16
      DateAppearance.YearDateFont.Name = #47569#51008' '#44256#46357
      DateAppearance.YearDateFont.Style = []
      DateAppearance.WeekNumbers.Font.Charset = DEFAULT_CHARSET
      DateAppearance.WeekNumbers.Font.Color = clWindowText
      DateAppearance.WeekNumbers.Font.Height = -11
      DateAppearance.WeekNumbers.Font.Name = 'Tahoma'
      DateAppearance.WeekNumbers.Font.Style = []
      DateAppearance.WeekNumbers.Fill.Color = clWhite
      DateAppearance.WeekNumbers.Fill.ColorTo = clNone
      DateAppearance.WeekNumbers.Fill.ColorMirror = clNone
      DateAppearance.WeekNumbers.Fill.ColorMirrorTo = clNone
      DateAppearance.WeekNumbers.Fill.GradientType = gtVertical
      DateAppearance.WeekNumbers.Fill.GradientMirrorType = gtSolid
      DateAppearance.WeekNumbers.Fill.BorderColor = clWhite
      DateAppearance.WeekNumbers.Fill.Rounding = 0
      DateAppearance.WeekNumbers.Fill.ShadowOffset = 0
      DateAppearance.WeekNumbers.Fill.Glow = gmNone
      DateAppearance.DisabledDateFont.Charset = DEFAULT_CHARSET
      DateAppearance.DisabledDateFont.Color = 13948116
      DateAppearance.DisabledDateFont.Height = -16
      DateAppearance.DisabledDateFont.Name = #47569#51008' '#44256#46357
      DateAppearance.DisabledDateFont.Style = []
      DateAppearance.DisabledDateFill.Color = clWhite
      DateAppearance.DisabledDateFill.ColorTo = clNone
      DateAppearance.DisabledDateFill.ColorMirror = clNone
      DateAppearance.DisabledDateFill.ColorMirrorTo = clNone
      DateAppearance.DisabledDateFill.GradientType = gtVertical
      DateAppearance.DisabledDateFill.GradientMirrorType = gtVertical
      DateAppearance.DisabledDateFill.BorderColor = clNone
      DateAppearance.DisabledDateFill.Rounding = 0
      DateAppearance.DisabledDateFill.ShadowOffset = 0
      DateAppearance.DisabledDateFill.Glow = gmNone
      DateAppearance.ShowDaysBefore = True
      DateAppearance.DateBeforeFill.Color = clNone
      DateAppearance.DateBeforeFill.ColorMirror = clNone
      DateAppearance.DateBeforeFill.ColorMirrorTo = clNone
      DateAppearance.DateBeforeFill.GradientType = gtVertical
      DateAppearance.DateBeforeFill.GradientMirrorType = gtSolid
      DateAppearance.DateBeforeFill.BorderColor = clNone
      DateAppearance.DateBeforeFill.Rounding = 0
      DateAppearance.DateBeforeFill.ShadowOffset = 0
      DateAppearance.DateBeforeFill.Glow = gmNone
      DateAppearance.DateAfterFill.Color = clNone
      DateAppearance.DateAfterFill.ColorMirror = clNone
      DateAppearance.DateAfterFill.ColorMirrorTo = clNone
      DateAppearance.DateAfterFill.GradientType = gtVertical
      DateAppearance.DateAfterFill.GradientMirrorType = gtSolid
      DateAppearance.DateAfterFill.BorderColor = clNone
      DateAppearance.DateAfterFill.Rounding = 0
      DateAppearance.DateAfterFill.ShadowOffset = 0
      DateAppearance.DateAfterFill.Glow = gmNone
      DateAppearance.DateBeforeFont.Charset = DEFAULT_CHARSET
      DateAppearance.DateBeforeFont.Color = clSilver
      DateAppearance.DateBeforeFont.Height = -11
      DateAppearance.DateBeforeFont.Name = 'Tahoma'
      DateAppearance.DateBeforeFont.Style = []
      DateAppearance.DateAfterFont.Charset = DEFAULT_CHARSET
      DateAppearance.DateAfterFont.Color = clSilver
      DateAppearance.DateAfterFont.Height = -11
      DateAppearance.DateAfterFont.Name = 'Tahoma'
      DateAppearance.DateAfterFont.Style = []
      StatusAppearance.Fill.Color = clRed
      StatusAppearance.Fill.ColorMirror = clNone
      StatusAppearance.Fill.ColorMirrorTo = clNone
      StatusAppearance.Fill.GradientType = gtSolid
      StatusAppearance.Fill.GradientMirrorType = gtSolid
      StatusAppearance.Fill.BorderColor = clGray
      StatusAppearance.Fill.Rounding = 0
      StatusAppearance.Fill.RoundingType = rtNone
      StatusAppearance.Fill.ShadowOffset = 0
      StatusAppearance.Fill.Glow = gmNone
      StatusAppearance.Font.Charset = DEFAULT_CHARSET
      StatusAppearance.Font.Color = clWhite
      StatusAppearance.Font.Height = -11
      StatusAppearance.Font.Name = 'Tahoma'
      StatusAppearance.Font.Style = []
      StatusAppearance.Glow = False
      Header.Fill.Color = clWhite
      Header.Fill.ColorTo = clNone
      Header.Fill.ColorMirror = clNone
      Header.Fill.ColorMirrorTo = clNone
      Header.Fill.GradientType = gtVertical
      Header.Fill.GradientMirrorType = gtSolid
      Header.Fill.BorderColor = clNone
      Header.Fill.Rounding = 0
      Header.Fill.ShadowOffset = 0
      Header.Fill.Glow = gmNone
      Header.ArrowColor = 4474440
      Header.Height = 30
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = 4474440
      Header.Font.Height = -20
      Header.Font.Name = #47569#51008' '#44256#46357
      Header.Font.Style = [fsBold]
      Footer.Fill.Color = clWhite
      Footer.Fill.ColorTo = clNone
      Footer.Fill.ColorMirror = clNone
      Footer.Fill.ColorMirrorTo = clNone
      Footer.Fill.GradientType = gtVertical
      Footer.Fill.GradientMirrorType = gtSolid
      Footer.Fill.BorderColor = clNone
      Footer.Fill.Rounding = 0
      Footer.Fill.ShadowOffset = 0
      Footer.Fill.Glow = gmNone
      Footer.Font.Charset = DEFAULT_CHARSET
      Footer.Font.Color = 4474440
      Footer.Font.Height = -11
      Footer.Font.Name = 'Tahoma'
      Footer.Font.Style = []
      Version = '2.5.2.3'
      OnDateDblClick = LogCalendarViewDateDblClick
      TabOrder = 0
      Align = alClient
      TMSStyle = 0
    end
  end
  inherited EditStyleController: TcxEditStyleController
    OnStyleChanged = nil
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited AdvOfficePagerOfficeStyler: TAdvOfficePagerOfficeStyler
    Left = 976
    Top = 256
  end
  inherited AdvPanelStyler: TAdvPanelStyler
    Left = 1072
    Top = 256
  end
  inherited AdvOfficeTabSetOfficeStyler: TAdvOfficeTabSetOfficeStyler
    Left = 352
    Top = 272
  end
  object KDSColorDialog: TColorDialog
    Left = 211
    Top = 66
  end
  object FunctionKeyPopup: TPopupMenu
    Left = 292
    Top = 34
    object FunctionKeyPopupDelete: TMenuItem
      Caption = #44592#45733' '#49325#51228'(&D)'
    end
    object FunctionKeyPopupLine: TMenuItem
      Caption = '-'
    end
    object FunctionKeyPopupBackColor: TMenuItem
      Caption = #48148#53461#49353' '#48148#44984#44592'(&B)...'
    end
    object FunctionKeyPopupForeColor: TMenuItem
      Caption = #44544#51088#49353' '#48148#44984#44592'(&F)...'
    end
    object FunctionKeyPopupColorCopy: TMenuItem
      Caption = #49353#44628' '#48373#49324'(&C)'
    end
    object FunctionKeyPopupColorPaste: TMenuItem
      Caption = #49353#44628' '#48537#50668#45347#44592'(&V)'
    end
  end
  object ImageList1: TImageList
    Left = 378
    Top = 34
    Bitmap = {
      494C010107000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      000000000000000000000000000000000000000000000000000E0000000E0000
      000E0000000E0000000E0000000E0000000E0000000E0000000E0000000E0000
      000E0000000E0000000E0000000E000000060000000000000000010101030A09
      071F0F0D0A2F0F0D0A2F0F0D0A2F0F0D0A2F0F0D0A2F0F0D0A2F0F0D0A2F0F0D
      0A2F0C0B09270101010400000000000000000000000000000000000000000000
      000000000000000000000000000000000000060A0D470E1820A80E1820A80E18
      20A8060A0D470000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000004040431CFCCC7FFD9D6D0FFE1DD
      D8FFE8E4DFFFEEEBE6FFF4F0EBFFF9F5F0FFFBF8F2FFF7F3EEFFF2EFEAFFECE8
      E3FFE5E2DCFFDEDAD5FFD7D4CEFFB6B3ADFB00000000000000000D0C09293731
      26B0453E30DD453E30DD494233DD5F5746DD655C4BDD4B4335DD453E30DD453E
      30DD403A2DCE14120D3E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000E1820A077C4FFFF77C4FFFF77C4
      FFFF0E1820A00000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002F2E2C4294928FFF060607FF0606
      06FF050506FF050505FF040405FF040404FF040404FF040404FF040505FF0505
      05FF050606FF060606FF000001FFCBC7C2FF00000000000000001A1712524F47
      37E8726551FF726551FF746753FF7F725DFF82745FFF756854FF726551FF7265
      51FF574E3DFF27221B7B00000000000000000000000000000000000000000000
      000000000000000000000000000000000016203747D477C4FFFF77C4FFFF77C4
      FFFF192935BE0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D2C2A42979591FF131313FF1717
      17FF161616FF171717FF141414FF171717FF121212FF151515FF171717FF1616
      16FF171717FF151515FF0B0B0BFFCAC7C2FF00000000000000001B1813557D70
      5BEAFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDE
      BBFF95856DFF28231C8000000000000000000000000000000000000000000000
      00000000000000000000000000000E171D9972BCF4FF77C4FFFF77C4FFFF77C4
      FFFF2B475BDE0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D2C2A42989693FF191919FF1D1D
      1DFF1E1E1EFF202020FF1C1C1CFF1D1D1DFF191919FF1A1A1AFF1D1D1DFF1D1D
      1DFF202020FF1D1D1DFF121212FFCAC7C1FF00000000000000001B1813557F70
      5CEAFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDE
      BBFF97866EFF28231C8000000000000000001010106E494848DC22201FE65943
      22DB594322DB594322DB594322DB2A261DF15790BBFF77C4FFFF77C4FFFF77C4
      FFFF425966F8604423E2553D21DC130E076D0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D2C2A429B9995FF1F1F1FFF2929
      29FF2B2B2BFF2A2A2AFF292929FF282828FF292929FF222222FF292929FF2B2B
      2BFF2A2A2AFF292929FF181818FFCAC6C1FF00000000000000001B1813557F70
      5CEAFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDE
      BBFF97866EFF28231C800000000000000000181818A0CAC5C6FF524F4DE7E7AA
      5AFF947049FF57463FFF947049FF655841FF3B627FFF5790BBFF5790BBFF5790
      BBFF445C6FFF946E45FFE7AA5AFF1D150BA00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D2C2A429D9B98FF2C2C2CFF2E2E
      2EFF303030FF323232FF353535FF2D2D2DFF2B2B2BFF242424FF262626FF2727
      27FF282828FF2B2B2BFF202020FFCAC6C1FF00000000000000001B1813557F70
      5CEAFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDE
      BBFF97866EFF28231C800000000000000000181818A0CAC5C6FF524F4DE7E7AA
      5AFF4A4356FF4362FFFF4A4356FFA9824CFF242726FF3F617AFF31404AFF252E
      3CFF293E7EFF4A4356FFE7AA5AFF1D150BA00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D2C2A429F9D9AFF414141FF4848
      48FF4C4C4CFF434343FF474747FF4B4B4BFF464646FF4D4D4DFF474747FF4141
      41FF383838FF3D3D3DFF262626FFC9C6C1FF00000000000000001B1813557F70
      5CEAFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDE
      BBFF97866EFF28231C800000000000000000181818A0CAC5C6FF524F4DE7E7AA
      5AFF4D4040FF343762FF4D4040FFE7AA5AFF655841FF495E6AFFC79047FF4D40
      40FF343762FF4D4040FFE7AA5AFF1D150BA00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D2C2A42A19F9CFF3B3B3BFF3E3E
      3EFF404040FF434343FF494949FF454545FF4A4A4AFF434343FF464646FF4949
      49FF424242FF3B3B3BFF2F2F2FFFC9C6C0FF00000000000000001B1813557F70
      5CEAFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDE
      BBFF97866EFF28231C800000000000000000181818A0CAC5C6FF524F4DE7E7AA
      5AFF947049FF57463FFF947049FFD99F54FF2D2A29FF455C6EFFDA9E4FFF9470
      49FF57463FFF947049FFE7AA5AFF1D150BA00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D2C2A42A3A19EFF4B4B4BFF5858
      58FF5E5E5EFF606060FF5C5C5CFF646464FF5F5F5FFF585858FF616161FF6565
      65FF676767FF676767FF343435FFC9C5C0FF00000000000000001B1813557F70
      5CEAFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDE
      BBFF97866EFF28231C800000000000000000181818A07E7B7BFF524F4DE7E7AA
      5AFF4A4356FF4362FFFF4A4356FFAD7F43FF253786FF1B2953FFAD7F43FF4A43
      56FF4362FFFF4A4356FFE7AA5AFF1D150BA00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D2C2A42A5A3A0FF515151FF5E5E
      5EFF5E5E5EFF686868FF585858FF636363FF545454FF5D5D5DFF656565FF6565
      65FF6F6F6FFF616161FF575758FFC7C4BEFF00000000000000001B1813557F70
      5CEAFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDE
      BBFF97866EFF28231C800000000000000000181818A0B1ACADFF524F4DE7E7AA
      5AFF4D4040FF343762FF4D4040FFBC8A49FF292B4AFF292B4AFFBC8A49FF4D40
      40FF343762FF4D4040FFE7AA5AFF1D150BA00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D2C2A42A7A5A1FF5C5C5CFF6A6A
      6AFF6F6F6FFF707070FF6E6E6EFF6E6E6EFF656565FF686868FF717171FF7474
      74FF767676FF767676FF5D5D5CFFC7C3BEFF00000000000000001B1813557F70
      5CEAFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDE
      BBFF97866EFF28231C800000000000000000181818A0CAC5C6FF524F4DE7E7AA
      5AFF947049FF57463FFF947049FFD99F54FF5F4B3FFF5F4B3FFFD99F54FF9470
      49FF57463FFF947049FFE7AA5AFF1D150BA00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D2C2A42A7A5A2FF5A5A5AFF5C5C
      5CFF5E5E5EFF605F5FFF616161FF636262FF646463FF646464FF656564FF6565
      65FF656565FF656565FF616061FFC7C3BEFF00000000000000001B1813557F70
      5CEAFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDEBBFFFBDE
      BBFF97866EFF28231C800000000000000000181818A0CAC5C6FF524F4DE7E7AA
      5AFF4A4356FF4362FFFF4A4356FFAD7F43FF3249BFFF3249BFFFAD7F43FF4A43
      56FF4362FFFF4A4356FFE7AA5AFF1D150BA00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002928273DC3C0BBFFC9C6C0FFCECA
      C5FFD2CFCAFFD6D3CEFFDAD7D1FFDDD9D5FFDEDBD6FFDCD8D3FFD9D5D0FFD5D1
      CCFFD0CDC8FFCCC8C3FFC7C4BFFFBAB7B1FF00000000000000001916124F6D61
      4FE7CDB698FFCDB698FFCDB698FFCDB698FFCDB698FFCDB698FFCDB698FFCDB6
      98FF81735DFF25211A760000000000000000181818A0CAC5C6FF524F4DE7E7AA
      5AFF4D4040FF343762FF4D4040FFBC8A49FF292B4AFF292B4AFFBC8A49FF4D40
      40FF343762FF4D4040FFE7AA5AFF1D150BA00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C9C7C2FFCDCBC7FFD5D3
      CFFFDDDCD8FFE6E4E3FFEDECEBFFF3F4F2FFF6F6F5FFF1F0F0FFEAE9E8FFE3E1
      DEFFDAD8D5FFD2D0CCFFCBC9C4FF777571A800000000000000000907061B342F
      2597534B3BCC534B3BCC534B3BCC534B3BCC534B3BCC534B3BCC534B3BCC534B
      3BCC3F392DB60C0B082600000000000000001918189BC4BFC0FF524F4DE7E7AA
      5AFFE7AA5AFFE7AA5AFFE7AA5AFFE7AA5AFFE7AA5AFFE7AA5AFFE7AA5AFFE7AA
      5AFFE7AA5AFFE7AA5AFFE0A557FF1C150B9B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000030303201B1B1B981C1A189A2118
      0D9B21180D9B21180D9B21180D9B21180D9B21180D9B21180D9B21180D9B2118
      0D9B21180D9B21180D9B1F170C98040301200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCAFA2FFB88D79FFB88D79FFB88D
      79FFB88D79FFEFECEAFFFFFFFFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F5DDD2FFF4DBCFFFB39A8BFF9B81
      6EFFF2D4C6FFA9816CFFFFFFFFFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C7CAFF667286FF8787
      87FFFEFEFEFF000000008A8A8AFF9D9D9DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A4D1C2FFA2D0
      C1FF8FBDADFF8DBAABFF89B7A8FF88B5A6FF85B3A4FF85B3A4FF88B5A6FF89B7
      A8FF8BB9A9FFA5D3C4FF0000000000000000F7E2D7FFF6DFD4FFF5DCD1FFF4DB
      CEFFF3D8CBFFA9816CFFFFFFFFFF000000000000000000000000000000000000
      000000000000000000000000000000000000000000004AA2E9FF58C9FFFF2766
      AEFFF5F5F5FF888888FFE2E2E2FF464646FF858585FF868686FF868686FF8686
      86FF868686FFB8B8B8FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000080808000000000000000000089B6A7FF79A6
      97FF6F9D8DFF629081FF5B8979FF598677FF528071FF528071FF4F7D6DFF4D7B
      6CFF528071FF85B3A4FF0000000000000000F8E6DEFF8C7463FF785F4CFF684D
      39FFC0AA9EFFA9816CFF806855FF745B47FF715844FF6F5440FF6D523DFF6A4F
      3BFF684D38FF664B36FF644934FF634833FF000000001F8FEFFF17A8FFFF1061
      BAFFC3C3C3FF8D8D8DFFD1D1D1FF818181FFFAFAFAFFF2F2F2FFE8E8E8FF9090
      90FF8B8B8BFF919191FF0000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008080800080808000000000000000000083B1A1FF79A7
      98FF6F9D8DFF629081FF5C897AFF538171FF517E6FFF4C796AFF497768FF4573
      64FF4D7B6CFF7DAB9CFF0000000000000000F9EBE4FFA18B7CFF8D7462FF785E
      4BFFC5AFA4FFA9816CFFF8E9E1FFF7E4DBFFF6E1D7FFF5DED2FFF4DACEFFF3D7
      CAFFF2D4C6FFF2D1C2FFF0CEBEFF654935FF000000002E99F0FF14A1FFFF0653
      B8FFF6F6F6FFF0F0F0FFA7A7A7FF6B6B6BFFB8B8B8FF919191FF676767FF6161
      61FFF8F8F8FF000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008080800000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008080800080808000000000000000000078A596FF85B3
      A4FF7BA999FF72A091FF6B9989FF639181FF5B8979FF528071FF4D7B6CFF4A78
      69FF4F7D6DFF78A596FF0000000000000000FAEEEAFFB5A193FFA28C7BFF8C75
      62FFC5AFA4FFA9816CFFBCA89AFFE1DCD8FFDFD2CAFFDDC8BBFFDBBFADFFDBBB
      A7FFCFB4A3FFF2D3C5FFF1D1C2FF674D38FF0000000064B6F2FF69CFFFFF4280
      B9FF595959FF59595BFF6F79A2FF3D4050FFC6C6C7FFCBCBCDFFB9BBBAFF6566
      65FF4A4A4AFF4F4F4FFF494949FFECECECFFFFFFFF0080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800080808000808080008080800000000000000000006E9C8DFF91BF
      B0FF88B5A6FF7EAC9DFF78A596FF6E9C8DFF659384FF5C897AFF538171FF4E7C
      6DFF538171FF6E9C8DFF0000000000000000FBF2EEFFC5B2A4FFB5A192FFA28B
      7BFFC5AFA4FFA47D68FFBCA89AFFFDF7F5FFFBF3EEFFF9EEE7FFF8E8E0FFF6E2
      D9FFCFB4A3FFF3D6C9FFF2D4C6FF6A4F3BFF000000007A96DAFF83BCEFFF6C76
      8CFFE6E5E5FF4980DDFF5DB8FFFF55ADFEFF969899FFDBDDDFFFB3B7B5FF9CA0
      9EFF9D9D99FF939595FF808080FFEAEAEAFFFFFFFF0080808000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008080800080808000808080000000000000000000699788FF9BC9
      B9FF94C1B2FF8BB9A9FF83B1A1FF7AA899FF719E8FFF6A9889FF639181FF5381
      71FF5B8979FF629081FF0000000000000000FCF6F3FFA08573FFA08573FFA085
      73FFD7C6BBFF94705CFFC2AEA0FFFDFBF9FFFCF7F4FFFBF3EEFFF9EDE7FFF8E7
      DFFFD1C1B6FFF4D9CDFFF2D6C8FF6D543FFFFEFEFEFF85868AFFF6F5F4FF494C
      51FFE3D3C5FF2463D5FF1A8FFFFF198CFEFF957C33FFFBD859FFF1BA4BFFE99A
      3DFFDE7D31FFC7906BFF868686FFEAEAEAFFFFFFFF0080808000000000008080
      800080808000000000008080800000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008080800080808000808080000000000000000000689586FFA6D4
      C5FF9DCABBFF95C3B4FF8DBAABFF87B5A5FF7EAC9DFF75A394FF6B9989FF6391
      81FF639181FF5C897AFF0000000000000000F0CCBCFFE7C6B7FFE6C4B5FFE4C2
      B2FFDDC1B5FF83624EFFCBB6A8FFFFFDFDFFFDFBF9FFFDF6F3FFFBF2EDFFF9ED
      E7FFD1C1B6FFF4DCD0FFF4D9CDFF715743FF9B9DA0FFFDFDFDFFF9F9F9FFE6E6
      E6FF736659FF2A65D6FF1A8CFFFF0170FEFF93752FFFF7C74EFFF0B144FFE692
      36FFDB7129FFC68761FF8A8A8AFFEAEAEAFFFFFFFF0080808000000000008080
      800000000000000080000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008080800080808000808080000000000000000000679585FFB1DF
      D0FFA9D6C7FFA0CDBEFF99C6B7FF91BFB0FF8AB8A9FF7FAD9DFF75A394FF6B99
      89FF6A9889FF528071FF0000000000000000FFFFFFFFFFFFFFFFFEFDFCFFFDFC
      FAFFD0B09FFF8E6E5BFFBD5727FFBC5524FFBA4408FFB62900FFB10D00FFAF00
      00FFAF0000FFF5DFD5FFF4DCD0FF755B48FF939496FFA8A8A9FF98999CFFE9EA
      E9FF685B52FF5B8BDDFF64BBFFFF68BCFEFF977643FFF4BF6DFFF0B365FFE690
      43FFD76623FFC3825EFF909090FFEAEAEAFFFFFFFF0080808000000000008080
      8000808080000000FF008080800000000000FFFFFF0000000000000000000000
      0000FFFFFF0080808000808080008080800000000000000000005B8979FFBAE8
      D9FFB4E1D2FFABD9C9FFA2D0C1FF9AC8B9FF94C1B2FF8BB9A9FF80AD9EFF75A3
      94FF6F9D8DFF4D7B6CFF00000000000000000000000000000000FFFFFEFFFEFD
      FCFFD7C7BCFFFFFDFDFFBC5524FFBC5524FFBC4F1CFFB93D02FFB62900FFB214
      00FFB10200FFF6E2D9FFF5DED4FF79604DFFFBFBFCFF7A7B7BFFF9F9F9FF8B8C
      8DFFD6C8B8FF886E9BFF8BBAF3FF7395D5FFE6AD71FFF0B576FFEEB073FFE9A2
      6DFFE59265FFC38261FF949494FFEAEAEAFFFFFFFF008080800000000000FFFF
      0000FFFF0000FFFF0000FFFF000000000000FFFFFF0000000000000000000000
      0000FFFFFF008080800080808000808080000000000000000000598778FFC1EF
      E0FFBDEADBFFB5E3D4FFAFDDCDFFA5D2C3FF9CC9BAFF95C3B4FF8CB9AAFF81AE
      9FFF7AA899FF487566FF00000000000000000000000000000000FFFFFFFFFFFE
      FEFFBC5524FFBC5524FFBA4408FFB62900FFB10D00FFAF0000FFAF0000FFF9EB
      E5FFF8E8E1FFF7E5DCFFF6E2D8FF7E6452FF0000000000000000000000009C9C
      9BFFE1D5C9FFE69677FFE9A27CFFECAC82FFEEB285FFEEB385FFEDAF83FFECA6
      7EFFE69B78FFCA9579FF999999FFEAEAEAFFFFFFFF0080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008080800080808000808080000000000000000000588576FFC9F7
      E8FFC3F1E1FFBEECDDFFB8E5D6FFB1DECFFFA7D5C5FF9ECCBDFF97C5B5FF8DBA
      ABFF85B3A4FF457364FF00000000000000000000000000000000FFFFFFFFFFFF
      FFFFBC5524FFBC5524FFBC4F1CFFB93D02FFB62900FFB21400FFB10200FFFAEE
      E8FFF9EBE4FFF8E7E0FFF7E4DCFF826957FF000000000000000000000000989B
      9CFFE3D2C8FFEAA48FFFECAB91FFEDB194FFEEB697FFF0B698FFEEB496FFECAE
      92FFEAA68EFFC89A7BFF9F9F9FFFEAEAEAFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000808080000000000000000000588576FF5987
      78FF5A8879FF5A8879FF5A8879FF588576FF598677FF517F70FF4D7B6CFF3B69
      59FF376555FF3B6959FF00000000000000000000000000000000983301FF9633
      04FF923307FF8F330AFF8B330EFF873312FF823318FF7E331CFF793320FF7533
      25FF713329FF6D332CFF6A3330FF673333FF0000000000000000000000009A9B
      9BFFE2D8CEFFDC9176FFDE9778FFE09B7AFFE09D7BFFE19E7BFFE09C7AFFDF98
      77FFDE9375FFB0866FFFA3A3A3FFEAEAEAFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D68200FFD37E
      00FFCF7A00FFCB7400FFC66D00FFC16600FFBB5F00FFB45700FFAF4F00FFAA48
      00FFA54100FFA03B00FF9C3700FF673333FF0000000000000000000000006767
      67FFCACACAFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFC4C4C4FFB9B9B9FFB2B2
      B2FFACACACFFA6A6A6FF7E7E7EFFF1F1F1FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000983301FF9633
      04FF923307FF8F330AFF8B330EFF873312FF823318FF7E331CFF793320FF7533
      25FF713329FF6D332CFF6A3330FF683332FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF01FFFFFFFFFFFFFF01FF84FFFFFF
      C00301FF80030000C003000080030000C003000080070000C003000080000000
      C003000080000000C003000000000000C003000000000000C003000000000000
      C003C00000000000C003C000E0000000C003C000E0000000C003C000E0000000
      FFFFC000E0000001FFFFC000FFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object FolderDialog: TFolderDialog
    Title = #48177#50629' '#54260#45908
    Options = [fdoNewDialogStyle]
    DialogX = 0
    DialogY = 0
    Version = '1.1.4.0'
    Left = 1152
    Top = 384
  end
  object DesignFontDialog: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 975
    Top = 441
  end
  object ColorDialog: TColorDialog
    Left = 1064
    Top = 440
  end
  object Click_Tmr: TTimer
    Enabled = False
    Interval = 1
    Left = 439
    Top = 34
  end
  object OpenDialog: TOpenDialog
    Filter = 
      'avil files (*.avi)|*.avi|wmvl files (*.wmv)|*.wmv|jpg files (*.j' +
      'pg)|*.jpg|png files (*.png)|*.png'
    Options = [ofReadOnly, ofOverwritePrompt, ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Left = 552
    Top = 25
  end
  object PictureLoadDialog: TOpenPictureDialog
    Filter = #51060#48120#51648'|*.png'
    Left = 1067
    Top = 384
  end
  object IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Method = sslvSSLv23
    SSLOptions.SSLVersions = [sslvSSLv2, sslvSSLv3, sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2]
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 976
    Top = 386
  end
  object ImageList: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 2163184
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008888
          888AB8B8B8C1B6B6B6C2B6B6B6C2B6B6B6C2B5B5B5C2B5B5B5C2B5B5B5C2B5B5
          B5C2B5B5B5C3B5B5B5C3B5B5B5C3B7B7B7C28787878A0000000000000000BBBB
          BBC15F483EFF4B3328FF493328FF483227FF463026FF452F26FF432E25FF422D
          25FF412C24FF402C22FF3F2B22FF231813FFB9B9B9C10000000000000000AEAE
          AEB2B3B3B3C3AFAFAFC4AFAFAFC4AFAFAFC5AFAFAFC5AFAFAFC5AEAEAEC5AEAE
          AEC5AFAFAFC4B4B4B4C3B5B5B5C2B8B8B8C28C8C8C8F0000000000000000BBBB
          BBC0634E42FF4D352AFF4B3429FF4A3329FF493328FF473127FF463026FF442F
          26FF291C17FFBABABAC10000000000000000000000000000000000000000AEAE
          AEB2B5B5B5C3B2B2B2C4B2B2B2C4B1B1B1C4B1B1B1C4B0B0B0C4B0B0B0C4B0B0
          B0C4B1B1B1C4B5B5B5C2B7B7B7C2B8B8B8C18888888A0000000000000000BBBB
          BBC0685245FF4F382CFF4E372CFF4C352BFF4B342AFF4A3328FF493328FF4832
          27FF473026FF452F26FF432E25FF2C1E18FFBBBBBBC10000000000000000AFAF
          AFB2B7B7B7C2B4B4B4C3B3B3B3C3B3B3B3C3B3B3B3C3B2B2B2C3B2B2B2C3B2B2
          B2C4B3B3B3C3B6B6B6C2B8B8B8C2B9B9B9C18D8D8D8F0000000000000000BCBC
          BCC06E5648FF523B2DFF50392DFF4F382CFF4D372CFF4D362AFF4B3429FF4B33
          28FF35241DFFBBBBBBC00000000000000000000000000000000000000000AFAF
          AFB2B8B8B8C1B5B5B5C2B5B5B5C2B5B5B5C2B5B5B5C3B5B5B5C3B4B4B4C3B4B4
          B4C3B5B5B5C3B8B8B8C2B9B9B9C1BABABAC18888888A0000000000000000BDBD
          BDC071594CFF543C2FFF533B2EFF513A2DFF50392DFF4F382CFF4E372BFF4C35
          2BFF4B342AFF4B3329FF493328FF37271EFFBBBBBBC000000000000000008D8D
          8D8EBCBCBCC0BBBBBBC0BBBBBBC0BBBBBBC0BBBBBBC1BBBBBBC1BBBBBBC1BBBB
          BBC1BABABAC1BABABAC1BABABAC1BBBBBBC18D8D8D8F00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008888
          888AB8B8B8C1B6B6B6C2B6B6B6C2B6B6B6C2B5B5B5C2B5B5B5C2B5B5B5C2B5B5
          B5C2B5B5B5C3B5B5B5C3B5B5B5C3B7B7B7C28787878A0000000000000000BBBB
          BBC15F483EFF4B3328FF493328FF483227FF463026FF452F26FF432E25FF422D
          25FF412C24FF402C22FF3F2B22FF231813FFB9B9B9C100000000000000008D8D
          8D8FB9B9B9C1B7B7B7C2B5B5B5C2B1B1B1C4AFAFAFC5AFAFAFC5AEAEAEC5AEAE
          AEC5AFAFAFC4B4B4B4C3B5B5B5C2B8B8B8C28C8C8C8F00000000000000000000
          00000000000000000000BBBBBBC160493FFF493328FF473127FF463026FF442F
          26FF291C17FFBABABAC100000000000000000000000000000000000000008888
          888ABABABAC1B8B8B8C1B7B7B7C2B2B2B2C3B1B1B1C4B0B0B0C4B0B0B0C4B0B0
          B0C4B1B1B1C4B5B5B5C2B7B7B7C2B8B8B8C18888888A0000000000000000BBBB
          BBC0685245FF4F382CFF4E372CFF4C352BFF4B342AFF4A3328FF493328FF4832
          27FF473026FF452F26FF432E25FF2C1E18FFBBBBBBC100000000000000008D8D
          8D8FBBBBBBC1B9B9B9C1B8B8B8C2B5B5B5C3B3B3B3C3B2B2B2C3B2B2B2C3B2B2
          B2C4B3B3B3C3B6B6B6C2B8B8B8C2B9B9B9C18D8D8D8F00000000000000000000
          00000000000000000000BCBCBCC0695346FF4D372CFF4D362AFF4B3429FF4B33
          28FF35241DFFBBBBBBC000000000000000000000000000000000000000008888
          8889BBBBBBC0BBBBBBC1B9B9B9C1B6B6B6C2B5B5B5C3B5B5B5C3B4B4B4C3B4B4
          B4C3B5B5B5C3B8B8B8C2B9B9B9C1BABABAC18888888A0000000000000000BDBD
          BDC071594CFF543C2FFF533B2EFF513A2DFF50392DFF4F382CFF4E372BFF4C35
          2BFF4B342AFF4B3329FF493328FF37271EFFBBBBBBC000000000000000008D8D
          8D8EBCBCBCC0BBBBBBC0BBBBBBC0BBBBBBC0BBBBBBC1BBBBBBC1BBBBBBC1BBBB
          BBC1BABABAC1BABABAC1BABABAC1BBBBBBC18D8D8D8F00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008888
          888AB8B8B8C1B6B6B6C2B6B6B6C2B6B6B6C2B5B5B5C2B5B5B5C2B5B5B5C2B5B5
          B5C2B5B5B5C3B5B5B5C3B5B5B5C3B7B7B7C28787878A0000000000000000BBBB
          BBC15F483EFF4B3328FF493328FF483227FF463026FF452F26FF432E25FF422D
          25FF412C24FF402C22FF3F2B22FF231813FFB9B9B9C100000000000000008D8D
          8D8FB9B9B9C1B7B7B7C2B5B5B5C2B1B1B1C4AFAFAFC5AFAFAFC5AEAEAEC5AEAE
          AEC5ADADADC5ADADADC5ACACACC5B0B0B0C4ADADADB300000000000000000000
          00000000000000000000BBBBBBC160493FFF493328FF473127FF463026FF442F
          26FF432E25FF422D25FF412C23FF271B15FFBABABAC100000000000000008888
          888ABABABAC1B8B8B8C1B7B7B7C2B2B2B2C3B1B1B1C4B0B0B0C4B0B0B0C4B0B0
          B0C4AFAFAFC4AFAFAFC5AFAFAFC5B2B2B2C4AEAEAEB30000000000000000BBBB
          BBC0685245FF4F382CFF4E372CFF4C352BFF4B342AFF4A3328FF493328FF4832
          27FF473026FF452F26FF432E25FF2C1E18FFBBBBBBC100000000000000008D8D
          8D8FBBBBBBC1B9B9B9C1B8B8B8C2B5B5B5C3B3B3B3C3B2B2B2C3B2B2B2C3B2B2
          B2C4B2B2B2C4B1B1B1C4B1B1B1C4B4B4B4C3AEAEAEB200000000000000000000
          00000000000000000000BCBCBCC0695346FF4D372CFF4D362AFF4B3429FF4B33
          28FF493228FF473127FF473026FF32231BFFBBBBBBC000000000000000008888
          8889BBBBBBC0BBBBBBC1B9B9B9C1B6B6B6C2B5B5B5C3B5B5B5C3B4B4B4C3B4B4
          B4C3B3B3B3C3B3B3B3C3B3B3B3C3B5B5B5C2AEAEAEB20000000000000000BDBD
          BDC071594CFF543C2FFF533B2EFF513A2DFF50392DFF4F382CFF4E372BFF4C35
          2BFF4B342AFF4B3329FF493328FF37271EFFBBBBBBC000000000000000008D8D
          8D8EBCBCBCC0BBBBBBC0BBBBBBC0BBBBBBC0BBBBBBC1BBBBBBC1BBBBBBC1BBBB
          BBC1BABABAC1BABABAC1BABABAC1BBBBBBC18D8D8D8F00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000025744558745469746C6500486F72697A6F6E74616C4178
          69733B417865733B417869733B5363616C653BDABFBDAF000001F64944415478
          5E8D504D6B1441107DB56913FCC0807A12F56440D05382072F1A0D7A50C41F21
          1E240B41549028014559222666518807F3331441217A317E9E566F460F2EDEFC
          4C747733DD554E5717D378B398E6D5D4BCF7E675D152E3D4E2D6EEBB5140108B
          0455499C09A5792D3208C6030779B6E7FAA731B7ADDB1ADD313C640AC9084928
          6695678AEDD6E743006A8E190033C2B72F2AD878FA3D5617F68222912ABD9554
          FEC2A977EA1E3C8439333960DD481DFDC375ACBDBDABA3FE91D4F7DEDC816822
          BB596CD42084784C1F54FC6B7E280AF5FC9CDFADC8C63307726001FBC2C49620
          B0827032ECBD6A62F0EC87D82A8F3425B46ABA1C5FA8339B70F3F832BA2FE730
          38FEB1C4DBF8F362163F9ABB2A038E89AB04F26F82EF733BAB85759ECFE87DB7
          9C6BEBA4B3345BA512D4149DEEA028EC437C21456369F7F5D6769B65005B8276
          DF3EC8720B247D00A5ED5A6501E903218A94C433A27BB46102372E8EE177C71B
          4B546312484E6253C1FA0187C9E927008E9393206011CCDC7F8D1018BE3C852F
          B13CA1C42204455FA2F7E9CF0BD3276CE1A01A738A5D02CE9FD9AF6657EA0720
          2CB876E1A0E2CDCB4794D3BC7A0CB118F9AA549F7A288D4B47D5D9CA625B9F1B
          EB49B9938DC7B8D738B9C9ADACAC2E4E4C3D382C4655233104C086D93F25F645
          EF29804000060038E422FC5F79006B7F0159A463B4020AED700000000049454E
          44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C0000000C744558745469746C650052657365743B64CF80690000
          037C49444154785E7D537D4C93471C3E9DC84CB075D9E660B620BCC8AA282B5A
          A5B448410ACC5293452A5DA19DA8630A5BAD6CD6CD40834528858A0E025DE563
          D16D2A1FBA2053C10E862351DC47A81998322653B711179431981A4AD99EBDEF
          9BB23F5CB24B9EDC2F77F77CFC2E77E47FC63C1AF39FC0BCFF102C6764A4AC39
          9194B76C22B6B3492C715F79CC92AAF6578A6B3B365FFFF0B262D6E154CCDA3B
          15D7ED1D9BCD05F6382E2354DF9D46EABB9584143648C8D46C1F99FEDB4D1897
          830E89BCF10BCDAF3D8365B835761E939E7E162363EDE87557E0E32BBA5F2A5B
          E572E6EC71A78290FC6A1199F05E61C9864A91DADEA6C5CDD1D3A045F1BBF74B
          DCF774E281C78909EF57F8F3AF6FF1C3BD16B45CCBC591D6E40CB6ADDD65516C
          6CE51B5450619DFCD1D7C375189BBE88EEC152583E514153B086015D67E0C668
          0DC667BA688353A8BFFCDA237DE9FA40A235091881A7B20E0A8E9CE83460F471
          0BFA6E9720BF2ADEA3783BC418A709A2A4EA402A790FEF706EB9D4DB35508C31
          CF05385D66947C9A504154FB294660E1B6FDE183EDFD7BE19EB4A1BA4D838C03
          1107E8753F269D0F0B958650B3AD598D9F1ED6C175D781432765030CD99F0677
          8B3E64EAFCF0167CFE73128C761956443F13E4DB9BFF87F72ADB66BC8AB75C7F
          3416439395181A77A0B0216E86ECB18826F2AC22BC55B11E67DC6234DD12A2A0
          2E11FB8EC520FF98F8A15C1DC6BDEFE9622F395543051B6B64E8FD6D072EDD7E
          15EFD688A7C8C6CCC0F78A1A537163DC8AA61F4538351C09D783C368E8CCC60E
          93B08489EE6BC13FC7BCD67CFC9216CD2342D4F7899157BE6E902C7ED68F9B90
          FDC29DEAAB1138E15E8593432BE1F86E15761547DF5D16CE592A8C0F7C5E92C6
          5F9E655C6D2C6A48F57CE67A9D365903EBD93868DF5FFD0113CD2F3A8DABCD3C
          C4C74737052CF2ED2F236D57844E961EB26167917066AF4D82A3ADE938D79F83
          73239B607346E2CDD2B58F25CA6561736F3E6043FA921E535B302C1D2F61AB5E
          D043AF2D551956F69CBEB61DBDA30674DCD1A069580ACB4501765BA390A20BCD
          61DB136DE330220B28F1A298E4DCE7BC3A53A45794F2626C5266A82ECF1A8346
          572CAABF0987F90205BD9D82EA9D15F7A45B796A9AF3346BBE4EB5782EC5A228
          65406DCAF6B05ABAE6246753A68D19FCEF13B28291A80D864CC31F90A6F3AAF8
          020E6FEE7DA4EC0C25FF0EDF77F5F761816F66D4B93E0430AE4F7EEB7F004FCE
          9AEBD9E212700000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000023744558745469746C650043616E63656C3B53746F703B457869743B
          426172733B526962626F6E3B4C9696B20000038849444154785E1D906B4C5367
          18C7FF3DBD40CB1A2E32B55C9D598B4CA675D8D13836652E9B0359B67D589665
          3259E644A52571644474CB4CB6ECC23770C4449DD38D2885005E4683AB69C616
          8DA12384264EC8AAAC0C9149A1175ACEE9E939CFDE9EE7E477F2CBFFB924E720
          E6E943CC3B8895D12B00A0FEE3D08167A75A5BBAEEB71D9D081E6B4DA549FBDD
          A3CEEFDD1F3658016818AA98A71FD1915E202DE980A19D741E3EF6E0F8A7FC7F
          673B6979E002C5BC43B4C2581EB8480BE7BA68E6441BEF3B72F03300990C8E1D
          5016554E7B55D6C1ED9543C6C2B5BB739FDF025988838424E4240F10A0D2EAA0
          D26540AD37203CFE17C2C187A3EDBFDE7CF3DAD4748403A06EA8A8E830AC5FB3
          3B7BAB1901B717AE23DFE1CEC5EBEC90A0E0EB71A3CFD981C0B017C6F252180B
          D6BD74BCFA856E003A0CBDFD966DF250532AD4FF038DB734D18557DF21CFB08F
          2E37B5D370ED5E72D7D52BEEF9654CE9F91C1FD392EB0C4D3A0E4BE7F6ECD909
          CFDEFAD381AF4ED0A3D35FD399E272BA3F3D478F971234FD2044BDCE930AF798
          CF2FAED0DF5373CACCFCA92F2970B29DDCAFD7F56B48945E918201C41738945A
          2D581C7461ADA3192AB50AD64F9A010272730CC8D4AA313BE44289D58CF85D3F
          2411504BB28D93845489145E041F9CC1863C09A11BD7E1EFEA86240339463DB2
          B3F59025C0DFD98DD0C83594E6886C360831F408523265D208BC0021B20A35A7
          82B8BC0429C2239A10D812417988007088B14C8A8421EA75A094044A8A48F200
          17E78587629220B370E69F2884EA3750F07E23245946868E43A64EA3B8695F23
          F8EA7A046763EC780AC9640AF155FEB1269AE0BD91AC8CFDF910108E26F15A5B
          33788D1E860CF6CDE7CF225D45FB3F02A0C7CE36076E5CBD84825C3562A20E4B
          097E0CAD051B5FFCA97C9BE4ABAEA05B2FDBE9E6BE0F880F8568FCDB0E1AA9AA
          646C579C654AEF564D15FDB96333FDBCC94A8E751B6A0140DF5168B9E42A7B86
          266AB6D2ED1A1BF559CAC853B58DFCB576F2D7D9D3AE64B777D96862D716EA2F
          2BA76F4CE62B008C1A00C2F9C57F9D8DA2C99212C5E72C85323699F320A77FD2
          72040021DF9885F56BF2204457706F9EC74C4CF2F744169A012430DBF21E00A8
          2B754F98BEC82EEEED7AF2291A306FA451EBD3346633938FF13BF341969D62BD
          CF738AAF6ED6EA4B006882CE77A14ABFD255D2799903606830E4EF28E274070C
          1C67D74255041044C25C9CE43B4149F8B16735F41B8038DB9300E07F6924ECFB
          01D589CC0000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000027744558745469746C6500526566726573683B5265706561743B4261
          72733B526962626F6E3B52656C6F6164CD4DF6E90000030249444154785EA593
          6D4C926B18C76F018114A40D6D619DE98433AAE3F16D7CB173AC43666FE69C7A
          D4F48825339D4E6136D314EB2C23B46C332B957484A0522E5B6E2C31B537B437
          319BCECC17B2652D672FC715E03194AEEE875A6BB53E796DBFDDCF7EF7FFFFE1
          DAB3DB0500D052C6E5A7FEC73B70F2FDC89A4D48D664FA5A5AF5DB1FE4E8928B
          E2226D9F11FB0F04459A7B3D052A63DE0E71B11B91C10E77FA9D5D94DF70DF59
          4E93EB7EC957DF1B4F935FE009B3EBB7A59FE8704C59E6E185E503DC9D7C0B9A
          5B66D8A7BA33243AD4E087F3A4E9F98F683FD1959EBD8BF0B8E6D418BB1F3C9B
          855DA57A23871BC00C15D755FD99D508E1521DE49EB90E833356B8D4F71C726A
          7A460285F11EC48A92CF5D44D973CC50A8BDF504C6FE7780F2CA3044481AFEF5
          FE3598C1DD24F5E10A73F88109958A8DD94DF69E171638D53E0AA2A36D07885E
          E6E95E8476E6D5090AD57D0B66DB02F45B1661DC6A87B4B2F685E0D8C3422284
          21619605FC5DA148ADE884F303D3905C6630112EF5C40D449AB550D5BDBDA314
          D9C99BC862B52379ED6DF478E215C595B9AAFE4B9918D2CC4857CBE4F834A22D
          672287831C881D4B9B2F74232EE918CFA81283FDDA4B1B241CE9062F7E441076
          0C0C19438B2CD63F8A3AD8017187BB4033F61E88EFA8920E882CD24F92F8D1D5
          F3383467B3D846269EFE877CBC5928707372CAB7FFFFF9F01D890783BE98951E
          8628542ACACDDC88ACAF5E3B4C8656090ACBBD4C846802514DE9DEDAFBD038F4
          06E28F742F083395C7F91B44416BFEDACDA731BD38214995E519AA01A837CF41
          A2A213BC422455B8C744828C56E78E8C956B3921E226739666109A47DE81E4DC
          0024286E424CE935F83DA95A87337E41A92A93ECEA14B043F63F2451591CE78A
          01BB5B50DB14B105725D199C28F0FF47FD24EEF86D28D19B4139340BCAC15908
          2F6807DFF042317BCD9650FF14ED33EA8AB0F5384F65AC2B40889FD48CD1394F
          42D2D9BCD53E5BE515BC98DA21EC017BE0C52A877DB797CBC8547716CE786068
          74AE1411E0F90132C61DC3C67030DE18CF2F8EFC7D78C9CFF9136643522887EA
          10230000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000012744558745469746C65004C6973743B42756C6C65743B51737F3900
          0001C049444154785EA5933F48234114C6BF150BAD2C8463D35A4A9A58A86061
          9A43B18ACD81078245100B15051B4D79C889C82AA4D042F08EA02ED798C6E01F
          10B433165130F14F2459E18E1095A87137D984EC8E99996365B1C842DE63F73D
          16BE99EFFD66562084A09E68A4C5B79CE805B0081EB3008EC2D3ED12004F0D7D
          8C2D50D175F9C7985BCCBE941094939B207051F1E0F08C37A5280021ECE16E69
          054A7A01B7B103EEA0A86AC675F20939AD5CED0B860036567427B4841A11650C
          7A26F7FB41CC0D22344000FC2DE2975D36DF65088A92663B57D3E6A4A8BD2115
          3FE60E422B7D7B6D0D70A54CB0185F88B16AD224266D40D88B8FC03E99150B22
          157C821899F34880C739C485A90E31FBAC43FA9DB0200E7C9BF0D211D896D43D
          4D0E146A3E87BF7767DC81AEAAC6D5CD23728572B5D72C88913F4167103B47C3
          36884DAD2E06B139F90BF769853BB08E11ACBEBD3C21737FCE1DC86B3E1BC491
          C0296F4C2A342CDB5CCF1732896141A4824F104F7E764940975388453918E816
          33B922E6572F2C885F7D7EAF924E7F9C3F38488100AFCF593CFEBBE20E4A6ADE
          885F3FB09B58AA021560324087E1756710DD435B3688046010E3DBDF512BEAFE
          9DDF01B5CF2020C00AEDFF0000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C18000000D849444154789C
          ED91CF0A415110C60F5B141E83FC3B43C95A1EC0DA3378054F201BA999A3140B
          7913C57B48173377C1C6E2688895742F5B53BF9A3ADFF79D99738CF954039F34
          DE27CCB70528238B32FC218017CA3F80E30754669CD5EF7B050C7CB2E9241FFD
          66E20D20AF2CF152D11E50B69103AC1300929325BE2AF7DE09C45AA3415CB5C4
          0740E13A4AE383F058040CFB6F5741B6CAFBB3B0AF5E5373610F888358E33DDE
          2950AFA939EE02C919503A75947614546B492EEA35AD699001E23590F878F0BA
          30DEA75F2395E7BB546922B928A8F669BC01E06AC79ACB51C03F000000004945
          4E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000023744558745469746C650043616C656E6461723B536368
          6564756C65723B53706C69743B4375743B559D6175000002E349444154785E5D
          537F48947718FFDCCBEB19E9346898DACD3A735450108AA38D9557820C47430A
          21A4D8FE28A351D398B3F6E38FA88D8A361CCCD8D83F6ED24F4982B0161B3A39
          E751A7E159C34034B55F9C877757D79DEFDDFBFDD5F3BE7A05F779F8BCCF03DF
          E7F9F07D3F7C1F078034D3B0EA4C288B169001FD7457559FA6393CE923BB275D
          2F7E8494FDDF350C549FFAB5EFB5C6379F572F08103D7B6A9AECE62CED2D3B2B
          0AA99210C280A4E8EC69F700D0A6648E0481730107A1FEC4DF4A13829AC1108A
          0F216C8CE1DCEF0C37FF0963363685E7C623282520A987E0E02CE5E28C5D374D
          96DA75FCD6AD68E8492909487029C01587243E9EEE42E5FAADE8BDE1C66CD009
          259DC8CA5A0682A694E38F8D652B7634ECA870AE5BEBAA71E8B99D1AE70A4226
          890C068BA2F9D83AFC78EE6BD47C588E07A39B70DB2FB144CF0741678C6F2E75
          17E064DB3514BA4B609AFC3D12E0346C820B0EC38C22C9A338F4D51A9C6D3F8A
          2D95A5C8CBDE80E0E4566CFF78DF9AF9446264F8FFA7F8B4711702A39348CECF
          8F6A9C291A4E814BD366C20C93C80B1C6C71E3CC2F2D282AC8C3FEDD3BF17ED5
          2783084EFCE5FB6FC47BB9E33AEEFBFCDEB9A9BB076C0F18095CBC30649391C8
          9F9DBDB8DAEDC3812F57A3A9B511B197297C7BF8A35CCF07153F94AC7CBBCC55
          52C85CAB5CACD85D167734B595ABBDF5750825C60129175F0C658A2C2D0FF9CE
          77D1FA451F7EFAFE37F44FC4A0672FC1DAB222F80233F0DF191BD418B76E6040
          08134C3230CA5CA6EC9C304330551455B54B515BBBF7CAD84C049926EA822B98
          DCB00794520B04880BB7307810F1440473CF069A63E1C81632B1D83271F8EEB8
          6DA22E0487292D13B93D0C48482B132580143711898540301EDEF3D6C55FC4BB
          5303F7DE31E22FBDE1E991233AE7B07F21C7B9DC1EB45F9E92B68015820C9652
          81C0023D3F07006C206A44464CE96652FC7BE9BC7FDB9B454AEFC24297A09A9B
          B2DF2A2B3FEB60F660C6EA3A89FA629D79965E4A4E64E48F44065E0102CCC832
          89A186E20000000049454E44AE426082}
      end>
  end
end
