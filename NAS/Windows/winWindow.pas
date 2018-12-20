{$include_once winTypes.pas}
//--------------------------------------------------------------------------------------------------------------------\\
//-----| Messages and Message Queues  >  Message Reference  >  Message Functions  |-----------------------------------||
//--------------------------------------------------------------------------------------------------------------------//

// LRESULT WINAPI SendMessage( _In_ HWND   hWnd, _In_ UINT Msg, _In_ WPARAM wParam, _In_ LPARAM lParam);
function LibUser32.SendMessage(hwnd: HWND; Msg: UInt32; wPar: WPARAM; lPar: LPARAM): LRESULT; static; external 'SendMessageW@User32.dll' + WINAPI_CC;

// LRESULT WINAPI PostMessage( _In_ HWND   hWnd, _In_ UINT Msg, _In_ WPARAM wParam, _In_ LPARAM lParam);
function LibUser32.PostMessage(hwnd: HWND; Msg: UInt32; wPar: WPARAM; lPar: LPARAM): LRESULT; static; external 'PostMessageW@User32.dll' + WINAPI_CC;


//--------------------------------------------------------------------------------------------------------------------\\
//-----| Windows  >  Window Reference  >  Window Functions  |---------------------------------------------------------||
//--------------------------------------------------------------------------------------------------------------------//

// BOOL WINAPI AdjustWindowRect(_Inout_ LPRECT lpRect, _In_ DWORD dwStyle, _In_ BOOL bMenu);
function LibUser32.AdjustWindowRect(var lpRect: TRect; dwStyle: DWord; bMenu: BOOL): BOOL; static; external 'AdjustWindowRect@user32.dll' + WINAPI_CC;

// BOOL WINAPI AdjustWindowRectEx(_Inout_ LPRECT lpRect, _In_ DWORD dwStyle, _In_ BOOL bMenu, _In_ DWORD dwExStyle);
function LibUser32.AdjustWindowRectEx(var rect: TRect; dwStyle: DWord; bMenu:Boolean; dwExStyle: DWord): Boolean; static; external 'AdjustWindowRectEx@user32.dll' + WINAPI_CC;

// BOOL WINAPI AllowSetForegroundWindow(_In_ DWORD dwProcessId);
function LibUser32.AllowSetForegroundWindow(dwProcessId: DWord): BOOL; static; external 'AllowSetForegroundWindow@user32.dll' + WINAPI_CC;

// BOOL WINAPI AnimateWindow(_In_ HWND hwnd, _In_ DWORD dwTime, _In_ DWORD dwFlags);
function LibUser32.AnimateWindow(wnd: HWND; dwTime: DWord; dwFlags: DWord): BOOL; static; external 'AnimateWindow@user32.dll' + WINAPI_CC;

// BOOL WINAPI AnyPopup(void);
function LibUser32.AnyPopup(): BOOL; static; external 'AnyPopup@user32.dll' + WINAPI_CC;

// UINT WINAPI ArrangeIconicWindows(_In_ HWND hWnd);
function LibUser32.ArrangeIconicWindows(wnd: HWND): UInt32; static; external 'ArrangeIconicWindows@user32.dll' + WINAPI_CC;

// HDWP WINAPI BeginDeferWindowPos(_In_ int nNumWindows);
function LibUser32.BeginDeferWindowPos(nNumWindows: Int32): HDWP; static; external 'BeginDeferWindowPos@user32.dll' + WINAPI_CC;

// BOOL WINAPI BringWindowToTop(_In_ HWND hWnd);
function LibUser32.BringWindowToTop(wnd: HWND): BOOL; static; external 'BringWindowToTop@user32.dll' + WINAPI_CC;

// BOOL WINAPI CalculatePopupWindowPosition( _In_ const POINT *anchorPoint, _In_ const SIZE *windowSize, _In_ UINT flags, _In_opt_  RECT *excludeRect, _Out_RECT *popupWindowPosition);
//function LibUser32.CalculatePopupWindowPosition(): BOOL; static; external 'CalculatePopupWindowPosition@user32.dll' + WINAPI_CC;

