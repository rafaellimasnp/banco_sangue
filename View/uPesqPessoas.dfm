inherited fPesqPessoas: TfPesqPessoas
  Caption = 'Pesquisa de Pessoas'
  ClientWidth = 612
  ExplicitWidth = 628
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBotoes: TPanel
    Width = 612
    ExplicitWidth = 612
    DesignSize = (
      612
      61)
    inherited btnSair: TBitBtn
      Left = 518
      ExplicitLeft = 518
    end
    inherited StaticText1: TStaticText
      Left = 583
      ExplicitLeft = 583
    end
    inherited btnExcluir: TBitBtn
      Visible = True
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 612
    ExplicitWidth = 612
  end
  inherited DBGrid1: TDBGrid
    Width = 612
    DataSource = dsViewTabela
    Columns = <
      item
        Expanded = False
        FieldName = 'PES_ID'
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PES_NOME'
        Title.Caption = 'Nome'
        Width = 215
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PES_DATANASC'
        Title.Caption = 'Data Nasc.'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PES_TIPOSANG'
        Title.Caption = 'Tipo Sangu'#237'neo'
        Width = 105
        Visible = True
      end>
  end
  inherited sqlViewTabela: TFDQuery
    Connection = dmDados.FDConnection
    SQL.Strings = (
      'SELECT * FROM BS_PESSOA'
      '')
  end
end
