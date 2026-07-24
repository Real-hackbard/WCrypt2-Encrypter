unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.Shell.ShellCtrls, Vcl.Samples.Spin, Vcl.StdCtrls,
  Vcl.ExtCtrls, WCrypt2;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    Button4: TButton;
    OpenDialog1: TOpenDialog;
    Button5: TButton;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Button2: TButton;
    Edit2: TEdit;
    Label5: TLabel;
    GroupBox3: TGroupBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit3: TEdit;
    Button3: TButton;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ComboBox4: TComboBox;
    OpenDialog2: TOpenDialog;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    ProgressBar1: TProgressBar;
    Label17: TLabel;
    Edit4: TEdit;
    Label18: TLabel;
    Edit5: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
{ Generates random character strings (passwords or cryptic IDs).
  It constructs strings by concatenating random ASCII characters. }
function RandomWord(dictSize, lngStepSize, wordLen, minWordLen: Integer): string;
begin
  Result := '';
  if (wordLen < minWordLen) and (minWordLen > 0) then
    wordLen := minWordLen
  else if (wordLen < 1) and (minWordLen < 1) then wordLen := 1;
  repeat
    Result := Result + Chr(Random(dictSize) + lngStepSize);
  until (Length(Result) = wordLen);
end;

// Precise determination of the file size.
function Get_File_Size(const S: string): Int64;
var
  FD: TWin32FindData;
  FH: THandle;
begin
  FH := FindFirstFile(PChar(S), FD);
  if FH = INVALID_HANDLE_VALUE then Result := 0
  else
    try
      Result := FD.nFileSizeHigh;
      Result := Result shl 32;
      Result := Result + FD.nFileSizeLow;
    finally
      //CloseHandle(FH);
    end;
end;

// encrypt file
procedure CryptFile(const SourceFileName, DestinationFileName,
                  Password: string; ToCrypt: Boolean);
var
  hProv: HCRYPTPROV;
  hash: HCRYPTHASH;
  key: HCRYPTKEY;

  Buffer: PByte;
  len: dWord;
  fsIn, fsOut: TFileStream;
  IsEndOfFile: Boolean;
  i : integer;
