# Projeto Desktop Delphi A

Aplicacao desktop Delphi com cadastro de clientes, produtos e pedidos, usando Firebird.

## Como rodar
1. Tenha Delphi 12+ e Firebird 2.5+ instalados no Windows.
2. Abra `codigo_fonte/ProjectAgrotis.dpr` na IDE Delphi.
3. No arquivo `codigo_fonte/UnitDM.pas`, ajuste o caminho do banco (`FDConnection.Params.Database`) para `banco_de_dados/AGROTISDB.FDB`.
4. Compile e execute pela IDE.

## Opcional
- Para recriar o banco, use os scripts em `scripts_sql/`.
