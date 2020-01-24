inherited FItem: TFItem
  Left = 247
  Top = 233
  Width = 1147
  Caption = ''
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 1131
  end
  inherited PageControl1: TPageControl
    Width = 1131
    inherited tbDados: TTabSheet
      inherited grDados: TGroupBox
        Width = 1123
        object Label1: TLabel
          Left = 72
          Top = 48
          Width = 90
          Height = 13
          Caption = 'C'#211'DIGO DO ITEM'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 72
          Top = 88
          Width = 32
          Height = 13
          Caption = 'NOME'
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 72
          Top = 128
          Width = 103
          Height = 13
          Caption = 'VALOR DE COMPRA'
          FocusControl = DBEdit3
        end
        object Label4: TLabel
          Left = 72
          Top = 168
          Width = 94
          Height = 13
          Caption = 'VALOR DE VENDA'
          FocusControl = DBEdit4
        end
        object Label5: TLabel
          Left = 72
          Top = 208
          Width = 100
          Height = 13
          Caption = 'C'#211'DIGO DE BARRA'
          FocusControl = DBEdit5
        end
        object Label6: TLabel
          Left = 72
          Top = 288
          Width = 62
          Height = 13
          Caption = 'CATEGORIA'
        end
        object Label7: TLabel
          Left = 72
          Top = 248
          Width = 71
          Height = 13
          Caption = 'QUANTIDADE'
          FocusControl = DBEdit6
        end
        object DBEdit1: TDBEdit
          Left = 72
          Top = 64
          Width = 134
          Height = 21
          TabStop = False
          DataField = 'idItem'
          DataSource = ds
          Enabled = False
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 72
          Top = 104
          Width = 654
          Height = 21
          DataField = 'nome'
          DataSource = ds
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 72
          Top = 144
          Width = 134
          Height = 21
          DataField = 'valorCompra'
          DataSource = ds
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 72
          Top = 184
          Width = 134
          Height = 21
          DataField = 'valorVenda'
          DataSource = ds
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 72
          Top = 224
          Width = 134
          Height = 21
          DataField = 'codBarraP'
          DataSource = ds
          TabOrder = 4
        end
        object cmbCategoria: TComboBox
          Left = 72
          Top = 304
          Width = 145
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 5
          Text = 'Selecione uma categoria'
          OnEnter = cmbCategoriaEnter
          Items.Strings = (
            'Selecione uma categoria')
        end
        object DBEdit6: TDBEdit
          Left = 72
          Top = 264
          Width = 134
          Height = 21
          TabStop = False
          DataField = 'qtd'
          DataSource = ds
          Enabled = False
          TabOrder = 6
        end
      end
    end
    inherited tbFiltros: TTabSheet
      inherited grFiltros: TGroupBox
        Width = 1123
      end
      inherited DBGrid1: TDBGrid
        Width = 1123
      end
    end
  end
  inherited ds: TDataSource
    DataSet = dm.MItem
  end
  inherited ds1: TDataSource
    DataSet = dm.MCategoria
  end
end
