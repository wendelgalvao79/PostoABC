object frmrelatorio: Tfrmrelatorio
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'frmrelatorio'
  ClientHeight = 441
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Courier New'
  Font.Style = []
  OnClose = FormClose
  OnShow = FormShow
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
      Caption = ' Relat'#243'rio Gerencial'
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
    object GroupBox1: TGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 37
      Width = 528
      Height = 348
      Align = alClient
      Caption = 'Per'#237'odo'
      TabOrder = 1
      object LabelDataInicial: TLabel
        Left = 64
        Top = 73
        Width = 84
        Height = 15
        Caption = 'Data Inicial'
      end
      object LabelDataFinal: TLabel
        Left = 256
        Top = 73
        Width = 70
        Height = 15
        Caption = 'Data Final'
      end
      object edtdataI: TDateTimePicker
        Left = 64
        Top = 95
        Width = 186
        Height = 23
        Date = 42812.000000000000000000
        Time = 0.517110393520852100
        TabOrder = 0
      end
      object edtdataF: TDateTimePicker
        Left = 256
        Top = 94
        Width = 186
        Height = 23
        Date = 42812.000000000000000000
        Time = 0.517110393520852100
        TabOrder = 1
      end
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
      TabOrder = 2
      object btnimprimir: TSpeedButton
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 120
        Height = 35
        Cursor = crHandPoint
        Margins.Right = 0
        Align = alLeft
        Caption = 'Imprimir'
        OnClick = btnimprimirClick
        ExplicitTop = 0
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
  end
end
