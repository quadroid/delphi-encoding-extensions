// =============================================================================
// EncodingEx.pas
//
// `TEncoding` extensions and improvements:
//   * UTF-8 encoding derived from `TMBCSEncoding` instead of `TUTF7Encoding`.
//   * Additional UTF-8 encoder that doesn't write byte order mark.
//   * Minor improvement to UTF-16 big-endian encoding class.
//   * UTF-32 encoders / decoders (both little- and big-endian).
//   * IMultiLanguage2 encoding interface via `TMLangEncoding`.
//   * Implementation of a hexadecimal binary encoding.
//   * New, more complete, encoding detection function.
//
// Copyright Quadroid. Licensed under the terms of MIT license.
// -----------------------------------------------------------------------------

unit EncodingEx;

{.$define HEXADECIMAL_LOWER_CASE}

interface

uses
  SysUtils, Windows, MLangEncoding;

const
  BOM_UTF8:    array[0..2] of Byte = ($EF, $BB, $BF);
  BOM_UTF16LE: array[0..1] of Byte = ($FF, $FE);
  BOM_UTF16BE: array[0..1] of Byte = ($FE, $FF);
  BOM_UTF32LE: array[0..3] of Byte = ($FF, $FE, $00, $00);
  BOM_UTF32BE: array[0..3] of Byte = ($00, $00, $FE, $FF);

type
  TUTF8BOMEncoding = class(TMBCSEncoding)
  strict protected
    function GetEncodingName: string; override;
    class function GetEncodingNameEx: string; static;
  public
    constructor Create; override;
    function Clone: TEncoding; override;
    function GetMaxByteCount(CharCount: Integer): Integer; override;
    function GetMaxCharCount(ByteCount: Integer): Integer; override;
    function GetPreamble: TBytes; override;
    class property EncodingName: string read GetEncodingNameEx;
  end;

  TUTF8BOMLessEncoding = class(TUTF8BOMEncoding)
  public
    function Clone: TEncoding; override;
    function GetPreamble: TBytes; override;
  end;

  TUTF16LittleEncoding = class(TUnicodeEncoding)
  strict protected
    function GetEncodingName: string; override;
    class function GetEncodingNameEx: string; static;
  public
    function Clone: TEncoding; override;
    function GetPreamble: TBytes; override;
    class property EncodingName: string read GetEncodingNameEx;
  end;

  TUTF16BigEncoding = class(TBigEndianUnicodeEncoding)
  strict protected
    function GetByteCount(Chars: PChar; CharCount: Integer): Integer; overload; override;
    function GetBytes(Chars: PChar; CharCount: Integer; Bytes: PByte; ByteCount: Integer): Integer; overload; override;
    function GetCharCount(Bytes: PByte; ByteCount: Integer): Integer; overload; override;
    function GetChars(Bytes: PByte; ByteCount: Integer; Chars: PChar; CharCount: Integer): Integer; overload; override;
    function GetEncodingName: string; override;
    class function GetEncodingNameEx: string; static;
  public
    function Clone: TEncoding; override;
    function GetMaxByteCount(CharCount: Integer): Integer; override;
    function GetMaxCharCount(ByteCount: Integer): Integer; override;
    function GetPreamble: TBytes; override;
    class property EncodingName: string read GetEncodingNameEx;
  end;

  TUTF32LittleEncoding = class(TEncoding)
  strict protected
    function GetByteCount(Chars: PChar; CharCount: Integer): Integer; overload; override;
    function GetBytes(Chars: PChar; CharCount: Integer; Bytes: PByte; ByteCount: Integer): Integer; overload; override;
    function GetCharCount(Bytes: PByte; ByteCount: Integer): Integer; overload; override;
    function GetChars(Bytes: PByte; ByteCount: Integer; Chars: PChar; CharCount: Integer): Integer; overload; override;
    function GetEncodingName: string; override;
    class function GetEncodingNameEx: string; static;
  public
    function Clone: TEncoding; override;
    function GetMaxByteCount(CharCount: Integer): Integer; override;
    function GetMaxCharCount(ByteCount: Integer): Integer; override;
    function GetPreamble: TBytes; override;
    class property EncodingName: string read GetEncodingNameEx;
  end;

  TUTF32BigEncoding = class(TUTF32LittleEncoding)
  strict protected
    function GetBytes(Chars: PChar; CharCount: Integer; Bytes: PByte; ByteCount: Integer): Integer; overload; override;
    function GetCharCount(Bytes: PByte; ByteCount: Integer): Integer; overload; override;
    function GetChars(Bytes: PByte; ByteCount: Integer; Chars: PChar; CharCount: Integer): Integer; overload; override;
    function GetEncodingName: string; override;
    class function GetEncodingNameEx: string; static;
  public
    function Clone: TEncoding; override;
    function GetPreamble: TBytes; override;
    class property EncodingName: string read GetEncodingNameEx;
  end;

  TBinaryEncoding = class(TEncoding)
  private
    FLineBytes: Integer;
    FGroupBytes: Integer;
    FLowerCase: Boolean;
    function GetFormat: Boolean;
  strict protected
    function GetByteCount(Chars: PChar; CharCount: Integer): Integer; overload; override;
    function GetBytes(Chars: PChar; CharCount: Integer; Bytes: PByte; ByteCount: Integer): Integer; overload; override;
    function GetCharCount(Bytes: PByte; ByteCount: Integer): Integer; overload; override;
    function GetChars(Bytes: PByte; ByteCount: Integer; Chars: PChar; CharCount: Integer): Integer; overload; override;
    function GetEncodingName: string; override;
    class function GetEncodingNameEx: string; static;
  public
    constructor Create; overload;
    constructor Create(LineBytes: Integer; GroupBytes: Integer = 0); overload;
    function Clone: TEncoding; override;
    function GetMaxByteCount(CharCount: Integer): Integer; override;
    function GetMaxCharCount(ByteCount: Integer): Integer; override;
    function GetPreamble: TBytes; override;
    property Format: Boolean read GetFormat;
    class property EncodingName: string read GetEncodingNameEx;
  end;

  TDetectedEncoding = (encxUTF8, encxUTF16LE, encxUTF16BE,
    encxUTF32LE, encxUTF32BE, encxBinary, encxUnknown);

  TEncodingEx = class(TEncoding)
  strict private
    class var FUTF8BOMEncoding: TUTF8BOMEncoding;
    class var FUTF8BOMLessEncoding: TUTF8BOMLessEncoding;
    class var FUTF16LittleEncoding: TUTF16LittleEncoding;
    class var FUTF16BigEncoding: TUTF16BigEncoding;
    class var FUTF32LittleEncoding: TUTF32LittleEncoding;
    class var FUTF32BigEncoding: TUTF32BigEncoding;
    class var FBinaryEncoding: TBinaryEncoding;
    class var FMLangEncoding: TMLangEncoding;
    class destructor Destroy;
    class function GetUTF8BOMEncoding: TEncoding; static;
    class function GetUTF8BOMLessEncoding: TEncoding; static;
    class function GetUTF16LittleEncoding: TEncoding; static;
    class function GetUTF16BigEncoding: TEncoding; static;
    class function GetUTF32LittleEncoding: TEncoding; static;
    class function GetUTF32BigEncoding: TEncoding; static;
    class function GetBinaryEncoding: TEncoding; static;
    class function GetMLangEncoding: TEncoding; static;
    class function CheckBOM(const Buffer: Pointer; const BufferSize: NativeUInt;
      const BOM: Pointer; const BOMSize: NativeUInt): Boolean;
  public
    class function GetBufferEncodingEx(const Buffer: Pointer; const Size: NativeUInt;
      var DetectedEncoding: TDetectedEncoding; var InvalidUTF8: Boolean): Integer; overload; static;
    class function GetBufferEncodingEx(const Buffer: TBytes; var AEncoding: TEncoding): Integer; overload; static;
    class function GetBufferEncodingEx(const Buffer: TBytes; var AEncoding: TEncoding;
      ADefaultEncoding: TEncoding): Integer; overload; static;
    class property UTF8BOM: TEncoding read GetUTF8BOMEncoding;
    class property UTF8BOMLess: TEncoding read GetUTF8BOMLessEncoding;
    class property UTF16LE: TEncoding read GetUTF16LittleEncoding;
    class property UTF16BE: TEncoding read GetUTF16BigEncoding;
    class property UTF32LE: TEncoding read GetUTF32LittleEncoding;
    class property UTF32BE: TEncoding read GetUTF32BigEncoding;
    class property Binary: TEncoding read GetBinaryEncoding;
    class property MLang: TEncoding read GetMLangEncoding;
  end;

  function bswap16(W: UInt16): UInt16; register;
  function bswap32(W: UInt32): UInt32; register;

