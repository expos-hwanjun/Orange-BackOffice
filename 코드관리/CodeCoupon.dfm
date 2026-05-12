inherited CodeCouponForm: TCodeCouponForm
  Caption = #53216#54256#48156#54665
  ClientHeight = 662
  ClientWidth = 950
  ExplicitWidth = 966
  ExplicitHeight = 701
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 336
    Height = 597
    ExplicitLeft = 336
    ExplicitHeight = 597
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 950
    ExplicitWidth = 950
    inherited ConditionToolBar: TAdvToolBar
      Width = 708
      ExplicitWidth = 708
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        Left = 2
        TabOrder = 2
        ExplicitLeft = 2
      end
      inherited ConditionToolBarDateLabel: TcxLabel
        Left = 488
        Caption = #53216#54256#48264#54840
        Visible = True
        ExplicitLeft = 488
        AnchorX = 521
        AnchorY = 16
      end
      inherited ConditionToolBarToDateEdit: TcxDateEdit
        Left = 110
        TabOrder = 3
        ExplicitLeft = 110
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        Left = 92
        ExplicitLeft = 92
        AnchorX = 101
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        Left = 200
        Caption = #48156#54665#44396#48516
        Visible = True
        ExplicitLeft = 200
        AnchorX = 233
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Left = 265
        Properties.Alignment.Horz = taCenter
        Properties.Items.Strings = (
          '['#51204#52404']'
          #51076#51032#48156#54665
          #51088#46041#48156#54665)
        TabOrder = 0
        Text = '['#51204#52404']'
        Visible = True
        ExplicitLeft = 265
        ExplicitWidth = 79
        Width = 79
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 553
        TabOrder = 1
        Visible = True
        ExplicitLeft = 553
        ExplicitWidth = 151
        Width = 151
      end
      object cxLabel1: TcxLabel
        Left = 344
        Top = 2
        AutoSize = False
        Caption = #49345#53468
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 27
        Width = 65
        AnchorX = 377
        AnchorY = 16
      end
      object ConditionToolBarStatusComboBox: TcxComboBox
        Left = 409
        Top = 2
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '['#51204#52404']'
          #48120#49324#50857
          #49324#50857
          #54224#44592)
        Properties.OnChange = ConditionToolBarEditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 8
        Text = '['#51204#52404']'
        Height = 25
        Width = 79
      end
    end
  end
  inherited GridPanel: TPanel
    Width = 336
    Height = 597
    ExplicitWidth = 336
    ExplicitHeight = 597
    inherited Grid: TcxGrid
      Width = 330
      Height = 591
      ExplicitWidth = 330
      ExplicitHeight = 591
      inherited GridTableView: TcxGridTableView
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0 '#44148
            Kind = skCount
            Column = GridTableViewCouponName
          end>
        OptionsView.Footer = True
        Styles.OnGetContentStyle = GridTableViewStylesGetContentStyle
        object GridTableViewCouponNo: TcxGridColumn
          Caption = #53216#54256#48264#54840
          DataBinding.FieldName = 'NO_COUPON'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 99
        end
        object GridTableViewCouponName: TcxGridColumn
          Caption = #53216#54256#51060#47492
          DataBinding.FieldName = 'NM_COUPON'
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 142
        end
        object GridTableViewStatus: TcxGridColumn
          Caption = #49345#53468
          DataBinding.FieldName = 'DS_STATUS'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 342
    Width = 608
    Height = 597
    ExplicitLeft = 342
    ExplicitWidth = 608
    ExplicitHeight = 597
    object CouponNoLabel: TLabel
      Left = 20
      Top = 13
      Width = 52
      Height = 17
      Caption = #53216#54256#48264#54840
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object CouponNameLabel: TLabel
      Left = 20
      Top = 44
      Width = 52
      Height = 17
      Caption = #53216#54256#51060#47492
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label1: TLabel
      Left = 20
      Top = 75
      Width = 52
      Height = 17
      Caption = #49324#50857#44592#44036
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 197
      Top = 76
      Width = 9
      Height = 17
      Caption = '~'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label23: TLabel
      Left = 328
      Top = 75
      Width = 104
      Height = 17
      Caption = '('#50630#51004#47732' '#51228#54620#50630#51020')'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object CountLabel: TLabel
      Left = 527
      Top = 10
      Width = 13
      Height = 17
      Caption = #47588
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 20
      Top = 206
      Width = 52
      Height = 17
      Caption = #53216#54256#44552#50529
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label7: TLabel
      Left = 7
      Top = 106
      Width = 65
      Height = 17
      Caption = #48156#54665#50689#49688#51613
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 21
      Top = 454
      Width = 51
      Height = 17
      Caption = #49345'     '#53468
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 7
      Top = 139
      Width = 65
      Height = 17
      Caption = #49324#50857#50689#49688#51613
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label6: TLabel
      Left = 20
      Top = 171
      Width = 52
      Height = 17
      Caption = #53216#54256#50976#54805
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label8: TLabel
      Left = 20
      Top = 393
      Width = 51
      Height = 17
      Caption = #48708'     '#44256
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label9: TLabel
      Left = 21
      Top = 237
      Width = 52
      Height = 17
      Caption = #52572#49548#44396#47588
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label10: TLabel
      Left = 21
      Top = 300
      Width = 52
      Height = 17
      Caption = #54624#51064#45824#49345
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object MemberLabel: TLabel
      Left = 21
      Top = 332
      Width = 52
      Height = 17
      Caption = #54624#51064#54924#50896
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label11: TLabel
      Left = 21
      Top = 268
      Width = 52
      Height = 17
      Caption = #52572#45824#54624#51064
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label12: TLabel
      Left = 343
      Top = 332
      Width = 274
      Height = 17
      Caption = #8251' '#54624#51064#45824#49345' '#54924#50896' '#49884' '#54624#51064#54924#50896' '#50630#51004#47732' '#51204#52404#54924#50896
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label13: TLabel
      Left = 21
      Top = 363
      Width = 51
      Height = 17
      Caption = #47700'     '#45684
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object CouponNoEdit: TcxTextEdit
      Left = 80
      Top = 10
      ParentFont = False
      Properties.ImeMode = imSAlpha
      Properties.MaxLength = 30
      Properties.ReadOnly = False
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 0
      Width = 146
    end
    object CouponNameEdit: TcxTextEdit
      Left = 80
      Top = 41
      ParentFont = False
      Properties.ImeMode = imSHanguel
      Properties.MaxLength = 80
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 3
      Width = 242
    end
    object CouponDateFromEdit: TcxDateEdit
      Left = 80
      Top = 72
      ParentFont = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 4
      Width = 110
    end
    object CouponDateToEdit: TcxDateEdit
      Left = 212
      Top = 72
      ParentFont = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 5
      Width = 110
    end
    object CountEdit: TcxCurrencyEdit
      Left = 480
      Top = 7
      TabStop = False
      EditValue = 1
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.AssignedValues.EditFormat = True
      Properties.DisplayFormat = ',0'
      Properties.ImeMode = imSAlpha
      Properties.MaxLength = 4
      Properties.MinValue = 1.000000000000000000
      Properties.UseDisplayFormatWhenEditing = True
      Properties.UseLeftAlignmentOnEditing = False
      Properties.UseThousandSeparator = True
      Style.StyleController = EditStyleController
      TabOrder = 1
      Width = 41
    end
    object DcAmtEdit: TcxCurrencyEdit
      Left = 80
      Top = 201
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.AssignedValues.EditFormat = True
      Properties.DisplayFormat = ',0'
      Properties.ImeMode = imSAlpha
      Properties.UseDisplayFormatWhenEditing = True
      Properties.UseLeftAlignmentOnEditing = False
      Properties.UseThousandSeparator = True
      Properties.OnChange = EditPropertiesChange
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -13
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = []
      Style.StyleController = EditStyleController
      Style.IsFontAssigned = True
      TabOrder = 9
      Width = 90
    end
    object IssueRcpNoEdit: TcxMaskEdit
      Left = 80
      Top = 104
      Enabled = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.EditMask = '00000000\-00\-0000;1;_'
      Properties.MaxLength = 0
      Style.Color = clBtnFace
      Style.StyleController = EditStyleController
      TabOrder = 6
      Text = '        -  -    '
      Width = 117
    end
    object SaleRcpNoEdit: TcxMaskEdit
      Left = 80
      Top = 136
      Enabled = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.EditMask = '00000000\-00\-0000;1;_'
      Properties.MaxLength = 0
      Style.Color = clBtnFace
      Style.StyleController = EditStyleController
      TabOrder = 7
      Text = '        -  -    '
      Width = 117
    end
    object StatusComboBox: TcxComboBox
      Left = 80
      Top = 450
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #48120#49324#50857
        #49324#50857
        #54224#44592)
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 16
      Text = #48120#49324#50857
      Width = 112
    end
    object TypeComboBox: TcxComboBox
      Left = 80
      Top = 168
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #54788#44552#53216#54256
        #54624#51064#53216#54256)
      Properties.OnChange = EditPropertiesChange
      Style.Color = 15856113
      Style.StyleController = EditStyleController
      TabOrder = 8
      Text = #54788#44552#53216#54256
      Width = 90
    end
    object RatePercentLabel: TcxLabel
      Left = 174
      Top = 202
      AutoSize = False
      Caption = #50896
      ParentFont = False
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -13
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Height = 21
      Width = 16
      AnchorX = 182
      AnchorY = 213
    end
    object RemarkMemo: TcxMemo
      Left = 80
      Top = 390
      ParentFont = False
      Properties.ImeMode = imSHanguel
      Properties.MaxLength = 100
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 15
      Height = 51
      Width = 468
    end
    object SaleAmtEdit: TcxCurrencyEdit
      Left = 80
      Top = 233
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.AssignedValues.EditFormat = True
      Properties.DisplayFormat = ',0'
      Properties.ImeMode = imSAlpha
      Properties.UseDisplayFormatWhenEditing = True
      Properties.UseLeftAlignmentOnEditing = False
      Properties.UseThousandSeparator = True
      Properties.OnChange = EditPropertiesChange
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -13
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = []
      Style.StyleController = EditStyleController
      Style.TextColor = clBlack
      Style.IsFontAssigned = True
      TabOrder = 10
      Width = 90
    end
    object TargetComboBox: TcxComboBox
      Left = 80
      Top = 296
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #51204#52404
        #54924#50896)
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 12
      Text = #51204#52404
      Width = 91
    end
    object MemberCodeEdit: TcxButtonEdit
      Left = 80
      Top = 328
      Enabled = False
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ClickKey = 112
      Properties.ImeMode = imSHanguel
      Properties.OnButtonClick = MemberCodeEditPropertiesButtonClick
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 13
      Width = 106
    end
    object MemberNameEdit: TcxTextEdit
      Left = 187
      Top = 328
      TabStop = False
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = 15856113
      Style.StyleController = EditStyleController
      TabOrder = 18
      Width = 150
    end
    object MaxDcAmtEdit: TcxCurrencyEdit
      Left = 80
      Top = 264
      EditValue = 0.000000000000000000
      Enabled = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.AssignedValues.EditFormat = True
      Properties.DisplayFormat = ',0'
      Properties.ImeMode = imSAlpha
      Properties.UseDisplayFormatWhenEditing = True
      Properties.UseLeftAlignmentOnEditing = False
      Properties.UseThousandSeparator = True
      Properties.OnChange = EditPropertiesChange
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -13
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = []
      Style.StyleController = EditStyleController
      Style.TextColor = clBlack
      Style.IsFontAssigned = True
      TabOrder = 11
      Width = 90
    end
    object MenuCodeEdit: TcxButtonEdit
      Left = 80
      Top = 359
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ClickKey = 112
      Properties.ImeMode = imSHanguel
      Properties.OnButtonClick = MenuCodeEditPropertiesButtonClick
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 14
      Width = 106
    end
    object MenuNameEdit: TcxTextEdit
      Left = 187
      Top = 359
      TabStop = False
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = 15856113
      Style.StyleController = EditStyleController
      TabOrder = 19
      Width = 262
    end
    object CouponNoCreateButton: TAdvGlowButton
      Left = 232
      Top = 10
      Width = 66
      Height = 25
      Caption = #49688#46041#51077#47141
      Font.Charset = HANGEUL_CHARSET
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
      Rounded = True
      TabOrder = 2
      OnClick = CouponNoCreateButtonClick
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
    object AutoCreateButton: TAdvGlowButton
      Left = 553
      Top = 7
      Width = 44
      Height = 25
      Caption = #49373#49457
      Font.Charset = HANGEUL_CHARSET
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
      Rounded = True
      TabOrder = 20
      OnClick = AutoCreateButtonClick
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
    object CouponNumberPanel: TAdvPanel
      Left = 414
      Top = 35
      Width = 183
      Height = 250
      Color = clWhite
      TabOrder = 21
      UseDockManager = True
      Visible = False
      Version = '2.5.11.0'
      BorderColor = clBlack
      BorderWidth = 1
      CanSize = True
      Caption.Color = clHighlight
      Caption.ColorTo = clNone
      Caption.Font.Charset = HANGEUL_CHARSET
      Caption.Font.Color = clWindowText
      Caption.Font.Height = -13
      Caption.Font.Name = #47569#51008' '#44256#46357
      Caption.Font.Style = []
      Caption.Indent = 0
      DoubleBuffered = True
      StatusBar.Font.Charset = DEFAULT_CHARSET
      StatusBar.Font.Color = clWindowText
      StatusBar.Font.Height = -11
      StatusBar.Font.Name = 'Tahoma'
      StatusBar.Font.Style = []
      Text = ''
      FullHeight = 200
      object CouponNumberMemo: TcxMemo
        Left = 1
        Top = 1
        Align = alClient
        ParentFont = False
        Style.BorderStyle = ebsNone
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.StyleController = EditStyleController
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 248
        Width = 181
      end
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
end
