inherited KioskSetupForm: TKioskSetupForm
  Tag = 1
  Caption = #53412#50724#49828#53356' '#54872#44221#49444#51221
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
  inherited Pager: TcxPageControl
    Properties.ActivePage = POSPage
    inherited StorePage: TcxTabSheet
      TabVisible = False
    end
    inherited BackPage: TcxTabSheet
      TabVisible = False
      inherited Option171CheckBox: TcxCheckBox
        ExplicitWidth = 121
        ExplicitHeight = 21
      end
      inherited Option222CheckBox: TcxCheckBox
        ExplicitWidth = 121
        ExplicitHeight = 21
      end
      inherited Option211CheckBox: TcxCheckBox
        ExplicitWidth = 121
        ExplicitHeight = 21
      end
      inherited CardAverageRateEdit: TcxCurrencyEdit
        ExplicitHeight = 21
      end
      inherited cxGroupBox2: TcxGroupBox
        inherited PosPrinterUseCheckBox: TcxCheckBox
          ExplicitWidth = 121
          ExplicitHeight = 21
        end
        inherited PrinterDeviceComboBox: TcxComboBox
          ExplicitHeight = 21
        end
        inherited PrinterPortComboBox: TcxComboBox
          ExplicitHeight = 21
        end
        inherited PrinterBaudRateComboBox: TcxComboBox
          ExplicitHeight = 21
        end
        inherited ReceiptBottomMarginSpinEdit: TcxSpinEdit
          ExplicitHeight = 21
        end
      end
      inherited CodeGroupBox: TcxGroupBox
        inherited GoodsPrefixEdit: TcxCurrencyEdit
          ExplicitHeight = 21
        end
        inherited GoodsLengthComboBox: TcxComboBox
          ExplicitHeight = 21
        end
        inherited ScalePrefixEdit: TcxTextEdit
          ExplicitHeight = 21
        end
        inherited Option248ComboBox: TcxComboBox
          ExplicitHeight = 21
        end
        inherited MenuCodeLengthEdit: TcxSpinEdit
          ExplicitHeight = 21
        end
      end
      inherited Option002CheckBox: TcxCheckBox
        ExplicitWidth = 121
        ExplicitHeight = 21
      end
      inherited Option389CheckBox: TcxCheckBox
        ExplicitWidth = 121
        ExplicitHeight = 21
      end
      inherited Option454CheckBox: TcxCheckBox
        ExplicitWidth = 121
        ExplicitHeight = 21
      end
    end
    inherited POSPage: TcxTabSheet
      inherited POSPageControl: TcxPageControl
        Properties.ActivePage = KioskTabSheet
        ClientRectTop = 28
        inherited POSCommonTabSheet: TcxTabSheet
          TabVisible = False
          ExplicitTop = 28
          ExplicitHeight = 898
          inherited AdvScrollBox1: TAdvScrollBox
            Height = 898
            ExplicitHeight = 898
            inherited Option138CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option040CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option044CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option054CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited TipGroupBox: TcxGroupBox
              inherited Option020CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
              inherited Option160CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
              inherited TipTypeComboBox: TcxComboBox
                ExplicitHeight = 21
              end
              inherited Option289CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
              inherited TipMenuEdit: TcxButtonEdit
                ExplicitHeight = 21
              end
              inherited TipDefaultEdit: TcxCurrencyEdit
                ExplicitHeight = 21
              end
            end
            inherited DCGroupBox: TcxGroupBox
              inherited BookingTableDisplayBeforeTimeEdit: TcxCurrencyEdit
                ExplicitHeight = 21
              end
              inherited BookingTableDisplayEndTimeEdit: TcxCurrencyEdit
                ExplicitHeight = 21
              end
              inherited BookingMenuEdit: TcxButtonEdit
                ExplicitHeight = 21
              end
              inherited Option206CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
            end
            inherited OverTimeGroupBox: TcxGroupBox
              inherited Option223CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
              inherited AddFareMenuEdit: TcxButtonEdit
                ExplicitHeight = 21
              end
              inherited AddFareDefaultTimeEdit: TcxCurrencyEdit
                ExplicitHeight = 21
              end
              inherited AddFareEachTimeEdit: TcxCurrencyEdit
                ExplicitHeight = 21
              end
              inherited AddFareAmountEdit: TcxCurrencyEdit
                ExplicitHeight = 21
              end
              inherited Option412CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
            end
            inherited Option172CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option265CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited TableDefaultMenuEdit: TcxButtonEdit
              ExplicitHeight = 21
            end
            inherited MainPosComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited SaleReportPasswordEdit: TcxTextEdit
              ExplicitHeight = 21
            end
            inherited SaleSearchPasswordEdit: TcxTextEdit
              ExplicitHeight = 21
            end
            inherited Option357CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option363CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option304SpinEdit: TcxSpinEdit
              ExplicitHeight = 21
            end
            inherited Option385CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited cxGroupBox17: TcxGroupBox
              inherited Option311CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
              inherited Option061ComboBox: TcxComboBox
                ExplicitHeight = 21
              end
              inherited DefaultPickUpEdit: TcxTextEdit
                ExplicitHeight = 21
              end
              inherited Option478CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
            end
            inherited Option194CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option498CheckBox: TcxCheckBox
              ExplicitWidth = 121
            end
          end
        end
        inherited POSOrderTabSheet: TcxTabSheet
          TabVisible = False
          ExplicitTop = 28
          ExplicitHeight = 898
          inherited AdvScrollBox2: TAdvScrollBox
            Height = 898
            ExplicitHeight = 898
            inherited Option014CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option037CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option095CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option036CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option057CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option046CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option071CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option303CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option164CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option178CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option247CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option084CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option262CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option300CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option307CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option326CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option342CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option350ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option396CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited cxGroupBox15: TcxGroupBox
              inherited Option156ComboBox: TcxComboBox
                ExplicitHeight = 21
              end
            end
            inherited Option433CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option023CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option414CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option491CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option015ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
          end
        end
        inherited POSTableTabSheet: TcxTabSheet
          TabVisible = False
          ExplicitTop = 28
          ExplicitHeight = 898
          inherited AdvScrollBox3: TAdvScrollBox
            Height = 898
            ExplicitHeight = 898
            inherited Option025CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option174CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option175CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option059CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option058CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited cxGroupBox3: TcxGroupBox
              inherited Option013ComboBox: TcxComboBox
                ExplicitHeight = 21
              end
              inherited Option170ComboBox: TcxComboBox
                ExplicitHeight = 21
              end
            end
            inherited Option321CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option360ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option378CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited cxGroupBox13: TcxGroupBox
              inherited TableColorChangeTimeEdit: TcxCurrencyEdit
                ExplicitHeight = 21
              end
            end
            inherited Option252CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option237ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option432ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option499ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
          end
        end
        inherited POSCardTabSheet: TcxTabSheet
          TabVisible = False
          ExplicitTop = 28
          ExplicitHeight = 898
          inherited AdvScrollBox4: TAdvScrollBox
            Height = 898
            ExplicitHeight = 898
            inherited Option208ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option209ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option218ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option219ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option220ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option212ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option214ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option215ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option216ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option217ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option033CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option069CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option042CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option230CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option045CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option201CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option229CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option324CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option063ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited cxGroupBox1: TcxGroupBox
              inherited CardEnd3Edit: TcxTextEdit
                ExplicitHeight = 21
              end
              inherited CardEnd2Edit: TcxTextEdit
                ExplicitHeight = 21
              end
              inherited CardEnd1Edit: TcxTextEdit
                ExplicitHeight = 21
              end
              inherited CardEnd5Edit: TcxTextEdit
                ExplicitHeight = 21
              end
              inherited CardEnd4Edit: TcxTextEdit
                ExplicitHeight = 21
              end
            end
            inherited Option125ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option382ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option006ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option407CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option055CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option336ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option124ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option494CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option495CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option165CheckBox: TcxCheckBox
              ExplicitWidth = 121
            end
          end
        end
        inherited PosAcctTabSheet: TcxTabSheet
          TabVisible = False
          ExplicitTop = 28
          ExplicitHeight = 898
          inherited AdvScrollBox5: TAdvScrollBox
            Height = 898
            ExplicitHeight = 898
            inherited Option065CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option159CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option250CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option213CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option259CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option022CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option235CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option299CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option261CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option266CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option287CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option376CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option398CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option400CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option379ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option169ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option441CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option446CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option401CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option486CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
          end
        end
        inherited ReceiptTabSheet: TcxTabSheet
          TabVisible = False
          ExplicitTop = 28
          ExplicitHeight = 898
          inherited PrintPager: TcxPageControl
            Height = 898
            ExplicitHeight = 898
            ClientRectBottom = 898
            inherited ReceiptPage: TcxTabSheet
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 870
              inherited AdvScrollBox6: TAdvScrollBox
                Height = 870
                ExplicitHeight = 870
                inherited Option333ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option393ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option155ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option314ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option320ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option081ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option260ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option127ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option126ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option068ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option157CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option005CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option158CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option176CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option255CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option264CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option080SpinEdit: TcxSpinEdit
                  ExplicitHeight = 21
                end
                inherited SimpleReceiptEdit: TcxTextEdit
                  ExplicitHeight = 21
                end
                inherited Option318CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option323CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option373CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option319ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option390ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option399ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option008CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option027ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option472CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option484ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option492CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                end
              end
            end
            inherited ReceiptTitlePage: TcxTabSheet
              ExplicitHeight = 870
              inherited ReceiptTitleGroupBox: TcxGroupBox
                inherited ReceiptTitle1Edit: TcxTextEdit
                  ExplicitHeight = 21
                end
                inherited ReceiptTitle2Edit: TcxTextEdit
                  ExplicitHeight = 21
                end
                inherited ReceiptTitle3Edit: TcxTextEdit
                  ExplicitHeight = 21
                end
                inherited ReceiptTitle4Edit: TcxTextEdit
                  ExplicitHeight = 21
                end
              end
              inherited DeliveryPrintGroupBox: TcxGroupBox
                inherited cxScrollBox1: TcxScrollBox
                  inherited ReceiptBottom3Edit: TcxTextEdit
                    ExplicitHeight = 21
                  end
                  inherited ReceiptBottom2Edit: TcxTextEdit
                    ExplicitHeight = 21
                  end
                  inherited ReceiptBottom1Edit: TcxTextEdit
                    ExplicitHeight = 21
                  end
                  inherited ReceiptBottom6Edit: TcxTextEdit
                    ExplicitHeight = 21
                  end
                  inherited ReceiptBottom5Edit: TcxTextEdit
                    ExplicitHeight = 21
                  end
                  inherited ReceiptBottom4Edit: TcxTextEdit
                    ExplicitHeight = 21
                  end
                  inherited ReceiptBottom8Edit: TcxTextEdit
                    ExplicitHeight = 21
                  end
                  inherited ReceiptBottom7Edit: TcxTextEdit
                    ExplicitHeight = 21
                  end
                end
              end
            end
          end
        end
        inherited MemberTabSheet: TcxTabSheet
          TabVisible = False
          ExplicitTop = 28
          ExplicitHeight = 898
          inherited AdvScrollBox7: TAdvScrollBox
            Height = 898
            ExplicitHeight = 898
            inherited cxGroupBox19: TcxGroupBox
              inherited MemberJoinCodeEdit: TcxButtonEdit
                ExplicitHeight = 21
              end
              inherited MinUsePointEdit: TcxCurrencyEdit
                ExplicitHeight = 21
              end
              inherited Option310CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
              inherited Option306CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
              inherited Option302CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
              inherited Option210CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
              inherited Option258CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
              inherited Option372CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
              inherited Option391CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
              inherited Option296ComboBox: TcxComboBox
                ExplicitHeight = 21
              end
              inherited Option413CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
            end
            inherited Option150CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option297CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited MemberCardPrefix1Edit: TcxTextEdit
              ExplicitHeight = 21
            end
            inherited MemberCardLength1Edit: TcxCurrencyEdit
              ExplicitHeight = 21
            end
            inherited MemberCardPrefix2Edit: TcxTextEdit
              ExplicitHeight = 21
            end
            inherited MemberCardLength2Edit: TcxCurrencyEdit
              ExplicitHeight = 21
            end
            inherited MemberSearchDefaultMenuEdit: TcxButtonEdit
              ExplicitHeight = 21
            end
            inherited Option317CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option322CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option345CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option367CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option031ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option179CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option386CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option292CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
          end
        end
        inherited OpenCloseTabSheet: TcxTabSheet
          TabVisible = False
          ExplicitTop = 28
          ExplicitHeight = 898
          inherited AdvScrollBox8: TAdvScrollBox
            Height = 898
            ExplicitHeight = 898
            inherited ReserveAmtEdit: TcxCurrencyEdit
              ExplicitHeight = 21
            end
            inherited Option043CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option173CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option128CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option221CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option139CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option263CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option239CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option268CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option075SpinEdit: TcxSpinEdit
              ExplicitHeight = 21
            end
            inherited Option074SpinEdit: TcxSpinEdit
              ExplicitHeight = 21
            end
            inherited Option328CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option349CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option351CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited ClosePasswordEdit: TcxTextEdit
              ExplicitHeight = 21
            end
            inherited Option029ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited cxPageControl4: TcxPageControl
              inherited cxTabSheet14: TcxTabSheet
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                inherited Option123CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option129CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
              end
              inherited cxTabSheet15: TcxTabSheet
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                inherited Option375CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited PosCloseTimeEdit: TcxTimeEdit
                  ExplicitHeight = 21
                end
              end
            end
          end
        end
        inherited CustomerPrintTabSheet: TcxTabSheet
          TabVisible = False
          ExplicitTop = 28
          ExplicitHeight = 898
          inherited AdvScrollBox9: TAdvScrollBox
            Height = 898
            ExplicitHeight = 898
            inherited Option108ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option109ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option110ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option111ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option112ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option113ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option114ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option115ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option117ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option313ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option116ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option039SpinEdit: TcxSpinEdit
              ExplicitHeight = 21
            end
            inherited Option011CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option167CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option041CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option038CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option224CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option163CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option161CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option073CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option003CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option338CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option370ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option162ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option052ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option409CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option410ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option435SpinEdit: TcxSpinEdit
              ExplicitHeight = 21
            end
            inherited Option436SpinEdit: TcxSpinEdit
              ExplicitHeight = 21
            end
            inherited CustomerTitleEdit: TcxTextEdit
              ExplicitHeight = 21
            end
          end
        end
        inherited DiscountTabSheet: TcxTabSheet
          TabVisible = False
          ExplicitTop = 28
          ExplicitHeight = 898
          inherited AdvScrollBox10: TAdvScrollBox
            Height = 898
            ExplicitHeight = 898
            inherited ReceiptDefaultDcComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option153ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option246ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited DcRateUnitEdit: TcxCurrencyEdit
              ExplicitHeight = 21
            end
            inherited Option305CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option294CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option251CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option298CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option366CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited cxGroupBox22: TcxGroupBox
              inherited Option406ComboBox: TcxComboBox
                ExplicitHeight = 21
              end
              inherited StampDcAmtEdit: TcxCurrencyEdit
                ExplicitHeight = 21
              end
              inherited StampDcCountEdit: TcxSpinEdit
                ExplicitHeight = 21
              end
              inherited Option021CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
            end
            inherited cxGroupBox16: TcxGroupBox
              inherited CouponPrefixEdit: TcxMaskEdit
                ExplicitHeight = 21
              end
              inherited CouponLengthEdit: TcxSpinEdit
                ExplicitHeight = 21
              end
              inherited Option064CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
              inherited Option335CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
            end
          end
        end
        inherited POSDeliveryTabSheet: TcxTabSheet
          TabVisible = False
          ExplicitTop = 28
          ExplicitHeight = 898
          inherited DeliveryPager: TcxPageControl
            Height = 898
            Properties.ActivePage = Delivery2Page
            ExplicitHeight = 898
            ClientRectBottom = 898
            inherited Delivery1Page: TcxTabSheet
              ExplicitHeight = 870
              inherited AdvScrollBox11: TAdvScrollBox
                Height = 870
                ExplicitHeight = 870
                inherited DeliveryTableGroupBox: TcxGroupBox
                  inherited DeliveryXSizeEdit: TcxSpinEdit
                    ExplicitHeight = 21
                  end
                  inherited DeliveryYSizeEdit: TcxSpinEdit
                    ExplicitHeight = 21
                  end
                  inherited DeliveryTableTitleSizeEdit: TcxSpinEdit
                    ExplicitHeight = 21
                  end
                  inherited DeliveryTableMenuSizeEdit: TcxSpinEdit
                    ExplicitHeight = 21
                  end
                  inherited DeliveryTableAmountSizeEdit: TcxSpinEdit
                    ExplicitHeight = 21
                  end
                  inherited DeliveryTableBottomSizeEdit: TcxSpinEdit
                    ExplicitHeight = 21
                  end
                  inherited DeliveryTablePhoneNumberSizeEdit: TcxSpinEdit
                    ExplicitHeight = 21
                  end
                  inherited Option187ComboBox: TcxComboBox
                    ExplicitHeight = 21
                  end
                  inherited Option295CheckBox: TcxCheckBox
                    ExplicitWidth = 121
                    ExplicitHeight = 21
                  end
                end
                inherited DeliveryDefaultAddressEdit: TcxTextEdit
                  ExplicitHeight = 21
                end
                inherited DeliveryPhoneCountEdit: TcxSpinEdit
                  ExplicitHeight = 21
                end
                inherited Option118ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited DeliveryAvailTimeSpinEdit: TcxSpinEdit
                  ExplicitHeight = 21
                end
                inherited Option228CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option368ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited DeliveryGridGroupBox: TcxGroupBox
                  inherited DeliveryGridRowHeigthEdit: TcxSpinEdit
                    ExplicitHeight = 21
                  end
                  inherited DeliveryGridFontSizeEdit: TcxSpinEdit
                    ExplicitHeight = 21
                  end
                end
                inherited Option395ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option018CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
              end
            end
            inherited Delivery2Page: TcxTabSheet
              ExplicitHeight = 870
              inherited AdvScrollBox12: TAdvScrollBox
                Height = 870
                ExplicitHeight = 870
                inherited Option121ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option271ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option272ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option273ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option274ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option275ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option276ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option277ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option278ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option279ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option280ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option281ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option282ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option283ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option191ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited cxGroupBox5: TcxGroupBox
                  inherited DeliveryEnd3Edit: TcxTextEdit
                    ExplicitHeight = 21
                  end
                  inherited DeliveryEnd2Edit: TcxTextEdit
                    ExplicitHeight = 21
                  end
                  inherited DeliveryEnd1Edit: TcxTextEdit
                    ExplicitHeight = 21
                  end
                  inherited DeliveryEnd5Edit: TcxTextEdit
                    ExplicitHeight = 21
                  end
                  inherited DeliveryEnd4Edit: TcxTextEdit
                    ExplicitHeight = 21
                  end
                end
                inherited Option394ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
              end
            end
            inherited cxTabSheet21: TcxTabSheet
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 870
              inherited AdvScrollBox13: TAdvScrollBox
                Height = 870
                ExplicitHeight = 870
                inherited Option347CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option344CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option056CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option144CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option270CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option301CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option120CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option186CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option119CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option190CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option188CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option284CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option316CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option143SpinEdit: TcxSpinEdit
                  ExplicitHeight = 21
                end
                inherited Option189SpinEdit: TcxSpinEdit
                  ExplicitHeight = 21
                end
                inherited Option145SpinEdit: TcxSpinEdit
                  ExplicitHeight = 21
                end
                inherited Option348CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option364CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option377CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option380CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option392ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option397CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option082CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited BaeminMenuEdit: TcxButtonEdit
                  ExplicitHeight = 21
                end
                inherited Option443CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option444CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option434CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option489CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
              end
            end
          end
        end
        inherited WaitParkingTabSheet: TcxTabSheet
          TabVisible = False
          ExplicitTop = 28
          ExplicitHeight = 898
          inherited AdvScrollBox14: TAdvScrollBox
            Height = 898
            ExplicitHeight = 898
            inherited cxGroupBox9: TcxGroupBox
              inherited Option200CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
              inherited cxGroupBox10: TcxGroupBox
                inherited WaitBottom1Edit: TcxTextEdit
                  ExplicitHeight = 21
                end
                inherited WaitBottom2Edit: TcxTextEdit
                  ExplicitHeight = 21
                end
                inherited WaitBottom3Edit: TcxTextEdit
                  ExplicitHeight = 21
                end
              end
              inherited Option151SpinEdit: TcxSpinEdit
                ExplicitHeight = 21
              end
              inherited Option070CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
              inherited Option196CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
              inherited Option286CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
              inherited Option309ComboBox: TcxComboBox
                ExplicitHeight = 21
              end
              inherited Option353ComboBox: TcxComboBox
                ExplicitHeight = 21
              end
            end
            inherited cxGroupBox11: TcxGroupBox
              inherited ParkingCodeEdit: TcxTextEdit
                ExplicitHeight = 21
              end
              inherited Option291ComboBox: TcxComboBox
                ExplicitHeight = 21
              end
            end
          end
        end
        inherited StockTabSheet: TcxTabSheet
          TabVisible = False
          ExplicitTop = 28
          ExplicitWidth = 0
          ExplicitHeight = 898
          inherited Option331CheckBox: TcxCheckBox
            ExplicitWidth = 121
            ExplicitHeight = 21
          end
          inherited Option330ComboBox: TcxComboBox
            ExplicitHeight = 21
          end
          inherited Option332CheckBox: TcxCheckBox
            ExplicitWidth = 121
            ExplicitHeight = 21
          end
          inherited Option371CheckBox: TcxCheckBox
            ExplicitWidth = 121
            ExplicitHeight = 21
          end
          inherited BarcodeScan415SpinEdit: TcxSpinEdit
            ExplicitHeight = 21
          end
        end
        inherited POSFoodCourtTabSheet: TcxTabSheet
          TabVisible = False
          ExplicitTop = 28
          ExplicitWidth = 0
          ExplicitHeight = 898
          inherited Option233CheckBox: TcxCheckBox
            ExplicitWidth = 121
            ExplicitHeight = 21
          end
          inherited Option269CheckBox: TcxCheckBox
            ExplicitWidth = 121
            ExplicitHeight = 21
          end
          inherited Option232CheckBox: TcxCheckBox
            ExplicitWidth = 121
            ExplicitHeight = 21
          end
          inherited Option234CheckBox: TcxCheckBox
            ExplicitWidth = 121
            ExplicitHeight = 21
          end
          inherited Option267CheckBox: TcxCheckBox
            ExplicitWidth = 121
            ExplicitHeight = 21
          end
          inherited Option365CheckBox: TcxCheckBox
            ExplicitWidth = 121
            ExplicitHeight = 21
          end
          inherited Option249CheckBox: TcxCheckBox
            ExplicitWidth = 121
          end
        end
        inherited KioskTabSheet: TcxTabSheet
          ExplicitTop = 28
          ExplicitHeight = 898
          inherited KioskPager: TcxPageControl
            Height = 898
            ExplicitHeight = 898
            ClientRectBottom = 898
            inherited cxTabSheet26: TcxTabSheet
              ExplicitHeight = 870
            end
            inherited cxTabSheet27: TcxTabSheet
              ExplicitHeight = 870
              inherited cxGroupBox25: TcxGroupBox
                inherited Option457CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
                inherited Option485CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                  ExplicitHeight = 21
                end
              end
              inherited KioskPwdEdit: TcxTextEdit
                ExplicitHeight = 21
              end
              inherited KakaoTelNoEdit: TcxTextEdit
                ExplicitHeight = 21
              end
              inherited KioskMustMenuCodeEdit: TcxButtonEdit
                ExplicitHeight = 21
              end
              inherited Option458ComboBox: TcxComboBox
                ExplicitHeight = 21
              end
            end
            inherited KioskStanby: TcxTabSheet
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 870
              inherited Option424ComboBox: TcxComboBox
                ExplicitHeight = 21
              end
              inherited Option426ComboBox: TcxComboBox
                ExplicitHeight = 21
              end
              inherited KioskBegin1Edit: TcxTextEdit
                ExplicitHeight = 21
              end
              inherited KioskBegin2Edit: TcxTextEdit
                ExplicitHeight = 21
              end
              inherited Option477ComboBox: TcxComboBox
                ExplicitHeight = 21
              end
              inherited Option488CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
            end
          end
        end
        inherited KitchenPrintTabSheet: TcxTabSheet
          TabVisible = False
          ExplicitTop = 28
          ExplicitHeight = 898
          inherited AdvScrollBox15: TAdvScrollBox
            Height = 898
            ExplicitHeight = 898
            inherited Panel20: TPanel
              inherited Option096Panel: TPanel
                inherited KitchenTieleEdit: TcxTextEdit
                  ExplicitHeight = 21
                end
              end
            end
            inherited Option096ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option097ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option098ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option099ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option100ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option101ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option102ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option103ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option104ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option107ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option105ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option203ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option204ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option288ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option312ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option106ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option010CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option012CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option017CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option026CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option077CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option072ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option154CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option149CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option205CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited cxGroupBox7: TcxGroupBox
              inherited Option079CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
            end
            inherited PrinterCheckTimerEdit: TcxSpinEdit
              ExplicitHeight = 21
            end
            inherited Option256CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option343ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option374CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option408CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option447ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option448ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option030ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option308CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option354CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option241CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option482ComboBox: TcxImageComboBox
              ExplicitHeight = 21
            end
          end
        end
      end
    end
    inherited KDSPage: TcxTabSheet
      TabVisible = False
      inherited AdvScrollBox21: TAdvScrollBox
        inherited DesignGroupBox: TcxGroupBox
          ExplicitHeight = 462
          Height = 462
          inherited KDSDesignPanel: TPanel
            inherited DesignBottomPanel: TPanel
              inherited Design12Label: TcxLabel
                AnchorX = 176
                AnchorY = 22
              end
            end
          end
          inherited DesignLocationTopEdit: TcxCurrencyEdit
            ExplicitHeight = 21
          end
          inherited DesignLocationLeftEdit: TcxCurrencyEdit
            ExplicitHeight = 21
          end
          inherited DesignAlignmentComboBox: TcxComboBox
            ExplicitHeight = 21
          end
          inherited DesignFontEdit: TcxButtonEdit
            ExplicitHeight = 21
          end
          inherited DesignTopHeightEdit: TcxCurrencyEdit
            ExplicitHeight = 21
          end
          inherited DesignBottomHeightEdit: TcxCurrencyEdit
            ExplicitHeight = 21
          end
        end
        inherited DesignTemplateComboBox: TcxComboBox
          ExplicitHeight = 21
        end
        inherited DesignRowSizeEdit: TcxSpinEdit
          ExplicitHeight = 21
        end
        inherited DesignColSizeEdit: TcxSpinEdit
          ExplicitHeight = 21
        end
        inherited Option355CheckBox: TcxCheckBox
          ExplicitWidth = 121
          ExplicitHeight = 21
        end
        inherited Option356CheckBox: TcxCheckBox
          ExplicitWidth = 121
          ExplicitHeight = 21
        end
        inherited Option358CheckBox: TcxCheckBox
          ExplicitWidth = 121
          ExplicitHeight = 21
        end
        inherited Option381CheckBox: TcxCheckBox
          ExplicitWidth = 121
          ExplicitHeight = 21
        end
        inherited Option362ComboBox: TcxComboBox
          ExplicitHeight = 21
        end
        inherited Option193CheckBox: TcxCheckBox
          ExplicitWidth = 121
          ExplicitHeight = 21
        end
      end
    end
    inherited LetsOrderPage: TcxTabSheet [4]
      TabVisible = False
      inherited LetsOrderOfficePager: TcxPageControl
        inherited LetsOrderOptionPager: TcxTabSheet
          inherited AdvScrollBox19: TAdvScrollBox
            inherited BusinessHoursEdit: TcxTextEdit
              ExplicitHeight = 21
            end
            inherited DayOffEdit: TcxTextEdit
              ExplicitHeight = 21
            end
            inherited PGMidEdit: TcxTextEdit
              ExplicitHeight = 21
            end
            inherited PGMidKeyEdit: TcxTextEdit
              ExplicitHeight = 21
            end
            inherited cxGroupBox6: TcxGroupBox
              inherited BankNoEdit: TcxTextEdit
                ExplicitHeight = 21
              end
              inherited BankOwnerEdit: TcxTextEdit
                ExplicitHeight = 21
              end
              inherited BankCodeEdit: TcxTextEdit
                ExplicitHeight = 21
              end
            end
            inherited Option290CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option453ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited TakeOutURLEdit: TcxTextEdit
              ExplicitHeight = 21
            end
          end
        end
        inherited LetsOrderOption1Pager: TcxTabSheet
          inherited AdvScrollBox20: TAdvScrollBox
            inherited Option062CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option066CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option094ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option140CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited cxGroupBox4: TcxGroupBox
              inherited Option450SpinEdit: TcxSpinEdit
                ExplicitHeight = 21
              end
              inherited Option449SpinEdit: TcxSpinEdit
                ExplicitHeight = 21
              end
            end
            inherited Option148CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option166CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited PGCancelPwdEdit: TcxTextEdit
              ExplicitHeight = 21
            end
            inherited Option141ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option420CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option180SpinEdit: TcxSpinEdit
              ExplicitHeight = 21
            end
            inherited Option334CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option405CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option083ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option352CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited cxGroupBox23: TcxGroupBox
              inherited Option181ComboBox: TcxComboBox
                ExplicitHeight = 21
              end
              inherited Option182ComboBox: TcxComboBox
                ExplicitHeight = 21
              end
            end
            inherited Option369CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option402CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited LetsOrderServiceMenuCodeButtonEdit: TcxButtonEdit
              ExplicitHeight = 21
            end
            inherited Option359CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option474CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option192ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
            inherited Option093CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited Option483ComboBox: TcxComboBox
              ExplicitHeight = 21
            end
          end
        end
        inherited LetsOrderOption2Page: TcxTabSheet
          inherited cxGroupBox24: TcxGroupBox
            inherited DelyveryType1CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited DelyveryType2CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
            inherited DelyveryType3CheckBox: TcxCheckBox
              ExplicitWidth = 121
              ExplicitHeight = 21
            end
          end
          inherited cxGroupBox26: TcxGroupBox
            inherited cxScrollBox2: TcxScrollBox
              inherited DeliveryRemark3Edit: TcxTextEdit
                ExplicitHeight = 21
              end
              inherited DeliveryRemark2Edit: TcxTextEdit
                ExplicitHeight = 21
              end
              inherited DeliveryRemark1Edit: TcxTextEdit
                ExplicitHeight = 21
              end
              inherited DeliveryRemark6Edit: TcxTextEdit
                ExplicitHeight = 21
              end
              inherited DeliveryRemark5Edit: TcxTextEdit
                ExplicitHeight = 21
              end
              inherited DeliveryRemark4Edit: TcxTextEdit
                ExplicitHeight = 21
              end
              inherited DeliveryRemark8Edit: TcxTextEdit
                ExplicitHeight = 21
              end
              inherited DeliveryRemark7Edit: TcxTextEdit
                ExplicitHeight = 21
              end
            end
          end
        end
        inherited TabletUsePage: TcxTabSheet
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
        end
        inherited TableOptionPage: TcxTabSheet
          inherited TabletSubOptionPager: TcxPageControl
            inherited cxTabSheet38: TcxTabSheet
              inherited BreakTimeEdit: TcxMaskEdit
                ExplicitHeight = 21
              end
              inherited LastOrderTimeEdit: TcxTextEdit
                ExplicitHeight = 21
              end
              inherited cxGroupBox27: TcxGroupBox
                inherited Option464SpinEdit: TcxSpinEdit
                  ExplicitHeight = 21
                end
                inherited Option465SpinEdit: TcxSpinEdit
                  ExplicitHeight = 21
                end
                inherited Option466SpinEdit: TcxSpinEdit
                  ExplicitHeight = 21
                end
              end
              inherited CheckMenuButtonEdit: TcxButtonEdit
                ExplicitHeight = 21
              end
              inherited Option419SpinEdit: TcxSpinEdit
                ExplicitHeight = 21
              end
              inherited Option361CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
              inherited Option476CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
              inherited Option479CheckBox: TcxCheckBox
                ExplicitWidth = 121
                ExplicitHeight = 21
              end
              inherited cxGroupBox29: TcxGroupBox
                inherited Option468ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
                inherited Option469ComboBox: TcxComboBox
                  ExplicitHeight = 21
                end
              end
              inherited Option475ComboBox: TcxComboBox
                ExplicitHeight = 21
              end
              inherited Option463CheckBox: TcxCheckBox
                ExplicitWidth = 121
              end
              inherited Option460CheckBox: TcxCheckBox
                ExplicitWidth = 121
              end
              inherited Option473CheckBox: TcxCheckBox
                ExplicitWidth = 121
              end
              inherited Option467ComboBox: TcxComboBox
                ExplicitHeight = 21
              end
              inherited Option496CheckBox: TcxCheckBox
                ExplicitWidth = 121
              end
              inherited Option195ComboBox: TcxComboBox
                ExplicitHeight = 21
              end
              inherited Option487CheckBox: TcxCheckBox
                ExplicitWidth = 121
              end
            end
            inherited TableOption2TabSheet: TcxTabSheet
              inherited AdvScrollBox18: TAdvScrollBox
                inherited GoogleIDEdit: TcxTextEdit
                  ExplicitHeight = 21
                end
                inherited cxGroupBox31: TcxGroupBox
                  inherited SunCheckBox: TcxCheckBox
                    ExplicitWidth = 121
                    ExplicitHeight = 21
                  end
                  inherited MonCheckBox: TcxCheckBox
                    ExplicitWidth = 121
                    ExplicitHeight = 21
                  end
                  inherited WedCheckBox: TcxCheckBox
                    ExplicitWidth = 121
                    ExplicitHeight = 21
                  end
                  inherited TueCheckBox: TcxCheckBox
                    ExplicitWidth = 121
                    ExplicitHeight = 21
                  end
                  inherited ThuCheckBox: TcxCheckBox
                    ExplicitWidth = 121
                    ExplicitHeight = 21
                  end
                  inherited FriCheckBox: TcxCheckBox
                    ExplicitWidth = 121
                    ExplicitHeight = 21
                  end
                  inherited SatCheckBox: TcxCheckBox
                    ExplicitWidth = 121
                    ExplicitHeight = 21
                  end
                  inherited PowrOnOffButton: TAdvSmoothButton
                    TMSStyle = 8
                  end
                end
                inherited cxGroupBox32: TcxGroupBox
                  inherited ScheduleAddButton: TAdvSmoothButton
                    TMSStyle = 8
                  end
                  inherited ScheduleDelButton: TAdvSmoothButton
                    TMSStyle = 8
                  end
                end
                inherited SchedulePanel: TAdvPanel
                  FullHeight = 220
                  inherited ConfirmButton: TAdvSmoothButton
                    TMSStyle = 8
                  end
                  inherited CancelButton: TAdvSmoothButton
                    TMSStyle = 8
                  end
                end
                inherited WifiSidEdit: TcxTextEdit
                  ExplicitHeight = 21
                end
                inherited WifiPwdEdit: TcxTextEdit
                  ExplicitHeight = 21
                end
                inherited ShoppingCartEdit: TcxTextEdit
                  ExplicitHeight = 21
                end
                inherited POSIPEdit: TcxTextEdit
                  ExplicitHeight = 21
                end
                inherited Option497CheckBox: TcxCheckBox
                  ExplicitWidth = 121
                end
              end
            end
          end
        end
        inherited TableLogOfficePage: TcxTabSheet
          inherited cxLabel5: TcxLabel
            AnchorX = 43
            AnchorY = 24
          end
          inherited TableLogCheckBox: TcxCheckBox
            ExplicitWidth = 121
          end
        end
      end
    end
    inherited SystemPage: TcxTabSheet [5]
      TabVisible = False
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      inherited Option051CheckBox: TcxCheckBox
        ExplicitWidth = 121
        ExplicitHeight = 21
      end
      inherited Option019CheckBox: TcxCheckBox
        ExplicitWidth = 121
        ExplicitHeight = 21
      end
      inherited Option185CheckBox: TcxCheckBox
        ExplicitWidth = 121
        ExplicitHeight = 21
      end
      inherited Option231CheckBox: TcxCheckBox
        ExplicitWidth = 121
        ExplicitHeight = 21
      end
      inherited Option016ComboBox: TcxComboBox
        ExplicitHeight = 21
      end
      inherited Option403CheckBox: TcxCheckBox
        ExplicitWidth = 121
        ExplicitHeight = 21
      end
      inherited Option060CheckBox: TcxCheckBox
        ExplicitWidth = 121
        ExplicitHeight = 21
      end
      inherited Option122ComboBox: TcxComboBox
        ExplicitHeight = 21
      end
      inherited Option427CheckBox: TcxCheckBox
        ExplicitWidth = 121
        ExplicitHeight = 21
      end
    end
    inherited SmartPadPage: TcxTabSheet
      TabVisible = False
      inherited WaitImageChangeTimeSpinEdit: TcxSpinEdit
        ExplicitHeight = 21
      end
    end
  end
  inherited LogPanel: TAdvPanel
    TabOrder = 3
    FullHeight = 108
  end
  inherited SearchPanel: TAdvPanel
    TabOrder = 2
    FullHeight = 108
  end
  inherited StandbyImagePanel: TAdvPanel
    FullHeight = 310
  end
  inherited LogDataPanel: TAdvPanel
    FullHeight = 310
    inherited LogCalendarView: TAdvSmoothCalendar
      TMSStyle = 0
    end
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited ImageList1: TImageList
    Bitmap = {
      494C010105000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      000000000000000000000000000000000000000000000000000E0000000E0000
      000E0000000E0000000E0000000E0000000E0000000E0000000E0000000E0000
      000E0000000E0000000E0000000E000000060000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000004040431CFCCC7FFD9D6D0FFE1DD
      D8FFE8E4DFFFEEEBE6FFF4F0EBFFF9F5F0FFFBF8F2FFF7F3EEFFF2EFEAFFECE8
      E3FFE5E2DCFFDEDAD5FFD7D4CEFFB6B3ADFB0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002F2E2C4294928FFF060607FF0606
      06FF050506FF050505FF040405FF040404FF040404FF040404FF040505FF0505
      05FF050606FF060606FF000001FFCBC7C2FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D2C2A42979591FF131313FF1717
      17FF161616FF171717FF141414FF171717FF121212FF151515FF171717FF1616
      16FF171717FF151515FF0B0B0BFFCAC7C2FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D2C2A42989693FF191919FF1D1D
      1DFF1E1E1EFF202020FF1C1C1CFF1D1D1DFF191919FF1A1A1AFF1D1D1DFF1D1D
      1DFF202020FF1D1D1DFF121212FFCAC7C1FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D2C2A429B9995FF1F1F1FFF2929
      29FF2B2B2BFF2A2A2AFF292929FF282828FF292929FF222222FF292929FF2B2B
      2BFF2A2A2AFF292929FF181818FFCAC6C1FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D2C2A429D9B98FF2C2C2CFF2E2E
      2EFF303030FF323232FF353535FF2D2D2DFF2B2B2BFF242424FF262626FF2727
      27FF282828FF2B2B2BFF202020FFCAC6C1FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D2C2A429F9D9AFF414141FF4848
      48FF4C4C4CFF434343FF474747FF4B4B4BFF464646FF4D4D4DFF474747FF4141
      41FF383838FF3D3D3DFF262626FFC9C6C1FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D2C2A42A19F9CFF3B3B3BFF3E3E
      3EFF404040FF434343FF494949FF454545FF4A4A4AFF434343FF464646FF4949
      49FF424242FF3B3B3BFF2F2F2FFFC9C6C0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D2C2A42A3A19EFF4B4B4BFF5858
      58FF5E5E5EFF606060FF5C5C5CFF646464FF5F5F5FFF585858FF616161FF6565
      65FF676767FF676767FF343435FFC9C5C0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D2C2A42A5A3A0FF515151FF5E5E
      5EFF5E5E5EFF686868FF585858FF636363FF545454FF5D5D5DFF656565FF6565
      65FF6F6F6FFF616161FF575758FFC7C4BEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D2C2A42A7A5A1FF5C5C5CFF6A6A
      6AFF6F6F6FFF707070FF6E6E6EFF6E6E6EFF656565FF686868FF717171FF7474
      74FF767676FF767676FF5D5D5CFFC7C3BEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D2C2A42A7A5A2FF5A5A5AFF5C5C
      5CFF5E5E5EFF605F5FFF616161FF636262FF646463FF646464FF656564FF6565
      65FF656565FF656565FF616061FFC7C3BEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002928273DC3C0BBFFC9C6C0FFCECA
      C5FFD2CFCAFFD6D3CEFFDAD7D1FFDDD9D5FFDEDBD6FFDCD8D3FFD9D5D0FFD5D1
      CCFFD0CDC8FFCCC8C3FFC7C4BFFFBAB7B1FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C9C7C2FFCDCBC7FFD5D3
      CFFFDDDCD8FFE6E4E3FFEDECEBFFF3F4F2FFF6F6F5FFF1F0F0FFEAE9E8FFE3E1
      DEFFDAD8D5FFD2D0CCFFCBC9C4FF777571A80000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCAFA2FFB88D79FFB88D79FFB88D
      79FFB88D79FFEFECEAFFFFFFFFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F5DDD2FFF4DBCFFFB39A8BFF9B81
      6EFFF2D4C6FFA9816CFFFFFFFFFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C7CAFF667286FF8787
      87FFFEFEFEFF000000008A8A8AFF9D9D9DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A4D1C2FFA2D0
      C1FF8FBDADFF8DBAABFF89B7A8FF88B5A6FF85B3A4FF85B3A4FF88B5A6FF89B7
      A8FF8BB9A9FFA5D3C4FF0000000000000000F7E2D7FFF6DFD4FFF5DCD1FFF4DB
      CEFFF3D8CBFFA9816CFFFFFFFFFF000000000000000000000000000000000000
      000000000000000000000000000000000000000000004AA2E9FF58C9FFFF2766
      AEFFF5F5F5FF888888FFE2E2E2FF464646FF858585FF868686FF868686FF8686
      86FF868686FFB8B8B8FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000080808000000000000000000089B6A7FF79A6
      97FF6F9D8DFF629081FF5B8979FF598677FF528071FF528071FF4F7D6DFF4D7B
      6CFF528071FF85B3A4FF0000000000000000F8E6DEFF8C7463FF785F4CFF684D
      39FFC0AA9EFFA9816CFF806855FF745B47FF715844FF6F5440FF6D523DFF6A4F
      3BFF684D38FF664B36FF644934FF634833FF000000001F8FEFFF17A8FFFF1061
      BAFFC3C3C3FF8D8D8DFFD1D1D1FF818181FFFAFAFAFFF2F2F2FFE8E8E8FF9090
      90FF8B8B8BFF919191FF0000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008080800080808000000000000000000083B1A1FF79A7
      98FF6F9D8DFF629081FF5C897AFF538171FF517E6FFF4C796AFF497768FF4573
      64FF4D7B6CFF7DAB9CFF0000000000000000F9EBE4FFA18B7CFF8D7462FF785E
      4BFFC5AFA4FFA9816CFFF8E9E1FFF7E4DBFFF6E1D7FFF5DED2FFF4DACEFFF3D7
      CAFFF2D4C6FFF2D1C2FFF0CEBEFF654935FF000000002E99F0FF14A1FFFF0653
      B8FFF6F6F6FFF0F0F0FFA7A7A7FF6B6B6BFFB8B8B8FF919191FF676767FF6161
      61FFF8F8F8FF000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008080800000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008080800080808000000000000000000078A596FF85B3
      A4FF7BA999FF72A091FF6B9989FF639181FF5B8979FF528071FF4D7B6CFF4A78
      69FF4F7D6DFF78A596FF0000000000000000FAEEEAFFB5A193FFA28C7BFF8C75
      62FFC5AFA4FFA9816CFFBCA89AFFE1DCD8FFDFD2CAFFDDC8BBFFDBBFADFFDBBB
      A7FFCFB4A3FFF2D3C5FFF1D1C2FF674D38FF0000000064B6F2FF69CFFFFF4280
      B9FF595959FF59595BFF6F79A2FF3D4050FFC6C6C7FFCBCBCDFFB9BBBAFF6566
      65FF4A4A4AFF4F4F4FFF494949FFECECECFFFFFFFF0080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800080808000808080008080800000000000000000006E9C8DFF91BF
      B0FF88B5A6FF7EAC9DFF78A596FF6E9C8DFF659384FF5C897AFF538171FF4E7C
      6DFF538171FF6E9C8DFF0000000000000000FBF2EEFFC5B2A4FFB5A192FFA28B
      7BFFC5AFA4FFA47D68FFBCA89AFFFDF7F5FFFBF3EEFFF9EEE7FFF8E8E0FFF6E2
      D9FFCFB4A3FFF3D6C9FFF2D4C6FF6A4F3BFF000000007A96DAFF83BCEFFF6C76
      8CFFE6E5E5FF4980DDFF5DB8FFFF55ADFEFF969899FFDBDDDFFFB3B7B5FF9CA0
      9EFF9D9D99FF939595FF808080FFEAEAEAFFFFFFFF0080808000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008080800080808000808080000000000000000000699788FF9BC9
      B9FF94C1B2FF8BB9A9FF83B1A1FF7AA899FF719E8FFF6A9889FF639181FF5381
      71FF5B8979FF629081FF0000000000000000FCF6F3FFA08573FFA08573FFA085
      73FFD7C6BBFF94705CFFC2AEA0FFFDFBF9FFFCF7F4FFFBF3EEFFF9EDE7FFF8E7
      DFFFD1C1B6FFF4D9CDFFF2D6C8FF6D543FFFFEFEFEFF85868AFFF6F5F4FF494C
      51FFE3D3C5FF2463D5FF1A8FFFFF198CFEFF957C33FFFBD859FFF1BA4BFFE99A
      3DFFDE7D31FFC7906BFF868686FFEAEAEAFFFFFFFF0080808000000000008080
      800080808000000000008080800000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008080800080808000808080000000000000000000689586FFA6D4
      C5FF9DCABBFF95C3B4FF8DBAABFF87B5A5FF7EAC9DFF75A394FF6B9989FF6391
      81FF639181FF5C897AFF0000000000000000F0CCBCFFE7C6B7FFE6C4B5FFE4C2
      B2FFDDC1B5FF83624EFFCBB6A8FFFFFDFDFFFDFBF9FFFDF6F3FFFBF2EDFFF9ED
      E7FFD1C1B6FFF4DCD0FFF4D9CDFF715743FF9B9DA0FFFDFDFDFFF9F9F9FFE6E6
      E6FF736659FF2A65D6FF1A8CFFFF0170FEFF93752FFFF7C74EFFF0B144FFE692
      36FFDB7129FFC68761FF8A8A8AFFEAEAEAFFFFFFFF0080808000000000008080
      800000000000000080000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008080800080808000808080000000000000000000679585FFB1DF
      D0FFA9D6C7FFA0CDBEFF99C6B7FF91BFB0FF8AB8A9FF7FAD9DFF75A394FF6B99
      89FF6A9889FF528071FF0000000000000000FFFFFFFFFFFFFFFFFEFDFCFFFDFC
      FAFFD0B09FFF8E6E5BFFBD5727FFBC5524FFBA4408FFB62900FFB10D00FFAF00
      00FFAF0000FFF5DFD5FFF4DCD0FF755B48FF939496FFA8A8A9FF98999CFFE9EA
      E9FF685B52FF5B8BDDFF64BBFFFF68BCFEFF977643FFF4BF6DFFF0B365FFE690
      43FFD76623FFC3825EFF909090FFEAEAEAFFFFFFFF0080808000000000008080
      8000808080000000FF008080800000000000FFFFFF0000000000000000000000
      0000FFFFFF0080808000808080008080800000000000000000005B8979FFBAE8
      D9FFB4E1D2FFABD9C9FFA2D0C1FF9AC8B9FF94C1B2FF8BB9A9FF80AD9EFF75A3
      94FF6F9D8DFF4D7B6CFF00000000000000000000000000000000FFFFFEFFFEFD
      FCFFD7C7BCFFFFFDFDFFBC5524FFBC5524FFBC4F1CFFB93D02FFB62900FFB214
      00FFB10200FFF6E2D9FFF5DED4FF79604DFFFBFBFCFF7A7B7BFFF9F9F9FF8B8C
      8DFFD6C8B8FF886E9BFF8BBAF3FF7395D5FFE6AD71FFF0B576FFEEB073FFE9A2
      6DFFE59265FFC38261FF949494FFEAEAEAFFFFFFFF008080800000000000FFFF
      0000FFFF0000FFFF0000FFFF000000000000FFFFFF0000000000000000000000
      0000FFFFFF008080800080808000808080000000000000000000598778FFC1EF
      E0FFBDEADBFFB5E3D4FFAFDDCDFFA5D2C3FF9CC9BAFF95C3B4FF8CB9AAFF81AE
      9FFF7AA899FF487566FF00000000000000000000000000000000FFFFFFFFFFFE
      FEFFBC5524FFBC5524FFBA4408FFB62900FFB10D00FFAF0000FFAF0000FFF9EB
      E5FFF8E8E1FFF7E5DCFFF6E2D8FF7E6452FF0000000000000000000000009C9C
      9BFFE1D5C9FFE69677FFE9A27CFFECAC82FFEEB285FFEEB385FFEDAF83FFECA6
      7EFFE69B78FFCA9579FF999999FFEAEAEAFFFFFFFF0080808000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008080800080808000808080000000000000000000588576FFC9F7
      E8FFC3F1E1FFBEECDDFFB8E5D6FFB1DECFFFA7D5C5FF9ECCBDFF97C5B5FF8DBA
      ABFF85B3A4FF457364FF00000000000000000000000000000000FFFFFFFFFFFF
      FFFFBC5524FFBC5524FFBC4F1CFFB93D02FFB62900FFB21400FFB10200FFFAEE
      E8FFF9EBE4FFF8E7E0FFF7E4DCFF826957FF000000000000000000000000989B
      9CFFE3D2C8FFEAA48FFFECAB91FFEDB194FFEEB697FFF0B698FFEEB496FFECAE
      92FFEAA68EFFC89A7BFF9F9F9FFFEAEAEAFFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000808080000000000000000000588576FF5987
      78FF5A8879FF5A8879FF5A8879FF588576FF598677FF517F70FF4D7B6CFF3B69
      59FF376555FF3B6959FF00000000000000000000000000000000983301FF9633
      04FF923307FF8F330AFF8B330EFF873312FF823318FF7E331CFF793320FF7533
      25FF713329FF6D332CFF6A3330FF673333FF0000000000000000000000009A9B
      9BFFE2D8CEFFDC9176FFDE9778FFE09B7AFFE09D7BFFE19E7BFFE09C7AFFDF98
      77FFDE9375FFB0866FFFA3A3A3FFEAEAEAFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D68200FFD37E
      00FFCF7A00FFCB7400FFC66D00FFC16600FFBB5F00FFB45700FFAF4F00FFAA48
      00FFA54100FFA03B00FF9C3700FF673333FF0000000000000000000000006767
      67FFCACACAFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFC4C4C4FFB9B9B9FFB2B2
      B2FFACACACFFA6A6A6FF7E7E7EFFF1F1F1FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000983301FF9633
      04FF923307FF8F330AFF8B330EFF873312FF823318FF7E331CFF793320FF7533
      25FF713329FF6D332CFF6A3330FF683332FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF01FFFFFFFFFFFFFF01FF84FFFFFF
      C00301FF80030000C003000080030000C003000080070000C003000080000000
      C003000080000000C003000000000000C003000000000000C003000000000000
      C003C00000000000C003C000E0000000C003C000E0000000C003C000E0000000
      FFFFC000E0000001FFFFC000FFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  inherited OpenDialog: TOpenDialog
    Left = 416
  end
  inherited ImageList: TcxImageList
    FormatVersion = 1
  end
end