// WORD WINAPI CascadeWindows(_In_opt_   HWND hwndParent, _In_  UINT wHow, _In_opt_  const RECT *lpRect, _In_ UINT cKids, _In_opt_   const HWND *lpKids);
(*
function LibUser32.CascadeWindows(hwndParent: HWND; wHow: UInt32; Rect:TRect; cKids:UInt32; Kids:HWND): Word; static;
  function _CascadeWindows(hwndParent: HWND; wHow: UInt32; Rect:^TRect; cKids:UInt32; lpKids:^HWND): Word; external 'CascadeWindows@user32.dll' + WINAPI_CC;
begin
  Result := _CascadeWindows(hwndParent, wHow, @rect, cKids, @kids);
end;
*)

// BOOL WINAPI ChangeWindowMessageFilter(_In_ UINT message, _In_ DWORD dwFlag);
function LibUser32.ChangeWindowMessageFilter(message: UInt32; dwFlag: DWord): BOOL; static; external 'ChangeWindowMessageFilter@user32.dll' + WINAPI_CC;

// HWND WINAPI ChildWindowFromPoint(_In_ HWND hWndParent, _In_ POINT Point);
function LibUser32.ChildWindowFromPoint(hWndParent: HWND; Point: TPoint): HWND; static; external 'ChildWindowFromPoint@user32.dll' + WINAPI_CC;

// HWND WINAPI ChildWindowFromPointEx(_In_ HWND hwndParent, _In_ POINT pt, _In_ UINT uFlags);
function LibUser32.ChildWindowFromPointEx(hwndParent: HWND; pt: TPoint; uFlags: UInt32): HWND; static; external 'ChildWindowFromPointEx@user32.dll' + WINAPI_CC;

// BOOL WINAPI CloseWindow( _In_ HWND hWnd);
function LibUser32.CloseWindow(wnd: HWND): BOOL; static; external 'CloseWindow@user32.dll' + WINAPI_CC;

// HWND WINAPI CreateWindowEx( _In_ DWORD dwExStyle, _In_opt_  LPCTSTR lpClassName, _In_opt_  LPCTSTR lpWindowName, _In_ DWORD dwStyle, _In_ int x, _In_ int y, _In_ int nWidth, _In_ int nHeight, _In_opt_  HWND hWndParent, _In_opt_  HMENU hMenu, _In_opt_  HINSTANCE hInstance, _In_opt_  LPVOID lpParam);
function LibUser32.CreateWindow(dwExStyle: DWord; ClassName: AnsiString; WindowName: AnsiString; dwStyle: DWord; x,y,nWidth,nHeight: Int32; hWndParent: HWND; Menu: HMENU; Instance: HINST; lpParam: LPVOID): HWND; static;
  function _CreateWindowEx(dwExStyle: DWord; lpClassName: LPCTSTR; lpWindowName: LPCTSTR; dwStyle: DWord; x,y,nWidth,nHeight: Int32; hWndParent: HWND; Menu: HMENU; Instance: HINST; lpParam: LPVOID): HWND; external 'CreateWindowExA@user32.dll' + WINAPI_CC;
begin
  Result := _CreateWindowEx(dwExStyle, PChar(ClassName), PChar(WindowName), dwStyle, x,y,nWidth,nHeight, hWndParent, Menu, Instance, lpParam);
end;

// HDWP WINAPI DeferWindowPos( _In_ HDWP hWinPosInfo, _In_ HWND hWnd, _In_opt_  HWND hWndInsertAfter, _In_ int x, _In_ int y, _In_ int cx, _In_ int cy, _In_ UINT uFlags);
function LibUser32.DeferWindowPos(hWinPosInfo: HDWP; wnd: HWND; hWndInsertAfter: HWND; x,y,cx,cy: Int32; uFlags: UInt32): HDWP; static; external 'DeferWindowPos@user32.dll' + WINAPI_CC;

// BOOL WINAPI DeregisterShellHookWindow( _In_ HWND hWnd);
function LibUser32.DeregisterShellHookWindow(wnd: HWND): BOOL; static; external 'DeregisterShellHookWindow@user32.dll' + WINAPI_CC;

// BOOL WINAPI DestroyWindow( _In_ HWND hWnd);
function LibUser32.DestroyWindow(wnd: HWND): BOOL; static; external 'DestroyWindow@user32.dll' + WINAPI_CC;

