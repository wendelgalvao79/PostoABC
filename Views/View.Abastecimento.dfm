object frmabastecto: Tfrmabastecto
  Left = 0
  Top = 0
  Caption = 'frmabastecto'
  ClientHeight = 441
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Courier New'
  Font.Style = []
  KeyPreview = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 534
    Height = 435
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    Color = clWhite
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 528
      Height = 28
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = ' Abastecimentos'
      Color = clHotLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Courier New'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 391
      Width = 531
      Height = 41
      Margins.Right = 0
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'Panel3'
      Color = clBtnShadow
      ParentBackground = False
      ShowCaption = False
      TabOrder = 1
      object btngravar: TSpeedButton
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 120
        Height = 35
        Cursor = crHandPoint
        Margins.Right = 0
        Align = alLeft
        Caption = 'Abastecer'
        OnClick = btngravarClick
      end
      object btnsair: TBitBtn
        AlignWithMargins = True
        Left = 126
        Top = 3
        Width = 105
        Height = 35
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'Esc|Sair'
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnsairClick
      end
    end
    object GridAbastecimento: TDBGrid
      AlignWithMargins = True
      Left = 3
      Top = 37
      Width = 528
      Height = 348
      Align = alClient
      DataSource = DsAbastecimento
      DrawingStyle = gdsGradient
      Options = [dgTitles, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Courier New'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATA'
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Width = 156
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'Bomba'
          Width = 101
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'LITROS'
          Title.Alignment = taCenter
          Title.Caption = 'Litros'
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_ABASTECIMENTO'
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor R$'
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_IMPOSTO'
          Title.Alignment = taRightJustify
          Title.Caption = 'Imposto'
          Width = 66
          Visible = True
        end>
    end
  end
  object DsAbastecimento: TDataSource
    DataSet = ModelDados.QryAbastecimento
    Left = 283
    Top = 203
  end
end
