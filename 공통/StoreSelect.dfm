object StoreSelectForm: TStoreSelectForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #47588#51109#51012' '#49440#53469#54616#49464#50836
  ClientHeight = 723
  ClientWidth = 762
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    762
    723)
  PixelsPerInch = 96
  TextHeight = 20
  object SearchLabel: TLabel
    Left = 22
    Top = 67
    Width = 45
    Height = 20
    Caption = #44160#49353#50612
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Shape1: TShape
    Left = 12
    Top = 9
    Width = 734
    Height = 44
    Anchors = [akLeft, akTop, akRight]
    Brush.Color = 8208128
    Pen.Color = 8208128
  end
  object Label1: TLabel
    Left = 23
    Top = 15
    Width = 125
    Height = 20
    Caption = #47588#51109#51012' '#49440#53469#54616#49464#50836
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object SearchEdit: TcxTextEdit
    Left = 82
    Top = 64
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
    Width = 150
  end
  object Grid: TcxGrid
    Left = 12
    Top = 103
    Width = 734
    Height = 567
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 1
    OnEnter = GridEnter
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    RootLevelOptions.TabsForEmptyDetails = False
    object GridTableView: TcxGridTableView
      OnKeyDown = GridTableViewKeyDown
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
      OptionsView.ColumnAutoWidth = True
      OptionsView.DataRowHeight = 30
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      Preview.Visible = True
      Styles.OnGetContentStyle = GridTableViewStylesGetContentStyle
      Styles.Footer = FooterStyle
      Styles.Header = HeaderStyle
      object GridTableViewCode: TcxGridColumn
        Caption = #47588#51109#53076#46300
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.LineOptions.InnerColor = clWhite
        Properties.LineOptions.OuterColor = clWhite
        Properties.PenWidth = 0
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.IncSearch = False
        Options.Moving = False
        Width = 96
      end
      object GridTableViewName1: TcxGridColumn
        Caption = #47588#51109#51060#47492
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Moving = False
        Width = 305
      end
      object GridTableViewName2: TcxGridColumn
        Caption = #48376#49324
        DataBinding.FieldName = 'CD_COMPANY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 90
      end
      object GridTableViewName3: TcxGridColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 90
      end
      object GridTableViewName4: TcxGridColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 90
      end
      object GridTableViewName5: TcxGridColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 90
      end
      object GridTableViewName6: TcxGridColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 90
      end
      object GridTableViewName7: TcxGridColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 90
      end
      object GridTableViewName8: TcxGridColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 90
      end
      object GridTableViewName9: TcxGridColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 90
      end
      object GridTableViewName10: TcxGridColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 90
      end
      object GridTableViewName11: TcxGridColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 90
      end
      object GridTableViewName12: TcxGridColumn
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 90
      end
      object GridTableViewName13: TcxGridColumn
        Visible = False
      end
      object GridTableViewName14: TcxGridColumn
        Visible = False
      end
      object GridTableViewName15: TcxGridColumn
        Visible = False
      end
      object GridTableViewName16: TcxGridColumn
        Visible = False
      end
      object GridTableViewName17: TcxGridColumn
        Visible = False
      end
      object GridTableViewName18: TcxGridColumn
        Visible = False
      end
      object GridTableViewName19: TcxGridColumn
        Visible = False
      end
      object GridTableViewName20: TcxGridColumn
        Visible = False
      end
    end
    object GridLevel: TcxGridLevel
      GridView = GridTableView
    end
  end
  object OKButton: TAdvGlowButton
    Left = 524
    Top = 677
    Width = 108
    Height = 38
    Anchors = [akRight, akBottom]
    Caption = #54869#51064
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
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
      89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
      F8000000097048597300000B1300000B1301009A9C180000017249444154789C
      ED94BD4E02411485D70262A18F2016824F21168289BDD476200FA3D40A8F8054
      9606057F9E00FF1E41F107442B2D3E337A48D6756676092D27996467E6DC736E
      EEDCBB4130C3B400368106700F7C68DD0175A0388DF02AD0E517AF4013D8076A
      FA1EE8AE03E426155F97E803500652164E0AA8008FC00B909F247323DE039612
      F033E21A936C1283AEB28A158F98F481D320C1831A94BD440B805DC5167CA486
      CAF3AFE6360025604BDF6960081C5AC92299566C86F6F3C08247FC1338099DB5
      4C0BFB0C46C05E687F0C5C444D42E27FEED4C6239FC17BC4605B4257C062E4EC
      727C16E29B19798B2BD19125DB2FE01CD8B1651E29D1ADCFA0AE094D394CF088
      8F1FF9C06750FC91808AE5AE049C791EBDAAD80DA781881D0D5AC67237E78859
      069E80B6575CE49CC6BE673371885F03CFC04AAC8182F232E96B42D38E9A5795
      B9115F4B241E12C89A7F8BEA3A5487D4B45A3A336827CEDC615430E36FDA4F73
      62D68DE996D8079D2148806FFA4E500B3B37E3CC0000000049454E44AE426082}
    RepeatPause = 10
    TabOrder = 2
    OnClick = OKButtonClick
    Appearance.BorderColor = 8404992
    Appearance.BorderColorHot = 10079963
    Appearance.BorderColorDown = 4548219
    Appearance.BorderColorChecked = 4548219
    Appearance.Color = 8404992
    Appearance.ColorTo = 8404992
    Appearance.ColorChecked = 11918331
    Appearance.ColorCheckedTo = 7915518
    Appearance.ColorDisabled = clNone
    Appearance.ColorDisabledTo = clNone
    Appearance.ColorDown = 14643200
    Appearance.ColorDownTo = 4296947
    Appearance.ColorHot = 15465983
    Appearance.ColorHotTo = 11332863
    Appearance.ColorMirror = 6697728
    Appearance.ColorMirrorTo = 8404992
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
  object CancelButton: TAdvGlowButton
    Left = 638
    Top = 677
    Width = 108
    Height = 38
    Anchors = [akRight, akBottom]
    Caption = #45803#44592
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
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
      0D00000006624B474400FF00FF00FFA0BDA7930000019D49444154388DAD94BD
      4E945110869FD96C2F5B182BB4210645ACC12CD7602181E086CBE1E722D8D202
      A3855E83DE81CB9A5869048146EC48243C16CC678EDFEEF72109A7396766DE79
      CFFC9D03B7BCA2CDA87680C7C0FD547D030E22E2F246B7A83D7557FDE1E43A52
      77D4DE7F45A8AE006F81BBC00878077C49F343E079467D0ABC88880F6D91ADA8
      E7EA4F755D9D7661A81BEA5962FB6D699E26D9425B4912BF98A4C7EACC34C06E
      D6683DE56575A8760B4C3775CB290FD267BB4ED6C9067CAAD254F712BC9F44DD
      3CABEE15E91FA887FF94477D92C0AD5A34FB0569792EA3DE49FD02406598CDBD
      EA261171A1BE047E038354BF01061171512458F9CC02A34E7551C533A5FE755D
      936C19E1F7DCE7CA948157C01AF03AD56BC0A55A463957E3F8DB942375543465
      D8D29461E1379E684A1AABE26EA4BCD432364B296FD69B5912F6D4931CD6C509
      C024FEA9FA2BC7ED4E13A89FCFE92C87B6E9E96D26D9B9FAACB44F73E873351E
      F78031F01EF89CE679AE3E8779E018588D888FD765833AA36E67B1EBEB50DD6A
      4AF3BA0F368047C083547D05C61161B3D72DAF3FF31BF2C2E6E3BF0C00000000
      49454E44AE426082}
    RepeatPause = 10
    TabOrder = 3
    OnClick = CancelButtonClick
    Appearance.BorderColor = 8404992
    Appearance.BorderColorHot = 10079963
    Appearance.BorderColorDown = 4548219
    Appearance.BorderColorChecked = 4548219
    Appearance.Color = 8404992
    Appearance.ColorTo = 8404992
    Appearance.ColorChecked = 11918331
    Appearance.ColorCheckedTo = 7915518
    Appearance.ColorDisabled = clNone
    Appearance.ColorDisabledTo = clNone
    Appearance.ColorDown = 7778289
    Appearance.ColorDownTo = 4296947
    Appearance.ColorHot = 15465983
    Appearance.ColorHotTo = 11332863
    Appearance.ColorMirror = 6697728
    Appearance.ColorMirrorTo = 8404992
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
  object SearchButton: TAdvGlowButton
    Left = 640
    Top = 61
    Width = 106
    Height = 34
    Anchors = [akTop, akRight]
    Caption = #51312#54924
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
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
      0D00000006624B474400FF00FF00FFA0BDA7930000015C49444154388DAD94CF
      2B055114C7BF77BCC58B8DB2C44A6F497A1E1BDE2BA5947FC156B2B4F147283B
      F907442C51ACBD2CEC240B59288590FC080FF9D5C762CED434CD9B997A733667
      EEFD9EF3B9F7DC73EF48399B8B9B044A92A62555247549BA935497B4E69C7BC8
      4C070AC012F0836F37C009F068E31760262BCC019B96B8030C84340F98008E4D
      5FC8029CB3E065A0D951B403FBC01F50498279C035700A145216EE06DE81EDA4
      A061DBDD7C6A297EFC3AF00914A39A67BE64FE280BD0E28A927A9B01311F7B76
      3116C47951219838375FCE082C4BFA927419AB5A53AE80B30C4DE9013E80ADC4
      2581596BCC4ACAB5A903BFC0501AD0011B06DD0506435A1B3069AF06BB366389
      C050E222F06D89B70679B6F113D0B0EF37A01A65342BAD4FFECF614452A7A40B
      49879256E537644F5287A486A429E7DC41EA6E532A19055E43E58FB70434682D
      527E2D0F68B0D37BA0BF65A041ABB9C1E2EC1F05796D4F063E5E440000000049
      454E44AE426082}
    RepeatPause = 10
    TabOrder = 4
    OnClick = SearchButtonClick
    Appearance.BorderColor = 8404992
    Appearance.BorderColorHot = 10079963
    Appearance.BorderColorDown = 4548219
    Appearance.BorderColorChecked = 4548219
    Appearance.Color = 8404992
    Appearance.ColorTo = 8404992
    Appearance.ColorChecked = 11918331
    Appearance.ColorCheckedTo = 7915518
    Appearance.ColorDisabled = clNone
    Appearance.ColorDisabledTo = clNone
    Appearance.ColorDown = 7778289
    Appearance.ColorDownTo = 4296947
    Appearance.ColorHot = 15465983
    Appearance.ColorHotTo = 11332863
    Appearance.ColorMirror = 6697728
    Appearance.ColorMirrorTo = 8404992
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
  object CustomerButton: TAdvGlowButton
    Left = 12
    Top = 677
    Width = 114
    Height = 38
    Anchors = [akLeft, akBottom]
    Caption = #44032#47609#51216#44288#47532
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    FocusType = ftHot
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clWhite
    NotesFont.Height = -20
    NotesFont.Name = #47569#51008' '#44256#46357
    NotesFont.Orientation = 10
    NotesFont.Style = []
    ParentFont = False
    Picture.Data = {
      89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
      F800000006624B474400FF00FF00FFA0BDA793000002984944415448899DD54F
      8856551806F0DF99A6A819B4498682219DFE608ED4CA6C1121484404858B08C2
      1605054150E122DAB889901651CC428916B50917D1A255D6A6AC4D508113A644
      A01015C9189F598E4DA4536F8BF7CC70BD73E73AE3031FDFE1F2DCF7BCCF7B9E
      E7DCA2818828B84E3F2E9452162EC3E946446C8D88858818ACF0FB2B22F6AEA5
      E6702D3C848D98C0D152CADD2B34B0176311318933A594F397DB60A8FE6FC049
      1CC08F3DFC011EC10C9E58A50822623C227EAAEB9188B82322D647C46D11B121
      223645C48D11315139D311F1EC6A6A0F753CBB192F620A4F633B1EC74E3CBCEA
      AE2BCAA2021C29A54CAEE6A58898AECD7DD243FBAC947271B8E3E529BC8477F1
      280E639B3C9BB152CA5B95BA431AA30B0F611306CB36C028B6E07ADC8EA398C4
      3CC61BBCB7711CBF60338EC9717E59D7A8366DE1181EC39F38520B7F8C8BB8AA
      C59DC2DFB80B3F57A5DF36095D1B6CC53E4CE3497C847B7142DAF9B506F714E6
      AA8A7939C60BCD625D2E1AC618AEC17A5C8B75F20A196D71D7357857D7F72E51
      D9A560060FC8911CC6BFF800FFA9AE5B0BBA146CC3A77810EF63B74CF80B78A5
      C59D932339571BFAA336D4BBC13F989587F71BCEE34C2D72B6C59D9063DA8811
      DC2A47B684AE119D943918D4F51CBEAA9DB65DF443E51D97AE9B9187DDABE04E
      1C9441DA8F5D78154F614F8B7B4F55719FCCC8FD5551AF823919AEDFF1BD1CD3
      09FC2AC7D5C4E7382D73328B0FE539F42A98C57BA5946F70A872F6E36B7CD1E2
      EE92A9DF2DCFE11997A6BD53C166BC29477440BAEA16792F8DA3F9453B583B3E
      551B7BA32AEA55B0163C27EF9F97AB927DF24C7A152CDE456DBC63B98B5E97AE
      F94EBAE879E9AA2534BF07A72DF7F962F4CFCA242F62140B32335DB801379552
      064BD18F889115C8578452CA3CFC0F0811E8E6D02C63760000000049454E44AE
      426082}
    RepeatPause = 10
    TabOrder = 5
    Visible = False
    OnClick = CustomerButtonClick
    Appearance.BorderColor = 8404992
    Appearance.BorderColorHot = 10079963
    Appearance.BorderColorDown = 4548219
    Appearance.BorderColorChecked = 4548219
    Appearance.Color = 8404992
    Appearance.ColorTo = 8404992
    Appearance.ColorChecked = 11918331
    Appearance.ColorCheckedTo = 7915518
    Appearance.ColorDisabled = clNone
    Appearance.ColorDisabledTo = clNone
    Appearance.ColorDown = 7778289
    Appearance.ColorDownTo = 4296947
    Appearance.ColorHot = 15465983
    Appearance.ColorHotTo = 11332863
    Appearance.ColorMirror = 6697728
    Appearance.ColorMirrorTo = 8404992
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
  object cxStyleRepository1: TcxStyleRepository
    Left = 117
    Top = 242
    PixelsPerInch = 96
    object FooterStyle: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8208128
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      TextColor = clWhite
    end
    object HeaderStyle: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8208128
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      TextColor = clWhite
    end
    object StyleFontBlue: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      TextColor = 16744448
    end
  end
end
