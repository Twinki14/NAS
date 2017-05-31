procedure KeyDown(key: Word); override;
begin
   User32.PostMessage(mNXT.getGame(), WM_KEYDOWN, key, MAKELPARAM(0, 1));
end;

procedure KeyUp(key: Word); override;
begin
   User32.PostMessage(mNXT.getGame(), WM_KEYUP, key, MAKELPARAM(1, 0));
end;

procedure PressKey(key: Word); override;
begin
  KeyDown(key);
  KeyUp(key);
end;

procedure SendKeysEx(s: string; keywait: integer);
Var
  i, z, ls, lsc: Integer;
  sC: String;
  special: boolean;
begin
   sc:='!@#$%^&*()-_=+[{]}\|;:",<.>/?~`';
   ls := length(s);
   lsc := length(sc);
   for i:=1 to ls do
   begin

    for z:=1 to lsc do
    begin
      if(s[i]=sc[z]) then
        special:=true;
    end;

    if( (s[i]=Uppercase(s[i])) or special) then
       mNXT.sendMessage(mNXT.getGame(), WM_CHAR, WPARAM(s[i]), MAKELPARAM(1, 0))
    else
      begin
        PressKey(GetKeyCode(s[i]));
      end;

    sleep(keywait);
    end;
end;

procedure SendKeys(const s: string; keywait, keymodwait: integer); override;
begin SendKeysEx(s, keywait); end;

(*
  Notes:
    Because Simba grabs the keystate system-wide, and mNXT doesn't emulate a keyboard,
    it's best to simply return false, and assume the key isn't down.
*)
function isKeyDown(key: word): boolean; override; begin result:=false end;

