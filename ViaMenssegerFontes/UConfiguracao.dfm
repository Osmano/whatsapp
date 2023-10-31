object frmConfig: TfrmConfig
  Left = 0
  Top = 0
  Caption = 'Configura'#231#245'es'
  ClientHeight = 189
  ClientWidth = 530
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 64
    Width = 104
    Height = 18
    Caption = 'Departamento: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 96
    Width = 115
    Height = 18
    Caption = 'Nome do Banco: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 128
    Width = 102
    Height = 18
    Caption = 'IP do Servidor: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 24
    Top = 160
    Width = 100
    Height = 18
    Caption = 'Porta Postgres:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object CBDepartamento: TComboBox
    Left = 139
    Top = 56
    Width = 232
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 0
    Text = 'FINANCEIRO'
    Items.Strings = (
      'FINANCEIRO'
      'RELATORIOS'
      'VENDAS'
      'CONTAS')
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 530
    Height = 41
    Align = alTop
    Alignment = taLeftJustify
    BorderWidth = 5
    Caption = 'CONFIGURA'#199#213'ES DE ACESSO'
    Color = 16384
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    ExplicitWidth = 185
  end
  object CBBanco: TComboBox
    Left = 139
    Top = 88
    Width = 232
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 1
    ParentFont = False
    TabOrder = 2
    Text = 'S0258'
    Items.Strings = (
      'postgres'
      'S0258')
  end
  object CBServidor: TComboBox
    Left = 139
    Top = 120
    Width = 232
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 3
    Text = '192.168.10.210'
    Items.Strings = (
      '192.168.10.210'
      '127.0.0.1')
  end
  object CBPorta: TComboBox
    Left = 139
    Top = 152
    Width = 232
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 4
    Text = '5432'
    Items.Strings = (
      '5432')
  end
  object BBLerConfiguracoes: TBitBtn
    Left = 392
    Top = 56
    Width = 126
    Height = 39
    Caption = 'Ler Configura'#231#245'es'
    TabOrder = 5
    OnClick = BBLerConfiguracoesClick
  end
  object BBAplicarConfiguracoes: TBitBtn
    Left = 392
    Top = 101
    Width = 126
    Height = 39
    Caption = 'Aplicar Configura'#231#245'es'
    TabOrder = 6
    OnClick = BBAplicarConfiguracoesClick
  end
end
