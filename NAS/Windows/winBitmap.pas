{$include_once WinTypes.pas}
//--------------------------------------------------------------------------------------------------------------------\\
//-----| Bitmaps  >  Bitmap Reference  >  Bitmap Functions  |---------------------------------------------------------||
//--------------------------------------------------------------------------------------------------------------------//

// BOOL BitBlt( _In_HDC hdcDest, _In_int nXDest, _In_int nYDest, _In_int nWidth, _In_int nHeight, _In_HDC hdcSrc, _In_int nXSrc, _In_int nYSrc, _In_DWORD dwRop); [@Gdi32.dll]
function LibGdi32.BitBlt(dcDest:HDC; nXDest, nYDest, nWidth, nHeight:Int32; hdcSrc:HDC; nXSrc, nYSrc:Int32; dwRop:DWord): BOOL; static; external 'BitBlt@gdi32.dll' + WINAPI_CC;

// HBITMAP CreateBitmap( _In_int nWidth, _In_int nHeight, _In_UINT cPlanes, _In_UINT cBitsPerPel, _In_const VOID *lpvBits); [@Gdi32.dll]
function LibGdi32.CreateBitmap(nWidth, nHeight:Int32; cPlanes, cBitsPerPel:UInt32; lpvBits:Pointer): HBITMAP; static; external 'CreateBitmap@gdi32.dll' + WINAPI_CC;

// HBITMAP CreateBitmapIndirect(_In_ const BITMAP *lpbm); [@Gdi32.dll]
function LibGdi32.CreateBitmapIndirect(var bm: BITMAP): HBITMAP; static; external 'CreateBitmapIndirect@gdi32.dll' + WINAPI_CC;

// HBITMAP CreateCompatibleBitmap( _In_HDC hdc, _In_int nWidth, _In_int nHeight); [@Gdi32.dll]
function LibGdi32.CreateCompatibleBitmap(dc: HDC; nWidth, nHeight:Int32): HBITMAP; static; external 'CreateCompatibleBitmap@gdi32.dll' + WINAPI_CC;

// HBITMAP CreateDIBitmap( _In_HDC hdc, _In_const BITMAPINFOHEADER *lpbmih, _In_DWORD fdwInit, _In_const VOID *lpbInit, _In_const BITMAPINFO *lpbmi, _In_UINT fuUsage); [@Gdi32.dll]
function LibGdi32.CreateDIBitmap(dc:HDC; var lpbmih:BITMAPINFOHEADER; fdwInit:DWord; lpbInit:Pointer; var lpbmi:BITMAPINFO; fuUsage:UInt32): HBITMAP; static; external 'CreateDIBitmap@gdi32.dll' + WINAPI_CC;

// HBITMAP CreateDIBSection( _In_HDC hdc, _In_const BITMAPINFO *pbmi, _In_UINT iUsage, _Out_VOID **ppvBits, _In_HANDLE hSection, _In_DWORD dwOffset); [@Gdi32.dll]
function LibGdi32.CreateDIBSection(dc:HDC; var pbmi:BITMAPINFO; iUsage:UInt32; var ppvBits:Pointer; hSection:HANDLE; dwOffset:DWORD): HBITMAP; static; external 'CreateDIBSection@gdi32.dll' + WINAPI_CC;

// HBITMAP CreateDiscardableBitmap( _In_HDC hdc, _In_int nWidth, _In_int nHeight); [@Gdi32.dll]
function LibGdi32.CreateDiscardableBitmap(dc:HDC; nWidth:longint; nHeight:longint): HBITMAP; static; external 'CreateDiscardableBitmap@gdi32.dll' + WINAPI_CC;

// BOOL ExtFloodFill( _In_HDC hdc, _In_int nXStart, _In_int nYStart, _In_COLORREF crColor, _In_UINT fuFillType); [@Gdi32.dll]
function LibGdi32.ExtFloodFill(dc: HDC; nXstart, nYstart:Int32; crColor:COLORREF; fuFillType: UInt32): BOOL; static; external 'ExtFloodFill@gdi32.dll' + WINAPI_CC;

// BOOL FloodFill( _In_HDC hdc, _In_int nXStart, _In_int nYStart, _In_COLORREF crFill); [@Gdi32.dll]
function LibGdi32.FloodFill(dc: HDC; nXstart, nYstart:Int32; crColor:COLORREF): BOOL; static; external 'FloodFill@gdi32.dll' + WINAPI_CC;

