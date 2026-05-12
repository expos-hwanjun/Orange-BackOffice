inherited HeadMemberRankForm: THeadMemberRankForm
  Tag = 1
  Caption = #54924#50896#44396#48516' '#51312#51221'('#48376#48512')'
  HelpFile = ''
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
  inherited GridPanel: TGridPanel
    inherited RankPanel: TPanel
      inherited CountLabel: TcxLabel
        Style.IsFontAssigned = True
        AnchorX = 179
      end
      inherited LastChangeLabel: TcxLabel
        Style.IsFontAssigned = True
        AnchorX = 185
      end
      inherited PriodLabel: TcxLabel
        AnchorX = 67
        AnchorY = 66
      end
      inherited TermLabel: TcxLabel
        AnchorX = 207
        AnchorY = 66
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
