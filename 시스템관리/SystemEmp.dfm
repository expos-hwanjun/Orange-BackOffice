inherited SystemEmpForm: TSystemEmpForm
  Left = 300
  Top = 120
  Caption = #49324#50857#51088#44288#47532
  ClientHeight = 612
  ClientWidth = 891
  HelpFile = #54980#48169'/'#49884#49828#53596#44288#47532'/'#49324#50857#51088#44288#47532'.htm'
  ExplicitWidth = 907
  ExplicitHeight = 651
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 305
    Height = 547
    ExplicitLeft = 305
    ExplicitTop = 65
    ExplicitHeight = 543
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 891
    ExplicitWidth = 891
    inherited ButtonToolBar: TAdvToolBar
      Left = 355
      ExplicitLeft = 355
    end
    inherited ConditionToolBar: TAdvToolBar
      Width = 530
      ExplicitWidth = 530
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
      inherited ConditionToolBarComboBox: TcxComboBox
        Properties.Items.Strings = (
          #51204#52404
          #49324#50857#51473
          #49324#50857#51473#51648)
        Text = #49324#50857#51473
        Visible = True
        ExplicitWidth = 76
        Width = 76
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 406
        Visible = True
        ExplicitLeft = 406
      end
    end
  end
  inherited GridPanel: TPanel
    Width = 305
    Height = 547
    ExplicitWidth = 305
    ExplicitHeight = 547
    inherited Grid: TcxGrid
      Width = 299
      Height = 541
      ExplicitWidth = 299
      ExplicitHeight = 541
      inherited GridTableView: TcxGridTableView
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0'#44148
            Kind = skCount
            Column = GridTableViewUserCode
          end>
        OptionsView.Footer = True
        Styles.OnGetContentStyle = GridTableViewStylesGetContentStyle
        object GridTableViewUserCode: TcxGridColumn
          Caption = #49324#50896#48264#54840
          DataBinding.FieldName = 'CD_SAWON'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Width = 70
        end
        object GridTableViewUserName: TcxGridColumn
          Caption = #49324#50896#51060#47492
          DataBinding.FieldName = 'NM_SAWON'
          HeaderAlignmentHorz = taCenter
          Width = 150
        end
        object GridTableViewPower: TcxGridColumn
          Caption = #44396#48516
          DataBinding.FieldName = 'DS_SAWON'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
        end
        object GridTableViewUseYN: TcxGridColumn
          Tag = 99
          DataBinding.FieldName = 'YN_USE'
          Visible = False
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 311
    Width = 580
    Height = 547
    ExplicitLeft = 311
    ExplicitWidth = 580
    ExplicitHeight = 547
    object UserCodeLabel: TLabel
      Left = 20
      Top = 13
      Width = 53
      Height = 17
      Caption = #49324#50857#51088'ID'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object UserNameLabel: TLabel
      Left = 20
      Top = 43
      Width = 52
      Height = 17
      Caption = #49324#50857#51088#47749
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object EnterDateLabel: TLabel
      Left = 370
      Top = 223
      Width = 52
      Height = 17
      Caption = #51077#49324#51068#51088
      Transparent = True
    end
    object AddrLabel: TLabel
      Left = 20
      Top = 103
      Width = 52
      Height = 17
      Caption = #51452#12288#12288#49548
      Transparent = True
    end
    object TelNoLabel: TLabel
      Left = 370
      Top = 73
      Width = 52
      Height = 17
      Caption = #51088#53469#51204#54868
      Transparent = True
    end
    object UserGradeLabel: TLabel
      Left = 7
      Top = 223
      Width = 65
      Height = 17
      Caption = #49324#50857#51088#44536#47353
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object MobileNoLabel: TLabel
      Left = 19
      Top = 73
      Width = 52
      Height = 17
      Caption = #55092#45824#51204#54868
      Transparent = True
    end
    object UseYNLabel: TLabel
      Left = 20
      Top = 437
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
    object EMailLabel: TLabel
      Left = 20
      Top = 163
      Width = 47
      Height = 17
      Caption = 'E - Mail'
      Transparent = True
    end
    object RankLabel: TLabel
      Left = 370
      Top = 193
      Width = 52
      Height = 17
      Caption = #51649#12288#12288#44553
      Transparent = True
    end
    object RetireDateLabel: TLabel
      Left = 370
      Top = 253
      Width = 52
      Height = 17
      Caption = #53748#49324#51068#51088
      Transparent = True
    end
    object PasswordCommentLabel: TLabel
      Left = 207
      Top = 13
      Width = 265
      Height = 17
      Caption = #48708#48128#48264#54840#45716' '#49324#50896#48264#54840#50752' '#46041#51068#54616#44172' '#51200#51109#46121#45768#45796'.'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object WorkLabel: TLabel
      Left = 20
      Top = 283
      Width = 52
      Height = 17
      Caption = #45812#45817#50629#47924
      Transparent = True
    end
    object Label2: TLabel
      Left = 20
      Top = 194
      Width = 51
      Height = 17
      Caption = #49884'     '#44553
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object OfficeNoLabel: TLabel
      Left = 357
      Top = 43
      Width = 65
      Height = 17
      Caption = #49324#47924#49892#51204#54868
      Transparent = True
    end
    object WorkGroupBox: TcxGroupBox
      Left = 83
      Top = 276
      ParentFont = False
      Style.StyleController = EditStyleController
      TabOrder = 0
      Height = 149
      Width = 341
      object Task1CheckBox: TcxCheckBox
        Left = 10
        Top = 15
        Caption = ' '#51452#47928
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 0
      end
      object Task2CheckBox: TcxCheckBox
        Left = 10
        Top = 40
        Caption = ' '#51221#49328
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 1
      end
      object Task3CheckBox: TcxCheckBox
        Left = 10
        Top = 65
        Caption = ' '#54848#49436#48729
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 2
      end
      object Task4CheckBox: TcxCheckBox
        Left = 10
        Top = 90
        Caption = ' '#48176#45804
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 3
      end
      object Task5CheckBox: TcxCheckBox
        Left = 10
        Top = 115
        Caption = ' '#44228#49328#50896'&&'#54252#49828#47560#44048
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 4
      end
      object Task6CheckBox: TcxCheckBox
        Left = 170
        Top = 15
        Caption = ' '#54872#44221#49444#51221
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 5
      end
      object Task7CheckBox: TcxCheckBox
        Left = 170
        Top = 40
        Caption = ' '#46024#53685#50676#44592
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 6
      end
      object Task8CheckBox: TcxCheckBox
        Left = 170
        Top = 65
        Caption = ' '#51452#47928#52712#49548
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 7
      end
      object Task9CheckBox: TcxCheckBox
        Left = 170
        Top = 90
        Caption = ' '#54252#51064#53944#51201#47549'/'#49324#50857
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 8
      end
      object Task10CheckBox: TcxCheckBox
        Left = 170
        Top = 115
        Caption = ' '#44208#51228#52712#49548'/'#44208#51228#48320#44221
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 9
      end
    end
    object UserCodeEdit: TcxTextEdit
      Left = 80
      Top = 10
      ParentFont = False
      Properties.ImeMode = imDisable
      Properties.MaxLength = 6
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 1
      Width = 120
    end
    object UserNameEdit: TcxTextEdit
      Left = 80
      Top = 40
      ParentFont = False
      Properties.ImeMode = imSHanguel
      Properties.MaxLength = 20
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 2
      Width = 120
    end
    object MobileNoEdit: TcxTextEdit
      Left = 80
      Top = 70
      ParentFont = False
      Properties.ImeMode = imSAlpha
      Properties.MaxLength = 13
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 3
      Width = 120
    end
    object TelNoEdit: TcxTextEdit
      Left = 430
      Top = 70
      ParentFont = False
      Properties.ImeMode = imSAlpha
      Properties.MaxLength = 13
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 4
      Width = 120
    end
    object Addr1Edit: TcxTextEdit
      Left = 165
      Top = 100
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
      Top = 130
      ParentFont = False
      Properties.ImeMode = imSHanguel
      Properties.MaxLength = 80
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 6
      Width = 385
    end
    object EnterDateEdit: TcxDateEdit
      Left = 430
      Top = 220
      ParentFont = False
      Properties.DateButtons = [btnClear, btnNow]
      Properties.ImeMode = imSAlpha
      Properties.ImmediatePost = True
      Properties.UseNullString = True
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 7
      Width = 120
    end
    object UserGradeComboBox: TcxComboBox
      Left = 80
      Top = 220
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.DropDownListStyle = lsFixedList
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 8
      Width = 120
    end
    object UseYNComboBox: TcxComboBox
      Left = 80
      Top = 434
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #49324#50857
        #49324#50857' '#50504' '#54632)
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 9
      Text = #49324#50857
      Width = 120
    end
    object EMailEdit: TcxTextEdit
      Left = 80
      Top = 160
      ParentFont = False
      Properties.ImeMode = imSAlpha
      Properties.MaxLength = 40
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 10
      Width = 250
    end
    object RankEdit: TcxTextEdit
      Left = 430
      Top = 190
      ParentFont = False
      Properties.ImeMode = imSHanguel
      Properties.MaxLength = 10
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 11
      Width = 120
    end
    object ZipCodeEdit: TcxButtonEdit
      Left = 80
      Top = 100
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ClickKey = 112
      Properties.ImeMode = imSAlpha
      Properties.EditMask = '999\-999;1; '
      Properties.MaxLength = 0
      Properties.OnButtonClick = ZipCodeEditPropertiesButtonClick
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 12
      Text = '   -   '
      Width = 80
    end
    object PasswordChangeButton: TButton
      Left = 205
      Top = 9
      Width = 125
      Height = 27
      Caption = #48708#48128#48264#54840' '#52488#44592#54868
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 13
      TabStop = False
      OnClick = PasswordChangeButtonClick
    end
    object RetireDateEdit: TcxDateEdit
      Left = 430
      Top = 250
      ParentFont = False
      Properties.DateButtons = [btnClear, btnNow]
      Properties.ImeMode = imSAlpha
      Properties.ImmediatePost = True
      Properties.UseNullString = True
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 14
      Width = 120
    end
    object TimePayComboBox: TcxComboBox
      Left = 80
      Top = 190
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.DropDownListStyle = lsFixedList
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 15
      Width = 120
    end
    object OfficeNoEdit: TcxTextEdit
      Left = 430
      Top = 40
      ParentFont = False
      Properties.ImeMode = imSAlpha
      Properties.MaxLength = 13
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 16
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
  inherited AdvOfficeTabSetOfficeStyler: TAdvOfficeTabSetOfficeStyler
    Left = 576
    Top = 504
  end
end
