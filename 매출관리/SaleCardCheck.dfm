inherited SaleCardCheckForm: TSaleCardCheckForm
  Left = 300
  Top = 120
  Caption = #52852#46300#45800#47568#44592' '#51204#54364' '#44288#47532
  ClientHeight = 612
  ClientWidth = 964
  HelpFile = #54980#48169'/'#47588#52636#44288#47532'/'#49888#50857#52852#46300'_'#52404#53356#44592'_'#51077#44552'_'#49345#49464#44288#47532'.htm'
  OnDestroy = FormDestroy
  ExplicitWidth = 980
  ExplicitHeight = 651
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 430
    Height = 547
    ExplicitLeft = 420
    ExplicitTop = 65
    ExplicitHeight = 456
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 964
    ExplicitWidth = 964
    inherited ButtonToolBar: TAdvToolBar
      Left = 432
      ExplicitLeft = 432
      inherited ButtonToolBarDeleteButton: TAdvGlowButton
        Visible = False
      end
      inherited ButtonToolBarNewButton: TAdvGlowButton
        Visible = False
      end
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
        AnchorX = 298
        AnchorY = 16
      end
    end
  end
  inherited GridPanel: TPanel
    Width = 430
    Height = 547
    ExplicitWidth = 430
    ExplicitHeight = 547
    inherited Grid: TcxGrid
      Width = 424
      Height = 541
      ExplicitWidth = 424
      ExplicitHeight = 541
      inherited GridTableView: TcxGridTableView
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0'#44148
            Kind = skCount
            Column = GridTableViewBillNo
          end
          item
            Format = ',0'
            Kind = skSum
            Column = GridTableViewApprovalAmt
          end>
        OptionsView.Footer = True
        object GridTableViewPosNo: TcxGridColumn
          Caption = 'POS'
          DataBinding.FieldName = 'NO_POS'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 50
        end
        object GridTableViewBillNo: TcxGridColumn
          Caption = #51204#54364
          DataBinding.FieldName = 'NO_RCP'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Width = 50
        end
        object GridTableViewSeq: TcxGridColumn
          DataBinding.ValueType = 'Integer'
          DataBinding.FieldName = 'SEQ'
          Visible = False
          HeaderAlignmentHorz = taCenter
          Width = 50
        end
        object GridTableViewType: TcxGridColumn
          Caption = #44396#48516
          DataBinding.FieldName = 'DS_TRD'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 60
        end
        object GridTableViewCardNo: TcxGridColumn
          Caption = #52852#46300#48264#54840
          DataBinding.FieldName = 'NO_CARD'
          HeaderAlignmentHorz = taCenter
          Width = 150
        end
        object GridTableViewApprovalAmt: TcxGridColumn
          Caption = #49849#51064#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_APPROVAL'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 436
    Width = 528
    Height = 547
    ExplicitLeft = 436
    ExplicitWidth = 528
    ExplicitHeight = 547
    object CardNoLabel: TLabel
      Left = 20
      Top = 13
      Width = 52
      Height = 17
      Caption = #52852#46300#48264#54840
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object ApprovalDateLabel: TLabel
      Left = 20
      Top = 73
      Width = 52
      Height = 17
      Caption = #49849#51064#51068#51088
      Transparent = True
    end
    object CardCompanyLabel: TLabel
      Left = 22
      Top = 43
      Width = 49
      Height = 17
      Caption = #47588' '#51077' '#49324
      Transparent = True
    end
    object CardJoinNoLabel: TLabel
      Left = 290
      Top = 43
      Width = 52
      Height = 17
      Caption = #44032#47609#48264#54840
      Transparent = True
    end
    object ApprovalNoLabel: TLabel
      Left = 20
      Top = 103
      Width = 52
      Height = 17
      Caption = #49849#51064#48264#54840
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object CancelNoLabel: TLabel
      Left = 290
      Top = 103
      Width = 52
      Height = 17
      Caption = #52712#49548#48264#54840
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object InstallmentLabel: TLabel
      Left = 20
      Top = 133
      Width = 143
      Height = 17
      Caption = #54624#48512#44592#44036#12288#12288#12288#12288#12288#44060#50900
      Transparent = True
    end
    object CancelDateLabel: TLabel
      Left = 290
      Top = 73
      Width = 52
      Height = 17
      Caption = #52712#49548#51068#51088
      Transparent = True
    end
    object SaleAmountLabel: TLabel
      Left = 290
      Top = 133
      Width = 52
      Height = 17
      Caption = #49849#51064#44552#50529
      Transparent = True
    end
    object ApprovalDateEdit: TcxDateEdit
      Left = 80
      Top = 70
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.ImmediatePost = True
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 2
      Width = 140
    end
    object CancelDateEdit: TcxDateEdit
      Left = 350
      Top = 70
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.ImmediatePost = True
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 5
      Width = 140
    end
    object CardCompanyComboBox: TcxComboBox
      Tag = 99
      Left = 80
      Top = 40
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 10
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 1
      Width = 140
    end
    object CardJoinNoEdit: TcxTextEdit
      Left = 350
      Top = 40
      TabStop = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.ReadOnly = True
      Style.Color = 14737632
      Style.StyleController = EditStyleController
      TabOrder = 7
      Width = 140
    end
    object SaleAmountEdit: TcxCurrencyEdit
      Left = 350
      Top = 130
      TabStop = False
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0'
      Properties.ReadOnly = True
      Style.Color = 14737632
      Style.StyleController = EditStyleController
      TabOrder = 8
      Width = 140
    end
    object CardNoEdit: TcxTextEdit
      Left = 80
      Top = 10
      ParentFont = False
      Properties.MaxLength = 16
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 0
      Width = 140
    end
    object ApprovalNoEdit: TcxTextEdit
      Left = 80
      Top = 100
      ParentFont = False
      Properties.MaxLength = 12
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 3
      Width = 140
    end
    object CancelNoEdit: TcxTextEdit
      Left = 350
      Top = 100
      ParentFont = False
      Properties.MaxLength = 12
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 6
      Width = 140
    end
    object InstallmentEdit: TcxSpinEdit
      Left = 80
      Top = 130
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.AssignedValues.MinValue = True
      Properties.MaxValue = 99.000000000000000000
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      TabOrder = 4
      Width = 55
    end
  end
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 21
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
