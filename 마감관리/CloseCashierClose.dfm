inherited CloseCashierCloseForm: TCloseCashierCloseForm
  Left = 300
  Top = 120
  Caption = #44228#49328#50896' '#47560#44048
  ClientHeight = 612
  ClientWidth = 964
  HelpFile = #54980#48169'/'#47560#44048#44288#47532'/'#44228#49328#50896#47560#44048'.htm'
  ExplicitWidth = 980
  ExplicitHeight = 650
  PixelsPerInch = 96
  TextHeight = 17
  inherited GridSplitter: TAdvSplitter
    Left = 275
    Height = 547
    ExplicitLeft = 275
    ExplicitTop = 65
    ExplicitHeight = 611
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
      inherited ButtonToolBarCancelButton: TAdvGlowButton
        Visible = False
      end
    end
    inherited ConditionToolBar: TAdvToolBar
      inherited ConditionToolBarFromDateEdit: TcxDateEdit
        TabStop = False
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
    Width = 275
    Height = 547
    ExplicitWidth = 275
    ExplicitHeight = 547
    inherited Grid: TcxGrid
      Width = 269
      Height = 541
      TabStop = False
      ExplicitWidth = 269
      ExplicitHeight = 541
      inherited GridTableView: TcxGridTableView
        OnCustomDrawCell = nil
        DataController.Data = {
          730000000F00000044617461436F6E74726F6C6C657231040000001200000054
          6378537472696E6756616C75655479706512000000546378537472696E675661
          6C75655479706512000000546378537472696E6756616C756554797065120000
          00546378537472696E6756616C75655479706500000000}
        Styles.OnGetContentStyle = GridTableViewStylesGetContentStyle
        object GridTableViewPosNo: TcxGridColumn
          Caption = 'POS'
          DataBinding.FieldName = 'NO_POS'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Width = 40
        end
        object GridTableViewCashierNo: TcxGridColumn
          Caption = #44228#49328#50896
          DataBinding.FieldName = 'CD_SAWON'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Width = 70
        end
        object GridTableViewCashierName: TcxGridColumn
          Caption = #44228#49328#50896#51060#47492
          DataBinding.FieldName = 'NM_SAWON'
          HeaderAlignmentHorz = taCenter
          Width = 80
        end
        object GridTableViewStatus: TcxGridColumn
          Caption = #49345#53468
          DataBinding.FieldName = 'YN_CLOSE'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Width = 60
        end
      end
    end
  end
  inherited MainPanel: TPanel
    Left = 281
    Width = 683
    Height = 547
    ExplicitLeft = 281
    ExplicitWidth = 683
    ExplicitHeight = 547
    object CommentLabel: TLabel
      Left = 20
      Top = 487
      Width = 5
      Height = 17
      Caption = ' '
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object RemarkLabel: TLabel
      Left = 23
      Top = 454
      Width = 26
      Height = 17
      Caption = #48708#44256
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object ReserveGroupBox: TcxGroupBox
      Left = 19
      Top = 6
      Caption = ' '#49884#51116#45236#50669' '
      ParentFont = False
      Style.StyleController = EditStyleController
      TabOrder = 0
      Height = 381
      Width = 220
      object ReserveOldAmtLabel: TLabel
        Left = 22
        Top = 33
        Width = 49
        Height = 17
        Caption = #51456' '#48708' '#44552
      end
      object ReserveAmtLabel: TLabel
        Left = 22
        Top = 63
        Width = 52
        Height = 17
        Caption = #51473#44036#52636#44552
      end
      object Label1: TLabel
        Left = 22
        Top = 94
        Width = 52
        Height = 17
        Caption = #52636#45225#51077#44552
      end
      object Label2: TLabel
        Left = 22
        Top = 125
        Width = 52
        Height = 17
        Caption = #52636#45225#54788#44552
      end
      object Label3: TLabel
        Left = 22
        Top = 156
        Width = 52
        Height = 17
        Caption = #52636#45225#52852#46300
      end
      object Label4: TLabel
        Left = 22
        Top = 187
        Width = 52
        Height = 17
        Caption = #52636#45225#52636#44552
      end
      object Label5: TLabel
        Left = 22
        Top = 218
        Width = 51
        Height = 17
        Caption = #54788'     '#44552
      end
      object Label6: TLabel
        Left = 22
        Top = 249
        Width = 51
        Height = 17
        Caption = #49688'     '#54364
      end
      object Label7: TLabel
        Left = 8
        Top = 280
        Width = 65
        Height = 17
        Caption = #54788#44552#48393#49324#47308
      end
      object Label8: TLabel
        Left = 22
        Top = 311
        Width = 52
        Height = 17
        Caption = #49884#51116#51092#50529
      end
      object ReserveOldAmtEdit: TcxCurrencyEdit
        Left = 80
        Top = 30
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 0
        Width = 120
      end
      object ReserveAmtEdit: TcxCurrencyEdit
        Left = 80
        Top = 60
        EditValue = 0.000000000000000000
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.EditFormat = '#'
        Properties.Nullstring = '0'
        Properties.UseLeftAlignmentOnEditing = False
        Style.StyleController = EditStyleController
        TabOrder = 1
        Width = 120
      end
      object cxCurrencyEdit1: TcxCurrencyEdit
        Left = 80
        Top = 91
        EditValue = 0.000000000000000000
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.EditFormat = '#'
        Properties.Nullstring = '0'
        Properties.UseLeftAlignmentOnEditing = False
        Style.StyleController = EditStyleController
        TabOrder = 2
        Width = 120
      end
      object cxCurrencyEdit2: TcxCurrencyEdit
        Left = 80
        Top = 122
        EditValue = 0.000000000000000000
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.EditFormat = '#'
        Properties.Nullstring = '0'
        Properties.UseLeftAlignmentOnEditing = False
        Style.StyleController = EditStyleController
        TabOrder = 3
        Width = 120
      end
      object cxCurrencyEdit3: TcxCurrencyEdit
        Left = 80
        Top = 153
        EditValue = 0.000000000000000000
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.EditFormat = '#'
        Properties.Nullstring = '0'
        Properties.UseLeftAlignmentOnEditing = False
        Style.StyleController = EditStyleController
        TabOrder = 4
        Width = 120
      end
      object cxCurrencyEdit4: TcxCurrencyEdit
        Left = 80
        Top = 184
        EditValue = 0.000000000000000000
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.EditFormat = '#'
        Properties.Nullstring = '0'
        Properties.UseLeftAlignmentOnEditing = False
        Style.StyleController = EditStyleController
        TabOrder = 5
        Width = 120
      end
      object cxCurrencyEdit5: TcxCurrencyEdit
        Left = 80
        Top = 215
        EditValue = 0.000000000000000000
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.EditFormat = '#'
        Properties.Nullstring = '0'
        Properties.UseLeftAlignmentOnEditing = False
        Style.StyleController = EditStyleController
        TabOrder = 6
        Width = 120
      end
      object cxCurrencyEdit6: TcxCurrencyEdit
        Left = 80
        Top = 246
        EditValue = 0.000000000000000000
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.EditFormat = '#'
        Properties.Nullstring = '0'
        Properties.UseLeftAlignmentOnEditing = False
        Style.StyleController = EditStyleController
        TabOrder = 7
        Width = 120
      end
      object cxCurrencyEdit7: TcxCurrencyEdit
        Left = 80
        Top = 277
        EditValue = 0.000000000000000000
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.EditFormat = '#'
        Properties.Nullstring = '0'
        Properties.UseLeftAlignmentOnEditing = False
        Style.StyleController = EditStyleController
        TabOrder = 8
        Width = 120
      end
      object cxCurrencyEdit8: TcxCurrencyEdit
        Left = 80
        Top = 308
        EditValue = 0.000000000000000000
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.EditFormat = '#'
        Properties.Nullstring = '0'
        Properties.UseLeftAlignmentOnEditing = False
        Style.StyleController = EditStyleController
        TabOrder = 9
        Width = 120
      end
    end
    object DepositGroupBox: TcxGroupBox
      Left = 516
      Top = 216
      Caption = ' '#47560#44048#49884#51116' '
      ParentFont = False
      Style.StyleController = EditStyleController
      TabOrder = 1
      Height = 360
      Width = 220
      object DepositOldAmtLabel: TLabel
        Left = 20
        Top = 28
        Width = 52
        Height = 17
        Caption = #51473#44036#52636#44552
      end
      object DepositCheckAmtLabel: TLabel
        Left = 20
        Top = 58
        Width = 49
        Height = 17
        Caption = #49688' '#12288' '#54364
      end
      object Deposit50000AmtLabel: TLabel
        Left = 20
        Top = 88
        Width = 49
        Height = 17
        Caption = #50724' '#47564' '#50896
      end
      object Deposit10000AmtLabel: TLabel
        Left = 20
        Top = 118
        Width = 49
        Height = 17
        Caption = #47564' '#12288' '#50896
      end
      object Deposit5000AmtLabel: TLabel
        Left = 20
        Top = 148
        Width = 49
        Height = 17
        Caption = #50724' '#52380' '#50896
      end
      object Deposit1000AmtLabel: TLabel
        Left = 20
        Top = 178
        Width = 49
        Height = 17
        Caption = #52380' '#12288' '#50896
      end
      object Deposit500AmtLabel: TLabel
        Left = 20
        Top = 208
        Width = 49
        Height = 17
        Caption = #50724' '#48177' '#50896
      end
      object Deposit100AmtLabel: TLabel
        Left = 20
        Top = 238
        Width = 49
        Height = 17
        Caption = #48177' '#12288' '#50896
      end
      object Deposit50AmtLabel: TLabel
        Left = 20
        Top = 268
        Width = 49
        Height = 17
        Caption = #50724' '#49901' '#50896
      end
      object Deposit10AmtLabel: TLabel
        Left = 20
        Top = 298
        Width = 49
        Height = 17
        Caption = #49901' '#12288' '#50896
      end
      object DepositAmtLabel: TLabel
        Left = 20
        Top = 328
        Width = 49
        Height = 17
        Caption = #54633' '#12288' '#44228
      end
      object DepositOldAmtEdit: TcxCurrencyEdit
        Left = 80
        Top = 25
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 0
        Width = 120
      end
      object DepositCheckAmtEdit: TcxCurrencyEdit
        Left = 80
        Top = 55
        EditValue = 0.000000000000000000
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#'
        Properties.EditFormat = '#'
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = DepositQtyEditChanged
        Style.StyleController = EditStyleController
        TabOrder = 1
        Width = 120
      end
      object Deposit50000QtyEdit: TcxCurrencyEdit
        Left = 80
        Top = 85
        EditValue = 0.000000000000000000
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#'
        Properties.EditFormat = '#'
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = DepositQtyEditChanged
        Style.StyleController = EditStyleController
        TabOrder = 2
        Width = 40
      end
      object Deposit10000QtyEdit: TcxCurrencyEdit
        Left = 80
        Top = 115
        EditValue = 0.000000000000000000
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#'
        Properties.EditFormat = '#'
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = DepositQtyEditChanged
        Style.StyleController = EditStyleController
        TabOrder = 3
        Width = 40
      end
      object Deposit5000QtyEdit: TcxCurrencyEdit
        Left = 80
        Top = 145
        EditValue = 0.000000000000000000
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#'
        Properties.EditFormat = '#'
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = DepositQtyEditChanged
        Style.StyleController = EditStyleController
        TabOrder = 4
        Width = 40
      end
      object Deposit1000QtyEdit: TcxCurrencyEdit
        Left = 80
        Top = 175
        EditValue = 0.000000000000000000
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#'
        Properties.EditFormat = '#'
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = DepositQtyEditChanged
        Style.StyleController = EditStyleController
        TabOrder = 5
        Width = 40
      end
      object Deposit500QtyEdit: TcxCurrencyEdit
        Left = 80
        Top = 205
        EditValue = 0.000000000000000000
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#'
        Properties.EditFormat = '#'
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = DepositQtyEditChanged
        Style.StyleController = EditStyleController
        TabOrder = 6
        Width = 40
      end
      object Deposit100QtyEdit: TcxCurrencyEdit
        Left = 80
        Top = 235
        EditValue = 0.000000000000000000
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#'
        Properties.EditFormat = '#'
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = DepositQtyEditChanged
        Style.StyleController = EditStyleController
        TabOrder = 7
        Width = 40
      end
      object Deposit50QtyEdit: TcxCurrencyEdit
        Left = 80
        Top = 265
        EditValue = 0.000000000000000000
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#'
        Properties.EditFormat = '#'
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = DepositQtyEditChanged
        Style.StyleController = EditStyleController
        TabOrder = 8
        Width = 40
      end
      object Deposit10QtyEdit: TcxCurrencyEdit
        Left = 80
        Top = 295
        EditValue = 0.000000000000000000
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#'
        Properties.EditFormat = '#'
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = DepositQtyEditChanged
        Style.StyleController = EditStyleController
        TabOrder = 9
        Width = 40
      end
      object DepositAmtEdit: TcxCurrencyEdit
        Left = 80
        Top = 325
        EditValue = 0.000000000000000000
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#'
        Properties.EditFormat = '#'
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = DepositAmtEditPropertiesChange
        Style.StyleController = EditStyleController
        TabOrder = 10
        OnEnter = DepositAmtEditEnter
        OnExit = DepositAmtEditExit
        Width = 120
      end
      object Deposit50000AmtEdit: TcxCurrencyEdit
        Left = 125
        Top = 85
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 11
        Width = 75
      end
      object Deposit10000AmtEdit: TcxCurrencyEdit
        Left = 125
        Top = 115
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 12
        Width = 75
      end
      object Deposit5000AmtEdit: TcxCurrencyEdit
        Left = 125
        Top = 145
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 13
        Width = 75
      end
      object Deposit1000AmtEdit: TcxCurrencyEdit
        Left = 125
        Top = 175
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 14
        Width = 75
      end
      object Deposit500AmtEdit: TcxCurrencyEdit
        Left = 125
        Top = 205
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 15
        Width = 75
      end
      object Deposit100AmtEdit: TcxCurrencyEdit
        Left = 125
        Top = 235
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 16
        Width = 75
      end
      object Deposit50AmtEdit: TcxCurrencyEdit
        Left = 125
        Top = 265
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 17
        Width = 75
      end
      object Deposit10AmtEdit: TcxCurrencyEdit
        Left = 125
        Top = 295
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 18
        Width = 75
      end
    end
    object AccountsGroupBox: TcxGroupBox
      Left = 245
      Top = 6
      Caption = ' '#47588#52636' '#45236#50669' '
      Enabled = False
      ParentFont = False
      Style.StyleController = EditStyleController
      TabOrder = 2
      Height = 532
      Width = 426
      object AccountsSaleAmtLabel: TLabel
        Left = 20
        Top = 33
        Width = 52
        Height = 17
        Caption = #49888#50857#52852#46300
      end
      object AccountsReturnAmtLabel: TLabel
        Left = 7
        Top = 63
        Width = 65
        Height = 17
        Caption = #52852#46300#48393#49324#47308
      end
      object AccountsVoidAmtLabel: TLabel
        Left = 20
        Top = 93
        Width = 51
        Height = 17
        Caption = #50808'     '#49345
      end
      object AccountsCustomerAmtLabel: TLabel
        Left = 228
        Top = 413
        Width = 57
        Height = 17
        Caption = #44061#49688'/'#45800#44032
      end
      object AccountsModifyAmtLabel: TLabel
        Left = 228
        Top = 450
        Width = 52
        Height = 17
        Caption = #52712#12288#12288#49548
      end
      object AccountsCancelAmtLabel: TLabel
        Left = 228
        Top = 480
        Width = 52
        Height = 17
        Caption = #51204#52404#52712#49548
      end
      object AccountsDCAmtLabel: TLabel
        Left = 20
        Top = 422
        Width = 52
        Height = 17
        Caption = #51076#51032#54624#51064
      end
      object AccountsAutoDCAmtLabel: TLabel
        Left = 20
        Top = 452
        Width = 52
        Height = 17
        Caption = #51088#46041#54624#51064
      end
      object AccountsOKCSaveAmtLabel: TLabel
        Left = 20
        Top = 491
        Width = 57
        Height = 17
        Caption = 'OK'#52880#49772#48177
      end
      object AccountsCashAmtLabel: TLabel
        Left = 225
        Top = 33
        Width = 52
        Height = 17
        Caption = #54788#12288#12288#44552
      end
      object AccountsCashReceiptAmtLabel: TLabel
        Left = 221
        Top = 333
        Width = 60
        Height = 17
        Caption = '('#54788#44552#50689#49688')'
      end
      object AccountsCardAmtLabel: TLabel
        Left = 225
        Top = 93
        Width = 52
        Height = 17
        Caption = #52852#12288#12288#46300
      end
      object AccountsCheckAmtLabel: TLabel
        Left = 225
        Top = 63
        Width = 52
        Height = 17
        Caption = #49688#12288#12288#54364
      end
      object AccountsCreditAmtLabel: TLabel
        Left = 225
        Top = 213
        Width = 52
        Height = 17
        Caption = #50808#12288#12288#49345
      end
      object AccountsGiftCardAmtLabel: TLabel
        Left = 227
        Top = 243
        Width = 49
        Height = 17
        Caption = #49345' '#54408' '#44428
      end
      object AccountsOKCashbagAmtLabel: TLabel
        Left = 14
        Top = 153
        Width = 57
        Height = 17
        Caption = 'OK'#52880#49772#48177
      end
      object AccountsTmoneyAmtLabel: TLabel
        Left = 225
        Top = 303
        Width = 52
        Height = 17
        Caption = 'T-money'
      end
      object AccountsCashReceiptCAmtLabel: TLabel
        Left = 221
        Top = 363
        Width = 60
        Height = 17
        Caption = '('#54788#50689#52712#49548')'
      end
      object AccountsCardCAmtLabel: TLabel
        Left = 225
        Top = 123
        Width = 52
        Height = 17
        Caption = #52852#46300#52712#49548
      end
      object AccountsEasyCheckAmtLabel: TLabel
        Left = 226
        Top = 153
        Width = 49
        Height = 17
        Caption = #45800' '#47568' '#44592
      end
      object AccountsEasyCheckCAmtLabel: TLabel
        Left = 225
        Top = 183
        Width = 52
        Height = 17
        Caption = #45800#47568#52712#49548
      end
      object AccountsOverShortAmtLabel: TLabel
        Left = 21
        Top = 122
        Width = 49
        Height = 17
        Caption = #49345' '#54408' '#44428
      end
      object Label9: TLabel
        Left = 19
        Top = 183
        Width = 52
        Height = 17
        Caption = #49552#49892#44552#50529
      end
      object Label10: TLabel
        Left = 19
        Top = 214
        Width = 52
        Height = 17
        Caption = #47588#52636#44552#50529
      end
      object Label11: TLabel
        Left = 6
        Top = 259
        Width = 65
        Height = 17
        Caption = #54252#51064#53944#54624#51064
      end
      object Label12: TLabel
        Left = 19
        Top = 287
        Width = 52
        Height = 17
        Caption = #54924#50896#54624#51064
      end
      object Label13: TLabel
        Left = 19
        Top = 318
        Width = 52
        Height = 17
        Caption = #45800#54408#54624#51064
      end
      object Label14: TLabel
        Left = 19
        Top = 347
        Width = 52
        Height = 17
        Caption = #51648#51221#54624#51064
      end
      object AccountsSaleAmtEdit: TcxCurrencyEdit
        Left = 80
        Top = 30
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 0
        Width = 120
      end
      object AccountsReturnAmtEdit: TcxCurrencyEdit
        Left = 80
        Top = 60
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 1
        Width = 120
      end
      object AccountsVoidAmtEdit: TcxCurrencyEdit
        Left = 80
        Top = 90
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 2
        Width = 120
      end
      object AccountsCustomerQtyEdit: TcxCurrencyEdit
        Left = 288
        Top = 410
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 4
        Width = 40
      end
      object AccountsModifyQtyEdit: TcxCurrencyEdit
        Left = 288
        Top = 447
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 5
        Width = 40
      end
      object AccountsCancelQtyEdit: TcxCurrencyEdit
        Left = 288
        Top = 477
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 6
        Width = 40
      end
      object AccountsDCQtyEdit: TcxCurrencyEdit
        Left = 80
        Top = 419
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 7
        Width = 40
      end
      object AccountsAutoDCQtyEdit: TcxCurrencyEdit
        Left = 80
        Top = 449
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 8
        Width = 40
      end
      object AccountsOKCSaveQtyEdit: TcxCurrencyEdit
        Left = 80
        Top = 488
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 9
        Width = 40
      end
      object AccountsCustomerAmtEdit: TcxCurrencyEdit
        Left = 333
        Top = 410
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 10
        Width = 75
      end
      object AccountsModifyAmtEdit: TcxCurrencyEdit
        Left = 333
        Top = 447
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 11
        Width = 75
      end
      object AccountsCancelAmtEdit: TcxCurrencyEdit
        Left = 333
        Top = 477
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 12
        Width = 75
      end
      object AccountsDCAmtEdit: TcxCurrencyEdit
        Left = 125
        Top = 419
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 13
        Width = 75
      end
      object AccountsAutoDCAmtEdit: TcxCurrencyEdit
        Left = 125
        Top = 449
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 14
        Width = 75
      end
      object AccountsOKCSaveAmtEdit: TcxCurrencyEdit
        Left = 125
        Top = 488
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 15
        Width = 75
      end
      object AccountsCashQtyEdit: TcxCurrencyEdit
        Left = 285
        Top = 30
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        Style.TextColor = clBlue
        Style.TextStyle = [fsBold]
        TabOrder = 16
        Width = 40
      end
      object AccountsCashReceiptQtyEdit: TcxCurrencyEdit
        Left = 285
        Top = 330
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 17
        Width = 40
      end
      object AccountsCashReceiptCQtyEdit: TcxCurrencyEdit
        Left = 285
        Top = 360
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 18
        Width = 40
      end
      object AccountsCardQtyEdit: TcxCurrencyEdit
        Left = 285
        Top = 90
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 19
        Width = 40
      end
      object AccountsCardCQtyEdit: TcxCurrencyEdit
        Left = 285
        Top = 120
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 20
        Width = 40
      end
      object AccountsCheckQtyEdit: TcxCurrencyEdit
        Left = 285
        Top = 60
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        Style.TextColor = clBlue
        Style.TextStyle = [fsBold]
        TabOrder = 21
        Width = 40
      end
      object AccountsCreditQtyEdit: TcxCurrencyEdit
        Left = 285
        Top = 210
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 22
        Width = 40
      end
      object AccountsGiftCardQtyEdit: TcxCurrencyEdit
        Left = 285
        Top = 240
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 23
        Width = 40
      end
      object AccountsCashAmtEdit: TcxCurrencyEdit
        Left = 330
        Top = 30
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        Style.TextColor = clBlue
        Style.TextStyle = [fsBold]
        TabOrder = 24
        Width = 75
      end
      object AccountsCashReceiptAmtEdit: TcxCurrencyEdit
        Left = 330
        Top = 330
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 25
        Width = 75
      end
      object AccountsCashReceiptCAmtEdit: TcxCurrencyEdit
        Left = 330
        Top = 360
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 26
        Width = 75
      end
      object AccountsCardAmtEdit: TcxCurrencyEdit
        Left = 330
        Top = 90
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 27
        Width = 75
      end
      object AccountsCardCAmtEdit: TcxCurrencyEdit
        Left = 330
        Top = 120
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 28
        Width = 75
      end
      object AccountsCheckAmtEdit: TcxCurrencyEdit
        Left = 330
        Top = 60
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        Style.TextColor = clBlue
        Style.TextStyle = [fsBold]
        TabOrder = 29
        Width = 75
      end
      object AccountsCreditAmtEdit: TcxCurrencyEdit
        Left = 330
        Top = 210
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 30
        Width = 75
      end
      object AccountsGiftCardAmtEdit: TcxCurrencyEdit
        Left = 330
        Top = 240
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 31
        Width = 75
      end
      object AccountsOKCashbagQtyEdit: TcxCurrencyEdit
        Left = 285
        Top = 270
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 32
        Width = 40
      end
      object AccountsOKCashbagAmtEdit: TcxCurrencyEdit
        Left = 330
        Top = 270
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 33
        Width = 75
      end
      object AccountsTmoneyQtyEdit: TcxCurrencyEdit
        Left = 285
        Top = 300
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 34
        Width = 40
      end
      object AccountsTmoneyAmtEdit: TcxCurrencyEdit
        Left = 330
        Top = 300
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 35
        Width = 75
      end
      object AccountsEasyCheckQtyEdit: TcxCurrencyEdit
        Left = 285
        Top = 150
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 36
        Width = 40
      end
      object AccountsEasyCheckAmtEdit: TcxCurrencyEdit
        Left = 330
        Top = 150
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 37
        Width = 75
      end
      object AccountsEasyCheckCQtyEdit: TcxCurrencyEdit
        Left = 285
        Top = 180
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 38
        Width = 40
      end
      object AccountsEasyCheckCAmtEdit: TcxCurrencyEdit
        Left = 330
        Top = 180
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0'
        Properties.ReadOnly = True
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        TabOrder = 39
        Width = 75
      end
      object AccountsOverShortAmtEdit: TcxCurrencyEdit
        Left = 80
        Top = 120
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#'
        Properties.EditFormat = '#'
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = DepositAmtEditPropertiesChange
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        Style.TextColor = clBlue
        Style.TextStyle = [fsBold]
        TabOrder = 3
        OnEnter = DepositAmtEditEnter
        OnExit = DepositAmtEditExit
        Width = 120
      end
      object cxCurrencyEdit9: TcxCurrencyEdit
        Left = 80
        Top = 150
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#'
        Properties.EditFormat = '#'
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = DepositAmtEditPropertiesChange
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        Style.TextColor = clBlue
        Style.TextStyle = [fsBold]
        TabOrder = 40
        OnEnter = DepositAmtEditEnter
        OnExit = DepositAmtEditExit
        Width = 120
      end
      object cxCurrencyEdit10: TcxCurrencyEdit
        Left = 80
        Top = 180
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#'
        Properties.EditFormat = '#'
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = DepositAmtEditPropertiesChange
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        Style.TextColor = clBlue
        Style.TextStyle = [fsBold]
        TabOrder = 41
        OnEnter = DepositAmtEditEnter
        OnExit = DepositAmtEditExit
        Width = 120
      end
      object cxCurrencyEdit11: TcxCurrencyEdit
        Left = 80
        Top = 211
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#'
        Properties.EditFormat = '#'
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = DepositAmtEditPropertiesChange
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        Style.TextColor = clBlue
        Style.TextStyle = [fsBold]
        TabOrder = 42
        OnEnter = DepositAmtEditEnter
        OnExit = DepositAmtEditExit
        Width = 120
      end
      object cxCurrencyEdit12: TcxCurrencyEdit
        Left = 80
        Top = 256
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#'
        Properties.EditFormat = '#'
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = DepositAmtEditPropertiesChange
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        Style.TextColor = clBlue
        Style.TextStyle = [fsBold]
        TabOrder = 43
        OnEnter = DepositAmtEditEnter
        OnExit = DepositAmtEditExit
        Width = 120
      end
      object cxCurrencyEdit13: TcxCurrencyEdit
        Left = 80
        Top = 284
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#'
        Properties.EditFormat = '#'
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = DepositAmtEditPropertiesChange
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        Style.TextColor = clBlue
        Style.TextStyle = [fsBold]
        TabOrder = 44
        OnEnter = DepositAmtEditEnter
        OnExit = DepositAmtEditExit
        Width = 120
      end
      object cxCurrencyEdit14: TcxCurrencyEdit
        Left = 80
        Top = 315
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#'
        Properties.EditFormat = '#'
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = DepositAmtEditPropertiesChange
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        Style.TextColor = clBlue
        Style.TextStyle = [fsBold]
        TabOrder = 45
        OnEnter = DepositAmtEditEnter
        OnExit = DepositAmtEditExit
        Width = 120
      end
      object cxCurrencyEdit15: TcxCurrencyEdit
        Left = 80
        Top = 344
        TabStop = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',#'
        Properties.EditFormat = '#'
        Properties.ReadOnly = True
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = DepositAmtEditPropertiesChange
        Style.Color = 14737632
        Style.StyleController = EditStyleController
        Style.TextColor = clBlue
        Style.TextStyle = [fsBold]
        TabOrder = 46
        OnEnter = DepositAmtEditEnter
        OnExit = DepositAmtEditExit
        Width = 120
      end
    end
    object RemarkMemo: TcxMemo
      Left = -211
      Top = 481
      TabStop = False
      ParentFont = False
      Properties.MaxLength = 300
      Properties.OnChange = EditPropertiesChange
      Style.StyleController = EditStyleController
      StyleFocused.Color = 8454143
      TabOrder = 3
      Height = 55
      Width = 391
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
