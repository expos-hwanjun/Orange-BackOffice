inherited SystemStoreForm: TSystemStoreForm
  Left = 300
  Top = 120
  Caption = #47588#51109' '#46321#47197
  ClientHeight = 651
  ClientWidth = 964
  ExplicitWidth = 980
  ExplicitHeight = 689
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Height = 586
    ExplicitTop = 65
    ExplicitHeight = 627
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 964
    ExplicitWidth = 964
    inherited ButtonToolBar: TAdvToolBar
      Left = 432
      ExplicitLeft = 432
      inherited ButtonToolBarNewButton: TAdvGlowButton
        Visible = False
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
        AnchorX = 298
        AnchorY = 16
      end
    end
  end
  inherited GridPanel: TPanel
    Height = 586
    ExplicitHeight = 586
    inherited Grid: TcxGrid
      Height = 580
      ExplicitHeight = 580
      inherited GridTableView: TcxGridTableView
        DataController.Data = {
          470000000F00000044617461436F6E74726F6C6C657231020000001200000054
          6378537472696E6756616C75655479706512000000546378537472696E675661
          6C75655479706500000000}
        object GridTableViewStoreCode: TcxGridColumn
          Caption = #47588#51109#53076#46300
          DataBinding.FieldName = 'CD_STORE'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 70
        end
        object GridTableViewStoreName: TcxGridColumn
          Caption = #47588#51109#51060#47492
          DataBinding.FieldName = 'NM_STORE'
          PropertiesClassName = 'TcxLabelProperties'
          HeaderAlignmentHorz = taCenter
          Width = 150
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Width = 708
    Height = 586
    ExplicitWidth = 708
    ExplicitHeight = 586
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
      Top = 73
      Width = 52
      Height = 17
      Caption = #45824#54364#51088#47749
      Transparent = True
    end
    object IDNoLabel: TLabel
      Left = 8
      Top = 103
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
      Top = 163
      Width = 52
      Height = 17
      Caption = #51333#12288#12288#47785
      Transparent = True
    end
    object UptaeLabel: TLabel
      Left = 20
      Top = 133
      Width = 52
      Height = 17
      Caption = #50629#12288#12288#53468
      Transparent = True
    end
    object TelNoLabel: TLabel
      Left = 20
      Top = 193
      Width = 52
      Height = 17
      Caption = #51204#54868#48264#54840
      Transparent = True
    end
    object FaxNoLabel: TLabel
      Left = 371
      Top = 193
      Width = 52
      Height = 17
      Caption = #54057#49828#48264#54840
      Transparent = True
    end
    object AddrLabel: TLabel
      Left = 20
      Top = 223
      Width = 52
      Height = 17
      Caption = #51452#12288#12288#49548
      Transparent = True
    end
    object SubIDNoLabel: TLabel
      Left = 216
      Top = 103
      Width = 52
      Height = 17
      Caption = #51333#49324#50629#51088
      Transparent = True
    end
    object CompanyCodeEdit: TcxTextEdit
      Left = 80
      Top = 10
      TabStop = False
      ImeMode = imSAlpha
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.ImeMode = imSAlpha
      Properties.MaxLength = 6
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Properties.OnChange = EditPropertiesChange
      Style.Color = 14737632
      Style.StyleController = EditStyleController
      TabOrder = 0
      Width = 70
    end
    object CompanyNameEdit: TcxTextEdit
      Left = 80
      Top = 40
      ImeMode = imSHanguel
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
      Properties.ImeMode = imSHanguel
      Properties.MaxLength = 30
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 1
      Width = 250
    end
    object CEONameEdit: TcxTextEdit
      Left = 80
      Top = 70
      ImeMode = imSHanguel
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
      Properties.ImeMode = imSHanguel
      Properties.MaxLength = 20
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 2
      Width = 120
    end
    object IDNoEdit: TcxMaskEdit
      Left = 80
      Top = 100
      ParentFont = False
      Properties.ImeMode = imSAlpha
      Properties.EditMask = '999\-99\-99999;1; '
      Properties.MaxLength = 0
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 3
      Text = '   -  -     '
      ImeMode = imSAlpha
      Width = 120
    end
    object JongmokEdit: TcxTextEdit
      Left = 80
      Top = 160
      ImeMode = imSHanguel
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
      Properties.ImeMode = imSHanguel
      Properties.MaxLength = 30
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 6
      Width = 250
    end
    object UptaeEdit: TcxTextEdit
      Left = 80
      Top = 130
      ImeMode = imSHanguel
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
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
      Top = 190
      ImeMode = imSAlpha
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
      Properties.ImeMode = imSAlpha
      Properties.MaxLength = 13
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 7
      OnExit = EditExit
      Width = 120
    end
    object FaxNoEdit: TcxTextEdit
      Left = 430
      Top = 190
      ImeMode = imSAlpha
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
      Properties.ImeMode = imSAlpha
      Properties.MaxLength = 13
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 8
      OnExit = EditExit
      Width = 120
    end
    object ZipCodeEdit: TcxButtonEdit
      Left = 80
      Top = 220
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
      TabOrder = 9
      Text = '   -   '
      ImeMode = imSAlpha
      Width = 80
    end
    object Addr1Edit: TcxTextEdit
      Left = 165
      Top = 220
      TabStop = False
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
      Properties.MaxLength = 80
      Properties.ReadOnly = True
      Style.Color = 14737632
      Style.StyleController = EditStyleController
      StyleFocused.Color = 14737632
      TabOrder = 10
      Width = 385
    end
    object Addr2Edit: TcxTextEdit
      Left = 165
      Top = 250
      ImeMode = imSHanguel
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
      Properties.ImeMode = imSHanguel
      Properties.MaxLength = 80
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 11
      Width = 385
    end
    object OKCashbagGroupBox: TcxGroupBox
      Left = 20
      Top = 400
      Caption = ' OK'#52880#49772#48177' '
      ParentFont = False
      Style.StyleController = EditStyleController
      TabOrder = 13
      Height = 55
      Width = 530
      object OkCashbagJoinNoLabel: TLabel
        Left = 20
        Top = 23
        Width = 65
        Height = 17
        Caption = #44032#47609#51216#48264#54840
        Transparent = True
      end
      object OkCashbagPasswordLabel: TLabel
        Left = 315
        Top = 23
        Width = 52
        Height = 17
        Caption = #48708#48128#48264#54840
        Transparent = True
      end
      object OkCashbagJoinNoEdit: TcxTextEdit
        Left = 95
        Top = 20
        Enabled = False
        ImeMode = imSAlpha
        ParentFont = False
        Properties.ImeMode = imSAlpha
        Properties.MaxLength = 8
        Properties.OnChange = EditPropertiesChange
        Properties.OnValidate = EditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 0
        Width = 120
      end
      object OkCashbagPasswordEdit: TcxTextEdit
        Left = 390
        Top = 20
        Enabled = False
        ImeMode = imSAlpha
        ParentFont = False
        Properties.ImeMode = imSAlpha
        Properties.MaxLength = 16
        Properties.OnChange = EditPropertiesChange
        Properties.OnValidate = EditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 1
        Width = 120
      end
    end
    object InvoiceGroupBox: TcxGroupBox
      Left = 20
      Top = 279
      Caption = ' '#51204#51088#49464#44552#44228#49328#49436' '
      ParentFont = False
      Style.StyleController = EditStyleController
      TabOrder = 12
      Height = 115
      Width = 530
      object MobileNoLabel: TLabel
        Left = 20
        Top = 23
        Width = 52
        Height = 17
        Caption = #55092#45824#51204#54868
        Transparent = True
      end
      object EMailLabel: TLabel
        Left = 20
        Top = 53
        Width = 36
        Height = 17
        Caption = 'E-mail'
        Transparent = True
      end
      object MobileNoCommentLabel: TLabel
        Left = 220
        Top = 23
        Width = 148
        Height = 17
        Caption = '('#49464#44552#44228#49328#49436' '#48156#49569' '#54869#51064#50857')'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object InvoiceItemLabel: TLabel
        Left = 20
        Top = 83
        Width = 65
        Height = 17
        Caption = #45824#54364#54408#47785#47749
        Transparent = True
      end
      object MobileNoEdit: TcxTextEdit
        Left = 95
        Top = 20
        ImeMode = imSAlpha
        ParentFont = False
        Properties.ImeMode = imSAlpha
        Properties.MaxLength = 13
        Properties.OnChange = EditPropertiesChange
        Properties.OnValidate = EditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 0
        OnExit = EditExit
        Width = 120
      end
      object EMailEdit: TcxTextEdit
        Left = 95
        Top = 50
        ImeMode = imSAlpha
        ParentFont = False
        Properties.ImeMode = imSAlpha
        Properties.MaxLength = 50
        Properties.OnChange = EditPropertiesChange
        Properties.OnValidate = EditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 1
        Width = 250
      end
      object InvoiceItemEdit: TcxTextEdit
        Left = 95
        Top = 80
        ImeMode = imSAlpha
        ParentFont = False
        Properties.ImeMode = imSAlpha
        Properties.MaxLength = 50
        Properties.OnChange = EditPropertiesChange
        Properties.OnValidate = EditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 2
        Width = 250
      end
    end
    object SubIDNoEdit: TcxTextEdit
      Left = 271
      Top = 99
      ImeMode = imSAlpha
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
      Properties.ImeMode = imSAlpha
      Properties.MaxLength = 4
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 4
      Width = 59
    end
    object PictureImage: TcxImage
      Left = 412
      Top = 40
      TabStop = False
      Properties.Caption = #46020#51109' '#50630#51020
      Properties.GraphicClassName = 'TJPEGImage'
      Properties.PopupMenuLayout.MenuItems = []
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      Style.TextColor = clGrayText
      TabOrder = 15
      Height = 109
      Width = 125
    end
    object PictureLoadButton: TButton
      Left = 411
      Top = 159
      Width = 79
      Height = 25
      Caption = #48520#47084#50724#44592
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 16
      TabStop = False
      OnClick = PictureLoadButtonClick
    end
    object PictureDeleteButton: TButton
      Left = 492
      Top = 159
      Width = 50
      Height = 25
      Caption = #49325#51228
      DoubleBuffered = True
      Enabled = False
      ParentDoubleBuffered = False
      TabOrder = 17
      TabStop = False
      OnClick = PictureDeleteButtonClick
    end
    object StoreInfoButton: TButton
      Left = 156
      Top = 10
      Width = 141
      Height = 25
      Caption = #47588#51109#51221#48372' '#44032#51256#50724#44592
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 18
      TabStop = False
      OnClick = StoreInfoButtonClick
    end
    object OrderGroupBox: TcxGroupBox
      Left = 20
      Top = 461
      Caption = ' '#49688#48156#51452'  '
      ParentFont = False
      Style.StyleController = EditStyleController
      TabOrder = 14
      Height = 60
      Width = 530
      object Label1: TLabel
        Left = 20
        Top = 26
        Width = 52
        Height = 17
        Caption = #47588#51109#44396#48516
        Transparent = True
      end
      object Label2: TLabel
        Left = 261
        Top = 26
        Width = 52
        Height = 17
        Caption = #47932#47448#47588#51109
        Transparent = True
      end
      object StoreTypeComboBox: TcxComboBox
        Left = 78
        Top = 22
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.DropDownListStyle = lsFixedList
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 0
        Height = 25
        Width = 82
      end
      object OrderCheckBox: TcxCheckBox
        Left = 164
        Top = 22
        Caption = #49688#48156#51452#49324#50857
        Properties.OnChange = EditPropertiesChange
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 1
        Width = 89
      end
      object StoreComboBox: TcxComboBox
        Left = 317
        Top = 23
        Hint = 'CD_POINT'
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 2
        Width = 205
      end
    end
  end
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 25
  end
  inherited EditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  object PictureLoadDialog: TOpenPictureDialog
    Filter = #44536#47548' '#54028#51068'(*.jpg, *.bmp)|*.jpg;*.jpeg;*.bmp'
    Left = 803
    Top = 224
  end
end
