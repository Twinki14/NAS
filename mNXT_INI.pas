procedure TmNXTINI.debug(fString :string; clear:boolean=false);
begin
  if(self.z_debug) then
  begin
    if clear then
      ClearDebug();
    fString:=formatDateTime('tt',time())+' | '+ 'mNXT_INI ' +' > ' +fString;
    WriteLn(fString);
  end;
end;

function TmNXTINI.GetINIKeys(section: string; maxCount: int32=128): array of Int32;
Var
  cnt: int32;
  str: String;
begin
  repeat
    str:= ReadINI(section, toStr(cnt), self.path + self.name);
    inc(cnt);
    if(toStr(str)='') then
      break
    else
    begin
      SetLength(result, cnt);
      result[cnt-1] := cnt;
    end;
  until cnt=maxCount;
end;

function TmNXTINI.ReadINIKeyValues(section: string): array of String;
Var
  i: integer;
  iniKeys: array of Integer;
begin
  iniKeys:=self.GetINIKeys(section);
  SetLength(result, length(iniKeys));
  for i := low(iniKeys) to High(iniKeys) do
    result[i] := ReadINI(section, toStr(i), self.path + self.name);
end;

function TmNXTINI.GetLastINIKey(): Int32;
begin
  result:=high(self.ReadINIKeyValues(self.section))+1;
end;

function TmNXTINI.parseINIValues(): array of TmNXTINIPair;
Var
  i: integer;
  strArray: Array of String;
begin
  strArray:=ReadINIKeyValues(self.section);
  SetLength(result, length(strArray));
  for i := low(strArray) to high(strArray) do
  begin
    result[i].NXT_ProcID := StrToInt(MultiBetween(strArray[i], 'NPID:', '~')[0]);
    result[i].Simba_ProcID := StrToInt(MultiBetween(strArray[i], 'SPID:', '~')[0]);
    result[i].Simba_TID := StrToInt(MultiBetween(strArray[i], 'STID:', '~')[0]);
    result[i].key := toStr(i);
  end;
  self.debug('parseINIValues > '+toStr(result));
end;


procedure TmNXTINI.DeclareINI(iniName: String='mNXT_Pairs.ini'; section: String='Paired_Clients'; path: String=ScriptPath);
begin
  self.name := iniName;
  self.section := section;
  self.path := path;
  self.fullPath := path+iniName;
  self.debug('DeclareINI > name > '+toStr(self.name)+ ' > Section > '+toStr(self.section)+ ' > FullPath > '+toStr(self.fullPath));
end;

procedure TmNXTINI.WritePairToINI(pair: TmNXTPair);
Var lKey: int32;
begin
  lKey:=self.GetLastINIKey;
  self.debug('WritePairToINI > '+'WriteINI('+self.section+', '+toStr(lKey)+', '+'NPID:'+toStr(pair.NXT_ProcID)+'~'+'SPID:'+toStr(pair.Simba_ProcID)+'~STID:'+toStr(pair.Simba_TID)+'~)');
  WriteINI(self.section, toStr(lKey), 'NPID:'+toStr(pair.NXT_ProcID)+'~'+'SPID:'+toStr(pair.Simba_ProcID)+'~STID:'+toStr(pair.Simba_TID)+'~', self.fullPath);
end;

function TmNXTINI.isTIDActive(TID: DWORD): boolean;
Var
  eC: DWORD;
begin
  Kernel32.GetExitCodeThread(Kernel32.OpenThread($0040, false, TID), eC);
  result:=eC=259;
  self.debug('isTIDActive('+toStr(TID)+') > '+toStr(result)+' > code: '+toStr(eC));
end;

function TmNXTINI.isPIDActive(PID: DWORD): boolean;
Var
  eC: DWORD;
begin
 Kernel32.GetExitCodeProcess(Kernel32.OpenProcess($0400, false, PID), eC);
 result:=eC=259;
 self.debug('isPIDActive('+toStr(PID)+') > '+toStr(result)+' > code: '+toStr(eC));
end;


procedure TmNXTINI.CleanupINI();
Var
  i: int32;
  vA: Array of TmNXTINIPair;
  rs: boolean;
begin
  vA:=parseINIValues();
  for i := low(vA) to high(vA) do
  begin
    if(self.isTIDActive(vA[i].Simba_TID))=false then
      begin
        rs:=true;
      end;
    if(self.isPIDActive(vA[i].Simba_ProcID))=false then
      begin
        rs:=true;
      end;
    if (self.isPIDActive(vA[i].NXT_ProcID))=false then
      begin
        rs:=true;
      end;
    if(rs) then
      begin
        self.debug('CleanupINI > '+toStr(rs)+' > DeleteINI > Key: '+toStr(vA[i].key));
        DeleteINI(self.section, vA[i].key, self.fullPath);
        exit();
      end;
  end;
  self.debug('CleanupINI > '+toStr(rs));
end;


function TmNXTINI.isPairedWithINI(pair: TmNXTPair): boolean;
Var
  i: int32;
  vA: Array of TmNXTINIPair;
  rs: boolean;
begin
  vA:=parseINIValues();
  for i := low(vA) to high(vA) do
  begin
    result:= (pair.NXT_ProcID=vA[i].NXT_ProcID)=true and (pair.Simba_ProcID=vA[i].Simba_ProcID)=true and (pair.Simba_TID=vA[i].Simba_TID)=true;
    if(result) then
      break;
  end;
  self.debug('isPairedWithINI > '+toStr(pair)+' > '+toStr(result));
end;

