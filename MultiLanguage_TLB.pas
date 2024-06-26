unit MultiLanguage_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 98336 $
// File generated on 03.03.2022 2:36:16 from Type Library described below.

// ************************************************************************  //
// Type Lib: mlang.tlb (1)
// LIBID: {275C23E0-3747-11D0-9FEA-00AA003F8646}
// LCID: 0
// Helpfile: 
// HelpString: MultiLanguage Object Model
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// Errors:
//   Hint: Symbol 'type' renamed to 'type_'
//   Error creating palette bitmap of (TCMLangString) : Server C:\Windows\system32\mlang.dll contains no icons
//   Error creating palette bitmap of (TCMLangConvertCharset) : Server C:\Windows\system32\mlang.dll contains no icons
//   Error creating palette bitmap of (TCMultiLanguage) : Server C:\Windows\system32\mlang.dll contains no icons
// Cmdline:
//   tlibimp  -P mlang.tlb
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  MultiLanguageMajorVersion = 0;
  MultiLanguageMinorVersion = 2;

  LIBID_MultiLanguage: TGUID = '{275C23E0-3747-11D0-9FEA-00AA003F8646}';

  IID_IMLangString: TGUID = '{C04D65CE-B70D-11D0-B188-00AA0038C969}';
  IID_IMLangStringWStr: TGUID = '{C04D65D0-B70D-11D0-B188-00AA0038C969}';
  IID_IMLangStringAStr: TGUID = '{C04D65D2-B70D-11D0-B188-00AA0038C969}';
  IID_IMLangStringBufW: TGUID = '{D24ACD21-BA72-11D0-B188-00AA0038C969}';
  CLASS_CMLangString: TGUID = '{C04D65CF-B70D-11D0-B188-00AA0038C969}';
  IID_IMLangStringBufA: TGUID = '{D24ACD23-BA72-11D0-B188-00AA0038C969}';
  IID_IMLangConvertCharset: TGUID = '{D66D6F98-CDAA-11D0-B822-00C04FC9B31F}';
  CLASS_CMLangConvertCharset: TGUID = '{D66D6F99-CDAA-11D0-B822-00C04FC9B31F}';
  IID_IMultiLanguage: TGUID = '{275C23E1-3747-11D0-9FEA-00AA003F8646}';
  IID_IMLangCodePages: TGUID = '{359F3443-BD4A-11D0-B188-00AA0038C969}';
  IID_IEnumCodePage: TGUID = '{275C23E3-3747-11D0-9FEA-00AA003F8646}';
  IID_IEnumRfc1766: TGUID = '{3DC39D1D-C030-11D0-B81B-00C04FC9B31F}';
  IID_IMLangFontLink: TGUID = '{359F3441-BD4A-11D0-B188-00AA0038C969}';
  IID_IMLangLineBreakConsole: TGUID = '{F5BE2EE1-BFD7-11D0-B188-00AA0038C969}';
  IID_IMultiLanguage2: TGUID = '{DCCFC164-2B38-11D2-B7EC-00C04F8F5D9A}';
  IID_IMLangFontLink2: TGUID = '{DCCFC162-2B38-11D2-B7EC-00C04F8F5D9A}';
  IID_IEnumScript: TGUID = '{AE5F1430-388B-11D2-8380-00C04F8F5DA1}';
  IID_IMultiLanguage3: TGUID = '{4E5868AB-B157-4623-9ACC-6A1D9CAEBE04}';
  CLASS_CMultiLanguage: TGUID = '{275C23E2-3747-11D0-9FEA-00AA003F8646}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum tagMLSTR_FLAGS
type
  tagMLSTR_FLAGS = TOleEnum;
const
  MLSTR_READ = $00000001;
  MLSTR_WRITE = $00000002;

// Constants for enum tagMIMECONTF
type
  tagMIMECONTF = TOleEnum;
const
  MIMECONTF_MAILNEWS = $00000001;
  MIMECONTF_BROWSER = $00000002;
  MIMECONTF_MINIMAL = $00000004;
  MIMECONTF_IMPORT = $00000008;
  MIMECONTF_SAVABLE_MAILNEWS = $00000100;
  MIMECONTF_SAVABLE_BROWSER = $00000200;
  MIMECONTF_EXPORT = $00000400;
  MIMECONTF_PRIVCONVERTER = $00010000;
  MIMECONTF_VALID = $00020000;
  MIMECONTF_VALID_NLS = $00040000;
  MIMECONTF_MIME_IE4 = $10000000;
  MIMECONTF_MIME_LATEST = $20000000;
  MIMECONTF_MIME_REGISTRY = $40000000;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IMLangString = interface;
  IMLangStringWStr = interface;
  IMLangStringAStr = interface;
  IMLangStringBufW = interface;
  IMLangStringBufA = interface;
  IMLangConvertCharset = interface;
  IMultiLanguage = interface;
  IMLangCodePages = interface;
  IEnumCodePage = interface;
  IEnumRfc1766 = interface;
  IMLangFontLink = interface;
  IMLangLineBreakConsole = interface;
  IMultiLanguage2 = interface;
  IMLangFontLink2 = interface;
  IEnumScript = interface;
  IMultiLanguage3 = interface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  CMLangString = IMLangString;
  CMLangConvertCharset = IMLangConvertCharset;
  CMultiLanguage = IMultiLanguage;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  wireHDC = ^_RemotableHandle; 
  wireHFONT = ^_RemotableHandle; 
  wireHWND = ^_RemotableHandle; 
  PUserType1 = ^TGUID; {*}
  PWord1 = ^Word; {*}
  PShortint1 = ^Shortint; {*}
  PByte1 = ^Byte; {*}
  PSYSUINT1 = ^SYSUINT; {*}

  tagMIMECPINFO = record
    dwFlags: LongWord;
    uiCodePage: SYSUINT;
    uiFamilyCodePage: SYSUINT;
    wszDescription: array[0..63] of Word;
    wszWebCharset: array[0..49] of Word;
    wszHeaderCharset: array[0..49] of Word;
    wszBodyCharset: array[0..49] of Word;
    wszFixedWidthFont: array[0..31] of Word;
    wszProportionalFont: array[0..31] of Word;
    bGDICharset: Byte;
  end;

  tagMIMECSETINFO = record
    uiCodePage: SYSUINT;
    uiInternetEncoding: SYSUINT;
    wszCharset: array[0..49] of Word;
  end;

  tagRFC1766INFO = record
    lcid: LongWord;
    wszRfc1766: array[0..5] of Word;
    wszLocaleName: array[0..31] of Word;
  end;


  __MIDL_IWinTypes_0009 = record
    case Integer of
      0: (hInproc: Integer);
      1: (hRemote: Integer);
  end;

  _RemotableHandle = record
    fContext: Integer;
    u: __MIDL_IWinTypes_0009;
  end;


