inherited FormCadastroCliente: TFormCadastroCliente
  Caption = 'Clientes'
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
              FieldName = 'NOME'
              Visible = True
            end>
        end
      end
    end
    inherited TabSheetDados: TTabSheet
      object Label2: TLabel [0]
        Left = 24
        Top = 32
        Width = 35
        Height = 15
        Caption = 'NOME'
      end
      object Label3: TLabel [1]
        Left = 24
        Top = 88
        Width = 21
        Height = 15
        Caption = 'CEP'
      end
      object Label4: TLabel [2]
        Left = 151
        Top = 88
        Width = 79
        Height = 15
        Caption = 'LOGRADOURO'
      end
      object Label5: TLabel [3]
        Left = 24
        Top = 136
        Width = 88
        Height = 15
        Caption = 'COMPLEMENTO'
      end
      object Label6: TLabel [4]
        Left = 24
        Top = 187
        Width = 41
        Height = 15
        Caption = 'BAIRRO'
      end
      object Label7: TLabel [5]
        Left = 199
        Top = 187
        Width = 41
        Height = 15
        Caption = 'CIDADE'
      end
      object Label8: TLabel [6]
        Left = 495
        Top = 187
        Width = 14
        Height = 15
        Caption = 'UF'
      end
      object Label9: TLabel [7]
        Left = 24
        Top = 240
        Width = 54
        Height = 15
        Caption = 'COD_IBGE'
      end
      inherited PanelDadosInferior: TPanel
        StyleElements = [seFont, seClient, seBorder]
      end
      object DBEditNome: TDBEdit
        Left = 24
        Top = 53
        Width = 625
        Height = 23
        CharCase = ecUpperCase
        DataField = 'NOME'
        DataSource = ds
        TabOrder = 1
      end
      object DBEditCEP: TDBEdit
        Left = 24
        Top = 109
        Width = 121
        Height = 23
        DataField = 'CEP'
        DataSource = ds
        TabOrder = 2
        OnExit = DBEditCEPExit
      end
      object DBEditLogradouro: TDBEdit
        Left = 151
        Top = 109
        Width = 498
        Height = 23
        CharCase = ecUpperCase
        DataField = 'LOGRADOURO'
        DataSource = ds
        Enabled = False
        TabOrder = 3
      end
      object DBEditComplemento: TDBEdit
        Left = 24
        Top = 157
        Width = 625
        Height = 23
        CharCase = ecUpperCase
        DataField = 'COMPLEMENTO'
        DataSource = ds
        TabOrder = 4
      end
      object DBEditBairro: TDBEdit
        Left = 24
        Top = 208
        Width = 169
        Height = 23
        CharCase = ecUpperCase
        DataField = 'BAIRRO'
        DataSource = ds
        Enabled = False
        TabOrder = 5
      end
      object DBEditCidade: TDBEdit
        Left = 199
        Top = 208
        Width = 290
        Height = 23
        CharCase = ecUpperCase
        DataField = 'CIDADE'
        DataSource = ds
        Enabled = False
        TabOrder = 6
      end
      object DBEditUF: TDBEdit
        Left = 495
        Top = 208
        Width = 154
        Height = 23
        CharCase = ecUpperCase
        DataField = 'UF'
        DataSource = ds
        Enabled = False
        TabOrder = 7
      end
      object DBEditCodIBGE: TDBEdit
        Left = 24
        Top = 261
        Width = 88
        Height = 23
        CharCase = ecUpperCase
        DataField = 'COD_IBGE'
        DataSource = ds
        Enabled = False
        TabOrder = 8
      end
    end
  end
  inherited ds: TDataSource
    DataSet = DM.FDTableCliente
    Left = 484
    Top = 299
  end
end
