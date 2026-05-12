inherited HeadSetupForm: THeadSetupForm
  Caption = #54364#51456' '#54872#44221#49444#51221
  ClientHeight = 732
  ClientWidth = 1044
  ExplicitWidth = 1060
  ExplicitHeight = 771
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1044
    ExplicitWidth = 1044
    inherited ButtonToolBar: TAdvToolBar
      Left = 495
      ExplicitLeft = 495
      inherited ButtonToolBarSeparator1: TAdvToolBarSeparator
        Height = 27
        Visible = False
        ExplicitHeight = 27
      end
      inherited ButtonToolBarSearchButton: TAdvGlowButton
        Visible = False
      end
      inherited ButtonToolBarDeleteButton: TAdvGlowButton
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
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 25
  end
  object PageControl: TcxPageControl [2]
    Left = 0
    Top = 65
    Width = 1044
    Height = 667
    Align = alClient
    TabOrder = 3
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    ClientRectBottom = 667
    ClientRectRight = 1044
    ClientRectTop = 28
    object cxTabSheet1: TcxTabSheet
      Caption = ' '#44277#53685' '
      ImageIndex = 0
      object Label87: TLabel
        Left = 368
        Top = 177
        Width = 83
        Height = 17
        Caption = #47700#45684' '#48516#47448#45800#44228
        Transparent = True
      end
      object GoodsPrefixLabel: TLabel
        Left = 367
        Top = 209
        Width = 83
        Height = 17
        Caption = #47700#45684' '#49884#51089#49707#51088
        Transparent = True
      end
      object GoodsLengthLabel: TLabel
        Left = 554
        Top = 209
        Width = 52
        Height = 17
        Caption = #51204#52404#44600#51060
        Transparent = True
      end
      object Label136: TLabel
        Left = 367
        Top = 240
        Width = 109
        Height = 17
        Caption = #53216#54256#48264#54840' '#54532#47532#54589#49828
        Transparent = True
      end
      object Label3: TLabel
        Left = 554
        Top = 242
        Width = 52
        Height = 17
        Caption = #51204#52404#44600#51060
        Transparent = True
      end
      object Label56: TLabel
        Left = 21
        Top = 419
        Width = 140
        Height = 17
        Caption = #54924#50896#44396#48516' '#51312#51221' '#44396#47588#44592#44036
        Transparent = True
      end
      object Label1: TLabel
        Left = 367
        Top = 272
        Width = 109
        Height = 17
        Caption = #48156#51452#49345#54408' '#54532#47532#54589#49828
        Transparent = True
      end
      object Label2: TLabel
        Left = 554
        Top = 272
        Width = 52
        Height = 17
        Caption = #51204#52404#44600#51060
        Transparent = True
      end
      object Option057CheckBox: TcxCheckBox
        Left = 19
        Top = 8
        Caption = ' '#50500#51060#53596' '#47700#45684#47484' '#49324#50857#54633#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 0
      end
      object Option083CheckBox: TcxCheckBox
        Left = 19
        Top = 36
        Caption = ' '#44273#48764#44592' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 1
      end
      object Option164CheckBox: TcxCheckBox
        Left = 19
        Top = 65
        Caption = ' '#47700#45684#51032' '#54364#49884#49692#48264' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 2
      end
      object Option247CheckBox: TcxCheckBox
        Left = 19
        Top = 94
        Caption = ' '#47700#45684#48264#54840' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 3
      end
      object Option307CheckBox: TcxCheckBox
        Left = 19
        Top = 123
        Caption = ' '#44256#44061#49688' '#52628#51221#47700#45684' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 4
      end
      object Option019CheckBox: TcxCheckBox
        Left = 19
        Top = 152
        Caption = ' '#51116#44256' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 5
      end
      object Option020CheckBox: TcxCheckBox
        Left = 19
        Top = 182
        Caption = ' '#48393#49324#47308' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 6
      end
      object Option026CheckBox: TcxCheckBox
        Left = 19
        Top = 211
        Caption = ' '#54532#47536#53552#51032' '#49444#51221' '#52789#51004#47196#47564' '#51452#48169#51452#47928#49436#47484' '#52636#47141#54633#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 7
      end
      object Option258CheckBox: TcxCheckBox
        Left = 19
        Top = 238
        Caption = ' '#47700#45684#48324#47196' '#54252#51064#53944#47484' '#51201#47549#54633#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 8
      end
      object Option251CheckBox: TcxCheckBox
        Left = 19
        Top = 269
        Caption = ' '#54924#50896#44396#48516#48324' '#47700#45684#54624#51064#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 9
      end
      object Option254CheckBox: TcxCheckBox
        Left = 19
        Top = 298
        Caption = ' '#54392#46300' '#44592#45733#51012' '#49324#50857#54616#51648' '#50506#49845#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 10
      end
      object Option337CheckBox: TcxCheckBox
        Left = 19
        Top = 327
        Caption = ' '#54252#51109' '#49884' '#44273#48764#44592' '#45800#44032#47484' '#49324#50857#54633#45768#45796'. '
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 11
      end
      object Option079CheckBox: TcxCheckBox
        Left = 19
        Top = 357
        Caption = ' '#47700#45684#48324' '#44536#47353#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 12
      end
      object cxGroupBox22: TcxGroupBox
        Left = 368
        Top = 71
        Caption = ' '#49828#53596#54532' '
        ParentFont = False
        Style.StyleController = EditStyleController
        TabOrder = 13
        Height = 92
        Width = 232
        object Label168: TLabel
          Left = 19
          Top = 56
          Width = 101
          Height = 17
          Caption = #49828#53596#54532' '#49324#50857' '#48169#49885
          Transparent = True
        end
        object Option021CheckBox: TcxCheckBox
          Left = 14
          Top = 24
          Caption = ' '#49828#53596#54532' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 0
        end
        object Option406ComboBox: TcxComboBox
          Left = 130
          Top = 53
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #47700#45684#48324#54624#51064
            #44552#50529#54624#51064)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Text = #47700#45684#48324#54624#51064
          Width = 89
        end
      end
      object cxGroupBox15: TcxGroupBox
        Left = 368
        Top = 9
        Caption = ' '#51452#48169#47700#47784' '
        ParentFont = False
        Style.StyleController = EditStyleController
        TabOrder = 14
        Height = 56
        Width = 404
        object Option156ComboBox: TcxComboBox
          Left = 10
          Top = 21
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            '0. '#47700#45684#48324#47196' '#49324#50857#54616#51648' '#50506#49845#45768#45796'.'
            '1. '#47700#45684#48324#47196' '#49324#50857#54616#44256' '#51452#47928' '#49884' '#51452#48169#47700#47784#47484' '#49440#53469#54633#45768#45796'.'
            '2. '#47700#45684#48324#47196' '#49324#50857#54616#44256' '#51452#47928' '#49884' '#51452#48169#47700#47784#47484' '#49440#53469#54616#51648' '#50506#49845#45768#45796'.')
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 0
          Text = '0. '#47700#45684#48324#47196' '#49324#50857#54616#51648' '#50506#49845#45768#45796'.'
          Width = 378
        end
      end
      object Option248ComboBox: TcxComboBox
        Left = 464
        Top = 173
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #45824#48516#47448'(1'#45800#44228')'#47484' '#49324#50857#54633#45768#45796'.'
          #45824', '#51473#48516#47448'(2'#45800#44228')'#47484' '#49324#50857#54633#45768#45796'.'
          #45824', '#51473', '#49548#48516#47448'(3'#45800#44228')'#47484' '#49324#50857#54633#45768#45796'.'
          #45824', '#51473', '#49548', '#49464#48516#47448'(4'#45800#44228')'#47484' '#49324#50857#54633#45768#45796'.')
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 15
        Text = #45824#48516#47448'(1'#45800#44228')'#47484' '#49324#50857#54633#45768#45796'.'
        Width = 257
      end
      object Option010CheckBox: TcxCheckBox
        Left = 19
        Top = 385
        Caption = ' '#54364#51456#47700#45684#50640#49436' '#51452#48169#51012' '#49444#51221#54633#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 16
      end
      object MenuPrefixEdit: TcxCurrencyEdit
        Left = 497
        Top = 206
        EditValue = 28.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.DisplayFormat = '00'
        Properties.MaxLength = 2
        Properties.MaxValue = 29.000000000000000000
        Properties.MinValue = 20.000000000000000000
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 17
        Width = 36
      end
      object MenuLengthComboBox: TcxComboBox
        Left = 612
        Top = 204
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '8'
          '13')
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 18
        Text = '8'
        Width = 41
      end
      object CouponPrefixEdit: TcxMaskEdit
        Left = 497
        Top = 237
        Properties.Alignment.Horz = taCenter
        Properties.EditMask = '!99;1;_'
        Properties.MaxLength = 0
        Properties.OnChange = EditPropertiesChange
        TabOrder = 19
        Text = '29'
        Width = 36
      end
      object CouponLengthEdit: TcxSpinEdit
        Left = 612
        Top = 237
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.MaxValue = 30.000000000000000000
        Properties.MinValue = 16.000000000000000000
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 20
        Value = 16
        Width = 43
      end
      object SmsUserGroupBox: TcxGroupBox
        Left = 368
        Top = 305
        Caption = ' '#47928#51088#48156#49569
        ParentFont = False
        Style.StyleController = EditStyleController
        TabOrder = 23
        Height = 137
        Width = 305
        object AppIDLabel: TLabel
          Left = 47
          Top = 33
          Width = 39
          Height = 17
          Alignment = taRightJustify
          Caption = #50500#51060#46356
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object AppPWDLabel: TLabel
          Left = 34
          Top = 62
          Width = 52
          Height = 17
          Alignment = taRightJustify
          Caption = #48708#48128#48264#54840
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label48: TLabel
          Left = 9
          Top = 93
          Width = 83
          Height = 17
          Alignment = taRightJustify
          Caption = #54869#51064' '#48708#48128#48264#54840
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object AppIDEdit: TcxTextEdit
          Left = 100
          Top = 28
          ParentFont = False
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 20
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 113
        end
        object AppPWDEdit: TcxTextEdit
          Left = 100
          Top = 59
          ParentFont = False
          Properties.EchoMode = eemPassword
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 30
          Properties.PasswordChar = '*'
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 113
        end
        object AppPWDConfirmEdit: TcxTextEdit
          Left = 100
          Top = 90
          ParentFont = False
          Properties.EchoMode = eemPassword
          Properties.ImeMode = imSAlpha
          Properties.MaxLength = 30
          Properties.PasswordChar = '*'
          Style.StyleController = EditStyleController
          TabOrder = 2
          Width = 113
        end
        object AppIDDupCheckButton: TAdvGlowButton
          Left = 215
          Top = 27
          Width = 80
          Height = 28
          Caption = #51473#48373#52404#53356
          DisabledPicture.Data = {
            89504E470D0A1A0A0000000D494844520000001100000011080400000091648F
            71000000097048597300000B1300000B1301009A9C1800000319694343505068
            6F746F73686F70204943432070726F66696C65000078DA6360609EE0E8E2E4CA
            24C0C050505452E41EE418191119A5C07E9E818D819981818181812131B9B8C0
            3120C087818181212F3F2F9501037CBBC6C0C8C0C0C07059D7D1C5C9958134C0
            9A5C5054C2C0C070808181C12825B538998181E10B0303437A79494109030363
            0C03038348527641090303630103038348764890330303630B0303134F496A45
            0903030383737E416551667A468982A1A5A5A582634A7E52AA42706571496A6E
            B182675E727E51417E5162496A0A030303D40E060606065E97FC1205F7C4CC3C
            05435355062A8388C82805F4F0418821407269511984C5C8C0C0C020C0A0C5E0
            C750C9B08AE101A3346314E33CC6A74C864C0D4C979835981B99EFB2D8B0CC63
            6566CD66BDCAE6C4B6895D857D2687004727272B67331733571B3737F7441E29
            9EA5BCC6BC87F882F99EF1570B0809AC1674137C24D428AC287C58245D945774
            AB589C38A7F85689144961C9A35215D2BAD24F64E6C886CA09CA9D95EF51F051
            E455BCA03445394A4549E5B5EA56B546753F0D598DB79AFBB4266AA7EA58EB0A
            E9BED23BA23FDFA0C630CAC8D258D2F8B7C93DD3C3662BCCFB2D2A2C13AD7CAC
            2D6C546D45EC58ECBEDA3F77B8ED78C1E998F35E97ADAEEBDD56BA2FF558E4B9
            D06B81F7429FC5BECBFC56F9AF0FD81AB837E858F0F9905BA1CFC2BE4430450A
            4629451BC7B8C546C5E5C5B724CC4EDC9C7436F9792A539A5CBA4D46546655D6
            ACEC3D39F7F298F2D50B7C0A8B8B66171F2E795B2651EE52515839AFEA6CF5DF
            5ABDBAF8FA490DC71A7F371BB4A4B7CE6BBBDE21D8E9DDD5DE7DB897A1CFBEBF
            6EC2BE89FF273B4E699D7A623AEF8CE099B3663D9AA335B764DEBE055C0BC316
            2D5EFC71A9C3B209CB1FAE345ED5BAFAE65ADD754DEB6F6E34D8D4B1F9C156AB
            6D53B77FD8E9BB6BD51E8EBDE9FB8E1F503FD879E8F511BFA39B8F8B9FA83DF9
            E4B4F7992DE764CFB75FF87429EEF2A9AB16D796DD10BDD97AEBEB9DF4BB37EF
            FB3C38F0C8F4F1EAA78ACF66BE107CD9F59AF94DDDDB9FEF4B3F7CFA54F0F9DD
            D7BC6FEF7EE4FFFCF0BBF8CFB77F55FFFF03002ABF1D8AF36F515B0000002063
            48524D00007A25000080830000F9FF000080E9000075300000EA6000003A9800
            00176F925FC546000002104944415478DA74915B4853711CC7BFE7ECBFB533F3
            A8CDE6695E161B436B31E77A709322A156446FDDA097E82128E8424981203DB4
            E7C22E463D8821BDD8D3E82215A10405163E95D918A2938439D8C576763B3B3B
            E7FC7A10E9A9CFF387CFCB876370C38320DC788184FBFE23F3B65BD79D713FCA
            90B1800C8A600040003434423A80C31ADF1256E306085BF01C001DC66EDB404E
            28E9455DD614C3EA122F70FEFA9602E860A1DEF18129E7D9BA4A9AA1F0C2FE91
            33CF4393CDA7375BCC000B9C181FF401EA2163C6ACE9A45A536E86BE007B92A8
            E6A6019E13C343477D49DC2D7E7C2B2802B35A4C99D763D1D4325C8EFE287501
            BCDD7FE464092F372687AB6F44AB9D49E61D66F5D5BBABD3AB32A460CB3180EF
            08480D4B343B559968ADCB6ACAC8E8A59A44F5D8DC58A25A475B1060D626037F
            360AEFA1C8C87F8E3E36F1C94F163094677F5F6CEF69B001ACAC97E110BC9D45
            78904F2F8F00ED68850892ECA2009301F0E9B535340AC72F9F3AC870053EF4E0
            3C72E0BCA19B2E2743210DB0ECFCFC92D7DBBBAFED69E541F94B24A5E815C71E
            7FE446D7A08EF5CACA0CC0C1D471EDF6681816902227567FD4B59DDD4D7B8D66
            0D05DC7BF66D88AA0078D133FA50FF4939AA508DCAB44E2BF49D621489F19D9B
            FF6002BFDD79E9DCDC84F68BF294A7247DA0E1C5EE3B82C4012070801904E2C8
            25F67BFA5CBB2C5C361B5FCC7FAD256C5A153A08DCBFE9FFE3EF0011DCE32248
            23B4CF0000000049454E44AE426082}
          FocusType = ftHot
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          Picture.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            6100000006624B474400FF00FF00FFA0BDA7930000021C49444154388D8D93CD
            6B135114C5CF7B4DD2346926C9249D44622435DAD260880B8B685D8A2B0D4417
            D9585DB870698916FD17228AB80BB810B4E02AB45015BA10975D9414AC16249A
            0C98069CC9E7343171C632E3A29D36E6A3F56C1EEFDEF33BDCF7E012F4512C99
            99B2B2E69B2683C103008AB223488DF6EBE507E7BE767B49E7259E5A8F3023B6
            A4CFE3BAC0B9188692DDB6AA692855B6A5E2CFD26AA5AE3C4CCF85377A02E2A9
            CFD7035EF7D3F1E35CA0DF54BAF25B225F106A893777434BFB01F1D47A24E03D
            B67414AC2B5710F8EF3F4AD1C57B912F14006CE6D127FF035B8CBB67D0EF1977
            3BAD4900A0B1679929BFD73D7D147CE904C1D509BAFF661FE7988926D726E9A8
            D53C3BE662EC87C1337E82D32CC1475E85B657E35887DDE6B0CC529371C8A3FF
            360038CDBDF029966039ABA2D43AA8534A60321A3C146448D58B361370234411
            1A23FFC0EFBEA928B7D02342A86690FF28A2AA69A084A0A1001FF21A2E9F2408
            3A01766430ACAA1A645916E8AFEAEF8552655BD21B7C5DC34A4E83D34CF07E00
            0C006259AA37A4F60201803B2FB32BD3E1E0954E8381023B6A7F1800329BB9B7
            2F6E4F5CA3005097E4F9FC96C8771A0E837305215FADB41E01000580F45C78A3
            20D412B982C00FC60EE0A2504BA413673781AE658A3DFF74C66DB73CF6799D17
            39D661A7746F99540D6259AA17C5F26AB5DA9ED7E19E005DD1E4DA24E3B0DC1A
            1E367100A0C88AD06C365F2DDE3F9FEDF6FE057F69CBDF60A52AEC0000000049
            454E44AE426082}
          Rounded = True
          Transparent = True
          TabOrder = 3
          OnClick = AppIDDupCheckButtonClick
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
        object AppUserSaveButton: TAdvGlowButton
          Left = 216
          Top = 90
          Width = 80
          Height = 26
          Caption = #51200#51109
          DisabledPicture.Data = {
            89504E470D0A1A0A0000000D494844520000001100000011080400000091648F
            71000000097048597300000B1300000B1301009A9C1800000319694343505068
            6F746F73686F70204943432070726F66696C65000078DA6360609EE0E8E2E4CA
            24C0C050505452E41EE418191119A5C07E9E818D819981818181812131B9B8C0
            3120C087818181212F3F2F9501037CBBC6C0C8C0C0C07059D7D1C5C9958134C0
            9A5C5054C2C0C070808181C12825B538998181E10B0303437A79494109030363
            0C03038348527641090303630103038348764890330303630B0303134F496A45
            0903030383737E416551667A468982A1A5A5A582634A7E52AA42706571496A6E
            B182675E727E51417E5162496A0A030303D40E060606065E97FC1205F7C4CC3C
            05435355062A8388C82805F4F0418821407269511984C5C8C0C0C020C0A0C5E0
            C750C9B08AE101A3346314E33CC6A74C864C0D4C979835981B99EFB2D8B0CC63
            6566CD66BDCAE6C4B6895D857D2687004727272B67331733571B3737F7441E29
            9EA5BCC6BC87F882F99EF1570B0809AC1674137C24D428AC287C58245D945774
            AB589C38A7F85689144961C9A35215D2BAD24F64E6C886CA09CA9D95EF51F051
            E455BCA03445394A4549E5B5EA56B546753F0D598DB79AFBB4266AA7EA58EB0A
            E9BED23BA23FDFA0C630CAC8D258D2F8B7C93DD3C3662BCCFB2D2A2C13AD7CAC
            2D6C546D45EC58ECBEDA3F77B8ED78C1E998F35E97ADAEEBDD56BA2FF558E4B9
            D06B81F7429FC5BECBFC56F9AF0FD81AB837E858F0F9905BA1CFC2BE4430450A
            4629451BC7B8C546C5E5C5B724CC4EDC9C7436F9792A539A5CBA4D46546655D6
            ACEC3D39F7F298F2D50B7C0A8B8B66171F2E795B2651EE52515839AFEA6CF5DF
            5ABDBAF8FA490DC71A7F371BB4A4B7CE6BBBDE21D8E9DDD5DE7DB897A1CFBEBF
            6EC2BE89FF273B4E699D7A623AEF8CE099B3663D9AA335B764DEBE055C0BC316
            2D5EFC71A9C3B209CB1FAE345ED5BAFAE65ADD754DEB6F6E34D8D4B1F9C156AB
            6D53B77FD8E9BB6BD51E8EBDE9FB8E1F503FD879E8F511BFA39B8F8B9FA83DF9
            E4B4F7992DE764CFB75FF87429EEF2A9AB16D796DD10BDD97AEBEB9DF4BB37EF
            FB3C38F0C8F4F1EAA78ACF66BE107CD9F59AF94DDDDB9FEF4B3F7CFA54F0F9DD
            D7BC6FEF7EE4FFFCF0BBF8CFB77F55FFFF03002ABF1D8AF36F515B0000002063
            48524D00007A25000080830000F9FF000080E9000075300000EA6000003A9800
            00176F925FC546000002104944415478DA74915B4853711CC7BFE7ECBFB533F3
            A8CDE6695E161B436B31E77A709322A156446FDDA097E82128E8424981203DB4
            E7C22E463D8821BDD8D3E82215A10405163E95D918A2938439D8C576763B3B3B
            E7FC7A10E9A9CFF387CFCB876370C38320DC788184FBFE23F3B65BD79D713FCA
            90B1800C8A600040003434423A80C31ADF1256E306085BF01C001DC66EDB404E
            28E9455DD614C3EA122F70FEFA9602E860A1DEF18129E7D9BA4A9AA1F0C2FE91
            33CF4393CDA7375BCC000B9C181FF401EA2163C6ACE9A45A536E86BE007B92A8
            E6A6019E13C343477D49DC2D7E7C2B2802B35A4C99D763D1D4325C8EFE287501
            BCDD7FE464092F372687AB6F44AB9D49E61D66F5D5BBABD3AB32A460CB3180EF
            08480D4B343B559968ADCB6ACAC8E8A59A44F5D8DC58A25A475B1060D626037F
            360AEFA1C8C87F8E3E36F1C94F163094677F5F6CEF69B001ACAC97E110BC9D45
            78904F2F8F00ED68850892ECA2009301F0E9B535340AC72F9F3AC870053EF4E0
            3C72E0BCA19B2E2743210DB0ECFCFC92D7DBBBAFED69E541F94B24A5E815C71E
            7FE446D7A08EF5CACA0CC0C1D471EDF6681816902227567FD4B59DDD4D7B8D66
            0D05DC7BF66D88AA0078D133FA50FF4939AA508DCAB44E2BF49D621489F19D9B
            FF6002BFDD79E9DCDC84F68BF294A7247DA0E1C5EE3B82C4012070801904E2C8
            25F67BFA5CBB2C5C361B5FCC7FAD256C5A153A08DCBFE9FFE3EF0011DCE32248
            23B4CF0000000049454E44AE426082}
          FocusType = ftHot
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          Picture.Data = {
            89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
            0D00000006624B474400FF00FF00FFA0BDA7930000018B49444154388DCD93B1
            2F03511CC73FEFAE3D776D6911C160692C8D70431783D1223689D9264C56F11F
            18C5C2E81F2061B030904E42440C064C12B922B47A55AABD6740DDE9A936217C
            A6F7DEEFFBFBE6FDBE2F0FFE3BE27D915C3E1F728A85D1D243C60418EC14DD31
            0DC32D0EAA4A3E6C686980DD6B63FFAEA81DEE4DF7AEB935818AB3E30C239DD9
            52210F40A2C5201E532BC26C26C3FAC63AA66932306092BA098D3842CAE4D2D9
            CCC154EFE2BB4EA97794C2E323C74747A42DCB33A1402E24974FC71B36AC8110
            0E7D5F185622A52CBD1543D7E9374D3ABBBA5EEB2EAD9B807BA36A3A5A4B3BB2
            5C66DB02EBC97155DB888F4C622B0A9B6995DBA28A1F81CF07C15014801B60E7
            DEB7A7263F91A107CF0D131D4DAC8CF57C914E35129858BDE0E4EAC9DF301454
            10C0F55D96AC9DAF69168D84E9688D120A7A87ACCA1020D61CA1396CF8952AA8
            4A9D8F0290C9D975DFB02E4343D710DF04A93769BEE7BFFBCA97B967B6CEEDB7
            0FE39FD10765903697B9677F43A1CA94952BCDCF6D5955ADDF2154996AB8E9CF
            7801CA5471BB7172CBF30000000049454E44AE426082}
          Rounded = True
          Transparent = True
          TabOrder = 4
          OnClick = AppUserSaveButtonClick
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
      object Option031ComboBox: TcxComboBox
        Left = 169
        Top = 414
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #51648#51221#50504#54632
          #52572#44540' 1'#44060#50900
          #52572#44540' 3'#44060#50900
          #52572#44540' 6'#44060#50900
          #52572#44540' 1'#45380)
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 24
        Width = 131
      end
      object GoodsPrefixEdit: TcxCurrencyEdit
        Left = 497
        Top = 269
        EditValue = 28.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.AssignedValues.MinValue = True
        Properties.DisplayFormat = '00'
        Properties.MaxLength = 2
        Properties.MaxValue = 99.000000000000000000
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 21
        Width = 36
      end
      object GoodsLengthComboBox: TcxComboBox
        Left = 612
        Top = 267
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '8'
          '13')
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 22
        Text = '8'
        Width = 41
      end
    end
    object KioskTabSheet: TcxTabSheet
      Caption = ' '#53412#50724#49828#53356#44288#47144' '
      ImageIndex = 2
      OnShow = KioskTabSheetShow
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label198: TLabel
        Left = 35
        Top = 48
        Width = 26
        Height = 17
        Caption = #49828#53416
      end
      object Option403CheckBox: TcxCheckBox
        Left = 23
        Top = 10
        Caption = ' '#53412#50724#49828#53356' '#44592#45733#51012' '#49324#50857#54633#45768#45796'.'
        ParentFont = False
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 0
      end
      object cxGroupBox20: TcxGroupBox
        Left = 400
        Top = 252
        Caption = ' PLU '#47700#45684
        TabOrder = 4
        Height = 98
        Width = 365
        object Label183: TLabel
          Left = 21
          Top = 61
          Width = 57
          Height = 17
          Caption = #54364#49884' '#44079#49688
        end
        object Label184: TLabel
          Left = 161
          Top = 60
          Width = 14
          Height = 17
          Caption = ' '#215
        end
        object Option429SpinEdit: TcxSpinEdit
          Left = 115
          Top = 57
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.MaxValue = 9.000000000000000000
          Properties.MinValue = 1.000000000000000000
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Value = 1
          Width = 44
        end
        object Option430SpinEdit: TcxSpinEdit
          Left = 181
          Top = 58
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.MaxValue = 9.000000000000000000
          Properties.MinValue = 1.000000000000000000
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 2
          Value = 1
          Width = 44
        end
        object Option428CheckBox: TcxCheckBox
          Left = 18
          Top = 27
          Caption = ' '#51204#52404#47484' '#44536#47353#47700#45684#47196' '#49324#50857#54633#45768#45796
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 0
        end
      end
      object Option458ComboBox: TcxComboBox
        Left = 78
        Top = 43
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #49324#50857#50504#54632
          'Blue'
          'Black'
          'Red'
          'Green')
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 3
        Text = #49324#50857#50504#54632
        Width = 105
      end
      object cxGroupBox25: TcxGroupBox
        Left = 399
        Top = 10
        Caption = ' '#45796#44397#50612' '
        TabOrder = 5
        Height = 229
        Width = 315
        object LanguageCheckListBox: TcxCheckListBox
          Left = 24
          Top = 71
          Width = 121
          Height = 142
          Items = <
            item
              Text = #48120#44397#50612
            end
            item
              Text = #51473#44397#50612
            end
            item
              Text = #51068#48376#50612
            end
            item
              Text = #48176#53944#45224#50612
            end
            item
              Text = #53468#44397#50612
            end
            item
              Text = #51064#46020#45348#49884#50500#50612
            end
            item
              Text = #54532#46993#49828#50612
            end
            item
              Text = #46021#51068#50612
            end>
          TabOrder = 0
          OnClick = EditPropertiesChange
        end
        object Option457CheckBox: TcxCheckBox
          Left = 21
          Top = 20
          Caption = ' '#45796#44397#50612' '#44592#45733#51012' '#49324#50857#54633#45768#45796
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
        end
        object Option485CheckBox: TcxCheckBox
          Left = 21
          Top = 42
          Caption = ' '#44397#44592#47484' '#53356#44172' '#54364#49884#54633#45768#45796
          ParentFont = False
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 2
        end
      end
      object KioskMainImageButton: TAdvGlowButton
        Left = 23
        Top = 345
        Width = 188
        Height = 31
        Caption = #47700#51064' '#51060#48120#51648
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
          0D00000006624B474400FF00FF00FFA0BDA7930000016449444154388DCD94BD
          4E02411446CFEC8F1014259A20B1A130341636165696BE83A5A56F2495B5EF60
          6362A926262616C604C10011352C985D777776198B1559703102C6F83533993B
          39F7BB377706FEBBC4FEE155F960B7B8F71BB0F249F5D89833B5F4F67A6EC9F2
          D44CB05C4A7074FA9036FA07963B9BBB5C2A5A8DEFAF25CB9170D9882ADA5A13
          64CC414C9B06D8B2158E8CC02D7BB8555301F3F391AB8C19EDE31A5B72F89158
          175F631913768A0981710E6508F716D43A10F6C627FB11F02D804A07FC10DC00
          AA5D903168DB85B3AAE2F625193854B2E542D306620EBC00AA1D282EC2A3ADB8
          7902A5A0D256F88160230F9A48003E398A6727B92F3284BB3634BB11ACAFFAAB
          42F6049B858492C7C1E2CA6705E648935AB6E2A23EC832D1D8E80256B302531F
          3E8FBFB289E75013505810A4F4E4F8670F4BCB93814B2B02C7876064AC0C5FF6
          DCEB86E74DEA540881A6E9BA0A82502938AF812F7B337E317FA1771FEE826AD0
          BD0CA80000000049454E44AE426082}
        RepeatPause = 10
        Rounded = False
        TabOrder = 1
        OnClick = KioskMainImageButtonClick
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
      object cxGroupBox1: TcxGroupBox
        Left = 20
        Top = 89
        Caption = ' '#45824#44592#51060#48120#51648' '
        Style.BorderColor = clWhite
        Style.BorderStyle = ebsSingle
        Style.Shadow = False
        TabOrder = 2
        Height = 243
        Width = 365
        object Grid: TcxGrid
          Left = 16
          Top = 26
          Width = 331
          Height = 168
          TabOrder = 0
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
          object GridTableView: TcxGridTableView
            Tag = 99
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsSelection.CellSelect = False
            OptionsView.GroupByBox = False
            object cxGridColumn1: TcxGridColumn
              Caption = #49692#48264
              DataBinding.ValueType = 'Integer'
              DataBinding.FieldName = 'SEQ'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.DisplayFormat = '#0'
              HeaderAlignmentHorz = taCenter
              Width = 67
            end
            object cxGridColumn2: TcxGridColumn
              Caption = #54868#51068#47749
              DataBinding.FieldName = 'NM_CODE1'
              HeaderAlignmentHorz = taCenter
              Width = 202
            end
          end
          object GridLevel: TcxGridLevel
            GridView = GridTableView
          end
        end
        object AddButton: TAdvGlowButton
          Left = 176
          Top = 200
          Width = 83
          Height = 31
          Caption = #52628#44032
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
            0D00000006624B474400FF00FF00FFA0BDA793000001F649444154388DCD9431
            6B93411CC67FFFBBD7D836B53A342643DFA4346DA424E8E41004290E12C44227
            C12FE02770092EEF64967E02677741078B83E0145A5AA1428B98465B63693485
            4A69D2B4C97BE790B65148ACC4223E70DC03070FBF7B8EFFC1FF2EC9E4F25ECB
            A907636EE8B097908FA54A006B9E00380073D9B4373DBB3073F54AEC5A2F81A5
            ADEDE5170FD35E2697F714309AC9E53DDF37915EC2007CDF448E6E3AAA80F5B9
            6CDAD35A957B0DD45A95E7B2690F58FFF78499712178EE0C096317857B49C5E4
            B09C0D214040C3CD98706742B810F84BC29F3532244C865AA4D56A9D7265875A
            ADFE0BA1734C383DBB300384BB85ED1EC09B0DCBDB4F3B2CAD1469FA16472B9A
            4D0322C3C6CAA21283731AA1B1F0EEAB6571CBB2F9ED3BF3CB05E26E8464C245
            0BF81656D74ABAB0517E8E55AF4FEDF0D97BC3FCA6C537B0B45224EE4648255C
            04B81C040192E32EF16818C4DE38E9D018063B056ED75A7B75BF4EC3B724136E
            C74A52135141387F42A8147BDDFA03D8ADEE13500A2D101A68AD4B7D6DAF051C
            51F6D40E8F3514ECA7610CBE85CA11B5566D8F858635F2C7B31CECEFC3D19AD5
            B552C7F395E2172B7020995C7E0A98525A258606FA7EFB1F1E1C3647EACDC6AD
            B191B0A412D1F62B174A7CF85CB618C9769FA72EBAFD78FEAE72EC53605023D6
            C70A963DD3D4F75F3DBAFEF20726BEF963A36A535F0000000049454E44AE4260
            82}
          RepeatPause = 10
          Rounded = False
          TabOrder = 1
          OnClick = AddButtonClick
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
        object DeleteButton: TAdvGlowButton
          Left = 265
          Top = 200
          Width = 83
          Height = 31
          Caption = #49325#51228
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
          TabOrder = 2
          OnClick = DeleteButtonClick
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
      object BarrierFreeWheelChairImageutton: TAdvGlowButton
        Left = 23
        Top = 382
        Width = 188
        Height = 31
        Caption = #51217#44540#49457'('#51200#51088#49464')'
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
          0D00000006624B474400FF00FF00FFA0BDA7930000016449444154388DCD94BD
          4E02411446CFEC8F1014259A20B1A130341636165696BE83A5A56F2495B5EF60
          6362A926262616C604C10011352C985D777776198B1559703102C6F83533993B
          39F7BB377706FEBBC4FEE155F960B7B8F71BB0F249F5D89833B5F4F67A6EC9F2
          D44CB05C4A7074FA9036FA07963B9BBB5C2A5A8DEFAF25CB9170D9882ADA5A13
          64CC414C9B06D8B2158E8CC02D7BB8555301F3F391AB8C19EDE31A5B72F89158
          175F631913768A0981710E6508F716D43A10F6C627FB11F02D804A07FC10DC00
          AA5D903168DB85B3AAE2F625193854B2E542D306620EBC00AA1D282EC2A3ADB8
          7902A5A0D256F88160230F9A48003E398A6727B92F3284BB3634BB11ACAFFAAB
          42F6049B858492C7C1E2CA6705E648935AB6E2A23EC832D1D8E80256B302531F
          3E8FBFB289E75013505810A4F4E4F8670F4BCB93814B2B02C7876064AC0C5FF6
          DCEB86E74DEA540881A6E9BA0A82502938AF812F7B337E317FA1771FEE826AD0
          BD0CA80000000049454E44AE426082}
        RepeatPause = 10
        Rounded = False
        TabOrder = 6
        OnClick = KioskMainImageButtonClick
        Appearance.BorderColor = 14727579
        Appearance.BorderColorHot = 10079963
        Appearance.BorderColorCheckedHot = 11565130
        Appearance.BorderColorDown = 4548219
        Appearance.BorderColorChecked = 4548219
        Appearance.BorderColorDisabled = 13948116
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
        Appearance.TextColorChecked = 3750459
        Appearance.TextColorDown = 2303013
        Appearance.TextColorHot = 2303013
        Appearance.TextColorDisabled = 13948116
      end
      object BarrierFreeLowVisionImageutton: TAdvGlowButton
        Left = 23
        Top = 419
        Width = 188
        Height = 31
        Caption = #51217#44540#49457'('#51200#49884#47141')'
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
          0D00000006624B474400FF00FF00FFA0BDA7930000016449444154388DCD94BD
          4E02411446CFEC8F1014259A20B1A130341636165696BE83A5A56F2495B5EF60
          6362A926262616C604C10011352C985D777776198B1559703102C6F83533993B
          39F7BB377706FEBBC4FEE155F960B7B8F71BB0F249F5D89833B5F4F67A6EC9F2
          D44CB05C4A7074FA9036FA07963B9BBB5C2A5A8DEFAF25CB9170D9882ADA5A13
          64CC414C9B06D8B2158E8CC02D7BB8555301F3F391AB8C19EDE31A5B72F89158
          175F631913768A0981710E6508F716D43A10F6C627FB11F02D804A07FC10DC00
          AA5D903168DB85B3AAE2F625193854B2E542D306620EBC00AA1D282EC2A3ADB8
          7902A5A0D256F88160230F9A48003E398A6727B92F3284BB3634BB11ACAFFAAB
          42F6049B858492C7C1E2CA6705E648935AB6E2A23EC832D1D8E80256B302531F
          3E8FBFB289E75013505810A4F4E4F8670F4BCB93814B2B02C7876064AC0C5FF6
          DCEB86E74DEA540881A6E9BA0A82502938AF812F7B337E317FA1771FEE826AD0
          BD0CA80000000049454E44AE426082}
        RepeatPause = 10
        Rounded = False
        TabOrder = 7
        OnClick = KioskMainImageButtonClick
        Appearance.BorderColor = 14727579
        Appearance.BorderColorHot = 10079963
        Appearance.BorderColorCheckedHot = 11565130
        Appearance.BorderColorDown = 4548219
        Appearance.BorderColorChecked = 4548219
        Appearance.BorderColorDisabled = 13948116
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
        Appearance.TextColorChecked = 3750459
        Appearance.TextColorDown = 2303013
        Appearance.TextColorHot = 2303013
        Appearance.TextColorDisabled = 13948116
      end
    end
    object LetsOrderTabSheet: TcxTabSheet
      Caption = ' '#47131#52768#50724#45908' '
      ImageIndex = 2
      OnShow = LetsOrderTabSheetShow
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object StoreImageButton: TAdvGlowButton
        Left = 27
        Top = 28
        Width = 134
        Height = 31
        Caption = #47588#51109#51060#48120#51648
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
          0D00000006624B474400FF00FF00FFA0BDA7930000016449444154388DCD94BD
          4E02411446CFEC8F1014259A20B1A130341636165696BE83A5A56F2495B5EF60
          6362A926262616C604C10011352C985D777776198B1559703102C6F83533993B
          39F7BB377706FEBBC4FEE155F960B7B8F71BB0F249F5D89833B5F4F67A6EC9F2
          D44CB05C4A7074FA9036FA07963B9BBB5C2A5A8DEFAF25CB9170D9882ADA5A13
          64CC414C9B06D8B2158E8CC02D7BB8555301F3F391AB8C19EDE31A5B72F89158
          175F631913768A0981710E6508F716D43A10F6C627FB11F02D804A07FC10DC00
          AA5D903168DB85B3AAE2F625193854B2E542D306620EBC00AA1D282EC2A3ADB8
          7902A5A0D256F88160230F9A48003E398A6727B92F3284BB3634BB11ACAFFAAB
          42F6049B858492C7C1E2CA6705E648935AB6E2A23EC832D1D8E80256B302531F
          3E8FBFB289E75013505810A4F4E4F8670F4BCB93814B2B02C7876064AC0C5FF6
          DCEB86E74DEA540881A6E9BA0A82502938AF812F7B337E317FA1771FEE826AD0
          BD0CA80000000049454E44AE426082}
        RepeatPause = 10
        Rounded = False
        TabOrder = 0
        OnClick = StoreImageButtonClick
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
      object TabletWaitImageGroupBox: TcxGroupBox
        Left = 27
        Top = 100
        Caption = ' '#53468#48660#47551' '#45824#44592#51060#48120#51648' '
        ParentFont = False
        Style.StyleController = EditStyleController
        TabOrder = 1
        Height = 285
        Width = 377
        object TableWaitImageLoadButton: TAdvGlowButton
          Left = 83
          Top = 240
          Width = 93
          Height = 31
          Caption = #52628#44032
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
            0D00000006624B474400FF00FF00FFA0BDA7930000025149444154388DCD94CD
            4B546114879FF7DE997B9B9B4EDA9858290DA808214120D2266C53415B89366D
            92D9F457B42A88FE83B0562148540BA9B611B49124ED4B52138D3ECC71C6D199
            B933F7EB7D5B8C7355E6A3DCF5830B97C339CFF99DF7BDF7C0FF2E517DB9BAAE
            BADC80EB48F40311340243E7D1E34EB10610A9C65D9F3101B7775BFCA314B83E
            0670A7C2AF5A55187FAB358462C428D0AD7BFBE27B6B2335554D346665B86CE6
            29298D54AE075B693539B591268A0A05808E426B70340D1DFA9EA49873693D6A
            A2E995EA07C504CBBEC9A2675290F5BDD405BA4EC0EAC71C6E39C08CE92407DB
            89181AB6D2785E8E379DA2A68D53F2F9FA2E4BA9E011F8123BEFB13C97C57324
            F6B6C7DA721E7BDBABC7AA75582EFA2CCD66F09C605F5231EFB23093C66A8DA2
            0228641DBA7AE3B4B4D77E18217073CD3EB13ABF45E0CBBA9DCB051FAF2C696D
            335152F26DEE0B6DC7B358F116AC785F480EEF6A702AFD2AFBBB34D270961D69
            C2C1B45E228D0F80DA81444B12EFC6CAE8F864E85049D5D01DBB49E8E614D2F8
            0C40CFE10E324E1EDB776202267A9FA6D2E1A5040104BE6AFE38692247E6437E
            AAFF1267DA93A179A9B8B5C7A1547F7318D17E028A6E2BC1CD812B0C25FA3869
            2538DF799A7B9F9E010C85C0ED8C331BF8EA4233A0D02A8B28EB1678F1E32DC7
            0EC599DE586426B3544D29EE02B7E45DA5544EA062D558AC259234CCE8299442
            2A507EBF2EA579D6F69DC89BF579CE750C30BDB1C0FBCD95CA94424C1D745991
            7C92BA266082DA9FE2BB441B3ED0720058191D9FD4041781D74009482B211E4A
            B4E1D5D1FBBFFE00E67A0FA67A3463C10000000049454E44AE426082}
          RepeatPause = 10
          Rounded = False
          TabOrder = 0
          OnClick = TableWaitImageLoadButtonClick
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
        object TableWaitImageDeleteButton: TAdvGlowButton
          Left = 200
          Top = 240
          Width = 93
          Height = 31
          Caption = #49325#51228
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
            0D00000006624B474400FF00FF00FFA0BDA7930000021849444154388DCD943D
            6F134110869FD9DDBBBDCBD967E37C801470112AE482C226055D8A889FC0CFA0
            42A2A345A2E01FA44442945488228836B210A2714314C94808210444F1C7F97C
            B714C747EC8B13928AE95633EF33EFCCAE16FEF790E38727BB6FEB63A36551F1
            898071943FD8BEFE6306F8F8E5BB08EDBD16E85CD0D79ECB265BF7EFDC1C2800
            A5FDAD8BC300DC2DA5FD2D005534C8C3F3C88D31AC342E1158FF98C982A1CE12
            8B9457BA5CABB15C8B596B344AB953815A6BA2680999BD3B06A3219369CAE160
            50767F8A37C2204089C2063EE371F22773341C71341C9DA85AE8300C2C4A1569
            DFF331BAE85D8D22026B17DA381168B4C1F3BCB9060181F5B9B2D2607D6D1563
            F4BF014584300C4A85DA28D62FAFA194C2184D73B5C18A9F5337190AF7D7CCBC
            30086CF96605EA950A466B04473CFC4C987C43968A74EA84AF99B90D3C37F3CA
            34CD48D36CD69D567CE708806B72C8920CB1D69224092242E47B986472AFDBED
            BE98033AA6D3B434EE740A49926095A3511D61ADA5D56AD1EFF789E318CFF3E8
            F57A92E7F9C302E8D488637B5814159D2352C0FBFD3ECD66932CCBE8F57AC57C
            221D059067935D90BDB380D9AF9E22421CC7645986528A6AB5FABB6430B3FD47
            AF3ED45C3058F836AF8626B8C1F0BDEFFBCB1B1B1B1C1C1C50A95488E398FDFD
            7D4464E75C7F1F40B7DBBDEB9C7B4AF9C97D0436CFFC1CE6A3DD6E3F13916DE7
            DC1B60047C11911D60B3D3E97CFA09EBEA95837FA019160000000049454E44AE
            426082}
          RepeatPause = 10
          Rounded = False
          TabOrder = 1
          OnClick = TableWaitImageDeleteButtonClick
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
        object Grid1: TcxGrid
          Left = 16
          Top = 27
          Width = 343
          Height = 202
          TabOrder = 2
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
          object GridTableView1: TcxGridTableView
            Tag = 99
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            OnFocusedRecordChanged = GridTableView1FocusedRecordChanged
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsSelection.CellSelect = False
            OptionsView.GroupByBox = False
            object cxGridColumn3: TcxGridColumn
              Caption = #49692#48264
              DataBinding.ValueType = 'Integer'
              DataBinding.FieldName = 'SEQ'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.DisplayFormat = '#0'
              HeaderAlignmentHorz = taCenter
              Width = 67
            end
            object cxGridColumn4: TcxGridColumn
              Caption = #54868#51068#47749
              DataBinding.FieldName = 'NM_CODE1'
              HeaderAlignmentHorz = taCenter
              Width = 237
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = GridTableView1
          end
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = ' '#49688#48156#51452#44288#47144' '
      ImageIndex = 3
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label42: TLabel
        Left = 34
        Top = 29
        Width = 181
        Height = 17
        Caption = #47932#47448#45824#44552' '#44208#51228' '#49884' '#44284'/'#47732#49464' '#51201#50857
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Option001ComboBox: TcxComboBox
        Left = 228
        Top = 25
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #51201#50857#50504#54632
          #52572#44540' 1 '#51452#51068' '#52636#44256' '#44284#47732#49464' '#48708#50984
          #52572#44540' 1 '#44060#50900' '#52636#44256' '#44284#47732#49464' '#48708#50984
          #52572#44540' 2 '#44060#50900' '#52636#44256' '#44284#47732#49464' '#48708#50984
          #52572#44540' 3 '#44060#50900' '#52636#44256' '#44284#47732#49464' '#48708#50984)
        Properties.PostPopupValueOnTab = True
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 0
        Width = 277
      end
    end
  end
  inherited EditStyleController: TcxEditStyleController
    Left = 677
    Top = 98
    PixelsPerInch = 96
  end
  inherited ToolBarStyler: TAdvToolBarOfficeStyler
    Left = 96
    Top = 2
  end
  inherited StyleRepository: TcxStyleRepository
    Left = 699
    Top = 130
    PixelsPerInch = 96
  end
  inherited Exec_Timer: TTimer
    Left = 311
  end
  inherited ReadQueryTimer: TTimer
    Left = 807
    Top = 130
  end
  object DesignFontDialog: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 751
    Top = 161
  end
  object OpenDialog: TOpenDialog
    Filter = 
      'All files (*.avi)|*.avi|All files (*.wmv)|*.wmv|All files (*.jpg' +
      ')|*.jpg|All files (*.png)|*.png'
    Options = [ofReadOnly, ofOverwritePrompt, ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Left = 448
    Top = 33
  end
  object PictureLoadDialog: TOpenPictureDialog
    Filter = #44536#47548' '#54028#51068'(*.png)|*.png'
    Left = 755
    Top = 240
  end
  object IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Method = sslvSSLv23
    SSLOptions.SSLVersions = [sslvSSLv2, sslvSSLv3, sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2]
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 928
    Top = 490
  end
end
