inherited MemberTypeForm: TMemberTypeForm
  Left = 300
  Top = 120
  Caption = #54924#50896' '#54252#51064#53944'/'#54624#51064#50984' '#44288#47532
  ClientHeight = 602
  ClientWidth = 964
  HelpFile = #54980#48169'/'#54924#50896#44288#47532'/'#54924#50896#54252#51064#53944'__'#54624#51064#50984#51312#54924'.htm'
  ExplicitWidth = 980
  ExplicitHeight = 640
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 245
    Height = 537
    ExplicitLeft = 245
    ExplicitTop = 65
    ExplicitHeight = 544
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 964
    ExplicitWidth = 964
    inherited ButtonToolBar: TAdvToolBar
      Left = 432
      ExplicitLeft = 432
      inherited ButtonToolBarDeleteButton: TAdvGlowButton
        Visible = False
      end
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
    Width = 245
    Height = 537
    ExplicitWidth = 245
    ExplicitHeight = 537
    inherited Grid: TcxGrid
      Width = 239
      Height = 531
      ExplicitWidth = 239
      ExplicitHeight = 531
      inherited GridTableView: TcxGridTableView
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0'#44148
            Kind = skCount
            Column = GridTableViewCode
          end>
        DataController.Data = {
          470000000F00000044617461436F6E74726F6C6C657231020000001200000054
          6378537472696E6756616C75655479706512000000546378537472696E675661
          6C75655479706500000000}
        OptionsView.Footer = True
        object GridTableViewCode: TcxGridColumn
          Caption = #54924#50896#44396#48516
          DataBinding.FieldName = 'CD_CODE'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Width = 65
        end
        object GridTableViewName: TcxGridColumn
          Caption = #54924#50896#44396#48516#51060#47492
          DataBinding.FieldName = 'NM_CODE1'
          HeaderAlignmentHorz = taCenter
          Width = 150
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 251
    Width = 713
    Height = 537
    ExplicitLeft = 251
    ExplicitWidth = 713
    ExplicitHeight = 537
    object TopPanel: TPanel
      Left = 0
      Top = 0
      Width = 713
      Height = 95
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object MemberTypeNameLabel: TLabel
        Left = 20
        Top = 13
        Width = 88
        Height = 17
        Caption = #54924#50896' '#44396#48516' '#51060#47492
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object PointDCTypeLabel: TLabel
        Left = 20
        Top = 43
        Width = 102
        Height = 17
        Caption = #54252#51064#53944'/'#54624#51064' '#51201#50857
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object CommentLabel: TLabel
        Left = 20
        Top = 70
        Width = 317
        Height = 17
        Caption = #54924#50896#44396#48516#51008' ['#44277#53685#53076#46300' '#44288#47532'] '#54532#47196#44536#47016#50640#49436' '#46321#47197#54633#45768#45796'.'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object MemberTypeNameEdit: TcxTextEdit
        Left = 145
        Top = 10
        TabStop = False
        ParentFont = False
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 1
        Width = 212
      end
      object PointDCTypeComboBox: TcxComboBox
        Left = 145
        Top = 40
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #49324#50857' '#50504' '#54632
          #54252#51064#53944#47564' '#51201#47549#54633#45768#45796'.'
          #54624#51064#47564' '#51201#50857#54633#45768#45796'.'
          #54624#51064' '#54980' '#54252#51064#53944#46020' '#51201#47549#54633#45768#45796'.')
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 0
        Text = #49324#50857' '#50504' '#54632
        Width = 212
      end
    end
    object PointPanel: TPanel
      Left = 0
      Top = 95
      Width = 713
      Height = 270
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      object PointGroupBox: TcxGroupBox
        Left = 20
        Top = 0
        Caption = ' '#54252#51064#53944' '
        ParentFont = False
        Style.StyleController = EditStyleController
        TabOrder = 0
        Height = 264
        Width = 435
        object PointCashLabel: TLabel
          Left = 20
          Top = 53
          Width = 88
          Height = 17
          Caption = #54788#44552'/'#49688#54364' '#47588#52636
          Transparent = True
        end
        object PointCashReceiptLabel: TLabel
          Left = 20
          Top = 83
          Width = 96
          Height = 17
          Caption = #54788#44552#50689#49688#51613' '#47588#52636
          Transparent = True
        end
        object PointCardLabel: TLabel
          Left = 20
          Top = 113
          Width = 83
          Height = 17
          Caption = #49888#50857#52852#46300' '#47588#52636
          Transparent = True
        end
        object PointGiftCardLabel: TLabel
          Left = 20
          Top = 143
          Width = 70
          Height = 17
          Caption = #49345#54408#44428' '#47588#52636
          Transparent = True
        end
        object PointCreditLabel: TLabel
          Left = 20
          Top = 173
          Width = 57
          Height = 17
          Caption = #50808#49345' '#47588#52636
          Transparent = True
        end
        object PointOKCashbagLabel: TLabel
          Left = 20
          Top = 203
          Width = 88
          Height = 17
          Caption = 'OK'#52880#49772#48177' '#47588#52636
          Transparent = True
        end
        object PointTypeLabel: TLabel
          Left = 20
          Top = 23
          Width = 57
          Height = 17
          Caption = #51201#47549' '#44592#51456
          Transparent = True
        end
        object PointTmoneyLabel: TLabel
          Left = 20
          Top = 233
          Width = 83
          Height = 17
          Caption = 'T-money '#47588#52636
          Transparent = True
        end
        object PointPointPanel: TPanel
          Left = 125
          Top = 50
          Width = 290
          Height = 210
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 2
          object PointPointCashLabel: TLabel
            Left = 83
            Top = 3
            Width = 194
            Height = 17
            Caption = #50896' '#47560#45796'                '#54252#51064#53944' '#51201#47549
            Transparent = True
          end
          object PointPointCashReceiptLabel: TLabel
            Left = 83
            Top = 33
            Width = 194
            Height = 17
            Caption = #50896' '#47560#45796'                '#54252#51064#53944' '#51201#47549
            Transparent = True
          end
          object PointPointCardLabel: TLabel
            Left = 83
            Top = 63
            Width = 194
            Height = 17
            Caption = #50896' '#47560#45796'                '#54252#51064#53944' '#51201#47549
            Transparent = True
          end
          object PointPointGiftCardLabel: TLabel
            Left = 83
            Top = 93
            Width = 194
            Height = 17
            Caption = #50896' '#47560#45796'                '#54252#51064#53944' '#51201#47549
            Transparent = True
          end
          object PointPointCreditLabel: TLabel
            Left = 83
            Top = 123
            Width = 194
            Height = 17
            Caption = #50896' '#47560#45796'                '#54252#51064#53944' '#51201#47549
            Transparent = True
          end
          object PointPointOKCashbagLabel: TLabel
            Left = 83
            Top = 153
            Width = 194
            Height = 17
            Caption = #50896' '#47560#45796'                '#54252#51064#53944' '#51201#47549
            Transparent = True
          end
          object PointPointTmoneyLabel: TLabel
            Left = 83
            Top = 183
            Width = 194
            Height = 17
            Caption = #50896' '#47560#45796'                '#54252#51064#53944' '#51201#47549
            Transparent = True
          end
          object PointPointCashAmountEdit: TcxCurrencyEdit
            Left = 0
            Top = 0
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0'
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 0
            Width = 80
          end
          object PointPointCashEdit: TcxCurrencyEdit
            Left = 135
            Top = 0
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0'
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 1
            Width = 70
          end
          object PointPointCashReceiptAmountEdit: TcxCurrencyEdit
            Left = 0
            Top = 30
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0'
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 2
            Width = 80
          end
          object PointPointCashReceiptEdit: TcxCurrencyEdit
            Left = 135
            Top = 30
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0'
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 3
            Width = 70
          end
          object PointPointCardAmountEdit: TcxCurrencyEdit
            Left = 0
            Top = 60
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0'
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 4
            Width = 80
          end
          object PointPointCardEdit: TcxCurrencyEdit
            Left = 135
            Top = 60
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0'
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 5
            Width = 70
          end
          object PointPointGiftCardAmountEdit: TcxCurrencyEdit
            Left = 0
            Top = 90
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0'
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 6
            Width = 80
          end
          object PointPointGiftCardEdit: TcxCurrencyEdit
            Left = 135
            Top = 90
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0'
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 7
            Width = 70
          end
          object PointPointCreditAmountEdit: TcxCurrencyEdit
            Left = 0
            Top = 120
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0'
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 8
            Width = 80
          end
          object PointPointCreditEdit: TcxCurrencyEdit
            Left = 135
            Top = 120
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0'
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 9
            Width = 70
          end
          object PointPointOKCashbagAmountEdit: TcxCurrencyEdit
            Left = 0
            Top = 150
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0'
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 10
            Width = 80
          end
          object PointPointOKCashbagEdit: TcxCurrencyEdit
            Left = 135
            Top = 150
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0'
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 11
            Width = 70
          end
          object PointPointTmoneyAmountEdit: TcxCurrencyEdit
            Left = 0
            Top = 179
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0'
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 12
            Width = 80
          end
          object PointPointTmoneyEdit: TcxCurrencyEdit
            Left = 135
            Top = 180
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0'
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 13
            Width = 70
          end
        end
        object PointRatePanel: TPanel
          Left = 125
          Top = 50
          Width = 290
          Height = 210
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 3
          Visible = False
          object PointRateCashLabel: TLabel
            Left = 85
            Top = 1
            Width = 11
            Height = 17
            Caption = '%'
            Transparent = True
          end
          object PointRateCashReceiptLabel: TLabel
            Left = 85
            Top = 31
            Width = 11
            Height = 17
            Caption = '%'
            Transparent = True
          end
          object PointRateCardLabel: TLabel
            Left = 85
            Top = 61
            Width = 11
            Height = 17
            Caption = '%'
            Transparent = True
          end
          object PointRateGiftCardLabel: TLabel
            Left = 85
            Top = 91
            Width = 11
            Height = 17
            Caption = '%'
            Transparent = True
          end
          object PointRateCreditLabel: TLabel
            Left = 85
            Top = 121
            Width = 11
            Height = 17
            Caption = '%'
            Transparent = True
          end
          object PointRateOKCashbagLabel: TLabel
            Left = 85
            Top = 151
            Width = 11
            Height = 17
            Caption = '%'
            Transparent = True
          end
          object PointRateTmoneyLabel: TLabel
            Left = 85
            Top = 181
            Width = 11
            Height = 17
            Caption = '%'
            Transparent = True
          end
          object PointRateCashEdit: TcxCurrencyEdit
            Left = 0
            Top = 0
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 2
            Properties.DisplayFormat = '0.00'
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 0
            Width = 80
          end
          object PointRateCashReceiptEdit: TcxCurrencyEdit
            Left = 0
            Top = 30
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 2
            Properties.DisplayFormat = '0.00'
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 1
            Width = 80
          end
          object PointRateCardEdit: TcxCurrencyEdit
            Left = 0
            Top = 60
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 2
            Properties.DisplayFormat = '0.00'
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 2
            Width = 80
          end
          object PointRateGiftCardEdit: TcxCurrencyEdit
            Left = 0
            Top = 91
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 2
            Properties.DisplayFormat = '0.00'
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 3
            Width = 79
          end
          object PointRateCreditEdit: TcxCurrencyEdit
            Left = 0
            Top = 120
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 2
            Properties.DisplayFormat = '0.00'
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 4
            Width = 80
          end
          object PointRateOKCashbagEdit: TcxCurrencyEdit
            Left = 0
            Top = 150
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 2
            Properties.DisplayFormat = '0.00'
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 5
            Width = 80
          end
          object PointRateTmoneyEdit: TcxCurrencyEdit
            Left = 0
            Top = 180
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.DecimalPlaces = 2
            Properties.DisplayFormat = '0.00'
            Properties.UseLeftAlignmentOnEditing = False
            Properties.OnChange = EditPropertiesChange
            Properties.OnValidate = EditPropertiesValidate
            Style.StyleController = EditStyleController
            TabOrder = 6
            Width = 80
          end
        end
        object PointAllCheckBox: TcxCheckBox
          Left = 252
          Top = 20
          Caption = #47784#46304' '#44208#51228#49688#45800' '#46041#51068' '#51201#50857
          ParentFont = False
          Properties.OnChange = PointAllCheckBoxPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 175
        end
        object PointTypeComboBox: TcxComboBox
          Left = 125
          Top = 20
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #54252#51064#53944
            #48708#50984)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 0
          Text = #54252#51064#53944
          Width = 80
        end
      end
    end
    object DCPanel: TPanel
      Left = 0
      Top = 365
      Width = 713
      Height = 172
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
      object DCGroupBox: TcxGroupBox
        Left = 20
        Top = 0
        Caption = ' '#54624#51064' '
        ParentFont = False
        Style.StyleController = EditStyleController
        TabOrder = 0
        Height = 55
        Width = 435
        object DCRateLabel: TLabel
          Left = 20
          Top = 23
          Width = 101
          Height = 17
          Caption = #54924#50896' '#51088#46041' '#54624#51064#50984
          Transparent = True
        end
        object DCRatePercentLabel: TLabel
          Left = 210
          Top = 23
          Width = 11
          Height = 17
          Caption = '%'
          Transparent = True
        end
        object DCRateEdit: TcxCurrencyEdit
          Left = 125
          Top = 20
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DecimalPlaces = 2
          Properties.DisplayFormat = '0.00'
          Properties.MaxValue = 100.000000000000000000
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 80
        end
      end
    end
  end
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 21
  end
  inherited EditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
