unit uConfigClasse;

interface

uses
  WinApi.Messages, System.SysUtils;

type
  IConfig = Interface
    function GetArquivoINI(): string;
  end;

  TConfig = Class(TInterfacedObject, IConfig)
    function GetArquivoINI(): string;
  public
    class function New(): IConfig;
  end;

implementation

{ TConfig }

function TConfig.GetArquivoINI: string;
begin
  Result := GetCurrentDir + '\Config.ini';
end;

class function TConfig.New: IConfig;
begin
  Result := TConfig.Create();
end;

end.
