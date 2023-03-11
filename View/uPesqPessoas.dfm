inherited fPesqPessoas: TfPesqPessoas
  Caption = 'Pesquisa de Pessoas'
  ClientWidth = 615
  ExplicitWidth = 631
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBotoes: TPanel
    Width = 615
    ExplicitLeft = 0
    ExplicitWidth = 750
    inherited btnSair: TBitBtn
      Left = 521
      ExplicitLeft = 656
    end
    inherited StaticText1: TStaticText
      Left = 586
      ExplicitLeft = 721
    end
  end
  inherited DBGrid1: TDBGrid
    Width = 615
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
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PES_DATANASC'
        Title.Caption = 'Data Nasc'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PES_TIPOSANG'
        Title.Caption = 'Tipo Sangu'#237'neo'
        Visible = True
      end>
  end
  inherited pnFiltro: TPanel
    Width = 615
    inherited edTextoDigitado: TMaskEdit
      Width = 599
      OnChange = nil
      OnExit = nil
      OnKeyPress = nil
    end
  end
  inherited sqlViewTabela: TFDQuery
    Connection = dmDados.FDConnection
  end
end
