import pandas as pd

# Lê o arquivo CSV que está na mesma pasta
nomes = pd.read_csv("NationalNames.csv", sep=';')

# Busca os valores que estão na coluna Name do arquivo
fname_df = list(nomes['Name'])
fnames = set(fname_df)  # Muda para "set" para que não tenha valores repetidos
print(fnames[:1000]) # Aqui você decide a quantidade de nomes que você quer imprimir
# Após impressos, você os copia e cola no código Apex (Só apaga os colchetes e coloca as chaves que abrem e fecham a lista






