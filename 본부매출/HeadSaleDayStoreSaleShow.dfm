inherited HeadSaleDayStoreSaleShowForm: THeadSaleDayStoreSaleShowForm
  Tag = 2
  Caption = #51068#51088#48324' '#47588#51109#47588#52636'('#48376#48512')'
  ClientHeight = 690
  ClientWidth = 1098
  Visible = False
  ExplicitWidth = 1114
  ExplicitHeight = 729
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Top = 494
    Width = 1098
    Visible = False
    ExplicitTop = 494
    ExplicitWidth = 1098
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1098
    ExplicitWidth = 1098
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
        AnchorX = 674
        AnchorY = 16
      end
      inherited cxLabel1: TcxLabel
        AnchorX = 829
        AnchorY = 16
      end
      inherited cxLabel2: TcxLabel
        AnchorX = 440
        AnchorY = 16
      end
    end
  end
  inherited Grid: TcxGrid
    Width = 1092
    Height = 423
    RootLevelOptions.DetailTabsPosition = dtpNone
    ExplicitWidth = 1092
    ExplicitHeight = 423
    inherited GridTableView: TcxGridTableView
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewStoreName
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewDcAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewServiceAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewTipAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewSaleAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewTaxAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewDeliveryCount
        end
        item
          Format = ',0'
          Kind = skAverage
          Column = GridTableViewGuestCount
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewRcpCount
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewNetAmt
        end
        item
          Format = ',0 '#44148
          Kind = skCount
          Column = GridTableViewSaleDate
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewTotSaleAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewSoonSaleAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridTableViewDeliveryAmt
        end>
      OptionsView.Footer = False
      inherited GridTableViewSaleDate: TcxGridColumn
        Tag = 98
        Visible = True
        Width = 119
      end
      inherited GridTableViewStoreName: TcxGridColumn
        Tag = 98
      end
    end
  end
  inherited ChartPanel: TAdvPanel
    Top = 500
    Width = 1098
    Visible = False
    ExplicitTop = 500
    ExplicitWidth = 1098
    FullHeight = 220
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited dxComponentPrinter: TdxComponentPrinter
    PixelsPerInch = 96
    inherited dxComponentPrinter1Link1: TdxGridReportLink
      ReportDocument.CreationDate = 45541.517586921300000000
      PixelsPerInch = 96
      BuiltInReportLink = True
    end
  end
end
