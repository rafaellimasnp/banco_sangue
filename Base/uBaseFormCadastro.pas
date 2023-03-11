unit uBaseFormCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, uBaseForm,
  uFuncoes, Vcl.ExtCtrls;

type
  TfBaseFormCadastro = class(TfBaseForm)
    Panel1: TPanel;
    btnSair: TBitBtn;
    StaticText1: TStaticText;
    btnGravar: TBitBtn;
    StaticText2: TStaticText;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnGravarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    FEhVisualizar: Boolean;
    FEhNovoCadastro: Boolean;
    FConfirmarCadastro: Boolean;
  protected
    FId: Int64;
    procedure SetEhVisualizar(const Value: Boolean); virtual;
    procedure PreValidacao(); virtual;
    procedure PreencheDados(); virtual;
    function CamposEmBranco: Boolean; virtual;
    procedure Gravar(); virtual; abstract;
  public
    { Public declarations }
    property Id: Int64 read FId;
    property EhVisualizar: Boolean read FEhVisualizar write SetEhVisualizar;
    property EhNovoCadastro: Boolean read FEhNovoCadastro;
    property ConfirmarCadastro: Boolean read FConfirmarCadastro
      write FConfirmarCadastro;
    function Execute(): Boolean; virtual;

    constructor Create(); overload;
    constructor Create(const AId: Int64); overload;
    constructor Create(const AId: Int64; const AEhVisualizar: Boolean);
      overload;
  end;

var
  fBaseFormCadastro: TfBaseFormCadastro;

implementation

{$R *.dfm}

procedure TfBaseFormCadastro.btnGravarClick(Sender: TObject);
begin
  if not btnGravar.Enabled then
    Exit();

  if (btnGravar.CanFocus()) then
    btnGravar.SetFocus;

  btnGravar.Enabled := False;
  try
    if Self.CamposEmBranco() then
      Abort();
    if FConfirmarCadastro and not Pergunta('Gravar', 'Deseja realmente gravar?')
    then
      Abort();
    Self.Gravar();
    Self.ModalResult := mrOK;
  except
    btnGravar.Enabled := True;
    raise;
  end;
end;

constructor TfBaseFormCadastro.Create;
begin
  Create(0);
end;

constructor TfBaseFormCadastro.Create(const AId: Int64);
begin
  Create(AId, False);
end;

function TfBaseFormCadastro.CamposEmBranco: Boolean;
begin
  Result := False;
end;

constructor TfBaseFormCadastro.Create(const AId: Int64;
  const AEhVisualizar: Boolean);
begin
  inherited Create();
  FId := AId;
  FEhNovoCadastro := AId = 0;
  FConfirmarCadastro := False;
  Self.ConfirmarSaida := not AEhVisualizar;
  Self.SetEhVisualizar(AEhVisualizar);
end;

function TfBaseFormCadastro.Execute: Boolean;
begin
  Self.PreencheDados();
  Result := Self.ShowModal() = mrOK;
end;

procedure TfBaseFormCadastro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Self.ConfirmarSaida := Self.ConfirmarSaida and not FEhVisualizar;
  inherited;
end;

procedure TfBaseFormCadastro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    btnGravar.Click();
end;

procedure TfBaseFormCadastro.PreencheDados;
begin

end;

procedure TfBaseFormCadastro.PreValidacao;
begin

end;

procedure TfBaseFormCadastro.SetEhVisualizar(const Value: Boolean);
begin
  FEhVisualizar := Value;
  ConfirmarSaida := not FEhVisualizar;
  if FEhVisualizar then
    DesabilitaComponentes(Self);
end;

end.
