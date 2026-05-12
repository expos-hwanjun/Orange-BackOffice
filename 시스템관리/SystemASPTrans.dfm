inherited SystemASPTransForm: TSystemASPTransForm
  Caption = 'ASP'#51088#47308' '#49569#49688#49888
  ClientHeight = 587
  ClientWidth = 918
  OnCanResize = FormCanResize
  ExplicitWidth = 934
  ExplicitHeight = 626
  PixelsPerInch = 96
  TextHeight = 17
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 918
    ExplicitWidth = 918
    inherited ButtonToolBar: TAdvToolBar
      Left = 796
      ExplicitLeft = 796
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
  object MainPanel: TPanel [1]
    Left = 112
    Top = 68
    Width = 697
    Height = 485
    BevelOuter = bvNone
    TabOrder = 2
    object cxGroupBox1: TcxGroupBox
      Left = 31
      Top = 3
      Caption = ' ASP -> POS '#45796#50868#47196#46300' '
      ParentFont = False
      Style.StyleController = EditStyleController
      TabOrder = 0
      Height = 461
      Width = 311
      object AllDownLoadButton: TcxButton
        Left = 50
        Top = 41
        Width = 209
        Height = 60
        Hint = 'all_d'
        Caption = #51204#52404#45796#50868#47196#46300'('#54924#50896#51228#50808')'
        LookAndFeel.Kind = lfOffice11
        TabOrder = 0
        OnClick = AllDownLoadButtonClick
      end
      object MenuDownLoadButton: TcxButton
        Left = 50
        Top = 105
        Width = 209
        Height = 60
        Hint = 'menu_d'
        Caption = #47700#45684#51221#48372' '#45796#50868#47196#46300
        LookAndFeel.Kind = lfOffice11
        TabOrder = 1
        OnClick = AllDownLoadButtonClick
      end
      object ClassDownLoadButton: TcxButton
        Left = 50
        Top = 169
        Width = 209
        Height = 60
        Hint = 'class_d'
        Caption = #48516#47448#51221#48372' '#45796#50868#47196#46300
        LookAndFeel.Kind = lfOffice11
        TabOrder = 2
        OnClick = AllDownLoadButtonClick
      end
      object PLUDownLoadButton: TcxButton
        Left = 50
        Top = 233
        Width = 209
        Height = 60
        Hint = 'plu_d'
        Caption = 'PLU'#51221#48372' '#45796#50868#47196#46300
        LookAndFeel.Kind = lfOffice11
        TabOrder = 3
        OnClick = AllDownLoadButtonClick
      end
      object MemberDownLoadButton: TcxButton
        Left = 50
        Top = 362
        Width = 209
        Height = 60
        Caption = #54924#50896#51221#48372' '#45796#50868#47196#46300
        LookAndFeel.Kind = lfOffice11
        TabOrder = 4
        OnClick = MemberDownLoadButtonClick
      end
      object EventDownLoadButton: TcxButton
        Left = 50
        Top = 297
        Width = 209
        Height = 60
        Hint = 'spc_d'
        Caption = #54665#49324#51221#48372' '#45796#50868#47196#46300
        LookAndFeel.Kind = lfOffice11
        TabOrder = 5
        OnClick = AllDownLoadButtonClick
      end
      object MemberCheckBox: TcxCheckBox
        Left = 96
        Top = 428
        Caption = ' '#51204#47588#51109' '#54924#50896
        TabOrder = 6
        Visible = False
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 366
      Top = 3
      Caption = ' POS -> ASP '#50629#47196#46300' '
      ParentFont = False
      Style.StyleController = EditStyleController
      TabOrder = 1
      Height = 461
      Width = 311
      object CodeUploadButton: TcxButton
        Left = 51
        Top = 41
        Width = 208
        Height = 57
        Caption = #53076#46300#51221#48372' '#50732#47532#44592
        LookAndFeel.Kind = lfOffice11
        TabOrder = 0
        OnClick = CodeUploadButtonClick
      end
      object AcctUpLoadButton: TcxButton
        Left = 50
        Top = 248
        Width = 209
        Height = 57
        Caption = #52636#45225'/'#44540#53468' '#50732#47532#44592
        LookAndFeel.Kind = lfOffice11
        TabOrder = 1
        OnClick = AcctUpLoadButtonClick
      end
      object PluUploadButton: TcxButton
        Left = 50
        Top = 185
        Width = 209
        Height = 57
        Hint = 'plu_u'
        Caption = 'PLU '#51221#48372' '#50732#47532#44592
        LookAndFeel.Kind = lfOffice11
        TabOrder = 2
        OnClick = AllDownLoadButtonClick
      end
      object SaleUpLoadButton: TcxButton
        Left = 50
        Top = 311
        Width = 209
        Height = 57
        Caption = #47588#52636#51221#48372' '#50732#47532#44592
        LookAndFeel.Kind = lfOffice11
        TabOrder = 3
        OnClick = SaleUpLoadButtonClick
      end
      object TransFromDateEdit: TcxDateEdit
        Left = 51
        Top = 385
        AutoSize = False
        ParentFont = False
        Properties.OnChange = ConditionToolBarFromDateEditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 4
        Height = 25
        Width = 90
      end
      object cxLabel1: TcxLabel
        Left = 146
        Top = 385
        AutoSize = False
        Caption = '~'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Height = 27
        Width = 18
        AnchorX = 155
        AnchorY = 399
      end
      object TransToDateEdit: TcxDateEdit
        Left = 170
        Top = 385
        AutoSize = False
        ParentFont = False
        Properties.OnChange = ConditionToolBarToDateEditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 6
        Height = 25
        Width = 90
      end
      object cxGroupBox3: TcxGroupBox
        Left = 51
        Top = 103
        Caption = #50629#47196#46300' '#54637#47785
        TabOrder = 7
        Height = 72
        Width = 206
        object CodeUploadLabel: TcxLabel
          Left = 10
          Top = 20
          AutoSize = False
          Caption = #44277#53685#53076#46300', '#49324#50857#51088', '#47700#45684', '#48516#47448
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          Transparent = True
          Height = 22
          Width = 184
          AnchorY = 31
        end
        object cxLabel2: TcxLabel
          Left = 6
          Top = 43
          AutoSize = False
          Caption = ' '#53580#51060#48660', '#54924#50896
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          Transparent = True
          Height = 23
          Width = 150
          AnchorY = 55
        end
      end
    end
  end
  inherited EditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
