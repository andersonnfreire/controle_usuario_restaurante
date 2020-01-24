object FRelatorioVendas: TFRelatorioVendas
  Left = 209
  Top = 402
  Width = 928
  Height = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 441
    Align = alClient
    Color = clSkyBlue
    TabOrder = 0
    object Label1: TLabel
      Left = 224
      Top = 24
      Width = 66
      Height = 13
      Caption = 'Data de Inicio'
    end
    object Label2: TLabel
      Left = 224
      Top = 72
      Width = 42
      Height = 13
      Caption = 'Data Fim'
    end
    object dataInicio: TDateTimePicker
      Left = 224
      Top = 40
      Width = 186
      Height = 21
      Date = 43634.000000000000000000
      Time = 43634.000000000000000000
      TabOrder = 0
    end
    object dataFim: TDateTimePicker
      Left = 224
      Top = 88
      Width = 186
      Height = 21
      Date = 43634.000000000000000000
      Time = 43634.000000000000000000
      TabOrder = 1
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 128
      Width = 910
      Height = 312
      Align = alBottom
      DataSource = DataSource1
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object Panel2: TPanel
      Left = 456
      Top = 56
      Width = 73
      Height = 41
      Caption = 'Pesquisar'
      Color = clMaroon
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Panel2Click
    end
  end
  object DataSource1: TDataSource
    DataSet = dm.Qrelatorio
    Left = 824
    Top = 96
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DBPipeline1'
    Left = 640
    Top = 56
    object ppDBPipeline1ppField1: TppField
      FieldAlias = 'data'
      FieldName = 'data'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'mesa'
      FieldName = 'mesa'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'qtd'
      FieldName = 'qtd'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'nome'
      FieldName = 'nome'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 672
    Top = 56
    Version = '14.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        HyperlinkColor = clActiveBorder
        Caption = 'Relatorio de Vendas'
        Color = clMaroon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 20
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 8202
        mmLeft = 6350
        mmTop = 4498
        mmWidth = 74083
        BandType = 0
        LayerName = Foreground
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 2381
        mmTop = 21696
        mmWidth = 194205
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'data'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsItalic]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4911
        mmLeft = 6350
        mmTop = 2646
        mmWidth = 29633
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 36248
      mmPrintPosition = 0
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Total de Itens Vendidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 6562
        mmLeft = 6350
        mmTop = 19050
        mmWidth = 101336
        BandType = 8
        LayerName = Foreground
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'qtd'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 170392
        mmTop = 19050
        mmWidth = 17198
        BandType = 8
        LayerName = Foreground
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 179652
        mmTop = 29369
        mmWidth = 15875
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'data'
      DataPipeline = ppDBPipeline1
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPipeline1'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 15347
        mmPrintPosition = 0
        object ppLabel5: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Data da Venda'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 18
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 7493
          mmLeft = 6350
          mmTop = 2117
          mmWidth = 45773
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 31221
        mmPrintPosition = 0
        object ppLabel2: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'N'#186' da Mesa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 5027
          mmLeft = 29633
          mmTop = 11377
          mmWidth = 24606
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'mesa'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 4763
          mmLeft = 58208
          mmTop = 11377
          mmWidth = 11113
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 5027
          mmLeft = 74877
          mmTop = 11377
          mmWidth = 13229
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'nome'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 4763
          mmLeft = 93398
          mmTop = 11377
          mmWidth = 40746
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 5027
          mmLeft = 140759
          mmTop = 11377
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'qtd'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 4763
          mmLeft = 170392
          mmTop = 11377
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Pen.Style = psDot
          Weight = 0.750000000000000000
          mmHeight = 1323
          mmLeft = 3969
          mmTop = 26458
          mmWidth = 194205
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Pen.Style = psDot
          Weight = 0.750000000000000000
          mmHeight = 1323
          mmLeft = 5027
          mmTop = 2910
          mmWidth = 194205
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
end
