object CustomerSelectForm: TCustomerSelectForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #47588#51109#51312#54924
  ClientHeight = 432
  ClientWidth = 488
  Color = 16768709
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnResize = FormResize
  DesignSize = (
    488
    432)
  PixelsPerInch = 96
  TextHeight = 17
  object SearchLabel: TLabel
    Left = 15
    Top = 15
    Width = 39
    Height = 17
    Caption = #44160#49353#50612
    Transparent = True
  end
  object Label1: TLabel
    Left = 215
    Top = 17
    Width = 170
    Height = 17
    Caption = '('#44256#44061#48264#54840','#47588#51109#47749','#49324#50629#51088#48264#54840')'
    Transparent = True
  end
  object SearchEdit: TcxTextEdit
    Left = 62
    Top = 12
    ImeMode = imSHanguel
    Properties.ImeMode = imSHanguel
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.BorderStyle = ebsFlat
    StyleFocused.Color = 8454143
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 0
    OnKeyDown = SearchEditKeyDown
    Width = 150
  end
  object SearchButton: TButton
    Left = 388
    Top = 10
    Width = 90
    Height = 30
    Anchors = [akTop, akRight]
    Caption = #51312#54924
    TabOrder = 1
    TabStop = False
    OnClick = SearchButtonClick
  end
  object Grid: TcxGrid
    Left = 8
    Top = 46
    Width = 472
    Height = 337
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object GridTableView: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      OnCellDblClick = GridTableViewCellDblClick
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'#44148
          Kind = skCount
          Column = GridTableViewCode
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.DataRowHeight = 22
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Preview.Visible = True
      object GridTableViewCode: TcxGridColumn
        Caption = #44256#44061#48264#54840
        DataBinding.FieldName = 'CD_CUSTOMER'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.IncSearch = False
        Options.Moving = False
        Options.Sorting = False
        Width = 76
      end
      object GridTableViewStoreName: TcxGridColumn
        Caption = #47588#51109#47749
        DataBinding.FieldName = 'NM_CUSTOMER'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Moving = False
        Options.Sorting = False
        Width = 206
      end
      object GridTableViewBizNo: TcxGridColumn
        Caption = #49324#50629#51088#48264#54840
        DataBinding.FieldName = 'BIZ_NO'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.EditMask = '000\-00\-00000;1;_'
        HeaderAlignmentHorz = taCenter
        Width = 119
      end
      object GridTableViewStatus: TcxGridColumn
        Caption = 'DB'#50672#44208
        DataBinding.FieldName = 'DS_STATUS'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
      end
      object GridTableViewDB_IP: TcxGridColumn
        DataBinding.FieldName = 'LOCAL_IP'
        Visible = False
      end
      object GridTableViewDB_ID: TcxGridColumn
        DataBinding.FieldName = 'LOCAL_ID'
        Visible = False
      end
      object GridTableViewDBPort: TcxGridColumn
        DataBinding.FieldName = 'LOCAL_PORT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Visible = False
      end
    end
    object GridLevel: TcxGridLevel
      GridView = GridTableView
    end
  end
  object OKButton: TButton
    Left = 294
    Top = 389
    Width = 90
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = #54869#51064
    TabOrder = 3
    OnClick = OKButtonClick
  end
  object CloseButton: TButton
    Left = 390
    Top = 390
    Width = 90
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = #52712#49548
    TabOrder = 4
    OnClick = CloseButtonClick
  end
  object ProxyPanel: TAdvPanel
    Left = 88
    Top = 99
    Width = 296
    Height = 206
    Anchors = []
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    UseDockManager = True
    Visible = False
    Version = '2.5.5.1'
    Caption.Color = clHighlight
    Caption.ColorTo = clGradientActiveCaption
    Caption.Font.Charset = HANGEUL_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -15
    Caption.Font.Name = #47569#51008' '#44256#46357
    Caption.Font.Style = [fsBold]
    Caption.Height = 30
    Caption.Indent = 0
    Caption.ShadeType = stVBump
    Caption.Text = '<FONT face="'#47569#51008' '#44256#46357'"></FONT><P align="center">'#54801#47141#49324#51064#51613'</P>'
    Caption.Visible = True
    ColorTo = clMoneyGreen
    DoubleBuffered = True
    Position.Key = 'SaleQuickShowForm'
    Position.Section = 'OrangeOrderPanel'
    ShadowOffset = 5
    ShowMoveCursor = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    DesignSize = (
      296
      206)
    FullHeight = 220
    object IDLabel: TLabel
      Left = 25
      Top = 58
      Width = 52
      Height = 17
      Caption = #54801#47141#49324'ID'
      Transparent = True
    end
    object PasswordLabel: TLabel
      Left = 25
      Top = 102
      Width = 52
      Height = 17
      Caption = #48708#48128#48264#54840
      Transparent = True
    end
    object IDEdit: TcxTextEdit
      Left = 92
      Top = 55
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
      OnKeyDown = IDEditKeyDown
      Width = 171
    end
    object PasswordEdit: TcxTextEdit
      Left = 92
      Top = 98
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
      OnKeyDown = PasswordEditKeyDown
      Width = 171
    end
    object ProxyOkButton: TButton
      Left = 70
      Top = 149
      Width = 83
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = #54869#51064
      TabOrder = 2
      OnClick = ProxyOkButtonClick
    end
    object ProxyCancelButton: TButton
      Left = 159
      Top = 149
      Width = 83
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = #52712#49548
      TabOrder = 3
      OnClick = ProxyCancelButtonClick
    end
  end
end
