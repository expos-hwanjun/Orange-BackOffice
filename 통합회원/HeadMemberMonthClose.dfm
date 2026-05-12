inherited HeadMemberMonthCloseForm: THeadMemberMonthCloseForm
  Left = 300
  Top = 120
  Caption = #50900' '#47560#44048'('#53685#54633#54924#50896')'
  ClientHeight = 612
  ClientWidth = 914
  ExplicitWidth = 930
  ExplicitHeight = 651
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 914
    ExplicitWidth = 914
    inherited ButtonToolBar: TAdvToolBar
      Left = 527
      Width = 384
      ExplicitLeft = 527
      ExplicitWidth = 384
      inherited ButtonToolBarSeparator: TAdvToolBarSeparator
        Left = 287
        Height = 27
        ExplicitLeft = 287
        ExplicitHeight = 27
      end
      inherited ButtonToolBarSeparator1: TAdvToolBarSeparator
        Left = 297
        Height = 27
        Visible = False
        ExplicitLeft = 297
        ExplicitHeight = 27
      end
      inherited ButtonToolBarCloseButton: TAdvGlowButton
        Left = 307
        ExplicitLeft = 307
      end
      inherited ButtonToolBarSearchButton: TAdvGlowButton
        Visible = False
      end
      inherited ButtonToolBarSaveButton: TAdvGlowButton
        Left = 88
        Caption = #47560#44048'(F5)'
        Visible = False
        Enabled = True
        ExplicitLeft = 88
      end
      inherited ButtonToolBarDeleteButton: TAdvGlowButton
        Left = 174
        Width = 113
        Caption = #47560#44048#52712#49548'(F4)'
        Visible = False
        ExplicitLeft = 174
        ExplicitWidth = 113
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
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 25
  end
  object GridPanel: TGridPanel [2]
    Left = 0
    Top = 65
    Width = 914
    Height = 547
    Align = alClient
    ColumnCollection = <
      item
        Value = 49.717714741750620000
      end
      item
        SizeStyle = ssAbsolute
        Value = 550.000000000000000000
      end
      item
        Value = 50.282285258249380000
      end>
    ControlCollection = <
      item
        Column = 1
        Control = ClosePanel
        Row = 1
      end>
    RowCollection = <
      item
        Value = 50.000000000000040000
      end
      item
        SizeStyle = ssAbsolute
        Value = 300.000000000000000000
      end
      item
        Value = 49.999999999999960000
      end>
    TabOrder = 2
    object ClosePanel: TPanel
      Left = 180
      Top = 123
      Width = 550
      Height = 300
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      ParentColor = True
      TabOrder = 0
      object CommentLabel: TLabel
        Left = 31
        Top = 223
        Width = 357
        Height = 17
        Caption = #8251' '#54924#50896' '#54252#51064#53944'/'#49828#53596#54532' '#47484' '#45796#51020' '#45804#51032' '#44592#52488' '#51088#47308#47196' '#51060#50900#54633#45768#45796'.'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object MisuGroupBox: TcxGroupBox
        Left = 153
        Top = 40
        Caption = ' '#54252#51064#53944'/'#49828#53596#54532' '#47560#44048' '
        TabOrder = 0
        Height = 169
        Width = 238
        object Label1: TLabel
          Left = 20
          Top = 38
          Width = 52
          Height = 17
          Caption = #52572#51333#47560#44048
          Transparent = True
        end
        object MisuLastCloseMonthLabel: TLabel
          Left = 83
          Top = 39
          Width = 5
          Height = 17
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object MisuCloseMonthCaptionLabel: TLabel
          Left = 20
          Top = 70
          Width = 52
          Height = 17
          Caption = #47560#44048#45380#50900
          Transparent = True
        end
        object CloseMonthComboBox: TcxComboBox
          Left = 84
          Top = 67
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownListStyle = lsFixedList
          Properties.OnChange = MisuCloseMonthComboBoxPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 100
        end
        object PointCloseButton: TcxButton
          Left = 37
          Top = 116
          Width = 81
          Height = 30
          Caption = #47560#44048
          TabOrder = 1
          OnClick = PointCloseButtonClick
        end
        object CloseCancelButton: TcxButton
          Left = 124
          Top = 116
          Width = 81
          Height = 30
          Caption = #47560#44048#52712#49548
          TabOrder = 2
          OnClick = CloseCancelButtonClick
        end
      end
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
