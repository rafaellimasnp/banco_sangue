unit uCadDoacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormCadastro, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask,
  scControls, scCalendar, uDoacaoClasse, uDmDados, uPessoaClasse, uPesqPessoas;

type
  TfCadDoacao = class(TfBaseFormCadastro)
    lbNome: TLabel;
    lbDataNasc: TLabel;
    lbTipoSang: TLabel;
    edNome: TEdit;
    cbTipoSang: TComboBox;
    edDataNasc: TscDateEdit;
    Label2: TLabel;
    edDataColeta: TscDateEdit;
    edIDDoador: TEdit;
    edQuantidade: TscNumericEdit;
    lbQuantidade: TLabel;
    procedure edNomeExit(Sender: TObject);
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

function TfCadDoacao.CamposEmBranco: Boolean;
begin

end;

constructor TfCadDoacao.Create(const AId: Int64; const AEhVisualizar: Boolean);
begin
  FDoacao := dmDados.CarregarDadosDoacao(AId);
end;

constructor TfCadDoacao.Create;
begin
  FDoacao := dmDados.CarregarDadosDoacao(0);
end;

destructor TfCadDoacao.destroy;
begin
  inherited;
end;

procedure TfCadDoacao.edNomeExit(Sender: TObject);
var
  LPessoa: IPessoa;
begin
  inherited;
  fPesqPessoas := TFPesqPessoas.Create();
  if fPesqPessoas.Execute = mrOK then
  begin
    try
      LPessoa := TPessoa.Create;
      LPessoa := dmDados.CarregarDadosPessoa
        (fPesqPessoas.sqlViewTabela.FieldByName('PES_ID').AsInteger);
      edNome.Text := LPessoa.Nome;
      edDataNasc.Date := StrToDate(DateTimeToStr(LPessoa.DataNasc));
      cbTipoSang.ItemIndex := cbTipoSang.Items.IndexOf(LPessoa.TipoSang);
    finally
      FreeAndNil(LPessoa);
    end;
  end;

  FreeAndNil(fPesqPessoas);
end;

procedure TfCadDoacao.Gravar;
begin
  inherited;
  FDoacao.Data := edDataColeta.Date;
  FDoacao.Quantidade := edQuantidade.Value;
  FDoacao.PesId := StrToInt(edIDDoador.Text);
  dmDados.GravarDoacao(FDoacao);
end;

procedure TfCadDoacao.PreencheDados;
var
  LPessoa: IPessoa;
begin
  inherited;
  if FDoacao.Exists then
  begin
    edDataColeta.Date := StrToDate(DateTimeToStr(FDoacao.Data));
    edQuantidade.Value := FDoacao.Quantidade;

    try
      LPessoa := TPessoa.Create;
      LPessoa := dmDados.CarregarDadosPessoa(FDoacao.PesId);

      edNome.Text := LPessoa.Nome;
      edDataNasc.Date := StrToDate(DateTimeToStr(LPessoa.DataNasc));
      cbTipoSang.ItemIndex := cbTipoSang.Items.IndexOf(LPessoa.TipoSang);
    finally
      FreeAndNil(LPessoa);
    end;
  end;

end;

end.