// BOOL WINAPI EndDeferWindowPos( _In_ HDWP hWinPosInfo);
function LibUser32.EndDeferWindowPos(hWinPosInfo: HDWP): BOOL; static; external 'EndDeferWindowPos@user32.dll' + WINAPI_CC;

// BOOL WINAPI EndTask( _In_ HWND hWnd, _In_ BOOL fShutDown, _In_ BOOL fForce);
function LibUser32.EndTask(wnd: HWND; fShutDown: BOOL; fForce: BOOL): BOOL; static; external 'EndTask@user32.dll' + WINAPI_CC;

// BOOL WINAPI EnumChildWindows( _In_opt_  HWND hWndParent, _In_ WNDENUMPROC lpEnumFunc, _In_ LPARAM lParam);
function LibUser32.EnumChildWindows(hWndParent: HWND; func: TEnumWindowsProc; Param: LPARAM): BOOL; static; external 'EnumChildWindows@user32.dll' + WINAPI_CC;

// BOOL WINAPI EnumThreadWindows( _In_ DWORD dwThreadId, _In_ WNDENUMPROC lpfn, _In_ LPARAM lParam);
function LibUser32.EnumThreadWindows(dwThreadId: DWord; func: TEnumWindowsProc; Param: LPARAM): BOOL; static; external 'EnumThreadWindows@user32.dll' + WINAPI_CC;

// BOOL WINAPI EnumWindows( _In_ WNDENUMPROC lpEnumFunc, _In_ LPARAM lParam);
function LibUser32.EnumWindows(func: TEnumWindowsProc; Param: LPARAM): BOOL; static; external 'EnumWindows@user32.dll' + WINAPI_CC;

// HWND WINAPI FindWindow( _In_opt_  LPCTSTR lpClassName, _In_opt_  LPCTSTR lpWindowName);
function LibUser32.FindWindowA(lpClassName: LPCTSTR; lpWindowName: LPCTSTR): HWND; static; external 'FindWindowA@user32.dll' + WINAPI_CC;
function LibUser32.FindWindowW(lpClassName: LPCWSTR; lpWindowName: LPCWSTR): HWND; static; external 'FindWindowW@user32.dll' + WINAPI_CC;

function LibUser32.FindWindow(lpClassName: WideString; lpWindowName: WideString): HWND; static;
begin
  Result := FindWindowW(PWideChar(lpClassName), PWideChar(lpWindowName));
end;

// HWND WINAPI FindWindowEx( _In_opt_  HWND hwndParent, _In_opt_  HWND hwndChildAfter, _In_opt_  LPCTSTR lpszClass, _In_opt_  LPCTSTR lpszWindow);
function LibUser32.FindWindowExA(hwndParent: HWND; hwndChildAfter: HWND; lpszClass: LPCTSTR; lpszWindow: LPCTSTR): HWND; static; external 'FindWindowExA@user32.dll' + WINAPI_CC;
function LibUser32.FindWindowExW(hwndParent: HWND; hwndChildAfter: HWND; lpszClass: LPCWSTR; lpszWindow: LPCWSTR): HWND; static; external 'FindWindowExW@user32.dll' + WINAPI_CC;

function LibUser32.FindWindowEx(hwndParent: HWND; hwndChildAfter: HWND; szClass: WideString; szWindow: WideString): HWND; static;
begin
  Result := FindWindowExW(hwndParent, hwndChildAfter, PWideChar(szClass), PWideChar(szWindow));
end;

// HWND WINAPI GetAncestor( _In_ HWND hwnd, _In_ UINT gaFlags);
function LibUser32.GetAncestor(wnd: HWND; gaFlags: UInt32): HWND; static; external 'GetAncestor@user32.dll' + WINAPI_CC;

// BOOL WINAPI GetClientRect( _In_ HWND hWnd, _Out_LPRECT lpRect);
function LibUser32.GetClientRect(wnd: HWND; var Rect: TRect): Boolean; static; external 'GetClientRect@user32.dll' + WINAPI_CC;

// HWND WINAPI GetDesktopWindow(void);
function LibUser32.GetDesktopWindow(): HWND; static; external 'GetDesktopWindow@user32.dll' + WINAPI_CC;

