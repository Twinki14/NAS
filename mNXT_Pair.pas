
procedure TmNXTPair.debug(fString :string; clear:boolean=false);
begin
  if(self.z_debug) then
  begin
    if clear then
      ClearDebug();
    fString:=formatDateTime('tt',time())+' | '+ 'mNXT_Pair ' +' > ' +fString;
    WriteLn(fString);
  end;
end;

function TmNXTPair.isActive(): boolean;
var ecs: array of DWORD;
begin
  SetLength(ecs, 3);
  //[0] Simba TID [1] Simba Proc ID [2] NXT ProcID
  Kernel32.GetExitCodeThread(Kernel32.OpenThread($0040, false, self.Simba_TID), ecs[0]);
  Kernel32.GetExitCodeProcess(Kernel32.OpenProcess($0400, false, self.Simba_ProcID), ecs[1]);
  Kernel32.GetExitCodeProcess(Kernel32.OpenProcess($0400, false, self.NXT_ProcID), ecs[2]);
  self.debug('isActive > errorCodes > '+toStr(ecs));
  result:= (ecs[0]=259) and (ecs[1]=259) and (ecs[2]=259);
  self.debug('isActive > '+toStr(self)+' > '+toStr(result));
end;
