inherited HeadLocalSaleShowForm: THeadLocalSaleShowForm
  Caption = #51648#50669#48324' '#47588#52636'('#48376#48512')'
  ClientHeight = 925
  ClientWidth = 1305
  ExplicitWidth = 1321
  ExplicitHeight = 964
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 408
    Height = 860
    ExplicitLeft = 408
    ExplicitHeight = 632
  end
  inherited ToolBarDockPanel: TAdvDockPanel
    Width = 1305
    ExplicitWidth = 1305
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
    Width = 408
    Height = 860
    ExplicitWidth = 408
    ExplicitHeight = 860
    inherited Grid: TcxGrid
      Width = 402
      Height = 854
      ExplicitWidth = 402
      ExplicitHeight = 854
      inherited GridTableView: TcxGridTableView
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0'
            Kind = skSum
            Column = GridTableViewStoreCount
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
          651400000054637843757272656E637956616C75655479706512000000546378
          537472696E6756616C75655479706500000000}
        OptionsView.Footer = True
        object GridTableViewLocalName: TcxGridColumn
          Caption = #51648#50669#47749
          DataBinding.FieldName = 'NM_LOCAL'
          HeaderAlignmentHorz = taCenter
          Width = 155
        end
        object GridTableViewStoreCount: TcxGridColumn
          Caption = #47588#51109#49688
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'CNT_STORE'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0'
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taCenter
          Width = 54
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
          Width = 99
        end
        object GridTableViewRate: TcxGridColumn
          Caption = #54217#44512#48708
          DataBinding.ValueType = 'Currency'
          DataBinding.FieldName = 'RATE_AVG'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '#.00%'
          HeaderAlignmentHorz = taCenter
        end
        object GridTableViewLocalCode: TcxGridColumn
          Tag = 99
          Caption = #51648#50669#53076#46300
          DataBinding.FieldName = 'CD_LOCAL'
          Visible = False
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 414
    Width = 891
    Height = 860
    Enabled = True
    ExplicitLeft = 414
    ExplicitWidth = 891
    ExplicitHeight = 860
    object StorePanel: TAdvPanel
      Left = 64
      Top = 40
      Width = 771
      Height = 385
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
      Position.Key = 'HeadLocalSaleShowForm'
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
    object TimePanel: TAdvPanel
      Left = 72
      Top = 495
      Width = 769
      Height = 234
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
      OnResize = TimePanelResize
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
      Caption.Text = '<P align="center">'#49884#44036#45824#48324' '#54217#44512' ('#50948#52824' '#48143' '#53356#44592#51312#51221#44032#45733')</P>'
      Caption.Visible = True
      ColorTo = clWhite
      DoubleBuffered = True
      Padding.Left = 2
      Padding.Top = 2
      Padding.Right = 2
      Padding.Bottom = 2
      Position.Save = True
      Position.Key = 'HeadLocalSaleShowForm'
      Position.Section = 'TimePanel'
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
  inherited ApplySaveEdit: TcxTextEdit
    ExplicitHeight = 21
  end
  inherited EditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    PixelsPerInch = 96
  end
  inherited StyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
