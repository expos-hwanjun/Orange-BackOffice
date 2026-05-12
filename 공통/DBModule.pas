// DB모듈 (F)

unit DBModule;



interface

uses
  SysUtils, Classes, Forms, DB, MemDS,
  Variants, StrUtils, cxGridTableView, dxmdaset, DBAccess,
  ExtCtrls, cxGridLevel, Controls, IPPeerClient, EncdDecd,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, DateUtils,
  DCPcrypt2, DCPblockciphers, DCPrijndael, DCPBase64, DCPsha256, REST.Types;

type
  TDM = class(TDataModule)
    Query: TdxMemData;
    GridData: TdxMemData;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    vLogOutCheck : Boolean;
    StartTime    : TDateTime;
  public
    function  CheckLogOut:Boolean;
    function  ExecQuery(aSQL: string; aParam: array of Variant; aExecute: Boolean = true;aURL:String=''): Boolean;
    function  ExecProcedure(aProcedure: string;aURL:String): Boolean;
    function  OpenQuery(aSQL: string; aParam: array of Variant; aClose:Boolean=false;aURL:String=''): Boolean; overload;
    function  OpenQuery(aQuery:TdxMemData; aSQL: string; aParam: array of Variant; aClose:Boolean=false;aURL:String=''): Boolean; overload;
    function  OpenQuery(aSQL, aDB: string; aParam: array of Variant; aClose:Boolean=false;aURL:String=''): Boolean; overload;
    function  ReadServerICon: Boolean;
    procedure FinishQuery;
    function  ReadQuery(aQuery: TdxMemData; aGridTableView: TcxGridTableView; aMemData: TdxMemData = nil): Boolean;
    procedure GroupGridTable(aGridTableView:TcxGridTableView; aKey, aTextIndex:Integer; aText:String; aCol:array of Integer);
    procedure ReadGridQuery;
    function  ExecSmsProcedure(aProcedure: string;aErrTitle:String=''): Boolean;
    //암호화
    function GetEncrypt(aURL, aData : String) : String;
    procedure SetGridData;
  end;

var
  DM: TDM;

implementation

uses
  Common, StoreSelect;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼을 생성할 때
function TDM.OpenQuery(aSQL: string;
  aParam: array of Variant; aClose:Boolean;aURL:String): Boolean;//aField ex) CD_GOODS,S  (필드명,타입)
var vData,
    vFieldName,
    vFieldType,
    vResult,
    vColData,
    vResponse :String;
    vIndex, vI, vJ :Integer;
    vRow, vCol, vFieldNameList, vFieldTypeList : TStringList;
    vField: TField;
    vURL, vDBName,
    vSQL, vTemp :String;
    vRESTRequest :TRESTRequest;
    vRESTClient  :TRESTClient;
    vRESTResponse :TRESTResponse;
    vItem : TRESTREquestParameter;
