inherited HeadLetsOrderMenuForm: THeadLetsOrderMenuForm
  Tag = 1
  Caption = #54364#51456' '#47131#52768#50724#45908' '#47700#45684#44288#47532
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
    inherited AdvToolBar1: TAdvToolBar
      inherited SelectLabel: TcxLabel
        AnchorX = 223
        AnchorY = 16
      end
    end
  end
  inherited MainPanel: TPanel
    inherited PopupPanel: TAdvPanel
      FullHeight = 310
    end
    inherited MenuInfoPanel: TAdvPanel
      FullHeight = 310
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
