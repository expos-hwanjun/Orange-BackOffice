object ScriptForm: TScriptForm
  Left = 300
  Top = 120
  BorderStyle = bsDialog
  Caption = #45936#51060#53552#48288#51060#49828' '#50629#45936#51060#53944
  ClientHeight = 387
  ClientWidth = 474
  Color = 16768709
  DefaultMonitor = dmDesktop
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object ScriptMemo: TMemo
    Left = 10
    Top = 10
    Width = 456
    Height = 266
    TabStop = False
    Ctl3D = False
    ImeName = 'Microsoft IME 2003'
    ParentCtl3D = False
    TabOrder = 0
  end
  object UpdateButton: TButton
    Left = 300
    Top = 350
    Width = 80
    Height = 30
    Caption = #50629#45936#51060#53944
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = UpdateButtonClick
  end
  object CloseButton: TButton
    Left = 386
    Top = 350
    Width = 80
    Height = 30
    Caption = #45803#44592
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = CloseButtonClick
  end
  object BackupCheckBox: TcxCheckBox
    Left = 6
    Top = 350
    Caption = ' '#50629#45936#51060#53944' '#51204' '#45936#51060#53552#48288#51060#49828#47484' '#48177#50629#54633#45768#45796'.'
    State = cbsChecked
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 3
  end
  object MessageLabel: TcxLabel
    Left = 8
    Top = 323
    Caption = #8251' '#49892#54665' '#51473#50640' '#44053#51228#47196' '#51333#47308#54616#47732' '#54532#47196#44536#47016#51060' '#51221#49345' '#51089#46041#54616#51648' '#50506#51012' '#49688' '#51080#49845#45768#45796'.'
    ParentFont = False
    Style.Font.Charset = HANGEUL_CHARSET
    Style.Font.Color = clRed
    Style.Font.Height = -13
    Style.Font.Name = #47569#51008' '#44256#46357
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel1: TcxLabel
    Left = 10
    Top = 302
    Caption = '   5'#48516#51060#49345' '#49892#54665#46112' '#49688#46020' '#51080#51004#45768' '#49892#54665' '#51473#50640' '#51208#45824' '#44053#51228#47196' '#51333#47308#54616#51648' '#47560#49901#49884#50724
    ParentFont = False
    Style.Font.Charset = HANGEUL_CHARSET
    Style.Font.Color = clRed
    Style.Font.Height = -13
    Style.Font.Name = #47569#51008' '#44256#46357
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object CountLabel: TcxLabel
    Left = 454
    Top = 283
    ParentFont = False
    Style.Font.Charset = HANGEUL_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -13
    Style.Font.Name = #47569#51008' '#44256#46357
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Properties.Alignment.Horz = taRightJustify
    AnchorX = 463
  end
  object Timer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = CloseButtonClick
    Left = 24
    Top = 23
  end
  object Script: TUniScript
    OnError = ScriptError
    Left = 70
    Top = 26
  end
  object AutoUpdateTimer: TTimer
    Enabled = False
    Interval = 10
    OnTimer = AutoUpdateTimerTimer
    Left = 257
    Top = 169
  end
  object CloseTimer: TTimer
    Enabled = False
    Interval = 10
    OnTimer = CloseTimerTimer
    Left = 121
    Top = 177
  end
  object IdHTTP: TIdHTTP
    AllowCookies = True
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
    Left = 128
    Top = 96
  end
end
