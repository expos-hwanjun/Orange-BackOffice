inherited StoreStoreForm: TStoreStoreForm
  ActiveControl = ConditionToolBarEdit
  Caption = #47588#51109#44288#47532
  ClientHeight = 896
  ClientWidth = 1224
  ExplicitWidth = 1240
  ExplicitHeight = 935
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 508
    Top = 83
    Height = 813
    ExplicitLeft = 297
    ExplicitTop = 129
    ExplicitHeight = 648
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1224
    ExplicitWidth = 1224
    inherited ButtonToolBar: TAdvToolBar
      Left = 500
      ExplicitLeft = 500
    end
    inherited ConditionToolBar: TAdvToolBar
      Width = 719
      ExplicitWidth = 719
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
          #49324#50857#51473
          #45936#47784
          #49324#50857#50504#54632
          #51068#49884#51473#51648
          #51204#52404)
        Text = #45936#47784
        Visible = True
        ExplicitLeft = 67
        ExplicitWidth = 98
        Width = 98
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 165
        Visible = True
        ExplicitLeft = 165
        ExplicitWidth = 157
        Width = 157
      end
      object cxLabel1: TcxLabel
        Left = 322
        Top = 2
        AutoSize = False
        Caption = #48376' '#49324
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 27
        Width = 65
        AnchorX = 355
        AnchorY = 16
      end
      object ToolBarCompanyCodeEdit: TcxButtonEdit
        Left = 387
        Top = 2
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ImeMode = imSHanguel
        Properties.OnButtonClick = ToolBarCompanyCodeEditPropertiesButtonClick
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 8
        Width = 99
      end
      object ToolBarCompanyNameLabel: TcxLabel
        Left = 486
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
    Top = 83
    Width = 508
    Height = 813
    ExplicitTop = 83
    ExplicitWidth = 508
    ExplicitHeight = 813
    inherited Grid: TcxGrid
      Width = 502
      Height = 807
      ExplicitWidth = 502
      ExplicitHeight = 807
      inherited GridTableView: TcxGridTableView
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0'
            Kind = skCount
            Column = GridTableViewCustomerName
          end>
        OptionsCustomize.ColumnFiltering = True
        OptionsView.Footer = True
        Styles.OnGetContentStyle = GridTableViewStylesGetContentStyle
        object GridTableViewCustomerCode: TcxGridColumn
          Caption = #47588#51109#53076#46300
          DataBinding.FieldName = 'CD_CUSTOMER'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 86
        end
        object GridTableViewCustomerName: TcxGridColumn
          Caption = #47588#51109#51060#47492
          DataBinding.FieldName = 'NM_CUSTOMER'
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 163
        end
        object GridTableViewStatus: TcxGridColumn
          Caption = #49345#53468
          DataBinding.FieldName = 'DS_STATUS'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
        object GridTableViewPartner: TcxGridColumn
          Caption = #54801#47141#49324
          DataBinding.FieldName = 'NM_PARTNER'
          HeaderAlignmentHorz = taCenter
          Width = 141
        end
        object GridTableViewCompanyCode: TcxGridColumn
          Caption = #48376#49324#53076#46300
          DataBinding.FieldName = 'CD_COMPANY'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 123
        end
        object GridTableViewCompanyName: TcxGridColumn
          Caption = #48376#49324#47749
          DataBinding.FieldName = 'NM_COMPANY'
          PropertiesClassName = 'TcxLabelProperties'
          HeaderAlignmentHorz = taCenter
          Width = 137
        end
        object GridTableViewLetsOrder: TcxGridColumn
          Caption = #47131#52768#50724#45908
          DataBinding.FieldName = 'LETSORDER'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 514
    Top = 83
    Width = 710
    Height = 813
    ExplicitLeft = 514
    ExplicitTop = 83
    ExplicitWidth = 710
    ExplicitHeight = 813
    object AdvOfficePager: TcxPageControl
      Left = 0
      Top = 0
      Width = 710
      Height = 813
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = StoreInfoOfficePager
      Properties.CustomButtons.Buttons = <>
      Properties.TabWidth = 90
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      ClientRectBottom = 813
      ClientRectRight = 710
      ClientRectTop = 28
      object StoreInfoOfficePager: TcxTabSheet
        Caption = #47588#51109#51221#48372
        ImageIndex = 0
        object AdvScrollBox1: TAdvScrollBox
          Left = 0
          Top = 0
          Width = 710
          Height = 785
          Align = alClient
          DoubleBuffered = True
          Ctl3D = False
          ParentCtl3D = False
          ParentDoubleBuffered = False
          TabOrder = 0
          object GoodsCodeLabel: TLabel
            Left = 23
            Top = 41
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
            OnDblClick = GoodsCodeLabelDblClick
          end
          object GoodsNameLabel: TLabel
            Left = 23
            Top = 70
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
            Top = 12
            Width = 49
            Height = 17
            Caption = #54801' '#47141' '#49324
            Transparent = True
          end
          object CEONameLabel: TLabel
            Left = 328
            Top = 125
            Width = 52
            Height = 17
            Caption = #45824#54364#51088#47749
            Transparent = True
          end
          object IDNoLabel: TLabel
            Left = 11
            Top = 127
            Width = 65
            Height = 17
            Caption = #49324#50629#51088#48264#54840
            Transparent = True
          end
          object OfficeTelLabel: TLabel
            Left = 24
            Top = 156
            Width = 52
            Height = 17
            Caption = #47588#51109#51204#54868
            Transparent = True
          end
          object AddrLabel: TLabel
            Left = 24
            Top = 184
            Width = 52
            Height = 17
            Caption = #51452#12288#12288#49548
            Transparent = True
          end
          object DisplaySeqLabel: TLabel
            Left = 93
            Top = 273
            Width = 52
            Height = 17
            Caption = #54252#49828#45824#49688
            Transparent = True
          end
          object Label2: TLabel
            Left = 67
            Top = 302
            Width = 78
            Height = 17
            Caption = #53412#50724#49828#53356#45824#49688
            Transparent = True
          end
          object Label3: TLabel
            Left = 67
            Top = 362
            Width = 78
            Height = 17
            Caption = #47700#45684#51228#54620#44060#49688
            Transparent = True
          end
          object UseYNLabel: TLabel
            Left = 24
            Top = 589
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
            Left = 24
            Top = 508
            Width = 52
            Height = 17
            Caption = #48708#12288#12288#44256
            Transparent = True
          end
          object Label4: TLabel
            Left = 326
            Top = 156
            Width = 52
            Height = 17
            Caption = #55092#45824#51204#54868
            Transparent = True
          end
          object Label1: TLabel
            Left = 23
            Top = 559
            Width = 52
            Height = 17
            Caption = #49444#52824#51068#51088
            Transparent = True
          end
          object DemoEndLabel: TLabel
            Left = 227
            Top = 562
            Width = 206
            Height = 17
            AutoSize = False
            Caption = #45936#47784#51333#47308
            Transparent = True
            Visible = False
          end
          object PayEndDateLabel: TLabel
            Left = 227
            Top = 590
            Width = 206
            Height = 17
            AutoSize = False
            Caption = #44396#46021#51333#47308#51068
            Font.Charset = HANGEUL_CHARSET
            Font.Color = 204
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            Visible = False
          end
          object Label20: TLabel
            Left = 50
            Top = 391
            Width = 96
            Height = 17
            Caption = #46041#49884#51217#49549' '#49324#50857#51088
            Transparent = True
          end
          object Label25: TLabel
            Left = 67
            Top = 332
            Width = 65
            Height = 17
            Caption = #53468#48660#47551#50724#45908
            Transparent = True
          end
          object Label33: TLabel
            Left = 34
            Top = 99
            Width = 39
            Height = 17
            Caption = #45800#52629#47749
            Transparent = True
          end
          object Option14CheckBox: TcxCheckBox
            Left = 312
            Top = 472
            Caption = #45796#44397#50612' '#44592#45733
            ParentFont = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            Style.TransparentBorder = False
            TabOrder = 0
          end
          object Option8CheckBox: TcxCheckBox
            Left = 22
            Top = 472
            Caption = #49436#48260#50640' '#47588#52636#45936#51060#53552' '#51204#49569#50504#54632
            ParentFont = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            Style.TransparentBorder = False
            TabOrder = 1
          end
          object CustomerCodeEdit: TcxTextEdit
            Left = 84
            Top = 38
            ParentFont = False
            Properties.ImeMode = imDisable
            Properties.MaxLength = 14
            Properties.ReadOnly = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 2
            Width = 120
          end
          object CustomerNameEdit: TcxTextEdit
            Left = 84
            Top = 67
            ParentFont = False
            Properties.ImeMode = imSHanguel
            Properties.MaxLength = 150
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 3
            OnExit = CustomerNameEditExit
            Width = 263
          end
          object PartnerNameEdit: TcxTextEdit
            Left = 176
            Top = 8
            TabStop = False
            ParentFont = False
            Properties.ReadOnly = True
            Style.Color = 15856113
            Style.StyleController = EditStyleController
            TabOrder = 4
            Width = 172
          end
          object CEONameEdit: TcxTextEdit
            Left = 386
            Top = 121
            ParentFont = False
            Properties.ImeMode = imSHanguel
            Properties.MaxLength = 20
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 5
            Width = 120
          end
          object BizNoEdit: TcxMaskEdit
            Left = 84
            Top = 123
            ParentFont = False
            Properties.ImeMode = imSAlpha
            Properties.EditMask = '999\-99\-99999;1;_'
            Properties.MaxLength = 0
            Properties.ValidateOnEnter = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 6
            Text = '   -  -     '
            Width = 120
          end
          object OfficeTelEdit: TcxTextEdit
            Left = 84
            Top = 152
            ParentFont = False
            Properties.ImeMode = imSAlpha
            Properties.MaxLength = 15
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 7
            Width = 120
          end
          object ZipCodeEdit: TcxButtonEdit
            Left = 84
            Top = 181
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
            TabOrder = 8
            Width = 76
          end
          object Addr1Edit: TcxTextEdit
            Left = 162
            Top = 181
            TabStop = False
            ParentFont = False
            Properties.MaxLength = 80
            Properties.ReadOnly = True
            Style.Color = 15856113
            Style.StyleController = EditStyleController
            StyleFocused.Color = 14737632
            TabOrder = 9
            Width = 344
          end
          object Addr2Edit: TcxTextEdit
            Left = 162
            Top = 210
            ParentFont = False
            Properties.ImeMode = imSHanguel
            Properties.MaxLength = 80
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 10
            Width = 344
          end
          object PosCountEdit: TcxSpinEdit
            Left = 158
            Top = 268
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 100.000000000000000000
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 11
            Width = 55
          end
          object KioskCountEdit: TcxSpinEdit
            Left = 158
            Top = 297
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 100.000000000000000000
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 12
            Width = 55
          end
          object MenuLimitCountEdit: TcxSpinEdit
            Left = 151
            Top = 357
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.MinValue = 1000.000000000000000000
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 13
            Value = 1000
            Width = 62
          end
          object StatusComboBox: TcxComboBox
            Left = 84
            Top = 585
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
            TabOrder = 14
            Text = #51064#51613#50756#47308
            Width = 125
          end
          object RemarkMemo: TcxMemo
            Left = 84
            Top = 505
            Hint = 'REMARK'
            ParentFont = False
            Properties.ImeMode = imSHanguel
            Properties.MaxLength = 100
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 15
            Height = 45
            Width = 422
          end
          object MobileTelEdit: TcxTextEdit
            Left = 386
            Top = 152
            ParentFont = False
            Properties.ImeMode = imSAlpha
            Properties.MaxLength = 13
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 16
            Width = 120
          end
          object PartnerCodeEdit: TcxButtonEdit
            Left = 84
            Top = 8
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
            TabOrder = 17
            Width = 89
          end
          object SetupDateEdit: TcxDateEdit
            Left = 84
            Top = 555
            ParentFont = False
            Properties.DateButtons = [btnClear, btnNow]
            Properties.DisplayFormat = 'yyyy'#45380'mm'#50900'dd'#51068
            Properties.ImeMode = imSAlpha
            Properties.ImmediatePost = True
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 18
            Width = 125
          end
          object LogInGroupBox: TcxGroupBox
            Left = 242
            Top = 271
            Caption = #47196#44536#51064#51221#48372'('#45800#46021#47588#51109')'
            Enabled = False
            TabOrder = 19
            Height = 115
            Width = 263
            object AppIDLabel: TLabel
              Left = 26
              Top = 33
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
              Top = 64
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
            object LoginCommentLabel: TLabel
              Left = 9
              Top = 90
              Width = 246
              Height = 17
              AutoSize = False
              Caption = #8251' '#47588#51109#46321#47197' '#54980' '#47196#44536#51064'ID '#49373#49457#44032#45733#54633#45768#45796
              Font.Charset = HANGEUL_CHARSET
              Font.Color = clRed
              Font.Height = -13
              Font.Name = #47569#51008' '#44256#46357
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object UserIDEdit: TcxTextEdit
              Left = 84
              Top = 28
              ParentFont = False
              Properties.ImeMode = imSAlpha
              Properties.MaxLength = 20
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 0
              Width = 91
            end
            object AppPWDEdit: TcxTextEdit
              Left = 84
              Top = 59
              ParentFont = False
              Properties.ImeMode = imSAlpha
              Properties.MaxLength = 30
              Properties.PasswordChar = '*'
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 1
              Width = 91
            end
            object IDDupCheckButton: TAdvGlowButton
              Left = 179
              Top = 28
              Width = 80
              Height = 25
              Caption = #51473#48373#52404#53356
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
              Rounded = True
              TabOrder = 2
              OnClick = IDDupCheckButtonClick
              Appearance.BorderColor = 11382963
              Appearance.BorderColorHot = 11565130
              Appearance.BorderColorCheckedHot = 11565130
              Appearance.BorderColorDown = 11565130
              Appearance.BorderColorChecked = 13744549
              Appearance.BorderColorDisabled = 13948116
              Appearance.ColorChecked = 13744549
              Appearance.ColorCheckedTo = 13744549
              Appearance.ColorDisabled = clWhite
              Appearance.ColorDisabledTo = clNone
              Appearance.ColorDown = 11565130
              Appearance.ColorDownTo = 11565130
              Appearance.ColorHot = 16444643
              Appearance.ColorHotTo = 16444643
              Appearance.ColorMirror = clWhite
              Appearance.ColorMirrorTo = clWhite
              Appearance.ColorMirrorHot = 16444643
              Appearance.ColorMirrorHotTo = 16444643
              Appearance.ColorMirrorDown = 11565130
              Appearance.ColorMirrorDownTo = 11565130
              Appearance.ColorMirrorChecked = 13744549
              Appearance.ColorMirrorCheckedTo = 13744549
              Appearance.ColorMirrorDisabled = clWhite
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
          object cxGroupBox2: TcxGroupBox
            Left = 351
            Top = 8
            PanelStyle.Active = True
            TabOrder = 20
            Height = 75
            Width = 155
            object Label18: TLabel
              Left = 6
              Top = 12
              Width = 52
              Height = 17
              Alignment = taRightJustify
              Caption = #51064#51613#48264#54840
              Font.Charset = HANGEUL_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #47569#51008' '#44256#46357
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object TimeLabel: TLabel
              Left = 117
              Top = 11
              Width = 36
              Height = 18
              Alignment = taCenter
              AutoSize = False
              Caption = '(60)'
              Font.Charset = HANGEUL_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #47569#51008' '#44256#46357
              Font.Style = []
              ParentFont = False
              Transparent = True
              Visible = False
            end
            object LicenseNoEdit: TcxTextEdit
              Left = 61
              Top = 7
              ParentFont = False
              Properties.ImeMode = imSAlpha
              Properties.MaxLength = 20
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 0
              Width = 53
            end
            object LicenseCallButton: TAdvGlowButton
              Left = 31
              Top = 40
              Width = 96
              Height = 29
              Caption = #51064#51613#48264#54840#50836#52397
              Font.Charset = HANGEUL_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #47569#51008' '#44256#46357
              Font.Style = []
              DisabledPicture.Data = {
                89504E470D0A1A0A0000000D494844520000001100000011080400000091648F
                71000000097048597300000B1300000B1301009A9C1800000319694343505068
                6F746F73686F70204943432070726F66696C65000078DA6360609EE0E8E2E4CA
                24C0C050505452E41EE418191119A5C07E9E818D819981818181812131B9B8C0
                3120C087818181212F3F2F9501037CBBC6C0C8C0C0C07059D7D1C5C9958134C0
                9A5C5054C2C0C070808181C12825B538998181E10B0303437A79494109030363
                0C03038348527641090303630103038348764890330303630B0303134F496A45
                0903030383737E416551667A468982A1A5A5A582634A7E52AA42706571496A6E
                B182675E727E51417E5162496A0A030303D40E060606065E97FC1205F7C4CC3C
                05435355062A8388C82805F4F0418821407269511984C5C8C0C0C020C0A0C5E0
                C750C9B08AE101A3346314E33CC6A74C864C0D4C979835981B99EFB2D8B0CC63
                6566CD66BDCAE6C4B6895D857D2687004727272B67331733571B3737F7441E29
                9EA5BCC6BC87F882F99EF1570B0809AC1674137C24D428AC287C58245D945774
                AB589C38A7F85689144961C9A35215D2BAD24F64E6C886CA09CA9D95EF51F051
                E455BCA03445394A4549E5B5EA56B546753F0D598DB79AFBB4266AA7EA58EB0A
                E9BED23BA23FDFA0C630CAC8D258D2F8B7C93DD3C3662BCCFB2D2A2C13AD7CAC
                2D6C546D45EC58ECBEDA3F77B8ED78C1E998F35E97ADAEEBDD56BA2FF558E4B9
                D06B81F7429FC5BECBFC56F9AF0FD81AB837E858F0F9905BA1CFC2BE4430450A
                4629451BC7B8C546C5E5C5B724CC4EDC9C7436F9792A539A5CBA4D46546655D6
                ACEC3D39F7F298F2D50B7C0A8B8B66171F2E795B2651EE52515839AFEA6CF5DF
                5ABDBAF8FA490DC71A7F371BB4A4B7CE6BBBDE21D8E9DDD5DE7DB897A1CFBEBF
                6EC2BE89FF273B4E699D7A623AEF8CE099B3663D9AA335B764DEBE055C0BC316
                2D5EFC71A9C3B209CB1FAE345ED5BAFAE65ADD754DEB6F6E34D8D4B1F9C156AB
                6D53B77FD8E9BB6BD51E8EBDE9FB8E1F503FD879E8F511BFA39B8F8B9FA83DF9
                E4B4F7992DE764CFB75FF87429EEF2A9AB16D796DD10BDD97AEBEB9DF4BB37EF
                FB3C38F0C8F4F1EAA78ACF66BE107CD9F59AF94DDDDB9FEF4B3F7CFA54F0F9DD
                D7BC6FEF7EE4FFFCF0BBF8CFB77F55FFFF03002ABF1D8AF36F515B0000002063
                48524D00007A25000080830000F9FF000080E9000075300000EA6000003A9800
                00176F925FC546000002104944415478DA74915B4853711CC7BFE7ECBFB533F3
                A8CDE6695E161B436B31E77A709322A156446FDDA097E82128E8424981203DB4
                E7C22E463D8821BDD8D3E82215A10405163E95D918A2938439D8C576763B3B3B
                E7FC7A10E9A9CFF387CFCB876370C38320DC788184FBFE23F3B65BD79D713FCA
                90B1800C8A600040003434423A80C31ADF1256E306085BF01C001DC66EDB404E
                28E9455DD614C3EA122F70FEFA9602E860A1DEF18129E7D9BA4A9AA1F0C2FE91
                33CF4393CDA7375BCC000B9C181FF401EA2163C6ACE9A45A536E86BE007B92A8
                E6A6019E13C343477D49DC2D7E7C2B2802B35A4C99D763D1D4325C8EFE287501
                BCDD7FE464092F372687AB6F44AB9D49E61D66F5D5BBABD3AB32A460CB3180EF
                08480D4B343B559968ADCB6ACAC8E8A59A44F5D8DC58A25A475B1060D626037F
                360AEFA1C8C87F8E3E36F1C94F163094677F5F6CEF69B001ACAC97E110BC9D45
                78904F2F8F00ED68850892ECA2009301F0E9B535340AC72F9F3AC870053EF4E0
                3C72E0BCA19B2E2743210DB0ECFCFC92D7DBBBAFED69E541F94B24A5E815C71E
                7FE446D7A08EF5CACA0CC0C1D471EDF6681816902227567FD4B59DDD4D7B8D66
                0D05DC7BF66D88AA0078D133FA50FF4939AA508DCAB44E2BF49D621489F19D9B
                FF6002BFDD79E9DCDC84F68BF294A7247DA0E1C5EE3B82C4012070801904E2C8
                25F67BFA5CBB2C5C361B5FCC7FAD256C5A153A08DCBFE9FFE3EF0011DCE32248
                23B4CF0000000049454E44AE426082}
              FocusType = ftHot
              NotesFont.Charset = DEFAULT_CHARSET
              NotesFont.Color = clWindowText
              NotesFont.Height = -11
              NotesFont.Name = 'Tahoma'
              NotesFont.Style = []
              ParentFont = False
              Rounded = True
              TabOrder = 1
              OnClick = LicenseCallButtonClick
              Appearance.BorderColor = 11382963
              Appearance.BorderColorHot = 11565130
              Appearance.BorderColorCheckedHot = 11565130
              Appearance.BorderColorDown = 11565130
              Appearance.BorderColorChecked = 13744549
              Appearance.BorderColorDisabled = 13948116
              Appearance.ColorChecked = 13744549
              Appearance.ColorCheckedTo = 13744549
              Appearance.ColorDisabled = clWhite
              Appearance.ColorDisabledTo = clNone
              Appearance.ColorDown = 11565130
              Appearance.ColorDownTo = 11565130
              Appearance.ColorHot = 16444643
              Appearance.ColorHotTo = 16444643
              Appearance.ColorMirror = clWhite
              Appearance.ColorMirrorTo = clWhite
              Appearance.ColorMirrorHot = 16444643
              Appearance.ColorMirrorHotTo = 16444643
              Appearance.ColorMirrorDown = 11565130
              Appearance.ColorMirrorDownTo = 11565130
              Appearance.ColorMirrorChecked = 13744549
              Appearance.ColorMirrorCheckedTo = 13744549
              Appearance.ColorMirrorDisabled = clWhite
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
          object ConnectLimitCountEdit: TcxSpinEdit
            Left = 162
            Top = 386
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 10.000000000000000000
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 21
            Value = 1
            Width = 51
          end
          object TabletCountEdit: TcxSpinEdit
            Left = 158
            Top = 327
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 100.000000000000000000
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 22
            Width = 55
          end
          object LetsOrderPanel: TAdvPanel
            Left = 24
            Top = 241
            Width = 487
            Height = 23
            Color = clWhite
            DockSite = True
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            ParentFont = False
            TabOrder = 23
            UseDockManager = True
            Version = '2.5.11.0'
            AutoHideChildren = False
            BorderColor = clBlack
            BorderWidth = 1
            Caption.Color = clHighlight
            Caption.ColorTo = clNone
            Caption.CloseColor = clHighlight
            Caption.Font.Charset = HANGEUL_CHARSET
            Caption.Font.Color = clHighlightText
            Caption.Font.Height = -13
            Caption.Font.Name = #47569#51008' '#44256#46357
            Caption.Font.Style = [fsBold]
            Caption.GradientDirection = gdVertical
            Caption.Height = 25
            Caption.Indent = 0
            Caption.MinMaxButton = True
            Caption.MinMaxCaption = True
            Caption.ShadeLight = 255
            Caption.Text = #47131#52768#50724#45908
            Caption.TopIndent = 2
            Caption.Visible = True
            Collaps = True
            CollapsColor = clNone
            CollapsDelay = 0
            ColorTo = clWhite
            DoubleBuffered = True
            Ellipsis = True
            Position.Save = True
            Position.Location = clInifile
            ShadowColor = clBlack
            ShadowOffset = 0
            ShowMoveCursor = True
            StatusBar.BevelInner = True
            StatusBar.BorderColor = clNone
            StatusBar.BorderStyle = bsSingle
            StatusBar.Font.Charset = DEFAULT_CHARSET
            StatusBar.Font.Color = clWindowText
            StatusBar.Font.Height = -11
            StatusBar.Font.Name = 'Tahoma'
            StatusBar.Font.Style = []
            StatusBar.Color = clWhite
            StatusBar.GradientDirection = gdVertical
            Text = ''
            FullHeight = 80
            object Option9CheckBox: TcxCheckBox
              Left = 22
              Top = 40
              Caption = ' '#47131#52768#50724#45908' '#49324#50857
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              Style.TransparentBorder = False
              TabOrder = 0
            end
            object Option15CheckBox: TcxCheckBox
              Left = 239
              Top = 40
              Caption = ' '#49888#44508' '#47131#52768#50724#45908
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              Style.TransparentBorder = False
              TabOrder = 1
            end
          end
          object HeadChangeGroupBox: TcxGroupBox
            Left = 14
            Top = 618
            Caption = ' '#48376#49324#48320#44221
            TabOrder = 24
            Visible = False
            Height = 90
            Width = 517
            object Label26: TLabel
              Left = 25
              Top = 29
              Width = 52
              Height = 17
              Caption = #48376#49324#53076#46300
              Font.Charset = HANGEUL_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #47569#51008' '#44256#46357
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label27: TLabel
              Left = 91
              Top = 57
              Width = 294
              Height = 17
              AutoSize = False
              Caption = #8251#48320#44221' '#54980' '#48152#46300#49884' '#54252#49828' ClearDB '#49892#54665' '#48143' '#51116#51064#51613
              Font.Charset = HANGEUL_CHARSET
              Font.Color = clRed
              Font.Height = -13
              Font.Name = #47569#51008' '#44256#46357
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object NewHeadCodeEdit: TcxTextEdit
              Left = 91
              Top = 23
              ParentFont = False
              Properties.MaxLength = 8
              Style.StyleController = EditStyleController
              TabOrder = 0
              Width = 94
            end
            object HeadChangeButton: TAdvGlowButton
              Left = 191
              Top = 23
              Width = 80
              Height = 25
              Caption = #48320#44221
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
              Rounded = True
              TabOrder = 1
              OnClick = HeadChangeButtonClick
              Appearance.BorderColor = 11382963
              Appearance.BorderColorHot = 11565130
              Appearance.BorderColorCheckedHot = 11565130
              Appearance.BorderColorDown = 11565130
              Appearance.BorderColorChecked = 13744549
              Appearance.BorderColorDisabled = 13948116
              Appearance.ColorChecked = 13744549
              Appearance.ColorCheckedTo = 13744549
              Appearance.ColorDisabled = clWhite
              Appearance.ColorDisabledTo = clNone
              Appearance.ColorDown = 11565130
              Appearance.ColorDownTo = 11565130
              Appearance.ColorHot = 16444643
              Appearance.ColorHotTo = 16444643
              Appearance.ColorMirror = clWhite
              Appearance.ColorMirrorTo = clWhite
              Appearance.ColorMirrorHot = 16444643
              Appearance.ColorMirrorHotTo = 16444643
              Appearance.ColorMirrorDown = 11565130
              Appearance.ColorMirrorDownTo = 11565130
              Appearance.ColorMirrorChecked = 13744549
              Appearance.ColorMirrorCheckedTo = 13744549
              Appearance.ColorMirrorDisabled = clWhite
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
          object CustomerShortNameEdit: TcxTextEdit
            Left = 84
            Top = 95
            ParentFont = False
            Properties.ImeMode = imSHanguel
            Properties.MaxLength = 50
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 25
            Width = 205
          end
          object KaKaoChannelPanel: TAdvPanel
            Left = 23
            Top = 446
            Width = 487
            Height = 23
            Color = clWhite
            DockSite = True
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            ParentFont = False
            TabOrder = 26
            UseDockManager = True
            Version = '2.5.11.0'
            AutoHideChildren = False
            BorderColor = clBlack
            BorderWidth = 1
            Caption.Color = clHighlight
            Caption.ColorTo = clNone
            Caption.CloseColor = clHighlight
            Caption.Font.Charset = HANGEUL_CHARSET
            Caption.Font.Color = clHighlightText
            Caption.Font.Height = -13
            Caption.Font.Name = #47569#51008' '#44256#46357
            Caption.Font.Style = [fsBold]
            Caption.GradientDirection = gdVertical
            Caption.Height = 25
            Caption.Indent = 0
            Caption.MinMaxButton = True
            Caption.MinMaxCaption = True
            Caption.ShadeLight = 255
            Caption.Text = #50508#47548#53665' '#44288#47144
            Caption.TopIndent = 2
            Caption.Visible = True
            Collaps = True
            CollapsColor = clNone
            CollapsDelay = 0
            ColorTo = clWhite
            DoubleBuffered = True
            Ellipsis = True
            Position.Save = True
            Position.Location = clInifile
            ShadowColor = clBlack
            ShadowOffset = 0
            ShowMoveCursor = True
            StatusBar.BevelInner = True
            StatusBar.BorderColor = clNone
            StatusBar.BorderStyle = bsSingle
            StatusBar.Font.Charset = DEFAULT_CHARSET
            StatusBar.Font.Color = clWindowText
            StatusBar.Font.Height = -11
            StatusBar.Font.Name = 'Tahoma'
            StatusBar.Font.Style = []
            StatusBar.Color = clWhite
            StatusBar.GradientDirection = gdVertical
            Text = ''
            FullHeight = 195
            object Label38: TLabel
              Left = 22
              Top = 36
              Width = 48
              Height = 17
              Caption = 'API_KEY'
              Transparent = True
            end
            object Label40: TLabel
              Left = 22
              Top = 71
              Width = 55
              Height = 17
              Caption = 'WEB URL'
              Transparent = True
            end
            object Label34: TLabel
              Left = 19
              Top = 102
              Width = 62
              Height = 17
              Caption = #51116#51452#47928' QR'
              Transparent = True
            end
            object Label35: TLabel
              Left = 21
              Top = 131
              Width = 70
              Height = 17
              Caption = #51217#49688' '#53484#54540#47551
              Transparent = True
            end
            object Label36: TLabel
              Left = 21
              Top = 162
              Width = 70
              Height = 17
              Caption = #54589#50629' '#53484#54540#47551
              Transparent = True
            end
            object Label37: TLabel
              Left = 300
              Top = 163
              Width = 122
              Height = 17
              Caption = #8251' KDS'#50640#49436' '#51312#47532#49884#51089
              Font.Charset = HANGEUL_CHARSET
              Font.Color = 204
              Font.Height = -13
              Font.Name = #47569#51008' '#44256#46357
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object KaKaoChannelWebUrlEdit: TcxTextEdit
              Left = 116
              Top = 66
              ParentFont = False
              Properties.MaxLength = 200
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 0
              Width = 314
            end
            object KaKaoChannelAPIKeyEdit: TcxButtonEdit
              Left = 116
              Top = 33
              ParentFont = False
              Properties.Alignment.Horz = taLeftJustify
              Properties.Buttons = <
                item
                  Default = True
                  Glyph.SourceDPI = 96
                  Glyph.Data = {
                    424D360400000000000036000000280000001000000010000000010020000000
                    000000000000C40E0000C40E0000000000000000000000000000000000020000
                    00070000000B0000000C0000000C0000000C0000000C0000000D0000000D0000
                    000F0000001C0713339C0F276AFF0A193A980000000B00000000000000067B4B
                    2ABEAB683AFFAB6839FFAA6638FFAA6737FFAA6636FFA96536FFB77C54FFBA8E
                    6FFF585468FF417CB9FF70C7FFFF265198FF000000100000000000000009AE6D
                    3FFFDBAD76FFD7A56CFFD9AE7BFFD9B488FFD9B890FFD6B690FFD1B28EFF676B
                    7DFF4C83BCFF83CFFFFF5694CEFF142B4D980000000A0000000000000009B071
                    44FFDEB47FFFDCB384FFD0AF8AFF9F7253FF8D5A3CFF8B593BFF78584AFF577E
                    A6FF92D4FAFF619CD0FF6C7284FF00000019000000020000000000000008B476
                    4AFFE3C196FFCFAE8AFF926042FFC8A583FFF0D9B9FFF0DCBEFFC7A88BFF895D
                    43FF6891B2FF7D8C9CFFBF9577FF0000000D000000000000000000000007B67C
                    50FFE7CBA8FFA77B5CFFC8A482FFF8DBADFFF7D6A6FFF8DBACFFFAE3BFFFC8A8
                    8CFF826354FFD9C1A1FFBD8863FF0000000A000000000000000000000007BA81
                    55FFEAD5B7FF976647FFF2DBB9FFFCECCEFFFCEFD5FFF9E0B8FFF8DEB4FFF3E1
                    C7FF8E5C3FFFE2C9A8FFB4774AFF00000009000000000000000000000006BC87
                    5CFFEEDABEFF9C6B4DFFF4DEBDFFFEF8E8FFFEF7E5FFFDF0D9FFF8DEB6FFF3E2
                    C8FF926042FFE5CDAEFFB67C50FF00000009000000000000000000000005C08C
                    62FFF0DEC2FFB48C6DFFCEAE90FFFCECD1FFFEFAEBFFFDF0D7FFFAE5C4FFCBAC
                    90FFAB8264FFE9D1B0FFB98156FF00000008000000000000000000000005C393
                    69FFF3E4C7FFE2C9AAFFA7795AFFCFAF93FFF2DFC5FFF2DFC6FFCDAE92FFA172
                    54FFDCC2A5FFEED8B6FFBE895EFF00000007000000000000000000000004C99C
                    73FFF4E6C9FFEFD7B1FFE7D2B4FFBC9577FFA97C5EFFA87B5CFFB89174FFE4CF
                    B1FFEED6B1FFF1DBB6FFC49267FF00000007000000000000000000000004CDA2
                    7AFFF6EACFFFF6EAD0FFF8EDD6FFF9EEDBFFF6EEDDFFF6EFDDFFF7EDDAFFF7EC
                    D5FFF7EAD0FFF7EACFFFC7996FFF00000006000000000000000000000003CFA8
                    80FFC39269FFC39269FFC39269FFC39269FFC39269FFC39269FFC39269FFC392
                    69FFC39269FFC39269FFCB9F75FF00000005000000000000000000000002D4B0
                    8BFFE4CFBEFFFEFEFEFFFDFCFCFFFCFAF9FFFAF8F6FFF8F5F3FFF7F2F0FFF6F0
                    ECFFF4EDE9FFF2ECE7FFD1A981FF000000040000000000000000000000019F87
                    6ABFD7B58FFFD6B48FFFD6B38FFFD6B28FFFD6B28EFFD5B18DFFD6B08CFFD5B0
                    8BFFD4AF8AFFD4AF8AFF9D8266C0000000030000000000000000000000000000
                    0001000000020000000200000002000000020000000300000003000000030000
                    00030000000300000003000000020000000100000000}
                  Kind = bkEllipsis
                  Stretchable = False
                  Width = 25
                end>
              Properties.ClickKey = 112
              Properties.ImeMode = imSAlpha
              Properties.MaxLength = 40
              Properties.OnButtonClick = KaKaoChannelAPIKeyEditPropertiesButtonClick
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 1
              Width = 314
            end
            object ReOrderQREdit: TcxTextEdit
              Left = 116
              Top = 97
              ParentFont = False
              Properties.MaxLength = 200
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 2
              Width = 344
            end
            object OrderTemplatCodeEdit: TcxTextEdit
              Left = 116
              Top = 128
              ParentFont = False
              Properties.MaxLength = 50
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 3
              Width = 171
            end
            object PickupTemplatCodeEdit: TcxTextEdit
              Left = 116
              Top = 159
              ParentFont = False
              Properties.MaxLength = 50
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 4
              Width = 171
            end
          end
          object SyncPanel: TAdvPanel
            Left = 23
            Top = 417
            Width = 487
            Height = 23
            Color = clWhite
            DockSite = True
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            ParentFont = False
            TabOrder = 27
            UseDockManager = True
            Version = '2.5.11.0'
            AutoHideChildren = False
            BorderColor = clBlack
            BorderWidth = 1
            Caption.Color = clHighlight
            Caption.ColorTo = clNone
            Caption.CloseColor = clHighlight
            Caption.Font.Charset = HANGEUL_CHARSET
            Caption.Font.Color = clHighlightText
            Caption.Font.Height = -13
            Caption.Font.Name = #47569#51008' '#44256#46357
            Caption.Font.Style = [fsBold]
            Caption.GradientDirection = gdVertical
            Caption.Height = 25
            Caption.Indent = 0
            Caption.MinMaxButton = True
            Caption.MinMaxCaption = True
            Caption.ShadeLight = 255
            Caption.Text = #54364#51456#50672#46041
            Caption.TopIndent = 2
            Caption.Visible = True
            Collaps = True
            CollapsColor = clNone
            CollapsDelay = 0
            ColorTo = clWhite
            DoubleBuffered = True
            Ellipsis = True
            Position.Save = True
            Position.Location = clInifile
            ShadowColor = clBlack
            ShadowOffset = 0
            ShowMoveCursor = True
            StatusBar.BevelInner = True
            StatusBar.BorderColor = clNone
            StatusBar.BorderStyle = bsSingle
            StatusBar.Font.Charset = DEFAULT_CHARSET
            StatusBar.Font.Color = clWindowText
            StatusBar.Font.Height = -11
            StatusBar.Font.Name = 'Tahoma'
            StatusBar.Font.Style = []
            StatusBar.Color = clWhite
            StatusBar.GradientDirection = gdVertical
            Text = ''
            FullHeight = 151
            object Option1RadioGroup: TcxRadioGroup
              Left = 6
              Top = 34
              Caption = #47700#45684
              Properties.Items = <
                item
                  Caption = #49324#50857#50504#54632
                end
                item
                  Caption = #49324#50857#54632'('#47588#51109#47700#45684' '#46321#47197#44032#45733')'
                end
                item
                  Caption = #49324#50857#54632'('#47588#51109#47700#45684' '#46321#47197#50504#46120')'
                end>
              Properties.OnChange = EditPropertiesChange
              ItemIndex = 0
              TabOrder = 0
              Height = 105
              Width = 185
            end
            object Option2CheckBox: TcxCheckBox
              Left = 209
              Top = 32
              Hint = 'YN_USE'
              Caption = 'PLU'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              Style.TransparentBorder = False
              TabOrder = 1
            end
            object Option4CheckBox: TcxCheckBox
              Left = 327
              Top = 32
              Hint = 'YN_USE'
              Caption = #53412#50724#49828#53356' '#47700#45684#51060#48120#51648
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              Style.TransparentBorder = False
              TabOrder = 2
            end
            object Option5CheckBox: TcxCheckBox
              Left = 209
              Top = 88
              Hint = 'YN_USE'
              Caption = #53685#54633#54924#50896
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              Style.TransparentBorder = False
              TabOrder = 3
            end
            object Option6CheckBox: TcxCheckBox
              Left = 327
              Top = 60
              Hint = 'YN_USE'
              Caption = #53412#50724#49828#53356' PLU'
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              Style.TransparentBorder = False
              TabOrder = 4
            end
            object Option3CheckBox: TcxCheckBox
              Left = 209
              Top = 60
              Caption = #54252#49828#46356#51088#51064
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              Style.TransparentBorder = False
              TabOrder = 5
            end
            object Option7CheckBox: TcxCheckBox
              Left = 327
              Top = 88
              Caption = #53412#50724#49828#53356' '#46356#51088#51064
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              Style.TransparentBorder = False
              TabOrder = 6
            end
          end
        end
      end
      object EtcPage: TcxTabSheet
        Caption = #48512#44032#51221#48372
        ImageIndex = 1
        object AdvScrollBox2: TAdvScrollBox
          Left = 0
          Top = 0
          Width = 710
          Height = 785
          Align = alClient
          DoubleBuffered = True
          Ctl3D = False
          ParentCtl3D = False
          ParentDoubleBuffered = False
          TabOrder = 0
          object Label9: TLabel
            Left = 21
            Top = 170
            Width = 52
            Height = 17
            Caption = #49444#52824#45236#50669
            Transparent = True
          end
          object Label6: TLabel
            Left = 22
            Top = 45
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
          object Label7: TLabel
            Left = 21
            Top = 138
            Width = 49
            Height = 17
            Caption = #45812' '#45817' '#51088
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
            Top = 76
            Width = 46
            Height = 17
            Caption = #50629'    '#51333
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
            Top = 107
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
          object Label14: TLabel
            Left = 45
            Top = 389
            Width = 52
            Height = 17
            Caption = #44228#50557#44592#44036
            Transparent = True
          end
          object Label15: TLabel
            Left = 210
            Top = 389
            Width = 9
            Height = 17
            Caption = '~'
            Transparent = True
          end
          object Label16: TLabel
            Left = 45
            Top = 419
            Width = 52
            Height = 17
            Caption = #44228#50557#44148#49688
            Transparent = True
          end
          object Label17: TLabel
            Left = 263
            Top = 421
            Width = 52
            Height = 17
            Caption = #50900#44288#47532#48708
            Transparent = True
          end
          object Label19: TLabel
            Left = 319
            Top = 137
            Width = 52
            Height = 17
            Caption = #47928#51088#51092#50529
            Transparent = True
          end
          object Label22: TLabel
            Left = 46
            Top = 453
            Width = 96
            Height = 17
            Caption = #47560#49828#53552' '#45796#50868#47196#46300
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label23: TLabel
            Left = 21
            Top = 14
            Width = 52
            Height = 17
            Caption = #48512#45824#47532#51216
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label39: TLabel
            Left = 40
            Top = 620
            Width = 65
            Height = 17
            Caption = #47588#52636#50629#47196#46300
            Transparent = True
          end
          object Label41: TLabel
            Left = 234
            Top = 619
            Width = 9
            Height = 17
            Caption = '~'
            Transparent = True
          end
          object PosDeviceMemo: TcxMemo
            Left = 82
            Top = 166
            ParentFont = False
            Properties.ImeMode = imSHanguel
            Properties.MaxLength = 1000
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 0
            Height = 110
            Width = 470
          end
          object LocalComboBox: TcxComboBox
            Left = 82
            Top = 41
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Properties.DropDownListStyle = lsFixedList
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 1
            Width = 191
          end
          object ManagerComboBox: TcxComboBox
            Left = 81
            Top = 134
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Properties.DropDownListStyle = lsFixedList
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 2
            Width = 191
          end
          object UpjongComboBox: TcxComboBox
            Left = 82
            Top = 72
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Properties.DropDownListStyle = lsFixedList
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 3
            Width = 191
          end
          object SizeComboBox: TcxComboBox
            Left = 82
            Top = 103
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Properties.DropDownListStyle = lsFixedList
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 4
            Width = 191
          end
          object LicenseGroupBox: TcxGroupBox
            Left = 314
            Top = 37
            Caption = #44396#46021#48169#49885
            Enabled = False
            TabOrder = 5
            Height = 78
            Width = 239
            object Label5: TLabel
              Left = 24
              Top = 48
              Width = 60
              Height = 17
              Caption = #51060#50857#47308'('#50900')'
              Transparent = True
            end
            object LicenseRadio1Button: TRadioButton
              Left = 32
              Top = 22
              Width = 65
              Height = 17
              Caption = #54801#47141#49324
              Checked = True
              TabOrder = 0
              TabStop = True
            end
            object LicenseRadio2Button: TRadioButton
              Left = 123
              Top = 21
              Width = 49
              Height = 17
              Caption = #47588#51109
              TabOrder = 1
            end
            object AspAmtEdit: TcxCurrencyEdit
              Left = 101
              Top = 44
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
              TabOrder = 2
              Width = 69
            end
          end
          object cxGroupBox1: TcxGroupBox
            Left = 36
            Top = 313
            Caption = ' VAN'
            TabOrder = 6
            Height = 63
            Width = 478
            object Label12: TLabel
              Left = 26
              Top = 29
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
              Top = 29
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
              Top = 26
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
              Top = 26
              ParentFont = False
              Properties.Alignment.Horz = taLeftJustify
              Properties.DropDownListStyle = lsFixedList
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              TabOrder = 1
              Width = 137
            end
          end
          object StipulateFromDateEdit: TcxDateEdit
            Left = 106
            Top = 385
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.DateButtons = [btnClear, btnNow]
            Properties.DisplayFormat = 'yyyy-mm-dd'
            Properties.ImeMode = imSAlpha
            Properties.ImmediatePost = True
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 7
            Width = 98
          end
          object StipulateToDateEdit: TcxDateEdit
            Left = 227
            Top = 385
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.DateButtons = [btnClear, btnNow]
            Properties.DisplayFormat = 'yyyy-mm-dd'
            Properties.ImeMode = imSAlpha
            Properties.ImmediatePost = True
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 8
            Width = 98
          end
          object StipulateCountEdit: TcxCurrencyEdit
            Left = 106
            Top = 416
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
            TabOrder = 9
            Width = 98
          end
          object RentalFeeEdit: TcxCurrencyEdit
            Left = 325
            Top = 418
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
            TabOrder = 10
            Width = 98
          end
          object cxGroupBox3: TcxGroupBox
            Left = 36
            Top = 515
            Caption = ' '#49324#50857#48260#51204
            TabOrder = 11
            Height = 90
            Width = 517
            object PosVersionLabel: TLabel
              Left = 25
              Top = 29
              Width = 24
              Height = 17
              Caption = 'POS'
              Font.Charset = HANGEUL_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #47569#51008' '#44256#46357
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object TRVersionLabel: TLabel
              Left = 273
              Top = 29
              Width = 15
              Height = 17
              Caption = 'TR'
              Font.Charset = HANGEUL_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #47569#51008' '#44256#46357
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object PosUpdateCheckBox: TcxCheckBox
              Left = 19
              Top = 52
              Caption = ' '#54252#49828' '#51088#46041#50629#45936#51060#53944
              ParentFont = False
              Properties.OnChange = EditPropertiesChange
              Style.StyleController = EditStyleController
              Style.TransparentBorder = False
              TabOrder = 0
            end
          end
          object SmsRemainEdit: TcxCurrencyEdit
            Left = 391
            Top = 133
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
            TabOrder = 12
            Width = 128
          end
          object Option10ComboBox: TcxComboBox
            Left = 151
            Top = 449
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Properties.DropDownListStyle = lsFixedList
            Properties.Items.Strings = (
              'TR '#49892#54665#49884
              #49688#46041
              #51088#46041'(TR'#49892#54665#49884'+5'#48516#47560#45796')')
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 13
            Text = #51088#46041'(TR'#49892#54665#49884'+5'#48516#47560#45796')'
            Width = 174
          end
          object SubPartnerComboBox: TcxComboBox
            Left = 82
            Top = 10
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Properties.DropDownListStyle = lsFixedList
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 14
            Width = 191
          end
          object Option11CheckBox: TcxCheckBox
            Left = 43
            Top = 480
            Caption = ' '#54872#44221#49444#51221' '#51200#51109' '#49884' '#54801#47141#49324' '#51064#51613#51012' '#54616#51648' '#50506#49845#45768#45796'.'
            ParentFont = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            Style.TransparentBorder = False
            TabOrder = 15
          end
          object SaleDataDeleteButton: TAdvGlowButton
            Left = 411
            Top = 449
            Width = 142
            Height = 26
            Caption = #47588#52636#45936#51060#53552#49325#51228
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
            Picture.Data = {
              89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
              0D00000006624B474400FF00FF00FFA0BDA7930000020749444154388DC5924F
              6B135114C57FF7CD6B1327311A4DC48D1471A168B5202AB85350BB0AB8108A0B
              BBB15450F003883B7125BA2898FE8B344417DDB970670BFA01DC0855ACDD080D
              08490A226D4CD2CC3C1793269931A909085E98C579E7BEF3CE3D77E01F97EC46
              9AD4A45D66F3AA2B0C022843CD26BA246FE6CA3D0B9A5C2E82650D02945FBFBD
              E754AB8FDA792B1C7A685FBF9606C0716A323EBED555D02C2E4E02337F73DE7E
              05913B323636BF73A0DBD9DAB7FC50FDC7CF8D1EC53C81F8BE211F6E0785CCAB
              25E5CA837E045D6596BB0A6A3446997EF4D08174548045944294C2550A3735CA
              762CDA3CDB8E457153A3B80D2C4A052C7580D270E89E3EC191678F297F5C6163
              E23E0089CC14F6C830EBEB79F4CA2A0026E050FF815CCFB4F5E92B8574864377
              27203305803D324C219DC1FABC06AA315C20A2AE0E35E04C67298542246EDF02
              A0F4E225CE7416AD5A49051DFA32D41AC452CDCFDD1BC53E7FB6C9472E5EA0BE
              3FE6EBD1014BFEA5A0BD5194A21689109F798A7DE614C5D9058AB30BEC39799C
              83CF9F508B449A7D9D52F32131DE1B723849F8D8514A7359DCF99C37B208F19B
              37207900C97FF7EE883F435F00C573572E8998773BB812B519D8DCC26AB43918
              EAB64DA8FCAB95A191CBC90FCBEFBB3AC4B45208972BA0AC26B600AB526D6DB8
              83C3AE5BEEB58CD9ED3F1C30AB18B52690E8490C4A46CB97BE1CFCF7FA0DAF71
              943E6C3D02DD0000000049454E44AE426082}
            Rounded = True
            TabOrder = 16
            OnClick = SaleDataDeleteButtonClick
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
          object ProgramAuthInitButton: TAdvGlowButton
            Left = 411
            Top = 478
            Width = 143
            Height = 26
            Caption = #54532#47196#44536#47016' '#44428#54620' '#52488#44592#54868
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
            TabOrder = 17
            OnClick = ProgramAuthInitButtonClick
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
          object AdvPanel1: TAdvPanel
            Left = 81
            Top = 284
            Width = 472
            Height = 23
            Color = clWhite
            DockSite = True
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            ParentFont = False
            TabOrder = 18
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
            Caption.GradientDirection = gdVertical
            Caption.Height = 25
            Caption.Indent = 0
            Caption.MinMaxButton = True
            Caption.MinMaxCaption = True
            Caption.ShadeLight = 255
            Caption.Text = #48177#50629#45936#51060#53552' '#48373#50896
            Caption.TopIndent = 2
            Caption.Visible = True
            Collaps = True
            CollapsColor = clNone
            CollapsDelay = 0
            ColorTo = clWhite
            DoubleBuffered = True
            Ellipsis = True
            Position.Save = True
            Position.Location = clInifile
            ShadowColor = clBlack
            ShadowOffset = 0
            ShowMoveCursor = True
            StatusBar.BevelInner = True
            StatusBar.BorderColor = clNone
            StatusBar.BorderStyle = bsSingle
            StatusBar.Font.Charset = DEFAULT_CHARSET
            StatusBar.Font.Color = clWindowText
            StatusBar.Font.Height = -11
            StatusBar.Font.Name = 'Tahoma'
            StatusBar.Font.Style = []
            StatusBar.Color = clWhite
            StatusBar.GradientDirection = gdVertical
            Text = ''
            FullHeight = 126
            object MenuRestoreButton: TAdvGlowButton
              Left = 33
              Top = 41
              Width = 106
              Height = 26
              Caption = #47700#45684#48373#50896
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
              TabOrder = 0
              OnClick = MenuRestoreButtonClick
              Appearance.BorderColor = 11382963
              Appearance.BorderColorHot = 11565130
              Appearance.BorderColorCheckedHot = 11565130
              Appearance.BorderColorDown = 11565130
              Appearance.BorderColorChecked = 13744549
              Appearance.BorderColorDisabled = 13948116
              Appearance.ColorChecked = 13744549
              Appearance.ColorCheckedTo = 13744549
              Appearance.ColorDisabled = clWhite
              Appearance.ColorDisabledTo = clNone
              Appearance.ColorDown = 11565130
              Appearance.ColorDownTo = 11565130
              Appearance.ColorHot = 16444643
              Appearance.ColorHotTo = 16444643
              Appearance.ColorMirror = clWhite
              Appearance.ColorMirrorTo = clWhite
              Appearance.ColorMirrorHot = 16444643
              Appearance.ColorMirrorHotTo = 16444643
              Appearance.ColorMirrorDown = 11565130
              Appearance.ColorMirrorDownTo = 11565130
              Appearance.ColorMirrorChecked = 13744549
              Appearance.ColorMirrorCheckedTo = 13744549
              Appearance.ColorMirrorDisabled = clWhite
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
            object PosPluRestoreButton: TAdvGlowButton
              Left = 170
              Top = 41
              Width = 106
              Height = 26
              Caption = 'POS PLU '#48373#50896
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
              TabOrder = 1
              OnClick = PosPluRestoreButtonClick
              Appearance.BorderColor = 11382963
              Appearance.BorderColorHot = 11565130
              Appearance.BorderColorCheckedHot = 11565130
              Appearance.BorderColorDown = 11565130
              Appearance.BorderColorChecked = 13744549
              Appearance.BorderColorDisabled = 13948116
              Appearance.ColorChecked = 13744549
              Appearance.ColorCheckedTo = 13744549
              Appearance.ColorDisabled = clWhite
              Appearance.ColorDisabledTo = clNone
              Appearance.ColorDown = 11565130
              Appearance.ColorDownTo = 11565130
              Appearance.ColorHot = 16444643
              Appearance.ColorHotTo = 16444643
              Appearance.ColorMirror = clWhite
              Appearance.ColorMirrorTo = clWhite
              Appearance.ColorMirrorHot = 16444643
              Appearance.ColorMirrorHotTo = 16444643
              Appearance.ColorMirrorDown = 11565130
              Appearance.ColorMirrorDownTo = 11565130
              Appearance.ColorMirrorChecked = 13744549
              Appearance.ColorMirrorCheckedTo = 13744549
              Appearance.ColorMirrorDisabled = clWhite
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
            object TableRestoeButton: TAdvGlowButton
              Left = 307
              Top = 41
              Width = 106
              Height = 26
              Caption = #53580#51060#48660' '#48373#50896
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
              OnClick = TableRestoeButtonClick
              Appearance.BorderColor = 11382963
              Appearance.BorderColorHot = 11565130
              Appearance.BorderColorCheckedHot = 11565130
              Appearance.BorderColorDown = 11565130
              Appearance.BorderColorChecked = 13744549
              Appearance.BorderColorDisabled = 13948116
              Appearance.ColorChecked = 13744549
              Appearance.ColorCheckedTo = 13744549
              Appearance.ColorDisabled = clWhite
              Appearance.ColorDisabledTo = clNone
              Appearance.ColorDown = 11565130
              Appearance.ColorDownTo = 11565130
              Appearance.ColorHot = 16444643
              Appearance.ColorHotTo = 16444643
              Appearance.ColorMirror = clWhite
              Appearance.ColorMirrorTo = clWhite
              Appearance.ColorMirrorHot = 16444643
              Appearance.ColorMirrorHotTo = 16444643
              Appearance.ColorMirrorDown = 11565130
              Appearance.ColorMirrorDownTo = 11565130
              Appearance.ColorMirrorChecked = 13744549
              Appearance.ColorMirrorCheckedTo = 13744549
              Appearance.ColorMirrorDisabled = clWhite
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
            object KioskPluRestoreButton: TAdvGlowButton
              Left = 33
              Top = 78
              Width = 106
              Height = 26
              Caption = 'Kiosk PLU '#48373#50896
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
              TabOrder = 3
              OnClick = PosPluRestoreButtonClick
              Appearance.BorderColor = 11382963
              Appearance.BorderColorHot = 11565130
              Appearance.BorderColorCheckedHot = 11565130
              Appearance.BorderColorDown = 11565130
              Appearance.BorderColorChecked = 13744549
              Appearance.BorderColorDisabled = 13948116
              Appearance.ColorChecked = 13744549
              Appearance.ColorCheckedTo = 13744549
              Appearance.ColorDisabled = clWhite
              Appearance.ColorDisabledTo = clNone
              Appearance.ColorDown = 11565130
              Appearance.ColorDownTo = 11565130
              Appearance.ColorHot = 16444643
              Appearance.ColorHotTo = 16444643
              Appearance.ColorMirror = clWhite
              Appearance.ColorMirrorTo = clWhite
              Appearance.ColorMirrorHot = 16444643
              Appearance.ColorMirrorHotTo = 16444643
              Appearance.ColorMirrorDown = 11565130
              Appearance.ColorMirrorDownTo = 11565130
              Appearance.ColorMirrorChecked = 13744549
              Appearance.ColorMirrorCheckedTo = 13744549
              Appearance.ColorMirrorDisabled = clWhite
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
          object UploadBeginEdit: TcxMaskEdit
            Left = 120
            Top = 616
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.ImeMode = imSAlpha
            Properties.EditMask = '9999\-99\-99;1;_'
            Properties.MaxLength = 0
            Properties.ValidateOnEnter = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 19
            Text = '    -  -  '
            Width = 97
          end
          object UploadToEdit: TcxMaskEdit
            Left = 259
            Top = 616
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.ImeMode = imSAlpha
            Properties.EditMask = '9999\-99\-99;1;_'
            Properties.MaxLength = 0
            Properties.ValidateOnEnter = False
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 20
            Text = '    -  -  '
            Width = 96
          end
        end
      end
      object UserPager: TcxTabSheet
        Caption = #49324#50857#51088#51221#48372
        ImageIndex = 2
        object UserGrid: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 704
          Height = 779
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
          object UserGridTableView: TcxGridTableView
            Tag = 99
            Navigator.Buttons.CustomButtons = <>
            FilterBox.CustomizeDialog = False
            FilterBox.Visible = fvNever
            ScrollbarAnnotations.CustomAnnotations = <>
            OnCellDblClick = UserGridTableViewCellDblClick
            DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = ',0'#44148
                Kind = skCount
                Column = UserGridTableViewUserID
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
            object UserGridTableViewUserID: TcxGridColumn
              Caption = #49324#50857#51088'ID'
              DataBinding.FieldName = 'ID_USER'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              FooterAlignmentHorz = taRightJustify
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Width = 125
            end
            object UserGridTableViewGubun: TcxGridColumn
              Caption = #49324#50857#51088#51060#47492
              DataBinding.FieldName = 'NM_USER'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 210
            end
            object UserGridTableViewPassWord: TcxGridColumn
              Caption = #54056#49828#50892#46300
              DataBinding.FieldName = 'PW_USER'
              PropertiesClassName = 'TcxLabelProperties'
              HeaderAlignmentHorz = taCenter
              Width = 119
            end
          end
          object GridLevel1: TcxGridLevel
            GridView = UserGridTableView
          end
        end
      end
      object SyncPage: TcxTabSheet
        Caption = #54364#51456#46041#44592#54868
        ImageIndex = 3
        OnShow = SyncPageShow
        object SyncCheckGroup: TcxCheckGroup
          Left = 22
          Top = 19
          Caption = ' '#46041#44592#54868' '
          Properties.Items = <
            item
              Caption = ' '#47700#45684#48516#47448
            end
            item
              Caption = ' '#47700#45684#47560#49828#53552
            end
            item
              Caption = ' '#54252#49828#46356#51088#51064
            end
            item
              Caption = ' PLU'
            end
            item
              Caption = ' '#53412#50724#49828#53356' '#46356#51088#51064
            end
            item
              Caption = ' '#53412#50724#49828#53356' PLU'
            end>
          TabOrder = 0
          Height = 221
          Width = 281
        end
        object SyncButton: TAdvGlowButton
          Left = 140
          Top = 270
          Width = 94
          Height = 38
          Caption = #46041#44592#54868
          FocusType = ftHot
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          Picture.Data = {
            89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
            0D00000006624B474400FF00FF00FFA0BDA7930000039049444154388D7D945D
            4C1C5514C77F73197676607786653F682D082C5B2CA941315A287D3106B19218
            13CA8331D1A49A1035C6271FF4AD6F36A96F86585F4C939AF8D0608C0FE00749
            9F1AA05652DAC6A694AFD61265B7C07EB0B3CCB03BE3C374BF4ACB49E6E19C7B
            CE6FFEE7DE7BAEC43E36786EB6DDAF7A866451130528140A4BDBDB3B13BF7E79
            7CF56935D29E88E348A7BE993FADF9D4D150C0DFD114D4425E450120B76392D8
            4C27125B99E5ED6DE3FCA5CF7A2EEC0B1C387B4D6F0A78C7BBA2CFF48702BABA
            9FFAC456DAB8BDF4CF743C699D9AFAE2E5D41EE0C0D96BFAC1807AF95877ACA7
            B656DE8F55322B9FE7EAFCE2DC7F5BB9D78A50516CB329E01D7F1C262468D525
            FA9B25FA5B245A750951D193479639F642ECA5488367BC18AB01180E0D7FF8FC
            E19651AD5EAD2D2EB468F07A87E06858E2805FA2A95E221A9088354AA44D87B4
            F9082004F5AA7230F8CA3B6B7F4F7E775D006875CA6824A0D555C25E6D1334AA
            90346135092B49D8DA015F2D3CAB579F6528A0ABF5BEBA8F00E4935F4DB74582
            5AB4B2CDDE66815A0BF79230B56253B08B6AA04D9748180EC35D82A965BBA434
            DCE08F0E9E9B6D173E9F7728D2A885CAEA241A14D8CC55C3000A36240C879331
            41B80E860E0B74F74611096AE17A8FF286A891E54EAFC7532A3AE47795644CAA
            60007E0FBCFD9CC0FBE8DC64016F750AFC1E50150F8A47740AC7719C62F27BDD
            8258D0DD9F269FEBFBCBFF2263C1C51B36EBDBAEBFB4E9F0C34D9B8CE5FA4E01
            4738F9FCC28E6591B1E0E73B3666DE5DB40AF0CB4239B968B200BF020507D632
            E578CEB4D8B5ED0591B57213EB0F537170DB9C5CB449183071D726A44AD4886A
            D840BB20A8C2560E1EA49DD25AFC6132616473BF4900A7BFBF33D3DB1DEBAD54
            72A245E24850226541DA74474A53A05185EC2E5C5EB5594B97F3676E2CCC5EF8
            A0AB4F00640DE3DBF846CAA804DE4F39647621E085F606686B00DD0B1BB9BDB0
            C466DAC81AE6181467D971A477CFDFFABDAFA773C023578F5EB32671C8EFFA6B
            19B74DBBDC29D66E9EE9EB8B7FFCF8F1D14128CEB22439F1943972757E71CECA
            E74BC9B6E32A9D7EE07EF7537B617FDE5CFA2BB99E1929C6AA66E8CD33335AE0
            40DD4F473A5A8E578EE2932CBE91326E2FFF7B25B99E19993CD357DA80BD0F2C
            303236F7BECFAB7E120EE8D148500BAB8A7B19733B16F1CD743C914CAD640D73
            ECD2A72F5E7CBCF689C0A20D7D7DA555AD518764458E618355B0EF9ABBD9C989
            CF4FDC7B5ACDFF86C4694E2A41BC3E0000000049454E44AE426082}
          Rounded = True
          TabOrder = 1
          OnClick = SyncButtonClick
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
      object HistoryPage: TcxTabSheet
        Caption = #49688#51221#51060#47141
        ImageIndex = 4
        object cxGrid1: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 704
          Height = 779
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
            object HistoryGridTableViewColumn18: TcxGridColumn
              Caption = #48376#49324
              DataBinding.FieldName = 'CD_COMPANY'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 132
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
            object HistoryGridTableViewColumn8: TcxGridColumn
              Caption = #53412#50724#49828#53356#49688#47049
              DataBinding.FieldName = 'ALLOW_KIOSK'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',#'
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewColumn9: TcxGridColumn
              Caption = #47700#45684#51228#54620
              DataBinding.FieldName = 'ALLOW_MENUCOUNT'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',#'
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewColumn10: TcxGridColumn
              Caption = #54364#51456#50672#46041
              DataBinding.FieldName = 'OPTIONS'
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
            object HistoryGridTableViewColumn14: TcxGridColumn
              Caption = #44396#46021#48169#49885
              DataBinding.FieldName = 'DS_LICENSE'
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewColumn16: TcxGridColumn
              Caption = #44396#46021#47308
              DataBinding.FieldName = 'AMT_ASP'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',#'
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewColumn15: TcxGridColumn
              Caption = #51088#46041#50629#45936#51060#53944
              DataBinding.FieldName = 'YN_POSUPDATE'
              HeaderAlignmentHorz = taCenter
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = HistoryGridTableView
          end
        end
      end
      object RustDeskPage: TcxTabSheet
        Caption = #50896#44201#51221#48372
        ImageIndex = 6
        OnShow = RustDeskPageShow
        object cxGrid2: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 704
          Height = 779
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
                Column = cxGridColumn1
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
              Caption = 'PosNo&TableNo'
              DataBinding.FieldName = 'NO_POS'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              FooterAlignmentHorz = taRightJustify
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Width = 166
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
            object cxGridRustDeskID: TcxGridColumn
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
  object DetailSearchPanel: TAdvPanel [5]
    Left = 0
    Top = 65
    Width = 1224
    Height = 18
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
    FullHeight = 154
    object ScrollBox1: TScrollBox
      Left = 0
      Top = 18
      Width = 1224
      Height = 0
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clInactiveCaption
      Ctl3D = True
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 0
      object ConditionLocalComboBox: TcxComboBox
        Tag = 99
        Left = 294
        Top = 6
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.DropDownListStyle = lsFixedList
        Style.StyleController = EditStyleController
        TabOrder = 2
        Width = 141
      end
      object cxLabel2: TcxLabel
        Left = 250
        Top = 5
        AutoSize = False
        Caption = #51648#50669
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 27
        Width = 41
        AnchorX = 271
        AnchorY = 19
      end
      object ConditionManagerComboBox: TcxComboBox
        Tag = 99
        Left = 528
        Top = 6
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.DropDownListStyle = lsFixedList
        Style.StyleController = EditStyleController
        TabOrder = 3
        Width = 141
      end
      object cxLabel3: TcxLabel
        Left = 473
        Top = 5
        AutoSize = False
        Caption = #45812#45817#51088
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 27
        Width = 52
        AnchorX = 499
        AnchorY = 19
      end
      object ConditionUpjongComboBox: TcxComboBox
        Tag = 99
        Left = 294
        Top = 37
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.DropDownListStyle = lsFixedList
        Style.StyleController = EditStyleController
        TabOrder = 7
        Width = 141
      end
      object cxLabel4: TcxLabel
        Left = 247
        Top = 36
        AutoSize = False
        Caption = #50629#51333
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 27
        Width = 52
        AnchorX = 273
        AnchorY = 50
      end
      object ConditionSizeComboBox: TcxComboBox
        Tag = 99
        Left = 528
        Top = 38
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.DropDownListStyle = lsFixedList
        Style.StyleController = EditStyleController
        TabOrder = 8
        Width = 141
      end
      object cxLabel5: TcxLabel
        Left = 480
        Top = 37
        AutoSize = False
        Caption = #44508#47784
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 27
        Width = 42
        AnchorX = 501
        AnchorY = 51
      end
      object ConditionVanComboBox: TcxComboBox
        Tag = 99
        Left = 81
        Top = 7
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.DropDownListStyle = lsFixedList
        Style.StyleController = EditStyleController
        TabOrder = 0
        Width = 114
      end
      object cxLabel6: TcxLabel
        Left = 37
        Top = 6
        AutoSize = False
        Caption = 'VAN'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 27
        Width = 41
        AnchorX = 58
        AnchorY = 20
      end
      object cxLabel7: TcxLabel
        Left = 10
        Top = 36
        AutoSize = False
        Caption = 'VAN '#48169#49885
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 27
        Width = 65
        AnchorX = 43
        AnchorY = 50
      end
      object ConditionVanTypeComboBox: TcxComboBox
        Tag = 99
        Left = 81
        Top = 38
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.DropDownListStyle = lsFixedList
        Style.StyleController = EditStyleController
        TabOrder = 1
        Width = 114
      end
      object ConditionPayTypeComboBox: TcxComboBox
        Tag = 99
        Left = 81
        Top = 69
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.DropDownListStyle = lsFixedList
        Style.StyleController = EditStyleController
        TabOrder = 4
        Width = 114
      end
      object cxLabel8: TcxLabel
        Left = 42
        Top = 67
        AutoSize = False
        Caption = #44396#46021
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 27
        Width = 33
        AnchorX = 59
        AnchorY = 81
      end
      object ConditionPayEndCheckBox: TcxCheckBox
        Tag = 99
        Left = 212
        Top = 69
        Caption = #44396#46021#51333#47308
        Properties.OnChange = ConditionPayEndCheckBoxPropertiesChange
        TabOrder = 5
      end
      object ConditionPayFromDateEdit: TcxDateEdit
        Tag = 99
        Left = 294
        Top = 68
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.DateButtons = [btnClear, btnNow]
        Properties.DisplayFormat = 'yyyy-mm-dd'
        Properties.ImeMode = imSAlpha
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Properties.OnChange = ConditionPayFromDateEditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 6
        Width = 103
      end
      object cxLabel9: TcxLabel
        Left = 397
        Top = 68
        AutoSize = False
        Caption = '~'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 27
        Width = 25
        AnchorX = 410
        AnchorY = 82
      end
      object ConditionPayEndDateEdit: TcxDateEdit
        Tag = 99
        Left = 424
        Top = 69
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.DateButtons = [btnClear, btnNow]
        Properties.DisplayFormat = 'yyyy-mm-dd'
        Properties.ImeMode = imSAlpha
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Properties.OnChange = ConditionPayFromDateEditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 17
        Width = 103
      end
      object ConditionStipulateCheckBox: TcxCheckBox
        Left = 546
        Top = 69
        Caption = #44228#50557#51333#47308
        Properties.OnChange = ConditionStipulateCheckBoxPropertiesChange
        TabOrder = 18
      end
      object ConditionStipulateFromDateEdit: TcxDateEdit
        Tag = 99
        Left = 628
        Top = 69
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.DateButtons = [btnClear, btnNow]
        Properties.DisplayFormat = 'yyyy-mm-dd'
        Properties.ImeMode = imSAlpha
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Properties.OnChange = ConditionStipulateFromDateEditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 19
        Width = 103
      end
      object cxLabel10: TcxLabel
        Left = 731
        Top = 68
        AutoSize = False
        Caption = '~'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 27
        Width = 25
        AnchorX = 744
        AnchorY = 82
      end
      object ConditionStipulateToDateEdit: TcxDateEdit
        Tag = 99
        Left = 758
        Top = 69
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.DateButtons = [btnClear, btnNow]
        Properties.DisplayFormat = 'yyyy-mm-dd'
        Properties.ImeMode = imSAlpha
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Properties.OnChange = ConditionStipulateFromDateEditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 21
        Width = 103
      end
      object ConditionDemoCheckBox: TcxCheckBox
        Tag = 99
        Left = 212
        Top = 99
        Caption = #45936#47784#51333#47308
        Properties.OnChange = ConditionDemoCheckBoxPropertiesChange
        TabOrder = 22
      end
      object ConditionDemoFromDateEdit: TcxDateEdit
        Tag = 99
        Left = 294
        Top = 98
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.DateButtons = [btnClear, btnNow]
        Properties.DisplayFormat = 'yyyy-mm-dd'
        Properties.ImeMode = imSAlpha
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Properties.OnChange = ConditionDemoFromDateEditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 23
        Width = 103
      end
      object cxLabel11: TcxLabel
        Left = 397
        Top = 98
        AutoSize = False
        Caption = '~'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 27
        Width = 25
        AnchorX = 410
        AnchorY = 112
      end
      object ConditionDemoToDateEdit: TcxDateEdit
        Tag = 99
        Left = 424
        Top = 99
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.DateButtons = [btnClear, btnNow]
        Properties.DisplayFormat = 'yyyy-mm-dd'
        Properties.ImeMode = imSAlpha
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Properties.OnChange = ConditionDemoFromDateEditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 25
        Width = 103
      end
      object OptionLetsOrderCheckBox: TcxCheckBox
        Tag = 99
        Left = 81
        Top = 100
        Caption = #47131#52768#50724#45908
        Properties.OnChange = ConditionPayEndCheckBoxPropertiesChange
        TabOrder = 26
      end
    end
  end
  object AuthTelPanel: TAdvPanel [6]
    Left = 105
    Top = 402
    Width = 384
    Height = 165
    Color = clWhite
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 6
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
    Caption.Indent = 10
    Caption.Text = '<P align="center">'#51064#51613#48264#54840#47484' '#48155#51012' '#51204#54868#48264#54840#47484' '#49440#53469#54616#49464#50836'</P>'
    Caption.TopIndent = 3
    Caption.Visible = True
    ColorTo = clWhite
    DoubleBuffered = True
    Position.Section = 'OrangePosPanel'
    ShadowOffset = 5
    ShowMoveCursor = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    TextVAlign = tvaCenter
    DesignSize = (
      384
      165)
    FullHeight = 180
    object Label21: TLabel
      Left = 56
      Top = 58
      Width = 52
      Height = 17
      Caption = #51204#54868#48264#54840
      Transparent = True
    end
    object AuthComboBox: TcxComboBox
      Left = 132
      Top = 54
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
      TabOrder = 0
      Text = #51064#51613#50756#47308
      Width = 125
    end
    object OKButton: TAdvGlowButton
      Left = 87
      Top = 110
      Width = 83
      Height = 31
      Anchors = [akRight, akBottom]
      Caption = #54869#51064
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
      TabOrder = 1
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
      Left = 195
      Top = 110
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
      TabOrder = 2
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
  inherited Exec_Timer: TTimer
    Interval = 1000
    OnTimer = Exec_TimerTimer
  end
  object OpenDialog: TOpenDialog
    Filter = 
      'avil files (*.avi)|*.avi|wmvl files (*.wmv)|*.wmv|jpg files (*.j' +
      'pg)|*.jpg|png files (*.png)|*.png'
    Options = [ofReadOnly, ofOverwritePrompt, ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Left = 448
    Top = 33
  end
end
