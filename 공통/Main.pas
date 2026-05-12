// 메인 폼

unit Main;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvToolBar, AdvPreviewMenu, IniFiles,
  AdvShapeButton, AdvOfficeHint, ImgList, StrUtils,
  AdvOfficeTabSet, AdvOfficeStatusBar, ExtCtrls,
  AdvOfficeStatusBarStylers, AdvNavBar, ShellAPI,
  ToolPanels, ComCtrls, WinSock, AdvGlowButton, Menus, StdCtrls, AdvPanel,
  AdvMenuStylers, cxControls, cxContainer, cxEdit, cxLabel, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  DB, DateUtils, Vcl.AppEvnts, CPort, MaskUtils, AdvPreviewMenuStylers,
  dxGDIPlusClasses, AdvToolBarStylers, AdvOfficeTabSetStylers, cxTreeView,
  IdSocketHandle, IdBaseComponent, IdComponent, dxSkinsCore,
  dxSkinsDefaultPainters, System.ImageList, frxClass, IdHTTP, cxClasses,
  AdvRichEditorBase, AdvRichEditor, Clipbrd,
  cxCheckBox, Math, PNGImage, SHDocVw, AdvScrollControl, IdAntiFreezeBase,
  Vcl.IdAntiFreeze;

const
  WM_MDI_CLOSE     = WM_USER + 100;
  WM_MDI_MSG       = WM_USER + 101;

type
  TExtremeMainForm = class(TAdvToolBarForm)
    Ribbon: TAdvToolBarPager;
    RibbonStyler: TAdvToolBarOfficeStyler;
    RibbonPreviewMenu: TAdvPreviewMenu;
    RibbonPreviewMenuStyler: TAdvPreviewMenuOfficeStyler;
    RibbonFavoritePage: TAdvPage;
    RibbonFavoritePageManagerToolBar: TAdvToolBar;
    RibbonFavoritePageManagerAddButton: TAdvToolBarButton;
    RibbonFavoritePageFavoriteToolBar: TAdvToolBar;
    RibbonFavoritePageFavoriteToolBarPopupMenu: TPopupMenu;
    RibbonFavoritePageFavoriteToolBarPopupMenuDelete: TMenuItem;
    RibbonFavoritePageFavoriteToolBarPopupMenuEdit: TMenuItem;
    RibbonWindowPage: TAdvPage;
    RibbonWindowPageManagerToolBar: TAdvToolBar;
    RibbonWindowPageManagerCloseAllButton: TAdvToolBarButton;
    RibbonWindowPageManagerCascadeButton: TAdvToolBarButton;
    RibbonWindowPageManagerHorizontallyButton: TAdvToolBarButton;
    RibbonWindowPageWindowToolBar: TAdvToolBar;
    RibbonWindowPageWindowToolBarPopupMenu: TPopupMenu;
    RibbonWindowPageWindowToolBarPopupMenuClose: TMenuItem;
    ToolTab: TAdvToolPanelTab;
    ToolMenuPanel: TAdvToolPanel;
    MDITab: TAdvOfficeMDITabSet;
    MDITabStyler: TAdvOfficeTabSetOfficeStyler;
    StatusBar: TAdvOfficeStatusBar;
    StatusBarStyler: TAdvOfficeStatusBarOfficeStyler;
    OfficeHint: TAdvOfficeHint;
    Timer: TTimer;
    RibbonOftenRunPage: TAdvPage;
    RibbonOftenRunPageOftenRunToolBar: TAdvToolBar;
    NoticePanel: TAdvPanel;
    NoticeLabel: TcxLabel;
    RibbonPreviewMenuButton: TAdvShapeButton;
    RibbonQuickAccessToolBar: TAdvQuickAccessToolBar;
    RibbonQuickAccessButton: TAdvGlowButton;
    MenuTreeView: TcxTreeView;
    ToolMenuNavBarImageList: TImageList;
    ToolMenuNavBarSmallImageList: TImageList;
    RibbonStoreChangeButton: TAdvToolBarButton;
    RibbonFavoritePageFavoriteToolBarPopupMenuMove: TMenuItem;
    ImageCollection: TcxImageCollection;
    cxImageCollection1Item1: TcxImageCollectionItem;
    NoticeButton: TAdvToolBarButton;
    StorePreviewMenu: TAdvPreviewMenu;
    NoticesPanel: TAdvPanel;
    NoticesEditor: TAdvRichEditor;
    NoShowCheckBox: TcxCheckBox;
    NoticeCloseButton: TAdvGlowButton;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RibbonPreviewMenuSubMenuItemClick(Sender: TObject; ItemIndex, SubMenuItemIndex: Integer);
    procedure RibbonPreviewMenuButtons0Click(Sender: TObject; Button: TButtonCollectionItem);
    procedure RibbonPreviewMenuButtons1Click(Sender: TObject; Button: TButtonCollectionItem);
    procedure RibbonFavoritePageManagerAddButtonClick(Sender: TObject);
    procedure RibbonFavoritePageFavoriteToolBarPopupMenuDeleteClick(Sender: TObject);
    procedure RibbonFavoritePageFavoriteToolBarPopupMenuEditClick(Sender: TObject);
    procedure RibbonWindowPageManagerCloseAllButtonClick(Sender: TObject);
    procedure RibbonWindowPageManagerCascadeButtonClick(Sender: TObject);
    procedure RibbonWindowPageManagerHorizontallyButtonClick(Sender: TObject);
    procedure RibbonWindowPageWindowToolBarPopupMenuCloseClick(Sender: TObject);
    procedure RibbonProgramRunButtonClick(Sender: TObject);
    procedure ToolMenuPanelResize(Sender: TObject);
    procedure ToolMenuListViewClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure MDITabChange(Sender: TObject);
    procedure RibbonQuickAccessButtonClick(Sender: TObject);
    procedure NoticeLabelClick(Sender: TObject);
    procedure RibbonPreviewMenuButtons2Click(Sender: TObject; Button: TButtonCollectionItem);
    procedure RibbonPreviewMenuButtons3Click(Sender: TObject;
      Button: TButtonCollectionItem);
    procedure MainMenuClick(Sender: TObject);
    procedure MenuTreeViewDblClick(Sender: TObject);
    procedure RibbonStoreChangeButtonClick(Sender: TObject);
    procedure RibbonFavoritePageFavoriteToolBarPopupMenuMoveClick(
      Sender: TObject);
    procedure UnhandledExceptionHandler(Sender: TObject; E: Exception);
    procedure NoShowCheckBoxClick(Sender: TObject);
    procedure NoticeCloseButtonClick(Sender: TObject);
    procedure NoticeButtonClick(Sender: TObject);
    procedure StorePreviewMenuMenuItemClick(Sender: TObject;
      ItemIndex: Integer);
    procedure LogOutTimerTimer(Sender: TObject);
    procedure RibbonPreviewMenuButtons4Click(Sender: TObject;
      Button: TButtonCollectionItem);
    procedure StorePreviewMenuSubMenuItemClick(Sender: TObject; ItemIndex,
      SubMenuItemIndex: Integer);
  private
    FClientInstance : TFarProc;
    FPrevClientProc : TFarProc;
    isStoreChange   : Boolean;
    MenuAuth :Integer;
    function  CheckUser(aStoreCode:String=''): Boolean;
    procedure ReadDefault;
    procedure ReadProgramList;
    procedure ReadFavoriteList(aSubMenuAdd:Boolean=true);
    procedure AddToolBarButton(aToolBar: TAdvToolBar; aFormCaption, aFormName: string);
    procedure AddRibbonSubMenu(aFormCaption, aFormName: string; aRunCount: Integer = 0);
    function  AddSmsUser(aCustomerNo:String):Boolean;
    procedure WMMDIClose(var msg : TMessage); message WM_MDI_CLOSE;
  public
    function  RunProgram(aFormName: string): Boolean;
    procedure ShowMsg(aMessage: string = ''; aError: Boolean = false; aDisplaySecond: Integer = 10);
    procedure ShowNotice(aMessage, aProgram: string; aDisplaySecond: Integer = 30);
    procedure PosSendMessage;
    function  CheckFormShow(aFormName:String):Boolean;
  end;

var
  ExtremeMainForm: TExtremeMainForm;

implementation

uses
  Common, DBModule, Download, About, Login, Favorite, Splash, Inherit,
  StoreSelect,
  HeadMenuMaster,
  HeadStoreMenu,
  HeadPlu,
  HeadKioskMenu,
  HeadKioskPLU,
  HeadSetMenu,
  HeadCourseMenu,
  HeadMenuClass,
  HeadSetup,
  HeadCode,
  HeadCoupon,
  HeadMenuLink,
  HeadKioskDesign,
  HeadPosDesign,
  HeadStore,
  HeadNotice,
  HeadExcel,
  HeadSaleStoreSaleShow,
  HeadSalePayShow,
  HeadSaleDaySaleShow,
  HeadSaleCalendarShow,
  HeadSaleQuickShow,
  HeadDaySaleShow,
  HeadMonthSaleShow,
  HeadRealTimeOrderShow,
  HeadAvgSaleShow,
  HeadLocalSaleShow,
  HeadSaleZoneSaleShow,
  HeadTimeSaleShow,
  HeadMenuSaleShow,
  HeadClassSaleShow,
  HeadClassSaleExShow,
  HeadMenuSalePayShow,
  HeadMenuTimeSaleShow,
  HeadGuestAgeSaleShow,
  HeadGuestTypeSaleShow,
  HeadDeliverySaleShow,
  HeadMemberMonthClose,
  HeadMember,
  HeadMemberShow,
  HeadMemberPointShow,
  HeadMemberStampShow,
  HeadMemberSaleShow,
  HeadMemberSMSShow,
  HeadMemberSMSSaleShow,
  HeadMemberSMSRejectShow,
  HeadMemberVisitShow,
  HeadMemberRank,
  HeadLetsOrderMenu,
  HeadGoods,
  HeadLogistics,
  HeadLogisticsBySaleShow,
  HeadDeposit,
  HeadDepositShow,
  HeadStoreSaleBooksShow,
  HeadSaleReadyByLogisticsShow,
  HeadSaleReadyByStoreShow,
  HeadSale,
  HeadSaleShow,
  HeadStoreBySaleShow,
  HeadSaleReturn,
  HeadSaleReturnModify,
  HeadBalanceBooksShow,
  HeadLanguage,
  HeadMonthByOrderShow,
  HeadSaleByOrderShow,
  HeadLocalByOrderShow,
  HeadSaleZoneByOrderShow,
  HeadSaleDayStoreSaleShow,
  HeadMenuStoreSaleShow,
  HeadDayPaySaleShow,
  HeadYearSaleShow,
  OrderOrder,
  HeadOrder,
  OrderModify,
  HeadOrderModify,
  HeadOrderConfirm,
  HeadOrderShow,
  OrderOrderShow,
  StoreHead,
  StoreStore,
  StorePartner,
  StoreUser,
  StoreUserAuth,
  StoreCustomerListShow,
  StoreCustomerTreeShow,
  StoreSaleShow,
  StoreSMSCharge,
  StoreSMSChargeShow,
  StoreCustomerLicense,
  StoreCustomerLicenseShow,
  StoreCommonCode,
  StoreScript,
  StoreLogShow,
  StoreMartStore,
  StoreQRPrint,
  StoreSMSCountShow,
  StoreSubPartner,
  StoreSubPartnerStoreShow,
  StoreSetupStoreShow,
  StoreNotice,
  StoreNoticePopup,
  StorePartnerNotice,
  StoreSaleDataDelete,
  StoreCallerReg,
  StoreHoliday,
  StorePosChangeShow,
  LetsOrderSaleShow,
  CodeMenuMaster,
  CodeTable,
  CodePLU,
  CodeGoodsMaster,
  CodeClass,
  CodeEvent,
  CodeSetMenu,
  CodeCourseMenu,
  CodePriceTag,
  CodeDeliveryAddress,
  CodeMenuListShow,
  CodeCoupon,
  CodeAutoCoupon,
  CodeBaeminMenuLink,
  CodeVanCompany,
  CodeLetsOrderMenu,
  CodeLetsOrderQR,
  KioskMenuMaster,
  KioskPLU,
  KioskTable,
  KioskDesign,
  KioskSetup,
  CornerCompany,
  CornerCommissionShow,
  CornerCompanyCredit,
  CornerPayShow,
  CornerPayByShow,
  CornerSaleShow,
  CornerCompanyCreditShow,
  CornerMenuSaleShow,
  BuyCompany,
  BuyCompanyShow,
  BuyBuy,
  BuyModify,
  BuyCompanyBuyShow,
  BuyGoodsBuyShow,
  BuyCompanyGoodsBuyShow,
  BuyCompanyCredit,
  BuyCompanyCreditShow,
  BuyCompanyBookShow,
  BuyCompanyBaseCredit,
  SaleQuickShow,
  SaleCalendarShow,
  SaleReceiptShow,
  SaleSaleShow,
  SaleTimeSaleShow,
  SaleGoodsSaleShow,
  SaleDeliverySaleShow,
  SaleTableSaleShow,
  SalePayShow,
  SaleCardCheck,
  SaleDCShow,
  SalePosAuditShow,
  SaleVanSaleShow,
  SaleItemSaleShow,
  SaleReceiptChangeShow,
  SaleServiceSaleShow,
  SaleDamdangSaleShow,
  SaleCashierSaleShow,
  SalePosSaleShow,
  SaleCompanySaleShow,
  SaleCouponIssueShow,
  SaleCouponSaleShow,
  SaleTicketShow,
  SaleLetsOrderSaleShow,
  AnalysisEventSaleShow,
  AnalysisClassSaleShow,
  AnalysisLargeClassSaleShow,
  AnalysisGuestTypeSaleShow,
  AnalysisGuestAgeSaleShow,
  AnalysisWeekSaleShow,
  AnalysisSaleProfitShow,
  AnalysisClassGoodsSaleShow,
  AnalysisMenuSalePayShow,
  AnalysisIncomeStatementShow,
  AnalysisMenuGuestShow,
  AnalysisTimeMenuSaleShow,
  AnalysisMenuTimeSaleShow,
  AnalysisYearSaleShow,
  StockShow,
  StockDisuse,
  StockDisuseShow,
  StockSurvey,
  StockSurveyShow,
  StockSurverSummaryShow,
  StockBaseStock,
  StockLowStockShow,
  StockMonthStockShow,
  StockSurveyPrint,
  StockSurveyBatch,
  StockNotSurveyConfirm,
  StockStockUpdate,
  CloseCashierCloseShow,
  ClosePosCloseShow,
  CloseReportShow,
  CloseMonthClose,
  CloseVatReportShow,
  CloseParkingListShow,
  CloseSaleUpdate,
  MemberMember,
  MemberShow,
  MemberSaleShow,
  MemberCompareSaleShow,
  MemberPoint,
  MemberStamp,
  MemberPointShow,
  MemberStampShow,
  MemberAnniversaryShow,
  MemberSMSShow,
  MemberMenuSaleShow,
  MemberMenuBySaleShow,
  MemberReceive,
  MemberBatchReceive,
  MemberReceiveShow,
  MemberBookShow,
  MemberRank,
  MemberSMSSaleShow,
  MemberPointErase,
  MemberPointBatchSave,
  MemberSMSRejectShow,
  MemberSaleBookShow,
  MemberPaySaleShow,
  ReserveAcct,
  ReserveAcctShow,
  ReserveEmpWork,
  ReserveEmpWorkShow,
  ReserveEmpWorkPayShow,
  ReserveEmpMonthWorkShow,
  ReserveBooking,
  ReserveShow,
  SystemCode,
  SystemEmp,
  SystemProgram,
  SystemSetup,
  SystemExcel,
  SystemSchedule,
  SystemProgramLog,
  SystemCashBoxShow,
  SystemCouponDesign,
  SystemDIDDesign,
  SystemPosDesign,
  SystemNotice,
  SystemNoticeShow,
  SystemDBMigration,
  SystemUpdateNotice,
  SystemLanguage,
  SystemLetsOrderSetup;

