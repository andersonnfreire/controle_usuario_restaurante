inherited FGarcon: TFGarcon
  Left = 199
  Top = 524
  Caption = ''
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited tbDados: TTabSheet
      inherited grDados: TGroupBox
        object Label1: TLabel
          Left = 72
          Top = 72
          Width = 111
          Height = 13
          Caption = 'C'#211'DIGO DO GAR'#199'OM'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 72
          Top = 112
          Width = 32
          Height = 13
          Caption = 'NOME'
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 72
          Top = 152
          Width = 121
          Height = 13
          Caption = 'DATA DE NASCIMENTO'
          FocusControl = DBEdit3
        end
        object Label4: TLabel
          Left = 72
          Top = 192
          Width = 100
          Height = 13
          Caption = 'C'#211'DIGO DE BARRA'
          FocusControl = DBEdit4
        end
        object Label5: TLabel
          Left = 72
          Top = 232
          Width = 56
          Height = 13
          Caption = 'COMISS'#195'O'
          FocusControl = DBEdit5
        end
        object DBEdit1: TDBEdit
          Left = 72
          Top = 88
          Width = 134
          Height = 21
          TabStop = False
          DataField = 'idGarcom'
          DataSource = ds
          Enabled = False
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 72
          Top = 128
          Width = 654
          Height = 21
          DataField = 'nome'
          DataSource = ds
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 264
          Top = 168
          Width = 238
          Height = 21
          DataField = 'dataNasc'
          DataSource = ds
          TabOrder = 2
          Visible = False
          OnChange = DBEdit3Change
        end
        object DBEdit4: TDBEdit
          Left = 72
          Top = 208
          Width = 134
          Height = 21
          DataField = 'codBarra'
          DataSource = ds
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 72
          Top = 248
          Width = 134
          Height = 21
          DataField = 'comissao'
          DataSource = ds
          TabOrder = 4
        end
        object dataNasc: TDateTimePicker
          Left = 72
          Top = 168
          Width = 186
          Height = 21
          Date = 43625.413765960650000000
          Time = 43625.413765960650000000
          Enabled = False
          TabOrder = 5
          OnChange = dataNascChange
        end
      end
    end
  end
  inherited ds: TDataSource
    DataSet = dm.MGarcon
  end
  inherited ds3: TDataSource
    Left = 416
  end
  inherited DataSource1: TDataSource
    Left = 448
  end
end