begin
  {get context for crypt default provider}
  case Form1.ComboBox1.ItemIndex of
    0 : CryptAcquireContext(@hProv, nil, nil, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT);
    1 : CryptAcquireContext(@hProv, nil, nil, PROV_RSA_SIG, CRYPT_VERIFYCONTEXT);
    2 : CryptAcquireContext(@hProv, nil, nil, PROV_DSS, CRYPT_VERIFYCONTEXT);
    3 : CryptAcquireContext(@hProv, nil, nil, PROV_FORTEZZA, CRYPT_VERIFYCONTEXT);
    4 : CryptAcquireContext(@hProv, nil, nil, PROV_MS_EXCHANGE, CRYPT_VERIFYCONTEXT);
    5 : CryptAcquireContext(@hProv, nil, nil, PROV_SSL, CRYPT_VERIFYCONTEXT);
    6 : CryptAcquireContext(@hProv, nil, nil, PROV_RSA_SCHANNEL, CRYPT_VERIFYCONTEXT);
    7 : CryptAcquireContext(@hProv, nil, nil, PROV_DSS_DH, CRYPT_VERIFYCONTEXT);
    8 : CryptAcquireContext(@hProv, nil, nil, PROV_EC_ECDSA_SIG, CRYPT_VERIFYCONTEXT);
    9 : CryptAcquireContext(@hProv, nil, nil, PROV_EC_ECNRA_SIG, CRYPT_VERIFYCONTEXT);
    10 : CryptAcquireContext(@hProv, nil, nil, PROV_EC_ECDSA_FULL, CRYPT_VERIFYCONTEXT);
    11 : CryptAcquireContext(@hProv, nil, nil, PROV_EC_ECNRA_FULL, CRYPT_VERIFYCONTEXT);
    12 : CryptAcquireContext(@hProv, nil, nil, PROV_SPYRUS_LYNKS, CRYPT_VERIFYCONTEXT);
    13 : CryptAcquireContext(@hProv, nil, nil, PROV_STT_MER, CRYPT_VERIFYCONTEXT);
    14 : CryptAcquireContext(@hProv, nil, nil, PROV_STT_ACQ, CRYPT_VERIFYCONTEXT);
    15 : CryptAcquireContext(@hProv, nil, nil, PROV_STT_BRND, CRYPT_VERIFYCONTEXT);
    16 : CryptAcquireContext(@hProv, nil, nil, PROV_STT_ROOT, CRYPT_VERIFYCONTEXT);
    17 : CryptAcquireContext(@hProv, nil, nil, PROV_STT_ISS, CRYPT_VERIFYCONTEXT);
  end;

  {create hash-object }
  case Form1.ComboBox1.ItemIndex of
    0 : CryptCreateHash(hProv, CALG_MD2, 0, 0, @hash);
    1 : CryptCreateHash(hProv, CALG_MD4, 0, 0, @hash);
    2 : CryptCreateHash(hProv, CALG_MD5, 0, 0, @hash);
    3 : CryptCreateHash(hProv, CALG_SHA, 0, 0, @hash);
    4 : CryptCreateHash(hProv, CALG_SHA1, 0, 0, @hash);
    5 : CryptCreateHash(hProv, CALG_MAC, 0, 0, @hash);
    6 : CryptCreateHash(hProv, CALG_HMAC, 0, 0, @hash);
    7 : CryptCreateHash(hProv, CALG_SSL3_SHAMD5, 0, 0, @hash);
  end;

  {create key from hash by algorithm}
  case Form1.ComboBox2.ItemIndex of
    0 : CryptDeriveKey(hProv, CALG_DES, hash, 0, @key);
    1 : CryptDeriveKey(hProv, CALG_3DES_112, hash, 0, @key);
    2 : CryptDeriveKey(hProv, CALG_3DES, hash, 0, @key);
    3 : CryptDeriveKey(hProv, CALG_RC2, hash, 0, @key);
    4 : CryptDeriveKey(hProv, CALG_RC4, hash, 0, @key);
    5 : CryptDeriveKey(hProv, CALG_RC5, hash, 0, @key);
    6 : CryptDeriveKey(hProv, CALG_SEAL, hash, 0, @key);
    7 : CryptDeriveKey(hProv, CALG_SKIPJACK, hash, 0, @key);
    8 : CryptDeriveKey(hProv, CALG_TEK, hash, 0, @key);
    9 : CryptDeriveKey(hProv, CALG_CYLINK_MEK, hash, 0, @key);
    10 : CryptDeriveKey(hProv, CALG_SSL3_MASTER, hash, 0, @key);
    11 : CryptDeriveKey(hProv, CALG_SCHANNEL_MASTER_HASH, hash, 0, @key);
    12 : CryptDeriveKey(hProv, CALG_SCHANNEL_MAC_KEY, hash, 0, @key);
    13 : CryptDeriveKey(hProv, CALG_SCHANNEL_ENC_KEY, hash, 0, @key);
    14 : CryptDeriveKey(hProv, CALG_PCT1_MASTER, hash, 0, @key);
    15 : CryptDeriveKey(hProv, CALG_TLS1_MASTER, hash, 0, @key);

  end;

  {get hash from password}
  CryptHashData(hash, @Password[1], Length(Password), 0);

  {destroy hash-object}
  CryptDestroyHash(hash);

  {open source+destination files}
  fsIn := TFileStream.Create(SourceFileName, fmOpenRead or fmShareDenyWrite);
  fsOut := TFileStream.Create(DestinationFileName, fmCreate);
  try
    {allocate buffer to read content from source file}
    GetMem(Buffer, StrToInt(Form1.ComboBox3.Text));

    repeat
      { check whether the stream's data pointer (the position) is at the
        end of the stream or beyond it. }
      IsEndOfFile := (fsIn.Position >= fsIn.Size);
      if IsEndOfFile then break;

      // display progress status
      Form1.ProgressBar1.StepIt;

      {read content from source file}
      len := fsIn.Read(Buffer^, StrToInt(Form1.ComboBox3.Text));

      if ToCrypt then
        {crypt buffer}
        CryptEncrypt(key, 0, IsEndOfFile, 0, Buffer, @len, len)
      else
        {decrypt buffer}
        CryptDecrypt(key, 0, IsEndOfFile, 0, Buffer, @len);

      {write changed buffer to destination file}
      fsOut.Write(Buffer^, len)
    until IsEndOfFile;

    {release memory allocated for buffer}
    FreeMem(Buffer, StrToInt(Form1.ComboBox3.Text));
  finally
    fsIn.Free;
    fsOut.Free;
  end;

  {release the context for crypt default provider}
  CryptReleaseContext(hProv, 0);

  Form1.Edit1.Clear;
  Form1.Edit2.Clear;
  Form1.StatusBar1.Panels[3].Text := 'ready.';
  Form1.StatusBar1.Panels[5].Text := '0 kb';
  Form1.StatusBar1.Panels[1].Text := 'done.';
  Form1.ProgressBar1.Position := Form1.ProgressBar1.Max;
  MessageDlg('Process finish!',mtInformation, [mbOK], 0);
