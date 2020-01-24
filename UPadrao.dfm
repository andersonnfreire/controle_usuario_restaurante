object FPadrao: TFPadrao
  Left = 174
  Top = 124
  Width = 1142
  Height = 480
  Caption = 'FPadrao'
  Color = clScrollBar
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1126
    Height = 29
    Caption = 'ToolBar1'
    Color = cl3DLight
    Images = dm.img
    ParentColor = False
    TabOrder = 0
    object btNovo: TToolButton
      Left = 0
      Top = 2
      Caption = 'btNovo'
      ImageIndex = 0
      OnClick = btNovoClick
    end
    object btDeletar: TToolButton
      Left = 23
      Top = 2
      Caption = 'btDeletar'
      ImageIndex = 1
      OnClick = btDeletarClick
    end
    object btAlterar: TToolButton
      Left = 46
      Top = 2
      Caption = 'btAlterar'
      ImageIndex = 7
      OnClick = btAlterarClick
    end
    object btCancelar: TToolButton
      Left = 69
      Top = 2
      Caption = 'btCancelar'
      ImageIndex = 6
      OnClick = btCancelarClick
    end
    object btPesquisar: TToolButton
      Left = 92
      Top = 2
      Caption = 'btPesquisar'
      ImageIndex = 10
      OnClick = btPesquisarClick
    end
    object btSalvar: TToolButton
      Left = 115
      Top = 2
      Caption = 'btSalvar'
      ImageIndex = 9
      OnClick = btSalvarClick
    end
    object btPrimeiro: TToolButton
      Left = 138
      Top = 2
      Caption = 'btPrimeiro'
      ImageIndex = 2
      OnClick = btPrimeiroClick
    end
    object btAnt: TToolButton
      Left = 161
      Top = 2
      Caption = 'btAnt'
      ImageIndex = 5
      OnClick = btAntClick
    end
    object btProx: TToolButton
      Left = 184
      Top = 2
      Caption = 'btProx'
      ImageIndex = 4
      OnClick = btProxClick
    end
    object btUltimo: TToolButton
      Left = 207
      Top = 2
      Caption = 'btUltimo'
      ImageIndex = 3
      OnClick = btUltimoClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 29
    Width = 1126
    Height = 412
    ActivePage = tbDados
    Align = alClient
    TabOrder = 1
    object tbDados: TTabSheet
      Caption = 'Dados'
      object grDados: TGroupBox
        Left = 0
        Top = 0
        Width = 1118
        Height = 384
        Align = alClient
        Color = cl3DLight
        ParentColor = False
        TabOrder = 0
      end
    end
    object tbFiltros: TTabSheet
      Caption = 'Filtros'
      ImageIndex = 1
      object grFiltros: TGroupBox
        Left = 0
        Top = 0
        Width = 1118
        Height = 105
        Align = alTop
        Color = clScrollBar
        ParentColor = False
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 105
        Width = 1118
        Height = 279
        Align = alClient
        DataSource = ds
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  object ds: TDataSource
    OnStateChange = dsStateChange
    Left = 320
  end
  object ds1: TDataSource
    Left = 352
  end
  object ds2: TDataSource
    Left = 384
  end
  object ds3: TDataSource
    Left = 424
  end
  object DataSource1: TDataSource
    Left = 464
  end
end
