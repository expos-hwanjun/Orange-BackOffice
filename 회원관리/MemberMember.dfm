inherited MemberMemberForm: TMemberMemberForm
  Left = 300
  Top = 120
  Caption = #54924#50896' '#44288#47532
  ClientHeight = 892
  ClientWidth = 1099
  ExplicitWidth = 1115
  ExplicitHeight = 931
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 442
    Top = 83
    Height = 511
    ExplicitLeft = 267
    ExplicitTop = 33
    ExplicitHeight = 573
  end
  object AdvSplitter1: TAdvSplitter [1]
    Left = 0
    Top = 594
    Width = 1099
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    MinSize = 50
    Appearance.BorderColor = clNone
    Appearance.BorderColorHot = clNone
    Appearance.Color = 14542308
    Appearance.ColorTo = 16768709
    Appearance.ColorHot = 15383705
    Appearance.ColorHotTo = 14922381
    GripStyle = sgFlatDots
    ExplicitLeft = -113
    ExplicitTop = 595
    ExplicitWidth = 1011
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1099
    ExplicitWidth = 1099
    inherited ButtonToolBar: TAdvToolBar
      Left = 492
      ExplicitLeft = 492
    end
    inherited ConditionToolBar: TAdvToolBar
      Width = 476
      ExplicitWidth = 476
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        Left = 156
        ExplicitLeft = 156
      end
      inherited ConditionToolBarDateLabel: TcxLabel
        Left = 472
        ExplicitLeft = 472
        ExplicitWidth = 0
        Width = 0
        AnchorX = 472
        AnchorY = 16
      end
      inherited ConditionToolBarToDateEdit: TcxDateEdit
        Left = 472
        ExplicitLeft = 472
        ExplicitWidth = 0
        Width = 0
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        Left = 246
        ExplicitLeft = 246
        AnchorX = 255
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        Left = 264
        Visible = True
        ExplicitLeft = 264
        ExplicitWidth = 60
        Width = 60
        AnchorX = 294
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Left = 76
        ExplicitLeft = 76
        ExplicitWidth = 80
        Width = 80
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 324
        Hint = #54924#50896#51060#47492', '#54924#50896#48264#54840', '#52852#46300#48264#54840', '#51204#54868#48264#54840' '#46321'...'
        ParentShowHint = False
        ShowHint = True
        Visible = True
        ExplicitLeft = 324
        ExplicitWidth = 148
        Width = 148
      end
      object ConditionToolBarStatusLabel: TcxLabel
        Left = 2
        Top = 2
        AutoSize = False
        Caption = #51312#54924#44592#44036
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Visible = False
        Height = 27
        Width = 74
        AnchorX = 39
        AnchorY = 16
      end
    end
  end
  inherited GridPanel: TPanel
    Top = 83
    Width = 442
    Height = 511
    ExplicitTop = 83
    ExplicitWidth = 442
    ExplicitHeight = 511
    inherited Grid: TcxGrid
      Width = 436
      Height = 505
      ExplicitWidth = 436
      ExplicitHeight = 505
      inherited GridTableView: TcxGridTableView
        Tag = 99
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0'#44148
            Kind = skCount
            Column = GridTableViewMemberNo
          end>
        OptionsView.Footer = True
        Styles.OnGetContentStyle = GridTableViewStylesGetContentStyle
        object GridTableViewMemberNo: TcxGridColumn
          Tag = 98
          Caption = #54924#50896#48264#54840
          DataBinding.FieldName = 'CD_MEMBER'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Width = 80
        end
        object GridTableViewMemberName: TcxGridColumn
          Tag = 98
          Caption = #54924#50896#51060#47492
          DataBinding.FieldName = 'NM_MEMBER'
          HeaderAlignmentHorz = taCenter
          Width = 140
        end
        object GridTableViewDsStatus: TcxGridColumn
          Tag = 99
          Caption = #49345#53468
          DataBinding.FieldName = 'DS_STATUS'
          PropertiesClassName = 'TcxTextEditProperties'
          Visible = False
        end
        object GridTableViewCardNo: TcxGridColumn
          Caption = #52852#46300#48264#54840
          DataBinding.FieldName = 'NO_CARD'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 98
        end
        object GridTableViewTelNo: TcxGridColumn
          Caption = #55092#45824#51204#54868
          DataBinding.FieldName = 'NO_TEL'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 95
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 448
    Top = 83
    Width = 651
    Height = 511
    ExplicitLeft = 448
    ExplicitTop = 83
    ExplicitWidth = 651
    ExplicitHeight = 511
    object MainPager: TcxPageControl
      Left = 0
      Top = 0
      Width = 651
      Height = 511
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = MemberPage
      Properties.CustomButtons.Buttons = <>
      Properties.TabWidth = 80
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      ClientRectBottom = 511
      ClientRectRight = 651
      ClientRectTop = 28
      object MemberPage: TcxTabSheet
        Caption = #54924#50896#51221#48372
        ImageIndex = 0
        object MemberNoLabel: TLabel
          Left = 20
          Top = 13
          Width = 52
          Height = 17
          Caption = #54924#50896#48264#54840
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object MemberNameLabel: TLabel
          Left = 20
          Top = 42
          Width = 52
          Height = 17
          Caption = #54924#50896#51060#47492
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object TelNoLabel: TLabel
          Left = 20
          Top = 158
          Width = 52
          Height = 17
          Caption = #51088#53469#51204#54868
          Transparent = True
        end
        object CompanyTelNoLabel: TLabel
          Left = 20
          Top = 187
          Width = 52
          Height = 17
          Caption = #44592#53440#51204#54868
          Transparent = True
        end
        object AddrLabel: TLabel
          Left = 20
          Top = 218
          Width = 52
          Height = 17
          Caption = #51452#12288#12288#49548
          Transparent = True
        end
        object EMailLabel: TLabel
          Left = 20
          Top = 305
          Width = 47
          Height = 17
          Caption = 'E - Mail'
          Transparent = True
        end
        object RemarkLabel: TLabel
          Left = 20
          Top = 364
          Width = 52
          Height = 17
          Caption = #48708#12288#12288#44256
          Transparent = True
        end
        object StatusLabel: TLabel
          Left = 20
          Top = 421
          Width = 52
          Height = 17
          Caption = #49345#12288#12288#53468
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object MemberTypeLabel: TLabel
          Left = 20
          Top = 71
          Width = 52
          Height = 17
          Caption = #54924#50896#44396#48516
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object CardNoLabel: TLabel
          Left = 20
          Top = 100
          Width = 52
          Height = 17
          Caption = #52852#46300#48264#54840
          Transparent = True
        end
        object MobileNoLabel: TLabel
          Left = 20
          Top = 129
          Width = 52
          Height = 17
          Caption = #55092#45824#51204#54868
          Transparent = True
        end
        object CreditLabel: TLabel
          Left = 20
          Top = 334
          Width = 52
          Height = 17
          Caption = #50808#49345#50668#48512
          Transparent = True
        end
        object JoinDateLabel: TLabel
          Left = 387
          Top = 334
          Width = 52
          Height = 17
          Caption = #44032#51077#51068#51088
          Transparent = True
        end
        object CashReceiptNoLabel: TLabel
          Left = 20
          Top = 276
          Width = 52
          Height = 17
          Caption = #49885#48324#48264#54840
          Transparent = True
        end
        object MemberNoEdit: TcxTextEdit
          Left = 78
          Top = 8
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 10
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 90
        end
        object MemberNameEdit: TcxTextEdit
          Left = 80
          Top = 39
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 40
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 266
        end
        object TelNoEdit: TcxTextEdit
          Left = 80
          Top = 155
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 13
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 2
          Width = 130
        end
        object Etc1TelNoEdit: TcxTextEdit
          Left = 80
          Top = 184
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 13
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 3
          Width = 130
        end
        object ZipCodeEdit: TcxButtonEdit
          Left = 80
          Top = 215
          ParentFont = False
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
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 4
          Text = '   -   '
          Width = 80
        end
        object Addr1Edit: TcxTextEdit
          Left = 165
          Top = 215
          TabStop = False
          ParentFont = False
          Properties.MaxLength = 80
          Properties.ReadOnly = False
          Style.Color = clWhite
          Style.StyleController = EditStyleController
          StyleFocused.Color = 14737632
          TabOrder = 5
          Width = 385
        end
        object Addr2Edit: TcxTextEdit
          Left = 165
          Top = 244
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 6
          Width = 385
        end
        object EMailEdit: TcxTextEdit
          Left = 80
          Top = 302
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 40
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 7
          Width = 250
        end
        object RemarkMemo: TcxMemo
          Left = 80
          Top = 361
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 300
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 8
          Height = 51
          Width = 468
        end
        object StatusComboBox: TcxComboBox
          Left = 80
          Top = 418
          Hint = 'DS_STATUS'
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownListStyle = lsFixedList
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 9
          Width = 130
        end
        object MemberTypeComboBox: TcxComboBox
          Left = 80
          Top = 68
          Hint = 'DS_MEMBER'
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50629#51088
            #44060#51064)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 10
          Text = #49324#50629#51088
          Width = 130
        end
        object CardNoEdit: TcxTextEdit
          Left = 80
          Top = 97
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 20
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 11
          Width = 130
        end
        object MobileNoEdit: TcxTextEdit
          Left = 80
          Top = 126
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 13
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 12
          Width = 130
        end
        object CreditComboBox: TcxComboBox
          Left = 80
          Top = 331
          Hint = 'YN_TRUST'
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #48520#44032#45733
            #44032#45733)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 13
          Text = #48520#44032#45733
          Width = 130
        end
        object JoinDateEdit: TcxDateEdit
          Left = 447
          Top = 330
          Hint = 'YMD_ISU'
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.ImmediatePost = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 14
          Width = 101
        end
        object MemberGroupBox: TcxGroupBox
          Left = 367
          Top = 4
          Caption = ' '#51060#50857' '#51221#48372' '
          ParentFont = False
          Style.StyleController = EditStyleController
          TabOrder = 15
          Height = 205
          Width = 200
          object LastVisitDateLabel: TLabel
            Left = 10
            Top = 23
            Width = 65
            Height = 17
            Caption = #52572#51333#48169#47928#51068
            Transparent = True
          end
          object VisitCountLabel: TLabel
            Left = 10
            Top = 53
            Width = 65
            Height = 17
            Caption = #52509#48169#47928#54943#49688
            Transparent = True
          end
          object SaleAmountLabel: TLabel
            Left = 10
            Top = 83
            Width = 65
            Height = 17
            Caption = #52509#44396#47588#44552#50529
            Transparent = True
          end
          object RemainPointLabel: TLabel
            Left = 10
            Top = 113
            Width = 65
            Height = 17
            Caption = #51092#50668#54252#51064#53944
            Transparent = True
          end
          object Label1: TLabel
            Left = 10
            Top = 143
            Width = 62
            Height = 17
            Caption = #50808#49345'  '#44552#50529
            Transparent = True
          end
          object Label11: TLabel
            Left = 10
            Top = 174
            Width = 65
            Height = 17
            Caption = #51092#50668#49828#53596#54532
            Transparent = True
          end
          object LastVisitDateEdit: TcxTextEdit
            Left = 80
            Top = 20
            TabStop = False
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.ImeMode = imSAlpha
            Properties.MaxLength = 20
            Properties.ReadOnly = True
            Style.Color = 15856113
            Style.StyleController = EditStyleController
            TabOrder = 0
            Width = 105
          end
          object VisitCountEdit: TcxCurrencyEdit
            Left = 80
            Top = 50
            TabStop = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0'
            Properties.ReadOnly = True
            Style.Color = 15856113
            Style.StyleController = EditStyleController
            TabOrder = 1
            Width = 105
          end
          object SaleAmountEdit: TcxCurrencyEdit
            Left = 80
            Top = 80
            TabStop = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0'
            Properties.ReadOnly = True
            Style.Color = 15856113
            Style.StyleController = EditStyleController
            TabOrder = 2
            Width = 105
          end
          object RemainPointEdit: TcxCurrencyEdit
            Left = 80
            Top = 110
            TabStop = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0'
            Properties.ReadOnly = True
            Style.Color = 15856113
            Style.StyleController = EditStyleController
            TabOrder = 3
            Width = 105
          end
          object TrustAmtEdit: TcxCurrencyEdit
            Left = 80
            Top = 140
            TabStop = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0'
            Properties.ReadOnly = True
            Style.Color = 15856113
            Style.StyleController = EditStyleController
            TabOrder = 4
            Width = 105
          end
          object StampCountEdit: TcxCurrencyEdit
            Left = 80
            Top = 171
            TabStop = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0'
            Properties.ReadOnly = True
            Style.Color = 15856113
            Style.StyleController = EditStyleController
            TabOrder = 5
            Width = 105
          end
        end
        object CashReceiptNoEdit: TcxTextEdit
          Left = 80
          Top = 273
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 38
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 16
          Width = 250
        end
        object Etc2TelNoEdit: TcxTextEdit
          Left = 216
          Top = 184
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 13
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 17
          Width = 130
        end
        object MemberNoCreateButton: TAdvGlowButton
          Left = 173
          Top = 10
          Width = 38
          Height = 25
          Caption = #49373#49457
          FocusType = ftHot
          MarginVert = 5
          MarginHorz = 5
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          RepeatPause = 10
          Rounded = True
          TabOrder = 18
          OnClick = MemberNoCreateButtonClick
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
        object PointAddButton: TAdvGlowButton
          Left = 340
          Top = 273
          Width = 102
          Height = 54
          Caption = #54252#51064#53944#51201#47549
          FocusType = ftHot
          MarginVert = 5
          MarginHorz = 5
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          RepeatPause = 10
          Rounded = True
          TabOrder = 19
          OnClick = PointAddButtonClick
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
        object PointUseButton: TAdvGlowButton
          Left = 448
          Top = 273
          Width = 102
          Height = 54
          Caption = #54252#51064#53944#49324#50857
          FocusType = ftHot
          MarginVert = 5
          MarginHorz = 5
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          RepeatPause = 10
          Rounded = True
          TabOrder = 20
          OnClick = PointAddButtonClick
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
        object ComPortOpenButton: TAdvGlassButton
          Left = 298
          Top = 95
          Width = 43
          Height = 27
          BackColor = 16760205
          CornerRadius = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ForeColor = clWhite
          ForceTransparent = True
          GlowColor = 16760205
          ImageIndex = -1
          InnerBorderColor = clWhite
          Layout = blGlyphRight
          OuterBorderColor = 16760205
          Picture.Data = {
            89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
            0D00000006624B474400FF00FF00FFA0BDA793000001E049444154388DED9331
            6814611046DFB773EB71601344C2050D2869643948F63F4827E47A096867B04C
            88204AC026A01094586950B03108DAA4D2228D5DA2B629764F90602392884DB0
            898D241CFF8ECD696179D7E6B533DF638A6FE0846111C0F4F4F468AFD73B378C
            284DD31F3B3B3B070A21DC01AE49FA328CD0DD2F016F082174816418599F2484
            50D40007AA3CCFE7818EA47D777F276909F86D66F7638C6B0031C625335B051A
            C09ABB5F01C6256D1745F11250021CB65AAD11493365595EEF2FCCD66AB5DBC0
            B718E39CA457925E9BD90DE06B7F360B8CF7339D56AB35021C5AB3D96CA7697A
            20E953B3D97C24690B781B637C28E9D7D1D1D193344D6F555535717C7CFCC0CC
            2E575575D5CC1E038C8D8DDD4D92E485999D71F751851016DDBD2ACB721D5008
            6155D279775F71F78EA41949EBEE2E601E780F7C90B45255D57E5996F700F23C
            5F909424EEBE2B2903989C9C9C007A66B60C2C029DA228E6DC7D01982F8A620E
            E80037CD6C5952CCF37C024052E6EEBB49BD5EFF2734B33D4917638CCF246D4A
            DA0B216C48DA92B41D42D800F680CD18E33377BF2069FFAFB05EAFEF02104228
            B22C3B35685FB22C3BDDAF1F3500777FDE68343EB6DBEDCF033A5BEEFE14FAAF
            073035357556D2F8203677FFDEED767F0E78CC09FFF1071E57B7B1C567D11700
            00000049454E44AE426082}
          PictureDown.Data = {
            89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
            0D00000006624B474400FF00FF00FFA0BDA793000001E049444154388DED9331
            6814611046DFB773EB71601344C2050D2869643948F63F4827E47A096867B04C
            88204AC026A01094586950B03108DAA4D2228D5DA2B629764F90602392884DB0
            898D241CFF8ECD696179D7E6B533DF638A6FE0846111C0F4F4F468AFD73B378C
            284DD31F3B3B3B070A21DC01AE49FA328CD0DD2F016F082174816418599F2484
            50D40007AA3CCFE7818EA47D777F276909F86D66F7638C6B0031C625335B051A
            C09ABB5F01C6256D1745F11250021CB65AAD11493365595EEF2FCCD66AB5DBC0
            B718E39CA457925E9BD90DE06B7F360B8CF7339D56AB35021C5AB3D96CA7697A
            20E953B3D97C24690B781B637C28E9D7D1D1D193344D6F555535717C7CFCC0CC
            2E575575D5CC1E038C8D8DDD4D92E485999D71F751851016DDBD2ACB721D5008
            6155D279775F71F78EA41949EBEE2E601E780F7C90B45255D57E5996F700F23C
            5F909424EEBE2B2903989C9C9C007A66B60C2C029DA228E6DC7D01982F8A620E
            E80037CD6C5952CCF37C024052E6EEBB49BD5EFF2734B33D4917638CCF246D4A
            DA0B216C48DA92B41D42D800F680CD18E33377BF2069FFAFB05EAFEF02104228
            B22C3B35685FB22C3BDDAF1F3500777FDE68343EB6DBEDCF033A5BEEFE14FAAF
            073035357556D2F8203677FFDEED767F0E78CC09FFF1071E57B7B1C567D11700
            00000049454E44AE426082}
          PictureDisabled.Data = {
            89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
            0D000000097048597300000B1300000B1301009A9C180000022E49444154789C
            ED53BF6B9441107D9E41CCDDCC85A8E771773B170241E5C042144162C04A4188
            76B6C11F519BA89D761F2433DFA5105444C4C2524B05112C94282944111514D1
            421B11D1421041D44222F3DDDEE51222E40FC883657767F7BD999D990556B000
            0972623452573A1B949B75E55375A30696813280ED71881BAA29EF12E35762FC
            379B956782D207319E0B46776BD3BD2172B7449E6B64380D6016C0B538866A29
            EF0FCABF45E946756A6DE6A00DD1E20E517A128C3FD7A7FA0601EC8B3CD798F0
            3B2F01E4DA84412B9483D277513AFFBFE754924A3E8BD8E899A7259A7D7EEE8B
            17D170CCC30EC6D362F40E097A96129394C744F99147175F71B0EB38D39A01D0
            0FE0AA6F82F25B313AB794586DAAB02718FFF1E264778DEE88D1F578DC1FB570
            19C0308081D625FE25291F88E2472A096DC88A34C99BC5E85B50BAD876108C53
            317E18B7C3510B27018C772E79FEAC70C8F31494DF88F147511E0D46EF45F976
            57CE3CC20BA2742F6E8F0338E18B1100F35E956783D1255F97921289D14D6F15
            317AEA4EBA53E04509C6D371EB9CDDEDB7DFEFE4C9685C947ED4355FE9221E2D
            27858D0B8B53DCEB3D1A260B5BA3E9018075ED732FF79A6C95A0C73D7B44D594
            D72F551C1709C65FC5F84A34516CBF0E0E03781C1B7434686F4D945F8BF1A760
            C589901687EACDBEFE81667E5BAB10F4538C6F35922C8833913BB6D871297EA1
            C67CFE7832287F69E5B035BCADBCFA98C32A00AB23C7B9CB44825C35E54D418B
            3B177FC315C0F10F28FB9CFB2E18D5750000000049454E44AE426082}
          ParentFont = False
          ShineColor = clWhite
          TabOrder = 21
          TabStop = False
          Version = '1.3.3.0'
          OnClick = ComPortOpenButtonClick
        end
        object ComPortComboBox: TcxComboBox
          Left = 212
          Top = 96
          TabStop = False
          AutoSize = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.DropDownListStyle = lsFixedList
          Style.StyleController = EditStyleController
          TabOrder = 22
          Height = 25
          Width = 83
        end
      end
      object DetailPage: TcxTabSheet
        Caption = #49345#49464#51221#48372
        ImageIndex = 1
        object IDNoLabel: TLabel
          Left = 20
          Top = 19
          Width = 52
          Height = 17
          Caption = #51452#48124#48264#54840
          Transparent = True
        end
        object BirthdayLabel: TLabel
          Left = 20
          Top = 49
          Width = 52
          Height = 17
          Caption = #49373#45380#50900#51068
          Transparent = True
        end
        object MarriageDateLabel: TLabel
          Left = 20
          Top = 79
          Width = 52
          Height = 17
          Caption = #44208#54844#44592#45392
          Transparent = True
        end
        object Label2: TLabel
          Left = 20
          Top = 110
          Width = 49
          Height = 17
          Caption = #50672' '#47161' '#45824
          Transparent = True
        end
        object Label3: TLabel
          Left = 20
          Top = 141
          Width = 49
          Height = 17
          Caption = #45812' '#45817' '#51088
          Transparent = True
        end
        object DeliveryLocalLabel: TLabel
          Left = 20
          Top = 172
          Width = 52
          Height = 17
          Caption = #48176#45804#51648#50669
          Transparent = True
        end
        object DeliveryCourseLabel: TLabel
          Left = 20
          Top = 203
          Width = 52
          Height = 17
          Caption = #48176#45804#53076#49828
          Transparent = True
        end
        object GenderLabel: TLabel
          Left = 228
          Top = 20
          Width = 26
          Height = 17
          Caption = #49457#48324
          Transparent = True
        end
        object IDNoEdit: TcxMaskEdit
          Left = 80
          Top = 16
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.EditMask = '000000\-0000000;1; '
          Properties.MaxLength = 0
          Properties.ValidateOnEnter = False
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Text = '      -       '
          Width = 130
        end
        object AgeGroupComboBox: TcxComboBox
          Left = 78
          Top = 107
          Hint = 'DS_AGE'
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50629#51088
            #44060#51064)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #49324#50629#51088
          Width = 130
        end
        object DamdangComboBox: TcxComboBox
          Left = 80
          Top = 138
          Hint = 'CD_DAMDANG'
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50629#51088
            #44060#51064)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 2
          Text = #49324#50629#51088
          Width = 130
        end
        object DeliveryLocalComboBox: TcxComboBox
          Left = 80
          Top = 169
          Hint = 'CD_LOCAL'
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50629#51088
            #44060#51064)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 3
          Text = #49324#50629#51088
          Width = 185
        end
        object DeliveryCourseComboBox: TcxComboBox
          Left = 80
          Top = 200
          Hint = 'CD_COURSE'
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50629#51088
            #44060#51064)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 4
          Text = #49324#50629#51088
          Width = 185
        end
        object GenderComboBox: TcxComboBox
          Left = 260
          Top = 16
          Hint = 'DS_SEX'
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #45224#51088
            #50668#51088)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 5
          Width = 70
        end
        object BirthdayLunarCheckBox: TcxCheckBox
          Left = 220
          Top = 46
          Hint = 'YN_LUNAR'
          Caption = #51020#47141
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          Style.TransparentBorder = False
          TabOrder = 6
        end
        object SmsGroupBox: TcxGroupBox
          Left = 18
          Top = 241
          Caption = ' '#47928#51088#49688#49888' '#46041#51032' '
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          TabOrder = 7
          Height = 87
          Width = 368
          object Label13: TLabel
            Left = -56
            Top = 86
            Width = 52
            Height = 17
            Caption = #55092#45824#51204#54868
            Transparent = True
          end
          object Label10: TLabel
            Left = 22
            Top = 54
            Width = 52
            Height = 17
            Caption = #46041#51032#51068#51088
            Transparent = True
          end
          object Label14: TLabel
            Left = 197
            Top = 55
            Width = 52
            Height = 17
            Caption = #44144#48512#51068#51088
            Transparent = True
          end
          object AgreeDateEdit: TcxDateEdit
            Left = 82
            Top = 51
            Hint = 'YMD_AGREE'
            ParentFont = False
            Properties.ImmediatePost = True
            Properties.ReadOnly = True
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 0
            Width = 97
          end
          object RejectDateEdit: TcxDateEdit
            Left = 255
            Top = 51
            Hint = 'YMD_REJECT'
            ParentFont = False
            Properties.ImmediatePost = True
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 1
            Width = 97
          end
          object SMSAgreeCheckBox: TcxCheckBox
            Left = 79
            Top = 22
            Hint = 'YN_NEWS'
            Caption = ' '#49688#49888' '#46041#51032
            ParentFont = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            Style.TransparentBorder = False
            TabOrder = 2
          end
        end
        object BirthdayEdit: TcxMaskEdit
          Left = 80
          Top = 46
          Properties.AlwaysShowBlanksAndLiterals = True
          Properties.EditMask = '9999-99-99;0;_'
          Properties.MaxLength = 0
          Properties.OnChange = EditPropertiesChange
          TabOrder = 8
          Text = '        '
          Width = 130
        end
        object MarriageEdit: TcxMaskEdit
          Left = 80
          Top = 76
          Properties.AlwaysShowBlanksAndLiterals = True
          Properties.EditMask = '9999-99-99;0;_'
          Properties.MaxLength = 0
          Properties.OnChange = EditPropertiesChange
          TabOrder = 9
          Text = '        '
          Width = 130
        end
      end
      object HistoryPage: TcxTabSheet
        Caption = #49688#51221#51060#47141
        ImageIndex = 2
        OnShow = HistoryPageShow
        object HistoryGrid: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 645
          Height = 477
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
          LookAndFeel.ScrollbarMode = sbmTouch
          object HistoryTableView: TcxGridTableView
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
                Column = HistoryTableViewHistoryDate
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsView.GroupByBox = False
            object HistoryTableViewHistoryDate: TcxGridColumn
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
            object HistoryTableViewGubun: TcxGridColumn
              Caption = #44396#48516
              DataBinding.FieldName = 'GUBUN'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
            end
            object HistoryTableViewMemberName: TcxGridColumn
              Caption = #54924#50896#51060#47492
              DataBinding.FieldName = 'NM_MEMBER'
              PropertiesClassName = 'TcxLabelProperties'
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Options.Moving = False
              Width = 116
            end
            object HistoryTableViewMemberType: TcxGridColumn
              Caption = #54924#50896#44396#48516
              DataBinding.FieldName = 'DS_MEMBER'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Options.Moving = False
              Width = 80
            end
            object HistoryTableViewCardNo: TcxGridColumn
              Caption = #52852#46300#48264#54840
              DataBinding.FieldName = 'NO_CARD'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object HistoryTableViewMobileNo: TcxGridColumn
              Caption = #55092#45824#51204#54868
              DataBinding.FieldName = 'TEL_MOBILE'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Options.Moving = False
              Width = 89
            end
            object HistoryTableViewHomeNo: TcxGridColumn
              Caption = #51088#53469#51204#54868
              DataBinding.FieldName = 'TEL_HOME'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 135
            end
            object HistoryTableViewEtcNo1: TcxGridColumn
              Caption = #44592#53440#51204#54868'1'
              DataBinding.FieldName = 'TEL_ETC1'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Options.Moving = False
              Width = 108
            end
            object HistoryTableViewEtcNo2: TcxGridColumn
              Caption = #44592#53440#51204#54868'2'
              DataBinding.FieldName = 'TEL_ETC2'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Options.Moving = False
              Width = 108
            end
            object HistoryTableViewAddress: TcxGridColumn
              Caption = #51452#49548
              DataBinding.FieldName = 'ADDRESS'
              PropertiesClassName = 'TcxTextEditProperties'
              HeaderAlignmentHorz = taCenter
              Width = 245
            end
            object HistoryTableViewRcpNo: TcxGridColumn
              Caption = #49885#48324#48264#54840
              DataBinding.FieldName = 'NO_CASHRCP'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
              Width = 200
            end
            object HistoryTableViewEmail: TcxGridColumn
              Caption = #51060#47700#51068
              DataBinding.FieldName = 'NM_EMAIL'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 191
            end
            object HistoryTableViewStatus: TcxGridColumn
              Caption = #49345#53468
              DataBinding.FieldName = 'DS_STATUS'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 77
            end
            object HistoryTableViewRemark: TcxGridColumn
              Caption = #48708'   '#44256
              DataBinding.FieldName = 'REMARK'
              PropertiesClassName = 'TcxMemoProperties'
              HeaderAlignmentHorz = taCenter
              Width = 265
            end
            object HistoryTableViewGender: TcxGridColumn
              Caption = #49457#48324
              DataBinding.FieldName = 'DS_SEX'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
            end
            object HistoryTableViewBirthday: TcxGridColumn
              Caption = #49373#45380#50900#51068
              DataBinding.FieldName = 'YMD_BIRTH'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 86
            end
            object HistoryTableViewMarryDay: TcxGridColumn
              Caption = #44208#54844#44592#45392#51068
              DataBinding.FieldName = 'YMD_MARRI'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object HistoryTableViewAge: TcxGridColumn
              Caption = #50672#47161#45824
              DataBinding.FieldName = 'DS_AGE'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 74
            end
            object HistoryTableViewDamdang: TcxGridColumn
              Caption = #45812#45817#51088
              DataBinding.FieldName = 'CD_DAMDANG'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 84
            end
            object HistoryTableViewLocal: TcxGridColumn
              Caption = #48176#45804#51648#50669
              DataBinding.FieldName = 'CD_LOCAL'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 101
            end
            object HistoryTableViewCourse: TcxGridColumn
              Caption = #48176#45804#53076#49828
              DataBinding.FieldName = 'CD_COURSE'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 96
            end
            object HistoryTableViewNews: TcxGridColumn
              Caption = #47928#51088#49688#49888
              DataBinding.FieldName = 'NM_TRDPL'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 81
            end
            object HistoryTableViewAgreeDate: TcxGridColumn
              Caption = #49688#49888#46041#51032#51068#51088
              DataBinding.FieldName = 'YMD_AGREE'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 104
            end
            object HistoryTableViewRejectDate: TcxGridColumn
              Caption = #49688#49888#44144#48512#51068#51088
              DataBinding.FieldName = 'YMD_REJECT'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 98
            end
            object HistoryTableViewPrgInsert: TcxGridColumn
              Caption = #46321#47197
              DataBinding.FieldName = 'PRG_INSERT'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
            end
            object HistoryTableViewPrgChange: TcxGridColumn
              Caption = #48320#44221
              DataBinding.FieldName = 'PRG_CHANGE'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
            end
          end
          object HistoryGridLevel: TcxGridLevel
            GridView = HistoryTableView
          end
        end
      end
    end
  end
  object SaleGrid: TcxGrid [6]
    AlignWithMargins = True
    Left = 3
    Top = 600
    Width = 1093
    Height = 289
    Align = alBottom
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 5
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.ScrollbarMode = sbmTouch
    object SaleGridTableView: TcxGridTableView
      Tag = 99
      Navigator.Buttons.CustomButtons = <>
      FilterBox.CustomizeDialog = False
      FilterBox.Visible = fvNever
      ScrollbarAnnotations.CustomAnnotations = <>
      OnCellDblClick = SaleGridTableViewCellDblClick
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'#44148
          Kind = skCount
          Column = SaleGridTableViewSaleDate
        end
        item
          Format = ',0'
          Kind = skSum
          Column = SaleGridTableViewSaleAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = SaleGridTableViewDCAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = SaleGridTableViewSavePoint
        end
        item
          Format = ',0'
          Kind = skSum
          Column = SaleGridTableViewUsePoint
        end
        item
          Format = ',0'
          Kind = skSum
          Column = SaleGridTableViewUseStamp
        end
        item
          Format = ',0'
          Kind = skSum
          Column = SaleGridTableViewSaveStamp
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
      object SaleGridTableViewSaleDate: TcxGridColumn
        Caption = #44396#47588#51068#51088
        DataBinding.FieldName = 'YMD_SALE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Width = 125
      end
      object SaleGridTableViewGubun: TcxGridColumn
        Caption = #44396#48516
        DataBinding.FieldName = 'DS_SALE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 81
      end
      object SaleGridTableViewSaleAmt: TcxGridColumn
        Caption = #44396#47588#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Width = 144
      end
      object SaleGridTableViewDCAmt: TcxGridColumn
        Caption = #54624#51064#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'DC_TOT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Width = 84
      end
      object SaleGridTableViewSavePoint: TcxGridColumn
        Caption = #51201#47549#54252#51064#53944
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'PNT_OCCUR'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 80
      end
      object SaleGridTableViewUsePoint: TcxGridColumn
        Caption = #49324#50857#54252#51064#53944
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_POINT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 89
      end
      object SaleGridTableViewSaveStamp: TcxGridColumn
        Caption = #51201#47549#49828#53596#54532
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'SAVE_STAMP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 81
      end
      object SaleGridTableViewUseStamp: TcxGridColumn
        Caption = #49324#50857#49828#53596#54532
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'USE_STAMP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 77
      end
      object SaleGridTableViewDsAcct: TcxGridColumn
        Caption = #44208#51228#44396#48516
        DataBinding.FieldName = 'DS_ACCT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 101
      end
      object SaleGridTableViewTime: TcxGridColumn
        Caption = #44396#47588#49884#44036
        DataBinding.FieldName = 'DT_SALE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 107
      end
      object SaleGridTableViewReceiptNo: TcxGridColumn
        Caption = #50689#49688#51613
        DataBinding.FieldName = 'NO_RECEIPT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 120
      end
    end
    object SaleGridLevel: TcxGridLevel
      GridView = SaleGridTableView
    end
  end
  object DetailSearchPanel: TAdvPanel [7]
    Left = 0
    Top = 65
    Width = 1099
    Height = 18
    Align = alTop
    DockSite = True
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    UseDockManager = True
    Version = '2.5.11.0'
    AutoHideChildren = False
    BorderColor = clBlack
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
    Caption.Text = #49345#49464#44160#49353#51012' '#50896#54616#49884#47732' '#50668#44592#47484' '#53364#47533#54616#49901#49884#50724'.'
    Caption.Visible = True
    Collaps = True
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
    FullHeight = 116
    object Label4: TLabel
      Left = 132
      Top = 29
      Width = 52
      Height = 17
      Caption = #54924#50896#44396#48516
      Transparent = True
    end
    object Label5: TLabel
      Left = 388
      Top = 30
      Width = 65
      Height = 17
      Caption = #52572#51333#48169#47928#51068
      Transparent = True
    end
    object Label6: TLabel
      Left = 559
      Top = 30
      Width = 26
      Height = 17
      Caption = #51060#51204
      Transparent = True
    end
    object Label7: TLabel
      Left = 274
      Top = 61
      Width = 9
      Height = 17
      Caption = '~'
      Transparent = True
    end
    object Label8: TLabel
      Left = 388
      Top = 61
      Width = 65
      Height = 17
      Caption = #52572#51333#48169#47928#51068
      Transparent = True
    end
    object Label9: TLabel
      Left = 559
      Top = 61
      Width = 26
      Height = 17
      Caption = #51060#54980
      Transparent = True
    end
    object ConditionMemberClassComboBox: TcxComboBox
      Tag = 99
      Left = 203
      Top = 25
      AutoSize = False
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Style.StyleController = EditStyleController
      TabOrder = 0
      Height = 25
      Width = 150
    end
    object ConditionLastVisitDateEdit: TcxDateEdit
      Tag = 99
      Left = 459
      Top = 25
      AutoSize = False
      ParentFont = False
      Style.StyleController = EditStyleController
      TabOrder = 2
      Height = 25
      Width = 90
    end
    object ConditionFromPointEdit: TcxCurrencyEdit
      Tag = 99
      Left = 203
      Top = 57
      EditValue = 0
      Enabled = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0'
      Properties.ImeMode = imSAlpha
      Properties.ReadOnly = False
      Properties.OnValidate = EditPropertiesValidate
      Style.BorderColor = clWindowFrame
      Style.Color = clWhite
      Style.StyleController = EditStyleController
      StyleFocused.Color = 8454143
      TabOrder = 3
      Width = 64
    end
    object ConditionToPointEdit: TcxCurrencyEdit
      Tag = 99
      Left = 289
      Top = 57
      EditValue = 0
      Enabled = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0'
      Properties.ImeMode = imSAlpha
      Properties.ReadOnly = False
      Properties.OnValidate = EditPropertiesValidate
      Style.BorderColor = clWindowFrame
      Style.Color = clWhite
      Style.StyleController = EditStyleController
      StyleFocused.Color = 8454143
      TabOrder = 4
      Width = 64
    end
    object ConditionTrustCheckBox: TcxCheckBox
      Tag = 99
      Left = 128
      Top = 85
      Caption = ' '#50808#49345#44032#45733
      ParentFont = False
      Style.StyleController = EditStyleController
      TabOrder = 5
    end
    object ConditonStatusRadioGroup: TAdvOfficeRadioGroup
      Tag = 99
      Left = 16
      Top = 23
      Width = 89
      Height = 84
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      Version = '1.8.0.3'
      BiDiMode = bdLeftToRight
      Caption = #49345#53468
      ParentBackground = False
      ParentBiDiMode = False
      ParentCtl3D = True
      TabOrder = 6
      ItemIndex = 0
      Items.Strings = (
        #51204#52404
        #51221#49345
        #53448#54924)
      ButtonVertAlign = tlCenter
      Ellipsis = False
    end
    object ConditionSmsRadioGroup: TAdvOfficeRadioGroup
      Tag = 99
      Left = 614
      Top = 23
      Width = 114
      Height = 84
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      Version = '1.8.0.3'
      BiDiMode = bdLeftToRight
      Caption = 'SMS'
      ParentBackground = False
      ParentBiDiMode = False
      ParentCtl3D = True
      TabOrder = 7
      ItemIndex = 0
      Items.Strings = (
        #51204#52404
        #46041#51032
        #48120#46041#51032)
      ButtonVertAlign = tlCenter
      Ellipsis = False
    end
    object ConditionPointCheckBox: TcxCheckBox
      Tag = 99
      Left = 128
      Top = 56
      Caption = #54252#51064#53944
      ParentFont = False
      Properties.OnEditValueChanged = ConditionPointCheckBoxPropertiesEditValueChanged
      Style.StyleController = EditStyleController
      TabOrder = 1
    end
    object ConditionLastVisit1DateEdit: TcxDateEdit
      Tag = 99
      Left = 459
      Top = 56
      AutoSize = False
      ParentFont = False
      Style.StyleController = EditStyleController
      TabOrder = 8
      Height = 25
      Width = 90
    end
    object AgreeMemberCheckBox: TcxCheckBox
      Tag = 99
      Left = 384
      Top = 85
      Caption = ' '#49688#49888#46041#51032' 2'#45380' '#44221#44284' '#54924#50896
      ParentFont = False
      Style.StyleController = EditStyleController
      TabOrder = 9
    end
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  object PictureLoadDialog: TOpenPictureDialog
    Filter = #44536#47548' '#54028#51068'(*.png)|*.png'
    Left = 723
    Top = 248
  end
  object nrComPort: TnrComm
    Active = False
    BaudRate = 9600
    Parity = pNone
    StopBits = sbOne
    ByteSize = 8
    ComPortNo = 1
    ComPort = cpCOM1
    TraceStates = [tsRxChar]
    EventChar = #0
    StreamProtocol = spNone
    BufferInSize = 8192
    BufferOutSize = 8192
    TimeoutRead = 0
    TimeoutWrite = 0
    RS485Mode = False
    EnumPorts = epQuickAll
    UseMainThread = True
    KeepConnection = False
    TerminalUsage = tuNone
    TerminalEcho = False
    OnAfterReceive = nrComPortAfterReceive
    Left = 154
    Top = 232
  end
end
