inherited HeadKioskPLUForm: THeadKioskPLUForm
  Tag = 1
  Caption = #54364#51456' '#53412#50724#49828#53356' PLU'
  ClientHeight = 771
  ClientWidth = 1004
  ExplicitWidth = 1020
  ExplicitHeight = 810
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Height = 706
    ExplicitHeight = 706
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1004
    ExplicitWidth = 1004
    inherited ConditionToolBar: TAdvToolBar
      inherited ConditionToolBarDateLabel: TcxLabel
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        AnchorX = 607
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        AnchorX = 154
        AnchorY = 16
      end
      inherited SelectMenuNameLabel: TcxLabel
        AnchorY = 26
      end
    end
  end
  inherited GridPanel: TPanel
    Height = 706
    ExplicitHeight = 706
    inherited Grid: TcxGrid
      Height = 635
      ExplicitHeight = 635
    end
  end
  inherited MainPanel: TPanel
    Width = 748
    Height = 706
    ExplicitWidth = 748
    ExplicitHeight = 706
    inherited PluPageControl: TcxPageControl
      Width = 748
      Height = 706
      Properties.HideTabs = False
      ExplicitWidth = 748
      ExplicitHeight = 706
      ClientRectBottom = 706
      ClientRectRight = 748
      ClientRectTop = 28
      inherited PluTab: TcxTabSheet
        Caption = '  '#47700#45684'  '
        ExplicitTop = 28
        ExplicitWidth = 748
        ExplicitHeight = 678
        inherited ClassHeaderPanel: TPanel
          inherited Label2: TLabel
            Left = 387
            Top = 5
            Visible = False
            ExplicitLeft = 391
            ExplicitTop = 5
          end
          inherited Label6: TLabel
            Left = 679
            Top = 8
            ExplicitLeft = 683
            ExplicitTop = 10
          end
          inherited ClassNameEdit: TcxTextEdit
            Left = 432
            ExplicitLeft = 432
          end
          inherited ClassPageEdit: TcxCurrencyEdit
            Left = 644
            ExplicitLeft = 644
          end
          inherited ClassLineFeedButton: TAdvGlowButton
            Left = 593
            Top = 5
            ExplicitLeft = 593
            ExplicitTop = 5
          end
        end
        inherited MenuHeaderPanel: TPanel
          Width = 735
          ExplicitWidth = 735
          inherited Label4: TLabel
            Left = 324
            Top = 6
            Visible = False
            ExplicitLeft = 328
            ExplicitTop = 6
          end
          inherited Label5: TLabel
            Left = 669
            Top = 7
            ExplicitLeft = 673
            ExplicitTop = 9
          end
          inherited MenuNameEdit: TcxTextEdit
            Left = 372
            Top = 5
            ExplicitLeft = 372
            ExplicitTop = 5
          end
          inherited MenuPageEdit: TcxCurrencyEdit
            Left = 634
            ExplicitLeft = 634
          end
          inherited LineFeedButton: TAdvGlowButton
            Left = 582
            ExplicitLeft = 582
          end
        end
      end
      inherited KioskTab: TcxTabSheet
        Caption = ' '#51060#48120#51648' '
        ExplicitTop = 28
        ExplicitWidth = 748
        ExplicitHeight = 678
        inherited KioskPanel: TAdvScrollBox
          Width = 748
          Height = 678
          ParentColor = False
          ExplicitWidth = 748
          ExplicitHeight = 678
          inherited KioskPLUClassPanel: TAdvPanel
            FullHeight = 34
          end
          inherited KioskClassPriorButton: TAdvSmoothToggleButton
            TMSStyle = 0
          end
          inherited KioskClassNextButton: TAdvSmoothToggleButton
            TMSStyle = 0
          end
          inherited KioskMenuNextButton: TAdvSmoothToggleButton
            TMSStyle = 0
          end
          inherited KioskMenuPriorButton: TAdvSmoothToggleButton
            TMSStyle = 0
          end
        end
      end
    end
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited ColorPopupMenu: TPopupMenu
    inherited ColorChangeMenuItem: TMenuItem
      Visible = False
    end
    inherited ColorCopyMenuItem: TMenuItem
      Visible = False
    end
    inherited ColorPasteMenuItem: TMenuItem
      Visible = False
    end
  end
end
