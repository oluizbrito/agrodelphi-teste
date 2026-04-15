inherited FormCadastroProduto: TFormCadastroProduto
  Caption = 'Produtos'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited PageControlCadastro: TPageControl
    ActivePage = TabSheetDados
    inherited TabSheetBusca: TTabSheet
      inherited PanelSuperior: TPanel
        StyleElements = [seFont, seClient, seBorder]
        inherited EditBuscar: TEdit
          StyleElements = [seFont, seClient, seBorder]
        end
      end
      inherited PanelInferior: TPanel
        StyleElements = [seFont, seClient, seBorder]
      end
      inherited Panel3: TPanel
        StyleElements = [seFont, seClient, seBorder]
        inherited DBGridDados: TDBGrid
          Columns = <
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Visible = True
            end>
        end
      end
    end
    inherited TabSheetDados: TTabSheet
      object Label1: TLabel [0]
        Left = 11
        Top = 32
        Width = 63
        Height = 15
        Caption = 'DESCRICAO'
      end
      object Label2: TLabel [1]
        Left = 371
        Top = 32
        Width = 36
        Height = 15
        Caption = 'VALOR'
      end
      inherited PanelDadosInferior: TPanel
        StyleElements = [seFont, seClient, seBorder]
      end
      object DBEditDescricao: TDBEdit
        Left = 11
        Top = 53
        Width = 354
        Height = 23
        CharCase = ecUpperCase
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
      object DBEditValor: TDBEdit
        Left = 371
        Top = 53
        Width = 121
        Height = 23
        DataField = 'VALOR'
        DataSource = ds
        TabOrder = 2
      end
    end
  end
  inherited ds: TDataSource
    DataSet = DM.FDTableProduto
  end
end
