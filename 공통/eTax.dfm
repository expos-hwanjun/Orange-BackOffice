object eTaxForm: TeTaxForm
  Left = 300
  Top = 120
  BorderStyle = bsDialog
  Caption = #44277#44553#51088' '#51204#51088#49464#44552#44228#49328#49436' '#48156#54665'/'#51064#51613
  ClientHeight = 352
  ClientWidth = 594
  Color = 16768709
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 17
  object Bevel: TBevel
    Left = 5
    Top = 6
    Width = 583
    Height = 288
    Shape = bsFrame
  end
  object Bevel1: TBevel
    Left = 165
    Top = 233
    Width = 292
    Height = 52
    Shape = bsFrame
  end
  object BusinessNoLabel: TLabel
    Left = 16
    Top = 23
    Width = 65
    Height = 17
    Caption = #49324#50629#51088#48264#54840
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PasswordLabel: TLabel
    Left = 180
    Top = 250
    Width = 101
    Height = 17
    Caption = #44277#51064' '#51064#51613#49436' '#50516#54840
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
  end
  object CompanyNameLabel: TLabel
    Left = 55
    Top = 57
    Width = 26
    Height = 17
    Caption = #49345#54840
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
  end
  object CeoNameLabel: TLabel
    Left = 328
    Top = 57
    Width = 39
    Height = 17
    Caption = #45824#54364#51088
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
  end
  object AddressLabel: TLabel
    Left = 55
    Top = 92
    Width = 26
    Height = 17
    Caption = #51452#49548
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
  end
  object JongmokLabel: TLabel
    Left = 337
    Top = 127
    Width = 26
    Height = 17
    Caption = #51333#47785
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
  end
  object UptaeLabel: TLabel
    Left = 54
    Top = 127
    Width = 26
    Height = 17
    Caption = #50629#53468
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TeamNameLabel: TLabel
    Left = 337
    Top = 162
    Width = 26
    Height = 17
    Caption = #48512#49436
  end
  object DamdangNameLabel: TLabel
    Left = 41
    Top = 162
    Width = 39
    Height = 17
    Caption = #45812#45817#51088
  end
  object EmailLabel: TLabel
    Left = 44
    Top = 199
    Width = 39
    Height = 17
    Caption = 'E-mail'
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PhoneNoLabel: TLabel
    Left = 311
    Top = 199
    Width = 52
    Height = 17
    Caption = #51204#54868#48264#54840
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SubBusinessNoLabel: TLabel
    Left = 289
    Top = 23
    Width = 78
    Height = 17
    Caption = #51333#49324#50629#51088#48264#54840
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
  end
  object CommentLabel: TLabel
    Left = 10
    Top = 313
    Width = 260
    Height = 17
    Caption = #44277#44553#51088'('#44228#49328#49436' '#48156#54665#51088') '#51221#48372#47484' '#51077#47141#54616#49901#49884#50724'.'
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
  end
  object PasswordEdit: TEdit
    Left = 289
    Top = 247
    Width = 152
    Height = 25
    ImeMode = imDisable
    ImeName = 'Microsoft IME 2003'
    MaxLength = 100
    PasswordChar = #9679
    TabOrder = 0
    OnEnter = EditEnter
    OnExit = EditExit
    OnKeyDown = EditKeyDown
  end
  object CompanyNameEdit: TEdit
    Left = 90
    Top = 54
    Width = 200
    Height = 25
    ImeMode = imSHanguel
    ImeName = 'Microsoft IME 2003'
    MaxLength = 100
    TabOrder = 1
    OnEnter = EditEnter
    OnExit = EditExit
    OnKeyDown = EditKeyDown
  end
  object CeoNameEdit: TEdit
    Left = 373
    Top = 54
    Width = 200
    Height = 25
    ImeMode = imSHanguel
    ImeName = 'Microsoft IME 2003'
    MaxLength = 50
    TabOrder = 2
    OnEnter = EditEnter
    OnExit = EditExit
    OnKeyDown = EditKeyDown
  end
  object AddressEdit: TEdit
    Left = 90
    Top = 89
    Width = 483
    Height = 25
    ImeMode = imSHanguel
    ImeName = 'Microsoft IME 2003'
    MaxLength = 200
    TabOrder = 3
    OnEnter = EditEnter
    OnExit = EditExit
    OnKeyDown = EditKeyDown
  end
  object UptaeEdit: TEdit
    Left = 90
    Top = 124
    Width = 200
    Height = 25
    ImeMode = imSHanguel
    ImeName = 'Microsoft IME 2003'
    MaxLength = 40
    TabOrder = 4
    OnEnter = EditEnter
    OnExit = EditExit
    OnKeyDown = EditKeyDown
  end
  object JongmokEdit: TEdit
    Left = 373
    Top = 124
    Width = 200
    Height = 25
    ImeMode = imSHanguel
    ImeName = 'Microsoft IME 2003'
    MaxLength = 40
    TabOrder = 5
    OnEnter = EditEnter
    OnExit = EditExit
    OnKeyDown = EditKeyDown
  end
  object DamdangNameEdit: TEdit
    Left = 90
    Top = 159
    Width = 200
    Height = 25
    ImeMode = imSHanguel
    ImeName = 'Microsoft IME 2003'
    MaxLength = 50
    TabOrder = 6
    OnEnter = EditEnter
    OnExit = EditExit
    OnKeyDown = EditKeyDown
  end
  object TeamNameEdit: TEdit
    Left = 373
    Top = 159
    Width = 200
    Height = 25
    ImeMode = imSHanguel
    ImeName = 'Microsoft IME 2003'
    MaxLength = 50
    TabOrder = 7
    OnEnter = EditEnter
    OnExit = EditExit
    OnKeyDown = EditKeyDown
  end
  object EmailEdit: TEdit
    Left = 90
    Top = 196
    Width = 200
    Height = 25
    ImeMode = imSAlpha
    ImeName = 'Microsoft IME 2003'
    MaxLength = 50
    TabOrder = 8
    OnChange = EmailEditChange
    OnEnter = EditEnter
    OnExit = EditExit
    OnKeyDown = EditKeyDown
  end
  object PhoneNoEdit: TEdit
    Left = 373
    Top = 196
    Width = 200
    Height = 25
    ImeMode = imDisable
    ImeName = 'Microsoft IME 2003'
    MaxLength = 20
    TabOrder = 9
    OnChange = PhoneNoEditChange
    OnEnter = EditEnter
    OnExit = EditExit
    OnKeyDown = EditKeyDown
  end
  object OKButton: TButton
    Left = 390
    Top = 308
    Width = 95
    Height = 30
    Caption = #54869#51064' (F5)'
    TabOrder = 10
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 493
    Top = 308
    Width = 95
    Height = 30
    Caption = #52712#49548
    TabOrder = 11
    OnClick = CancelButtonClick
  end
  object BusinessNoEdit: TMaskEdit
    Left = 90
    Top = 20
    Width = 120
    Height = 25
    EditMask = '!999\-99\-99999;0; '
    ImeMode = imDisable
    ImeName = 'Microsoft IME 2003'
    MaxLength = 12
    TabOrder = 12
    OnChange = BusinessNoEditChange
    OnEnter = EditEnter
    OnExit = EditExit
    OnKeyDown = EditKeyDown
  end
  object SubBusinessNoEdit: TEdit
    Left = 373
    Top = 20
    Width = 56
    Height = 25
    ImeMode = imDisable
    ImeName = 'Microsoft IME 2003'
    MaxLength = 4
    TabOrder = 13
    OnEnter = EditEnter
    OnExit = EditExit
    OnKeyDown = EditKeyDown
  end
end