implementation

uses
  Math;

// -----------------------------------------------------------------------------
// TBinaryEncoding
// -----------------------------------------------------------------------------

constructor TBinaryEncoding.Create;
begin
  Create(16, 2);
end;

constructor TBinaryEncoding.Create(LineBytes: Integer; GroupBytes: Integer = 0);
begin
{$ifdef DEBUG}
  Assert(LineBytes >= 0);
  Assert((GroupBytes >= 0) and (GroupBytes <= LineBytes)
    and ((GroupBytes = 0) or (LineBytes mod GroupBytes = 0)));
{$endif}
{$ifdef HEXADECIMAL_LOWER_CASE}
  FLowerCase := True;
{$endif}
  FMaxCharSize := 2;
  FIsSingleByte := False;
  FLineBytes := LineBytes;
  FGroupBytes := GroupBytes;
end;

function TBinaryEncoding.Clone: TEncoding;
begin
  Result := TBinaryEncoding.Create(FLineBytes, FGroupBytes);
end;

function TBinaryEncoding.GetEncodingName: string;
begin
  Result := GetEncodingNameEx;
end;

class function TBinaryEncoding.GetEncodingNameEx: string;
begin
  Result := 'Hexadecimal';
end;

function TBinaryEncoding.GetFormat: Boolean;
begin
  Result := FLineBytes <> 0;
end;

// -----------------------------------------------------------------------------

function CharToHex(C: Char): Integer;
var
  K: Integer;
