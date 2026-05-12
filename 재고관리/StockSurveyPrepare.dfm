inherited StockSurveyPrepareForm: TStockSurveyPrepareForm
  Left = 300
  Top = 120
  Caption = #51116#44256' '#49892#49324' '#51456#48708
  ClientHeight = 602
  ClientWidth = 964
  HelpFile = #54980#48169'/'#51116#44256#44288#47532'/'#49892#49324#51456#48708'.htm'
  ExplicitWidth = 980
  ExplicitHeight = 640
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 964
    ExplicitWidth = 964
    inherited ButtonToolBar: TAdvToolBar
      Left = 882
      ExplicitLeft = 882
    end
    inherited ConditionToolBar: TAdvToolBar
      Width = 529
      ExplicitWidth = 529
      inherited ConditionToolBarDateLabel: TcxLabel
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        AnchorX = 166
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        Caption = #49892#49324#45380#50900
        Visible = True
        AnchorX = 298
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Visible = True
        ExplicitWidth = 75
        Width = 75
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 405
        ExplicitLeft = 405
      end
    end
  end
  object GoodsClassDownloadGridPanel: TGridPanel [1]
    Left = 0
    Top = 65
    Width = 964
    Height = 537
    Align = alClient
    ColumnCollection = <
      item
        Value = 36.842105263157890000
      end
      item
        Value = 26.315789473684220000
      end
      item
        Value = 36.842105263157890000
      end>
    ControlCollection = <
      item
        Column = 1
        Control = PrepareButton
        Row = 1
      end
      item
        Column = 1
        Control = PrepareCancelButton
        Row = 2
      end>
    RowCollection = <
      item
        Value = 42.105310434032760000
      end
      item
        Value = 15.789379131934460000
      end
      item
        Value = 42.105310434032770000
      end>
    TabOrder = 1
    DesignSize = (
      964
      537)
    object PrepareButton: TButton
      Left = 355
      Top = 226
      Width = 253
      Height = 84
      Align = alClient
      Caption = #49892#49324' '#51456#48708
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = PrepareButtonClick
    end
    object PrepareCancelButton: TButton
      Left = 412
      Top = 398
      Width = 138
      Height = 50
      Anchors = []
      Caption = #49892#49324' '#51456#48708' '#52712#49548
      TabOrder = 1
      OnClick = PrepareCancelButtonClick
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
