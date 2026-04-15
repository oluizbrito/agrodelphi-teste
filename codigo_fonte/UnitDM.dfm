object DM: TDM
  Height = 545
  Width = 626
  PixelsPerInch = 120
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=D:\PROJETOS\AGROTIS\AGROTISDB.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=localhost'
      'Port=3050'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 24
  end
  object FDTableCliente: TFDTable
    Active = True
    IndexFieldNames = 'ID_CLIENTE'
    Connection = FDConnection
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    UpdateOptions.KeyFields = 'ID_CLIENTE'
    UpdateOptions.AutoIncFields = 'ID_CLIENTE'
    TableName = 'CLIENTE'
    Left = 56
    Top = 136
    object FDTableClienteID_CLIENTE: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDTableClienteNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object FDTableClienteCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 9
    end
    object FDTableClienteLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      Size = 100
    end
    object FDTableClienteCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 100
    end
    object FDTableClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 100
    end
    object FDTableClienteCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 100
    end
    object FDTableClienteUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object FDTableClienteCOD_IBGE: TStringField
      FieldName = 'COD_IBGE'
      Origin = 'COD_IBGE'
      Size = 10
    end
  end
  object FDTableProduto: TFDTable
    Active = True
    IndexFieldNames = 'ID_PRODUTO'
    Connection = FDConnection
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    UpdateOptions.KeyFields = 'ID_PRODUTO'
    UpdateOptions.AutoIncFields = 'ID_PRODUTO'
    TableName = 'PRODUTO'
    Left = 56
    Top = 216
    object FDTableProdutoID_PRODUTO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDTableProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 100
    end
    object FDTableProdutoVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
      Size = 2
    end
  end
  object RESTClient: TRESTClient
    Params = <>
    SynchronizedEvents = False
    Left = 408
    Top = 64
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Params = <>
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 408
    Top = 152
  end
  object RESTResponse: TRESTResponse
    Left = 408
    Top = 232
  end
  object DataSourcePedido: TDataSource
    DataSet = FDQueryPedido
    Left = 184
    Top = 296
  end
  object DataSourceItemPedido: TDataSource
    DataSet = FDQueryItemPedido
    Left = 184
    Top = 376
  end
  object FDQueryPedido: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = FDConnection
    UpdateOptions.KeyFields = 'ID_PEDIDO'
    UpdateOptions.AutoIncFields = 'ID_PEDIDO'
    SQL.Strings = (
      'SELECT '
      '  P.ID_PEDIDO,'
      '  P.REFERENCIA,'
      '  P.NUMERO_PEDIDO,'
      '  P.DATA_EMISSAO,'
      '  P.ID_CLIENTE,'
      '  C.NOME AS CLIENTE_NOME,'
      '  P.TIPO_OPERACAO,'
      '  P.TOTAL_PEDIDO'
      'FROM PEDIDO P'
      'JOIN CLIENTE C ON C.ID_CLIENTE = P.ID_CLIENTE')
    Left = 56
    Top = 296
  end
  object FDQueryItemPedido: TFDQuery
    Active = True
    CachedUpdates = True
    IndexFieldNames = 'ID_PEDIDO'
    MasterSource = DataSourcePedido
    MasterFields = 'ID_PEDIDO'
    DetailFields = 'ID_PEDIDO'
    Connection = FDConnection
    FetchOptions.AssignedValues = [evCache]
    UpdateOptions.KeyFields = 'ID_ITEM'
    UpdateOptions.AutoIncFields = 'ID_ITEM'
    SQL.Strings = (
      'SELECT '
      '  I.ID_ITEM,'
      '  I.ID_PEDIDO,'
      '  I.ID_PRODUTO,'
      '  P.DESCRICAO AS PRODUTO_NOME,'
      '  I.QUANTIDADE,'
      '  I.VALOR_UNITARIO,'
      '  (I.QUANTIDADE * I.VALOR_UNITARIO) AS TOTAL_ITEM'
      'FROM ITENS_PEDIDO I'
      'JOIN PRODUTO P ON P.ID_PRODUTO = I.ID_PRODUTO'
      'WHERE I.ID_PEDIDO = :ID_PEDIDO')
    Left = 48
    Top = 376
    ParamData = <
      item
        Name = 'ID_PEDIDO'
        DataType = ftAutoInc
        ParamType = ptInput
        Value = 4
      end>
  end
end
