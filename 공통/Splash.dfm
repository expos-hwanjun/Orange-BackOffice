object SplashForm: TSplashForm
  Left = 300
  Top = 120
  AlphaBlend = True
  BorderStyle = bsNone
  Caption = 'Splash'
  ClientHeight = 155
  ClientWidth = 224
  Color = clWhite
  TransparentColor = True
  DefaultMonitor = dmDesktop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object MessageLabel: TLabel
    Left = 8
    Top = 108
    Width = 197
    Height = 23
    Alignment = taCenter
    AutoSize = False
    Caption = #48260#51260#51012' '#54869#51064' '#51473' '#51077#45768#45796' . .'
    Font.Charset = HANGEUL_CHARSET
    Font.Color = 3750201
    Font.Height = -17
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object ActivityIndicator: TActivityIndicator
    Left = 80
    Top = 37
    Animate = True
    IndicatorSize = aisLarge
    IndicatorType = aitSectorRing
  end
end
