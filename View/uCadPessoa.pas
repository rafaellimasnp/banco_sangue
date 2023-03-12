unit uCadPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormCadastro, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, uFuncoes,
  scControls, scCalendar, uPessoaClasse, udmDados;

type
  TfCadPessoa = class(TfBaseFormCadastro)
    edNome: TEdit;
    lbNome: TLabel;
    lbDataNasc: TLabel;
    lbTipoSang: TLabel;
    cbTipoSang: TComboBox;
    edDataNasc: TscDateEdit;
  private
    { Private declarations }
    FPessoa: IPessoa;
    procedure PreencheDados(); override;
    function CamposEmBranco(): Boolean; override;
    procedure Gravar(); override;
  public
    { Public declarations }
    Constructor Create(const AId: Int64; const AEhVisualizar: Boolean);
      overload;
    Constructor Create(); overload;
    destructor destroy();

  end;

var
  fCadPessoa: TfCadPessoa;

implementation

{$R *.dfm}
{ TfCadPessoa }

function TfCadPessoa.CamposEmBranco: Boolean;
var
  Idade: integer;
begin
  if dmDados.GetPessoaCadastrada(edNome.Text, edDataNasc.Date) then
  begin
    Result := True;
    ShowMessage('Pessoa ja cadastrada no sistema');
    Exit;
  end;

  Idade := CalcIdade(edDataNasc.Date, Now);

  if (Idade < 18) or (Idade > 60) then
  begin
    Result := True;
    ShowMessage
      ('Somente maiores de 18 anos e adultos menores de 60 anos podem ser cadastrados');
    if edNome.CanFocus then
      edNome.SetFocus;
    Exit;
  end;

  if (Length(Trim(edNome.Text)) = 0) or (Length(Trim(edNome.Text)) <= 5) then
  begin
    Result := True;
    ShowMessage('Preencha o Nome corretamente');
    if edNome.CanFocus then
      edNome.SetFocus;
    Exit;
  end;

  if StrToDateDef(edDataNasc.Text, 0) = 0 then
  begin
    Result := True;
    ShowMessage('Preencha a Data de Nascimento corretamente.');
    if edDataNasc.CanFocus then
      edDataNasc.SetFocus;
    Exit;
  end;

  if cbTipoSang.ItemIndex = -1 then
  begin
    Result := True;
    ShowMessage('Preencha o Tipo Sanguíneo.');
    if cbTipoSang.CanFocus then
      cbTipoSang.SetFocus;
    Exit;
  end;

  if edDataNasc.Date > Now then
  begin
    Result := True;
    ShowMessage('Data inválida');
    if edDataNasc.CanFocus then
      edDataNasc.SetFocus;
    Exit;
  end;

end;

constructor TfCadPessoa.Create(const AId: Int64; const AEhVisualizar: Boolean);
begin
  inherited;
  FPessoa := dmDados.CarregarDadosPessoa(AId);
end;

constructor TfCadPessoa.Create;
begin
  inherited;
  FPessoa := dmDados.CarregarDadosPessoa(0);
end;

destructor TfCadPessoa.destroy;
begin
  inherited;
end;

procedure TfCadPessoa.Gravar;
begin
  inherited;

  FPessoa.Nome := edNome.Text;
  FPessoa.DataNasc := edDataNasc.Date;
  FPessoa.TipoSang := cbTipoSang.Text;
  FPessoa.Exists := (Self.Id > 0);

  dmDados.GravarPessoa(FPessoa);

end;

procedure TfCadPessoa.PreencheDados;
begin
  inherited;
  if FPessoa.Exists then
  begin
    edNome.Text := FPessoa.Nome;
    edDataNasc.Date := StrToDate(DateTimeToStr(FPessoa.DataNasc));
    cbTipoSang.ItemIndex := cbTipoSang.Items.IndexOf(FPessoa.TipoSang);
  end;

end;

end.
