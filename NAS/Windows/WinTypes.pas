{$IFDEF CPU386}
const WINAPI_CC = ' stdcall';
{$ELSE}
const WINAPI_CC = ' win64';
{$ENDIF} 

type
  WinDLL       = type Pointer; 
  LibUser32    = WinDLL; //meh... so it's all accessible through "Windows"
  LibGdi32     = WinDLL; //
  LibKernel32  = WinDLL; //
  LibMsimg32   = WinDLL; //
  LibAdvapi32  = WinDLL; //
  LibAvrt      = WinDLL; //
  LibKernelbase= WinDLL; //

var
  Windows:    WinDLL;
  User32:     LibUser32;
  Gdi32:      LibGdi32;
  Kernel32:   LibKernel32;
  Msimg32:    LibMsimg32;
  Advapi32:   LibAdvapi32;
  Avrt:       LibAvrt;
  KernelBase: LibKernelbase;
  
const
  ffi_winapi = {$IFDEF CPU386}ffi_stdcall{$ELSE}ffi_win64{$ENDIF};


const
  MAX_PATH = 260;
  MAX_MODULE_NAME32 = 255;


type
  {$IFNDECL PWideChar}PWideChar = ^WideChar;{$ENDIF}
  {$IFNDECL PUInt32}  PUInt32   = ^UInt32;  {$ENDIF}
  {$IFNDECL PUInt16}  PUInt16   = ^UInt16;  {$ENDIF}
  {$IFNDECL PUInt8}   PUInt8    = ^UInt8;   {$ENDIF}
  
  WINBOOL = LongBool;
  BOOL    = WINBOOL;
  PBOOL   = ^BOOL;
  
  COLORREF  = Int32;
  PCOLORREF = ^COLORREF;
  
  WINLONG  = Int32;
  WININT   = Int32;
  WINSHORT = Int16;
  
  SIZE_T   = SizeInt;

  HANDLE   = PtrUInt;
//HRESULT  = Pointer;
  PHRESULT = ^HRESULT;

  HACCEL   = HANDLE;
//HBITMAP  = HANDLE;
  HBRUSH   = HANDLE;
  HCOLORSPACE = HANDLE;
  HCONV    = HANDLE;
  HCONVLIST= HANDLE;
  HCURSOR  = HANDLE;
  HDBC     = HANDLE;
  HDC      = HANDLE;
  HDDEDATA = HANDLE;
  HDESK    = HANDLE;
  HDROP    = HANDLE;
  HDWP     = HANDLE;
  HENHMETAFILE = HANDLE;
  HENV     = HANDLE;
  HFILE    = HANDLE;
  HFONT    = HANDLE;
  HGDIOBJ  = HANDLE;
  HGLOBAL  = HANDLE;
  HGLRC    = HANDLE;
  HHOOK    = HANDLE;
  HICON    = HANDLE;
  HIMAGELIST = HANDLE;
  HINST    = HANDLE;
  HKEY     = HANDLE;
  HKL      = HANDLE;
  HLOCAL   = HANDLE;
  HMENU    = HANDLE;
  HMETAFILE= HANDLE;
  HMODULE  = HANDLE;
  HMONITOR = HANDLE;
