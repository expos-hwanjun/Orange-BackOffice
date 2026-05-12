object ProxyCheckForm: TProxyCheckForm
  Left = 300
  Top = 120
  BorderStyle = bsDialog
  Caption = #54801#47141#49324' '#54869#51064
  ClientHeight = 212
  ClientWidth = 429
  Color = 16768709
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object PasswordShape: TShape
    Left = 20
    Top = 20
    Width = 390
    Height = 141
    Brush.Color = 16765360
    Pen.Color = clGray
  end
  object IDLabel: TLabel
    Left = 65
    Top = 78
    Width = 52
    Height = 17
    Caption = #54801#47141#49324'ID'
    Transparent = True
  end
  object PasswordLabel: TLabel
    Left = 65
    Top = 118
    Width = 52
    Height = 17
    Caption = #48708#48128#48264#54840
    Transparent = True
  end
  object Label1: TLabel
    Left = 65
    Top = 40
    Width = 52
    Height = 17
    Caption = #44256#44061#48264#54840
    Transparent = True
  end
  object CustomerNoLabel: TLabel
    Left = 155
    Top = 40
    Width = 5
    Height = 17
    Transparent = True
  end
  object OKButton: TButton
    Left = 225
    Top = 167
    Width = 90
    Height = 30
    Caption = #54869#51064'(&K)'
    Default = True
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 320
    Top = 167
    Width = 90
    Height = 30
    Cancel = True
    Caption = #52712#49548'(&C)'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = CancelButtonClick
  end
  object IDEdit: TcxTextEdit
    Left = 155
    Top = 75
    ImeMode = imSAlpha
    Properties.ImeMode = imSAlpha
    Properties.MaxLength = 25
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.Color = 8454143
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 0
    Width = 200
  end
  object PasswordEdit: TcxTextEdit
    Left = 155
    Top = 115
    ImeMode = imSAlpha
    Properties.EchoMode = eemPassword
    Properties.ImeMode = imSAlpha
    Properties.MaxLength = 25
    Properties.PasswordChar = '*'
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.Color = 8454143
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 1
    Width = 200
  end
end