{$ALIGN 8}
  _LARGE_INTEGER = record
    QuadPart: Int64;
  end;

  _ULARGE_INTEGER = record
    QuadPart: Largeuint;
  end;

{$ALIGN 4}
  _FILETIME = record
    dwLowDateTime: LongWord;
    dwHighDateTime: LongWord;
  end;

{$ALIGN 8}
  tagSTATSTG = record
    pwcsName: PWideChar;
    type_: LongWord;
    cbSize: _ULARGE_INTEGER;
    mtime: _FILETIME;
    ctime: _FILETIME;
    atime: _FILETIME;
    grfMode: LongWord;
    grfLocksSupported: LongWord;
    clsid: TGUID;
    grfStateBits: LongWord;
    reserved: LongWord;
  end;

{$ALIGN 4}
  tagDetectEncodingInfo = record
    nLangID: SYSUINT;
    nCodePage: SYSUINT;
    nDocPercent: SYSINT;
    nConfidence: SYSINT;
  end;


  tagSCRIPTINFO = record
    ScriptId: Byte;
    uiCodePage: SYSUINT;
    wszDescription: array[0..47] of Word;
    wszFixedWidthFont: array[0..31] of Word;
    wszProportionalFont: array[0..31] of Word;
  end;

{$ALIGN 2}
  tagUNICODERANGE = record
    wcFrom: Word;
    wcTo: Word;
  end;

{$ALIGN 8}
  tagSCRIPFONTINFO = record
    scripts: Int64;
    wszFont: array[0..31] of Word;
  end;