//HPALETTE = HANDLE;
  HPEN     = HANDLE;
  HRASCONN = HANDLE;
  HRGN     = HANDLE;
  HRSRC    = HANDLE;
  HSTMT    = HANDLE;
  HSTR     = HANDLE;
  HSZ      = HANDLE;
  HWINSTA  = HANDLE;
  HWND     = HANDLE;
  HTASK    = HANDLE;

  LANGID = UInt16;
  LCID   = UInt32;
  LCTYPE = UInt32;
  LPARAM = Pointer;
  WPARAM = PtrUInt;
  
  LPCOLORREF = ^COLORREF;
  LPCSTR  = ^Char;
  LPCTSTR = ^Char;
  
  LPCWCH  = ^WideChar;
  LPCWSTR = ^WideChar;
  
  LPPCSTR  = ^LPCSTR;
  LPPCTSTR = ^LPCTSTR;
  LPPCWSTR = ^LPCWSTR;

  LPDWORD  = ^UInt32;
  LPHANDLE = ^HANDLE;

  LPINT  = ^LongInt;
  LPLONG = ^LongInt;

  LPSTR  = ^Char;
  LPTCH  = ^Char;
  LPTSTR = ^Char;

  LRESULT = PtrUInt;
  PLRESULT= ^LRESULT;

  LPWCH  = ^WideChar;
  LPWORD = ^UInt16;
  LPWSTR = ^WideChar;
  NWPSTR = ^WideChar;
   
  LPVoid = Pointer; 
  
  TBlendFunction = Pointer;  
  
  _EnumWindowsProc = function(wnd:HWND; Param: LPARAM): BOOL;
  TEnumWindowsProc = native(_EnumWindowsProc, ffi_winapi);

  PRect = ^TRect;
  
  PSizeStruct = ^TSizeStruct;
  TSizeStruct = record W,H:Int32; end;
  
  PBITMAPINFOHEADER = ^BITMAPINFOHEADER;
  BITMAPINFOHEADER = record
    biSize: DWord;
    biWidth: LongInt;
    biHeight: LongInt;
    biPlanes: Word;
    biBitCount: Word;
    biCompression: DWord;
    biSizeImage: DWord;
    biXPelsPerMeter: LongInt;
    biYPelsPerMeter: LongInt;
    biClrUsed: DWord;
    biClrImportant: DWord;
  end;
  
  PBITMAPINFO = ^BITMAPINFO;
  BITMAPINFO = record
    bmiHeader: BITMAPINFOHEADER;
    bmiColors: array[0..0] of TRGB32;
  end;
  
  PBITMAP = ^BITMAP;
  BITMAP = record
    bmType: LongInt;
    bmWidth: LongInt;
    bmHeight: LongInt;
    bmWidthBytes: LongInt;
    bmPlanes: Word;
    bmBitsPixel: Word;
    bmBits: Pointer;
  end;
  
  PWINDOWINFO = ^WINDOWINFO;
  WINDOWINFO = record
    cbSize: UInt32;
    rcWindow: TRect;
    rcClient: TRect;
    dwStyle: UInt32;
    dwExStyle: UInt32;
    dwWindowStatus: UInt32;
    cxWindowBorders: UInt32;
    cyWindowBorders: UInt32;
    atomWindowType: UInt16;
    wCreatorVersion: UInt16;
  end;
  
  PCURSORINFO = ^CURSORINFO;
  CURSORINFO = record
    cbSize: UInt32;
    flags: UInt32;
    cursor: HCURSOR;
    ptScreenPos: TPoint;
  end;
  
  WINDOWPLACEMENT = record
    length:  UInt32;
    flags:   UInt32;
    showCmd: UInt32;
    ptMinPosition: TPoint;
    ptMaxPosition: TPoint;
    rcNormalPosition: TRect;
  end;
  
  // this is actually supposed to be a union, but.. eat shit!
  PSYSTEM_INFO = ^SYSTEM_INFO;
  SYSTEM_INFO = record
    dwOemId: DWord;
    dwPageSize: DWord;
    lpMinimumApplicationAddress: Pointer;
    lpMaximumApplicationAddress: Pointer;
    dwActiveProcessorMask: PtrUInt;
    dwNumberOfProcessors: DWord;
    dwProcessorType: DWord;
    dwAllocationGranularity: DWord;
    wProcessorLevel: Word;
    wProcessorRevision: Word;	
  end;
  
  GROUP_AFFINITY = record
    Mask: PtrUInt;
    Group: Word;
    Reserved0,Reserved1,Reserved2: Word;
  end;
  
  STARTUPINFO = record
    cb: DWord;
    lpReserved: LPWSTR;
    lpDesktop: LPWSTR;
    lpTitle: LPWSTR;
    dwX: DWord;
    dwY: DWord;
    dwXSize: DWord;
    dwYSize: DWord;
    dwXCountChars: DWord;
    dwYCountChars: DWord;
    dwFillAttribute: DWord;
    dwFlags: DWord;
    wShowWindow: Word;
    cbReserved2: Word;
    lpReserved2: ^Byte;
    hStdInput: HANDLE;
    hStdOutput: HANDLE;
    hStdError: HANDLE;
  end;
  
  SECURITY_ATTRIBUTES = record
    nLength: DWORD;
    lpSecurityDescriptor: LPVOID;
    bInheritHandle: WINBOOL;
  end;
  
  PMEMORY_BASIC_INFORMATION = ^MEMORY_BASIC_INFORMATION;
  MEMORY_BASIC_INFORMATION = record
    BaseAddress: Pointer;
    AllocationBase: Pointer;
    AllocationProtect: DWORD;
    RegionSize: SizeInt;
    State, Protect, Typ: DWORD;
  end;

  PPROCESSENTRY32 = ^PROCESSENTRY32;
  PROCESSENTRY32 = record
    dwSize: DWORD;
    cntUsage: DWORD;
    th32ProcessID: DWORD;
    th32DefaultHeapID: PtrUInt;
    th32ModuleID: DWORD;
    cntThreads: DWORD;
    th32ParentProcessID: DWORD;
    pcPriClassBase: LongInt;
    dwFlags: DWORD;
    szExeFile: array[0..MAX_PATH] of Char;
  end;

  PMODULEENTRY32 = ^MODULEENTRY32;
  MODULEENTRY32 = record
    dwSize: DWORD;
    th32ModuleID: DWORD;
    th32ProcessID: DWORD;
    GlblcntUsage: DWORD;
    ProccntUsage: DWORD;
    modBaseAddr: ^BYTE;
    modBaseSize: DWORD;
    hModule: HMODULE;
    szModule:  array[0..MAX_MODULE_NAME32 + 1] of Char;
    szExePath: array[0..MAX_PATH] of Char;
  end;

  PIXELFORMATDESCRIPTOR = record
    nSize: WORD;
    nVersion: WORD;
    dwFlags: DWORD ;
    iPixelType: BYTE;
    cColorBits: BYTE;
    cRedBits: BYTE;
    cRedShift: BYTE;
    cGreenBits: BYTE;
    cGreenShift: BYTE;
    cBlueBits: BYTE;
    cBlueShift: BYTE;
    cAlphaBits: BYTE;
    cAlphaShift: BYTE;
    cAccumBits: BYTE;
    cAccumRedBits: BYTE;
    cAccumGreenBits: BYTE;
    cAccumBlueBits: BYTE;
    cAccumAlphaBits: BYTE;
    cDepthBits: BYTE;
    cStencilBits: BYTE;
    cAuxBuffers: BYTE;
    iLayerType: BYTE;
    bReserved: BYTE;
    dwLayerMask: DWORD;
    dwVisibleMask: DWORD;
    dwDamageMask: DWORD;
  end;
  
  THREAD_START_ROUTINE = procedure(lpParam: Pointer);
  LPTHREAD_START_ROUTINE = native(THREAD_START_ROUTINE, ffi_winapi);
  
  TWinVersion = packed record
    Major, Minor: UInt8; 
    Build: UInt16;
  end;
  
  //---| SendInput |----------
  TMouseInput = record
    Itype: DWord;
    dx: Int32;
    dy: Int32;
    mouseData: DWord;
    dwFlags: DWord;
    time: DWord;
    dwExtraInfo: PtrUInt;
  end;
  
  TKeybdInput = record
    Itype: DWord;
    wVk: Word;
    wScan: Word;
    dwFlags: DWord;
    time: DWord;
    dwExtraInfo: PtrUInt;
  end;
  
  THardwareInput = record
    Itype: DWord;
    uMsg: DWord;
    wParamL: Word;
    wParamH: Word;
  end;
  
  
  //
  PTrackMouseEvent = ^TTrackMouseEvent;
  TTrackMouseEvent = record
    cbSize: UInt32;
    dwFlags: UInt32;
    hwndTrack: HWND;
    dwHoverTime: UInt32;
  end;
  
  PMouseMovePoint = ^TMouseMovePoint;
  TMouseMovePoint = record
    x: Int32;
    y: Int32;
    time: UInt32;
    dwExtraInfo: PtrUInt;
  end; 