// HWND WINAPI GetForegroundWindow(void);
function LibUser32.GetForegroundWindow(): HWND; static; external 'GetForegroundWindow@user32.dll' + WINAPI_CC;

// HWND WINAPI GetLastActivePopup( _In_ HWND hWnd);
function LibUser32.GetLastActivePopup(wnd: HWND): HWND; static; external 'GetLastActivePopup@user32.dll' + WINAPI_CC;

// BOOL WINAPI GetLayeredWindowAttributes( _In_ HWND hwnd, _Out_opt_ COLORREF *pcrKey, _Out_opt_ BYTE *pbAlpha, _Out_opt_ DWORD *pdwFlags);
function LibUser32.GetLayeredWindowAttributes(wnd: HWND; out crKey: COLORREF; out alpha: Byte; out dwFlags: DWord): Boolean; static; external 'GetLayeredWindowAttributes@user32.dll' + WINAPI_CC;

// HWND WINAPI GetNextWindow( _In_ HWND hWnd, _In_ UINT wCmd);
function LibUser32.GetNextWindow(wnd: HWND; wCmd: UInt32): HWND; static; external 'GetWindow@user32.dll' + WINAPI_CC;

// HWND WINAPI GetParent( _In_ HWND hWnd);
function LibUser32.GetParent(wnd: HWND): HWND; static; external 'GetParent@user32.dll' + WINAPI_CC;

// BOOL WINAPI GetProcessDefaultLayout( _Out_DWORD *pdwDefaultLayout);
function LibUser32.GetProcessDefaultLayout(out dwDefaultLayout: DWord): Boolean; static; external 'GetProcessDefaultLayout@user32.dll' + WINAPI_CC;

// HWND WINAPI GetShellWindow(void);
function LibUser32.GetShellWindow(): HWND; static; external 'GetShellWindow@user32.dll' + WINAPI_CC;

// DWORD WINAPI GetSysColor( _In_ int nIndex);
function LibUser32.GetSysColor(nIndex: Int32): DWord; static; external 'GetSysColor@user32.dll' + WINAPI_CC;

// BOOL WINAPI GetTitleBarInfo( _In_ HWND hwnd, _Inout_ PTITLEBARINFO pti);
//function LibUser32.GetTitleBarInfo(wnd: HWND; pti: PTITLEBARINFO): BOOL; static; external 'GetTitleBarInfo@user32.dll' + WINAPI_CC;

// HWND WINAPI GetTopWindow( _In_opt_  HWND hWnd);
function LibUser32.GetTopWindow(wnd: HWND): HWND; static; external 'GetTopWindow@user32.dll' + WINAPI_CC;

// HWND WINAPI GetWindow( _In_ HWND hWnd, _In_ UINT uCmd);
function LibUser32.GetWindow(wnd: HWND; uCmd: UInt32): HWND; static; external 'GetWindow@user32.dll' + WINAPI_CC;

// BOOL WINAPI GetWindowDisplayAffinity( _In_ HWND hWnd, _Out_DWORD *dwAffinity);
function LibUser32.GetWindowDisplayAffinity(wnd: HWND; out dwAffinity: DWord): Boolean; static; external 'GetWindowDisplayAffinity@user32.dll' + WINAPI_CC;

// BOOL WINAPI GetWindowInfo( _In_ HWND hwnd, _Inout_ PWINDOWINFO pwi);
function LibUser32.GetWindowInfo(wnd: HWND; var wi: WINDOWINFO): Boolean; static; external 'GetWindowInfo@user32.dll' + WINAPI_CC;

// UINT WINAPI GetWindowModuleFileName( _In_ HWND hwnd, _Out_LPTSTR lpszFileName, _In_ UINT cchFileNameMax);
function LibUser32.GetWindowModuleFileName(wnd: HWND; lpszFileName: LPTSTR; cchFileNameMax: UInt32): UInt32; static; external 'GetWindowModuleFileName@user32.dll' + WINAPI_CC;

// BOOL WINAPI GetWindowPlacement( _In_ HWND hWnd, _Inout_ WINDOWPLACEMENT *lpwndpl);
function LibUser32.GetWindowPlacement(wnd: HWND; var wndpl: WINDOWPLACEMENT): BOOL; static; external 'GetWindowPlacement@user32.dll' + WINAPI_CC;

