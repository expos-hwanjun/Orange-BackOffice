object MemberReceivePopupForm: TMemberReceivePopupForm
  Left = 0
  Top = 0
  Caption = #50808#49345#44144#45236#50669#51312#54924
  ClientHeight = 604
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  DesignSize = (
    784
    604)
  PixelsPerInch = 96
  TextHeight = 17
  object SearchLabel: TLabel
    Left = 25
    Top = 18
    Width = 52
    Height = 17
    Caption = #51312#54924#44592#44036
    Transparent = True
  end
  object Label1: TLabel
    Left = 22
    Top = 537
    Width = 52
    Height = 17
    Caption = #54633#44228#44552#50529
    Transparent = True
  end
  object Label2: TLabel
    Left = 196
    Top = 537
    Width = 52
    Height = 17
    Caption = #44208#51228#44552#50529
    Transparent = True
  end
  object Label3: TLabel
    Left = 372
    Top = 537
    Width = 65
    Height = 17
    Caption = #51088#53804#47532#44552#50529
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 196
    Top = 571
    Width = 52
    Height = 17
    Caption = #44284#49464#44552#50529
    Transparent = True
  end
  object Label5: TLabel
    Left = 384
    Top = 571
    Width = 52
    Height = 17
    Caption = #47732#49464#44552#50529
    Transparent = True
  end
  object SaleGrid: TcxGrid
    Left = 13
    Top = 49
    Width = 758
    Height = 472
    TabOrder = 4
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object SaleGridTableView: TcxGridTableView
      Tag = 99
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0 '#44148
          Kind = skCount
          Column = SaleGridTableViewSaleDate
        end
        item
          Format = ',0'
          Kind = skSum
          Column = SaleGridTableGridSaleAmt
        end
        item
          Format = ',0'
          Kind = skSum
        end
        item
          Format = ',0'
          Kind = skSum
        end
        item
          Format = ',0'
          Kind = skSum
        end
        item
          Format = ',0'
          Kind = skSum
          Column = SaleGridTableGridTrustAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = SaleGridTableGridNetAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = SaleGridTableGridDutyFreeAmt
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.OnGetContentStyle = SaleGridTableViewStylesGetContentStyle
      object SaleGridTableViewCheck: TcxGridColumn
        Caption = #49440#53469
        DataBinding.FieldName = 'YN_CHECK'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.DisplayGrayed = 'False'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Properties.OnEditValueChanged = SaleGridTableViewCheckPropertiesEditValueChanged
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 58
        OnHeaderClick = SaleGridTableViewCheckHeaderClick
      end
      object SaleGridTableViewSaleDate: TcxGridColumn
        Tag = 98
        Caption = #47588#52636#51068#51088
        DataBinding.FieldName = 'YMD_SALE'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Options.Focusing = False
        Options.Sorting = False
        Width = 114
      end
      object SaleGridTableViewBillNo: TcxGridColumn
        Tag = 98
        Caption = #51204#54364#48264#54840
        DataBinding.FieldName = 'NO_BILL'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Options.Focusing = False
        Options.Sorting = False
        Width = 69
      end
      object SaleGridTableGridSaleAmt: TcxGridColumn
        Tag = 98
        Caption = #54032#47588#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_SALE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Options.Focusing = False
        Options.Sorting = False
        Width = 145
      end
      object SaleGridTableGridTrustAmt: TcxGridColumn
        Caption = #50808#49345#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TRUST'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Options.Focusing = False
        Options.Sorting = False
        Width = 122
      end
      object SaleGridTableGridNetAmt: TcxGridColumn
        Caption = #44284#49464#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_NET'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Options.Focusing = False
        Options.Sorting = False
        Width = 117
      end
      object SaleGridTableGridDutyFreeAmt: TcxGridColumn
        Caption = #47732#49464#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_DUTYFREE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Options.Focusing = False
        Options.Sorting = False
        Width = 106
      end
      object SaleGridTableViewRemark: TcxGridColumn
        Caption = #48708#44256
        DataBinding.FieldName = 'REMARK'
        Visible = False
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = SaleGridTableView
    end
  end
  object OKButton: TButton
    Left = 585
    Top = 564
    Width = 90
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = #54869#51064
    Enabled = False
    TabOrder = 5
    OnClick = OKButtonClick
  end
  object CloseButton: TButton
    Left = 681
    Top = 564
    Width = 90
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = #52712#49548
    TabOrder = 6
    OnClick = CloseButtonClick
  end
  object SearchButton: TButton
    Left = 681
    Top = 10
    Width = 90
    Height = 30
    Anchors = [akTop, akRight]
    Caption = #51312#54924
    TabOrder = 3
    TabStop = False
    OnClick = SearchButtonClick
  end
  object FromDateEdit: TcxDateEdit
    Left = 84
    Top = 14
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Vert = taVCenter
    Properties.OnEditValueChanged = FromDateEditPropertiesEditValueChanged
    Style.StyleController = EditStyleController
    TabOrder = 0
    Height = 25
    Width = 90
  end
  object ToDateEdit: TcxDateEdit
    Left = 192
    Top = 14
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Vert = taVCenter
    Properties.OnEditValueChanged = ToDateEditPropertiesEditValueChanged
    Style.StyleController = EditStyleController
    TabOrder = 1
    Height = 25
    Width = 90
  end
  object ConditionToolBarDateToLabel: TcxLabel
    Left = 174
    Top = 14
    AutoSize = False
    Caption = '~'
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Transparent = True
    Height = 27
    Width = 18
    AnchorX = 183
    AnchorY = 28
  end
  object ConditionAllCheckBox: TcxCheckBox
    Left = 294
    Top = 14
    Caption = ' '#51204#52404
    ParentFont = False
    Style.StyleController = EditStyleController
    TabOrder = 2
    Transparent = True
    Width = 61
  end
  object TotalAmtEdit: TcxCurrencyEdit
    Left = 81
    Top = 534
    TabStop = False
    EditValue = 0c
    ImeMode = imSAlpha
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0'
    Properties.EditFormat = ',#'
    Properties.ImeMode = imSAlpha
    Properties.Nullable = False
    Properties.Nullstring = '0'
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Style.BorderStyle = ebsFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.StyleController = EditStyleController
    Style.IsFontAssigned = True
    TabOrder = 8
    Width = 100
  end
  object ReceiveAmtEdit: TcxCurrencyEdit
    Left = 255
    Top = 534
    EditValue = 0c
    ImeMode = imSAlpha
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0'
    Properties.EditFormat = ',#'
    Properties.ImeMode = imSAlpha
    Properties.Nullable = False
    Properties.Nullstring = '0'
    Properties.ReadOnly = False
    Properties.UseLeftAlignmentOnEditing = False
    Properties.OnEditValueChanged = ReceiveAmtEditPropertiesEditValueChanged
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.StyleController = EditStyleController
    Style.IsFontAssigned = True
    TabOrder = 9
    Width = 100
  end
  object RemnantsAmtEdit: TcxCurrencyEdit
    Left = 443
    Top = 534
    TabStop = False
    EditValue = 0c
    ImeMode = imSAlpha
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0'
    Properties.EditFormat = ',#'
    Properties.ImeMode = imSAlpha
    Properties.Nullable = False
    Properties.Nullstring = '0'
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.StyleController = EditStyleController
    Style.IsFontAssigned = True
    TabOrder = 10
    Width = 100
  end
  object NetAmtEdit: TcxCurrencyEdit
    Left = 255
    Top = 568
    TabStop = False
    EditValue = 0c
    ImeMode = imSAlpha
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0'
    Properties.EditFormat = ',#'
    Properties.ImeMode = imSAlpha
    Properties.Nullable = False
    Properties.Nullstring = '0'
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Style.BorderStyle = ebsFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.StyleController = EditStyleController
    Style.IsFontAssigned = True
    TabOrder = 11
    Width = 100
  end
  object DutyFreeAmtEdit: TcxCurrencyEdit
    Left = 443
    Top = 568
    TabStop = False
    EditValue = 0c
    ImeMode = imSAlpha
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0'
    Properties.EditFormat = ',#'
    Properties.ImeMode = imSAlpha
    Properties.Nullable = False
    Properties.Nullstring = '0'
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Style.BorderStyle = ebsFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.StyleController = EditStyleController
    Style.IsFontAssigned = True
    TabOrder = 12
    Width = 100
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
    Left = 109
    Top = 82
    PixelsPerInch = 96
  end
  object StyleRepository: TcxStyleRepository
    Scalable = True
    Left = 35
    Top = 90
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
    object StyleFontBlackBold: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15334637
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object StyleFontRedBold: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15334637
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      TextColor = clRed
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