begin
{$RANGECHECKS OFF}
{$OVERFLOWCHECKS OFF}
  K := Ord(C) or $20;
  if K >= Ord('a') then
    Result := K - Ord('a') + 10
  else
    Result := Ord(C) - Ord('0');
{$OVERFLOWCHECKS ON}
{$RANGECHECKS ON}
end;

function TBinaryEncoding.GetByteCount(Chars: PChar; CharCount: Integer): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to CharCount - 1 do
  begin
    if Ord(Chars[i]) < 33 then
      Continue; // skip whitespace
    if not (InRange(Ord(Chars[i]), Ord('0'), Ord('9')) or
      InRange(Ord(Chars[i]) or $20, Ord('a'), Ord('f'))) then
    begin
{$ifdef DEBUG}
      Assert(false);
{$endif}
      Exit(0);
    end;
    Inc(Result);
  end;
  Result := Result div 2 + (Result and 1);
end;

function TBinaryEncoding.GetBytes(Chars: PChar; CharCount: Integer;
  Bytes: PByte; ByteCount: Integer): Integer;
var
  pos, halves: Integer;
begin
  Result := 0;
{$ifdef DEBUG}
  Assert(ByteCount >= GetByteCount(Chars, CharCount));
{$endif}
  pos := 0;
  while pos < CharCount - (CharCount and 1) do
  begin
    if (Ord(Chars[pos]) < 33) or (Ord(Chars[pos + 1]) < 33) then
      if Ord(Chars[pos + 1]) < 33 then
        Break // fallback to slow path
      else begin
        Inc(pos);
        Continue;
      end;
    Bytes[Result] := CharToHex(Chars[pos]) shl 4 or CharToHex(Chars[pos + 1]);
    Inc(Result);
    Inc(pos, 2);
  end;
  halves := 1;
  while pos < CharCount do
  begin
    if Ord(Chars[pos]) < 33 then
    begin
      Inc(pos);
      Continue;
    end;
    case halves of
    1: Bytes[Result] := CharToHex(Chars[pos]) shl 4;
    0: begin
      halves := 2;
      Bytes[Result] := Bytes[Result] or CharToHex(Chars[pos]);
      Inc(Result);
    end;
    end;
    Dec(halves);
    Inc(pos);
  end;
  if halves = 0 then
    Inc(Result);
end;

// -----------------------------------------------------------------------------

function HexToChar(X: Integer; LC: Boolean): Char; inline;
begin
{$RANGECHECKS OFF}
{$OVERFLOWCHECKS OFF}
  Result := Chr(X + Ord('0') + (7 + 32 * Ord(LC)) * Ord(X > 9));
{$OVERFLOWCHECKS ON}
{$RANGECHECKS ON}
end;

function TBinaryEncoding.GetCharCount(Bytes: PByte; ByteCount: Integer): Integer;
var
  trailEol, trailSpace: Boolean;
  lines: Integer;
begin
  if not Format then
  begin
    Result := ByteCount * 2;
    Exit;
  end;
  trailEol := ByteCount mod FLineBytes = 0;
  lines := ByteCount div FLineBytes - Ord(trailEol);
  Result := ByteCount * 2 + lines * Length(sLineBreak);
  if FGroupBytes <> 0 then
  begin
    trailSpace := ByteCount mod FGroupBytes = 0;
    Result := Result + ByteCount div FGroupBytes - Ord(trailSpace) - lines;
  end;
end;

function TBinaryEncoding.GetChars(Bytes: PByte; ByteCount: Integer;
  Chars: PChar; CharCount: Integer): Integer;

  procedure DoChars(Start, Count: Integer);
  var
    i: Integer;
  begin
    for i := Start to Start + Count - 1 do
    begin
      Chars[Result + 0] := HexToChar(Bytes[i] shr 4, FLowerCase);
      Chars[Result + 1] := HexToChar(Bytes[i] and $F, FLowerCase);
      Inc(Result, 2);
    end;
  end;

var
  i, j, pos: Integer;
  trailBytes: Integer;
  groupBytes: Integer;
begin
  Result := 0;
{$ifdef DEBUG}
  Assert(CharCount >= GetCharCount(Bytes, ByteCount));
{$endif}
  if not Format then
  begin
    DoChars(0, ByteCount);
    Exit;
  end;
  pos := 0;
  trailBytes := ByteCount mod FLineBytes;
  groupBytes := IfThen(Boolean(FGroupBytes), FGroupBytes, FLineBytes);
  for i := ByteCount div FLineBytes downto 1 do
  begin
    for j := FLineBytes div groupBytes downto 1 do
    begin
      DoChars(pos, groupBytes);
      Inc(pos, groupBytes);
      if j <> 1 then
      begin
        Chars[Result] := ' ';
        Inc(Result);
      end;
    end;
    if (i <> 1) or (trailBytes <> 0) then
    begin
      StrCopy(Chars + Result, sLineBreak);
      Inc(Result, Length(sLineBreak));
    end;
  end;
  if trailBytes <> 0 then
  begin
    ByteCount := trailBytes;
    groupBytes := Min(IfThen(Boolean(FGroupBytes), FGroupBytes, trailBytes), trailBytes);
    trailBytes := trailBytes mod groupBytes;
    for j := ByteCount div groupBytes downto 1 do
    begin
      DoChars(pos, groupBytes);
      Inc(pos, groupBytes);
      if (j <> 1) or (trailBytes <> 0) then
      begin
        Chars[Result] := ' ';
        Inc(Result);
      end;
    end;
    if trailBytes <> 0 then
      DoChars(pos, trailBytes);
  end;
