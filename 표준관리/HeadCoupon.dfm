inherited HeadCouponForm: THeadCouponForm
  Caption = #54364#51456' '#53216#54256#44288#47532
  ClientWidth = 982
  ExplicitWidth = 998
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 336
    ExplicitLeft = 336
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 982
    ExplicitWidth = 982
    inherited ConditionToolBar: TAdvToolBar
      Width = 558
      ExplicitWidth = 558
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        Left = 2
        TabOrder = 2
        ExplicitLeft = 2
      end
      inherited ConditionToolBarDateLabel: TcxLabel
        Left = 338
        Caption = #53216#54256#48264#54840
        Visible = True
        ExplicitLeft = 338
        AnchorX = 371
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
        Caption = #49345#53468
        Visible = True
        ExplicitLeft = 200
        ExplicitWidth = 59
        Width = 59
        AnchorX = 230
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Left = 259
        Properties.Alignment.Horz = taCenter
        Properties.Items.Strings = (
          '['#51204#52404']'
          #48120#49324#50857
          #49324#50857
          #54224#44592)
        TabOrder = 0
        Text = '['#51204#52404']'
        Visible = True
        ExplicitLeft = 259
        ExplicitWidth = 79
        Width = 79
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 403
        TabOrder = 1
        Visible = True
        ExplicitLeft = 403
        ExplicitWidth = 151
        Width = 151
      end
    end
  end
  inherited GridPanel: TPanel
    Width = 336
    ExplicitWidth = 336
    inherited Grid: TcxGrid
      Width = 330
      ExplicitWidth = 330
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
    Width = 640
    ExplicitLeft = 342
    ExplicitWidth = 640
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
      Left = 540
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
      Left = 21
      Top = 141
      Width = 52
      Height = 17
      Caption = #54624#51064#44552#50529
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
      Top = 387
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
    object Label6: TLabel
      Left = 21
      Top = 171
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
    object Label8: TLabel
      Left = 20
      Top = 327
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
    object Label7: TLabel
      Left = 21
      Top = 234
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
      Top = 266
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
    object Label10: TLabel
      Left = 21
      Top = 108
      Width = 52
      Height = 17
      Caption = #54624#51064#50976#54805
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
      Top = 202
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
    object Label3: TLabel
      Left = 343
      Top = 266
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
      Top = 297
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
      Left = 488
      Top = 6
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
      Width = 45
    end
    object DcAmtEdit: TcxCurrencyEdit
      Left = 80
      Top = 136
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
      TabOrder = 7
      Width = 90
    end
    object StatusComboBox: TcxComboBox
      Left = 80
      Top = 383
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #48120#49324#50857
        #49324#50857
        #54224#44592)
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 13
      Text = #48120#49324#50857
      Width = 112
    end
    object RatePercentLabel: TcxLabel
      Left = 175
      Top = 138
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
      AnchorX = 183
      AnchorY = 149
    end
    object RemarkMemo: TcxMemo
      Left = 80
      Top = 325
      ParentFont = False
      Properties.ImeMode = imSHanguel
      Properties.MaxLength = 100
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 12
      Height = 51
      Width = 468
    end
    object SaleAmtEdit: TcxCurrencyEdit
      Left = 80
      Top = 167
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
      TabOrder = 8
      Width = 90
    end
    object TargetComboBox: TcxComboBox
      Left = 80
      Top = 230
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #51204#52404
        #54924#50896)
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 9
      Text = #51204#52404
      Width = 91
    end
    object MemberCodeEdit: TcxButtonEdit
      Left = 80
      Top = 262
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
      TabOrder = 10
      Width = 106
    end
    object MemberNameEdit: TcxTextEdit
      Left = 187
      Top = 262
      TabStop = False
      Enabled = False
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = 14737632
      Style.StyleController = EditStyleController
      TabOrder = 15
      Width = 150
    end
    object TypeComboBox: TcxComboBox
      Left = 80
      Top = 105
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #44552#50529#54624#51064
        #54624#51064#50984#54624#51064)
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 6
      Text = #44552#50529#54624#51064
      Width = 109
    end
    object MaxDcAmtEdit: TcxCurrencyEdit
      Left = 80
      Top = 198
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
      TabOrder = 16
      Width = 90
    end
    object MenuCodeEdit: TcxButtonEdit
      Left = 80
      Top = 293
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
      TabOrder = 11
      Width = 106
    end
    object MenuNameEdit: TcxTextEdit
      Left = 187
      Top = 293
      TabStop = False
      Enabled = False
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = 14737632
      Style.StyleController = EditStyleController
      TabOrder = 17
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
      Left = 564
      Top = 6
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
      TabOrder = 18
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
      Left = 471
      Top = 35
      Width = 136
      Height = 326
      Color = clWhite
      TabOrder = 19
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
        Height = 324
        Width = 134
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
