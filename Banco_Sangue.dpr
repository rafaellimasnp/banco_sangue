program Banco_Sangue;

uses
  Vcl.Forms,
  uMenu in 'View\uMenu.pas' {fMenu},
  udmDados in 'Model\udmDados.pas' {dmDados: TDataModule},
  uBaseForm in 'Base\uBaseForm.pas' {fBaseForm},
  uBaseFormCadastro in 'Base\uBaseFormCadastro.pas' {fBaseFormCadastro},
  uFuncoes in 'Src\uFuncoes.pas',
  uConfigClasse in 'Controller\uConfigClasse.pas',
  uPessoaClasse in 'Controller\uPessoaClasse.pas',
  uDoacaoClasse in 'Controller\uDoacaoClasse.pas',
  uCadPessoa in 'View\uCadPessoa.pas' {fCadPessoa},
  uBaseFormPesquisa in 'Base\uBaseFormPesquisa.pas' {fBaseFormPesquisa},
  uPesqPessoas in 'View\uPesqPessoas.pas' {fPesqPessoas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMenu, fMenu);
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TfBaseForm, fBaseForm);
  Application.CreateForm(TfBaseFormCadastro, fBaseFormCadastro);
  Application.CreateForm(TfCadPessoa, fCadPessoa);
  Application.CreateForm(TfBaseFormPesquisa, fBaseFormPesquisa);
  Application.CreateForm(TfPesqPessoas, fPesqPessoas);
  Application.Run;
end.
