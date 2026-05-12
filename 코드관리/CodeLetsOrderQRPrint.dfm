inherited CodeLetsOrderQRPrintForm: TCodeLetsOrderQRPrintForm
  Tag = 1
  Caption = #47131#52768#50724#45908' QR '#52636#47141
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    inherited ButtonToolBar: TAdvToolBar
      inherited ButtonToolBarSearchButton: TAdvGlowButton
        Visible = True
      end
      inherited ButtonToolBarSaveButton: TAdvGlowButton
        Visible = True
      end
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
        Visible = True
        AnchorX = 298
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Visible = True
      end
    end
  end
  inherited MainPanel: TPanel
    inherited QRSizeEdit: TcxCurrencyEdit
      ExplicitHeight = 25
    end
    inherited QRPageControl: TcxPageControl
      Properties.ActivePage = cxTabSheet2
      Properties.Style = 8
      ClientRectBottom = 690
      ClientRectLeft = 0
      ClientRectRight = 708
      inherited cxTabSheet2: TcxTabSheet
        ExplicitLeft = 0
        ExplicitWidth = 708
        ExplicitHeight = 662
        inherited cxScrollBox1: TcxScrollBox
          Width = 708
          Height = 662
          ExplicitWidth = 708
          ExplicitHeight = 662
          inherited DesignPanel: TAdvPanel
            FullHeight = 538
            inherited QRBarcode: TAdvPanel
              FullHeight = 34
            end
            inherited TableNoMemo: TAdvPanel
              FullHeight = 160
            end
          end
          inherited TemplateWidthSpinEdit: TcxSpinEdit
            ExplicitHeight = 25
          end
          inherited TemplateHeightSpinEdit: TcxSpinEdit
            ExplicitHeight = 25
          end
        end
      end
      inherited cxTabSheet1: TcxTabSheet
        ExplicitLeft = 0
        ExplicitWidth = 708
        ExplicitHeight = 662
        inherited QRPanel: TAdvPanel
          FullHeight = 200
        end
        inherited A4PaperCheckBox: TcxCheckBox
          ExplicitWidth = 69
          ExplicitHeight = 25
        end
      end
    end
    inherited ColumSpinEdit: TcxSpinEdit
      ExplicitHeight = 25
    end
    inherited URLEdit: TcxTextEdit
      ExplicitHeight = 25
    end
    inherited TableNoSizeEdit: TcxSpinEdit
      ExplicitHeight = 25
    end
  end
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 25
  end
  inherited QRCreatePanel: TAdvPanel
    Left = 112
    Top = 343
    BevelInner = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    AutoHideChildren = True
    BorderWidth = 1
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWhite
    Caption.Font.Height = -15
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.ShadeLight = 255
    Caption.TopIndent = 3
    CollapsColor = clNone
    ShadowColor = clBlack
    ShadowOffset = 0
    ShowMoveCursor = False
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Color = 4473924
    StatusBar.Color = clWhite
    StatusBar.GradientDirection = gdVertical
    Styler = AdvPanelStyler
    TextVAlign = tvaCenter
    ExplicitLeft = 112
    ExplicitTop = 343
    FullHeight = 107
    inherited CreateQtyEdit: TcxSpinEdit
      Properties.MaxValue = 100.000000000000000000
      ExplicitHeight = 25
    end
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited DesignPopupMenu: TPopupMenu
    Left = 757
    Top = 238
  end
  inherited FastReport: TfrxReport
    Datasets = <
      item
        DataSet = FastReportUserDataSet
        DataSetName = 'FastReportUserDataSet'
      end>
    Variables = <>
    Style = <>
  end
  inherited PictureLoadDialog: TOpenPictureDialog
    Left = 754
    Top = 288
  end
end
