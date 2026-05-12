inherited StoreUserForm: TStoreUserForm
  Caption = #49324#50857#51088#44288#47532
  ClientHeight = 630
  ClientWidth = 1035
  ExplicitWidth = 1051
  ExplicitHeight = 669
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 385
    Height = 565
    ExplicitLeft = 385
    ExplicitHeight = 565
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1035
    ExplicitWidth = 1035
    inherited ConditionToolBar: TAdvToolBar
      Width = 709
      ExplicitWidth = 709
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
        Left = 2
        ExplicitLeft = 2
        ExplicitWidth = 0
        Width = 0
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        Left = 2
        ExplicitLeft = 2
        ExplicitWidth = 0
        Width = 0
        AnchorX = 2
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        Left = 2
        Visible = True
        ExplicitLeft = 2
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Left = 67
        Properties.Alignment.Horz = taCenter
        Properties.Items.Strings = (
          #51221#49345
          #51473#51648
          #51204#52404)
        Text = #51221#49345
        Visible = True
        ExplicitLeft = 67
        ExplicitWidth = 75
        Width = 75
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 142
        Visible = True
        ExplicitLeft = 142
        ExplicitWidth = 176
        Width = 176
      end
      object cxLabel1: TcxLabel
        Left = 318
        Top = 2
        AutoSize = False
        Caption = #48376#49324
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 27
        Width = 59
        AnchorX = 348
        AnchorY = 16
      end
      object ToolBarCompanyCodeEdit: TcxButtonEdit
        Left = 377
        Top = 2
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ImeMode = imSHanguel
        Properties.OnButtonClick = CompanyCodeEditPropertiesButtonClick
        Properties.OnChange = ToolBarCompanyCodeEditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 8
        TextHint = #45800#46021#47588#51109
        Width = 99
      end
      object ToolBarCompanyNameLabel: TcxLabel
        Left = 476
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
    Width = 385
    Height = 565
    ExplicitWidth = 385
    ExplicitHeight = 565
    inherited Grid: TcxGrid
      Width = 379
      Height = 559
      ExplicitWidth = 379
      ExplicitHeight = 559
      inherited GridTableView: TcxGridTableView
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0'#47749
            Kind = skCount
            Column = GridTableViewUserName
          end>
        OptionsCustomize.ColumnFiltering = True
        OptionsView.Footer = True
        object GridTableViewUserID: TcxGridColumn
          Caption = 'User ID'
          DataBinding.FieldName = 'ID_USER'
          HeaderAlignmentHorz = taCenter
          Width = 103
        end
        object GridTableViewUserName: TcxGridColumn
          Caption = #49324#50857#51088#47749
          DataBinding.FieldName = 'NM_USER'
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 123
        end
        object GridTableViewClass: TcxGridColumn
          Caption = #44396#48516
          DataBinding.FieldName = 'USER_LEVEL'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 88
        end
        object GridTableViewPartner: TcxGridColumn
          Caption = #54801#47141#49324
          DataBinding.FieldName = 'NM_PARTNER'
          HeaderAlignmentHorz = taCenter
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 391
    Width = 644
    Height = 565
    ExplicitLeft = 391
    ExplicitWidth = 644
    ExplicitHeight = 565
    object AppIDLabel: TLabel
      Left = 55
      Top = 15
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
      Left = 42
      Top = 75
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
    object GoodsNameLabel: TLabel
      Left = 29
      Top = 45
      Width = 65
      Height = 17
      Caption = #49324#50857#51088#51060#47492
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object CompanyNameLabel: TLabel
      Left = 29
      Top = 139
      Width = 65
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = #48376#49324
      Transparent = True
    end
    object UseYNLabel: TLabel
      Left = 29
      Top = 109
      Width = 65
      Height = 17
      Caption = #49324#50857#51088#44396#48516
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object StoreNameLabel: TLabel
      Left = 29
      Top = 170
      Width = 67
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      Caption = #44592#48376#47588#51109
      Transparent = True
    end
    object AuthGroupLabel: TLabel
      Left = 42
      Top = 201
      Width = 52
      Height = 17
      Caption = #44428#54620#44536#47353
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 42
      Top = 317
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
      Left = 42
      Top = 264
      Width = 52
      Height = 17
      Caption = #48708#12288#12288#44256
      Transparent = True
    end
    object UserIDEdit: TcxTextEdit
      Left = 104
      Top = 10
      ParentFont = False
      Properties.ImeMode = imSAlpha
      Properties.MaxLength = 20
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 0
      Width = 113
    end
    object AppPWDEdit: TcxTextEdit
      Left = 104
      Top = 72
      ParentFont = False
      Properties.ImeMode = imSAlpha
      Properties.MaxLength = 30
      Properties.PasswordChar = '*'
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 2
      Width = 113
    end
    object UserNameEdit: TcxTextEdit
      Left = 104
      Top = 41
      ParentFont = False
      Properties.ImeMode = imSHanguel
      Properties.MaxLength = 150
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 1
      Width = 334
    end
    object CompanyCodeEdit: TcxButtonEdit
      Left = 104
      Top = 135
      Hint = 'CD_CLASS'
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ClickKey = 112
      Properties.ImeMode = imSHanguel
      Properties.OnButtonClick = CompanyCodeEditPropertiesButtonClick
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 3
      Width = 89
    end
    object CompanyNameEdit: TcxTextEdit
      Left = 195
      Top = 135
      TabStop = False
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = 14737632
      Style.StyleController = EditStyleController
      TabOrder = 4
      Width = 242
    end
    object UserLevelComboBox: TcxComboBox
      Left = 104
      Top = 103
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #47588#51109
        #48376#49324)
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 5
      Text = #47588#51109
      Width = 113
    end
    object StoreCodeEdit: TcxButtonEdit
      Left = 104
      Top = 166
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ClickKey = 112
      Properties.ImeMode = imSHanguel
      Properties.OnButtonClick = StoreCodeEditPropertiesButtonClick
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 6
      TextHint = #51204#47588#51109
      Width = 89
    end
    object StoreNameEdit: TcxTextEdit
      Left = 195
      Top = 166
      TabStop = False
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = 14737632
      Style.StyleController = EditStyleController
      TabOrder = 7
      Width = 242
    end
    object AuthComboBox: TcxComboBox
      Left = 104
      Top = 197
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #47588#51109
        #48376#49324)
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 10
      Text = #47588#51109
      Width = 189
    end
    object UseYNComboBox: TcxComboBox
      Left = 104
      Top = 312
      Hint = 'DS_STATUS'
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #49324#50857
        #49324#50857' '#50504#54632)
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 11
      Text = #49324#50857
      Width = 120
    end
    object RemarkMemo: TcxMemo
      Left = 104
      Top = 261
      Hint = 'REMARK'
      ParentFont = False
      Properties.ImeMode = imSHanguel
      Properties.MaxLength = 100
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 12
      Height = 45
      Width = 470
    end
    object StoreChooseCheckBox: TcxCheckBox
      Left = 104
      Top = 228
      Caption = ' '#47196#44536#51064#49884' '#47588#51109#49440#53469
      ParentFont = False
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 8
    end
    object CustomerGroupBox: TAdvGroupBox
      Left = 104
      Top = 343
      Width = 421
      Height = 178
      Margins.Left = 20
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      RoundEdges = True
      Caption = ' '#44032#47609#51216' '
      ParentCtl3D = True
      TabOrder = 13
      Visible = False
      DesignSize = (
        421
        178)
      object Grid1: TcxGrid
        Left = 16
        Top = 24
        Width = 391
        Height = 118
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        object GridTableView1: TcxGridTableView
          Tag = 99
          Navigator.Buttons.CustomButtons = <>
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.GroupByBox = False
          object GridTableView1CustomerCode: TcxGridColumn
            Caption = #47588#51109#53076#46300
            DataBinding.FieldName = 'CD_CUSTOMER'
            PropertiesClassName = 'TcxLabelProperties'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.Moving = False
            Width = 102
          end
          object GridTableView1CustomerName: TcxGridColumn
            Caption = #47588#51109#51060#47492
            DataBinding.FieldName = 'NM_CUSTOMER'
            PropertiesClassName = 'TcxLabelProperties'
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Options.Focusing = False
            Options.Moving = False
            Width = 226
          end
          object GridTableView1CompanyCode: TcxGridColumn
            DataBinding.FieldName = 'CD_COMPANY'
            Visible = False
          end
        end
        object GridLevel1: TcxGridLevel
          GridView = GridTableView1
        end
      end
      object AddButton: TAdvGlowButton
        Left = 259
        Top = 146
        Width = 72
        Height = 26
        Anchors = [akRight, akBottom]
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
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000006624B474400FF00FF00FFA0BDA793000001B349444154388D9D933F
          4C13511CC7BFEFDDEB71E5ECD16B38DA98A8F40F69D46844498C262632721B24
          BA10C3A46E6E6E4E860D17D9D489B8383138609C9C0A839A9BB0D15A3541E084
          8A07F6AEE7F57AC7422F911EF4D2CFF47B79EFFBC9F7373C8203D427A5336E93
          1B440894D2E47692AE7CBC3F661DBE63EDE17A4199BB7DF5E4AD3041A962F815
          DDDCC2B30FB9C392402030E28C64C4B03CCA1B2699BE994DB7DE7DFB3134BF54
          78F340DD0BDA852642E8E71966C6F3CAC574EEEBC4FC92D4D1E0386491E1FD97
          2D00C0485A54FE5AA7DE02B8165970A398FAEF6CD4ED6A7B8EBCC251F424601C
          29F624705C0FEB3B36D44B693990450D2E2CEBA83518688C876599A7EFBCF834
          FBF2EEB94791040BCB3A9C3E052991C3688640D3A59834203FF49FAF1A5D5770
          5C0FB50603631C00202B1300C0897E814F49E264D706DB7B0E688CC76886202B
          13C80230759642DBF4F19971835D1B64927D68393634DDC762D9C31F1B582C7B
          F86EF8701CF767D0C0767DBEA29B1D024A80A2C261AD61231E17A06DFA0000BD
          66ECFCAE5B4F49FBE151DFF9723E71616C587657AA7595F0C2154A68E25FB3B9
          F16BD77AFCEADEF9D7FBEEE9933B8C5306430000000049454E44AE426082}
        RepeatPause = 10
        Rounded = False
        TabOrder = 1
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
        Left = 336
        Top = 146
        Width = 72
        Height = 26
        Anchors = [akRight, akBottom]
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
        TabOrder = 2
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
    end
    object AppUseCheckBox: TcxCheckBox
      Left = 272
      Top = 228
      Hint = 'YN_APP'
      Caption = ' '#50545#49324#50857
      ParentFont = False
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 9
    end
    object IDDupCheckButton: TAdvGlowButton
      Left = 221
      Top = 9
      Width = 86
      Height = 26
      Caption = #51473#48373#52404#53356
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
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        6100000006624B474400FF00FF00FFA0BDA7930000013949444154388DC592BD
        4B425118C67FE7DE240B52A948C2A1966A2AA80B8E0E1108D2D0228DB94453A3
        B5F417188243534B1FA3435343813416164153CB0DFA10A386EC8675CDD47B1A
        42320939D5D0331DDEE7BCBFF73D0F07FE28513FA4B2E52882F477973A5C8237
        4726168DF6E5664F5399D2DD2930FAF5A5B59372E257008080576322A0C79B21
        4A00BB22C93F3900F83D5A3C957D0DD7BD3615C0A32D39B66B0D15E1F9D106AD
        F4FF00A50C001C59256765B04A262F95BBE8E4D6F4E1C1DC6E5EE92339B2CAD1
        F50A05FBBCB16C09A987949E90B3325F9A877B06890C857C52D4924A00AB64E2
        7577111B9F61CC3FC282318B59B801082A01DCAE5E8AE5673474E68D28EBA769
        CC872B24E494421CF085B92CECB279B6C3DE451FB7C5FB0F439210AD5B3F35B5
        111995A296048212721AAC6662FBDBEFF9F16B63EFA147370000000049454E44
        AE426082}
      RepeatPause = 10
      Rounded = False
      TabOrder = 14
      OnClick = IDDupCheckButtonClick
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
    object CompanyExistsCheckBox: TcxCheckBox
      Left = 360
      Top = 228
      Caption = ' '#48376#49324#44428#54620' '#51228#50808
      ParentFont = False
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 15
    end
    object TrdCodeEdit: TcxButtonEdit
      Left = 104
      Top = 197
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ClickKey = 112
      Properties.ImeMode = imSHanguel
      Properties.OnButtonClick = TtrCodeEditPropertiesButtonClick
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 16
      Visible = False
      Width = 89
    end
    object TrdNameEdit: TcxTextEdit
      Left = 195
      Top = 197
      TabStop = False
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = 14737632
      Style.StyleController = EditStyleController
      TabOrder = 17
      Visible = False
      Width = 242
    end
  end
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 21
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited AdvOfficeTabSetOfficeStyler: TAdvOfficeTabSetOfficeStyler
    Left = 248
    Top = 240
  end
end
