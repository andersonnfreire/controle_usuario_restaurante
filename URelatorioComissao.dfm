object FRelatorioComissao: TFRelatorioComissao
  Left = 374
  Top = 300
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
      Left = 464
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
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'nome'
      FieldName = 'nome'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'Comissao'
      FieldName = 'Comissao'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
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
      mmHeight = 16933
      mmPrintPosition = 0
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Rel'#225'torio de Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 7535
        mmLeft = 4498
        mmTop = 6350
        mmWidth = 68792
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 174625
        mmTop = 11906
        mmWidth = 21431
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 265
        mmTop = 6085
        mmWidth = 194205
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'data'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 5027
        mmTop = 265
        mmWidth = 58208
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 30692
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'Comissao'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4763
        mmLeft = 119063
        mmTop = 3704
        mmWidth = 33073
        BandType = 8
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Total de Comiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4995
        mmLeft = 5027
        mmTop = 3704
        mmWidth = 37423
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
        mmHeight = 10583
        mmPrintPosition = 0
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Data da Venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4995
          mmLeft = 5027
          mmTop = 5292
          mmWidth = 33602
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 16140
        mmPrintPosition = 0
        object ppLabel2: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Funcion'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4995
          mmLeft = 5027
          mmTop = 2910
          mmWidth = 27252
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
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
          mmLeft = 5027
          mmTop = 8731
          mmWidth = 93927
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Comissao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4995
          mmLeft = 119327
          mmTop = 2910
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'Comissao'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 4763
          mmLeft = 119327
          mmTop = 8731
          mmWidth = 32808
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
  object DataSource1: TDataSource
    DataSet = dm.QComissao
    Left = 824
    Top = 96
  end
end