// BOOL WINAPI GetWindowRect( _In_ HWND hWnd, _Out_LPRECT lpRect);
function LibUser32.GetWindowRect(wnd: HWND): TRect; static;
  function _GetWindowRect(wnd: HWND; Rect: ^TRect): BOOL; static; external 'GetWindowRect@user32.dll' + WINAPI_CC;
begin
  if not _GetWindowRect(wnd, @Result) then
    Result := [0,0,0,0];
end;

// int WINAPI GetWindowText( _In_ HWND hWnd, _Out_LPTSTR lpString, _In_ int nMaxCount);
function LibUser32.GetWindowTextA(wnd: HWND; lpString: LPCTSTR; nMaxCount: Int32): Int32; static; external 'GetWindowTextA@user32.dll' + WINAPI_CC;
function LibUser32.GetWindowTextW(wnd: HWND; lpString: LPCWSTR; nMaxCount: Int32): Int32; static; external 'GetWindowTextW@user32.dll' + WINAPI_CC;

function LibUser32.GetWindowText(wnd: HWND): WideString; static;
type PWideChar = ^WideChar;
begin
  SetLength(Result, 1024);
  SetLength(Result, LibUser32.GetWindowTextW(wnd, PWideChar(Result), Length(Result)));
end;


// int WINAPI GetWindowTextLength( _In_ HWND hWnd);
function LibUser32.GetWindowTextLength(wnd: HWND): Int32; static; external 'GetWindowTextLengthA@user32.dll' + WINAPI_CC;

// DWORD WINAPI GetWindowThreadProcessId( _In_ HWND hWnd, _Out_opt_LPDWORD lpdwProcessId);
function LibUser32.GetWindowThreadProcessId(wnd: HWND; out dwProcessId: DWord): DWord; static; external 'GetWindowThreadProcessId@user32.dll' + WINAPI_CC;

// BOOL WINAPI IsChild( _In_ HWND hWndParent, _In_ HWND hWnd);
function LibUser32.IsChild(hWndParent: HWND; wnd: HWND): BOOL; static; external 'IsChild@user32.dll' + WINAPI_CC;

// BOOL WINAPI IsGUIThread( _In_ BOOL bConvert);
function LibUser32.IsGUIThread(bConvert: BOOL): BOOL; static; external 'IsGUIThread@user32.dll' + WINAPI_CC;

// BOOL WINAPI IsHungAppWindow( _In_ HWND hWnd);
function LibUser32.IsHungAppWindow(wnd: HWND): BOOL; static; external 'IsHungAppWindow@user32.dll' + WINAPI_CC;

// BOOL WINAPI IsIconic( _In_ HWND hWnd);
function LibUser32.IsIconic(wnd: HWND): BOOL; static; external 'IsIconic@user32.dll' + WINAPI_CC;

// BOOL WINAPI IsProcessDPIAware(void);
function LibUser32.IsProcessDPIAware(): BOOL; static; external 'IsProcessDPIAware@user32.dll' + WINAPI_CC;

// BOOL WINAPI IsWindow( _In_opt_  HWND hWnd);
function LibUser32.IsWindow(wnd: HWND): BOOL; static; external 'IsWindow@user32.dll' + WINAPI_CC;

// BOOL WINAPI IsWindowUnicode( _In_ HWND hWnd);
function LibUser32.IsWindowUnicode(wnd: HWND): BOOL; static; external 'IsWindowUnicode@user32.dll' + WINAPI_CC;

// BOOL WINAPI IsWindowVisible( _In_ HWND hWnd);
function LibUser32.IsWindowVisible(wnd: HWND): BOOL; static; external 'IsWindowVisible@user32.dll' + WINAPI_CC;

// BOOL WINAPI IsZoomed( _In_ HWND hWnd);
function LibUser32.IsZoomed(wnd: HWND): BOOL; static; external 'IsZoomed@user32.dll' + WINAPI_CC;

// BOOL WINAPI LockSetForegroundWindow( _In_ UINT uLockCode);
function LibUser32.LockSetForegroundWindow(uLockCode: UInt32): BOOL; static; external 'LockSetForegroundWindow@user32.dll' + WINAPI_CC;

