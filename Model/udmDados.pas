unit udmDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
