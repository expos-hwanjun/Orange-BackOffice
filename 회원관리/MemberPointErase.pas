unit MemberPointErase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, InheritShow, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, cxGridCustomTableView, cxGridTableView, dxPSCore,
  dxPScxCommon, Vcl.Menus, Vcl.ImgList, Vcl.ExtCtrls, AdvToolBar,
  AdvToolBarStylers, cxClasses, DBAccess, Uni, Data.DB, MemDS, cxGridLevel,
  cxGridCustomView, cxGrid, Vcl.StdCtrls, cxRadioGroup, cxTextEdit,
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, cxCurrencyEdit,
  cxCheckBox, StrUtils, Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator,
  System.ImageList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, dxmdaset, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TMemberPointEraseForm = class(TInheritShowForm)
    GridTableViewMemberCode: TcxGridColumn;
    GridTableViewMemberName: TcxGridColumn;
    GridTableViewGubun: TcxGridColumn;
    GridTableViewMobileNo: TcxGridColumn;
    GridTableViewLastVisit: TcxGridColumn;
    GridTableViewOccurPoint: TcxGridColumn;
    GridTableViewCardNo: TcxGridColumn;
    GridTableViewCheck: TcxGridColumn;
    GridTableViewUsePoint: TcxGridColumn;
    GridTableViewPoint: TcxGridColumn;
    ButtonToolBarDeleteButton: TAdvGlowButton;
    ConditionToolBarCheckBox: TcxCheckBox;
    cxLabel1: TcxLabel;
    GridTableViewErase: TcxGridColumn;
    ConditionToolbarPointCheckBox: TcxCheckBox;
    ButtonToolBarSaveButton: TAdvGlowButton;
    procedure FormShow(Sender: TObject);
    procedure GridTableViewCheckPropertiesEditValueChanged(Sender: TObject);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
    procedure ConditionToolBarComboBoxPropertiesEditValueChanged(
      Sender: TObject);
    procedure ConditionToolBarComboBoxPropertiesChange(Sender: TObject);
    procedure ConditionToolBarComboBoxPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    { Private declarations }
  protected
    function DoSearch:Boolean; override;
  end;

var
  MemberPointEraseForm: TMemberPointEraseForm;

implementation
uses Common, DBModule;
{$R *.dfm}

procedure TMemberPointEraseForm.ButtonToolBarDeleteButtonClick(Sender: TObject);
var vIndex :Integer;
    vSeq   :Integer;
    vCode  :String;
    vSQL   :String;
