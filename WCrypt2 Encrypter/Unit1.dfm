object Form1: TForm1
  Left = 452
  Top = 171
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'WCrypt2 any File encrypter'
  ClientHeight = 436
  ClientWidth = 850
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object Label17: TLabel
    Left = 16
    Top = 388
    Width = 47
    Height = 13
    Caption = 'Progress :'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 417
    Width = 850
    Height = 19
    Panels = <
      item
        Text = 'Status :'
        Width = 50
      end
      item
        Text = 'ready.'
        Width = 100
      end
      item
        Text = 'Ext:'
        Width = 30
      end
      item
        Width = 70
      end
      item
        Text = 'Size :'
        Width = 30
      end
      item
        Text = '0 kb'
        Width = 50
      end>
    ExplicitTop = 416
    ExplicitWidth = 846
  end
  object Button4: TButton
    Left = 670
    Top = 383
    Width = 75
    Height = 25
    Caption = 'Crypt'
    Enabled = False
    TabOrder = 1
    TabStop = False
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 751
    Top = 383
    Width = 75
    Height = 25
    Caption = 'Decrypt'
    Enabled = False
    TabOrder = 2
    TabStop = False
    OnClick = Button5Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 850
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitWidth = 846
    object Label5: TLabel
      Left = 15
      Top = 6
      Width = 248
      Height = 39
      Caption = 'WCrypt2 encrypter'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Impact'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 25
      Top = 42
      Width = 449
      Height = 13
      Caption = 
        'File encryptor that employs a keyed hash algorithm and a Cryptog' +
        'raphic Service Provider (CSP).'
    end
  end
  object GroupBox1: TGroupBox
    Left = 9
    Top = 81
    Width = 393
    Height = 122
    Caption = ' Encrypter '
    TabOrder = 4
    object Label3: TLabel
      Left = 60
      Top = 53
      Width = 22
      Height = 13
      Caption = 'File :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 31
      Top = 80
      Width = 51
      Height = 13
      Caption = 'Ouput file :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 357
      Top = 50
      Width = 26
      Height = 21
      Caption = '...'
      TabOrder = 0
      TabStop = False
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 88
      Top = 50
      Width = 263
      Height = 21
      TabStop = False
      TabOrder = 1
    end
    object Edit4: TEdit
      Left = 88
      Top = 77
      Width = 263
      Height = 21
      TabStop = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 9
    Top = 221
    Width = 393
    Height = 145
    Caption = ' Decrypter '
    TabOrder = 5
    object Label4: TLabel
      Left = 12
      Top = 48
      Width = 70
      Height = 13
      Caption = 'Encrypted file :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 31
      Top = 75
      Width = 51
      Height = 13
      Caption = 'Ouput file :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Button2: TButton
      Left = 357
      Top = 45
      Width = 26
      Height = 21
      Caption = '...'
      TabOrder = 0
      TabStop = False
      OnClick = Button2Click
    end
    object Edit2: TEdit
      Left = 88
      Top = 45
      Width = 263
      Height = 21
      TabStop = False
      TabOrder = 1
    end
    object Edit5: TEdit
      Left = 88
      Top = 72
      Width = 263
      Height = 21
      TabStop = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
  end
  object GroupBox3: TGroupBox
    Left = 417
    Top = 221
    Width = 425
    Height = 145
    Caption = ' Functions '
    TabOrder = 6
    object Label6: TLabel
      Left = 33
      Top = 31
      Width = 31
      Height = 13
      Caption = 'Hash :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 40
      Top = 58
      Width = 24
      Height = 13
      Caption = 'Key :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 30
      Top = 85
      Width = 34
      Height = 13
      Caption = 'Buffer :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 37
      Top = 112
      Width = 27
      Height = 13
      Caption = 'CSP :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 263
      Top = 31
      Width = 43
      Height = 13
      Caption = 'Algorithm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 263
      Top = 58
      Width = 91
      Height = 13
      Caption = 'Hash Key algorithm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 263
      Top = 85
      Width = 54
      Height = 13
      Caption = 'Size (bytes)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 263
      Top = 112
      Width = 146
      Height = 13
      Caption = 'Cryptographic Service Provider'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 70
      Top = 28
      Width = 187
      Height = 21
      Style = csDropDownList
      ItemIndex = 4
      TabOrder = 0
      TabStop = False
      Text = 'SHA1'
      Items.Strings = (
        'MD2'
        'MD4'
        'MD5'
        'SHA'
        'SHA1'
        'MAC'
        'HMAC'
        'SSL3')
    end
    object ComboBox2: TComboBox
      Left = 70
      Top = 55
      Width = 187
      Height = 21
      Style = csDropDownList
      DropDownCount = 17
      ItemIndex = 4
      TabOrder = 1
      TabStop = False
      Text = 'RC4'
      Items.Strings = (
        'DES'
        '3DES_112'
        '3DES'
        'RC2'
        'RC4'
        'RC5'
        'SEAL'
        'SKIPJACK'
        'TEK'
        'CYLINK_MEK'
        'SSL3_MASTER'
        'SCHANNEL_MASTER_HASH'
        'SCHANNEL_MAC_KEY'
        'SCHANNEL_ENC_KEY'
        'PCT1_MASTER'
        'SSL2_MASTER'
        'TLS1_MASTER')
    end
    object ComboBox3: TComboBox
      Left = 70
      Top = 82
      Width = 187
      Height = 21
      Style = csDropDownList
      ItemIndex = 3
      TabOrder = 2
      TabStop = False
      Text = '1024'
      Items.Strings = (
        '128'
        '256'
        '512'
        '1024'
        '2048'
        '4096'
        '8192')
    end
    object ComboBox4: TComboBox
      Left = 70
      Top = 109
      Width = 187
      Height = 21
      Style = csDropDownList
      DropDownCount = 19
      ItemIndex = 0
      TabOrder = 3
      TabStop = False
      Text = 'RSA FUL = 1'
      Items.Strings = (
        'RSA FUL = 1'
        'RSA SIG = 2'
        'DSS = 3'
        'FORTEZZA = 4'
        'MS EXCHANGE = 5'
        'SSL = 6'
        'RSA SCHANNEL = 12'
        'DSS DH = 13'
        'EC ECDSA_SIG = 14'
        'EC ECNRA_SIG = 15'
        'EC ECDSA_FULL = 16'
        'EC ECNRA_FULL = 17'
        'SPYRUS LYNKS = 20'
        'STT MER = 7'
        'STT ACQ = 8'
        'STT BRND = 9'
        'STT ROOT = 10'
        'STT ISS = 11')
    end
  end
  object GroupBox4: TGroupBox
    Left = 417
    Top = 81
    Width = 425
    Height = 122
    Caption = ' Password '
    TabOrder = 7
    object Label1: TLabel
      Left = 27
      Top = 31
      Width = 39
      Height = 13
      Caption = 'Lenght :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 33
      Top = 56
      Width = 33
      Height = 13
      Caption = 'Chars :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 14
      Top = 91
      Width = 52
      Height = 13
      Caption = 'Password :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 213
      Top = 35
      Width = 46
      Height = 13
      Caption = 'Dict size :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 210
      Top = 63
      Width = 49
      Height = 13
      Caption = 'Step size :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Edit3: TEdit
      Left = 72
      Top = 88
      Width = 258
      Height = 21
      TabStop = False
      TabOrder = 0
      Text = '12345'
    end
    object Button3: TButton
      Left = 336
      Top = 88
      Width = 75
      Height = 21
      Caption = 'Generate'
      TabOrder = 1
      TabStop = False
      OnClick = Button3Click
    end
    object SpinEdit1: TSpinEdit
      Left = 72
      Top = 28
      Width = 65
      Height = 22
      TabStop = False
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 20
    end
    object SpinEdit2: TSpinEdit
      Left = 72
      Top = 56
      Width = 65
      Height = 22
      TabStop = False
      MaxValue = 0
      MinValue = 0
      TabOrder = 3
      Value = 20
    end
    object SpinEdit3: TSpinEdit
      Left = 265
      Top = 32
      Width = 65
      Height = 22
      TabStop = False
      MaxValue = 0
      MinValue = 0
      TabOrder = 4
      Value = 33
    end
    object SpinEdit4: TSpinEdit
      Left = 265
      Top = 60
      Width = 65
      Height = 22
      TabStop = False
      MaxValue = 0
      MinValue = 0
      TabOrder = 5
      Value = 54
    end
  end
  object ProgressBar1: TProgressBar
    Left = 69
    Top = 387
    Width = 323
    Height = 17
    TabOrder = 8
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Any file (*.*)|*.*'
    Left = 216
    Top = 16
  end
  object OpenDialog2: TOpenDialog
    Filter = 'WCrypt2 file (*.wcrypt2)|*.wcrypt2'
    Left = 312
    Top = 15
  end
end
