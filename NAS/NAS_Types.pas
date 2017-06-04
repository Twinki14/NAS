type TNASPair = record
  mainWindow, gameWindow: HWND;
  NXT_PID, Simba_PID, Simba_TID: DWORD;
  bounds: TBox;
  paired, z_debug: boolean;
end;

type TNASINI = record
   name: String;
   section: String;
   path: String;
   fullPath: String;
   z_debug: boolean;
end;

type TNASINIPair = record
  NXT_PID, Simba_PID, Simba_TID: DWORD;
  key: string;
end;

type TNASMouse = record
  z_debug: boolean;
end;

type TNASKeyboard = record
  z_debug: boolean;
end;

type TNAS = record
  CurrentPair: TNASPair;
  _INI: TNASINI;
  Mouse: TNASMouse;
  Keyboard: TNASKeyboard;
  {$IFDEF NAS_DRAWING}
    Layer: TSimbaLayer;
    Drawing: TMufasaBitmap;
  {$ENDIF}
  z_debug: boolean;
end;

Var
  NAS: TNAS;


