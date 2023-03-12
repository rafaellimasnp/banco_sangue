unit uCadDoacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormCadastro, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, uFuncoes, DateUtils,
  scControls, scCalendar, uDoacaoClasse, uDmDados, uPessoaClasse, uPesqPessoas,
  Vcl.ComCtrls;

type
  TfCadDoacao = class(TfBaseFormCadastro)
    lbNome: TLabel;
    lbDataNasc: TLabel;
    lbTipoSang: TLabel;
    edNome: TEdit;
    cbTipoSang: TComboBox;
    edDataNasc: TscDateEdit;
    Label2: TLabel;
    edIDDoador: TEdit;
    edQuantidade: TscNumericEdit;
    lbQuantidade: TLabel;
    edDataColeta: TDateTimePicker;
    edHora: TDateTimePicker;
    btnBuscar: TBitBtn;
    procedure btnBuscarClick(Sender: TObject);
  private
    FDoacao: IDoacao;
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
  fCadDoacao: TfCadDoacao;

implementation

{$R *.dfm}
{ TfCadDoacao }

procedure TfCadDoacao.btnBuscarClick(Sender: TObject);
var
  LPessoa: IPessoa;
  LUltimaDoacao: IDoacao;
  LIDade: integer;
begin
  inherited;
  fPesqPessoas := TFPesqPessoas.Create();
  if fPesqPessoas.Execute > 0 then
  begin
    LPessoa := TPessoa.Create;
    LUltimaDoacao := TDoacao.Create;
    LPessoa := dmDados.CarregarDadosPessoa
      (fPesqPessoas.sqlViewTabela.FieldByName('PES_ID').AsInteger);

    LIDade := CalcIdade(LPessoa.DataNasc, Now);

    if (LIDade < 18) or (LIDade > 60) then
    begin
      ShowMessage
        ('Menores de 18 anos e maiores de 60 anos, não podem doar sangue');
      Exit;
    end;

    LUltimaDoacao := dmDados.DataUltimaDoacao(LPessoa.Id);

    if DaysBetween(LUltimaDoacao.Data, Now) <= 15 then
    begin
      ShowMessage('Doador se encontra Inápto para realizar a Doação');
      Exit;
    end;

    edNome.Text := LPessoa.Nome;
    edDataNasc.Date := StrToDate(DateTimeToStr(LPessoa.DataNasc));
    cbTipoSang.ItemIndex := cbTipoSang.Items.IndexOf(LPessoa.TipoSang);
    edIDDoador.Text := IntToStr(LPessoa.Id);
  end;
  FreeAndNil(fPesqPessoas);

end;

function TfCadDoacao.CamposEmBranco: Boolean;
begin
  Result := False;
  if (edQuantidade.Value <= 0) or (edQuantidade.Value > 1000) then
  begin
    Result := True;
    ShowMessage
      ('Informe a quantidade(ml) correta: Maior que 0 e Menor que igual 1000');
    if edQuantidade.CanFocus then
      edQuantidade.SetFocus;
    Exit
  end;

  if edDataColeta.Date > Now then
  begin
    Result := True;
    ShowMessage('Data da Coleta inválida');
    if edDataColeta.CanFocus then
      edDataColeta.SetFocus;
    Exit;
  end;

end;

constructor TfCadDoacao.Create(const AId: Int64; const AEhVisualizar: Boolean);
begin
  inherited;
  FDoacao := dmDados.CarregarDadosDoacao(AId);
end;

constructor TfCadDoacao.Create;
begin
  inherited;
  FDoacao := dmDados.CarregarDadosDoacao(0);
end;

destructor TfCadDoacao.destroy;
begin
  inherited;
end;

procedure TfCadDoacao.Gravar;
begin
  inherited;
  FDoacao.Data := edDataColeta.Date + edHora.Time;
  FDoacao.Quantidade := edQuantidade.Value;
  FDoacao.PesId := StrToInt(edIDDoador.Text);
  FDoacao.Exists := (Self.Id > 0);
  dmDados.GravarDoacao(FDoacao);
end;

procedure TfCadDoacao.PreencheDados;
var
  LPessoa: IPessoa;
begin
  inherited;
  edDataColeta.Date := Now;
  edHora.Time := Now;
  edQuantidade.Value := 0;

  if FDoacao.Exists then
  begin
    edDataColeta.Date := FDoacao.Data;
    edHora.Time := StrToTime(TimeToStr(FDoacao.Data));
    edQuantidade.Value := FDoacao.Quantidade;

    LPessoa := TPessoa.Create;
    LPessoa := dmDados.CarregarDadosPessoa(FDoacao.PesId);

    edNome.Text := LPessoa.Nome;
    edDataNasc.Date := StrToDate(DateTimeToStr(LPessoa.DataNasc));
    cbTipoSang.ItemIndex := cbTipoSang.Items.IndexOf(LPessoa.TipoSang);
    edIDDoador.Text := IntToStr(LPessoa.Id);

  end;

end;

end.
