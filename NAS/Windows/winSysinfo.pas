{$include_once WinTypes.pas}

//--------------------------------------------------------------------------------------------------------------------\\
//-----| Error Handling  >  Error Handling Reference  >  Error Handling Functions |-----------------------------------||
//--------------------------------------------------------------------------------------------------------------------//
function LibKernel32.GetLastError(): DWORD; static; external 'GetLastError@Kernel32.dll' + WINAPI_CC;


//--------------------------------------------------------------------------------------------------------------------\\
//-----| System Information  >  System Information Reference  >  System Information Functions  |----------------------||
//--------------------------------------------------------------------------------------------------------------------//

// BOOL WINAPI GetComputerName( _Out_LPTSTR lpBuffer, _Inout_LPDWORD lpnSize); [@Kernel32.dll]
function LibKernel32.GetComputerName(lpBuffer: LPWSTR; var nSize: DWord): BOOL; static; external 'GetComputerNameW@Kernel32.dll' + WINAPI_CC;
function LibKernel32.GetComputerName(nSize: UInt32 = 1024): WideString; static; overload;
begin
  SetLength(Result, nSize);
  GetComputerName(PWideChar(Result), nSize);
  SetLength(Result, nSize);
end;

// void WINAPI GetNativeSystemInfo( _Out_LPSYSTEM_INFO lpSystemInfo); [@Kernel32.dll]
procedure LibKernel32.GetNativeSystemInfo(out SystemInfo: SYSTEM_INFO); static; external 'GetNativeSystemInfo@Kernel32.dll' + WINAPI_CC;

// BOOL WINAPI GetProductInfo( _In_DWORD dwOSMajorVersion, _In_DWORD dwOSMinorVersion, _In_DWORD dwSpMajorVersion, _In_DWORD dwSpMinorVersion, _Out_PDWORD pdwReturnedProductType); [@Kernel32.dll]
function LibKernel32.GetProductInfo(dwOSMajorVersion: DWord; dwOSMinorVersion: DWord; dwSpMajorVersion: DWord; dwSpMinorVersion: DWord; out ReturnedProductType: DWord): BOOL; static; external 'GetProductInfo@Kernel32.dll' + WINAPI_CC;

// UINT WINAPI GetSystemDirectory( _Out_LPTSTR lpBuffer, _In_UINT uSize); [@Kernel32.dll]
function LibKernel32.GetSystemDirectory(lpBuffer: LPWSTR; uSize: UInt32): UInt32; static; external 'GetSystemDirectoryW@Kernel32.dll' + WINAPI_CC;
function LibKernel32.GetSystemDirectory(uSize:UInt32 = 1024): WideString; static; overload;
begin
  SetLength(Result, uSize);
  SetLength(Result, GetSystemDirectory(PWideChar(Result), uSize));
end;

// void WINAPI GetSystemInfo( _Out_LPSYSTEM_INFO lpSystemInfo); [@Kernel32.dll]
procedure LibKernel32.GetSystemInfo(out SystemInfo: SYSTEM_INFO); static; external 'GetSystemInfo@Kernel32.dll' + WINAPI_CC;

// BOOL WINAPI GetSystemRegistryQuota( _Out_opt_PDWORD pdwQuotaAllowed, _Out_opt_PDWORD pdwQuotaUsed); [@Kernel32.dll]
function LibKernel32.GetSystemRegistryQuota(out dwQuotaAllowed: DWord; out dwQuotaUsed: DWord): BOOL; static; external 'GetSystemRegistryQuota@Kernel32.dll' + WINAPI_CC;

// UINT WINAPI GetSystemWindowsDirectory( _Out_LPTSTR lpBuffer, _In_UINT uSize); [@Kernel32.dll]
function LibKernel32.GetSystemWindowsDirectory(lpBuffer: LPWSTR; uSize: UInt32): UInt32; static; external 'GetSystemWindowsDirectoryW@Kernel32.dll' + WINAPI_CC;
function LibKernel32.GetSystemWindowsDirectory(uSize: UInt32 = 1024): WideString; static; overload;
begin
  SetLength(Result, uSize);
  SetLength(Result, GetSystemWindowsDirectory(PWideChar(Result), uSize));
end;

// UINT WINAPI GetSystemWow64Directory( _Out_ LPTSTR lpBuffer, _In_ UINT uSize); [@Kernel32.dll]
function LibKernel32.GetSystemWow64Directory(lpBuffer: LPWSTR; uSize: UInt32): UInt32; static; external 'GetSystemWow64DirectoryW@Kernel32.dll' + WINAPI_CC;
function LibKernel32.GetSystemWow64Directory(uSize: UInt32 = 1024): WideString; static; overload;
begin
  SetLength(Result, uSize);
  SetLength(Result, GetSystemWow64Directory(PWideChar(Result), uSize));
end;

// BOOL WINAPI GetUserName( _Out_ LPTSTR lpBuffer, _Inout_ LPDWORD lpnSize); [@Advapi32.dll]
function LibAdvapi32.GetUserName(lpBuffer: LPWSTR; var nSize: DWORD): BOOL; static; external 'GetUserNameW@Advapi32.dll' + WINAPI_CC;
function LibAdvapi32.GetUserName(nSize: UInt32 = 1024): WideString; static; overload;
begin
  SetLength(Result, nSize);
  GetUserName(PWideChar(Result), nSize);
  SetLength(Result, nSize);
end;

// DWORD WINAPI GetVersion(); [@Kernel32.dll]
function LibKernel32._GetVersion(): DWORD; static; external 'GetVersion@Kernel32.dll' + WINAPI_CC;
function LibKernel32.GetVersion(): TWinVersion;
begin
  Result := TWinVersion(_GetVersion());
end;

// UINT WINAPI GetWindowsDirectory( _Out_LPTSTR lpBuffer, _In_UINT uSize); [@Kernel32.dll]
function LibKernel32.GetWindowsDirectory(lpBuffer: LPWSTR; uSize: UInt32): UInt32; static; external 'GetWindowsDirectoryW@Kernel32.dll' + WINAPI_CC;
function LibKernel32.GetWindowsDirectory(uSize: UInt32 = 1024): WideString; static; overload;
begin
  SetLength(Result, uSize);
  SetLength(Result, GetWindowsDirectory(PWideChar(Result), uSize)); 
end;

// BOOL WINAPI IsProcessorFeaturePresent( _In_DWORD ProcessorFeature); [@Kernel32.dll]
function LibKernel32.IsProcessorFeaturePresent(ProcessorFeature: DWord): BOOL; static; external 'IsProcessorFeaturePresent@Kernel32.dll' + WINAPI_CC;

// BOOL WINAPI QueryPerformanceCounter( _Out_LARGE_INTEGER *lpPerformanceCount); [@Kernel32.dll]
function LibKernel32.QueryPerformanceCounter(var PerformanceCount: UInt64): BOOL; static; external 'QueryPerformanceCounter@Kernel32.dll' + WINAPI_CC;

// BOOL WINAPI QueryPerformanceFrequency( _Out_LARGE_INTEGER *lpFrequency); [@Kernel32.dll]
function LibKernel32.QueryPerformanceFrequency(var Frequency: UInt64): BOOL; static; external 'QueryPerformanceFrequency@Kernel32.dll' + WINAPI_CC;
