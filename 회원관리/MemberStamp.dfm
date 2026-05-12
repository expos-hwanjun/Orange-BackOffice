inherited MemberStampForm: TMemberStampForm
  Tag = 1
  Caption = #49828#53596#54532' '#51201#47549'/'#49324#50857' '#46321#47197
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
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
    inherited Grid: TcxGrid
      inherited GridTableView: TcxGridTableView
        inherited GridTableViewPoint: TcxGridColumn
          Caption = #49828#53596#54532
        end
      end
    end
  end
  inherited MainPanel: TPanel
    inherited SavePanel: TPanel
      inherited SaveCashLabel: TLabel
        Caption = #51201#47549' '#49828#53596#54532
      end
    end
    inherited UsePanel: TPanel
      inherited UsePointLabel: TLabel
        Caption = #49324#50857' '#49828#53596#54532
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
