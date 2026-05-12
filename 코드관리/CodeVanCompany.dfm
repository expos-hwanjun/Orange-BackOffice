inherited CodeVanCompanyForm: TCodeVanCompanyForm
  Tag = 2
  Caption = #45796#51473#49324#50629#51088' '#44288#47532
  ClientHeight = 751
  ExplicitHeight = 790
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Height = 552
    ExplicitHeight = 506
  end
  inherited AdvSplitter: TAdvSplitter
    Top = 617
    Visible = False
    ExplicitTop = 571
  end
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
    Height = 552
    ExplicitHeight = 552
    inherited Grid: TcxGrid
      Height = 546
      ExplicitHeight = 546
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
    Height = 552
    ExplicitHeight = 552
    inherited TopPanel: TPanel
      inherited CompanyCodeLabel: TLabel
        Left = 21
        Width = 52
        Caption = #50629#51109#53076#46300
        ExplicitLeft = 21
        ExplicitWidth = 52
      end
      inherited CompanyNameLabel: TLabel
        Left = 21
        Width = 52
        Caption = #50629#51109#51060#47492
        ExplicitLeft = 21
        ExplicitWidth = 52
      end
      inherited TaxComboBox: TcxComboBox
        ExplicitHeight = 25
      end
      inherited CompanyCodeEdit: TcxTextEdit
        ExplicitHeight = 25
      end
      inherited CompanyNameEdit: TcxTextEdit
        ExplicitHeight = 25
      end
    end
    inherited ClientPanel: TPanel
      inherited CEONameEdit: TcxTextEdit
        ExplicitHeight = 25
      end
      inherited IDNoEdit: TcxMaskEdit
        ExplicitHeight = 25
      end
      inherited JongmokEdit: TcxTextEdit
        ExplicitHeight = 25
      end
      inherited UptaeEdit: TcxTextEdit
        ExplicitHeight = 25
      end
      inherited TelNoEdit: TcxTextEdit
        ExplicitHeight = 25
      end
      inherited FaxNoEdit: TcxTextEdit
        ExplicitHeight = 25
      end
      inherited ZipCodeEdit: TcxButtonEdit
        ExplicitHeight = 25
      end
      inherited Addr1Edit: TcxTextEdit
        ExplicitHeight = 25
      end
      inherited Addr2Edit: TcxTextEdit
        ExplicitHeight = 25
      end
      inherited MobileTelNoEdit: TcxTextEdit
        ExplicitHeight = 25
      end
      inherited EMailEdit: TcxTextEdit
        ExplicitHeight = 25
      end
      inherited ContactNameEdit: TcxTextEdit
        ExplicitHeight = 25
      end
      inherited OrderCreditAmtEdit: TcxCurrencyEdit
        ExplicitHeight = 25
      end
    end
    inherited CornerPanel: TPanel
      Height = 108
      ExplicitHeight = 108
      inherited VanGroupBox: TcxGroupBox
        Left = 6
        Top = 7
        ExplicitLeft = 6
        ExplicitTop = 7
        inherited VanPasswordEdit: TcxTextEdit
          ExplicitHeight = 25
        end
        inherited VanSerialNoEdit: TcxTextEdit
          ExplicitHeight = 25
        end
        inherited VanTidEdit: TcxTextEdit
          ExplicitHeight = 25
        end
      end
      inherited VanRateGroupBox: TcxGroupBox
        Left = 257
        Top = 6
        Visible = False
        ExplicitLeft = 257
        ExplicitTop = 6
        inherited CashRateEdit: TcxCurrencyEdit
          ExplicitHeight = 25
        end
        inherited CardRateEdit: TcxCurrencyEdit
          ExplicitHeight = 25
        end
        inherited DefaultRateEdit: TcxCurrencyEdit
          ExplicitHeight = 25
        end
        inherited CashrcpRateEdit: TcxCurrencyEdit
          ExplicitHeight = 25
        end
      end
    end
    inherited BottomPanel: TPanel
      Top = 416
      ExplicitTop = 416
      inherited UseYNComboBox: TcxComboBox
        ExplicitHeight = 25
      end
    end
  end
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 25
  end
  inherited BuyGrid: TcxGrid
    Top = 623
    Visible = False
    ExplicitTop = 623
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
