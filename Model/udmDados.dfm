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
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 16
  end
end