// -------------------------------------------------
// Windows macros
function MAKEWORD(bLow, bHigh: Byte): DWORD;
begin
  Result := (bHigh shl 16) or bLow;
end;

function MAKELONG(wLow, wHigh: WORD): DWORD;
begin
  Result := (wHigh shl 16) or wLow;
end;

function MAKELPARAM(wLow, wHigh: WORD): LPARAM;
begin
  PtrUInt(Result) := MAKELONG(wLow, wHigh);
end;

function MAKEWPARAM(wLow, wHigh: WORD): WPARAM;
begin
  Result := (wHigh shl 16) or wLow;
end; 


// -------------------------------------------------
// Windows constants
const
  WINFINITE = $FFFFFFFF; //INFINITE
  CREATE_SUSPENDED = 4;
  STACK_SIZE_PARAM_IS_A_RESERVATION = $10000;
  
{SystemMetrics}
  SM_ARRANGE         = 56;
  SM_CLEANBOOT       = 67;
  SM_CMONITORS       = 80;
  SM_CMOUSEBUTTONS   = 43;
  SM_CONVERTIBLESLATEMODE = $2003;
  SM_CXBORDER        = 5;
  SM_CXCURSOR        = 13;
  SM_CXDLGFRAME      = 7;
  SM_CXDOUBLECLK     = 36;
  SM_CXDRAG          = 68;
  SM_CXEDGE          = 45;
  SM_CXFIXEDFRAME    = 7;
  SM_CXFOCUSBORDER   = 83;
  SM_CXFRAME         = 32;
  SM_CXFULLSCREEN    = 16;
  SM_CXHSCROLL       = 21;
  SM_CXHTHUMB        = 10;
  SM_CXICON          = 11;
  SM_CXICONSPACING   = 38;
  SM_CXMAXIMIZED     = 61;
  SM_CXMAXTRACK      = 59;
  SM_CXMENUCHECK     = 71;
  SM_CXMENUSIZE      = 54;
  SM_CXMIN           = 28;
  SM_CXMINIMIZED     = 57;
  SM_CXMINSPACING    = 47;
  SM_CXMINTRACK      = 34;
  SM_CXPADDEDBORDER  = 92;
  SM_CXSCREEN        = 0;
  SM_CXSIZE          = 30;
  SM_CXSIZEFRAME     = 32;
  SM_CXSMICON        = 49;
  SM_CXSMSIZE        = 52;
  SM_CXVIRTUALSCREEN = 78;
  SM_CXVSCROLL       = 2;
  SM_CYBORDER        = 6;
  SM_CYCAPTION       = 4;
  SM_CYCURSOR        = 14;
  SM_CYDLGFRAME      = 8;
  SM_CYDOUBLECLK     = 37;
  SM_CYDRAG          = 69;
  SM_CYEDGE          = 46;
  SM_CYFIXEDFRAME    = 8;
  SM_CYFOCUSBORDER   = 84;
  SM_CYFRAME         = 33;
  SM_CYFULLSCREEN    = 17;
  SM_CYHSCROLL       = 3;
  SM_CYICON          = 12;
  SM_CYICONSPACING   = 39;
  SM_CYKANJIWINDOW   = 18;
  SM_CYMAXIMIZED     = 62;
  SM_CYMAXTRACK      = 60;
  SM_CYMENU          = 15;
  SM_CYMENUCHECK     = 72;
  SM_CYMENUSIZE      = 55;
  SM_CYMIN           = 29;
  SM_CYMINIMIZED     = 58;
  SM_CYMINSPACING    = 48;
  SM_CYMINTRACK      = 35;
  SM_CYSCREEN        = 1;
  SM_CYSIZE          = 31;
  SM_CYSIZEFRAME     = 33;
  SM_CYSMCAPTION     = 51;
  SM_CYSMICON        = 50;
  SM_CYSMSIZE        = 53;
  SM_CYVIRTUALSCREEN = 79;
  SM_CYVSCROLL       = 20;
  SM_CYVTHUMB        = 9;
  SM_DBCSENABLED     = 42;
  SM_DEBUG           = 22;
  SM_DIGITIZER       = 94;
  SM_IMMENABLED      = 82;
  SM_MAXIMUMTOUCHES  = 95;
  SM_MEDIACENTER     = 87;
  SM_MENUDROPALIGNMENT = 40;
  SM_MIDEASTENABLED    = 74;
  SM_MOUSEPRESENT      = 19;
  SM_MOUSEHORIZONTALWHEELPRESENT = 91;
  SM_MOUSEWHEELPRESENT = 75;
  SM_NETWORK           = 63;
  SM_PENWINDOWS        = 41;
  SM_REMOTECONTROL     = $2001;
  SM_REMOTESESSION     = $1000;
  SM_SAMEDISPLAYFORMAT = 81;
  SM_SECURE          = 44;
  SM_SERVERR2        = 89;
  SM_SHOWSOUNDS      = 70;
  SM_SHUTTINGDOWN    = $2000;
  SM_SLOWMACHINE     = 73;
  SM_STARTER         = 88;
  SM_SWAPBUTTON      = 23;
  SM_SYSTEMDOCKED    = $2004;
  SM_TABLETPC        = 86;
  SM_XVIRTUALSCREEN  = 76;
  SM_YVIRTUALSCREEN  = 77;
  
