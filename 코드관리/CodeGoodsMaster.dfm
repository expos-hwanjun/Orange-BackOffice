inherited CodeGoodsMasterForm: TCodeGoodsMasterForm
  Caption = #49345#54408#47560#49828#53552
  ClientHeight = 798
  ClientWidth = 988
  ExplicitWidth = 1004
  ExplicitHeight = 837
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 293
    Top = 83
    Height = 715
    ExplicitLeft = 290
    ExplicitTop = 64
    ExplicitHeight = 715
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 988
    ExplicitWidth = 988
    inherited ConditionToolBar: TAdvToolBar
      Width = 605
      ExplicitWidth = 605
      inherited ConditionToolBarDateLabel: TcxLabel
        Caption = #44160#49353#50612
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
      inherited ConditionToolBarEdit: TcxTextEdit
        TextHint = #49345#54408#47749' '#46608#45716' '#49345#54408#53076#46300
        Visible = True
        ExplicitWidth = 150
        Width = 150
      end
    end
  end
  inherited GridPanel: TPanel
    Top = 83
    Width = 293
    Height = 715
    ExplicitTop = 83
    ExplicitWidth = 293
    ExplicitHeight = 715
    inherited Grid: TcxGrid
      Width = 287
      Height = 709
      ExplicitWidth = 287
      ExplicitHeight = 709
      inherited GridTableView: TcxGridTableView
        Tag = 99
        OnCustomDrawCell = nil
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0 '#44148
            Kind = skCount
            Column = GridTableViewGoodsName
          end>
        OptionsSelection.MultiSelect = True
        OptionsView.Footer = True
        Styles.OnGetContentStyle = GridTableViewStylesGetContentStyle
        object GridTableViewGoodsCode: TcxGridColumn
          Tag = 98
          Caption = #49345#54408#53076#46300
          DataBinding.FieldName = 'CD_GOODS'
          HeaderAlignmentHorz = taCenter
          Width = 92
        end
        object GridTableViewGoodsName: TcxGridColumn
          Tag = 98
          Caption = #49345#54408#51060#47492
          DataBinding.FieldName = 'NM_GOODS'
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 167
        end
        object GridTableViewStatus: TcxGridColumn
          Tag = 99
          Caption = #49345#53468
          DataBinding.FieldName = 'YN_USE'
          Visible = False
        end
        object GridTableViewEventName: TcxGridColumn
          Tag = 99
          Caption = #54665#49324#47749
          DataBinding.FieldName = 'NM_SPC'
          Visible = False
        end
        object GridTableViewEventDate: TcxGridColumn
          Tag = 99
          Caption = #54665#49324#44592#44036
          DataBinding.FieldName = 'DT_SPC'
          Visible = False
        end
        object GridTableViewEventPrice: TcxGridColumn
          Tag = 99
          Caption = #54665#49324#54032#47588#44032
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'PR_SALE'
          Visible = False
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 299
    Top = 83
    Width = 689
    Height = 715
    ExplicitLeft = 299
    ExplicitTop = 83
    ExplicitWidth = 689
    ExplicitHeight = 715
    object GoodsPager: TcxPageControl
      Left = 0
      Top = 0
      Width = 689
      Height = 715
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = GoodsInfoPager
      Properties.CustomButtons.Buttons = <>
      Properties.TabWidth = 100
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      ExplicitLeft = 129
      ExplicitTop = 278
      ExplicitWidth = 683
      ExplicitHeight = 707
      ClientRectBottom = 715
      ClientRectRight = 689
      ClientRectTop = 28
      object GoodsInfoPager: TcxTabSheet
        Caption = #49345#54408#51221#48372
        ImageIndex = 0
        ExplicitLeft = -204
        ExplicitTop = 86
        ExplicitWidth = 675
        ExplicitHeight = 675
        object GoodsCodeLabel: TLabel
          Left = 23
          Top = 18
          Width = 52
          Height = 17
          Caption = #49345#54408#53076#46300
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
          Caption = #49345#54408#51060#47492
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
          Top = 142
          Width = 52
          Height = 17
          Caption = #49345#54408#48516#47448
          Transparent = True
        end
        object PriceBuyLabel: TLabel
          Left = 23
          Top = 237
          Width = 52
          Height = 17
          Caption = #47588#51077#45800#44032
          Transparent = True
        end
        object PriceSaleLabel: TLabel
          Left = 23
          Top = 300
          Width = 52
          Height = 17
          Caption = #54032#47588#45800#44032
          Transparent = True
        end
        object CompanyLabel: TLabel
          Left = 26
          Top = 331
          Width = 49
          Height = 17
          Caption = #47588' '#51077' '#52376
          Transparent = True
        end
        object PriceProfitRateLabel: TLabel
          Left = 202
          Top = 300
          Width = 96
          Height = 17
          Caption = #47588#52636'/'#47588#51077#51060#51061#47456
          Transparent = True
        end
        object StockTypeLabel: TLabel
          Left = 23
          Top = 363
          Width = 52
          Height = 17
          Caption = #51116#44256#44288#47532
          Transparent = True
        end
        object PriceBuyNetLabel: TLabel
          Left = 10
          Top = 267
          Width = 65
          Height = 17
          Caption = #47588#51077#44277#44553#44032
          Transparent = True
        end
        object PriceBuyVatLabel: TLabel
          Left = 233
          Top = 267
          Width = 65
          Height = 17
          Caption = #47588#51077#48512#44032#49464
          Transparent = True
        end
        object StockOptimumQtyLabel: TLabel
          Left = 23
          Top = 394
          Width = 52
          Height = 17
          Caption = #51201#51221#51116#44256
          Transparent = True
        end
        object EtcOrderUnitQtyLabel: TLabel
          Left = 23
          Top = 425
          Width = 52
          Height = 17
          Caption = #48156#51452#45800#50948
          Transparent = True
        end
        object GoodsTypeLabel: TLabel
          Left = 23
          Top = 174
          Width = 52
          Height = 17
          Caption = #49345#54408#44396#48516
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label3: TLabel
          Left = 23
          Top = 79
          Width = 52
          Height = 17
          Caption = #45800#52629#51060#47492
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label1: TLabel
          Left = 23
          Top = 205
          Width = 52
          Height = 17
          Caption = #44284#49464#44396#48516
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label2: TLabel
          Left = 24
          Top = 110
          Width = 51
          Height = 17
          Caption = #44508'     '#44201
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object GoodsCodeEdit: TcxTextEdit
          Left = 84
          Top = 15
          ParentFont = False
          Properties.ImeMode = imDisable
          Properties.MaxLength = 14
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          OnExit = GoodsCodeEditExit
          Width = 120
        end
        object GoodsNameEdit: TcxTextEdit
          Left = 84
          Top = 45
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 150
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 2
          OnExit = GoodsNameEditExit
          Width = 334
        end
        object GoodsClassCodeEdit: TcxButtonEdit
          Left = 84
          Top = 139
          Hint = 'CD_CLASS'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ClickKey = 112
          Properties.ImeMode = imSHanguel
          Properties.OnButtonClick = GoodsClassCodeEditPropertiesButtonClick
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 3
          Width = 89
        end
        object GoodsClassNameEdit: TcxTextEdit
          Left = 175
          Top = 139
          TabStop = False
          ParentFont = False
          Properties.ReadOnly = True
          Style.Color = 15856113
          Style.StyleController = EditStyleController
          TabOrder = 4
          Width = 242
        end
        object PriceBuyEdit: TcxCurrencyEdit
          Left = 84
          Top = 233
          EditValue = 0.000000000000000000
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Properties.EditFormat = ',#'
          Properties.ImeMode = imSAlpha
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 5
          Width = 88
        end
        object PriceSaleEdit: TcxCurrencyEdit
          Left = 84
          Top = 296
          EditValue = 0.000000000000000000
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Properties.EditFormat = ',#'
          Properties.ImeMode = imSAlpha
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 6
          Width = 88
        end
        object CompanyCodeEdit: TcxButtonEdit
          Left = 84
          Top = 328
          Hint = 'CD_TRDPL'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ClickKey = 112
          Properties.ImeMode = imSHanguel
          Properties.OnButtonClick = CompanyCodeEditPropertiesButtonClick
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 7
          Width = 88
        end
        object CompanyNameEdit: TcxTextEdit
          Left = 175
          Top = 328
          TabStop = False
          ParentFont = False
          Properties.ReadOnly = True
          Style.Color = 15856113
          Style.StyleController = EditStyleController
          TabOrder = 8
          Width = 242
        end
        object PriceProfitRateEdit: TcxCurrencyEdit
          Left = 312
          Top = 295
          EditValue = 0.000000000000000000
          ParentFont = False
          ParentShowHint = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DecimalPlaces = 2
          Properties.DisplayFormat = '0.00'
          Properties.EditFormat = '#.00'
          Properties.ImeMode = imSAlpha
          Properties.MaxValue = 100.000000000000000000
          Properties.MinValue = -100.000000000000000000
          Properties.Nullable = False
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          ShowHint = True
          Style.StyleController = EditStyleController
          TabOrder = 9
          Width = 47
        end
        object PriceBuyProfitRateEdit: TcxCurrencyEdit
          Left = 361
          Top = 295
          Hint = #47588#51077#51060#51061#47456
          TabStop = False
          EditValue = 0.000000000000000000
          ParentFont = False
          ParentShowHint = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DecimalPlaces = 2
          Properties.DisplayFormat = '0.00'
          Properties.ReadOnly = True
          ShowHint = True
          Style.Color = 14737632
          Style.StyleController = EditStyleController
          TabOrder = 10
          Width = 52
        end
        object StockTypeComboBox: TcxComboBox
          Left = 84
          Top = 359
          Hint = 'DS_STOCK'
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 11
          Width = 120
        end
        object UseCheckBox: TcxCheckBox
          Left = 85
          Top = 457
          Hint = 'YN_USE'
          Caption = ' '#49324#50857
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          Style.TransparentBorder = False
          TabOrder = 12
        end
        object PriceBuyNetEdit: TcxCurrencyEdit
          Left = 84
          Top = 264
          TabStop = False
          EditValue = 0.000000000000000000
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = ',0'
          Properties.EditFormat = ',0'
          Properties.ImeMode = imSAlpha
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.Color = clWindow
          Style.StyleController = EditStyleController
          TabOrder = 13
          Width = 88
        end
        object PriceBuyVatEdit: TcxCurrencyEdit
          Left = 312
          Top = 264
          TabStop = False
          EditValue = 0.000000000000000000
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = ',0'
          Properties.ReadOnly = True
          Properties.OnChange = EditPropertiesChange
          Style.Color = 14737632
          Style.StyleController = EditStyleController
          TabOrder = 14
          Width = 101
        end
        object StockOptimumQtyEdit: TcxCurrencyEdit
          Left = 84
          Top = 391
          Hint = 'QTY_SAFETY'
          EditValue = 0.000000000000000000
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0;-,0'
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 8
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = EditPropertiesChange
          Style.Color = clWindow
          Style.StyleController = EditStyleController
          TabOrder = 15
          Width = 61
        end
        object OrderUnitQtyEdit: TcxCurrencyEdit
          Left = 84
          Top = 422
          Hint = 'QTY_ORDER'
          EditValue = 0.000000000000000000
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0;-,0'
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 8
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnChange = EditPropertiesChange
          Style.Color = clWindow
          Style.StyleController = EditStyleController
          TabOrder = 16
          Width = 61
        end
        object DcCheckBox: TcxCheckBox
          Tag = 1
          Left = 159
          Top = 457
          Hint = 'YN_DC'
          Caption = #54624#51064
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          State = cbsChecked
          Style.StyleController = EditStyleController
          Style.TransparentBorder = False
          TabOrder = 17
        end
        object PointCheckBox: TcxCheckBox
          Tag = 1
          Left = 237
          Top = 457
          Hint = 'YN_POINT'
          Caption = #54252#51064#53944
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          State = cbsChecked
          Style.StyleController = EditStyleController
          Style.TransparentBorder = False
          TabOrder = 18
        end
        object GoodsTypeComboBox: TcxComboBox
          Left = 84
          Top = 170
          Hint = 'DS_MENU_TYPE'
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 19
          Width = 89
        end
        object GoodsShortNameEdit: TcxTextEdit
          Left = 84
          Top = 76
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 60
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 20
          Width = 264
        end
        object TaxComboBox: TcxComboBox
          Left = 84
          Top = 201
          Hint = 'DS_TAX'
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 21
          Width = 89
        end
        object GoodsSpecEdit: TcxTextEdit
          Left = 84
          Top = 107
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 30
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 22
          Width = 180
        end
        object cxGroupBox1: TcxGroupBox
          Left = 423
          Top = 37
          Enabled = False
          TabOrder = 23
          Transparent = True
          Height = 252
          Width = 186
          object InfoRegistDateLabel: TLabel
            Left = 15
            Top = 19
            Width = 52
            Height = 17
            Caption = #46321#47197#51068#51088
            Transparent = True
          end
          object InfoFirstBuyDateLabel: TLabel
            Left = 15
            Top = 52
            Width = 52
            Height = 17
            Caption = #52572#52488#47588#51077
            Transparent = True
          end
          object InfoRecentBuyDateLabel: TLabel
            Left = 15
            Top = 85
            Width = 52
            Height = 17
            Caption = #52572#44540#47588#51077
            Transparent = True
          end
          object InfoRecentSurveyDateLabel: TLabel
            Left = 15
            Top = 119
            Width = 52
            Height = 17
            Caption = #52572#44540#49892#49324
            Transparent = True
          end
          object Label9: TLabel
            Left = 15
            Top = 186
            Width = 52
            Height = 17
            Caption = #54665#49324#54032#44032
            Transparent = True
          end
          object Label6: TLabel
            Left = 15
            Top = 152
            Width = 52
            Height = 17
            Caption = #54665#12288#12288#49324
            Transparent = True
          end
          object Label7: TLabel
            Left = 15
            Top = 219
            Width = 52
            Height = 17
            Caption = #54665#49324#44592#44036
            Transparent = True
          end
          object InfoRegistDateEdit: TcxTextEdit
            Left = 72
            Top = 15
            TabStop = False
            Enabled = False
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            Properties.UseLeftAlignmentOnEditing = False
            Style.Color = 14737632
            Style.StyleController = EditStyleController
            TabOrder = 0
            Width = 100
          end
          object InfoRecentBuyDateEdit: TcxTextEdit
            Left = 72
            Top = 82
            TabStop = False
            Enabled = False
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            Properties.UseLeftAlignmentOnEditing = False
            Style.Color = 14737632
            Style.StyleController = EditStyleController
            TabOrder = 1
            Width = 100
          end
          object InfoRecentSurveyDateEdit: TcxTextEdit
            Left = 72
            Top = 115
            TabStop = False
            Enabled = False
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            Properties.UseLeftAlignmentOnEditing = False
            Style.Color = 14737632
            Style.StyleController = EditStyleController
            TabOrder = 2
            Width = 100
          end
          object InfoFirstBuyDateEdit: TcxTextEdit
            Left = 72
            Top = 48
            TabStop = False
            Enabled = False
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            Properties.UseLeftAlignmentOnEditing = False
            Style.Color = 14737632
            Style.StyleController = EditStyleController
            TabOrder = 3
            Width = 100
          end
          object InfoEventPriceEdit: TcxCurrencyEdit
            Left = 72
            Top = 182
            TabStop = False
            EditValue = 0.000000000000000000
            Enabled = False
            ParentFont = False
            Properties.Alignment.Horz = taRightJustify
            Properties.AssignedValues.EditFormat = True
            Properties.DisplayFormat = ',0'
            Properties.ImeMode = imSAlpha
            Properties.ReadOnly = True
            Properties.UseLeftAlignmentOnEditing = False
            Properties.ValidateOnEnter = False
            Style.Color = 14737632
            Style.StyleController = EditStyleController
            TabOrder = 4
            Width = 100
          end
          object InfoEventNameEdit: TcxTextEdit
            Left = 72
            Top = 149
            TabStop = False
            Enabled = False
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Properties.ReadOnly = True
            Properties.UseLeftAlignmentOnEditing = False
            Style.Color = 14737632
            Style.StyleController = EditStyleController
            TabOrder = 5
            Width = 100
          end
          object InfoEventTermEdit: TcxTextEdit
            Left = 72
            Top = 216
            TabStop = False
            Enabled = False
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = True
            Properties.UseLeftAlignmentOnEditing = False
            Style.Color = 14737632
            Style.StyleController = EditStyleController
            TabOrder = 6
            Width = 100
          end
        end
        object MemberGroupBox: TAdvGroupBox
          Left = 423
          Top = 295
          Width = 250
          Height = 234
          BorderColor = 12895944
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          Transparent = False
          Caption = ' '#54924#50896#46321#44553#48324' '#54624#51064'/'#54252#51064#53944' '
          ParentCtl3D = True
          TabOrder = 24
          DesignSize = (
            250
            234)
          object Grid1: TcxGrid
            Left = 8
            Top = 23
            Width = 234
            Height = 204
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            LookAndFeel.Kind = lfOffice11
            object GridTableView1: TcxGridTableView
              Tag = 99
              Navigator.Buttons.CustomButtons = <>
              ScrollbarAnnotations.CustomAnnotations = <>
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsView.GroupByBox = False
              object GridTableView1Column1: TcxGridColumn
                Caption = #54924#50896#44396#48516
                DataBinding.FieldName = 'NM_CODE1'
                HeaderAlignmentHorz = taCenter
                Options.Editing = False
                Options.Filtering = False
                Options.Focusing = False
                Options.Moving = False
                Width = 101
              end
              object GridTableView1DcRate: TcxGridColumn
                Caption = #54624#51064#50984
                DataBinding.ValueType = 'Currency'
                DataBinding.FieldName = 'DC_RATE'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = '#0.0'
                Properties.OnEditValueChanged = GridTableView1DcRatePropertiesEditValueChanged
                HeaderAlignmentHorz = taCenter
                Options.Filtering = False
                Options.Moving = False
                Width = 62
              end
              object GridTableView1PointRate: TcxGridColumn
                Caption = #51201#47549#50984
                DataBinding.ValueType = 'Currency'
                DataBinding.FieldName = 'POINT_RATE'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = '#0.0'
                Properties.OnEditValueChanged = GridTableView1PointRatePropertiesEditValueChanged
                HeaderAlignmentHorz = taCenter
                Options.Filtering = False
                Options.Moving = False
                Width = 55
              end
              object GridTableView1Column4: TcxGridColumn
                DataBinding.FieldName = 'CD_CODE'
                Visible = False
              end
            end
            object GridLevel1: TcxGridLevel
              GridView = GridTableView1
            end
          end
        end
        object InputRemainCheckBox: TcxCheckBox
          Tag = 99
          Left = 268
          Top = 18
          Caption = #49888#44508#44256#51221
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          Style.TransparentBorder = False
          TabOrder = 25
        end
        object HeadMenuStatus: TcxLabel
          Left = 423
          Top = 16
          AutoSize = False
          Caption = #47588#51109#47700#45684
          ParentColor = False
          ParentFont = False
          Style.BorderStyle = ebsOffice11
          Style.Color = clWhite
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -13
          Style.Font.Name = #47569#51008' '#44256#46357
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Transparent = True
          Visible = False
          Height = 24
          Width = 78
          AnchorX = 462
          AnchorY = 28
        end
        object GoodsCodeCreateButton: TAdvGlowButton
          Left = 208
          Top = 15
          Width = 56
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
          TabOrder = 27
          OnClick = GoodsCodeCreateButtonClick
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
        object GoodsClassTreeView: TcxTreeView
          Left = -105
          Top = 484
          Width = 250
          Height = 340
          ParentFont = False
          Style.StyleController = EditStyleController
          TabOrder = 0
          Visible = False
          OnDblClick = GoodsClassTreeViewDblClick
          OnExit = GoodsClassTreeViewExit
          OnKeyDown = GoodsClassTreeViewKeyDown
          MultiSelectStyle = []
          ReadOnly = True
          RightClickSelect = True
          OnExpanding = GoodsClassTreeViewExpanding
        end
      end
      object HistoryPager: TcxTabSheet
        Caption = #49688#51221#51060#47141
        ImageIndex = 1
        OnShow = HistoryPagerShow
        ExplicitLeft = 4
        ExplicitWidth = 675
        ExplicitHeight = 675
        object cxGrid1: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 683
          Height = 681
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
          ExplicitLeft = 6
          ExplicitTop = 6
          ExplicitWidth = 669
          ExplicitHeight = 669
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
              Tag = 99
              Caption = #51089#50629
              DataBinding.FieldName = 'GUBUN'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              Visible = False
              HeaderAlignmentHorz = taCenter
              Width = 50
            end
            object HistoryGridTableViewMenusName: TcxGridColumn
              Caption = #49345#54408#51060#47492
              DataBinding.FieldName = 'NM_MENU'
              PropertiesClassName = 'TcxLabelProperties'
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Options.Moving = False
              Width = 200
            end
            object HistoryGridTableViewBuyPrice: TcxGridColumn
              Caption = #47588#51077#44032'('#51204')'
              DataBinding.FieldName = 'PR_BUY_OLD'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DecimalPlaces = 2
              Properties.DisplayFormat = ',0.00'
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Options.Moving = False
              Width = 80
            end
            object HistoryGridTableViewAfterBuyPrice: TcxGridColumn
              Caption = #47588#51077#44032'('#54980')'
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'PR_BUY'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00'
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object HistoryGridTableViewSalePrice: TcxGridColumn
              Caption = #54032#47588#44032'('#51204')'
              DataBinding.FieldName = 'PR_SALE_OLD'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0'
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Options.Moving = False
              Width = 80
            end
            object HistoryGridTableViewAfterSalePrice: TcxGridColumn
              Caption = #54032#47588#44032'('#54980')'
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'PR_SALE'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0'
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object HistoryGridTableViewProfitRate: TcxGridColumn
              Caption = #51060#51061#47456
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'PR_SALE_PROFIT'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DecimalPlaces = 2
              Properties.DisplayFormat = ',0.00'
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Options.Moving = False
              Width = 60
            end
            object HistoryGridTableViewMenuShortName: TcxGridColumn
              Caption = #49345#54408#45800#52629#51060#47492
              DataBinding.FieldName = 'NM_MENU_SHORT'
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Options.Moving = False
              Width = 150
            end
            object HistoryGridTableViewClassCode: TcxGridColumn
              Caption = #49345#54408#48516#47448
              DataBinding.FieldName = 'NM_CLASS'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
              Width = 200
            end
            object HistoryGridTableViewTaxYN: TcxGridColumn
              Caption = #44284#49464
              DataBinding.FieldName = 'DS_TAX'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 50
            end
            object HistoryGridTableViewType: TcxGridColumn
              Caption = #44396#48516
              DataBinding.FieldName = 'DS_MENU_TYPE'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 70
            end
            object HistoryGridTableViewStockType: TcxGridColumn
              Caption = #51116#44256#44396#48516
              DataBinding.FieldName = 'DS_STOCK'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 70
            end
            object HistoryGridTableViewCompanyCode: TcxGridColumn
              Caption = #47588#51077#52376
              DataBinding.FieldName = 'NM_TRDPL'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
              Width = 200
            end
            object HistoryGridTableViewSafetyQty: TcxGridColumn
              Caption = #51201#51221#51116#44256
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'QTY_SAFETY'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0'
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewOrderQty: TcxGridColumn
              Caption = #48156#51452#45800#50948
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'QTY_ORDER'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0'
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewDCYN: TcxGridColumn
              Caption = #54624#51064
              DataBinding.FieldName = 'YN_DC'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 50
            end
            object HistoryGridTableViewPointYN: TcxGridColumn
              Caption = #54252#51064#53944
              DataBinding.FieldName = 'YN_POINT'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 50
            end
            object HistoryGridTableViewRcpYN: TcxGridColumn
              Caption = #50689#49688#51613#52636#47141
              DataBinding.FieldName = 'YN_RCP'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 86
            end
            object HistoryGridTableViewUnitQty: TcxGridColumn
              Caption = #44060#45817#51473#47049
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'QTY_UNIT'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0'
              HeaderAlignmentHorz = taCenter
              Width = 75
            end
            object HistoryGridTableViewTipPrice: TcxGridColumn
              Caption = #48393#49324#47308
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'PR_TIP'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0'
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewUseYN: TcxGridColumn
              Caption = #49324#50857
              DataBinding.FieldName = 'YN_USE'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 59
            end
            object HistoryGridTableViewUserName: TcxGridColumn
              Caption = #51089#50629#49324#50896
              DataBinding.FieldName = 'NM_SAWON'
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object HistoryGridTableViewInsertDate: TcxGridColumn
              Caption = #46321#47197#51068#49884
              DataBinding.FieldName = 'DT_INSERT'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Grouping = False
              Options.Moving = False
              Width = 150
            end
            object HistoryGridTableViewPrgChange: TcxGridColumn
              Caption = #48320#44221'PG'
              DataBinding.FieldName = 'PRG_CHANGE'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = HistoryGridTableView
          end
        end
      end
    end
  end
  object DetailSearchPanel: TAdvPanel [5]
    Left = 0
    Top = 65
    Width = 988
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
    FullHeight = 233
    object ScrollBox1: TScrollBox
      Left = 0
      Top = 18
      Width = 988
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
      object Conditon1RadioGroup: TAdvOfficeRadioGroup
        Tag = 99
        Left = 14
        Top = 78
        Width = 107
        Height = 83
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Version = '1.8.0.3'
        BiDiMode = bdLeftToRight
        Caption = #54032#47588#44396#48516
        ParentBackground = False
        ParentBiDiMode = False
        ParentCtl3D = True
        TabOrder = 0
        ItemIndex = 1
        Items.Strings = (
          #51204#52404
          #54032#47588#51473
          #45800#51333#49345#54408)
        ButtonVertAlign = tlCenter
        Ellipsis = False
      end
      object Conditon2RadioGroup: TAdvOfficeRadioGroup
        Tag = 99
        Left = 141
        Top = 81
        Width = 116
        Height = 106
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Version = '1.8.0.3'
        BiDiMode = bdLeftToRight
        Caption = #49345#54408#44396#48516
        ParentBackground = False
        ParentBiDiMode = False
        ParentCtl3D = True
        TabOrder = 1
        ItemIndex = 0
        Items.Strings = (
          #51204#52404
          #51068#48152' '#49345#54408
          #50724#54536' '#49345#54408
          #51200#50872' '#49345#54408)
        ButtonVertAlign = tlCenter
        Ellipsis = False
      end
      object Conditon3RadioGroup: TAdvOfficeRadioGroup
        Tag = 99
        Left = 283
        Top = 82
        Width = 165
        Height = 121
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Version = '1.8.0.3'
        BiDiMode = bdLeftToRight
        Caption = #54624#51064'/'#54252#51064#53944
        ParentBackground = False
        ParentBiDiMode = False
        ParentCtl3D = True
        TabOrder = 2
        ItemIndex = 0
        Items.Strings = (
          #51204#52404
          #54624#51064' '#44032#45733' '#47700#45684
          #54624#51064' '#48520#44032' '#47700#45684
          #54252#51064#53944' '#51201#47549' '#47700#45684
          #54252#51064#53944' '#48120#51201#47549' '#47700#45684)
        ButtonVertAlign = tlCenter
        Ellipsis = False
      end
      object Conditon4RadioGroup: TAdvOfficeRadioGroup
        Tag = 99
        Left = 464
        Top = 84
        Width = 109
        Height = 79
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Version = '1.8.0.3'
        BiDiMode = bdLeftToRight
        Caption = #44284#49464'/'#47732#49464
        ParentBackground = False
        ParentBiDiMode = False
        ParentCtl3D = True
        TabOrder = 3
        ItemIndex = 0
        Items.Strings = (
          #51204#52404
          #44284#49464
          #47732#49464)
        ButtonVertAlign = tlCenter
        Ellipsis = False
      end
      object Conditon5RadioGroup: TAdvOfficeRadioGroup
        Tag = 99
        Left = 599
        Top = 84
        Width = 144
        Height = 92
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Version = '1.8.0.3'
        BiDiMode = bdLeftToRight
        Caption = #51116#44256#44396#48516
        ParentBackground = False
        ParentBiDiMode = False
        ParentCtl3D = True
        TabOrder = 4
        ItemIndex = 0
        Items.Strings = (
          #51204#52404
          #44288#47532#54632
          #44288#47532#50504#54632)
        ButtonVertAlign = tlCenter
        Ellipsis = False
      end
      object AdvGroupBox1: TAdvGroupBox
        Left = 14
        Top = 4
        Width = 729
        Height = 70
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        ParentCtl3D = True
        TabOrder = 5
        object ConditionGoodsClassLabel: TLabel
          Left = 14
          Top = 9
          Width = 52
          Height = 25
          AutoSize = False
          Caption = #49345#54408#48516#47448
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
          Layout = tlCenter
        end
        object Label4: TLabel
          Left = 454
          Top = 7
          Width = 52
          Height = 25
          AutoSize = False
          Caption = #49688#51221#44592#44036
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
          Layout = tlCenter
        end
        object ConditionCompanyLabel: TLabel
          Left = 15
          Top = 40
          Width = 49
          Height = 17
          Caption = #47588' '#51077' '#52376
          Transparent = True
        end
        object ConditionGoodsClassCodeEdit: TcxButtonEdit
          Tag = 99
          Left = 74
          Top = 8
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ClickKey = 112
          Properties.ImeMode = imSHanguel
          Properties.ReadOnly = False
          Properties.OnButtonClick = ConditionGoodsClassCodeEditPropertiesButtonClick
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 80
        end
        object ConditionGoodsClassNameEdit: TcxTextEdit
          Tag = 99
          Left = 156
          Top = 8
          TabStop = False
          ParentFont = False
          Properties.ReadOnly = True
          Style.Color = 14737632
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 242
        end
        object ConditionFromDateEdit: TcxDateEdit
          Tag = 99
          Left = 514
          Top = 7
          AutoSize = False
          ParentFont = False
          Style.StyleController = EditStyleController
          TabOrder = 2
          Height = 25
          Width = 90
        end
        object cxLabel2: TcxLabel
          Left = 604
          Top = 7
          AutoSize = False
          Caption = '~'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Transparent = True
          Height = 27
          Width = 18
          AnchorX = 613
          AnchorY = 21
        end
        object ConditionToDateEdit: TcxDateEdit
          Tag = 99
          Left = 622
          Top = 7
          AutoSize = False
          ParentFont = False
          Style.StyleController = EditStyleController
          TabOrder = 4
          Height = 25
          Width = 90
        end
        object ConditionCompanyCodeEdit: TcxButtonEdit
          Tag = 99
          Left = 74
          Top = 37
          Hint = 'CD_CLASS'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ClickKey = 112
          Properties.ImeMode = imSHanguel
          Properties.OnButtonClick = CompanyCodeEditPropertiesButtonClick
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 5
          Width = 80
        end
        object ConditionCompanyNameEdit: TcxTextEdit
          Tag = 99
          Left = 156
          Top = 37
          TabStop = False
          ParentFont = False
          Properties.ReadOnly = True
          Style.Color = 14737632
          Style.StyleController = EditStyleController
          TabOrder = 6
          Width = 242
        end
      end
      object ConditionNotClassCheckBox: TAdvOfficeCheckBox
        Tag = 99
        Left = 464
        Top = 169
        Width = 119
        Height = 26
        TabOrder = 6
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = #48516#47448' '#48120#51648#51221
        ReturnIsTab = False
        Version = '1.8.0.3'
      end
      object ConditionNotCompanyCheckBox: TAdvOfficeCheckBox
        Tag = 99
        Left = 599
        Top = 182
        Width = 119
        Height = 26
        TabOrder = 7
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = #47588#51077#52376' '#48120#51648#51221
        ReturnIsTab = False
        Version = '1.8.0.3'
      end
    end
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  object GoodsCodeCreatePopup: TPopupMenu
    AutoHotkeys = maManual
    Left = 597
    Top = 310
    object GoodsCodeCreatePopupNormal: TMenuItem
      Caption = #51068#48152' '#49345#54408
      OnClick = GoodsCodeCreatePopupNormalClick
    end
    object GoodsCodeCreatePopupSelf: TMenuItem
      Caption = #51088#52404' '#49345#54408
      OnClick = GoodsCodeCreatePopupSelfClick
    end
    object GoodsCodeCreatePopupScale: TMenuItem
      Caption = #51200#50872' '#49345#54408
      OnClick = GoodsCodeCreatePopupSelfClick
    end
  end
end
