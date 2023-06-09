unit udmDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, Dialogs,
  FireDAC.Comp.Client, uConfigClasse, uPessoaClasse, IniFiles, uFuncoes,
  uDoacaoClasse, frxClass, frxDBSet;

type
  TdmDados = class(TDataModule)
    FDConnection: TFDConnection;
    sqlRelDoacoes: TFDQuery;
    frxRelDoacoes: TfrxDBDataset;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FQuery: TFDQuery;
    FTextoSQL: string;
    procedure ConfigurarConexao(const ADataBase, AUserName, AServer, ASenha,
      ADriver: String);
    procedure CarregarConfiguracoesINI();
  public
    { Public declarations }
    FNomeArquivoINI: string;
    procedure ConectarBanco();
    procedure GravarPessoa(const Value: IPessoa);
    procedure DeletarPessoa(const AID: Int64);
    procedure DeletarDoacao(const AID: Int64);
    function CarregarDadosPessoa(const AID: Int64): IPessoa;
    procedure GravarDoacao(const Value: IDoacao);
    function CarregarDadosDoacao(const AID: Int64): IDoacao;
    function DataUltimaDoacao(const APES_ID: Int64): IDoacao;
    function GetPessoaCadastrada(const ANome: string;
      const ADataNasc: TDateTime): Boolean;
    procedure ZListaSQL(const AQuery: TFDQuery; const ATextoSQL: string);
  end;

var
  dmDados: TdmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TdmDados.CarregarConfiguracoesINI;
var
  LArquivoINI: TIniFile;
  LDataBase, LUserName, LServer, LSenha, LDriver: string;
begin
  LArquivoINI := TIniFile.Create(FNomeArquivoINI);
  try
    LDataBase := LArquivoINI.ReadString('Banco', 'Database', EmptyStr);
    LUserName := LArquivoINI.ReadString('Banco', 'User_Name', EmptyStr);
    LServer := LArquivoINI.ReadString('Banco', 'Server', EmptyStr);
    LSenha := LArquivoINI.ReadString('Banco', 'Password', EmptyStr);
    LDriver := LArquivoINI.ReadString('Banco', 'DriverID', EmptyStr);

    ConfigurarConexao(LDataBase, LUserName, LServer, LSenha, LDriver);

  finally
    LArquivoINI.Free;
  end;

end;

function TdmDados.CarregarDadosDoacao(const AID: Int64): IDoacao;
var
  LQuery: TFDQuery;
begin
  try
    LQuery := TFDQuery.Create(nil);
    LQuery.Connection := Self.FDConnection;
    ZListaSQL(LQuery, 'SELECT * FROM BS_DOACAO WHERE DOA_ID =' + IntToStr(AID));
    Result := TDoacao.Create();

    Result.Exists := False;

    if LQuery.RecordCount > 0 then
    begin
      Result.Id := LQuery.FieldByName('DOA_ID').AsInteger;
      Result.Data := LQuery.FieldByName('DOA_DATA').AsDateTime;
      Result.Quantidade := LQuery.FieldByName('DOA_QTDE').AsCurrency;
      Result.PesId := LQuery.FieldByName('PES_ID').AsInteger;
      Result.Exists := True;
    end;

  finally
    FreeAndNil(LQuery);
  end;

end;

function TdmDados.CarregarDadosPessoa(const AID: Int64): IPessoa;
var
  LQuery: TFDQuery;
begin
  try
    LQuery := TFDQuery.Create(nil);
    LQuery.Connection := Self.FDConnection;
    ZListaSQL(LQuery, 'SELECT * FROM BS_PESSOA WHERE PES_ID =' + IntToStr(AID));

    Result := TPessoa.Create();

    Result.Exists := False;

    if LQuery.RecordCount > 0 then
    begin
      Result.Id := LQuery.FieldByName('PES_ID').AsInteger;
      Result.Nome := LQuery.FieldByName('PES_NOME').AssTring;
      Result.DataNasc := LQuery.FieldByName('PES_DATANASC').AsDateTime;
      Result.TipoSang := LQuery.FieldByName('PES_TIPOSANG').AssTring;
      Result.Exists := True;
    end;

  finally
    FreeAndNil(LQuery);
  end;

end;

procedure TdmDados.ConectarBanco;
begin
  try
    Self.CarregarConfiguracoesINI;
    FDConnection.Open();
    FQuery := TFDQuery.Create(nil);
    FQuery.Connection := FDConnection;
  except
    ShowMessage
      ('Erro ao tentar conecatar com o Banco de Dados! Verifique as configurações.');
    Abort();
  end;
end;

procedure TdmDados.ConfigurarConexao(const ADataBase, AUserName, AServer,
  ASenha, ADriver: String);
