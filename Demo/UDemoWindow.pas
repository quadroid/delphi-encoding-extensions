unit UDemoWindow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  VCL.StdCtrls, VCL.Menus, VCL.ExtDlgs, VCL.ComCtrls;

type
  TDemoWindow = class(TForm)
  private
    procedure LoadFile(Sender: TObject);
    procedure SaveFiles(Sender: TObject);
  public
    Memo: TMemo;
    Menu: TMainMenu;
    Status: TStatusBar;
    constructor Create(AOwner: TComponent); override;
  end;

var
  DemoWindow: TDemoWindow;

implementation

uses
  System.StrUtils, EncodingEx, MLangEncoding;

{$R *.dfm}

var
  loadedEncoding: TDetectedEncoding;

constructor TDemoWindow.Create(AOwner: TComponent);
var
  item: TMenuItem;
begin
  inherited;
  Menu := TMainMenu.Create(Self);
  with Menu do
  begin
    item := TMenuItem.Create(Self);
    with item do
    begin
      Caption := 'Open';
      OnClick := LoadFile;
    end;
    Items.Add(item);
    item := TMenuItem.Create(Self);
    with item do
    begin
      Caption := 'Save';
      OnClick := SaveFiles;
    end;
    Items.Add(item);
  end;
  Memo := TMemo.Create(Self);
  with Memo do
  begin
    Align := alClient;
    BorderStyle := bsNone;
    Parent := Self;
    Font.Name := 'Consolas';
    Font.Size := 11;
    ReadOnly := True;
  end;
  Status := TStatusBar.Create(Self);
  with Status do
  begin
    Align := alBottom;
    Parent := Self;
    with Panels.Add do
      Width := 160;
    with Panels.Add do
      Width := 160;
    with Panels.Add do
      Width := 160;
    Panels.Add;
  end;
end;

function GetFilesPath: string;
begin
  Result := ExtractFilePath(Application.ExeName) + 'files';
end;

procedure TDemoWindow.LoadFile(Sender: TObject);

  procedure LoadFromFileEx(const fileName: string; enc: TEncoding);
  begin
    Memo.Lines.LoadFromFile(fileName, enc);
    Status.Panels[0].Text := '';
    Status.Panels[1].Text := enc.EncodingName;
    Status.Panels[2].Text := '';
    if enc is TUTF8BOMLessEncoding then loadedEncoding := encxUTF8
    else if enc is TUTF8BOMEncoding then loadedEncoding := encxUTF8
    else if enc is TUTF16LittleEncoding then loadedEncoding := encxUTF16LE
    else if enc is TUTF16BigEncoding then loadedEncoding := encxUTF16BE
    else if enc is TUTF32LittleEncoding then loadedEncoding := encxUTF32LE
    else if enc is TUTF32BigEncoding then loadedEncoding := encxUTF32BE
    else if enc is TMLangEncoding then loadedEncoding := encxUnknown
    else if enc is TBinaryEncoding then loadedEncoding := encxUnknown;
  end;

var
  fs: TFileStream;
  enc: TDetectedEncoding;
  invutf8: boolean;
  buffer: TBytes;
  bomSize: integer;
  encs: TStringList;
  encObj: TEncoding;
begin
  encs := TStringList.Create;
  with Memo.Lines,
  {$if false}TFileOpenDialog{$else}TOpenTextFileDialog{$endif}.Create(Self) do
    try
{$if false}
      with FileTypes.Add do
      begin
        DisplayName := 'All Files (*.*)';
        FileMask := '*.*';
      end;
{$else}
      encs.Text := 'Auto-detect' + #13#10
      + TUTF8BOMLessEncoding.EncodingName + #13#10
      + TUTF8BOMEncoding.EncodingName + ' with BOM' + #13#10
      + TUTF16LittleEncoding.EncodingName + #13#10
      + TUTF16BigEncoding.EncodingName + #13#10
      + TUTF32LittleEncoding.EncodingName + #13#10
      + TUTF32BigEncoding.EncodingName + #13#10
      + TEncodingEx.MLang.EncodingName + #13#10
      + TBinaryEncoding.EncodingName;
      Encodings := encs;
      Filter := 'All Files (*.*)|*.*';
      InitialDir := GetFilesPath;
{$endif}
      if Execute(Self.Handle) then
      begin
        case EncodingIndex of
        0: begin
          fs := TFileStream.Create(FileName, fmOpenRead);
          try
            SetLength(buffer, fs.Size);
            fs.Read(buffer[0], fs.Size);
            bomSize := TEncodingEx.GetBufferEncodingEx(@buffer[0], fs.Size, enc, invutf8);
          finally
            fs.Free;
          end;
          TEncodingEx.GetBufferEncodingEx(buffer, encObj, TEncodingEx.UTF8BOMLess);
          Status.Panels[0].Text := 'BOM size: ' + IntToStr(bomSize);
          Status.Panels[1].Text := encObj.EncodingName;
          Status.Panels[2].Text := IfThen(invutf8, 'Invalid UTF-8', '');
          LoadFromFile(FileName, encObj);
          loadedEncoding := enc;
        end;
        1: LoadFromFileEx(FileName, TEncodingEx.UTF8BOMLess);
        2: LoadFromFileEx(FileName, TEncodingEx.UTF8BOM);
        3: LoadFromFileEx(FileName, TEncodingEx.UTF16LE);
        4: LoadFromFileEx(FileName, TEncodingEx.UTF16BE);
        5: LoadFromFileEx(FileName, TEncodingEx.UTF32LE);
        6: LoadFromFileEx(FileName, TEncodingEx.UTF32BE);
        7: LoadFromFileEx(FileName, TEncodingEx.MLang);
        8: LoadFromFileEx(FileName, TEncodingEx.Binary);
        else
          Exit;
        end;
      end;
    finally
      encs.Free;
      Free;
    end;
end;

procedure TDemoWindow.SaveFiles(Sender: TObject);
var
  dir: string;
begin
  dir := GetFilesPath;
  if not DirectoryExists(dir, False) then
    exit;
  dir := dir + PathDelim;
  with Memo.Lines do
  begin
    if Status.Panels[1].Text = TBinaryEncoding.EncodingName then
      SaveToFile(dir + 'bin.out.txt', TEncodingEx.Binary)
    else begin
      SaveToFile(dir + 'ansi.out.txt', TEncodingEx.MLang);
      SaveToFile(dir + 'utf8.out.txt', TEncodingEx.UTF8BOMLess);
      SaveToFile(dir + 'utf8bom.out.txt', TEncodingEx.UTF8BOM);
      SaveToFile(dir + 'utf16le.out.txt', TEncodingEx.UTF16LE);
      SaveToFile(dir + 'utf16be.out.txt', TEncodingEx.UTF16BE);
      SaveToFile(dir + 'utf32le.out.txt', TEncodingEx.UTF32LE);
      SaveToFile(dir + 'utf32be.out.txt', TEncodingEx.UTF32BE);
    end;
  end;
end;

end.
