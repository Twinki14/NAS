{$include_once winTypes.pas}
//--------------------------------------------------------------------------------------------------------------------\\
//-----| Windows System Information  >  Handles and Objects  >  Handle and Object Reference   |-----------------------||
//--------------------------------------------------------------------------------------------------------------------//

// BOOL WINAPI CloseHandle(_In_ HANDLE hObject);
function LibKernel32.CloseHandle(hObject: HANDLE): WINBOOL; static; external 'CloseHandle@kernel32.dll' + WINAPI_CC;

{$IFDEF WIN10+} // Set by the user
// BOOL WINAPI CompareObjectHandles(_In_ HANDLE hFirstObjectHandle, _In_ HANDLE hSecondObjectHandle);
function LibKernelbase.CompareObjectHandles(hObject1, hObject2: HANDLE): WINBOOL; static; external 'CompareObjectHandles@kernelbase.dll' + WINAPI_CC;
{$ENDIF}

// BOOL WINAPI DuplicateHandle(_In_ HANDLE hSourceProcessHandle, _In_ HANDLE hSourceHandle, _In_ HANDLE hTargetProcessHandle, _Out_ LPHANDLE lpTargetHandle, _In_ DWORD dwDesiredAccess, _In_ BOOL bInheritHandle, _In_ DWORD dwOpti
function LibKernel32.DuplicateHandle(hSrcProcHandle, hSrcHandle, hTargetProcHandle: HANDLE; out hTargetHandle: HANDLE; dwDesiredAccess:DWORD; bInheritHandle:WINBOOL; dwOpti:DWORD): WINBOOL; static; external 'DuplicateHandle@kernel32.dll' + WINAPI_CC;

// BOOL WINAPI GetHandleInformation(_In_ HANDLE hObject, _Out_ LPDWORD lpdwFlags);
function LibKernel32.GetHandleInformation(hObject: HANDLE; out dwFlags: DWORD): WINBOOL; static; external 'GetHandleInformation@kernel32.dll' + WINAPI_CC;

// BOOL WINAPI SetHandleInformation(_In_ HANDLE hObject, _In_ DWORD dwMask, _In_ DWORD dwFlags);
function LibKernel32.SetHandleInformation(hObject: HANDLE; dwMask, dwFlags:DWORD): WINBOOL; static; external 'SetHandleInformation@kernel32.dll' + WINAPI_CC;


//--------------------------------------------------------------------------------------------------------------------\\
//-----| Device Contexts  >  Device Context Reference  >  Device Context Functions  |---------------------------------||
//--------------------------------------------------------------------------------------------------------------------//

function LibGdi32.CancelDC(dc: HDC): BOOL; static; external 'CancelDC@gdi32.dll' + WINAPI_CC;
//function LibGdi32.CreateDC(lpszDriver: LPCTSTR; lpszDevice:LPCTSTR; lpszOutput: LPCTSTR; const lpInitData: ^DEVMODE): HDC; static; external 'CreateDC@gdi32.dll' + WINAPI_CC; 
function LibGdi32.DeleteDC(dc: HDC): BOOL; static; external 'DeleteDC@gdi32.dll' + WINAPI_CC;
function LibGdi32.DeleteObject(hObject: HGDIOBJ): BOOL; static; external 'DeleteObject@gdi32.dll' + WINAPI_CC;
function LibGdi32.GetCurrentObject(dc: HDC; uObjectType:UInt32): HGDIOBJ; static; external 'GetCurrentObject@gdi32.dll' + WINAPI_CC;
//function LibGdi32.ResetDC(hdc: HDC; const lpInitData: ^DEVMODE): HDC; static; external 'ResetDC@gdi32.dll' + WINAPI_CC;
function LibGdi32.RestoreDC(hdc: HDC; nSavedDC: Int32): BOOL; static; external 'RestoreDC@gdi32.dll' + WINAPI_CC;
function LibGdi32.SaveDC(dc: HDC): Int32; static; external 'SaveDC@gdi32.dll' + WINAPI_CC;
function LibGdi32.GetObject(hObject: HGDIOBJ; cbBuffer: Int32; lpvObject: Pointer): Int32; static; external 'GetObjectW@gdi32.dll' + WINAPI_CC;
function LibGdi32.CreateCompatibleDC(dc: HDC): HDC; static; external 'CreateCompatibleDC@gdi32.dll' + WINAPI_CC;
function LibGdi32.SelectObject(dc:HDC; hObject: HGDIOBJ): HGDIOBJ; static; external 'SelectObject@gdi32.dll' + WINAPI_CC;

function LibUser32.GetDC(wnd: HWND): HDC; static; external 'GetDC@user32.dll' + WINAPI_CC;
function LibUser32.GetWindowDC(wnd: HWND): HDC; static; external 'GetWindowDC@user32.dll' + WINAPI_CC;
function LibUser32.GetDCEx(wnd: HWND; hrgnClip:HRGN; flags:DWord): HDC; static; external 'GetDCEx@user32.dll' + WINAPI_CC;
function LibUser32.ReleaseDC(wnd: HWND; hdc: HDC): Int32; static; external 'ReleaseDC@user32.dll' + WINAPI_CC;

function LibGdi32.GetDCBrushColor(dc: HDC): COLORREF; static; external 'GetDCBrushColor@gdi32.dll' + WINAPI_CC;
function LibGdi32.GetDCPenColor(dc: HDC): COLORREF; static; external 'GetDCPenColor@gdi32.dll' + WINAPI_CC;
function LibGdi32.SetDCBrushColor(dc: HDC; crColor:COLORREF): COLORREF; static; external 'SetDCBrushColor@gdi32.dll' + WINAPI_CC;
function LibGdi32.SetDCPenColor(dc: HDC; crColor:COLORREF): COLORREF; static; external 'SetDCPenColor@gdi32.dll' + WINAPI_CC;

