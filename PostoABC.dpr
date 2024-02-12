program PostoABC;

uses
  Vcl.Forms,
  View.Principal in 'Views\View.Principal.pas' {frmprincipal},
  View.Combustivel in 'Views\View.Combustivel.pas' {frmcombustivel},
  Systems.Common in 'Systems\Systems.Common.pas',
  Systems.Conexao in 'Systems\Systems.Conexao.pas',
  Models.Dados in 'Models\Models.Dados.pas' {ModelDados: TDataModule},
  View.Conexao in 'Views\View.Conexao.pas' {frmconexao},
  View.Erro in 'Views\View.Erro.pas' {frmerro},
  View.Aviso in 'Views\View.Aviso.pas' {frmaviso},
  View.Confirmacao in 'Views\View.Confirmacao.pas' {frmconfirmar},
  View.Sucesso in 'Views\View.Sucesso.pas' {frmsucesso},
  Systems.Paramtrs in 'Systems\Systems.Paramtrs.pas',
  Interfaces.Combustivel in 'Interfaces\Interfaces.Combustivel.pas',
  Controllers.Combustivel in 'Controllers\Controllers.Combustivel.pas',
  Classe.Combustivel in 'Classes\Classe.Combustivel.pas',
  View.Tanques in 'Views\View.Tanques.pas' {frmtanques},
  Classe.Tanques in 'Classes\Classe.Tanques.pas',
  View.Bombas in 'Views\View.Bombas.pas' {frmbombas},
  Classe.Bombas in 'Classes\Classe.Bombas.pas',
  View.Abastecimento in 'Views\View.Abastecimento.pas' {frmabastecto},
  View.Abastecer in 'Views\View.Abastecer.pas' {frmabastecer},
  Classe.Abastecimento in 'Classes\Classe.Abastecimento.pas',
  View.Filtro.Relatorio in 'Views\View.Filtro.Relatorio.pas' {frmrelatorio},
  View.Impresso in 'Views\View.Impresso.pas' {frmimpresso};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TModelDados, ModelDados);
  Application.CreateForm(Tfrmprincipal, frmprincipal);
  Application.Run;
end.
