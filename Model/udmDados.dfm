object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 279
  Width = 456
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=BS'
      'User_Name=sa'
      'Password=123456'
      'Server=RafaelLima'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object sqlPessoas: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM BS_PESSOA')
    Left = 112
    Top = 16
    object sqlPessoasPES_ID: TIntegerField
      FieldName = 'PES_ID'
      Origin = 'PES_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlPessoasPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Origin = 'PES_NOME'
      Required = True
      Size = 100
    end
    object sqlPessoasPES_DATANASC: TSQLTimeStampField
      FieldName = 'PES_DATANASC'
      Origin = 'PES_DATANASC'
      Required = True
    end
    object sqlPessoasPES_TIPOSANG: TStringField
      FieldName = 'PES_TIPOSANG'
      Origin = 'PES_TIPOSANG'
      FixedChar = True
      Size = 2
    end
  end
  object dsPessoas: TDataSource
    DataSet = sqlPessoas
    Left = 112
    Top = 64
  end
  object sqlDoacoes: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM BS_DOACAO')
    Left = 200
    Top = 16
    object sqlDoacoesDOA_ID: TIntegerField
      FieldName = 'DOA_ID'
      Origin = 'DOA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlDoacoesDOA_DATA: TSQLTimeStampField
      FieldName = 'DOA_DATA'
      Origin = 'DOA_DATA'
      Required = True
    end
    object sqlDoacoesDOA_QTDE: TFMTBCDField
      FieldName = 'DOA_QTDE'
      Origin = 'DOA_QTDE'
      Required = True
      Precision = 18
      Size = 2
    end
    object sqlDoacoesPES_ID: TIntegerField
      FieldName = 'PES_ID'
      Origin = 'PES_ID'
      Required = True
    end
  end
  object dsDoacoes: TDataSource
    DataSet = sqlDoacoes
    Left = 200
    Top = 72
  end
end
