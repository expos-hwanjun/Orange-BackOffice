inherited StoreMartStoreForm: TStoreMartStoreForm
  Caption = #50976#53685'&&ERP '#47588#51109#44288#47532
  ClientHeight = 903
  ClientWidth = 1229
  ExplicitWidth = 1245
  ExplicitHeight = 942
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 405
    Height = 838
    ExplicitLeft = 305
    ExplicitHeight = 632
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1229
    ExplicitWidth = 1229
    inherited ButtonToolBar: TAdvToolBar
      inherited ButtonToolBarNewButton: TAdvGlowButton
        Visible = False
      end
    end
    inherited ConditionToolBar: TAdvToolBar
      Width = 687
      ExplicitWidth = 687
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        ExplicitWidth = 0
        Width = 0
      end
      inherited ConditionToolBarDateLabel: TcxLabel
        Left = 182
        Caption = #48376#49324
        Visible = True
        ExplicitLeft = 182
        ExplicitWidth = 53
        Width = 53
        AnchorX = 209
        AnchorY = 16
      end
      inherited ConditionToolBarToDateEdit: TcxDateEdit
        Left = 67
        ExplicitLeft = 67
        ExplicitWidth = 0
        Width = 0
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        Left = 67
        ExplicitLeft = 67
        ExplicitWidth = 0
        Width = 0
        AnchorX = 67
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        Left = 2
        Caption = #49345#53468
        Visible = True
        ExplicitLeft = 2
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Left = 67
        Visible = True
        ExplicitLeft = 67
        ExplicitWidth = 115
        Width = 115
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 563
        Visible = True
        ExplicitLeft = 563
      end
      object ToolBarCompanyCodeEdit: TcxButtonEdit
        Left = 235
        Top = 2
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ImeMode = imSHanguel
        Properties.OnButtonClick = ToolBarCompanyCodeEditPropertiesButtonClick
        Properties.OnChange = ToolBarCompanyCodeEditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 7
        Width = 99
      end
      object ToolBarCompanyNameLabel: TcxLabel
        Left = 334
        Top = 2
        AutoSize = False
        ParentFont = False
        Style.StyleController = EditStyleController
        Properties.Alignment.Vert = taVCenter
        Height = 25
        Width = 229
        AnchorY = 15
      end
    end
  end
  inherited GridPanel: TPanel
    Width = 405
    Height = 838
    ExplicitWidth = 405
    ExplicitHeight = 838
    inherited Grid: TcxGrid
      Width = 399
      Height = 832
      ExplicitWidth = 399
      ExplicitHeight = 832
      inherited GridTableView: TcxGridTableView
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0'
            Kind = skCount
            Column = GridTableViewName
          end>
        OptionsCustomize.ColumnFiltering = True
        OptionsView.Footer = True
        Styles.OnGetContentStyle = GridTableViewStylesGetContentStyle
        object GridTableViewCode: TcxGridColumn
          Caption = #47588#51109#53076#46300
          DataBinding.FieldName = 'CD_CUSTOMER'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 84
        end
        object GridTableViewName: TcxGridColumn
          Caption = #47588#51109#47749
          DataBinding.FieldName = 'NM_CUSTOMER'
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 191
        end
        object GridTableViewPartner: TcxGridColumn
          Caption = #54801#47141#49324
          DataBinding.FieldName = 'NM_PARTNER'
          HeaderAlignmentHorz = taCenter
        end
        object GridTableViewSolution: TcxGridColumn
          Caption = #49556#47336#49496
          DataBinding.FieldName = 'DS_CUSTOMER'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 108
        end
        object GridTableViewCompany: TcxGridColumn
          Caption = #48376#49324
          DataBinding.FieldName = 'NM_COMPANY'
          HeaderAlignmentHorz = taCenter
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 411
    Width = 818
    Height = 838
    ExplicitLeft = 411
    ExplicitWidth = 818
    ExplicitHeight = 838
    object cxPageControl1: TcxPageControl
      Left = 0
      Top = 0
      Width = 818
      Height = 838
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = RustDeskTabSheet
      Properties.CustomButtons.Buttons = <>
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      ClientRectBottom = 838
      ClientRectRight = 818
      ClientRectTop = 28
      object StoreInfoOfficePager: TcxTabSheet
        Caption = #47588#51109#51221#48372
        ImageIndex = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object GoodsCodeLabel: TLabel
          Left = 23
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
        object GoodsNameLabel: TLabel
          Left = 23
          Top = 42
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
        object MenuClassLabel: TLabel
          Left = 27
          Top = 72
          Width = 49
          Height = 17
          Caption = #54801' '#47141' '#49324
          Transparent = True
        end
        object CEONameLabel: TLabel
          Left = 254
          Top = 130
          Width = 52
          Height = 17
          Caption = #45824#54364#51088#47749
          Transparent = True
        end
        object IDNoLabel: TLabel
          Left = 11
          Top = 130
          Width = 65
          Height = 17
          Caption = #49324#50629#51088#48264#54840
          Transparent = True
        end
        object OfficeTelLabel: TLabel
          Left = 24
          Top = 159
          Width = 52
          Height = 17
          Caption = #47588#51109#51204#54868
          Transparent = True
        end
        object AddrLabel: TLabel
          Left = 24
          Top = 188
          Width = 52
          Height = 17
          Caption = #51452#12288#12288#49548
          Transparent = True
        end
        object PosAllowLabel: TLabel
          Left = 21
          Top = 255
          Width = 52
          Height = 17
          Caption = #54252#49828#49688#47049
          Transparent = True
        end
        object UseYNLabel: TLabel
          Left = 24
          Top = 511
          Width = 46
          Height = 17
          Caption = #49345'    '#53468
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object RemarkLabel: TLabel
          Left = 21
          Top = 430
          Width = 52
          Height = 17
          Caption = #48708#12288#12288#44256
          Transparent = True
        end
        object Label4: TLabel
          Left = 254
          Top = 159
          Width = 52
          Height = 17
          Caption = #55092#45824#51204#54868
          Transparent = True
        end
        object Label1: TLabel
          Left = 21
          Top = 481
          Width = 52
          Height = 17
          Caption = #49444#52824#51068#51088
          Transparent = True
        end
        object DemoEndLabel: TLabel
          Left = 227
          Top = 482
          Width = 206
          Height = 17
          AutoSize = False
          Caption = #45936#47784#51333#47308
          Transparent = True
          Visible = False
        end
        object Label6: TLabel
          Left = 27
          Top = 288
          Width = 46
          Height = 17
          Caption = #51648'    '#50669
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label11: TLabel
          Left = 22
          Top = 318
          Width = 52
          Height = 17
          Caption = #47588#51109#44508#47784
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label19: TLabel
          Left = 374
          Top = 255
          Width = 52
          Height = 17
          Caption = #47928#51088#51092#50529
          Transparent = True
        end
        object Label3: TLabel
          Left = 27
          Top = 101
          Width = 46
          Height = 17
          Caption = #48376'    '#49324
          Transparent = True
        end
        object Label2: TLabel
          Left = 376
          Top = 284
          Width = 52
          Height = 17
          Caption = 'AppUser'
          Transparent = True
        end
        object KioskAllowLabel: TLabel
          Left = 162
          Top = 257
          Width = 52
          Height = 17
          Caption = #53412#50724#49828#53356
          Transparent = True
        end
        object CustomerCodeEdit: TcxTextEdit
          Left = 84
          Top = 10
          Enabled = False
          ParentFont = False
          Properties.ImeMode = imDisable
          Properties.MaxLength = 14
          Properties.ReadOnly = False
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 120
        end
        object CustomerNameEdit: TcxTextEdit
          Left = 84
          Top = 39
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 150
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 277
        end
        object PartnerNameEdit: TcxTextEdit
          Tag = 99
          Left = 176
          Top = 68
          TabStop = False
          ParentFont = False
          Properties.ReadOnly = True
          Style.Color = 15856113
          Style.StyleController = EditStyleController
          TabOrder = 2
          Width = 257
        end
        object CEONameEdit: TcxTextEdit
          Left = 314
          Top = 127
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 20
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 3
          Width = 120
        end
        object BizNoEdit: TcxMaskEdit
          Left = 84
          Top = 127
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.EditMask = '999\-99\-99999;1;_'
          Properties.MaxLength = 0
          Properties.ValidateOnEnter = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 4
          Text = '   -  -     '
          Width = 120
        end
        object OfficeTelEdit: TcxTextEdit
          Left = 84
          Top = 156
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 13
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 5
          Width = 120
        end
        object ZipCodeEdit: TcxButtonEdit
          Left = 84
          Top = 185
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
          TabOrder = 6
          Width = 76
        end
        object Addr1Edit: TcxTextEdit
          Left = 162
          Top = 185
          TabStop = False
          ParentFont = False
          Properties.MaxLength = 80
          Properties.ReadOnly = True
          Style.Color = 15856113
          Style.StyleController = EditStyleController
          StyleFocused.Color = 14737632
          TabOrder = 7
          Width = 392
        end
        object Addr2Edit: TcxTextEdit
          Left = 162
          Top = 214
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 8
          Width = 392
        end
        object PosCountEdit: TcxSpinEdit
          Left = 84
          Top = 252
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.AssignedValues.MinValue = True
          Properties.MaxValue = 100.000000000000000000
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 9
          Width = 55
        end
        object StatusComboBox: TcxComboBox
          Left = 84
          Top = 507
          Hint = 'DS_STATUS'
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #51064#51613#50756#47308
            #49324#50857' '#50504#54632
            #45936#47784)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 10
          Text = #51064#51613#50756#47308
          Width = 125
        end
        object RemarkMemo: TcxMemo
          Left = 84
          Top = 427
          Hint = 'REMARK'
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 100
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 11
          Height = 45
          Width = 470
        end
        object MobileTelEdit: TcxTextEdit
          Left = 314
          Top = 156
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 13
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 12
          Width = 120
        end
        object PartnerCodeEdit: TcxButtonEdit
          Tag = 99
          Left = 84
          Top = 68
          TabStop = False
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ClickKey = 112
          Properties.ImeMode = imSHanguel
          Properties.OnButtonClick = PartnerCodeEditPropertiesButtonClick
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 13
          Width = 89
        end
        object SetupDateEdit: TcxDateEdit
          Left = 84
          Top = 477
          ParentFont = False
          Properties.DateButtons = [btnClear, btnNow]
          Properties.DisplayFormat = 'yyyy'#45380'mm'#50900'dd'#51068
          Properties.ImeMode = imSAlpha
          Properties.ImmediatePost = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 14
          Width = 125
        end
        object cxGroupBox1: TcxGroupBox
          Left = 21
          Top = 358
          Caption = ' VAN'
          TabOrder = 15
          Height = 55
          Width = 478
          object Label12: TLabel
            Left = 26
            Top = 25
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
          object Label13: TLabel
            Left = 254
            Top = 25
            Width = 26
            Height = 17
            Caption = #48169#49885
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object VanComboBox: TcxComboBox
            Left = 72
            Top = 21
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Properties.DropDownListStyle = lsFixedList
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 0
            Width = 137
          end
          object VanTypeComboBox: TcxComboBox
            Left = 288
            Top = 21
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Properties.DropDownListStyle = lsFixedList
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 1
            Width = 137
          end
        end
        object LocalComboBox: TcxComboBox
          Left = 84
          Top = 283
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownListStyle = lsFixedList
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 16
          Width = 191
        end
        object SizeComboBox: TcxComboBox
          Left = 84
          Top = 314
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownListStyle = lsFixedList
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 17
          Width = 191
        end
        object StoreCodeEdit: TcxTextEdit
          Left = 207
          Top = 10
          TabStop = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.ImeMode = imDisable
          Properties.MaxLength = 4
          Properties.ReadOnly = True
          Style.StyleController = EditStyleController
          TabOrder = 18
          Width = 69
        end
        object SmsRemainEdit: TcxCurrencyEdit
          Left = 434
          Top = 250
          TabStop = False
          EditValue = 0.000000000000000000
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Properties.EditFormat = ',0'
          Properties.ImeMode = imSAlpha
          Properties.Nullable = False
          Properties.Nullstring = '0'
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 19
          Width = 120
        end
        object CompanyNameEdit: TcxTextEdit
          Left = 176
          Top = 97
          TabStop = False
          ParentFont = False
          Properties.ReadOnly = True
          Style.Color = 15856113
          Style.StyleController = EditStyleController
          TabOrder = 20
          Width = 257
        end
        object CompanyCodeEdit: TcxButtonEdit
          Left = 84
          Top = 97
          TabStop = False
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
              Visible = False
            end>
          Properties.ClickKey = 112
          Properties.ImeMode = imSHanguel
          Properties.OnButtonClick = CompanyCodeEditPropertiesButtonClick
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 21
          Width = 89
        end
        object ProgramComboBox: TcxComboBox
          Tag = 99
          Left = 282
          Top = 10
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownListStyle = lsFixedList
          Properties.OnChange = ProgramComboBoxPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 22
          Width = 79
        end
        object AppLicenseEdit: TcxSpinEdit
          Left = 434
          Top = 281
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.AssignedValues.MinValue = True
          Properties.MaxValue = 100.000000000000000000
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 23
          Width = 48
        end
        object KioskCountEdit: TcxSpinEdit
          Left = 220
          Top = 253
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.AssignedValues.MinValue = True
          Properties.MaxValue = 100.000000000000000000
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 24
          Width = 55
        end
        object CreateLetsOrderButton: TAdvGlowButton
          Left = 83
          Top = 538
          Width = 187
          Height = 31
          Caption = 'Message Broker Create'
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
          TabOrder = 25
          OnClick = CreateLetsOrderButtonClick
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
      object HistoryPage: TcxTabSheet
        Caption = #49688#51221#51060#47141
        ImageIndex = 1
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object cxGrid1: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 812
          Height = 804
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
              DataBinding.FieldName = 'DS_HIST'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 50
            end
            object HistoryGridTableViewColumn17: TcxGridColumn
              Caption = #54801#47141#49324
              DataBinding.FieldName = 'PARTNER'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 84
            end
            object HistoryGridTableViewStoreName: TcxGridColumn
              Caption = #47588#51109#47749
              DataBinding.FieldName = 'NM_CUSTOMER'
              PropertiesClassName = 'TcxLabelProperties'
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Options.Moving = False
              Width = 200
            end
            object HistoryGridTableViewColumn1: TcxGridColumn
              Caption = #49324#50629#51088#48264#54840
              DataBinding.FieldName = 'BIZ_NO'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 95
            end
            object HistoryGridTableViewColumn2: TcxGridColumn
              Caption = #45824#54364#51088
              DataBinding.FieldName = 'CEO_NAME'
              HeaderAlignmentHorz = taCenter
              Width = 78
            end
            object HistoryGridTableViewColumn3: TcxGridColumn
              Caption = #47588#51109#51204#54868
              DataBinding.FieldName = 'TEL_OFFICE'
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewColumn4: TcxGridColumn
              Caption = #55092#45824#51204#54868
              DataBinding.FieldName = 'TEL_MOBILE'
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewColumn5: TcxGridColumn
              Caption = #51452#49548'1'
              DataBinding.FieldName = 'ADDR1'
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewColumn6: TcxGridColumn
              Caption = #51452#49548'2'
              DataBinding.FieldName = 'ADDR2'
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewColumn7: TcxGridColumn
              Caption = #54252#49828#49688#47049
              DataBinding.FieldName = 'ALLOW_POS'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',#'
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewColumn11: TcxGridColumn
              Caption = #48708#44256
              DataBinding.FieldName = 'REMARK'
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewColumn12: TcxGridColumn
              Caption = #49345#53468
              DataBinding.FieldName = 'DS_STATUS'
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewColumn13: TcxGridColumn
              Caption = #49324#50857#51088
              DataBinding.FieldName = 'ID_USER'
              HeaderAlignmentHorz = taCenter
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = HistoryGridTableView
          end
        end
      end
      object EtcPage: TcxTabSheet
        Caption = 'DB_LINK'
        ImageIndex = 2
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object DBLinkGroupBox: TcxGroupBox
          Left = 26
          Top = 19
          Caption = ' DB LINK'
          TabOrder = 0
          DesignSize = (
            517
            452)
          Height = 452
          Width = 517
          object Label21: TLabel
            Left = 25
            Top = 29
            Width = 33
            Height = 17
            Caption = 'DB IP'
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label22: TLabel
            Left = 25
            Top = 61
            Width = 60
            Height = 17
            Caption = 'DB NAME'
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label5: TLabel
            Left = 25
            Top = 92
            Width = 54
            Height = 17
            Caption = 'DB PORT'
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label7: TLabel
            Left = 25
            Top = 123
            Width = 27
            Height = 17
            Caption = 'User'
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label9: TLabel
            Left = 25
            Top = 154
            Width = 57
            Height = 17
            Caption = 'Password'
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label10: TLabel
            Left = 25
            Top = 185
            Width = 71
            Height = 17
            Caption = 'SynPos Port'
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label14: TLabel
            Left = 188
            Top = 185
            Width = 75
            Height = 17
            Caption = '('#44592#48376' : 9911)'
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object DBLinkLabel: TLabel
            Left = 35
            Top = 307
            Width = 51
            Height = 17
            Caption = 'DB_LINK'
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object DBLink2Label: TLabel
            Left = 35
            Top = 377
            Width = 51
            Height = 17
            Caption = 'DB_LINK'
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object DBLink2PosLabel: TLabel
            Left = 39
            Top = 400
            Width = 41
            Height = 17
            Caption = '( B/O )'
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object DBLinkPosLabel: TLabel
            Left = 39
            Top = 330
            Width = 42
            Height = 17
            Caption = '( POS )'
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label17: TLabel
            Left = 28
            Top = 218
            Width = 29
            Height = 17
            Caption = 'REST'
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object DBIPEdit: TcxTextEdit
            Left = 109
            Top = 26
            ParentFont = False
            Properties.ImeMode = imSAlpha
            Properties.MaxLength = 30
            Properties.ReadOnly = True
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 0
            Width = 163
          end
          object DBNameEdit: TcxTextEdit
            Left = 109
            Top = 57
            ParentFont = False
            Properties.ImeMode = imSAlpha
            Properties.MaxLength = 100
            Properties.ReadOnly = True
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 1
            Width = 212
          end
          object DBPortEdit: TcxTextEdit
            Left = 109
            Top = 88
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.ImeMode = imSAlpha
            Properties.MaxLength = 13
            Properties.ReadOnly = True
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 2
            Text = '9914'
            Width = 53
          end
          object UserEdit: TcxTextEdit
            Left = 109
            Top = 119
            ParentFont = False
            Properties.EchoMode = eemPassword
            Properties.ImeMode = imSAlpha
            Properties.MaxLength = 30
            Properties.PasswordChar = '*'
            Properties.ReadOnly = True
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 3
            Width = 115
          end
          object UserPassEdit: TcxTextEdit
            Left = 109
            Top = 150
            ParentFont = False
            Properties.EchoMode = eemPassword
            Properties.ImeMode = imSAlpha
            Properties.MaxLength = 30
            Properties.PasswordChar = '*'
            Properties.ReadOnly = True
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 4
            Width = 163
          end
          object SyncPosPortEdit: TcxTextEdit
            Left = 109
            Top = 181
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.ImeMode = imSAlpha
            Properties.MaxLength = 5
            Properties.ReadOnly = True
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 5
            Text = '9911'
            Width = 65
          end
          object OKButton: TAdvGlowButton
            Left = 225
            Top = 266
            Width = 83
            Height = 31
            Anchors = [akRight, akBottom]
            Caption = #49373#49457
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
            TabOrder = 6
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
          object DBPosLinkMemo: TcxMemo
            Left = 109
            Top = 303
            Properties.ReadOnly = True
            TabOrder = 7
            Height = 64
            Width = 396
          end
          object DBLinkMemo: TcxMemo
            Left = 109
            Top = 373
            Properties.ReadOnly = True
            TabOrder = 8
            Height = 64
            Width = 396
          end
          object RestPortEdit: TcxCurrencyEdit
            Left = 109
            Top = 212
            EditValue = 9911.000000000000000000
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.DisplayFormat = '#0'
            Properties.EditFormat = ',0'
            Properties.ImeMode = imSAlpha
            Properties.MaxLength = 5
            Properties.Nullable = False
            Properties.Nullstring = '0'
            Properties.ReadOnly = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 9
            Width = 64
          end
          object RestAPIEdit: TcxTextEdit
            Left = 178
            Top = 213
            ParentFont = False
            Properties.ImeMode = imSAlpha
            Properties.MaxLength = 30
            Properties.ReadOnly = True
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 10
            Width = 66
          end
        end
      end
      object RustDeskTabSheet: TcxTabSheet
        Caption = #50896#44201#44288#47532
        ImageIndex = 3
        OnShow = RustDeskTabSheetShow
        object cxGrid2: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 812
          Height = 804
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
          object GridTableView1: TcxGridTableView
            Tag = 99
            Navigator.Buttons.CustomButtons = <>
            FilterBox.CustomizeDialog = False
            FilterBox.Visible = fvNever
            ScrollbarAnnotations.CustomAnnotations = <>
            OnCellDblClick = GridTableView1CellDblClick
            DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = ',0'#44148
                Kind = skCount
                Column = GridTableView1PosNo
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
            object GridTableView1PosNo: TcxGridColumn
              Caption = #54252#49828#48264#54840
              DataBinding.FieldName = 'NO_POS'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              FooterAlignmentHorz = taRightJustify
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Width = 87
            end
            object GridTableView1Device: TcxGridColumn
              Caption = 'Device'
              DataBinding.FieldName = 'DEVICE'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Focusing = False
              Width = 103
            end
            object GridTableView1RustDeskID: TcxGridColumn
              Caption = #50896#44201' ID'
              DataBinding.FieldName = 'RUSTDESK_ID'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 210
            end
          end
          object cxGridLevel2: TcxGridLevel
            GridView = GridTableView1
          end
        end
      end
    end
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
