unit uPessoaClasse;

interface

type
  IPessoa = interface
    function GetDataNascimento: TDateTime;
    function GetId: int64;
    function GetNome: string;
    function GetTipoSangue: string;
    function GetExists: boolean;
    procedure SetDataNascimento(const Value: TDateTime);
    procedure SetId(const Value: int64);
    procedure SetNome(const Value: string);
    procedure SetTipoSangue(const Value: string);
    procedure SetExists(const Value: boolean);

    property Id: int64 read GetId write SetId;
    property Nome: string read GetNome write SetNome;
    property DataNasc: TDateTime read GetDataNascimento write SetDataNascimento;
    property TipoSang: string read GetTipoSangue write SetTipoSangue;
    property Exists: boolean read GetExists write SetExists;

  end;

  TPessoa = class(TInterfacedObject, IPessoa)
  private
    FId: int64;
    FNome: string;
    FDataNascimento: TDateTime;
    FTipoSangue: string;
    FExists: boolean;
    function GetDataNascimento: TDateTime;
    function GetId: int64;
    function GetNome: string;
    function GetTipoSangue: string;
    procedure SetDataNascimento(const Value: TDateTime);
    procedure SetId(const Value: int64);
    procedure SetNome(const Value: string);
    procedure SetTipoSangue(const Value: string);
    function GetExists: boolean;
    procedure SetExists(const Value: boolean);
  public
    property Id: int64 read GetId write SetId;
    property Nome: string read GetNome write SetNome;
    property DataNasc: TDateTime read GetDataNascimento write SetDataNascimento;
    property TipoSang: string read GetTipoSangue write SetTipoSangue;
    property Exists: boolean read GetExists write SetExists;

  end;

implementation

{ TPessoa }

function TPessoa.GetDataNascimento: TDateTime;
begin
  Result := FDataNascimento;
end;

function TPessoa.GetExists: boolean;
begin
  Result := FExists;
end;

function TPessoa.GetId: int64;
begin
  Result := FId;
end;

function TPessoa.GetNome: string;
begin
  Result := FNome;
end;

function TPessoa.GetTipoSangue: string;
begin
  Result := FTipoSangue;
end;

procedure TPessoa.SetDataNascimento(const Value: TDateTime);
begin
  FDataNascimento := Value;
end;

procedure TPessoa.SetExists(const Value: boolean);
begin
  FExists := Value;
end;

procedure TPessoa.SetId(const Value: int64);
begin
  FId := Value;

end;

procedure TPessoa.SetNome(const Value: string);
begin
  FNome := Value;

end;

procedure TPessoa.SetTipoSangue(const Value: string);
begin
  FTipoSangue := Value;
end;

end.
