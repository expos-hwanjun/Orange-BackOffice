inherited BuyHeadOrderForm: TBuyHeadOrderForm
  Left = 300
  Top = 122
  ClientHeight = 606
  ClientWidth = 990
  ExplicitLeft = 300
  ExplicitTop = 112
  ExplicitHeight = 606
  ExplicitWidth = 990
  Caption = #48156#51452#46321#47197'('#48376#49324')'
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1226
    ExplicitWidth = 116
    inherited ButtonToolBar: TAdvToolBar
      Left = 683
      ExplicitLeft = 683
    end
    inherited ConditionToolBar: TAdvToolBar
      Width = 406
      ExplicitWidth = 406
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
        Left = 330
        ExplicitLeft = 330
        ExplicitWidth = 0
        Width = 0
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 330
        ExplicitLeft = 330
        ExplicitWidth = 0
        Width = 0
      end
    end
  end
  inherited MainPanel: TPanel
    Width = 1226
    Height = 124
    ExplicitWidth = 116
    ExplicitHeight = 124
    inherited CompanyCodeLabel: TLabel
      Left = 7
      Top = 133
      ExplicitLeft = 7
      ExplicitTop = 133
    end
    inherited CommentLabel: TLabel
      Top = 69
      ExplicitTop = 69
    end
    inherited OrderAmtLabel: TLabel
      Top = 88
      ExplicitTop = 88
    end
    inherited UserNameLabel: TLabel
      Top = 44
      ExplicitTop = 44
    end
    inherited Label1: TLabel
      Top = 16
      ExplicitTop = 16
    end
    inherited Label2: TLabel
      Top = 45
      ExplicitTop = 45
    end
    inherited CompanyNameEdit: TcxTextEdit
      Left = 146
      Top = 129
      ExplicitLeft = 146
      ExplicitTop = 129
    end
    inherited CommentMemo: TcxMemo
      Top = 71
      ExplicitTop = 71
    end
    inherited StatusEdit: TcxTextEdit
      Left = 356
      Top = 128
      ExplicitLeft = 356
      ExplicitTop = 128
    end
    inherited CompanyCodeEdit: TcxButtonEdit
      Left = 64
      Top = 129
      Enabled = False
      ExplicitLeft = 64
      ExplicitTop = 129
    end
    inherited GridDeleteButton: TButton
      Top = 84
      ExplicitTop = 84
    end
    inherited ExcelLoadButton: TButton
      Left = 702
      Top = 14
      ExplicitLeft = 702
      ExplicitTop = 14
    end
    inherited GoodsBatchButton: TButton
      Top = 49
      ExplicitTop = 49
    end
    inherited OrderAmtEdit: TcxCurrencyEdit
      Top = 85
      Style.IsFontAssigned = True
      ExplicitTop = 85
    end
    inherited DamdangNameEdit: TcxTextEdit
      Top = 41
      ExplicitTop = 41
    end
    inherited DeliveryPlaceEdit: TcxTextEdit
      Top = 12
      ExplicitTop = 12
    end
    inherited DamdangTelEdit: TcxTextEdit
      Top = 41
      ExplicitTop = 41
    end
  end
  inherited Grid: TcxGrid
    Top = 157
    Width = 1226
    Height = 415
    ExplicitTop = 157
    ExplicitWidth = 116
    ExplicitHeight = 432
  end
  inherited EditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited FastReport: TfrxReport
    Datasets = <
      item
        DataSet = FastReportOrderDataSet
        DataSetName = 'FastReportOrderDataSet'
      end>
    Variables = <>
    Style = <>
    inherited Page: TfrxReportPage
      inherited PageFooter: TfrxPageFooter
        inherited PageLabel: TfrxSysMemoView
          Memo.UTF8W = (
            '[PAGE#] / [TOTALPAGES#]')
        end
        inherited ProgramNameLabel: TfrxMemoView
          Memo.UTF8W = (
            '('#51452')'#51061#49828#53944#47548#54252#49828)
        end
        inherited PrintTime: TfrxMemoView
          Memo.UTF8W = (
            #52636#47141#51068#49884' ')
        end
      end
      inherited ReportTitle: TfrxReportTitle
        inherited Memo19: TfrxMemoView
          Memo.UTF8W = (
            #45225#54408#51109#49548)
        end
        inherited Memo20: TfrxMemoView
          Memo.UTF8W = (
            #48156#51452#45812#45817)
        end
        inherited Memo23: TfrxMemoView
          Memo.UTF8W = (
            #50672' '#46973' '#52376)
        end
        inherited Memo25: TfrxMemoView
          Memo.UTF8W = (
            #48156#51452#44552#50529)
        end
        inherited Memo2: TfrxMemoView
          Memo.UTF8W = (
            #48156'  '#51452'  '#49436)
        end
        inherited Memo18: TfrxMemoView
          Memo.UTF8W = (
            #48156' '#51452' '#52376)
        end
        inherited Memo1: TfrxMemoView
          Memo.UTF8W = (
            #48708'     '#44256)
        end
        inherited Memo3: TfrxMemoView
          Memo.UTF8W = (
            #48156#51452#51068#51088)
        end
      end
      inherited SaleData: TfrxMasterData
        inherited SaleTypeLabel: TfrxMemoView
          Memo.UTF8W = (
            '[FastReportOrderDataSet."SEQ"]')
        end
        inherited SaleAmtLabel: TfrxMemoView
          Memo.UTF8W = (
            '[FastReportOrderDataSet."CD_GOODS"]')
        end
        inherited SaleNetAmtLabel: TfrxMemoView
          Memo.UTF8W = (
            '[FastReportOrderDataSet."NM_SPEC"]')
        end
        inherited SaleNotAmtLabel: TfrxMemoView
          Memo.UTF8W = (
            '[FastReportOrderDataSet."NM_GOODS"]')
        end
        inherited SalePlanAmtLabel: TfrxMemoView
          Memo.UTF8W = (
            '[FastReportOrderDataSet."QTY_ORDER"]')
        end
        inherited SalePlanRateLabel: TfrxMemoView
          Memo.UTF8W = (
            '[FastReportOrderDataSet."PR_ORDER"]')
        end
        inherited SaleCustomerAmtLabel: TfrxMemoView
          Memo.UTF8W = (
            '[FastReportOrderDataSet."AMT_DUTY"]')
        end
      end
      inherited OrderHeader: TfrxHeader
        inherited SaleNetAmtCaptionLabel: TfrxMemoView
          Memo.UTF8W = (
            #49345'  '#54408'  '#47749)
        end
        inherited SaleNotAmtCaptionLabel: TfrxMemoView
          Memo.UTF8W = (
            #49345#54408#53076#46300)
        end
        inherited SaleVatAmtCaptionLabel: TfrxMemoView
          Memo.UTF8W = (
            #45800' '#44032)
        end
        inherited SalePlanAmtCaptionLabel: TfrxMemoView
          Memo.UTF8W = (
            #44277#44553#44032#50529)
        end
        inherited Memo27: TfrxMemoView
          Memo.UTF8W = (
            #44508'  '#44201)
        end
        inherited Memo28: TfrxMemoView
          Memo.UTF8W = (
            #49688#47049)
        end
        inherited SaleAmtCaptionLabel: TfrxMemoView
          Memo.UTF8W = (
            'No')
        end
      end
    end
  end
end
