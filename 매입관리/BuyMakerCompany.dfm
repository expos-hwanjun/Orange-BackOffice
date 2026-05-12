inherited BuyMakerCompanyForm: TBuyMakerCompanyForm
  Caption = #51228#51312#50629#52404' '#46321#47197
  ClientHeight = 579
  ClientWidth = 960
  ExplicitTop = 8
  ExplicitWidth = 976
  ExplicitHeight = 617
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Height = 514
    ExplicitHeight = 541
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 960
    ExplicitWidth = 960
    inherited ButtonToolBar: TAdvToolBar
      Left = 428
      ExplicitLeft = 428
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
  inherited GridPanel: TPanel
    Height = 514
    ExplicitHeight = 514
    inherited Grid: TcxGrid
      Height = 508
      ExplicitHeight = 541
    end
  end
  inherited MainPanel: TPanel
    Width = 694
    Height = 514
    ExplicitWidth = 694
    ExplicitHeight = 514
    inherited CommonPanel: TPanel
      Width = 694
      ExplicitWidth = 694
      inherited CompanyCodeEdit: TcxTextEdit
        ExplicitHeight = 25
      end
      inherited CompanyNameEdit: TcxTextEdit
        ExplicitHeight = 25
      end
    end
    inherited InfoPanel: TPanel
      Width = 694
      ExplicitWidth = 694
      inherited CEONameEdit: TcxTextEdit
        ExplicitHeight = 25
      end
      inherited ContactNameEdit: TcxTextEdit
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
      inherited EMailEdit: TcxTextEdit
        ExplicitHeight = 25
      end
      inherited ContactTelNoEdit: TcxTextEdit
        ExplicitHeight = 25
      end
      inherited CompanyTypeComboBox: TcxComboBox
        ExplicitHeight = 25
      end
      inherited TaxComboBox: TcxComboBox
        ExplicitHeight = 25
      end
      inherited PriceComboBox: TcxComboBox
        ExplicitHeight = 25
      end
      inherited SaleCompanyTypeComboBox: TcxComboBox
        ExplicitHeight = 25
      end
    end
    inherited OrderPanel: TPanel
      Width = 694
      ExplicitWidth = 694
      inherited OrderCycleMonthPanel: TPanel
        inherited OrderCycleMonthDayEdit: TcxCurrencyEdit
          ExplicitHeight = 25
        end
      end
      inherited OrderCycleWeekPanel: TPanel
        inherited OrderCycleWeekMonCheckBox: TcxCheckBox
          ExplicitHeight = 25
        end
        inherited OrderCycleWeekTueCheckBox: TcxCheckBox
          ExplicitHeight = 25
        end
        inherited OrderCycleWeekWedCheckBox: TcxCheckBox
          ExplicitHeight = 25
        end
        inherited OrderCycleWeekThuCheckBox: TcxCheckBox
          ExplicitHeight = 25
        end
        inherited OrderCycleWeekFriCheckBox: TcxCheckBox
          ExplicitHeight = 25
        end
        inherited OrderCycleWeekSatCheckBox: TcxCheckBox
          ExplicitHeight = 25
        end
        inherited OrderCycleWeekSunCheckBox: TcxCheckBox
          ExplicitHeight = 25
        end
      end
      inherited OrderCycleComboBox: TcxComboBox
        ExplicitHeight = 25
      end
      inherited OrderReturnDayEdit: TcxCurrencyEdit
        ExplicitHeight = 25
      end
      inherited PayBankEdit: TcxTextEdit
        ExplicitHeight = 25
      end
      inherited PayDay1Edit: TcxCurrencyEdit
        ExplicitHeight = 25
      end
      inherited PayAccountEdit: TcxTextEdit
        ExplicitHeight = 25
      end
      inherited PayAccountNameEdit: TcxTextEdit
        ExplicitHeight = 25
      end
      inherited PayDay2Edit: TcxCurrencyEdit
        ExplicitHeight = 25
      end
      inherited PayDay3Edit: TcxCurrencyEdit
        ExplicitHeight = 25
      end
      inherited OrderIncentivesEdit: TcxCurrencyEdit
        ExplicitHeight = 25
      end
      inherited OrderCreditAmtEdit: TcxCurrencyEdit
        ExplicitHeight = 25
      end
      inherited OrderLastBuyDateEdit: TcxTextEdit
        ExplicitHeight = 25
      end
    end
    inherited RentPanel: TPanel
      Width = 694
      ExplicitWidth = 694
      inherited RentAddFeeGroupBox: TGroupBox
        inherited RentAddFeeCashRateEdit: TcxCurrencyEdit
          ExplicitHeight = 25
        end
        inherited RentAddFeeCardRateEdit: TcxCurrencyEdit
          ExplicitHeight = 25
        end
        inherited RentAddFeeCashReceiptRateEdit: TcxCurrencyEdit
          ExplicitHeight = 25
        end
        inherited RentAddFeeGiftCardRateEdit: TcxCurrencyEdit
          ExplicitHeight = 25
        end
        inherited RentAddFeeCreditRateEdit: TcxCurrencyEdit
          ExplicitHeight = 25
        end
        inherited RentAddFeeOkCashbagRateEdit: TcxCurrencyEdit
          ExplicitHeight = 25
        end
        inherited RentAddFeeTMoneyRateEdit: TcxCurrencyEdit
          ExplicitHeight = 25
        end
      end
      inherited RentFeeRateEdit: TcxCurrencyEdit
        ExplicitHeight = 25
      end
      inherited RentVanGroupBox: TGroupBox
        inherited RentVanTIDEdit: TcxTextEdit
          ExplicitHeight = 25
        end
        inherited RentVanSerialNoEdit: TcxTextEdit
          ExplicitHeight = 25
        end
        inherited RentVanPasswordEdit: TcxTextEdit
          ExplicitHeight = 25
        end
      end
    end
    inherited RemarkPanel: TPanel
      Width = 694
      ExplicitWidth = 694
      inherited UseYNComboBox: TcxComboBox
        ExplicitHeight = 25
      end
    end
    inherited SalePanel: TPanel
      Width = 694
      ExplicitWidth = 694
      inherited MisuAmtEdit: TcxCurrencyEdit
        ExplicitHeight = 25
      end
      inherited CreditLimitEdit: TcxCurrencyEdit
        ExplicitHeight = 25
      end
      inherited CreditComboBox: TcxComboBox
        ExplicitHeight = 25
      end
      inherited DamdangComboBox: TcxComboBox
        ExplicitHeight = 25
      end
      inherited CardNoEdit: TcxTextEdit
        ExplicitHeight = 25
      end
      inherited CashRcpNoEdit: TcxTextEdit
        ExplicitHeight = 25
      end
      inherited GroupBox1: TGroupBox
        inherited TaxCompanyNameEdit: TcxTextEdit
          ExplicitHeight = 25
        end
        inherited InvoiceItemEdit: TcxTextEdit
          ExplicitHeight = 25
        end
        inherited InvoiceTelNoEdit: TcxTextEdit
          ExplicitHeight = 25
        end
        inherited YnInvoiceComboBox: TcxComboBox
          ExplicitHeight = 25
        end
        inherited DsInvoiceComboBox: TcxComboBox
          ExplicitHeight = 25
        end
      end
      inherited BackOfficeEventCheckBox: TcxCheckBox
        ExplicitHeight = 25
      end
      inherited SMSAgreeCheckBox: TcxCheckBox
        ExplicitHeight = 25
      end
    end
  end
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 25
  end
  inherited EditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