end;

// -----------------------------------------------------------------------------

function TBinaryEncoding.GetMaxByteCount(CharCount: Integer): Integer;
begin
  Result := CharCount div 2 + (CharCount and 1) + 1;
end;

function TBinaryEncoding.GetMaxCharCount(ByteCount: Integer): Integer;
begin
  if Format then
    Result := ByteCount * 2 + (ByteCount div FLineBytes) * Length(sLineBreak) +
      IfThen(FGroupBytes <> 0, ByteCount div FGroupBytes, 0) + 1
  else
    Result := ByteCount * 2 + 1;
end;

function TBinaryEncoding.GetPreamble: TBytes;
begin
  Result := nil;
end;

// -----------------------------------------------------------------------------
// TUTF8BOMEncoding
// -----------------------------------------------------------------------------

constructor TUTF8BOMEncoding.Create;
begin
  inherited Create(CP_UTF8, MB_ERR_INVALID_CHARS, 0);
  FIsSingleByte := False;
end;

function TUTF8BOMEncoding.Clone: TEncoding;
begin
  Result := TUTF8BOMEncoding.Create;
end;

function TUTF8BOMEncoding.GetEncodingName: string;
begin
  Result := GetEncodingNameEx;
end;

class function TUTF8BOMEncoding.GetEncodingNameEx: string;
begin
  Result := 'UTF-8';
end;

function TUTF8BOMEncoding.GetMaxByteCount(CharCount: Integer): Integer;
begin
  Result := (CharCount + 1) * 3;
end;

function TUTF8BOMEncoding.GetMaxCharCount(ByteCount: Integer): Integer;
begin
  Result := ByteCount + 1;
end;

function TUTF8BOMEncoding.GetPreamble: TBytes;
begin
  SetLength(Result, SizeOf(BOM_UTF8));
  Move(BOM_UTF8[0], Result[0], SizeOf(BOM_UTF8));
end;

// -----------------------------------------------------------------------------
// TUTF8BOMLessEncoding
// -----------------------------------------------------------------------------

function TUTF8BOMLessEncoding.Clone: TEncoding;
begin
  Result := TUTF8BOMLessEncoding.Create;
end;

function TUTF8BOMLessEncoding.GetPreamble: TBytes;
begin
  Result := nil;
end;

// -----------------------------------------------------------------------------
// TUTF16LittleEncoding
// -----------------------------------------------------------------------------

function TUTF16LittleEncoding.Clone: TEncoding;
begin
  Result := TUTF16LittleEncoding.Create;
end;

function TUTF16LittleEncoding.GetEncodingName: string;
begin
  Result := GetEncodingNameEx;
end;

class function TUTF16LittleEncoding.GetEncodingNameEx: string;
begin
  Result := 'UTF-16 Little-Endian';
end;

function TUTF16LittleEncoding.GetPreamble: TBytes;
begin
  SetLength(Result, SizeOf(BOM_UTF16LE));
  Move(BOM_UTF16LE[0], Result[0], SizeOf(BOM_UTF16LE));
end;

// -----------------------------------------------------------------------------
// TUTF16BigEncoding
// -----------------------------------------------------------------------------

function TUTF16BigEncoding.Clone: TEncoding;
begin
  Result := TUTF16BigEncoding.Create;
end;

function TUTF16BigEncoding.GetEncodingName: string;
begin
  Result := GetEncodingNameEx;
end;

class function TUTF16BigEncoding.GetEncodingNameEx: string;
begin
  Result := 'UTF-16 Big-Endian';
end;

// -----------------------------------------------------------------------------

function bswap16(W: UInt16): UInt16; register;
{$if defined(CPUX86) or defined(CPUX64)}
asm
  ror ax, 8
{$else}
begin
{$RANGECHECKS OFF}
{$OVERFLOWCHECKS OFF}
  Result := (W shl 8) or (W shr 8);
{$OVERFLOWCHECKS ON}
{$RANGECHECKS ON}
{$endif}
end;

function TUTF16BigEncoding.GetByteCount(Chars: PChar; CharCount: Integer): Integer;
begin
  Result := CharCount * SizeOf(Char);
end;

function TUTF16BigEncoding.GetBytes(Chars: PChar; CharCount: Integer;
  Bytes: PByte; ByteCount: Integer): Integer;
var
  i: Integer;
  words: PWord;
begin
  words := PWord(Bytes);
{$POINTERMATH ON}
  for i := 0 to CharCount - 1 do
    words[i] := bswap16(UInt16(Chars[i]));
{$POINTERMATH OFF}
  Result := CharCount * SizeOf(Char);
end;

// -----------------------------------------------------------------------------

function TUTF16BigEncoding.GetCharCount(Bytes: PByte; ByteCount: Integer): Integer;
begin
  Result := ByteCount div SizeOf(Char);
