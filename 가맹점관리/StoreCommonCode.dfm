inherited StoreCommonCodeForm: TStoreCommonCodeForm
  Caption = #53076#46300#44288#47532
  ClientHeight = 624
  ClientWidth = 882
  ExplicitWidth = 898
  ExplicitHeight = 663
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Height = 559
    ExplicitHeight = 559
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 882
    ExplicitWidth = 882
    inherited ButtonToolBar: TAdvToolBar
      Left = 347
      ExplicitLeft = 347
    end
    inherited ConditionToolBar: TAdvToolBar
      Width = 607
      ExplicitWidth = 607
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
      inherited ConditionToolBarComboBox: TcxComboBox
        Properties.OnChange = ConditionToolBarComboBoxPropertiesChange
        Visible = True
        ExplicitWidth = 153
        Width = 153
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Left = 483
        Visible = True
        ExplicitLeft = 483
      end
    end
  end
  inherited GridPanel: TPanel
    Height = 559
    ExplicitHeight = 559
    inherited Grid: TcxGrid
      Height = 553
      ExplicitHeight = 553
      inherited GridTableView: TcxGridTableView
        DataController.Data = {
          5D0000000F00000044617461436F6E74726F6C6C657231030000001200000054
          6378537472696E6756616C75655479706512000000546378537472696E675661
          6C75655479706512000000546378537472696E6756616C756554797065000000
          00}
        object GridTableViewCode: TcxGridColumn
          Caption = #53076#46300
          DataBinding.FieldName = 'CD_CODE'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 74
        end
        object GridTableViewName: TcxGridColumn
          Caption = #53076#46300#47749
          DataBinding.FieldName = 'NM_CODE1'
          HeaderAlignmentHorz = taCenter
          Width = 158
        end
        object GridTableViewStatus: TcxGridColumn
          Tag = 99
          Caption = #49345#53468
          DataBinding.FieldName = 'DS_STATUS'
          Visible = False
        end
      end
      object GridTableView1: TcxGridTableView [1]
        Navigator.Buttons.CustomButtons = <>
        OnFocusedRecordChanged = GridTableView1FocusedRecordChanged
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        OptionsView.GroupByBox = False
        OptionsView.GroupFooterMultiSummaries = True
        object GridTableView1APIKeyID: TcxGridColumn
          Caption = 'API_KEY_ID'
          DataBinding.FieldName = 'API_KEY_ID'
          PropertiesClassName = 'TcxLabelProperties'
          HeaderAlignmentHorz = taCenter
          Width = 175
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Width = 626
    Height = 559
    ExplicitWidth = 626
    ExplicitHeight = 559
    object Notebook: TNotebook
      Left = 6
      Top = 6
      Width = 579
      Height = 394
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'Code'
        object CodeLabel: TLabel
          Left = 20
          Top = 13
          Width = 52
          Height = 17
          Caption = #53076#12288#12288#46300
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label1: TLabel
          Left = 20
          Top = 44
          Width = 52
          Height = 17
          Caption = #53076#46300#51060#47492
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object PosUseLabel: TLabel
          Left = 20
          Top = 75
          Width = 52
          Height = 17
          Caption = #49324#50857#50668#48512
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object CodeEdit: TcxTextEdit
          Left = 80
          Top = 10
          Enabled = False
          ImeMode = imDisable
          ParentFont = False
          Properties.ImeMode = imDisable
          Properties.MaxLength = 3
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 57
        end
        object CodeName1Edit: TcxTextEdit
          Left = 80
          Top = 41
          ImeMode = imSHanguel
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 50
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 217
        end
        object StatusComboBox: TcxComboBox
          Left = 80
          Top = 72
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 2
          Text = #49324#50857
          Width = 120
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'KaKao'
        object Label2: TLabel
          Left = 17
          Top = 21
          Width = 68
          Height = 17
          Caption = 'API KEY ID'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label3: TLabel
          Left = 35
          Top = 52
          Width = 49
          Height = 17
          Caption = 'API KEY'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label4: TLabel
          Left = 32
          Top = 116
          Width = 52
          Height = 17
          Caption = #49324#50857#50668#48512
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label5: TLabel
          Left = 26
          Top = 83
          Width = 58
          Height = 17
          Caption = 'WEB URL'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #47569#51008' '#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object APIKeyIDEdit: TcxTextEdit
          Left = 94
          Top = 18
          Enabled = False
          ImeMode = imDisable
          ParentFont = False
          Properties.ImeMode = imDisable
          Properties.MaxLength = 50
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 291
        end
        object APIKeyEdit: TcxTextEdit
          Left = 94
          Top = 49
          ImeMode = imSHanguel
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 50
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 363
        end
        object APIStatusComboBox: TcxComboBox
          Left = 94
          Top = 113
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #49324#50857
            #49324#50857' '#50504' '#54632)
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 2
          Text = #49324#50857
          Width = 120
        end
        object WebURLEdit: TcxTextEdit
          Left = 94
          Top = 80
          ImeMode = imSHanguel
          ParentFont = False
          Properties.ImeMode = imSHanguel
          Properties.MaxLength = 50
          Properties.OnChange = EditPropertiesChange
          Style.StyleController = EditStyleController
          TabOrder = 3
          Width = 363
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
