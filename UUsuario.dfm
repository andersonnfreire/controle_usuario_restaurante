inherited FUsuario: TFUsuario
  Left = 168
  Top = 375
  Width = 1202
  Height = 744
  Caption = 'FUsuario'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 1186
  end
  inherited PageControl1: TPageControl
    Width = 1186
    Height = 676
    inherited tbDados: TTabSheet
      inherited grDados: TGroupBox
        Width = 1178
        Height = 648
        object Label1: TLabel
          Left = 32
          Top = 48
          Width = 42
          Height = 13
          Caption = 'C'#211'DIGO'
        end
        object Label2: TLabel
          Left = 32
          Top = 144
          Width = 32
          Height = 13
          Caption = 'NOME'
        end
        object Label3: TLabel
          Left = 32
          Top = 264
          Width = 37
          Height = 13
          Caption = 'SENHA'
        end
        object Label10: TLabel
          Left = 32
          Top = 208
          Width = 33
          Height = 13
          Caption = 'LOGIN'
          FocusControl = DBEdit9
        end
        object GroupBox1: TGroupBox
          Left = 288
          Top = 8
          Width = 873
          Height = 121
          Caption = '   Escolha as cores  '
          Color = clWhite
          ParentColor = False
          TabOrder = 0
          object Label4: TLabel
            Left = 24
            Top = 24
            Width = 64
            Height = 13
            Caption = 'COR DADOS'
          end
          object Label5: TLabel
            Left = 184
            Top = 24
            Width = 172
            Height = 13
            Caption = 'COR DOS EDITS DESABILITADOS'
          end
          object Label6: TLabel
            Left = 376
            Top = 24
            Width = 111
            Height = 13
            Caption = 'COR DO EDIT FUNDO'
          end
          object Label7: TLabel
            Left = 536
            Top = 24
            Width = 140
            Height = 13
            Caption = 'COR DA BARRA PRINCIPAL'
          end
          object Label8: TLabel
            Left = 696
            Top = 24
            Width = 71
            Height = 13
            Caption = 'COR FILTROS'
          end
          object corInterface: TColorBox
            Left = 24
            Top = 49
            Width = 145
            Height = 22
            Selected = clGreen
            ItemHeight = 16
            TabOrder = 0
            OnSelect = corInterfaceSelect
          end
          object corEditDesabilitado: TColorBox
            Left = 184
            Top = 48
            Width = 145
            Height = 22
            Selected = clGreen
            ItemHeight = 16
            TabOrder = 1
            OnSelect = corEditDesabilitadoSelect
          end
          object corEditFundo: TColorBox
            Left = 376
            Top = 48
            Width = 145
            Height = 22
            Selected = clGreen
            ItemHeight = 16
            TabOrder = 2
            OnSelect = corEditFundoSelect
          end
          object corBarraPrincipal: TColorBox
            Left = 536
            Top = 48
            Width = 145
            Height = 22
            Selected = clGreen
            ItemHeight = 16
            TabOrder = 3
            OnSelect = corBarraPrincipalSelect
          end
          object corTelaFundo: TColorBox
            Left = 696
            Top = 48
            Width = 145
            Height = 22
            Selected = clGreen
            ItemHeight = 16
            TabOrder = 4
            OnSelect = corTelaFundoSelect
          end
          object DBEdit4: TDBEdit
            Left = 24
            Top = 88
            Width = 145
            Height = 21
            DataField = 'corInterface'
            DataSource = ds
            TabOrder = 5
          end
          object DBEdit5: TDBEdit
            Left = 184
            Top = 88
            Width = 145
            Height = 21
            DataField = 'corEditDesabilidato'
            DataSource = ds
            TabOrder = 6
          end
          object DBEdit6: TDBEdit
            Left = 376
            Top = 88
            Width = 145
            Height = 21
            DataField = 'corEditFundo'
            DataSource = ds
            TabOrder = 7
          end
          object DBEdit7: TDBEdit
            Left = 536
            Top = 88
            Width = 145
            Height = 21
            DataField = 'corBarraPrincipal'
            DataSource = ds
            TabOrder = 8
          end
          object DBEdit8: TDBEdit
            Left = 696
            Top = 84
            Width = 145
            Height = 21
            DataField = 'corTelaFundoPrincipal'
            DataSource = ds
            TabOrder = 9
          end
        end
        object gbEscolha: TGroupBox
          Left = 288
          Top = 128
          Width = 865
          Height = 457
          Caption = 'Escolha sua Tela'
          Color = clWhite
          Enabled = False
          ParentColor = False
          TabOrder = 1
          Visible = False
          object Label9: TLabel
            Left = 8
            Top = 24
            Width = 3
            Height = 13
          end
          object add: TPanel
            Left = 200
            Top = 104
            Width = 57
            Height = 33
            Caption = '+'
            TabOrder = 0
            OnClick = addClick
          end
          object remove: TPanel
            Left = 280
            Top = 104
            Width = 65
            Height = 33
            Caption = '-'
            TabOrder = 1
            OnClick = removeClick
          end
          object DBGrid2: TDBGrid
            Left = 0
            Top = 152
            Width = 641
            Height = 297
            DataSource = ds3
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
          end
          object GBConfiguracao: TGroupBox
            Left = 216
            Top = 24
            Width = 633
            Height = 57
            Caption = 'Configura'#231#245'es'
            Enabled = False
            TabOrder = 3
            object CBInserir: TCheckBox
              Left = 48
              Top = 24
              Width = 97
              Height = 17
              Caption = 'Inserir'
              TabOrder = 0
            end
            object CBAlterar: TCheckBox
              Left = 160
              Top = 24
              Width = 97
              Height = 17
              Caption = 'alterar'
              TabOrder = 1
            end
            object CBPesquisar: TCheckBox
              Left = 416
              Top = 24
              Width = 97
              Height = 17
              Caption = 'pesquisar'
              TabOrder = 2
            end
            object CBExcluir: TCheckBox
              Left = 288
              Top = 24
              Width = 97
              Height = 17
              Caption = 'excluir'
              TabOrder = 3
            end
          end
          object ComboBox1: TComboBox
            Left = 16
            Top = 40
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 4
            OnEnter = ComboBox1Enter
          end
        end
        object DBEdit1: TDBEdit
          Left = 32
          Top = 72
          Width = 81
          Height = 21
          TabStop = False
          DataField = 'idUsuario'
          DataSource = ds
          Enabled = False
          TabOrder = 2
        end
        object DBEdit2: TDBEdit
          Left = 32
          Top = 168
          Width = 153
          Height = 21
          DataField = 'nome'
          DataSource = ds
          TabOrder = 3
        end
        object DBEdit3: TDBEdit
          Left = 32
          Top = 288
          Width = 153
          Height = 21
          DataField = 'senha'
          DataSource = ds
          TabOrder = 4
        end
        object DBEdit9: TDBEdit
          Left = 32
          Top = 232
          Width = 153
          Height = 21
          DataField = 'login'
          DataSource = ds
          TabOrder = 5
        end
      end
    end
    inherited tbFiltros: TTabSheet
      inherited grFiltros: TGroupBox
        Width = 1178
      end
      inherited DBGrid1: TDBGrid
        Width = 1178
        Height = 543
      end
    end
  end
  inherited ds: TDataSource
    DataSet = dm.MUsuario
  end
  inherited ds1: TDataSource
    Left = 416
  end
  inherited ds2: TDataSource
    DataSet = dm.QAux
    Left = 352
  end
  inherited ds3: TDataSource
    DataSet = dm.QInterfaceUsu
    Left = 384
  end
  inherited DataSource1: TDataSource
    DataSet = dm.MInterface
  end
end