// BOOL GdiAlphaBlend( _In_HDC hdcDest, _In_int xoriginDest, _In_int yoriginDest, _In_int wDest, _In_int hDest, _In_HDC hdcSrc, _In_int xoriginSrc, _In_int yoriginSrc, _In_int wSrc, _In_int hSrc, _In_BLENDFUNCTION ftn); [@Gdi32.dll]
function LibGdi32.GdiAlphaBlend(hdcDest: HDC; xoriginDest, yoriginDest, wDest, hDest:Int32; hdcSrc:HDC; xoriginSrc, yoriginSrc, wSrc, hSrc:INt32; ftn:TBlendFunction): BOOL; static; external 'GdiAlphaBlend@gdi32.dll' + WINAPI_CC;

// BOOL GdiGradientFill( _In_HDC hdc, _In_PTRIVERTEX pVertex, _In_ULONG dwNumVertex, _In_PVOID pMesh, _In_ULONG dwNumMesh, _In_ULONG dwMode); [@Gdi32.dll]
//function LibGdi32.GdiGradientFill(dc: HDC): BOOL; static; external 'GdiGradientFill@gdi32.dll' + WINAPI_CC;

// BOOL GdiTransparentBlt( _In_HDC hdcDest, _In_int xoriginDest, _In_int yoriginDest, _In_int wDest, _In_int hDest, _In_HDC hdcSrc, _In_int xoriginSrc, _In_int yoriginSrc, _In_int wSrc, _In_int hSrc, _In_UINT crTransparent); [@Gdi32.dll]
function LibGdi32.GdiTransparentBlt(hdcDest:HDC; xoriginDest, yoriginDest, wDest, hDest:Int32; hdcSrc:HDC; xoriginSrc, yoriginSrc, wSrc, hSrc:Int32; crTransparent:UInt32): BOOL; static; external 'GdiTransparentBlt@gdi32.dll' + WINAPI_CC;

// LONG GetBitmapBits( _In_HBITMAP hbmp, _In_LONG cbBuffer, _Out_LPVOID lpvBits); [@Gdi32.dll]
function LibGdi32.GetBitmapBits(bmp: HBITMAP; cbBuffer:LongInt; lpvBits:Pointer): LongInt; static; external 'GetBitmapBits@gdi32.dll' + WINAPI_CC;

// BOOL GetBitmapDimensionEx( _In_HBITMAP hBitmap, _Out_LPSIZE lpDimension); [@Gdi32.dll]
function LibGdi32.GetBitmapDimensionEx(bmp: HBITMAP; var size:TSizeStruct): BOOL; static; external 'GetBitmapDimensionEx@gdi32.dll' + WINAPI_CC;

// UINT GetDIBColorTable( _In_HDC hdc, _In_UINT uStartIndex, _In_UINT cEntries, _Out_RGBQUAD *pColors); [@Gdi32.dll]
function LibGdi32.GetDIBColorTable(dc: HDC; uStartIndex, cEntries:UInt32; var _para4:TRGB32): UInt32; static; external 'GetDIBColorTable@gdi32.dll' + WINAPI_CC;

// int GetDIBits( _In_HDC hdc, _In_HBITMAP hbmp, _In_UINT uStartScan, _In_UINT cScanLines, _Out_LPVOID lpvBits, _Inout_LPBITMAPINFO lpbi, _In_UINT uUsage); [@Gdi32.dll]
function LibGdi32.GetDIBits(dc:HDC; hbmp:HBITMAP; uStartScan, cScanLines:UInt32; lpvBits:Pointer; lpbi:PBITMAPINFO; uUsage:UInt32): Int32; static; external 'GetDIBits@gdi32.dll' + WINAPI_CC;

// COLORREF GetPixel( _In_HDC hdc, _In_int nXPos, _In_int nYPos); [@Gdi32.dll]
function LibGdi32.GetPixel(dc:HDC; x,y:Int32): COLORREF; static; external 'GetPixel@gdi32.dll' + WINAPI_CC;

// int GetStretchBltMode( _In_HDC hdc); [@Gdi32.dll]
function LibGdi32.GetStretchBltMode(dc: HDC): Int32; static; external 'GetStretchBltMode@gdi32.dll' + WINAPI_CC;

// HBITMAP LoadBitmap( _In_HINSTANCE hInstance, _In_LPCTSTR lpBitmapName); [@User32.dll]
function LibUser32.LoadBitmap(hInstance: HInst; lpBitmapName:LPCWSTR): HBITMAP; static; external 'LoadBitmapW@user32.dll' + WINAPI_CC;

// BOOL MaskBlt( _In_HDC hdcDest, _In_int nXDest, _In_int nYDest, _In_int nWidth, _In_int nHeight, _In_HDC hdcSrc, _In_int nXSrc, _In_int nYSrc, _In_HBITMAP hbmMask, _In_int xMask, _In_int yMask, _In_DWORD dwRop); [@Gdi32.dll]
function LibGdi32.MaskBlt(_para1:HDC; nXDest, nYDest, nWidth, nHeight:Int32; hdcSrc:HDC; nXSrc, nYSrc:Int32; hbmMask:HBITMAP; xMask,yMask:Int32; dwRop:DWORD): BOOL; static; external 'MaskBlt@gdi32.dll' + WINAPI_CC;

