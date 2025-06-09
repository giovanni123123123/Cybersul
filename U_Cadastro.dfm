object F_Cadastro: TF_Cadastro
  Left = 0
  Top = 0
  Caption = 'Cadastro de clientes Cybersul'
  ClientHeight = 576
  ClientWidth = 977
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 113
    Width = 137
    Height = 463
    Align = alLeft
    TabOrder = 0
    object sbIncluir: TSpeedButton
      Left = 1
      Top = 1
      Width = 135
      Height = 56
      Align = alTop
      Caption = 'Incluir'
      OnClick = sbIncluirClick
      ExplicitLeft = 2
      ExplicitTop = 95
    end
    object sbExcluir: TSpeedButton
      Left = 1
      Top = 113
      Width = 135
      Height = 56
      Align = alTop
      Caption = 'Excluir'
      OnClick = sbExcluirClick
      ExplicitLeft = 2
      ExplicitTop = 207
    end
    object sbAlterar: TSpeedButton
      Left = 1
      Top = 57
      Width = 135
      Height = 56
      Align = alTop
      Caption = 'Alterar'
      OnClick = sbAlterarClick
      ExplicitLeft = 2
      ExplicitTop = 207
    end
  end
  object DBGrid1: TDBGrid
    Left = 137
    Top = 113
    Width = 840
    Height = 463
    Align = alClient
    DataSource = DataModule1.dsClientes
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 977
    Height = 113
    Align = alTop
    TabOrder = 2
    object sbAtualizar: TSpeedButton
      Left = 1
      Top = 1
      Width = 130
      Height = 111
      Caption = 'Atualizar'
      Transparent = False
      OnClick = sbAtualizarClick
    end
    object Label2: TLabel
      Left = 184
      Top = 32
      Width = 36
      Height = 15
      Caption = 'Nome:'
    end
    object Label3: TLabel
      Left = 184
      Top = 64
      Width = 24
      Height = 15
      Caption = 'CPF:'
    end
    object sbLimparFiltros: TSpeedButton
      Left = 369
      Top = 60
      Width = 88
      Height = 26
      Caption = 'Limpar Filtros'
      Transparent = False
      OnClick = sbLimparFiltrosClick
    end
    object sbRelatorio: TSpeedButton
      Left = 600
      Top = 62
      Width = 88
      Height = 22
      Caption = 'Gerar relat'#243'rio'
      OnClick = sbRelatorioClick
    end
    object edNome: TEdit
      Left = 242
      Top = 29
      Width = 446
      Height = 23
      TabOrder = 0
    end
    object edCPF: TEdit
      Left = 242
      Top = 61
      Width = 121
      Height = 23
      TabOrder = 1
    end
  end
end
