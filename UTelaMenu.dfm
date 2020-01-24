object FTelaMenu: TFTelaMenu
  Left = 373
  Top = 465
  Width = 928
  Height = 480
  Caption = 'Tela Principal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DataSource1: TDataSource
    DataSet = dm.QAux
    Left = 8
    Top = 376
  end
end