{GetWindow}
  GW_HWNDFIRST    = 0;
  GW_HWNDLAST     = 1;
  GW_HWNDNEXT     = 2;
  GW_HWNDPREV     = 3;
  GW_OWNER        = 4;
  GW_CHILD        = 5;
  GW_ENABLEDPOPUP = 6;

{GetWindowLong}
  GWL_WNDPROC     = -4;
  GWL_HINSTANCE   = -6;
  GWL_HWNDPARENT  = -8;
  GWL_ID          = -12;
  GWL_STYLE       = -16;
  GWL_EXSTYLE     = -20;
  GWL_USERDATA    = -21;
  
{WindowStyles}
  WS_OVERLAPPED   = 0;
  WS_POPUP        = $80000000;
  WS_CHILD        = $40000000;
  WS_MINIMIZE     = $20000000;
  WS_VISIBLE      = $10000000;
  WS_DISABLED     = $08000000;
  WS_CLIPSIBLINGS = $04000000;
  WS_CLIPCHILDREN = $02000000;
  WS_MAXIMIZE     = $01000000;
  WS_CAPTION      = $00C00000;
  WS_BORDER       = $00800000;
  WS_DLGFRAME     = $00400000;
  WS_VSCROLL      = $00200000;
  WS_HSCROLL      = $00100000;
  WS_SYSMENU      = $00080000;
  WS_THICKFRAME   = $00040000;
  WS_GROUP        = $00020000;
  WS_TABSTOP      = $00010000;
  WS_MINIMIZEBOX  = $00020000;
  WS_MAXIMIZEBOX  = $00010000;
  WS_TILED            = WS_OVERLAPPED;
  WS_ICONIC           = WS_MINIMIZE;
  WS_SIZEBOX          = WS_THICKFRAME;
  WS_OVERLAPPEDWINDOW = WS_OVERLAPPED or WS_CAPTION or WS_SYSMENU or WS_THICKFRAME or WS_MINIMIZEBOX or WS_MAXIMIZEBOX;
  WS_POPUPWINDOW      = WS_POPUP or WS_BORDER or WS_SYSMENU;
  WS_CHILDWINDOW      = WS_CHILD;
  WS_TILEDWINDOW      = WS_OVERLAPPEDWINDOW;
  
