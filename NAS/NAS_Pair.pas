procedure TNASPair.debug(fString :string; clear:boolean=false);
begin
  if(self.z_debug) then
  begin
    if clear then
      ClearDebug();
    fString:=formatDateTime('tt',time())+' | '+ 'NAS_Pair ' +' > ' +fString;
    WriteLn(fString);
  end;
end;

function TNASPair.isActive(): boolean;
var ecs: array of DWORD;
var handles: array of HANDLE;
begin
  SetLength(ecs, 3);
  SetLength(handles, 3);
  //[0] Simba TID [1] Simba Proc ID [2] NXT ProcID
  handles[0] := Kernel32.OpenThread(THREAD_QUERY_INFORMATION, false, self.Simba_TID);
  handles[1] := Kernel32.OpenProcess(PROCESS_QUERY_INFORMATION , false, self.Simba_PID);
  handles[2] := Kernel32.OpenProcess(PROCESS_QUERY_INFORMATION , false, self.NXT_PID);
  Kernel32.GetExitCodeThread(handles[0], ecs[0]);
  Kernel32.GetExitCodeProcess(handles[1], ecs[1]);
  Kernel32.GetExitCodeProcess(handles[2], ecs[2]);
  result:= (ecs[0]=259) and (ecs[1]=259) and (ecs[2]=259);
  NAS.CloseHandles(handles);
  self.debug('isActive > errorCodes > '+toStr(ecs)+ ' result >'+toStr(self)+' > '+toStr(result));
end;
