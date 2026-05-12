object OrderBatchHelpForm: TOrderBatchHelpForm
  Left = 300
  Top = 120
  Caption = #49345#54408' '#51068#44292' '#51312#54924
  ClientHeight = 739
  ClientWidth = 886
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
  object ConditionPanel: TPanel
    Left = 0
    Top = 0
    Width = 886
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object ConditionSearchLabel: TLabel
      Left = 24
      Top = 17
      Width = 49
      Height = 17
      Caption = #44160' '#49353' '#50612
      Transparent = True
    end
    object ConditionSearchEdit: TcxTextEdit
      Left = 86
      Top = 12
      AutoSize = False
      ImeMode = imSHanguel
      ParentFont = False
      Properties.ImeMode = imSHanguel
      Style.StyleController = EditStyleController
      TabOrder = 0
      OnKeyDown = ConditionSearchEditKeyDown
      Height = 25
      Width = 175
    end
    object ConditionSearchButton: TAdvGlowButton
      Left = 266
      Top = 10
      Width = 110
      Height = 30
      Caption = #51312#54924'(F2)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      DisabledPicture.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000026449444154388DB5943D
        68144118869F6FF7B2974A30909080A60A9253B8E3D8B93256D621812B246802
        76A2752258A508686AB10F5888A4486ACB9323B23FC589E7612A252468131B7F
        58B8FD2C32BBACE7E544D0B71976BE9987F7FD6666E11F4B461555D509C3F02A
        306BA73E1A63BA2292FE15B0DD6E4F789EB70EAC01D303E51360C7F3BCED6AB5
        7AFA47601CC7D7D334DD0526812EB02F22EFADE32BC01250013E8B48D3F7FDD6
        B9400B7B097C57D5BBC698E722A2C535AA2A711CAFA8EA53605C446E14A139D0
        C6EC011EB0608C7933AC1D99A228AAAA6A0BF8E179DE7C16DFC91694CBE50D60
        D23AFB0DD66EB7278ADFBEEF7754F53E309524C97A36EFD8188EAAAE025D63CC
        F3618ECAE5F26618868F54354F658C7906F48035557572601445D7806955DD1B
        EC59A6344D05D888E378EFE0E0E002805DBB07CC04415001285987974404C771
        0E0182207828222B45A0AA4EDB71B1542ABD0EC370D918D353D54311C175DDCB
        C0DB339B8E93B91A79D10B4A543519D8A3B9C3344D8F4484344DE7001A8DC616
        B055240441F004B807BC181B1BBB53ABD5BEDAD87300FD7EFF28EFA131A60B9C
        88C872B1E94589481F78E0FBFECD0C660F6209386E341ADD1C68DFE60E5089E3
        7865183049924D63CCE3E2A18561780B980776B2F9DC4DA7D3B99824498FB3DB
        BFE0FB7E675413E338AEA569DA02BEB9AE3B5FAFD7BFE40E01AAD5EAA9883481
        71556D0541707B587C5575822058B5300F6866B05F1C668AA2684155778129CE
        2EEDBE88F46CB9A2AA8B36E627A0698C7955DC3FF4006CFCECF73533503E0676
        5CD7DD2E3A1B091C885711915900D7753FD4EBF577E7BDA6FFA29F74F9170538
        BE751D0000000049454E44AE426082}
      FocusType = ftHot
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Picture.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000019749444154388DB594BD
        4B02611CC7BF779EA767665A18A4080EBD4118412DDD56AD8D2D1259E0100DF9
        37B8B447041511545B353434D5144142350861903628F6262A6665DE79DE4B43
        50A687A057DFF1CBEFF93C9FE7E1E101FE3804002C6C5DAF3034C968017182CC
        ADF907031400787A5D332463B16A01CADC5B1E4080D402510B050010797EB8AB
        4D13E82AC6F33FC032CF8F38086DC09B2FE09F1FF99FEEB022894C116EBB09B7
        4F0584EE727517B33DEDE87798EB03DD761300A0DF61AE19AE9758AA60D16458
        6D37E1B1EB97B518EE9E3F60FF22055A4F4228CB301B757453866C4F3B2EE379
        D07A1ABE71E7771F8AA60D731BD7AB4D19EE5DA4305B010300B6AF1391E4ABAF
        214346AF83977582A175AA1BB5D294B129434E9054FB7741E41B7ED892ACE085
        13955034F3AB0F4533CA73AEB45B63582FA2A460E928AEB475D8711C7E4CDC24
        F31D265A67FC10243E95E376B6E787160900F06F86B70D146954831405D96635
        51DDDE5167E9309C75596C9D2D91D8FDC9533A3B791A1C13ABE71BFA62A6D723
        670A817CF999983A080E086A339F5E16A57DA7084D650000000049454E44AE42
        6082}
      RepeatPause = 10
      Rounded = False
      TabOrder = 1
      OnClick = ConditionSearchButtonClick
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
  object ButtonPanel: TPanel
    Left = 0
    Top = 431
    Width = 886
    Height = 308
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      886
      308)
    object ButtonOKButton: TAdvGlowButton
      Left = 677
      Top = 269
      Width = 93
      Height = 31
      Anchors = [akRight, akBottom]
      Caption = #54869#51064'(F5)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      DisabledPicture.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000026449444154388DB5943D
        68144118869F6FF7B2974A30909080A60A9253B8E3D8B93256D621812B246802
        76A2752258A508686AB10F5888A4486ACB9323B23FC589E7612A252468131B7F
        58B8FD2C32BBACE7E544D0B71976BE9987F7FD6666E11F4B461555D509C3F02A
        306BA73E1A63BA2292FE15B0DD6E4F789EB70EAC01D303E51360C7F3BCED6AB5
        7AFA47601CC7D7D334DD0526812EB02F22EFADE32BC01250013E8B48D3F7FDD6
        B9400B7B097C57D5BBC698E722A2C535AA2A711CAFA8EA53605C446E14A139D0
        C6EC011EB0608C7933AC1D99A228AAAA6A0BF8E179DE7C16DFC91694CBE50D60
        D23AFB0DD66EB7278ADFBEEF7754F53E309524C97A36EFD8188EAAAE025D63CC
        F3618ECAE5F26618868F54354F658C7906F48035557572601445D7806955DD1B
        EC59A6344D05D888E378EFE0E0E002805DBB07CC04415001285987974404C771
        0E0182207828222B45A0AA4EDB71B1542ABD0EC370D918D353D54311C175DDCB
        C0DB339B8E93B91A79D10B4A543519D8A3B9C3344D8F4484344DE7001A8DC616
        B055240441F004B807BC181B1BBB53ABD5BEDAD87300FD7EFF28EFA131A60B9C
        88C872B1E94589481F78E0FBFECD0C660F6209386E341ADD1C68DFE60E5089E3
        7865183049924D63CCE3E2A18561780B980776B2F9DC4DA7D3B99824498FB3DB
        BFE0FB7E675413E338AEA569DA02BEB9AE3B5FAFD7BFE40E01AAD5EAA9883481
        71556D0541707B587C5575822058B5300F6866B05F1C668AA2684155778129CE
        2EEDBE88F46CB9A2AA8B36E627A0698C7955DC3FF4006CFCECF73533503E0676
        5CD7DD2E3A1B091C885711915900D7753FD4EBF577E7BDA6FFA29F74F9170538
        BE751D0000000049454E44AE426082}
      FocusType = ftHot
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Picture.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA793000001C649444154388DCDD13F
        481B611806F0E7BB3BE35D4C1AD3A42655519142B142C1DAD2A09BA2AB741014
        1CEA226E82E2E66AA7E0D21228B86553B7A44B0B66AA37B4108A7430C484048D
        A1E0DF4BBDCBDD7D771D9498D034F28943DFED79E1FDC1F37DC03D0FA90EB31F
        9307CFBB1E188D0EBEA64E3A3990F18D8597895BF5C8E76CD6BE65DE7FC9DB2B
        5B7BE5371F9263F50C8EA90F008107DE8E3C71F4079DF17A283308003C47FE89
        0AAC58BA58C2F68F0200A0CBE774A40ACA27008E3B83E1E9BE9A6C1AE6E14655
        BE53E546F3FF813C47DAEE159C1BED765667E64F291B16A272114717143A059A
        79602AB21BA19AB2B4B938A4328165C3C26A3C078F3F80B6C762651F7AF868FE
        DB6E6660726D6784A972542EC2E30FC0E5146BF67D8166F2E259CF6B41728799
        C0A30BFA17F6AA9D60B09DC0EB16894B12434C950DEB06C99CDAE8F512F4B412
        C45216740AF04D9C87096CBAEE73AC02134F39283A104B59D0CCAB3D35AC7326
        B0C3C343D174644E1D302DE0D76FBB82A99A6E2B97AA5C0326F3E7643D914FD7
        C3388E0467863B5CEFE239B87D01E471F396AAA6DBDF7FEECB542B2D937AC78D
        66726D47122477B845124382C0B752939E2997AA4CB5D2F2E6E290FA071184BE
        EF3C66C5FA0000000049454E44AE426082}
      RepeatPause = 10
      Rounded = False
      TabOrder = 0
      OnClick = ButtonOKButtonClick
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
    object ButtonCloseButton: TAdvGlowButton
      Left = 782
      Top = 269
      Width = 88
      Height = 31
      Anchors = [akRight, akBottom]
      Caption = #45803#44592
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      DisabledPicture.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000026449444154388DB5943D
        68144118869F6FF7B2974A30909080A60A9253B8E3D8B93256D621812B246802
        76A2752258A508686AB10F5888A4486ACB9323B23FC589E7612A252468131B7F
        58B8FD2C32BBACE7E544D0B71976BE9987F7FD6666E11F4B461555D509C3F02A
        306BA73E1A63BA2292FE15B0DD6E4F789EB70EAC01D303E51360C7F3BCED6AB5
        7AFA47601CC7D7D334DD0526812EB02F22EFADE32BC01250013E8B48D3F7FDD6
        B9400B7B097C57D5BBC698E722A2C535AA2A711CAFA8EA53605C446E14A139D0
        C6EC011EB0608C7933AC1D99A228AAAA6A0BF8E179DE7C16DFC91694CBE50D60
        D23AFB0DD66EB7278ADFBEEF7754F53E309524C97A36EFD8188EAAAE025D63CC
        F3618ECAE5F26618868F54354F658C7906F48035557572601445D7806955DD1B
        EC59A6344D05D888E378EFE0E0E002805DBB07CC04415001285987974404C771
        0E0182207828222B45A0AA4EDB71B1542ABD0EC370D918D353D54311C175DDCB
        C0DB339B8E93B91A79D10B4A543519D8A3B9C3344D8F4484344DE7001A8DC616
        B055240441F004B807BC181B1BBB53ABD5BEDAD87300FD7EFF28EFA131A60B9C
        88C872B1E94589481F78E0FBFECD0C660F6209386E341ADD1C68DFE60E5089E3
        7865183049924D63CCE3E2A18561780B980776B2F9DC4DA7D3B99824498FB3DB
        BFE0FB7E675413E338AEA569DA02BEB9AE3B5FAFD7BFE40E01AAD5EAA9883481
        71556D0541707B587C5575822058B5300F6866B05F1C668AA2684155778129CE
        2EEDBE88F46CB9A2AA8B36E627A0698C7955DC3FF4006CFCECF73533503E0676
        5CD7DD2E3A1B091C885711915900D7753FD4EBF577E7BDA6FFA29F74F9170538
        BE751D0000000049454E44AE426082}
      FocusType = ftHot
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Picture.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000022549444154388DAD94CD
        4E135118869F6FCED0B2681A20113551D74517FE403110ACA134E20574ADF126
        9034C62046A92EB903F7DE8091526B1B135A886CA86C3506221B20C0A2ED9C39
        2E86C1E954FE12BEDD79CF9BE77C7F3970C121275D9A19ACFD6F4337AD96BA01
        E076E95FB1D1E5BACCE09E0BB83B39D2A7B49EC2F014B812BADEC4C807A7D9F5
        BEA752D93E15B8974EA604F98870E9A4EC812D17B2F142B57C2C702F9D4C89C8
        6720720ACC8FA60B9920F408B83B39D2A75A7AFD0C997564EA342209BF7CCB57
        95A39F87616A7018940A08CAD3DAA3DF8EB4A6FC8305DE3481276158777E9E68
        6ED6832A4534374B777EBE132AE6D921031BE0A032720B74DB34F5F7659CC54F
        D8138FC1B2C071B01F6670BE2EA25757C2595EDE2F2507A0B6660388DBBA66C4
        6AB7B82E8D77AF40043B3D0980532ED278F302B40E03118BEBC09A57B288E970
        1C39E5E4F33FDD80DF43657E77182C8BE8F40CF6F8239C72D12BFFC138D1DC6B
        B0ED0EBBD11EC306888D2ED70FCAC39BC055DFA0EE0E79B0D2028DB72F0F4585
        9D9AC0B97D0FBD520DE23662C55A1D027BB89FBE3F8798E9E0AB6A70D81B80DF
        33A550770643300033172BD4726DC09DB1B15E3BDA5C07FAFFDFA463E34F4B37
        13BD5F567720B0D83D95CAB60B59A0790E58C315C9FAB0362040BC502DBB9001
        B6CE92992B92892F2C5582A21576C50BD5B2D38824309207363B396603CC5C4B
        371361189CE5832D25072C31DE072BEA67ACB0F443E0F8BDBDE8F80B58A1CCAD
        5F2025160000000049454E44AE426082}
      RepeatPause = 10
      Rounded = False
      TabOrder = 1
      OnClick = ButtonCloseButtonClick
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
    object AddGrid: TcxGrid
      AlignWithMargins = True
      Left = 8
      Top = 12
      Width = 874
      Height = 248
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object AddGridTableView: TcxGridTableView
        Tag = 99
        Navigator.Buttons.CustomButtons = <>
        FilterBox.CustomizeDialog = False
        FilterBox.Visible = fvNever
        OnCellDblClick = AddGridTableViewCellDblClick
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
        object AddGridTableViewGoodsClass: TcxGridColumn
          Caption = #48516#47448
          HeaderAlignmentHorz = taCenter
          Options.Focusing = False
          Width = 115
        end
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
        object AddGridTableViewOrderUnit: TcxGridColumn
          Caption = #48156#51452#45800#50948
          HeaderAlignmentHorz = taCenter
          Options.Focusing = False
          Width = 114
        end
        object AddGridTableViewNepumQty: TcxGridColumn
          Caption = #51077#49688
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Options.Focusing = False
        end
        object AddGridTableViewKeep: TcxGridColumn
          Caption = #48372#44288#48169#48277
          HeaderAlignmentHorz = taCenter
          Options.Focusing = False
          Width = 107
        end
        object AddGridTableViewOrderPrice: TcxGridColumn
          Caption = #48156#51452#45800#44032
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'PR_SALE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Focusing = False
          Width = 89
        end
        object AddGridTableViewOrderQty: TcxGridColumn
          Caption = #48156#51452#49688#47049
          DataBinding.ValueType = 'Integer'
          DataBinding.FieldName = 'QTY_BUY'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Width = 67
        end
        object AddGridTableViewDsTax: TcxGridColumn
          Tag = 99
          Caption = #49464#47924#44396#48516
          Visible = False
        end
      end
      object AddGridLevel: TcxGridLevel
        GridView = AddGridTableView
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 49
    Width = 886
    Height = 387
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      886
      387)
    object CommentLabel: TLabel
      Left = 11
      Top = 351
      Width = 410
      Height = 20
      Anchors = [akLeft, akBottom]
      Caption = #39'Ctrl+'#53364#47533#39', '#39'Shift+'#53364#47533#39#51004#47196' '#50668#47084' '#49345#54408#51012' '#49440#53469#54624' '#49688' '#51080#49845#45768#45796'.'
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object ButtonAddButton: TAdvGlowButton
      Left = 448
      Top = 341
      Width = 193
      Height = 39
      Anchors = [akLeft, akBottom]
      Caption = #52628#44032#8595'(F6)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      DisabledPicture.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000026449444154388DB5943D
        68144118869F6FF7B2974A30909080A60A9253B8E3D8B93256D621812B246802
        76A2752258A508686AB10F5888A4486ACB9323B23FC589E7612A252468131B7F
        58B8FD2C32BBACE7E544D0B71976BE9987F7FD6666E11F4B461555D509C3F02A
        306BA73E1A63BA2292FE15B0DD6E4F789EB70EAC01D303E51360C7F3BCED6AB5
        7AFA47601CC7D7D334DD0526812EB02F22EFADE32BC01250013E8B48D3F7FDD6
        B9400B7B097C57D5BBC698E722A2C535AA2A711CAFA8EA53605C446E14A139D0
        C6EC011EB0608C7933AC1D99A228AAAA6A0BF8E179DE7C16DFC91694CBE50D60
        D23AFB0DD66EB7278ADFBEEF7754F53E309524C97A36EFD8188EAAAE025D63CC
        F3618ECAE5F26618868F54354F658C7906F48035557572601445D7806955DD1B
        EC59A6344D05D888E378EFE0E0E002805DBB07CC04415001285987974404C771
        0E0182207828222B45A0AA4EDB71B1542ABD0EC370D918D353D54311C175DDCB
        C0DB339B8E93B91A79D10B4A543519D8A3B9C3344D8F4484344DE7001A8DC616
        B055240441F004B807BC181B1BBB53ABD5BEDAD87300FD7EFF28EFA131A60B9C
        88C872B1E94589481F78E0FBFECD0C660F6209386E341ADD1C68DFE60E5089E3
        7865183049924D63CCE3E2A18561780B980776B2F9DC4DA7D3B99824498FB3DB
        BFE0FB7E675413E338AEA569DA02BEB9AE3B5FAFD7BFE40E01AAD5EAA9883481
        71556D0541707B587C5575822058B5300F6866B05F1C668AA2684155778129CE
        2EEDBE88F46CB9A2AA8B36E627A0698C7955DC3FF4006CFCECF73533503E0676
        5CD7DD2E3A1B091C885711915900D7753FD4EBF577E7BDA6FFA29F74F9170538
        BE751D0000000049454E44AE426082}
      FocusType = ftHot
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Picture.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000019349444154388DD594CD
        6A5A4118869F39CE31F12F478F44498A58A181AC720109D904BC056F205790D2
        6DBBE9AE94E40A7A03EEBAB6145A68E9AA6D202B099880926334A206ABAD73CE
        74912A1AC536A88BBE303003DFF7F2CC3B3FB0600980D76FF29FA4CFA7E73152
        AE2B9E1DE6F62440BDD1DE5D041D80B128A38124C0CE76A6B36E4743F318D51A
        CDCE70512C951D3DA78AA5B2034BD8F272321C55ABEBB12A053DA56977BD99CD
        6B01032B30CE346138285831C544F1FF41F84BF5F972F99546AF89D20A534862
        AB51625EC2843F4FAF582A3B5B8F1F25FF4678AB14A7950FC46D89B86B0540A3
        A9553BEAE3F5376B02C10A1843BA942DC746FDF674CC2C9B3EE08E4AB09E0CC9
        27C18DE7FF9CE14F2D703A4D629639354F81C00E47B20FCAF0FB551F308764A3
        9485CBF7489F2F3161384B7EC33F6C1E980DE600AEE7551F74D1A22B169AE9DF
        A646536FB70A02E0EDBBCFAFD622C199974E200C859BB970CFF7539B76F2FE29
        972B37B5B34A252D66784CD551FE38B0110FBDB0C391AC69CA445FB9D59B76AB
        E0347EBC3CC93DEDFE065D3FDE452D52B04B0000000049454E44AE426082}
      RepeatPause = 10
      Rounded = False
      TabOrder = 0
      OnClick = ButtonAddButtonClick
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
    object ConditionDeleteButton: TAdvGlowButton
      Left = 657
      Top = 341
      Width = 184
      Height = 39
      Anchors = [akLeft, akBottom]
      Caption = #49325#51228#8593'(F4)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      DisabledPicture.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA7930000026449444154388DB5943D
        68144118869F6FF7B2974A30909080A60A9253B8E3D8B93256D621812B246802
        76A2752258A508686AB10F5888A4486ACB9323B23FC589E7612A252468131B7F
        58B8FD2C32BBACE7E544D0B71976BE9987F7FD6666E11F4B461555D509C3F02A
        306BA73E1A63BA2292FE15B0DD6E4F789EB70EAC01D303E51360C7F3BCED6AB5
        7AFA47601CC7D7D334DD0526812EB02F22EFADE32BC01250013E8B48D3F7FDD6
        B9400B7B097C57D5BBC698E722A2C535AA2A711CAFA8EA53605C446E14A139D0
        C6EC011EB0608C7933AC1D99A228AAAA6A0BF8E179DE7C16DFC91694CBE50D60
        D23AFB0DD66EB7278ADFBEEF7754F53E309524C97A36EFD8188EAAAE025D63CC
        F3618ECAE5F26618868F54354F658C7906F48035557572601445D7806955DD1B
        EC59A6344D05D888E378EFE0E0E002805DBB07CC04415001285987974404C771
        0E0182207828222B45A0AA4EDB71B1542ABD0EC370D918D353D54311C175DDCB
        C0DB339B8E93B91A79D10B4A543519D8A3B9C3344D8F4484344DE7001A8DC616
        B055240441F004B807BC181B1BBB53ABD5BEDAD87300FD7EFF28EFA131A60B9C
        88C872B1E94589481F78E0FBFECD0C660F6209386E341ADD1C68DFE60E5089E3
        7865183049924D63CCE3E2A18561780B980776B2F9DC4DA7D3B99824498FB3DB
        BFE0FB7E675413E338AEA569DA02BEB9AE3B5FAFD7BFE40E01AAD5EAA9883481
        71556D0541707B587C5575822058B5300F6866B05F1C668AA2684155778129CE
        2EEDBE88F46CB9A2AA8B36E627A0698C7955DC3FF4006CFCECF73533503E0676
        5CD7DD2E3A1B091C885711915900D7753FD4EBF577E7BDA6FFA29F74F9170538
        BE751D0000000049454E44AE426082}
      FocusType = ftHot
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Picture.Data = {
        89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
        0D00000006624B474400FF00FF00FFA0BDA793000001B849444154388DBD9241
        6B134118869FDD9DEE364E423709189B492CDA22781359B429F4E6B1BFC17FE0
        D17B2FDE72F322C583F5D08B2008F907810621E0D18388C430B19784D80D75D7
        DD1D3D4883A214D7A6BEC7996F9E79BE8F0F161C0B60F7F1F3D7C2B6C57940A9
        31E9EE83FB770540147DBDB3083B007B51A0D308807AAD3ABDB97ED53F0FE8ED
        FB8FD339704DD5A6F7B66E9F0B7812C553B880962F66863F673849695604C349
        CA70929EF9B85911342BBF227E039E16FCA9F8BF1A5A96F56F86268EF9B4BF4F
        AA35591C33F03C44A3C1A51BB7FCDC86C6CA283E79C4355FE295CBF3F3643CA6
        F2F2A078D86A157219EABD3D8ABE64797515AB54C2688DAD146E18723DCBC440
        A9F65F1B1A5750FE30A45AAB62954A2CEDEC90F5FB384140D2E9E01D1FE349B9
        99CB70C08F0F8CD664FD3E627B9BB4DBC5680D8023C44ABEC5765D006CA57082
        80B4DBC509026CA500C8D2F473AE45138D06C9788C1B86249D0E466BCCD111DF
        C290248A8866B39E05D07EFAE299BB2496CF82C98227EB2BFEC6E557076BEBF5
        2B054FCAF95D1245BC1B8EC2F84DBF66E56A19386CB50A52A9B627E5A6ED38BE
        C9B269349BF54E46A3875BBDDE97EFB680B1B99254D2560000000049454E44AE
        426082}
      RepeatPause = 10
      Rounded = False
      TabOrder = 1
      OnClick = ConditionDeleteButtonClick
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
    object Grid: TcxGrid
      AlignWithMargins = True
      Left = 8
      Top = 0
      Width = 874
      Height = 329
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object GridTableView: TcxGridTableView
        Tag = 99
        Navigator.Buttons.CustomButtons = <>
        FilterBox.CustomizeDialog = False
        FilterBox.Visible = fvNever
        OnCellDblClick = GridTableViewCellDblClick
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
        object GridTableViewGoodsClass: TcxGridColumn
          Caption = #48516#47448
          DataBinding.FieldName = 'NM_CLASS'
          HeaderAlignmentHorz = taCenter
          Options.Focusing = False
          Width = 128
        end
        object GridTableViewGoodsCode: TcxGridColumn
          Caption = #49345#54408#53076#46300
          DataBinding.FieldName = 'CD_GOODS'
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Focusing = False
          Width = 98
        end
        object GridTableViewGoodsName: TcxGridColumn
          Caption = #49345#54408#51060#47492
          DataBinding.FieldName = 'NM_GOODS'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Focusing = False
          Width = 181
        end
        object GridTableViewOrderUnit: TcxGridColumn
          Caption = #48156#51452#45800#50948
          DataBinding.FieldName = 'NM_UNIT'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Focusing = False
          Width = 101
        end
        object GridTableViewNepumQty: TcxGridColumn
          Caption = #51077#49688
          DataBinding.FieldName = 'QTY_NEPUM'
          HeaderAlignmentHorz = taCenter
          Options.Focusing = False
        end
        object GridTableViewKeepName: TcxGridColumn
          Caption = #48372#44288#48169#48277
          DataBinding.FieldName = 'NM_KEEP'
          HeaderAlignmentHorz = taCenter
          Options.Focusing = False
          Width = 93
        end
        object GridTableViewOrderPrice: TcxGridColumn
          Caption = #48156#51452#45800#44032
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
        object GridTableViewOrderQty: TcxGridColumn
          Caption = #48156#51452#49688#47049
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'QTY_ORDER'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Width = 80
        end
        object GridTableViewDsTax: TcxGridColumn
          Tag = 99
          Caption = #49464#47924#44396#48516
          Visible = False
        end
      end
      object GridLevel: TcxGridLevel
        GridView = GridTableView
      end
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
    Left = 119
    Top = 6
    PixelsPerInch = 96
  end
  object StyleRepository: TcxStyleRepository
    Scalable = True
    Left = 55
    Top = 134
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
