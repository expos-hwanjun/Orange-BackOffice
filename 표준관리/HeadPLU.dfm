inherited HeadPLUForm: THeadPLUForm
  Caption = #54364#51456'PLU '#44288#47532
  ClientHeight = 747
  ClientWidth = 1001
  ExplicitWidth = 1017
  ExplicitHeight = 786
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Height = 682
    ExplicitHeight = 593
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1001
    ExplicitWidth = 1001
    inherited ButtonToolBar: TAdvToolBar
      Left = 469
      ExplicitLeft = 469
      inherited ButtonToolBarSeparator: TAdvToolBarSeparator
        Height = 27
        ExplicitHeight = 27
      end
      inherited ButtonToolBarSaveButton: TAdvGlowButton
        Visible = False
      end
      inherited ButtonToolBarDeleteButton: TAdvGlowButton
        Visible = False
      end
      inherited ButtonToolBarNewButton: TAdvGlowButton
        Visible = False
      end
    end
    inherited ConditionToolBar: TAdvToolBar
      Width = 611
      ExplicitWidth = 611
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        Left = 607
        ExplicitLeft = 607
        ExplicitWidth = 0
        Width = 0
      end
      inherited ConditionToolBarDateLabel: TcxLabel
        Caption = 'PLU'#44396#48516
        Visible = True
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarToDateEdit: TcxDateEdit
        Left = 607
        ExplicitLeft = 607
        ExplicitWidth = 0
        Width = 0
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        Left = 607
        ExplicitLeft = 607
        ExplicitWidth = 0
        Width = 0
        AnchorX = 607
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        Left = 121
        Caption = #47700#45684#48516#47448
        ExplicitLeft = 121
        AnchorX = 154
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Left = 186
        ExplicitLeft = 186
        ExplicitWidth = 140
        Width = 140
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 607
        ExplicitLeft = 607
        ExplicitWidth = 0
        Width = 0
      end
      object ConditionTollBarAutoSelectCheckBox: TcxCheckBox
        Left = 449
        Top = 2
        Caption = ' '#44536#47532#46300#47700#45684' '#51088#46041#49440#53469
        ParentFont = False
        Style.StyleController = EditStyleController
        TabOrder = 7
      end
      object ContitionToolBarMenuCheckBox: TcxCheckBox
        Left = 326
        Top = 2
        Caption = ' '#46321#47197#46108' '#47700#45684#54252#54632
        ParentFont = False
        Style.StyleController = EditStyleController
        TabOrder = 8
      end
      object ConditonPLUComboBox: TcxComboBox
        Left = 67
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
        Left = 598
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
    end
  end
  inherited GridPanel: TPanel
    Height = 682
    ExplicitHeight = 682
    inherited Grid: TcxGrid
      Top = 68
      Height = 611
      ExplicitTop = 68
      ExplicitHeight = 611
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
    Width = 745
    Height = 682
    ParentColor = True
    ExplicitWidth = 745
    ExplicitHeight = 682
    object PluPageControl: TcxPageControl
      Left = 0
      Top = 0
      Width = 745
      Height = 682
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = PluTab
      Properties.CustomButtons.Buttons = <>
      Properties.HideTabs = True
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      ClientRectBottom = 682
      ClientRectRight = 745
      ClientRectTop = 0
      object PluTab: TcxTabSheet
        Caption = #47700#45684
        ImageIndex = 0
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
            Top = 11
            Width = 44
            Height = 17
            Caption = #9654' '#48516#47448
          end
          object Label2: TLabel
            Left = 393
            Top = 9
            Width = 39
            Height = 17
            Anchors = [akRight]
            Caption = #48516#47448#47749
            Transparent = True
          end
          object Label6: TLabel
            Left = 687
            Top = 7
            Width = 29
            Height = 17
            Anchors = [akRight]
            Caption = 'Page'
          end
          object ClassNameEdit: TcxTextEdit
            Tag = 99
            Left = 440
            Top = 5
            Anchors = [akRight]
            ParentFont = False
            Properties.ImeMode = imSHanguel
            Properties.MaxLength = 50
            Properties.OnChange = ClassNameEditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 1
            OnKeyPress = MenuNameEditKeyPress
            Width = 159
          end
          object ClassPageEdit: TcxCurrencyEdit
            Tag = 99
            Left = 652
            Top = 5
            Anchors = [akRight]
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
          object ClassLineFeedButton: TAdvGlowButton
            Left = 600
            Top = 3
            Width = 49
            Height = 28
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
          object ClassMoveButton: TAdvGlowButton
            Left = 65
            Top = 6
            Width = 88
            Height = 28
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
            TabOrder = 3
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
        end
        object ClassPanel: TPanel
          Left = 3
          Top = 46
          Width = 734
          Height = 173
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
          Top = 222
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
          object Label3: TLabel
            Left = 12
            Top = 12
            Width = 44
            Height = 17
            Caption = #9654' '#47700#45684
          end
          object Label4: TLabel
            Left = 342
            Top = 10
            Width = 39
            Height = 17
            Anchors = [akRight]
            Caption = #47700#45684#47749
          end
          object Label5: TLabel
            Left = 687
            Top = 8
            Width = 29
            Height = 17
            Anchors = [akRight]
            Caption = 'Page'
            ExplicitLeft = 695
            ExplicitTop = 12
          end
          object MenuNameEdit: TcxTextEdit
            Left = 390
            Top = 6
            Anchors = [akRight]
            ParentFont = False
            Properties.ImeMode = imSHanguel
            Properties.MaxLength = 30
            Properties.OnChange = ClassNameEditPropertiesChange
            Style.StyleController = EditStyleController
            TabOrder = 0
            OnKeyPress = MenuNameEditKeyPress
            Width = 209
          end
          object MenuPageEdit: TcxCurrencyEdit
            Tag = 99
            Left = 652
            Top = 5
            Anchors = [akRight]
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
            Left = 600
            Top = 4
            Width = 49
            Height = 29
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
          Left = 3
          Top = 267
          Width = 734
          Height = 406
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
        Caption = #51060#48120#51648
        Color = clWhite
        ImageIndex = 1
        ParentColor = False
        OnShow = KioskTabShow
        object KioskPanel: TAdvScrollBox
          Left = 0
          Top = 0
          Width = 745
          Height = 682
          Align = alClient
          DoubleBuffered = True
          Ctl3D = False
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentCtl3D = False
          ParentDoubleBuffered = False
          ParentFont = False
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
            Left = 124
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
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 25
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
    OnPopup = ColorPopupMenuPopup
    Left = 230
    Top = 173
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
    object BlockingMenuItem: TMenuItem
      Caption = #48660#47196#53433'('#47588#51109#50640#49436' '#46321#47197#44032#45733')'
      OnClick = BlockingMenuItemClick
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
  object PictureLoadDialog: TOpenPictureDialog
    Filter = #44536#47548' '#54028#51068'(*.png)|*.png'
    Left = 290
    Top = 240
  end
end
