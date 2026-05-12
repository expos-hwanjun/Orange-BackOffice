object CodeClassHelpForm: TCodeClassHelpForm
  Left = 300
  Top = 120
  BorderStyle = bsDialog
  Caption = #49345#54408#48516#47448' '#49440#53469
  ClientHeight = 351
  ClientWidth = 313
  Color = 16768709
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object OKButton: TButton
    Left = 119
    Top = 313
    Width = 90
    Height = 30
    Caption = #54869#51064
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CloseButton: TButton
    Left = 215
    Top = 313
    Width = 90
    Height = 30
    Caption = #52712#49548
    TabOrder = 2
    OnClick = CloseButtonClick
  end
  object ClassTreeView: TcxTreeView
    Left = 8
    Top = 8
    Width = 297
    Height = 297
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 0
    OnDblClick = ClassTreeViewDblClick
    OnKeyDown = ClassTreeViewKeyDown
    MultiSelect = True
    MultiSelectStyle = [msControlSelect, msShiftSelect]
    ReadOnly = True
    RightClickSelect = True
    RowSelect = True
    OnExpanding = ClassTreeViewExpanding
  end
end
