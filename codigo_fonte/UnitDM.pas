unit UnitDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, REST.Types, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TDM = class(TDataModule)
    FDConnection: TFDConnection;
    FDTableCliente: TFDTable;
    FDTableProduto: TFDTable;
    FDTableClienteID_CLIENTE: TIntegerField;
    FDTableClienteNOME: TStringField;
    FDTableClienteCEP: TStringField;
    FDTableClienteLOGRADOURO: TStringField;
    FDTableClienteCOMPLEMENTO: TStringField;
    FDTableClienteBAIRRO: TStringField;
    FDTableClienteCIDADE: TStringField;
    FDTableClienteUF: TStringField;
    FDTableClienteCOD_IBGE: TStringField;
    FDTableProdutoID_PRODUTO: TIntegerField;
    FDTableProdutoDESCRICAO: TStringField;
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    DataSourcePedido: TDataSource;
    DataSourceItemPedido: TDataSource;
    FDQueryPedido: TFDQuery;
    FDQueryItemPedido: TFDQuery;
    FDTableProdutoVALOR: TFMTBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