end;

function TUTF16BigEncoding.GetChars(Bytes: PByte; ByteCount: Integer;
  Chars: PChar; CharCount: Integer): Integer;
var
  words: PWord;
  i, wordCount: Integer;
begin
  words := PWord(Bytes);
  wordCount := ByteCount div SizeOf(Char);
{$POINTERMATH ON}
  for i := 0 to wordCount - 1 do
    Chars[i] := Char(bswap16(words[i]));
{$POINTERMATH OFF}
  Result := wordCount;
end;

// -----------------------------------------------------------------------------

function TUTF16BigEncoding.GetMaxByteCount(CharCount: Integer): Integer;
begin
  Result := (CharCount + 1) * SizeOf(Char);
end;

function TUTF16BigEncoding.GetMaxCharCount(ByteCount: Integer): Integer;
begin
  Result := ByteCount div SizeOf(Char) + (ByteCount and 1) + 1;
end;

function TUTF16BigEncoding.GetPreamble: TBytes;
begin
  SetLength(Result, SizeOf(BOM_UTF16BE));
  Move(BOM_UTF16BE[0], Result[0], SizeOf(BOM_UTF16BE));
end;

// -----------------------------------------------------------------------------
// TUTF32LittleEncoding
// -----------------------------------------------------------------------------

function TUTF32LittleEncoding.Clone: TEncoding;
begin
  Result := TUTF32LittleEncoding.Create;
end;

function TUTF32LittleEncoding.GetEncodingName: string;
begin
  Result := GetEncodingNameEx;
end;

class function TUTF32LittleEncoding.GetEncodingNameEx: string;
begin
  Result := 'UTF-32 Little-Endian';
end;

// -----------------------------------------------------------------------------

function TUTF32LittleEncoding.GetByteCount(Chars: PChar; CharCount: Integer): Integer;
var
  i: Integer;
begin
  Result := 0;
  i := 0;
  while i < CharCount do
  begin
    Inc(Result, 1);
    if InRange(Ord(Chars[i]), $D800, $DBFF) then
    begin
{$ifdef DEBUG}
      Assert(i <> CharCount - 1);
      Assert(InRange(Ord(Chars[i + 1]), $DC00, $DFFF));
{$endif}
      Inc(i, 2);
    end
    else
      Inc(i);
  end;
  Result := Result * 4;
end;

function TUTF32LittleEncoding.GetBytes(Chars: PChar; CharCount: Integer;
  Bytes: PByte; ByteCount: Integer): Integer;
var
  i: Integer;
  words: PUInt32;
begin
  Result := 0;
  words := PUint32(Bytes);
{$ifdef DEBUG}
  Assert(ByteCount >= GetByteCount(Chars, CharCount));
{$endif}
  i := 0;
{$POINTERMATH ON}
  while i < CharCount do
  begin
    if InRange(Ord(Chars[i]), $D800, $DFFF) then
    begin
      words[Result] := (((Ord(Chars[i]) - $D800) shl 10)
      + (Ord(Chars[i + 1]) - $DC00)) + $10000;
      Inc(i, 2);
    end
    else begin
      words[Result] := Ord(Chars[i]);
      Inc(i);
    end;
    Inc(Result);
  end;
{$POINTERMATH OFF}
  Result := Result * 4;
end;

// -----------------------------------------------------------------------------

function TUTF32LittleEncoding.GetCharCount(Bytes: PByte; ByteCount: Integer): Integer;
var
  words: PUInt32;
  i, wordCount: Integer;
begin
  Result := 0;
  words := PUint32(Bytes);
  wordCount := ByteCount div 4;
{$ifdef DEBUG}
  Assert(ByteCount mod 4 = 0);
{$endif}
{$POINTERMATH ON}
  for i := 0 to wordCount - 1 do
    Inc(Result, 1 + Ord(words[i] > $FFFF));
{$POINTERMATH OFF}
end;

function TUTF32LittleEncoding.GetChars(Bytes: PByte; ByteCount: Integer;
  Chars: PChar; CharCount: Integer): Integer;
var
  w: UInt32;
  words: PUInt32;
  i, wordCount: Integer;
begin
  Result := 0;
  words := PUint32(Bytes);
  wordCount := ByteCount div 4;
{$ifdef DEBUG}
  Assert(CharCount >= GetCharCount(Bytes, ByteCount));
{$endif}
{$POINTERMATH ON}
  for i := 0 to wordCount - 1 do
  begin
    w := words[i];
    if w > $FFFF then
    begin
      w := w - $10000;
      Chars[Result + 0] := Char((w shr 10) + $D800);
      Chars[Result + 1] := Char((w and $3FF) + $DC00);
      Inc(Result, 2);
    end
    else begin
      Chars[Result] := Char(w);
      Inc(Result, 1);
    end;
  end;
{$POINTERMATH OFF}
end;

// -----------------------------------------------------------------------------

function TUTF32LittleEncoding.GetMaxByteCount(CharCount: Integer): Integer;
begin
  Result := (CharCount + 1) * 4;
end;

function TUTF32LittleEncoding.GetMaxCharCount(ByteCount: Integer): Integer;
begin
  Result := ByteCount div 2 + 1;
