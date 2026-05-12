inherited HeadSaleZoneSaleShowForm: THeadSaleZoneSaleShowForm
  Tag = 1
  Caption = #49345#44428#48324' '#47588#52636#51312#54924'('#48376#48512')'
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
        inherited GridTableViewLocalName: TcxGridColumn
          Caption = #49345#44428#47749
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Enabled = False
    inherited StorePanel: TAdvPanel
      Left = 40
      Caption.ColorTo = clHighlight
      Position.Key = 'HeadSaleZoneSaleShowForm'
      ExplicitLeft = 40
      FullHeight = 385
    end
    inherited TimePanel: TAdvPanel
      Left = 40
      Top = 463
      Caption.ColorTo = clHighlight
      Position.Key = 'HeadSaleZoneSaleShowForm'
      ExplicitLeft = 40
      ExplicitTop = 463
      FullHeight = 220
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