{Window Style Extended}
  WS_EX_DLGMODALFRAME  = 1;
  WS_EX_NOPARENTNOTIFY = 4;
  WS_EX_TOPMOST        = 8;
  WS_EX_ACCEPTFILES    = 16;
  WS_EX_TRANSPARENT    = 32;
  WS_EX_MDICHILD       = 64;
  WS_EX_TOOLWINDOW     = 128;
  WS_EX_WINDOWEDGE     = 256;
  WS_EX_CLIENTEDGE     = 512;
  WS_EX_CONTEXTHELP    = 1024;
  WS_EX_RIGHT          = 4096;
  WS_EX_LEFT           = 0;
  WS_EX_RTLREADING     = 8192;
  WS_EX_LTRREADING     = 0;
  WS_EX_LEFTSCROLLBAR  = 16384;
  WS_EX_RIGHTSCROLLBAR = 0;
  WS_EX_CONTROLPARENT  = 65536;
  WS_EX_STATICEDGE     = 131072;
  WS_EX_APPWINDOW      = 262144;
  WS_EX_LAYERED        = $00080000;
  WS_EX_NOINHERITLAYOUT= $00100000;
  WS_EX_LAYOUTRTL      = $00400000;
  WS_EX_COMPOSITED     = $02000000;
  WS_EX_NOACTIVATE     = $08000000;
  
  WS_EX_OVERLAPPEDWINDOW = (WS_EX_WINDOWEDGE or WS_EX_CLIENTEDGE);
  WS_EX_PALETTEWINDOW    = (WS_EX_WINDOWEDGE or WS_EX_TOOLWINDOW or WS_EX_TOPMOST);

