inherited HeadCodeForm: THeadCodeForm
  Left = 300
  Top = 120
  Caption = #54364#51456#44277#53685#53076#46300' '#46321#47197
  ClientHeight = 967
  ClientWidth = 969
  ExplicitWidth = 985
  ExplicitHeight = 1006
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 398
    Height = 902
    ExplicitLeft = 398
    ExplicitTop = 65
    ExplicitHeight = 575
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 969
    ExplicitWidth = 969
    inherited ButtonToolBar: TAdvToolBar
      Left = 432
      ExplicitLeft = 432
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
    Left = 148
    Height = 902
    ExplicitLeft = 148
    ExplicitHeight = 902
    inherited Grid: TcxGrid
      Height = 896
      ExplicitHeight = 896
      inherited GridTableView: TcxGridTableView
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0'#44148
            Kind = skCount
            Column = GridTableViewCode
          end>
        OptionsView.Footer = True
        Styles.OnGetContentStyle = GridTableViewStylesGetContentStyle
        object GridTableViewCode: TcxGridColumn
          Caption = #53076#46300
          DataBinding.FieldName = 'CD_CODE'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Width = 60
        end
        object GridTableViewName: TcxGridColumn
          Caption = #53076#46300#51060#47492
          DataBinding.FieldName = 'NM_CODE1'
          HeaderAlignmentHorz = taCenter
          Width = 160
        end
        object GridTableViewDsStatus: TcxGridColumn
          Tag = 99
          DataBinding.FieldName = 'DS_STATUS'
          Visible = False
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 404
    Width = 565
    Height = 902
    TabOrder = 1
    ExplicitLeft = 404
    ExplicitWidth = 565
    ExplicitHeight = 902
    object CodeLabel: TLabel
      Left = 20
      Top = 13
      Width = 52
      Height = 17
      Caption = #53076#12288#12288#46300
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object CodeEdit: TcxTextEdit
      Left = 80
      Top = 10
      ParentFont = False
      Properties.ImeMode = imDisable
      Properties.MaxLength = 3
      Properties.OnChange = EditPropertiesChange
      Properties.OnValidate = EditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 0
      Width = 120
    end
    object Notebook: TNotebook
      Left = 20
      Top = 41
      Width = 535
      Height = 600
      TabOrder = 1
      object TPage
        Left = 0
        Top = 0
        Caption = 'Local'
        object POSNoLabel: TLabel
          Left = 0
          Top = 4
          Width = 49
          Height = 17
          Caption = #51648' '#50669' '#47749
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object PosUseLabel: TLabel
          Left = 0
          Top = 35
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
        object LocalNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 50
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 181
        end
        object LocalUseComboBox: TcxComboBox
          Left = 60
          Top = 32
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #49324#50857
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Kitchen'
        object Label9: TLabel
          Left = 0
          Top = 3
          Width = 49
          Height = 17
          Caption = #51452' '#48169' '#47749
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label11: TLabel
          Left = 2
          Top = 34
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
        object KitchenNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 300
        end
        object KitchenUseComboBox: TcxComboBox
          Left = 60
          Top = 31
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #49324#50857
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'SaleZone'
        object GuestTypeNameLabel: TLabel
          Left = 0
          Top = 3
          Width = 49
          Height = 17
          Caption = #49345' '#44428' '#47749
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object GuestTypeUseLabel: TLabel
          Left = 0
          Top = 33
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
        object SaleZoneNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 300
        end
        object SaleZoneUseComboBox: TcxComboBox
          Left = 60
          Top = 30
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #49324#50857
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Member'
        object MemberTypeNameLabel: TLabel
          Left = 0
          Top = 3
          Width = 49
          Height = 17
          Caption = #44396' '#48516' '#47749
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object MemberTypeUseLabel: TLabel
          Left = 2
          Top = 467
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
        object Label31: TLabel
          Left = 0
          Top = 65
          Width = 49
          Height = 17
          Caption = #54624' '#51064' '#50984
          Transparent = True
        end
        object Label32: TLabel
          Left = 136
          Top = 66
          Width = 11
          Height = 17
          Caption = '%'
          Transparent = True
        end
        object Label28: TLabel
          Left = 0
          Top = 33
          Width = 52
          Height = 17
          Caption = #51201#50857#44396#48516
          Transparent = True
        end
        object PointAddTypeLabel: TLabel
          Left = 141
          Top = 36
          Width = 122
          Height = 17
          Caption = '('#54252#51064#53944' '#47700#45684#48324' '#51201#47549')'
          Transparent = True
          Visible = False
        end
        object MemberTypeNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 300
        end
        object MemberTypeUseComboBox: TcxComboBox
          Left = 60
          Top = 464
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 4
          Text = #49324#50857
          Width = 120
        end
        object MemberDcRateEdit: TcxCurrencyEdit
          Left = 60
          Top = 62
          EditValue = 0.000000000000000000
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = ',0'
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 2
          Width = 70
        end
        object PointGroupBox: TAdvGroupBox
          Left = 2
          Top = 101
          Width = 415
          Height = 224
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          Caption = ' '#54252#51064#53944' '#51201#47549#50984' '
          ParentCtl3D = True
          TabOrder = 3
          object Label35: TLabel
            Left = 30
            Top = 95
            Width = 365
            Height = 17
            Caption = #54788#44552#50689#49688#51613#44552#50529'                  '#50896' '#47560#45796' '#54252#51064#53944#47484'              '#51216
            Transparent = True
          end
          object Label34: TLabel
            Left = 43
            Top = 63
            Width = 352
            Height = 17
            Caption = #49888#50857#52852#46300#44552#50529'                  '#50896' '#47560#45796' '#54252#51064#53944#47484'              '#51216
            Transparent = True
          end
          object Label33: TLabel
            Left = 69
            Top = 32
            Width = 326
            Height = 17
            Caption = #54788#44552#44552#50529'                  '#50896' '#47560#45796' '#54252#51064#53944#47484'              '#51216
            Transparent = True
          end
          object Label1: TLabel
            Left = 56
            Top = 126
            Width = 339
            Height = 17
            Caption = #49345#54408#44428#44552#50529'                  '#50896' '#47560#45796' '#54252#51064#53944#47484'              '#51216
            Transparent = True
          end
          object Label4: TLabel
            Left = 69
            Top = 157
            Width = 326
            Height = 17
            Caption = #50808#49345#44552#50529'                  '#50896' '#47560#45796' '#54252#51064#53944#47484'              '#51216
            Transparent = True
          end
          object Label5: TLabel
            Left = 56
            Top = 188
            Width = 339
            Height = 17
            Caption = #54252#51064#53944#44552#50529'                  '#50896' '#47560#45796' '#54252#51064#53944#47484'              '#51216
            Transparent = True
          end
          object MemberCashAmountEdit: TcxCurrencyEdit
            Left = 129
            Top = 29
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0'
            Properties.UseDisplayFormatWhenEditing = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 0
            Width = 77
          end
          object MemberCashPointEdit: TcxSpinEdit
            Left = 325
            Top = 29
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 1000.000000000000000000
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 1
            Width = 54
          end
          object MemberCardPointEdit: TcxSpinEdit
            Left = 325
            Top = 60
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 1000.000000000000000000
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 2
            Width = 54
          end
          object MemberCardAmountEdit: TcxCurrencyEdit
            Left = 129
            Top = 60
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0'
            Properties.UseDisplayFormatWhenEditing = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 3
            Width = 77
          end
          object MemberCashRcpPointEdit: TcxSpinEdit
            Left = 325
            Top = 91
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 1000.000000000000000000
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 4
            Width = 54
          end
          object MemberCashRcpAmountEdit: TcxCurrencyEdit
            Left = 129
            Top = 92
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0'
            Properties.UseDisplayFormatWhenEditing = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 5
            Width = 77
          end
          object MemberGiftAmountEdit: TcxCurrencyEdit
            Left = 129
            Top = 123
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0'
            Properties.UseDisplayFormatWhenEditing = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 6
            Width = 77
          end
          object MemberGiftPointEdit: TcxSpinEdit
            Left = 325
            Top = 123
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 1000.000000000000000000
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 7
            Width = 54
          end
          object MemberTrustAmountEdit: TcxCurrencyEdit
            Left = 129
            Top = 154
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0'
            Properties.UseDisplayFormatWhenEditing = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 8
            Width = 77
          end
          object MemberTrustPointEdit: TcxSpinEdit
            Left = 325
            Top = 154
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 1000.000000000000000000
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 9
            Width = 54
          end
          object MemberPointAmountEdit: TcxCurrencyEdit
            Left = 129
            Top = 185
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0'
            Properties.UseDisplayFormatWhenEditing = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 10
            Width = 77
          end
          object MemberPointPointEdit: TcxSpinEdit
            Left = 325
            Top = 185
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 1000.000000000000000000
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 11
            Width = 54
          end
        end
        object MemberTypeComboBox: TcxComboBox
          Left = 60
          Top = 31
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #54624#51064
            #54252#51064#53944)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #54252#51064#53944
          Width = 72
        end
        object AdvGroupBox1: TAdvGroupBox
          Left = 0
          Top = 333
          Width = 417
          Height = 119
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          Caption = ' '#54924#50896#44396#48516' '#44592#51456' '
          ParentCtl3D = True
          TabOrder = 5
          object Label2: TLabel
            Left = 30
            Top = 29
            Width = 52
            Height = 17
            Hint = #45572#51201#54252#51064#53944
            Caption = #44396#47588#44552#50529
            Transparent = True
          end
          object Label47: TLabel
            Left = 32
            Top = 59
            Width = 52
            Height = 17
            Hint = #45572#51201#54252#51064#53944
            Caption = #44396#47588#44148#49688
            Transparent = True
          end
          object Label29: TLabel
            Left = 178
            Top = 60
            Width = 152
            Height = 17
            Hint = #45572#51201#54252#51064#53944
            Caption = #44148' '#51060#49345'( 0'#51008' '#44552#50529#47564' '#52404#53356')'
            Transparent = True
          end
          object Label50: TLabel
            Left = 178
            Top = 29
            Width = 165
            Height = 17
            Hint = #45572#51201#54252#51064#53944
            Caption = #50896' '#51060#49345' (0'#51008' '#44396#47588#44148#47564' '#52404#53356')'
            Transparent = True
          end
          object MemberTypeSaleAmtEdit: TcxCurrencyEdit
            Left = 90
            Top = 25
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0'
            Properties.UseDisplayFormatWhenEditing = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 0
            Width = 81
          end
          object MemberSaleCountEdit: TcxSpinEdit
            Tag = 99
            Left = 90
            Top = 55
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 100.000000000000000000
            Properties.OnChange = EditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 1
            Width = 50
          end
          object MemberClassNotChangeCheckBox: TcxCheckBox
            Left = 25
            Top = 86
            Caption = ' '#46321#44553#51312#51221' '#51228#50808
            TabOrder = 2
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'PointSave'
        object PointSaveNameLabel: TLabel
          Left = 0
          Top = 3
          Width = 52
          Height = 17
          Caption = #51201#47549#49324#50976
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object PointSaveLabel: TLabel
          Left = 0
          Top = 33
          Width = 52
          Height = 17
          Caption = #51201#47549#51216#49688
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object PointSaveUseLabel: TLabel
          Left = 0
          Top = 93
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
        object PointSavePointLabel: TLabel
          Left = 144
          Top = 33
          Width = 39
          Height = 17
          Caption = #54252#51064#53944
          Transparent = True
        end
        object PointSaveSaleLabel: TLabel
          Left = 0
          Top = 63
          Width = 52
          Height = 17
          Caption = #49345#54408#54032#47588
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object PointSaveNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 300
        end
        object PointSaveEdit: TcxCurrencyEdit
          Left = 60
          Top = 30
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Properties.ImeMode = imSAlpha
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseLeftAlignmentOnEditing = False
          Properties.UseThousandSeparator = True
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 80
        end
        object PointSaveUseComboBox: TcxComboBox
          Left = 60
          Top = 90
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 3
          Text = #49324#50857
          Width = 120
        end
        object PointSaveSaleComboBox: TcxComboBox
          Left = 60
          Top = 60
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #44592#53440' '#49324#50976
            #49345#54408' '#54032#47588)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 2
          Text = #44592#53440' '#49324#50976
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'PointUse'
        object PointUseNameLabel: TLabel
          Left = 0
          Top = 3
          Width = 52
          Height = 17
          Caption = #49324#50857#49324#50976
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object PointUseLabel: TLabel
          Left = 0
          Top = 33
          Width = 52
          Height = 17
          Caption = #52264#44048#51216#49688
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object PointUsePointLabel: TLabel
          Left = 144
          Top = 33
          Width = 39
          Height = 17
          Caption = #54252#51064#53944
          Transparent = True
        end
        object PointUseUseLabel: TLabel
          Left = 0
          Top = 93
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
        object PointUseSaleLabel: TLabel
          Left = 0
          Top = 63
          Width = 52
          Height = 17
          Caption = #49345#54408#44396#51077
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object PointUseNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 300
        end
        object PointUseEdit: TcxCurrencyEdit
          Left = 60
          Top = 30
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Properties.ImeMode = imSAlpha
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseLeftAlignmentOnEditing = False
          Properties.UseThousandSeparator = True
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 80
        end
        object PointUseUseComboBox: TcxComboBox
          Left = 60
          Top = 90
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 3
          Text = #49324#50857
          Width = 120
        end
        object PointUseSaleComboBox: TcxComboBox
          Left = 60
          Top = 60
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #44592#53440' '#49324#50976
            #49345#54408' '#44396#51077)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 2
          Text = #44592#53440' '#49324#50976
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'TimeZone'
        object TimeZoneLabel: TLabel
          Left = 2
          Top = 3
          Width = 49
          Height = 17
          Caption = #49884' '#44036' '#45824
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object TimeZoneUseLabel: TLabel
          Left = 0
          Top = 33
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
        object TimeZoneEdit: TcxMaskEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.EditMask = '00:00 ~ 00:00;1; '
          Properties.MaxLength = 0
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Text = '  :   ~   :  '
          Width = 120
        end
        object TimeZoneUseComboBox: TcxComboBox
          Left = 60
          Top = 30
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #49324#50857
          Width = 120
        end
        object TimeZoneAutoGroupBox: TcxGroupBox
          Left = 10
          Top = 77
          Caption = ' '#51088#46041' '#49373#49457' '
          ParentFont = False
          Style.StyleController = EditStyleController
          TabOrder = 2
          Height = 101
          Width = 409
          object TimeZoneAutoLabel: TLabel
            Left = 115
            Top = 31
            Width = 229
            Height = 17
            Caption = #48512#53552'            '#48516' '#44036#44201#51004#47196' '#49373#49457#54633#45768#45796'.'
            Transparent = True
          end
          object TimeZoneAutoStartTimeEdit: TcxTimeEdit
            Left = 20
            Top = 28
            ParentFont = False
            Properties.TimeFormat = tfHourMin
            Properties.Use24HourFormat = False
            Style.StyleController = EditStyleController
            TabOrder = 0
            Width = 90
          end
          object TimeZoneAutoIntervalEdit: TcxSpinEdit
            Tag = 99
            Left = 150
            Top = 28
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.Increment = 30.000000000000000000
            Properties.MaxValue = 360.000000000000000000
            Properties.MinValue = 30.000000000000000000
            Style.StyleController = EditStyleController
            TabOrder = 1
            Value = 60
            Width = 50
          end
          object TimeZoneAutoButton: TAdvSmoothButton
            Left = 296
            Top = 59
            Width = 87
            Height = 30
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = HANGEUL_CHARSET
            Appearance.Font.Color = clWhite
            Appearance.Font.Height = -15
            Appearance.Font.Name = #47569#51008' '#44256#46357
            Appearance.Font.Style = []
            Appearance.ShiftDown = 0
            Appearance.FocusColor = clWhite
            Appearance.SimpleLayout = True
            Appearance.Rounding = 5
            Status.Caption = '0'
            Status.Appearance.Fill.Color = clWhite
            Status.Appearance.Fill.ColorMirror = clNone
            Status.Appearance.Fill.ColorMirrorTo = clNone
            Status.Appearance.Fill.GradientType = gtSolid
            Status.Appearance.Fill.GradientMirrorType = gtSolid
            Status.Appearance.Fill.BorderColor = clGray
            Status.Appearance.Fill.Rounding = 11
            Status.Appearance.Fill.ShadowOffset = 0
            Status.Appearance.Fill.Glow = gmNone
            Status.Appearance.Font.Charset = DEFAULT_CHARSET
            Status.Appearance.Font.Color = clBlack
            Status.Appearance.Font.Height = -13
            Status.Appearance.Font.Name = #47569#51008' '#44256#46357
            Status.Appearance.Font.Style = []
            Caption = #51088#46041#49373#49457
            Color = 14117632
            ParentFont = False
            Shadow = True
            DisabledColor = clWhite
            TabOrder = 2
            ShowFocus = False
            HorizontalSpacing = 0
            VerticalSpacing = 0
            Version = '2.2.2.0'
            OnClick = TimeZoneAutoButtonClick
            TMSStyle = 8
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'KitchenMemo'
        ExplicitWidth = 0
        ExplicitHeight = 0
        object KitchenMemoNameLabel: TLabel
          Left = 0
          Top = 3
          Width = 51
          Height = 17
          Caption = #45236'     '#50857
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label54: TLabel
          Left = 0
          Top = 33
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
        object KitchenMemoNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 300
        end
        object KitchenMemoUseComboBox: TcxComboBox
          Left = 60
          Top = 30
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #49324#50857
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'OrderLimit'
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label6: TLabel
          Left = 3
          Top = 5
          Width = 49
          Height = 17
          Caption = #51228' '#50557' '#47749
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label7: TLabel
          Left = 8
          Top = 208
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
        object OrderLimitNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 213
        end
        object OrderLimitUseComboBox: TcxComboBox
          Left = 68
          Top = 205
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 3
          Text = #49324#50857
          Width = 120
        end
        object WeeklyGroupBox: TcxGroupBox
          Left = 30
          Top = 42
          Caption = ' '#44032#45733#50836#51068' '
          ParentFont = False
          Style.StyleController = EditStyleController
          TabOrder = 1
          Height = 66
          Width = 387
          object MonCheckBox: TcxCheckBox
            Left = 13
            Top = 23
            Caption = #50900
            ParentFont = False
            Properties.OnChange = EditPropertiesChange
            Style.Font.Charset = HANGEUL_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = #47569#51008' '#44256#46357
            Style.Font.Style = []
            Style.StyleController = EditStyleController
            Style.IsFontAssigned = True
            TabOrder = 0
          end
          object TueCheckBox: TcxCheckBox
            Left = 54
            Top = 23
            Caption = #54868
            ParentFont = False
            Properties.OnChange = EditPropertiesChange
            Style.Font.Charset = HANGEUL_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = #47569#51008' '#44256#46357
            Style.Font.Style = []
            Style.StyleController = EditStyleController
            Style.IsFontAssigned = True
            TabOrder = 1
          end
          object WedCheckBox: TcxCheckBox
            Left = 95
            Top = 23
            Caption = #49688
            ParentFont = False
            Properties.OnChange = EditPropertiesChange
            Style.Font.Charset = HANGEUL_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = #47569#51008' '#44256#46357
            Style.Font.Style = []
            Style.StyleController = EditStyleController
            Style.IsFontAssigned = True
            TabOrder = 2
          end
          object ThuCheckBox: TcxCheckBox
            Left = 136
            Top = 23
            Caption = #47785
            ParentFont = False
            Properties.OnChange = EditPropertiesChange
            Style.Font.Charset = HANGEUL_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = #47569#51008' '#44256#46357
            Style.Font.Style = []
            Style.StyleController = EditStyleController
            Style.IsFontAssigned = True
            TabOrder = 3
          end
          object FriCheckBox: TcxCheckBox
            Left = 177
            Top = 23
            Caption = #44552
            ParentFont = False
            Properties.OnChange = EditPropertiesChange
            Style.Font.Charset = HANGEUL_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = #47569#51008' '#44256#46357
            Style.Font.Style = []
            Style.StyleController = EditStyleController
            Style.IsFontAssigned = True
            TabOrder = 4
          end
          object SatCheckBox: TcxCheckBox
            Left = 218
            Top = 23
            Caption = #53664
            ParentFont = False
            Properties.OnChange = EditPropertiesChange
            Style.Font.Charset = HANGEUL_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = #47569#51008' '#44256#46357
            Style.Font.Style = []
            Style.StyleController = EditStyleController
            Style.TextColor = clBlue
            Style.IsFontAssigned = True
            TabOrder = 5
          end
          object SunCheckBox: TcxCheckBox
            Left = 260
            Top = 23
            Caption = #51068
            ParentFont = False
            Properties.OnChange = EditPropertiesChange
            Style.Font.Charset = HANGEUL_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = #47569#51008' '#44256#46357
            Style.Font.Style = []
            Style.StyleController = EditStyleController
            Style.TextColor = clRed
            Style.IsFontAssigned = True
            TabOrder = 6
          end
          object SelectAllButton: TAdvSmoothButton
            Left = 308
            Top = 23
            Width = 69
            Height = 30
            Appearance.PictureAlignment = taCenter
            Appearance.Font.Charset = HANGEUL_CHARSET
            Appearance.Font.Color = clWhite
            Appearance.Font.Height = -15
            Appearance.Font.Name = #47569#51008' '#44256#46357
            Appearance.Font.Style = []
            Appearance.ShiftDown = 0
            Appearance.FocusColor = clWhite
            Appearance.SimpleLayout = True
            Appearance.Rounding = 5
            Status.Caption = '0'
            Status.Appearance.Fill.Color = clWhite
            Status.Appearance.Fill.ColorMirror = clNone
            Status.Appearance.Fill.ColorMirrorTo = clNone
            Status.Appearance.Fill.GradientType = gtSolid
            Status.Appearance.Fill.GradientMirrorType = gtSolid
            Status.Appearance.Fill.BorderColor = clGray
            Status.Appearance.Fill.Rounding = 11
            Status.Appearance.Fill.ShadowOffset = 0
            Status.Appearance.Fill.Glow = gmNone
            Status.Appearance.Font.Charset = DEFAULT_CHARSET
            Status.Appearance.Font.Color = clBlack
            Status.Appearance.Font.Height = -13
            Status.Appearance.Font.Name = #47569#51008' '#44256#46357
            Status.Appearance.Font.Style = []
            Caption = #51204#52404
            Color = 14117632
            ParentFont = False
            Shadow = True
            DisabledColor = clWhite
            TabOrder = 7
            ShowFocus = False
            HorizontalSpacing = 0
            VerticalSpacing = 0
            Version = '2.2.2.0'
            OnClick = SelectAllButtonClick
            TMSStyle = 8
          end
        end
        object cxGroupBox1: TcxGroupBox
          Left = 30
          Top = 121
          Caption = ' '#48156#51452#49884#44036
          ParentFont = False
          Style.StyleController = EditStyleController
          TabOrder = 2
          Height = 68
          Width = 387
          object DCTimeLabel: TLabel
            Left = 155
            Top = 31
            Width = 9
            Height = 17
            Caption = '~'
            Transparent = True
          end
          object OrderTimeFromEdit: TcxTimeEdit
            Left = 43
            Top = 27
            ParentFont = False
            Properties.TimeFormat = tfHourMin
            Properties.Use24HourFormat = False
            Properties.OnChange = EditPropertiesChange
            Style.Font.Charset = HANGEUL_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = #47569#51008' '#44256#46357
            Style.Font.Style = []
            Style.StyleController = EditStyleController
            Style.IsFontAssigned = True
            TabOrder = 0
            Width = 96
          end
          object OrderTimeToEdit: TcxTimeEdit
            Left = 182
            Top = 28
            ParentFont = False
            Properties.TimeFormat = tfHourMin
            Properties.Use24HourFormat = False
            Properties.OnChange = EditPropertiesChange
            Style.Font.Charset = HANGEUL_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = #47569#51008' '#44256#46357
            Style.Font.Style = []
            Style.StyleController = EditStyleController
            Style.IsFontAssigned = True
            TabOrder = 1
            Width = 98
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'GoodsClass'
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label3: TLabel
          Left = 2
          Top = 5
          Width = 49
          Height = 17
          Caption = #48516' '#47448' '#47749
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label8: TLabel
          Left = 0
          Top = 36
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
        object GoodsClassNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 213
        end
        object GoodsClassUseComboBox: TcxComboBox
          Left = 60
          Top = 33
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #49324#50857
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Keep'
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label10: TLabel
          Left = 0
          Top = 6
          Width = 52
          Height = 17
          Caption = #48372#44288#48169#48277
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label12: TLabel
          Left = 0
          Top = 35
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
        object KeepNameEdit: TcxTextEdit
          Left = 60
          Top = 0
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 80
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 213
        end
        object KeepUseComboBox: TcxComboBox
          Left = 60
          Top = 32
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #49324#50857
          Width = 120
        end
      end
    end
  end
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 21
  end
  object MenuScrollBox: TScrollBox [5]
    AlignWithMargins = True
    Left = 3
    Top = 68
    Width = 142
    Height = 896
    HorzScrollBar.Visible = False
    Align = alLeft
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object OrderLimitButton: TAdvSmoothToggleButton
      Tag = 6
      Left = 0
      Top = 324
      Width = 142
      Height = 36
      Hint = 'OrderLimit'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 16752190
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 16752190
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #48156#51452#51228#50557
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 0
      OnClick = StoreLocalButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton2: TAdvSmoothToggleButton
      Tag = 4
      Left = 0
      Top = 288
      Width = 142
      Height = 36
      Hint = 'GoodsClass'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 16752190
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 16752190
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #49345#54408#48516#47448
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 1
      OnClick = StoreLocalButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton3: TAdvSmoothToggleButton
      Tag = 16
      Left = 0
      Top = 252
      Width = 142
      Height = 36
      Hint = 'KitchenMemo'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 16752190
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 16752190
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #51452#48169#47700#47784
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 2
      OnClick = StoreLocalButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton4: TAdvSmoothToggleButton
      Tag = 15
      Left = 0
      Top = 216
      Width = 142
      Height = 36
      Hint = 'TimeZone'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 16752190
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 16752190
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #49884#44036#45824#53076#46300
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 3
      OnClick = StoreLocalButtonClick
      TMSStyle = 0
    end
    object KitchenButton: TAdvSmoothToggleButton
      Tag = 2
      Left = 0
      Top = 180
      Width = 142
      Height = 36
      Hint = 'Kitchen'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 16752190
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 16752190
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #51452#48169#54532#47536#53552
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 4
      OnClick = StoreLocalButtonClick
      TMSStyle = 0
    end
    object PointUseButton: TAdvSmoothToggleButton
      Tag = 13
      Left = 0
      Top = 144
      Width = 142
      Height = 36
      Hint = 'PointUse'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 16752190
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 16752190
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #54252#51064#53944#49324#50857
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 5
      OnClick = StoreLocalButtonClick
      TMSStyle = 0
    end
    object PointAddButton: TAdvSmoothToggleButton
      Tag = 12
      Left = 0
      Top = 108
      Width = 142
      Height = 36
      Hint = 'PointSave'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 16752190
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 16752190
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #54252#51064#53944#51201#47549
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 6
      OnClick = StoreLocalButtonClick
      TMSStyle = 0
    end
    object MemberTypeButton: TAdvSmoothToggleButton
      Tag = 5
      Left = 0
      Top = 72
      Width = 142
      Height = 36
      Hint = 'Member'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 16752190
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 16752190
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #54924#50896#44396#48516
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 7
      OnClick = StoreLocalButtonClick
      TMSStyle = 0
    end
    object AdvSmoothToggleButton9: TAdvSmoothToggleButton
      Tag = 3
      Left = 0
      Top = 36
      Width = 142
      Height = 36
      Hint = 'SaleZone'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 16752190
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 16752190
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #47588#51109#49345#44428
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 8
      OnClick = StoreLocalButtonClick
      TMSStyle = 0
    end
    object StoreLocalButton: TAdvSmoothToggleButton
      Tag = 1
      Left = 0
      Top = 0
      Width = 142
      Height = 36
      Hint = 'Local'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 16752190
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 16752190
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      Down = True
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #47588#51109#51648#50669
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 9
      OnClick = StoreLocalButtonClick
      TMSStyle = 0
    end
    object KeepButton: TAdvSmoothToggleButton
      Tag = 7
      Left = 0
      Top = 360
      Width = 142
      Height = 36
      Hint = 'Keep'
      RepeatInterval = 0
      FontColorDisabled = clWhite
      Color = 16752190
      ColorDisabled = 16752190
      ColorDown = clSilver
      BorderColor = clWhite
      BorderInnerColor = 16752190
      BevelWidth = 0
      BevelColorDisabled = 8404992
      DropDownArrowColor = clWhite
      AutoToggle = False
      PictureDown.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000012A49444154388DC59331
        2F835114869F235DB4CAC266B131B7BB5FC082B058B19A440C1289D182C52611
        89444AA4898148FD00E6FE00461326098FA15F9B6F28D57E4DBCD37DCFCD79CE
        7B737342BD02C601E94D79603B22CE01501F7B0435FBCBEA51D3E78041B59481
        39993639600C58C9001C055E5A4E7DC800432DA59F3C9005D64EB9D4A429E004
        D84D4A5B1D7AEB11B1FC233022EA40397577F95F093F81AF56B50F9F32A08EA8
        D1AF844340059856773225548BEABDBAA77EA86FBD265C069E812AB01F1117AA
        C0444F09D5827AA72E257E2E493ADC35B00D6C5EADA945487659EDB4CBAF1171
        963455818388A8A80BC01A301311EFD058BDCD3F266BC20E13D822B00ACC3661
        5D49DD508F93F3927AAB16BA06A580351B3A556FD47C1658A84FEAB5BAFE1BEC
        1BA968E7016785BFC00000000049454E44AE426082}
      Appearance.GlowPercentage = 20
      Appearance.PictureAlignment = taCenter
      Appearance.PictureStretch = True
      Appearance.Font.Charset = DEFAULT_CHARSET
      Appearance.Font.Color = clWhite
      Appearance.Font.Height = -13
      Appearance.Font.Name = #47569#51008' '#44256#46357
      Appearance.Font.Style = []
      Appearance.FocusColor = clWhite
      Appearance.SimpleLayout = True
      Appearance.ImageIndex = 0
      Appearance.Rounding = 3
      Caption = #48372#44288#48169#48277
      Version = '1.7.2.2'
      Status.Caption = '0'
      Status.Appearance.Fill.Color = clRed
      Status.Appearance.Fill.ColorMirror = clNone
      Status.Appearance.Fill.ColorMirrorTo = clNone
      Status.Appearance.Fill.GradientType = gtSolid
      Status.Appearance.Fill.GradientMirrorType = gtSolid
      Status.Appearance.Fill.BorderColor = clGray
      Status.Appearance.Fill.Rounding = 8
      Status.Appearance.Fill.ShadowOffset = 0
      Status.Appearance.Fill.Glow = gmNone
      Status.Appearance.Font.Charset = DEFAULT_CHARSET
      Status.Appearance.Font.Color = clWhite
      Status.Appearance.Font.Height = -11
      Status.Appearance.Font.Name = 'Tahoma'
      Status.Appearance.Font.Style = []
      GroupIndex = 1
      ParentFont = False
      Align = alTop
      TabOrder = 10
      OnClick = StoreLocalButtonClick
      TMSStyle = 0
    end
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  object OpenPictureDialog: TOpenPictureDialog
    Filter = 'JPG|*.JPG'
    Left = 232
    Top = 32
  end
end
