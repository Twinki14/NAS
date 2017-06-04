procedure TNASINI.debug(fString :string; clear:boolean=false);
begin
  if(self.z_debug) then
  begin
    if clear then
      ClearDebug();
    fString:=formatDateTime('tt',time())+' | '+ 'NAS_INI ' +' > ' +fString;
    WriteLn(fString);
  end;
end;

function TNASINI.GetINIKeys(section: string; maxCount: int32=128): array of Int32;
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

function TNASINI.ReadINIKeyValues(section: string): array of String;
Var
  i: integer;
  iniKeys: array of Integer;
begin
  iniKeys:=self.GetINIKeys(section);
  SetLength(result, length(iniKeys));
  for i := low(iniKeys) to High(iniKeys) do
    result[i] := ReadINI(section, toStr(i), self.path + self.name);
end;

function TNASINI.GetLastINIKey(): Int32;
begin
  result:=high(self.ReadINIKeyValues(self.section))+1;
end;

function TNASINI.ParseINIValues(): array of TNASINIPair;
Var
  i: integer;
  strArray: Array of String;
begin
  strArray:=ReadINIKeyValues(self.section);
  SetLength(result, length(strArray));
  for i := low(strArray) to high(strArray) do
  begin
    result[i].NXT_PID := StrToInt(MultiBetween(strArray[i], 'NPID:', '~')[0]);
    result[i].Simba_PID := StrToInt(MultiBetween(strArray[i], 'SPID:', '~')[0]);
    result[i].Simba_TID := StrToInt(MultiBetween(strArray[i], 'STID:', '~')[0]);
    result[i].key := toStr(i);
  end;
  self.debug('ParseINIValues > '+toStr(result));
end;


procedure TNASINI.DeclareINI(iniName: String='NAS_Pairs.ini'; section: String='Paired_Clients'; path: String=IncludePath+'NAS\');
begin
  self.name := iniName;
  self.section := section;
  self.path := path;
  self.fullPath := path+iniName;
  self.debug('DeclareINI > name > '+toStr(self.name)+ ' > Section > '+toStr(self.section)+ ' > FullPath > '+toStr(self.fullPath));
end;

procedure TNASINI.WritePairToINI(pair: TNASPair);
Var lKey: int32;
begin
  lKey:=self.GetLastINIKey;
  self.debug('WritePairToINI > '+'WriteINI('+self.section+', '+toStr(lKey)+', '+'NPID:'+toStr(pair.NXT_PID)+'~'+'SPID:'+toStr(pair.Simba_PID)+'~STID:'+toStr(pair.Simba_TID)+'~)');
  WriteINI(self.section, toStr(lKey), 'NPID:'+toStr(pair.NXT_PID)+'~'+'SPID:'+toStr(pair.Simba_PID)+'~STID:'+toStr(pair.Simba_TID)+'~', self.fullPath);
end;

procedure TNASINI.CleanupINI();
Var
  i: int32;
  vA: Array of TNASINIPair;
  rs: boolean;
begin
  vA:=parseINIValues();
  for i := low(vA) to high(vA) do
  begin
    if(NAS.isTIDActive(vA[i].Simba_TID))=false then
      begin
        rs:=true;
      end;
    if(NAS.isPIDActive(vA[i].Simba_PID))=false then
      begin
        rs:=true;
      end;
    if (NAS.isPIDActive(vA[i].NXT_PID))=false then
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


function TNASINI.isPairedWithINI(pair: TNASPair): boolean;
Var
  i: int32;
  vA: Array of TNASINIPair;
  rs: boolean;
begin
  vA:=ParseINIValues();
  for i := low(vA) to high(vA) do
  begin
    result:= (pair.NXT_PID=vA[i].NXT_PID)=true and (pair.Simba_PID=vA[i].Simba_PID)=true and (pair.Simba_TID=vA[i].Simba_TID)=true;
    if(result) then
      break;
  end;
  self.debug('isPairedWithINI > '+toStr(pair)+' > '+toStr(result));
end;
