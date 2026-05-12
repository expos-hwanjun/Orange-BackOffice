inherited CornerCompanyCreditForm: TCornerCompanyCreditForm
  Caption = #50629#51109' '#48120#51648#44553#44552' '#51648#44553' '#46321#47197
  ClientHeight = 602
  ClientWidth = 943
  HelpFile = #54980#48169'/'#51076#45824#44288#47532'/'#51076#45824#50629#51109' '#48120#51648#44553#44552' '#51648#44553' '#46321#47197'.htm'
  ExplicitWidth = 959
  ExplicitHeight = 641
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 943
    ExplicitWidth = 943
    inherited ButtonToolBar: TAdvToolBar
      Left = 497
      ExplicitLeft = 497
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
  inherited Grid: TcxGrid
    Width = 937
    Height = 531
    ExplicitWidth = 937
    ExplicitHeight = 531
    inherited GridBandedTableView: TcxGridBandedTableView
      inherited GridBandedTableViewCompanyCode: TcxGridBandedColumn
        Caption = #50629#51109#53076#46300
      end
      inherited GridBandedTableViewCompanyName: TcxGridBandedColumn
        Caption = #50629#51109#51060#47492
      end
    end
  end
  inherited EditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
