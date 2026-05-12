inherited KioskPLUForm: TKioskPLUForm
  Tag = 1
  Caption = #53412#50724#49828#53356' PLU'
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    inherited ConditionToolBar: TAdvToolBar
      inherited ConditionToolBarDateLabel: TcxLabel
        AnchorX = 22
        AnchorY = 16
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        AnchorX = 690
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        AnchorX = 128
        AnchorY = 16
      end
      inherited SelectMenuNameLabel: TcxLabel
        AnchorY = 26
      end
    end
  end
  inherited MainPanel: TPanel
    inherited PluPageControl: TcxPageControl
      Properties.HideTabs = False
      ClientRectTop = 28
      inherited PluTab: TcxTabSheet
        Caption = '   '#47700#45684'   '
        ExplicitTop = 28
        ExplicitHeight = 667
        inherited ClassHeaderPanel: TPanel
          inherited Label2: TLabel
            Left = 165
            ExplicitLeft = 165
          end
          inherited Label6: TLabel
            Left = 697
            ExplicitLeft = 699
          end
          inherited ClassNameEdit: TcxTextEdit
            Top = 8
            ExplicitTop = 8
            ExplicitWidth = 394
            Width = 394
          end
          inherited ClassPageEdit: TcxCurrencyEdit
            Left = 662
            ExplicitLeft = 662
          end
          inherited ClassLineFeedButton: TAdvGlowButton
            Left = 607
            Top = 7
            ExplicitLeft = 607
            ExplicitTop = 7
          end
        end
        inherited MenuHeaderPanel: TPanel
          inherited Label4: TLabel
            Left = 8
            ExplicitLeft = 8
          end
          inherited Label5: TLabel
            Left = 697
            ExplicitLeft = 699
          end
          inherited MenuNameEdit: TcxTextEdit
            Left = 53
            ExplicitLeft = 53
            ExplicitWidth = 556
            Width = 556
          end
          inherited MenuPageEdit: TcxCurrencyEdit
            Left = 662
            ExplicitLeft = 662
          end
          inherited LineFeedButton: TAdvGlowButton
            Left = 611
            ExplicitLeft = 611
          end
        end
      end
      inherited KioskTab: TcxTabSheet
        ExplicitTop = 28
        ExplicitHeight = 667
        inherited KioskPanel: TAdvScrollBox
          Height = 667
          ExplicitHeight = 667
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
  inherited ImageList: TcxImageList
    FormatVersion = 1
  end
  inherited ToolBarPopupMenu: TPopupMenu
    inherited AutoRegItem: TMenuItem
      Visible = False
    end
    inherited N1: TMenuItem
      Visible = False
    end
    inherited CopyItem: TMenuItem
      Visible = False
    end
    inherited PasteItem: TMenuItem
      Visible = False
    end
    inherited N2: TMenuItem
      Visible = False
    end
  end
  inherited ToolBarImageList: TcxImageList
    FormatVersion = 1
  end
end
