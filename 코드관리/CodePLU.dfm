inherited CodePLUForm: TCodePLUForm
  Caption = 'PLU '#44288#47532
  ClientHeight = 760
  ClientWidth = 1004
  ExplicitWidth = 1020
  ExplicitHeight = 799
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Height = 695
    ExplicitHeight = 593
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1004
    ExplicitWidth = 1004
    inherited ButtonToolBar: TAdvToolBar
      Left = 472
      ExplicitLeft = 472
      inherited ButtonToolBarNewButton: TAdvGlowButton
        Visible = False
      end
      inherited ButtonToolBarCancelButton: TAdvGlowButton
        Visible = False
      end
    end
    inherited ConditionToolBar: TAdvToolBar
      Width = 690
      ExplicitWidth = 690
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        Left = 686
        ExplicitLeft = 686
        ExplicitWidth = 0
        Width = 0
      end
      inherited ConditionToolBarDateLabel: TcxLabel
        Caption = #44396#48516
        Visible = True
        ExplicitWidth = 39
        Width = 39
        AnchorX = 22
        AnchorY = 16
      end
      inherited ConditionToolBarToDateEdit: TcxDateEdit
        Left = 686
        ExplicitLeft = 686
        ExplicitWidth = 0
        Width = 0
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        Left = 686
        ExplicitLeft = 686
        ExplicitWidth = 0
        Width = 0
        AnchorX = 686
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        Left = 95
        Caption = #47700#45684#48516#47448
        ExplicitLeft = 95
        AnchorX = 128
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Left = 160
        ExplicitLeft = 160
        ExplicitWidth = 140
        Width = 140
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 686
        ExplicitLeft = 686
        ExplicitWidth = 0
        Width = 0
      end
      object ConditionTollBarAutoSelectCheckBox: TcxCheckBox
        Left = 423
        Top = 2
        Caption = #51088#46041#49440#53469
        ParentFont = False
        Style.StyleController = EditStyleController
        TabOrder = 7
      end
      object ContitionToolBarMenuCheckBox: TcxCheckBox
        Left = 300
        Top = 2
        Caption = ' '#46321#47197#46108' '#47700#45684#54252#54632
        ParentFont = False
        Style.StyleController = EditStyleController
        TabOrder = 8
      end
      object ConditonPLUComboBox: TcxComboBox
        Left = 41
        Top = 2
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '01'
          '02'
          '03'
          '04'
          '05'
          '06'
          '07'
          '08'
          '09'
          '10')
        Properties.OnChange = ConditonPLUComboBoxPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 9
        Text = '01'
        Width = 54
      end
      object SelectMenuNameLabel: TcxLabel
        Left = 677
        Top = 2
        Cursor = crHandPoint
        ParentFont = False
        Style.Font.Charset = HANGEUL_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = #47569#51008' '#44256#46357
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taBottomJustify
        Transparent = True
        OnClick = SelectMenuNameLabelClick
        AnchorY = 26
      end
      object ConditionAutoButton: TAdvGlowButton
        Left = 580
        Top = 2
        Width = 97
        Height = 26
        Caption = #51088#46041#46321#47197
        FocusType = ftHot
        NotesFont.Charset = DEFAULT_CHARSET
        NotesFont.Color = clWindowText
        NotesFont.Height = -11
        NotesFont.Name = 'Tahoma'
        NotesFont.Style = []
        Rounded = True
        TabOrder = 11
        OnClick = ConditionAutoButtonClick
        Appearance.BorderColor = 14727579
        Appearance.BorderColorHot = 10079963
        Appearance.BorderColorDown = 4548219
        Appearance.BorderColorChecked = 4548219
        Appearance.Color = 15653832
        Appearance.ColorTo = 16178633
        Appearance.ColorChecked = 11918331
        Appearance.ColorCheckedTo = 7915518
        Appearance.ColorDisabled = clNone
        Appearance.ColorDisabledTo = clNone
        Appearance.ColorDown = 7778289
        Appearance.ColorDownTo = 4296947
        Appearance.ColorHot = 15465983
        Appearance.ColorHotTo = 11332863
        Appearance.ColorMirror = 15586496
        Appearance.ColorMirrorTo = 16245200
        Appearance.ColorMirrorHot = 5888767
        Appearance.ColorMirrorHotTo = 10807807
        Appearance.ColorMirrorDown = 946929
        Appearance.ColorMirrorDownTo = 5021693
        Appearance.ColorMirrorChecked = 10480637
        Appearance.ColorMirrorCheckedTo = 5682430
        Appearance.ColorMirrorDisabled = clNone
        Appearance.ColorMirrorDisabledTo = clNone
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
        Appearance.SystemFont = False
        DropDownButton = True
      end
      object ConditionPackingCheckBox: TcxCheckBox
        Left = 497
        Top = 2
        Caption = #54252#51109#51060#48120#51648
        ParentFont = False
        Properties.OnChange = ConditionPackingCheckBoxPropertiesChange
        Style.StyleController = EditStyleController
        Style.TransparentBorder = False
        TabOrder = 12
        Visible = False
      end
    end
  end
  inherited GridPanel: TPanel
    Height = 695
    ExplicitHeight = 695
    inherited Grid: TcxGrid
      Top = 68
      Height = 624
      ExplicitTop = 68
      ExplicitHeight = 624
      inherited GridTableView: TcxGridTableView
        OnCellClick = GridTableViewCellClick
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '#,0'#44148
            Kind = skCount
            Column = GridTableViewMenuName
          end>
        OptionsView.Footer = True
        object GridTableViewMenuCode: TcxGridColumn
          Caption = #47700#45684#53076#46300
          DataBinding.FieldName = 'CD_MENU'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 82
        end
        object GridTableViewMenuName: TcxGridColumn
          Caption = #47700#45684#47749
          DataBinding.FieldName = 'NM_MENU'
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 160
        end
        object GridTableViewSalePrice: TcxGridColumn
          Tag = 99
          Caption = #54032#47588#45800#44032
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'PR_SALE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Visible = False
          HeaderAlignmentHorz = taCenter
        end
        object GridTableViewKitchen: TcxGridColumn
          Tag = 99
          Caption = #51452#48169
          DataBinding.FieldName = 'CD_PRINTER'
          Visible = False
        end
        object GridTableViewClassCode: TcxGridColumn
          Tag = 99
          Caption = #48516#47448#53076#46300
          DataBinding.FieldName = 'CD_CLASS'
          Visible = False
        end
        object GridTableViewShortName: TcxGridColumn
          Tag = 99
          DataBinding.FieldName = 'NM_MENU_SHORT'
          Visible = False
        end
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 250
      Height = 65
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object Label7: TLabel
        Left = 12
        Top = 12
        Width = 41
        Height = 17
        Caption = #48516'   '#47448
      end
      object Label8: TLabel
        Left = 12
        Top = 41
        Width = 39
        Height = 17
        Caption = #44160#49353#50612
      end
      object ClassComboBox: TcxComboBox
        Tag = 99
        Left = 69
        Top = 8
        AutoSize = False
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.OnChange = ClassComboBoxPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 0
        Height = 25
        Width = 173
      end
      object SearchConditionEdit: TcxTextEdit
        Left = 69
        Top = 37
        ParentFont = False
        Properties.ImeMode = imSHanguel
        Properties.MaxLength = 38
        Style.StyleController = EditStyleController
        TabOrder = 1
        OnKeyPress = SearchConditionEditKeyPress
        Width = 173
      end
    end
  end
  inherited MainPanel: TPanel
    Width = 748
    Height = 695
    ExplicitWidth = 748
    ExplicitHeight = 695
    object PluPageControl: TcxPageControl
      Left = 0
      Top = 0
      Width = 748
      Height = 695
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = PluTab
      Properties.CustomButtons.Buttons = <>
      Properties.HideTabs = True
      Properties.Style = 8
      ClientRectBottom = 695
      ClientRectRight = 748
      ClientRectTop = 0
      object PluTab: TcxTabSheet
        Caption = '   PLU   '
        ImageIndex = 0
        OnShow = PluTabShow
        object ClassHeaderPanel: TPanel
          Left = 3
          Top = 5
          Width = 734
          Height = 41
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Ctl3D = False
          ParentColor = True
          ParentCtl3D = False
          TabOrder = 0
          DesignSize = (
            732
            39)
          object Label1: TLabel
            Left = 12
            Top = 10
            Width = 44
            Height = 17
            Caption = #9654' '#48516#47448
          end
          object Label2: TLabel
            Left = 163
            Top = 11
            Width = 39
            Height = 17
            Caption = #48516#47448#47749
          end
          object Label6: TLabel
            Left = 658
            Top = 11
            Width = 29
            Height = 17
            Anchors = [akTop, akRight]
            Caption = 'Page'
            ExplicitLeft = 700
          end
          object ClassNameEdit: TcxTextEdit
            Tag = 99
            Left = 210
            Top = 7
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Properties.ImeMode = imSHanguel
            Properties.MaxLength = 50
            Properties.OnChange = ClassNameEditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 1
            OnKeyPress = MenuNameEditKeyPress
            Width = 360
          end
          object ClassPageEdit: TcxCurrencyEdit
            Tag = 99
            Left = 623
            Top = 7
            Anchors = [akTop, akRight]
            EditValue = 1
            Enabled = False
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.DisplayFormat = ',0'
            Properties.EditFormat = ',#'
            Properties.ImeMode = imSAlpha
            Properties.MinValue = 1.000000000000000000
            Properties.UseLeftAlignmentOnEditing = False
            Style.StyleController = EditStyleController
            TabOrder = 0
            Width = 31
          end
          object ClassMoveButton: TAdvGlowButton
            Left = 65
            Top = 4
            Width = 88
            Height = 30
            Caption = #50948#52824#51060#46041
            FocusType = ftHot
            NotesFont.Charset = DEFAULT_CHARSET
            NotesFont.Color = clWindowText
            NotesFont.Height = -11
            NotesFont.Name = 'Tahoma'
            NotesFont.Style = []
            Picture.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              6100000006624B474400FF00FF00FFA0BDA7930000013A49444154388DCD52B1
              4A0351109C7D858AF12216368298BBF80756D636014B89515B2D2E97426C440B
              218D82D809793101B510AC6261ED0758F90926FA05E2DD99F28D4D72BCDC05DB
              38D5B23BBB3BB32C3069C8307075C441181AC5D2A79F7FB58945FDB366605E00
              2C00402F7004005476A679483703C07B907B13483B9DB70784547209A8C0D3E1
              699A58D0914FF058881680AFCC00A358FAF0E74E483922E4DCD5517958F39AD1
              96009A40BD5B737CA3B899556EC1D55179A9C5D964FB3D67BC46BCFB67D33F42
              9DCAD3DF231E57AF395D68463BE3E8C911576EC27590E22DC69A509D62A3BF3C
              AC99A9FE86108F6E333A4BB803588F14C7023C13AC88A0D2AD3A4FF626B711EE
              43A40DF00E90ED5EE0CC8F28009823B867888B743300F46AF95B8257801C00C8
              672C2409C1A12DD1B62890EAB83B4C16BF0A6971FDCB1C876C0000000049454E
              44AE426082}
            Rounded = True
            TabOrder = 2
            OnClick = ClassMoveButtonClick
            Appearance.BorderColor = 14727579
            Appearance.BorderColorHot = 10079963
            Appearance.BorderColorDown = 4548219
            Appearance.BorderColorChecked = 4548219
            Appearance.Color = 15653832
            Appearance.ColorTo = 16178633
            Appearance.ColorChecked = 11918331
            Appearance.ColorCheckedTo = 7915518
            Appearance.ColorDisabled = clNone
            Appearance.ColorDisabledTo = clNone
            Appearance.ColorDown = 7778289
            Appearance.ColorDownTo = 4296947
            Appearance.ColorHot = 15465983
            Appearance.ColorHotTo = 11332863
            Appearance.ColorMirror = 15586496
            Appearance.ColorMirrorTo = 16245200
            Appearance.ColorMirrorHot = 5888767
            Appearance.ColorMirrorHotTo = 10807807
            Appearance.ColorMirrorDown = 946929
            Appearance.ColorMirrorDownTo = 5021693
            Appearance.ColorMirrorChecked = 10480637
            Appearance.ColorMirrorCheckedTo = 5682430
            Appearance.ColorMirrorDisabled = clNone
            Appearance.ColorMirrorDisabledTo = clNone
            Appearance.GradientHot = ggVertical
            Appearance.GradientMirrorHot = ggVertical
            Appearance.GradientDown = ggVertical
            Appearance.GradientMirrorDown = ggVertical
            Appearance.GradientChecked = ggVertical
            Appearance.SystemFont = False
            Enabled = False
          end
          object ClassLineFeedButton: TAdvGlowButton
            Left = 572
            Top = 4
            Width = 49
            Height = 30
            Anchors = [akTop, akRight]
            Caption = #51460#48148#45000
            FocusType = ftHot
            NotesFont.Charset = DEFAULT_CHARSET
            NotesFont.Color = clWindowText
            NotesFont.Height = -11
            NotesFont.Name = 'Tahoma'
            NotesFont.Style = []
            Rounded = True
            TabOrder = 3
            OnClick = ClassLineFeedButtonClick
            Appearance.BorderColor = 14727579
            Appearance.BorderColorHot = 10079963
            Appearance.BorderColorDown = 4548219
            Appearance.BorderColorChecked = 4548219
            Appearance.Color = 15653832
            Appearance.ColorTo = 16178633
            Appearance.ColorChecked = 11918331
            Appearance.ColorCheckedTo = 7915518
            Appearance.ColorDisabled = clNone
            Appearance.ColorDisabledTo = clNone
            Appearance.ColorDown = 7778289
            Appearance.ColorDownTo = 4296947
            Appearance.ColorHot = 15465983
            Appearance.ColorHotTo = 11332863
            Appearance.ColorMirror = 15586496
            Appearance.ColorMirrorTo = 16245200
            Appearance.ColorMirrorHot = 5888767
            Appearance.ColorMirrorHotTo = 10807807
            Appearance.ColorMirrorDown = 946929
            Appearance.ColorMirrorDownTo = 5021693
            Appearance.ColorMirrorChecked = 10480637
            Appearance.ColorMirrorCheckedTo = 5682430
            Appearance.ColorMirrorDisabled = clNone
            Appearance.ColorMirrorDisabledTo = clNone
            Appearance.GradientHot = ggVertical
            Appearance.GradientMirrorHot = ggVertical
            Appearance.GradientDown = ggVertical
            Appearance.GradientMirrorDown = ggVertical
            Appearance.GradientChecked = ggVertical
            Appearance.SystemFont = False
          end
        end
        object ClassPanel: TPanel
          Left = 3
          Top = 49
          Width = 734
          Height = 155
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Color = clWhite
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 1
          OnClick = ClassPanelClick
        end
        object MenuHeaderPanel: TPanel
          Left = 3
          Top = 210
          Width = 734
          Height = 43
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Ctl3D = False
          ParentColor = True
          ParentCtl3D = False
          TabOrder = 2
          DesignSize = (
            732
            41)
          object Label4: TLabel
            Left = 12
            Top = 13
            Width = 39
            Height = 17
            Caption = #47700#45684#47749
          end
          object Label5: TLabel
            Left = 656
            Top = 13
            Width = 29
            Height = 17
            Anchors = [akTop, akRight]
            Caption = 'Page'
            ExplicitLeft = 698
          end
          object MenuNameEdit: TcxTextEdit
            Left = 57
            Top = 9
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Properties.ImeMode = imSHanguel
            Properties.MaxLength = 50
            Properties.OnChange = ClassNameEditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 0
            OnKeyPress = MenuNameEditKeyPress
            Width = 511
          end
          object MenuPageEdit: TcxCurrencyEdit
            Tag = 99
            Left = 621
            Top = 9
            Anchors = [akTop, akRight]
            EditValue = 1
            Enabled = False
            ParentFont = False
            Properties.Alignment.Horz = taCenter
            Properties.DisplayFormat = ',0'
            Properties.EditFormat = ',#'
            Properties.ImeMode = imSAlpha
            Properties.MinValue = 1.000000000000000000
            Properties.UseLeftAlignmentOnEditing = False
            Style.StyleController = EditStyleController
            TabOrder = 1
            Width = 31
          end
          object LineFeedButton: TAdvGlowButton
            Left = 570
            Top = 6
            Width = 49
            Height = 30
            Anchors = [akTop, akRight]
            Caption = #51460#48148#45000
            FocusType = ftHot
            NotesFont.Charset = DEFAULT_CHARSET
            NotesFont.Color = clWindowText
            NotesFont.Height = -11
            NotesFont.Name = 'Tahoma'
            NotesFont.Style = []
            Rounded = True
            TabOrder = 2
            OnClick = LineFeedButtonClick
            Appearance.BorderColor = 14727579
            Appearance.BorderColorHot = 10079963
            Appearance.BorderColorDown = 4548219
            Appearance.BorderColorChecked = 4548219
            Appearance.Color = 15653832
            Appearance.ColorTo = 16178633
            Appearance.ColorChecked = 11918331
            Appearance.ColorCheckedTo = 7915518
            Appearance.ColorDisabled = clNone
            Appearance.ColorDisabledTo = clNone
            Appearance.ColorDown = 7778289
            Appearance.ColorDownTo = 4296947
            Appearance.ColorHot = 15465983
            Appearance.ColorHotTo = 11332863
            Appearance.ColorMirror = 15586496
            Appearance.ColorMirrorTo = 16245200
            Appearance.ColorMirrorHot = 5888767
            Appearance.ColorMirrorHotTo = 10807807
            Appearance.ColorMirrorDown = 946929
            Appearance.ColorMirrorDownTo = 5021693
            Appearance.ColorMirrorChecked = 10480637
            Appearance.ColorMirrorCheckedTo = 5682430
            Appearance.ColorMirrorDisabled = clNone
            Appearance.ColorMirrorDisabledTo = clNone
            Appearance.GradientHot = ggVertical
            Appearance.GradientMirrorHot = ggVertical
            Appearance.GradientDown = ggVertical
            Appearance.GradientMirrorDown = ggVertical
            Appearance.GradientChecked = ggVertical
            Appearance.SystemFont = False
          end
        end
        object MenuPanel: TPanel
          Left = 6
          Top = 259
          Width = 732
          Height = 427
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Color = clWhite
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 3
          OnClick = MenuPanelClick
        end
      end
      object KioskTab: TcxTabSheet
        Caption = '  '#51060#48120#51648'  '
        Color = clWhite
        ImageIndex = 1
        ParentColor = False
        OnShow = KioskTabShow
        object KioskPanel: TAdvScrollBox
          Left = 0
          Top = 0
          Width = 748
          Height = 695
          Align = alClient
          DoubleBuffered = True
          Color = clWhite
          Ctl3D = False
          ParentColor = False
          ParentCtl3D = False
          ParentDoubleBuffered = False
          TabOrder = 0
          object KioskPLUMenuPanel: TAdvScrollBox
            Left = 5
            Top = 98
            Width = 400
            Height = 225
            DoubleBuffered = True
            Ctl3D = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            TabOrder = 0
          end
          object KioskPLUClassPanel: TAdvPanel
            Left = 5
            Top = 22
            Width = 85
            Height = 70
            Hint = #12298'('#48516#47448')'
            Color = clWhite
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #47569#51008' '#44256#46357
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            TabStop = True
            UseDockManager = True
            Version = '2.5.11.0'
            BorderColor = clBlack
            Caption.Color = clHighlight
            Caption.ColorTo = clGradientActiveCaption
            Caption.Font.Charset = HANGEUL_CHARSET
            Caption.Font.Color = clBlack
            Caption.Font.Height = -27
            Caption.Font.Name = #47569#51008' '#44256#46357
            Caption.Font.Style = [fsBold]
            Caption.Height = 25
            Caption.Indent = 0
            Caption.Text = #51452#47928#47700#45684'<P align="center"></P>'
            ColorTo = clWhite
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
            TextVAlign = tvaCenter
            URLColor = 15395562
            FullHeight = 34
          end
          object KioskClassPriorButton: TAdvSmoothToggleButton
            Left = 117
            Top = 11
            Width = 73
            Height = 81
            Cursor = crHandPoint
            Color = clWhite
            ColorDisabled = clWhite
            ColorDown = clWhite
            BorderColor = 6974058
            BorderInnerColor = clWhite
            BevelWidth = 1
            BevelColorDisabled = clWhite
            AutoToggle = False
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -20
            Appearance.Font.Name = #47569#51008' '#44256#46357
            Appearance.Font.Style = [fsBold]
            Appearance.Spacing = 1
            Appearance.ShiftDown = 0
            Appearance.SimpleLayout = True
            Appearance.Rounding = 20
            VerticalSpacing = 0
            HorizontalSpacing = 0
            Caption = #12296
            Version = '1.7.2.2'
            Status.Caption = '0'
            Status.Appearance.Fill.Color = clRed
            Status.Appearance.Fill.ColorMirror = clNone
            Status.Appearance.Fill.ColorMirrorTo = clNone
            Status.Appearance.Fill.GradientType = gtSolid
            Status.Appearance.Fill.GradientMirrorType = gtSolid
            Status.Appearance.Fill.BorderColor = clGray
            Status.Appearance.Fill.Rounding = 0
            Status.Appearance.Fill.ShadowOffset = 0
            Status.Appearance.Fill.Glow = gmNone
            Status.Appearance.Font.Charset = DEFAULT_CHARSET
            Status.Appearance.Font.Color = clWhite
            Status.Appearance.Font.Height = -11
            Status.Appearance.Font.Name = 'Tahoma'
            Status.Appearance.Font.Style = []
            ShowFocus = False
            ParentFont = False
            TabOrder = 2
            OnClick = KioskClassPriorButtonClick
            TMSStyle = 0
          end
          object KioskClassNextButton: TAdvSmoothToggleButton
            Left = 228
            Top = 11
            Width = 73
            Height = 81
            Cursor = crHandPoint
            Color = clWhite
            ColorDisabled = clWhite
            ColorDown = clWhite
            BorderColor = 6974058
            BorderInnerColor = clWhite
            BevelWidth = 1
            BevelColorDisabled = clWhite
            AutoToggle = False
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -20
            Appearance.Font.Name = #47569#51008' '#44256#46357
            Appearance.Font.Style = [fsBold]
            Appearance.Spacing = 1
            Appearance.ShiftDown = 0
            Appearance.SimpleLayout = True
            Appearance.Rounding = 20
            VerticalSpacing = 0
            HorizontalSpacing = 0
            Caption = #12297
            Version = '1.7.2.2'
            Status.Caption = '0'
            Status.Appearance.Fill.Color = clRed
            Status.Appearance.Fill.ColorMirror = clNone
            Status.Appearance.Fill.ColorMirrorTo = clNone
            Status.Appearance.Fill.GradientType = gtSolid
            Status.Appearance.Fill.GradientMirrorType = gtSolid
            Status.Appearance.Fill.BorderColor = clGray
            Status.Appearance.Fill.Rounding = 0
            Status.Appearance.Fill.ShadowOffset = 0
            Status.Appearance.Fill.Glow = gmNone
            Status.Appearance.Font.Charset = DEFAULT_CHARSET
            Status.Appearance.Font.Color = clWhite
            Status.Appearance.Font.Height = -11
            Status.Appearance.Font.Name = 'Tahoma'
            Status.Appearance.Font.Style = []
            ShowFocus = False
            ParentFont = False
            TabOrder = 3
            OnClick = KioskClassPriorButtonClick
            TMSStyle = 0
          end
          object KioskMenuNextButton: TAdvSmoothToggleButton
            Left = 157
            Top = 561
            Width = 73
            Height = 72
            Cursor = crHandPoint
            FontColorDisabled = clBlack
            Color = clWhite
            ColorDisabled = clWhite
            ColorDown = clWhite
            BorderColor = 6974058
            BorderInnerColor = clWhite
            BevelWidth = 1
            BevelColorDisabled = clWhite
            AutoToggle = False
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -20
            Appearance.Font.Name = #47569#51008' '#44256#46357
            Appearance.Font.Style = [fsBold]
            Appearance.Spacing = 1
            Appearance.ShiftDown = 0
            Appearance.SimpleLayout = True
            Appearance.Rounding = 20
            VerticalSpacing = 0
            HorizontalSpacing = 0
            Caption = #12297
            Version = '1.7.2.2'
            Status.Caption = '0'
            Status.Appearance.Fill.Color = clRed
            Status.Appearance.Fill.ColorMirror = clNone
            Status.Appearance.Fill.ColorMirrorTo = clNone
            Status.Appearance.Fill.GradientType = gtSolid
            Status.Appearance.Fill.GradientMirrorType = gtSolid
            Status.Appearance.Fill.BorderColor = clGray
            Status.Appearance.Fill.Rounding = 0
            Status.Appearance.Fill.ShadowOffset = 0
            Status.Appearance.Fill.Glow = gmNone
            Status.Appearance.Font.Charset = DEFAULT_CHARSET
            Status.Appearance.Font.Color = clWhite
            Status.Appearance.Font.Height = -11
            Status.Appearance.Font.Name = 'Tahoma'
            Status.Appearance.Font.Style = []
            ShowFocus = False
            ParentFont = False
            TabOrder = 4
            OnClick = KioskClassPriorButtonClick
            TMSStyle = 0
          end
          object KioskMenuPriorButton: TAdvSmoothToggleButton
            Left = 60
            Top = 561
            Width = 73
            Height = 72
            Cursor = crHandPoint
            FontColorDisabled = clBlack
            Color = clWhite
            ColorDisabled = clWhite
            ColorDown = clWhite
            BorderColor = 6974058
            BorderInnerColor = clWhite
            BevelWidth = 1
            BevelColorDisabled = clWhite
            AutoToggle = False
            Appearance.Font.Charset = DEFAULT_CHARSET
            Appearance.Font.Color = clWindowText
            Appearance.Font.Height = -20
            Appearance.Font.Name = #47569#51008' '#44256#46357
            Appearance.Font.Style = [fsBold]
            Appearance.Spacing = 1
            Appearance.ShiftDown = 0
            Appearance.SimpleLayout = True
            Appearance.Rounding = 20
            VerticalSpacing = 0
            HorizontalSpacing = 0
            Caption = #12296
            Version = '1.7.2.2'
            Status.Caption = '0'
            Status.Appearance.Fill.Color = clRed
            Status.Appearance.Fill.ColorMirror = clNone
            Status.Appearance.Fill.ColorMirrorTo = clNone
            Status.Appearance.Fill.GradientType = gtSolid
            Status.Appearance.Fill.GradientMirrorType = gtSolid
            Status.Appearance.Fill.BorderColor = clGray
            Status.Appearance.Fill.Rounding = 0
            Status.Appearance.Fill.ShadowOffset = 0
            Status.Appearance.Fill.Glow = gmNone
            Status.Appearance.Font.Charset = DEFAULT_CHARSET
            Status.Appearance.Font.Color = clWhite
            Status.Appearance.Font.Height = -11
            Status.Appearance.Font.Name = 'Tahoma'
            Status.Appearance.Font.Style = []
            ShowFocus = False
            ParentFont = False
            TabOrder = 5
            OnClick = KioskClassPriorButtonClick
            TMSStyle = 0
          end
        end
      end
    end
  end
  inherited EditStyleController: TcxEditStyleController
    Top = 178
    PixelsPerInch = 96
  end
  inherited ToolBarStyler: TAdvToolBarOfficeStyler
    Left = 80
    Top = 178
  end
  inherited StyleRepository: TcxStyleRepository
    Left = 11
    Top = 178
    PixelsPerInch = 96
  end
  inherited Exec_Timer: TTimer
    Left = 191
    Top = 178
  end
  inherited Query: TdxMemData
    Left = 118
    Top = 178
  end
  object ColorPopupMenu: TPopupMenu
    AutoHotkeys = maManual
    Images = ImageList
    OnPopup = ColorPopupMenuPopup
    Left = 254
    Top = 173
    object ColorChangeMenuItem: TMenuItem
      Caption = #49353#49345#48148#44984#44592
      ImageIndex = 2
      OnClick = ColorChangeMenuItemClick
    end
    object ColorCopyMenuItem: TMenuItem
      Caption = #49353#49345#48373#49324
      ImageIndex = 0
      OnClick = ColorCopyMenuItemClick
    end
    object ColorPasteMenuItem: TMenuItem
      Caption = #49353#49345#48537#50668#45347#44592
      ImageIndex = 1
      OnClick = ColorPasteMenuItemClick
    end
    object DeleteMenuItem: TMenuItem
      Caption = #48260#53948' '#49325#51228
      ImageIndex = 3
      OnClick = DeleteMenuItemClick
    end
    object EmptyMenuItem: TMenuItem
      Caption = #48712#48260#53948' '#52628#44032'('#48260#53948#46244#47196' '#48128#47728')'
      ImageIndex = 5
      OnClick = EmptyMenuItemClick
    end
    object Delete2MenuItem: TMenuItem
      Caption = #48260#53948#49325#51228'('#46244#50640#48260#53948' '#45817#44592#47728')'
      ImageIndex = 4
      OnClick = Delete2MenuItemClick
    end
  end
  object Query1: TUniQuery
    ReadOnly = True
    UniDirectional = True
    Left = 22
    Top = 34
  end
  object Query2: TUniQuery
    ReadOnly = True
    UniDirectional = True
    Left = 70
    Top = 34
  end
  object ColorDialog: TColorDialog
    Left = 227
    Top = 234
  end
  object PictureLoadDialog: TOpenPictureDialog
    Filter = 
      #44536#47548' '#54028#51068'(*.png;*.jpg)|*.png;*.jpg|'#44536#47548' '#54028#51068'(*.png)|*.png|'#44536#47548' '#54028#51068'(*.jpg)|*' +
      '.jpg'
    Left = 290
    Top = 240
  end
  object ImageCollection: TcxImageCollection
    Left = 344
    Top = 257
    object ImageCollectionItem3: TcxImageCollectionItem
      Picture.Data = {
        0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000064
        00000064080600000070E295540000000467414D410000B18F0BFC6105000000
        097048597300000B1300000B1301009A9C1800000C9949444154785EED5D09B0
        1C5515FDEEE26EB98B5AE2BEA018548CA2460A945849FECC7BE344A88A04307E
        5CB090C585A004950411A48882604181C8A2206030310A185414211A65899098
        600C491049C544CCF2B790F19CDBA7DB9EEDCF74FF5449A6DFA97A35FDCE7BEF
        CEF4B9DDFDF69EBE8080808080808080808080808080808080C71C869CEB1F71
        EE8B9982F727EE28955E2E139950AB569F3052A9BC6BB852397CB85CFEC4A873
        936BCEBD44C9C5C6B073FB0F7BBF0B02D7B20694BD4566BA021CB117CACD8143
        37B4B0B513BF6321D2262A7B3101312E3141BC3F0F627C4FC78BF03980CFA512
        EB74C5871036F3187957306DA85A7D934C8D09DC0D13E232B0378CCFEB10E620
        1C079BF391B65A6974CC5CDE452A5A1CF08A85008F40802DB5A9539F86E3AA89
        E2FDD7988EE32B181F2997DFCE38D2B721BE4E69C75A5EE7CE607C2C0C974A6F
        E377982DD8AC4D9BF6222525A8CD99F3F821EF2BB0B7D1F2397771ADAFEF714A
        2E0670F287C527AF78D70EA995CBCF43BE51947D8062926B0538FDC5C8F7B0D9
        C1DD20BA2DB6F7F7BF143657323FBEEF34D1C5004EFC073CF1D172792AE3591C
        42207E8BE5AF54DE2AAA0948E7A3A9AB3B29C660A9F44A3A11654610F613DDFB
        8043D6E2C4B7D766CE7C2AE338F94C0EC1F17196EEDC6745D501ADA70F5ABAF7
        CB6B03034F12DD15E0E4192C8BEFFC95A8DE06AF429DF0ADA2B23BA4527987A5
        7BFF635175809D854C67B35654D760FD81EFFB23CBE3B3F7EF129CE41176B2DE
        9F252AB343503F3C19DC20F23F2C2AC1F66A756FA43D8ABB6775DECA19E58FD2
        EF395F54EF02277BA69D2C9C202AB343087077300F3A762F1465481E3968C28A
        CA8C5A7FFF33519E0D8715A27A1738C96B25F601A272390476AC61803CEF1665
        006F7D1A34183E2C2A176063197ECFAE564DE59E02C4BD8D820D7AFF2A51B91C
        026E1EF30C95CB5E94013696901FEF90081C7BB1FD864AE53DA27A1338D1BB4D
        303C1644E57208E25FB232A8934419C0DD439EF58CA85C80DD3368070E2F89EA
        4DC0212BED5190AA70472B950FF1E4114E641CE9E7333E58ADBE86711C3F88B0
        9CC73160E77356C6B9634419105F0B310715CD0DD83E99F61B1DDE73C0492EE3
        89D666CC78BA281B851DF5FED098636F1CF1832C11600770A85A7DBDA206D838
        D504AB540E17658043FE620E9F34E989A272018E881E89CE3951BD099CE82F78
        A2F1D59F1710FD02DA81E30E116500FF6BF2DB9D7B99A85C80632FA51D3C36DF
        2BAA3701C1CEB22BCFFB8AA85C809DDB69A7B11504877FC71CE5DC1451B9001B
        77DA9D3665CA7345F52620585C819F272A33F0887B36CA0FB1BE109500FCC7CC
        BE73678BCA8CDAD4A9CF871DF643568AEA5DD4264F7E16C544F847DEE73CC48E
        7BFBF34525488D06AF1D6B34782CC0F6809C7AA6A8DE06C4FA914E38730B86AD
        3394BD8BE539A625BA0E485B60F62B95E9A2BA069D88B2F7C1A9BBF0FBF615DD
        DB80501378C270CC1A3C7E9E21BA2B24778773BF14D504F6DECD61DEFF15F6F7
        12DD155026BA3BBC5F24AA18C0495F64A2A135D3ED20201A02AF85505BE08C91
        E152E92DA25B02762F97B01788EA087402DF88FCFF81FD417CD71B441703B552
        E939106D9589860AB8D3F37EB05C7E35F2FEDD9CE8FD1744B7052BE6383F449E
        DBC9E9ECE720EF7AD9EF38C3D893B02BDEB9874C34E76E46687A667382894B76
        90F66F897BA1923A820B2150CEE6CA516E31EF002525E0100B2E8C4FF3CED0EF
        385749C5C48E6AF51510C27AEF1083F318C92C205A644F017F9FD24690363BEB
        1C07073151DE1A01661F758492FA383290BA4B87717C92928A0D0E9D4090D328
        0C44B95C741FE73A4C2C3491BB5DF6D30A6C5EC3BE0D16225C24BA8F0BEEC4AD
        6B1C9A293C869CFB8889EFDC3C51F174EA209CF480A8DC8827AE104E15155D08
        519F6595A8801810E578130CCF73510670F753348A272A1760271ABDAD548E16
        6500B79E4ECFFA28EC7940F47328182AFA69A20CE0A3C1C26A756F51B900D1BF
        4B3B5C9122CA00FBD198185A65A2020888720D85E16A435106D629E4B9485A54
        2EC0CE4F69A7B17FD1EE7B0B8F76572AEB141312758CA85C808D3BCD7EC3C840
        BB3BB3F0C015BCA1D5B39C750A05C3E7F1A27201C26F42D8A26802D83E41F6EB
        EAAE4243CDD29D10A5A9B5637B482018D2BF252A33B8A0DB44F7FE1E51096037
        9A0E48B5EE0A0F750ED9DF58222A01072225E635A232033DF4D749F49F894A80
        8B60A2D9475D252A00821C2851BE2F2A81C6A4E8ACDB4565C668A572B06C340D
        BB70AAD7D25C41D6F2760308F5518972BAA804EA1CEE80B33688CA0CDC6533CD
        E1DE7F595482A47388FE8EA800887D9209D6B0A42706F8D570CACEBC338C7404
        EDD331A2EA80B47570CA50E81C0A10633E056BB73001CEB0FD2079377BC2A1D1
        F2523CBA44D501DFFF7BA637AE132E2C20C6F514045770CB0D3848BB8CE97997
        7542F0C52CCFCA5D541DE0B0ABEDFB9DDB5F54B101C1FE4041DA2DB941FA5C13
        0C758DA84C40D96879299ABFA2EA00479CCD7438ACB7978D760B08F210C23645
        9B30522E7F9282B1AE11950970E416844D8A360176A365A9DE1F2BAAB8402B87
        9B6F3831D5760D14F7225230E4CB3C9BC7A112897D97A8262443FFDE7F435471
        3158ADEE23B16F16D504A4ED2751AF13D535386D2BB1178A6A02072ECDBE7357
        8A2A2EB87656625C2AAA095CFC66A23A7787A8AEC1B5BF7248DBD527B6253AB2
        FF1B51C5055A56D325C65745B50404DD8E7C757B44BA01ECDA3A2E387CB6A826
        70C50BF271CE3ECC1C42AC788B73CB4E610CA4B3733892757928CAF185356D3B
        8531908733875B152D2E589152308EEA8A6A0988752BF3659DD943B973598E9B
        8244B5047E47D4F4CEB892B2E70011A24E9F73EF14D512488F3A6F63BCBDA115
        92729D563A7A7F03F3B5EB3C1606B8326FA2109D36D82457BAF7878AEA0ADDDE
        59F81D17321F1A1993441513106139C4D8C5FE88A89648EA02EF8F14D51550AE
        ABBA07B6F9CA26362E0E13554C40E04D1061A3A26D813C516BC9FB9345750594
        DB8A321D5B67C863ABDEE1C0714D15EFD1B05E7AB42DE16E516D11BF5006F9BF
        2DAA23B8F55A65968A6A0B2E72B0BCCE7D5354F1904CDD3A77A3A8B6409E7DED
        0A6EF3C299566005AD3237886A0B6EFEB1BCAEC053B9DA62C02BB8E3E618AEA7
        92603F11D5116891BD5965AE15D5165C976579BDFFA1A8E281EFCBC2953F0811
        1EEC54E942DCF8A532C95B843A817D0AD8670F7C4DA7D940E49B65F69DFBBAA8
        620222C4FB01DBF6A4B94704796CA15BD67DE370E0CFCDFE187329B6EDC1B97B
        CD7E9B7D8B85011CC1FD86A3B832B7B69A62D51E117BF709C515DD3520F444D8
        DE89C00D3FEF179D0077115F216BCB491116882E3620DA3110EC51063EEFF179
        14EA8C32043A05F1BF99587C2159CE396F94E72B61B9AB96F6AFC6F19166DFB9
        AF20AC95FD151C555691004D42C57B0893402121D655E3156BC8A132417FA4C9
        7EB4ABEA32EE7954D68018AC2BECCD40CECD8623388FFEA9F47BB5C60B3EFEF8
        1E46D83DC5ECE3CEE43B20951C10101010F01886E6AE07D0D4ADDBE7D7087618
        998F812FAB11CD26F2D131DF18503927A3B48CB31257B40E6A460FA417DD7172
        2C5D3E0D2D9218E06F17D53B4085FD019C5CDCC269EA13C4887BE50CE9179D41
        B46D0823A89037370654D07F661EF6C8590EDCAEF45BE96270319EA5A7961421
        EF6F517EB5A27560C5CFFCAD6CEDF16870C815A29B00B16C5289A1D121E0AE57
        B425628728DCDFB85A313824859443964190C1567D8BD43A2AFB0F91DC0ED19F
        B7C0CE394A320487A49038247AB7083B7C4D9341140A6107F27D9E79C7E1902B
        11AE421976FC0E547270481AB14370179420C2129CEC8AF428AC467FFF853C97
        20ED33CCDB548778BF88A23605D9493BA456ADBE006536E2F85E56E6968EBC4C
        0F0E016287A0D29E0E116CD7144252B983B3F7258E94CB074008DBC4D3E20E89
        EB87BA102F62483B4465ECCF63F069C3EAC12129240E71EE084DDFFE33168E90
        30D65AC2E76CE66DBA439CFB1DC439A431C4FF13D2E81002F10528677FD2121C
        9242E210EF3FCE38449987E3215EDD7CDB8F0989363FD3F069AB40C6538788B2
        FE0FBE87FF45F5273EC6981E1C02A4EE90598C43EC7D70CC4AF7040A84F00867
        F99886637B5DD3EE7008A14E25BF3BFEBB8CFF39C4B91BE194CD8AD60176EC4E
        C5E7980BF9F648343A8480108B71B2AB280842B2421D7976AB43C8C3FE4D08DC
        71DBE8107B7D077AEFEF1365B032CEDD86B0951359A27B07AD1CC216978911F1
        C95F0CE1B8A54320E8527C561B433C54D2CE2184FDE957B44EABCE21FC6B0BC4
        37227027D72CDC4D13F05B0F868DE8BF4EBA78C7E31E89560EE1566770EB2174
        DD8B0190A7DD1D92B4ACD20169B6727D2C8710488BFF07317108C1552DF80D4B
        C0F3111AD9756E0DB7D3294BC0FF036C857161764F0E26060404040404040404
        040404040404040404EC56F4F5FD1762653709B99EADBE0000000049454E44AE
        426082}
    end
  end
  object ImageList: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 21037272
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0002000000090000000E0000000F0000000F0000001000000010000000110000
          0011000000100000000B00000003000000000000000000000000000000000000
          00087C5345C0AD725EFFAC725DFFAC715DFFAC6F5BFFAB705CFFAB705CFFAB6E
          5CFFAB6E5AFF7A4E41C30000000B000000000000000000000000000000000000
          000BAF7462FFFDFBF9FFFBF6F2FFFBF5F2FFFAF5F1FFFBF4EFFFF9F3EEFFF9F2
          EEFFFAF2ECFFAC715DFF0000000F000000000000000000000000000000000000
          000BB17964FFFDFBFAFFF7EEE7FFF8EDE7FFF7EDE7FFF7EDE6FFF6ECE5FFF6EC
          E5FFFAF2EEFFAE7260FF01010120010101100101010B00000003000000000000
          000BB37C69FFFDFCFBFFF8EFE8FFF7EEE8FFF7EEE8FFF8EEE7FFF7EEE7FFF7EC
          E6FFFAF3EFFFB07863FFC19D92FFB57D6AFF815A4EC30101010B000000000000
          000AB57F6CFFFEFCFBFFF9F0EAFFF8F0EAFFF8EFE9FFF8EFE8FFF8EEE9FFF8EE
          E7FFFBF5F1FFB27A66FFEBE6E2FFFAF3EDFFB6806DFF0101010F000000000000
          0009B98270FFFEFDFCFFF9F2EDFFF9F2EDFFF9F0EBFFF9F0EAFFF8F0EAFFF8F0
          E9FFFBF6F3FFB37D6AFFE9E1DAFFFAF3EFFFB88170FF01010110000000000000
          0008BB8775FFFEFDFDFFFAF3EFFFFAF4EEFFFAF3EEFFFAF1ECFFF9F1EBFFF9F0
          EBFFFCF8F5FFB6806DFFEAE1DBFFFAF4F0FFB98673FF0101010F000000000000
          0007BF8B78FFFEFEFDFFFBF5F1FFFBF5F0FFFBF4F0FFFAF3EFFFFAF3EFFFF9F3
          EDFFFCF9F7FFBA8471FFECE4DDFFFBF5F2FFBB8876FF0101010E000000000000
          0007C18E7EFFFEFEFDFFFAF5F3FFFBF6F2FFFBF5F1FFFBF5F0FFFBF5F0FFFAF4
          EFFFFDFAF8FFBC8978FFEDE7E0FFFBF6F4FFBC8B7AFF0101010D000000000000
          0006C49382FFFEFEFEFFFBF6F4FFFBF6F4FFFCF6F3FFFCF6F3FFFCF4F2FFFBF5
          F1FFFDFBF9FFBF8C7CFFEFE8E3FFFCF8F5FFBF8E7CFF0101010D000000000000
          0005C49785FFFFFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFDFFFEFDFDFFFEFD
          FDFFFEFDFCFFC2907FFFF0EBE6FFFCF9F7FFC29180FF0101010C000000000000
          0003967265C0C89988FFC99887FFC79887FFC59786FFC79785FFC79784FFC596
          84FFC59683FFCDA79AFFF4EFEAFFFDFAF8FFC49686FF0101010B000000000000
          000100000003000000040000000BD8BBB0FFF8F8F8FFF5F0EFFFF5F0EFFFF5EF
          EDFFF5EFEDFFF7F0EEFFFAF4F1FFFDFBF9FFC7998AFF0000000A000000000000
          0000000000000000000000000005CCA392FFFFFEFEFFFEFEFEFFFEFEFEFFFEFE
          FEFFFEFEFDFFFEFDFDFFFEFDFDFFFEFDFCFFCA9D8DFF00000009000000000000
          00000000000000000000000000039A7B6FC0CEA495FFCFA494FFCDA494FFCCA3
          93FFCDA392FFCDA391FFCCA291FFCCA290FF97776BC200000006}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000030000000C00000010000000110000
          0011000000120000001200000013000000130000001000000004000000000000
          00000000000000000000000000000000000BA97563FFA87462FFA77261FFA571
          5FFFA5705EFFA36F5DFFA36D5CFFA26D5BFFA26C5AFF0000000F000000000000
          00000000000000000000000000000000000DAB7866FFFDFBF8FFF7EFE8FFF6EF
          E6FFF6EEE6FFF5EEE5FFF5EDE4FFF5EDE4FFA36D5CFF00000013000000000000
          0000265080B7336CB1FF326BB0FF2E63A6FFAD7C6AFFFDFCFAFFF7F0E9FFF7F0
          E8FFF7EFE7FFF6EFE7FFF6EEE6FFF5EEE5FFA46F5DFF00000012000000000000
          00003976B8FF91D2F4FF66BEEEFF60B5E4FFB07F6DFFFEFDFCFFF7F2EAFFF8F1
          E9FFF7F0E9FFF6F0E8FFF6EFE7FFF6EFE6FFA67260FF00000011000000000000
          00003F7DBCFF9AD6F5FF6CC3F0FF66B8E5FFB28070FFFEFEFDFFF8F3ECFFF8F2
          EBFFF7F1EAFFF7F1E9FFF7F0E8FFF7EFE8FFA87563FF00000010000000000000
          00004384C1FFA4DBF6FF73C7F1FF6CBEE8FFB48473FFFFFFFEFFF9F3EEFFF9F3
          EDFFF9F2ECFFF8F2EBFFF7F1EAFFF7F0E9FFAB7766FF0000000F000000000000
          0000488BC5FFADE1F8FF7ACCF2FF73C3E9FFB68676FFFFFFFFFFF9F5EEFFF9F4
          EEFFF9F3EDFFF8F3ECFFF8F2EBFFF7F2EBFFAC7A6AFF0000000E000000000000
          00004C92CAFFB6E6FAFF81D2F4FF7AC9EBFFB88878FFFFFFFFFFFAF5F0FFF9F5
          EFFFF9F5EFFFF9F4EEFFF9F3EDFFF9F3ECFFAF7E6CFF0000000D000000000000
          00005098CDFFBEE9FAFF88D6F6FF81CEEEFFBB8B7BFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFAFFB1816FFF0000000C000000000000
          0000539DD1FFC5EDFBFF8FDBF7FF89D5F2FFBD8D7DFFBB8C7CFFBA8B7BFFB989
          79FFB98977FFB78876FFB68674FFB58373FFB38371FF00000009000000000000
          000056A1D4FFCBF0FCFF95E0F8FF82CBE9FF72B7D9FF71B7D9FF70B7DAFF70B8
          DBFF6FB7DBFF4385BBFF00000009000000090000000800000002000000000000
          000058A5D7FFCBEDF8FF73B2D0FF5792B7FF5893B7FF5995BAFF5B99BDFF62A3
          C9FF69AFD4FF4184BBFF00000000000000000000000000000000000000000000
          000059A8D9FFBCDBE7FF8E7875FF9B7061FF946A5BFF8F6456FF885D50FF7B65
          63FF97BCD3FF488EC4FF00000000000000000000000000000000000000000000
          0000437EA2BD4A90BFFFB48E7FFFF3EDE7FFDEC9B8FFDDC8B5FFDBC4B2FF9770
          60FF3B7BAEFF40799EBD00000000000000000000000000000000000000000000
          00000000000000000000876B60BDB69181FFB69080FFB58E7FFFB28C7DFF7D60
          54BD000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00020000000A2219164378594EB9A2776AECB28374FFA27669EC77584EB92119
          16450000000B0000000200000000000000000000000000000000000000020403
          03135D463F94BB9588FDDFC9C1FFF3EBE6FFFBF5F2FFF4EAE6FFDFC9C0FFBA92
          85FD5C453D960403031500000002000000000000000000000000000000096F55
          4AA6CBA99EFFF8F0ECFFF0D7B6FFE8C085FFFBF6F3FF45B7F9FF94D3F8FFF5F0
          ECFFC8A699FF6C5248A80000000A0000000100000000000000002C221F4BC39E
          91FFF8F2ECFFE9C48FFFE4B570FFE4B570FFFBF6F3FF1DAAFAFF1DA9FAFF4CBA
          F9FFF0EEEDFFC0998BFF2B201D4E0000000400000000000000007B6157B0E3D1
          CAFFF0D7B4FFE4B876FFE4B875FFE4B672FFFCF7F4FF1EADF9FF1EAAF9FF1EAA
          F9FF89CFF7FFE0CCC4FF785C53B1000000080000000000000000AD8A7CE7F7F2
          EEFFE7C28AFFE4BA7AFFE4B978FFE4B978FFFCF8F6FF1FADF9FF1FADF8FF1EAD
          F8FF3BB7F9FFF5EDEAFFA88475E80000000B0000000000000000BF9A8BFAFDFA
          F8FFFCF9F7FFFDF9F7FFFCF9F7FFFCF9F7FFFCF9F7FFFCF9F7FFFCF9F6FFFCF9
          F6FFFCF8F7FFFBF6F4FFBA9384FA0000000A0000000000000000B29284E7F8F3
          F0FF7594F1FF6185F0FF6085F0FF6085F0FFFDFAF8FF9D6641FF9C653FFFA777
          54FFFCF9F7FFF7F0ECFFAE8C7DE7000000090000000000000000836C62ACE8D8
          D1FFB4C5F6FF6588F0FF6488F1FF6387F1FFFDFBF9FFB48561FFFFFFFFFFBB8E
          6EFFB28567FFE6D5CDFF80685EAD00000006000000000000000030282544D2B5
          A6FFF9F7F6FF8DA7F3FF678AF0FF678AF0FFFDFBF9FFC0977AFFF9F6F3FFFCEE
          DBFFC29779FFB68B70FF45342CA4574035FF0000000000000000000000037765
          5C99DBC4B8FFFAF8F9FFBCCBF7FF88A2F2FFFDFCFBFFFDFCFBFFCCAA95FFFEFE
          FDFFFCEEDBFF998275FF5D453AFF60534CB80000000000000000000000010504
          040A64554F80D2B6AAFAEBDED7FFF9F5F2FFFEFEFDFFF8F5F2FFEBDED7FFCEB0
          9EFFB2A59FFF654C40FF9F8C82FF412E26FB0A06044E00000000000000000000
          00000000000225201D328D796EAEBCA092E5D2B3A4FFBCA092E68D776DAF4A3B
          339A6D5447FFC5B8B0FF483329FF8C6F61FF422E26FB0A060448000000000000
          000000000000000000010000000200000003000000030000000300000002755C
          4FFF6A5B53BC765C4EFDE6D9C7FF483329FF896C5EFF24140FE1000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000281F1A5A795E51FDE3D6C0FF4C372CFF614A3FE4000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000261E19516C5448EA6B5447EA21191548}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000020000000A00000010000000090000000200000000000000000000
          00020000000A000000120000000C000000030000000000000000000000000000
          00020000000F0F0742921D0F7EEF0603347A0000000E00000002000000020000
          000F0804347C1D0F7EF00F084194000000120000000200000000000000000000
          0008120B47923233AFFF3648CCFF1D1EA5FF0603357A0000000F0000000F0703
          357C1F20A5FF3747CCFF2D2FAEFF120B46950000000B00000000000000000000
          000C281C8DF1596CD8FF3B51D3FF3A4FD2FF1E22A6FF0602347D0502357E2022
          A6FF3A50D3FF3A50D3FF4C5FD4FF291D8CF10000001000000000000000000000
          0006130F3C734D4FBAFF667EE0FF415AD6FF415AD7FF1F24A7FF2529A8FF415A
          D7FF415AD7FF5B72DEFF484AB8FF130F3C790000000900000000000000000000
          00010000000A16123F73585CC1FF758DE6FF4A64DBFF4A65DBFF4A65DBFF4A64
          DBFF6983E3FF5356C0FF16123F780000000C0000000200000000000000000000
          0000000000010000000A191643755D63C7FF6783E5FF5774E2FF5774E2FF5774
          E2FF565CC6FF1916437A0000000D000000020000000000000000000000000000
          00000000000100000009100E3D734A50BEFF7492EBFF6383E7FF6483E7FF6383
          E7FF3840B6FF0B0839780000000C000000020000000000000000000000000000
          0001000000071413416E555CC5FF85A1EFFF7897EDFF9CB6F4FF9DB7F5FF7997
          EEFF7796EDFF414ABCFF0E0C3C730000000A0000000100000000000000000000
          00041818456B636CCFFF93AFF3FF83A1F1FFA6BFF7FF676DCAFF7E87DDFFAFC7
          F8FF83A3F2FF83A1F1FF5058C4FF121040710000000600000000000000000000
          00065759C3EFAFC6F6FF8EADF4FFABC4F8FF6F76D0FF1817456F24244F70868E
          E1FFB5CCF9FF8DACF4FFA1B8F4FF5758C3EF0000000900000000000000000000
          000331326B8695A0EAFFC0D3F9FF7880D7FF1C1C496B00000006000000072527
          526C8B93E6FFC1D3F9FF949EE9FF303168870000000500000000000000000000
          00010000000431336B825E62CBEC1F204D680000000500000001000000010000
          00052728536B5E62CBEC31326883000000070000000100000000000000000000
          0000000000000000000200000004000000020000000100000000000000000000
          0001000000030000000500000004000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000002000000070000000A0000000A0000000B0000
          000B0000000B0000000C0000000C0000000D0000000A00000003000000000000
          0000000000000000000000000006AD735FFFFEFCFBFFF7ECE5FFF7ECE5FFF6EC
          E5FFF8EDE4FFF6EBE4FFF6EBE4FFFBF6F1FFAA6D5BFF0000000A000000000000
          0000000000000000000000000007AF7462FFFEFDFCFFF7EEE7FFF8EDE7FFF7ED
          E7FFF7EDE6FFF6ECE5FFF6ECE5FFFCF6F3FFAC715DFF0000000C000000000000
          0000000000000000000000000007B17964FFFEFDFDFFF8EFE8FFF7EEE8FFF7EE
          E8FFF8EEE7FFF7EEE7FFF7ECE6FFFCF7F4FFAE7260FF0000000B000000000000
          0000000000000000000000000006B37C69FFFEFDFDFFF9F0EAFFF8F0EAFFF8EF
          E9FFF8EFE8FFF8EEE9FFF8EEE7FFFCF8F6FFB07863FF0000000A000000030000
          0009000000080000000200000005B57F6CFFFEFEFDFFFEFEFDFFFEFDFDFFFEFD
          FCFFFEFDFCFFFEFDFCFFFEFCFBFFFEFCFBFFB27A66FF0000000900000008B372
          44FF502612A00201001000000006886053C0B9826FFFB6816FFFB6806EFFB680
          6DFFB57F6CFFB57F6CFFB4806BFFB57D6BFF845D4EC20000000600000008B97B
          4DFFC18E62FF703C1EC609040221000000060000000400000005000000050000
          000600000006000000060000000700000007000000050000000100000005BE84
          57FFECD0ABFFDEB990FF7E4B2DC2000000050000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000004C38D
          60FFE0C0A0FF936A49C60E09061F0000000B0000000E0000000F0000000F0000
          0010000000100000001100000011000000100000000B0000000300000001C996
          6AFF75573C9A0503020B00000009855D51C0B9826FFFB6816FFFB6806EFFB680
          6DFFB57F6CFFB57F6CFFB4806BFFB57D6BFF80594CC30000000B000000000000
          000100000001000000000000000BBB8775FFFDFBFAFFFCF8F5FFFBF7F4FFFBF6
          F3FFFBF6F2FFFBF5F1FFFAF4EFFFFAF3EFFFB6806DFF0000000F000000000000
          000000000000000000000000000BBF8B78FFFEFCFBFFF9F2EDFFF9F2EDFFF9F0
          EBFFF9F0EAFFF8F0EAFFF8F0E9FFFAF5F1FFBA8471FF00000010000000000000
          000000000000000000000000000BC18E7EFFFEFDFCFFFAF3EFFFFAF4EEFFFAF3
          EEFFFAF1ECFFF9F1EBFFF9F0EBFFFBF6F3FFBC8978FF0000000F000000000000
          000000000000000000000000000AC49382FFFEFDFCFFFBF5F1FFFBF5F0FFFBF4
          F0FFFAF3EFFFFAF3EFFFF9F3EDFFFCF8F5FFBF8C7CFF0000000E000000000000
          0000000000000000000000000009C49785FFFEFDFDFFFAF5F3FFFBF6F2FFFBF5
          F1FFFBF5F0FFFBF5F0FFFAF4EFFFFCF9F6FFC2907FFF0000000D}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000936E4DB7CB9767FFC99465FFC89162FFC78F5FFF8D6542B7000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000CE9B6EFFFBF8F3FFF6EBE1FFF4E8DDFFF2E5D8FFC68F5FFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000D09E70FFFCFAF7FFFBF7F3FFFAF4EEFFF8F0E9FFC79161FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000C19369ECD09D70FFCE9C6DFFCC996AFFCB9668FFB9875BEC000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000CE9B6EFFFBF8F3FFF6EBE1FFF4E8DDFFF2E5D8FFC68F5FFF000000080000
          000F000000130000001600000017000000110000000400000000000000000000
          0000D09E70FFFCFAF7FFFBF7F3FFFAF4EEFFF8F0E9FFC79161FF0C498EBF1165
          C6FF0F63C5FF0E61C4FF0D60C3FF09448BC80000001100000000552D12810000
          00009B7754BDD09D70FFCE9C6DFFCC996AFFCB9668FF956D4ABD1268C8FFA3DA
          FFFF59BCFFFF56BBFFFF53BAFFFF0E60C3FF0000001700000000A95A25FF552D
          12810000000000000000000000000000000000000000000000001369C9FFB5E1
          FFFF5BBDFFFF59BBFFFF56BAFFFF0F61C3FFAD5E2AFFAC5D28FFAA5B27FFAA59
          24FF2C1709420000000000000000000000000000000000000000146ACAFFC6E8
          FFFFB7E2FFFFA7DCFFFF97D5FFFF0F63C5FF0000001200000000AC5D28FF542D
          137E0000000000000000000000000000000000000000000000000F5097BF136A
          CAFF1368C9FF1267C7FF1065C6FF0C4A93C60000000A00000000552F157E0000
          0000936E4DB7CB9767FFC99465FFC89162FFC78F5FFF8D6542B7000000010000
          0003000000050000000700000008000000070000000200000000000000000000
          0000CE9B6EFFFBF8F3FFF6EBE1FFF4E8DDFFF2E5D8FFC68F5FFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000D09E70FFFCFAF7FFFBF7F3FFFAF4EEFFF8F0E9FFC79161FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00009B7754BDD09D70FFCE9C6DFFCC996AFFCB9668FF956D4ABD000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object ToolBarPopupMenu: TPopupMenu
    AutoHotkeys = maManual
    Images = ToolBarImageList
    OnPopup = ToolBarPopupMenuPopup
    Left = 499
    Top = 146
    object AutoRegItem: TMenuItem
      Caption = #51088#46041#46321#47197
      ImageIndex = 0
      OnClick = AutoRegItemClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object CopyItem: TMenuItem
      Caption = #48373#49324
      ImageIndex = 2
    end
    object PasteItem: TMenuItem
      Caption = #48537#50668#45347#44592
      ImageIndex = 3
      OnClick = PasteItemClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object StandardDownLoad: TMenuItem
      Caption = #54364#51456#45796#50868#47196#46300
      OnClick = StandardDownLoadClick
    end
  end
  object ToolBarImageList: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 13697520
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          20000000000000040000000000000000000000000000000000000000000A0000
          0010000000110000001100000011000000110000001100000011000000110000
          0011000000120000001200000012000000110000000B0000000375472BC2A361
          3CFFA3603CFFA2603AFFA2603AFFA25E39FFA05E3AFFA05C38FFA05C38FF9F5C
          38FF9F5B38FF9F5B37FF9F5B37FF9E5B37FF714028C30000000AAB6943FFE5C1
          91FFE1B981FFE2B881FFE1B982FFE1B881FFE1B881FFE1B881FFE1B881FFE1B8
          81FFE1B881FFE1B881FFE1B881FFE4BE8CFFA8653FFF0000000FAC6B45FFE6C3
          94FFE3BC88FFE3BC89FFE3BC88FFE3BC88FFE3BC88FFE2BC88FFE2BC88FFE3BC
          87FFE2BC87FFE2BC87FFE3BC87FFE5BF8EFFA96741FF00000010AD6E48FFE7C5
          99FFCD9967FFC68F5FFFC58F60FFC58E5FFFC58E5EFFC48E5FFFC58E5EFFC892
          60FFC48D5DFFC58D5EFFCB9764FFE5C292FFAA6943FF0000000FB0714BFFE9C8
          9CFFC79263FFF2E9E4FFF9F3EDFFF9F2EDFFF9F2EDFFF9F2EDFFFCF8F6FFC690
          60FFF2E9E3FFFCF8F5FFC58F60FFE7C596FFAC6B45FF0000000EB1744EFFEACB
          A1FFCB9868FFC99466FFC89365FFC89465FFC79364FFC79364FFC89364FFC893
          64FFC79263FFC79263FFC99464FFE8C89AFFAD6D47FF0000000EB37651FFECCF
          A6FFCA9769FFF2EAE5FFF9F4F0FFF9F4F0FFF9F4F0FFF9F4F0FFFCF9F7FFC995
          67FFF2E9E5FFFCF9F6FFC89465FFEACB9FFFAE7049FF0000000DB57A55FFECD1
          AAFFCE9D6EFFCC9A6CFFCC996BFFCC996BFFCB996BFFCB986AFFCB986AFFCB98
          6AFFCA9869FFCA9769FFCC996BFFECCDA3FFB1724DFF0000000CB87D58FFEED5
          AFFFCD9D71FFF3EAE7FFFBF6F2FFFAF5F2FFFBF5F2FFFAF5F1FFFCFAF8FFCFA0
          76FFF2EAE6FFFCF9F8FFCB9A6CFFECD0A9FFB3754FFF0000000BBA815BFFF2DD
          BCFFD5AC83FFD3A980FFD3A980FFD3A880FFD3A87FFFD2A87FFFD2A77EFFD2A8
          7EFFD1A67DFFD1A57CFFD1A479FFEDD4ADFFB57952FF0000000BC18E6BFFF5E7
          CBFFD5AD85FFF3ECE8FFFCF8F4FFFCF7F4FFFBF7F4FFFBF7F4FFFDFAF9FFD3AA
          82FFF3EBE7FFFDFAF9FFD3A981FFF3DFBFFFB67C56FF0000000AC59878FFF7E9
          D0FFDEBC93FFD7B089FFD7B088FFD6B088FFD6AF88FFD6AE88FFD6AE87FFD9B3
          8BFFD5AD86FFD5AD85FFDCB890FFF5E6CBFFBC8662FF00000009C89C7DFFF7EC
          D4FFF2DEB7FFF2DEB7FFF2DDB6FFF2DDB6FFF2DDB6FFF2DDB6FFF2DDB5FFF2DD
          B5FFF2DCB5FFF2DCB5FFF2DCB4FFF7E9CEFFC29170FF00000008CBA081FFF8ED
          D6FFF8EDD6FFF8EDD6FFF8ECD5FFF8ECD5FFF8ECD5FFF8ECD5FFF8ECD4FFF8EC
          D4FFF8ECD4FFF8ECD4FFF8ECD3FFF8ECD3FFC59878FF00000007977A63C1CDA4
          86FFCCA384FFCCA384FFCBA284FFCBA283FFCAA183FFCAA082FFCAA082FFCAA0
          81FFC99F80FFC99F80FFC99E7FFFC89D7EFF94725AC100000005}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000B8824DFFAE7B
          49F1A17243DF805A35B149331E65060503090000000000000000000000000000
          0000000000000000000000000000000000000000000000000000B8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFA57445E42A1E123A00000000000000000000
          0000000000000000000000000000000000000000000000000000B8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFAF7C49F319110A22000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000E0A06132F2114418F653CC6B8824DFFB8824DFF704F2F9B000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000001A120B24B8824DFFB8824DFFA17243DF000000000000
          0000000000000A07040E8B623AC1B8824DFFB7814DFE4F38216D000000000000
          0000000000000000000000000000B8824DFFB8824DFFB07C4AF4000000000000
          00000D09051292673DCAB8824DFFB7814DFE4A351F6700000000000000000000
          0000000000000000000018110A21B8824DFFB8824DFFA27244E000000000110C
          0717986B3FD2B8824DFFB6804CFC45311D600000000000000000000000000000
          00000403020523190F318D633BC3B8824DFFB8824DFF71502F9D160F091E9C6E
          41D8B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB07C4AF41A120B24896139BEB882
          4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
          4DFFB8824DFFB8824DFFB8824DFFA77646E82C1F123D00000000120D0819996C
          40D4B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB07C
          4AF4A27344E1825C36B44C36206A0A07040E0000000000000000000000000D09
          051291663DC9B8824DFFB7814DFE49331E650000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000907040D886039BDB8824DFFB7814DFE4C36206A00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000060402087F5A35B0B8824DFFB7814DFE5039226F000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0002000000090000000E0000000F0000000F0000001000000010000000110000
          0011000000100000000B00000003000000000000000000000000000000000000
          00087C5345C0AD725EFFAC725DFFAC715DFFAC6F5BFFAB705CFFAB705CFFAB6E
          5CFFAB6E5AFF7A4E41C30000000B000000000000000000000000000000000000
          000BAF7462FFFDFBF9FFFBF6F2FFFBF5F2FFFAF5F1FFFBF4EFFFF9F3EEFFF9F2
          EEFFFAF2ECFFAC715DFF0000000F000000000000000000000000000000000000
          000BB17964FFFDFBFAFFF7EEE7FFF8EDE7FFF7EDE7FFF7EDE6FFF6ECE5FFF6EC
          E5FFFAF2EEFFAE7260FF01010120010101100101010B00000003000000000000
          000BB37C69FFFDFCFBFFF8EFE8FFF7EEE8FFF7EEE8FFF8EEE7FFF7EEE7FFF7EC
          E6FFFAF3EFFFB07863FFC19D92FFB57D6AFF815A4EC30101010B000000000000
          000AB57F6CFFFEFCFBFFF9F0EAFFF8F0EAFFF8EFE9FFF8EFE8FFF8EEE9FFF8EE
          E7FFFBF5F1FFB27A66FFEBE6E2FFFAF3EDFFB6806DFF0101010F000000000000
          0009B98270FFFEFDFCFFF9F2EDFFF9F2EDFFF9F0EBFFF9F0EAFFF8F0EAFFF8F0
          E9FFFBF6F3FFB37D6AFFE9E1DAFFFAF3EFFFB88170FF01010110000000000000
          0008BB8775FFFEFDFDFFFAF3EFFFFAF4EEFFFAF3EEFFFAF1ECFFF9F1EBFFF9F0
          EBFFFCF8F5FFB6806DFFEAE1DBFFFAF4F0FFB98673FF0101010F000000000000
          0007BF8B78FFFEFEFDFFFBF5F1FFFBF5F0FFFBF4F0FFFAF3EFFFFAF3EFFFF9F3
          EDFFFCF9F7FFBA8471FFECE4DDFFFBF5F2FFBB8876FF0101010E000000000000
          0007C18E7EFFFEFEFDFFFAF5F3FFFBF6F2FFFBF5F1FFFBF5F0FFFBF5F0FFFAF4
          EFFFFDFAF8FFBC8978FFEDE7E0FFFBF6F4FFBC8B7AFF0101010D000000000000
          0006C49382FFFEFEFEFFFBF6F4FFFBF6F4FFFCF6F3FFFCF6F3FFFCF4F2FFFBF5
          F1FFFDFBF9FFBF8C7CFFEFE8E3FFFCF8F5FFBF8E7CFF0101010D000000000000
          0005C49785FFFFFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFDFFFEFDFDFFFEFD
          FDFFFEFDFCFFC2907FFFF0EBE6FFFCF9F7FFC29180FF0101010C000000000000
          0003967265C0C89988FFC99887FFC79887FFC59786FFC79785FFC79784FFC596
          84FFC59683FFCDA79AFFF4EFEAFFFDFAF8FFC49686FF0101010B000000000000
          000100000003000000040000000BD8BBB0FFF8F8F8FFF5F0EFFFF5F0EFFFF5EF
          EDFFF5EFEDFFF7F0EEFFFAF4F1FFFDFBF9FFC7998AFF0000000A000000000000
          0000000000000000000000000005CCA392FFFFFEFEFFFEFEFEFFFEFEFEFFFEFE
          FEFFFEFEFDFFFEFDFDFFFEFDFDFFFEFDFCFFCA9D8DFF00000009000000000000
          00000000000000000000000000039A7B6FC0CEA495FFCFA494FFCDA494FFCCA3
          93FFCDA392FFCDA391FFCCA291FFCCA290FF97776BC200000006}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000030000000C00000010000000110000
          0011000000120000001200000013000000130000001000000004000000000000
          00000000000000000000000000000000000BA97563FFA87462FFA77261FFA571
          5FFFA5705EFFA36F5DFFA36D5CFFA26D5BFFA26C5AFF0000000F000000000000
          00000000000000000000000000000000000DAB7866FFFDFBF8FFF7EFE8FFF6EF
          E6FFF6EEE6FFF5EEE5FFF5EDE4FFF5EDE4FFA36D5CFF00000013000000000000
          0000265080B7336CB1FF326BB0FF2E63A6FFAD7C6AFFFDFCFAFFF7F0E9FFF7F0
          E8FFF7EFE7FFF6EFE7FFF6EEE6FFF5EEE5FFA46F5DFF00000012000000000000
          00003976B8FF91D2F4FF66BEEEFF60B5E4FFB07F6DFFFEFDFCFFF7F2EAFFF8F1
          E9FFF7F0E9FFF6F0E8FFF6EFE7FFF6EFE6FFA67260FF00000011000000000000
          00003F7DBCFF9AD6F5FF6CC3F0FF66B8E5FFB28070FFFEFEFDFFF8F3ECFFF8F2
          EBFFF7F1EAFFF7F1E9FFF7F0E8FFF7EFE8FFA87563FF00000010000000000000
          00004384C1FFA4DBF6FF73C7F1FF6CBEE8FFB48473FFFFFFFEFFF9F3EEFFF9F3
          EDFFF9F2ECFFF8F2EBFFF7F1EAFFF7F0E9FFAB7766FF0000000F000000000000
          0000488BC5FFADE1F8FF7ACCF2FF73C3E9FFB68676FFFFFFFFFFF9F5EEFFF9F4
          EEFFF9F3EDFFF8F3ECFFF8F2EBFFF7F2EBFFAC7A6AFF0000000E000000000000
          00004C92CAFFB6E6FAFF81D2F4FF7AC9EBFFB88878FFFFFFFFFFFAF5F0FFF9F5
          EFFFF9F5EFFFF9F4EEFFF9F3EDFFF9F3ECFFAF7E6CFF0000000D000000000000
          00005098CDFFBEE9FAFF88D6F6FF81CEEEFFBB8B7BFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFAFFB1816FFF0000000C000000000000
          0000539DD1FFC5EDFBFF8FDBF7FF89D5F2FFBD8D7DFFBB8C7CFFBA8B7BFFB989
          79FFB98977FFB78876FFB68674FFB58373FFB38371FF00000009000000000000
          000056A1D4FFCBF0FCFF95E0F8FF82CBE9FF72B7D9FF71B7D9FF70B7DAFF70B8
          DBFF6FB7DBFF4385BBFF00000009000000090000000800000002000000000000
          000058A5D7FFCBEDF8FF73B2D0FF5792B7FF5893B7FF5995BAFF5B99BDFF62A3
          C9FF69AFD4FF4184BBFF00000000000000000000000000000000000000000000
          000059A8D9FFBCDBE7FF8E7875FF9B7061FF946A5BFF8F6456FF885D50FF7B65
          63FF97BCD3FF488EC4FF00000000000000000000000000000000000000000000
          0000437EA2BD4A90BFFFB48E7FFFF3EDE7FFDEC9B8FFDDC8B5FFDBC4B2FF9770
          60FF3B7BAEFF40799EBD00000000000000000000000000000000000000000000
          00000000000000000000876B60BDB69181FFB69080FFB58E7FFFB28C7DFF7D60
          54BD000000000000000000000000000000000000000000000000}
      end>
  end
end
