inherited HeadRealTimeOrderShowForm: THeadRealTimeOrderShowForm
  Caption = #49892#49884#44036' '#51452#47928' '#51312#54924'('#48376#48512')'
  ClientHeight = 792
  ClientWidth = 1202
  ExplicitWidth = 1218
  ExplicitHeight = 831
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 323
    Height = 727
    ExplicitLeft = 323
    ExplicitHeight = 727
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1202
    ExplicitWidth = 1202
    inherited ButtonToolBar: TAdvToolBar
      inherited ButtonToolBarSeparator: TAdvToolBarSeparator
        Height = 27
        ExplicitHeight = 27
      end
      inherited ButtonToolBarSaveButton: TAdvGlowButton
        Visible = False
      end
      inherited ButtonToolBarDeleteButton: TAdvGlowButton
        Visible = False
      end
      inherited ButtonToolBarNewButton: TAdvGlowButton
        Visible = False
      end
      inherited ButtonToolBarCancelButton: TAdvGlowButton
        Visible = False
      end
    end
    inherited ConditionToolBar: TAdvToolBar
      inherited ConditionToolBarDateLabel: TcxLabel
        Caption = #47588#52636#51068#51088
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
    Width = 323
    Height = 727
    ExplicitWidth = 323
    ExplicitHeight = 727
    inherited Grid: TcxGrid
      Width = 317
      Height = 721
      ExplicitWidth = 317
      ExplicitHeight = 721
      object GridStoreView: TcxGridCardView [1]
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        OnFocusedRecordChanged = GridStoreViewFocusedRecordChanged
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.CaptionSeparator = #0
        OptionsView.CardIndent = 7
        OptionsView.CardWidth = 300
        OptionsView.CellAutoHeight = True
        OptionsView.RowCaptionAutoHeight = True
        Styles.CardBorder = StyleFontBlackBold
        object GridStoreViewStoreName: TcxGridCardViewRow
          DataBinding.FieldName = 'NM_STORE_SHORT'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ShowAccelChar = False
          Options.Filtering = False
          Options.Focusing = False
          Options.Moving = False
          Options.ShowCaption = False
          Position.BeginsLayer = True
          Styles.Content = StyleHighlight
        end
        object GridStoreViewOrderAmt: TcxGridCardViewRow
          Caption = #51452#47928#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_ORDER'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          CaptionAlignmentHorz = taRightJustify
          Options.Filtering = False
          Options.Focusing = False
          Options.Moving = False
          Position.BeginsLayer = True
          Styles.Content = StyleOdd
          Styles.Caption = StyleOdd
        end
        object GridStoreViewGuestCount: TcxGridCardViewRow
          Caption = '  '#44256#44061#49688
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'CNT_GUEST'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'#47749
          CaptionAlignmentHorz = taRightJustify
          Options.Filtering = False
          Options.Focusing = False
          Options.Moving = False
          Position.BeginsLayer = True
          Styles.Content = StyleOdd
          Styles.Caption = StyleOdd
        end
        object GridStoreViewOrderTable: TcxGridCardViewRow
          Caption = '  '#51452#47928#53580#51060#48660
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'ORDER_TABLE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          Options.Filtering = False
          Options.Focusing = False
          Options.Moving = False
          Position.BeginsLayer = False
        end
        object GridStoreViewDeliveryAmt: TcxGridCardViewRow
          Caption = '  '#48176#45804#47588#52636
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_DELIVERY'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          CaptionAlignmentHorz = taRightJustify
          Options.Filtering = False
          Options.Focusing = False
          Options.Moving = False
          Position.BeginsLayer = True
        end
        object GridStoreViewDeliveryCount: TcxGridCardViewRow
          Caption = '     '#48176#45804#44148#49688
          DataBinding.FieldName = 'CNT_DELIVERY'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0 '#44148
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Position.BeginsLayer = False
        end
        object GridStoreViewStoreCode: TcxGridCardViewRow
          Caption = #47588#51109#53076#46300
          DataBinding.FieldName = 'CD_STORE'
          Visible = False
          Position.BeginsLayer = False
        end
      end
      inherited GridLevel: TcxGridLevel
        GridView = GridStoreView
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 329
    Width = 873
    Height = 727
    ExplicitLeft = 329
    ExplicitWidth = 873
    ExplicitHeight = 727
    object MenuPanel: TAdvPanel
      Left = 6
      Top = 287
      Width = 851
      Height = 434
      Color = clWhite
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      UseDockManager = True
      Version = '2.5.11.0'
      BorderColor = clBlack
      BorderWidth = 1
      CanMove = True
      CanSize = True
      Caption.Color = clHighlight
      Caption.ColorTo = clNone
      Caption.Font.Charset = HANGEUL_CHARSET
      Caption.Font.Color = clHighlightText
      Caption.Font.Height = -15
      Caption.Font.Name = #47569#51008' '#44256#46357
      Caption.Font.Style = [fsBold]
      Caption.Height = 25
      Caption.Indent = 0
      Caption.Text = '<P align="center">'#51452#47928' '#47700#45684'</P>'
      Caption.Visible = True
      ColorTo = clWhite
      DoubleBuffered = True
      Position.Save = True
      Position.Key = 'HeadRealTimeOrderShowForm'
      Position.Section = 'MenuPanel'
      ShadowOffset = 5
      ShowMoveCursor = True
      StatusBar.Font.Charset = DEFAULT_CHARSET
      StatusBar.Font.Color = clWindowText
      StatusBar.Font.Height = -11
      StatusBar.Font.Name = 'Tahoma'
      StatusBar.Font.Style = []
      Text = ''
      DesignSize = (
        851
        434)
      FullHeight = 220
      object MenuGrid: TcxGrid
        Left = 4
        Top = 28
        Width = 842
        Height = 401
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        object MenuGridTableView: TcxGridTableView
          Tag = 99
          Navigator.Buttons.CustomButtons = <>
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0'
              Kind = skSum
              Column = MenuGridTableViewAmount
            end
            item
              Format = ',0'
              Kind = skSum
            end
            item
              Format = ',0 '#44148
              Kind = skCount
              Column = MenuGridTableViewMenuName
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsSelection.CellSelect = False
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          object MenuGridTableViewMenuName: TcxGridColumn
            Caption = #47700#45684#47749
            DataBinding.FieldName = 'NM_MENU'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            FooterAlignmentHorz = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 224
          end
          object MenuGridTableViewQty: TcxGridColumn
            Caption = #49688#47049
            DataBinding.FieldName = 'QTY_ORDER'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Width = 78
          end
          object MenuGridTableViewPrice: TcxGridColumn
            Caption = #45800#44032
            DataBinding.ValueType = 'Currency'
            DataBinding.FieldName = 'PR_SALE'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0'
            HeaderAlignmentHorz = taCenter
            Width = 108
          end
          object MenuGridTableViewAmount: TcxGridColumn
            Caption = #51452#47928#44552#50529
            DataBinding.ValueType = 'Currency'
            DataBinding.FieldName = 'AMT_ORDER'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0'
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Width = 101
          end
        end
        object MenuGridLevel: TcxGridLevel
          GridView = MenuGridTableView
        end
      end
    end
    object OrderPanel: TAdvPanel
      Left = 6
      Top = 5
      Width = 835
      Height = 276
      Color = clWhite
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      UseDockManager = True
      Version = '2.5.11.0'
      BorderColor = clBlack
      BorderWidth = 1
      CanMove = True
      CanSize = True
      Caption.Color = clHighlight
      Caption.ColorTo = clNone
      Caption.Font.Charset = HANGEUL_CHARSET
      Caption.Font.Color = clHighlightText
      Caption.Font.Height = -15
      Caption.Font.Name = #47569#51008' '#44256#46357
      Caption.Font.Style = [fsBold]
      Caption.Height = 25
      Caption.Indent = 0
      Caption.Text = '<P align="center">'#53580#51060#48660' '#51452#47928#45236#50669'</P>'
      Caption.Visible = True
      ColorTo = clWhite
      DoubleBuffered = True
      Position.Save = True
      Position.Key = 'HeadRealTimeOrderShowForm'
      Position.Section = 'OrderPanel'
      ShadowOffset = 5
      ShowMoveCursor = True
      StatusBar.Font.Charset = DEFAULT_CHARSET
      StatusBar.Font.Color = clWindowText
      StatusBar.Font.Height = -11
      StatusBar.Font.Name = 'Tahoma'
      StatusBar.Font.Style = []
      Text = ''
      DesignSize = (
        835
        276)
      FullHeight = 220
      object OrderGrid: TcxGrid
        Left = 4
        Top = 28
        Width = 826
        Height = 243
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        object OrderGridTableView: TcxGridTableView
          Tag = 99
          Navigator.Buttons.CustomButtons = <>
          ScrollbarAnnotations.CustomAnnotations = <>
          OnFocusedRecordChanged = OrderGridTableViewFocusedRecordChanged
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0'
              Kind = skSum
              Column = cxGridColumn3
            end
            item
              Format = ',0'
              Kind = skSum
              Column = cxGridColumn4
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsSelection.CellSelect = False
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          object cxGridColumn1: TcxGridColumn
            Caption = #53580#51060#48660
            DataBinding.FieldName = 'NM_TABLE'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            HeaderAlignmentHorz = taCenter
            Width = 118
          end
          object cxGridColumn2: TcxGridColumn
            Caption = #51077#51109#49884#44036
            DataBinding.FieldName = 'COME_TIME'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 117
          end
          object cxGridColumn3: TcxGridColumn
            Caption = #51452#47928#44552#50529
            DataBinding.ValueType = 'Currency'
            DataBinding.FieldName = 'AMT_ORDER'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0'
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Width = 118
          end
          object cxGridColumn4: TcxGridColumn
            Caption = #44256#44061#49688
            DataBinding.ValueType = 'Integer'
            DataBinding.FieldName = 'CNT_PERSON'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0'
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Width = 85
          end
          object OrderGridTableViewTableNo: TcxGridColumn
            Tag = 99
            DataBinding.FieldName = 'NO_TABLE'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Visible = False
          end
          object OrderGridTableViewDsOrder: TcxGridColumn
            Tag = 99
            DataBinding.FieldName = 'DS_ORDER'
            Visible = False
          end
        end
        object OrderGridLevel: TcxGridLevel
          GridView = OrderGridTableView
        end
      end
    end
  end
  inherited EditStyleController: TcxEditStyleController
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
    inherited StyleFontBlue: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Height = -12
      TextColor = clBlack
    end
    inherited StyleFontBlackBold: TcxStyle
      Font.Height = -17
    end
  end
end