// BOOL PlgBlt( _In_HDC hdcDest, _In_const POINT *lpPoint, _In_HDC hdcSrc, _In_int nXSrc, _In_int nYSrc, _In_int nWidth, _In_int nHeight, _In_HBITMAP hbmMask, _In_int xMask, _In_int yMask); [@Gdi32.dll]
function LibGdi32.PlgBlt(hdcDest: HDC; var pt:TPoint; hdcSrc:HDC; nXSrc, nYSrc, nWidth, nHeight:Int32; hbmMask:HBITMAP; xMask,yMask:Int32): BOOL; static; external 'PlgBlt@gdi32.dll' + WINAPI_CC;

// LONG SetBitmapBits( _In_HBITMAP hbmp, _In_DWORD cBytes, _In_const VOID *lpBits); [@Gdi32.dll]
function LibGdi32.SetBitmapBits(hbmp: HBITMAP; cBytes:DWord; lpBits:Pointer): Int32; static; external 'SetBitmapBits@gdi32.dll' + WINAPI_CC;

// BOOL SetBitmapDimensionEx( _In_HBITMAP hBitmap, _In_int nWidth, _In_int nHeight, _Out_LPSIZE lpSize); [@Gdi32.dll]
function LibGdi32.SetBitmapDimensionEx(hBitmap: HBITMAP; nWidth,nHeight:Int32; var size:TSizeStruct): BOOL; static; external 'SetBitmapDimensionEx@gdi32.dll' + WINAPI_CC;

// UINT SetDIBColorTable( _In_HDC hdc, _In_UINT uStartIndex, _In_UINT cEntries, _In_const RGBQUAD *pColors); [@Gdi32.dll]
function LibGdi32.SetDIBColorTable(dc:HDC; uStartIndex, cEntries:UInt32; var colors:TRGB32): UInt32; static; external 'SetDIBColorTable@gdi32.dll' + WINAPI_CC;

// int SetDIBits( _In_HDC hdc, _In_HBITMAP hbmp, _In_UINT uStartScan, _In_UINT cScanLines, _In_const VOID *lpvBits, _In_const BITMAPINFO *lpbmi, _In_UINT fuColorUse); [@Gdi32.dll]
function LibGdi32.SetDIBits(dc:HDC; hbmp:HBITMAP; uStartScan, cScanLines:UInt32; lpvBits:Pointer; lpbmi:PBITMAPINFO; fuColorUse:UInt32): Int32; static; external 'SetDIBits@gdi32.dll' + WINAPI_CC;

// int SetDIBitsToDevice( _In_HDC hdc, _In_int XDest, _In_int YDest, _In_DWORD dwWidth, _In_DWORD dwHeight, _In_int XSrc, _In_int YSrc, _In_UINT uStartScan, _In_UINT cScanLines, _In_const VOID *lpvBits, _In_const BITMAPINFO *lpbmi, _In_UINT fuColorUse); [@Gdi32.dll]
function LibGdi32.SetDIBitsToDevice(dc:HDC; XDest,YDest:Int32; dwWidth,dwHeight:DWord; XSrc,YSrc:Int32; uStartScan, cScanLines:UInt32; lpvBits:Pointer; var lpbmi:BITMAPINFO; fuColorUse:UInt32): Int32; static; external 'SetDIBitsToDevice@gdi32.dll' + WINAPI_CC;

// COLORREF SetPixel( _In_HDC hdc, _In_int X, _In_int Y, _In_COLORREF crColor); [@Gdi32.dll]
function LibGdi32.SetPixel(dc: HDC; x,y:Int32; crColor:COLORREF): COLORREF; static; external 'SetPixel@gdi32.dll' + WINAPI_CC;

// BOOL SetPixelV( _In_HDC hdc, _In_int X, _In_int Y, _In_COLORREF crColor); [@Gdi32.dll]
function LibGdi32.SetPixelV(dc: HDC; x,y:Int32; crColor:COLORREF): BOOL; static; external 'SetPixelV@gdi32.dll' + WINAPI_CC;

// int SetStretchBltMode( _In_HDC hdc, _In_int iStretchMode); [@Gdi32.dll]
function LibGdi32.SetStretchBltMode(dc: HDC; iStretchMode:Int32): Int32; static; external 'SetStretchBltMode@gdi32.dll' + WINAPI_CC;

