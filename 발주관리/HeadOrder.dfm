inherited HeadOrderForm: THeadOrderForm
  Tag = 1
  Caption = #48156#51452#46321#47197'-'#48376#49324
  ClientWidth = 947
  ExplicitWidth = 963
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 947
    ExplicitWidth = 947
    inherited ButtonToolBar: TAdvToolBar
      Left = 415
      ExplicitLeft = 415
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
  inherited MainPanel: TPanel
    Width = 947
    TabOrder = 2
    ExplicitWidth = 947
    inherited OrderTotalAmtEdit: TcxCurrencyEdit
      Style.IsFontAssigned = True
    end
    inherited cxLabel1: TcxLabel
      Top = 37
      ExplicitTop = 37
      AnchorX = 45
      AnchorY = 51
    end
    inherited cxLabel2: TcxLabel
      AnchorX = 254
      AnchorY = 52
    end
    inherited MemoGroupBox: TAdvGroupBox
      inherited cxLabel3: TcxLabel
        AnchorX = 49
        AnchorY = 31
      end
      inherited cxLabel4: TcxLabel
        AnchorX = 49
        AnchorY = 60
      end
      inherited cxLabel5: TcxLabel
        AnchorX = 49
        AnchorY = 89
      end
    end
    inherited OrderStatusLabel: TcxLabel
      AnchorX = 475
      AnchorY = 20
    end
    inherited OrderTypeLabel: TcxLabel
      AnchorX = 331
      AnchorY = 51
    end
    inherited StoreCodeLabel: TcxLabel
      AnchorX = 46
      AnchorY = 20
    end
    inherited OrderNoLabel: TcxLabel
      AnchorX = 410
      AnchorY = 20
    end
    inherited CreditAmtEdit: TcxCurrencyEdit
      Style.IsFontAssigned = True
    end
    inherited RemainAmtEdit: TcxCurrencyEdit
      Style.IsFontAssigned = True
    end
    inherited RestCreditAmtEdit: TcxCurrencyEdit
      Style.IsFontAssigned = True
    end
  end
  inherited Grid: TcxGrid
    Top = 251
    Width = 947
    Height = 453
    TabOrder = 3
    ExplicitTop = 251
    ExplicitWidth = 947
    ExplicitHeight = 453
  end
  inherited GoodsPanel: TPanel
    Width = 947
    Height = 50
    ExplicitWidth = 947
    ExplicitHeight = 50
    inherited SearchEdit: TCurvyEdit
      Top = 13
      ExplicitTop = 13
    end
    inherited GoodsFindButton: TAdvGlowButton
      Top = 12
      Width = 174
      Height = 29
      TabOrder = 4
      ExplicitTop = 12
      ExplicitWidth = 174
      ExplicitHeight = 29
    end
    inherited GoodsBatchButton: TAdvGlowButton
      Left = 505
      Top = 12
      Width = 174
      Height = 29
      TabOrder = 3
      ExplicitLeft = 505
      ExplicitTop = 12
      ExplicitWidth = 174
      ExplicitHeight = 29
    end
    inherited GridDeleteButton: TAdvGlowButton
      Top = 12
      Height = 29
      TabOrder = 2
      ExplicitTop = 12
      ExplicitHeight = 29
    end
    inherited GoodsSearchButton: TAdvGlowButton
      Top = 12
      Height = 29
      TabOrder = 1
      ExplicitTop = 12
      ExplicitHeight = 29
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
