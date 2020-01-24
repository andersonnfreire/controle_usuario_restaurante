inherited FAmbiente: TFAmbiente
  Left = 228
  Top = 385
  Caption = ''
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    ActivePage = tbFiltros
    inherited tbDados: TTabSheet
      inherited grDados: TGroupBox
        object Label1: TLabel
          Left = 96
          Top = 32
          Width = 119
          Height = 13
          Caption = 'C'#211'DIGO DO AMBIENTE'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 96
          Top = 72
          Width = 32
          Height = 13
          Caption = 'NOME'
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 96
          Top = 112
          Width = 122
          Height = 13
          Caption = 'QUANTIDADE DE MESA'
          FocusControl = DBEdit3
        end
        object DBEdit1: TDBEdit
          Left = 96
          Top = 48
          Width = 134
          Height = 21
          TabStop = False
          DataField = 'idAmbiente'
          DataSource = ds
          Enabled = False
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 96
          Top = 88
          Width = 264
          Height = 21
          DataField = 'nome'
          DataSource = ds
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 96
          Top = 128
          Width = 134
          Height = 21
          DataField = 'mesa'
          DataSource = ds
          TabOrder = 2
        end
      end
    end
  end
  inherited ds: TDataSource
    DataSet = dm.MAmbiente
  end
end
