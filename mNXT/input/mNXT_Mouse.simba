(*
  MOUSE_RIGHT = 0
  MOUSE_LEFT = 1
  MOUSE_MIDDLE = 2
*)

procedure TmNXTMouse.debug(fString :string; clear:boolean=false);
begin
  if(self.z_debug) then
  begin
    if clear then
      ClearDebug();
    fString:=formatDateTime('tt',time())+' | '+ 'mNXT_Mouse ' +' > ' +fString;
    WriteLn(fString);
  end;
end;

procedure TmNXTMouse.mouseTeleport(x,y: Int32);
begin
  self.debug('mouseTeleport '+toStr(x)+', '+toStr(y));
  MoveMouse(x, y);
end;

procedure TmNXTMouse.mouseClick(x, y, button: Int32);
begin
  self.debug('mouseClick '+toStr(x)+', '+toStr(y));
  ClickMouse(x, y, button);
end;

procedure TmNXTMouse.mouseDrag(startPoint, endPoint:TPoint; button: int32=1; waitTimeMs:int32=150);
begin
  self.debug('mouseDrag '+toStr(startPoint)+' to '+toStr(endPoint)+ ' with button '+toStr(button));
  HoldMouse(startPoint.x, startPoint.y, button);
  Wait(waitTimeMs);
  ReleaseMouse(endPoint.x, endPoint.y, button);
end;