// BOOL StretchBlt( _In_HDC hdcDest, _In_int nXOriginDest, _In_int nYOriginDest, _In_int nWidthDest, _In_int nHeightDest, _In_HDC hdcSrc, _In_int nXOriginSrc, _In_int nYOriginSrc, _In_int nWidthSrc, _In_int nHeightSrc, _In_DWORD dwRop); [@Gdi32.dll]
function LibGdi32.StretchBlt(hdcDest:HDC; nXOriginDest, nYOriginDest, nWidthDest, nHeightDest:Int32; hdcSrc:HDC; nXOriginSrc, nYOriginSrc, nWidthSrc, nHeightSrc:Int32; dwRop:DWord): BOOL; static; external 'StretchBlt@gdi32.dll' + WINAPI_CC;

// int StretchDIBits( _In_HDC hdc, _In_int XDest, _In_int YDest, _In_int nDestWidth, _In_int nDestHeight, _In_int XSrc, _In_int YSrc, _In_int nSrcWidth, _In_int nSrcHeight, _In_const VOID *lpBits, _In_const BITMAPINFO *lpBitsInfo, _In_UINT iUsage, _In_DWORD dwRop); [@Gdi32.dll]
function LibGdi32.StretchDIBits(dc:HDC; XDest,YDest, nDestWidth,nDestHeight, XSrc,YSrc, nSrcWidth,nSrcHeight:Int32; lpBits:Pointer; var lpBitsInfo:BITMAPINFO; iUsage:UInt32; dwRop:DWord): BOOL; static; external 'StretchDIBits@gdi32.dll' + WINAPI_CC;


(*
// BOOL AlphaBlend( _In_HDC hdcDest, _In_int xoriginDest, _In_int yoriginDest, _In_int wDest, _In_int hDest, _In_HDC hdcSrc, _In_int xoriginSrc, _In_int yoriginSrc, _In_int wSrc, _In_int hSrc, _In_BLENDFUNCTION ftn); [@Msimg32.dll]
function LibMsimg32.AlphaBlend(dc: HDC): BOOL; static; external 'AlphaBlend@msimg32.dll' + WINAPI_CC;

// BOOL GradientFill( _In_HDC hdc, _In_PTRIVERTEX pVertex, _In_ULONG nVertex, _In_PVOID pMesh, _In_ULONG nMesh, _In_ULONG ulMode); [@Msimg32.dll]
function LibMsimg32.GradientFill(dc: HDC): BOOL; static; external 'GradientFill@msimg32.dll' + WINAPI_CC;

// BOOL TransparentBlt( _In_HDC hdcDest, _In_int xoriginDest, _In_int yoriginDest, _In_int wDest, _In_int hDest, _In_HDC hdcSrc, _In_int xoriginSrc, _In_int yoriginSrc, _In_int wSrc, _In_int hSrc, _In_UINT crTransparent); [@Msimg32.dll]
function LibMsimg32.TransparentBlt(dc: HDC): BOOL; static; external 'TransparentBlt@msimg32.dll' + WINAPI_CC;
*)


//--------------------------------------------------------------------------------------------------------------------\\
//-----| Misc functions  |--------------------------------------------------------------------------------------------||
//--------------------------------------------------------------------------------------------------------------------//

// DWORD GetObjectType(_In_ HGDIOBJ h);
function LibGdi32.GetObjectType(h: HGDIOBJ): DWORD; static; external 'GetObjectType@gdi32.dll' + WINAPI_CC;

// int WINAPI ChoosePixelFormat(HDC hdc,const PIXELFORMATDESCRIPTOR *ppfd);
function LibGdi32.ChoosePixelFormat(dc: HDC; ppfd: ^PIXELFORMATDESCRIPTOR): Int32; static; external 'ChoosePixelFormat@gdi32.dll' + WINAPI_CC;

// int WINAPI GetPixelFormat(HDC hdc, PIXELFORMATDESCRIPTOR *ppfd);
function LibGdi32.GetPixelFormat(dc: HDC): Int32; static; external 'GetPixelFormat@gdi32.dll' + WINAPI_CC;

// BOOL WINAPI SetPixelFormat(HDC hdc, int iPixelFormat, PIXELFORMATDESCRIPTOR *ppfd);
function LibGdi32.SetPixelFormat(dc: HDC; iPixelFormat:Int32; ppfd: ^PIXELFORMATDESCRIPTOR): WINBOOL; static; external 'SetPixelFormat@gdi32.dll' + WINAPI_CC;

// int WINAPI DescribePixelFormat(HDC hdc,int iPixelFormat, UINT nBytes, LPPIXELFORMATDESCRIPTOR ppfd);
function LibGdi32.DescribePixelFormat(dc: HDC; iPixelFormat:Int32; nBytes:UInt32; ppfd: ^PIXELFORMATDESCRIPTOR): Int32; static; external 'DescribePixelFormat@gdi32.dll' + WINAPI_CC;











