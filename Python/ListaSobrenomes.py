import pandas as pd

# Lê o arquivo CSV que está na mesma pasta
nomes = pd.read_csv("NationalNames.csv", sep=';')


# Busca os valores que estão na coluna Last Name do arquivo
lname = list(nomes['Last Name'])

# Como os sobrenomes vêm com números e espaços em branco, é feito uma tratativa dos dados para ficarem da melhor forma
name_list = []
for name in lname[:1000]:  # Aqui você decide a quantidade de sobrenomes que você quer imprimir
    name = name.strip()  # Remove os espaços em branco no início e final da String
    nm = name.split(' ') # Separa a string pelo espaço em branco e cria uma lista com os valores separados

    # Verifica se o tamanho da lista criada possui um tamanho maior igual a dois e pega a String da segunda posição [1]
    if len(nm) == 2:
        nome = nm[1].capitalize()  #Pega a string da posição [1] e coloca a primeira letra em maiúscula
        name_list.append(nome)   # Adiciona o nome na lista
#     elif len(nm) == 1:
#         nome = nm[1] #.capitalize()
#         name_list.append(nome)

print(set(name_list))
# Após impressa, realiza o mesmo procedimento com a lista de (primeiros) nomes
