inherited CodeOnlinePLUForm: TCodeOnlinePLUForm
  Tag = 2
  Caption = #47784#48148#51068' PLU'
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    inherited ConditionToolBar: TAdvToolBar
      inherited ConditionToolBarDateLabel: TcxLabel
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        AnchorX = 602
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        AnchorX = 154
        AnchorY = 16
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 679
      end
      inherited SelectMenuNameLabel: TcxLabel
        Style.IsFontAssigned = True
        AnchorY = 26
      end
    end
  end
  inherited MainPanel: TPanel
    inherited ClassHeaderPanel: TPanel
      inherited Label2: TLabel
        Left = 355
        ExplicitLeft = 355
      end
      inherited Label6: TLabel
        Left = 645
        ExplicitLeft = 645
      end
      inherited ClassLineFeedButton: TSpeedButton
        Left = 561
        ExplicitLeft = 561
      end
      inherited ClassNameEdit: TcxTextEdit
        Left = 400
        ExplicitLeft = 400
      end
      inherited ClassPageEdit: TcxCurrencyEdit
        Left = 610
        ExplicitLeft = 610
      end
    end
    inherited MenuHeaderPanel: TPanel
      inherited LineFeedButton: TSpeedButton
        Left = 559
        ExplicitLeft = 559
      end
      inherited Label4: TLabel
        Left = 302
        ExplicitLeft = 302
      end
      inherited Label5: TLabel
        Left = 645
        ExplicitLeft = 645
      end
      inherited MenuNameEdit: TcxTextEdit
        Left = 348
        ExplicitLeft = 348
      end
      inherited MenuPageEdit: TcxCurrencyEdit
        Left = 610
        ExplicitLeft = 610
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