begin
  Result := false;
  if not CheckLogOut then Exit;
  if (RestDBURL = '') and (aURL = '') then Exit;


  try
    vSQL := aSQL;
    for vIndex := High(aParam) downto 0 do
    begin
      case VarType(aParam[vIndex]) of
        varInteger,
        varDouble,
        varCurrency : vSQL := Replace(vSQL, Format(':P%d',[vIndex]), FormatFloat('#0',NVL(aParam[vIndex],0.0)));
        varDate     : vSQL := Replace(vSQL, Format(':P%d',[vIndex]), Format('Cast(''%s'' as DateTime)',[FormatDateTime('yyyy-mm-dd hh:nn:ss',aParam[vIndex])]));
        else
        begin
          vSQL  := Replace(vSQL, Format(':P%d',[vIndex]), Format('''%s''',[aParam[vIndex]]));
        end;
      end;
    end;

    vSQL := Replace(vsQL, '\''','\\''');
    vRESTClient   := TRESTClient.Create(nil);
    vURL    := Ifthen(aURL='',CopyPos(RestDBURL,'|',0), CopyPos(aURL,'|',0));
    vDBName := Ifthen(aURL='',CopyPos(RestDBURL,'|',1), CopyPos(aURL,'|',1));
    vRESTClient.BaseURL := vURL+'Action_Select';

    vRESTClient.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
    vRESTClient.AcceptCharset := 'UTF-8, *;q=0.8';
    vRESTClient.AcceptEncoding := 'UTF-8';
    vRESTRequest  := TRESTRequest.Create(Self);
    vRESTResponse := TRESTResponse.Create(Self);
    vRESTRequest.Response := vRESTResponse;
    vRESTRequest.Client   := vRESTClient;
    vRESTRequest.AcceptEncoding := 'UTF-8';
    vRESTRequest.Method         := rmPOST;

    if (vDBName <> '') and (vDBName <> 'SportsCenter') then
    begin
      vRestRequest.Params.AddItem('SQL',vSQL, TRESTRequestParameterKind.pkREQUESTBODY, [], TRESTContentType.ctAPPLICATION_JSON);
      vRestRequest.Params.AddHeader('USER_DB',vDBName);
      vRestRequest.Params.AddHeader('apikey',apikey);
    end
    else
      vRestRequest.Params.AddItem('SQL',GetEncrypt(vRESTClient.BaseURL,vSQL), TRESTRequestParameterKind.pkREQUESTBODY, [], TRESTContentType.ctAPPLICATION_JSON);

//    vItem := vRESTRequest.Params.AddItem;
//    vItem.name := 'SQL';
//    vItem.Value := '';
//    vItem.Kind := TRESTRequestParameterKind.pkREQUESTBODY;
//    vItem.ContentType := TRESTContentType.ctAPPLICATION_JSON;
//    if vDBName <> '' then
//    begin
//      vRESTRequest.Params.ParameterByName('SQL').Value     := vSQL;
//      vItem := vRESTRequest.Params.AddItem;
//      vItem.name := 'USER_DB';
//      vItem.Value := '';
//      vItem.Kind := TRESTRequestParameterKind.pkHTTPHEADER;
//      vItem.ContentType := ctNone;
//      vRESTRequest.Params.ParameterByName('USER_DB').Value     := vDBName;
//      vItem := vRESTRequest.Params.AddItem;
//      vItem.name := 'apikey';
//      vItem.Value := '';
//      vItem.Kind := TRESTRequestParameterKind.pkHTTPHEADER;
//      vItem.ContentType := ctNone;
//      vRESTRequest.Params.ParameterByName('apikey').Value     := apikey;
//    end
//    else
//      vRESTRequest.Params.ParameterByName('SQL').Value     := GetEncrypt(vRESTClient.BaseURL,vSQL);


    StartTime := Now();

    try
      vRESTRequest.Execute;
    except
      on E: Exception do
      begin
        vLogOutCheck := false;
        ErrBox('서버접속 실패'+#13+E.Message);
        LogSave('E','DM', 'OpenQuery',vSQL,Format('%s [%s][%s]',[E.Message, FormatDateTime('h:nn:ss', StartTime), FormatDateTime('h:nn:ss', Now())]));
        Exit;
      end;
    end;

    vLogOutCheck := true;
    vRESTResponse.GetSimpleValue('RESULT',vResult);
    if Copy(vResult,1,5) = 'ERROR' then
    begin
      MsgBox(CopyPos(vResult, splitColumn, 1));
      LogSave('E','DM', 'OpenQuery-1', vSQL, Format('%s [%s][%s]',[vResult, FormatDateTime('h:nn:ss', StartTime), FormatDateTime('h:nn:ss', Now())]));
      Exit;
    end;
    vRESTResponse.GetSimpleValue('DATA',vData);
    if vData = '' then Exit;
    vRESTResponse.GetSimpleValue('FIELD_NAME', vFieldName);
    vRESTResponse.GetSimpleValue('FIELD_TYPE', vFieldType);

    vData := Replace(vData,'"','〃');     //아주중요 Split 오류
    vData := Replace(vData,'＇','''');
    vData := Replace(vData,'，','''');
    vData := Replace(vData,andChar, '&');
    vData := StringReplace(vData,'#$D#$A',#$D#$A,[rfReplaceAll]);//Replace(vData, '#$D#$A',#$D#$A);

    //데이터셋에 필드구조를 만든다
    Query.Fields.Clear;
    vFieldNameList := TStringList.Create;
    Split(vFieldName, splitColumn, vFieldNameList);

    vFieldTypeList := TStringList.Create;
    Split(vFieldType, splitColumn, vFieldTypeList);

    for vIndex := 0 to vFieldNameList.Count-1 do
    begin
      if vFieldTypeList[vIndex] = 'S' then
      begin
        vField := TStringField.Create(Query);
        vField.Size := 1000;
      end
      else if vFieldTypeList[vIndex] = 'C' then
        vField := TCurrencyField.Create(Query)
      else if vFieldTypeList[vIndex] = 'D' then
        vField := TDateTimeField.Create(Query)
      else if vFieldTypeList[vIndex] = 'I' then
        vField := TIntegerField.Create(Query)
      else if vFieldTypeList[vIndex] = 'G' then
        vField := TGraphicField.Create(Query)
      else if vFieldTypeList[vIndex] = 'B' then
        vField := TBlobField.Create(Query);

      vField.FieldName := vFieldNameList[vIndex];
      vField.DataSet   := Query;
    end;

    vRow := TStringList.Create;
    vCol := TStringList.Create;
    Query.Open;
    Split(vData, splitRecord, vRow);
    for vI := 0 to vRow.Count-1 do
    begin
      Split(vRow[vI], splitColumn, vCol);

      Query.Append;
      for vJ := 0 to vCol.Count-1 do
      begin
        vColData := Replace(vCol[vJ],'〃','"');
        case Query.Fields[vJ].DataType of
          DB.ftSmallint,
          DB.ftInteger,
          DB.ftWord,
          DB.ftShortint   :
          begin
            if (vCol[vJ] = 'null') or (vCol[vJ] = '') then
              Query.Fields[vJ].AsInteger  := 0
            else
              Query.Fields[vJ].AsInteger  := StrToIntDef(vColData,0);
          end;
          DB.ftFloat,
          DB.ftCurrency,
          DB.ftExtended   :
          begin
            if (vColData = 'null') or (vColData = '') then
              Query.Fields[vJ].AsCurrency  := 0
            else
              Query.Fields[vJ].AsCurrency  := StrToCurr(vColData);
          end;
          DB.ftDate,
          DB.ftTime,
          DB.ftDateTime    :
          begin
              if  (vColData = '') or (vColData = 'null') or (vColData = '0000-00-00 00:00:00') then
              Query.Fields[vJ].AsString   := ''
            else
              Query.Fields[vJ].AsDateTime := StrToDateTime(vColData);
          end;
          DB.ftBlob        : Query.Fields[vJ].AsBytes    := DecodeBase64(vColData);
            else
            begin
              if vColData = 'null' then
                Query.Fields[vJ].AsString   := ''
              else
                Query.Fields[vJ].AsString   := vColData;
            end;
        end;
      end;
    end;
    Query.Post;
    Query.First;
    Result := Query.RecordCount > 0;
    if aClose then
      Query.Close;
  finally
    vRESTClient.DisConnect;
    FreeAndNil(vRESTResponse);
    FreeAndNil(vRESTRequest);
    FreeAndNil(vRESTClient);
    if Assigned(vFieldNameList) then
      vFieldNameList.Free;
    if Assigned(vFieldTypeList) then
      vFieldTypeList.Free;
    if Assigned(vRow) then
      vRow.Free;
    if Assigned(vCol) then
      vCol.Free;
  end;
end;

function TDM.OpenQuery(aQuery:TdxMemData;  aSQL: string;
  aParam: array of Variant; aClose:Boolean;aURL:String): Boolean;//aField ex) CD_GOODS,S  (필드명,타입)
var  vData,
    vFieldName,
    vFieldType,
    vResult,
    vColData,
    vResponse :String;
    vIndex, vI, vJ :Integer;
    vRow, vCol, vFieldNameList, vFieldTypeList : TStringList;
    vField: TField;
    vURL, vDBName,
    vSQL, vTemp :String;
    vRESTRequest :TRESTRequest;
    vRESTClient  :TRESTClient;
    vRESTResponse :TRESTResponse;
    vItem : TRESTREquestParameter;
begin
  Result := false;
  if not CheckLogOut then Exit;

  try
    vSQL := aSQL;
    for vIndex := High(aParam) downto 0 do
    begin
      case VarType(aParam[vIndex]) of
        varInteger,
        varDouble,
        varCurrency : vSQL := Replace(vSQL, Format(':P%d',[vIndex]), FormatFloat('#0',NVL(aParam[vIndex],0.0)));
        else
        begin
          vTemp := Replace(NVL(aParam[vIndex],''),'''','"');
          vTemp := Replace(vTemp, ';','');
          vSQL  := Replace(vSQL, Format(':P%d',[vIndex]), Format('''%s''',[vTemp]));
        end;
      end;
    end;
    vSQL := Replace(vsQL, '\''','\\''');
    vRESTClient   := TRESTClient.Create(nil);
    vURL    := Ifthen(aURL='',CopyPos(RestDBURL,'|',0), CopyPos(aURL,'|',0));
    vDBName := Ifthen(aURL='',CopyPos(RestDBURL,'|',1), CopyPos(aURL,'|',1));
    vRESTClient.BaseURL := vURL+'Action_Select';
    vRESTClient.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
    vRESTClient.AcceptCharset := 'UTF-8, *;q=0.8';
    vRESTClient.AcceptEncoding := 'UTF-8';
    vRESTRequest  := TRESTRequest.Create(nil);
    vRESTResponse := TRESTResponse.Create(nil);
    vRESTRequest.Response := vRESTResponse;
    vRESTRequest.Client   := vRESTClient;
    vRESTRequest.AcceptEncoding := 'UTF-8';
    vRESTRequest.Method         := rmPOST;
    if (vDBName <> '') and (vDBName <> 'SportsCenter') then
    begin
      vRestRequest.Params.AddItem('SQL',vSQL, TRESTRequestParameterKind.pkREQUESTBODY, [], TRESTContentType.ctAPPLICATION_JSON);
      vRestRequest.Params.AddHeader('USER_DB',vDBName);
      vRestRequest.Params.AddHeader('apikey',apikey);
    end
    else
      vRestRequest.Params.AddItem('SQL',GetEncrypt(vRESTClient.BaseURL,vSQL), TRESTRequestParameterKind.pkREQUESTBODY, [], TRESTContentType.ctAPPLICATION_JSON);


//    vItem := vRESTRequest.Params.AddItem;
//    vItem.name := 'SQL';
//    vItem.Value := '';
//    vItem.Kind := TRESTRequestParameterKind.pkREQUESTBODY;
//    vItem.ContentType := TRESTContentType.ctAPPLICATION_JSON;
//    vRESTRequest.Params.ParameterByName('SQL').Value     := GetEncrypt(vRESTClient.BaseURL,vSQL);
//    if vDBName <> '' then
//    begin
//      vItem := vRESTRequest.Params.AddItem;
//      vItem.name := 'USER_DB';
//      vItem.Value := '';
//      vItem.Kind := TRESTRequestParameterKind.pkHTTPHEADER;
//      vItem.ContentType := ctNone;
//      vRESTRequest.Params.ParameterByName('USER_DB').Value     := vDBName;
//    end;

    try
      StartTime := Now();
      vRESTRequest.Execute;
    except
      on E: Exception do
      begin
        vLogOutCheck := false;
        ErrBox('서버접속 실패'+#13+E.Message);
        LogSave('E','DM', 'OpenQueryEx', vSQL, Format('%s[%s][%s]',[E.Message, FormatDateTime('h:nn:ss', StartTime), FormatDateTime('h:nn:ss', Now())]));
        Exit;
      end;
    end;

    vLogOutCheck := true;
    vRESTResponse.GetSimpleValue('RESULT',vResult);
    if Copy(vResult,1,5) = 'ERROR' then
    begin
      MsgBox(CopyPos(vResult, splitColumn, 1));
      LogSave('E','DM', 'OpenQueryEx-1',vSQL, Format('%s[%s][%s]',[CopyPos(vResult, splitColumn, 1), FormatDateTime('h:nn:ss', StartTime), FormatDateTime('h:nn:ss', Now())]));
      Exit;
    end;
    vRESTResponse.GetSimpleValue('DATA',vData);
    if vData = '' then Exit;
    vRESTResponse.GetSimpleValue('FIELD_NAME', vFieldName);
    vRESTResponse.GetSimpleValue('FIELD_TYPE', vFieldType);

    vData := Replace(vData,'"','〃');     //아주중요 Split 오류
    vData := Replace(vData,'＇','''');
    vData := Replace(vData,'＇','''');
    vData := Replace(vData,andChar, '&');
    vData := StringReplace(vData,'#$D#$A',#$D#$A,[rfReplaceAll]);

    //데이터셋에 필드구조를 만든다
    aQuery.Fields.Clear;
    vFieldNameList := TStringList.Create;
    Split(vFieldName, splitColumn, vFieldNameList);

    vFieldTypeList := TStringList.Create;
    Split(vFieldType, splitColumn, vFieldTypeList);

    try
      for vIndex := 0 to vFieldNameList.Count-1 do
      begin
        if vFieldTypeList[vIndex] = 'S' then
        begin
          vField := TStringField.Create(Query);
          vField.Size := 1000;
        end
        else if vFieldTypeList[vIndex] = 'C' then
          vField := TCurrencyField.Create(Query)
        else if vFieldTypeList[vIndex] = 'D' then
          vField := TDateTimeField.Create(Query)
        else if vFieldTypeList[vIndex] = 'I' then
          vField := TIntegerField.Create(Query)
        else if vFieldTypeList[vIndex] = 'G' then
          vField := TGraphicField.Create(Query)
        else if vFieldTypeList[vIndex] = 'B' then
          vField := TBlobField.Create(Query);

        vField.FieldName := vFieldNameList[vIndex];
        vField.DataSet   := aQuery;
      end;
    except
      on E: Exception do
      begin
        ErrBox(E.Message);
        Exit;
      end;
    end;

    vRow := TStringList.Create;
    vCol := TStringList.Create;
    aQuery.Open;
    Split(vData, splitRecord, vRow);
    try
      for vI := 0 to vRow.Count-1 do
      begin
        Split(vRow[vI], splitColumn, vCol);

        aQuery.Append;
        for vJ := 0 to vCol.Count-1 do
        begin
          vColData := Replace(vCol[vJ],'〃','"');
          case aQuery.Fields[vJ].DataType of
            DB.ftSmallint,
            DB.ftInteger,
            DB.ftWord,
            DB.ftShortint   :
            begin
              if (vColData = 'null') or (vColData = '') then
                aQuery.Fields[vJ].AsInteger  := 0
              else
                aQuery.Fields[vJ].AsInteger  := StrToIntDef(vColData,0);
            end;
            DB.ftFloat,
            DB.ftCurrency,
            DB.ftExtended   :
            begin
              if (vColData = 'null') or (vColData = '') then
                aQuery.Fields[vJ].AsCurrency  := 0
              else
                aQuery.Fields[vJ].AsCurrency  := StrToCurr(vColData);
            end;
            DB.ftDate,
            DB.ftTime,
            DB.ftDateTime    :
            begin
              if vColData = 'null' then
                aQuery.Fields[vJ].AsString   := ''
              else
                aQuery.Fields[vJ].AsDateTime := StrToDateTime(vColData);
            end;
            DB.ftBlob        : aQuery.Fields[vJ].AsBytes    := DecodeBase64(vColData);
              else
              begin
                if vColData = 'null' then
                  aQuery.Fields[vJ].AsString   := ''
                else
                  aQuery.Fields[vJ].AsString   := vColData;
              end;
          end;
        end;
      end;
    except
      on E: Exception do
      begin
        ErrBox(E.Message);
        LogSave('E','DM', 'OpenQueryEx-2', vSQL, Format('%s[%s][%s]',[E.Message, FormatDateTime('h:nn:ss', StartTime), FormatDateTime('h:nn:ss', Now())]));
      end;
    end;
    aQuery.Post;
    aQuery.First;
    Result := aQuery.RecordCount > 0;
  finally
    vRESTClient.DisConnect;
    FreeAndNil(vRESTResponse);
    FreeAndNil(vRESTRequest);
    FreeAndNil(vRESTClient);
    if Assigned(vFieldNameList) then
      vFieldNameList.Free;
    if Assigned(vFieldTypeList) then
      vFieldTypeList.Free;
    if Assigned(vRow) then
      vRow.Free;
    if Assigned(vCol) then
      vCol.Free;
  end;
end;

//------------------------------------------------------------------------------
// DML 실행
function TDM.CheckLogOut: Boolean;
var  vData,
    vFieldName,
    vFieldType,
    vResult,
    vResponse :String;
    vIndex, vI, vJ :Integer;
    vRow, vCol, vFieldNameList, vFieldTypeList : TStringList;
    vField: TField;
    vURL, vDBName,
    vSQL, vTemp :String;
    vRESTRequest :TRESTRequest;
    vRESTClient  :TRESTClient;
    vRESTResponse :TRESTResponse;
    vItem : TRESTREquestParameter;
begin
  Result := true;
  if (UserLevel = 'E') or (UserLevel = 'P') then Exit;

  if (ConnectionLimit = 0) or not LoginEnd or (IncMinute(LogOutCheckTime, 10) > Now()) then Exit;
  try
    vSQL := Format('select LOGIN_PC, '
                  +'       LOGIN_MAC '
                  +'  from MS_SAWON '
                  +' where CD_HEAD  = ''%s'' '
                  +'   and CD_STORE = ''%s'' '
                  +'   and CD_SAWON = ''%s'' ',
                  [HeadStoreCode,
                   StoreCode,
                   UserCode]);

    vSQL := Replace(vsQL, '\''','\\''');
    vRESTClient   := TRESTClient.Create(nil);
    vURL    := CopyPos(RestOrgDBURL,'|',0);
    vDBName := CopyPos(RestOrgDBURL,'|',1);
    vRESTClient.BaseURL := vURL+'Action_Select';
    vRESTClient.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
    vRESTClient.AcceptCharset := 'UTF-8, *;q=0.8';
    vRESTClient.AcceptEncoding := 'UTF-8';
    vRESTRequest  := TRESTRequest.Create(nil);
    vRESTResponse := TRESTResponse.Create(nil);
    vRESTRequest.Response := vRESTResponse;
    vRESTRequest.Client   := vRESTClient;
    vRESTRequest.AcceptEncoding := 'UTF-8';
    vRESTRequest.Method         := rmPOST;
    if (vDBName <> '') and (vDBName <> 'SportsCenter') then
    begin
      vRestRequest.Params.AddItem('SQL',vSQL, TRESTRequestParameterKind.pkREQUESTBODY, [], TRESTContentType.ctAPPLICATION_JSON);
      vRestRequest.Params.AddHeader('USER_DB',vDBName);
      vRestRequest.Params.AddHeader('apikey',apikey);
    end
    else
      vRestRequest.Params.AddItem('SQL',GetEncrypt(vRESTClient.BaseURL,vSQL), TRESTRequestParameterKind.pkREQUESTBODY, [], TRESTContentType.ctAPPLICATION_JSON);


//    vItem := vRESTRequest.Params.AddItem;
//    vItem.name := 'SQL';
//    vItem.Value := '';
//    vItem.Kind := TRESTRequestParameterKind.pkREQUESTBODY;
//    vItem.ContentType := TRESTContentType.ctAPPLICATION_JSON;
//    vRESTRequest.Params.ParameterByName('SQL').Value     := GetEncrypt(vRESTClient.BaseURL,vSQL);
//    if vDBName <> '' then
//    begin
//      vItem := vRESTRequest.Params.AddItem;
//      vItem.name := 'USER_DB';
//      vItem.Value := '';
//      vItem.Kind := TRESTRequestParameterKind.pkHTTPHEADER;
//      vItem.ContentType := ctNone;
//      vRESTRequest.Params.ParameterByName('USER_DB').Value     := vDBName;
//    end;

    try
      StartTime := Now();
      vRESTRequest.Execute;
    except
      on E: Exception do
      begin
        ErrBox(E.Message);
        LogSave('E','DM', 'CheckLogOut', vSQL, Format('%s[%s][%s]',[E.Message, FormatDateTime('h:nn:ss', StartTime), FormatDateTime('h:nn:ss', Now())]));
        Exit;
      end;
    end;

    LogOutCheckTime := Now();
    vRESTResponse.GetSimpleValue('RESULT',vResult);
    if  Copy(vResult,1,5) = 'ERROR' then
    begin
      MsgBox(CopyPos(vResult, splitColumn, 1));
      LogSave('E','DM', 'CheckLogOut', vSQL, Format('%s[%s][%s]',[CopyPos(vResult, splitColumn, 1), FormatDateTime('h:nn:ss', StartTime), FormatDateTime('h:nn:ss', Now())]));
      Exit;
    end;
    vRESTResponse.GetSimpleValue('DATA',vData);
    if vData = '' then Exit;
    vRESTResponse.GetSimpleValue('FIELD_NAME', vFieldName);
    vRESTResponse.GetSimpleValue('FIELD_TYPE', vFieldType);

    vData := Replace(vData,'＇','''');
    vData := Replace(vData,andChar, '&');
    vData := Replace(vData, '#$D#$A',#$D#$A);

    //데이터셋에 필드구조를 만든다
    Query.Fields.Clear;
    vFieldNameList := TStringList.Create;
    Split(vFieldName, splitColumn, vFieldNameList);

    vFieldTypeList := TStringList.Create;
    Split(vFieldType, splitColumn, vFieldTypeList);

    for vIndex := 0 to vFieldNameList.Count-1 do
    begin
      if vFieldTypeList[vIndex] = 'S' then
      begin
        vField := TStringField.Create(Query);
        vField.Size := 1000;
      end
      else if vFieldTypeList[vIndex] = 'C' then
        vField := TCurrencyField.Create(Query)
      else if vFieldTypeList[vIndex] = 'D' then
        vField := TDateTimeField.Create(Query)
      else if vFieldTypeList[vIndex] = 'I' then
        vField := TIntegerField.Create(Query)
      else if vFieldTypeList[vIndex] = 'G' then
        vField := TGraphicField.Create(Query)
      else if vFieldTypeList[vIndex] = 'B' then
        vField := TBlobField.Create(Query);

      vField.FieldName := vFieldNameList[vIndex];
      vField.DataSet   := Query;
    end;

    vRow := TStringList.Create;
    vCol := TStringList.Create;
    Query.Open;
    Split(vData, splitRecord, vRow);
    for vI := 0 to vRow.Count-1 do
    begin
      Split(vRow[vI], splitColumn, vCol);

      Query.Append;
      for vJ := 0 to vCol.Count-1 do
      begin
        case Query.Fields[vJ].DataType of
          DB.ftSmallint,
          DB.ftInteger,
          DB.ftWord,
          DB.ftShortint   :
          begin
            if (vCol[vJ] = 'null') or (vCol[vJ] = '') then
              Query.Fields[vJ].AsInteger  := 0
            else
              Query.Fields[vJ].AsInteger  := StrToIntDef(vCol[vJ],0);
          end;
          DB.ftFloat,
          DB.ftCurrency,
          DB.ftExtended   :
          begin
            if (vCol[vJ] = 'null') or (vCol[vJ] = '') then
              Query.Fields[vJ].AsCurrency  := 0
            else
              Query.Fields[vJ].AsCurrency  := StrToCurr(vCol[vJ]);
          end;
          DB.ftDate,
          DB.ftTime,
          DB.ftDateTime    :
          begin
            if vCol[vJ] = 'null' then
              Query.Fields[vJ].AsString   := ''
            else
              Query.Fields[vJ].AsDateTime := StrToDateTime(vCol[vJ]);
          end;
          DB.ftBlob        : Query.Fields[vJ].AsBytes    := DecodeBase64(vCol[vJ]);
            else
            begin
              if vCol[vJ] = 'null' then
                Query.Fields[vJ].AsString   := ''
              else
                Query.Fields[vJ].AsString   := vCol[vJ];
            end;
        end;
      end;
    end;
    Query.Post;
    Query.First;
  finally
    vRESTClient.DisConnect;
    FreeAndNil(vRESTResponse);
    FreeAndNil(vRESTRequest);
    FreeAndNil(vRESTClient);
    if Assigned(vFieldNameList) then
      vFieldNameList.Free;
    if Assigned(vFieldTypeList) then
      vFieldTypeList.Free;
    if Assigned(vRow) then
      vRow.Free;
    if Assigned(vCol) then
      vCol.Free;
  end;

  if (Query.Fields[0].AsString <> '') and ((Query.Fields[0].AsString <> GetPCName) or (Query.Fields[1].AsString <> GetMacAddress)) then
  begin
    Query.Close;
    MsgBox('다른 PC에서 로그인되어 프로그램을 종료합니다');
    Result := false;
    Application.Terminate;
  end
  else
  begin
    Query.Close;
    LogOutCheckTime := Now();
  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  LoginEnd := false;
  LogOutCheckTime := IncMinute(Now(), -10);

  try
    StrToDate('2023-02-13');
  except
    ErrBox('시스템에 DateTime 형식이 올바르지 않습니다'#13'설정을 변경 후 다시 실행하세요 ');
    Tag := 1;
  end;

end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  SetGridData;
end;

function TDM.ExecSmsProcedure(aProcedure, aErrTitle: String): Boolean;
var vResult:String;
    vRESTRequest :TRESTRequest;
    vRESTClient  :TRESTClient;
    vRESTResponse :TRESTResponse;
    vItem : TRESTREquestParameter;
begin
  try
    vRESTClient   := TRESTClient.Create(nil);
    vRESTClient.BaseURL := CopyPos(jsonSMSDBURL,'|',0)+'Action_PCall';
    vRESTClient.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
    vRESTClient.AcceptCharset := 'UTF-8, *;q=0.8';
    vRESTClient.AcceptEncoding := 'UTF-8';
    vRESTRequest  := TRESTRequest.Create(nil);
    vRESTResponse := TRESTResponse.Create(nil);
    vRESTRequest.Response := vRESTResponse;
    vRESTRequest.Client   := vRESTClient;
    vRESTRequest.AcceptEncoding := 'UTF-8';
    vRESTRequest.Method         := rmPOST;
    vItem := vRESTRequest.Params.AddItem;
    vItem.name := 'SQL';
    vItem.Value := '';
    vItem.Kind := TRESTRequestParameterKind.pkREQUESTBODY;
    vItem.ContentType := TRESTContentType.ctAPPLICATION_JSON;
    vRESTRequest.Params.ParameterByName('SQL').Value     := GetEncrypt(vRESTClient.BaseURL,aProcedure);
    try
      StartTime := Now();
      Result := false;
      vRESTRequest.Execute;

      vRESTResponse.GetSimpleValue('RESULT',vResult);
      if Copy(vResult,1,5) = 'ERROR' then
      begin
        Common.MsgBox(aErrTitle + #13 +CopyPos(vResult, splitColumn, 1));
        LogSave('E','DM', 'ExecCloudProcedure', aProcedure,  Format('%s[%s][%s]',[CopyPos(vResult, splitColumn, 1), FormatDateTime('h:nn:ss', StartTime), FormatDateTime('h:nn:ss', Now())]));
        Exit;
      end;
      Result := true;
    except
      on E: Exception do
      begin
        Common.ErrBox(E.Message);
        LogSave('E','DM', 'ExecCloudProcedure-1', aProcedure, Format('%s[%s][%s]',[E.Message, FormatDateTime('h:nn:ss', StartTime), FormatDateTime('h:nn:ss', Now())]));
      end;
    end;
  finally
    vRESTClient.DisConnect;
    FreeAndNil(vRESTResponse);
    FreeAndNil(vRESTRequest);
    FreeAndNil(vRESTClient);
  end;
end;

function TDM.ExecProcedure(aProcedure: string;aURL:String): Boolean;
var vResult:String;
    vURL, vDBName :String;
    vRESTRequest :TRESTRequest;
    vRESTClient  :TRESTClient;
    vRESTResponse :TRESTResponse;
    vItem : TRESTREquestParameter;
begin
  try
    vRESTClient   := TRESTClient.Create(nil);
    vURL    := CopyPos(aURL,'|',0);
    vDBName := CopyPos(aURL,'|',1);
    vRESTClient.BaseURL := vURL +'Action_PCall';
    vRESTClient.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
    vRESTClient.AcceptCharset := 'UTF-8, *;q=0.8';
    vRESTClient.AcceptEncoding := 'UTF-8';
    vRESTRequest  := TRESTRequest.Create(nil);
    vRESTResponse := TRESTResponse.Create(nil);
    vRESTRequest.Response := vRESTResponse;
    vRESTRequest.Client   := vRESTClient;
    vRESTRequest.AcceptEncoding := 'UTF-8';
    vRESTRequest.Method         := rmPOST;
    vItem := vRESTRequest.Params.AddItem;
    vItem.name := 'SQL';
    vItem.Value := '';
    vItem.Kind := TRESTRequestParameterKind.pkREQUESTBODY;
    vItem.ContentType := TRESTContentType.ctAPPLICATION_JSON;
    vRESTRequest.Params.ParameterByName('SQL').Value     := GetEncrypt(vRESTClient.BaseURL,aProcedure);
    if vDBName <> '' then
    begin
      vItem := vRESTRequest.Params.AddItem;
      vItem.name := 'USER_DB';
      vItem.Value := '';
      vItem.Kind := TRESTRequestParameterKind.pkHTTPHEADER;
      vItem.ContentType := ctNone;
      vRESTRequest.Params.ParameterByName('USER_DB').Value     := vDBName;
    end;
    try
      StartTime := Now();
      vRESTRequest.Execute;

      vRESTResponse.GetSimpleValue('RESULT',vResult);
      if Copy(vResult,1,5) = 'ERROR' then
      begin
        MsgBox(CopyPos(vResult, splitColumn, 1));
        LogSave('E','DM', 'ExecProcedure', aProcedure, Format('%s[%s][%s]',[CopyPos(vResult, splitColumn, 1), FormatDateTime('h:nn:ss', StartTime), FormatDateTime('h:nn:ss', Now())]));
        Exit;
      end;
      Result := true;
    except
      on E: Exception do
      begin
        ErrBox(E.Message);
        LogSave('E','DM', 'ExecProcedure-1', aProcedure, Format('%s[%s][%s]',[E.Message, FormatDateTime('h:nn:ss', StartTime), FormatDateTime('h:nn:ss', Now())]));
      end;
    end;
  finally
    vRESTClient.DisConnect;
    FreeAndNil(vRESTResponse);
    FreeAndNil(vRESTRequest);
    FreeAndNil(vRESTClient);
  end;
end;

function TDM.ExecQuery(aSQL: string; aParam:array of Variant; aExecute:Boolean;aURL:String):Boolean;
var vResult,
    vURL, vDBName,
    vSQL :String;
    vRESTRequest :TRESTRequest;
    vRESTClient  :TRESTClient;
    vRESTResponse :TRESTResponse;
    vItem : TRESTREquestParameter;
begin
  Result := false;
  if not vLogOutCheck or not CheckLogOut then Exit;
  if High(aParam) >= 0 then
    vSQL := ConvertSQL(aSQL, aParam)
  else
    vSQL := aSQL;

  TempSQL := TempSQL + vSQL;
  if not aExecute then
    Exit;

  vSQL :=  Replace(TempSQL, #9, '');
  vSQL := Replace(vSQL, '\''','\\''');
  vSQL := Replace(vSQL, #$D#$A,'#$D#$A');

  try
    vRESTClient   := TRESTClient.Create(Self);
    vURL    := Ifthen(aURL='',CopyPos(RestDBURL,'|',0), CopyPos(aURL,'|',0));
    vDBName := Ifthen(aURL='',CopyPos(RestDBURL,'|',1), CopyPos(aURL,'|',1));
    vRESTClient.BaseURL := vURL+'Action_Excute';
    vRESTClient.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
    vRESTClient.AcceptCharset := 'UTF-8, *;q=0.8';
    vRESTClient.AcceptEncoding := 'UTF-8';
    vRESTRequest  := TRESTRequest.Create(nil);
    vRESTResponse := TRESTResponse.Create(nil);
    vRESTRequest.Response := vRESTResponse;
    vRESTRequest.Client   := vRESTClient;
    vRESTRequest.AcceptEncoding := 'UTF-8';
    vRESTRequest.Method         := rmPOST;
    if (vDBName <> '') and (vDBName <> 'SportsCenter') then
    begin
      vRestRequest.Params.AddItem('SQL',vSQL, TRESTRequestParameterKind.pkREQUESTBODY, [], TRESTContentType.ctAPPLICATION_JSON);
      vRestRequest.Params.AddHeader('USER_DB',vDBName);
      vRestRequest.Params.AddHeader('apikey',apikey);
    end
    else
      vRestRequest.Params.AddItem('SQL',GetEncrypt(vRESTClient.BaseURL,vSQL), TRESTRequestParameterKind.pkREQUESTBODY, [], TRESTContentType.ctAPPLICATION_JSON);


//    vItem := vRESTRequest.Params.AddItem;
//    vItem.name := 'SQL';
//    vItem.Value := '';
//    vItem.Kind := TRESTRequestParameterKind.pkREQUESTBODY;
//    vItem.ContentType := TRESTContentType.ctAPPLICATION_JSON;
//   vRESTRequest.Params.ParameterByName('SQL').Value     := GetEncrypt(vRESTClient.BaseURL,vSQL);
//    if vDBName <> '' then
//    begin
//      vItem := vRESTRequest.Params.AddItem;
//      vItem.name := 'USER_DB';
//      vItem.Value := '';
//      vItem.Kind := TRESTRequestParameterKind.pkHTTPHEADER;
//      vItem.ContentType := ctNone;
//      vRESTRequest.Params.ParameterByName('USER_DB').Value     := vDBName;
//    end;
    try
      StartTime := Now();
      vRESTRequest.Execute;

      TempSQL := '';
      vRESTResponse.GetSimpleValue('RESULT',vResult);
      if Copy(vResult,1,5) = 'ERROR' then
      begin
        MsgBox(CopyPos(vResult, splitColumn, 1));
        LogSave('E','DM', 'ExecQuery', vSQL, Format('%s-%s[%s]',[CopyPos(vResult, splitColumn, 1), FormatDateTime('h:nn:ss', StartTime), FormatDateTime('h:nn:ss', Now())]));
        Exit;
      end;
      Result := true;
    except
      on E: Exception do
      begin
        ErrBox(E.Message);
        LogSave('E','DM', 'ExecQuery-1', vSQL, Format('%s[%s][%s]',[E.Message, FormatDateTime('h:nn:ss', StartTime), FormatDateTime('h:nn:ss', Now())]));
      end;
    end;
  finally
    vRESTClient.DisConnect;
    FreeAndNil(vRESTResponse);
    FreeAndNil(vRESTRequest);
    FreeAndNil(vRESTClient);
  end;

end;

//------------------------------------------------------------------------------
// 쿼리 닫기
procedure TDM.FinishQuery;
begin
  Query.Close;
end;

procedure TDM.GroupGridTable(aGridTableView: TcxGridTableView; aKey,
  aTextIndex: Integer; aText: String; aCol: array of Integer);
var vIndex, vCol, vRowIndex, vCount, vRow :Integer;
    vSum, vTotal :array of Integer;

    vKeyText:String;
    vLoop   :Boolean;
label Loop;
begin
  SetLength(vSum,   High(aCol)+1);
  SetLength(vTotal, High(aCol)+1);
  for vIndex := 0 to High(vSum) do
  begin
    vSum[vIndex]    := 0;
    vTotal[vIndex]  := 0;
  end;
  vKeyText  := '999999999';
  vCount    := 0;
  aGridTableView.DataController.BeginUpdate;
  try
Loop:
    vLoop := false;
    with aGridTableView.DataController do
      for vIndex := vRow to RecordCount-1 do
      begin
        if (vKeyText = '999999999') or (Values[vIndex, aKey] = vKeyText) then
        begin
          if vCount > 0 then
            Values[vIndex, aKey] := EmptyStr
          else
            vKeyText := Values[vIndex, aKey];

          Inc(vCount);
          for vCol := 0 to High(vSum) do
          begin
            vSum[vCol]   := vSum[vCol]   + NVL(Values[vIndex, aCol[vCol]],0);
            vTotal[vCol] := vTotal[vCol] + NVL(Values[vIndex, aCol[vCol]],0);
          end;
        end
        else
        begin
          vRowIndex := aGridTableView.DataController.InsertRecord(vIndex);
          Values[vRowIndex, aTextIndex] := aText;
          for vCol := 0 to High(vSum) do
          begin
            Values[vRowIndex, aCol[vCol]] := vSum[vCol];
            vSum[vCol] := 0;
          end;
          vCount := 0;
          vKeyText  := '999999999';
          vRow  := vIndex + 1;
          if RecordCount > vRow then
            vLoop := true;
          Break;
        end;
      end;
      if vLoop then goto Loop
      else
      begin
        aGridTableView.DataController.AppendRecord;
        vRowIndex := aGridTableView.DataController.RecordCount-1;
        aGridTableView.DataController.Values[vRowIndex, aTextIndex] := aText;
        for vCol := 0 to High(vSum) do
          aGridTableView.DataController.Values[vRowIndex, aCol[vCol]] := vSum[vCol];

        //총합계 추가
        aGridTableView.DataController.AppendRecord;
        vRowIndex := aGridTableView.DataController.RecordCount-1;
        aGridTableView.DataController.Values[vRowIndex, aTextIndex] := ' [ 합 계 ] ';
        for vCol := 0 to High(vSum) do
          aGridTableView.DataController.Values[vRowIndex, aCol[vCol]] := vTotal[vCol];

      end;
  finally
    aGridTableView.DataController.EndUpdate;
  end;

end;


function TDM.OpenQuery(aSQL, aDB: string; aParam: array of Variant;
  aClose: Boolean; aURL: String): Boolean;
var  vData,
    vFieldName,
    vFieldType,
    vResult,
    vResponse :String;
    vIndex, vI, vJ :Integer;
    vRow, vCol, vFieldNameList, vFieldTypeList : TStringList;
    vField: TField;
    vSQL, vTemp :String;
    vRESTRequest :TRESTRequest;
    vRESTClient  :TRESTClient;
    vRESTResponse :TRESTResponse;
    vItem : TRESTREquestParameter;
begin
  Result := false;
  if not CheckLogOut then Exit;


  try
    vSQL := aSQL;
    for vIndex := High(aParam) downto 0 do
    begin
      case VarType(aParam[vIndex]) of
        varInteger,
        varDouble,
        varCurrency : vSQL := Replace(vSQL, Format(':P%d',[vIndex]), FormatFloat('#0',NVL(aParam[vIndex],0.0)));
        varDate     : vSQL := Replace(vSQL, Format(':P%d',[vIndex]), Format('Cast(''%s'' as DateTime)',[FormatDateTime('yyyy-mm-dd hh:nn:ss',aParam[vIndex])]));
        else
        begin
          vSQL  := Replace(vSQL, Format(':P%d',[vIndex]), Format('''%s''',[aParam[vIndex]]));
        end;
      end;
    end;

    vSQL := Replace(vsQL, '\''','\\''');
    vRESTClient   := TRESTClient.Create(nil);
    vRESTClient.BaseURL := Ifthen(aURL='',CopyPos(RestDBURL,'|',0), CopyPos(aURL,'|',0)) +'Action_Select';
    vRESTClient.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
    vRESTClient.AcceptCharset := 'UTF-8, *;q=0.8';
    vRESTClient.AcceptEncoding := 'UTF-8';
    vRESTRequest  := TRESTRequest.Create(nil);
    vRESTResponse := TRESTResponse.Create(nil);
    vRESTRequest.Response := vRESTResponse;
    vRESTRequest.Client   := vRESTClient;
    vRESTRequest.AcceptEncoding := 'UTF-8';
    vRESTRequest.Method         := rmPOST;

    if (aDB <> '') and (aDB <> 'SportsCenter') then
    begin
      vRestRequest.Params.AddItem('SQL',vSQL, TRESTRequestParameterKind.pkREQUESTBODY, [], TRESTContentType.ctAPPLICATION_JSON);
      vRestRequest.Params.AddHeader('USER_DB',aDB);
      vRestRequest.Params.AddHeader('apikey',apikey);
    end
    else
      vRestRequest.Params.AddItem('SQL',GetEncrypt(vRESTClient.BaseURL,vSQL), TRESTRequestParameterKind.pkREQUESTBODY, [], TRESTContentType.ctAPPLICATION_JSON);

//    vItem := vRESTRequest.Params.AddItem;
//    vItem.name := 'SQL';
//    vItem.Value := '';
//    vItem.Kind := TRESTRequestParameterKind.pkREQUESTBODY;
//    vItem.ContentType := TRESTContentType.ctAPPLICATION_JSON;
//    vItem := vRESTRequest.Params.AddItem;
//    vItem.name := 'USER_DB';
//    vItem.Value := '';
//    vItem.Kind := TRESTRequestParameterKind.pkHTTPHEADER;
//    vItem.ContentType := ctNone;
//    vRESTRequest.Params.ParameterByName('SQL').Value     := GetEncrypt(vRESTClient.BaseURL,vSQL);
//    vRESTRequest.Params.ParameterByName('USER_DB').Value := aDB;

    StartTime := Now();

    try
      vRESTRequest.Execute;
    except
      on E: Exception do
      begin
        vLogOutCheck := false;
        ErrBox('서버접속 실패'+#13+E.Message);
        LogSave('E','DM', 'OpenQuery',vSQL,Format('%s [%s][%s]',[E.Message, FormatDateTime('h:nn:ss', StartTime), FormatDateTime('h:nn:ss', Now())]));
        Exit;
      end;
    end;

    vLogOutCheck := true;
    vRESTResponse.GetSimpleValue('RESULT',vResult);
    if Copy(vResult,1,5) = 'ERROR' then
    begin
      MsgBox(CopyPos(vResult, splitColumn, 1));
      LogSave('E','DM', 'OpenQuery-1', vSQL, Format('%s [%s][%s]',[vResult, FormatDateTime('h:nn:ss', StartTime), FormatDateTime('h:nn:ss', Now())]));
      Exit;
    end;
    vRESTResponse.GetSimpleValue('DATA',vData);
    if vData = '' then Exit;
    vRESTResponse.GetSimpleValue('FIELD_NAME', vFieldName);
    vRESTResponse.GetSimpleValue('FIELD_TYPE', vFieldType);
    vData := Replace(vData,'，','''');
    vData := Replace(vData,andChar, '&');
    vData := Replace(vData, '#$D#$A',#$D#$A);

    //데이터셋에 필드구조를 만든다
    Query.Fields.Clear;
    vFieldNameList := TStringList.Create;
    Split(vFieldName, splitColumn, vFieldNameList);

    vFieldTypeList := TStringList.Create;
    Split(vFieldType, splitColumn, vFieldTypeList);

    for vIndex := 0 to vFieldNameList.Count-1 do
    begin
      if vFieldTypeList[vIndex] = 'S' then
      begin
        vField := TStringField.Create(Query);
        vField.Size := 1000;
      end
      else if vFieldTypeList[vIndex] = 'C' then
        vField := TCurrencyField.Create(Query)
      else if vFieldTypeList[vIndex] = 'D' then
        vField := TDateTimeField.Create(Query)
      else if vFieldTypeList[vIndex] = 'I' then
        vField := TIntegerField.Create(Query)
      else if vFieldTypeList[vIndex] = 'G' then
        vField := TGraphicField.Create(Query)
      else if vFieldTypeList[vIndex] = 'B' then
        vField := TBlobField.Create(Query);

      vField.FieldName := vFieldNameList[vIndex];
      vField.DataSet   := Query;
    end;

    vRow := TStringList.Create;
    vCol := TStringList.Create;
    Query.Open;
    Split(vData, splitRecord, vRow);
    for vI := 0 to vRow.Count-1 do
    begin
      Split(vRow[vI], splitColumn, vCol);

      Query.Append;
      for vJ := 0 to vCol.Count-1 do
      begin
        case Query.Fields[vJ].DataType of
          DB.ftSmallint,
          DB.ftInteger,
          DB.ftWord,
          DB.ftShortint   :
          begin
            if (vCol[vJ] = 'null') or (vCol[vJ] = '') then
              Query.Fields[vJ].AsInteger  := 0
            else
              Query.Fields[vJ].AsInteger  := StrToIntDef(vCol[vJ],0);
          end;
          DB.ftFloat,
          DB.ftCurrency,
          DB.ftExtended   :
          begin
            if (vCol[vJ] = 'null') or (vCol[vJ] = '') then
              Query.Fields[vJ].AsCurrency  := 0
            else
              Query.Fields[vJ].AsCurrency  := StrToCurr(vCol[vJ]);
          end;
          DB.ftDate,
          DB.ftTime,
          DB.ftDateTime    :
          begin
            if vCol[vJ] = 'null' then
              Query.Fields[vJ].AsString   := ''
            else
              Query.Fields[vJ].AsDateTime := StrToDateTime(vCol[vJ]);
          end;
          DB.ftBlob        : Query.Fields[vJ].AsBytes    := DecodeBase64(vCol[vJ]);
            else
            begin
              if vCol[vJ] = 'null' then
                Query.Fields[vJ].AsString   := ''
              else
                Query.Fields[vJ].AsString   := vCol[vJ];
            end;
        end;
      end;
    end;
    Query.Post;
    Query.First;
    Result := Query.RecordCount > 0;
    if aClose then
      Query.Close;
  finally
    vRESTClient.DisConnect;
    FreeAndNil(vRESTResponse);
    FreeAndNil(vRESTRequest);
    FreeAndNil(vRESTClient);
    if Assigned(vFieldNameList) then
      vFieldNameList.Free;
    if Assigned(vFieldTypeList) then
      vFieldTypeList.Free;
    if Assigned(vRow) then
      vRow.Free;
    if Assigned(vCol) then
      vCol.Free;
  end;
end;


//------------------------------------------------------------------------------
// 쿼리를 읽어 그리드에 담기
procedure TDM.ReadGridQuery;
var vData,
    vFieldName,
    vFieldType,
    vResult :String;
    vIndex, vI, vJ :Integer;
    vRow, vCol, vFieldNameList, vFieldTypeList : TStringList;
    vField: TField;
    vDBName,
    vSQL :String;
    vRESTRequest :TRESTRequest;
    vRESTClient  :TRESTClient;
    vRESTResponse :TRESTResponse;
    vItem : TRESTREquestParameter;
begin
  try
    vSQL := Format('select * , ''rsNormal'' as ROW_STATE '
                  +'  from MS_GRID '
                  +' where CD_HEAD  =''%s'' '
                  +'   and CD_STORE =''%s'' '
                  +'   and CD_SAWON =''%s'' ',
                  [HeadStoreCode,
                   StoreCode,
                   UserCode]);

    vRESTClient   := TRESTClient.Create(nil);

    if (UserLevel = 'E') or (UserLevel = 'P') then
    begin
      vRESTClient.BaseURL := CopyPos(RestBaseURL,'|',0)+'Action_Select';
      vDBName := '';
    end
    else
    begin
      vRESTClient.BaseURL := CopyPos(RestDBURL,'|',0)+'Action_Select';
      vDBName := CopyPos(RestDBURL,'|',1);
    end;
    vRESTClient.Accept          := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
    vRESTClient.AcceptCharset   := 'UTF-8, *;q=0.8';
    vRESTClient.AcceptEncoding  := 'UTF-8';
    vRESTRequest                := TRESTRequest.Create(nil);
    vRESTResponse               := TRESTResponse.Create(nil);
    vRESTRequest.Response       := vRESTResponse;
    vRESTRequest.Client         := vRESTClient;
    vRESTRequest.AcceptEncoding := 'UTF-8';
    vRESTRequest.Method         := rmPOST;

    if (vDBName <> '') and (vDBName <> 'SportsCenter') then
    begin
      vRestRequest.Params.AddItem('SQL',vSQL, TRESTRequestParameterKind.pkREQUESTBODY, [], TRESTContentType.ctAPPLICATION_JSON);
      vRestRequest.Params.AddHeader('USER_DB',vDBName);
      vRestRequest.Params.AddHeader('apikey',apikey);
    end
    else
      vRestRequest.Params.AddItem('SQL',GetEncrypt(vRESTClient.BaseURL,vSQL), TRESTRequestParameterKind.pkREQUESTBODY, [], TRESTContentType.ctAPPLICATION_JSON);


//    vItem := vRESTRequest.Params.AddItem;
//    vItem.name := 'SQL';
//    vItem.Value := '';
//    vItem.Kind := TRESTRequestParameterKind.pkREQUESTBODY;
//    vItem.ContentType := TRESTContentType.ctAPPLICATION_JSON;
//    vRESTRequest.Params.ParameterByName('SQL').Value     := GetEncrypt(vRESTClient.BaseURL,vSQL);
//    if vDBName <> '' then
//    begin
//      vItem := vRESTRequest.Params.AddItem;
//      vItem.name := 'USER_DB';
//      vItem.Value := '';
//      vItem.Kind := TRESTRequestParameterKind.pkHTTPHEADER;
//      vItem.ContentType := ctNone;
//      vRESTRequest.Params.ParameterByName('USER_DB').Value     := vDBName;
//    end;
    try
      StartTime := Now();
      vRESTRequest.Execute;
    except
      on E: Exception do
      begin
        vLogOutCheck := false;
        ErrBox('서버접속 실패'+#13+E.Message);
        LogSave('E','DM', 'ReadGridQuery', '', Format('%s[%s][%s]',[E.Message, FormatDateTime('h:nn:ss', StartTime), FormatDateTime('h:nn:ss', Now())]));
        Exit;
      end;
    end;

    vRESTResponse.GetSimpleValue('RESULT',vResult);
    if Copy(vResult,1,5) = 'ERROR' then
    begin
      MsgBox(CopyPos(vResult, splitColumn, 1));
      LogSave('E','DM', 'ReadGridQuery-1', '', Format('%s[%s][%s]',[CopyPos(vResult, splitColumn, 1), FormatDateTime('h:nn:ss', StartTime), FormatDateTime('h:nn:ss', Now())]));
      Exit;
    end;
    vRESTResponse.GetSimpleValue('DATA',vData);
    vRESTResponse.GetSimpleValue('FIELD_NAME', vFieldName);
    vRESTResponse.GetSimpleValue('FIELD_TYPE', vFieldType);

    //데이터셋에 필드구조를 만든다
    if GridData.Active then
      GridData.Close;
    GridData.Fields.Clear;
    vFieldNameList := TStringList.Create;
    Split(vFieldName, splitColumn, vFieldNameList);

    vFieldTypeList := TStringList.Create;
    Split(vFieldType, splitColumn, vFieldTypeList);

    for vIndex := 0 to vFieldNameList.Count-1 do
    begin
      if vFieldTypeList[vIndex] = 'S' then
      begin
        vField := TStringField.Create(GridData);
        vField.Size := 1000;
      end
      else if vFieldTypeList[vIndex] = 'C' then
        vField := TCurrencyField.Create(GridData)
      else if vFieldTypeList[vIndex] = 'D' then
        vField := TDateTimeField.Create(GridData)
      else if vFieldTypeList[vIndex] = 'I' then
        vField := TIntegerField.Create(GridData)
      else if vFieldTypeList[vIndex] = 'G' then
        vField := TGraphicField.Create(GridData)
      else if vFieldTypeList[vIndex] = 'B' then
        vField := TBlobField.Create(GridData);

      vField.FieldName := vFieldNameList[vIndex];
      vField.DataSet   := GridData;
    end;

    if vData <> '' then
    begin
      vRow := TStringList.Create;
      vCol := TStringList.Create;
      GridData.Open;
      Split(vData, splitRecord, vRow);
      for vI := 0 to vRow.Count-1 do
      begin
        Split(vRow[vI], splitColumn, vCol);

        GridData.Append;
        for vJ := 0 to vCol.Count-1 do
        begin
          case GridData.Fields[vJ].DataType of
            DB.ftSmallint,
            DB.ftInteger,
            DB.ftWord,
            DB.ftShortint   :
            begin
              if (vCol[vJ] = 'null') or (vCol[vJ] = '') then
                GridData.Fields[vJ].AsInteger  := 0
              else
                GridData.Fields[vJ].AsInteger  := StrToIntDef(vCol[vJ],0);
            end;
            DB.ftFloat,
            DB.ftCurrency,
            DB.ftExtended   :
            begin
              if (vCol[vJ] = 'null') or (vCol[vJ] = '') then
                GridData.Fields[vJ].AsCurrency  := 0
              else
                GridData.Fields[vJ].AsCurrency  := StrToCurr(vCol[vJ]);
            end;
            DB.ftDate,
            DB.ftTime,
            DB.ftDateTime    :
            begin
              if vCol[vJ] = 'null' then
                GridData.Fields[vJ].AsString   := ''
              else
                GridData.Fields[vJ].AsDateTime := StrToDateTime(vCol[vJ]);
            end;
            DB.ftBlob        : GridData.Fields[vJ].AsBytes    := DecodeBase64(vCol[vJ]);
              else
              begin
                if vCol[vJ] = 'null' then
                  GridData.Fields[vJ].AsString   := ''
                else
                  GridData.Fields[vJ].AsString   := vCol[vJ];
              end;
          end;
        end;
      end;
      GridData.Post;
      GridData.First;
    end;
  finally
    vRESTClient.DisConnect;
    FreeAndNil(vRESTResponse);
    FreeAndNil(vRESTRequest);
    FreeAndNil(vRESTClient);
    if Assigned(vFieldNameList) then
      vFieldNameList.Free;
    if Assigned(vFieldTypeList) then
      vFieldTypeList.Free;
    if Assigned(vRow) then
      vRow.Free;
    if Assigned(vCol) then
      vCol.Free;
  end;
end;

function TDM.ReadQuery(aQuery: TdxMemData; aGridTableView: TcxGridTableView; aMemData: TdxMemData): Boolean;
var
  vIndex, vColumnIndex, vRow: Integer;
  vField: TField;
begin
  Result := false;
  Screen.Cursor := crSQLWait;

  // 쿼리가 열려있을 때만 작업을 한다
  if aQuery.Active then
  begin
    aQuery.First;

    // 메모리 데이터 초기화
    if aMemData <> nil then
    begin
      if aMemData.Active then
        aMemData.Close;

      aMemData.Fields.Clear;
      for vIndex := 0 to aQuery.FieldCount-1 do
      begin
        case aQuery.Fields[vIndex].DataType of
          DB.ftSmallint,
          DB.ftInteger,
          DB.ftWord,
          DB.ftShortint :
            vField := TIntegerField.Create(aMemData);
          DB.ftFloat,
          DB.ftCurrency,
          DB.ftExtended :
            vField := TCurrencyField.Create(aMemData);
          DB.ftDate,
          DB.ftTime,
          DB.ftDateTime :
            vField := TDateTimeField.Create(aMemData);
          DB.ftGraphic :
            vField := TGraphicField.Create(aMemData);
          DB.ftBlob :
            vField := TBlobField.Create(aMemData);
          else
          begin
            vField := TStringField.Create(aMemData);
            vField.Size := aQuery.Fields[vIndex].Size;
          end;
        end;
        vField.FieldName := aQuery.Fields[vIndex].FieldName;
        vField.DataSet   := aMemData;
      end;
      aMemData.Open;
    end
    // 그리드 초기화
    else if aGridTableView <> nil then
      aGridTableView.DataController.RecordCount := 0;
    if aGridTableView <> nil then
      aGridTableView.BeginUpdate;

    vRow := 1;
    try
      try
        // 쿼리 값을 읽어 그리드에 보여준다
        while not aQuery.Eof do
        begin
          // 한 레코드 추가
          if aMemData <> nil then
            aMemData.Append
          else
            aGridTableView.DataController.AppendRecord;

          // 필드에 값 업데이트
          for vIndex := 0 to aQuery.FieldCount-1 do
            if aMemData <> nil then
            begin
              for vColumnIndex := 0 to aMemData.FieldCount-1 do
                if aMemData.Fields[vColumnIndex].FieldName = aQuery.Fields[vIndex].FieldName then
                begin
                  if UpperCase(aMemData.Fields[vIndex].FieldName) = 'ROWNUM' then
                    aMemData.Fields[vColumnIndex].Value := vRow
                  else
                    aMemData.Fields[vColumnIndex].Value := aQuery.Fields[vIndex].Value;
                  Break;
                end;
            end
            else
            begin
              for vColumnIndex := 0 to aGridTableView.ColumnCount-1 do
                if aGridTableView.Columns[vColumnIndex].DataBinding.FieldName = aQuery.Fields[vIndex].FieldName then
                begin
                  if UpperCase(aGridTableView.Columns[vColumnIndex].DataBinding.FieldName) = 'ROWNUM' then
                    aGridTableView.DataController.Values[aGridTableView.DataController.RecordCount-1, vColumnIndex] := vRow
                  else
                  begin
                    if aGridTableView.Columns[vColumnIndex].PropertiesClassName = 'TdxColorEditProperties' then
                      aGridTableView.DataController.Values[aGridTableView.DataController.RecordCount-1, vColumnIndex] := StringToColorDef(aQuery.Fields[vIndex].AsString,$009999FF)
                    else
                      aGridTableView.DataController.Values[aGridTableView.DataController.RecordCount-1, vColumnIndex] := aQuery.Fields[vIndex].Value;
                  end;
                  Break;
                end;
            end;

          // 포스트
          if aMemData <> nil then
            aMemData.Post;

          Inc(vRow);
          aQuery.Next;
        end;
      except
      end;

      if aMemData <> nil then
        Result := aMemData.RecordCount > 0
      else
        Result := aGridTableView.DataController.RecordCount > 0;

    finally
      if aQuery.Active then
        aQuery.Close;
      if aGridTableView <> nil then
        aGridTableView.EndUpdate;
    end;
  end
  else
  begin
    if aMemData <> nil then
      aMemData.Close
    else
      aGridTableView.DataController.RecordCount := 0;
  end;
  Screen.Cursor := crDefault;
end;


function TDM.ReadServerICon: Boolean;
var  vData,
    vResult :String;
    vI :Integer;
    vRow : TStringList;
    vField: TField;
    vRESTRequest :TRESTRequest;
    vRESTClient  :TRESTClient;
    vRESTResponse :TRESTResponse;
begin
  Result := false;
  try
    vRESTClient   := TRESTClient.Create(nil);
    vRESTClient.BaseURL := CopyPos(RestBaseURL,'|',0)+'Action_Icon';
    vRESTClient.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
    vRESTClient.AcceptCharset := 'UTF-8, *;q=0.8';
    vRESTClient.AcceptEncoding := 'UTF-8';
    vRESTRequest  := TRESTRequest.Create(nil);
    vRESTResponse := TRESTResponse.Create(nil);
    vRESTRequest.Response := vRESTResponse;
    vRESTRequest.Client   := vRESTClient;
    vRESTRequest.AcceptEncoding := 'UTF-8';
    vRESTRequest.Method         := rmPOST;
    try
      vRESTRequest.Execute;
    except
      on E: Exception do
      begin
        ErrBox(E.Message);
        Exit;
      end;
    end;

    vRESTResponse.GetSimpleValue('RESULT',vResult);
    if Copy(vResult,1,5) = 'ERROR' then
    begin
      MsgBox(CopyPos(vResult, splitColumn, 1));
      Exit;
    end;
    vRESTResponse.GetSimpleValue('DATA',vData);
    if vData = '' then Exit;

    //데이터셋에 필드구조를 만든다
    Query.Fields.Clear;

    vField := TIntegerField.Create(Query);
    vField.FieldName := 'SEQ';
    vField.DataSet := Query;

    vField := TBlobField.Create(Query);
    vField.FieldName := 'ICON';
    vField.DataSet := Query;

    vRow := TStringList.Create;
    Query.Open;
    Split(vData, splitRecord, vRow);
    for vI := 0 to vRow.Count-1 do
    begin
      Query.Append;
      Query.FieldByName('SEQ').AsInteger := vI;
      Query.FieldByName('ICON').AsBytes  := DecodeBase64(vRow[vI]);
    end;
    Query.Post;
    Query.First;
    Result := Query.RecordCount > 0;
  finally
    vRESTClient.DisConnect;
    FreeAndNil(vRESTResponse);
    FreeAndNil(vRESTRequest);
    FreeAndNil(vRESTClient);
    if Assigned(vRow) then
      vRow.Free;
  end;
end;

procedure TDM.SetGridData;
var vSQL, vGridName, vColName, vColValue :String;
    vCol :Integer;
    vTempJson :String;
begin
  if GridData.RecordCount = 0 then Exit;

  vColName := '';
  for vCol := 0 to GridData.Fields.Count-2 do
    vColName := vColName + Format('%s,',[GridData.Fields[vCol].FieldName]);
  vGridName := '';
  vColValue := '';
  GridData.First;
  while not GridData.Eof do
  begin
    if GridData.FieldByName('ROW_STATE').AsString = rsInsert then
    begin
      vGridName := vGridName + Format('''%s'',',[GridData.FieldByName('NM_GRID').AsString]);
      vSQL := '';
      for vCol := 0 to GridData.Fields.Count-2 do
      begin
        if GridData.Fields[vCol].DataType = DB.ftString then
          vSQL := vSQL + Format('''%s'',',[GridData.Fields[vCol].AsString])
        else if GridData.Fields[vCol].DataType = DB.ftInteger then
          vSQL := vSQL + Format('%d,',[GridData.Fields[vCol].AsInteger])
        else
          vSQL := vSQL + ''''',';
      end;
      vColValue := vColValue + Format('(%s),',[LeftStr(vSQL,Length(vSQL)-1)]);
    end;
    GridData.Next;
  end;

  if vGridName = '' then Exit;

  vTempJson := RestDBURL;
  if (UserLevel = 'E') or (UserLevel = 'P') then
    RestDBURL := RestBaseURL;

  try
    // 기존 그리드 설정내용 삭제
    ExecQuery('delete from MS_GRID '
             +'where  CD_HEAD  =:P0 '
             +'  and  CD_STORE =:P1 '
             +'  and  CD_SAWON =:P2 '
             +'  and  NM_GRID  in ('+LeftStr(vGridName, Length(vGridName)-1)+');',
              [HeadStoreCode,
               StoreCode,
               UserCode],false);

    ExecQuery('insert into MS_GRID('+LeftStr(vColName, Length(vColName)-1) +')'
             +' Values  '+ LeftStr(vColValue, Length(vColValue)-1)+';',
             [],true);
  finally
    RestDBURL := vTempJson;
  end;
end;

//==============================================================================
//  AES 암호화
//------------------------------------------------------------------------------
function TDM.GetEncrypt(aURL, aData: string): string;
  function Base64EncodeBytes(const aInput: TBytes): TBytes;
  var
    vLen, vLen2: integer;
  begin
    vLen := Length(aInput);
    SetLength(result, (vLen + 2 div 3) * 4);
    vLen2 := Base64Encode(@aInput[0], @Result[0], vLen);
    SetLength(result, vLen2);
  end;
var
  vCipher: TDCP_rijndael;
  src, dest, b64: TBytes;
  vIndex, vLen, vSize, vPad: integer;
const
  EncryptKey : Array[0..15] of Byte =  (  $F5, $92, $18, $BA, $E5, $CD, $2D, $7B,
        									   $21, $17, $A1, $68, $9B, $34, $9D, $09 );
	EncryptIV  : Array[0..15] of Byte = ($7B, $D4, $C9, $0E, $C0, $36, $60, $F4,
	        								   $6A, $13, $E8, $7A, $32, $99, $32, $FA );
begin
  if Pos('https', aURL)  > 0 then
  begin
    Result := aData;
    Exit;
  end;
  src := TEncoding.UTF8.GetBytes(aData);

  vCipher := TDCP_rijndael.Create(nil);
  try
    vCipher.CipherMode := cmCBC;
    vLen := Length(src);
    vSize := (vCipher.BlockSize div 8);
    vPad := vSize - (vLen mod vSize);
    Inc(vLen, vPad);
    SetLength(src, vLen);
    for vIndex := vPad downto 1 do
      src[vLen - vIndex] := vPad;

    SetLength(dest, vLen);
    vCipher.Init(encryptKey[0], 128, @encryptIV[0]);
    vCipher.Encrypt(src[0], dest[0], vLen);

    b64 := Base64EncodeBytes(dest);
    result := TEncoding.Default.GetString(b64);

  finally
    vCipher.Free;
  end;
end;
end.
