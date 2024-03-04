from airflow import DAG
from airflow.utils.dates import days_ago
from airflow.providers.airbyte.operators.airbyte import AirbyteTriggerSyncOperator
import json

with DAG(dag_id='poc_airbyte_airflow',
         default_args={'owner': 'airflow'},
         schedule_interval='@daily',
         start_date=days_ago(1)
         ) as dag:

    airbyte_health_sf_sync = AirbyteTriggerSyncOperator(
        task_id='airbyte_health_sf',
        airbyte_conn_id='airbyte_connection',
        connection_id='0128f988-7afgd-7h6g-h768-90ji78fafe',
        timeout=3600
    )
	
    airbyte_health_sf_sync
