// 편집 상속폼 (F)

unit InheritEdit;



interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Inherit, UniProvider, SQLServerUniProvider, Uni, DB,
  Menus, MemDS, ExtCtrls, cxGraphics, AdvToolBar, cxStyles, AdvToolBarStylers,
  cxContainer, cxEdit, cxTextEdit, cxDropDownEdit, cxLabel, cxControls,
  cxMaskEdit, cxCalendar, AdvGlowButton, cxLookAndFeels, cxLookAndFeelPainters,
  DBAccess, cxClasses, Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore,
  dxSkinsDefaultPainters, dxmdaset, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, IPPeerClient, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Client, AdvOfficeTabSet, AdvOfficeTabSetStylers,
  AdvPanel, AdvOfficePager, AdvOfficePagerStylers;

type
  TInheritEditForm = class(TInheritForm)
    ButtonToolBarSearchButton: TAdvGlowButton;
    ButtonToolBarSaveButton: TAdvGlowButton;
    ButtonToolBarSeparator: TAdvToolBarSeparator;
    ButtonToolBarDeleteButton: TAdvGlowButton;
    ButtonToolBarSeparator1: TAdvToolBarSeparator;
    ApplySaveEdit: TcxTextEdit;
    StyleFocused: TcxStyle;
    StyleHighlight: TcxStyle;

    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButtonToolBarSearchButtonClick(Sender: TObject);
    procedure ButtonToolBarDeleteButtonClick(Sender: TObject);
    procedure ButtonToolBarSaveButtonClick(Sender: TObject);

  protected
    procedure SetChanged(aChanged: Boolean); override;
    function  DoSearch: Boolean; virtual;
    function  DoDelete: Boolean; virtual;
    function  DoSave  : Boolean; virtual;
  end;



implementation

uses
  Common;

{$R *.dfm}

//==============================================================================
// 폼
//------------------------------------------------------------------------------
// 폼에서 키보드를 누를 때
procedure TInheritEditForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  // 단축키 처리를 한다
  case Key of
    VK_F2 : ButtonToolBarSearchButton.Click;
    VK_F4 : ButtonToolBarDeleteButton.Click;
    VK_F5 : ButtonToolBarSaveButton.Click;
  end;
end;

//==============================================================================
// 버튼
//------------------------------------------------------------------------------
// 조회 버튼
procedure TInheritEditForm.ButtonToolBarSearchButtonClick(Sender: TObject);
begin
  if not ButtonToolBarSearchButton.Visible or not ButtonToolBarSearchButton.Enabled then
    Exit;

  inherited;

  isLoading := true;
  try
    if not IsDebuggerPresent then
      BlockInput(true);
    if DoSearch then
      ResetEditProperties
    else
      MsgBox('조회 내용이 없습니다.');
  finally
    BlockInput(false);
    isLoading := false;
    isChanged := false;
  end;
end;
//------------------------------------------------------------------------------
// 삭제 버튼
procedure TInheritEditForm.ButtonToolBarDeleteButtonClick(Sender: TObject);
begin
  if not ButtonToolBarDeleteButton.Visible or not ButtonToolBarDeleteButton.Enabled then
    Exit;

  inherited;

  if not AskBox('삭제하시겠습니까?') then
    Exit;

  try
    BlockInput(true);
    if DoDelete then
    begin
      ResetEditProperties;
      ShowMsg('삭제 했습니다.');
    end
    else
    begin
      ErrBox('삭제하지 못했습니다.');
    end;
  finally
    BlockInput(false);
  end;
end;
//------------------------------------------------------------------------------
// 저장 버튼
procedure TInheritEditForm.ButtonToolBarSaveButtonClick(Sender: TObject);
begin
  if not ButtonToolBarSaveButton.Visible or not ButtonToolBarSaveButton.Enabled then
    Exit;

  inherited;

  if not isChanged then
    ShowMsg('변경된 내용이 없습니다.')
  else
  begin
    ApplySaveEdit.SetFocus;
    try
      if not IsDebuggerPresent then
        BlockInput(true);
      if DoSave then
      begin
        ResetEditProperties;
        isChanged := false;
        ShowMsg('처리(저장) 했습니다.');
      end
      else
      begin
        ShowMsg('처리(저장)하지 못했습니다.', true);
      end;
    finally
      BlockInput(false);
    end;
  end;
end;

//==============================================================================
// 함수
//------------------------------------------------------------------------------
// 변경 여부 설정
procedure TInheritEditForm.SetChanged(aChanged: Boolean);
begin
  inherited;

  ButtonToolBarSaveButton.Enabled := ButtonToolBarSaveButton.Visible and aChanged;
end;
//------------------------------------------------------------------------------
// 조회
function TInheritEditForm.DoSearch: Boolean;
begin
  Result := true;
end;
//------------------------------------------------------------------------------
// 삭제
function TInheritEditForm.DoDelete: Boolean;
begin
  Result := true;
end;
//------------------------------------------------------------------------------
// 저장
function TInheritEditForm.DoSave: Boolean;
begin
  Result := true;
end;

end.
