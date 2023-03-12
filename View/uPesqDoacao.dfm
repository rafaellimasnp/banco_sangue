inherited fPesqDoacao: TfPesqDoacao
  Caption = 'Unidade de Coleta e Transfus'#227'o de Sangue  '
  ClientWidth = 606
  ExplicitWidth = 622
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBotoes: TPanel
    Width = 606
    inherited btnSair: TBitBtn
      Left = 512
    end
    inherited StaticText1: TStaticText
      Left = 577
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 606
  end
  inherited DBGrid1: TDBGrid
    Width = 606
    DataSource = dsViewTabela
    Columns = <
      item
        Expanded = False
        FieldName = 'DOA_ID'
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PES_NOME'
        Title.Caption = 'Nome'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PES_DATANASC'
        Title.Caption = 'Data Nasc'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOA_DATA'
        Title.Caption = 'Data Doa'#231#227'o'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOA_QTDE'
        Title.Caption = 'Quantidade'
        Width = 100
        Visible = True
      end>
  end
  inherited sqlViewTabela: TFDQuery
    Connection = dmDados.FDConnection
    SQL.Strings = (
      
        'SELECT p.PES_NOME, p.PES_DATANASC, d.DOA_DATA, d.DOA_ID, d.DOA_Q' +
        'TDE FROM  BS_DOACAO d'
      'LEFT JOIN BS_PESSOA p ON p.PES_ID = d.PES_ID')
    object sqlViewTabelaPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Origin = 'PES_NOME'
      Size = 100
    end
    object sqlViewTabelaPES_DATANASC: TDateField
      FieldName = 'PES_DATANASC'
      Origin = 'PES_DATANASC'
    end
    object sqlViewTabelaDOA_DATA: TSQLTimeStampField
      FieldName = 'DOA_DATA'
      Origin = 'DOA_DATA'
      Required = True
    end
    object sqlViewTabelaDOA_ID: TFDAutoIncField
      FieldName = 'DOA_ID'
      Origin = 'DOA_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object sqlViewTabelaDOA_QTDE: TFMTBCDField
      FieldName = 'DOA_QTDE'
      Origin = 'DOA_QTDE'
      Required = True
      Precision = 18
      Size = 2
    end
  end
end
