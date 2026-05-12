inherited HeadLanguageForm: THeadLanguageForm
  Tag = 1
  Caption = #45796#44397#50612' '#44288#47532
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    inherited ConditionToolBar: TAdvToolBar
      inherited ConditionToolBarDateLabel: TcxLabel
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        AnchorX = 333
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        AnchorX = 465
        AnchorY = 16
      end
    end
  end
  inherited MainPanel: TPanel
    inherited EnglishEdit: TcxTextEdit
      ExplicitHeight = 25
    end
    inherited JapanseEdit: TcxTextEdit
      ExplicitHeight = 25
    end
    inherited VietnamensEdit: TcxTextEdit
      ExplicitHeight = 25
    end
    inherited KoreanEdit: TcxTextEdit
      ExplicitHeight = 25
    end
    inherited ThaiEdit: TcxTextEdit
      ExplicitHeight = 25
    end
    inherited IndoEdit: TcxTextEdit
      ExplicitHeight = 25
    end
    inherited FrenchEdit: TcxTextEdit
      ExplicitHeight = 25
    end
    inherited GermanEdit: TcxTextEdit
      ExplicitHeight = 25
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
