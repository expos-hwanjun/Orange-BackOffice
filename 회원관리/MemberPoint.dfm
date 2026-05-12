inherited MemberPointForm: TMemberPointForm
  Left = 300
  Top = 120
  Caption = #54252#51064#53944' '#51201#47549'/'#49324#50857' '#46321#47197
  ClientHeight = 602
  ClientWidth = 964
  HelpFile = #54980#48169'/'#54924#50896#44288#47532'/'#54924#50896#54252#51064#53944#44288#47532'.htm'
  ExplicitWidth = 980
  ExplicitHeight = 641
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 393
    Height = 537
    ExplicitLeft = 335
    ExplicitTop = 65
    ExplicitHeight = 527
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 964
    ExplicitWidth = 964
    inherited ButtonToolBar: TAdvToolBar
      Left = 432
      ExplicitLeft = 432
    end
    inherited ConditionToolBar: TAdvToolBar
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        Visible = True
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
        Visible = True
        AnchorX = 298
        AnchorY = 16
      end
      inherited ConditionToolBarEdit: TcxTextEdit
        Visible = True
      end
    end
  end
  inherited GridPanel: TPanel
    Width = 393
    Height = 537
    ExplicitWidth = 393
    ExplicitHeight = 537
    inherited Grid: TcxGrid
      Width = 387
      Height = 531
      ExplicitWidth = 387
      ExplicitHeight = 531
      inherited GridTableView: TcxGridTableView
        Tag = 99
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0'#44148
            Kind = skCount
            Column = GridTableViewMemberNo
          end>
        OptionsCustomize.ColumnFiltering = True
        OptionsView.Footer = True
        Styles.ContentEven = StyleEven
        object GridTableViewMemberNo: TcxGridColumn
          Caption = #54924#50896#48264#54840
          DataBinding.FieldName = 'CD_MEMBER'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Width = 80
        end
        object GridTableViewMemberName: TcxGridColumn
          Caption = #54924#50896#51060#47492
          DataBinding.FieldName = 'NM_MEMBER'
          HeaderAlignmentHorz = taCenter
          Width = 100
        end
        object GridTableViewType: TcxGridColumn
          Caption = #44396#48516
          DataBinding.FieldName = 'TYPE'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 50
        end
        object GridTableViewPoint: TcxGridColumn
          Caption = #54252#51064#53944
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'PNT_TOTAL'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          HeaderAlignmentHorz = taCenter
          Options.Filtering = False
          Width = 80
        end
        object GridTableViewSeq: TcxGridColumn
          Tag = 99
          Caption = #49692#48264
          DataBinding.FieldName = 'SEQ'
          Visible = False
        end
        object GridTableViewCardNo: TcxGridColumn
          Caption = #52852#46300#48264#54840
          DataBinding.FieldName = 'NO_CARD'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 97
        end
        object GridTableViewTelNo: TcxGridColumn
          Caption = #55092#45824#51204#54868
          DataBinding.FieldName = 'NO_TEL'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 109
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 399
    Width = 565
    Height = 537
    ExplicitLeft = 399
    ExplicitWidth = 565
    ExplicitHeight = 537
    object TopPanel: TPanel
      Left = 0
      Top = 0
      Width = 565
      Height = 130
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object MemberLabel: TLabel
        Left = 20
        Top = 13
        Width = 84
        Height = 17
        Caption = #54924#50896#48264#54840'/'#51060#47492
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object TypeLabel: TLabel
        Left = 20
        Top = 73
        Width = 89
        Height = 17
        Caption = #51201#47549'/'#49324#50857' '#44396#48516
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object ReasonLabel: TLabel
        Left = 20
        Top = 103
        Width = 89
        Height = 17
        Caption = #51201#47549'/'#49324#50857' '#49324#50976
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object CommentLabel: TLabel
        Left = 250
        Top = 103
        Width = 296
        Height = 17
        Caption = #49324#50976#45716' ['#44277#53685' '#53076#46300' '#44288#47532'] '#54532#47196#44536#47016#50640#49436' '#46321#47197#54633#45768#45796'.'
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object MemberTypeLabel: TLabel
        Left = 20
        Top = 43
        Width = 84
        Height = 17
        Caption = #54924#50896#44396#48516'/'#51060#47492
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object MemberNoEdit: TcxButtonEdit
        Left = 120
        Top = 10
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ClickKey = 112
        Properties.ImeMode = imSHanguel
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnButtonClick = MemberNoEditPropertiesButtonClick
        Properties.OnChange = EditPropertiesChange
        Properties.OnValidate = EditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 0
        Width = 120
      end
      object MemberNameEdit: TcxTextEdit
        Left = 250
        Top = 10
        TabStop = False
        ParentFont = False
        Properties.ImeMode = imSHanguel
        Properties.MaxLength = 20
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 2
        Width = 220
      end
      object TypeComboBox: TcxComboBox
        Left = 120
        Top = 70
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #51201#47549
          #49324#50857)
        Properties.OnChange = EditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 1
        Text = #51201#47549
        Width = 120
      end
      object SaveReasonComboBox: TcxComboBox
        Tag = 99
        Left = 376
        Top = 71
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Style.StyleController = EditStyleController
        TabOrder = 3
        Visible = False
        Width = 120
      end
      object ReasonComboBox: TcxComboBox
        Tag = 99
        Left = 119
        Top = 99
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Style.StyleController = EditStyleController
        TabOrder = 4
        Width = 120
      end
      object MemberTypeNameEdit: TcxTextEdit
        Left = 250
        Top = 40
        TabStop = False
        ParentFont = False
        Properties.ImeMode = imSHanguel
        Properties.MaxLength = 20
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 5
        Width = 220
      end
      object MemberTypeEdit: TcxTextEdit
        Left = 120
        Top = 40
        TabStop = False
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.ImeMode = imSAlpha
        Properties.MaxLength = 10
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 6
        Width = 120
      end
      object UseReasonComboBox: TcxComboBox
        Tag = 99
        Left = 250
        Top = 71
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Style.StyleController = EditStyleController
        TabOrder = 7
        Visible = False
        Width = 120
      end
    end
    object SavePanel: TPanel
      Left = 0
      Top = 130
      Width = 565
      Height = 31
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object SaveCashLabel: TLabel
        Left = 20
        Top = 3
        Width = 70
        Height = 17
        Caption = #51201#47549' '#54252#51064#53944
        Transparent = True
      end
      object SavePointEdit: TcxCurrencyEdit
        Left = 120
        Top = 0
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.MaxLength = 8
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = EditPropertiesChange
        Properties.OnValidate = EditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 0
        Width = 120
      end
    end
    object UsePanel: TPanel
      Left = 0
      Top = 161
      Width = 565
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
      object UsePointLabel: TLabel
        Left = 20
        Top = 3
        Width = 70
        Height = 17
        Caption = #49324#50857' '#54252#51064#53944
        Transparent = True
      end
      object UsePointEdit: TcxCurrencyEdit
        Left = 120
        Top = 0
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.MaxLength = 8
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = EditPropertiesChange
        Properties.OnValidate = EditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 0
        Width = 120
      end
    end
    object BottomPanel: TPanel
      Left = 0
      Top = 191
      Width = 565
      Height = 346
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 3
      object RemarkLabel: TLabel
        Left = 20
        Top = 3
        Width = 26
        Height = 17
        Caption = #48708#44256
        Transparent = True
      end
      object RemarkEdit: TcxTextEdit
        Left = 120
        Top = 0
        ParentFont = False
        Properties.ImeMode = imSHanguel
        Properties.MaxLength = 100
        Properties.OnChange = EditPropertiesChange
        Properties.OnValidate = EditPropertiesValidate
        Style.StyleController = EditStyleController
        TabOrder = 0
        Width = 350
      end
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
  inherited Exec_Timer: TTimer
    OnTimer = Exec_TimerTimer
  end
end
