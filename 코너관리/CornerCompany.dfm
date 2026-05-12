inherited CornerCompanyForm: TCornerCompanyForm
  Tag = 2
  Caption = #53076#45320#44288#47532
  ClientHeight = 967
  ClientWidth = 971
  HelpFile = ''
  ExplicitWidth = 987
  ExplicitHeight = 1006
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Height = 777
    ExplicitHeight = 664
  end
  inherited AdvSplitter: TAdvSplitter
    Top = 842
    Width = 971
    ExplicitLeft = 0
    ExplicitTop = 481
    ExplicitWidth = 964
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 971
    ExplicitWidth = 971
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
    Height = 777
    ExplicitHeight = 777
    inherited Grid: TcxGrid
      Height = 771
      ExplicitHeight = 771
      inherited GridTableView: TcxGridTableView
        inherited GridTableViewCompanyCode: TcxGridColumn
          Caption = #50629#51109#53076#46300
        end
        inherited GridTableViewCompanyName: TcxGridColumn
          Caption = #50629#51109#51060#47492
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Width = 705
    Height = 777
    ExplicitWidth = 705
    ExplicitHeight = 777
    inherited TopPanel: TPanel
      Width = 705
      ExplicitWidth = 705
      inherited CompanyCodeLabel: TLabel
        Left = 20
        Width = 52
        Caption = #50629#51109#53076#46300
        ExplicitLeft = 20
        ExplicitWidth = 52
      end
      inherited CompanyNameLabel: TLabel
        Left = 20
        Width = 52
        Caption = #50629#51109#51060#47492
        ExplicitLeft = 20
        ExplicitWidth = 52
      end
      inherited TaxComboBox: TcxComboBox
        Properties.Items.Strings = (
          #47732#49464
          #44284#49464'('#54252#54632')')
      end
      inherited CompanyCodeCreateButton: TAdvGlowButton
        Anchors = [akLeft, akTop, akBottom]
      end
    end
    inherited ClientPanel: TPanel
      Width = 705
      ExplicitWidth = 705
    end
    inherited CornerPanel: TPanel
      Width = 705
      Height = 115
      ExplicitWidth = 705
      ExplicitHeight = 115
      inherited VanGroupBox: TcxGroupBox
        Left = 321
        Top = 4
        ExplicitLeft = 321
        ExplicitTop = 4
      end
      inherited VanRateGroupBox: TcxGroupBox
        Left = 22
        Top = 6
        ExplicitLeft = 22
        ExplicitTop = 6
        inherited Label4: TLabel
          Width = 160
          Caption = '% ('#49688#54364', '#49345#54408#44428', '#50808#49345','#44228#51340')'
          ExplicitWidth = 160
        end
      end
    end
    inherited BottomPanel: TPanel
      Top = 423
      Width = 705
      ExplicitTop = 423
      ExplicitWidth = 705
    end
  end
  inherited BuyGrid: TcxGrid
    Top = 848
    Width = 965
    Height = 116
    Visible = False
    ExplicitTop = 848
    ExplicitWidth = 965
    ExplicitHeight = 116
  end
  inherited EditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
