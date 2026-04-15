unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Menus;

type
  TFormPrincipal = class(TForm)
    ActionList: TActionList;
    ActionCliente: TAction;
    ActionProduto: TAction;
    ActionPedido: TAction;
    MainMenu: TMainMenu;
    Clientes1: TMenuItem;
    Produtos1: TMenuItem;
    Pedidos1: TMenuItem;
    PanelMenuLateral: TPanel;
    SpeedButtonCliente: TSpeedButton;
    SpeedButtonProduto: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure ActionClienteExecute(Sender: TObject);
    procedure ActionProdutoExecute(Sender: TObject);
    procedure ActionPedidoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AbrirMDIFormulario(FormClass: TFormClass);
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses UnitCadastroModelo, UnitDM, UnitClientes, UnitProdutos, UnitPedido;

procedure TFormPrincipal.AbrirMDIFormulario(FormClass: TFormClass);
var
  i: Integer;
  Form: TForm;
begin
  for i := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[i].ClassType = FormClass then
    begin
      MDIChildren[i].BringToFront;
      MDIChildren[i].SetFocus;
      Exit;
    end;
  end;

  Form := TFormClass(FormClass).Create(Self);
  Form.FormStyle := fsMDIChild;
end;

procedure TFormPrincipal.ActionClienteExecute(Sender: TObject);
begin
  AbrirMDIFormulario(TFormCadastroCliente);
end;

procedure TFormPrincipal.ActionPedidoExecute(Sender: TObject);
begin
  AbrirMDIFormulario(TFormPedido);
end;

procedure TFormPrincipal.ActionProdutoExecute(Sender: TObject);
begin
  AbrirMDIFormulario(TFormCadastroProduto);
end;

end.
