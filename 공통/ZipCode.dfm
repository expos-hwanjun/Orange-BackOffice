object ZipCodeForm: TZipCodeForm
  Left = 300
  Top = 120
  BorderStyle = bsDialog
  Caption = #50864#54200#48264#54840
  ClientHeight = 405
  ClientWidth = 588
  Color = 16768709
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  DesignSize = (
    588
    405)
  PixelsPerInch = 96
  TextHeight = 17
  object DongLabel: TLabel
    Left = 25
    Top = 15
    Width = 44
    Height = 17
    Caption = #46041' '#51060#47492
    Transparent = True
  end
  object DongEdit: TcxTextEdit
    Left = 119
    Top = 11
    ImeMode = imSHanguel
    Properties.ImeMode = imSHanguel
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.BorderStyle = ebsFlat
    StyleFocused.Color = 8454143
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 0
    OnKeyDown = DongEditKeyDown
    Width = 150
  end
  object SearchButton: TButton
    Left = 491
    Top = 10
    Width = 90
    Height = 30
    Anchors = [akTop, akRight]
    Caption = #51312#54924
    TabOrder = 1
    TabStop = False
    OnClick = SearchButtonClick
  end
  object OKButton: TButton
    Left = 396
    Top = 367
    Width = 90
    Height = 31
    Anchors = [akRight, akBottom]
    Caption = #54869#51064
    TabOrder = 3
    OnClick = OKButtonClick
  end
  object CloseButton: TButton
    Left = 491
    Top = 367
    Width = 90
    Height = 31
    Anchors = [akRight, akBottom]
    Caption = #52712#49548
    TabOrder = 4
    OnClick = CloseButtonClick
  end
  object Grid: TcxGrid
    Left = 9
    Top = 51
    Width = 569
    Height = 306
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    OnEnter = GridEnter
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object GridTableView: TcxGridTableView
      OnDblClick = GridTableViewDblClick
      OnKeyDown = GridTableViewKeyDown
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsView.DataRowHeight = 22
      OptionsView.GroupByBox = False
      Preview.Visible = True
      object GridTableViewZipCode: TcxGridColumn
        Caption = #50864#54200#48264#54840
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.IncSearch = False
        Options.Moving = False
        Options.Sorting = False
        Width = 65
      end
      object GridTableViewState: TcxGridColumn
        Caption = #49884'/'#46020
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Moving = False
        Options.Sorting = False
        Width = 80
      end
      object GridTableViewCity: TcxGridColumn
        Caption = #49884'/'#44396'/'#44400
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Moving = False
        Options.Sorting = False
        Width = 95
      end
      object GridTableViewDong: TcxGridColumn
        Caption = #46041'/'#51021'/'#47732
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Moving = False
        Options.Sorting = False
        Width = 175
      end
      object GridTableViewAddress: TcxGridColumn
        Caption = #49345#49464' '#48264#51648
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Moving = False
        Options.Sorting = False
        Width = 130
      end
    end
    object GridLevel: TcxGridLevel
      GridView = GridTableView
    end
  end
end
