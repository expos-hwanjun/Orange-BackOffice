inherited MemberPaySaleShowForm: TMemberPaySaleShowForm
  Left = 300
  Top = 120
  Caption = #54924#50896' '#44208#51116#49688#45800#48324' '#47588#52636' '#51312#54924
  ClientHeight = 602
  ClientWidth = 1022
  OnDestroy = FormDestroy
  ExplicitWidth = 1038
  ExplicitHeight = 641
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1022
    ExplicitWidth = 1022
    inherited ButtonToolBar: TAdvToolBar
      Left = 676
      ExplicitLeft = 676
    end
    inherited ConditionToolBar: TAdvToolBar
      Width = 960
      ExplicitWidth = 960
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
        Caption = #54924#50896
        Visible = True
        ExplicitWidth = 51
        ExplicitHeight = 24
        Height = 24
        Width = 51
        AnchorX = 441
        AnchorY = 14
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Left = 755
        ExplicitLeft = 755
        ExplicitWidth = 81
        Width = 81
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 836
        ExplicitLeft = 836
      end
      inherited ConditionToolbarMonthRadioButton: TcxRadioButton
        Visible = True
      end
      inherited ConditionToolbarTodayRadioButton: TcxRadioButton
        Visible = True
      end
      inherited ConditionToolbarWeekRadioButton: TcxRadioButton
        Visible = True
      end
      object ConditionToolBarCompanyEdit: TcxButtonEdit
        Left = 466
        Top = 2
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ImeMode = imSHanguel
        Properties.OnButtonClick = ConditionToolBarCompanyEditPropertiesButtonClick
        Properties.OnChange = ConditionToolBarCompanyEditPropertiesChange
        Properties.OnValidate = ConditionToolBarCompanyEditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 10
        ImeMode = imSHanguel
        Width = 96
      end
      object ConditionToolBarComapnyNameLabel: TcxLabel
        Left = 562
        Top = 2
        AutoSize = False
        ParentFont = False
        Style.StyleController = EditStyleController
        Properties.Alignment.Vert = taVCenter
        Height = 25
        Width = 193
        AnchorY = 15
      end
    end
  end
  inherited Grid: TcxGrid
    Width = 1016
    Height = 531
    RootLevelOptions.DetailTabsPosition = dtpTop
    OnActiveTabChanged = GridActiveTabChanged
    ExplicitWidth = 1016
    ExplicitHeight = 531
    inherited GridTableView: TcxGridTableView
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewCashRcpAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewCardAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewNetAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewTaxAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewDutyfreeAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewSaleAmt
        end
        item
          Format = ',0'
          Kind = skSum
        end>
      DataController.Data = {
        2F0100000F00000044617461436F6E74726F6C6C6572310C0000001200000054
        6378537472696E6756616C75655479706512000000546378537472696E675661
        6C75655479706512000000546378537472696E6756616C756554797065140000
        0054637843757272656E637956616C7565547970651400000054637843757272
        656E637956616C75655479706512000000546378537472696E6756616C756554
        79706512000000546378537472696E6756616C75655479706512000000546378
        537472696E6756616C7565547970651400000054637843757272656E63795661
        6C7565547970651400000054637843757272656E637956616C75655479706514
        00000054637843757272656E637956616C756554797065140000005463784375
        7272656E637956616C75655479706500000000}
      Styles.ContentEven = StyleEven
      object GridTableViewSaleDate: TcxGridColumn
        Caption = #44396#47588#51068#51088
        DataBinding.FieldName = 'YMD_SALE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 110
      end
      object GridTableViewReceiptNo: TcxGridColumn
        Caption = #51204#54364#48264#54840
        DataBinding.FieldName = 'NO_RCP'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 70
      end
      object GridTableViewDsSale: TcxGridColumn
        Caption = #44396#48516
        DataBinding.FieldName = 'DS_SALE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 70
      end
      object GridTableViewCashRcpAmt: TcxGridColumn
        Caption = #54788#44552#50689#49688#51613
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASHRCP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object GridTableViewCardAmt: TcxGridColumn
        Caption = #49888#50857#52852#46300
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CARD'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object GridTableViewCardNo: TcxGridColumn
        Caption = #52852#46300#48264#54840
        DataBinding.FieldName = 'NO_CARD'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 200
      end
      object GridTableViewCardName: TcxGridColumn
        Caption = #52852#46300#49324#51060#47492
        DataBinding.FieldName = 'NM_CARDPL'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object GridTableViewApprovalNo: TcxGridColumn
        Caption = #49849#51064#48264#54840
        DataBinding.FieldName = 'NO_APPROVAL'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 80
      end
      object GridTableViewNetAmt: TcxGridColumn
        Caption = #44284#49464#44277#44553#44032
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 100
      end
      object GridTableViewTaxAmt: TcxGridColumn
        Caption = #48512#44032#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TAX'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 90
      end
      object GridTableViewDutyfreeAmt: TcxGridColumn
        Caption = #47732#49464#44277#44553#44032
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_FREE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 100
      end
      object GridTableViewSaleAmt: TcxGridColumn
        Caption = #54633#44228#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TOTAL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 100
      end
    end
    object GridBandedTableView1: TcxGridBandedTableView [1]
      Tag = 99
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column4
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column3
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column5
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column6
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column7
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column8
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column9
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column10
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column11
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column12
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column13
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column14
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column15
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column16
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column17
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column18
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column19
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column20
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column2
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column21
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column22
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableView1Column23
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      Bands = <
        item
          Width = 122
        end
        item
          Caption = #54633#44228
          Width = 316
        end
        item
          Caption = #54788#44552
          Width = 263
        end
        item
          Caption = #54788#44552#50689#49688#51613
          Width = 221
        end
        item
          Caption = #49888#50857#52852#46300
          Width = 225
        end
        item
          Caption = #50808#49345
          Width = 227
        end
        item
          Caption = #49345#54408#44428
          Width = 221
        end
        item
          Caption = #44592#53440
          Width = 237
        end>
      object GridBandedTableView1Column1: TcxGridBandedColumn
        Caption = #44396#47588#51068#51088
        DataBinding.FieldName = 'YMD_SALE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 126
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column3: TcxGridBandedColumn
        Caption = #44284#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column5: TcxGridBandedColumn
        Caption = #48512#44032#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TAX'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column4: TcxGridBandedColumn
        Caption = #47732#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_DUTYFREE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column2: TcxGridBandedColumn
        Caption = #54633#44228#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Position.BandIndex = 1
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column7: TcxGridBandedColumn
        Caption = #44284#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASH_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column6: TcxGridBandedColumn
        Caption = #47732#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASH_DUTYFREE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column8: TcxGridBandedColumn
        Caption = #48512#44032#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASH_TAX'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 2
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column10: TcxGridBandedColumn
        Caption = #44284#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASHRCP_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column11: TcxGridBandedColumn
        Caption = #48512#44032#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASHRCP_TAX'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 3
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column9: TcxGridBandedColumn
        Caption = #47732#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASHRCP_DUTYFREE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 3
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column13: TcxGridBandedColumn
        Caption = #44284#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CARD_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column14: TcxGridBandedColumn
        Caption = #48512#44032#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CARD_TAX'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 4
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column12: TcxGridBandedColumn
        Caption = #47732#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CARD_DUTYFREE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 4
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column16: TcxGridBandedColumn
        Caption = #44284#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TRUST_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column17: TcxGridBandedColumn
        Caption = #48512#44032#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TRUST_TAX'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 5
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column15: TcxGridBandedColumn
        Caption = #47732#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TRUST_DUTYFREE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 5
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column19: TcxGridBandedColumn
        Caption = #44284#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_GIFT_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column20: TcxGridBandedColumn
        Caption = #48512#44032#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_GIFT_TAX'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 6
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column18: TcxGridBandedColumn
        Caption = #47732#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_GIFT_DUTYFREE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 6
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column21: TcxGridBandedColumn
        Caption = #44284#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_ETC_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column22: TcxGridBandedColumn
        Caption = #48512#44032#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_ETC_TAX'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 7
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableView1Column23: TcxGridBandedColumn
        Caption = #47732#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_ETC_DUTYFREE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Position.BandIndex = 7
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
    end
    inherited GridLevel: TcxGridLevel
      Caption = ' '#52852#46300'/'#54788#50689' '
    end
    object GridLevel1: TcxGridLevel
      Caption = ' '#44208#51228#49688#45800#48324' '
      GridView = GridBandedTableView1
    end
  end
  inherited EditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited ButtonToolBarPrintButtonImageList: TImageList
    Bitmap = {
      494C0101040008005C0110001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
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
      00080000001000000029000000330000000BFFFFFFFFFFFFFFFFFAFAFAFFF9F9
      F9FFF9F9F9FFF9F9F9FFF9F9F9FFFBFBFBFF050505FF7C7C7CFF7C7C7CFF7C7C
      7CFF7C7C7CFF7C7C7CFF7C7C7CFF444444FF0000000000000000000000000000
      00020000000000000000000000000000002704050568030302520806064F0303
      032B0000000E00000001000000000000000000000000000000061B16167ACEB2
      B4F5FDDDDFFFF2D2D4FFDEBFC2FFB1989AF3706060D33B3232AE1D1819850907
      07580101012B0000000900000000000000000000000000000001000000030000
      00060000000B000000140000002000000030010101450303035B0A0A0A751717
      18902A2A2CA9525454CE242625B400000020FFFFFFFF646464FF323232FF3737
      37FF373737FF373737FF373737FF838383FF0B0B0BFF616161FF606060FF6060
      60FF636363FF606060FF606060FF373737FF0000000000000000010101340808
      087C0202025F0000002A0101013D434646BBA5A29BF19D9689E9B6B4B2E88987
      84CE494542A41C1A19700C0B0A480201011C00000000000000000000001B1811
      128C554344C6897071DEE8D0D1FCFFF0F0FFFFE9EAFFFFE3E6FFFBDADCFFDCC3
      C5FF857A7AD92D27279E000000330000000505130962070D096F070707780F10
      0F881B1D1C9C292C2AAE464547C26C6B6ED6919697E8B9C0C0F9CDD7D5FFD2DB
      D5FFCDE1D6FFFFFFFFFF737575D7000000278D8D8DFFBDBDBDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF070707FF979797FF969696FF9696
      96FF121212FF666666FF666666FF393939FF000000030000004B313131D48183
      83FF5D5D5DF7242424CF555656DFDFCFBDFFFFE8C7FFFFFFF0FFFFFFFFFFFFFF
      FFFFFFFFFFFFF0F2F4FFC1B9B3F70E0C0B61000000000000000A131010764D3E
      41B73E2A2EAB442F34BAC3B2B8F5F6E9ECFFF4D6D7FFF6D1D3FFC3A2A3EF947F
      80D9C0AFB1E8C8ADAFF5080607640000000C5A9B71EFB0C8BAFFC9CCCBFFCEDA
      D5FFD7E5DEFFECFAF6FFD6EBDEFFBDD9C5FFACD3B9FFD8EEE1FFA8D2B3FF4F92
      56FF347939FFB1D4B9FF828486DE0000002E111111FFFFFFFFFF737373FF2B2B
      2BFF2B2B2BFFDDDDDDFF727272FF7C7C7CFF010101FFFFFFFFFFFFFFFFFFFFFF
      FFFF1B1B1BFF808080FF808080FF484848FF0000003E373635DD9F9FA1FFC8C9
      CAFFC7C8C7FFB0B2B4FF949393FF9F8773FFB89D85FECCB59FFEE0C8B1FEF4E3
      D0FEFFF6E5FFF1E7E0FF474747B60000002D0000000000000020866D71DAFDF8
      EFFFABC2B2F7A2A19AEEDDBDC1FCECCFDCFFECCFDDFFE8C7D4FF5F4B51D10B07
      07770604045E020101370000000B0000000055926AEBC7DFD1FFE7FAF1FF79B9
      90FF68A97CFFBBD8C6FF7EB88FFF348847FF2C7E3EFF8DB596FF89BA93FF297E
      32FF33823AFFB0D5B8FF9B9F9FEA0101013B101010FFFFFFFFFF9B9B9BFF6161
      61FF616161FFE8E8E8FF999999FF9F9F9FFF010101FFFAFAFAFFF9F9F9FFF9F9
      F9FF1E1E1EFF8F8F8FFF8F8F8FFF505050FF09090970939594FFC3C6C5FFD1D1
      D2FFDEDFDFFFD9DEDFFFBEC1C3FFABB0B4FFA6B0B4FFA1A19EFFA29B95FFA191
      80FFA38F7BFF7B7170FD07070871000000000000000001000131997C83DEE3D0
      ABFF6F9A49FF97A852FFF2A55BFFF4AA74FFF2BA98FFF0C2B5FFC1A1A2F27060
      68CD302F31A811111083030202430000001C407E54E096BCA3FFC9E8D7FF4AA1
      68FF42975EFFA8CAB5FFABD5B8FF8DCA9DFF97CBA4FFB9D7C4FFD4EADDFFB4D3
      BCFFABCAB4FFDCF0E5FFACB3B3F302020247101010FFFFFFFFFFF1F1F1FFEAEA
      EAFFE9E9E9FFFCFCFCFFF1F1F1FFF1F1F1FF868686FF727272FF737373FF7373
      73FF787878FF737373FF727272FF767676FF0A0A0A6BACB0AFFED5DAD9FFE7E7
      E7FEEEF5F8FEDED7D4FEBF7857FEB36946FEB58A79FEBBB1AEFEB4B5B5FEB6B3
      BCFEA2A7A4FE6AA869FF111B119E0000000C0000000205030343AC9095EAFBBC
      95FFBEAE76FFBCA761FFDF7B11FFE38017FFE78923FFEC9033FFF59E4BFFFEB2
      70FFEDBD86FFEDD8BFFF3F3438B20603045D3E7E53E2699E79FFEAF5ECFFDBEF
      E3FFDCEEE3FFF6FBF9FFE2ECE8FF9DA7A1FF9EA9A2FFF1FAF9FFC6DECEFF6B9E
      74FF46834EFF8FB696FFC1C8C7FC04040456101010FFFFFFFFFF9C9C9CFF6767
      67FF676767FFE7E7E7FF9B9B9BFF747474FFB5B5B5FFFFFFFFFFA7A7A7FFD0D0
      D0FFC0C0C0FFD4D4D4FFF3F3F3FF747474FF0606065EB7BBB9FBF5F7F7FFF6F6
      F7FFF9FFFFFFEBC7ACFFD36625FFCA5716FFC25319FFBB5625FFB4572AFFBE87
      71FFD6D6D6FFD3F1D9FF2126219D0000000C000000060B090954C7A8AAF6FAB8
      8DFFE9C79BFFE5BE8CFFD97A1BFFDA7917FFDA7A18FFDC7C18FFDD801AFFE280
      16FFE98516FFFFD0A1FF42393DB10403035748875DE2649F7AFFE8F1EAFFD8E6
      DFFFA1C6B0FFA2C7B0FF527157FF141B14FF49684FFFDBEAE1FFBDDAC4FF4593
      52FF34823CFF85B58CFFCED9D6FF07070763101010FFFFFFFFFF7E7E7EFF3939
      39FF393939FFE0E0E0FF7C7C7CFF393939FF393939FFE0E0E0FF9E9E9EFFCCCC
      CCFFBABABAFFD0D0D0FFF2F2F2FF656565FF010202478A8B8BE4EFF0F0FFE3EC
      F2FFE7DCD3FEE8995EFEE88336FEE5853EFEE17E39FEDA7430FECF5A13FEC96C
      36FEEAE0D9FFFFFFFFFF1C1B1C8A000000050000000A0D0B0C63F2C7C4FFDAA9
      77FF84987EFFAB9869FFDB7B1DFFDD7D1DFFDD8223FFDE8628FFDE8A2CFFDC86
      26FFE08B27FFFFCDA4FF2F282BA101010141508E67E270AB8AFFDDECE4FFD8E9
      E0FF7ABB92FF338450FF002F05FF4B6C53FFCCE0D2FFDDEDE3FFDFF0E7FFC3DE
      CAFFBBD5C2FFD1E7DAFFDCE8E4FF0A0A0A72101010FFFFFFFFFFADADADFF8181
      81FF818181FFEBEBEBFFABABABFF818181FF818181FFECECECFF9E9E9EFFCCCC
      CCFFBABABAFFD0D0D0FFF2F2F2FF656565FF000000070304044A52575BC7C9CA
      CAFFCC8C66FFCC6524FFD5712EFFDE7934FFE58138FFEB873AFFEE8739FFF2BE
      98FFFFFFFFFFD9DBDCFB06060658000000000000001314111278FFD1C7FFC8A9
      7EFF42BECCFF64B7B6FFD4822AFFE28220FFE08A2DFFE29134FFE4973AFFE294
      34FFEA9E3DFFFFD4B3FF231E20930000003158946DE274AC8BFFCBE2D4FFFFFF
      FFFFD5E8DEFF2A734BFF024C1BFF639875FFD9E4DCFFFEFEFFFFDEEDE5FF8CB5
      94FF4F8A5AFF679B70FFD5E6DDFF11111283101010FFFFFFFFFFEEEEEEFFE5E5
      E5FFE5E5E5FFFBFBFBFFEEEEEEFFE5E5E5FFE5E5E5FFFBFBFBFF9E9E9EFFCCCC
      CCFFBABABAFFD0D0D0FFF2F2F2FF656565FF000000000000000008060548B99C
      81EBE0C1A4FFD5A586FFCF936DFFC68155FFC67544FFCE7237FFD79363FFECE5
      E0FFECEDEEFF333232A200000013000000000000002A241F2191FFDAD2FFD89D
      62FFB89F75FFC29456FFDA8527FFE18B2CFFE39438FFE69C40FFE9A347FFE7A0
      42FFF1AF52FFFCD7BCFF171416820000001F659E7AE586B498FFC7E0D0FFFAFC
      FBFF75AE93FF096839FF64A481FF5EA874FF5C986EFFC9DAD0FFDFEDE4FF67A9
      75FF3D8E4AFF6BA473FFDEF0E6FF1D1D1D98101010FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EFFCCCC
      CCFFBABABAFFD0D0D0FFF2F2F2FF656565FF00000000000000000C070344CDAE
      93E9FFFEECFFFFEDD3FFFCE4CAFFEDD9BEFFE3C8AEFF705A4ECE1D1E1E872A2D
      2F952424248D00000021000000000000000002010140352F31A1FFDACEFFDD8D
      47FFE19353FFE48D40FFE08625FFE29336FFE59D43FFE9A64DFFEDAE56FFEBAD
      51FFF8C16CFFF5DBC7FF0F0E0F74000000125B906ED9A8C6B4FFC5DDCEFFEFF9
      F6FF6FB393FF80BBA0FFF2FAF5FFD1EBDAFFA7CFB4FFBCD6C5FFEAF6F2FFDBEF
      E2FFD4EADBFFC1D0C7EEBBBFBDDD1414146B101010FFF9F9F9FF3F3F3FFF3838
      38FF383838FF383838FF383838FF383838FF383838FFE1E1E1FF9E9E9EFFCCCC
      CCFFBABABAFFD1D1D1FFF2F2F2FF656565FF000000000201001D83644BC0FFFF
      FFFFFFFFFFFFFFF8EEFFFFF3E3FFFFF8E7FFCCB499E606050434000000010000
      0007000000030000000000000000000000000B090A63544F52B7FFDDCDFFDA7E
      2EFFDA8C35FFD88F3CFFDA7E15FFE08D24FFE49A35FFE9A745FFEEB253FFEEB4
      53FFFECF7CFFEBD9CBFF0A090A650000000A1F472C9DC9DCD1FFC7D9CEFFE1F1
      E8FFE7F4ECFFEFF5F2FFE9F1EDFFE6F0ECFFE5EFEBFFD5E8DEFFC8DFD3FFDFEB
      E6FFB8D0C0FC353F3A8A0A0A0A350000000F101010FFFCFCFCFFAAAAAAFFA7A7
      A7FFA7A7A7FFA7A7A7FFA7A7A7FFA7A7A7FFA7A7A7FFF1F1F1FF9E9E9EFFC5C5
      C5FFD9D9D9FF919191FFC9C9C9FF878787FF0000000003020124644E3FABA08F
      82D2BCAC9FE2E0DAD5F3FEFBF9FFFEFCFAFF4C37269600000000000000000000
      000000000000000000000000000000000000100E0E73615C5EC8FFF6F3FFFFCB
      ABFFFDC59AFFFABE8BFFF8B878FFF6B771FFF3B96EFFF3BD6DFFF3C06DFFF3BE
      5EFFFFDC8BFFD6CCC2FD0B090A5D000000080108033A7FAF8EE8EEEAEEFFD2DF
      D6FFCEDED2FFCADCCFFFBFD7C8FFBFD7C8FFC0D6C8FFBED5C7FFB9D3C2FFD0DE
      D5FF9CBFA9F90A120C590000000000000000101010FFFDFDFDFFB9B9B9FFB5B5
      B5FFB5B5B5FFB5B5B5FFB5B5B5FFB5B5B5FFB5B5B5FFF5F5F5FFA2A2A2FF4040
      40FF505050FF525252FF6C6C6CFFF5F5F5FF0000000000000004010100180503
      022909050238190F075C46332493655242AB0703013200000000000000000000
      000000000000000000000000000000000000000000240A08084F2F292B8F3D36
      39AA63555AC1867778D7B09A9DEDE2C3C1FFF5D5CFFFFEDDD4FFFFE3D5FFFFE4
      CAFFFFFEE6FFBCB2B1F50504044A000000030000000205160A5B7EAD8DE6E7EC
      E9FFEDEBECFFE8EAE7FFE9EBE8FFE9EBE9FFE9ECE9FFEAEDEBFFEAEDEBFFFCF9
      FCFFDAE9E2FD08150B6600000000000000000F0F0FFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0A0FFCCCC
      CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000E0C0602411A120B5C0100001400000000000000000000
      0000000000000000000000000000000000000000000000000000000000070000
      00110000001D020202290605053508070743050405550B090A62110E0F6E1714
      157A1B1819810907085B0000000F000000000000000000000001010804392045
      2C9B699878DA86B093E682AA8EE482A78EE480A78CE47FA68BE47DA188E290B3
      9BEC7BA788EB0411085D0000000000000000545454FF0D0D0DFF0D0D0DFF0D0D
      0DFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D0DFF0D0D0DFF131313FFDCDC
      DCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF424D3E000000000000003E000000
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
    object ButtonToolBarPrintButtonPopupMenuFormat: TMenuItem
      AutoHotkeys = maManual
      Caption = #50577#49885#51648#52636#47141
      ImageIndex = 3
      OnClick = ButtonToolBarPrintButtonPopupMenuFormatClick
    end
  end
  inherited dxComponentPrinter: TdxComponentPrinter
    PreviewOptions.Caption = ''
    PreviewOptions.IsCaptionAssigned = True
    inherited dxComponentPrinter1Link1: TdxGridReportLink
      Active = False
      PrinterPage.Footer = 7900
      PrinterPage.Margins.Bottom = 18500
      PrinterPage.Margins.Top = 28300
      PrinterPage.PageFooter.CenterTitle.Strings = (
        ''
        '[Page # of Pages #]')
      PrinterPage.PageFooter.Font.Charset = ANSI_CHARSET
      PrinterPage.PageFooter.Font.Name = #47569#51008' '#44256#46357
      PrinterPage.PageHeader.CenterTitle.Strings = (
        #49888#50857#52852#46300'/'#54788#44552#50689#49688#51613' '#44396#47588#45236#50669
        '')
      PrinterPage.ScaleMode = smAdjust
      ReportDocument.CreationDate = 43301.584028483800000000
      ShrinkToPageWidth = False
      BuiltInReportLink = True
    end
  end
  object FastReport: TfrxReport
    Version = '6.4.9'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40809.499941076400000000
    ReportOptions.LastChange = 43284.618787141200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 107
    Top = 258
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.600000000000000000
      RightMargin = 10.600000000000000000
      TopMargin = 13.100000000000000000
      BottomMargin = 10.600000000000000000
      Frame.Typ = []
      MirrorMode = []
      OnAfterPrint = 'PageOnAfterPrint'
      object ReportTitle: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 132.724490000000000000
        Top = 18.897650000000000000
        Width = 1042.394374000000000000
        object Shape8: TfrxShapeView
          AllowVectorExport = True
          Left = 653.197280000000000000
          Top = 1.622032600000000000
          Width = 389.291338580000000000
          Height = 25.322834650000000000
          Frame.Typ = []
        end
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Left = 653.102362200000000000
          Top = 27.338590000000000000
          Width = 389.291338580000000000
          Height = 25.322834650000000000
          Frame.Typ = []
          Frame.TopLine.Color = clWhite
        end
        object StoreBizNoMemo: TfrxMemoView
          AllowVectorExport = True
          Left = 728.787880000000000000
          Top = 2.779530000000000000
          Width = 260.787570000000000000
          Height = 22.677165350000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '131-86-08557')
          ParentFont = False
        end
        object Shape5: TfrxShapeView
          AllowVectorExport = True
          Left = 653.193340000000000000
          Top = 78.022820000000000000
          Width = 389.291338580000000000
          Height = 25.320000000000000000
          Frame.Typ = []
        end
        object TitleMemo: TfrxMemoView
          AllowVectorExport = True
          Left = 136.063080000000000000
          Top = 11.338590000000000000
          Width = 388.440940000000000000
          Height = 36.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            #49888#50857#52852#46300'&'#54788#44552#50689#49688#51613' '#44396#47588#45236#50669)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SaleReceiptNoMemo: TfrxMemoView
          AllowVectorExport = True
          Left = 10.220470000000000000
          Top = 85.795300000000000000
          Width = 360.000000000000000000
          Height = 20.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #51204#54364#48264#54840)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object MemberNameMemo: TfrxMemoView
          AllowVectorExport = True
          Left = 10.118120000000000000
          Top = 61.913420000000000000
          Width = 609.448980000000000000
          Height = 20.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #47588#51077#52376' : '#44032#45208#45796' '#46020#47588#47560#53944' ('#51064#52380#51216')')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Shape3: TfrxShapeView
          AllowVectorExport = True
          Left = 851.905690000000000000
          Top = 78.322820000000000000
          Width = 37.574830000000000000
          Height = 24.566929130000000000
          Frame.Typ = []
        end
        object Shape7: TfrxShapeView
          AllowVectorExport = True
          Left = 630.858690000000000000
          Top = 1.811070000000000000
          Width = 22.236240000000000000
          Height = 127.000000000000000000
          Frame.Typ = []
        end
        object Shape12: TfrxShapeView
          AllowVectorExport = True
          Left = 653.193340000000000000
          Top = 103.322820000000000000
          Width = 389.291338582677000000
          Height = 25.320000000000000000
          Frame.Typ = []
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 632.803340000000000000
          Top = 23.472480000000000000
          Width = 18.677180000000000000
          Height = 98.267780000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #44277
            ''
            #44553
            ''
            #51088)
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 653.756340000000000000
          Top = 32.252010000000000000
          Width = 48.692950000000000000
          Height = 16.897650000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #49345' '#54840' '#47749)
          ParentFont = False
        end
        object Shape10: TfrxShapeView
          AllowVectorExport = True
          Left = 653.193340000000000000
          Top = 52.606370000000000000
          Width = 389.291338582677000000
          Height = 25.320000000000000000
          Frame.Typ = []
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 653.756340000000000000
          Top = 57.385900000000000000
          Width = 48.692950000000000000
          Height = 15.118120000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #51452'     '#49548)
          ParentFont = False
        end
        object Shape11: TfrxShapeView
          AllowVectorExport = True
          Left = 890.394250000000000000
          Top = 27.031540000000000000
          Width = 30.015770000000000000
          Height = 25.320000000000000000
          Frame.Typ = []
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 653.079160000000000000
          Top = 107.165430000000000000
          Width = 48.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #51204#54868#48264#54840)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 654.756340000000000000
          Top = 5.692950000000000000
          Width = 48.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #49324' '#50629' '#51088)
          ParentFont = False
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 699.803340000000000000
          Top = 1.811070000000000000
          Height = 126.992125984252000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object StoreNameMemo: TfrxMemoView
          AllowVectorExport = True
          Left = 708.453340000000000000
          Top = 29.456710000000000000
          Width = 174.960730000000000000
          Height = 22.015770000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #51061#49828#53944#47548#54252#49828)
          ParentFont = False
          VAlign = vaCenter
        end
        object StoreBossMemo: TfrxMemoView
          AllowVectorExport = True
          Left = 922.866730000000000000
          Top = 30.893760000000000000
          Width = 113.385900000000000000
          Height = 18.236240000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #54861#44600#46041)
          ParentFont = False
          VAlign = vaCenter
        end
        object StoreAddressMemo: TfrxMemoView
          AllowVectorExport = True
          Left = 703.217100000000000000
          Top = 54.252010000000000000
          Width = 333.260050000000000000
          Height = 21.795300000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #51064#52380#49884' '#50672#49688#44396' '#49569#46020' '#44284#54617#47196' 17-1')
          ParentFont = False
          VAlign = vaCenter
        end
        object StoreTelNoMemo: TfrxMemoView
          AllowVectorExport = True
          Left = 703.213050000000000000
          Top = 107.047310000000000000
          Width = 335.236240000000000000
          Height = 18.897650000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Tel. 1544-4171   Fax. 032-232-5560')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 653.803340000000000000
          Top = 83.149606299212600000
          Width = 48.692950000000000000
          Height = 15.118120000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #50629'     '#53468)
          ParentFont = False
        end
        object StoreUptaeMemo: TfrxMemoView
          AllowVectorExport = True
          Left = 703.217100000000000000
          Top = 83.322820000000000000
          Width = 135.464750000000000000
          Height = 15.118120000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #49436#48708#49828)
          ParentFont = False
        end
        object StoreJongmokMemo: TfrxMemoView
          AllowVectorExport = True
          Left = 892.362400000000000000
          Top = 83.149606300000000000
          Width = 148.779530000000000000
          Height = 18.897650000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #49548#54532#53944#50920#50612' '#44060#48156)
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 891.969080000000000000
          Top = 32.236240000000000000
          Width = 26.015770000000000000
          Height = 16.897650000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #45824#54364)
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 857.394250000000000000
          Top = 83.149660000000000000
          Width = 26.015770000000000000
          Height = 16.897650000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #51333#47785)
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 10.338590000000000000
          Top = 113.385900000000000000
          Width = 651.023810000000000000
          Height = 16.661410000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              #8251' '#48512#44032#44032#52824#49464#48277' '#49884#54665#47161'(06.02.09)'#51004#47196' '#49888#50857#52852#46300', '#54788#44552#50689#49688#51613' '#44396#47588#48516#50640' '#45824#54644#49436#45716' '#49464#44552#44228#49328#49436' '#48143' '#44228#49328#49436' '#48156#54665#51060' '#48520 +
              #44032#54633#45768#45796'.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object SignPicture: TfrxPictureView
          AllowVectorExport = True
          Left = 978.803340000000000000
          Top = 11.543290000000000000
          Width = 60.000000000000000000
          Height = 60.000000000000000000
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object SaleData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 24.188978820000000000
        Top = 257.008040000000000000
        Width = 1042.394374000000000000
        DataSet = FastReportDataSet
        DataSetName = 'FastReportDataSet'
        PrintIfDetailEmpty = True
        RowCount = 0
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 88.062992130000000000
          Top = 2.000000000000000000
          Width = 70.677165350000000000
          Height = 20.000000000000000000
          DataField = 'NO_RECEIPT'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.BottomLine.Style = fsDot
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."NO_RECEIPT"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 732.472440940000000000
          Top = 2.000000000000000000
          Width = 80.503937010000000000
          Height = 20.000000000000000000
          DataField = 'AMT_NET'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.BottomLine.Style = fsDot
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_NET"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 812.976377950000000000
          Top = 2.000000000000000000
          Width = 71.055118110000000000
          Height = 20.000000000000000000
          DataField = 'AMT_TAX'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.BottomLine.Style = fsDot
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_TAX"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Top = 2.000000000000000000
          Width = 88.440944880000000000
          Height = 20.000000000000000000
          DataField = 'YMD_SALE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.BottomLine.Style = fsDot
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."YMD_SALE"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 958.866141730000000000
          Top = 2.000000000000000000
          Width = 82.771653540000000000
          Height = 20.000000000000000000
          DataField = 'AMT_SALE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.BottomLine.Style = fsDot
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_SALE"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 289.133858270000000000
          Top = 2.000000000000000000
          Width = 84.283464570000000000
          Height = 20.000000000000000000
          DataField = 'AMT_CARD'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.BottomLine.Style = fsDot
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_CARD"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 884.031496060000000000
          Top = 2.000000000000000000
          Width = 74.834645670000000000
          Height = 20.000000000000000000
          DataField = 'AMT_DUTYFREE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.BottomLine.Style = fsDot
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_DUTYFREE"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 207.496062990000000000
          Top = 2.000000000000000000
          Width = 81.637795280000000000
          Height = 20.000000000000000000
          DataField = 'AMT_CASHRCP'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.BottomLine.Style = fsDot
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_CASHRCP"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 641.007874020000000000
          Top = 2.000000000000000000
          Width = 90.708661420000000000
          Height = 20.000000000000000000
          DataField = 'NO_APPROVAL'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.BottomLine.Style = fsDot
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."NO_APPROVAL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 519.685039370000000000
          Top = 2.000000000000000000
          Width = 120.944881890000000000
          Height = 20.000000000000000000
          DataField = 'NM_CARD'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.BottomLine.Style = fsDot
          Memo.UTF8W = (
            '[FastReportDataSet."NM_CARD"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 372.661417320000000000
          Top = 2.000000000000000000
          Width = 147.779527560000000000
          Height = 20.000000000000000000
          DataField = 'NO_CARD'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.BottomLine.Style = fsDot
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."NO_CARD"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 158.362204720000000000
          Top = 2.000000000000000000
          Width = 48.000000000000000000
          Height = 20.000000000000000000
          DataField = 'DS_SALE'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.BottomLine.Style = fsDot
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."DS_SALE"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object ReportSummary: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 24.803030000000000000
        Top = 340.157700000000000000
        Width = 1042.394374000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 958.866141730000000000
          Top = 3.779530000000000000
          Width = 82.771653540000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<FastReportDataSet."AMT_SALE">,SaleData)]')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 884.031496060000000000
          Top = 3.779530000000000000
          Width = 74.834645670000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<FastReportDataSet."AMT_DUTYFREE">,SaleData)]')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          AllowVectorExport = True
          Left = 812.976377950000000000
          Top = 3.779530000000000000
          Width = 71.055118110000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<FastReportDataSet."AMT_TAX">,SaleData)]')
          ParentFont = False
        end
        object SysMemo4: TfrxSysMemoView
          AllowVectorExport = True
          Left = 732.472440940000000000
          Top = 3.779530000000000000
          Width = 80.503937010000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<FastReportDataSet."AMT_NET">,SaleData)]')
          ParentFont = False
        end
        object SysMemo5: TfrxSysMemoView
          AllowVectorExport = True
          Left = 289.133858270000000000
          Top = 3.779530000000000000
          Width = 84.283464570000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<FastReportDataSet."AMT_CARD">,SaleData)]')
          ParentFont = False
        end
        object SysMemo7: TfrxSysMemoView
          AllowVectorExport = True
          Left = 207.496062990000000000
          Top = 3.779530000000000000
          Width = 81.637795280000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<FastReportDataSet."AMT_CASHRCP">,SaleData)]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 3.779530000000000000
          Width = 72.755720000000000000
          Height = 20.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            #65339' '#54633' '#44228' '#65341)
          ParentFont = False
          WordWrap = False
        end
        object SysMemo8: TfrxSysMemoView
          AllowVectorExport = True
          Left = 98.267780000000000000
          Top = 3.779530000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[LINE#]')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 150.181200000000000000
          Top = 3.779530000000000000
          Width = 23.621830000000000000
          Height = 20.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            #44148)
          ParentFont = False
          WordWrap = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 17.007874020000000000
        Top = 389.291590000000000000
        Width = 1042.394374000000000000
        object SysMemo6: TfrxSysMemoView
          AllowVectorExport = True
          Left = 313.700990000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[PAGE#] of [TOTALPAGES#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object PrintTime: TfrxMemoView
          AllowVectorExport = True
          Width = 264.567100000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #52636#47141#51068#49884' ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object StoreNameLabel: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 834.520224000000000000
          Width = 207.874150000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '('#51452')'#51061#49828#53944#47548#54252#49828)
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 24.188976377952800000
        Top = 173.858380000000000000
        Width = 1042.394374000000000000
        object SalePosNoCaptionMemo: TfrxMemoView
          AllowVectorExport = True
          Width = 88.440940000000000000
          Height = 23.811023620000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.ShadowWidth = 1.000000000000000000
          Frame.Typ = [ftTop, ftBottom]
          Fill.BackColor = 14540253
          HAlign = haCenter
          Memo.UTF8W = (
            #44396#47588#51068#51088)
          ParentFont = False
          VAlign = vaCenter
        end
        object SaleCashAmtCaptionMemo: TfrxMemoView
          AllowVectorExport = True
          Left = 88.188930000000000000
          Width = 70.677089690000000000
          Height = 23.811023620000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Fill.BackColor = 14540253
          HAlign = haCenter
          Memo.UTF8W = (
            #51204#54364#48264#54840)
          ParentFont = False
          VAlign = vaCenter
        end
        object SaleCreditAmtCaptionMemo: TfrxMemoView
          AllowVectorExport = True
          Left = 289.023500000000000000
          Width = 84.118120000000000000
          Height = 23.811023622047200000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Fill.BackColor = 14540253
          HAlign = haRight
          Memo.UTF8W = (
            #49888#50857#52852#46300)
          ParentFont = False
          VAlign = vaCenter
        end
        object SaleCashReceiptAmtCaptionMemo: TfrxMemoView
          AllowVectorExport = True
          Left = 813.133980310000000000
          Width = 71.055122990000000000
          Height = 23.811023622047200000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Fill.BackColor = 14540253
          HAlign = haRight
          Memo.UTF8W = (
            #48512#44032#49464)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 519.637778190000000000
          Width = 121.322834645669000000
          Height = 23.811023620000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Fill.BackColor = 14540253
          HAlign = haCenter
          Memo.UTF8W = (
            #52852#46300#49324#51060#47492)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 207.401670000000000000
          Width = 81.637634170000000000
          Height = 23.811023620000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Fill.BackColor = 14540253
          HAlign = haRight
          Memo.UTF8W = (
            #54788#44552#50689#49688#51613)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 372.630180000000000000
          Width = 147.779571500000000000
          Height = 23.811023622047200000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Fill.BackColor = 14540253
          HAlign = haCenter
          Memo.UTF8W = (
            #52852#46300#48264#54840)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 732.449290000000000000
          Width = 80.503937010000000000
          Height = 23.811023622047200000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Fill.BackColor = 14540253
          HAlign = haRight
          Memo.UTF8W = (
            #44284#49464#44277#44553#44032)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 158.504020000000000000
          Width = 48.755905511811000000
          Height = 23.811023620000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Fill.BackColor = 14540253
          HAlign = haCenter
          Memo.UTF8W = (
            #44396#48516)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 640.961040000000000000
          Width = 91.464566929133900000
          Height = 23.811023620000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Fill.BackColor = 14540253
          HAlign = haCenter
          Memo.UTF8W = (
            #49849#51064#48264#54840)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 884.071430000000000000
          Width = 74.834652990000000000
          Height = 23.811023622047200000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Fill.BackColor = 14540253
          HAlign = haRight
          Memo.UTF8W = (
            #47732#49464#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 958.780150000000000000
          Width = 83.149606299212600000
          Height = 23.811023620000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Fill.BackColor = 14540253
          HAlign = haRight
          Memo.UTF8W = (
            #54633#44228#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object FastReportDataSet: TfrxUserDataSet
    UserName = 'FastReportDataSet'
    OnCheckEOF = FastReportDataSetCheckEOF
    Fields.Strings = (
      'YMD_SALE'
      'NO_RECEIPT'
      'DS_SALE'
      'NO_CARD'
      'NM_CARD'
      'NO_APPROVAL'
      'AMT_CASHRCP'
      'AMT_CARD'
      'AMT_DUTYFREE'
      'AMT_NET'
      'AMT_TAX'
      'AMT_SALE')
    OnNewGetValue = FastReportDataSetNewGetValue
    Left = 111
    Top = 311
  end
end
