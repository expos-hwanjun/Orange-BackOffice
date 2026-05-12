inherited HeadAvgSaleShowForm: THeadAvgSaleShowForm
  Caption = #47588#51109#48324' '#54217#44512' '#47588#52636'('#48376#48512')'
  ClientHeight = 698
  ClientWidth = 1147
  ExplicitWidth = 1163
  ExplicitHeight = 737
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 410
    Height = 633
    ExplicitLeft = 410
    ExplicitHeight = 633
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1147
    ExplicitWidth = 1147
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
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        Visible = True
      end
      inherited ConditionToolBarDateLabel: TcxLabel
        Visible = True
        AnchorX = 35
        AnchorY = 16
      end
      inherited ConditionToolBarToDateEdit: TcxDateEdit
        Visible = True
      end
      inherited ConditionToolBarDateToLabel: TcxLabel
        Visible = True
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
    Width = 410
    Height = 633
    ExplicitWidth = 410
    ExplicitHeight = 633
    inherited Grid: TcxGrid
      Width = 404
      Height = 627
      ExplicitWidth = 404
      ExplicitHeight = 627
      inherited GridTableView: TcxGridTableView
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0 '#44148
            Kind = skCount
            Column = GridTableViewStoreName
          end
          item
            Format = ',0'
            Kind = skSum
            Column = GridTableViewSaleAmt
          end>
        DataController.Data = {
          8F0000000F00000044617461436F6E74726F6C6C657231050000001200000054
          6378537472696E6756616C7565547970651400000054637843757272656E6379
          56616C7565547970651400000054637843757272656E637956616C7565547970
          6512000000546378537472696E6756616C756554797065140000005463784375
          7272656E637956616C75655479706500000000}
        OptionsView.Footer = True
        object GridTableViewStoreName: TcxGridColumn
          Caption = #47588#51109#47749
          DataBinding.FieldName = 'NM_STORE_SHORT'
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 210
        end
        object GridTableViewSaleAmt: TcxGridColumn
          Caption = #47588#52636#44552#50529
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_SALE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Width = 104
        end
        object GridTableViewAvgRate: TcxGridColumn
          Caption = #54217#44512#50984
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'RATE_AVG'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '#0.00%'
          HeaderAlignmentHorz = taCenter
        end
        object GridTableViewStoreCode: TcxGridColumn
          Tag = 99
          DataBinding.FieldName = 'CD_STORE'
          Visible = False
        end
        object GridTableViewAvgAmt: TcxGridColumn
          Tag = 99
          Caption = #54217#44512#44050
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'AMT_AVG'
          Visible = False
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 416
    Width = 731
    Height = 633
    Enabled = True
    ExplicitLeft = 416
    ExplicitWidth = 731
    ExplicitHeight = 633
    object StorePanel: TAdvPanel
      Left = 0
      Top = 3
      Width = 729
      Height = 190
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      UseDockManager = True
      OnResize = StorePanelResize
      Version = '2.5.5.1'
      BorderWidth = 1
      BottomIndent = 1
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
      Caption.Text = '<P align="center">'#47588#51109#48324' '#54217#44512' ('#50948#52824' '#48143' '#53356#44592#51312#51221#44032#45733')</P>'
      Caption.Visible = True
      ColorTo = clWhite
      DoubleBuffered = True
      Padding.Left = 2
      Padding.Top = 2
      Padding.Right = 2
      Padding.Bottom = 2
      Position.Save = True
      Position.Key = 'HeadAvgSaleShowForm'
      Position.Section = 'StorePanel'
      ShadowOffset = 5
      ShowMoveCursor = True
      StatusBar.Font.Charset = DEFAULT_CHARSET
      StatusBar.Font.Color = clWindowText
      StatusBar.Font.Height = -11
      StatusBar.Font.Name = 'Tahoma'
      StatusBar.Font.Style = []
      StatusBar.Height = 10
      Text = ''
      FullHeight = 220
    end
    object LocalPanel: TAdvPanel
      Left = 0
      Top = 199
      Width = 729
      Height = 194
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      UseDockManager = True
      OnResize = LocalPanelResize
      Version = '2.5.5.1'
      BorderWidth = 1
      BottomIndent = 1
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
      Caption.Text = '<P align="center">'#51648#50669#48324' '#54217#44512' ('#50948#52824' '#48143' '#53356#44592#51312#51221#44032#45733')</P>'
      Caption.Visible = True
      ColorTo = clWhite
      DoubleBuffered = True
      Padding.Left = 2
      Padding.Top = 2
      Padding.Right = 2
      Padding.Bottom = 2
      Position.Save = True
      Position.Key = 'HeadAvgSaleShowForm'
      Position.Section = 'LocalPanel'
      ShadowOffset = 5
      ShowMoveCursor = True
      StatusBar.Font.Charset = DEFAULT_CHARSET
      StatusBar.Font.Color = clWindowText
      StatusBar.Font.Height = -11
      StatusBar.Font.Name = 'Tahoma'
      StatusBar.Font.Style = []
      Text = ''
      FullHeight = 220
    end
    object SaleZonePanel: TAdvPanel
      Left = 0
      Top = 399
      Width = 729
      Height = 194
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      UseDockManager = True
      OnResize = SaleZonePanelResize
      Version = '2.5.5.1'
      BorderWidth = 1
      BottomIndent = 1
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
      Caption.Text = '<P align="center">'#49345#44428#48324' '#54217#44512' ('#50948#52824' '#48143' '#53356#44592#51312#51221#44032#45733')</P>'
      Caption.Visible = True
      ColorTo = clWhite
      DoubleBuffered = True
      Padding.Left = 2
      Padding.Top = 2
      Padding.Right = 2
      Padding.Bottom = 2
      Position.Save = True
      Position.Key = 'HeadAvgSaleShowForm'
      Position.Section = 'SaleZonePanel'
      ShadowOffset = 5
      ShowMoveCursor = True
      StatusBar.Font.Charset = DEFAULT_CHARSET
      StatusBar.Font.Color = clWindowText
      StatusBar.Font.Height = -11
      StatusBar.Font.Name = 'Tahoma'
      StatusBar.Font.Style = []
      Text = ''
      FullHeight = 220
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
