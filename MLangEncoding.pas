// =============================================================================
// MLangEncoding.pas
//
// `TEncoding`-like interface to Windows IMultiLanguage2.
//
// Copyright Quadroid. Licensed under the terms of MIT license.
// -----------------------------------------------------------------------------

unit MLangEncoding;

interface

uses
  SysUtils, Windows, ActiveX, MultiLanguage_TLB;

// `MultiLanguage_TLB.pas` is generated with broken types.
// Take definitions that we need and correct them.
{$region}
const
  MLDETECTCP_NONE = $0;
  MLDETECTCP_7BIT = $1;
  MLDETECTCP_8BIT = $2;
  MLDETECTCP_DBCS = $4;
  MLDETECTCP_HTML = $8;
  MLDETECTCP_NUMBER = $10;

  MIMECONTF_MAILNEWS = MultiLanguage_TLB.MIMECONTF_MAILNEWS;
  MIMECONTF_BROWSER = MultiLanguage_TLB.MIMECONTF_BROWSER;
  MIMECONTF_MINIMAL = MultiLanguage_TLB.MIMECONTF_MINIMAL;
  MIMECONTF_IMPORT = MultiLanguage_TLB.MIMECONTF_IMPORT;
  MIMECONTF_SAVABLE_MAILNEWS = MultiLanguage_TLB.MIMECONTF_SAVABLE_MAILNEWS;
  MIMECONTF_SAVABLE_BROWSER = MultiLanguage_TLB.MIMECONTF_SAVABLE_BROWSER;
  MIMECONTF_EXPORT = MultiLanguage_TLB.MIMECONTF_EXPORT;
  MIMECONTF_PRIVCONVERTER = MultiLanguage_TLB.MIMECONTF_PRIVCONVERTER;
  MIMECONTF_VALID = MultiLanguage_TLB.MIMECONTF_VALID;
  MIMECONTF_VALID_NLS = MultiLanguage_TLB.MIMECONTF_VALID_NLS;
  MIMECONTF_MIME_IE4 = MultiLanguage_TLB.MIMECONTF_MIME_IE4;
  MIMECONTF_MIME_LATEST = MultiLanguage_TLB.MIMECONTF_MIME_LATEST;
  MIMECONTF_MIME_REGISTRY = MultiLanguage_TLB.MIMECONTF_MIME_REGISTRY;

