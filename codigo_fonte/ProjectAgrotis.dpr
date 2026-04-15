program ProjectAgrotis;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {FormPrincipal},
  UnitCadastroModelo in 'UnitCadastroModelo.pas' {FormCadastroModelo},
  UnitDM in 'UnitDM.pas' {DM: TDataModule},
  UnitClientes in 'UnitClientes.pas' {FormCadastroCliente},
  UnitProdutos in 'UnitProdutos.pas' {FormCadastroProduto},
  UnitPedido in 'UnitPedido.pas' {FormPedido};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
