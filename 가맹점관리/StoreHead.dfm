inherited StoreHeadForm: TStoreHeadForm
  Caption = #48376#49324#44288#47532
  ClientHeight = 796
  ClientWidth = 1085
  ExplicitWidth = 1101
  ExplicitHeight = 835
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 454
    Height = 731
    ExplicitLeft = 454
    ExplicitHeight = 731
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1085
    ExplicitWidth = 1085
    inherited ButtonToolBar: TAdvToolBar
      Left = 553
      ExplicitLeft = 553
    end
    inherited ConditionToolBar: TAdvToolBar
      Width = 588
      ExplicitWidth = 588
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
        ExplicitWidth = 179
        Width = 179
      end
    end
  end
  inherited GridPanel: TPanel
    Width = 454
    Height = 731
    ExplicitWidth = 454
    ExplicitHeight = 731
    inherited Grid: TcxGrid
      Width = 448
      Height = 725
      ExplicitWidth = 448
      ExplicitHeight = 725
      inherited GridTableView: TcxGridTableView
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0'
            Kind = skCount
            Column = GridTableViewHeadName
          end>
        OptionsView.Footer = True
        object GridTableViewPartner: TcxGridColumn
          Caption = #54801#47141#49324
          DataBinding.FieldName = 'NM_PARTNER'
          HeaderAlignmentHorz = taCenter
          Width = 147
        end
        object GridTableViewHeadCode: TcxGridColumn
          Caption = #53076#46300
          DataBinding.FieldName = 'CD_COMPANY'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 91
        end
        object GridTableViewHeadName: TcxGridColumn
          Caption = #48376#49324#47749
          DataBinding.FieldName = 'NM_COMPANY'
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 167
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 460
    Width = 625
    Height = 731
    ExplicitLeft = 460
    ExplicitWidth = 625
    ExplicitHeight = 731
    object GoodsCodeLabel: TLabel
      Left = 23
      Top = 18
      Width = 52
      Height = 17
      Caption = #48376#49324#53076#46300
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
      Top = 48
      Width = 52
      Height = 17
      Caption = #48376#49324#51060#47492
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object MenuClassLabel: TLabel
      Left = 23
      Top = 110
      Width = 49
      Height = 17
      Caption = #54801' '#47141' '#49324
      Transparent = True
    end
    object CEONameLabel: TLabel
      Left = 24
      Top = 199
      Width = 52
      Height = 17
      Caption = #45824#54364#51088#47749
      Transparent = True
    end
    object IDNoLabel: TLabel
      Left = 11
      Top = 170
      Width = 65
      Height = 17
      Caption = #49324#50629#51088#48264#54840
      Transparent = True
    end
    object TelNoLabel: TLabel
      Left = 24
      Top = 229
      Width = 52
      Height = 17
      Caption = #51204#54868#48264#54840
      Transparent = True
    end
    object AddrLabel: TLabel
      Left = 24
      Top = 260
      Width = 52
      Height = 17
      Caption = #51452#12288#12288#49548
      Transparent = True
    end
    object UseYNLabel: TLabel
      Left = 24
      Top = 480
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
      Top = 429
      Width = 52
      Height = 17
      Caption = #48708#12288#12288#44256
      Transparent = True
    end
    object Label1: TLabel
      Left = 23
      Top = 79
      Width = 49
      Height = 17
      Caption = #49556' '#47336' '#49496
      Transparent = True
    end
    object Label23: TLabel
      Left = 23
      Top = 141
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
    object CompanyCodeEdit: TcxTextEdit
      Left = 84
      Top = 15
      Enabled = False
      ParentFont = False
      Properties.ImeMode = imDisable
      Properties.MaxLength = 14
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 0
      Width = 120
    end
    object CompanyNameEdit: TcxTextEdit
      Left = 84
      Top = 45
      ParentFont = False
      Properties.ImeMode = imSHanguel
      Properties.MaxLength = 150
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 1
      Width = 334
    end
    object PartnerCodeEdit: TcxButtonEdit
      Left = 84
      Top = 107
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
      TabOrder = 3
      Width = 89
    end
    object PartnerNameEdit: TcxTextEdit
      Left = 175
      Top = 107
      TabStop = False
      Enabled = False
      ParentFont = False
      Properties.ReadOnly = True
      Properties.OnChange = EditPropertiesChange
      Style.Color = 14737632
      Style.StyleController = EditStyleController
      TabOrder = 14
      Width = 242
    end
    object CEONameEdit: TcxTextEdit
      Left = 84
      Top = 196
      ParentFont = False
      Properties.ImeMode = imSHanguel
      Properties.MaxLength = 20
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 6
      Width = 120
    end
    object BizNoEdit: TcxMaskEdit
      Left = 84
      Top = 167
      ParentFont = False
      Properties.ImeMode = imSAlpha
      Properties.EditMask = '999\-99\-99999;1;_'
      Properties.MaxLength = 0
      Properties.ValidateOnEnter = False
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 5
      Text = '   -  -     '
      Width = 120
    end
    object TelNoEdit: TcxTextEdit
      Left = 84
      Top = 226
      ParentFont = False
      Properties.ImeMode = imSAlpha
      Properties.MaxLength = 13
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 7
      Width = 120
    end
    object ZipCodeEdit: TcxButtonEdit
      Left = 84
      Top = 257
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
      Top = 257
      TabStop = False
      Enabled = False
      ParentFont = False
      Properties.MaxLength = 80
      Properties.ReadOnly = True
      Properties.OnChange = EditPropertiesChange
      Style.Color = 14737632
      Style.StyleController = EditStyleController
      StyleFocused.Color = 14737632
      TabOrder = 9
      Width = 392
    end
    object Addr2Edit: TcxTextEdit
      Left = 162
      Top = 286
      ParentFont = False
      Properties.ImeMode = imSHanguel
      Properties.MaxLength = 80
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 10
      Width = 392
    end
    object UseYNComboBox: TcxComboBox
      Left = 84
      Top = 477
      Hint = 'DS_STATUS'
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #49324#50857
        #49324#50857' '#50504#54632)
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 13
      Text = #49324#50857
      Width = 101
    end
    object RemarkMemo: TcxMemo
      Left = 84
      Top = 426
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
    object UseGroupBox: TcxGroupBox
      Left = 23
      Top = 324
      Caption = #49324#50857#44592#45733
      TabOrder = 11
      Height = 90
      Width = 530
      object Option1CheckBox: TcxCheckBox
        Left = 19
        Top = 26
        Caption = #54532#47116#52264#51060#51592
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 0
      end
      object Option2CheckBox: TcxCheckBox
        Left = 122
        Top = 26
        Caption = #54364#51456#47700#45684
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 1
      end
      object Option3CheckBox: TcxCheckBox
        Left = 212
        Top = 26
        Caption = #54364#51456'PLU'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 2
      end
      object Option5CheckBox: TcxCheckBox
        Left = 386
        Top = 26
        Caption = #53685#54633#54924#50896
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 4
      end
      object Option4CheckBox: TcxCheckBox
        Left = 306
        Top = 26
        Caption = 'KIOSK'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 3
      end
      object Option6CheckBox: TcxCheckBox
        Left = 19
        Top = 57
        Caption = #47131#52768#50724#45908' '#54364#51456' PLU'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 5
      end
      object Option7CheckBox: TcxCheckBox
        Left = 166
        Top = 57
        Caption = #53468#48660#47551' '#54364#51456' '#45824#44592#51060#48120#51648' '
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 6
        Visible = False
      end
      object Option8CheckBox: TcxCheckBox
        Left = 386
        Top = 57
        Caption = #49688#48156#51452
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 7
      end
    end
    object SolutionComboBox: TcxComboBox
      Left = 84
      Top = 76
      Hint = 'DS_STATUS'
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #49324#50857
        #49324#50857' '#50504#54632)
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 2
      Width = 117
    end
    object SubPartnerComboBox: TcxComboBox
      Left = 83
      Top = 137
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.DropDownListStyle = lsFixedList
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 4
      Width = 191
    end
    object DBGroupBox: TcxGroupBox
      Left = 23
      Top = 521
      Caption = ' DB '#51221#48372
      TabOrder = 15
      Visible = False
      Height = 160
      Width = 530
      object Label2: TLabel
        Left = 26
        Top = 31
        Width = 60
        Height = 17
        Caption = 'DB NAME'
        Transparent = True
      end
      object Label4: TLabel
        Left = 307
        Top = 31
        Width = 33
        Height = 17
        Caption = 'DB IP'
        Transparent = True
      end
      object Label5: TLabel
        Left = 33
        Top = 63
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
        Left = 33
        Top = 95
        Width = 53
        Height = 17
        Caption = 'DB USER'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label9: TLabel
        Left = 290
        Top = 94
        Width = 50
        Height = 17
        Caption = 'DB PWD'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label10: TLabel
        Left = 15
        Top = 124
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
        Left = 168
        Top = 127
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
      object Label3: TLabel
        Left = 291
        Top = 124
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
      object UserEdit: TcxTextEdit
        Left = 97
        Top = 90
        ParentFont = False
        Properties.ImeMode = imSAlpha
        Properties.MaxLength = 30
        Properties.PasswordChar = '*'
        Properties.ReadOnly = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 3
        Width = 152
      end
      object UserPassEdit: TcxTextEdit
        Left = 353
        Top = 90
        ParentFont = False
        Properties.ImeMode = imSAlpha
        Properties.MaxLength = 30
        Properties.PasswordChar = '*'
        Properties.ReadOnly = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 4
        Width = 136
      end
      object DBNameEdit: TcxTextEdit
        Left = 97
        Top = 28
        ParentFont = False
        Properties.ImeMode = imSAlpha
        Properties.MaxLength = 100
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 0
        Width = 152
      end
      object DBIPEdit: TcxTextEdit
        Left = 353
        Top = 28
        ParentFont = False
        Properties.ImeMode = imSAlpha
        Properties.MaxLength = 30
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 1
        Width = 136
      end
      object DBPortEdit: TcxCurrencyEdit
        Left = 97
        Top = 59
        EditValue = 9914.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.DisplayFormat = '#0'
        Properties.EditFormat = ',0'
        Properties.ImeMode = imSAlpha
        Properties.MaxLength = 5
        Properties.Nullable = False
        Properties.Nullstring = '0'
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 2
        Width = 64
      end
      object SyncPosPortEdit: TcxCurrencyEdit
        Left = 97
        Top = 121
        EditValue = 9911.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.DisplayFormat = '#0'
        Properties.EditFormat = ',0'
        Properties.ImeMode = imSAlpha
        Properties.MaxLength = 5
        Properties.Nullable = False
        Properties.Nullstring = '0'
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 5
        Width = 64
      end
      object RestPortEdit: TcxCurrencyEdit
        Left = 353
        Top = 121
        EditValue = 9911.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.DisplayFormat = '#0'
        Properties.EditFormat = ',0'
        Properties.ImeMode = imSAlpha
        Properties.MaxLength = 5
        Properties.Nullable = False
        Properties.Nullstring = '0'
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 6
        Width = 64
      end
      object RestAPIEdit: TcxTextEdit
        Left = 423
        Top = 121
        ParentFont = False
        Properties.ImeMode = imSAlpha
        Properties.MaxLength = 30
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 7
        Width = 66
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