{$R *.dfm}
//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 만들 때
procedure TExtremeMainForm.FormCreate(Sender: TObject);
var
  vIndex, vIndex2, vCount :Integer;
  vTemp, vFirstLoginUser : String;
  vUPTime, vUP2Time,
  vDNTime : String;
  vReg    :Variant;
  vStoreList :TStringList;
begin
  StringFieldSize := 1000;
  if ParamStr(1) = 'http' then
    RestBaseURL := 'http://www.exposcloud.co.kr:18008/Orange/|';
  msgProgramName    := 'CloudOrange';
  NoticesPanel.Visible := false;
  Application.OnException := UnhandledExceptionHandler;
//  if not isDebugMode and (Sender <> nil) and (ParamStr(1) <> 'Updater') and (ParamStr(1) <> 'execute') then
  if not isDebugMode and (Sender <> nil) and (ParamStr(1) <> 'Updater') and (ParamStr(1) <> 'execute') then
  begin
    if not FileExists(filUpdater) then
      FileDownLoad(filUpdater);


    if not DirectoryExists(ExtractFilePath(Application.ExeName)+'Download\') then
      ForceDirectories(ExtractFilePath(Application.ExeName)+'Download\');
    FileDownLoad(filUpInfoFile, 'Download\');

    with TIniFile.Create(ExtractFilePath(Application.ExeName)+'Download\'+filUpInfoFile) do
      try
        vUPTime  := ReadString('UPLOADDATE', filAppName, '');
        vUP2Time := ReadString('UPLOADDATE', filUpdater, '');
      finally
        Free;
      end;

    with TIniFile.Create(ExtractFilePath(Application.ExeName)+'Download\'+filDNInfoFile) do
      try
        vDNTime := ReadString('DOWNLOADINFO', filUpdater, '');
        if (vDNTime < vUP2Time) or not FileExists(Folder+filUpdater) then
        begin
          if FileDownLoad(filUpdater) then
            WriteString('DOWNLOADINFO', filUpdater, vUP2Time);
        end;

        vDNTime := ReadString('DOWNLOADINFO', filAppName, '');
        if vDNTime < vUPTime then
        begin
          if FileDownLoad(filAppName) then
            WriteString('DOWNLOADINFO', filAppName, vUPTime);
        end;
      finally
        Free;
      end;
                                                          //PWideChar('Orange')
    //다운받아놓은 Orange.exe 화일이 있으면
    if FileExists(PChar(ExtractFilePath(Application.ExeName))+'\temp_'+ExtractFileName(Application.ExeName)) then
    begin
      ShellExecute(Handle, 'open',  Pchar('Updater.exe'), 'FileChange', PChar(ExtractFileName(Application.ExeName)), SW_NORMAL);
      Application.Terminate;
      Exit;
    end;
  end;

  if (Sender = nil) then
    isStoreChange := true
  else
  begin
    isStoreChange := false;
  end;

  if not Assigned(StoreList) then
    StoreList := TStringList.Create;
  IsDebugMode       := IsDebuggerPresent;
  ProgramName       := pnOrange;

  if not isLogOut or not isStoreChange then
  begin
    // 타이틀바를 제거한다(Office2007 형태일 때 필요했던 코딩)
    //SetWindowLong(Handle, GWL_STYLE, GetWindowLong(Handle, GWL_STYLE) and not WS_CAPTION);
    Application.HintPause     :=  100;
    Application.HintHidePause := 5000;
    RibbonPreviewMenuButton.Width := 125;

    if ExtremeMainForm.Showing then
    begin
      for vIndex := 0 to RibbonPreviewMenu.MenuItems.Count-1 do
        for vIndex2 := RibbonPreviewMenu.MenuItems[vIndex].SubItems.Count-1 downto 0 do
            RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := True;

    end;

    // 기본값을 불러온다
    ReadDefault;

    if Assigned(SplashForm) and SplashForm.Showing then
    begin
      SplashForm.Hide;
      FreeAndNil(SplashForm);
    end;

    // 로그인을 한다
    if not isStoreChange and not CheckUser then
    begin
      Self.OnShow := nil;
      Application.Terminate;
      Exit;
    end;

    if (UserLevel = 'E') or (UserLevel = 'P') then
    begin
      ToolTab.Visible       := false;
      ToolMenuPanel.Visible := false;
     //그리드정보를 읽어온다
      DM.ReadGridQuery;

      //주문포스 내역
      if UserLevel = 'P' then
      begin
        DM.OpenQuery('select 1, POS_COUNT '
                    +'  from PARTNER '
                    +' where CD_PARTNER = (select CD_PARTNER '
                    +'                       from USER_MASTER '
                    +'                      where ID_USER =:P0) '
                    +'union all '
                    +'select 2, Sum(case when ALLOW_POS > 1 then ALLOW_POS-1 else 0 end) as USE_COUNT '
                    +'  from CUSTOMER '
                    +' where CD_PARTNER  =(select CD_PARTNER '
                    +'                       from USER_MASTER '
                    +'                      where ID_USER =:P0) '
                    +'   and DS_STATUS in (''0'',''1'') ' //정상과 일시중지만 카운트한다
                    +' order by 1 ',
                    [UserCode],false,RestBaseURL);

        vTemp := '';
        while not DM.Query.Eof do
        begin
          if DM.Query.Fields[0].AsInteger = 1 then
            vTemp := DM.Query.Fields[1].AsString
          else
            vTemp := Format('%s [ %d ]',[vTemp, DM.Query.Fields[1].AsInteger]);
          DM.Query.Next;
        end;
        DM.Query.Close;
        StatusBar.Panels[3].Text := vTemp;
      end;
      //메뉴리스트를 바꾼다
      RibbonPreviewMenuButton.AdvPreviewMenu := StorePreviewMenu;
      FormatSettings.DateSeparator   := '-';
      FormatSettings.ShortDateFormat := fmtDate;

      // 상태 표시줄에 현재 상태를 표시한다
      StatusBar.Panels[0].Text := 'CloudDataBase'+CloudServer;
      StatusBar.Panels[2].Text := UserName;
      StatusBar.Panels[5].Text := ' Ver '+GetFileVersion;
      RibbonPreviewMenu.Buttons[1].Visible := false;
      RibbonStoreChangeButton.Visible      := false;
      NoticeButton.Visible                 := false;

      //해지요청내역이 있으면 보여준다
      if UserLevel = 'E' then
      begin
        DM.OpenQuery('select Count(*) '
                    +'  from CUSTOMER '
                    +' where DS_STATUS = ''R'' ',
                    [UserCode],false,RestBaseURL);
        if DM.Query.Fields[0].AsInteger > 0 then
        begin
          ShowNotice(Format('%d 매장 해지요청 매장이 있습니다',[DM.Query.Fields[0].AsInteger]),'');
          DM.Query.Close;
        end;
        DM.Query.Close;
      end;
      Exit;
    end;
  end
  else //if StoreCode <> StandardStore then
  begin
    vStoreList := TStringList.Create;
    vStoreList.Assign(StoreList);
    // 로그인을 한다
    if not CheckUser(StoreCode) then
    begin
      Self.OnShow := nil;
      Application.Terminate;
      Exit;
    end;
    StoreList.Assign(vStoreList);
    vStoreList.Free;
  end;

  WorkStoreList := TStringList.Create;
  try
    if Common.isWindows64 then
    begin
      vReg := GetRegistry(HKEY_LOCAL_MACHINE, 'SOFTWARE\WOW6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION', 'Orange.exe' );
      if (VarType(vReg) = varString) or (VarType(vReg) = varUString)   then
        SetRegistry(HKEY_LOCAL_MACHINE, 'SOFTWARE\WOW6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION','Orange.exe', $000);
    end
    else
    begin
      vReg := GetRegistry(HKEY_LOCAL_MACHINE, 'SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION', 'Orange.exe' );
      if (VarType(vReg) = varString) or (VarType(vReg) = varUString)   then
        SetRegistry(HKEY_LOCAL_MACHINE, 'SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION','Orange.exe', $000);
    end;

    //Rest TimeOut
    vReg := GetRegistry(HKEY_CURRENT_USER, 'SOFTWARE\Microsoft\Windows\CurrentVersion\InternetSettings', 'ConnectTimeOut');
    if String(vReg) = '' then
      SetRegistry(HKEY_CURRENT_USER, 'SOFTWARE\Microsoft\Windows\CurrentVersion\InternetSettings', 'ConnectTimeOut',  Integer(360000));
    vReg := GetRegistry(HKEY_CURRENT_USER, 'SOFTWARE\Microsoft\Windows\CurrentVersion\InternetSettings', 'SendTimeOut');
    if String(vReg) = '' then
      SetRegistry(HKEY_CURRENT_USER, 'SOFTWARE\Microsoft\Windows\CurrentVersion\InternetSettings', 'SendTimeOut',  Integer(360000));
    vReg := GetRegistry(HKEY_CURRENT_USER, 'SOFTWARE\Microsoft\Windows\CurrentVersion\InternetSettings', 'ReceiveTimeOut');
    if String(vReg) = '' then
      SetRegistry(HKEY_CURRENT_USER, 'SOFTWARE\Microsoft\Windows\CurrentVersion\InternetSettings', 'ReceiveTimeOut',  Integer(360000));
    vReg := GetRegistry(HKEY_CURRENT_USER, 'SOFTWARE\Microsoft\Windows\CurrentVersion\InternetSettings', 'KeepAliveTimeOut');
    if String(vReg) = '' then
      SetRegistry(HKEY_CURRENT_USER, 'SOFTWARE\Microsoft\Windows\CurrentVersion\InternetSettings', 'KeepAliveTimeOut',  Integer(360000));
  except
  end;
  RibbonStoreChangeButton.Visible := StoreList.Count > 1;

  //저장하지 못했던 로그내역 로딩
  if FileExists(Folder+'Log.Log') then
  begin
    if not Assigned(LogList) then
      LogList := TStringList.Create;

    LogList.LoadFromFile(Folder+'LogList.Log');
  end;

  // DB에서 회사 정보 등을 읽어온다
  try
    DM.OpenQuery('select   NM_HEADSTORE, '
                +'         NM_STORE, '
                +'         OPTIONS, '
                +'         NO_BIZER, '
                +'         TEL_OFFICE, '
                +'         SELFMENU_LEN, '
                +'         SELFMENU_PREFIX, '
                +'         SELFGOODS_LEN, '
                +'         SELFGOODS_PREFIX, '
                +'         SCALE_PREFIX, '
                +'         COUPON_PREFIX, '
                +'         COUPON_LEN, '
                +'         CONNECTION_LIMIT, '
                +'         ALLOW_POS, '
                +'         ALLOW_KIOSK, '
                +'         HEAD_OPTIONS '
                +'  from   MS_STORE '
                +' where   CD_HEAD  =:P0 '
                +'   and   CD_STORE =:P1',
                 [HeadStoreCode,
                  StoreCode]);
    if not DM.Query.Eof then
    begin
      StoreName        := DM.Query.FieldByName('NM_STORE').AsString;
      HeadStoreName    := DM.Query.FieldByName('NM_HEADSTORE').AsString;
      Options          := RPad(DM.Query.FieldByName('OPTIONS').AsString, 600, '0');
      StoreOptions      := RPad(DM.Query.FieldByName('HEAD_OPTIONS').AsString, 30, '0');
      BusinessNumber   := DM.Query.FieldByName('NO_BIZER').AsString;
      StoreTelNumber   := DM.Query.FieldByName('TEL_OFFICE').AsString;
      SelfMenuLength   := DM.Query.FieldByName('SELFMENU_LEN').AsInteger;
      SelfMenuPrefix   := DM.Query.FieldByName('SELFMENU_PREFIX').AsString;
      SelfGoodsLength  := DM.Query.FieldByName('SELFGOODS_LEN').AsInteger;
      SelfGoodsPrefix  := DM.Query.FieldByName('SELFGOODS_PREFIX').AsString;
      ScaleCodePrefix  := DM.Query.FieldByName('SCALE_PREFIX').AsString;
      ScaleCodeLength  := 4;
      CouponPrefix     := DM.Query.FieldByName('COUPON_PREFIX').AsString;
      CouponLen        := DM.Query.FieldByName('COUPON_LEN').AsInteger;
      ConnectionLimit  := DM.Query.FieldByName('CONNECTION_LIMIT').AsInteger;
      AllowPos         := DM.Query.FieldByName('ALLOW_POS').AsInteger;
      AllowKiosk       := DM.Query.FieldByName('ALLOW_KIOSK').AsInteger;
    end
    else
    begin
      MsgBox('매장정보가 없습니다(MS_STORE)');
      Self.OnShow := nil;
      Application.Terminate;
      Exit;
    end;
  finally
    DM.Query.Close;
  end;

  // 표준매장 옵션
  if HeadStoreCode = StandardStore  then
    RPad('0', 600, '0')
  else
  begin
    try
      DM.OpenQuery('select   OPTIONS '
                  +'  from   MS_STORE '
                  +' where   CD_HEAD  =:P0 '
                  +'   and   CD_STORE =:P1',
                   [HeadStoreCode,
                    StandardStore]);
      if not DM.Query.Eof then
        HeadOptions      := RPad(DM.Query.FieldByName('OPTIONS').AsString, 600, '0');
    finally
      DM.Query.Close;
    end;
  end;

  LoginEnd := false;
  DM.OpenQuery('select LOGIN_PC, '
              +'       LOGIN_MAC, '
              +'       CD_SAWON '
              +'  from MS_SAWON '
              +' where CD_STORE =:P0 '
              +'   and CD_SAWON =:P1 '
              +'   and Ifnull(LOGIN_MAC,'''') <> '''' '
              +'   and Ifnull(LOGIN_PC,'''')  <> '''' '
              +'   and (Ifnull(LOGIN_MAC,'''') <> :P2 or Ifnull(LOGIN_PC,'''') <> :P3) '
              +' order by LOGIN_DATE ',
              [StoreCode,
               UserCode,
               GetMacAddress,
               GetPCName]);

  vCount := 0;
  if not DM.Query.Eof then
  begin
    if vCount = 0 then
      vFirstLoginUser := DM.Query.Fields[2].AsString;
    vTemp := vTemp + Format('%s ',[DM.Query.Fields[0].AsString]);
    Inc(vCount);
    DM.Query.Next;
  end;
  DM.FinishQuery;

  if (ConnectionLimit > 0) and (vCount >= ConnectionLimit) and (vTemp <> '') and not AskBox('현재 '+vTemp+'로그인되어 있는 PC는 종료됩니다'+#13+'계속하시겠습니까?') then
  begin
    Application.Terminate;
    Exit;
  end;

  //인증제한 컨넥션이 초과했을때 첫번째접속한 사용자를 중지한다
  if (vCount+1) > ConnectionLimit then
  begin
    DM.ExecQuery('update MS_SAWON '
                +'   set LOGIN_PC   ='''', '
                +'       LOGIN_MAC  ='''', '
                +'       LOGIN_DATE = NOW() '
                +' where CD_HEAD  =:P0 '
                +'   and CD_STORE =:P1 '
                +'   and CD_SAWON =:P2; ',
                [HeadStoreCode,
                 StoreCode,
                 vFirstLoginUser],false);
  end;

  DM.ExecQuery('update MS_SAWON '
              +'   set LOGIN_PC   =:P3, '
              +'       LOGIN_MAC  =:P4, '
              +'       LOGIN_DATE = NOW() '
              +' where CD_HEAD  =:P0 '
              +'   and CD_STORE =:P1 '
              +'   and CD_SAWON =:P2;',
              [HeadStoreCode,
               StoreCode,
               UserCode,
               GetPCName,
               GetMacAddress],true);

  LoginEnd := true;
  // 외상 매입금, 매출금 등 기본 코드를 읽어온다
  try
    DM.OpenQuery('select   CD_CODE, '
                +'         NM_CODE2,'
                +'         NM_CODE3 '
                +'  from   MS_CODE '
                +' where   CD_HEAD  = :P0 '
                +'   and   CD_STORE = :P1 '
                +'   and   CD_KIND  = ''11'' ',
                 [HeadStoreCode,
                  StoreCode]);
    while not DM.Query.Eof do
    begin
      //회원외상대금
      if (DM.Query.Fields[1].AsString = '0') and (DM.Query.Fields[2].AsString = '2') then
        CreditIn := DM.Query.Fields[0].AsString
      //현금매입
      else if (DM.Query.Fields[1].AsString = '1') and (DM.Query.Fields[2].AsString = '2') then
        CashOut := DM.Query.Fields[0].AsString
      //외상매입대금지급
      else if (DM.Query.Fields[1].AsString = '1') and (DM.Query.Fields[2].AsString = '3') then
        CreditOut := DM.Query.Fields[0].AsString;
      DM.Query.Next;
    end;
  finally
    DM.Query.Close;
  end;

  if CreditIn = EmptyStr then
    CreditIn := '001';
  if CashOut = EmptyStr then
    CashOut := '002';
  if CreditOut = EmptyStr then
    CreditOut := '003';

  //그리드정보를 읽어온다
  DM.ReadGridQuery;

  // 부가세율을 지정한다
  TaxRate := 1.1;

  FormatSettings.DateSeparator   := '-';
  FormatSettings.ShortDateFormat := fmtDate;

  // 상태 표시줄에 현재 상태를 표시한다
  StatusBar.Panels[0].Text := 'CloudDataBase'+CloudServer;
  StatusBar.Panels[2].Text := UserName;
  StatusBar.Panels[3].Text := StoreCode;
  StatusBar.Panels[5].Text := ' Ver '+GetFileVersion;

end;


//------------------------------------------------------------------------------
// 미처리 에러 처리기
procedure TExtremeMainForm.UnhandledExceptionHandler(Sender: TObject; E: Exception);
const
  MethodName = 'UnhandledException';
var vAction :String;
begin
  BlockInput(false);
  if (ActiveMDIChild <> nil) then
    vAction := ActiveMDIChild.Caption
  else
    vAction := '';
  LogSave('E',vAction, MethodName, '',  E.Message);
end;
//------------------------------------------------------------------------------
// 폼을 보여줄 때
procedure TExtremeMainForm.FormShow(Sender: TObject);
var vStream :TStream;
    vIndex  :Integer;
begin
  WindowState := wsMaximized;

  // 사용자 권한에 맞는 프로그램 목록을 새로 불러온다
  ReadProgramList;
  if (UserLevel = 'E') or (UserLevel = 'P') then
  begin
    for vIndex := RibbonFavoritePageFavoriteToolBar.ControlCount-1 downto 0 do
      RibbonFavoritePageFavoriteToolBar.Controls[vIndex].Free;

    // 즐겨찾기 목록을 새로 불러온다
    ReadFavoriteList;

    // 즐겨찾기 탭을 활성화 한다
    Ribbon.ActivePageIndex := 0;
    Ribbon.Width := ClientWidth;

    FClientInstance := MakeObjectInstance(ClientWndProc);
    FPrevClientProc := Pointer(GetWindowLong(ClientHandle,GWL_WNDPROC));
    SetWindowLong(ClientHandle,GWL_WNDPROC,LongInt(FClientInstance));
    RibbonPreviewMenuButton.Click;

    Exit;
  end;

  // 즐겨찾기 목록을 새로 불러온다
  ReadFavoriteList;

  // 즐겨찾기 탭을 활성화 한다
  Ribbon.ActivePageIndex := 0;
  Ribbon.Width := ClientWidth;

  Ribbon.Caption.Caption := StoreName;//msgProgramName;
  Application.Title      := msgProgramName;
  Application.ProcessMessages;

  //영수증프린터 기종에 따른 42칼럼 또는 48칼럼
  PrintBlank := 0;

  FClientInstance := MakeObjectInstance(ClientWndProc);
  FPrevClientProc := Pointer(GetWindowLong(ClientHandle,GWL_WNDPROC));
  SetWindowLong(ClientHandle,GWL_WNDPROC,LongInt(FClientInstance));

  if not isStoreChange and (GetStoreOption(1) ='1') and (UserLevel <> 'E') and (UserLevel <> 'P') then
  begin
    DM.OpenQuery('select SEQ, '
                +'       DS_SHOW, '
                +'       NOTICE_TEXT '
                +'  from MS_NOTICE '
                +' where CD_HEAD  =:P0 '
                +'   and CD_STORE =:P1 '
                +'   and DS_NOTICE in (''A'',''B'') '
                +'   and (DS_SHOW = ''R'' or (DS_SHOW = ''U''  and not Ifnull(SHOWN_STORE,'''') like :P2)) '
                +'   and (ifnull(CD_STORE_NOTICE,'''') = '''' or CD_STORE_NOTICE like :P3) '
                +'   and YMD_FROM <= Date_Format(NOW(), ''%Y%m%d'') '
                +'   and YMD_TO >= Date_Format(NOW(), ''%Y%m%d'') '
                +'   and YN_SHOW = ''Y'' '
                +' order by YN_HOT, SEQ desc '
                +' limit 1 ',
                [HeadStoreCode,
                 StandardStore,
                 '%'+StoreCode+':'+UserCode+'%',
                 '%'+StoreCode+'%']);

    if not DM.Query.Eof then
    begin
      try
        vStream := TMemoryStream.Create;
        NoticesPanel.Left := (Self.Width - Ifthen(ToolTab.Visible, ToolTab.Width +50, 50)) div 2 - NoticesPanel.Width div 2;
        NoticesPanel.Top  := (Self.Height-200) div 2 - NoticesPanel.Height div 2;

        NoticesPanel.Visible    := true;
        NoticesEditor.Tag       := DM.Query.FieldByName('SEQ').AsInteger;
        NoShowCheckBox.Visible  := DM.Query.FieldByName('DS_SHOW').AsString = 'U';
        vStream := DM.Query.CreateBLOBStream(DM.Query.FieldByName('NOTICE_TEXT'), bmRead);
        NoticesEditor.LoadFromStream(vStream);
      finally
        vStream.Free;
      end;
    end;

    DM.Query.Close;


    // 일정관리를 띄운다
    //프로그램 시작 시 일정관리 실행
    if not isStoreChange and not NoticesPanel.Visible and (GetOption(171) = '1') then
      RunProgram('SystemSchedule');

    // 메뉴 표시 힌트를 보여준다
    if not isStoreChange and not NoticesPanel.Visible and not ToolMenuPanel.Visible then
      RibbonPreviewMenuButton.Click;
  end;
end;


procedure TExtremeMainForm.LogOutTimerTimer(Sender: TObject);
begin
end;

//------------------------------------------------------------------------------
// 폼 크기를 변경할 때
procedure TExtremeMainForm.FormResize(Sender: TObject);
begin
  // 폼을 최대화하면 폼 크기를 전체화면에 맞게 키운다
  if WindowState = wsMaximized then
  begin
    Left   := Screen.MonitorFromWindow(Handle).Left;
    Top    := Screen.MonitorFromWindow(Handle).Top;
    Width  := Screen.MonitorFromWindow(Handle).Width;
    Height := Screen.MonitorFromWindow(Handle).Height;
  end;

  // 상태표시줄 크기를 조정한다
  StatusBar.Panels[1].Width := Width - StatusBar.Panels[0].Width - StatusBar.Panels[2].Width - StatusBar.Panels[3].Width - StatusBar.Panels[4].Width - StatusBar.Panels[5].Width - 30;

  // 알림창 크기를 조정한다
  ShowNotice(EmptyStr, EmptyStr, 0);
end;
//------------------------------------------------------------------------------
// 폼을 닫기 전
procedure TExtremeMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := AskBox(''''+Application.Title+''' 프로그램을 종료하시겠습니까?');
end;
//------------------------------------------------------------------------------
// 폼을 닫을 때
procedure TExtremeMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var vIndex :Integer;
    vTemp, vSQL  :String;
begin
  Timer.Enabled := False;
  if (UserLevel = 'E') or (UserLevel = 'P') then Exit;
  DM.ExecQuery('update MS_SAWON '
              +'   set LOGIN_PC   ='''', '
              +'       LOGIN_MAC  ='''', '
              +'       LOGIN_DATE = NOW() '
              +' where CD_HEAD  =:P0 '
              +'   and CD_STORE =:P1 '
              +'   and CD_SAWON =:P2; ',
              [HeadStoreCode,
               StoreCode,
               UserCode],true);

   if Assigned(LogList) then
  begin
    vSQL := '';

    for vIndex := 0 to LogList.Count-1 do
      vSQL := vSQL + Format('(''%s'',''%s'',''%s'',''00'',''%s'',''%s'',''%s'',''%s'', ''%s'', ''%s'', Cast(''%s'' as DateTime)),',
                           [HeadStoreCode,
                            StoreCode,
                            GetOnlyNumber(LeftStr(CopyPos(LogList.Strings[vIndex], splitColumn, 6),10)),
                            Replace(CopyPos(LogList.Strings[vIndex], splitColumn, 0),'''','´'),
                            Replace(CopyPos(LogList.Strings[vIndex], splitColumn, 1),'''','´'),
                            Replace(CopyPos(LogList.Strings[vIndex], splitColumn, 2),'''','´'),
                            Replace(CopyPos(LogList.Strings[vIndex], splitColumn, 3),'''','´'),
                            Replace(CopyPos(LogList.Strings[vIndex], splitColumn, 4),'''','´'),
                            Replace(CopyPos(LogList.Strings[vIndex], splitColumn, 5),'''','´'),
                            CopyPos(LogList.Strings[vIndex], splitColumn, 6)]);

    vSQL := Replace(vSQL,';','');
    if DM.ExecQuery('insert into LOG(CD_COMPANY, '
                   +'                CD_CUSTOMER, '
                   +'                YMD_LOG, '
                   +'                NO_POS, '
                   +'                DS_LOG, '
                   +'                FORM_NAME, '
                   +'                ACTION_NAME, '
                   +'                ACTION_TEXT, '
                   +'                LOG_TEXT, '
                   +'                VERSION, '
                   +'                DT_INSERT) Values '
                   +LeftStr(vSQL, Length(vSQL)-1)+';',[],true,RestBaseURL) then
      LogList.Free
    else
    begin
      LogList.SaveToFile(Folder+'LogList.Log');
      LogList.Free;
    end;
  end;

  if Assigned(ProgramUseLogList) and not IsDebugMode then
  begin
    vSQL := '';
    for vIndex := 0 to ProgramUseLogList.Count-1 do
      vSQL := vSQL + ProgramUseLogList.Strings[vIndex];

    if vSQL <> '' then
    begin
      vSQL :=  'insert into PROGRAM_LOG(CD_HEAD, CD_STORE, YMD_LOG, PROGRAM_ID, PROGRAM_NAME, CD_SAWON, IP_ADDRESS, MAC_ADDRESS, VERSION, DT_CHANGE) values '
             +LeftStr(vSQL, Length(vSQL)-1)+';';
      DM.ExecQuery(vSQL, [],false);
    end;
    DM.ExecQuery('', [],true);
  end;

  // 메뉴 툴바 상태를 저장한다
  SetIniFile(iniMain, 'SideMenu',      IfThen(ToolMenuPanel.Locked, '1', '0'));
  SetIniFile(iniMain, 'SideMenuWidth', IntToStr(ToolMenuPanel.Width));
  SetIniFile(iniMain, 'ToolBar',       IfThen(Ribbon.Height = 110, '1', '0'));
  SetIniFile(iniMain, 'ExpandedMenu', '');
  vTemp := EmptyStr;
  for vIndex := 0 to MenuTreeView.Items.Count-1 do
  begin
    if (MenuTreeView.Items[vIndex].Count > 0) and (MenuTreeView.Items[vIndex].Expanded) then
      vTemp := vTemp + Format('[%s]',[MenuTreeView.Items[vIndex].Text]);
  end;
  if vTemp <> EmptyStr then
    SetIniFile(iniMain, 'ExpandedMenu', vTemp);
end;

//------------------------------------------------------------------------------
// 알림 레이블을 눌렀을 때
procedure TExtremeMainForm.NoShowCheckBoxClick(Sender: TObject);
begin
  DM.ExecQuery('update MS_NOTICE '
              +'   set SHOWN_STORE = ConCat(Ifnull(SHOWN_STORE,''''),'','',:P3), '
              +'       SHOWN_COUNT = SHOWN_COUNT + 1 '
              +' where CD_HEAD  =:P0 '
              +'   and CD_STORE =:P1 '
              +'   and SEQ      =:P2;',
              [HeadStoreCode,
               StandardStore,
               NoticesEditor.Tag,
               StoreCode+':'+UserCode],false);

  DM.ExecQuery('insert into MS_NOTICE_READ(CD_HEAD, '
              +'                           CD_STORE, '
              +'                           SEQ, '
              +'                           SEQ1, '
              +'                           DS_READ, '
              +'                           CD_STORE_READ, '
              +'                           CD_SAWON, '
              +'                           YN_STOP, '
              +'                           MAC_ADDRESS, '
              +'                           IP_ADDRESS, '
              +'                           DT_READ) '
              +'                    Values(:P0, '
              +'                           :P1, '
              +'                           :P2, '
              +'                           (select Ifnull(Max(SEQ1),0)+1 '
              +'                              from MS_NOTICE_READ as s '
              +'                             where CD_HEAD  =:P0 '
              +'                               and CD_STORE =:P1 '
              +'                               and SEQ      =:P2), '
              +'                           ''B'', '
              +'                           :P3, '
              +'                           :P4, '
              +'                           :P5, '
              +'                           :P6, '
              +'                           :P7, '
              +'                           Now());',
              [HeadStoreCode,
               StandardStore,
               NoticesEditor.Tag,
               StoreCode,
               UserCode,
               'Y',
               GetMacAddress,
               GetIPAddress],true);

  NoticesPanel.Visible := false;
end;

procedure TExtremeMainForm.NoticeButtonClick(Sender: TObject);
begin
  RunProgram('SystemNotice');
end;

procedure TExtremeMainForm.NoticeCloseButtonClick(Sender: TObject);
begin
  DM.ExecQuery('update MS_NOTICE '
              +'   set SHOWN_COUNT = SHOWN_COUNT + 1 '
              +' where CD_HEAD  =:P0 '
              +'   and CD_STORE =:P1 '
              +'   and SEQ      =:P2;',
              [HeadStoreCode,
               StandardStore,
               NoticesEditor.Tag],false);

  DM.ExecQuery('insert into MS_NOTICE_READ(CD_HEAD, '
              +'                           CD_STORE, '
              +'                           SEQ, '
              +'                           SEQ1, '
              +'                           DS_READ, '
              +'                           CD_STORE_READ, '
              +'                           CD_SAWON, '
              +'                           MAC_ADDRESS, '
              +'                           IP_ADDRESS, '
              +'                           DT_READ) '
              +'                    Values(:P0, '
              +'                           :P1, '
              +'                           :P2, '
              +'                           (select Ifnull(Max(SEQ1),0)+1 '
              +'                              from MS_NOTICE_READ as s '
              +'                             where CD_HEAD  =:P0 '
              +'                               and CD_STORE =:P1 '
              +'                               and SEQ      =:P2), '
              +'                           ''B'', '
              +'                           :P3, '
              +'                           :P4, '
              +'                           :P5, '
              +'                           :P6, '
              +'                           Now());',
              [HeadStoreCode,
               StandardStore,
               NoticesEditor.Tag,
               StoreCode,
               UserCode,
               GetMacAddress,
               GetIPAddress],true);

  NoticesPanel.Visible := false;
end;

procedure TExtremeMainForm.NoticeLabelClick(Sender: TObject);
begin
  // 연결 프로그램을 실행한다
  if NoticeLabel.Hint <> EmptyStr then
  begin
    NoticePanel.SetFocus;
    RunProgram(NoticeLabel.Hint);
    NoticePanel.Tag := 1;
  end;
end;

procedure TExtremeMainForm.PosSendMessage;
var vHandle :THandle;
    vTemp   :AnsiString;
    vData  : TCopyDataStruct;
begin
  if GetStoreOption(10) = '1' then Exit;

  vHandle := FindWindow('TMain_F', nil );          //-- 받는 프로그램 이름
  vTemp := 'ConfigChange';
  vData.dwData:=0;
  vData.cbData:=Length(vTemp)+1;
  vData.lpData:=PAnsiChar(vTemp);

  SendMessage(vHandle, WM_COPYDATA, Self.Handle, Integer(@vData));
end;

//------------------------------------------------------------------------------
// 원격지원 버튼
procedure TExtremeMainForm.RibbonPreviewMenuButtons2Click(Sender: TObject; Button: TButtonCollectionItem);
begin
  with TAboutForm.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TExtremeMainForm.RibbonPreviewMenuButtons3Click(Sender: TObject;
  Button: TButtonCollectionItem);
var
  vURL: string;
begin
  vURL := GetIniFile('POS', 'HELPURL', 'http://ezh.kr/extremepos');
  if vURL <> EmptyStr then
    ShellExecute(handle, 'open', PChar(vURL), '', '', SW_SHOW);
end;

procedure TExtremeMainForm.RibbonPreviewMenuButtons4Click(Sender: TObject;
  Button: TButtonCollectionItem);
var vVersion, vFileName, vTemp :String;
    vBatch :TStringList;
begin
  vVersion := TOSVersion.ToString;
  if Pos('64-bit', vVersion) > 0 then
    vFileName := 'rustdesk.exe'
  else
    vFileName := 'rustdesk32.exe';

  if not FileExists(Folder+vFileName) then
    Common.FileDownLoad(vFileName, '');

  try
    vBatch     := TStringList.Create;
    vBatch.Clear;
    vBatch.Add('@echo off');
    if not IsRustDeskInstalled then
    begin
      if Pos('64-bit', vVersion) > 0 then
      begin
        vBatch.Add('rustdesk.exe --silent-install');
      end
      else
      begin
        vBatch.Add('rustdesk32.exe --silent-install');
      end;
      vBatch.Add('echo RustDesk 설치중 입니다. 장시만 기다려주세요');
      vBatch.Add('timeout /t 10 /nobreak > nul');
      vBatch.Add('echo 서비스를 등록합니다.');
    end;
    if Pos('64-bit', vVersion) > 0 then
    begin
      vBatch.Add('rustdesk.exe --install-service');
      vBatch.Add('taskkill /f /im rustdesk.exe');
    end
    else
    begin
      vBatch.Add('rustdesk32.exe --install-service');
      vBatch.Add('taskkill /f /im rustdesk32.exe');
    end;
    vBatch.Add('rustdesk --tray');
    vBatch.SaveToFile(Folder+'rust.bat');
    ExecuteProgram('rust.bat',Folder,'',true);
    DeleteFile(Folder+'rust.bat');
  finally
    vBatch.Free;
  end;
  Clipboard.Clear;
  if Pos('64-bit', vVersion) > 0 then
    Clipboard.AsText := '9JSP3BVYB5UTNtUW25WcRdWMZllU5w2QCNHbvFVbFpndhVmcvhFTxATb4UjUyIiOikXZrJCLiIiOikGchJCLiI3au82YuM3bwhXZuc3d3JiOikXYsVmciwiIytmLvNmLz9Gc4VmL3d3diojI0N3boJye'
  else
    Clipboard.AsText := '2R58m01LXoreavzEmQolsBCl9RYY1gQqnvYKMMNAaPw=';

  ExecuteProgram('rustdesk.exe','C:\Program Files\RustDesk','',true);
end;

//------------------------------------------------------------------------------
// About 버튼
procedure TExtremeMainForm.RibbonPreviewMenuButtons1Click(Sender: TObject; Button: TButtonCollectionItem);
var i:Integer;
begin
  for i := MDIChildCount - 1 downto 0 do MDIChildren[i].Close;

  SetRegistry(HKEY_CURRENT_USER, 'ExtremePOS\CloudOrange\', 'UserPWD', '');
  if (UserLevel <> 'E') and (UserLevel <> 'P') then
    DM.ExecQuery('update MS_SAWON '
                +'   set LOGIN_PC   ='''', '
                +'       LOGIN_MAC  ='''', '
                +'       LOGIN_DATE = NOW() '
                +' where CD_HEAD  =:P0 '
                +'   and CD_STORE =:P1 '
                +'   and CD_SAWON =:P2; ',
                [HeadStoreCode,
                 StoreCode,
                 UserCode],true);

  isLogOut  := true;
  StoreCode := '';
  FormCreate(nil);
  FormShow(nil);
end;
//------------------------------------------------------------------------------
// ExtremeMart 끝내기 버튼
procedure TExtremeMainForm.RibbonPreviewMenuButtons0Click(Sender: TObject; Button: TButtonCollectionItem);
begin
  Close;
end;

//==============================================================================
// 리본
//------------------------------------------------------------------------------
// 메뉴를 눌렀을 때
procedure TExtremeMainForm.RibbonPreviewMenuSubMenuItemClick(Sender: TObject; ItemIndex, SubMenuItemIndex: Integer);
begin
  // 연결 프로그램을 실행한다
  RunProgram(RibbonPreviewMenu.MenuItems.Items[ItemIndex].SubItems.Items[SubMenuItemIndex].ShortCutHint);
end;
//------------------------------------------------------------------------------
// 자주 쓰는 프로그램 버튼

//------------------------------------------------------------------------------
// 리본 확대/축소 버튼
procedure TExtremeMainForm.RibbonQuickAccessButtonClick(Sender: TObject);
begin
  if Ribbon.Height = 110 then
    Ribbon.Height := 54
  else
    Ribbon.Height := 110;
  RibbonFavoritePage.TabVisible := Ribbon.Height = 110;
  RibbonWindowPage.TabVisible   := RibbonFavoritePage.TabVisible;
  RibbonOftenRunPage.TabVisible := RibbonFavoritePage.TabVisible;
end;
procedure TExtremeMainForm.RibbonStoreChangeButtonClick(Sender: TObject);
var i:Integer;
    vStoreCode:String;
begin
  vStoreCode := StoreCode;
  DM.SetGridData;
  with TStoreSelectForm.Create(self) do
  try
    isStoreChange := true;
    if ShowModal <> mrOK then Exit;
  finally
    Free;
  end;

  //폼은 닫지 않고 조회 내용만 Clear 한다
  for i := MDIChildCount - 1 downto 0 do
  try
    MDIChildren[i].Close;
  except
  end;

  DM.ExecQuery('update MS_SAWON '
              +'   set LOGIN_PC   ='''', '
              +'       LOGIN_MAC  ='''', '
              +'       LOGIN_DATE = NOW() '
              +' where CD_HEAD  =:P0 '
              +'   and CD_STORE =:P1 '
              +'   and CD_SAWON =:P2; ',
              [HeadStoreCode,
               vStoreCode,
               UserCode],true);

  isStoreChange := true;
  FormCreate(nil);
  FormShow(nil);

  DM.OpenQuery('select ALLOW_MENUCOUNT '
              +'  from CUSTOMER      '
              +' where CD_COMPANY    = :P0 '
              +'   and CD_CUSTOMER   = :P1 ',
              [HeadStoreCode,
               StoreCode],false,RestBaseURL);
  if not DM.Query.Eof then
    AllowMenuCount        := DM.Query.FieldByName('ALLOW_MENUCOUNT').AsInteger;
  DM.Query.Close;
  isStoreChange := false;
end;

//------------------------------------------------------------------------------
// 즐겨찾기,창 버튼
procedure TExtremeMainForm.RibbonProgramRunButtonClick(Sender: TObject);
begin
  // 연결 프로그램을 실행한다
  if TAdvToolBarButton(Sender).Hint <> EmptyStr then
    RunProgram(TAdvToolBarButton(Sender).Hint);
end;
//------------------------------------------------------------------------------
// 즐겨찾기 - 추가 버튼
procedure TExtremeMainForm.RibbonFavoritePageManagerAddButtonClick(Sender: TObject);
var
  vIndex: Integer;
  vFormCaption, vFormName : string;
begin
  // 지금 실행 중인 프로그램이 있는지 확인한다
  if ActiveMDIChild = nil then
    ShowMsg('실행 중인 프로그램이 없습니다.', true)
  else
  begin
    vFormCaption := ActiveMDIChild.Caption;
    vFormName    := Copy(ActiveMDIChild.Name, 1, Length(ActiveMDIChild.Name)-4);

    // 기존에 즐겨찾기에 있던 프로그램인지 확인한다
    for vIndex := 0 to RibbonFavoritePageFavoriteToolBar.ControlCount-1 do
      if TControl(RibbonFavoritePageFavoriteToolBar.Controls[vIndex]).Hint = vFormName then
      begin
        ShowMsg('이미 즐겨찾기에 추가된 프로그램입니다.', true);
        Exit;
      end;

    // 즐겨찾기 추가 화면을 보여준다
    with TFavoriteForm.Create(Self) do
      try
        NameEdit.Text := vFormCaption;
        aFormName     := vFormName;
        if ShowModal <> mrOK then
          Exit;
      finally
        Free;
      end;

    // 지금 실행 중인 프로그램을 즐겨찾기 버튼으로 추가한다
    AddToolBarButton(RibbonFavoritePageFavoriteToolBar, vFormCaption, vFormName);
    TAdvToolBarButton(RibbonFavoritePageFavoriteToolBar.Controls[RibbonFavoritePageFavoriteToolBar.ControlCount-1]).PopupMenu := RibbonFavoritePageFavoriteToolBarPopupMenu;
  end;
end;
//------------------------------------------------------------------------------
// 즐겨찾기 - 삭제 팝업메뉴
procedure TExtremeMainForm.RibbonFavoritePageFavoriteToolBarPopupMenuDeleteClick(Sender: TObject);
var
  vFormName: string;
begin
  if RibbonFavoritePageFavoriteToolBarPopupMenu.PopupComponent is TAdvToolBarButton then
  begin
    // 즐겨찾기 버튼을 삭제한다
    vFormName := TAdvToolBarButton(RibbonFavoritePageFavoriteToolBarPopupMenu.PopupComponent).Hint;
    TAdvToolBarButton(RibbonFavoritePageFavoriteToolBarPopupMenu.PopupComponent).Free;

    if (UserLevel = 'E') or  (UserLevel = 'P') then
      DM.ExecQuery('delete '
                  +'  from USER_FAVORITE '
                  +' where ID_USER  = :P0 '
                  +'   and ACT_CODE = :P1;',
                  [UserCode, vFormName],true,RestBaseURL)
    else
      // DB에서 즐겨찾기를 삭제한다
      DM.ExecQuery('delete '
                  +'  from MS_SAWON_FAV '
                  +' where CD_HEAD  = :P0 '
                  +'   and CD_STORE = :P1 '
                  +'   and CD_SAWON = :P2 '
                  +'   and ACT_CODE = :P3;',
                  [HeadStoreCode, StoreCode, UserCode, vFormName]);
  end;
end;
//------------------------------------------------------------------------------
// 즐겨찾기 - 수정 팝업메뉴
procedure TExtremeMainForm.RibbonFavoritePageFavoriteToolBarPopupMenuEditClick(Sender: TObject);
var
  vPNG   : TdxPNGImage;
  vStream: TStream;
begin
  if RibbonFavoritePageFavoriteToolBarPopupMenu.PopupComponent is TAdvToolBarButton then
  begin
    // 즐겨찾기 수정 폼을 보여준다
    with TFavoriteForm.Create(Self) do
      try
        NameEdit.Text := TAdvToolBarButton(RibbonFavoritePageFavoriteToolBarPopupMenu.PopupComponent).Caption;
        aFormName     := TAdvToolBarButton(RibbonFavoritePageFavoriteToolBarPopupMenu.PopupComponent).Hint;
        if ShowModal = mrOK then
        begin
          if Trim(NameEdit.Text) <> EmptyStr then
            TAdvToolBarButton(RibbonFavoritePageFavoriteToolBarPopupMenu.PopupComponent).Caption := NameEdit.Text;

          try
            if (UserLevel = 'E') or  (UserLevel = 'P') then
              DM.OpenQuery('select ICON '
                          +'  from USER_FAVORITE '
                          +' where ID_USER  = :P0 '
                          +'   and ACT_CODE = :P1 ',
                           [UserCode,
                            aFormName],true,RestBaseURL)
            else
              DM.OpenQuery('select ICON '
                          +'  from MS_SAWON_FAV '
                          +' where CD_HEAD  = :P0 '
                          +'   and CD_STORE = :P1 '
                          +'   and CD_SAWON = :P2 '
                          +'   and ACT_CODE = :P3 ',
                           [HeadStoreCode,
                            StoreCode,
                            UserCode,
                            aFormName]);
            if not DM.Query.Eof then
            begin
              try
                vStream := DM.Query.CreateBLOBStream(DM.Query.FieldByName('ICON'), bmRead);
                vPNG    := TdxPNGImage.Create;
                vPNG.LoadFromStream(vStream);
                TAdvToolBarButton(RibbonFavoritePageFavoriteToolBarPopupMenu.PopupComponent).Picture.Assign(vPNG);
              finally
                vStream.Free;
                vPNG.Free;
              end;
            end;
          finally
            DM.FinishQuery;
          end;

        end
        else
          Exit;
      finally
        Free;
      end;
  end;
end;
procedure TExtremeMainForm.RibbonFavoritePageFavoriteToolBarPopupMenuMoveClick(
  Sender: TObject);
var vFormName :String;
    vInput :String;
    vSeq   :Integer;
begin
  if not InputBox('이동하고 싶은 순서를 입력하세요', vInput, 2, false, true) then Exit;

  if StoI(vInput) <= 0 then
  begin
    MsgBox('순번을 정확히 입력하세요');
    Exit;
  end;

  if RibbonFavoritePageFavoriteToolBarPopupMenu.PopupComponent is TAdvToolBarButton then
  begin
    // 즐겨찾기 버튼을 삭제한다
    vFormName := TAdvToolBarButton(RibbonFavoritePageFavoriteToolBarPopupMenu.PopupComponent).Hint;

    if (UserLevel = 'E') or  (UserLevel = 'P') then
    begin
      try
        DM.OpenQuery('select SEQ '
                    +'  from USER_FAVORITE '
                    +'where  ID_USER  = :P0 '
                    +'  and  ACT_CODE = :P1',
                     [UserCode, vFormName],false,RestBaseURL);

        vSeq := DM.Query.Fields[0].AsInteger;
      finally
        DM.Query.Close;
      end;

      //뒤로 이동
      if StoI(vInput) > vSeq then
      begin
        DM.ExecQuery('update USER_FAVORITE '
                    +'   set SEQ = SEQ -1 '
                    +'where  ID_USER  = :P0 '
                    +'  and  SEQ     > :P1 '
                    +'  and  SEQ     <= :P2; ',
                     [UserCode, vSeq, StoI(vInput), vSeq],false);
      end
      else
      begin
        DM.ExecQuery('update USER_FAVORITE '
                    +'   set SEQ = SEQ + 1 '
                    +'where  ID_USER = :P0 '
                    +'  and  SEQ     >= :P1 '
                    +'  and  SEQ     < :P2; ',
                     [UserCode, StoI(vInput), vSeq],false);
      end;

      DM.ExecQuery('update USER_FAVORITE '
                  +'   set SEQ =:P2 '
                  +'where  ID_USER  = :P0 '
                  +'  and  ACT_CODE = :P1;',
                   [UserCode, vFormName, StoI(vInput)],true, RestBaseURL);
    end
    else
    begin
      try
        DM.OpenQuery('select SEQ '
                    +'  from MS_SAWON_FAV '
                    +'where  CD_STORE = :P0 '
                    +'  and  CD_SAWON = :P1 '
                    +'  and  ACT_CODE = :P2',
                     [StoreCode, UserCode, vFormName]);

        vSeq := DM.Query.Fields[0].AsInteger;
      finally
        DM.Query.Close;
      end;

      //뒤로 이동
      if StoI(vInput) > vSeq then
      begin
        DM.ExecQuery('update MS_SAWON_FAV '
                    +'   set SEQ = SEQ -1 '
                    +'where  CD_STORE = :P0 '
                    +'  and  CD_SAWON = :P1 '
                    +'  and  SEQ     > :P2 '
                    +'  and  SEQ     <= :P3; ',
                     [StoreCode, UserCode, vSeq, StoI(vInput), vSeq],false);
      end
      else
      begin
        DM.ExecQuery('update MS_SAWON_FAV '
                    +'   set SEQ = SEQ + 1 '
                    +'where  CD_STORE = :P0 '
                    +'  and  CD_SAWON = :P1 '
                    +'  and  SEQ     >= :P2 '
                    +'  and  SEQ     < :P3; ',
                     [StoreCode, UserCode, StoI(vInput), vSeq],false);
      end;

      DM.ExecQuery('update MS_SAWON_FAV '
                  +'   set SEQ =:P3 '
                  +'where  CD_STORE = :P0 '
                  +'  and  CD_SAWON = :P1 '
                  +'  and  ACT_CODE = :P2;',
                   [StoreCode, UserCode, vFormName, StoI(vInput)],true);
    end;

    ReadFavoriteList(false);
  end;
end;

//------------------------------------------------------------------------------
// 창 - 모두 닫기 버튼
procedure TExtremeMainForm.RibbonWindowPageManagerCloseAllButtonClick(Sender: TObject);
var
  vIndex: Integer;
begin
  for vIndex := MDIChildCount-1 downto 0 do
    MDIChildren[vIndex].Close;
end;
//------------------------------------------------------------------------------
// 창 - 계단식 버튼
procedure TExtremeMainForm.RibbonWindowPageManagerCascadeButtonClick(Sender: TObject);
begin
  Cascade;
end;
//------------------------------------------------------------------------------
// 창 - 배열식 버튼
procedure TExtremeMainForm.RibbonWindowPageManagerHorizontallyButtonClick(Sender: TObject);
begin
  TileMode := tbVertical;
  Tile;
end;
//------------------------------------------------------------------------------
// 창 - 닫기 팝업메뉴
procedure TExtremeMainForm.RibbonWindowPageWindowToolBarPopupMenuCloseClick(Sender: TObject);
var
  vIndex: Integer;
begin
  if RibbonWindowPageWindowToolBarPopupMenu.PopupComponent is TAdvToolBarButton then
    // MDI 폼 중에 버튼과 연결된 폼을 죽인다
    for vIndex := 0 to MDIChildCount-1 do
      if MDIChildren[vIndex].Name = TAdvToolBarButton(RibbonWindowPageWindowToolBarPopupMenu.PopupComponent).Hint+'Form' then
      begin
        MDIChildren[vIndex].Close;
        Break;
      end;
end;

//==============================================================================
// 메뉴 모음
//------------------------------------------------------------------------------
// 메뉴 모음 크기를 변경할 때
procedure TExtremeMainForm.ToolMenuPanelResize(Sender: TObject);
begin
  // 메뉴 모음 크기 최소값을 지정한다
  if ToolMenuPanel.Width < 150 then
    ToolMenuPanel.Width := 150;
end;
//------------------------------------------------------------------------------
// 메뉴 모음 리스트 뷰의 아이템을 클릭할 때
procedure TExtremeMainForm.ToolMenuListViewClick(Sender: TObject);
begin
  // 연결 프로그램을 실행한다
  if TListView(Sender).SelCount > 0 then
    RunProgram(TListView(Sender).Selected.SubItems[0]);
end;

procedure TExtremeMainForm.MainMenuClick(Sender: TObject);
begin
  RunProgram(TMenuItem(Sender).Hint);
end;


//==============================================================================
// 프로그램 목록 탭
//------------------------------------------------------------------------------
// 프로그램 목록 탭이 바뀔 때
procedure TExtremeMainForm.MDITabChange(Sender: TObject);
begin
  if MDITab.AdvOfficeTabCount > 0 then
    Ribbon.Caption.Caption := StoreName +' - ['+ MDITab.AdvOfficeTabs[MDITab.ActiveTabIndex].Caption + ']'
  else
    Ribbon.Caption.Caption := '익스트림포스';
end;

procedure TExtremeMainForm.MenuTreeViewDblClick(Sender: TObject);
var  vTreeNode : TTreeNode;
     vMenuData: PStrPointer;
begin
  // 선택된 노드가 있고 자식이 없는 노드라면
  vTreeNode := (Sender as TcxTreeView).Selected;
  if (vTreeNode <> nil) then
  begin
    if not vTreeNode.HasChildren then
    begin
      vMenuData := vTreeNode.Data;
      RunProgram(vMenuData^.Data)
    end;
  end;
end;

//==============================================================================
// 타이머
//------------------------------------------------------------------------------
// 타이머가 작동할 때
procedure TExtremeMainForm.TimerTimer(Sender: TObject);
begin
  // 일정 시간 지난 후 상태표시줄 메시지 지우기
  if Timer.Tag > 0 then
    Timer.Tag := Timer.Tag-1
  else
  begin
//  Timer.Enabled := false;
    ShowMsg;
  end;

  // 일정 시간 지난 후 알림 패널 지우기
  if NoticePanel.Tag > 0 then
    NoticePanel.Tag := NoticePanel.Tag-1
  else
    NoticePanel.Visible := false;
end;

//==============================================================================
// 이벤트
//------------------------------------------------------------------------------
// MDI 종료 이벤트
procedure TExtremeMainForm.WMMDIClose(var msg: TMessage);
var
  vIndex: Integer;
begin
  // 창 버튼을 삭제한다
  for vIndex := 0 to RibbonWindowPageWindowToolBar.ControlCount-1 do
  begin
    if RibbonWindowPageWindowToolBar.Controls[vIndex].Hint+'Form' = PChar(msg.LParam) then
    begin
      RibbonWindowPageWindowToolBar.Controls[vIndex].Free;
      break;
    end;
  end;

  // 모든 자식창이 닫혔다면 메인 폼 제목을 기본으로 바꾼다
  if MDIChildCount = 1 then
    Ribbon.Caption.Caption := StoreName;
end;

//------------------------------------------------------------------------------
// 로그인
function TExtremeMainForm.CheckFormShow(aFormName: String): Boolean;
var vFormName :String;
    vIndex :Integer;
begin
  Result := false;
  vFormName := 'T'+aFormName+'Form';
  // 기존에 실행 중인 프로그램이면 해당 프로그램을 활성화 한다
  for vIndex := 0 to MDIChildCount-1 do
    if MDIChildren[vIndex].ClassName = vFormName then
    begin
      Result := true;
      Break;
    end;
end;

function TExtremeMainForm.CheckUser(aStoreCode:String): Boolean;
begin
  Result := false;

  // 외부에서 로그인 정보를 가져왔을 때는 로그인을 하지 않고 넘어간다
  if (ParamCount > 1) and (ParamStr(1) <> 'Updater') and (ParamStr(1) <> 'execute') then
    Result := true
  // Login을 한다
  else
    with TLoginForm.Create(Self) do
      try
        ChangeStoreCode := aStoreCode;
        if ShowModal = mrOK then
          Result := true;
        Application.ProcessMessages;
      finally
        Free;
      end;
end;


//------------------------------------------------------------------------------
// 프로그램 기본값 세팅
procedure TExtremeMainForm.ReadDefault;
var vTemp :String;
begin
  Folder := ExtractFilePath(Application.ExeName);
  if Folder[Length(Folder)] <> '\' then
    Folder := Folder+'\';

  // POS 등 외부 프로그램에서 파라미터를 받아 왔을 때는 로그인 없이 해당 값을 읽어온다
  if ParamCount > 6 then
  begin
    HeadStoreCode := ParamStr(2);
    StoreCode     := ParamStr(3);
    UserCode      := ParamStr(5);
    UserName      := ParamStr(6);
    UserGrade     := ParamStr(8);
  end
  else
  // 자체 로그인 할 때는 INI 파일에서 기본값을 불러온다
    UserCode  := GetRegistry(HKEY_CURRENT_USER, 'ExtremePOS\CloudOrange\', 'UserID', '');

  // 메뉴 툴바를 보여줄지 불러온다
  if GetIniFile(iniMain, 'SideMenu', '0') = '1' then
  begin
    ToolMenuPanel.Locked  := true;
    ToolMenuPanel.Visible := true;
    ToolMenuPanel.Width := StoI(GetIniFile(iniMain, 'SideMenuWidth', '230'));
    if ToolMenuPanel.Width < 50 then
      ToolMenuPanel.Width := 230;
  end;

  vTemp := GetIniFile(iniMain, 'ToolBar', '-1');
  if vTemp = '-1' then
  begin
    if Screen.Width = 1024 then
      Ribbon.Height := 54
    else
      Ribbon.Height := 110;
  end
  else if vTemp = '1' then
    Ribbon.Height := 110
  else
    Ribbon.Height := 54;
  RibbonFavoritePage.TabVisible := Ribbon.Height = 110;
  RibbonWindowPage.TabVisible   := RibbonFavoritePage.TabVisible;
  RibbonOftenRunPage.TabVisible := RibbonFavoritePage.TabVisible;

end;
//------------------------------------------------------------------------------
// 사용자 권한에 맞는 프로그램 목록 불러오기
procedure TExtremeMainForm.ReadProgramList;
  procedure GetUserMenu(aMenuList, aAuthList: TStringList);
  begin
    try
      aMenuList.Clear;
      aAuthList.Clear;

      DM.OpenQuery('select ACT_CODE, DS_AUTHORITY '
                  +'  from MS_PRG_MENU '
                  +' where CD_HEAD  = :P0 '
                  +'   and CD_STORE = :P1 '
                  +'   and CD_CODE  = :P2',
                  [HeadStoreCode,
                   StoreCode,
                   UserGrade]);
      while not DM.Query.Eof do
      begin
        aMenuList.Add(DM.Query.Fields[0].AsString);
        aAuthList.Add(DM.Query.Fields[1].AsString);
        DM.Query.Next;
      end;
    finally
      DM.Query.Close;
    end;
  end;
  function GetSubItemCount(aIndex:Integer):Integer;
  var vIndex : Integer;
  begin
    Result := 0;
    for vIndex := RibbonPreviewMenu.MenuItems[aIndex].SubItems.Count-1 downto 0 do
      if RibbonPreviewMenu.MenuItems[aIndex].SubItems.Items[vIndex].Visible then
        Result := Result + 1;
  end;
var
  vIndex, vIndex2, vProgramIndex: Integer;
  vProgramList, vAuthList, vParnetProgram: TStringList;
  vTreeNode,
  vSubTreeNode :TTreeNode;
  vCode: PStrPointer;
  vTemp: String;
begin
  // 리본 메뉴에 사용자 권한에 맞는 메뉴만 보여준다
  vProgramList := TStringList.Create;
  vAuthList    := TStringList.Create;
  vParnetProgram := TStringList.Create;

  try
    if (UserLevel = 'E') or (UserLevel = 'P') then
    begin
      vParnetProgram.Add('StoreStore');
      vParnetProgram.Add('StoreHead');
      vParnetProgram.Add('StoreUser');
      vParnetProgram.Add('StoreCommonCode');
//      vParnetProgram.Add('StoreSaleShow');
      vParnetProgram.Add('StoreSubPartner');
      vParnetProgram.Add('StoreSubPartnerStoreShow');
      vParnetProgram.Add('StoreNotice');
      vParnetProgram.Add('StorePartnerNotice');
      vParnetProgram.Add('LetsOrderSaleshow');
      vParnetProgram.Add('StoreUserAuth');
      vParnetProgram.Add('StoreMartStore');
      vParnetProgram.Add('StoreCustomerListShow');
      vParnetProgram.Add('StorePosChangeShow');
//      vParnetProgram.Add('StoreSaleDataDelete');
      vParnetProgram.Add('CodeList');
      vParnetProgram.Add('StoreList');
//      vParnetProgram.Add('SmsList');
      vParnetProgram.Add('NoticeList');


      for vIndex := 0 to StorePreviewmenu.MenuItems.Count-1 do
        for vIndex2 := StorePreviewmenu.MenuItems[vIndex].SubItems.Count-1 downto 0 do
        begin
          StorePreviewmenu.MenuItems[vIndex].Visible := false;
          StorePreviewmenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := false;
        end;

      for vIndex := 0 to StorePreviewmenu.MenuItems.Count-1 do
        for vIndex2 := StorePreviewmenu.MenuItems[vIndex].SubItems.Count-1 downto 0 do
        begin
          if UserCode = 'letsorder' then
          begin
            if StorePreviewmenu.MenuItems[vIndex].ShortCutHint = 'LetsOrderSaleshow' then
              StorePreviewmenu.MenuItems[vIndex].Visible := true;
          end
          else
          begin
            if (UserLevel = 'E') then
            begin
              StorePreviewmenu.MenuItems[vIndex].Visible := true;
              StorePreviewmenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := true;
            end
            else if UserLevel = 'P' then
            begin
              if vParnetProgram.IndexOf(StorePreviewmenu.MenuItems[vIndex].ShortCutHint) >= 0 then
                StorePreviewmenu.MenuItems[vIndex].Visible := true;
              if vParnetProgram.IndexOf(StorePreviewmenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint) >=0 then
                StorePreviewmenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := true;
            end;
          end;
        end;


//      for vIndex := 0 to StorePreviewmenu.MenuItems.Count-1 do
//      begin
//        if UserCode = 'letsorder' then
//        begin
//          if StorePreviewmenu.MenuItems[vIndex].ShortCutHint = 'LetsOrderSaleshow' then
//             StorePreviewmenu.MenuItems[vIndex].Visible := true
//          else
//             StorePreviewmenu.MenuItems[vIndex].Visible := false;
//        end
//        else
//        begin
//          if (UserLevel = 'E') then
//            StorePreviewmenu.MenuItems[vIndex].Visible := true
//          else if (UserLevel = 'P') and  ((StorePreviewmenu.MenuItems[vIndex].ShortCutHint = 'StoreStore')
//                                       or (StorePreviewmenu.MenuItems[vIndex].ShortCutHint = 'StoreHead')
//                                       or (StorePreviewmenu.MenuItems[vIndex].ShortCutHint = 'StoreUser')
//                                       or (StorePreviewmenu.MenuItems[vIndex].ShortCutHint = 'StoreCommonCode')
//                                       or (StorePreviewmenu.MenuItems[vIndex].ShortCutHint = 'StoreSaleShow')
//                                       or (StorePreviewmenu.MenuItems[vIndex].ShortCutHint = 'StoreSubPartner')
//                                       or (StorePreviewmenu.MenuItems[vIndex].ShortCutHint = 'StoreSubPartnerStoreShow')
//                                       or (StorePreviewmenu.MenuItems[vIndex].ShortCutHint = 'StoreNotice')
//                                       or (StorePreviewmenu.MenuItems[vIndex].ShortCutHint = 'StorePartnerNotice')
//                                       or (StorePreviewmenu.MenuItems[vIndex].ShortCutHint = 'LetsOrderSaleshow')
//                                       or (StorePreviewmenu.MenuItems[vIndex].ShortCutHint = 'StoreUserAuth')
//                                       or (StorePreviewmenu.MenuItems[vIndex].ShortCutHint = 'StoreMartStore') // and ((PartnerCode = '0001') or (PartnerCode = '0015')))
//                                       or (StorePreviewmenu.MenuItems[vIndex].ShortCutHint = 'StoreCustomerListShow')
//                                       or (StorePreviewmenu.MenuItems[vIndex].ShortCutHint = 'StorePosChangeShow')
//                                       or (StorePreviewmenu.MenuItems[vIndex].ShortCutHint = 'StoreSaleDataDelete')) then
//            StorePreviewmenu.MenuItems[vIndex].Visible := true
//          else if (UserLevel = 'P') then
//            StorePreviewmenu.MenuItems[vIndex].Visible := false;
//        end;
//      end;
    end
    else
    begin
      GetUserMenu(vProgramList, vAuthList);
      for vIndex := 0 to RibbonPreviewMenu.MenuItems.Count-1 do
        for vIndex2 := RibbonPreviewMenu.MenuItems[vIndex].SubItems.Count-1 downto 0 do
        begin
          if (GetStoreOption(5)='0') and (LeftStr(RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint,10) = 'HeadMember') then
            RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := false
          else if (GetStoreOption(4)='0') and (LeftStr(RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint,9) = 'HeadKiosk') then
            RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := false
          else if (UserClass = 'C') and (StoreCode = StandardStore) then
          begin
            if (LeftStr(RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint,4) = 'Head') then
              RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := true
            else
              RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := false;

            //수발주 사용안할때
//            if GetStoreOption(8) = '0' then
//            begin
//              if RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].OfficeHint.ShowHelp then
//                RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := false;
//            end;
          end
          else if (vProgramList.IndexOf(RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint) < 0) then
          begin
            RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := False;
            Continue;
          end
          else
          begin
            RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := true;
            vProgramIndex := vProgramList.IndexOf(RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint);
            RibbonPreviewMenu.MenuItems.Items[vIndex].SubItems.Items[vIndex2].Tag := StrToIntDef(vAuthList[vProgramIndex],0);

            //본사권한이 없을때 표준관리는 안보이게 한다
            if (UserClass = 'S') and (LeftStr(RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint,4) = 'Head') then
              RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := False;

            //통합회원사용시
            if (GetStoreOption(5)='1') and (RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint = 'MemberRank') then
              RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := False;

            //모바일주문
            if (GetStoreOption(9)='0') and (RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint = 'CodeMobileCategory') then
              RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := False;
            if (GetStoreOption(9)='0') and (RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint = 'HeadMobileCategory') then
              RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := False;

            if (GetOption(194) = '1') and (RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint = 'CodeEvent') then
              RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := False;



              //재고기능 사용하지 않을때
            if not CheckOption(19) and (LeftStr(RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint,5) = 'Stock') then
              RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := False;
            if not CheckOption(19) and (LeftStr(RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint,3) = 'Buy') then
              RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := False;
            if not CheckOption(19) and (RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint = 'SaleCompanySaleShow') then
              RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := False;
            if not CheckOption(19) and (RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint = 'CodePriceTag') then
              RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := False;
            if not CheckOption(19) and (RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint = 'CodeGoodsMaster') then
              RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := False;

            //푸드코트기능 사용하지 않을때
            if not CheckOption(231) and (LeftStr(RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint,6) = 'Corner') then
              RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := False;

            //키오스크
            if not CheckOption(403) and (LeftStr(RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint,5) = 'Kiosk') then
              RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := False;

            //다중밴 사용하지 않을때
            if not CheckOption(60) and (RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint = 'SaleVanSaleShow') then
              RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := False;
            if not CheckOption(60) and (RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint = 'CodeVanCompany') then
              RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := False;

            //배달기능 사용하지 않을때
            if not CheckOption(185) and
               ( (RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint = 'CodeDeliveryAddress') or (RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint = 'SaleDeliverySaleShow') ) then
              RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := False;

            //렛츠오더 사용하지 않을때
            if GetStoreOption(9) = '0' then
            begin
              if ( (RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint = 'CodeLetsOrderMenu') or (RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint = 'CodeLetsOrderQR')) then
                RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := False;
            end;

            //수발주 사용하지 않을때
            if GetChainHeadOption(8) = '0' then //GetStoreOption(8) = '0' then
            begin
              if (LeftStr(RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint,5) = 'Order')  then
                RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible := False;
            end;

          end;
        end;
    end;
  finally
    vProgramList.Free;
    vAuthList.Free;
  end;

  if (UserLevel = 'E') or (UserLevel = 'P') then
    ToolTab.Visible := false
  else
  begin
    //트리메인메뉴 설정
    MenuTreeView.Items.Clear;
    // 리본 메뉴에 있는 내용을 근거로 메뉴 모음을 만든다
    for vIndex := 0 to RibbonPreviewMenu.MenuItems.Count-1 do
    begin
      RibbonPreviewMenu.MenuItems[vIndex].Visible := GetSubItemCount(vIndex) > 0;

      // 메뉴 모음에 패널을 추가한다
      if (RibbonPreviewMenu.MenuItems[vIndex].Visible) and
         (RibbonPreviewMenu.MenuItems[vIndex].Caption <> '') then
      begin
        New(vCode);
        vCode^.Data := '';
        vTreeNode := MenuTreeView.Items.AddChildObject(nil, Replace(RibbonPreviewMenu.MenuItems[vIndex].Caption,'&&','&'), vCode);
        vTreeNode.ImageIndex    := RibbonPreviewMenu.MenuItems[vIndex].ImageIndex;
        vTreeNode.SelectedIndex := RibbonPreviewMenu.MenuItems[vIndex].ImageIndex;
        vTreeNode.HasChildren   := true;
        //서브메뉴 설정
        for vIndex2 := 0 to RibbonPreviewMenu.MenuItems[vIndex].SubItems.Count-1 do
        begin
          if RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Visible then
          begin
            New(vCode);
            vCode^.Data  := RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ShortCutHint;
            vSubTreeNode := MenuTreeView.Items.AddChildObject(vTreeNode, Trim(RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].Title), vCode);
            if RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ImageIndex > 0 then
            begin
              vSubTreeNode.ImageIndex    := RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ImageIndex;
              vSubTreeNode.SelectedIndex := RibbonPreviewMenu.MenuItems[vIndex].SubItems.Items[vIndex2].ImageIndex;
            end
            else
            begin
              vSubTreeNode.ImageIndex    := 19;
              vSubTreeNode.SelectedIndex := 20;
            end;
            vSubTreeNode.HasChildren   := false;
          end;
        end;
        if vTreeNode.Count = 0 then
          MenuTreeView.Items.Delete(vTreeNode);
      end;
    end;

    vTemp := GetIniFile(iniMain, 'ExpandedMenu', '');
    for vIndex := 0 to MenuTreeView.Items.Count-1 do
    begin
      if Pos(MenuTreeView.Items[vIndex].Text, vTemp) > 0 then
        MenuTreeView.Items[vIndex].Expand(true);
    end;
  end;
end;

//------------------------------------------------------------------------------
// 즐겨찾기 툴바 불러오기
procedure TExtremeMainForm.ReadFavoriteList(aSubMenuAdd:Boolean);
var
  vIndex, vIndex2 : Integer;
  vFavList :TStringList;
begin
  // 기존 즐겨찾기를 모두 지운다
  for vIndex := RibbonFavoritePageFavoriteToolBar.ControlCount-1 downto 0 do
    RibbonFavoritePageFavoriteToolBar.Controls[vIndex].Free;
  // 사용자 권한에 맞는 즐겨찾기 메뉴만 보여준다
  vFavList := TStringList.Create;
  vFavList.Clear;
  try
    if (UserLevel = 'E') or  (UserLevel = 'P') then
      DM.OpenQuery('select ACT_CODE, '
                  +'       CAPTION '
                  +'  from USER_FAVORITE '
                  +' where ID_USER  = :P0 '
                  +' order by SEQ ',
                   [UserCode],false,RestBaseURL)
    else
      DM.OpenQuery('select ACT_CODE, '
                  +'       CAPTION '
                  +'  from MS_SAWON_FAV '
                  +' where CD_HEAD  = :P0 '
                  +'   and CD_STORE = :P1 '
                  +'   and CD_SAWON = :P2 '
                  +' order by SEQ ',
                   [HeadStoreCode,
                    StoreCode,
                    UserCode]);
    while not DM.Query.Eof do
    begin
      vFavList.Add(DM.Query.Fields[1].AsString +splitColumn+DM.Query.Fields[0].AsString);
      DM.Query.Next;
    end;
  finally
    DM.Query.Close;
  end;

//  vIndex2 := 1;
  for vIndex := 0 to vFavList.Count-1 do
  begin
    AddToolBarButton(RibbonFavoritePageFavoriteToolBar, CopyPos(vFavList.Strings[vIndex],splitColumn, 0), CopyPos(vFavList.Strings[vIndex],splitColumn, 1));
    TAdvToolBarButton(RibbonFavoritePageFavoriteToolBar.Controls[RibbonFavoritePageFavoriteToolBar.ControlCount-1]).PopupMenu := RibbonFavoritePageFavoriteToolBarPopupMenu;
//   2024.3.26 느려서 주석처리
//    if aSubMenuAdd then
//      AddRibbonSubMenu(CopyPos(vFavList.Strings[vIndex],splitColumn, 0), CopyPos(vFavList.Strings[vIndex],splitColumn, 1), vIndex2);
//    Inc(vIndex2);
  end;

end;

//------------------------------------------------------------------------------
// 프로그램 실행하기
function TExtremeMainForm.RunProgram(aFormName: string): Boolean;
  // 현재사용자가 쓸 수 있는 프로그램인지 확인 ---------------------------------
  function GetUserMenu(aMenu: string): Boolean;
  var
    vIndex, vSubIndex: Integer;
  begin
    Result := false;
    for vIndex := 0 to RibbonPreviewMenu.MenuItems.Count-1 do
      for vSubIndex := 0 to RibbonPreviewMenu.MenuItems.Items[vIndex].SubItems.Count-1 do
        if LowerCase(RibbonPreviewMenu.MenuItems.Items[vIndex].SubItems.Items[vSubIndex].ShortCutHint) = LowerCase(aFormName) then
        begin
          Result := RibbonPreviewMenu.MenuItems.Items[vIndex].SubItems.Items[vSubIndex].Visible;
          if Result then
          //본사메뉴는 권한을 사용여부만 체크한다
            MenuAuth := Ifthen(LeftStr(aMenu,4) = 'Head', 15, RibbonPreviewMenu.MenuItems.Items[vIndex].SubItems.Items[vSubIndex].Tag)
          else
            MenuAuth := -1;
          break;
        end;
  end;
var
  vForm    : TForm;
  vDate    : string;
  vFormName: string;
  vIndex   : Integer;
  vClass   : TClassFinder;
  vURL     : String;
begin
  Result := false;

  if NoticesPanel.Visible then
    NoticesPanel.Visible := false;


  // 가맹점관리 일때
  if (UserLevel = 'E') or (UserLevel = 'P') then
  begin
    vFormName := 'T'+aFormName+'Form';
    // 기존에 실행 중인 프로그램이면 해당 프로그램을 활성화 한다
    for vIndex := 0 to MDIChildCount-1 do
      if MDIChildren[vIndex].ClassName = vFormName then
      begin
        MDIChildren[vIndex].Show;
        Exit;
      end;

    if TFormClass(GetClass(vFormName)) <> nil then
    begin
      vClass := TClassFinder.Create();
      vForm  := TFormClass(vClass.GetClass(vFormName)).Create(self);
      vForm.HelpKeyword := '1111';
      Ribbon.Caption.Caption := StoreName +' - ['+ vForm.Caption + ']';
      MDITab.AddTab(vForm);
    end;
    Exit;
  end;


  LockWindowUpdate(Handle);
  try
    vDate := FormatDateTime(fmtDateShort, Now);
    if Trim(aFormName) = EmptyStr then
      Exit
    else if not IsDebugMode and (StoreCode = EmptyStr) then
      ErrBox('인증받지 않은 프로그램입니다.')
    else if (aFormName <> 'SystemNotice') and not GetUserMenu(aFormName) then   // 실행 속도를 조금이라도 빠르게 하려고 제외
      ErrBox(Format('%s님은 사용할 수 없는 프로그램입니다.', [UserName]))
    else
    begin
      vFormName := 'T'+aFormName+'Form';
      // 기존에 실행 중인 프로그램이면 해당 프로그램을 활성화 한다
      for vIndex := 0 to MDIChildCount-1 do
        if MDIChildren[vIndex].ClassName = vFormName then
        begin
          MDIChildren[vIndex].Show;
          Exit;
        end;

      if (aFormName = 'MemberSMS') or (aFormName = 'HeadMemberSMS') then
      begin
        try
          DM.OpenQuery('select APP_ID, '
                      +'       Cast(AES_Decrypt(APP_PWD, 71483) as Char) as APP_PWD '
                      +'  from MS_APP_USER '
                      +' where CD_CUSTOMER = :P0 ',
                      [Ifthen(aFormName = 'MemberSMS', StoreCode, HeadStoreCode)],false,jsonSMSDBURL);

          if DM.Query.Eof then
          begin
            if AddSmsUser(Ifthen(aFormName = 'MemberSMS', StoreCode, HeadStoreCode)) then
              MsgBox(Format(' 아이디 - %s , 패스워드 - %s 로 사용자가 등록되었습니다'#13#13'패스워드는 [환경설정-매장정보]에서 변경 가능합니다',
                           [StoreCode, GetOnlyNumber(BusinessNumber)]))
            else
            begin
              MsgBox('문자발송을 하시려면 [환경설정-매장정보]에서'#13'문자발송 아이디를 먼저 생성해야합니다');
              Exit;
            end;
          end;

        finally
          DM.FinishQuery;
        end;                                                    //msedge.exe

        vURL := 'https://sms.expos.co.kr:8455/sms/com/exposLoginUsr.expos';
        if ShellExecute(self.WindowHandle,'open','chrome.exe', PWideChar(vURL), nil, SW_SHOW) < 0 then
          ShellExecute(self.WindowHandle,'open','msedge.exe', PWideChar(vURL), nil, SW_SHOW);
        Exit;
      end;


      // 처음 실행하는 프로그램이면 폼을 띄운다
      try
        if TFormClass(GetClass(vFormName)) <> nil then
        begin
          vClass := TClassFinder.Create();
          vForm  := TFormClass(vClass.GetClass(vFormName)).Create(self);
          if not vForm.Active then
            vForm.Show;
          vForm.HelpKeyword := SetProgramAuth(MenuAuth);
//          vForm.Show;
          Ribbon.Caption.Caption := StoreName +' - ['+ vForm.Caption + ']';

          // 자주 쓰는 프로그램 목록에 추가
//        AddRibbonSubMenu(vForm.Caption, aFormName);
          // MDI탭에 추가
          MDITab.AddTab(vForm);
          // 창 도구상자에 추가
          AddToolBarButton(RibbonWindowPageWindowToolBar, vForm.Caption, aFormName);
          TAdvToolBarButton(RibbonWindowPageWindowToolBar.Controls[RibbonWindowPageWindowToolBar.ControlCount-1]).PopupMenu := RibbonWindowPageWindowToolBarPopupMenu;

          ProgramUseLogSave(aFormName, vForm.Caption);
          Result := true;
          ShowMsg('', true);
        end
        else
          ShowMsg('연결된 프로그램이 없습니다.', true);
      except
      end;
    end;
  finally
    LockWindowUpdate(0);
  end;
end;
//------------------------------------------------------------------------------
// 도구상자에 버튼 추가
function TExtremeMainForm.AddSmsUser(aCustomerNo:String): Boolean;
begin
  Result := false;
  if isDemo then Exit;
  //고객번호로 아이디가 사용가능한지 체크한다
  try
    DM.OpenQuery('select APP_ID '
                 +'  from MS_APP_USER '
                 +' where APP_ID   = :P0 ',
                 [aCustomerNo],false,jsonSMSDBURL);
    if not DM.Query.Eof then
      Exit;

    Result := DM.ExecQuery('insert into MS_APP_USER(APP_ID, '
                          +'                        APP_PWD, '
                          +'                        NM_USER, '
                          +'                        CD_CUSTOMER, '
                          +'                        BIZ_NO, '
                          +'                        CD_SAWON_CHG, '
                          +'                        DT_INSERT, '
                          +'                        DT_CHANGE) '
                          +'                Values(:P0, '
                          +'                        AES_Encrypt(:P1,71483), '
                          +'                       :P2, '
                          +'                       :P3, '
                          +'                       :P4, '
                          +'                       :P5, '
                          +'                       NOW(), '
                          +'                       NOW()) ',
                          [aCustomerNo,
                           GetOnlyNumber(BusinessNumber),
                           StoreName,
                           StoreCode,
                           UserCode,
                           UserCode],
                           true,jsonSMSDBURL);
  finally
    DM.Query.Close;
  end;
end;

procedure TExtremeMainForm.AddToolBarButton(aToolBar: TAdvToolBar; aFormCaption, aFormName: string);
var
  vFound : Boolean;
  vIndex : Integer;
  vButton: TAdvToolBarButton;
  vPNG   : TdxPNGImage;
  vStream: TStream;
begin
  // 기존 창 도구상자에 있는 버튼인지 확인한다
  vFound := false;
  for vIndex := 0 to aToolBar.ControlCount-1 do
    if TControl(aToolBar.Controls[vIndex]).Hint = aFormName then
    begin
      vFound := true;
      Break;
    end;
  // 기존 창 도구상자에 없으면 추가한다
  if not vFound then
  begin
    vButton               := TAdvToolBarButton.Create(aToolBar);
    vButton.Caption       := aFormCaption;
    vButton.GlyphPosition := gpTop;
    vButton.ShowCaption   := true;
    vButton.Hint          := aFormName;
    vButton.ShowHint      := false;
    vButton.Height        := 47;
    vButton.Position      := daTop;
    vButton.OnClick       := RibbonProgramRunButtonClick;
    aToolBar.AddToolBarControl(vButton);

    try
      if (UserLevel = 'E') or  (UserLevel = 'P') then
        DM.OpenQuery('select ACT_CODE, '
                    +'       CAPTION, '
                    +'       ICON '
                    +'  from USER_FAVORITE '
                    +' where ID_USER  = :P0 '
                    +'   and ACT_CODE = :P1 ',
                     [UserCode,
                      aFormName],false, RestBaseURL)
      else
        DM.OpenQuery('select ACT_CODE, '
                    +'       CAPTION, '
                    +'       ICON '
                    +'  from MS_SAWON_FAV '
                    +' where CD_HEAD  = :P0 '
                    +'   and CD_STORE = :P1 '
                    +'   and CD_SAWON = :P2 '
                    +'   and ACT_CODE = :P3 ',
                     [HeadStoreCode,
                      StoreCode,
                      UserCode,
                      aFormName]);
      if not DM.Query.Eof then
      begin
        try
          vStream := DM.Query.CreateBLOBStream(DM.Query.FieldByName('ICON'), bmRead);
          vPNG    := TdxPNGImage.Create;
          vPNG.LoadFromStream(vStream);
          vButton.Picture.Assign(vPNG);
        finally
          if Assigned(vStream) then
            vStream.Free;
          if Assigned(vPNG) then
            vPNG.Free;
        end;
      end;
    finally
      DM.FinishQuery;
    end;
  end;
end;


//------------------------------------------------------------------------------
// 자주 쓰는 프로그램 버튼 추가
procedure TExtremeMainForm.AddRibbonSubMenu(aFormCaption, aFormName: string; aRunCount: Integer);
var
  vFound: Boolean;
  vIndex, vIndex2: Integer;
  vFormCaption, vFormName: string;
  vRunCount: Integer;
begin
  // 기존 자주 쓰는 프로그램 목록에 있는 프로그램이면 프로그램 실행 카운트만 하나 증가 시킨다
  vFound := false;
  if aRunCount = 0 then
    for vIndex := 0 to RibbonPreviewMenu.SubMenuItems.Count-1 do
      if TAdvPreviewSubMenuItem(RibbonPreviewMenu.SubMenuItems[vIndex]).ShortCutHint = aFormName then
      begin
        vFound := true;
        TAdvPreviewSubMenuItem(RibbonPreviewMenu.SubMenuItems[vIndex]).Tag := TAdvPreviewSubMenuItem(RibbonPreviewMenu.SubMenuItems[vIndex]).Tag+1;
        Break;
      end;
  // 기존 자주 쓰는 프로그램 목록에 없으면 추가한다
  if not vFound then
  begin
    RibbonPreviewMenu.SubMenuItems.Add;
    TAdvPreviewSubMenuItem(RibbonPreviewMenu.SubMenuItems[RibbonPreviewMenu.SubMenuItems.Count-1]).Title        := aFormCaption;
    TAdvPreviewSubMenuItem(RibbonPreviewMenu.SubMenuItems[RibbonPreviewMenu.SubMenuItems.Count-1]).ShortCutHint := aFormName;
    TAdvPreviewSubMenuItem(RibbonPreviewMenu.SubMenuItems[RibbonPreviewMenu.SubMenuItems.Count-1]).Tag          := aRunCount;
    TAdvPreviewSubMenuItem(RibbonPreviewMenu.SubMenuItems[RibbonPreviewMenu.SubMenuItems.Count-1]).Picture.Assign(ImageCollection.Items[0].Picture.Graphic);
  end;

  if aRunCount = 0 then
    // 자주 쓰는 프로그램 목록을 실행 많이 한 순서대로 소트한다
    for vIndex := 0 to RibbonPreviewMenu.SubMenuItems.Count-1 do
      for vIndex2 := RibbonPreviewMenu.SubMenuItems.Count-1 downto vIndex+1 do
        if RibbonPreviewMenu.SubMenuItems[vIndex2].Tag > RibbonPreviewMenu.SubMenuItems[vIndex2-1].Tag then
        begin
          vFormCaption                                                                   := TAdvPreviewSubMenuItem(RibbonPreviewMenu.SubMenuItems[vIndex2-1]).Title;
          vFormName                                                                      := TAdvPreviewSubMenuItem(RibbonPreviewMenu.SubMenuItems[vIndex2-1]).ShortCutHint;
          vRunCount                                                                      := TAdvPreviewSubMenuItem(RibbonPreviewMenu.SubMenuItems[vIndex2-1]).Tag;
          TAdvPreviewSubMenuItem(RibbonPreviewMenu.SubMenuItems[vIndex2-1]).Title        := TAdvPreviewSubMenuItem(RibbonPreviewMenu.SubMenuItems[vIndex2]).Title;
          TAdvPreviewSubMenuItem(RibbonPreviewMenu.SubMenuItems[vIndex2-1]).ShortCutHint := TAdvPreviewSubMenuItem(RibbonPreviewMenu.SubMenuItems[vIndex2]).ShortCutHint;
          TAdvPreviewSubMenuItem(RibbonPreviewMenu.SubMenuItems[vIndex2-1]).Tag          := TAdvPreviewSubMenuItem(RibbonPreviewMenu.SubMenuItems[vIndex2]).Tag;
          TAdvPreviewSubMenuItem(RibbonPreviewMenu.SubMenuItems[vIndex2]).Title          := vFormCaption;
          TAdvPreviewSubMenuItem(RibbonPreviewMenu.SubMenuItems[vIndex2]).ShortCutHint   := vFormName;
          TAdvPreviewSubMenuItem(RibbonPreviewMenu.SubMenuItems[vIndex2]).Tag            := vRunCount;
        end;

  // 자주 사용하는 15위까지만 놔두고 나머지는 숨긴다
  for vIndex := 0 to RibbonPreviewMenu.SubMenuItems.Count-1 do
    RibbonPreviewMenu.SubMenuItems[vIndex].Visible := vIndex < 20;

  // 자주 쓰는 프로그램 탭을 새로 만든다
  for vIndex := RibbonOftenRunPageOftenRunToolBar.ControlCount-1 downto 0 do
    TControl(RibbonOftenRunPageOftenRunToolBar.Controls[vIndex]).Free;
  for vIndex := 0 to RibbonPreviewMenu.SubMenuItems.Count-1 do
    if vIndex < 10 then
      AddToolBarButton(RibbonOftenRunPageOftenRunToolBar, RibbonPreviewMenu.SubMenuItems[vIndex].Title, RibbonPreviewMenu.SubMenuItems[vIndex].ShortCutHint);
end;

//------------------------------------------------------------------------------
// 상태 표시줄에 메시지 표시
procedure TExtremeMainForm.ShowMsg(aMessage: string; aError: Boolean; aDisplaySecond: Integer);
begin
  StatusBar.Panels[1].Text := IfThen(aError, '<font color="#FF0000"> ', ' ') + aMessage + IfThen(aError, '</font>', '');
  StatusBar.Refresh;
  if (Trim(aMessage) <> EmptyStr) and (aDisplaySecond > 0) then
  begin
    Timer.Tag     := aDisplaySecond;
//  Timer.Enabled := true;
  end;
end;
//------------------------------------------------------------------------------
// 알림 패널 표시
procedure TExtremeMainForm.ShowNotice(aMessage, aProgram: string; aDisplaySecond: Integer);
begin
  NoticePanel.Left := ClientWidth - NoticePanel.Width - 5;
  NoticePanel.Top  := MDITab.Top - NoticePanel.Height - 4;
  if aMessage <> EmptyStr then
  begin
    NoticeLabel.Caption := aMessage;
    if NoticeLabel.Hint <> aProgram then
      NoticeLabel.Hint  := aProgram;
  end;
  if aDisplaySecond > 0 then
  begin
    NoticePanel.Visible := true;
    NoticePanel.Tag     := aDisplaySecond;
  end;
end;


procedure TExtremeMainForm.StorePreviewMenuMenuItemClick(Sender: TObject;
  ItemIndex: Integer);
begin
  RunProgram(StorePreviewMenu.MenuItems[ItemIndex].ShortCutHint);
end;

procedure TExtremeMainForm.StorePreviewMenuSubMenuItemClick(Sender: TObject;
  ItemIndex, SubMenuItemIndex: Integer);
begin
  RunProgram(StorePreviewMenu.MenuItems.Items[ItemIndex].SubItems.Items[SubMenuItemIndex].ShortCutHint);
end;

initialization
  // 서브 프로그램 목록을 등록한다
  RegisterClasses([THeadMenuMasterForm,
                   THeadStoreMenuForm,
                   THeadPluForm,
                   THeadKioskMenuForm,
                   THeadKioskPLUForm,
                   THeadSetMenuForm,
                   THeadCourseMenuForm,
                   THeadMenuClassForm,
                   THeadCodeForm,
                   THeadCouponForm,
                   THeadMenuLinkForm,
                   THeadKioskDesignForm,
                   THeadPosDesignForm,
                   THeadStoreForm,
                   THeadNoticeForm,
                   THeadExcelForm,
                   THeadSetupForm,
                   THeadSaleStoreSaleShowForm,
                   THeadSalePayShowForm,
                   THeadSaleDaySaleShowForm,
                   THeadSaleCalendarShowForm,
                   THeadSaleQuickShowForm,
                   THeadDaySaleShowForm,
                   THeadMonthSaleShowForm,
                   THeadRealTimeOrderShowForm,
                   THeadAvgSaleShowForm,
                   THeadLocalSaleShowForm,
                   THeadSaleZoneSaleShowForm,
                   THeadTimeSaleShowForm,
                   THeadMenuSaleShowForm,
                   THeadClassSaleShowForm,
                   THeadClassSaleExShowForm,
                   THeadMenuSalePayShowForm,
                   THeadMenuTimeSaleShowForm,
                   THeadGuestAgeSaleShowForm,
                   THeadGuestTypeSaleShowForm,
                   THeadDeliverySaleShowForm,
                   THeadMemberMonthCloseForm,
                   THeadMemberForm,
                   THeadMemberShowForm,
                   THeadMemberPointShowForm,
                   THeadMemberStampShowForm,
                   THeadMemberSaleShowForm,
                   THeadMemberSMSShowForm,
                   THeadMemberSMSSaleShowForm,
                   THeadMemberSMSRejectShowForm,
                   THeadMemberVisitShowForm,
                   THeadMemberRankForm,
                   THeadLetsOrderMenuForm,
                   THeadGoodsForm,
                   THeadLogisticsForm,
                   THeadStoreBySaleShowForm,
                   THeadLogisticsBySaleShowForm,
                   THeadDepositForm,
                   THeadDepositShowForm,
                   THeadStoreSaleBooksShowForm,
                   THeadSaleReadyByLogisticsShowForm,
                   THeadSaleReadyByStoreShowForm,
                   THeadSaleForm,
                   THeadSaleShowForm,
                   THeadSaleReturnForm,
                   THeadSaleReturnModifyForm,
                   THeadBalanceBooksShowForm,
                   THeadLanguageForm,
                   THeadMonthByOrderShowForm,
                   THeadSaleByOrderShowForm,
                   THeadLocalByOrderShowForm,
                   THeadSaleZoneByOrderShowForm,
                   THeadSaleDayStoreSaleShowForm,
                   THeadMenuStoreSaleShowForm,
                   THeadDayPaySaleShowForm,
                   THeadYearSaleShowForm,
                   TOrderOrderForm,
                   THeadOrderForm,
                   TOrderModifyForm,
                   THeadOrderModifyForm,
                   THeadOrderConfirmForm,
                   THeadOrderShowForm,
                   TOrderOrderShowForm,
                   TStoreHeadForm,
                   TStoreStoreForm,
                   TStorePartnerForm,
                   TStoreUserForm,
                   TStoreUserAuthForm,
                   TStoreCustomerListShowForm,
                   TStoreCustomerTreeShowForm,
                   TStoreSaleShowForm,
                   TStoreSMSChargeForm,
                   TStoreSMSChargeShowForm,
                   TStoreCustomerLicenseForm,
                   TStoreCustomerLicenseShowForm,
                   TStoreCommonCodeForm,
                   TStoreScriptForm,
                   TStoreLogShowForm,
                   TStoreMartStoreForm,
                   TStoreQRPrintForm,
                   TStoreSMSCountShowForm,
                   TStoreSubPartnerForm,
                   TStoreSubPartnerStoreShowForm,
                   TStoreSetupStoreShowForm,
                   TStoreNoticeForm,
                   TStoreNoticePopupForm,
                   TStorePartnerNoticeForm,
                   TStoreSaleDataDeleteForm,
                   TStoreCallerRegForm,
                   TStoreHolidayForm,
                   TStorePosChangeShowForm,
                   TLetsOrderSaleShowForm,
                   TCodeMenuMasterForm,
                   TCodeTableForm,
                   TCodePLUForm,
                   TCodeGoodsMasterForm,
                   TCodeClassForm,
                   TCodeEventForm,
                   TCodeSetMenuForm,
                   TCodeCourseMenuForm,
                   TCodePriceTagForm,
                   TCodeDeliveryAddressForm,
                   TCodeMenuListShowForm,
                   TCodeCouponForm,
                   TCodeAutoCouponForm,
                   TCodeBaeminMenuLinkForm,
                   TCodeVanCompanyForm,
                   TCodeLetsOrderMenuForm,
                   TCodeLetsOrderQRForm,
                   TKioskMenuMasterForm,
                   TKioskPLUForm,
                   TKioskTableForm,
                   TKioskDesignForm,
                   TKioskSetupForm,
                   TCornerCompanyForm,
                   TCornerCommissionShowForm,
                   TCornerCompanyCreditForm,
                   TCornerPayShowForm,
                   TCornerPayByShowForm,
                   TCornerSaleShowForm,
                   TCornerCompanyCreditShowForm,
                   TCornerMenuSaleShowForm,
                   TBuyCompanyForm,
                   TBuyCompanyShowForm,
                   TBuyBuyForm,
                   TBuyModifyForm,
                   TBuyCompanyBuyShowForm,
                   TBuyGoodsBuyShowForm,
                   TBuyCompanyGoodsBuyShowForm,
                   TBuyCompanyCreditForm,
                   TBuyCompanyCreditShowForm,
                   TBuyCompanyBookShowForm,
                   TBuyCompanyBaseCreditForm,
                   TStockLowStockShowForm,
                   TStockMonthStockShowForm,
                   TStockSurveyPrintForm,
                   TStockSurveyBatchForm,
                   TStockNotSurveyConfirmForm,
                   TStockStockUpdateForm,
                   TSaleQuickShowForm,
                   TSaleCalendarShowForm,
                   TSaleReceiptShowForm,
                   TSaleSaleShowForm,
                   TSaleGoodsSaleShowForm,
                   TSaleTimeSaleShowForm,
                   TSaleGoodsSaleShowForm,
                   TSaleDeliverySaleShowForm,
                   TSaleTableSaleShowForm,
                   TSalePayShowForm,
                   TSaleCardCheckForm,
                   TSaleDCShowForm,
                   TSalePosAuditShowForm,
                   TSaleVanSaleShowForm,
                   TSaleItemSaleShowForm,
                   TSaleReceiptChangeShowForm,
                   TSaleServiceSaleShowForm,
                   TSaleDamdangSaleShowForm,
                   TSaleCashierSaleShowForm,
                   TSalePosSaleShowForm,
                   TSaleCompanySaleShowForm,
                   TSaleCouponIssueShowForm,
                   TSaleCouponSaleShowForm,
                   TSaleTicketShowForm,
                   TSaleLetsOrderSaleShowForm,
                   TAnalysisClassSaleShowForm,
                   TAnalysisLargeClassSaleShowForm,
                   TAnalysisEventSaleShowForm,
                   TAnalysisGuestTypeSaleShowForm,
                   TAnalysisGuestAgeSaleShowForm,
                   TAnalysisWeekSaleShowForm,
                   TAnalysisSaleProfitShowForm,
                   TAnalysisClassGoodsSaleShowForm,
                   TAnalysisMenuSalePayShowForm,
                   TAnalysisIncomeStatementShowForm,
                   TAnalysisMenuGuestShowForm,
                   TAnalysisTimeMenuSaleShowForm,
                   TAnalysisMenuTimeSaleShowForm,
                   TAnalysisYearSaleShowForm,
                   TStockShowForm,
                   TStockDisuseForm,
                   TStockDisuseShowForm,
                   TStockSurveyForm,
                   TStockSurveyShowForm,
                   TStockSurverSummaryShowForm,
                   TStockBaseStockForm,
                   TCloseCashierCloseShowForm,
                   TClosePosCloseShowForm,
                   TCloseReportShowForm,
                   TCloseMonthCloseForm,
                   TCloseVatReportShowForm,
                   TCloseParkingListShowForm,
                   TCloseSaleUpdateForm,
                   TMemberMemberForm,
                   TMemberShowForm,
                   TMemberSaleShowForm,
                   TMemberCompareSaleShowForm,
                   TMemberPointForm,
                   TMemberStampForm,
                   TMemberPointShowForm,
                   TMemberStampShowForm,
                   TMemberAnniversaryShowForm,
                   TMemberSMSShowForm,
                   TMemberMenuSaleShowForm,
                   TMemberMenuBySaleShowForm,
                   TMemberReceiveForm,
                   TMemberBatchReceiveForm,
                   TMemberReceiveShowForm,
                   TMemberBookShowForm,
                   TMemberSMSSaleShowForm,
                   TMemberPointEraseForm,
                   TMemberPointBatchSaveForm,
                   TMemberSMSRejectShowForm,
                   TMemberSaleBookShowForm,
                   TMemberPaySaleShowForm,
                   TMemberRankForm,
                   TReserveAcctForm,
                   TReserveAcctShowForm,
                   TReserveEmpWorkForm,
                   TReserveEmpWorkShowForm,
                   TReserveEmpWorkPayShowForm,
                   TReserveEmpMonthWorkShowForm,
                   TReserveBookingForm,
                   TReserveShowForm,
                   TSystemCodeForm,
                   TSystemEmpForm,
                   TSystemProgramForm,
                   TSystemSetupForm,
                   TSystemExcelForm,
                   TSystemScheduleForm,
                   TSystemProgramLogForm,
                   TSystemCashBoxShowForm,
                   TSystemCouponDesignForm,
                   TSystemDIDDesignForm,
                   TSystemPosDesignForm,
                   TSystemNoticeForm,
                   TSystemDBMigrationForm,
                   TSystemUpdateNoticeForm,
                   TSystemLanguageForm,
                   TSystemLetsOrderSetupForm]);
end.