// BOOL WINAPI LogicalToPhysicalPoint( _In_ HWND hWnd, _Inout_ LPPOINT lpPoint);
function LibUser32.LogicalToPhysicalPoint(wnd: HWND; Point: ^TPoint): BOOL; static; external 'LogicalToPhysicalPoint@user32.dll' + WINAPI_CC;

// BOOL WINAPI MoveWindow( _In_ HWND hWnd, _In_ int X, _In_ int Y, _In_ int nWidth, _In_ int nHeight, _In_ BOOL bRepaint);
function LibUser32.MoveWindow(wnd: HWND; X, Y, nWidth, nHeight: Int32; bRepaint: BOOL): BOOL; static; external 'MoveWindow@user32.dll' + WINAPI_CC;

// BOOL WINAPI OpenIcon( _In_ HWND hWnd);
function LibUser32.OpenIcon(wnd: HWND): BOOL; static; external 'OpenIcon@user32.dll' + WINAPI_CC;

// BOOL WINAPI PhysicalToLogicalPoint( _In_ HWND hWnd, _Inout_ LPPOINT lpPoint);
function LibUser32.PhysicalToLogicalPoint(wnd: HWND; Point: ^TPoint): BOOL; static; external 'PhysicalToLogicalPoint@user32.dll' + WINAPI_CC;

// HWND WINAPI RealChildWindowFromPoint( _In_ HWND hwndParent, _In_ POINT ptParentClientCoords);
function LibUser32.RealChildWindowFromPoint(hwndParent: HWND; ptParentClientCoords: TPoint): HWND; static; external 'RealChildWindowFromPoint@user32.dll' + WINAPI_CC;

// UINT WINAPI RealGetWindowClass( _In_ HWND hwnd, _Out_LPTSTR pszType, _In_ UINT cchType);
function LibUser32.RealGetWindowClass(wnd: HWND; pszType: LPTSTR; cchType: UInt32): UInt32; static; external 'RealGetWindowClass@user32.dll' + WINAPI_CC;

// BOOL WINAPI RegisterShellHookWindow( _In_ HWND hWnd);
function LibUser32.RegisterShellHookWindow(wnd: HWND): BOOL; static; external 'RegisterShellHookWindow@user32.dll' + WINAPI_CC;

// BOOL WINAPI SetForegroundWindow( _In_ HWND hWnd);
function LibUser32.SetForegroundWindow(wnd: HWND): BOOL; static; external 'SetForegroundWindow@user32.dll' + WINAPI_CC;

// BOOL WINAPI SetLayeredWindowAttributes( _In_ HWND hwnd, _In_ COLORREF crKey, _In_ BYTE bAlpha, _In_ DWORD dwFlags);
function LibUser32.SetLayeredWindowAttributes(wnd: HWND; crKey: COLORREF; bAlpha: BYTE; dwFlags: DWord): BOOL; static; external 'SetLayeredWindowAttributes@user32.dll' + WINAPI_CC;

// HWND WINAPI SetParent( _In_ HWND hWndChild, _In_opt_  HWND hWndNewParent);
function LibUser32.SetParent(hWndChild: HWND; hWndNewParent: HWND): HWND; static; external 'SetParent@user32.dll' + WINAPI_CC;

// BOOL WINAPI SetProcessDefaultLayout( _In_ DWORD dwDefaultLayout);
function LibUser32.SetProcessDefaultLayout(dwDefaultLayout: DWord): BOOL; static; external 'SetProcessDefaultLayout@user32.dll' + WINAPI_CC;

// BOOL WINAPI SetProcessDPIAware(void);
function LibUser32.SetProcessDPIAware(): BOOL; static; external 'SetProcessDPIAware@user32.dll' + WINAPI_CC;

