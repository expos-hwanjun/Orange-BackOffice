inherited StoreSubPartnerForm: TStoreSubPartnerForm
  Caption = #48512#45824#47532#51216' '#44288#47532
  ClientHeight = 713
  ClientWidth = 942
  ExplicitWidth = 958
  ExplicitHeight = 752
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Height = 648
    ExplicitHeight = 648
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 942
    ExplicitWidth = 942
    inherited ButtonToolBar: TAdvToolBar
      Left = 410
      ExplicitLeft = 410
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
        Visible = True
        AnchorX = 298
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Properties.Items.Strings = (
          #51221#49345
          #44228#50557#54644#51648
          #51204#52404)
        Text = #51221#49345
        Visible = True
      end
    end
  end
  inherited GridPanel: TPanel
    Height = 648
    ExplicitHeight = 648
    inherited Grid: TcxGrid
      Height = 642
      ExplicitHeight = 642
      inherited GridTableView: TcxGridTableView
        object GridTableViewPartnerCode: TcxGridColumn
          Caption = #45824#47532#51216#53076#46300
          DataBinding.FieldName = 'CD_PARTNER'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 91
        end
        object GridTableViewColumn2: TcxGridColumn
          Caption = #45824#47532#51216#47749
          DataBinding.FieldName = 'NM_PARTNER'
          HeaderAlignmentHorz = taCenter
          Width = 141
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Width = 686
    Height = 648
    ExplicitWidth = 686
    ExplicitHeight = 648
    object GoodsCodeLabel: TLabel
      Left = 20
      Top = 12
      Width = 65
      Height = 17
      Caption = #45824#47532#51216#53076#46300
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object GoodsNameLabel: TLabel
      Left = 21
      Top = 42
      Width = 65
      Height = 17
      Caption = #45824#47532#51216#51060#47492
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object CEONameLabel: TLabel
      Left = 33
      Top = 71
      Width = 52
      Height = 17
      Caption = #45824#54364#51088#47749
      Transparent = True
    end
    object IDNoLabel: TLabel
      Left = 20
      Top = 100
      Width = 65
      Height = 17
      Caption = #49324#50629#51088#48264#54840
      Transparent = True
    end
    object TelNoLabel: TLabel
      Left = 33
      Top = 158
      Width = 52
      Height = 17
      Caption = #54924#49324#51204#54868
      Transparent = True
    end
    object AddrLabel: TLabel
      Left = 33
      Top = 217
      Width = 52
      Height = 17
      Caption = #51452#12288#12288#49548
      Transparent = True
    end
    object Label4: TLabel
      Left = 33
      Top = 307
      Width = 49
      Height = 17
      Caption = #45812' '#45817' '#51088
      Transparent = True
    end
    object Label5: TLabel
      Left = 33
      Top = 337
      Width = 52
      Height = 17
      Caption = #45812#45817#51204#54868
      Transparent = True
    end
    object Label6: TLabel
      Left = 9
      Top = 128
      Width = 78
      Height = 17
      Caption = #45824#54364#55092#45824#48264#54840
      Transparent = True
    end
    object Label7: TLabel
      Left = 33
      Top = 187
      Width = 52
      Height = 17
      Caption = #54057#49828#51204#54868
      Transparent = True
    end
    object Label8: TLabel
      Left = 33
      Top = 277
      Width = 49
      Height = 17
      Caption = #51060' '#47700' '#51068
      Transparent = True
    end
    object Label9: TLabel
      Left = 34
      Top = 366
      Width = 51
      Height = 17
      Caption = #48708'     '#44256
      Transparent = True
    end
    object UseYNLabel: TLabel
      Left = 35
      Top = 541
      Width = 51
      Height = 17
      Caption = #49345'     '#53468
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object EnterDateLabel: TLabel
      Left = 35
      Top = 510
      Width = 52
      Height = 17
      Caption = #44228#50557#51068#51088
      Transparent = True
    end
    object RetireDateLabel: TLabel
      Left = 259
      Top = 512
      Width = 52
      Height = 17
      Caption = #54644#51648#51068#51088
      Transparent = True
    end
    object PartnerCodeEdit: TcxTextEdit
      Left = 93
      Top = 9
      Enabled = False
      ParentFont = False
      Properties.ImeMode = imDisable
      Properties.MaxLength = 14
      Style.StyleController = EditStyleController
      TabOrder = 0
      Width = 60
    end
    object PartnerNameEdit: TcxTextEdit
      Left = 93
      Top = 39
      ParentFont = False
      Properties.ImeMode = imSHanguel
      Properties.MaxLength = 150
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 1
      Width = 309
    end
    object CEONameEdit: TcxTextEdit
      Left = 93
      Top = 68
      ParentFont = False
      Properties.ImeMode = imSHanguel
      Properties.MaxLength = 20
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 2
      Width = 120
    end
    object BizNoEdit: TcxMaskEdit
      Left = 93
      Top = 97
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
      Left = 93
      Top = 155
      ParentFont = False
      Properties.ImeMode = imSAlpha
      Properties.MaxLength = 13
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 5
      OnExit = CeoMobileTelEditExit
      Width = 120
    end
    object ZipCodeEdit: TcxButtonEdit
      Left = 93
      Top = 214
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
      TabOrder = 7
      Width = 76
    end
    object Addr1Edit: TcxTextEdit
      Left = 171
      Top = 214
      TabStop = False
      ParentFont = False
      Properties.MaxLength = 80
      Properties.ReadOnly = True
      Style.Color = 14737632
      Style.StyleController = EditStyleController
      StyleFocused.Color = 14737632
      TabOrder = 8
      Width = 392
    end
    object Addr2Edit: TcxTextEdit
      Left = 171
      Top = 243
      ParentFont = False
      Properties.ImeMode = imSHanguel
      Properties.MaxLength = 80
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 9
      Width = 392
    end
    object DamdangNameEdit: TcxTextEdit
      Left = 93
      Top = 304
      ParentFont = False
      Properties.ImeMode = imSAlpha
      Properties.MaxLength = 50
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 11
      Width = 120
    end
    object DamdangMobileEdit: TcxTextEdit
      Left = 93
      Top = 333
      ParentFont = False
      Properties.ImeMode = imSAlpha
      Properties.MaxLength = 13
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 12
      OnExit = CeoMobileTelEditExit
      Width = 120
    end
    object CeoMobileTelEdit: TcxTextEdit
      Left = 93
      Top = 126
      ParentFont = False
      Properties.ImeMode = imSAlpha
      Properties.MaxLength = 13
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 4
      OnExit = CeoMobileTelEditExit
      Width = 120
    end
    object FaxTelEdit: TcxTextEdit
      Left = 93
      Top = 184
      ParentFont = False
      Properties.ImeMode = imSAlpha
      Properties.MaxLength = 13
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 6
      OnExit = CeoMobileTelEditExit
      Width = 120
    end
    object EmailEdit: TcxTextEdit
      Left = 93
      Top = 274
      ParentFont = False
      Properties.ImeMode = imSHanguel
      Properties.MaxLength = 150
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 10
      Width = 309
    end
    object RemarkMemo: TcxMemo
      Left = 93
      Top = 364
      ParentFont = False
      Properties.ImeMode = imSHanguel
      Properties.MaxLength = 1000
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 13
      Height = 137
      Width = 470
    end
    object UseYNComboBox: TcxComboBox
      Left = 92
      Top = 538
      Hint = 'DS_STATUS'
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #51221#49345
        #44228#50557#54644#51648)
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 16
      Text = #51221#49345
      Width = 120
    end
    object EnterDateEdit: TcxDateEdit
      Left = 93
      Top = 507
      ParentFont = False
      Properties.DateButtons = [btnClear, btnNow]
      Properties.ImeMode = imSAlpha
      Properties.ImmediatePost = True
      Properties.UseNullString = True
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 14
      Width = 120
    end
    object RetireDateEdit: TcxDateEdit
      Left = 317
      Top = 507
      ParentFont = False
      Properties.DateButtons = [btnClear, btnNow]
      Properties.ImeMode = imSAlpha
      Properties.ImmediatePost = True
      Properties.UseNullString = True
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 15
      Width = 120
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
