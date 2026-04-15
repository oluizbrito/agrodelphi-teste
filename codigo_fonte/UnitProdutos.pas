unit UnitProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroModelo, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask,
  Vcl.DBCtrls;

type
  TFormCadastroProduto = class(TFormCadastroModelo)
    Label1: TLabel;
    DBEditDescricao: TDBEdit;
    Label2: TLabel;
    DBEditValor: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroProduto: TFormCadastroProduto;

implementation

{$R *.dfm}

uses UnitDM;

end.
