unit ResizeControl;

interface

uses SysUtils, Classes, windows, Controls, Contnrs, Forms, ExtCtrls,
     Graphics;

type

  TResizeControl = class(TObject)
  private
    inReposition : boolean;
    FNodePositioning: Boolean;
    oldPos: TPoint;
    FNodes: TObjectList;
    FCurrentNodeControl: TWinControl;

    procedure NodeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure NodeMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure NodeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PositionNodes(AroundControl: TWinControl);

  public
    Parent : TWinControl;
    constructor Create(AOwner: TComponent); virtual;

    procedure ControlMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ControlMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ControlMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure CreateResizeNodes;
    procedure SetNodesVisible(Visible: Boolean);
  end;

implementation

constructor TResizeControl.Create(AOwner: TComponent);
begin
  inherited Create;

  Parent := TWinControl(AOwner);

  FNodes := TObjectList.Create(False);
  CreateResizeNodes;
end;

  procedure TResizeControl.ControlMouseDown(
  Sender: TObject;
  Button: TMouseButton;
  Shift: TShiftState;
  X, Y: Integer);
begin
  if (Sender is TWinControl) then
  begin
    inReposition:=True;
    SetCapture(TWinControl(Sender).Handle);
    GetCursorPos(oldPos);
    PositionNodes(TWinControl(Sender));
  end;
end; (*ControlMouseDown*)

procedure TResizeControl.ControlMouseMove(
  Sender: TObject;
  Shift: TShiftState;
  X, Y: Integer);
const
  minWidth = 20;
  minHeight = 20;
var
  newPos: TPoint;
begin
  if inReposition then
  begin
    with TWinControl(Sender) do
    begin
      GetCursorPos(newPos);
      Screen.Cursor := crSize;
      Left := Left - oldPos.X + newPos.X;
      Top := Top - oldPos.Y + newPos.Y;
      oldPos := newPos;
    end;
    PositionNodes(TWinControl(Sender));
  end;
end; (*ControlMouseMove*)

procedure TResizeControl.ControlMouseUp(
  Sender: TObject;
  Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if inReposition then
  begin
    Screen.Cursor := crDefault;
    ReleaseCapture;
    inReposition := False;
  end;
end; (*ControlMouseUp*)

procedure TResizeControl.NodeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Sender is TWinControl) then
  begin
    FNodePositioning:=True;
    SetCapture(TWinControl(Sender).Handle);
    GetCursorPos(oldPos);
  end;
end; (*NodeMouseDown*)

procedure TResizeControl.NodeMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
const
  minWidth = 20;
  minHeight = 20;
var
  newPos: TPoint;
  frmPoint : TPoint;
  OldRect: TRect;
  AdjL,AdjR,AdjT,AdjB: Boolean;
begin
  if FNodePositioning then
  begin
    begin
      with TWinControl(Sender) do
      begin
      GetCursorPos(newPos);
      with FCurrentNodeControl do
      begin //resize
        frmPoint := FCurrentNodeControl.Parent.ScreenToClient(Mouse.CursorPos);
        OldRect := FCurrentNodeControl.BoundsRect;
        AdjL := False;
        AdjR := False;
        AdjT := False;
        AdjB := False;
        case FNodes.IndexOf(TWinControl(Sender)) of
          0: begin
               AdjL := True;
               AdjT := True;
             end;
          1: begin
               AdjT := True;
             end;
          2: begin
               AdjR := True;
               AdjT := True;
             end;
          3: begin
               AdjR := True;
             end;
          4: begin
               AdjR := True;
               AdjB := True;
             end;
          5: begin
               AdjB := True;
             end;
          6: begin
               AdjL := True;
               AdjB := True;
             end;
          7: begin
               AdjL := True;
             end;
        end;

        if AdjL then
          OldRect.Left := frmPoint.X;
        if AdjR then
          OldRect.Right := frmPoint.X;
        if AdjT then
          OldRect.Top := frmPoint.Y;
        if AdjB then
          OldRect.Bottom := frmPoint.Y;
        SetBounds(OldRect.Left,OldRect.Top,OldRect.Right - OldRect.Left,OldRect.Bottom - OldRect.Top);
      end;
      Left := Left - oldPos.X + newPos.X;
      Top := Top - oldPos.Y + newPos.Y;
      oldPos := newPos;
      end;
    end;
    PositionNodes(FCurrentNodeControl);
  end;
end; (*NodeMouseMove*)

procedure TResizeControl.NodeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if FNodePositioning then
  begin
    Screen.Cursor := crDefault;
    ReleaseCapture;
    FNodePositioning := False;
  end;
end; (*NodeMouseUp*)

procedure TResizeControl.CreateResizeNodes;
var
  Node: Integer;
  Panel: TPanel;
begin
  for Node := 0 to 7 do
  begin
    Panel := TPanel.Create(Parent);
    FNodes.Add(Panel);
    with Panel do
    begin
      BevelOuter := bvNone;
      Color := clBlack;
      Name := 'Node' + IntToStr(Node);
      Width := 8;
      Height := 8;

      Parent := Self.Parent;
      Visible := False;
      DoubleBuffered := false;
      case Node of
        0,4: Cursor := crSizeNWSE;
        1,5: Cursor := crSizeNS;
        2,6: Cursor := crSizeNESW;
        3,7: Cursor := crSizeWE;
      end;
      OnMouseDown := NodeMouseDown;
      OnMouseMove := NodeMouseMove;
      OnMouseUp := NodeMouseUp;
    end;
  end;
end; (*CreateNodes*)

procedure TResizeControl.PositionNodes(AroundControl: TWinControl);
var
  Node,T,L,CT,CL,FR,FB,FT,FL: Integer;
  TopLeft: TPoint;
begin
  FCurrentNodeControl := nil;
  for Node := 0 to 7 do
  begin
    with AroundControl do
    begin
      AroundControl.BringToFront;

      CL := (Width div 2) + Left -2;
      CT := (Height div 2) + Top -2;
      FR := Left + Width - 2;
      FB := Top + Height - 2;
      FT := Top - 2;
      FL := Left - 2;
      case Node of
        0: begin
             T := FT;
             L := FL;
           end;
        1: begin
             T := FT;
             L := CL;
           end;
        2: begin
             T := FT;
             L := FR;
           end;
        3: begin
             T := CT;
             L := FR;
           end;
        4: begin
             T := FB;
             L := FR;
           end;
        5: begin
             T := FB;
             L := CL;
           end;
        6: begin
             T := FB;
             L := FL;
           end;
        7: begin
             T := CT;
             L := FL;
           end;
        else
          T := 0;
          L := 0;
      end;
      TopLeft := Parent.ClientToScreen(Point(L,T));
    end;
    with TPanel(FNodes[Node]) do
    begin
      TopLeft := Parent.ScreenToClient(TopLeft);
      Top := TopLeft.Y;
      Left := TopLeft.X;
    end;
  end;
  FCurrentNodeControl := AroundControl;
  SetNodesVisible(True);
end; (*PositionNodes*)

procedure TResizeControl.SetNodesVisible(Visible: Boolean);
var
  Node: Integer;
begin
  for Node := 0 to 7 do
    TWinControl(FNodes.Items[Node]).Visible := Visible;
end; (*SetNodesVisible*)

end.