type
  tagMIMECPINFO = record
    dwFlags: DWORD;
    uiCodePage: UINT;
    uiFamilyCodePage: UINT;
    wszDescription: array[0..63] of WideChar;
    wszWebCharset: array[0..49] of WideChar;
    wszHeaderCharset: array[0..49] of WideChar;
    wszBodyCharset: array[0..49] of WideChar;
    wszFixedWidthFont: array[0..31] of WideChar;
    wszProportionalFont: array[0..31] of WideChar;
    bGDICharset: BYTE;
  end;
  PMIMECPINFO = ^tagMIMECPINFO;

  tagMIMECSETINFO = record
    uiCodePage: UINT;
    uiInternetEncoding: UINT;
    wszCharset: array[0..49] of WideChar;
  end;
  PMIMECSETINFO = ^tagMIMECSETINFO;

  tagDetectEncodingInfo = record
    nLangID: UINT;
    nCodePage: UINT;
    nDocPercent: Integer;
    nConfidence: Integer;
  end;
  PDetectEncodingInfo = ^tagDetectEncodingInfo;

  IEnumCodePage = interface(IUnknown)
    ['{275C23E3-3747-11D0-9FEA-00AA003F8646}']
    function Clone(out ppEnum: IEnumCodePage): HResult; stdcall;
    function Next(celt: DWORD; out rgelt: tagMIMECPINFO; out pceltFetched: DWORD): HResult; stdcall;
    function Reset: HResult; stdcall;
    function Skip(celt: DWORD): HResult; stdcall;
  end;

  IMultiLanguage2 = interface(IUnknown)
    ['{DCCFC164-2B38-11D2-B7EC-00C04F8F5D9A}']
    function GetNumberOfCodePageInfo(out pcCodePage: UINT): HResult; stdcall;
    function GetCodePageInfo(uiCodePage: UINT; LangId: Word; out pCodePageInfo: tagMIMECPINFO): HResult; stdcall;
    function GetFamilyCodePage(uiCodePage: UINT; out puiFamilyCodePage: UINT): HResult; stdcall;
    function EnumCodePages(grfFlags: DWORD; LangId: Word; out ppEnumCodePage: IEnumCodePage): HResult; stdcall;
    function GetCharsetInfo(const Charset: WideString; out pCharsetInfo: tagMIMECSETINFO): HResult; stdcall;
    function IsConvertible(dwSrcEncoding: DWORD; dwDstEncoding: DWORD): HResult; stdcall;
    function ConvertString(var pdwMode: DWORD; dwSrcEncoding: DWORD; dwDstEncoding: DWORD;
                           pSrcStr: PAnsiChar; var pcSrcSize: UINT;
                           pDstStr: PAnsiChar; var pcDstSize: UINT): HResult; stdcall;
    function ConvertStringToUnicode(var pdwMode: DWORD; dwEncoding: DWORD;
                                    pSrcStr: PAnsiChar; var pcSrcSize: UINT;
                                    pDstStr: PWideChar; var pcDstSize: UINT): HResult; stdcall;
    function ConvertStringFromUnicode(var pdwMode: DWORD; dwEncoding: DWORD;
                                      pSrcStr: PWideChar; var pcSrcSize: UINT;
                                      pDstStr: PAnsiChar; var pcDstSize: UINT): HResult; stdcall;
    function ConvertStringReset: HResult; stdcall;
    function GetRfc1766FromLcid(locale: DWORD; out pbstrRfc1766: WideString): HResult; stdcall;
    function GetLcidFromRfc1766(out plocale: DWORD; const bstrRfc1766: WideString): HResult; stdcall;
    function EnumRfc1766(LangId: Word; out ppEnumRfc1766: IEnumRfc1766): HResult; stdcall;
    function GetRfc1766Info(locale: DWORD; LangId: Word; out pRfc1766Info: tagRFC1766INFO): HResult; stdcall;
    function CreateConvertCharset(uiSrcCodePage: UINT; uiDstCodePage: UINT;
                                  dwProperty: DWORD;
                                  out ppMLangConvertCharset: IMLangConvertCharset): HResult; stdcall;
    function ConvertStringInIStream(var pdwMode: DWORD; dwFlag: DWORD; lpFallBack: PWideChar;
                                    dwSrcEncoding: DWORD; dwDstEncoding: DWORD;
                                    const pstmIn: IStream; const pstmOut: IStream): HResult; stdcall;
    function ConvertStringToUnicodeEx(var pdwMode: DWORD; dwEncoding: DWORD;
                                      pSrcStr: PAnsiChar; var pcSrcSize: UINT;
                                      pDstStr: PWideChar; var pcDstSize: UINT;
                                      dwFlag: DWORD; lpFallBack: PWideChar): HResult; stdcall;
    function ConvertStringFromUnicodeEx(var pdwMode: DWORD; dwEncoding: DWORD;
                                        pSrcStr: PWideChar; var pcSrcSize: UINT;
                                        pDstStr: PAnsiChar; var pcDstSize: UINT;
                                        dwFlag: DWORD; lpFallBack: PWideChar): HResult; stdcall;
    function DetectCodepageInIStream(dwFlag: DWORD; dwPrefWinCodePage: DWORD;
                                     const pstmIn: IStream; out lpEncoding: tagDetectEncodingInfo;
                                     var pnScores: Integer): HResult; stdcall;
    function DetectInputCodepage(dwFlag: DWORD; dwPrefWinCodePage: DWORD;
                                 pSrcStr: PAnsiChar; var pcSrcSize: Integer;
                                 lpEncoding: PDetectEncodingInfo; var pnScores: Integer): HResult; stdcall;
    function ValidateCodePage(uiCodePage: UINT; var hwnd: _RemotableHandle): HResult; stdcall;
    function GetCodePageDescription(uiCodePage: UINT; lcid: DWORD; lpWideCharStr: PWideChar;
                                    cchWideChar: Integer): HResult; stdcall;
    function IsCodePageInstallable(uiCodePage: UINT): HResult; stdcall;
    function SetMimeDBSource(dwSource: tagMIMECONTF): HResult; stdcall;
    function GetNumberOfScripts(out pnScripts: UINT): HResult; stdcall;
    function EnumScripts(dwFlags: DWORD; LangId: Word; out ppEnumScript: IEnumScript): HResult; stdcall;
    function ValidateCodePageEx(uiCodePage: UINT; var hwnd: _RemotableHandle;
                                dwfIODControl: DWORD): HResult; stdcall;
  end;
{$endregion}

