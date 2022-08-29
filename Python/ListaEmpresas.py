import pandas as pd

# Lê o arquivo CSV que está na mesma pasta
tabela = pd.read_csv("registered_companies.csv", sep=',', low_memory=False)


# Busca os valores que estão na coluna COMPANY_NAME do arquivo
companies = list(tabela['COMPANY_NAME'])

listCompanies = companies[:100] # Aqui você decide a quantidade de nomes de empresas que você quer imprimir
print(listCompanies)
# Após impressa, realiza o mesmo procedimento com a lista de (primeiros) nomes