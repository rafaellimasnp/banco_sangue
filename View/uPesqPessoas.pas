unit uPesqPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormPesquisa, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.ExtCtrls, udmDados, uCadPessoa, uFuncoes, Vcl.ComCtrls;

type
  TfPesqPessoas = class(TfBaseFormPesquisa)
  private
    procedure AplicarAcessos(); override;
    procedure _FiltraTabela(); override;
    procedure Inserir(); override;
    procedure Alterar(); override;
    procedure Excluir(); override;
    procedure Visualizar(); override;
  public
    Constructor Create;
    destructor Destroy; override;
    function FiltraPessoas(BuscarExato: boolean = false): boolean;
  end;

var
  fPesqPessoas: TfPesqPessoas;

implementation

{$R *.dfm}
{ TfPesqPessoas }

procedure TfPesqPessoas.Alterar;
begin
  inherited;
  FCadPessoa := TfCadPessoa.Create(sqlviewtabela.fieldbyname('PES_ID')
    .AsInteger, false);
  try
    FCadPessoa.Execute;
    Self._FiltraTabela();
  finally
    FreeAndNil(FCadPessoa);
  end;
end;

procedure TfPesqPessoas.AplicarAcessos;
begin
  inherited;

end;

constructor TfPesqPessoas.Create;
begin
  inherited Create();
end;

destructor TfPesqPessoas.Destroy;
begin

  inherited;
end;

procedure TfPesqPessoas.Excluir;
begin
  inherited;
  If MessageDlg('Voc� tem certeza que gostaria de EXCLUIR esse registro?',
    mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    dmDados.DeletarPessoa(sqlviewtabela.fieldbyname('PES_ID').AsInteger);
    _FiltraTabela();
  end;

end;

function TfPesqPessoas.FiltraPessoas(BuscarExato: boolean): boolean;
var
  TextoSQL: string;
  Campo: string;
  EncontrouRegExato: boolean;
begin
  with dmDados do
  begin
    Campo := 'PES_NOME';
    StatusBar1.SimpleText := TextoDigitado;
    TextoSQL := 'SELECT * FROM BS_PESSOA WHERE PES_ID >= 0' + #13;

    if IsDigit(TextoDigitado) then
      Campo := 'PES_ID'
    else
      Campo := 'PES_NOME';
    if Length(TextoDigitado) > 0 then
      TextoSQL := TextoSQL + 'AND (' + Campo + ' LIKE ''%' + TextoDigitado +
        '%'')' + #13;

    TextoSQL := TextoSQL + ' ORDER BY PES_ID, ' + Campo;

    ZListaSQL(sqlviewtabela, TextoSQL);

    if BuscarExato then
      EncontrouRegExato := (sqlviewtabela.RecordCount = 1) and
        sqlviewtabela.fieldbyname(Campo).AsString.Equals(TextoDigitado)
    else
      EncontrouRegExato := false;
    Result := EncontrouRegExato;
  end;

end;

procedure TfPesqPessoas.Inserir;
begin
  inherited;
  FCadPessoa := TfCadPessoa.Create();
  try
    if FCadPessoa.Execute then
      Self._FiltraTabela();
  finally
    FreeAndNil(FCadPessoa);
  end;

end;

procedure TfPesqPessoas.Visualizar;
begin
  inherited;
  FCadPessoa := TfCadPessoa.Create(sqlviewtabela.fieldbyname('PES_ID')
    .AsInteger, True);
  try
    FCadPessoa.Execute;
    Self._FiltraTabela();
  finally
    FreeAndNil(FCadPessoa);
  end;

end;

procedure TfPesqPessoas._FiltraTabela;
begin
  inherited;
  FiltraPessoas();
end;

end.
