program Project1;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {FLogin},
  UTelaMenu in 'UTelaMenu.pas' {FTelaMenu},
  DAO in 'DAO.pas' {dm: TDataModule},
  UCliente in 'UCliente.pas' {FCliente},
  UPadrao in 'UPadrao.pas' {FPadrao},
  UUsuario in 'UUsuario.pas' {FUsuario},
  UInterface in 'UInterface.pas' {FInterface},
  UGarcon in 'UGarcon.pas' {FGarcon},
  UAmbiente in 'UAmbiente.pas' {FAmbiente},
  UItem in 'UItem.pas' {FItem},
  UCategoria in 'UCategoria.pas' {FCategoria},
  URestaurante in 'URestaurante.pas' {FRestaurante},
  UCardapio in 'UCardapio.pas' {FCardapio},
  UEnvio in 'UEnvio.pas' {FEnvio},
  Produto in 'Produto.pas',
  ListaItens in 'ListaItens.pas',
  UEstoque in 'UEstoque.pas' {FEstoque},
  URelatorioVendas in 'URelatorioVendas.pas' {FRelatorioVendas},
  URelatorioComissao in 'URelatorioComissao.pas' {FRelatorioComissao};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFPadrao, FPadrao);
  Application.Run;
end.
