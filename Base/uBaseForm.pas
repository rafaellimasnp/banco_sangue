unit uBaseForm;

interface

uses
  WinApi.Windows, WinApi.Messages, SysUtils, Vcl.Buttons, Variants, Classes, Graphics, Controls, Forms, Dialogs, uFuncoes,
  StdCtrls;

type
  TfBaseForm = class(TForm)
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    FConfirmarSaida: Boolean;
    FEnterPularCampo: Boolean;
    FEscParaFechar: Boolean;
    FEscResultOk: Boolean;
  protected
    { Protected declarations }
  public
    { Public declarations }
    property ConfirmarSaida: Boolean read FConfirmarSaida write FConfirmarSaida;
    property EnterPularCampo: Boolean read FEnterPularCampo write FEnterPularCampo;
    property EscParaFechar: Boolean read FEscParaFechar write FEscParaFechar;
    property EscResultOk: Boolean read FEscResultOk write FEscResultOk;
    constructor Create(); reintroduce; Overload;
    constructor Create(const AOwner: TComponent); reintroduce; Overload;
  end;

var
  fBaseForm: TfBaseForm;

implementation

{$R *.dfm}


constructor TfBaseForm.Create();
begin
  Self.Create(nil);
end;

constructor TfBaseForm.Create(const AOwner: TComponent);
begin
  inherited Create(AOwner);
  FConfirmarSaida := False;
  FEnterPularCampo := True;
  FEscParaFechar := True;
  FEscResultOk := False;
end;

procedure TfBaseForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := (Self.ModalResult = mrOK) or not FConfirmarSaida or Pergunta('Sair', 'Deseja realmente sair?');
end;

procedure TfBaseForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    if FEscParaFechar then
    begin
      if FEscResultOk then
        Self.ModalResult := mrOK
      else
        Self.Close();
      Key := 0;
    end;
  end;

  if Key = VK_RETURN then
  begin
    if (ActiveControl is TBitBtn) then
    begin
      TBitBtn(ActiveControl).Click;
      Key := 0;
    end
    else if FEnterPularCampo then
    begin
      // Caso esteja focado em um combo box que esta aberto, o sistema irá desconsiderar a
      // pula do campo para poder selecionar o item focado pelo usuário.
      if (not(ActiveControl is TMemo)) and
        (not(ActiveControl is TCustomComboBox) or (SendMessage(ActiveControl.Handle, CB_GETDROPPEDSTATE, 0, 0) <> 1)) then
      begin
        Perform(WM_NEXTDLGCTL, 0, 0);
        Key := 0;
      end;
    end;
  end;
end;

end.