end;

// load file
procedure TForm1.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Edit1.Text := OpenDialog1.FileName;
    // display encrypted file name
    Edit4.Text := ExtractFileName(OpenDialog1.FileName) + '.wcrypt2';
    Button4.Enabled := true;
    Button5.Enabled := false;
    StatusBar1.Panels[3].Text := ExtractFileExt(OpenDialog1.FileName);
    // display file size
    StatusBar1.Panels[5].Text := IntToStr(Get_File_Size(OpenDialog1.FileName) div 1000) + ' kb';
    StatusBar1.Panels[1].Text := 'File loaded.';
  end;
  StatusBar1.SetFocus;
end;

// load encrypted file
procedure TForm1.Button2Click(Sender: TObject);
var
  s : string;
begin
  if OpenDialog2.Execute then
  begin
    // Check whether the encrypted file is a wcrypt2 file.
    if not (ExtractFileExt(OpenDialog2.FileName) = '.wcrypt2') then
    begin
      MessageDlg('The file is not an encrypted file that was encrypted with WCrypt2.',
                  mtWarning, [mbOK], 0);
      Exit;
    end;

    s := OpenDialog2.FileName;
    // Cut off the suffix.
    s := Copy(s, 1 ,length(s)-8);
    Edit2.Text := OpenDialog2.FileName;
    // display new name
    Edit5.Text := ExtractFileName(s);
    Button4.Enabled := false;
    Button5.Enabled := true;
    StatusBar1.Panels[3].Text := ExtractFileExt(OpenDialog2.FileName);
    // display file size
    StatusBar1.Panels[5].Text := IntToStr(Get_File_Size(OpenDialog2.FileName) div 1000) + ' kb';
    StatusBar1.Panels[1].Text := 'WCrypt2 found.';
  end;
  StatusBar1.SetFocus;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    MessageDlg('Load file to decrypt!',mtInformation, [mbOK], 0);  // go out when no key
    Exit;
  end;

  if Edit3.Text = '' then
  begin
    MessageDlg('No key found, Generate Password',mtInformation, [mbOK], 0);  // go out when no key
    Exit;
  end;

  // encrypt file
  CryptFile(Edit1.Text, Edit1.Text + '.wcrypt2', Edit3.Text, True);
  StatusBar1.SetFocus;
  StatusBar1.Panels[1].Text := 'ready.';
  // update program
  Application.ProcessMessages;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if Edit2.Text = '' then
  begin
    MessageDlg('Load file to decrypt!',mtInformation, [mbOK], 0);  // go out when no file
    Exit;
  end;

  if Edit3.Text = '' then
  begin
    ShowMessage('No Key !');  // go out when no key
    Exit;
  end;

  // decrypt file
  CryptFile(Edit2.Text, ExtractFileDir(Edit2.Text) + '\' + Edit5.Text, Edit3.Text, False);
  StatusBar1.SetFocus;
  StatusBar1.Panels[1].Text := 'ready.';
  Application.ProcessMessages;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Edit3.Text := RandomWord(SpinEdit3.Value,          // dic size
                           SpinEdit4.Value,          // step size
                           Random(SpinEdit1.Value),  // length
                           SpinEdit2.Value);         // chars
  StatusBar1.SetFocus;
  Application.ProcessMessages;
end;

end.
 