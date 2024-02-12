object frmbombas: Tfrmbombas
  Left = 0
  Top = 0
  Caption = 'frmbombas'
  ClientHeight = 441
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object pnlfundo: TPanel
    Left = 0
    Top = 0
    Width = 540
    Height = 441
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlfundo'
    Color = clWhite
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object pgcontrole: TPageControl
      AlignWithMargins = True
      Left = 3
      Top = 37
      Width = 534
      Height = 401
      ActivePage = tbscadastro
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object tbscadastro: TTabSheet
        Caption = 'tbscadastro'
        TabVisible = False
        object Panel3: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 347
          Width = 523
          Height = 41
          Margins.Right = 0
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'Panel3'
          Color = clBtnShadow
          ParentBackground = False
          ShowCaption = False
          TabOrder = 0
          object btngravar: TSpeedButton
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 120
            Height = 35
            Cursor = crHandPoint
            Margins.Right = 0
            Align = alLeft
            Caption = 'Gravar Registro'
            OnClick = btngravarClick
          end
          object btncancelar: TSpeedButton
            AlignWithMargins = True
            Left = 126
            Top = 3
            Width = 105
            Height = 35
            Cursor = crHandPoint
            Margins.Right = 0
            Align = alLeft
            Caption = 'Cancelar'
            OnClick = btncancelarClick
            ExplicitLeft = 208
            ExplicitTop = 0
          end
        end
        object GroupBox1: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 520
          Height = 338
          Align = alClient
          Caption = 'Manuten'#231#227'o do Registro'
          TabOrder = 1
          DesignSize = (
            520
            338)
          object Label1: TLabel
            Left = 10
            Top = 24
            Width = 42
            Height = 15
            Caption = 'C'#243'digo'
          end
          object Label2: TLabel
            Left = 122
            Top = 24
            Width = 63
            Height = 15
            Caption = 'Descri'#231#227'o'
          end
          object Label4: TLabel
            Left = 122
            Top = 81
            Width = 42
            Height = 15
            Caption = 'Tanque'
          end
          object Label3: TLabel
            Left = 313
            Top = 81
            Width = 126
            Height = 15
            Caption = 'Combustivel Tanque'
          end
          object edtcodigo: TEdit
            Left = 10
            Top = 42
            Width = 95
            Height = 24
            Alignment = taRightJustify
            Color = clBtnFace
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Text = 'edtcodigo'
          end
          object edtdescricao: TEdit
            AlignWithMargins = True
            Left = 122
            Top = 45
            Width = 387
            Height = 23
            Hint = 'descri'#231#227'o'
            Anchors = [akLeft, akTop, akRight]
            CharCase = ecUpperCase
            MaxLength = 40
            TabOrder = 1
            Text = 'EDTDESCRICAO'
          end
          object cbtanque: TDBLookupComboBox
            Left = 122
            Top = 100
            Width = 175
            Height = 23
            Hint = 'tipo de combustivel'
            KeyField = 'CODIGO'
            ListField = 'DESCRICAO'
            ListSource = DsTanque
            TabOrder = 2
          end
          object DBEdit1: TDBEdit
            Left = 313
            Top = 100
            Width = 196
            Height = 24
            DataField = 'TIPO'
            DataSource = DsTanque
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
        end
      end
      object tbsconsulta: TTabSheet
        Caption = 'tbsconsulta'
        ImageIndex = 1
        TabVisible = False
        DesignSize = (
          526
          391)
        object Panel2: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 347
          Width = 520
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'Panel2'
          Color = clBtnShadow
          ParentBackground = False
          ShowCaption = False
          TabOrder = 0
          object btnnovo: TSpeedButton
            AlignWithMargins = True
            Left = 2
            Top = 3
            Width = 130
            Height = 35
            Cursor = crHandPoint
            Margins.Left = 2
            Margins.Right = 0
            Align = alLeft
            Caption = 'Novo Registro'
            Margin = 20
            OnClick = btnnovoClick
          end
          object btnalterar: TSpeedButton
            AlignWithMargins = True
            Left = 134
            Top = 3
            Width = 130
            Height = 35
            Cursor = crHandPoint
            Margins.Left = 2
            Align = alLeft
            Caption = 'Alterar Registro'
            Margin = 10
            OnClick = btnalterarClick
            ExplicitLeft = 129
          end
          object btnsair: TBitBtn
            AlignWithMargins = True
            Left = 412
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
        end
        object RadioGroup1: TRadioGroup
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 520
          Height = 51
          Align = alTop
          Caption = 'F4|Consultar'
          TabOrder = 1
        end
        object edtconsulta: TEdit
          Left = 11
          Top = 22
          Width = 502
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          CharCase = ecUpperCase
          TabOrder = 2
          Text = 'EDTCONSULTA'
          OnChange = edtconsultaChange
          OnEnter = edtconsultaEnter
        end
        object GridBombas: TDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 60
          Width = 520
          Height = 281
          Align = alClient
          DataSource = DsBombas
          DrawingStyle = gdsClassic
          Options = [dgTitles, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Courier New'
          TitleFont.Style = []
          OnDblClick = GridBombasDblClick
          OnEnter = GridBombasEnter
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 140
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TANQUE'
              Title.Caption = 'Tanque'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMBUSTIVEL'
              Title.Caption = 'Combustivel'
              Width = 150
              Visible = True
            end>
        end
      end
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 534
      Height = 28
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = ' Cadastro de Bombas'
      Color = clHotLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Courier New'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
    end
  end
  object DsBombas: TDataSource
    DataSet = ModelDados.QryBombas
    Left = 55
    Top = 147
  end
  object DsTanque: TDataSource
    DataSet = ModelDados.QryTanques
    Left = 58
    Top = 206
  end
end
