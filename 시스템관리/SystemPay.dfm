inherited SystemPayForm: TSystemPayForm
  Left = 300
  Top = 122
  ClientHeight = 606
  ClientWidth = 990
  ExplicitLeft = 300
  ExplicitTop = 112
  ExplicitHeight = 606
  ExplicitWidth = 990
  Caption = #44208#51228' '#49688#45800' '#44288#47532
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    inherited ButtonToolBar: TAdvToolBar
      Left = 640
      Width = 347
      ExplicitLeft = 640
      ExplicitWidth = 347
      inherited ButtonToolBarSeparator: TAdvToolBarSeparator
        Left = 260
        ExplicitLeft = 260
      end
      inherited ButtonToolBarSeparator1: TAdvToolBarSeparator
        Width = 0
        ExplicitWidth = 0
      end
      inherited ButtonToolBarCloseButton: TAdvGlowButton
        Left = 270
        ExplicitLeft = 270
      end
      inherited ButtonToolBarSearchButton: TAdvGlowButton
        Visible = False
      end
      inherited ButtonToolBarSaveButton: TAdvGlowButton
        Left = 174
        ExplicitLeft = 174
      end
      inherited ButtonToolBarDeleteButton: TAdvGlowButton
        Left = 88
        Visible = False
        ExplicitLeft = 88
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
        AnchorX = 298
        AnchorY = 16
      end
    end
  end
  object SourcePanel: TPanel [1]
    Left = 0
    Top = 65
    Width = 250
    Height = 541
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 4
    object SourceTitleLabel: TcxLabel
      Left = 0
      Top = 0
      Align = alTop
      AutoSize = False
      Caption = #49324#50857' '#44032#45733#54620' '#44208#51228' '#49688#45800
      ParentColor = False
      ParentFont = False
      Style.Color = clSkyBlue
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Height = 30
      Width = 250
      AnchorX = 125
      AnchorY = 15
    end
    object SourceListBox: TcxListBox
      AlignWithMargins = True
      Left = 3
      Top = 33
      Width = 244
      Height = 505
      Align = alClient
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 20
      ListStyle = lbOwnerDrawFixed
      ParentFont = False
      Style.StyleController = EditStyleController
      TabOrder = 1
    end
  end
  object SplitterPanel: TPanel [2]
    Left = 250
    Top = 65
    Width = 62
    Height = 541
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    object SplitterAddButton: TButton
      Left = 6
      Top = 219
      Width = 50
      Height = 30
      Caption = '>'
      TabOrder = 0
      OnClick = SplitterAddButtonClick
    end
    object SplitterDeleteButton: TButton
      Left = 6
      Top = 279
      Width = 50
      Height = 30
      Caption = '<'
      TabOrder = 1
      OnClick = SplitterDeleteButtonClick
    end
  end
  object DestinationPanel: TPanel [3]
    Left = 312
    Top = 65
    Width = 678
    Height = 541
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object DestinationTitleLabel: TcxLabel
      Left = 0
      Top = 0
      Align = alTop
      AutoSize = False
      Caption = #49324#50857#54624' '#44208#51228' '#49688#45800' ('#48143' '#54364#49884' '#49692#49436')'
      ParentColor = False
      ParentFont = False
      Style.Color = 12615680
      Style.Font.Charset = HANGEUL_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = #47569#51008' '#44256#46357
      Style.Font.Style = [fsBold]
      Style.TextColor = clWhite
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Height = 30
      Width = 678
      AnchorX = 339
      AnchorY = 15
    end
    object Panel1: TPanel
      Left = 0
      Top = 501
      Width = 678
      Height = 40
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object DestinationTopButton: TButton
        Left = 3
        Top = 6
        Width = 100
        Height = 25
        Caption = #47592' '#50948#47196
        TabOrder = 0
        OnClick = DestinationTopButtonClick
      end
      object DestinationUpButton: TButton
        Left = 108
        Top = 6
        Width = 100
        Height = 25
        Caption = #50948#47196
        TabOrder = 1
        OnClick = DestinationUpButtonClick
      end
      object DestinationDownButton: TButton
        Left = 213
        Top = 6
        Width = 100
        Height = 25
        Caption = #50500#47000#47196
        TabOrder = 2
        OnClick = DestinationDownButtonClick
      end
      object DestinationBottomButton: TButton
        Left = 318
        Top = 6
        Width = 100
        Height = 25
        Caption = #47592' '#50500#47000#47196
        TabOrder = 3
        OnClick = DestinationBottomButtonClick
      end
    end
    object DestinationListBox: TcxListBox
      AlignWithMargins = True
      Left = 3
      Top = 33
      Width = 672
      Height = 465
      Align = alClient
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 20
      ListStyle = lbOwnerDrawFixed
      ParentFont = False
      Style.StyleController = EditStyleController
      TabOrder = 2
    end
  end
  inherited EditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
end