// *********************************************************************//
// Interface: IMLangString
// Flags:     (0)
// GUID:      {C04D65CE-B70D-11D0-B188-00AA0038C969}
// *********************************************************************//
  IMLangString = interface(IUnknown)
    ['{C04D65CE-B70D-11D0-B188-00AA0038C969}']
    function Sync(fNoAccess: Integer): HResult; stdcall;
    function GetLength(out plLen: Integer): HResult; stdcall;
    function SetMLStr(lDestPos: Integer; lDestLen: Integer; const pSrcMLStr: IUnknown; 
                      lSrcPos: Integer; lSrcLen: Integer): HResult; stdcall;
    function GetMLStr(lSrcPos: Integer; lSrcLen: Integer; const pUnkOuter: IUnknown; 
                      dwClsContext: LongWord; var piid: TGUID; out ppDestMLStr: IUnknown; 
                      out plDestPos: Integer; out plDestLen: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IMLangStringWStr
// Flags:     (0)
// GUID:      {C04D65D0-B70D-11D0-B188-00AA0038C969}
// *********************************************************************//
  IMLangStringWStr = interface(IMLangString)
    ['{C04D65D0-B70D-11D0-B188-00AA0038C969}']
    function SetWStr(lDestPos: Integer; lDestLen: Integer; pszSrc: PWideChar; cchSrc: Integer; 
                     out pcchActual: Integer; out plActualLen: Integer): HResult; stdcall;
    function SetStrBufW(lDestPos: Integer; lDestLen: Integer; const pSrcBuf: IMLangStringBufW; 
                        out pcchActual: Integer; out plActualLen: Integer): HResult; stdcall;
    function GetWStr(lSrcPos: Integer; lSrcLen: Integer; pszDest: PWideChar; cchDest: Integer; 
                     out pcchActual: Integer; out plActualLen: Integer): HResult; stdcall;
    function GetStrBufW(lSrcPos: Integer; lSrcMaxLen: Integer; out ppDestBuf: IMLangStringBufW; 
                        out plDestLen: Integer): HResult; stdcall;
    function LockWStr(lSrcPos: Integer; lSrcLen: Integer; lFlags: Integer; cchRequest: Integer; 
                      out ppszDest: PWideChar; out pcchDest: Integer; out plDestLen: Integer): HResult; stdcall;
    function UnlockWStr(pszSrc: PWideChar; cchSrc: Integer; out pcchActual: Integer; 
                        out plActualLen: Integer): HResult; stdcall;
    function SetLocale(lDestPos: Integer; lDestLen: Integer; locale: LongWord): HResult; stdcall;
    function GetLocale(lSrcPos: Integer; lSrcMaxLen: Integer; out plocale: LongWord; 
                       out plLocalePos: Integer; out plLocaleLen: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IMLangStringAStr
// Flags:     (0)
// GUID:      {C04D65D2-B70D-11D0-B188-00AA0038C969}
// *********************************************************************//
  IMLangStringAStr = interface(IMLangString)
    ['{C04D65D2-B70D-11D0-B188-00AA0038C969}']
    function SetAStr(lDestPos: Integer; lDestLen: Integer; uCodePage: SYSUINT; pszSrc: PAnsiChar; 
                     cchSrc: Integer; out pcchActual: Integer; out plActualLen: Integer): HResult; stdcall;
    function SetStrBufA(lDestPos: Integer; lDestLen: Integer; uCodePage: SYSUINT; 
                        const pSrcBuf: IMLangStringBufA; out pcchActual: Integer; 
                        out plActualLen: Integer): HResult; stdcall;
    function GetAStr(lSrcPos: Integer; lSrcLen: Integer; uCodePageIn: SYSUINT; 
                     out puCodePageOut: SYSUINT; pszDest: PAnsiChar; cchDest: Integer; 
                     out pcchActual: Integer; out plActualLen: Integer): HResult; stdcall;
    function GetStrBufA(lSrcPos: Integer; lSrcMaxLen: Integer; out puDestCodePage: SYSUINT; 
                        out ppDestBuf: IMLangStringBufA; out plDestLen: Integer): HResult; stdcall;
    function LockAStr(lSrcPos: Integer; lSrcLen: Integer; lFlags: Integer; uCodePageIn: SYSUINT; 
                      cchRequest: Integer; out puCodePageOut: SYSUINT; out ppszDest: PAnsiChar; 
                      out pcchDest: Integer; out plDestLen: Integer): HResult; stdcall;
    function UnlockAStr(pszSrc: PAnsiChar; cchSrc: Integer; out pcchActual: Integer; 
                        out plActualLen: Integer): HResult; stdcall;
    function SetLocale(lDestPos: Integer; lDestLen: Integer; locale: LongWord): HResult; stdcall;
    function GetLocale(lSrcPos: Integer; lSrcMaxLen: Integer; out plocale: LongWord; 
                       out plLocalePos: Integer; out plLocaleLen: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IMLangStringBufW
// Flags:     (0)
// GUID:      {D24ACD21-BA72-11D0-B188-00AA0038C969}
// *********************************************************************//
  IMLangStringBufW = interface(IUnknown)
    ['{D24ACD21-BA72-11D0-B188-00AA0038C969}']
    function GetStatus(out plFlags: Integer; out pcchBuf: Integer): HResult; stdcall;
    function LockBuf(cchOffset: Integer; cchMaxLock: Integer; out ppszBuf: PWord1; 
                     out pcchBuf: Integer): HResult; stdcall;
    function UnlockBuf(var pszBuf: Word; cchOffset: Integer; cchWrite: Integer): HResult; stdcall;
    function Insert(cchOffset: Integer; cchMaxInsert: Integer; out pcchActual: Integer): HResult; stdcall;
    function Delete(cchOffset: Integer; cchDelete: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IMLangStringBufA
// Flags:     (0)
// GUID:      {D24ACD23-BA72-11D0-B188-00AA0038C969}
// *********************************************************************//
  IMLangStringBufA = interface(IUnknown)
    ['{D24ACD23-BA72-11D0-B188-00AA0038C969}']
    function GetStatus(out plFlags: Integer; out pcchBuf: Integer): HResult; stdcall;
    function LockBuf(cchOffset: Integer; cchMaxLock: Integer; out ppszBuf: PShortint1; 
                     out pcchBuf: Integer): HResult; stdcall;
    function UnlockBuf(var pszBuf: Shortint; cchOffset: Integer; cchWrite: Integer): HResult; stdcall;
    function Insert(cchOffset: Integer; cchMaxInsert: Integer; out pcchActual: Integer): HResult; stdcall;
    function Delete(cchOffset: Integer; cchDelete: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IMLangConvertCharset
// Flags:     (0)
// GUID:      {D66D6F98-CDAA-11D0-B822-00C04FC9B31F}
// *********************************************************************//
  IMLangConvertCharset = interface(IUnknown)
    ['{D66D6F98-CDAA-11D0-B822-00C04FC9B31F}']
    function Initialize(uiSrcCodePage: SYSUINT; uiDstCodePage: SYSUINT; dwProperty: LongWord): HResult; stdcall;
    function GetSourceCodePage(out puiSrcCodePage: SYSUINT): HResult; stdcall;
    function GetDestinationCodePage(out puiDstCodePage: SYSUINT): HResult; stdcall;
    function GetProperty(out pdwProperty: LongWord): HResult; stdcall;
    function DoConversion(var pSrcStr: Byte; var pcSrcSize: SYSUINT; out pDstStr: Byte; 
                          var pcDstSize: SYSUINT): HResult; stdcall;
    function DoConversionToUnicode(var pSrcStr: Shortint; var pcSrcSize: SYSUINT; 
                                   out pDstStr: Word; var pcDstSize: SYSUINT): HResult; stdcall;
    function DoConversionFromUnicode(var pSrcStr: Word; var pcSrcSize: SYSUINT; 
                                     out pDstStr: Shortint; var pcDstSize: SYSUINT): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IMultiLanguage
// Flags:     (0)
// GUID:      {275C23E1-3747-11D0-9FEA-00AA003F8646}
// *********************************************************************//
  IMultiLanguage = interface(IUnknown)
    ['{275C23E1-3747-11D0-9FEA-00AA003F8646}']
    function GetNumberOfCodePageInfo(out pcCodePage: SYSUINT): HResult; stdcall;
    function GetCodePageInfo(uiCodePage: SYSUINT; out pCodePageInfo: tagMIMECPINFO): HResult; stdcall;
    function GetFamilyCodePage(uiCodePage: SYSUINT; out puiFamilyCodePage: SYSUINT): HResult; stdcall;
    function EnumCodePages(grfFlags: LongWord; out ppEnumCodePage: IEnumCodePage): HResult; stdcall;
    function GetCharsetInfo(const Charset: WideString; out pCharsetInfo: tagMIMECSETINFO): HResult; stdcall;
    function IsConvertible(dwSrcEncoding: LongWord; dwDstEncoding: LongWord): HResult; stdcall;
    function ConvertString(var pdwMode: LongWord; dwSrcEncoding: LongWord; dwDstEncoding: LongWord; 
                           var pSrcStr: Byte; var pcSrcSize: SYSUINT; out pDstStr: Byte; 
                           var pcDstSize: SYSUINT): HResult; stdcall;
    function ConvertStringToUnicode(var pdwMode: LongWord; dwEncoding: LongWord; 
                                    var pSrcStr: Shortint; var pcSrcSize: SYSUINT; 
                                    out pDstStr: Word; var pcDstSize: SYSUINT): HResult; stdcall;
    function ConvertStringFromUnicode(var pdwMode: LongWord; dwEncoding: LongWord; 
                                      var pSrcStr: Word; var pcSrcSize: SYSUINT; 
                                      out pDstStr: Shortint; var pcDstSize: SYSUINT): HResult; stdcall;
    function ConvertStringReset: HResult; stdcall;
    function GetRfc1766FromLcid(locale: LongWord; out pbstrRfc1766: WideString): HResult; stdcall;
    function GetLcidFromRfc1766(out plocale: LongWord; const bstrRfc1766: WideString): HResult; stdcall;
    function EnumRfc1766(out ppEnumRfc1766: IEnumRfc1766): HResult; stdcall;
    function GetRfc1766Info(locale: LongWord; out pRfc1766Info: tagRFC1766INFO): HResult; stdcall;
    function CreateConvertCharset(uiSrcCodePage: SYSUINT; uiDstCodePage: SYSUINT; 
                                  dwProperty: LongWord; 
                                  out ppMLangConvertCharset: IMLangConvertCharset): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IMLangCodePages
// Flags:     (0)
// GUID:      {359F3443-BD4A-11D0-B188-00AA0038C969}
// *********************************************************************//
  IMLangCodePages = interface(IUnknown)
    ['{359F3443-BD4A-11D0-B188-00AA0038C969}']
    function GetCharCodePages(chSrc: Word; out pdwCodePages: LongWord): HResult; stdcall;
    function GetStrCodePages(var pszSrc: Word; cchSrc: Integer; dwPriorityCodePages: LongWord; 
                             out pdwCodePages: LongWord; out pcchCodePages: Integer): HResult; stdcall;
    function CodePageToCodePages(uCodePage: SYSUINT; out pdwCodePages: LongWord): HResult; stdcall;
    function CodePagesToCodePage(dwCodePages: LongWord; uDefaultCodePage: SYSUINT; 
                                 out puCodePage: SYSUINT): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IEnumCodePage
// Flags:     (0)
// GUID:      {275C23E3-3747-11D0-9FEA-00AA003F8646}
// *********************************************************************//
  IEnumCodePage = interface(IUnknown)
    ['{275C23E3-3747-11D0-9FEA-00AA003F8646}']
    function Clone(out ppEnum: IEnumCodePage): HResult; stdcall;
    function Next(celt: LongWord; out rgelt: tagMIMECPINFO; out pceltFetched: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IEnumRfc1766
// Flags:     (0)
// GUID:      {3DC39D1D-C030-11D0-B81B-00C04FC9B31F}
// *********************************************************************//
  IEnumRfc1766 = interface(IUnknown)
    ['{3DC39D1D-C030-11D0-B81B-00C04FC9B31F}']
    function Clone(out ppEnum: IEnumRfc1766): HResult; stdcall;
    function Next(celt: LongWord; out rgelt: tagRFC1766INFO; out pceltFetched: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IMLangFontLink
// Flags:     (0)
// GUID:      {359F3441-BD4A-11D0-B188-00AA0038C969}
// *********************************************************************//
  IMLangFontLink = interface(IMLangCodePages)
    ['{359F3441-BD4A-11D0-B188-00AA0038C969}']
    function GetFontCodePages(var hDC: _RemotableHandle; var hFont: _RemotableHandle; 
                              out pdwCodePages: LongWord): HResult; stdcall;
    function MapFont(var hDC: _RemotableHandle; dwCodePages: LongWord; 
                     var hSrcFont: _RemotableHandle; out phDestFont: wireHFONT): HResult; stdcall;
    function ReleaseFont(var hFont: _RemotableHandle): HResult; stdcall;
    function ResetFontMapping: HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IMLangLineBreakConsole
// Flags:     (0)
// GUID:      {F5BE2EE1-BFD7-11D0-B188-00AA0038C969}
// *********************************************************************//
  IMLangLineBreakConsole = interface(IUnknown)
    ['{F5BE2EE1-BFD7-11D0-B188-00AA0038C969}']
    function BreakLineML(const pSrcMLStr: IMLangString; lSrcPos: Integer; lSrcLen: Integer; 
                         cMinColumns: Integer; cMaxColumns: Integer; out plLineLen: Integer; 
                         out plSkipLen: Integer): HResult; stdcall;
    function BreakLineW(locale: LongWord; var pszSrc: Word; cchSrc: Integer; cMaxColumns: Integer; 
                        out pcchLine: Integer; out pcchSkip: Integer): HResult; stdcall;
    function BreakLineA(locale: LongWord; uCodePage: SYSUINT; var pszSrc: Shortint; 
                        cchSrc: Integer; cMaxColumns: Integer; out pcchLine: Integer; 
                        out pcchSkip: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IMultiLanguage2
// Flags:     (0)
// GUID:      {DCCFC164-2B38-11D2-B7EC-00C04F8F5D9A}
// *********************************************************************//
  IMultiLanguage2 = interface(IUnknown)
    ['{DCCFC164-2B38-11D2-B7EC-00C04F8F5D9A}']
    function GetNumberOfCodePageInfo(out pcCodePage: SYSUINT): HResult; stdcall;
    function GetCodePageInfo(uiCodePage: SYSUINT; LangId: Word; out pCodePageInfo: tagMIMECPINFO): HResult; stdcall;
    function GetFamilyCodePage(uiCodePage: SYSUINT; out puiFamilyCodePage: SYSUINT): HResult; stdcall;
    function EnumCodePages(grfFlags: LongWord; LangId: Word; out ppEnumCodePage: IEnumCodePage): HResult; stdcall;
    function GetCharsetInfo(const Charset: WideString; out pCharsetInfo: tagMIMECSETINFO): HResult; stdcall;
    function IsConvertible(dwSrcEncoding: LongWord; dwDstEncoding: LongWord): HResult; stdcall;
    function ConvertString(var pdwMode: LongWord; dwSrcEncoding: LongWord; dwDstEncoding: LongWord; 
                           var pSrcStr: Byte; var pcSrcSize: SYSUINT; out pDstStr: Byte; 
                           var pcDstSize: SYSUINT): HResult; stdcall;
    function ConvertStringToUnicode(var pdwMode: LongWord; dwEncoding: LongWord; 
                                    var pSrcStr: Shortint; var pcSrcSize: SYSUINT; 
                                    out pDstStr: Word; var pcDstSize: SYSUINT): HResult; stdcall;
    function ConvertStringFromUnicode(var pdwMode: LongWord; dwEncoding: LongWord; 
                                      var pSrcStr: Word; var pcSrcSize: SYSUINT; 
                                      out pDstStr: Shortint; var pcDstSize: SYSUINT): HResult; stdcall;
    function ConvertStringReset: HResult; stdcall;
    function GetRfc1766FromLcid(locale: LongWord; out pbstrRfc1766: WideString): HResult; stdcall;
    function GetLcidFromRfc1766(out plocale: LongWord; const bstrRfc1766: WideString): HResult; stdcall;
    function EnumRfc1766(LangId: Word; out ppEnumRfc1766: IEnumRfc1766): HResult; stdcall;
    function GetRfc1766Info(locale: LongWord; LangId: Word; out pRfc1766Info: tagRFC1766INFO): HResult; stdcall;
    function CreateConvertCharset(uiSrcCodePage: SYSUINT; uiDstCodePage: SYSUINT; 
                                  dwProperty: LongWord; 
                                  out ppMLangConvertCharset: IMLangConvertCharset): HResult; stdcall;
    function ConvertStringInIStream(var pdwMode: LongWord; dwFlag: LongWord; var lpFallBack: Word; 
                                    dwSrcEncoding: LongWord; dwDstEncoding: LongWord; 
                                    const pstmIn: IStream; const pstmOut: IStream): HResult; stdcall;
    function ConvertStringToUnicodeEx(var pdwMode: LongWord; dwEncoding: LongWord; 
                                      var pSrcStr: Shortint; var pcSrcSize: SYSUINT; 
                                      out pDstStr: Word; var pcDstSize: SYSUINT; dwFlag: LongWord; 
                                      var lpFallBack: Word): HResult; stdcall;
    function ConvertStringFromUnicodeEx(var pdwMode: LongWord; dwEncoding: LongWord; 
                                        var pSrcStr: Word; var pcSrcSize: SYSUINT; 
                                        out pDstStr: Shortint; var pcDstSize: SYSUINT; 
                                        dwFlag: LongWord; var lpFallBack: Word): HResult; stdcall;
    function DetectCodepageInIStream(dwFlag: LongWord; dwPrefWinCodePage: LongWord; 
                                     const pstmIn: IStream; out lpEncoding: tagDetectEncodingInfo; 
                                     var pnScores: SYSINT): HResult; stdcall;
    function DetectInputCodepage(dwFlag: LongWord; dwPrefWinCodePage: LongWord; 
                                 var pSrcStr: Shortint; var pcSrcSize: SYSINT; 
                                 out lpEncoding: tagDetectEncodingInfo; var pnScores: SYSINT): HResult; stdcall;
    function ValidateCodePage(uiCodePage: SYSUINT; var hwnd: _RemotableHandle): HResult; stdcall;
    function GetCodePageDescription(uiCodePage: SYSUINT; lcid: LongWord; lpWideCharStr: PWideChar; 
                                    cchWideChar: SYSINT): HResult; stdcall;
    function IsCodePageInstallable(uiCodePage: SYSUINT): HResult; stdcall;
    function SetMimeDBSource(dwSource: tagMIMECONTF): HResult; stdcall;
    function GetNumberOfScripts(out pnScripts: SYSUINT): HResult; stdcall;
    function EnumScripts(dwFlags: LongWord; LangId: Word; out ppEnumScript: IEnumScript): HResult; stdcall;
    function ValidateCodePageEx(uiCodePage: SYSUINT; var hwnd: _RemotableHandle; 
                                dwfIODControl: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IMLangFontLink2
// Flags:     (0)
// GUID:      {DCCFC162-2B38-11D2-B7EC-00C04F8F5D9A}
// *********************************************************************//
  IMLangFontLink2 = interface(IMLangCodePages)
    ['{DCCFC162-2B38-11D2-B7EC-00C04F8F5D9A}']
    function GetFontCodePages(var hDC: _RemotableHandle; var hFont: _RemotableHandle; 
                              out pdwCodePages: LongWord): HResult; stdcall;
    function ReleaseFont(var hFont: _RemotableHandle): HResult; stdcall;
    function ResetFontMapping: HResult; stdcall;
    function MapFont(var hDC: _RemotableHandle; dwCodePages: LongWord; chSrc: Word; 
                     out pFont: wireHFONT): HResult; stdcall;
    function GetFontUnicodeRanges(var hDC: _RemotableHandle; var puiRanges: SYSUINT; 
                                  out pUranges: tagUNICODERANGE): HResult; stdcall;
    function GetScriptFontInfo(sid: Byte; dwFlags: LongWord; var puiFonts: SYSUINT; 
                               out pScriptFont: tagSCRIPFONTINFO): HResult; stdcall;
    function CodePageToScriptID(uiCodePage: SYSUINT; out pSid: Byte): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IEnumScript
// Flags:     (0)
// GUID:      {AE5F1430-388B-11D2-8380-00C04F8F5DA1}
// *********************************************************************//
  IEnumScript = interface(IUnknown)
    ['{AE5F1430-388B-11D2-8380-00C04F8F5DA1}']
    function Clone(out ppEnum: IEnumScript): HResult; stdcall;
    function Next(celt: LongWord; out rgelt: tagSCRIPTINFO; out pceltFetched: LongWord): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Skip(celt: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IMultiLanguage3
// Flags:     (0)
// GUID:      {4E5868AB-B157-4623-9ACC-6A1D9CAEBE04}
// *********************************************************************//
  IMultiLanguage3 = interface(IMultiLanguage2)
    ['{4E5868AB-B157-4623-9ACC-6A1D9CAEBE04}']
    function DetectOutboundCodePage(dwFlags: LongWord; lpWideCharStr: PWideChar; 
                                    cchWideChar: SYSUINT; var puiPreferredCodePages: SYSUINT; 
                                    nPreferredCodePages: SYSUINT; 
                                    out puiDetectedCodePages: SYSUINT; 
                                    var pnDetectedCodePages: SYSUINT; lpSpecialChar: PWideChar): HResult; stdcall;
    function DetectOutboundCodePageInIStream(dwFlags: LongWord; const pStrIn: IStream; 
                                             var puiPreferredCodePages: SYSUINT; 
                                             nPreferredCodePages: SYSUINT; 
                                             out puiDetectedCodePages: SYSUINT; 
                                             var pnDetectedCodePages: SYSUINT; 
                                             lpSpecialChar: PWideChar): HResult; stdcall;
  end;

// *********************************************************************//
// The Class CoCMLangString provides a Create and CreateRemote method to          
// create instances of the default interface IMLangString exposed by              
// the CoClass CMLangString. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCMLangString = class
    class function Create: IMLangString;
    class function CreateRemote(const MachineName: string): IMLangString;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TCMLangString
// Help String      : MLangString Class
// Default Interface: IMLangString
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TCMLangString = class(TOleServer)
  private
    FIntf: IMLangString;
    function GetDefaultInterface: IMLangString;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IMLangString);
    procedure Disconnect; override;
    function Sync(fNoAccess: Integer): HResult;
    function GetLength(out plLen: Integer): HResult;
    function SetMLStr(lDestPos: Integer; lDestLen: Integer; const pSrcMLStr: IUnknown; 
                      lSrcPos: Integer; lSrcLen: Integer): HResult;
    function GetMLStr(lSrcPos: Integer; lSrcLen: Integer; const pUnkOuter: IUnknown; 
                      dwClsContext: LongWord; var piid: TGUID; out ppDestMLStr: IUnknown; 
                      out plDestPos: Integer; out plDestLen: Integer): HResult;
    property DefaultInterface: IMLangString read GetDefaultInterface;
  published
  end;

// *********************************************************************//
// The Class CoCMLangConvertCharset provides a Create and CreateRemote method to          
// create instances of the default interface IMLangConvertCharset exposed by              
// the CoClass CMLangConvertCharset. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCMLangConvertCharset = class
    class function Create: IMLangConvertCharset;
    class function CreateRemote(const MachineName: string): IMLangConvertCharset;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TCMLangConvertCharset
// Help String      : 
// Default Interface: IMLangConvertCharset
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TCMLangConvertCharset = class(TOleServer)
  private
    FIntf: IMLangConvertCharset;
    function GetDefaultInterface: IMLangConvertCharset;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IMLangConvertCharset);
    procedure Disconnect; override;
    function Initialize(uiSrcCodePage: SYSUINT; uiDstCodePage: SYSUINT; dwProperty: LongWord): HResult;
    function GetSourceCodePage(out puiSrcCodePage: SYSUINT): HResult;
    function GetDestinationCodePage(out puiDstCodePage: SYSUINT): HResult;
    function GetProperty(out pdwProperty: LongWord): HResult;
    function DoConversion(var pSrcStr: Byte; var pcSrcSize: SYSUINT; out pDstStr: Byte; 
                          var pcDstSize: SYSUINT): HResult;
    function DoConversionToUnicode(var pSrcStr: Shortint; var pcSrcSize: SYSUINT; 
                                   out pDstStr: Word; var pcDstSize: SYSUINT): HResult;
    function DoConversionFromUnicode(var pSrcStr: Word; var pcSrcSize: SYSUINT; 
                                     out pDstStr: Shortint; var pcDstSize: SYSUINT): HResult;
    property DefaultInterface: IMLangConvertCharset read GetDefaultInterface;
  published
  end;

// *********************************************************************//
// The Class CoCMultiLanguage provides a Create and CreateRemote method to          
// create instances of the default interface IMultiLanguage exposed by              
// the CoClass CMultiLanguage. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCMultiLanguage = class
    class function Create: IMultiLanguage;
    class function CreateRemote(const MachineName: string): IMultiLanguage;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TCMultiLanguage
// Help String      : 
// Default Interface: IMultiLanguage
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TCMultiLanguage = class(TOleServer)
  private
    FIntf: IMultiLanguage;
    function GetDefaultInterface: IMultiLanguage;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IMultiLanguage);
    procedure Disconnect; override;
    function GetNumberOfCodePageInfo(out pcCodePage: SYSUINT): HResult;
    function GetCodePageInfo(uiCodePage: SYSUINT; out pCodePageInfo: tagMIMECPINFO): HResult;
    function GetFamilyCodePage(uiCodePage: SYSUINT; out puiFamilyCodePage: SYSUINT): HResult;
    function EnumCodePages(grfFlags: LongWord; out ppEnumCodePage: IEnumCodePage): HResult;
    function GetCharsetInfo(const Charset: WideString; out pCharsetInfo: tagMIMECSETINFO): HResult;
    function IsConvertible(dwSrcEncoding: LongWord; dwDstEncoding: LongWord): HResult;
    function ConvertString(var pdwMode: LongWord; dwSrcEncoding: LongWord; dwDstEncoding: LongWord; 
                           var pSrcStr: Byte; var pcSrcSize: SYSUINT; out pDstStr: Byte; 
                           var pcDstSize: SYSUINT): HResult;
    function ConvertStringToUnicode(var pdwMode: LongWord; dwEncoding: LongWord; 
                                    var pSrcStr: Shortint; var pcSrcSize: SYSUINT; 
                                    out pDstStr: Word; var pcDstSize: SYSUINT): HResult;
    function ConvertStringFromUnicode(var pdwMode: LongWord; dwEncoding: LongWord; 
                                      var pSrcStr: Word; var pcSrcSize: SYSUINT; 
                                      out pDstStr: Shortint; var pcDstSize: SYSUINT): HResult;
    function ConvertStringReset: HResult;
    function GetRfc1766FromLcid(locale: LongWord; out pbstrRfc1766: WideString): HResult;
    function GetLcidFromRfc1766(out plocale: LongWord; const bstrRfc1766: WideString): HResult;
    function EnumRfc1766(out ppEnumRfc1766: IEnumRfc1766): HResult;
    function GetRfc1766Info(locale: LongWord; out pRfc1766Info: tagRFC1766INFO): HResult;
    function CreateConvertCharset(uiSrcCodePage: SYSUINT; uiDstCodePage: SYSUINT; 
                                  dwProperty: LongWord; 
                                  out ppMLangConvertCharset: IMLangConvertCharset): HResult;
    property DefaultInterface: IMultiLanguage read GetDefaultInterface;
  published
  end;

procedure Register;

resourcestring
  dtlServerPage = 'Servers';

  dtlOcxPage = 'ActiveX';

implementation

uses System.Win.ComObj;

class function CoCMLangString.Create: IMLangString;
begin
  Result := CreateComObject(CLASS_CMLangString) as IMLangString;
end;

class function CoCMLangString.CreateRemote(const MachineName: string): IMLangString;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CMLangString) as IMLangString;
end;

procedure TCMLangString.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{C04D65CF-B70D-11D0-B188-00AA0038C969}';
    IntfIID:   '{C04D65CE-B70D-11D0-B188-00AA0038C969}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TCMLangString.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IMLangString;
  end;
end;

procedure TCMLangString.ConnectTo(svrIntf: IMLangString);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TCMLangString.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TCMLangString.GetDefaultInterface: IMLangString;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TCMLangString.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TCMLangString.Destroy;
begin
  inherited Destroy;
end;

function TCMLangString.Sync(fNoAccess: Integer): HResult;
begin
  Result := DefaultInterface.Sync(fNoAccess);
end;

function TCMLangString.GetLength(out plLen: Integer): HResult;
begin
  Result := DefaultInterface.GetLength(plLen);
end;

function TCMLangString.SetMLStr(lDestPos: Integer; lDestLen: Integer; const pSrcMLStr: IUnknown; 
                                lSrcPos: Integer; lSrcLen: Integer): HResult;
begin
  Result := DefaultInterface.SetMLStr(lDestPos, lDestLen, pSrcMLStr, lSrcPos, lSrcLen);
end;

function TCMLangString.GetMLStr(lSrcPos: Integer; lSrcLen: Integer; const pUnkOuter: IUnknown; 
                                dwClsContext: LongWord; var piid: TGUID; out ppDestMLStr: IUnknown; 
                                out plDestPos: Integer; out plDestLen: Integer): HResult;
begin
  Result := DefaultInterface.GetMLStr(lSrcPos, lSrcLen, pUnkOuter, dwClsContext, piid, ppDestMLStr, 
                                      plDestPos, plDestLen);
end;

class function CoCMLangConvertCharset.Create: IMLangConvertCharset;
begin
  Result := CreateComObject(CLASS_CMLangConvertCharset) as IMLangConvertCharset;
end;

class function CoCMLangConvertCharset.CreateRemote(const MachineName: string): IMLangConvertCharset;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CMLangConvertCharset) as IMLangConvertCharset;
end;

procedure TCMLangConvertCharset.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{D66D6F99-CDAA-11D0-B822-00C04FC9B31F}';
    IntfIID:   '{D66D6F98-CDAA-11D0-B822-00C04FC9B31F}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TCMLangConvertCharset.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IMLangConvertCharset;
  end;
end;

procedure TCMLangConvertCharset.ConnectTo(svrIntf: IMLangConvertCharset);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TCMLangConvertCharset.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TCMLangConvertCharset.GetDefaultInterface: IMLangConvertCharset;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TCMLangConvertCharset.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TCMLangConvertCharset.Destroy;
begin
  inherited Destroy;
end;

function TCMLangConvertCharset.Initialize(uiSrcCodePage: SYSUINT; uiDstCodePage: SYSUINT; 
                                          dwProperty: LongWord): HResult;
begin
  Result := DefaultInterface.Initialize(uiSrcCodePage, uiDstCodePage, dwProperty);
end;

function TCMLangConvertCharset.GetSourceCodePage(out puiSrcCodePage: SYSUINT): HResult;
begin
  Result := DefaultInterface.GetSourceCodePage(puiSrcCodePage);
end;

function TCMLangConvertCharset.GetDestinationCodePage(out puiDstCodePage: SYSUINT): HResult;
begin
  Result := DefaultInterface.GetDestinationCodePage(puiDstCodePage);
end;

function TCMLangConvertCharset.GetProperty(out pdwProperty: LongWord): HResult;
begin
  Result := DefaultInterface.GetProperty(pdwProperty);
end;

function TCMLangConvertCharset.DoConversion(var pSrcStr: Byte; var pcSrcSize: SYSUINT; 
                                            out pDstStr: Byte; var pcDstSize: SYSUINT): HResult;
begin
  Result := DefaultInterface.DoConversion(pSrcStr, pcSrcSize, pDstStr, pcDstSize);
end;

function TCMLangConvertCharset.DoConversionToUnicode(var pSrcStr: Shortint; var pcSrcSize: SYSUINT; 
                                                     out pDstStr: Word; var pcDstSize: SYSUINT): HResult;
begin
  Result := DefaultInterface.DoConversionToUnicode(pSrcStr, pcSrcSize, pDstStr, pcDstSize);
end;

function TCMLangConvertCharset.DoConversionFromUnicode(var pSrcStr: Word; var pcSrcSize: SYSUINT; 
                                                       out pDstStr: Shortint; var pcDstSize: SYSUINT): HResult;
begin
  Result := DefaultInterface.DoConversionFromUnicode(pSrcStr, pcSrcSize, pDstStr, pcDstSize);
end;

class function CoCMultiLanguage.Create: IMultiLanguage;
begin
  Result := CreateComObject(CLASS_CMultiLanguage) as IMultiLanguage;
end;

class function CoCMultiLanguage.CreateRemote(const MachineName: string): IMultiLanguage;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CMultiLanguage) as IMultiLanguage;
end;

procedure TCMultiLanguage.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{275C23E2-3747-11D0-9FEA-00AA003F8646}';
    IntfIID:   '{275C23E1-3747-11D0-9FEA-00AA003F8646}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TCMultiLanguage.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IMultiLanguage;
  end;
end;

procedure TCMultiLanguage.ConnectTo(svrIntf: IMultiLanguage);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TCMultiLanguage.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TCMultiLanguage.GetDefaultInterface: IMultiLanguage;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TCMultiLanguage.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TCMultiLanguage.Destroy;
begin
  inherited Destroy;
end;

function TCMultiLanguage.GetNumberOfCodePageInfo(out pcCodePage: SYSUINT): HResult;
begin
  Result := DefaultInterface.GetNumberOfCodePageInfo(pcCodePage);
end;

function TCMultiLanguage.GetCodePageInfo(uiCodePage: SYSUINT; out pCodePageInfo: tagMIMECPINFO): HResult;
begin
  Result := DefaultInterface.GetCodePageInfo(uiCodePage, pCodePageInfo);
end;

function TCMultiLanguage.GetFamilyCodePage(uiCodePage: SYSUINT; out puiFamilyCodePage: SYSUINT): HResult;
begin
  Result := DefaultInterface.GetFamilyCodePage(uiCodePage, puiFamilyCodePage);
end;

function TCMultiLanguage.EnumCodePages(grfFlags: LongWord; out ppEnumCodePage: IEnumCodePage): HResult;
begin
  Result := DefaultInterface.EnumCodePages(grfFlags, ppEnumCodePage);
end;

function TCMultiLanguage.GetCharsetInfo(const Charset: WideString; out pCharsetInfo: tagMIMECSETINFO): HResult;
begin
  Result := DefaultInterface.GetCharsetInfo(Charset, pCharsetInfo);
end;

function TCMultiLanguage.IsConvertible(dwSrcEncoding: LongWord; dwDstEncoding: LongWord): HResult;
begin
  Result := DefaultInterface.IsConvertible(dwSrcEncoding, dwDstEncoding);
end;

function TCMultiLanguage.ConvertString(var pdwMode: LongWord; dwSrcEncoding: LongWord; 
                                       dwDstEncoding: LongWord; var pSrcStr: Byte; 
                                       var pcSrcSize: SYSUINT; out pDstStr: Byte; 
                                       var pcDstSize: SYSUINT): HResult;
begin
  Result := DefaultInterface.ConvertString(pdwMode, dwSrcEncoding, dwDstEncoding, pSrcStr, 
                                           pcSrcSize, pDstStr, pcDstSize);
end;

function TCMultiLanguage.ConvertStringToUnicode(var pdwMode: LongWord; dwEncoding: LongWord; 
                                                var pSrcStr: Shortint; var pcSrcSize: SYSUINT; 
                                                out pDstStr: Word; var pcDstSize: SYSUINT): HResult;
begin
  Result := DefaultInterface.ConvertStringToUnicode(pdwMode, dwEncoding, pSrcStr, pcSrcSize, 
                                                    pDstStr, pcDstSize);
end;

function TCMultiLanguage.ConvertStringFromUnicode(var pdwMode: LongWord; dwEncoding: LongWord; 
                                                  var pSrcStr: Word; var pcSrcSize: SYSUINT; 
                                                  out pDstStr: Shortint; var pcDstSize: SYSUINT): HResult;
begin
  Result := DefaultInterface.ConvertStringFromUnicode(pdwMode, dwEncoding, pSrcStr, pcSrcSize, 
                                                      pDstStr, pcDstSize);
end;

function TCMultiLanguage.ConvertStringReset: HResult;
begin
  Result := DefaultInterface.ConvertStringReset;
end;

function TCMultiLanguage.GetRfc1766FromLcid(locale: LongWord; out pbstrRfc1766: WideString): HResult;
begin
  Result := DefaultInterface.GetRfc1766FromLcid(locale, pbstrRfc1766);
end;

function TCMultiLanguage.GetLcidFromRfc1766(out plocale: LongWord; const bstrRfc1766: WideString): HResult;
begin
  Result := DefaultInterface.GetLcidFromRfc1766(plocale, bstrRfc1766);
end;

function TCMultiLanguage.EnumRfc1766(out ppEnumRfc1766: IEnumRfc1766): HResult;
begin
  Result := DefaultInterface.EnumRfc1766(ppEnumRfc1766);
end;

function TCMultiLanguage.GetRfc1766Info(locale: LongWord; out pRfc1766Info: tagRFC1766INFO): HResult;
begin
  Result := DefaultInterface.GetRfc1766Info(locale, pRfc1766Info);
end;

function TCMultiLanguage.CreateConvertCharset(uiSrcCodePage: SYSUINT; uiDstCodePage: SYSUINT; 
                                              dwProperty: LongWord; 
                                              out ppMLangConvertCharset: IMLangConvertCharset): HResult;
begin
  Result := DefaultInterface.CreateConvertCharset(uiSrcCodePage, uiDstCodePage, dwProperty, 
                                                  ppMLangConvertCharset);
end;

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TCMLangString, TCMLangConvertCharset, TCMultiLanguage]);
end;

end.
