object DownloadForm: TDownloadForm
  Left = 830
  Top = 290
  AlphaBlend = True
  BorderStyle = bsNone
  Caption = 'DownloadForm'
  ClientHeight = 148
  ClientWidth = 311
  Color = clWhite
  DefaultMonitor = dmDesktop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object Shape1: TShape
    Left = 0
    Top = 1
    Width = 1
    Height = 146
    Align = alLeft
    Brush.Color = clBlack
    ExplicitHeight = 302
  end
  object Shape2: TShape
    Left = 0
    Top = 147
    Width = 311
    Height = 1
    Align = alBottom
    Brush.Color = clBlack
    ExplicitTop = 303
    ExplicitWidth = 436
  end
  object Shape3: TShape
    Left = 0
    Top = 0
    Width = 311
    Height = 1
    Align = alTop
    Brush.Color = clBlack
    ExplicitWidth = 436
  end
  object Shape4: TShape
    Left = 310
    Top = 1
    Width = 1
    Height = 146
    Align = alRight
    Brush.Color = clBlack
    ExplicitLeft = 435
    ExplicitHeight = 302
  end
  object MessageLabel: TLabel
    Left = 10
    Top = 103
    Width = 278
    Height = 23
    Alignment = taCenter
    AutoSize = False
    Caption = #50629#45936#51060#53944' '#45236#50669#51012' '#54869#51064' '#51473' '#51077#45768#45796
    Font.Charset = HANGEUL_CHARSET
    Font.Color = 3750201
    Font.Height = -17
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object ActivityIndicator: TActivityIndicator
    Left = 120
    Top = 27
    Animate = True
    IndicatorSize = aisLarge
    IndicatorType = aitSectorRing
  end
  object StartTimer: TTimer
    Enabled = False
    Interval = 1
    OnTimer = StartTimerTimer
    Left = 208
    Top = 32
  end
  object CloseTimer: TTimer
    Enabled = False
    Interval = 1
    OnTimer = CloseTimerTimer
    Left = 256
    Top = 32
  end
  object IdHTTP: TIdHTTP
    AllowCookies = True
    HandleRedirects = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 15
    Top = 16
  end
end
