unit CodeClassHelp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, cxGraphics, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxControls, cxContainer, cxTreeView, AdvCombo, ColCombo,
  AdvOfficeButtons, cxListBox, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxLookAndFeels, cxLookAndFeelPainters;

type
  TCodeClassHelpForm = class(TForm)
    OKButton: TButton;
    CloseButton: TButton;
    ClassTreeView: TcxTreeView;
    procedure OKButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ClassTreeViewExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure ClassTreeViewDblClick(Sender: TObject);
    procedure ClassTreeViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    ClassCode : String;
    { Public declarations }
  end;

var
  CodeClassHelpForm: TCodeClassHelpForm;

implementation

uses
  Common, DBModule;

{$R *.dfm}

procedure TCodeClassHelpForm.ClassTreeViewExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
var
  vClassData, vClassCode: PStrPointer;
  vTreeNode: TTreeNode;
begin
  inherited;
  // 현재 노드의 자식이 있다고 하면서 실제로는 자식이 없는 경우에는 새로 쿼리를 해 본다(최초 확장 시)
  if Node.HasChildren and (Node.Count = 0) then
  begin
    vClassData := Node.Data;
    DM.OpenQuery('select NM_CLASS, '
                +'       CD_CLASS '
                +'  from MS_MENU_CLASS '
                +' where CD_HEAD  =:P0 '
                +'   and CD_STORE =:P1 '
                +'   and CD_CLASS like ConCat(:P2,''%'') '
                +'   and Length(CD_CLASS) = :P3',
                 [HeadStoreCode,
                  StoreCode,
                  vClassData^.Data,
                  Length(vClassData^.Data)+2]);
    try
      while not DM.Query.Eof do
      begin
        New(vClassCode);
        vClassCode^.Data := DM.Query.Fields[1].AsString;
        vTreeNode        := (Sender as TcxCustomInnerTreeView).Items.AddChildObject(Node, DM.Query.Fields[0].AsString, vClassCode);
        // 환경설정에서 관리하겠다고 한 최대 자릿수보다 작으면 자식노드가 있다고 간주한다
        if Length(vClassCode^.Data) < (StoI(GetOption(248))+1)*2 then
          vTreeNode.HasChildren := true;
        DM.Query.Next;
      end;
      Node.HasChildren := Node.Count > 0;
      AllowExpansion   := Node.HasChildren;
    finally
      DM.FinishQuery;
    end;
  end;
end;

procedure TCodeClassHelpForm.ClassTreeViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_Escape : CloseButton.Click;
  end;
end;

procedure TCodeClassHelpForm.CloseButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TCodeClassHelpForm.FormCreate(Sender: TObject);
var
  vCode: PStrPointer;
  vTreeNode : TTreeNode;
begin
  inherited;
  DM.OpenQuery('select NM_CLASS, '
              +'       CD_CLASS '
              +'  from MS_MENU_CLASS '
              +' where CD_HEAD       =:P0 '
              +'   and CD_STORE      =:P1 '
              +'   and Length(CD_CLASS) = 2',
               [HeadStoreCode,
                StoreCode]);
  try
    while not DM.Query.Eof do
    begin
      New(vCode);
      vCode^.Data := DM.Query.Fields[1].AsString;
      vTreeNode        := ClassTreeView.Items.AddObject(nil, DM.Query.Fields[0].AsString, vCode);
      if GetOption(248) <> '0' then
        vTreeNode.HasChildren := true;
      DM.Query.Next;
    end;
  finally
    DM.FinishQuery;
  end;
end;

procedure TCodeClassHelpForm.ClassTreeViewDblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TCodeClassHelpForm.OKButtonClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
