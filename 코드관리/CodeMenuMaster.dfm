inherited CodeMenuMasterForm: TCodeMenuMasterForm
  Caption = #47700#45684#44288#47532
  ClientHeight = 897
  ClientWidth = 1156
  ExplicitWidth = 1172
  ExplicitHeight = 936
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 313
    Top = 83
    Height = 814
    ExplicitLeft = 259
    ExplicitTop = 83
    ExplicitHeight = 680
  end
  object Label30: TLabel [1]
    Left = 18
    Top = 39
    Width = 39
    Height = 17
    Caption = #50900#50836#51068
    Transparent = True
  end
  object Label31: TLabel [2]
    Left = 155
    Top = 39
    Width = 39
    Height = 17
    Caption = #54868#50836#51068
    Transparent = True
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1156
    ExplicitWidth = 1156
    inherited ButtonToolBar: TAdvToolBar
      Left = 412
      ExplicitLeft = 412
    end
    inherited ConditionToolBar: TAdvToolBar
      inherited ConditionToolBarDateLabel: TcxLabel
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        AnchorX = 166
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        Visible = True
        AnchorX = 298
        AnchorY = 16
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Visible = True
      end
    end
  end
  inherited GridPanel: TPanel
    Top = 83
    Width = 313
    Height = 814
    ExplicitTop = 83
    ExplicitWidth = 313
    ExplicitHeight = 814
    inherited Grid: TcxGrid
      Width = 307
      Height = 808
      ExplicitWidth = 307
      ExplicitHeight = 808
      inherited GridTableView: TcxGridTableView
        Tag = 99
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0 '#44148
            Kind = skCount
            Column = GridTableViewMenuName
          end>
        OptionsCustomize.ColumnFiltering = True
        OptionsSelection.MultiSelect = True
        OptionsView.Footer = True
        Styles.OnGetContentStyle = GridTableViewStylesGetContentStyle
        object GridTableViewMenuCode: TcxGridColumn
          Tag = 98
          Caption = #47700#45684#53076#46300
          DataBinding.FieldName = 'CD_MENU'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 85
        end
        object GridTableViewMenuName: TcxGridColumn
          Tag = 98
          Caption = #47700#45684#51060#47492
          DataBinding.FieldName = 'NM_MENU'
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 142
        end
        object GridTableViewMenuType: TcxGridColumn
          Caption = #47700#45684#44396#48516
          DataBinding.FieldName = 'DS_MENU'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
        end
        object GridTableViewDsTax: TcxGridColumn
          Caption = #44284#49464#44396#48516
          DataBinding.FieldName = 'DS_TAX'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
        end
        object GridTableViewStatus: TcxGridColumn
          Tag = 99
          Caption = #49345#53468
          DataBinding.FieldName = 'YN_USE'
          Visible = False
        end
        object GridTableViewSalePrice: TcxGridColumn
          Caption = #54032#47588#45800#44032
          DataBinding.FieldName = 'PR_SALE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Width = 101
        end
        object GridTableViewMenuClass: TcxGridColumn
          Caption = #48516#47448
          DataBinding.FieldName = 'NM_CLASS'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 123
        end
        object GridTableViewKitchen: TcxGridColumn
          Caption = #51452#48169
          DataBinding.FieldName = 'CD_PRINTER'
          HeaderAlignmentHorz = taCenter
          Width = 79
        end
        object GridTableViewLetsOrder: TcxGridColumn
          Caption = #47131#52768#50724#45908
          DataBinding.FieldName = 'YN_LETSORDER'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
        end
        object GridTableViewSoldOut: TcxGridColumn
          Caption = #54408#51208
          DataBinding.FieldName = 'YN_SOLDOUT'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
        end
        object GridTableViewEnglish: TcxGridColumn
          Tag = 99
          Caption = #50689#50612
          DataBinding.FieldName = 'ENGLISH'
          Visible = False
        end
        object GridTableViewChina: TcxGridColumn
          Tag = 99
          Caption = #51473#44397#50612'('#44036#52404')'
          DataBinding.FieldName = 'CHINESE_SIMPLE'
          Visible = False
        end
        object GridTableViewJapan: TcxGridColumn
          Tag = 99
          Caption = #51068#48376#50612
          DataBinding.FieldName = 'JAPANESE'
          Visible = False
        end
        object GridTableViewVietnam: TcxGridColumn
          Tag = 99
          Caption = #48288#53944#45224#50612
          DataBinding.FieldName = 'VIETNAMESE'
          Visible = False
        end
        object GridTableViewThai: TcxGridColumn
          Tag = 99
          Caption = #53468#44397#50612
          DataBinding.FieldName = 'THAI'
          Visible = False
        end
        object GridTableViewIndo: TcxGridColumn
          Tag = 99
          Caption = #51064#46020#45348#49884#50500#50612
          DataBinding.FieldName = 'INDONESIAN'
          Visible = False
        end
        object GridTableViewFrench: TcxGridColumn
          Tag = 99
          Caption = #54532#46993#49828#50612
          DataBinding.FieldName = 'FRENCH'
          Visible = False
        end
        object GridTableViewGerman: TcxGridColumn
          Tag = 99
          Caption = #46021#51068#50612
          DataBinding.FieldName = 'GERMAN'
          Visible = False
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 319
    Top = 83
    Width = 837
    Height = 814
    ExplicitLeft = 319
    ExplicitTop = 83
    ExplicitWidth = 837
    ExplicitHeight = 814
    object MenuPager: TcxPageControl
      Left = 0
      Top = 0
      Width = 837
      Height = 814
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = MainPager
      Properties.CustomButtons.Buttons = <>
      Properties.TabWidth = 80
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      ClientRectBottom = 814
      ClientRectRight = 837
      ClientRectTop = 28
      object MainPager: TcxTabSheet
        Caption = #51068#48152
        ImageIndex = 0
        object AdvScrollBox1: TAdvScrollBox
          Left = 0
          Top = 0
          Width = 837
          Height = 786
          Align = alClient
          DoubleBuffered = True
          Ctl3D = False
          ParentCtl3D = False
          ParentDoubleBuffered = False
          TabOrder = 0
          object RightPanel: TPanel
            Left = 434
            Top = 0
            Width = 401
            Height = 784
            Margins.Left = 20
            Margins.Right = 30
            Align = alClient
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 0
            object MemberPanel: TPanel
              Left = 0
              Top = 0
              Width = 401
              Height = 200
              Align = alTop
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 0
              object MemberGroupBox: TAdvGroupBox
                Left = 11
                Top = 0
                Width = 285
                Height = 198
                Margins.Left = 20
                BorderColor = 12895944
                CaptionFont.Charset = DEFAULT_CHARSET
                CaptionFont.Color = clWindowText
                CaptionFont.Height = -11
                CaptionFont.Name = 'Tahoma'
                CaptionFont.Style = []
                RoundEdges = True
                Caption = ' '#54924#50896#46321#44553#48324' '#54624#51064'/'#54252#51064#53944' '
                ParentCtl3D = True
                TabOrder = 0
                object Grid1: TcxGrid
                  Left = 11
                  Top = 27
                  Width = 262
                  Height = 161
                  TabOrder = 0
                  LookAndFeel.Kind = lfOffice11
                  LookAndFeel.NativeStyle = False
                  object GridTableView1: TcxGridTableView
                    Tag = 99
                    Navigator.Buttons.CustomButtons = <>
                    ScrollbarAnnotations.CustomAnnotations = <>
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <>
                    DataController.Summary.SummaryGroups = <>
                    OptionsView.GroupByBox = False
                    object GridTableView1Column1: TcxGridColumn
                      Caption = #54924#50896#44396#48516
                      DataBinding.FieldName = 'NM_CODE1'
                      HeaderAlignmentHorz = taCenter
                      Options.Editing = False
                      Options.Filtering = False
                      Options.Focusing = False
                      Options.Moving = False
                      Width = 130
                    end
                    object GridTableView1DcRate: TcxGridColumn
                      Caption = #54624#51064#50984
                      DataBinding.ValueType = 'Currency'
                      DataBinding.FieldName = 'DC_RATE'
                      PropertiesClassName = 'TcxCurrencyEditProperties'
                      Properties.Alignment.Horz = taRightJustify
                      Properties.DisplayFormat = '#0.0'
                      Properties.OnEditValueChanged = GridTableView1DcRatePropertiesEditValueChanged
                      HeaderAlignmentHorz = taCenter
                      Options.Filtering = False
                      Options.Moving = False
                      Width = 62
                    end
                    object GridTableView1PointRate: TcxGridColumn
                      Caption = #51201#47549#50984
                      DataBinding.ValueType = 'Currency'
                      DataBinding.FieldName = 'POINT_RATE'
                      PropertiesClassName = 'TcxCurrencyEditProperties'
                      Properties.Alignment.Horz = taRightJustify
                      Properties.DisplayFormat = '#0.0'
                      Properties.OnEditValueChanged = GridTableView1PointRatePropertiesEditValueChanged
                      HeaderAlignmentHorz = taCenter
                      Options.Filtering = False
                      Options.Moving = False
                      Width = 55
                    end
                    object GridTableView1Column4: TcxGridColumn
                      DataBinding.FieldName = 'CD_CODE'
                      Visible = False
                    end
                  end
                  object GridLevel1: TcxGridLevel
                    GridView = GridTableView1
                  end
                end
              end
            end
            object ItemPanel: TPanel
              Left = 0
              Top = 200
              Width = 401
              Height = 174
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object ItemGroupBox: TAdvGroupBox
                Left = 11
                Top = 5
                Width = 282
                Height = 163
                BorderColor = 12895944
                CaptionFont.Charset = DEFAULT_CHARSET
                CaptionFont.Color = clWindowText
                CaptionFont.Height = -11
                CaptionFont.Name = 'Tahoma'
                CaptionFont.Style = []
                Caption = ' '#50500#51060#53596' '
                ParentCtl3D = True
                TabOrder = 0
                DesignSize = (
                  282
                  163)
                object ItemCheckListBox: TcxCheckListBox
                  Left = 11
                  Top = 24
                  Width = 260
                  Height = 127
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  DragMode = dmAutomatic
                  EditValueFormat = cvfIndices
                  ImeName = 'Microsoft Office IME 2007'
                  Items = <>
                  ParentFont = False
                  Style.StyleController = EditStyleController
                  TabOrder = 0
                  OnClickCheck = ItemCheckListBoxClickCheck
                  OnEditValueChanged = EditPropertiesChange
                  OnMouseDown = ItemCheckListBoxMouseDown
                end
              end
            end
            object StampPanel: TPanel
              Left = 0
              Top = 374
              Width = 401
              Height = 73
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 2
              object StampGroupBox: TAdvGroupBox
                Left = 11
                Top = 3
                Width = 282
                Height = 62
                BorderColor = 12895944
                CaptionFont.Charset = DEFAULT_CHARSET
                CaptionFont.Color = clWindowText
                CaptionFont.Height = -11
                CaptionFont.Name = 'Tahoma'
                CaptionFont.Style = []
                Caption = ' '#49828#53596#54532' '
                ParentCtl3D = True
                TabOrder = 0
                object Label11: TLabel
                  Left = 30
                  Top = 28
                  Width = 26
                  Height = 17
                  Caption = #51201#47549
                  Transparent = True
                end
                object StampUseLabel: TLabel
                  Left = 174
                  Top = 29
                  Width = 26
                  Height = 17
                  Caption = #49324#50857
                  Transparent = True
                end
                object StampSaveEdit: TcxSpinEdit
                  Left = 69
                  Top = 25
                  Hint = 'SAVE_STAMP'
                  ParentFont = False
                  Properties.Alignment.Horz = taCenter
                  Properties.AssignedValues.MinValue = True
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 0
                  OnClick = GroupNoEditClick
                  Width = 49
                end
                object StampUseEdit: TcxSpinEdit
                  Left = 211
                  Top = 25
                  Hint = 'USE_STAMP'
                  ParentFont = False
                  Properties.Alignment.Horz = taCenter
                  Properties.AssignedValues.MinValue = True
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 1
                  OnClick = GroupNoEditClick
                  Width = 49
                end
              end
            end
            object WeekPricePanel: TPanel
              Left = 0
              Top = 539
              Width = 401
              Height = 239
              Align = alTop
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 3
              object WeekPriceGroupBox: TAdvGroupBox
                Left = 11
                Top = 1
                Width = 282
                Height = 176
                Margins.Right = 15
                BorderColor = 12895944
                CaptionFont.Charset = DEFAULT_CHARSET
                CaptionFont.Color = clWindowText
                CaptionFont.Height = -11
                CaptionFont.Name = 'Tahoma'
                CaptionFont.Style = []
                Caption = ' '#50836#51068#48324' '#54032#47588#45800#44032
                ParentCtl3D = True
                TabOrder = 0
                object Label19: TLabel
                  Left = 34
                  Top = 31
                  Width = 13
                  Height = 17
                  Caption = #50900
                  Transparent = True
                end
                object Label27: TLabel
                  Left = 158
                  Top = 31
                  Width = 13
                  Height = 17
                  Caption = #54868
                  Transparent = True
                end
                object Label28: TLabel
                  Left = 34
                  Top = 62
                  Width = 13
                  Height = 17
                  Caption = #49688
                  Transparent = True
                end
                object Label29: TLabel
                  Left = 158
                  Top = 62
                  Width = 13
                  Height = 17
                  Caption = #47785
                  Transparent = True
                end
                object Label32: TLabel
                  Left = 34
                  Top = 93
                  Width = 13
                  Height = 17
                  Caption = #44552
                  Transparent = True
                end
                object Label33: TLabel
                  Left = 158
                  Top = 93
                  Width = 13
                  Height = 17
                  Caption = #53664
                  Transparent = True
                end
                object Label34: TLabel
                  Left = 35
                  Top = 124
                  Width = 13
                  Height = 17
                  Caption = #51068
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = 204
                  Font.Height = -13
                  Font.Name = #47569#51008' '#44256#46357
                  Font.Style = []
                  ParentFont = False
                  Transparent = True
                end
                object Label12: TLabel
                  Left = 15
                  Top = 154
                  Width = 254
                  Height = 17
                  Caption = #8251' '#48152#46300#49884' '#51204#50836#51068#50640' '#45800#44032#47484' '#51077#47141#54644#50556#54633#45768#45796'.'
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = 204
                  Font.Height = -13
                  Font.Name = #47569#51008' '#44256#46357
                  Font.Style = []
                  ParentFont = False
                  Transparent = True
                end
                object Label36: TLabel
                  Left = 148
                  Top = 124
                  Width = 26
                  Height = 17
                  Caption = #55092#51068
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = 204
                  Font.Height = -13
                  Font.Name = #47569#51008' '#44256#46357
                  Font.Style = []
                  ParentFont = False
                  Transparent = True
                end
                object PriceMonEdit: TcxCurrencyEdit
                  Left = 57
                  Top = 28
                  EditValue = 0
                  ParentFont = False
                  Properties.Alignment.Horz = taRightJustify
                  Properties.AssignedValues.MinValue = True
                  Properties.DisplayFormat = ',0'
                  Properties.EditFormat = ',0'
                  Properties.ImeMode = imSAlpha
                  Properties.Nullable = False
                  Properties.Nullstring = '0'
                  Properties.UseLeftAlignmentOnEditing = False
                  Properties.OnChange = EditPropertiesChange
                  Properties.OnValidate = EditPropertiesValidate
                  Style.StyleController = EditStyleController
                  TabOrder = 0
                  Width = 79
                end
                object PriceTueEdit: TcxCurrencyEdit
                  Left = 179
                  Top = 28
                  EditValue = 0
                  ParentFont = False
                  Properties.Alignment.Horz = taRightJustify
                  Properties.AssignedValues.MinValue = True
                  Properties.DisplayFormat = ',0'
                  Properties.EditFormat = ',0'
                  Properties.ImeMode = imSAlpha
                  Properties.Nullable = False
                  Properties.Nullstring = '0'
                  Properties.UseLeftAlignmentOnEditing = False
                  Properties.OnChange = EditPropertiesChange
                  Properties.OnValidate = EditPropertiesValidate
                  Style.StyleController = EditStyleController
                  TabOrder = 1
                  Width = 79
                end
                object PriceWedEdit: TcxCurrencyEdit
                  Left = 57
                  Top = 59
                  EditValue = 0
                  ParentFont = False
                  Properties.Alignment.Horz = taRightJustify
                  Properties.AssignedValues.MinValue = True
                  Properties.DisplayFormat = ',0'
                  Properties.EditFormat = ',0'
                  Properties.ImeMode = imSAlpha
                  Properties.Nullable = False
                  Properties.Nullstring = '0'
                  Properties.UseLeftAlignmentOnEditing = False
                  Properties.OnChange = EditPropertiesChange
                  Properties.OnValidate = EditPropertiesValidate
                  Style.StyleController = EditStyleController
                  TabOrder = 2
                  Width = 79
                end
                object PriceThuEdit: TcxCurrencyEdit
                  Left = 179
                  Top = 59
                  EditValue = 0
                  ParentFont = False
                  Properties.Alignment.Horz = taRightJustify
                  Properties.AssignedValues.MinValue = True
                  Properties.DisplayFormat = ',0'
                  Properties.EditFormat = ',0'
                  Properties.ImeMode = imSAlpha
                  Properties.Nullable = False
                  Properties.Nullstring = '0'
                  Properties.UseLeftAlignmentOnEditing = False
                  Properties.OnChange = EditPropertiesChange
                  Properties.OnValidate = EditPropertiesValidate
                  Style.StyleController = EditStyleController
                  TabOrder = 3
                  Width = 79
                end
                object PriceFriEdit: TcxCurrencyEdit
                  Left = 57
                  Top = 90
                  EditValue = 0
                  ParentFont = False
                  Properties.Alignment.Horz = taRightJustify
                  Properties.AssignedValues.MinValue = True
                  Properties.DisplayFormat = ',0'
                  Properties.EditFormat = ',0'
                  Properties.ImeMode = imSAlpha
                  Properties.Nullable = False
                  Properties.Nullstring = '0'
                  Properties.UseLeftAlignmentOnEditing = False
                  Properties.OnChange = EditPropertiesChange
                  Properties.OnValidate = EditPropertiesValidate
                  Style.StyleController = EditStyleController
                  TabOrder = 4
                  Width = 79
                end
                object PriceSatEdit: TcxCurrencyEdit
                  Left = 179
                  Top = 90
                  EditValue = 0
                  ParentFont = False
                  Properties.Alignment.Horz = taRightJustify
                  Properties.AssignedValues.MinValue = True
                  Properties.DisplayFormat = ',0'
                  Properties.EditFormat = ',0'
                  Properties.ImeMode = imSAlpha
                  Properties.Nullable = False
                  Properties.Nullstring = '0'
                  Properties.UseLeftAlignmentOnEditing = False
                  Properties.OnChange = EditPropertiesChange
                  Properties.OnValidate = EditPropertiesValidate
                  Style.StyleController = EditStyleController
                  TabOrder = 5
                  Width = 79
                end
                object PriceSunEdit: TcxCurrencyEdit
                  Left = 57
                  Top = 121
                  EditValue = 0
                  ParentFont = False
                  Properties.Alignment.Horz = taRightJustify
                  Properties.AssignedValues.MinValue = True
                  Properties.DisplayFormat = ',0'
                  Properties.EditFormat = ',0'
                  Properties.ImeMode = imSAlpha
                  Properties.Nullable = False
                  Properties.Nullstring = '0'
                  Properties.UseLeftAlignmentOnEditing = False
                  Properties.OnChange = EditPropertiesChange
                  Properties.OnValidate = EditPropertiesValidate
                  Style.StyleController = EditStyleController
                  Style.TextColor = 204
                  TabOrder = 6
                  Width = 79
                end
                object PriceHolidayEdit: TcxCurrencyEdit
                  Left = 180
                  Top = 121
                  EditValue = 0
                  ParentFont = False
                  Properties.Alignment.Horz = taRightJustify
                  Properties.AssignedValues.MinValue = True
                  Properties.DisplayFormat = ',0'
                  Properties.EditFormat = ',0'
                  Properties.ImeMode = imSAlpha
                  Properties.Nullable = False
                  Properties.Nullstring = '0'
                  Properties.UseLeftAlignmentOnEditing = False
                  Properties.OnChange = EditPropertiesChange
                  Properties.OnValidate = EditPropertiesValidate
                  Style.StyleController = EditStyleController
                  Style.TextColor = 204
                  TabOrder = 7
                  Width = 79
                end
              end
            end
            object OrderTimePanel: TPanel
              Left = 0
              Top = 447
              Width = 401
              Height = 92
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 4
              object AdvGroupBox4: TAdvGroupBox
                Left = 11
                Top = 0
                Width = 282
                Height = 89
                Margins.Right = 15
                BorderColor = 12895944
                CaptionFont.Charset = DEFAULT_CHARSET
                CaptionFont.Color = clWindowText
                CaptionFont.Height = -11
                CaptionFont.Name = 'Tahoma'
                CaptionFont.Style = []
                Caption = ' '#51452#47928#44032#45733#49884#44036' '
                ParentCtl3D = True
                TabOrder = 0
                object Label35: TLabel
                  Left = 100
                  Top = 30
                  Width = 9
                  Height = 17
                  Caption = '~'
                  Transparent = True
                end
                object OrderTimeFromEdit: TcxTimeEdit
                  Left = 16
                  Top = 27
                  ParentFont = False
                  Properties.Alignment.Horz = taCenter
                  Properties.TimeFormat = tfHourMin
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 0
                  Width = 73
                end
                object OrderTimeToEdit: TcxTimeEdit
                  Left = 121
                  Top = 27
                  ParentFont = False
                  Properties.Alignment.Horz = taCenter
                  Properties.TimeFormat = tfHourMin
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 1
                  Width = 64
                end
                object OrderAllTimeCheckBox: TcxCheckBox
                  Left = 191
                  Top = 27
                  Caption = '24'#49884#44036
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  Style.TransparentBorder = False
                  TabOrder = 2
                end
                object Option16CheckBox: TcxCheckBox
                  Left = 15
                  Top = 58
                  Caption = ' '#51452#47568' / '#44277#55092#51068' '#54408#51208
                  ParentFont = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  Style.TransparentBorder = False
                  TabOrder = 3
                end
              end
            end
          end
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 434
            Height = 784
            Align = alLeft
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 1
            object CornerPanel: TPanel
              Left = 0
              Top = 152
              Width = 434
              Height = 30
              Align = alTop
              BevelOuter = bvNone
              Color = 16445929
              TabOrder = 1
              object Label7: TLabel
                Left = 13
                Top = 8
                Width = 51
                Height = 17
                Caption = #50629'     '#51109
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object CornerComboBox: TcxComboBox
                Left = 73
                Top = 5
                Hint = 'CD_CORNER'
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.OnChange = EditPropertiesChange
                Style.LookAndFeel.Kind = lfOffice11
                Style.LookAndFeel.NativeStyle = True
                Style.StyleController = EditStyleController
                StyleDisabled.Color = 16316664
                StyleDisabled.LookAndFeel.Kind = lfOffice11
                StyleDisabled.LookAndFeel.NativeStyle = True
                StyleFocused.LookAndFeel.Kind = lfOffice11
                StyleFocused.LookAndFeel.NativeStyle = True
                StyleHot.LookAndFeel.Kind = lfOffice11
                StyleHot.LookAndFeel.NativeStyle = True
                TabOrder = 0
                Width = 278
              end
            end
            object KitchenPanel: TPanel
              Left = 0
              Top = 458
              Width = 434
              Height = 165
              Align = alTop
              BevelOuter = bvNone
              BiDiMode = bdLeftToRight
              ParentBiDiMode = False
              ParentColor = True
              TabOrder = 3
              object KitchenGroupBox: TAdvGroupBox
                Left = 10
                Top = 2
                Width = 185
                Height = 127
                BorderColor = 12895944
                CaptionFont.Charset = DEFAULT_CHARSET
                CaptionFont.Color = clWindowText
                CaptionFont.Height = -11
                CaptionFont.Name = 'Tahoma'
                CaptionFont.Style = []
                Caption = ' '#51452#48169#52636#47141' '
                ParentCtl3D = True
                TabOrder = 0
                object KitchenCheckListBox: TcxCheckListBox
                  Left = 13
                  Top = 22
                  Width = 161
                  Height = 98
                  Hint = 'CD_PRINTER'
                  ImeName = 'Microsoft Office IME 2007'
                  Items = <>
                  ParentFont = False
                  Style.StyleController = EditStyleController
                  TabOrder = 0
                  OnEditValueChanged = EditPropertiesChange
                end
              end
              object KitchenComboBox: TcxComboBox
                Left = 13
                Top = 135
                Hint = 'DS_KITCHEN'
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 2
                Width = 300
              end
              object MemoGroupBox: TAdvGroupBox
                Left = 201
                Top = 1
                Width = 211
                Height = 127
                BorderColor = 12895944
                CaptionFont.Charset = DEFAULT_CHARSET
                CaptionFont.Color = clWindowText
                CaptionFont.Height = -11
                CaptionFont.Name = 'Tahoma'
                CaptionFont.Style = []
                Transparent = False
                Caption = ' '#51452#48169#47700#47784' '
                ParentCtl3D = True
                TabOrder = 1
                DesignSize = (
                  211
                  127)
                object MemoCheckListBox: TcxCheckListBox
                  Left = 13
                  Top = 22
                  Width = 185
                  Height = 98
                  Anchors = [akLeft, akTop, akBottom]
                  ImeName = 'Microsoft Office IME 2007'
                  Items = <>
                  ParentFont = False
                  Style.StyleController = EditStyleController
                  TabOrder = 0
                  OnEditValueChanged = EditPropertiesChange
                end
              end
            end
            object TopPanel: TPanel
              Left = 0
              Top = 0
              Width = 434
              Height = 152
              Align = alTop
              BevelOuter = bvNone
              Color = 16445929
              TabOrder = 0
              object MenuCodeLabel: TLabel
                Left = 13
                Top = 8
                Width = 52
                Height = 17
                Caption = #47700#45684#53076#46300
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = True
              end
              object MenuNameLabel: TLabel
                Left = 13
                Top = 38
                Width = 52
                Height = 17
                Caption = #47700#45684#51060#47492
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = True
              end
              object MenuShortNameLabel: TLabel
                Left = 13
                Top = 69
                Width = 52
                Height = 17
                Caption = #45800#52629#51060#47492
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = True
              end
              object MenuClassLabel: TLabel
                Left = 13
                Top = 128
                Width = 52
                Height = 17
                Caption = #47700#45684#48516#47448
                Transparent = True
              end
              object Label8: TLabel
                Left = 13
                Top = 99
                Width = 52
                Height = 17
                Caption = #51452#48169#52636#47141
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object MenuNameEdit: TcxTextEdit
                Left = 73
                Top = 35
                ParentFont = False
                Properties.ImeMode = imSHanguel
                Properties.MaxLength = 150
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 3
                OnExit = MenuNameEditExit
                Width = 334
              end
              object MenuShortNameEdit: TcxTextEdit
                Left = 73
                Top = 65
                ParentFont = False
                Properties.ImeMode = imSHanguel
                Properties.MaxLength = 60
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 4
                Width = 278
              end
              object MenuCodeEdit: TcxTextEdit
                Left = 73
                Top = 5
                ParentFont = False
                Properties.ImeMode = imDisable
                Properties.MaxLength = 14
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 0
                Width = 100
              end
              object MenuClassCodeEdit: TcxButtonEdit
                Left = 73
                Top = 125
                Hint = 'CD_CLASS'
                ParentFont = False
                Properties.Buttons = <
                  item
                    Default = True
                    Kind = bkEllipsis
                  end>
                Properties.ClickKey = 112
                Properties.ImeMode = imSHanguel
                Properties.OnButtonClick = MenuClassCodeEditPropertiesButtonClick
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 6
                Width = 88
              end
              object MenuClassNameEdit: TcxTextEdit
                Left = 164
                Top = 125
                TabStop = False
                ParentFont = False
                Properties.ReadOnly = True
                Style.Color = 15856113
                Style.StyleController = EditStyleController
                TabOrder = 7
                Width = 242
              end
              object InputRemainCheckBox: TcxCheckBox
                Tag = 99
                Left = 236
                Top = 4
                TabStop = False
                Caption = #49888#44508#44256#51221
                ParentFont = False
                Properties.OnChange = InputRemainCheckBoxPropertiesChange
                Style.StyleController = EditStyleController
                Style.TransparentBorder = False
                TabOrder = 2
              end
              object HeadMenuStatus: TcxLabel
                Left = 328
                Top = 5
                AutoSize = False
                Caption = #47588#51109#47700#45684
                ParentColor = False
                ParentFont = False
                Style.BorderStyle = ebsOffice11
                Style.Color = clWhite
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clBlack
                Style.Font.Height = -13
                Style.Font.Name = #47569#51008' '#44256#46357
                Style.Font.Style = []
                Style.IsFontAssigned = True
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                Transparent = True
                Visible = False
                Height = 24
                Width = 78
                AnchorX = 367
                AnchorY = 17
              end
              object KeyInButton: TAdvGlowButton
                Left = 176
                Top = 5
                Width = 56
                Height = 25
                Caption = #49688#46041#51077#47141
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                FocusType = ftHot
                NotesFont.Charset = DEFAULT_CHARSET
                NotesFont.Color = clWindowText
                NotesFont.Height = -11
                NotesFont.Name = 'Tahoma'
                NotesFont.Style = []
                ParentFont = False
                Rounded = True
                TabOrder = 1
                OnClick = KeyInButtonClick
                Appearance.BorderColor = 11382963
                Appearance.BorderColorHot = 11565130
                Appearance.BorderColorCheckedHot = 11565130
                Appearance.BorderColorDown = 11565130
                Appearance.BorderColorChecked = 13744549
                Appearance.BorderColorDisabled = 13948116
                Appearance.ColorChecked = 13744549
                Appearance.ColorCheckedTo = 13744549
                Appearance.ColorDisabled = clWhite
                Appearance.ColorDisabledTo = clNone
                Appearance.ColorDown = 11565130
                Appearance.ColorDownTo = 11565130
                Appearance.ColorHot = 16444643
                Appearance.ColorHotTo = 16444643
                Appearance.ColorMirror = clWhite
                Appearance.ColorMirrorTo = clWhite
                Appearance.ColorMirrorHot = 16444643
                Appearance.ColorMirrorHotTo = 16444643
                Appearance.ColorMirrorDown = 11565130
                Appearance.ColorMirrorDownTo = 11565130
                Appearance.ColorMirrorChecked = 13744549
                Appearance.ColorMirrorCheckedTo = 13744549
                Appearance.ColorMirrorDisabled = clWhite
                Appearance.ColorMirrorDisabledTo = clNone
                Appearance.GradientHot = ggVertical
                Appearance.GradientMirrorHot = ggVertical
                Appearance.GradientDown = ggVertical
                Appearance.GradientMirrorDown = ggVertical
                Appearance.GradientChecked = ggVertical
                Appearance.SystemFont = False
                Appearance.TextColorChecked = 3750459
                Appearance.TextColorDown = 2303013
                Appearance.TextColorHot = 2303013
                Appearance.TextColorDisabled = 13948116
              end
              object KitchenMenuNameEdit: TcxTextEdit
                Left = 73
                Top = 95
                ParentFont = False
                Properties.ImeMode = imSHanguel
                Properties.MaxLength = 60
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 5
                Width = 278
              end
              object MenuInfoButton: TAdvGlowButton
                Left = 355
                Top = 64
                Width = 50
                Height = 53
                Caption = #47700#45684'  '#49444#47749
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                FocusType = ftHot
                NotesFont.Charset = DEFAULT_CHARSET
                NotesFont.Color = clWindowText
                NotesFont.Height = -11
                NotesFont.Name = 'Tahoma'
                NotesFont.Style = []
                ParentFont = False
                Rounded = True
                TabOrder = 9
                OnClick = MenuInfoButtonClick
                Appearance.BorderColor = 11382963
                Appearance.BorderColorHot = 11565130
                Appearance.BorderColorCheckedHot = 11565130
                Appearance.BorderColorDown = 11565130
                Appearance.BorderColorChecked = 13744549
                Appearance.BorderColorDisabled = 13948116
                Appearance.ColorChecked = 13744549
                Appearance.ColorCheckedTo = 13744549
                Appearance.ColorDisabled = clWhite
                Appearance.ColorDisabledTo = clNone
                Appearance.ColorDown = 11565130
                Appearance.ColorDownTo = 11565130
                Appearance.ColorHot = 16444643
                Appearance.ColorHotTo = 16444643
                Appearance.ColorMirror = clWhite
                Appearance.ColorMirrorTo = clWhite
                Appearance.ColorMirrorHot = 16444643
                Appearance.ColorMirrorHotTo = 16444643
                Appearance.ColorMirrorDown = 11565130
                Appearance.ColorMirrorDownTo = 11565130
                Appearance.ColorMirrorChecked = 13744549
                Appearance.ColorMirrorCheckedTo = 13744549
                Appearance.ColorMirrorDisabled = clWhite
                Appearance.ColorMirrorDisabledTo = clNone
                Appearance.GradientHot = ggVertical
                Appearance.GradientMirrorHot = ggVertical
                Appearance.GradientDown = ggVertical
                Appearance.GradientMirrorDown = ggVertical
                Appearance.GradientChecked = ggVertical
                Appearance.SystemFont = False
                Appearance.TextColorChecked = 3750459
                Appearance.TextColorDown = 2303013
                Appearance.TextColorHot = 2303013
                Appearance.TextColorDisabled = 13948116
              end
            end
            object CenterPanel: TPanel
              Left = 0
              Top = 182
              Width = 434
              Height = 276
              Align = alTop
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 2
              object PriceSaleLabel: TLabel
                Left = 13
                Top = 39
                Width = 52
                Height = 17
                Caption = #54032#47588#45800#44032
                Transparent = True
              end
              object GoodsTypeLabel: TLabel
                Left = 13
                Top = 9
                Width = 52
                Height = 17
                Caption = #47700#45684#44396#48516
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = True
              end
              object Label1: TLabel
                Left = 274
                Top = 9
                Width = 52
                Height = 17
                Caption = #44284#49464#44396#48516
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object PriceProfitRateLabel: TLabel
                Left = 311
                Top = 41
                Width = 39
                Height = 17
                Caption = #51060#51061#47456
                Transparent = True
              end
              object MenuNoLabel: TLabel
                Left = 167
                Top = 99
                Width = 52
                Height = 17
                Caption = #47700#45684#48264#54840
                Transparent = True
              end
              object PriceTipLabel: TLabel
                Left = 13
                Top = 100
                Width = 49
                Height = 17
                Caption = #48393' '#49324' '#47308
                Transparent = True
              end
              object PriceDoubleLabel: TLabel
                Left = 14
                Top = 68
                Width = 49
                Height = 17
                Caption = #44273' '#48764' '#44592
                Transparent = True
              end
              object DisplaySeqLabel: TLabel
                Left = 298
                Top = 68
                Width = 52
                Height = 17
                Caption = #54364#49884#49692#48264
                Transparent = True
              end
              object GroupNoLabel: TLabel
                Left = 299
                Top = 97
                Width = 52
                Height = 17
                Caption = #44536#47353#48264#54840
                Transparent = True
              end
              object Label18: TLabel
                Left = 167
                Top = 9
                Width = 52
                Height = 17
                Caption = #49440#53469#49688#47049
                Transparent = True
              end
              object PriceBuyLabel: TLabel
                Left = 167
                Top = 39
                Width = 52
                Height = 17
                Caption = #47588#51077#45800#44032
                Transparent = True
              end
              object Label2: TLabel
                Left = 167
                Top = 68
                Width = 52
                Height = 17
                Caption = #54252#51109#45800#44032
                Transparent = True
              end
              object Label3: TLabel
                Left = 15
                Top = 130
                Width = 49
                Height = 17
                Caption = #44256' '#44061' '#49688
                Transparent = True
              end
              object Label6: TLabel
                Left = 130
                Top = 131
                Width = 13
                Height = 17
                Caption = #47749
                Transparent = True
              end
              object Label15: TLabel
                Left = 167
                Top = 130
                Width = 52
                Height = 17
                Caption = #52572#49548#51452#47928
                Transparent = True
              end
              object Label37: TLabel
                Left = 298
                Top = 130
                Width = 52
                Height = 17
                Caption = #51452#47928#51228#50557
                Transparent = True
                Visible = False
              end
              object BageLabel: TLabel
                Left = 321
                Top = 159
                Width = 26
                Height = 17
                Caption = #48195#51648
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #47569#51008' '#44256#46357
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object PriceSaleEdit: TcxCurrencyEdit
                Left = 73
                Top = 36
                EditValue = 0
                ParentFont = False
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0'
                Properties.EditFormat = ',0'
                Properties.ImeMode = imSAlpha
                Properties.Nullable = False
                Properties.Nullstring = '0'
                Properties.UseLeftAlignmentOnEditing = False
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 3
                Width = 83
              end
              object MenuTypeComboBox: TcxComboBox
                Left = 73
                Top = 6
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 0
                Width = 83
              end
              object TaxComboBox: TcxComboBox
                Left = 330
                Top = 6
                Hint = 'DS_TAX'
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 2
                Width = 76
              end
              object PriceProfitRateEdit: TcxCurrencyEdit
                Left = 354
                Top = 35
                EditValue = 0.000000000000000000
                ParentFont = False
                ParentShowHint = False
                Properties.Alignment.Horz = taRightJustify
                Properties.DecimalPlaces = 2
                Properties.DisplayFormat = '0.00'
                Properties.EditFormat = '#.00'
                Properties.ImeMode = imDisable
                Properties.MaxValue = 100.000000000000000000
                Properties.MinValue = -100.000000000000000000
                Properties.Nullable = False
                Properties.UseLeftAlignmentOnEditing = False
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                ShowHint = True
                Style.StyleController = EditStyleController
                TabOrder = 5
                Width = 52
              end
              object MenuNoEdit: TcxTextEdit
                Left = 222
                Top = 95
                ParentFont = False
                Properties.Alignment.Horz = taCenter
                Properties.ImeMode = imSAlpha
                Properties.MaxLength = 4
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 10
                Width = 50
              end
              object PriceTipEdit: TcxCurrencyEdit
                Left = 73
                Top = 96
                EditValue = 0.000000000000000000
                ParentFont = False
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0'
                Properties.EditFormat = ',0'
                Properties.ImeMode = imSAlpha
                Properties.Nullable = False
                Properties.Nullstring = '0'
                Properties.UseLeftAlignmentOnEditing = False
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 9
                Width = 83
              end
              object PriceDoubleEdit: TcxCurrencyEdit
                Left = 73
                Top = 65
                EditValue = 0.000000000000000000
                ParentFont = False
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0'
                Properties.EditFormat = ',0'
                Properties.ImeMode = imSAlpha
                Properties.Nullable = False
                Properties.Nullstring = '0'
                Properties.UseLeftAlignmentOnEditing = False
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 6
                Width = 83
              end
              object DisplaySeqEdit: TcxSpinEdit
                Left = 354
                Top = 65
                ParentFont = False
                Properties.Alignment.Horz = taCenter
                Properties.AssignedValues.MinValue = True
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 8
                Width = 52
              end
              object GroupNoEdit: TcxSpinEdit
                Left = 355
                Top = 94
                Hint = 'NO_GROUP'
                ParentFont = False
                Properties.Alignment.Horz = taCenter
                Properties.AssignedValues.MinValue = True
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 11
                OnClick = GroupNoEditClick
                Width = 51
              end
              object Option1CheckBox: TcxCheckBox
                Left = 68
                Top = 157
                Hint = 'YN_DC'
                Caption = #54624#51064
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                Style.TransparentBorder = False
                TabOrder = 14
              end
              object Option2CheckBox: TcxCheckBox
                Left = 173
                Top = 182
                Hint = 'YN_POINT'
                Caption = #54252#51064#53944#51201#47549
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                Style.TransparentBorder = False
                TabOrder = 18
              end
              object UseCheckBox: TcxCheckBox
                Left = 68
                Top = 231
                Hint = 'YN_USE'
                Caption = #49324#50857
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                Style.TransparentBorder = False
                TabOrder = 22
              end
              object Option3CheckBox: TcxCheckBox
                Left = 68
                Top = 182
                Caption = #50689#49688#51613#52636#47141
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                Style.TransparentBorder = False
                TabOrder = 17
              end
              object MenuCountEdit: TcxSpinEdit
                Left = 222
                Top = 6
                Hint = 'QTY_SELECT'
                ParentFont = False
                Properties.Alignment.Horz = taCenter
                Properties.AssignedValues.MinValue = True
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 1
                OnClick = GroupNoEditClick
                Width = 40
              end
              object PriceBuyEdit: TcxCurrencyEdit
                Left = 222
                Top = 36
                EditValue = 0.000000000000000000
                ParentFont = False
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0'
                Properties.EditFormat = ',0'
                Properties.ImeMode = imSAlpha
                Properties.Nullable = False
                Properties.Nullstring = '0'
                Properties.UseLeftAlignmentOnEditing = False
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 4
                Width = 69
              end
              object Option5CheckBox: TcxCheckBox
                Left = 173
                Top = 207
                Hint = 'YN_BILL'
                Caption = #44256#44061#51452#47928#49436#52636#47141
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                Style.TransparentBorder = False
                TabOrder = 21
              end
              object Option9CheckBox: TcxCheckBox
                Left = 307
                Top = 182
                Hint = 'YN_POINT_LIMIT'
                Caption = #54252#51064#53944#49324#50857#51228#54620
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                Style.TransparentBorder = False
                TabOrder = 19
              end
              object Option6CheckBox: TcxCheckBox
                Left = 368
                Top = 249
                Hint = 'YN_TABLECOLOR'
                Caption = #53580#51060#48660#49353#49345
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                Style.TransparentBorder = False
                TabOrder = 23
                Visible = False
              end
              object Option7CheckBox: TcxCheckBox
                Left = 307
                Top = 206
                Hint = 'YN_TICKET'
                Caption = #54000#53011
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                Style.TransparentBorder = False
                TabOrder = 16
                Visible = False
              end
              object Option8CheckBox: TcxCheckBox
                Left = 68
                Top = 207
                Hint = 'YN_SOLDOUT'
                Caption = #54408#51208
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                Style.TransparentBorder = False
                TabOrder = 20
              end
              object PricePackingEdit: TcxCurrencyEdit
                Left = 222
                Top = 65
                EditValue = 0.000000000000000000
                ParentFont = False
                Properties.Alignment.Horz = taRightJustify
                Properties.DisplayFormat = ',0'
                Properties.EditFormat = ',0'
                Properties.ImeMode = imSAlpha
                Properties.Nullable = False
                Properties.Nullstring = '0'
                Properties.UseLeftAlignmentOnEditing = False
                Properties.OnChange = EditPropertiesChange
                Properties.OnValidate = EditPropertiesValidate
                Style.StyleController = EditStyleController
                TabOrder = 7
                Width = 69
              end
              object Option4Edit: TcxSpinEdit
                Left = 73
                Top = 126
                Hint = 'GUEST_COUNT'
                ParentFont = False
                Properties.Alignment.Horz = taCenter
                Properties.AssignedValues.MinValue = True
                Properties.MaxValue = 9.000000000000000000
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 12
                OnClick = GroupNoEditClick
                Width = 45
              end
              object Option11CheckBox: TcxCheckBox
                Left = 68
                Top = 254
                Hint = 'YN_LETSORDER'
                Caption = #47131#52768#50724#45908#50640#49436' '#51452#47928' '#49884' '#44256#44061#51452#47928#49436' '#52636#47141
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                Style.TransparentBorder = False
                TabOrder = 24
              end
              object Option12CheckBox: TcxCheckBox
                Left = 173
                Top = 157
                Hint = 'YN_ADULT'
                Caption = #49457#51064#51204#50857
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                Style.TransparentBorder = False
                TabOrder = 15
              end
              object Option14Edit: TcxSpinEdit
                Left = 222
                Top = 126
                Hint = 'GUEST_COUNT'
                ParentFont = False
                Properties.Alignment.Horz = taCenter
                Properties.AssignedValues.MinValue = True
                Properties.MaxValue = 9.000000000000000000
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 13
                OnClick = GroupNoEditClick
                Width = 50
              end
              object Option17CheckBox: TcxCheckBox
                Left = 173
                Top = 231
                Hint = 'YN_SALEQTY'
                Caption = #45817#51068#54032#47588#49688#47049' '#44288#47532
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                Style.TransparentBorder = False
                TabOrder = 25
              end
              object Option10ComboBox: TcxComboBox
                Left = 354
                Top = 125
                Hint = 'YN_ORDER'
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 26
                Visible = False
                Width = 52
              end
              object Option13ComboBox: TcxComboBox
                Left = 354
                Top = 155
                Hint = 'BADGE'
                ParentFont = False
                Properties.DropDownListStyle = lsFixedList
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                TabOrder = 27
                Width = 76
              end
              object Option18CheckBox: TcxCheckBox
                Left = 306
                Top = 227
                Caption = #54056#49828#50892#46300
                ParentFont = False
                Properties.OnChange = EditPropertiesChange
                Style.StyleController = EditStyleController
                Style.TransparentBorder = False
                TabOrder = 28
                Visible = False
              end
            end
            object BottomPanel: TPanel
              Left = 0
              Top = 623
              Width = 434
              Height = 80
              Align = alTop
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 4
              object StockGroupBox: TAdvGroupBox
                Left = 13
                Top = -2
                Width = 399
                Height = 57
                BorderColor = 12895944
                CaptionFont.Charset = DEFAULT_CHARSET
                CaptionFont.Color = clWindowText
                CaptionFont.Height = -11
                CaptionFont.Name = 'Tahoma'
                CaptionFont.Style = []
                Caption = ' '#51116#44256#44288#47532' '
                ParentCtl3D = True
                TabOrder = 0
                object StockTypeLabel: TLabel
                  Left = 11
                  Top = 26
                  Width = 52
                  Height = 17
                  Caption = #51116#44256#44288#47532
                  Transparent = True
                end
                object Label9: TLabel
                  Left = 243
                  Top = 26
                  Width = 52
                  Height = 17
                  Caption = #44060#45817#51473#47049
                  Transparent = True
                end
                object Label10: TLabel
                  Left = 379
                  Top = 26
                  Width = 8
                  Height = 17
                  Caption = 'g'
                  Transparent = True
                end
                object StockTypeComboBox: TcxComboBox
                  Left = 71
                  Top = 22
                  Hint = 'DS_STOCK'
                  ParentFont = False
                  Properties.DropDownListStyle = lsFixedList
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 0
                  Width = 120
                end
                object UnitQtyEdit: TcxCurrencyEdit
                  Left = 303
                  Top = 22
                  Hint = 'QTY_UNIT'
                  EditValue = 0.000000000000000000
                  ParentFont = False
                  Properties.Alignment.Horz = taRightJustify
                  Properties.DisplayFormat = ',0'
                  Properties.EditFormat = ',#'
                  Properties.ImeMode = imSAlpha
                  Properties.UseLeftAlignmentOnEditing = False
                  Properties.OnChange = EditPropertiesChange
                  Style.StyleController = EditStyleController
                  TabOrder = 1
                  Width = 72
                end
              end
            end
            object MenuClassTreeView: TcxTreeView
              Left = 5
              Top = 539
              Width = 250
              Height = 340
              ParentFont = False
              Style.StyleController = EditStyleController
              TabOrder = 5
              Visible = False
              OnDblClick = MenuClassTreeViewDblClick
              OnExit = MenuClassTreeViewExit
              OnKeyDown = MenuClassTreeViewKeyDown
              MultiSelectStyle = []
              ReadOnly = True
              RightClickSelect = True
              OnExpanding = MenuClassTreeViewExpanding
            end
          end
        end
      end
      object PluPager: TcxTabSheet
        Caption = 'PLU'#46321#47197
        ImageIndex = 1
        OnShow = PluPagerShow
        object ClassPanel: TAdvGroupBox
          Left = 14
          Top = 19
          Width = 658
          Height = 168
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          Caption = ' '#48516#47448' [ 1 Page ] '
          ParentCtl3D = True
          TabOrder = 0
        end
        object MenuPanel: TAdvGroupBox
          Left = 14
          Top = 198
          Width = 658
          Height = 379
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          Caption = ' '#47700#45684' [ 1 Page ] '
          ParentCtl3D = True
          TabOrder = 1
        end
      end
      object LogPager: TcxTabSheet
        Caption = #49688#51221#51060#47141
        ImageIndex = 2
        OnShow = LogPagerShow
        object cxGrid1: TcxGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 831
          Height = 780
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
          LookAndFeel.ScrollbarMode = sbmTouch
          object HistoryGridTableView: TcxGridTableView
            Tag = 99
            Navigator.Buttons.CustomButtons = <>
            FilterBox.CustomizeDialog = False
            FilterBox.Visible = fvNever
            ScrollbarAnnotations.CustomAnnotations = <>
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = ',0'#44148
                Kind = skCount
                Column = HistoryGridTableViewHistoryDate
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            object HistoryGridTableViewHistoryDate: TcxGridColumn
              Caption = #48320#44221' '#51068#49884
              DataBinding.FieldName = 'DT_HIST'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              FooterAlignmentHorz = taRightJustify
              HeaderAlignmentHorz = taCenter
              Options.Grouping = False
              Options.Moving = False
              Width = 150
            end
            object HistoryGridTableViewWorkType: TcxGridColumn
              Caption = #51089#50629
              DataBinding.FieldName = 'GUBUN'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 50
            end
            object HistoryGridTableViewMenusName: TcxGridColumn
              Caption = #47700#45684#51060#47492
              DataBinding.FieldName = 'NM_MENU'
              PropertiesClassName = 'TcxLabelProperties'
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Options.Moving = False
              Width = 200
            end
            object HistoryGridTableViewSalePrice: TcxGridColumn
              Caption = #54032#47588#44032'('#51204')'
              DataBinding.FieldName = 'PR_SALE_OLD'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',#'
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Options.Moving = False
              Width = 80
            end
            object HistoryGridTableViewAfterSalePrice: TcxGridColumn
              Caption = #54032#47588#44032'('#54980')'
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'PR_SALE'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',#'
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object HistoryGridTableViewProfitRate: TcxGridColumn
              Caption = #51060#51061#47456
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'PR_SALE_PROFIT'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DecimalPlaces = 2
              Properties.DisplayFormat = ',#.##'
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Options.Moving = False
              Width = 60
            end
            object HistoryGridTableViewMakerCode: TcxGridColumn
              Caption = #51452#48169
              DataBinding.FieldName = 'CD_PRINTER'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 135
            end
            object HistoryGridTableViewMenuShortName: TcxGridColumn
              Caption = #47700#45684#45800#52629#51060#47492
              DataBinding.FieldName = 'NM_MENU_SHORT'
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Options.Moving = False
              Width = 150
            end
            object HistoryGridTableViewBuyPrice: TcxGridColumn
              Caption = #47588#51077#44032'('#51204')'
              DataBinding.FieldName = 'PR_BUY_OLD'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DecimalPlaces = 2
              Properties.DisplayFormat = ',0.00'
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Options.Grouping = False
              Options.Moving = False
              Width = 80
            end
            object HistoryGridTableViewAfterBuyPrice: TcxGridColumn
              Caption = #47588#51077#44032'('#54980')'
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'PR_BUY'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',0.00'
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object HistoryGridTableViewClassCode: TcxGridColumn
              Caption = #47700#45684#48516#47448
              DataBinding.FieldName = 'NM_CLASS'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
              Width = 200
            end
            object HistoryGridTableViewType: TcxGridColumn
              Caption = #44396#48516
              DataBinding.FieldName = 'DS_MENU_TYPE'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 70
            end
            object HistoryGridTableViewTaxYN: TcxGridColumn
              Caption = #44284#49464
              DataBinding.FieldName = 'DS_TAX'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 50
            end
            object HistoryGridTableViewStockType: TcxGridColumn
              Caption = #51116#44256#44396#48516
              DataBinding.FieldName = 'DS_STOCK'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 70
            end
            object HistoryGridTableViewUnitQty: TcxGridColumn
              Caption = #44060#45817#51473#47049
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'QTY_UNIT'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',#'
              HeaderAlignmentHorz = taCenter
              Width = 75
            end
            object HistoryGridTableViewCompanyCode: TcxGridColumn
              Caption = #47588#51077#52376
              DataBinding.FieldName = 'NM_TRDPL'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taLeftJustify
              HeaderAlignmentHorz = taCenter
              Width = 200
            end
            object HistoryGridTableViewDoublePrice: TcxGridColumn
              Caption = #44273#48764#44592
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'PR_SALE_DOUBLE'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',#'
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewTipPrice: TcxGridColumn
              Caption = #48393#49324#47308
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'PR_TIP'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = ',#'
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewMenuCount: TcxGridColumn
              Caption = #47700#45684#44079#49688
              DataBinding.ValueType = 'Integer'
              DataBinding.FieldName = 'QTY_SELECT'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.DisplayFormat = ',#'
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewMenuNo: TcxGridColumn
              Caption = #47700#45684#48264#54840
              DataBinding.FieldName = 'NO_MENU'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.DisplayFormat = ',#'
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewDisplaySeq: TcxGridColumn
              Caption = #54364#49884#49692#48264
              DataBinding.ValueType = 'Integer'
              DataBinding.FieldName = 'BILL_SEQ'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.DisplayFormat = ',#'
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewGroupNo: TcxGridColumn
              Caption = #44536#47353#48264#54840
              DataBinding.ValueType = 'Integer'
              DataBinding.FieldName = 'NO_GROUP'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.DisplayFormat = ',#'
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewDsKitchen: TcxGridColumn
              Caption = #52636#47141#44396#48516
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'DS_KITCHEN'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 69
            end
            object HistoryGridTableViewStampSave: TcxGridColumn
              Caption = #49828#53596#54532#51201#47549
              DataBinding.FieldName = 'SAVE_STAMP'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = '#,#'
              HeaderAlignmentHorz = taCenter
              Width = 96
            end
            object HistoryGridTableViewStampUse: TcxGridColumn
              Caption = #49828#53596#54532#49324#50857
              DataBinding.FieldName = 'USE_STAMP'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = '#,#'
              HeaderAlignmentHorz = taCenter
              Width = 78
            end
            object HistoryGridTableViewConfig: TcxGridColumn
              Caption = #50741#49496
              DataBinding.FieldName = 'CONFIG'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 77
            end
            object HistoryGridTableViewPricePacking: TcxGridColumn
              Caption = #54252#51109#45800#44032
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'PR_SALE_PACKING'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = '#,#'
              HeaderAlignmentHorz = taCenter
              Width = 73
            end
            object HistoryGridTableViewPriceMon: TcxGridColumn
              Caption = #54032#47588#45800#44032'('#50900')'
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'PR_SALE_MON'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = '#,#'
              HeaderAlignmentHorz = taCenter
              Width = 102
            end
            object HistoryGridTableViewPriceTue: TcxGridColumn
              Caption = #54032#47588#45800#44032'('#54868')'
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'PR_SALE_TUE'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = '#,#'
              HeaderAlignmentHorz = taCenter
              Width = 98
            end
            object HistoryGridTableViewPriceWed: TcxGridColumn
              Caption = #54032#47588#45800#44032'('#49688')'
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'PR_SALE_WED'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = '#,#'
              HeaderAlignmentHorz = taCenter
              Width = 107
            end
            object HistoryGridTableViewPriceThu: TcxGridColumn
              Caption = #54032#47588#45800#44032'('#47785')'
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'PR_SALE_THU'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = '#,#'
              HeaderAlignmentHorz = taCenter
              Width = 94
            end
            object HistoryGridTableViewPriceFri: TcxGridColumn
              Caption = #54032#47588#45800#44032'('#44552')'
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'PR_SALE_FRI'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = '#,#'
              HeaderAlignmentHorz = taCenter
              Width = 87
            end
            object HistoryGridTableViewPriceSat: TcxGridColumn
              Caption = #54032#47588#45800#44032'('#53664')'
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'PR_SALE_SAT'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = '#,#'
              HeaderAlignmentHorz = taCenter
              Width = 88
            end
            object HistoryGridTableViewPriceSun: TcxGridColumn
              Caption = #54032#47588#45800#44032'('#51068')'
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'PR_SALE_SUN'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = '#,#'
              HeaderAlignmentHorz = taCenter
              Width = 88
            end
            object HistoryGridTableViewPriceHoliday: TcxGridColumn
              Caption = #54032#47588#45800#44032'('#55092#51068')'
              DataBinding.ValueType = 'Currency'
              DataBinding.FieldName = 'PR_SALE_HOLIDAY'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              Properties.DisplayFormat = '#,#'
              HeaderAlignmentHorz = taCenter
            end
            object HistoryGridTableViewUseYN: TcxGridColumn
              Caption = #49324#50857
              DataBinding.FieldName = 'YN_USE'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Width = 59
            end
            object HistoryGridTableViewUserName: TcxGridColumn
              Caption = #51089#50629#49324#50896
              DataBinding.FieldName = 'NM_SAWON'
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object HistoryGridTableViewInsertDate: TcxGridColumn
              Caption = #46321#47197#51068#49884
              DataBinding.FieldName = 'DT_INSERT'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
              Options.Grouping = False
              Options.Moving = False
              Width = 150
            end
            object HistoryGridTableViewPrgChange: TcxGridColumn
              Caption = #48320#44221'PG'
              DataBinding.FieldName = 'PRG_CHANGE'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = HistoryGridTableView
          end
        end
      end
      object LanguagePage: TcxTabSheet
        Caption = #45796#44397#50612
        ImageIndex = 3
        object Label16: TLabel
          Left = 55
          Top = 54
          Width = 26
          Height = 17
          Alignment = taRightJustify
          Caption = #50689#50612
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label17: TLabel
          Left = 43
          Top = 86
          Width = 39
          Height = 17
          Alignment = taRightJustify
          Caption = #51473#44397#50612
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label20: TLabel
          Left = 44
          Top = 118
          Width = 39
          Height = 17
          Alignment = taRightJustify
          Caption = #51068#48376#50612
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label21: TLabel
          Left = 42
          Top = 20
          Width = 39
          Height = 17
          Alignment = taRightJustify
          Caption = #54620#44397#50612
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label22: TLabel
          Left = 31
          Top = 147
          Width = 52
          Height = 17
          Alignment = taRightJustify
          Caption = #48288#53944#45224#50612
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label23: TLabel
          Left = 44
          Top = 178
          Width = 39
          Height = 17
          Alignment = taRightJustify
          Caption = #53468#44397#50612
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label24: TLabel
          Left = 18
          Top = 210
          Width = 65
          Height = 17
          Alignment = taRightJustify
          Caption = #51064#46020#45348#49884#50500
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label25: TLabel
          Left = 31
          Top = 241
          Width = 52
          Height = 17
          Alignment = taRightJustify
          Caption = #54532#46993#49828#50612
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label26: TLabel
          Left = 44
          Top = 272
          Width = 39
          Height = 17
          Alignment = taRightJustify
          Caption = #46021#51068#50612
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object EnglishEdit: TcxTextEdit
          Left = 89
          Top = 50
          ParentFont = False
          Properties.MaxLength = 1000
          Properties.ReadOnly = True
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 576
        end
        object ChianensEdit: TcxTextEdit
          Left = 89
          Top = 82
          ParentFont = False
          Properties.MaxLength = 1000
          Properties.ReadOnly = True
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 576
        end
        object JapanseEdit: TcxTextEdit
          Left = 89
          Top = 113
          ParentFont = False
          Properties.MaxLength = 1000
          Properties.ReadOnly = True
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 2
          Width = 576
        end
        object VietnamensEdit: TcxTextEdit
          Left = 89
          Top = 145
          ParentFont = False
          Properties.MaxLength = 1000
          Properties.ReadOnly = True
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 3
          Width = 576
        end
        object KoreanEdit: TcxTextEdit
          Left = 89
          Top = 17
          TabStop = False
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 150
          Properties.ReadOnly = True
          Style.StyleController = EditStyleController
          TabOrder = 4
          Width = 576
        end
        object ThaiEdit: TcxTextEdit
          Left = 89
          Top = 176
          ParentFont = False
          Properties.MaxLength = 1000
          Properties.ReadOnly = True
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 5
          Width = 576
        end
        object IndoEdit: TcxTextEdit
          Left = 89
          Top = 207
          ParentFont = False
          Properties.MaxLength = 1000
          Properties.ReadOnly = True
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 6
          Width = 576
        end
        object FrenchEdit: TcxTextEdit
          Left = 89
          Top = 238
          ParentFont = False
          Properties.MaxLength = 1000
          Properties.ReadOnly = True
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 7
          Width = 576
        end
        object GermanEdit: TcxTextEdit
          Left = 89
          Top = 269
          ParentFont = False
          Properties.MaxLength = 1000
          Properties.ReadOnly = True
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 8
          Width = 576
        end
      end
    end
  end
  object DetailSearchPanel: TAdvPanel [7]
    Left = 0
    Top = 65
    Width = 1156
    Height = 18
    Align = alTop
    DockSite = True
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    UseDockManager = True
    Version = '2.5.11.0'
    AutoHideChildren = False
    BorderColor = clBlack
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.CloseColor = clHighlight
    Caption.Font.Charset = HANGEUL_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -13
    Caption.Font.Name = #47569#51008' '#44256#46357
    Caption.Font.Style = [fsBold]
    Caption.Indent = 0
    Caption.MinMaxButton = True
    Caption.MinMaxCaption = True
    Caption.Text = #49345#49464#44160#49353#51012' '#50896#54616#49884#47732' '#50668#44592#47484' '#53364#47533#54616#49901#49884#50724'.'
    Caption.Visible = True
    Collaps = True
    CollapsDelay = 0
    ColorTo = clInactiveCaption
    DoubleBuffered = True
    Ellipsis = True
    Position.Save = True
    Position.Location = clInifile
    ShowMoveCursor = True
    StatusBar.BevelInner = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    FullHeight = 244
    object ScrollBox1: TScrollBox
      Left = 0
      Top = 18
      Width = 1156
      Height = 0
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clInactiveCaption
      Ctl3D = True
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 0
      object ConditionVanLabel: TLabel
        Left = 601
        Top = 167
        Width = 27
        Height = 17
        Caption = 'VAN'
        Transparent = True
      end
      object Label5: TLabel
        Left = 456
        Top = 166
        Width = 26
        Height = 17
        Caption = #51452#48169
        Transparent = True
      end
      object ConditionCornerLabel: TLabel
        Left = 456
        Top = 198
        Width = 26
        Height = 17
        Caption = #50629#51109
        Transparent = True
        Visible = False
      end
      object Label14: TLabel
        Left = 627
        Top = 137
        Width = 26
        Height = 17
        Caption = #48195#51648
        Transparent = True
        Visible = False
      end
      object Conditon1RadioGroup: TAdvOfficeRadioGroup
        Tag = 99
        Left = 14
        Top = 52
        Width = 115
        Height = 80
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Version = '1.8.0.3'
        BiDiMode = bdLeftToRight
        Caption = #54032#47588#44396#48516
        ParentBackground = False
        ParentBiDiMode = False
        ParentCtl3D = True
        TabOrder = 0
        ItemIndex = 1
        Items.Strings = (
          #51204#52404
          #54032#47588#51473
          #45800#51333#47700#45684)
        ButtonVertAlign = tlCenter
        Ellipsis = False
      end
      object Conditon2RadioGroup: TAdvOfficeRadioGroup
        Tag = 99
        Left = 141
        Top = 52
        Width = 136
        Height = 167
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Version = '1.8.0.3'
        BiDiMode = bdLeftToRight
        Caption = #47700#45684#44396#48516
        ParentBackground = False
        ParentBiDiMode = False
        ParentCtl3D = True
        TabOrder = 1
        ItemIndex = 0
        Items.Strings = (
          #51204#52404
          #51068#48152' '#47700#45684
          #49903#44032' '#47700#45684
          #49464#53944' '#47700#45684
          #53076#49828#47700#45684
          #50724#54536#49464#53944' '#47700#45684
          #51200#50872' '#47700#45684
          #50500#51060#53596' '#47700#45684
          #44536#47353#47700#45684)
        ButtonVertAlign = tlCenter
        Ellipsis = False
      end
      object Conditon3RadioGroup: TAdvOfficeRadioGroup
        Tag = 99
        Left = 283
        Top = 52
        Width = 165
        Height = 133
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Version = '1.8.0.3'
        BiDiMode = bdLeftToRight
        Caption = #54624#51064'/'#54252#51064#53944
        ParentBackground = False
        ParentBiDiMode = False
        ParentCtl3D = True
        TabOrder = 2
        ItemIndex = 0
        Items.Strings = (
          #51204#52404
          #54624#51064' '#44032#45733' '#47700#45684
          #54624#51064' '#48520#44032' '#47700#45684
          #54252#51064#53944' '#51201#47549' '#47700#45684
          #54252#51064#53944' '#48120#51201#47549' '#47700#45684)
        ButtonVertAlign = tlCenter
        Ellipsis = False
      end
      object Conditon4RadioGroup: TAdvOfficeRadioGroup
        Tag = 99
        Left = 455
        Top = 52
        Width = 138
        Height = 105
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Version = '1.8.0.3'
        BiDiMode = bdLeftToRight
        Caption = #44284#49464'/'#47732#49464
        ParentBackground = False
        ParentBiDiMode = False
        ParentCtl3D = True
        TabOrder = 3
        ItemIndex = 0
        Items.Strings = (
          #51204#52404
          #44284#49464'('#54252#54632')'
          #47732#49464
          #44284#49464'('#48324#46020')')
        ButtonVertAlign = tlCenter
        Ellipsis = False
      end
      object Conditon5RadioGroup: TAdvOfficeRadioGroup
        Tag = 99
        Left = 599
        Top = 52
        Width = 144
        Height = 77
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        Version = '1.8.0.3'
        BiDiMode = bdLeftToRight
        Caption = #51116#44256#44396#48516
        ParentBackground = False
        ParentBiDiMode = False
        ParentCtl3D = True
        TabOrder = 4
        ItemIndex = 0
        Items.Strings = (
          #51204#52404
          #44288#47532#50504#54632
          #44288#47532#54632)
        ButtonVertAlign = tlCenter
        Ellipsis = False
      end
      object AdvGroupBox1: TAdvGroupBox
        Left = 14
        Top = 4
        Width = 729
        Height = 42
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        ParentCtl3D = True
        TabOrder = 5
        object ConditionGoodsClassLabel: TLabel
          Left = 5
          Top = 8
          Width = 52
          Height = 25
          AutoSize = False
          Caption = #47700#45684#48516#47448
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
          Layout = tlCenter
        end
        object Label4: TLabel
          Left = 457
          Top = 8
          Width = 52
          Height = 25
          AutoSize = False
          Caption = #49688#51221#44592#44036
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
          Layout = tlCenter
        end
        object ConditionGoodsClassCodeEdit: TcxButtonEdit
          Tag = 99
          Left = 65
          Top = 7
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
          Properties.OnChange = EditPropertiesChange
          Properties.OnValidate = EditPropertiesValidate
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 80
        end
        object ConditionGoodsClassNameEdit: TcxTextEdit
          Tag = 99
          Left = 151
          Top = 7
          TabStop = False
          ParentFont = False
          Properties.ReadOnly = True
          Style.Color = 14737632
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 283
        end
        object ConditionFromDateEdit: TcxDateEdit
          Tag = 99
          Left = 517
          Top = 8
          AutoSize = False
          ParentFont = False
          Properties.ImmediatePost = True
          Style.StyleController = EditStyleController
          TabOrder = 2
          Height = 25
          Width = 90
        end
        object cxLabel2: TcxLabel
          Left = 607
          Top = 8
          AutoSize = False
          Caption = '~'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Transparent = True
          Height = 27
          Width = 18
          AnchorX = 616
          AnchorY = 22
        end
        object ConditionToDateEdit: TcxDateEdit
          Tag = 99
          Left = 625
          Top = 8
          AutoSize = False
          ParentFont = False
          Properties.ImmediatePost = True
          Style.StyleController = EditStyleController
          TabOrder = 4
          Height = 25
          Width = 90
        end
      end
      object ConditionNotClassCheckBox: TAdvOfficeCheckBox
        Tag = 99
        Left = 14
        Top = 132
        Width = 119
        Height = 26
        TabOrder = 6
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = #48516#47448' '#48120#51648#51221
        ReturnIsTab = False
        Version = '1.8.0.3'
      end
      object ConditionVanComboBox: TcxComboBox
        Tag = 99
        Left = 634
        Top = 163
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Style.StyleController = EditStyleController
        TabOrder = 9
        Width = 109
      end
      object ConditionKitchenComboBox: TcxComboBox
        Tag = 99
        Left = 485
        Top = 163
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          ''
          'ONE VAN'
          'TWO VAN')
        Style.StyleController = EditStyleController
        TabOrder = 10
        Width = 108
      end
      object ConditionCornerComboBox: TcxComboBox
        Tag = 99
        Left = 485
        Top = 194
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Style.StyleController = EditStyleController
        TabOrder = 11
        Visible = False
        Width = 258
      end
      object ConditionCustomerCheckBox: TAdvOfficeCheckBox
        Tag = 99
        Left = 14
        Top = 175
        Width = 119
        Height = 26
        TabOrder = 7
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = #44256#44061#49688' '#52628#51221#47700#45684
        ReturnIsTab = False
        Version = '1.8.0.3'
      end
      object BillPrinterCheckBox: TAdvOfficeCheckBox
        Tag = 99
        Left = 14
        Top = 153
        Width = 119
        Height = 26
        TabOrder = 8
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = #44256#44061#51452#47928#49436#52636#47141
        ReturnIsTab = False
        Version = '1.8.0.3'
      end
      object ConditionPointLimitCheckBox: TAdvOfficeCheckBox
        Tag = 99
        Left = 14
        Top = 197
        Width = 119
        Height = 26
        TabOrder = 12
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = #54252#51064#53944' '#49324#50857#51228#54620
        ReturnIsTab = False
        Version = '1.8.0.3'
      end
      object ConditionSoldOutCheckBox: TAdvOfficeCheckBox
        Tag = 99
        Left = 283
        Top = 190
        Width = 62
        Height = 26
        TabOrder = 13
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = #54408#51208
        ReturnIsTab = False
        Version = '1.8.0.3'
      end
      object ConditionZeroMenuCheckBox: TAdvOfficeCheckBox
        Tag = 99
        Left = 377
        Top = 190
        Width = 62
        Height = 26
        TabOrder = 14
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = '0 '#50896
        ReturnIsTab = False
        Version = '1.8.0.3'
      end
      object ConditionBadgeComboBox: TcxComboBox
        Tag = 99
        Left = 664
        Top = 134
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          ''
          'ONE VAN'
          'TWO VAN')
        Style.StyleController = EditStyleController
        TabOrder = 15
        Visible = False
        Width = 78
      end
    end
  end
  object MenuInfoPanel: TAdvPanel [8]
    Left = 760
    Top = 575
    Width = 290
    Height = 314
    Color = clWhite
    TabOrder = 6
    UseDockManager = True
    Visible = False
    Version = '2.5.11.0'
    BorderColor = clBlack
    BorderWidth = 1
    CanMove = True
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.CloseButton = True
    Caption.Font.Charset = HANGEUL_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -13
    Caption.Font.Name = #47569#51008' '#44256#46357
    Caption.Font.Style = []
    Caption.Height = 30
    Caption.Indent = 0
    Caption.Text = '<FONT color="#FFFFFF">'#47700#45684#49444#47749'('#47131#52768#50724#45908', KIOSK)</FONT>'
    Caption.TopIndent = 5
    Caption.Visible = True
    DoubleBuffered = True
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    DesignSize = (
      290
      314)
    FullHeight = 310
    object MenuInfoMemo: TcxMemo
      Left = 7
      Top = 35
      Anchors = [akLeft, akTop, akRight, akBottom]
      Style.BorderStyle = ebsNone
      TabOrder = 0
      Height = 207
      Width = 274
    end
    object MenuInfoOKButton: TAdvGlowButton
      Left = 46
      Top = 265
      Width = 93
      Height = 34
      Anchors = [akRight, akBottom]
      Caption = #54869#51064
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      FocusType = ftHot
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Picture.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000021349444154388DD5913D
        6B145114869F3B3B9BAC3161454888895A286BB0B3892036167682586867656F
        E94FB0B6100591D462114867A9828220B60605DD90042309484C82FB31F79CD7
        627676D7EC6A2CF5C2853B0CE739EF07FCEB27148FF9E79BD3EE23371B8DF6C9
        76C36A3766989D192B55907037DC84B9E3EEB8199FF66CE575ACDE7B7F75EA59
        3F302D1E66E92DE177E581AC252E4D96393F358A24CC1C33E3E19B3A1BBB4DEE
        5C38C1D25AACBDFACEE5B34B9BB797AF4D3D283849172D8D48808A0546162359
        8C448B4433DEAE6FF3B2FE0D77C72424824BF76B8B5B5706804E0E531F306691
        1823311A66863A3FCD1CB9E7DF2204E2FC80651C54C8039A9991C580A4DCB63B
        E7A6C739365E269A91B97704A8A3663F905C5DA9144892C0A3CFCEF27693403E
        2444E5C824C7ABE2C9AAF362670CA542EA6BB61FE89D2D49090E57CB7C55CAD3
        BD22827C508522D185A1DEECAFA5144A944B95FE00530F56E43A244347049098
        4803B39504102EE19EE728A70BFFD2809DAC637958864E4FD9E2C5098E968599
        0DBDEECE56D3B9FEAE9C5BEE6BA567B96FFB413033A39AC4A12DEFCB30CFEC20
        5871BB593204E8DE2BE06F6039309FF1614070B2460B8F8383C3606686DCB146
        EB37964368B756D6F0E60F9A593C10D636C75B6DE2FA2A42ED81961369A172E6
        743988438FEB3E3737AE6959C05CB80957C02CE02A21257CD84D369291D18FE9
        A95A2329A50BFC37E727CE5A19A3548B8A270000000049454E44AE426082}
      RepeatPause = 10
      Rounded = True
      TabOrder = 1
      OnClick = MenuInfoOKButtonClick
      Appearance.BorderColor = 11382963
      Appearance.BorderColorHot = 11565130
      Appearance.BorderColorCheckedHot = 11565130
      Appearance.BorderColorDown = 11565130
      Appearance.BorderColorChecked = 13744549
      Appearance.BorderColorDisabled = 13948116
      Appearance.ColorChecked = 13744549
      Appearance.ColorCheckedTo = 13744549
      Appearance.ColorDisabled = clWhite
      Appearance.ColorDisabledTo = clNone
      Appearance.ColorDown = 11565130
      Appearance.ColorDownTo = 11565130
      Appearance.ColorHot = 16444643
      Appearance.ColorHotTo = 16444643
      Appearance.ColorMirror = clWhite
      Appearance.ColorMirrorTo = clWhite
      Appearance.ColorMirrorHot = 16444643
      Appearance.ColorMirrorHotTo = 16444643
      Appearance.ColorMirrorDown = 11565130
      Appearance.ColorMirrorDownTo = 11565130
      Appearance.ColorMirrorChecked = 13744549
      Appearance.ColorMirrorCheckedTo = 13744549
      Appearance.ColorMirrorDisabled = clWhite
      Appearance.ColorMirrorDisabledTo = clNone
      Appearance.GradientHot = ggVertical
      Appearance.GradientMirrorHot = ggVertical
      Appearance.GradientDown = ggVertical
      Appearance.GradientMirrorDown = ggVertical
      Appearance.GradientChecked = ggVertical
      Appearance.SystemFont = False
      Appearance.TextColorChecked = 3750459
      Appearance.TextColorDown = 2303013
      Appearance.TextColorHot = 2303013
      Appearance.TextColorDisabled = 13948116
    end
    object MenuInfoCloseButton: TAdvGlowButton
      Left = 152
      Top = 265
      Width = 93
      Height = 34
      Anchors = [akRight, akBottom]
      Caption = #45803#44592
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      FocusType = ftHot
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Picture.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D000000097048597300000B1300000B1301009A9C18000001CC49444154789C
        AD95CD4A025114C7C717A847A8DEA5285A953A866129B5286B9B6D035D144CA6
        8EE317946F90AD5317198423E8A8A3A1FB52FC08DD8C86859C385632EACCE490
        070E0CF7DEF3E3DE73FFFF3B04A1102B14BBA4F3668F0DFEBC13534F7347ABE7
        C94542550068749EDC9E255C666D916AF3F2510026F539482A2180EDAED2C039
        92CE5AFE642D5FA4E7B74385B823DAEA06D37D504A47ACDD3106F838D6C8C24C
        A122E74DF61441E2A4D91E9842C5CC241440833B530313438D013E3EC2D3D2B9
        7D7BACDD510B1B1E3FDAEA8EF4D472534A8D2F7AEB02343B30515C17005AEF93
        E3E670991DC05006A777D5E6F8829A00831043EB1263C19F3C89541A283302B5
        85D2903A4A4304107F4BADA512026CB8738784C1CFBB19F643B63FBF3B558205
        D37D40C6969FBF22481FEF9A15D0C0E49D04E9E1ACB33AF2269D3D20D6A9A705
        5BE4B52E759BE3809AD2A5DCBE34863E476F8E2FC022A9C29AAC6C4ADFB2C120
        BD9CD97EDFFA87B0DB1D92C9ED8C5A2F5088A18D545B2FD903A3BF18957B1C32
        6AA00833859ED36B67EC9CE48B831368F4697C8D2DC29DC9C2C4A1F771BBE6EB
        128B764239A0C630A907016C914A1D2F60B46753064A4AEBE2AC835F009377A2
        B5704CA9E80B4F45F5DB4978273F0000000049454E44AE426082}
      RepeatPause = 10
      Rounded = True
      TabOrder = 2
      OnClick = MenuInfoCloseButtonClick
      Appearance.BorderColor = 11382963
      Appearance.BorderColorHot = 11565130
      Appearance.BorderColorCheckedHot = 11565130
      Appearance.BorderColorDown = 11565130
      Appearance.BorderColorChecked = 13744549
      Appearance.BorderColorDisabled = 13948116
      Appearance.ColorChecked = 13744549
      Appearance.ColorCheckedTo = 13744549
      Appearance.ColorDisabled = clWhite
      Appearance.ColorDisabledTo = clNone
      Appearance.ColorDown = 11565130
      Appearance.ColorDownTo = 11565130
      Appearance.ColorHot = 16444643
      Appearance.ColorHotTo = 16444643
      Appearance.ColorMirror = clWhite
      Appearance.ColorMirrorTo = clWhite
      Appearance.ColorMirrorHot = 16444643
      Appearance.ColorMirrorHotTo = 16444643
      Appearance.ColorMirrorDown = 11565130
      Appearance.ColorMirrorDownTo = 11565130
      Appearance.ColorMirrorChecked = 13744549
      Appearance.ColorMirrorCheckedTo = 13744549
      Appearance.ColorMirrorDisabled = clWhite
      Appearance.ColorMirrorDisabledTo = clNone
      Appearance.GradientHot = ggVertical
      Appearance.GradientMirrorHot = ggVertical
      Appearance.GradientDown = ggVertical
      Appearance.GradientMirrorDown = ggVertical
      Appearance.GradientChecked = ggVertical
      Appearance.SystemFont = False
      Appearance.TextColorChecked = 3750459
      Appearance.TextColorDown = 2303013
      Appearance.TextColorHot = 2303013
      Appearance.TextColorDisabled = 13948116
    end
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited AdvOfficePagerOfficeStyler: TAdvOfficePagerOfficeStyler
    Left = 192
    Top = 96
  end
  inherited AdvPanelStyler: TAdvPanelStyler
    Left = 216
    Top = 176
  end
  object PLUDeletePopupMenu: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = PLUDeletePopupMenuPopup
    Left = 950
    Top = 53
    object PluMenuDeleteMenuItem: TMenuItem
      Caption = #49325' '#51228
      OnClick = PluMenuDeleteMenuItemClick
    end
  end
  object PictureLoadDialog: TOpenPictureDialog
    Filter = #44536#47548' '#54028#51068'(*.png)|*.png'
    Left = 1011
    Top = 176
  end
  object ColorPopupMenu: TPopupMenu
    AutoHotkeys = maManual
    Left = 1006
    Top = 117
    object ColorChangeMenuItem: TMenuItem
      Caption = #49353#49345#48148#44984#44592
      OnClick = ColorChangeMenuItemClick
    end
    object ColorCopyMenuItem: TMenuItem
      Caption = #49353#49345#48373#49324
      OnClick = ColorCopyMenuItemClick
    end
    object ColorPasteMenuItem: TMenuItem
      Caption = #49353#49345#48537#50668#45347#44592
      OnClick = ColorPasteMenuItemClick
    end
    object DeleteMenuItem: TMenuItem
      Caption = #48260#53948' '#49325#51228
      OnClick = DeleteMenuItemClick
    end
    object EmptyMenuItem: TMenuItem
      Caption = #48712#48260#53948' '#52628#44032'('#48260#53948#46244#47196' '#48128#47728')'
      OnClick = EmptyMenuItemClick
    end
    object Delete2MenuItem: TMenuItem
      Caption = #48260#53948#49325#51228'('#46244#50640#48260#53948' '#45817#44592#47728')'
      OnClick = Delete2MenuItemClick
    end
  end
  object ColorDialog: TColorDialog
    Left = 1011
    Top = 298
  end
end
