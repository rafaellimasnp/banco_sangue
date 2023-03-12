unit uPesqDoacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormPesquisa, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, udmDados, uFuncoes, uCadDoacao;

type
  TfPesqDoacao = class(TfBaseFormPesquisa)
    sqlViewTabelaPES_NOME: TStringField;
    sqlViewTabelaPES_DATANASC: TDateField;
    sqlViewTabelaDOA_DATA: TSQLTimeStampField;
    sqlViewTabelaDOA_ID: TFDAutoIncField;
    sqlViewTabelaDOA_QTDE: TFMTBCDField;
    procedure _FiltraTabela(); override;
    function FiltraDoacoes(BuscarExato: boolean = false): boolean;
    procedure Inserir(); override;
    procedure Alterar(); override;
    procedure Excluir(); override;
    procedure Visualizar(); override;

  public
    Constructor Create;
    destructor Destroy; override;
  end;

var
  fPesqDoacao: TfPesqDoacao;

implementation

{$R *.dfm}
{ TfDoacao }

procedure TfPesqDoacao.Alterar;
begin
  inherited;
  FCadDoacao := TfCadDoacao.Create(sqlviewtabela.fieldbyname('DOA_ID')
    .AsInteger, false);
  try
    FCadDoacao.Execute;
    Self._FiltraTabela();
  finally
    FreeAndNil(FCadDoacao);
  end;

end;

constructor TfPesqDoacao.Create;
begin
  inherited Create();
end;

destructor TfPesqDoacao.Destroy;
begin
  //
  inherited;
end;

procedure TfPesqDoacao.Excluir;
begin
  inherited;
  If MessageDlg('Você tem certeza que gostaria de EXCLUIR esse registro?',
    mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin

    // voltar aqui

  end;

end;

function TfPesqDoacao.FiltraDoacoes(BuscarExato: boolean): boolean;
var
  TextoSQL: string;
  Campo: string;
  EncontrouRegExato: boolean;
begin
  with dmDados do
  begin
    StatusBar1.SimpleText := TextoDigitado;
    TextoSQL := ' SELECT p.PES_NOME, p.PES_DATANASC, d.DOA_DATA, d.DOA_ID, ' +
      '           d.DOA_QTDE FROM BS_DOACAO d LEFT JOIN BS_PESSOA p ON p.PES_ID = d.PES_ID  ';

    if IsDigit(TextoDigitado) then
      Campo := 'DOA_ID'
    else
      Campo := 'PES_NOME';
    if Length(TextoDigitado) > 0 then
      TextoSQL := TextoSQL + 'AND (' + Campo + ' LIKE ''%' + TextoDigitado +
        '%'')' + #13;

    TextoSQL := TextoSQL + ' ORDER BY DOA_ID, ' + Campo;

    ZListaSQL(sqlviewtabela, TextoSQL);

    if BuscarExato then
      EncontrouRegExato := (sqlviewtabela.RecordCount = 1) and
        sqlviewtabela.fieldbyname(Campo).AsString.Equals(TextoDigitado)
    else
      EncontrouRegExato := false;
    Result := EncontrouRegExato;
  end;
end;

procedure TfPesqDoacao.Inserir;
begin
  inherited;
  FCadDoacao := TfCadDoacao.Create();
  try
    if FCadDoacao.Execute then
      Self._FiltraTabela();
  finally
    FreeAndNil(FCadDoacao);
  end;

end;

procedure TfPesqDoacao.Visualizar;
begin
  inherited;
  FCadDoacao := TfCadDoacao.Create(sqlviewtabela.fieldbyname('DOA_ID')
    .AsInteger, True);
  try
    FCadDoacao.Execute;
    Self._FiltraTabela();
  finally
    FreeAndNil(FCadDoacao);
  end;

end;

procedure TfPesqDoacao._FiltraTabela;
begin
  inherited;
  FiltraDoacoes();
end;

end.
