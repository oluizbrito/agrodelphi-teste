unit UnitCadastroModelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TFormCadastroModelo = class(TForm)
    PageControlCadastro: TPageControl;
    TabSheetBusca: TTabSheet;
    TabSheetDados: TTabSheet;
    PanelSuperior: TPanel;
    PanelInferior: TPanel;
    Panel3: TPanel;
    DBGridDados: TDBGrid;
    ds: TDataSource;
    SpeedButtonEditar: TSpeedButton;
    SpeedButtonBuscar: TSpeedButton;
    EditBuscar: TEdit;
    SpeedButtonFechar: TSpeedButton;
    SpeedButtonNovo: TSpeedButton;
    PanelDadosInferior: TPanel;
    SpeedButtonCancelar: TSpeedButton;
    SpeedButtonSalvar: TSpeedButton;
    SpeedButtonExcluir: TSpeedButton;
    procedure SpeedButtonFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButtonEditarClick(Sender: TObject);
    procedure SpeedButtonNovoClick(Sender: TObject);
    procedure SpeedButtonCancelarClick(Sender: TObject);
    procedure SpeedButtonSalvarClick(Sender: TObject);
    procedure SpeedButtonExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButtonBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroModelo: TFormCadastroModelo;

implementation

{$R *.dfm}

uses UnitDM;

procedure TFormCadastroModelo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormCadastroModelo.FormShow(Sender: TObject);
begin
  PageControlCadastro.ActivePage := TabSheetBusca;
end;

procedure TFormCadastroModelo.SpeedButtonBuscarClick(Sender: TObject);
begin
  with ds.DataSet do
  begin
    Filtered := False;
    Filter   := DBGridDados.Columns[0].Title.Caption + ' LIKE ' + QuotedStr('%' + EditBuscar.Text + '%');
    Filtered := True;
  end;

end;

procedure TFormCadastroModelo.SpeedButtonCancelarClick(Sender: TObject);
begin


  if MessageDlg('Deseja realmente Cancelar as alterações?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ds.DataSet.Cancel;
    PageControlCadastro.ActivePage := TabSheetBusca;
  end;
end;

procedure TFormCadastroModelo.SpeedButtonEditarClick(Sender: TObject);
begin
  if not ds.DataSet.IsEmpty then
  begin
    ds.DataSet.Edit;
    PageControlCadastro.ActivePage := TabSheetDados;
  end
  else
    ShowMessage('Nenhum registro selecionado!');
end;

procedure TFormCadastroModelo.SpeedButtonExcluirClick(Sender: TObject);
begin
  if ds.DataSet.IsEmpty then
  begin
    ShowMessage('Nenhum registro selecionado!');
    Exit;
  end;

  if MessageDlg('Deseja realmente excluir?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ds.DataSet.Delete;
  end;
end;

procedure TFormCadastroModelo.SpeedButtonFecharClick(Sender: TObject);
begin
  ds.DataSet.Cancel;

  Close;
  Self.Close;
end;

procedure TFormCadastroModelo.SpeedButtonNovoClick(Sender: TObject);
begin
  ds.DataSet.Append;
  PageControlCadastro.ActivePage := TabSheetDados;
end;

procedure TFormCadastroModelo.SpeedButtonSalvarClick(Sender: TObject);
begin
  ds.DataSet.Post;
  PageControlCadastro.ActivePage := TabSheetBusca;
end;

end.
