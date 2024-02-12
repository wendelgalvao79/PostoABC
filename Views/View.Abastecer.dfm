object frmabastecer: Tfrmabastecer
  Left = 0
  Top = 0
  Align = alCustom
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'PostoABC [Abastecimento]'
  ClientHeight = 284
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Courier New'
  Font.Style = []
  KeyPreview = True
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 284
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    Color = clWhite
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    ExplicitLeft = 296
    ExplicitTop = 152
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 240
      Width = 618
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'Panel2'
      Color = clBtnShadow
      ParentBackground = False
      ShowCaption = False
      TabOrder = 0
      ExplicitTop = 347
      ExplicitWidth = 520
      object btnnovo: TSpeedButton
        AlignWithMargins = True
        Left = 2
        Top = 3
        Width = 146
        Height = 35
        Cursor = crHandPoint
        Margins.Left = 2
        Margins.Right = 0
        Align = alLeft
        Caption = 'Novo Abastecimento'
        Margin = 8
        OnClick = btnnovoClick
      end
      object btncancela: TSpeedButton
        AlignWithMargins = True
        Left = 150
        Top = 3
        Width = 175
        Height = 35
        Cursor = crHandPoint
        Margins.Left = 2
        Align = alLeft
        Caption = 'Cancelar Abastecimento'
        Margin = 8
        OnClick = btncancelaClick
      end
      object btnsair: TBitBtn
        AlignWithMargins = True
        Left = 510
        Top = 3
        Width = 105
        Height = 35
        Cursor = crHandPoint
        Align = alRight
        Caption = 'Esc|Sair'
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnsairClick
      end
      object btnabastece: TBitBtn
        AlignWithMargins = True
        Left = 331
        Top = 3
        Width = 83
        Height = 35
        Align = alLeft
        Caption = 'Abastecer'
        TabOrder = 1
        OnClick = btnabasteceClick
      end
    end
    object GroupBox1: TGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 618
      Height = 231
      Align = alClient
      TabOrder = 1
      ExplicitLeft = 304
      ExplicitTop = 56
      ExplicitWidth = 185
      ExplicitHeight = 105
      object Label1: TLabel
        Left = 16
        Top = 24
        Width = 112
        Height = 15
        Caption = 'Selecionar Bico:'
      end
      object Label2: TLabel
        Left = 44
        Top = 51
        Width = 84
        Height = 15
        Caption = 'Valor Litro:'
      end
      object Label5: TLabel
        Left = 288
        Top = 51
        Width = 126
        Height = 15
        Caption = 'Litros Dispon'#237'vel:'
      end
      object cbbomba: TDBLookupComboBox
        Left = 135
        Top = 20
        Width = 145
        Height = 23
        Hint = 'bico abastecimento'
        KeyField = 'CODIGO'
        ListField = 'DESCRICAO'
        ListSource = DsAbastece
        TabOrder = 0
      end
      object edttipo: TEdit
        Left = 286
        Top = 20
        Width = 323
        Height = 23
        TabOrder = 1
        Text = 'edttipo'
      end
      object edtvalorlitro: TEdit
        Left = 135
        Top = 47
        Width = 145
        Height = 24
        Alignment = taRightJustify
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Text = 'edtvalorlitro'
      end
      object GroupBox2: TGroupBox
        Left = 286
        Top = 92
        Width = 323
        Height = 133
        Caption = 'Abastecimento'
        TabOrder = 3
        object Label3: TLabel
          Left = 10
          Top = 30
          Width = 140
          Height = 15
          Caption = 'Quantidade de Litro:'
        end
        object Label4: TLabel
          Left = 31
          Top = 68
          Width = 119
          Height = 15
          Caption = 'Valor R$ a Pagar:'
        end
        object Label6: TLabel
          Left = 24
          Top = 104
          Width = 126
          Height = 15
          Caption = 'Imposto Calculado:'
        end
        object edtlitros: TEdit
          Left = 160
          Top = 27
          Width = 153
          Height = 23
          Hint = 'litros abastecimento'
          Alignment = taRightJustify
          TabOrder = 0
          Text = 'edtlitros'
          OnKeyPress = edtlitrosKeyPress
        end
        object edtpagar: TEdit
          Left = 160
          Top = 64
          Width = 153
          Height = 24
          Alignment = taRightJustify
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          Text = 'edtpagar'
        end
        object edtimposto: TEdit
          Left = 160
          Top = 101
          Width = 153
          Height = 24
          Alignment = taRightJustify
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          Text = 'edtpagar'
        end
      end
      object edtqtde: TEdit
        Left = 420
        Top = 47
        Width = 189
        Height = 24
        Alignment = taRightJustify
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        Text = 'edtvalorlitro'
      end
    end
  end
  object DsAbastece: TDataSource
    DataSet = ModelDados.QryAbastece
    OnDataChange = DsAbasteceDataChange
    Left = 187
    Top = 131
  end
end
