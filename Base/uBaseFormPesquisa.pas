unit uBaseFormPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfBaseFormPesquisa = class(TForm)
    pnBotoes: TPanel;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    f2: TStaticText;
    f3: TStaticText;
    btnSair: TBitBtn;
    StaticText1: TStaticText;
    btnVisualizar: TBitBtn;
    StaticText2: TStaticText;
    btnExcluir: TBitBtn;
    DBGrid1: TDBGrid;
    pnFiltro: TPanel;
    edTextoDigitado: TMaskEdit;
    sqlViewTabela: TFDQuery;
    sqlViewTabelaPES_ID: TIntegerField;
    sqlViewTabelaPES_NOME: TStringField;
    sqlViewTabelaPES_DATANASC: TSQLTimeStampField;
    sqlViewTabelaPES_TIPOSANG: TStringField;
    dsViewTabela: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    FDataSet: TDataSet;
    FCampoId: string;
    FTextoDigitado: string;
    FCampoDescricao: String;
    procedure SetTextoDigitado(const Value: string);
    { Private declarations }
  protected
    procedure Inserir(); virtual; abstract;
    procedure Alterar(); virtual; abstract;
    procedure AtivarInativar(); virtual; abstract;
    procedure Visualizar(); virtual; abstract;
    procedure Imprimir(); virtual;
    procedure ListarImpressao(); virtual;
    procedure Excluir(); virtual; abstract;
    procedure AplicarAcessos(); virtual; abstract;
    procedure _FiltraTabela(); virtual; abstract;
    procedure DoEscolha(const AId: Integer); virtual;
  public
    { Public declarations }

    property CampoId: string read FCampoId;
    property CampoDescricao: String read FCampoDescricao;
    property DataSet: TDataSet read FDataSet write FDataSet;
    property TextoDigitado: string read FTextoDigitado write SetTextoDigitado;

    function Execute(): Integer; overload;
    function Execute(const ATextoDigitado: string): Integer; overload;

    constructor Create(const ACampoId: string); overload;
    constructor Create(const ACampoId, ATextoDigitado: string); overload;
    destructor Destroy(); override;

  end;

var
  fBaseFormPesquisa: TfBaseFormPesquisa;

implementation

{$R *.dfm}

procedure TfBaseFormPesquisa.btnAlterarClick(Sender: TObject);
begin
  if not FDataSet.IsEmpty() then
    Self.Alterar()
  else
    ShowMessage('Nenhum registro selecionado!');
end;

procedure TfBaseFormPesquisa.btnExcluirClick(Sender: TObject);
begin
  if not FDataSet.IsEmpty() then
    Self.Excluir()
  else
    ShowMessage('Nenhum registro selecionado!');
end;

procedure TfBaseFormPesquisa.btnNovoClick(Sender: TObject);
begin
  Self.Inserir();
end;

procedure TfBaseFormPesquisa.btnVisualizarClick(Sender: TObject);
begin
  if not FDataSet.IsEmpty() then
    Self.Visualizar()
  else
    ShowMessage('Nenhum registro selecionado!');
end;

constructor TfBaseFormPesquisa.Create(const ACampoId: string);
begin
  Create(ACampoId, EmptyStr);
end;

constructor TfBaseFormPesquisa.Create(const ACampoId, ATextoDigitado: string);
begin
  Create(ACampoId, TextoDigitado);
end;

procedure TfBaseFormPesquisa.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

destructor TfBaseFormPesquisa.Destroy;
begin

  inherited;
end;

procedure TfBaseFormPesquisa.DoEscolha(const AId: Integer);
begin

end;

function TfBaseFormPesquisa.Execute(const ATextoDigitado: string): Integer;
begin
  Result := Self.Execute(ATextoDigitado);
end;

function TfBaseFormPesquisa.Execute: Integer;
begin
  Result := Self.Execute(EmptyStr);
end;

procedure TfBaseFormPesquisa.FormActivate(Sender: TObject);
begin
  if DBGrid1.CanFocus then
    DBGrid1.SetFocus();
end;

procedure TfBaseFormPesquisa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then
  begin
    Key := 0;
    if btnNovo.Enabled and btnNovo.Visible then
      btnNovo.Click;
  end;
  if Key = VK_F3 then
  begin
    Key := 0;
    if btnAlterar.Enabled and btnAlterar.Visible then
      btnAlterar.Click;
  end;
  if Key = VK_F5 then
  begin
    Key := 0;
    if btnVisualizar.Enabled and btnVisualizar.Visible then
      btnVisualizar.Click;
  end;

  if Key = VK_RETURN then
  begin
    Key := 0;
    if DBGrid1.Focused then
      DBGrid1DblClick(Sender)
    else
      Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfBaseFormPesquisa.Imprimir;
begin

end;

procedure TfBaseFormPesquisa.ListarImpressao;
begin

end;

procedure TfBaseFormPesquisa.SetTextoDigitado(const Value: string);
begin
  FTextoDigitado := Value;
end;

end.