// BOOL WINAPI SetSysColors( _In_ int cElements, _In_ const INT *lpaElements, _In_ const COLORREF *lpaRgbValues);
(*
function LibUser32.SetSysColors(cElements: Int32; lpaElements: ^Int32; lpaRgbValues: ^COLORREF): Boolean; static;
  function _SetSysColors(cElements: Int32; lpaElements: ^Int32; lpaRgbValues: ^COLORREF): BOOL; external 'SetSysColors@user32.dll' + WINAPI_CC;
begin
  Result := _SetSysColors(cElements,  
end;*)

// BOOL WINAPI SetWindowDisplayAffinity( _In_ HWND hWnd, _In_ DWORD dwAffinity);
function LibUser32.SetWindowDisplayAffinity(wnd: HWND; dwAffinity: DWord): BOOL; static; external 'SetWindowDisplayAffinity@user32.dll' + WINAPI_CC;

// BOOL WINAPI SetWindowFeedbackSettings( _In_ HWND hwnd, _In_ FEEDBACK_TYPE feedback, _In_ DWORD flags, _In_ UINT32 size, _In_opt_  const VOID *configuration);
//function LibUser32.SetWindowFeedbackSettings(wnd: HWND; feedback: FEEDBACK_TYPE; flags: DWORD; size: UINT32; const configuration: Pointer): BOOL; static; external 'SetWindowFeedbackSettings@user32.dll' + WINAPI_CC;

// BOOL WINAPI SetWindowPlacement( _In_ HWND hWnd, _In_ const WINDOWPLACEMENT *lpwndpl);
function LibUser32.SetWindowPlacement(wnd: HWND; constref wndpl: WINDOWPLACEMENT): BOOL; static; external 'SetWindowPlacement@user32.dll' + WINAPI_CC;

// BOOL WINAPI SetWindowPos( _In_ HWND hWnd, _In_opt_  HWND hWndInsertAfter, _In_ int X, _In_ int Y, _In_ int cx, _In_ int cy, _In_ UINT uFlags);
function LibUser32.SetWindowPos(wnd: HWND; hWndInsertAfter: HWND; X,Y,cx,cy: Int32; uFlags: UInt32): BOOL; static; external 'SetWindowPos@user32.dll' + WINAPI_CC;

// BOOL WINAPI SetWindowText( _In_ HWND hWnd, _In_opt_  LPCTSTR lpString);
function LibUser32.SetWindowTextA(wnd: HWND; lpString: LPCTSTR): BOOL; static; external 'SetWindowTextA@user32.dll' + WINAPI_CC;
function LibUser32.SetWindowTextW(wnd: HWND; lpString: LPCWSTR): BOOL; static; external 'SetWindowTextW@user32.dll' + WINAPI_CC;

function LibUser32.SetWindowText(wnd: HWND; text: WideString): Boolean; static;
begin
  Result := SetWindowTextW(wnd, PWideChar(text));
end;

// BOOL WINAPI ShowOwnedPopups( _In_ HWND hWnd, _In_ BOOL fShow);
function LibUser32.ShowOwnedPopups(wnd: HWND; fShow: BOOL): BOOL; static; external 'ShowOwnedPopups@user32.dll' + WINAPI_CC;

// BOOL WINAPI ShowWindow( _In_ HWND hWnd, _In_ int nCmdShow);
function LibUser32.ShowWindow(wnd: HWND; nCmdShow: Int32): BOOL; static; external 'ShowWindow@user32.dll' + WINAPI_CC;

// BOOL WINAPI ShowWindowAsync( _In_ HWND hWnd, _In_ int nCmdShow);
function LibUser32.ShowWindowAsync(wnd: HWND; nCmdShow: Int32): BOOL; static; external 'ShowWindowAsync@user32.dll' + WINAPI_CC;

// BOOL WINAPI SoundSentry(void);
function LibUser32.SoundSentry(): BOOL; static; external 'SoundSentry@user32.dll' + WINAPI_CC;

// VOID WINAPI SwitchToThisWindow( _In_ HWND hWnd, _In_ BOOL fAltTab);
procedure LibUser32.SwitchToThisWindow(wnd: HWND; fAltTab: BOOL); static; external 'SwitchToThisWindow@user32.dll' + WINAPI_CC;

// WORD WINAPI TileWindows( _In_opt_  HWND hwndParent, _In_ UINT wHow, _In_opt_ const RECT *lpRect, _In_ UINT cKids, _In_opt_  const HWND *lpKids);
//function LibUser32.TileWindows(hwndParent: HWND; wHow: UInt32; Rect: ^TRect; cKids:UInt32; const lpKids:^HWND): WORD; static; external 'TileWindows@user32.dll' + WINAPI_CC;

// BOOL WINAPI UpdateLayeredWindow( _In_ HWND hwnd, _In_opt_  HDC hdcDst, _In_opt_  POINT *pptDst, _In_opt_  SIZE *psize, _In_opt_  HDC hdcSrc, _In_opt_  POINT *pptSrc, _In_ COLORREF crKey, _In_opt_  BLENDFUNCTION *pblend, _In_ DWORD dwFlags);
//function LibUser32.UpdateLayeredWindow(wnd: HWND; hdcDst: HDC; pptDst: ^TPoint; size: ^SIZE; hdcSrc: HDC; pptSrc: ^POINT; crKey: COLORREF; pblend: ^BLENDFUNCTION; dwFlags: DWORD): BOOL; static; external 'UpdateLayeredWindow@user32.dll' + WINAPI_CC;

// BOOL WINAPI UpdateLayeredWindowIndirect( _In_ HWND hwnd, _In_ const UPDATELAYEREDWINDOWINFO *pULWInfo);
//function LibUser32.UpdateLayeredWindowIndirect(wnd: HWND; ULWInfo:^UPDATELAYEREDWINDOWINFO): BOOL; static; external 'UpdateLayeredWindowIndirect@user32.dll' + WINAPI_CC;

// HWND WINAPI WindowFromPhysicalPoint( _In_ POINT Point);
function LibUser32.WindowFromPhysicalPoint(Point: TPoint): HWND; static; external 'WindowFromPhysicalPoint@user32.dll' + WINAPI_CC;

// HWND WINAPI WindowFromPoint( _In_ POINT Point);
function LibUser32.WindowFromPoint(Point: TPoint): HWND; static; external 'WindowFromPoint@user32.dll' + WINAPI_CC;


//--------------------------------------------------------------------------------------------------------------------\\
//-----| Window Classes  >  Window Class Reference  >  Window Class Functions   |-------------------------------------||
//--------------------------------------------------------------------------------------------------------------------//
// int WINAPI GetClassName( _In_ HWND hWnd, _Out_LPTSTR lpClassName, _In_ int nMaxCount);
function LibUser32.GetClassNameA(wnd: HWND; lpClassName: LPCTSTR; nMaxCount: Int32): Int32; static; external 'GetClassNameA@user32.dll' + WINAPI_CC;
function LibUser32.GetClassNameW(wnd: HWND; lpClassName: LPCWSTR; nMaxCount: Int32): Int32; static; external 'GetClassNameW@user32.dll' + WINAPI_CC;

function LibUser32.GetClassName(wnd: HWND; nMaxCount:Int32 = 1024): WideString; static;
begin
  SetLength(Result, nMaxCount);
  SetLength(Result, LibUser32.GetClassNameW(wnd, PWideChar(Result), nMaxCount));
end;

// LONG WINAPI GetWindowLong( _In_ HWND hWnd, _In_ int nIndex);
function LibUser32.GetWindowLong(wnd: HWND; nIndex:Int32): WINLONG; static; external 'GetWindowLongW@user32.dll' + WINAPI_CC;

// LONG WINAPI SetWindowLong( _In_ HWND hWnd, _In_ int nIndex; _In_ LONG dwNewLong);
function LibUser32.SetWindowLong(wnd: HWND; nIndex:Int32; New:WINLONG): WINLONG; static; external 'SetWindowLongW@user32.dll' + WINAPI_CC;

// ULONG_PTR WINAPI GetClassLongPtr(_In_ HWND hWnd, _In_ int nIndex);
//function LibUser32.GetClassLongPtr(wnd: HWND; nIndex:Int32): PtrUInt; static; external 'GetClassLongPtrW@user32.dll' + WINAPI_CC;

// DWORD WINAPI GetClassLong(_In_ HWND hWnd, _In_ int nIndex);
function LibUser32.GetClassLong(wnd: HWND; nIndex:Int32): DWORD; static; external 'GetClassLongW@user32.dll' + WINAPI_CC;

//DWORD WINAPI SetClassLong( _In_ HWND hWnd, _In_ int  nIndex, _In_ LONG dwNewLong);
function LibUser32.SetClassLong(wnd: HWND; nIndex:Int32; New:WINLONG): WINLONG; static; external 'SetClassLongW@user32.dll' + WINAPI_CC;

