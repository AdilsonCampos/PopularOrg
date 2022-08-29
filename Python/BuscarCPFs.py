from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import os
import time
from selenium.webdriver.support.select import Select
from selenium.webdriver import ActionChains
from selenium.webdriver.common.alert import Alert

servico = Service(ChromeDriverManager().install())
navegador = webdriver.Chrome(service = servico)

# Este código é uma automação WEB onde o programa acessa um site que gera CPFs automaticamente
# Ele gera automaticamente quantos você quiser e os armazena em uma lista

navegador.get('https://www.4devs.com.br/gerador_de_cpf')  # Site gerador de CPF


start_time = time.time()
time.sleep(3)
pontuacao = navegador.find_element(By.XPATH, '//*[@id="app-wrapper"]/div[2]/div[2]/div/div[3]/label/span').click()
cpf_list = []
for i in range(10): # Aqui você insere a quantidade de CPFs que deseja gerar
    time.sleep(0.5)
    navegador.find_element(By.XPATH, '//*[@id="bt_gerar_cpf"]').click()
    time.sleep(1)
    cpf = navegador.find_element(By.XPATH, '//*[@id="texto_cpf"]').text
    cpf_list.append(cpf)
print(cpf_list)
print("--- %s seconds ---" % (time.time() - start_time))

# Após a lista com CPFs válidos estiver impressa, só copiá-la e colá-la no código Apex