end;

function TUTF32LittleEncoding.GetPreamble: TBytes;
begin
  SetLength(Result, SizeOf(BOM_UTF32LE));
  Move(BOM_UTF32LE[0], Result[0], SizeOf(BOM_UTF32LE));
end;

// -----------------------------------------------------------------------------
// TUTF32BigEncoding
// -----------------------------------------------------------------------------

function TUTF32BigEncoding.Clone: TEncoding;
begin
  Result := TUTF32BigEncoding.Create;
end;

function TUTF32BigEncoding.GetEncodingName: string;
begin
  Result := GetEncodingNameEx;
end;

class function TUTF32BigEncoding.GetEncodingNameEx: string;
begin
  Result := 'UTF-32 Big-Endian';
end;

// -----------------------------------------------------------------------------

function bswap32(W: UInt32): UInt32; register;
{$if defined(CPUX86) or defined(CPUX64)}
asm
  bswap eax
{$else}
begin
{$RANGECHECKS OFF}
{$OVERFLOWCHECKS OFF}
  Result := (W and $FF shl 24)
  or (W and $FF00 shl 8)
  or (W and $FF0000 shr 8)
  or (W shr 24);
{$OVERFLOWCHECKS ON}
{$RANGECHECKS ON}
{$endif}
end;

function TUTF32BigEncoding.GetBytes(Chars: PChar; CharCount: Integer;
  Bytes: PByte; ByteCount: Integer): Integer;
var
  i: Integer;
  words: PUInt32;
begin
  Result := 0;
  words := PUint32(Bytes);
{$ifdef DEBUG}
  Assert(ByteCount >= GetByteCount(Chars, CharCount));
{$endif}
  i := 0;
{$POINTERMATH ON}
  while i < CharCount do
  begin
    if InRange(Ord(Chars[i]), $D800, $DFFF) then
    begin
      words[Result] := bswap32((((Ord(Chars[i]) - $D800) shl 10)
      + (Ord(Chars[i + 1]) - $DC00)) + $10000);
      Inc(i, 2);
    end
    else begin
      words[Result] := bswap32(Ord(Chars[i]));
      Inc(i);
    end;
    Inc(Result);
  end;
{$POINTERMATH OFF}
  Result := Result * 4;
end;

// -----------------------------------------------------------------------------

function TUTF32BigEncoding.GetCharCount(Bytes: PByte; ByteCount: Integer): Integer;
var
  words: PUInt32;
  i, wordCount: Integer;
begin
  Result := 0;
  words := PUint32(Bytes);
  wordCount := ByteCount div 4;
{$ifdef DEBUG}
  Assert(ByteCount mod 4 = 0);
{$endif}
{$POINTERMATH ON}
  for i := 0 to wordCount - 1 do
    Inc(Result, 1 + Ord(bswap32(words[i]) > $FFFF));
{$POINTERMATH OFF}
end;

function TUTF32BigEncoding.GetChars(Bytes: PByte; ByteCount: Integer;
  Chars: PChar; CharCount: Integer): Integer;
var
  w: UInt32;
  words: PUInt32;
  i, wordCount: Integer;
begin
  Result := 0;
  words := PUint32(Bytes);
  wordCount := ByteCount div 4;
{$ifdef DEBUG}
  Assert(CharCount >= GetCharCount(Bytes, ByteCount));
{$endif}
{$POINTERMATH ON}
  for i := 0 to wordCount - 1 do
  begin
    w := bswap32(words[i]);
    if w > $FFFF then
    begin
      w := w - $10000;
      Chars[Result + 0] := Char((w shr 10) + $D800);
      Chars[Result + 1] := Char((w and $3FF) + $DC00);
      Inc(Result, 2);
    end
    else begin
      Chars[Result] := Char(w);
      Inc(Result, 1);
    end;
  end;
{$POINTERMATH OFF}
end;

// -----------------------------------------------------------------------------

function TUTF32BigEncoding.GetPreamble: TBytes;
begin
  SetLength(Result, SizeOf(BOM_UTF32BE));
  Move(BOM_UTF32BE[0], Result[0], SizeOf(BOM_UTF32BE));
end;

// -----------------------------------------------------------------------------
// TEncodingEx
// -----------------------------------------------------------------------------

class destructor TEncodingEx.Destroy;
begin
  FreeAndNil(FUTF8BOMEncoding);
  FreeAndNil(FUTF8BOMLessEncoding);
  FreeAndNil(FUTF16LittleEncoding);
  FreeAndNil(FUTF16BigEncoding);
  FreeAndNil(FUTF32LittleEncoding);
  FreeAndNil(FUTF32BigEncoding);
  FreeAndNil(FBinaryEncoding);
  FreeAndNil(FMLangEncoding);
  inherited;
end;

// -----------------------------------------------------------------------------

class function TEncodingEx.CheckBOM(const Buffer: Pointer; const BufferSize: NativeUInt;
  const BOM: Pointer; const BOMSize: NativeUInt): Boolean;
begin
  Result := (BufferSize >= BOMSize) and CompareMem(Buffer, BOM, BOMSize);
end;

