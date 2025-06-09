object F_Cadastro1: TF_Cadastro1
  Left = 0
  Top = 0
  Caption = 'Cadastro de clientes Cybersul'
  ClientHeight = 259
  ClientWidth = 587
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 45
    Height = 15
    Caption = 'C'#243'digo: '
  end
  object Label2: TLabel
    Left = 24
    Top = 56
    Width = 36
    Height = 15
    Caption = 'Nome:'
  end
  object Label3: TLabel
    Left = 24
    Top = 88
    Width = 24
    Height = 15
    Caption = 'CPF:'
  end
  object Label4: TLabel
    Left = 24
    Top = 119
    Width = 52
    Height = 15
    Caption = 'Endere'#231'o:'
  end
  object Label5: TLabel
    Left = 24
    Top = 148
    Width = 40
    Height = 15
    Caption = 'Cidade:'
  end
  object Label6: TLabel
    Left = 24
    Top = 182
    Width = 38
    Height = 15
    Caption = 'Estado:'
  end
  object edCodigo: TEdit
    Left = 82
    Top = 24
    Width = 121
    Height = 23
    Enabled = False
    TabOrder = 0
  end
  object edNome: TEdit
    Left = 82
    Top = 53
    Width = 446
    Height = 23
    TabOrder = 1
  end
  object edCPF: TEdit
    Left = 82
    Top = 85
    Width = 121
    Height = 23
    TabOrder = 2
  end
  object edEndereco: TEdit
    Left = 82
    Top = 116
    Width = 121
    Height = 23
    TabOrder = 3
  end
  object edCidade: TEdit
    Left = 82
    Top = 145
    Width = 121
    Height = 23
    TabOrder = 4
  end
  object cbEstado: TComboBox
    Left = 82
    Top = 179
    Width = 145
    Height = 23
    TabOrder = 5
    Items.Strings = (
      'AC'
      'AL'
      'AP'
      'AM'
      'BA'
      'CE'
      'ES'
      'GO'
      'DF'
      'MA'
      'MT'
      'MS'
      'MG'
      'PA'
      'PB'
      'PR'
      'PE'
      'PI'
      'RJ'
      'RN'
      'RS'
      'RO'
      'RR'
      'SC'
      'SP'
      'SE'
      'TO')
  end
  object Panel1: TPanel
    Left = 0
    Top = 218
    Width = 587
    Height = 41
    Align = alBottom
    TabOrder = 6
    object sbConfirmar: TSpeedButton
      Left = 336
      Top = 1
      Width = 152
      Height = 39
      Align = alRight
      Caption = 'Confirmar'
      OnClick = sbConfirmarClick
    end
    object sbCancelar: TSpeedButton
      Left = 488
      Top = 1
      Width = 98
      Height = 39
      Align = alRight
      Caption = 'Fechar'
      OnClick = sbCancelarClick
      ExplicitLeft = 489
    end
  end
  object FDQuery1: TFDQuery
    Left = 424
    Top = 120
  end
end
