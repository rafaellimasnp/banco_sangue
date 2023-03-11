unit uCadPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormCadastro, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask,
  scControls, scCalendar;

type
  TfCadPessoa = class(TfBaseFormCadastro)
    edNome: TEdit;
    lbNome: TLabel;
    lbDataNasc: TLabel;
    lbTipoSang: TLabel;
    cbTipoSang: TComboBox;
    scDateEdit1: TscDateEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadPessoa: TfCadPessoa;

implementation

{$R *.dfm}

end.