type
  TMLang = class
    class var MLang2: IMultiLanguage2;
    class function Available: Boolean; static;
  end;

  TMLangEnumCodePages = function (Context: Pointer; CPInfo: PMIMECPINFO): Boolean;

  TMLangEncoding = class(TMBCSEncoding)
  private
    FCodePage: Cardinal;
    FMBToWCharFlags: Cardinal;
    FWCharToMBFlags: Cardinal;
  strict protected
    function GetByteCount(Chars: PChar; CharCount: Integer): Integer; overload; override;
    function GetBytes(Chars: PChar; CharCount: Integer; Bytes: PByte; ByteCount: Integer): Integer; overload; override;
    function GetCharCount(Bytes: PByte; ByteCount: Integer): Integer; overload; override;
    function GetChars(Bytes: PByte; ByteCount: Integer; Chars: PChar; CharCount: Integer): Integer; overload; override;
    function GetCodePage: Cardinal; override;
    function GetEncodingName: string; override;
    function GetMIMEName: string; override;
  public
    constructor Create; override;
    constructor Create(CodePage: Integer); override;
    constructor Create(CodePage, MBToWCharFlags, WCharToMBFlags: Integer); override;
    function Clone: TEncoding; override;
    function GetMaxByteCount(CharCount: Integer): Integer; override;
    function GetMaxCharCount(ByteCount: Integer): Integer; override;
    function GetPreamble: TBytes; override;
    function EnumCodePages(Callback: TMLangEnumCodePages; Context: Pointer): Boolean;
    function DetectCodePage(const Buffer: PAnsiChar; Size: Integer;
      DetectedCodePages: PDetectEncodingInfo; var Scores: Integer): Boolean;
    property CodePage: Cardinal read GetCodePage;
    property MaxCharSize: Integer read FMaxCharSize;
  end;

implementation

// -----------------------------------------------------------------------------
// TMLang
// -----------------------------------------------------------------------------

class function TMLang.Available: Boolean;
begin
  Result := Assigned(MLang2);
end;

// -----------------------------------------------------------------------------
// TMLangEncoding
// -----------------------------------------------------------------------------

constructor TMLangEncoding.Create;
begin
  Create(GetACP);
end;

constructor TMLangEncoding.Create(CodePage: Integer);
begin
  Create(CodePage, 0, 0);
end;

constructor TMLangEncoding.Create(CodePage, MBToWCharFlags, WCharToMBFlags: Integer);
var
  cpInfo: TCPInfo;
begin
  if not TMLang.Available then
    raise EEncodingError.Create('TMLangEncoding: IMultiLanguage2 interface is not available');
  if CodePage = CP_ACP then
    FCodePage := GetACP
  else
    FCodePage := Cardinal(CodePage);
  if not GetCPInfo(FCodePage, cpInfo) then
    raise EEncodingError.CreateFmt('TMLangEncoding: invalid code page (%u)', [FCodePage]);
  FMBToWCharFlags := MBToWCharFlags;
  FWCharToMBFlags := WCharToMBFlags;
  FMaxCharSize := cpInfo.MaxCharSize;
  FIsSingleByte := FMaxCharSize = 1;
end;

// -----------------------------------------------------------------------------

function TMLangEncoding.Clone: TEncoding;
begin
  Result := TMLangEncoding.Create(FCodePage);
end;

function TMLangEncoding.GetCodePage: Cardinal;
begin
  Result := FCodePage;
end;

function TMLangEncoding.GetEncodingName: string;
var
  cpInfo: tagMIMECPINFO;
begin
  TMLang.MLang2.GetCodePageInfo(FCodePage, 0, cpInfo);
  Result := cpInfo.wszDescription;
end;

function TMLangEncoding.GetMIMEName: string;
var
  cpInfo: tagMIMECPINFO;
