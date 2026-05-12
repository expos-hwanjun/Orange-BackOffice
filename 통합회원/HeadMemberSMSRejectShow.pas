unit HeadMemberSMSRejectShow;

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
  cxDropDownEdit, cxLabel, cxMaskEdit, cxCalendar, AdvGlowButton, cxMemo,
  dxmdaset, MaskUtils, StrUtils, Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator,
  System.ImageList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  THeadMemberSMSRejectShowForm = class(TInheritShowForm)
    GridTableViewRejectDate: TcxGridColumn;
    GridTableViewTelNo: TcxGridColumn;
    GridTableViewMemberCode: TcxGridColumn;
    GridTableViewMemberName: TcxGridColumn;
    GridTableViewLastSendDate: TcxGridColumn;
    GridTableViewMessageText: TcxGridColumn;
    GridTableViewNewsYN: TcxGridColumn;
    ButtonToolBarSaveButton: TAdvGlowButton;
    PopUpMemo: TcxMemo;
    GridTableViewVisitDate: TcxGridColumn;
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);
    procedure GridTableViewMessageTextPropertiesPopup(Sender: TObject);
  private
  protected
    function DoSearch: Boolean; override; // 조회
  end;

var
  HeadMemberSMSRejectShowForm: THeadMemberSMSRejectShowForm;

implementation
uses Common, DBModule;
{$R *.dfm}

{ TMemberSMSRejectShowForm }
procedure THeadMemberSMSRejectShowForm.ButtonToolBarSaveButtonClick(
  Sender: TObject);
var vIndex :Integer;
begin
  inherited;
  if not AskBox('회원정보에 수신거부를 반영하시겠습니까?') then Exit;

  try
    for vIndex := 0 to GridTableView.DataController.RecordCount-1 do
    begin
      if NVL(GridTableView.DataController.Values[vIndex, GridTableViewMemberCode.Index],'') = '' then Continue;

      ExecQuery('update MS_MEMBER '
               +'   set YN_NEWS    = ''N'', '
               +'       YMD_REJECT = Date_Format(Now(), ''%Y%m%d'') '
               +' where CD_HEAD  =:P0 '
               +'   and CD_STORE =:P1 '
               +'   and CD_MEMBER =:P2; ',
               [HeadStoreCode,
                StandardStore,
                GetOnlyNumber(GridTableView.DataController.Values[vIndex, GridTableViewMemberCode.Index])],
                false);
    end;
    ExecQuery(TempSQL, [], true);
    MsgBox('수신거부가 정상 반영되었습니다');
    GridTableView.DataController.RecordCount := 0;
  except
    on E: Exception do
    begin
      MsgBox(E.Message);
      Exit;
    end;
  end;
end;

function THeadMemberSMSRejectShowForm.DoSearch: Boolean;
var
  vResult, vTempData, vData: String;
  vFirstRow: Integer;
  vRow, vCol: TStringList;
  vI, vJ: Integer;
  vReturn :Boolean;
  vSQL    :String;
label loop, loop1;
begin
  Result    := false;

    ExecQuery('delete from TEMP_SPAM '
             +' where CD_HEAD     =:P0 '
             +'   and CD_STORE    =:P1 '
             +'   and MAC_ACCRESS =:P2',
             [HeadStoreCode,
              StandardStore,
              GetMacAddress], false);


    vRow := TStringList.Create;
    vCol := TStringList.Create;
    Split(vData, '|', vRow);
    try
      for vI := 0 to vRow.Count-1 do
      begin
        Split(vRow[vI], #9, vCol);
        vSQL := vSQL + Format('(''%s'',''%s'',''AES_Encrypt(%s,%d)'',''%s'',''%s'',''%s''),',
                             [HeadStoreCode,
                              StandardStore,
                              GetOnlyNumber(vCol[0]),
                              _EncryptKey,
                              Copy(vCol[1],1,8),
                              vCol[2],
                              vCol[3]]);
      end;

      vSQL := LeftStr(vSQL,Length(vSQL)-1)+';';

      TempSQL := 'insert into TEMP_SPAM(CD_HEAD, '
                +'                      CD_STORE, '
                +'                      TEL_MOBILE, '
                +'                      YMD_REJECT, '
                +'                      YMD_SEND, '
                +'                      MSG_SEND) '
                +vSQL;

      ExecQuery(TempSQL,[],true);

      OpenQuery('select StoD(a.YMD_SEND) as YMD_SEND, '
               +'       b.CD_MEMBER, '
               +'       b.NM_MEMBER, '
               +'       b.YN_NEWS, '
               +'       GetPhoneNo(AES_Decrypt(a.TEL_MOBILE, :P4)) as TEL_MOBILE, '
               +'       StoD(b.YMD_VISIT) as YMD_VISIT, '
               +'       a.MSG_SEND, '
               +'       StoD(a.YMD_REJECT) as YMD_REJECT, '
               +'       case when b.DS_STATUS = ''0'' then ''정상'' else ''탈회'' end STATUS '
               +'  from TEMP_SPAM a left outer join '
               +'       MS_MEMBER   b on b.CD_HEAD    = a.CD_HEAD '
               +'                    and b.CD_STORE   = a.CD_STORE '
               +'                    and b.TEL_MOBILE = a.TEL_MOBILE '
               +' where a.CD_HEAD  =:P0 '
               +'   and a.CD_STORE =:P1 '
               +'   and a.YMD_REJECT Between :P2 and :P3 '
               +' order by a.YMD_SEND ',
               [HeadStoreCode,
                StandardStore,
                DtoS(ConditionToolBarFromDateEdit.Date),
                DtoS(ConditionToolBarToDateEdit.Date),
                _EncryptKey]);
      Result := DM.ReadQuery(Query, GridTableView);
    except
      on E: Exception do
      begin
        MsgBox(E.Message);
        Exit;
      end;
    end;
  ButtonToolBarSaveButton.Enabled := result;
end;



procedure THeadMemberSMSRejectShowForm.GridTableViewMessageTextPropertiesPopup(
  Sender: TObject);
begin
  inherited;
  PopUpMemo.Text := GridTableView.DataController.Values[GridTableView.DataController.GetFocusedRecordIndex, GridTableViewMessageText.Index];
end;

end.