{MouseEvent}
  MOUSEEVENTF_ABSOLUTE  = $8000;
  MOUSEEVENTF_LEFTDOWN  = $0002;
  MOUSEEVENTF_LEFTUP    = $0004;
  MOUSEEVENTF_MIDDLEDOWN= $0020;
  MOUSEEVENTF_MIDDLEUP  = $0040;
  MOUSEEVENTF_MOVE      = $0001;
  MOUSEEVENTF_RIGHTDOWN = $0008;
  MOUSEEVENTF_RIGHTUP   = $0010;
  MOUSEEVENTF_WHEEL     = $0800;
  MOUSEEVENTF_XDOWN     = $0080;
  MOUSEEVENTF_XUP       = $0100;
  MOUSEEVENTF_HWHEEL    = $01000;

{SetWindowPos}
  SWP_ASYNCWINDOWPOS = $4000;
  SWP_DEFERERASE     = $2000;
  SWP_DRAWFRAME      = $0020;
  SWP_FRAMECHANGED   = $0020;
  SWP_HIDEWINDOW     = $0080;
  SWP_NOACTIVATE     = $0010;
  SWP_NOCOPYBITS     = $0100;
  SWP_NOMOVE         = $0002;
  SWP_NOOWNERZORDER  = $0200;
  SWP_NOREDRAW       = $0008;
  SWP_NOREPOSITION   = $0200;
  SWP_NOSENDCHANGING = $0400;
  SWP_NOSIZE         = $0001;
  SWP_NOZORDER       = $0004;
  SWP_SHOWWINDOW     = $0040;
  
{Keyboard Input Notifications}
  WM_KEYFIRST        = $0100;
  WM_KEYDOWN         = $0100;
  WM_KEYUP           = $0101;
  WM_CHAR            = $0102;
  WM_DEADCHAR        = $0103;
  WM_SYSKEYDOWN      = $0104;
  WM_SYSKEYUP        = $0105;
  WM_SYSCHAR         = $0106;
  WM_SYSDEADCHAR     = $0107;
  
  WM_MOUSEFIRST      = $0200;
  WM_MOUSEMOVE       = $0200;
  WM_LBUTTONDOWN     = $0201;
  WM_LBUTTONUP       = $0202;
  WM_LBUTTONDBLCLK   = $0203;
  WM_RBUTTONDOWN     = $0204;
  WM_RBUTTONUP       = $0205;
  WM_RBUTTONDBLCLK   = $0206;
  WM_MBUTTONDOWN     = $0207;
  WM_MBUTTONUP       = $0208;
  WM_MBUTTONDBLCLK   = $0209; 
  
{ShowWindow}
  SW_HIDE            = 0;
  SW_MAXIMIZE        = 3;
  SW_MINIMIZE        = 6;
  SW_RESTORE         = 9;
  SW_SHOW            = 5;
  SW_SHOWMAXIMIZED   = 3;
  SW_SHOWMINIMIZED   = 2;
  SW_SHOWMINNOACTIVE = 7;
  SW_SHOWNA          = 8;
  SW_SHOWNOACTIVATE  = 4;
  SW_SHOWNORMAL      = 1;
  
{process and thread}
  PROCESS_ALL_ACCESS        = $1F0FFF;
  PROCESS_TERMINATE         = $0001;
  PROCESS_CREATE_THREAD     = $0002;
  PROCESS_VM_OPERATION      = $0008;
  PROCESS_VM_READ           = $0010;
  PROCESS_VM_WRITE          = $0020;
  PROCESS_DUP_HANDLE        = $0040;
  PROCESS_CREATE_PROCESS    = $0080;
  PROCESS_SET_QUOTA         = $0100;
  PROCESS_SET_INFORMATION   = $0200;
  PROCESS_QUERY_INFORMATION = $0400;
  PROCESS_SUSPEND_RESUME    = $0800;
  PROCESS_QUERY_LIMITED_INFORMATION = $1000;
  
  THREAD_ALL_ACCESS           = $1F03FF;
  THREAD_TERMINATE            = $0001;   
  THREAD_SUSPEND_RESUME       = $0002; 
  THREAD_GET_CONTEXT          = $0008;
  THREAD_SET_CONTEXT          = $0010;
  THREAD_SET_INFORMATION      = $0020;
  THREAD_QUERY_INFORMATION    = $0040;
  THREAD_SET_THREAD_TOKEN     = $0080;  
  THREAD_IMPERSONATE          = $0100;
  THREAD_DIRECT_IMPERSONATION = $0200; 
  THREAD_QUERY_LIMITED_INFORMATION = $0800;