begin
  TMLang.MLang2.GetCodePageInfo(FCodePage, 0, cpInfo);
  Result := cpInfo.wszWebCharset;
end;

// -----------------------------------------------------------------------------

function TMLangEncoding.GetByteCount(Chars: PChar; CharCount: Integer): Integer;
var
  mode, srcSize, dstSize: Cardinal;
begin
  Result := 0;
  mode := 0;
  srcSize := CharCount;
  dstSize := 0;
  if TMLang.MLang2.ConvertStringFromUnicode(mode, FCodePage, Chars,
    srcSize, nil, dstSize) <> E_FAIL then
    // `S_FALSE` is success too because we care only about
    // conversion, not other aspects such as rendering
    Result := dstSize;
end;

function TMLangEncoding.GetBytes(Chars: PChar; CharCount: Integer;
  Bytes: PByte; ByteCount: Integer): Integer;
var
  mode, srcSize, dstSize: Cardinal;
begin
  Result := 0;
  mode := 0;
  srcSize := CharCount;
  dstSize := ByteCount;
  if TMLang.MLang2.ConvertStringFromUnicode(mode, FCodePage, Chars,
    srcSize, PAnsiChar(Bytes), dstSize) <> E_FAIL then
    Result := dstSize;
end;

// -----------------------------------------------------------------------------

function TMLangEncoding.GetCharCount(Bytes: PByte; ByteCount: Integer): Integer;
var
  mode, srcSize, dstSize: Cardinal;
begin
  Result := 0;
  mode := 0;
  srcSize := ByteCount;
  dstSize := 0;
  if TMLang.MLang2.ConvertStringToUnicode(mode, FCodePage,
    PAnsiChar(Bytes), srcSize, nil, dstSize) <> E_FAIL then
    Result := dstSize;
end;

function TMLangEncoding.GetChars(Bytes: PByte; ByteCount: Integer;
  Chars: PChar; CharCount: Integer): Integer;
var
  mode, srcSize, dstSize: Cardinal;
begin
  Result := 0;
  mode := 0;
  srcSize := ByteCount;
  dstSize := CharCount;
  if TMLang.MLang2.ConvertStringToUnicode(mode, FCodePage,
    PAnsiChar(Bytes), srcSize, Chars, dstSize) <> E_FAIL then
    Result := dstSize;
end;

// -----------------------------------------------------------------------------

function TMLangEncoding.GetMaxByteCount(CharCount: Integer): Integer;
begin
  Result := (CharCount + 1) * FMaxCharSize;
end;

function TMLangEncoding.GetMaxCharCount(ByteCount: Integer): Integer;
begin
  Result := ByteCount + 1;
end;

function TMLangEncoding.GetPreamble: TBytes;
begin
{$if false}
  SetLength(Result, 0);
{$else}
  Result := nil;
{$endif}
end;

// -----------------------------------------------------------------------------

function TMLangEncoding.EnumCodePages(Callback: TMLangEnumCodePages; Context: Pointer): Boolean;
var
  num: Cardinal;
  iter: IEnumCodePage;
  cpInfo: tagMIMECPINFO;
begin
  Result := False;
  if TMLang.MLang2.EnumCodePages(MIMECONTF_VALID_NLS or MIMECONTF_EXPORT, 0, iter) <> NOERROR then
    Exit;
  Result := True;
  while iter.Next(1, cpInfo, num) = S_OK do
  begin
    if num = 0 then
      Break;
    if not Callback(Context, @cpInfo) then
      Break;
  end;
end;

function TMLangEncoding.DetectCodePage(const Buffer: PAnsiChar; Size: Integer;
  DetectedCodePages: PDetectEncodingInfo; var Scores: Integer): Boolean;
begin
  Result := (TMLang.MLang2.DetectInputCodepage(MLDETECTCP_NONE, GetACP, Buffer, Size,
    DetectedCodePages, Scores) <> E_FAIL) and (Scores > 0);
end;

initialization
  CoCreateInstance(CLASS_CMultiLanguage, nil, CLSCTX_INPROC_SERVER
  , IID_IMultiLanguage2, TMLang.MLang2);

finalization
  TMLang.MLang2 := nil;

end.
