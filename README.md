# Projeto ELT utilizando conceitos de extração, orquestração, armazenamento e transformação através de serviços containizados com tecnologias robustas e modernas

Este pequeno projeto foi baseado no curso ministrado pelo Giuliano Ferreira (Data Engineering usando a Modern Data Stack da Stack Academy - https://stack-academy.memberkit.com.br/)

Demonstração de uma pipeline ELT da tabela Health utilizando Airbyte para extração, Airflow como orquestrador, SnowFlake para armazenamento e DBT para transformação.

Link utilizado para extração:

https://health.google.com/covid-19/open-data/raw-data


![image](https://github.com/gsvimieiro/POC_crimesMG_Airbyte_Airflow_DBT_SnowFlake/assets/25323854/3b05fffb-de88-4e1e-b08a-fba771033c84)

DBT:

![image](https://github.com/gsvimieiro/POC_Airbyte_Airflow_DBT_SnowFlake/assets/25323854/7ad63cdc-db8e-4b11-adc4-e1e5b71f0c70)


Agora vamos inserir a transformação do DBT no Airbyte:
 - Basta inserir o link do GitHub do DBT na connection do Airbyte

![image](https://github.com/gsvimieiro/POC_Airbyte_Airflow_DBT_SnowFlake/assets/25323854/2aaa16dc-39f8-44d5-aa23-020cb799ec54)
