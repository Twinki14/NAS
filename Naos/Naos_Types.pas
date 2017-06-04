type TNaosPair = record
  mainWindow, gameWindow: HWND;
  NXT_PID, Simba_PID, Simba_TID: DWORD;
  bounds: TBox;
  paired, z_debug: boolean;
end;

type TNaosINI = record
   name: String;
   section: String;
   path: String;
   fullPath: String;
   z_debug: boolean;
end;

type TNaosINIPair = record
  NXT_PID, Simba_PID, Simba_TID: DWORD;
  key: string;
end;

type TNaosMouse = record
  z_debug: boolean;
end;

type TNaosKeyboard = record
  z_debug: boolean;
end;

type TNaos = record
  CurrentPair: TNaosPair;
  _INI: TNaosINI;
  Mouse: TNaosMouse;
  Keyboard: TNaosKeyboard;
  {$IFDEF NAOS_DRAWING}
    Layer: TSimbaLayer;
    Drawing: TMufasaBitmap;
  {$ENDIF}
  z_debug: boolean;
end;

Var
  Naos: TNaos;


