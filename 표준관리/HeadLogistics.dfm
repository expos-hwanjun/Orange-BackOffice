inherited HeadLogisticsForm: THeadLogisticsForm
  Tag = 3
  Caption = #47932#47448#49468#53552#44288#47532
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
  inherited GridPanel: TPanel
    inherited Grid: TcxGrid
      inherited GridTableView: TcxGridTableView
        inherited GridTableViewCompanyCode: TcxGridColumn
          Caption = #47932#47448#53076#46300
        end
        inherited GridTableViewCompanyName: TcxGridColumn
          Caption = #47932#47448#51060#47492
        end
      end
    end
  end
  inherited MainPanel: TPanel
    inherited TopPanel: TPanel
      ExplicitTop = -1
      inherited CompanyCodeLabel: TLabel
        Left = 19
        Width = 52
        Caption = #47932#47448#53076#46300
        ExplicitLeft = 19
        ExplicitWidth = 52
      end
      inherited CompanyNameLabel: TLabel
        Left = 19
        Width = 52
        Caption = #47932#47448#51060#47492
        ExplicitLeft = 19
        ExplicitWidth = 52
      end
      inherited CompanyCodeCreateButton: TAdvSmoothButton
        OnClick = nil
        TMSStyle = 0
      end
    end
    inherited CornerPanel: TPanel
      Height = 0
      Visible = True
      ExplicitHeight = 0
    end
    inherited BottomPanel: TPanel
      Top = 308
      ExplicitTop = 308
    end
  end
  inherited BuyGrid: TcxGrid
    Visible = False
  end
  inherited EditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
