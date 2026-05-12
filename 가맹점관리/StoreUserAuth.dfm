inherited StoreUserAuthForm: TStoreUserAuthForm
  ActiveControl = ToolBarCompanyCodeEdit
  Caption = #52404#51064#48324' '#47588#51109#44428#54620' '#49444#51221
  ClientHeight = 667
  ExplicitHeight = 706
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 313
    Height = 602
    ExplicitLeft = 313
    ExplicitHeight = 602
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    inherited ConditionToolBar: TAdvToolBar
      Width = 786
      ExplicitWidth = 786
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        Left = 161
        Visible = True
        ExplicitLeft = 161
        ExplicitWidth = 0
        Width = 0
      end
      inherited ConditionToolBarDateLabel: TcxLabel
        Caption = #49444#51221#44396#48516
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarToDateEdit: TcxDateEdit
        Left = 179
        ExplicitLeft = 179
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        Left = 161
        ExplicitLeft = 161
        AnchorX = 170
        AnchorY = 16
      end
      inherited ConditionToolBarEditLabel: TcxLabel
        Left = 269
        Caption = #48376' '#49324
        Visible = True
        ExplicitLeft = 269
        AnchorX = 302
        AnchorY = 16
      end
      inherited ConditionToolBarComboBox: TcxComboBox
        Left = 67
        Properties.Alignment.Horz = taCenter
        ExplicitLeft = 67
        ExplicitWidth = 94
        Width = 94
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 662
        ExplicitLeft = 662
      end
      object ToolBarCompanyCodeEdit: TcxButtonEdit
        Left = 334
        Top = 2
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ImeMode = imSHanguel
        Properties.OnButtonClick = ToolBarCompanyCodeEditPropertiesButtonClick
        Style.StyleController = EditStyleController
        TabOrder = 7
        ImeMode = imSHanguel
        Width = 99
      end
      object ToolBarCompanyNameLabel: TcxLabel
        Left = 433
        Top = 2
        AutoSize = False
        ParentFont = False
        Style.StyleController = EditStyleController
        Properties.Alignment.Vert = taVCenter
        Height = 25
        Width = 229
        AnchorY = 15
      end
    end
  end
  inherited GridPanel: TPanel
    Width = 313
    Height = 602
    ExplicitWidth = 313
    ExplicitHeight = 602
    inherited Grid: TcxGrid
      Width = 307
      Height = 596
      ExplicitWidth = 307
      ExplicitHeight = 596
      inherited GridTableView: TcxGridTableView
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0 '#44148
            Kind = skCount
            Column = GridTableViewAuthName
          end>
        DataController.Data = {
          470000000F00000044617461436F6E74726F6C6C657231020000001200000054
          6378537472696E6756616C75655479706512000000546378537472696E675661
          6C75655479706500000000}
        OptionsView.Footer = True
        object GridTableViewAuthCode: TcxGridColumn
          Caption = #44428#54620#53076#46300
          DataBinding.FieldName = 'CD_AUTH'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 78
        end
        object GridTableViewAuthName: TcxGridColumn
          Caption = #44428#54620#47749
          DataBinding.FieldName = 'NM_AUTH'
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 202
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 319
    Width = 627
    Height = 602
    ExplicitLeft = 319
    ExplicitWidth = 627
    ExplicitHeight = 602
    object AppIDLabel: TLabel
      Left = 26
      Top = 15
      Width = 52
      Height = 17
      Alignment = taRightJustify
      Caption = #44428#54620#53076#46300
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object GoodsNameLabel: TLabel
      Left = 26
      Top = 44
      Width = 52
      Height = 17
      Caption = #44428#54620#51060#47492
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object AuthCodeEdit: TcxTextEdit
      Left = 88
      Top = 10
      Enabled = False
      ImeMode = imSAlpha
      ParentFont = False
      Properties.ImeMode = imSAlpha
      Properties.MaxLength = 20
      Style.StyleController = EditStyleController
      TabOrder = 0
      Width = 57
    end
    object AuthNameEdit: TcxTextEdit
      Left = 88
      Top = 41
      ImeMode = imSHanguel
      ParentFont = False
      Properties.ImeMode = imSHanguel
      Properties.MaxLength = 150
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 1
      Width = 191
    end
    object MemberGroupBox: TAdvGroupBox
      Left = 14
      Top = 79
      Width = 467
      Height = 514
      Margins.Left = 20
      RoundEdges = True
      Anchors = [akLeft, akTop, akBottom]
      Caption = ' '#44032#47609#51216' '
      ParentCtl3D = True
      TabOrder = 2
      DesignSize = (
        467
        514)
      object Grid1: TcxGrid
        Left = 11
        Top = 27
        Width = 446
        Height = 475
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        object GridTableView1: TcxGridTableView
          Tag = 99
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.GroupByBox = False
          object GridTableView1Check: TcxGridColumn
            Caption = #49440#53469
            DataBinding.FieldName = 'CHK'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayGrayed = 'false'
            Properties.NullStyle = nssUnchecked
            Properties.OnChange = GridTableView1CheckPropertiesChange
            HeaderAlignmentHorz = taCenter
          end
          object GridTableView1CustomerCode: TcxGridColumn
            Caption = #47588#51109#53076#46300
            DataBinding.FieldName = 'CD_CUSTOMER'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.Moving = False
            Width = 102
          end
          object GridTableView1CustomerName: TcxGridColumn
            Caption = #47588#51109#51060#47492
            DataBinding.FieldName = 'NM_CUSTOMER'
            PropertiesClassName = 'TcxLabelProperties'
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Options.Focusing = False
            Options.Moving = False
            Width = 195
          end
        end
        object GridLevel1: TcxGridLevel
          GridView = GridTableView1
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