begin
  with FDConnection.Params do
  begin
    Clear;
    Add('Database=' + ADataBase);
    Add('User_Name=' + AUserName);
    Add('Password=' + ASenha);
    Add('Server=' + AServer);
    Add('DriverID=' + ADriver);
  end;
end;

procedure TdmDados.DataModuleCreate(Sender: TObject);
begin
  FNomeArquivoINI := TConfig.New().GetArquivoINI();
  ConectarBanco();
end;

function TdmDados.DataUltimaDoacao(const APES_ID: Int64): IDoacao;
begin
  ZListaSQL(FQuery,
    'SELECT TOP 1 DOA_DATA, DOA_ID FROM BS_DOACAO WHERE PES_ID = ' +
    IntToStr(APES_ID));

  if FQuery.RecordCount > 0 then
    Result := CarregarDadosDoacao(FQuery.FieldByName('DOA_ID').AsInteger)
  else
    Result := CarregarDadosDoacao(0);

end;

procedure TdmDados.DeletarDoacao(const AID: Int64);
begin
  FTextoSQL := 'DELETE FROM BS_DOACAO WHERE DOA_ID = ' + IntToStr(AID);
  FQuery.Close;
  FQuery.SQL.Text := FTextoSQL;
  FQuery.ExecSQL;
end;

procedure TdmDados.DeletarPessoa(const AID: Int64);
begin
  FTextoSQL := 'DELETE FROM BS_PESSOA WHERE PES_ID = ' + IntToStr(AID);
  FQuery.Close;
  FQuery.SQL.Text := FTextoSQL;
  FQuery.ExecSQL;
end;

function TdmDados.GetPessoaCadastrada(const ANome: string;
  const ADataNasc: TDateTime): Boolean;
begin
  ZListaSQL(FQuery, 'SELECT * FROM BS_PESSOA WHERE PES_NOME = ''' + ANome +
    ''' AND PES_DATANASC = ''' + ConvData(ADataNasc) + '''');

  Result := FQuery.RecordCount > 0;

end;

procedure TdmDados.GravarDoacao(const Value: IDoacao);
begin
  FTextoSQL :=
    'INSERT INTO BS_DOACAO(DOA_DATA, DOA_QTDE, PES_ID) values (:DATA, :QUANTIDADE, :PESID)';

  if Value.Exists then
    FTextoSQL := 'UPDATE BS_DOACAO   ' + sLineBreak +
      '    SET DOA_DATA = :DATA ,' + sLineBreak + '    DOA_QTDE = :QUANTIDADE ,'
      + sLineBreak + '    PES_ID = :PESID  WHERE DOA_ID = :ID ';

  FQuery.Close;
  FQuery.SQL.Text := FTextoSQL;
  FQuery.ParamByName('DATA').Value := Value.Data;
  FQuery.ParamByName('QUANTIDADE').AsCurrency := Value.Quantidade;
  FQuery.ParamByName('PESID').AsInteger := Value.PesId;

  if Value.Exists then
    FQuery.ParamByName('ID').AssTring := IntToStr(Value.Id);

  FQuery.ExecSQL;

end;

procedure TdmDados.GravarPessoa(const Value: IPessoa);
begin
  FTextoSQL :=
    'INSERT INTO BS_PESSOA(PES_NOME, PES_DATANASC, PES_TIPOSANG) values (:NOME, :DATANASC, :TIPOSANGUE)';

  if Value.Exists then
    FTextoSQL := 'UPDATE BS_PESSOA   ' + sLineBreak +
      '    SET PES_NOME = :NOME ,' + sLineBreak +
      '    PES_DATANASC = :DATANASC ,' + sLineBreak +
      '    PES_TIPOSANG = :TIPOSANGUE  WHERE PES_ID = :ID ';

  FQuery.Close;
  FQuery.SQL.Text := FTextoSQL;
  FQuery.ParamByName('NOME').AssTring := AnsiUpperCase(Value.Nome);
  FQuery.ParamByName('DATANASC').AssTring := ConvData(Value.DataNasc);
  FQuery.ParamByName('TIPOSANGUE').AssTring := Value.TipoSang;
  if Value.Exists then
    FQuery.ParamByName('ID').AssTring := IntToStr(Value.Id);

  FQuery.ExecSQL;
end;

procedure TdmDados.ZListaSQL(const AQuery: TFDQuery; const ATextoSQL: string);
begin
  try
    AQuery.Close();
    AQuery.SQL.Text := ATextoSQL;
    AQuery.Open();
  except
    on E: Exception do
    begin
      ShowMessage('Ocorreu o seguinte erro ' +
        'ao tentar acessar o Banco de Dados: ' + #13#13 + 'Tabela: ' +
        AQuery.Name + #13 + E.Message + #13#13 + ATextoSQL);

      raise;
    end;
  end;
end;

end.