begin
  inherited;
  if not AskBox('저장 하시겠습니까?') then Exit;

  if GetStrPointerData(ConditionToolBarComboBox) = '' then
  begin
    ErrBox(Format('%s코드를 지정해야합니다',[Ifthen(Tag=0,'사용','적립')]));
    Exit;
  end;

  if Tag = 0 then
  begin
    OpenQuery('select Ifnull(Max(SEQ),0)+1 as SEQ '
             +'  from SL_POINT '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and YMD_OCCUR = Date_Format(Now(), ''%Y%m%d'') '
             +'   and NO_POS = ''00'' ',
              [HeadStoreCode,
               StoreCode]);
    try
      if not Query.Eof then
        vSeq := Query.Fields[0].AsInteger
      else
        vSeq := 1;
    finally
      FinishQuery;
    end;

    try
      ShowMsg('저장 중입니다');
      Screen.Cursor := crHourGlass;
      vSQL := '';
      for vIndex := 0 to GridTableView.DataController.FilteredRecordCount-1 do
      begin
        if GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], 0] = '1' then
        begin
          if GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewErase.Index] <> 0 then
          begin
            vSQL := vSQL + Format('(''%s'', ''%s'', ''%s'', ''00'', %s, ''%s'', ''%s'', %s, '''', ''%s'', Now(), ''%s''),',
                                 [HeadStoreCode,
                                  StoreCode,
                                  FormatDateTime('yyyymmdd', now()),
                                  IntToStr(vSeq),
                                  GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewMemberCode.Index],
                                  GetStrPointerData(ConditionToolBarComboBox),
                                  IntToStr(GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewErase.Index]),
                                  UserCode,
                                  '포인트 일괄 삭제']);
          Inc(vSeq);
          end;
        end;
      end;

      if vSQL = '' then Exit;

      vSQL := 'insert into SL_POINT(CD_HEAD, CD_STORE, YMD_OCCUR, NO_POS, SEQ, CD_MEMBER, CD_CODE, PNT_USE, RCP_LINK, CD_SAWON_CHG, DT_CHANGE, REMARK) values'
             +LeftStr(vSQL, Length(vSQL)-1)+';';
      ExecQuery(vSQL, [], true);
      MsgBox(msgSaved);
      ConditionToolBarComboBox.ItemIndex := 0;
      GridTableView.DataController.RecordCount := 0;
    except
      on E: Exception do
      begin
        ErrBox(E.Message);
      end;
    end;
  end
  else if Tag = 1 then
  begin
    OpenQuery('select Ifnull(Max(SEQ),0)+1 as SEQ '
             +'  from SL_POINT '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and YMD_OCCUR = Date_Format(Now(), ''%Y%m%d'') '
             +'   and NO_POS = ''00'' ',
             [HeadStoreCode,
              StoreCode]);
    try
      if not Query.Eof then
        vSeq := Query.Fields[0].AsInteger
      else
        vSeq := 1;
    finally
      FinishQuery;
    end;

    try
      ShowMsg('저장 중입니다');
      Screen.Cursor := crHourGlass;
      for vIndex := 0 to GridTableView.DataController.FilteredRecordCount-1 do
      begin
        if GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], 0] = '1' then
        begin
          if GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewErase.Index] <> 0 then
          begin
            vSQL := vSQL + Format('(''%s'', ''%s'', ''%s'', ''00'', %s, ''%s'',  ''%s'', 0, %s, %s, ''%s'', Now(), ''%s''),',
                                  [HeadStoreCode,
                                   StoreCode,
                                   FormatDateTime('yyyymmdd', now()),
                                   IntToStr(vSeq),
                                   GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewMemberCode.Index],
                                   GetStrPointerData(ConditionToolBarComboBox),
                                   IntToStr(GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewErase.Index]),
                                   IntToStr(GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewErase.Index]),
                                   UserCode,
                                   '포인트 일괄 적립']);
            Inc(vSeq);
          end;
        end;
      end;
      if vSQL = '' then Exit;

      vSQL := 'insert into SL_POINT(CD_HEAD, CD_STORE, YMD_OCCUR, NO_POS, SEQ, CD_MEMBER, CD_CODE, AMT_CASH, PNT_CASH, PNT_ADD, CD_SAWON_CHG, DT_CHANGE, REMARK) values'
             +LeftStr(vSQL, Length(vSQL)-1)+';';

      ExecQuery(vSQL, [], true);
      MsgBox(msgSaved);
      ConditionToolBarComboBox.ItemIndex := 0;
      GridTableView.DataController.RecordCount := 0;
    except
      on E: Exception do
      begin
        ErrBox(E.Message);
      end;
    end;
  end;
  Screen.Cursor := crDefault;
  ShowMsg;
end;

procedure TMemberPointEraseForm.ConditionToolBarComboBoxPropertiesChange(
  Sender: TObject);
begin
//  inherited;

end;

procedure TMemberPointEraseForm.ConditionToolBarComboBoxPropertiesEditValueChanged(
  Sender: TObject);
var vIndex :Integer;
begin
//  inherited;
  //일괄삭제일때는 사용코드에 따라 포인트를 차감하지 않고 잔여포인트 전부를 차감한다
  if Tag = 0 then Exit;
  try
    OpenQuery('select NM_CODE2 '
             +'  from MS_CODE '
             +' where CD_HEAD  =:P0 '
             +'   and CD_STORE =:P1 '
             +'   and CD_KIND  =:P2 '
             +'   and CD_CODE  =:P3 ',
             [HeadStoreCode,
              Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore),
              Ifthen(Tag=0,'13','12'),
              GetStrPointerData(ConditionToolBarComboBox)]);

    GridTableView.DataController.BeginUpdate;
    if not Query.Eof then
    begin
      for vIndex := 0 to GridTableView.DataController.FilteredRecordCount-1 do
      begin
        //사용포인트가 잔여포인트보다 크면
//        if GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewPoint.Index] < StoI(Query.Fields[0].AsString) then
//          Continue;

        GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewErase.Index] := StoI(Query.Fields[0].AsString);
      end;
    end;
    GridTableView.DataController.EndUpdate;
    GridTableViewCheckPropertiesEditValueChanged(nil);
  finally
    FinishQuery;
  end;
end;

procedure TMemberPointEraseForm.ConditionToolBarComboBoxPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
//  inherited;

end;

function TMemberPointEraseForm.DoSearch: Boolean;
begin
  OpenQuery('select ''1'' as CHK, '
           +'       m.CD_MEMBER, '
           +'       m.NM_MEMBER, '
           +'       c.NM_CODE1 as DS_MEMBER, '
           +'       m.NO_CARD, '
           +'       GetPhoneNo(AES_Decrypt(m.TEL_MOBILE, 71483)) as TEL_MOBILE, '
           +'       StoD(e.YMD_VISIT) as YMD_VISIT, '
           +'       e.OCCUR_POINT, '
           +'       e.USE_POINT, '
           +'       e.TOTAL_POINT, '
           +Ifthen(Tag=0, ' Ifnull(e.TOTAL_POINT,0) as ERASE_POINT ', '0 as ERASE_POINT ')
           +'  from MS_MEMBER     m left outer join '
           +'       MS_CODE       c on c.CD_HEAD   = m.CD_HEAD '
           +'                      and c.CD_STORE  = m.CD_STORE '
           +'                      and c.CD_CODE   = m.DS_MEMBER '
           +'                      and c.CD_KIND   = ''05'' left outer join '
           +'       MS_MEMBER_ETC e on e.CD_HEAD   = m.CD_HEAD '
           +'                      and e.CD_STORE  = :P1 '
           +'                      and e.CD_MEMBER = m.CD_MEMBER '
           +' where m.CD_HEAD  =:P0 '
           +'   and m.CD_STORE =:P1 '
           +'   and (Ifnull(e.YMD_VISIT, '''') = '''' or e.YMD_VISIT < :P2 )'
           +'   and m.DS_STATUS = ''0'' '
           +Ifthen(ConditionToolbarPointCheckBox.Checked, ' and e.TOTAL_POINT <> 0 ', '')
           +' order by m.CD_MEMBER ',
           [HeadStoreCode,
            Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore),
            DtoS(ConditionToolBarFromDateEdit.Date),
            StoreCode]);
  Result := DM.ReadQuery(Query, GridTableView);
  GridTableViewCheckPropertiesEditValueChanged(nil);
end;

procedure TMemberPointEraseForm.FormShow(Sender: TObject);
var
  vCode     : PStrPointer;
begin
  inherited;
  // 사용 사유 콤보박스 세팅
  try
    OpenQuery('select CD_CODE, '
             +'       NM_CODE1 '
             +'  from MS_CODE '
             +' where CD_HEAD  = :P0 '
             +'   and CD_STORE = :P1 '
             +'   and CD_KIND  = :P2 '
             +'   and Ifnull(NM_CODE3,'''') <> ''1'' '
             +'   and DS_STATUS = ''0'' '
             +' order by CD_CODE',
              [HeadStoreCode,
               Ifthen(GetStoreOption(5)='0',StoreCode,StandardStore),
               Ifthen(Tag=0,'13','12')]);

    New(vCode);
    vCode^.Data := '';
    ConditionToolBarComboBox.Properties.Items.AddObject('', TObject(vCode));
    while not Query.Eof do
    begin
      New(vCode);
      vCode^.Data := Query.Fields[0].AsString;
      ConditionToolBarComboBox.Properties.Items.AddObject(Query.Fields[1].AsString, TObject(vCode));
      Query.Next;
    end;
  finally
    FinishQuery;
    ConditionToolBarComboBox.ItemIndex := 0;
  end;
end;

procedure TMemberPointEraseForm.GridTableViewCheckPropertiesEditValueChanged(
  Sender: TObject);
var
  vCount, vIndex, vPoint: Integer;
begin
  inherited;
  vCount := 0;
  vPoint := 0;
  GridTableView.DataController.Post;
  try
    GridTableView.DataController.BeginUpdate;
    for vIndex := 0 to GridTableView.DataController.FilteredRecordCount-1 do
      if GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], 0] = '1' then
      begin
        Inc(vCount);
        vPoint := vPoint + GridTableView.DataController.Values[GridTableView.DataController.FilteredRecordIndex[vIndex], GridTableViewErase.Index];
      end;
    GridTableView.DataController.Summary.FooterSummaryValues[0] := vCount;
    GridTableView.DataController.Summary.FooterSummaryValues[1] := vPoint;
  finally
    GridTableView.DataController.EndUpdate;
    ButtonToolBarDeleteButton.Enabled := vCount > 0;
    ButtonToolBarSaveButton.Enabled   := vCount > 0;
  end;
end;

end.
