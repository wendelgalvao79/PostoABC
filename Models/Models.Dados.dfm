object ModelDados: TModelDados
  OnCreate = DataModuleCreate
  Height = 312
  Width = 434
  object QryCombustivel: TFDQuery
    Left = 32
    Top = 24
    object QryCombustivelCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object QryCombustivelDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object QryCombustivelVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = ',0.000;-,0.000'
      Size = 0
    end
    object QryCombustivelIMPOSTO: TFMTBCDField
      FieldName = 'IMPOSTO'
      DisplayFormat = ',0.00;-,0.00'
      Size = 0
    end
  end
  object QryTanques: TFDQuery
    Left = 128
    Top = 24
    object QryTanquesCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object QryTanquesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object QryTanquesCODIGO_COMBUSTIVEL: TIntegerField
      FieldName = 'CODIGO_COMBUSTIVEL'
    end
    object QryTanquesTIPO: TStringField
      FieldName = 'TIPO'
      Size = 50
    end
    object QryTanquesQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      DisplayFormat = ',0.000;-,0.000'
      Size = 0
    end
  end
  object QryBombas: TFDQuery
    Left = 32
    Top = 88
    object QryBombasCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object QryBombasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object QryBombasCODIGO_TANQUE: TIntegerField
      FieldName = 'CODIGO_TANQUE'
    end
    object QryBombasCODIGO_COMBUSTIVEL: TIntegerField
      FieldName = 'CODIGO_COMBUSTIVEL'
    end
    object QryBombasTANQUE: TStringField
      FieldName = 'TANQUE'
      Size = 50
    end
    object QryBombasCOMBUSTIVEL: TStringField
      FieldName = 'COMBUSTIVEL'
      Size = 50
    end
  end
  object QryAbastecimento: TFDQuery
    Left = 128
    Top = 88
    object QryAbastecimentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object QryAbastecimentoDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object QryAbastecimentoBOMBA: TIntegerField
      FieldName = 'BOMBA'
    end
    object QryAbastecimentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object QryAbastecimentoLITROS: TFMTBCDField
      FieldName = 'LITROS'
      DisplayFormat = ',0.000;-,0.000'
      Size = 0
    end
    object QryAbastecimentoVALOR_ABASTECIMENTO: TFMTBCDField
      FieldName = 'VALOR_ABASTECIMENTO'
      DisplayFormat = ',0.00;-,0.00'
      Size = 0
    end
    object QryAbastecimentoCODIGO_TANQUE: TIntegerField
      FieldName = 'CODIGO_TANQUE'
    end
    object QryAbastecimentoCODIGO_COMBUSTIVEL: TIntegerField
      FieldName = 'CODIGO_COMBUSTIVEL'
    end
    object QryAbastecimentoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 50
    end
    object QryAbastecimentoVALOR_IMPOSTO: TFMTBCDField
      FieldName = 'VALOR_IMPOSTO'
      DisplayFormat = ',0.00;-,0.00'
      Size = 0
    end
  end
  object QryAbastece: TFDQuery
    Left = 32
    Top = 160
    object QryAbasteceCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object QryAbasteceDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object QryAbasteceTIPO: TStringField
      FieldName = 'TIPO'
      Size = 50
    end
    object QryAbasteceVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Size = 0
    end
    object QryAbasteceIMPOSTO: TFMTBCDField
      FieldName = 'IMPOSTO'
      Size = 0
    end
    object QryAbasteceQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Size = 0
    end
    object QryAbasteceCODIGO_TANQUE: TIntegerField
      FieldName = 'CODIGO_TANQUE'
    end
    object QryAbasteceCODIGO_COMBUSTIVEL: TIntegerField
      FieldName = 'CODIGO_COMBUSTIVEL'
    end
  end
  object QryRelatorio: TFDQuery
    CachedUpdates = True
    Left = 128
    Top = 160
    object QryRelatorioDATA: TSQLTimeStampField
      FieldName = 'DATA'
    end
    object QryRelatorioCOMBUSTIVEL: TStringField
      FieldName = 'COMBUSTIVEL'
      Size = 50
    end
    object QryRelatorioBOMBA: TStringField
      FieldName = 'BOMBA'
      Size = 50
    end
    object QryRelatorioLITROS: TFMTBCDField
      FieldName = 'LITROS'
      Size = 0
    end
    object QryRelatorioVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Size = 0
    end
    object QryRelatorioVALOR_ABASTECIMENTO: TFMTBCDField
      FieldName = 'VALOR_ABASTECIMENTO'
      Size = 0
    end
    object QryRelatorioVALOR_IMPOSTO: TFMTBCDField
      FieldName = 'VALOR_IMPOSTO'
      Size = 0
    end
    object QryRelatorioCODIGO_COMBUSTIVEL: TIntegerField
      FieldName = 'CODIGO_COMBUSTIVEL'
    end
  end
end
