unit uDoacaoClasse;

interface

type
  IDoacao = interface
    function GetId: int64;
    function GetData: TDateTime;
    function GetQuantidade: Float64;
    function GetPesId: int64;

    procedure SetId(const Value: int64);
    procedure SetData(const Value: TDateTime);
    procedure SetQuantidade(const Value: Float64);
    procedure SetPesId(const Value: int64);

    property Id: int64 read GetId write SetId;
    property Data: TDateTime read GetData write SetData;
    property Quantidade: Float64 read GetQuantidade write SetQuantidade;
    property PesId: int64 read GetPesId write SetPesId;

  end;

  TDoacao = class(TInterfacedObject, IDoacao)
  private
    FId: int64;
    FData: TDateTime;
    FQuantidade: Float64;
    FPesId: int64;
    function GetData: TDateTime;
    function GetId: int64;
    function GetPesId: int64;
    function GetQuantidade: Float64;
    procedure SetData(const Value: TDateTime);
    procedure SetId(const Value: int64);
    procedure SetPesId(const Value: int64);
    procedure SetQuantidade(const Value: Float64);
  public
    property Id: int64 read GetId write SetId;
    property Data: TDateTime read GetData write SetData;
    property Quantidade: Float64 read GetQuantidade write SetQuantidade;
    property PesId: int64 read GetPesId write SetPesId;

  end;

implementation

{ TDoacao }

function TDoacao.GetData: TDateTime;
begin
  Result := FData;
end;

function TDoacao.GetId: int64;
begin
  Result := FId;
end;

function TDoacao.GetPesId: int64;
begin
  Result := FPesId;
end;

function TDoacao.GetQuantidade: Float64;
begin
  Result := FQuantidade;
end;

procedure TDoacao.SetData(const Value: TDateTime);
begin
  FData := Value;
end;

procedure TDoacao.SetId(const Value: int64);
begin
  FId := Value;
end;

procedure TDoacao.SetPesId(const Value: int64);
begin
  FPesId := Value;
end;

procedure TDoacao.SetQuantidade(const Value: Float64);
begin
  FQuantidade := Value;
end;

end.
