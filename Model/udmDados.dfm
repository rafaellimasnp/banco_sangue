object dmDados: TdmDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 279
  Width = 456
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=BS'
      'User_Name=sa'
      'Password=123456'
      'Server=RafaelLima'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object sqlRelDoacoes: TFDQuery
    Connection = FDConnection
    Left = 168
    Top = 8
  end
  object frxRelDoacoes: TfrxDBDataset
    UserName = 'frxRelDoacoes'
    CloseDataSource = False
    FieldAliases.Strings = (
      'PES_TIPOSANG=PES_TIPOSANG'
      'QTDE=QTDE')
    DataSet = sqlRelDoacoes
    BCDToCurrency = False
    Left = 168
    Top = 56
  end
end
