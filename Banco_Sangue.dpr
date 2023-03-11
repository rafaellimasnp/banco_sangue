program Banco_Sangue;

uses
  Vcl.Forms,
  uMenu in 'View\uMenu.pas' {fMenu},
  udmDados in 'Model\udmDados.pas' {DataModule1: TDataModule},
  uBaseForm in 'Base\uBaseForm.pas' {fBaseForm},
  uBaseFormCadastro in 'Base\uBaseFormCadastro.pas' {fBaseFormCadastro},
  uFuncoes in 'Src\uFuncoes.pas',
  uConfigClasse in 'Controller\uConfigClasse.pas',
  uPessoaClasse in 'Controller\uPessoaClasse.pas',
  uDoacaoClasse in 'Controller\uDoacaoClasse.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMenu, fMenu);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfBaseForm, fBaseForm);
  Application.CreateForm(TfBaseFormCadastro, fBaseFormCadastro);
  Application.Run;
end.
