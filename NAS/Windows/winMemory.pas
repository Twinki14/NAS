{$include_once winTypes.pas}
//--------------------------------------------------------------------------------------------------------------------\\
//-----|  Memory Management  >  Memory Management Reference  >  Memory Management Functions  |------------------------||
//--------------------------------------------------------------------------------------------------------------------//

// BOOL WINAPI GetPhysicallyInstalledSystemMemory(_Out_ PULONGLONG TotalMemoryInKilobytes);
function LibKernel32.GetPhysicallyInstalledSystemMemory(out memInKB: UInt64): WINBOOL; static; external 'GetPhysicallyInstalledSystemMemory@Kernel32.dll' + WINAPI_CC;

// HANDLE WINAPI GetProcessHeap(void);
function LibKernel32.GetProcessHeap(): HANDLE; static; external 'GetProcessHeap@Kernel32.dll' + WINAPI_CC;

// DWORD WINAPI GetProcessHeaps(_In_ DWORD NumberOfHeaps,_Out_ PHANDLE ProcessHeaps);
function LibKernel32.GetProcessHeaps(numHeaps:DWORD; ProcessHeaps: ^HANDLE): DWORD; static; external 'GetProcessHeaps@Kernel32.dll' + WINAPI_CC;

// LPVOID WINAPI VirtualAlloc(_In_opt_ LPVOID lpAddress, _In_ SIZE_T dwSize, _In_ DWORD flAllocationType, _In_ DWORD flProtect);
function LibKernel32.VirtualAlloc(Address: Pointer; Size: SizeUInt; flAllocationType, flProtect: DWORD): Pointer; static; external 'VirtualAlloc@Kernel32.dll' + WINAPI_CC;

// LPVOID WINAPI VirtualAllocEx(_In_ HANDLE hProcess, _In_opt_ LPVOID lpAddress, _In_ SIZE_T dwSize,_In_ DWORD flAllocationType,_In_ DWORD flProtect);
function LibKernel32.VirtualAllocEx(hProc: HANDLE; Address: Pointer; Size: SizeUInt; flAllocationType, flProtect: DWORD): Pointer; static; external 'VirtualAllocEx@Kernel32.dll' + WINAPI_CC;

// LPVOID WINAPI VirtualAllocExNuma(_In_ HANDLE hProcess,_In_opt_ LPVOID lpAddress,_In_ SIZE_T dwSize,_In_ DWORD  flAllocationType, _In_ DWORD  flProtect, _In_ DWORD nndPreferred);
function LibKernel32.VirtualAllocExNuma(hProc: HANDLE; Address: Pointer; Size: SizeUInt; flAllocationType, flProtect, nndPreferred: DWORD): Pointer; static; external 'VirtualAllocExNuma@Kernel32.dll' + WINAPI_CC;

// BOOL WINAPI VirtualFree(_In_ LPVOID lpAddress,_In_ SIZE_T dwSize,_In_ DWORD dwFreeType);
function LibKernel32.VirtualFree(Address: Pointer; Size: SizeUInt; dwFreeType: DWORD): WINBOOL; static; external 'VirtualFree@Kernel32.dll' + WINAPI_CC;

// BOOL WINAPI VirtualFreeEx(_In_ HANDLE hProcess,_In_ LPVOID lpAddress,_In_ SIZE_T dwSize,_In_ DWORD dwFreeType);
function LibKernel32.VirtualFreeEx(hProc: HANDLE; Address: Pointer; Size: SizeUInt; dwFreeType: DWORD): WINBOOL; static; external 'VirtualFreeEx@Kernel32.dll' + WINAPI_CC;

// BOOL WINAPI VirtualLock(_In_ LPVOID lpAddress,_In_ SIZE_T dwSize);
function LibKernel32.VirtualLock(Address: Pointer; Size: SizeUInt): WINBOOL; static; external 'VirtualLock@Kernel32.dll' + WINAPI_CC;

// BOOL WINAPI VirtualProtect(_In_ LPVOID lpAddress, _In_  SIZE_T dwSize, _In_  DWORD  flNewProtect, _Out_ PDWORD lpflOldProtect);
function LibKernel32.VirtualProtect(Address: Pointer; Size: SizeUInt; flNewProtect: DWORD; out flOldProtect: DWORD): WINBOOL; static; external 'VirtualProtect@Kernel32.dll' + WINAPI_CC;

// BOOL WINAPI VirtualProtectEx(_In_ HANDLE hProcess, _In_ LPVOID lpAddress, _In_ SIZE_T dwSize, _In_ DWORD  flNewProtect, _Out_ PDWORD lpflOldProtect);
function LibKernel32.VirtualProtectEx(hProc: HANDLE; Address: Pointer; Size: SizeUInt; flNewProtect: DWORD; out flOldProtect: DWORD): WINBOOL; static; external 'VirtualProtectEx@Kernel32.dll' + WINAPI_CC;

// SIZE_T WINAPI VirtualQuery(_In_opt_ LPCVOID lpAddress, _Out_ PMEMORY_BASIC_INFORMATION lpBuffer, _In_ SIZE_T dwLength);
function LibKernel32.VirtualQuery(Address: Pointer; out buffer: MEMORY_BASIC_INFORMATION; dwLength: SizeUInt): SizeUInt; static; external 'VirtualQuery@Kernel32.dll' + WINAPI_CC;

// SIZE_T WINAPI VirtualQueryEx(_In_ HANDLE hProcess,_In_opt_ LPCVOID lpAddress,_Out_ PMEMORY_BASIC_INFORMATION lpBuffer, _In_ SIZE_T dwLength);
function LibKernel32.VirtualQueryEx(hProc: HANDLE; Address: Pointer; out buffer: MEMORY_BASIC_INFORMATION; dwLength: SizeUInt): SizeUInt; static; external 'VirtualQueryEx@Kernel32.dll' + WINAPI_CC;

// BOOL WINAPI VirtualUnlock(_In_ LPVOID lpAddress, _In_ SIZE_T dwSize);
function LibKernel32.VirtualUnlock(Address: Pointer; dwSize: SizeUInt): WINBOOL; static; external 'VirtualUnlock@Kernel32.dll' + WINAPI_CC;



//--------------------------------------------------------------------------------------------------------------------\\
//-----|  Basic Debugging  >  Debugging Reference  >  Debugging Functions  |------------------------------------------||
//--------------------------------------------------------------------------------------------------------------------//

// BOOL WINAPI ReadProcessMemory(_In_ HANDLE hProcess, _In_ LPCVOID lpBaseAddress, _Out_ LPVOID lpBuffer, _In_ SIZE_T nSize, _Out_ SIZE_T *lpNumberOfBytesRead);
function LibKernel32.ReadProcessMemory(hProc: HANDLE; baseAddr: Pointer; buffer: Pointer; nSize: SizeUInt; out numBytesRead: SizeUInt): WINBOOL; static; external 'ReadProcessMemory@Kernel32.dll' + WINAPI_CC;

// BOOL WINAPI WriteProcessMemory(_In_ HANDLE hProcess, _In_ LPVOID lpBaseAddress, _In_ LPCVOID lpBuffer, _In_ SIZE_T nSize, _Out_ SIZE_T *lpNumberOfBytesWritten);
function LibKernel32.WriteProcessMemory(hProc: HANDLE; baseAddr: Pointer; buffer: Pointer; nSize: SizeUInt; out numBytesWritten: SizeUInt): WINBOOL; static; external 'WriteProcessMemory@Kernel32.dll' + WINAPI_CC;

