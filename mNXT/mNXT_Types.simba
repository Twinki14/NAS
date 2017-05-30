type TmNXTPair = record
  mainWindow, gameWindow: HWND;
  NXT_ProcID, Simba_ProcID, Simba_TID: DWORD;
  bounds: TBox;
  paired, z_debug: boolean;
end;

type TmNXTINI = record
   name: String;
   section: String;
   path: String;
   fullPath: String;
   z_debug: boolean;
end;

type TmNXTINIPair = record
  NXT_ProcID, Simba_ProcID, Simba_TID: DWORD;
  key: string;
end;

type TmNXTMouse = record
  z_debug: boolean;
end;

type TmNXTKeyboard = record
  z_debug: boolean;
end;

type TmNXT = record
   currentPair: TmNXTPair;
   ini: TmNXTINI;
   mouse: TmNXTMouse;
   keyboard: TmNXTKeyboard;
   z_debug: boolean;
end;

Var
  mNXT: TmNXT;


