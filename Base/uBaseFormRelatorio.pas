unit uBaseFormRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseForm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TfBaseFormRelatorio = class(TfBaseForm)
    Panel1: TPanel;
    btnSair: TBitBtn;
    StaticText1: TStaticText;
    bntImprimir: TBitBtn;
    StaticText2: TStaticText;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bntImprimirClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function CamposEmBranco(): Boolean; virtual;
    procedure Imprimir(); virtual; abstract;
  public
    { Public declarations }
    procedure Execute(); virtual;
  end;

var
  fBaseFormRelatorio: TfBaseFormRelatorio;

implementation

{$R *.dfm}


procedure TfBaseFormRelatorio.bntImprimirClick(Sender: TObject);
begin
  inherited;
  if not Self.CamposEmBranco() then
    Self.Imprimir();
end;

function TfBaseFormRelatorio.CamposEmBranco: Boolean;
begin
  Result := False;
end;

procedure TfBaseFormRelatorio.Execute;
begin
  Self.ShowModal();
end;

procedure TfBaseFormRelatorio.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F2) and (bntImprimir.Enabled) then
    bntImprimirClick(Sender);
end;

end.
