inherited MemberVatInvoiceShowForm: TMemberVatInvoiceShowForm
  Caption = #49464#44552#44228#49328#49436' '#48156#54665#45236#50669' '#51312#54924
  ClientHeight = 606
  ClientWidth = 1067
  ExplicitWidth = 1083
  ExplicitHeight = 644
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1067
    ExplicitWidth = 1067
    inherited ButtonToolBar: TAdvToolBar
      Left = 473
      Width = 502
      ExplicitLeft = 473
      ExplicitWidth = 502
      inherited ButtonToolBarSeparator2: TAdvToolBarSeparator
        Left = 402
        ExplicitLeft = 402
      end
      inherited ButtonToolBarCloseButton: TAdvGlowButton
        Left = 412
        Width = 76
        ExplicitLeft = 412
        ExplicitWidth = 76
      end
      inherited ButtonToolBarPrintButton: TAdvGlowMenuButton
        Left = 222
        ExplicitLeft = 222
      end
      object ButtonToolBarDeleteButton: TAdvGlowButton
        Left = 322
        Top = 2
        Width = 80
        Height = 27
        AutoSize = True
        Caption = #54224#44592'(F4)'
        FocusType = ftHot
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 3
        OnClick = ButtonToolBarDeleteButtonClick
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
        Enabled = False
      end
      object ButtonToolBarEMailButton: TAdvGlowButton
        Left = 98
        Top = 2
        Width = 124
        Height = 27
        AutoSize = True
        Caption = 'E-mail '#51116#51204#49569'(F3)'
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        TabOrder = 4
        OnClick = ButtonToolBarEMailButtonClick
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
        Enabled = False
      end
    end
    inherited ConditionToolBar: TAdvToolBar
      Width = 1047
      ExplicitWidth = 1047
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        Visible = True
      end
      inherited ConditionToolBarDateLabel: TcxLabel
        Visible = True
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarToDateEdit: TcxDateEdit
        Visible = True
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        Visible = True
        AnchorX = 166
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        Visible = True
        AnchorX = 448
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Properties.Items.Strings = (
          #49464#44552#44228#49328#49436
          #44228#49328#49436
          '[ '#51204#52404' ]')
        TabOrder = 6
        Text = #49464#44552#44228#49328#49436
        Visible = True
        ExplicitWidth = 96
        Width = 96
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 641
        TabOrder = 2
        Visible = True
        ExplicitLeft = 641
        ExplicitWidth = 100
        Width = 100
      end
      inherited ConditionToolbarMonthRadioButton: TcxRadioButton
        TabOrder = 11
      end
      object ConditionToolBar1ComboBox: TcxComboBox
        Left = 741
        Top = 2
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Vert = taVCenter
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '[ '#51204#52404' ]'
          #49849#51064#45824#44592
          #49849#51064#50756#47308
          #49849#51064#44144#48512
          #51204#49569#49892#54056
          #54224#44592)
        Style.StyleController = EditStyleController
        TabOrder = 7
        Text = '[ '#51204#52404' ]'
        Height = 25
        Width = 121
      end
      object ConditionToolBar2ComboBox: TcxComboBox
        Left = 576
        Top = 2
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '['#51204#52404']'
          #47588#52636
          #47588#51077)
        Style.StyleController = EditStyleController
        TabOrder = 3
        Text = #47588#52636
        Height = 25
        Width = 65
      end
      object cxLabel1: TcxLabel
        Left = 862
        Top = 2
        AutoSize = False
        Caption = #52636#47141
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 27
        Width = 45
        AnchorX = 885
        AnchorY = 16
      end
      object ConditionPrintComboBox: TcxComboBox
        Left = 907
        Top = 2
        AutoSize = False
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #44277#44553#51088','#44277#44553#48155#45716#51088
          #44277#44553#48155#45716#51088
          #44277#44553#51088)
        Style.StyleController = EditStyleController
        TabOrder = 13
        Text = #44277#44553#51088','#44277#44553#48155#45716#51088
        Height = 25
        Width = 136
      end
    end
  end
  inherited Grid: TcxGrid
    Width = 1061
    Height = 535
    ExplicitWidth = 1061
    ExplicitHeight = 535
    inherited GridTableView: TcxGridTableView
      DataController.Data = {
        F90300000F00000044617461436F6E74726F6C6C6572312D0000001200000054
        6378537472696E6756616C75655479706512000000546378537472696E675661
        6C75655479706512000000546378537472696E6756616C756554797065120000
        00546378537472696E6756616C75655479706512000000546378537472696E67
        56616C75655479706512000000546378537472696E6756616C75655479706512
        000000546378537472696E6756616C7565547970651200000054637853747269
        6E6756616C75655479706512000000546378537472696E6756616C7565547970
        6512000000546378537472696E6756616C756554797065120000005463785374
        72696E6756616C75655479706512000000546378537472696E6756616C756554
        79706512000000546378537472696E6756616C75655479706512000000546378
        537472696E6756616C75655479706512000000546378537472696E6756616C75
        655479706512000000546378537472696E6756616C7565547970651200000054
        6378537472696E6756616C75655479706512000000546378537472696E675661
        6C75655479706512000000546378537472696E6756616C756554797065120000
        00546378537472696E6756616C75655479706512000000546378537472696E67
        56616C75655479706512000000546378537472696E6756616C75655479706512
        000000546378537472696E6756616C7565547970651200000054637853747269
        6E6756616C75655479706512000000546378537472696E6756616C7565547970
        6512000000546378537472696E6756616C756554797065120000005463785374
        72696E6756616C75655479706512000000546378537472696E6756616C756554
        79706512000000546378537472696E6756616C75655479706512000000546378
        537472696E6756616C75655479706512000000546378537472696E6756616C75
        655479706512000000546378537472696E6756616C7565547970651200000054
        6378537472696E6756616C75655479706512000000546378537472696E675661
        6C75655479706512000000546378537472696E6756616C756554797065120000
        00546378537472696E6756616C75655479706512000000546378537472696E67
        56616C75655479706512000000546378537472696E6756616C75655479706512
        000000546378537472696E6756616C7565547970651200000054637853747269
        6E6756616C75655479706512000000546378537472696E6756616C7565547970
        6512000000546378537472696E6756616C756554797065120000005463785374
        72696E6756616C75655479706512000000546378537472696E6756616C756554
        79706512000000546378537472696E6756616C75655479706500000000}
      object GridTableViewColumn1: TcxGridColumn
        DataBinding.FieldName = 'YMD_INVOICE'
      end
      object GridTableViewColumn2: TcxGridColumn
        DataBinding.FieldName = 'STORE_BIZNO'
      end
      object GridTableViewColumn3: TcxGridColumn
        DataBinding.FieldName = 'STORE_BOSS'
      end
      object GridTableViewColumn4: TcxGridColumn
        DataBinding.FieldName = 'STORE_NAME'
      end
      object GridTableViewColumn5: TcxGridColumn
        DataBinding.FieldName = 'STORE_UPTAE'
      end
      object GridTableViewColumn6: TcxGridColumn
        DataBinding.FieldName = 'STORE_JONGMOK'
      end
      object GridTableViewColumn7: TcxGridColumn
        DataBinding.FieldName = 'STORE_ADDRESS'
      end
      object GridTableViewColumn8: TcxGridColumn
        DataBinding.FieldName = 'COMPANY_NAME'
      end
      object GridTableViewColumn9: TcxGridColumn
        DataBinding.FieldName = 'COMPANY_BIZNO'
      end
      object GridTableViewColumn10: TcxGridColumn
        DataBinding.FieldName = 'COMPANY_BOSS'
      end
      object GridTableViewColumn11: TcxGridColumn
        DataBinding.FieldName = 'COMPANY_UPTAE'
      end
      object GridTableViewColumn12: TcxGridColumn
        DataBinding.FieldName = 'COMPANY_JONGMOK'
      end
      object GridTableViewColumn13: TcxGridColumn
        DataBinding.FieldName = 'COMPANY_ADDRESS'
      end
      object GridTableViewColumn14: TcxGridColumn
        DataBinding.FieldName = 'AMT_NET'
      end
      object GridTableViewColumn15: TcxGridColumn
        DataBinding.FieldName = 'AMT_TAX'
      end
      object GridTableViewColumn16: TcxGridColumn
        DataBinding.FieldName = 'AMT_TOTAL'
      end
      object GridTableViewColumn17: TcxGridColumn
        DataBinding.FieldName = 'EMAIL'
      end
      object GridTableViewColumn18: TcxGridColumn
        DataBinding.FieldName = 'ITEM1_DATE'
      end
      object GridTableViewColumn19: TcxGridColumn
        DataBinding.FieldName = 'ITEM1_TXT'
      end
      object GridTableViewColumn20: TcxGridColumn
        DataBinding.FieldName = 'ITEM1_QTY'
      end
      object GridTableViewColumn21: TcxGridColumn
        DataBinding.FieldName = 'ITEM1_PRICE'
      end
      object GridTableViewColumn22: TcxGridColumn
        DataBinding.FieldName = 'ITEM1_NET'
      end
      object GridTableViewColumn23: TcxGridColumn
        DataBinding.FieldName = 'ITEM1_TAX'
      end
      object GridTableViewColumn24: TcxGridColumn
        DataBinding.FieldName = 'ITEM2_DATE'
      end
      object GridTableViewColumn25: TcxGridColumn
        DataBinding.FieldName = 'ITEM2_TXT'
      end
      object GridTableViewColumn26: TcxGridColumn
        DataBinding.FieldName = 'ITEM2_QTY'
      end
      object GridTableViewColumn27: TcxGridColumn
        DataBinding.FieldName = 'ITEM2_PRICE'
      end
      object GridTableViewColumn28: TcxGridColumn
        DataBinding.FieldName = 'ITEM2_NET'
      end
      object GridTableViewColumn29: TcxGridColumn
        DataBinding.FieldName = 'ITEM2_TAX'
      end
      object GridTableViewColumn30: TcxGridColumn
        DataBinding.FieldName = 'ITEM3_DATE'
      end
      object GridTableViewColumn31: TcxGridColumn
        DataBinding.FieldName = 'ITEM3_TXT'
      end
      object GridTableViewColumn32: TcxGridColumn
        DataBinding.FieldName = 'ITEM3_QTY'
      end
      object GridTableViewColumn33: TcxGridColumn
        DataBinding.FieldName = 'ITEM3_PRICE'
      end
      object GridTableViewColumn34: TcxGridColumn
        DataBinding.FieldName = 'ITEM3_NET'
      end
      object GridTableViewColumn35: TcxGridColumn
        DataBinding.FieldName = 'ITEM3_TAX'
      end
      object GridTableViewColumn36: TcxGridColumn
        DataBinding.FieldName = 'ITEM4_DATE'
      end
      object GridTableViewColumn37: TcxGridColumn
        DataBinding.FieldName = 'ITEM4_TXT'
      end
      object GridTableViewColumn38: TcxGridColumn
        DataBinding.FieldName = 'ITEM4_QTY'
      end
      object GridTableViewColumn39: TcxGridColumn
        DataBinding.FieldName = 'ITEM4_PRICE'
      end
      object GridTableViewColumn40: TcxGridColumn
        DataBinding.FieldName = 'ITEM4_NET'
      end
      object GridTableViewColumn41: TcxGridColumn
        DataBinding.FieldName = 'ITEM4_TAX'
      end
      object GridTableViewColumn42: TcxGridColumn
        DataBinding.FieldName = 'AMT_CASH'
      end
      object GridTableViewColumn43: TcxGridColumn
        DataBinding.FieldName = 'AMT_MISU'
      end
      object GridTableViewColumn44: TcxGridColumn
        DataBinding.FieldName = 'DS_INVOICE'
      end
      object GridTableViewColumn45: TcxGridColumn
        DataBinding.FieldName = 'NO_APPROVAL'
      end
    end
    object GridBandedTableView: TcxGridBandedTableView [1]
      OnFocusedRecordChanged = GridBandedTableViewFocusedRecordChanged
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewNetAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewTaxAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewTotalAmt
        end
        item
          Format = ',0 '#44148
          Kind = skCount
          Column = GridBandedTableViewDate
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.BandHeaders = False
      Styles.ContentEven = StyleEven
      Bands = <
        item
          Caption = #48156#54665#51068#51088
          Width = 95
        end
        item
          Caption = #44396#48516
          Width = 185
        end
        item
          Width = 242
        end
        item
          Width = 207
        end
        item
          Width = 135
        end
        item
          Width = 146
        end
        item
          Width = 217
        end>
      object GridBandedTableViewDate: TcxGridBandedColumn
        Tag = 98
        Caption = #48156#54665#51068#51088
        DataBinding.FieldName = 'YMD_TAX'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableViewTaxNo: TcxGridBandedColumn
        Tag = 98
        Caption = #44228#49328#49436#44396#48516
        DataBinding.FieldName = 'DS_INVOICE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Width = 69
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 1
      end
      object GridBandedTableViewBillNo: TcxGridBandedColumn
        Tag = 98
        Caption = #51204#54364#48264#54840
        DataBinding.FieldName = 'NO_TAX'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableViewApprovalNo: TcxGridBandedColumn
        Tag = 98
        Caption = #49849#51064#48264#54840
        DataBinding.FieldName = 'APPROVAL_NO'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Width = 177
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableViewCompanyName: TcxGridBandedColumn
        Tag = 98
        Caption = #54924#50896#47749
        DataBinding.FieldName = 'NM_TRDPL'
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 1
      end
      object GridBandedTableViewBizNo: TcxGridBandedColumn
        Tag = 98
        Caption = #49324#50629#51088#48264#54840
        DataBinding.FieldName = 'NO_BIZER'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableViewCeo: TcxGridBandedColumn
        Tag = 98
        Caption = #45824#54364#51088
        DataBinding.FieldName = 'NM_BOSS'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 1
      end
      object GridBandedTableViewUptae: TcxGridBandedColumn
        Tag = 98
        Caption = #50629#53468
        DataBinding.FieldName = 'NM_UPTAE'
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object GridBandedTableViewJongMok: TcxGridBandedColumn
        Tag = 98
        Caption = #51333#47785
        DataBinding.FieldName = 'NM_JONGMOK'
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object GridBandedTableViewNetAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #44277#44553#44032#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Width = 114
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableViewTaxAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #48512#44032#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TAX'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Width = 93
        Position.BandIndex = 3
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableViewTotalAmt: TcxGridBandedColumn
        Tag = 98
        Caption = #54633#44228#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TOT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 1
      end
      object GridBandedTableViewStatus: TcxGridBandedColumn
        Tag = 98
        Caption = #51204#49569#49345#53468
        DataBinding.FieldName = 'DS_STATUS'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taLeftJustify
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Width = 59
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 1
      end
      object GridBandedTableViewAddress: TcxGridBandedColumn
        Tag = 98
        Caption = #51452'      '#49548
        DataBinding.FieldName = 'ADDRESS'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Focusing = False
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.LineCount = 2
        Position.RowIndex = 0
      end
      object GridBandedTableViewType: TcxGridBandedColumn
        Tag = 98
        Caption = #44396#48516
        DataBinding.FieldName = 'DS_TAX'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Width = 65
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableViewEMail: TcxGridBandedColumn
        Tag = 98
        Caption = 'E-Mail'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableViewTelNo: TcxGridBandedColumn
        Tag = 98
        Caption = #50672#46973#52376
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 1
      end
      object GridBandedTableViewYnDelete: TcxGridBandedColumn
        Tag = 98
        Options.Focusing = False
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object GridBandedTableViewProviderBizNo: TcxGridBandedColumn
        Tag = 98
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object GridBandedTableViewProviderCompany: TcxGridBandedColumn
        Tag = 98
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object GridBandedTableViewProviderCeo: TcxGridBandedColumn
        Tag = 98
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object GridBandedTableViewProviderUptae: TcxGridBandedColumn
        Tag = 98
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object GridBandedTableViewProviderJonmok: TcxGridBandedColumn
        Tag = 98
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object GridBandedTableViewProviderAddress: TcxGridBandedColumn
        Tag = 98
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object GridBandedTableViewDsInvoice: TcxGridBandedColumn
        Tag = 98
        Visible = False
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
    end
    object GridTableView1: TcxGridTableView [2]
      Tag = 99
      OnFocusedRecordChanged = GridTableView1FocusedRecordChanged
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridTableView1NetAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridTableView1TaxAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Position = spFooter
          Column = GridTableView1TotalAmt
        end
        item
          Format = ',0 '#44148
          Kind = skCount
          Position = spFooter
          Column = GridTableView1CompanyName
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableView1TotalAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableView1TaxAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableView1NetAmt
        end
        item
          Format = ',0 '#44148
          Kind = skCount
          Column = GridTableView1CompanyName
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupFooters = gfAlwaysVisible
      Styles.ContentEven = StyleEven
      object GridTableView1Date: TcxGridColumn
        Caption = #48156#54665#51068#51088
        DataBinding.FieldName = 'YMD_TAX'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 107
      end
      object GridTableView1BillNo: TcxGridColumn
        Caption = #51204#54364#48264#54840
        DataBinding.FieldName = 'NO_TAX'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 71
      end
      object GridTableView1TaxType: TcxGridColumn
        Caption = #44228#49328#49436#44396#48516
        DataBinding.FieldName = 'DS_TAX'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 84
      end
      object GridTableView1Status: TcxGridColumn
        Caption = #49345#53468
        DataBinding.FieldName = 'DS_STATUS'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 82
      end
      object GridTableView1CompanyCode: TcxGridColumn
        Caption = #47588#52636#52376#53076#46300
        DataBinding.FieldName = 'CD_MEMBER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 109
      end
      object GridTableView1CompanyName: TcxGridColumn
        Caption = #47588#52636#52376#47749
        DataBinding.FieldName = 'NM_MEMBER'
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 168
      end
      object GridTableView1NetAmt: TcxGridColumn
        Caption = #44277#44553#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 109
      end
      object GridTableView1TaxAmt: TcxGridColumn
        Caption = #48512#44032#49464#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_VAT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 90
      end
      object GridTableView1TotalAmt: TcxGridColumn
        Caption = #48156#54665#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TOT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 97
      end
      object GridTableView1BizNo: TcxGridColumn
        Caption = #49324#50629#51088#48264#54840
        DataBinding.FieldName = 'NO_BIZER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object GridTableView1Ceo: TcxGridColumn
        Caption = #45824#54364#51088
        DataBinding.FieldName = 'NM_BOSS'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 97
      end
      object GridTableView1Uptae: TcxGridColumn
        Caption = #50629#53468
        DataBinding.FieldName = 'NM_UPTAE'
        HeaderAlignmentHorz = taCenter
      end
      object GridTableView1JongMok: TcxGridColumn
        Caption = #51333#47785
        DataBinding.FieldName = 'NM_JONGMOK'
        HeaderAlignmentHorz = taCenter
      end
      object GridTableView1Addr: TcxGridColumn
        Caption = #51452#49548
        DataBinding.FieldName = 'ADDR'
        HeaderAlignmentHorz = taCenter
      end
      object GridTableView1Item: TcxGridColumn
        Caption = #54408#47785
        DataBinding.FieldName = 'ITEM1'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 159
      end
      object GridTableView1EMail: TcxGridColumn
        Caption = 'E-Mail'
        DataBinding.FieldName = 'E-Mail'
        HeaderAlignmentHorz = taCenter
      end
      object GridTableView1Column14: TcxGridColumn
        Caption = #51204#54868#48264#54840
        DataBinding.FieldName = 'TEL_INVOICE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
      end
      object GridTableView1DsInvoice: TcxGridColumn
        Caption = #50689#49688#44396#48516
        DataBinding.FieldName = 'DS_INVOICE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
      end
    end
    inherited GridLevel: TcxGridLevel
      GridView = GridBandedTableView
    end
    object GridLevel1: TcxGridLevel
      GridView = GridTableView1
    end
  end
  inherited Query: TUniQuery
    Left = 118
    Top = 90
  end
  inherited SQL: TUniSQL
    Left = 153
    Top = 90
  end
  inherited EditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 45
    Top = 90
    PixelsPerInch = 96
  end
  inherited ToolBarStyler: TAdvToolBarOfficeStyler
    Left = 80
    Top = 90
  end
  inherited StyleRepository: TcxStyleRepository
    Left = 11
    Top = 90
    PixelsPerInch = 96
  end
  inherited Exec_Timer: TTimer
    Left = 221
    Top = 90
  end
  inherited ButtonToolBarPrintButtonImageList: TImageList
    Left = 253
    Top = 90
    Bitmap = {
      494C0101040008008C0010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000300000022000000100000000C0000
      000000000000000000000000000000000000000000000000000102010136110E
      0E74120F0F770B090969040404550302023B0101012700000012000000050000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000020000
      00080000001000000029000000330000000B0000000000000000000000030000
      0003000000010000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00020000000000000000000000000000002704050568030302520806064F0303
      032B0000000E00000001000000000000000000000000000000061B16167ACEB2
      B4F5FDDDDFFFF2D2D4FFDEBFC2FFB1989AF3706060D33B3232AE1D1819850907
      07580101012B0000000900000000000000000000000000000001000000030000
      00060000000B000000140000002000000030010101450303035B0A0A0A751717
      18902A2A2CA9525454CE242625B40000002000000000000000040000002C0000
      0033000000080000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000010101340808
      087C0202025F0000002A0101013D434646BBA5A29BF19D9689E9B6B4B2E88987
      84CE494542A41C1A19700C0B0A480201011C00000000000000000000001B1811
      128C554344C6897071DEE8D0D1FCFFF0F0FFFFE9EAFFFFE3E6FFFBDADCFFDCC3
      C5FF857A7AD92D27279E000000330000000505130962070D096F070707780F10
      0F881B1D1C9C292C2AAE464547C26C6B6ED6919697E8B9C0C0F9CDD7D5FFD2DB
      D5FFCDE1D6FFFFFFFFFF737575D7000000270000000000000006010101380202
      0243000000100000000300000000000000000000000000000000000000000000
      000000000000000000020000000300000000000000030000004B313131D48183
      83FF5D5D5DF7242424CF555656DFDFCFBDFFFFE8C7FFFFFFF0FFFFFFFFFFFFFF
      FFFFFFFFFFFFF0F2F4FFC1B9B3F70E0C0B61000000000000000A131010764D3E
      41B73E2A2EAB442F34BAC3B2B8F5F6E9ECFFF4D6D7FFF6D1D3FFC3A2A3EF947F
      80D9C0AFB1E8C8ADAFF5080607640000000C5A9B71EFB0C8BAFFC9CCCBFFCEDA
      D5FFD7E5DEFFECFAF6FFD6EBDEFFBDD9C5FFACD3B9FFD8EEE1FFA8D2B3FF4F92
      56FF347939FFB1D4B9FF828486DE0000002E000000000000000E101010702D2E
      2E9410101059040404330101011D000000110000000800000002000000000000
      0000000000030000002A0000002B000000030000003E373635DD9F9FA1FFC8C9
      CAFFC7C8C7FFB0B2B4FF949393FF9F8773FFB89D85FECCB59FFEE0C8B1FEF4E3
      D0FEFFF6E5FFF1E7E0FF474747B60000002D0000000000000020866D71DAFDF8
      EFFFABC2B2F7A2A19AEEDDBDC1FCECCFDCFFECCFDDFFE8C7D4FF5F4B51D10B07
      07770604045E020101370000000B0000000055926AEBC7DFD1FFE7FAF1FF79B9
      90FF68A97CFFBBD8C6FF7EB88FFF348847FF2C7E3EFF8DB596FF89BA93FF297E
      32FF33823AFFB0D5B8FF9B9F9FEA0101013B00000000010101235A5B5BBED3D3
      D3F5929092DC5F5F61BE3B3C3D9B1F2020740E0E0E52040404330101011C0000
      0010010100310303039B0000006A0000000609090970939594FFC3C6C5FFD1D1
      D2FFDEDFDFFFD9DEDFFFBEC1C3FFABB0B4FFA6B0B4FFA1A19EFFA29B95FFA191
      80FFA38F7BFF7B7170FD07070871000000000000000001000131997C83DEE3D0
      ABFF6F9A49FF97A852FFF2A55BFFF4AA74FFF2BA98FFF0C2B5FFC1A1A2F27060
      68CD302F31A811111083030202430000001C407E54E096BCA3FFC9E8D7FF4AA1
      68FF42975EFFA8CAB5FFABD5B8FF8DCA9DFF97CBA4FFB9D7C4FFD4EADDFFB4D3
      BCFFABCAB4FFDCF0E5FFACB3B3F302020247000000000505053C999599DFEEE4
      D9FFC3D9B1FFD2DFC9FFD7CFCEFBB5B2B1ED8C8B8AD8616161BA343535901616
      16731D1D1DAE171717C401010145000000030A0A0A6BACB0AFFED5DAD9FFE7E7
      E7FEEEF5F8FEDED7D4FEBF7857FEB36946FEB58A79FEBBB1AEFEB4B5B5FEB6B3
      BCFEA2A7A4FE6AA869FF111B119E0000000C0000000205030343AC9095EAFBBC
      95FFBEAE76FFBCA761FFDF7B11FFE38017FFE78923FFEC9033FFF59E4BFFFEB2
      70FFEDBD86FFEDD8BFFF3F3438B20603045D3E7E53E2699E79FFEAF5ECFFDBEF
      E3FFDCEEE3FFF6FBF9FFE2ECE8FF9DA7A1FF9EA9A2FFF1FAF9FFC6DECEFF6B9E
      74FF46834EFF8FB696FFC1C8C7FC04040456000000000F0F105EC6BDC0F3C9B4
      93FF8C9F50FFB0A879FFDFB1A7FFE1C3BDFFDDCFCCFFDAD4D2FEB7B6B5F46F70
      70EB7D7E7EF9767676D50C0C0C52000000040606065EB7BBB9FBF5F7F7FFF6F6
      F7FFF9FFFFFFEBC7ACFFD36625FFCA5716FFC25319FFBB5625FFB4572AFFBE87
      71FFD6D6D6FFD3F1D9FF2126219D0000000C000000060B090954C7A8AAF6FAB8
      8DFFE9C79BFFE5BE8CFFD97A1BFFDA7917FFDA7A18FFDC7C18FFDD801AFFE280
      16FFE98516FFFFD0A1FF42393DB10403035748875DE2649F7AFFE8F1EAFFD8E6
      DFFFA1C6B0FFA2C7B0FF527157FF141B14FF49684FFFDBEAE1FFBDDAC4FF4593
      52FF34823CFF85B58CFFCED9D6FF070707630000000525262788E3D6D4FEAD80
      5FFFA56D43FFC47C61FFCF8D7DFFD5A89FFFDFC3BDFFDDC4BEFFBFAAA5FF9E85
      80FFB8A29CFFDFDAD9F91C1C1C7200000006010202478A8B8BE4EFF0F0FFE3EC
      F2FFE7DCD3FEE8995EFEE88336FEE5853EFEE17E39FEDA7430FECF5A13FEC96C
      36FEEAE0D9FFFFFFFFFF1C1B1C8A000000050000000A0D0B0C63F2C7C4FFDAA9
      77FF84987EFFAB9869FFDB7B1DFFDD7D1DFFDD8223FFDE8628FFDE8A2CFFDC86
      26FFE08B27FFFFCDA4FF2F282BA101010141508E67E270AB8AFFDDECE4FFD8E9
      E0FF7ABB92FF338450FF002F05FF4B6C53FFCCE0D2FFDDEDE3FFDFF0E7FFC3DE
      CAFFBBD5C2FFD1E7DAFFDCE8E4FF0A0A0A72000000124C4E4EAFE1CAC3FFA657
      42FFB35744FFBB6C5AFFC3897AFFDBAA9EFFE9BFB5FFDEB0A4FFBD897CFFA05E
      4FFFB8887AFFABA3A2E40A0A0B4700000003000000070304044A52575BC7C9CA
      CAFFCC8C66FFCC6524FFD5712EFFDE7934FFE58138FFEB873AFFEE8739FFF2BE
      98FFFFFFFFFFD9DBDCFB06060658000000000000001314111278FFD1C7FFC8A9
      7EFF42BECCFF64B7B6FFD4822AFFE28220FFE08A2DFFE29134FFE4973AFFE294
      34FFEA9E3DFFFFD4B3FF231E20930000003158946DE274AC8BFFCBE2D4FFFFFF
      FFFFD5E8DEFF2A734BFF024C1BFF639875FFD9E4DCFFFEFEFFFFDEEDE5FF8CB5
      94FF4F8A5AFF679B70FFD5E6DDFF11111283010101268D9090D7CFAA9FFF9E45
      30FFA54D38FFAA6655FFC79285FFE1AEA1FFE1B4AAFFD39F93FFBD8272FFA567
      56FFCCA79EFF575454B10202022000000001000000000000000008060548B99C
      81EBE0C1A4FFD5A586FFCF936DFFC68155FFC67544FFCE7237FFD79363FFECE5
      E0FFECEDEEFF333232A200000013000000000000002A241F2191FFDAD2FFD89D
      62FFB89F75FFC29456FFDA8527FFE18B2CFFE39438FFE69C40FFE9A347FFE7A0
      42FFF1AF52FFFCD7BCFF171416820000001F659E7AE586B498FFC7E0D0FFFAFC
      FBFF75AE93FF096839FF64A481FF5EA874FF5C986EFFC9DAD0FFDFEDE4FF67A9
      75FF3D8E4AFF6BA473FFDEF0E6FF1D1D1D980606064BD1CECEF7AF7364FF9838
      20FFAB543EFFBD7967FFD6AA9FFFECC6BCFFEAC7BEFFDBB1A6FFCB9C90FFC9A4
      9AFFD5C9C6FA2626267C0000000E0000000000000000000000000C070344CDAE
      93E9FFFEECFFFFEDD3FFFCE4CAFFEDD9BEFFE3C8AEFF705A4ECE1D1E1E872A2D
      2F952424248D00000021000000000000000002010140352F31A1FFDACEFFDD8D
      47FFE19353FFE48D40FFE08625FFE29336FFE59D43FFE9A64DFFEDAE56FFEBAD
      51FFF8C16CFFF5DBC7FF0F0E0F74000000125B906ED9A8C6B4FFC5DDCEFFEFF9
      F6FF6FB393FF80BBA0FFF2FAF5FFD1EBDAFFA7CFB4FFBCD6C5FFEAF6F2FFDBEF
      E2FFD4EADBFFC1D0C7EEBBBFBDDD1414146B20212182ECE5E3FFA1695BFF9D4A
      35FFB56350FFCD8571FFD5A79AFFE0C1BAFFE8CBC4FFDEBCB4FFD0AAA1FFDBC2
      BBFFA09C9CDE0D0D0D4A0000000600000000000000000201001D83644BC0FFFF
      FFFFFFFFFFFFFFF8EEFFFFF3E3FFFFF8E7FFCCB499E606050434000000010000
      0007000000030000000000000000000000000B090A63544F52B7FFDDCDFFDA7E
      2EFFDA8C35FFD88F3CFFDA7E15FFE08D24FFE49A35FFE9A745FFEEB253FFEEB4
      53FFFECF7CFFEBD9CBFF0A090A650000000A1F472C9DC9DCD1FFC7D9CEFFE1F1
      E8FFE7F4ECFFEFF5F2FFE9F1EDFFE6F0ECFFE5EFEBFFD5E8DEFFC8DFD3FFDFEB
      E6FFB8D0C0FC353F3A8A0A0A0A350000000F13131363989694CEA89F9AE6C5AE
      A7FACFAFA6FFD1A99FFFD2ABA1FFCBACA4FFCAADA5FFCFADA4FFCAA69EFFDBCC
      C8FF5E5E5EB40303032700000002000000000000000003020124644E3FABA08F
      82D2BCAC9FE2E0DAD5F3FEFBF9FFFEFCFAFF4C37269600000000000000000000
      000000000000000000000000000000000000100E0E73615C5EC8FFF6F3FFFFCB
      ABFFFDC59AFFFABE8BFFF8B878FFF6B771FFF3B96EFFF3BD6DFFF3C06DFFF3BE
      5EFFFFDC8BFFD6CCC2FD0B090A5D000000080108033A7FAF8EE8EEEAEEFFD2DF
      D6FFCEDED2FFCADCCFFFBFD7C8FFBFD7C8FFC0D6C8FFBED5C7FFB9D3C2FFD0DE
      D5FF9CBFA9F90A120C5900000000000000000000000F09090934171717522C2D
      2D764E4E4E9A767474BA9B9593D6C2BAB7F3D2C5C0FFD3BFB9FFD5C0BCFFD9D4
      D4F92C2C2C820000001200000000000000000000000000000004010100180503
      022909050238190F075C46332493655242AB0703013200000000000000000000
      000000000000000000000000000000000000000000240A08084F2F292B8F3D36
      39AA63555AC1867778D7B09A9DEDE2C3C1FFF5D5CFFFFEDDD4FFFFE3D5FFFFE4
      CAFFFFFEE6FFBCB2B1F50504044A000000030000000205160A5B7EAD8DE6E7EC
      E9FFEDEBECFFE8EAE7FFE9EBE8FFE9EBE9FFE9ECE9FFEAEDEBFFEAEDEBFFFCF9
      FCFFDAE9E2FD08150B6600000000000000000000000000000002000000040000
      00070000000F0303031E090909361A1A1A593434347E595959A3A0A0A0D28B8C
      8CCC0E0D0D4C0000000700000000000000000000000000000000000000000000
      0000000000000000000E0C0602411A120B5C0100001400000000000000000000
      0000000000000000000000000000000000000000000000000000000000070000
      00110000001D020202290605053508070743050405550B090A62110E0F6E1714
      157A1B1819810907085B0000000F000000000000000000000001010804392045
      2C9B699878DA86B093E682AA8EE482A78EE480A78CE47FA68BE47DA188E290B3
      9BEC7BA788EB0411085D00000000000000000000000000000000000000000000
      000000000000000000000000000000000002000000110C0C0C3E424343884041
      41910404042D000000030000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  inherited ButtonToolBarPrintButtonPopupMenu: TPopupMenu
    Left = 287
    Top = 90
    object ButtonToolBarPrintButtonPopupMenuTax: TMenuItem
      Caption = #49464#44552#44228#49328#49436#52636#47141
      OnClick = ButtonToolBarPrintButtonPopupMenuTaxClick
    end
  end
  inherited dxComponentPrinter: TdxComponentPrinter
    Left = 319
    Top = 90
    inherited dxComponentPrinter1Link1: TdxGridReportLink
      PrinterPage.PageHeader.CenterTitle.Strings = (
        #49464#44552#44228#49328#49436' '#48156#54665#45236#50669' '#51312#54924
        '')
      ReportDocument.CreationDate = 40490.661594502320000000
      BuiltInReportLink = True
    end
  end
  object FastReportDataSet: TfrxUserDataSet
    UserName = 'FastReportDataSet'
    OnCheckEOF = FastReportDataSetCheckEOF
    Fields.Strings = (
      'STORE_NAME'
      'STORE_BIZNO'
      'STORE_BOSS'
      'STORE_ADDRESS'
      'STORE_UPTAE'
      'STORE_JONGMOK'
      'COMPANY_NAME'
      'COMPANY_BIZNO'
      'COMPANY_BOSS'
      'COMPANY_ADDRESS'
      'COMPANY_UPTAE'
      'COMPANY_JONGMOK'
      'ITEM1_DATE'
      'ITEM1_TXT'
      'ITEM1_QTY'
      'ITEM1_PRICE'
      'ITEM1_NET'
      'ITEM1_TAX'
      'ITEM2_DATE'
      'ITEM2_TXT'
      'ITEM2_QTY'
      'ITEM2_PRICE'
      'ITEM2_NET'
      'ITEM2_TAX'
      'ITEM3_DATE'
      'ITEM3_TXT'
      'ITEM3_QTY'
      'ITEM3_PRICE'
      'ITEM3_NET'
      'ITEM3_TAX'
      'ITEM4_DATE'
      'ITEM4_TXT'
      'ITEM4_QTY'
      'ITEM4_PRICE'
      'ITEM4_NET'
      'ITEM4_TAX'
      'NO_INVOICE'
      'AMT_TOTAL'
      'AMT_CASH'
      'AMT_MISU'
      'AMT_NET'
      'AMT_TAX'
      'DS_INVOICE'
      'YMD_INVOICE'
      'NO_APPROVAL'
      'EMAIL')
    OnNewGetValue = FastReportDataSetNewGetValue
    Left = 47
    Top = 199
  end
  object ReceiveReport: TfrxReport
    Version = '4.12'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbZoom, pbNavigator, pbExportQuick, pbNoFullScreen]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40296.586905231500000000
    ReportOptions.LastChange = 40547.850942557900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      'begin'
      ''
      'end.')
    Left = 146
    Top = 135
    Datasets = <
      item
        DataSet = FastReportDataSet
        DataSetName = 'FastReportDataSet'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page: TfrxReportPage
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 25.900000000000000000
      RightMargin = 25.900000000000000000
      TopMargin = 22.000000000000000000
      BottomMargin = 22.000000000000000000
      object TaxData: TfrxMasterData
        Height = 3.779529999999981000
        Top = 18.897650000000000000
        Width = 597.921646000000000000
        DataSet = FastReportDataSet
        DataSetName = 'FastReportDataSet'
        RowCount = 1
        object Line16: TfrxLineView
          Left = 801.362710000000000000
          Height = 60.472480000000000000
          ShowHint = False
          Frame.Color = clBlue
          Frame.Typ = [ftLeft]
        end
      end
      object DetailData1: TfrxDetailData
        Height = 463.882190000000000000
        Top = 45.354360000000000000
        Width = 597.921646000000000000
        DataSet = FastReportDataSet
        DataSetName = 'FastReportDataSet'
        RowCount = 0
        object Shape17: TfrxShapeView
          Left = 1.196845510000000000
          Width = 596.787401570000000000
          Height = 430.086890000000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Shape32: TfrxShapeView
          Left = 417.968770000000000000
          Top = 25.102364649999960000
          Width = 179.905511810000000000
          Height = 22.677165350000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object SaleNotAmtCaptionLabel: TfrxMemoView
          Left = 55.133890000000000000
          Top = 262.023809999999800000
          Width = 204.094488190000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #54408'      '#47785'  /  '#44508'      '#44201)
          ParentFont = False
        end
        object SaleVatAmtCaptionLabel: TfrxMemoView
          Left = 373.929194880000000000
          Top = 262.023809999999800000
          Width = 93.732293230000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #44277#44553#44032#50529)
          ParentFont = False
        end
        object SalePlanAmtCaptionLabel: TfrxMemoView
          Left = 467.661720000000000000
          Top = 262.023809999999800000
          Width = 77.102359760000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #49464'  '#50529)
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 259.338577800000000000
          Top = 262.023809999999800000
          Width = 40.062992130000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #49688#47049)
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 299.362400000000000000
          Top = 262.023809999999800000
          Width = 74.834643230000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #45800#44032)
          ParentFont = False
        end
        object SaleAmtCaptionLabel: TfrxMemoView
          Left = 1.196845510000000000
          Top = 262.023809999999800000
          Width = 54.425196850000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #50900'  '#51068)
          ParentFont = False
        end
        object Memo75: TfrxMemoView
          Left = 544.692908500000100000
          Top = 262.023809999999800000
          Width = 52.913385830000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #48708' '#44256)
          ParentFont = False
        end
        object Shape12: TfrxShapeView
          Left = 20.078522910000000000
          Top = 156.629923699999900000
          Width = 279.684990550000000000
          Height = 31.236240000000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Shape7: TfrxShapeView
          Left = 1.196845510000000000
          Top = 47.606301649999880000
          Width = 18.897650000000000000
          Height = 140.220472440000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Shape8: TfrxShapeView
          Left = 20.094483310000000000
          Top = 47.606301649999880000
          Width = 279.684990550000000000
          Height = 37.795273150000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Memo17: TfrxMemoView
          Left = 1.236240000000000000
          Top = 75.063080000000130000
          Width = 18.897650000000000000
          Height = 98.267780000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #44277
            ''
            #44553
            ''
            #51088)
          ParentFont = False
        end
        object Shape9: TfrxShapeView
          Left = 20.078522910000000000
          Top = 85.574805590000080000
          Width = 279.684990550000000000
          Height = 34.015770000000010000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Memo19: TfrxMemoView
          Left = 19.574830000000000000
          Top = 85.842609999999910000
          Width = 36.574830000000000000
          Height = 20.677180000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #49345'  '#54840)
          ParentFont = False
        end
        object Shape10: TfrxShapeView
          Left = 20.078522910000000000
          Top = 119.598427639999800000
          Width = 279.684990550000000000
          Height = 37.039370080000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Memo20: TfrxMemoView
          Left = 19.574830000000000000
          Top = 128.417439999999800000
          Width = 34.574830000000000000
          Height = 20.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #51452'  '#49548)
          ParentFont = False
        end
        object Shape11: TfrxShapeView
          Left = 203.551330000000000000
          Top = 85.574805590000080000
          Width = 15.118120000000000000
          Height = 34.015745590000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Memo22: TfrxMemoView
          Left = 202.771800000000000000
          Top = 84.740260000000030000
          Width = 15.118120000000000000
          Height = 32.236240000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #49457
            #47749)
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 18.897650000000000000
          Top = 160.756029999999800000
          Width = 36.354360000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #50629'  '#53468)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 19.574830000000000000
          Top = 49.283550000000010000
          Width = 37.795300000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #46321'  '#47197
            #48264'  '#54840)
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 55.708720000000000000
          Top = 48.401669999999870000
          Height = 139.063080000000000000
          ShowHint = False
          Frame.Color = clBlue
          Diagonal = True
        end
        object StoreBizNoText: TfrxMemoView
          Left = 62.322829760000000000
          Top = 52.370129999999920000
          Width = 149.960730000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'STORE_BIZNO'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."STORE_BIZNO"]')
          ParentFont = False
        end
        object StoreNameText: TfrxMemoView
          Left = 59.322829760000000000
          Top = 88.606369999999960000
          Width = 136.063080000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'STORE_NAME'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."STORE_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object StoreBossText: TfrxMemoView
          Left = 220.464750000000000000
          Top = 88.047309999999910000
          Width = 75.149660000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'STORE_BOSS'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."STORE_BOSS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object StoreAddressText: TfrxMemoView
          Left = 59.322829760000000000
          Top = 123.842609999999800000
          Width = 238.110390000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'STORE_ADDRESS'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."STORE_ADDRESS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object StoreUptaeText: TfrxMemoView
          Left = 59.267780000000000000
          Top = 162.637909999999700000
          Width = 120.944960000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'STORE_UPTAE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."STORE_UPTAE"]')
          ParentFont = False
        end
        object Shape2: TfrxShapeView
          Left = 183.448980000000000000
          Top = 156.858380000000000000
          Width = 15.897650000000000000
          Height = 30.992125980000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Shape3: TfrxShapeView
          Left = 299.480288110000000000
          Top = 47.606301649999880000
          Width = 18.897637800000000000
          Height = 140.220472440000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Shape4: TfrxShapeView
          Left = 318.157700000000000000
          Top = 47.653572599999860000
          Width = 280.062992130000000000
          Height = 37.795275590000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Shape5: TfrxShapeView
          Left = 318.220452910000000000
          Top = 156.251970939999900000
          Width = 279.685039370000000000
          Height = 31.370078740000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Memo3: TfrxMemoView
          Left = 301.055350000000000000
          Top = 75.504020000000080000
          Width = 17.677180000000000000
          Height = 98.267780000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #44277
            #44553
            #48155
            #45716
            #51088)
          ParentFont = False
        end
        object Shape6: TfrxShapeView
          Left = 318.220452910000000000
          Top = 85.574805590000080000
          Width = 279.685039370000000000
          Height = 34.015748030000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Memo16: TfrxMemoView
          Left = 317.716760000000000000
          Top = 85.283550000000090000
          Width = 33.574830000000000000
          Height = 20.677180000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #49345'  '#54840)
          ParentFont = False
        end
        object Shape13: TfrxShapeView
          Left = 318.220452910000000000
          Top = 119.417325280000000000
          Width = 279.685039370000000000
          Height = 37.039370080000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Memo24: TfrxMemoView
          Left = 317.716760000000000000
          Top = 127.858380000000000000
          Width = 34.574830000000000000
          Height = 20.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #51452'  '#49548)
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 317.716760000000000000
          Top = 101.181199999999900000
          Width = 36.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '('#48277#51064#47749')')
          ParentFont = False
        end
        object Shape14: TfrxShapeView
          Left = 501.457020000000000000
          Top = 85.504020000000060000
          Width = 15.118120000000000000
          Height = 34.015770000000010000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Memo26: TfrxMemoView
          Left = 500.590910000000000000
          Top = 84.842609999999910000
          Width = 15.118120000000000000
          Height = 34.771653540000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clFuchsia
          Memo.UTF8W = (
            #49457
            #47749)
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 318.039580000000000000
          Top = 161.196969999999800000
          Width = 36.354360000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #50629'  '#53468)
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 317.716760000000000000
          Top = 49.724489999999960000
          Width = 34.015770000000010000
          Height = 32.015770000000010000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #46321'  '#47197
            #48264'  '#54840)
          ParentFont = False
        end
        object Line4: TfrxLineView
          Left = 353.850650000000000000
          Top = 46.842609999999820000
          Height = 163.275590550000000000
          ShowHint = False
          Frame.Color = clBlue
          Diagonal = True
        end
        object CompanyBizNo: TfrxMemoView
          Left = 358.960603070000000000
          Top = 50.811069999999870000
          Width = 153.740260000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'COMPANY_BIZNO'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."COMPANY_BIZNO"]')
          ParentFont = False
        end
        object CompanyNameText: TfrxMemoView
          Left = 356.071120000000000000
          Top = 87.488250000000090000
          Width = 139.842610000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'COMPANY_NAME'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."COMPANY_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object CompanyBossText: TfrxMemoView
          Left = 516.913730000000000000
          Top = 88.708720000000080000
          Width = 78.929190000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'COMPANY_BOSS'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."COMPANY_BOSS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object CompanyAddressText: TfrxMemoView
          Left = 355.960603070000000000
          Top = 120.724489999999900000
          Width = 238.110390000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'COMPANY_ADDRESS'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clFuchsia
          Memo.UTF8W = (
            '[FastReportDataSet."COMPANY_ADDRESS"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object CompanyUptaeText: TfrxMemoView
          Left = 355.960603070000000000
          Top = 161.078849999999900000
          Width = 120.944960000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'COMPANY_UPTAE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."COMPANY_UPTAE"]')
          ParentFont = False
        end
        object Shape15: TfrxShapeView
          Left = 480.031850000000000000
          Top = 156.299207719999700000
          Width = 15.897650000000000000
          Height = 31.236240000000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Memo42: TfrxMemoView
          Left = 183.110390000000000000
          Top = 154.858380000000000000
          Width = 15.496060550000000000
          Height = 32.236240000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #51333
            #47785)
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 480.031850000000000000
          Top = 154.637909999999700000
          Width = 15.496060550000000000
          Height = 33.236240000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Memo.UTF8W = (
            #51333
            #47785)
          ParentFont = False
        end
        object Line6: TfrxLineView
          Left = 183.653680000000000000
          Top = 187.315089999999900000
          Height = 49.133890000000000000
          ShowHint = False
          Frame.Color = clBlue
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          Left = 55.811070000000000000
          Top = 186.874150000000000000
          Height = 75.590600000000000000
          ShowHint = False
          Frame.Color = clBlue
          Frame.Typ = [ftLeft]
        end
        object Memo71: TfrxMemoView
          Left = 2.000000000000000000
          Top = 187.653680000000000000
          Width = 51.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #51089#49457#51068#51088)
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Left = 64.472480000000000000
          Top = 188.874149999999900000
          Width = 104.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #44277'  '#44553'  '#44032'  '#50529)
          ParentFont = False
        end
        object Memo73: TfrxMemoView
          Left = 192.874150000000000000
          Top = 188.653679999999900000
          Width = 96.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #49464'      '#50529)
          ParentFont = False
        end
        object Line8: TfrxLineView
          Left = 0.440940000000000000
          Top = 210.110389999999800000
          Width = 597.165740000000000000
          ShowHint = False
          Frame.Color = clBlue
          Frame.Typ = [ftTop]
        end
        object Memo74: TfrxMemoView
          Left = 302.803340000000000000
          Top = 188.094619999999900000
          Width = 47.692950000000010000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #51060#47700#51068)
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Left = 1.196845510000000000
          Top = 382.267718979999500000
          Width = 99.779556850000000000
          Height = 20.031493620000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #54633' '#44228' '#44552' '#50529)
          ParentFont = False
        end
        object Memo77: TfrxMemoView
          Left = 100.488250000000000000
          Top = 382.267718979999500000
          Width = 102.047244090000000000
          Height = 20.031493620000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #54788'   '#44552)
          ParentFont = False
        end
        object Memo78: TfrxMemoView
          Left = 201.756030000000000000
          Top = 382.267718979999500000
          Width = 97.889763780000000000
          Height = 20.031493620000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #49688'    '#54364)
          ParentFont = False
        end
        object Memo79: TfrxMemoView
          Left = 299.401569920000000000
          Top = 382.267718979999500000
          Width = 94.488184090000000000
          Height = 20.031493620000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #50612'   '#51020)
          ParentFont = False
        end
        object Memo80: TfrxMemoView
          Left = 393.953000000000000000
          Top = 382.267718979999500000
          Width = 83.149594090000000000
          Height = 20.031493620000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #50808#49345#48120#49688#44552)
          ParentFont = False
        end
        object Memo82: TfrxMemoView
          Left = 100.598420310000000000
          Top = 402.299215039999700000
          Width = 102.047244090000000000
          Height = 27.590553620000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo83: TfrxMemoView
          Left = 201.771800000000000000
          Top = 402.299215039999700000
          Width = 97.889763780000000000
          Height = 27.590553620000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo84: TfrxMemoView
          Left = 299.401569920000000000
          Top = 402.299215039999700000
          Width = 94.488184090000000000
          Height = 27.590553620000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo85: TfrxMemoView
          Left = 393.889758900000000000
          Top = 402.299215039999700000
          Width = 83.149606300000000000
          Height = 27.590553620000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo1: TfrxMemoView
          Left = 55.244089610000000000
          Top = 284.000002440000000000
          Width = 204.094488190000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo4: TfrxMemoView
          Left = 373.929194880000000000
          Top = 284.000002440000000000
          Width = 93.732283460000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo5: TfrxMemoView
          Left = 467.590546300000000000
          Top = 284.000002440000000000
          Width = 77.102362200000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo6: TfrxMemoView
          Left = 259.338577800000000000
          Top = 284.000002440000000000
          Width = 40.062992130000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo7: TfrxMemoView
          Left = 299.362400000000000000
          Top = 284.000002440000000000
          Width = 74.834645670000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo8: TfrxMemoView
          Left = 1.196845510000000000
          Top = 284.000002440000000000
          Width = 54.425196850000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo29: TfrxMemoView
          Left = 55.244089610000000000
          Top = 308.944884329999800000
          Width = 204.094488190000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo30: TfrxMemoView
          Left = 373.929194880000000000
          Top = 308.944884329999800000
          Width = 93.732283460000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo31: TfrxMemoView
          Left = 467.590546300000000000
          Top = 308.944884329999800000
          Width = 77.102362200000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo32: TfrxMemoView
          Left = 259.338577800000000000
          Top = 308.944884329999800000
          Width = 40.062992130000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo33: TfrxMemoView
          Left = 299.362400000000000000
          Top = 308.944884329999800000
          Width = 74.834645670000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo34: TfrxMemoView
          Left = 1.196845510000000000
          Top = 308.944884329999800000
          Width = 54.425196850000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo88: TfrxMemoView
          Left = 55.244089610000000000
          Top = 333.133860709999700000
          Width = 204.094488190000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo89: TfrxMemoView
          Left = 373.929194880000000000
          Top = 333.133860709999700000
          Width = 93.732283460000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo90: TfrxMemoView
          Left = 467.590546300000000000
          Top = 333.133860709999700000
          Width = 77.102362200000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo91: TfrxMemoView
          Left = 259.118056540000000000
          Top = 333.133860709999700000
          Width = 40.062992130000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo92: TfrxMemoView
          Left = 299.362400000000000000
          Top = 333.133860709999700000
          Width = 74.834645670000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo93: TfrxMemoView
          Left = 1.196845510000000000
          Top = 333.133860709999700000
          Width = 54.425196850000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo95: TfrxMemoView
          Left = 55.244089610000000000
          Top = 357.700789839999500000
          Width = 204.094488190000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo96: TfrxMemoView
          Left = 373.929194880000000000
          Top = 357.700789839999500000
          Width = 93.732283460000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo97: TfrxMemoView
          Left = 467.590546300000000000
          Top = 357.700789839999500000
          Width = 77.102362200000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo98: TfrxMemoView
          Left = 259.338577800000000000
          Top = 357.700789839999500000
          Width = 40.062992130000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo99: TfrxMemoView
          Left = 299.362400000000000000
          Top = 357.700789839999500000
          Width = 74.834645670000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo100: TfrxMemoView
          Left = 1.196845510000000000
          Top = 357.700789839999500000
          Width = 54.425196850000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo101: TfrxMemoView
          Left = 544.692908500000100000
          Top = 308.944884329999800000
          Width = 52.913385830000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo102: TfrxMemoView
          Left = 199.094620000000000000
          Top = 21.795299999999980000
          Width = 124.724490000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '('#44277#44553#48155#45716#51088' '#48372#44288#50857')')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 353.496290000000000000
          Top = 25.133889999999990000
          Width = 64.251944090000000000
          Height = 22.677165350000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #49849#51064#48264#54840)
          ParentFont = False
        end
        object StoreJongMokText: TfrxMemoView
          Left = 201.094620000000000000
          Top = 162.535559999999900000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'STORE_JONGMOK'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."STORE_JONGMOK"]')
          ParentFont = False
        end
        object CompanyJongMokText: TfrxMemoView
          Left = 497.575140000000000000
          Top = 160.196969999999800000
          Width = 98.267780000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'COMPANY_JONGMOK'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."COMPANY_JONGMOK"]')
          ParentFont = False
        end
        object ItemDateText: TfrxMemoView
          Left = 3.440940000000000000
          Top = 287.819110000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM1_DATE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM1_DATE"]')
          ParentFont = False
        end
        object ItemTxtText: TfrxMemoView
          Left = 57.133890000000000000
          Top = 286.598639999999800000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM1_TXT'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM1_TXT"]')
          ParentFont = False
        end
        object ItemQtyText: TfrxMemoView
          Left = 261.921460000000000000
          Top = 285.716537869999800000
          Width = 34.015770000000010000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'ITEM1_QTY'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM1_QTY"]')
          ParentFont = False
        end
        object ItemPriceText: TfrxMemoView
          Left = 302.023810000000000000
          Top = 286.598639999999800000
          Width = 68.031540000000010000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM1_PRICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM1_PRICE"]')
          ParentFont = False
        end
        object ItemNetText: TfrxMemoView
          Left = 376.393940000000000000
          Top = 287.598639999999800000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM1_NET'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM1_NET"]')
          ParentFont = False
        end
        object ItemTaxText: TfrxMemoView
          Left = 471.370073860000000000
          Top = 286.598639999999800000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM1_TAX'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM1_TAX"]')
          ParentFont = False
        end
        object TotalAmtText: TfrxMemoView
          Left = 2.000000000000000000
          Top = 404.661719999999700000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'AMT_TOTAL'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_TOTAL"]')
          ParentFont = False
        end
        object CashAmtText: TfrxMemoView
          Left = 102.488250000000000000
          Top = 404.661719999999700000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'AMT_CASH'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_CASH"]')
          ParentFont = False
        end
        object MisuAmtText: TfrxMemoView
          Left = 397.307360000000000000
          Top = 404.764069999999600000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'AMT_MISU'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_MISU"]')
          ParentFont = False
        end
        object TaxNo: TfrxMemoView
          Left = 419.968770000000000000
          Top = 27.031539999999910000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'NO_APPROVAL'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."NO_APPROVAL"]')
          ParentFont = False
        end
        object ReceiptTypeText: TfrxMemoView
          Left = 480.441250000000000000
          Top = 394.425479999999700000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'DS_INVOICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."DS_INVOICE"]')
          ParentFont = False
        end
        object Line15: TfrxLineView
          Left = 0.440940000000000000
          Top = 236.228509999999600000
          Width = 597.165740000000000000
          ShowHint = False
          Frame.Color = clBlue
          Frame.Typ = [ftTop]
        end
        object Line17: TfrxLineView
          Left = 299.496290000000000000
          Top = 187.756029999999900000
          Height = 48.133890000000000000
          ShowHint = False
          Frame.Color = clBlue
          Frame.Typ = [ftLeft]
        end
        object Memo44: TfrxMemoView
          Left = 4.220470000000000000
          Top = 238.787569999999700000
          Width = 43.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #48708'  '#44256)
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 3.000000000000000000
          Top = 437.425479999999700000
          Width = 551.811380000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -8
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            
              #8251' '#48376' '#49464#44552#44228#49328#49436#45716' '#48512#44032#44032#52824#49464#48277#50640' '#51032#54616#50668' '#48156#54665#46108' '#49464#44552#44228#49328#49436#51060#47728', '#51204#51088#49436#47749' '#48277#50640' '#51032#44144#54620' '#51204#51088#51064#51613' '#49436#47749#51004#47196' '#51064#44048#45216#51064#51060' ' +
              #50630#50612#46020' '#48277#51201' '#54952#47141#51012' '#44054#49845#45768#45796'.')
          ParentFont = False
        end
        object Shape1: TfrxShapeView
          Left = 219.874018190000000000
          Top = 47.606301649999880000
          Width = 79.748031500000000000
          Height = 18.897637800000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Memo46: TfrxMemoView
          Left = 221.094620000000000000
          Top = 46.692950000000010000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #51333#49324#50629#51109#48264#54840)
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 356.716760000000000000
          Top = 187.756029999999900000
          Width = 234.330860000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'EMAIL'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."EMAIL"]')
          ParentFont = False
        end
        object Shape16: TfrxShapeView
          Left = 517.811380000000000000
          Top = 47.606301649999880000
          Width = 80.125984250000000000
          Height = 18.897637800000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Memo47: TfrxMemoView
          Left = 520.590910000000000000
          Top = 45.913419999999990000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #51333#49324#50629#51109#48264#54840)
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 18.897650000000000000
          Top = 100.606369999999900000
          Width = 36.795300000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '('#48277#51064#47749')')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Top = 215.212739999999600000
          Width = 56.692950000000010000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'YMD_INVOICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."YMD_INVOICE"]')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 58.133890000000000000
          Top = 210.212739999999600000
          Width = 117.165430000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'AMT_NET'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_NET"]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 185.637910000000000000
          Top = 210.433209999999600000
          Width = 109.606370000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'AMT_TAX'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_TAX"]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 4.220470000000000000
          Top = 311.700989999999900000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM2_DATE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM2_DATE"]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 57.913420000000000000
          Top = 310.480519999999900000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM2_TXT'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM2_TXT"]')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 262.700990000000000000
          Top = 310.173247869999900000
          Width = 34.015770000000010000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'ITEM2_QTY'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM2_QTY"]')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 302.803340000000000000
          Top = 310.480519999999900000
          Width = 68.031540000000010000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM2_PRICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM2_PRICE"]')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 377.173470000000000000
          Top = 311.480519999999900000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM2_NET'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM2_NET"]')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 471.370073860000000000
          Top = 311.480519999999900000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM2_TAX'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM2_TAX"]')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 4.220470000000000000
          Top = 335.378169999999500000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM3_DATE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM3_DATE"]')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 57.913420000000000000
          Top = 334.157699999999600000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM3_TXT'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM3_TXT"]')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 262.700990000000000000
          Top = 334.850427869999600000
          Width = 34.015770000000010000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'ITEM3_QTY'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM3_QTY"]')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 302.803340000000000000
          Top = 336.157699999999600000
          Width = 68.031540000000010000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM3_PRICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM3_PRICE"]')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 377.173470000000000000
          Top = 335.157699999999600000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM3_NET'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM3_NET"]')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 471.370073860000000000
          Top = 335.157699999999600000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM3_TAX'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM3_TAX"]')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 4.220470000000000000
          Top = 360.055349999999600000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM4_DATE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM4_DATE"]')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          Left = 57.913420000000000000
          Top = 359.834879999999700000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM4_TXT'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM4_TXT"]')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          Left = 262.700990000000000000
          Top = 360.307137869999700000
          Width = 34.015770000000010000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM4_QTY'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM4_QTY"]')
          ParentFont = False
        end
        object Memo231: TfrxMemoView
          Left = 302.803340000000000000
          Top = 360.834879999999700000
          Width = 68.031540000000010000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM4_PRICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM4_PRICE"]')
          ParentFont = False
        end
        object Memo232: TfrxMemoView
          Left = 377.173470000000000000
          Top = 360.834879999999700000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM4_PRICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM4_PRICE"]')
          ParentFont = False
        end
        object Memo233: TfrxMemoView
          Left = 471.370073860000000000
          Top = 360.834879999999700000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM4_TAX'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM4_TAX"]')
          ParentFont = False
        end
        object TaxTitle: TfrxMemoView
          Left = 18.677180000000000000
          Top = 9.236240000000000000
          Width = 173.858380000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -23
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #51204#51088' '#49464#44552#44228#49328#49436)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 544.693260000000000000
          Top = 357.700789839999500000
          Width = 52.913385830000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo127: TfrxMemoView
          Left = 544.693260000000000000
          Top = 333.133860709999700000
          Width = 52.913385830000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
      end
    end
  end
  object ProviderReport: TfrxReport
    Version = '4.12'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbZoom, pbNavigator, pbExportQuick, pbNoFullScreen]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40296.586905231500000000
    ReportOptions.LastChange = 40547.850942557900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      'begin'
      ''
      'end.')
    Left = 146
    Top = 191
    Datasets = <
      item
        DataSet = FastReportDataSet
        DataSetName = 'FastReportDataSet'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page: TfrxReportPage
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 25.900000000000000000
      RightMargin = 25.900000000000000000
      TopMargin = 22.000000000000000000
      BottomMargin = 22.000000000000000000
      object TaxData: TfrxMasterData
        Height = 3.779529999999980000
        Top = 18.897650000000000000
        Width = 597.921646000000000000
        DataSet = FastReportDataSet
        DataSetName = 'FastReportDataSet'
        RowCount = 1
        object Line16: TfrxLineView
          Left = 801.362710000000000000
          Height = 60.472480000000000000
          ShowHint = False
          Frame.Color = clBlue
          Frame.Typ = [ftLeft]
        end
      end
      object DetailData1: TfrxDetailData
        Height = 464.882190000000000000
        Top = 45.354360000000000000
        Width = 597.921646000000000000
        DataSet = FastReportDataSet
        DataSetName = 'FastReportDataSet'
        RowCount = 0
        object Shape18: TfrxShapeView
          Left = 0.755905510000000000
          Width = 596.787401570000000000
          Height = 429.732283460000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Shape19: TfrxShapeView
          Left = 417.527830000000000000
          Top = 25.322507559999910000
          Width = 179.905511810000000000
          Height = 22.677165350000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Memo11: TfrxMemoView
          Left = 54.692950000000000000
          Top = 262.023810000000000000
          Width = 204.094488190000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #54408'      '#47785'  /  '#44508'      '#44201)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 373.488254880000000000
          Top = 262.023810000000000000
          Width = 93.732293230000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #44277#44553#44032#50529)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 467.220780000000000000
          Top = 262.023810000000000000
          Width = 77.102359760000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #49464'  '#50529)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 258.897637800000000000
          Top = 262.023810000000000000
          Width = 40.062992130000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #49688#47049)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 298.921460000000000000
          Top = 262.023810000000000000
          Width = 74.834643230000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #45800#44032)
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 0.755905510000000000
          Top = 262.023810000000000000
          Width = 54.425196850000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #50900'  '#51068)
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 544.251968500000000000
          Top = 262.023810000000000000
          Width = 52.913385830000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #48708' '#44256)
          ParentFont = False
        end
        object Shape20: TfrxShapeView
          Left = 19.637582910000000000
          Top = 156.637797720000000000
          Width = 279.684990550000000000
          Height = 31.236240000000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Shape21: TfrxShapeView
          Left = 0.755905510000000000
          Top = 47.606301650000010000
          Width = 18.897650000000000000
          Height = 140.220472440000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Shape22: TfrxShapeView
          Left = 19.653543310000000000
          Top = 47.606301650000010000
          Width = 279.684990550000000000
          Height = 37.795273150000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Memo39: TfrxMemoView
          Left = 0.795300000000000000
          Top = 75.063079999999900000
          Width = 18.897650000000000000
          Height = 98.267780000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #44277
            ''
            #44553
            ''
            #51088)
          ParentFont = False
        end
        object Shape23: TfrxShapeView
          Left = 19.637582910000000000
          Top = 85.574805589999910000
          Width = 279.684990550000000000
          Height = 34.015770000000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Memo40: TfrxMemoView
          Left = 19.133890000000000000
          Top = 85.842609999999910000
          Width = 36.574830000000000000
          Height = 20.677180000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #49345'  '#54840)
          ParentFont = False
        end
        object Shape24: TfrxShapeView
          Left = 19.637582910000000000
          Top = 119.598427640000000000
          Width = 279.684990550000000000
          Height = 37.039370080000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Memo41: TfrxMemoView
          Left = 19.133890000000000000
          Top = 128.417440000000000000
          Width = 34.574830000000000000
          Height = 20.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #51452'  '#49548)
          ParentFont = False
        end
        object Shape25: TfrxShapeView
          Left = 203.110390000000000000
          Top = 85.574805589999910000
          Width = 15.118120000000000000
          Height = 34.015745590000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Memo52: TfrxMemoView
          Left = 202.330860000000000000
          Top = 84.740259999999990000
          Width = 15.118120000000000000
          Height = 32.236240000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #49457
            #47749)
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          Left = 18.456710000000000000
          Top = 160.756030000000000000
          Width = 36.354360000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #50629'  '#53468)
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          Left = 19.133890000000000000
          Top = 49.283549999999900000
          Width = 37.795300000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #46321'  '#47197
            #48264'  '#54840)
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 55.267780000000000000
          Top = 47.401669999999990000
          Height = 139.063080000000000000
          ShowHint = False
          Frame.Color = clRed
          Diagonal = True
        end
        object Memo69: TfrxMemoView
          Left = 62.881889760000000000
          Top = 52.370130000000000000
          Width = 149.960730000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'STORE_BIZNO'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."STORE_BIZNO"]')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          Left = 58.881889760000000000
          Top = 88.606370000000010000
          Width = 136.063080000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'STORE_NAME'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."STORE_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo86: TfrxMemoView
          Left = 220.023810000000000000
          Top = 88.047309999999910000
          Width = 75.149660000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'STORE_BOSS'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."STORE_BOSS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo87: TfrxMemoView
          Left = 58.881889760000000000
          Top = 123.842610000000000000
          Width = 238.110390000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'STORE_ADDRESS'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."STORE_ADDRESS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo94: TfrxMemoView
          Left = 58.826840000000000000
          Top = 162.637910000000000000
          Width = 120.944960000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'STORE_UPTAE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."STORE_UPTAE"]')
          ParentFont = False
        end
        object Shape26: TfrxShapeView
          Left = 183.008040000000000000
          Top = 156.858379999999000000
          Width = 15.897650000000000000
          Height = 30.992125980000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Shape27: TfrxShapeView
          Left = 299.039348110000000000
          Top = 47.606301650000010000
          Width = 18.897637800000000000
          Height = 140.220472440000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Shape28: TfrxShapeView
          Left = 317.716760000000000000
          Top = 47.653572600000010000
          Width = 279.685039370000000000
          Height = 37.795275590000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Shape29: TfrxShapeView
          Left = 317.779512910000000000
          Top = 156.629923699999000000
          Width = 279.685039370000000000
          Height = 31.370078740000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Memo103: TfrxMemoView
          Left = 300.614410000000000000
          Top = 75.504019999999900000
          Width = 17.677180000000000000
          Height = 98.267780000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #44277
            #44553
            #48155
            #45716
            #51088)
          ParentFont = False
        end
        object Shape30: TfrxShapeView
          Left = 317.779512910000000000
          Top = 85.574805589999910000
          Width = 279.685039370000000000
          Height = 34.015748030000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Memo104: TfrxMemoView
          Left = 317.275820000000000000
          Top = 85.283549999999900000
          Width = 33.574830000000000000
          Height = 20.677180000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #49345'  '#54840)
          ParentFont = False
        end
        object Shape31: TfrxShapeView
          Left = 317.779512910000000000
          Top = 119.417325280000000000
          Width = 279.685039370000000000
          Height = 37.039370080000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Memo105: TfrxMemoView
          Left = 317.275820000000000000
          Top = 127.858380000000000000
          Width = 34.574830000000000000
          Height = 20.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #51452'  '#49548)
          ParentFont = False
        end
        object Memo106: TfrxMemoView
          Left = 317.275820000000000000
          Top = 101.181200000000000000
          Width = 36.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '('#48277#51064#47749')')
          ParentFont = False
        end
        object Shape33: TfrxShapeView
          Left = 501.016080000000000000
          Top = 85.504019999999810000
          Width = 15.118120000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Memo107: TfrxMemoView
          Left = 500.149970000000000000
          Top = 84.842609999999910000
          Width = 15.118120000000000000
          Height = 34.771653540000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clFuchsia
          Memo.UTF8W = (
            #49457
            #47749)
          ParentFont = False
        end
        object Memo108: TfrxMemoView
          Left = 317.598640000000000000
          Top = 161.196970000000000000
          Width = 36.354360000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #50629'  '#53468)
          ParentFont = False
        end
        object Memo109: TfrxMemoView
          Left = 317.275820000000000000
          Top = 49.724489999999800000
          Width = 34.015770000000000000
          Height = 32.015770000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #46321'  '#47197
            #48264'  '#54840)
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 353.409710000000000000
          Top = 46.842609999999890000
          Height = 163.275590550000000000
          ShowHint = False
          Frame.Color = clRed
          Diagonal = True
        end
        object Memo110: TfrxMemoView
          Left = 359.519663070000000000
          Top = 50.811070000000000000
          Width = 153.740260000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'COMPANY_BIZNO'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."COMPANY_BIZNO"]')
          ParentFont = False
        end
        object Memo111: TfrxMemoView
          Left = 355.630180000000000000
          Top = 87.488249999999900000
          Width = 139.842610000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'COMPANY_NAME'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."COMPANY_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo112: TfrxMemoView
          Left = 516.472790000000000000
          Top = 88.708719999999780000
          Width = 78.929190000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'COMPANY_BOSS'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."COMPANY_BOSS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo113: TfrxMemoView
          Left = 355.519663070000000000
          Top = 120.724489999999000000
          Width = 238.110390000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'COMPANY_ADDRESS'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clFuchsia
          Memo.UTF8W = (
            '[FastReportDataSet."COMPANY_ADDRESS"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo114: TfrxMemoView
          Left = 355.519663070000000000
          Top = 161.078849999999000000
          Width = 120.944960000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'COMPANY_UPTAE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."COMPANY_UPTAE"]')
          ParentFont = False
        end
        object Shape34: TfrxShapeView
          Left = 479.590910000000000000
          Top = 156.299207720000000000
          Width = 15.897650000000000000
          Height = 31.236240000000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Memo115: TfrxMemoView
          Left = 182.669450000000000000
          Top = 154.858379999999000000
          Width = 15.496060550000000000
          Height = 32.236240000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #51333
            #47785)
          ParentFont = False
        end
        object Memo116: TfrxMemoView
          Left = 479.590910000000000000
          Top = 155.338255590000000000
          Width = 15.496060550000000000
          Height = 33.236240000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Memo.UTF8W = (
            #51333
            #47785)
          ParentFont = False
        end
        object Line5: TfrxLineView
          Left = 183.212740000000000000
          Top = 187.315090000000000000
          Height = 49.133890000000000000
          ShowHint = False
          Frame.Color = clRed
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          Left = 55.370130000000000000
          Top = 186.874150000000000000
          Height = 75.590600000000000000
          ShowHint = False
          Frame.Color = clRed
          Frame.Typ = [ftLeft]
        end
        object Memo117: TfrxMemoView
          Left = 1.559060000000000000
          Top = 187.653680000000000000
          Width = 51.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #51089#49457#51068#51088)
          ParentFont = False
        end
        object Memo118: TfrxMemoView
          Left = 64.031540000000000000
          Top = 188.874150000000000000
          Width = 104.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #44277'  '#44553'  '#44032'  '#50529)
          ParentFont = False
        end
        object Memo119: TfrxMemoView
          Left = 192.433210000000000000
          Top = 188.653680000000000000
          Width = 96.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #49464'      '#50529)
          ParentFont = False
        end
        object Line10: TfrxLineView
          Top = 210.110390000000000000
          Width = 597.165740000000000000
          ShowHint = False
          Frame.Color = clRed
          Frame.Typ = [ftTop]
        end
        object Memo120: TfrxMemoView
          Left = 302.362400000000000000
          Top = 188.094620000000000000
          Width = 47.692950000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #51060#47700#51068)
          ParentFont = False
        end
        object Memo121: TfrxMemoView
          Left = 0.755905510000000000
          Top = 382.109909130000000000
          Width = 99.779556850000000000
          Height = 20.031493620000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #54633' '#44228' '#44552' '#50529)
          ParentFont = False
        end
        object Memo122: TfrxMemoView
          Left = 100.047310000000000000
          Top = 382.109909130000000000
          Width = 102.047244090000000000
          Height = 20.031493620000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #54788'   '#44552)
          ParentFont = False
        end
        object Memo123: TfrxMemoView
          Left = 201.315090000000000000
          Top = 382.109909130000000000
          Width = 97.889763780000000000
          Height = 20.031493620000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #49688'    '#54364)
          ParentFont = False
        end
        object Memo124: TfrxMemoView
          Left = 298.960629920000000000
          Top = 382.109909130000000000
          Width = 94.488184090000000000
          Height = 20.031493620000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #50612'   '#51020)
          ParentFont = False
        end
        object Memo125: TfrxMemoView
          Left = 393.512060000000000000
          Top = 382.109909130000000000
          Width = 83.149594090000000000
          Height = 20.031493620000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #50808#49345#48120#49688#44552)
          ParentFont = False
        end
        object Memo126: TfrxMemoView
          Left = 100.157480310000000000
          Top = 402.141405200000000000
          Width = 102.047244090000000000
          Height = 27.590553620000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo128: TfrxMemoView
          Left = 298.960629920000000000
          Top = 402.141405200000000000
          Width = 94.488184090000000000
          Height = 27.590553620000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo129: TfrxMemoView
          Left = 393.448818900000000000
          Top = 402.141405200000000000
          Width = 83.149606300000000000
          Height = 27.590553620000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo130: TfrxMemoView
          Left = 54.803149610000000000
          Top = 283.842192600000000000
          Width = 204.094488190000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo131: TfrxMemoView
          Left = 373.488254880000000000
          Top = 283.842192600000000000
          Width = 93.732283460000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo132: TfrxMemoView
          Left = 467.149606300000000000
          Top = 283.842192600000000000
          Width = 77.102362200000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo133: TfrxMemoView
          Left = 258.897637800000000000
          Top = 283.842192600000000000
          Width = 40.062992130000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo134: TfrxMemoView
          Left = 298.921460000000000000
          Top = 283.842192600000000000
          Width = 74.834645670000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo135: TfrxMemoView
          Left = 0.755905510000000000
          Top = 283.842192600000000000
          Width = 54.425196850000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo136: TfrxMemoView
          Left = 54.803149610000000000
          Top = 308.409121730000100000
          Width = 204.094488190000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo137: TfrxMemoView
          Left = 373.488254880000000000
          Top = 308.409121730000100000
          Width = 93.732283460000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo138: TfrxMemoView
          Left = 467.149606300000000000
          Top = 308.409121730000100000
          Width = 77.102362200000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo139: TfrxMemoView
          Left = 258.897637800000000000
          Top = 308.409121730000100000
          Width = 40.062992130000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo140: TfrxMemoView
          Left = 298.921460000000000000
          Top = 308.409121730000100000
          Width = 74.834645670000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo141: TfrxMemoView
          Left = 0.755905510000000000
          Top = 308.409121730000100000
          Width = 54.425196850000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo142: TfrxMemoView
          Left = 54.803149610000000000
          Top = 332.976050870000000000
          Width = 204.094488190000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo143: TfrxMemoView
          Left = 373.488254880000000000
          Top = 332.976050870000000000
          Width = 93.732283460000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo144: TfrxMemoView
          Left = 467.149606300000000000
          Top = 332.976050870000000000
          Width = 77.102362200000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo145: TfrxMemoView
          Left = 258.677116540000000000
          Top = 332.976050870000000000
          Width = 40.062992130000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo146: TfrxMemoView
          Left = 298.921460000000000000
          Top = 332.976050870000000000
          Width = 74.834645670000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo147: TfrxMemoView
          Left = 0.755905510000000000
          Top = 332.976050870000000000
          Width = 54.425196850000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo148: TfrxMemoView
          Left = 54.803149610000000000
          Top = 357.542980000000000000
          Width = 204.094488190000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo149: TfrxMemoView
          Left = 373.488254880000000000
          Top = 357.542980000000000000
          Width = 93.732283460000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo150: TfrxMemoView
          Left = 467.149606300000000000
          Top = 357.542980000000000000
          Width = 77.102362200000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo151: TfrxMemoView
          Left = 258.897637800000000000
          Top = 357.542980000000000000
          Width = 40.062992130000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo152: TfrxMemoView
          Left = 298.921460000000000000
          Top = 357.542980000000000000
          Width = 74.834645670000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo153: TfrxMemoView
          Left = 0.755905510000000000
          Top = 357.542980000000000000
          Width = 54.425196850000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo154: TfrxMemoView
          Left = 544.251968500000000000
          Top = 308.409121730000100000
          Width = 52.913385830000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo155: TfrxMemoView
          Left = 198.653680000000000000
          Top = 21.795300000000100000
          Width = 124.724490000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '('#44277#44553#51088' '#50857')')
          ParentFont = False
        end
        object Memo156: TfrxMemoView
          Left = 353.055350000000000000
          Top = 25.133889999999890000
          Width = 64.251944090000000000
          Height = 22.677165350000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #49849#51064#48264#54840)
          ParentFont = False
        end
        object Memo157: TfrxMemoView
          Left = 200.653680000000000000
          Top = 162.535560000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'STORE_JONGMOK'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."STORE_JONGMOK"]')
          ParentFont = False
        end
        object Memo158: TfrxMemoView
          Left = 497.134200000000000000
          Top = 160.196970000000000000
          Width = 98.267780000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'COMPANY_JONGMOK'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."COMPANY_JONGMOK"]')
          ParentFont = False
        end
        object Memo159: TfrxMemoView
          Left = 3.000000000000000000
          Top = 287.819110000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM1_DATE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM1_DATE"]')
          ParentFont = False
        end
        object Memo160: TfrxMemoView
          Left = 56.692950000000000000
          Top = 286.598640000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM1_TXT'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM1_TXT"]')
          ParentFont = False
        end
        object Memo161: TfrxMemoView
          Left = 261.480520000000000000
          Top = 285.716537870000000000
          Width = 34.015770000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'ITEM1_QTY'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM1_QTY"]')
          ParentFont = False
        end
        object Memo162: TfrxMemoView
          Left = 301.582870000000000000
          Top = 286.598640000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM1_PRICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM1_PRICE"]')
          ParentFont = False
        end
        object Memo163: TfrxMemoView
          Left = 375.953000000000000000
          Top = 287.598640000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM1_NET'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM1_NET"]')
          ParentFont = False
        end
        object Memo164: TfrxMemoView
          Left = 470.929133860000000000
          Top = 286.598640000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM1_TAX'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM1_TAX"]')
          ParentFont = False
        end
        object Memo165: TfrxMemoView
          Left = 1.559060000000000000
          Top = 404.661720000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'AMT_TOTAL'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_TOTAL"]')
          ParentFont = False
        end
        object Memo166: TfrxMemoView
          Left = 102.047310000000000000
          Top = 404.661720000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'AMT_CASH'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_CASH"]')
          ParentFont = False
        end
        object Memo167: TfrxMemoView
          Left = 396.866420000000000000
          Top = 404.764070000000000000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'AMT_MISU'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_MISU"]')
          ParentFont = False
        end
        object Memo168: TfrxMemoView
          Left = 419.527830000000000000
          Top = 27.031540000000010000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'NO_APPROVAL'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."NO_APPROVAL"]')
          ParentFont = False
        end
        object Memo169: TfrxMemoView
          Left = 480.000310000000000000
          Top = 394.425480000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'DS_INVOICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."DS_INVOICE"]')
          ParentFont = False
        end
        object Line11: TfrxLineView
          Top = 236.228510000000000000
          Width = 597.165740000000000000
          ShowHint = False
          Frame.Color = clRed
          Frame.Typ = [ftTop]
        end
        object Line12: TfrxLineView
          Left = 299.055350000000000000
          Top = 187.756030000000000000
          Height = 48.133890000000000000
          ShowHint = False
          Frame.Color = clRed
          Frame.Typ = [ftLeft]
        end
        object Memo170: TfrxMemoView
          Left = 3.779530000000000000
          Top = 238.787570000000000000
          Width = 43.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #48708'  '#44256)
          ParentFont = False
        end
        object Shape35: TfrxShapeView
          Left = 219.433078190000000000
          Top = 47.606301650000010000
          Width = 79.748031500000000000
          Height = 18.897637800000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Memo171: TfrxMemoView
          Left = 220.653680000000000000
          Top = 46.692949999999900000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #51333#49324#50629#51109#48264#54840)
          ParentFont = False
        end
        object Memo172: TfrxMemoView
          Left = 356.275820000000000000
          Top = 187.756030000000000000
          Width = 234.330860000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'EMAIL'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."EMAIL"]')
          ParentFont = False
        end
        object Shape36: TfrxShapeView
          Left = 517.370440000000000000
          Top = 47.606301650000010000
          Width = 80.125984250000000000
          Height = 18.897637800000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Memo173: TfrxMemoView
          Left = 520.149970000000000000
          Top = 45.913419999999900000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #51333#49324#50629#51109#48264#54840)
          ParentFont = False
        end
        object Memo174: TfrxMemoView
          Left = 18.456710000000000000
          Top = 100.606370000000000000
          Width = 36.795300000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '('#48277#51064#47749')')
          ParentFont = False
        end
        object Memo175: TfrxMemoView
          Left = 1.559060000000000000
          Top = 215.212740000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'YMD_INVOICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."YMD_INVOICE"]')
          ParentFont = False
        end
        object Memo176: TfrxMemoView
          Left = 57.692950000000000000
          Top = 210.212740000000000000
          Width = 117.165430000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'AMT_NET'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_NET"]')
          ParentFont = False
        end
        object Memo177: TfrxMemoView
          Left = 185.196970000000000000
          Top = 210.433210000000000000
          Width = 109.606370000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'AMT_TAX'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_TAX"]')
          ParentFont = False
        end
        object Memo178: TfrxMemoView
          Left = 3.779530000000000000
          Top = 311.700990000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM2_DATE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM2_DATE"]')
          ParentFont = False
        end
        object Memo179: TfrxMemoView
          Left = 57.472480000000000000
          Top = 310.480520000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM2_TXT'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM2_TXT"]')
          ParentFont = False
        end
        object Memo180: TfrxMemoView
          Left = 262.260050000000000000
          Top = 310.173247870000000000
          Width = 34.015770000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'ITEM2_QTY'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM2_QTY"]')
          ParentFont = False
        end
        object Memo181: TfrxMemoView
          Left = 302.362400000000000000
          Top = 310.480520000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM2_PRICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM2_PRICE"]')
          ParentFont = False
        end
        object Memo182: TfrxMemoView
          Left = 376.732530000000000000
          Top = 311.480520000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM2_NET'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM2_NET"]')
          ParentFont = False
        end
        object Memo183: TfrxMemoView
          Left = 470.929133860000000000
          Top = 311.480520000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM2_TAX'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM2_TAX"]')
          ParentFont = False
        end
        object Memo184: TfrxMemoView
          Left = 3.779530000000000000
          Top = 335.378170000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM3_DATE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM3_DATE"]')
          ParentFont = False
        end
        object Memo185: TfrxMemoView
          Left = 57.472480000000000000
          Top = 334.157700000000100000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM3_TXT'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM3_TXT"]')
          ParentFont = False
        end
        object Memo186: TfrxMemoView
          Left = 262.260050000000000000
          Top = 334.850427870000100000
          Width = 34.015770000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'ITEM3_QTY'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM3_QTY"]')
          ParentFont = False
        end
        object Memo187: TfrxMemoView
          Left = 302.362400000000000000
          Top = 336.157700000000100000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM3_PRICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM3_PRICE"]')
          ParentFont = False
        end
        object Memo188: TfrxMemoView
          Left = 376.732530000000000000
          Top = 335.157700000000100000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM3_NET'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM3_NET"]')
          ParentFont = False
        end
        object Memo189: TfrxMemoView
          Left = 470.929133860000000000
          Top = 335.157700000000100000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM3_TAX'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM3_TAX"]')
          ParentFont = False
        end
        object Memo190: TfrxMemoView
          Left = 3.779530000000000000
          Top = 360.055350000000100000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM4_DATE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM4_DATE"]')
          ParentFont = False
        end
        object Memo191: TfrxMemoView
          Left = 57.472480000000000000
          Top = 359.834880000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM4_TXT'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM4_TXT"]')
          ParentFont = False
        end
        object Memo192: TfrxMemoView
          Left = 262.260050000000000000
          Top = 360.307137870000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM4_QTY'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM4_QTY"]')
          ParentFont = False
        end
        object Memo193: TfrxMemoView
          Left = 302.362400000000000000
          Top = 360.834880000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM4_PRICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM4_PRICE"]')
          ParentFont = False
        end
        object Memo194: TfrxMemoView
          Left = 376.732530000000000000
          Top = 360.834880000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM4_PRICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM4_PRICE"]')
          ParentFont = False
        end
        object Memo195: TfrxMemoView
          Left = 470.929133860000000000
          Top = 360.834880000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM4_TAX'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM4_TAX"]')
          ParentFont = False
        end
        object TaxTitle: TfrxMemoView
          Left = 18.236240000000000000
          Top = 9.236240000000000000
          Width = 173.858380000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -23
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #51204#51088' '#49464#44552#44228#49328#49436)
          ParentFont = False
        end
        object Memo197: TfrxMemoView
          Left = 544.252320000000000000
          Top = 357.542980000000000000
          Width = 52.913385830000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
      end
    end
  end
  object AllFastReport: TfrxReport
    Version = '4.12'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbZoom, pbNavigator, pbExportQuick, pbNoFullScreen]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40296.586905231500000000
    ReportOptions.LastChange = 40547.850942557900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      'begin'
      ''
      'end.')
    Left = 50
    Top = 127
    Datasets = <
      item
        DataSet = FastReportDataSet
        DataSetName = 'FastReportDataSet'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page: TfrxReportPage
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 25.900000000000000000
      RightMargin = 25.900000000000000000
      TopMargin = 22.000000000000000000
      BottomMargin = 22.000000000000000000
      object TaxData: TfrxMasterData
        Height = 3.779529999999980000
        Top = 18.897650000000000000
        Width = 597.921646000000000000
        DataSet = FastReportDataSet
        DataSetName = 'FastReportDataSet'
        RowCount = 1
        object Line16: TfrxLineView
          Left = 801.362710000000000000
          Height = 60.472480000000000000
          ShowHint = False
          Frame.Color = clBlue
          Frame.Typ = [ftLeft]
        end
      end
      object DetailData1: TfrxDetailData
        Height = 925.984850000000000000
        Top = 45.354360000000000000
        Width = 597.921646000000000000
        DataSet = FastReportDataSet
        DataSetName = 'FastReportDataSet'
        RowCount = 0
        object Shape17: TfrxShapeView
          Left = 1.196845510000000000
          Width = 596.787401570000000000
          Height = 430.086890000000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Shape32: TfrxShapeView
          Left = 417.968770000000000000
          Top = 25.102364650000000000
          Width = 179.905511810000000000
          Height = 22.677165350000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object SaleNotAmtCaptionLabel: TfrxMemoView
          Left = 55.133890000000000000
          Top = 262.023810000000000000
          Width = 204.094488190000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #54408'      '#47785'  /  '#44508'      '#44201)
          ParentFont = False
        end
        object SaleVatAmtCaptionLabel: TfrxMemoView
          Left = 373.929194880000000000
          Top = 262.023810000000000000
          Width = 93.732293230000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #44277#44553#44032#50529)
          ParentFont = False
        end
        object SalePlanAmtCaptionLabel: TfrxMemoView
          Left = 467.661720000000000000
          Top = 262.023810000000000000
          Width = 77.102359760000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #49464'  '#50529)
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 259.338577800000000000
          Top = 262.023810000000000000
          Width = 40.062992130000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #49688#47049)
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 299.362400000000000000
          Top = 262.023810000000000000
          Width = 74.834643230000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #45800#44032)
          ParentFont = False
        end
        object SaleAmtCaptionLabel: TfrxMemoView
          Left = 1.196845510000000000
          Top = 262.023810000000000000
          Width = 54.425196850000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #50900'  '#51068)
          ParentFont = False
        end
        object Memo75: TfrxMemoView
          Left = 544.692908500000000000
          Top = 262.023810000000000000
          Width = 52.913385830000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #48708' '#44256)
          ParentFont = False
        end
        object Shape12: TfrxShapeView
          Left = 20.078522910000000000
          Top = 156.629923700000000000
          Width = 279.684990550000000000
          Height = 31.236240000000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Shape7: TfrxShapeView
          Left = 1.196845510000000000
          Top = 47.606301650000010000
          Width = 18.897650000000000000
          Height = 140.220472440000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Shape8: TfrxShapeView
          Left = 20.094483310000000000
          Top = 47.606301650000010000
          Width = 279.684990550000000000
          Height = 37.795273150000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Memo17: TfrxMemoView
          Left = 1.236240000000000000
          Top = 75.063080000000000000
          Width = 18.897650000000000000
          Height = 98.267780000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #44277
            ''
            #44553
            ''
            #51088)
          ParentFont = False
        end
        object Shape9: TfrxShapeView
          Left = 20.078522910000000000
          Top = 85.574805590000000000
          Width = 279.684990550000000000
          Height = 34.015770000000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Memo19: TfrxMemoView
          Left = 19.574830000000000000
          Top = 85.842609999999990000
          Width = 36.574830000000000000
          Height = 20.677180000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #49345'  '#54840)
          ParentFont = False
        end
        object Shape10: TfrxShapeView
          Left = 20.078522910000000000
          Top = 119.598427640000000000
          Width = 279.684990550000000000
          Height = 37.039370080000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Memo20: TfrxMemoView
          Left = 19.574830000000000000
          Top = 128.417440000000000000
          Width = 34.574830000000000000
          Height = 20.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #51452'  '#49548)
          ParentFont = False
        end
        object Shape11: TfrxShapeView
          Left = 203.551330000000000000
          Top = 85.574805590000000000
          Width = 15.118120000000000000
          Height = 34.015745590000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Memo22: TfrxMemoView
          Left = 202.771800000000000000
          Top = 84.740259999999990000
          Width = 15.118120000000000000
          Height = 32.236240000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #49457
            #47749)
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 18.897650000000000000
          Top = 160.756030000000000000
          Width = 36.354360000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #50629'  '#53468)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 19.574830000000000000
          Top = 49.283550000000010000
          Width = 37.795300000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #46321'  '#47197
            #48264'  '#54840)
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 55.708720000000000000
          Top = 48.401669999999990000
          Height = 139.063080000000000000
          ShowHint = False
          Frame.Color = clBlue
          Diagonal = True
        end
        object StoreBizNoText: TfrxMemoView
          Left = 62.322829760000000000
          Top = 52.370130000000000000
          Width = 149.960730000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'STORE_BIZNO'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."STORE_BIZNO"]')
          ParentFont = False
        end
        object StoreNameText: TfrxMemoView
          Left = 59.322829760000000000
          Top = 88.606370000000000000
          Width = 136.063080000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'STORE_NAME'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."STORE_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object StoreBossText: TfrxMemoView
          Left = 220.464750000000000000
          Top = 88.047310000000000000
          Width = 75.149660000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'STORE_BOSS'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."STORE_BOSS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object StoreAddressText: TfrxMemoView
          Left = 59.322829760000000000
          Top = 123.842610000000000000
          Width = 238.110390000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'STORE_ADDRESS'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."STORE_ADDRESS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object StoreUptaeText: TfrxMemoView
          Left = 59.267780000000000000
          Top = 162.637910000000000000
          Width = 120.944960000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'STORE_UPTAE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."STORE_UPTAE"]')
          ParentFont = False
        end
        object Shape2: TfrxShapeView
          Left = 183.448980000000000000
          Top = 156.858380000000000000
          Width = 15.897650000000000000
          Height = 30.992125980000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Shape3: TfrxShapeView
          Left = 299.480288110000000000
          Top = 47.606301650000010000
          Width = 18.897637800000000000
          Height = 140.220472440000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Shape4: TfrxShapeView
          Left = 318.157700000000000000
          Top = 47.653572600000010000
          Width = 280.062992130000000000
          Height = 37.795275590000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Shape5: TfrxShapeView
          Left = 318.220452910000000000
          Top = 156.251970940000000000
          Width = 279.685039370000000000
          Height = 31.370078740000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Memo3: TfrxMemoView
          Left = 301.055350000000000000
          Top = 75.504020000000000000
          Width = 17.677180000000000000
          Height = 98.267780000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #44277
            #44553
            #48155
            #45716
            #51088)
          ParentFont = False
        end
        object Shape6: TfrxShapeView
          Left = 318.220452910000000000
          Top = 85.574805590000000000
          Width = 279.685039370000000000
          Height = 34.015748030000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Memo16: TfrxMemoView
          Left = 317.716760000000000000
          Top = 85.283550000000000000
          Width = 33.574830000000000000
          Height = 20.677180000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #49345'  '#54840)
          ParentFont = False
        end
        object Shape13: TfrxShapeView
          Left = 318.220452910000000000
          Top = 119.417325280000000000
          Width = 279.685039370000000000
          Height = 37.039370080000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Memo24: TfrxMemoView
          Left = 317.716760000000000000
          Top = 127.858380000000000000
          Width = 34.574830000000000000
          Height = 20.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #51452'  '#49548)
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 317.716760000000000000
          Top = 101.181200000000000000
          Width = 36.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '('#48277#51064#47749')')
          ParentFont = False
        end
        object Shape14: TfrxShapeView
          Left = 501.457020000000000000
          Top = 85.504020000000010000
          Width = 15.118120000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Memo26: TfrxMemoView
          Left = 500.590910000000000000
          Top = 84.842609999999990000
          Width = 15.118120000000000000
          Height = 34.771653540000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clFuchsia
          Memo.UTF8W = (
            #49457
            #47749)
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 318.039580000000000000
          Top = 161.196970000000000000
          Width = 36.354360000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #50629'  '#53468)
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 317.716760000000000000
          Top = 49.724490000000000000
          Width = 34.015770000000000000
          Height = 32.015770000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #46321'  '#47197
            #48264'  '#54840)
          ParentFont = False
        end
        object Line4: TfrxLineView
          Left = 353.850650000000000000
          Top = 46.842609999999990000
          Height = 163.275590550000000000
          ShowHint = False
          Frame.Color = clBlue
          Diagonal = True
        end
        object CompanyBizNo: TfrxMemoView
          Left = 358.960603070000000000
          Top = 50.811070000000000000
          Width = 153.740260000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'COMPANY_BIZNO'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."COMPANY_BIZNO"]')
          ParentFont = False
        end
        object CompanyNameText: TfrxMemoView
          Left = 356.071120000000000000
          Top = 87.488250000000010000
          Width = 139.842610000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'COMPANY_NAME'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."COMPANY_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object CompanyBossText: TfrxMemoView
          Left = 516.913730000000000000
          Top = 88.708720000000010000
          Width = 78.929190000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'COMPANY_BOSS'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."COMPANY_BOSS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object CompanyAddressText: TfrxMemoView
          Left = 355.960603070000000000
          Top = 120.724490000000000000
          Width = 238.110390000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'COMPANY_ADDRESS'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clFuchsia
          Memo.UTF8W = (
            '[FastReportDataSet."COMPANY_ADDRESS"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object CompanyUptaeText: TfrxMemoView
          Left = 355.960603070000000000
          Top = 161.078850000000000000
          Width = 120.944960000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'COMPANY_UPTAE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."COMPANY_UPTAE"]')
          ParentFont = False
        end
        object Shape15: TfrxShapeView
          Left = 480.031850000000000000
          Top = 156.299207720000000000
          Width = 15.897650000000000000
          Height = 31.236240000000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Memo42: TfrxMemoView
          Left = 183.110390000000000000
          Top = 154.858380000000000000
          Width = 15.496060550000000000
          Height = 32.236240000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #51333
            #47785)
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 480.031850000000000000
          Top = 154.637910000000000000
          Width = 15.496060550000000000
          Height = 33.236240000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Memo.UTF8W = (
            #51333
            #47785)
          ParentFont = False
        end
        object Line6: TfrxLineView
          Left = 183.653680000000000000
          Top = 187.315090000000000000
          Height = 49.133890000000000000
          ShowHint = False
          Frame.Color = clBlue
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          Left = 55.811070000000000000
          Top = 186.874150000000000000
          Height = 75.590600000000000000
          ShowHint = False
          Frame.Color = clBlue
          Frame.Typ = [ftLeft]
        end
        object Memo71: TfrxMemoView
          Left = 2.000000000000000000
          Top = 187.653680000000000000
          Width = 51.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #51089#49457#51068#51088)
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Left = 64.472480000000000000
          Top = 188.874150000000000000
          Width = 104.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #44277'  '#44553'  '#44032'  '#50529)
          ParentFont = False
        end
        object Memo73: TfrxMemoView
          Left = 192.874150000000000000
          Top = 188.653680000000000000
          Width = 96.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #49464'      '#50529)
          ParentFont = False
        end
        object Line8: TfrxLineView
          Left = 0.440940000000000000
          Top = 210.110390000000000000
          Width = 597.165740000000000000
          ShowHint = False
          Frame.Color = clBlue
          Frame.Typ = [ftTop]
        end
        object Memo74: TfrxMemoView
          Left = 302.803340000000000000
          Top = 188.094620000000000000
          Width = 47.692950000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #51060#47700#51068)
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Left = 1.196845510000000000
          Top = 382.267718980000100000
          Width = 99.779556850000000000
          Height = 20.031493620000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #54633' '#44228' '#44552' '#50529)
          ParentFont = False
        end
        object Memo77: TfrxMemoView
          Left = 100.488250000000000000
          Top = 382.267718980000100000
          Width = 102.047244090000000000
          Height = 20.031493620000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #54788'   '#44552)
          ParentFont = False
        end
        object Memo78: TfrxMemoView
          Left = 201.756030000000000000
          Top = 382.267718980000100000
          Width = 97.889763780000000000
          Height = 20.031493620000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #49688'    '#54364)
          ParentFont = False
        end
        object Memo79: TfrxMemoView
          Left = 299.401569920000000000
          Top = 382.267718980000100000
          Width = 94.488184090000000000
          Height = 20.031493620000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #50612'   '#51020)
          ParentFont = False
        end
        object Memo80: TfrxMemoView
          Left = 393.953000000000000000
          Top = 382.267718980000100000
          Width = 83.149594090000000000
          Height = 20.031493620000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #50808#49345#48120#49688#44552)
          ParentFont = False
        end
        object Memo82: TfrxMemoView
          Left = 100.598420310000000000
          Top = 402.299215040000100000
          Width = 102.047244090000000000
          Height = 27.590553620000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo83: TfrxMemoView
          Left = 201.771800000000000000
          Top = 402.299215040000100000
          Width = 97.889763780000000000
          Height = 27.590553620000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo84: TfrxMemoView
          Left = 299.401569920000000000
          Top = 402.299215040000100000
          Width = 94.488184090000000000
          Height = 27.590553620000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo85: TfrxMemoView
          Left = 393.889758900000000000
          Top = 402.299215040000100000
          Width = 83.149606300000000000
          Height = 27.590553620000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo1: TfrxMemoView
          Left = 55.244089610000000000
          Top = 284.000002440000000000
          Width = 204.094488190000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo4: TfrxMemoView
          Left = 373.929194880000000000
          Top = 284.000002440000000000
          Width = 93.732283460000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo5: TfrxMemoView
          Left = 467.590546300000000000
          Top = 284.000002440000000000
          Width = 77.102362200000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo6: TfrxMemoView
          Left = 259.338577800000000000
          Top = 284.000002440000000000
          Width = 40.062992130000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo7: TfrxMemoView
          Left = 299.362400000000000000
          Top = 284.000002440000000000
          Width = 74.834645670000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo8: TfrxMemoView
          Left = 1.196845510000000000
          Top = 284.000002440000000000
          Width = 54.425196850000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo29: TfrxMemoView
          Left = 55.244089610000000000
          Top = 308.944884330000100000
          Width = 204.094488190000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo30: TfrxMemoView
          Left = 373.929194880000000000
          Top = 308.944884330000100000
          Width = 93.732283460000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo31: TfrxMemoView
          Left = 467.590546300000000000
          Top = 308.944884330000100000
          Width = 77.102362200000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo32: TfrxMemoView
          Left = 259.338577800000000000
          Top = 308.944884330000100000
          Width = 40.062992130000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo33: TfrxMemoView
          Left = 299.362400000000000000
          Top = 308.944884330000100000
          Width = 74.834645670000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo34: TfrxMemoView
          Left = 1.196845510000000000
          Top = 308.944884330000100000
          Width = 54.425196850000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo88: TfrxMemoView
          Left = 55.244089610000000000
          Top = 333.133860710000000000
          Width = 204.094488190000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo89: TfrxMemoView
          Left = 373.929194880000000000
          Top = 333.133860710000000000
          Width = 93.732283460000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo90: TfrxMemoView
          Left = 467.590546300000000000
          Top = 333.133860710000000000
          Width = 77.102362200000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo91: TfrxMemoView
          Left = 259.118056540000000000
          Top = 333.133860710000000000
          Width = 40.062992130000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo92: TfrxMemoView
          Left = 299.362400000000000000
          Top = 333.133860710000000000
          Width = 74.834645670000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo93: TfrxMemoView
          Left = 1.196845510000000000
          Top = 333.133860710000000000
          Width = 54.425196850000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo95: TfrxMemoView
          Left = 55.244089610000000000
          Top = 357.700789840000000000
          Width = 204.094488190000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo96: TfrxMemoView
          Left = 373.929194880000000000
          Top = 357.700789840000000000
          Width = 93.732283460000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo97: TfrxMemoView
          Left = 467.590546300000000000
          Top = 357.700789840000000000
          Width = 77.102362200000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo98: TfrxMemoView
          Left = 259.338577800000000000
          Top = 357.700789840000000000
          Width = 40.062992130000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo99: TfrxMemoView
          Left = 299.362400000000000000
          Top = 357.700789840000000000
          Width = 74.834645670000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo100: TfrxMemoView
          Left = 1.196845510000000000
          Top = 357.700789840000000000
          Width = 54.425196850000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo101: TfrxMemoView
          Left = 544.692908500000000000
          Top = 308.944884330000100000
          Width = 52.913385830000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo102: TfrxMemoView
          Left = 199.094620000000000000
          Top = 21.795300000000000000
          Width = 124.724490000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '('#44277#44553#48155#45716#51088' '#48372#44288#50857')')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 353.496290000000000000
          Top = 25.133890000000000000
          Width = 64.251944090000000000
          Height = 22.677165350000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #49849#51064#48264#54840)
          ParentFont = False
        end
        object StoreJongMokText: TfrxMemoView
          Left = 201.094620000000000000
          Top = 162.535560000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'STORE_JONGMOK'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."STORE_JONGMOK"]')
          ParentFont = False
        end
        object CompanyJongMokText: TfrxMemoView
          Left = 497.575140000000000000
          Top = 160.196970000000000000
          Width = 98.267780000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'COMPANY_JONGMOK'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."COMPANY_JONGMOK"]')
          ParentFont = False
        end
        object ItemDateText: TfrxMemoView
          Left = 3.440940000000000000
          Top = 287.819110000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM1_DATE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM1_DATE"]')
          ParentFont = False
        end
        object ItemTxtText: TfrxMemoView
          Left = 57.133890000000000000
          Top = 286.598640000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM1_TXT'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM1_TXT"]')
          ParentFont = False
        end
        object ItemQtyText: TfrxMemoView
          Left = 261.921460000000000000
          Top = 285.716537870000000000
          Width = 34.015770000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'ITEM1_QTY'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM1_QTY"]')
          ParentFont = False
        end
        object ItemPriceText: TfrxMemoView
          Left = 302.023810000000000000
          Top = 286.598640000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM1_PRICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM1_PRICE"]')
          ParentFont = False
        end
        object ItemNetText: TfrxMemoView
          Left = 376.393940000000000000
          Top = 287.598640000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM1_NET'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM1_NET"]')
          ParentFont = False
        end
        object ItemTaxText: TfrxMemoView
          Left = 471.370073860000000000
          Top = 286.598640000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM1_TAX'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM1_TAX"]')
          ParentFont = False
        end
        object TotalAmtText: TfrxMemoView
          Left = 2.000000000000000000
          Top = 404.661720000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'AMT_TOTAL'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_TOTAL"]')
          ParentFont = False
        end
        object CashAmtText: TfrxMemoView
          Left = 102.488250000000000000
          Top = 404.661720000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'AMT_CASH'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_CASH"]')
          ParentFont = False
        end
        object MisuAmtText: TfrxMemoView
          Left = 397.307360000000000000
          Top = 404.764070000000000000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'AMT_MISU'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_MISU"]')
          ParentFont = False
        end
        object TaxNo: TfrxMemoView
          Left = 419.968770000000000000
          Top = 27.031540000000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'NO_APPROVAL'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."NO_APPROVAL"]')
          ParentFont = False
        end
        object ReceiptTypeText: TfrxMemoView
          Left = 480.441250000000000000
          Top = 394.425480000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'DS_INVOICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."DS_INVOICE"]')
          ParentFont = False
        end
        object Line15: TfrxLineView
          Left = 0.440940000000000000
          Top = 236.228510000000000000
          Width = 597.165740000000000000
          ShowHint = False
          Frame.Color = clBlue
          Frame.Typ = [ftTop]
        end
        object Line17: TfrxLineView
          Left = 299.496290000000000000
          Top = 187.756030000000000000
          Height = 48.133890000000000000
          ShowHint = False
          Frame.Color = clBlue
          Frame.Typ = [ftLeft]
        end
        object Memo44: TfrxMemoView
          Left = 4.220470000000000000
          Top = 238.787570000000000000
          Width = 43.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #48708'  '#44256)
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 3.000000000000000000
          Top = 433.645950000000000000
          Width = 551.811380000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -8
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            
              #8251' '#48376' '#49464#44552#44228#49328#49436#45716' '#48512#44032#44032#52824#49464#48277#50640' '#51032#54616#50668' '#48156#54665#46108' '#49464#44552#44228#49328#49436#51060#47728', '#51204#51088#49436#47749' '#48277#50640' '#51032#44144#54620' '#51204#51088#51064#51613' '#49436#47749#51004#47196' '#51064#44048#45216#51064#51060' ' +
              #50630#50612#46020' '#48277#51201' '#54952#47141#51012' '#44054#49845#45768#45796'.')
          ParentFont = False
        end
        object Shape1: TfrxShapeView
          Left = 219.874018190000000000
          Top = 47.606301650000010000
          Width = 79.748031500000000000
          Height = 18.897637800000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Memo46: TfrxMemoView
          Left = 221.094620000000000000
          Top = 46.692949999999990000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #51333#49324#50629#51109#48264#54840)
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 356.716760000000000000
          Top = 187.756030000000000000
          Width = 234.330860000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'EMAIL'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."EMAIL"]')
          ParentFont = False
        end
        object Shape16: TfrxShapeView
          Left = 517.811380000000000000
          Top = 47.606301650000010000
          Width = 80.125984250000000000
          Height = 18.897637800000000000
          ShowHint = False
          Frame.Color = clBlue
        end
        object Memo47: TfrxMemoView
          Left = 520.590910000000000000
          Top = 45.913420000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #51333#49324#50629#51109#48264#54840)
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 18.897650000000000000
          Top = 100.606370000000000000
          Width = 36.795300000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '('#48277#51064#47749')')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Top = 215.212740000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'YMD_INVOICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."YMD_INVOICE"]')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 58.133890000000000000
          Top = 210.212740000000000000
          Width = 117.165430000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'AMT_NET'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_NET"]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 185.637910000000000000
          Top = 210.433210000000000000
          Width = 109.606370000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'AMT_TAX'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_TAX"]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 4.220470000000000000
          Top = 311.700990000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM2_DATE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM2_DATE"]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 57.913420000000000000
          Top = 310.480520000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM2_TXT'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM2_TXT"]')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 262.700990000000000000
          Top = 310.173247870000000000
          Width = 34.015770000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'ITEM2_QTY'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM2_QTY"]')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 302.803340000000000000
          Top = 310.480520000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM2_PRICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM2_PRICE"]')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 377.173470000000000000
          Top = 311.480520000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM2_NET'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM2_NET"]')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 471.370073860000000000
          Top = 311.480520000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM2_TAX'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM2_TAX"]')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 4.220470000000000000
          Top = 335.378170000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM3_DATE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM3_DATE"]')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 57.913420000000000000
          Top = 334.157700000000100000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM3_TXT'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM3_TXT"]')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 262.700990000000000000
          Top = 334.850427870000100000
          Width = 34.015770000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'ITEM3_QTY'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM3_QTY"]')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 302.803340000000000000
          Top = 336.157700000000100000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM3_PRICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM3_PRICE"]')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 377.173470000000000000
          Top = 335.157700000000100000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM3_NET'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM3_NET"]')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 471.370073860000000000
          Top = 335.157700000000100000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM3_TAX'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM3_TAX"]')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 4.220470000000000000
          Top = 360.055350000000100000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM4_DATE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM4_DATE"]')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          Left = 57.913420000000000000
          Top = 359.834880000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM4_TXT'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM4_TXT"]')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          Left = 262.700990000000000000
          Top = 360.307137870000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM4_QTY'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM4_QTY"]')
          ParentFont = False
        end
        object Memo231: TfrxMemoView
          Left = 302.803340000000000000
          Top = 360.834880000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM4_PRICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM4_PRICE"]')
          ParentFont = False
        end
        object Memo232: TfrxMemoView
          Left = 377.173470000000000000
          Top = 360.834880000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM4_PRICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM4_PRICE"]')
          ParentFont = False
        end
        object Memo233: TfrxMemoView
          Left = 471.370073860000000000
          Top = 360.834880000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM4_TAX'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM4_TAX"]')
          ParentFont = False
        end
        object TaxTitle: TfrxMemoView
          Left = 18.677180000000000000
          Top = 9.236240000000000000
          Width = 173.858380000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlue
          Font.Height = -23
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #51204#51088' '#49464#44552#44228#49328#49436)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 544.693260000000000000
          Top = 357.700789840000000000
          Width = 52.913385830000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Shape18: TfrxShapeView
          Left = 1.196845510000000000
          Top = 506.236550000000000000
          Width = 596.787401570000000000
          Height = 429.732283460000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Shape19: TfrxShapeView
          Left = 417.968770000000000000
          Top = 531.559057559999900000
          Width = 179.905511810000000000
          Height = 22.677165350000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Memo11: TfrxMemoView
          Left = 55.133890000000000000
          Top = 768.260360000000000000
          Width = 204.094488190000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #54408'      '#47785'  /  '#44508'      '#44201)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 373.929194880000000000
          Top = 768.260360000000000000
          Width = 93.732293230000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #44277#44553#44032#50529)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 467.661720000000000000
          Top = 768.260360000000000000
          Width = 77.102359760000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #49464'  '#50529)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 259.338577800000000000
          Top = 768.260360000000000000
          Width = 40.062992130000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #49688#47049)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 299.362400000000000000
          Top = 768.260360000000000000
          Width = 74.834643230000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #45800#44032)
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 1.196845510000000000
          Top = 768.260360000000000000
          Width = 54.425196850000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #50900'  '#51068)
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 544.692908500000000000
          Top = 768.260360000000000000
          Width = 52.913385830000000000
          Height = 21.921259840000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #48708' '#44256)
          ParentFont = False
        end
        object Shape20: TfrxShapeView
          Left = 20.078522910000000000
          Top = 662.874347720000000000
          Width = 279.684990550000000000
          Height = 31.236240000000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Shape21: TfrxShapeView
          Left = 1.196845510000000000
          Top = 553.842851649999900000
          Width = 18.897650000000000000
          Height = 140.220472440000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Shape22: TfrxShapeView
          Left = 20.094483310000000000
          Top = 553.842851649999900000
          Width = 279.684990550000000000
          Height = 37.795273150000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Memo39: TfrxMemoView
          Left = 1.236240000000000000
          Top = 581.299630000000000000
          Width = 18.897650000000000000
          Height = 98.267780000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #44277
            ''
            #44553
            ''
            #51088)
          ParentFont = False
        end
        object Shape23: TfrxShapeView
          Left = 20.078522910000000000
          Top = 591.811355590000000000
          Width = 279.684990550000000000
          Height = 34.015770000000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Memo40: TfrxMemoView
          Left = 19.574830000000000000
          Top = 592.079160000000000000
          Width = 36.574830000000000000
          Height = 20.677180000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #49345'  '#54840)
          ParentFont = False
        end
        object Shape24: TfrxShapeView
          Left = 20.078522910000000000
          Top = 625.834977639999900000
          Width = 279.684990550000000000
          Height = 37.039370080000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Memo41: TfrxMemoView
          Left = 19.574830000000000000
          Top = 634.653989999999900000
          Width = 34.574830000000000000
          Height = 20.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #51452'  '#49548)
          ParentFont = False
        end
        object Shape25: TfrxShapeView
          Left = 203.551330000000000000
          Top = 591.811355590000000000
          Width = 15.118120000000000000
          Height = 34.015745590000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Memo52: TfrxMemoView
          Left = 202.771800000000000000
          Top = 590.976810000000000000
          Width = 15.118120000000000000
          Height = 32.236240000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #49457
            #47749)
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          Left = 18.897650000000000000
          Top = 666.992580000000000000
          Width = 36.354360000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #50629'  '#53468)
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          Left = 19.574830000000000000
          Top = 555.520099999999900000
          Width = 37.795300000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #46321'  '#47197
            #48264'  '#54840)
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 55.708720000000000000
          Top = 553.638219999999900000
          Height = 139.063080000000000000
          ShowHint = False
          Frame.Color = clRed
          Diagonal = True
        end
        object Memo69: TfrxMemoView
          Left = 63.322829760000000000
          Top = 558.606680000000000000
          Width = 149.960730000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'STORE_BIZNO'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."STORE_BIZNO"]')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          Left = 59.322829760000000000
          Top = 594.842919999999900000
          Width = 136.063080000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'STORE_NAME'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."STORE_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo86: TfrxMemoView
          Left = 220.464750000000000000
          Top = 594.283860000000000000
          Width = 75.149660000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'STORE_BOSS'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."STORE_BOSS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo87: TfrxMemoView
          Left = 59.322829760000000000
          Top = 630.079160000000000000
          Width = 238.110390000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'STORE_ADDRESS'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."STORE_ADDRESS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo94: TfrxMemoView
          Left = 59.267780000000000000
          Top = 668.874460000000000000
          Width = 120.944960000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'STORE_UPTAE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."STORE_UPTAE"]')
          ParentFont = False
        end
        object Shape26: TfrxShapeView
          Left = 183.448980000000000000
          Top = 663.094930000000000000
          Width = 15.897650000000000000
          Height = 30.992125980000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Shape27: TfrxShapeView
          Left = 299.480288110000000000
          Top = 553.842851649999900000
          Width = 18.897637800000000000
          Height = 140.220472440000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Shape28: TfrxShapeView
          Left = 318.157700000000000000
          Top = 553.890122599999900000
          Width = 279.685039370000000000
          Height = 37.795275590000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Shape29: TfrxShapeView
          Left = 318.220452910000000000
          Top = 662.866473699999900000
          Width = 279.685039370000000000
          Height = 31.370078740000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Memo103: TfrxMemoView
          Left = 301.055350000000000000
          Top = 581.740569999999900000
          Width = 17.677180000000000000
          Height = 98.267780000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #44277
            #44553
            #48155
            #45716
            #51088)
          ParentFont = False
        end
        object Shape30: TfrxShapeView
          Left = 318.220452910000000000
          Top = 591.811355590000000000
          Width = 279.685039370000000000
          Height = 34.015748030000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Memo104: TfrxMemoView
          Left = 317.716760000000000000
          Top = 591.520100000000000000
          Width = 33.574830000000000000
          Height = 20.677180000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #49345'  '#54840)
          ParentFont = False
        end
        object Shape31: TfrxShapeView
          Left = 318.220452910000000000
          Top = 625.653875280000000000
          Width = 279.685039370000000000
          Height = 37.039370080000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Memo105: TfrxMemoView
          Left = 317.716760000000000000
          Top = 634.094930000000000000
          Width = 34.574830000000000000
          Height = 20.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #51452'  '#49548)
          ParentFont = False
        end
        object Memo106: TfrxMemoView
          Left = 317.716760000000000000
          Top = 607.417750000000000000
          Width = 36.795300000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '('#48277#51064#47749')')
          ParentFont = False
        end
        object Shape33: TfrxShapeView
          Left = 501.457020000000000000
          Top = 591.740569999999900000
          Width = 15.118120000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Memo107: TfrxMemoView
          Left = 500.590910000000000000
          Top = 591.079160000000000000
          Width = 15.118120000000000000
          Height = 34.771653540000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clFuchsia
          Memo.UTF8W = (
            #49457
            #47749)
          ParentFont = False
        end
        object Memo108: TfrxMemoView
          Left = 318.039580000000000000
          Top = 667.433519999999900000
          Width = 36.354360000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #50629'  '#53468)
          ParentFont = False
        end
        object Memo109: TfrxMemoView
          Left = 317.716760000000000000
          Top = 555.961039999999900000
          Width = 34.015770000000000000
          Height = 32.015770000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #46321'  '#47197
            #48264'  '#54840)
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 353.850650000000000000
          Top = 553.079160000000000000
          Height = 163.275590550000000000
          ShowHint = False
          Frame.Color = clRed
          Diagonal = True
        end
        object Memo110: TfrxMemoView
          Left = 359.960603070000000000
          Top = 557.047619999999900000
          Width = 153.740260000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'COMPANY_BIZNO'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."COMPANY_BIZNO"]')
          ParentFont = False
        end
        object Memo111: TfrxMemoView
          Left = 356.071120000000000000
          Top = 593.724800000000000000
          Width = 139.842610000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'COMPANY_NAME'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."COMPANY_NAME"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo112: TfrxMemoView
          Left = 516.913730000000000000
          Top = 594.945270000000000000
          Width = 78.929190000000000000
          Height = 26.456710000000000000
          ShowHint = False
          DataField = 'COMPANY_BOSS'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."COMPANY_BOSS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo113: TfrxMemoView
          Left = 355.960603070000000000
          Top = 626.961039999999900000
          Width = 238.110390000000000000
          Height = 30.236240000000000000
          ShowHint = False
          DataField = 'COMPANY_ADDRESS'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clFuchsia
          Memo.UTF8W = (
            '[FastReportDataSet."COMPANY_ADDRESS"]')
          ParentFont = False
          WordBreak = True
          VAlign = vaCenter
        end
        object Memo114: TfrxMemoView
          Left = 355.960603070000000000
          Top = 667.315400000000000000
          Width = 120.944960000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'COMPANY_UPTAE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."COMPANY_UPTAE"]')
          ParentFont = False
        end
        object Shape34: TfrxShapeView
          Left = 480.031850000000000000
          Top = 662.535757720000000000
          Width = 15.897650000000000000
          Height = 31.236240000000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Memo115: TfrxMemoView
          Left = 183.110390000000000000
          Top = 661.094930000000000000
          Width = 15.496060550000000000
          Height = 32.236240000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #51333
            #47785)
          ParentFont = False
        end
        object Memo116: TfrxMemoView
          Left = 480.031850000000000000
          Top = 661.574805590000000000
          Width = 15.496060550000000000
          Height = 33.236240000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clBlue
          Memo.UTF8W = (
            #51333
            #47785)
          ParentFont = False
        end
        object Line5: TfrxLineView
          Left = 183.653680000000000000
          Top = 693.551639999999900000
          Height = 49.133890000000000000
          ShowHint = False
          Frame.Color = clRed
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          Left = 55.811070000000000000
          Top = 693.110700000000000000
          Height = 75.590600000000000000
          ShowHint = False
          Frame.Color = clRed
          Frame.Typ = [ftLeft]
        end
        object Memo117: TfrxMemoView
          Left = 2.000000000000000000
          Top = 693.890230000000000000
          Width = 51.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #51089#49457#51068#51088)
          ParentFont = False
        end
        object Memo118: TfrxMemoView
          Left = 64.472480000000000000
          Top = 695.110700000000000000
          Width = 104.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #44277'  '#44553'  '#44032'  '#50529)
          ParentFont = False
        end
        object Memo119: TfrxMemoView
          Left = 192.874150000000000000
          Top = 694.890230000000000000
          Width = 96.826840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #49464'      '#50529)
          ParentFont = False
        end
        object Line10: TfrxLineView
          Left = 0.440940000000000000
          Top = 716.346939999999900000
          Width = 597.165740000000000000
          ShowHint = False
          Frame.Color = clRed
          Frame.Typ = [ftTop]
        end
        object Memo120: TfrxMemoView
          Left = 302.803340000000000000
          Top = 694.331169999999900000
          Width = 47.692950000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #51060#47700#51068)
          ParentFont = False
        end
        object Memo121: TfrxMemoView
          Left = 1.196845510000000000
          Top = 888.346459130000000000
          Width = 99.779556850000000000
          Height = 20.031493620000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #54633' '#44228' '#44552' '#50529)
          ParentFont = False
        end
        object Memo122: TfrxMemoView
          Left = 100.488250000000000000
          Top = 888.346459130000000000
          Width = 102.047244090000000000
          Height = 20.031493620000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #54788'   '#44552)
          ParentFont = False
        end
        object Memo123: TfrxMemoView
          Left = 201.756030000000000000
          Top = 888.346459130000000000
          Width = 97.889763780000000000
          Height = 20.031493620000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #49688'    '#54364)
          ParentFont = False
        end
        object Memo124: TfrxMemoView
          Left = 299.401569920000000000
          Top = 888.346459130000000000
          Width = 94.488184090000000000
          Height = 20.031493620000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #50612'   '#51020)
          ParentFont = False
        end
        object Memo125: TfrxMemoView
          Left = 393.953000000000000000
          Top = 888.346459130000000000
          Width = 83.149594090000000000
          Height = 20.031493620000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #50808#49345#48120#49688#44552)
          ParentFont = False
        end
        object Memo126: TfrxMemoView
          Left = 100.598420310000000000
          Top = 908.377955200000000000
          Width = 102.047244090000000000
          Height = 27.590553620000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo128: TfrxMemoView
          Left = 299.401569920000000000
          Top = 908.377955200000000000
          Width = 94.488184090000000000
          Height = 27.590553620000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo129: TfrxMemoView
          Left = 393.889758900000000000
          Top = 908.377955200000000000
          Width = 83.149606300000000000
          Height = 27.590553620000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo130: TfrxMemoView
          Left = 55.244089610000000000
          Top = 790.078742600000000000
          Width = 204.094488190000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo131: TfrxMemoView
          Left = 373.929194880000000000
          Top = 790.078742600000000000
          Width = 93.732283460000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo132: TfrxMemoView
          Left = 467.590546300000000000
          Top = 790.078742600000000000
          Width = 77.102362200000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo133: TfrxMemoView
          Left = 259.338577800000000000
          Top = 790.078742600000000000
          Width = 40.062992130000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo134: TfrxMemoView
          Left = 299.362400000000000000
          Top = 790.078742600000000000
          Width = 74.834645670000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo135: TfrxMemoView
          Left = 1.196845510000000000
          Top = 790.078742600000000000
          Width = 54.425196850000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo136: TfrxMemoView
          Left = 55.244089610000000000
          Top = 814.645671730000000000
          Width = 204.094488190000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo137: TfrxMemoView
          Left = 373.929194880000000000
          Top = 814.645671730000000000
          Width = 93.732283460000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo138: TfrxMemoView
          Left = 467.590546300000000000
          Top = 814.645671730000000000
          Width = 77.102362200000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo139: TfrxMemoView
          Left = 259.338577800000000000
          Top = 814.645671730000000000
          Width = 40.062992130000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo140: TfrxMemoView
          Left = 299.362400000000000000
          Top = 814.645671730000000000
          Width = 74.834645670000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo141: TfrxMemoView
          Left = 1.196845510000000000
          Top = 814.645671730000000000
          Width = 54.425196850000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo142: TfrxMemoView
          Left = 55.244089610000000000
          Top = 839.212600870000000000
          Width = 204.094488190000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo143: TfrxMemoView
          Left = 373.929194880000000000
          Top = 839.212600870000000000
          Width = 93.732283460000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo144: TfrxMemoView
          Left = 467.590546300000000000
          Top = 839.212600870000000000
          Width = 77.102362200000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo145: TfrxMemoView
          Left = 259.118056540000000000
          Top = 839.212600870000000000
          Width = 40.062992130000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo146: TfrxMemoView
          Left = 299.362400000000000000
          Top = 839.212600870000000000
          Width = 74.834645670000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo147: TfrxMemoView
          Left = 1.196845510000000000
          Top = 839.212600870000000000
          Width = 54.425196850000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo148: TfrxMemoView
          Left = 55.244089610000000000
          Top = 863.779529999999900000
          Width = 204.094488190000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo149: TfrxMemoView
          Left = 373.929194880000000000
          Top = 863.779529999999900000
          Width = 93.732283460000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo150: TfrxMemoView
          Left = 467.590546300000000000
          Top = 863.779529999999900000
          Width = 77.102362200000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo151: TfrxMemoView
          Left = 259.338577800000000000
          Top = 863.779529999999900000
          Width = 40.062992130000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo152: TfrxMemoView
          Left = 299.362400000000000000
          Top = 863.779529999999900000
          Width = 74.834645670000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo153: TfrxMemoView
          Left = 1.196845510000000000
          Top = 863.779529999999900000
          Width = 54.425196850000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo154: TfrxMemoView
          Left = 544.692908500000000000
          Top = 814.645671730000000000
          Width = 52.913385830000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo155: TfrxMemoView
          Left = 199.094620000000000000
          Top = 528.031849999999900000
          Width = 124.724490000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '('#44277#44553#51088' '#50857')')
          ParentFont = False
        end
        object Memo156: TfrxMemoView
          Left = 353.496290000000000000
          Top = 531.370440000000000000
          Width = 64.251944090000000000
          Height = 22.677165350000000000
          ShowHint = False
          Color = clWhite
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #49849#51064#48264#54840)
          ParentFont = False
        end
        object Memo157: TfrxMemoView
          Left = 201.094620000000000000
          Top = 668.772110000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'STORE_JONGMOK'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."STORE_JONGMOK"]')
          ParentFont = False
        end
        object Memo158: TfrxMemoView
          Left = 497.575140000000000000
          Top = 666.433519999999900000
          Width = 98.267780000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'COMPANY_JONGMOK'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."COMPANY_JONGMOK"]')
          ParentFont = False
        end
        object Memo159: TfrxMemoView
          Left = 3.440940000000000000
          Top = 794.055660000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM1_DATE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM1_DATE"]')
          ParentFont = False
        end
        object Memo160: TfrxMemoView
          Left = 57.133890000000000000
          Top = 792.835190000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM1_TXT'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM1_TXT"]')
          ParentFont = False
        end
        object Memo161: TfrxMemoView
          Left = 261.921460000000000000
          Top = 791.953087870000000000
          Width = 34.015770000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'ITEM1_QTY'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM1_QTY"]')
          ParentFont = False
        end
        object Memo162: TfrxMemoView
          Left = 302.023810000000000000
          Top = 792.835190000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM1_PRICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM1_PRICE"]')
          ParentFont = False
        end
        object Memo163: TfrxMemoView
          Left = 376.393940000000000000
          Top = 793.835190000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM1_NET'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM1_NET"]')
          ParentFont = False
        end
        object Memo164: TfrxMemoView
          Left = 471.370073860000000000
          Top = 792.835190000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM1_TAX'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM1_TAX"]')
          ParentFont = False
        end
        object Memo165: TfrxMemoView
          Left = 2.000000000000000000
          Top = 910.898269999999900000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'AMT_TOTAL'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_TOTAL"]')
          ParentFont = False
        end
        object Memo166: TfrxMemoView
          Left = 102.488250000000000000
          Top = 910.898269999999900000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'AMT_CASH'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_CASH"]')
          ParentFont = False
        end
        object Memo167: TfrxMemoView
          Left = 397.307360000000000000
          Top = 911.000619999999900000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'AMT_MISU'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_MISU"]')
          ParentFont = False
        end
        object Memo168: TfrxMemoView
          Left = 419.968770000000000000
          Top = 533.268090000000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'NO_APPROVAL'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."NO_APPROVAL"]')
          ParentFont = False
        end
        object Memo169: TfrxMemoView
          Left = 480.441250000000000000
          Top = 900.662030000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'DS_INVOICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."DS_INVOICE"]')
          ParentFont = False
        end
        object Line11: TfrxLineView
          Left = 0.440940000000000000
          Top = 742.465060000000000000
          Width = 597.165740000000000000
          ShowHint = False
          Frame.Color = clRed
          Frame.Typ = [ftTop]
        end
        object Line12: TfrxLineView
          Left = 299.496290000000000000
          Top = 693.992580000000000000
          Height = 48.133890000000000000
          ShowHint = False
          Frame.Color = clRed
          Frame.Typ = [ftLeft]
        end
        object Memo170: TfrxMemoView
          Left = 4.220470000000000000
          Top = 745.024119999999900000
          Width = 43.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #48708'  '#44256)
          ParentFont = False
        end
        object Shape35: TfrxShapeView
          Left = 219.874018190000000000
          Top = 553.842851649999900000
          Width = 79.748031500000000000
          Height = 18.897637800000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Memo171: TfrxMemoView
          Left = 221.094620000000000000
          Top = 552.929499999999900000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #51333#49324#50629#51109#48264#54840)
          ParentFont = False
        end
        object Memo172: TfrxMemoView
          Left = 356.716760000000000000
          Top = 693.992580000000000000
          Width = 234.330860000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'EMAIL'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."EMAIL"]')
          ParentFont = False
        end
        object Shape36: TfrxShapeView
          Left = 517.811380000000000000
          Top = 553.842851649999900000
          Width = 80.125984250000000000
          Height = 18.897637800000000000
          ShowHint = False
          Frame.Color = clRed
        end
        object Memo173: TfrxMemoView
          Left = 520.590910000000000000
          Top = 552.149969999999900000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            #51333#49324#50629#51109#48264#54840)
          ParentFont = False
        end
        object Memo174: TfrxMemoView
          Left = 18.897650000000000000
          Top = 606.842919999999900000
          Width = 36.795300000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '('#48277#51064#47749')')
          ParentFont = False
        end
        object Memo175: TfrxMemoView
          Left = 2.000000000000000000
          Top = 721.449289999999900000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'YMD_INVOICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."YMD_INVOICE"]')
          ParentFont = False
        end
        object Memo176: TfrxMemoView
          Left = 58.133890000000000000
          Top = 716.449289999999900000
          Width = 117.165430000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'AMT_NET'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_NET"]')
          ParentFont = False
        end
        object Memo177: TfrxMemoView
          Left = 185.637910000000000000
          Top = 716.669760000000000000
          Width = 109.606370000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'AMT_TAX'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_TAX"]')
          ParentFont = False
        end
        object Memo178: TfrxMemoView
          Left = 4.220470000000000000
          Top = 817.937540000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM2_DATE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM2_DATE"]')
          ParentFont = False
        end
        object Memo179: TfrxMemoView
          Left = 57.913420000000000000
          Top = 816.717069999999900000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM2_TXT'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM2_TXT"]')
          ParentFont = False
        end
        object Memo180: TfrxMemoView
          Left = 262.700990000000000000
          Top = 816.409797869999900000
          Width = 34.015770000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'ITEM2_QTY'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM2_QTY"]')
          ParentFont = False
        end
        object Memo181: TfrxMemoView
          Left = 302.803340000000000000
          Top = 816.717069999999900000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM2_PRICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM2_PRICE"]')
          ParentFont = False
        end
        object Memo182: TfrxMemoView
          Left = 377.173470000000000000
          Top = 817.717069999999900000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM2_NET'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM2_NET"]')
          ParentFont = False
        end
        object Memo183: TfrxMemoView
          Left = 471.370073860000000000
          Top = 817.717069999999900000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM2_TAX'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM2_TAX"]')
          ParentFont = False
        end
        object Memo184: TfrxMemoView
          Left = 4.220470000000000000
          Top = 841.614719999999900000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM3_DATE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM3_DATE"]')
          ParentFont = False
        end
        object Memo185: TfrxMemoView
          Left = 57.913420000000000000
          Top = 840.394250000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM3_TXT'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM3_TXT"]')
          ParentFont = False
        end
        object Memo186: TfrxMemoView
          Left = 262.700990000000000000
          Top = 841.086977870000000000
          Width = 34.015770000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataField = 'ITEM3_QTY'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM3_QTY"]')
          ParentFont = False
        end
        object Memo187: TfrxMemoView
          Left = 302.803340000000000000
          Top = 842.394250000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM3_PRICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM3_PRICE"]')
          ParentFont = False
        end
        object Memo188: TfrxMemoView
          Left = 377.173470000000000000
          Top = 841.394250000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM3_NET'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM3_NET"]')
          ParentFont = False
        end
        object Memo189: TfrxMemoView
          Left = 471.370073860000000000
          Top = 841.394250000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM3_TAX'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM3_TAX"]')
          ParentFont = False
        end
        object Memo190: TfrxMemoView
          Left = 4.220470000000000000
          Top = 866.291900000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM4_DATE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM4_DATE"]')
          ParentFont = False
        end
        object Memo191: TfrxMemoView
          Left = 57.913420000000000000
          Top = 866.071430000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM4_TXT'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM4_TXT"]')
          ParentFont = False
        end
        object Memo192: TfrxMemoView
          Left = 262.700990000000000000
          Top = 866.543687870000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM4_QTY'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM4_QTY"]')
          ParentFont = False
        end
        object Memo193: TfrxMemoView
          Left = 302.803340000000000000
          Top = 867.071430000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM4_PRICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM4_PRICE"]')
          ParentFont = False
        end
        object Memo194: TfrxMemoView
          Left = 377.173470000000000000
          Top = 867.071430000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM4_PRICE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM4_PRICE"]')
          ParentFont = False
        end
        object Memo195: TfrxMemoView
          Left = 471.370073860000000000
          Top = 867.071430000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ITEM4_TAX'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."ITEM4_TAX"]')
          ParentFont = False
        end
        object TaxTitle2: TfrxMemoView
          Left = 18.677180000000000000
          Top = 515.472790000000000000
          Width = 173.858380000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clRed
          Font.Height = -23
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #51204#51088' '#49464#44552#44228#49328#49436)
          ParentFont = False
        end
        object Memo197: TfrxMemoView
          Left = 544.693260000000000000
          Top = 863.779529999999900000
          Width = 52.913385830000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clRed
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
        object Memo127: TfrxMemoView
          Left = 544.693260000000000000
          Top = 333.133860710000000000
          Width = 52.913385830000000000
          Height = 24.566929130000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clBlue
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
        end
      end
    end
  end
end
