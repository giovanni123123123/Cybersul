object F_ImpressaoClientes: TF_ImpressaoClientes
  Left = 0
  Top = 0
  Caption = 'F_ImpressaoClientes'
  ClientHeight = 776
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Relatorioclientes: TRLReport
    Left = 24
    Top = 8
    Width = 794
    Height = 1123
    DataSource = DataModule1.dsClientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object rl_cabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 75
      BandType = btHeader
      object RLSystemInfo1: TRLSystemInfo
        Left = 185
        Top = 27
        Width = 72
        Height = 16
        Text = ''
      end
      object RLLabel1: TRLLabel
        Left = 16
        Top = 35
        Width = 80
        Height = 22
        Caption = 'Clientes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 144
        Top = 27
        Width = 35
        Height = 16
        Caption = 'Data:'
      end
      object RLLabel3: TRLLabel
        Left = 144
        Top = 49
        Width = 35
        Height = 16
        Caption = 'Hora:'
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 185
        Top = 49
        Width = 72
        Height = 16
        Info = itHour
        Text = ''
      end
    end
    object rl_colunas: TRLBand
      Left = 38
      Top = 113
      Width = 718
      Height = 32
      BandType = btColumnHeader
      object RLLabel4: TRLLabel
        Left = 4
        Top = 12
        Width = 44
        Height = 16
        Caption = 'C'#243'digo'
      end
      object RLLabel5: TRLLabel
        Left = 92
        Top = 12
        Width = 38
        Height = 16
        Caption = 'Nome'
      end
      object RLLabel6: TRLLabel
        Left = 304
        Top = 10
        Width = 30
        Height = 16
        Caption = 'CPF'
      end
      object RLLabel7: TRLLabel
        Left = 383
        Top = 12
        Width = 59
        Height = 16
        Caption = 'Endere'#231'o'
      end
      object RLLabel8: TRLLabel
        Left = 603
        Top = 13
        Width = 44
        Height = 16
        Caption = 'Cidade'
      end
      object RLLabel9: TRLLabel
        Left = 670
        Top = 13
        Width = 45
        Height = 16
        Caption = 'Estado'
      end
    end
    object rl_detail: TRLBand
      Left = 38
      Top = 145
      Width = 718
      Height = 32
      object RLDBText1: TRLDBText
        Left = 4
        Top = 9
        Width = 92
        Height = 14
        DataField = 'CODIGO'
        DataSource = DataModule1.dsClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 92
        Top = 9
        Width = 206
        Height = 14
        DataField = 'NOME'
        DataSource = DataModule1.dsClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 304
        Top = 9
        Width = 73
        Height = 14
        DataField = 'CPF'
        DataSource = DataModule1.dsClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 383
        Top = 9
        Width = 214
        Height = 14
        DataField = 'ENDERECO'
        DataSource = DataModule1.dsClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 603
        Top = 9
        Width = 62
        Height = 14
        DataField = 'CIDADE'
        DataSource = DataModule1.dsClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText6: TRLDBText
        Left = 672
        Top = 9
        Width = 45
        Height = 14
        DataField = 'ESTADO'
        DataSource = DataModule1.dsClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
    end
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.1.2 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 328
    Top = 344
  end
  object RLXLSXFilter1: TRLXLSXFilter
    DisplayName = 'Planilha Excel'
    Left = 416
    Top = 336
  end
end
