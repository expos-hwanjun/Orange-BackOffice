inherited BuySaledForm: TBuySaledForm
  Left = 300
  Top = 120
  Caption = #50948#53441#49345#54408' '#54032#47588#48516' '#47588#51077
  ClientHeight = 612
  ClientWidth = 964
  HelpFile = #54980#48169'/'#48156#51452#47588#51077#44288#47532'/'#54032#47588#48516'_'#47588#51077'.htm'
  ExplicitWidth = 980
  ExplicitHeight = 650
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 964
    ExplicitWidth = 964
    inherited ButtonToolBar: TAdvToolBar
      Left = 604
      ExplicitLeft = 604
      inherited ButtonToolBarDeleteButton: TAdvGlowButton
        Visible = False
      end
    end
    inherited ConditionToolBar: TAdvToolBar
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
        OnKeyDown = ConditionToolBarToDateEditKeyDown
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        Visible = True
        AnchorX = 166
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        AnchorX = 298
        AnchorY = 16
      end
    end
  end
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 25
  end
  object Grid: TcxGrid [2]
    AlignWithMargins = True
    Left = 3
    Top = 68
    Width = 958
    Height = 541
    Align = alClient
    TabOrder = 2
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object GridDBTableView: TcxGridDBTableView
      Tag = 99
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = GridDBTableViewBuyAmt
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
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      object GridDBTableViewSaleDate: TcxGridDBColumn
        Caption = #54032#47588#51068#51088
        DataBinding.FieldName = 'YMD_SALE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 110
      end
      object GridDBTableViewCompanyName: TcxGridDBColumn
        Caption = #44144#47000#52376
        DataBinding.FieldName = 'NM_TRDPL'
        HeaderAlignmentHorz = taCenter
        Width = 200
      end
      object GridDBTableViewNetAmt: TcxGridDBColumn
        Caption = #44277#44553#44032
        DataBinding.FieldName = 'AMT_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object GridDBTableViewVatAmt: TcxGridDBColumn
        Caption = #48512#44032#49464
        DataBinding.FieldName = 'AMT_VAT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 90
      end
      object GridDBTableViewBuyAmt: TcxGridDBColumn
        Caption = #47588#51077#44552#50529
        DataBinding.FieldName = 'AMT_BUY'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
    end
    object GridSubDBTableView: TcxGridDBTableView
      Tag = 99
      DataController.DetailKeyFieldNames = 'LINK'
      DataController.MasterKeyFieldNames = 'LINK'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsView.GroupByBox = False
      object GridSubDBTableViewPosNo: TcxGridDBColumn
        Caption = 'POS'
        DataBinding.FieldName = 'NO_POS'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 55
      end
      object GridSubDBTableViewBillNo: TcxGridDBColumn
        Caption = #51204#54364
        DataBinding.FieldName = 'NO_RCP'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 55
      end
      object GridSubDBTableViewGoodsCode: TcxGridDBColumn
        Caption = #49345#54408#53076#46300
        DataBinding.FieldName = 'CD_GOODS'
        HeaderAlignmentHorz = taCenter
        Width = 105
      end
      object GridSubDBTableViewGoodsName: TcxGridDBColumn
        Caption = #49345#54408#51060#47492
        DataBinding.FieldName = 'NM_GOODS'
        HeaderAlignmentHorz = taCenter
        Width = 190
      end
      object GridSubDBTableViewGoodsSpec: TcxGridDBColumn
        Caption = #44508#44201
        DataBinding.FieldName = 'NM_SPEC'
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object GridSubDBTableViewBuyPrice: TcxGridDBColumn
        Caption = #47588#51077#45800#44032
        DataBinding.FieldName = 'PR_BUY'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 70
      end
      object GridSubDBTableViewBuyQty: TcxGridDBColumn
        Caption = #49688#47049
        DataBinding.FieldName = 'QTY_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 55
      end
      object GridSubDBTableViewBuyAmt: TcxGridDBColumn
        Caption = #47588#51077#44552#50529
        DataBinding.FieldName = 'AMT_BUY'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 80
      end
    end
    object GridLevel: TcxGridLevel
      GridView = GridDBTableView
      object GridSubLevel: TcxGridLevel
        GridView = GridSubDBTableView
      end
    end
  end
  inherited Query: TUniQuery
    Left = 111
  end
  inherited SQL: TUniSQL
    Left = 146
  end
  inherited EditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 38
    PixelsPerInch = 96
  end
  inherited ToolBarStyler: TAdvToolBarOfficeStyler
    Left = 73
  end
  inherited StyleRepository: TcxStyleRepository
    Left = 4
    PixelsPerInch = 96
  end
  inherited Exec_Timer: TTimer
    Left = 214
  end
  object DataSource: TDataSource
    Left = 905
    Top = 405
  end
  object SubDataSource: TDataSource
    Left = 905
    Top = 440
  end
end
