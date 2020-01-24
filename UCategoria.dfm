inherited FCategoria: TFCategoria
  Left = 235
  Top = 546
  Caption = 'FCategoria'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited tbDados: TTabSheet
      inherited grDados: TGroupBox
        object Label1: TLabel
          Left = 64
          Top = 56
          Width = 125
          Height = 13
          Caption = 'C'#211'DIGO DA CATEGORIA'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 64
          Top = 96
          Width = 32
          Height = 13
          Caption = 'NOME'
          FocusControl = DBEdit2
        end
        object DBEdit1: TDBEdit
          Left = 64
          Top = 72
          Width = 134
          Height = 21
          TabStop = False
          DataField = 'idCategoria'
          DataSource = ds
          Enabled = False
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 64
          Top = 112
          Width = 654
          Height = 21
          DataField = 'nome'
          DataSource = ds
          TabOrder = 1
        end
      end
    end
  end
  inherited ds: TDataSource
    DataSet = dm.MCategoria
  end
end