{memory}
  MEM_COMMIT     = $00001000;
  MEM_RESERVE    = $00002000;
  MEM_RESET      = $00080000;
  MEM_RESET_UNDO = $01000000;
  
{memory protection}
  PAGE_EXECUTE            = $10;
  PAGE_EXECUTE_READ       = $20;
  PAGE_EXECUTE_READWRITE  = $40;
  PAGE_EXECUTE_WRITECOPY  = $80;
  PAGE_NOACCESS           = $01;
  PAGE_READONLY           = $02;
  PAGE_READWRITE          = $04;
  PAGE_WRITECOPY          = $08;
  PAGE_TARGETS_INVALID    = $40000000;
  PAGE_TARGETS_NO_UPDATE  = $40000000;
  PAGE_GUARD              = $100;
  PAGE_NOCACHE            = $200;
  PAGE_WRITECOMBINE       = $400;

{GetExitCodeThread}
  STILL_ACTIVE = $103; 

{ BitBlt }
   BLACKNESS   = $00000042;
   NOTSRCERASE = $001100A6;
   NOTSRCCOPY  = $00330008;
   SRCERASE    = $00440328;
   DSTINVERT   = $00550009;
   PATINVERT   = $005A0049;
   SRCINVERT   = $00660046;
   SRCAND      = $008800C6;
   MERGEPAINT  = $00BB0226;
   MERGECOPY   = $00C000CA;
   SRCCOPY     = $00CC0020;
   SRCPAINT    = $00EE0086;
   PATCOPY     = $00F00021;
   PATPAINT    = $00FB0A09;
   WHITENESS   = $00FF0062;

{ChoosePixelFormat}
  PFD_DOUBLEBUFFER = $1;
  PFD_STEREO = $2;
  PFD_DRAW_TO_WINDOW = $4;
  PFD_DRAW_TO_BITMAP = $8;
  PFD_SUPPORT_GDI = $10;
  PFD_SUPPORT_OPENGL = $20;
  PFD_DEPTH_DONTCARE = $20000000;
  PFD_DOUBLEBUFFER_DONTCARE = $40000000;
  PFD_STEREO_DONTCARE = $80000000;
  PFD_TYPE_RGBA = 0;
  PFD_TYPE_COLORINDEX = 1;
  PFD_MAIN_PLANE = 0;
  PFD_OVERLAY_PLANE = 1;
  PFD_UNDERLAY_PLANE = -(1);
 
{PIXELFORMATDESCRIPTOR structure}
  PFD_GENERIC_FORMAT = $40;
  PFD_NEED_PALETTE = $80;
  PFD_NEED_SYSTEM_PALETTE = $100;
  PFD_SWAP_EXCHANGE = $200;
  PFD_SWAP_COPY = $400;
  PFD_SWAP_LAYER_BUFFERS = $800;
  PFD_GENERIC_ACCELERATED = $1000;
  PFD_SUPPORT_DIRECTDRAW = $2000;
  PFD_DIRECT3D_ACCELERATED = $4000;
  PFD_SUPPORT_COMPOSITION = $8000; 


{CreateToolhelp32Snapshot function}
  TH32CS_INHERIT      = $80000000;
  TH32CS_SNAPHEAPLIST = $00000001;
  TH32CS_SNAPMODULE   = $00000008;
  TH32CS_SNAPMODULE32 = $00000010;
  TH32CS_SNAPPROCESS  = $00000002;
  TH32CS_SNAPTHREAD   = $00000004;
  TH32CS_SNAPALL      = TH32CS_SNAPHEAPLIST or TH32CS_SNAPMODULE or TH32CS_SNAPPROCESS or TH32CS_SNAPTHREAD;

   
begin
  Windows    := nil;
  User32     := Windows;
  Gdi32      := Windows;
  Kernel32   := Windows;
  Msimg32    := Windows;
  Advapi32   := Windows;
  Avrt       := Windows;
  KernelBase := Windows;
end;
