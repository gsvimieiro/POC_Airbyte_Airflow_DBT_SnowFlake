# Projeto ELT utilizando conceitos de extração, orquestração, armazenamento e transformação através de serviços containizados com tecnologias robustas e modernas

Este pequeno projeto foi baseado no curso ministrado pelo Giuliano Ferreira (Data Engineering usando a Modern Data Stack da Stack Academy - https://stack-academy.memberkit.com.br/)

Demonstração de uma pipeline ELT da tabela Health utilizando Airbyte para extração, Airflow como orquestrador, SnowFlake para armazenamento e DBT para transformação.

Link utilizado para extração:

https://health.google.com/covid-19/open-data/raw-data


![image](https://github.com/gsvimieiro/POC_crimesMG_Airbyte_Airflow_DBT_SnowFlake/assets/25323854/3b05fffb-de88-4e1e-b08a-fba771033c84)

Observação importante : Neste exemplo, por ser mais didático eu não estou preocupado com segurança pois meu intuíto é mostrar o funcionamento de ponta a ponta da minha solução, então, questões como secret's, bucket privado, etc eu não adotei.

Tecnologias utilizadas :

- DrawIO: Desenho da arquitetura
- GitHub: Repositório do projeto
- GitPod: Desenvolvimento das DAGS, etc
- Docker: Imagens e containers
- Airbyte: Extrator dos arquivos para o projeto
- Airflow: Orquestração das Pipelines do Airbyte
- Snowflake: Banco de dados para armazenamento
- DBT: Ferramenta utilizada para transformação dos dados

Tarefas :

- Setar permissões do Gitpod para o GitHub - OK
- Subir Airbyte via Docker - OK
    - Dar fork no github do airbyte, criar uma branch (branch_airbyte)
    - git clone -b branch_airbyte https://github.com/gsvimieiro/airbyte.git

- Subir Airflow via Docker - OK
- No Snowflake :
   - criar conta OK
   - executar o script para criação de role/username/warehouse/database/schema OK
- No Airbyte :
    - Preparar a extração do CSV Health  OK
    - Configurar o target Snowflake OK
- No Airflow :
    - Criar a DAG de orquestração OK
    - Instalar a lib para conexão Airbyte OK
        - procurar o container airflow-airflow-webserver 
        - botao direito --> Attach Shell
        - pip install apache-airflow-providers-airbyte
        - restarta o container
- No Docker : 
    - Criar uma rede no docker ex.: poc-airbyte-airflow OK
        - docker network create poc-airbyte-airflow
    - Adicionar os containers nesta rede OK
        - docker network connect poc-airbyte-airflow airbyte-proxy
        - docker network connect poc-airbyte-airflow airbyte-worker
        - docker network connect poc-airbyte-airflow airflow-airflow-worker-1
        - docker network connect poc-airbyte-airflow airflow-airflow-webserver-1

- Pode-se instalar a lib para conexão do airbyte/airflow  OK

    - docker-compose run airflow-webserver airflow connections add 'airbyte_connection' --conn-uri 'airbyte://airbyte-proxy:8000'

- No DBT:
  - 

![image](https://github.com/gsvimieiro/POC_Airbyte_Airflow_DBT_SnowFlake/assets/25323854/7ad63cdc-db8e-4b11-adc4-e1e5b71f0c70)


Agora vamos inserir a transformação do DBT no Airbyte:
 - Basta inserir o link do GitHub do DBT na connection do Airbyte

![image](https://github.com/gsvimieiro/POC_Airbyte_Airflow_DBT_SnowFlake/assets/25323854/2aaa16dc-39f8-44d5-aa23-020cb799ec54)
