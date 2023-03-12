unit uMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uPesqPessoas, uPesqDoacao,
  uFuncoesFS, uRelDoacoes;

type
  TfMenu = class(TForm)
    MainMenu: TMainMenu;
    SIstema1: TMenuItem;
    Sair1: TMenuItem;
    Arquivo1: TMenuItem;
    Pessoa1: TMenuItem;
    Processo1: TMenuItem;
    Doao1: TMenuItem;
    Relatrio1: TMenuItem;
    Doao2: TMenuItem;
    N1: TMenuItem;
    Configuraes1: TMenuItem;
    procedure Pessoa1Click(Sender: TObject);
    procedure Doao1Click(Sender: TObject);
    procedure Configuraes1Click(Sender: TObject);
    procedure Doao2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMenu: TfMenu;

implementation

{$R *.dfm}

procedure TfMenu.Configuraes1Click(Sender: TObject);
begin
  fFuncoesFS.FastRep3.DesignReport;
end;

procedure TfMenu.Doao1Click(Sender: TObject);
begin
  fPesqDoacao := TfPesqDoacao.Create();
  fPesqDoacao.Execute;
  FreeAndNil(fPesqDoacao);
end;

procedure TfMenu.Doao2Click(Sender: TObject);
begin
  fRelDoacoes := TFRelDoacoes.Create();
  fRelDoacoes.edData1.Date := Now;
  fRelDoacoes.edData2.Date := Now;
  fRelDoacoes.ShowModal;
  FreeAndNil(fRelDoacoes);
end;

procedure TfMenu.Pessoa1Click(Sender: TObject);
begin
  fPesqPessoas := TFPesqPessoas.Create();
  fPesqPessoas.Execute;
  FreeAndNil(fPesqPessoas);
end;

end.
