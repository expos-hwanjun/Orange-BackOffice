inherited BuyReportShowForm: TBuyReportShowForm
  Caption = #47588#51077' '#51068#48372
  ClientHeight = 582
  ClientWidth = 949
  ExplicitWidth = 965
  ExplicitHeight = 620
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 949
    ExplicitWidth = 949
    inherited ButtonToolBar: TAdvToolBar
      Left = 661
      ExplicitLeft = 661
    end
    inherited ConditionToolBar: TAdvToolBar
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        Visible = True
        OnKeyDown = ConditionToolBarFromDateEditKeyDown
      end
      inherited ConditionToolBarDateLabel: TcxLabel
        Visible = True
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        AnchorX = 166
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        AnchorX = 448
        AnchorY = 16
      end
    end
  end
  inherited Grid: TcxGrid
    Width = 943
    Height = 511
    ExplicitWidth = 943
    ExplicitHeight = 511
    object GridBandedTableView: TcxGridBandedTableView [1]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewNetAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewVatAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewBuyAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewCashAmt
        end
        item
          Format = ',0'
          Kind = skSum
          Column = GridBandedTableViewCreditAmt
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleEven
      Bands = <
        item
          Caption = #47588#51077#52376
        end
        item
          Caption = #52264#48320'('#49345#54408')'
        end
        item
          Caption = #45824#48320'('#47588#51077#44552')'
        end>
      object GridBandedTableViewCompanyCode: TcxGridBandedColumn
        Caption = #47588#51077#52376#53076#46300
        DataBinding.FieldName = 'CD_TRDPL'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 80
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableViewCompanyName: TcxGridBandedColumn
        Caption = #47588#51077#52376#51060#47492
        DataBinding.FieldName = 'NM_TRDPL'
        HeaderAlignmentHorz = taCenter
        Width = 200
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableViewBuyNo: TcxGridBandedColumn
        Caption = #47588#51077#48264#54840
        DataBinding.FieldName = 'NO_BUY'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 110
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GridBandedTableViewNetAmt: TcxGridBandedColumn
        Caption = #44277#44553#44032
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_DUTY'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 95
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableViewVatAmt: TcxGridBandedColumn
        Caption = #48512#44032#49464
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TAX'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 90
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object GridBandedTableViewBuyAmt: TcxGridBandedColumn
        Caption = #47588#51077#44552#50529
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_BUY'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 95
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object GridBandedTableViewCashAmt: TcxGridBandedColumn
        Caption = #54788#44552
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_CASH'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 95
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object GridBandedTableViewCreditAmt: TcxGridBandedColumn
        Caption = #50808#49345
        DataBinding.ValueType = 'Currency'
        DataBinding.FieldName = 'AMT_TRUST'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        Width = 95
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
    end
    inherited GridLevel: TcxGridLevel
      GridView = GridBandedTableView
    end
  end
  inherited EditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited ButtonToolBarPrintButtonImageList: TImageList
    Bitmap = {
      494C010103000800740010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000300000022000000100000000C0000
      000000000000000000000000000000000000000000000000000102010136110E
      0E74120F0F770B090969040404550302023B0101012700000012000000050000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000020000
      00080000001000000029000000330000000B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00020000000000000000000000000000002704050568030302520806064F0303
      032B0000000E00000001000000000000000000000000000000061B16167ACEB2
      B4F5FDDDDFFFF2D2D4FFDEBFC2FFB1989AF3706060D33B3232AE1D1819850907
      07580101012B0000000900000000000000000000000000000001000000030000
      00060000000B000000140000002000000030010101450303035B0A0A0A751717
      18902A2A2CA9525454CE242625B4000000200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000010101340808
      087C0202025F0000002A0101013D434646BBA5A29BF19D9689E9B6B4B2E88987
      84CE494542A41C1A19700C0B0A480201011C00000000000000000000001B1811
      128C554344C6897071DEE8D0D1FCFFF0F0FFFFE9EAFFFFE3E6FFFBDADCFFDCC3
      C5FF857A7AD92D27279E000000330000000505130962070D096F070707780F10
      0F881B1D1C9C292C2AAE464547C26C6B6ED6919697E8B9C0C0F9CDD7D5FFD2DB
      D5FFCDE1D6FFFFFFFFFF737575D7000000270000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000030000004B313131D48183
      83FF5D5D5DF7242424CF555656DFDFCFBDFFFFE8C7FFFFFFF0FFFFFFFFFFFFFF
      FFFFFFFFFFFFF0F2F4FFC1B9B3F70E0C0B61000000000000000A131010764D3E
      41B73E2A2EAB442F34BAC3B2B8F5F6E9ECFFF4D6D7FFF6D1D3FFC3A2A3EF947F
      80D9C0AFB1E8C8ADAFF5080607640000000C5A9B71EFB0C8BAFFC9CCCBFFCEDA
      D5FFD7E5DEFFECFAF6FFD6EBDEFFBDD9C5FFACD3B9FFD8EEE1FFA8D2B3FF4F92
      56FF347939FFB1D4B9FF828486DE0000002E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000003E373635DD9F9FA1FFC8C9
      CAFFC7C8C7FFB0B2B4FF949393FF9F8773FFB89D85FECCB59FFEE0C8B1FEF4E3
      D0FEFFF6E5FFF1E7E0FF474747B60000002D0000000000000020866D71DAFDF8
      EFFFABC2B2F7A2A19AEEDDBDC1FCECCFDCFFECCFDDFFE8C7D4FF5F4B51D10B07
      07770604045E020101370000000B0000000055926AEBC7DFD1FFE7FAF1FF79B9
      90FF68A97CFFBBD8C6FF7EB88FFF348847FF2C7E3EFF8DB596FF89BA93FF297E
      32FF33823AFFB0D5B8FF9B9F9FEA0101013B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000009090970939594FFC3C6C5FFD1D1
      D2FFDEDFDFFFD9DEDFFFBEC1C3FFABB0B4FFA6B0B4FFA1A19EFFA29B95FFA191
      80FFA38F7BFF7B7170FD07070871000000000000000001000131997C83DEE3D0
      ABFF6F9A49FF97A852FFF2A55BFFF4AA74FFF2BA98FFF0C2B5FFC1A1A2F27060
      68CD302F31A811111083030202430000001C407E54E096BCA3FFC9E8D7FF4AA1
      68FF42975EFFA8CAB5FFABD5B8FF8DCA9DFF97CBA4FFB9D7C4FFD4EADDFFB4D3
      BCFFABCAB4FFDCF0E5FFACB3B3F3020202470000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A0A0A6BACB0AFFED5DAD9FFE7E7
      E7FEEEF5F8FEDED7D4FEBF7857FEB36946FEB58A79FEBBB1AEFEB4B5B5FEB6B3
      BCFEA2A7A4FE6AA869FF111B119E0000000C0000000205030343AC9095EAFBBC
      95FFBEAE76FFBCA761FFDF7B11FFE38017FFE78923FFEC9033FFF59E4BFFFEB2
      70FFEDBD86FFEDD8BFFF3F3438B20603045D3E7E53E2699E79FFEAF5ECFFDBEF
      E3FFDCEEE3FFF6FBF9FFE2ECE8FF9DA7A1FF9EA9A2FFF1FAF9FFC6DECEFF6B9E
      74FF46834EFF8FB696FFC1C8C7FC040404560000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000606065EB7BBB9FBF5F7F7FFF6F6
      F7FFF9FFFFFFEBC7ACFFD36625FFCA5716FFC25319FFBB5625FFB4572AFFBE87
      71FFD6D6D6FFD3F1D9FF2126219D0000000C000000060B090954C7A8AAF6FAB8
      8DFFE9C79BFFE5BE8CFFD97A1BFFDA7917FFDA7A18FFDC7C18FFDD801AFFE280
      16FFE98516FFFFD0A1FF42393DB10403035748875DE2649F7AFFE8F1EAFFD8E6
      DFFFA1C6B0FFA2C7B0FF527157FF141B14FF49684FFFDBEAE1FFBDDAC4FF4593
      52FF34823CFF85B58CFFCED9D6FF070707630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000010202478A8B8BE4EFF0F0FFE3EC
      F2FFE7DCD3FEE8995EFEE88336FEE5853EFEE17E39FEDA7430FECF5A13FEC96C
      36FEEAE0D9FFFFFFFFFF1C1B1C8A000000050000000A0D0B0C63F2C7C4FFDAA9
      77FF84987EFFAB9869FFDB7B1DFFDD7D1DFFDD8223FFDE8628FFDE8A2CFFDC86
      26FFE08B27FFFFCDA4FF2F282BA101010141508E67E270AB8AFFDDECE4FFD8E9
      E0FF7ABB92FF338450FF002F05FF4B6C53FFCCE0D2FFDDEDE3FFDFF0E7FFC3DE
      CAFFBBD5C2FFD1E7DAFFDCE8E4FF0A0A0A720000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000070304044A52575BC7C9CA
      CAFFCC8C66FFCC6524FFD5712EFFDE7934FFE58138FFEB873AFFEE8739FFF2BE
      98FFFFFFFFFFD9DBDCFB06060658000000000000001314111278FFD1C7FFC8A9
      7EFF42BECCFF64B7B6FFD4822AFFE28220FFE08A2DFFE29134FFE4973AFFE294
      34FFEA9E3DFFFFD4B3FF231E20930000003158946DE274AC8BFFCBE2D4FFFFFF
      FFFFD5E8DEFF2A734BFF024C1BFF639875FFD9E4DCFFFEFEFFFFDEEDE5FF8CB5
      94FF4F8A5AFF679B70FFD5E6DDFF111112830000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000008060548B99C
      81EBE0C1A4FFD5A586FFCF936DFFC68155FFC67544FFCE7237FFD79363FFECE5
      E0FFECEDEEFF333232A200000013000000000000002A241F2191FFDAD2FFD89D
      62FFB89F75FFC29456FFDA8527FFE18B2CFFE39438FFE69C40FFE9A347FFE7A0
      42FFF1AF52FFFCD7BCFF171416820000001F659E7AE586B498FFC7E0D0FFFAFC
      FBFF75AE93FF096839FF64A481FF5EA874FF5C986EFFC9DAD0FFDFEDE4FF67A9
      75FF3D8E4AFF6BA473FFDEF0E6FF1D1D1D980000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000C070344CDAE
      93E9FFFEECFFFFEDD3FFFCE4CAFFEDD9BEFFE3C8AEFF705A4ECE1D1E1E872A2D
      2F952424248D00000021000000000000000002010140352F31A1FFDACEFFDD8D
      47FFE19353FFE48D40FFE08625FFE29336FFE59D43FFE9A64DFFEDAE56FFEBAD
      51FFF8C16CFFF5DBC7FF0F0E0F74000000125B906ED9A8C6B4FFC5DDCEFFEFF9
      F6FF6FB393FF80BBA0FFF2FAF5FFD1EBDAFFA7CFB4FFBCD6C5FFEAF6F2FFDBEF
      E2FFD4EADBFFC1D0C7EEBBBFBDDD1414146B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000201001D83644BC0FFFF
      FFFFFFFFFFFFFFF8EEFFFFF3E3FFFFF8E7FFCCB499E606050434000000010000
      0007000000030000000000000000000000000B090A63544F52B7FFDDCDFFDA7E
      2EFFDA8C35FFD88F3CFFDA7E15FFE08D24FFE49A35FFE9A745FFEEB253FFEEB4
      53FFFECF7CFFEBD9CBFF0A090A650000000A1F472C9DC9DCD1FFC7D9CEFFE1F1
      E8FFE7F4ECFFEFF5F2FFE9F1EDFFE6F0ECFFE5EFEBFFD5E8DEFFC8DFD3FFDFEB
      E6FFB8D0C0FC353F3A8A0A0A0A350000000F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000003020124644E3FABA08F
      82D2BCAC9FE2E0DAD5F3FEFBF9FFFEFCFAFF4C37269600000000000000000000
      000000000000000000000000000000000000100E0E73615C5EC8FFF6F3FFFFCB
      ABFFFDC59AFFFABE8BFFF8B878FFF6B771FFF3B96EFFF3BD6DFFF3C06DFFF3BE
      5EFFFFDC8BFFD6CCC2FD0B090A5D000000080108033A7FAF8EE8EEEAEEFFD2DF
      D6FFCEDED2FFCADCCFFFBFD7C8FFBFD7C8FFC0D6C8FFBED5C7FFB9D3C2FFD0DE
      D5FF9CBFA9F90A120C5900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000004010100180503
      022909050238190F075C46332493655242AB0703013200000000000000000000
      000000000000000000000000000000000000000000240A08084F2F292B8F3D36
      39AA63555AC1867778D7B09A9DEDE2C3C1FFF5D5CFFFFEDDD4FFFFE3D5FFFFE4
      CAFFFFFEE6FFBCB2B1F50504044A000000030000000205160A5B7EAD8DE6E7EC
      E9FFEDEBECFFE8EAE7FFE9EBE8FFE9EBE9FFE9ECE9FFEAEDEBFFEAEDEBFFFCF9
      FCFFDAE9E2FD08150B6600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000E0C0602411A120B5C0100001400000000000000000000
      0000000000000000000000000000000000000000000000000000000000070000
      00110000001D020202290605053508070743050405550B090A62110E0F6E1714
      157A1B1819810907085B0000000F000000000000000000000001010804392045
      2C9B699878DA86B093E682AA8EE482A78EE480A78CE47FA68BE47DA188E290B3
      9BEC7BA788EB0411085D00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  inherited dxComponentPrinter: TdxComponentPrinter
    inherited dxComponentPrinter1Link1: TdxGridReportLink
      ReportDocument.CreationDate = 40829.744516967590000000
      BuiltInReportLink = True
    end
  end
  object FastReport: TfrxReport
    Version = '4.12'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40809.499941076400000000
    ReportOptions.LastChange = 40809.499941076400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 11
    Top = 130
    Datasets = <
      item
        DataSet = FastReportDataSet
        DataSetName = 'FastReportDataSet'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.583333333333300000
      RightMargin = 10.583333333333300000
      TopMargin = 13.149791666666700000
      BottomMargin = 10.583333333333300000
      object ReportTitle: TfrxReportTitle
        Height = 110.000000000000000000
        Top = 16.000000000000000000
        Width = 713.701248333333600000
        object TitleMemo: TfrxMemoView
          Width = 396.000000000000000000
          Height = 44.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsUnderline]
          HAlign = haCenter
          Memo.UTF8W = (
            #47588' '#51077' '#51068' '#48372)
          ParentFont = False
          WordWrap = False
        end
        object SignTitleMemo: TfrxMemoView
          Left = 398.000000000000000000
          Width = 36.000000000000000000
          Height = 100.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #44208
            ''
            #51116)
          ParentFont = False
          VAlign = vaCenter
        end
        object Sign1CaptionMemo: TfrxMemoView
          Left = 434.000000000000000000
          Width = 70.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #45812#45817)
          VAlign = vaCenter
        end
        object Sign2CaptionMemo: TfrxMemoView
          Left = 504.000000000000000000
          Width = 70.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Sign3CaptionMemo: TfrxMemoView
          Left = 574.000000000000000000
          Width = 70.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Sign4CaptionMemo: TfrxMemoView
          Left = 644.000000000000000000
          Width = 70.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #49324#51109)
          VAlign = vaCenter
        end
        object StoreNameMemo: TfrxMemoView
          Left = 20.000000000000000000
          Top = 44.000000000000000000
          Width = 360.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #44032#45208#45796' '#46020#47588#47560#53944' ('#51064#52380#51216')')
          ParentFont = False
          WordWrap = False
        end
        object DateMemo: TfrxMemoView
          Left = 20.000000000000000000
          Top = 72.000000000000000000
          Width = 360.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '2011-01-01 ('#50900')')
          ParentFont = False
          WordWrap = False
        end
        object Sign1Memo: TfrxMemoView
          Left = 434.000000000000000000
          Top = 28.000000000000000000
          Width = 70.000000000000000000
          Height = 72.000000000000000000
          ShowHint = False
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Sign2Memo: TfrxMemoView
          Left = 504.000000000000000000
          Top = 28.000000000000000000
          Width = 70.000000000000000000
          Height = 72.000000000000000000
          ShowHint = False
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Sign3Memo: TfrxMemoView
          Left = 574.000000000000000000
          Top = 28.000000000000000000
          Width = 70.000000000000000000
          Height = 72.000000000000000000
          ShowHint = False
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object Sign4Memo: TfrxMemoView
          Left = 644.000000000000000000
          Top = 28.000000000000000000
          Width = 70.000000000000000000
          Height = 72.000000000000000000
          ShowHint = False
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
      end
      object BuyHeader: TfrxHeader
        Height = 40.000000000000000000
        Top = 184.000000000000000000
        Width = 713.701248333333600000
        object BuySeqCaptionMemo: TfrxMemoView
          Width = 30.000000000000000000
          Height = 40.000000000000000000
          ShowHint = False
          Color = 14540253
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.LeftLine.Width = 2.000000000000000000
          Frame.TopLine.Width = 2.000000000000000000
          Frame.BottomLine.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            #49692#48264)
          ParentFont = False
          SuppressRepeated = True
          VAlign = vaCenter
        end
        object BuyCompanyCaptionMemo: TfrxMemoView
          Left = 30.000000000000000000
          Width = 203.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Color = 14540253
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop]
          Frame.LeftLine.Width = 2.000000000000000000
          Frame.TopLine.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            #47588#51077#52376)
          ParentFont = False
          VAlign = vaCenter
        end
        object BuyCompanyCodeCaptionMemo: TfrxMemoView
          Left = 30.000000000000000000
          Top = 20.000000000000000000
          Width = 50.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Color = 14540253
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.LeftLine.Width = 2.000000000000000000
          Frame.BottomLine.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            #53076#46300)
          ParentFont = False
          VAlign = vaCenter
        end
        object BuyCompanyNameCaptionMemo: TfrxMemoView
          Left = 80.000000000000000000
          Top = 20.000000000000000000
          Width = 153.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Color = 14540253
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.BottomLine.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            #47588#51077#52376#51060#47492)
          ParentFont = False
          VAlign = vaCenter
        end
        object BuyNoCaptionMemo: TfrxMemoView
          Left = 233.000000000000000000
          Width = 90.000000000000000000
          Height = 40.000000000000000000
          ShowHint = False
          Color = 14540253
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.LeftLine.Width = 2.000000000000000000
          Frame.TopLine.Width = 2.000000000000000000
          Frame.BottomLine.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            #47588#51077#48264#54840)
          ParentFont = False
          VAlign = vaCenter
        end
        object BuyNetAmtCaptionMemo: TfrxMemoView
          Left = 323.000000000000000000
          Top = 20.000000000000000000
          Width = 80.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Color = 14540253
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          Frame.LeftLine.Width = 2.000000000000000000
          Frame.BottomLine.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            #44277#44553#44032)
          ParentFont = False
          VAlign = vaCenter
        end
        object BuyVatAmtCaptionMemo: TfrxMemoView
          Left = 403.000000000000000000
          Top = 20.000000000000000000
          Width = 70.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Color = 14540253
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          Frame.BottomLine.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            #48512#44032#49464)
          ParentFont = False
          VAlign = vaCenter
        end
        object BuyAmtCaptionMemo: TfrxMemoView
          Left = 473.000000000000000000
          Top = 20.000000000000000000
          Width = 80.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Color = 14540253
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          Frame.BottomLine.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            #47588#51077#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object BuyCashAmtCaptionMemo: TfrxMemoView
          Left = 553.000000000000000000
          Top = 20.000000000000000000
          Width = 80.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Color = 14540253
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          Frame.LeftLine.Width = 2.000000000000000000
          Frame.BottomLine.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            #54788#44552'/'#49440#44553#44552)
          ParentFont = False
          VAlign = vaCenter
        end
        object BuyCreditAmtCaptionMemo: TfrxMemoView
          Left = 633.000000000000000000
          Top = 20.000000000000000000
          Width = 80.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Color = 14540253
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.RightLine.Width = 2.000000000000000000
          Frame.BottomLine.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            #50808#49345#47588#51077#44552)
          ParentFont = False
          VAlign = vaCenter
        end
        object BuyGetCaptionMemo: TfrxMemoView
          Left = 323.000000000000000000
          Width = 230.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Color = 14540253
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.LeftLine.Width = 2.000000000000000000
          Frame.TopLine.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            #52264#48320' ('#49345#54408')')
          ParentFont = False
          VAlign = vaCenter
        end
        object BuyPayCaptionMemo: TfrxMemoView
          Left = 553.000000000000000000
          Width = 160.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Color = 14540253
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.LeftLine.Width = 2.000000000000000000
          Frame.TopLine.Width = 2.000000000000000000
          Frame.RightLine.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            #45824#48320' ('#47588#51077#44552' '#44396#48516')')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object BuyData: TfrxMasterData
        Height = 21.000000000000000000
        Top = 244.000000000000000000
        Width = 713.701248333333600000
        DataSet = FastReportDataSet
        DataSetName = 'FastReportDataSet'
        RowCount = 0
        object BuySeqMemo: TfrxMemoView
          Width = 30.000000000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.LeftLine.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Line#]')
          ParentFont = False
          SuppressRepeated = True
          WordWrap = False
          VAlign = vaCenter
        end
        object BuyCompanyNameMemo: TfrxMemoView
          Left = 80.000000000000000000
          Width = 153.000000000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DataField = 'NM_TRDPL'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.UTF8W = (
            '[FastReportDataSet."NM_TRDPL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object BuyCompanyCodeMemo: TfrxMemoView
          Left = 30.000000000000000000
          Width = 50.000000000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DataField = 'CD_TRDPL'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.LeftLine.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."CD_TRDPL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object BuyNoMemo: TfrxMemoView
          Left = 233.000000000000000000
          Width = 90.000000000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DataField = 'NO_BUY'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.LeftLine.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[FastReportDataSet."NO_BUY"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object BuyNetAmtMemo: TfrxMemoView
          Left = 323.000000000000000000
          Width = 80.000000000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DataField = 'AMT_DUTY'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.LeftLine.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_DUTY"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object BuyVatAmtMemo: TfrxMemoView
          Left = 403.000000000000000000
          Width = 70.000000000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DataField = 'AMT_TAX'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_TAX"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object BuyAmtMemo: TfrxMemoView
          Left = 473.000000000000000000
          Width = 80.000000000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DataField = 'AMT_BUY'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_BUY"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object BuyCashAmtMemo: TfrxMemoView
          Left = 553.000000000000000000
          Width = 80.000000000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DataField = 'AMT_CASH'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.LeftLine.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_CASH"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object BuyCreditAmtMemo: TfrxMemoView
          Left = 633.000000000000000000
          Width = 80.000000000000000000
          Height = 21.000000000000000000
          ShowHint = False
          DataField = 'AMT_TRUST'
          DataSet = FastReportDataSet
          DataSetName = 'FastReportDataSet'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.RightLine.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[FastReportDataSet."AMT_TRUST"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BuyFooter: TfrxFooter
        Height = 30.000000000000000000
        Top = 284.000000000000000000
        Width = 713.701248333333600000
        object BuySumMemo: TfrxMemoView
          Left = 233.000000000000000000
          Width = 90.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Color = 14540253
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.LeftLine.Width = 2.000000000000000000
          Frame.TopLine.Width = 2.000000000000000000
          Frame.BottomLine.Width = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            #54633#44228)
          ParentFont = False
          SuppressRepeated = True
          WordWrap = False
          VAlign = vaCenter
        end
        object BuyNetAmtSumMemo: TfrxMemoView
          Left = 323.000000000000000000
          Width = 80.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.LeftLine.Width = 2.000000000000000000
          Frame.TopLine.Width = 2.000000000000000000
          Frame.BottomLine.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<FastReportDataSet."AMT_DUTY">,BuyData)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object BuyVatAmtSumMemo: TfrxMemoView
          Left = 403.000000000000000000
          Width = 70.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.TopLine.Width = 2.000000000000000000
          Frame.BottomLine.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<FastReportDataSet."AMT_TAX">,BuyData)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object BuyAmtSumMemo: TfrxMemoView
          Left = 473.000000000000000000
          Width = 80.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.TopLine.Width = 2.000000000000000000
          Frame.BottomLine.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<FastReportDataSet."AMT_BUY">,BuyData)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object BuyCashAmtSumMemo: TfrxMemoView
          Left = 553.000000000000000000
          Width = 80.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.LeftLine.Width = 2.000000000000000000
          Frame.TopLine.Width = 2.000000000000000000
          Frame.BottomLine.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<FastReportDataSet."AMT_CASH">,BuyData)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object BuyCreditAmtSumMemo: TfrxMemoView
          Left = 633.000000000000000000
          Width = 80.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.TopLine.Width = 2.000000000000000000
          Frame.RightLine.Width = 2.000000000000000000
          Frame.BottomLine.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<FastReportDataSet."AMT_TRUST">,BuyData)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object BuyEmptyMemo: TfrxMemoView
          Width = 233.000000000000000000
          Height = 20.000000000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
          Frame.TopLine.Width = 2.000000000000000000
          HAlign = haCenter
          VAlign = vaCenter
        end
      end
      object ReportSummary: TfrxReportSummary
        Height = 100.000000000000000000
        Top = 376.000000000000000000
        Width = 713.701248333333600000
        Stretched = True
        object AccountSignTitleMemo: TfrxMemoView
          Width = 35.000000000000000000
          Height = 100.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #54924
            ''
            #44228)
          ParentFont = False
          VAlign = vaCenter
        end
        object AccountSign1CaptionMemo: TfrxMemoView
          Left = 35.000000000000000000
          Width = 78.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object AccountSign2CaptionMemo: TfrxMemoView
          Left = 113.000000000000000000
          Width = 78.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object AccountSign3CaptionMemo: TfrxMemoView
          Left = 191.000000000000000000
          Width = 78.000000000000000000
          Height = 28.000000000000000000
          ShowHint = False
          Frame.Typ = [ftRight, ftTop, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object AccountSign1Memo: TfrxMemoView
          Left = 35.000000000000000000
          Top = 28.000000000000000000
          Width = 78.000000000000000000
          Height = 72.000000000000000000
          ShowHint = False
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object AccountSign2Memo: TfrxMemoView
          Left = 113.000000000000000000
          Top = 28.000000000000000000
          Width = 78.000000000000000000
          Height = 72.000000000000000000
          ShowHint = False
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object AccountSign3Memo: TfrxMemoView
          Left = 191.000000000000000000
          Top = 28.000000000000000000
          Width = 78.000000000000000000
          Height = 72.000000000000000000
          ShowHint = False
          Frame.Typ = [ftRight, ftBottom]
          HAlign = haCenter
          VAlign = vaCenter
        end
        object RemarkMemo: TfrxMemoView
          Left = 279.000000000000000000
          Width = 435.000000000000000000
          Height = 100.000000000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            #48708#44256)
          ParentFont = False
        end
      end
    end
  end
  object FastReportDataSet: TfrxUserDataSet
    UserName = 'FastReportDataSet'
    OnCheckEOF = FastReportDataSetCheckEOF
    Fields.Strings = (
      'CD_TRDPL'
      'NM_TRDPL'
      'NO_BUY'
      'AMT_DUTY'
      'AMT_TAX'
      'AMT_BUY'
      'AMT_CASH'
      'AMT_TRUST')
    OnNewGetValue = FastReportDataSetNewGetValue
    Left = 41
    Top = 130
  end
end
