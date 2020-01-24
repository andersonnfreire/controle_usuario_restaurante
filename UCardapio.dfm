object FCardapio: TFCardapio
  Left = -8
  Top = -8
  Width = 1382
  Height = 744
  Color = clScrollBar
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel6: TPanel
    Left = 832
    Top = 72
    Width = 529
    Height = 90
    Caption = 'PEDIDOS'
    Color = clMenuHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -40
    Font.Name = 'Nirmala UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1366
    Height = 81
    Align = alTop
    Caption = 'C'#193'RDAPIO'
    Color = clMaroon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -40
    Font.Name = 'Nirmala UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 832
    Top = 496
    Width = 529
    Height = 208
    Color = clMenuHighlight
    TabOrder = 1
    object Panel3: TPanel
      Left = 104
      Top = 80
      Width = 97
      Height = 41
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = Panel3Click
    end
    object Panel4: TPanel
      Left = 240
      Top = 80
      Width = 97
      Height = 41
      Caption = 'Excluir'
      TabOrder = 1
      OnClick = Panel4Click
    end
    object Panel5: TPanel
      Left = 376
      Top = 80
      Width = 97
      Height = 41
      Caption = 'Finalizar'
      TabOrder = 2
      OnClick = Panel5Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 832
    Top = 160
    Width = 529
    Height = 337
    DataSource = ds10
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ds10: TDataSource
    DataSet = dm.QAux2
    Left = 800
    Top = 552
  end
end
