unit uMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uPesqPessoas;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMenu: TfMenu;

implementation

{$R *.dfm}

procedure TfMenu.Pessoa1Click(Sender: TObject);
begin
  fPesqPessoas := TFPesqPessoas.Create();
  fPesqPessoas.ShowModal;
  FreeAndNil(fPesqPessoas);
end;

end.
