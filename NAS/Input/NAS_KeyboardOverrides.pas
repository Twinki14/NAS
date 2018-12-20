procedure KeyDown(key: Word); override;
begin
   User32.PostMessage(NAS.getGameClient(), WM_KEYDOWN, key, MAKELPARAM(0, 0));
end;

procedure KeyUp(key: Word); override;
begin
   User32.PostMessage(NAS.getGameClient(), WM_KEYUP, key, MAKELPARAM(1, 0));
end;

procedure PressKey(key: Word); override;
begin
  KeyDown(key);
  sleep(50);
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

    if((not (s[i] in ['0'..'9'])) and ((s[i]=Uppercase(s[i])) or special)) then
         User32.PostMessage(NAS.getGameClient(), WM_CHAR, WPARAM(s[i]), MAKELPARAM(1, 0))
      else
        begin
          PressKey(GetKeyCode(s[i]));
        end;

      sleep(keywait);
    end;
end;   

procedure SendKeys(text: string; keywait, keymodwait: integer); override;
begin SendKeysEx(text, keywait); end;

(*
  Notes:
    Because Simba grabs the keystate system-wide, and NAS doesn't emulate a keyboard,
    it's best to simply return false, and assume the key isn't down.
*)
function isKeyDown(key: word): boolean; override; begin result:=false end;

