object MemberVatInvoiceHelpForm: TMemberVatInvoiceHelpForm
  Left = 306
  Top = 122
  ActiveControl = ConditionToolBarEdit
  Caption = #47588#52636'/'#44208#51228' '#45236#50669#51312#54924
  ClientHeight = 609
  ClientWidth = 1003
  Color = 16768709
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 17
  object GridSplitter: TAdvSplitter
    Left = 250
    Top = 40
    Width = 6
    Height = 569
    AutoSnap = False
    MinSize = 50
    Appearance.BorderColor = clNone
    Appearance.BorderColorHot = clNone
    Appearance.Color = 14542308
    Appearance.ColorTo = 16768709
    Appearance.ColorHot = 15383705
    Appearance.ColorHotTo = 14922381
    GripStyle = sgFlatDots
    ExplicitTop = 78
    ExplicitHeight = 528
  end
  object GridPanel: TPanel
    Left = 0
    Top = 40
    Width = 250
    Height = 569
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object Grid: TcxGrid
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 244
      Height = 563
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object CompanyGridTableView: TcxGridTableView
        FilterBox.CustomizeDialog = False
        FilterBox.Visible = fvNever
        OnFocusedRecordChanged = CompanyGridTableViewFocusedRecordChanged
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0'#44148
            Kind = skCount
            Column = CompanyGridTableViewCompanyCode
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object CompanyGridTableViewCompanyCode: TcxGridColumn
          Caption = #47588#52636#52376#53076#46300
          DataBinding.FieldName = 'CD_MEMBER'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Width = 81
        end
        object CompanyGridTableViewCompanyName: TcxGridColumn
          Caption = #47588#52636#52376#51060#47492
          DataBinding.FieldName = 'NM_MEMBER'
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 137
        end
      end
      object GridLevel: TcxGridLevel
        GridView = CompanyGridTableView
      end
    end
  end
  object MainPanel: TPanel
    Left = 256
    Top = 40
    Width = 747
    Height = 569
    Align = alClient
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 1
    object AcctGrid: TcxGrid
      Left = 0
      Top = 375
      Width = 747
      Height = 194
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object AcctGridTableView: TcxGridTableView
        Tag = 98
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0'#44148
            Kind = skCount
            Column = AcctGridTableViewAcctDate
          end
          item
            Format = ',0'
            Kind = skSum
            Column = AcctGridTableViewAcctAmt
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
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.ContentEven = StyleEven
        object AcctGridTableViewAcctDate: TcxGridColumn
          Tag = 98
          Caption = #44208#51228#51068#51088
          DataBinding.FieldName = 'YMD_OCCUR'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Options.Focusing = False
          Options.Sorting = False
          Width = 100
        end
        object AcctGridTableViewBillNo: TcxGridColumn
          Tag = 98
          Caption = #51204#54364#48264#54840
          DataBinding.FieldName = 'NO_ACCT'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Options.Focusing = False
          Options.Sorting = False
          Width = 70
        end
        object AcctGridTableViewCheck: TcxGridColumn
          Tag = 98
          Caption = #48156#54665
          DataBinding.FieldName = 'YN_CHECK'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Properties.OnEditValueChanged = AcctGridTableViewCheckPropertiesEditValueChanged
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Options.Sorting = False
          Width = 60
          OnHeaderClick = AcctGridTableViewCheckHeaderClick
        end
        object AcctGridTableViewAcctAmt: TcxGridColumn
          Tag = 98
          Caption = #44208#51228#44552#50529
          DataBinding.FieldName = 'AMT_PAYIN'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Options.Focusing = False
          Options.Sorting = False
          Width = 100
        end
        object AcctGridTableViewColumn2: TcxGridColumn
          Caption = #44208#51228#44396#48516
          DataBinding.FieldName = 'DS_ACCT'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 75
        end
        object AcctGridTableViewColumn4: TcxGridColumn
          Caption = #48708'   '#44256
          DataBinding.FieldName = 'REMARK'
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Options.Focusing = False
          Options.Sorting = False
          Width = 300
        end
      end
      object AcctGridLevel1: TcxGridLevel
        GridView = AcctGridTableView
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 336
      Width = 747
      Height = 39
      Align = alTop
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object cxLabel3: TcxLabel
        Left = 7
        Top = 4
        Caption = #9654' '#51077#44552#45236#50669
        ParentColor = False
        ParentFont = False
        Style.Color = 16768709
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -17
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 747
      Height = 39
      Align = alTop
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      DesignSize = (
        747
        39)
      object cxLabel2: TcxLabel
        Left = 7
        Top = 4
        Caption = #9654' '#54032#47588#45236#50669
        ParentColor = False
        ParentFont = False
        Style.Color = 16768709
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -17
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object TotalAmtEdit: TcxCurrencyEdit
        Left = 623
        Top = 5
        Anchors = [akTop, akRight]
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.BorderStyle = ebsFlat
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 1
        Width = 121
      end
      object cxLabel4: TcxLabel
        Left = 239
        Top = 6
        Caption = #48156#54665#44552#50529
        ParentColor = False
        ParentFont = False
        Style.Color = 16768709
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object SaleTotalAmtEdit: TcxCurrencyEdit
        Left = 335
        Top = 5
        Anchors = [akTop, akRight]
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.BorderStyle = ebsFlat
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 3
        Width = 121
      end
      object AcctTotalAmtEdit: TcxCurrencyEdit
        Left = 478
        Top = 5
        Anchors = [akTop, akRight]
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.BorderStyle = ebsFlat
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 4
        Width = 121
      end
      object cxLabel5: TcxLabel
        Left = 434
        Top = 6
        Caption = '+'
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxLabel6: TcxLabel
        Left = 578
        Top = 6
        Caption = '='
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Transparent = True
      end
    end
    object SaleGrid: TcxGrid
      Left = 0
      Top = 39
      Width = 747
      Height = 297
      Align = alTop
      TabOrder = 3
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object SaleGridTableView: TcxGridTableView
        Tag = 99
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
            Column = SaleGridTableGridSaleAmt
          end
          item
            Format = ',0'
            Kind = skSum
            Column = SaleGridTableGridCashAmt
          end
          item
            Format = ',0'
            Kind = skSum
            Column = SaleGridTableGridCashRcpAmt
          end
          item
            Format = ',0'
            Kind = skSum
            Column = SaleGridTableGridCardAmt
          end
          item
            Format = ',0'
            Kind = skSum
            Column = SaleGridTableGridTrustAmt
          end
          item
            Format = ',0'
            Kind = skSum
            Column = SaleGridTableGridGiftAmt
          end
          item
            Format = ',0'
            Kind = skSum
            Column = SaleGridTableGridTMoneyAmt
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.ContentEven = StyleEven
        object SaleGridTableViewSaleDate: TcxGridColumn
          Tag = 98
          Caption = #47588#52636#51068#51088
          DataBinding.FieldName = 'YMD_SALE'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Options.Focusing = False
          Options.Sorting = False
          Width = 100
        end
        object SaleGridTableViewBillNo: TcxGridColumn
          Tag = 98
          Caption = #51204#54364#48264#54840
          DataBinding.FieldName = 'NO_BILL'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Options.Focusing = False
          Options.Sorting = False
          Width = 70
        end
        object SaleGridTableViewCheck: TcxGridColumn
          Tag = 98
          Caption = #48156#54665
          DataBinding.FieldName = 'YN_CHECK'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayGrayed = 'False'
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Properties.OnEditValueChanged = SaleGridTableViewCheckPropertiesEditValueChanged
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Options.Sorting = False
          Width = 60
          OnHeaderClick = SaleGridTableViewCheckHeaderClick
        end
        object SaleGridTableGridSaleAmt: TcxGridColumn
          Tag = 98
          Caption = #54032#47588#44552#50529
          DataBinding.FieldName = 'AMT_SALE'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Options.Focusing = False
          Options.Sorting = False
          Width = 100
        end
        object SaleGridTableGridCashAmt: TcxGridColumn
          Caption = #54788#44552#44552#50529
          DataBinding.FieldName = 'AMT_CASH'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Options.Focusing = False
          Options.Sorting = False
          Width = 100
        end
        object SaleGridTableGridCashRcpAmt: TcxGridColumn
          Caption = #54788#44552#50689#49688#51613
          DataBinding.FieldName = 'AMT_CASHRCP'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Options.Focusing = False
          Options.Sorting = False
          Width = 100
        end
        object SaleGridTableGridCardAmt: TcxGridColumn
          Caption = #49888#50857#52852#46300
          DataBinding.FieldName = 'AMT_CARD'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Options.Focusing = False
          Options.Sorting = False
          Width = 100
        end
        object SaleGridTableGridTrustAmt: TcxGridColumn
          Caption = #50808#49345
          DataBinding.FieldName = 'AMT_TRUST'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Options.Focusing = False
          Options.Sorting = False
          Width = 100
        end
        object SaleGridTableGridGiftAmt: TcxGridColumn
          Caption = #49345#54408#44428
          DataBinding.FieldName = 'AMT_GIFT'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Options.Focusing = False
          Options.Sorting = False
          Width = 100
        end
        object SaleGridTableGridTMoneyAmt: TcxGridColumn
          Caption = 'T-'#47672#45768
          DataBinding.FieldName = 'AMT_TMONEY'
          DataBinding.ValueType = 'Currency'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Options.Focusing = False
          Options.Sorting = False
          Width = 100
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = SaleGridTableView
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 1003
    Height = 40
    Align = alTop
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      1003
      40)
    object ConditionToolBarDateLabel: TcxLabel
      Left = 9
      Top = 5
      AutoSize = False
      Caption = #51312#54924#44592#44036
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Height = 27
      Width = 65
      AnchorX = 42
      AnchorY = 19
    end
    object ConditionToolBarFromDateEdit: TcxDateEdit
      Left = 74
      Top = 6
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
      Style.StyleController = EditStyleController
      TabOrder = 0
      Height = 25
      Width = 90
    end
    object ConditionToolBarDateToLabel: TcxLabel
      Left = 169
      Top = 4
      AutoSize = False
      Caption = '~'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Height = 27
      Width = 18
      AnchorX = 178
      AnchorY = 18
    end
    object ConditionToolBarToDateEdit: TcxDateEdit
      Left = 189
      Top = 6
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
      Style.StyleController = EditStyleController
      TabOrder = 1
      Height = 25
      Width = 90
    end
    object cxLabel1: TcxLabel
      Left = 289
      Top = 7
      AutoSize = False
      Caption = #44144#47000#52376
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Height = 27
      Width = 65
      AnchorX = 322
      AnchorY = 21
    end
    object ConditionToolBarEdit: TcxTextEdit
      Left = 347
      Top = 7
      AutoSize = False
      ImeMode = imSHanguel
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
      Properties.ImeMode = imSHanguel
      Style.StyleController = EditStyleController
      TabOrder = 2
      Height = 25
      Width = 120
    end
    object ConditionToolBarEditLabel: TcxLabel
      Left = 474
      Top = 6
      AutoSize = False
      Caption = #51312#54924#51312#44148
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      Height = 27
      Width = 65
      AnchorX = 507
      AnchorY = 20
    end
    object ConditionDsTrdCheckComboBox: TcxCheckComboBox
      Left = 539
      Top = 7
      ParentFont = False
      Properties.Delimiter = ','
      Properties.EmptySelectionText = #51204#52404
      Properties.Items = <
        item
          Description = #54788#44552
        end
        item
          Description = #54788#44552#50689#49688#51613
        end
        item
          Description = #49888#50857#52852#46300
        end
        item
          Description = #50808#49345
        end
        item
          Description = #49345#54408#44428
        end
        item
          Description = 'T-Money'
        end>
      Style.LookAndFeel.Kind = lfOffice11
      Style.StyleController = EditStyleController
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleFocused.Color = 8454143
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.Kind = lfOffice11
      TabOrder = 3
      Width = 123
    end
    object SearchButton: TcxButton
      Left = 742
      Top = 5
      Width = 85
      Height = 29
      Anchors = [akTop, akRight]
      Caption = #51312#54924
      LookAndFeel.Kind = lfOffice11
      TabOrder = 4
      OnClick = SearchButtonClick
    end
    object ConfirmButton: TcxButton
      Left = 829
      Top = 5
      Width = 85
      Height = 29
      Anchors = [akTop, akRight]
      Caption = #54869#51064
      LookAndFeel.Kind = lfOffice11
      TabOrder = 5
      OnClick = ConfirmButtonClick
    end
    object CloseButton: TcxButton
      Left = 915
      Top = 5
      Width = 85
      Height = 29
      Anchors = [akTop, akRight]
      Caption = #45803#44592
      LookAndFeel.Kind = lfOffice11
      TabOrder = 6
      OnClick = CloseButtonClick
    end
  end
  object StyleRepository: TcxStyleRepository
    Scalable = True
    Left = 3
    Top = 34
    PixelsPerInch = 96
    object StyleFontRed: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clRed
    end
    object StyleFontBlue: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clBlue
    end
    object StyleEven: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15334637
      TextColor = clBlack
    end
    object StyleOdd: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clWindowText
    end
    object StyleFontGray: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clGray
    end
    object StyleFontBlackBold: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15334637
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object StyleFontRedBold: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15334637
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      TextColor = clRed
    end
  end
  object EditStyleController: TcxEditStyleController
    Style.BorderStyle = ebsFlat
    Style.Color = clWindow
    Style.Font.Charset = HANGEUL_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = #47569#51008' '#44256#46357
    Style.Font.Style = []
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.NativeStyle = True
    Style.IsFontAssigned = True
    StyleDisabled.BorderColor = clWindowFrame
    StyleDisabled.Color = 14737632
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleDisabled.TextColor = clWindowText
    StyleFocused.BorderStyle = ebsFlat
    StyleFocused.Color = 8454143
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.BorderStyle = ebsFlat
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.NativeStyle = True
    Left = 37
    Top = 34
    PixelsPerInch = 96
  end
end
