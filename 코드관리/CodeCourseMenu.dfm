inherited CodeCourseMenuForm: TCodeCourseMenuForm
  Caption = #53076#49828' '#47700#45684' '#44288#47532
  ClientHeight = 647
  ClientWidth = 1114
  ExplicitWidth = 1130
  ExplicitHeight = 686
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 305
    Height = 582
    ExplicitLeft = 305
    ExplicitHeight = 582
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1114
    ExplicitWidth = 1114
    inherited ButtonToolBar: TAdvToolBar
      Left = 576
      ExplicitLeft = 576
      inherited ButtonToolBarCancelButton: TAdvGlowButton
        Visible = False
      end
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
        AnchorX = 298
        AnchorY = 16
      end
    end
  end
  inherited GridPanel: TPanel
    Width = 305
    Height = 582
    ExplicitWidth = 305
    ExplicitHeight = 582
    inherited Grid: TcxGrid
      Width = 299
      Height = 576
      OnEnter = GridEnter
      ExplicitWidth = 299
      ExplicitHeight = 576
      inherited GridTableView: TcxGridTableView
        Tag = 99
        PopupMenu = GridTableViewPopupMenu
        OptionsSelection.HideFocusRectOnExit = True
        OptionsSelection.UnselectFocusedRecordOnExit = True
        Styles.ContentEven = StyleEven
        object GridTableViewMenuCode: TcxGridColumn
          Tag = 98
          Caption = #47700#45684#53076#46300
          DataBinding.FieldName = 'CD_MENU'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 82
        end
        object GridTableViewMenuName: TcxGridColumn
          Tag = 98
          Caption = #47700#45684#47749
          DataBinding.FieldName = 'NM_MENU'
          HeaderAlignmentHorz = taCenter
          Width = 187
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 311
    Width = 803
    Height = 582
    ExplicitLeft = 311
    ExplicitWidth = 803
    ExplicitHeight = 582
    object AdvSplitter1: TAdvSplitter
      Left = 313
      Top = 0
      Width = 6
      Height = 582
      AutoSnap = False
      MinSize = 50
      Appearance.BorderColor = clNone
      Appearance.BorderColorHot = clNone
      Appearance.Color = 14542308
      Appearance.ColorTo = 16768709
      Appearance.ColorHot = 15383705
      Appearance.ColorHotTo = 14922381
      GripStyle = sgFlatDots
      ExplicitLeft = 320
      ExplicitTop = 3
      ExplicitHeight = 514
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 313
      Height = 582
      Align = alLeft
      Caption = 'Panel1'
      TabOrder = 0
      object Grid1: TcxGrid
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 305
        Height = 529
        Align = alClient
        TabOrder = 0
        OnEnter = GridEnter
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        object GridTableView1: TcxGridTableView
          Tag = 99
          Navigator.Buttons.CustomButtons = <>
          FilterBox.CustomizeDialog = False
          FilterBox.Visible = fvNever
          ScrollbarAnnotations.CustomAnnotations = <>
          OnFocusedRecordChanged = GridTableView1FocusedRecordChanged
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0 '#44148
              Kind = skCount
              Column = GridTableView1Count
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
          OptionsView.GroupByBox = False
          Styles.ContentEven = StyleEven
          object GridTableView1CourseName: TcxGridColumn
            Tag = 98
            Caption = #53076#49828#47749
            DataBinding.FieldName = 'NM_COURSE'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.OnChange = EditPropertiesChange
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Options.Sorting = False
            Width = 176
          end
          object GridTableView1Count: TcxGridColumn
            Tag = 98
            Caption = #49688#47049
            DataBinding.ValueType = 'Currency'
            DataBinding.FieldName = 'CNT_CHOOSE'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = '#0'
            Properties.OnChange = EditPropertiesChange
            FooterAlignmentHorz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Options.Sorting = False
            Width = 60
          end
          object GridTableView1CourseSeq: TcxGridColumn
            Tag = 99
            DataBinding.ValueType = 'Integer'
            DataBinding.FieldName = 'COURSE_SEQ'
            Visible = False
          end
          object GridTableView1ChooseType: TcxGridColumn
            Caption = #49440#53469#53440#51077
            DataBinding.FieldName = 'DS_CHOOSE'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Alignment.Horz = taCenter
            Properties.DropDownListStyle = lsFixedList
            Properties.Items.Strings = (
              #46972#46356#50724
              #52404#53356#48149#49828
              #49688#47049)
            Properties.OnChange = EditPropertiesChange
            HeaderAlignmentHorz = taCenter
            Width = 89
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = GridTableView1
        end
      end
      object UpDownPanel: TAdvPanel
        Left = 1
        Top = 536
        Width = 311
        Height = 45
        Align = alBottom
        Color = clWhite
        Enabled = False
        TabOrder = 1
        UseDockManager = True
        Version = '2.5.11.0'
        BorderColor = clBlack
        Caption.Color = clHighlight
        Caption.ColorTo = clNone
        Caption.Font.Charset = HANGEUL_CHARSET
        Caption.Font.Color = clWindowText
        Caption.Font.Height = -13
        Caption.Font.Name = #47569#51008' '#44256#46357
        Caption.Font.Style = []
        Caption.Indent = 0
        DoubleBuffered = True
        StatusBar.Font.Charset = DEFAULT_CHARSET
        StatusBar.Font.Color = clWindowText
        StatusBar.Font.Height = -11
        StatusBar.Font.Name = 'Tahoma'
        StatusBar.Font.Style = []
        Text = ''
        DesignSize = (
          311
          45)
        FullHeight = 200
        object UpButton: TAdvGlowButton
          Left = 10
          Top = 10
          Width = 113
          Height = 28
          Caption = #50948#47196
          FocusType = ftHot
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          Picture.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            6100000006624B474400FF00FF00FFA0BDA793000000CC49444154388D6360C0
            03229B0E5846361DB0C4A78609974444DB3E7311099105E252628B629A0ED8E2
            52C78C4BB3A888D822395919353E3E5EA1BF0CFF6C554C422F5CDABFE0114103
            9035C3C4F019C24C483321439889D18CCF104606060606DF86CD223CACBCEB04
            8504E08A050505F404F805F8191818183E7CFCF0F1FDFB0F976072EFDF7D60F8
            F2FB73D0E606DF378CB86C2B9873F581B4B4B43C030303C3D3A74F1F4E48D156
            C0A60E6734120B460D180C06B0E09278FBEEFDD16F5FBF1D66606060F8FEF327
            4E8B009F1A57305C8FCDAE0000000049454E44AE426082}
          Rounded = True
          Spacing = 0
          TabOrder = 0
          OnClick = UpButtonClick
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
        object DownButton: TAdvGlowButton
          Left = 188
          Top = 10
          Width = 112
          Height = 28
          Anchors = [akTop, akBottom]
          Caption = #50500#47000#47196
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          Picture.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            6100000006624B474400FF00FF00FFA0BDA793000000C349444154388D6364C0
            0162BB8E2CE56467FFC7C0C0C0F0FDE74FA6C56536D1D8D4B1E032405848D05A
            5A5A5A9E818181E1E9D3A70F71A963C225412C1835603018C0C8C0C0C0E0DBB0
            59848795779DA090005C425050404F805F809F818181E1C3C70F1FDFBFFF7009
            26F7FEDD07862FBF3F076D6EF07DC308138CE9DA6B242C28B14C46465A1D9F8D
            4F9F3CBDF3FAE5ABD8A5358E27E02E20D61074CD1806E033049B66AC06603304
            97669C06201BC2C8C0C08C4B334110D974C032B2E980253E3500408B5B33EC05
            EDF40000000049454E44AE426082}
          Rounded = True
          Spacing = 0
          TabOrder = 1
          OnClick = DownButtonClick
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
    end
    object Panel2: TPanel
      Left = 319
      Top = 0
      Width = 484
      Height = 582
      Align = alClient
      Caption = 'Panel2'
      TabOrder = 1
      object Grid2: TcxGrid
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 476
        Height = 529
        Align = alClient
        Enabled = False
        TabOrder = 0
        OnEnter = GridEnter
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        object GridTableView2: TcxGridTableView
          Tag = 99
          Navigator.Buttons.CustomButtons = <>
          FilterBox.CustomizeDialog = False
          FilterBox.Visible = fvNever
          ScrollbarAnnotations.CustomAnnotations = <>
          OnFocusedRecordChanged = GridTableView2FocusedRecordChanged
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0 '#44148
              Kind = skCount
              Column = GridTableView2MenuName
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
          OptionsView.GroupByBox = False
          Styles.ContentEven = StyleEven
          object GridTableView2MenuCode: TcxGridColumn
            Tag = 98
            Caption = #47700#45684#53076#46300
            DataBinding.FieldName = 'CD_MENU_COURSE'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Focusing = False
            Width = 89
          end
          object GridTableView2MenuName: TcxGridColumn
            Tag = 98
            Caption = #47700#45684#47749
            DataBinding.FieldName = 'NM_MENU_COURSE'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.OnChange = EditPropertiesChange
            FooterAlignmentHorz = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 183
          end
          object GridTableView2SalePrice: TcxGridColumn
            Tag = 98
            Caption = #54032#47588#45800#44032
            DataBinding.ValueType = 'Currency'
            DataBinding.FieldName = 'PR_SALE'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Focusing = False
            Width = 90
          end
          object GridTableView2Default: TcxGridColumn
            Tag = 98
            Caption = #44396#48516
            DataBinding.FieldName = 'YN_DEFAULT'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Items.Strings = (
              'N.'#49440#53469
              'Y.'#44592#48376)
            Properties.OnChange = EditPropertiesChange
            HeaderAlignmentHorz = taCenter
          end
          object GridTableView2Color: TcxGridColumn
            Tag = 98
            Caption = #48260#53948#49353#49345
            DataBinding.FieldName = 'COLOR'
            PropertiesClassName = 'TdxColorEditProperties'
            Properties.OnChange = EditPropertiesChange
            HeaderAlignmentHorz = taCenter
          end
          object GridTableView2Seq: TcxGridColumn
            Tag = 99
            DataBinding.FieldName = 'SEQ'
            Visible = False
          end
        end
        object GridLevel1: TcxGridLevel
          GridView = GridTableView2
        end
      end
      object UpDown2Panel: TAdvPanel
        Left = 1
        Top = 536
        Width = 482
        Height = 45
        Align = alBottom
        Color = clWhite
        Enabled = False
        TabOrder = 1
        UseDockManager = True
        Version = '2.5.11.0'
        BorderColor = clBlack
        Caption.Color = clHighlight
        Caption.ColorTo = clNone
        Caption.Font.Charset = HANGEUL_CHARSET
        Caption.Font.Color = clWindowText
        Caption.Font.Height = -13
        Caption.Font.Name = #47569#51008' '#44256#46357
        Caption.Font.Style = []
        Caption.Indent = 0
        DoubleBuffered = True
        StatusBar.Font.Charset = DEFAULT_CHARSET
        StatusBar.Font.Color = clWindowText
        StatusBar.Font.Height = -11
        StatusBar.Font.Name = 'Tahoma'
        StatusBar.Font.Style = []
        Text = ''
        DesignSize = (
          482
          45)
        FullHeight = 200
        object Up2Button: TAdvGlowButton
          Left = 10
          Top = 10
          Width = 113
          Height = 28
          Caption = #50948#47196
          FocusType = ftHot
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          Picture.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            6100000006624B474400FF00FF00FFA0BDA793000000CC49444154388D6360C0
            03229B0E5846361DB0C4A78609974444DB3E7311099105E252628B629A0ED8E2
            52C78C4BB3A888D822395919353E3E5EA1BF0CFF6C554C422F5CDABFE0114103
            9035C3C4F019C24C483321439889D18CCF104606060606DF86CD223CACBCEB04
            8504E08A050505F404F805F8191818183E7CFCF0F1FDFB0F976072EFDF7D60F8
            F2FB73D0E606DF378CB86C2B9873F581B4B4B43C030303C3D3A74F1F4E48D156
            C0A60E6734120B460D180C06B0E09278FBEEFDD16F5FBF1D66606060F8FEF327
            4E8B009F1A57305C8FCDAE0000000049454E44AE426082}
          Rounded = True
          Spacing = 0
          TabOrder = 0
          OnClick = Up2ButtonClick
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
        object Down2Button: TAdvGlowButton
          Left = 361
          Top = 10
          Width = 112
          Height = 28
          Anchors = [akTop, akBottom]
          Caption = #50500#47000#47196
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          Picture.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            6100000006624B474400FF00FF00FFA0BDA793000000C349444154388D6364C0
            0162BB8E2CE56467FFC7C0C0C0F0FDE74FA6C56536D1D8D4B1E032405848D05A
            5A5A5A9E818181E1E9D3A70F71A963C225412C1835603018C0C8C0C0C0E0DBB0
            59848795779DA090005C425050404F805F809F818181E1C3C70F1FDFBFFF7009
            26F7FEDD07862FBF3F076D6EF07DC308138CE9DA6B242C28B14C46465A1D9F8D
            4F9F3CBDF3FAE5ABD8A5358E27E02E20D61074CD1806E033049B66AC06603304
            97669C06201BC2C8C0C08C4B334110D974C032B2E980253E3500408B5B33EC05
            EDF40000000049454E44AE426082}
          Rounded = True
          Spacing = 0
          TabOrder = 1
          OnClick = Down2ButtonClick
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
    end
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
    object StyleBackGroundFocused: TcxStyle
      AssignedValues = [svColor]
      Color = clYellow
    end
  end
  object GridTableViewPopupMenu: TPopupMenu
    AutoHotkeys = maManual
    Images = ImageList
    OnPopup = GridTableViewPopupMenuPopup
    Left = 136
    Top = 164
    object GridTableViewPopupMenuCopy: TMenuItem
      Caption = #48373#49324
      ImageIndex = 0
      OnClick = GridTableViewPopupMenuCopyClick
    end
    object GridTableViewPopupMenuPaste: TMenuItem
      Caption = #48537#50668#45347#44592
      Enabled = False
      ImageIndex = 1
      OnClick = GridTableViewPopupMenuPasteClick
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
      end>
  end
end
