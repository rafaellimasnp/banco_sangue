unit uFuncoes;

interface

uses
  SysUtils, Classes, StrUtils, Winapi.Windows, Winapi.ShellApi, IniFiles,
  Forms, JPEG, Graphics, Winapi.WinSvc, System.Win.Registry, Winapi.Messages,
  Winapi.winsock, Dialogs, Winapi.TlHelp32, DateUtils, IdHashMessageDigest,
  IdHash, DB, DBGrids, Grids, scControls, scCalendar,
  Math, StdCtrls, Mask, Consts,
  Controls, Variants, System.Win.ComObj, Winapi.ActiveX, DBCtrls, ExtCtrls,
  Winapi.NB30, Buttons, ZLib, Winapi.PsAPI;

function Pergunta(const ATitulo, ATexto: string): boolean;
procedure DesabilitaComponentes(Tela: TForm; Habilita: boolean = False;
  WParent: TWinControl = nil);

function ConvData(Data: TDateTime; DataHora: boolean = False): string;
function IsDigit(Texto: string): boolean;
function strLeft(Texto: string; Tamanho: Integer): string; // left do clipper

implementation

function strLeft(Texto: string; Tamanho: Integer): string;
var
  xx: string;
begin
  xx := Copy(Texto, 1, Tamanho);
  Result := xx;
end;

function IsDigit(Texto: string): boolean;
begin
  if Length(Texto) > 0 then
    if Texto[1] in ['0' .. '9'] then
      // ,'1','2','3','4','5','6','7','8','9'] then
      Result := True
    else
      Result := False
  else
    Result := False;
end;

function ConvData(Data: TDateTime; DataHora: boolean = False): string;
begin
  case DataHora of
    True:
      Result := FormatDateTime('yyyy-mm-ddthh:nn:ss', Data);
    False:
      Result := FormatDateTime('yyyy-mm-dd', Data);
  end;
end;

function Pergunta(const ATitulo, ATexto: string): boolean;
begin
  Result := Application.MessageBox(PWideChar(ATexto), PWideChar(ATitulo),
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES;
end;

procedure DesabilitaComponentes(Tela: TForm; Habilita: boolean = False;
  WParent: TWinControl = nil);

  function VerificaParent(WControl: TComponent): boolean;
  var
    WControl2: TWinControl;
  begin
    if WParent <> nil then
    begin
      Result := False;
      try
        WControl2 := TWinControl(WControl).Parent;
        while (not Result) and (WControl2 <> nil) do
        begin
          Result := WControl2.Name = WParent.Name;
          WControl2 := WControl2.Parent;
        end;
      except
        ;
      end;
    end
    else
      Result := True;
  end;

var
  xx: Integer;
begin
  with Tela do
  begin
    for xx := 0 to ComponentCount - 1 do
    begin
      if VerificaParent(Components[xx]) then
      begin
        if Components[xx] is TDBEdit then
        begin
          TDBEdit(Components[xx]).Enabled := Habilita;
          TDBEdit(Components[xx]).TabStop := Habilita;
        end;
        if Components[xx] is TEdit then
        begin
          TEdit(Components[xx]).Enabled := Habilita;
          TEdit(Components[xx]).TabStop := Habilita;
        end;
        if Components[xx] is TLabeledEdit then
        begin
          TLabeledEdit(Components[xx]).Enabled := Habilita;
          TLabeledEdit(Components[xx]).TabStop := Habilita;
        end;
        if Components[xx] is TMaskEdit then
        begin
          TMaskEdit(Components[xx]).Enabled := Habilita;
          TMaskEdit(Components[xx]).TabStop := Habilita;
        end;

        if Components[xx] is TscDateEdit then
        begin
          TscDateEdit(Components[xx]).Enabled := Habilita;
          TscDateEdit(Components[xx]).TabStop := Habilita;
        end;

        if Components[xx] is TDBCheckBox then
        begin
          TDBCheckBox(Components[xx]).Enabled := Habilita;
          TDBCheckBox(Components[xx]).TabStop := Habilita;
        end;
        if Components[xx] is TCheckBox then
        begin
          TCheckBox(Components[xx]).Enabled := Habilita;
          TCheckBox(Components[xx]).TabStop := Habilita;
        end;
        if Components[xx] is TDBRadioGroup then
        begin
          TDBRadioGroup(Components[xx]).Enabled := Habilita;
          TDBRadioGroup(Components[xx]).TabStop := Habilita;
        end;
        if Components[xx] is TComboBox then
        begin
          TComboBox(Components[xx]).Enabled := Habilita;
          TComboBox(Components[xx]).TabStop := Habilita;
        end;
        if Components[xx] is TDBComboBox then
        begin
          TDBComboBox(Components[xx]).Enabled := Habilita;
          TDBComboBox(Components[xx]).TabStop := Habilita;
        end;
        if Components[xx] is TRadioGroup then
        begin
          TRadioGroup(Components[xx]).Enabled := Habilita;
          TRadioGroup(Components[xx]).TabStop := Habilita;
        end;
        if Components[xx] is TDBLookupComboBox then
        begin
          TDBLookupComboBox(Components[xx]).Enabled := Habilita;
          TDBLookupComboBox(Components[xx]).TabStop := Habilita;
        end;
        if Components[xx] is TDBMemo then
        begin
          TDBMemo(Components[xx]).ReadOnly := not Habilita;
          TDBMemo(Components[xx]).TabStop := Habilita;
        end;
        if Components[xx] is TBitBtn then
        begin
          if Habilita or ((TBitBtn(Components[xx]).ModalResult <> mrCancel) and
            (TBitBtn(Components[xx]).Name <> 'btnSair')) then
          begin
            TBitBtn(Components[xx]).Enabled := Habilita;
            TBitBtn(Components[xx]).TabStop := Habilita;
          end;
        end;
        if Components[xx] is TSpeedButton then
        begin
          TSpeedButton(Components[xx]).Enabled := Habilita;
        end;

        if Components[xx] is TFrame then
        begin
          TFrame(Components[xx]).Enabled := Habilita;
          TFrame(Components[xx]).TabStop := Habilita;
        end;
        if WParent <> nil then
        begin
          if Components[xx] is TGroupBox then
          begin
            TGroupBox(Components[xx]).Enabled := Habilita;
            TGroupBox(Components[xx]).TabStop := Habilita;
          end;
          if Components[xx] is TLabel then
            TLabel(Components[xx]).Enabled := Habilita;
        end;
      end;
    end;
  end;
end;

end.
