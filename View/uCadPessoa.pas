unit uCadPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormCadastro, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask,
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
    procedure PreencheDados(); override;
    function CamposEmBranco(): Boolean; override;
    procedure Gravar(); override;

  public
    { Public declarations }
    Constructor Create(const AId: Int64; const AEhVisualizar: Boolean); overload;
    Constructor Create(); overload;
    destructor destroy();

  end;

var
  fCadPessoa: TfCadPessoa;

implementation

{$R *.dfm}
{ TfCadPessoa }

function TfCadPessoa.CamposEmBranco: Boolean;
begin

end;

procedure TfCadPessoa.Gravar;
begin
  inherited;

end;

procedure TfCadPessoa.PreencheDados;
begin
  inherited;

end;

end.
