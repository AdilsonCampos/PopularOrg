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

# Este código é uma automação WEB onde o programa acessa um site que gera CNPJs automaticamente
# Ele gera automaticamente quantos você quiser e os armazena em uma lista

navegador.get('https://www.4devs.com.br/gerador_de_cnpj')   # Site gerador de CNPJ

start_time = time.time()
time.sleep(3)
pontuacao = navegador.find_element(By.XPATH, '//*[@id="app-wrapper"]/div[2]/div[2]/div/div[3]/label/span').click()
cnpj_list = []
for i in range(10):  # Aqui você insere a quantidade de CNPJs que deseja gera
    time.sleep(0.5)
    navegador.find_element(By.XPATH, '//*[@id="bt_gerar_cnpj"]').click()
    time.sleep(1)
    cnpj = navegador.find_element(By.XPATH, '//*[@id="texto_cnpj"]').text
    cnpj_list.append(cnpj)
print(cnpj_list)
print("--- %s seconds ---" % (time.time() - start_time))

# Após a lista com CNPJs válidos estiver impressa, só copiá-la e colá-la no código Apex