class function TEncodingEx.GetBufferEncodingEx(const Buffer: Pointer; const Size: NativeUInt;
  var DetectedEncoding: TDetectedEncoding; var InvalidUTF8: Boolean): Integer;
const
  MaxBytesToInspect = 4096;
var
  c: Cardinal;
  p, buf: PByte;
  i, max, need: NativeUInt;
label
  surrogate_check, invalid_utf8;
begin
  DetectedEncoding := encxUnknown;
  InvalidUTF8 := False;
  if CheckBOM(Buffer, Size, @BOM_UTF8, SizeOf(BOM_UTF8)) then
  begin
    DetectedEncoding := encxUTF8;
    Exit(SizeOf(BOM_UTF8));
  end
  else if CheckBOM(Buffer, Size, @BOM_UTF32LE, SizeOf(BOM_UTF32LE)) then
  begin
    DetectedEncoding := encxUTF32LE;
    Exit(SizeOf(BOM_UTF32LE));
  end
  else if CheckBOM(Buffer, Size, @BOM_UTF32BE, SizeOf(BOM_UTF32BE)) then
  begin
    DetectedEncoding := encxUTF32BE;
    Exit(SizeOf(BOM_UTF32BE));
  end
  else if CheckBOM(Buffer, Size, @BOM_UTF16LE, SizeOf(BOM_UTF16LE)) then
  begin
    DetectedEncoding := encxUTF16LE;
    Exit(SizeOf(BOM_UTF16LE));
  end
  else if CheckBOM(Buffer, Size, @BOM_UTF16BE, SizeOf(BOM_UTF16BE)) then
  begin
    DetectedEncoding := encxUTF16BE;
    Exit(SizeOf(BOM_UTF16BE));
  end;
  // Inspect up to `MaxBytesToInspect` bytes
  Result := 0;
  buf := PByte(Buffer);
  max := Min(Size, MaxBytesToInspect);
  i := 0;
  while i < max do
  begin
    case buf[i] of
    $00..$08, $0B, $0E..$1F, $7F: begin
      DetectedEncoding := encxBinary;
      Exit;
    end;
    $09..$0A, $0C..$0D, $20..$7E: Inc(i);
    $C0..$DF: begin
      need := i + 2;
      if Size < need then
        goto invalid_utf8;
      p := buf + i;
      Inc(i, Ord((p[1] and $C0) = $80));
      Inc(i);
      if i < need then
        Exit;
      c := ((p[0] and $1F) shl 6) or (p[1] and $3F);
      if c < $80 then
        goto invalid_utf8;
      goto surrogate_check;
      Break;
    end;
    $E0..$EF: begin
      need := i + 3;
      if Size < need then
        goto invalid_utf8;
      p := buf + i;
      Inc(i, Ord((p[1] and $C0) = $80));
      Inc(i, Ord((p[2] and $C0) = $80));
      Inc(i);
      if i < need then
        Exit;
      c := ((p[0] and $F) shl 12) or ((p[1] and $3F) shl 6) or (p[2] and $3F);
      if c < $800 then
        goto invalid_utf8;
      goto surrogate_check;
      Break;
    end;
    $F0..$F7: begin
      need := i + 4;
      if Size < need then
        goto invalid_utf8;
      p := buf + i;
      Inc(i, Ord((p[1] and $C0) = $80));
      Inc(i, Ord((p[2] and $C0) = $80));
      Inc(i, Ord((p[3] and $C0) = $80));
      Inc(i);
      if i < need then
        Exit;
      c := ((p[0] and $7) shl 18) or ((p[1] and $3F) shl 12) or ((p[2] and $3F) shl 6) or (p[3] and $3F);
      if c < $10000 then
        goto invalid_utf8;
surrogate_check:
{$RANGECHECKS OFF}
{$OVERFLOWCHECKS OFF}
      if c - $D800 < $800 then
      begin
invalid_utf8:
        InvalidUTF8 := True;
        Exit;
      end;     
{$OVERFLOWCHECKS ON}
{$RANGECHECKS ON}
      Break;
    end;
    else
      Exit;
    end;
  end;
  DetectedEncoding := encxUTF8;
end;

class function TEncodingEx.GetBufferEncodingEx(const Buffer: TBytes; var AEncoding: TEncoding): Integer;
begin
  Result := GetBufferEncodingEx(Buffer, AEncoding, Default);
end;

class function TEncodingEx.GetBufferEncodingEx(const Buffer: TBytes; var AEncoding: TEncoding;
  ADefaultEncoding: TEncoding): Integer;
var
  bom: TBytes;
  enc: TDetectedEncoding;
  utf8inv: Boolean;
begin
  if AEncoding <> nil then
  begin
    bom := AEncoding.GetPreamble;
    if (Length(Buffer) >= Length(bom)) and CompareMem(@Buffer[0], @bom[0], Length(bom)) then
      Exit(Length(bom));
    Exit(0);
  end;
  Result := GetBufferEncodingEx(@Buffer[0], Length(Buffer), enc, utf8inv);
  case enc of
  encxUTF8:
    if Result > 0 then AEncoding := UTF8BOM
    else AEncoding := UTF8BOMLess;
  encxUTF16LE: AEncoding := UTF16LE;
  encxUTF16BE: AEncoding := UTF16BE;
  encxUTF32LE: AEncoding := UTF32LE;
  encxUTF32BE: AEncoding := UTF32BE;
  encxBinary: AEncoding := Binary;
  encxUnknown:
    if  ((ADefaultEncoding is TUTF8BOMEncoding)
      or (ADefaultEncoding is TUTF8BOMLessEncoding)
      or (ADefaultEncoding is TUTF8Encoding)) then
      AEncoding := Default
    else AEncoding := ADefaultEncoding;
  end;
