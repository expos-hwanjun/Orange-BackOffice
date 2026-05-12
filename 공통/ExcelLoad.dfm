object ExcelLoadForm: TExcelLoadForm
  Left = 300
  Top = 120
  BorderStyle = bsDialog
  Caption = 'Microsoft '#50641#49472' '#51088#47308' '#48520#47084#50724#44592
  ClientHeight = 353
  ClientWidth = 557
  Color = 16768709
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 17
  object ButtonPanel: TPanel
    Left = 0
    Top = 312
    Width = 557
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 316
    ExplicitWidth = 549
    DesignSize = (
      557
      41)
    object OKButton: TButton
      Left = 361
      Top = 5
      Width = 90
      Height = 30
      Anchors = [akTop, akRight]
      Caption = #54869#51064'(&K)'
      Default = True
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = OKButtonClick
      ExplicitLeft = 345
    end
    object CancelButton: TButton
      Left = 456
      Top = 5
      Width = 90
      Height = 30
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #52712#49548'(&C)'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = CancelButtonClick
      ExplicitLeft = 440
    end
  end
  object MainPanel: TPanel
    Left = 0
    Top = 0
    Width = 557
    Height = 312
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 549
    ExplicitHeight = 316
    DesignSize = (
      557
      312)
    object ExcelFileCaptionLabel: TLabel
      Left = 20
      Top = 20
      Width = 57
      Height = 17
      Caption = #50641#49472' '#54028#51068
    end
    object ExcelFileEdit: TEdit
      Left = 85
      Top = 17
      Width = 445
      Height = 25
      TabStop = False
      Color = 14737632
      ImeName = 'Microsoft Office IME 2007'
      ReadOnly = True
      TabOrder = 0
    end
    object ColumnGroupBox: TGroupBox
      Left = 20
      Top = 50
      Width = 524
      Height = 266
      Anchors = [akLeft, akTop, akRight]
      Caption = ' '#52860#47100' '#50672#44208' '
      TabOrder = 1
      ExplicitWidth = 510
    end
  end
  object ExcelFileOpenDialog: TOpenDialog
    Filter = 'Excel '#53685#54633#47928#49436'|*.xls;*.xlsx'
    Left = 21
    Top = 321
  end
end
