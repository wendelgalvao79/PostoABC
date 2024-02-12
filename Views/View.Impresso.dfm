object frmimpresso: Tfrmimpresso
  Left = 0
  Top = 0
  Caption = 'frmimpresso'
  ClientHeight = 441
  ClientWidth = 820
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object ReportGerencial: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    Margins.LeftMargin = 5.000000000000000000
    Margins.TopMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    Margins.BottomMargin = 5.000000000000000000
    DataSource = DsRelatorio
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Title = 'Relat'#243'rio Gerencial'
    object RLBandTitle: TRLBand
      Left = 19
      Top = 19
      Width = 756
      Height = 43
      BandType = btHeader
      Color = clSilver
      ParentColor = False
      Transparent = False
      BeforePrint = RLBandTitleBeforePrint
      object RLLabel2: TRLLabel
        Left = 1
        Top = 1
        Width = 457
        Height = 24
        Caption = 'RELATORIO GERENCIAL - ABASTECIMENTOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object rlperiodo: TRLLabel
        Left = 1
        Top = 24
        Width = 62
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object RLBand1: TRLBand
      Left = 19
      Top = 273
      Width = 756
      Height = 16
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLSystemInfo1: TRLSystemInfo
        Left = 712
        Top = 1
        Width = 41
        Height = 14
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Info = itPageNumber
        ParentFont = False
        Text = ''
      end
      object RLLabel9: TRLLabel
        Left = 672
        Top = 1
        Width = 38
        Height = 14
        Caption = 'Pagina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 19
      Top = 62
      Width = 756
      Height = 105
      DataFields = 'codigo_combustivel'
      object RLBand2: TRLBand
        Left = 0
        Top = 25
        Width = 756
        Height = 23
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Borders.FixedBottom = True
        object RLLabel3: TRLLabel
          Left = 6
          Top = 5
          Width = 59
          Height = 15
          Caption = 'Data/Hora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 131
          Top = 6
          Width = 70
          Height = 15
          Caption = 'Bico/Bomba'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 315
          Top = 6
          Width = 58
          Height = 15
          Caption = 'Valor Litro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 443
          Top = 6
          Width = 34
          Height = 15
          Caption = 'Litros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 515
          Top = 6
          Width = 116
          Height = 15
          Caption = 'Valor Abastecimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel8: TRLLabel
          Left = 671
          Top = 5
          Width = 75
          Height = 15
          Caption = 'Imposto (R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 756
        Height = 25
        BandType = btHeader
        object RLLabel1: TRLLabel
          Left = 1
          Top = 8
          Width = 98
          Height = 16
          Caption = 'COMBUSTIVEL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText1: TRLDBText
          Left = 100
          Top = 8
          Width = 96
          Height = 16
          DataField = 'COMBUSTIVEL'
          DataSource = DsRelatorio
          Text = ''
        end
      end
      object RLBandDetail: TRLBand
        Left = 0
        Top = 48
        Width = 756
        Height = 16
        BeforePrint = RLBandDetailBeforePrint
        object RLDBText2: TRLDBText
          Left = 6
          Top = 1
          Width = 32
          Height = 14
          DataField = 'DATA'
          DataSource = DsRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 131
          Top = 1
          Width = 41
          Height = 14
          DataField = 'BOMBA'
          DataSource = DsRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 333
          Top = 1
          Width = 40
          Height = 14
          Alignment = taRightJustify
          DataField = 'VALOR'
          DataSource = DsRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText5: TRLDBText
          Left = 438
          Top = 1
          Width = 39
          Height = 14
          Alignment = taRightJustify
          DataField = 'LITROS'
          DataSource = DsRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 499
          Top = 2
          Width = 132
          Height = 14
          Alignment = taRightJustify
          DataField = 'VALOR_ABASTECIMENTO'
          DataSource = DsRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText7: TRLDBText
          Left = 655
          Top = 2
          Width = 91
          Height = 14
          Alignment = taRightJustify
          DataField = 'VALOR_IMPOSTO'
          DataSource = DsRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
      end
      object RLBandSumary: TRLBand
        Left = 0
        Top = 64
        Width = 756
        Height = 41
        BandType = btSummary
        BeforePrint = RLBandSumaryBeforePrint
        object rltotlitros: TRLLabel
          Left = 422
          Top = 10
          Width = 55
          Height = 14
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rltotvalor: TRLLabel
          Left = 578
          Top = 10
          Width = 53
          Height = 14
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rltotimposto: TRLLabel
          Left = 674
          Top = 10
          Width = 72
          Height = 14
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw1: TRLDraw
          Left = 400
          Top = 3
          Width = 346
          Height = 9
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          DrawKind = dkLine
        end
      end
    end
    object RLBand4: TRLBand
      Left = 19
      Top = 167
      Width = 756
      Height = 106
      BandType = btSummary
      BeforePrint = RLBand4BeforePrint
      object rlitrostot: TRLLabel
        Left = 690
        Top = 32
        Width = 56
        Height = 16
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rvalortot: TRLLabel
        Left = 689
        Top = 49
        Width = 57
        Height = 16
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rimpostotot: TRLLabel
        Left = 671
        Top = 66
        Width = 75
        Height = 16
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel10: TRLLabel
        Left = 501
        Top = 32
        Width = 116
        Height = 16
        Alignment = taRightJustify
        Caption = 'Litros Abastecidos:'
      end
      object RLLabel11: TRLLabel
        Left = 546
        Top = 49
        Width = 71
        Height = 16
        Alignment = taRightJustify
        Caption = 'Total Geral:'
      end
      object RLLabel12: TRLLabel
        Left = 524
        Top = 66
        Width = 93
        Height = 16
        Alignment = taRightJustify
        Caption = 'Total Impostos:'
      end
      object RLDraw2: TRLDraw
        Left = 499
        Top = 27
        Width = 247
        Height = 9
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        DrawKind = dkLine
      end
    end
  end
  object DsRelatorio: TDataSource
    DataSet = ModelDados.QryRelatorio
    Left = 56
    Top = 200
  end
end
