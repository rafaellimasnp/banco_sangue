unit udmDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, Dialogs,
  FireDAC.Comp.Client, uConfigClasse, IniFiles;

type
  TDataModule1 = class(TDataModule)
    FDConnection: TFDConnection;
    sqlPessoas: TFDQuery;
    dsPessoas: TDataSource;
    sqlPessoasPES_ID: TIntegerField;
    sqlPessoasPES_NOME: TStringField;
    sqlPessoasPES_DATANASC: TSQLTimeStampField;
    sqlPessoasPES_TIPOSANG: TStringField;
    sqlDoacoes: TFDQuery;
    dsDoacoes: TDataSource;
    sqlDoacoesDOA_ID: TIntegerField;
    sqlDoacoesDOA_DATA: TSQLTimeStampField;
    sqlDoacoesDOA_QTDE: TFMTBCDField;
    sqlDoacoesPES_ID: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FNomeArquivoINI: string;
    procedure ConfigurarConexao(const ADataBase, AUserName, AServer,
      ADriver: String);
    procedure CarregarConfiguracoesINI();
    procedure ConectarBanco();
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TDataModule1.CarregarConfiguracoesINI;
var
  LArquivoINI: TIniFile;
  LDataBase, LUserName, LServer, LDriver: string;
begin
  LArquivoINI := TIniFile.Create(FNomeArquivoINI);
  try
    LDataBase := LArquivoINI.ReadString('Banco', 'Database', EmptyStr);
    LUserName := LArquivoINI.ReadString('Banco', 'User_Name', EmptyStr);
    LServer := LArquivoINI.ReadString('Banco', 'Server', EmptyStr);
    LDriver := LArquivoINI.ReadString('Banco', 'DriverID', EmptyStr);

    ConfigurarConexao(LDataBase, LUserName, LServer, LDriver);

  finally
    LArquivoINI.Free;
  end;

end;

procedure TDataModule1.ConectarBanco;
begin
  try
    Self.CarregarConfiguracoesINI;
    FDConnection.Open();
  except
    ShowMessage
      ('Erro ao tentar conecatar com o Banco de Dados! Verifique as configurações.');
    Abort();
  end;
end;

procedure TDataModule1.ConfigurarConexao(const ADataBase, AUserName, AServer,
  ADriver: String);
begin
  with FDConnection.Params do
  begin
    Clear;
    Add('Database=' + ADataBase);
    Add('User_Name=' + AUserName);
    Add('Password=123456');
    Add('Server=' + AServer);
    Add('DriverID=' + ADriver);
  end;
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  FNomeArquivoINI := TConfig.New().GetArquivoINI();
  ConectarBanco();
end;

end.
