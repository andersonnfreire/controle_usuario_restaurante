object FEnvio: TFEnvio
  Left = -31
  Top = 107
  Width = 1382
  Height = 566
  Caption = 'FEnvio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 606
    Top = 0
    Width = 760
    Height = 527
    Align = alRight
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 606
    Height = 527
    Align = alClient
    Color = clMaroon
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 144
      Top = 48
      Width = 345
      Height = 345
      Caption = 'Email '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 40
        Top = 64
        Width = 38
        Height = 13
        Caption = 'Assunto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 40
        Top = 112
        Width = 99
        Height = 13
        Caption = 'Nome Aparece Email'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Arquivo: TLabel
        Left = 40
        Top = 152
        Width = 36
        Height = 13
        Caption = 'Arquivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object ed_Assunto: TEdit
        Left = 160
        Top = 64
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object ed_nome: TEdit
        Left = 160
        Top = 112
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object ed_arquivo: TEdit
        Left = 160
        Top = 152
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object Panel3: TPanel
        Left = 288
        Top = 152
        Width = 25
        Height = 25
        Caption = '...'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = Panel3Click
      end
      object Panel2: TPanel
        Left = 184
        Top = 216
        Width = 81
        Height = 41
        Caption = 'Enviar'
        Color = clSkyBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = Panel2Click
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = MLista
    Left = 568
    Top = 640
  end
  object MLista: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 568
    Top = 600
    object MListanome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object MListaemail: TStringField
      DisplayWidth = 30
      FieldName = 'email'
      Size = 50
    end
  end
  object IdMessage: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    ContentType = 'text/plain'
    Encoding = meMIME
    From.Name = 'Representantes'
    From.Text = 'Representantes <>'
    Recipients = <>
    ReplyTo = <>
    Left = 216
    Top = 472
  end
  object IdSMTP: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Host = 'smtp.gmail.com'
    Port = 465
    AuthenticationType = atLogin
    Left = 168
    Top = 472
  end
  object OpenDialog1: TOpenDialog
    Left = 96
    Top = 472
  end
end