end;

// -----------------------------------------------------------------------------

class function TEncodingEx.GetUTF8BOMEncoding: TEncoding;
var
  enc: TEncoding;
begin
  if FUTF8BOMEncoding = nil then
  begin
    enc := TUTF8BOMEncoding.Create;
    if AtomicCmpExchange(Pointer(FUTF8BOMEncoding), Pointer(enc), nil) <> nil then
      enc.Free
{$ifdef AUTOREFCOUNT}
    else
      FUTF8BOMEncoding.__ObjAddRef
{$endif AUTOREFCOUNT};
  end;
  Result := FUTF8BOMEncoding;
end;

class function TEncodingEx.GetUTF8BOMLessEncoding: TEncoding;
var
  enc: TEncoding;
begin
  if FUTF8BOMLessEncoding = nil then
  begin
    enc := TUTF8BOMLessEncoding.Create;
    if AtomicCmpExchange(Pointer(FUTF8BOMLessEncoding), Pointer(enc), nil) <> nil then
      enc.Free
{$ifdef AUTOREFCOUNT}
    else
      FUTF8BOMLessEncoding.__ObjAddRef
{$endif AUTOREFCOUNT};
  end;
  Result := FUTF8BOMLessEncoding;
end;

class function TEncodingEx.GetUTF16LittleEncoding: TEncoding;
var
  enc: TEncoding;
begin
  if FUTF16LittleEncoding = nil then
  begin
    enc := TUTF16LittleEncoding.Create;
    if AtomicCmpExchange(Pointer(FUTF16LittleEncoding), Pointer(enc), nil) <> nil then
      enc.Free
{$ifdef AUTOREFCOUNT}
    else
      FUTF16LittleEncoding.__ObjAddRef
{$endif AUTOREFCOUNT};
  end;
  Result := FUTF16LittleEncoding;
end;

class function TEncodingEx.GetUTF16BigEncoding: TEncoding;
var
  enc: TEncoding;
begin
  if FUTF16BigEncoding = nil then
  begin
    enc := TUTF16BigEncoding.Create;
    if AtomicCmpExchange(Pointer(FUTF16BigEncoding), Pointer(enc), nil) <> nil then
      enc.Free
{$ifdef AUTOREFCOUNT}
    else
      FUTF16BigEncoding.__ObjAddRef
{$endif AUTOREFCOUNT};
  end;
  Result := FUTF16BigEncoding;
end;

class function TEncodingEx.GetUTF32LittleEncoding: TEncoding;
var
  enc: TEncoding;
begin
  if FUTF32LittleEncoding = nil then
  begin
    enc := TUTF32LittleEncoding.Create;
    if AtomicCmpExchange(Pointer(FUTF32LittleEncoding), Pointer(enc), nil) <> nil then
      enc.Free
{$ifdef AUTOREFCOUNT}
    else
      FUTF32LittleEncoding.__ObjAddRef
{$endif AUTOREFCOUNT};
  end;
  Result := FUTF32LittleEncoding;
end;

class function TEncodingEx.GetUTF32BigEncoding: TEncoding;
var
  enc: TEncoding;
begin
  if FUTF32BigEncoding = nil then
  begin
    enc := TUTF32BigEncoding.Create;
    if AtomicCmpExchange(Pointer(FUTF32BigEncoding), Pointer(enc), nil) <> nil then
      enc.Free
{$ifdef AUTOREFCOUNT}
    else
      FUTF32BigEncoding.__ObjAddRef
{$endif AUTOREFCOUNT};
  end;
  Result := FUTF32BigEncoding;
end;

class function TEncodingEx.GetBinaryEncoding: TEncoding;
var
  enc: TEncoding;
begin
  if FBinaryEncoding = nil then
  begin
    enc := TBinaryEncoding.Create;
    if AtomicCmpExchange(Pointer(FBinaryEncoding), Pointer(enc), nil) <> nil then
      enc.Free
{$ifdef AUTOREFCOUNT}
    else
      FBinaryEncoding.__ObjAddRef
{$endif AUTOREFCOUNT};
  end;
  Result := FBinaryEncoding;
end;

class function TEncodingEx.GetMLangEncoding: TEncoding;
var
  enc: TEncoding;
begin
  if FMLangEncoding = nil then
  begin
    enc := TMLangEncoding.Create;
    if AtomicCmpExchange(Pointer(FMLangEncoding), Pointer(enc), nil) <> nil then
      enc.Free
{$ifdef AUTOREFCOUNT}
    else
      FMLangEncoding.__ObjAddRef
{$endif AUTOREFCOUNT};
  end;
  Result := FMLangEncoding;
end;

end.
