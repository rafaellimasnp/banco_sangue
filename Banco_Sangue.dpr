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
  uPesqPessoas in 'View\uPesqPessoas.pas' {fPesqPessoas},
  uPesqDoacao in 'View\uPesqDoacao.pas' {fPesqDoacao},
  uCadDoacao in 'View\uCadDoacao.pas' {fCadDoacao},
  uFuncoesFS in 'Src\uFuncoesFS.pas' {fFuncoesFS},
  uBaseFormRelatorio in 'Base\uBaseFormRelatorio.pas' {fBaseFormRelatorio},
  uRelDoacoes in 'View\uRelDoacoes.pas' {fRelDoacoes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMenu, fMenu);
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TfPesqDoacao, fPesqDoacao);
  Application.CreateForm(TfCadDoacao, fCadDoacao);
  Application.CreateForm(TfFuncoesFS, fFuncoesFS);
  Application.CreateForm(TfBaseFormRelatorio, fBaseFormRelatorio);
  Application.CreateForm(TfRelDoacoes, fRelDoacoes);
  Application.Run;
end.
