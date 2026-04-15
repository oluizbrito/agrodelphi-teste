unit UnitClientes;

interface

uses
  REST.Client, REST.Types, REST.Json, System.JSON,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroModelo, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Mask, Vcl.DBCtrls;

type
  TFormCadastroCliente = class(TFormCadastroModelo)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEditNome: TDBEdit;
    DBEditCEP: TDBEdit;
    DBEditLogradouro: TDBEdit;
    DBEditComplemento: TDBEdit;
    DBEditBairro: TDBEdit;
    DBEditCidade: TDBEdit;
    DBEditUF: TDBEdit;
    DBEditCodIBGE: TDBEdit;
    procedure DBEditCEPExit(Sender: TObject);
    procedure SpeedButtonSalvarClick(Sender: TObject);
    procedure SpeedButtonNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure buscarCEP(const CEP: string);
  end;

var
  FormCadastroCliente: TFormCadastroCliente;

implementation

{$R *.dfm}

uses UnitDM;

procedure TFormCadastroCliente.buscarCEP(const CEP: string);
var
  JSON: TJSONObject;
begin
  if Length(CEP) < 8 then
  begin
    ShowMessage('CEP inválido.');
    DBEditCEP.Setfocus;
    Exit;
  end;

  DM.RESTClient.BaseURL := 'https://viacep.com.br/ws/' + CEP + '/json/';
  DM.RESTRequest.Method := rmGET;

  try
    DM.RESTRequest.Execute;

    if DM.RESTResponse.StatusCode = 200 then
    begin
      JSON := DM.RESTResponse.JSONValue as TJSONObject;

      if JSON.GetValue('erro') <> nil then
      begin
        ShowMessage('CEP não encontrado.');
        Exit;
      end;

      DBEditLogradouro.Text := JSON.GetValue<string>('logradouro');
      DBEditBairro.Text     := JSON.GetValue<string>('bairro');
      DBEditCidade.Text     := JSON.GetValue<string>('localidade');
      DBEditUF.Text         := JSON.GetValue<string>('uf');
      DBEditCodIBGE.Text    := JSON.GetValue<string>('ibge');
    end
    else
      ShowMessage('Erro ao buscar o CEP. Código HTTP: ' + DM.RESTResponse.StatusCode.ToString);

  except
    on E: Exception do
      ShowMessage('Erro ao consultar o CEP: ' + E.Message);
  end;
end;

procedure TFormCadastroCliente.DBEditCEPExit(Sender: TObject);
begin
  inherited;
  BuscarCEP(DBEditCEP.Text);
end;

procedure TFormCadastroCliente.SpeedButtonNovoClick(Sender: TObject);
begin
  inherited;
  DBEditNome.SetFocus;
end;

procedure TFormCadastroCliente.SpeedButtonSalvarClick(Sender: TObject);
begin
  if (DBEditNome.Text = '') or (DBEditCEP.Text = '') then
  begin
    ShowMessage('Preencha todos os dados corretamente.');
    Exit;
  end;


  inherited;

end;

end.
