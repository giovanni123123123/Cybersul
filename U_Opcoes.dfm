object F_Opcoes: TF_Opcoes
  Left = 0
  Top = 0
  Caption = 'O que voc'#234' deseja fazer'
  ClientHeight = 74
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object lblMsg: TLabel
    Left = 0
    Top = 0
    Width = 385
    Height = 44
    Align = alClient
    ExplicitWidth = 3
    ExplicitHeight = 15
  end
  object Panel1: TPanel
    Left = 0
    Top = 44
    Width = 385
    Height = 30
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 72
    object bAlterar: TButton
      Left = 159
      Top = 1
      Width = 75
      Height = 28
      Align = alRight
      Caption = 'Alterar'
      ModalResult = 6
      TabOrder = 0
      ExplicitLeft = 60
      ExplicitTop = 8
      ExplicitHeight = 25
    end
    object bExcluir: TButton
      Left = 234
      Top = 1
      Width = 75
      Height = 28
      Align = alRight
      Caption = 'Excluir'
      ModalResult = 7
      TabOrder = 1
      ExplicitLeft = 148
      ExplicitTop = 8
      ExplicitHeight = 25
    end
    object bCancelar: TButton
      Left = 309
      Top = 1
      Width = 75
      Height = 28
      Align = alRight
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 2
      ExplicitLeft = 229
      ExplicitTop = 8
      ExplicitHeight = 25
    end
  end
end
