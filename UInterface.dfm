inherited FInterface: TFInterface
  Left = 329
  Top = 362
  Caption = ''
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    ActivePage = tbFiltros
    inherited tbDados: TTabSheet
      inherited grDados: TGroupBox
        object Label1: TLabel
          Left = 40
          Top = 32
          Width = 50
          Height = 13
          Caption = 'idInterface'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 40
          Top = 72
          Width = 26
          Height = 13
          Caption = 'nome'
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 40
          Top = 112
          Width = 22
          Height = 13
          Caption = 'label'
          FocusControl = DBEdit3
        end
        object DBEdit1: TDBEdit
          Left = 40
          Top = 48
          Width = 134
          Height = 21
          DataField = 'idInterface'
          DataSource = ds
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 40
          Top = 88
          Width = 654
          Height = 21
          DataField = 'nome'
          DataSource = ds
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 40
          Top = 128
          Width = 654
          Height = 21
          DataField = 'label'
          DataSource = ds
          TabOrder = 2
        end
      end
    end
  end
  inherited ds: TDataSource
    DataSet = dm.MInterface
  end
end
