object CodeBatchHelpForm: TCodeBatchHelpForm
  Left = 300
  Top = 120
  Caption = #49345#54408' '#51068#44292' '#51312#54924
  ClientHeight = 581
  ClientWidth = 847
  Color = 16768709
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object Splitter: TAdvSplitter
    Left = 0
    Top = 340
    Width = 847
    Height = 6
    Cursor = crVSplit
    Align = alBottom
    AutoSnap = False
    MinSize = 80
    Visible = False
    Appearance.BorderColor = clNone
    Appearance.BorderColorHot = clNone
    Appearance.Color = 14542308
    Appearance.ColorTo = 16768709
    Appearance.ColorHot = 15383705
    Appearance.ColorHotTo = 14922381
    GripStyle = sgFlatDots
    ExplicitLeft = 8
    ExplicitTop = 361
    ExplicitWidth = 855
  end
  object ConditionGoodsClassTreeView: TcxTreeView
    Left = 90
    Top = 124
    Width = 250
    Height = 340
    ParentFont = False
    Style.StyleController = EditStyleController
    StyleFocused.Color = 8454143
    TabOrder = 4
    Visible = False
    OnDblClick = ConditionGoodsClassTreeViewDblClick
    OnExit = ConditionGoodsClassTreeViewExit
    OnKeyDown = ConditionGoodsClassTreeViewKeyDown
    MultiSelectStyle = []
    ReadOnly = True
    RightClickSelect = True
    OnExpanding = ConditionGoodsClassTreeViewExpanding
  end
  object ConditionCompanyPanel: TAdvPanel
    Left = 533
    Top = 125
    Width = 200
    Height = 236
    BevelOuter = bvNone
    Color = 8454143
    Constraints.MinHeight = 59
    Constraints.MinWidth = 200
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
    BorderWidth = 1
    CanSize = True
    Caption.Color = 15587527
    Caption.ColorTo = 16181721
    Caption.CloseButton = True
    Caption.CloseButtonColor = clBlack
    Caption.Font.Charset = HANGEUL_CHARSET
    Caption.Font.Color = clGray
    Caption.Font.Height = -13
    Caption.Font.Name = #47569#51008' '#44256#46357
    Caption.Font.Style = [fsBold]
    Caption.GradientDirection = gdVertical
    Caption.Indent = 0
    DoubleBuffered = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    FullHeight = 177
    object ConditionCompanyCheckListBox: TCheckListBox
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 192
      Height = 228
      OnClickCheck = ConditionCompanyCheckListBoxClickCheck
      Align = alClient
      BorderStyle = bsNone
      DoubleBuffered = False
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 17
      ParentColor = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnExit = ConditionCompanyCheckListBoxExit
    end
  end
  object Grid: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 78
    Width = 841
    Height = 259
    Align = alClient
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object GridTableView: TcxGridTableView
      Tag = 99
      Navigator.Buttons.CustomButtons = <>
      FilterBox.CustomizeDialog = False
      FilterBox.Visible = fvNever
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'#44148
          Kind = skCount
          Column = GridTableViewGoodsCode
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.OnAfterPost = GridTableViewDataControllerAfterPost
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      object GridTableViewGoodsCode: TcxGridColumn
        Caption = #49345#54408#53076#46300
        DataBinding.FieldName = 'CD_GOODS'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 110
      end
      object GridTableViewGoodsName: TcxGridColumn
        Caption = #49345#54408#51060#47492
        DataBinding.FieldName = 'NM_GOODS'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 200
      end
      object GridTableViewCompanyName: TcxGridColumn
        Caption = #44144#47000#52376
        DataBinding.FieldName = 'NM_TRDPL'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 215
      end
      object GridTableViewSalePrice: TcxGridColumn
        Caption = #54032#47588#45800#44032
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'PR_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 80
      end
      object GridTableViewBuyPrice: TcxGridColumn
        Caption = #47588#51077#45800#44032
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'PR_BUY'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.00'
        Properties.OnValidate = GridTableViewBuyPricePropertiesValidate
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 80
      end
      object GridTableViewBuyQty: TcxGridColumn
        Caption = #47588#51077#49688#47049
        DataBinding.ValueType = 'Integer'
        DataBinding.FieldName = 'QTY_BUY'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 60
      end
      object GridTableViewMasterBuyPrice: TcxGridColumn
        Tag = 99
        Caption = #51221#49345#47588#51077#45800#44032
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'PR_BUY_M'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Visible = False
      end
      object GridTableViewMasterSalePrice: TcxGridColumn
        Tag = 99
        Caption = #51221#49345#54032#47588#45800#44032
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'PR_SALE_M'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Visible = False
      end
      object GridTableViewDsTax: TcxGridColumn
        Tag = 99
        Caption = #49464#47924#44396#48516
        Visible = False
      end
      object GridTableViewDsGoods: TcxGridColumn
        Tag = 99
        Caption = #49345#54408#44396#48516
        Visible = False
      end
    end
    object GridLevel: TcxGridLevel
      GridView = GridTableView
    end
  end
  object ConditionPanel: TPanel
    Left = 0
    Top = 0
    Width = 847
    Height = 75
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      847
      75)
    object ConditionGoodsClassLabel: TLabel
      Left = 20
      Top = 13
      Width = 52
      Height = 17
      Caption = #49345#54408#48516#47448
      Transparent = True
    end
    object ConditionCompanyLabel: TLabel
      Left = 20
      Top = 43
      Width = 49
      Height = 17
      Caption = #44144' '#47000' '#52376
      Transparent = True
    end
    object ConditionSearchLabel: TLabel
      Left = 400
      Top = 43
      Width = 49
      Height = 17
      Caption = #44160' '#49353' '#50612
      Transparent = True
    end
    object ConditionGoodsClassCodeEdit: TcxButtonEdit
      Left = 80
      Top = 10
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ClickKey = 112
      Properties.ImeMode = imSHanguel
      Properties.ReadOnly = False
      Properties.OnButtonClick = ConditionGoodsClassCodeEditPropertiesButtonClick
      Properties.OnChange = ConditionGoodsClassCodeEditPropertiesChange
      Properties.OnValidate = ConditionGoodsClassCodeEditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 0
      ImeMode = imSHanguel
      Width = 80
    end
    object ConditionGoodsClassNameEdit: TcxTextEdit
      Left = 165
      Top = 10
      TabStop = False
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = 14737632
      Style.StyleController = EditStyleController
      TabOrder = 4
      Width = 200
    end
    object ConditionCompanyCodeEdit: TcxButtonEdit
      Left = 80
      Top = 40
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ClickKey = 112
      Properties.OnButtonClick = ConditionCompanyCodeEditPropertiesButtonClick
      Properties.OnChange = ConditionCompanyCodeEditPropertiesChange
      Properties.OnValidate = ConditionCompanyCodeEditPropertiesValidate
      Style.StyleController = EditStyleController
      TabOrder = 1
      Width = 80
    end
    object ConditionSearchEdit: TcxTextEdit
      Left = 460
      Top = 40
      AutoSize = False
      ImeMode = imSHanguel
      ParentFont = False
      Properties.ImeMode = imSHanguel
      Style.StyleController = EditStyleController
      TabOrder = 2
      OnKeyDown = ConditionSearchEditKeyDown
      Height = 25
      Width = 150
    end
    object ConditionCompanyNameEdit: TcxTextEdit
      Left = 165
      Top = 40
      TabStop = False
      ParentFont = False
      ParentShowHint = False
      Properties.ReadOnly = True
      ShowHint = True
      Style.Color = 14737632
      Style.StyleController = EditStyleController
      TabOrder = 5
      Width = 200
    end
    object ConditionSearchButton: TButton
      Left = 651
      Top = 38
      Width = 90
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = #51312#54924'(F2)'
      TabOrder = 3
      OnClick = ConditionSearchButtonClick
    end
    object ConditionDeleteButton: TButton
      Left = 747
      Top = 37
      Width = 90
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = #49325#51228'(F4)'
      TabOrder = 6
      Visible = False
      OnClick = ConditionDeleteButtonClick
    end
  end
  object AddGrid: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 349
    Width = 841
    Height = 179
    Align = alBottom
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object AddGridTableView: TcxGridTableView
      Tag = 99
      Navigator.Buttons.CustomButtons = <>
      FilterBox.CustomizeDialog = False
      FilterBox.Visible = fvNever
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'#44148
          Kind = skCount
          Column = AddGridTableViewGoodsCode
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object AddGridTableViewGoodsCode: TcxGridColumn
        Caption = #49345#54408#53076#46300
        DataBinding.FieldName = 'CD_GOODS'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 110
      end
      object AddGridTableViewGoodsName: TcxGridColumn
        Caption = #49345#54408#51060#47492
        DataBinding.FieldName = 'NM_GOODS_SHORT'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 200
      end
      object AddGridTableViewCompanyName: TcxGridColumn
        Caption = #44144#47000#52376
        DataBinding.FieldName = 'NM_TRDPL'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 150
      end
      object AddGridTableViewSalePrice: TcxGridColumn
        Caption = #54032#47588#45800#44032
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'PR_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 80
      end
      object AddGridTableViewBuyPrice: TcxGridColumn
        Caption = #47588#51077#45800#44032
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'PR_BUY'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DecimalPlaces = 2
        Properties.DisplayFormat = ',0.00'
        Properties.OnValidate = AddGridTableViewBuyPricePropertiesValidate
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 80
      end
      object AddGridTableViewBuyQty: TcxGridColumn
        Caption = #47588#51077#49688#47049
        DataBinding.ValueType = 'Integer'
        DataBinding.FieldName = 'QTY_BUY'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        HeaderAlignmentHorz = taCenter
        Width = 60
      end
      object AddGridTableViewMasterBuyPrice: TcxGridColumn
        Tag = 99
        DataBinding.ValueType = 'Currency'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Visible = False
      end
      object AddGridTableViewMasterSalePrice: TcxGridColumn
        Tag = 99
        DataBinding.ValueType = 'Currency'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Visible = False
      end
      object AddGridTableViewDsTax: TcxGridColumn
        Tag = 99
        Caption = #49464#47924#44396#48516
        Visible = False
      end
      object AddGridTableViewDsGoods: TcxGridColumn
        Tag = 99
        Caption = #49345#54408#44396#48516
        Visible = False
      end
    end
    object AddGridLevel: TcxGridLevel
      GridView = AddGridTableView
    end
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 531
    Width = 847
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      847
      50)
    object CommentLabel: TLabel
      Left = 110
      Top = 16
      Width = 359
      Height = 17
      Caption = #39'Ctrl+'#53364#47533#39', '#39'Shift+'#53364#47533#39#51004#47196' '#50668#47084' '#49345#54408#51012' '#49440#53469#54624' '#49688' '#51080#49845#45768#45796'.'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object ButtonAddButton: TButton
      Left = 10
      Top = 10
      Width = 90
      Height = 30
      Caption = #52628#44032'(F6)'
      TabOrder = 0
      OnClick = ButtonAddButtonClick
    end
    object ButtonCloseButton: TButton
      Left = 746
      Top = 10
      Width = 90
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = #52712#49548
      TabOrder = 2
      OnClick = ButtonCloseButtonClick
    end
    object ButtonOKButton: TButton
      Left = 651
      Top = 10
      Width = 90
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = #54869#51064'(F5)'
      TabOrder = 1
      OnClick = ButtonOKButtonClick
    end
  end
  object EditStyleController: TcxEditStyleController
    Style.BorderStyle = ebsFlat
    Style.Color = clWindow
    Style.Font.Charset = HANGEUL_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = #47569#51008' '#44256#46357
    Style.Font.Style = []
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.NativeStyle = True
    Style.IsFontAssigned = True
    StyleDisabled.BorderColor = clWindowFrame
    StyleDisabled.Color = 14737632
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleDisabled.TextColor = clWindowText
    StyleFocused.BorderStyle = ebsFlat
    StyleFocused.Color = 8454143
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.BorderStyle = ebsFlat
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.NativeStyle = True
    Left = 559
    Top = 14
    PixelsPerInch = 96
  end
  object StyleRepository: TcxStyleRepository
    Scalable = True
    Left = 495
    Top = 6
    PixelsPerInch = 96
    object StyleFontRed: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clRed
    end
    object StyleFontBlue: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clBlue
    end
    object StyleEven: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15334637
      TextColor = clBlack
    end
    object StyleOdd: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clWindowText
    end
    object StyleFontGray: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clGray
    end
    object StyleFocused: TcxStyle
      AssignedValues = [svColor]
      Color = 8454143
    end
    object StyleHighlight: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clHighlight
      TextColor = clHighlightText
    end
  end
end
